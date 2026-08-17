Unit gs6_disk;
{------------------------------------------------------------------------------
                               Disk File Handler

       gs6_disk Copyright (c) 1996 Griffin Solutions, Inc.

       Date
          4 Apr 1998

       Programmer:
          Richard F. Griffin                     tel: (912) 953-2680
          Griffin Solutions, Inc.             e-mail: halcyon@grifsolu.com
          102 Molded Stone Pl
          Warner Robins, GA  31088

       -------------------------------------------------------------
       This unit handles the objects for all untyped disk file I/O.

------------------------------------------------------------------------------}
{$I gs6_flag.pas}
interface
uses
   Windows,
   SysUtils,
   gs6_thrd,
   gs6_glbl,
   gs6_eror,
   gs6_tool,
   gs6_date;

const
   GSwrdAccessMiliSeconds : word = 5000;
   GSwrdAccessMSecDelay: word = 50;

{private}
type

   GSO_DiskFile = Class(TObject)
   private
      dfCritSect : TgsCriticalSection;
      dfFileHndl : integer;
      dfFileErr  : integer;       {I/O error code}
      dfFileExst : boolean;    {True if file exists}
      dfFileName : PChar;
      dfFilePosn : longint;
      dfFileShrd : boolean;
      dfReadWrite: boolean;
      dfGoodRec  : longint;
      dfLockRec  : Integer;
      dfLockPos  : gsuint32;
      dfLockLth  : gsuint32;
      dfHasWritten: boolean;
      dfClosed   : boolean;
      Function     InternalCloseFile: boolean;
   protected
      Function     gsCloseFile: boolean; virtual;
   public
      Constructor  Create(const Fname: String; ReadWrite, Shared: boolean);
      Destructor   Destroy; override;
      function     FileFullyLocked: boolean;
      Procedure    FoundError(Code, Info: integer; StP: PChar); virtual;
      Function     gsFileSize : longint; virtual;
      Procedure    gsFlush; virtual;
      Function     gsLockFile: Boolean; virtual;
      Function     gsLockRecord(FilePosition,FileLength: gsuint32): Boolean; virtual;
      Function     gsRead(blk: gsuint32; var dat; len: gsuint32): integer; virtual;
      Function     gsRename(const NewName: string): boolean; virtual;
      Procedure    gsReset; virtual;
      Procedure    gsReWrite; virtual;
      Procedure    gsStatusUpdate(stat1,stat2,stat3 : longint); virtual;
      Procedure    gsStatusLink(stat1,stat2,stat3 : longint);
      Procedure    gsTestForOk(Code, Info : integer);
      Procedure    gsTruncate(loc: gsuint32); virtual;
      Function     gsUnLock: boolean; virtual;
      Procedure    gsWrite(blk: gsuint32; var dat; len: gsuint32); virtual;
      Property     FileHandle: integer read dfFileHndl;
      Property     FileError: integer read dfFileErr write dfFileErr;
      Property     FileFound: boolean read dfFileExst;
      Property     FileShared: boolean read dfFileShrd;
      Property     FileReadWrite: boolean read dfReadWrite;
      Property     FileName: PChar read dfFileName;
      Property     FileExist: boolean read dfFileExst;
      Property     LockCount: integer read dfLockRec;
   end;

{------------------------------------------------------------------------------
                            IMPLEMENTATION SECTION
------------------------------------------------------------------------------}

implementation

type
   GSobjFileColl = class(TgsCollection)
      CollCritSect: TgsCriticalSection;
      constructor Create;
      Destructor Destroy; override;
      procedure DeleteItem(Item: pointer);
      procedure FreeItem(Item: Pointer); override;
      function IndexOfItem(Item: Pointer): Integer;
      procedure InsertItem(Item: Pointer);
   end;

var
   FileList       : GSobjFileColl;

{$IFDEF HALCDEMO}
var
   exefh: integer;
   exedt: TDateTime;
   exefd: integer;
   exect: integer;

procedure DemoCheck;
begin
   if exect > 0 then exit;
   inc(exect);
   exefh := FileOpen(ParamStr(0),fmOpenRead+fmShareDenyNone);
   if exefh > 0 then
   begin
      exefd := FileGetDate(exefh);
      FileClose(exefh);
      exedt := FileDateToDateTime(exefd);
      if Date - exedt > 2 then
      begin
         {$IFDEF CONSOLE}
            raise EInOutError.Create('Unregistered Version of Halcyon 6.'+#13#10+
                                  'Contact Griffin Solutions at www.grifsolu.com');
         {$ELSE}
            MessageBox(0,'Unregistered Version of Halcyon 6.'+#13#10+
                                  'Contact Griffin Solutions at www.grifsolu.com',
                                  'Unregistered', MB_OK);
         {$ENDIF}
      end;
   end;
