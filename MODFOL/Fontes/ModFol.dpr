program ModFol;



uses
  windows,
  Forms,
  fPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  fTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  fCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  fSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  fOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  fParamTICKETMagnetico in 'fParamTICKETMagnetico.pas' {frmParamTICKETMagnetico},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  fCadSit in '..\..\Shared\ModComp\FontesMT\fCadSit.pas' {frmCadSit},
  fCadCBO in '..\FontesMT\fCadCBO.pas' {frmCadCBO},
  fCadProfi in '..\..\Shared\ModComp\FontesMT\fCadProfi.pas' {frmCadProfi},
  fCadTipoTrab in '..\FontesMT\fCadTipoTrab.pas' {frmCadTipoTrab},
  fCadGrauInstr in '..\..\Shared\ModComp\FontesMT\fCadGrauInstr.pas' {frmCadGrauInstr},
  fAssocProvEmpre in '..\..\Shared\ModComp\FontesMT\fAssocProvEmpre.pas' {frmAssocProvEmpre},
  fLerCodProvento in '..\..\Shared\ModComp\FontesMT\fLerCodProvento.pas' {frmLerCodProvento},
  fCadRubCLT in '..\FontesMT\fCadRubCLT.pas' {frmCadRubCLT},
  fCadHoraTrab in '..\FontesMT\fCadHoraTrab.pas' {frmCadHoraTrab},
  fCadTurnoDia in '..\FontesMT\fCadTurnoDia.pas' {frmCadTurnoDia},
  fCadLinha in '..\FontesMT\fCadLinha.pas' {frmCadLinha},
  fRegLinha in '..\..\Shared\ModComp\FontesMT\fRegLinha.pas' {frmRegLinha},
  fCadDiaExtra in '..\FontesMT\fCadDiaExtra.pas' {frmCadDiaExtra},
  fCadCNAE in '..\FontesMT\fCadCNAE.pas' {frmCadCNAE},
  fCadDARF in '..\FontesMT\fCadDARF.pas' {frmCadDARF},
  fCadFPAS in '..\FontesMT\fCadFPAS.pas' {frmCadFPAS},
  fCadSegAcid in '..\FontesMT\fCadSegAcid.pas' {frmCadSegAcid},
  fCadMovCAGED in '..\FontesMT\fCadMovCAGED.pas' {frmCadMovCAGED},
  fCadDocOfic in '..\FontesMT\fCadDocOfic.pas' {frmCadDocOfic},
  fCadDeposGRE in '..\FontesMT\fCadDeposGRE.pas' {frmCadDeposGRE},
  fCadCatEmprGRE in '..\FontesMT\fCadCatEmprGRE.pas' {frmCadCatEmprGRE},
  fCadFormFGTS in '..\FontesMT\fCadFormFGTS.pas' {frmCadFormFGTS},
  fCadSitRisco in '..\FontesMT\fCadSitRisco.pas' {frmCadSitRisco},
  fCadNatEmpr in '..\FontesMT\fCadNatEmpr.pas' {frmCadNatEmpr},
  fCadVincEmpr in '..\FontesMT\fCadVincEmpr.pas' {frmCadVincEmpr},
  fCadAfastRAIS in '..\FontesMT\fCadAfastRAIS.pas' {frmCadAfastRAIS},
  fCadEntid in '..\..\Shared\ModComp\FontesMT\fCadEntid.pas' {frmCadEntid},
  fCadSindi in '..\..\Shared\ModComp\FontesMT\fCadSindi.pas' {frmCadSindi},
  fCadHstAlterCad in '..\..\Shared\ModComp\FontesMT\fCadHstAlterCad.pas' {frmCadHstAlterCad},
  fHstEvol in '..\..\Shared\ModComp\FontesMT\fHstEvol.pas' {frmHstEvol},
  fHstSitFunc in '..\FontesMT\fHstSitFunc.pas' {frmHstSitFunc},
  fConsHistRubSal in '..\FontesMT\fConsHistRubSal.pas' {frmConsHistRubSal},
  fCadAntec13 in '..\FontesMT\fCadAntec13.pas' {frmCadAntec13},
  fCadFerias in '..\FontesMT\fCadFerias.pas' {frmCadFerias},
  fCadCargo in '..\..\Shared\ModComp\FontesMT\fCadCargo.pas' {frmCadCargo},
  fCadMotivo in '..\..\Shared\ModComp\FontesMT\fCadMotivo.pas' {frmCadMotivo},
  fCadTipoRegra in '..\FontesMT\fCadTipoRegra.pas' {frmCadTipoRegra},
  fElimLanca in '..\FontesMT\fElimLanca.pas' {frmElimLanca},
  fAssociaHorario in '..\FontesMT\fAssociaHorario.pas' {frmAssociaHorario},
  fCadRegSitFunc in '..\FontesMT\fCadRegSitFunc.pas' {frmCadRegSitFunc},
  fDicionarioDados in '..\FontesMT\fDicionarioDados.pas' {frmDicionarioDados},
  fCadCampos in '..\FontesMT\fCadCampos.pas' {frmCadCampos},
  fCadGrupoArquivo in '..\FontesMT\fCadGrupoArquivo.pas' {frmCadGrupoArquivo},
  fAssociacaoGruposCampos in '..\FontesMT\fAssociacaoGruposCampos.pas' {frmAssociacaoGruposCampos},
  fCadBancoPortador in '..\FontesMT\fCadBancoPortador.pas' {frmCadBancoPortador},
  fCadDependente in '..\FontesMT\fCadDependente.pas' {frmCadDependente},
  fListaTitular in '..\FontesMT\fListaTitular.pas' {frmListaTitular},
  fCadProvDesc in '..\FontesMT\fCadProvDesc.pas' {frmCadProvDesc},
  fCadCtFolha in '..\FontesMT\fCadCtFolha.pas' {frmCadCtFolha},
  fCadLayoutDesconto in '..\FontesMT\fCadLayoutDesconto.pas' {frmCadLayoutDesconto},
  fCadFilial in '..\FontesMT\fCadFilial.pas' {frmCadFilial},
  fCadRubricaManual in '..\FontesMT\fCadRubricaManual.pas' {frmCadRubricaManual},
  fElimHistRubSal in '..\FontesMT\fElimHistRubSal.pas' {frmElimHistRubSal},
  fRegHoras in '..\FontesMT\fRegHoras.pas' {frmRegHoras},
  fLancaHoras in '..\FontesMT\fLancaHoras.pas' {frmLancaHoras},
  fSelPessoalMT in '..\..\Shared\ModComp\FontesMT\fSelPessoalMT.pas' {frmSelPessoalMT},
  fBrwPess in '..\..\Shared\ModComp\FontesMT\fBrwPess.pas' {frmBrwPess},
  fImportaTxt in '..\FontesMT\fImportaTxt.pas' {frmImportaTxt},
  fAcertaDepend in '..\FontesMT\fAcertaDepend.pas' {frmAcertaDepend},
  fEstRubricas in '..\FontesMT\fEstRubricas.pas' {frmEstRubricas},
  fEstatCad in '..\..\Shared\ModComp\FontesMT\fEstatCad.pas' {frmEstatCad},
  fSelEstat in '..\..\Shared\ModComp\FontesMT\fSelEstat.pas' {frmSelEstat},
  fCadCarta in '..\..\Shared\ModComp\FontesMT\fCadCarta.pas' {frmCadCarta},
  fParamCartaComunicadoAux in '..\..\Shared\ModComp\Reports\Source\fParamCartaComunicadoAux.pas' {frmParamCartaComunicadoAux},
  fParamCartaComunicado in '..\..\Shared\ModComp\Reports\Source\fParamCartaComunicado.pas' {frmParamCartaComunicado},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  RCartaComunicado in '..\..\Shared\ModComp\Reports\Source\RCartaComunicado.pas' {RptCartaComunicado},
  fParamSegDes in '..\FontesMT\fParamSegDes.pas' {frmParamSegDes},
  fParamFichaReg in '..\FontesMT\fParamFichaReg.pas' {frmParamFichaReg},
  fParamRelatSubstEvent in '..\FontesMT\fParamRelatSubstEvent.pas' {frmParamRelatSubstEvent},
  fParamCadDependente in '..\Reports\Source\fParamCadDependente.pas' {frmParamCadDependente},
  RCadDependente in '..\Reports\Source\RCadDependente.pas' {RptCadDependente},
  RDeclDependente in '..\Reports\Source\RDeclDependente.pas' {RptDeclDependente},
  RDCT in '..\Reports\Source\RDCT.pas' {RptDCT},
  fParamDCT in '..\Reports\Source\fParamDCT.pas' {frmParamDCT},
  RFichaSalFam in '..\Reports\Source\RFichaSalFam.pas' {RptFichaSalFam},
  fParamFichaSalFam in '..\Reports\Source\fParamFichaSalFam.pas' {frmParamFichaSalFam},
  RRubIntegrContab in '..\Reports\Source\RRubIntegrContab.pas' {RptRubIntegrContab},
  fParamRubIntegrContab in '..\Reports\Source\fParamRubIntegrContab.pas' {frmParamRubIntegrContab},
  REtiquetas in '..\..\Shared\ModComp\Reports\Source\REtiquetas.pas' {RptEtiquetas},
  fParamEtiquetas in '..\..\Shared\ModComp\Reports\Source\fParamEtiquetas.pas' {frmParamEtiquetas},
  RCadPessoal in '..\..\Shared\ModComp\Reports\Source\RCadPessoal.pas' {RptCadPessoal},
  fParamCadPessoal in '..\..\Shared\ModComp\Reports\Source\fParamCadPessoal.pas' {frmParamCadPessoal},
  RAvisoFerias in '..\Reports\Source\RAvisoFerias.pas' {RptAvisoFerias},
  fParamAvisoFerias in '..\Reports\Source\fParamAvisoFerias.pas' {frmParamAvisoFerias},
  RFeriasProgram in '..\Reports\Source\RFeriasProgram.pas' {RptFeriasProgram},
  fParamFeriasProgram in '..\Reports\Source\fParamFeriasProgram.pas' {frmParamFeriasProgram},
  RFichaFinanc in '..\Reports\Source\RFichaFinanc.pas' {RptFichaFinanc},
  fParamFichaFinanc in '..\Reports\Source\fParamFichaFinanc.pas' {frmParamFichaFinanc},
  RFolhaEmprRub in '..\Reports\Source\RFolhaEmprRub.pas' {RptFolhaEmprRub},
  fParamFolhaEmprRub in '..\Reports\Source\fParamFolhaEmprRub.pas' {frmParamFolhaEmprRub},
  fParamFolhaFreq in '..\..\Shared\ModComp\Reports\Source\fParamFolhaFreq.pas' {frmParamFolhaFreq},
  RFolhaFreq in '..\..\Shared\ModComp\Reports\Source\RFolhaFreq.pas' {RptFolhaFreq},
  RFolhaFreqEscala in '..\Reports\Source\RFolhaFreqEscala.pas' {RptFolhaFreqEscala},
  fParamFolhaFreqEscala in '..\Reports\Source\fParamFolhaFreqEscala.pas' {frmParamFolhaFreqEscala},
  RFolhaFreq2 in '..\Reports\Source\RFolhaFreq2.pas' {RptFolhaFreq2},
  fParamFolhaFreq2 in '..\Reports\Source\fParamFolhaFreq2.pas' {frmParamFolhaFreq2},
  RFolhaNormal in '..\Reports\Source\RFolhaNormal.pas' {RptFolhaNormal},
  fParamFolhaNormal in '..\Reports\Source\fParamFolhaNormal.pas' {frmParamFolhaNormal},
  RGPS in '..\Reports\Source\RGPS.pas' {RptGPS},
  fParamGPS in '..\Reports\Source\fParamGPS.pas' {frmParamGPS},
  RGRCS in '..\Reports\Source\RGRCS.pas' {RptGRCS},
  fParamGRCS in '..\Reports\Source\fParamGRCS.pas' {frmParamGRCS},
  RGRFC in '..\Reports\Source\RGRFC.pas' {RptGRFC},
  fParamGRFC in '..\Reports\Source\fParamGRFC.pas' {frmParamGRFC},
  RLancRubIndiv in '..\..\Shared\ModComp\Reports\Source\RLancRubIndiv.pas' {RptLancRubIndiv},
  fParamLancRubIndiv in '..\..\Shared\ModComp\Reports\Source\fParamLancRubIndiv.pas' {frmParamLancRubIndiv},
  RReciboAvisoFerias in '..\Reports\Source\RReciboAvisoFerias.pas' {RptReciboAvisoFerias},
  fParamReciboAvisoFerias in '..\Reports\Source\fParamReciboAvisoFerias.pas' {frmParamReciboAvisoFerias},
  RAcompEscalaFerias in '..\Reports\Source\RAcompEscalaFerias.pas' {RptAcompEscalaFerias},
  fParamAcompEscalaFerias in '..\Reports\Source\fParamAcompEscalaFerias.pas' {frmParamAcompEscalaFerias},
  RAlfabMensal in '..\Reports\Source\RAlfabMensal.pas' {RptAlfabMensal},
  fParamAlfabMensal in '..\Reports\Source\fParamAlfabMensal.pas' {frmParamAlfabMensal},
  REscalaFerias in '..\Reports\Source\REscalaFerias.pas' {RptEscalaFerias},
  fParamEscalaFerias in '..\Reports\Source\fParamEscalaFerias.pas' {frmParamEscalaFerias},
  RSalarioEduc in '..\Reports\Source\RSalarioEduc.pas' {RptSalarioEduc},
  fParamSalarioEduc in '..\Reports\Source\fParamSalarioEduc.pas' {frmParamSalarioEduc},
  RReciboPagamento in '..\..\Shared\ModComp\Reports\Source\RReciboPagamento.pas' {RptReciboPagamento},
  fParamReciboPagamento in '..\Reports\Source\fParamReciboPagamento.pas' {frmParamReciboPagamento},
  RRelRecContribSind in '..\Reports\Source\RRelRecContribSind.pas' {RptRelRecContribSind},
  fParamRelRecContribSind in '..\Reports\Source\fParamRelRecContribSind.pas' {frmParamRelRecContribSind},
  RPrevisaoFerias in '..\Reports\Source\RPrevisaoFerias.pas' {RptPrevisaoFerias},
  fParamPrevisaoFerias in '..\Reports\Source\fParamPrevisaoFerias.pas' {frmParamPrevisaoFerias},
  fCadParam in '..\FontesMT\fCadParam.pas' {frmCadParam},
  RProvisao13 in '..\Reports\Source\RProvisao13.pas' {RptProvisao13},
  fParamProvisaoFerias in '..\Reports\Source\fParamProvisaoFerias.pas' {frmParamProvisaoFerias},
  RProvisaoFerias in '..\Reports\Source\RProvisaoFerias.pas' {RptProvisaoFerias},
  RResFol in '..\Reports\Source\RResFol.pas' {RptResFol},
  fParamResFolComp in '..\..\Shared\ModComp\Reports\Source\fParamResFolComp.pas' {frmParamResFolComp},
  fParamResFol in '..\Reports\Source\fParamResFol.pas' {frmParamResFol},
  RResFolComp in '..\..\Shared\ModComp\Reports\Source\RResFolComp.pas' {RptResFolComp},
  RRelTransporte in '..\Reports\Source\RRelTransporte.pas' {RptRelTransporte},
  fParamRelTransporte in '..\Reports\Source\fParamRelTransporte.pas' {frmParamRelTransporte},
  fImportacaoDireta in '..\..\Shared\ModComp\FontesMT\fImportacaoDireta.pas' {frmImportacaoDireta},
  fCadFaixa in '..\..\Shared\ModComp\FontesMT\fCadFaixa.pas' {frmCadFaixa},
  uCmCtrlRptModFol in '..\CtrlObjetos\uCmCtrlRptModFol.pas',
  fCadRegEvol in '..\..\Shared\ModComp\FontesMT\fCadRegEvol.pas' {frmCadRegEvol},
  REtiquetaAlteracaoCTPS in '..\..\Shared\ModComp\Reports\Source\REtiquetaAlteracaoCTPS.pas' {RptEtiquetaAlteracaoCTPS},
  fSelSimul in '..\..\Shared\ModComp\FontesMT\fSelSimul.pas' {frmSelSimul},
  fEfetivaSimul in '..\..\Shared\ModComp\FontesMT\fEfetivaSimul.pas' {frmEfetivaSimul},
  fLancaRubPorRub in '..\..\Shared\ModComp\FontesMT\fLancaRubPorRub.pas' {frmLancaRubPorRub},
  fParamVTMagnetico in '..\FontesMT\fParamVTMagnetico.pas' {frmParamVTMagnetico},
  fParamCAGEDMagnetico in '..\FontesMT\fParamCAGEDMagnetico.pas' {frmParamCAGEDMagnetico},
  fLancaRub in '..\FontesMT\fLancaRub.pas' {frmLancaRub},
  fIncRubrica in '..\..\Shared\ModComp\FontesMT\fIncRubrica.pas' {frmIncRubrica},
  fCadRegTrabOutroCC in '..\FontesMT\fCadRegTrabOutroCC.pas' {frmCadRegTrabOutroCC},
  fParamTRCT in '..\Reports\Source\fParamTRCT.pas' {frmParamTRCT},
  RTRCT in '..\Reports\Source\RTRCT.pas' {RptTRCT},
  RVariavelMensal in '..\..\Shared\ModComp\Reports\Source\RVariavelMensal.pas' {RptVariavelMensal},
  fParamVariavelMensal in '..\..\Shared\ModComp\Reports\Source\fParamVariavelMensal.pas' {frmParamVariavelMensal},
  RRelTransporteLinha in '..\Reports\Source\RRelTransporteLinha.pas' {RptRelTransporteLinha},
  fPassosFormaCalc in '..\FontesMT\fPassosFormaCalc.pas' {frmPassosFormaCalc},
  fConsulta in '..\FontesMT\fConsulta.pas' {frmConsulta},
  fExecutaFormaCalc in '..\FontesMT\fExecutaFormaCalc.pas' {frmExecutaFormaCalc},
  fCadFormula in '..\FontesMT\fCadFormula.pas' {frmCadFormula},
  fCadFunc in '..\..\Shared\ModComp\FontesMT\fCadFunc.pas' {frmCadFunc},
  fProcuraPessoaDoc in '..\..\Shared\ModComp\FontesMT\fProcuraPessoaDoc.pas' {frmProcuraPessoaDoc},
  fParamGFIPMagnetico in '..\FontesMT\fParamGFIPMagnetico.pas' {frmParamGFIPMagnetico},
  fCadTabGener in '..\FontesMT\fCadTabGener.pas' {frmCadTabGener},
  fParamArqPagto in '..\FontesMT\fParamArqPagto.pas' {frmParamArqPagto},
  fParamRAISMagnetico in '..\FontesMT\fParamRAISMagnetico.pas' {frmParamRAISMagnetico},
  RCracha in '..\..\Shared\ModComp\Reports\Source\RCracha.pas' {RptCracha},
  fParamCracha in '..\..\Shared\ModComp\Reports\Source\fParamCracha.pas' {frmParamCracha},
  RCompSaldo in '..\Reports\Source\RCompSaldo.pas' {RptCompSaldo},
  fParamCompSaldo in '..\Reports\Source\fParamCompSaldo.pas' {frmParamCompSaldo},
  fParamReciboTerceiros in '..\Reports\Source\fParamReciboTerceiros.pas' {frmParamReciboTerceiros},
  RReciboTerceiros in '..\Reports\Source\RReciboTerceiros.pas' {RptReciboTerceiros},
  RBBancario in '..\Reports\Source\RBBancario.pas' {RptBBancario},
  fParamBBancario in '..\Reports\Source\fParamBBancario.pas' {frmParamBBancario},
  fParamRelSalContribINSS in '..\Reports\Source\fParamRelSalContribINSS.pas' {frmParamRelSalContribINSS},
  RRelSalContribINSS in '..\Reports\Source\RRelSalContribINSS.pas' {RptRelSalContribINSS},
  fParamGerencial in '..\Reports\Source\fParamGerencial.pas' {frmParamGerencial},
  RGerencial in '..\Reports\Source\RGerencial.pas' {RptGerencial},
  RAlterFuncional in '..\..\Shared\ModComp\Reports\Source\RAlterFuncional.pas' {RptAlterFuncional},
  fParamRelatAfast in '..\Reports\Source\fParamRelatAfast.pas' {frmParamRelatAfast},
  fLancDocCapCar in '..\..\Shared\ModComp\FontesMT\fLancDocCapCar.pas' {frmLancDocCAPCAR},
  uModulo in '..\CtrlObjetos\uModulo.pas',
  fCadTabLonga in '..\FontesMT\fCadTabLonga.pas' {frmCadTabLonga},
  fParamRelTxtCCheque in '..\..\Shared\ModComp\FontesMT\fParamRelTxtCCheque.pas' {frmParamRelTxtCCheque},
  RFichaFunc in '..\..\Shared\ModComp\Reports\Source\RFichaFunc.pas' {RptFichaFunc},
  fParamFichaFunc in '..\..\Shared\ModComp\Reports\Source\fParamFichaFunc.pas' {frmParamFichaFunc},
  RCadRubSal in '..\Reports\Source\RCadRubSal.pas' {RptCadRubSal},
  fParamCadRubSal in '..\Reports\Source\fParamCadRubSal.pas' {frmParamCadRubSal},
  fRegistraOcorr in '..\..\Shared\ModComp\FontesMT\fRegistraOcorr.pas' {frmRegistraOcorr},
  fParamDemPagEspecial in '..\Reports\Source\fParamDemPagEspecial.pas' {frmParamDemPagEspecial},
  RDemPagEspecial in '..\Reports\Source\RDemPagEspecial.pas' {RptDemPagEspecial},
  fProgresso_GeraCalc in '..\FontesMT\fProgresso_GeraCalc.pas' {frmProgresso_GeraCalc},
  fParamCAP_GeraCalc in '..\FontesMT\fParamCAP_GeraCalc.pas' {frmParamCAP_GeraCalc},
  fGeraCalc in '..\FontesMT\fGeraCalc.pas' {frmGeraCalc},
  fParamContabFolha in '..\FontesMT\fParamContabFolha.pas' {frmParamContabFolha},
  fOpcRescisao in '..\FontesMT\fOpcRescisao.pas' {frmOpcRescisao},
  fResciContr in '..\FontesMT\fResciContr.pas' {frmResciContr},
  fSelRub_ResciContr in '..\FontesMT\fSelRub_ResciContr.pas' {frmSelRub_ResciContr},
  fParamAlterFuncional in '..\..\Shared\ModComp\Reports\Source\fParamAlterFuncional.pas' {frmParamAlterFuncional},
  RRelatAfast in '..\Reports\Source\RRelatAfast.pas' {RptRelatAfast},
  RSegDesemprego in '..\Reports\Source\RSegDesemprego.pas' {RptSegDesemprego},
  fParamCadFormaCalc in '..\Reports\Source\fParamCadFormaCalc.pas' {frmParamCadFormaCalc},
  RCadFormaCalc in '..\Reports\Source\RCadFormaCalc.pas' {RptCadFormaCalc},
  RReciboPagamentoFuncef in '..\..\Shared\ModComp\Reports\Source\RReciboPagamentoFuncef.pas' {RptReciboPagamentoFuncef},
  fAlteraColetivoLanca in '..\..\Shared\ModComp\FontesMT\fAlteraColetivoLanca.pas' {frmAlteraColetivoLanca},
  fParamGRRFMagnetico in '..\FontesMT\fParamGRRFMagnetico.pas' {frmParamGRRFMagnetico},
  RReciboAutonomo in '..\..\SHARED\ModComp\Reports\Source\RReciboAutonomo.pas' {RptReciboAutonomo},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas',
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  RReciboCedidos in '..\..\SHARED\ModComp\Reports\Source\RReciboCedidos.pas' {RptReciboCedidos},
  DFolha in '..\..\FOLHA\Fontes\DFolha.pas' {dtmFolha: TDataModule},
  FCadListaRecebedor in '..\..\SHARED\Folhas\FCadListaRecebedor.pas' {FrmCadListaRecebedor},
  RRubSalariaisDadosPrinc in '..\Reports\Source\RRubSalariaisDadosPrinc.pas' {RptRubSalariaisDadosPrinc},
  fParamRubSalDadosPrinc in '..\Reports\Source\fParamRubSalDadosPrinc.pas' {frmParamRubSalDadosPrinc},
  RCadDependenteAnal in '..\Reports\Source\RCadDependenteAnal.pas' {RptCadDependenteAnal},
  fTransfSub in 'fTransfSub.pas' {frmTransfSub},
  RDBCExcesso in '..\..\Shared\ModComp\Reports\Source\RDBCExcesso.pas' {RptDBCExcesso},
  RDebitoConta in '..\..\Shared\ModComp\Reports\Source\RDebitoConta.pas' {RptDebitoConta},
  fAtualizacaoDeFotos in 'fAtualizacaoDeFotos.pas' {frmAtualizacaoDeFotos},
  DCapCarMT in 'DCapCarMT.pas' {DtmCapCarMT: TDataModule},
  DCtrlDocCapCar in 'DCtrlDocCapCar.pas' {DtmCtrlDocCapCar: TDataModule},
  uCtrlLancDocCapCar in '..\CtrlObjetos\uCtrlLancDocCapCar.pas',
  fReplicaCCusto in '..\FontesMT\fReplicaCCusto.pas' {frmReplicaCCusto},
  RReciboPagamentoFerias in '..\..\SHARED\ModComp\Reports\Source\RReciboPagamentoFerias.pas' {RptReciboPagamentoFerias},
  RApGr4 in '..\Reports\Source\RApGr4.pas' {RptApGr4},
  rAutPag in '..\Reports\Source\rAutPag.pas' {RptAutPag},
  uCtrlDocumento in '..\CtrlObjetos\uCtrlDocumento.pas',
  RApGr3 in '..\Reports\Source\RApGr3.pas' {RptApGr3},
  rAutPag1 in '..\Reports\Source\rAutPag1.pas' {RptAutPag1},
  fCadAdvertenciaSuspensao in '..\FontesMT\fCadAdvertenciaSuspensao.pas' {frmCadAdvertenciaSuspensao},
  uCtrlAdvertenciaSuspensao in '..\CtrlObjetos\uCtrlAdvertenciaSuspensao.pas',
  RTRCT_Homologacao in '..\Reports\Source\RTRCT_Homologacao.pas' {RptTRCT_Homologacao},
  RTRCT_Quitacao in '..\Reports\Source\RTRCT_Quitacao.pas' {RptTRCT_Quitacao},
  fIntegraContribPrev in '..\FontesMT\fIntegraContribPrev.pas' {FrmIntegraContribPrev},
  uCtrlIntegraContribPrev in '..\CtrlObjetos\uCtrlIntegraContribPrev.pas',
  fCadRubricaSaudeOdonto in 'fCadRubricaSaudeOdonto.pas' {frmCadRubricaSaudeOdonto},
  RCalcMargemConsig in '..\Reports\Source\RCalcMargemConsig.pas' {rptCalcMargemConsig},
  FCalcMargemConsig in 'FCalcMargemConsig.pas' {frmCalcMargemConsig},
  RAdvertenciaSuspensao in '..\Reports\Source\RAdvertenciaSuspensao.pas' {RptAdverteSuspensao},
  fParamAdverteSuspensao in '..\Reports\Source\fParamAdverteSuspensao.pas' {frmParamAdverteSuspensao},
  FCadBenefPeriodo in 'FCadBenefPeriodo.pas' {frmCadBenefPeriodo},
  FObservacaoCTemp in '..\..\Shared\ModComp\FontesMT\FObservacaoCTemp.pas' {frmObservacaoCTemp},
  fCadRegEstabilidade in '..\FontesMT\fCadRegEstabilidade.pas' {FrmCadRegEstabilidade},
  fRegAvisoPrev in '..\FontesMT\fRegAvisoPrev.pas' {frmRegAvisoPrev},
  FGeraLstIndiv in '..\..\SHARED\Folhas\FGeraLstIndiv.pas' {FrmGeraLstIndiv},
  FGeraLstIndivResul in '..\..\SHARED\Folhas\FGeraLstIndivResul.pas' {FrmGeraLstIndivResul},
  FRemuneracaoOutroEmpregado in 'FRemuneracaoOutroEmpregado.pas' {frmRemuneracaoOutroEmpregado},
  RAACTPS in '..\Reports\Source\RAACTPS.pas' {RptRAACTPS},
  fParamAACTPS in '..\Reports\Source\fParamAACTPS.pas' {frmParamAACTPS},
  FCadRegMerito in '..\FontesMT\FCadRegMerito.pas' {FrmCadRegMerito},
  rAutPagCofin in '..\..\CMCAPCARUTILOBJ50\Reports\Source\rAutPagCOFIN.pas' {RptAutPagCofin},
  uCtrlRelatoriosCAPCAR in '..\..\CMCAPCARUTILOBJ50\CtrlObjects\uCtrlRelatoriosCAPCAR.pas',
  fParamEmail in '..\Reports\Source\fParamEmail.pas' {frmParamEmail},
  REmail in '..\Reports\Source\REmail.pas' {RptEmail},
  fCadParamETL in '..\FontesMT\fCadParamETL.pas' {FrmCadParamETL},
  uCtrlParamETL in '..\CtrlObjetos\uCtrlParamETL.pas';

