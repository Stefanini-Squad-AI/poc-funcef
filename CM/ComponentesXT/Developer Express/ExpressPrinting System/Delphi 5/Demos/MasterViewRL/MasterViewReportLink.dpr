program MasterViewReportLink;

uses
  Forms,
  main in 'main.pas' {fmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressMasterView ReportLink';
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
