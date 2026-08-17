program Impostos;

uses
  Forms,
  uAutorizacao,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  Fpessoa in '..\..\Cm\Forms\Source\fPessoa.pas' {frmPessoa},
  FCadastroGrid in '..\..\Cm\Forms\Source\FCadastroGrid.pas' {frmCadastroGrid},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {frmCadastroGridCS},
  FCompRendReten in 'FCompRendReten.pas' {frmCompRendReten},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FConfigRelatorio in '..\..\Cm\Forms\Source\FConfigRelatorio.pas' {FrmConfigRelatorio},
  FRParamDarfGerado in 'FRParamDarfGerado.pas' {frmRParamDarfGerado},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadNatRendimentoMT in '..\FontesMT\FCadNatRendimentoMT.pas' {frmCadNatRendimentoMT},
  FCadTabIRRFMT in '..\FontesMT\FCadTabIRRFMT.pas' {frmCadTabIRRFMT},
  FCadInformeMT in '..\FontesMT\FCadInformeMT.pas' {frmCadInformeMT},
  FTipoAltxImpostosMT in '..\FontesMT\FTipoAltxImpostosMT.pas' {frmTipoAltxImpostosMT},
  FCadExcInformeMT in '..\FontesMT\FCadExcInformeMT.pas' {frmCadExcInformeMT},
  FParamIRRFMT in '..\FontesMT\FParamIRRFMT.pas' {frmParamIRRFMT},
  FLancIRRFxInformeMT in '..\FontesMT\FLancIRRFxInformeMT.pas' {frmLancIRRFxInformeMT},
  FGeraFolhaMT in '..\FontesMT\FGeraFolhaMT.pas' {frmGeraFolhaMT},
  FBuscaIOFEmprestimoMT in '..\FontesMT\FBuscaIOFEmprestimoMT.pas' {frmBuscaIOFEmprestimoMT},
  FGeraDarfMT in '..\FontesMT\FGeraDarfMT.pas' {frmGeraDarfMT},
  FGeraDIRFMT in '..\FontesMT\FGeraDIRFMT.pas' {frmGeraDIRFMT},
  fCadastroDarfMT in '..\FontesMT\fCadastroDarfMT.pas' {frmCadastroDarfMT},
  FGfipMT in '..\FontesMT\FGfipMT.pas' {frmGFIPMT},
  FDCTFMT in '..\FontesMT\FDCTFMT.pas' {frmDCTFMT},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  rptGPSMT in '..\Reports\Source\rptGPSMT.pas' {rptGPS},
  fParamGPS in '..\Reports\Source\fParamGPS.pas' {frmrptParamGPS},
  rDarf in '..\Reports\Source\rDarf.pas' {frmRptDarf},
  rRelatCompRendPessJurid in '..\Reports\Source\rRelatCompRendPessJurid.pas' {frmRelatCompRendPessJurid},
  fParamCompRendPessJurid in '..\Reports\Source\fParamCompRendPessJurid.pas' {frmRCompRendPessJurid},
  rDarfGerado in '..\Reports\Source\rDarfGerado.pas' {frmrptDarfGerado},
  rRelatDirf in '..\Reports\Source\rRelatDirf.pas' {frmRptConfDirf},
  rConfIRRF in '..\Reports\Source\rConfIRRF.pas' {frmRptConfIRRF},
  fParamConfIRRF in '..\Reports\Source\fParamConfIRRF.pas' {frmparamConfIRRF},
  rConfIRRFAna in '..\Reports\Source\rConfIRRFAna.pas' {frmRptConfIRRFAna},
  FProcuraCliFor in 'FProcuraCliFor.pas' {FrmProcuraCliFor},
  rGpsGerados in '..\Reports\Source\rGpsGerados.pas' {frmRptGpsGerados},
  FConfigRelatorioMT in '..\..\Cm\Forms\SourceMT\FConfigRelatorioMT.pas' {FrmConfigRelatorioMT},
  RDarfDepositoJud in '..\Reports\Source\RDarfDepositoJud.pas' {frmRptDarfDepositoJud},
  uCtrUtilLancIRRF in '..\CtrlObjects\uCtrUtilLancIRRF.pas',
  uCtrlBuscaIOFEmprestimo in '..\CtrlObjects\uCtrlBuscaIOFEmprestimo.pas',
  uCtrlDARF in '..\CtrlObjects\uCtrlDARF.pas',
  uCtrlDCTF in '..\CtrlObjects\uCtrlDCTF.pas',
  uCtrlGeraDarf in '..\CtrlObjects\uCtrlGeraDarf.pas',
  uCtrlGeraDirf in '..\CtrlObjects\uCtrlGeraDirf.pas',
  uCtrlGeraFolha in '..\CtrlObjects\uCtrlGeraFolha.pas',
  uCtrlGfip in '..\CtrlObjects\uCtrlGfip.pas',
  uCtrlInforme in '..\CtrlObjects\uCtrlInforme.pas',
  uCtrlIRRFPF in '..\CtrlObjects\uCtrlIRRFPF.pas',
  uCtrllConfigRelatInforme in '..\CtrlObjects\uCtrllConfigRelatInforme.pas',
  uCtrlModuloIRRF in '..\CtrlObjects\uCtrlModuloIRRF.pas',
  uCtrlNatuRendimento in '..\CtrlObjects\uCtrlNatuRendimento.pas',
  uCtrlParamIRRF in '..\CtrlObjects\uCtrlParamIRRF.pas',
  uCtrlRubricaxInforme in '..\CtrlObjects\uCtrlRubricaxInforme.pas',
  uCtrlTipoAltxImpostos in '..\CtrlObjects\uCtrlTipoAltxImpostos.pas',
  uCtrlUtil in '..\CtrlObjects\uCtrlUtil.pas',
  uCtrLancIRRF in '..\CtrlObjects\uCtrLancIRRF.pas',
  uDbRubricaxinforme in '..\DbObjects\uDbRubricaxinforme.pas',
  uDbDarf in '..\DbObjects\uDbDarf.pas',
  uDbInforme in '..\DbObjects\uDbInforme.pas',
  uDBLancIRRF in '..\DbObjects\uDBLancIRRF.pas',
  uDBLancXInforme in '..\DbObjects\uDBLancXInforme.pas',
  uDbNaturendimento in '..\DbObjects\uDbNaturendimento.pas',
  uDbParamirrf in '..\DbObjects\uDbParamirrf.pas',
  uDbAltximposto in '..\DbObjects\uDbAltximposto.pas',
  uCtrlRptIRRF in '..\Reports\Source\uCtrlRptIRRF.pas',
  uCtrlRptGPS in '..\Reports\Source\uCtrlRptGPS.pas',
  uCtrlLancDocCapCarIR in '..\CtrlObjects\uCtrlLancDocCapCarIR.pas',
  DCtrlDocCapCar in '..\FontesMT\DCtrlDocCapCar.pas' {DtmCtrlDocCapCar: TDataModule},
  rAutPag in '..\Reports\Source\rAutPag.pas' {RptAutPag},
  uCtrlRelatoriosCAPCAR in '..\CtrlObjects\uCtrlRelatoriosCAPCAR.pas',
  DCapCarMT in '..\FontesMT\DCapCarMT.pas' {DtmCapCarMT: TDataModule},
  fParamConfIRRFAna in '..\Reports\Source\fParamConfIRRFAna.pas' {frmParamConfIRRFAna},
  FAgrupaParcelaMT in '..\FontesMT\FAgrupaParcelaMT.pas' {FrmAgrupaParcelaMT},
  UModulocap in '..\FontesMT\UModulocap.pas',
  FdeletaFolhaMT in '..\FontesMT\FdeletaFolhaMT.pas' {frmdeletaFolhaMT},
  uCtrlDeletaFolha in '..\CtrlObjects\uCtrlDeletaFolha.pas',
  uApuracaoMensalRet in 'uApuracaoMensalRet.pas' {frmApuracaoMensalRET},
  FCadHstParamIRRFMT in '..\FontesMT\FCadHstParamIRRFMT.pas' {FrmCadHstParamIRRFMT},
  uCtrlHstParamIRRF in '..\CtrlObjects\uCtrlHstParamIRRF.pas',
  uDbHstParamIrrf in '..\DbObjects\uDbHstParamIrrf.pas',
  FDeletaIOFMT in '..\FontesMT\FDeletaIOFMT.pas' {frmdeletaIOFMT},
  uCtrlDeletaCARCAR in '..\CtrlObjects\uCtrlDeletaCARCAR.pas',
  FDeletaCARCARMT in '..\FontesMT\FDeletaCARCARMT.pas' {frmDeletaCarCarMT},
  uCtrlDeletaIOF in '..\CtrlObjects\uCtrlDeletaIOF.pas',
  FPRelVerBuscaFolhaBen in 'FPRelVerBuscaFolhaBen.pas' {frmPRelVerBuscaFolhaBen},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  DRelVerBuscaFolhaBen in 'DRelVerBuscaFolhaBen.pas' {dtmrelverbuscaFolhaBen},
  FDeletaCSLLPISCOFINSMT in '..\FontesMT\FDeletaCSLLPISCOFINSMT.pas' {frmDeletaCSLLPISCOFINSMT},
  uCtrlDeletaCSLLPISCOFINS in '..\CtrlObjects\uCtrlDeletaCSLLPISCOFINS.pas',
  fParamDARM in '..\Reports\Source\fParamDARM.pas' {frmrptParamDARM},
  rptDARMMT in '..\Reports\Source\rptDARMMT.pas' {rptDARM},
  mParticipante in '..\FontesMT\mParticipante.pas' {molParticipante: TFrame},
  fRelatInformeFacultativo in '..\Reports\Source\fRelatInformeFacultativo.pas' {frmRelatInformeFacultativo},
  dRelatInformeFacultativo in '..\Reports\Source\dRelatInformeFacultativo.pas' {dtmInformeFacultativo},
  FExcluiMultDarfs in '..\FontesMT\FExcluiMultDarfs.pas' {frmExcluiMultDarfs},
  uCtrlGeraFolhaFUNCEF in '..\CtrlObjects\uCtrlGeraFolhaFUNCEF.pas',
  uCtrlUtilLancaEspecial in '..\CtrlObjects\uCtrlUtilLancaEspecial.pas',
  FLancaDeducaoEspecial in '..\FontesMT\FLancaDeducaoEspecial.pas' {frmLancaDeducaoEspecial},
  FProgresso in '..\..\Cm\Forms\Source\FProgresso.pas' {frmProgresso},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  fParamCompAnualRetIRPJCSLLPISCOFINS in '..\Reports\Source\fParamCompAnualRetIRPJCSLLPISCOFINS.pas' {frmParamCompAnualRetIRPJCSLLPI},
  rRelatCompAnualRetIRPJCSLLPISCOFINS in '..\Reports\Source\rRelatCompAnualRetIRPJCSLLPISCOFINS.pas' {frmRelatCompAnualRetIRPJCSLLPI},
  uCtrlGeraInformeEmptmo in '..\CtrlObjects\uCtrlGeraInformeEmptmo.pas',
  FGeraInformeEmptmoMT in '..\FontesMT\FGeraInformeEmptmoMT.pas' {FrmGeraInformeEmptmoMT},
  uCtrlGeraAcerto in '..\CtrlObjects\uCtrlGeraAcerto.pas',
  FAcertaValorMT in '..\FontesMT\FAcertaValorMT.pas' {frmAcertaValorMT},
  uDbIrrfRegressiva in '..\DbObjects\uDbIrrfRegressiva.pas',
  FCadTabIRRFRegressiva in 'FCadTabIRRFRegressiva.pas' {frmCadTabIRRFRegressiva},
  uCtrlGeraDARM in '..\CtrlObjects\uCtrlGeraDARM.pas',
  uCtrlGeraGPS in '..\CtrlObjects\uCtrlGeraGPS.pas',
  FGeraDARMMT in '..\FontesMT\FGeraDARMMT.pas' {frmGeraDARMMT},
  FGeraGPSMT in '..\FontesMT\FGeragpsmt.pas' {frmGeraGPSMT},
  rCompDARF in '..\Reports\Source\rCompDARF.pas' {FrmRptCompDARF},
  uCtrRCompDARF in '..\CtrlObjects\uCtrRCompDARF.pas',
  DLookIRRF in '..\FontesMT\DLookIRRF.pas' {dtmLookIRRF: TDataModule},
  FCadGPSMT in '..\FontesMT\FCadGPSMT.pas' {frmCadGPSMT},
  FWizardMT in '..\..\Cm\Forms\SourceMT\FWizardMT.pas' {frmWizardMT},
  FExecBuscaCaPMT in '..\FontesMT\FExecBuscaCaPMT.pas' {frmExecBuscaCaPMT},
  uCtrlBuscaCaP in '..\CtrlObjects\uCtrlBuscaCaP.pas',
  uCtrlLancIRRFCaP in '..\CtrlObjects\uCtrlLancIRRFCaP.pas',
  fGeraDCTFMT in '..\FontesMT\fGeraDCTFMT.pas' {frmGeraDCTF},
  uCtrlGeraDCTF in '..\CtrlObjects\uCtrlGeraDCTF.pas',
  uDBDocINSS in '..\DbObjects\uDBDocINSS.pas',
  FCadDARMMT in '..\FontesMT\FCadDARMMT.pas' {frmCadDARMMT},
  uDbDocISS in '..\DbObjects\uDbDocISS.pas',
  uCtrlGeraDprev in '..\CtrlObjects\uCtrlGeraDprev.pas',
  FGeraDprevMT in '..\FontesMT\FGeraDprevMT.pas' {frmGeraDprevMT},
  uCtrlInformeDePara in '..\CtrlObjects\uCtrlInformeDePara.pas',
  uDbInformeDePara in '..\DbObjects\uDbInformeDePara.pas',
  FInformeDeParaMT in '..\FontesMT\FInformeDeParaMT.pas' {FrmInformeDeParaMT},
  RSaldoNegativoAnual in '..\Reports\Source\RSaldoNegativoAnual.pas' {RptSaldoNegativoAnual},
  UFuncoesUteisIR in 'UFuncoesUteisIR.pas',
  uCtrlDirf2008 in '..\CtrlObjects\uCtrlDirf2008.pas',
  uCtrlGeraIsencao in '..\CtrlObjects\uCtrlGeraIsencao.pas',
  FIsencaoValorMT in '..\FontesMT\FIsencaoValorMT.pas',
  FDesfazAcertaValorMT in '..\FontesMT\FDesfazAcertaValorMT.pas' {FrmDesfazAcertaValorMT},
  uCtrlDesfazAcerto in '..\CtrlObjects\uCtrlDesfazAcerto.pas',
  uCtrlFuncoesIRRF in '..\CtrlObjects\uCtrlFuncoesIRRF.pas',
  dCds in '..\FontesMT\dCds.pas' {dmCds},
  fLancDocCapCar in '..\FontesMT\fLancDocCapCar.pas' {frmLancDocCAPCAR},
  uCtrlGeraDirf2011 in '..\CtrlObjects\uCtrlGeraDirf2011.pas',
  FConsultaBuscaMT in '..\FontesMT\FConsultaBuscaMT.pas' {frmConsultaBusca},
  uCtrlConsultaBusca in '..\CtrlObjects\uCtrlConsultaBusca.pas',
  uCtrlCadAssociacaoContribAno in '..\CtrlObjects\uCtrlCadAssociacaoContribAno.pas',
  FCadAssociacaoContribAno in 'FCadAssociacaoContribAno.pas' {FrmCadAssociacaoContribAno},
  FRelDirfIndividual in '..\FontesMT\FRelDirfIndividual.pas' {FrmRelDirfIndividual},
  uCtrlDirfIndividual in '..\CtrlObjects\uCtrlDirfIndividual.pas',
  fOpcoesExportacaoDirf in '..\FontesMT\fOpcoesExportacaoDirf.pas' {frmOpcoesExportacaoDirf},
  fCadLinhasDACONMT in '..\FontesMT\FCadLinhasDaconMT.pas',
  FCadDACONMT in '..\FontesMT\FCadDACONMT.pas' {frmCadDacon},
  FRelDivergeFolhaXComprov in '..\FontesMT\FRelDivergeFolhaXComprov.pas' {frmRelDivergeFolhaXComprov},
  uCtrlRelDivergeFolhaXComprov in '..\CtrlObjects\uCtrlRelDivergeFolhaXComprov.pas',
  FGeraDIRF_Novo in 'FGeraDIRF_Novo.pas' {frmGeraDIRF_Novo},
  FGeraDCTF_Novo in 'FGeraDCTF_Novo.pas' {frmGeraDCTF_Novo},
  FCadDCTF_DARF in 'FCadDCTF_DARF.pas' {frmCadDCTF_DARF},
  FCadDCTF_DJE in 'FCadDCTF_DJE.pas' {frmCadDCTF_DJE},
  FCadDCTF_DCOMP in 'FCadDCTF_DCOMP.pas' {frmCadDCTF_DCOMP},
  FCadSpedMT in '..\FontesMT\FCadSpedMT.pas' {frmCadSpedMT},
  uCtrlSPED in '..\CtrlObjects\uCtrlSPED.pas',
  uDbEfdDetalhe in '..\DbObjects\uDbEfdDetalhe.pas',
  uCtrlTipoRelatorio in '..\CtrlObjects\uCtrlTipoRelatorio.pas',
  uDBLinhasSPED in '..\DbObjects\uDBLinhasSPED.pas',
  uDbRelatorioDados in '..\DbObjects\uDbRelatorioDados.pas',
  FCadastroCDS in '..\FontesMT\FCadastroCDS.pas' {frmCadastroCDS},
  FCadNatContaContabil in '..\FontesMT\FCadNatContaContabil.pas' {frmCadNatContaContabil},
  uCtrlLinhaXContaContabil in '..\CtrlObjects\uCtrlLinhaXContaContabil.pas',
  UDbLinhaXContaContabil in '..\DbObjects\UDbLinhaXContaContabil.pas',
  uDbLinhaRelatorio in '..\DbObjects\uDbLinhaRelatorio.pas',
  uCtrlLinhaRelatorio in '..\CtrlObjects\uCtrlLinhaRelatorio.pas',
  FOpcoesExporta in 'FOpcoesExporta.pas' {FrmOpcoesExporta},
  FRelRecContrib in 'FRelRecContrib.pas' {FrmRelRecContrib},
  FBUSCA_DIRFFolhaBeneficios in 'FBUSCA_DIRFFolhaBeneficios.pas' {frmBUSCA_DIRFFolhaBeneficios},
  uCtrlBUSCA_DIRFFolhaBeneficios in '..\CtrlObjects\uCtrlBUSCA_DIRFFolhaBeneficios.pas',
  FPrepararDARFFolBenef in 'FPrepararDARFFolBenef.pas' {frmPrepararDARFFolBenef},
  uCtrlPrepararDARFFolBenef in '..\CtrlObjects\uCtrlPrepararDARFFolBenef.pas',
  FGeraDARF_Novo in 'FGeraDARF_Novo.pas' {frmGeraDARF_Novo},
  FCadContaContabilBaseCalc in '..\FontesMT\FCadContaContabilBaseCalc.pas' {frmCadContaContabilBaseCalc},
  uCtrlGeraDIRF_Novo in '..\CtrlObjects\uCtrlGeraDIRF_Novo.pas',
  FCadNatRendimentoREINF in '..\FontesMT\FCadNatRendimentoREINF.pas' {frmCadNatRendimentoREINF},
  FCadGrupoRendimentoREINF in '..\FontesMT\FCadGrupoRendimentoREINF.pas' {frmCadGrupoRendimentoREINF},
  uCtrlNaturezaRendimentoREINF in '..\CtrlObjects\uCtrlNaturezaRendimentoREINF.pas',
  uDbNaturezaRendimentoREINF in '..\DbObjects\uDbNaturezaRendimentoREINF.pas';

