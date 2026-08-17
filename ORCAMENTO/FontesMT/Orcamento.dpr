Program Orcamento;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  UModulo in 'UModulo.pas',
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  CmSqlWzd in 'CmSqlWzd.pas',
  FAguardeDDic in 'FAguardeDDic.pas' {FrmAguardeDDic},
  FDataDic in 'FDataDic.pas' {FrmDataDic},
  AssistenteExpot in 'AssistenteExpot.pas' {FrmAssistenteExport},
  Asistente in 'Asistente.pas' {FrmAssistente},
  FConfAltCont in 'FConfAltCont.pas' {FrmConfAltCont},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadCenarioMT in 'FCadCenarioMT.pas' {frmCadCenarioMT},
  FCadPlanoOrcMT in 'FCadPlanoOrcMT.pas' {frmCadPlanoOrcMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FCriaRelatorioMT in 'FCriaRelatorioMT.pas' {frmCriaRefrmlatorioMT},
  FCadGruposMT in 'FCadGruposMT.pas' {frmCadGruposMT},
  FCadUsuxCRespMT in 'FCadUsuxCRespMT.pas' {FrmCadUsuxCRespMT},
  FCadTipoCriterioRatMT in 'FCadTipoCriterioRatMT.pas' {frmCadTipoCriterioRatMT},
  FCopiaContaOrcamenMT in 'FCopiaContaOrcamenMT.pas' {frmCopiaContaOrcamenMT},
  FCompromissoMT in 'FCompromissoMT.pas' {frmCompromissoMT},
  FTransfereMT in 'FTransfereMT.pas' {frmTransfereMT},
  FEncerraExercicioMT in 'FEncerraExercicioMT.pas' {frmEncerraExercicioMT},
  FLancamentoMT in 'FLancamentoMT.pas' {frmLancamentoMT},
  FReservaMT in 'FReservaMT.pas' {frmReservaMT},
  FRetornoMT in 'FRetornoMT.pas' {frmRetornoMT},
  FSuplemenMT in 'FSuplemenMT.pas' {frmSuplemenMT},
  FEfetivacaoMT in 'FEfetivacaoMT.pas' {frmEfetivacaoMT},
  fParamReports_Padrao in '..\Reports\Source\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  rAtivGestor in '..\Reports\Source\rAtivGestor.pas',
  rAtivGestor2 in '..\Reports\Source\rAtivGestor2.pas',
  rCompContas in '..\Reports\Source\rCompContas.pas',
  rCompoOrcamen in '..\Reports\Source\rCompoOrcamen.pas',
  rCompromisso in '..\Reports\Source\rCompromisso.pas',
  rDemoLayout in '..\Reports\Source\rDemoLayout.pas',
  rExemplo in '..\Reports\Source\rExemplo.pas',
  rGraCenResp in '..\Reports\Source\rGraCenResp.pas',
  rGraComparativo in '..\Reports\Source\rGraComparativo.pas',
  rGraGrupo in '..\Reports\Source\rGraGrupo.pas',
  rImprimeCompromisso in '..\Reports\Source\rImprimeCompromisso.pas',
  rListaCompromisso in '..\Reports\Source\rListaCompromisso.pas',
  rListaContas in '..\Reports\Source\rListaContas.pas',
  rListaReserva in '..\Reports\Source\rListaReserva.pas',
  rListaRetorno in '..\Reports\Source\rListaRetorno.pas',
  rListaSuplemen in '..\Reports\Source\rListaSuplemen.pas',
  rListaTransf in '..\Reports\Source\rListaTransf.pas',
  rOrcxRealConta in '..\Reports\Source\rOrcxRealConta.pas',
  rRelatGrupo in '..\Reports\Source\rRelatGrupo.pas',
  rRelatGrupoAnual in '..\Reports\Source\rRelatGrupoAnual.pas',
  rRelatGrupoCResp in '..\Reports\Source\rRelatGrupoCResp.pas',
  rReserva in '..\Reports\Source\rReserva.pas',
  rRetorno in '..\Reports\Source\rRetorno.pas',
  rSaldos in '..\Reports\Source\rSaldos.pas',
  rSaldosSint in '..\Reports\Source\rSaldosSint.pas',
  rSuplemen in '..\Reports\Source\rSuplemen.pas',
  rTotCenResp in '..\Reports\Source\rTotCenResp.pas',
  rTransf in '..\Reports\Source\rTransf.pas',
  FCmReport in '..\Reports\Source\FCmReport.pas' {FrmCmReport},
  FCadPeriodoOrcMT in 'FCadPeriodoOrcMT.pas' {frmCadPeriodoOrcMT},
  FCadLayoutOrcMT in 'FCadLayoutOrcMT.pas' {frmCadLayoutOrcMT},
  FAcertaSaldoMT in 'FAcertaSaldoMT.pas' {frmAcertaSaldoMT},
  rRelatGrupoCCust in '..\Reports\Source\rRelatGrupoCCust.pas' {rptRelatGrupoCCust},
  fRParamListaSuplemenMT in '..\Reports\Source\fRParamListaSuplemenMT.pas' {frmRParamListaSuplemenMT},
  fRParamComparativoMT in '..\Reports\Source\fRParamComparativoMT.pas' {frmRParamComparativoMT},
  fRParamDemoLayoutMT in '..\Reports\Source\fRParamDemoLayoutMT.pas' {frmRParamDemoLayoutMT},
  fRParamListaCompromissoMT in '..\Reports\Source\fRParamListaCompromissoMT.pas' {frmRParamListaCompromissoMT},
  fRParamListaContasMT in '..\Reports\Source\fRParamListaContasMT.pas' {frmRParamListaContasMT},
  fRParamListaReservaMT in '..\Reports\Source\fRParamListaReservaMT.pas' {frmRParamListaReservaMT},
  fRParamListaRetornoMT in '..\Reports\Source\fRParamListaRetornoMT.pas' {frmRParamListaRetornoMT},
  fRParamAtivGestor2MT in '..\Reports\Source\fRParamAtivGestor2MT.pas' {frmRParamAtivGestor2MT},
  fRParamListaTransfMT in '..\Reports\Source\fRParamListaTransfMT.pas' {frmRParamListaTransfMT},
  fRParamOrcxRealContaMT in '..\Reports\Source\fRParamOrcxRealContaMT.pas' {frmRParamOrcxRealContaMT},
  fRParamRelatGrupoAnualMT in '..\Reports\Source\fRParamRelatGrupoAnualMT.pas' {frmRParamRelatGrupoAnualMT},
  fRParamRelatGrupoCCustMT in '..\Reports\Source\fRParamRelatGrupoCCustMT.pas' {frmRParamRelatGrupoCCustMT},
  fRParamRelatGrupoCRespMT in '..\Reports\Source\fRParamRelatGrupoCRespMT.pas' {frmRParamRelatGrupoCRespMT},
  fRParamRelatGrupoMT in '..\Reports\Source\fRParamRelatGrupoMT.pas' {frmRParamRelatGrupoMT},
  fRParamSaldosMT in '..\Reports\Source\fRParamSaldosMT.pas' {frmRParamSaldosMT},
  fRParamSaldosSintMT in '..\Reports\Source\fRParamSaldosSintMT.pas' {frmRParamSaldosSintMT},
  fRParamTotCenRespMT in '..\Reports\Source\fRParamTotCenRespMT.pas' {frmRParamTotCenRespMT},
  FBuscaContabilMT in 'FBuscaContabilMT.pas' {frmBuscaContabilMT},
  FEfetivaCenarioMT in 'FEfetivaCenarioMT.pas' {frmEfetivaCenarioMT},
  FEntDadosCenarioMT in 'FEntDadosCenarioMT.pas' {frmEntDadosCenarioMT},
  FEntDadosDiariaMT in 'FEntDadosDiariaMT.pas' {frmEntradaDadosDiariaMT},
  FEntDadosMT in 'FEntDadosMT.pas' {frmEntradaDadosMT},
  FManipCenarioMT in 'FManipCenarioMT.pas' {frmManipCenarioMT},
  FEntSuplemenEspecialMT in 'FEntSuplemenEspecialMT.pas' {frmEntSuplemenEspecialMT},
  FEntCadDadosEspecialCenarioMT in 'FEntCadDadosEspecialCenarioMT.pas' {frmEntCadDadosEspecialCenarioMT},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  DAutorizacao in '..\..\Cm\Forms\Source\DAutorizacao.pas' {DtmAutorizacao: TDataModule},
  FParamOrcamenMT in 'FParamOrcamenMT.pas' {frmParamOrcamenMT},
  FRParamRateioPlanoTrabalhoMT in '..\Reports\Source\FRParamRateioPlanoTrabalhoMT.pas' {frmRParamRateioPlanoTrabalho},
  rRelatRateioPlanoTrabalho in '..\Reports\Source\rRelatRateioPlanoTrabalho.pas' {rptRelatRateioPlanoTrabalho},
  uCtrlRptOrcamen in '..\Reports\Source\uCtrlRptOrcamen.pas',
  FConsLogCenarioMT in 'FConsLogCenarioMT.pas' {frmConsLogCenarioMT},
  FRParamPlanoTrabalho in '..\Reports\Source\FRParamPlanoTrabalho.pas' {frmRParamPlanoTrabalho},
  rRelatPlanoTrabalho in '..\Reports\Source\rRelatPlanoTrabalho.pas' {rptRelatPlanoTrabalho},
  uCtrlAlterorcamento in '..\CtrlObjects\uCtrlAlterorcamento.pas',
  uCtrlCadCenario in '..\CtrlObjects\uCtrlCadCenario.pas',
  uCtrlCadContasOrc in '..\CtrlObjects\uCtrlCadContasOrc.pas',
  uCtrlCadGrupos in '..\CtrlObjects\uCtrlCadGrupos.pas',
  uCtrlCadLayOutOrc in '..\CtrlObjects\uCtrlCadLayoutOrc.Pas',
  uCtrlCadTipoCriterioRat in '..\CtrlObjects\uCtrlCadTipoCriterioRat.pas',
  uCtrlCadUsuxCResp in '..\CtrlObjects\uCtrlCadUsuxCResp.pas',
  uCtrlCadValCriterioRat in '..\CtrlObjects\uCtrlCadValCriterioRat.pas',
  uCtrlCenarioOrcamen in '..\CtrlObjects\uCtrlCenarioOrcamen.pas',
  uCtrlCompContasOrcamen in '..\CtrlObjects\uCtrlCompContasOrcamen.pas',
  uCtrlCompromisso in '..\CtrlObjects\uCtrlCompromisso.pas',
  uCtrlContaOrcamentaria in '..\CtrlObjects\uCtrlContaOrcamentaria.pas',
  uCtrlCopiaContaOrcamen in '..\CtrlObjects\uCtrlCopiaContaOrcamen.pas',
  uCtrlCriaRelatorio in '..\CtrlObjects\uCtrlCriaRelatorio.pas',
  uCtrlEfetivacao in '..\CtrlObjects\uCtrlEfetivacao.pas',
  uCtrlLancamentoOrc in '..\CtrlObjects\uCtrlLancamentoorc.pas',
  uCtrlLinhasRelatOrc in '..\CtrlObjects\uCtrlLinhasRelatOrc.pas',
  uCtrlPeriodoOrcamen in '..\CtrlObjects\uCtrlPeriodoOrcamen.pas',
  uCtrlPlanilhaContabil in '..\CtrlObjects\uCtrlPlanilhaContabil.pas',
  uCtrlPlanoOrcamen in '..\CtrlObjects\uCtrlPlanoOrcamen.pas',
  uCtrlRelatOrcamento in '..\CtrlObjects\uCtrlRelatOrcamento.pas',
  uDMCopiaContaOrcamen in 'uDMCopiaContaOrcamen.pas' {dtmCopiaContaOrcamen: TDataModule},
  uDtmCadLayOutOrc in 'uDtmCadLayOutOrc.pas' {DtmCadLayOutOrc: TDataModule},
  uDbCadCenario in '..\DbObjects\uDbCadCenario.pas',
  uDbCenarioOrcamen in '..\DbObjects\uDbCenarioorcamen.pas',
  uDbCompContasOrcamen in '..\DbObjects\uDbCompContasOrcamen.pas',
  uDbContasOrcamen in '..\DbObjects\uDbContasOrcamen.pas',
  uDbCriterioRatOrc in '..\DbObjects\uDbCriterioRatOrc.pas',
  uDbDataView in '..\DbObjects\uDbDataView.pas',
  uDbDesenhoOrc in '..\DbObjects\uDbDesenhoOrc.pas',
  uDbGrupoOrcamen in '..\DbObjects\uDbGrupoorcamen.pas',
  uDbLancamentoorc in '..\DbObjects\uDbLancamentoorc.pas',
  uDbLinhasrelatorc in '..\DbObjects\uDbLinhasrelatorc.pas',
  uDbAlterorcamento in '..\DbObjects\uDbAlterorcamento.pas',
  uDbPeriodoOrcamen in '..\DbObjects\uDbPeriodoOrcamen.pas',
  uDbPessoaXCresp in '..\DbObjects\uDbPessoaXCresp.pas',
  uDbPlanoOrcamen in '..\DbObjects\uDbPlanoOrcamen.pas',
  uDbRelatOrc in '..\DbObjects\uDbRelatorc.pas',
  uDbValorCriRatOrc in '..\DbObjects\uDbValorCriRatOrc.pas',
  FDocReceberMT in 'FDocReceberMT.pas' {frmDocReceberMT},
  uCtrlEfetivaCenario in '..\CtrlObjects\uCtrlEfetivaCenario.pas',
  uDtmEfetivaCenario in 'uDtmEfetivaCenario.pas' {dtmEfetivaCenario: TDataModule},
  uDtmGeraDados in 'uDtmGeraDados.pas' {dtmGeraDados: TDataModule},
  FGeraDadosMT2 in 'FGeraDadosMT2.pas' {frmGeraDadosMT2},
  uCtrlGeraDados in '..\CtrlObjects\uCtrlGeraDados.pas',
  FBIParametros in 'FBIParametros.pas' {frmBIParametros},
  FBIGrid in 'FBIGrid.pas' {frmBIGrid},
  uCtrlEntCadDadosEspecial in '..\CtrlObjects\uCtrlEntCadDadosEspecial.pas',
  udtmEntCadDadosEspecial in 'udtmEntCadDadosEspecial.pas' {dtmEntCadDadosEspecial: TDataModule},
  uCtrlCadContasOrcPorGrupo in '..\CtrlObjects\uCtrlCadContasOrcPorGrupo.Pas',
  FExecReplicaCriterio in 'FExecReplicaCriterio.pas' {frmExecReplicaCriterio},
  UVerificaPreenchimento in '..\CtrlObjects\UVerificaPreenchimento.pas',
  FCadContasOrcPorGrupoAuxMT in 'FCadContasOrcPorGrupoAuxMT.pas' {frmCadContasOrcPorGrupoAuxMT},
  FCadContasOrcPorGrupoMT in 'FCadContasOrcPorGrupoMT.pas' {frmCadContasOrcPorGrupoMT},
  FConsOrcadoXRealizadoSemestre in 'FConsOrcadoXRealizadoSemestre.pas' {frmConsOrcadoXRealizadoSemestre},
  uReccodigo in 'uReccodigo.pas',
  FCadContasOrcMT in 'FCadContasOrcMT.pas' {frmCadContasOrcMT},
  FCadContasOrcPorGrupoCentResponMT in 'FCadContasOrcPorGrupoCentResponMT.pas' {frmCadContasOrcPorGrupoCentResponMT},
  FCadContasOrcPorGrupoCentResponAuxMT in 'FCadContasOrcPorGrupoCentResponAuxMT.pas' {frmCadContasOrcPorGrupoCentResponAuxMT},
  FProgressoDuplo in '..\..\Cm\Forms\Source\FProgressoDuplo.pas' {frmProgressoDuplo},
  mPlanoOrcamentarioMT in 'mPlanoOrcamentarioMT.pas' {molPlanoOrcamentario: TFrame},
  FCadFormulaApuraOrcMT in 'FCadFormulaApuraOrcMT.pas' {FrmCadFormulaApuraOrcMT},
  FExecApuraOrcMT in 'FExecApuraOrcMT.pas' {FrmExecApuraOrcMT},
  uCtrlCadFormulaApuraOrc in '..\CtrlObjects\uCtrlCadFormulaApuraOrc.pas',
  uCtrlExecApuraOrcMT in '..\CtrlObjects\uCtrlExecApuraOrcMT.pas',
  uDbFormOrcado in '..\DbObjects\uDbFormOrcado.pas',
  uDbFormasApuraOrc in '..\DbObjects\uDbFormasApuraOrc.pas',
  FWizardMT in '..\..\Cm\Forms\SourceMT\FWizardMT.pas' {frmWizardMT},
  FWzExecApuraOrc in 'FWzExecApuraOrc.pas' {FrmWzExecApuraOrc},
  FProgresso in '..\..\cm\forms\Source\FProgresso.pas' {frmProgresso},
  FWizImportaOrc in 'FWizImportaOrc.pas' {frmWizImportaOrc},
  uCtrlParamImportOrc in '..\CtrlObjects\uCtrlParamImportOrc.pas',
  uDbParamimportorc in '..\DBObjects\uDbParamimportorc.pas',
  uCtrlTransacoesPorGrupo in '..\CtrlObjects\uCtrlTransacoesPorGrupo.pas',
  FTransfPorGrupoMT in 'FTransfPorGrupoMT.pas' {FrmTransfPorGrupoMT},
  FSuplemDeduPorGrupoMT in 'FSuplemDeduPorGrupoMT.pas' {FrmSuplemDeduPorGrupoMT},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  FCadValCriterioRatMT in 'FCadValCriterioRatMT.pas' {frmCadValCriterioRatMT},
  fRParamListaReservaPorGrupoMT in '..\Reports\Source\fRParamListaReservaPorGrupoMT.pas' {frmRParamListaReservaPorGrupoMT},
  rListaResCompPorGrupoMT in '..\Reports\Source\rListaResCompPorGrupoMT.pas' {RptListaResCompPorGrupoMT},
  fRParamListaCompromissoPorGrupoMT in '..\Reports\Source\fRParamListaCompromissoPorGrupoMT.pas' {frmRParamListaCompromissoPorGrupoMT},
  RListaAlterPorGrupoMT in '..\Reports\Source\RListaAlterPorGrupoMT.pas' {RptListaAlterPorGrupoMT},
  FReservasPorGrupoMT in 'FReservasPorGrupoMT.pas' {FrmReservasPorGrupoMT},
  FCompromissosPorGrupoMT in 'FCompromissosPorGrupoMT.pas' {FrmCompromissosPorGrupoMT},
  FEntDadosPorGrupoMT in 'FEntDadosPorGrupoMT.pas' {FrmEntDadosPorGrupoMT},
  RSuplemDeduPorGrupoMT in '..\Reports\Source\RSuplemDeduPorGrupoMT.pas' {RptSuplemDeduPorGrupoMT},
  fRParamOrcxRealGrupoContaMT in '..\Reports\Source\fRParamOrcxRealGrupoContaMT.pas' {frmParamOrcXRealGrupoContaMT},
  rOrcxRealGrupoConta in '..\Reports\Source\rOrcxRealGrupoConta.pas' {rptOrcxRealGrupoConta},
  FGeracaoDadosMT in 'FGeracaoDadosMT.pas' {FrmGeracaoDadosMT},
  RDemonsRealxContabxFluxo in '..\Reports\Source\RDemonsRealxContabxFluxo.pas' {RptDemonsRealxContabxFluxo},
  rDivergOrcxReal in '..\Reports\Source\rDivergOrcxReal.pas' {RptDivergOrcxReal},
  FJustDiverg in 'FJustDiverg.pas' {FrmJustDiverg},
  uDbDescdivergorc in '..\DbObjects\uDbDescdivergorc.pas',
  RContaContabGrupo in '..\Reports\Source\RContaContabGrupo.pas' {RptContaContabGrupo},
  uCtrlBlqEntDados in '..\CtrlObjects\uCtrlBlqEntDados.pas',
  FCadBlqEntDadosMT in 'FCadBlqEntDadosMT.pas' {FrmCadBlqEntDadosMT},
  uDbBlqentdados in '..\DbObjects\uDbBlqentdados.pas',
  uDbDetblqentdados in '..\DbObjects\uDbDetblqentdados.pas',
  FImportaDadosEntradaEspecial in 'FImportaDadosEntradaEspecial.pas' {FImportaEntradaDadosEspecial},
  UCtrlImportaEntDados in '..\CtrlObjects\UCtrlImportaEntDados.pas',
  uCtrlVinculaOrcadoContabil in '..\CtrlObjects\uCtrlVinculaOrcadoContabil.pas',
  FImportaGrupoOrcamen in 'FImportaGrupoOrcamen.pas' {FImportacaoGrupoOrcamen},
  UCtrlImportaGrupoOrcamen in '..\CtrlObjects\UCtrlImportaGrupoOrcamen.pas',
  FAnaliseGeracaoContasOrcamen in 'FAnaliseGeracaoContasOrcamen.pas' {FrmAnaliseGeracaoContasOrcamen},
  fMostraRelat in '..\..\Cm\Forms\Source\Relatorios\fMostraRelat.pas' {frmMostraRelat},
  uCmCtrlReports in '..\..\Cm\Forms\Source\Relatorios\uCmCtrlReports.pas',
  uCtrlReservaOrcamen in '..\..\CMPlaneOrcObj50\CtrlObjects\uCtrlReservaorcamen.pas',
  FVinculaOrcadoContabil in 'FVinculaOrcadoContabil.pas' {frmVinculaOrcadoContabil},
  FVinculaOrcadoContabilDetalhe in 'FVinculaOrcadoContabilDetalhe.pas' {FrmVinculaOrcadoDetalhe},
  FVinculaOrcadoContabilParametros in 'FVinculaOrcadoContabilParametros.pas' {FrmVinculaOrcadoContabilparamatros},
  FVinculaOrcadoAtualizacao in 'FVinculaOrcadoAtualizacao.pas' {FrmVinculaOrcadoAtualizacao},
  uCtrlCadContasContabPorGrupo in '..\CtrlObjects\uCtrlCadContasContabPorGrupo.pas',
  uCtrlRelValoresRealizadoOrcadoPorGrupo in '..\Reports\Source\uCtrlRelValoresRealizadoOrcadoPorGrupo.pas',
  rRelatGrupoAtividadeProjeto in '..\Reports\Source\rRelatGrupoAtividadeProjeto.pas' {rptRelatGrupoAtividadeProj},
  uCtrlDespesaOrcamentaria in '..\CtrlObjects\uCtrlDespesaOrcamentaria.pas',
  uDbDespesaOrcamentaria in '..\DBObjects\uDbDespesaOrcamentaria.pas',
  uDbDespesaOrcxCCusto in '..\DBObjects\uDbDespesaOrcxCCusto.pas',
  FPlanoTrabalhoMT in 'FPlanoTrabalhoMT.pas' {frmPlanoTrabalhoMT},
  uDbPlanotrabalhoorc in '..\DBObjects\uDbPlanotrabalhoorc.pas',
  uCtrlPlanoTrabalho in '..\CtrlObjects\uCtrlPlanoTrabalho.pas',
  FFornecedorSubDespesa in 'FFornecedorSubDespesa.pas' {FrmFornecedorSubDespesa};

{$R *.RES}
{$R ORCAMENTO_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;
  Application.Initialize;
  Application.Title := 'Planejamento e Orçamento';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TFrmAguardeDDic, FrmAguardeDDic);
  Application.CreateForm(TFrmDataDic, FrmDataDic);
  Application.CreateForm(TfrmProgressoDuplo, frmProgressoDuplo);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TrptRelatGrupoAtividadeProj, rptRelatGrupoAtividadeProj);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;

  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Planejamento e Orçamento