end;
{$ENDIF}

{------------------------------------------------------------------------------
                              Global Routines
------------------------------------------------------------------------------}

Function GSGetExpandedFile(const FileName: String): String;
begin
   if (Pos('\\',Filename) <> 0) or (pos(':',FileName) > 2) then
     Result := FileName
   else
     Result := ExpandFileName(FileName);
end;

Function GS_FileActiveHere(FilName: PChar): GSO_DiskFile;
var
   i    : integer;
   optr : GSO_DiskFile;
   ok: boolean;
begin
   GS_FileActiveHere := nil;
   ok := false;
   if (FileList <> nil) and (FileList.Count > 0) then
   begin
      try
         FileList.CollCritSect.Enter;
         i := 0;
         while (not ok) and (i < FileList.Count) do
         begin
            optr :=  FileList.Items[i];
            with optr do
               if ComparePChar(FilName,dfFileName) = 0 then
               begin
                  ok := true;
                  GS_FileActiveHere := optr;
               end;
            inc(i);
         end;
      finally
         FileList.CollCritSect.Leave;
      end;
   end;
   if not ok then
      GS_FileActiveHere := nil;
end;


Procedure GS_ClearLocks;
var
   i    : integer;
   optr : GSO_DiskFile;
begin
   if (FileList <> nil) and (FileList.Count > 0) then
   begin
      try
         FileList.CollCritSect.Enter;
         for i := 0 to FileList.Count-1 do
         begin
            optr :=  FileList.Items[i];
            with optr do
               if dfLockRec > 0 then
               begin
                  dfLockRec := 1;
                  UnLockFile(dfFileHndl,dfLockPos,0,dfLockLth,0);
               end;
         end;
      finally
         FileList.CollCritSect.Leave;
      end;
   end;
end;


{------------------------------------------------------------------------------
                              GSO_DiskFile
------------------------------------------------------------------------------}

Constructor GSO_DiskFile.Create(const Fname: String; ReadWrite, Shared: boolean);
var
   FNup : array[0..259] of char;
   Attr : integer;
begin
   {$IFDEF HALCDEMO}
   DemoCheck;
   {$ENDIF}
   inherited Create;
   StrPCopy(FNup,GSGetExpandedFile(Fname));
   StrUpperCase(FNup, StrLen(FNup));
   dfFileShrd := Shared;
   dfReadWrite := ReadWrite;
   dfFileName := StrNew(FNup);
   Attr := FileGetAttr(StrPas(FNup));
   dfFileExst := Attr >= 0;
   dfFilePosn := 0;
   dfFileHndl := 0;
   dfLockRec := 0;
   dfHasWritten := false;
   dfClosed := true;
end;

destructor GSO_DiskFile.Destroy;
begin
   gsCloseFile;
   StrDispose(dfFileName);
   inherited Destroy;
end;

function GSO_DiskFile.FileFullyLocked: boolean;
begin
   Result := not dfFileShrd;
   if not Result then
      if (dfLockRec > 0) and (dfLockPos = 0) and (dfLockLth = MaxRecNum) then
         Result := true;
end;
Procedure GSO_DiskFile.FoundError(Code, Info:integer; StP: PChar);
begin
   FoundPgmError(Code,Info,StP);
end;

Function GSO_DiskFile.InternalCloseFile: boolean;
var
   FCS: boolean;
begin
   if not dfClosed then
   begin
      try
         FCS := false;
         dfCritSect.Enter;
         if dfLockRec > 0 then
         begin
            dfLockRec := 1;       {set lock count to 1 to force unlock}
            gsUnLock;
         end;
         dfFileErr := 0;
         if (FileList <> nil) and (FileList.IndexOfItem(Self) <> -1) then
            FileList.DeleteItem(Self);
         if GS_FileActiveHere(dfFileName) <> nil then
         begin
            if dfHasWritten then gsFlush;
         end
         else
         begin
            FileClose(dfFileHndl);
            dfClosed := true;
            dfFilePosn := 0;
            dfFileHndl := 0;
            FCS := true;
         end;
      finally
         dfCritSect.Leave;
      end;
      if FCS then dfCritSect.Free;
   end;
   Result := true;
end;

Function GSO_DiskFile.gsCloseFile: boolean;
begin
   Result := InternalCloseFile;
end;

Function GSO_DiskFile.gsFileSize : longint;
var
   fs: longint;
begin
   try
      dfCritSect.Enter;
      fs := FileSeek(dfFileHndl,0,2);
      if fs = -1 then
         dfFileErr := GetLastError
      else
         dfFileErr := 0;
   finally
      dfCritSect.Leave;
   end;
   gsTestForOK(dfFileErr,dskFileSizeError);
   gsFileSize := fs;
