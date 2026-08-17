unit uCMFileUtils;

interface

Uses graphics, SysUtils, Windows, shellapi, Forms, Jpeg, classes;

  function ShellExecuteFile(const FileName, Params, DefaultDir: string; ShowCmd: Integer): THandle;
  function ExecuteFile(const NomedoArquivo, Params: String; EsperaTerminar, MostraJanela : boolean): word;
  function CriaDiretorio(Dir:string): boolean;
  function DestroiDiretorio(Dir:string): boolean;
  function DeleteFiles(sPathFileMask: String): boolean;
  function CMApplicationPath : String;
  procedure CMDebugToFile(Texto : String; sFileName: String = '');
  function NomeArqTemp: string;
  function cmGetTempPath: String;
  function cmGetSysPath: String;
  procedure CMJPegToBitmap(const JpegFileName: string; BmpFileName: String = '');
  Procedure VisualizaArquivo(NomedoArquivo, ComplMensagem: String);

var
  iLinhaDebug: Integer;
  CMEnableDebug: Boolean = True;

implementation

Uses JclFileUtils;

Procedure VisualizaArquivo(NomedoArquivo, ComplMensagem: String);
Var sMensagem: String;
Begin
  If ComplMensagem <> '' Then
      sMensagem := NomedoArquivo + ' ' + ComplMensagem
  Else
      sMensagem := NomedoArquivo;

  If Application.MessageBox(Pchar('Deseja visualizar o arquivo ' + (#13+#10) + sMensagem + '?'),'Atenção',Mb_IconQuestion + Mb_YesNo) = Id_Yes Then
  Begin
     CopyFile(Pchar(NomedoArquivo),PChar(ExtractFilePath(NomedoArquivo) + 'Visualiza.Txt'),false);
     ShellExecuteFile(ExtractFilePath(NomedoArquivo) +  'Visualiza.Txt','','',SW_SHOW);
  End;
End;


function ShellExecuteFile(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): THandle;
var
  zFileName, zParams, zDir: array[0..255] of Char;
begin
  Result := ShellExecute(Application.MainForm.Handle, nil,
    StrPCopy(zFileName, FileName), StrPCopy(zParams, Params),
    StrPCopy(zDir, DefaultDir), ShowCmd);
end;

function ExecuteFile(const NomedoArquivo, Params: String; EsperaTerminar, MostraJanela : boolean): word;
var
   CmdLine: String;
   StartupInfo: TStartupInfo;
   ProcessInfo: TProcessInformation;
   DExitCode :LongWord;
begin
     Result := 0;
     CmdLine := '"'+NomeDoArquivo+'"' + ' ' + Params ;
     FillChar (StartupInfo, SizeOf(StartupInfo), 0);
     StartupInfo.cb := SizeOf(StartupInfo);
     StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
     if MostraJanela then
        StartupInfo.wShowWindow := SW_SHOW
     else
        StartupInfo.wShowWindow := SW_MINIMIZE;

     if not CreateProcess(nil, PChar(CmdLine), nil, nil, False, 0, nil, nil,StartupInfo, ProcessInfo) then
        Raise Exception.Create('Erro na execução do arquivo '+NomedoArquivo);
        
     with ProcessInfo do
     begin
          { Don't need the thread handle, so close it now }
          CloseHandle (hThread);
          if EsperaTerminar then
          { Wait until the process returns, but still process any messages that arrive. }
          repeat
                { Process any pending messages first because MsgWaitForMultipleObjects
                (called below) only returns when *new* messages arrive }
                Application.ProcessMessages;

                GetExitCodeProcess(hProcess, DExitCode);
                if (ExitCode <> STILL_ACTIVE) and (ExitCode <> STATUS_WAIT_0) then
                begin
                     Result := ExitCode;
                end;
          until ExitCode <> STILL_ACTIVE;
          { Then close the process handle }
          CloseHandle (hProcess);
    end;
end;

function CriaDiretorio(Dir:string) : boolean;
begin
   Result := ForceDirectories(Dir);
end;

function DestroiDiretorio(Dir:string) : boolean;
begin
   Result := DelTree(Dir);
end;

function CMApplicationPath : String;
Var
  path : array[0..200] of char;
Begin
  if not IsLibrary then
    Result := PathAddSeparator(ExtractFilePath(ParamStr(0)))
  else
  Begin
    GetModuleFileName(hInstance,path,200);
    result := PathAddSeparator(ExtractFilePath(path));
  end;
end;

procedure CMDebugToFile(Texto : String; sFileName: String = '');
Var
  F : TextFile;
  sAuxFileName : string;
Begin
  If CMEnableDebug Then
  Begin
    {$I-}
    If sFileName = '' Then
       sAuxFileName := CMApplicationPath + 'log.txt'
    Else
       sAuxFileName := sFileName;

    AssignFile(F,sAuxFileName);
    if FileExists(sAuxFileName) then
        Append(F)
      else
        ReWrite(F);

    Inc(iLinhaDebug);

    if iLinhaDebug=1 then
       Writeln(F,'=========================================================');

    Writeln(F,'Debug nº '+intToStr(iLinhaDebug)+' ==>['+Texto+']<== '+DateTimeToStr(Now));
    Close(F);
    {$I+}
    Application.ProcessMessages;
  End;
end;

function NomeArqTemp : string;
var
  liPrefixSize: Integer;
  lpPrefix: PChar;
  liPathSize: Integer;
  lpPath: PChar;
  lpTempFileName: PChar;
  aPath,
  aPrefix : string;

begin
  lpPrefix := nil;
  lpPath := nil;
  lpTempFileName := nil;
  aPrefix := 'CM';

  try
    {allocate space for path}
    aPath := cmGetTempPath;
    liPathSize := Length(aPath) + 1;
    GetMem(lpPath, liPathSize);
    StrPCopy(lpPath, aPath);

    {allocate space for temporary file prefix}
    liPrefixSize := Length(aPrefix) + 1;
    GetMem(lpPrefix, liPrefixSize);
    StrPCopy(lpPrefix, aPrefix);

    GetMem(lpTempFileName, MAX_PATH);

    {get a unique temporary file name}
    GetTempFileName(lpPath, lpPrefix, 0, lpTempFileName);

    {return temporary file name as a pascal string}
    Result := StrPas(lpTempFileName);

  finally
    {free allocated resources}
    FreeMem(lpPrefix);
    FreeMem(lpPath);
    FreeMem(lpTempFileName);
  end;
end;

function cmGetTempPath: String;
var
  lpPath: PChar;
begin
  lpPath := nil;
  try
    GetMem(lpPath, MAX_PATH);
    GetTempPath(MAX_PATH, lpPath);
    Result := PathAddSeparator(StrPas(lpPath));
  finally
    FreeMem(lpPath);
  end;

end; 


function cmGetSysPath: String;
var
  lpPath: PChar;
begin
  lpPath := nil;
  try
    GetMem(lpPath, MAX_PATH);
    GetSystemDirectory(lpPath, MAX_PATH);
    Result := StrPas(lpPath);
  finally
    FreeMem(lpPath);
  end;

end;


procedure CMJPegToBitmap(const JpegFileName: string; BmpFileName: String = '');
var
  Bitmap: graphics.TBitmap;
  JPeg: TJPegImage;
begin
  Bitmap := nil;
  JPeg := nil;
  try
    JPeg := TJPegImage.Create;
    JPeg.LoadFromFile(JpegFileName);
    Bitmap := graphics.TBitmap.Create;
    Bitmap.Assign(JPeg);

    If Trim(BmpFileName) = '' Then
       Bitmap.SaveToFile(ChangeFileExt(JpegFileName, '.bmp'))
    Else
       Bitmap.saveToFile(BmpFileName)
  finally
    FreeAndNil(Bitmap);
    FreeAndNil(JPeg);
  end;
end;

function DeleteFiles(sPathFileMask: String): boolean;
Var
  lstFiles: TStrings;
  X: Integer;
Begin
  lstFiles := TStringList.Create;
  Try
    BuildFileList(sPathFileMask, faAnyFile, lstFiles);

    For X:=0 To lstFiles.Count - 1 Do Deletefile(Pchar(PathAddSeparator(ExtractFilePath(sPathFileMask)) + lstFiles[X]));

    Result := True;
  Finally
    lstFiles.Free;
  End;
End;

end.