================================================================================
CM$VER      3.08.21m    26/06/2008
--------------------------------------------------------------------------------
Pendência 20632 - Posição de Saldo Orçamentários (Sintético)
- Corrigido problema de agrupamento.
================================================================================
CM$VER      3.08.21l    24/06/2008
--------------------------------------------------------------------------------
Pendência 20632 - Posição de Saldo Orçamentários (Sintético)
- Alterada forma de pesquisa por grupo de contas.
Pendência 27759 (*** ajuste ***)
- Ao replicar um determinado critério para o ano seguinte, o campo período final, na tela de Valores Base para Rateio está ficando em branco, gerando erro ao procurar o referido ref erido critério, conforme anexo.
================================================================================
CM$VER      3.08.21k    20/06/2008
--------------------------------------------------------------------------------
Pendência 20423 - Emissão da Rserva Especial
- Resolvido problema de filtragem incorreta.
Pendência 20632 - Posição de Saldo Orçamentários (Sintético)
- Resolvido problema de agrupamento incorreto.
Pendência 27759
- Ao replicar um determinado critério para o ano seguinte, o campo período final, na tela de Valores Base para Rateio está ficando em branco, gerando erro ao procurar o referido ref erido critério, conforme anexo.
Pendência 27744
- Deixar visíveis nas telas de "Processos" ,"Entrada de Dados Especial" e "Cenários",apenas os planos de trabalho relacionados ao ano atual. Ressalto que no padrão 16 este problema não ocorre.
Pendência 27760
- Está dando o seguinte erro ao encerrar o exercício: "Encerramento do Exercício com problemas".
================================================================================
CM$VER      3.08.21j    11/06/2008
--------------------------------------------------------------------------------
Pendência 27760
Erro de Conversão, ao tentar encerrar do exercicio. Tele de Processo/Encerramento de Exercicio.
Pendência 27744 Deixar visíveis nas telas de "Processos" ,"Entrada de Dados Especial" e "Cenários", 
 apenas os planos de trabalho relacionados ao ano atual. Ressalto que no padrão 16 este problema não ocorre.