end;

Procedure GSO_DiskFile.gsFlush;
begin
   if dfClosed then exit;
   try
      dfCritSect.Enter;
      if FlushFileBuffers(dfFileHndl) then
         dfFileErr := 0
      else
         dfFileErr := GetLastError;
   finally
     dfCritSect.Leave;
   end;
   dfHasWritten := false;
   gsTestForOk(dfFileErr,dskFlushError);
end;

Function GSO_DiskFile.gsLockFile : Boolean;
begin
   if dfFileShrd then
      gsLockFile :=  gsLockRecord(0,MaxRecNum)
   else
      gsLockFile := true;
end;

Function GSO_DiskFile.gsLockRecord(FilePosition,FileLength: gsuint32): boolean;
begin
   if (not dfFileShrd) then
   begin                        {do dummy File Lock if not shared}
      dfFileErr := 0;
      inc(dfLockRec);
      dfLockPos := FilePosition;
      dfLockLth := FileLength;
   end
   else
   begin
      if dfLockRec > 0 then    {if already locked see if same region}
      begin
         if (FilePosition = dfLockPos) and (FileLength = dfLockLth) then
         begin
            dfFileErr := 0;
            inc(dfLockRec);
         end
         else
            dfFileErr := dosLockViolated;
      end
      else
      begin
         dfLockPos := FilePosition;
         dfLockLth := FileLength;
         if LockFile(dfFileHndl,dfLockPos,0,dfLockLth,0) then
         begin
            dfFileErr := 0;
            inc(dfLockRec);
         end
         else
            dfFileErr := GetLastError;
      end;
   end;
   gsLockRecord := dfFileErr = 0;
end;

Function GSO_DiskFile.gsRead(blk: gsuint32; var dat; len: gsuint32): integer;
var
   fs: longint;
   Count: integer;
begin
   Count := len;
   try
      dfCritSect.Enter;
      fs := FileSeek(dfFileHndl, blk, 0);
      IF fs <> -1 THEN               {If seek ok, read the record}
      BEGIN
         dfFileErr := 0;
         dfGoodRec := FileRead(dfFileHndl, dat, Count);
         if dfGoodRec = -1 then
            dfFileErr := GetLastError;
         if dfFileErr = 0 then dfFilePosn := (blk+len);
      end
      else
         dfFileErr := GetLastError;
   finally
      dfCritSect.Leave;
   end;
   gsTestForOk(dfFileErr,dskReadError);
   if dfGoodRec < Count then
   begin
      dfFileErr := gsShortDiskRead;
   end;
   gsRead := dfGoodRec;
end;

Function GSO_DiskFile.gsRename(const NewName: string): boolean;
var
   filenew: string;
   realerr: integer;
   fnup: array[0..260] of char;
begin
   dfFileErr := 0;
   realerr := 0;
   Result := InternalCloseFile;
   if Result then
   begin
      filenew := GSGetExpandedFile(NewName);
      Result := RenameFile(StrPas(dfFileName),filenew);
      if not Result then
         realerr := GetLastError
      else
      begin
         StrPCopy(FNup,filenew);
         StrUpperCase(FNup, StrLen(FNup));
         StrDispose(dfFileName);
         dfFileName := StrNew(FNup);
      end;
      gsReset;
   end
   else realerr := dosFileNotAssgd;
   if realerr <> 0 then dfFileErr := realerr;
   gsTestForOK(dfFileErr,dskRenameError);
end;


Procedure GSO_DiskFile.gsReset;
var
   WrkMode : byte;
   FilePtr : GSO_DiskFile;
begin
   dfFileErr := 0;
   FilePtr :=  GS_FileActiveHere(dfFileName);
   if FilePtr = nil then
   begin
      WrkMode := 0;
      if dfReadWrite then WrkMode := WrkMode + fmOpenReadWrite;
      if dfFileShrd then WrkMode := WrkMode + fmShareDenyNone;
      dfFileHndl := FileOpen(StrPas(dfFileName),WrkMode);
      if dfFileHndl = -1 then
         dfFileErr := GetLastError
      else
         dfCritSect := TgsCriticalSection.Create;
   end
   else
   begin
      if dfFileShrd and FilePtr.dfFileShrd then
      begin
         dfFileHndl := FilePtr.dfFileHndl;
         dfCritSect := FilePtr.dfCritSect;
      end
      else
         dfFileErr := dosAccessDenied;
   end;
   if dfFileErr = 0 then
   begin
      dfFilePosn := 0;
      if FileList = nil then
         FileList := GSobjFileColl.Create
      else
         if FileList.IndexOfItem(Self) = -1 then FileList.InsertItem(Self);
      dfClosed := false;
   end;
   gsTestForOK(dfFileErr,dskResetError);