//WO11539 - Helen

//WO11539 - Helen V Bianchi

{$R *.RES}
{$R MODFOL_RES.RES}
begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Folha de Pagamento';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TRptReciboAutonomo, RptReciboAutonomo);
  Application.CreateForm(TRptReciboCedidos, RptReciboCedidos);
  Application.CreateForm(TRptRubSalariaisDadosPrinc, RptRubSalariaisDadosPrinc);
  Application.CreateForm(TfrmParamRubSalDadosPrinc, frmParamRubSalDadosPrinc);
  Application.CreateForm(TRptCadDependenteAnal, RptCadDependenteAnal);
  Application.CreateForm(TRptReciboPagamentoFerias, RptReciboPagamentoFerias);
  Application.CreateForm(TRptTRCT_Homologacao, RptTRCT_Homologacao);
  Application.CreateForm(TRptTRCT_Quitacao, RptTRCT_Quitacao);
  Application.CreateForm(TFrmGeraLstIndiv, FrmGeraLstIndiv);
  Application.CreateForm(TFrmGeraLstIndivResul, FrmGeraLstIndivResul);
  frmAguarde.FormStyle := fsNormal;
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Folha de Pagamento
================================================================================
CM$VER      4.15.12a    06/06/2008
--------------------------------------------------------------------------------
(Pendência 28012)
- Consultas / Relatórios / Operacionais / Previsão de Férias:
  * Foi corrigido o erro que ocorria quando as férias são de 30 dias, 
e o campo de saldo, do relatório, mostrava o valor de 30 e não de 0.
================================================================================
CM$VER      4.15.12     07/05/2008
--------------------------------------------------------------------------------
(Pendência 27267)
- Consultas / Relatórios / Folha ... / Operacionais / Ficha Financeira por Funcionário:
  * Foi corrigido o erro que ocorria qunado mais de 1000 funcionários eram selecionados.
================================================================================
CM$VER      4.15.11     08/04/2008
--------------------------------------------------------------------------------
(Pendência 27711)
- Cadastros / ... / Forma de Cálculo: 
 * Revisão e acerto de alguns textos explicativos e ilustrativos (exemplos) que são exibidos
   no rodapé da tela, ao se selecionar uma função durante a construção da fórmula.
(Pendência 27712)
- Consultas / Relatórios / ... / Operacionais / Relação de Transportes (em Colunas): 
   Correção da data exibida no cabeçalho.
================================================================================
CM$VER      4.15.10     25/03/2008
--------------------------------------------------------------------------------
(Pendência 25807)
- Cadastros / Tabelas Auxiliares / Tabelas Regra / Forma de Cálculo:
  * Inclusão da função "Especiais / ContribPrev", que retorna o campo ValorBase (1, 2,ou 3) da tabela
    CONTRIBPREVPARTP (parâmetros passados: IDCONTRIBUICAO e indicador 1, 2 ou 3).
(Pendência 27398)
- Cadastros / Pessoal:
  * Na aba situação funcional, ao selecionar o Centro de Custo, o sistema agora está exibindo
    os centros de custo do plano padrão (GLOBAL).
================================================================================
CM$VER      4.15.09     14/03/2008
--------------------------------------------------------------------------------
Pendencia : 27569
Inserindo Help nas telas.
================================================================================
CM$VER      4.15.08     07/03/2008
--------------------------------------------------------------------------------
Reorganizando estrutura de diretórios.
================================================================================
CM$VER      4.15.07     05/03/2008
--------------------------------------------------------------------------------
Pendência: 27511
Tela: Cadastros/Cargos e Afins/Cargos
Descrição: Retirada do campo 'CBO 1994' que encontra-se em desuso desde março de 2003.
================================================================================
CM$VER      4.15.06     26/02/2008
--------------------------------------------------------------------------------
(Pendência 27486)
- Transções / Férias:
  * Alteração do valor padrão de Parcelas de Devolução.
================================================================================
CM$VER      4.15.05     25/02/2008
--------------------------------------------------------------------------------
(Pendência 27471)
- Cadastros/Tabelas auxiliares/Tabelas regra-forma de calculo/Forma de calculo:
  * Alteração do layout da tela de formas de cálculo.
================================================================================
CM$VER      4.15.04     15/02/2008
--------------------------------------------------------------------------------
(Pendência 27402)
- Cadastros / Integração Contábil / aba Contabilidade:
  * Inclusão do campo Histórico Padrão.
(Pendência 27403)
- Transações / Geração da Folha / aba Seleção de Empresas, Estab. ...:
  * Os botões "Seleciona Todos" e "Inverte Seleção", na caixa "Estabelecimento(s)" não
    estavam atualizando a lista de empregados na primeira aba. Isto foi corrigido.
================================================================================
CM$VER      4.15.03     11/02/2008
--------------------------------------------------------------------------------
(Pendência 27384)
- Cadastros / Tab. Aux. / Tab. REGRA .../ Dicionário de Dados:
  * Correção na inserção de novo campo no dicionário.
  * Alteração na funcão de alterar um campo do dicionário, porque ao final da
    operação a função "Alterar" era habilitada novamente, confundindo o usuário.
================================================================================
CM$VER      4.15.02     31/01/2008
--------------------------------------------------------------------------------
(Pendência 25009 - Complementação)
- Meios magnéticos / RAIS
  * Ajustes para a geração da RAIS Ano-Base 2007.
================================================================================
CM$VER      4.15.01     08/01/2008
--------------------------------------------------------------------------------
(Pendência 26297)
- Cadastros / Pessoal
- Cadastros / Integração Contábil
- Transações / Horas Trabalhadas em Outro 
- Transações / Registro de Alteração Funcional
  * Distinção dos Centros de Custo ativos e inativos nas caixas de seleção em que são exibidos.
================================================================================
CM$VER      4.15.00     02/01/2008
--------------------------------------------------------------------------------
(Pendência 27093)
- Transações / Registro de Horas Trabalhadas em Outro Setor:
  * Na tela de busca da pessoa, foi acrescentada a opção de selecionar pelo código
    e/ou pelo nome do Centro de Custo (de sua lotação normal).
================================================================================
CM$VER      4.14.09     01/11/2007
--------------------------------------------------------------------------------
(Pendência 25746)
- Transações / Geração da Folha e Rescisão:
  * Inclusão da opção "Mantém Plano Contábil e Patrocinadora da TmpDesc", para que o
    usuário possa indicar se, nos movimentos recebidos por integração via TMPDESC, essas 
    informações devem ser preservadas ou alteradas para o padrão definido no Global CM.
- Transações / Contabilização ... da Folha:
  * Tratamento da opção acima especificada.
================================================================================
CM$VER      4.14.08     16/08/2007
--------------------------------------------------------------------------------
(Pendência 26103)
- Consultas / Relatórios Especias / Relatório de Substituição Eventual:
  * Correção do erro "EDatabaseError - Invalid data packet".
(Pendência 26111)
- Consultas / Relatórios / Folha ... / Operacionais / Relatórios de Provisão (Férias e 13º):
  * Correção dos cálculos, em certas situações, quando era usada a opção "Incremento".
================================================================================
CM$VER      4.14.07     08/08/2007
--------------------------------------------------------------------------------
(Pendência 26046)
- Cadastros / Integração Contábil:
  * Inclusão dos botões "Procurar Contábil"  e  "Procurar CAP", que permitem
   a busca das rubricas parametrizadas segundo a sua integração para a 
   Contabilidade ou para o Contas a Pagar, respectivamente.
================================================================================
CM$VER      4.14.06     27/07/2007
--------------------------------------------------------------------------------
(Pendência 25896) 
- Consultas / Relatórios / Folha ... / Operacionais / Resumo da Folha de Pagamento: 
* Agora permite filtragem por tipo de contrato.
================================================================================
CM$VER      4.14.05     17/07/2007
--------------------------------------------------------------------------------
(Pendência 25828)
- Transações / Registro de Alteração Funcional  e Reajuste Salarial:
  * Inclusão da matícula e correção do CBO na etiqueta para CTPS.
================================================================================
CM$VER      4.14.04     10/07/2007
--------------------------------------------------------------------------------
(Pendência 25822)
- Transações / Férias:
  * Nos casos aplicáveis, a mensagem de recusa sobre a quantidade de dias de gozo foi
    transformada em mensagem de alerta.
================================================================================
CM$VER      4.14.03     22/06/2007
--------------------------------------------------------------------------------
- Transações / Cartas e Comunicados:
  * Adequação da rotina que trata o campo "Deficiente" ao seu novo escopo
    (vários tipos de deficiência)
(Pendência 25656)
- Consultas / Relatórios / Folha... / Oper... / Lançamentos de Rubricas Individuais:
  * Foi introduzido um filtro para listar apenas os lançamentos da Folha de Pagamento,
    mesmo quando o usuário optar por não selecionar rubrica(s).
================================================================================
CM$VER      4.14.02     18/06/2007
--------------------------------------------------------------------------------
Histórico de alterações efetuadas no módulo Folha de Pagamento
(Pendência 25009 - Parte)
- Cadastros / Pessoal / aba Dados Pessoais:
  * O campo Deficiente Físico (Sim ou Não) foi substituído por uma caixa de múltipla
    escolha, onde constam os vários tipos de deficiência que a RAIS exige.
================================================================================
CM$VER      4.14.01     15/05/2007
--------------------------------------------------------------------------------
(Pendência 24125)
- Cadastros \ Tabelas Auxiliares \ Tabelas Regra / Forma de Cálculo \ Tabela Genérica
  * Permitir que o usuário logado no sistema de RH visualize apenas as tabelas liberadas para o seu usuário.
================================================================================
CM$VER      4.14.00     14/05/2007
--------------------------------------------------------------------------------
(Pendência 25313)
- Cadastros / Motivos e Ações:
  * Inclusão do campo que permite indicar se o motivo, caso seja afastamento, abate na contagem
    de avos para Férias e 13º Salário (a caixa deve ficar marcada se for para abater).
- Consultas / Relatórios / Folha ... / Operacionais / Relatórios de Provisão (Férias e 13º):
  * Os avos de afastamentos indicados como acima são agora abatidos da contagem.
================================================================================
CM$VER      4.13.03     10/05/2007
--------------------------------------------------------------------------------
(Pendência 24857)
- Transações / Contabilização e Contas a Pagar da Folha:
  * Inclusão da opção "Mantém C.Custo do Empregado?", que serve para informar se, nos Lançamentos de Horas
    em Outro Setor,  o sistema deve manter o C.Custo do Empregado.
================================================================================
CM$VER      4.13.02     24/04/2007
--------------------------------------------------------------------------------
(Pendência 25169)
- Transações / Manutenção de Documentos (AP):
  * Possibilidade de ter tipos de desembolso com contas contábeis diferentes.
================================================================================
CM$VER      4.13.01     19/04/2007
--------------------------------------------------------------------------------
(Pendência 25098)
- Consultas / Relatórios Especiais/ Demonstrativo de Pagamento:
  * Alterado caminho e nome do arquivo gerado, visivel apenas
    para clientes com parâmetro IDCONTRACHEQUE = 3
(Pendência 25085)
- Sistema / Utilitários / Layout de Arquivos TXT:
  * Correção na inserção de um novo layout.
================================================================================
CM$VER      4.13.00     05/04/2007
--------------------------------------------------------------------------------
- Cadastros / Tab. Aux. / Tabelas FGTS / Formas de Rescisão:
  * Inclusão do campo Código Oficial, utilizado para a GRRF e a TRCT.
- Consultas / Relatórios / Folha de Pagamento / Operacionais / TRCT:
  * O campo código de saque passa a usar a informação registrada na tabela de 
    Formas de Rescisão como Código Oficial.
================================================================================
CM$VER      4.12.41     16/03/2007
--------------------------------------------------------------------------------
(Pendência 24747)
- Cadastros / ... / Tabela Genérica:
  * Reativação da funcionalidade de exportação dos dados da tabela.
================================================================================
CM$VER      4.12.40     12/03/2007
--------------------------------------------------------------------------------
- Meios Magnéticos / RAIS:
  * Ajuste na geração do arquivo para que não seja exibida a mensagem de aviso
    que a pessoa não teve remuneração no ano-base quando a mesma tiver sido
  desligada em Janeiro do ano-base ou tenha sido admitida e demitida no mesmo mês;
  * Mudança na aba "Quant. Horas Mensais p/ Horistas" para "Quant. Horas Extras Mensais" pois agora
    serve para indicar a quantidade de horas extras mensais para todos os funcionários.
================================================================================
CM$VER      4.12.39     27/02/2007
--------------------------------------------------------------------------------
(Pendência 24125)
 - Cadastros \ Tabelas Auxiliares \ Tabelas Regra/Forma de Cálculo \ Tabela genérica
 * Removida a implementação.
================================================================================
CM$VER      4.12.38     23/02/2007
--------------------------------------------------------------------------------
(Pendência 23313)
- Cadastros / Pessoal / aba Situação Funcional:
  * Revisão nos cálculos dos dias de duração e/ou prorrogação de contrato.
 
================================================================================
CM$VER      4.12.37     14/02/2007
--------------------------------------------------------------------------------
(Pendência 24125)
 - Cadastros \ Tabelas Auxiliares \ Tabelas Regra/Forma de Cálculo \ Tabela genérica
 * O usuário só visualizará as tabelas liberadas no sistema.
(Pendência 24484)
 - Transações \ Rescisão
 * Caso o usuário não informe a data de homologação e nem informe uma data alternativa,
o sistema assumirá a data de desligamento como sendo a data de pagamento.
================================================================================
CM$VER      4.12.36     08/02/2007
--------------------------------------------------------------------------------
(Pendência 22564)
- Meios Magnéticos / GRRF (Guia de Recolhimento Rescisório FGTS):
* Introdução dessa nova funcionalidade (exigência legal para recolhimento de FGTS
em certos casos de rescisão).
- Meios Magnéticos / RAIS:
* Alterações legais definidas pelo MTE para 2007.
================================================================================
CM$VER      4.12.35     25/01/2007
--------------------------------------------------------------------------------
(Pendência 24292)
- Transações / Rescisão:
  * Foi corrigido o erro na abertura da tela de rescisão.
================================================================================
CM$VER      4.12.34     22/01/2007
--------------------------------------------------------------------------------
(Pendência 24208)
- Transações / Geração da Folha e Rescisão / Contas a Pagar:
  * Foi incluída a opção de "Consolidar por tipo de desembolso".
================================================================================
CM$VER      4.12.33     08/01/2007
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Recibo/Aviso de Férias:
* Implementação da seleção do Mês/Ano de Referência de pagamento das Férias.
================================================================================
CM$VER      4.12.32     02/01/2007
--------------------------------------------------------------------------------
- Cadastros / ... / Formas de Cálculo / Função Dias Trabalhados:
  * Inclusão da opção 5 (Dias Úteis trabalhados no mês).
- Transações / Contabilização e Contas a Pagar da Folha:
  * Implementação da Segregação de Recursos.
- Transações / Geração da Folha e Rescisão / Subtela Integração com o Contas a Pagar:
  * Implementação da Segregação de Recursos.
