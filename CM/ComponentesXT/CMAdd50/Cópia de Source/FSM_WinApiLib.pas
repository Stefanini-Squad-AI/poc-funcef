unit FSM_WinAPILib;

{****************************************************************************}
{*                                                                          *}
{*   ***  Biblioteca de Funções da API do Windows  ***                      *}
{*    -----------------------------------------------                       *}
{*             Criada por Fábio S Monteiro                                  *}
{*                  ©  Copyright  1999                                      *}
{*             Data de Criação:    28/Jun/1999                              *}
{*             Ultima modificação: 04/Jan/2001                              *}
{*                                                                          *}
{*       ***  Windows API Functions Library  ***                            *}
{*         ----------------------------------                               *}
{*             Created by Fábio S Monteiro                                  *}
{*                  ©  Copyright  1999                                      *}
{*             Creation :     28/Jun/1999                                   *}
{*             Last Modified: 04/Jan/2001                                   *}
{*                                                                          *}
{****************************************************************************}

interface

uses Windows, SysUtils, Forms, ShellAPI;

{$I FSM.inc}

function CreateTempFile(Prefix: string; Path : string {$IFDEF FSM4}= '%WINTMP%'{$ENDIF}): string;
function CreateFile(FileName: string; Overwrite : Boolean {$IFDEF FSM4}= True{$ENDIF}; Path : string {$IFDEF FSM4}= '%CURRDIR%'{$ENDIF}): Boolean;
function CopyFile(const FileName, DestFileName : string; Confirm : Boolean {$IFDEF FSM4} = True{$ENDIF}; ShowProgress : Boolean {$IFDEF FSM4} = True{$ENDIF}):Boolean;
function EmptyDir(const DirName: string): Boolean;
function GetApplicationDir(const WithExeName: boolean) : string;
function GetApplicationVersion : string;
function GetComputer : string;
function GetNumOfColors : Integer;
function GetColorsPalette  : Integer;
function GetColorsPaletteStr : string;
function GetFileVersion(AFile : string) : string;
function GetProductVersion(AFile : string) : string;
function GetAvailMem : string;
function GetOSMem : string;
function GetOSVersion : string;
function GetTmpPath : String;
function GetUser : string;
procedure KillAllProcesses;
procedure LogOffWindows;
procedure ReBootWindows;
function RecycleFile(const FileName : string; Confirm : Boolean {$IFDEF FSM4} = True{$ENDIF}; ShowProgress : Boolean {$IFDEF FSM4} = True{$ENDIF}) : Boolean;
procedure ShutDownWindows;
procedure Wait(const MSecs : Cardinal);

{$IFNDEF FSM4}
const
  WINTMP = '%WINTMP%';
  CURRENTDIR = '%CURRDIR%';
{$ENDIF}

implementation

uses
  FSM_FxLib, FileCtrl;

{Função Privada}
function GetVersion(AFile, SubBlock : string) : string;
var
  VerInfoSize, GetInfoSizeJunk : DWord;
  VersionInfo, InfoPointer, Translation : Pointer;
  VersionValue : string;
  VersionInfoSize : UINT;
begin
  try
    VerInfoSize := GetFileVersionInfoSize(PChar(AFile), GetInfoSizeJunk);
    GetMem(VersionInfo, VerInfoSize);
    GetFileVersionInfo(PChar(AFile), 0, VerInfoSize, VersionInfo);
    VerQueryValue(VersionInfo, '\\VarFileInfo\\Translation', Translation, VersionInfoSize);
    VersionValue := '\\StringFileInfo\\'+ IntToHex(LoWord(LongInt(Translation^)),4)+IntToHex(HiWord(LongInt(Translation^)),4)+'\\';
    VerQueryValue(VersionInfo, PChar(VersionValue + SubBlock), InfoPointer, VersionInfoSize);
    Result := string(PChar(InfoPointer));
  except
    Result := '';
    raise EAccessViolation.Create(AFile + ' não possui informação de versão.');
  end;
end;

