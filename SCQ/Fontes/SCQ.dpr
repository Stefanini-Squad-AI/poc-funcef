program SCQ;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipal in '..\..\Cm\Forms\Source\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FPreview in '..\..\Cm\Relatórios\FPreview.pas' {FrmPreview},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  UModulo in 'UModulo.pas',
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  FParamSCQ in 'FParamSCQ.pas' {FrmParamSCQ},
  FCadRestricao in 'FCadRestricao.pas' {FrmCadRestricao},
  FCadTipoAvali in 'FCadTipoAvali.pas' {FrmCadTipoAvali},
  FAvaliacao in 'FAvaliacao.pas' {FrmAvaliacao},
  uAvaliForn in 'uAvaliForn.pas',
  FViewRestricao in 'FViewRestricao.pas' {FrmViewRestricao};

{$R *.RES}
{$R SCQ_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Sistema de Controle de Qualidade';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TFrmViewRestricao, FrmViewRestricao);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo SCQ - Sistema de Controle de Qualidade
================================================================================
CM$ALT}