================================================================================
CM$VER      4.12.31     21/12/2006
--------------------------------------------------------------------------------
- Transações / Lançamento de Rubricas Salariais / Por Rubrica:
  * Inclusão da opção para efetuar alteração coletiva dos valores lançados, segundo
    vários critérios seletivos, inclusive se a alteração será por valor ou percentual.
- Alguns relatórios e telas:
  * Arquivos TXT que eram gravados no diretório dos executáveis passaram para o C:\
    como já ocorria com os demais relatórios e telas.
================================================================================
CM$VER      4.12.30     28/11/2006
--------------------------------------------------------------------------------
Pendência: 23794
Tela: Sistema\Configuração\Relatórios\Operacionais\Folha de Empregado por Rubrica
Descrição : Implementação dos campos NOME ( funcionario), CARGO, NÍVEL, 
                 UNIDADE(centro de custo) e SALÁRIO(valor da rubrica).
================================================================================
CM$VER      4.12.29     17/11/2006
--------------------------------------------------------------------------------
- Cadastro de Formas de Cálculo:
* Inclusão da função Utilidades / Avos Perdidos (por Afastamentos).
- Cadastro de Formas de Cálculo:
* Inclusão da função Utilidades / Avos Perdidos (por Afastamentos).
================================================================================
CM$VER      4.12.28     06/11/2006
--------------------------------------------------------------------------------
(Pendência 23639)
- Consultas / Relatórios / Folha de Pagamento / Operacionais / TRCT:
* Correção da soma dos proventos da segunda pessoa em diante, quando obviamente se
seleciona mais de uma pessoa para emissão e se opta por "Totais em Todas as Folhas".
================================================================================
CM$VER      4.12.27     09/08/2006
--------------------------------------------------------------------------------
- Transações / Geração da Folha e Rescisão / Subtela Integração com o Contas a Pagar:
  * Inclusão da opção para informar uma Conta Contábil padrão para Favorecidos. Caso a
    geração da AP tenha que criar o favorecido, será usada essa conta.
(Pendência 22475)
- Consultas / Relatórios Especiais / Demonstrativo de Pagamento:
  * Para quem tem a opção "Impressão Direta Frente e Verso", foi alterado o critério
    de exibição do Sal. Contr. INSS.
================================================================================
CM$VER      4.12.26     18/05/2006
--------------------------------------------------------------------------------
(Pendência 18779)
- Transações / Contabilização ... da Folha / aba Contas a Pagar:
  * Inclusão da opção que possibilita a emissão de uma AP com mais de um tipo de
    desembolso..
================================================================================
CM$VER      4.12.25     05/05/2006
--------------------------------------------------------------------------------
- Meios Magnéticos / CAGED:
  * Adequação ao novo modelo do CAGED;
  * Foi incluída uma tela de resultados, com o que foi processado e o que foi recusado.
================================================================================
CM$VER      4.12.24     17/04/2006
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha de Pagamento / Operacionais / Folha de Frequência I:
  * Alterações nos textos do relatório para estagiários. O sistema reconhece esta condição
    de forma dinãmica, ou seja, não é necessário fazer uma execução selecionando apenas
    estagiários e outra com os demais casos.
    Obs.: caso este relatório tenha sido alterado, ele TEM que ser restaurado para ser
             usado nesta nova versão, caso contrário dará um erro.
================================================================================
CM$VER      4.12.23     30/03/2006
--------------------------------------------------------------------------------
- Cadastros / Pessoal:
  * Ao cadastrar o salário de um empregado escolhendo-se a opção Faixa,
     é sensibilizado o Step na Faixa, na guia Opção Cargo, de acordo com
     o salário escolhido.
================================================================================
CM$VER      4.12.22     09/03/2006
--------------------------------------------------------------------------------
- Transações / Meios Magnéticos / RAIS:
  * Alterações para suportar as implementações para a RAIS 2005 (existe docs explicativos
    que devem ser lidos e um programa auxiliar que deve ser utilizado).
- Transações / Meios Magnéticos / GFIP:
  * Alterações diversas para suportar a SEFIP 8.1.
- Cadastro de Formas de Cálculo:
  * Inclusão do parâmetro OpcaoDeficiente na função QtdeDepen, que permite especificar a
    condição de deficiente, não deficiente ou ambos para a contagem de dependentes.
================================================================================
CM$VER      4.12.21     24/02/2006
--------------------------------------------------------------------------------
(Pendência 21623)
- Consultas / Relatórios Especiais / Demonstrativo de Pagamento:
  *  No modelo especial para impressora com frente e verso, foi incluído o campo 
     "Função" após o campo Cargo para espelhar o Cargo Alternativo quando houver.
- Cadastros / Dependentes / aba Dados Pessoais:
  * Foi acrescentado o campo para indicar se o dependente é deficiente.
================================================================================
CM$VER      4.12.20     17/01/2006
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Relatórios de Provisão de Férias e de 13º Salário:
  * Inclusão do valor que serviu de base (Base Cálculo) para os demais valores
    do relatório.
  * Inclusão da possibilidade de selecionar um Tipo de Folha para cada rubrica.
================================================================================
CM$VER      4.12.19     23/12/2005
--------------------------------------------------------------------------------
- Sistema / Utilitários / Importação de Arquivos TXT (Pendência 20905):
  * Correção na importação de arquivos cujo valor esteja especificado sem decimais.
================================================================================
CM$VER      4.12.18     12/12/2005
--------------------------------------------------------------------------------
- Sistema / Utilitários / Layout de Arquivo TXT:
  * Correção na gravação do campo Número de Decimais. A partir de agora, o sistema
    considera 2 (dois) como valor padrão. O usuário pode mudá-lo conforme sua necessidade.
================================================================================
CM$VER      4.12.17     21/11/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha de Pagamento / Operacionais / Relação dos Salários de
  Contribuição ao INSS (Pendência 20536):
  * Foi corrigida a exibição indevida de filhos que já não constam mais para Salário
     Família.
================================================================================
CM$VER      4.12.16     17/11/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios / Operacionais / Recibo de Pagamento (Pendência 20705):
  * Foram incluidos os campos:
    1) Função (Cargo Alternativo), quando houver, no quadro abaixo das rubricas e à
        esquerda dos totais;
    2) Salário de Contribuição Previdência Privada (ou a rubrica que estiver parametrizada
       com a CLT 90011), no rodapé à direita da Base IRRF;
    3) Quantidade de Dependentes para IRRF, no rodapé à direita da Base IRRF (obs.:
        esta informação foi colocada como opcional, pois o sistema sempre irá exibir a
        quantidade ATUAL de dependentes e isto pode ser inconveniente se o recibo 
        a ser impresso for referente a um período passado);
  * Caso este relatório tenha tido seu desenho alterado pelo usuário, ele terá que ser
     restaurado, para que esta nova versão tenha efeito (pode até dar erro, se isto não for
     feito).
================================================================================
CM$VER      4.12.15     11/10/2005
--------------------------------------------------------------------------------
- Transações / Férias (Pendência 20426):
  * Foi incluida coluna para visualisação da opção "Inicío Dev. Adto.", visível
    apenas para os clientes que utilizam essa condição.
- Consultas / Relatórios / Operacionais / Recibo de Pagamento (Pendência 20427):
  * Foi incluida a possibilidade de selecionar mais de um "TIPO DE PAGAMENTO" para
    constar no mesmo recibo. Neste caso, o sistema não pode garantir a coerência
    das informações constantes no rodapé (podem ter significado correto ou não).
================================================================================
CM$VER      4.12.14     28/09/2005
--------------------------------------------------------------------------------
- Cadastro de Formas de Cálculo:
  * Inclusão da função Especiais / Resultado da Avaliação, que retorna os pontos
     obtidos na avaliação mais recente da pessoa, do tipo especificado e em relação
    à data especificada;
  * Inclusão da função Especiais / Quantidade de Pessoal, que retorna a quantidade   
     total de pessoas, conforme os parâmetros especificados;
  * Inclusão da função Especiais / Salário Total do Pessoal, que retorna a soma dos  
     salários das Pessoas, conforme os parâmetros especificados.
================================================================================
CM$VER      4.12.13     22/09/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios Especiais / Demonstrativo de Pagamento:
  * Pequeno ajuste no desenho da nova opção incluída na versão 4.12.07.
================================================================================
CM$VER      4.12.12     10/08/2005
--------------------------------------------------------------------------------
- Cadastros / Integração Contábil:
  * Verificação da condição de Partida Dobrada.
- Transações / Contabilização ... da Folha:
  * Alteração para tratar Partida Dobrada.
================================================================================
CM$VER      4.12.11     18/07/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Operacionais / Ficha Financeira:
  * Inclusão da opção para selecionar os Centros de Custo. Esta opção executa de forma
     mais eficiente se, após a seleção do(s) centro(s) de custo, você voltar à primeira aba
     (lista dos empregados) e marcar todos ou apenas o(s) desejado(s), mas não deixar 
     todos desmarcados.
================================================================================
CM$VER      4.12.10     15/07/2005
--------------------------------------------------------------------------------
- Implementação da geração de arquivos Passe Card (CE), com reflexo em:
  * Cadastros / Vale Transporte / Linhas de Transporte:
    O campo "Tipo de Transporte" deve ser indicado como "Cartão" para as linhas que
    utilizam o Passe Card.
  * Meios Magnéticos / Vale Transporte:
    foi acrescentada a aba "Passe Card (CE)", que deve ter seus cinco campos
    devidamente preenchidos para permitir a geração dos arquivos de cadastro
    (dos empregados) e pedido (dos cartões). Estes arquivos são gravados na pasta
    C:\VALE
- Consultas / Relatórios Especiais / Demonstrativo de Pagamento:
  * Alteração no desenho da nova opção incluída na versão 4.12.07.
================================================================================
CM$VER      4.12.09     06/07/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios Especiais / Demonstrativo de Pagamento:
  * Alteração da nova opção incluída na versão 4.12.07.
================================================================================
CM$VER      4.12.08     05/07/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios Especiais / Demonstrativo de Pagamento:
  * Correção da nova opção incluída na versão anterior.
================================================================================
CM$VER      4.12.07     05/07/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios Especiais / Demonstrativo de Pagamento:
  * Inclusão de nova opção.
================================================================================
CM$VER      4.12.06     22/06/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Férias Programadas:
  * Inclusão do campo Início da Devolução do Adiantamento de Férias,
  que só fica visível para quem tem esse tipo de tratamento.
================================================================================
CM$VER      4.12.05     20/05/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Relação de Transportes (Em Linha) e Relação de
  Transportes (Em Colunas):
  * Implementação da opção que permite agrupar os dados do relatório por
  Tipo de Linha de Transporte.
================================================================================
CM$VER      4.12.04     18/05/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Pessoal:
  * Correção no erro que era apresentado ao selecionar um número muito grande
  de pessoas (mais de 1000).
- Consultas / Relatórios / Folha... / DCT:
  * Correção no erro que era apresentado ao selecionar a opção
  "Somente com PIS em branco".
- Consultas / Relatórios / Folha... / Relatório de Alterações Funcionais:
  * Correção na geração do relatório quando não houver alterações com os
  motivos de alteração especificados dentro do período selecionado.
- Meios Magnéticos / Vale Transporte:
  * Implementação da geração de arquivos Rio Card;
  * Gravação da última pasta selecionada.
- Meios Magnéticos / GFIP:
  * O campo Inscrição do Tomador de Obras passa a não ser mais obrigatório
  para os autônomos.
================================================================================
CM$VER      4.12.03     09/05/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha ... / Cadastrais / Ficha Funcional:
  * Foi alterado o critério de ordenação, de forma a exibir corretamente mais de uma
     alteração funcional com a mesma data de efetivação.
- Consultas / Relatórios / Folha ... / Operacionais / Alterações Funcionais:
  * Foi alterado para não exibir mais uma mensagem de erro quando não há dados.
- Consultas / Relatórios Especiais / Demonstrativo de Pagamento:
  * Foi acresentada uma nova opção a este relatório.
================================================================================
CM$VER      4.12.02     02/05/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios / Operacionais / Recibo/Aviso de Férias e Recibo de Pagamento:
   * O campo Salário Base, no rodapé do recibo, agora exibe o valor da rubrica que está
      parametrizada com a Rubrica Padrão CLT 60052 (valor da base do salário devido),
      que normalmente deverá ser a rubrica que corresponda ao Salário Contratual.
      Com esta alteração, será sempre exibido o salário base da ocasião a que se refere 
      o recibo, e não mais o salário atual, como ocorria até então.
================================================================================
CM$VER      4.12.01     29/04/2005
--------------------------------------------------------------------------------
- Transações / Registro de Alteração Funcional:
  * Alteração na forma de ordenação dos registros, para tratar os casos de mesma data.
- Transações / Geração da Folha e Rescisão:
  * Alteração nos processos que montam as referências para as rubricas com CLT
     90030 e 90031.
- Transações / Férias:
  * Alteração do campo relativo ao mês de início da devolução do adiantamento de férias,
     que só fica visível para quem tem esse tipo de tratamento, de forma a assumir o
     padrão = 1.
================================================================================
CM$VER      4.12.00     14/04/2005
--------------------------------------------------------------------------------
- Transações / Férias:
  * Inclusão do campo relativo ao mês de início da devolução do adiantamento de férias,
     que só fica visível para quem tem esse tipo de tratamento.
================================================================================
CM$VER      4.11.11     06/04/2005
--------------------------------------------------------------------------------
- Consultas/Relatórios/Operacionais/Recibo de Pagamento:
  * Foi corrigida a ordem de impressão, quando a mesma pessoa tinha mais de uma
     página de recibo.
================================================================================
CM$VER      4.11.10     04/04/2005
--------------------------------------------------------------------------------
- Cadastros / Vale Transporte / Linhas de Transporte:
  * Inclusão do Tipo de Transporte "Cartão".
- Transações / Lançamento de Rubricas Salariais / Por Pessoa:
  * Correção da crítica da obrigatoriedade de indicar o favorecido quando a
  rubrica tiver a opção "Obriga Favorecido" marcada no cadastro.
- Meios Magnéticos / Vale Transporte:
  * a partir de agora, as Linhas de Transporte do tipo "Cartão" não serão
  geradas dentro do arquivo.
- Consultas / Relatórios / Folha... / Relatório de Provisão de Férias:
  * Implementação da gravação das rubricas selecionadas;
  * Implementação da opção para selecionar os Demitidos;
  * Implementação da opção para Considerar Situação/Lotação na Ocasião.
- Consultas / Relatórios / Folha... / Relatório de Provisão de 13º Salário:
  * Implementação da gravação das rubricas selecionadas;
  * Implementação da opção para selecionar os Demitidos;
  * Implementação da opção para Considerar Situação/Lotação na Ocasião.
================================================================================
CM$VER      4.11.09     10/03/2005
--------------------------------------------------------------------------------
- Transações / Rescisão:
  * Caso a Data de Homologação e Data de Pagamento não forem indicadas, a
  Data de Desligamento será tomada como Mês de Cobrança/Pagamento.
- Consultas / Relatórios / Folha... / Folha de Empregados por Rubrica:
  * Correção na impressão do relatório quando selecionado "Agrupar por Programa" e
  "Considerar Lotação na Ocasião".
- Consultas / Relatórios / Folha... / Folha de Frequência (Horário Escala):
  * Correção na impressão dos horários que ultrapassavam de um dia para o outro.
- Consultas / Relatórios Especiais / Seguro Desemprego:
  * Mudança na seleção dos modelos. Agora é possível selecionar 3 tipos de modelos
  (1951, 1953, 1960);
  * Implementação do modelo 1960.
- Meios Magnéticos / GFIP:
  * Atualização do processo de geração do arquivo.
================================================================================
CM$VER      4.11.08     26/01/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / GRFC:
  * Correção na emissão da guia em atrazo.
================================================================================
CM$VER      4.11.07     17/01/2005
--------------------------------------------------------------------------------
- Cadastros / Formas de Cálculo:
  * Inclusão do botão para envio do conteúdo da Forma de Cálculo que estiver selecionada.
================================================================================
CM$VER      4.11.06     13/01/2005
--------------------------------------------------------------------------------
- Transações / Registro de Alteração Funcional:
  * Correção na inclusão de mais de um registro por vez.
================================================================================
CM$VER      4.11.05     07/01/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios / Operacionais / Ficha Financeira por Empregado:
  * Incluida a opção de seleção do tipo de folha.
- Consultas / Relatórios / Operacionais / Relação dos salários de contribuição ao INSS:
  * Incluida a opção de seleção do tipo de folha.
- Consulta / Relatórios / Operacionais / Relatório de Dependentes:
  * Incluias as colunas "Conta IR?" (S para dependente no Imposto de Renda e N para não)
    e Data de Cessação (para IR).
- Cadastros / Dependentes / Guia Titular:
  * Incluídos os campos "Data de inclusão do dependente" e "Data de cessação do
    direito do dependente a abatimento no IR".
    Esta será calculada automaticamente pelo sistema, seguindo a regra da
    Receita Federal - 21 anos para filhos, podendo ser alterada manualmente.
- Cadastros / Pessoal / Guia Dependentes:
  * Incluídos os campos "Data de inclusão do dependente" e "Data de cessação do
    direito do dependente a abatimento no IR".
================================================================================
CM$VER      4.11.04     02/12/2004
--------------------------------------------------------------------------------
- Transações / Registro de Alteração Funcional:
  * Correção do erro   >    '' is not a valid floating point value
================================================================================
CM$VER      4.11.03     22/11/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Salário-Educação:
  * Implementação do novo modelo do código de barras.
================================================================================
CM$VER      4.11.02     05/11/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios Especiais:
  * Implementação do novo layout do Seguro Desemprego.
================================================================================
CM$VER      4.11.01     15/10/2004
--------------------------------------------------------------------------------
- Meios Magnéticos / CAGED:
  * Correção na geração do arquivo de acerto.
- Consultas / Relatórios / Folha... / Relação de Transportes (Em Linha) e Relação de
  Transportes (Em Colunas):
  * Correção na geração dos lançamentos dos valores por pessoa na Rubrica especificada.
- Cadastro de Formas de Cálculo:
  * No Botão Campos e Tabelas, Os campos são agora sempre exibidos pela descrição;
  * Foi corrigido o problema com as expressões Valor Máximo e Valor Mínimo.
================================================================================
CM$VER      4.11.00     01/10/2004
--------------------------------------------------------------------------------
- Cadastros / Pessoal / aba Opção de Cargo:
  * Foram inseridos campos para seleção do salário do cargo alternativo.
- Transações / Registro de Alteração Funcional / Opção de Cargo Alternativo:
  * Foram inseridos campos para seleção do salário do cargo alternativo.
- Consultas / Histórico de Rubricas:
  * Foi Implementada a opção para exibir o cargo básico ou o cargo alternativo.
- Consultas / Relatórios / Folha de Pagamento / Cadastrais / Pessoal:
  * Foi incluída a opção para exibir, ao invés do salário contratual, o salário
    alternativo de quem o tiver.
================================================================================
CM$VER      4.10.21     21/09/2004
--------------------------------------------------------------------------------
- Inclusão da possibilidade de exibir, na Referência de uma rubrica, o valor
  gerado para outra rubrica, com ação e reflexo nas seguintes telas:
  * Cadastros / Rubricas Padrão CLT - Inserir:
    > 99xxx Referência com Valor da Rubrica 'yyyyy'
        onde 001 <= xxx <= 999
        e    yyyyy é o "Seu Código" da rubrica cujo valor se deseja usar como
             Referência de outra(s). Ele tem que estar entre aspas simples.
  * Cadastros / Rubricas Salariais:
    > Parametrizar a caixa "Rubrica Padrão CLT Correspondente" com essa(s) acima,
      conforme a informação desejada para constar no campo "Referência" da rubrica.
  * Telas e Relatórios diversos:
    > Após a geração de uma folha em que constem as rubricas assim parametrizadas,
      o campo "Referência" exibirá os respectivos valores das rubricas de "origem".
  * Exemplo: a rubrica SALARIO tem o "Seu Código" igual a 0001 e se deseja que o
    valor do salário apareça no campo "Referência" da rubrica CONTRIBUIÇÃO ABCDE.
    > Criar a rubrica CLT -> 99001 Referência com Valor da Rubrica '0001'
    > Parametrizar essa CLT na caixa "Rubrica Padrão CLT Correspondente" da
      rubrica CONTRIBUIÇÃO ABCDE.
  * Condição essencial: a rubrica de "origem" tem que ser gerada antes daquela(s)
    que irá(ão) receber seu valor como Referência.
- Alteração no tratamento da Rubrica CLT 90015 (Ref. p/ Avos Ferias Proporc.)
  * Caso a rubrica de Aviso Previo Indenizado esteja parametrizada com a 
    CLT 43691, e ela for gerada antes da rubrica que estiver com a CLT 90015,
    então esta última acresce um avo à contagem de avos na Referência.
- Consultas / Relatórios / Folha... / Folha de Frequência (Horário Escala):
  * Correção no erro ao gerar o relatório.
================================================================================
CM$VER      4.10.20     17/09/2004
--------------------------------------------------------------------------------
- Alteração da possibilidade de exibir avos (13º e Férias) na Referência,
  com ação e reflexo nas seguintes telas:
- Cadastros / Rubricas Padrão CLT - Inserir:
  * 90013 Referência Avos 13º
  * 90014 Referência Avos Férias Integrais
  * 90015 Referência Avos Férias Proporcionais  (esta foi acrescentada)
- Cadastros / Rubricas Salariais:
  * Parametrizar a caixa "Rubrica Padrão CLT Correspondente" com essas acima,
    conforme a informação desejada para constar no campo "Referência" da rubrica.
- Telas e Relatórios diversos:
  * Após a geração de uma folha em que constem as rubricas assim parametrizadas,
    o campo "Referência" exibirá os respectivos avos, seguidos de "/12".
================================================================================
CM$VER      4.10.19     14/09/2004
--------------------------------------------------------------------------------
- Transações / Horas Extras e Atrasos:
  * Na opção para destacar o Adicional Noturno trabalhado em dia de
    descanso daquele ocorrido em dia normal de trabalho, foi feita a
    alteração para tratar a virada de um dia de descanso para um dia de trabalho.