{$R *.RES}
{$R IMPOSTOS_RES.RES}


begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;
  //
  Application.Initialize;
  Application.Title := 'Impostos e Tributos';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TrptDARM, rptDARM);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TdtmLookIRRF, dtmLookIRRF);
  Application.CreateForm(TfrmOpcoesExportacaoDirf, frmOpcoesExportacaoDirf);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Impostos e Tributos
================================================================================
CM$VER      3.12.08h    19/06/2008
--------------------------------------------------------------------------------
Pendência: 24355 (ReAbertura)
Tela     : Principal
Descrição: Na entrada do módulo mostrar mensagem de GPS não gerada. Esta mensagem sempre será mostrada no último dia útil do mês.
Pendencia: 27939
Tela     : Geraçãoes \ DCTF
Descrição: Ajuste na geração da DCTF referente a pocisão dos Representantes
           e Responsaveis no Layout da DCTF.
Pendencia: 27939
Tela     : Geraçãoes \ DCTF
Descrição: Ajuste na geração da DCTF referente a pocisão dos Representantes
           e Responsaveis no Layout da DCTF.
Pendencia: 27940
Tela     : Geraçãoes \ DCTF
Descrição: Ajuste na geração da DCTF referente a pocisão do Header no Layout da DCTF.
Pendencia: 27937
Tela     : Geraçãoes \ DCTF
Descrição: Ajuste na geração da DCTF referente a pocisão dos dados Juridicos no Layout da DCTF.
Pendencia: 27936
Tela     : Geraçãoes \ DCTF
Descrição: Ajuste na geração da DCTF nos dados da linhas de suspensão(R14).
Pendencia: 27935
Tela     : Geraçãoes \ DCTF
Descrição: Ajuste na geração da DCTF referente caracteres inválidos no Layout da DCTF.
================================================================================
CM$VER      3.12.08g    16/05/2008
--------------------------------------------------------------------------------
Pendencia: 27817
Tela     : Lançamentos \ Lançamentos Manual de Impostos
Descrição: ajuste na consulta das informações da lancxinforme.
Pendencia: 27546
Tela     : Lançamentos \ Lançamentos Manual de Impostos
Descrição: Ajuste para gravar o campo código da gps, ao alterar o registro.
================================================================================
CM$VER      3.12.08f    28/04/2008
--------------------------------------------------------------------------------
Pendencia: 27719
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Ajuste para tratar o adiantamento de abono mesmo para quem teve ação judicial após o pagamento deste benefício.
================================================================================
CM$VER      3.12.08e    26/03/2008
--------------------------------------------------------------------------------
Pendencia: 27473
Tela     : Varias
Descrição: Alterando consulta da Rotina.
Pendencia: 27594
Tela     : Varias
Descrição: Ajuste no acerto de contribuição.
================================================================================
CM$VER      3.12.08d    17/03/2008
--------------------------------------------------------------------------------
Pendencia: 27586
Tela     : Lançamentos \ Alteração / Exclusão de DARM
Descrição: Acerto na alteração de valores do DARM.
================================================================================
CM$VER      3.12.08c    27/02/2008
--------------------------------------------------------------------------------
Pendencia: 27266
Tela     : Gerações \ Compensa Valor Negativo da Busca
Descrição: Implementado acerto de 13º para compensar valor negativo na outra fonte pagadora.
Pendencia: 27357 (Reabertura)
Tela     : Consultas \ Relatórios \ Impostos \ Demonstrativos \ Demonstrativo para Imposto de Renda para Facultativos
Descrição: Acerto para não somar os valores das patronais junto com a do participante.
================================================================================
CM$VER      3.12.08b    20/02/2008
--------------------------------------------------------------------------------
Pendencia: 27357
Tela     : Consultas \ Relatórios \ Impostos \ Demonstrativos \ Demonstrativo para Imposto de Renda para Facultativos
Descrição: Acerto para não somar os valores das padtronais junto com a do participante.
Pendencia: 24663 (Reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Desfazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto usar a lista corretamente, quando for uma busca de folha de pagamento.
Pendencia: 27026
Tela     : Gerações | DIRF
Descrição: Geração do novo layout da DIRF.
================================================================================
CM$VER      3.12.08a    23/01/2008
--------------------------------------------------------------------------------
Pendencia: 27277
Tela     : Gerações | Lançamentos de Outros Sistemas | Desfazer Busca | Empréstimos - IOF
Descrição: Ajuste para habilitar o botão de defazer a busca do IOF.
Pendencia: 24663
Tela     : GeraFolha
Descrição: Gerar Folha apartir de uma lista.
Pendência: 24608
Tela     : Gerações | Compensa Valor Negativo da Busca
Descrição: Novas maneira de parametrizar os acertos.
Pendência: 27159
Tela     : Gerações \ Dirf e
           Consultas \ Relatórios \ IRRF \ Operacionais \ Conferência da Dirf.
Descrição: Ajuste para não utilizar mais o campo numdocumento do lançamento de impostos.
Pendência: 27161
Tela     : Cadastros \ Linhas para o Informe de Rendimento
Descrição: Implementação para acrescentar novos códigos da Dirf.
================================================================================
CM$VER      3.12.08     13/12/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.18
Pendência: 18542
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Mostrar mensagem na tela referente a parametrização da rubrica especial com linha de informe parametrizada.
Pendência: 18785
Tela     : Cadastros \ Linhas para Informe de Rendimento
Descrição: Colocamos uma orientação da escolha da natureza da linha de informe.
Pendência: 19285
Tela     : Gerações \ Dirf
Descrição: Testar o parâmetro que indica se gera ou não participantes Auto Patrocinados.
Pendência: 21239
Tela     : Principal e Sistemas \ Configuração \ Parâmetros do Sistemas
Descrição: Na entrada do módulo mostrar mensagem de darf não gerado ainda. Esta mensagem é mostrada a quandtidade de dias úteis escolhida em parâmetros do sistema.
Pendência: 24355
Tela     : Principal
Descrição: Na entrada do módulo mostrar mensagem de GPS não gerada. Esta mensagem sempre será mostrada no último dia útil do mês.
Pendência: 24531
Tela     : Gerações \ Dirf
Descrição: Quando for gerado arquivo txt apenas para folha de pagamento, ordenar por nome e cpf.
Pendência: 25375
Tela     : Relatórios \ DARF de depósito judicial
Descrição: Impressão da Classe da Ação, conforme cadastro (anteriormente era um valor fixo)
Pendência: 24379
Tela     : Relatórios \ Saldo Negativo de Rendimentos
Descrição: Criação do Relatório de Saldo Negativo de Rendimentos
Pendência: 25053
Tela     : Relatórios \ Informe de Facultativo
Descrição: Filtro por contribuições pagas em Banco e/ou de mantido.
Pendência: 21820 (Reaburtura)
Tela     : Geraçãoes \ DCTF
Descrição: Ajuste para não gerar linha no arquivo com natureza de rendimento sem registro.
Pendência: 23529 (Reaburtura)
Tela     : Consultas \ Relatórios \ IRRF \ Operacionais \ Relatório de DARF´s gerados
Descrição: Implementado a data de lançamento e correção para mostrar o número do documento de origem e mostrar apenas um registro do fornecedor para um mesmo darf, somando seus valores.
Pendência: 26817
Tela     : Sistemas \ Configuração \ Parâmetros do Sistema
Descrição: Não permitir usar a mesma linha de informe de rendimento para os dois parâmetros de busca de inss.
Pendência: 26945
Tela     : Gerações \ DCTF
Descrição: Buscar o valor do imposto de ação judicial na tabela de lançamentos de impostos.
Pendência: 25692 (Reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Ajuste no acerto no tratamento de dedução de dependente.
Pendência: 26494
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Desfazer Busca \ Folha de Pagamento / Benefícios
Descrição: Não permitir desfazer a busca de pessoa com registro com valor de ir igual que também tenha registro com valor maior que zero com o darf já gerado.
Pendência: 26494 (Reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Desfazer Busca \ Folha de Pagamento / Benefícios
Descrição: Não permitir desfazer a busca de pessoa com registro com valor de ir igual que também tenha registro com valor maior que zero com o darf já gerado.
Pendência: 27052
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Não inverter o sinal da linha de compensação de imposto de renda.
Pendência: 27050
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Gravar no processo da busca o campo datapagamento.
Pendência: 27055
Tela     : Lançamentos \ Alteração / Exclusão de GPS
Descrição: Acerto na alteração de valores da GPS, para não apagar campos preenchidos anteriormente.
Pendência: 27082
Tela     : Consultas \ Relatórios \ IRRF \ Oficiais \ Comprovante Anual de Retenção de IRPJ CSLL, Cofins e PIS/Pasep e
           Consultas \ Relatórios \ IRRF \ Oficiais \ Comprovante de Rendimentos Pagos e de Retenção de I.R. na Fonte - Pessoa Jurídica
Descrição: Acerto na consulta para não mostrar páginas desnecessárias.
================================================================================
CM$VER      3.12.06h    29/10/2007
--------------------------------------------------------------------------------
Pendência: 26004
Tela     : Gerações \ Compensa Valor Negativo da Busca
Descrição: Considerar a situação cadastral da pessoa para lançar na linha de rendimento tributável ou linha isenta.
Pendência: 26108
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto no tratamento do rendimento de 13º negativo.
================================================================================
CM$VER      3.12.06g    25/10/2007
--------------------------------------------------------------------------------
Pendência: 26680
Tela     : Gerações \ DARF
Descrição: Correção da gravação das contas de baixa nos documentos gerados
================================================================================
CM$VER      3.12.06f    25/09/2007
--------------------------------------------------------------------------------
Pendência: 26307
Tela     : Lançamentos \ Alteração / Exclusão de GPS
Descrição: Acerto para mostrar mensagem na tela.
================================================================================
CM$VER      3.12.06e    24/09/2007
--------------------------------------------------------------------------------
Pendência: 25722
Tela     : Principal
Descrição: Corrigido controle da acesso às tela de Busca (CaP) e Alteração/Exclusão de GPS e DARM
================================================================================
CM$VER      3.12.06d    31/08/2007
--------------------------------------------------------------------------------
Pendência: 26089 (Reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Desfazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto no processo de desfazer busca da folha de benefícios e pagamento.
Pendência: 26210
Tela     : Consultas \ Impressão do Informe de Rendimento de P.F.
Descrição: Ajuste na query para melhorar performance.
Pendência: 26212
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Empréstimo - IOF
Descrição: Implementação de novos critérios para busca de valores de IOF.
================================================================================
CM$VER      3.12.06c    27/08/2007
--------------------------------------------------------------------------------
Pendência: 21875 (reabertura)
Tela     : Gerações \ Darf
Descrição: Correção da geração de documentos por Plano, em caso de depósito judicial
================================================================================
CM$VER      3.12.06b    22/08/2007
--------------------------------------------------------------------------------
Pendência: 26025
Tela     : Lançamentos \ Lançamento Manual de Impostos
           Sistemas \ Configuração \ Parâmetros do Sistema
Descrição: Implementado na tela de lançamento manual de impostos a opção de reutilizar os dados da tela. Essa opção é escolhida na tela de parâmetros do sistema.
================================================================================
CM$VER      3.12.06a    21/08/2007
--------------------------------------------------------------------------------
Pendência: 21875 (reabertura)
Tela     : Gerações \ Darf
Descrição: Correção da geração de documentos por Plano
Pendência: 26172
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Correção da busca e gravação do parâmetro de informe para valor base e valor do INSS
================================================================================
CM$VER      3.12.06     17/08/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.17
Pendência: 20091
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Ajuste na busca de valores de ação judicial.
================================================================================
CM$VER      3.12.03m    17/08/2007
--------------------------------------------------------------------------------
Pendência: 21820 (Reabertura)
Tela     : Gerações \ DCTF
Descrição: Acerto para geração do arquivo da DCTF.
Pendência: 22657 (Reabertura)
Tela     : Consultas \ Relatórios \ Oficiais \ Emissão de GPS
Descrição: Acerto também na emissão da guia da GPS.
Pendência: 26066
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Acerto para agrupar o documento gerado pelo código da gps.
Pendência: 26076
Tela     : Cadastros \ Associação de Linha de Informe de Origem por Destino
Descrição: Nova tela implementada.
Pendência: 26089
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Desfazer Busca \ Folha de Pagamento / Benefícios
Descrição: Ajuste na query que busca os registros a serem desfeitos.
================================================================================
CM$VER      3.12.03l    07/08/2007
--------------------------------------------------------------------------------
Pendência: 25189
Tela     : Gerações \ DCTF
Descrição: Gravar o campo variação da natureza de rendimento na geração do arquivo da DCTF.
================================================================================
CM$VER      3.12.03k    03/08/2007
--------------------------------------------------------------------------------
Pendência: 26019
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Correção da gravação dos lançamentos em caso de imposto lançado como alterador manual após englobamento de documentos.
================================================================================
CM$VER      3.12.03j    02/08/2007
--------------------------------------------------------------------------------
Pendência: 26003
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Empréstimo - IOF
Descrição: Implementação de novos critérios para busca de valores de IOF.
================================================================================
CM$VER      3.12.03i    31/07/2007
--------------------------------------------------------------------------------
Pendência: 25977
Tela     : Gerações \ DPrev
Descrição: Ajustes na geração do Arquivo DPrev.
================================================================================
CM$VER      3.12.03h    24/07/2007
--------------------------------------------------------------------------------
Pendência: 25833
Tela     : Lançamentos \ Lançamentos de IRRF
Descrição: Alteração para não buscar mais automaticamente o tipo de desembolso relacionado a natureza de rendimento.
================================================================================
CM$VER      3.12.03g    12/07/2007
--------------------------------------------------------------------------------
Pendência: 21875 (reabertura)
Tela     : Gerações \ Darf
Descrição: Correção da geração de documentos por Plano (estava baseado no plano contábil; corrigido para plano previdenciário)
================================================================================
CM$VER      3.12.03f    10/07/2007
--------------------------------------------------------------------------------
Pendência: 25818
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Empréstimo - IOF
Descrição: Acerto para não buscar registro com valor previsto igual a zero.
================================================================================
CM$VER      3.12.03e    09/07/2007
--------------------------------------------------------------------------------
Pendência: 25723 (Reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Acerto para filtrar pela natureza de rendimento.
================================================================================
CM$VER      3.12.03d    07/07/2007
--------------------------------------------------------------------------------
Pendência: 25721
Tela     : Gerações \ DARM e Gerações \ GPS
Descrição: Exibição dos valores a gerar baseada no Documento de origem, e não mais no rateio.
================================================================================
CM$VER      3.12.03c    04/07/2007
--------------------------------------------------------------------------------
Pendência: 23529 (Reaburtura)
Tela     : Consultas \ Relatórios \ IRRF \ Operacionais \ Relatório de DARF´s gerados
Descrição: Implementado a data de lançamento e correção para mostrar o número do documento de origem e mostrar apenas um registro do fornecedor para um mesmo darf, somando seus valores.
Pendência: 24449
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Ajustes no tratamento do 13º para quem tem ação judicial.
Pendência: 24659
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Ajustes no tratamento do 13º.
Pendência: 25692
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto no tratamento de dedução de dependente.
================================================================================
CM$VER      3.12.03b    29/06/2007
--------------------------------------------------------------------------------
Pendência: 25480 (Reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Exibição do nº do documento em vez do código (interno)
Pendência: 25720
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Acerto para não permitir buscar alteradores de INSS e ISS já "buscados".
Pendência: 25723
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Acerto para filtrar pela natureza de rendimento.
================================================================================
CM$VER      3.12.03a    27/06/2007
--------------------------------------------------------------------------------
Pendência: 25708
Tela     : Gerações \ DPrev
Descrição: Inclusão da Tela do DPrev no menu
Pendência: 25712
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
================================================================================
CM$VER      3.12.03     21/06/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.16
Pendência: 17104
Tela     : Relatórios \ DARF Judicial
Descrição: Permitir impressão de DARFs mesmo que a conta corrente não esteja cadastrada no processo
Pendência: 24347
Tela     : Gerações \ DARF, DARM e GPS
Descrição: Não permitir geração de guia para dia não útil
Pendência: 25478
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Não permitir busca se o Tipo de Desembolso não estiver preenchido, e indicação do mesmo na busca, mesmo em caso de alterador automático.
================================================================================
CM$VER      3.12.01q    21/06/2007
--------------------------------------------------------------------------------
Pendência: 24358
Tela     : Consultas \ Relatórios \ Operacionais \ Conferência da Dirf
Descrição: Implementado a visualização dos impostos do contas a pagar.
================================================================================
CM$VER      3.12.01p    13/06/2007
--------------------------------------------------------------------------------
Pendência: 22656 (Reabertura)
Tela     : Consultas \ Relatórios \ Oficiais \ Emissão de GPS
Descrição: Ajuste na impressão da GPS.
================================================================================
CM$VER      3.12.01o    12/06/2007
--------------------------------------------------------------------------------
Pendência: 24530 (Reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto na implementação agora tratando a folha de pagamento, que não entra nesta condição.
Pendência: 24723
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Implementado a busca do tipo de desembolso do favorecido do cadastro de associação de rubricas por plano.
Pendência: 25553
Tela     : Gerações \ Darf
Descrição: Acerto na geração do documento gerado no darf quando este será separado por plano contábil/sub-plano.
================================================================================
CM$VER      3.12.01n    11/06/2007
--------------------------------------------------------------------------------
Pendência: 24549
Tela     : Lançamentos \ Lançamentos no IRRF
Descrição: Implementado a obrigatoriedade da escolha do módulo responsável.
================================================================================
CM$VER      3.12.01m    31/05/2007
--------------------------------------------------------------------------------
Pendência: 25478
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: (a) Não permitir busca se o Tipo de Desembolso não estiver preenchido, e indicação do mesmo na busca, mesmo em caso de alterador automático.
           (b) Busca preferencial do Tipo de Desembolso ligado ao imposto com tabela de retenção
Pendência: 25480
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Exibição do nº do documento em vez do código (interno)
================================================================================
CM$VER      3.12.01k    18/05/2007
--------------------------------------------------------------------------------
*********************************************************
* Alteração do nome do módulo para "Impostos e Tributos *
*********************************************************
Pendência: 24989 (reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Documentos englobados: ajuste para reconhecer alteradores lançados no documento resultante do englobamento
================================================================================
CM$VER      3.12.01j    16/05/2007
--------------------------------------------------------------------------------
Pendência: 23529
Tela     : Consultas \ Relatórios \ IRRF \ Operacionais \ Relatório de DARF´s gerados
Descrição: Implementado a data de lançamento e correção para mostrar o número do documento de origem e mostrar apenas um registro do fornecedor para um mesmo darf, somando seus valores.
================================================================================
CM$VER      3.12.01i    14/05/2007
--------------------------------------------------------------------------------
Pendência: 24989 (reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Correção na busca de documentos englobados
================================================================================
CM$VER      3.12.01h    08/05/2007
--------------------------------------------------------------------------------
Pendência: 24317 (Atualização de Alt)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto no calculo do percentual da ação judicial para a linha do informe de rendimento.
================================================================================
CM$VER      3.12.01g    07/05/2007
--------------------------------------------------------------------------------
Pendência: 24989
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Tratamento para busca de documentos englobados
Pendência: -
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Correção da busca das contas contábeis dos impostos com tabela de retenção
================================================================================
CM$VER      3.12.01f    04/05/2007
--------------------------------------------------------------------------------
Pendência: 18055 (Reabertura)
Tela     : Lançamentos \ Lançamentos de IRRF
Descrição: Acerto nas propriedades dos Lookups.
================================================================================
CM$VER      3.12.01e    27/04/2007
--------------------------------------------------------------------------------
Pendência: 24570
Tela     : Consultas \ Informe de Rendimentos de Pessoa Física
Descrição: Acerto para demonstrar os valores de ação judicial em dados complementares.
================================================================================
CM$VER      3.12.01d    26/04/2007
--------------------------------------------------------------------------------
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Alteração na lógica para permitir busca de impostos que não tenham a Natureza do Rendimento indicada;
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Busca / Desfazer Busca do Contas a Pagar
Descrição: Correção na busca de impostos que não têm contas contábeis indicadas na tela de Impostos com Tabela de Retenção;
Tela     : Lançamentos no IRRF
Descrição: Ajustes na exibição do tipo de imposto e se respectivo valor;
================================================================================
CM$VER      3.12.01c    24/04/2007
--------------------------------------------------------------------------------
Pendência: 24530
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Alteração para permitir a impressão do informe de rendimento de pensão alimentíca separado do informe de aposentados/pensionistas.
================================================================================
CM$VER      3.12.01b    24/04/2007
--------------------------------------------------------------------------------
Pendência: 22657
Tela     : Relatórios \ Impressão de GPS
Descrição: Adequação da impressão à nova estrutura de dados;
Pendência: 23882
Tela     : DARF, DARM e GPS
Descrição: Opção de indicar centro de responsabilidade para o documento a gerar, sobrescrevendo o que viria do rateio original;
Pendência: 24513
Tela     : DARF, DARM, GPS e Parâmetros do Sistema
Descrição: Gravação dos documentos referentes a guias de pagamento com Centro de Custo único (opcional), indicado na tela de parâmetros do sistema
Pendência: 24451
Tela     : NOVA tela: Busca de Impostos (Contas a Pagar)
Descrição: Criada nova tela para busca de todos os impostos, em substituição a uma tela para cada imposto
Pendência: 22523, 22699 e 22700
Tela     : Alteração/Exclusão de GPS e DARM
Descrição: Criadas nova telas em substituição à tela do Contas a Pagar que era anteriormente chamada
Pendência: 22346
Tela     : Geração de GPS
Descrição: Criada nova forma de agupamento, guias individuais por favorecido para o código 2631 e guia única para todos os códigos 2100
================================================================================
CM$VER      3.12.01a    16/04/2007
--------------------------------------------------------------------------------
Pendência: 18055
Tela     : Lançamentos \ Lançamentos de IRRF
Descrição: Possibilitar ao usuário alterar ou inserir o tipo de desembolso.
Pendência: 22656
Tela     : Consultas \ Relatórios \ Oficiais \ Emissão de GPS
Descrição: Não é mais necessário informar o código da GPS na hora da impressão.
Pendência: 23017
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Não será mais tratada a rubrica de dedução por idade que estiver parametrizada com a mesma linha do informe que é parametrizada nos parâmetros do IRRF para dedução por idade.
Pendência: 23063
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Tratar estorno com a data de pagamento inferior a data inicial da busca.
Pendência: 23073
Tela     : Lançamentos \ Lançamentos de IRRF
Descrição: Possibilitar ao usuário alterar ou inserir o centro de responsabilidade.
Pendência: 24174
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Ajuste na rotina que altera a linha de informe quando a pessoa tem molestia grave.
Pendência: 24360
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto na busca da folha de pagamento para possibilitar a busca para o ano inteiro.
Pendência: 24534
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto no quantitativo de pessoas geradas para a impressão do TXT de Pensão Alimentícia.
Pendência: 24835
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Passar a gravar o CodigoGPS na LancIRRF, permitindo a geração de GPS a partir de lançamentos manuais.
================================================================================
CM$VER      3.12.01     11/04/2007
--------------------------------------------------------------------------------
Liberação de versão no padrão 5.10.15.
Pendência: 24837
Tela     : Gerações | DARM
Descrição: Ajustes na tela de Geração de DARM: agrupamento dos lançamentos;
Pendência: 22523 e 22700
Tela     : Lançamentos | Alteração / Exclusão de DARM
Descrição: Nova tela de alteração de valores e exclusão de DARM geradas;
Pendência: 22699
Tela     : Gerações | Lançamentos de Outros Sistemas | Busca / Desfazer Busca do Contas a Pagar
Descrição: Nova tela de busca do CaP, com todos os impostos;
Pendência: 22699
Tela     : Lançamentos | Alteração / Exclusão de GPS
Descrição: Nova tela de alteração de valores e exclusão de GPS geradas;
================================================================================
CM$VER      3.12.00f    04/04/2007
--------------------------------------------------------------------------------
Pendência: 22661
Tela     : Sistema \ Configuração \ Parâmetros do Sistema
Descrição: Retirada da tela o parâmetro "Alteradores para Integração do IRRF do CaR" que não é mais
           mais utilizada no sistema.
Pendência: 23989
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto no processo de busca da folha de benefícios para que a atualização dos dados na
           histrubsal seja feita também pela natureza de rendimento.
================================================================================
CM$VER      3.12.00e    29/03/2007
--------------------------------------------------------------------------------
Pendência: 24193
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto para buscar os valores pagos pelo módulo da folha de pagamento
Pendência: 24505
Tela     : Gerações \ Dirf
Descrição: Tratar valor retido e valor mínimo de rendimento separadamente.
Pendência: 24805
Tela     : Consultas \ Relatórios \ Demonstrativos \ Demonstrativo Anual para Contribuição Facultativa
Descrição: Tratar valor retido e valor mínimo de rendimento separadamente.
================================================================================
CM$VER      3.12.00d    21/03/2007
--------------------------------------------------------------------------------
Pendência: 24819
Tela     : Gerações \ DARF
Descrição: Correção no filtro de natureza em caso de residentes no exterior
================================================================================
CM$VER      3.12.00c    16/03/2007
--------------------------------------------------------------------------------
Pendência: 24425
Tela     : Gerações \ DARF
Descrição: Ajuste na busca do Darf com Depósito Judicial
================================================================================
CM$VER      3.12.00b    06/03/2007
--------------------------------------------------------------------------------
Pendência: 24642
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Contas a Pagar \ IRRF
Descrição: Ajuste na busca de outros sistemas (Contas a Pagar) no IRRF.
================================================================================
CM$VER      3.12.00a    01/03/2007
--------------------------------------------------------------------------------
Pendência: 24546
Tela     : Consulta \ Impressão do Informe de Rendimento P.F.
Descrição: Correção do endereço que estava vindo errado no arquivo txt do infomre.
Pendência: 24543
Tela     : Consulta \ Impressão do Informe de Rendimento P.F.
Descrição: Correção no retorno do Codigo Natureza no Arquivo TXT do Infome.
Pendência: 21820
Tela     : Gerações \ DCTF
Descrição: Nova tela para geração do arquivo da DCTF 1.3
================================================================================
CM$VER      3.12.00     12/02/2007
--------------------------------------------------------------------------------
Versão para liberação do padrão 5.10.14
Pendência: 21875
Tela     : Sistema \ Configuração \ Parâmetros do Sistema
Descrição: Permite parametrizar a geração do documento de DARF por subplano.
Pendência: 22790
Tela     : Lançamentos \ Lançamentos no IRRF
Descrição: Ajuste na criação da lista de documentos do Contas a Pagar vinculados ao benefíciario selecionado para a inclusão do lançamento.
================================================================================
CM$VER      3.11.07j    12/02/2007
--------------------------------------------------------------------------------
Pendência: 21576 (Reabertura)
Tela     : Gerações \ Dirf
Descrição: Ao gerar um registro de depósito judicial, não imprimir o código 7431 nem o 7416. Fazer este tratamento na consulta.
================================================================================
CM$VER      3.11.07i    07/02/2007
--------------------------------------------------------------------------------
Pendência: 24418
Tela     : Consultas \ Relatório \ Demonstrativo para Imposto de Renda para Facultativos
Descrição: Alteração na busca das informações do informe de contribuição facultativas.
Pendência: 20708 (Reabertura)
Tela     : Informe de Rendimento de Pessoa Física
Descrição: Fazer a crítica somente por endereço de correspondência.
Pendência: 24428
Tela     : Informe de Rendimento de Pessoa Física
Descrição: Correção do layout do arquivo TXT de pensão alimentícia.
Pendência 24447
Tela     : Informe de Rendimento de Pessoa Física
Descrição: Acerto para não buscar os registros de pensão alimentícia estornados;
================================================================================
CM$VER      3.11.07h    07/02/2007
--------------------------------------------------------------------------------
Pendência: 24427
Tela     : Informe de Rendimento de Pessoa Física
Descrição: Tratar ação judicial separadamente de pensão alimentícia.
================================================================================
CM$VER      3.11.07g    02/02/2007
--------------------------------------------------------------------------------
Pendência: 24386
Tela     : Informe de Rendimento de Pessoa Física
Descrição: Acerto no informe de rendimentos para pensão alimentícia. (Específico da fundação Funcef).
================================================================================
CM$VER      3.11.07f    31/01/2007
--------------------------------------------------------------------------------
Pendência: 20708
Tela     : Informe de Rendimento de Pessoa Física
Descrição: Fazer a crítica somente por endereço de correspondência.
================================================================================
CM$VER      3.11.07e    30/01/2007
--------------------------------------------------------------------------------
Pendência: 24302
Tela     : Informe de Rendimento de Pessoa Física
Descrição: Alteração para contemplar a natureza de rendimento 5565 no informe.
================================================================================
CM$VER      3.11.07d    19/01/2007
--------------------------------------------------------------------------------
Pendência: 23062
Tela     : Informe de Rendimento de Pessoa Física
Descrição: Melhora na performance da geração do arquivo de Informe
Pendência: 23931
Tela     : Gerações \ Dirf
Descrição: Acerto para mostrar os valores dos impostos para csll/pis/cofins
Pendência: 24258
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Usar no informe de rendimentos a data de pagamento e não mais a data de lançamento.
================================================================================
CM$VER      3.11.07c    18/01/2007
--------------------------------------------------------------------------------
Pendência: 24220
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto para buscar no mês apenas o valor de dedução por idade da versão de pagamento do mês deixando de fora a dedução sobre o 13º.
Pendência: 24221
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Alteração na forma de testar se a pessoa é idosa ou não.
Pendência: 24222
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto na gravação do valor de dedução por idade quando a pessoa tem dois benefícios.
================================================================================
CM$VER      3.11.07b    13/01/2007
--------------------------------------------------------------------------------
Pendência: 23696 (Reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto para rotina de folha de pagamento, que não estava sendo processada. Acerto para tratar a data de nascimento do participante.
Pendência: 23849
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Para o processamento da folha de pagamento só obrigar parametrização contábil da rubrica de imposto de renda.
================================================================================
CM$VER      3.11.07a    21/12/2006
--------------------------------------------------------------------------------
Pendência: 24036
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto da busca do mês que paga abono. O processo estava em "looping".
================================================================================
CM$VER      3.11.07     14/12/2006
--------------------------------------------------------------------------------
Versão para liberação do padrão 5.10.13
Pendência: 17373
Tela     : Consulta \ Relatório \ IRRF \ Operacional \ Composição do DARF
Descrição: Novo relatório com a composição do DARF
Pendência: 18950
Tela     : Cadastros \ Tabela Regressiva de IRRF
Descrição: Novo cadastro de tabela regressiva de IR.
Pendência: 20984
Tela     : Gerações \ Darf
Descrição: Opção para emissão de documento de Darf judicial por estado.
Pendência: 21876
Tela     : Gerações \ Darf
Descrição: Permitir que o usuário defina uma nova data de pagamento do DARF, para se fazer a geração semanal de IR.
Pendência: 22156
Tela     : Gerações \ Lançamento de outros sistemas \ Fazer busca \ Contas a Pagar \ INSS
Descrição: Implementação para fazer a busca de impostos com tratamento fiscal que somente se calcule o valor do fornecedor.
Pendência: 22653
Tela     : Gerações \ GPS
Descrição: Criação de nova tela para a geração da GPS.
Pendência: 22655
Tela     : Gerações \ GPS
Descrição: Utilização de nova estrutura para geração do documento de INSS.
Pendência: 22713
Tela     : Gerações \ RET
Descrição: Exclusão do item de menu RET.
Pendência: 22791
Tela     : Buscas
Descrição: Utilização de nova estrutura para a busca dos impostos do Contas a Pagar.
Pendência: 23599
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Desfazer Busca \ Folha de Pagamento / Benefícios
Descrição: Ajustes para não permitir que o processo seja desfeito parcialmente
Pendência: 23914
Tela     : Gerações \ Darf
Descrição: Alteração do período de apuração e data de recolhimento do IRRF somente para dezembro de 2006, que será por decênio neste mês.
================================================================================
CM$VER      3.11.06e    22/11/2006
--------------------------------------------------------------------------------
Pendência: 23773
Tela     : Consulta \ Relatórios \ Oficiais \ Emissão de DARF - Depósito Judicial e Extrajudicial
Descrição: Ajuste no layout para incluir campo "14 - Num. Referencia". Este campo fica em branco.
================================================================================
CM$VER      3.11.06d    20/11/2006
--------------------------------------------------------------------------------
Pendência: 23784
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto na execução do processo geral.
================================================================================
CM$VER      3.11.06c    08/11/2006
--------------------------------------------------------------------------------
Pendência: 23696
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Não processar rubricas que seja do tipo especial para folha de benefícios.
================================================================================
CM$VER      3.11.06b    06/11/2006
--------------------------------------------------------------------------------
Pendência: 23668
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto na query principal pois estava duplicando o valor para quem tinha Imposto de Reda em planos diferentes.
Pendência: 23686
Tela     : Gerações \ Darf
Descrição: Ao gerar documentos individuais para o Darf de depósito judicial, verificar se a pessoa tem registro no cadastro de fornecedor. Senão tiver, inserir.
================================================================================
CM$VER      3.11.06a    09/10/2006
--------------------------------------------------------------------------------
Pendência: 22112
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Desfazer Busca \ Contas a Pagar \ INSS
Descrição: Implementação da tela de desfazer INSS gerado no contas a pagar.
================================================================================
CM$VER      3.11.06     05/10/2006
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.12.
================================================================================
CM$VER      3.11.05i    05/10/2006
--------------------------------------------------------------------------------
Pendência: 19152
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Permitir fazer a busca individualmente para folha de pagamento.
Pendência: 19153
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Permitir desfazer a busca individualmente para folha de pagamento.
================================================================================
CM$VER      3.11.05h    03/10/2006
--------------------------------------------------------------------------------
Pendência: 20939 (Reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto para buscar corretamente décimo terceiro.
================================================================================
CM$VER      3.11.05g    29/09/2006
--------------------------------------------------------------------------------
Pendência: 21074
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto para gravar o valor na linha correta de moléstia grave.
Pendência: 21145
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Verificar se a pessoa é isenta no histórico de rubricas salariais.
Pendência: 21633
Tela     : Consultas \ Relatórios \ IRRF \ Demonstrativos \ Demonstrativo para Imposto de Renda para Facultativo
Descrição: Implementação do novo layout.
Pendência: 22272
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Permitir a busca por plano previdenciário contábil.
Pendência: 23234 (Reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Empréstimo \ IOF
Descrição: Acerto para não duplicar o item de devolução de IOF.
Pendência: 23365
Tela     : Cadastros \ Histórico de Parâmetros do Imposto de Renda
Descrição: Só testar a data início de vigência ao inserir um novo registro.
================================================================================
CM$VER      3.11.05f    14/09/2006
--------------------------------------------------------------------------------
Pendência: 20938
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Deduzir a parcela de 65 anos.
Pendência: 20939
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Implementação para lançamento da linha de informe de rendimento de ação judicial que tenha percentual abaixo de 100.
Pendência: 21071
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto para buscar todas as rubricas de décimo terceiro.
Pendência: 21146
Tela     : Gerações \ Compensa Valor Negativo da Busca
Descrição: Criação de nova tela para fazer a compensação referente a valores negativos gerados na busca.
Pendência: 21529
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Contas a Pagar \ CSLL/PIS/COFINS
Descrição: Acerto para gravar o valor base cheio e não mais o valor rateado por imposto.
================================================================================
CM$VER      3.11.05e    12/09/2006
--------------------------------------------------------------------------------
Pendência: 23234
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Empréstimo \ IOF
Descrição: Acerto para não duplicar o item de devolução de IOF.
================================================================================
CM$VER      3.11.05d    08/09/2006
--------------------------------------------------------------------------------
Pendência: 23194
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Desfazer Busca \ Empréstimo - IOF
Descrição: Acerto para não desfazer busca de IOF se o Darf tiver sido gerado.
================================================================================
CM$VER      3.11.05c    05/09/2006
--------------------------------------------------------------------------------
Pendência: 23229
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca / Defazer Busca \ Folha de Pagamento / Benefícios
Descrição: Alteração para buscar ação judicial do tipo de correção da tabela de IRRF.
Pendência: 23236
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca / Defazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto para geração do ISS para identificar o plano de contas para gerar a contabilização.
Pendência: 23258
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca / Defazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto na busca de folha de pagamento.
================================================================================
CM$VER      3.11.05b    29/08/2006
--------------------------------------------------------------------------------
Pendência: 23188
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca / Defazer Busca \ Folha de Pagamento / Benefícios
Descrição: Melhoria de performance ao buscar uma pessoa para processamento individual.
================================================================================
CM$VER      3.11.05a    24/08/2006
--------------------------------------------------------------------------------
Pendência: 23143
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Empréstimo \ IOF
Descrição: Implementação para buscar item de devolução. 
================================================================================
CM$VER      3.11.05     10/08/2006
--------------------------------------------------------------------------------
Liberação de versão no padrão 5.10.11
================================================================================
CM$VER      3.11.04     12/07/2006
--------------------------------------------------------------------------------
Liberação de versão no padrão 5.10.10.
================================================================================
CM$VER      3.11.03f    09/08/2006
--------------------------------------------------------------------------------
Pendência: 22927
Tela     : Gerações / Darf
Descrição: Acertar a data de vencimento para o Darf de CSLL/PIS/COFINS.
Pendência: 23036
Tela     : Consultas / Relatórios / IRRF / Operacionais /Relatório de Darf's gerados
Descrição: Acerto para contemplar os valores de IOF, PIS, COFINS e CSLL.
================================================================================
CM$VER      3.11.03e    17/07/2006
--------------------------------------------------------------------------------
Pendência: 22863
Tela     : Gerações / Darf
Descrição: Passar a data programada na inserção do documento do Darf para que seja testado se a disponibilidade está bloqueada ou não.
================================================================================
CM$VER      3.11.03d    23/06/2006
--------------------------------------------------------------------------------
Pendência: 21142
Tela     : Cadastros / Linha para o Informe de Rendimento
Descrição: Acerto no nome do check de "Linha se refere a Rendimento Bruto" para "Linha se refere a Rendimento Bruto para Base de IR".
================================================================================
CM$VER      3.11.03c    21/06/2006
--------------------------------------------------------------------------------
Pendência: 22301
Tela     : Lançamentos \ Lançamentos no IRRF
Descrição: Acerto para quando alterar alguma informação na tela, não perder o códido do centro de responsabilidade.
================================================================================
CM$VER      3.11.03b    02/06/2006
--------------------------------------------------------------------------------
Pendência: 21705 (Reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Correção na busca de registros da Folha de Benefícios que sempre apresentava problema na fase verificação.
================================================================================
CM$VER      3.11.03a    26/05/2006
--------------------------------------------------------------------------------
Pendência: 22342
Tela     : Gerações/Lançamento outros sistemas/Fazer busca/Contas a Pagar e Gerações/Darf para PIS/COFINS/CSLL
Descrição: Na geração do documento a pagar do imposto, quando a baixa é apenas numa conta contábil não utilizou a conta contábil do alterador, mas a conta do tipo de desembolso vinculado a natureza de rendimento. Alteração foi realizada para que em qualquer situação de baixa utilize a conta contábil do alterador.
================================================================================
CM$VER      3.11.03     11/05/2006
--------------------------------------------------------------------------------
Liberação de versão no padrão 5.10.09.
================================================================================
CM$VER      3.11.02l    11/05/2006
--------------------------------------------------------------------------------
Pendência: 21705 (Reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Na busca da folha de pagamento, buscar a parametrização contábel/financeiro parametrizadas no sistema da folha de pagamento.
Pendência: 22174
Tela     : Gerações \ Contas a Pagar do INSS \ Geração do INSS
Descrição: Acerto para mostrar mensagem completa na tela, caso o processo não seja executado.
Pendência: 22203
Tela     : Gerações \ Darf
Descrição: Acerto na data de vencimento do IOF.
================================================================================
CM$VER      3.11.02k    19/04/2006
--------------------------------------------------------------------------------
Pendência: 21544
Tela     : Gerações \ Lançamento de outros sistemas \ Fazer busca \ Contas a Pagar \ INSS
Descrição: Implementar a tela de busca em 3 camadas.
Pendência: 21577
Tela     : Gerações \ Lançamento de outros sistemas \ Fazer busca \ Contas a Pagar \ INSS
Descrição: Gravar na lancxinforme o valor da base do INSS.
Pendência: 22015
Tela     : Gerações \ Contas a Pagar do INSS \ Geração do INSS
Descrição: Não permitir agrupar somente por data.
Pendência: 22106
Tela     : Consultas \ Impressão do Informe de Rendimento de P.F.
Descrição: Acerto na query que busca pessoas de pensão alimentícia, para a geração individual.
Pendência: 22063
Tela     : Lançamentos \ Lançamentos no Darf
Descrição: Acerto para permitir lançar alterador de multa, juro e desconto.
Pendência: 22071
Tela     : Gerações \ Darf
Descrição: Alterar o período de apuração de CSLL/PIS/COFINS, segundo a Lei 11196 de 21/11/2005.
================================================================================
CM$VER      3.11.02j    10/04/2006
--------------------------------------------------------------------------------
Pendência: 21709 (Reabertura)
Tela     : Lançamentos \ Lançamentos no Darf
Descrição: Acerto na exclusão do darf para excluir também o documento gerado pelo processo.
================================================================================
CM$VER      3.11.02i    06/04/2006
--------------------------------------------------------------------------------
Pendência: 18883
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Desfazer Busca \ Folha de Pagamento / Benefícios
Descrição: Alteração da tela para permitir desfazer a busca pelo natureza de rendimento.
Pendência: 21365
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto para gravar os registros de estorno que não estavam sendo atualizados no histórico de rubricas salariais.
Pendência: 21366
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Comparar apenas mês e ano da data de pagamento com o mês e ano da data de nascimento para lançar a linha do informe de dedução por idade.
Pendência: 21705
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Na busca da folha de pagamento, buscar a parametrização contábel/financeiro parametrizadas no sistema da folha de pagamento.
Pendência: 21709
Tela     : Lançamentos \ Lançamentos no Darf
Descrição: Acerto na exclusão do darf para excluir também o documento gerado pelo processo.
Pendência: 21933
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Contas a Pagar \ CSLL/PIS/COFINS
Descrição: Acerto na busca de CSLL/PIS/COFINS para gravar os campos de contas contábeis corretamente para serem usadas na geração darf.
Pendência: 21942
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Desfazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto para gravar no histórico de rubricas salariais para a folha de pagamento, o campo que indica se a busca foi desfeita.
================================================================================
CM$VER      3.11.02h    23/03/2006
--------------------------------------------------------------------------------
Pendência: 21445
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto para não duplicar o valor da dedução por idade.
================================================================================
CM$VER      3.11.02g    21/03/2006
--------------------------------------------------------------------------------
Pendência: 21131
Tela     : Gerações \ Darf
Descrição: Ao gerar um darf gravar atividade e projeto parametrizado e não -1.
================================================================================
CM$VER      3.11.02f    10/03/2006
--------------------------------------------------------------------------------
Pendência: 21724
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios e
           Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Empréstimo \ IOF
Descrição: Ao entrar nas telas de busca, mostrar as datas de acordo com o imposto.
================================================================================
CM$VER      3.11.02e    09/03/2006
--------------------------------------------------------------------------------
Pendência: 20398 (Reabertura)
Tela     : Gerações \ Darf
Descrição: Gravar o documento em nome do participante caso seja documentos individuais de depósito judicial.
================================================================================
CM$VER      3.11.02d    06/03/2006
--------------------------------------------------------------------------------
Pendência: 21442
Tela     : Gerações \ Darf
Descrição: Trazer a data de vencimento e a data de apuração corretamente.
================================================================================
CM$VER      3.11.02c    16/02/2006
--------------------------------------------------------------------------------
Pendência: 21550
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Não buscar os registros que tiverem flgestorno = null, quando for processar os registros de irrf estornados.
Pendência: 21569
Tela     : Lançamentos \ Lançamentos no IRRF
Descrição: Acerto para mostrar no combo de módulo responsável o módulo Contas a Pagar.
Pendência: 21573
Tela     : Consultas \ Impressão do Informe de Rendimentos
Descrição: Trazer no informe os registros gerados pela busca do INSS.
Pendência: 21576
Tela     : Gerações \ Dirf
Descrição: Ao gerar um registro de depósito judicial, não imprimir o código 7431 nem o 7416.
================================================================================
CM$VER      3.11.02b    13/02/2006
--------------------------------------------------------------------------------
Pendência: 18911
Tela     : Gerações \ Lançamento de outros sistemas \ Fazer busca \ Contas a Pagar \ INSS
Descrição: Nova tela para gerar a busca do INSS.
Pendência: 21320 (Reabertura)
Tela     : Gerações \ Darf
Descrição: Ajuste na geração do Darf.
================================================================================
CM$VER      3.11.02a    08/02/2006
--------------------------------------------------------------------------------
Pendência: 18801 (reaberta)
Tela     : Gerações \ Dirf
Descrição: Corrigir o layout do arquivo da DIRF conforme anexo.
Pendência: 21320
Tela     : Gerações \ Lançamento de outros sistemas \ Fazer busca \Contas a Pagar \ CSLL/PIS/COFINS
Descrição: Quando se tem vários impostos separados, gerando 3 bases na lancirrf, não se pode somar a base no comprovante de rendimento/DIRF.
Pendência: 21490
Tela     : Consultas \ impressão do informe de rendimento de P.F.
Descrição: Realizar a busca dos dados para geração do informe, através do campo idmodulorespon gravado no lançamento do IR. (Ex.: Um funcionário que foi lançado no IR, ao tentar gerar o informe, não era impresso nada, devido o idmodulo ser do IRRF e não da Folha de funcionário)
Pendência: 21496
Tela     : Gerações \ Lançamento de outros sistemas \ Fazer busca \ Contas a Pagar \ IRRF
Descrição: Para documentos do CAP/CAR, não efetuar a busca dos lançamentos de imposto estornados.
================================================================================
CM$VER      3.11.02     07/02/2006
--------------------------------------------------------------------------------
Liberação de versão no padrão 5.10.08.
================================================================================
CM$VER      3.11.01o    06/02/2006
--------------------------------------------------------------------------------
Pendência: 21470
Tela     : Gerações \ Contas a Pagar \ Geração do ISS
Descrição: Acerto no arredondamento na geração do iss do contas a pagar.
================================================================================
CM$VER      3.11.01n    01/02/2006
--------------------------------------------------------------------------------
Pendência: 20960 (Reabertura)
Tela     : Consultas \ Relatórios \ IRRF \ Oficiais \ Comprovante Anual de Retenção de IRPJ CSLL, Cofins e PIS/Pasep (Lei nº 9.430, de 1996, art. 64)
Descrição: Acerto para buscar o valor da base corretamente.
Pendência: 21364
Tela     : Consultas \ Informe de Rendimento
Descrição: Filtrar na query que busca os valores de décimo terceiro pagos ao consignatário as rubricas não informativas.
Pendência: 21428
Tela     : Consultas \ Informe de Rendimento
Descrição: Considerar todos informes na busca de valores de planos de saúde, odontológicos e etc.
Pendência: 21429
Tela     : Consultas \ Informe de Rendimento
Descrição: Acerto para trazer o valor do décimo terceiro pago ao consignatário.
================================================================================
CM$VER      3.11.01m    24/01/2006
--------------------------------------------------------------------------------
Pendência: 21328
Tela     : Gerações \ Darf
Descrição: Alterar o período de apuração do IOF de 7 para 10 dias, segundo a Lei 11196 de 21/11/2005.
================================================================================
CM$VER      3.11.01l    20/01/2006
--------------------------------------------------------------------------------
Pendência: 21299
Tela     : Gerações \ Dirf
Descrição: Acerto para filtrar na query pelo idmodulo corretamente.
================================================================================
CM$VER      3.11.01k    20/01/2006
--------------------------------------------------------------------------------
- Pendencia 21088: Correção na dedução por idade no rendimento 13º
- Pendencia 21148: Correção na dedução por idade no rendimento mensal
================================================================================
CM$VER      3.11.01j    17/01/2006
--------------------------------------------------------------------------------
Pendência: 20960
Tela     : Consultas \ Relatórios \ IRRF \ Oficiais \ Comprovante Anual de Retenção de IRPJ CSLL, Cofins e PIS/Pasep (Lei nº 9.430, de 1996, art. 64)
Descrição: Criação do relatório de retenção de CSLL, PIS e Cofins.
================================================================================
CM$VER      3.11.01i    16/01/2006
--------------------------------------------------------------------------------
Pendência: 21254
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Alteração na tela, para permitir fazer a busca filtrando também por rubrica(s).
================================================================================
CM$VER      3.11.01h    10/01/2006
--------------------------------------------------------------------------------
Pendência: 21192
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto na query para tratar o motivo corretamente.
================================================================================
CM$VER      3.11.01g    03/01/2006
--------------------------------------------------------------------------------
Pendência: 19963
Tela     : Consultas \ Impressão do Informe de Rendimento P.F.
Descrição: Utilizar a lista de recebedores para gerar arquivo texto individual.
Pendência: 20708
Tela     : Consultas \ Impressão do Informe de Rendimento P.F.
Descrição: Gerar arquivo de crítica para quem não tiver endereço de correspondência cadastrado.
Pendência: 21171
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Mostrar mensagem de erro de parametrização para busca de cada módulo.
================================================================================
CM$VER      3.11.01f    26/12/2005
--------------------------------------------------------------------------------
Pendência: 20398
Tela     : Gerações \ Darf
Descrição: Gravar o documento em nome do participante caso seja documentos individuais de depósito judicial.
Pendência: 20594
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Passar a gravar o campo data de pagamento para utilizá-lo na dirf.
Pendência: 21128
Tela     : Gerações \ Darf
Descrição: Acerto para gravar o tipo de desembolso correto na geração do darf.
================================================================================
CM$VER      3.11.01e    20/10/2005
--------------------------------------------------------------------------------
Pendência: 20460
Tela     : Gerações \ Dirf
Descrição: Acerto na geração de todas as naturezas de rendimento.
================================================================================
CM$VER      3.11.01d    07/10/2005
--------------------------------------------------------------------------------
Pendência: 19187 (Reabertuta)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Não buscar a conta contábil para rubricas informativas da folha.
Pendência: 19596 (Reabertura)
Tela     : Gerações \ Darf
Descrição: Gerar apenas um darf de depósito judicial para cada pessoa.
Pendência: 20201
Tela     : Gerações \ Dirf
Descrição: Gravar na dirf, também as pessoas que têm somente exigibilidade suspensa.
================================================================================
CM$VER      3.11.01c    14/09/2005
--------------------------------------------------------------------------------
Pendência: 20156
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Gravar corretamente o valor da dedução de dependente de décimo terceiro.
================================================================================
CM$VER      3.11.01b    12/09/2005
--------------------------------------------------------------------------------
Pendência: 20125
Tela     : Consultas \ Impressão do Informe de Rendimento P.F.
Descrição: Utilizar rubricas de desconto/provento para informar valores recebido pela consignatária.
Pendência: 20195
Tela     : Gerações \ Darf
Descrição: Acerto na geração de darf para a natureza de 1708.
================================================================================
CM$VER      3.11.01a    05/09/2005
--------------------------------------------------------------------------------
Pendência: 19596
Tela     : Gerações \ Darf
Descrição: Gerar apenas um darf de depósito judicial para cada pessoa.
================================================================================
CM$VER      3.11.01     30/08/2005
--------------------------------------------------------------------------------
Liberação de versão no padrão 5.10.07.
================================================================================
CM$VER      3.11.00g    30/08/2005
--------------------------------------------------------------------------------
Pendência: 19566 (Desfeita)
Tela     : Gerações \ Darf
Descrição: Pendência cancelada.
================================================================================
CM$VER      3.11.00f    17/08/2005
--------------------------------------------------------------------------------
Pendência: 19450 (Reabertura)
Tela     : Consultas \ Relatórios \ IRRF \ Oficiais \ Emissão de DARF - Depósitos Judiciais e Extrajudiciais
Descrição: Acerto para mostrar a identificação na 2ª via também.
================================================================================
CM$VER      3.11.00e    11/08/2005
--------------------------------------------------------------------------------
Pendência: 19615
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Empréstimo \ IOF
Descrição: Alteração para mostrar a data de domingo e não mais de segunda.
Pendência: 19855
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Contas a Pagar \ IRRF
Descrição: Buscar alteradores no documento de origem ou em documentos englobados.
================================================================================
CM$VER      3.11.00d    14/07/2005
--------------------------------------------------------------------------------
Pendência: 19674 (Reabertura)
Tela     : Gerações \ Darf
Descrição: Foi criado um parâmetro para que cada fundação escolha se quer gerar apenas um documento de darf de depósito judicial ou se deseja gerar um documento para cada darf de depósito judicial.
================================================================================
CM$VER      3.11.00c    12/07/2005
--------------------------------------------------------------------------------
Pendência: 19674 (Reabertura)
Tela     : Gerações \ Darf
Descrição: Gerar apenas um documento para cada darf de depósito judicial.
================================================================================
CM$VER      3.11.00b    12/07/2005
--------------------------------------------------------------------------------
Pendência: 19566
Tela     : Gerações \ Darf
Descrição: Buscar o tipo de desembolso parametrizado na tela de natureza de rendimento ou dos parâmetros do próprio sistema.
Pendência: 19674
Tela     : Gerações \ Darf
Descrição: Gerar apenas um documento para darf de depósito judicial.
================================================================================
CM$VER      3.11.00a    22/06/2005
--------------------------------------------------------------------------------
Pendência: 19450
Tela     : Consultas \ Relatórios \ IRRF \ Oficiais \ Emissão de DARF - Depósitos Judiciais e Extrajudiciais
Descrição: Acerto para respeitar o formato escolhido pelo usuário no cadastro de banco.
================================================================================
CM$VER      3.11.00     07/06/2005
--------------------------------------------------------------------------------
Pendência: 19025
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Contas a Pagar \ INSS
Descrição: Buscar o tipo de desembolso do alterador.
Pendência: 19101
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Não permitir estorno de um lançamento de ano anterior ao ano do estorno do IRRF.
Pendência: 19102
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Não permitir estorno de um lançamento de décimo terceiro.
================================================================================
CM$VER      3.10.06m    06/06/2005
--------------------------------------------------------------------------------
Pendência: 19122 (Reabertura)
Tela     : Geração \ Darf
Descrição: Acerto no rateio.
Pendência: 19187 (Reabertura)
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Gravar o plano de contas na geração da busca do IR.
================================================================================
CM$VER      3.10.06l    06/06/2005
--------------------------------------------------------------------------------
Pendência: 19414
Tela     : Gerações \ Contas a Pagar do INSS \ Geração do INSS
Descrição: Acertar a diferença no rateio quando houver.
================================================================================
CM$VER      3.10.06k    03/06/2005
--------------------------------------------------------------------------------
Pendência: 19348
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Passar a buscar o idmotivo de abono, somente quando a rubrica de ir (FlgTipoDesc = 'I' e FlgTipoDesc = 'K') referente a abono.
================================================================================
CM$VER      3.10.06j    17/05/2005
--------------------------------------------------------------------------------
Pendência: 19259
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Acerto para fazer a busca de quem tem somente uma fonte pagadora.
================================================================================
CM$VER      3.10.06i    06/05/2005
--------------------------------------------------------------------------------
Pendência: 18801
Tela     : Gerações \ Dirf
Descrição: Correção do layout.
Pendência: 18660
Tela     : Consulta \ Impressão do Informe de Rendimento P. F.
Descrição: Acerto na impressão do informe, quando não é indicado o cpf.
Pendência: 18766
Tela     : Gerações \ Contas a Pagar do ISS \ Geração do ISS
Descrição: Permitir geração do ISS, mesmo que o documento não tenha sido baixado.
Pendência: 18904
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Não buscar rubricas com valor zerado em situações desnecessárias.
Pendência: 19122 (Reabertura)
Tela     : Geração \ Darf
Descrição: Acerto no rateio.
Pendência: 19161
Tela     : Gerações \ Dirf
Descrição: Acerto na geração da Dirf para evitar duplicidade.
Pendência: 19179
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Empréstimo \ IOF
Descrição: Selecionar todos os contratos que tem IOF, exceto os cancelados, e não apenas os que estão em andamento.
Pendência: 19187
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento / Benefícios
Descrição: Gravar o plano de contas na geração da busca do IR.
================================================================================
CM$VER      3.10.06h    03/05/2005
--------------------------------------------------------------------------------
Pendência: 19174
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Contas a Pagar \ CSLL/PIS/COFINS
Descrição: Acerta a diferença de centavos na busca.
================================================================================
CM$VER      3.10.06g    02/05/2005
--------------------------------------------------------------------------------
Acerto na geração do Darf de depósito judicial.
================================================================================
CM$VER      3.10.06f    02/05/2005
--------------------------------------------------------------------------------
Pendência: 19122 (Rabertura)
Tela     : Gerações / Darf
Descrição: Acerto no rateio.
================================================================================
CM$VER      3.10.06d    27/04/2005
--------------------------------------------------------------------------------
Pendência: 19099
Tela     : Gerações / Darf 
Descrição: Acerto na geração do Darf, para gerar somente o que estiver marcado, independente da situação ou natureza de rendimento.
================================================================================
CM$VER      3.10.06c    27/04/2005
--------------------------------------------------------------------------------
Pendência: 18905
Tela     : Gerações / Darf 
Descrição: Possibilitar a geração de mais de mil Darf 's de depósito judicial.
Pendência: 19098
Tela     : Gerações / Darf
Descrição: Apresentar o nome do beneficiário quando for um registro de estorno.
Pendência: 19100
Tela     : Gerações / Darf
Descrição: Não permitir a geração do Darf com o campo Valor Total negadativo.
Pendência: 19122
Tela     : Gerações / Darf
Descrição: Acerto no rateio por plano.
Pendência: 19130
Tela     : Gerações / Contas a Pagar do INSS / Geração do INSS
Descrição: Acerto na geração do INSS.
================================================================================
CM$VER      3.10.06b    20/04/2005
--------------------------------------------------------------------------------
Pendência: 19064
Tela     : Gerações \ Lançamentos de Outros Sistemas \ Fazer Busca \ Folha de Pagamento/Benefício
Descrição: Implementado o parâmetro para dizer se a busca usará ou não o código da natureza e infrome de rendimento do cadastro de rubricas.
================================================================================
CM$VER      3.10.06a    18/04/2005
--------------------------------------------------------------------------------
Pendência: 19007
Tela     : Gerações \ Darf
Descrição: Acerto na geração de múltiplas contas de baixa do documento gerado no DARF.
Pendência: 19052
Tela     : Busca Estornos da Folha de Benefícios
Descrição: Ajuste na busca de IR para rubricas estornadas pela Folha de Benefícios, quando não ocorreu geração de nova versão de pagamento.
================================================================================
CM$VER      3.10.06     8/04/2005
--------------------------------------------------------------------------------
Pendência: 18639
Tela     : Lançamento de Outros sistemas / Fazer busca / Folha de Pagamento / Beneficios
Descrição: Na busca das informações para a Natureza 3223, na tabela lancirrf, o campo PLACONTARECDES está vindo nulo.
Pendência: 18793
Tela     : Busca do IOF
Descrição: Acertar a gravaçào do plano contábil de acordo com a tradução da tabela PLANPREVXCONTABIL.
Pendência: 18915
Tela     : Gerações/DARF
Descrição: No rateio do documento gerado referente ao pagamento de IOF pelo módulo IRRF, o sistema deverá considerar como tipo de desembolso o parametro cadastrado na Natureza de rendimento, neste caso 7893.
Pendência: 18925
Tela     : Gerações/Lançamentos de Outros Sistemas/Fazer Busca/Folha de Pagamento/Benefícios
Descrição: Ao fazer a busca do IR Rendimento Assalariado, cód 0561, os registros estão vindo todos duplicados, impactando na geração do darf. 
Pendência: 18966
Tela     : Consulta/Impressão/Informe de Rendimentos Pessoa Física
Descrição: Acerto na impressão de informe quando marcada a opção "pensão alimentícia".
Pendência: 18976
Tela     : Gerações/Lançamentos de Outros Sistemas/Fazer Busca/Folha de Benefícios
Descrição: Gravar o campo CodCentroCusto na LancIRRF.
================================================================================
CM$VER      3.10.05v    24/03/2005
--------------------------------------------------------------------------------
- Pendencia 18903 - Acerto na inserção de Rateio ao gerar um Darf de depósito judicial.
================================================================================
CM$VER      3.10.05u    16/03/2005
--------------------------------------------------------------------------------
- Pendencia 18047 - Acerto na tela de Lançamento de DARF no que se refere a exclusão de DARF 
- Pendencia 16807 - Acerto na tela de Exclusão de DARF de Depósito Judicial
================================================================================
CM$VER      3.10.05t    16/03/2005
--------------------------------------------------------------------------------
- Pendencia 18782 - Retirada a obrigatoriedade da existência do IDINFORME na HISTRUBSAL para folha de pagamento.
- Pendencia 18787 - Gravar o campo IDMODULORESPON sendo o do módulo de origem da informação.
- Pendencia 18790 - Separação da impressão do Informe de Rendimentos de Pensão Alimentícia dos demais informes.
- Pendencia 18793 - Acerto na gravação do plano contábil na busca do IOF.
- Pendencia 18819 - Criação do parâmetro de Centro de Custo para o IOF.
                               O mesmo deve ser informado na tela de Parâmetros do Sistema, para
                               que seja utilizado na busca do IOF.
================================================================================
CM$VER      3.10.05s    08/03/2005
--------------------------------------------------------------------------------
- Pendencia 18793 - Acerto na gravação do plano contabil na busca do IOF
================================================================================
CM$VER      3.10.05n    15/02/2005
--------------------------------------------------------------------------------
- Pendencia 18649 - Acerto na busca da folha de beneficios pra levar em 
   consideracao as rubricas informativas (FLGDESCONTO = 2) conforme a 
   parametrização da linha de informe correspondente, se natureza positiva ou
   negativa
- Acerto no lançamento de valores de dedução de R$100,00 nos meses de agosto a dezembro/2004,
  para levar em consideração multiplas fontes pagadoras.
================================================================================
CM$VER      3.10.05m    14/02/2005
--------------------------------------------------------------------------------
- Acerto no informe de rendimentos
================================================================================
CM$VER      3.10.05l    11/02/2005
--------------------------------------------------------------------------------
- Pendencia 18145 - Impressao de informe de rendimentos:
  Criada opção de importar arquivo com lista de matrículas. 
  Para informar o arquivo, basta clicar com botão direito do mouse sobre a lista de matrículas
================================================================================
CM$VER      3.10.05k    04/02/2005
--------------------------------------------------------------------------------
- Alterada a tela de Busca de Folha para informar data inicial e data final para a busca.
================================================================================
CM$VER      3.10.05j    02/02/2005
--------------------------------------------------------------------------------
- Ajuste na tela de Parametros do Sistema para evitar erro de gravação de dados
================================================================================
CM$VER      3.10.05i    01/02/2005
--------------------------------------------------------------------------------
- Pendencia 18533 - Acerto no relatorio de Comprovante de rendimentos PJ
- Acertos na DIRF para não ilustrar as deduções de R$100,00 nos meses de Agosto/2004 a Dezembro/2004
- Criação de utilitário para gerar as deduções de R$ 100,00 para os meses de Agosto/2004 a Dezembro/2004
================================================================================
CM$VER      3.10.05h    28/01/2005
--------------------------------------------------------------------------------
- Acerto na busca da Folha de Pagamentos/Benefícios
- Acerto na geração da DIRF
================================================================================
CM$VER      3.10.05g    13/01/2005
--------------------------------------------------------------------------------
- Acerto no processo de geraçào da DIRF para os parcipantes mantidos
================================================================================
CM$VER      3.10.05f    12/01/2005
--------------------------------------------------------------------------------
- Pendencia 18164 - Acerto no rateio do IOF quando da geração do CAP
- Acerto na busca da folha de benefícios para maiores de 65 anos
================================================================================
CM$VER      3.10.05e    06/01/2005
--------------------------------------------------------------------------------
- Acerto na rotina que busca as faixas da tabela de IR conforme a vigencia informada, 
  inclusive valores de dependentes e máximo para maiores de 65 anos, utilizando como base
  o histórico de parametros do IRRF.
================================================================================
CM$VER      3.10.05d    06/01/2005
--------------------------------------------------------------------------------
- Pendencia 18382 - Acerto na busca da folha para maiores de 65 anos
================================================================================
CM$VER      3.10.05c    03/01/2005
--------------------------------------------------------------------------------
- Acerto na busca do IOF para contemplar o Centro de Responsabilidade
================================================================================
CM$VER      3.10.05b    22/12/2004
--------------------------------------------------------------------------------
- Acerto no desfazer busca do IR do Contas a Pagar
================================================================================
CM$VER      3.10.05a    20/12/2004
--------------------------------------------------------------------------------
- Acerto na busca da Folha de Beneficios para verificar o preenchimento do Programa do Tipo Previdencial no cadastro global
- Acerto na busca da Folha de IOF para verificar o preenchimento do Programa do Tipo Previdencial no cadastro global
================================================================================
CM$VER      3.10.05     16/12/2004
--------------------------------------------------------------------------------
- Pendencia 17596 - Passa a filtar o plano contábil apenas para quem tem campo Ativo = 'Sim'
- Pendencia 16745 - Implementação de busca do ISS do Contas a Pagar
- Pendencia 16079 - Inclusão do critério de segregaçào de recursos
- Acerto na busca da Folha para Dedução de Dependentes
- Pendencia 16414 - Geração de GPS para lançamentos de INSS onde o tratamento fiscal seja somente de calcula valor
- Pendencia 16155 - Impressão de Demonstrativo para Contribuição Facultativa
- Pendencia 17067 - Busca posição mais atual do número de dependentes quando busca IRRF do Contas a Receber
- Pendencia 17462 - Na geração do DARF passa a respeitar a lei 10925/2004 que obriga o recolhimento quinzenal do CSLL/PIS/COFINS
- Pendencia 17463 - Na busca do CSLL/PIS/COFINS passa a colocar o intervalo quinzenal conforme determinação da lei 10925/2004
- Pendencia 17460 - Considerar o redutor de R$100,00 na geração da DIRF
- Pendencia 17495 - Na tela de lançamento de IRRF mostrar o número do documento corretamente]
- Pendencia 16028 - Geração de segunda via de arquivo texto para pensionistas
- Pendencia 17157 - Correção na gravação do processo RAD, quando gera um documento no Contas a Pagar
- Pendencia 17951 - Gerar DARF com o mesmo Centro de Responsabilidade do sistema de origem da informação ao invés de usar o valor parametrizado no IRRF
- Pendencia 17795 - Geração de DARF respeitando critério do rateio do documento de origem
- Pendencia 17801 - Geração de DARF com os programas informados nos documentos de origem
- Pendencia 17478 - Implementado o filtro por Natureza de Rendimento no Relatório de DARFs Gerados
- Pendencia 18234 - Acerto na busca do Folha de Benefícios para maiores de 65 anos
- Pendencia 18235 - Acerto nas informações do Informe de Rendimentos
- Pendencia 16807 - Criação de rotina para exclusão de DARF's de depósito judicial.
- Pendencia 16831 - Gravação do campo alíquota
- Pendencia 18056 - No cadastro de Natureza de Rendimento só mostra Tipo de Desembolso analítico
- Pendencia 18057 - No cadastro de parâmetros só mostra Tipo de Desembolso analítico
================================================================================
CM$VER      3.10.04f    19/11/2004
--------------------------------------------------------------------------------
Pendência: 18090
Tela: Tesouraria / Pagamento / Exclui Lote
Não estamos conseguindo excluir lote, de documentos de DARF, proveniente de Depósito Judicial.
Pendência: 18111
Tela: Geraçãoes / Lançamentos de outros sistemas / Fazer Busca / Folha de Benefícios
Alterar sistema para termos a opção de fazer a busca do IRRF, apenas, pela data de pagamento, sem a obrigatoriedade de informarmos a folha.
================================================================================
CM$VER      3.10.04e    19/11/2004
--------------------------------------------------------------------------------
- Pendencia 17428 - Criação de parametros para identificar as linhas de informe
  para rendimento bruto e imposto retido
================================================================================
CM$VER      3.10.04d    16/11/2004
--------------------------------------------------------------------------------
- Pendencia 17976 - Em todas as rotinas de busca, trazer o Plano Contábil ao invés do Plano Previdenciário
================================================================================
CM$VER      3.10.04c    01/10/2004
--------------------------------------------------------------------------------
- Acerto na rotina de exclusão de DARF
================================================================================
CM$VER      3.10.04b    09/09/2004
--------------------------------------------------------------------------------
- Pendencia 17636 - Busca de CSLL/PIS/COFINS -
  Acerto na rotina de calculo de rateio de percentual.
  Quando o valor calculado for inferior ao valor do Imposto,  calcula a diferenca e
  soma ao valor do ultimo rateio calculado, para evitar problema de arredondamento
================================================================================
CM$VER      3.10.04a    16/08/2004
--------------------------------------------------------------------------------
- Acerto no arredondamento na busca de PIS/CSLL/COFINS
================================================================================
CM$VER      3.10.04     13/08/2004
--------------------------------------------------------------------------------
- Pendencia 16747: Implementação de Geraçào e Impressão de ISS
- Pendencia 15738: Respeitar o relacionamento entre Plano/Patro no lançamento do IRRF
- Pendencia 16300: Implementaçào de impressão de várias matrículas no Informe de Rendimentos PF
- Pendencia 17354: Ajuste no processo de busca de IR dos estornos de pagamento de Folha de Beneficios
================================================================================
CM$VER      3.10.01e    12/08/2004
--------------------------------------------------------------------------------
- Acerto na gravação dos valores nas buscas de PIS/COFINS/CSLL, IRRF as Folhas e CaR e IOF do Empréstimo
================================================================================
CM$VER      3.10.01d    04/08/2004
--------------------------------------------------------------------------------
- Acerto no valor total do DARF para não gerar diferença no CaP
================================================================================
CM$VER      3.10.01c    30/07/2004
--------------------------------------------------------------------------------
- Tela de Geração de DARF: Os valores apresentados estavam, internamente, 
   com mais de duas casas decimais, provocando diferença entre o lançamento e o rateio.
================================================================================
CM$VER      3.10.01b    28/07/2004
--------------------------------------------------------------------------------
- Pendencia 17264: Tela de lançamento de DARF
  Acerto na rotina de alteração de lançamento.
================================================================================
CM$VER      3.10.01a    27/07/2004
--------------------------------------------------------------------------------
- Desfazer busca do IOF do Empréstimo
   Ajuste no processo de desfazer busca do IOF do Empréstimo.
================================================================================
CM$VER      3.10.01     15/07/2004
--------------------------------------------------------------------------------
- Pendencia 16139: Acerto no layout da geraçào da DIRF
- Pendencia 17157: Geração do RAD no processo de criaçào de documento
- Pendencia 17088: Acerto na Busca de PIS/CSLL/COFINS para não considerar registros com darf já gerados
- Pendencia 16300 - Permitir impressão de informe de rendimentos PF de lista de matriculas
================================================================================
CM$VER      3.10.00o    30/07/2004
--------------------------------------------------------------------------------
- Tela de Geração de DARF: Os valores apresentados estavam, internamente,
   com mais de duas casas decimais, provocando diferença entre o lançamento e o rateio.
================================================================================
CM$VER      3.10.00n    29/07/2004
--------------------------------------------------------------------------------
- Acerto na busca de CSLL, PIS e COFINS para documentos gerados.
- Acerto no valor da DARF para evitar divergências no rateio.
================================================================================
CM$VER      3.10.00m    27/07/2004
--------------------------------------------------------------------------------
- Busca do IRRF do Contas a Pagar:
   Considerar o Tipo de Desembolso da Natureza do Rendimento.
   Caso este não esteja preenchido, considerar o Tipo de Desembolso do parâmetro do IRRF.
================================================================================
CM$VER      3.10.00l    15/07/2004
--------------------------------------------------------------------------------
- Pendencia 17088 - Acerto na busca de PIS/CSLL/COFINS para não considerar registros já gerados.
================================================================================
CM$VER      3.10.00k    08/07/2004
--------------------------------------------------------------------------------
- Pendencia 17162 - Acerto na geracao do DARF para nao mostrar mensagem em branco
================================================================================
CM$VER      3.10.00j    08/07/2004
--------------------------------------------------------------------------------
Correções e ajustes nas rotinas de busca do código 0561 pelo contas a pagar e da busca
da Folha de Benefícios , com relação a contabilização do DARF.
================================================================================
CM$VER      3.10.00i    17/06/2004
--------------------------------------------------------------------------------
Pendência Nº 17036 - A busca do IRRF no Contas a Pagar tem que passar a buscar a
conta contábil e o tipo de desembolso apartir da tabela TIPOALTERADOR, e não mais
da tabela NATURENDIMENTO.
Pendência Nº 17040 - Na Geração do DARF O Sistema não está gravando a informação
 relativa a Atividade/Projeto para as multiplas contas de baixa
(tabela CCBAIXASXDOCUM).
================================================================================
CM$VER      3.10.00h    14/06/2004
--------------------------------------------------------------------------------
Pendência Nº 16806 - Na tela de Lançamentos no DARF a opção de exclusão não está
funcionando, apesar de na tela parecer excluir, ao consultar os lançamentos continuam 
a existir e não apresenta mensagem de erro.
Pendência Nº 16906 -  Na opção de Busca do Contas a Pagar o Sistema não esta 
gravando os valores correspondentes aos dependentes de Imposto de Renda.
Pendência Nº 16913 - Na tela de Lançamentos no DARF o Sistema está  permitindo a 
exclusão de DARF que já consta em lote baixado no CAP.
================================================================================
CM$VER      3.10.00g    04/06/2004
--------------------------------------------------------------------------------
Pendência Nº 16932 - O Sistema está apresentando um erro ao gravar a tabela 
RATEIOCODUM devido a ausência das informações de Tipo de Desembolso, 
Conta Contabil e idModulo quando tenta-se gerar um DARF de código  
0561 proveniente do Contas a Pagar.
================================================================================
CM$VER      3.10.00f    02/06/2004
--------------------------------------------------------------------------------
Pendência Nº 16138 - Modificações no programa de geração da DIRF, 
para que todos os participantes possam ser enviados, independentes do total de 
rendimento ou se houve rentenção.
================================================================================
CM$VER      3.10.00e    19/05/2004
--------------------------------------------------------------------------------
- Ajustes na rotina de busca de parametrização para os lançamentos da Folha de 
Benefícios.
Pendência Nº 16805 - Obrigar o preenchimento da conta contábil na tela e passar a 
gravar a conta contábil no campo PLACONTARECDES e o CODTIPRECDES, 
na tabela LANCIRRF para os casos de lançamento manual e para todas as Naturezas 
de Rendimentos.
================================================================================
CM$VER      3.10.00d    12/05/2004
--------------------------------------------------------------------------------
Ajustes na solução dada a pendência Nº 16736. 
================================================================================
CM$VER      3.10.00c    07/05/2004
--------------------------------------------------------------------------------
Pendência Nº 16296 - Criar rotina para desfazer a geração de PIS/COFINS/CSLL.
Pendência Nº 16537 - Desativar a opção de busca de multiplas folhas na funcionalidade
Gerações / Busca IRRF da Folha de Benefícios.
Pendência Nº 16735 - Na busca do IOF não está gravando o IDEMPRESA, 
impossibilitando depois o desfazer.
Pendência Nº 16736 - Gerações/Lançamentos de outros sistemas/Fazer busca - Correção
da rotina de critica de parametrizações.
================================================================================
CM$VER      3.10.00b    05/05/2004
--------------------------------------------------------------------------------
Pendência Nº 14910 - Geração de Darf - Ordenar os registros do grid por natureza, 
vencimento, módulo, nome do benefíciário, motivo e versão.
Pendência Nº 16297 - Gerações / Busca IOF - Colocar esta tela no mesmo padrão e
funcionalidades das telas de busca do IRRF do CAP e das Folhas.
Pendência Nº 16317 - Gerações/lançamentos de Outros Sistemas/Desfazer Busca
Ao tentar desfazer a busca da geração dos sistemas CAP, Folha de Pagamento/
Benefícios e Empréstimo - IOF, melhorar a mensagem, quando o DARF já tiver sido 
gerado, como por exemplo: 'Não foi possível desfazer a geração, DARF já foi impresso.'
A mensagem que apresenta hoje, é como se não tivesse sido nem gerado.
Pendência Nº 16319 - Consultas/Relatórios/Oficiais/Emissão de documento para 
Depósito Judiciais e Extrajudiciais
Alterar o nome do relatório para: 'Emissão de DARF - Depósito Judicial e Extrajudicial', 
para ficar com nome oficial. Nº do relatório 3854/1.
Pendência Nº 16433 - Criar opção para fazer/desfazer a busca do IRRF da Folha de
Beneficios para um período selecionado, independentemente de versão.
Pendência Nº 16707 - Gerações \ Contas a Pagar do INSS - No resultado do 
montaselect, a razão social apresentada é da fundação, mas ao dar ok, a tela 
principal é preenchida com o favorecido correto.  Foi verificado que a query da 
consulta busca o IDPESSOA na DOCUMENTO e não o IDFORCLI. 
Pendência Nº 16728 - Gerações/Busca IRRF das Folhas de Pagamento / Beneficios
Correção na query de busca no join com a tabela rubricaxplano.
Pendência Nº 16729 - Gerações/Busca IOF 
Correção na query de busca.
================================================================================
CM$VER      3.10.00a    30/04/2004
--------------------------------------------------------------------------------
Pendência Nº 15761 - Permitir que o Sistema passe a gerar os dados financeiros
do DARF em multiplas contas de baixa.
Pendência Nº 16356 - Acrescentar o campo HMEVLRBASE da tabela 
HISTMOVEMPTMO na query de busca do IOF, para preencher o campo de 
valor base na tela da geração do DARF.
Pendência Nº 16673 -  Correção de erro no cadastro de lançamentos do IRRF, quando
se tenta alterar a natureza de rendimento de um lançamento. Estava apresentando a
mensagem de que não há transação de usuário em progresso.
Pendência Nº 16692 - No cadastro de Linhas para o Informe, desabilitar a critica de 
preenchimento automático da linha da DIRF.
================================================================================
CM$VER      3.09.57o    02/04/2004
--------------------------------------------------------------------------------
Pendência Nº 16447 - Na tela da geração do Darf, está vindo duplicadas as linhas de 
IR para a natureza 3223, no exemplo analisado. 
================================================================================
CM$VER      3.09.57n    30/03/2004
--------------------------------------------------------------------------------
Pendência Nº 16436 - Na tela de geração do Darf o grid está duplicando as 
informações para a natureza de rendimento 3223.
================================================================================
CM$VER      3.09.57m    23/03/2004
--------------------------------------------------------------------------------
Pendência Nº 16329 - Na rotina de busca do IOF, quando o sistema está parametrizado 
para efetuar a busca pela data prevista ele faza busca corretamente, mas grava na tabela
LANCIRRF a data efetiva.
================================================================================
CM$VER      3.09.57l    19/03/2004
--------------------------------------------------------------------------------
Pendência Nº 16308 - Corrigir a buscar do IR do Contas a Pagar, pois a rotina não está 
gravando o imposto quando já há lançamento para o mesmo coddcumento com 
outra natureza na lancirrf.
================================================================================
CM$VER      3.09.57k    18/03/2004
--------------------------------------------------------------------------------
Ajustes na query que monta o grid dos darfs a serem gerados.
================================================================================
CM$VER      3.09.57j    18/03/2004
--------------------------------------------------------------------------------
Ajustes na rotina de busca PIS/COFINS/CSLL com relação ao campo 
DATALANCTO para os registros que possuem operação = 4
================================================================================
CM$VER      3.09.57i    17/03/2004
--------------------------------------------------------------------------------
Pendência Nº 16271 - Na rotina de Gerações / Busca CSLL/PIS/COFINS, permitir a 
gravação de um documento na tabela LANCIRRF quando o mesmo possui mais de um 
alterador.
================================================================================
CM$VER      3.09.57h    17/03/2004
--------------------------------------------------------------------------------
Pendência Nº 16249 - Não imprimir guia de depósito judicial para valores negativos.  
Esses valores devem ser levados em consideração no lançamento da AP, mas não 
devem ser impressos.
================================================================================
CM$VER      3.09.57g    17/03/2004
--------------------------------------------------------------------------------
Pendência Nº 16053 - Na rotina de  GERAÇÃO/BUSCA IR DE OUTROS SISTEMAS
/FOLHA DE PAGAMENTO  FOI FEITA UMA ALTERAÇÃO PARA QUE A BUSCA 
PASSE A SER FEITA PELA DATA CHEIA (DD/MM/YYYY), DE FORMA QUE
SE HOUVER MAIS DE UMA FOLHA DENTRO DE UM MESMO MÊS COM 
DATAS DE PAGAMENTO DISTINTAS ESTAS POSSAM SER BUSCADAS 
ISOLADAMENTE. 
Pendência Nº 16123 - Na tela de Lançamentos / Lançamentos no IRRF, disponibilizar 
um Combobox para seleção do módulo ao qual se refere o lançamento que está sendo 
feito. Colocar como default o módulo IRRF.
Pendência Nº 16152 - Na rotina de Gerações / Busca IRRF de Outros Sistemas / 
Folha de Pagamento / Beneficios só efetuar a busca para as rubricas que tenham 
IDINFORME preenchidos (na histrubsal ou na provdesc).
Pendência Nº 16207 - Mudar o esquema de determinação da base de cálculo IRRF 
utilizado atualmente na busca da Folha de Beneficios, passando a buscar o valor da 
base de cálculo do IRRF do campo VALORINFO da Rubrica de IRRF na 
HISTRUBSAL.
Pendência Nº 16208 - Na tela Gerações / Busca de Lançamentos da Folha de Beneficios
Mover os combos de Linha para maiores de 65 anos e Molestia Grave para a tela de 
Parâmetros do Sistema, de forma a desobrigar a seleção destas linhas todas as vezes 
que for necessário fazer a busca do IRRF da Folha de Beneficios.
Pendência Nº 16209 - Colocar a tela de Gerações / Busca de Lançamentos das Folhas
de Funcionarios e Beneficios no mesmo padrão e com as mesmas funcionalidades da 
tela de busca de lançamentos do IRRF do Contas a Pagar.
Pendência Nº 16231 - Possibilitar lançamentos para PIS, COFINS, CSLL e 
PIS/COFINS/CSLL.
================================================================================
CM$VER      3.09.57f    16/03/2004
--------------------------------------------------------------------------------
Ajustes na rotina de gravação do DARF para PIS/COFINS/CSLL
================================================================================
CM$VER      3.09.57e    16/03/2004
--------------------------------------------------------------------------------
Ajustes na rotina de geração do DARF para depósito judicial de IRRF.
================================================================================
CM$VER      3.09.57d    12/03/2004
--------------------------------------------------------------------------------
Ajustes na rotina de deleção da busca do IOF 
================================================================================
CM$VER      3.09.57c    11/03/2004
--------------------------------------------------------------------------------
Pendência Nº 16201 - Alteração na rotina de busca do IOF, para passar a considerar
tambem  o IOF Complementar Refinanciamento.
Pendência Nº 16202 - Alteração na rotina de busca do IOF, com relação ao Valor Base 
de Cálculo.
Pendência Nº 16222 - Correção de erro nas rotinas de busca do IRRF do Contas a Pagar
e na busca do CSLL/PIS/COFINS, relativo a data do lançamento, quando o parâmetro 
selecionado é buscar o IRRF e a CSLL/PIS/COFINS pela data de pagamento.
================================================================================
CM$VER      3.09.57b    10/03/2004
--------------------------------------------------------------------------------
Pendência Nº 16200 - Ajuste na query que busca o IOF , por data prevista, colocando 
um filtro para buscar o IOF apenas para os contrtatos de emprestimo ativos.
Pendência Nº 16204 - Alteração na rotina de geração de darf, para gerar um CAP único 
dos darfs de depósito judicial .
================================================================================
CM$VER      3.09.57a    09/03/2004
--------------------------------------------------------------------------------
Pendência Nº 16108 - Implementar rotina para possibilitar buscar lançamentos de CSLL,
PIS, COFINS e CSLL/PIS/COFINS oriundos do Sistema de Contas a Pagar.
Pendência Nº 16153 - Otimizar a estrutura do Menu de Gerações.
Alterações efetuadas na rotina de busca de lançamentos de IRRF do Contas a Pagar :
Além de otimizar a performance de processamento, a nova interface possui uma nova 
barra de progresso, uma nova barra de status e um campo memo onde serão gravadas 
quaisquer criticas que ocorram durante o processamento.
Agora a busca pode ser feita de duas formas :
1)Por Todas as Naturezas de Rendimento
Esta opção irá buscar todos os lançamentos de IRRF , que ocorreram no intervalo de datas selecionado, cujas
naturezas de rendimento estejam associadas aos alteradores que pertencam ao Imposto IRRF no 
Cadastro de Impostos x Tipo de Alterador.
2)Por uma Natureza de Rendimento Específica
Esta opção irá buscar todos os lançamentos de IRRF que ocorreram para a Natureza de Rendimento selecionada 
e que esteja associada a   algum alterador que pertença ao Imposto IRRF no Cadastro de Impostos x Tipo de 
Alterador,  no intervalo de datas escolhido.
Foi implementado tambem um processo de verificação de consistência das informações que serão processadas. 
Caso algum lançamento não possua um código de natureza de rendimento associado, o  nome do alterador 
correspondente será listado no campo memo e ao final do processamento o Sistema solicitará que o cadastro do 
alterador em questão seja complementado com a informação do código de natureza de rendimento correspondente.
Os lançamentos de IRRF só serão efetivamente lançados no Sistema de IRRF se todos as informações oriundas do 
Contas a Pagar estiverem consistentes. 
Este novo procedimento garante que o processamento seja feito sem erros de parametrização.
 
================================================================================
CM$VER      3.09.56g    01/03/2004
--------------------------------------------------------------------------------
Pendência Nº 16132 - Correção na impressão em lote do informe de rendimentos
com relação aos beneficiários que pagam pensão de alimentos. O programa estava
imprimindo informações relativas a pensionistas indistintamente.
Pendência Nº 16147 - Correção de erro ao tentar desfazer a busca do IOF de
Emprestimos.
Pendência Nº 16128 - Corfreção de erro na tela de geração do darf. O grid
mostrava os lançamentos em duplicidade.
================================================================================
CM$VER      3.09.55w    12/02/2004
--------------------------------------------------------------------------------
Correção da query do 13º salario para as pensionistas de alimentos na impressão 
do informe de rendimentos.
================================================================================
CM$VER      3.09.55v    12/02/2004
--------------------------------------------------------------------------------
Pendência Nº 16088 - Correção das queries que buscam as informações de 
rendimento anual e 13º salario para as pensionistas de alimentos no campo 6 do 
Informe de Rendimentos.
Pendência Nº 16090 - Correção na linha que imprime as informações do campo 6
 no layout da REFER. 
================================================================================
CM$VER      3.09.55u    10/02/2004
--------------------------------------------------------------------------------
- Ajustes na rotina de geração do arquivo texto do informe de rendimentos para 
a FUNCEF.
- Ajustes na Pendência Nº 16068.
================================================================================
CM$VER      3.09.55t    10/02/2004
--------------------------------------------------------------------------------
Pendência Nº 16070 - No momento da busca da Folha de Beneficios ,
 na Folha de Abono Anual, verificar se o participante está em Molestia Grave, de 
forma a não mais jogar o valor das deduções por dependente na linha 501 do Informe, e 
sim zerar estes valores (por causa da isenção).
================================================================================
CM$VER      3.09.55s    06/02/2004
--------------------------------------------------------------------------------
Pendência Nº 16068 - Quando o valor do 13º Salário da Folha de Pagamentos for 
NEGATIVO, zerar este valor nas tabelas do IRRF.
================================================================================
CM$VER      3.09.55r    06/02/2004
--------------------------------------------------------------------------------
Pendência Nº 16065 - Correção da Busca do IRRF do Contas a Pagar, pois a mesma
não está trazendo o valor correspondente ao INSS dos autônomos.
================================================================================
CM$VER      3.09.55q    05/02/2004
--------------------------------------------------------------------------------
Ajustes na query que faz a busca das informações contidas na tabela HISTRUBSAL para 
as tabelas do IRRF.
================================================================================
CM$VER      3.09.55p    03/02/2004
--------------------------------------------------------------------------------
Pendência Nº 15997 - Criar no relatório de Emissão de Documentos para  Depósito 
Judicial  uma opção de impressão por matricula do contribuinte.
Pendência Nº 16045 - Na opção Consulta/Impressão do Informe de Rendimento P.F., 
determinar os valores que serão considerados como isentos devido a Moléstia grave,
considerando o campo FLGISENTOIRRF da tabela HISTRUBSAL pois trata-se de 
histórico. 
Pendência Nº 16047 - Implementar opção para fazer a geração (busca) da Folha de 
Beneficios individualizada  por Paticipante dentro de uma versão selecionada.
Pendência Nº 16052 - Na Geração do arquivo texto para o Informe de Rendimentos -PF 
- FUNCEF, alterar o diretorio de destino de geração do arquivo e o nome do arquivo, 
trocando de CDR para PRN.
 
================================================================================
CM$VER      3.09.55o    30/01/2004
--------------------------------------------------------------------------------
Pendência Nº 15988 - Tela : Gerações/Busca IRRF de Outros Sistemas - Transformar 
o combo de Natureza de rendimento Global em FILTRO para a busca.
Se o combo estiver em branco, buscar todas as naturezas de rendimento encontradas, 
caso contrário só buscar a natureza que estiver selecionada.
Pendência Nº 16021 - Tela : Consultas / Impressão de Informe de Rendimentos - PF -
Correção da query de rendimentos de pensionistas de alimentos .
Pendência Nº 16022 - Tela : Consultas / Impressão de Informe de Rendimentos - PF -
Alteração no processo de determinação do período de busca dos rendimentos dos 
participantes que estão em depósito judicial, passando a pegar a data de início da ação 
judicial na tabela PROCJUD.
Pendência Nº 16023 - Tela : Gerações / Busca IRRF de Outros Sistemas / Folha
de Benefícios / Folha de Pagamentos - Correção da instrução que identifica se o 
participante está em moléstia grave.
================================================================================
CM$VER      3.09.55n    28/01/2004
--------------------------------------------------------------------------------
Pendência Nº 16001- Consulta/Impresão do Informe de Rendimento P.F - Erro na
query de seleção de dados para a impressão do informe de rendimentos - PF.
A condição (XB.IDBENEFIRRF = 4136) AND   deve ser  
(RE.IDBENEFIRRF = 4136) .
Pendência Nº 16003 - Consultas/Impressão do Informe de Rendimentos - PF - Correção
da query de rendimentos de pensionistas (campo 6).
Pendência Nº 16004 - Consultas/Impressão do Informe de Rendimentos - PF - Acerto  
na query de 13º de pensionistas (Campo 6).
Pendência Nº 16005 - Consultas/Darf para depósitos judiciais - Alterar a query de 
seleção dos contribuintes para :
1) Não pegar as ações judiciais com status de perdida.
2) Trocar o join da tabela procjud com a tabela elegpatro para a tabela depentit.
================================================================================
CM$VER      3.09.55m    26/01/2004
--------------------------------------------------------------------------------
Pendência Nº 15969 - Na tela de Consultas/Relatórios/IRRF/Oficiais/Comprovante de Rendimentos 
Pagos e Retenção de IR na Fonte - PJ retirar a opção de impressão de Pessoa Fisica.
Pendência Nº 15991 - Implementar no relatório de Emissão de Documento para 
Depósito Judicial, uma ordenação por autor e por nome do contribuinte.
================================================================================
CM$VER      3.09.55l    22/01/2004
--------------------------------------------------------------------------------
Pendência Nº 15973 - Na query de seleção para a impressão do informe de rendimentos,
quando se seleciona o filtro "todas" está ocorrendo um erro de sintaxe.
Adicionar opção para impressão do informe de rendimentos para prestadores de 
serviço(autônomos) (código 0588).   
================================================================================
CM$VER      3.09.55k    22/01/2004
--------------------------------------------------------------------------------
Pendência Nº 15977 -  Alterar o relatorio do Darf para Deposito Judicial para :
1) Pegar a Agencia Bancaria e o Nº da conta corrente cadcastrados na tabela 
PROCJUD.
2) Formatar o Nº da Agencia Bancaria e o Nº da Conta Corrente
3) Não imprimir o Nº do Banco.
4) Formatar o Nº do CPF.
================================================================================
CM$VER      3.09.55j    22/01/2004
--------------------------------------------------------------------------------
Pendência Nº 15970 - Alterar o Join da tabela Contabancaria na query 
que busca os dados para impressão do Darf de Deposito Judicial.
================================================================================
CM$VER      3.09.55i    16/01/2004
--------------------------------------------------------------------------------
Pendência Nº 15744 - Tornar mais claro o preenchimento dos campos e a 
utilização da tela Gerações / Busca IRRF de Outros Sistemas/Folha de Pagamentos/
Beneficios como um todo.
Colocar um contador para mostrar a evolução do processo.
================================================================================
CM$VER      3.09.55h    12/01/2004
--------------------------------------------------------------------------------
Pendência Nº 12234 - Verificar na geração da DIRF os valores de ação judicial
de anos anteriores que não estão saindo. Os mesmos aparecem no Informe de 
Rendimento corretamente. (3S = 18371)
================================================================================
CM$VER      3.09.55g    07/01/2004
--------------------------------------------------------------------------------
Pendência Nº 12315 - Demora na impressão do informe de rendimento de beneficiário
quando o mesmo tem   PA.
Pendência Nº 15786 - Criar um relatório comparando os valores/participantes 
descontados/pagos(HISTRUBSAL) e os buscados(LANCIRRF). 
Pendência Nº 15000 - Exibir na tela de geração do arquivo txt para o informe de 
rendimentos o número de pessoas geradas.
Pendência Nº 15877 - Ao fazer a geração do DARF, o lançamento está caindo sem 
Plano e Patrocinadora preenchido no rateio do documento.
Este erro foi verificado somente para o caso de Depósito Judicial - 7416 ou 7431
================================================================================
CM$VER      3.09.55f    05/01/2004
--------------------------------------------------------------------------------
Pendência Nº 15835 - Criar opção para apagar a busca do IRRF do Contas a Pagar.
Complementação da pendência nº 15853 (Verificar a mensagem que é exibida após 
a operação de apagar a Busca da Folha. Mesmo quando não há nada a ser 
apagado (porque o darf correspondente já foi impresso) a mensagem exibida é a de 
"Processo concluído com sucesso."), para as os processos que apagam a geração do 
IOF e do Contas a Pagar.
================================================================================
CM$VER      3.09.55e    30/12/2003
--------------------------------------------------------------------------------
Pendência Nº 15834 - Criar opção para apagar a Busca do IOF.
Pendência Nº 15853 - Verificar a mensagem que é exibida após a operação de apagar 
a Busca da Folha. Mesmo quando não há nada a ser apagado (porque o darf 
correspondente já foi impresso) a mensagem exibida é a de "Processo concluído 
com sucesso."
================================================================================
CM$VER      3.09.55d    29/12/2003
--------------------------------------------------------------------------------
Pendência Nº 15858 - Criar nova opção de Menu para conter as novas opções 
para desfazer a busca do IRRF do Empréstimo (IOF) e Contas a Pagar.
Trazer para esta nova opção de menu a opção de desfazer a busca do irrf 
das Folhas  de Pagamentos / Beneficios.
================================================================================
CM$VER      3.09.55c    23/12/2003
--------------------------------------------------------------------------------
Pendência Nº - 13165 - Considerar na busca para o Informe da Folha de Benefícios, 
o parâmetro de Calculo de IR sobre natureza de rendimento 3223, no caso de 
recebedor com moléstia grave. No caso de rendimentos 3223, se o parâmetro 
estiver ligado, mesmo que o recebedor tenha isenção de IR, deve-se colocar o 
provento na linha parametrizada no cadastro da rubrica e não na linha 
de "Rendimentos Isentos/Pensão,..."
================================================================================
CM$VER      3.09.55b    19/12/2003
--------------------------------------------------------------------------------
Pendencia Nº 15272 - Alterar exibição de Centro de Custo e Centro de Responsabilidade: 
para NOVOS registros, filtrar qualquer lista de CC e CR pelo plano vigente 
(IDPLANCENTCUST = Sistema.PlanoCC e IDPLANCENTRESPON = Sistema.PlanoCR,
respectivamente). Na exibição do código, passar a usar o campo CODEXTERNO. 
Os campos a gravar permanecem como estão (CODCENTROCUSTO e CODCENTRORESPON). 
Usar um dataset ÚNICO (CMSqlParams + CMClientDataSet, em caso de
multi-camadas) para o sistema inteiro (deve ficar em um datamodule já existente ou a 
ser criado). 
Pendencia Nº 15273 - Alterar exibição de Centro de Custo e Centro de Responsabilidade: para 
NOVOS registros, filtrar qualquer lista de CC e CR pelo plano vigente 
(IDPLANCENTCUST = Sistema.PlanoCC e IDPLANCENTRESPON = 
Sistema.PlanoCR, respectivamente). Na exibição do código, passar a usar o campo 
CODEXTERNO. Os campos a gravar permanecem como estão (CODCENTROCUSTO 
e CODCENTRORESPON). Usar um dataset ÚNICO (CMSqlParams +
CMClientDataSet, em caso de multi-camadas) para o sistema inteiro (deve ficar em 
um datamodule já existente ou a ser criado).  
================================================================================
CM$VER      3.09.55a    18/12/2003
--------------------------------------------------------------------------------
Pendência Nº 15610 - O sistema não esta buscando IOF de Refinanciamento do Empréstimo.
================================================================================
CM$VER      3.09.55     10/12/2003
--------------------------------------------------------------------------------
Liberação do Padrão 5.10.02
================================================================================
CM$VER      3.09.54e    16/12/2003
--------------------------------------------------------------------------------
Ajustes na Pendencia 15768, com relação a Geração do Darf.
================================================================================
CM$VER      3.09.54d    15/12/2003
--------------------------------------------------------------------------------
Pendencia 15768 - O sistema não efetuou as buscas referentes ao IOF e Folha de Benefícios de pagto de Reservas de Poupança, ou seja, o processamento ocorreu mas não retornou nenhum
valor
================================================================================
CM$VER      3.09.54c    10/12/2003
--------------------------------------------------------------------------------
Pendência Nº  14393 - Solicitamos a criação de cálculo automatico para a dedução de INSS para autonomos, 
segundo especificação passada para Geisa em 24/06. (3S = 21250).
================================================================================
CM$VER      3.09.54b    04/12/2003
--------------------------------------------------------------------------------
Pendência Nº 15013 - Permitir selecionar as versões da folha de benefícios que deverão 
ser excluídas
Pendência Nº 15715 - Alterar as condições de apagar a geração, também, por pessoa.
Pendência Nº 15746 - Foi refeita a busca da folha de benefícios para o mês de Janeiro 
e foi feita a busca do mês de novembro/2003, e os valores de Rendimento Tributável e 
IRRF não estão de acordo com os valores efetivados nas folhas.
================================================================================
CM$VER      3.09.54a    27/11/2003
--------------------------------------------------------------------------------
Pendência Nº 15051 - Após gravar os registros, o sistema está processando 
novamente a query de busca o que faz com que demore sem necessidade.
Pendência Nº 15078 - Verificar campo "ATIVO" na tabela TIPORECEBDESEMB 
em todas as telas que utilizam os tipos desembolsos\recebimentos. 
Pendência Nº 15624 - Erro ao gerar o arquivo texto do informe de rendimentos.
Pendência Nº 15546 - Otimizar a performance da funcionalidade 
"Apagar geração da Folha". 
Pendência Nº 14910 - Na tela de Geração do Darf, ordenar os registros do grid por 
natureza,  vencimento, módulo, nome do benefíciário, motivo e versão.
Pendência Nº 15610 - O sistema não esta buscando IOF de Refinanciamento 
do Empréstimo.
Pendência Nº 15613 - Compatibilizar a query da rotina de geração do arquivo texto
do informe para a Refer com a query de geração do relatório do informe.
Pendência Nº 14911 - Após gerar o Darf, o sistema está buscando os registros
ainda não gerados, ocasionando demora desnecessária.
Pendência Nº 15544 - Alterar rotina de Geração do DARF, de forma que para 
os casos de depósito judicial eles sejam gerados individualmente.
Pendência Nº 14942 - Incluir combo para seleção do módulo na tela de filtro. 
Caso não seja preenchido, trazer todos os módulos (como é hoje).
Alterar o nome do beneficiário:
  . para Folha de Benefícios ==> FOLHA BENEF
  . para Folha de Pagamento ==> FOLHA PAGTO
Pendência Nº 15706 - Melhorar a performance da query de seleção dos DARFS
Pendência Nº 15545 - Não puxar Versões(Folhas de Beneficio) de reestabelecimento.
Pendência Nº 15513 - Testar todas as rotinas envolvidas no processo de geração do 
DARF, tanto os de codigo 0561 quanto os de codigo 7431, Apartir da Folha de 
Beneficios.
================================================================================
CM$VER      3.09.53b    19/11/2003
--------------------------------------------------------------------------------
Pendencia Nº 12642 - No Informe de Rendimentos de pessoas que pagam pensão 
alimentícia, a linha de observação, onde constam informações de recebimento de 
cada consignatário, se este tiver uma devolução em rubrica de desconto, 
este valor não está sendo abatido do total recebido. Ou seja o somatório total não 
está considerando se a rubrica é de provento ou de desconto. 
Para as rubricas de desconto deve abater o valor referido.
================================================================================
CM$VER      3.09.53a    18/11/2003
--------------------------------------------------------------------------------
Pendencia 15648 - Filtrar a composição do total de rendimentos brutos do campo 6 do
relatorio do informe de rendimentos por modulo.
================================================================================
CM$VER      3.09.52j    13/11/2003
--------------------------------------------------------------------------------
  Pendência : 15613
  Consultas / Impressão do Informe de rendimento PF
    Compatibilizar a query da rotina de geração do arquivo texto do informe para a Refer com a query de geração do relatório do informe
  
  Pendência : 15624
  Consultas \ Impressão do Informe de Rendimento P. F. \ Gera Txt
    Erro ao tentar gerar o arquivo.
================================================================================
CM$VER      3.09.52i    12/11/2003
--------------------------------------------------------------------------------
  Pendência : 15612
  Cadastros / Linhas do Informe de Rendimentos
    Permitir selecionar os códigos 14 e 17 (alem dos codigos 3 e 7) quando for uma linha que se refere ao IRRF.
  Pendência : 15596
  Consultas / Impressão do Informe de Rendimento P.F.
    O relatório do Informe não está buscando os valores corretos para as linhas de Contribuição a Previdência Privada , Décimo terceiro salário e informações complementares (quando há depósito judicial).
================================================================================
CM$VER      3.09.52h    31/10/2003
--------------------------------------------------------------------------------
Acerto da pendência 14799, da geração do IRRF a partir da busca da Folha.
================================================================================
CM$VER      3.09.52g    27/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15471
  > Tela\Opçao No Sistema: Gerações \ Busca IRRF de outros sistemas \ Folha
  Verificar a rotina de busca de IR da Folha de Benefícios, pois quando na HISTRUBSAL o campo CODIRRFDARF (que é a Natureza de Rendimento) está nulo, o mesmo não é preenchido com a Natureza selecionada como global.
================================================================================
CM$VER      3.09.52f    09/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15089
  > Tela\Opçao No Sistema: Geração / Busca de outros sitemas
  A busca está gerando dois registros na Lancirrf, sendo um relativo as rubricas de base e imposto de renda e outro para as demais rubricas
================================================================================
CM$VER      3.09.52e    02/10/2003
--------------------------------------------------------------------------------
Acerto no Informe de rendimentos, buscando também descontos com exigibilidade 
suspensa (iddirf =13)
================================================================================
CM$VER      3.09.52d    16/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14799
  > Tela\Opçao No Sistema: Gerações/Busca IRRF de Outros Sistemas/Folha de Benefício/Depósito Judicial
  Ao fazer a geração, os campos VLRBASE e VLRIRRF da tabela LANCIRRF, não estão sendo preenchidos com os valores. Sendo assim ao gerar o DARF, os valores aparecem  zerados na tela de geração do Darf.
================================================================================
CM$VER      3.09.52c    04/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12642
  > Tela\Opçao No Sistema: GERAÇÃO DO INFORME DE RENDIMENTOS
  Correção no Informe de Rendimentos de pessoas que pagam pensão alimentícia, na linha de observação, 
onde constam informações de recebimento de cada consignatário, se este tiver uma devolução em rubrica de 
desconto, este valor passa a ser abatido do total recebido. 
================================================================================
CM$VER      3.09.52b    02/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14961
  > Tela\Opçao No Sistema: Geração / Apagar geração da folha
  Quando não é indicado o mês cobrança, apesar do sistema exibir mensagem de que não pode estar em branco, os registros das tabelas Lancirrf e Lancxinforme estão sendo deletados.
================================================================================
CM$VER      3.09.52a    28/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14914
  > Tela\Opçao No Sistema: Apagar geração de IR da folha
  Os registros que já foram gerados Darf estão sendo apagados sem mensagem ou restrição.
================================================================================
CM$VER      3.09.52     21/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14904
  > Tela\Opçao No Sistema: Lançamentos no IRRF
  Ao clicar no botão Sair está dando Access Violation
- Resolução da Pendência Nº 14902
  > Tela\Opçao No Sistema: Cadastro / histórico de parâmetro
  Não obrigar o preenchimento do campo Percentual de residente no exterior
- Resolução da Pendência Nº 14901
  > Tela\Opçao No Sistema: Cadastro / histórico de parâmetros
  Alterar a palavra Redução para Dedução e organizar o Tab Order
- Resolução da Pendência Nº 14900
  > Tela\Opçao No Sistema: Cadastro / Imposto de renda pessoa física
  Organizar o Tab Order da tela
- Resolução da Pendência Nº 14899
  > Tela\Opçao No Sistema: Cadastro / Imposto de renda pessoa física
  Ao inserir novo registro não está sendo gravado
- Resolução da Pendência Nº 14898
  > Tela\Opçao No Sistema: Cadastro / Imposto de rende pessoa física
  Após procurar e selecionar um registro, os dados não estão aparecendo na tela
================================================================================
CM$VER      3.09.51     04/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14658
  > Tela\Opçao No Sistema: Bpl
  Criação de um objeto com a função para buscar faixa do irrf e aliquota, para ser usada em outros sistemas.
- Resolução da Pendência Nº 14598
  > Tela\Opçao No Sistema: Geração / Contas a Pagar no Inss / Geração
  Quando é calculado INSS (tratamento calcula valor) automaticamente no CAP, o IRRF está trazendo o valor do documento como valor do INSS e negativo, incorretamente.  Não está trazendo o valor retido de INSS.  Está trazendo também o valor de IR nesta tela, caso o fornecedor tenha relacionamento para os dois impostos.
- Resolução da Pendência Nº 14731
  > Tela\Opçao No Sistema: Cadastros / Histórico de Parâmetros de IR
  Criação de uma nova tela para a manutenção da tabela de histórico de parâmetros de IR.
  Criação da tabela hstparamirrf.
- Resolução da Pendência Nº 8533
  > Tela\Opçao No Sistema: Tabela do IRRF para Pessoas Físicas
  Controlar historicamente a tabela de alíquota de IR. Com faixa de datas de vigências. Fazer com que os sistemas, no Cáculo do IR, Geração de Informe e DIRF, passe a interpretar estes períodos.
  Foram criados dois campos na tabela IRRF: IdIRRF, DataIniVigencia.
================================================================================
CM$VER      3.09.50     26/06/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13874
  > Tela\Opçao No Sistema: INSS
  Visualização do valor de INSS calculado em documento do Contas a Pagar, como tratamento fiscal "somente calcula valor". Geração de GPS.
Fazer o IR "buscar" "somente calcula valor". O INSS não tem tela de busaca no IR, sendo gerado 
automaticamente no CAP.
================================================================================
CM$VER      3.09.49     17/06/2003
--------------------------------------------------------------------------------
Melhoria da performance da impressão do Informe de Rendimentos.
Complemento na impressão da observação quando existe Processo Judicial.
================================================================================
CM$VER      3.09.48     29/05/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13651
  > Tela\Opçao No Sistema: Consultas / Relatórios / Emissão de DARF
  O campo VLRIRRF não está sendo impresso, apesar de estar visível.
================================================================================
CM$VER      3.09.47     15/05/2003
--------------------------------------------------------------------------------
Criação da tela de demonstrativo de apuração do RET
================================================================================
CM$VER      3.09.46     05/05/2003
--------------------------------------------------------------------------------
Correções nos paramêtros do sistema.
================================================================================
CM$VER      3.09.45     17/04/2003
--------------------------------------------------------------------------------
Corrigida a geração da DIRF que estava duplicando os funcionários quando tinha 
multiempresa
Implementadas alteração geração da DCTF
================================================================================
CM$VER      3.09.44     26/03/2003
--------------------------------------------------------------------------------
Acerto na tela de alteração de INSS
================================================================================
CM$VER      3.09.43     20/02/2003
--------------------------------------------------------------------------------
Alterada a geração da folha quanto a parcela isenta no 13º
================================================================================
CM$VER      3.09.42     11/02/2003
--------------------------------------------------------------------------------
Correção no relatório de conferência da DIRF
Implementações complementares na geração de arquivo para a CBS
Otimizada a Query de Pensionistas da folha de benefício
Otimizado o update da Histrubsal
Corrigido o valor do Darf no rlatório de emissão de Darf's, que estava saindo incorreto
quando tinhamos desconto no Darf.
================================================================================
CM$VER      3.09.41     04/02/2003
--------------------------------------------------------------------------------
Implementada Pend 11883 - agora os valores de 13º para pensionistas vem separados
no informe de rendimento.
Quando reprocessavamos a geração da folha os valores eram duplicados. Isto foi 
corrigido nesta versão
================================================================================
CM$VER      3.09.40     05/02/2003
--------------------------------------------------------------------------------
Implementada Pend. 11809 após alterar um darf era lançado todos os lançamentos
com operação = 2 fazendo o CAP mostrar os lançamentos duplicados.
Implementada Pend 11818 para permitir descontos no lançamento de DARF
Incluido o campo Valor do Desconto na tela de paramêtros do IRRF
Incluido o campo valor do desconto na tela de DARF
================================================================================
CM$VER      3.09.39     29/01/2003
--------------------------------------------------------------------------------
Implementação da Pend. 11687
Includo filtro por Folha de pagamento ou Benefício no relatório de conferência da Dirf
================================================================================
CM$VER      3.09.38     22/01/2003
--------------------------------------------------------------------------------
Pend 11438
Acrescentado na impressão do Informe de Rendimento os Valores dos pensionistas
Pend. 11622
O sistema estava deixando excluir um Darf já contido em um lote do contas a pagar.
================================================================================
CM$VER      3.09.37     17/01/2003
--------------------------------------------------------------------------------
Implementado Darf por decisão Judicial. Pend. 4698
Acrescentado o campo usado para decisão judicial no cadastro de natureza de rendimento 
================================================================================
CM$VER      3.09.36     14/01/2003
--------------------------------------------------------------------------------
Correção na geração da Dirf
Implementação da Pend. 4695 para permitir Darf's de residentes no exterior
================================================================================
CM$VER      3.09.35     13/01/2003
--------------------------------------------------------------------------------
Correção na query de geração da DIRF que não estava rodando na Funcef.
Correção no Informe de Rendimento para sair todos os pensionistas 
================================================================================
CM$VER      3.09.34     07/01/2003
--------------------------------------------------------------------------------
Correção na tela de lançamento de IRRF para permitir valores negativos
Correção na geração da folha para permitir valores de IRRF negativos
Correção para Colocar a folha de benefício para gerar
pela DATAPAGAMENTO, gravando esta data e tendo como 
limite a data da tela.
 
================================================================================
CM$VER      3.09.33     06/01/2003
--------------------------------------------------------------------------------
Otimização na tela de Impressão de Informe de Rendimento 
================================================================================
CM$VER      3.09.32     03/01/2003
--------------------------------------------------------------------------------
Implementação da parte de crédito da DCTF. Pend. 10780
Correção no somatório do relatório de Darf's gerados. Pend. 11249
================================================================================
CM$VER      3.09.31     27/12/2002
--------------------------------------------------------------------------------
Implementação na Dirf para permitir que sejam lançados valores de compensação
judicial e exigibilidade suspensa.
Criado novos 10 tipos de linha de informe para permitir o lançamento de valores de 
compensação judicial e exigibilidade suspensa
Compensação por decisão judicial
Rendimentos - Exigibilidade suspensa
13º. Salário - por decisão judicial
13º. Salár&io - exigibilidade suspensa
Por decisão judicial - Anos anteriores
Deduções - exigibilidade suspensa
IRRF - exigibilidade suspensa
13º Salário - decisão judicial anos anteriores
13º Salário - Deduções exigibilidade suspensa
13º Salário - IRRF exigibilidade suspensa
================================================================================
CM$VER      3.09.30     06/12/2002
--------------------------------------------------------------------------------
Correção na query da folha de Benefícios na Geração da folha.
================================================================================
CM$VER      3.09.29     04/12/2002
--------------------------------------------------------------------------------
Correção na impressão do informe de rendimento Pessoa Física.
Quando clicavamos no botão imprimir dava erro.
================================================================================
CM$VER      3.09.28     28/11/2002
--------------------------------------------------------------------------------
Corrigida a demora na entrada da tela de Impressão do informe de Rendimentos. Pend 10576
================================================================================
CM$VER      3.09.27     26/11/2002
--------------------------------------------------------------------------------
Implementadas as Pend. 10366 e 10367
================================================================================
CM$VER      3.09.26     30/10/2002
--------------------------------------------------------------------------------
Correção no relatório de GPS
================================================================================
CM$VER      3.09.25     25/10/2002
--------------------------------------------------------------------------------
Correção na alterações de lançamento do INSS
================================================================================
CM$VER      3.09.24     02/10/2002
--------------------------------------------------------------------------------
Correção no ImpostoXAlterador
================================================================================
CM$VER      3.09.23     12/09/2002
--------------------------------------------------------------------------------
Inclusão da Bpl do IRRF
================================================================================
CM$VER      3.09.22     11/09/2002
--------------------------------------------------------------------------------
Correção na folha de Benefício
================================================================================
CM$VER      3.09.21     29/08/2002
--------------------------------------------------------------------------------
Acrescentado o Campo que indica se o código da natureza servirá para a DCTF
no cadastro de Natureza de Rendimento.
================================================================================
CM$VER      3.09.20     22/07/2002
--------------------------------------------------------------------------------
Liberada as telas Lay-Out do Informe para Pessoa Física e Impressão do Informe de Rendimento
preparadas para 3 camadas
================================================================================
CM$VER      3.09.19     08/07/2002
--------------------------------------------------------------------------------
Ajustes no relatório conf. IRRF e conf. IRRF Ana.
================================================================================
CM$VER      3.09.18     08/07/2002
--------------------------------------------------------------------------------
Implementado o Recurso de Help
================================================================================
CM$VER      3.09.17     25/06/2002
--------------------------------------------------------------------------------
Correção no cadastro de Darf quando era lançado multa e juros
================================================================================
CM$VER      3.09.16     19/06/2002
--------------------------------------------------------------------------------
Correção na exclusão do cadastro de Darf
================================================================================
CM$VER      3.09.15     18/06/2002
--------------------------------------------------------------------------------
Criado o relatório de GPS's Gerados
================================================================================
CM$VER      3.09.14     13/06/2002
--------------------------------------------------------------------------------
Reativada a tela de Alteração do INSS
================================================================================
CM$VER      3.09.13     07/06/2002
--------------------------------------------------------------------------------
Implementada a DCTF 2.0
Corrigido o erro que dava no lançamento do Darf
================================================================================
CM$VER      3.09.12     06/05/2002
--------------------------------------------------------------------------------
Implementação da DCTF 2.0 já em 3 camadas
================================================================================
CM$VER      3.09.11     03/05/2002
--------------------------------------------------------------------------------
Versão 3 camadas do IRRF 
================================================================================
CM$VER      3.09.08     22/03/2002
--------------------------------------------------------------------------------
GPS ja apresenta o valor das multas e juros.
Criado o campo Alterador de Juros nos parametros da GPS
Criado o campo Alterador de Multa nos parametros da GPS
Incluida a opção de agrupar somente por fornecedor na geração do INSS
================================================================================
CM$VER      3.09.07     26/02/2002
--------------------------------------------------------------------------------
Acertada a geração da folha e no relatório de conferência da dirf.
================================================================================
CM$VER      3.09.06     22/02/2002
--------------------------------------------------------------------------------
* Busca a natureza de rendimento da HISTRUBSAL
A alteração da BuscaCARCAP foi a seguinte:
* Alterada a geração do Contas a Pagar/Receber para pegar 
================================================================================
CM$VER      3.09.05     22/02/2002
--------------------------------------------------------------------------------
Acrescentada a opção de imprimir as GPS geradas e não geradas na impressão da GPS
Ajustes no cadastro de Natureza de Rendimento
================================================================================
CM$VER      3.09.04     07/02/2002
--------------------------------------------------------------------------------
Incluido o campo Grupo de Tributo no cadastro de Natureza de Rendimento
Tirei os campos grupo de tributo, ocorrência e data de apuração do DCTF.
================================================================================
CM$VER      3.09.03     31/01/2002
--------------------------------------------------------------------------------
1) Acertada a geração da Dirf quando era solicitada para gravar somente os
beneficiarios com retenção
2) Acertado o relatorio de conferencia da DIRF para não multiplicar os
valores por 100.
================================================================================
CM$VER      3.09.02     28/01/2002
--------------------------------------------------------------------------------
- Alterada a geração da folha de pagamento para gravar separadamente os
motivos.
- Alterado o cadastro das linhas para o Informe para dizer que as linhas
referentes ao 13o. Salário possam ser rendimento bruto ou irrf.
================================================================================
CM$VER      3.09.01     23/01/2002
--------------------------------------------------------------------------------
Implementada a Busca IOF - Emprestimo
================================================================================
CM$VER      3.09.00     10/01/2002
--------------------------------------------------------------------------------
1) Acertada a geração da folha de beneficio que estava dando erro no
CODCENTROCUSTO.
2) Criado novo campo no cadastro de "Linhas para o Informe" para designar se
os lançamentos vindos da folha de pagamento ou da folha de beneficio são de
natureza positiva (provento) ou de natureza negativa (desconto). Este campo
é fundamental para a correta gravação dos valores vindos deste sistema.
PREENCHIMENTO OBRIGATÓRIO ANTES DA GERAÇÃO.
================================================================================
CM$VER      3.08.06     10/01/2002
--------------------------------------------------------------------------------
Implementada a DCTF
Acrescentado ao Lançamento do Darf os campos Tipo de Processo, Vara, Município e
Medida Judicial
Foi acertada a geração da folha de pagamento.
================================================================================
CM$VER      3.08.05     20/12/2001
--------------------------------------------------------------------------------
Geração da DIRF já permite colocar um valor mínimo de rendimento atual
Corrigido erro na exclusão do INSS gerado
Ajustes na geração da Folha/Beneficiário
Ajustes nos parametros do sistema
================================================================================
CM$VER      3.08.04     14/12/2001
--------------------------------------------------------------------------------
Ajustes na busca IRRF
================================================================================
CM$VER      3.08.03     08/12/2001
--------------------------------------------------------------------------------
Incluida a Implementação da GFIP
Ajustes na impressão da GPS
================================================================================
CM$VER      3.08.02     06/12/2001
--------------------------------------------------------------------------------
Incluida a alteração do INSS
================================================================================
CM$VER      3.08.01     13/11/2001
--------------------------------------------------------------------------------
* Incluida na geração da folha de pagamento e pis o programa padrão de acordo com 
   o centro de custo do funcionário.
================================================================================
CM$VER      3.08.00     31/10/2001
--------------------------------------------------------------------------------
* Incluído parâmetro para buscar o IRRF do CAP/CAR por data de lançamento.
================================================================================
CM$VER      3.07.01     24/10/2001
--------------------------------------------------------------------------------
* Incluida opção na GPS para imprimir por Data de Vencimento
================================================================================
CM$VER      3.07.00     10/10/2001
--------------------------------------------------------------------------------
* Criado parâmetro para informar o percentual de IRRF para residentes no exterior.
================================================================================
CM$VER      3.06.01     09/10/2001
--------------------------------------------------------------------------------
* Acertada a alteração de DARF em relação a alteração quando o campo Programa 
   não estava preenchido.
* Incluído na geração e no cadastro do DARF a opção de gravar observação e referencia
   para o contas a pagar.
* Alterada a geração do IRRF e PIS da folha de pagamento para gravar o centro de custo.
================================================================================
CM$VER      3.06.00     02/10/2001
--------------------------------------------------------------------------------
* Incluída a opção de impressão da GPS.
================================================================================
CM$VER      3.05.01     02/10/2001
--------------------------------------------------------------------------------
* Incluída a opção de excluir a geração do INSS.
================================================================================
CM$VER      3.05.00     21/09/2001
--------------------------------------------------------------------------------
* Alterada a geração do IRRF da folha e a geração do DARF para considerar a versão
   da folha de pagamento.
================================================================================
CM$VER      3.04.07     19/09/2001
--------------------------------------------------------------------------------
* Acertada a gravação do valor do DARF referente a folha de pagamento
================================================================================
CM$VER      3.04.06     05/09/2001
--------------------------------------------------------------------------------
* Incluídos relatórios de Conferência da DIRF e do IRRF 
================================================================================
CM$VER      3.04.05     24/08/2001
--------------------------------------------------------------------------------
* Acertada a gravação do valor do DARF de PIS.
================================================================================
CM$VER      3.04.04     15/08/2001
--------------------------------------------------------------------------------
* Alterado o período de apuração.
================================================================================
CM$VER      3.04.03     15/08/2001
--------------------------------------------------------------------------------
* Alterada a geração da folha de pagamento de mes para mes de cobrança.
* Acertado o arredondamento do IRRF para quem usa rateio por plano e patrocinadora.
================================================================================
CM$VER      3.04.02     06/08/2001
--------------------------------------------------------------------------------
* Acertada a alteração do DARF quando este foi gerado originalmente com rateio.
================================================================================
CM$VER      3.04.01     23/07/2001
--------------------------------------------------------------------------------
* Acertada a impressão do DARF.
* Acertado o combo de plano previdenciário na tela de lançamento de IRRF  e DARF.
================================================================================
CM$VER      3.04.00     07/07/2001
--------------------------------------------------------------------------------
* Implementada a geração do Contas a Pagar para o INSS
================================================================================
CM$VER      3.03.00     28/06/2001
--------------------------------------------------------------------------------
* Criado o rateio do IRRF por centro de custo
================================================================================
CM$VER      3.02.00     31/05/2001
--------------------------------------------------------------------------------
* Separação do DARF da folha de pagamento por motivo. 
================================================================================
CM$VER      3.01.02     29/05/2001
--------------------------------------------------------------------------------
* Impressão do DARF:
   - Implementada a impressão de 2 vias do DARF na mesma folha.
   - Alterada na impressão do DARF para imprimir somente a data final de apuração
   - Colocada opção de imprimir DARF's já impressos.
   - Colocada a opção de filtro por data de emissão e por natureza do rendimento.
* A data de lançamento do DARF será a data final de apuração.
================================================================================
CM$VER      3.01.01     24/05/2001
--------------------------------------------------------------------------------
* Acertada a geração do DARF  quando o não era passado o parametro de Programa
   Previdenciário.
* Acertada a junção de mesmo CPF/CGC na geração da DIRF.
================================================================================
CM$VER      3.01.00     07/05/2001
--------------------------------------------------------------------------------
* Criada a possibilidade de se informar Forma de Pagamento na Natureza do Rendimento.
   Esta forma de pagamento será gravada na hora da geração do DARF.
================================================================================
CM$VER      3.00.02     28/04/2001
--------------------------------------------------------------------------------
* Acerto na geração da DIRF
================================================================================
CM$VER      3.00.01     10/04/2001
--------------------------------------------------------------------------------
* Informe de Rendimentos para Pessoa Júridica:
  - Agora este lay-out pode ser emitido para pessoa física também
  - Acertado no cabeçalho do relatório o termo pessoa Jurídica quando o relatório 
    era solicitado para pessoa física. Pendência - 3073
  - Agrupada as informações pela raiz do CNPJ da fonte pagadora. Pendência - 3074
  - Acertado o cabeçalho que estava aparecendo: ANO-CALENDÁRIO 200020002000.
    Pendência - 3077
================================================================================
CM$VER      3.00.00     09/04/2001
--------------------------------------------------------------------------------
* Liberação de Versão Delphi5
================================================================================
CM$VER      2.05.11     19/03/2001
--------------------------------------------------------------------------------
* Acertada a criação do arquivo texto.
================================================================================
CM$VER      2.05.10     02/03/2001
--------------------------------------------------------------------------------
* Acertado o lay-out da DIRF.
* Inserida opção de filtrar o informe e a DIRF somente os dados da folha de pagamento,
   folha de benefício ou todos.
* Alterada a tela de lançamento do IRRF para incluir as linhas do informe.
* Incluido cadastro de fornecedor.
================================================================================
CM$VER      2.05.08     08/02/2001
--------------------------------------------------------------------------------
* Incluído o informe de rendimento de pessoas físicas totalmente parametrizável. Para cadastrar o lay-out,
   ir na opção de "Cadastro - Lay-Out do Informe P.F." e para imprimir, ir na opção de 
   "Consulta - Impressão do Informe P.F."
================================================================================
CM$VER      2.05.07     07/02/2001
--------------------------------------------------------------------------------
* Acertada a geração da DIRF
* Incluído relatório de conferência dos DARF's gerados
================================================================================
CM$VER      2.05.06     27/01/2001
--------------------------------------------------------------------------------
* Acertada a geração da DIRF.
* Acertada a geração de dados vindos da folha de pagamento/benefício 
  para considerar as rúbricas de desconto diminuindo.
================================================================================
CM$VER      2.05.05     19/01/2001
--------------------------------------------------------------------------------
* Acertada a geração do IRRF vindo do contas a pagar quando o lançamento possuia
  rateio por plano e patrocinadora.
* Acertado o nome da fonte pagadora no Comprovante de Retenção para pessoas Físicas
  quando ele era muito grande.
================================================================================
CM$VER      2.05.04     16/01/2001
--------------------------------------------------------------------------------
* Acertada a marcação dos lançamentos provenientes da folha de pagamento.
================================================================================
CM$VER      2.05.03     13/01/2001
--------------------------------------------------------------------------------
* Acerto na geração da folha de pagamento. 
* Acerto na impressão do informe de rendimento para pessoas físicas que estava
   dobrando o valor.
================================================================================
CM$VER      2.05.02     08/01/2001
--------------------------------------------------------------------------------
* Acertado o relatório de Informe de Rendimentos para Pessoas Jurídicas.
================================================================================
CM$VER      2.05.01     27/12/2000
--------------------------------------------------------------------------------
* Alterado o vencimento do DARF para o 3o. dia útil da semana.
* Depois da exclusão do DARF, retorna os registro do IRRF para em aberto.
================================================================================
CM$VER      2.05.00     15/12/2000
--------------------------------------------------------------------------------
* Geração do DARF:
   - Quebra por plano e patrocinadora de acordo com o lançamento original.
   - Cálculado o vencimento do DARF de acordo com a próxima quarta-feira e o período
     de apuração baseado no vencimento.
   - Acumulado os lançamentos provenientes da folha de pagamento de funcionários e
     folha de benefício.
* Lançamento/Geração do IRRF
  - Incluída a gravação do Plano e Patrocinadora que originou este lançamento. 
================================================================================
CM$VER      2.04.03     26/10/2000
--------------------------------------------------------------------------------
* Incluído relatório de DARF's emitidos
================================================================================
CM$VER      2.04.02     09/09/2000
--------------------------------------------------------------------------------
* Alterada a geração do IRRF do CAP e CAR para somente gerar dados 
   para as pessoas físicas com lançamentos em tipos de desembolso/recebimento que 
   estejam indicados para "calcular imposto sobre documento associado". 
================================================================================
CM$VER      2.04.01     17/08/2000
--------------------------------------------------------------------------------
* Colocado o DARF para ser gerado por código e por conta contábil.
================================================================================
CM$VER      2.04.00     08/08/2000
--------------------------------------------------------------------------------
* Incluído plano e patrocinadora na geração e lançamento do DARF. 
   Estes campos somente para quem usa o parâmetro de usar plano e patrocinadora.
================================================================================
CM$VER      2.03.00     21/06/2000
--------------------------------------------------------------------------------
* Alterada a geração e o lançamento do DARF para considerar a nova parametrização 
  de tipo de desembolso e fornecedor atrelada a natureza do rendimento.
- Resolução da Pendência Nº 2001
  > Tela\Opçao No Sistema: PARAMETROS / INTEGRACAO COM O CONTAS A PAGAR
  Permitir mais de um tipo de desembolso.
================================================================================
CM$VER      2.02.02     13/04/2000
--------------------------------------------------------------------------------
* Acertada a geração do DARF quando se escolhia somente um lançamento 
   para gerar.
================================================================================
CM$VER      2.02.01     05/04/2000
--------------------------------------------------------------------------------
* Acerto na tela de Lançamento de Documento no IRRF (agora permite exclusão
 mesmo que haja registros ligados ao lançamento).
* Acerto na tela Lançamento do DARF (não permitia que o usuário mudasse
o check de Darf impresso)
================================================================================
CM$VER      2.02.00     27/03/2000
--------------------------------------------------------------------------------
* Incluida nova tabela que relaciona o IRRF e o INSS com a tabela de Tipo de Alterador.
  Esta tabela foi criada para ser possível a indicação de mais de um tipo de alterador para
  ser considerado como IRRF e INSS na integração com o Contas a Pagar.
  
================================================================================
CM$VER      2.01.25     20/05/2000
--------------------------------------------------------------------------------
* Acertado constraint na alteração do rateio do DARF
================================================================================
CM$VER      2.01.24     20/05/2000
--------------------------------------------------------------------------------
* Acertada a exclusão do DARF quando este era gerado automaticamente.
* Incluido na tela de lançamento do DARF o campo se este está impresso ou não
================================================================================
CM$VER      2.01.23     18/03/2000
--------------------------------------------------------------------------------
* Acertado a data final de apuração na emissão do DARF.
* Acertada a exclusão do DARF na tela de lançamento.
================================================================================
CM$VER      2.01.22     02/03/2000
--------------------------------------------------------------------------------
* Alterações para compatibilidade com padrão (Documento inserir e alterar)
================================================================================
CM$VER      2.01.21     11/02/2000
--------------------------------------------------------------------------------
* Acertada a geração da folha de pagamento/beneficio.
================================================================================
CM$VER      2.01.20     26/01/2000
--------------------------------------------------------------------------------
* Acertada emissão do informe de Rendimento. Acertada Geração da folha.
================================================================================
CM$VER      2.01.19     24/01/2000
--------------------------------------------------------------------------------
* Relatórios Comprovante de Rendimento para Pessoa Física e Pessoa Jurídica 
não apareciam. Corrigido.
================================================================================
CM$VER      2.01.17     15/10/1999
--------------------------------------------------------------------------------
*Tornado invisível o botão de Procurar das telas : Cadastro de Imposto de Renda Pessoa Física e
Cadastro Natureza do Rendimento (todos os registros já estão visíveis no grid).
================================================================================
CM$VER      2.01.16     30/09/1999
--------------------------------------------------------------------------------
* Retirado componente de edição de informe da tela  de lançamento  no IRRF
 devido ao mesmo não ser necessário  pois a geração de Contas a Pagar
 já faz o cadastramento do informe.
================================================================================
CM$VER      2.01.15     27/09/1999
--------------------------------------------------------------------------------
* Incluida opção de Tipo de Informe na tela de Lançamentos do IRRF
================================================================================
CM$VER      2.01.14     24/08/1999
--------------------------------------------------------------------------------
* Os Relatório Comprovante de Rendimento Pessoa Física e Pessoa Jurídica
   não retornavam dados. Corrigido.
================================================================================
CM$VER      2.01.13     24/08/1999
--------------------------------------------------------------------------------
* Aparecia uma mensagem de "lookup table not active" ao tentar mudar os Alteradores
   para multa e juros na tela de parâmetros do sistema. Corrigido.
* Aparecia a mensagem "PARAMETER CODDOCUMENTO not Found" na
   tela de Busca IRRF no Contas a Receber. Corrigido.
================================================================================
CM$VER      2.01.12     20/08/1999
--------------------------------------------------------------------------------
* Substituída combo de Fornecedor na tela de Parâmetros do Sistema pelo 
   componente sub-tipo, aumentando a rapidez de processamento da tela.
================================================================================
CM$VER      2.01.11     17/08/1999
--------------------------------------------------------------------------------
- Alterada a rotina de buscar dados do contas a receber e a pagar para lançar o 
  IRRF somente após o documento estar recebido ou pago.
- Incluido teste na tela de buscar dados do contas a receber e a pagar para não 
  permitir o início da geração antes de preencher o cadastro de linhas para o
  informe de rendimento.
================================================================================
CM$VER      2.01.10     12/08/1999
--------------------------------------------------------------------------------
* A Tela para Lançamento de Darf foi integrada com Contas a Pagar. Agora os 
   Lançamentos são cadastrados automaticamente na Contabilidade.
================================================================================
CM$VER      2.01.09     10/08/1999
--------------------------------------------------------------------------------
* Inclusão dos Códigos Alteradores para Juros e Multas na tela de parâmetros 
   do sistema.
================================================================================
CM$VER      2.01.08     09/08/1999
--------------------------------------------------------------------------------
* Criada tela Cadastro das Linhas do Informe de Rendimento (Cédula C).
================================================================================
CM$VER      2.01.07     02/07/1999
--------------------------------------------------------------------------------
* Criada tela de lançamento do Darf, os relatórios:
   - Comprovante de Rendimentos Pagos e de Retenção de   Imposto de Renda 
   na Fonte -  Pessoa Física.
   - Comprovante de Rendimentos Pagos e de Retenção de   Imposto de Renda 
   na Fonte - Pessoa Jurídica.
   - Declaração de Imposto de Renda na Fonte.
================================================================================
CM$VER      2.01.06     21/06/1999
--------------------------------------------------------------------------------
* Disponibilizada tela de Geração de Dirf
================================================================================
CM$VER      2.01.05     17/06/1999
--------------------------------------------------------------------------------
* Inclusão do novo tipo de busca do beneficiário na tela de lançamento de IRRF. 
   Para buscar um beneficiário, basta digitar as primeiras letras da razão social 
   (Pessoa Jurídica) ou nome (Pessoa Física) teclar TAB e ENTER no botão de
   procura. O sistema retornará todos os beneficiários iniciados com as letras
   indicadas.
================================================================================
CM$VER      2.01.04     15/06/1999
--------------------------------------------------------------------------------
* Correções na tela de lançamento de Documentos no IRRF
================================================================================
CM$VER      2.01.03     09/06/1999
--------------------------------------------------------------------------------
* Corrigido problema na tela de lançamento de IRRF, onde aparecia a mensagem:
  "field tipo not found"
================================================================================
CM$VER      2.01.02     24/05/1999
--------------------------------------------------------------------------------
* Alterado o sistema para ficar compatível com novas funções
Histórico de alterações efetuadas no módulo IRRF
================================================================================
CM$VER      2.01.01     22/03/1999
--------------------------------------------------------------------------------
Acertado o erro de nome da tabela nao existe 
================================================================================
CM$ALT}




















