Pendência 27759
Tela: Critérios para rateio\Valores Base para rateio.
Descrição: Ao replicar um determinado critério para o ano seguinte, o campo período final, na tela de Valores Base para Rateio está ficando em branco, gerando erro ao procurar o referido ref erido critério, conforme anexo.
================================================================================
CM$VER      3.08.21i    07/05/2008
--------------------------------------------------------------------------------
Pendência: 27798
Tela: Entrada de dados especial
Descrição: Ao clicar no botão calcular, a tela exibe mensagem de 
quantidade centro de custo não relacionado, mas não os indica, 
não permitido que o usuário veja que o relacionamento de centros de custos incorretos 
(o centro de custo pode estar desativado ou pertencer a outro plano de centros de custos).
Solução: fazer o sistema exibir mensagem mais específica, a lista de centros de custo com todos os atributos.
Pendência: 27761
Tela: Cadastros\Contas orçamentárias por grupo
Descrição: ao parametrizar um centro de responsabilidade para um determinado grupo orçamentário está dando a seguinte crítica : 
"Este centro de responsabilidade está desativado e não é permitido associá-lo a novos cadastros". No entanto, conforme verificado 
na tabela "CENTRESPON" o mesmo está com o status de "Ativo".
================================================================================
CM$VER      3.08.21h    01/04/2008
--------------------------------------------------------------------------------
Pendência: 27687
Descrição: Retirando da tela principal as chamadas para (Geral de Pessoa e Uso Pessoal).
================================================================================
CM$VER      3.08.21g    31/03/2008
--------------------------------------------------------------------------------
Pendência: 20425 (ajuste)
Tela: Cosultas\Relatórios\Gráficos\Distribuição orçamentária por centro de Responsabilidade
Descrição: Implementar no relatório as opções de Plano, Patrocinadora e Centro de Custo. Relatório nº1344\
Pendência: 20394 (ajuste)
Tela: Cosultas\Relatórios\Gráficos\Distribuição orçamentária por Grupo de Contas
Descrição: Implementar no gráfico as opções de filtro para Plano, Patrocinadora e Centro de Custo
================================================================================
CM$VER      3.08.21f    17/03/2008
--------------------------------------------------------------------------------
Pendencia : 27569.
Inserindo Help nas telas do padrão.
================================================================================
CM$VER      3.08.21e    25/01/2008
--------------------------------------------------------------------------------
Pendência: 27286
Tela : Cadastros\Contas Orçamentárias
Ao cadastrar um novo plano, não está sendo possível inserir uma nova conta ou alterar uma conta já existente. 
================================================================================
CM$VER      3.08.21d    07/12/2007
--------------------------------------------------------------------------------
Pendência: 26820
Telas: Cadastro de Contas orçamentárias por grupo/Entrada de dados
Descrição: problema ocorrido com alguns os grupos cujo centro de responsabilidade é 
- Na tela de cadastro de contas orçamentárias por grupo a aba "Centro de responsabilidade" está em branco. 
- Na tela entrada de dados especial não está monstrando os relacionamentos dos grupos em questão
================================================================================
CM$VER      3.08.21c    07/12/2007
--------------------------------------------------------------------------------
Pendência: 26820
Telas: Cadastro de Contas orçamentárias por grupo/Entrada de dados
Descrição: problema ocorrido com alguns os grupos cujo centro de responsabilidade é 
- Na tela de cadastro de contas orçamentárias por grupo a aba "Centro de responsabilidade" está em branco. 
- Na tela entrada de dados especial não está monstrando os relacionamentos dos grupos em questão
================================================================================
CM$VER      3.08.21b    26/11/2007
--------------------------------------------------------------------------------
Pendência: 26593
Relatório: Relatórios\Gerenciais\Orçado x Realizado Por Grupo
Descrição do problema: Os valores do Orçado e Realizado não esta respeitando a filtragem 
do parametro II - Centro de Custo, repetindo o mesmo valor para os centros de custos e esses 
valores não estão corretos, o valor apresentando refere-se ao total dos grupos e não do centro de custo.
Pendência: 26595
Telas: Cadastros\Contas Orçamentátias Por Grupo
Descrição do problema: ao procurar um determinado compromisso orçamentário o botão 
procurar não está buscando as informações. Foi feito um compromisso para o grupo orçamentário .520102
 - operação 7 data de referência 09/10/2007.
================================================================================
CM$VER      3.08.21a    22/11/2007
--------------------------------------------------------------------------------
Pendência: 26644
Tela: Cadstros\ Grupo de Contas Orçamentárias
Descrição: Ao procurar um grupo já cadastrado e alterá-lo é apresentado erro de 
'Access Violation'. O mesmo só ocorre caso sejam feitas uma alterações e inserções 
alternadamente. Na maquina da usuaria somente é possivel sair da tela finalizando o 
sistema (CTRL+ALT+DEL). 
================================================================================
CM$VER      3.08.21     20/06/2008
--------------------------------------------------------------------------------
Liberação do padrão 5.10.18
================================================================================
CM$VER      3.08.20a    20/08/2007
--------------------------------------------------------------------------------
Pendência: 20632 Consultas\Relatórios\Operacionais\Posição de saldos orçamentários (sintético)
Descrição: Incluido as opções de filtro para plano, patrocinadora, c.custo e atividade/projeto
Pendência: 20591 Consultas\Relatórios\Cadastrais\Composição das Contas Orçamentárias
Descrição: Incluído o filtro de Grupo Orçamentário para melhor análise das composições
das contas orçamentárias.
Pendência: 22003
Tela:  Consultas \ Relatórios \ Gerenciais \ Distribuição de saldos por grupo orçamentário
Descrição: Incluído o filtro por Plano Previdenciário e a Patrocinadora
Pendência: 20394 
Tela:  Consultas \ Relatórios \ Gráficos \ Distribuição por grupo de contas
Descrição: Incluído o filtro por Plano Previdenciário, Patrocinadora e Centro de Custo.
Pendência: 20425 
Tela:  Consultas \ Relatórios \ Gráficos \ Distribuição por centro de Responsabilidade
Descrição: Incluído o filtro por Plano Previdenciário, Patrocinadora e Centro de Custo.
Pendência: 20423
Tela:  Consultas \ Relatórios \ Emissões Diversas \ Emissão da Reserva Orçamentária
Descrição: Incluído o filtro por Plano Previdenciário, Patrocinadora, Atividade e Projeto e Centro de Custo.
================================================================================
CM$VER      3.08.20     14/08/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.17
Pendência: 24442 Consultas \ Relatórios \ Gráficos \ Comparativos Orçado x Realizado
Descrição: Incluído um opção de filtro pelo grupo orçamentário
Pendência: 20288 Consultas \ Relatórios \ Gerenciais \ Valores por Grupo
Descrição: Incluído os filtros centro de custo, Atividade e projeto, Plano e Patro
para serem exibidos no relatório.
================================================================================
CM$VER      3.08.19a    20/06/200
--------------------------------------------------------------------------------
Pendência: 22604 Cadastros\Bloqueio da entrada de dados
Descrição: Implementado tela para cadastramento de período/exercício do bloqueio
para a entrdada de dados.
================================================================================
CM$VER      3.08.19     20/06/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.16
================================================================================
CM$VER      3.08.18d    20/06/2007
--------------------------------------------------------------------------------
Pendência: 25512 Geração de dados
Descrição: Corrigido o erro em que ao realizar a geração de dados, o valor do
realizado contábil não estava sendo considerado
================================================================================
CM$VER      3.08.18c    17/05/2007
--------------------------------------------------------------------------------
Pendência: 23437 Entrada de dados/Especial
Descrição: Ajustado o processo de rateio para atender a opção "Anual"
================================================================================
CM$VER      3.08.18b    11/05/2007
--------------------------------------------------------------------------------
Pendência: 24859 Consultas/Relatórios/Gerenciais/Orçado x Realizado - Por grupo
Descrição: Corrigido o erro em que o filtro de Plano Previdenciário não estava
sendo sensibilizado.
================================================================================
CM$VER      3.08.18a    26/04/2007
--------------------------------------------------------------------------------
Pendência: 23238 (Reajuste) Processos/Reservas - Compromisso Orçamentário Especial
Descrição: Permitir o cancelamento de "n" reservas/compromissos
================================================================================
CM$VER      3.08.18     5/03/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.15
Pendência: 23802 Entrada de Dados\Especial
Descrição: Vincular o critério de rateio utilizado ao inserir as dotações
Pendência: 23811 Consultas\Relatórios\Gerencias\Contas contábeis por grupo orçamentário
Descrição: Implementado relatório que mostra as contas contábeis cadastradas
para um grupo orçamentário.
================================================================================
CM$VER      3.08.17e    23/04/2007
--------------------------------------------------------------------------------
Pendência: 25149 Processos\Compromisso Orçamentário - Especial
                 Processos\Reserva Orçamentária - Especial
                 Processos\Transferência Orçamentária - Especial
                 Processos\Ajuste Orçamentário - Especial
Descrição: Corrigido o erro em que ao realizar qualquer uma das operações especiais
os dados não estavam persistindo na tela após o processo.
================================================================================
CM$VER      3.08.17d    05/04/2007
--------------------------------------------------------------------------------
Pendência: 25006 Consultas\Relatórios\Gerenciais\Plano de Trabalho
                 Consultas\Relatórios\Gerenciais\Rateio por Plano de Trabalho
Descrição: Corrigido o erro de "Access violation" ao emitir o relatório
Pendência: 22478 (ajuste) Consultas/Relatórios/Gerenciais/Orçado x Realizado Por Conta - Modelo 2
Descrição: Incluido o campo "Exercício" no relatório
================================================================================
CM$VER      3.08.17c    03/04/2007
--------------------------------------------------------------------------------
Pendência: 23153 Processos\Reserva orçamentária - especial
                 Processos\Compromisso orçamentário - especial
                 Transferência orçamentária - especial
Descrição: Permitir a execução dos processos caso o grupo orçamentário
não possua dotação cadastrada.
================================================================================
CM$VER      3.08.17b    19/03/2007
--------------------------------------------------------------------------------
Pendência: 24769 Processos\Compromisso orçamentário - Especial
Descrição: Corrigido erro de crítica com a integração do CAP, não qual gerava
a mensagem "Valor informado maior que o valor do compromisso"
================================================================================
CM$VER      3.08.17a    05/03/2007
--------------------------------------------------------------------------------
Pendência: 24621 Entrada de Dados/Especial
Descrição: Corrigido o erro de "Invalid DataPacket" ao procurar uma dotação
já efetuada.
================================================================================
CM$VER      3.08.17     09/10/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.14
Pendência: 24470 Geração de Dados
Descrição: Otimizado o processo de geração de dados. 
Pendência: 23238
Descrição: Permitir que uma reserva/compromisso seja cancelado pelo nº informado da operação
Pendência: 23237
Descrição: Incluir automaticamente no campo OBSERVAÇÃO das reservas, compromissos,
transferência e suplementações/deduções, o número da operação automaticamente gerado pelo sistema
================================================================================
CM$VER      3.08.16a    22/12/2006
--------------------------------------------------------------------------------
Pendência: 22175 (Reajuste) Consultas/Relatórios/Gerenciais/Divergência entre saldos Orçados x Realizados
Descrição: Corrigido o erro de filtragem do percentual
Pendência: 21638 (Reajuste) Consultas/Relatórios/Gerenciais/Orçado x Realizado por conta
Descrição: Corrigido o erro no percentual somatório do grupo
================================================================================
CM$VER      3.08.16     09/10/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.13
Pendência: 22175 Consultas/Relatórios/Gerencias/Divergência entre saldos Orçados x Realizados
Descrição: Implementado relatório que mostra as divergências dos saldos Orçados x Realizados
Pendência: 21638  Consultas/Relatórios/Gerenciais/Orçado x Realizado por conta
Descrição: Exibir somatório e variação total dos grupos
Pendência: 23239 Cadastros/Contas Orçamentárias Por Grupo
Descrição: Permitir que um grupo orçamentário seja ativado/inativado
================================================================================
CM$VER      3.08.15a    20/10/2006
--------------------------------------------------------------------------------
Pendência: 20737 Consultas/Relatórios/Gerenciais/Valores por grupo
Descrição: Implementado parâmetro para considerar o sinal do grupo
================================================================================
CM$VER      3.08.15     21/09/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.12
================================================================================
CM$VER      3.08.14d    04/10/2006
--------------------------------------------------------------------------------
Pendência: 23241 Sistema/Configuração/Parâmetros de Sistema
Descrição: Corrigido o erro em que acontecia ao alterar o plano orçamentário
================================================================================
CM$VER      3.08.14c    03/10/2006
--------------------------------------------------------------------------------
Tela: Consultas/Relatórios/Operacionais/Demonstrativo de Cálculo - Geração de Dados
Descrição: Implementado relatório em que exibe o resultado do cálculo do
realizado contábil, pela Geração de Dados.
================================================================================
CM$VER      3.08.14b    18/09/2006
--------------------------------------------------------------------------------
Descrição: Corrigido o erro na Geração de Dados em que somente validava-se o
Centro de Custo da composição da conta orçamentária (Contabilidade) caso a
conta contábil obrigasse o mesmo.
================================================================================
CM$VER      3.08.14a    31/08/2006
--------------------------------------------------------------------------------
Pendência: 23084 Processos/Reserva - Especial
Descrição: Corrigido o erro em que acontecia ao efetuar uma reserva para um
           período que não tenha dotação efetuada (trabalhando com o parâmetro
           "Saldo acumulado até o período")
