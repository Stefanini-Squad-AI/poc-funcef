program Financiamento;

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
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  UModulo in 'UModulo.pas',
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  FCadContVenda in 'FCadContVenda.pas' {FrmCadContVenda},
  fAnalProp in 'fAnalProp.pas' {frmAnalProp},
  FGeraContrato in 'FGeraContrato.pas' {FrmGeraContrato},
  FCadPropFinanc in 'FCadPropFinanc.pas' {FrmCadPropFinanc},
  FGeraParcelaCont in 'FGeraParcelaCont.pas' {FrmGeraParcelaCont};

{$R *.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Financiamento';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Financiamento
================================================================================
CM$VER      3.00.00     04/04/2001
--------------------------------------------------------------------------------
- Liberação da Versão em Delphi 5.0
================================================================================
CM$VER      2.00.00     22/09/2000
--------------------------------------------------------------------------------
- Primeira versão liberadao.
================================================================================
CM$ALT}





