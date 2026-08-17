program ImageReportLink;

uses
  Forms,
  main in 'main.pas' {MainForm},
  ImgRptLnk in 'ImgRptLnk.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