Pendência: 22851 Sistema/Configurações/Parâmetros de sistema
Descrição: Implementado código para o Orçamento nas Atividades/Projetos para a
           formação dos códigos das contas orçamentárias.
Pendência: 22852 Processos/Compromisso;Reserva;Transferência;Ajuste - Especial
Descrição: Implementado filtro para os relacionamentos em que preferencialmente
           será selecionado relacionamentos para o Centro de Responsabilidade do
           Plano de Trabalho. Caso o usuário não esteja relacionado ao Centro de
           Responsabilidade informado, será listado todos os Centro de Custo do
           grupo e que o usuário esteja relacionado.
Pendência: 22283 Geração de Dados
Descrição: Refeita a tela para sofrer as implementações entre grupo de contas
           orçamentárias
Pendência: 22686 Entrada de Dados/Especial
Descrição: Corrigido o erro em que ao efetuar um processo (Reserva,Compromisso,
           Transferência e Ajuste - Especial) o valor da dotação inicial estava
           sendo impactado.
Descrição: Corrigido o erro de autorização do menu "Geração de Dados"
================================================================================
CM$VER      3.08.14     11/08/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.11
Pendência: 22990 Cadastro/Contas Orçamentárias
Descrição: Corrigido o erro de "Parâmetro não implementado" ao clicar no botão de
           Editar da guia "Contas Orçado"
================================================================================
CM$VER      3.08.13     10/07/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.10
Pendência: 22621 Processos\Reservas Orçamentárias - Especial
Descrição: Implementar botão para cancelamento da reserva
Pendência: 22623 Processos\Compromisso Orçamentário - Especial
Descrição: Incluir campo de observação
Pendência: 22625 Processos\Transferência Orçamentária - Especial
Descrição: Corrigido o erro em que a tela de destino estava utilizando os mesmos
           parâmetros da estruturas da tela de origem.
Pendência: 22627 Processos\Ajuste Orçamentário - Especial
Descrição: Corrigido o erro de cáculo de valor apresentado no grid
Pendência: 22636 Cadastros\Contas Orçamentárias por Grupo
Descrição: Telas de busca (MontaSelect) agora filtram os registros por plano
           orçamentário.
Pendência: 22795  Cadastros/Plano de Trabalho
Descrição: Ordenar Centro de Responsabilidade por nome.
Pendência: 22478  Consultas/Relatórios/Gerenciais/Orçado x Realizado Por Conta - Modelo 2
Descrição: Corrigido o erro em que estava-se somando o para cada conta o total geral
           do grupo.
Pendência: 22686 Entrada de Dados/Especial
Descrição: Não permitir que os processo impactuem na dotação inicial
================================================================================
CM$VER      3.08.12a    22/05/2006
--------------------------------------------------------------------------------
Pendência 22288
Tela Casadtro\Contas Orçamentárias
Descrição do erro: Ao se tentar alterar o registro do detalhe fluxo de caixa,
o sistema esá exibindo um conteúdo do campo Tipo de Recebimento\Desembolso
que é diferente do conteúdo gravado.
================================================================================
CM$VER      3.08.12     08/05/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.09
Pendência: 21129  Cadastros/Contas orçamentárias por grupo
Descrição: Implementado a opção de Grupos na aba "Condicionais"
Pendência: 22009  Cadastros/Contas orçamentárias por grupo
Descrição: Implementado rotina para possibilitar alterações (inclusões/exclusões)
           de relacionamentos efetuados, mesmo com algumas contas já em movimento.
Pendência: 22011  Entrada de dados/Especial
Descrição: Implementado rotina que ao trazer as contas orçamentárias para uma
           nova dotação, exibir também as dotações já efetuadas nas contas. 
Pendência: 20086  Consultas/Relatórios/Operacionais/Listagem de Transferências - Especial
Descrição: Implementado relatório de Transferências orçamentárias por grupo
Pendência: 20085  Consultas/Relatórios/Operacionais/Listagem de Compromissos - Especial
Descrição: Implementado relatório de Compromissos orçamentários por grupo
Pendência: 20084  Consultas/Relatórios/Operacionais/Listagem de Reservas - Especial
Descrição: Implementado relatório de reservas orçamentárias por grupo
Pendência: 17548
Descrição : Implementado relatório Orçado X Realizado por Conta (MODELO 2)
Pendência: 22916
Descrição: Correção do lançamento de compromisso através da reserva ( qdo a
           reserva é o valor total disponível)
================================================================================
CM$VER      3.08.11d    16/03/2006
--------------------------------------------------------------------------------
Pendência : 20088,20089 - Cosultas\Relatórios\Suplementações/Deduções - Especial
Descrição : Implementado relatório específico sobre Suplementações/Deduções(Retornos)
            efetuados entre grupo de contas orçamentárias.
================================================================================
CM$VER      3.08.11c    10/03/2006
--------------------------------------------------------------------------------
Pendência : 21725 - Processos/Compromissos x Reservas x Transferências - Especial
Descrição : Correção do erro ao calcular o critério de rateio
================================================================================
CM$VER      3.08.11b    16/02/2006
--------------------------------------------------------------------------------
Pendência: 21562 Ajuste da Pendência 18162
TELA: Consultas / Relatórios / Gerenciais /
Distribuição de Saldo por Grupos Orçamentários – Modelo 2 – Relatório nº2494\1
================================================================================
CM$VER      3.08.11a    03/02/2006
--------------------------------------------------------------------------------
Data      : 03/02/2006
Descrição : Customizações nas telas de Compromissos/Reservas - Especial
Data      : 30.01.2006 Consultas\Relatórios\Gerencias\Orçado x Realizado Por Conta
Pendência : 17889
Alteração : Exibir variação em percentual no total do grupo.
Data      : 26.01.2006   Cadastros\Critérios de Rateio\Valores Base Para Rateio
Descrição : Adicionado na tela de critério de rateio a informação do exercício
            final.
================================================================================
CM$VER      3.08.11     23/01/2006
--------------------------------------------------------------------------------
Liberação para o padrão 5.10.08
Pendencia: 19150
Tela     : Processos/Reserva Orcamentaria
Descrição: Incluir o campo valot total efetivado da reserva (somatória dos valores dos comprometidos da reserva).
Pendencia: 16460 Processamentos\Reserva Orçamentária  - Especial
Descrição: Implementado nova tela que insere reservas orçamentárias para um
           determinado grupo de contas.
           Pendência: 18002 Cadastros / Critérios de Rateio / Valores base para rateio
Descrição: Permitir inserções somente de centro de custos Analíticos
Pendencia: 20107
Tela     : sistema\utilitários\importação do orçamento via planilha excel
Descrição: implementação importação do orçamento de uma planilha excel.
Pendencia: 20264
Tela     : Consultas/Relatórios/Gráficos/Comparativo Orçado X Realizado
Descrição: Implementar no relatório um filtro para as informações de Plano, Patrocinadora e Centro de Custo.
Nº do chamado no SOL:  34065  Relatório nº 1327\1.
Pendência: 18161  Consuçtas/relatórios/Gerenciais/Orçado x Realizado Por Grupo
Descrição: Implementado o campo descrição para visualização junto com o código do
           centro de custo.
================================================================================
CM$VER      3.08.10k    02/02/2006
--------------------------------------------------------------------------------
Pendencia: 21401 - Entrada de Dados/Por Período
Descrição: - Bloqueio do botão OK, quando o período se encontra bloqueado.
           - Persistência do posicionamento do registro após pressionamento do
             botão OK.
================================================================================
CM$VER      3.08.10j    16/01/2006
--------------------------------------------------------------------------------
Pendencia: 21241 - Entrada de Dados/Por Período
Descrição: Correção do erro encontrado ao se tentar gravar o valor realizado.
================================================================================
CM$VER      3.08.10i    27/12/2005
--------------------------------------------------------------------------------
Pendencia: 21223 - Entrada de Dados/Por Período
Descrição: Impedimento da entrada de dados para os períodos bloqueados.
================================================================================
CM$VER      3.08.10h    24/11/2005
--------------------------------------------------------------------------------
Liberação pra o padrão 5.10.08
Pendencia: 20107
Descrição: implementação importação do orçamento de uma planilha excel.
================================================================================
CM$VER      3.08.10g    26/10/2005
--------------------------------------------------------------------------------
Pendência: 20472 (ajuste)
Tela: Cadastro\Contas Orçamentárias
Descrição: na pasta parametros da conta o campo plano não aparece o nome do plano.
Pendência 20198
Descrição: Problema detectado e solucionado na integração do sistema Compras.
================================================================================
CM$VER      3.08.10f    21/10/2005
--------------------------------------------------------------------------------
Pendencia : 20537
Tela: Cadastros\Contas Orçamentárias
Descrição do erro: Não é possível buscar uma conta sem centro de custo.
================================================================================
CM$VER      3.08.10e    18/10/2005
--------------------------------------------------------------------------------
Pendência: 20472
Tela: Cadastro\Contas Orçamentárias
Descrição: na pasta parametros da conta o campo plano não aparece o nome do plano.
================================================================================
CM$VER      3.08.10d    06/10/2005
--------------------------------------------------------------------------------
Pendencia : 20372   Cadastros\Grupos de contas orçamentarias
Descrição : Correção na rotina em que ao incluir um novo grupo de contas, a
            árvore estava "sumindo".
================================================================================
CM$VER      3.08.10c    23/09/2005
--------------------------------------------------------------------------------
Pendência 19515 (ajuste 4)
-acerto na tela de cadastro de fórmulas: ao cadastrar 2 fórmulas seguidas, o sistema apresenta erro de conflito de períodos.
-acerto na tela de execução da fórmula: o sistema calcula errado o orçamento se alterar a fórmula e executá-la sem excluir o que foi gravado anteriormaente.
================================================================================
CM$VER      3.08.10b    20/09/2005
--------------------------------------------------------------------------------
Pendência : 20069 - Cadastro\Contas Orçamentárias por Grupo
Descrição : Ao alterar um grupo de contas, refeltir essa alteração para todas as contas e
            suas composições.
Pendência : 20251 - Cadastro\Contas Orçamentárias por Grupo
Descrição : Correção da crítica em que se o usuário informar que o tipo de cálculo (Orçado
            ou Realizado) for manualmente, permitir que se cadastre sem informar nenhuma
            composição de conta orçamentária.
Pendência : 20157 - Processo\Compromisso - Especial
Descrição : Feitos diversos ajustes na tela.
================================================================================
CM$VER      3.08.10a    06/09/2005
--------------------------------------------------------------------------------
Pendência 19515 (ajuste 3)
Implementação da execução das fórmulas de apuração orçamentária (simulação e gravação).
================================================================================
CM$VER      3.08.10     31/08/2005
--------------------------------------------------------------------------------
liberação do padrão
================================================================================
CM$VER      3.08.09h    20/09/2005
--------------------------------------------------------------------------------
Pendência : 20069 - Cadastro\Contas Orçamentárias por Grupo
Descrição : Ao alterar um grupo de contas, refeltir essa alteração para todas as contas e
            suas composições.
Pendência : 20251 - Cadastro\Contas Orçamentárias por Grupo
Descrição : Correção da crítica em que se o usuário informar que o tipo de cálculo (Orçado
            ou Realizado) for manualmente, permitir que se cadastre sem informar nenhuma
            composição de conta orçamentária.
Pendência : 20157 - Processo\Compromisso - Especial
Descrição : Feitos diversos ajustes na tela.
================================================================================
CM$VER      3.08.09g    13/09/2005
--------------------------------------------------------------------------------
Pendência 19515 (ajuste 4)
acerto de erro na tela cadastros\Formulas
Implementação da execução das fórmulas de apuração orçamentária (simulação e gravação).
================================================================================
CM$VER      3.08.09f    06/09/2005
--------------------------------------------------------------------------------
Pendência 19515 (ajuste 3)
Implementação da execução das fórmulas de apuração orçamentária (simulação e gravação).
================================================================================
CM$VER      3.08.09e    31/08/2005
--------------------------------------------------------------------------------
Pendência 19515 (ajuste 2)
Implementação da execução das fórmulas de apuração orçamentária (simulação e gravação).
================================================================================
CM$VER      3.08.09d    26/08/2005
--------------------------------------------------------------------------------
Pendência 19515 (ajuste)
Implementação da execução das fórmulas de apuração orçamentária (simulação e gravação).
================================================================================
CM$VER      3.08.09c    09/08/2005
--------------------------------------------------------------------------------
pendencia 19932
tela cadastro/formula de apuração
descrição do erro: erro de sql "field not found".
================================================================================
CM$VER      3.08.09a    13/07/200
--------------------------------------------------------------------------------
Pendência nº 19514
- Implementada amarração das Fórmulas para o Orçado do ano seguinte nas telas de
  cadastros dos Grupos e Contas Orçamentárias.
Pendência nº 19513
- Implementada uma nova tela para cadastro de Fórmulas de Apuração no menu:
  Cadastro/Fórmulas para apurar o Orçamento.
Pendência nº 18031
- Implementado o status AGUARDANDO nos filtros do relatório de Listagem de
  Compromissos.
Pendencia nº 18030
- Descrição : Exibir o Centro de Responsabilidade no relatório, caso o usuário
              passe o filtro
  Rotina    : CrmRptCMBeforePrint
