program InspectorReportLink;

uses
  Forms,
  Unit1 in 'Unit1.pas' {fmMain},
  Unit2 in 'Unit2.pas' {fmDialog};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmDialog, fmDialog);
  Application.Run;
end.
