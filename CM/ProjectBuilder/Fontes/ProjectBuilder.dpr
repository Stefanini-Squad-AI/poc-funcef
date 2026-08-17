program ProjectBuilder;

uses
  Forms,
  fPrincipal in 'fPrincipal.pas' {FrmPrincipal},
  uCmExecuteFile in 'uCmExecuteFile.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'CM Project Builder';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