================================================================================
CM$VER      3.08.09     16/06/2005
--------------------------------------------------------------------------------
Pendência: 19489
- Não estava efetivando um Compromisso quando todo o Saldo era consumido.
Pendência: 18485
- Retirado o Formulário de Replicar Contas Orçamentárias por Grupo no menu
  de Cadastros.
Pendência: 19420
- Não retirava o valor da coluna RESERVADO na tabela SALDOORCADO quando uma
  RESERVA era efetivada manualmente na tela de Efetivação de Reservas.
- Acertos  nos conteúdos das mensagens na tela de Efetivação de Reservas, pois
  ao cancelar uma reserva efetivada, a mensagem informa compromisso ao invés de
  reserva. Mensagem de Reserva PARCIALMENTE efetivada quando na verdade a
  reserva está TOTALMENTE efetivada.
Pendência: 19295
- Apresentava Erro no botão "Cancela" quando uma reserva está selecionada
Pendência: 17608
- Verificar apenas os planos previdenciários ativos e verificar ainda o relacinamento
  válido entre plano e patro.
Pendência nº 19095
- Implementada outra função de LOG para verificar se alguma rotina gerou
  diferenças nos saldos das contas orçamentárias.
================================================================================
CM$VER      3.08.08q    15/06/2005
--------------------------------------------------------------------------------
Pendência nº 19095 - CONTINUAÇÀO
- Implementada outra função de LOG para verificar se alguma rotina gerou
  diferenças nos saldos das contas orçamentárias.
================================================================================
CM$VER      3.08.08p    24/05/2005
--------------------------------------------------------------------------------
Pendência nº 19294
- Alteração na Tela de Compromisso para verificar se as contas das Reservas são
  iguais a conta do Compromisso que está sendo feito.
- Criada a function BuscaContaReservaCompromisso na uCtrlOrcamento
Pendência nº 18255
- Alteração na Tela de Cadastro de Grupos Orçamentários para não permitir a
  inclusão de um GRUPO analítico abaixo de outro GRUPO analítico.
Pendência nº 18493
- Alteração na Tela de Dedução Orçamentária (Retorno) para não permitir a
  Dedução de um valor maior que o saldo da conta.
- Alterações diversas na Tela de Cadastro de Compromissos:
  1) Permitia altrerar o número da Reserva no Listview das Reservas,
     ocasionando erro na criação do Compromisso porque não gravava na ResXComp
     e não efetivava a Reserva se o número fosse alterado no Listview.
  2) Apresentava erro de A. Violation quando não havia Reserva selecionada e
     fosse dado um clique no botão de Incluir Reserva.
  3) Permitia filtrar Reservas no processo de alteração de um Compromisso.
     Quando se altera um Compromisso, não é permitido incluir/excluir Reservas.
================================================================================
CM$VER      3.08.08o    11/05/2005
--------------------------------------------------------------------------------
Pendência nº 19173
- Alteração na QUERY da function uCtrlEfetivacao.Reservas para não trazer itens
  duplicados quando tiver relacionamento 1xN na tabela RESXCOMP.
- Alteração no tela de Compromissos para não trazer no filtro de Reservas, as
  Reservas já selecionadas para compor o Compromisso.
================================================================================
CM$VER      3.08.08n    14/04/2005
--------------------------------------------------------------------------------
Pendência nº 16717
- Alterações nas rotinas de relacionamento entre Compromisso e Reservas, na tela
  de Compromissos.
================================================================================
CM$VER      3.08.08m    12/04/2005
--------------------------------------------------------------------------------
Pendência nº 19019
- Solucionado problema na gravação da tabela ResXComp quando um compromisso era
  criado utilizando uma ou mais reservas.
Pendência nº 18004
- Incluído no Relatório "OrçadoXRealizado por GrupoXCentro de Custo" a descrição
  do Centro de Custo.
Pendência nº 17570
- Substituição dos métodos de 2 camadas ainda existentes pelos métodos de
  3 camadas na tela de Busca Contábil.
Pendência nº 17231
- Redimensionamento do Formulário de parâmetros do relatório "Distribuição de
  Saldos por Grupos Orçamentários".
================================================================================
CM$VER      3.08.08l    31/03/2005
--------------------------------------------------------------------------------
Pendência nº 18032
- Correção no filtro do relatório de "Posição por Saldos Sintético".
- Correção no filtro do relatório de "Posição por Saldos Analítico".
Pendência nº 18033
- Correção no filtro do relatório de "Totalização do Saldos por Centro de
  Responsabilidade"
================================================================================
CM$VER      3.08.08k    30/03/2005
--------------------------------------------------------------------------------
Pendência nº 17988
- Alteração em várias telas do sistema para verificar se o Período está Bloqueado
  para lançamentos/alterações.
Pendência nº 18003
- Correção na exibição de mensagem em branco após o OK final na tela cadastro de
  Valores Base para Rateio.
Pendência nº 18029
- Correção do problema na edição do registro detalhe no Cadastro de Contas
  Orçamentárias, na Guia "Contas Orçado", que mostrava o nome da Conta incorreto.
================================================================================
CM$VER      3.08.08j    21/03/2005
--------------------------------------------------------------------------------
Pendência nº 17502
- Alteração em várias rotinas de estorno/devolução de saldo nas contas
  orçamentárias para acertar o processo de devolução de saldo não utilizado por
  um compromisso orçamentário e bloquear o uso do valor total(antes da devolução)
  do compromisso após o cancelamento do lançamento e inclusão de um novo
  documento no Contas a Pagar utilizando o mesmo compromisso que possui
  devolução de saldo.
================================================================================
CM$VER      3.08.08i    14/03/2005
--------------------------------------------------------------------------------
Pendência nº 17779
- Alteração no relatório Orçado X Realizado por Grupo X CentroDeCusto, para
  permitir calcular a Análise Percentual Horizontal com base no início do
  exercício.
================================================================================
CM$VER      3.08.08h    14/02/2005
--------------------------------------------------------------------------------
Pendência nº 17278
- Alteração na função RESERVAS(uCtrlEfetivacao) para traduzir o NUMCOMPROMISSO
  a partir do IDCOMPROMISSO na tabela RESXCOMP, exibido na tela de Efetivação
  de Reservas.
================================================================================
CM$VER      3.08.08g    10/02/2005
--------------------------------------------------------------------------------
Pendência nº 18041
- Alteraçao na tela de Dedução Orçamentária, na rotina de confirmação do
  lançamento, para solucionar problemas na atualização dos saldos das contas
  envolvidas, após a exclusão e inclusão de um novo lançamento sem sair da tela.
Pendência nº 18040
- Alteraçao na tela de Suplementação Orçamentária,  na rotina de confirmação do
  lançamento, para solucionar problemas na atualização dos saldos das contas
  envolvidas, após a exclusão e inclusão de um novo lançamento sem sair da tela.
================================================================================
CM$VER      3.08.08f    03/02/2005
--------------------------------------------------------------------------------
Pendência nº 18042
- Alteraçao na tela de Tansferência Orçamentária, na rotina de confirmação do
  lançamento, para solucionar problemas na atualização dos saldos das contas
  envolvidas, após a exclusão e inclusão de um novo lançamento sem sair da tela.
Pendência nº 17539
- Alteraçao na tela de Tansferência Orçamentária, na rotina de impressão da
  transferência realizada, para não ser impresso sem a solicitação do usuário.
================================================================================
CM$VER      3.08.08e    13/01/2005
--------------------------------------------------------------------------------
Pendência nº 17257
- Inclusão de JOIN no MontaSelect da Tela Acerta Saldo para exibir somente as
  contas filtradas pelo Plano Orçamentário configurado na tela de Parâmetros do
  Sistema.
================================================================================
CM$VER      3.08.08d    12/01/2005
--------------------------------------------------------------------------------
Pendência nº 17370
- Alteração na tela de Compromisso Orçamentário, para solucionar o problema de
  alterar a conta orçamentária que estava gerando inconsistência de saldos entre
  as contas envolvidas.
- Alteração na tela de Reserva Orçamentária, para solucionar o problema de
  alterar a conta orçamentária que estava gerando inconsistência de saldos entre
  as contas envolvidas.
- Alteração na tela de Suplementação de Saldo, para solucionar o problema de
  alterar a conta orçamentária que estava gerando inconsistência de saldos entre
  as contas envolvidas.
- Alteração na tela de Dedução de Saldo, para solucionar o problema de alterar
  a conta orçamentária que estava gerando inconsistência de saldos entre as
  contas envolvidas.
================================================================================
CM$VER      3.08.08c    04/01/2005
--------------------------------------------------------------------------------
Pendência nº 18243 (CONTINUAÇÃO)
- Alteração na Função InsereValor, para inserir valor zero quando for null
================================================================================
CM$VER      3.08.08b    20/12/2004
--------------------------------------------------------------------------------
Pendência 18243 
- Tela:  Acerto de Saldo
- Descrição: Acerto na qry para corrigir saldos em divergência 
================================================================================
CM$VER      3.08.08a    28/07/2004
--------------------------------------------------------------------------------
- Pendencia 17241 
Na geração da OC e do respectivo compromisso orçamentário, o valor que está sendo deduzido no módulo Orçamento estava incorreto.
================================================================================
CM$VER      3.08.08     09/12/2004
--------------------------------------------------------------------------------
Pendência 16822 - Relatórios Orçado x Realizado por Grupo, Centro de Custo e Centro de Responsabilidade
- Permitir que o relatório só leve em consideração para efeito de cálculo de percentual realizado os dados referentes a até certo período, permitindo análise horizontal.
Pendencia 17184 - Entrada de Dados \ Especial
- Acerto  na seleção do grupo orçamentário
Pendencia 17185 - Processos \ Compromisso - Especial
- Acerto na seleçào do grupo orçamentário
Pendência nº 18243
- Correção na qry para acerto de saldos em divergência
================================================================================
CM$VER      3.08.07     25/06/2004
--------------------------------------------------------------------------------
Pendência 16808 - Relatório Orçado x Realizado por Grupo e por Centro de Custo
- Permitir impressão de contas sintéticas.
================================================================================
CM$VER      3.08.06c    15/06/2004
--------------------------------------------------------------------------------
Pendência: 16738
Tela: Processos\Compromisso Orçamentário.
Descrição: Não permitir que usuários concorrentes gravem o mesmo número seqüencial de reserva.
================================================================================
CM$VER      3.08.06b    31/05/2004
--------------------------------------------------------------------------------
- Pendencia 16590 - Na tela de grupo orçamentário, após realização de uma alteração ou inclusão, ao clicar no ok final está dando erro de "List Index...". Mesmo assim a alteração é gravada.
- Pendencia 16468 - Consulta - Orçado/Realizado por semestre -> Na tela de filtragem, trazer default o plano orçamentário vigente.
================================================================================
CM$VER      3.08.06a    13/05/2004
--------------------------------------------------------------------------------
Pendencia 16012 - Respeitar o sinal da conta conforme solicitação no parâmetro da tela de filtro
Pendencia 15892 - Respeitar os filtros do Parametro II
Pendencia 16664 - Respeitar os filtros do Parametro II
================================================================================
CM$VER      3.08.06     15/04/2004
--------------------------------------------------------------------------------
Pendencia 15512 - Acrescentado os campos do relatório para que seja possível alterar através da Opção de Configuração de Relatórios sem a necessidade de intervenção do desenvolvedor
================================================================================
CM$VER      3.08.05     17/03/2004
--------------------------------------------------------------------------------
- Pendencia 16012 - Colocar filtro para considerar valores com sinal ou positivo sempre nos relatorios de Orçado x Realizado:
  Por Centro de Custo;
  Por Grupo;
  Por Centro de Responsabilidade
