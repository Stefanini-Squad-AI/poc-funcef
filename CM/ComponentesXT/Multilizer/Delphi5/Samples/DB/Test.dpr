program test;

uses
  Forms,
  main in 'MAIN.PAS' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.ShowHint := True;
  Application.Run;
end.