================================================================================
CM$VER      4.10.18     02/09/2004
--------------------------------------------------------------------------------
- Transações / Horas Extras e Atrasos:
  * Foi incluída a opção para destacar o Adicional Noturno trabalhado em dia de
     descanso daquele ocorrido em dia normal de trabalho.
================================================================================
CM$VER      4.10.17     25/08/2004
--------------------------------------------------------------------------------
- Implementação da possibilidade de exibir avos (13º e Férias) na Referência,
  com ação e reflexo nas seguintes telas:
- Cadastros / Rubricas Padrão CLT - Inserir:
  * 90013 Referência Avos 13º
  * 90014 Referência Avos Férias
- Cadastros / Rubricas Salariais:
  * Parametrizar a caixa "Rubrica Padrão CLT Correspondente" com essas acima,
    conforme a informação desejada para constar no campo "Referência" da rubrica.
- Telas e Relatórios diversos:
  * Após a geração de uma folha em que constem as rubricas assim parametrizadas,
    o campo "Referência" exibirá os respectivos avos.
================================================================================
CM$VER      4.10.16     20/08/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Operacionais / Folha de Frequência I:
  * Para estagiários, agora é impressa sem a caixa relativa a férias, e com espaço
    para a assinatura do Orientador do estágio.
- Consultas / Relatórios / Folha... / Operacionais / GRCS:
  * Foi introduzida a opção para emitir para mais de um sindicato;
  * Foi acrescentada a opção de selecionar os Tipos de Contrato a considerar.
================================================================================
CM$VER      4.10.15     17/08/2004
--------------------------------------------------------------------------------
- Cadastros / Pessoal / Rotina de Integração com Admin. Previdenciária:
  * Correção da gravação dos registros de Evolução Funcional em empresas do
    ramo Previdenciário, na inclusão ou alteração de uma Pessoa.
  * Inclusão da gravação dos registros de Dependente em empresas do
    ramo Previdenciário, na inclusão ou alteração de uma Pessoa.
- Transações / Contabilização/Contas a Pagar da Folha:
  * Alteração da funcionalidade de gerar uma AP para o Favorecido cadastrado
    quando há Portador-Forma Padrão (estava gerando em nome do Banco).
================================================================================
CM$VER      4.10.14     27/07/2004
--------------------------------------------------------------------------------
- Aturalização do CAGED para o novo Layout.
================================================================================
CM$VER      4.10.13     22/07/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Relação de Transportes (Em Colunas):
  * Correção no cálculo do número total;
  * Correção na numeração das páginas;
  * Correção na ordenação das pessoas.
================================================================================
CM$VER      4.10.12     21/07/2004
--------------------------------------------------------------------------------
- Transações / Rescisão / Cálcular:
  * O campo "Procura Rubricas pelo Código" que é visualizado na tela de Seleção de
     Rubricas passa a fazer a seleção destas pelo número SEU CÓDIGO ao
     invés do CÓDIGO INTERNO.
- Transações / GFIP Magnético:
  * Correção do erro "00/25/50 is not a valid date".
================================================================================
CM$VER      4.10.11     12/07/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / ... / Cadastrais / DCT
  * Corrigido o Número no endereço do empregado
================================================================================
CM$VER      4.10.10     30/06/2004
--------------------------------------------------------------------------------
- Transações / Rescisão:
  * Incluída a possibilidade de gravar um processo no RAD ao alterar uma pessoa.
================================================================================
CM$VER      4.10.09     28/06/2004
--------------------------------------------------------------------------------
- Transações / Reajuste Salarial:
  * Implementada a possibilidade de fazer o reajuste de pessoas demitidas.
================================================================================
CM$VER      4.10.08     25/06/2004
--------------------------------------------------------------------------------
- Trasações / Rescisão / Calcular:
  * Inclusão da opção para indicar os Tipos de Contrato de pessoas a processar
    quando marcada a opção para cálculo de pessoas em um período;
  * Inclusão da opção "Usar como Data de Pagamento" que permite ao usuário
    informar qual data utilizar como Data de Pagamento da Rescisão;
  * O campo que continha a Data de Pagamento da AP/Arquivo de Pagamento não se
    encontra mais na tela de parâmetros "Contas a Pagar / Pagamento Eletrônico".
    A mesma informação será dada pela opção descrita acima.
================================================================================
CM$VER      4.10.07     24/06/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Relação de Transportes (Em Linha) e Relação de
  Transportes (Em Colunas):
  * Inclusão do mês e ano de referência com que será gravado o Lançamento da Rubrica
    indicada na tela. Esta opção será visualizada quando for marcada a opção
    "Grava Rubrica".
================================================================================
CM$VER      4.10.06     23/06/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH... / Emissão de Crachá:
  * Correção na alteração do Layout.
================================================================================
CM$VER      4.10.05     17/06/2004
--------------------------------------------------------------------------------
- Transações / Férias:
  * Inclusão da possibilidade de gerar e alterar um
    processo RAD de férias ainda não processadas.
- Transações / Geração da Folha:
  * Mês e Ano de Referência passa a ser fixo.
================================================================================
CM$VER      4.10.04     14/06/2004
--------------------------------------------------------------------------------
- Cadastros / Pessoal:
  * O valor padrão na inclusão de uma pessoa para o campo Base Salarial
    passa a ser "Mês";
  * Correção da gravação dos registros de Participante em empresas do
    ramo Previdenciário na inclusão de uma Pessoa.
- Transações / Reajuste Salarial:
  * Correção na geração dos aumentos quando existia ao menos uma pessoa
    que estivesse com o salário zerado.
- Transações / Contabilização/Contas a Pagar da Folha:
  * Implementada a funcionalidade de gerar uma AP para o Favorecido
    quando não há Portador-Forma Padrão cadastrado, mas se encontra
    na lista dos Portadores-Forma por Banco.
- Cadastros / Tabelas Auxiliares / Fundo Prev. e de Assist. Social (FPAS):
  * Na busca, foi incluída a opção de pesquisar a parte inicial da descrição.
- Transações / Lançamento de Rubricas Salariais / Por Rubrica:
  * Foi incluída a opção para filtrar os empregados por sua Situação Funcional.
================================================================================
CM$VER      4.10.03     20/05/2004
--------------------------------------------------------------------------------
- Transações / Reajuste Salarial:
  * Para o Percentual de Aumento Único não é mas necessário que somente um dos valores sejam
    informados. Ex: O usuário pode agora fazer um aumento de 20% junto junto com a especificação
    de um piso de R$600,00;
  * Correção do problema que fazia com que fosse obrigado a pressionar duas vezes o botão OK após
    a digitar algum valor de faixa;
  * Correção da efetivação de Aumentos Salariais quando era utilizada a opção percentual por faixa.
    Era gerado um Histórico de Evolução Funcional mesmo para quem não teve aumento.
- Transações / Geração da Folha, Rescisão:
  * Inclusão da opção que permite fazer a geração do LOG de execução do processo.
================================================================================
CM$VER      4.10.02     18/05/2004
--------------------------------------------------------------------------------
- Cadastros / Tabelas Auxiliares / Tabelas REGRA/Forma de Cálculo / Formas de Cálculo:
  * O campo Grupo passa a se chamar Tipo.
- Inclusão do relatório Cadastro de Formas de Cálculo que
  se encontra em Consultas / Relatórios / Folha... / Cadastrais.
================================================================================
CM$VER      4.10.01     10/05/2004
--------------------------------------------------------------------------------
- Cadastros / Integração Contábil / Parametrização / Contas a Pagar:
  * Ao inserir ou alterar o Tipo de Desembolso, o sistema agora só exibe os ativos.
- Transações / Rescisão:
  * A tela agora filtra os empregados da empresa proprietária que está "logada".
- Consultas / Relatórios / Folha de Pagamento / (diversos):
  * A escolha de um único estabelecimento foi substituída pela escolha de múltiplos
    estabelecimentos da empresa proprietária que está "logada". Mesmo que esta tenha
    apenas um estabelecimento, este já vem marcado na abertura da tela, facilitando
    a operação ao usuário.
- Consultas / Relatórios Especiais / (todos):
  * A escolha de um único estabelecimento foi substituída pela escolha de múltiplos
    estabelecimentos da empresa proprietária que está "logada". Mesmo que esta tenha
    apenas um estabelecimento, este já vem marcado na abertura da tela, facilitando
    a operação ao usuário.
================================================================================
CM$VER      4.10.00     30/04/2004
--------------------------------------------------------------------------------
- Horas Trabalhadas em Outro Centro de Custo:
  * Possibilidade de informar que as horas são permanentes e/ou que a dedicação
  ao outro Centro de Custo é integral.
- Transações / Contabilização/Contas a Pagar da Folha:
  * Tratamento da situação acima mensionada.
================================================================================
CM$VER      4.09.23     27/04/2004
--------------------------------------------------------------------------------
- Cadastros / Tabelas Auxiliares / ... / Formas de Cálculo:
  * Correção na Função TABLONGA.
================================================================================
CM$VER      4.09.22     26/04/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha ... / GRCS:
  * Correção na contagem dos Empregados que contribuíram para o Sindicato.
================================================================================
CM$VER      4.09.21     19/04/2004
--------------------------------------------------------------------------------
- Transações / Férias:
  * Implementada possibilidade de indicar que a pessoa selecionada terá
  Adiantamento de 13º Salário.
- Transações / Rescisão Contratual / Opções para o Cálculo e Geração da Rescisão:
  * Inclusão da opção Processar Lançamentos Predivenciários que somente é visualizada
  em empresas do ramo Previdenciário.
- Horas Trabalhadas em Outro Centro de Custo:
  * Possibilidade de informar que o Centro de Custo é de outra Empresa Proprietária.
- Contabilização / Contas a Pagar da Folha de Pagamento:
  * Implementação da possibilidade da geração de Planilhas Contábeis para
  mais de uma Empresa Proprietária.
================================================================================
CM$VER      4.09.20     15/04/2004
--------------------------------------------------------------------------------
- Transações / Lançamento de Histórico de Rubricas / Exclusão Global:
  * Incluída a opção da desfazer os lançamentos, permitindo que a Folha Final seja corretamente
  reprocessada.
  OBS IMPORTANTE: Esta funcionalidade somente terá efeito para as Gerações de Folha
  e de Rescisão feitas com versões a partir desta.
================================================================================
CM$VER      4.09.19     14/04/2004
--------------------------------------------------------------------------------
- Várias telas seletivas onde consta a caixa "Máscara do Centro de Custo":
  * A busca passa a ser pela descrição;
  * A especificação de uma máscara (usando asteriscos como coringas) ficou facilitada,
    bastando escrever diretamente no campo, sem que a lista interfira.
- Consultas / Relatórios / Folha ... / Relação do Recolhimento da
  Contribuição Sindical:
  * Inclusão da seleção dos Estabelecimentos.
- Consultas / Relatórios / Folha de Pagamento / Operacionais /
  Folha de Empregados por Rubrica:
  * Foi Incluída a opção "Agrupar por Programa", visível apenas
    para empresas do ramo Previdenciário.
- Cadastros / Rubricas Salariais:
  * Foi aberto o campo "Fonte Pagadora", visível apenas para
    empresas do ramo Previdenciário, cujO conteúdo é:
      FUNDAÇÃO = 0
      INSS     = 2
      PATROCINADORA = 1
- Consultas / Relatórios / Folha de Pagamento / Cadastrais /
  Relação de Dependentes:
  * Foi acrescentada a Data de Nascimento do Titular aos campos
    disponíveis neste relatório, permitindo que o usuário altere
    seu desenho, colocando esta informação onde melhor lhe aprouver.
- Cadastros / Tabelas Auxiliares / Tabelas de REGRA ... /
  Tabela Genérica:
  * Foi incluído um botão para exclusão de todas as linhas
    cadastradas.
- Consultas / Relatórios / Folha de Pagamento / Operacionais /
  Recibo-Aviso de Férias e TRCT:
  * Em ambos, o sistema passa a considerar, para efeito de Maior
    Remuneração, as rubricas cuja "CLT" seja, indistintamente,
    63012 ou 90007.
================================================================================
CM$VER      4.09.18     06/04/2004
--------------------------------------------------------------------------------
- Cadastros / Pessoal:
  * Inclusão do campo Marca Ponto na aba Situação Funcional, grupo Identificação.
================================================================================
CM$VER      4.09.17     31/03/2004
--------------------------------------------------------------------------------
- Cadastros / Pessoal:
  * Apartir de agora, a verificação se a matrícula digitada já exite
  no cadastro abrange somente as matrículas da mesma empresa.
- Consultas / Relatórios Especiais / Ficha de Registro de Empregados:
  * Acerto na seleção das informações das pessoas indicadas no
  momento da impressão da Ficha.
================================================================================
CM$VER      4.09.16     30/03/2004
--------------------------------------------------------------------------------
ModFol:
- cadastros / Tabelas Auxiliares / ... / Dicionário de Dados:
  * Implementada a possibilidade de se digitar um Arquivo de Dados
  e Campo do Arquivo de Dados;
  * Correção na indicação do Tipo "Obrigatório". Este sempre era
  marcado na inclusão ou alteração de um campo mesmo que o usuário
  não o fizesse.
- Cadastros / Tabelas Auxiliares / ... / Formas de Cálculo:
  * Inclusão da Função VALORRUBRICA que se localiza no grupo
  Histórico de Rubricas sob o título Valor da Rubrica nesta Folha.
================================================================================
CM$VER      4.09.15     25/03/2004
--------------------------------------------------------------------------------
- Cadastros / Horários de Trabalhos / Tabela de Horários:
  * Acerto na inserção de um horário do tipo escala. O que acontecia era que o botão
  de OK não gravava a inserção do mesmo nesta situação.
================================================================================
CM$VER      4.09.14     19/03/2004
--------------------------------------------------------------------------------
- Transações / Férias:
  * Acerto na ordem de tabulação dos campos de edição.
- Cadastros / Tabelas Auxiliares / Tabelas REGRA/Formas de Cálculo / Forma de Cálculo:
  * Acrescentado o botão "Procurar por Expressão" que permite ao usuário fazer uma
  procura das Formas de Cálculo que contenham determinado elemento dentro da expressão.
  Este elemento pode ser um campo, código de Rubrica, Tabela Genérica, etc.
- Cadastros / Tabelas Auxiliares / Tabelas REGRA/Formas de Cálculo / Tabela Genérica:
  * Foram retiradas as Abas: Fórmulas e Regras
  * Foram acrescentadas as Abas: Formas de Cálculo e Rubricas. Estas listam todas as
  Formas de Cálculo que usam a Tabela Genérica em questão e todas as Rubricas que
  possuem estas Formas de Cálculo.
- Consultas / Relatórios Especiais / Seguro Desemprego:
  * Acrescentada a opção de impressão em formulário solto de acordo com o modelo do
  Ministério do Trabalho.
================================================================================
CM$VER      4.09.13     17/03/2004
--------------------------------------------------------------------------------
- Transações / Rescisão:
  * Implementação da gravação de Rubricas advindas dos sistemas previdenciários.
================================================================================
CM$VER      4.09.12     16/03/2004
--------------------------------------------------------------------------------
- Cadastros / Pessoal:
  * Acerto na rotina de integração com o sistema Previdenciário (somente válido para
  empresas deste ramo).
================================================================================
CM$VER      4.09.11     10/03/2004
--------------------------------------------------------------------------------
- Meios Magnéticos / GFIP:
  * Acerto na gravação da série e UF da CTPS.
- Consultas / Relatórios / Folha ... / GRFC:
  * Acerto no campo de Total a recolher (campo 34). O que ocorria era que em alguns
  casos o total era gerado com um centavo a menos do que deveria ter.
================================================================================
CM$VER      4.09.10     08/03/2004
--------------------------------------------------------------------------------
- Cadastros / Rubricas Salariais:
  * Acerto na exclusão de Rubricas.
- Relação do Borderô Bancário:
  * Pessoas que têm o valor ZERADO por algum motivo não são mais impressos.
================================================================================
CM$VER      4.09.09     20/02/2004
--------------------------------------------------------------------------------
- Transações / Lançamento de Histórico de Rubricas / Exclusão Global:
  * Acerto na seleção de pessoas.
================================================================================
CM$VER      4.09.08     18/02/2004
--------------------------------------------------------------------------------
- Meios Magnéticos / RAIS:
  * Acerto na geração do arquivo para pessoas demitidas dentro do ano-base.
================================================================================
CM$VER      4.09.07     16/02/2004
--------------------------------------------------------------------------------
- Meios Magnéticos / RAIS:
  * Acerto na geração do arquivo para mais de um estabelecimento.
================================================================================
CM$VER      4.09.06     03/02/2004
--------------------------------------------------------------------------------
- Meios Magnéticos / RAIS:
  * Atualização para o modelo RAIS 2003.
================================================================================
CM$VER      4.09.05     29/01/2004
--------------------------------------------------------------------------------
- Transações / Rescisão:
  * O envio de mensagem de correio à pessoa demitida passou a ser definido por
     opção na tela.
================================================================================
CM$VER      4.09.04     23/01/2004
--------------------------------------------------------------------------------
- TRCT:
  * Inclusão da opção para impressão dos totais em todas as folhas quando houver mais
  de uma por pessoa.
================================================================================
CM$VER      4.09.03     08/01/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Cadastrais / Rubricas Salarais:
  * Correção do erro: "Não foi possível abrir a Fonte de Dados".
================================================================================
CM$VER      4.09.02     07/01/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Operacionais / Folha de Frequência I e II:
  * Quando concidir feriado com folga irá prevalecer a folga.
- Consultas / Relatórios / Folha... / Operacionais / Aviso de Férias:
  * Incluída a opção para a seleção das pessoas pela situação funcional.
================================================================================
CM$VER      4.09.01     08/12/2003
--------------------------------------------------------------------------------
- CAGED em Meio Magnético:
  * Acerto na indicação dos Deficientes Físicos.
================================================================================
CM$VER      4.09.00     02/12/2003
--------------------------------------------------------------------------------
Esta versão introduz o tratamento de um novo campo: Data de Pagamento.
- Transações / Lançamento do Histórico de Rubricas, Geração da Folha e Rescisão
  * Passou a gravar o campo Data de Pagamento:
      Lançamento do Histórico de Rubricas > informado na tela;
      Geração da Folha > considera a data informada em "Pagamento em";
      Rescisão > considera a data da homologação ou, se esta estiver em branco, 
                       a data do desligamento.
- Consultas / Relatórios Especiais / Demostrativo de Pagamento
  * Para os clientes cujo layout inclui a data de pagamento (crédito), passa agora a filtrar
     pela data que for especificada na tela.
- Consultas / Relatórios / Relação do Borderô Bancário
  * Passa agora a filtrar pela data que for especificada na tela como Data de Crédito.
- Meios Magnéticos / Arquivo de Pagamento
  * Passa agora a filtrar pela data que for especificada na tela como Data de Crédito.
================================================================================
CM$VER      4.08.16     14/11/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Gerenciais / Relação de Afastamentos:
  * Foram retirados os botões de Selecionar Todos e Inverter Seleção;
  * Alteração no Layout do relatório;
  * Agora basta que a Data de Afastamento ou a Data de Retorno estejam no
  período indicado e não força pelo menos a de Retorno.
================================================================================
CM$VER      4.08.15     10/11/2003
--------------------------------------------------------------------------------
- Relação do Salário de Contribuição ao INSS:
  * Alteração no critério de parametrização: A rubrica Salário Parte Fixa não é mais
  somada ao total do subrelatório Discriminição das Parcelas do Salário-Contribuição.
  Desta forma, ela deve ser incluída na seleção das Rubricas que compõem o Salário
  de Contribuição caso seja selecionada a opção "Composto pelas Rubricas Indicadas".
  Com isto, também, esta rubrica Salário Parte Fixa pode ser do tipo "Outros" como por
  exemplo: Salário Contratual ou equivalente.
================================================================================
CM$VER      4.08.14     06/11/2003
--------------------------------------------------------------------------------
- Transações / Registro de Alteração Funcional:
  * Foi criada a funcionalidade para transferir o histórico
    financeiro, com opção para transferir os lançamentos também,
    quando se transfere o empregado de uma empresa para outra
    (aplicável a clientes multi-empresa).
- Relatórios / Gerenciais / Relação de Rubricas Selecionadas:
  * Novas opções para ordem de impressão;
  * Opção de quebrar ou não página por centro de custo;
  * Opção de Intervalo (mês/ano de início e fim) para acumulação
    das rubricas, totalizando-as no período determinado;
  * Opção para emissão a partir da Prévia;
  * Acerto na contagem de admitidos no mês por Centro de Custo.
- Relatórios / Operacionais / Previsão de Férias:
  * Opção para os casos de férias "reduzidas" (Artigo 130A da CLT).
- Relatórios / Cadastrais / Etiquetas para Ponto:
  * Opção para colocar o mês de referência ou a CTPS.
================================================================================
CM$VER      4.08.13     30/10/2003
--------------------------------------------------------------------------------
- Sistema / Utilitários / Importação Direta de Dados:
  * Acerto na abertura de uma Configuração de Importação.
================================================================================
CM$VER      4.08.12     28/10/2003
--------------------------------------------------------------------------------
- Reajuste Salarial:
  * Acerto na gravação da identificação da Empresa e Estabelacimento da Pessoa
  no Registro de Alterações Funcionais.
================================================================================
CM$VER      4.08.11     21/10/2003
--------------------------------------------------------------------------------
- Geração da Folha:
  * Acerto na geração das datas de Emissão e Pagamento.
================================================================================
CM$VER      4.08.10     17/10/2003
--------------------------------------------------------------------------------
- Inclusão do Relatório Relatório de Afastamentos que se encontra em: Consultas /
  Relatórios / Cadastrais.
================================================================================
CM$VER      4.08.09     09/10/2003
--------------------------------------------------------------------------------
- Formas de Cálculo:
  * Acerto no método de cálculo da função DiasFeriasNoMes. Quando as férias
  passavam de um mês para o outro.
- Relação de Dependentes:
  * Acerto na seleção da faixa etária dos dependentes.
================================================================================
CM$VER      4.08.08     29/09/2003
--------------------------------------------------------------------------------
- Geração da Folha:
  * Correção da exclusão das Prévias Parciais em determinadas situações.
  (Quando era selecionado a opção "Tipo/Pessoa" e determinado(s) Tipo(s) de Contrato,
  todas as Prévias do Tipo de Folha escolhido eram excluídas).