function CreateTempFile(Prefix: string; Path : string {$IFDEF FSM4}= '%WINTMP%'{$ENDIF}): string;
var
  RTmp : array[0..MAX_PATH] of char;
begin
  if Path = '%WINTMP%' then
    Path := GetTmpPath
  else
    if Path = '' then
      Path := GetApplicationDir(False);
  GetTempFileName(PChar(Path), PChar(Prefix), 0, @RTmp);
  Result := RTmp;
end;

function CreateFile(FileName: string; Overwrite : Boolean {$IFDEF FSM4}= True{$ENDIF}; Path : string {$IFDEF FSM4}= '%CURRDIR%'{$ENDIF}): Boolean;
var
  sTmp : string;
begin
  Result := False;
  if FileExists(FileName) then
    if Overwrite then
      DeleteFile(FileName)
    else
      Exit;
  if Path = '%CURRDIR%' then
    sTmp := CreateTempFile('FSM', GetCurrentDir)
  else
    sTmp := CreateTempFile('FSM', Path);
  Result := RenameFile(sTmp, FileName);
end;

function CopyFile(const FileName, DestFileName : string; Confirm : Boolean;
   ShowProgress : Boolean):Boolean;
var
  TempFileStruct : TSHFileOpStruct;
begin
  FillChar(TempFileStruct, SizeOf(TempFileStruct), 0 );
  with TempFileStruct do
  begin
    Wnd := Application.MainForm.Handle;
    wFunc  := FO_COPY;
    pFrom  := PChar(FileName);
    pto    := PChar(DestFileName);
    fFlags := FOF_FILESONLY;
    lpszProgressTitle := '';
    if not Confirm then
       fFlags := fFlags or FOF_NOCONFIRMATION;
    if not ShowProgress then
       fFlags := fFlags or FOF_SILENT;
  end;
  Result := (ShFileOperation(TempFileStruct) = 0);
end;

function EmptyDir(const DirName: string): Boolean;
var
   SearchRec : TSearchRec;
   Dir : string;
begin
  Result := False;
  if Trim(DirName) = '' then Exit;
  Dir := DirName;
  AddBackSlash(Dir);
  if DirectoryExists(DirName) then
  begin
    Result := True;
    if FindFirst(Dir + '*.*', faAnyFile, SearchRec) = 0 then
      repeat
        if (SearchRec.Attr or faDirectory <> faDirectory) then
          Result := Result and DeleteFile(Dir + SearchRec.Name);
        Application.ProcessMessages;
      until (FindNext(SearchRec) <> 0);
    FindClose(SearchRec);
  end;
end;

function GetApplicationDir(const WithExeName: boolean) : string;
begin
 if WithExeName then
   Result := ParamStr(0)
 else
   Result := ExtractFileDir(ParamStr(0));
end;

function GetApplicationVersion : string;
begin
  Result := GetProductVersion(ParamStr(0));
end;

function GetComputer : string;
var
  ChValue : array[0..MAX_COMPUTERNAME_LENGTH+1] of char;
  i : {$IFDEF VER100} Integer; {$ELSE} LongWord; {$ENDIF}
begin
  Result := '';
  i := MAX_COMPUTERNAME_LENGTH+1;
  if GetComputerName(ChValue,i) then
    Result := string(ChValue);
end;

function GetNumOfColors : Integer;
begin
  Result := 1 shl GetColorsPalette;
end;

function GetColorsPalette : Integer;
var
  iPlanes, iBitsPixel : Integer;
begin
  iPlanes := GetDeviceCaps(Application.MainForm.Canvas.Handle, PLANES);
  iBitsPixel := GetDeviceCaps(Application.MainForm.Canvas.Handle, BITSPIXEL);
  Result := iPlanes * iBitsPixel;
end;

function GetColorsPaletteStr  : string;
begin
  Result := Format('%u bits (%u cores)', [GetColorsPalette, GetNumOfColors]);
end;

function GetFileVersion(AFile : string) : string;
begin
  Result := GetVersion(AFile, 'FileVersion');
end;

function GetProductVersion(AFile : string) : string;
begin
  Result := GetVersion(AFile, 'ProductVersion');