================================================================================
CM$VER      3.08.04b    15/03/2004
--------------------------------------------------------------------------------
- Pendencia 16198 - Acerto na pesquisa de grupo pois o sistema nao fazia comparacao de maneira correta (iniciando com zero)
================================================================================
CM$VER      3.08.04     13/02/2004
--------------------------------------------------------------------------------
- Acerto no relatório de Distribuição modelo 2
================================================================================
CM$VER      3.08.03c    06/02/2004
--------------------------------------------------------------------------------
Acerto no Relatório de Distribuição Modelo 2, para listar todos os grupos orçamentários quando não for escolhido um grupo específico
================================================================================
CM$VER      3.08.03b    04/02/2004
--------------------------------------------------------------------------------
Acerto no Relatório de Distribuição Modelo 2, para listar todos os grupos orçamentários quando não for escolhido um grupo específico
================================================================================
CM$VER      3.08.03a    26/01/2004
--------------------------------------------------------------------------------
pendencia 15687 - Cadastro de Grupo de Contas orçamentarias - gravacao do tipo de conta
pendencia 15934 - Retirada a duplicidade de conta na busca das contas no Compromisso
pendencia 15549 - Ajuste no cadastramento de contas orcamentarias
pendencia 15590 - filtro de plano orcamentario nos grupos na tela de entrada de dados especial
pendencia 15591 - filtro de plano orcamentario nos grupos na tela de entrada de dados especial com cenarios
pendencia 15592 - filtro de plano orcamentario nos grupos na tela de entrada de dados de compromisso especial
pendencia 15892 - Filtragem do parametro II
================================================================================
CM$VER      3.08.03     22/01/2004
--------------------------------------------------------------------------------
15886 - Implementado o relatorio de distribuição de saldos ilustrando totalizadores por grupos sinteticos e analiticos
================================================================================
CM$VER      3.08.02     20/01/2004
--------------------------------------------------------------------------------
15579 - Colocado filtro de plano orçamentario no relatório de contas orçamentárias
15580 - Colocado filtro de plano orçamentario no relatório de distribuição de saldos
15581 - Colocado filtro de plano orçamentario no relatório orçado x realizado por conta
15582 - Colocado filtro de plano orçamentario no relatório orçado x realizado por grupo
15583 - Colocado filtro de plano orçamentario no relatório orçado x realizado por C.C
15584 - Colocado filtro de plano orçamentario no relatório orçado x realizado por C.Resp
15585 - Colocado filtro de plano orçamentario no relatório raterio de plano de trabalho
15586 - Colocado filtro de plano orçamentario no relatório valores por grupo
15587 - Colocado filtro de plano orçamentario no relatório posiçào de saldos
15588 - Colocado filtro de plano orçamentario no relatório posiçào de saldos sintético
15589 - Colocado filtro de plano orçamentario no relatório totalização de saldos
Ajuste na tela de geraçào de dados
================================================================================
CM$VER      3.08.01a    05/01/2004
--------------------------------------------------------------------------------
- Pendência 15805: Cadastros \ Cadastro \ Contas Orçamentárias por Grupo e 
  Cadastros \ Cadastro \ Contas Orçamentárias por Grupo e Centro de Responsabilidade
  - Processos alterados para levar em conta novas estruturas de Centro de Custo e Centro de Responsabilidade, em função do De/Para;
================================================================================
CM$VER      3.08.01     15/12/2003
--------------------------------------------------------------------------------
- Pendência 15102: Processos \ Compromisso Orçamentário
  - Corrigido erro que ocorria no saldo quando um compromisso não possuía reserva anterior;
- Pendência 15700: Cadastro \ Contas Orçamentárias por Grupo e Centro de Responsabilidade
  - Implementado novo cadastro de Contas Orçamentárias por Grupo e Centro de Responsabilidade;
================================================================================
CM$VER      3.08.00     10/12/2003
--------------------------------------------------------------------------------
- Pendência 15699: Sistema \ Configuração \ Parâmetros do Sistema
  Criado novo "fator de replicação" para cadastro de contas orçamentárias por grupo: Centro de Responsabilidade;
  Criados código e sigla da SPC para os Planos e Patrocinadoras;
================================================================================
CM$VER      3.07.03     04/12/2003
--------------------------------------------------------------------------------
- Pendência 15676: Processos\Compromisso Orçamentário
  Exibição do login do usuário que fez o compromisso;
- Pendência 15677: Processos\Reserva Orçamentário
  Exibição do login do usuário que fez a reserva;
================================================================================
CM$VER      3.07.02     01/12/2003
--------------------------------------------------------------------------------
- Cadastro de Contas Orçamentárias por Grupo:
  - Obrigatoriedade de preenchimento da composição da conta;
  - Opção de escolha do caminho para gravação do arquivo de log;
================================================================================
CM$VER      3.07.01     19/11/2003
--------------------------------------------------------------------------------
Resolução da pendência 14962:
Cadastro \ Período Orçamentário
No cadastro de períodos orçamentários, trazer pré-preenchidos os 
valores dos campos com as informações para o próximo exercício não 
cadastrado. (igual ao cadastro dos períodos contábeis na Contabilidade)
================================================================================
CM$VER      3.07.00     07/11/2003
--------------------------------------------------------------------------------
- Implementada ligação dos grupos orçamentários ao Plano, nas telas de cadastro de Grupos e Contas Orçamentárias;
================================================================================
CM$VER      3.06.06e    30/10/2003
--------------------------------------------------------------------------------
- Pendência 15026: Gravar o Log de Operações para todas as telas do menu Entrada de dados.
- Pendência 14009: Gravar o Log de Operações para todas as telas do menu de Processos.
================================================================================
CM$VER      3.06.06d    30/10/2003
--------------------------------------------------------------------------------
- Pendência 10065: Cadastro de Contas Orçamentárias por Grupo: correção da atualização da composição da conta "original" no processo de alteração.
================================================================================
CM$VER      3.06.06c    23/10/2003
--------------------------------------------------------------------------------
- Pendência 10065: Cadastro de Contas Orçamentárias por Grupo: correção da atualização da composição da conta "original" no processo de alteração.
================================================================================
CM$VER      3.06.06b    17/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14008
  > Tela\Opçao No Sistema: Processos/Efetivação de Reserva
  Na efetivação de reserva, omitir os botões "efetiva","cancela", "devolve saldo" e "devolve compromisso efetivado", por usuário.
OBS: Já existe a opção no menu de autorização, mas o sistema não esta obedecendo.
================================================================================
CM$VER      3.06.06a    16/10/2003
--------------------------------------------------------------------------------
- Pendência 10065: Ajustes no processo de exclusão (log);
================================================================================
CM$VER      3.06.06     15/10/2003
--------------------------------------------------------------------------------
- Pendência 14005: Retirada restrição de registro de reservas e compromissos baseada no tipo de cálculo do realizado;
- Pendência 10065: Novo cadastro de contas orçamentárias por grupo;
- Pendência 14398: Implementação da replicação dos valores de rateio de um exercício para outro;
- Pendência 14495: Cadastro de Valores Base para Rateio: alterada ordem dos campos de pesquisa do MontaSelect;
================================================================================
CM$VER      3.06.05f    13/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14928
  > Tela\Opçao No Sistema: Cadastro \ Critério de Rateio \ Valores Base
  No cadastro de valores para rateio existe um box para replicar o cadastro para todos os períodos (meses). O mesmo não está funcionando.
================================================================================
CM$VER      3.06.05e    08/10/2003
--------------------------------------------------------------------------------
Pendência 13893: correção da quebra de linha do detalhe da conta orçamentária;
================================================================================
CM$VER      3.06.04c    22/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15029
  > Tela\Opçao No Sistema: Sistema/Configurações/Relatórios/Emissões Diversas/Reserva Orçamentária
  Ao alterar a configuração do layout, o sistema grava e altera, mas na geração e impressão da Reserva Orçamentária não imprime com a última modificação feita.
================================================================================
CM$VER      3.06.04b    28/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10979
  > Tela\Opçao No Sistema: Cadastro \ Critérios de Rateio \ Valores bases
  Trocar ou acrescentar a descrição do centro de custo na seleção de filtragem e resultado da busca. Hoje só está pelo código.
================================================================================
CM$VER      3.06.04a    19/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14006
  > Tela\Opçao No Sistema: Processos/Reserva Orçamentária
  Inclusão de mais filtros no monta select da reserva orçamentária para refinar a procura.
================================================================================
CM$VER      3.06.03     30/05/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 7587
  > Tela\Opçao No Sistema: Consulta/Relatórios/Reformular os relatórios Orçado x Realizado por Grupo x Centro de Custo e por Gr
  Os mesmos estão apresentando erro na máquina do usuário, pois demora demais.  
        
Solic. Geisa
================================================================================
CM$VER      3.06.02     26/03/2003
--------------------------------------------------------------------------------
- Cadastros
   .Tipo de Critério / Valores Base para Rateio
      Correção nos métodos de gravação 
================================================================================
CM$VER      3.06.01     10/02/2003
--------------------------------------------------------------------------------
- Compromisso / Reserva / Transferência Orçamentária
   . Revisão da gravação e impressão de observações com até 1000 caracteres
- Cadastro de Contas Orçamentárias
   . Correção da gravação de query genérica
- Entradas de dados
   . Retirada do símbolo R$ dos grids
================================================================================
CM$VER      3.06.00     22/01/2003
--------------------------------------------------------------------------------
- Incluída tela para Cadastro/Manutenção de Contas Por Grupo Orçamentário
- Compromisso Orçamentário
  Correção de gravação do campo Observação com mais de 255 caracteres
  ( limitados a 1000 )
================================================================================
CM$VER      3.05.31     18/12/2002
--------------------------------------------------------------------------------
-Relatórios - Valores Por Grupo
  .O combo do Centro de Custo não estava abrindo;
- Cadastros - Demonstrativo Orçamentário
  .Corrigido o problema de chave duplicada ao se realizar a inserção de diversas
   linhas de detalhe;
  .Incluída validação do código da conta quando a informação desta é realizada 
   por digitação.
================================================================================
CM$VER      3.05.30     13/12/2002
--------------------------------------------------------------------------------
- Cadastro de Contas Orçamentárias
     Com o objetivo de acelerar a abertura da tela os dados de preenchimento da aba
     'Condicional' não são mais carregados neste momento;
- Cadastro de Demonstrativo Orçamentário
     Correção de erro ao se incluir uma linha em um layout previamente cadastrado.
================================================================================
CM$VER      3.05.29     06/12/2002
--------------------------------------------------------------------------------
- Compromisso Orçamentário, Reserva Orçamentária, 
  Suplementação Orçamentária, Transferência Orçamentária, Retorno Orçamentário
     Alteradas para permitir imprimir com os layouts personalizados
================================================================================
CM$VER      3.05.28     03/12/2002
--------------------------------------------------------------------------------
Utilitários - Relatórios
     Correção para permitir alteração de layout para Emissões Diversas
Demonstrativos Orçamentários
     Correção para emitir relatório colunado mensal
================================================================================
CM$VER      3.05.27     27/11/2002
--------------------------------------------------------------------------------
-Distribuição de Saldos Por Grupo Orçamentário
     Inclusão de filtro para Grupo Orçamentário
- Transferência Orçamentária
     Permitir reimprimir sem testar o saldo da conta
-Implementação do Businnes Intelligence
================================================================================
CM$VER      3.05.26     22/11/2002
--------------------------------------------------------------------------------
Valores Base Para Rateio
     Permitir busca/consulta pelo nome do critério
Geração de Dados
     Nova tela em 3 camadas
Efetivação de Reserva
     Na tela de devolução de compromisso - ativado o check da coluna 'Marca'
================================================================================
CM$VER      3.05.25     11/11/2002
--------------------------------------------------------------------------------
Entrada de Dados Por Cenário
     Correção da situação: ao clicar no grid o programa entrava em modo de inclusão 
     e duplicava períodos no banco de dados.
================================================================================
CM$VER      3.05.24     11/11/2002
--------------------------------------------------------------------------------
Relatório de Distribuição Orçamentária
     Correção de parâmetro da query principal
================================================================================
CM$VER      3.05.23     08/11/2002
--------------------------------------------------------------------------------
Valores Base Para Rateio
     Correção do combo de períodos
     Passou a gravar para todos os períodos do exercício
Suplementação Orçamentária / Retorno Orçamentário
     Implementado filtro para contas de Valor Informando Manualmente
================================================================================
CM$VER      3.05.22     07/11/2002
--------------------------------------------------------------------------------
Form principal
     Inicialização de IntegraBack
Compromisso Orçamentário
     Correção do filtro das reservas que compõem o compromisso
================================================================================
CM$VER      3.05.21     05/11/2002
--------------------------------------------------------------------------------
Usuários x centro de responsabilidade (CR)
     Não estava gravando CR iniciados por zero
Entrada de Dados por período
     Gravar somente o período em que o cursor está posicionado
Entrada de dados por Cenários
     Gravar somente o período em que o cursor está posicionado
Entrada de Dados Especial
     Corrigido EConvertError ao confirmar
Processos / Compromissos Orçamentários
     Não deixava sair da tela se o grupo orçamentário estivesse
     em branco
     Corrigida a precisão da compração do saldo da contacom o
     valor ora lançado para o compromisso
================================================================================
CM$VER      3.05.20     30/10/2002
--------------------------------------------------------------------------------
Compromisso Orçamentário
   Corrigido o cálculo do saldo da conta
   Corrigido o erro ao clicar inserir, cancelar e inserir
Relatorios: Distribuição por Grupo / Centro de Responsabilidade
   Incluído crítica quando não se informa o período ou o exercício
   Tratado o erro ao não informar o período ou o exercício
Geração de Dados
   Retornou-se com a tela client-server
