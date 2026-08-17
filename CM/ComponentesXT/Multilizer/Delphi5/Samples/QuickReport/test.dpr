program test;

uses
  Forms,
  main in 'main.pas' {MainForm},
  report in 'report.pas' {QRLabelsForm: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
