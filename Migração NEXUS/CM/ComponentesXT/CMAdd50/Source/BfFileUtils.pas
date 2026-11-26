{*******************************************************************************
   Unit
      uFileUtils.pas
   Description:
      Some useful file utils and TsFilesList class
   Versions:
      1.0b
   Autor(s):
      Dimitry Statilko - dstatus@iname.com, dima@mobitel.com.
   Comments:
   History:
      1.0b  -  20/11/1998
               functions Alternate2LFN and LFN2Alternate are revritten.
               functions Alternate2LDN and LDN2Alternate do not exist any more.
      1.0a  -  3/11/1998
               new function GetShellFolder to get the location for the system folders
		1.0*  - 	End of Sep. 1998
      			Initial release
*     I did not track the versions before, so let's consider it as 1.0
*******************************************************************************}
unit BfFileUtils;

interface

uses BftdUtils, Windows, ShellApi, dialogs;

{ from rx's FileUtil}
function DirExists(Name: string): Boolean;
function ValidFileName(const FileName: string): Boolean;
function NormalDir(const DirName: string): string;
procedure SplitCommandLine(const CmdLine: string; var ExeName, Params: string);

{ s FileUtils}
const
   __separator: String = '\';
   __backDir: String = '..';

function IsFullPath(path: String): Boolean;
function CompressPath(const Path: String; MaxLength: Integer): String;
function ConjuctDirs( path1, path2: String): String;
function MakeRelativePath( path1, path2: String): String;
function TerminateDir( path: String): String;
function UnTerminateDir( path: String): String;
procedure SaveWorkedFile( const sFileName, dDirectory: String);
function GetTempDir: String;
function GetFileSize(const fileName: String): Integer;
function FileTime2DateTime( dt: TFileTime): TDateTime;
function DateTimeToSystemStr(d: TDateTime): String;

function Alternate2LFN(alternateName: String; FullPath: Boolean): String;
function LFN2Alternate(LongName: String): String;

{ file list support}
type
   TsFileInfo = class
   private
      FFileSize: Integer;
      FType: array [0..79] of AnsiChar;
      FCreateTime: TDateTime;
      FAccessTime: TDateTime;
      FModifyTime: TDateTime;
      FAttrib: Integer;
      FDosName: String;

      function GetFileType: String;
      function GetFileSize: String;
      function GetAccessTimeStr: String;
      function GetCreateTimeStr: String;
      function GetModifyTimeStr: String;
      function GetAttribStr: String;
      function GetDosExt: String;
   public
      constructor Create( aPath: string; FindData: TWin32FindData);
      property Size: Integer read FFileSize;
      property SizeStr: String read GetFileSize;
      property FileType: String read GetFileType;
      property CreationTime: TDateTime read FCreateTime;
      property CreationTimeStr: String read GetCreateTimeStr;
      property AccessTime: TDateTime read FAccessTime;
      property AccessTimeStr: String read GetAccessTimeStr;
      property ModifiedTime: TDateTime read FModifyTime;
      property ModifiedTimeStr: String read GetModifyTimeStr;
      property Attrib: Integer read FAttrib;
      property AttribStr: String read GetAttribStr;
      property DosName: String read FDosName;
      property DosExt: String read GetDosExt;
   end;

   TFileType =( ftArchive, ftReadonly, ftSystem, ftHidden, ftDirectory);
   TFileTypes = Set of TFileType;

   TsFilesList = class(TsStringList)
   private
      FDirectory: String;
      FMask: String;
      FFullInfo: Boolean;
      FFileTypes: TFileTypes;
      function GetFileInfo(index: Integer): TsFileInfo;
      procedure SetDirectory( Value: String);
      procedure SetMask( Value: String);
      procedure SetFileTypes(Value: TFileTypes);
      procedure SetFullInfo( Value: Boolean);
      procedure Refresh;
   public
      constructor Create;
      constructor Make( aDirectory, aMask: String; aType: TFileTypes; aFullInfo: Boolean);
      procedure ReadDirectory( aDirectory, aMask: String; aType: TFileTypes; aFullInfo: Boolean);

      property FileInfo[index: Integer]: TsFileInfo read GetFileInfo;
      property Directory: String read FDirectory write SetDirectory;
      property Mask: String read FMask write SetMask;
      property FileTypes: TFileTypes read FFileTypes write SetFileTypes;
      property FullInfo: Boolean read FFullInfo write SetFullInfo;
   end;

function ValidateFile(path, ext: String; var Options: TOpenOptions; Open: Boolean): Boolean;

type
   TShellFolders = (sfAppData, sfCache, sfCookies, sfDesctop, sfFavorites, sfFonts,
      sfHistory, sfNetHood, sfPersonal, sfPrintHood, sfPrograms, sfRecent, sfSendTo,
      sfStartMenu, sfStartup, sfTemplates);

function GetShellFolderName(folder: TShellFolders): String;
function GetShellFolder(folder: TShellFolders): String;
procedure LoadSystemStrings;


var
   MsgFileExists: String; // 257
   MsgNonExistingDrive: String; //387
   MsgInvalidDrive: String; //388
   MsgFileNotExists: String; // 391
   MsgPathNotExists: String; // 392
   MsgFilenameInvalid: String; //393
   MsgFileReadOnly: String; // 396
   MsgCreateFile: String;//402
   StringsInitialized: Boolean;


implementation

uses Classes, SysUtils, Controls, BfConsts;

{Compresses a string by replacing one or more components with the replacement string}
function BuildPath(const Components: TStringList): String;
var
   i: Integer;
begin
   for i := 0 to Components.Count-1 do
      if i = 0 then
         Result := Components[i]
      else
         Result := Result + __Separator + Components[i];
end;

function CompressPath(const Path: String; MaxLength: Integer): String;
var
   Tokens: TStringList;
begin
   Tokens := TStringList.Create;
	try
		{Check if full path is less than MaxLength}
		Result := Path;
		if StrLen(PChar(Result))<= MaxLength then
         Exit;
		{Check if can replace the 2nd token with the replacement and make length less than MaxLength}
		if BreakApart(Result, __Separator,Tokens) < 3 then
         Exit
		else begin
         Tokens[1] := __backDir;
         Result:=BuildPath(Tokens);
      end;
		{Must continue to delete components until can get the length below the maximum}
      while (StrLen(PChar(Result))>MaxLength) and (Tokens.Count>3) do begin
         Tokens.Delete(2);
         Result := BuildPath(Tokens);
      end;
	finally
		Tokens.Free;
	end;
end;

function RemoveBrackets(S: String): String;
begin
   if (S <> '') and (S[1] = '"') then
      Result := Copy(S, 2, Length(S) - 2)
   else
      Result := S;
end;

function TerminateDir( path: String): String;
begin
   Result := RemoveBrackets(path);
   if (Result <> '') and (Result[Length(Result)] <> __separator) then
      Result := Result + __separator;
end;

function UnTerminateDir( path: String): String;
begin
   Result := RemoveBrackets(path);
   if (Result <> '') and (Result[Length(Result)] = __separator) then
      SetLength(Result, Length(Result)-1);
end;

function IsFullPath(path: String): Boolean;
begin
   path := RemoveBrackets(path);
   Result := (Pos('\\', path) = 1) or (Pos(':\', path) = 2);
end;

function ConjuctDirs( path1, path2: String): String;
var
   Tokens1: TStringList;
   Tokens2: TStringList;
begin
   path1 := RemoveBrackets(Path1);
   path2 := RemoveBrackets(Path2);

   Result := path2;
   if IsFullPath(path2) then
      Exit;
   if path2[1] = __separator then
      path2 := Copy(path2, 2, Length(path2) - 1); // to eliminate '\..\' case

   path1 := TerminateDir(path1);

   Result := path1 + path2;
   if Pos( __backDir + __separator, Result) = 0 then
      Exit;

   Tokens1 := TStringList.Create;
   Tokens2 := TStringList.Create;
   try
      BreakApart( path1, __Separator, Tokens1);
      BreakApart( path2, __Separator, Tokens2);
      Tokens1.Delete( Tokens1.Count - 1);
      while (Tokens2.Count > 0) and (Tokens2[0] = __backDir) do begin
         Tokens1.Delete( Tokens1.Count - 1);
         Tokens2.Delete(0);
      end;
      Result := BuildPath( Tokens1) + __separator + BuildPath( Tokens2);

   finally
      Tokens1.Free;
      Tokens2.Free;
   end;
end;

function MakeRelativePath( path1, path2: String): String;
var
   Tokens1: TStringList;
   Tokens2: TStringList;
   ii: Integer;
begin
   path1 := RemoveBrackets(Path1);
   path2 := RemoveBrackets(Path2);

   Result := path2;
   if ( path1 = '') or (Path2 = '') then
      Exit;
   if (Pos(':\', path1) = 2) and (Pos(':\', path2) = 2) and (path1[1] <> path2[1]) then
      Exit; // different drives
   if (Pos('\\', path1) = 1) and (Pos('\\', path2) = 1) then begin
      ii := 3;
      while (path1[ii] <> __separator) and (ii <= Length(path1)) and (ii <= Length(path2))do
         if path1[ii] <> path2[ii] then
            Exit // different roots
         else
            Inc(ii);
   end;
   if ((Pos(':\', path1) = 2) and (Pos('\\', path2) = 1)) or
      ((Pos(':\', path2) = 2) and (Pos('\\', path1) = 1)) then
      Exit;


   path1 := TerminateDir(path1);

   Tokens1 := TStringList.Create;
   Tokens2 := TStringList.Create;

   try
      BreakApart( path1, __Separator, Tokens1);
      BreakApart( path2, __Separator, Tokens2);
      Tokens1.Delete(Tokens1.Count - 1);

      while (Tokens1.Count > 0) and (Tokens2.Count > 0) do begin
         if Tokens1[0] = Tokens2[0] then begin
            Tokens1.Delete( 0);
            Tokens2.Delete( 0);
         end else
            Break;
      end;

      while Tokens1.Count > 0 do begin
         Tokens2.Insert( 0, __backDir);
         Tokens1.Delete(0);
      end;

      Result := BuildPath( Tokens2);
   finally
      Tokens1.Free;
      Tokens2.Free;
   end;
end;


function DirExists(Name: string): Boolean;
var
  Code: Integer;
begin
  Code := GetFileAttributes(PChar(Name));
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
end;

procedure SaveWorkedFile( const sFileName, dDirectory: String);
begin
   if not DirExists(dDirectory) then
      CreateDir(dDirectory);
   Windows.CopyFile( PChar(sFileName), PChar(dDirectory + ExtractFileName(sFileName)), FALSE);
end;

function GetTempDir: String;
var
   buff: array[0..124] of Char;
begin
   GetTempPath( 124, @Buff);
   Result := TerminateDir(StrPas(Buff));
end;

function GetFileSize(const fileName: String): Integer;
var
   hFile: Integer;
begin
   Result := -1;
   hFile := FileOpen(FileName, fmOpenRead);
   if hFile > -1 then try
      Result := Windows.GetFileSize(hFile, nil);
      if Result = $FFFFFFFF then
         Result := -1;
   finally
      FileClose(hFile);
   end;
end;

function ValidFileName(const FileName: string): Boolean;
   function HasAny(const Str, Substr: string): Boolean;
   var
      I: Integer;
   begin
      Result := False;
      for I := 1 to Length(Substr) do begin
         if Pos(Substr[I], Str) > 0 then begin
            Result := True;
            Break;
         end;
      end;
   end;
begin
   Result := (FileName <> '') and (not HasAny(FileName, ';,=+<>"[]|'));
   if Result then
      Result := Pos('\', ExtractFileName(FileName)) = 0;
end;

function NormalDir(const DirName: string): string;
begin
   Result := DirName;
   if (Result <> '') and not (Result[Length(Result)] in [':', '\']) then begin
      if (Length(Result) = 1) and (UpCase(Result[1]) in ['A'..'Z']) then
         Result := Result + ':\'
      else
         Result := Result + '\';
  end;
end;

function FileTime2DateTime( dt: TFileTime): TDateTime;
var
   fdt: TFileTime;
   sdt :TSystemTime;
begin
   try
      FiletimeToLocalFiletime( dt, fdt);
      FileTimeToSystemTime( fdt, sdt);
      Result := SystemTimeToDateTime( sdt);
   except
      Result := 0;
   end;
end;

function Alternate2LFN(alternateName: String; FullPath: Boolean): String;
var
   buffer: array[0..MAX_PATH] of char;
   ptr: PChar;
begin
   GetFullPathName( PChar(alternateName), MAX_PATH, buffer, ptr);
   if FullPath then
      Result := String(buffer)
   else
      Result := String(ptr);
end;

function LFN2Alternate(LongName: String): String;
var
   buffer: array[0..MAX_PATH] of char;
begin
   GetShortPathName(PChar(LongName), buffer, MAX_PATH);
   Result := String(buffer);
end;


{ List support}
constructor TsFileInfo.Create( aPath: string; FindData: TWin32FindData);
var
   ShFileInfo: TShFileInfo;
begin
   with FindData do begin
      // Get Extended Info
      ShGetFileInfo( PChar(aPath + cFileName), 0, ShFileInfo, SizeOf( ShFileInfo),
         shgfi_DisplayName or shgfi_TypeName);
      // TYPE - from GetShellInfo extended info
      Move( ShFileInfo.szTypeName, FType, Sizeof(FType));
      // SIZE
      if (dwFileAttributes and file_attribute_Directory) = file_attribute_Directory then
         FFileSize := -1
      else
         FFileSize := (nFileSizeHigh * MAXDWORD) + nFileSizeLow;
      // MODIFIED
      FModifyTime := FileTime2DateTime( ftLastWriteTime);
      // CREATION
      FCreateTime := FileTime2DateTime( ftCreationTime);
      // LAST ACCESS
      FAccessTime := FileTime2DateTime( ftLastAccessTime);
      // ATTRIBUTES
      FAttrib := dwFileAttributes;
      // DOS NAME
      if cAlternateFileName = '' then
         FDosName := cFileName
      else
         FDosName := cAlternateFileName;
   end;
end;

function TsFileInfo.GetFileType: String;
begin
   Result := FType;
end;

function TsFileInfo.GetFileSize: String;
begin
   if FFileSize = -1 then
      Result := ''
   else
      Result := Format( '%10d', [FFileSize]);
end;

function DateTimeToSystemStr(d: TDateTime): String;
var
   ds, ts: ShortString;
   sdt: TSystemTime;
begin
   DateTimeToSystemTime(d, sdt);
   SetLength(ds, GetDateFormat(LOCALE_USER_DEFAULT, 0, @sdt, NIL, @ds[1], 255) - 1);
   SetLength(ts, GetTimeFormat(LOCALE_USER_DEFAULT, time_noseconds, @sdt, NIL, @ts[1], 255) - 1);
   Result := ds + '  ' + ts;
end;

function TsFileInfo.GetAccessTimeStr: String;
begin
   Result := DateTimeToSystemStr(FCreateTime);
end;

function TsFileInfo.GetCreateTimeStr: String;
begin
   Result := DateTimeToSystemStr(FAccessTime);
end;

function TsFileInfo.GetModifyTimeStr: String;
begin
   Result := DateTimeToSystemStr(FModifyTime);
end;

function TsFileInfo.GetAttribStr: String;
begin
   Result := '';
   if (FAttrib and file_attribute_Directory) > 0 then
      Result := Result + 'D';
   if (FAttrib and file_attribute_Archive)   > 0 then
      Result := Result + 'A';
   if (FAttrib and file_attribute_Readonly)  > 0 then
      Result := Result + 'R';
   if (FAttrib and file_attribute_System)    > 0 then
      Result := Result + 'S';
   if (FAttrib and file_attribute_Hidden)    > 0 then
      Result := Result + 'H';
   if (FAttrib and file_attribute_Temporary)  > 0 then
      Result := Result + 'T';
end;

function TsFileInfo.GetDosExt: String;
begin
   Result := ExtractFileExt( FDosName);
end;

constructor TsFilesList.Create;
begin
   inherited;
   FFileTypes := [ftReadOnly, ftArchive];
end;

constructor TsFilesList.Make( aDirectory, aMask: String; aType: TFileTypes; aFullInfo: Boolean);
begin
   Create;
   ReadDirectory( aDirectory, aMask, aType, aFullInfo);
end;

procedure TsFilesList.ReadDirectory( aDirectory, aMask: String; aType: TFileTypes; aFullInfo: Boolean);
begin
   FDirectory := TerminateDir(aDirectory);
   FMask := aMask;
   FFileTypes := aType;
   FFullInfo := aFullInfo;
   Refresh;
end;

function TsFilesList.GetFileInfo(index: Integer): TsFileInfo;
begin
   if not FFullInfo then
      Raise Exception.Create( SErrorNoFileInformation);
   Result := TsFileInfo( Objects[index]);
end;

procedure TsFilesList.SetDirectory( Value: String);
begin
   Value := TerminateDir(Value);
   if FDirectory <> Value then begin
      FDirectory := Value;
      Refresh;
   end;
end;

procedure TsFilesList.SetMask( Value: String);
begin
   if FMask <> Value then begin
      FMask := Value;
      if FMask = '' then
         FMask := '*.*';
      Refresh;
   end;
end;

procedure TsFilesList.SetFileTypes(Value: TFileTypes);
begin
   if FFileTypes <> Value then begin
      FFileTypes := Value;
      Refresh;
   end;
end;

procedure TsFilesList.SetFullInfo( Value: Boolean);
begin
   if FFullInfo <> Value then begin
      FFullInfo := Value;
      if FFullInfo then
         Refresh
      else
         DeleteObjects;
   end;
end;

procedure TsFilesList.Refresh;
var
   F: TSearchRec;
   res: Integer;
   function GetSearchAttr: Integer;
   begin
      Result := 0;
      if ftReadonly in FFileTypes then
         Result := Result + faReadOnly;
      if ftHidden in FFileTypes then
         Result := Result + faHidden;
      if ftSystem in FFileTypes then
         Result := Result + faSysFile;
      if ftArchive in FFileTypes then
         Result := Result + faArchive;
      if ftDirectory in FFileTypes then
         Result := faDirectory;
   end;
begin
   BeginUpdate;
   try
      Clear;
      res := FindFirst( FDirectory + FMask, GetSearchAttr, F);
      try
         while res = 0 do begin
            if (F.Name <> '.') and (F.Name <> '..') and (F.Attr <> faVolumeID) then begin
               if FFullInfo then
                  AddObject( F.Name, TObject(TsFileInfo.Create( FDirectory, F.FindData)))
               else
                  Add( F.Name);
            end;
            res := FindNext(F);
         end;
      finally
         FindClose(F);
      end;
   finally
      EndUpdate;
   end;
end;



{ function GetParamStr copied from SYSTEM.PAS unit of Delphi32 }
function GetParamStr(P: PChar; var Param: string): PChar;
var
   Len: Integer;
   Buffer: array[Byte] of Char;
begin
   while True do
   begin
      while (P[0] <> #0) and (P[0] <= ' ') do Inc(P);
      if (P[0] = '"') and (P[1] = '"') then Inc(P, 2) else Break;
   end;
   Len := 0;
   while P[0] > ' ' do
      if P[0] = '"' then
      begin
         Inc(P);
         while (P[0] <> #0) and (P[0] <> '"') do
         begin
            Buffer[Len] := P[0];
            Inc(Len);
            Inc(P);
         end;
         if P[0] <> #0 then Inc(P);
      end else
      begin
         Buffer[Len] := P[0];
         Inc(Len);
         Inc(P);
      end;
   SetString(Param, Buffer, Len);
   Result := P;
end;

function ParamCountFromCommandLine(CmdLine: PChar): Integer;
var
   S: string;
   P: PChar;
begin
   P := CmdLine;
   Result := 0;
   while True do
   begin
      P := GetParamStr(P, S);
      if S = '' then Break;
      Inc(Result);
   end;
end;

function ParamStrFromCommandLine(CmdLine: PChar; Index: Integer): string;
var
   P: PChar;
begin
   P := CmdLine;
   while True do begin
      P := GetParamStr(P, Result);
      if (Index = 0) or (Result = '') then
         Break;
      Dec(Index);
   end;
end;

procedure SplitCommandLine(const CmdLine: string; var ExeName,
   Params: string);
var
   Buffer: PChar;
   Cnt, I: Integer;
   S: string;
begin
   ExeName := '';
   Params := '';
   Buffer := StrPCopy(StrAlloc(Length(CmdLine) + 1), CmdLine);
   try
      Cnt := ParamCountFromCommandLine(Buffer);
      if Cnt > 0 then begin
         ExeName := ParamStrFromCommandLine(Buffer, 0);
         for I := 1 to Cnt - 1 do begin
            S := ParamStrFromCommandLine(Buffer, I);
            if Pos(' ', S) > 0 then S := '"' + S + '"';
            Params := Params + S;
            if I < Cnt - 1 then Params := Params + ' ';
         end;
      end;
   finally
      StrDispose(Buffer);
   end;
end;

procedure LoadSystemStrings;
var
   S: String;
   Ptr: PChar;
   inst, p: Integer;
begin
   GetMem( Ptr, 1024);
   try
      GetSystemDirectory(Ptr, 1024);
      S := TerminateDir(String(Ptr)) + 'comdlg32.dll';
      inst := LoadLibrary( PChar(S));
      LoadString( inst, 257, Ptr, 1024);
      MsgFileExists := String(Ptr);
      LoadString( inst, 387, Ptr, 1024);
      MsgNonExistingDrive := String(Ptr);
      p := Pos('%c', MsgNonExistingDrive);
      if p > 0 then
         MsgNonExistingDrive[p+1] := 's';
      LoadString( inst, 388, Ptr, 1024);
      MsgInvalidDrive := String(Ptr);
      p := Pos('%c', MsgInvalidDrive);
      if p > 0 then
         MsgInvalidDrive[p+1] := 's';
      LoadString( inst, 391, Ptr, 1024);
      MsgFileNotExists := String(Ptr);
      LoadString( inst, 392, Ptr, 1024);
      MsgPathNotExists := String(Ptr);
      LoadString( inst, 393, Ptr, 1024);
      MsgFilenameInvalid := String(Ptr);
      LoadString( inst, 396, Ptr, 1024);
      MsgFileReadOnly := String(Ptr);
      LoadString( inst, 402, Ptr, 1024);
      MsgCreateFile := String(Ptr);
      StringsInitialized := TRUE;
   finally
      FreeMem(Ptr);
   end;
end;

function ValidateFile(path, ext: String; var Options: TOpenOptions; Open: Boolean): Boolean;
// see about "drive is write protected"
begin
   Result := FALSE;
   if not StringsInitialized then
      LoadSystemStrings;

{$I-}
   if ExtractFileDrive(path) <> '' then
      ChDir(ExtractFileDrive(path));
   if IOResult <> 0 then begin
      if UpperCase(Char(path[1])) < 'C' then
         MessageDlg( Format(MsgInvalidDrive, [Char(path[1])]), mtWarning, [mbOK], 0)
      else
         MessageDlg( Format(MsgNonExistingDrive, [Char(path[1])]), mtWarning, [mbOK], 0);
      Exit;
   end;
{$I+}

   if not (ofNoValidate in Options) and not ValidFileName(path) then begin
      MessageDlg( Format(MsgFilenameInvalid, [path]), mtWarning, [mbOK], 0);
      Exit;
   end;
   if (ofCreatePrompt in Options) and Open and not FileExists(path) then begin
      if MessageDlg( Format(MsgCreateFile, [path]), mtWarning, [mbYes,mbNo], 0) = mrYes then
         FileCreate(path)
      else
         Exit;
   end;
   if (ofFileMustExist in Options) and Open and not FileExists(path) then begin
      MessageDlg( Format(MsgFileNotExists, [path]), mtWarning, [mbOK], 0);
      Exit;
   end;
   if (ofPathMustExist in Options) and Open and not DirExists(ExtractFileDir(path)) then begin
      MessageDlg( Format(MsgPathNotExists, [path]), mtWarning, [mbOK], 0);
      Exit;
   end;
   if (ofNoReadOnlyReturn in Options) and (FileGetAttr(path) and faReadOnly = 1) then begin
      MessageDlg( Format(MsgFileReadOnly, [path]), mtWarning, [mbOK], 0);
      Exit;
   end;
   if (ofOverwritePrompt in Options) and not Open and
      (MessageDlg( Format(MsgFileExists, [path]), mtWarning, [mbYes,mbNo], 0) <> mrYes) then
      Exit;
   Result := TRUE;
   if CompareText(ext, ExtractFileExt(path)) = 0 then
      Exclude(Options, ofExtensionDifferent)
   else
      Include(Options, ofExtensionDifferent);
   if FileGetAttr(path) and faReadOnly = 1 then
      Include(Options, ofReadOnly)
   else
      Exclude(Options, ofReadOnly);
end;

resourcestring
   ssAppData = 'AppData';
   ssCashe = 'Cache';
   ssCookies = 'Cookies';
   ssDesctop = 'Desctop';
   ssFavorites = 'Favorites';
   ssFonts = 'Fonts';
   ssHistory = 'History';
   ssNetHood = 'NetHood';
   ssPersonal = 'Personal';
   ssPrintHood = 'PrintHood';
   ssPrograms = 'Programs';
   ssRecent = 'Recent';
   ssSendTo = 'SendTo';
   ssStartMenu = 'StartMenu';
   ssStartup = 'StartUp';
   ssTemplates = 'Templates';
   ssShellFoldersRoot = 'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell folders';

const
   ShellFolderNames: array[TShellFolders] of String = (
      ssAppData, ssCashe, ssCookies, ssDesctop, ssFavorites, ssFonts, ssHistory,
      ssNetHood, ssPersonal, ssPrintHood, ssPrograms, ssRecent, ssSendTo, ssStartMenu,
      ssStartup, ssTemplates);

function GetShellFolderName(folder: TShellFolders): String;
begin
   Result := ShellFolderNames[folder];
end;

function GetShellFolder(folder: TShellFolders): String;
begin
   Result := GetRegValue(  HKEY_CURRENT_USER,
      ssShellFoldersRoot, ShellFolderNames[folder]);
end;

end.