end;

Procedure GSO_DiskFile.gsReWrite;
begin
   if GS_FileActiveHere(dfFileName) <> nil then
      dfFileErr := dosInvalidAccess
   else
   begin
      dfFileHndl := FileCreate(StrPas(dfFileName));
      if dfFileHndl <> -1 then
      begin
         FileClose(dfFileHndl);
         gsReset;
         dfFileErr := 0;
      end
      else
         dfFileErr := GetLastError;
   end;
   gsTestForOk(dfFileErr,dskRewriteError);
end;

Procedure GSO_DiskFile.gsStatusUpdate(stat1,stat2,stat3 : longint);
begin
end;

Procedure GSO_DiskFile.gsStatusLink(stat1,stat2,stat3 : longint);
begin
   gsStatusUpdate(stat1,stat2,stat3);
end;

Procedure GSO_DiskFile.gsTestForOk(Code, Info : integer);
begin
   if Code <> 0 then
   begin
      SetLastError(Code);
      FoundError(Code,Info,dfFileName);
   end;
end;

Procedure GSO_DiskFile.gsTruncate(loc: gsuint32);
var
   cloc: longint;
begin
   dfFileErr := 0;
   try
      dfCritSect.Enter;
      if (not dfReadWrite) or (not FileFullyLocked) then
         dfFileErr := dosAccessDenied
      else
      begin
         cloc := FileSeek(dfFileHndl, loc, 0);
         if cloc <> -1 then
            if SetEndOfFile(dfFileHndl) then
               dfFileErr := 0
            else
               dfFileErr := GetLastError;
      end;
   finally
      dfCritSect.Leave;
   end;
   gsTestForOk(dfFileErr,dskTruncateError);
end;

Function GSO_DiskFile.gsUnLock: boolean;
begin
   dfFileErr := 0;
   if dfLockRec > 0 then
   begin
      if dfFileShrd and (dfLockRec = 1) then
         if not UnLockFile(dfFileHndl,dfLockPos,0,dfLockLth,0) then
            dfFileErr := GetLastError;
      if dfFileErr = 0 then dec(dfLockRec);
   end;
   gsUnLock := dfFileErr = 0;
end;

Procedure GSO_DiskFile.gsWrite(blk: gsuint32; var dat; len: gsuint32);
var
   fs: longint;
begin
   try
      dfCritSect.Enter;
      fs := FileSeek(dfFileHndl, blk, 0);
      IF fs <> -1 then               {If seek ok, read the record}
      begin
         dfFileErr := 0;
         dfGoodRec := FileWrite(dfFileHndl, dat, len);
         if dfGoodRec = -1 then
            dfFileErr := GetLastError;
         if dfFileErr = 0 then dfFilePosn := (blk+len);
      end
      else
         dfFileErr := GetLastError;
   finally
      dfCritSect.Leave;
   end;
   if dfFileErr = 0 then
   begin
      dfHasWritten := true;
   end;
   gsTestForOk(dfFileErr,dskWriteError);
end;

{------------------------------------------------------------------------------
                               GSobjFileColl
------------------------------------------------------------------------------}

constructor GSobjFileColl.Create;
begin
   inherited Create;
   CollCritSect := TgsCriticalSection.Create;
end;

destructor GSobjFileColl.Destroy;
begin
   CollCritSect.Free;
   inherited Destroy;
end;

procedure GSobjFileColl.DeleteItem(Item: pointer);
begin
   try
      CollCritSect.Enter;
      inherited Delete(IndexOf(Item));
   finally
      CollCritSect.Leave;
   end;
end;

procedure GSobjFileColl.FreeItem(Item: Pointer);
begin
end;

function GSobjFileColl.IndexOfItem(Item: Pointer): Integer;
begin
   try
      CollCritSect.Enter;
      Result := IndexOf(Item);
   finally
      CollCritSect.Leave;
   end;
end;

procedure GSobjFileColl.InsertItem(Item: pointer);
begin
   try
      CollCritSect.Enter;
      Add(Item);
   finally
      CollCritSect.Leave;
   end;
end;


{------------------------------------------------------------------------------
                           Setup and Exit Routines
------------------------------------------------------------------------------}

initialization
   FileList := GSobjFileColl.Create;
   {$IFDEF HALCNDEMO}
   exect := 0;
   {$ENDIF}
finalization
begin
   GS_ClearLocks;
   if FileList <> nil then
      FileList.Free;
end;

end.
