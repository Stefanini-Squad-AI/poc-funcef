program Folha;

// Alterações:
{
--------------------------------------------------------------------------------
Pendencia   : WO19556
Data        : 11/03/2025
Responsavel : Edilaine
Alteração   : Refatoraçao do processo da previa
--------------------------------------------------------------------------------
Pendência   : WO2511
Data        : 14/05/2024
Responsável : Helen V Bianchi
Alteração   : Mapa da Folha de Benefício
--------------------------------------------------------------------------------
Pendência   : SOL 207789/16619 KINTANA 554287
Data        : 05/07/2015
Responsável : Fernando Xavier
Alteração   : Criação de Nova Funcionalidade para Batimento de Retorno das
              Informações da Fita de Crédito
--------------------------------------------------------------------------------
}


{%ToDo 'Folha.todo'}

uses
  windows,
  Forms,
  UModulo in 'UModulo.pas',
  uAdmPrevFB in 'UAdmPrevFB.pas',
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FEntrada in 'FEntrada.pas' {frmEntrada},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCadastroGrid in '..\..\Cm\Forms\Source\FCadastroGrid.pas' {frmCadastroGrid},
  FCadMestreDet in '..\..\Cm\Forms\Source\FCadMestreDet.pas' {frmCadMestreDetalhe},
  DIntegracao in 'DIntegracao.pas' {dtmIntegracao: TDataModule},
  UFuncoesFolha in 'UFuncoesFolha.pas',
  UFuncoesUteisFB in 'UFuncoesUteisFB.pas',
  FLerInfoIntegra in 'FLerInfoIntegra.pas' {frmLerInfoIntegra},
  FAssocRubricaPlano in 'FAssocRubricaPlano.pas' {frmAssocRubricaPlano},
  DAPrev in 'DAPrev.pas' {dtmAPrev: TDataModule},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  DFolha in 'DFolha.pas' {dtmFolha: TDataModule},
  UParticipanteFB in 'UParticipanteFB.pas',
  DIntegraCAPCAR in 'DIntegraCAPCAR.pas' {dtmIntegraCAPCAR: TDataModule},
  UMovReservaFB in 'UMovReservaFB.pas',
  FPreparo in 'FPreparo.pas' {frmPreparo},
  FPedeInfAux in 'FPedeInfAux.pas' {frmPedeInfAux},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  dPREVIA in 'dPREVIA.pas' {dtmPREVIA: TDataModule},
  FPRelPrevia in 'FPRelPrevia.pas' {frmPRelPREVIA},
  FCadProvento in 'FCadProvento.pas' {FrmCadProvento},
  fImportaTxt in 'fImportaTxt.pas' {FrmImportaTxt},
  FCadLayoutDesconto in 'FCadLayoutDesconto.pas' {frmCadLayoutDesconto},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {frmCadastroGridCS},
  UContribAssistido in 'UContribAssistido.pas',
  FMostraAux in 'FMostraAux.pas' {frmMostraAux},
  UContribuicaoPrevFB in 'UContribuicaoPrevFB.pas',
  FPRelPAFavor in 'FPRelPAFavor.pas' {frmPRelPAFavor},
  dRelFolha in 'dRelFolha.pas' {dtmRelFolha},
  FPRelCredBenef in 'FPRelCredBenef.pas' {frmPRelCredBenef},
  FPRelDemPag in 'FPRelDemPag.pas' {frmPRelDemPag},
  fCadRubXPensaoAlimenticia in 'fCadRubXPensaoAlimenticia.pas' {FrmCadRubXPensaoAlimenticia},
  FParamRelaEntSaiFolha in 'FParamRelaEntSaiFolha.pas' {frmParamRelaEntSaiFolha},
  FParamRelPensBanco in 'FParamRelPensBanco.pas' {frmParamRelPensBanco},
  FParamRelPensAlim in 'FParamRelPensAlim.pas' {frmParamRelPensAlim},
  festornafolha in 'festornafolha.pas' {frmEstornaFolha},
  FPrelBenefEncer in 'FPrelBenefEncer.pas' {frmfprelbenefencer},
  fParamRelFicha in 'fParamRelFicha.pas' {frmParamRelFicha},
  FPRelContraCheque in 'FPRelContraCheque.pas' {frmPRelContraCheque},
  FPRelCredBenefAgen in 'FPRelCredBenefAgen.pas' {frmPRelCredBenefAgen},
  uSincronismo in 'uSincronismo.pas',
  dRelFolhaAtividade in 'dRelFolhaAtividade.pas' {dtmRelFolhaAtividade},
  FParamRelApropContabil in 'FParamRelApropContabil.pas' {frmApropContabil},
  FTelaAuxRegra in 'ftelaauxregra.pas' {frmTelaAuxRegra},
  fParamRelBenefPendentes in 'fParamRelBenefPendentes.pas' {frmParamRelBenefPendentes},
  fParamRelBenefRetidos in 'fParamRelBenefRetidos.pas' {frmParamRelBenefRetido},
  Fpessoa in '..\..\Cm\Forms\Source\fPessoa.pas' {frmPessoa},
  FConsultaPrevia in 'FConsultaPrevia.pas' {frmConsultaPrevia},
  dRelGeral in 'dRelGeral.pas' {dtmRelGeral},
  FParamRelPreparo in 'FParamRelPreparo.pas' {frmParamRelPreparo},
  FExportaTxT in 'FExportaTxT.pas' {frmExportaTXT},
  FParamRelRendasAlteradas in 'FParamRelRendasAlteradas.pas' {frmPRelRendasAlteradas},
  fParamRelResRubrica in 'fParamRelResRubrica.pas' {frmParamRelResRubrica},
  fPRelArqPagEletr in 'fPRelArqPagEletr.pas' {frmPRelArqPagEletr},
  fPRelPagtoIndiv in 'fPRelPagtoIndiv.pas' {frmPRelPagtoIndiv},
  FPRelCredBenefBan in 'FPRelCredBenefBan.pas' {frmPRelCredBenefBan},
  fPRelRubrica in 'fPRelRubrica.pas' {frmPRelRubrica},
  fPRelLayout in 'fPRelLayout.pas' {frmPRelLayout},
  uCalcDv in 'uCalcDv.pas',
  FCadTmpDesc in 'FCadTmpDesc.pas' {frmCadTmpDesc},
  fGeraArquivoRemessa in 'fGeraArquivoRemessa.pas' {frmGeraArquivoRemessa},
  FConsultaHistorico in 'FConsultaHistorico.pas' {frmConsultaHistorico},
  FPrelBenConced in 'FPrelBenConced.pas' {frmPRelBenConced},
  FParamBenefSituacao in 'FParamBenefSituacao.pas' {frmParamRelBenefSituacao},
  FCMParamRel in '..\..\Cm\Relats\Source\FCMParamRel.pas' {CMParamRel},
  cmRepBtn in '..\..\Cm\Relats\Source\cmRepBtn.pas',
  FCMPreview in '..\..\Cm\Relats\Source\FCMPreview.pas' {frmCMPreview},
  FFolhaNormalPrevia in 'FFolhaNormalPrevia.pas' {frmFolhaNormalPrevia},
  fFolhaExtra in 'fFolhaExtra.pas' {frmFolhaExtra},
  FPagamentoPendente in 'FPagamentoPendente.pas' {frmPagamentoPendente},
  dFolhaPrevia in 'dFolhaPrevia.pas' {dtmFolhaPrevia: TDataModule},
  FParamRelBenefPgto in 'FParamRelBenefPgto.pas' {frmBenefPgto},
  FCadHstBeneficio in 'FCadHstBeneficio.pas' {frmCadHstBeneficio},
  drelbenef in 'drelbenef.pas' {dtmRelBenef},
  FParamRelBenefHist in 'FParamRelBenefHist.pas' {FrmPRelHistBen},
  FEscolhaFundacao in 'FEscolhaFundacao.pas' {frmEscolhaFundacao},
  FCadExcessoesIR in 'FCadExcessoesIR.pas' {FrmCadExcessoesIR},
  fVisaoGerencial in 'fVisaoGerencial.pas' {frmVisaoGerencial},
  FParamRelSuplMaiorMenor in 'FParamRelSuplMaiorMenor.pas' {frmParamRelSuplMaiorMenor},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FCadRubricaIndiv in 'FCadRubricaIndiv.pas' {frmCadRubricaIndiv},
  fFrameProgresso in 'fFrameProgresso.pas' {frmFrameProgresso: TFrame},
  UConstFolha in 'UConstFolha.pas',
  UPrevia in 'UPrevia.pas',
  dContabil in 'dContabil.pas' {dtmContabil: TDataModule},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FCadLayoutDescontoSaida in 'FCadLayoutDescontoSaida.pas' {frmCadLayoutDescontoSaida},
  FParamrelRubFontePag in 'FParamrelRubFontePag.pas' {frmParamrelRubFontePag},
  REstorno in 'REstorno.pas',
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  FConsultaEstorno in 'FConsultaEstorno.pas' {frmConsultaEstorno},
  DRelPortFormaVersao in 'DRelPortFormaVersao.pas' {dtmRelPortadorVersao},
  FPRelPortFormaVersao in 'FPRelPortFormaVersao.pas' {frmprelportformaversao},
  FParametroFolha in 'FParametroFolha.pas' {FrmParametroFolha},
  fTratamentoConvenio in 'fTratamentoConvenio.pas' {frmTratamentoConvenio},
  fConsultaConvenio in 'fConsultaConvenio.pas' {frmConsultaConvenio},
  dRelRubricas in 'dRelRubricas.pas' {dtmRelRubricas},
  uFiario in 'uFiario.pas',
  FCadAlteraFormaPagto in 'FCadAlteraFormaPagto.pas' {FrmCadAlteraFormaPagto},
  FMotivoDesfazPreparo in 'FMotivoDesfazPreparo.pas' {frmMotivoDesfazpreparo},
  dRelResRubrica in 'dRelResRubrica.pas' {DtmRelResRubrica},
  FEstruturaCalculo in 'FEstruturaCalculo.pas' {frmEstruturaCalculo},
  dRelParamRubricas in 'dRelParamRubricas.pas' {dtmRelParamRubricas},
  FRelParamRubricas in 'FRelParamRubricas.pas' {FrmRelParamRubricas},
  FReajRubIndiv in 'FReajRubIndiv.pas' {frmReajRubIndiv},
  dRelQtdMensalPartBenef in 'dRelQtdMensalPartBenef.pas' {dtmRelQtdMensalPartBenef},
  dRelaQtdPartFolha in 'dRelaQtdPartFolha.pas' {dtmRelaQtdPartFolha},
  dRelEstatSuplBenef in 'dRelEstatSuplBenef.pas' {dtmRelEstatSuplBenef},
  FFiltroGraficoDescontos in 'FFiltroGraficoDescontos.pas',
  FFiltroGraficoFolhaBenef in 'FFiltroGraficoFolhaBenef.pas',
  FFiltroGraficoQtdPartFolha in 'FFiltroGraficoQtdPartFolha.pas',
  FfiltroGraficoSuplDescFolha in 'FFiltroGraficoSuplDescFolha.pas',
  FFiltroQtdMensalPartBenef in 'FFiltroQtdMensalPartBenef.pas',
  FFiltroRelaQtdPartFolha in 'FFiltroRelaQtdPartFolha.pas' {FrmFiltroRelaQtdPartFolha},
  FReports_Folha in 'FReports_Folha.pas' {FrmReports_Folha},
  FCadGrupoRubrica in 'FCadGrupoRubrica.pas' {FrmCadGrupoRubrica},
  FCadDepJudicial in 'FCadDepJudicial.pas' {FrmCadDepJudicial},
  dRelPendenciaFolha in 'drelpendenciafolha.pas' {DtmRelPendencia},
  FPRelPendenciaFolha in 'fprelpendenciafolha.pas' {frmPRelPendencia},
  dRelCartasBanco in 'dRelCartasBanco.pas' {dtmRelCartasBanco},
  FPRelCartasBanco in 'FPRelCartasBanco.pas' {frmPRelCartasBanco},
  dRelBenefaPreparar in 'dRelBenefaPreparar.pas' {dtmRelBenefaPreparar},
  FPRelBenefaPreparar in 'FPRelBenefaPreparar.pas' {FrmPRelBenefaPreparar},
  drelValorLiquido in 'drelValorLiquido.pas' {DtmRelValorLiquido},
  fpRelValorLiquido in 'fpRelValorLiquido.pas' {frmPRelValorLiquido},
  dRelEntSaiFolha in 'dRelEntSaiFolha.pas' {dtmRelEntSaiFolha},
  FPRelEntSaiFolha in 'FPRelEntSaiFolha.pas' {FrmPRelEntSaiFolha},
  dRelBenefRetidos in 'dRelBenefRetidos.pas' {dtmRelBenefRetidos},
  dRelaTotSuplBenef in 'dRelaTotSuplBenef.pas' {dtmRelaTotSuplBenef},
  dRelBenefINSS in 'dRelBenefINSS.pas' {dtmRelBenefINSS},
  FFiltroRelBenefINSS in 'FFiltroRelBenefINSS.pas' {FrmFiltroRelBenefINSS},
  dRelContraCheque in 'dRelContraCheque.pas' {dtmRelContraCheque},
  FParamRelEstatSuplBenef in 'FParamRelEstatSuplBenef.pas' {FRMParamRelEstatSuplBenef},
  uCmCtrlRptFolha in 'uCmCtrlRptFolha.pas',
  fParamReports_Padrao in '..\FontesMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  uBeneficioFolha in 'uBeneficioFolha.pas',
  fFrameConsultaHistorico in '..\CMFBCOMUM50\source\fFrameConsultaHistorico.pas' {frmFrameConsultaHistorico: TFrame},
  FFiltroRelaTotSupl in 'FFiltroRelaTotSupl.pas' {FrmFiltroRelaTotSupl},
  FPRelTotSuplemInt in 'FPRelTotSuplemInt.pas' {FrmPRelTotSuplemInt},
  dRelTotSuplemInt in 'dRelTotSuplemInt.pas' {dtmRelTotSuplemInt},
  FCadRubFavContacorrente in 'FCadRubFavContacorrente.pas' {frmCadRubFavContacorrente},
  UObjFolha in '..\CMFBOBJ50\source\UObjFolha.pas',
  fConsultaPreparo in 'fConsultaPreparo.pas' {frmConsultaPreparo},
  dRelDivergContrib in 'dRelDivergContrib.pas' {dtmRelDivergContrib},
  FPRelDivergContrib in 'FPRelDivergContrib.pas' {FrmPRelDivergContrib},
  fConferenciaPrevia in 'fConferenciaPrevia.pas' {frmConferenciaPrevia},
  fConsHstCompensaIR in 'fConsHstCompensaIR.pas' {frmConsHstCompIR},
  FCadTipoAcaoxRegra in 'FCadTipoAcaoxRegra.pas' {FrmCadTipoAcaoxRegra},
  uCtrl2ViaContraCheque in '..\CMFolhaObjMT\source\uCtrl2ViaContraCheque.pas',
  dRelAlteracaoBenefPagos in 'dRelAlteracaoBenefPagos.pas' {dtmRelAlteracaoBenefPagos},
  dRelFichaFinanc in 'dRelFichaFinanc.pas' {dtmRelFichaFinanc},
  FPRelAlteracaoBenefPagos in 'FPRelAlteracaoBenefPagos.pas' {FrmPRelAlteracaoBenefPagos},
  dRelRendasAlteradas in 'dRelRendasAlteradas.pas' {dtmRelRendasAlteradas},
  uDesfazerPreparo in 'uDesfazerPreparo.pas',
  FReajustaPercPensao in 'FReajustaPercPensao.pas' {frmReajustaPercPensao},
  fConsultaGlobalPrevia in 'fConsultaGlobalPrevia.pas' {frmConsultaGlobalPrevia},
  dRelFichaFinancIndiv in 'dRelFichaFinancIndiv.pas' {dtmRelFichaFinancIndiv},
  FPRelFichaFinancIndiv in 'FPRelFichaFinancIndiv.pas' {FrmPRelFichaFinancIndiv},
  FExportaVariosConvenios in 'FExportaVariosConvenios.pas' {FrmExportaVariosConvenios},
  uExportacao in 'uExportacao.pas',
  FAssocLayoutEntxSaida in 'FAssocLayoutEntxSaida.pas' {frmAssocLayoutEntxsaida},
  dRelRubSalariais in 'dRelRubSalariais.pas' {dtmRelRubSalariais},
  FPRelRubSalariais in 'FPRelRubSalariais.pas' {FrmRelRubSalariais},
  uReajustaPercPensao in 'uReajustaPercPensao.pas',
  FCadAlimentados in 'FCadAlimentados.pas' {frmCadAlimentados},
  fCadBancoPortadorCS in 'fCadBancoPortadorCS.pas' {frmCadBancoPortadorCS},
  FAcertaParamContabilFinanc in 'FAcertaParamContabilFinanc.pas' {FrmAcertaParamContabilFinanc},
  dRelLancNaoProcessados in 'dRelLancNaoProcessados.pas' {dtmRelLancNaoProcessados},
  FParamRelLancnaoProcessados in 'FParamRelLancnaoProcessados.pas' {FrmParamRelLancNaoProcecssados},
  FCadRegraxRubrica in 'FCadRegraxRubrica.pas' {FrmCadRegraxRubrica},
  FmsgContraCheque in 'FmsgContraCheque.pas' {FrmMsgContraCheque},
  uConsultas in 'uConsultas.pas',
  fCadParamAntecipAbono in 'fCadParamAntecipAbono.pas' {frmCadParamAntecipAbono},
  mRegraDB in 'mRegraDB.pas' {molRegraDB: TFrame},
  FGeraSaidaCadastral in 'FGeraSaidaCadastral.pas' {frmGeraSaidaCadatral},
  FGeraArquivoConsignatario in 'FGeraArquivoConsignatario.pas' {frmGeraArquivoConsignatario},
  fProcessoPadrao in 'fProcessoPadrao.pas' {frmProcessoPadrao},
  fFolhaNormalEfet in 'fFolhaNormalEfet.pas' {frmFolhaNormalEfet},
  DAutorizacao in '..\..\Cm\Forms\Source\DAutorizacao.pas' {DtmAutorizacao: TDataModule},
  FGeraArqSaidaGenerica in 'FGeraArqSaidaGenerica.pas' {FrmOkCancelar1},
  fGeraArquivoRemessaPrevia in 'fGeraArquivoRemessaPrevia.pas' {frmGeraArquivoRemessaPrevia},
  FCadContaBanco in 'fcadcontabanco.pas' {frmCadContaBanco},
  UFolhaBenef in '..\CMFBOBJ50\source\UFolhaBenef.pas',
  fConsultaParametrizacaoPrevia in 'fConsultaParametrizacaoPrevia.pas' {frmConsultaParametrizacaoPrevia},
  uCtrlBancoPortForma in '..\CtrlObjects\uCtrlBancoPortForma.pas',
  FPRel2ViaCChequeMT in '..\CMFolhaObjMT\source\FPRel2ViaCChequeMT.pas' {frmPRel2ViaCChequeMT},
  dRel2ViaCChequeMT in '..\CMFolhaObjMT\source\dRel2ViaCChequeMT.pas' {DtmRel2ViaCChequeMT},
  dRelPagtoIndiv in 'dRelPagtoIndiv.pas' {dtmRelPagtoIndiv},
  uCtrlRelParametrosRubBenef in 'uCtrlRelParametrosRubBenef.pas',
  rParametrosRubBenef in 'rParametrosRubBenef.pas' {RptParametrosRubBenef},
  FCadCompensaIRRF in 'FCadCompensaIRRF.pas' {FrmCadCompensaIRRF},
  FWizardMT in '..\..\Cm\Forms\SourceMT\FWizardMT.pas' {frmWizardMT},
  FExecAbateReserva in 'FExecAbateReserva.pas' {frmExecAbateReserva},
  FProgresso in '..\..\Cm\Forms\Source\FProgresso.pas' {frmProgresso},
  FCadConjuntoRubrica in '..\..\Cm\CMPrevMT50\Source\FCadConjuntoRubrica.pas' {FrmCadConjuntoRubrica},
  FAssociaConjuntoxRubrica in '..\..\Cm\CMPrevMT50\Source\FAssociaConjuntoxRubrica.pas' {FrmAssociaConjuntoxRubrica},
  UCtrlBenefBfciario in '..\..\Cm\CMPrevMT50\CtrlObjects\UCtrlBenefBfciario.pas',
  uDbBenefbfciario in '..\..\Cm\CMPrevMT50\DBObjects\uDbBenefbfciario.pas',
  UFuncoesPrevMT50 in '..\..\Cm\CMPrevMT50\Source\UFuncoesPrevMT50.pas',
  UCtrlConjuntoRubrica in '..\..\Cm\CMPrevMT50\CtrlObjects\UCtrlConjuntoRubrica.pas',
  uDbConjuntorubxrub in '..\..\Cm\CMPrevMT50\DBObjects\uDbConjuntoRubxRub.pas',
  uDbConjuntorubrica in '..\..\Cm\CMPrevMT50\DBObjects\uDbConjuntoRubrica.pas',
  DLookFolha in 'DLookFolha.pas' {dtmLookFolha: TDataModule},
  uCtrlParamRubrica in '..\CtrlObjects\uCtrlParamRubrica.pas',
  uDbParamRubrica in '..\DBObjects\uDbParamRubrica.pas',
  FParamRubricaMT in '..\FontesMT\FParamRubricaMT.pas' {FrmParamRubricaMT},
  mVersaoPagto in '..\CMFolhaObjMT\source\mVersaoPagto.pas' {molVersaoPagto: TFrame},
  FPRelEstruturaRubrica in 'FPRelEstruturaRubrica.pas' {frmPRelEstruturaRubrica},
  uFolhaPreviaObj in 'uFolhaPreviaObj.pas',
  FCadListaRecebedor in '..\..\SHARED\Folhas\FCadListaRecebedor.pas' {FrmCadListaRecebedor},
  FEspera in 'FEspera.pas' {frmEspera},
  FDemPag in 'FDemPag.pas' {FrmDemPag},
  FMsg in 'FMsg.pas' {frmMsg},
  FAbertFechaLoteFB in 'FAbertFechaLoteFB.pas' {frmAbertFechaLoteFB},
  FCadUFINSS in '..\..\Cm\CMAdmPrev\Fontes\FCadUFINSS.pas' {frmCadUFINSS},
  FAdiantamentoExtraFolha in 'FAdiantamentoExtraFolha.pas' {frmAdiantamentoExtraFolha},
  FLancHistBenef in 'FLancHistBenef.pas' {frmLancHistBenef},
  FEncerramentoPorFalecimento in 'FEncerramentoPorFalecimento.pas' {frmEncerramentoPorFalecimento},
  FSelecionaLoteEF in 'FSelecionaLoteEF.pas' {frmSelecionaLoteEF},
  FManutRubricaReembolsoINSS in 'FManutRubricaReembolsoINSS.pas' {frmManutRubricaReembolsoINSS},
  FInsereRubricasINSSFolha in 'FInsereRubricasINSSFolha.pas' {frmInsereRubricasINSSFolha},
  UntPrincipal in 'UntPrincipal.pas' {frmPrincipalRubricaIndiv},
  FfinancHabitacional in 'FfinancHabitacional.pas' {FrmFinancHabitacional},
  FCadRubricaIndividual in 'FCadRubricaIndividual.pas' {frmCadRubricaIndividual},
  FCadRubricaIndividualInserir in 'FCadRubricaIndividualInserir.pas' {frmCadRubricaIndividualInserir},
  FHistCompSalContri in 'FHistCompSalContri.pas' {FrmHistCompSalContri},
  FPreparoSP in 'FPreparoSP.pas' {frmPreparoSP},
  FDemPagSelEstado in 'FDemPagSelEstado.pas' {FrmDemPagSelEstado},
  fRubricasIndividuaisEmLote in 'fRubricasIndividuaisEmLote.pas' {frmRubricasIndividuaisEmLote},
  fDesfazerCadastroRubricas in 'fDesfazerCadastroRubricas.pas' {frmDesfazerCadastroRubricas},
  FPrestacaoContasINSSMotivo in 'FPrestacaoContasINSSMotivo.pas' {frmPrestacaoContasINSSMotivo},
  FPrestacaoContasINSS in 'FPrestacaoContasINSS.pas' {frmPrestacaoContasINSS},
  FGeraLstIndivResul in '..\..\SHARED\Folhas\FGeraLstIndivResul.pas' {FrmGeraLstIndivResul},
  FGeraLstIndiv in '..\..\SHARED\Folhas\FGeraLstIndiv.pas' {FrmGeraLstIndiv},
  UCadastroEventoRegularizacao in 'UCadastroEventoRegularizacao.pas' {frmCadastroEventoRegularizacao},
  UConciliacaoCredito in 'UConciliacaoCredito.pas' {frmConciliacaoCredito},
  ULancEventoRegularizacao in 'ULancEventoRegularizacao.pas' {frmLancEventoRegularizacao},
  FLancContasReceber in 'FLancContasReceber.pas' {frmLancContasReceber},
  FLancContasPagar in 'FLancContasPagar.pas' {frmLancContasPagar},
  fColMapaFolha in 'fColMapaFolha.pas' {FrmColMapaFolha},
  uDbColMapaFolha in '..\DBObjects\uDbColMapaFolha.pas',
  FSelecionaParamAntecipaAbono in 'FSelecionaParamAntecipaAbono.pas' {frmSelecionaParamAntecipaAbono},
  uCtrlColMapaFolha in '..\CtrlObjects\uCtrlColMapaFolha.pas',
  FObservacao in 'FObservacao.pas' {FrmObservacao},
  FRemessaEletronica in 'FRemessaEletronica.pas' {FrmRemessaEletronica},
  FMapaFolhaBenef in 'FMapaFolhaBenef.pas' {frmMapaFolhaBenef},
  FManutListaExecPrevia in 'FManutListaExecPrevia.pas' {frmManutListaExecPrevia};

//Helen - SOL: 191083 KINTANA: 1809048 - Fim

{$R *.RES}
{$R FOLHA_RES.RES}

begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Folha de Benefícios';

  Application.HelpFile := 'C:\ProjetosCM5\Bin\Folha.hlp';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TdtmLookFolha, dtmLookFolha);
  Application.CreateForm(TdtmAPrev, dtmAPrev);
  Application.CreateForm(TdtmFolha, dtmFolha);
  Application.CreateForm(TdtmIntegracao, dtmIntegracao);
  Application.CreateForm(TdtmIntegraCAPCAR, dtmIntegraCAPCAR);
  //Application.CreateForm(TdtmFolhaPrevia, dtmFolhaPrevia);   //edilaine WO19556
  Application.CreateForm(TdtmContabil, dtmContabil);
  Application.CreateForm(TdtmRelParamRubricas, dtmRelParamRubricas);
  Application.CreateForm(TDtmAutorizacao, DtmAutorizacao);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TfrmPRelEstruturaRubrica, frmPRelEstruturaRubrica);
  Application.CreateForm(TfrmMsg, frmMsg);
  Application.CreateForm(TFrmGeraLstIndivResul, FrmGeraLstIndivResul);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;

  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Folha de Benefícios
================================================================================
CM$VER      3.05.20m    16/06/2008
--------------------------------------------------------------------------------
Pendência : 27921
Tela      : Cálculo da Folha | Prévia | Normal
Descrição : Garantir que seja gravado corretamente a portabilidade na previa
================================================================================
CM$VER      3.05.20l    05/06/2008
--------------------------------------------------------------------------------
Pendência : 28031
Tela      : Cálculo da Folha | Prévia | Folha Extra
Descrição : Ajuste no Plano Contabil da folha extra
================================================================================
CM$VER      3.05.20k    28/05/2008
--------------------------------------------------------------------------------
Pendência : 27844
Tela      : Consulta | Histórico de Pagamento da Folha
Descrição : Ajuste na busca de pessoas na consulta do histórico
Pendência : 27889
Tela      : Cálculo da Folha | Prévia | Normal
Descrição : Ajuste na atualização do responsável quando o prazo de molestia grave vencer
================================================================================
CM$VER      3.05.20j    26/05/2008
--------------------------------------------------------------------------------
Pendência : 27962
Tela      : Cálculo da Folha | Prévia | Folha Extra
Descrição : Ajuste na rotina da folha estra não estava gravando dependentes
================================================================================
CM$VER      3.05.20i    12/05/2008
--------------------------------------------------------------------------------
Pendência : 27906
Tela      : Cálculo da Folha | Prévia | Normal
Descrição : Ajuste na rotina que pega os parametros contábeis para a geração da prévia.
================================================================================
CM$VER      3.05.20h    08/05/2008
--------------------------------------------------------------------------------
Pendência : 27838 (ReAbertura)
Tela      : Consulta | Prévia de Pagamento da Folha e Histórico de Pagamento da Folha
Descrição : Ajuste na rotina que gera a consulta de Prévia e histórico de pagamento.
================================================================================
CM$VER      3.05.20g    06/05/2008
--------------------------------------------------------------------------------
Pendência : 27839 (ReAbertura)
Tela      : Cálculos da Folha | Previa | Folha Extra
Descrição : Ajuste na geração da folha extra.
================================================================================
CM$VER      3.05.20f    06/05/2008
--------------------------------------------------------------------------------
Pendência : 27839
Tela      : Cálculos da Folha | Previa | Folha Extra
Descrição : Ajuste na geração da folha extra.
Pendência : 27838
Tela      : Consulta | Prévia de Pagamento da Folha e Histórico de Pagamento da Folha
Descrição : Ajuste na rotina que gera a consulta de Prévia e histórico de pagamento.
================================================================================
CM$VER      3.05.20e    31/03/2008
--------------------------------------------------------------------------------
Pendência : 27589
Tela      : Cálculos da Folha | Preparo
Descrição : Ajuste no reajuste de benefício no preparo da folha.
================================================================================
CM$VER      3.05.20d    26/02/2008
--------------------------------------------------------------------------------
Pendência : 22537
Tela      : Cálculos da Folha | Efetivação
Descrição : Ativar o demosntrativo de contra-cheque automaticamente apos a efetivção.
================================================================================
CM$VER      3.05.20c    12/03/2008
--------------------------------------------------------------------------------
Pendência : 27424
Tela      : Sistema | Utilitários | Gera arquivo entidade
Descrição : Correção da gravação dos lançamentos (estava gerando valores incorretos, para documentos "sem arquivo")
Pendência : 27409
Tela      : Sistema | Consulta | Prévia de Pagamento da Folha
Descrição : Ajuste na pesquisa da Consulta da prévia
================================================================================
CM$VER      3.05.20b    30/01/2008
--------------------------------------------------------------------------------
Pendência : 27078 (reabertura)
Tela      : Sistema | Utilitários | Gera arquivo entidade
Descrição : Nova verificação da combinação de Plano/Patro antes de disparar o processo de integração
================================================================================
CM$VER      3.05.20a    21/01/2008
--------------------------------------------------------------------------------
Pendência : 27234
Tela      : Cálculo da Folha | Prévia | Normal
Descrição : Ajuste no cálculo de Rateio de rubricas
Pendência : 27078
Tela      : Sistema | Utilitários | Gera arquivo entidade
Descrição : Gravação de novo campo para representar o favorecido, para manter a integridade referencial entre as tabelas PROCCONVENODOC e PROCONVRATEIO
Pendência : 27165
Tela      : Cálculos da Folha | Preparo
Descrição : Ajuste no reajuste de benefício no preparo da folha.
Pendência : 27063
Tela      : Cálculos da Folha | Efetivação
Descrição : Decrementar o numero da parcela quando ocorrer excesso de debito quando for convenio externo
Pendência : 27222
Tela      : Tela Principal
Descrição : Ajusta o menu de consultar Grárifo.
================================================================================
CM$VER      3.05.20     19/12/2007
--------------------------------------------------------------------------------
Pendência : 27123
Tela      : Cálculos da Folha | Preparo
Descrição : Ajuste no preparo que não estava acumulando o valor do beneficio.
Pendência : 26576
Tela      : Cálculos da Folha | Efetivação de Versão de Pagamento
Descrição : Ajuste quando a concessão for de portabilidade.
Pendência : 26942
Tela      : Consulta | Relatório | Folha de Pagamento de Benefícios
Descrição : Ajuste na duplciação das informações do relatorio.
Pendência : 26821
Tela      : Cálculos da Folha | Prévia | Normal
Descrição : Correção da previa para a parametrização do plano contábil.
Pendência : 26824
Tela      : Cálculos da Folha | Prévia | Normal
Descrição : Correção da previa para PA.
Pendência : 26854
Tela      : Cálculos da Folha | Prévia | Normal
Descrição : Ajuste no calculo de IR para quem optou pela tabela regressiva.
Pendência : 26961
Tela      : Consulta | Relatórios | Folha de Beneficios | Gerenciais | Relatório de Totais de Suplementações Integrais
Descrição : Acerto na consulta do relatório.
Pendência : 26965
Tela      : Cadastro | Entidades Externas | Exportação de Arquivos
Descrição : Acerto na consulta do processo.
Pendência : 26655
Tela      : Cálculos da Folha | Prévia | Normal
Descrição : Ajuste para calcular base regresiva quando for abono
Pendência : 26800
Tela      : Cálculos da Folha | Consulta | Relatório | Folha de Pagamento de Benefício
Descrição : Ajustar a consulta para mostrar o favorecido quando EPP.
Pendência : 26823
Tela      : Cálculos da Folha | Preparo
Descrição : Incluir na busca Antecipação de Abono de Revisão
Pendência : 26923
Tela      : Cálculos da Folha | Preparo
Descrição : Ajuste na geração do preparo quando o valor do beneficio é igual a zero
Pendência : 26840
Tela      : Cálculos da Folha | Prévia | Normal
Descrição : Correção da previa para a gravação das rubricas de abono
Pendência : 14004
Tela      : Cálculos da Folha | Prévia | Normal
Descrição : Permitir continuar a rodar uma prévia que foi interompida por qualquer motivo
Pendência : 18830
Tela      : Sistema | Configuração | Parâmetros do Sistema
Descrição : Não permitir a utilização da mesma rubrica em mais de um parâmetro de imposto de renda.
Pendência : 25662
Tela      : Cálculos da Folha | Preparo
Descrição : Passar o campo DATAINICIOFUND (data início do benefício) da Benefbfciario para as regras de reajuste, independente do valor do campo DATAINICIO (data início de pagamento).
Pendência : 26353
Tela      : Cálculos da Folha | Prévia | Normal
Descrição : Considerar as rubricas de correção monetária de benefício para o Rateio de IR e INSS por plano. Não considerar as rubricas de INSS na apuração das bases de rateio.
Pendência : 26347
Tela      : Cálculos da Folha | Prévia | Pagamento Pendente
Descrição : Ajuste no grid de pagamentos pendentes a processar para evitar a duplicidade de registros na Elegpatro.
Pendência : 26665
Tela      : Cadastros | Rubricas Individuais | Cadastro de alimentados.
Descrição : Alterando CmeCadastro para não chamar a herança e retirando a Qry do AplicaAlteracoes.
Pendência : 24446
Tela      : Cadastros | Ação Judicial | Ação Judicial de Imposto de Renda
Descrição : Implementando validação para não deixar gravar Nº de Processo igual.
Pendência : 17248
Tela      : Consultas | Relatórios | Folha de Benefícios | Gerenciais | Relatório de Rendas Alteradas
Descrição : Implementação da ordenação por critério de valor, mostrar no relatório a quanridade de registros e permitir imprimir apenas registros do mês, desconsiderando registros de migrações, revisões e etc.
Pendência : 20840 (reabertura)
Tela      : Sistema | Utilitários | Gera arquivo entidade
Descrição : Correção na gravação do rateio de convênios e complementação de algumas mensagens de erro
Pendência : 25937
Tela      : Cadastros | Manual do Histórico de Benefícios
Descrição : Controle de Acesso para o "Valores vinculados ao Benefício"
================================================================================
CM$VER      3.05.18j    06/11/2007
--------------------------------------------------------------------------------
Pendência : 26652
Tela      : Cálculos da Folha | Prévia | Normal
Descrição : Ajuste nos valores calculados para o rateio de rubricas (IRRF) por plano contábil.
Pendência : 26654
Tela      : Cálculos da Folha | Prévia | Normal
Descrição : Correção para lançar rubricas de CPMF no mesmo plano contábil do benefício de INSS.
================================================================================
CM$VER      3.05.18i    25/10/2007
--------------------------------------------------------------------------------
Pendência : 26651
Tela      : Cáluclos da Folha | Prévia | Normal
Descrição : Ajuste na busca da parametrização Contabil e Financeira da previa
================================================================================
CM$VER      3.05.18h    23/10/2007
--------------------------------------------------------------------------------
Pendência : 26665
Tela      : Cadastros | Rubricas Individuais | Cadastro de alimentados.
Descrição : Alterando CmeCadastro para não chamar a herança e retirando a Qry do AplicaAlteracoes.
================================================================================
CM$VER      3.05.18g    17/10/2007
--------------------------------------------------------------------------------
Pendência : 20840 (reabertura)
Tela      : Sistema | Utilitários | Gera arquivo entidade
Descrição : Correção na gravação do rateio de convênios e complementação de algumas mensagens de erro
================================================================================
CM$VER      3.05.18f    05/10/2007
--------------------------------------------------------------------------------
Pendência : 26347
Tela      : Cálculos da Folha | Prévia | Pagamento Pendente
Descrição : Ajuste no grid de pagamentos pendentes a processar para evitar a duplicidade de registros na Elegpatro.
Pendência : 26353
Tela      : Cálculos da Folha | Prévia | Normal
Descrição : Considerar as rubricas de correção monetária de benefício para o Rateio de IR e INSS por plano. Não considerar as rubricas de INSS na apuração das bases de rateio.
Pendência : 26463
Tela      : Cadastros | Entidades Externas | Layout de desconto entrada
Descrição : No cadastro de layout de desconto de entrada não utilizar o campo PLANO do cadastro do fornecedor, que é desnecessário.
================================================================================
CM$VER      3.05.18e    04/10/2007
--------------------------------------------------------------------------------
Pendência : 26493
Telas     : Cadastro | Manual de Lançamentos para Folha de Benefícios
Descrição : Correcão do tamanho do texto que é gravado na descrição da TMPDESC.
================================================================================
CM$VER      3.05.18d    03/10/2007
--------------------------------------------------------------------------------
Pendência : 19378
Tela      : Cálculos da Folha | Prévia | Normal
Descrição : Implementação de tratamento da data de pagamento. Se o parâmetro na tela "Utiliza Previsão de Pagamento" estiver marcado, será usada a data informada na tela. Se o parâmetro estiver desmarcado será usado como data de pagamento sempre a maior data entre a data do lote e a previsão de pagamento informada.
Pendência : 26490
Telas     : Cadastro | Manual de Lançamentos para Folha de Benefícios
Descrição : Gravar SISTORIGEM como number.
================================================================================
CM$VER      3.05.18c    11/09/2007
--------------------------------------------------------------------------------
Pendência : 21964 (Reabertura)
Telas     : Cálculos da Folha | Efetivação de Versão de Pagamento
Descrição : Gravar na HstFolhaBenefCap o campo dfloatpagtoalter para geração de arquivo bancário.
================================================================================
CM$VER      3.05.18b    05/09/2007
--------------------------------------------------------------------------------
Pendência : 21962 (ReAbertura)
Telas     : Cálculos da Folha / Efetivação de Versão de Pagamento
Descrição : Controlar o pagamento de beneficio de portabilidade para favorecidos EPP.
================================================================================
CM$VER      3.05.18a    23/08/2007
--------------------------------------------------------------------------------
Pendência : 26150
Tela      : Cálculos da Folha | Efetivação
Descrição : Ajuste na efetivação durante a gravação da Rubrica Individual.
Pendência : 26154
Tela      : Relatório de Pagamento de Beneficio
Descrição : Ajuste na duplicação das informações de pagamento do beneficio.
================================================================================
CM$VER      3.05.18     15/08/2007
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.17.
Pendência : 16720
Tela      : Cálculos da Folha | Prévia | Folha Extra
Descrição : Gerar uma folha extra a partir de um arquivo txt.
Pendência : 23758
Tela      : Consultas | Histórico de Pagamento da Folha
Descrição : Inclusão do campos "Situação na Fundação" e "Cálculo do IRRF com base no somatório de todas as fontes".
Pendência : 23908
Tela      : Relatório - 2ª via de demonstrativo de pagamento
Descrição : Inclusão do campo PRAZO
Pendência : 20092
Tela      : Cálculos da Folha | Prévia | Normal e Cálculos da Folha | Efetivação de Versão de Pagamento
Descrição : Gravar o campo idprocjud na prévia e na histrubsal se a pessoa tiver ação judicial.
================================================================================
CM$VER      3.05.16h    07/08/2007
--------------------------------------------------------------------------------
Pendência : 26050
Tela      : Cálculos da Folha | Previa | Normal
Descrição : Ajuste na previa de Antecipação de Abono.
================================================================================
CM$VER      3.05.16g    06/08/2007
--------------------------------------------------------------------------------
Pendência : 21118 (ReAbertura)
Telas     : Cálculo da Folha | Prévia | Normal
Descrição : Nova forma de fazer a busca no valor base do IR durante a Prévia.
================================================================================
CM$VER      3.05.16f    03/08/2007
--------------------------------------------------------------------------------
Pendência : 25937
Tela      : Cadastros | Manual do Histórico de Benefícios
Descrição : Controle de Acesso para o "Valores vinculados ao Benefício"
================================================================================
CM$VER      3.05.16e    26/07/2007
--------------------------------------------------------------------------------
Recompilação referente ao ajuste da tela "Gera Saída Cadastral"
================================================================================
CM$VER      3.05.16d    20/07/2007
--------------------------------------------------------------------------------
Pendência : 25855
Tela      : Cadastros | Rubricas | Rubricas Salariais
Descrição : Acerto para alterar os dados de uma rubrica, que mostrava uma mensagem alertando que já existia uma descrição igual quando na verdade não existe.
Pendência : 25883
Tela      : Cálculos da Folha | Prévia | Folha Extra
Descrição : Acerto para buscar todos os planos contábeis relacionados aos planos previdenciários do participante.
================================================================================
CM$VER      3.05.16c    13/07/2007
--------------------------------------------------------------------------------
Pendência : 25861
Tela      : Cálculos da Folha | Preparo
Descrição : Ajuste no preparo, para Mês para Pagamento do Abono não estiver preenchido.
Pendência : 21964 (Reabertura)
Telas     : Cálculos da Folha | Gera Simulação de Arquivo Bancário da Prévia ou Gera Arquivo de Remessa Bancária
Descrição : Novo Float Alternativo para a data da geração de arquivos eletrônicos.
Pendência : 21962 (ReAbertura)
Telas     : Cálculos da Folha / Efetivação de Versão de Pagamento
Descrição : Controlar o pagamento de beneficio de portabilidade para favorecidos EPP.
Pendência : 25843
Tela      : Cálculos da Folha | Prévia | Normal
Descrição : Ajuste no laço para apagar tabela previa no reprocessamento da Prévia do lote, pois o comando de "delete" está sendo executado mais vezes do que o necessário, onerando o tempo do reprocessamento.
Pendência : 25795
Tela      : Cálculos da Folha | Prévia | Normal
Descrição : Considerar apenas rubricas de provento de benefício no cálculo do provento de CPMF repassada ao beneficiário. Não considerar outras rubricas mesmo que sejam fonte pagadora de INSS.
================================================================================
CM$VER      3.05.16b    03/07/2007
--------------------------------------------------------------------------------
Pendência : 24195 (reabertura)
Tela      : Cadastros | Ação Judicial | Ação Judicial de Imposto de Renda
Descrição : Correção na exibição das rubricas de abono
================================================================================
CM$VER      3.05.16a    25/06/2007
--------------------------------------------------------------------------------
Pendência : 21962 (ReAbertura)
Telas     : Cálculos da Folha / Efetivação de Versão de Pagamento
Descrição : Controlar o pagamento de beneficio de portabilidade para favorecidos EPP.
================================================================================
CM$VER      3.05.16     21/06/2007
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.16.
Pendência : 21237
Telas     : Cadastro / Alteração do Portador Forma de Pagamento
Descrição : Tratar a previa quando for alterado o portador forma de um recebedor.
Pendência : 21962
Telas     : Cálculos da Folha / Efetivação de Versão de Pagamento
Descrição : Controlar o pagamento de beneficio de portabilidade para favorecidos EPP.
Pendência : 14769
Telas     : Consulta / Relatórios / Folha de Pagamento de Benefícios
Descrição : Permite agrupar valores das rubricas parametrizadas pelo cadastro de rubricas.
Pendência : 21874
Tela      : Cálculos da Folha / Efetivação
Descrição : Efetuar desativação automática da Rubrica individual, no processo de Efetivação de versão de pagamento.
            Esta funcionalidade é habilitada pelo novo parâmetro de controle "Desativação Automática da Rubrica Individual encerrada", que fica na pasta "Processo de Efetivação / Efetivação" da tela de parâmetro do sistema.
            As opções deste parâmetro são:
            - sem desativação
            - desativação automática individual
            desativação automática geral (para qualquer registro na condição)
            As situações da rubrica individual para que ocorra a desativação automática são:
            - ter a data final menor que o mês de processamento;
            - ter a quantidade de parcelas processada igual a quantidades de ocorrências;
            - para lançamentos com controle de saldo, ter o total processado igual ao saldo inicial.
Pendência : 24693
Tela      : Cálculos da Folha / Efetivação
Descrição : Para os lotes de Prévia de Folha Extra efetuar sempre a validação de contas correntes e da parametrização contábil e financeira, mesmo que o parâmetro que não obriga esta funcionalidade esteja marcado.
Pendência : 25511
Telas     : Cálculos da Folha / Prévia Normal
Descrição : Corrigir o lançamento contábil invertido de devolução de benefícios de aposentadoria, quando do pagamento de benefícios para pensionistas. Estes lançamentos são realizados automaticamente via Tmpdesc. Para as devoluções de benefícios normais não ocorreu esta inversão contábil, ficando o lançamento correto.
Pendência : 24055
Telas     : Cálculos da Folha / Prévia / Normal
Descrição : Ajuste para obter base e valor de IR sobre abono já processados no mês, quando processar o cálculo do IR sobre abono anual.
Pendência : 25467
Telas     : Cálculos da Folha / Prévia / Normal
Descrição : Alterar forma de cálculo para tratar rubricas referentes ao abono anual e não considerá-la na base normal e vice versa. Com isso, se faz a separação dos valores das bases normal e de abono, no processamento da regra de consignação judicial.
Pendência : 25501
Telas     : Cálculos da Folha / Prévia / Folha Extra
Descrição : Incluir opção de benefício retido na busca dos planos contábeis vinculados à pessoa para a qual se está processando a Folha Extra.
Pendência : 25503
Telas     : Consultas / Demonstrativo de Pagamento
Descrição : Inclusão do número da sequência do dependente que consta da tabela Depentit, na posição 96 do registro tipo 2, com 2 posições.
Pendência : 21118
Telas     : Cálculo da Folha / Prévia / Normal
Descrição : Nova forma de fazer a busca no valor base do IR durante a Prévia.
Pendência : 25109
Telas     : Cadastros / Entidades Externas / Gera Saída Cadastral
Descrição : Alterações no layout, com indicação no número do benefício do INSS e aumento do tamanho do campo do Plano
Pendência : 25645
Telas     : Cadastros / Manual de Lançamentos para a Folha de Benefícios
Descrição : Acerto na atualização de registros.
================================================================================
CM$VER      3.05.15f    01/06/2007
--------------------------------------------------------------------------------
Pendência: 21964 (Reabertura)
Telas: Cadastro | Banco x Contas/Caixas x Forma de Pagamento
Descrição: Novo Float Alternativo para a data da geração de arquivos eletrônicos.
Pendência: 23732
Telas: Cadastro | Ação Judicial | Ação Judicial de Imposto de Renda
Descrição: Controle de acesso para a tela de "Ação Judicial de Imposto de Renda".
================================================================================
CM$VER      3.05.15e    29/05/2007
--------------------------------------------------------------------------------
Pendência: 19430 (Reabertura)
Telas: Cálculos da Folha / Estorno
Descrição: Refaz todo o documento para o estorno individual.
================================================================================
CM$VER      3.05.15d    21/05/2007
--------------------------------------------------------------------------------
Pendência: 19430 (Reabertura)
Telas: Cálculos da Folha / Estorno
Descrição: Refaz todo o documento para o estorno individual.
================================================================================
CM$VER      3.05.15c    16/05/2007
--------------------------------------------------------------------------------
Pendência 20814 (Reabertura)
Tela      : Cadastro | Rubricas | Rubricas De \ Para
Descrição : Permite parametrizar o lançamento automático de rubricas para compensação de Adiantamento;
================================================================================
CM$VER      3.05.15b    08/05/2007
--------------------------------------------------------------------------------
Pendência: 25271
Tela : Cálculos da Folha / Efetivação de Versão de Pagamento
Descrição: Ajuste na gravação do mês referência na efetivação
Pendência: 25110
Tela : Consulta / Consulta Geral de Pessoa
Descrição: Ajuste na busca de Consulta geral de Pessoa
================================================================================
CM$VER      3.05.15a    16/04/2007
--------------------------------------------------------------------------------
Pendência: 23461 (reabertura)
Tela : Cálculos da Folha / Prévia / Pagamento Pendente
Descrição: Exibir na lista de recebedores os favorecidos de rubrica individual (pensão alimentícia e outros).
Pendência: 24962
Tela : Cálculos da Folha / Efetivação
Descrição: Atualizar a informação data da última atualização, sempre que o processo de atualização por índice do saldo total de compensação de IR for processado.
Pendência 20840 (reabertura)
Tela : Sistema | Utilitários | Gera arquivo entidade
Descrição : Corrige chamada da tela de geração.
================================================================================
CM$VER      3.05.15     12/04/2007
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.15.
Pendência: 22804
Telas: Consulta / Relatórios / Relação de Crédito de Beneficiários por agência
Descrição: Obter benefícios de plano desativado, para identificar a matrícula na importação, caso parâmetro "Prepara Benefícios de Plano Desativado" esteja ligado. Vide tela de Sistema / Configuração / Parâmetros do Sistema / Processo Preparo.
Pendência: 22806
Telas: Consulta / Relatórios / Relatório de Pagamento Individual
Descrição: Obter benefícios de plano desativado, para identificar a matrícula na importação, caso parâmetro "Prepara Benefícios de Plano Desativado" esteja ligado. Vide tela de Sistema / Configuração / Parâmetros do Sistema / Processo Preparo.
================================================================================
CM$VER      3.05.14h    12/04/2007
--------------------------------------------------------------------------------
Pendência: 21964 (Reabertura)
Telas: Consulta / Cadastro / Banco x Contas/Caixas x Forma de Pagamento
Descrição: Criação de parametros para controlar o Float e o Float Alternativo para a Data Programada.
================================================================================
CM$VER      3.05.14g    10/04/2007
--------------------------------------------------------------------------------
Pendência: 21136 (Reabertura)
Tela: Cálculos da Folha / Fechamento de Convênios
Descrição: Corrige o erro no fechamento de convênio referente a folha de abono.
================================================================================
CM$VER      3.05.14f    03/04/2007
--------------------------------------------------------------------------------
Pendência: 24976
Telas: Cadastros/ Entidades Externas / Importação de Arquivos
Descrição: Obter benefícios de plano desativado, para identificar a matrícula na importação, caso parâmetro "Prepara Benefícios de Plano Desativado" esteja ligado. Vide tela de Sistema / Configuração / Parâmetros do Sistema / Processo Preparo.
================================================================================
CM$VER      3.05.14e    22/03/2007
--------------------------------------------------------------------------------
Pendência: 24830
Telas: Cálculos da Folha / Prévia Normal
Descrição: Acertar processamento de consignação judicial para resgate de reserva em plano CD.
Pendência: 19430 (Reabertura)
Telas: Cálculos da Folha / Estorno
Descrição: Refaz todo o documento para o estorno individual.
================================================================================
CM$VER      3.05.14d    15/03/2007
--------------------------------------------------------------------------------
Pendência : 24728
Tela : Cálculos da Folha / Efetivação
Descrição : Ajuste na atualização do saldo total de IR compensado.
Pendência : 24690
Tela : Cálculos da Folha / Folha Extra
Descrição : Implementar forma de gravar o idplanoprev e idplanocontabil, em situações de saldamento, nas quais a Partprevplan fica com um plano ativo diferente do plano que possui o benefício ativo.
================================================================================
CM$VER      3.05.14c    13/03/2007
--------------------------------------------------------------------------------
Pendência 20814 (Reabertura)
Tela      : Cadastro | Rubricas | Rubricas De \ Para
Descrição : Permite parametrizar o lançamento automático de rubricas para compensação de Adiantamento;
================================================================================
CM$VER      3.05.14b    12/03/2007
--------------------------------------------------------------------------------
Pendência : 24679
Tela: Relatórios / Operacionais / Relatório de Folha de Pagamento
Descrição : Trata casos que o cabeçalho não foi exibido. Estes casos estão relacionados ao fato de existir apenas o benefício de INSS, ou seja não possuem o benefício Fundação.
Pendência: 24696
Tela: Cálculos da Folha / Prévia Normal
Descrição: Calculou o valor do IRRF, sobre a correção monetária corretamente, porém gravou na rubrica de IR Regressiva de Benefício, e não a de IR Regressiva de Reserva.
================================================================================
CM$VER      3.05.14a    05/03/2007
--------------------------------------------------------------------------------
Pendência: 24588
Tela: Cálculos da Folha / Prévia Normal
Descrição: Verificar divergência no calculo do IRRF, no caso de benefícios com correção.
Pendência : 24622
Tela: Cálculos da Folha / Prévia Normal
Descrição : Tratar inversão de contabilização referente a devolução de benefício, quando tem contabilização individual no benefício.
================================================================================
CM$VER      3.05.14     14/02/2007
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.14.
Pendência 20814
Tela      : Cadastro | Rubricas | Rubricas De \ Para
Descrição : Permite parametrizar o lançamento automático de rubricas para compensação de Adiantamento;
Pendência 20840
Tela      : Sistema | Utilitários | Gera arquivo entidade
Descrição : Criada nova tela para permitir cobrança de taxa de administração sobre conbvênios. Tela contém relatório;
Pendência 19869
Tela      : Cadastros | Entidades Externas | Exportação de arquivo
Descrição : Criada opção em tela para inibir envio de registros de excesso de débito
Pendência 19500
Tela      : Cálculos da Folha | Efetivação de Versão de Pagamento
Descrição : Retirada mensagem de "erro" quando não há retorno de registros para um determinado lote
Pendência 24091
Tela: Cálculos da Folha / Prévia Normal
Descricao : No envio de contribuição sobre abono para a Tmpdesc, gerados pelo módulo BENEFICIOPREV, tratar o campo FLGATRASODEVOL para casos de devolução.
Pendência 18728
Tela      : Cálculos da Folha | Prévia | Normal
Descrição : Permitir parametrizar a verificação de mais de um recebedor por pessoa durante a prévia.
Pendência 24195
Tela      : Cadastros | Ação Judicial | Ação Judicial de Imposto de Renda
Descrição : Incluir crítica para limitar o campo percentual em 100% e de preenchimento da data final quando ação ganha ou perdida.
Pendência 21850
Tela: Cálculos da Folha / Prévia Normal
Descrição : Alteração nas consultas passadas para as regras na Prévia Normal, para retirar os campos de percentual de antecipação de abono (PERCANTECIPABONO e PERCADABONO) que podem ser diferentes de um benefício para outro.
Pendência 21806
Tela      : Cadastros | Rubricas | Rubricas Salariais
Descrição : Atribuir fonte pagadora Fundação como valor default na inserção de novas rubricas. Validar descrição de rubrica já existente.
Pendência 21808
Tela: Cálculos da Folha | Prévia Normal
Descrição : Tratar máscara de data do windows para a exibição da data de pagamento da Prévia. Quando não se colocava a máscara de data do windows como dd/mm/yyyy, a data de pagamento ficava em branco.
Pendência 23923
Tela: Cálculos da Folha | Conferência da Prévia
Descrição : Implementar crítica de lançamentos na Tmpdesc não processados para as pessoas que estão no lote de Prévia de pagamento selecionado na tela.
Pendência 24250
Tela: Cálculos da Folha | Prévia Normal
Descrição : Otimizar processamento da Prévia quando não estiver parametrizado para fazer provisão de abono anual.
================================================================================
CM$VER      3.05.13c    08/02/2007
--------------------------------------------------------------------------------
Pendência: 21559 (reabertura)
Tela: Cadastros / Manual do Histórico de Benefícios
Descrição: Ajuste no controle de exclusão de registros do Histórico de Benefícios.
================================================================================
CM$VER      3.05.13b    09/01/2007
--------------------------------------------------------------------------------
Pendência: 23960
Tela: Cálculos da Folha / Prévia Normal
Descrição: Não lançar rubrica de dedução de dependente e de idade sobre base de antecipação de abono anual, caso este provento esteja parametrizado como isento de IR.
Pendência: 24045
Tela: Cálculos da Folha / Prévia Normal
      Cálculos da Folha / Folha Extra
Descrição: Acerta a gravação o código externo da rubrica (CODPROVDESC) no histórico de rubricas, para os casos de contribuição sobre abono anual para ação judicial ganha e rubricas da folha extra.
Pendência: 24128
Tela: Cadastros / Lista de Recebedor
Descrição: Acerto para importar do arquivo texto também o dependente.
================================================================================
CM$VER      3.05.13a    22/12/2006
--------------------------------------------------------------------------------
Pendência: 24017
Tela: Cálculos da Folha / Prévia / Normal
Descrição: Considerar as rubricas de correção de benefício na base de IR para resgate.
================================================================================
CM$VER      3.05.13     13/12/2006
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.13.
Pendência: 19430
Telas: Cálculos da Folha / Estorno
Descrição: Refaz todo o documento para o estorno individual.
Pendência: 21964
Telas: Consulta / Cadastro / Banco x Contas/Caixas x Forma de Pagamento
Descrição: Criação de parametros para controlar o Float e o Float Alternativo para a Data Programada.
Pendência: 21921
Telas: Consulta / Relatório / Folha de Pagamento de Benefícios
Descrição: Inclusão da informação de "Opção de Tributação" no relatório de Prévia de pagamento da folha de benefício
Pendência: 18949
Telas: Cálculos da Folha / Prévia / Normal
Descrição: Implementação das chamadas às rotinas necessárias ao cálculo do IRRF pela tabela regressiva
Pendência: 18949
Telas: Cálculos da Folha / Abatimento de Reservas para Benefícios Pagos
Descrição: Implementação das chamadas às rotinas de atualização do Prazo de Acumulação, necessárias ao cálculo do IRRF pela tabela regressiva
Pendência: 22999
Tela: Cálculos da Folha / Prévia / Normal
Descrição: Permitir através de uma nova parametrização que rubricas individuais parceladas sejam lançadas em todos os meses de processamento com o mês de referência informado no cadastro.
Para controlar esta forma de processamento diferenciada criou-se um novo parâmetro, que pode ser visto na tela Sistema / Configurações / Parâmetros de Sistema, pasta Processo Prévia / Geral:
Nome do parâmetro: "Sempre atribuir o mês referência informado no cadastro da Rubrica Individual, no processamento da Prévia."
Ao colocar no mouse sobre o campo aparece a seguinte mensagem: "Esta opção é válida apenas para Rubrica Individuais parceladas."
Funcionamento:
a) caso não esteja marcado este parâmetro a Prévia vai colocar o mês cobrança como mês referência em todos os meses que a rubrica individual for processada. Este é o funcionamento padrão até hoje.
b) caso esteja marcado este parâmetro a Prévia vai colocar utilizar o mês referência informado no Cadastro da Rubrica Individual em todos os meses que a rubrica individual for processada.
Pendência: 23133
Tela: Cadastros / Entidades Externas / Importação de Arquivo
Descrição: Verificar se a rubrica normal, para o lançamento do registro importado, está definida. Caso se identifique algum erro no cadastro do layout ou no arquivo exibir mensagem de alerta da importação.
Pendência: 23276
Tela: Cálculos da Folha / Prévia / Normal
      Cadastros / Rubrica Individual
Descrição: Criação de novo parâmetro no cadastro de rubrica individual usado na Prévia Normal para considerar valores retroativos a partir da data inicio da PA.
Pendência: 23304
Tela: Cálculos da Folha / Prévia / Normal
Descrição: Identificar os responsáveis na bfciariotitplan, apenas pelos benefícios que estiverem sendo processados nesta Prévia, para evitar processamento de descontos em duplicidade. Exemplo: Mãe é responsável pelo recebimento do Pecúlio dos filhos num determinado mês. Mas não é responsável pelo recebimento do benefício de Pensão dos filhos, ou seja o filhos são responsáveis por este receber seus valores.
Pendência: 23342
Tela: Cálculos da Folha / Prévia / Folha Extra
Descrição: Passar o campo IDSITPLANOPREV para a regra de plano contabil, executada na Folha Extra.
Pendência: 23343
Tela: Cálculos da Folha / Prévia / Normal
Descrição: Tratar duplicidade de lotes para grupo familiar agrupando por responsavel.
Pendência: 23371
Tela: Cálculos da Folha / Prévia / Folha Extra
Descrição: No processamento da Folha Extra não deixar inserir registro na PREVIA com IDPLANOCONTABIL = 0. Caso a regra retorne valor inválido ou menor ou igual a zero, retornar mensagem e não permitir continuar.
Pendência: 23372
Tela: Cálculos da Folha / Efetivação
Descrição: Na efetivação da folha, verificar se o IDPLANOCONTABIL igual a zero, abortar o processo, e relatar no LOG.
Pendência: 23387
Tela: Cálculos da Folha / Prévia / Folha Extra
      Sistema / Utilitários / Busca Adiantamentos Efetuados
      Cálculos da Folha / Prévia / Normal
      Cadastros / Rubrica Individual
Descrição: Permitir que na Folha Extra se indique um plano contábil diferenciado para cada rubrica. 
Na busca de adiantamento realizados em Folha Extra este plano contábil será gravado na Rubrica Individual. A Prévia Normal processa a rubrica individual utilizando o plano contábil indicado se existir. Senão atribui como padrão o plano contábil do beneficiário. 
Alteração para corrigir atribuição do sequence correto na gravação da rubrica individual.
Tirar a ordenação por matrícula na busca das pessoas que tem adiantamento.
No Cadastro de Rubrica Individual, exibir o plano contábil da rubrica individual no grid de Outras Rubricas. 
Pendência: 23496
Tela: Sistema / Utilitários / Busca Adiantamentos Efetuados
Descrição: Correção para efetuar a busca para um grupo com mais de 1000 pessoas. Existia uma restrição devido a cláusula IN do Oracle, que foi resolvida.
Pendência: 23622
Tela: Consultas / Relátorios / Demonstrativos / Demonstrativo de pagamento 2ª via
Descrição: Ajuste na consulta das informações para considerar casos que o número do banco ou o número da agência mudam, ou são excluídos da base de dados. Esta pendência foi realizada na CMFOLHAOBJMT.bpl, que é usada pela Folha.
Pendência: 23625
Tela: Cálculos da Folha / Prévia / Normal
Descrição: Ajuste no lançamento do plano origem das rubricas de IR.
Pendência: 23367
Tela: Cálculos da Folha / Preparo
Descrição: Tratar devoluções de abono no encerramento de pensionistas, quando ocorrer em mês posterior ao mês de pagamento do abono anual.
Pendência: 19003
Tela: Cadastros / Manual do Histórico de Benefícios
Descrição: Colocar o nome do usuário de inclusão do registro no grid do Histórico de Benefícios.
Pendência: 21559
Tela: Cadastros / Manual do Histórico de Benefícios
      Sistema / Utilitários / Busca Adiantamentos Efetuados
      Cadastros / Manual de Lançamentos para a Folha de Benefícios
      Cadastros / Rubricas Individuais
      Cálculos da Folha / Efetivação de Versão de Pagamento
      Cálculos da Folha / Fechamento de Convênios
Descrição: Gravar o campo sequencial interno na inclusão de registros do Histórico de Benefícios, Rubrica Individual e Lançamentos na Tmpdesc.
Pendência: 22067
Tela: Cadastros / Manual do Histórico de Benefícios
Descrição: Exibir o Flgmanual no grid do Histórico de Benefícios.
Pendência: 22325
Tela: Cadastros / Manual do Histórico de Benefícios
Descrição: Exibir o flgtiporegistro no grid do Histórico de Benefícios e permitir a alteração desta informação caso o registro não esteja processado.
Pendência: 14674
Tela: Cadastros / Manual do Histórico de Benefícios
Descrição: Adaptar a tela para multifundação.
Pendência: 23726
Tela: Cálculos da Folha / Prévia / Normal
Descrição: Ajustar o processamento da Prévia para gerar um lançamento para cada benefício mesmo que estes estejam parametrizados na mesma rubrica, ou seja não faz a consolidação destes valores para a rubrica, no mesmo mês pagamento, mês referência plano previdenciário e motivo.
Pendência: 23754
Tela: Cálculos da Folha / Preparo
Descrição: Ajustar a gravação do numrecebimento na Tmpdesc usando o mesmo valor do histórico de contribuição de devoluções de contribuição sobre antecipação de abono realizada no ano.
Pendência: 23851
Tela: Cálculos da Folha / Preparo
Descrição: Gravar o mês de abono no registro do salário virtual, quando da execução de um preparo de Abono Anual. Esta funcionalidade só é pertinente para os beneficiários de benefício temporário e que estão parametrizados para se gerar salário virtual mensalmente.  
Pendência: 23461
Tela: Cálculos da Folha / Prévia / Pagamento Pendente
Descrição: Permitir indicar um novo recebedor para o pagamento liberado.
Pendência: 23885
Tela: Cálculos da Folha / Prévia / Pagamento Pendente
Descrição: Atualizar o campo favorecido do documento na tabela Prévia, para evitar erro na efetivação na geração de documentos a pagar por causa de conta de baixa não identificada.
================================================================================
CM$VER      3.05.12e    13/12/2006
--------------------------------------------------------------------------------
Pendência: 23971
Tela: Cálculos da Folha / Prévia / Normal
Descrição: Ajustar busca de rubrica individual para processamento na Prévia de abono anual.
================================================================================
CM$VER      3.05.12d    12/12/2006
--------------------------------------------------------------------------------
Pendência: 23873
Telas: Cadastro | Entidades Externas | Importação de Arquivo
Descrição: Ajuste na verificação de lotes já existentes para importação.
================================================================================
CM$VER      3.05.12c    07/12/2006
--------------------------------------------------------------------------------
Versão recompilada
================================================================================
CM$VER      3.05.12b    25/10/2006
--------------------------------------------------------------------------------
Pendência: 22675
Telas: Cálculos da Folha / Efetivação de Pagamento
       Cálculos da Folha / Gera Simulação de Arquivo Bancário da Prévia
       Cálculos da Folha / Gera Arquivo de Remessa Bancária
Descrição: Filtrar em documentos (tabela DOCPESSOA) apenas aquele parametrizado como oficial (Por exemplo: CPF), que é usado quando o documento oficial não está registrado na tabela da Pessoa Física.
Pendência: 23361
Telas: Diversas
Descrição: Retirar cláusula RULE de consultas executadas pela Folha.
Pendência: 23561
Telas: Cálculos da Folha / Efetivação de Pagamento
       Cálculos da Folha / Gera Simulação de Arquivo Bancário da Prévia
       Cálculos da Folha / Gera Arquivo de Remessa Bancária
Descrição: Correção para não gerar 2 linhas no arquivo bancário, quando o pagamento é realizado para mais de um plano previdenciário no mesmo contracheque.
Pendência: 23569
Tela: Cálculos da Folha / Efetivação de Pagamento
Descrição: Corrige estouro de memória da BDE, quando a efetivação processa mais de 700 mil rubricas da Prévia.
Pendência: 23595
Tela: Cadastros / Entidades Externas / Gera Saída Cadastral
Descrição: Tratar espaços em branco do DDD para não extrapolar o tamanho do campo DDD / Telefone no arquivo (12 posições).
Pendência: 23611
Telas: Cálculos da Folha / Efetivação de Pagamento
Descrição: Correção para voltar a efetuar a crítica de ausência de Prévia processada contra o histórico de benefícios preparados no lote.
================================================================================
CM$VER      3.05.12a    10/10/2006
--------------------------------------------------------------------------------
Pendência: 22907 (reabertura)
Tela: Cálculos da Folha / Preparo
Descrição: No encerramento de benefício temporário (por exemplo: auxílio doença), quando se tem o pagamento do abono anual proporcional parametrizado, o preparo busca todas as contribuições processadas ao longo do ano sobre o abono anual. Para estes casos, foi realizado um acerto para se gravar corretamente na tabela Tmpdesc os campos FLGATRASODEVOL e FLGDESCONTO.
================================================================================
CM$VER      3.05.12     18/09/2006
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.12.
Pendência: 18767
Tela: Sistema / Parametros de Configuração
Descrição: Criação de parâmetros para tratar rubricas de adiantamento sem IR para
           lançamento automático na rubica individual.
Pendência: 21136
Tela: Cálculos da Folha / Fechamento de Convênios
Descrição: Corrige o erro no fechamento de convênio referente a folha de abono.
Pendência: 20516
Tela: Cálculos da Folha / Estorno
Descrição: Criada a opção de retorno a previa ou ao preparo no estorno de reprocessamento.
Pendência: 21612
Tela: Cálculos da Folha / Abatimento de Reservas para Benefícios Pagos
Descrição: Nova tela para abatimento de reservas de acordo com benefícios pagos (processo que, anteriormente, ficava na efetivação da Folha);
Pendência: 20963
Tela: Cálculos da Folha / Prévia
Descrição: Correção no desfazer a previa, que antes era feito apenas pelo mês de referencia e agora também pelo lote;
Pendência: 23244
Tela: Cálculos da Folha / Prévia
Descrição: Não processar rubrica individual se valor do provento de benefício estiver igual a zero e
           se estiver parametrizado para não processar valor zerado de benefício na Folha;
Pendência: 19933
Tela: Cadastro / Alterador do Portador Forma de Pagamento
Descrição: Permite alterar o portador forma de benefícios encerrados;
Pendência: 20442
Tela: Movimentação de Reserva na Efetivação
Descrição: Premite que reservas individuais possam ter valores negativos;
Pendência: 21384
Tela: Cálculos da Folha / Folha Extra
Descrição: Correção da alíquota de IRRF em caso de resgate;
Pendência: 22311
Tela: Cálculos da Folha / Prévia
Descrição: Implementar a geração de IR por plano, para casos de resgate de reserva.
Consideração de base específica para resgate de reserva, que no caso de plano BD é pela tabela progressiva e no CD é 15% se não optante ou tabela regressiva se optante. 
Pendência: 22312
Tela: Cálculos da Folha / Prévia
Descrição: Criar novos parâmetros de rubricas para utilização na Prévia da Folha de Benefícios, para optantes pela tabela regressiva de IR, quais sejam:
IR - Abono Anual - Regressiva
IR - Benefício - Regressiva
Ver estes parâmetros na tela Sistema / Configurações / Parâmetros de Sistema, pasta Processo Prévia / Imposto de Renda.
Pendência: 22542
Tela: Cálculos da Folha / Prévia
Descrição: Pendência resolvida com a resolução da pendência 22311. Caso: a matricula 0286002 refere-se ao resgate simultaneo no Plano REPLAN e no Plano REB 1998, a previa deve calcular o IRRF de forma separada, visto que a tributacao do primeiro é usando a tabela progressiva e a do segundo 15% sobre o Bruto.
Pendência: 22939
Tela: Cálculos da Folha / Prepara
Descrição: Tratar preparo de 2 planos de benefício (um ativo e outro cancelado). 
Parametrização: na tela Sistema / Configuração / Parâmetros do Sistema: item Processo Preparo / Benefícios: marcar opção "Prepara Benefícios de Plano Desativado". 
Pendência: 22940
Tela: Cálculos da Folha / Previa
Descrição: Tratar na Prévia Normal o IR para processamento de benefícios em mais de um plano previdenciário.
Pendência: 22941
Tela: Cálculos da Folha / Prévia
Descrição: Efetuar o rateio de rubricas por plano previdenciário. Nesta funcionalidade se lança uma rubrica para cada plano contábil que esteja sendo processado nos pagamentos de benefício.
Passos para parametrização:
1) na tela Sistema / Configuração / Parâmetros do Sistema: item Processo Prévia / Prévia; campo Rateio de Rubricas por Plano, marcar a opção "Fazer Rateio por Plano".
2) na tela Cadastros / Conjunto de Rubrica / Associação de Rubricas:
2.1) Selecionar o grupo "RUBRICAS QUE SOFREM RATEIO POR PLANO". Este conjunto é criado automaticamente pela Folha e é de uso interno. Todos os conjuntos de uso interno terão valor negativo no campo IDCONJUNTORUBRICA da tabela CONJUNTORUBRICA.
2.2) Associar as rubricas que devem sofrer rateio por plano. Esta associação fica registrada na tabela CONJUNTORUBXRUB, com IDCONJUNTORUBRICA = -1.
Ao executar a Previa, caso a pessoa tenha pagamentos de benefício e desconto de contribuição em mais de um plano, todas as rubricas associadas neste conjunto, terão tantos lançamentos na Prévia quantos planos contábeis existirem, com os valores calculados segundo a proporção por regra de três simples, sobre o valor líquido apurado por plano, considerando benefícios, contribuições e suas respectivas devolução.
Este rateio ocorrerá de forma independente, para base normal e para base de abono.
Pendência: 23109
Tela: Cálculos da Folha / Prévia
Descrição: Retirar parâmetro para forçar o uso da tabela progressiva no caso de resgate de reserva de plano CD, tendo em vista que pela legislação atual não é mais permitido.
================================================================================
CM$VER      3.05.11f    12/09/2006
--------------------------------------------------------------------------------
Pendência: 22907
Tela: Cálculos da Folha / Preparo
Descrição: Para o mesmo tipo e valor de contribuição gravar com o mesmo motivo, no campo Idmotivo do Histórico de Contribuição preparado (tabela Hstcontribprev) e nos registros enviados para a Prévia da Folha (tabela Tmpdesc).
Isto não ocorria no processamento das devoluções de contribuição referentes a abono pagos ao longo do ano, e acarretava problema no Recebimento de Contribuição do Admprev.
================================================================================
CM$VER      3.05.11e    05/09/2006
--------------------------------------------------------------------------------
Pendência: 23099 (reabertura)
Tela: Relatórios / Operacionais / Relatório de Folha de Pagamento
Descrição: Fazer o mesmo tratamento para Folha de Pagamento Pendente.
================================================================================
CM$VER      3.05.11d    29/08/2006
--------------------------------------------------------------------------------
Pendência: 23189
Tela: Prévia / Pagamento Pendente
Descrição: Na Prévia de pagamento pendente, tratar atividade projeto padrão, quando a mesma não estiver parametrizada. Tratar campo idbeneficio que é usado na efetivação para obter placontac e placontad.
================================================================================
CM$VER      3.05.11c    26/08/2006
--------------------------------------------------------------------------------
Pendência: 23099
Tela: Relatórios / Operacionais / Relatório de Folha de Pagamento
Descrição: No caso de Folha Extra o cabeçalho com informações do recebedor não aparece no relatório, pela emissão da Prévia ou de versão de Efetivada.
================================================================================
CM$VER      3.05.11b    22/08/2006
--------------------------------------------------------------------------------
Pendência: 23114
Tela: Cadastros / Entidades Externas / Layout de desconto entrada
Descrição: Na operação de inserir novo layout, ao confirmar os botões não eram atualizados corretamente, permitindo ao usuário pressionar o botão Confirmar novamente. Nesta situação aparecia uma mensagem de erro de "qry: dataset not in edit".
================================================================================
CM$VER      3.05.11a    17/08/2006
--------------------------------------------------------------------------------
Pendência: 22734
Tela: Relatório Relatório de Entrada e Saída da Folha
Descrição: Alteração na forma de busca para permitir seleção por contracheque ou por benefício;
================================================================================
CM$VER      3.05.11     15/08/2006
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.11.
================================================================================
CM$VER      3.05.10     15/08/2006
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.10.
Pendência: 20651
Tela: Cadastros / Ação Judicial / Compensação de IR
Descrição: Alteração na tela de compensação de IR, de forma que a data final não seja obrigatória no cadastramento, visto que enquanto tiver saldo deverá haver compensação.
Pendência: 20652
Tela: Cadastros / Ação Judicial / Compensação de IR e Cálculos da Folha / Efetivação
Descrição: Implementa a atualização mensal dos valores de Compensação de IR, por um indice de correção percentual. 
O índice de atualização é cadastrado na tela de Cadastro de Compensação de IR.
Observações do cálculo:
a) o valor da correção é registrado no histórico de movimentação de compensação com a descrição "Atualização por Índice". 
b) este valor é lançado negativo para diferenciar dos lançamentos de "Compensação Mensal" que são referentes às compensações de IR na Folha. 
c) as compensações são abatidas do "Total já Compensado" (já era realizado assim, apenas para registro neste contexto). 
d) as correções são acrescidas ao "Total a Compensar". 
e) se a correção num determinado mês for negativa não será considerada. 
f) o tratamento de correção é realizado apenas para as pessoas que estão na Folha. Ou seja, caso a pessoa não esteja na Folha do mês o valor de compensação não é atualizado.
================================================================================
CM$VER      3.05.09e    11/08/2006
--------------------------------------------------------------------------------
Pendência: 23050
Tela: Cálculos da Folha / Prévia Normal
Descrição: Implementar rotina para que as regras de rubrica individual sejam processadas em casos de antecipação de abono de INSS, quando a base de cálculo é isenta da IR.
================================================================================
CM$VER      3.05.09d    08/08/2006
--------------------------------------------------------------------------------
Pendência: 21534
Tela: Cálculos da Folha / Prévia Normal
Descrição: Criar novo campo para guardar valores de abono de benefício de anos anteriores para as fontes pagadoras Fundação e INSS, que são passados para as querys de regra como o campo VLRSUPLABNATR e VLRINSSABNATR.
================================================================================
CM$VER      3.05.09c    28/07/2006
--------------------------------------------------------------------------------
Pendência: 22839
Tela: Cálculos da Folha / Efetivação de Pagamento
Descrição: Acerto no tratamento das rubricas que ficaram em excesso de débito, para gravar na TMPDESC o campo valor recebido como ZERO. 
================================================================================
CM$VER      3.05.09b    02/06/2006
--------------------------------------------------------------------------------
Pendência: 19339
Tela: Cálculos da Folha / Prévia Normal
Descrição: Implementação para tratar a seguinte situação: 
 . numa versão de Prévia existe mais de uma base de cálculo para IR, 
   como de benefício normal e INSS ou benefício normal e abono anual. 
 . existe uma rubrica de desconto para a natureza 0561 com prioridade de desconto baixa. 
   Por exemplo: desconto de valores adiantados, com prioridade menor que desconto de 
   devolução de benefício e desconto de contribuição.
 . o valor desta rubrica é maior que o total de proventos de IR da respectiva base de cálculo.
   Mas este valor consegue ser descontado parcial ou integralmente, devido ao valor da outra 
   base de cálculo.
 . nesta situação o valor do IR sobre a suplementação de benefício normal 0561 deve igual 
   a zero, pois a base de cálculo fica negativa.
Pendência: 22070
Tela: Cálculos da Folha / Prévia Normal
Descrição: Acerto para exibir o tempo total de processamento da Prévia, visto que a mensagem aparecia como tempo parcial.
Pendência: 22353
Tela: Cálculos da Folha / Prévia Normal
Descrição: Tratar no adiantamento de abono anual, o envio das contribuições para a Tmpdesc na correta rubrica de adiantamento (cobrança ou devolução) se parametrizada. 
Pendência: 22451
Tela: Cálculos da Folha / Prévia Normal
Descrição: Inclusão de uma mensagem de alerta na Prévia Normal quando o recebedor tiver alguma rubrica em resíduo total ou parcial.
================================================================================
CM$VER      3.05.09a    12/05/2006
--------------------------------------------------------------------------------
Pendência: 21841
Tela: Cálculos da Folha / Prévia / Pagamento Pendente
Descrição: Não gravou o idfavorecido da versão original, causando diferença no fechamento do convênio.
Pendência: 21978
Tela: Cadastros / Cadastro de Rubricas
Descrição: Acerto para possibilitar limpar o campo de Grupo de Rubrica.
Pendência: 22313
Tela: Cálculos da Folha / Prévia Normal
Descrição: Calcular o IR para optantes da tabela regressiva com a alíquota de 35%, no caso dos benefícios continuados (natureza de rendimento 0561).
================================================================================
CM$VER      3.05.09     05/05/2006
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.09.
Pendência: 21005
Tela: Cálculos da Folha / Gera Arquivo de Remessa Bancária da Prévia
Descrição: A geração de arquivo bancário pela Prévia deve utilizar a parametrização de agrupar arquivo para portadores TED / DOC.
================================================================================
CM$VER      3.05.08e    05/05/2006
--------------------------------------------------------------------------------
Pendência: 14461 (reabertura)
Tela: Cálculos da Folha / Preparo
Descrição: Colocar os registros de INSS referência no lote com o lote do preparo.
Pendência: 18472
Tela: Cálculos da Folha / Fechamento de Convênios
Descrição: Gerar documento financeiro por favorecido, mesmo que de convênios independentes.
Tratamento de compensação de valores a receber num único documento, quando o layout é de rubrica livre.
Geração de múltiplas contas de baixa.
Pendência: 22073
Tela: Cálculos da Folha / Fechamento de Convênios
Descrição: Tratamento da parametrização contábil de rubricas quando existe conta contábil diferente. 
Pendência: 22190
Tela: Consulta/Relatórios/Folha de Beneficios/Operacionais/Crédito de Beneficiários por banco
Descrição: Não incluir pagamentos em portador individual, mesmo que exista conta corrente da pessoa.
================================================================================
CM$VER      3.05.08d    20/04/2006
--------------------------------------------------------------------------------
Pendência: 22121
Tela: Cálculos da Folha / Preparo
Descrição: No sql de entrada da regra de reajuste do INSS o campo DATAINICIOINSSANT está sendo passado como '', fazendo com que a regra não identifique este campo na execução.
================================================================================
CM$VER      3.05.08c    11/04/2006
--------------------------------------------------------------------------------
Pendência: 22062
Tela: Prévia Normal
Descrição: Enviar para desconto (TMPDESC) apenas as contribuições com origem Folha de Benefícios (FolhaOrigem = 'B')  
================================================================================
CM$VER      3.05.08b    07/04/2006
--------------------------------------------------------------------------------
Pendência: 20369
Tela: Contracheque
Descrição: Acerto para não gerar mais contracheque de aposentados/pensionistas sem CEP cadastrado.
Pendência: 21826
Tela: Informações para Benefícios em Manutenção
Descrição: Controle de acesso do grid.
Pendência: 21990
Tela: Contracheque
Descrição: Gravar no arquivo o número do processo do benefício do inss.
================================================================================
CM$VER      3.05.08a    15/03/2006
--------------------------------------------------------------------------------
Pendência: 21776
Tela: Cálculos da Folha / Gera Arquivo de Remessa Bancária
Descrição: Ajuste na geração dos arquivos de layouts DOC/TED, para obter o float alternativo de TED e passar para a rotina de geração de arquivos bancários do padrão.
================================================================================
CM$VER      3.05.08     14/03/2006
--------------------------------------------------------------------------------
Pendência: 14461
Tela: Cálculos da Folha / Preparo
Descrição: Tratar preparo de benefícios retidos na folha de abono, considerando novo parâmetro com as seguintes opções: "Não Preparar", "Preparar Benefícios exceto Recadastramento" ou "Preparar Todos os Benefícios" (vide tela de Parâmetros da Folha, pasta Preparo).
Pendência: 16608
Tela: Cálculos da Folha / Prévia Normal
Descrição: Tratar novas rubricas de benefício para:
- atraso de antecipacao de abono,
- devolucao de antecipacao de abono,
- atraso de abono anual,
- devolução de ação judicial,
- atraso de abono ação judicial,
- devolução de abono ação judicial,
- revisão normal,
- revisão em atraso,
- devolução de revisão,
- revisão normal ação judicial,
- revisão em atraso ação judicial,
- devolução de revisão ação judicial
Para as situações referentes a revisão verifica-se a existência de registro na movimentação de benefício.
Usar o novo campo FLGTIPOREGISTRO da tabela de Históricos de Benefícios para identificar as situações de benefício normal, abono, antecipação e revisão.
Pendência: 16732
Tela: Cálculos da Folha / Preparo
Descrição: Considerar o novo campo NUMDIASBENEFANT da BENEFPLANPREV, na determinação da continuidade de benefícios. Refere-se a pendência 20930 com ajuste quando valor inválido.
Pendência: 17200
Tela: Cálculos da Folha / Preparo e Desfazer Preparo
Descrição: Implementar controle de limites de valor de benefício quando dos recálculos efetuados no Preparo. Caso os limites de valor ou percentual sejam ultrapassados o benefício é retido para verificação do usuário. Tratar no desfazer as retenções por motivo de ultrapassar limites de benefício.
Pendência: 17443
Tela: Cálculos da Folha / Prévia Normal
Descrição: Utilizar na prévia apenas as estruturas de cálculo ativas.
Pendência: 17977
Tela: Cálculos da Folha / Preparo
Descrição: Gravar o campo TIPOREGISTRO na tabela HSTBENEFBFCIARIO, quando do preparo de benefício normal, abono e antecipação de abono. Este campo será usada na identificação das rubricas na Prévia.
Pendência: 19471
Tela: Cálculos da Folha / Preparo
Descrição: Ajuste na contagem de benefícios preparados. Separar a contagem dos benefícios retidos e os não preparados por erro ou valor igual a zero.
Pendência: 19506
Tela: Cálculos da Folha / Preparo
Descrição: Tratar preparo de benefícios retidos na folha normal, considerando novo parâmetro com as seguintes opções: "Não Preparar", "Preparar Benefícios exceto Temporários" ou "Preparar Todos os Benefícios" (vide tela de Parâmetros da Folha, pasta Preparo).
Pendência: 19551
Tela: Diversas (Preparo, Prévia Normal, Efetivação, Desfazer Preparo e Estorno)
Descrição: Permitir a individualização do pagamento de INSS a nível do benefício concedido (flgpagainss na benefbfciario).
Registrar esta informação no histórico de beneficios (hstbenefbfciario).
Esta nova funcionalidade se aplica quando o benefício de INSS é pago pela Fundação e se deseja tratar este pagamento individualmente (a nível de beneficiário).
Os beneficiários entram e saem do convênio do INSS através das operações de Retenção e Liberação de benefícios no Admprev.
Quando está fora do convênio do INSS, no registro do benefício (na tabela Benefbfciario) a situação fica "retido" e o campo flgpagainss é colocado igual a 0.
Pendência: 19570
Tela: Cálculos da Folha / Prévia
Descrição: Efetuar o pagamento de vários planos num único lote de Prévia, processando registros da Tmpdesc de todos estes planos.
Pendência: 19772
Tela: Cálculos da Folha / Preparo
Descrição: Criar histórico para o percentual de grupo familiar (campo PERCENTUAL na Hstbenefbfciario), mantendo esse histórico para possíveis revisões. Quando do encerramento de um pensionista faz o recalculo do percentual da cota, gravando na Bfciariotitplan, caso o parâmetro do Admprev de recálculo automático do grupo familiar esteja marcado.
Pendência: 20454
Tela: Cálculos da Folha / Prévia Normal
Descrição: Otimização da consulta e baixa dos registros da Tmpdesc.
Pendência: 20598
Tela: Cálculos da Folha / Preparo
Descrição: No encerramento de benefícios temporários, com pagamento de abono anual no ano, referente a outro encerramento, efetuar as devoluções das contribuições patronais cobradas, visto que estes valores não tem como ser calculados pelo Recebimento do Admprev.
Estes valores são os mesmos calculados sobre o abono anual no ano.
Ressalta-se que os benefícios e contribuições do participante sobre o abono anual já pago são lançados como devolução.
Pendência: 20913
Tela: Cálculos da Folha / Preparo
Descrição: No caso de Aux. Morte, que é incluído com data final, o sistema Folha encerra o benefício, automaticamente, quando a data é atingida porém esta gravando o motivo indevido, ou seja, "Completou a Maioridade", que não é o caso.
O preparo determinará esta situação pela forma de pagamento do benefício Determinado.
Se esta forma de pagamento não existir deve ser criada e se parametrizar os benefícios desejados este tipo Determinado, no cadastro do Plano/Benefícios. Isto atenderá as novas concessões.
Para os benefícios já concedidos deve-se atualizar o campo IDTPPAGTOBENEFIC (na tabela Benefbfciario) com o novo tipo de pagamento Determinado, para que o preparo possa determinar corretamente motivo do encerramento.
Pendência: 20952
Tela: Cálculos da Folha / Acerto parâmetros contábeis e financeiros
Descrição: Inibir botões Incluir e Excluir, pois não tem funcionalidade, visto que a tela é apenas para alteração de parâmetros.
Pendência: 21006
Tela: Cálculos da Folha / Preparo
Descrição: Para os benefícios retidos sem ser por recadastramento deve-se pagar o abono proporcional na Folha de Abono. Complementa a pendência 14461.
Pendência: 21076
Tela: Cálculos da Folha / Preparo
Descrição: Atualizar os dados do lote na tela, ao se digitar o número do lote desejado. Só atualizava se fosse selecionado na lista.
Pendência: 21082
Tela: Conjunto de Rubricas
Descrição: Criação da nova tela de Conjunto de Rubricas. Esta nova estrutura de Conjunto de Rubricas pode ser utilizada com a nova fórmula do Regra, SOMACONJUNTORUBRICA.
Pendência: 21346
Tela: Geração de Arquivo para Banco tipo Ordem de Pagamento / diversas telas
Descrição: Criar estrutura para gerar arquivo bancário de ordem de pagamento.
Detalhamento:
a) tela conta bancária -  criar tipo de conta OP, para a qual não é obrigatório informar a conta corrente.
b) tela banco portforma - tratar tipo de conta OP para atribuição de portador forma.
c) Prévia Normal - tratar tipo de conta OP para atribuição de portador forma.
d) Prévia Folha Extra - tratar tipo de conta OP para atribuição de portador forma.
e) Geração de Arquivo Bancário pela Prévia - tratar conta corrente em branco.
f) Efetivação - tratar conta corrente em branco.
g) no contracheque, mostar o BANCO-AGÊNCIA-CONTA CORRENTE, para os participantes que recebem por OP/Recibo, como exemplo:
BANCO: REAL
AGÊNCIA: 03522
CONTA CORRENTE: "em branco"
Pendência: 21552
Tela: Cálculos da Folha / Prévia Normal
Descrição: Otimizar a estrutura de lista de parametrizações contábeis e financeiras para tratar parâmetros individuais de benefício.
Pendência: 21606
Tela: Tela Principal
Descrição: Otimização da abertura do módulo, pela racionalização da abertura das consultas dinâmicas para relatórios que residem nos data modules.
Pendência: 21670
Tela: Cálculos da Folha / Prévia Normal
Descrição: Ajuste na exibição do nome do recebedor do pagamento nas mensagens de alerta e de verificação.
================================================================================
CM$VER      3.05.07e    14/03/2006
--------------------------------------------------------------------------------
Pendência: 21745
Tela: Cálculos da Folha / Prévia Normal
Descrição: Gravar a natureza de rendimento 5565, na rubrica de IR e na base de cálculo, para o pagamentos de pessoas que optaram pela tabela regressiva.
================================================================================
CM$VER      3.05.07d    24/02/2006
--------------------------------------------------------------------------------
Recompilação do módulo para utilizar a CMFolhaObjMT.bpl
================================================================================
CM$VER      3.05.07c    09/02/2006
--------------------------------------------------------------------------------
Pendência: 21511
Tela: Cálculos da Folha / Prévia Normal
Descrição: Alterar a composição do campo VLRSUPLMES e VLRSUPLABN no caso dos proventos de abono anual, passados para as regras de cálculo, para que considere apenas o valor do abono no ano corrente. Não considerar o valores de abono dos anos anteriores.
================================================================================
CM$VER      3.05.07b    07/02/2006
--------------------------------------------------------------------------------
Pendência: 20914 (reabertura)
Tela: Cálculos da Folha / Prévia
Descrição: Ajuste do log da Prévia para exibir mensagem com tempo total.
================================================================================
CM$VER      3.05.07a    06/02/2006
--------------------------------------------------------------------------------
Pendência: 20871
Tela: Preparo Abono Anual e Antecipação de Abono Anual
Descrição: No cálculo da contribuição de pensionista, tratar o mês referência do abono anual para obter os valores do benefício a ser passado para a regra.
================================================================================
CM$VER      3.05.07     23/01/2006
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.08.
================================================================================
CM$VER      3.05.06u    18/01/2006
--------------------------------------------------------------------------------
Pendência: 20038 (Reabertura)
Tela: Consultas / Relátorios / Demonstrativos / Demonstrativo de pagamento 2ª via
Descrição: Acerto para mostrar os valores de rubricas informativas.
Pendência: 20922
Tela: Cálculos da Folha / Preparo Abono Anual
Descrição: Busca das contribuições não gravou corretamento o flgdevolucao no histórico de contribuição.
================================================================================
CM$VER      3.05.06t    13/01/2006
--------------------------------------------------------------------------------
Pendência: 20914
Tela: Cálculos da Folha / Efetivação
Descrição: Solicitamos que sejam revistos os logs da folha, tanto de processamento do preparo quanto da efetivação, pois a cada dia que passa as informações estão sendo menores. O log da efetivação ele nunca é gravado até o final da efetivação, quando chega a um certo passo ele termina. O log do preparo geral neste mês não está aparecendo o tempo de processamento, a quantidade de contribuições processadas e os totais do tempo de processamento e das contribuições, conforme cópia em anexo.
================================================================================
CM$VER      3.05.06s    11/01/2006
--------------------------------------------------------------------------------
Pendência: 21238
Tela: Cadastros / Cadastro Lista de Recebedores
Descrição: Permitir a seleção de pessoas individualmente ou por arquivo, pelo CPF do recebedor.
================================================================================
CM$VER      3.05.06r    30/12/2005
--------------------------------------------------------------------------------
Pendência: 20889
Tela: Cálculos da Folha / Estorno
Descrição: Marcar apenas o histórico de rubricas salariais como estornada para o estorno de consignatários. 
================================================================================
CM$VER      3.05.06q    16/12/2005
--------------------------------------------------------------------------------
Pendência: 20952
Tela: Cálculos da Folha / Acerta parâmetro contábil e financeiro
Descrição: Inibir botões Incluir e Excluir, pois não tem funcionalidade, visto que a tela é apenas para alteração de parâmetros.
Pendência: 21039
Tela: Cálculos da Folha / Preparo
Descrição: Na rotina de reajuste de benefício, incluir no sql de entrada da regra de reajuste a data de nascimento do participante e o número total de beneficiários.
Pendência: 21046
Tela: Utilitários / Gera arquivo de consignatários
Descrição: Resolução da mensagem do ORACLE ORA-01002, que aparece ao final, mas o processo conclui com sucesso.
================================================================================
CM$VER      3.05.06p    15/12/2005
--------------------------------------------------------------------------------
Pendência: 21035
Tela: Cálculos da Folha / Prévia Normal
Descrição: Na Folha Normal de 12/2005, considerou indevidamente o IR sobre o Abono gerado no mesmo mês, para efeito da compensação de IR automática do IR do mês.
================================================================================
CM$VER      3.05.06o    09/12/2005
--------------------------------------------------------------------------------
Pendência: 21010
Tela: Cálculos da Folha / Prévia Normal
Descrição: Tratar as rubricas de abono (normal, atraso e devolução) adequadamente, nos meses do ano subsequentes a execução da Folha de Abono, quando no mesmo ano ocorreu antecipação de abono anual.
================================================================================
CM$VER      3.05.06n    09/12/2005
--------------------------------------------------------------------------------
Pendência: 20993
Tela: Busca Adiantamentos Efetuados
Descrição: Retiramos das queries o hint Rule.
================================================================================
CM$VER      3.05.06m    07/12/2005
--------------------------------------------------------------------------------
Pendência: 20955
Tela: Prévia
Descrição: Acerto para buscar registro de abono lançado no cadastro de rubricas individuais.
================================================================================
CM$VER      3.05.06l    06/12/2005
--------------------------------------------------------------------------------
Pendência: 20143 (Reabertura)
Tela: Prévia
Descrição: Utilizar o último dia do mês do pagamento para calcular o IR.
Pendência: 20744 (Reabertura)
Tela: Contracheque
Descrição: Acerto para não gerar mais contracheque de recebedor de pensão alimentícia sem CEP cadastrado.
Pendência: 20930
Tela: Preparo
Descrição: Acerto para passar no sql de entrada da regra que calcula o benefício a ser pago no abono, a data início do benefício anterior.
           Correção no campo ValorIntegral do sql de entrada da regra que calcula a contribuição, passando o valor integral.
================================================================================
CM$VER      3.05.06k    02/12/2005
--------------------------------------------------------------------------------
Pendência: 20744 (Reabertura)
Tela: Contracheque
Descrição: Acerto para gerar mais de uma folha de contracheque somente quando necessário.
================================================================================
CM$VER      3.05.06j    29/11/2005
--------------------------------------------------------------------------------
Pendência: 19791
Tela: Cáuculos da Folha \ Prévia \ Folha Extra
Descrição: Executar a regra para buscar o plano contábil.
Pendência: 20732
Tela: Sistemas \ Utilitários \ Busca Adiantamentos Efetuados
Descrição: Permitir o lançamento parcial do saldo a descontar da pessoa através de uma regra asociada.
Pendência: 20827
Tela: Todas que geram documentos
Descrição: Na geração das múltiplas contas de baixa (CCBAIXASXDOCUM) deve-se lançar a atividade/projeto (UNIDNEGOC) que foi utilizada para o lançamento do rateio do documento. Quando a atividade/projeto não é utilizada, lançar o parâmetro global e não -1.
Pendência: 20829
Tela: Prévia
Descrição: Não utilizar base de IRRF de uma folha que foi estornada.
================================================================================
CM$VER      3.05.06i    17/11/2005
--------------------------------------------------------------------------------
Pendência: 20038
Tela: Consultas / Relátorios / Demonstrativos / Demonstrativo de pagamento 2ª via
Descrição: Acerto para mostrar os valores de rubricas informativas.
Pendência: 20378
Tela: Consultas / Relátorios / Demonstrativos / Demonstrativo de pagamento 2ª via
Descrição: Mostrar as informações separando por página os pagamentos de mesma data.
Pendência: 20744
Tela: Contracheque
Descrição: Acerto para gerar mais de uma folha de contracheque somente quando necessário.
================================================================================
CM$VER      3.05.06h    04/11/2005
--------------------------------------------------------------------------------
Pendência: 20666
Tela: Cálculos da Folha / Prévia Normal
Descrição: Ajuste no lançamento das rubricas de devolução de adiantamento de abono de benefício.
================================================================================
CM$VER      3.05.06g    28/10/2005
--------------------------------------------------------------------------------
Pendência: 20505
Tela: Várias
Descrição: Otimização de telas colocando o idmodulo = 1.
Pendência: 20586
Tela: Várias
Descrição: Passar para as rotinas que buscam datas na diasuteis, os parâmetros da fundação. 
================================================================================
CM$VER      3.05.06f    27/10/2005
--------------------------------------------------------------------------------
Pendência: 20517
Tela: Cadastros \ Rubricas Individuais
Descrição: Ao marcar a rubrica como permanente, apagar a data final. Porém deve-se permitir o usuário escolher uma data.
Pendência: 20519
Tela: Cálculos da Folha \ Preparo / Cálculos da Folha \ Previa \ Normal
Descrição: Gravar na tabela temporária de descontos, o número do recebimento gravado no histórico de contribuições. 
================================================================================
CM$VER      3.05.06e    19/10/2005
--------------------------------------------------------------------------------
Pendência: 20473
Tela: Cálculos da Folha \ Gera Simulação de Arquivo Bancário da Prévia
Descrição: Melhoria na performance da tela, forçando o uso do índice apropriado.
Pendência: 20496
Tela: Contracheque
Descrição: Acerto no campo excesso de débito.
================================================================================
CM$VER      3.05.06d    11/10/2005
--------------------------------------------------------------------------------
Pendência: 14685
Tela: Cadastros / Estruturas de Cálculo
Descrição: Adaptar para multi-fundação
Pendência: 17197
Tela: Cadastros / Estruturas de Cálculo
Descrição: Permitir desativar uma estrutura de cálculo. Criar opção de desativação no cadastro.
Pendência: 19912
Tela: Cálculos da Folha / Prévia Normal e Cadastros / Estruturas de Cálculo
Descrição: Criar um parâmetro na estrutura de cálculo para indicar, que não se deve lançar rubrica com valor igual a zero. Utilizar esta novo parâmetro no processamento da Prévia Normal para gravar ou não rubricas com valor igual a zero.
Pendência: 20281
Tela: Cálculos da Folha / Prévia Normal
Descrição: Otimizar a consulta principal da Prévia normal para listas de recebedores pequenas (até 100 pessoas).
================================================================================
CM$VER      3.05.06c    23/09/2005
--------------------------------------------------------------------------------
Pendência: 19604
Tela: Consultas \ Relatórios \ Operacionais \ Folha de Pagamento de Benefícios
Descrição: Acerto na geração do relatório.
================================================================================
CM$VER      3.05.06b    13/09/2005
--------------------------------------------------------------------------------
Pendência: 20209
Tela: Cálculos da Folha \ Geração de Arquivo de Remessa da Prévia
Descrição: Ajustar a geração para colocar transação devido a gravação do nosso número pela CMIntBanco50, que gerava o erro ORA-01002.
================================================================================
CM$VER      3.05.06a    09/09/2005
--------------------------------------------------------------------------------
Pendência: 20117
Tela: Cálculos da Folha \ Prévia \ Normal
Descrição: As rubricas individuais de complemento de ação judicial do benefício devem ser contabilizadas com a mesma conta contábil parametrizada individualmente no benefício.
Pendência: 20136
Tela: Cálculos da Folha \ Prévia \ Normal
Descrição: Gravar a natureza de rendimento parametrizada no Cadastro da Rubrica, para as rubricas de desconto que não entram para o cálculo de IR. Hoje já está implementado que quando a rubrica de desconto entra como dedução de imposto de renda automaticamente é utilizada a natureza de rendimento do provento.
Pendência: 20143
Tela: Cálculos da Folha \ Prévia \ Normal
Descrição: Deve-se da deduzir da base do IRRF o desconto legal de idade, quando o participante completar 65 anos no mês do pagamento, mesmo que o dia de aniversário seja posterior a data de pagamento.
Pendência: 20145
Tela: Tela Principal
Descrição: Ao cancelar o login do usuário não executar busca de parâmetros globais.
Pendência: 20155
Tela: Cálculos da Folha \ Prévia \ Normal
Descrição: Para a execução das regras de rubricas individuais passar os campos DIBFUND e DIBINSS, que são respectivamente a DIB dos benefícios de suplementação e do INSS.
================================================================================
CM$VER      3.05.06     26/08/2005
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.07.
================================================================================
CM$VER      3.05.05l    26/08/2005
--------------------------------------------------------------------------------
Pendência: 18734
Tela: Cálculos da Folha \ Efetivação
Descrição: Assumir o valor do parâmetro do benefício normal para os casos de pagamento pendentes.
Pendência: 19484 (Reabertura)
Tela: Cálculos da Folha \ Estorno
Descrição: Alterar os registros da tmpdesc atualizando os registros colocando-os no ponto do preparo ao ínves de excluí-los.
Pendência: 20049
Tela: Cadastros \ Entidades Externas \ Importação de Arquivo / Cálculos da Folha \ Prévia \ Normal
Descrição: Permitir a importação de convênios avulsos de rubricas informativas e efetuar o processamento na Prévia Normal.
Pendência: 20061
Tela: Cálculos da Folha \ Prévia \ Normal / Pagamento Pendente
Descrição: Tratar campo referencia na Prévia para evitar o constraint de unicidade na efetivação da versão.
Pendência: 20064
Tela: Cálculos da Folha \ Prévia \ Normal
Descrição: Alteração no cálculo do imposto de renda para a modalidade BD (Benefício Definido).
================================================================================
CM$VER      3.05.05k    23/08/2005
--------------------------------------------------------------------------------
Pendência: 19606
Tela: Prévia / Normal
Descrição: Passar a buscar os registros do cadastro de rubricas individuiais tab=mbém para um lote de reprocessamento.
Pendência: 19724
Tela: Desfazer Preparo
Descrição: Atualizar o mês de reajuste no desfazer do preparo.
================================================================================
CM$VER      3.05.05j    19/08/2005
--------------------------------------------------------------------------------
Pendência: 19817
Tela: Arquivo de Demonstrativo de Pagamento
Descrição: Gravar no arquivo de demonstrativo de pagamento a parcela corrente e o total de parcelas vinculado a rubrica de empréstimo.
Pendência: 19828
Tela: Prévia Normal
Descrição: Utilizar na Prévia Normal o novo parâmetro para controlar a forma de gravação parcela de rubricas. Este parâmetro possui 2 opções: "Pelo Prazo Restante" e "Pela Parcela Corrente".
================================================================================
CM$VER      3.05.05i    12/08/2005
--------------------------------------------------------------------------------
Pendência: 19958
Tela: Busca Adiantamentos Efetuados
Descrição: Melhoria na perfomance da query.
================================================================================
CM$VER      3.05.05h    10/08/2005
--------------------------------------------------------------------------------
Pendência: 19756
Tela: Cálculos da Folha \ Prévia \ Pagamento Pendente
Descrição: Acerto na tela.
================================================================================
CM$VER      3.05.05g    22/07/2005
--------------------------------------------------------------------------------
Pendência: 19584
Tela: Cálculos da Folha \ Prévia
Descrição: Não executar regra de benefício mínimo para registros oriundo de uma concessão que foram incorporados a um lote de manutenção.
================================================================================
CM$VER      3.05.05f    20/07/2005
--------------------------------------------------------------------------------
Pendência: 19355 (Reabertura)
Tela: Contracheque
Descrição: Acerto na geração do contracheque.
================================================================================
CM$VER      3.05.05d    06/07/2005
--------------------------------------------------------------------------------
Pendência: 19600
Tela: Cálculos da Folha \ Prévia \ Normal
Descrição: Utilizar a alíquota de 35% para calcular IRRF para quem optou pela tabela regressiva e que a modalidade do plano seja CD (Contribuição Definida).
================================================================================
CM$VER      3.05.05c    29/06/2005
--------------------------------------------------------------------------------
Pendência: 19582
Tela: Cálculos da Folha \ Prévia \ Normal
Descrição: Gravar na prévia e histrubsal o codirrfdarf mesmo quando for rubrica do cadastro de rubricas individuias.
================================================================================
CM$VER      3.05.05b    27/06/2005
--------------------------------------------------------------------------------
Pendência: 19341
Tela: Cálculos da Folha \ Preparo
Descrição: Implementação no reajuste de inss para utilizar o campo DibBenefAnt e FlgPossuiAcompInss.
Pendência: 18700
Tela: Cálculos da Folha \ Fechamento de Convênio
Descrição: Permitir ao usuário escolher a data de lançamento.
================================================================================
CM$VER      3.05.05a    23/06/2005
--------------------------------------------------------------------------------
Pendência: 17816 (reabertura)
Tela: Contabilização de Abono
Descrição: O pagamento do abono de anos anteriores passa a ser contabilizado como pagamento de despesa de benefício.
No pagamento normal de benefício passa a ser contabilizado mensalmente a provisão para abono anual e a provisão da receita de contribuição sobre o abono anual. Esta contabilização é lançada em planilha separada na efetivação da versão. Nos estornos de pagamento que tratam contabilização, é realizado o estorno deste provisionamento.
Esta funcionalidade de provisão fica habilitada a partir da marcação do parâmetro devido em Sistema/Configuração/Parâmetros do Sistema, botão Processo Efetivação/Efetivação item "Contabiliza a provisão de abono...".
Ajuste adicional: Verificação na Prévia para não efetuar lançamentos de provisão de abono anual apenas para rubricas de benefício e contribuição.
================================================================================
CM$VER      3.05.05     21/06/2005
--------------------------------------------------------------------------------
Liberação da versão no Padrão 5.10.06
================================================================================
CM$VER      3.05.04o    21/06/2005
--------------------------------------------------------------------------------
Pendência: 19287
Tela: Cálculos da Folha \ Estorno
Descrição: Atualizar histórico de benefícios para registros de concessão quando for estorno para pagamento indevido.
================================================================================
CM$VER      3.05.04n    14/06/2005
--------------------------------------------------------------------------------
Pendência: 19474
Tela: Cálculos da Folha / Prévia Normal
Descrição: Fazer provisão para abono se a contribuição estiver parametrizada para ser descontada sobre abono anual.
================================================================================
CM$VER      3.05.04m    10/06/2005
--------------------------------------------------------------------------------
Pendência: 19355
Tela: Contracheque
Descrição: Acerto na geração do contracheque.
Pendência: 19445
Tela: Preparo
Descrição: Atulizar o campo do mês de reajuste do salário do auxílio doença.
================================================================================
CM$VER      3.05.04l    07/06/2005
--------------------------------------------------------------------------------
Pendência: 19230
Tela: Cálculos da Folha / Estorno
Descrição: Acerto para que no estorno individual seja emitida a mensagem de finalização do processo.
================================================================================
CM$VER      3.05.04k    03/06/2005
--------------------------------------------------------------------------------
Pendência: 19384
Tela: Cálculos da Folha / Preparo
Descrição: Gravar na Tmpdesc o campo FLGDESCONTO = 0 no caso das devoluções de contribuição.
Pendência: 19206
Tela: Cálculos da Folha / Prévia e Cálculos da Folha / Efetivação
Descrição: Contabilizar uma revisão de benefícios com a conta de devolução.
================================================================================
CM$VER      3.05.04j    02/06/2005
--------------------------------------------------------------------------------
Pendência: 19376
Tela: Cálculos da Folha / Estorno de pagamento
Descrição: Os estornos das folhas de beneficio estão sendo lançados em partida inversa, veja como exemplo a planilha 719 referente ao estorno de parte da folha de beneficio 05/10595 ( matricula 40486 ).
================================================================================
CM$VER      3.05.04i    24/05/2005
--------------------------------------------------------------------------------
Pendência: 19313
Tela: Preparo / Recálculo de benefício por reajuste de INSS
Descrição: No recálculo de benefício por reajuste de INSS para pensionistas, a data de referência para a regra de cálculo do valor total estava sendo passada com a data do evento do processo de benefício e deveria ser a o primeiro dia do mês do processamento.
Pendência: 19314
Tela: Estorno de Pagamento
Descrição: Ao fazer o estorno de pagamento indevido, apareceu a mensagem de "Estorno individual interrompido por erro", por causa da contabilização do estorno para provisionamento de abono.
================================================================================
CM$VER      3.05.04h    23/05/2005
--------------------------------------------------------------------------------
Pendência: 19250
Tela: Consultas / Demonstrativo de Pagamento
Descrição: Erro na referência da parcela do empréstimo quando da emissão do contracheque. No aquivo abaixo sugiro onde pode estar o erro.
Pendência: 19304
Tela: Preparo
Descrição: Buscar somente o plano previdenciário na regra de contribuição da pessoa processada.
================================================================================
CM$VER      3.05.04g    18/05/2005
--------------------------------------------------------------------------------
Pendência: 19229
Tela: Relatório Individual de Rubricas
Descrição: Filtrar na query o plano contábil.
================================================================================
CM$VER      3.05.04f    11/05/2005
--------------------------------------------------------------------------------
Pendência: 19219
Tela: Prévia Normal
Descrição: Os registros referentes a benefício de INSS de meses anteriores não estavam sendo passados para as regras de cálculo de Ação Judicial.
Pendência: 19222
Tela: Prévia Normal
Descrição: Caso o recebedor tenha apenas base para IR sobre o abono anual de INSS, a rotina de cálculo do IR apresentou o erro "invalid float point operation".
================================================================================
CM$VER      3.05.04e    10/05/2005
--------------------------------------------------------------------------------
Pendência: 19210
Tela: Prévia Normal
Descrição: Quando o beneficiário é IRRF TOTAL = NÃO, os acertos de suplementação de benefício estão sendo consideradas na base de IR sobre o INSS.
Pendência: 19211
Tela: Prévia Normal
Descrição: Quando o beneficiário é IRRF TOTAL = NÃO, as contribuições sobre a suplementação de benefício estão sendo consideradas na base de IR sobre o INSS.
Pendência: 19213
Tela: Preparo
Descrição: Na consulta para a regra de reajuste colocar o campo DATAINICIOFUND.
================================================================================
CM$VER      3.05.04d    06/05/2005
--------------------------------------------------------------------------------
Pendência: 17816 (reabertura)
Tela: Contabilização de Abono
Descrição original: O pagamento do abono de anos anteriores passa a ser contabilizado como pagamento de despesa de benefício. 
No pagamento normal de benefício passa a ser contabilizado mensalmente a provisão para abono anual e a provisão da receita de contribuição sobre o abono anual. Esta contabilização é lançada em planilha separada na efetivação da versão. Nos estornos de pagamento que tratam contabilização, é realizado o estorno deste provisionamento. 
Esta funcionalidade de provisão fica habilitada a partir da marcação do parâmetro devido em Sistema/Configuração/Parâmetros do Sistema, botão Processo Efetivação/Efetivação item "Contabiliza a provisão de abono...".
Ajuste adicional: Verificação na Prévia para não efetuar lançamentos de provisão de abono anual apenas para rubricas de benefício e contribuição.
================================================================================
CM$VER      3.05.04c    05/05/2005
--------------------------------------------------------------------------------
Pendência: 19136
Tela: Cálculos da Folha \ Folha Extra
Descrição: Ao inserir o crédito de um PA para um recebedor que também é participante da Fundação porém em outra patrocinadora, o sistema está inserindo como plano contábil  o plano da recebedora enquanto participante da outra patrocinadora ao invés de inserir o plano contábil do participante titular.
Pendência: 19168
Tela: Cálculos da Folha \ Efetivação
Descrição: Acerto na gravação da data de lançamento.
Pendência: 19188
Tela: Cálculos da Folha \ Preparo
Descrição: Quando tem reajuste do INSS, e o novo valor do benefício de suplementação for igual a zero, o sistema não está atualizando com este valor, mantendo o anterior.
Pendência: 19192
Tela: Previa
Descrição: Com relação aos resultados de valor, retornados pelas regras de irrf judicial, gerar na previa valor retornado ainda que seja menor que o limite minimo de irrf cadastrado nos parametros do sistema.
================================================================================
CM$VER      3.05.04b    25/04/2005
--------------------------------------------------------------------------------
Pendência: 19108 (Reabertura)
Tela: Estorno \ Pagamento Indevido
Descrição: Acerto da query no estorno.
================================================================================
CM$VER      3.05.04a    25/04/2005
--------------------------------------------------------------------------------
Pendência: 19108
Tela: Estorno \ Pagamento Indevido
Descrição: Acerto da query no estorno.
================================================================================
CM$VER      3.05.04     19/04/2005
--------------------------------------------------------------------------------
Pendência: 18462 (reabertura)
Tela: Cadastros / Entidades Externas / Importação de Arquivo
Descrição: Ajuste na consulta por inscrição.
Pendência: 18930
Tela: Cadastros / Rubricas Individuais
Descrição: Quando a rubrica for permanente permitir o preenchimento da data final, 
quando o parâmetro "efetua o processamento das rubricas 
individuais se data final está em mês posterior ao mês do pagamento" 
estiver marcado. Utiliza o mesmo parâmetro criado para a pendência 19023.
Pendência: 19020
Tela: Cálculos da Folha / Prévia / Normal
Descrição: Quando a pessoa tem IR sobre base total e o provento de suplementação não suporta o desconto de contribuição, deve-se utilizar a base de INSS. Ex.: matr.8222504 apresentou diferença de R$10,00 na base de IR, por causa deste fato.
Pendência: 19021
Tela: Cálculos da Folha / Preparo
Descrição: No encerramento de pensionistas buscou em duplicidade o valor de adiantamento de abono e não gravou o mês 13, assim como o motivo do abono. Ex.: Matr. 0207416.
Pendência: 19022
Tela: Cálculos da Folha / Preparo
Descrição: Quando o benefício do pensionista está retido o preparo não está calculando a contribuição.
Deve-se ajustar a consulta que busca o valor de benefício do grupo familiar, pois esta consulta é realizada por lote que não é gravado no caso de benefício retido. Ex.: matr. 0197110
Pendência: 19023
Tela: Cálculos da Folha / Prévia / Normal
Descrição: Criar parâmetro para controlar na Prévia o processamento da rubrica individual.
Caso este parâmetro esteja marcado deve-se processar apenas as rubricas individuais, de qualquer espécie, permanentes ou não, caso a data final seja de mês maior ou igual ao mês do pagamento do lote.
Desta forma, caso a rubrica individual tenha data final em mês anterior ao mês do lote, não será processada pela Prévia em nenhuma hipótese.
Pendência: 19035
Tela: Cadastros / Entidades Externas / Importação de Arquivo
Descrição: Para a crítica de falecimento utilizar a data morte da pessoa.
Pendência: 19036
Tela: Cálculos da Folha / Preparo e Cálculos da Folha / Prévia / Normal
Descrição: Ajuste no posicionamento do botão salvar resultado, nestas duas telas.
Pendência: 19072
Tela: Cálculos da Folha / Prévia / Normal
Descrição: Ajuste no lançamento da rubrica de alterador sobre benefício de acerto pós-morte para beneficiário, está usando a rubrica de alterador do benefício do beneficiário.
================================================================================
CM$VER      3.05.03n    06/04/2005
--------------------------------------------------------------------------------
Pendência: 18762
Tela: Cálculos da Folha \ Prévia \ Normal
Descrição: Alteração para que os associados que completarem 65 anos de idade em Dezembro, não sejam tributados também no 13º salário. 
Pendência: 18959
Tela: Cálculos da Folha \ Prévia \ Normal
Descrição: Gravar a natureza de rendimento das rubricas de dedução de dependente e de dedução por idade.
Pendência: 18963
Tela: Cálculos da Folha \ Efetivação de Versão de Pagamento
Descrição: Usar a data prevista de pagamento nos lançamentos dos documentos a pagar.
Pendência: 18964
Tela: Cálculos da Folha \ Prévia \ Normal
Descrição: Para os resgates de poupança tipo BD considerar a tabela progressiva para retenção do imposto de renda, visto que a MP232 foi revogada.
================================================================================
CM$VER      3.05.03m    01/04/2005
--------------------------------------------------------------------------------
Pendência: 18935
Tela: Cálculos da Folha \ Fechamento de Convênios
Descrição: Somente gerar documento se tiver valor maior que zero.
================================================================================
CM$VER      3.05.03l    28/03/2005
--------------------------------------------------------------------------------
Pendência: 18552
Tela: Cadastro \ Ação Judicial \ Ação Judicial de Imposto de Renda
Descrição: Separação do cadastro de depósito judicial e o cadastro de compensação de imposto de renda.
Pendência: 18838
Tela: Cálculos da Folha \ Preparo
Descrição: Trata dupla atividade de INSS, na rotina de reajuste de benefício, executada no Preparo.
Pendência: 18854
Tela: Cálculos da Folha \ Preparo
Descrição: O encerramento de pensionista não lançou o valor de abono a pagar. Deve-se também devolver o valor de adiantamento de abono realizado no ano.
Pendência: 18882
Tela: Cálculos da Folha \ Prévia \ Normal
Descrição: Tratamento dos casos em que o IDSEQINTERNOFB é igual a zero (além do já tratado nulo), de forma a colocar um sequencial > 0.
Pendência: 18906
Tela: Cadastros \ Rubricas Individuais
Descrição: Mostrar no lookupcombo também os beneficiários que não são os próprios recebedores.
Pendência: 18912
Tela: Cálculos da Folha \ Efetivação de Versão de Pagamento
Descrição: Ajuste na verificação de Prévia não processada, tratando casos de INSS em referência apenas.
================================================================================
CM$VER      3.05.03k    24/03/2005
--------------------------------------------------------------------------------
Pendência: 18898
Tela: Cálculos da Folha \ Efetivação
Descrição: Adaptar estorno para utilizar as rotinas em 3 camadas.
================================================================================
CM$VER      3.05.03j    21/03/2005
--------------------------------------------------------------------------------
Pendência: 18587
Tela: Cálculos da Folha \ Estorno
Descrição: Gravação da data de lançamento informado na tela.
================================================================================
CM$VER      3.05.03i    15/03/2005
--------------------------------------------------------------------------------
Pendência: 18840
Tela: Cadastros \ Entidades Externas \ Importação de Convêncios
Descrição: Ajuste nas críticas de benefícios e de rubricas.
================================================================================
CM$VER      3.05.03h    14/03/2005
--------------------------------------------------------------------------------
Pendência: 18825
Tela: Manual de Lançamentos para a Folha de Benefícios
Descrição: Possibilitar ao usuário escolher a rubrica logo após clicar no botão inserir.
Pendência: 18834
Tela: Cadastros \ Entidades Externas \ Exportação de Arquivos
Descrição: Trocar as versões do checklist ao trocar de mês ou de ano.
Pendência: 18835
Tela: Relatório Individual de Rubricas
Descrição: Alteração na busca do plano previdenciário.
Pendência: 18837
Tela: Cadastros \ Entidades Externas \ Importação de Arquivos
Descrição: Acerto no tratamento das situações dos benefícios.
================================================================================
CM$VER      3.05.03g    11/03/2005
--------------------------------------------------------------------------------
Pendência: 18758
Tela: Cadastros / Manual do Histórico de Benefícios
Descrição: Não permitir a inclusão de um registro sem a data prevista.
================================================================================
CM$VER      3.05.03f    10/03/2005
--------------------------------------------------------------------------------
Pendência: 18817
Tela: Prévia / Normal
Descrição: Bloqueio da Prévia e emissão de mensagem caso o histórico de benefício esteja pendente de concessão.
================================================================================
CM$VER      3.05.03e    07/03/2005
--------------------------------------------------------------------------------
Pendência: 18737
Tela: Utilitários / Contra-Cheque FUNCEF
Descrição: Mostrar o nome do benefício do beneficiário.
Pendência: 18738
Tela: Utilitários / Contra-Cheque FUNCEF
Descrição: Trazer contra-cheque de recebedor de pensão alimentícia mesmo se o beneficiário tiver migrado de plano previdenciário.
================================================================================
CM$VER      3.05.03d    04/03/2005
--------------------------------------------------------------------------------
Pendência: 18765
Tela: Relatório de Pagamento da Folha de Benefícios
Descrição: Correção do problema da largura da faixa exceder a largura da página.
Pendência: 18769
Tela: Prévia / Normal
Descrição: Correção para gerar rubrica de dedução por idade de IR, mesmo quando a pessoa estiver fazendo aniversário no mês do pagamento.
================================================================================
CM$VER      3.05.03c    02/03/2005
--------------------------------------------------------------------------------
Pendência: 18611 (Reabertura)
Tela: Estorno
Descrição: Acerto na utilização dos parâmetros do ramo tipo do cliente e o ramo tipo do fornecedor.
Pendência: 18754
Tela: Prévia \ Normal
Descrição: Criação de um parâmetro para não utilizar cálculo do IR pela tabela regressiva da IN SRF 497.
================================================================================
CM$VER      3.05.03b    21/02/2005
--------------------------------------------------------------------------------
Pendência: 18685
Tela: Prévia Normal
Descrição: Adequação do cálculo do IR para a alíquota de 15%, segundo a Lei 11.053 de 29.12.2004 e a IN SRF 497 de 24.01.2005.
================================================================================
CM$VER      3.05.03a    15/02/2005
--------------------------------------------------------------------------------
Pendência: 18655
Tela: Cálculos da Folha \ Cálculos da Folha \ Gera Simulação de Arquivo Bancário da Prévia
Descrição: Colocar o hint /*+rule*/ na subquery da query que busca as informações da prévia.
================================================================================
CM$VER      3.05.03     14/02/2005
--------------------------------------------------------------------------------
Pendência: 18535 
Tela: Cálculos da Folha \ Prévia \ Normal
Descrição: Buscar a rubrica de quitação antecipada..
Pendência: 18644 
Tela: Cálculos da Folha \ Prévia \ Normal
Descrição: No encerramento de beneficios, a rubrica lançada do abono está saindo como a rubrica de antecipacao do abono.
Pendência: 18503 (Reabertura)
Tela: Cadastros / Entidades Externas / Importação de Arquivo
Descrição: Na importação de convênios continuados, deve ser gravada a data final na rubrica individual, igual ao último dia do mês posterior a data início tantos meses quanto a quantidade de parcelas, que vem no arquivo. Quando o número de parcelas é igual a zero, indicando que é uma rubrica de processamento permanente, a data final deve ficar em branco. Isto tornou-se necessário, porque nos casos de excesso de débito, o número de ocorrências não é incrementado e o controle da interrupção da cobrança deve ser feito pela data final.
================================================================================
CM$VER      3.05.02a    04/02/2005
--------------------------------------------------------------------------------
Pendência: 18635
Tela: Prévia Normal
Descrição: A rubrica de contribuição de abono não foi passada no campo VLRCONTMES, quando da execução da regra de Pensão Alimentícia sobre o adiantamento de abono anual. Este ajuste tem relação com a pendência 18103 que tratou a mesma situação para os valores de benefício.
================================================================================
CM$VER      3.05.02     03/02/2005
--------------------------------------------------------------------------------
Pendência: 18503
Tela: Cadastros / Entidades Externas / Importação de Arquivo
Descrição: Na importação de convênios continuados, deve ser gravada a data final na rubrica individual, igual ao último dia do mês posterior a data início tantos meses quanto a quantidade de parcelas, que vem no arquivo. Quando o número de parcelas é igual a zero, indicando que é uma rubrica de processamento permanente, a data final deve ficar em branco. Isto tornou-se necessário, porque nos casos de excesso de débito, o número de ocorrências não é incrementado e o controle da interrupção da cobrança deve ser feito pela data final.
Pendência: 18580
Tela: Controle de Acesso
Descrição: Criar controle de acesso para os itens de menu que estão em Sistema/Utilitários:
"BUSCA ADIANTAMENTOS EFETUADOS"
"GERA ARQUIVO ENTIDADE"
Pendência: 18582
Tela: Fechamento de Convênio
Descrição: Na geração do rateio do documento, apresentou erro de constraint de centro de responsabilidade, visto que quando a fundação não utiliza centro de responsabilidade, estava tentando gravar um valor igual a zero.
Pendência: 18607
Tela: Efetivação de Pagamento
Descrição: Permitir que a data de contabilização da Folha seja informada separadamente da data de efetivação e das datas prevista e efetiva dos documentos financeiros.
Pendência: 18611
Tela: Estorno / Fechamento de Convênios
Descrição: Acerto na utilização dos parâmetros do ramo tipo do cliente e o ramo tipo do fornecedor.
================================================================================
CM$VER      3.05.01b    03/02/2005
--------------------------------------------------------------------------------
Pendência: 18627
Tela: Preparo
Descrição: Na consulta passada para regras de contribuição de pensionista passar o campo DATAREF da mesma forma que na consulta das regras de contribuição de aposentado.
================================================================================
CM$VER      3.05.01a    03/02/2005
--------------------------------------------------------------------------------
Pendência: 18625
Tela: Preparo
Descrição: Colocar o campo flgconcessao nas consultas passadas para a regra de cálculo de contribuição de pensionista.
================================================================================
CM$VER      3.05.01     01/02/2005
--------------------------------------------------------------------------------
Pendência: 17816
Tela: Contabilização de Abono
Descrição: O pagamento do abono de anos anteriores passa a ser contabilizado como pagamento de despesa de benefício. 
No pagamento normal de benefício passa a ser contabilizado mensalmente a provisão para abono anual e a provisão da receita de contribuição sobre o abono anual. Esta contabilização é lançada em planilha separada na efetivação da versão. Nos estornos de pagamento que tratam contabilização, é realizado o estorno deste provisionamento. 
Esta funcionalidade de provisão fica habilitada a partir da marcação do parâmetro devido em Sistema/Configuração/Parâmetros do Sistema, botão Processo Efetivação/Efetivação item "Contabiliza a provisão de abono...".
Pendência: 18110
Tela: Prévia Normal
Descrição: Para rubricas não processadas além do controle de valor colocar o campo flgespecial igual 1, na gravação da Prévia para torná-las informativas.
Pendência: 18211
Tela: Preparo de Abono Anual
Descrição: Tratar lançamento de devolução de benefício no histórico com valor zero.
Pendência: 18253
Tela: Folha Extra
Descrição: Utilização da rubrica de IR para abono anual, quando o mesmo é selecionado.
Pendência: 18406
Tela: Folha Extra
Descrição: Tratamento de duplicidade de contas preferenciais e contas incompletas.
Pendência: 18415
Tela: Rubricas Individuais
Descrição: Filtrar somente as pessoas com planos ativos.
Pendência: 18420
Tela: Relatório Individual de Rubricas
Descrição: Utilizar a na query que busca as rubricas do mês, o campo MESCOBRANCA da tabela HISTRUBSAL e PREVIA e não o campo MES.
Pendência: 18462 
Tela: Importação de Arquivo de Convênio
Descrição: Tratar crítica de situação de benefício para importação através da inscrição do participante.
Pendência: 18476 
Tela: Importação de Arquivo de Convênio
Descrição: Geração de arquivo de crítica para importação através da inscrição do participante.
Pendência: 18477 
Tela: Consulta do Histórico de Pagamentos
Descrição: Ajustar a consulta do histórico de pagamentos para utilizar os campos flgdesconto e flgespecial da tabela de Histórico de Rubricas (HISTRUBSAL).
Pendência: 18479
Tela: Prévia Normal
Descrição: Passar para as regras de alterador de benefício o tipo do benefício (ex.:vitalício ou único) e o código do benefício.
Pendência: 18483
Tela: Prévia
Descrição: Verificar se as rubricas de desconto de IRRF estão parametrizadas corretamente como normal e desconto.
Pendência: 18484
Tela: Consulta da Prévia
Descrição: Ajuste da consulta da prévia de pagamentos para utilizar os campos flgdesconto e flgespecial da tabela Previa.
Pendência: 18487
Tela: Contra Cheque Trimestral
Descrição: Utilizar o flgespecial e flgdesconto da HistRubSal. Verificar a utilização do flgespecial = 2 para a composição do total de desconto. Passar o Contra Cheque Trimestral para o módulo da fundação.
Pendência: 18507
Tela: Efetivação de Pagamento
Descrição: Corrigir o valor líquido da versão de pagamento, pois está sendo arredondado.
Pendência: 18518
Tela: Preparo (reajuste)
Descrição: Os benefícios com último mês preparo nulo não foram reajustados.
Pendência: 18553
Tela: Cálculos da Folha/Preparo
Descrição: A preparo dos benefícios retidos gravou o histórico de benefícios corretamente sem lote, mas erradamente com Flgenviado = 0.
Pendência: 18579
Tela: Cálculos da Folha/Prévia/Pagamentos Pendente
Descrição: Ao efetuar restabelecimento de benefício de resgate o sistema está recalculando IRRF corretamente porém colocando na rubrica 1170, que é IRRF normal.
================================================================================
CM$VER      3.04.16f    28/01/2005
--------------------------------------------------------------------------------
Pendência: 18581
Tela: Prévia de Pagamento
Descrição: Quando a base de suplementação para IR não comporta o desconto de benefício de INSS e o IR é total, este desconto não foi considerado na base de cálculo do IR.
================================================================================
CM$VER      3.04.16e    26/01/2005
--------------------------------------------------------------------------------
Pendência: 18540
Tela: Cadastros / Entidades Externas / Exportacao de Arquivos
Descrição: Tratar o campo SitEnvio da tabela TmpDesc com char e não mais como inteiro.
================================================================================
CM$VER      3.04.16d    12/01/2005
--------------------------------------------------------------------------------
Pendência: 14606
Tela: Estorno de Pagamento
Descrição: Adaptação para Multi fundação.
Pendência: 17716
Tela: Estorno de Pagamento
Descrição: Adaptar estorno para utilizar as rotinas em 3 camadas.
Pendência: 18448
Tela: Estorno de Pagamento
Descrição: No estorno individuais. para o lançamento contábil que estornar os lançamentos da apropriação das rubricas realizadas na efetivação, deve-se utilizar os parâmetros contábeis existentes no histórico de rubricas (HISTRUBSAL).
Pendência: 18455
Tela: Estorno de Pagamento
Descrição: Ajuste no estorno para pagamento indevido se o pagamento original já foi estornado como pagamento pendente.
Pendência: 18458
Tela: Consulta Histórico de Pagamento
Descrição: Os valores base dos benefícios não estão aparecendo na consulta.
================================================================================
CM$VER      3.04.16c    12/01/2005
--------------------------------------------------------------------------------
Pendência: 18457
Tela: Efetivação de Pagamento
Descrição: Tratar o centro de custo padrão para os documentos financeiros gerados na efetivação da versão de pagamento.
================================================================================
CM$VER      3.04.16b    11/01/2005
--------------------------------------------------------------------------------
Pendência: 18276 (reabertura)
Tela: Prévia Normal
Descrição: Acerto na verificação da margem de desconto das rubricas, quando existe pensão alimentícia sobre INSS, que gera uma rubrica de CPMF a ser repassada ao consignatário. Existem casos nos quais o líquido é zerado, mas o repasse de CPMF não tem margem de desconto, embora seja creditado ao consignatário.
================================================================================
CM$VER      3.04.16a    10/01/2005
--------------------------------------------------------------------------------
Pendência: 18437
Tela: Preparo
Descrição: Ajuste no preparo das contribuições de pensionista quando o responsável é uma terceira pessoa, que não tem benefício em seu nome.
================================================================================
CM$VER      3.04.16     07/01/2005
--------------------------------------------------------------------------------
Pendência: 18181
Tela: Estorno
Descrição: Desfazer a movimentacao de reservas feita pela Efetivacao, no estorno completo e estorno de pagamento indevido. 
Pendência: 18283 (reabertura)
Tela: Consulta/Relatórios/Gerenciais/Valores Líquidos de Pagamentos em Determinada Faixa
Descrição: Os valores totais não estão corretos. 
================================================================================
CM$VER      3.04.15e    05/01/2005
--------------------------------------------------------------------------------
Pendência: 18046
Tela: Cadastros / Estruturas de Cálculo
Descrição: Criar controle de acesso para os usuários, para os botões inserir, excluir e alterar da tela de cadastro de estruturas de cálculo.
Pendência: 18153
Tela: Estorno de Versão de Pagamento
Descrição: O estorno deu a mensagem "erro ao excluir planilha" mas estornou
Pendência: 18237
Tela: Prévia Normal
Descrição: Implementar limite máximo para os descontos facultativos calculado com base num percentual da margem líquida de proventos e descontos legais. Esta funcionalidade está implementada através de uma nova forma de cálculo da margem de desconto, utiliza uma parametrização individualizada para cada rubrica.
Pendência: 18372
Tela: Relatório de Lançamentos não Processados
Descrição: Retirar da consulta do relatório a junção com a tabela BENEFPLANOPART.
Pendência: 18373
Tela: Contabilização
Descrição: Para as rubricas de adicional judicial (normal, atraso e devolução), que devem ser parametrizadas para cada benefício no Cadastro de Plano do Admprev, utilizar a mesma parametrização contábil e financeira do benefício, a qual a pessoa está vinculada.
Pendência: 18376
Tela: Prévia Normal
Descrição: Ler os registros da tabela HstAtrasoContrib gerados pela Revisão de Benefício. Se este registro de alterador existir não executar os cálculos automáticos de alteradores utilizando as regras parametrizadas.
Pendência: 18377
Tela: Estorno de Versão de Pagamento
Descrição: No estorno completo de folha extra não processar alteração alguma na Rubrica Individual.
Pendência: 18388
Tela: Prévia Normal
Descrição: Só processar as regras de rubrica individual para base de abono, se a origem do benefício for de motivo normal ou motivo de abono.
Pendência: 18409
Tela: Estorno de Versão de Pagamento
Descrição: No estorno completo de versão de pagamento, a atualização da Rubrica Individual deve ser realizada apenas para as pessoas que estiverem na versão.
================================================================================
CM$VER      3.04.15d    04/01/2005
--------------------------------------------------------------------------------
Pendência: 18295
Tela: Fechamento de Convênios
Descrição: Ao fazer o fechamento dos Convênios ref. 13º/2004, para pagamento em 22/12/04, ocorreram erros no processamento.
Pendência: 18319
Tela: Fechamento de Convênios
Descrição: Permitir tratamento em separado de registros referentes a folha de abono anual.
================================================================================
CM$VER      3.04.15c    20/12/2004
--------------------------------------------------------------------------------
Pendência: 17717
Tela: Fechamento de Convênios
Descrição: Usar objetos de lançamento financeiro e contábil em 3 camadas.
Pendência: 18326
Tela: Preparo
Descrição: Ao executar o preparo da folha, o sistema retorna o seguinte erro: "qryprinc: field 'FLGBENEFTEMP' not found".
================================================================================
CM$VER      3.04.15b    16/12/2004
--------------------------------------------------------------------------------
Pendência: 18189
Tela: Fechamento de Convênios
Descrição: Adaptar o fechamento de convênio para gerar os alteradores vinculados aos desembolsos para o favorecido. Isto é necessário para se calcular a taxa de administração que a CBS cobra dos convênios.
Pendência: 18304
Tela: Efetivação de Pagamento
Descrição: Ao efetivar uma prévia de folha extra apareceu a mensagem de erro "ORA-02291: integrity constraint (CM.R_8004) violated - parent key not found". Esta ocorreu na gravação da Histrubsal porque o campo codportforma estava nulo na Previa para uma pessoa, que tinha 2 contas preferenciais cadastradas. Ajuste no controle da verificação para tratar esta situação. Não ocorreu erro na verificação contábil e financeira, apenas na verificação das contas correntes.
Pendência: 18305
Tela: Sistema / Utilitários / Geração de Arquivo de Entidade
Descrição: Ajustar o lançamento financeiro utilizando a conta contábil de apropriação das rubricas no momento da efetivação da Folha. Ajustar o portador forma utilizado para os documentos sem geração de arquivo bancário.
================================================================================
CM$VER      3.04.15a    15/12/2004
--------------------------------------------------------------------------------
Pendência: 18125
Tela: Preparo 
Descrição: No encerramento de benefícios temporários que paguem abono ao final do benefício, buscar os valores de benefício e contribuição processados referência de abono anual do ano corrente.
================================================================================
CM$VER      3.04.14f    14/12/2004
--------------------------------------------------------------------------------
Pendência: 18283
Tela: Consulta/Relatórios/Gerenciais/Valores Líquidos de Pagamentos em Determinada Faixa
Descrição: Os valores totais não estão corretos. 
Pendência: 18285
Tela: Efetivação de Pagamento
Descrição: Utilizar os campos flgdesconto e flgespecial da Previa.
================================================================================
CM$VER      3.04.14e    14/12/2004
--------------------------------------------------------------------------------
Pendência: 18218
Tela: Cadastros/Entidades Externas/Exportação de Arquivos
Descrição: Registro esta saindo em duplicidade. Acrescentado junção do campo IDPESSJUR da Partprevplan com IDPATRO da Histrubsal
Pendência: 18276
Tela: Prévia Normal
Descrição: Acerto na verificação da margem de desconto das rubricas, quando existe pensão alimentícia sobre INSS, que gera uma rubrica de CPMF a ser repassada ao consignatário. Existem casos nos quais o líquido é zerado, mas o repasse de CPMF não tem margem de desconto, embora seja creditado ao consignatário.
Pendência: 18278
Tela: Cadastros/Entidades Externas/Exportação de Arquivos
Descrição: Não esta gravando o campo CODIGOCONTROLE gravado na tabela Tmpdesc.
Pendência: 18281
Tela: Prévia Normal
Descrição: Colocar o campo IDMODULO nas consultas passadas para as regras de alteradores.
Pendência: 18282
Tela: Prévia Normal
Descrição: Controle do mês de referência padrão quando não existe pagamento de provento de benefício, pois o histórico de benefício está com valor zerado.
================================================================================
CM$VER      3.04.14d    07/12/2004
--------------------------------------------------------------------------------
Pendência: 18236
Tela: Cálculos da Folha \ Prévia \ Normal \ Desfazer Preparo
Descrição: Está excedendo o limite máximo de cursores abertos "maximum open cursors exceeded".
================================================================================
CM$VER      3.04.14c    07/12/2004
--------------------------------------------------------------------------------
Pendência: 18216
Tela: Relatório de Pagamento da Folha de Benefícios
Descrição: Na impressão no módulo folha/consulta/relatórios/operacional/folha de beneficios, está dando o erro.
Pendência: 18217
Tela: Sistema \ Utilitários \ Contra-Cheque 
Descrição: Colocar o teste de rubrica informativa ou outras rubricas (flgespecial = 2), na hora em que totaliza os proventos, os descontos e o líquido.
Pendência: 18219
Tela: Cadastros \ Ação Judicial \ Ação Judicial de Imposto de Renda
Descrição: Não está mostrando regra nenhuma no detalhe.
Pendência: 18220
Tela: Cálculos da Folha \ Preparo
Descrição: Está faltando o campo IDPLANOORIGEM na query principal.
Pendência: 18231
Tela: Cálculos da Folha \ Preparo
Descrição: Estava sendo passado para o campo do sql da regra de contribuição de abono, o valor total do benefício de INSS e não o valor Atual.
================================================================================
CM$VER      3.04.14b    03/12/2004
--------------------------------------------------------------------------------
Pendência: 18204 (reaberta)
Tela: Cadastro de Rubricas Individuais
Descrição: Tratar rubricas bloqueadas no monta select de seleção de rubricas.
================================================================================
CM$VER      3.04.14a    02/12/2004
--------------------------------------------------------------------------------
Pendência: 18199
Tela: Cadastro / Rubricas / Grupo de Rubricas
Descrição: Esta acontecendo o seguinte erro ao entrar na tela: 'EDDatabaseError - qryRubricaxGrupo:Typemismatch for field 'codigo', Float actual: String'
Pendência: 18204
Tela: Cadastro de Rubricas Individuais
Descrição: Tratar rubricas bloqueadas no monta select de seleção de rubricas.
================================================================================
CM$VER      3.04.14     01/12/2004
--------------------------------------------------------------------------------
Pendência: 18185
Tela: Efetivação de Pagamento
Descrição: Ajuste na geração da planilha para lançamentos em partida dobrada, pois estava gerando várias planilhas.
Pendência: 18186
Tela: Consulta/Relatórios/Operacionais/Relatório de Importação de Convênios
Descrição: Ajuste no mês de referência para buscar os dados de importação referentes a folha de abono.
Pendência: 18197
Tela: Prévia de Abono
Descrição: Na prévia de abono executou 2 vezes as regras de consignação judicial para o mês 12 e 13/2004.
================================================================================
CM$VER      3.04.13z    29/11/2004
--------------------------------------------------------------------------------
Pendência: 18180
Tela: Consulta/Relatórios/Operacionais/Relatório de Importação de Convênios
Descrição: Ajustar a identificação das rubricas nos convênios avulsos que permitem a importação do código da rubrica, ao invés desta ser fixa.
================================================================================
CM$VER      3.04.13x    29/11/2004
--------------------------------------------------------------------------------
Pendência: 17910
Tela: Consulta Prévia
Descrição: No caso de grupo familiar exibir o percentual de cada beneficiário associado ao responsável.
Pendência: 17911
Tela: Consulta Versão de Pagamento
Descrição: No caso de grupo familiar exibir o percentual de cada beneficiário associado ao responsável.
Pendência: 18070
Tela: Preparo
Descrição: O preparo de abono anual preparou indevidamente registros para pessoas que já haviam sido preparadas no lote de concessão. Ajuste na busca da devolução de adiantamento de abono, fazendo o lançamento da devolução pelo total de registros identificados. Fazer o mesmo tratamento para as contribuições processadas no adiantamento de abono.
Pendência: 18132
Tela: Preparo de Abono
Descrição: Passar o campo INSCRICAODATA com a inscricao do participante no plano.
Pendência: 18177
Tela: Exportação de arquivo de convênio 
Descrição: Utilizar o campo ordem da Histrubsal para o preenchimento da coluna sequencial da rubrica do arquivo de retorno.
Pendência: 18179
Tela: Preparo de Abono
Descrição: No preparo de abono anual dos benefícios temporários busca valores de abono pagos ao longo do ano e lançar as respectivas devoluções.
================================================================================
CM$VER      3.04.13v    25/11/2004
--------------------------------------------------------------------------------
Pendência: 17774
Tela: Efetivação de Pagamento
Descrição: As matrículas 174888 e 167619, concedidas no mês 2004/08, ficaram com a cobrança da contribuição de assistido desmarcada.
Pendência: 18054
Tela: Efetivaçãob de Pagamento
Descrição: Permitir o abatimento de todas reservas executando as regras associadas, ao invés de fazer o abatimento pela ordem de prioridade das mesmas. Para ativar esta funcionalidade deve-se marcar na tela de Parâmetros do sistema, o parãmetro "Efetua abatimento das reservas para TODAS que...", na pasta Efetivação.
Pendência: 18063
Tela: Efetivação de Pagamento
Descrição: Quando da concessão do benefício, a situação do participante na patrocinadora e fundação estavam como Afastado Aposentadoria Invalidez e assim deveria ficar após a efetivação, entretanto o sistema alterou a situação para Ativo.
Pendência: 18096
bTela: Consulta/Relatórios/Pagamento da Folha
Descrição: Otimização do código na construção da consulta.
Pendência: 18099
Tela: Calculo da Folha/Previa/Folha Extra
Descrição: Não está sendo possível selecionar a beneficiaria de pensão alimentícia, quando o devedor da pensão é um beneficiário de pensão por morte, conforme pode ser observado nas telas em anexo.
Pendência: 18101
Tela: Prévia Normal
Descrição: Alteração na ordenação da consulta principal da Prévia retirando os campos da tabela HSTBENEFBFCIARIO, IDPESSJUR e IDPLANOPREV. Com isto a ordenação principal passa a ser pelo campo IDTITULAR.
Pendência: 18102
Tela: Objeto Contábil
Descrição: Alteração na rotina de verificação do centro de custo. Consulta utilizava indevidamente a coluna IDPESSOA ao invés de IDEMPRESA.
Pendência: 18103
Tela: Prévia Normal
Descrição: Ajuste na Prévia para o processamento do abono anual para considerar o adiantamento de abono anual nos valores internos passados para as regras de rubrica individual e ação judicial.
Pendência: 18104
Tela: Prévia Normal
Descrição: Busca valores de consignação judicial de pensão alimentícia, processadas no adiantamento de benefício, de forma abater este valor do que será retornado pela regra na folha de abono.
Pendência: 18105
Tela: Desfazer Preparo
Descrição: Ajuste no desfazer preparo quando existe preparo normal e de abono no mesmo lote.
Pendência: 18129
Tela: Importação de Convênios
Descrição: Quando se importa vários arquivos em sequencia o total de valor referente aos registros não importados é acumulado com o valor da importação anterior.
Pendência: 18163
Tela: Parâmetros do Sistema
Descrição: Ajuste nas guias de Processo de Preparo.
Pendência: 18167
Tela: Folha/Cadastro/Manual de Histório de Benefício 
Descrição: Na tela de manual de histório de benefício, após rodar a prévia da folha de benefícios, não está aparecendo os benefícios do plano de origem dos aposentados e pensionistas.
================================================================================
CM$VER      3.04.13u    24/11/2004
--------------------------------------------------------------------------------
Pendência: 18160
Tela: Cadastro Manual de Histórico de Benefícios
Descrição: Não está aparecendo os benefícios de pensionista.
================================================================================
CM$VER      3.04.13t    22/11/2004
--------------------------------------------------------------------------------
Pendência: 16715
Tela: CADASTRO DE RUBRICA INDIVIDUAL / PREVIA
Descrição: Permitir o cadastramento de rubricas individuais com controle de saldo disponível para desconto, atualizado mensalmente, com o valor retornado pela regra de cálculo ou o valor fixo informado.
Pendência: 17217 (reabertura 3.04.13t)
Tela: Efetivação de Pagamento
Descrição: Ajuste no controle de geração de documentos para Patrocinadora e na geração das múltiplas contas de baixa dos documentos.
Pendência: 17595
Tela: Efetivação de Pagamento
Descrição: Na verificação da Prévia não permitir lançamentos em plano previdenciário contábil inativo. 
Pendência: 17647
Tela: Prévia Normal
Descrição: Implementar a verificação de plano previdenciário contábil inativo e exibir mensagem de alerta.
Pendência: 17671
Tela: CADASTROS / MANUAL DE LANCAMENTOS PARA A FOLHA DE BENEFICIOS
Descrição: Incluir opção para buscar pela MATRÍCULA DO BENEFICIARIO na tela FOLHA / CADASTROS / MANUAL DE LANCAMENTOS PARA A FOLHA DE BENEFICIOS
Pendência: 17682
Tela: Fechamento de Convênio
Descrição: Criação de campo na tela de fechamento de convênio para que o usuário informe a data de pagamento, quee será utilizada, para todos os layouts, ao invés de se fazer o cálculo pela parametrização do cadastro.
Pendência: 17793
Tela: Prévia Normal
Descrição: Na folha de concessão enviar para a Tmpdesc as contribuições calculadas pela concessão de benefícios para participante, quando o recebedor é um beneficiário, devido por exemplo ao falecimento do participante.
Pendência: 17883
Tela: Busca Adiantamentos
Descrição: Ao buscar adiantamentos de setembro para lançar o desconto para outubro, apresentou mensagem de erro no insert da tabela RubricaIndiv, 
"ORA-01861: literal does not match format string - Unmapped SQL Error Code: 1861", devido ao parâmetro de data início da rubrica a ser lançada estar igual a "01/010/2004".
Pendência: 17917
Tela: Efetivação de Pagamento
Descrição: Permitir a regeração dos lançamentos contábeis de uma versão já efetivada, caso as planilhas não tenham sido integradas.
Pendência: 17922
Tela: Prévia Normal
Descrição: Ajuste na mensagem de ausência de parâmetros de conta corrente.
Pendência: 17927
Tela: Objeto Contábil
Descrição: Ajuste na consolidação das mensagens de erro das rubricas.
Pendência: 17941
Tela: Fechamento de convênio
Descrição: Ajuste no tratamento das rubricas de devolução. 
Pendência: 17943
Tela: Consulta Histórico de Pagamento
Descrição: Acrescentar mês na cláusula da consulta que obtém os valores base do benefício.
Pendência: 17946
Tela: Efetivação de Pagamento
Descrição: Gravar vinculação da versão com lotes processados na Prévia.
Pendência: 17952
Tela: Cadastro de Rubricas Individuais
Descrição: Colocar campos para informar as rubricas para abono anual.
Pendência: 17964
Tela: Cadastro Manual de Benefícios
Descrição: Ajuste no montaselect para retirar junção com a tabela Partprevplan e utilizar os próprios campos da view VWPARTICIPDEPEN.
Pendência: 17983
Tela: Relatório de Parâmetros de Rubricas de Benefício
Descrição: Construção do novo relatório de parametrizações de rubricas de benefício, acessado em Consulta/Relatórios/Folha de Benefícios/Cadastro/Relatório de Parâmetros de Rubricas de Benefício.
================================================================================
CM$VER      3.04.13s    09/11/2004
--------------------------------------------------------------------------------
Pendência: 18062
Tela: Consultas/Relatórios/Folha de Benefícios/Demonstrativos/Demonstrativo de Pagamento
Descrição: Ao gerar o relatório de DEMONSTRATIVO DE PAGAMENTO não estão aparecendo os participantes constantes em determinadas versões de folha. Porém gerando o relatório DEMONSTRATIVO DE PAGAMENTO 2ª VIA, tais participantes aparecem. De forma que as opções utilizadas na consulta do primeiro relatório são identicas as opções que apareceram no segundo.
================================================================================
CM$VER      3.04.13r    04/11/2004
--------------------------------------------------------------------------------
Pendência: 18048
Tela: Contracheque trimestral
Descrição: alterar o layout do contracheque de assistidos ( arquivo anexo). OBS: existem apenas 11 linhas “ 2” e não 14, conforme passado incorretamente no layout anterior.
================================================================================
CM$VER      3.04.13q    26/10/2004
--------------------------------------------------------------------------------
Pendência: 17999
Tela: Prévia Normal
Descrição: No processamento da Prévia de um regaste de reserva não executou a regra de 
consignação judicial (PA).
================================================================================
CM$VER      3.04.13p    26/10/2004
--------------------------------------------------------------------------------
Pendência: 17997
Tela: Relatórios / Relação de Pagamentos Individuais (no. 563)
Descrição: Ajuste na consulta pois alguns pagamentos estão saindo com valores maiores. Isto ocorreu para pagamentos com documentos individuais por falta de join entre a histrubsal e hstfolhabenefcap pelo campo coddocumento.
================================================================================
CM$VER      3.04.13o    14/10/2004
--------------------------------------------------------------------------------
Pendência: 17913 (reabertura)
Tela: Preparo
Descrição: Na consulta para a regra de benefício mínimo referente ao valor de abono anual, quando de encerramento automárico do benefício colocar o campo FLGTIPOFOLHA igual a 3.
================================================================================
CM$VER      3.04.13n    14/10/2004
--------------------------------------------------------------------------------
Pendência: 17711
Tela: Prévia Normal
Descrição: Identificar duplicidade de CODPORTFORMA, da RubricaIndiv para o mesmo Favorecido e não gerar a Prévia nestas situações, exibindo a mensagem de erro.
Pendência: 17754
Tela: Prévia Normal
Descrição: Gravar o campo NUMPROCINSS registrado na Rubrica Individual de consignatário de Pensão Alimentícia, nas tabelas Previa e Histrubsal.
Pendência: 17913
Tela: Preparo
Descrição: Na consulta para a regra de benefício mínimo referente ao valor de abono anual, quando de encerramento automárico do benefício está colocando nos campos MESREFERENCIA e ANOMESREF o mês de pagamento e não o mês de referência, que no caso em questão deveria ser 2004/13.
================================================================================
CM$VER      3.04.13m    13/10/2004
--------------------------------------------------------------------------------
Pendência: 17086
Tela: Efetivação de Pagamento
Descrição: Para beneficiários cuja ação judicial de imposto de renda está ganha, o valor do efetivo no pagamento do benefício e da contribuição, quando desmembrados em duas rubricas, com e sem incidência de IR, não estão sendo baixados com o valor integral processado na Prévia.
Pendência: 17748
Tela: Relatório de Valores Líquidos de Pagamento em Determinada Faixa
Descrição: O relatório está trazendo valores divergentes quando se consulta a PREVIA e a EFETIVADA. Conforme as consultas capturadas pelo sqlmonitor, a cláusula IDMODULO = 18 na opção pela Prévia, não está considerando rubricas provenientes de outros módulos, no caso empréstimo.
Pendência: 17870
Tela: Efetivação de Pagamento
Descrição: Na efetivação de uma Prévia o sistema "caiu". Ao reiniciar a efetivação foram lançadas planilhas em duplicidade na contabilidade. 
Pendência: 17878
Tela: Preparo
Descrição: Quando existe encerramento automático com geração de abono anual, o preparo não encerrou benefício e a situação do participante na Fundação não foi alterada para ativo. 
Pendência: 17891
Tela: Prévia Normal
Descrição: Tratar retorno da regra de benefício mínimo na Prévia, não executando a regra de último pagamento nos casos de valor inválido.
Pendência: 17892
Tela: Prévia Normal
Descrição: Ajustar a forma de aplicar o percentual da ação judicial de forma a compensar $0,01, na abertura de rubricas para ações ganhas.
Pendência: 17894
Tela: Efetivação de Pagamento
Descrição: Não gerar arquivo eletrônico caso todos os pagamentos sejam zero.
Pendência: 17899
Tela: Efetivação de Pagamento
Descrição: Na execução da efetivação de um conjunto de lotes, não está sendo exibido o número da versão criada.
Pendência: 17902
Tela: Efetivação de Pagamento
Descrição: Se um documento tiver apenas uma conta de baixa gravar esta tabela Documento, sem a necessidade de gravar a estrutura CCBaixaxDocum.
Pendência: 17903
Tela: Preparo
Descrição: Exibir mensagem detalhada de erro no processo de reajuste de benefício.
================================================================================
CM$VER      3.04.13l    04/10/2004
--------------------------------------------------------------------------------
Pendência: 17511
Tela: Consultas/Histórico de Pagamento
Descrição: Não está mostrando situação do pagamento para FLGESTORNO = 4 (reprocessamento).
Pendência: 17525
Tela: Importação de Arquivo de Convênio
Descrição: Adaptar a crítica de matrícula para identificar situação quando o participante não tem benefício, mas a matrícula existe. Hoje quando se obriga a existência de benefício na importação a mensagem é sempre de "Matrícula não existe".
Pendência: 17526
Tela: Importação de Arquivo de Convênio
Descrição: Normalizar as mensagens de crítica de arquivo com 27 caracteres.
Pendência: 17566
Tela: Efetivação de Pagamento
Descrição: Substituir os métodos: 
  De: uDocumento    ( CMBack50 ) para: uCtrlDocumento  ( CMCapcarObj50 )
  De: uLancaContab ( CMBack50 ) para: uCtrlLancamento ( CMContabObj50 )
  De: uLancFinanc   ( CMBack50 ) para: uCtrlFinanc         ( CMCFinanObj50 )
Pendência: 17651
Tela: Relatório / Segunda Via de Contracheque
Descrição: Permitir a seleção por matrícula de dependente.
Pendência: 17664
Tela: Prévia Normal
Descrição: Alterar a rotina de agrupamento de registros do Histórico de Benefícios antes da execução da Prévia. Tratar registros processos diferentes que estão em lotes diferentes. Tratar registros de lotes diferentes e cuja origem é concessão. Deve-se colocar os registros num dos lotes, preferencialmente o que tem motivo de pagamento normal. Exibir as pessoas com registros alterados, para as quais se deverá executar a Prévia novamente, assim como os lotes que deverão ter Previa executada. As alterações de lote realizadas no histórico de benefícios deverão também ser realizadas na tabela de Movimentação de Benefícios.
Pendência: 17709
Tela: Efetivação de Pagamento
Descrição: Embora exista o default para o campo SEQDOCUMENTO na Prévia, prever gravação na Histrubsal desta informação com o valor = 1, no caso da opção de geração de arquivo eletrônico desmarcado, para poder processar a geração dos documentos financeiros. Este caso foi identificado na CBS, com uma Previa de folha extra gerada com versão anterior a 3.04.13f, na qual se efetua a gravação do campo seqdocumento = 1 na Previa, mesmo que esteja com default.
Pendência: 17720
Tela: Importação de Arquivo de Convênio
Descrição: Criar parâmetro para ser utilizado na tela de importação de arquivos de convênios, que controle se é aceita matrícula parcial no arquivo, ou apenas a matrícula completa. No caso de matrículas com DV, em geral no arquivo não vem o DV, e desta forma aceita-se uma matrícula incompleta, visto que mesmo sem o DV, se consegue identificar unicamente a pessoa. Por outro lado, matrícula sem DV, identificam unicamente a pessoa apenas se for completa. 
Pendência: 17721
Tela: Exportação de Arquivo de Convênio
Descrição: Ajustar a rotina de exportação para tratar as duas situações possíveis:
a) o layout fixa a rubrica e não é necessário a indicação de favorecido.
b) o layout não fixa a rubrica e é necessária a indicação de favorecido.
A tela exibe as rubricas nestas condições de forma que se possa gerar o arquivo para um subconjunto das rubricas vinculadas.
Pendência: 17728
Tela: Prévia Normal
Descrição: Criar um novo parâmetro e utilizá-lo na Prévia Normal para controlar o valor máximo do benefício bruto de INSS, abaixo do qual se reembolsa a CPMF.
Pendência: 17789
Tela: Prévia Normal
Descrição: Ajuste na execução da correção sobre contribuição atrasada, no caso de lançamentos oriundos de acertos de contribuição do participante falecido sobre o pensionista.
Pendência: 17803
Tela: Várias
Descrição: Não utilizar mais CMINTBANCO em 2 camadas e substituir a unit uBiblioteca pela uString.
Pendência: 17821
Tela: Consulta/Relatórios/Folha de benefícios/Operacionais/Relação Individual de Rubricas - CBS 
Descrição: Não estão aparecendo neste relatório as consignatárias que recebem benefício. Isso porque nesta versão atual do relatório, a query faz join da HISTRUBSAL com a DEPENTIT pelo IDPESSOA (consignataria não fica na DEPENTIT). Na versão anterior aparecia porque a query fazia join com a ELEGPATRO pelo IDTITULAR da HISTRUBSAL.
Pendência: 17824
Tela: Importação de Arquivo de Convênio
Descrição: Ajuste na importação de arquivos por matrícula para casos de pessoas participantes e dependentes de outros titulares. Criar parâmetro para indicar que pensionista tem matrícula própria.
Pendência: 17847
Tela: Exportação de Arquivo para Convênio
Descrição: Ajustar a consulta de valores com resíduo na geração de arquivo para layout com rubrica livre.
================================================================================
CM$VER      3.04.13k    28/09/2004
--------------------------------------------------------------------------------
Pendência: 17800
Tela: Cálculos da Folha/Gerar arquivo de Remessa Bancária
Descrição: Ao gerar arquivo de remessa individual o sistema apresenta erro com a seguinte mensagem: "Erro no processo de geração no arquivo de remessa de pagamento".
================================================================================
CM$VER      3.04.13j    27/09/2004
--------------------------------------------------------------------------------
Pendência: 17710
Tela: Cadastro de Rubricas Individuais
Descrição: Na confirmação de inclusão ou alteração, verificar se existem outros registros para o mesmo favorecido e titular, com CODPORTFORMA distinto do que foi atribuído no registro alterador e colocá-los todos iguais.
Pendência: 17759
Tela: Cadastro de Rubricas Individuais
Descrição: Ajustar o preenchimento do campo SEQRUBRICAINDIV para rubricas de pensão alimentícia, que apresentava erro no insert de nulidade não permitida em algumas situações.
Pendência: 17765
Tela: Objeto contábil
Descrição: Ajuste no método que abre as querys de parametrização para permitir a recarga dos valores, após alteração de parâmetro.
Pendência: 17766
Tela: Preparo
Descrição: Inclusão de tratamento de erro no processamento do cálculo das contribuições, para verificar casos nos quais as contribuições não estão sendo calculadas.
Pendência: 17786
Tela: Folha Extra
Descrição: Não está aparecendo os consignatários de pensão alimentícia na lista de recebedores.
Pendência: 17791
Tela: Consulta / Demonstrativo de Pagamentos
Descrição: Utilizar a data de pagamento e não a data de referência das rubricas na montagem das informações do pagamento, que formam o cabeçalho do contracheque.
Pendência: 17792
Tela: Prévia de Pagamento Pendente
Descrição: Gravação do campo seqdocumento na Prévia.
================================================================================
CM$VER      3.04.13i    21/09/2004
--------------------------------------------------------------------------------
Pendência: 17736
Tela: Prévia Normal
Descrição: Não gravou o campo VALORINFO na prévia para rubricas de empréstimo, apesar do valor constar na tmpdesc.
================================================================================
CM$VER      3.04.13h    21/09/2004
--------------------------------------------------------------------------------
Pendência: 17718
Tela: Consulta Histórico de Pagamentos
Descrição: Ajustar a tela para que se obtenha as versões pagas, quando o participante tenha migrado de plano, ao se digitar na caixa de texto de matrícula. Quando se busca pelo botão de Procurar os dados são exibidos corretamente.
Pendência: 17731
Tela: Objeto Contábil
Descrição: Ajustar a obtenção das contas crédito e débito para rubricas de devolução de benefício, lançadas na Tmpdesc. As contas a crédito e débito sendo gravadas na Prévia iguais a conta de apropriação do benefício, sem a lançamento da conta de líquido. 
Pendência: 17734
Tela: Prévia Normal
Descrição: Não cálculou arredondamento. Ajuste no momento da geração do líquido total em função da definição do contas/caixas x forma de pagamento alternativo (DOC/TED).
================================================================================
CM$VER      3.04.13g    16/09/2004
--------------------------------------------------------------------------------
Pendência: 17244
Tela: Cadastro de Rubricas de Exceção de Rubrica Individual
Descrição: Incluir botões para associar e desassociar todas as rubricas. Incluir monta select para seleção de rubricas a selecionar e selecionadas.
Pendência: 17409
Tela: Prévia de Pagamento Pendente
Descrição: Trazer o contas caixa x forma de pagamento da versão a ser liberada e permitir a alteração, obrigando preenchimento. Reposicionar os grids de informação colocando-os um acima e outro abaixo ao invés de lado a lado. Quando existir mais de um benefício a ser liberado, alterar a identificação do mesmo a partir da rubrica, visto que estava gravando o mesmo benefício em todas as rubricas.
Pendência: 17674
Tela: Cadastro de Rubricas Individuais
Descrição: Rever a tela de procura principalmente com relação a inscricão, pois na CBS ela e a forma principal de procura pois é única. 
Pendência: 17675
Tela: Cadastro de Rubricas Individuais
Descrição: Permitir atribuição de rubrica e favorecido, caso não estejam ainda atribuídas, mesmo que a rubrica individual já tenha sido utilizada em alguma Prévia da Folha.
================================================================================
CM$VER      3.04.13f    14/09/2004
--------------------------------------------------------------------------------
Pendência: 17432
Tela: Cadastro de Rubrica Individual
Descrição: Quando o usuário de inclusão do registro é diferente de "carga" ou "cm+id do usuário", ao efetuar a busca do beneficiário, o sistema está emitindo um erro. "NÚMERO INVÁLIDO"
Pendência: 17435
Tela: Relatório de Pagamentos Individuais - Nº 563/1
Descrição: Só exibir no relatório pagamentos normais. Não exibir os pagamentos estornados.
Pendência: 17648
Tela: Preparo
Descrição: No caso de encerramento de pensionista, quando apenas dos tipos de benefício (Fundaçã ou INSS) tem encerramento para uma pessoa, não exibir mensagem de que não encontrou encerramento para o outro benefício, pois não é necessária
Pendência: 17652 (CMFOLHAOBJMT.BPL)
Tela: Relatório / Segunda Via de Contracheque
Descrição: Ajustar a consulta que obtém as informações dos recebedores que se pode emitir a segunda via de contracheque. Obtê-los a partir do histórico de rubricas salariais gerado na Efetivação da Folha.
Pendência: 17663
Tela: Efetivação de Pagamento
Descrição: Gerou arquivo eletrônico mesmo com a opção "Não. Gera documento individual para todos os pagamentos." estando marcada
Pendência: 17670
Tela: Parãmetros do Sistema
Descrição: Está aparecendo mensagem obrigando selecionar uma Estrutura de Cálculo, na confirmação da tela.
Pendência: 17673
Tela: Prévia de Folha Extra
Descrição: Gravar sequencia de documento na Previa da Folha Extra.
Pendência: 17677
Tela: Prévia Normal
Descrição: Ajuste na atribuição do contas/caixas x forma de pagamento para parâmetro vinculado a tipo de conta. 
================================================================================
CM$VER      3.04.13e    10/09/2004
--------------------------------------------------------------------------------
Pendência: 17659
Tela: Efetivação de Versão de Pagamento
Descrição: Na efetivação está associando indevidamente várias linhas de patrocinadora e plano para um mesmo documento individual na tabela CCBAIXASXDOCUM
================================================================================
CM$VER      3.04.13d    09/09/2004
--------------------------------------------------------------------------------
Pendência: 11845
Tela: Cadastro de Histórico de Benefícios
Descrição: Na alteração de um registro para colocá-lo como retido, ou para excluí-lo, deve-se verificar se existe prévia de folha não efetivada no lote em questão e excluir estes registros da tabela Previa. Verificar que o botão de excluir só pode estar habilitado ao se pressionar o botão alterar.
Pendência: 14420
Tela: Parametros Globais do Sistema
Descrição: Retirar o parâmetro "Permite lançar rubricas individuais para assistidos e pensionistas", pois não é mais necessário.
Pendência: 15781
Tela: Prévia Normal
Descrição: Ao rodar a prévia  de abono anual, o sistema está considerando os benefícios retidos e cancelados até o ano anterior, caso a data final não esteja informada.
Pendência: 16713
Tela: Cadastro de Histórico de Benefícios
Descrição: Permitir alterar o campo FLGBENEFMIN da tabela de Benefícios (BENEFBFCIARIO).
Pendência: 16905
Tela: Consulta / Demonstrativo de Pagamento
Descrição: Na consulta ao demonstrativo de pagamentos no módulo Folha de Beneficios, permitir selecionar várias versões de pagamento.
Pendência: 17245
Tela: Relatório / Relação Individual de Rubricas
Descrição: Incluir filtro de plano contábil no relatório individual de rubricas.
Pendência: 17293
Tela: Cadastro de Histórico de Benefícios
Descrição: Padronização da descrição dos campos na seleção de participantes/dependentes". Abreviar campos para "Matric. Benef." e "Nº Insc.".
Pendência: 17319
Tela: Cadastro de Histórico de Benefícios
Descrição: Mostra os benefícios do participante apenas, pois quando a pessoa é aposentado e pensionista, está mostrando todos os benefícios de aposentadoria e pensão.
Pendência: 17438
Tela: Relatório / Relação Individual de Rubricas
Descrição: Exibir o código externo das rubricas quando parametrizado para tal, nos filtros e no relatório.
Pendência: 17518
Tela: Prévia Normal
Descrição: Utilizar a informação de Prazo de rubrica cadastrada na Provdesc para determinar se esta pode compor uma estrutura de cálculo, no caso de convênio avulsos. Prazo Permanente sempre entrar. Prazo Livre entrar quando parcela maior do que 1. Prazo Uma ocorrência não entra.
Pendência: 17520
Tela: Cadastro de Rubricas
Descrição: Alterar a denominação Indeterminado para Permanente na informação Prazo da rubrica.
Pendência: 17521
Tela: Relatório / Relação Individual de Rubricas
Descrição: Ajusta a consulta principal do relatório para tratar migração de plano para pensionistas.
Pendência: 17524
Tela: Relatório / Relação Individual de Rubricas
Descrição: Exibir a matrícula de dependente, além da matrícula do titular.
Pendência: 17536
Tela: Utilitários / Contracheque FUNCEF
Descrição: A query estava buscando somente as pessoas que tinham pelo menos um pagamento no mês de processamento.
Pendência: 17450
Tela: Cadastro de Estruturas de Cálculo
Descrição: Habilitar o botão de excluir estrutura de cálculo, permitindo excluir todos os registros de relacionamento de rubricas com a estrutura de cálculo.
Pendência: 17574
Tela: Geração de Arquivo Bancário de Consignatário
Descrição: Utilizar a Contas Caixa x Forma de pagamento parametrizada no layout do convênio para a geração dos documentos e arquivos bancários de pagamento dos convênios.
Pendência: 17575
Tela: Efetivação
Descrição: Ajuste na geração de documentos com a opção de não gerar arquivo eletrônico.
Pendência: 17576
Tela: Prévia Normal
Descrição: Incluir campo CODPAIS nas consultas passadas para regras de cálculo da Prévia.
================================================================================
CM$VER      3.04.13c    03/09/2004
--------------------------------------------------------------------------------
Pendência: 12048
Tela: Estorno
Descrição: Colocar verificação do status da Tmpdesc vinculado ao pagamento que vai ser estornado, para identificar se houve recebimento destes valores pelo sistema de origem. Nesta situação o estorno não será permitido, devendo-se antes desfazer os recebimentos efetuados.
Pendência: 16982
Tela: Associação de Rubricas por Plano
Descrição: Para as rubricas de provento e com obrigatoriedade de indicação de favorecido, não está habilitado o combo de Contas Caixas x Forma de Pagamento.
Pendência: 16994
Tela: Cadastro de Ação Judicial
Descrição: Se após procurar uma matrícula na operação de inclusão se cancelar pressionando o botão SAIR aparece uma mensagem de erro.
Pendência: 17188
Tela: Efetivação
Descrição: Ajuste no controle de transação.
Pendência: 17265
Tela: Folha Extra
Descrição: Ajuste na obtenção de conta de líquido para folha extra.
Pendência: 17457
Tela: Efetivação
Descrição: Utilizar a data de pagamento gravada no Histórico de Rubricas na geração do arquivo eletrônico.
Pendência: 17534
Tela: Estorno
Descrição: Não permitir que seja inserido alterador com valor zerado.
Pendência: 17543
Tela: Efetivação
Descrição: Ajuste na apropriação contábil de uma versão para não abrir lançamentos contábeis da conta de líquido por tipo de rubrica.
Pendência: 17547
Tela: Pagamento Pendente e Folha Extra
Descrição: Ajustar a obtenção das Contas Caixas x Forma de Pagamento na Prévia de Pagamento Pendente. Alterar a nomenclatura para Contas Caixas x Forma de Pagamento nas duas telas.
================================================================================
CM$VER      3.04.13b    02/09/2004
--------------------------------------------------------------------------------
Pendência: 17387
Tela: Pagamento Pendente / Efetivação
Descrição: Ajuste na atribuição do Contas Caixa x Forma de Pagamento gerado na liberação de Pagamento Pendente que apresentava erro na Efetivação da Versão.
Pendência: 17473
Tela: Associação de Rubricas Por Regra
Descrição: Ajuste na inclusão de novas rubricas.
Pendência: 17530
Tela: Efetivação
Descrição: Ajuste na atribuição do favorecido do documento a ser gerado, para tratar Prévia oriundas de Folha Extra e de Pagamento Pendente.
================================================================================
CM$VER      3.04.13a    31/08/2004
--------------------------------------------------------------------------------
Pendência: 17523
Tela: Efetivação
Descrição: Deu erro na função TRIM pois a nossa versão de Oracle não suporta a mesma.
================================================================================
CM$VER      3.04.13     31/08/2004
--------------------------------------------------------------------------------
Pendência: 15948
Tela: Arquivo de Crédito
Descrição: Permitir a parametrização e respectiva geração de arquivos bancários de diversos Contas Caixa x Forma de Pagamento para Folha de Resgate de Reserva.
Pendência: 16504
Tela: Geração de Arquivo Bancário
Descrição: Para a Contas Caixa x Forma de Pagamento relativa a pagamentos em DOC, permitir que os valores relativos a TED sejam gerados em documento e arquivo bancário separado. 
Pendência: 16778
Tela: Processos que geram Tmpdesc
Descrição: Efetuar a gravação da chave primária na inclusão de registros na tabela Tmpdesc.
Pendência: 16996
Tela: Preparo
Descrição: Criação de opção para que mensagens de aviso exibidas no processamento do preparo sejam omitidas.
Pendência: 17233
Tela: Prévia Normal
Descrição: Na previa da folha de concessão, ler a tabela HSTATRASOBENEF para verificar se o AdmPREV inseriu algum alterador a ser pago/descontado junto com o beneficio. Esta necessidade se deve ao fato da Revisão de Beneficios calcular alteradores que devem ser pagos/descontados junto com o beneficio e, no momento da revisao, não há como jogar esses valores diretamente na previa.
Pendência: 17267
Tela: Prévia Normal
Descrição: Incluir os campos IDPESSOA, IDTITULAR, IDPLANOPREV na consulta para as regras de alteradores.
Pendência: 17284
Tela: Preparo
Descrição: Separar o processamento do preparo em 3 fases, para otimizar encerramento de pensionistas: 
a) benefícios sem encerramento;
b) benefícios de aposentados com algum benefício em encerramento automático no mês;
c) benefícios de pensionistas com algum benefício no grupo em encerramento automático no mês.
Pendência: 17285
Tela: Prévia Normal (atualização de dependentes para IR)
Descrição: Ajuste na rotina de atualização de número de dependentes de IR para dependentes tipo COP, COM, PAI, OUT.
Pendência: 17286
Tela: Prévia Normal
Descrição: Além da rubrica, usar o identificador de contribuição na obtenção dos alteradores a serem executados.
Pendência: 17289
Tela: Importação de Arquivos
Descrição: Substituir a mensagem "Registro não importado por existência." por "Não import por duplicidade", devido ao truncamento na gravação do arquivo de crítica.
Pendência: 17296
Tela: Preparo
Descrição: Quando de retenção de benefício, gravar Tipo de Movimentação de Retenção corretamente no registro na MovBenef. Está gravando sempre encerramento.
Pendência: 17360
Tela: Preparo
Descrição: Na manutenção de benefícios quando se ajusta a alteração da situação do processo, tratar os casos de processos de benefícios que erroneamente estejam com situação nula.
Pendência: 17374
Tela: Prévia Normal
Descrição: Utilizar a CPMF sobre o benefício de INSS para a composição da margem bruta para processar os descontos.
Pendência: 17400
Tela: Efetivação
Descrição: Ao fazer o processo de efetivação de um determinado lote, e o parâmetro de pedir confirmação ao final estiver marcado, mesmo que não haja confirmação da efetivação, ou seja, ao exibir a mensagem se deseja confirmar e o usuário clique na opção 'NÃO' , o sistema está gravando todos os históricos e documentos contábeis/financeiros.
Pendência: 17439
Tela: Geração de Arquivo Bancário da Prévia
Descrição: Permitir a seleção de vários lotes e processar vários portadores de pagamento numa seleção única.
Pendência: 17452
Tela: Efetivação
Descrição: Gravar o nome do arquivo texto gerado durante a efetivação.
Pendência: 17453
Tela: Efetivação
Descrição: Ajuste na verificação das contas contábeis considerando exclusivamente as informações PLACONTAC e PLACONTAD da Previa.
Pendência: 17455
Tela: Efetivação
Descrição: Verificar se favorecido de documento existe em FORNSERV e EMPRESAFORN.
Pendência: 17461
Tela: Efetivação
Descrição: Não está respeitando o parâmetro de dias de float cadastrado na estrutura Banco / Contas Caixas x Forma de Pagamento.
Pendência: 17496
Tela: Geração de Arquivo de Remessa
Descrição: Permitir a seleção de várias Contas Caixa x Forma de Pagamento. Utilizar o objeto de geração de arquivo eletrônico em 3 camadas.
Pendência: 17508
Tela: Efetivação
Descrição: Ajustar geração da contabilização para folha de pagamento pendente.
Pendência: 17516
Tela: Efetivação
Descrição: Não está gravando corretamente o valor do IR compensado no histórico de compensação de IR.
Pendência: 17517
Tela: Folha Extra
Descrição: Incluir hint do Oracle RULE na query que localiza os registros na Prévia.
================================================================================
CM$VER      3.04.12q    26/08/2004
--------------------------------------------------------------------------------
Pendência: 17488
Tela: Folha Extra
Descrição: Após o lançamento de uma rubrica para uma pessoa, o portador forma associado, mesmo que não preenchido previamente, é definido pela conta bancária. Entretanto, ao incluir rubrica para outra pessoa o campo do portador forma fica preenchido com o valor definido para a pessoa anterior e é então automaticamente atribuído. Deve-se limpar o campo do portador forma após se selecionar uma nova pessoa.
================================================================================
CM$VER      3.04.12p    26/08/2004
--------------------------------------------------------------------------------
Pendência: 17485
Tela: Estorno
Descrição: O estorno completo apresenta mensagem de erro na exclusão dos documentos.
================================================================================
CM$VER      3.04.12o    25/08/2004
--------------------------------------------------------------------------------
Pendência: 17223
Tela: Preparo
Descrição: Quando da geração da folha de manutenção, os valores referente ao cálculo da taxa de administração, não estão corretos, conforme consta no HISTÓRICO DE CONTRIBUIÇÕES DO PREVIDNECIÁRIO. O valor correto referente a matrícula 144204, é de R$ 51,38, competência 05/2004.
================================================================================
CM$VER      3.04.12n    24/08/2004
--------------------------------------------------------------------------------
Pendência: 16905
Tela: Colsulta / Relatórios / Demonstrativo de 2ª via do contra cheque
Descrição: Na consulta ao demonstrativo de pagamentos no módulo Folha de Beneficios, colocar a opção para assinalar o quantitativo a ser consultado ou impresso, igual ao  do módulo Central de Atendimento.
Pendência: 17066
Tela: Prévia / Folha Extra
Descrição: Ao lançar uma rubrica com o código do Darf 0561, que não incide IR, sendo que essa é uma rubrica de devolução de auxílio doença, para descontar de uma rubrica de provento que tenha o código Darf 3223, o sistema está lançando uma rubrica de IR com código Darf 0561e não 3223 como deveria.
Pendência: 17204
Tela: Cadastros / Manual do Histórico de Benefícios
Descrição: Ao entrar para alterar um registro do detalhe cujo benefício já foi pago, o sistema não permite por já estar pago ( o que está correto), mas ao clicar no cancelar, o botão Excluir detalhe fica habilitado e permite excluir o registro, sem verificar que já está pago.
Pendência: 17375
Tela: Consulta Prévia de Pagamento
Descrição: Colocar o nome do plano previdenciário no MontaSelect de seleção para se identificar os planos antes e depois quando ocorrer migração de plano
================================================================================
CM$VER      3.04.12m    20/08/2004
--------------------------------------------------------------------------------
Pendência: 17434
Tela: Importação 
Descrição: O sistema estava quebrando as linhas muito grandes dos arquivos.
================================================================================
CM$VER      3.04.12k    18/08/2004
--------------------------------------------------------------------------------
Pendência: 17386
Tela: Relatório de Resumo de Rubricas
Descrição: Não é possível tirar um relatório a partir da prévia, com as mesmas opções que são tiradas a partir da histrubsal.
Pendência: 17403
Tela: Efetivação
Descrição: Ao efetivar um documento individual, está acusando divergência no valor do lançamento com o valor do rateio.
================================================================================
CM$VER      3.04.12j    16/08/2004
--------------------------------------------------------------------------------
Pendência: 17272
Tela: Prévia Normal
Descrição: Implementar o abono de R$100,00 a ser deduzido da base de cálculo do imposto de renda retido na fonte para rendimentos do trabalho assalariado (código 0561), inclusive abono anual. 
================================================================================
CM$VER      3.04.12i    09/08/2004
--------------------------------------------------------------------------------
Pendência: 17134
Tela: Cadastros / Ação Judicial de Imposto de Renda
Descrição: Ao escolher uma nova pessoa e marcar a opção "efetua depósito", o sistema traz os dados bancários da última pessoa.
Pendência: 17347
Tela: Cálculos da Folha / Prévia / Pagamento Pendente
Descrição: Ao processar a prévia de um lote de pagamento pendente, dá um erro de violação de acesso.
================================================================================
CM$VER      3.04.12h    04/08/2004
--------------------------------------------------------------------------------
Pendência: 17298
Tela: Efetuvação
Descrição: Lançar nos documentos sempre como múltiplas contas de baixas, mesmo que está conta de baixa seja única.
Pendência: 17300
Tela: Efetivação
Descrição: Controle de transação quando opção de confirmar ao final marcada, no processamento de pendências a processar.
Pendência: 17301
Tela: Prévia da Folha Extra
Descrição: Efetuar a gravação do faverecido do documento financeiro na Previa de Folha Extra.
Pendência: 17310
Tela: Efetivação
Descrição: No caso de portador de pagamento individual gravar na Prévia o favorecido do documento caso este não esteja preenchido.
Pendência: 17314
Tela: Efetivação - tratamento de parametrização
Descrição: Na obtenção da parametrização contábil / financeira de uma rubrica lançada em folha extra verificar se a mesma é vinculada a benefício ou contribuição, para obter estes parâmetros respectivas estruturas de benefício e de contribuição.
================================================================================
CM$VER      3.04.12f    29/07/2004
--------------------------------------------------------------------------------
Pendência: 17266 (reabertura)
Tela: Efetivação
Descrição: Gravação do valor líquido final e data programada dos documentos.
================================================================================
CM$VER      3.04.12e    28/07/2004
--------------------------------------------------------------------------------
Pendência: 17266
Tela: Efetivação
Descrição: Gravação do valor líquido final e data programada dos documentos.
================================================================================
CM$VER      3.04.12d    27/07/2004
--------------------------------------------------------------------------------
Pendência: 17253
Tela: Efetivação
Descrição: Ajuste na mensagem de confirmação da verificação e da efetivação.
Pendência: 17254
Tela: Efetivação e Prévia
Descrição: Ajuste na atribuição de centro de responsabilidade padrão.
================================================================================
CM$VER      3.04.12c    23/07/2004
--------------------------------------------------------------------------------
Pendência: 17242
Tela: Prévia
Descrição: O sistema está fechando o lote ao executar a prévia individual.
================================================================================
CM$VER      3.04.12b    16/07/2004
--------------------------------------------------------------------------------
Pendência: 17219
Tela: Geração de Arquivo Bancário da Prévia
Descrição: Adaptado para utilizar CMIntBanco50 em 3 camadas.
Pendência: 17217
Tela: Efetivação
Descrição: Ajuste no controle de geração de documentos para Patrocinadora e na geração das múltiplas contas de baixa dos documentos.
================================================================================
CM$VER      3.04.12a    13/07/2004
--------------------------------------------------------------------------------
Pendência: 10170
Tela: Prévia Normal
Descrição: Tornar utilização da estrutura de cálculo genérica, executando todas as estruturas cadastradas na Prévia para cada beneficiário.
Pendência: 10362
Tela: Efetivação
Descrição: Verificar ausência de conta de líquido para recebedor de pensão alimentícia.
Pendência: 11275
Tela: Efetivação
Descrição: Gravar no histórico de rubricas os parâmetros contábeis e financeiros utilizados na efetivação. Estes parâmetros são gravados também na Prévia.
Pendência: 14992
Tela: Efetivação
Descrição: Utilizar na efetivação da folha o Favorecido constante na relação de Bancos x Conta/Caixa x Forma de Pagamento, para a geração do documento financeiro associado ao arquivo eletrônico gerado.
Pendência: 15599
Tela: Preparo
Descrição: Implementação do processo de antecipação do Abono Anual. No preparo do Abono anual faz o lançamentos dos valores de abono adiantados.
Pendência: 16326
Tela: Previa Normal
Descrição: Apesar da parametrização estar correta continua dando o erro " Rubrica:1562 sem a Natureza de Rendimento parametrizada, mas compõe IR."  OBS: Folha de Concessão.
Pendência: 17061
Tela: Preparo
Descrição: Alteração no preparo para o sistema só preparar benefício com situação 6 (não concedido), caso o benefício seja de referência e se a fundação não paga o mesmo.
Pendência: 17084
Tela: Preparo
Descrição: Mostrar mensagem "Erro no layout", quando esse fato ocorrer.
Pendência: 17151
Tela: Relatório de Resumo de Rubricas
Descrição: Foi colocado mais um filtro e mais uma quebra no relatório, agora por plano previdenciário.
Pendência: 17186
Tela: Desfazer preparo
Descrição: Ajuste no desfazer preparo de grupo familiar, para restaurar corretamente o valor atual do benefício.
================================================================================
CM$VER      3.04.12     25/06/2004
--------------------------------------------------------------------------------
Pendência: 16383
Tela: Prévia \ Folha Normal
Descrição: Alteração na formação das bases para Imposto de Renda para definição de rubricas de
deduções a usar. A formação da base agora é feita pelo código do DARF aasociado a rubrica na tela
de cadastro de rubricas salariais (Cadastros\Rubricas\Rubricas Salariais)
Pendência: 16718
Tela: Prévia \ Pagamento Pendente
Descrição: Alteração para permitir ao usuário escolher a uma busca individual.
Pendência: 16719
Tela: Prévia \ Pagamento Pendente
Descrição: Alteração para permitir ao usuário selecionar todos os pagamentos pendentes de uma só
vez do responsavel escolhido. Essa opção só estará disponível para o tipo de busca individual por
matrícula.
Pendência: 16857
Tela: Prévia Normal
Descrição: Adequar a Folha a portaria do INSS a respeito do pagamento de Salário Família. 
Foi criada uma parametrização para se executar uma regra de cálculo de salário família.
Pendência: 16958
Tela: Prévia Normal
Na consulta de informações para a Prévia normal de pagamentos tratar valor nulo para o campo Flgmolestiagrave e 
utilizar o FlgdescIRMes da tabela Benefbfciario.
Pendência: 16959
Tela: Importação de Arquivo de Entidades
Na importação de arquivos com a opção de benefícios preparados, passou a identificar registros de 
histórico de benefício para qualquer motivo. Quando da importação com código externo e rubrica vinculada 
no layout, alterar identificação do código interno.
Pendência: 16961
Tela: Prévia Normal
Acerto na liberação de objetos que causava mensagem de "invalid pointer operation".
Pendência: 16965
Tela: Prévia Normal
Criação de estrutura para avaliação dos parâmetros contábeis e financeiros
das rubricas na fase da Prévia.                                              
Pendência: 16851
Tela: Consultas \ Relatórios \ Gerenciais \ Rendas Alteradas
Descrição: Foram criados dois filtros, possibilitando ao usuário escolher uma faixa do percentual.
Pendência: 14963
Tela: CONSULTA / RELATÓRIOS / OPERACIONAIS
Inclusão/alteração das informações no relatório  “Folha de Pagamento de Benefícios”:
- dados de ação judicial
- dados das rubricas individuais processadas
- sequencial da rubrica
- matrícula de pensionista
- ajuste da palavra INNS para INSS
Pendência: 16966
Tela: Lista de Recebedor
Ajuste no objeto de lista de recebedores para utilização em diversas telas.
Pendência: 16817
Tela: Consultas \ Relatórios \ Operacionais \ Folha de Pagamento de Benefícios
Descrição: Inclusão do campo CPF do recebedor no relatório.
Pendência: 16970
Tela: Prévia Normal
Usar a parametrização contábil individual por benefício na Prévia Normal.
Pendência: 16980
Tela: Prévia Normal
Elimina a prévia vinculada ao lote, mesmo que não existam registros neste lote a processar. 
Isto possibilita, no caso de execução de previa individual, a eliminação dos registros da prévia 
para pessoas que saíram da folha e já haviam sido processadas.
Pendência: 16981
Tela: CONSULTA DE PREVIA DE PAGAMENTO
Ajustar a consulta que busca lista de recebedores, pois está duplicando registros 
quando o beneficiário migrou de plano previdenciário.
Pendência: 16982
Tela: ASSOCIAÇÃO DE RUBRICAS POR PLANO
Para as rubricas de provento e com obrigatoriedade de indicação de favorecido, não está habilitado 
o combo de Contas Caixas x Forma de Pagamento.
Pendência: 16990
Tela: Prévia Normal
Gravar a informação flgespecial da rubrica na tabela Previa.
Pendência: 16993
Tela: Cadastro de Ação Judicial
Não está permitindo desativar uma regra vinculada a ação judicial.
Pendência: 16994
Tela: Cadastro de Ação Judicial
Se após procurar uma matrícula na operação de inclusão se cancelar pressionando o botão SAIR aparece 
uma mensagem de erro.
Pendência: 16995
Tela: Prévia Normal
Ajuste no valor da base total de suplementação para passar o valor bruto para IR na execução
das regras de ação judicial.
Pendência: 17000
Tela: Prévia Normal
Criação de estrutura para avaliação dos parâmetros contábeis e financeiro
das rubricas na fase da Prévia.
Pendência: 17002
Tela: Relatório de Depósito Bancário da Folha de Benefícios
Inclusão da matrícula de dependente.
Pendência: 17003
Tela: Relatório de Resumo de Rubricas
Quebra do relatório por plano contábil ao invés do plano previdenciário.
Pendência: 17004
Tela: Cadastro de Banco / Contas Caixas x Forma de Pagamento
Atribuição de um favorecido na associação de banco e contas caixas x forma de pagamento
para a geração do documento a pagar.
Pendência: 17005
Tela: Cadastro Manual de Histórico de Benenfícios
Alteração da forma de seleção das informações dos beneficiários para incluir
o plano previdenciário origem.
Pendência: 17006
Tela: Cadastro de layout de arquivo de entrada das entidades
Inclusão de parametrização para criticar na importação de arquivo, a existência
de vinculação da rubrica a entidade, no cadastro de rubrica e conta bancária de favorecido.
Inclusão de parâmetros default para utilização na tela de importação.
Pendência: 17007
Tela: Cadastro de lista de recebedor
Na importação de matrículas, exibir as que não foram importadas.
Pendência: 17008
Tela: Cadastro / Associação de Rubricas e Conta Bancária de Favorecido
Inclusão de percentual e regra defaults e definição de quantidade máxima de
rubricas a serem incluídas na importação de arquivo de entidades.
Pendência: 17010
Tela: Cadastro de Rubricas Individuais
Ajuste na exibição das rubricas pelo estado desta no cadastro de Rubricas.
Grava número do processo do INSS para pensão alimentícia vinculada.
Se existir vinculação da rubrica com um favorecido, na inclusão associa automaticamente.
Pendência: 17011
Tela: Cadastro manual de lançamentos para a folha de benefícios
Obtém dados pela matrícula de dependente. Exibe código externo.
Filtro apenas de lançamentos para a Folha de Benefícios.
Pendência: 17012
Tela: Consulta Histórico de Pagamento
Ajuste para obter informações pela matrícula de dependente.
Pendência: 17014
Tela: Exportação de arquivo para entidades
Ajuste na obtenção dos registros processados da Histrubsal e dos registros
não processados pela tmpdesc.
Pendência: 17015
Tela: Relatório de Rubricas
Exibição do código externo das rubricas.
Pendência: 16620
Tela: Folha Extra
Na folha extra não está sendo gravado o idplanocontabil da prévia,
caso não tenha nada gravado na tabela benefbfciario.
Pendência: 17016
Tela: Geração de arquivo bancário de pagamento
Incluir a matrícula e identificador do titular e do recebedor no campo de observação.
Pendência: 17018
Tela: Geração de arquivo bancário da prévia de pagamento
Incluir a matrícula e identificador do titular e do recebedor no campo de observação.
Alteração para usar objeto em 3 camadas.
Pendência: 16498
Tela: Preparo (Reajuste de Benefício)
No caso dos benefícios provisórios o reajuste deve aplicar o percentual
provisório no resultado das regras de Valor do Benefício.
Pendência: 17020
Tela: Preparo (Reajuste de Benefício)
Inclusão de campos para regras de reajuste de benefício de INSS.
Reajuste do valor calculado do INSS.
Pendência: 17021
Tela: Desfazer preparo
Ajuste para desfazer valor calculado reajustado do benefício de INSS.
Pendência: 17022
Tela: Prévia Normal
Envio de contribuição para tmpdesc na previa normal.
Pendência: 17023
Tela: Prévia Normal
Na definição do portador forma da Previa tratar a forma de pagamento de patrocinadora.
Pendência: 17025
Tela: Prévia Normal
Ajuste na consulta que identifica duplicidade de lotes,
para consolidação dos mesmos, antes da execução da prévia.
Pendência: 17073
Tela: Prévia Normal
Otimização da Prévia Normal. Incorporação na consulta princiapl de consultas individuais para obtenção de fatores na BenefPlanoPart, da identificação da nacionalidade do endereço e nos valores da compensação de IR Judicial.
================================================================================
CM$VER      3.04.11s    23/06/2004
--------------------------------------------------------------------------------
Pendência : 15135
Tela : Sistema / Utilitários / Contra Cheque Trimestral
Descrição : Mostrar no contra cheque a conta que está como preferencial no momento da geração do mesmo.
================================================================================
CM$VER      3.04.11r    22/06/2004
--------------------------------------------------------------------------------
Pendência : 16920
Tela : Cadastros / Rubricas Individuais
Descrição : Torna-se possível agora, habilitar a tela de outras rubricas também para Tutor Responsável.
================================================================================
CM$VER      3.04.11q    15/06/2004
--------------------------------------------------------------------------------
Pendência : 16999
Tela : Importação de Convênio
Descrição : Foi acertado a importação de convênios sem o tipo de natureza escolhido.
================================================================================
CM$VER      3.04.11n    04/06/2004
--------------------------------------------------------------------------------
Pendência : 16925
Tela : Contabilização da Folha
Descrição : Alguns lançamentos contábeis realizados na efetivação de uma versão de 
pagamento não estão corretos. Nos lançamentos referentes às contas de líquido 
os valores atribuídos por Plano e Patro não fecham com os valores da contra partida, 
contas de despesas e repasses. Isto foi observado no fechamento por Plano e Patro 
disponível no módulo de contabilidade (Regra de Prova 0).
================================================================================
CM$VER      3.04.11m    03/06/2004
--------------------------------------------------------------------------------
Pendência : 16902
Tela : Cálculos da Folha \ Definitiva
Descrição : Não estava sendo informado o número da planilha para alterar o registro do lançamento do documento do pagamento efetivado.
Pendência : 16917
Tela : Cálculos da Folha \ Prévia \ Folha Normal
Descrição : O parâmetro "Incide sobre Abono", não estava sendo considerado na prévia.
================================================================================
CM$VER      3.04.11h    25/05/2004
--------------------------------------------------------------------------------
Pendência : 16512
Tela : Consultas/Relatórios/Folha de Benefícios/Analíticos/Ficha Financeira por Versão
Descrição : O campo que mostra o valor da rubrica informativa estava saindo sempre em branco.
================================================================================
CM$VER      3.04.11g    12/05/2004
--------------------------------------------------------------------------------
Pendência : 14867
Tela : Calculo da Folha
Descrição : Implementação para executar a regra de benefícios mínimo sobre o abono anual calculado no  encerramento de benefício, no Preparo e não mais na Prévia.
Pendência : 16694
Tela : Cálculos da Folha/Prévia/Folha Extra
Descrição : Gravação do idplanoorigem na Prévia de Folha Extra. 
Pendência : 16771
Tela : Sistema/Utilitários/Contra-cheque Trimestral
Descrição : Ajuste na consulta para emissão de contracheque de consignatária de pensão alimentícia que havia  sido participante da REFER.
================================================================================
CM$VER      3.04.11f    12/05/2004
--------------------------------------------------------------------------------
Pendência : 16512
Tela : Consultas/Relatórios/Folha de Benefícios/Analíticos/Ficha Financeira por Versão
Descrição : Pendência reaberta. Consulta foi alterada para relfetir a mesma situação da tela de consulta de 
pagamentos da Folha no caso de rubricas informativas.
Pendência : 16746
Tela : Sistema/Utilitários/Contra-cheque Trimestral
Descrição : Ajuste no layout do contracheque quadrimestral.
================================================================================
CM$VER      3.04.11e    06/05/2004
--------------------------------------------------------------------------------
Pendência : 16163
Tela : Prévia de Pagamento Pendente
Descrição : Não gerou IR na liberação de pagamento pendente. [CM] Foram realizados testes e o IR foi calculado corretamente. Foi criada uma parametrização para permitir que o IR não seja recalculado, utilizando o valor original das versões que estão sendo liberadas. Foi feito ajuste na contabilização da diferença entre o novo IR e o IR original.
Pendência : 16194
Tela : Prévia Normal
Descrição : Apesar da prioridade de desconto do IMPOSTO DE RENDA ser menor que a de DEVOLUÇÃO DE BENEFÍCIOS, não obedeceu a prioridade. ou seja cobrou a devolução e o Imposto caiu em resíduo. Agora a prioridade da rubrica prevalece sobre a devolução de benefícios.
Pendência : 16679
Tela : Contracheque Padrão
Descrição : Efetuar o agrupamento de rubricas, independente do mês de referência. Foi criada uma parametrização no cadastro de rubricas que define quais rubricas serão agrupadas.
Pendência : 16705
Tela : Estorno
Descrição : A conta de baixa de documentos gerados no estorno está errada. [CM] Não se utiliza mais a conta do documento original. Se utiliza agora a conta de líquido vinculada a pessoa que está sendo estornada.
================================================================================
CM$VER      3.04.11d    06/05/2004
--------------------------------------------------------------------------------
Pendência : 16730
Tela : Prévia de Pagamentos Pendentes
Descrição : Apresenta mensagem de previa não executada. Efetuada correção no controle de mensagem de erro.
================================================================================
CM$VER      3.04.11c    28/04/2004
--------------------------------------------------------------------------------
Pendência : 16196
Tela : Cálculos da Folha/Prévia/Folha Extra
Descrição : A efetivação de Folha Extra, não está jogando o CODIRRFDARF na HISTRUBSAL.
Pendência : 16511
Tela : Consultas/Relatórios/Folha de Benefícios/Analíticos/Ficha Financeira por Versão
Descrição : O Resumo da Ficha Financeira por Versão está duplicado, para algumas matrículas, conforme anexos das matrículas 84343-01 (pensionista) e 143412-00 (aposentada).
Pendência : 16512
Tela : Consultas/Relatórios/Folha de Benefícios/Analíticos/Ficha Financeira por Versão
Descrição : A ficha financeira por versão não está demonstrando os dependentes em todos os meses . 
O primeiro anexo é o relatório da ficha por versão, onde em alguns meses não aparecem as rubricas de dependentes (24513 e 25577) e o segundo é o da ficha por mês (Analíticos/Ficha Financeira por Mês), na ficha financeira por mês, as rubricas de dependentes aparece em todos os meses corretamente. Obs.: ambos os anexos são da matrícula  165647-00, correspondente ao período de jan ao 13.º de 2003.
Pendência : 16513
Tela : Consultas/Relatórios/Folha de Benefícios/Analíticos/Ficha Financeira por Versão 
Descrição : Inserir o filtro = "Imprimir para Arquivo" na opção de Impressão.
Pendência : 16514
Tela : Consultas/Relatórios/Folha de Benefícios/Analíticos/Ficha Financeira por Mês e por Versão
Descrição : As fichas financeiras por Versão e por Mês, estão com problemas na última página, chamada de Resumo da Ficha Financeira, onde, para:
- no ano de 2002, as rubricas 3662 e 3672 não estão sendo computadas para o resumo.
- do ano de 2001 para trás, o Resumo está em branco.
Pendência : 16515
Tela : Consultas/Relatórios/Folha de Benefícios/Analíticos/Ficha Financeira por Mês e por Versão
Descrição : A maioria dos pagamentos efetuados de reservas de poupança e de resgates não tem ficha financeira, identificamos que aqueles que tiveram outro tipo de pagamento (auxílio doença) tem os seus valores de reserva nas fichas financeiras. Também temos participantes que optam por receber de forma parcelada, como é o caso da matrícula 169136-00.  Todos os pagamentos efetuados pelo Módulo, devem ter ficha financeira.
================================================================================
CM$VER      3.04.10s    16/04/2004
--------------------------------------------------------------------------------
Pendência : 16569
Tela : Cálculos da Folha/Prévia/Normal
Descrição : A folha Normal de Reservas dos planos Alternativo e Fundador está gravando duas rubricas de dedução de dependentes, a antiga 24513 (que é utilizada para os Aposentados) e a nova 25602.
Pela nova instrução da CM, a folha deveria gravar apenas a rubrica 25602.
================================================================================
CM$VER      3.04.10r    15/04/2004
--------------------------------------------------------------------------------
Pendência : 16580
Tela : Cálculos da Folha/Prévia/Folha Extra
Descrição : O processamento da folha extra, não está gravando automaticamente os dados do pagamento na Consultas/Prévia de Pagamento da Folha, ou seja estamos tendo que efetivar as folhas extras sem poder consultar a prévia. Exemplo de versão efetivada e que não tem prévia: 724.
Pendência : 16502
Tela : Sistema/Utilitários/ContraCheque
Descrição : Não estava sendo possível escolher um recebedor que tivesse migrado de plano.
================================================================================
CM$VER      3.04.10q    12/04/2004
--------------------------------------------------------------------------------
Pendência : 16564
Tela : Consultas / Demonstrativo de Pagamento
Descrição : Utilizar o campo CodEstado da tabela Estado e não da tabela EndPess.
================================================================================
CM$VER      3.04.10p    07/04/2004
--------------------------------------------------------------------------------
Pendência : 16519
Tela : ContraCheque Trimestral
Descrição : Ajeitar o layout para contracheque trimestral individual.
================================================================================
CM$VER      3.04.10o    01/04/2004
--------------------------------------------------------------------------------
Pendência : 16471
Tela : Estorno
Descrição : Ao tentar fazer um estorno individual do tipo "novo contas a pagar", é mostrada a mensagem de erro "Erro ao criar controle do novo documento." e logo em seguida outra mensagem "ESTORNO INDIVIDUAL INTERROMPIDO POR ERRO"
================================================================================
CM$VER      3.04.10l    10/03/2004
--------------------------------------------------------------------------------
ALTEROU A INCLUSÃO DA TABELA HSTFOLHABENEFCAP NA PRÉVIA
================================================================================
CM$VER      3.04.10i    20/02/2004
--------------------------------------------------------------------------------
Acerto na cobrança de Contribuição
================================================================================
CM$VER      3.04.10h    16/02/2004
--------------------------------------------------------------------------------
Acerto na geração das contas preferenciais.
================================================================================
CM$VER      3.04.10g    04/02/2004
--------------------------------------------------------------------------------
Pendência
15135         - FrmContraChequeTrimentral - O sistema vai passa a sempre imprimir, o banco 
                  e conta bancária referente ao pagamento .
15527          - DFolhaPrevia - Na inclusão de Rubrica de IRR de ação Judícial,
                     passou a mover para o campo VALORINFO  a base de Calculo.
15933          - FconsultaPrevia - Acerto nos joins da query  qrypreparo.
15932          - FparamRelFicha - Foi criado um novo MontaSelect, com uma nova 
                         query.
                  - FpRelFichaFinancIndiv - Foi criado um novo montaSelect, com     
                    uma nova query        
15107         - Ffolhaextra -  Foi criado , quando o botão do processamento estiver ativo, na
                     saída do programa e na pesquisa do participante, a pergunta: 
                     "Deseja Continuar"        
================================================================================
CM$VER      3.04.10f    30/01/2004
--------------------------------------------------------------------------------
Pendência : 15568 
A Folha de Benefício passou a  cobrar as contribuições de patrocinadora referente aos
participante assistidos
Pendência : 15053
 Foi criado a opcão solicitar as pessoa estornadas.
Pendência : 15954
O programa FimprtaTxT,  passou a pegar o último número da ordem do lote a ser
processado. 
Pendência : 15948
O sistema passou a permitir associar,para o mesmo banco, um portador    forma
   para cada tipo de folha    
================================================================================
CM$VER      3.04.09e    19/12/2003
--------------------------------------------------------------------------------
Referente a pendência 12574.
Foi retirada algumas  linhas em branco do relatório, e os testes após a alteração
não apresentaram  erros.
================================================================================
CM$VER      3.04.08d    15/12/2003
--------------------------------------------------------------------------------
Acerto no preparo para a folha de abono da FCRT
================================================================================
CM$VER      3.04.07c    12/12/2003
--------------------------------------------------------------------------------
Alteração solicitado pela Paulo Ramos, de tratamento de retorno de reajuste
  , referente a pendência 
================================================================================
CM$VER      3.04.06b    10/12/2003
--------------------------------------------------------------------------------
Acerto das pendencias 15776 e 15777. 
Acertos referentes a colocação dos campos nos SQLs de entrada de regras : 
VALORNOLOTE, INSSLOTE,VALORASSOCCOB,DATAINICIOANT referentes a informações para cálculos de contribuições e benefícios associados aos assistidos.
================================================================================
CM$VER      3.04.05a    08/12/2003
--------------------------------------------------------------------------------
Resolução da Pendência Nº 15578
  > Calculos da Folha/Definitiva
  Parametrizei para a rubrica de informação do valor a deduzir por dependente não aparecer no contracheque, no entanto, continuou a ser gravado no arquivo.
================================================================================
CM$VER      3.04.05     04/12/2003
--------------------------------------------------------------------------------
Resolução da Pendência Nº 14973
  > RELATÓRIOS /BENFÍCIOS/ENTRADAS E SAIDAS
================================================================================
CM$VER      3.04.03j    04/12/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14973
  > RELATÓRIOS /BENFÍCIOS/ENTRADAS E SAIDAS
  
================================================================================
CM$VER      3.04.02k    28/11/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15555
  > Tela\Opçao No Sistema: Sistema/Configuração/Parametros/Previa/Imposto de Renda
  Criar parametrização para a rubrica Informativa de Nº de dependentes de IR para a Folha de Abono.
- Resolução da Pendência Nº 15556
  > Tela\Opçao No Sistema: Sistema/Configuração/Parametros/Previa/Pensão Alimentícia
  Criar parametrização para a rubrica de Desconto de Pensão Alimentícia para a Folha de Abono.
- Resolução da Pendência Nº 15557
  > Tela\Opçao No Sistema: Sistema/Configuração/Parametros/Previa/Pensão Alimentícia
  Criar parametrização para a rubrica de Provento de Pensão Alimentícia para a Folha de Abono.
- Resolução da Pendência Nº 15558
  > Tela\Opçao No Sistema: Cálculos da Folha / Prévia / Normal
  Customizar o processo de geração da Folha de Abono para passar a utilizar as rubricas de Nº de Dependentes de IRRF Abono, Provento de PA Abono e Desconto de PA Abono , ao inves de utilizar as da Folha Normal.
- Resolução da Pendência Nº 14975
  > Tela\Opçao No Sistema: Consultas / Relatórios / Relação de Rendas Alteradas
  Incluir no relatório em anexo, mais dois filtros.
    1 - Comparar pelo valor bruto ( hoje esta comparando pelo valor liquido)
    2 - Filtrar por tipo de beneficio
================================================================================
CM$VER      3.04.02j    31/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15540
  > Tela\Opçao No Sistema: Estorno
  No estorno, ao fazer um estorno individual de folha extra, o idlote não está sendo passado para a query que busca os dados do lote na ctrlinterface.
================================================================================
CM$VER      3.04.02i    27/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15496
  > Tela\Opçao No Sistema: CONSULTA/RELATÓRIOS/FOLHA DE BENEFÍCIOS / BENEFÍCIOS/ ENTRADAS/SAÍDAS
  O relatório pela PRÉVIA, nas colunas Valor Bruto e Valor Líquido, estão constando apenas o valor da última competência que está sendo paga, ao invés de, na coluna do Valor bruto constar o somatório dos valores brutos mensais (total de proventos) e na coluna do valor líquido o somatório dos valores líquidos que estão sendo pagos ao participante.
Ver: folha de auxílio doença, lotes 6648 e 6686
================================================================================
CM$VER      3.04.02h    15/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15012
  > Tela\Opçao No Sistema: Calculos da Folha/Estornos
  Fizemos um estorno mudando a forma de pagamento (tipo 25), só que
tivemos que estorná-lo novamente com o mesmo tipo(25). Devido a chave ser
igual deu erro. Talvés se criasse um sequecial  que fizesse parte da
chave...   
ORA-00001: unique constraint (CM.XPKMOTIVOESTORNOFB) violated 
INSERT INTO MOTIVOESTORNOFB (IDHSTFOLHABENEF, IDPESSJUR, IDPLANOPREV,
IDTITULAR, IDRECEBEDOR, TIPOESTORNO, DATAESTORNO, IDUSUARIO, MOTIVO) VALUES
(10256,2002,6,48906,7501,25,TO_DATE('10/09/2003','DD/MM/YYYY'),40007,'libera
ção de pagamento')
================================================================================
CM$VER      3.04.02g    09/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15191
  > Tela\Opçao No Sistema: Relatório de ficha financeira por versão
  O valor do rateio está sendo sobreposto ao título do campo e o rodapé da página está sendo impresso sobreposto todo à esquerda
================================================================================
CM$VER      3.04.02f    09/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15092
  > Tela\Opçao No Sistema: Cadastro / Manual de lançamento da folha de benefício
  Não está sendo gravando a inclusão de novo registro.
================================================================================
CM$VER      3.04.02e    22/09/2003
--------------------------------------------------------------------------------
Alteração no estorno para permitir estornar um consignatário de um titular já estornado.
================================================================================
CM$VER      3.04.02d    19/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15064
  > Tela\Opçao No Sistema: Estorno de folha extra
  Ao tentar estornar Folha extra, o sistema procura o registro na Hstbenefbfciario
================================================================================
CM$VER      3.04.02c    10/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15002
  > Tela\Opçao No Sistema: Efetivação da folha
  Erro no processamento de efetivação da folha ao buscar o campo IDPLANOORIGEM na query principal.
================================================================================
CM$VER      3.04.02b    08/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14989
  > Tela\Opçao No Sistema: Cadastro/Rubricas individuais(Pensão alimentícias)
  Nesta versão o sistema deixou de habilitar o combo onde escolhemos a Forma de Pagamento. 
================================================================================
CM$VER      3.04.02a    05/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14979
  > Tela\Opçao No Sistema: Relatório de entradas e saídas de benefícios
  Quando é selecionado a opção "Só saída" a data final prevista está vindo nula, apesar de constar na base. Quando é selecionado a opção "Ambos" a data final prevista está vindo indevida.
================================================================================
CM$VER      3.04.02     01/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14949
  > Tela\Opçao No Sistema: Prévia Normal
  Exibe o SQL passado para a regra em caso de algum erro.
- Resolução da Pendência Nº 14947
  > Tela\Opçao No Sistema: Efetivação
  Gravar o campo IDPLANOORIGEM na tabela Histrubsal.
- Resolução da Pendência Nº 14946
  > Tela\Opçao No Sistema: Prévia Normal
  Gravar o campo IDPLANOORIGEM na tabela Previa.
- Resolução da Pendência Nº 14945
  > Tela\Opçao No Sistema: Prévia Normal
  Considerar, no cálculo da CPMF sobre INSS, o valor do IR sobre o INSS e apenas para valores maiores do que R$2.400,00.
- Resolução da Pendência Nº 14852
  > Tela\Opçao No Sistema: Previa / Desfazer Preparo
  Desfazer contribuição de nucleo familiar.
- Resolução da Pendência Nº 14840
  > Tela\Opçao No Sistema: Preparo de Manutenção
  A contribuição de pensionistas não está sendo calculada.
- Resolução da Pendência Nº 13995
  > Tela\Opçao No Sistema: Utilizar tabela de IRRF com datas de vigência
  Após a conclusão da pendência 8533, utilizar a tabela de alíquotas de IR por faixa de vigência.
================================================================================
CM$VER      3.04.01a    11/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14811
  > Tela\Opçao No Sistema: Calculo da Folha
  Esta contabilização indevidamente as contribuições devolvidas atraves da Folha.
 
- Resolução da Pendência Nº 14809
  > Tela\Opçao No Sistema: Calculo da Folha
  Os pagamentos oriundos do sistema FOLHA DE BENEFÍCIOS que são encaminhados para o CONTAS A PAGAR, ou seja, não é arquivo eletrônico e sim pagamento através de ficha financeira de pagamento, o campo FORMA DE PAGAMENTO do sistema contas a pagar não está sendo preenchido e conforme solicitação da Tesouraria, é necessário o mesmo. 
- Resolução da Pendência Nº 14808
  > Tela\Opçao No Sistema: Calculo da Folha/Estorno
  Deu baixa hstbenefbfciario sem pagamento. idmotivo = 1
- Resolução da Pendência Nº 14762
  > Tela\Opçao No Sistema: Consultas/Relatórios/Folha de Benefícios/Benefícios/Entradas e Saídas (Nº 2044)
  Incluir uma coluna = DATA FINAL PREVISTA
================================================================================
CM$VER      3.04.01     08/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14816
  > Tela\Opçao No Sistema: Consulta/Consulta Geral de Pessoa/Contra-cheque
  Acrescentar na query que identifica as Folhas, no order by o campo HST.DATAPAGAMENTO DESC
- Resolução da Pendência Nº 14807
  > Tela\Opçao No Sistema: Estorno
  Temos Alguns casos que foram rejeitados, ao efetuarmos o estorno sempre escolhemos , dos dois pagamentos que o participante tem, apenas o registro rejeitado (O outro foi depositado corretamente), acontece que o sistema estornou os dois pagamentos, pelo menos eles estão aparecendo na relação de pagamentos pendentes à processar prévia.Favor verificar com urgência para evitarmos problemas no balancete 07/2003. 
- Resolução da Pendência Nº 14798
  > Tela\Opçao No Sistema: Cálculo da Folha/Prévia
  Após efetuar a concessão de um benefício de CD - Auxílio doença no Admprev, tentamos gerar no módulo Folha a prévia para o lote 5831 e não conseguimos. Para auxiliar, enviamos em anexo, cópia do resumo da prévia informando que não processou nenhuma rubrica por não ter identificado ninguém. 
- Resolução da Pendência Nº 14797
  > Tela\Opçao No Sistema: Geração de Arquivo
  Erro na gravação Histrubsal no momento da efetivação devido alteração bancária após processamento da prévia e antes da efetivação. O sistema não alterou o Portador Forma de acordo com o novo banco. Conclusão: Gerou pagamento em um banco com conta de outro e o associado.
- Resolução da Pendência Nº 14796
  > Tela\Opçao No Sistema: Consulta/Consulta Geral de Pessoa/Vida no Plano/Benefícios/Pagamentos/Contra-cheques
  O numero de dependentes informado deve ser aquele utilizado para processar a Folha e não o atual. Para a finalidade em questão,deve busca o campo NUMDEPIRRF na tabela HISTRUBSAL, da forma como esta o NUMDEPIRRF não esta coerente com o valor deduzido.
- Resolução da Pendência Nº 14792
  > Tela\Opçao No Sistema: Consulta Previa
  Alteração nas consultas de matricula e inscrição para tratar duplicidade de matricula ou inscricao.
- Resolução da Pendência Nº 14791
  > Tela\Opçao No Sistema: Cadastro de Rubrica Individual
  Ordenar o detalhe da tela pelo sequencial de rubrica.
- Resolução da Pendência Nº 14787
  > Tela\Opçao No Sistema: Efetivação
  Como a migração do REB 2002 está sob liminar, deve o plano de origem para efeito de contabilização dos benefícios migrados. Colocar um parâmetro de data limite no programa FUNCEF.
- Resolução da Pendência Nº 14786
  > Tela\Opçao No Sistema: Efetivação
  Caso se identifique um erro na validação de um arquivo eletrônico, sendo que neste momento o sistema emite uma mensagem de alerta, deve-se continuar o processamento normalmente gravando todos os registros necessários a baixa do documento e futura geração manual dos arquivos. Isto ocorreu com portador do Bradesco que estava parametrizado para enviar aviso de pagamento e existiam pessoas sem o bairro no endereço.
- Resolução da Pendência Nº 14782
  > Tela\Opçao No Sistema: Geração de Arquivo
  O numero do documento de forma que ele seja único para cada registro, pois quando o associado recebe benefícios de pessoas diferentes (por exemplo, um benefício próprio e uma pensão), passa a ter dois ou mais documentos de pagamentos com o mesmo número (idpessoa). Uma sugestão seria usar o idpessoa e o idtitular.
- Resolução da Pendência Nº 14771
  > Tela\Opçao No Sistema: CALCULOS DA FOLHA / PRÉVIA / NORMAL
  Incluir na query de entrada da regra de cálculo das rubricas individuais, o campo CODFONTEPAGADORA da tabela PROVDESC, para que se possa identificar se a PA no momento do cálculo é do INSS ou da Fundação.
- Resolução da Pendência Nº 14554
  > Tela\Opçao No Sistema: Processamento da Folha de Manutenção
  Sempre efetivamos folha de benefícios para pagamento no decorrer do mês, ou seja, não são folhas de manutenção, consequentemente a maioria dos participantes que constam nessas folha no decorrer do mês , farão parte da folha de manutenção no último dia útil, sendo assim, solicito implementação para que quando do processamento da folha de manutenção, o sistema identifique valores já pagos no mês para que os mesmos sejam somados a fim de calcular a base de cálculo do IRRF do mês. 
- Resolução da Pendência Nº 10478
  > Tela\Opçao No Sistema: ESTORNO
  Permitir um estorno por pagamento indevido, de um pagamento já em alguma outra situação de estorno.
================================================================================
CM$VER      3.04.00d    01/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14768
  > Tela\Opçao No Sistema: Relatório / Informações de Pagamento de Convêncio
  Ao abrir a tela de parâmetro aparece uma mensagem de erro.
  Ao executar o relatório de importações de convênios, o erro em anexo é mostrado Ao que parece o campo MESREFERENCIA não está sendo buscado pela query. Não sei se deveria ser buscado ou o sistema está tentado pegar MESREFERENCIA no lugar de MESCOBRANCA.
  O erro ocorre quando eu marco as seguintes opções:
  TIPO DE RELATORIO: Convênios Processados
  ORIGEM: Histórico
  TIPO DE REGISTRO: Processados
  RELAÇÃO DE LAYOUTS / DESCONTOS: Associação dos Aposentados
  RUBRICAS: 4096 - Associação dos Aposentados
  ANO / MÊS COBRANÇA: 2003/ Julho
  VERSÃO DA FOLHA: 2459 - FECHAMENTO
  Acredito que o erro esteja na opção ORIGEM, pois quando eu gero com a ORIGEM: Previa não dá erro.
================================================================================
CM$VER      3.04.00c    30/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14757
  > Tela\Opçao No Sistema: Parâmetros
  Ao abrir a tela de parâmetro aparece uma mensagem de erro.
================================================================================
CM$VER      3.04.00b    30/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14748
  > Tela\Opçao No Sistema: Efetivação
  Ao digitar um numero no campo data pagamento efetivo (programado) aparece tela de erro.
- Resolução da Pendência Nº 14747
  > Tela\Opçao No Sistema: Cadastro de Rubricas
  Apresentava erro na abertura da consulta de grupo de rubricas e estrutura de cálculo.
- Resolução da Pendência Nº 14746
  > Tela\Opçao No Sistema: Todas
  Trocar parametro de agrupa rubrica antigo pelo novo.
================================================================================
CM$VER      3.04.00a    28/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14727
  > Tela\Opçao No Sistema: Consulta de Histórico de Pagamentos
  Apresenta erro na consulta por inscrição.
- Resolução da Pendência Nº 14244
  > Tela\Opçao No Sistema: Efetivação
  Alterar verificação das estruturas centro de custo e centro de responsabilidade na Efetivação da Folha, para exibir mensagem de erro caso os valores parametrizados estejam inativos.
================================================================================
CM$VER      3.04.00     28/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14602
  > Tela\Opçao No Sistema: Folha Extra
  Adaptação para Multi fundação.
- Resolução da Pendência Nº 14601
  > Tela\Opçao No Sistema: Reajuste de Rubricas Individuais
  Adaptação para Multi fundação.
- Resolução da Pendência Nº 14600
  > Tela\Opçao No Sistema: Atualização de Pensão Alimentícia por Beneficiários
  Adaptação para Multi fundação.
- Resolução da Pendência Nº 14543
  > Tela\Opçao No Sistema: Parâmetros de Sistema
  Adaptação para multi fundacao.
- Resolução da Pendência Nº 14536
  > Tela\Opçao No Sistema: Cadastro de Rubricas Individuais
  Adaptar para multi fundacao.
- Resolução da Pendência Nº 14535
  > Tela\Opçao No Sistema: Cadastro de Grupo de Rubricas
  Adaptar para multi fundacao.
- Resolução da Pendência Nº 14534
  > Tela\Opçao No Sistema: Cadastro de Rubricas Salariais
  Adaptar para multi fundacao.
- Resolução da Pendência Nº 14529
  > Tela\Opçao No Sistema: Relatório de Ficha Financeira por Versão
  Adaptar para multi fundacao.
- Resolução da Pendência Nº 14528
  > Tela\Opçao No Sistema: Relatório de Ficha Financeira Mensal
  Adaptar para multi fundacao.
- Resolução da Pendência Nº 14526
  > Tela\Opçao No Sistema: Relatório de Valor Líquido em Determinada Faixa
  Adaptar para multi fundação.
- Resolução da Pendência Nº 14519
  > Tela\Opçao No Sistema: Relatório de Resumo de Rubricas
  Adaptar para multi fundação.
- Resolução da Pendência Nº 14515
  > Tela\Opçao No Sistema: Principal
  Alterar os nomes: fundação, plano e patrocinadora para se adequar a nomenclatura de Estados e Municípios.
- Resolução da Pendência Nº 14514
  > Tela\Opçao No Sistema: Consulta Histórico de Pagamento
  Adaptar para Multifundação.
- Resolução da Pendência Nº 14491
  > Tela\Opçao No Sistema: Visão Gerencial da Folha
  Adaptar para multi fundação.
- Resolução da Pendência Nº 14490
  > Tela\Opçao No Sistema: Consulta Benefício Preparado
  Adaptar para multi fundação.
- Resolução da Pendência Nº 14489
  > Tela\Opçao No Sistema: Consulta Prévia
  Adaptação para multi fundação.
- Resolução da Pendência Nº 14488
  > Tela\Opçao No Sistema: Crédito de Beneficiários por Banco e Agência
  Adaptar para multi fundação.
- Resolução da Pendência Nº 14487
  > Tela\Opçao No Sistema: Folha de Pagamento de Benefícios
  Adaptar para multi-fundação.
- Resolução da Pendência Nº 14486
  > Tela\Opçao No Sistema: Relatório Estatístico de Participantes por Benefício
  Adaptar para multi-fundação
- Resolução da Pendência Nº 14485
  > Tela\Opçao No Sistema: Relatório Histórico de Benefícios Pagos - Analíticos
  Adaptar para multi-fundação
- Resolução da Pendência Nº 14473
  > Tela\Opçao No Sistema: Cadastro de Banco x Contas / Caixas x Forma de Pagamento
  Adaptação para Multifundação.
- Resolução da Pendência Nº 14443
  > Tela\Opçao No Sistema: Funções Internas
  Alterações em rotinas internas para adaptar a Multi-fundação.
- Resolução da Pendência Nº 14441
  > Tela\Opçao No Sistema: Efetivação
  Adaptar a Efetivação para Multi-fundação.
================================================================================
CM$VER      3.03.07t    30/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14742
  > Tela\Opçao No Sistema: Prévia Normal
  O IRRF não está sendo calculado corretamente quando existem lançamentos de rubrica individual de provento.
================================================================================
CM$VER      3.03.07s    30/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14738
  > Tela\Opçao No Sistema: Previa Normal
  Não utilizar parâmetro de agrupamento de rubricas na consulta geral da Prévia.
- Resolução da Pendência Nº 14737
  > Tela\Opçao No Sistema: Efetivação
  Na verificação de prévia contra histórico de benefícios deve-se considerar apenas as rubricas de provento na Prévia.
- Resolução da Pendência Nº 14736
  > Tela\Opçao No Sistema: Consulta da Previa
  Não exibe rubricas informativas. Não agrupava corretamente quando o parâmetro Agrupa está marcado.
- Resolução da Pendência Nº 14735
  > Tela\Opçao No Sistema: Prévia
  Rubricas de provento oriundas da Tmpdesc e da Rubrica Individual devem utilizar o código da natureza de rendimento que consta na tabela de rubricas (PROVDESC).
================================================================================
CM$VER      3.03.07r    24/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14583
  > Tela\Opçao No Sistema: Consulta / Relatórios / Operacionais / Folha de Pagamento de Benefícios
  Inclusão dos campos referentes às informações de IR total – FLGSOMASUPINSS (s/n) e indicação de depósito judicial - FLGFAZDEPOSITO (s/n) na query que alimenta o relatório da folha 
================================================================================
CM$VER      3.03.07q    21/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14622
  > Tela\Opçao No Sistema: Preparo
  No preparo individual o processo de cancelamento automático de dependentes (execução da regra de elegibilidade), está sendo executado para todas as pessoas.
================================================================================
CM$VER      3.03.07p    18/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14614
  > Tela\Opçao No Sistema: Prévia Normal
  Não está saindo o arredondamento de conta salário.
================================================================================
CM$VER      3.03.07o    17/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14500
  > Tela\Opçao No Sistema: Baixa indevida pela Folha
  Verificar o motivo do sistema ter inserido na hstbenefbfciario o campo VLBENEFPGTO, IDHSTFOLHABENEF para os valores cujo idmotivo = 20 uma vez que não foram pagos na folha de 06/2003 conforme pode observar na histrubsal.
================================================================================
CM$VER      3.03.07n    16/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14577
  > Tela\Opçao No Sistema: Estorno
  No grid de documentos de um recebedor exibir os documentos vinculados ao participante, a qual este recebedor está vinculado. Esta situação só é observável para recebedores que possuem mais de um pagamento, como de aposentadoria e pensão por morte (vinculado a outro participante).
- Resolução da Pendência Nº 12574
  > Tela\Opçao No Sistema: Relatório Ficha Financeira Individual por Versão
  criar relatorio novo de financeira individual por versao. Quebras mes e versao com totalizacao. Colocar resumo ao final como no relatorio atual. Colocar cabecalho com informacoes: matricula, sequencia, %rateio, %proporcao, isencao de IRRF e data de nascimento.
================================================================================
CM$VER      3.03.07m    16/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14562
  > Tela\Opçao No Sistema: Ação Judicial de Imposto de Renda.
  O combo de Regras não está sendo preenchido quando o parametro de associação de rubricas por regra não está selecionado.
- Resolução da Pendência Nº 14553
  > Tela\Opçao No Sistema: Controle de Cobrança de Beneficios Provisórios
  O botão de inserir esta habilitado permanentemente.
================================================================================
CM$VER      3.03.07i    11/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14516
  > Tela\Opçao No Sistema: Previa / Folha extra
  O sistema não está considerando o número de dependentes para o cálculo do Imposto de renda.
================================================================================
CM$VER      3.03.07h    11/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14512
  > Tela\Opçao No Sistema: Folha Extra
  Na tela de folha extra não aparecem participantes que não possuem registros de benefícios.
================================================================================
CM$VER      3.03.07g    11/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14442
  > Tela\Opçao No Sistema: Abertura de Lote
  Correção na consulta de abertura do lote, que apresentava erro.
================================================================================
CM$VER      3.03.07f    10/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14494
  > Tela\Opçao No Sistema: Prévia
  Ajuste na previa para determinação do portadorforma de pagamento para consignatários.
================================================================================
CM$VER      3.03.07e    10/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14483
  > Tela\Opçao No Sistema: Previa 
  A definição do portador forma atribuído na Previa estava colocando pessoas de conta corrente do Banco do Brasil no arquivo padrão (DOC), quando se parametriza para conta corrente da CEF para ser gerado no arquivo de DOC. 
================================================================================
CM$VER      3.03.07d    09/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14477
  > Tela\Opçao No Sistema: Alteração de relatórios
  Não está conseguindo alterar o relatório de segunda via de contra-cheque, pelo menu Sistema / Configuração / Relatórios.
- Resolução da Pendência Nº 14442
  > Tela\Opçao No Sistema: Abertura de Lote
  Adaptar para Multi-fundação.
================================================================================
CM$VER      3.03.07c    09/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14345
  > Tela\Opçao No Sistema: Prévia Normal
  No processamento das rubricas individuais na Prévia, quando existem registros de recálculo de benefício, não está considerando o campo UltMespreparo da Rubrica Individual para lançar os valores de desconto.
================================================================================
CM$VER      3.03.07b    08/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14463
  > Tela\Opçao No Sistema: Prévia Normal
  Tratar quando a rubrica de dedução de dependente para IR na Folha de Abono não está parametrizada.
- Resolução da Pendência Nº 14462
  > Tela\Opçao No Sistema: Prévia Normal
  Tratar no caso de folha de abono e identificação de benefícios retidos que possam ter registros de pagamento na Prévia indevidamente, para exclusão desta previa.
- Resolução da Pendência Nº 14450
  > Tela\Opçao No Sistema: Conferência da Prévia
  Alteração para multifundação.
- Resolução da Pendência Nº 14440
  > Tela\Opçao No Sistema: Prévia Normal
  Adaptar a Prévia Normal para Multi-fundação.
================================================================================
CM$VER      3.03.07a    08/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14446
  > Tela\Opçao No Sistema: Efetivação
  Tratar ausência de plano contábil parametrizado, na abertura da tela. Não usar mais a função LerMensagem.
- Resolução da Pendência Nº 14445
  > Tela\Opçao No Sistema: Conferência da Prévia
  Em alguns tipos de folha a alteração não exibe corretamente as opções e emite uma mensagem de resposta não preenchida indevidamente. 
- Resolução da Pendência Nº 14350
  > Tela\Opçao No Sistema: MULTIFUNDACAO - PREPARO
  Adaptar o preparo para multi-fundação.
================================================================================
CM$VER      3.03.07     02/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14421
  > Tela\Opçao No Sistema: PRINCIPAL
  Alteração da abertura da janela de seleção de multi-fundação.
- Resolução da Pendência Nº 14410
  > Tela\Opçao No Sistema: Prévia Normal
  Gravar informações num.banco, num.agencia e num. conta corrente na tabela Previa.
- Resolução da Pendência Nº 14383
  > Tela\Opçao No Sistema: Desfazer preparo (motivo)
  Abrir a tela com a opção de inclusão de benefício marcada.
- Resolução da Pendência Nº 14382
  > Tela\Opçao No Sistema: Preparo
  Abrir a tela com a opção de inclusão de benefício marcada.
- Resolução da Pendência Nº 14381
  > Tela\Opçao No Sistema: Efetivação
  Alterar a rotina que define o portador forma de pagamento, tanto na previa quanto na efetivação.
- Resolução da Pendência Nº 14377
  > Tela\Opçao No Sistema: Efetivação
  Correção na consulta de verificação de ausência de processamento da previa contra o historico de beneficio.
- Resolução da Pendência Nº 14376
  > Tela\Opçao No Sistema: Previa
  Acerto na rotina de execução da regra de rubricas individuais que apresentava erro na execução de uma segunda Pensão Alimentícia.
- Resolução da Pendência Nº 14375
  > Tela\Opçao No Sistema: Preparo
  Alteração da gravação do da situação de benefício para os benefícios de INSS
- Resolução da Pendência Nº 14374
  > Tela\Opçao No Sistema: Preparo
  Alteração na consulta que obtém a DIBSupl vinculada ao INSS para aceto em join que estava errado.
- Resolução da Pendência Nº 14373
  > Tela\Opçao No Sistema: Preparo
  Inclusão de novos campos na consulta para a regra de reajuste com os dados relativos ao benefício anterior, de forma a efetuar o processamento da regra da mesma forma que na concessão.
- Resolução da Pendência Nº 14348
  > Tela\Opçao No Sistema: Preparo Normal
  No reajuste de benefício de INSS sobre pensão por morte gravar o campo VALORATUAL na Benefbfciario igual ao ValorTotal, quando o benefício de INSS não possua regra de rateio por beneficário do grupo familiar.
- Resolução da Pendência Nº 14347
  > Tela\Opçao No Sistema: Preparo Normal
  No reajuste de INSS quando se precisa recalcular os benefícios de suplementação, passar os valores VLRCALCINSS e VLRINFINSS gravados no Histórico de Benefício do mês.
- Resolução da Pendência Nº 14346
  > Tela\Opçao No Sistema: Preparo Normal
  Na consulta passada para a regra de reajuste de INSS colocar os campos virtuais ORIGEM = 0 e DIBSUPL = 10 espaços em branco.
- Resolução da Pendência Nº 14344
  > Tela\Opçao No Sistema: Preparo Normal
  Reajuste de Beneficio no preparo otimizar a busca do salário de participação no último mês  disponível.
- Resolução da Pendência Nº 14144
  > Tela\Opçao No Sistema: Preparo 
  Alteração na rotina de Encerramento de benefício para efetuar os cálculos de pagamento de dias caso as regras de primeiro e último pagamento de benefícios não estejam parametrizadas.
- Resolução da Pendência Nº 13946
  > Tela\Opçao No Sistema: Acerto de Benefícios Provisórios Anulados 
  Criar funcionalidade para tratar o cancelamento do pagamento de Benefícios Provisórios. 
- Resolução da Pendência Nº 12550
  > Tela\Opçao No Sistema: Cálculos da Folha / Conferência da Prévia
  Incluir na relação a opção referente ao processo de "Atualização de Pensão Alimentícia para Benefíciários ".
- Resolução da Pendência Nº 11873
  > Tela\Opçao No Sistema: Preparo
  No reajuste de benefícios verificar para os benefícios de pensão se a regra de rateio está parametrizada. se não estiver apresentar erro e para a execução.
- Resolução da Pendência Nº 11846
  > Tela\Opçao No Sistema: Relatório de Lançamentos Não Processados
  Criar novo relatório de Lançamentos não processados. Obter a query para este relatório na base da FCRT, onde foi criado um relatório no Gerador de Relatórios. Colocar filtros: por mês de processamento, mês de referência, rubrica, tipo de lançamento (FLGTIPODESC), patrocinadora e plano.
- Resolução da Pendência Nº 11266
  > Tela\Opçao No Sistema: Cadastro de lançamento manual para Folha
  Alteração na tela de entrada manual de rubricas. Ao entrar uma rubrica de convênio identificar o favorecido e o lote de importação e colocar na TMPDESC.
================================================================================
CM$VER      3.03.06k    26/06/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14327
  > Tela\Opçao No Sistema: Preparo
  Após efetuar o reajuste do INSS deve-se executar a regra de cálculo da suplementação.
- Resolução da Pendência Nº 14168
  > Tela\Opçao No Sistema: Consultas \ Estornos Processados
  Ao clicar no botão consultar, o sistema achava as informações, mas não mostrava nos componentes acima do grid.
- Resolução da Pendência Nº 14327
  > Tela\Opçao No Sistema: Preparo
  Após efetuar o reajuste do INSS deve-se executar a regra de cálculo da suplementação.
- Resolução da Pendência Nº 14168
  > Tela\Opçao No Sistema: Consultas \ Estornos Processados
  Ao clicar no botão consultar, o sistema achava as informações, mas não mostrava nos componentes acima do grid.
- Resolução da Pendência Nº 11254
  > Tela\Opçao No Sistema: Verificação de parametrização dos lançamentos para Folha
  Construir tela para identificar problemas de parametrização contábil e financeira dos lançamentos para Folha de Benefícios (tmpdesc), dos tipos 'P' e 'C'. Permitir que os parâmetros contábeis e financeiros sejam atualizados a partir da RubricaxPlano (tipo 'C') ou das tabelas de contribuição e benefício (tipo 'P').
================================================================================
CM$VER      3.03.06b    18/06/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14297
  > Tela\Opçao No Sistema: Efetivação
  Adaptação da rotina de verificação para utilizar a nova estrutura da BancoPortforma.
- Resolução da Pendência Nº 14291
  > Tela\Opçao No Sistema: Efetivação da Folha
  Tornar obrigatória a marcação de pelo menos um lote para efetivar.
- Resolução da Pendência Nº 14216
  > Tela\Opçao No Sistema: CÁLCULO DA FOLHA / PRÉVIA
  Incluir na query de entrada do cálculo do IR decorrente de ação judicial os seguintes campos:
VLRBASEIRRFSEMPA, VLRBASEIRRF
 
- Resolução da Pendência Nº 14187
  > Tela\Opçao No Sistema: Efetivação
  Alterar consulta para identificar pessoas com histórico de benefício a pagar e sem Prévia de pagamento gerada.
- Resolução da Pendência Nº 14185
  > Tela\Opçao No Sistema: Previa
  Juntar no lote de manutenção outros lançamentos do histórico de benefícios que estejam em outro lote. Necessário para o tratamento de registros lançados pela revisão de benefícios.
- Resolução da Pendência Nº 14168
  > Tela\Opçao No Sistema: Consultas \ Estornos Processados
  Ao clicar no botão consultar, o sistema achava as informações, mas não mostrava nos componentes acima do grid.
- Resolução da Pendência Nº 12443
  > Tela\Opçao No Sistema: Desfazer Preparo
  Mesmo cancelando na tela de motivo o desfazer preparo esta sendo processado.
================================================================================
CM$VER      3.03.06a    10/06/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14024
  > Tela\Opçao No Sistema: Estorna Acerto Pós-morte
  Adaptar o processo de estorno pós-morte para a nova tabela BancoPortForma.
 
- Resolução da Pendência Nº 14020
  > Tela\Opçao No Sistema: Estorno
  Alterar a consulta das planilhas vinculadas a uma versão de pagamento da Folha para utilizar também referências existentes na tabela MotivoEstornoFB
- Resolução da Pendência Nº 14018
  > Tela\Opçao No Sistema: Prévia Normal
  Colocar rotina para determinar portador forma segundo novos parâmetros da BancoPortForma durante a Prévia Normal.
 
- Resolução da Pendência Nº 13972
  > Tela\Opçao No Sistema: Visão Gerencial da Folha
  Alterar a consulta das planilhas vinculadas a uma versão de pagamento da Folha para utilizar também referências existentes na tabela MotivoEstornoFB.
- Resolução da Pendência Nº 13950
  > Tela\Opçao No Sistema: Cadastro de Contas Caixas x Forma de Pagamento 
  Alterar o Cadastro de Contas Caixas x Forma de Pagamento para suportar parametrização por tipo de conta, situação do recebedor e tipo de folha.
================================================================================
CM$VER      3.03.06     10/06/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14225
  > Tela\Opçao No Sistema: CÁLCULO DA FOLHA / PRÉVIA
  Retornar na query que alimenta a regra de cálculo de uma rubrica individual (outras rubricas), os valores Mínimo - VALMIN e Máximo - VALMAX. Correspondem aos campos LIMITEMINIMO e LIMITEMAXIMO da tabela RUBRICAXCONTABANCARIA. O teste foi feito com a rubrica 4729, associada à regra de base BAE - CARGO, tendo como limite mínimo o valor de R$ 50,00 e máximo o de R$ 999,00.
- Resolução da Pendência Nº 14192
  > Tela\Opçao No Sistema: Efetivação
  Criar script para atualizar os campos Codportforma, TipoPortador e Dfloatpagto na tabela HstfolhabenefCAP a partir da Histrubsal.  
- Resolução da Pendência Nº 14189
  > Tela\Opçao No Sistema: Várias
  Incluir campo Idmodulo na tabela Bancoportforma e tratar registros apenas para módulo = 18, nas telas: Efetivação, Geração de Arquivo Bancário, Folha Extra, Estorno Pós Morte e Relatórios.
- Resolução da Pendência Nº 14143
  > Tela\Opçao No Sistema: Prévia Normal 
  Alteração do cálculo da estrutura de cálculo que não estava considerando corretamente as rubricas individuais. Alteração na formação da base para apenas das rubricas que compõe IR, considerando os mesmos critérios da estrutura de cálculo.
- Resolução da Pendência Nº 14025
  > Tela\Opçao No Sistema: Alteração do Portador Forma de Pagamento
  Adaptar a tela para a nova tabela BancoPortForma
- Resolução da Pendência Nº 14023
  > Tela\Opçao No Sistema: Relatório de Cartas para Banco
  Adaptar o relatório para a nova tabela BancoPortForma
- Resolução da Pendência Nº 14022
  > Tela\Opçao No Sistema: Folha Extra
  Adaptar a Folha Extra para a nova tabela BancoPortForma
- Resolução da Pendência Nº 14021
  > Tela\Opçao No Sistema: Relatório de Arquivo Eletrônico
  Adaptar o relatório para a nova tabela BancoPortForma
- Resolução da Pendência Nº 14019
  > Tela\Opçao No Sistema: Efetivação
  Colocar rotina para determinar portador forma segundo novos parâmetros da BancoPortForma.
- Resolução da Pendência Nº 14017
  > Tela\Opçao No Sistema: Geração de Arquivo Bancário da Prévia
  Criar tela para gerar siumlação de arquivo bancário a partir da Prévia
- Resolução da Pendência Nº 14016
  > Tela\Opçao No Sistema: Geração de Arquivo Bancário
  Alterar a geração de arquivo bancário para não utilizar a tabela BancoPortForma.
- Resolução da Pendência Nº 13827
  > Tela\Opçao No Sistema: Cadastro de Rubrica Individual
  Rubrica individual (exibir apenas as regras do tipo de regra que o usuário tenha acesso). Depende do modelo do regra ter sido alterado para suportar controle de acesso do usuário por Tipo de Regra.
- Resolução da Pendência Nº 11273
  > Tela\Opçao No Sistema: Efetivação
  Criar novo campo na tabela Hstfolhabenefcap que indique que um determinado portador de pagamento foi realizado através de arquivo eletrônico na própria Folha.
- Resolução da Pendência Nº 10457
  > Tela\Opçao No Sistema: Cálculos da Folha / Definitiva
  Verificar a gravação do campo flgpensaoalim na histrubsal.
  Verifica também a ordenação do tipo na prévia.
================================================================================
CM$VER      3.03.05e    09/06/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14230
  > Tela\Opçao No Sistema: Cálculos da Folha \ Estorno
  Utilizar a rotina do desfazerpreparoindiv da uDesfazerPreparo.
- Resolução da Pendência Nº 14210
  > Tela\Opçao No Sistema: Estorno pagamento indevido
  No estorno pagamento  indevido não esta habilitando o botão de Processar quando pagamento de Abono Anual.Mensagem de conta contábil liquido...
- Resolução da Pendência Nº 14207
  > Tela\Opçao No Sistema: Estorno pagamento indevido
  O estorno pagamento  indevido não esta apagando corretamente a HSTCONTRIBPREV
- Resolução da Pendência Nº 14199
  > Tela\Opçao No Sistema: Estorno pagamento indevido
  Não esta Deletando Hstcontribprev e hstbenefbfciario, tendo em vista a condição(lote), pois quando foi estornado como pendente não alterou o lote na hst...
- Resolução da Pendência Nº 12269
  > Tela\Opçao No Sistema: Estorno da Folha
  Estorno de pagamento relativo a uma Folha Extra não está habilitando botão processar(Conta de líquido)
- Resolução da Pendência Nº 12108
  > Tela\Opçao No Sistema: Relatório de Pagamento da Folha de Benefícios (num. 1130)
  A emissão deste relatório na base da Refer lote 780906, está apresentando erro na transição da pág. 6 para a pág.7, no pagamento da recebedora Clara Briao Malaguez. As rubricas desta recebora começam na pág. 6 e terminam na pág. 7. Entretanto, após a conclusão das rubricas, exibe-se erroneamente, todas as rubricas, sem cabeçalho e com o valor líquido.
- Resolução da Pendência Nº 12090
  > Tela\Opçao No Sistema: Todas as Telas
  Concatenar nos Lookups de Lotes, Versôes e Rubricas as descrições com os seus respectivos códigos.
================================================================================
CM$VER      3.03.05d    28/05/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14090
  > Tela\Opçao No Sistema: Previa
  Alterar a query que busca e testa o status das ações judiciais ganhas. Não considerar se a data final está preeenchida. 
- Resolução da Pendência Nº 14087
  > Tela\Opçao No Sistema: Preparo
  Alterar a query que busca e testa o status das ações judiciais ganhas. Não considerar se a data final está preeenchida. 
- Resolução da Pendência Nº 12131
  > Tela\Opçao No Sistema: Prévia Normal
  Utilizar na prévia de manutenção de abono anual e antecipação de abono anual as rubricas específicas de abono para Desconto e Pagamento de Consignação Judicial, dedução de dependentes de IRRF sobre abono e dedução de idade para IRRF sobre abono. Vinculada a conclusão das pendências 10957 e 10967.
- Resolução da Pendência Nº 12116
  > Tela\Opçao No Sistema: Relatório Individual de Rubricas
  Na base da CBS ao emitir este relatório para a versão 10127 (manutenção 12/2002) está saindo mês referência 13/2002. Da mesma forma ao emití-lopara a versão 10124 (abono anual 2002) está saindo mês referência 11/2002. 
Colocar também nos componentes lookup de lote e versão a abertura das informações em grid com ordenação pelo número e não pela descrição.
================================================================================
CM$VER      3.03.05c    22/05/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14007
  > Tela\Opçao No Sistema: Reajuste de Pensão Alimentícia
  Criar rotina para checar o somatório dos percentuais cadastrados nesta tela com o percentual cadastrado para o alimentado no cadastro de rubricas individuais, de forma a garantir que os dois valores sempre sejam iguais.
- Resolução da Pendência Nº 13826
  > Tela\Opçao No Sistema: Novo relatório
  Relatório de Rubricas Salariais, com as informações contidas no cadastro. A tela de filtro deve permitir opção de seleção por Grupo de Rubricas, Tipo de Rubrica, se compõe IR, se compõe Pensão Alimentícia. Cadastrar no SAD como "Cadastrais".
- Resolução da Pendência Nº 13685
  > Tela\Opçao No Sistema: Rubrica individual
  Permitir que a Folha de Benefícios registre uma rubrica individual de desconto/provento afim de gerar um arquivo de crédito bancário para um favorecido (terceiro) que receberá um reembolso (caso do auxílio funeral com pagamento de reembolso para terceiros). O tratamento a ser dado será semelhante ao procedimento para favorecidos de pensões alimentícias.
- Resolução da Pendência Nº 11860
  > Tela\Opçao No Sistema: Estorno
  No estorno individual para reprocessamento deve atualizar os registros da Hstbenefbfciario colocando flgenviado = 0 e idhstfolhabenef = null, no lote selecionado.
- Resolução da Pendência Nº 10957
  > Tela\Opçao No Sistema: Sistema/configuração/Paramentrização do sistema
  Para atender a montagem da Declaração de Rendimento Anual, é necessario que as rubricas referentes a Consignação (desconto e pagamento), Dedução por dependentes e Dedução devido 65 anos sejam diferenciadas, para o caso de pagamento de Abono Anual, pois a linha do informe de rendimentos é diferente da linha de pagamento normal. 
================================================================================
CM$VER      3.03.05b    19/05/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13997
  > Tela\Opçao No Sistema: Cadastros / Rubricas Individuais
  Fazer com que esses dois itens funcionem juntos, pois se usar o inherited, só funciona o primeiro item, porém sem o mesmo só funciona o segundo.
- Não está trocando de grid quando troca o pagecontrol;
- para o consignatário não está mostrando seus registros,  e nem permitindo incluir nada para ele.
- Resolução da Pendência Nº 13974
  > Tela\Opçao No Sistema: Cálculos da Folha / Estorno
  Não permitir um estorno individual para reprocessamento caso os lotes sejam de pagamento pendente ou de folha extra.
- Resolução da Pendência Nº 13931
  > Tela\Opçao No Sistema: Processamento da Prévia
  O processamento de reajuste de percentual de consignatários deve ser feito na própria tela da Prévia. Não se pode abrir a respectiva tela de reajuste. Para tanto deve-se encapsular a rotina de reajuste para que seja utilizada nas 2 telas.
- Resolução da Pendência Nº 13813
  > Tela\Opçao No Sistema: Calculos da Folha/Prévia
   A cobrança, com atraso, do arredondamento deve manter a data de referência do pagamento.
*O arredondamento pago no mês de encerramento do AM , está sendo cobrado na concessão do Aux. Pecuniário com a referencia do mês do pagamento do Aux. Pecuniário, não com a referencia do mês que foi pago.
*O arredondamento pago no mês e cobrado 2 meses depois, em caso de RENOVA, a referencia está errada.
================================================================================
CM$VER      3.03.05a    12/05/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13915
  > Tela\Opçao No Sistema: Processamento da Efetivação
  Alterar o tratamento do campo ORDEM da tabela Previa de inteiro para float, de forma a suportar valores maiores gerados pelo Empréstimo.
- Resolução da Pendência Nº 13914
  > Tela\Opçao No Sistema: Processamento da Prévia Normal
  Alterar o tratamento dos campos IDDESCONTO e ORDEM da tabela Tmpdesc de inteiro para float, de forma a suportar valores maiores gerados pelo Empréstimo. Gravar o campo ORDEM na Prévia como float.
- Resolução da Pendência Nº 13911
  > Tela\Opçao No Sistema: Associação de Rubricas por Favorecido e por Conta Corrente
  Não está permitindo a alteração da conta bancária vinculada a uma rubrica. Remodelação interna completa dos eventos dos componentes da tela de forma que esta fique de acordo com o Padrão.
- Resolução da Pendência Nº 13882
  > Tela\Opçao No Sistema: Cadastro de Rubrica Individual
  Ajustar o teste de verificação se o favorecido é pessoa física e controlar habilitação de componentes.
- Resolução da Pendência Nº 13881
  > Tela\Opçao No Sistema: Cálculo da Folha/
  Em janeiro/2003 ocorreu o seguinte fato:  No decorrer do mês foi liberado uma folha de benefícios referente a liberação de DRD, sendo que nesta folha existia alguns participantes que
possuem CJ, e foi descontado e pago normalmente. Sò que, no final do mês de 01/2003, com o processamento da folha de manutenção, o sistema não descontou e pagou a CJ, tendo em vista que no mês já havia ocorrido desconto. Favor verificar para correção, pois neste mês de 04/2003 voltou a ocorrer, com a inscrição CBS 30136. OBS:Acredito estar relacionado ao último mês processado.
- Resolução da Pendência Nº 13838
  > Tela\Opçao No Sistema: Associação de Rubricas por Favorecido e por Conta Corrente
  O label Conta Corrente deve ser alterado para Conta Bancária.
- Resolução da Pendência Nº 13837
  > Tela\Opçao No Sistema: Informações Individuais do Assistido
  Alterar o título da tela Informações Individuais do Assistido para "Informações para Benefício em Manutenção", segundo sugestão do usuário
- Resolução da Pendência Nº 13836
  > Tela\Opçao No Sistema: Cadastro de Rubrica Individual
  Ao selecionar um registro de rubrica individual para alteração não estão aparecendo a descrição das rubricas de desconto e de provento vinculadas a regra, na pasta de Pensão Alimentícia.
- Resolução da Pendência Nº 13835
  > Tela\Opçao No Sistema: Criação de submenu no Menu Cadastro
  Criar um submenu "Ação Judicial" dentro do menu Cadastro. Colocar todos os submenus de cadastros relacionados a Ação Judicial neste submenu.
- Resolução da Pendência Nº 13834
  > Tela\Opçao No Sistema: Alteração de menu
  Colocar os menus "Associação de Layout de entrada com Layout de Saída" e  "Associação de Rubricas por Favorecido e por Conta Corrente" como submenus do menu "Entidades Externas".
- Resolução da Pendência Nº 13833
  > Tela\Opçao No Sistema: Associação de Layout de entrada com Layout de Saída
  Esta tela não precisa ser herança de cadastro mestre detalhe, pois a relação é sempre 1 para 1. Deve-se refazer a herança de um cadastro simples.
- Resolução da Pendência Nº 13832
  > Tela\Opçao No Sistema: Relatório de Parametrização Contábil
  Alterar relatório de parametrização contábil e financeira associada a rubricas, para incluir parâmetros não existentes no relatório atual. Filtrar apenas as rubricas tipo folha e não previdenciárias. Usar parametrização de código interno e externo de rubrica.
- Resolução da Pendência Nº 13828
  > Tela\Opçao No Sistema: Cadastro de Rubrica Individual
  Rubrica individual (informar que existem outras regras no mesmo tipo de regra não cadastradas).
- Resolução da Pendência Nº 13822
  > Tela\Opçao No Sistema: Prévia Normal
  Considerar os cadastros da rubrica individual da pasta "Outras Rubricas" e gerar o pagamento para os respectivos favorecidos.
- Resolução da Pendência Nº 13821
  > Tela\Opçao No Sistema: Cadastro de Rubrica Individual
  Alterar a pasta Outras Rubricas para conter as informações de Rubrica do Favorecido e Portador Forma de Pagamento. Esta rubrica do favorecido deve estar no mesmo groupbox do componente Favorecido. Esta rubrica ficará disponível apenas quando existir um favorecido cadastrado e este for uma pessoa física.
================================================================================
CM$VER      3.03.05     29/04/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12959
  > Tela\Opçao No Sistema: Processo de atualização de dependentes de IRRF e Salário Família (Previa)
  Criar tratamento para os campos de data manipulados por este processo quando os mesmos estiverem vazios. Atualmente o Sistema está gerando um erro para esses casos.
- Resolução da Pendência Nº 13752
  > Tela\Opçao No Sistema: Estorno Contas a Pagar
  Pagamento da folha de Benefícios que é estornado para CANCELAMENTO, no sistema FOLHA, está correto, a situação fica PAGAMENTO INDEVIDO ESTORNADO. Só que, se este pagamento foi efetivado, sendo o pagamento programado via REAL PG, o lançamento no sistema CONTAS A PAGAR continua normal, ou seja, documento em aberto. Se analisarmos somente o CONTAS A PAGAR, parece que é um pagamento normal e que ainda não foi efetuado, mas já está cancelado.
- Resolução da Pendência Nº 13815
  > Tela\Opçao No Sistema: Consulta/Folha de Benefícios/Operacionais/Relatório de estorno
  Solicito implementar no relatório de estorno do SISTEMA FOLHA DE BENEFÍCIOS, a informação de qual a forma de estorno.
- Resolução da Pendência Nº 13823
  > Tela\Opçao No Sistema: Cadastro de Ação Judicial
  Ação Judicial (informar que existem outras regras no mesmo tipo de regra não cadastradas).
- Resolução da Pendência Nº 13824
  > Tela\Opçao No Sistema: Tela de parâmetros
  Criar parâmetro de tipo de regra padrão
- Resolução da Pendência Nº 13825
  > Tela\Opçao No Sistema: Tela de parâmetros
  Criar parâmetro para controle de acesso das regras por tipo de regra
- Resolução da Pendência Nº 13829
  > Tela\Opçao No Sistema: Cadastro de Ação Judicial
  Erro no cadastro de ação judicial
- Resolução da Pendência Nº 13830
  > Tela\Opçao No Sistema: Cadastro de Estrutura de Cálculo
  Não se consegue eliminar rubrica associada a uma estrutura de cálculo.
- Resolução da Pendência Nº 13847
  > Tela\Opçao No Sistema: Relatórios / Relatório da Folha
  A DATA FINAL PREVISTA QUE CONSTA NA TABELA HISTÓRICO DE MOVIMENTAÇÕES, CONSTE NO RELATÓRIO DA FOLHA DE BENEFÍCIO( RELATÓRIO 1130\1), NO CAMPO DATA ENCERRAMENTO.
- Resolução da Pendência Nº 13852
  > Tela\Opçao No Sistema: Tela de parâmetros
  Retirar itens em desuso. Ajustar o controle dos painéis na seleção dos itens e na abertura da tela
================================================================================
CM$VER      3.03.04e    17/04/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13276
  > Tela\Opçao No Sistema: CALCULOS DA FOLHA /   ATUALIZAÇÃO DE PENSAO ALIMENTICIA 
  Criar parâmetro para rodar automaticamente a atualização de pensão alimentícia antes de   executar a PREVIA da Folha de Benefícios.
- Resolução da Pendência Nº 13753
  > Tela\Opçao No Sistema: Consultas /Relatórios/Operacionais/Folha de pagamento 
  Tendo em vista as alterações  feitas na folha de benefícios referente as rubricas de informação   de dependentes e IRRF e idade IRRF, no demonstrativo da folha, em anexo, o valor referente as     essas duas rubricas não está aparecendo.
- Resolução da Pendência Nº 13764
  > Tela\Opçao No Sistema: Folha Extra
  Tornar o campo Rubrica de IRRF obrigatorio.
================================================================================
CM$VER      3.03.04d    11/04/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13726
  > Tela\Opçao No Sistema: Calculos da Folha /Definitiva
  Tendo em vista a visão contábil apresentada pela GCO - Contabilidade,referente a pagamentos pendentes no mês, solicito alteração no sistema FOLHA para que:
  *	A folha de benefícios efetivada no mês com data programada(pagametno) para o mês seguinte, no sistema CONTAS A PAGAR, as datas têm que ser (exemplo: efetivada em 31/03/2003 e dt- pagamento 03/04/2003): dt-emisssão = 31/03/2003 dt-lançamento = 31/03/2003  dt-vencimento = 31/03/2003  dt-programada = 03/04/2003
  Hoje o sistema faz: dt-emisssão = 31/03/2003 dt-lançamento = 31/03/2003 dt-vencimento = 03/04/2003 dt-programada = 03/04/2003
- Resolução da Pendência Nº 13739
  > Tela\Opçao No Sistema: Previa Normal
  Quando existe lançamento de 2 benefícios na tabela de Históricos de benefício a correção do benefício para a segunda linha está sendo feita utilizando erroneamente o valor somado dos 2 registros.
================================================================================
CM$VER      3.03.04c    10/04/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12957
  > Tela\Opçao No Sistema: Exportação de Entidades Externas
  Alterar O processo de Exportação do Arquivo para Entidades Convenentes de tal maneira que se possa exportar todos os arquivos de uma única vez, ou seja, o usuário terá acesso a uma lista de Entidades, onde marcará um a um ou todos de uma única vez, isso se justifica pelo fato de hoje a FUNCEF ter mais de 250 entidades convenentes;
================================================================================
CM$VER      3.03.04b    07/04/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13680
  > Tela\Opçao No Sistema: Preparo de Manutenção
  Quando do encerramento de um beneficiário, a regra de primeiro pagamento não está sendo executada para os outros beneficiários, se a data final estiver preenchida, mesmo que para um mês futuro.
- Resolução da Pendência Nº 13681
  > Tela\Opçao No Sistema: Previa / Desfazer Preparo
  No caso de encerramento de um beneficiário não está retornando corretamente o campo VALORATUAL dos beneficiários que permaneceram ativos.
================================================================================
CM$VER      3.03.04     01/04/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13595
  > Tela\Opçao No Sistema: Calculos da Folha / Previa / Normal
  Desfazer preparo não esta desfazendo a inclusão do Abono Anual. Beneficiario com beneficio encerrado em 20/03/2003. Inscriçãonumero = 28161   
- Resolução da Pendência Nº 13598
  > Tela\Opçao No Sistema: Calculos da Folha / Preparo
  O sitema não esta calculando e inserindo os dias com novo percentual. Ex: Final em 20/03/2003 - O beneficiário que ficou deve ter dois valores calculados um referente ao período de 01 a 20/03(Este esta Correto na HSTBENEFBFCIARIO) e outro considerando o novo percentual, referente ao período de 21/03 a 31/03/2003(Este deveria pegar o novo valor gerado após
passar pela regra de rateio  e chamar a regra de primeiro pagamento calculando e inserido na hstbenefbfciario o dias correspondentes-10dias) 
================================================================================
CM$VER      3.03.03v    01/04/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13604
  > Tela\Opçao No Sistema: Exportação de Arquivo
  Não está exportando o campo "valordiferença".
================================================================================
CM$VER      3.03.03u    31/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13591
  > Tela\Opçao No Sistema: Calculos da Folha / Preparo
  A query que calcula o rateio da Pensão, quando um dos beneficiarios esta com datafinal vencendo, não esta trazendo o Campo PERCENTUAL, com isso o valor retornado pela regra de rateio esta apresentado o resultado nulo e o sitema esta gravando o valoratual = 0 na BENEFBFCIARIO. Com isto no mês seguinte o benefício não esta sendo preparado, para o beneficiario que ficou.
================================================================================
CM$VER      3.03.03t    31/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12953
  > Tela\Opçao No Sistema: Ação Judicial de Imposto de renda
  Incluir no detalhe (tabela detprocjud) um flag para indicar se a regra está ativa ou não. Obs) Criar este campo com valor default 0 (ativo)
Alterar no dtmfolhaprevia o filtro da qrydetprocjudicial para só buscar as regras que estejam ativas.
================================================================================
CM$VER      3.03.03s    28/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12996
  > Tela\Opçao No Sistema: Cálculo da FolhaConsulta/Previa/Normal
  Na prévia somou os valores da contribuição + correção + juros e gravou
no id da contribuição.
- Resolução da Pendência Nº 13007
  > Tela\Opçao No Sistema: Cálculos da Folha / Previa
  Modificar a rotina de cálculo das margens consignáveis de 30% e 70% :
a)	A rubrica de IRRF do pagamento normal não poderá mais compor o grupo de rubricas de desconto utilizado pelo cálculo das margens. O IRRF das margens será calculado através de regra específica.
b)	Alterar a rotina para possibilitar o cálculo do IRRF através de regra, gerando um sql de entrada com todas as informações necessárias para o cálculo do irrf. 
c)	Rubricas com prazo 001 (prazo indeterminado e uma ocorrência) NÃO devem ser consideradas na composição dos grupos de cálculo das margens, ainda que estejam associadas no rubricasxgrupos, visto que a margem consignável refere-se ao mês seguinte, e aquela rubrica não terá ocorrência no próximo mês, pois o prazo e 001 (última parcela).
================================================================================
CM$VER      3.03.03r    27/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12952
  > Tela\Opçao No Sistema: Associação de Rubricas por Favorecido e Conta Corrente
  Colocar as informações relativas aos limites mínimo e máximo das entidades convenentes que hoje estão no cadastro de layout de entrada para o cadastro de associação de rubricas por favorecido e por conta-corrente (tabela rubricaxcontabancaria).
  Alterar a qryLimites no DtmFolhaPrevia para passar a pegar estas informações da tabela rubricaxcontabancaria.
  Retirar as informações de limites do cadastro de layout de entrada e da tabela layoutdesconto (campos limiteminimo e limitemaximo).
- Resolução da Pendência Nº 12958
  > Tela\Opçao No Sistema: CADASTRO/ASSOCIACAO DE RUBRCIAS POR FAVORECIDO E CONTA BANCÁRIA
  Permitir que o usuário associe diferentes contas previamente cadastradas (hoje só permite a preferencial) para diferentes rubricas, sendo que para uma mesma rubrica não seja possível associar duas contas bancárias
- Resolução da Pendência Nº 13433
  > Tela\Opçao No Sistema: Cadastros / Ação Judicial
  Nas ações judiciais de Bitributação o campo percentual deve ficar visivel. Já nas ações judiciais de Coreção de Tabela de IRRF o campo percentual deve ficar invisivel e gravar o percentual 100.
- Resolução da Pendência Nº 13450
  > Tela\Opçao No Sistema: Participates/Eventos/Doença/Auxilio Doença
  O sistema Admprev e Folha não atualização a situação do participate.
  Relato: Requeremos um  Auxílio Doença com DATA FINAL EFETIVA em 18/02/2003, que foi pago em 03/2003. Atualmente o benefício esta encerrado e com datafinal na BENEFBFCIARIO, porém as situações nas demais tabelas continuam como Licenciado.
- Resolução da Pendência Nº 13490
  > Tela\Opçao No Sistema: Cadastros / Contas Bancárias
  Apesar de confirmar a operação, aparece um erro da qrydet : não foi encontrado o campo numbanco.
- Resolução da Pendência Nº 13491
  > Tela\Opçao No Sistema: Relatório de Benefícios Retidos
  Não está aparecendo as informações da fundação no cabeçalho do relatório.
- Resolução da Pendência Nº 13492
  > Tela\Opçao No Sistema: Cadastro Manual de Lançamentos para Folha de Benefícios
  Erro ao tentar excluir registros com situação em branco. ' ' not integer value. 
- Resolução da Pendência Nº 13496
  > Tela\Opçao No Sistema: Relatório de Entradas e Saídas
  Tirar a seguinte linha da query: hb.idhstfolhabenef = hb.idhstfolhabenef, quando for usar a tabela prévia.
================================================================================
CM$VER      3.03.03q    20/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11691
  > Tela\Opçao No Sistema: Preparo de Abono
  Para a regra de cálculo de abono do valor de INSS deve-se verificar o parâmetro FLGDATAABONO da tabela Benefplanprev, onde 0 indica que se usará a DIB do INSS e 1 a DIB da Suplementação na consulta passada para a regra.
- Resolução da Pendência Nº 12782
  > Tela\Opçao No Sistema: Utilitários / Contracheque - FUNCEF
  Verificar se as rubricas com flgespecial=2 estão entrando indevidamente na composição do total de descontos.
- Resolução da Pendência Nº 13015
  > Tela\Opçao No Sistema: Consultas \ Relatórios \ Gerenciais \ Relatório de Totais de Suplementação
  O RELATÓRIO DE TOTAIS DE SUPLEMENTAÇÃO Nº 3456\1, referente a fev/02 está
correto, mas os meses de 11/2002, 12/2002, abono anual/2002 e 01/2003 estão
com erros. Após a escolha da versão, selecionei, patrocinadora e plano
(consolidar)
- Resolução da Pendência Nº 13029
  > Tela\Opçao No Sistema: Todas as telas que usam o FlgPartidaDobrada
  Trocar o parâmetro FlgPartidaDobrada e usar o PaqDobrada.
- Resolução da Pendência Nº 13223
  > Tela\Opçao No Sistema: Utitlitários / Contracheque - FUNCEF
  Acertar alguns campos que não estão saindo corretamente no arquivo texto.
================================================================================
CM$VER      3.03.03p    18/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13008
  > Tela\Opçao No Sistema: Cadastros / Rubricas Individuais
  Quando o arquivo das Entidades é importado, no CADASTRO DE RUBRICAS INDIVIDUAIS, o FAVORECIDO não aparece, ainda que o dado esteja gravado na RUBRICAINDIV, verifiquei também que as querys dos montaselects tem comportamento diferenciado para a localização de um mesmo FAVORECIDO/FORNECEDOR. Acredito que eles deveriam ser o mesmo, seguem abaixo os respectivos sqls:
Query do cadastro de rubrica individual: 
SELECT 
PESSOA.NUMDOCUMENTO AS C0, 
PESSOA.NOME AS C1, 
FORNSERV.IDPESSOA AS C2, 
PESSOA.NOME AS C3, 
PESSOA.NUMDOCUMENTO AS C4 
FROM 
PESSOA, 
FORNSERV, 
PESSOAFISICA 
WHERE 
( PESSOA.IDPESSOA = FORNSERV.IDPESSOA ) AND 
( PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA ) AND 
( PESSOA.NOME LIKE 'UNEI%') 
ORDER BY C0 ASC 
Resultado: ZERO LINHA 
Continuação em anexo
- Resolução da Pendência Nº 13106
  > Tela\Opçao No Sistema: Cálculo da Folha/Previa/Normal
  Solicitamos implementação para que o flag de isenção de IR atinja
somente BENEFÍCIOS, pois o Resgate de Poupança não esta incluso na situação
de isenção. 
Vide Instrução Normativa SRF nº 15 de 6 de fevereiro de 2001. Artigo 5º,  & 3º
================================================================================
CM$VER      3.03.03o    14/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13004
  > Tela\Opçao No Sistema: Cadastros / Layout de Saida de Entidades
  Acrescentar o campo Prazo no layout. 
Alterar a tabela LAYOUTDESCONTOSAIDA, criando os campos : 
	COLPRAZO , do tipo number , tamanho 3, null=sim e TAMPRAZO, do tipo number, tamanho 2, null = sim.
- Resolução da Pendência Nº 13006
  > Tela\Opçao No Sistema: Cadastros / Exportação de arquivos de Entidades
  Acrescentar o campo Prazo na rotina de geração de arquivos de convênios continuados. 
Observação : A query qryRIndiv já está contemplando o campo prazo.
================================================================================
CM$VER      3.03.03n    13/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13030
  > Tela\Opçao No Sistema: Prévia
  Alteração na query de entrada para considerar o FlgMolestiaGrave, no cálculo do IRRF.
================================================================================
CM$VER      3.03.03m    13/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12409
  > Tela\Opçao No Sistema: CALCULOS DA FOLHA / DEFINITIVA
  Logo após a crítica: " Foram indentificados alguns erros na verificação. Deseja...", clicando em SIM ocorre o erro "COLUNA INVÁLIDA"
  SQL> INSERT INTO CTRLINTERFACE 
  2  (MESREFERENCIA,TIPO,IDPESSOA,FLGIDATMP,FLGVOLTATMP,FLGIDAINTERFACE, 
  3  FLGVOLTAINTERFACE,DATAIDATMP,DATAVOLTATMP,DATAIDAINTERFACE,DATAVOLTAINTERFA, 
  4  IDLOTE,CODPORTFORMA,FLGEMITIUCC,DATAEMITIUCC,FLGPREPARADO, 
  5  DATAPREPARO,FLGCONCESSAO,DESCRICAO,NUMREG,VLRTOTAL,FLGTIPOFLHA)
  6  VALUES
  7  (  '2003/01','B',NULL,1,0,
  8  0,0,  TO_DATE('25/02/2003','dd/mm/yyyy'),NULL,
  9  NULL,NULL,1053,NULL,  NULL,
  10  NULL,1,TO_DATE('25/02/2003','dd/mm/yyyy'),0, 
  11  'Lote excluidos por erro na versão 126',2,1,5);
  DATAPREPARO,FLGCONCESSAO,DESCRICAO,NUMREG,VLRTOTAL,FLGTIPOFLHA)
- Resolução da Pendência Nº 12574
  > Tela\Opçao No Sistema: Relatório Ficha Financeira Individual por Versão
  Criar relatorio novo de financeira individual por versao. Quebras mes e versao com totalizacao. Colocar resumo ao final como no relatorio atual. Colocar cabecalho com informacoes: matricula, sequencia, %rateio, %proporcao, isencao de IRRF e data de nascimento.
- Resolução da Pendência Nº 13013
  > Tela\Opçao No Sistema: Consultas \ Relatórios \ Operacionais \ Resumo de Rubricas
  O relatório RESUMO DE RUBRICAS n°  2016\1 a onde consta REFERÊNCIA, está apenas aparecendo o Nº da referência, mas a descrição não.
- Resolução da Pendência Nº 13014
  > Tela\Opçao No Sistema: Consultas \ Relatórios \ Gerenciais \ Relatório de Totais de Suplementação
  O RELATÓRIO DE TOTAIS DE SUPLEMENTAÇÃO n°  3456\1 está aparecendo uma faixa branca, entre a coluna QTDE E TOTAL INSS, que está cortando os números.
================================================================================
CM$VER      3.03.03l    10/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12910
  > Tela\Opçao No Sistema: Consultas / Relatórios / Ficha financeira
  No resumo da ficha não está somada a versão do abono anual.
================================================================================
CM$VER      3.03.03k    07/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11795
  > Tela\Opçao No Sistema: Relatório de Resumo de Rubricas
  Acrescentar 3 colunas no relatório:
   . total de rubricas
   . total de recebedores na rubrica
   . valor informativo
- Resolução da Pendência Nº 12153
  > Tela\Opçao No Sistema: Relatórios/ Gerenciais/ Relatório de Totais de Suplementações.
  O somatório dos totais de suplementações e/ou descontos e/ou  líquidos, do Relatório de Totais de Suplementações   não fecham com o Relátório de Resumo de Rubricas da Folha
  Apos/Pens BD - BS 01/03 - Referência:477-v.2003/01/477,   Patrocinadora: CELULAR 
- Resolução da Pendência Nº 12434
  > Tela\Opçao No Sistema: Relatório de Totais de Suplementação
  Usar a mesma tela de filtro do rel. totais de supl. integrais. Colocar em ambos os relatorios o total geral se nao tiver.
- Resolução da Pendência Nº 12577
  > Tela\Opçao No Sistema: Relatório de Entradas e Saídas
  Rel. entradas e saidas pela previa (lotes 2804 e 3257) nao mostrou nenhuma entrada. Na versao efetivada, n.500, aparece. Verificar.
- Resolução da Pendência Nº 12578
  > Tela\Opçao No Sistema: Relatório de Pensão Alimentícia por Favorecidos
  Rel. pensao alimenticia apresenta divergencia quando emitido pela previa lotes 2804 e 3257 e na versao efetivada 500. Verificar.
- Resolução da Pendência Nº 12579
  > Tela\Opçao No Sistema: Folha Extra
  Permitir na folha extra a selecao num combo especifico a rubrica de irrf que deve ser utilizada para o calculo do IR se existir. Deve-se mostrar no combo qualquer das rubricas de IRRF arametrizadas na Folha.
- Resolução da Pendência Nº 12678
  > Tela\Opçao No Sistema: Consultas / Demonstrativo de Pagamentos
  Os valores dos dependentes e os participantes maiores de 65 anos,
  estão constando nos contra-cheques como valores para desconto e aparecendo no
  total de descontos. Em virtude disto o valor líquido está alterado. Ex.
  matric. 95232 e 64998.
- Resolução da Pendência Nº 12724
  > Tela\Opçao No Sistema: Cálculos da Folha / Prévia
  O sistema não está calculando o IRRF quando o pagamento possui uma rubrica do tipo previdenciaria (FLGTIPODESC= P ) inserida através do Cadastro Manual de Lançamentos.
================================================================================
CM$VER      3.03.03j    27/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12240
  > Tela\Opçao No Sistema: CADASTROS/ASSOCIACAO DE RUBRICAS POR FAVORECIDO E POR CONTA CORRENTE
  Implementar no sistema filtro no montaselect para trazer apenas favorecidos da folha de benef cios
 
- Resolução da Pendência Nº 12329
  > Tela\Opçao No Sistema: CADASTROS/ESTRUTURAS DE CALCULO 
  Ordenar pelo CODIGO EXTERNO (CODPROVDESC) da RUBRICA
 
- Resolução da Pendência Nº 12407
  > Tela\Opçao No Sistema: Cálculos da Folha / Atualiza perceentuais de Pensão Alimentícia (novo)
  Criar um processo para atualizar automáticamente os percentuais de pensão alimentícia.
- Resolução da Pendência Nº 12490
  > Tela\Opçao No Sistema: Relatorio de Deposito por Portador Forma
  Corrigir o valor liquido para não incluir as rubricas informativas.
- Resolução da Pendência Nº 12491
  > Tela\Opçao No Sistema: FrameConsultaHistorico
  alteracao nas consultas da bpl para nao considerar devolucao de beneficio, 
e ordenar descrescente.
- Resolução da Pendência Nº 12492
  > Tela\Opçao No Sistema: Unit uBeneficioFolha
  alteracao na Ubeneficiofolha para passar para a regra de valor total as 
opcoes do beneficio atual. Esta passando as opcoes do beneficio anterior.
================================================================================
CM$VER      3.03.03i    25/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11856
  > Tela\Opçao No Sistema: Novo campo na Tmpdesc
  Criar campo FLGNAOPROCESSA na tabela Tmpdesc, tipo char(1), com valores 0 ou 1 e default 0.
- Resolução da Pendência Nº 11857
  > Tela\Opçao No Sistema: Cadastro Manual de Lançamentos de Rubricas
  Na tela de cadastro manual de lançamento de rubricas, inserir componente para indicar se o registro deve ser marcado para não processamento. Neste caso o registro deve ser atualizado com LOTEPREVIA = NULL, VALORRECEBIDO = NULL, DATARECEBIMENTO = NULL. Um registro só poderá ter o campo FLGNAOPROCESSA = 1 se o campo SITENVIO = 0.
- Resolução da Pendência Nº 11858
  > Tela\Opçao No Sistema: Processamento da Previa Normal
  Utilizar na consulta que identifica os registros da Tmpdesc para processar apenas o registros que tem o campo novo FLGNAOPROCESSA = 0 ou NULO.
- Resolução da Pendência Nº 12283
  > Tela\Opçao No Sistema: Cadastros de Tipo de ação por regra e Ação Judicial de IRRF
  A palavra BITRIBUTAÇÃO  é sem hífem.
- Resolução da Pendência Nº 12340
  > Tela\Opçao No Sistema: Importação
  Colocar mais crtíticas no processo de importação.
- Resolução da Pendência Nº 12398
  > Tela\Opçao No Sistema: Importação
  Se o arquivo tem 7 matrículas, como pode se ter 7 incluídas, sendo que 3 foram rejeitadas;
  O totalizador do valor total deve trazer o total das rubricas do arquivo que foram processadas e o total que não foi processado.
- Resolução da Pendência Nº 12404
  > Tela\Opçao No Sistema: Cadastros / Alimentados
  Eliminar este cadastro. Solicitar a eliminação da tabela Alimentados.
- Resolução da Pendência Nº 12405
  > Tela\Opçao No Sistema: cadastros / Rubricas Individuais / Alimentados
  Reformular o método de cadastramento/tratamento de Alimentados, criando os campos percentual e se vai haver redistribuição ou não dos percentuais quando um dos alimentados perder o direito a  pensão. 
- Resolução da Pendência Nº 12406
  > Tela\Opçao No Sistema: Cadastros / Ação Judicial
  Modificar a query que busca os participantes, pois a mesma não está pegando as pessoas que mudaram de plano.
================================================================================
CM$VER      3.03.03h    20/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11855
  > Tela\Opçao No Sistema: Cadastro Manual de lançamento de rubricas
  No cadastro manual de lançamento de rubricas, ao se excluir um registro está eliminando outro registro além do selecionado. O botão de excluir só pode estar habilitado ao se pressionar o botão alterar.
- Resolução da Pendência Nº 11866
  > Tela\Opçao No Sistema: Processamento da Previa Normal
  Antes de executar a previa de um lote eliminar os registros que pessoas com benefício retido tenha no lote da Prévia selecionado, no mês em questão.
- Resolução da Pendência Nº 11871
  > Tela\Opçao No Sistema: Consulta do Histórico de Pagamento
  Ao se pressionar o botão procurar deve-se limpar os campos inscrição e matrícula, antes da pesquisa. 
- Resolução da Pendência Nº 11872
  > Tela\Opçao No Sistema: Frame de Consulta do Histórico de pagamentos
  Mostrar a pasta de rubricas no início da abertura da tela.
- Resolução da Pendência Nº 11932
  > Tela\Opçao No Sistema: Previa Normal
  A rubrica de dedução de dependentes de IRRF deve gravar o campo valorprovento tanto na previa quanto na histrubsal.
- Resolução da Pendência Nº 12123
  > Tela\Opçao No Sistema: Cadastro de Lançamentos de Rubricas
  Não permitir mais o lançamento de rubricas do tipo 'P' (previdenciárias) vinculadas a contribuição. Para tanto deve-se excluir da lista de rubricas do lookupcombobox, as rubricas parametrizadas nas contribuições (tabela CONTPREV). Esta restrição se deve ao fato de que o cadastramento de lançamentos de contribuição para a Folha deve ser feito na tela de contribuição do Admprev.
  Gravar também na Tmpdesc os campos IDMODULO e SISTORIGEM iguais a 18.
- Resolução da Pendência Nº 12261
  > Tela\Opçao No Sistema: Utilização da Tmpdesc
  Criar chave primária (sequence) na Tmpdesc.
  Avaliar em conjunto com os sistemas Admprev, InterfacePrev, Empréstimo, Folha Pagamento.
  Alterar todas as telas que utilizem a Tmpdesc para se adaptar e esta nova informação.
- Resolução da Pendência Nº 12280
  > Tela\Opçao No Sistema: Consulta Histórico de Pagamento
  Alterar a consulta do Consulta Histórico de Pagamento que busca as informações do titular, para que se trate casos em que existe mais de um plano previdenciário. Nestas situações aparecia uma mensagem como se tivessem vários titulares com matrículas similares.
================================================================================
CM$VER      3.03.03g    19/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11269
  > Tela\Opçao No Sistema: Efetivação
  Se mais de 1 banco estiver vinculado a um portador de pagamento na tabela BancoPortForma, a efetivação da folha está erroneamente gerando o arquivo tantas vezes quantos bancos estiverem vinculados. Verificar o lançamento dos documentos financeiros nesta situação.
- Resolução da Pendência Nº 11445
  > Tela\Opçao No Sistema: CALCULOS DA FOLHA /PREPARO - RESULTADO
  Incluir no resultado as seguintes informações: 
  a) Abertura por patrocinadora/plano/benefícios è trazer por patrocinadora e plano a quantidade de benefícios processados, bem como os totalizadores por benefício, além de informar a quantidades de "pessoas"  em manutenção (aposentados e pensionistas separadamente)
  b) Trazer o total de contribuições calculadas 
  c) Trazer o Valor Bruto do Lote processado, analiticamente (por patrocinadora, plano, benefícios de aposentados e pensionistas), bem como o total geral do lote
  d) Número(s) do(s) lote(s) processados(s)
- Resolução da Pendência Nº 12156
  > Tela\Opçao No Sistema: Consulta/ Relatório de Totais de Suplementações
  Se possível ter um somatório geral dos Totais do Relatório de Totais de Suplementações.   Como exemplo para visualização poderá ser usado o Relátório de Resumo de Rubricas da Folha 
  Apos/Pens BD - BS 01/03 - Versão:477-v.2003/01/477.
================================================================================
CM$VER      3.03.03f    13/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11418
  > Tela\Opçao No Sistema: CADASTROS/ENTIDADES EXTERNAS - IMPORTAÇÃO DE ARQUIVOS
  Implementar no processo de importação, a consideração do prazo da rubrica da segunite forma:
  Permanente (prazo indeterminado) ==> virá em branco
  Temporário (prazo livre)         ==> virá com os valores 001 a 999
  Temporário (uma ocorrência)      ==> vi  
- Resolução da Pendência Nº 11610
  > Tela\Opçao No Sistema: Importação de Convênios
  Verificar o somatório de matrículas no arquivo.
  Permitir a inclusão de pensionistas (depentit).
- Resolução da Pendência Nº 11955
  > Tela\Opçao No Sistema: Efetivação
  Para lotes de folha normal (concessão e manutençã, identificar se existem registros da Hstbenefbfciario no lote a efetivar, que não existem na Prévia.
- Resolução da Pendência Nº 12112
  > Tela\Opçao No Sistema: Importação
  Caso a fundação use o parâmetro de estado da rubrica e esteja bloqueada não importar e contar como rejeitada no final fa importação.
- Resolução da Pendência Nº 12163
  > Tela\Opçao No Sistema: Cadastro do Histórico de Benefícios
  Na entrada manual de benefícios, não está gravando o campo "Processado" ou "A Processar" corretamente. Qualquer coisa que eu marque está gravando A Processar.
================================================================================
CM$VER      3.03.03d    12/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11081 
  > Tela\Opçao No Sistema: Calculos da Folha/Previa/Normal
  Sistema não esta buscando arredondamento pago no Abono Anual devido a forma que foi gravado na   rubricaindiv e devido as condições da query que busca os valores na Previa.
- Resolução da Pendência Nº 11369
  > Tela\Opçao No Sistema: Cálculos da Folha - Previa - Pagamentos Pendentes
  No tipo folha de restabelecimento, quando o pagamento retido é para dois dependentes, ou seja,   mesma matricula na patrocinadora, ao liberar o pagamento de um dos dependentes o sistema joga   para a parte esquerda da tela e o outro some do lado direito, impossibilitando o seu   restabelecimento.
- Resolução da Pendência Nº 11475
  > Tela\Opçao No Sistema: Processo de Pagamento Pendente
  O participante Matr. 22017733-3,  foi pago na versão 2179/10/2002 e teve seu pagamento devolvido pelo banco. No Relatórios de Estorno (Modulo Contábil) a soma das rubricas 
  totaliza um liquido de R$ 16.409,33 com IR retido de R$ 5.471,39. Na versão 2217/2002/11 o pagamento do referido participante foi restabelecido porém no relatório de Pagamento da Folha de Benefício o liquido do participante foi de R$ 21.880,72. A diferença do valor do líquido retido e do efetivamente pago é justamente o valor do IR. O IR do pagamento inicial não é estornado, porém este valor deve ser deduzido do pagamento do participante para devolução desta verba a REFER. 
================================================================================
CM$VER      3.03.03c    11/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10710
  > Tela\Opçao No Sistema: Calculos da Folha/Estorno
  Quando é efetuado um estorno completo da folha com 2 lotes, o campo SITENVIO da tabela TMPDESC não está voltando a situação anterior e o campo ULTMESPREPARO da tabela RUBRICAINDIV também não está retornando.
- Resolução da Pendência Nº 11760
  > Tela\Opçao No Sistema: Estorno
  Ao estornar uma versão para reprocessamento, não está atualizando os campos sitenvio e loteprevia. Por favor, verificar também se são só estes dois campos que não estão voltando a situação anterior.
- Resolução da Pendência Nº 11773
  > Tela\Opçao No Sistema: Relatório de Rendas Alteradas
  Permitir a emissão do relatório a partir da tabela prévia;
  Permitir a seleção no mês base de versões da Folha. Também no mês atual. (Igual o de entrada e saídas);
  Permitir a informação de um percentual de alteração em relação ao mês base.
- Resolução da Pendência Nº 11962
  > Tela\Opçao No Sistema: Preparo da Folha
  Sql de entrada para rodar regra de rateio de beneficiários. É necessário passar para a regra de rateio os campos IDTITULAR, IDPESSJUR, IDPLANOPREV E SEQPROPOSTA.
- Resolução da Pendência Nº 12007
  > Tela\Opçao No Sistema: Relatório de Totais de Suplementação Integrais por Patrocinadora, Plano e Benefício
  A tela de seleção das opções do relatório deve ser igual ao do resumo de rubricas 
- Resolução da Pendência Nº 12089
  > Tela\Opçao No Sistema: Relatório Individual de Rubricas
  Concatenar no Lookup de Lote ou Versão o IdLote ou IdHstFolhaBenef.
================================================================================
CM$VER      3.03.03b    07/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 8104
  > Tela\Opçao No Sistema: Calculos da Folha/Prévia
  O desfazer preparo não esta voltado, corretamente,o campo ULTMESREAJUSTE.
- Resolução da Pendência Nº 10083
  > Tela\Opçao No Sistema: Desfazer Preparo
  Correção da função 'Desfazer Preparo', pois não está apagando o Histórico de Benefícios de participantes que se encontram na situação de retido.
- Resolução da Pendência Nº 10557
  > Tela\Opçao No Sistema: Calculos da Folha/ Previa/Desfazer
  O desfazer Preparo/Previa que não seja total não está voltando os campos corretamente para a posição anterior.
- Resolução da Pendência Nº 11163
  > Tela\Opçao No Sistema: Cálculo da Folha/Preparo
  No desfazer preparo deve-se tornar o processo ativo, para os casos que o benefício é reativado.
- Resolução da Pendência Nº 11270
  > Tela\Opçao No Sistema: Efetivação
  Verificar se o usuário tem permissão para o lançamento de documento na data informada na tela.
  (usar documento.AutorizaDataVencimento). PS: está verificação deve ser realizada em todos os locais onde se cria um documento financeiro a pagar ou a receber.
- Resolução da Pendência Nº 11841
  > Tela\Opçao No Sistema: Efetivação da Folha de Benefícios
  Nos lançamentos contábeis da efetivação da Folha utilizar o novo parâmetro de partida dobrada.
- Resolução da Pendência Nº 11843
  > Tela\Opçao No Sistema: Efetivação da Folha 
  Apenas para FUNCEF, se o campo FLGFITESPECIAL = 1, colocar o campo Idplanoprevcontabil = 22 se planoprev = 2, Idplanoprevcontabil = 1 se idplanoprev = 19 para os lançamentos contábeis.
- Resolução da Pendência Nº 11926
  > Tela\Opçao No Sistema: Função de Calculo do Num. Dep. IRRF
  Alterar a rotina de calculo do numero de dependentes para não utilizar o objeto Dtmfolhaprevia. Para tanto deve-se passar como parâmetro um objeto query e construí-lo em tempo de execução. Em adição, não se deve fazer o commit internamente
================================================================================
CM$VER      3.03.03a    07/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11842
  > Tela\Opçao No Sistema: Tela de Estorno
    No estorno individual por pagamento indevido, pelo qual se faz lançamentos contábeis de acerto das rubricas estornadas, deve-se utilizar o novo parâmetro de partida dobrada.
- Resolução da Pendência Nº 11844
  > Tela\Opçao No Sistema: Estorno
  Apenas para FUNCEF, se o campo FLGFITESPECIAL = 1, colocar o campo Idplanoprevcontabil = 22 se planoprev = 2, Idplanoprevcontabil = 1 se idplanoprev = 19 para os lançamentos contábeis.
- Resolução da Pendência Nº 11924
  > Tela\Opçao No Sistema: Calculos da Folha/Definitiva/Pagamento Pendentes
  Os processamento da Folha Pagamento Pendentes (Beneficios estornados pela opção Pagamentos Pendentes) não alterou o FLGESTORNO para 3 continua como 2 apesar de já estar efetivado.
- Resolução da Pendência Nº 11925
  > Tela\Opçao No Sistema: Calculos da Folha/Definitiva/Pagamento Pendentes
  Os adiantamentos, emitidos pela Folha Extra foram devolvidos pelo banco, estornamos com a opção de pagamento pendente, processamos a prévia e a definitiva porém o FGLESTORNO esta 2 e não foi criada uma nova linha na Histrubsal e não gerou nova Folha.
================================================================================
CM$VER      3.03.03     05/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11869
  > Tela\Opçao No Sistema: Fechamento de Convênios
  A verificação estava erroneamente sendo feita para convênios com pagamento manual.
- Resolução da Pendência Nº 11880
  > Tela\Opçao No Sistema: Relatório de Alteração de Benefícios Pagos
  Alterar no Sad o nome do relatório;
  alterar o caption do form;
  colocar em um novo DataModule.
- Resolução da Pendência Nº 11887
  > Tela\Opçao No Sistema: CALCULOS/PROCESSO PREVIA 
  Incluir o campo " TIPOACAO "  ( TIPO DA A O JUDICIAL) na query de entrada para a regra
- Resolução da Pendência Nº 11888
  > Tela\Opçao No Sistema: CALCULOS/PROCESSO PREVIA 
  Incluir o campo " STATUSACAO "  ( STATUS DA A O JUDICIAL) na query de entrada para a regra
================================================================================
CM$VER      3.03.02r    05/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11849
  > Tela\Opçao No Sistema: CALCULOS/PROCESSO PREVIA
   Incluir o campo "PERCACJUD"  (Percentual que foi inserido no cadastro de A o Judicial ) na query de entrada para a regra;
- Resolução da Pendência Nº 11850
  > Tela\Opçao No Sistema: CALCULOS/PROCESSO PREVIA 
  Incluir o campo "VLMINIR " (Valor m nimo para recolhimento de IRRF ) , na query de entrada para a regra;   esse valor   parametrizado nos "Par metros do Sistema"  e deve ser passado, pois nas regras teremos que consider-lo afim de calcular corretamente as pens es quando o valor do IRRRF ficar <= que aquele parametrizado. 
- Resolução da Pendência Nº 11851
  > Tela\Opçao No Sistema: CADASTROS/RUBRICAS INDIVIDUAIS
  Trazer  no grid O NOME DA REGRA ASSOCIADA  
- Resolução da Pendência Nº 11852
  > Tela\Opçao No Sistema: CALCULOS/PROCESSO PREVIA 
  O campo "VLRINSS" , passado na query de entrada para o clculo das rubricas individuais, est  sendo arredondado, sem centavos,  necess rio que seja truncado com duas casas decimais
================================================================================
CM$VER      3.03.02q    05/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11800
  > Tela\Opçao No Sistema: CADASTROS/RUBRICAS INDIVIDUAIS
  Marcando a rubrica como PERMANENTE, o campo DATAFINAL está sendo preenchido
- Resolução da Pendência Nº 11801
  > Tela\Opçao No Sistema: CADASTROS/RUBRICAS INDIVIDUAIS
  O nome do favorecido (em ambas as pastas) não está sendo limpo, ou seja, quando se cadastra uma rubrica e entra-se novamente outra, o favorecido cadastrado anteriormente aparece no combo incorretamente.
- Resolução da Pendência Nº 11815
  > Tela\Opçao No Sistema: Relatório Pagamento de Folha de Beneficio
  Favor alterar o relatório Pagamento de Folha de Beneficio, para que o mesmo imprima na seguinte ordem:
            Primeiro as suplementações 
            Segundo as Contribuições
            Terceiro os demais descontos.
 
- Resolução da Pendência Nº 11824
  > Tela\Opçao No Sistema: Relatório Ficha Financeira 
  As rubricas de abono anual devem aparecer separadas da folha de dezembro, uma vez que os pagamentos embora seja efetuados no mesmo mês, são de tributação diferente e informados em campos diferentes tanto no informe como na DIRF
- Resolução da Pendência Nº 11825
  > Tela\Opçao No Sistema: Relatório Ficha Financeira 
  As colunas que são informativas devem informar os valores históricos em separado das colunas de proventos e descontos, para favorecer visualização a consultas posteriores
- Resolução da Pendência Nº 11840
  > Tela\Opçao No Sistema: Parâmetros do Sistema
  Criar parâmetro para indicar se os lançamentos contábeis realizados pela Folha de Benefícios utilizarão partida dobrada. Nome do parâmetro FLGPARTIDADOBRADA (valores 0 ou 1). Se = 1, faz lançamento por partida dobrada. Se = 0 ou nulo faz lançamento múltiplo 1 para n.
================================================================================
CM$VER      3.03.02p    05/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11770
  > Tela\Opçao No Sistema: Calculos da Folha/ Estorno 
  Ao fazer um estorno completo de uma determinada versão da Folha, o sistema não está voltando o campo FLGIDATMP da tabela ctrlinterface o que está impossibilitando o reprocessamento do lote uma vez que o mesmo fica indisponível na tela.
- Resolução da Pendência Nº 11794
  > Tela\Opçao No Sistema: Relatório de Resumo de Rubricas
  Trocar a linha da query h.flgestorno in (null, 0) por (h.flgestorno is null or h.flgestorno = 0)
================================================================================
CM$VER      3.03.02o    05/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11167
  > Tela\Opçao No Sistema: Calculos da Folha  / Previa Normal
  Customizar o processo de cálculo das folhas (prévia) normal, adiantamento de abono e abono  para verificar se existe ação judicial para a pessoa que está sendo processada. 
Se não existir, processar normalmente (como já é feito hoje). 
Se existir então verificar o status da ação. 
Se a ação estiver em liminar então processar o pagamento com as rubricas fechadas, abrindo apenas a rubrica de IRRF.
Se a ação estiver julgada então processar o pagamento com as rubricas abertas.
Processar o pagamento com as "Rubricas Fechadas" significa utilizar as mesmas rubricas já utilizadas pelo processo hoje.
Processar o pagamento com as "Rubricas Abertas" significa utilizar as mesmas rubricas já utilizadas pelo processo hoje e também as rubricas específicas de ação judicial.
================================================================================
CM$VER      3.03.02j    30/01/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10985
  > Tela\Opçao No Sistema: CADASTROS/COMPENSAAO DE IMPOSTO DE RENDA
  Desenvolver tela de consulta do Hist rico de compensa o de IRRF
- Resolução da Pendência Nº 11611
  > Tela\Opçao No Sistema: Rubricas Individuais
  Ao pedir para alterar o detalhe, a rubrica não aparace no LookupCombo, para fazer a alteração.
- Resolução da Pendência Nº 11771
  > Tela\Opçao No Sistema: Relatório de Pensão Alimentícia de Favorecidos
  Colocar o relatório na parte de Operacionais.
Permitir a emissão do relatório a partir da tabela prévia.
- Resolução da Pendência Nº 11778
  > Tela\Opçao No Sistema: Manual de Lançamentos para Folha de Benefícios
  Quando a pessoa migra de plano, está pegando o plano antigo e portanto lançando errado.
================================================================================
CM$VER      3.03.02     24/01/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10775
  > Tela\Opçao No Sistema: Processo de Efetivação 
  Passar a gravar na Histrubsal as informações de Isento de IRRF, IRRF Total, Molestia Grave e Número de dependentes para IRRF para uma determinada Folha.
- Resolução da Pendência Nº 10794
  > Tela\Opçao No Sistema: Calculos da Folha/Preparo
  Recalcular o valor do salário virtual ao rodar o preparo. Criar parâmetro para controlar se a regra de cálculo do salário virtual será executada todo mês.
- Resolução da Pendência Nº 10826
  > Tela\Opçao No Sistema: Tela de Previa Normal
  Na chamada da regra de correção de contribuição na Previa da Folha Normal utilizar a data prevista de pagamento registrada na contribuição.
- Resolução da Pendência Nº 10986
  > Tela\Opçao No Sistema: CADASTROS/Associa o de Tipo de A o por Regra
  Implementar Associa o de TIPO de A o por Regra.
- Resolução da Pendência Nº 10987
  > Tela\Opçao No Sistema: CADASTROS/A o Judicial de Imposto de Renda
  mplementar TIPO de A o neste cadastro, sendo:
 
 1) Compensa o de IR 
  => No utiliza regra de c lculo
  => O total de imposto de renda a recolher ser compensado e o saldo a compensar ser  deduzido, ou seja, no ser  gerada rubrica de desconto de IR para a pessoa que se enquadrar nesse caso
  => Dever trazer o hist rico da compensa o em tela de consulta especfica
  => Na escolha desse tipo de A o o sistemas dever  deixar visible "false" o detalhe da tela (nome da regra e descricao da rubrica)
 => Na escolha desse tipo de a o todas as op es da tela devero ser opcionais, com EXCESSAO de ANOMES  INICIO, ANO MES FINAL e TOTAL A COMPENSAR
- Resolução da Pendência Nº 10988
  > Tela\Opçao No Sistema: CADASTROS/A o Judicial de Imposto de Renda
  Implementar TIPO de A o neste cadastro, sendo:
2) Dep sito Judicial
 => Dever validar a regra devidamente associada no cadastro de Associa o de A o por Regra, que por sua vez dever  trazer as rubricas associadas no Cadastro de Associa o de Rubricas por Regras
- Resolução da Pendência Nº 11423
  > Tela\Opçao No Sistema: CADASTROS/PARAMETROS DO SISTEMA
  Quando o menu apresentar submenus, como é o caso do PROCESSO PREVIA, indicar em qual submenu o usuário está (destacando com cor ou indicando no título da tela) 
- Resolução da Pendência Nº 11428
  > Tela\Opçao No Sistema: CADASTROS/PARAMETROS DO SISTEMA/PROCESSO PREVIA/IMPOSTO DE RENDA
  Criar associação, bem como implementar processo no sistema, para tratar a "Rubrica para IRRF de abono anual INSS" (o sistema possui apenas a da Fundação)
- Resolução da Pendência Nº 11436
  > Tela\Opçao No Sistema: CADASTROS/RUBRICAS INDIVIDUAIS
  Implementar critica para verificar se o FAVORECIDO DE PENSAO ALIMENTICIA possue CPF e Conta Bancaria cadastrados.
- Resolução da Pendência Nº 11617
  > Tela\Opçao No Sistema: Cadastro/Rubricas individuais
  Ao  incluir uma Consig. Judicial, com valor fixo, não permanente, sem regra, não esta habilitando a rubrica de 6 (Desconto de consig. Judicial) já quando colocamos uma regra o sistema passa a habilitar, esta erro passou a acontecer após alteração da tela de inclusão das Consig. Judiciais, antes não havia este problema. 
- Resolução da Pendência Nº 11655
  > Tela\Opçao No Sistema: Tela de Conferência de Previa
  Nova tela para conferência da Prévia que permite ao usuário preencher um checklist de perguntas necessárias a efetivação de lote de pagamento.
- Resolução da Pendência Nº 11659
  > Tela\Opçao No Sistema: Associação de Rubrica por Plano
  Quando estiver parametrizado para não utilizar Atividade e Projeto, colocar no campo UnidNegoc da tabela RubricaxPlano a Atividade e Projeto padrão.
- Resolução da Pendência Nº 11672
  > Tela\Opçao No Sistema: Cadastro de lay-out
  O usuário ao cadastrar um novo lay-out e procurar uma rubrica aparece um erro na tela. Este erro só não acontece se clicar em procurar sem colocar nenhuma rubrica,  porém esta solução não agrada ao usuário.
 
- Resolução da Pendência Nº 11681
  > Tela\Opçao No Sistema: Consulta - relatórios - Operacionais - Folha de pagamento de benefício
  Ao tentar selecionar a versão de pagamento no listbox correspondente, somente aparecem as versões de março/2002 em diante. Devem aparecer todas as versões. Pedimos observar se este problema não ocorre em outra telas com a mesma consulta
================================================================================
CM$VER      3.03.01l    20/01/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11251
  > Tela\Opçao No Sistema: Relatório de Divergência de Contribuição
  Relatório indicativo de divergência de valor de contribuição mensal num lote de manutenção contra o valor da mesma contribuição em um mês anterior.
- Resolução da Pendência Nº 11262
  > Tela\Opçao No Sistema: Relatório de Entradas e Saídas
  Verificar na base da FCRT.
  - Selecionar mês base 12/2002: não aparece nenhum lote. Colocando mês base 11/2002 aparece os lotes de Abono.
  - colocar nos listboxes o no. versão e o no. do lote.
  - filtrar lotes não efetivados
  - filtrar lotes de importação
- Resolução da Pendência Nº 11450
  > Tela\Opçao No Sistema: CONSULTAS/PREVIA DA FOLHA DE PAGAMENTOS
  Melhorar a visualização de todos os recebedores. O ideal é trazer da mesma forma que está na consulta Elegível/Participante (CMTOTALPREV50.BPL). Além disso a consulta deve sempre priorizar o participante e hoje o sistema está trazendo primeiramente o favorecido.
- Resolução da Pendência Nº 11486
  > Tela\Opçao No Sistema: Associação de Rubricas por Plano
  Exclusão da obrigatoriedade de preenchimento do campo "SubConta"  da tela de Associação de Rubricas por Plano, já que a Fundação REFER não o utiliza.
- Resolução da Pendência Nº 11515
  > Tela\Opçao No Sistema: Efetivação da Folha
  Acertar o índice do componente radiobutton quando é para Folha Extra.
================================================================================
CM$VER      3.03.01k    14/01/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10600
  > Tela\Opçao No Sistema: Fechamento de Convenios
  1) Modificar a rotina de geração dos lançamentos no financeiro de forma a quando o valor apurado for positivo, gerar um CAP, quando for negativo gerar um CAR.
  2) Implementar mensagens para CAP/CAR. Hoje o programa assume que só vai ser gerado o CAP.
- Resolução da Pendência Nº 10608
  > Tela\Opçao No Sistema: Estorno
  Implementar a opção de estorno por acerto de pagamento por Falecimento.
  Implementar opção de geração de arquivo de débito.
- Resolução da Pendência Nº 10947
  > Tela\Opçao No Sistema: Cadastros / Importação de Arquivos 
  O resultado da importação deverá trazer as seguintes informações : 
  a) Quantidade total de matriculas do arquivo. 
  b) Quantidade de matriculas com erro ( e sua respectiva matricula) 
  c) Numero de registros do arquivo (quantidade de linhas do detalhe)
- Resolução da Pendência Nº 11299
  > Tela\Opçao No Sistema: Abertura de Lote
  Na abertura de lote quando se identificar a existência de outro lote em mês anterior, deve-se na mensagem de alerta indicar o número deste(s) lote(s).
  Na eliminação de lote exibir uma mensagem de confirmação antes de eliminá-lo.
- Resolução da Pendência Nº 11398
  > Tela\Opçao No Sistema: CADASTROS/INFORMAÇÕES INDIVIDUAIS DO ASSISTIDO
  RETIRAR A EXPRESSAO "Excessões no"
- Resolução da Pendência Nº 11399
  > Tela\Opçao No Sistema: Parâmetros do Sistema
  Criar dois parâmetros na parte de convênio.
- Resolução da Pendência Nº 11420
  > Tela\Opçao No Sistema: CADASTROS/PARAMETROS DO SISTEMA/ MOTIVAÇÃO PADRÃO
  RETIRAR TODAS AS EXPRESSÕES "PADRÃO".
- Resolução da Pendência Nº 11421
  > Tela\Opçao No Sistema: CADASTROS/PARAMETROS DO SISTEMA/CONTRACHEQUE
  CORRIGIR ORTOGRAFIA: FORMA CORRETA: CONTRACHUQUE (SEM HÍFEM)
- Resolução da Pendência Nº 11425
  > Tela\Opçao No Sistema: CADASTROS/PARAMETROS DO SISTEMA/PROCESSO PREPARO/PREPARO
  Trocar o título de "Calcula SRB se houver reajuste no INSS ou na Patrocinadora", "Recalcular benefício na Fundação se houver reajuste no INSS ou na Patrocinadora"
- Resolução da Pendência Nº 11426
  > Tela\Opçao No Sistema: CADASTROS/PARAMETROS DO SISTEMA/PROCESSO PREVIA/PREVIA
  Trocar expressão "Margem de 30" para "Margem 1" e também para a "Margem de 70" para "Margem 2", isso se justifica para deixar de forma genérica
- Resolução da Pendência Nº 11430
  > Tela\Opçao No Sistema: CADASTROS/PARAMETROS DO SISTEMA/PROCESSO PREVIA/IMPOSTO DE RENDA
  Alterar expressão "Rubrica para IRRF de Abono" para "Rubrica para IRRF de Abono Anual Fundação"
- Resolução da Pendência Nº 11431
  > Tela\Opçao No Sistema: CADASTROS/PARAMETROS DO SISTEMA/PROCESSO PREVIA/IMPOSTO DE RENDA
  Alterar expressão "Rubrica Normal" para "Rubrica IRRF Fundação"
- Resolução da Pendência Nº 11433
  > Tela\Opçao No Sistema: CADASTROS/PARAMETROS DO SISTEMA/PROCESSO PREVIA/IMPOSTO DE RENDA
  Alterar expressão "Rubrica para IRRF de INSS" para "Rubrica IRRF INSS"
- Resolução da Pendência Nº 11434
  > Tela\Opçao No Sistema: CADASTROS/PARAMETROS DO SISTEMA/PROCESSO PREVIA/IMPOSTO DE RENDA
  Alterar expressão "Valor mínimo para IRRF (inclusive)" para "Valor mínimo para recolhimento de IRRF (inclusive)"
- Resolução da Pendência Nº 11448
  > Tela\Opçao No Sistema: CONSULTAS/PREVIA DA FOLHA DE PAGAMENTOS
  INCLUIR A SITUAÇÃO DO PARTICIPANTE NA FUNDAÇÃO
- Resolução da Pendência Nº 11451
  > Tela\Opçao No Sistema: CONSULTAS/PREVIA DA FOLHA DE PAGAMENTOS
  Trocar a expressão "Valor Integral" por "Valor Fundação"
- Resolução da Pendência Nº 11452
  > Tela\Opçao No Sistema: CONSULTAS/PREVIA DA FOLHA DE PAGAMENTOS
  Alterar o lay-out da tela de forma a permitir a visualização de mais linhas das rubricas, o sistema hoje mostra apenas duas linhas por vez. Sugestão: adotar o mesmo lay-out da tela de Consulta Elegível/Participante (CMTOTALPREV50.BPL)
- Resolução da Pendência Nº 11471
  > Tela\Opçao No Sistema: Tela Cadastro Layout Entrada
  Falha na Rotina de verificação de posições de campos do lay-out.
- Resolução da Pendência Nº 11472
  > Tela\Opçao No Sistema: Tela de layout desconto saida.
  Falha na Rotina de verificação de posições de campos do lay-out.
================================================================================
CM$VER      3.03.01j    09/01/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10622
  > Tela\Opçao No Sistema: Cadastros Rubricas Individuais
  Retirar o flag  "CALCULA CPMF" e alterar o pragrama para que calcule automaticamente a CPMF para as rubricas associadas com FONTE PAGADORA INSS
- Resolução da Pendência Nº 10948
  > Tela\Opçao No Sistema: Cadastros / Ação Judicial de IRRF 
  a) Permitir que o campo Data Final possa ser nulo. 
b) Passar a buscar "Pensionistas" (campo matricula na tabela DEPENTIT). 
- Resolução da Pendência Nº 10949
  > Tela\Opçao No Sistema: Cadastros / Compensação de Imposto de Renda
  a) Passar a buscar "Pensionistas" (campo matricula na tabela DEPENTIT)
- Resolução da Pendência Nº 10983
  > Tela\Opçao No Sistema: CADASTROS/ASSOCIACAO DE RUBRICAS POR BENEFICIO
  RETIRAR O CADASTRO DO SISTEMA (retirar menu no controle de acesso tmb)
- Resolução da Pendência Nº 10984
  > Tela\Opçao No Sistema: CADASTROS/COMPENSA AO DE IMPOSTO DE RENDA
   RETIRAR O CADASTRO DO SISTEMA (retirar menu no controle de acesso tmb)
OBS.: O detalhe da tela em questo ser  usado na consulta do historico de compensacao de imposto de renda
- Resolução da Pendência Nº 11319
  > Tela\Opçao No Sistema: Consultas / Relatórios / Resumo de Rubricas
   Criar parâmetro na própria tela para o usuário escolher contar por pessoas ou por rubricas.
- Resolução da Pendência Nº 11320
  > Tela\Opçao No Sistema: Consultas / Relatórios / Informações de Convênios
Colocar um CheckBox para saber se o usuário quer um lote de abono ou não.
- Resolução da Pendência Nº 11331
  > Tela\Opçao No Sistema: Tela de Fechamento de Convênios.
Utilização do campo "CODPORTFORMAFAV" (código do portador forma do favorecido) da tabela LAYOUTDESCONTO no Contas a Pagar.  
- Resolução da Pendência Nº 11332
  > Tela\Opçao No Sistema: Tela de Layout Descontos - Entrada.
Utilização de novo campo "CODPORTFORMAFVREC" (código do portador forma de recebimento para o favorecido)  da tabela LAYOUTDESCONTO.
Criar campo "CODPORTFORMAFVREC na tabela LAYOUTDESCONTO.
- Resolução da Pendência Nº 11345
  > Tela\Opçao No Sistema: Lay Out Descontos - Entradas
Erro no tipo do campo COD_RUBRICA da query do detalhe (qryDet)
- Resolução da Pendência Nº 11346
  > Tela\Opçao No Sistema: CADASTROS/CONTA BANCARIA
RETIRAR DO TITULO DA TELA A EXPRESSAO "CADASTRO DE"
- Resolução da Pendência Nº 11348
  > Tela\Opçao No Sistema: CADASTROS/RUBRICAS INDIVIDUAIS
RETIRAR DO TITULO DA TELA A EXPRESSAO "CADASTRO DE"
- Resolução da Pendência Nº 11349
  > Tela\Opçao No Sistema: CADASTROS/RUBRICAS INDIVIDUAIS (SAD)
 Espelhar o mesmo texto do menu, pois no controle de acesso está "Rubricas Individuais e Adiantamentos"
- Resolução da Pendência Nº 11350
  > Tela\Opçao No Sistema: CADASTROS/INFORMACOES INDIVIDUAIS DO ASSISTIDO
Alterar o título da coluna do grid "Isenta de IRRF no Mês" para "Não Calcula IRRF no Mês". 
================================================================================
CM$VER      3.03.01i    06/01/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10423
  > Tela\Opçao No Sistema: CALCULOS DA FOLHA / ESTORNO
  Uma vez executado um estorno da FOLHA, no seu reprocessamento as rubricas de pensão alimenticia (RUBRICAINDIV) não estão sendo processadas.
- Resolução da Pendência Nº 10941
  > Tela\Opçao No Sistema: Configura es do Sistema/Processo Previa / Salario Familia
  A rubrica de credito do salario familia nao esta sendo gravada
- Resolução da Pendência Nº 10943
  > Tela\Opçao No Sistema: Configura es do Sistema/Processo Previa / CPMF
   As rubricas de credito e desconto da CPMF da pensao nao estao sendo gravadas
- Resolução da Pendência Nº 10944
  > Tela\Opçao No Sistema: Configura es do Sistema
  Identificar o As rubricas de credito e desconto da CPMF da pensao nao estao sendo gravadas
- Resolução da Pendência Nº 10945
  > Tela\Opçao No Sistema: Entidades Externas  Layout de Arquivos de Entrada
  Implementar cr tica quando se colocar posi es repetidas em campos diferentes
- Resolução da Pendência Nº 10946
  > Tela\Opçao No Sistema: Entidades Externas  Layout de Arquivos
  Implementar crítica quando se colocar posiveis repetidas em campos diferentes
- Resolução da Pendência Nº 10977
  > Tela\Opçao No Sistema: CONSULTAS/PREVIA
   Incluir a informa o sobre IRRF Total 
- Resolução da Pendência Nº 11157
  > Tela\Opçao No Sistema: Cálculos da Folha/Prévia
  Campo referência na tabela prévia, no processamento da Prévia de pagamento pendente, não está sendo gravado corretamente. Usar mesma forma da Prévia Normal.
- Resolução da Pendência Nº 11206
  > Tela\Opçao No Sistema: Cadastros / Entidades Externas / Layout Descontos - Entrada
  Criar parametrização para o portador-forma da entidade conveniada.
- Resolução da Pendência Nº 11228
  > Tela\Opçao No Sistema: Cálculos da Folha / Fechamento de Convênios
  Criar processo de verificação para os dados financeiros contábeis para processo de fechamento de convênio.
- Resolução da Pendência Nº 11272
  > Tela\Opçao No Sistema: Estorno
  Verificar se os documentos cujo valor é zero estão impedindo o estorno completo. Neste caso de valor zerado o documento já é lançado baixado, mas não pode impedir que se faça o estorno completo.
================================================================================
CM$VER      3.03.01h    30/12/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 5908
  > Tela\Opçao No Sistema: Tela de Preparo
  Reajuste de Benefícios recalculando o SRB e fazendo reajuste por enquadramento.
- Resolução da Pendência Nº 10480
  > Tela\Opçao No Sistema: Consultas / Histórico de Pagamento da Folha
  Identificar se um pagamento se refere ao adiantamento de benefício provisório.
- Resolução da Pendência Nº 10645
  > Tela\Opçao No Sistema: Calculos da Folha/Estorno
  Ao estornar um participante, que possui desconto de consignação, para reprocessar. O sistema estornou o pagamento do participante e não estornou da consignatária. 
Acredito haver erro no sitesma, visto que a consignação esta diretamente ligada ao benefício do participante e portanto se houver um reprocessamento o valor da mesma pode ser alterado.
- Resolução da Pendência Nº 10790
  > Tela\Opçao No Sistema: Cadastros  / Entidades Externas / Lay-out desconto - Entrada
  O campo "Rubrica Normal (Provento ou Desconto) n o est mostrando o que est  gravado no campo IDRUBRICA da tabela LAYOUTCOLUNAS (No grid aparece) 
- Resolução da Pendência Nº 10792
  > Tela\Opçao No Sistema: Cadastros  / Entidades Externas / Lay-out desconto - Entrada
  Incluir no GRID, todos os campos que constam quando no modo "ALTERAR", colocando os mesmos ttulos dos campos
- Resolução da Pendência Nº 10805
  > Tela\Opçao No Sistema: Consultas na folha de benefícios 
  Nas consultas na folha de benefícios à valores pagos/descontados, incluir a
data início e a data final do benefício.
- Resolução da Pendência Nº 10828
  > Tela\Opçao No Sistema: Cadastro de Associação de rubricas por plano
  No cadastro de associação de rubricas por plano quando estiver parametrizado para não utilizar Atividade e Projeto deve-se colocar no campo UnidNegoc da tabela RubricaXPlano a atividade e projeto padrão.
 
- Resolução da Pendência Nº 11067
  > Tela\Opçao No Sistema: Consultas/Relatórios/Relação de Depósitos de Pagamento 
  Alterar o filtro da query deste relatorio para não pegar rubricas na histrubsal que estejam com o flgestorno marcado. Alterar o caption do form filtro, que está "Relatório de Portador Forma por Versão",enquanto que a opção 
- Resolução da Pendência Nº 11203
  > Tela\Opçao No Sistema: Fechamento de Convenios
  Testar o valor do campo unidnegoc (Atividade/Projeto).  Se estiver nulo, pegar o valor padrão, a exemplo do que já é feito na efetivação.
- Resolução da Pendência Nº 11265
  > Tela\Opçao No Sistema: Preparo
  Colocar flgprovisorio e flgconcessao na query para a regra de abono de beneficio.
================================================================================
CM$VER      3.03.00d    05/12/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6615
  > Tela\Opçao No Sistema: Relatório da Folha de Pagamentos
  Alteração para contemplar 2 números de processo de concessão de benefícios diferentes para o mesmo participante.
- Resolução da Pendência Nº 9204
  > Tela\Opçao No Sistema: Consultas/Relatórios
  Quando estiver parametrizado na tela de Parâmetros gerais, que o sistema deve exibir código e descrição externa da rubrica, todos os relatórios da folha devem obedecer este parâmetro. Atualmente, os relatórios estão exibindo os códigos e as descrições internas independente da parametrização
- Resolução da Pendência Nº 10238
  > Tela\Opçao No Sistema: Calculos da Folha / Previa
  Corrigir o problema do lançamento de rubricas previdenciarias na tmpdesc x base de irrf. 
Estes valores estão entrando em dobro na base de irrf.
- Resolução da Pendência Nº 10365
  > Tela\Opçao No Sistema: Cadastros/Entidas Externas/Lay Out Descontos -Entrada
  Na orelha "Informações Fechamento" existe a parametrização para dia de pagamento.
Ela deverá obedecer dia útil anterior ou posterior conforme determinação do usuário. 
- Resolução da Pendência Nº 10390
  > Tela\Opçao No Sistema: Várias
  Todas as telas que possuem seleção de Versão de Pagamento devem filtrar as versões que tiveram estorno completo. 
- Resolução da Pendência Nº 10612
  > Tela\Opçao No Sistema: Previa de Abono Anual
  Alteração na Previa de Abono para tratar descontos da Tmpdesc exclusivos de Abono Anual.
- Resolução da Pendência Nº 10621
  > Tela\Opçao No Sistema: Cadastros Fonte Pagadora
  Retirar esse cadastro, pois trata-se de uma tabela interna, conforme visto com o Fernando
- Resolução da Pendência Nº 10623
  > Tela\Opçao No Sistema: Cadastros Associação de Rubricas por Plano
  Incluir a seguinte informação na tela: "Clique a rubrica com o botão direito do mouse para parametrizá-la"
- Resolução da Pendência Nº 10627
  > Tela\Opçao No Sistema: Cadastros Grupo de Rubrica
  Retirar do menu e do título da tela a palavra "Cadastro de" pois já estamos no MENU DE CADASTROS
- Resolução da Pendência Nº 10628
  > Tela\Opçao No Sistema: Cadastros Rubricas Salariais
  Espelhar o mesmo nome do menu para o título da tela
- Resolução da Pendência Nº 10746
  > Tela\Opçao No Sistema: Cadastros Informações Individuais do Assistido
  Retirar o radiogroup "Informações referentes ao Salário Família"
- Resolução da Pendência Nº 10774
  > Tela\Opçao No Sistema: Relatório do Crédito de Benefício 
  O relatório do Crédito de Benefício por Banco da  folha de pagamento deverá estar disponível após ser gerada a prévia da folha de pagamento
- Resolução da Pendência Nº 10796
  > Tela\Opçao No Sistema: Cadastros  /  A o Judicial de IR 
  Igualar nome do menu com o t tulo da tela
- Resolução da Pendência Nº 10797
  > Tela\Opçao No Sistema: Cadastros  /  A o Judicial de IR 
  O campo CPF, est trazendo a MATRICULA da "Pessoa"
================================================================================
CM$VER      3.03.00a    28/11/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 5922
  > Tela\Opçao No Sistema: Tela de Preparo
  Desfazer preparo no Abono e Antec. deve ser tratado posteriormente.
- Resolução da Pendência Nº 10467
  > Tela\Opçao No Sistema: Previa Normal 
  Correção da Rotina da Prévia, pois o sistema não está considerando o código da natureza da rubrica lançado na tela do Cadastro de Rubricas.Descrição: Ao rodar a Prévia, o sistema lança para todas as rubricas o mesmo código de natureza da rubrica (0561) e não considera o código da rubrica de depósito Judicial(7431) que está parametrizado na tela do Cadastro de Rubricas Salariais. Isto pode ser visto logo ao processar a Prévia no campo CODIRRFDARF. Isto está impactando na Geração do DARF no módulo do IRRF. 
- Resolução da Pendência Nº 10538
  > Tela\Opçao No Sistema: Importação de Convênios e Exportação de Convênios
  Necessidade de importar informações referentes a Abono. 
- Resolução da Pendência Nº 10539
  > Tela\Opçao No Sistema: Todos as telas de relatório. 
  Versões com estorno completo, não deverm aparecer nas telas de relatório.
- Resolução da Pendência Nº 10542
  > Tela\Opçao No Sistema: Preparo de Manutenção de Benefícios
  Permitir o preparo de benefícios com o valor zero.
- Resolução da Pendência Nº 10543
  > Tela\Opçao No Sistema: Relatório de Entradas e saídas
  Existem 2 pessoas (matriculas 114108-00  e 114355-00) que não constam do relatório de saídas do mês de 09/2002 para o mês 10/2002.
Existem 2 pessoas (matrículas 114108-00 e 127845-00) que não constam do relatório de entradas do mês de 08/2002 para o mês 09/2002.
Verificar que as referidas matrículas possuem apenas pagamento retroativo no mês 09/2002.
- Resolução da Pendência Nº 10544
  > Tela\Opçao No Sistema: Relatorio de Folha de Pagamento de Beneficios
  Quando ocorre duas vezes o mesmo evento para um mesmo participante no mesmo mês, nos relatórios da folha (prévia e efetivação) a matrícula sai uma única vez, com apenas um dos benefícios e seus dados quando na realidade aconteceram dois eventos diferentes com valores diferentes ( exemplo : dib ), e na parte de histórico aparecem os valores todos juntos. Alterar o relatório para exibir estas informações dos processos em blocos distintos.
- Resolução da Pendência Nº 10545
  > Tela\Opçao No Sistema: Novo Relatorio de Totais de Suplementação Integral
  Fazer um novo nos moldes do relatório de totais de suplementação atual colocando SRB, INSS, SUPLEMENTACAO integrais.
- Resolução da Pendência Nº 10581
  > Tela\Opçao No Sistema: Calculos da folha/ Preparo
  O campo FOLHAORIGEM da tabela HSTCONTRIBPREV deve ser gravado com o tipo 'B' para que os acertos de reversão sejam feitos corretamente.
- Resolução da Pendência Nº 10603
  > Tela\Opçao No Sistema: Cadastros / Manual de lançamentos da Folha de Benefícios
  Não está sendo possível cancelar uma exclusão, esta operação esta sendo feita sem confirmação.
- Resolução da Pendência Nº 10610
  > Tela\Opçao No Sistema: Consulta da Prévia
  Exibir o codirrfdarf da tabela Previa.
- Resolução da Pendência Nº 10611
  > Tela\Opçao No Sistema: Cadastro Manual de Lançamentos da Folha
  Incluir nesta tela a manutenção do campo Idmotivo daTmpdesc.
- Resolução da Pendência Nº 10656
  > Tela\Opçao No Sistema: Preparo
  No preparo de Abono Anual executar a regra de beneficio minimo antes do calculo do valor do abono. Na previa de abono anual torna-se desnecessário se executar a regra de benefício minimo.
- Resolução da Pendência Nº 10682
  > Tela\Opçao No Sistema: Consulta da Prévia
  Acerto na consulta por matrícula para quando houver migração de plano.
================================================================================
CM$VER      3.03.00     27/11/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10422
  > Tela\Opçao No Sistema: CALCULOS DA FOLHA / PREVIA
  MENSAGEM DE ERRO QUANDO SE LANÇA UMA RUBRICA COM VALOR ZERADO.
A) ) Existem rubricas específicas quando a "pessoa" tem benefício da FUNDAÇÃO 
+ INSS (PENSAO ALIMENTICIA) e quando se tem apenas benefício do INSS 
(PENSAO  ALIMENTICA INSS) , de tal forma que o usuário não precise controlar se a 
"pessoa" em questão tem os dois ou apenas um (o INSS), nesse caso, as regras foram desenvolvidas de tal maneira que teste a ocorrência de suplementação e inss, onde sao rodadas duas regras e apenas uma lançará um valor correto, a outra lançara o valor ZERO 
B) É interessante que seja criado um parâmetro que permita se o operador da folha vai querer ver mensagem de erro referente ao lançamento de rubricas com valores ZERADOS 
- Resolução da Pendência Nº 10439
  > Tela\Opçao No Sistema: Consulta Estornos Processados 
  Correção da Consulta Estornos Processados, pois o sistema emite mensagem de "Invalid Number" devido não reconhecer o formato da matrícula digitada.
- Resolução da Pendência Nº 10548
  > Tela\Opçao No Sistema: Novas BPL´s
  Criar duas novas bpl´s para usar na folha de benefícios.
================================================================================
CM$VER      3.02.14p    19/11/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 5907
  > Tela\Opçao No Sistema: Tela de Preparo
  Elaboração da Rotina de Contribuição de Pensionistas (Preparo).
- Resolução da Pendência Nº 6614
  > Tela\Opçao No Sistema: Preparo
  Verificar problema relativo a existência de 2 numeros de processo de concessão de beneficio (Suplementação e INSS). Quando isto ocorre o preparo não calcula a contribuição associada.
- Resolução da Pendência Nº 10352
  > Tela\Opçao No Sistema: Cálculos da folha/folha extra
  mesmo quando o portador forma selecionado for para pagamento em cheque ou recibo avulso, o sistema exige que uma conta bancária seja cadastrada.
- Resolução da Pendência Nº 10421
  > Tela\Opçao No Sistema: CALCULOS DA FOLHA / PREVIA
  A ROTINA DE ESTRUTURAS DE CÁLCULO ESTÁ CONSIDERANDO O FAVORECIDO DE PENSAO ALIMENTÍCIA, ELA DEVE APENAS LEVAR EM CONSIDADERAÇÃO PARTICIPANTES ASSISTIDOS E PENSIONISTAS (POR MORTE)
- Resolução da Pendência Nº 10534
  > Tela\Opçao No Sistema: Todas
  Trocar o uso da variável prmFLGUSACODRUBEXT para o novo modo SistemaFolha.FLGUSACODRUBEXT.  
================================================================================
CM$VER      3.02.14o    19/11/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 3313
  > Tela\Opçao No Sistema: Cancelamento de beneficios
  Efetuar o cancelamento de beneficios para beneficiários que não tiverem mais elegibilidade.
- Resolução da Pendência Nº 9727
  > Tela\Opçao No Sistema: Importação  - Layout de Entrada e Saida 
  Criar campo adicional para conter informação referente a um codigo de controle instituido pela conveniada.
- Resolução da Pendência Nº 10508
  > Tela\Opçao No Sistema: Calculos da Folha/Preparo
  Estamos fazendo o teste do Abono anual, para apurar possíveis problemas e já na 1º tentativa de executar o preparo acusou erro. Para que eu possa prosseguir solicito uma analise do erro.
- Resolução da Pendência Nº 10516
  > Tela\Opçao No Sistema: Abertura e Fechamento de lotes.
  Necessidade de gerar novo tipo de lote "Acerto pós Morte".
================================================================================
CM$VER      3.02.14n    13/11/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 9958
  > Tela\Opçao No Sistema: Consultas / Relatórios / Analíticos / Pensão Alimentícia de Favorecidos
        O valor da pensão não está aparecendo.
Pendência: 
- Resolução da Pendência 10145
  > Tela\Opçao No Sistema: Cadastros / Grupos de Rubricas
        Colocar o fundo da caixa do campo código na cor cinza.
        O número do grupo (título) está cinza claro. Verificar qual é a cor padrão e alterar.
Pendência: 
- Resolução da Pendência 10196
  > Tela\Opçao No Sistema: Parâmetros do Sistema
        Permitir a inclusão de seis casas decimais para o índice da cpmf
Pendência: 
- Resolução da Pendência 10385
  > Tela\Opçao No Sistema: Relatório / Folha de Pagamento de Benefícios
        Erro ao tentar gerar o relatório.
Pendência: 
- Resolução da Pendência 10386
  > Tela\Opçao No Sistema: Relatório de Entradas e Saídas de Benefícios da Folha
        Está duplicando os valores.
Pendência: 
- Resolução da Pendência 10411
  > Tela\Opçao No Sistema: Consulta / Relatórios / Relatório de Estorno
        Corrigir relatório de Estorno, pois o sistema emite uma mensagem de falta de configuração ao tentar gerar o relatório.
Pendência: 
- Resolução da Pendência 10441
  > Tela\Opçao No Sistema: Calculos da Folha / Previa
	Alterar o SQL de entrada para as regras das rubricas que estão na tabela RUBRICAINDIV, incluindo os camopos necessários ao cálculo da rubrica de Contrtibuição de Auxilio Peculio
================================================================================
CM$VER      3.02.14m    13/11/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 9848
  > Tela\Opçao No Sistema: Relatórios/ Cartas para Banco 
  Permitir a geração de Cartas para Bancos numeradas e de acordo com os tipos de portador forma existentes em cada versão.
- Resolução da Pendência Nº 10076
  > Tela\Opçao No Sistema: Demonstrativo de Pagamento (Funcef)
  Terminar o contra-cheque da Funcef.
- Resolução da Pendência Nº 10167
  > Tela\Opçao No Sistema: Calculos da Folha - Definitiva
  Modificar o componente utilizado para filtrar o tipo de Folha a ser Processado.
- Resolução da Pendência Nº 10242
  > Tela\Opçao No Sistema: Consultas / Relatórios / Folha de Benefícios / Gerenciais / Relatório de Benefícios a Preparar
  Criar relatório que traga os beneficiários do próximo preparo. 
- Resolução da Pendência Nº 10260
  > Tela\Opçao No Sistema: Consultas / Relatorios / Operacionais
  Criar novo relatorio, utilizando a tela de filtro padrão de relatórios da folha, para relacionar as pessoas que tenham um valor liquido de pagamento compreendido numa determinada faixa de valores . Estes valores , minimo e máximo, deverão ser digitados na tela de filtro do relatório. O relatório deve permitir ser impresso apartir da tabela previa ou da tabela histrubsal.
- Resolução da Pendência Nº 10363
  > Tela\Opçao No Sistema: Calculos da Folha /Estorno
  Ao  estornar um pagamento na condição de pagamento indevido, deve gerar um novo PLNCODIGO. O fato de estar usando o mesmo da folha original esta gerando erro na contabilidade, pois esta lançando a contabilização do cancelamento na planilha original o que é errado.   
- Resolução da Pendência Nº 10387
  > Tela\Opçao No Sistema: Contabilização da Efetivação
  Na contabilizaçãoda folha utilizar a conta de líquido do benefício principal para as rubricas de desconto.
- Resolução da Pendência Nº 10389
  > Tela\Opçao No Sistema: Efetivação
  Efetuar a baixa do histórico de benefícios de INSS vinculados ao lote de processamento.
- Resolução da Pendência Nº 10400
  > Tela\Opçao No Sistema: Efetivação
  Na geração do contas a pagar apresenta mensagem de tipo de desembolso não parametrizado, no caso de apenas uma pessoa com o benefício nulo na previa. Deve-se pegar as parametrizações da previa se existir ou da rubricaxplano caso contrário.
================================================================================
CM$VER      3.02.14l    13/11/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10412
  > Tela\Opçao No Sistema: Consulta/Relatórios/Folha de Benefícios/Operacionais/Relação Individual de Rubricas
  Considerando que o Reprocessamento da folha gera uma nova linha na
HISTRUBSAL e grava na original o FLGESTORNO = 4, entendo que na filtragem deste relatório não deve considerar o FLGESTORNO = 4, portanto favor alterar a query.
================================================================================
CM$VER      3.02.14k    06/11/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 5797
  > Tela\Opçao No Sistema: RELATORIO E GRAFICO
  REPRESENTAÇÃO DA MENSALIDADE PATROCINADORA PENDENTE EM UMA DETERMINADA VERSÃO DA FOLHA
- Resolução da Pendência Nº 5805
  > Tela\Opçao No Sistema: RELATORIO
  RELATORIO DE RESIDUOS
- Resolução da Pendência Nº 10069
  > Tela\Opçao No Sistema: Calculos da Folha/Prévia/Normal
   A prévia esta apurando o valor líquido de forma indevida,ou seja um benefício que deveria ter como valor líquido 0 (zero) esta saindo com 0,01.
- Resolução da Pendência Nº 10072
  > Tela\Opçao No Sistema: Tela Preparo
  No processamento do preparo mensal de benefícios aparece uma mensagem de que não foi possível enviar contribuição para Tmpdesc.
- Resolução da Pendência Nº 10150
  > Tela\Opçao No Sistema: Previa
  Quando um participante possui benficiários em 2 lotes diferentes (manutenção e concessão),a previa está executando apenas o beneficiario do lote de concessão.
- Resolução da Pendência Nº 10357
  > Tela\Opçao No Sistema: Efetivação
  Na efetivação se não encontrar a conta de líquido por benefício obter a conta de líquido do plano.
================================================================================
CM$VER      3.02.14j    28/10/2002
--------------------------------------------------------------------------------
Pendência: 9549
- Resolução da Pendência 
  > Tela\Opçao No Sistema: Cálculos da Folha / Prévia / Pagamentos Pendentes
	Ao sair da tela e entrar novamente, o botão "PROCESSAR" fica desabilitado. Para este botão ficar habilitado é necessário digitar a matrícula novamente para a coluna de Pagamentos Pendentes.
Pendência: 
- Resolução da Pendência 9660
  > Tela\Opçao No Sistema: Relatório de Entradas e Saidas
	Correções diversas
Pendência: 
- Resolução da Pendência 9804
  > Tela\Opçao No Sistema: Consultas / Relatórios / Resumo de Rubricas
	Filtrar apenas os lotes que já tenham sido rodado a prévia.
Pendência: 
- Resolução da Pendência 9919
  > Tela\Opçao No Sistema: Consultas/Relatorios/Benefícios/ Benefícios Retidos
	Acrescentar ao relatorio os campos Matrícula, Data da Retenção; Permitir impressão de todas as PAtrocinadoras ao mesmo tempo e mostrar o nome do Recebedor ao invés do Participante, em caso de falecimento.
================================================================================
CM$VER      3.02.14i    18/10/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 9019
  > Tela\Opçao No Sistema: Calculos da Folha / Fechamento de Convenios
	Dar opção de escolha do preparo da Ficha Financeira por Favorecido e por convênio.
	Se for por Favorecido ter uma outra opção para montar uma única Ficha Financeira.
================================================================================
CM$VER      3.02.14h    14/10/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 9807
  > Tela\Opçao No Sistema: Consulta/Relatórios/Folha de Benefícios/Operacionais/Relação individual de rubricas
	O filtro não está considerando o campo FLGESTORNO com os valores 2, 3 e 4.
Pendência: 
- Resolução da Pendência 7369
  > Tela\Opçao No Sistema: 
	Novo Cadastro/Processo de Ação Judicial de IRRF. 
================================================================================
CM$VER      3.02.14g    11/10/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 9623
  > Tela\Opçao No Sistema: Contracheques
	Emitimos contra-cheques  em dois lotes, um para VR e Pinheiral e outro para as demais cidades.
	Quando temos que emitir os de VR e Pinheiral clicamos nessas duas cidades e pronto. Mas quando temos que emitir para as demais cidades, se selecionarmos todas as cidades e depois tentarmos retirar a seleção de VR e Pinheiral, o sistema retira de todas as cidades, ou seja, para que possamos emitir o contra-cheque das demais cidades temos que clicarmos cidade por cidade,
	exceto VR e Pinheiral. 
Pendência: 
- Resolução da Pendência 6612
  > Tela\Opçao No Sistema: Emissão de Contra-Cheque
	Criar a rotina  de emissão de contra-cheques para a FUNCEF
Pendência: 
- Resolução da Pendência 9768
  > Tela\Opçao No Sistema: Preparo
	Acrescentar na qry de cálculo de contribuição o campo valorsrb
Pendência: 
- Resolução da Pendência 9769
  > Tela\Opçao No Sistema: Efetivação
	Acerto na qry de efetivação da folha. O campo Flgtipofolha está como FlgtipFolha 
================================================================================
CM$VER      3.02.14f    04/10/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 8694
  > Tela\Opçao No Sistema: Cadastro de Compensação de IRRF
	Customização da rotina de controle  de compensação  judicial de IRRF.
================================================================================
CM$VER      3.02.14e    02/10/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência  8011
  > Tela\Opçao No Sistema: Relatórios / Cartas para o Banco
	Criação de um Relatório de Cartas para Banco, seguindo as exigências abaixo e ao modelo do anexo. 
	- Logotipo da REFER 
	- Data (Informada pelo sistema) 
	- Nº da Carta (Neste campo deverá existir a possibilidade do usuário digitar o nº da carta, pois este é um número interno deles) 
Pendência: 
- Resolução da Pendência 8096
  > Tela\Opçao No Sistema: Fechamento de Convenios
	Implementar o tratamento de excesso de debito e o tratamento de convenios continuados 
Pendência: 
- Resolução da Pendência 9536
  > Tela\Opçao No Sistema: Relatórios / Folha de Pagamentos de Benefícios
	Correção do erro durante a geração do relatório "Folha de Pagamento de Benefícios" de lotes da Prévia. 
	A mensagem de erro só aparece quando se trata de lotes de Prévia. No monitor dá para verificar que é executada uma query que não encontra nenhum registro e logo em seguida ocorre o erro.
Pendência: 
- Resolução da Pendência 9466
  > Tela\Opçao No Sistema: Calculos da Folha/Definitiva
	Não esta aparecendo os lotes de Folha extra e Pendentes na Definitiva. 
Pendência: 
- Resolução da Pendência 9546
  > Tela\Opçao No Sistema: Cálculos da Folha/Prévia 
	Deverá ser criado condições para informar a data final da "moléstia grave"  de um participante. Os sistemas (Folha/Admprev) deverá, automaticamente, identificar essa data e desfazer esta condição, voltado a pessoa a ser tributada.
Pendência: 
- Resolução da Pendência 5903
  > Tela\Opçao No Sistema: Calculos da Folha / Previa
	Processo de Adiantamento de Benefícios não concedidos
Pendência: 
- Resolução da Pendência 9252
  > Tela\Opçao No Sistema: Consulta / relatórios / Operaiconais / Relação Individual de Rubricas
	Quando geramos o relatório "por mês", no cabeçalho a Referência está saindo a descrição do lote mais o mês de referência. Solicito aparecer somente o mês de referência quando for consulta "por mês".
================================================================================
CM$VER      3.02.14d    18/09/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 8771
  > Tela\Opçao No Sistema: Cadastros / Importação de Arquivos
	Comparar o caractere de natureza especificado no layout de entrada com o caractere especificado no arquivo para definir se a rubrica é de devolução ou pagamento. 
Pendência: 
- Resolução da Pendência 5841
  > Tela\Opçao No Sistema: Todas
	Rever ordenação de informações nos MontaSelects.
Pendência: 
- Resolução da Pendência 6444
  > Tela\Opçao No Sistema: Efetivação da Folha
	O sistema não permite efetivar vários lotes de Folha Extra numa única versão. 
Pendência: 
- Resolução da Pendência 8863
  > Tela\Opçao No Sistema: Consultas / Histórico de Pagamentos da Folha
	A  busca está duplicando o resultado em função da despadronização da gravação do campo IDPESSJUR das rubricas geradas pelo sistema FOLHA e a rubrica de salário gerada pelo sistema ADMPREV.
Pendência: 
- Resolução da Pendência 9158
  > Tela\Opçao No Sistema: Consultas / Histórico de Pagamentos da Folha
	Ao consultar esta tela, o usuário tem dificuldades para saber qual versão foi estornada para aquele determinado participante.
Pendência: 
- Resolução da Pendência  6985
  > Tela\Opçao No Sistema: Consultas / Relatorios / Gerenciais / Relatorio do Preparo
	O relatorio não está mostrando todas as contribuições que o participante tem a pagar, por exemplo, se um particpante em Auxilio Doença, de acordo com o regulamento deve pagar 3 contribuições, embora o envio para TMPDESC esteja OK, o relatório só está mostrando uma delas.
Pendência: 
- Resolução da Pendência 8385
  > Tela\Opçao No Sistema: Cadastros / Alteração do Portador Forma
	Apesar do acesso estar habilitado, o usuário após informar a matrícula do participante não consegue alterar o portador forma, pois o botão ALTERAR encontra-se inibido. Caso específico para diferençca de reserva (revisão de benefício).
Pendência: 
- Resolução da Pendência 6343
  > Tela\Opçao No Sistema: Previa de Pagamentos Pendentes
	Na geração da Prévia de Pagamentos Pendentes, foram detectados alguns erros. São eles: 
	Os dados bancários do participante não aparecem no demonstrativo da Prévia, aparece somente a Agência Centralizadora. 
Pendência: 
- Resolução da Pendência 8575
  > Tela\Opçao No Sistema: Relatorios / Operacionais / Folha de Pagamentos de Beneficios
	Atualmente este relatório só é gerado para Folha Extra e Folha Normal.
Pendência: 
- Resolução da Pendência 8863
  > Tela\Opçao No Sistema: Consultas / Historico de Pagamentos da Folha
	A  busca está duplicando o resultado em função da despadronização da gravação do campo IDPESSJUR das rubricas geradas pelo sistema FOLHA e a rubrica de salário gerada pelo sistema ADMPREV.
Pendência: 
- Resolução da Pendência 9158
  > Tela\Opçao No Sistema: Consultas / Historico de Pagamentos da Folha
	Ao consultar esta tela, o usuário tem dificuldades para saber qual versão foi estornada para aquele determinado participante. 
================================================================================
CM$VER      3.02.14c    13/09/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 9239
  > Tela\Opçao No Sistema: Consulta / Relatórios / Pensão Alimentícia
	- É preciso colocar informação de matrícula e portador forma de pagamento no relatório. Retirar o mês pagamento do detalhe e colocar no cabeçalho.
Pendência: 
- Resolução da Pendência 9240
  > Tela\Opçao No Sistema: Consulta / Relatórios / Pensão Alimentícia por Banco
	- Não obrigar no filtro a seleção da patrocinadora;
	  Colocar informação de matrícula e portador forma de pagamento no relatório.
Pendência: 
- Resolução da Pendência 7745
  > Tela\Opçao No Sistema: Cálculos da Folha / Efetivação.
	- O campo DATARECEBIMENTO na tabela TMPDESC esta gravando a data em que foi processada a efetivação.
          O correto é a data efetiva do pagamento, ou seja, data que colocamos no combo "Previsão  Pagamento" quando vamos processar a definitiva.
Pendência: 
- Resolução da Pendência 8106
  > Tela\Opçao No Sistema: Cálculos da Folha / Previa / Desfazer Preparo
	- Colocar opção para desfazer preparo por benefício.
================================================================================
CM$VER      3.02.14b    11/09/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 8606
  > Tela\Opçao No Sistema: Cadastros / Informações Individuais do Assistido.
   - Mostrar informações referentes ao INSS
   - Só permitir a alteração do Nº de dependentes de IRRF se a Fundação não optou por calcular o numero de dependentes automaticamente (ver parametro correspondente).
   - Passar a mostrar a quantidade de dependentes de Salario Familia.
   - Só permitir a alteração do Nº de dependentes de SF se a Fundação não optou por calcular o numero de dependentes automaticamente (ver parametro correspondente).
   - Alterar o MontaSelect para permitir consulta a tabela DEPENTIT (Pensionistas).
Pendência: 
- Resolução da Pendência 8531
  > Tela\Opçao No Sistema: Cadastros/Rubricas Salariais
   - Criar grid para visualização de qual estrutura de cálculo a rubrica está vinculada.
Pendência: 
- Resolução da Pendência 9183
  > Tela\Opçao No Sistema: Consulta / Pagamento de Convenio
	- Alguns usuários não podem ter acesso ao menu Consulta/Pagamento de Convenio. No grupo de acesso ao usuário deverá ter a opção de estar ou não desabilitado.  
Pendência: 
- Resolução da Pendência 9185
  > Tela\Opçao No Sistema: Relatórios / Resumo de Rubricas e 2ª Via do Contracheque
	- Criar um parâmetro para escolha da rubrica (interna ou externa) , para o relatório da 2ª via do contracheque e para emissão do contracheque trimestral.
Pendência: 
- Resolução da Pendência 9205
  > Tela\Opçao No Sistema: Demonstrativo \ 2º via de Contra Cheque
	- Problema de duplicidade no relatório de 2º via de contra cheque.
================================================================================
CM$VER      3.02.14a    06/09/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 8577
  > Tela\Opçao No Sistema: Prévia/ Folha Extra
  A tela de Prévia Folha Extra passou a exigir a informação do Portador Forma. Para o usuário de Folha de Benefícios, o portador forma é um dado desconhecido, impactando na maioria das vezes na informação incorreta deste campo e atrasando a efetivação deste pagamento. Retirar a obrigatoriedade seria uma saída.
- Resolução da Pendência Nº 8976
  > Tela\Opçao No Sistema: 2º via de contracheque
  Estou enviando a query referente a 2º do contracheque a fim de resolver o problema de algumas pessoa que o número da agencia da Histrubsal não confere com o número da agencia na Agenciabancaria. Nestes casos, não se consegue tirar a 2º via.
================================================================================
CM$VER      3.02.14     06/09/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 8482
  > Tela\Opçao No Sistema: Consultas / Histórico de Pagamento da Folha
        Permitir visualização da data de pagamento na Consulta Histórico da Folha.
Pendência: 
- Resolução da Pendência 7276
  > Tela\Opçao No Sistema: Calculos da Folha / Preparo
        Relatório do processo está duplicando o total de contribuição quando existem 2 benefícios
Pendência: 
- Resolução da Pendência 7284
  > Tela\Opçao No Sistema: Cálculos da Folha / Prévia / Folha Extra
        A prévia da Folha Extra apresentou constraint da unicidade, quando estar parametrizada a opção de não apagar a Prévia.
Pendência: 
- Resolução da Pendência 7282
  > Tela\Opçao No Sistema: Cálculos da Folha / Definitiva
        Na ocorrência de um erro na efetivação fazer ou desfazer automaticamente.  
Pendência: 
- Resolução da Pendência 8486
  > Tela\Opçao No Sistema: Consultas / Histórico de Pagamento da Folha
        Otimizar a Consulta Histórico da Folha para quem possui mais de um recebedor.
Pendência: 
- Resolução da Pendência 3334
  > Tela\Opçao No Sistema: Relatório de Arquivo Texto
        Pegar a coluna inicial e tamanho de campo de valor através de uma parametrização do PORTADORFORMA.
Pendência: 
- Resolução da Pendência 9014
  > Tela\Opçao No Sistema: Cadastros / Rubricas Individuais
        Folha de 08/2002, não esta disponibilizando as consignatárias para a inclusão de rubricas individuais. Deixou de funcionar. Provavelmente houve alguma alteração. Em versões mais antigas esta funcionando.
- Resolução da Pendência Nº 8848
  > Tela\Opçao No Sistema: Consulta/Relatório/Operacionais/Resumo de Rubricas
  No relatório de resumo de rubricas na previa permitir vários lotes. Alterar o filtro de relatório padrao para substituir o dblookupcombobox de lotes por um checklistbox, usando a clausula IN na query. Fazer o mesmo se for folha efetivada, neste caso substituindo o dblookupcombobox de versões por um checklistbox.
- Resolução da Pendência Nº 8853
  > Tela\Opçao No Sistema: Consulta do Histórico e Consultada da Prévia
  Ordernar também por SeqRubrica
- Resolução da Pendência Nº 8969
  > Tela\Opçao No Sistema: Cadastro/ Rubricas Individuais
  Após informar o nº de parcelas, o sistema calcula automaticamente a data término para o desconto. Sendo que quando a rubrica esta marcada para ser utilizada no abono anual, o sistema deveria descontar as parcelas no abono.
================================================================================
CM$VER      3.02.13t    02/09/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 8847
  > Tela\Opçao No Sistema: Consulta/Relatórios/Operacionais/Folha de Pagamento de Benefícios
  Folha de Pagamento de Beneficios (FPRelPrevia) - criar opção de ordenação por Inscrição, por Matricula ou por Nome sem a ordenação de patro e plano. Nestas situações o relatório não pode grupar e totalizar por plano e patro. Deve apenas totalizar no final.
- Resolução da Pendência Nº 8981
  > Tela\Opçao No Sistema: Cálculos da Folha / Prévia / Normal
  A partir da Folha de 08/2002, o cálculo da Pensão passou a ficar errado,
deixando de considerar as rubricas de exceções. Houve alguma alteração no
Sistema que provocou o erro.
- Resolução da Pendência Nº 8989
  > Tela\Opçao No Sistema: Consultas/Histórico de Pagamento da Folha
  Deixou de trazer os valores Informativos.
A partir da Folha de 08/2002, deixou de demonstrar os valores informativos (Capital seguro,etc...).
Houve alguma alteração na query provocando o sucedido. Em versões mais antiga esta aparecendo corretamente.
- Resolução da Pendência Nº 8990
  > Tela\Opçao No Sistema: Consultas/Histórico de Pagamento da Folha
  "Lookup tble is not active". A partir da Folha de 08/2002, a opção para selecionar o Recebedor deixou de funcionar. Provavelmente houve alguma alteração no sistema. Em versões mais antigas esta funcionando. 
================================================================================
CM$VER      3.02.13s    30/08/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 8532
  > Tela\Opçao No Sistema: Cadastros / Estruturas de Cálculo
	O combo da "Regra de Cálculo" não está respeitando o Grupo cadastrado nos parâmetros do Sistema;
	Erro ao inserir uma Estrutura de Cálculo, o IDRUBRICA que está sendo passado está trocado com o CODPROVDESC, além disso, ao fazer um insert manual pelo sqlplus, foi verificado um erro na tela no Combo "Rubrica de Exibição". A inclusão de rubricas a associar tmb apresenta problema.
Pendência: 
- Resolução da Pendência 8697
  > Tela\Opçao No Sistema: Cadastros / Estruturas de Cálculo
	Erro na alteração de rubricas previamente cadastradas, problemas na alteração dos grupos, bem como na exclusao de rubricas.
Pendência: 
- Resolução da Pendência 8806
  > Tela\Opçao No Sistema: Cálculos / Previa Normal
	O FLGSRB da Tabela HISTRUBSAL, dos benefícios preparados pela Folha, foi gravado = 0.
Pendência: 
- Resolução da Pendência 7527
  > Tela\Opçao No Sistema: Calculos da Folha / Previa.
	A previa esta montado a Base para calculo do IRRF indevidamente quando temos uma beneficiaria que esta tendo um pagamento de Abono referente ao beneficio do ex-associado.
Pendência: 
- Resolução da Pendência 8865
  > Tela\Opçao No Sistema: Cadastros / Rubricas Individuais
	Esta trazendo em duplicidade os nomes.
Pendência: 
- Resolução da Pendência 7330
  > Tela\Opçao No Sistema: Previa / Folha Extra
	Permitir calcular a folha extra para beneficiarios.
Pendência: 
- Resolução da Pendência 6518
  > Tela\Opçao No Sistema: Previa / Pagamentos Pendentes
	Está rateando o valor da pensão por benefíciário.
================================================================================
CM$VER      3.02.13r    27/08/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 5808
  > Tela\Opçao No Sistema: Consultas / Relatórios
	Implementação do RELATORIO DE TOTAIS DE SUPLEMENTAÇÕES POR PLANO E POR BENEFICIO
Pendência: 
- Resolução da Pendência 5792
  > Tela\Opçao No Sistema: Consultas / Relatórios
	Implementação do RELATORIO DE SUPLEMENTAÇÕES E DESCONTOS TOTALIZADOS POR PLANO
Pendência: 
- Resolução da Pendência 5793
  > Tela\Opçao No Sistema: Consultas / Relatórios
	Implementação do RELATORIO DE SUPLEMENTAÇÕES E DESCONTOS TTOTALIZADOS POR BENEFICIOS
Pendência: 
- Resolução da Pendência 8529
  > Tela\Opçao No Sistema: Cadastros / Alteração do Portador Forma de Pagamento
	Permitir a procura de informações do Pensionista (matricula e nome).
Pendência: 
- Resolução da Pendência 8601
  > Tela\Opçao No Sistema: Parametros Globais do Sistema
	1) Todos os controles que tratam de rubricas devem respeitar a parametrização de interno e externo de rubricas.
	2) A ordenação de todos os comboboxes deve ser por ordem alfabetica da descricao da rubrica.
	3) Alterar o caption "Valor da CPMF" para "Indice da CPMF". 
Pendência: 
- Resolução da Pendência 8734
  > Tela\Opçao No Sistema: CADASTROS/GRUPOS DE RUBRICA 
	Na rotina do GRUPO DE RUBRICA deverá ser possível indicar a "Linha do Informe de Rendimento" do grupo, ou seja, uma vez cadastrada a linha X no grupo "nonononono". Quando o usuário alterar a linha nesse grupo, todas as rubricas associadas a ele (grupo) terão sua linha de informe de rendimento alterada tmb.
================================================================================
CM$VER      3.02.13q    22/08/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 8604
  > Tela\Opçao No Sistema: Cadastros / Rubricas Individuais
	1) Aba de Outras Rubricas : O como de rubrica a processar só está mostrando o código da rubrica.
	2) Alterar o Montaselect para permitir buscar pensionistas na tabela DEPENTIT.
Pendência: 
- Resolução da Pendência 8748
  > Tela\Opçao No Sistema: Cadastros / Associação de Rubricas por Benefícios.
	Erro ao incluir a rubrica, o sistema está passando o CODPROVDESC como se fosse o IDRUBRICA (IDPROVENTO da PROVDESC)
================================================================================
CM$VER      3.02.13o    20/08/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 7876
  > Tela\Opçao No Sistema: Cálculos da Folha / Previa / Pagamentos Pendentes
	Ao estornar um pagamento, com a condição de colocá-lo como pendente para futuro pagamento. Quando fomos efetuar o pagamento não apareceu na tela as pessoas estornadas pois a query abaixo esta selecionando lotes.
Pendência: 
- Resolução da Pendência 8107
  > Tela\Opçao No Sistema: Cálculos da Folha / Previa
	A opção de desfazer preparo não está desfazendo o valor do Auxilio Doença.
Pendência: 
- Resolução da Pendência 6617
  > Tela\Opçao No Sistema: Calculos da Folha / Previa
	Criar rotina de cálculo específica para calcular as margens consignáveis de 30% e 70%.
Pendência: 
- Resolução da Pendência 8482
  > Tela\Opçao No Sistema: Consulta Historico da Folha.
	Permitir visualização da data de pagamento na Consulta Histórico da Folha.
Pendência: 
- Resolução da Pendência 8648
  > Tela\Opçao No Sistema: Consulta Historico da Folha.
	Retirar a função TO_CHAR da query principal , pois a mesma não funciona com versões do Oracle anteriores a 8.0
Pendência: 
- Resolução da Pendência 8588
  > Tela\Opçao No Sistema: Consultas / Relatórios / Folha de Pagamento de Benefícios
	Colocar um datamodule para este relatório.
================================================================================
CM$VER      3.02.13n    16/08/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 8306
  > Tela\Opçao No Sistema: 
	Possibilitar o agrupamento de rubricas
Pendência: 
- Resolução da Pendência 5802
  > Tela\Opçao No Sistema: GRAFICOS E RELATORIOS
	Implementação do Relatório de VALORES DO INSS CONSIDERADOS PELA FUNDAÇÃO NOS BENEFICIOS PAGOS EM UM DETERMINADO PERIODO
        Implementação do Gráfico de VALORES DO INSS CONSIDERADOS PELA FUNDAÇÃO NOS BENEFICIOS PAGOS EM UM DETERMINADO PERIODO
Pendência: 
- Resolução da Pendência 7277
  > Tela\Opçao No Sistema: Relatório Bancário
	Acerto no relatório de depósito bancário para retirar as pessoas estornadas.
Pendência: 
- Resolução da Pendência 5807
  > Tela\Opçao No Sistema: relatórios / Entradas e Saidas
	MODIFICAR RELATORIO DE ENTRADAS E SAIDAS
Pendência: 
- Resolução da Pendência 5809
  > Tela\Opçao No Sistema: relatórios / Entradas e Saidas
	MODIFICAÇÃO NO RELATORIO DE ENTRADAS E SAIDAS
Pendência: 
- Resolução da Pendência 8460
  > Tela\Opçao No Sistema: Consulta / Relatórios / Operacionais / Relação Individual de Rubricas - CBS
	Correção da query quando a escolha for para uma folha já efetivada deveria usar a tabela HISTRUBSAL  e o campo MESCOBRANCA.
Pendência: 
- Resolução da Pendência 8584
  > Tela\Opçao No Sistema: Calculos da Folha / Definitiva
	Gravação na HSTBENEFBFCIARIO campo VLBENEFPGTO errado.
================================================================================
CM$VER      3.02.13m    14/08/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 7212
  > Tela\Opçao No Sistema: Estorno
	Esta lancando a contabilização invertida.
Pendência: 
- Resolução da Pendência 8332
  > Tela\Opçao No Sistema: Consultas / Relatórios / Associação Contábil / Financeiro
	Criar um relatório que demonstre, apenas para as rubricas de folha de benefícios ( tambem não considerar as rubricas previdenciarias), as parametrizações contábeis na tabela RUBRICAXPLANO.
Pendência: 
- Resolução da Pendência 5912
  > Tela\Opçao No Sistema: Tela de Cadastro de Rubricas Individuais
	Permitir reajuste dos valores na Rubrica Individual.
Pendência: 
- Resolução da Pendência 5800
  > Tela\Opçao No Sistema: Relatórios
	Implementação do Relatório de QUANTIDADE MENSAL DE PARTICIPANTES EM UM DETERMINADO BENEFICIO 
Pendência: 
- Resolução da Pendência 5801
  > Tela\Opçao No Sistema: GRAFICOS E RELATORIOS
	Implementação do Relatório de QUANTIDADE E VALORES DE SUPLEMENTAÇÕES DE UM DETERMINADO BNENEFICIO.
	Implementação do Gráfico de QUANTIDADE E VALORES DE SUPLEMENTAÇÕES DE UM DETERMINADO BNENEFICIO
Pendência: 
- Resolução da Pendência 5802
  > Tela\Opçao No Sistema:  GRAFICOS E RELATORIOS 
	Implementação do Relatório de VALORES DO INSS CONSIDERADOS PELA FUNDAÇÃO NOS BENEFICIOS PAGOS EM UM DETERMINADO PERIODO
	Implementação do Gráfico de VALORES DO INSS CONSIDERADOS PELA FUNDAÇÃO NOS BENEFICIOS PAGOS EM UM DETERMINADO PERIODO
Pendência: 
- Resolução da Pendência 5804
  > Tela\Opçao No Sistema: GRAFICOS E RELATORIOS
	Implementação do Relatório de QUANTIDADE TOTAL DE PARTICIPANTES POR PATROCINADORA EM UMA DETERMINADA VERSÃO DA FOLHA
	Implementação do Gráfico de QUANTIDADE TOTAL DE PARTICIPANTES POR PATROCINADORA EM UMA DETERMINADA VERSÃO DA FOLHA
Pendência: 
- Resolução da Pendência 5796
  > Tela\Opçao No Sistema: GRAFICOS
	Implementação do Gráfico de % POR TIPO DE BENEFICIOS REFERENTE A UMA DETERMINADA VERSÃO DA FOLHA
Pendência: 
- Resolução da Pendência 5794
  > Tela\Opçao No Sistema: GRAFICOS
	Implementação do Gráfico de % POR PLANO DE BENEFICIOS REFERENTES A UMA DETERMINADA VERSÃO DA FOLHA
Pendência: 
- Resolução da Pendência 5799
  > Tela\Opçao No Sistema: GRAFICOS
	Implementação do Gráfico de DEMONSTRATIVO ANUAL DAS SUPLEMENTAÇÕES, DESCONTOS E LIQUIDOS DE UM DETERMIONADO BENEFICIO
Pendência: 
- Resolução da Pendência 5798
  > Tela\Opçao No Sistema: GRAFICOS
	Implementação do Gráfico de DEMONSTRATIVO DOS DESCONTOS DE UMA DETERMINADA VERSÃO DA FOLHA	
Pendência: 
- Resolução da Pendência 7283
  > Tela\Opçao No Sistema: Casdastro / Abertura de Lotes
	Verificação do valor default para o campo FLGTIPOFOLHA na Tabela CTRLINTERFACE.
Pendência: 
- Resolução da Pendência 7819
  > Tela\Opçao No Sistema: Cálculos da Folha / Previa / Folha Extra
	Esta dando erro ao inserir na prévia ao processar a Folha Extra.
Pendência: 
- Resolução da Pendência 7285
  > Tela\Opçao No Sistema: Estorno
	Estorno completo não grava FLGVOLTATMP=0 na tabela CTRLINTERFACE.
================================================================================
CM$VER      3.02.13l    07/08/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 8305
  > Tela\Opçao No Sistema: Cadastro de Rubrica Individual
	Após o cadastramento a rubrica fica visível no grid principal. Ao sair e entrar novamente na tela a rubrica não aparece mais. Ao cadastrar uma nova rubrica, aparece a primeira rubrica cadastrada inicialmente. Isto só ocorre no caso de pensionista. Se a rubrica for para o participante o erro não ocorre.
Pendência: 
- Resolução da Pendência 8344
  > Tela\Opçao No Sistema: Cadastros / Alimentados
	Permitir que a consulta do Alimentado seja também através do CPF.
Pendência: 
- Resolução da Pendência 8330
  > Tela\Opçao No Sistema: Cadastros / Importação
	Implementar uma máscara para formatação da Matricula. 
Pendência: 
- Resolução da Pendência 7609
  > Tela\Opçao No Sistema: Cálculos da Folha  / Preparo
	A folha esta gravando o salário de contribuição proporcional aos dias finais, independente se o mês em questão é o da data final.
================================================================================
CM$VER      3.02.13k    02/08/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 8231
  > Tela\Opçao No Sistema: Cadastro / Depósito Judicial a Ordem da Justiça Federal 
	Para os casos de Pensionista com reteção de IR para depósito judicial, apesar do titular estar cadastrado, o cálculo não está sendo feito para estes casos.
Pendência: 
- Resolução da Pendência 8235
  > Tela\Opçao No Sistema: Calculos da Folha / Previa Normal
	Implementar a rotina de Calculo do Salario Familia.
Pendência: 
- Resolução da Pendência 7302
  > Tela\Opçao No Sistema: Casdastros / Informações Individuais do Assistido
	Quando se informa que um participante possui IR Total o campo VLRINSS retorna 0 na sql para rodar as regras vindas das rubricas individuais.
Pendência: 
- Resolução da Pendência 7898
  > Tela\Opçao No Sistema: Cadastros / Alteração da Forma de Pagamento
	Só permite a alteração do portadorforma do Titular. Alterar para permitir tambem para Pensionista, Alimentado e Alimentante.
Pendência: 
- Resolução da Pendência 6635
  > Tela\Opçao No Sistema: Cadastro de Rubricas Individuais
	Implementação da natureza da rubrica no campo Rubrica a Processar , na pasta de Outras Rubricas .
Pendência: 
- Resolução da Pendência 7271
  > Tela\Opçao No Sistema: 2ª Via do Contracheque.
	A query esta trazendo duas vezes o participante. Falta a condição PARTPREVPLAN.FLGDESATIVADO = 0.
================================================================================
CM$VER      3.02.13j    30/07/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 7878
  > Tela\Opçao No Sistema: Cadastro/ Deposito Judicial a Ordem Justiça Federal
	Gerar a informação do valor do IR para os casos de depósito judicial.
Pendência: 
- Resolução da Pendência 8205
  > Tela\Opçao No Sistema: CADASTROS / RUBRICAS INDIVIDUAISl
	AO INSERIR UMA RUBRICA INDIVIDUAL  DE PENSAO ALIMENTÍCIA, O CAMPO RUBRICAPROVENTOPA Não está sendo gravado na Tabela RUBRICAXPESS. Além disso, é necessário que as duas rubricas apareçam no grid sem estar no modo ALTERAR, com os títulos idênticos aos daqueles quando em modo de inclusão/alteração (radiogroup Rubricas).
Pendência: 
- Resolução da Pendência 8203
  > Tela\Opçao No Sistema: Cadastros / Associação de Rubricas por Regra
	Deverá constar o cód. externo da rubrica depois que vc inserir a mesma. Se precisar fazer uma exclusão e constar uma rubrica com o mesmo nome, não vai saber qual das duas vai ter que excluir. 
Pendência: 
- Resolução da Pendência 8008
  > Tela\Opçao No Sistema: Cadastros / Alimentados
	Verificar as informações do tipo do grid, tipo: 'residencial', 'entrega', 'comercial', 'cobrança' e correspondência'. Tais informações são redundantes, pois já existe "Tipo de Benefício".
Pendência: 
- Resolução da Pendência 7532
  > Tela\Opçao No Sistema: Cadastros / Alteração do Portador Forma de Pagamento
	Não esta aceitando a alteração.
Pendência: 
- Resolução da Pendência 8221
  > Tela\Opçao No Sistema: Relatório folha previa 
	Não aparece lote de folha extra.
Pendência: 
- Resolução da Pendência 7604
  > Tela\Opçao No Sistema: Demostrativo de pagamento de benefício 2ª via
	Apresenta Rubricas em duplicidade.
Pendência: 
- Resolução da Pendência A definir
  > Tela\Opçao No Sistema: Sistema / Parametros
	Criação de novo parametro para permitir que sejam abertos N lotes de manutenção simultaneamente.
Pendência: 
- Resolução da Pendência A definir
  > Tela\Opçao No Sistema: Cadastros / Manutenção do Historico de Beneficios
	Inclusão dos seguintes campos : ValorSRB, ValorIntegral, ValorTotal, ValorOp1, ValorOp2, ValorOp3 e ValorPrevMin.
================================================================================
CM$VER      3.02.13i    24/07/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 7929
  > Tela\Opçao No Sistema: Cadastro/ Informações Individuais do Assistido
	Quando informo que campo FLGSOMAIRSUPINSS = 1,  o IRRF não é calculado somando as bases (INSS + Suplementação) e não está calculando CPMF do participante.
Pendência: 
- Resolução da Pendência 8188
  > Tela\Opçao No Sistema: Cadastros / Associação de Rubricas por Regra
	Não é possível alterar uma rubrica que já foi inserida. "No lookup table specified".
Pendência: 
- Resolução da Pendência 7664
  > Tela\Opçao No Sistema: Todas as Telas e Relatórios do Sistema
	Alterar todos os relatórios e consultas que exibam código/descrição de rubricas para seguir a parametrização referente a forma de exibição corrente.
Pendência: 
- Resolução da Pendência 8120
  > Tela\Opçao No Sistema: Cadastro de Rubricas Individuais
	 Não esta sendo possível inserindo nenhuma rubrica na tela, ainda que se tenha associado na tela Cas. Ass. Rub. p/ Regra. 
Pendência: 
- Resolução da Pendência 8197
  > Tela\Opçao No Sistema: Cadastro de Rubricas Individuais
	Este Cadastro estava tentando gravar um valor nulo.
================================================================================
CM$VER      3.02.13h    23/07/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência 8013
  > Tela\Opçao No Sistema: Consultas / Relatórios
	Correção do filtro do Relatório de Importação de Convênios, pois está trazendo também informações de matrículas desativadas em um plano. O impacto é que no relatório as informações saem em duplicidade, comprometendo o valor total do recebimento.
Pendência: 
- Resolução da Pendência 8014
  > Tela\Opçao No Sistema: Consultas / Relatórios / Resumo de Rubricas
	Inserir logomarca da Fundação no Cabeçalho do Relatório Resumo de Rubricas.
Pendência: 
- Resolução da Pendência 8119
  > Tela\Opçao No Sistema: Cadastro de Associação de Rubricas por Regra.
	 Na procura das rubricas, está pegando as rubricas da Patricinadora "P". Deverá vir apenas as rubricas da Folha "B"
Pendência: 
- Resolução da Pendência 8118
  > Tela\Opçao No Sistema: Cadastro/Associação Rubrica p/ Regra
	Está dando problema de constraint ao associar uma rubrica a regra, pois está passando o cod. externo como se fosse o cod. interno na tabela PROVDESC (IDPROVENTO).
Pendência: 
- Resolução da Pendência 7612
  > Tela\Opçao No Sistema: Cálculo da Folha  / Preparo
	No cálculo do preparo não foi corporado a nova modelagem, sendo assim, não inseriu na tabela o IDPLANOORIGEM. 
Pendência: 
- Resolução da Pendência 8153
  > Tela\Opçao No Sistema: Cadastro/ Deposito Judicial a Ordem Justiça Federal
	Correção do erro de "Nome de Coluna Inválido" na tela do Cadastro de participantes que possuem rubrica de Deposito Judicial a ordem da Justiça Federal
Pendência: 
- Resolução da Pendência 8123
  > Tela\Opçao No Sistema: Efetivação da folha
	Gravar na tabela RATEIODOCUM os campos CODCENTROCUSTO e IDPROGRAMA.
Pendência: 
- Resolução da Pendência 8125
  > Tela\Opçao No Sistema: Cadastro/ Rubricas Salariais
	Correção do Erro de gravação de campo (NOT NULL)  durante o cadastro da Rubrica Salariais.  
================================================================================
CM$VER      3.02.13d    11/07/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência Nº 6613
  > Tela\Opçao No Sistema: Previa
	Implementar Rotina de Cálculo Automático de Nº de Dependentes de IRRF e de Salario Familia
      
Pendência: 
- Resolução da Pendência Nº 7789
  > Tela\Opçao No Sistema: Estorno
	Correção na Tela de Estorno Individual, pois o sistema não disponibiliza o campo para inclusão de alterador quando o documento já está baixado no Contas a Pagar.
      
Pendência: 
- Resolução da Pendência Nº 7304
  > Tela\Opçao No Sistema: Associação de Rubricas ao Plano
	Resolvido o problema relacionado a associação da rubrica ao plano, que não permitia a inserção do centro de custo, mesmo quando o centro de custo era obrigatorio. 
      
Pendência: 
- Resolução da Pendência Nº 7665
  > Tela\Opçao No Sistema: Rubricas Salariais.
	Implementar o parâmetro de Estado da Rubrica (Ativa ; Bloqueada ; Calculada) 
================================================================================
CM$VER      3.02.13c    02/07/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência Nº 6508
  > Tela\Opçao No Sistema: Associação de Rubricas x Plano
	Alterar nomenclatura das contas contábeis (deixar apenas uma conta contábil).
	Permitir procura de rubricas (nos dois grids) e ordenações dinâmicas.
Pendência: 
- Resolução da Pendência Nº 6345
  > Tela\Opçao No Sistema: Consultas / Relatórios
	 Consolidar por Mês as informações do Relatório de Resumo de Rubricas.
Pendência: 
- Resolução da Pendência Nº 5884
  > Tela\Opçao No Sistema: Parametros do Sistema.
	Criar parametrização para controlar se o Sistema vai executar o cálculo automático de dependentes para imposto de renda e dependentes de salário família.	
Pendência: 
- Resolução da Pendência Nº 6748
  > Tela\Opçao No Sistema: Parametros do Sistema.
	Retirar os parametros correspondentes as rubricas de desconto de pensao alimenticia sobre suplementacao e sobre o beneficio do inss.
Pendência: 
- Resolução da Pendência Nº 5914
  > Tela\Opçao No Sistema: Consultas / Relatorios / Relatorios de Rubricas
	Permitir emitir o relatório de rubricas na Previa e na Histrubsal com as opções por mês, Seleção de Lotes e Seleção de Versões.
Pendência: 
- Resolução da Pendência Nº 5834
  > Tela\Opçao No Sistema: Estorno
	Criar opção de Reprocessamento no estorno para colocar a pessoa num determinado lote. 
Pendência: 
- Resolução da Pendência Nº 5835
  > Tela\Opçao No Sistema: Estorno
	Atualizar o Flag FLGIDATMP pela existência da Previa. Existe=1. Não existe=0 
Pendência: 
- Resolução da Pendência Nº 5837
  > Tela\Opçao No Sistema: Estorno
	Correção no estorno completo da Folha , que não colocou SITENVIO=0 para registros na TmpDesc.
Pendência: 
- Resolução da Pendência Nº 5921
  > Tela\Opçao No Sistema: Estorno
	Permitir que se faça estorno gerando novo CAP mesmo após baixa do documento original.
Pendência: 
- Resolução da Pendência Nº 6475
  > Tela\Opçao No Sistema:  Estorno
	Implementar nova função na tela de estorno para permitir a alteração do portador forma de pagamento, da data programada e da conta bancária vinculada ao documento gerado originalmente.
Pendência: 
- Resolução da Pendência Nº 6601
  > Tela\Opçao No Sistema: Estorno
	Na opção de estorno por pagamento indevido, implementar a operação de desfazer preparo individual para o recebedor em questão.
Pendência: 
- Resolução da Pendência Nº 6964
  > Tela\Opçao No Sistema: Emissão de Contracheque
	Incluir na tela de geração do arquivo de contracheque, a opção de escolha por de geração do mesmo por cidade.
Pendência: 
- Resolução da Pendência Nº 5916
  > Tela\Opçao No Sistema: Extra-Folha
	Colocar uma opção para  "Mês Abono"  na Folha Extra.
Pendência: 
- Resolução da Pendência Nº 5917
  > Tela\Opçao No Sistema: Extra-Folha
	Verificação do campo CODIRRFDARF e a gravação das rubricas de desconto de dependente e idade
Pendência: 
- Resolução da Pendência Nº 7544
  > Tela\Opçao No Sistema: Extra-Folha
	Remodelação da Tela.
	Permitir alteração e exclusão dos dados incluidos na prévia.
	Permitir o uso de código e nome externo de rubricas conforme parametro.
Pendência: 
- Resolução da Pendência Nº 7545
  > Tela\Opçao No Sistema: Pagamentos Pendentes
	Remodelação da Tela.
Pendência: 
- Resolução da Pendência Nº 7543
  > Tela\Opçao No Sistema: Abertura e Fechamento de Lotes
	Opção para criar lotes para folhas de pagamento pendente e extra-folha.
Pendência: 
- Resolução da Pendência Nº 7604
  > Tela\Opçao No Sistema: Demonstrativo de Pagamento - 2ª Via.
	Inserir na query do demostrativo de pagamento de benefício 2ª Via os seguintes campos:  
	Nome da Patrocinadora;
	Nome do Plano;
	Isento IR;
	Nome do Recebedor;
	Nº do  benefício INSS;
	Resíduos;
	Data de Crédito.
Pendência: 
- Resolução da Pendência Nº 7669
  > Tela\Opçao No Sistema: Preparo
	Grava valor SRB  e benefício de referência no preparo.
Pendência: 
- Resolução da Pendência Nº 7670
  > Tela\Opçao No Sistema:  Consulta a Previa
	Alterar tela de consulta de prévia para exibir as informações: valor do SRB, valor do INSS e valor base associados ao benefício.
Pendência: 
- Resolução da Pendência Nº 7671
  > Tela\Opçao No Sistema: Consulta ao Historico de Pagamentos.
	Alterar tela de consulta do histórico de pagamento para exibir as informações: valor do SRB, valor do INSS e valores base associados ao beneficios.	
================================================================================
CM$VER      3.02.13b    17/06/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência Nº 6580
  > Tela\Opçao No Sistema: Cálculo da Folha/ Prévia
      O sistema esta cobrando indevidamente rubricas individuais atrasadas. Ex: Na folha de 03/2002, foi pago o Auxílio Doença até 20/03/2002  e  foi cobrada a parcela (Rubrica individual) referente a 03/2002. Na folha de 04/2002, foi feito uma renova onde pagou o período de 21/03 a 30/04/2002  e foi cobrada a parcela de 03/2002, novamente, bem como a 04/2002 (devida). Favor providenciar para não cobrar parcelas em duplicidade(03/2002) conforme demonstrado.
================================================================================
CM$VER      3.02.13a    17/06/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência Nº 6962
  > Tela\Opçao No Sistema: Cadastro Manual de Benefícios
      Criar campo FLGMANUAL na tabela de Histórico de Benefícios e gravar o seguinte neste campo: (a) 1 se houver uma inclusão nesta tela; (b) 2 se houver alteração de alguma informação caso este campo seja igual a 0 ou nulo.
Pendência: 
- Resolução da Pendência Nº 6964
  > Tela\Opçao No Sistema: Emissão de Contracheque
      Incluir na tela de geração do arquivo de contracheque, a opção de escolha por de geração do mesmo por cidade.
Pendência: 
- Resolução da Pendência Nº 7212
  > Tela\Opçao No Sistema: Estorno
      Não esta contabilizando o estorno com cancelamento do pagamento. FLGESTORNO = 9.
Pendência: 
- Resolução da Pendência Nº 7168
  > Tela\Opçao No Sistema: Valores pagos/cobrados e sem baixa
      Efetuar a baixa dos registros da HSTBENEFBFCIARIO relativos ao falecimento de participante.
Pendência: 
- Resolução da Pendência Nº 7164
  > Tela\Opçao No Sistema: Processamento da Prévia
      Incluímos para compor base para cálculo de IRRF os valores de benefícios de 03 e 04/2002 através da rubrica 1869 (Informativa, de pagamento). Não surtiu efeito, o sistema não calculou o IRRF considerando estes valores.
Pendência: 
- Resolução da Pendência Nº 7021
  > Tela\Opçao No Sistema: Estorno da Folha
      Na opção Estorno completo, o campo DATAVOLTATMP da tabela CTRLINTERFACE não esta sendo atualizado, e como conseqüência o lote não esta sendo disponibilizado para refazer a prévia.
Pendência: 
- Resolução da Pendência Nº 6787
  > Tela\Opçao No Sistema: Processamento da Previa
      Criar rotina de cálculo para a Pensão Alimenticia sobre o Beneficio do INSS.
================================================================================
CM$VER      3.02.13     11/06/2002
--------------------------------------------------------------------------------
Pendência: 
- Resolução da Pendência Nº 6983
  > Tela\Opçao No Sistema: Tratamento Convenio/Consulta Convenio
     Alteração do campo VALORDOEFETIVO da tabela PROCCONVENIODOC para o nome correto VALOREFETIVO, pois apresenta erro ao entrar nestas telas.
Pendência: 
- Resolução da Pendência Nº 6478
  > Tela\Opçao No Sistema: Consulta/Relatório/Operacionais/Relação Individual de Rubricas
     Incluir opção de quebra por Plano e Patrocinadora na tela de filtro. Colocar no relatório a informação mês de referência da rubrica.
Pendência: 
- Resolução da Pendência Nº 6760
  > Tela\Opçao No Sistema: Consulta/Relatório/Operacionais/Relação Individual de Rubricas
     Adotar a mesma forma de filtragem do relatório de "Resumo por Rubricas". Solic. Menezes
Pendência: 
- Resolução da Pendência Nº 6568
  > Tela\Opçao No Sistema: Cadastro de Rubricas Salariais
     Preciso que no Tela de Rubricas salariais da Folha de Beneficios reapareça o combo para que o usuário possa indicar a qual grupo pertence a rubrica.
Pendência: 
- Resolução da Pendência Nº 5911
  > Tela\Opçao No Sistema: Tela de Consulta Histórico de Pagamentos
     Mostrar situação do pagamento. Verificar forma da tela na CMTOTALPREV.BPL
Pendência: 
- Resolução da Pendência Nº 6915
  > Tela\Opçao No Sistema: Consulta Rubrica por Plano
     Inserir botão para procurar as rubricas, tanto do lado das associadas como as da não associadas, igual ao que tem no InterfacePrev.
Pendência: 
- Resolução da Pendência Nº 6824
  > Tela\Opçao No Sistema: Preparo
     Cálculo de contribuições associadas a outras como a contribuição de jóia. 
Pendência: 
- Resolução da Pendência Nº 7200
  > Tela\Opçao No Sistema: Alteração do Portador Forma de Pagamento
     Erro ocorrido com a mensagem "Falta expressão".
================================================================================
CM$VER      3.02.12y    27/05/2002
--------------------------------------------------------------------------------
Pendência: 5840
- Resolução da Pendência Nº 5840
  > Tela\Opçao No Sistema: Alteração de Portador Forma de Pagamento
     Rever a Tela de Alteração de Portador Forma para permitir a visualização e alteração do portador forma de pagamento de todos os recebedores ativos vinculados ao Participante.
================================================================================
CM$VER      3.02.12x    27/05/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 3144
  > Tela\Opçao No Sistema: Abertura de Lotes
     Permitir a eliminação de lotes da CTRLINTERFACE criados pela Folha.
- Resolução da Pendência Nº 6342
  > Tela\Opçao No Sistema: Relatório/Segunda Via Contra cheque
     O Demonstrativo de Segunda via de Contra - Cheque está trazendo em alguns casos, as informações em duplicidade. Como pode ser observado nas matriculas 99.000.155 (mês referência 2002/02) e 13.006.492(2001/12). Solic: Márcia
- Resolução da Pendência Nº 6292
  > Tela\Opçao No Sistema: Cadastro Manual de Histórico de Benefícios
     Criar campo FLGMANUAL na tabela de Histórico de Benefícios e gravar o seguinte neste campo: (a) 1 se houver uma inclusão nesta tela; (b) 2 se houver alteração de alguma informação caso este campo seja igual a 0 ou nulo.
- Resolução da Pendência Nº 5925
  > Tela\Opçao No Sistema: Efetivação
     Conversão de data na Efetivação quando formato no WINDOWS é 'd/m/yyyy' apresente erro.
- Resolução da Pendência Nº 6966
  > Tela\Opçao No Sistema: Estorno
     Para o estorno por pagamento indevido ou para reprocessamento, a conta contábil de líquido para pagamento de benefícios não foi identificada, quando o pagamento se refere apenas a meses anteriores, nos quais a rubrica utilizada é de atraso, não existindo nenhuma rubrica de pagamento normal.
================================================================================
CM$VER      3.02.12v    27/05/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 5919
  > Tela\Opçao No Sistema: Preparo
     A) Verificar se o desfazer preparo só desfaz benefícios com motivo da folha normal, abono e antecipação de abono. B) Verificar se o desfazer preparo está apagando o salário virtual.
- Resolução da Pendência Nº 6725
  > Tela\Opçao No Sistema: Relatório/Segunda Via Contra cheque
     Na versão da folha V.2002/04/19 não é impresso a 2ª via de contra-cheque de nenhum participante. Solicit. Flavia
================================================================================
CM$VER      3.02.12u    27/05/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6602
  > Tela\Opçao No Sistema: Previa/desfazer preparo
     O desfazer preparo deve atualizar o número de registros e o valor total do lote de pagamento.
- Resolução da Pendência Nº 6632
  > Tela\Opçao No Sistema: Previa/desfazer preparo
     Na função de desfazer preparo gravar a operação no Log TotalPrev, permitindo que o usuário informe o motivo do desfazer.
- Resolução da Pendência Nº 6540
  > Tela\Opçao No Sistema: Previa/desfazer preparo
     No desfazer preparo, não está eliminando o salário virtual calculado para o mês de pagamento.
================================================================================
CM$VER      3.02.12t    22/05/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6619
  > Tela\Opçao No Sistema: Estorno
     Vincular conta bancária ao novo documento a pagar do recebedor.
- Resolução da Pendência Nº 6697
  > Tela\Opçao No Sistema: Cadastro Lançamento Manual de Rubricas
     Incluir neste tela campos para informar a conta contábil e o favorecido vinculados ao lançamento.
- Resolução da Pendência Nº 6734
  > Tela\Opçao No Sistema: Relatório Analítico de Cred. Beneficiário por Agência
     Na relatório "Relação Individual de Beneficiários por Banco e Agência" um participante está saindo duplicado e quando muda o banco, no relatório aparece o número correto mas a descrição é do Banco Pagador.
- Resolução da Pendência Nº 6294
  > Tela\Opçao No Sistema: Cadastro Lançamento Manual de Rubricas
     Criar campo para identificação de favorecido da rubrica e exigir este preenchimento se a rubrica necessitar de favorecido.
- Resolução da Pendência Nº 6293
  > Tela\Opçao No Sistema: Cadastro Lançamento Manual de Rubricas
     Criar campo FLGMANUAL na tabela de Tmpdesc e gravar o seguinte neste campo: (a) 1 se houver uma inclusão nesta tela; (b) 2 se houver alteração de alguma informação caso este campo seja igual a 0 ou nulo.
================================================================================
CM$VER      3.02.12s    20/05/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6607
  > Tela\Opçao No Sistema: Tela de Cadastro de Rubricas Individuais
     Permitir lançamentos para consignatários
- Resolução da Pendência Nº 6609
  > Tela\Opçao No Sistema: Tela de Processamento da Prévia
     Implementar cálculo de rubrica de cpmf associada ao pagamento de pensão alimentícia sobre o benefício do inss.
Cadastro de Importação de Entidades Externas
- Acerto no tratamento da coluna referente ao mes de referencia.
================================================================================
CM$VER      3.02.12r    20/05/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6684
  > Tela\Opçao No Sistema: Tela de Parâmetros Globais
     Retirar o parametro referente a apagar as pensôes alimentícias no mes de Janeiro.
- Resolução da Pendência Nº 6608
  > Tela\Opçao No Sistema: Tela de Parâmetros Globais
     Retirar o parametro global de rubrica de credito de pensão alimentícia
- Resolução da Pendência Nº 6618
  > Tela\Opçao No Sistema: Tela de Cadastro de Layout de Convênios
     Alterar este Cadastro , adicionando as seguintes informações : Limites Minimo e Máximo de desconto , por convenio. Incluir um campo para receber uma regra de cálculo associada.
- Resolução da Pendência Nº 6787
  > Tela\Opçao No Sistema: Tela de Processamento da Prévia
     Criar rotina de cálculo para a Pensão Alimenticia sobre o Beneficio do INSS 
- Resolução da Pendência Nº 6610
  > Tela\Opçao No Sistema: Tela de Cadastro de Rubricas Individuais
     Acrescentar na pasta de pensão alimentícia uma opção para indicar se esta terá cpmf associado.
================================================================================
CM$VER      3.02.12q    20/05/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6734
  > Tela\Opçao No Sistema: Relatório Analítico de Crédito de Beneficiários por Agência
     Acerto no relatório analítico de crédito de beneficiários por agência, que apresentava alguns pagamentos em duplicidade no relatório.
Relatório Individual de Rubricas
- Acerto no relatório individual de rubricas, que apresentava erro na abertura da tela de filtro.
Tela de Estorno
- Acerto na tela de estorno que não exibia o documento vinculado ao pagamento de determinadas pessoas.
================================================================================
CM$VER      3.02.12p    20/05/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6619
  > Tela\Opçao No Sistema: Tela de Estorno
     Vincular conta bancária ao novo documento a pagar do recebedor.
================================================================================
CM$VER      3.02.12o    20/05/2002
--------------------------------------------------------------------------------
Processamento do Pagamento de Convênios
- Liberação da rotina de pagamento de convênios
Consulta de Pagamento de Convênios
- Liberação da tela de consulta para pagamento de convênios
Menu Consultas
- Alguns itens do menu Consultas foram renomeados e rearrumados, mantendo as mesmas funcionalidades anteriores.
================================================================================
CM$VER      3.02.12n    20/05/2002
--------------------------------------------------------------------------------
Preparo:
- Alteração na query passada para a regra de cálculo de contribuição corrigindo a duplicidade do campo VALORPROVENTO, que é o salário de participação no mês do preparo.
Prévia:
- Utilização da rubrica de atraso de benefício ao invés da rubrica normal, para os meses pagos anteriores ao mês de pagamento da Folha.
================================================================================
CM$VER      3.02.12m    20/05/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 6297
  > Tela\Opçao No Sistema: Cadastro de Layout de Convênios 
     Permitir a parametrização da informação do mês de referência associado a rubrica importada.
- Resolução da Pendência Nº 6298
  > Tela\Opçao No Sistema: Tela de Importação de Convênios
     Na importação do arquivo de convênio, utilizar a parametrização da informação do mês de referência da rubrica importada.
- Resolução da Pendência Nº 6528
  > Tela\Opçao No Sistema: 
     Incluir a informação relativa ao Portador-Forma no relatório da folha de pagamentos.
- Resolução da Pendência Nº 6529
  > Tela\Opçao No Sistema: Tela de Processamento da Prévia
     Ao processar o mesmo lote em meses de pagamento diferentes está duplicando algumas informações na Prévia.
- Resolução da Pendência Nº 6539
  > Tela\Opçao No Sistema: Tela de Processamento do Preparo
     Erro na gravação do histórico de contribuição. Mês de referência estava nulo numa determinada condição em que não foi identificada a contribuição a calcular por um erro na query passada para a regra de cálculo.
Processo da Previa
  - Alteração para permitir que a folha pague pensão alimenticia sobre o beneficio do inss.
    A rubrica a ser utilizada, neste caso, é a que for assinalada no cadastro de rubricas individuais.
================================================================================
CM$VER      3.02.12l    20/05/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 5836
  > Tela\Opçao No Sistema: Cadastro de Conta Bancária
     Não está permitindo acessar as contas bancárias de beneficiários
- Resolução da Pendência Nº 5879
  > Tela\Opçao No Sistema: Nova Tela de Cadastro de Lista
     Implementar tela para criação de Lista de Pessoas prevendo importação de matriculas ou inscrição.
- Resolução da Pendência Nº 5883
  > Tela\Opçao No Sistema: Cadastro Manual de Lançamentos para a Folha (TMPDESC)
     Apresentou UPDATE FAILED na tela de Cadastro Manual de Rubricas (TmpDesc). Gravar o IDMODULO. No OK não abrir novo registro.
- Resolução da Pendência Nº 5915
  > Tela\Opçao No Sistema: Tela de Processamento do Preparo
     Verificar na Preparo se existe benefício ativo ou retido no mês anterior não preparado. Se existir não permitir o Preparo.
- Resolução da Pendência Nº 6199
  > Tela\Opçao No Sistema: Tela de Processamento do Preparo
     Este erro ocorre quando as informações de periodicidade dos benefícios não estão preenchidas, Neste caso não se instância os valores do benefício e tenta-se gravar um registro na tabela HstBenefbfciario com dados nulos, o que acarreta erros por constraint de nulidade.
- Resolução da Pendência Nº 6361
  > Tela\Opçao No Sistema: Relatório do Depósito Bancário
     Informar a quantidade de registros, aumentar a margem esquerda e centralizar o título do relatório.
- Resolução da Pendência Nº 6364
  > Tela\Opçao No Sistema: Consulta Participante/Elegível
     Alterar chamada da Consulta Participante/Elegível para visualizar informações dos elegíveis.
- Resolução da Pendência Nº 6477
  > Tela\Opçao No Sistema: Tela da Efetivação
     Na efetivação de uma folha de pagamentos pendentes apresenta erro na gravação da tabela de Lançamentos do documento (LANCTODOCUM).
- Resolução da Pendência Nº 6479
  > Tela\Opçao No Sistema: Relatório de Estorno
     Ocorreu um erro tela de filtro do relatório de estorno de pagamento, pois a sintaxe da consulta vinculada à versão de pagamento está errada. Deve ser RTRIM(HISTORICO) ao invés de TRIM(HISTORICO).
- Resolução da Pendência Nº 6516
  > Tela\Opçao No Sistema: Tela de Prévia de Pagamentos Pendentes
     Está buscando o IRRF da época do benefício e também calculando o atual.
- Resolução da Pendência Nº 6517
  > Tela\Opçao No Sistema: Tela de Prévia de Pagamentos Pendentes
     Não considerou um participante com mais de 65 anos para isenção de IRRF.
================================================================================
CM$VER      3.02.12k    03/05/2002
--------------------------------------------------------------------------------
Cadastro de Recebimento de Convênio
  - Criação da informação Dia de Pagamento do Favorecido vinculado ao Convênio.
Cadastro de Rubricas Salariais
  - A partir desta versão o preenchimento da categoria da rubrica é obrigatório.
Cadastro de Rubricas Individuais
  - Implementação do calculo automático da data final de processamento da rubrica ,quando o número de parcelas for alterado.
Cadastro de Associação de Rubricas por Benefício
  - Correção de erro que ocorria quando se tentava excluir uma rubrica.
Prévia
  - Inclusão do flag FLGMOLESTIAGRAVE na query de entrada para as regras oriundas do cadastro de rubricas individuais.
Relatório da Folha de Benefícios
  - RETIRAR O CAMPO NUMPRIORIDADE E TABELA RUBRICAXPESS NA QUERY PRINCIPAL DA ROTINA ENVIACONTRIBASSISTTMPDESC.
  - A partir desta versão o relatório passa a considerar o parâmetro relativo a código e descrição interno/externo das rubricas.
  - Correção do erro relativo a duplicação das informações, que ocorria quando o beneficiário possui numeros de processo de concessão de suplementação e inss distintos.
Cadastro de Parâmetros
  - Inclusão do parâmetro referente a rubrica que vai ser utilizada para o CPMF da pensão alimentícia sobre o benefício do inss.
Relatório de Segunda Via de Contra cheque
  - Resolvido a duplicidade de rubricas para algumas pessoas, que possuem mais de uma Conta bancária.
Efetivação
  - Na verificação das informações da Prévia utilizar a parametrização global que prevê integração contábil, de forma a não se obrigar a informação da conta contábil quando a Folha não estiver parametrizada como integrando com a contabilidade.
Exportação de Arquivo para Convênio
  - correção de erro que acrescentava caracteres em branco entre as colunas do arquivo.
================================================================================
CM$VER      3.02.12j    22/04/2002
--------------------------------------------------------------------------------
Efetivação
- Na Efetivação ao se utilizar a opção de geração de documentos individuais, passou-se a gravar como Número do Documento, não mais -1, e sim a Versão do Pagamento concatenado com a Inscrição do Participante.
- Vinculação da conta bancária preferencial do recebedor ao documento individual gerado.
- Atualização da planilha contábil nos lançamentos financeiros quando do processamento por documentos individuais.
Cadastro de Conta Bancária
- acerto na atualização de informações para o Protocolo, quando se realiza a operação de inclusão de nova conta.
================================================================================
CM$VER      3.02.12i    15/04/2002
--------------------------------------------------------------------------------
Prévia de Pagamentos Pendentes
- Acerto para identificar o processo de benefício original da versão que ficou pendente de pagamento.
Efetivação
- Para Efetivação de Lotes de Pagamento Pendentes que não existe contabilização não se exige a existência da parametrização contábil.
- Acerto na query que atualiza a TMPDESC para casos em que o campo ORDEM é nulo.
Relatório e Consulta de Estorno
- Acerto na consulta para mostrar as rubricas da versão estornada. 
================================================================================
CM$VER      3.02.12h    08/04/2002
--------------------------------------------------------------------------------
Tela de Parametrização
- Remodelagem da tela de parametrização da Folha de Benefícios rearrumando os componentes.
Prévia
- ACERTO NA CONTABILIZAÇÃO DA DEVOLUÇÃO DE CONTRIBUIÇÃO NO ENVIO DE CONTRIBUIÇÃO PARA A PROCESSAMENTO NA PRÉVIA.
Efetivação
- ACERTO NA CONTABILIZAÇÃO DO PAGAMENTO DO ABONO ANUAL DE BENEFÍCIO.
- Resolução da Pendência Nº 5910
  > Tela\Opçao No Sistema: Tela de Processo da Prévia
  Utilizar rubricas separadas para os Alteradores de Contribuição de forma a se permitir parametrização contábil e financeira separada.Utilização da nova estrutura de Alteradores para Benefício do AdmPrev, que permite a vinculação de mais de um alterador ao benefício. A estrutura de Alteradores para Benefício também utiliza rubricas separadas por alterador.
================================================================================
CM$VER      3.02.12g    05/04/2002
--------------------------------------------------------------------------------
CADASTRO DE CONTA BANCÁRIA:
- ACERTO NA ALTERAÇÃO DAS CONTAS BANCÁRIAS DE BENEFICIÁRIOS.
CADASTRO DE LAYOUT DE DESCONTOS DE SAIDA
- INCLUSÃO DO CAMPO MES DE COBRANCA NO LAYOUT
- Resolução da Pendência Nº 5924
  > Tela\Opçao No Sistema: Tela de Cadastro de Conta Bancária
  Atualizar Protocolo para as operações realizadas na Tela Cadastro de Conta Bancária
================================================================================
CM$VER      3.02.12f    01/04/2002
--------------------------------------------------------------------------------
Emissão de contra cheque
  - opção para gerar arquivo com padronização para 2 contra cheques por página.
Relatórios
  - quebra do Relatório de Portador Forma por Versão da Folha, por portador forma.
  - alteração do nome do Relatório de Portador Forma por Versão da Folha para Relação de Depósitos de Pagamento.
  - acerto em erro na query do Relatório de Individual de Rubricas de uma versão e otimização da consulta.
Prévia
  - gravação do Número do Processo do INSS na tabela Prévia.
  - gravação do Idtitular no campo Referencia, para não apresentar constraint de unicidade na Histrubsal.
  - considerar na Prévia os descontos do falecido para o recebedor dos acertos de benefícios do primeiro. Criar parâmetro para controlar este fato.
Efetivação
  - agrupamento da contabilização para não lançar por documento/portador forma.
  - gravação do número do processo do INSS e do IDInforme na Histrubsal.
  - alteração no controle do order by para usar Idtitular de forma a não precisar utilizar o incremento do seqrubrica.
  - alteração para controlar lançamentos negativos para a tabelas temporária em Paradox Documentos.DB e DOCTXT.DB.
Estorno
  - Acerto na Geração do Novo Contas a Pagar.
================================================================================
CM$VER      3.02.12e    28/03/2002
--------------------------------------------------------------------------------
Cadastro Manual de Historico de Beneficios
  - Preenchimento automatico da Data Prevista, apartir do Ano e Mes de referencia.
  - Inclusão de filtro para o Motivo, para não disponibilizar os motivo de Pagamento de Beneficios e Pagamento de Abono Anual.
  - Alteração para gravar na HSTBENEFBFCIARIO, apartir da BENEFBFCIARIO os seguintes valores :DATAPAGAMENTO, VALORCALCULADO, VALORTOTAL,FLGFORMAPAGTO, FONTEPAGADORA e VALORINTEGRAL.
Cadastro de Rubricas Individuais
  - Proibição de alteração no código da rubrica e seleção de número de parcelas processadas quando a rubrica já tiver sido processada.
  - Alteração no cálculo do total de parcelas para considerar o abono anual no periodo de processamento.
Cadastro de Importação de Convenios.
  - Inclusão de Parametrização para permitir a importação apenas para beneficiarios que possuam beneficios ativos ou retidos.
  - INCLUSÃO DE GRID PARA TOTALIZAÇÃO DAS RUBRICAS DE UM LOTE QUE VAI SER REIMPORTADO.     
  - INCLUSÃO DE OPÇÃO PARA APAGAR OS DADOS DE UM DETERMINADO LOTE, PARA QUE SE POSSA FAZER UMA NOVA IMPORTAÇÃO NO MESMO LOTE.
Processo de Efetivação
  - ALTERAÇÃO NA PROCEDURE INTEGRARUBXPLANO PARA PERMITIR QUE QUANDO O FAVORECIDO TIVER MAIS DE UMA CONTA CORRENTE SEJA GERADO UM LANCAMENTO NO CONTAS A PAGAR PARA CADA CONTA CORRENTE, DESDE QUE AS RUBRIACAS CORRESPONDENTES ESTEJAM RELACIONADAS NA TABELA RUBRICAXCONTABANCARIA.         
    AINDA ESTA EM ABERTO A CONTABILIZAÇÃO PARA ESTES CASOS !!!!   
Cadastro de Abertura de Lotes 
  - Proibição de abertura de lote se o lote do mes anterior não tiver sido efetivado.          
Alteração no Preparo
  - Alteração para permitir que o preparo "prepare"os beneficios retidos mesmo após a datafinalprevista, com excessão dos beneficios temporarios.
Cadastro de Parâmetros do Sistema
   - INCLUSÃO DA PARAMETRIZAÇÃO CONTÁBIL-FINANCEIRA PADRÃO, QUE É COMPOSTA PELOS MESMOS PARAMETROS UTILIZADOS NA ASSOCIAÇÃO DE RUBRICA POR PLANO.  A PARAMETRIZAÇÃO CONTÁBIL-FINANCEIRA PADRÃO VAI SER UTILIZADA PELO SISTEMA , NA EFETIVAÇÃO, QUANDO HOUVER A AUSENCIA DE ALGUMA PARAMETRIZAÇÃO DE RUBRICAS, DE FORMA A NÃO INTERROMPER O PROCESSO DE EFETIVAÇÃO DA FOLHA.              
Relatórios
   - Criação do Relatório de Portador Forma por Versão da Folha.
================================================================================
CM$VER      3.02.12d    28/03/2002
--------------------------------------------------------------------------------
Cadastro de Associação de Rubricas por Plano
  - Os grids agora mostram os códigos e descrições interna e externa das rubricas.
Arquivo Texto para Pagamento Eletrônico
  - O arquivo texto para banco, gerado manual ou automático pela efetivação, são sempre ordenados por nome do recebedor.
Efetivação
  - Os lançamentos contábeis das rubricas são feitos em separado mesmo que mais de uma rubrica seja vinculada a mesma conta contábil. Se identifica o lançamento pelo histórico que contém o nome da rubrica.
Tela de Abertura de Lote
  - Alteração para se obrigar que a data de pagamento seja no mês de referência ou num mês posterior a este.
================================================================================
CM$VER      3.02.12b    08/02/2002
--------------------------------------------------------------------------------
Prévia
  - inclusão dos campos IDTITULAR, IDPESSOA, NumeroProcesso e Valor do INSS, na consulta passada para a regra associada a Rubrica Individual.
Cadastro de Rubricas Salariais
  - Alteração que permite apagar a seleção feita nos combos de Natureza da Rubrica, Linha do Informe de Rendimento e Codigo IRRF receita para DARF.
Estorno
  - alteração na gravação da tabela de Motivo do Estorno.
Consulta Prévia
  - alteração para exibir código e descrição das rubricas interno ou externo conforme parametrização da Fundação.
Consulta Histórico de Pagamentos
  - alteração para exibir código e descrição das rubricas interno ou externo conforme parametrização da Fundação.
Foi implementada uma tela para criação de lote de Manutenção. Na tela do preparo de Manutenção deve-se a partir de agora selecionar o lote criado. Isto permite que o preparo possa ser executado diversas vezes incluindo Benefícios no mesmo lote de manutenção.
================================================================================
CM$VER      3.02.12a    31/01/2002
--------------------------------------------------------------------------------
Efetivação
  - alteração do parâmetro de lançamento contábil para a Contabilidade.
================================================================================
CM$VER      3.02.12     30/01/2002
--------------------------------------------------------------------------------
Alterações no Preparo:
  - inclusão dos campos IDBENEFICIO e FLGCONCESSAO na consulta enviada para a regra de reajuste de benefícios.
  - gravar informação do campo Valor Integral na Histrubsal para o salário virtual.
Alteração na Prévia:
  - criou-se parâmetro para controlar o envio de contribuições para lotes de manutenção e concessão.
  - alteração na formação da base de cálculo de IRRF para Abono Anual.
  - cálculo da correção de benefício por código de DARF para permitir a separação nas diversas bases de IRRF.
  - acerto na execução da regra de benefício mínimo quando existe lançamento de acerto de benefício num processo de benefício anterior.
  - tratamento de correção de devolução de benefício e de contribuição.
Alteração Efetivação:
  - Acerto na query de atualização da rubrica individual, no momento da Efetivação de uma Versão.
Cadastro de Associação de Rubricas por Plano:
  - Alterações referentes a utilização de codigo e descrição interno / externo de rubricas.
Cadastro de Rubricas Individuais:
  - Alterado para possibilitar cadastrar pensão alimentícia para consignatários. 
  - Alterações referentes a utilização de codigo e descrição interno / externo de rubricas.
  - Correção na eliminação de registros.
Tela de Consulta a Prévia:
  - Alterações referentes a utilização de codigo e descrição interno / externo de rubricas.
  - Inclusão da informação do código de irrf para o darf no grid do detalhe.
Tela de Consulta ao Histórico da Previa:
  - Alterações referentes a utilização de codigo e descrição interno / externo de rubricas.
  - Inclusão da informação do código de irrf para o darf no grid do detalhe.
Convenio de Entidades Externas:
  - Os layouts de importação deverão ser cadastrados na opção de menu "Layout de Descontos - Entrada" e os layouts de exportação (retorno) deverão ser cadastrados na opção de menu "Layout de Descontos - Saida".
  - No cadastro do layout de saída pode se o layout de retorno para as entidades conveniadas.
  - Na exportação de informações para entidades conveniadas criou-se parâmetro para indicar se o Layout é de Entrada e ou de Saida.
Importação de Convenios
  - Inclusão do tratamento de prazo para a inclusão de convenios continuados.
Cadastro de Layout de Descontos - Entrada
  - Alterações referentes a utilização de codigo e descrição interno / externo de rubricas . 
Relatorio da Folha de Pagamentos.
  - Alterações referentes a utilização de codigo e descrição interno / externo de rubricas no relatório individual de pagamento.
Cadastro de Rubricas Salariais.
  - Inclusão do parametro de prazo para as rubricas.
Tela Principal
  - Inclusão da opção de menu Associação de Rubricas por Beneficio.
Cadastro de Associação de Rubricas por Beneficio.
  - este cadastro permite a vinculação de uma rubrica a um benefício de forma a controlar as rubricas disponíveis para a tela de Rubricas Individuais, de acordo com o benefício do recebedor.
Parâmetros Gerais
  - Inclusão de parametro para indicar se o Sistema vai trabalhar com o código e descrição internos ou externos das rubricas.
  - Inclusão de parametro para indicar se o Sistema vai trabalhar com prazos para rubricas.
  - Inlcusão de Parametro para indicar se o Sistema vai trabalhar com a associação de Rubrica por Plano.
  - Inclusão de parametro para indicar se o sistema vai trabalhar apenas com as rubricas da folha de beneficios ou com todas.
Relatórios
  - Alteração do relatório de segunda via de contra cheque.
================================================================================
CM$VER      3.02.11b    14/01/2002
--------------------------------------------------------------------------------
Alteração no Preparo:
  - preparo de Folha de Abono para gravar o lote correto e acertar a data início do benefício passada para a regra de abono.
  - na gravação do Histórico de Benefício do abono estava colocando indevidamente como retido para os benefícios já encerrados.
  - modificação na consulta passada para a regra de Abono Anual no Preparo.
  - modificação da consulta enviada para a regra de reajuste de benefícios executada no Preparo da Folha.
  - geração de reajuste do salário virtual da Patrocinadora na fase de Preparo da Folha.
  - inclusão da rubrica de salário virtual no momento do Preparo da Folha, ao invés da Efetivação.
  - alteração no desfazer preparo para retornar ao valor do benefício anterior ao reajuste.
  - alteração no desfazer preparo para colocar como último mês de preparo, o mês anterior ao mês do preparo em questão e não mais o mês informado na tela.
Alteração na Prévia:
  - cálculo da Prévia para corrigir o cálculo quando existem duas Pensões Alimentícias sobre o valor líquido total associadas a um mesmo beneficiário, para não considerar uma PA na base de cálculo da outra.
  - correção no campo DATAREF passado para as regras de rubrica individual.
  - cálculo do IRRF para contempar o cálculo do IRRF sobre o Abono Anual independente da base de provento normal.
  - modificação na consulta de entrada da Previa para processar os benefícios com valor a pagar igual a Zero.
  - Funcionalidade que permite a isenção de desconto de IRRF sobre um determinado beneficio.
Alteração na efetivação:
  - alteração na forma de contabilizar as rubricas de crédito de Consignação judicial no caso de Abono Anual.
  - Tratamento da rubrica de compensação de adiantamento de benefício pago por Folha Extra na efetivação da Versão.
  - marcar rubrica individual como usada na efetivação da Versão.
Contra cheque:
  - criação de parâmetro de texto para ser colocado no início e no final do arquivo texto de contra cheque.
  - alteração no layout do arquivo de contra-cheque. Inclusão de opções de emissão do arquivo de contra-cheque por Patrocinadora, Plano Previdenciário e Portador Forma.
Consultas e cadastros e relatórios:
  - Alteração na consulta do relatório de Folha de Pagamento de Benefícios para corrigir duplicidade de registros para pessoas que foram migradas de plano previdenciário.
  - Efetuar suspensão de rubrica individual. 
  - Funcionalidade de tratamento de header e trailler nas importações de arquivos de entidades externas.
Estorno:
  - Liberação do estorno por pagamento indevido com contabilização automática das rubricas utilizando os parâmetros associados a benefícios, contribuições e rubricas de outros sistemas.
================================================================================
CM$VER      3.02.11a    03/12/2001
--------------------------------------------------------------------------------
Alteração na consulta passada para a regra de cálculo do abono anual executada 
no Preparo.
================================================================================
CM$VER      3.02.10p    03/12/2001
--------------------------------------------------------------------------------
Correção no desfazer preparo individual, executado na tela da Prévia.
================================================================================
CM$VER      3.02.10o    03/12/2001
--------------------------------------------------------------------------------
Inclusão de 8 casas decimais no percentual total passado para a regra de cálculo
das rubricas individuais (Prévia).
Definição de valores default na tela de cadastro de rubrica individual.
================================================================================
CM$VER      3.02.10n    03/12/2001
--------------------------------------------------------------------------------
Inclusão de 8 casas decimais no valor associado a uma rubrica individual quando
passado para a regra de cálculo (Prévia).
Acerto do uso do mês de referência para rubrica individual quando processada na Prévia.
================================================================================
CM$VER      3.02.10m    03/12/2001
--------------------------------------------------------------------------------
Acerto no cálculo do IRRF quando possui benefício de resgate de reserva
associado ao benefício de suplementação mensal.
================================================================================
CM$VER      3.02.10k    03/12/2001
--------------------------------------------------------------------------------
Correção na identificação da nacionalidade do recebedor na Prévia.
================================================================================
CM$VER      3.02.10j    20/11/2001
--------------------------------------------------------------------------------
Na importação de arquivos de entidades conveniadas corrigiu-se a importação do valor para o caso de devolução, pois este estava sendo multiplicado por 10.
================================================================================
CM$VER      3.02.10i    20/11/2001
--------------------------------------------------------------------------------
Acerto na tela de cadastro de layout de entidades conveniadas para cadastrar a rubrica de devolução.
Inclusão do campo FLGCONCESSAO na query que alimenta a regra de último pagamento no Preparo.
Inclusão do campo TIPOPROCESSO na query que alimenta a regra de último pagamento no Preparo, sendo que TIPOPROCESSO é 1 no Preparo e 2 na Prévia.
================================================================================
CM$VER      3.02.10h    20/11/2001
--------------------------------------------------------------------------------
Alteração no processamento da Prévia Normal de um lote de concessão, para não enviar os históricos de contribuição individuais relativas a patrocinadora para a Tmpdesc.
Desta forma, na Tmpdesc passamos a ter apenas as contribuições relativas ao participante.
================================================================================
CM$VER      3.02.10g    20/11/2001
--------------------------------------------------------------------------------
Identificar na Prévia Normal as contribuições em atraso a serem pagas pela Patrocinadora, de forma a não serem descontadas do recebedor.
================================================================================
CM$VER      3.02.10f    20/11/2001
--------------------------------------------------------------------------------
Implementação do estorno de pagamentos pendentes.
Implementação do estorno de pagamentos indevidos.
Implementação do estorno para geração de novo contas a pagar.
================================================================================
CM$VER      3.02.10e    20/11/2001
--------------------------------------------------------------------------------
Alteração do estorno completo de versão.
Alteração para executar não a regra de último de pagamento nos casos de concessão.
================================================================================
CM$VER      3.02.10d    20/11/2001
--------------------------------------------------------------------------------
Inclusão de novo controle de progresso no estorno de versão da Folha.
================================================================================
CM$VER      3.02.10c    20/11/2001
--------------------------------------------------------------------------------
Alteração no Relatório de Convênios Externos para emitir valor recebido e valor processado após efetivação da Versão.
================================================================================
CM$VER      3.02.10b    20/11/2001
--------------------------------------------------------------------------------
Execução da Regra de Último pagamento de benefício na Prévia,
após a execução da Regra de Benefício Mínimo.
================================================================================
CM$VER      3.02.10a    20/11/2001
--------------------------------------------------------------------------------
Alteração nos sql para regras de contribuição na fase de Preparo.
================================================================================
CM$VER      3.01.14     18/01/2001
--------------------------------------------------------------------------------
* Acerto no valor da data de cobrança na rotina de Correção de Benefícios.
* Acerto na gravação do valor do benefício mínimo na rotina de Beneficio Minimo.
* Acerto no fluxo da rotina de correção de contribuições, que não estava executando a regra
================================================================================
CM$VER      3.01.13     16/01/2001
--------------------------------------------------------------------------------
* Resolvido o erro do CODPROVDESC na Previa.
* Resolvido o problema da gravação do valor mínimo.
* Resolvido o problema da gravação do IDPESSOA errado.
* Criação de um parametro, no cadastro de rubricas, para indicar se a rubrica aceita
   desconto parcial ou não.
================================================================================
CM$VER      3.01.12     05/01/2001
--------------------------------------------------------------------------------
* Inclusão da opção de cálculo individual na Prévia da Folha
* Resolvido o problema relacionado ao cálculo da correção das contribuições.
* Incluidos dois novos relatórios : Layout e Rubricas
================================================================================
CM$VER      3.01.11     26/12/2000
--------------------------------------------------------------------------------
* A rotina de cálculo do beneficio minimo foi migrada do cálculo do preparo da folha
  para o cálculo da prévia.
* Resolvido problema na consulta a prévia da folha, que não retornava nenhuma 
   informação quando a consulta era livre.
* Resolvido o problema relativo a ordenação da combo de agências, no cadastro de
   contas bancárias.
* Implementada a opção de correção monetária de Benefício e Contribuição.
* Foram Corrigidos  os seguintes relatórios :
       - Relatorio de Atividades
       - Relatorio de Beneficios Pagos por Banco
       - Relatorio do Preparo
       - Relatorio de Creditos de Beneficiarios por Banco
       - Relatorio de Creditos de Beneficiarios por Banco / Agência
       - Relatorio da Previa
================================================================================
CM$VER      3.01.09     22/11/2000
--------------------------------------------------------------------------------
* Cálculo da Correção Monetária 
* Adiantamento de Benefícios
* Novo Tratamento para a contribuição patronal
================================================================================
CM$VER      3.01.08     14/11/2000
--------------------------------------------------------------------------------
* Cadastro de Layout de arquivos externos de convênios possui as seguintes implementações adicionais:
        - permite que se defina o número de decimais do valor a ser importado.
        - permite que se defina qual caracter separador decimal consta do arquivo.
        - permite que se defina um desconto para um beneficiário na pasta "Dependente".
        - permite a definição de uma rubrica de devolução associada a rubrica normal.
* Importação de arquivos externos de convênios possui as seguintes implementações adicionais:
	- correção da mensagem de erro "Is not a valid integer value", que ocorreu em algumas fundações, está associada a 
              uma incompatibilidade entre a parametrização especificada para a leitura do arquivo e o layout do arquivo que está 
               sendo lido. Nesta versão implementamos um tratamento deste erro para que o usuário seja devidamente alertado. 
	- implementamos um controle que não permite importar o mesmo arquivo mais de uma vez. Para tanto cada convênio 
              deverá ter um layout cadastrado.
                                            
* Foi implementada a geração de um arquivo texto com o resultado do desconto de um convênio na Folha.
* Cadastro de rubricas individuais possui as seguintes implementações adicionais:
	- permite que uma rubrica individual possa ser associada a um beneficiário.
	- foi incluída a data início da rubrica individual para o caso de Pensão Alimentícia.
	- foi incluída uma opção para considerar todos os descontos na formação da base de cálculo da Pensão Alimentícia.
* Implementações no Preparo da Folha:
	- criado um relatório de preparo da Folha, que mostra as informações de valor bruto dos benefícios a serem pagos e
              o valor das contribuições a serem descontadas.
	- opção de desfazer o preparo da folha está implementada nesta versão. Para executar esta função deve-se selecionar 
              um lote na tela de Prévia da Folha.
	- revisão no processamento do cálculo de contribuições dos beneficiários, com a inclusão de mensagens na tela de 
              resultado de quantidades das contribuições calculadas com sucesso e com erro. 
* Resolvido o problema associado a mensagem de erro "qrymatric.idpessoa not found" na consulta a previa da folha.
* Implementações na Prévia da Folha:
 
	- resolvido o problema associado a mensagem de erro "Is not a valid integer value " na Prévia da Folha.
	- arredondamento de benefícios para beneficiários que possuem conta salário. Este valor de arredondamento é 
               parametrizado.
	- foi criada uma rubrica de imposto de renda específica para Resgate de Reserva de Poupança.
	- parametrização da forma de cálculo das rubricas se por Arredondamento ou por Truncamento de valores devidos.
* Resolvido o problema da ordenação da combobox de agências no cadastro de contas bancárias. 
* Relatórios otimizados:    
	- demonstrativo da folha na fase de prévia.
	- relação de pagamentos de benefícios por banco.
	- relação de pagamentos de benefícios por agência.
================================================================================
CM$VER      3.01.05     14/08/2000
--------------------------------------------------------------------------------
Correção na execução da Prévia Normal da Folha de Benefício, que não processava 
corretamente os lotes de concessão selecionados.
================================================================================
CM$VER      3.01.04     09/08/2000
--------------------------------------------------------------------------------
Adaptação da Folha de Benefícios para utilizar as novas funcionalidades do Padrão, 
em termos de contabilização por Plano e Patrocinadora.
================================================================================
CM$VER      3.01.03     11/07/2000
--------------------------------------------------------------------------------
 - Correção do Cadastro de Layout de importação de arquivos
 - Correção da Importação de arquivos
================================================================================
CM$VER      3.01.02     13/06/2000
--------------------------------------------------------------------------------
Implementacao da Consulta a Previa da Folha de Beneficios
Otimização das querys do cadastro de conta bancaria
================================================================================
CM$VER      3.01.01     06/05/2000
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 1168
  > Tela\Opçao No Sistema: Folha de Benefício de 13.o
  Calculo da folha de Abono (13.o)
- Resolução da Pendência Nº 1468
  > Tela\Opçao No Sistema: Preparo
  Versão da Folha da Refer
- Resolução da Pendência Nº 1559
  > Tela\Opçao No Sistema:
  contra cheque serpros
================================================================================
CM$VER      3.01.00     20/04/2000
--------------------------------------------------------------------------------
Inclusão do SubTipo Alimentados, no cadastro de rubricas individuais, quando da pensão alimentícia
Cadastro novo de Alimentados
Atualização e padronização de todos os relatórios
Otimização das query`s do  preparo de benefícios e contribuicões, prévia da folha e efetivação
Retenção automática do pagamento quando do final do beneficio
Alteração no recebimento do arquivo texto de entidades, no que se refere a seguros
================================================================================
CM$ALT}






