================================================================================
CM$VER      4.08.07     26/09/2003
--------------------------------------------------------------------------------
- Cadastro de Tabela Longa:
  * Correção na inclusão de linhas.
================================================================================
CM$VER      4.08.06     19/09/2003
--------------------------------------------------------------------------------
- Tela de Geração da Folha:
  * Correção no erro que era apresentado ao gerar o Retroativo e para o caso em que
  a seleção para Rubricas Complementares era "Nenhuma".
================================================================================
CM$VER      4.08.05     16/09/2003
--------------------------------------------------------------------------------
- Geração da Folha:
  * Acerto na geração das Folhas Especiais.
- Ficha Funcional:
  * A caixa de seleção relaciona todas as pessoas e não somente as Ativas e Afastadas
  como era feito até então.
- Relatório dos Lançamentos de Rubricas Individuais:
  * Inclusão da totalização da quantidade de lançamentos por Rubrica.
================================================================================
CM$VER      4.08.04     12/09/2003
--------------------------------------------------------------------------------
- GRFC:
  * Impressão do valor "1" no campo 13 (Simples) ao invés
  de "NÃO" que até então era impresso.
- Listas de Nomes/Descrições com marcação do ítem selecionado:
  * Ao buscar um item da lista digitando-se letras no teclado,
  ele responde a uma sequência de caracteres, e não apenas ao
  primeiro, como era feito até então. Isto acontece desde que
  o usuário tecle-os com intervalo máximo de 0,45 segundos.
================================================================================
CM$VER      4.08.03     03/09/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Cadastrais / Rubricas Salariais:
  * Acrescentada uma opção para a impressão ou não das incidências
  em afastamentos das Rubricas.
================================================================================
CM$VER      4.08.02     25/08/2003
--------------------------------------------------------------------------------
- Cadastro de Horários de Trabalho:
  * Correção do erro ao inserir um horário Fixo na Semana.
  Aparecia a mensagem "A Qtde. de Horas da Escala deve ser preeenchida."
  e depois o erro "Cannot focus a disabled or invisible window".
- Cartas ou Comunicados:
  * Ajuste nas margens de impressão.
- Tela de Rescisão de Contrato:
  * Mudança no Layout da tela de seleção dos dados para a
  Autorizaçao de Pagamento / Arquivo de Pagamento Eletrônico;
  * Opções de seleção das Rubricas melhorada;
  * Gravação das Rubricas selecionadas por máquina.
================================================================================
CM$VER      4.08.01     20/08/2003
--------------------------------------------------------------------------------
- Contabilização / Contas a Pagar da Folha de Pagamento:
  * Mudança no Layout da Tela;
  * Inclusão do botão de Resultado que tem a finalidade de
  exibir a página que contém o LOG do Resultado da geração
  caso esta já tenha sido feita e não tenha saído da respectiva tela.
- Registro e Histórico de Antecipações do Décimo Terceiro Salário:
  * Acerto na geração do ano quando uma antecipação é inserida
  sendo esta a primeira da pessoa selecionada.
- Consultas / Relatórios / Folha... / Operacionais /
  Termo de Rescisão Contratual:
  * Acerto na impressão da UF da CTPS.
================================================================================
CM$VER      4.08.00     18/08/2003
--------------------------------------------------------------------------------
- Geração da Folha:
  * Alteração no Layout da Tela de Seleção dos Parâmetros para a geração do Arquivo
  de Pagamento Eletrônico / Autorização de Pagamento;
  * Reformulação da tela e do processo de cálculo;
  * Todos os empregados vêm marcados. Deve-se usar os procedimentos de marcar
     individualmente e inversão da seleção para seleções individuais;
  * Ao se alterar a marcação dos Tipos de Contrato, a exibição de pessoas será
  modificada de acordo, porém é necessário passar a outra divisória e então retornar
  à primeira.
================================================================================
CM$VER      4.07.10     15/08/2003
--------------------------------------------------------------------------------
- GFIP (Meio Magnético):
  * Acerto na geração para mais de um estabelecimento
  (sempre a primeira pessoa de cada estabelecimento não
  era incluída no arquivo).
================================================================================
CM$VER      4.07.09     14/08/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha... / Cadastrais / Pessoal:
  * Inclusão da coluna "Sit" que exibe a situação funcional do empregado, de forma
     abreviada (Ativ, Afas ou Desl);
  * A coluna "Data Dem." passa agora a ser "Data Dem.ou Afast.", de modo a exibir
     a Data de Desligamento ou de Afastamento, conforme o caso.
- Consultas / Relatórios / Folha... / Operacionais / Folha de Pagamento Normal:
  * Acerto no erro: "Parâmetro não implementado".
================================================================================
CM$VER      4.07.08     07/08/2003
--------------------------------------------------------------------------------
- Relação de Dependentes:
  * Acerto na ordenação que somente funcionava no caso de ser pelo Nome da Pessoa.
- Lançamento de Rubricas por Pessoa:
  * Inclusão do campo Situação na tela de seleção de Pessoas.
- Correção do seguinte erro na tela de Importação de Arquivos TXT:
  * Ao selecionar um Layout referente à Lançamentos Permanentes, marcar a opção
  "PERMANENTE: SIM" e na sequência mudar o Layout escolhido para um outro também
  referente à Lançamentos Permanentes, o campo Parcelas fica visível e a opção
  "Permanente" continua com "SIM". Ao importar o arquivo desta forma, ele na
  verdade não entrava como Permanente.
- Acerto na sequência de ordenação de vários relatórios.
================================================================================
CM$VER      4.07.07     01/08/2003
--------------------------------------------------------------------------------
- Transações / Registro de Alteração Funcional
  * Foi introduzida a possibilidade de efetuar transferências entre empresas.
    Para tanto, dentro da caixa "Lotação" foi incluído um botão (só visível para os
    usuários que são multi-empresa) cuja função é abrir uma tela para ser indicada a
    empresa destino da transferência. Deve-se ter em mente que, após realizar a
    transferência, o empregado não mais será acessado na empresa de origem.
================================================================================
CM$VER      4.07.06     31/07/2003
--------------------------------------------------------------------------------
- Relatórios / Vários
  * Os relatórios que buscam Cargo e Lotação no histórico (por opção na tela ou 
    implicitamente) passam agora a considerar também a Empresa, o que resolve 
    problemas de transferências entre empresas.
   (relembrando, são estes os relatórios:
  * Aviso de Férias;
  * Rubricas Selecionadas por Empregado;
  * Demonstratvo de Pagamento Especial;
  * Folha de Empregados por Rubrica;
  * Folha de Freqüência - I e II;
  * Folha de Pagamento Normal;
  * Recibo / Aviso de Férias;
  * Recibo de Pagamento;
  * Resumo da Folha de Pagamento;
  * Resumo de Folha Comparativo)
================================================================================
CM$VER      4.07.05     29/07/2003
--------------------------------------------------------------------------------
- Transações / Lançamentos de Rubricas por Rubrica:
  * A ordenação dos lançamentos pode agora ser alterada, pelo usuário, por:
    1. Ano/Mês descendente; Nome (como já era)
    2. Nome, Ano/Mês descendente
   Para tanto, deve-se clicar no título da coluna correspondente;
  * Foi acrescentado um botão com pequena lâmpada, que, quando clicado, exibe a 
     explicação para alterar a ordenação.
================================================================================
CM$VER      4.07.04     25/07/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios/ Folha de Pagamento / Gerenciais /
  Relação de Rubricas Selecionadas por Empregado:
  * Inclusão da opção para inverter o sinal normal de uma rubrica (para detalhes, clique
     o botão com a pequena lâmpada).
  * As pessoas só serão listadas, agora, se tiveram valores em pelo menos uma das colunas
     especificadas.
- Transações / Lançamento de Hsitórico de Rubricas / Exclusão Global
  * Foi feita uma correção para considerar adequadamente a situação de mais de um
     estabelecimento para a mesma empresa.
================================================================================
CM$VER      4.07.03     21/07/2003
--------------------------------------------------------------------------------
- Relatórios / Vários
  * A alteração nos relatórios que buscam Cargo e Lotação no histórico, de forma a
    corrigir uma duplicidade de informações que ocorria quando o empregado tinha duas
    alterações funcionais na mesma data, incluída na versão 4.07.02, introduziu um erro
    que agora está corrigido.
- Relatórios / Cadastrais / Ficha Funcional
  * Inclusão da opção para Avaliação Hay, disponível para as empresas que utilizam
     a Metodologia Hay em sua administração de Cargos e Salários.
================================================================================
CM$VER      4.07.02     18/07/2003
--------------------------------------------------------------------------------
- Geração e Rescisão
  * Devido a alguns problemas reportados nas novas telas (versões 4.07.00 e 4.07.01),
     retornou-se às telas anteriores, até que esses problemas possam ser sanados.
     Desta forma, o uso das versões acima citadas não é recomendado.
- Relatórios / Vários
  * Alteração nos relatórios que buscam Cargo e Lotação no histórico, de forma a
    corrigir uma duplicidade de informações que ocorria quando o empregado tinha duas
    alterações funcionais na mesma data.
  * Alteração no relatório Rubricas da Integração Contábil, de forma a corrigir uma
    duplicidade de informações que ocorria quando havia mais de um tipo de desembolso
    com o mesmo código.
================================================================================
CM$VER      4.07.01     14/07/2003
--------------------------------------------------------------------------------
- Transações / Geração da Folha:
  * Acerto da rotina de integração com Contas a Pagar.
  * Restrição identificada: não está habilitada a geração de Arquivo de Pagamento,
    simultaneamente com o processo de geração (pode ser feito sempre, e a qualquer
    momento, em Meios Magnéticos / Arquivo de Pagamento), porém a geração de APs,
   tanto individuais, quanto coletivas, está normal.
================================================================================
CM$VER      4.07.00     11/07/2003
--------------------------------------------------------------------------------
- Geração da Folha
  * Reformulação da tela e do processo de cálculo, com ganhos de tempo entre 15 e 50%.
  * Todos os empregados vêm marcados. Deve-se usar os procedimentos de marcar
     individualmente e inversão da seleção para seleções individuais.
  * Ao se alterar a marcação dos Tipos de Contrato, a exibição de pessoas será modificada
     de acordo, porém é necessário passar a outra divisória e então retornar à primeira.
- Rescisão
  * Reformulação da tela e do processo de cálculo, com ganhos de tempo entre 15 e 50%.
================================================================================
CM$VER      4.06.42     10/07/2003
--------------------------------------------------------------------------------
- Transações / Manutenção de Documentos (AP)
  * Correção na função de alteração, que estava indevidamente exigindo uma Conta 
     Contábil quando esta não existe.
================================================================================
CM$VER      4.06.41     09/07/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha ... / Gerenciais / Relação de Rubricas ...
  * Para as empresas que trabalham com a opção de "Dois Cargos", e para as pessoas 
     que possuem o segundo cargo (referido como Alternativo ou Função), este será
     exibido no relatório.
- Consultas / Relatórios / Folha ... / Gerenciais / Demonstrativo Especial ...
  * Para as empresas que trabalham com a opção de "Dois Cargos", e para as pessoas 
     que possuem o segundo cargo (referido como Alternativo ou Função), este será 
     exibido no relatório.
================================================================================
CM$VER      4.06.40     08/07/2003
--------------------------------------------------------------------------------
- Transações / Lançamento de Histórico de Rubricas / Exclusão Global:
  * Inclusão da opção para selecionar rubricas a eliminar.
- Consultas / Relatórios / Folha ... / Operacionais / Folhas de Frequência:
  * Inclusão da opção para selecionar cargos a serem impressos.
- Consultas / Relatórios / Folha ... / Gerenciais / Relatório Gerencial:
  * Acerto para o caso de códigos de rubricas (Seu Código) alfanuméricos.
- Cadastros / Pessoal:
  * A procura do empregado pelo nome voltou a trazer a opção "Não Sensível a Caixa",
     isto é, fica indiferente escrever em caixa alta ou baixa.
================================================================================
CM$VER      4.06.39     03/07/2003
--------------------------------------------------------------------------------
- Sistema / Configuração / Parâmetros
  * Inclusão da divisória "Interface Previdenciário", só visível para as empresas usuárias 
     do TotalPrev, onde se especifica o tratamento a ser dado a determinado tipo de 
     interface advindo do sistema de Administração Previdenciária.
- Consultas / Relatórios / Folha ... / Gerenciais / Relação de Rubricas ...
  * Caso sejam selecionados Descontos, o sistema faz agora a soma aritmética.
================================================================================
CM$VER      4.06.38     01/07/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios/ Folha de Pagamento / Gerenciais:
  * Correção do relatório Demonstratvo de Pagamento Especial, para habilitar o botão OK.
================================================================================
CM$VER      4.06.37     24/06/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios/ Folha de Pagamento / Gerenciais:
  * Inclusão do relatório Demonstratvo de Pagamento Especial, que permite ao usuário
     montar um contracheque especial, selecionando Rubricas, agrupando-as em categorias
     à sua escolha e totalizando seus valores em um período também por ele especificado.
- Relação de Rubricas Selecionadas por Empregado:
  * Inclusão da opção para Demonstrativo Hay, disponível para as empresas que utilizam
     a Metodologia Hay em sua administração de Cargos e Salários.
================================================================================
CM$VER      4.06.36     16/06/2003
--------------------------------------------------------------------------------
- Recibo / Aviso de Férias:
  * Acerto na impressão do mesmo quando no período selecionado alguma pessoa
  tinha mais de um gozo de férias.
- Cadastro de Pessoal:
  * O CBO do cargo que é visualizado refere-se agora ao CBO 2002.
================================================================================
CM$VER      4.06.35     10/06/2003
--------------------------------------------------------------------------------
- As seguintes telas somente irão mostrar as Pessoas da Empresa
  Proprietária logada:
  * Cadastro de Dias Extra de Trabalho por Pessoa;
  * Cadastro das Linhas de Transporte por Pessoa;
  * Cadastro de Dependentes;
  * Cadastro de Pessoal;
  * Registro e Histórico de Férias;
  * Registro e Histórico de Antecipações do Décimo Terceiro Salário;
  * Registro de Alteração Funcional;
  * Registro de Alteração da Situação Funcional;
  * Registro de Horas Trabalhadas em Outro Setor;
  * Registro de Horas Extras e Atrasos;
  * Lançamento Manual de Histórico de Rubricas;
  * Lançamento de Rubricas Salariais (Proventos e Descontos);
  * Rescisão de Contrato de Trabalho;
  * Consulta Histórico de Rubricas Salariais;
  * Cadastro do Histórico de Alterações Cadastrais;
  * Histórico da Evolução Funcional;
  * Histórico da Situação Funcional (Alterações Ocorridas na
  Situação do Empregado).
- Cadastro de Horários de Trabalho:
  * Não permite mais que a Quantidade de Horas da Escala seja
  gravada em branco.
================================================================================
CM$VER      4.06.34     06/06/2003
--------------------------------------------------------------------------------
- Os seguintes relatórios passam a trazer as informações de acordo
 com a lotação do empregado no mês/ano selecionado para sua emissão:
  * Aviso de Férias;
  * Rubricas Selecionadas por Empregado;
  * Folha de Empregados por Rubrica;
  * Folha de Freqüência - I e II;
  * Folha de Pagamento Normal;
  * Recibo / Aviso de Férias;
  * Recibo de Pagamento;
  * Resumo da Folha de Pagamento;
  * Resumo de Folha Comparativo.
- GPS:
  * Inclusão do mês de referência no histórico de impressões da GPS;
  * Atualização na gravação do histórico.
- Relatório de Rubricas de Integração:
  * As parametrizações selecionadas são referentes somente à Empresa Proprietária logada.
- GFIP:
  * Correção do erro no arquivo quando selecionado mais de um estabelecimento.
================================================================================
CM$VER      4.06.33     02/06/2003
--------------------------------------------------------------------------------
- Relação do Borderô Bancário:
  * Correção do subrelatório de Resumo por Banco. Este estava somando todos os
  valores de todas as Agências relacionadas para o Banco em uma Agência;
  * Inclusão da possibilidade de selecionar Demitidos.
- TRCT:
  * Código de afastamento será completado com um zero a esquerda caso este seja
  menor que 10. Ex: 1 -> 01.
- GRFC:
  * Lista de Responsáveis abrange todas as empresas.
- GFIP em Meio Magnético:
  * Lista de Responsáveis abrange todas as empresas.
- GRCS:
  * Mudança no Layout da tela de parâmetros;
  * Inclusão da lista de Estabelecimentos.
- GPS:
  * O botão de visualização do Histórico irá mostrar as GPSs dos Estabelecimento
  selecionado. Caso nenhum tenha sido selecionado todo o histórico será exibido.
================================================================================
CM$VER      4.06.32     21/05/2003
--------------------------------------------------------------------------------
- Relatório de Transportes (Em Colunas):
  * Inclusão do Subrelatório de Resumo de Transportes.
================================================================================
CM$VER      4.06.31     20/05/2003
--------------------------------------------------------------------------------
- Geração da Rescisão:
  * Inclusão da possibilidade selecionar as Rubricas que serão geradas.
================================================================================
CM$VER      4.06.30     16/05/2003
--------------------------------------------------------------------------------
- Cadastro de Integração Contábil:
  * Foi habilitada a seleção de Tipos de Desembolso apenas para os Analíticos.
================================================================================
CM$VER      4.06.29     14/05/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / ... / Recibo de Pagamento:
  * Incluídos campos com os valores das rubricas que tenham a 
    Rubrica Padrão CLT igual a 90010 (VALORMARGEM1) e 
    90012 (VALORMARGEM2).
    o usuário deve alterar o relatório, incluindo esses dois campos
    onde melhor lhe aprouver e com o título desejado.
 
- Seleção de Pessoas (consultas e relatórios):
  * Na opção "Por Cargo, Lotação e Sindicato", foi reativada a 
    possibilidade de selecionar mais de um Centro de Custo, através do
    conceito de "máscara" do código hierárquico.
    (Exemplo: 01******** traz todos os c.custo iniciados por 01)
 
- Cadastro de Pessoal:
  * Acerto na visualização dos dados na Pasta Estrangeiros.
- Cadastro de Integração Contábil:
  * Inclusão do Código e Status na tela de procura do Centro de Responsabilidade;
  * Inclusão da possibilidade de se ter uma parametrização por Empresa.
- Relatório Folha de Frequência:
  * Acerto na impressão das pessoas.
- Ficha do Salário Família:
  * Acerto na impressão do número da CTPS.
- Consulta Histórico de Rubricas Salariais:
  * Inclusão do Centro de Custo da Pessoa.
- TRCT:
  * Quando existir mais Rubricas que a página pode suportar por Pessoa
    (número de Rubricas for maior que 23), será gerada uma nova página.
    Somente a última página por Pessoa terá os totais informados,
    as demais terão a palavra CONTINUA no lugar destes;
  * Acerto na impressão do Código de Saque FGTS.
================================================================================
CM$VER      4.06.28     30/04/2003
--------------------------------------------------------------------------------
- Tela de Parâmetros do Sistema:
  * Inclusão do Motivo Folha de Rescisão.
- TRCT:
  * Motivo padrão será o selecionado na opção Motivo Folha de
  Rescisão na tela de Parâmetros do Sistema.
- Rescisão:
  * Motivo padrão será o selecionado na opção Motivo Folha de
  Rescisão na tela de Parâmetros do Sistema.
================================================================================
CM$VER      4.06.27     17/04/2003
--------------------------------------------------------------------------------
- Relatório Alterações Funcionais:
  * Retirado o campo de seleção dos Tipos de Papel.
- Demonstrativo de Pagamento:
  * Mudança no Layout da Tela.
- Cadastro de Tabelas Genéricas:
  * Acrescentado um atalho à tela principal;
  * Acerto no erro ao clicar no botão Cancelar.
================================================================================
CM$VER      4.06.26     28/03/2003
--------------------------------------------------------------------------------
- Cadastro de Rubricas Salariais:
  * Inclusão dos Campos: Código Interno e Seu Código.
- Lançamento de Histórico de Rubricas:
  * Quando um lançamento é alterado, somente o campo de valor
  fica habilitado.
- Manutenção de Documentos (AP):
  * Mudança no Layout da Tela.
- Cadastro de Cargos:
  * Agora é permitida a seleção dos CBOs (1994 e 2002) a partir
  de uma tela de seleção Padrão.
- GFIP em Meio Magnético:
  * Correção nas restrições para a seleção da CTPS.
================================================================================
CM$VER      4.06.25     19/03/2003
--------------------------------------------------------------------------------
- Ficha Financeira por Funcionário:
  * A Descrição das Rubricas foi mudada para a pegar da associação
  destas com a Empresa Proprietária logada.
- Relação do Borderô Bancário:
  * Exclusão da tela de parâmetros os campos: Tipo de Papel e Número
  de Contas (estes são selecionados automaticamente).
  * Agora as contas são selecionadas de acordo com a parametrização
  na tela Portador Forma por
  Banco que se encontra no menu Cadastros / Tabelas Auxiliares.
- DCT:
  * Correção na impressão da RG. Esta tinha seus dígitos cortados.
- Termo de Rescisão Contratual:
  * Acerto no campo Código de Afastamento para que seja impresso o
  Código FGTS do Motivo de Desligamento selecionado para a Pessoa.
================================================================================
CM$VER      4.06.24     12/03/2003
--------------------------------------------------------------------------------
- Cadastro de Pessoal:
  * Acerto na seleção dos estados;
  * Melhoria na performance no momento da abertura da tela.
================================================================================
CM$VER      4.06.23     10/03/2003
--------------------------------------------------------------------------------
- Telas de Seleção de Pessoal:
  * Acrescentado o filtro pela Empresa Proprietária.
- GRFC:
  * Inclusão dos filtros para a Empresa Proprietária atualmente logada.
- Cadastro de Portador Forma por Banco:
  * Acerto na exclusão de um Banco.
- Execução de Regras/Formas de Cálculo:
  * Acerto nas funções: Quantidade de Dependentes, Tabela Genérica.
- CAGED em Meio Magnético:
  * Correção na Geração.
- Cadastro de Tabelas Genéricas:
  * Mudança nas mensagens que são visualizadas no momento da gravação de uma tabela;
  * O botão Sair da tela de Exportação foi substituído pelo Cancelar tendo em vista
  a padronização das telas do sistema.
