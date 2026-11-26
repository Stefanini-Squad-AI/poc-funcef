unit uCMThreadProgresso;

interface

uses
  Classes, Windows;

type
  TThreadProgresso = procedure ( vParams: Array of variant ) of Object;

  TCMThreadProgresso = class(TThread)
  private
    _ListRetorno: Tstrings;
    FProgressoThread: TThreadProgresso;
    procedure SeTThreadProgresso(const Value: TThreadProgresso);
    { Private declarations }
  protected
    procedure DoProgressoThread; Virtual;
    procedure Execute; override;
  public
    property ProgressoThread: TThreadProgresso read FProgressoThread write SeTThreadProgresso;
  end;

  Var
    _CMThreadProgressFileName: String;

implementation


Uses uSistema, Sysutils, uCMFileUtils;

procedure TCMThreadProgresso.DoProgressoThread;
Var
  aValores: Array Of Variant;
  X: Integer;
  sRetorno: String;
begin
  If Assigned(ProgressoThread) Then
  Begin
     _ListRetorno := TStringList.Create;
     Try
       If Not Sistema.AppRemoteServer.Connected Then (Sistema.AppRemoteServer.Connected := True);

       sRetorno := Sistema.AppRemoteServer.AppServer.GetContentFile(_CMThreadProgressFileName);

       

       If (Pos('EMPTY',Trim(sRetorno)) > 0) Then
       Begin

         _ListRetorno.Text := sRetorno;

         SetLength(aValores, _ListRetorno.Count + 1);

         aValores[0] := '';

         For X:=0 To _ListRetorno.Count - 1 Do
             aValores[X + 1] := _ListRetorno[X];

         ProgressoThread(aValores);

         SetLength(aValores, 0);
       End;

       _ListRetorno.Free;

       Sleep(250);
     Except
       _ListRetorno.Free;
     End;
  End;
end;

procedure TCMThreadProgresso.Execute;
begin
    FreeOnTerminate := True;

    While Not Terminated Do
       Synchronize(DoProgressoThread);
end;

procedure TCMThreadProgresso.SeTThreadProgresso(const Value: TThreadProgresso);
begin
  FProgressoThread := Value;
end;

end.
