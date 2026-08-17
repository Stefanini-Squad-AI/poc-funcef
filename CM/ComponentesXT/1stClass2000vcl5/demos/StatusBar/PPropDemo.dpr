program PPropDemo;

uses
  Forms,
  proportional in 'proportional.pas' {ProportionalDemo};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TProportionalDemo, ProportionalDemo);
  Application.Run;
end.