- GFIP em Meio Magnético:
  * Implementação de uma barra de progressos mais informativa. Indica o processo
  atual, a hora de início e o tempo decorrido desde o início.
================================================================================
CM$VER      4.06.22     25/02/2003
--------------------------------------------------------------------------------
- RAIS em meio Magnético:
  * Agora é usada a média salarial para a verificação do número de empregados
  que participam do PAT e ganham acima e abaixo de cinco salários mínimos;
  * Correção na seleção do Grau de instrução;
  * Agora cada valor (remunerações e 13º salário) será zerado se o sistema
  selecionar os dados do histórico e encontrar um valor menor que zero.
================================================================================
CM$VER      4.06.21     21/02/2003
--------------------------------------------------------------------------------
- GRFC:
  * Incluída a Data de Emissão.
- Horas Extra e Atrasos:
  * Correção na seleção de uma pessoa com horário do tipo escala rotativa.
- Recibo de Pagamento:
  * Acrescentada uma opção para a impressão de um do dois Recibos por página.
- TRCT:
  * Liberada a impressão de valores acima de 100,00 no campo Pensão Alimentícia.
  Nestes casos, cabe ao usuário definir se este se trata de um valor ou percentual.
- Cadastro de Empregados:
  * Implementação da gravação do histórico no momento da inserção de uma pessoa.
================================================================================
CM$VER      4.06.20     10/02/2003
--------------------------------------------------------------------------------
- GRFC:
  * Criado o campo para o Índice FGTS para Recolhimento em Atraso.
- CAGED:
  * Acerto na seleção do Código de Admissão para o caso do Empregado tiver
  sido admitido e demitido no mês de competência.
================================================================================
CM$VER      4.06.19     05/02/2003
--------------------------------------------------------------------------------
- Cadastro de Formas de Cálculo:
  * Maior rapidez na abertura da tela;
  * Modificações na tela de Execução de Regras ou Formas de Cálculo:
    - Mudança no Layout da tela;
    - Inclusão do botão que visualiza todos os passos executados;
    - Possibilidade de se parar uma execução Passo a Passo.
================================================================================
CM$VER      4.06.18     04/02/2003
--------------------------------------------------------------------------------
- Cadastro de Estabelecimentos:
  * Ajuste no posicionamento dos Combos referentes à GPS (pasta Outras Guias/GPS).
================================================================================
CM$VER      4.06.17     04/02/2003
--------------------------------------------------------------------------------
- Cadastro de Motivos e Ações:
  * Possibilidade de procurar pelo Código RAIS e FGTS.
- Cadastro de Funcionários:
  * Implementação da Verificação de matrícula já existente no momento da saída deste campo.
- Relatório Folha Normal de Empregados:
  * Inclusão da opção de ordenação das Rubricas por Código ou Nome.
- Cadastro de Pessoal:
  * Inclusão das autorizações para os campos abaixo indicados com seus respectivos nomes
  na Autorização:
  1) Qtde.Dependentes/I.Renda  --> HABILITAR QTDE.DEPEND/I.RENDA
  2) Qtde.Dependentes/Sal.Fam. --> HABILITAR QTDE.DEPEND/SALFAM
  3) Qtde.Dependentes/Total    --> HABILITAR QTDE.DEPEND/TOTAL
- Cadastro de Rubricas Salariais:
  * Inclusão do Botão para cópia de uma Rubrica. A rubrica copiada terá o nome na forma:
  Cópia - <<Nome da Rubrica>> - <<Número da Cópia>> onde Número da Cópia é um número sequencial
  dado o número de cópias feitas até agora sem que tenham seu nome trocado.
  * Inclusão de todos os Códigos de Regra possíveis na seleção de uma Rubrica.
- Geração da Folha:
  * Ao gerar uma Folha de Férias, é possível selecionar o período do início de gozo.
================================================================================
CM$VER      4.06.16     21/01/2003
--------------------------------------------------------------------------------
- DCT:
  * Acerto no campo CEP do empregado (estava imprimindo o CEP do Estabelecimento).
- TRCT:
  * Acerto na formatação da CTPS.
================================================================================
CM$VER      4.06.15     16/01/2003
--------------------------------------------------------------------------------
- Relação do Borderô Bancário:
  * Relatório passa a ser ordenado por Número do Banco;
  * Correção na ordem de Impressão dos Números das Contas digitados.
================================================================================
CM$VER      4.06.14     13/01/2003
--------------------------------------------------------------------------------
- Geração da Folha:
  * Agora passa a selecionar somente os dados da Empresa atualmente logada.
================================================================================
CM$VER      4.06.13     09/01/2003
--------------------------------------------------------------------------------
- GPS:
  * Acerto na seleção das Rubricas para o Valor da Parte Empresa;
- DCT:
  * Solucionado o problema na impressão do RG;
  * Acerto na habilitação do botão Ok (só era habilitado quando selecionado todas as pessoas).
- GRFC:
  * Incluída a seleção de pessoas com rescisão por Falecimento (código "S" no SEFIP);
  * Acerto na apuração dos valores das Rubricas selecionadas. Agora quando a Rubrica
  for Desconto esta será somada, caso contrário, será somada seja ela provento ou de
  apoio (outros).
- Recibo / Aviso de Férias:
  * Acerto no aparecimento dos campos no momento da alteração do Layout do mesmo.
- Cadastro de Pessoal:
  * Acerto na gravação do histórico de outros empregos;
  * Possibilidade de alimentar uma ocorrência no módulo de Medicina do Trabalho quando
  ocorre um afastamento.
- GFIP Magnético:
  * Acerto na apuração do Valor da Base de Cálculo 13º Salário Previdência Social
  (para o mês do movimento e o da GPS do 13º).
================================================================================
CM$VER      4.06.12     26/12/2002
--------------------------------------------------------------------------------
- Implementação no Novo modelo da TRCT.
- Acerto na impressão das Cartas e Comunicados.
- Consultas / Relatórios / Cadastrias / DCT:
  * Inclusão da Seleção de Empregados pelo Tipo de Contrato destes.
- Inclusão do Relatório: Relação de Rubricas Selecionadas por Empregado que se
  encontra em Consultas / Relatórios / Gerenciais.
- Relatório Gerencial:
  * Mudança de sua localização para o menu Consultas / Relatórios / Gerenciais.
================================================================================
CM$VER      4.06.11     06/12/2002
--------------------------------------------------------------------------------
- Cadastro dos Documentos Oficiais:
  * Correção na verificação de documento já selecionado.
- Inclusão do Registro de Horas Trabalhadas em Outro Setor, com opção para ratear os
  valores nas integrações com a Contabilidade e Contas a Pagar.
- Forma de Cálculo (função AVOS13):
  * Revisado o critério de contagem dos avos para 13º salário nos casos de admissão no
  ano em curso e desligamento.
================================================================================
CM$VER      4.06.10     03/12/2002
--------------------------------------------------------------------------------
- Geração da Folha:
  * Correção do Número de Ocorrências em certas ocasiões.
================================================================================
CM$VER      4.06.09     26/11/2002
--------------------------------------------------------------------------------
- Recibo de Pagamento:
  * Correção na impressão do Mês de Referência.
- GFIP Magnético:
  * Acrescentada a opção Utilizar como Documento Identificador (CPF do Responsável ou
  CNPJ da Empresa).
================================================================================
CM$VER      4.06.08     22/11/2002
--------------------------------------------------------------------------------
- Foi implementado o campo (virtual) TIPOFOLHA, para uso pelas Regras / Formas de
  Cálculo.  Para que ele conste na lista de campos disponíveis, deve ser incluído no 
  Dicionário de Dados:
  * Código Resumido = TIPOFOLHA
  * Descrição = Código do Tipo de Folha sendo executado
  * Grupo de Dados = Empregados
  * Arquivo de Dados = DUAL
  * Nome do Campo = TIPOFOLHA
  * Virtual
  * Numérico
================================================================================
CM$VER      4.06.07     07/11/2002
--------------------------------------------------------------------------------
- Relatório Folha de Pagamento Normal:
  * Acrescentada mais duas opções de ordenação (Nome do Centro de Custo, Nome e
  Nome do Centro de Custo, Matrícula).
================================================================================
CM$VER      4.06.06     06/11/2002
--------------------------------------------------------------------------------
- GFIP em Meio Magnético:
  * Acerto no Registro 30, sequência 22 (Base de Cálculo
  13º Salário Previdência Social) que estava fazendo com que
  valores fracionários fossem convertidos para menos.
  Ex: VALOR CORRETO: 876,70
      VALOR LANÇADO:  87,67
================================================================================
CM$VER      4.06.05     01/11/2002
--------------------------------------------------------------------------------
- Reajuste Salarial:
  * Unificação das Telas (até então existia uma tela para o Usuário indicar os valores das
  Faixas e outra para a seleção das Pessoas);
  * A pergunta: "Deseja imprimir Etiquetas de Atualização?" foi incluída como uma opção
  na Tela de Efetivação;
  * Os botões de Configuração e Restauração do Layout da Etiqueta de Atualização foram
  retirados da Tela de Efetivação. Caso o usuário queira fazer uma destas ações, deverá
  utilizar o procedimento Padrão para Configuração de Relatórios.
- Lançamentos de Rubricas por Rubrica:
  * Feita um remodelagem no Layout da Tela.
================================================================================
CM$VER      4.06.04     22/10/2002
--------------------------------------------------------------------------------
- Acerto da Quantidade de Dependentes:
  * Acrescentado um LOG do processo.
================================================================================
CM$VER      4.06.03     11/10/2002
--------------------------------------------------------------------------------
- Implementação do Help Sensível ao Contexto.
================================================================================
CM$VER      4.06.02     07/10/2002
--------------------------------------------------------------------------------
- Relatório Relação de Empregados Alfabético Mensal:
  * Acerto na impressão das Rubricas para as duas últimas colunas. Estas eram
  selecionadas mas, no momento da impressão, estas colunas tinham sempre o mesmo
  valor da Primeira.
================================================================================
CM$VER      4.06.01     02/10/2002
--------------------------------------------------------------------------------
- Recibo de Pagamento:
  * Agora este relatório é impresso em duas vias por página em formato A4;
  * Acerto nas opções de ordenação.
================================================================================
CM$VER      4.06.00     30/09/2002
--------------------------------------------------------------------------------
- Tela de Parametrização Portador Forma por Banco:
  * Mudança no nome da tabela.
OBS: - A partir desta versão, este sistema necessitará de uma atualização no Banco de
  Dados que se encontra no SCRIPT 200209047 para que a integração com o Contas a
  Pagar e/ou a Receber funcione corretamente.
================================================================================
CM$VER      4.05.09     25/09/2002
--------------------------------------------------------------------------------
- A partir desta versão o Sistema necessita do arquivo CMRHObj50.bpl para funcionar.
================================================================================
CM$VER      4.05.08     29/08/2002
--------------------------------------------------------------------------------
- Forma de Cáculo:
  Função DIASTRABALHADOS considera também afastamento e retorno no mesmo mês.
================================================================================
CM$VER      4.05.07     23/08/2002
--------------------------------------------------------------------------------
- Inserida uma opção para imprimir o Tipo de Processo (Prévia ou Final) que está
  sendo gerado nos Relatórios: Folha de Pagamento Normal, Folha de Empregados por
  Rubrica e Resumo da Folha.
================================================================================
CM$VER      4.05.06     21/08/2002
--------------------------------------------------------------------------------
- Cadastro de Dedendentes:
  * Acerto no erro que fazia com que fossem perdidos os Dados Pessoais dos Titulares
  no momento da atualização do Número de Dependentes.
================================================================================
CM$VER      4.05.05     19/08/2002
--------------------------------------------------------------------------------
- Relação de Dependentes:
  * Inclusão da opção para a seleção do sexo do titular.
================================================================================
CM$VER      4.05.04     29/07/2002
--------------------------------------------------------------------------------
- Cadastro de Pessoal
  * Para Usuário Individual, a tela é automaticamente exibida (sem a
    necessidade de Procurar a própria pessoa) e as autorizações de
    inserção, alteração e exclusão seguem a parametrização do Uso Pessoal.
- Relatórios
  * Férias Programadas: o período de gozo foi separado em 2 colunas.
    Caso este relatório tenha sido alterado pelo usuário, ele deve ser restaurado;
  * Previsão de Férias:
  1) para quem ainda não completou o período aquisitivo, o saldo de dias será zero;
  2) foi acertada a data limite para quem tem dias de saldo.
================================================================================
CM$VER      4.05.03     24/06/2002
--------------------------------------------------------------------------------
- Relação dos Salários de Contribuição ao INSS:
  Acerto no erro que era gerado quando solicitada a impressão do sub-relatório
  "Benefício por Incapacidade".
================================================================================
CM$VER      4.05.02     19/06/2002
--------------------------------------------------------------------------------
- Emissão de Etiquetas:
  * Opção para emitir etiquetas para atualização da CTPS (Alterações Funcionais e
  Férias) de forma coletiva.
- Resumo da Folha de Pagamento:
  * Possibilidade da seleção de um intervalo de datas a considerar.
- Cadastro de Dependentes:
  * Inclusão dos campos de Naturalidade: Cidade e Estado.
- Inclusão do Relatório Ficha de Salário Família em Consultas / Relatórios / Cadastrais.
  Abaixo encontra-se o procedimento para a criação dos documentos requeridos pelo mesmo:
  1) Criar os Tipos de Documentação no GlobalCM (deve-se preencher somente os campos citados):
    * Nome do Documento: Certidão de Nasc - Cartório
   Aplica-se a pessoa: Física
  * Nome do Documento: Certidão de Nasc - Nº Registro
    Aplica-se a pessoa: Física
    Obriga Data de Emissão: [X]
  * Nome do Documento: Certidão de Nasc - Nº Livro
    Aplica-se a pessoa: Física
  * Nome do Documento: Certidão de Nasc - Nº
    Aplica-se a pessoa: Física
  * Nome do Documento: Certidão de Nasc - Nº Folha
    Aplica-se a pessoa: Física
  2) Criar os Documentos Oficiais (tela situada em Cadastros / Tabelas Auxiliares):
  * Código Oficial: 29
    Sigla do Documento: NOM_CART:
    Tipo de Documento: Certidão de Nasc - Cartório
  * Código Oficial: 30
    Sigla do Documento: NUM_REGISTRO:
    Tipo de Documento: Certidão de Nasc - Nº Registro
  * Código Oficial: 31
    Sigla do Documento: NUM_LIVRO:
    Tipo de Documento: Certidão de Nasc - Nº Livro
  * Código Oficial: 32
    Sigla do Documento: NUM_FOLHA:
    Tipo de Documento: Certidão de Nasc - Nº Folha
================================================================================
CM$VER      4.05.01     13/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.07.00;
- Retirada a opção de menu Transações / Fechamento da Folha pois a mesma não é mais necessária.
================================================================================
CM$VER      4.05.00     03/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.06.13.
================================================================================
CM$VER      4.04.06     24/05/2002
--------------------------------------------------------------------------------
- Transações / Rescisão
  * Foi acrescentada a informação relativa a Aviso Prévio Trabalhado (Sim ou Não).
  * Foram adicionadas críticas referentes ao Aviso Prévio.
  * Quando é registrada, nesta tela, a Data da Homologação, o sistema envia um aviso,
     via Correio CM, à pessoa desligada. O texto desse aviso será um padrão único para 
     comparecimento ao Setor de Pessoal, ou poderá ser individualizado por Motivo de 
     Rescisão. Para tanto, será necessário colocar o texto desejado no campo Observações
     do Cadastro de Motivos e Ações. 
    
================================================================================
CM$VER      4.04.05     20/05/2002
--------------------------------------------------------------------------------
- Cadastro de Pessoal:
  * Inclusão da Situação Funcional na Busca do Empregado;
- Ficha Funcional:
  * Inclusão da opção para imprimir a Descrição do Cargo.
- RAIS:
  * Inclusão da possibilidade de indicar o Tipo de Folha para cada Rubrica selecionada.
================================================================================
CM$VER      4.04.04     13/05/2002
--------------------------------------------------------------------------------
- Cadastro de Dependentes
  * Não exige mais o Documento Chave (normalmente o CPF), independente de como 
     esteja definido o parâmetro global deste aspecto.
================================================================================
CM$VER      4.04.03     10/05/2002
--------------------------------------------------------------------------------
- CAGED em Meio Magnético:
  * Deve-se incluir o Código RAIS no Cadastro de Graus de Instrução com "uma posição".
- Cadastro de Férias:
  * Incluído o campo Dias de Gozo no Histórico.
================================================================================
CM$VER      4.04.02     09/05/2002
--------------------------------------------------------------------------------
- Implementação do Relatório Declaração de Dependentes para Fins de Imposto de Renda
  que se encontra em Consultas / Relatórios / Cadastrais.
================================================================================
CM$VER      4.04.01     08/05/2002
--------------------------------------------------------------------------------
- Relatório de Salário de Contribuição ao INSS:
  * Acerto no subrelatório Discriminação das Parcelas.
================================================================================
CM$VER      4.04.00     03/05/2002
--------------------------------------------------------------------------------
- Cadastro de Pessoal:
  * Implementado a visualização do CBO para o Cargo Oficial.
  * Gravação das alterações cadastrais (opcional para o usuário). Que são:
    --> Matrícula;
    --> Nome;
    --> CPF;
    --> CTPS;
    --> PIS/PASEP;
    --> Data de Nascimento;
    --> Data de Admissão;
    --> Horário de Trabalho;
    --> Nome do Chefe;
    --> Grau de Instrução;
    --> Estado Civil;
    --> Sindicato;
    --> Profissão;
    --> Qtde. Dependentes I. Renda;
    --> Qtde. Dependentes Sal. Fam.
- Relatório de Previsão de Férias:
  * Ao selecionar a ordenação como uma das novas opções Empregado ou Matrícula,
    o relatório será agrupado por Centro de  Custo;
  * Inclusão do campo Dias de Saldo.
- Implementação da Relação de Dependentes que se encontra em
  Consultas / Relatórios / Cadastrais.
- GRFC:
  * Inclusão de uma página para a seleção das Rubricas para o Adiantamento do 13º;
  * Possibilidade de imprimir pela Prévia ou Final.
- Implementação do Histórico de Alterações Cadastrais que se encontra em Cadastros.
================================================================================
CM$VER      4.03.05     03/05/2002
--------------------------------------------------------------------------------
- Resumo de Folha de Pagamento:
  * Implementada a seleção de Rubricas.
================================================================================
CM$VER      4.03.04     18/04/2002
--------------------------------------------------------------------------------
- Cadastro de Cartas ou Comunicados:
  * Acrescentadas novas opções de substituição para os Dados da Empresa atualmente
     logada.
================================================================================
CM$VER      4.03.03     17/04/2002
--------------------------------------------------------------------------------
- Usuário RH
  * Esta autorização pode também ser feita a nível de Grupo de
    Usuários, o que até então não era permitido.
- Cadastro de Cartas e Comunicados:
  * O texto pode ser formatado para se adequar ao documento que se quer reproduzir,
    permitindo a substituição de uma grande quantidade de informações segundo uma
    legenda apresentada na tela. Com isto, pode-se agora criar praticamente qualquer
    tipo de documento que necessite dados dos empregados.
- Transações / Contabilização ...
  * Quando ocorre uma situação de algum tipo de inconsistência nas
    parametrizações, o processo agora é abortado normalmente, após
    ser exibida a mensagem explicativa.
================================================================================
CM$VER      4.03.02     09/04/2002
--------------------------------------------------------------------------------
- Referência de uma Rubrica igual ao valor de outra
  * Foi implementada a possibilidade de que o valor de uma rubrica apareça como
     Referência de outra, que seja gerada depois. Para isto, deve-se cadastrar duas
     Rubricas Padrão CLT, com os códigos 90008 e 90009 e as descrições que melhor
     definam a sua situação.
  * No cadastro de Rubricas Salariais, a que servirá como origem da Referência será
     parametrizada com a Rubrica Padrão CLT Correspondente à 90008, e a que vai
     receber a Referência com a 90009.
================================================================================
CM$VER      4.03.01     08/04/2002
--------------------------------------------------------------------------------
- Opção de Prévia:
  * Foi implementada a possibilidade de definir um padrão utilizado na abertura da
  tela de Geração da Folha. Esta informação é registrada emSistema/Configuração/
  Parâmetros/Motivo e Rubricas.
================================================================================
CM$VER      4.03.00     27/03/2002
--------------------------------------------------------------------------------
- Foi implementada a opção para o sistema numerar a Matrícula sequencialmente:
  * Esta opção é exercida na tela Sistema / Configuração / Parâmetros, indicando se 
     deseja a numeração automática e, se sim, o tamanho do Número da Matrícula.
  * Tendo optado pela numeração, seu efeito será notado no Cadastro de Pessoal, ao se
     inserir um novo empregado. O sistema irá gerar a Matrícula (que poderá ser acatada 
     ou não), desde que todas as matrículas existentes contenham apenas algarismos e o 
     maior número seja compatível com o tamanho especificado nos parâmetros. Deve 
     ser observado que a maior matrícula será acrescida de 1, independente da 
     categoria e situação do empregado a que ela pertença.
- Registro de Alteração Funcional e Consulta do Histórico da Evolução Funcional
 * Foi acrescentada a informação referente ao Cargo Alternativo / Função, válido para as 
    empresas que tenham optado por "Dois Cargos".
- Demonstrativo de Pagamento (Consultas / Relatórios Especiais)
  * O sistema agora "memoriza" as últimas mensagens, aplicável aos modelos que pedem 
     textos de mensagem ao usuário.  
================================================================================
CM$VER      4.02.29     26/03/2002
--------------------------------------------------------------------------------
- Relatório Gerencial
  * Opção para buscar o custo de treinamento no Módulo correspondente do RH.
- Transações / Contabilização e Contas a Pagar da Folha
  * Opção para gerar essas integrações a partir de Prévia(s) da Folha.
================================================================================
CM$VER      4.02.28     15/03/2002
--------------------------------------------------------------------------------
- Cadastro de Pessoal:
  * A seleção do Tipo Sanguíneo é selecionada a partir de uma "Lista", ao invés de ter
  que ser digitada.
