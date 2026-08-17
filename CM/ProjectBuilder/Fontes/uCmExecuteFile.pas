unit uCmExecuteFile;

interface

uses
  Classes, Windows, Messages, SysUtils, Forms, Dialogs, StdCtrls, ComCtrls, SHELLAPI, consts,
  Graphics, controls;

type
  TCmExecuteFile = class
  private
    PInfo : TProcessInformation;
    FDpl: Boolean;
    FRun: Boolean;
    FCompilador: String;
    FFileName: string;
    FLogFileName: String;
    FParams: string;
    FSaveLog: Boolean;
    FMessages: TStrings;
    procedure UpdateMessages;
    procedure UpdateCursor;
    procedure SetCompilador(const Value: String);
    procedure SetDpl(const Value: Boolean);
    procedure SetFileName(const Value: string);
    procedure SetLogFileName(const Value: String);
    procedure SetParams(const Value: string);
    procedure SetRun(const Value: Boolean);
    procedure SetSaveLog(const Value: Boolean);
    procedure SetMessages(const Value: TStrings);
  protected

  public
    constructor Create;
    destructor  Destroy; override;
    function   Execute :Boolean;

    Property FileName :string read FFileName write SetFileName;
    Property Params   :string read FParams write SetParams;
    Property LogFileName :String read FLogFileName write SetLogFileName;
    Property Compilador :String read FCompilador write SetCompilador;
    Property Run :Boolean read FRun write SetRun;
    Property Dpl :Boolean read FDpl write SetDpl;
    Property SaveLog :Boolean read FSaveLog write SetSaveLog;
    Property Messages : TStrings read FMessages write SetMessages;
  end;

implementation

constructor TCmExecuteFile.Create;
begin
  inherited Create;
  FFileName := '';
  FParams := '';
  FCompilador := '';
  FDpl := False;
  FRun := False;
  FSaveLog := False;
  FLogFileName := '';
  FMessages := TStringList.Create;
end;

destructor TCmExecuteFile.Destroy;
begin
  FMessages.Free;
  inherited Destroy;
end;

function TCmExecuteFile.Execute:Boolean;
const
  BUFSIZE = 1023;
var
  Buffer : array [0..BUFSIZE] of char;
  bread, avail, ExitCode : Cardinal;
  ClassPath :String;
  newstdin, newstdout, read_stdout, write_stdin :THandle;
  SecAttr : TSecurityAttributes;
  SecDesc : TSecurityDescriptor;
  si : TStartupInfo;
begin
  Result := False;
  UpdateCursor;
  FMessages.Clear;

  SetCurrentDir(ExtractFilePath(FFileName));

  try
    ClassPath := ExtractFileDir(FCompilador);

    if (Win32Platform = VER_PLATFORM_WIN32_NT) then
    begin
      InitializeSecurityDescriptor(@SecDesc,SECURITY_DESCRIPTOR_REVISION);
      SetSecurityDescriptorDacl(@SecDesc, True, nil, False);
      SecAttr.lpSecurityDescriptor := @SecDesc;
    end else
      SecAttr.lpSecurityDescriptor := nil;

    SecAttr.nLength := SizeOf(TSecurityAttributes);
    SecAttr.bInheritHandle := True;
    if not CreatePipe(newstdin, write_stdin, @SecAttr, 0) then
      raise Exception.Create('Não conseguiu criar o Pipe');
    if not CreatePipe(read_stdout, newstdout, @SecAttr, 0) then
    begin
      CloseHandle(newstdin);
      CloseHandle(write_stdin);
      raise Exception.Create('Não conseguiu criar o Pipe');
    end;
    GetStartupInfo(si);
    si.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    si.wShowWindow := SW_HIDE;
    si.hStdOutput := newstdout;
    si.hStdError := newstdout;
    si.hStdInput := newstdin;

    Result := CreateProcess(nil, PChar('"' +  FCompilador + '"' + FFileName + FParams),
                    nil, nil, True, CREATE_NEW_CONSOLE, nil, PChar(ExtractFilePath(FFileName)), si, PInfo);

    FillChar(buffer, SizeOf(buffer), 0);
    repeat
                                                         
      if (not GetExitCodeProcess(PInfo.hProcess, ExitCode)) then
        ExitCode := 0;

      PeekNamedPipe(read_stdout, @buffer, 1023, @bread, @avail, nil);
      if (bread <> 0) then
      begin
        FillChar(buffer, SizeOf(buffer), 0);
        if (avail > 1023) then
        begin
          while (bread >= 1023) do
          begin
            ReadFile(read_stdout, buffer, 1023, bread, nil);
            if Trim(Buffer) <> '' then
            Begin
              FMessages.Add(Trim(Buffer));
            End;
            FillChar(buffer, SizeOf(buffer), 0);
          end;
        end else
        begin
          ReadFile(read_stdout, buffer, 1023, bread, nil);
          if Trim(Buffer) <> '' then
          Begin
            FMessages.Add(lowercase(Trim(Buffer)));
          End;
        end;
      end;
      Sleep(2000);

      if (ExitCode <> STILL_ACTIVE) and (ExitCode <> STATUS_WAIT_0) then
          Result := (ExitCode =  0);
    until (ExitCode <> STILL_ACTIVE);
  except
    On E:Exception do
       FMessages.Add('>> Erro no Console: ' + E.Message);
  end;

  UpdateCursor;

  UpdateMessages;
  CloseHandle(newstdin);
  CloseHandle(write_stdin);
  CloseHandle(newstdout);
  CloseHandle(read_stdout);
end;


procedure TCmExecuteFile.SetCompilador(const Value: String);
begin
  FCompilador := Value;
end;

procedure TCmExecuteFile.SetDpl(const Value: Boolean);
begin
  FDpl := Value;
end;

procedure TCmExecuteFile.SetFileName(const Value: string);
begin
  FFileName := Value;
end;

procedure TCmExecuteFile.SetLogFileName(const Value: String);
begin
  FLogFileName := Value;
end;

procedure TCmExecuteFile.SetMessages(const Value: TStrings);
begin
  FMessages := Value;
end;

procedure TCmExecuteFile.SetParams(const Value: string);
begin
  FParams := Value;
end;

procedure TCmExecuteFile.SetRun(const Value: Boolean);
begin
  FRun := Value;
end;

procedure TCmExecuteFile.SetSaveLog(const Value: Boolean);
begin
  FSaveLog := Value;
end;

procedure TCmExecuteFile.UpdateCursor;
begin
  if Screen.Cursor = crDefault then
    Screen.Cursor := crHourGlass
  else
    Screen.Cursor := crDefault;
end;

procedure TCmExecuteFile.UpdateMessages;
Var
  iPos :Integer;
  sAux :String;
begin
  sAux := FMessages.Text;
  iPos := Pos(#13+#10,sAux);
  While iPos <> 0 Do
  Begin
      Delete(sAux,iPos,2);
      Insert('#REPLACE#',sAux,iPos);
      iPos := Pos(#13+#10,sAux);
  End;

  iPos   := Pos(#13,sAux);
  While iPos <> 0 Do
  Begin
      Delete(sAux,iPos,1);
      Insert('#REPLACE#',sAux,iPos);
      iPos := Pos(#13,sAux);
  End;

  iPos   := Pos('#REPLACE#',sAux);
  While iPos <> 0 Do
  Begin
      Delete(sAux,iPos,9);
      Insert(#13+#10,sAux,iPos);
      iPos := Pos('#REPLACE#',sAux);
  End;

  FMessages.Text := sAux;

  If FSaveLog Then
     FMessages.SaveToFile(FLogFileName);
end;

end.
