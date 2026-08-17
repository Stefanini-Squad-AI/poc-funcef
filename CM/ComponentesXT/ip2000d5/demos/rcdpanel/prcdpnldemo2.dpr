program prcdpnldemo2;

uses
  Forms,
  rcdpnldemo2 in '\\RAID\SharedData\ip5d5\demos\rcdpanel\rcdpnldemo2.pas' {RecordViewPanelForm2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TRecordViewPanelForm2, RecordViewPanelForm2);
  Application.Run;
end.