- Ficha Funcional:
  * Várias novas informações e opções de impressão. Pode ser usada como uma
  Ficha de Registro.
================================================================================
CM$VER      4.02.27     12/03/2002
--------------------------------------------------------------------------------
- Tela de Parâmetros do Relatório Recibo de Pagamento a Terceiros:
  * Inclusão da seleção dos Tipos de Folha.
================================================================================
CM$VER      4.02.26     25/02/2002
--------------------------------------------------------------------------------
- Acerto na tela de Lançamento de Hora Extra.
================================================================================
CM$VER      4.02.25     07/02/2002
--------------------------------------------------------------------------------
- Acerto no Cálculo da Rescisão.
================================================================================
CM$VER      4.02.24     01/02/2002
--------------------------------------------------------------------------------
- Cadastro de Sindicatos:
  * Acerto na impossibilidade de se alterar endereços, telefones e contatos.
================================================================================
CM$VER      4.02.23     31/01/2002
--------------------------------------------------------------------------------
- Salário Educação:
  * Atualização para o novo Layout (Inclusive impressão do Código de Barras).
================================================================================
CM$VER      4.02.22     28/01/2002
--------------------------------------------------------------------------------
- Implementação da Relação das Rubricas de Integração Contábil em
  Consultas / Relatórios / Cadastrais / Rubricas de Integração Contábil.
================================================================================
CM$VER      4.02.21     28/01/2002
--------------------------------------------------------------------------------
- Relação dos Salários de Contribuição ao INSS:
  * Inclusão da opção de impressão do relatório Requerimento de Benefício por
  Incapacidade na tela de parâmetros.
================================================================================
CM$VER      4.02.20     25/01/2002
--------------------------------------------------------------------------------
- Foram feitas mudanças drásticas no Cadastro de Layout:
  * Inclusão dos campos Caracter Decimal e Número de Casas Decimais;
  * Remodelagem do Layout da Tela.
- Importação de Arquivos TXT:
  * Implementação dos campos Caracter Decimal e Número de Casas Decimais
  na geração.
================================================================================
CM$VER      4.02.19     22/01/2002
--------------------------------------------------------------------------------
- Relação dos Salários de Contribuição ao INSS:
  * Acrescentado o relatório Requerimento de Benefício por Incapacidade.
- Formas e Regras de Cálculo:
  * Acrescentados os campos "virtuais" Total de Proventos e Total de Descontos, que
     contêm os respectivos totais acumulados antes do processamento da Rubrica atual.
================================================================================
CM$VER      4.02.18     18/01/2002
--------------------------------------------------------------------------------
- Listagem do Cadastro de Pessoal:
  * Acrescentado o campo Data de Demissão.
================================================================================
CM$VER      4.02.17     08/01/2002
--------------------------------------------------------------------------------
- Acerto na seleção dos feriados em Lançamento de Rubricas por Pessoa, Registro
  de Horas Extras e Atrasos e nos Relatórios de Frequência.
- Impresso GRFC:
  * Possibilidade de informar o percentual do valor a recolher.
================================================================================
CM$VER      4.02.16     26/12/2001
--------------------------------------------------------------------------------
- Relatórios de Folha de Frequência I, II e Horário Escala:
  * Impressão do 2º Cargo caso a Empresa utilize dois Cargos e o Empregado possua o 2º Cargo.
- Relatórios de Previsão de Férias:
  * Incluído o campo Quantidade de Dias após o campo Data Programada.
================================================================================
CM$VER      4.02.15     03/12/2001
--------------------------------------------------------------------------------
- Relação dos Salários de Contribuição ao INSS:
  * Não é mais impresso uma Data de Desligamento para um empregado afastado.
================================================================================
CM$VER      4.02.14     03/12/2001
--------------------------------------------------------------------------------
- Relatório Folha de Frequência - II:
  * Inclusão da opção de impressão dos Horários de Intervalo.
- Inclusão do Cadastro de Faixas Salariais no menu Cadastros / Cargos e Afins / Faixas Salariais.
- Cadastro de Cargos:
  * Inclusão do campo Faixa Salarial;
  * Exclusão do campo Nível de Autoridade por não ser mais utilizado.
- GFIP:
  * O Código de Terceiros a ser gravado agora é o que não foi selecionado como Convênio Previdênciário no Estabelecimento e possuir o MENOR Código;
  * Na Inscrição do Fornecedor da Folha agora está sendo gravado o CNPJ da CM;
  * Corrigida a informação dos demitidos no dia primeiro do mês.
================================================================================
CM$VER      4.02.13     26/11/2001
--------------------------------------------------------------------------------
- Relação dos Salários de Contribuição ao INSS:
  * Impressão do cabeçalho respectivo à cada página para todas as páginas do relatório.
- Relatório Lançamento de Rubricas Individuais:
  * Acerto na geração do mesmo.
================================================================================
CM$VER      4.02.12     20/11/2001
--------------------------------------------------------------------------------
- Geração e Cálculo da Folha
  * Corrigido o tratamento para lançamentos cuja rubrica possui uma regra 
    diferenciada para Férias ou 13º.
================================================================================
CM$VER      4.02.11     19/11/2001
--------------------------------------------------------------------------------
- Forma de Cálculo:
  * Possibilidade de inclusão de um comentário no final da mesma.
- Relatórios de Frequência:
  * Acerto na seleção das Situações Funcionais.
================================================================================
CM$VER      4.02.10     08/11/2001
--------------------------------------------------------------------------------
- Cadastro de Formas de Cálculo:
  * Foi implementada a possibilidade de inserir observações ao final da expressão.
- Consultas / Relatórios / Cadastrais
  * Foi acrescentada a Emissão de Crachás.
================================================================================
CM$VER      4.02.09     06/11/2001
--------------------------------------------------------------------------------
- Cadastro de Pessoal:
  * Inclusão do campo Tipo Sanguíneo na pasta Dados Pessoais.
- Cadastro de Dependentes:
  * Opção de busca pelo Titular (nome ou CPF) e CPF do Dependente.
- Cadastro de Formas de Cálculo:
  * Implementadas as funções SALVA e RECUPERA.
================================================================================
CM$VER      4.02.08     30/10/2001
--------------------------------------------------------------------------------
- Forma de Cálculo:
  * Foram corrigidas as funções de Valor Máximo e Valor Mínimo.
- Cadastro de Pessoal:
  * Inclusão do Campo Cidade de Nascimento que se encontra na Pasta Dados Pessoais.
================================================================================
CM$VER      4.02.07     29/10/2001
--------------------------------------------------------------------------------
- Forma de Cálculo
  * Foi implementada uma função que retorna a Quantidade de Dependentes do empregado de um determinado Tipo de Dependência e estando na faixa etária especificada (em anos ou meses).
================================================================================
CM$VER      4.02.06     23/10/2001
--------------------------------------------------------------------------------
- Tela de Parâmetros:
  * O campo Antecipação do 13º foi retirado.
================================================================================
CM$VER      4.02.05     23/10/2001
--------------------------------------------------------------------------------
- Cadastro de Dependentes:
  * Implementada a opção para a inserção de endereços dos Titulares.
- Implementação do Relatório Documento de Cadastramento do Trabalhador - DCT.
================================================================================
CM$VER      4.02.04     11/10/2001
--------------------------------------------------------------------------------
- Acerto na ordem dos campos na Tabela Genérica.
================================================================================
CM$VER      4.02.03     08/10/2001
--------------------------------------------------------------------------------
- GFIP Magnético:
  * Atualização para a versão 5.0;
- Tabela Genérica:
  * Implementada a Exportação e Importação (somente para arquivos gerados pela opção de Exportação citada) das linhas.
================================================================================
CM$VER      4.02.02     05/10/2001
--------------------------------------------------------------------------------
- Formas de Cálculo:
  * Função Diferença de Meses: Foi acrescentada uma opção para meses inteiros ou arredondados;
  * Novas Funções: Avos para Férias e Avos para 13º Salário;
- Substituição da GRFP pela GRFC, conforme Circular 222/01 da CEF;
- Acrescentado um filtro por Data de Admissão em algumas telas de Seleção de Pessoas.
================================================================================
CM$VER      4.02.01     03/10/2001
--------------------------------------------------------------------------------
- Formas de Cálculo:
  * Função Diferença de Meses: Foi acrescentada uma opção para meses inteiros ou arredondados;
  * Novas Funções: Avos para Férias e Avos para 13º Salário.
- Substituição da GRFP pela GRFC, conforme Circular 222/01 da CEF
================================================================================
CM$VER      4.02.00     27/09/2001
--------------------------------------------------------------------------------
- Acrescentado um Atalho na Tela Principal para o Cadastro de Formas de Cálculo;
- Relação do Recolhimento da Contribuição Sindical:
  * Implementada uma opção para Selecionar um Tipo de Folha específico para as rubricas;
- Cadastro de Férias:
  * Acrescentado o campo Quantidade de Dias de Abono.
================================================================================
CM$VER      4.01.03     19/09/2001
--------------------------------------------------------------------------------
- Relatório Folha de Pagamento Normal:
  * Acrescentada uma opção para Agrupar por Centro de Custo
  (que somente é permitida mediante a seleção de uma das Ordems de Impressão que possui
   o Centro de Custo em primeiro lugar).
================================================================================
CM$VER      4.01.02     18/09/2001
--------------------------------------------------------------------------------
- Relação dos Salários de Contribuição ao INSS:
  * Implementação do Subrelatório Discriminação das Parcelas do Salário-Contribuição;
- Tela de Cadastro de Formas de Cálculo:
  * Possibilidade de Testar Regras com Passos(antiga Regra).
================================================================================
CM$VER      4.01.01     14/09/2001
--------------------------------------------------------------------------------
- Cadastro de Formas de Cálculo:
  * Acrescentado um botão que permite o Teste das Formas de Cálculo tanto de forma direta quanto passo a passo.
================================================================================
CM$VER      4.01.00     11/09/2001
--------------------------------------------------------------------------------
- Cadastro de Documentos Oficiais:
  * Não é mais permitido a seleção de um Tipo de Documento em mais de um Documento Oficial.
- Cadastro de Forma de Cálculo:
  * Acrescentada uma opção para acessar os nomes e campos de Tabelas Genéricas e Longas.
================================================================================
CM$VER      4.00.05     03/09/2001
--------------------------------------------------------------------------------
- Foi incluída a funcionalidade que permite a seleção de um Tipo de Duração de
  Contrato de Trabalho (que pode ser expressa em: dias, semanas, meses ou anos)
  nos campos relacionados à Duração do Contrato no Cadastro de Pessoas.
================================================================================
CM$VER      4.00.04     27/08/2001
--------------------------------------------------------------------------------
- Acrescentada a seleção da Situação Funcional no Relatório Relação de Empregados Alfabético Mensal.
================================================================================
CM$VER      4.00.03     22/08/2001
--------------------------------------------------------------------------------
- Foi incluída uma opção na Geração da GFIP que gera os Registros de Alterações de Endereço para cada Empregado que irá compô-la.
================================================================================
CM$VER      4.00.02     15/08/2001
--------------------------------------------------------------------------------
- Foi alterada a descrição das Rubricas para a correspondente à Rubrica Associada na Tela Cosulta de Histórico de Rubricas;
- Foi acrescentada a Data de Homologação na Tela de Rescisão;
- Adicionada a Tela de Manutenção de Documentos (AP) no menu Transações;
- Melhoria acentuada de performance na Geração da Folha com a nova Forma de Cálculo.
================================================================================
CM$VER      4.00.01     10/08/2001
--------------------------------------------------------------------------------
- Implementada a Opção de Visualização do Histórico das "GPS Impressas" na tela de parâmetros do Relatório GPS.
================================================================================
CM$VER      4.00.00     08/08/2001
--------------------------------------------------------------------------------
- Inclusão da opção de selecionar os Funcionários demitidos nos Relatórios: Folha de Frequência, Folha de Ponto e Folha de Frequência (Escala);
- Foi introduzida uma forma alternativa de Cálculo da Folha. Esta Forma de Cálculo (expressão como estará sendo referida no sistema) está sendo introduzida como uma alternativa à atual Regra de Cálculo, trazendo porém maior facilidade de assimilação e aplicação pelo usuário final, menor tempo de treinamento e implantação e alguma melhora no desempenho do sistema. A sua implementação foi feita de forma que o processo anterior (Regra de Cálculo) e o novo (Forma de Cálculo) podem coexistir, de modo que o cliente que já possui o sistema implantado poderá optar por manter tudo como está, ou migrar paulatinamente para o novo processo, podendo ainda migrar todas as regras ou apenas parte delas.
================================================================================
CM$VER      3.00.20     31/07/2001
--------------------------------------------------------------------------------
- Mudança na forma de seleção dos dados no relatório Relação dos Salários de Contribuição ao INSS:
  * Na Opção de Limitar por Data será informado o mês inicial que irá até a Última Contribuição recebida;
  * Já na Opção Limitar por Quantidade de Meses deve-se informar a quantidade de meses a contar até a Última Contribuição recebida.
================================================================================
CM$VER      3.00.19     27/07/2001
--------------------------------------------------------------------------------
- Na Tela de Geração foi implementada a Gravação das Rubricas selecionadas para o Retroativo.
================================================================================
CM$VER      3.00.18     20/07/2001
--------------------------------------------------------------------------------
- Correção na abertura das Telas de Cadastro: Funcionários e Dependentes.
================================================================================
CM$VER      3.00.17     17/07/2001
--------------------------------------------------------------------------------
- Implementações no Lançamento de Rubricas por Pessoa:
  * Mudança no Layout;
  * Acerto no Lançamento de Faltas;
  * Ligeiro aumento da Performance.
================================================================================
CM$VER      3.00.16     11/07/2001
--------------------------------------------------------------------------------
- Alterações no Relatório Férias Programadas:
  * Inclusão da Opção de seleção de Situações dos Empregados;
  * Inclusão da Opção de seleção dos Centros de Custo dos Empregados.
================================================================================
CM$VER      3.00.15     04/07/2001
--------------------------------------------------------------------------------
- Os relatórios abaixo foram acrescentados no Menu de Consultas/Relatórios/Operacionais:
  Relação dos Salários de Contribuição ao INSS e Relação do Recolhimento da Contribuição Sindical.
================================================================================
CM$VER      3.00.14     02/07/2001
--------------------------------------------------------------------------------
- Acerto no agrupamento por Nome de Rubrica no Relatório Folha de Empregados por Rubrica;
- Acerto nos valores da GRFP quando existir valores iguais para alguma seleção.
================================================================================
CM$VER      3.00.13     25/06/2001
--------------------------------------------------------------------------------
- Implementações na Importação de Arquivos TXT:
  * Acerto na Geração;
  * Inclusão da opção "Ignora valores zerados";
- Acrescentada uma opção de Agrupar o Centro de Custo por Programa.
================================================================================
CM$VER      3.00.12     25/06/2001
--------------------------------------------------------------------------------
- Acerto na Importação de Arquivos TXT.
================================================================================
CM$VER      3.00.11     20/06/2001
--------------------------------------------------------------------------------
- Correção no Cadastro de Tabelas Genéricas quanto à ordenação dos campos no Grid (Página Linhas).
================================================================================
CM$VER      3.00.10     19/06/2001
--------------------------------------------------------------------------------
- Novo Layout e Correções no Cadastro de Tabelas Genéricas.
================================================================================
CM$VER      3.00.09     18/06/2001
--------------------------------------------------------------------------------
- Correção no Cálculo do Retroativo.
================================================================================
CM$VER      3.00.08     18/06/2001
--------------------------------------------------------------------------------
- Implementada a integração com Contas a Pagar no Recibo de Pagamento a Terceiros;
- Otimização de Performance do Processo de Rescisão;
- No relatório TRCT foi feito uma seleção do Período de Desligamento desvinculado do Mês de Geração da Rescisão (Especialmente importante nos casos de Rescisão complementar);
- No relatório Folha de Empregados por Rubrica foi implementada a opção de agrupar por Centro de Custo que é feita automaticamente quando da seleção de uma ordem que contenha o Centro de Custo entre os campos a ordenar.
================================================================================
CM$VER      3.00.07     08/06/2001
--------------------------------------------------------------------------------
- No Salário-Educação o campo 14 (Deduções para o SME) agora é calculado automaticamente de acordo com as Rubricas geradas no mês e que possuem o código de Rubrica CLT 40460 (valor do auxílio educação).
================================================================================
CM$VER      3.00.06     08/06/2001
--------------------------------------------------------------------------------
- Foi incluída a possibilidade de impressão da GPS em duas vias (ambas na mesma folha);
- Na hora da gravação da Rescisão (clique no botão Ok) é gerado um registro no Histórico de Situação Funcional;
- Acrescentado um atalho na tela principal para a Consulta Histórico de Rubricas;
- Alterações na geração da GFIP:
  * Incluído o campo "Dia Limite Próx. Mês Recolhido por GRFP";
  * Possibilidade de filtrar por Centros de Custo;
- Na GRFP houve um acerto na busca das informações no mês anterior quando especificado "FGTS não Recolhido no Mês Anterior".
- Integração com o Contas a Pagar:
  * Acréscimo de novas funcionalidades;
  * Adicionada na Tela de Rescisão;
- No Relatório Cadastro de Pessoal foi incluído o campo Data de Admissão.
================================================================================
CM$VER      3.00.05     25/05/2001
--------------------------------------------------------------------------------
- Acerto na alteração dos Parâmetros do Sistema.
================================================================================
CM$VER      3.00.04     22/05/2001
--------------------------------------------------------------------------------
- Acerto na seleção de um Sindicato na opção: Browse de Cadastro de Pessoas.
================================================================================
CM$VER      3.00.03     15/05/2001
--------------------------------------------------------------------------------
- Alterações no relatório Impresso GRFP:
  * Mudança no Layout da Tela de Parâmetros;
  * As rubricas relacionadas às remunerações do Empregado ficam com o valor 0 (zero) caso contenham um valor menor que zero;
- Alterações na Associação de Rubricas por Empresa:
  * Possibilidade de procurar uma determinada rubrica digitando-se seu nome na caixa de textos abaixo de cada lista;
  * Possibilidade de tornar todas as rubricas selecionadas para a Empresa em questão visíveis ou invisíveis para as seleções na Folha;
- A seleção de Agência para a Conta Salário e Conta para depósito do FGTS está feita como no cadastro de Fornecedores / Favorecidos do Módulo: Contas a Pagar;
- O Relatório Relação de Empregados Alfabética Mensal só pode ser impresso quando selecionado PELO MENOS uma Rubrica e Título para ela;
- Inclusão do Campo 03 no Termo de Rescisão Contratual que corresponde ao código do item CNAE para o Estabelecimento;
- Implementação do novo Layout do CAD (Comprovante de Arrecadação Direta) do Salário-Educação.
================================================================================
CM$VER      3.00.02     20/04/2001
--------------------------------------------------------------------------------
- Somente são visualizadas as Rubricas que forem indicadas para a Folha de Pagamento.
================================================================================
CM$VER      3.00.01     18/04/2001
--------------------------------------------------------------------------------
- Correção no Relatório de Recibo / Aviso de Férias.
================================================================================
CM$VER      3.00.00     10/04/2001
--------------------------------------------------------------------------------
- Versão em Delphi 5;
- Acerto na soma de rubricas lançadas no Relatório Recibo de Pagamento a Terceiros.
================================================================================
CM$VER      2.06.20     16/03/2001
--------------------------------------------------------------------------------
- Acrescentado no Relatório Gerencial a opção de indicar o Setor Responsável;
- Acertos internos nos cadastros: Pessoal e Dependentes;
- Implementações no Relatório Relação de Empregados Alfabética Mensal:
  * Agora é necessário que cada coluna de dados (antigas Salário, Gratif. de Função e Anuênio) recebam um título, tornando assim, mais flexível a apresentação dos dados;
  * Seleção dos Tipos de Funcionários a considerar (pelo Tipo de Contrato).
================================================================================
CM$VER      2.06.19     09/03/2001
--------------------------------------------------------------------------------
- Incluído a possibilidade de indicar um MES/ANO para o início do período de 12 MESES no Relatório de Ficha Financeira por Funcionário
================================================================================
CM$VER      2.06.18     08/03/2001
--------------------------------------------------------------------------------
- Correção na rotina de Verificação de Dias de Falta no Cadastro de Férias.
================================================================================
CM$VER      2.06.17     07/03/2001
--------------------------------------------------------------------------------
- Melhorias internas em algumas telas;
- Incluído no cadastro de Cartas ou Comunicados a capacidade de Imprimir, Configurar e Restaurar o formato destas.
================================================================================
CM$VER      2.06.16     22/02/2001
--------------------------------------------------------------------------------
- Implementação da Impressão de Etiquetas de Atualização para CTPS nas opções Reajuste Salarial e Registro de Alteração Funcional no memu Transações.
================================================================================
CM$VER      2.06.15     14/02/2001
--------------------------------------------------------------------------------
- Inclusão da opção: Registro de Alteração da Situação Funcional no Menu Transações;
- No cadastro de Cartas ou Comunicados não é mais possível a impressão destes pela tela, e sim, pelo Menu de Consultas/Relatórios/Operacionais/Cartas ou Comunicados;
- O relatório Ficha Funcional foi acrescentado no Menu de Consultas/Relatórios/Operacionais;
- Os relatórios abaixo foram acrescentados no Menu de Consultas/Relatórios/Cadastrais:
  Etiquetas, Listagem do Cadastro de Pessoal.
================================================================================
CM$VER      2.06.14     08/02/2001
--------------------------------------------------------------------------------
- Os campos Consolida e ProRata Admissão do cadastro de Rubricas foram retirados pois não estavam sendo usados.
================================================================================
CM$VER      2.06.13     07/02/2001
--------------------------------------------------------------------------------
- Correção no Relatório Folha de Empregados por Rubrica;
- Implementação do Relatório Cadastro de Rubricas Salariais.
================================================================================
CM$VER      2.06.12     01/02/2001
--------------------------------------------------------------------------------
- RAIS: foi acrescentada a opção para selecionar as pessoas pelo "Tipo de Contrato".
- Folha de Frequência I: o campo Saldo de Férias agora é preenchido pelo sistema.
- Cadastro de Dependentes: foi corrigida a função de verificação das quantidades de 
  dependentes por titular, de forma a ser acionada também na inclusão do dependente, 
  pois só estava sendo chamada na alteração.