================================================================================
CM$VER      3.05.19     25/10/2002
--------------------------------------------------------------------------------
Alterada tela de efetivação de reserva;
Alterada tela de utilitários efetivação de cenário;
Corrigido cabeçalho de guia condicionais - Cadastro de Contas
Incluído chamada ao método ConfigReport do padrão.
================================================================================
CM$VER      3.05.18     18/10/2002
--------------------------------------------------------------------------------
Alterações visando otimizações da bpl / liberação de versões
================================================================================
CM$VER      3.05.17     11/10/2002
--------------------------------------------------------------------------------
Modificações em "Busca Dados da Contabilidade"
Foram retiradas chamadas redundantes a queries, otimizados alguns blocos e
utilizadas as classes de persistência para realizar as gravações no banco de dados.
================================================================================
CM$VER      3.05.16     08/10/2002
--------------------------------------------------------------------------------
Excluída do projeto a classe de persistência DbReports.
Passou-se a utilizar a pertencente ao padrão.
================================================================================
CM$VER      3.05.15     03/10/2002
--------------------------------------------------------------------------------
Incluídos parâmetros para chamada de help contextualizado
================================================================================
CM$VER      3.05.14     03/10/2002
--------------------------------------------------------------------------------
Incluída tela para consulta de log de cenários
================================================================================
CM$VER      3.05.13     02/10/2002
--------------------------------------------------------------------------------
Foram realizadas alterações para atender as características do padrão 5.09.00
================================================================================
CM$VER      3.05.12     01/10/2002
--------------------------------------------------------------------------------
Incluída restrição para não permitir selecionar cálculo realizado como
'fluxo de caixa' e não informar os parâmetros
================================================================================
CM$VER      3.05.11     25/09/2002
--------------------------------------------------------------------------------
Foram realizadas diversas correções em função de mal funcionamento ocasionado
pela conversão para três camadas
================================================================================
CM$VER      3.05.10     09/09/2002
--------------------------------------------------------------------------------
Exluídas chamadas para controle do Balanced Scorecard.
Foi criado um projeto expecífico.
================================================================================
CM$VER      3.05.09     30/08/2002
--------------------------------------------------------------------------------
Incluídas chamadas para controle do Balanced Scorecard
================================================================================
CM$VER      3.05.07     21/08/2002
--------------------------------------------------------------------------------
Convertida para três camadas a tela de "Parâmetros do Orçamento"
================================================================================
CM$VER      3.05.06     20/08/2002
--------------------------------------------------------------------------------
Melhorias no código para o modelo três camadas da tela de "Busca Dados Contábeis para Orçamento"
================================================================================
CM$VER      3.05.04     16/08/2002
--------------------------------------------------------------------------------
Totalmente convertido para três camadas
================================================================================
CM$VER      3.05.03     16/08/2002
--------------------------------------------------------------------------------
Totalmente convertido para três camadas
================================================================================
CM$VER      3.04.00     01/04/2002
--------------------------------------------------------------------------------
* Implementado o Plano de Trabalho
================================================================================
CM$VER      3.03.02     11/02/2002
--------------------------------------------------------------------------------
* Alterados os relatórios abaixo para conter filtro por Centro de Custo, Atividade Projeto,
   Plano Previdenciário e Patrocinadora.
     - Orçado x Realizado por Conta
     - Orçado x Realizado por Grupo
     - Orçado x Realizado por Grupo x Centro de Custo
     - Orçado x Realizado por Grupo x Centro de Responsabilidade
     - Valores por Grupo (Anual)
================================================================================
CM$VER      3.03.01     30/01/2002
--------------------------------------------------------------------------------
* Alterada a copia de contas orçamentárias para copiar a nova parametrização da conta.
================================================================================
CM$VER      3.03.00     25/01/2002
--------------------------------------------------------------------------------
* Implementado critérios de rateio para as contas digitadas manualmente. Estes critérios
   poderão ser utilizados na tela de entrada de dados Especial.
================================================================================
CM$VER      3.02.12     08/01/2002
--------------------------------------------------------------------------------
* Criada a opção de gerar dados de cenários. Para tal, basta indicar o cenário desejado na
tela de Geração dos Dados.
================================================================================
CM$VER      3.02.11     07/01/2002
--------------------------------------------------------------------------------
* Acertado o relatorio por Grupo.
================================================================================
CM$VER      3.02.10     02/01/2002
--------------------------------------------------------------------------------
* Acertada a exclusão do relatório configurável.
* Acertada a visualização do período na tela de Transferencia Orçamentária.
================================================================================
CM$VER      3.02.09     21/12/2001
--------------------------------------------------------------------------------
* Alterado os relatorios gerenciais para somente serem emitidos pelos centros de resp.
   ou centro de custo que o usuário tem acesso.
================================================================================
CM$VER      3.02.08     12/12/2001
--------------------------------------------------------------------------------
* Criado Relatórios:
        - Centro de Responsabilidade x Grupo
        - Centro de Custo x Grupo
* Incluido coluna de valor efetivado no relatorio de listagem dos compromissos
* Na tela de Acerta Saldo, pode-se indicar o acerto de somente uma conta.
* Alterado o cálculo do percentual no relatório "Atividade por Gestor 2"
================================================================================
CM$VER      3.02.06     07/12/2001
--------------------------------------------------------------------------------
* Implementado dicionário de dados no desenho da tela de Cadastro de Lay-out.
* Feita implementações na tela de Copia Contas Orçamentárias:
   - Agora é possível sobrepor contas orçamentárias já criadas.
   - Agora é possível passar o saldo orçado somente a partir de determinada data.
================================================================================
CM$VER      3.02.05     29/10/2001
--------------------------------------------------------------------------------
* Na alteração da conta orçamentária o sistema está excluindo também o orçamento
   lançado para esta conta.
* Tela de Geração de Dados: Implementada a possibilidade de gerar todos os períodos 
  do exercício. Para tal, basta deixar o período em branco.
================================================================================
CM$VER      3.02.04     26/10/2001
--------------------------------------------------------------------------------
* Alterada a forma de exclusão da conta orçamentária.
================================================================================
CM$VER      3.02.03     09/10/2001
--------------------------------------------------------------------------------
* Incluído log de operação na geração do Orçamento.
================================================================================
CM$VER      3.02.02     26/09/2001
--------------------------------------------------------------------------------
* Acertado os totais do relatório "Distribuição do Saldo Orçamentário Modelo 2"
================================================================================
CM$VER      3.02.01     17/09/2001
--------------------------------------------------------------------------------
* Alterada a impressão do Compromisso e da Reserva Orçamentária para ter 3 gestores e
   imprimir o Valor Orçado para a Conta.
================================================================================
CM$VER      3.02.00     28/08/2001
--------------------------------------------------------------------------------
* Aumentado o campo observação da Reserva, Compromisso, Retorno, Suplementação e 
   Transferencia para 1000 posições.
* Incluido Saldo Anterior, Valor e Saldo Atual na impressão da Reserva, Compromisso, Retorno, Suplementação e 
   Transferencia.
================================================================================
CM$VER      3.01.11     21/08/2001
--------------------------------------------------------------------------------
* Alterado o saldo impresso do compromisso e da reserva orçamentária.
* Acertada a tela de filtragem da Efetivação da Reserva para considerar multi-empresa.
================================================================================
CM$VER      3.01.10     20/08/2001
--------------------------------------------------------------------------------
* Acertada a geração do orçamento na conta do tipo fluxo de caixa para considerar 
   centro de custo e centro de responsabilidade sintético.
================================================================================
CM$VER      3.01.09     15/08/2001
--------------------------------------------------------------------------------
* Acertada a impressão do Compromisso, Reserva, Transferencia, Suplementação e Retorno
   para filtrar multi-empresa.
================================================================================
CM$VER      3.01.08     10/08/2001
--------------------------------------------------------------------------------
* Otimizada a rotina de lançamento do Orçamento.
* Otimizado o relatório Orçado x Realizado por Conta.
================================================================================
CM$VER      3.01.07     09/08/2001
--------------------------------------------------------------------------------
* Otimizado os relatórios de Orçado x Realizado por Grupo e Valores por Grupo.
================================================================================
CM$VER      3.01.06     06/08/2001
--------------------------------------------------------------------------------
* Acertado o saldo que é mostrado na tela de Transferencia, Reserva, Suplementação,
Retorno e Compromisso para ser compatível com a data indicada.
================================================================================
CM$VER      3.01.05     06/08/2001
--------------------------------------------------------------------------------
* Agilizada a geração dos dados para as contas que tem composição no orçado e no realizado.
================================================================================
CM$VER      3.01.04     04/07/2001
--------------------------------------------------------------------------------
* Inserida na composição das contas orçamentárias a opção de cadastrar esta 
   composição indicando-se um grupo de contas. 
================================================================================
CM$VER      3.01.03     28/06/2001
--------------------------------------------------------------------------------
* Otimizada a impressão do relatório de Lay-out.
================================================================================
CM$VER      3.01.02     26/06/2001
--------------------------------------------------------------------------------
* Acertado os relatorios de Demonstrativo de Resultado - Lay-Out
================================================================================
CM$VER      3.01.00     21/06/2001
--------------------------------------------------------------------------------
* Implementada a opção de buscar o saldo anterior realizado da contabilidade 
   para ser o saldo anterior orçado. 
================================================================================
CM$VER      3.00.03     06/06/2001
--------------------------------------------------------------------------------
* Implementado relatório de Orçado x Realizado por Conta.
================================================================================
CM$VER      3.00.02     30/05/2001
--------------------------------------------------------------------------------
* Acertada a tela de montar lay-out de relatório.
================================================================================
CM$VER      3.00.01     27/04/2001
--------------------------------------------------------------------------------
* Acertado o problema nos relatórios de listagem de Reserva e Compromisso
  Type mismatch for field 'OBSRESERVA'
================================================================================
CM$VER      3.00.00     10/04/2001
--------------------------------------------------------------------------------
* Liberação de Versão Delphi5
================================================================================
CM$VER      2.12.06     19/01/2001
--------------------------------------------------------------------------------
* Acertado o relatório orçado x realizado por grupo quando era solicitado em mês diferente
   de janeiro.
* Acertado o valor realizado do relatório de saldos sintéticos
================================================================================
CM$VER      2.12.05     28/12/2000
--------------------------------------------------------------------------------
* Acertada a emissão do relatório de lay-out para contas com muitos dígitos.
================================================================================
CM$VER      2.12.04     30/11/2000
--------------------------------------------------------------------------------
* Acertada a copia de contas orçamentárias do tipo Fórmula que não fazia corretamente
  caso a Fórmula começassee com uma conta orçamentária.
* Otimizada a performance dos relatório por Grupo Orçamentário: 
  Valores por Grupo e Orçado x Realizado por Grupo.
* Incluída a possibilidade de se calcular somente contas iniciadas por determinado número.
* Incluída a possibilidade de se copiar somente as contas iniciadas por determinado número.
================================================================================
CM$VER      2.12.03     24/11/2000
--------------------------------------------------------------------------------
* Incluído novo relatório de Valores por Grupo em todos os períodos do exercício.
================================================================================
CM$VER      2.12.02     23/11/2000
--------------------------------------------------------------------------------
* Acertado o relatório "Orçado x Realizado por Grupo".
* Incluída a possibilidade de se efetivar um cenário por faixa de períodos.
================================================================================
CM$VER      2.12.01     16/11/2000
--------------------------------------------------------------------------------
* Incluída a possibilidade de se manipular os valores do cenário.
================================================================================
CM$VER      2.12.00     14/11/2000
--------------------------------------------------------------------------------
* Implementada a possibilidade de se digitar cenários orçamentários e efetivar um deles.
================================================================================
CM$VER      2.11.09     10/11/2000
--------------------------------------------------------------------------------
* Acertado o cálculo do tipo condicional.
* Acertado o cancelamento de reserva orçamentária.
* Melhorada a performance da geração do realizado contábil.
* Acertada a alteração da conta orçamentária com arquivo genérico que estava
   perdendo o select informado.
================================================================================
CM$VER      2.11.08     03/11/2000
--------------------------------------------------------------------------------
* Acertada a suplementação e o retorno orçamentário
================================================================================
CM$VER      2.11.07     02/11/2000
--------------------------------------------------------------------------------
* Melhorada a performance da geração do orçamento
================================================================================
CM$VER      2.11.06     27/10/2000
--------------------------------------------------------------------------------
* Melhorada a performance de alguns relatórios
================================================================================
CM$VER      2.11.05     23/10/2000
--------------------------------------------------------------------------------
* Acertado o cancelamento do compromisso para voltar para pendência as reservas 
   associadas a este compromisso.
================================================================================
CM$VER      2.11.04     20/10/2000
--------------------------------------------------------------------------------
* Incluido na geração o filtro por plano e patrocinadora
================================================================================
CM$VER      2.11.03     13/10/2000
--------------------------------------------------------------------------------
* Criado utilitário para acertar o saldo das reservas e compromissos orçamentários.
================================================================================
CM$VER      2.11.02     07/10/2000
--------------------------------------------------------------------------------
* Acertada a exclusão de centros de responsabilidade para um usuário.
* Incluída a descrição do plano, patrocinadora e atividade/projeto no relatório de
  Composição das Contas Orçamentárias.
================================================================================
CM$VER      2.11.01     07/10/2000
--------------------------------------------------------------------------------
* Troca do sinal na geração do orçamento.
* Na consulta das contas orçamentárias somente está mostrando 
  as contas que o usuário tem acesso.
* Colocada a descrição do grupo e do período no relatório do
  orçamento sintético e analítico.
================================================================================
CM$VER      2.11.00     20/09/2000
--------------------------------------------------------------------------------
* Implementada devolução de compromisso após sua efetivação com respaldo em documentos
   recebidos. (Reembolso de Despesas)
================================================================================
CM$VER      2.10.02     14/08/2000
--------------------------------------------------------------------------------
* Tela de Copia Contas Orçamentárias:
   - Incluído o código do centro de custo no combo.
   - Incluída a possibilidade de transferência do saldo das contas originais para as de destino.
