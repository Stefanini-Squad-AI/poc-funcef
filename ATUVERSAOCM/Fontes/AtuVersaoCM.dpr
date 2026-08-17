program AtuVersaoCM;

uses
  Forms,
  fPrincipal in 'fPrincipal.pas' {frmPrincipal},
  fProcessosAbertos in 'fProcessosAbertos.pas' {frmProcessosAbertos};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'AtuVersaoCM';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmProcessosAbertos, frmProcessosAbertos);
  frmPrincipal.Show;
  frmPrincipal.Executa;
  Application.Run;
end.
