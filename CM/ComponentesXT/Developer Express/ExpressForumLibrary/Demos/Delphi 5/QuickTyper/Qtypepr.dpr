program qtypepr;

uses
  Forms,
  main in 'main.pas' {MainForm},
  dbform in 'dbform.pas' {DBForm_};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDBForm_, DBForm_);
  Application.Run;
end.