end;

function GetAvailMem : string;
var
  MS: TMemoryStatus;
begin
  MS.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(MS);
  Result := FormatFloat('#,###" KB"', MS.dwAvailPhys div 1024);
end;

function GetOSMem : string;
var
  MS: TMemoryStatus;
begin
  MS.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(MS);
  Result := FormatFloat('#,###" KB"', MS.dwTotalPhys div 1024); 
end;

function GetOSVersion : string;
var
  Platform: string;
  BuildNumber: Integer;
begin
  case Win32Platform of
    VER_PLATFORM_WIN32_WINDOWS:
      begin
        BuildNumber := Win32BuildNumber and $0000FFFF;
        if ((Win32MajorVersion = 4) and (Win32MinorVersion >= 10)) or (Win32MajorVersion > 4) then
          Platform := 'Windows 98'
        else
          Platform := 'Windows 95';
      end;
    VER_PLATFORM_WIN32_NT:
      begin
        BuildNumber := Win32BuildNumber;
        if (Win32MajorVersion > 4) then
          Platform := 'Windows 2000'
        else
          Platform := 'Windows NT';
      end;
      else
      begin
        Platform := 'Windows';
        BuildNumber := 0;
      end;
  end;
  if (Win32Platform = VER_PLATFORM_WIN32_WINDOWS) or
    (Win32Platform = VER_PLATFORM_WIN32_NT) then
  begin
    if Win32CSDVersion = '' then
      Result := Format('%s %d.%.2d.%.3d', [Platform, Win32MajorVersion,
        Win32MinorVersion, BuildNumber])
    else
      Result := Format('%s %d.%.2d.%.3d (%s)', [Platform, Win32MajorVersion,
        Win32MinorVersion, BuildNumber, Win32CSDVersion]);
  end
  else
    Result := Format('%s %d.%d', [Platform, Win32MajorVersion,
      Win32MinorVersion])
end;

function GetTmpPath : String;
var
  Tmp : array[0..MAX_PATH] of char;
begin
  GetTempPath(MAX_PATH, @Tmp);
  Result := Tmp;
end;

function GetUser : string;
var
  PUser : PChar;
  i : {$IFDEF VER100} Integer; {$ELSE} LongWord; {$ENDIF}
begin
  i := 0;
  GetUserName(nil,i);
  PUser := StrAlloc(i);
  if GetUserName(PUser,i) then
    Result := string(PUser)
  else
    Result := '';
  StrDispose(PUser);
end;

procedure KillAllProcesses;
begin
  ExitWindowsEx(EWX_FORCE,0);
end;

procedure LogOffWindows;
begin
  ExitWindowsEx(EWX_LOGOFF,0);
end;

procedure ReBootWindows;
begin
  ExitWindowsEx(EWX_REBOOT,0);
end;

function RecycleFile(const FileName : string; Confirm : Boolean {$IFDEF FSM4} = True{$ENDIF}; ShowProgress : Boolean {$IFDEF FSM4} = True{$ENDIF}) : Boolean;
var
  TempFileStruct : TSHFileOpStruct;
begin
  FillChar(TempFileStruct, SizeOf(TempFileStruct), 0 );
  with TempFileStruct do
  begin
    Wnd := Application.MainForm.Handle;
    wFunc  := FO_DELETE;
    pFrom  := PChar(FileName);
    fFlags := FOF_ALLOWUNDO;
    lpszProgressTitle := '';
    if not Confirm then
       fFlags := fFlags or FOF_NOCONFIRMATION;
    if not ShowProgress then
       fFlags := fFlags or FOF_SILENT;
  end;
  Result := (ShFileOperation(TempFileStruct) = 0);
end;

procedure ShutDownWindows;
begin
  ExitWindowsEx(EWX_SHUTDOWN,0);
end;

procedure Wait(const MSecs : Cardinal);
var
  FirstTickCount : Cardinal;
begin
  FirstTickCount := GetTickCount;
  repeat
    Application.ProcessMessages;
  until ((GetTickCount - FirstTickCount) >= MSecs);
end;

end.
