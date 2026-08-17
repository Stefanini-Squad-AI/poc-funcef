program BuscaStrings;

uses
  Forms,
  fBuscaStringsTraduz in 'fBuscaStringsTraduz.pas' {FrmPrincipal},
  fBuscaStringsTraduzDlg in 'fBuscaStringsTraduzDlg.pas' {FrmBuscaStringsTraduzDlg};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmBuscaStringsTraduzDlg, FrmBuscaStringsTraduzDlg);
  Application.Run;
end.
