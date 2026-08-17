program TilerProj;

uses
  Forms,
  TilerUnit in 'TilerUnit.pas' {TilerForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TTilerForm, TilerForm);
  Application.Run;
end.
