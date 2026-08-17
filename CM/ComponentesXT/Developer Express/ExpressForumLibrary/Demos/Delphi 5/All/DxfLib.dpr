program DxfLib;

uses
  Forms,
  main in 'main.pas' {MainForm},
  BkGraund in 'BkGraund.pas' {BkGroundForm},
  Design in 'Design.pas' {DesignerForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TBkGroundForm, BkGroundForm);
  Application.CreateForm(TDesignerForm, DesignerForm);
  Application.Run;
end.
