program InvestCotas;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FPrincipal in 'FPrincipal.pas' {FrmPrincipal},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FOkCancelarInv in 'FOkCancelarInv.pas' {frmOkCancelarInv},
  FOkCancelarRelInv in 'FOkCancelarRelInv.pas' {frmOkCancelarRelInv},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  FCmReportInv in 'FCmReportInv.pas' {FrmCmReportInv},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMTInv in 'FCadastroMTInv.pas' {FrmCadastroMTInv},
  uCtrlParamCotaInvest in '..\CtrlObjects\uCtrlParamCotaInvest.pas',
  uDbParamCotaInvest in '..\DbObjects\uDbParamCotaInvest.pas',
  FCadastroGridCsInv in 'FCadastroGridCsInv.pas',
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  faMensagem in 'faMensagem.pas' {fraMensagem: TFrame},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  FCadastroGridMTInv in 'FCadastroGridMTInv.pas' {FrmCadastroGridMTInv},
  FCadastroGridMTInvFMD in 'FCadastroGridMTInvFMD.pas' {FrmCadastroGridMTInvFMD},
  FCadEveCaixaCota in 'FCadEveCaixaCota.pas' {FrmCadEveCaixaCota},
  uDbEventoCaixaCota in '..\DbObjects\uDbEventoCaixaCota.pas',
  uCtrlEventoCaixaCota in '..\CtrlObjects\uCtrlEventoCaixaCota.pas',
  uCtrlInvestCotas in '..\CtrlObjects\uCtrlInvestCotas.pas',
  uDbTipoOperacao in '..\DbObjects\uDbTipoOperacao.pas',
  uDbRegra in '..\DbObjects\uDbRegra.pas',
  uDbTipoDespInvest in '..\DbObjects\uDbTipoDespInvest.pas',
  uDbTipoinvest in '..\DbObjects\uDbTipoinvest.pas',
  FCadCarteiraXEvento in 'FCadCarteiraXEvento.pas' {FrmCadCarteiraXEvento},
  uCtrlCarteiraXEvento in '..\CtrlObjects\uCtrlCarteiraXEvento.pas',
  uDbCarteiraXEvento in '..\DbObjects\uDbCarteiraXEvento.pas',
  uDbHistCaixa in '..\DbObjects\uDbHistCaixa.pas',
  uCtrlHistCaixa in '..\CtrlObjects\uCtrlHistCaixa.pas',
  FCadLanctoCaixa in 'FCadLanctoCaixa.pas' {FrmCadLanctoCaixa},
  FCadLanctoCota in 'FCadLanctoCota.pas' {FrmCadLanctoCota},
  uDbHistCota in '..\DbObjects\uDbHistCota.pas',
  uCtrlHistCota in '..\CtrlObjects\uCtrlHistCota.pas',
  FCadCarteiraInvest in 'FCadCarteiraInvest.pas' {FrmCadCarteiraInvest},
  uCtrlCarteiraInvest in '..\CtrlObjects\uCtrlCarteiraInvest.pas',
  FCadRetirada in 'FCadRetirada.pas' {FrmCadRetirada},
  FCadDeposito in 'FCadDeposito.pas' {FrmCadDeposito},
  FProcCalcCaixa in 'FProcCalcCaixa.pas' {FrmProcCalcCaixa},
  FParamCotaInvest in 'FParamCotaInvest.pas' {FrmParamCotaInvest},
  FAutorizaParametros in 'FAutorizaParametros.pas' {frmAutorizaParametros},
  FSelApuraCota in 'FSelApuraCota.pas' {FrmSelApuraCota},
  FSelApuraCaixa in 'FSelApuraCaixa.pas' {FrmSelApuraCaixa},
  FProcCalcCota in 'FProcCalcCota.pas' {FrmProcCalcCota},
  uDbCarteiraInvest in '..\DbObjects\uDbCarteiraInvest.pas',
  uCtrlDiasUteis in '..\CtrlObjects\uCtrlDiasUteis.pas',
  FDMRelCarteiraParam in '..\Reports\FDMRelCarteiraParam.pas' {RelCarteiraParam},
  FConsCartInvParam in 'FConsCartInvParam.pas' {FrmConsCartInvParam},
  FDMRelEventoCaixaCota in '..\Reports\FDMRelEventoCaixaCota.pas' {RelEventoCaixaCota},
  FConsEventoCaixaCota in 'FConsEventoCaixaCota.pas' {FrmConsEventoCaixaCota},
  FConsCartXEvento in 'FConsCartXEvento.pas' {FrmConsCartXEvento},
  FDMRelCartXEvento in '..\Reports\FDMRelCartXEvento.pas' {RelCartXEvento},
  FConsLanctoCaixa in 'FConsLanctoCaixa.pas' {FrmConsLanctoCaixa},
  FDMRelLanctoCaixa in '..\Reports\FDMRelLanctoCaixa.pas' {RelLanctoCaixa},
  FConsApuraCota in 'FConsApuraCota.pas' {FrmConsApuraCota},
  FDMRelApuraCota in '..\Reports\FDMRelApuraCota.pas' {RelApuraCota},
  FConsLanctoCota in 'FConsLanctoCota.pas' {FrmConsLanctoCota},
  FDMRelLanctoCota in '..\Reports\FDMRelLanctoCota.pas' {RelLanctoCota},
  FConsEvolucaoPatr in 'FConsEvolucaoPatr.pas' {FrmConsEvolucaoPatr},
  FDMRelEvolucaoPatr in '..\Reports\FDMRelEvolucaoPatr.pas' {RelEvolucaoPatr},
  FConsLancDepRetr in 'FConsLancDepRetr.pas' {FrmConsLancDepRetr},
  FDMRelLancDepRetr in '..\Reports\FDMRelLancDepRetr.pas' {RelLancDepRetr},
  FDMRelApuraCaixa in '..\Reports\FDMRelApuraCaixa.pas' {RelApuraCaixa},
  FConsApuraCaixa in 'FConsApuraCaixa.pas' {FrmConsApuraCaixa};

{$R *.RES}
{$R INVESTCOTAS_RES.RES}

begin
	frmCMEntrada:= TfrmCMEntrada.Create(Application);
	frmCMEntrada.Show;
	frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Sistema de Cotas do Investimento';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo InvestCotas
================================================================================
CM$VER      4.00.00a    27/02/2008
--------------------------------------------------------------------------------
- Criação do Modulo
================================================================================
CM$ALT}
































