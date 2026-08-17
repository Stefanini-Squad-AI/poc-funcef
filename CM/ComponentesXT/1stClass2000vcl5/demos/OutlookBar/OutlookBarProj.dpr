program OutlookBarProj;

uses
  Forms,
  OutlookBarUnit in 'OutlookBarUnit.pas' {OutlookBarForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TOutlookBarForm, OutlookBarForm);
  Application.Run;
end.