================================================================================
CM$VER      2.10.01     14/07/2000
--------------------------------------------------------------------------------
* Incluido relatório de composição das contas orçamentárias
================================================================================
CM$VER      2.10.00     21/06/2000
--------------------------------------------------------------------------------
* Incluida a opção de se fazer a devoluçã para o saldo de um compromisso não efetivado.
- Resolução da Pendência Nº 1998
  > Tela\Opçao No Sistema: 
  Rotina para lançar um retorno de um valor a restituir, ou seja, compromisso que tenha sido regularizado no contas a pagar através de um documento cujo valor é inferior ao valor do compromisso. O saldo deverá retornar para a conta orçamentária.
================================================================================
CM$VER      2.09.08     17/05/2000
--------------------------------------------------------------------------------
* Alterada a copia de conta orçamentária para considerar a parte variável da conta no
   início ou no final do seu código.
================================================================================
CM$VER      2.09.07     12/05/2000
--------------------------------------------------------------------------------
* Criada a rotina de cópia da estrutura de Contas Orçamentárias
* Criado o relatório de listagem da composição dos Demonstrativos Orçamentários
* Criada a possibilidade de se espelhar a composição das Contas Orçamentárias entre a 
composição do Orçado e do Realizado
* Corrigido o problema com as rotinas de busca de Contas Orçamentárias com códigos
muito extensos
================================================================================
CM$VER      2.09.06     05/05/2000
--------------------------------------------------------------------------------
* Acertado o problema da alteração dos Grupos Orçamentários
* Acertado o problema da não habilitação da "orelha" Fluxo de Caixa quando da
inclusão de uma nova Conta Orçamentária quando o tipo de cálculo do realizado era
Fluxo de Caixa
================================================================================
CM$VER      2.09.05     03/05/2000
--------------------------------------------------------------------------------
* Otimização da performance da tela de Usuários x Centros de Responsabilidade
================================================================================
CM$VER      2.09.04     27/04/2000
--------------------------------------------------------------------------------
* Incluída a opção de fazer geração por mês.
================================================================================
CM$VER      2.09.03     20/04/2000
--------------------------------------------------------------------------------
* Alterado o relatório Distribuição de Saldo por Grupo Orçamentário - 
   Modulo 2 para retirar o Valor Realizado e incluir o Compromisso Efetivado
================================================================================
CM$VER      2.09.02     14/04/2000
--------------------------------------------------------------------------------
* Criação de Lay-Out Confirgurável:
   - Retirada a obrigatoriedade de indicar a conta para 100%
   - Acertado o procurar da conta orçamentária que estava dando list index 
     out of bounds.
================================================================================
CM$VER      2.09.01     14/04/2000
--------------------------------------------------------------------------------
* Acertada a transferência orçamentária.
================================================================================
CM$VER      2.09.00     11/04/2000
--------------------------------------------------------------------------------
* Incluida a opção de plano e patrocinadora no cadastro da conta orçamentária.
* Acertada a impressão dos relatórios da opção "Processo".
* Acertado o relatório Distribuição de Saldo por Grupo Orçamentário - 
   Modulo 2.
* Incluida a opção de excluir transferencias orçamentárias.
================================================================================
CM$VER      2.08.04     31/03/2000
--------------------------------------------------------------------------------
* Acertada a busca de contas orçamentárias nas telas de cadastro de processos 
* Acertada a impressão de contas orçamentárias nas telas de cadastro de 
processos 
* Incluído o campo "Total de Retornos" no relatório "Distribuição de Saldos por
Grupo Orçamentário - modelo 2" 
================================================================================
CM$VER      2.08.03     29/03/2000
--------------------------------------------------------------------------------
* Acertado o problema da impressão dos processos orçamentários "Retorno" e 
"Suplementação"
* Acertado o cálculo da Dotação Orçamentária inicial no relatório "Distribuição de
Saldos por Grupo Orçamentário - modelo 2"
* Incluída a possibilidade de não se exibir as linhas com valores zerados no 
relatório de "Demonstrativo Orçamentário" 
================================================================================
CM$VER      2.08.02a    24/03/2000
--------------------------------------------------------------------------------
* Acertado o cálculo do Saldo Acumulado no relatório "Distribuição de Saldos por
Grupo Orçamentário - modelo 2"
* Inclusão da descrição da faixa de períodos no cabeçalho do relatório 
"Distribuição de Saldos por Grupo Orçamentário - modelo 2"
================================================================================
CM$VER      2.08.02     22/03/2000
--------------------------------------------------------------------------------
* Criado o Relatório "Distribuição de Saldos por Grupo Orçamentário - modelo 2"
================================================================================
CM$VER      2.08.01     20/03/2000
--------------------------------------------------------------------------------
* Acertadas TODAS as telas de configuração de relatórios na exibição do 
Exercício e do Período
* Acertadas TODAS as telas que têm busca de Conta Orçamentária, que agora 
podem buscar o código da conta apenas digitando o seu número
* Incluída a flag de Conta Ativa/Inativa e as datas de Ativação e Desativação 
no Cadastro da Conta Orçamentária
* Incluído o cadastro de Centros de Custo na Composição do Fluxo de Caixa 
da Conta Orçamentária
* Incluído o parâmetro de permitir ou não Transferências Orçamentárias entre 
contas Orçamentárias de Grupos diferentes
* Incluído o parâmetro de permitir ou não Processos Orçamentários com 
valores acima do saldo disponível para a conta
* Acertado o problema dos Processos Orçamentários que não davam baixa nos
Saldos quando não tinham movimentação na Conta Orçamentária selecionada. 
* Inclusão de diversas funções de controle de Contas Orçamentárias numa 
"Unit" centralizada (apenas para desenvolvedores)
* Alterado o código da Conta Orçamentária de inteiro para string em 
TODAS as telas do sistema (apenas para desenvolvedores)
================================================================================
CM$VER      2.07.19     09/03/2000
--------------------------------------------------------------------------------
* Colocado o filtro por Centros de Responsabilidade no Relatório "Posição de 
Saldos por Grupos Orçamentários"
* Habilitada a árvore de Grupos Orçamentários para Consulta
* Colocado um novo parâmetro para permitir a criação de Processos mesmo sem
Saldos Disponíveis
================================================================================
CM$VER      2.07.18     25/02/2000
--------------------------------------------------------------------------------
* Acertado o problema da Transferência Orçamentária, onde as datas não eram
consideradas.
* Criado o relatório Gerencial "Posição de Saldos por Grupos Orçamentários"
================================================================================
CM$VER      2.07.17     15/02/2000
--------------------------------------------------------------------------------
* Acertado o problema em que se somavam os valores das Reservas e 
Compromissos Cancelados nos relatórios de listagem de Processos.
================================================================================
CM$VER      2.07.16     11/02/2000
--------------------------------------------------------------------------------
* Implantação de nova versão CM
================================================================================
CM$VER      2.07.15     09/02/2000
--------------------------------------------------------------------------------
* Acertado o problema da gravação das observações longas nos Processos 
Orçamentários
================================================================================
CM$VER      2.07.14     04/02/2000
--------------------------------------------------------------------------------
* Acertado o problema do Cancelamento de Reservas e Compromissos já cance-
ladas
* A tela de Efetivação de Reservas agora exibe apenas as reservas dos Centros
de Responsabilidade relacionados ao usuário corrente
* Acertado o problema da criação de Processos orçamentários ao mesmo 
tempo, gerando Processos com o mesmo numero em diferentes setores.
================================================================================
CM$VER      2.07.13     26/01/2000
--------------------------------------------------------------------------------
* Acertadas as rubricas no rodapé das impressões dos Processos Orçamentários
* Acertado o problema da criação dos Compromissos sem Reservas.
================================================================================
CM$VER      2.07.12     07/01/2000
--------------------------------------------------------------------------------
* Acertado o problema na visualização de Saldos da Conta nas telas de Processos
* Acertado o problema da tela de Efetivação de Reservas, que não estava 
retornando o valor de uma Reserva cancelada.
* Acertado o problema da tela de Compromissos Orçamentários, que não estava
efetivando as Reservas que compunham o Compromisso
* Incluída uma verificação para ver se o valor do Compromisso é maior que
o valor das Reservas que o compões, na tela de Compromissos Orçamentários 
================================================================================
CM$VER      2.07.11     04/01/2000
--------------------------------------------------------------------------------
* Acertado o problema de visualização das consultas na tela de Cadastro de Contas 
Orçamentárias, quando a conta era do tipo "Arquivos Genéricos"
* Colocados os campos "Gestor" e "Diretor" nos relatórios de impressão de 
Reservas, Compromissos, Tranferências, Retornos e Suplementações
* Acertado o problema da efetivação de Reservas quanto da criação de um 
Compromisso a partir delas
* Colocação das funções de integração com o RAD nas funções compartilhadas 
do Orçamento (UOrcamento)
================================================================================
CM$VER      2.07.10     10/12/1999
--------------------------------------------------------------------------------
* Alteradas todas as telas de Processos (Reserva, Compromisso, Transferência,
Suplementação) para exibir os saldos até a presente data de acordo com o 
parâmetro de exibição do Saldo (na tela de Parâmetros - por período/acumulado 
do exercício/acumulado até o período)
================================================================================
CM$VER      2.07.09     16/11/1999
--------------------------------------------------------------------------------
* Alterada a tela de Geração de Dados para exibir as Contas Orçamentárias não
calculadas no caso de erro de referência cruzada.
================================================================================
CM$VER      2.07.08     10/11/1999
--------------------------------------------------------------------------------
* Criação da tela de Cadastro de Layouts de Relatórios Configuráveis (Demons-
trativos Orçamentários)
* Criação do Relatório de Demonstrativos Orçamentários (tipos Normal e 
Colunado Mensal)
* Retirados todos os Relatórios Configuráveis (foram substituídos pelo relatório
de Demonstrativo Orçamentário)
* Criado o novo campo "Tipo de Cálculo dos Valores Acumulados" na tela de
Cadastro de Contas Orçamentárias, visando a configuração do cálculo de valores
orçamentários acumulados na Geração de Dados
================================================================================
CM$VER      2.07.07     30/09/1999
--------------------------------------------------------------------------------
* Correções nos relatórios Configuráveis
================================================================================
CM$VER      2.07.06     15/09/1999
--------------------------------------------------------------------------------
* Inclusão de três novos tipos de cálculo : Condicional, Arquivos Genéricos e
Acumulado
* Corrigido o erro na inclusão na tela de Criação de Relatórios
* Corrigidos os erros nos gráficos do sistema
* Corrigido o erro no relatório de Planilha de Preenchimento do Orçamento
================================================================================
CM$VER      2.07.05     10/08/1999
--------------------------------------------------------------------------------
* Inclusão da visualização do valor do Saldo Atual da Conta selecionada em 
todas as telas de Processos
* Inclusão da visualização do Grupo da Conta Orçamentária selecionada em
todas as telas de Processos
* Inclusão da verificação dos Grupos de Contas Orçamentárias na tela de
Transferências Orçamentárias (os grupos das contas devem ser iguais)
================================================================================
CM$VER      2.07.04     22/07/1999
--------------------------------------------------------------------------------
* Acertos de performance nos Relatórios de Saldos
* Criação dos níveis de acesso por usuário
* Criação dos relatórios de Impressão de Reservas, Compromissos, Retornos,
Transferências e Suplementações
* Possibilidade de se buscar as Contas Orçamentárias digitando o código
* Validação dos campos da tela sem apagar os valores anteriores
================================================================================
CM$VER      2.07.03     28/06/1999
--------------------------------------------------------------------------------
* Tela de Cadastro de Compromissos Orçamentários refeita, com a inclusão 
da possibilidade de se criar um compromisso a partir de várias reservas.
* Acertos na tela de Cadastro de Reservas Orçamentárias
* Acertos na tela de Cadastro de Transferências
* Acertos na tela de Cadastro de Suplementações
* Acertos na tela de Cadastro de Retornos
* Acertos nas funções de integração com outros sistemas 
(programação apenas)
================================================================================
CM$VER      2.07.02     21/06/1999
--------------------------------------------------------------------------------
* Correções na tela de Usuários por Centros de Responsabilidade
================================================================================
CM$VER      2.07.01     15/06/1999
--------------------------------------------------------------------------------
* Inclusão das funções uOrcamento (programação apenas)
* Correções gerais nas funções de Integração
================================================================================
CM$VER      2.06.10     07/06/1999
--------------------------------------------------------------------------------
* Inclusão das funções IntegraBack (programação apenas)
================================================================================
CM$VER      2.06.09     27/05/1999
--------------------------------------------------------------------------------
* Criação da possibilidade de se importar o nome e o código das contas
   contábeis para a inclusão de novas contas orçamentárias
================================================================================
CM$VER      2.06.08     17/05/1999
--------------------------------------------------------------------------------
* Correções na tela de Cadastro de Contas Orçamentárias
* Correções na tela de Cadastro de Usuários por Centro de Responsabilidade
* Correções na Busca de Contas em todas as telas
================================================================================
CM$VER      2.06.07     11/05/1999
--------------------------------------------------------------------------------
* Correções na tela de Cadastro de Orçamento por período
Histórico de alterações efetuadas no módulo Planejamento e Orçamento
================================================================================
CM$VER      2.06.06     22/03/1999
--------------------------------------------------------------------------------
* Correção do erro na tela de Criação de Relatórios
================================================================================
CM$ALT}






















































































































































































































