================================================================================
CM$VER      2.06.11     29/01/2001
--------------------------------------------------------------------------------
- O campo "virtual" para Regra, denominado "Início do Próximo Período Aquisitivo de 
   Férias" passa a considerar, em primeira instância, a informação correspondente às 
   próximas férias já programadas (não processadas) para cada pessoa; em segunda 
   instância, vai considerar um ano após o período das últimas férias processadas e, em 
   terceira e última instância, a data de admissão da pessoa.
================================================================================
CM$VER      2.06.10     22/01/2001
--------------------------------------------------------------------------------
- Lançamento Contábil:  alteração na forma de construção do histórico.
- Lay-Out de Arquivos Texto:  correção do cadastro.
- Impotação de Arquivos Texto: correção na situação de valor com centavos apenas;
  opção adicional para seleção de Ano/Mês de início.
- Eliminação de Lançamentos: correção na busca da rubrica a ser eliminada; 
  opção adicional para seleção de Ano/Mês de início.
================================================================================
CM$VER      2.06.09     15/01/2001
--------------------------------------------------------------------------------
Implementação do Relatório Férias Programadas, que exibe as pessoas que terão (ou 
tiveram) férias cujo início de gozo esteja no período informado pelo usuário.
================================================================================
CM$VER      2.06.08     12/01/2001
--------------------------------------------------------------------------------
- Acertos na Geração da RAIS2000;
- Acerto do campo Data Programada no Relatório de Previsão de Férias, este vinha com o ano cortado pela metade.
================================================================================
CM$VER      2.06.07     11/01/2001
--------------------------------------------------------------------------------
- Acerto na inserção de um novo Sindicato.
================================================================================
CM$VER      2.06.06     11/01/2001
--------------------------------------------------------------------------------
- Implementação do Relatório Aviso de Férias;
- Acertos no Layout do Relatório Recibo / Aviso de Férias;
- Acertos na geração da RAIS2000.
================================================================================
CM$VER      2.06.05     08/01/2001
--------------------------------------------------------------------------------
- Acerto do "Problema" que existia ao iniciar a Tela de Lançamento de Histórico de Rubricas;
- Implementação na Consulta de Histórico de Rubricas:
  * Tipo de Folha Padrão é selecionado (o mesmo do Parâmetro do Sistema);
  * Mês de Referência Padrão é selecionado (o mesmo do Parâmetro do Sistema para Folha Normal).
================================================================================
CM$VER      2.06.04     05/01/2001
--------------------------------------------------------------------------------
- Inclusão dos dados para Estrangeiros no cadastro de Pessoal;
- Na geração da Folha, o Empregado que está atualmente sendo processado, é visualizado no exato momento de execução do mesmo;
- Atualização da RAIS em meio magnético para a versão do ano 2000.
================================================================================
CM$VER      2.06.03     21/12/2000
--------------------------------------------------------------------------------
- Alteração no campo LIVRE da Geração do Arquivo para Pagamento Eletrônico.
================================================================================
CM$VER      2.06.02     20/12/2000
--------------------------------------------------------------------------------
- Inclusão da opção de Impressão da Data Programada no Relatório de Previsão de Férias;
- Acerto na Geração da Folha com a unificação das Telas (Prévia e Final);
- Agora é possível fazer com que seja incluída ou alterada Férias para um Funcionário que não esteja ativo.
================================================================================
CM$VER      2.06.01     19/12/2000
--------------------------------------------------------------------------------
- Várias implementações internas referentes à segurança dos dados;
- Acrescentado no Relatório de Empregados por Rubrica o campo de contagem dos funcionários que estão listados;
- Acrescentado os Cadastros de Tabela Genérica e Longa do sistema REGRA em Cadastros / Tabelas Auxiliares / Tabelas REGRA/ (Genérica / Longa);
- Implementação no Relatório de Folha de Frequência:
  * Período aquisitivo é impresso mesmo se não houver algum cadastrado no sistema para o funcionário;
- Centro de Custo já está sendo atualizado automaticamente no Cadastro de Funcionários;
- Implementações no Relatório de GPS:
  * Impressão de um tipo de folha específico (Ex:Folha de 13º Salário) que pode ser deixado em branco para todos os tipos;
  * Opção para Geração da GPS do 13º Salário que imprimirá a competência 13 na mesma.
================================================================================
CM$VER      2.05.04     04/12/2000
--------------------------------------------------------------------------------
- Acertos internos no Laçamento de Rubricas por Pessoa e Laçamento de Rubricas por Rubrica.
================================================================================
CM$VER      2.05.03     01/12/2000
--------------------------------------------------------------------------------
- Alteração no Layout da opção Importação Direta de Dados;
- Implementações na Importação de Arquivos TXT:
  * Alteração no Layout da tela;
  * Inclusão das opções Inserir, Substituir e Somar os dados do arquivo TXT com os do Lançamento de Rubricas
- Alteração no Layout do Cadastro de Layout de Arquivos TXT;
- Implementação da seleção de Rubricas no Relatório Ficha Financeira;
- Seleção de Tipos de Folha e Centro de Custo no Relatório de Folha de Empregados por Rubrica;
- Implementação da Atualização do número de dependentes dos Funcionários na medida em que uma alteração ou inclusão é feita no mesmo (cadasto de Dependentes).
================================================================================
CM$VER      2.05.02     14/11/2000
--------------------------------------------------------------------------------
- Implementação da Seleção do Situação / Tipo de Contrato dos funcionários no restante dos Relatórios;
- Implementações na GRFP:
 * Inclusão da Opção de Inclusão do campo 35 no Valor Devido à Previdência Social (Campo 17);
- Melhorias na Performace nos Relatórios.
================================================================================
CM$VER      2.05.01     03/11/2000
--------------------------------------------------------------------------------
- Opção para fazer a integração com o Contas a Pagar junto com a Contabilização
- Opção para gerar o Arquivo de Pagamento Eletrônuco independente da geração da folha
================================================================================
CM$VER      2.04.24     01/11/2000
--------------------------------------------------------------------------------
- Implementação da Seleção da Situação / Tipo de Contrato dos funcionários nos Relatórios:
  DERF, Ficha Financeira por Funcionário, Folha de Empregados por Rubrica, Folha de Frequência - I, Folha de Frequência - II, Folha de Frequência (Horário Escala);
- Acerto nas Rotinas de Integração com Contas a Pagar.
================================================================================
CM$VER      2.04.23     31/10/2000
--------------------------------------------------------------------------------
- Inclusão do Campo "Qtde. Func" que indica a Quantidade de Funcionários que fizeram parte da soma para as Rubricas no Relatório de Resumo de Folha;
- Implementação da Seleção da Situação / Tipo de Contrato dos funcionários nos Relatórios:
  Relação de Empregados Alfabético Mensal, Provisão de Férias, Provisão de 13º Salário, Resumo de Folha Comparativo, Acompanhamento de Escala de Férias, Resumo de Folha, Previsão de Férias;
- Implementação do Gráfico Evolução da Folha.
================================================================================
CM$VER      2.04.22     24/10/2000
--------------------------------------------------------------------------------
- Implementação do Relatório de Resumo de Folha Comparativo entre 2 meses especificados;
- Várias Implementações Internas.
================================================================================
CM$VER      2.04.21     16/10/2000
--------------------------------------------------------------------------------
- Várias Implementações internas como: melhoria de performance nos cadastros;
- Alteração no Layout dos Cadastros;
- RAIS em meio magnético.
================================================================================
CM$VER      2.04.20     06/10/2000
--------------------------------------------------------------------------------
- Opção para Prévia no Recibo de Pagamento a Terceiros;
- Possibilidade de importar arquivos texto identificados por qualquer documento do empregado, além da matrícula (que já existia);
- Várias implementações internas;
- Lançamento de Rubricas Salariais por Rubrica:
  * Alteração no Layout;
  * Correção dos dados do Grid que não era visualizado em determinadas ocasiões.
================================================================================
CM$VER      2.04.19     25/09/2000
--------------------------------------------------------------------------------
- Inclusão do Logotipo do Estabelecimento no Cadastro e no relatório Folha de Frequência - I;
- Implementações no CAGED:
  * Seleção dos Tipos de Contrato de Funcionários;
  * Seleção das Rubricas que Compõem o Salário (Para admissões);
- Relatório Seguro Desemprego foi incluído as opções para Impressão da Agência Bancária:
  * Onde é depositado o FGTS do Funcionário;
  * A Selecionar (faz a seleção da agência);
  * Não Imprime.
- Relatório TRCT:
  * Inclusão de uma coluna para Proventos e outra para Descontos;
  * Agora é possível fazer a seleção do Tipo de Rescisão do Funcionário que pode ser: Motivo Gerencial, Motivo Oficial ou um Tipo de Folha a Escolher;
- Acerto na gravação dos Dados no Registro de Alteração Funcional;
- Implementação dos relatórios:
  *Acompanhamento de Escala de Férias;
  *Folha de Empregados por Rubrica;
  *Escala de Férias;
- Implementação no CAGED:
  * Seleção dos Tipos de Contrato dos Funcionários a considerar.
================================================================================
CM$VER      2.04.18     05/09/2000
--------------------------------------------------------------------------------
- Implementação dos relatórios:
  * Folha de Frequência - I;
  * Folha de Frequência - II;
  * Folha de Frequência (Horário Escala).
- Inclusão do Número total de Funcionários nos Relatórios de Transporte;
- Implementação no Registro de Histórico de Férias:
  * Inclusão de um campo que calcula a Data Final do Gozo de Férias com base na Data Inicial do Gozo, este campo é um número que será somado à Data Inicial do Gozo para obter a final;
  * Acerto de alguns "erros internos".
- Acertos nos totais do Relatório de Previsão de Férias;
- CAGED:
  * O valor do salário pode ser obtido de duas maneiras: O usuário pode selecionar a(s) Rubrica(s) que compõe(m) o mesmo, deixar em branco esta seleção fará com que o valor seja o cadastrado no campo Salário do cadastro de Funcionários
  * Somente serão gerados os funcionários do tipo: Terceiros e/ou Empregados.
- Eliminação de Lançamentos: acrescentada a opção para Permanentes, Não Permanentes ou Ambos;
- Lançamento de Rubricas: possibilidade do usuário editar o número de ocorrências;
- Inclusão do Tipo de Contrato "Efetivo Especial" nos Funcionários;
- Agora na Geração da Folha a página "Seleção de Rubricas e Empregados" é a primeira a ser visualizada;
================================================================================
CM$VER      2.04.17     21/08/2000
--------------------------------------------------------------------------------
- Correção na gravação dos Registros de Alteração Funcional.
================================================================================
CM$VER      2.04.16     21/08/2000
--------------------------------------------------------------------------------
- Relatório de Previsão de Férias;
- Possibilidade de selecionar um Tipo de Folha de Demissão no
  Lançamento Manual de Histórico de Rubricas;
- Implementação do Campo Movimentação Contratual no Histórico de Situação Funcional do Funcionário;
- Implementação de um novo formato de relatório Recibo de Pagamento (Recibo de Pagamento Formato Alternativo);
- Agora é permitido visualizar o Histórico das Alterações Funcionais que não têm Motivo de Alteração selecionado;
- Inclusão de opções na tela de Eliminação de Lançamentos (Sistema/Utilitátios);
- Opção para gerar todas as rescisões com um único Tipo de Folha;
- Opção de imprimir a Data do Crédito no Relatório Borderô Bancário;
- Opção para Prévia no Relatório TRCT;
- Inclusão da Autorização no Relatório Recibo de Pagamento a Terceiros;
- Implementações internas.
================================================================================
CM$VER      2.04.15     10/08/2000
--------------------------------------------------------------------------------
- Compatibilização com o novo Padrão.
================================================================================
CM$VER      2.04.14     19/07/2000
--------------------------------------------------------------------------------
- Possibilidade de Impressão dos dados da tela de Horas Extras e Atrasos;
- Impresso GRFP;
- Novas Funcionalidades no Relatório de Transportes e Meio Magnético
  * Número de Dias do Mês a considerar (quando o Estabelecimento paga os Vales
     independentemente do nº de dias que tem o mês selecionado);
  * Desconta Feriado (quando o Estabelecimento paga os Vales mesmo se houver
     algum Feriado no mês selecionado).
- Incluído o campo Maior Remuneração no Recibo / Aviso de Férias;
- Opção para Cálculo Retroativo na Geração da Folha;
- Opção para Folha Final ou Prévia na Consulta do Histórico de Rubricas;
- Cadastro de Rubricas Salariais
  * Agora é possível a desassociar uma Rubrica Padrão CLT;
  * Incluído o campo Natureza da Operação;
  * Possibilidade de incluir as Rubricas que Incidem na atual.
================================================================================
CM$VER      2.04.13     16/06/2000
--------------------------------------------------------------------------------
- Vale Transporte: Possibilidade de estabelecer uma quantidade
  mínima de dias para aquisição;
- Contabilização: o lançamento passa a ser gerado com o último
  dia do período, e não o primeiro;
- Implementação do Relatório de Seguro Desemprego que é impresso
  em Formulário pré-impresso.
================================================================================
CM$VER      2.04.12     02/06/2000
--------------------------------------------------------------------------------
- Término de acertos no CAGED;
- Acerto na Rescisão de Contrato;
- Resumo de Folha:
   * É permitido agora a seleção de mais de um Tipo de Folha que entrará no cálculo do mesmo;
   * É permitido agora a seleção de mais de um Centro de Custo que entrará no cálculo do mesmo
      (OBS: Esta segunda opção somente tem efeito se o relatório for agrupado por Centro de Custo);
- Acerto na Geração do Arquivo para o Banco Caixa Econômica;
- Agora a Impressão do Recibo de Pagamento para impressora matricial está correta
  (CAMINHO: Consultas / Relatório Especiais / Demonstrativo de Pagamento).
================================================================================
CM$VER      2.04.11     04/05/2000
--------------------------------------------------------------------------------
- Acerto no GFIP.
================================================================================
CM$VER      2.04.10     03/05/2000
--------------------------------------------------------------------------------
- Acerto do GFIP;
- Acerto do Rel. Recibo / Aviso de Férias.
================================================================================
CM$VER      2.04.08     14/04/2000
--------------------------------------------------------------------------------
- Relatório Resumo de Folha. Incluído o número de pessoas que o compuseram;
- Relatório de Folha de Pagamento Normal. Incluído os campos:
  Referência, Num. de Dependentes em IRRF e Num. de Dependentes em Sal. Fam.
================================================================================
CM$VER      2.04.07     11/04/2000
--------------------------------------------------------------------------------
- CAGED em meio magnético.
================================================================================
CM$VER      2.04.06     07/04/2000
--------------------------------------------------------------------------------
- Correções em diversos relatórios;
- SEFIP 4.0.
================================================================================
CM$VER      2.04.05     23/03/2000
--------------------------------------------------------------------------------
- Termo de Rescisão de Contrato de Trabalho;
- Recibo / Aviso de Férias (problema conhecido: selecione um empregado por
  vez para visualizar e imprimir; será corrigido na próxima liberação);
- Abertura dos relatórios voltou para a inicialização do sistema, para permitir que
  a personalização dos mesmos não seja perdida ao sair e reentrar.
================================================================================
CM$VER      2.04.04     01/03/2000
--------------------------------------------------------------------------------
- Alteração na SEFIP, para poder escolher o Responsável;
- Possibilidade de Salvar e Carregar os dados digitados na tela Registro de
  Horas Extras e Atrasos.
================================================================================
CM$VER      2.04.03     25/02/2000
--------------------------------------------------------------------------------
- Revisão de alguns relatórios;
- Acerto na função de Rescisão.
================================================================================
CM$VER      2.03.09     13/01/2000
--------------------------------------------------------------------------------
- Compatibilização com os componentes de Regra;
- Correção na geração da folha;
- Correção no relatório de resumo de folha.
================================================================================
CM$VER      2.03.08     06/01/2000
--------------------------------------------------------------------------------
- Correção para compatibilização com a atual versão do Padrão.
================================================================================
CM$VER      2.03.07     06/01/2000
--------------------------------------------------------------------------------
- Acerto nos Totais do relatório "Relação de Transportes";
- Modificado o nome do relatório acima para "Relação de Transportes (Em Colunas)";
- Concluído o relatório "Relação de Transportes (Em Linha)".
================================================================================
CM$VER      2.03.06     30/12/1999
--------------------------------------------------------------------------------
- Correção em Cadastro / Pessoal / Dados Pessoais / Sindicato
  * Agora somente traz os sindicatos para a seleção;
- Revisão da tela Cadastro / Horários de Trabalho / Associa Horários com Turnos.
================================================================================
CM$VER      2.03.05     27/12/1999
--------------------------------------------------------------------------------
- Correção na função de geração da Folha.
================================================================================
CM$VER      2.03.04     24/12/1999
--------------------------------------------------------------------------------
- Cadastro de Pessoal, guia Dados Pessoais não estava trazendo o Sindicato;
- Cadastro de Pessoal, guia Outros Dados, não estava gravando o campo Depósito para GRE;
- Revisão da sequência de tabulação das telas de cadastro;
- Correção da emissão da GPS;
- Alteração do relatório "Recibo de Pagamento a Terceiros" e correção de erros.
================================================================================
CM$VER      2.03.03     21/12/1999
--------------------------------------------------------------------------------
- Alteração no relatório Recibo de Pagamento a Terceiros;
- Correção na função "Procurar" do Cadastro de Dependentes.
================================================================================
CM$VER      2.03.02     15/12/1999
--------------------------------------------------------------------------------
- Alterações nos processos relativos a Lançamento de Horas Extras e
  Vale Transporte;
- Correção do problema de, em certas telas, não aparecer o empregado recém
  cadastrado.
================================================================================
CM$VER      2.03.00     15/10/1999
--------------------------------------------------------------------------------
- Compatibilização com o Padrão Pós 4.25.
================================================================================
CM$VER      2.02.27     08/09/1999
--------------------------------------------------------------------------------
- Acerto na Geração da Rubrica de Desconto de Vale-Transporte;
- Acerto no Relatório de Resumo de Folha de Pagamento.
================================================================================
CM$VER      2.02.26     30/08/1999
--------------------------------------------------------------------------------
- Relatório de DERF;
- Alteração na forma de busca de empregados em algumas telas do sistema.
================================================================================
CM$VER      2.02.25     18/08/1999
--------------------------------------------------------------------------------
- Guia de Recolhimento do FGTS e Informação à Previdência Social.
================================================================================
CM$VER      2.02.24     16/08/1999
--------------------------------------------------------------------------------
- Novo layout da Guia da Previdência Social - GPS (Imagem e Espelho);
- Alteração na Rotina de Contabilização da Folha de Pagamento.
================================================================================
CM$VER      2.02.23     06/08/1999
--------------------------------------------------------------------------------
- Relatório de Vale Transporte;
- Opção da Geração de Rubricas de Vale Transporte.
================================================================================
CM$VER      2.02.22     02/08/1999
--------------------------------------------------------------------------------
- Implementação do Relatório de GRPS (Imagem).
================================================================================
CM$VER      2.02.21     02/08/1999
--------------------------------------------------------------------------------
- Implementação do Relatório de GRPS (Espelho).
================================================================================
CM$VER      2.02.20     22/07/1999
--------------------------------------------------------------------------------
- Visualização do Andamento dos Relatórios para o usuário (Barra de Progresso).
================================================================================
CM$VER      2.02.19     20/07/1999
--------------------------------------------------------------------------------
- Acerto no Relatório de Resumo da Folha de Pagamento.
================================================================================
CM$VER      2.02.18     20/07/1999
--------------------------------------------------------------------------------
- Otimização da busca no Cadastro de Empregados;
- Acertos em Relatórios.
================================================================================
CM$VER      2.02.16     14/06/1999
--------------------------------------------------------------------------------
- Acertos na Rotina de Cálculo da Folha de Pagamento.
================================================================================
CM$VER      2.02.15     14/06/1999
--------------------------------------------------------------------------------
- Ampliação e melhoria da forma de selecionar um empregado em várias telas do
  sistema.
================================================================================
CM$VER      2.02.14     09/06/1999
--------------------------------------------------------------------------------
- Atualização da Rotina de Lançamento Contábil.
================================================================================
CM$VER      2.02.13     08/06/1999
--------------------------------------------------------------------------------
- Alteração na rotina de extenso.
================================================================================
CM$VER      2.02.12     08/06/1999
--------------------------------------------------------------------------------
- Acerto dos Recibos de Pagamento;
- Seleção dos Registros de Lançamento apenas de Empregados;
- Apuração do Adicional Noturno Automaticamente.
================================================================================
CM$VER      2.02.11     29/05/1999
--------------------------------------------------------------------------------
- Relatório de Recibo de Pagamento.
================================================================================
CM$VER      2.02.10     26/05/1999
--------------------------------------------------------------------------------
- Permissão para que a incidência de uma Rubrica em outra possa ter efeito
  em período passado.
================================================================================
CM$VER      2.02.09     13/05/1999
--------------------------------------------------------------------------------
- Foram excluídas do processo de cálculo as rubricas que estejam sem a Sequência
  de Cálculo.
================================================================================
CM$VER      2.02.08     10/05/1999
--------------------------------------------------------------------------------
- Alterações feitas no Formulário de Cadastro de Funcionários.
================================================================================
CM$VER      2.02.07     05/05/1999
--------------------------------------------------------------------------------
- Alterações feitas para os Lançamentos Contábeis.
================================================================================
CM$VER      2.02.06     22/04/1999
--------------------------------------------------------------------------------
- Acerto na Integração Contábil.
================================================================================
CM$VER      2.01.05     08/04/1999
--------------------------------------------------------------------------------
- Foi concluido a função de integração contabil, na geração da folha.
================================================================================
CM$VER      2.01.04     05/04/1999
--------------------------------------------------------------------------------
- Foi corrigido o erro na geração do Adiantamento Salarial, "VARIANT TYPE ...",
  quando estava sendo gerado os lancámentos contabeis.
================================================================================
CM$VER      2.01.03     25/03/1999
--------------------------------------------------------------------------------
- A Tela de Sobre foi desativada temporariamente.
================================================================================
CM$ALT}


































































































































































































































































































































































































































































































