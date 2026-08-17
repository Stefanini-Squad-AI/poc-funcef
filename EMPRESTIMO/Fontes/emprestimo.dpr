program Emprestimo;

uses
  FixBDE4GbBug,
  uIntegraBack,
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  UModulo in 'UModulo.pas',
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports: TDataModule},
  FCadDatasPatro in 'FCadDatasPatro.pas' {frmCadDatasPatro},
  FCadastroGrid in '..\..\Cm\Forms\Source\FCadastroGrid.pas' {frmCadastroGrid},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  FCadParamIntegraRec in 'FCadParamIntegraRec.pas' {frmCadParamIntegraRec},
  FParamEmptmo in 'FParamEmptmo.pas' {frmParamEmptmo},
  FCadItemEmptmo in 'FCadItemEmptmo.pas' {frmCadItemEmptmo},
  FCadTipoContratoEmptmo in 'FCadTipoContratoEmptmo.pas' {frmCadTipoContratoEmptmo},
  FCadTipoEmptmo in 'FCadTipoEmptmo.pas' {frmCadTipoEmptmo},
  FCadPlanPrevXContabil in 'FCadPlanPrevXContabil.pas' {frmCadPlanPrevXContabil},
  FCadItemxTipoContrato in 'FCadItemxTipoContrato.pas' {frmCadItemxTipoContrato},
  FCadItemDetalhe in 'FCadItemDetalhe.pas' {frmCadItemDetalhe},
  FVerificaMenuSAD in 'FVerificaMenuSAD.pas' {frmVerificaMenuSAD},
  FCancGeraParcela in 'FCancGeraParcela.pas' {frmCancGeraParcela},
  fCancConcessao in 'fCancConcessao.pas' {frmCancConcessao},
  FExecEnvio in 'FExecEnvio.pas' {frmExecEnvio},
  Fpessoa in '..\..\Cm\Forms\Source\fPessoa.pas' {frmPessoa},
  dRelContrConc in 'dRelContrConc.pas' {dtmRelContrConc},
  CRelContrConc in 'CRelContrConc.pas' {cfgRelContrConc},
  FCadCCBaixaXPatro in 'FCadCCBaixaXPatro.pas' {frmCadCCBaixaXPatro},
  CRelValCred in 'CRelValCred.pas' {cfgRelValCred},
  CRelInscPend in 'CRelInscPend.pas' {cfgRelInscPend},
  CRelMovContr in 'CRelMovContr.pas' {cfgRelMovContr},
  CRelParamFin in 'CRelParamFin.pas' {cfgRelParamFin},
  CRelParcGer in 'CRelParcGer.pas' {cfgRelParcGer},
  dRelInscPend in 'dRelInscPend.pas' {dtmRelInscPend},
  dRelParamFin in 'dRelParamFin.pas' {dtmRelParamFin},
  FCancInscricao in 'FCancInscricao.pas' {frmCancInscricao},
  RRecebPatro in 'RRecebPatro.pas' {frmRelRecebPatro},
  FCadVerbas in 'FCadVerbas.pas' {frmCadVerbas},
  CRelConfereEnvioFolha in 'CRelConfereEnvioFolha.pas' {cfgRelConfereEnvioFolha},
  dRelConfereEnvioFolha in 'dRelConfereEnvioFolha.pas' {dtmRelConfereEnvioFolha},
  dRelFechamentoCarteiraCaixa in 'dRelFechamentoCarteiraCaixa.pas' {dtmRelFechamentoCarteiraCaixa},
  cRelFechamentoCarteiraCaixa in 'cRelFechamentoCarteiraCaixa.pas' {cfgRelFechamentoCarteiraCaixa},
  cRelFechamentoCarteiraPP in 'cRelFechamentoCarteiraPP.pas' {cfgRelFechamentoCarteiraPP},
  dRelFechamentoCarteiraPP in 'dRelFechamentoCarteiraPP.pas' {dtmRelFechamentoCarteiraPP},
  fCancRecebimento in 'fCancRecebimento.pas' {frmCancRecebimento},
  CRelContaCorrente in 'CRelContaCorrente.pas' {cfgRelContaCorrente},
  cRelItensEnvioSintCAPCAR in 'cRelItensEnvioSintCAPCAR.pas' {cfgRelItensEnvioSintCAPCAR},
  CRelQuitacaoNaoEfetivada in 'CRelQuitacaoNaoEfetivada.pas' {cfgRelQuitacaoNaoEfetivada},
  dRelQuitacaoNaoEfetivada in 'dRelQuitacaoNaoEfetivada.pas' {dtmRelQuitacaoNaoEfetivada},
  dRelContratoSemParcela in 'dRelContratoSemParcela.pas' {dtmRelContratoSemParcela},
  dRelRetencaoIOF in 'dRelRetencaoIOF.pas' {dtmRelRetencaoIOF},
  CRelRetencaoIOF in 'CRelRetencaoIOF.pas' {cfgRelRetencaoIOF},
  CRelContratoSemParcela in 'CRelContratoSemParcela.pas' {cfgRelContratoSemParcela},
  CRelContrConcSint in 'CRelContrConcSint.pas' {cfgRelContrConcSint},
  CRelDividasMutuario in 'CRelDividasMutuario.pas' {cfgRelDividasMutuario},
  CRelDividasIndexador in 'CRelDividasIndexador.pas' {cfgRelDividasIndexador},
  CRelItensDiverg in 'CRelItensDiverg.pas' {cfgRelItensDiverg},
  dRelContrConcSint in 'dRelContrConcSint.pas' {dtmRelContrConcSint},
  dRelDividasMutuario in 'dRelDividasMutuario.pas' {dtmRelDividasMutuario},
  dRelDividasIndexador in 'dRelDividasIndexador.pas' {dtmRelDividasIndexador},
  dRelItensDiverg in 'dRelItensDiverg.pas' {dtmRelItensDiverg},
  dRelItensEnvioSintCAPCAR in 'dRelItensEnvioSintCAPCAR.pas' {dtmRelItensEnvioSintCAPCAR},
  dRelContaCorrente in 'dRelContaCorrente.pas' {dtmRelContaCorrente},
  FExecGeraParcela in 'FExecGeraParcela.pas' {frmExecGeraParcela},
  dRelValCred in 'dRelValCred.pas' {dtmRelValCred},
  FExecAlteraConcessao in 'FExecAlteraConcessao.pas' {frmExecAlteraConcessao},
  FCadTipoSuspensao in 'FCadTipoSuspensao.pas' {frmCadTipoSuspensao},
  FCadTipoContrXSusp in 'FCadTipoContrXSusp.pas' {frmCadTipoContrXSusp},
  FExecTrataDivergNovo in 'FExecTrataDivergNovo.pas' {frmExecTrataDivergNovo},
  CRelConfereEnvioContrato in 'CRelConfereEnvioContrato.pas' {cfgRelConfereEnvioContrato},
  dRelConfereEnvioContrato in 'dRelConfereEnvioContrato.pas' {dtmRelConfereEnvioContrato},
  dRelItensGeradosTipoContr in 'dRelItensGeradosTipoContr.pas' {dtmRelItensGeradosTipoContr},
  cRelItensGeradosDia in 'cRelItensGeradosDia.pas' {cfgRelItensGeradosDia},
  cRelItensGeradosTipoContr in 'cRelItensGeradosTipoContr.pas' {cfgRelItensGeradosTipoContr},
  dRelItensGeradosDiaPP in 'dRelItensGeradosDiaPP.pas' {dtmRelItensGeradosDiaPP},
  cRelItensGeradosAnal in 'cRelItensGeradosAnal.pas' {cfgRelItensGeradosAnal},
  dRelItensGeradosAnal in 'dRelItensGeradosAnal.pas' {dtmRelItensGeradosAnal},
  dRelItensNaoEnviados in 'dRelItensNaoEnviados.pas' {dtmRelItensNaoEnviados},
  dRelDividasTipoContrato in 'dRelDividasTipoContrato.pas' {dtmRelDividasTipoContrato},
  CRelDividasTipoContrato in 'CRelDividasTipoContrato.pas' {cfgRelDividasTipoContrato},
  dRelParcGerSint in 'dRelParcGerSint.pas' {dtmRelParcGerSint},
  CRelParcGerSint in 'CRelParcGerSint.pas' {cfgRelParcGerSint},
  CRelValRecTMPDESCContrato in 'CRelValRecTMPDESCContrato.pas' {cfgRelValRecTMPDESCContrato},
  dRelValRecTMPDESCContrato in 'dRelValRecTMPDESCContrato.pas' {dtmRelValRecTMPDESCContrato},
  cRelItensGeradosSint in 'cRelItensGeradosSint.pas' {cfgRelItensGeradosSint},
  dRelItensGeradosSintPP in 'dRelItensGeradosSintPP.pas' {dtmRelItensGeradosSintPP},
  dRelParcGer in 'dRelParcGer.pas' {dtmRelParcGer},
  dRelDividaDuvidoso in 'dRelDividaDuvidoso.pas' {dtmRelDividaDuvidoso},
  CRelDividasPP in 'CRelDividasPP.pas' {cfgRelDividasPP},
  CRelDividaDuvidoso in 'CRelDividaDuvidoso.pas' {cfgRelDividaDuvidoso},
  FExecRecebimento in 'FExecRecebimento.pas' {frmExecRecebimento},
  dRelDividasPP in 'dRelDividasPP.pas' {dtmRelDividasPP},
  FExecLancaAlteradorEP in 'FExecLancaAlteradorEP.pas' {frmExecLancaAlteradorEP},
  FExecEntradaManual in 'FExecEntradaManual.pas' {frmExecEntradaManual},
  FExecTrataItemNaoRecebido in 'FExecTrataItemNaoRecebido.pas' {frmExecTrataItemNaoRecebido},
  FExecContabilizaLoteConcessao in 'FExecContabilizaLoteConcessao.pas' {frmExecContabilizaLoteConcessao},
  FExecDevolucaoLote in 'FExecDevolucaoLote.pas' {frmExecDevolucaoLote},
  FExecLiberaSuspensao in 'FExecLiberaSuspensao.pas' {FrmExecLiberaSuspensao},
  CRelAnaliseContabil in 'CRelAnaliseContabil.pas' {cfgRelAnaliseContabil},
  dRelAnaliseContabil in 'dRelAnaliseContabil.pas' {dtmRelAnaliseContabil},
  RLogTotalPrev in 'RLogTotalPrev.pas' {frmRelLogTotalPrev},
  RTMPDESC in 'RTMPDESC.pas' {frmRelTMPDESC},
  FCadTMPDESC in 'FCadTMPDESC.pas' {frmCadTMPDESC},
  FExecContabilizaLoteQuitacao in 'FExecContabilizaLoteQuitacao.pas' {frmExecContabilizaLoteQuitacao},
  CRelValRecTMPDESCItem in 'CRelValRecTMPDESCItem.pas' {cfgRelValRecTMPDESCItem},
  dRelValRecTMPDESCItem in 'dRelValRecTMPDESCItem.pas' {dtmRelValRecTMPDESCItem},
  cRelItensAberto in 'cRelItensAberto.pas' {cfgRelItensAberto},
  dRelItensAberto in 'dRelItensAberto.pas' {dtmRelItensAberto},
  cRelResumoContratoSaldo in 'cRelResumoContratoSaldo.pas' {cfgRelResumoContratoSaldo},
  cRelResumoContratoCaixa in 'cRelResumoContratoCaixa.pas' {cfgRelResumoContratoCaixa},
  dRelResumoContratoSaldo in 'dRelResumoContratoSaldo.pas' {dtmRelResumoContratoSaldo},
  dRelResumoContratoCaixa in 'dRelResumoContratoCaixa.pas' {dtmRelResumoContratoCaixa},
  CRelItensEnvioAnalCAPCAR in 'CRelItensEnvioAnalCAPCAR.pas' {cfgRelItensEnvioAnalCAPCAR},
  dRelItensEnvioAnalCAPCAR in 'dRelItensEnvioAnalCAPCAR.pas' {dtmRelItensEnvioAnalCAPCAR},
  FExecContabilizaLoteAmortizacao in 'FExecContabilizaLoteAmortizacao.pas' {frmExecContabilizaLoteAmortizacao},
  CRelRepasseSeguro in 'CRelRepasseSeguro.pas' {cfgRelRepasseSeguro},
  DRelRepasseSeguro in 'DRelRepasseSeguro.pas' {dtmRelRepasseSeguro},
  fCadLancaSeguro in 'fCadLancaSeguro.pas' {frmLancaDeposito},
  cRelItensEnvioSint in 'cRelItensEnvioSint.pas' {cfgRelItensEnvioSint},
  dRelItensEnvioSint in 'dRelItensEnvioSint.pas' {dtmRelItensEnvioSint},
  CRelItensEnvioAnal in 'CRelItensEnvioAnal.pas' {cfgRelItensEnvioAnal},
  dRelItensEnvioAnal in 'dRelItensEnvioAnal.pas' {dtmRelItensEnvioAnal},
  FExecContabilizaLoteEncargo in 'FExecContabilizaLoteEncargo.pas' {frmExecContabilizaLoteEncargo},
  FExecContabilizaLotePrestacao in 'FExecContabilizaLotePrestacao.pas' {frmExecContabilizaLotePrestacao},
  CRelItensEnvioContrato in 'CRelItensEnvioContrato.pas' {cfgRelItensEnvioContrato},
  FCadVerbaPlano in 'FCadVerbaPlano.pas' {frmCadVerbaPlano},
  FExecConcessaoREFER in 'FExecConcessaoREFER.pas' {frmExecConcessaoREFER},
  CRelCartaCobrEP in 'CRelCartaCobrEP.pas' {cfgRelCartaCobrEP},
  FDRelCartaCobrEP in 'FDRelCartaCobrEP.pas' {frmDesenhoRelCartaCobrEP},
  FExecEnvioLoteConcessao in 'FExecEnvioLoteConcessao.pas' {frmExecEnvioLoteConcessao},
  FCadBancoPortador in 'FCadBancoPortador.pas' {frmCadBancoPortador},
  FExecGeraArquivoRemessa in 'FExecGeraArquivoRemessa.pas' {frmExecGeraArquivoRemessa},
  FCancEnvioLoteConcessao in 'FCancEnvioLoteConcessao.pas' {frmCancEnvioLoteConcessao},
  CRelParcGerPatro in 'CRelParcGerPatro.pas' {cfgRelParcGerPatro},
  dRelParcGerPatro in 'dRelParcGerPatro.pas' {dtmRelParcGerPatro},
  FCancContabLoteConcessao in 'FCancContabLoteConcessao.pas' {frmCancContabLoteConcessao},
  FCancContabLoteQuitacao in 'FCancContabLoteQuitacao.pas' {frmCancContabLoteQuitacao},
  FCancContabLoteEncargo in 'FCancContabLoteEncargo.pas' {frmCancContabLoteEncargo},
  FCancContabLotePrestacao in 'FCancContabLotePrestacao.pas' {frmCancContabLotePrestacao},
  FCancContabLoteAmortizacao in 'FCancContabLoteAmortizacao.pas' {frmCancContabLoteAmortizacao},
  FExecLiberaConcessao in 'FExecLiberaConcessao.pas' {frmExecLiberaConcessao},
  FExecBuscaPadraoContratos in 'FExecBuscaPadraoContratos.pas' {frmExecBuscaPadraoContratos},
  mListaTipoContr in 'mListaTipoContr.pas' {MolListaTipoContr: TFrame},
  FExecCalculaSegCompl in 'fExecCalculaSegCompl.pas' {frmExecCalculaSegCompl},
  FExecAtualizaDiariaNova in 'FExecAtualizaDiariaNova.pas' {frmExecAtualizaDiariaNova},
  FExecEnvioSeguro in 'FExecEnvioSeguro.pas' {frmExecEnvioSeguro},
  FCadTipoContrXTipoContr in 'FCadTipoContrXTipoContr.pas' {frmCadTipoContrXTipoContr},
  FExecContabilizaLoteAtuDia in 'FExecContabilizaLoteAtuDia.pas' {frmExecContabilizaLoteAtuDia},
  FCancContabLoteAtuDia in 'FCancContabLoteAtuDia.pas' {frmCancContabLoteAtuDia},
  FExecCalculoRepasse in 'FExecCalculoRepasse.pas' {frmCalculoRepasse},
  FExecTrataInesperado in 'FExecTrataInesperado.pas' {frmExecTrataInesperado},
  FDRel in 'FDRel.pas' {frmDesenhoRel},
  CRelItensNaoEnviados in 'CRelItensNaoEnviados.pas' {cfgRelItensNaoEnviados},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  CRelFalecimento in 'CRelFalecimento.pas' {cfgRelFalecimento},
  dRelFalecimento in 'dRelFalecimento.pas' {dtmRelFalecimento},
  FCancEnvio in 'FCancEnvio.pas' {frmCancEnvio},
  CRelRetencaoIOFPP in 'CRelRetencaoIOFPP.pas' {cfgRelRetencaoIOFPP},
  dRelRetencaoIOFPP in 'dRelRetencaoIOFPP.pas' {dtmRelRetencaoIOFPP},
  CRelConfereParcela in 'CRelConfereParcela.pas' {cfgRelConfereParcela},
  cRelItensGeradosSintPP in 'cRelItensGeradosSintPP.pas' {cfgRelItensGeradosSintPP},
  cRelItensGeradosDiaPP in 'cRelItensGeradosDiaPP.pas' {cfgRelItensGeradosDiaPP},
  dRelItensGeradosDia in 'dRelItensGeradosDia.pas' {dtmRelItensGeradosDia},
  dRelItensGeradosSint in 'dRelItensGeradosSint.pas' {dtmRelItensGeradosSint},
  dRelDividas in 'dRelDividas.pas' {dtmRelDividas},
  CRelDividas in 'CRelDividas.pas' {cfgRelDividas},
  cRelFechamentoCarteiraLinear in 'cRelFechamentoCarteiraLinear.pas' {cfgRelFechamentoCarteiraLinear},
  cRelFechamentoCarteira in 'cRelFechamentoCarteira.pas' {cfgRelFechamentoCarteira},
  dRelFechamentoCarteiraLinear in 'dRelFechamentoCarteiraLinear.pas' {dtmRelFechamentoCarteiraLinear},
  dRelFechamentoCarteira in 'dRelFechamentoCarteira.pas' {dtmRelFechamentoCarteira},
  FExecEstornoIndividual in 'FExecEstornoIndividual.pas' {frmExecEstornoIndividual},
  dRelConciliaContabPP in 'dRelConciliaContabPP.pas' {dtmRelConciliaContabPP},
  CRelConciliaContabPP in 'CRelConciliaContabPP.pas' {cfgRelConciliaContabPP},
  CRelConciliaContabCC in 'CRelConciliaContabCC.pas' {cfgRelConciliaContabCC},
  dRelConciliaContabCC in 'dRelConciliaContabCC.pas' {dtmRelConciliaContabCC},
  CRelConciliaContab in 'CRelConciliaContab.pas' {cfgRelConciliaContab},
  dRelConciliaContab in 'dRelConciliaContab.pas' {dtmRelConciliaContab},
  dRelFechaCarteiraLinearPP in 'dRelFechaCarteiraLinearPP.pas' {dtmRelFechaCarteiraLinearPP},
  FExecContabilizaLoteAjuste in 'FExecContabilizaLoteAjuste.pas' {frmExecContabilizaLoteAjuste},
  FCancContabLoteAjuste in 'FCancContabLoteAjuste.pas' {frmCancContabLoteAjuste},
  FExecArqSupensaoCobranca in 'FExecArqSupensaoCobranca.pas' {frmExecArqSupensaoCobranca},
  dRelConfereParcela in 'dRelConfereParcela.pas' {dtmRelConfereParcela},
  FExecCriticaCaixa in 'FExecCriticaCaixa.pas' {frmCriticaCaixa},
  dRelItensEnvioContrato in 'dRelItensEnvioContrato.pas' {dtmRelItensEnvioContrato},
  CRelValorAtualizado in 'CRelValorAtualizado.pas' {cfgRelValorAtualizado},
  dRelValorAtualizado in 'dRelValorAtualizado.pas' {dtmRelValorAtualizado},
  FExecValorAtualizadoArquivo in 'FExecValorAtualizadoArquivo.pas' {frmExecValorAtualizadoArquivo},
  FPessoaSeguradora in 'FPessoaSeguradora.pas' {frmPessoaSeguradora},
  fLerArquivoSIAFI in 'fLerArquivoSIAFI.pas' {frmLerArquivoSIAFI},
  fGerarArquivoSIAFI in 'fGerarArquivoSIAFI.pas' {frmGerarArquivoSIAFI},
  CRelFalecimentoSemQuitacao in 'CRelFalecimentoSemQuitacao.pas' {cfgRelFalecimentoSemQuitacao},
  dRelFalecimentoSemQuitacao in 'dRelFalecimentoSemQuitacao.pas' {dtmRelFalecimentoSemQuitacao},
  FExecGeraArquivoMargem13 in 'FExecGeraArquivoMargem13.pas' {frmExecGeraArquivoMargem13},
  fCadContratoPadrao in 'fCadContratoPadrao.pas' {frmCadastroContratoPadrao},
  FExecLancParcAtu in 'FExecLancParcAtu.pas' {frmExecLancaParcAtu},
  CRelConferePlanilha in 'CRelConferePlanilha.pas' {cfgRelConferePlanilha},
  dRelConferePlanilha in 'dRelConferePlanilha.pas' {dtmRelConferePlanilha},
  CRelValRecTMPDESC in 'CRelValRecTMPDESC.pas' {cfgRelValRecTMPDESC},
  dRelValRecTMPDESC in 'dRelValRecTMPDESC.pas' {dtmRelValRecTMPDESC},
  CRelConciliaCaPCar in 'CRelConciliaCaPCar.pas' {cfgRelConciliaCaPCar},
  CRelConciliaFolhaPP in 'CRelConciliaFolhaPP.pas' {cfgRelConciliaFolhaPP},
  dRelConciliaCaPCar in 'dRelConciliaCaPCar.pas' {dtmRelConciliaCapCar},
  dRelConciliaFolhaPP in 'dRelConciliaFolhaPP.pas' {dtmRelConciliaFolhaPP},
  CRelItensEnvioCapCarPP in 'CRelItensEnvioCapCarPP.pas' {cfgRelItensEnvioCapCarPP},
  dRelItensEnvioCapCarPP in 'dRelItensEnvioCapCarPP.pas' {dtmRelItensEnvioCapCarPP},
  CRelValCredPlanoPatro in 'CRelValCredPlanoPatro.pas' {cfgRelValCredPlanoPatro},
  dRelValCredPlanoPatro in 'dRelValCredPlanoPatro.pas' {dtmRelValCredPlanoPatro},
  CRelProvPerdaOutros in 'CRelProvPerdaOutros.pas' {cfgRelProvPerdaOutros},
  CRelProvPerdaFUNCEF in 'CRelProvPerdaFUNCEF.pas' {cfgRelProvPerdaFUNCEF},
  CRelConciliaContabCCPeriodo in 'CRelConciliaContabCCPeriodo.pas' {cfgRelConciliaContabCCPeriodo},
  CRelConciliaContabPeriodo in 'CRelConciliaContabPeriodo.pas' {cfgRelConciliaContabPeriodo},
  CRelConciliaContabPPPeriodo in 'CRelConciliaContabPPPeriodo.pas' {cfgRelConciliaContabPPPeriodo},
  dRelConciliaContabCCPeriodo in 'dRelConciliaContabCCPeriodo.pas' {dtmRelConciliaContabCCPeriodo},
  dRelConciliaContabPeriodo in 'dRelConciliaContabPeriodo.pas' {dtmRelConciliaContabPeriodo},
  dRelConciliaContabPPPeriodo in 'dRelConciliaContabPPPeriodo.pas' {dtmRelConciliaContabPPPeriodo},
  FCadItemXProcesso in 'FCadItemXProcesso.pas' {frmCadItemXProcesso},
  FCancEnvioLoteSeguro in 'FCancEnvioLoteSeguro.pas' {frmCancEnvioLoteSeguro},
  FExecEnvioLoteSeguro in 'FExecEnvioLoteSeguro.pas' {frmExecEnvioLoteSeguro},
  FExecCalculaValorMaximo in 'FExecCalculaValorMaximo.pas' {frmCalculaValorMaximo},
  FExecCalculaValorDevido in 'FExecCalculaValorDevido.pas' {frmCalculaValorDevido},
  CRelContratoDuplicidade in 'CRelContratoDuplicidade.pas' {cfgRelContratoDuplicidade},
  dRelContratoDuplicidade in 'dRelContratoDuplicidade.pas' {dtmRelContratoDuplicidade},
  CRelQuitacaoComSaldoDevedor in 'CRelQuitacaoComSaldoDevedor.pas' {cfgRelQuitacaoComSaldoDevedor},
  dRelQuitacaoComSaldoDevedor in 'dRelQuitacaoComSaldoDevedor.pas' {dtmRelQuitacaoComSaldoDevedor},
  FCancAlteracaoConcessao in 'fCancAlteracaoConcessao.pas' {frmCancAlteracaoConcessao},
  FExecAtualizaDiaria in 'FExecAtualizaDiaria.pas' {frmExecAtualizaDiaria},
  FCadPortFormaxEmptmo in 'FCadPortFormaxEmptmo.pas' {frmCadPortFormaxEmptmo},
  FSuspensaoConcessao in 'FSuspensaoConcessao.pas' {frmSuspensaoConcessao},
  FCmReport in '..\..\CM\Forms\Source\FCmReport.pas' {FrmCmReport},
  fParamReports_Padrao in '..\..\CM\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  uCmCtrlRptCentralAP in '..\..\CENTRALAP\Fontes\uCmCtrlRptCentralAP.pas',
  dRel2ViaCChequeMT in '..\..\FOLHA\CMFolhaObjMt\Source\dRel2ViaCChequeMT.pas' {DtmRel2ViaCChequeMT},
  FPRel2ViaCChequeMT in '..\..\FOLHA\CMFolhaObjMt\Source\FPRel2ViaCChequeMT.pas' {frmPRel2ViaCChequeMT},
  uCtrl2ViaContraCheque in '..\..\Folha\CMFolhaObjMt\Source\uCtrl2ViaContraCheque.pas',
  fQuitacaoLote in 'fQuitacaoLote.pas',
  FEvolucaoContrato in 'FEvolucaoContrato.pas' {frmEvolucaoContrato},
  FEmprestimosQuitados in 'FEmprestimosQuitados.pas' {frmEmprestimosQuitados},
  FSaldoResidual in 'FSaldoResidual.pas' {FrmSaldoResidual},
  FManutContratoAd in 'FManutContratoAd.pas' {FrmManutContratoAd},
  FMapaMovimentacao in 'FMapaMovimentacao.pas' {frmMapaMovimentacao},
  FValorMaximoPrestacao in 'FValorMaximoPrestacao.pas' {FrmValorMaximoPrestacao},
  FCadSuspConcPlaPrev in 'FCadSuspConcPlaPrev.pas' {frmCadSuspConcPlaPrev},
  FExecEnvioExcessoCobranca in 'FExecEnvioExcessoCobranca.pas' {frmExecEnvioExcessoCobranca},
  FPagtoEmprestimoResgate in 'FPagtoEmprestimoResgate.pas' {frmPagtoEmprestimoResgate},
  FRecebtoEmprestimoResgate in 'FRecebtoEmprestimoResgate.pas' {frmRecebtoEmprestimoResgate},
  RContrato in 'RContrato.pas' {frmRelContrato},
  dRelInscricao in '..\..\EMPRESTIMOBPL\Interface\Source\dRelInscricao.pas' {dtmRelInscricao},
  FCadInscricao in '..\..\EMPRESTIMOBPL\Interface\Source\FCadInscricao.pas' {frmCadInscricao},
  FCadMotivoConcessao in 'fCadMotivoConcessao.pas' {frmCadMotivoConcessao},
  fInfoEventoConbranca in 'fInfoEventoConbranca.pas' {FrmInfoEventoCobranca},
  FRestrCobranca in 'FRestrCobranca.pas' {frmRestrCobranca},
  FBloqConcessao in 'FBloqConcessao.pas' {FrmBloqConcessao},
  FEventoCobrancaContrato in 'FEventoCobrancaContrato.pas' {FrmEventoCobrancaContrato},
  FTransferePerfilInves in 'FTransferePerfilInves.pas' {frmTransferePerfilInvest},
  FImportacaoIRHabitacional in 'FImportacaoIRHabitacional.pas' {FrmImportacaoIRHabitacional},
  FAlteracaoLoteDataVencimento in 'FAlteracaoLoteDataVencimento.pas' {FrmAlteracaoLoteDataVencimento},
  FEmpSicov in 'FEmpSicov.pas' {FrmEmpSicov},
  uCtrlFuncoesCapCar in '..\..\CMCAPCARUTILOBJ50\CtrlObjects\uCtrlFuncoesCapCar.pas',
  FRemessaEletronica in 'FRemessaEletronica.pas' {FrmRemessaEletronica},
  mListaCodigosCNAB in '..\..\EMPRESTIMOBPL\Objetos\Source\mListaCodigosCNAB.pas' {molListaCodigosCNAB: TFrame},
  FImportacaoInformeIR in 'FImportacaoInformeIR.pas' {FrmImportacaoInformeIR},
  FCadMensagemContrato in 'FCadMensagemContrato.pas' {FrmCadMensagemContrato},
  CRelInadimplencia in 'CRelInadimplencia.pas' {frmCRelInadimplencia};

{frmQuitacaoLote}
 // FixBDE4GbBug in 'FixBDE4GbBug.pas';

{$R *.RES}
{$R EMPRESTIMO_RES.RES}


begin
  frmCmEntrada := TfrmCmEntrada.Create(Application);
  frmCmEntrada.Show;
  frmCmEntrada.Update;

  //Sistema := TSistema.Create('Emprestimo');

  Application.Initialize;
  Application.Title := 'Emprestimo';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TFrmCmReport, FrmCmReport);
  Application.CreateForm(TfrmParamReports_Padrao, frmParamReports_Padrao);
  Application.CreateForm(TDtmRel2ViaCChequeMT, DtmRel2ViaCChequeMT);
  Application.CreateForm(TfrmPRel2ViaCChequeMT, frmPRel2ViaCChequeMT);
  frmCmEntrada.Hide;
  frmPrincipal.show;    // Andre Imakawa - SIG - 52331
  frmPrincipal.Update;  // Andre Imakawa - SIG - 52331
  frmCmEntrada.Free;


  Application.Run;

  IntegraBack.Free;
  //Sistema.Free;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Emprestimo
================================================================================
CM$VER      3.01.18p    19/06/2008
--------------------------------------------------------------------------------
Pendência 28219 - Ajuste no Envio de informações para o Contas a Pagar
- Alterada a forma como são atirbuídos os valores para o vetor vContaBaixa, alterando condição específica e incluindo uma nova variável.
================================================================================
CM$VER      3.01.18o    09/06/2008
--------------------------------------------------------------------------------
- Pendencia 28071: Geração de Arquivo para o Banco
  Ajuste do processo para abrir e fechar transação na geração de arquivo para
  banco
================================================================================
CM$VER      3.01.18n    02/06/2008
--------------------------------------------------------------------------------
- Pendencia 27998: Relatório de Quitações com Saldo Devedor ou Valores em Aberto
  Ajuste nos filtros e melhoria na performance na query do relatório
- Pendencia 27875: Telas de Busca de Contrato e Solicitante
  A pedido, quando o usuário conectado no sistema for Luciana Freitas, o resultado da 
  busca ficará armazenado.
================================================================================
CM$VER      3.01.18m    23/05/2008
--------------------------------------------------------------------------------
- Pendencia 27915: Relatório de Valores Atualizados por Contrato
  Ajuste na ordenação dos dados a serem exibidos no relatório
- Pendencia 27929: Ciclo Normal / Envio
  Ajuste no envio para aumento de performance durante o processo de marcar / desmarcar
  itens em atraso a serem enviados
- Pendencia 27961: Transações / Amortização e Refinanciamento
  Não permite inclusão de amortização caso exista outra amortização em aberto.
================================================================================
CM$VER      3.01.18l    28/04/2008
--------------------------------------------------------------------------------
- Pendencia 26364: Inscrição / Concessão / Renovação
  Ajuste na query de entrada para o campo VLREMABERTO da regra de Validação de
  Tipo de Contrato de Empréstimo.
================================================================================
CM$VER      3.01.18k    25/04/2008
--------------------------------------------------------------------------------
- Pendência 27232 - Simulação de empréstimos: Avaliação de ítens em aberto de empréstimos anteriores selecionados por regra conforme o tipo de contrato.
- Pendência 27749 - Simulação de empréstimos: Avaliação do valor de parcela inicial superior a margem consignável realizado dependendo da parametrização no tipo de contrato.
================================================================================
CM$VER      3.01.18j    24/04/2008
--------------------------------------------------------------------------------
- Pendência 27720 - Desfazer Envio: Ajuste na seleção de informações com filtro por data de envio e otimização na busca por um único contrato.
================================================================================
CM$VER      3.01.18i    26/03/2008
--------------------------------------------------------------------------------
- Pendência 27641 - Envio de Concessões em Lote: Ajuste na seleção do plano contábil.
================================================================================
CM$VER      3.01.18h    24/03/2008
--------------------------------------------------------------------------------
- Pendência 27632 - Contabilização de Encargos: Ajuste na seleção de dados de encargos abonados.
================================================================================
CM$VER      3.01.18g    10/03/2008
--------------------------------------------------------------------------------
- Pendência 27570 - Relatório de Conta Corrente / Controle da Carteira de Empréstimos
  Ajuste na query do relatório para ilustrar a data de quitação
================================================================================
CM$VER      3.01.18f    28/02/2008
--------------------------------------------------------------------------------
- Pendência 27490 - Ajuste na selecão do plano durante o envio.
================================================================================
CM$VER      3.01.18e    25/02/2008
--------------------------------------------------------------------------------
- Pendência 27425 - Entrada Manual de Cobranças e Devoluções: Ajuste na chamada da atualização de saldo.
================================================================================
CM$VER      3.01.18d    19/02/2008
--------------------------------------------------------------------------------
- Pendencia 26144: Entrada Manual de Cobranças e Devoluções
  Ajustes na pendência conforme solicitação da FUNCEF, para corrigir critica apresen-
  tada no processo de alteração de dados já lançados
================================================================================
CM$VER      3.01.18c    15/02/2008
--------------------------------------------------------------------------------
Pendência: 27370 - Ajuste e atualização dos helps do sistema...
================================================================================
CM$VER      3.01.18b    31/01/2008
--------------------------------------------------------------------------------
- Pendência 27333 - Consulta / Relatórios: Ajuste no filtro de situação do participante.
================================================================================
CM$VER      3.01.18a    21/01/2008
--------------------------------------------------------------------------------
- Pendência 27206 - Relatório de Quitações por Falecimento: 
  Ajuste no filtro de datas.
- Pendência 27205 - 
  Ajuste no filtro de tipo de empréstimo utilizado nos relatórios e nas telas.
- Pendência 27120 - Desfazer envio: Ajuste na recuperação dos itens em aberto.
- Pendência 26916 - Inscrição / Contratação / Renovação:
  Ajuste na verificação da quitação de contratos anteriores por tipo de empréstimo e tipo de contrato.
- Pendência 26481 - Entrada Manual: Ajuste no disparo da atualização diária após inclusão e exclusão
  de uma entrada manual, para garantir que não sobrem itens posteriores que deveriam ser estornados;
- Pendências 23358/26875/26896 - Recebimento: Criada nova verificação: se houver itens de IOF ou Seguro
  Complementar (cadastro de itens por processo) no recebimento zerado de uma amortização, fica caracterizado
  um refinanciamento, que não poderá ser desfeito;
================================================================================
CM$VER      3.01.18     21/12/2007
--------------------------------------------------------------------------------
Liberação do padrão 18
================================================================================
CM$VER      3.01.17n    18/12/2007
--------------------------------------------------------------------------------
- Pendência 27104 - Desfazer envio: Ajuste na seleção dos tipos de contrato de empréstimo para filtragem.
- Pendência 26951 - Query da regra de valor máximo. Passagem das informações de contratos ativos com o tipo 1.
- Pendência 26950 - Query da regra de valor máximo. Inclusão das datas de assinatura, crédito e primeira parcela.
- Pendência 26919 - Consulta / Relatórios: Ajuste no filtro por plano contábil.
- Pendência 26624 - Relatório de Retenção de IOF por plano / patrocinador: Ajuste na descrição dos planos apresentados no relatório.
================================================================================
CM$VER      3.01.17m    12/12/2007
--------------------------------------------------------------------------------
- Pendencia 26943: Recebimento automático
  Ajuste no processo de recebimento de documentos do Financeiro para contemplar valores
  negativos de forma correta
- Pendencia 27061: Inscrição / Contratação / Renovação
  Ajuste na query de entrada de valor máximo permitido
- Pendencia 26940: Contabilização de Encargos por Lote
  Ajuste na query para buscar as datas corretas em relação a possivel migração de plano
================================================================================
CM$VER      3.01.17l    10/12/2007
--------------------------------------------------------------------------------
- Pendencia 26947: Cadastro de Histórico de Suspensões
  Não existe mais filtro para exibir somente os tipos de suspensão por férias na Central de
  Atendimentos
- Pendencia 27041: Cálculo de Itens
  Passado o campo FLGUSAMARGEMALT na query de entrada das regras de cálculo
  dos itens
- Pendencia 27040: Amortização e Refinanciamento
  Somente para a FUSESC, não permite aumento de prazo de contrato no refinanciamento
- Pendencia 26267: Consulta de Contratos e Parcelas
  Não permite abrir a mesma janela mais de uma vez, evitando assim o problema das auto-
  rizações dada aos usuários
================================================================================
CM$VER      3.01.17k    13/11/2007
--------------------------------------------------------------------------------
- Relatório Retenção de IOF por prazo: Ajuste no filtro por tipo de empréstimo.
================================================================================
CM$VER      3.01.17j    08/11/2007
--------------------------------------------------------------------------------
- Pendencia 26776:
  Cadastro de Tipo de Contrato de Emprestimo: Colocados identificadores para determinar
  se o tipo de contrato é utilizado pelo Auto-Emprestimo e para permitir cancelamento ou
  alteração de concessão.
  Cancelamento de Concessão: Passa a validar se o tipo de contrato da concessão 
  permite o seu cancelamento.
  Alteração de Valores da Concessão: Passa a validar se o tipo de contrato da concessão
  permite a sua alteração.
- Pendencia 26806:
  Cadastro de Inscrição / Concessão / Renovação: Passa a armazenar a informação se 
  a concessão utilizou a margem alternativa.
  Cadastro de Tipo de Contrato de Emprestimo: Colocado identificador para a regra de 
  cálculo da data de vencimento da parcela.
  Geração de Parcelas: Caso esteja definida a regra para calculo de data de vencimento, 
  passa a respeitar a data retornada pela regra, caso contrário, continua utilizando o cadastro
  de parametização de Datas por Patrocinadora.
================================================================================
CM$VER      3.01.17i    01/11/2007
--------------------------------------------------------------------------------
- Pendência 26630 - Recebimento Automático: Ajuste na seleção de valores a baixar, quando ocorrem itens negativos.
================================================================================
CM$VER      3.01.17h    01/11/2007
--------------------------------------------------------------------------------
- Pendencia 26697: 
  Parametros do Sistema
     Criada parametrização para determinar se fundação permite ou não gerar parcela quando
     da falta de geração de atualização de saldo devedor no mes anterior
  Geração de Parcelas
     Verifica a parametrização explicitada acima para gerar ou não parcela no mes informado
================================================================================
CM$VER      3.01.17g    30/10/2007
--------------------------------------------------------------------------------
Pendencia 26614: Inscrição / Concessão / Renovação
   Ajuste no processo de atribuição de forma de pagamento
   Ajuste na validação de parcelas pagas para renovação
================================================================================
CM$VER      3.01.17f    26/10/2007
--------------------------------------------------------------------------------
- Pendencia 26614: Inscrição / Concessão / Renovação
  Conforme solicitação da FUNCEF, mostrar o valor da última parcela gerada no 
  campo referente a total de parcelas, não afetando as demais fundações.
================================================================================
CM$VER      3.01.17e    10/10/2007
--------------------------------------------------------------------------------
- Pendencia 26526: Relatorio de Valores a Receber (Folha)
  Ajuste na query quando informado o filtro por Tipo de Emprestimo
================================================================================
CM$VER      3.01.17d    09/10/2007
--------------------------------------------------------------------------------
- Pendencia 26558: Tratamento Individual de Parcelas
  Corrigido o problema de inserção de diferença na Historico de Emprestimo quando a baixa
  manual for com valor diferente do valor previsto
- Pendencia 26286: Inscrição / Concessão / Renovação
  Quando os parametros de envio não estiverem preenchidos no Cadastro de Tipo de Contrato
  o sistema busca os parametros padrão definidos na tela de Parametros do Sistema
- Pendencia 26526: Relatorio de Valores a Receber (Folha)
  Acerto na performance da query
================================================================================
CM$VER      3.01.17c    05/10/2007
--------------------------------------------------------------------------------
Pendencia 26500: Alteração de Valor de Concessão 
   Acerto na crítica para nao levar em consideração o Tipo de Contrato de Integralização
   de Reservas
Pendencia 26499: Consulta Contratos e Parcelas
   Acerto na busca dos participantes
Pendencia 26497: Ajuste da situação contratual
   Quando a Fundação trabalhar com atualização diária de saldo devedor, o sistema verifica
   se o contrato possui saldo devedor DIFERENTE de Zero.
================================================================================
CM$VER      3.01.17b    04/10/2007
--------------------------------------------------------------------------------
- Pendencia 26480 - Recebimento Automático: Ajuste de erro de execução ao confirmar
- Pendência 26489 - Cadastro de Tipo de Contrato - Inclusão de flag indicador se a modalidade de contrato está disponível para o módulo de AutoEmprestimo.
================================================================================
CM$VER      3.01.17a    27/09/2007
--------------------------------------------------------------------------------
- Pendencia 26443: Ciclo Normal / Inscrição / Concessão / Renovação
  Para a regra de data da primeira parcela, foram incluidos campos com identificação 
  de dados do mutuário solicitante, bem como informações da concessão.
- Pendência 26441 - Cancelamento de Envio: Ajuste na seleção de registros para processamento.
- Pendência 26440 - Cancelamento de Quitação: Ajuste na exclusão de documento no Contas a Receber.
- Pendencia 26405: Ciclo Normal / Inscrição / Concessão / Renovação
  Colocado como autorização de acesso o campo Data da primeira parcela
- Pendencia 26402:  
   Sistema / Parametros do sistema: 
     Criados os parâmetros:
        "Utiliza cálculo de Margem Consignável Alternativa (Fundação + INSS)" e
        "Obriga Avalista se selecionada a Margem Consignável Alternativa"
   Cadastros / Tipo de Contrato de Emprestimo
      Criados os parâmetros para as regras:
         "Margem Consignável Alternativa ( Fundação + INSS)"
         "Margem Consignável do Avalista"
         "Elegibilidade do Avalista"
   Ciclo Normal / Inscrição / Concessão / Renovação
      . Se estiver assinalado o parâmetro "Utiliza cálculo de Margem Consignável Alternativa (Fundação + INSS)" 
        o sistema habilita os controles correspondentes, bem como executa a regra parametrizada
        no campo Regra para Margem Consignável Alternativa ( Fundação + INSS).
      . Se estiver assinalado o parâmetro "Obriga Avalista se selecionada a Margem Consignável Alternativa"
        o sistema obriga a informação de 1 avalista. Ao selecionar o avalista, o sistema irá executar 
        as regras "Margem Consignável do Avalista" e "Elegibilidade do Avalista"
      . O sistema passa a utilizar a parametrização de plano previdenciário x plano contábil
================================================================================
CM$VER      3.01.17     25/09/2007
--------------------------------------------------------------------------------
- Liberação do padrão 17
- Pendência 26323 - Contratos quitáveis por tipo de contrato: Ajuste na inclusão de novas linhas.
- Pendência 26324 - Geração de arquivo bancários: Ajuste na seleção de lançamentos por documento.
- Pendência 26325 - Itens por tipo de contrato: Ajuste na mensagem após verificação de inclusão de detalhamento do item. 
- Pendencia 232160 : Relatórios Diversos
  Ajuste nas queries para contemplar migração de plano contábil
- Pendencia 24138: Lançamento de prestações atualizadas: Possibilidade de lançamento
  de cada item calculado ao invés de lançar os valores agrupados em um único item
- Pendencia 23547: Calculo e envio de rubrica informatica de valor devido:
  Criação de filtro por Folha Patrocinadora e Folha Beneficio
  Permite desfazer a geração anterior
- Pendencia 23097: Relatório de Extrato de Movimentação: demonstra se o item foi quitado
  ou abonado
- Pendencia 24953: O processo foi contemplado na pendencia 24138
- Pendencia 26144: Entrada Manual de Cobranças e Devoluções.
  No processo de alteração, o sistema não irá trocar automaticamente os valores dos campos
  correspondentes a Valor Previsto, Envio e Dados de Baixa do item
================================================================================
CM$VER      3.01.16v    08/11/2007
--------------------------------------------------------------------------------
- Pendencia 26776:
  Cadastro de Tipo de Contrato de Emprestimo: Colocados identificadores para determinar
  se o tipo de contrato é utilizado pelo Auto-Emprestimo e para permitir cancelamento ou
  alteração de concessão.
  Cancelamento de Concessão: Passa a validar se o tipo de contrato da concessão 
  permite o seu cancelamento.
  Alteração de Valores da Concessão: Passa a validar se o tipo de contrato da concessão
  permite a sua alteração.
- Pendencia 26806:
  Cadastro de Inscrição / Concessão / Renovação: Passa a armazenar a informação se 
  a concessão utilizou a margem alternativa.
  Cadastro de Tipo de Contrato de Emprestimo: Colocado identificador para a regra de 
  cálculo da data de vencimento da parcela.
  Geração de Parcelas: Caso esteja definida a regra para calculo de data de vencimento, 
  passa a respeitar a data retornada pela regra, caso contrário, continua utilizando o cadastro
  de parametização de Datas por Patrocinadora.
================================================================================
CM$VER      3.01.16u    01/11/2007
--------------------------------------------------------------------------------
- Pendência 26630 - Recebimento Automático: Ajuste na seleção de valores a baixar, quando ocorrem itens negativos.
================================================================================
CM$VER      3.01.16t    01/11/2007
--------------------------------------------------------------------------------
- Pendencia 26697: 
  Parametros do Sistema
     Criada parametrização para determinar se fundação permite ou não gerar parcela quando
     da falta de geração de atualização de saldo devedor no mes anterior
  Geração de Parcelas
     Verifica a parametrização explicitada acima para gerar ou não parcela no mes informado
================================================================================
CM$VER      3.01.16s    29/10/2007
--------------------------------------------------------------------------------
- Pendencia 26614: Inscrição / Concessão / Renovação
  Acerto nas criticas de contratos anteriores a serem quitados
  Acerto no cadastro de assinatura de contrato padrão
================================================================================
CM$VER      3.01.16r    26/10/2007
--------------------------------------------------------------------------------
- Pendencia 26614: Inscrição / Concessão / Renovação
  Acerto na query que busca os contratos anteriores.
================================================================================
CM$VER      3.01.16q    25/10/2007
--------------------------------------------------------------------------------
- Pendencia 26614: Inscrição / Concessão / Renovação
  Conforme solicitação da FUNCEF, mostrar o valor da última parcela gerada no 
  campo referente a total de parcelas, não afetando as demais fundações.
================================================================================
CM$VER      3.01.16p    22/10/2007
--------------------------------------------------------------------------------
- Pendencia 26526: Relatorio de Valores a Receber (Folha)
  Ajuste na query quando informado o filtro por Tipo de Emprestimo
================================================================================
CM$VER      3.01.16o    09/10/2007
--------------------------------------------------------------------------------
- Pendencia 26558: Tratamento Individual de Parcelas
  Corrigido o problema de inserção de diferença na Historico de Emprestimo quando a baixa
  manual for com valor diferente do valor previsto
- Pendencia 26286: Inscrição / Concessão / Renovação
  Quando os parametros de envio não estiverem preenchidos no Cadastro de Tipo de Contrato
  o sistema busca os parametros padrão definidos na tela de Parametros do Sistema
- Pendencia 26526: Relatorio de Valores a Receber (Folha)
  Acerto na performance da query
================================================================================
CM$VER      3.01.16n    05/10/2007
--------------------------------------------------------------------------------
Pendencia 26500: Alteração de Valor de Concessão 
   Acerto na crítica para nao levar em consideração o Tipo de Contrato de Integralização
   de Reservas
Pendencia 26499: Consulta Contratos e Parcelas
   Acerto na busca dos participantes
Pendencia 26497: Ajuste da situação contratual
   Quando a Fundação trabalhar com atualização diária de saldo devedor, o sistema verifica
   se o contrato possui saldo devedor DIFERENTE de Zero.
================================================================================
CM$VER      3.01.16m    04/10/2007
--------------------------------------------------------------------------------
Complementação da pendência 26402: 
 Acerto na busca da parametrização contábil dos itens
 Ao selecionar a margem alternativa, o sistema refaz os cálculos no processo de concessão
 de Emprestimos
================================================================================
CM$VER      3.01.16l    03/10/2007
--------------------------------------------------------------------------------
- Pendencia 26480 - Recebimento Automático: Ajuste de erro de execução ao confirmar
- Pendência 26489 - Cadastro de Tipo de Contrato - Inclusão de flag indicador se a modalidade de contrato está disponível para o módulo de AutoEmprestimo.
================================================================================
CM$VER      3.01.16k    27/09/2007
--------------------------------------------------------------------------------
- Pendencia 26402:  
   Sistema / Parametros do sistema: 
     Criados os parâmetros:
        "Utiliza cálculo de Margem Consignável Alternativa (Fundação + INSS)" e
        "Obriga Avalista se selecionada a Margem Consignável Alternativa"
   Cadastros / Tipo de Contrato de Emprestimo
      Criados os parâmetros para as regras:
         "Margem Consignável Alternativa ( Fundação + INSS)"
         "Margem Consignável do Avalista"
         "Elegibilidade do Avalista"
   Ciclo Normal / Inscrição / Concessão / Renovação
      . Se estiver assinalado o parâmetro "Utiliza cálculo de Margem Consignável Alternativa (Fundação + INSS)" 
        o sistema habilita os controles correspondentes, bem como executa a regra parametrizada
        no campo Regra para Margem Consignável Alternativa ( Fundação + INSS).
      . Se estiver assinalado o parâmetro "Obriga Avalista se selecionada a Margem Consignável Alternativa"
        o sistema obriga a informação de 1 avalista. Ao selecionar o avalista, o sistema irá executar 
        as regras "Margem Consignável do Avalista" e "Elegibilidade do Avalista"
      . O sistema passa a utilizar a parametrização de plano previdenciário x plano contábil
- Pendencia 26405: Ciclo Normal / Inscrição / Concessão / Renovação
  Colocado como autorização de acesso o campo Data da primeira parcela
- Pendencia 26443: Ciclo Normal / Inscrição / Concessão / Renovação
  Para a regra de data da primeira parcela, foram incluidos campos com identificação 
  de dados do mutuário solicitante, bem como informações da concessão.
================================================================================
CM$VER      3.01.16j    27/09/2007
--------------------------------------------------------------------------------
- Pendência 26440 - Cancelamento de Quitação: Ajuste na exclusão de documento no Contas a Receber.
- Pendência 26441 - Cancelamento de Envio: Ajuste na seleção de registros para processamento.
================================================================================
CM$VER      3.01.16i    24/09/2007
--------------------------------------------------------------------------------
- Pendência 26190 - Cadastro de Banco x Conta-Caixa x Forma Recebimento de Empréstimos: Implementação de tela para associar portador forma ao módulo de empréstimo.
================================================================================
CM$VER      3.01.16h    19/09/2007
--------------------------------------------------------------------------------
- Pendencia 26318: Ciclo Normal / Inscrição / Concessão / Renovação
  Quando concessão for excepcional, permite concessão mesmo quando o tipo de contrato 
  estiver na lista interna de impedimentos.
================================================================================
CM$VER      3.01.16g    18/09/2007
--------------------------------------------------------------------------------
- Pendência 26188 - Tratamento individual de Parcelas: Disponibilização da opção "não enviar".
- Pendência 26189 - Tratamento de intens não recebidos: Disponibilização da escolha de portador forma para envio ao Financeiro.
- Pendência 26194 - Envio para o Contas a Receber: Ajuste na mensagem enviada para geração do boleto.
================================================================================
CM$VER      3.01.16f    12/09/2007
--------------------------------------------------------------------------------
- Pendência 26323 - Contratos quitáveis por tipo de contrato: Ajuste na inclusão de novas linhas.
- Pendência 26324 - Geração de arquivo bancários: Ajuste na seleção de lançamentos por documento.
- Pendência 26325 - Itens por tipo de contrato: Ajuste na mensagem após verificação de inclusão de detalhamento do item. 
================================================================================
CM$VER      3.01.16e    10/09/2007
--------------------------------------------------------------------------------
- Pendencia 26303: Ciclo Normal / Envio
  Quando o item a ser enviado for uma cobrança de ajuste de concessão (devolução por 
  parte do mutuário de concessão paga a maior), o sistema irá  gravar o valor absoluto do
  item a ser cobrado do mutuário.
================================================================================
CM$VER      3.01.16d    28/08/2007
--------------------------------------------------------------------------------
- Pendencia 26215: Inscrição / Concessão / Renovação
  Acerto na query de entrada da regra que verifica obrigatoriedade de avalistas
- Pendencia 26177: Colocado como formato de data padrão 'DD/MM/AAAA' em todo 
  o sistema
================================================================================
CM$VER      3.01.16c    20/08/2007
--------------------------------------------------------------------------------
- Pendencia 26144: Entrada Manual de Cobranças e Devoluções.
  No processo de alteração, o sistema não irá trocar automaticamente os valores dos campos
  correspondentes a Valor Previsto, Envio e Dados de Baixa do item
================================================================================
CM$VER      3.01.16b    30/07/2007
--------------------------------------------------------------------------------
- Pendência 25959 - Alteração de concessão: Ajuste no cálculo dos itens da alteração de concessão.
- Pendência 25953 - Concessão/Inscrição: Implementação de novas informações para regra de obrigatoriedade de avalista.
================================================================================
CM$VER      3.01.16a    25/07/2007
--------------------------------------------------------------------------------
- Pendência 25759 - Relatório de Retenção de IOF por Plano: Otimização da busca de informações.
(processo utiliza funções F_MIGRAEP_DATA, F_MIGRAEP_PLANO e F_MIGRAEP_PATRO no banco de dados)
- Pendência 25971 - Concessão/Inscrição: Ajuste na seleção de tipos de contrato de empréstimo disponíveis ao mutuário.
================================================================================
CM$VER      3.01.16     20/07/2007
--------------------------------------------------------------------------------
- Liberação para versão do padrão 16
- Pendência 25481 - Relatório de Contratos sem parcelas geradas: Ajuste no filtro por tipo de empréstimo.
- Pendência 25141 - Ajuste para não apresentar portador-forma inativo nas seleções.
- Pendência 23407 - Concessão/Inscrição: Parametrização de verificação de contratos ativos por tipo de contrato.
- Pendência 23319 - Tratamento de Divergências: Ajuste na gravação do campo observação dos itens.
- Pendência 22752 - Quitação antecipada: Data de falecimento habilitada somente se o respectivo flag estiver marcado.
- Pendência 22666 - Envio: Devoluções de prestação enviadas para o contas a receber com valor negativo.
- Pendência 22641 - Ajuste na gravação na TMPDESC do mês de referência da primeira assinatura de contrato padrão do tipo de contrato da prestação.
- Pendência 22042 - Ajuste na seleção de mutuário nas telas utilizadas pela Central de Atendimento.
- Pendência 20071 - Lançamento de Prestações Atualizadas; Implementação.
- Pendência 25624 - Tratamento de divergências: Ajuste para evitar duplicidade no histórico de documentos por movimentação de empréstimo.
- Pendência 22718 - Cadastro de Itens por Tipo de Contrato: Parametrização de estorno do item após quitação.
================================================================================
CM$VER      3.01.15j    30/07/2007
--------------------------------------------------------------------------------
- Pendência 25959 - Alteração de concessão: Ajuste no cálculo dos itens da alteração de concessão.
================================================================================
CM$VER      3.01.15i    25/07/2007
--------------------------------------------------------------------------------
- Pendência 25759 - Relatório de Retenção de IOF por Plano: Otimização da busca de informações.
(processo utiliza funções F_MIGRAEP_DATA, F_MIGRAEP_PLANO e F_MIGRAEP_PATRO no banco de dados)
================================================================================
CM$VER      3.01.15h    20/07/2007
--------------------------------------------------------------------------------
- Pendencia 25740: Tratamento de Divergências
  Alteração no conceito do processo de busca dos itens divergentes. Anteriormente o sistema
  buscava todos os itens divergentes do(s) contrato(s), podendo ocasionar um número 
  excessivo de registros gerando estouro de memória ou até mesmo perda de performance.
  Com o novo conceito, o sistema busca a(s) parcela(s) do(s) contrato(s) que possuam 
  inadimplência, totalizando os valores devidos por parcela, não demonstrando na tela os
  itens divergentes de forma individualizada, mas agrupados por parcela. Dessa forma,
  evita-se a possibilidade de estouro de memória e aumenta-se a performance do processo.
  Internamente, os cálculos se mantém conforme o processo anterior.
- Pendência 26071 - Assinatura de contrato padrão: Ajuste na seleção de tipos de contrato sem plano vinculado.
- Pendência 26075 - Histórico de suspensão: Ajuste na query utilizada na regra de validação.
- Pendencia 26085 - Tratamento Individual de Parcelas: Ajuste na totalização dos itens a serem enviados.
================================================================================
CM$VER      3.01.15g    18/07/2007
--------------------------------------------------------------------------------
- Pendência 25481 - Relatório de Contratos sem parcelas geradas: Ajuste no filtro por tipo de empréstimo.
- Pendencia 26031: Acerto no processo de habilitação de botões após procurar um contrato
- Pendencia 26023: Quando ocorrer amortização antes da geração de algum item de parcela,
  grava a taxa de juros referente à concessão no registro da amortização, evitando assim,
  erro na geração da parcela após a amortização
================================================================================
CM$VER      3.01.15f    11/07/2007
--------------------------------------------------------------------------------
- Pendencia 25812:
  Parâmetros do Sistema: Criação de Parâmetro para permitir ou não amortizações com 
                                      data retroativa à ultima atualização de saldo devedor
  Amortização/Refinanciamento: Efetua crítica de data de amortização conforme 
                                                parametrização acima.
- Pendencia 25808: Desfazer contabilização em lote
  Retirada a crítica que verificava se uma planilha estava como efetivada
- Pendencia 25814: Inscrição / Concessão / Renovação
  Busca o plano contábil dos assistidos com base no benefício ativo
- Pendência 25953 - Concessão/Inscrição: Implementação de novas informações para regra de obrigatoriedade de avalista.
================================================================================
CM$VER      3.01.15e    09/07/2007
--------------------------------------------------------------------------------
- Pendencia 25759: Relatório de Retenção de IOF por Plano / Patrocinadora
  Acerto na query para evitar "produto cartesiano"
- Pendência 25772 - Cálculo de Itens de Quitação: Ajuste para não considerar itens quitados, abonados e estornados.
- Pendência 25971 - Concessão/Inscrição: Ajuste na seleção de tipos de contrato de empréstimo disponíveis ao mutuário.
================================================================================
CM$VER      3.01.15d    06/07/2007
--------------------------------------------------------------------------------
- Pendência 25740 - Tratamento de divergência: Ajuste para evitar erro "Temporary table resourse limit".
- Pendência 25624 - Tratamento de divergências: Ajuste para evitar duplicidade no histórico de documentos por movimentação de empréstimo.
================================================================================
CM$VER      3.01.15c    18/06/2007
--------------------------------------------------------------------------------
- Pendência 25624 - Tratamento de divergências: Ajuste para evitar duplicidade no histórico de documentos por movimentação de empréstimo.
- Pendência 25563 - Quitação por falecimento: Ajuste na gravação da situação do contrato.
================================================================================
CM$VER      3.01.15b    04/06/2007
--------------------------------------------------------------------------------
- Pendência 25519 - Relatório Itens Gerados Por Dia: Ajuste na verificação de colunas existentes.
- Pendência 25514 - Relatório Itens Gerados Por Tipo de Contrato: Ajuste na seleção de registros.
- Pendencia 25523 - Nos processos de Cancelamento de Quitação, Cancelamento de Amortização e
  Cancelamento de Alteração de Concessão, inserida a crítica para verificar se o registro 
  enviado ao Contas a Pagar / Receber já se encontra baixado, permitindo ou não o 
  prosseguimento da operação.
- Pendência 24779 - Concessão/inscrição: Ajuste na gravação da suspensão.
================================================================================
CM$VER      3.01.15a    21/05/2007
--------------------------------------------------------------------------------
- Pendência 25353 - Ajuste no estorno de documento pelo tratamento de divergências
- Pendência 25305 - Cancelamento de envio para documentos que estão estornados
- Ajuste no envio do saldo do contrato na data de falecimento para regras de quitação
- Pendência 24901 - Concessão / Inscrição: Simulação de empréstimo com margem consignável variando conforme o prazo.
- Pendência 25305 - Cancelamento de envio para documentos que estão estornados
================================================================================
CM$VER      3.01.15     14/05/2007
--------------------------------------------------------------------------------
- Liberação para versão do padrão 15
- Pendência 25181 - Contabilização de estorno pela data do estorno
- Pendência 25167 - Passagem da situação da suspenção para regra
- Pendência 25118 - Ajuste na seleção do prazo restante para regra de quitação
- Pendência 24970 - Ajuste no relatório Resumo de contratos - visão saldo
- Pendência 24899 - Cancelamento de concessão: Ajuste na confirmação de gravação.
- Pendência 24502 - Tratamento de Divergências: Gravação de log.
- Pendência 23949 - Relatório de Valores Devidos: Inclusão do campo SITUAÇÃO DO CONTRATO.
- Pendência 23423 - Controle de exibição de mensagens de regra através do código do módulo.
- Pendência 23083 - Envio para folha: Itens agrupados na mesma rubrica e com contas contábeis distintas.
- Pendência 23066 - Tipo de Contrato de Empréstimo: Inclusão de parâmetros de destino padrão para envio.
- Pendência 22717 - Identificação do tipo de divergência para as regras de quitação de parcelas e itens a quitar.
- Pendência 21421 - Relatório de itens gerados por dia: Ajuste na seleção dos itens estornados.
- Pendência 20379 - Término de Suspensão: Ajuste para cobrança de contratos.
- Pendência 19997 - Quitação por Morte / Resgate: Retorno de mensagens de erro no processo.
- Pendencia 22162 - Tratamento Individual de Parcelas / Abono
  Não permite data de abono inferior a data prevista do item
- Pendencia 22159 - Entrada Manual de Cobranças e Devoluções
  Forma de cobrança com autorização de acesso.
  Ao inserir item, coloca por padrão a forma de cobrança para financeiro. 
- Pendência 25114 - Ajuste  na gravação do Plano contábil do contrato no momento da concessão- Pendência 24899 - Cancelamento de concessão: Ajuste na confirmação de gravação.
================================================================================
CM$VER      3.01.14g    04/04/2007
--------------------------------------------------------------------------------
- Pendência 24985 - Histórico de Suspensão: Ajuste na gravação da data de fim de suspensão.
- Pendência 24897 - Acerto de Concessão: Ajuste na verificação entre margem consignável e o valor de parcela.
================================================================================
CM$VER      3.01.14f    29/03/2007
--------------------------------------------------------------------------------
- Pendência 24897 - Concessão/Inscrição: Ajuste na verificação entre margem consignável e o valor de parcela.
- Pendência 24862 - Alteração de Valor de Concessão: Ajuste no cálculo da data de crédito conforme horário.
- Pendência 24861 - Concessão/Inscrição: Ajuste na verificação de contratos anteriores de mesmo tipo.
- Pendência 24818 - Tratamento Individual de Parcelas: Ajuste na desativação do botão confirmar, conforme usuário ou grupo sem acessoa função.
- Pendência 24800 - Contabilização: Ajuste na verificação de períodos bloqueados po módulo.
================================================================================
CM$VER      3.01.14e    26/03/2007
--------------------------------------------------------------------------------
Concessão/Inscrição: Ajuste na seleção de itens da migração.
================================================================================
CM$VER      3.01.14d    22/03/2007
--------------------------------------------------------------------------------
- Pendência 24779 - Suspensão de Cobrança: Ajuste na gravação dos dados de suspensão de cobrança no contrato.
================================================================================
CM$VER      3.01.14c    19/03/2007
--------------------------------------------------------------------------------
- Pendência 24779 - Suspensão de Cobrança: Ajuste na gravação dos dados de suspensão de cobrança no contrato.
================================================================================
CM$VER      3.01.14b    13/03/2007
--------------------------------------------------------------------------------
- Pendência 24675 - Relatório de provisão de perdas: Ajuste na seleção de contratos a imprimir.
================================================================================
CM$VER      3.01.14a    06/03/2007
--------------------------------------------------------------------------------
-Pendência 24595 - Calcula e Envia Rubrica Informativa de Valor Máximo Permitido: Inibição das mensagens retornadas por execução de regra.
-Pendência 24593 - Tratamento Individual: Ajuste na seleção de itens para envio ao contas a pagar.
================================================================================
CM$VER      3.01.14     22/02/2007
--------------------------------------------------------------------------------
- Pendência 24554 - Concessão/Inscrição: Ajuste na crítica de carência anterior a gravação.
- Pendência 24376 - Concessão/Inscrição: Ajuste na seleção do portador-forma conforme conta corrente do mutuário.
- Pendência 23536 - Consulta de Contrato: Inclusão de guia com histórico de migração.
- Pendência 23526 - Relatório contratos com Itens não enviados: Ajustado para ser impresso mesmo que não haja registros.
- Pendência 23384 - Geração de parcelas: Verificação da data de falecimento para inibir a geração.
- Pendência 23259 - Concessão/Inscrição: Alteração do processo de gravação e filtros de busca para gravar patrocinador e plano contábil no histórico de movimentações.
- Pendência 22810 - Concessão/Inscrição: Ajuste na busca de informações para regra de cálculo da reserva de poupança.
- Pendência 22500 - Relatório inscrição de empréstimo: Ajuste no tamanho do campo item.
- Pendência 20133 - Amortização e Quitação: Escolha da conta bancária quando forma de envio for financeiro.
- Liberação para versão do padrão 14
================================================================================
CM$VER      3.01.13p    12/02/2007
--------------------------------------------------------------------------------
- Pendência 24149 - Envio de concessões em lote: Ajuste na distribuição de envios por portador forma.
================================================================================
CM$VER      3.01.13o    08/02/2007
--------------------------------------------------------------------------------
- Pendência 24445 - Geração de prestações: Ajuste no cálculo da data de vencimento dos itens.
- Pendência 24452 - Cancelamento de Alteração de Concessão: Ajuste na crítica de prestações geradas após a alteração a cancelar.
================================================================================
CM$VER      3.01.13n    05/02/2007
--------------------------------------------------------------------------------
- Pendência 24408 - Relatório de Valores a creditar: Correção na seleção de dados por plano contábil.
================================================================================
CM$VER      3.01.13m    05/02/2007
--------------------------------------------------------------------------------
- Pendência 24408 - Cálculo de Seguro Complementar: Ajuste no cálculo da data de vencimento.
================================================================================
CM$VER      3.01.13l    05/02/2007
--------------------------------------------------------------------------------
- Pendência 24405 - Geração de prestações: Ajuste no comando de inclusão de dados no histórico de movimentações.
================================================================================
CM$VER      3.01.13k    02/02/2007
--------------------------------------------------------------------------------
- Pendência 24380 - Baixa Manual / Tratamento Individual de Parcelas: Insere diferença no histórico quando o valor for diferente de zero.
- Pendência 23251 - Envio de concessões em lote: Otimização da selerção de dados para envio ao financeiro e contabilização.
- Pendência 23254 - Amortização / Quitação: Otimização da selerção de dados para envio ao financeiro e contabilização.
- Pendência 23255 - Tratamento Individual de Parcelas: Otimização da selerção de dados para envio ao financeiro e contabilização.
================================================================================
CM$VER      3.01.13j    30/01/2007
--------------------------------------------------------------------------------
- Pendência 24351 - Parâmetros de empréstimo: Libera as abas para visualização mesmo se o botão alterar não for pressionado.
- Pendência 24162 - Tratamento Individual: Ajuste no estorno do documento anterior ao alterar vencimento de parcela previamente enviada.
================================================================================
CM$VER      3.01.13i    27/01/2007
--------------------------------------------------------------------------------
- Pendência 24149 - Envio de concessões em lote: Ajuste na seleção do portador forma ao fazer o envio.
- Pendência 24303 - Envio e Tratamento Individual: Ajuste nas seleções de dados para envio ao financeiro.
================================================================================
CM$VER      3.01.13h    25/01/2007
--------------------------------------------------------------------------------
- Pendência 24295 - Amortização e Quitação: Ajuste na seleção de dados de envio ao financeiro.
================================================================================
CM$VER      3.01.13g    16/01/2007
--------------------------------------------------------------------------------
- Pendência 24186 - Concessão: Ajuste no prazo máximo passado para regra de limite de prazo.
- Pendencia 23875 - Concessão / Inscrição: Acerto na gravação do plano contábil nos ítens do contrato 
================================================================================
CM$VER      3.01.13f    11/01/2007
--------------------------------------------------------------------------------
- Pendência 24100 - Relatório de Empréstimos Concedidos: Ajuste para não selecionar contratos com lançamentos de concessão estornados.
================================================================================
CM$VER      3.01.13e    10/01/2007
--------------------------------------------------------------------------------
- Pendência 24134 - Cálculo de Seguro Complementar: Ajuste no cálculo da data de vencimento para proceder como na geração de parcelas.
================================================================================
CM$VER      3.01.13d    08/01/2007
--------------------------------------------------------------------------------
- Pendência 22260 - Inscrição/Concessão/Renovação: Inclusão de crítica para validação de valor solicitado calculado nos itens e digitado na tela.
- Pendência 24146 - Lançamento de prestações atualizadas: Remossão da crítica de fechamento contábil para opção de apenas calcular.
================================================================================
CM$VER      3.01.13c    05/01/2007
--------------------------------------------------------------------------------
- Pendencia 21596: Na processo de amortização, a regra de margem consignável 
                             é sempre executada
================================================================================
CM$VER      3.01.13b    04/01/2007
--------------------------------------------------------------------------------
- Pendência 24098 - Lançamento de Prestações Atualizadas: Liberação da digitação do valor-base na opção de apenas calcular.
================================================================================
CM$VER      3.01.13a    20/12/2006
--------------------------------------------------------------------------------
- Pendência 23733 - Tabela PARAMEMPTMO: Criação da coluna IDREGRATIPOCONTR. O script de atualização da tabela deve ser executado.
Parâmetros do Sistema: Criação da aba Validação na Concessão com a definicão da regra de tipo de contrato de empréstimo. Esta regra recebe informações do tipo de empréstimo selecionado e dos tipos de empréstimos de contratos ativos do solicitante.
Concessão/Inscrição: Chamada a regra definida para validação, após escolha do tipo de contrato de empréstimo.
================================================================================
CM$VER      3.01.13     23/11/2006
--------------------------------------------------------------------------------
- Liberação para versão do padrão 13
================================================================================
CM$VER      3.01.12i    23/11/2006
--------------------------------------------------------------------------------
- Pendencia 23818: Tratamento de Divergências
  Acerto na gravação da Forma de Envio conforme seleção do usuário
================================================================================
CM$VER      3.01.12h    21/11/2006
--------------------------------------------------------------------------------
- Pendência 23755 - Relatório de Fechamento de Carteira Linear: Ajuste na seleção de informações.
================================================================================
CM$VER      3.01.12g    10/11/2006
--------------------------------------------------------------------------------
- Pendencia 23647:
    - Criação do parâmetro "Verifica prazos nos demais tipos de contratos quitáveis" no cadastro de Tipo de Contrato de Empréstimo
    - Verificação desse parâmetro na tela de Concessão/Renovação 
================================================================================
CM$VER      3.01.12f    08/11/2006
--------------------------------------------------------------------------------
Empréstimos Concedidos por tipo de contrato
  Pend.: 23691 - Ajuste no Relatório de Provisões para crédito de Recebimento Duvidoso.
================================================================================
CM$VER      3.01.12e    03/11/2006
--------------------------------------------------------------------------------
- Pendência 20161 - Relatório de Provisão de Perdas: Ajuste na captação de valores pagos e primeira inadimplência.
================================================================================
CM$VER      3.01.12d    27/10/2006
--------------------------------------------------------------------------------
- Pendência 23568 - Cadastro de Historico de Suspensão: Quando suspensão não pode ser efetuada, cancela o processo de inclusão.
- Pendência 23628 - Relatório de Repasse de Repasse de Seguro: Correção na chamada do relatório.
================================================================================
CM$VER      3.01.12c    26/10/2006
--------------------------------------------------------------------------------
- Pendência 23615 - Concessão: Ajuste na avaliação da margem consignável com o valor de parcela inicial.
================================================================================
CM$VER      3.01.12b    25/10/2006
--------------------------------------------------------------------------------
- Pendência 23608 - Envio: Ajuste de erro ocorrido no envio para o financeiro na quitação por morte.
================================================================================
CM$VER      3.01.12a    18/10/2006
--------------------------------------------------------------------------------
- Pendência 23554 - Envio para folha: Ajuste para gravação de matricula e inscrição para interface.
- Ajuste no processo de Envio de Concessões em Lote
- Pendência 22836 - Simulação / Concessão de empréstimo: Passagem de flag de excepcionalidade nas regras de concessão.
- Pendencia 23449 - Alteração de Concessão: Quando o valor liquido é igual a 0 (zero), gravar a data efetiva no item centralizador
- Pendência 23428 - Ajuste no agrupamento do envio para o financeiro e folha de benefícios.
- Pendência 23439 - Ajuste no Relatório de Provisões para crédito de Recebimento Duvidoso.
- Pendência 23436 - Inscrição / Concessão: Regras de cálculo de quitação de contratos anteriores gravando em arquivo CDS.
- Pendência 23429 - Inscrição de Empréstimo: Ajuste na seleção do Tipo de Contrato para considerar o parâmetro de "Nº mínimo de parcelas pagas para renovação"
================================================================================
CM$VER      3.01.12     28/09/2006
--------------------------------------------------------------------------------
- Liberação para versão do padrão 12
- Pendência 23251 - Concessão/ Inscricão / Geração de Parcelas: Gravação do patrocinador e plano contábil na tabela de histórico de movimentações.
================================================================================
CM$VER      3.01.11l    28/09/2006
--------------------------------------------------------------------------------
- Pendência 23429 - Inscrição de Empréstimo: Ajuste na seleção do Tipo de Contrato para considerar o parâmetro de "Nº mínimo de parcelas pagas para renovação"
================================================================================
CM$VER      3.01.11k    27/09/2006
--------------------------------------------------------------------------------
- Pendência 23376 - Inscrição/Contratação: Ao trocar tipo de contrato de empréstimo, ajusta o prazo máximo permitido.
================================================================================
CM$VER      3.01.11j    26/09/2006
--------------------------------------------------------------------------------
- Pendência 23388 - Envio de Concessão em Lote: Correção de erro ao selecionar um tipo de contrato
- Pendência 22798 - Relatório de Valor Atualizado por Contrato: Verificação de atualização diária na tabela HISTMOVEMPTMOEXT
- Pendência 23311 - Ajuste  na gravação do Plano contábil do contrato no momento da concessão
- Pendência 23312 - Regra de elegibilidade recebe IDPLANOPREV e IDPLANOPREVCONTAB
- Pendência 23217 - Concessão: Ajuste na avaliação da margem consignável com o valor de parcela inicial.
- Pendência 23186 - Assinatura de Contrato Padrão: Reposicionamento do campo de situação.
- Pendência 22924 - Arquivo de Remessa Bancária: Valor de devolução lançado na conta bancária de débito do participante.
================================================================================
CM$VER      3.01.11i    14/09/2006
--------------------------------------------------------------------------------
- Pendencia 23205: 
    - Ajuste no processo de Envio de Concessões e Devoluções em lote para enviar 
      somente devoluções
    - Acerto na tela de Entrada Manual de Cobranças e Devoluções para ajustar a situação
      do contrato
================================================================================
CM$VER      3.01.11h    05/09/2006
--------------------------------------------------------------------------------
- Pendencia 23219: Acerto no processo de envio para o Contas a Receber na tela de 
                             Tratamento Individual de Parcelas (Mudança de Vencimento)
================================================================================
CM$VER      3.01.11g    04/09/2006
--------------------------------------------------------------------------------
- Pendencia 23228: Acerto no relatório de Resumo da Carteira (Visão Saldo)
================================================================================
CM$VER      3.01.11f    01/09/2006
--------------------------------------------------------------------------------
Compilação para contemplar pendencia 23199 liberada na versão 3.01.10j
================================================================================
CM$VER      3.01.11e    23/08/2006
--------------------------------------------------------------------------------
- Compilação para contemplar a pendencia 23090, liberada na versão 3.01.10h
================================================================================
CM$VER      3.01.11d    21/08/2006
--------------------------------------------------------------------------------
- Pendencia 23107: Acerto no relatório de Fechamento de Carteira - Visão Caixa (Linear)
- Pendencia 23112: Acerto no relatório de Retenção de IOF
================================================================================
CM$VER      3.01.11c    18/08/2006
--------------------------------------------------------------------------------
- Pendencia 23075: Tela de Envio
         Disponibilização do campo Forma de Recebimento Diferenciado para autorização
         conforme direitos do usuário
================================================================================
CM$VER      3.01.11b    16/08/2006
--------------------------------------------------------------------------------
- Compilação para contemplar pendencia 23053
================================================================================
CM$VER      3.01.11a    15/08/2006
--------------------------------------------------------------------------------
- Pendência 23078 - Alteração de valor de concessão: Gravação do valor de saldo devedor do empréstimo anterior
- Pendência 23073 - Ajuste na inclusão de Contrato Padrão
- Pendência 23067 - Ajuste na seleção da lista de Contrato Padrão na tela de Assinatura de Contrato Padrão
- Pendência 22248 - Chamada de cálculo de margem consignável alterada para reconhecer módulo na regra e execução por prazo selecionado.
- Pendência 23049 - Cadastro de Tipo de Contrato com parâmetro que obriga ou não o valor líquido igual a zero e tratamento deste na tela de concessão/inscrição.
- Pendência 23060 - Cadastro de Tipo de Contrato com parâmetro que o ativa ou inibe na tela de concessão/inscrição da Central de Atendimento.
================================================================================
CM$VER      3.01.11     07/08/2006
--------------------------------------------------------------------------------
- Liberação para versão do padrão 11
================================================================================
CM$VER      3.01.10h    23/08/2006
--------------------------------------------------------------------------------
- Pendencia 23090: Alteração no processo de renovação contratual para evitar 
  possível estouro de memória durante o cálculo de quitação de contrato anterior. 
================================================================================
CM$VER      3.01.10g    22/08/2006
--------------------------------------------------------------------------------
- Concessão: Ajuste na seleção do item de última movimentação do contrato com tratamento de saldo.
================================================================================
CM$VER      3.01.10f    18/08/2006
--------------------------------------------------------------------------------
- Pendencia 23100: Acerto no relatório de provisão de perdas
================================================================================
CM$VER      3.01.10e    16/08/2006
--------------------------------------------------------------------------------
- Pendencia 23053: Acerto na gravação do Saldo Devedor no Cálculo de Seguro Complementar
================================================================================
CM$VER      3.01.10d    15/08/2006
--------------------------------------------------------------------------------
- Pendência 23073 - Ajuste na inclusão de Contrato Padrão
================================================================================
CM$VER      3.01.10c    14/08/2006
--------------------------------------------------------------------------------
- Pendência 23067 - Ajuste na seleção da lista de Contrato Padrão na tela de Assinatura de Contrato Padrão
================================================================================
CM$VER      3.01.10b    11/08/2006
--------------------------------------------------------------------------------
- Pendência 22248 - Chamada de cálculo de margem consignável alterada para reconhecer módulo na regra e execução por prazo selecionado.
- Pendência 23049 - Cadastro de Tipo de Contrato com parâmetro que obriga ou não o valor líquido igual a zero e tratamento deste na tela de concessão/inscrição.
- Pendência 23060 - Cadastro de Tipo de Contrato com parâmetro que o ativa ou inibe na tela de concessão/inscrição da Central de Atendimento.
================================================================================
CM$VER      3.01.10a    01/08/2006
--------------------------------------------------------------------------------
- Pendência 22953 - Alteração de concessão: Inclusão de botão que permite alterar o valor máximo.
- Pendência 22755 - Tratamento Individual: Gravação do novo vencimento para data de abono.
- Pendência 22910 - Concessão: Ajuste para permitir somente se não houver contrato em quitação.
- Pendência 22913 - Alteração de concessão: Envio do flag de financiamento para regra de cálculo do valor líquido.
- Pendência 22908 - Concessão de Empréstimo: Disponibilização da variável FLGEXCEPCIONAL para regra de verificação de obrigatoriedade de avalista.
- Pendência 22880 - Recebimento - Ajuste na query para recuperar lançamentos sem recebimento que não estavam estornando, quando o documento não era explicitado.
================================================================================
CM$VER      3.01.10     12/07/2006
--------------------------------------------------------------------------------
- Pendência 22830 - Ajuste na busca do saldo devedor em uma determinada data
- Pendência 19660 - Indicação no log de geração de parcelas se o contrato não gerar por causa de suspensão.
- Pendencia 19398 - Aproveitamento de Suspensão de Cobrança na Renovação de Contrato mantendo a data término da suspensão do contrato liquidado e inabilitando a escolha de outra suspensão.
- Pendência 22674 - Relatórios/Conferência/Contratos com Itens Não Enviados. Lançamentos em duplicidade para participantes com mais de um plano.
- Pendência 22671 - Tratamento Individual: Correção da gravação do usuário que efetuou abono ou quitação.
- Pendência 22645 - Concessão: Ajuste no processo do recalculo de itens de concessão na alteração de valores ou prazos.
                    Ajuste no recálculo da margem consignável no momento da seleção de tipo de contrato.
- Desfazer Envio em Lote de Concessões: correção da query de busca de documentos, que obrigava existência do banco no cadastro de 'Banco x Portador x Forma de Pagamento', quando o processo de envio não obriga;
- Tratamento de Divergências: Fechamento e reabertura da lista de itens a tratar  após cada execução de um tratamento;
- Pendência 21061 - Tratamento de divergências: Só limpar o flag de envio quando o código de documento for limpo
- Pendência 21332 - Várias telas: Trava de processos (inclusive chamada de telas) se já houver transação anterior em progresso;
- Pendência 20052 - Lançamento de Parcelas Atualizadas: lançamento automático de incorporação ao saldo + abono (opcional) dos  itens em aberto, de acordo com opção do usuário;
- Pendências 20170 e 20500 - Novo processo de Envio de Seguros em Lote: NECESSÁRIO PREENCHER NOVO CADASTRO DE "Itens por Processo" e campos "Conta de Baixa" para os itens de seguro;
- Pendência 19602 - Envio de Concessões em Lote: verificacão da existência de contrato anterior ativo para o mutuário (em caso de detectada existência, o contrato em questão não será incluído no lote);
- Pendência 20906 - Envio para Financeiro (várias telas): Utilização da conta preferencial do mutuário, ignorando a conta indicada no Contrato, regulado por novo parâmetro do sistema "utilizar SEMPRE conta corrente preferencial..."; 
- Pendência 21225 - Envio e Tratamento Individual: permitir o envio para uma "Conta de Caixa X Forma de Recebimento" diferenciada, ignorando a indicada no Contrato;
- Pendência 19603 - Novo Relatório de Contratos em Duplicidade;
- Pendência 20501 - Rel. Retenção de IOF (2): Demonstrar nos relatórios de retenção de IOF (2) os valores de devolução lançados manualmente; NECESSÁRIO PREENCHER NOVO CADASTRO DE "Itens por Processo";
- Pendência 20168 - Rel. Conferência do Valor das Parcelas Geradas: demonstrar os contratos que possuem suspensão no mês anterior ao da parcela listada;
- Pendência 20696 - NOVA tela para envio de rubrica informativa contendo o valor máximo para concessão, para participantes que ainda não possuem contrato;
- Pendência 20696 - NOVA tela para envio de rubrica informativa contendo o valor do saldo devedor mais itens em aberto de contratos;
- Pendência 20433 - Amortização: Gravação da taxa de juros em caso de amortização antes da primeira parcela gerada;
- Pendência 20498 - Tratamento Individual: gravação do tipo de folha ('P' ou 'B') no momento do desvio de cobrança para folha;
- Pendência 20239 - NOVO relatório de "Quitações com Saldo Devedor ou Valores em Aberto";
- Pendência 20072/20178 - Consulta de Contratos: ordenação por novo campo "Ordem (p/ Extrato)", do cadastro de Itens por Tipo de Contrato: 
- Pendência 20314 - NOVA tela de Cancelamento de Alteração de Concessão;
================================================================================
CM$VER      3.01.09c    31/05/2006
--------------------------------------------------------------------------------
- Pendencia 19398: Aproveitamento de Suspensão de Cobrança na Renovação de Contrato: Acerto na rotina para gravação no Histórico de Suspensão de Cobrança e aproveitamento da suspensão;
================================================================================
CM$VER      3.01.09b    31/05/2006
--------------------------------------------------------------------------------
- Consulta de Contratos: correção da ordenação dos itens em caso de campo "ordem para extrato" nulo no cadastro de itens por tipo de contrato;
- Acerto da situação contratual: correção da situação em caso de quitação com resíduo no saldo devedor;
================================================================================
CM$VER      3.01.09a    24/05/2006
--------------------------------------------------------------------------------
- Pendência 22268 - Quitação: Passagem do campo QUANTITEMABERTO desde o primeiro item da query de entrada das regras de quitação (era anteriormente passado apenas a partir da 1º registro dos itens em aberto);
- Pendência 22305 - Tratamento de Divergências: Otimização do processo, e implementação de botões para marcar apenas uma determinada parcela;
- Concessão: correção do disparo da regra de prazo máximo do contrato (estava sendo disparada mesmo antes da seleção do tipo de contrato para concessão);
- Concessão: correção do disparo da regra de data de crédito do contrato (estava sendo disparada mesmo antes da seleção do tipo de contrato para concessão);
- Consulta de contratos: nova opção de filtro por nº da parcela;
================================================================================
CM$VER      3.01.09     02/05/2006
--------------------------------------------------------------------------------
Versão para liberação padrão 9. Equivalente à 3.01.08j.
================================================================================
CM$VER      3.01.08n    30/05/2006
--------------------------------------------------------------------------------
- Consulta de Contratos: correção da ordenação dos itens em caso de campo "ordem para extrato" nulo no cadastro de itens por tipo de contrato;
- Acerto da situação contratual: correção da situação em caso de quitação com resíduo no saldo devedor;
================================================================================
CM$VER      3.01.08m    24/05/2006
--------------------------------------------------------------------------------
- Pendência 22268 - Quitação: Passagem do campo QUANTITEMABERTO desde o primeiro item da query de entrada das regras de quitação (era anteriormente passado apenas a partir da 1º registro dos itens em aberto);
- Pendência 22305 - Tratamento de Divergências: Otimização do processo, e implementação de botões para marcar apenas uma determinada parcela;
- Concessão: correção do disparo da regra de prazo máximo do contrato (estava sendo disparada mesmo antes da seleção do tipo de contrato para concessão);
- Concessão: correção do disparo da regra de data de crédito do contrato (estava sendo disparada mesmo antes da seleção do tipo de contrato para concessão);
- Consulta de contratos: nova opção de filtro por nº da parcela;
================================================================================
CM$VER      3.01.08k    11/05/2006
--------------------------------------------------------------------------------
- Pendencia 22165: Acerto na rotina de recebimento automático, pois a mesma estava colocando o campo "Tipo de Folha" como nulo quando se tratava de recebuimento de itens agrupados.
================================================================================
CM$VER      3.01.08j    26/04/2006
--------------------------------------------------------------------------------
Pendência 21945 - Concessão: alteração nas queries das regras de "Prazo Maximo do Tipo de Contrato" e "Prazo de Concessão" para sempre trazer a data de nascimento do mutuário, havendo ou não benefício ativo;
================================================================================
CM$VER      3.01.08i    17/04/2006
--------------------------------------------------------------------------------
- Concessão: correção da query de contagem de número máximo permitido de INSCRIÇÕES (estava buscando pelo Titular, deveria ser pelo mutuário);
- Geração de parcelas: correção da query de suspensão (estava suspendendo outros itens de mesmo nº de prestação);
- Pendência 21885 - Tratamento Individual de Parcelas: ajustes para não permitir tratamento indevido de prestações suspensas;
- Pendência 21422 - Tratamento Individual de Parcelas: não permitir reenvio de itens enviados para financeiro ainda sem retorno;
- Pendência 22004/21989 - Assinatura de Contrato-Padrão: correção da listagem de assinaturas possíveis;
================================================================================
CM$VER      3.01.08g    04/04/2006
--------------------------------------------------------------------------------
- Pendência 21989 - Assinatura de Contrato-Padrão: corrigidas situações em que o tipo de contrato "ativo" e a assinatura de contrato "bloqueado" não permitiam correta assinatura e concessão;
- Pendência 21959 - Quitação: correção do erro de conversão de valores que ocorria em determindas situações, apenas em caso de atualização diária;
================================================================================
CM$VER      3.01.08f    21/03/2006
--------------------------------------------------------------------------------
- Recebimento: correção da busca de valores de documentos com baixas estornadas;
- Tratamento Individual: acerto da situação contratual após desfazer baixa manual;
- Relatório de conciliação de recebimentos - financeiro: opção de não listar itens ainda não enviados;
- Relatório de conciliação de recebimentos - folhas: opção de não listar itens ainda não enviados;
- Relatório de valores devidos por contrato:
   - quebra por tipo de contrato;
   - novo filtro "Exibir apenas Contratos com valor devido"
   - diferenciação dos filtros (critérios) "Exibir apenas Contratos com valor devido" e "Exibir apenas Contratos com itens em aberto"
- Relatório de resumo da carteira - visão caixa: separação dos valores abonados e "quitados";
- Relatório de resumo da carteira - visão caixa (linear): separação dos valores abonados e "quitados";
- Pendência 21783 - Tratamento de Divergências: correção da marcação de "envio" quando da atualização de vencimento;
- Relatório de itens não enviados: nova opção de filtro por tipo de folha (patrocinadora e benefícios);
- Pendência 21351 - Relatórios de Itens Gerados: equalização dos relatórios, com base no de Itens Gerados por Dia;
- Pendência 21066 - NOVO Relatório de Provisão de Perdas (sem atualização diária);
- Pendência 20161 - NOVO Relatório de Provisão de Perdas (com atualização diária);
- Pendência 21799 - Relatório Itens Gerados Por Tipo de Contrato: corrigida exibição de filtros no cabeçalho;
================================================================================
CM$VER      3.01.08e    17/03/2006
--------------------------------------------------------------------------------
- Acerto na query do Cancelamento de Envio
================================================================================
CM$VER      3.01.08d    06/03/2006
--------------------------------------------------------------------------------
- Geração de parcelas: correção da numeração de prestações em caso de atualização diária e com encargos gerados;
================================================================================
CM$VER      3.01.08c    23/02/2006
--------------------------------------------------------------------------------
Relatório de Valores Devidos - por Plano e Patrocinadora: otimização da busca dos contratos nos laços por Plano, Patrocinadora e Tipo de Contrato;
Relatório de Resumo de Contratos - visão Saldo: otimização da busca dos contratos nos laços por Plano, Patrocinadora e Tipo de Contrato;
================================================================================
CM$VER      3.01.08b    21/02/2006
--------------------------------------------------------------------------------
- Pendência 21564 - Alteração de valor de concessão:
  (a) trava do processo em caso de cancelamento de concessão com data original em período contábil bloqueado;
  (b) retirado processo de estorno dos registros de atualização diária - restará diferença;
- Pendência 21605 - Concessão: correção da crítica de contrato anterior ativo, para evitar duplicidade (não levava em conta contratos "encerrados"
- Alteração de valor de concessão: disparo da atualização diária ao término da gravação dos itens;
- Concessão: correção da habilitação dos botões em caso de desistência da contratação;
- Recebimento:
  (a) novo filtro por código do documento;
  (b) otimização da query de busca de documentos, inclusive com novo filtro (acima);
  (c) correção da query para buscar documentos baixados com valor ZERO;
- Relatório de Valores Devidos - por Plano e Patrocinadora:
  (a) otimização da query/processo quando desejados apenas contratos com valores vencidos (em aberto);
  (b) ajuste na barra de progresso;
- Relatório de Valores Devidos - por Plano e Patrocinadora:
- Relatório de Resumo de Contratos - Visão Saldo: ajuste na barra de progresso;
- Quitação: ajuste no tipo dos parâmetros da query de inserção de registros na HistMovEmptmo;
- Amortização: correção da busca do nº de prestações restantes em caso de amortização anterior à 1ª prestação, e com atualização diária;
================================================================================
CM$VER      3.01.08a    02/02/2006
--------------------------------------------------------------------------------
- Pendência 21225 - Correções no cancelamento de quitação (sem atualização diária);
- Pendência 21433 - Trava de concessões quando houver outro contrato concedido com data posterior;
- Relatórios de Conciliação Contábil: ajustes para levar em conta as datas de abono;
- Quitação: retirada das funcões de desfazer envio;
- Relatório de itens gerados por dia: ajustes na query em caso de não uso da tabela PlanPrevXContabil;
- Pendência 21345 - Filtro diferenciado de tipos de suspensão na tela de lançamento se for CentralAP;
- Pendência 21214 - Envio (TMPDESC): gravação da DataInicio;
- Pendência 21331 - Tratamento Individual: trava de processos em caso de documento ou tmpdesc baixados, mesmpo que ainda não recebidos;
- Pendência 20599 - Cálculo de quitação: em caso de quitação por morte, passagem do saldo devedor à data da morte;
- Pendência 21379 - Alteração da ordem dos campos "Prazo" e "Taxa de Juros" na tela de concessão;
- Contabilização de Atualização Diária: bloqueio da contabilização para dias em que já houver itens contabilizados;
================================================================================
CM$VER      3.01.07o    01/02/2006
--------------------------------------------------------------------------------
- Pendência 21225 - Correções no cancelamento de quitação (sem atualização diária);
- Pendência 21433 - Trava de concessões quando houver outro contrato concedido com data posterior;
- Relatórios de Conciliação Contábil: ajustes para levar em conta as datas de abono;
- Quitação: retirada das funcões de desfazer envio;
- Relatório de itens gerados por dia: ajustes na query em caso de não uso da tabela PlanPrevXContabil;
================================================================================
CM$VER      3.01.07n    27/01/2006
--------------------------------------------------------------------------------
- Pendência 21345 - Filtro diferenciado de tipos de suspensão na tela de lançamento se for CentralAP;
- Pendência 21214 - Envio (TMPDESC): gravação da DataInicio;
- Pendência 21331 - Tratamento Individual: trava de processos em caso de documento ou tmpdesc baixados, mesmpo que ainda não recebidos;
- Pendência 20599 - Cálculo de quitação: em caso de quitação por morte, passagem do saldo devedor à data da morte;
- Pendência 21379 - Alteração da ordem dos campos "Prazo" e "Taxa de Juros" na tela de concessão;
- Contabilização de Atualização Diária: bloqueio da contabilização para dias em que já houver itens contabilizados;
================================================================================
CM$VER      3.01.07m    24/01/2006
--------------------------------------------------------------------------------
- Concessão: botão de contratação desabilitado no início do processo para evitar clique indevido;
- Concessão: expansão dos logs de concessão (novas informações);
- Concessão: alteração do critério de prestações anteriores em aberto, de mês de COBRANÇA para mês de COMPETÊNCIA menor que mês da concessão
- Concessão: trava de concessão para caso de contratos anteriores não efetivados antes das outras críticas;
- Recebimento: gravação dos documentos individuais baixados, com informação de baixa parcial;
- Recebimento: Trava de baixa parcial em caso de documento de CaP;
- Rel. Conciliação - Financeiro: ajuste na query quando do uso de filtros de divergência;
- Criados logs para os processos que excluem/estornam/limpam documentos e planilhas;
- Pendência 20158 - Tratamento de Divergências: geração correta do saldo nos itens de encargos;
- Pendências 20512, 21104 e 20246 - Relatório de Valores a Creditar por Plano e Patrocinadora;
- Pendências 20502, 20176 e 20208 - Relatório de Itens Gerados por Dia;
- Pendência 20567 - Recebimento: Estorno de alteração de concessão;
- Pendência 20585 - Importação de arquivo de suspensões: encerramento das suspensões anteriores;
- Pendência 20800 - Geração de parcelas: não considerar parcelas com seqcobranca > 1 para determinar nº da próxima parcela;
- Pendência 21272: Concessão - carência;
- Pendência 20954: Tratamento Individual: mensagens de alerta em caso de item previamente enviado;
- Pendência 20804: Tratamento de divergências: correção do saldo devedor do itens de encargos gerados;
================================================================================
CM$VER      3.01.07k    28/12/2005
--------------------------------------------------------------------------------
- Pendência 21062: Consulta de Contratos - exibição correta da data efetiva/valor efetivo em caso de abono ou quitado, para evitar confusão;
- Logs em disco (concessão/quitação): gravação do login do usuário e da data do servidor para comparação com a data da máquina;
- Pendência 19990/20019: Estorno de itens pós-quitação - correção do estorno em caso de prestações suspensas;
- Contabilização em lote de Concessão: alteração para considerar também entradas manuais de itens de concessão;
- Pendência 20459: Amortização / Quitação / Alteração de Concessão - criada opção "excepcional" para permitir processo sem trava de datas; Gravação de log com o "excepcional";
- Quitação (todas): metodologia de execução de regras alterada (não há diferença "externa", no resultado);
- Pendência 21060: Relatório de Resumo de Contratos (visão Caixa) - novo filtro para exibir apenas contratos com itens em aberto;
================================================================================
CM$VER      3.01.07j    13/12/2005
--------------------------------------------------------------------------------
- Pendência 20912 (ou 20848): busca do PlanoOrigem no momento da Concessão;
- Pendência 20256: Exibição do campo "Taxa de Juros" no relatório "Valores devidos - por Plano e Patro" (já estava disponível na query);
- Pendência 20511: Concessão - só considerar para quitação contratos anteriores com valor a quitar > 0;
- Pendência 20461: Envio - ajuste no processo de controle de envio de prestações em atraso;
================================================================================
CM$VER      3.01.07i    06/12/2005
--------------------------------------------------------------------------------
- Pendência 20926: correção do filtro por Plano e Patro nos relatórios de conciliação contábil;
- Concessão: correção na crítica de contas-correntes;
================================================================================
CM$VER      3.01.07h    25/11/2005
--------------------------------------------------------------------------------
- Pendencia 20824: Acerto no envio de amortização para o CAR
================================================================================
CM$VER      3.01.07g    18/11/2005
--------------------------------------------------------------------------------
- Quitação: implementação de logs em texto;
- Envio: ajustes no controle de transação;
================================================================================
CM$VER      3.01.07f    17/11/2005
--------------------------------------------------------------------------------
- Pendência 20716: Correção da restrição de desfazer parcelas enviadas;
- Pendência 20557: Novos relatórios "Conciliação - Financeiro" e "Itens Enviados/Recebidos (Financeiro) por Plano e Patrocinadora";
- Ajustes no processo de desfazer quitação por resgate;
- Adição de informações aos logs de concessão;
- Quitação: correção de uma cláusula para marcação de itens como "quitados" na quitação;
- Concessão: correção da liberação de valor máximo em caso de marcação da cláusula "excepcional";
================================================================================
CM$VER      3.01.07e    07/11/2005
--------------------------------------------------------------------------------
- Pendência 20556: novo relatório de Conciliação de Recebimentos - Folha(s) - por Plano e Patrocinadora
================================================================================
CM$VER      3.01.07d    26/10/2005
--------------------------------------------------------------------------------
- Pendência 20583: correção na query do relatório de itens gerados por plano/patro (sintético);
================================================================================
CM$VER      3.01.07c    19/10/2005
--------------------------------------------------------------------------------
- Pendencia 20499: Acerto no relatório de Conta Corrente para não considerar quitações estornadas
================================================================================
CM$VER      3.01.07b    14/10/2005
--------------------------------------------------------------------------------
- Pendência 20448 - Rel. Itens Gerados por Evento: correção de erro na query (campo hmedataprevista);
- Pendência 20419 - Envio de Concessões em Lote: correção da gravação de múltiplas contas de baixa;
================================================================================
CM$VER      3.01.07a    10/10/2005
--------------------------------------------------------------------------------
- Pendência 20261 - Passagem (regulada por parâmetro dos sistema) dos itens abonados para as regras de encargos (também na quitação);
- Pendência 20306 - Desfazer envio: não mais permitido desfazer envio de documentos que contenham mais de 1 contrato por essa tela;
- Pendência 20127 - Disparo do ajuste de saldo após quitação;
- Pendência 20130 - Passagem do ID do tipo de suspensão para a regra de itens quitados;
- Pendência 20058 - Bloqueio de desfazer amortização e quitação se as mesmas já estiverem enviadas;
- Pendência 20309 - Correção das listas de tipos de contrato (exibia apenas os ativos);
- Pendência 20032 - Contrato-padrão pode ser referente a mais de um tipo de contrato;
- Pendência 20409 - Correção do recebimento de documentos baixados com valor ZERO;
- Pendência 20175 - Apropriação incondicional de encargos abonados;
- Pendência 20032 - Assinatura de contrato-padrão por tipo de contrato;
- Pendência 20135 - Alteração contratual: Permitida alteração de conta-corrente sem implicar na alteração da forma de cobrança;
- Pendência 19909 - Tratamento Individual: alterações para permitir escolha dos itens a enviar APÓS tratamento;
- Pendência 19969 - Conta-Corrente: criados campos para data de quitação e situação contratual;
- Pendência 20028 - Desfazer Envio: criado filtro por usuário;
- Pendência 20045 - Envio: ajustes na rotina de contagem e envio de prestações em atraso;
- Pendência 20031 - Tratamento de Divergências: estorno de documento regulado por parâmetro do sistema;
- Consulta de Contratos: criada guia de log do registro na HistMovEmptmo;
- Pendência 20217 - Consulta de Contratos: criado botão para permitir alteração da observação do item;
- Pendência 20256 - Relatório de Valores Devidos - por Plano/Patro: criada quebra por Tipo de Contrato, além da inclusão de novas colunas;
- Pendência 20022 - Recebimento: ajustes na chamada do processo de atualização da situação contratual;
- Pendência 20146 - Geração de Parcelas: correção da suspensão quando a mesma gerava abatimento no saldo;
- Pendência 20147 - Entrada Manual: Disparo de ajuste de saldo após entrada manual;
- Pendência 20077 - Concessão: alteração no controle da transação para não permitir que na contratação possa ficar inscrição sem contrato;
- Pendência 20072 - Consulta de Contratos e ajuste de saldo: equalização dos critérios de ordenação dos registros do histórico;
================================================================================
CM$VER      3.01.07     05/09/2005
--------------------------------------------------------------------------------
Versão para liberação do padrão 5.10.07
================================================================================
CM$VER      3.01.06s    05/09/2005
--------------------------------------------------------------------------------
- Pendência 20111 - Tratamento Individual: travamento de datas contábeis apenas se tipo de suspensão implicar em alteração do saldo;
- Pendência 20112 - Envio: correção da suspensão de prestações;
- Pendência 20113 - Recebimento: correção do acerto da situação contratual;
- Pendência 20124 - Desfazer Recebimento: correção do estorno do item de seqüencial = 2 gerado no recebimento a menor;
================================================================================
CM$VER      3.01.06r    02/09/2005
--------------------------------------------------------------------------------
- Pendência 20040 - Alteração de valor de concessão: correção da gravação do novo prazo contratual;
- Pendência 20025 - Tratamento Individual (Suspensão): gravação do tipo de suspensão e disparo da atualizacão diária;
- Pendência 20050 - Não permitir quitação se houver amortização em aberto, amortização para o mesmo ou para data posterior à da quitação;
================================================================================
CM$VER      3.01.06q    23/08/2005
--------------------------------------------------------------------------------
- Pendência 19990/20019 - Quitação (todas): Correção do estorno dos itens não-centralizadores;
- Pendência 20021 - Concessão: eliminado erro que ocorria quando o mutuário possuía mais de 1 contrato anterior, em função da memória de cálculo das regras de quitação;
================================================================================
CM$VER      3.01.06p    19/08/2005
--------------------------------------------------------------------------------
- Pendência 19984 - Correção da exibição das planilhas nos processos de desfazer contabilização em lote;
- Pendência 19987 - Resultado final dos cálculos de alteração do valor concedido determinado por parâmetro do item  por tipo de contrato;
================================================================================
CM$VER      3.01.06o    12/08/2005
--------------------------------------------------------------------------------
- Pendência 19948 - Correção da exibição das planilhas no processo de desfazer contabilização de ajustes em lote;
- Pendência 19949 - Concessão: retirado vínculo dos planos (prev.) dos contratos anteriores (a quitar) com o plano atual do participante, que poderia acarretar a não quitação de um contrato anterior em caso de participante migrado mas contrato não;
- Relatório de Conta Corrente: otimização da query;
================================================================================
CM$VER      3.01.06n    09/08/2005
--------------------------------------------------------------------------------
- Pendência 19920: ajustes na exibição da data da situação contratual;
- Ajustes nos relatórios de itens gerados;
================================================================================
CM$VER      3.01.06m    05/08/2005
--------------------------------------------------------------------------------
- Pendência 19906: correção no filtro do relatório Valores Enviados/Recebidos (Financeiro) - sintético por Item;
- Pendência 19907: correção do envio indevido de itens para CaP;
- Pendência 19908: habilitação do campo "NÃO executar envio";
================================================================================
CM$VER      3.01.06l    02/08/2005
--------------------------------------------------------------------------------
- Pendencia 19868: Tratamento Individual de Parcelas: Acerto no processo de abono
================================================================================
CM$VER      3.01.06k    28/07/2005
--------------------------------------------------------------------------------
- Pendência 19818 - retirada passagem do saldo devedor à data do falecimento (quitação por falecimento);
- Pendência 19839 - retirada crítica de contrato anterior não efetivado em caso de multiplos contratos;
================================================================================
CM$VER      3.01.06j    26/07/2005
--------------------------------------------------------------------------------
- Pendência 19822: correção na query de entrada da regra de salário-base (estava passando TODOS os beneficiários recebedores do titular, não apenas o que estava solicitando empréstimo).
================================================================================
CM$VER      3.01.06i    22/07/2005
--------------------------------------------------------------------------------
- Correção do parâmetro que regula o envio de Amortizações e Quitações no ato das mesmas;
================================================================================
CM$VER      3.01.06h    15/07/2005
--------------------------------------------------------------------------------
- Pendência 19182: Concessão - Passagem do campo IDSITDEPENDENTE para a regra de Elegibilidade;
- Pendencias 19579 e 19601: Liberação de Suspensão - Corrigido o erro da falta do campo ANOSUSPENSAO
- Pendencia: 19704: Alterações Contratuais - Corrigido o erro de Invalid Data Packet na busca do contrato
================================================================================
CM$VER      3.01.06g    13/07/2005
--------------------------------------------------------------------------------
- Pendência 19661: Geração de Parcelas - Correção na chamada da rotina de Ajuste de Saldo (quando aplicável);
- Pendência 19658: Renovação - Correção da gravação do valor efetivo do contrato anterior;
- Pendência 19182: Concessão - Passagem do campo IDSITDEPENDENTE para a regra de Elegibilidade;
- Pendência 19592: Desfazer Contabilização em Lote de Ajustes - passa a considerar também evento 7;
================================================================================
CM$VER      3.01.06f    08/07/2005
--------------------------------------------------------------------------------
- Pendência 19654: correção da marcação de contrato "quitado" no recebimento (baixa) do valor de quitação;
- Pendência 19657: correção da busca do participante na Consulta Geral de Pessoa;
================================================================================
CM$VER      3.01.06e    06/07/2005
--------------------------------------------------------------------------------
- Pendência 19639: correção de envio da quitação para CaR.
================================================================================
CM$VER      3.01.06d    05/07/2005
--------------------------------------------------------------------------------
- Pendência 19631: Passagem para regra de salário-base apenas do registro do
plano e patrocinadora correntes do participante; 
================================================================================
CM$VER      3.01.06c    04/07/2005
--------------------------------------------------------------------------------
- Pendência 19617: Inscrição - correção de erro ao buscar quantidade máxima de
contratos permitida;
- Pendência 19619: Cancelamento de Concessão - correção do estorno dos itens do
contrato cancelado;
================================================================================
CM$VER      3.01.06b    01/07/2005
--------------------------------------------------------------------------------
- Correção da busca de contratos anteriores na concessão, que poderia permitir,
em determinada circunstância, a concessão de mais contratos que o permitido.
================================================================================
CM$VER      3.01.06a    27/06/2005
--------------------------------------------------------------------------------
- Pendência 19561: correção da seleção de Tipo de Empréstimo / Tipo de Contrato
   na tela de Recebimento Automático;
================================================================================
CM$VER      3.01.06     21/06/2005
--------------------------------------------------------------------------------
- Pendência 19175: Filtro por itens de quitação no relatório de valores devidos
- Pendência 19405: Não suspender cobrança da última prestação
- Pendência 19196: Passagem da Data de Nascimento (campo DATANASC) do mutuário
  para ser passado para as regras de concessão
- Contabilização de Atualização Diária em Lote: alteração na contabilização de
  valores negativos, para facilitar confrência;
- Cancelamento de Contabilização em Lote (todas): exibição do código da Planilha
  contábil;
- Consulta de Contratos: nova aba com log de eventos do Contrato;
- Entrada Manual: preenchimento com valores default para os nºs da parcela;
- Geração de Parcelas: correção saldo devedor após a prestação quando há
  atualização diária;
================================================================================
CM$VER      3.01.05r    08/06/2005
--------------------------------------------------------------------------------
- Pendência 19431: correção da exclusão da TMPDESC no cancelamento de resgate;
- Pendência 19437: Tratamento de divergências: filtro por arquivo;
================================================================================
CM$VER      3.01.05q    19/05/2005
--------------------------------------------------------------------------------
- Pendência 19404: bloqueio de lançamentos para períodos contábeis fechados
  (redundante com as outras verificações já existentes);
================================================================================
CM$VER      3.01.05n    19/05/2005
--------------------------------------------------------------------------------
- Pendência 19284: correção na gravação da taxa de juros quando de uma Amortização;
================================================================================
CM$VER      3.01.05m    17/05/2005
--------------------------------------------------------------------------------
- Pendencia 19284: Correção na gravação da taxa de juros na Amortização;
- Pendencia 19249: Correção nos processos de contabilização em lote, (levar em
conta apenas itens de HMESEQCOBRANCA = 1);
================================================================================
CM$VER      3.01.05l    17/05/2005
--------------------------------------------------------------------------------
- Pendencia 19236: Estorno de prestações posteriores à quitação por falecimento,
regulada por parâmetro do sistema;
================================================================================
CM$VER      3.01.05k    17/05/2005
--------------------------------------------------------------------------------
- Contabilização de Atualização Diária em Lote: alteração na contabilização dos
valores negativos, para facilitar confrência;
- Cancelamento de Contabilização em Lote (todas):
  - Exibição do código da Planilha contábil;
  - Exibição das planilhas de estorno também;
================================================================================
CM$VER      3.01.05j    11/04/2005
--------------------------------------------------------------------------------
- Pendencia 18037: No tratamento individual de parcelas - Mudança de Vencimentos sem encargos,
  o sistema efetua automaticamente o envio da nova cobrança.
================================================================================
CM$VER      3.01.05i    05/04/2005
--------------------------------------------------------------------------------
- Acerto na query do relatório de Conta Corrente
================================================================================
CM$VER      3.01.05h    21/03/2005
--------------------------------------------------------------------------------
- Pendencia 18866 - Acerto no relatório de retenção de IOF
================================================================================
CM$VER      3.01.05g    08/03/2005
--------------------------------------------------------------------------------
- Pendencia 18792 - Acerto nas queries para contemplar participante que tenha migrado 
  de patrocinadora.
- Pendencia 18423 - Permitir que no relatório de Retenção de IOF apareça contratos 
   quitados, quando da impressão retroativa do mesmo.
================================================================================
CM$VER      3.01.05f    01/02/2005
--------------------------------------------------------------------------------
- Pendencia 18386 - Acerto na busca dos dados do participante para levar em consideração o plano atual do mesmo
================================================================================
CM$VER      3.01.05e    18/01/2005
--------------------------------------------------------------------------------
- Acerto na contabilização do abono no Tratamento Individual de Parcelas
================================================================================
CM$VER      3.01.05d    13/01/2005
--------------------------------------------------------------------------------
- Pendencia 18453 - Geração de arquivo para banco: Verificar se documento está em aberto e se o contrato está ativo
================================================================================
CM$VER      3.01.05c    12/01/2005
--------------------------------------------------------------------------------
- Respeitar o parametro para estornar o documento ou nao no tratamento de divergencias
================================================================================
CM$VER      3.01.05b    12/01/2005
--------------------------------------------------------------------------------
- Acerto no tratamento de divergências para estornar ou não o documento.
================================================================================
CM$VER      3.01.05a    22/12/2004
--------------------------------------------------------------------------------
Pendência : 17884 - Geração de arquivo de remessa para banco - Colocado opção para visualizar ou não o arquivo gerado 
================================================================================
CM$VER      3.01.05     14/12/2004
--------------------------------------------------------------------------------
- Implementação de 3 novos relatórios de conciliação contábil;
- Pendência 18079 - Novo relatório de Resumo da Carteira - visão Caixa Linear - por Plano e Patrocinadora;
- Pendência 18081 - Novo relatório de Valores Devidos - por Plano e Patrocinadora;
- Pendência 18082 - Novo relatório de Itens Gerados por Evento - por Plano e Patrocinadora;
- Pendência 18083 - Novo relatório de Retenção de IOF - por Plano e Patrocinadora;
- Pendencia 17388 - Acerto na query passada para a regra de margem consignável
- Pendencia 17422 - Revisão do parâmetro de nº mínimo de parcelas pagas para renovaçào
- Pendencia 17493 - Acerto na tela de concessão para trazer a conta preferencial como padrão
- Pendencia 17456 - Colocação do campo de identificação da Carteira SPC na tela de Tipo de Contrato
- Pendencia 17545 - Colocados os campos nº máximo de inscriçòes e contratos por participante na tela de Tipo de Contrato
- Pendencia 17593 - Colocado o filtro de Plano Previdenciario Contabil ativo
- Pendencia 18086 - No tratamento de divergências, verifica se está parametrizado para estornar documento do Contas a Receber
================================================================================
CM$VER      3.01.04i    29/11/2004
--------------------------------------------------------------------------------
Pendencia 18078 -
   Criação do relatório de Resumo da Carteira - Visão Saldo por Plano Patro, análogo ao Resumo da Carteira - Visão Saldo, mas com quebra e totalização por Plano e Patrocinadora
================================================================================
CM$VER      3.01.04h    08/10/2004
--------------------------------------------------------------------------------
- Pendencia 17890 - Ajuste na contabilização no processo de geraçào de Parcelas
================================================================================
CM$VER      3.01.04g    24/09/2004
--------------------------------------------------------------------------------
- Pendencia 17421 - Relatório de Quitações não efetivadas
   Inclusao dos campos Situação do mutuário e valor da quitação
- Pendencia 17494 - Extrato de Movimentação por contrato
   Inclusão dos somatório de valores em aberto
- Pendencia 17507 - Busca da Reserva
  Preenchendo com 0 (Zero) o campo NUMDEPIRRF para ser passado para a regra de busca de reserva
================================================================================
CM$VER      3.01.04f    14/09/2004
--------------------------------------------------------------------------------
- Acerto na rotina de Desfazer Geração de Parcelas
================================================================================
CM$VER      3.01.04e    03/09/2004
--------------------------------------------------------------------------------
- Acerto no processo de geracão de parcelas
================================================================================
CM$VER      3.01.04d    27/08/2004
--------------------------------------------------------------------------------
- Pendencia 17493 - Acerto na query da conta preferencial para crédito de concessào de Empréstimo
================================================================================
CM$VER      3.01.04c    19/08/2004
--------------------------------------------------------------------------------
- Pendencia 17381 - Acerto no relatório de Provisão de creditos de liquidação duvidosa
- Pendencia 17388 - Acerto na query para a busca de margem
- Pendencia 17422 - Acerto na rotina que verifica o número de parcelas pagas para a renovação
================================================================================
CM$VER      3.01.04b    18/08/2004
--------------------------------------------------------------------------------
- Ajuste no relatório de Retençao de IOF, pois estava dando erro
  de coluna inválida quando era escolhido o filtro por tipo de empréstimo
================================================================================
CM$VER      3.01.04a    17/08/2004
--------------------------------------------------------------------------------
- Ajuste no relatório de Itens gerados por evento sintético, pois estava dando erro
  de coluna inválida quando era escolhido o filtro por tipo de empréstimo
================================================================================
CM$VER      3.01.04     16/08/2004
--------------------------------------------------------------------------------
- Ajuste no relatório de Itens gerados por evento sintético
- Ajuste na query de Busca de Margem
================================================================================
CM$VER      3.01.03i    21/10/2004
--------------------------------------------------------------------------------
- Correção da busca do plano previdenciário em caso de PENSIONISTA migrado
================================================================================
CM$VER      3.01.03h    21/10/2004
--------------------------------------------------------------------------------
- Busca de Solicitante: exibição do plano correto em caso de PENSIONISTA migrado
- Consulta de Contratos: correção do erro ao sair da tela quando a mesma era
   chamada durante uma concessão;
================================================================================
CM$VER      3.01.03g    05/10/2004
--------------------------------------------------------------------------------
- Amortização/ Refinanciamento: criada pergunta quando a margem for inferior ao
   valor resultante da parcela, para permitir refinanciamento assim mesmo
================================================================================
CM$VER      3.01.03f    01/10/2004
--------------------------------------------------------------------------------
- Busca de Contratos: ajustes na visualização;
- Envio de concessões/devoluções em lote: criação de opção para envio apenas de
   concessão, apenas de devoluções ou ambos;
- Concessão: crítica de itens em aberto para concessão de adiantamentos de 13º
================================================================================
CM$VER      3.01.03e    28/09/2004
--------------------------------------------------------------------------------
- Relatórios (2) de Valores a Creditar: exibição dos créditos por data de
   vencimento (do item) em vez de data de crédito (do contrato), que exibia uma
   data incoerente com faixa de datas do filtro em caso de devolução de algum
   valor, para contratos em andamento;
- Amortização e Quitação: correção da verificação de existência de atualização
   diária na data do evento;
- Busca de Contratos: exibição da data de crédito entre o nº do contrato e o
   nome do mutuário;
================================================================================
CM$VER      3.01.03d    27/09/2004
--------------------------------------------------------------------------------
- Acerto da situação contratual: correção na lógica do processo quando o sistema
   usar atualizaçào diária;
- Consulta de Contratos: criado botão para acerto da situação contratual;
- Utilitários: criado item de menu para acerto da situação contratual de
   múltiplos contratos;
================================================================================
CM$VER      3.01.03b    15/09/2004
--------------------------------------------------------------------------------
- Concessão: Aviso quando da concessão de mais de um contrato para mesma data;
- Amortização/Refinanciamento: passagem dos itens de devolução de seguro na
   redução de prazo;
================================================================================
CM$VER      3.01.02u    26/08/2004
--------------------------------------------------------------------------------
- Cadastro de Tipos de Contrato: criação de nova regra: Data da 1ª Parcela;
- Recebimento: otimização e correção de recebimento "duplicado";
- Desfazer Recebimento: otimização;
- Concessão: tratamento de nova regra de data da 1ª parcela;
================================================================================
CM$VER      3.01.02t    26/08/2004
--------------------------------------------------------------------------------
- Entrada manual: destino default = financeiro, e otimização da busca de um
   item entrado manualmente;
- Envio de concessões/devoluções em lote: correção do SQL de envio, que não
   enviava algumas devoluções em uma condição específica;
================================================================================
CM$VER      3.01.02s    25/08/2004
--------------------------------------------------------------------------------
- Novo relatório de Retenção de IOF por Plano/Patrocinadora;
- Amortização: passagem obrigatória pela regra de Margem, se FLGEXCEPCIONAL = 1
================================================================================
CM$VER      3.01.02r    24/08/2004
--------------------------------------------------------------------------------
- Recebimento: ajuste no recebimento de CaP;
================================================================================
CM$VER      3.01.02p    20/08/2004
--------------------------------------------------------------------------------
- Concessão: ajustes na crítica de prestações pagas para renovação;
- Concessão: ajuste na crítica de contratos não efetivados;
- Envio de concessões em lote: otimização das queries do processo;
- Cadastro de Tipos de Contrato: alteração do layout da tela e criação de novos
   campos de controle (permite geração de parcelas / permite refinanciamento);
- Desfazer envio: ajuste na alteração da situação contratual;
================================================================================
CM$VER      3.01.02l    11/08/2004
--------------------------------------------------------------------------------
- Alteração do valor de concessão: valor deixa de ser enviado no ato, para ser
   incorporado às concessões em lote;
- Amortização e Quitação: o envio para financeiro no ato passa a ser regulado
   por novos parâmetros do sistema, de forma análoga à concessão
================================================================================
CM$VER      3.01.02k    09/08/2004
--------------------------------------------------------------------------------
- Concessão: alteração da passagem do saldo de quitação do contrato anterior,
   para cálculo do IOF
- Amortização: passagem dos campos IDTIPOANT e VLRSOLICANT para as regras de
   amortização
================================================================================
CM$VER      3.01.02j    06/08/2004
--------------------------------------------------------------------------------
- Concessão: correção em uma query no processo de busca
- Busca de solicitante (Concessão): correção da busca por matrícula da ElegPatro
   para matrícula da DepenTit
================================================================================
CM$VER      3.01.02i    02/08/2004
--------------------------------------------------------------------------------
- Envio: alterações no processo para permitir agrupado
- Acerto no processo de Recebimento de parcelas da Folha
- Acerto no processo de Envio
- Aumento do campo de descrição do Item de Empréstimo para a impressão de inscrição
================================================================================
CM$VER      3.01.02h    13/07/2004
--------------------------------------------------------------------------------
- Desfazer Envio: processo completamente refeito, para permitir tratamento de
   envio agrupado e melhora de desempenho.
- Parâmetros do Sistema: alterado layout da tela (criada aba "Envio"), e criado
   parâmetro para regular envio agrupado para Folha(s)
- Busca de contratos: correção da busca por matrícula da ElegPatro para matrícula
   da DepenTit
- Pendencia 17297: Acerto na gravação de Concessão, Quitação e Amortização
================================================================================
CM$VER      3.01.02g    13/07/2004
--------------------------------------------------------------------------------
- Pendencia 17262: Tela Inscrição/Concessão/Renovação
   Acertado o processo de contabilização na contratação do Empréstimo
- Envio: Ajuste na alteração do destino do envio (para Financeiro), em caso de
   participante ativo no plano e não ativo na Patrocinadora.
================================================================================
CM$VER      3.01.02f    13/07/2004
--------------------------------------------------------------------------------
- Envio: Ajuste na alteração do destino do envio (para Financeiro), em caso de
   participante cancelado ('CA') e não ativo na Patrocinadora.
================================================================================
CM$VER      3.01.02e    13/07/2004
--------------------------------------------------------------------------------
- Envio: pendência 17160 (ajuste)
   Ajuste na alteração do destino do envio (para Financeiro), em caso de
   participante mantido ('MA', 'MP' e 'MS') e não ativo na Patrocinadora.
   APENAS PARA FLGEXCEPCIONAL = 1.
================================================================================
CM$VER      3.01.02d    08/07/2004
--------------------------------------------------------------------------------
- Envio (Folha)
   Correção da gravação do IDPLANOPREV e IDPLANOPREVCONTAB na TMPDESC
================================================================================
CM$VER      3.01.02c    06/07/2004
--------------------------------------------------------------------------------
- Desfazer Envio
   Correção da exibição do valor "desfeito" em caso de haver valores enviados
   e já baixados
================================================================================
CM$VER      3.01.02b    06/07/2004
--------------------------------------------------------------------------------
- Relatórios: pendência 16943
  - Resumo da Carteira Visão Saldo
  - Resumo da Carteira Visão Caixa
  - Resumo da Carteira Visão Caixa Linear
  - Valores Enviados/Recebidos por Patrocinadora (sintético por Item)
  Implementado filtro por Plano e Patrocinadora;
- Envio: pendência 17160 -
  Se a situação do Participante for "Mantido Parcial" (FLGINTERNO = 'MP'), e estiver
  ativo na Patrocinadora, (TIPOSIT = 'A'), o destino do envio passa a ser Folha da
  Patrocinadora. APENAS PARA FLGEXCEPCIONAL = 1.
================================================================================
CM$VER      3.01.02a    05/07/2004
--------------------------------------------------------------------------------
- Cadastro de Suspensão: correção da exibição dos tipos de suspensão possíveis
================================================================================
CM$VER      3.01.02     21/06/2004
--------------------------------------------------------------------------------
- Envio: na atualização do destino do Envio, participantes cedidos por um patrocinadora à Fundação passam a ser enviados para a folha da Fundação, independentemente de sua situação no Plano;
- Pendência 16983: Envio
Gravação de log dos itens enviados semelhante ao do processo de geração de parcelas;
- Pendência 16984: Quitação por Falecimento
Alterações na tela e funções de integração. As regras passam a receber a data do falecimento e o saldo devedor à época do falecimento também;
- Alterações na estrutura das BPLs, para disponibilização de novas funções a outros sistemas;
- Pendencia 17154 -  Chamada do processo de geração de RAD apos o lancamento do documento
- Pendencia 16894
   Na tela de recebimento automatico (financeiro a pagar ou receber) marcar o documento como conciliado
   Na tela de desfazer recebimento  (financeiro a pagar ou receber) marcar o documento como não conciliado
- Pendencia 16943
   Colocado filtro de plano/patro nos relatorios de fechamento de carteira
================================================================================
CM$VER      3.01.01f    08/06/2004
--------------------------------------------------------------------------------
- Acerto na tela de envio para contemplar envio ao financeiro para concessões e devoluções
- Acerto no relatório de resumo de carteira (visão saldo)
- Acerto no número de dependentes de IRRF na regra de Reserva dePoupança
================================================================================
CM$VER      3.01.01e    04/06/2004
--------------------------------------------------------------------------------
- Pendencia 16928: Para se conseguir cancelar uma quitação ou amortização tem que desfazer  o envio primeiro para depois conseguir cancelar o que antes não ocorria,  ao se efetuar o cancelamento o sistema automaticamente desfazia o doc do  financeiro;
- Pendencia 16930: Acerto no Tratamento Individual de Parcelas no Processo de Mudança de Vencimento
================================================================================
CM$VER      3.01.01d    27/05/2004
--------------------------------------------------------------------------------
- Acerto na rotina de Envio para o CaP/CaR para evitar erros nas datas de vencimento 
   quando gerar mais de um documento
================================================================================
CM$VER      3.01.01c    20/05/2004
--------------------------------------------------------------------------------
Pendência 16792: Correção da geração de arquivos de remessa, onde estava havendo incremento dos registros de um arquivo com os do arquivo anterior.
================================================================================
CM$VER      3.01.01b    05/05/2004
--------------------------------------------------------------------------------
- Acerto na Impressão da Inscrição da REFER
================================================================================
CM$VER      3.01.01a    29/04/2004
--------------------------------------------------------------------------------
- Acerto na geração do Arquivo Remessa para Banco
================================================================================
CM$VER      3.01.01     22/04/2004
--------------------------------------------------------------------------------
- Acerto na gravação da Planilha Contábil no Histórico do Empréstimo
================================================================================
CM$VER      3.01.00     16/04/2004
--------------------------------------------------------------------------------
- Acerto na contabilização do Resgate de Reserva
- Pendencia 16327 - Gravação de campo para ordenação de impressão dos itens
  de concessão na tela de Detalhes do Item por Tipo de Contrato e implementação dessa
  ordenação na tela de inscrição.
- Pendencia 16335 - Gravaçào de campo para indicar se o item será impresso na inscrição
  na tela de Detalhes do Item por Tipo de Contrato e implementação dessa critica na tela de inscrição.
- Pendencia 16339 - Inclusão de campo na tabela de tipo de contrato para indicar a quantidade
  de parcelas calculaveis para simulacao de emprestimo na internet
- Pendencia 16267 - Apresentava linhas de quitação por morte dos itens não centralizadores quando somente deveria aparecer itens de envio
- Pendencia 16324 - Acerto na query do Relatório de Retenção de IOF
- Pendencia 16115 - Ajuste nos totalizadores dos recebimentos no relatório de Fechamento de Carteira - Visão Caixa Linear ignorando abonados e quitados
- Pendencia 16174 - Gravação da data do Envio no Histórico
- Colocado campo de Data de Envio na consulta de contratos
- Criação de Parâmetro de IOF Complementar na Concessão
- Gravação dos valores base de cálculo para uso do Sistema de IRRF e Impostos
- Ajuste no tratamento de divergências, para efetuar estorno no documento caso a percela tenha sido cobrada no Contas a Receber
================================================================================
CM$VER      3.00.30c    15/04/2004
--------------------------------------------------------------------------------
- Acerto na busca de registros a serem contabilizados na Contabilização de Concessões em Lote
- Acerto no relatório de Valores Recebidos (Folha)
================================================================================
CM$VER      3.00.30b    08/04/2004
--------------------------------------------------------------------------------
- Acerto na contabilização quando do Resgate de Reserva
================================================================================
CM$VER      3.00.30     31/03/2004
--------------------------------------------------------------------------------
- Pendencia 16327 - Gravação de campo para ordenação de impressão dos itens
  de concessão na tela de Detalhes do Item por Tipo de Contrato e implementação dessa
  ordenação na tela de inscrição.
- Pendencia 16335 - Gravaçào de campo para indicar se o item será impresso na inscrição
  na tela de Detalhes do Item por Tipo de Contrato e implementação dessa critica na tela de inscrição.
- Pendencia 16339 - Inclusão de campo na tabela de tipo de contrato para indicar a quantidade
  de parcelas calculaveis para simulacao de emprestimo na internet
================================================================================
CM$VER      3.00.29e    23/03/2004
--------------------------------------------------------------------------------
- Pendencia 16324 - Acerto na query do Relatório de Retenção de IOF
================================================================================
CM$VER      3.00.29d    22/03/2004
--------------------------------------------------------------------------------
- Pendencia 16324 - Acerto na query do Relatório de Retenção de IOF
================================================================================
CM$VER      3.00.29c    18/03/2004
--------------------------------------------------------------------------------
- Pendencia 16115 - Ajuste nos recebimentos no relatorio de Fechamento de Carteira - Visao Caixa Linear
================================================================================
CM$VER      3.00.29b    16/03/2004
--------------------------------------------------------------------------------
- Ajuste no tratamento de divergências, para efetuar estorno no documento caso a percela tenha sido cobrada no Contas a Receber
================================================================================
CM$VER      3.00.29a    10/03/2004
--------------------------------------------------------------------------------
Ajuste na contabilização individual nas seguintes telas
- Inscrição/Concessão/Renovação
- Cancelamento de Concessão
- Geração Mensal de Parcelas
- Amortização
- Quitação
- Tratamento Individual de Parcelas
- Tratamento de Divergências
- Contabilizaçào de Concessões em Lote
================================================================================
CM$VER      3.00.29     09/03/2004
--------------------------------------------------------------------------------
Pendencia 16199 - Acerto no relatório de retenção de IOF
- Acerto no envio para o contas a pagar na contrataçào do empréstimo
================================================================================
CM$VER      3.00.28i    08/03/2004
--------------------------------------------------------------------------------
Passagem do Plano Prev. Contabil baseado no plano origem do Contrato para a TMPDESC
================================================================================
CM$VER      3.00.28g    19/02/2004
--------------------------------------------------------------------------------
- Pendencia 16115 - Implementação de linha de abonos e separacao pelo tipo de forma de cobranca
- Pendencia 16126 - COmmit após a geração de parcelas
================================================================================
CM$VER      3.00.28f    16/02/2004
--------------------------------------------------------------------------------
- Acerto na confirmação da amortização
================================================================================
CM$VER      3.00.28e    12/02/2004
--------------------------------------------------------------------------------
- Acerto na critica de atualizações posteriores na amortização
================================================================================
CM$VER      3.00.28d    09/02/2004
--------------------------------------------------------------------------------
-Acerto na query principal da consulta de contratos para levar em con sideração somente participantes que não estejam cancelados
================================================================================
CM$VER      3.00.28c    06/02/2004
--------------------------------------------------------------------------------
- Acerto na busca de contrato no tratamento de divergências
- Acerto na crítica de atualizações posteriores na quitação
- Acerto no estorno de itens no cancelamento de quitação
================================================================================
CM$VER      3.00.28b    05/02/2004
--------------------------------------------------------------------------------
- Pendencia 15968 - Relatório de Resumo de Carteira - Visao Caixa - Linear
- Acerto na critica da atualizações posteriores na quitação, conforme pedido da CBS
================================================================================
CM$VER      3.00.28a    04/02/2004
--------------------------------------------------------------------------------
Acerto na chamda da regra de limites
================================================================================
CM$VER      3.00.28     29/01/2004
--------------------------------------------------------------------------------
Pendencia 15967 - Acerto nos totais do relatorio de contratos concedidos
Pendencia 15979 - Incluido o join por IDPESSJUR entre ELEGPATRO e PARTPREVPLAN na regra de elegibilidade
================================================================================
CM$VER      3.00.27a    16/01/2004
--------------------------------------------------------------------------------
15943 - Acerto no campo saldo devedor das dividas de emprestimo na concessão
================================================================================
CM$VER      3.00.27     15/01/2004
--------------------------------------------------------------------------------
15924 - Acerto na tela de inscrição para quitação de empestimos anteriores
15938 - Acerto no relatorio de valores a creditar
15942 - Acerto no relatório de valores duvidosos
================================================================================
CM$VER      3.00.26     12/01/2004
--------------------------------------------------------------------------------
Ajuste mna tela de consulta de contratos para mostrar a situação do participante de maneira atualizada
================================================================================
CM$VER      3.00.25     09/01/2004
--------------------------------------------------------------------------------
- Ajuste na query de entrada de Elegibilidade para passar os campos DATAADMISSAO e DATAREF
- Ajuste na chamada do Relatorio de Contratos Concedidos por Tipo de Contrato
================================================================================
CM$VER      3.00.24     07/01/2004
--------------------------------------------------------------------------------
- Retirada dos forms de Progressão e verificação de preenchimento para em função da incorporação dos mesmos aos PadrõesCM;
- Pendencia 15627 - Registros zerados no tratamento de divergências - Ajuste de parametrização
- Ajuste no relatório de Valores Devidos Por Contrato para contemplar devoluções
- Pendência 15478 - Ajuste no cabeçalho da grid e tradução do campo SITENVIO
================================================================================
CM$VER      3.00.23     03/12/2003
--------------------------------------------------------------------------------
- Ajustes nas chamadas ao form de Progressão para compatibilização com os forms de mesmo nome no Imobiliário e Orçamento;
- Acerto da verificação de valores em atraso nos relatórios:
  - Valores Devidos por Contrato;
  - Valores Devidos por Indexador; 
  - Provisões para Créditos de Recebimento Duvidoso;
  - Resumo da Carteira - visão Saldo;
  - Resumo da Carteira - visão Caixa;
  - Resumo de Contratos - visão Caixa;
================================================================================
CM$VER      3.00.22r    26/11/2003
--------------------------------------------------------------------------------
>> Pequeno Ajuste no Form FcadInscricao que Marquetti pediu para fazer. Não tem pedência cadastrada (Urgência)
================================================================================
CM$VER      3.00.22q    17/11/2003
--------------------------------------------------------------------------------
>> Ajuste da pendência 15641: No momento da efetivação da Inscrição não exigir Banco, 
                                                    Agência e Conta corrente. Não alterar para Contratação do Empréstimo.
================================================================================
CM$VER      3.00.22p    17/11/2003
--------------------------------------------------------------------------------
>> Resolução da pendência 15641: No momento da efetivação da Inscrição não exigir Banco,
                                                    Agência e Conta corrente. Não alterar para Contratação do Empréstimo.
>> Resolução da pendência 15628: Não está passando na Regra de data de crédito, não grava no TEMP o  select;
>> Resolução da pendência 15629: Acertar o tipo desembolso, que quando utilizamos o envio do sistema está indo
                                                    errado para o Contas a Pagar, vai com o histórico de parcelas;
================================================================================
CM$VER      3.00.22n    28/10/2003
--------------------------------------------------------------------------------
- Passagem do campo IDSITPLANOPREV na query de entrada da regra de margem consignável;
================================================================================
CM$VER      3.00.22k    22/10/2003
--------------------------------------------------------------------------------
- Contabilização de Concessões por Lote: itens só são selecionados se tiverem valor previsto <> 0;
- Contabilização de Prestações por Lote: itens só são selecionados se tiverem valor previsto <> 0;
- Contabilização de Amortizações por Lote: itens só são selecionados se tiverem valor previsto <> 0;
- Contabilização de Quitações por Lote: itens só são selecionados se tiverem valor previsto <> 0;
- Contabilização de Encargos por Lote: itens só são selecionados se tiverem valor previsto <> 0;
================================================================================
CM$VER      3.00.22i    21/10/2003
--------------------------------------------------------------------------------
Pendencia 14912 - Criação do processo de liberação de concessões pendentes de assinatura do contrato
Pendencia 15227 - Criação do tratamento de itens não recebidos para re-envio, sem cobrança de encargos
Pendencia 15075 - Tratamento do flag Ativo na tabela TIPORECEBDESEMB
================================================================================
CM$VER      3.00.22h    15/10/2003
--------------------------------------------------------------------------------
- Concessão - Elegibilidade: passagem para a regra dos campos IDPESSOA e IDTITULAR;
- Tratamento de Itens não Recebidos: Nova opção de reenvio para a Folha do mesmo mês;
================================================================================
CM$VER      3.00.22g    12/09/2003
--------------------------------------------------------------------------------
- Recebimento: correção da busca (na TMPDESC) dos itens a receber;
- Desfazer Recebimento: correção no estorno dos itens decorrentes de recebimento parcial ou inesperado (SeqCobranca maior);
- Rel. Valores a Receber - Folha(s): criada opção de apresentação apenas dos itens ainda não processados;
- Rel. Valores a Receber - Folha(s): correção da ordenação por matrícula;
================================================================================
CM$VER      3.00.22e    03/09/2003
--------------------------------------------------------------------------------
Pendência 14967 - Relatório de Valores Devidos po Tipo de Contrato: corrigido erro na query;
Pendência 14970 - Inscrição: corrigido erro na query de entrada da regra de data de crédito;
================================================================================
CM$VER      3.00.22d    01/09/2003
--------------------------------------------------------------------------------
- Pendência 14944: Inscrição - Crítica quando da alteração da forma de pagamento;
================================================================================
CM$VER      3.00.22c    20/08/2003
--------------------------------------------------------------------------------
- Pendência 14886: Correção do erro, na Inscrição, da busca de outras dívidas;
================================================================================
CM$VER      3.00.22b    14/08/2003
--------------------------------------------------------------------------------
- Pendência 14826: Não permitido cancelamento de concessão (exclusão do documento de CaP/CaR) se o documento estiver contido em um lote;
================================================================================
CM$VER      3.00.22a    08/08/2003
--------------------------------------------------------------------------------
Pendencia 14530 - Processo de Commit no Tratamento de Divergências
Pendencia 14432 - Filtros por forma de cobrança na carta de cobrança
Pendencia 14654 - Preenchimento automatico do Portador Forma de acordo com a conta bancaria na concessão
Pendencia 14655 - Gravação dos parâmetros de integração na contabilização
Pendencia 14763 - Gravação dos filtros no cancelamento de envio de parcelas- 
================================================================================
CM$VER      3.00.22     30/07/2003
--------------------------------------------------------------------------------
Pendência 14744 - Separação entre Empréstimo e Folha de Benefíos do cadastro de Banco X Contas de Caixa X Forma de Pagamento
Pendência 14548 - Implementada nova tela para Desfazer Contabilização em Lote - Encargos;
Pendência 14547 - Implementada nova tela para Desfazer Contabilização em Lote - Amortização;
Pendência 14546 - Implementada nova tela para Desfazer Contabilização em Lote - Quitação;
Pendência 14545 - Implementada nova tela para Desfazer Contabilização em Lote - Prestação;
Pendência 14544 - Implementada nova tela para Desfazer Contabilização em Lote - Concessão;
Pendência 14599 - Implementada possibilidade de se escolher o caminho para gravação do arquivo de remessa;
================================================================================
CM$VER      3.00.21g    23/07/2003
--------------------------------------------------------------------------------
Pendência 14598 - Lançamento automártico da provisão de perdas, no momento da atualização diária do saldo devedor
Pendência 14470 - Ajustes na verificação de obrigatoriedade de assinatura de Contrato-Padrão
Pendência 14469 - Vinculação do Contrato-Padrão ao Plano
Pendência 14434 - Criado parâmetro para obrigar lançamento contábil em partida dobrada, independente do parâmetro da Contabilidade
Pendência 14521 - Novo relatório de Parcelas Geradas por Mês, com quebra por Patrocinadora
Pendência 14431 - Cancelamento de concessão não permitido quando o envio da concessão constar em um documento com mais outros contratos
Pendência 14430 - Exibição do filtro escolhido no cabeçalho dos 4 relatórios de itens gerados
Pendência 14510 - Exibição de mensagem se não houver documentos para o período indicado
Pendência 14484 - Sistema estava travando concessão em função do número de parcelas pagas do contrato anterior ser menor que o necessário (parâmetro do tipo de contrato), mesmo não sendo renovação
Pendência 14484 - Se o sistema estiver parametrizado para fazer envio em lote, NÃO fazer envio para CaP no momento da concessão
================================================================================
CM$VER      3.00.21b    17/06/2003
--------------------------------------------------------------------------------
Versão 03.00.20e
- Quitação Antecipada: Correção no teste de número de parcelas pagas para quitação;
- Parâmetros do Sistema: Inclusão de parâmetro para determinar se concessão não deve ser enviada no ato;
- Cálculo de itens de Quitação: na chamada da regra, mudança de metodologia para corrigir estouro de memória;
- Criação de parâmetro que indica se sistema usa controle de recebimento de inscrições;
- Controle de envio e recebimento de inscrições do participante para liberar contrataçào do Empréstimo;
- Novo processo: Desfazer Envio de Concessões em Lote;
Versão 03.00.20f
- Novo processo: Envio de Concessões por Lote;
- Novo processo: Geração de arquivo de remessa eletrônica;
Versão 03.00.21
- Novo processo: Envio de Concessões em Lote;
- Novo processo: Geração de arquivo de remessa eletrônica;
Versão 03.00.21a
- Recebimento: adequação da rotina ao novo processo de Envio de Concessões em Lote;
================================================================================
CM$VER      3.00.20d    19/05/2003
--------------------------------------------------------------------------------
- Contabilização pelo Plano "original" do Contrato (para casos de migração do participante);
- Relatórios de Valores Devidos: exibição do valor de concessão e do montante total pago até o momento;
- Concessão: correção da busca da data do sistema para comparação com a data de crédito;
- Relatório de Inscrições não efetivadas: correção da query;
================================================================================
CM$VER      3.00.20b    08/05/2003
--------------------------------------------------------------------------------
Versão 03.00.20a
- Contabilização de Prestações por Lote: correção da passagem da data de lançamento;
- Contabilização de Encargos por Lote: correção da passagem da data de lançamento;
Versão 03.00.20b
- Desfazer Geração de Parcelas: correção da atualização da situação contratual;
- Cancelamento de Concessão: correção da busca do documento de CaP;
- Simulação: permitida a escolha dos prazos que se deseja simular;
================================================================================
CM$VER      3.00.20     07/05/2003
--------------------------------------------------------------------------------
- Nova funcionalidade: Cartas de Cobrança;
- Concessão: Correção da busca de contratos anteriores no caso de o participante ter mais de uma inscrição na PartPrevPlan;
================================================================================
CM$VER      3.00.19t    06/05/2003
--------------------------------------------------------------------------------
Versão 03.00.19a
- Gravação do IDResponsavel na concessão e exibição do mesmo nas telas apropriadas;
- Gravação da Conta Bancária para débito, exibição nas telas apropriadas e tratamento no Envio e Alteração Contratual;
- Nova regra para prazo contratual;
Versão 03.00.19e
- Verbas: Implementada dotação mensal por plano/unidade centralizadora;
Versão 03.00.19f
- Inscrição/Concessão: correção da gravação do IDResponsável na inscrição/concessão;
- Inscrição/Concessão: correção da crítica da data de crédito ao buscar inscrição já gravada;
- Inscrição/Concessão: itens com valor igual a ZERO não são passados para impressão da inscrição;
Versão 03.00.19g
- Tratamento de Divergências: correção na busca da Conta Bancária;
Versão 03.00.19i
- Tratamento Individual: correção na alteração de vencimento;
Versão 03.00.19m
- Quitação: "quitação por morte" passa a ser "quitação por morte / invalidez";
- Quitação: de acordo com parâmetro do sistema, quitação por morte pode ou não quitar itens pendentes;
- Consulta de Contratos: exibição da data do tratamento de divergências e do tipo de tratamento dado;
Versão 03.00.19n
- Amortização: correção da data de Lançamento (CaP/CaR);
- Tratamento Individual: correção do insert da diferença em caso de baixa manual parcial;
Versão 03.00.19p
- Cancelamento de Concessão: correção do tratamento de valor concedido ZERO;
- Desfazer Recebimento: Inclusão da função de atualização da situação contratual, como no Recebimento;
Versão 03.00.19q
- Relatório de Valores Devidos por Indexador: correção da query para valores devidos (devidos - pagos);
- Tratamento Individual - alteração de vencimento: correção do cálculo de encargos quando há mais de 1 item em aberto por parcela;
Versão 03.00.19r
- Inscrição: na alteração da forma de pagamento, é disparado recálculo dos valores, em função de uma provável alteração na data de crédito;
Versão 03.00.19s
- Parâmetros do Sistema: correção da gravação da FLGCONTABENCARGO;
- Geração de Parcelas: verificação do FLGCONTABPARCELA e inibição da contabilização de acordo;
- Tratamento de divergências: verificação do FLGCONTABENCARGO e inibição da contabilização de acordo; 
- Contabilização de Prestações por Lote: ajustes;
- Contabilização de Encargos por Lote: ajustes;
Versão 03.00.19t
- Impressão da Simulação: alteração do nome dos itens;
- Impressão da Inscricao: funcionalidade de e-mail;
- Concessão: passagem da data da primeira paracela para as regras de cálculo dos itens da concessão;
================================================================================
CM$VER      3.00.19m    11/04/2003
--------------------------------------------------------------------------------
- Quitação: "quitação por morte" passa a ser "quitação por morte / invalidez";
- Quitação: de acordo com parâmetro do sistema, quitação por morte pode ou não quitar itens pendentes;
- Consulta de Contratos: exibição da data do tratamento de divergências e do tipo de tratamento dado;
================================================================================
CM$VER      3.00.19i    10/04/2003
--------------------------------------------------------------------------------
Versão 03.00.18m
- Cancelamento de Quitação e Amortização: correção da gravação da DataEstorno quando não há estorno contábil;
- Parâmetros para integração (itens): correção da gravação do RecPag;
- Fiário: correção da gravação do IDModulo;
Versão 03.00.19a
- Gravação do IDResponsavel na concessão e exibição do mesmo nas telas apropriadas;
- Gravação da Conta Bancária para débito, exibição nas telas apropriadas e tratamento no Envio e Alteração Contratual;
- Nova regra para prazo contratual;
Versão 03.00.19e
- Verbas: Implementada dotação mensal por plano/unidade centralizadora;
Versão 03.00.19f
- Inscrição/Concessão: correção da gravação do IDResponsável na inscrição/concessão;
- Inscrição/Concessão: correção da crítica da data de crédito ao buscar inscrição já gravada;
- Inscrição/Concessão: itens com valor igual a ZERO não são passados para impressão da inscrição;
Versão 03.00.19g
- Tratamento de Divergências: correção na busca da Conta Bancária;
Versão 03.00.19i
- Tratamento Individual: correção na alteração de vencimento;
================================================================================
CM$VER      3.00.18m    27/03/2003
--------------------------------------------------------------------------------
- Cancelamento de Quitação e Amortização: correção da gravação da DataEstorno quando não há estorno contábil;
- Parâmetros para integração (itens): correção da gravação do RecPag;
- Fiário: correção da gravação do IDModulo;
================================================================================
CM$VER      3.00.18k    26/03/2003
--------------------------------------------------------------------------------
Versão 03.00.18f
- Relatório de Itens Enviados/Recebidos por Patrocinadora - sintético por Evento: alterações no filtro e lógica do relatório (valores negativos);
- Tratamento de Divergências: nova opção - apenas atualizar data de vencimento;
- Regra de Itens quitados: correção da gravação da DataQuitAbono;
- Tratamento de Divergências: volta da exibição dos itens originais no resultado (que havia sido retirado na 03.00.16k);
Versão 03.00.18g
- Gravação do LogTotalPrev para os principais eventos;
- Desfazer Envio: verificação do documento antes da tentativa de exclusão para agilizar processo;
- Tratamento de Divergências:
- Nova tela de Contabilização em Lote de Parcelas;
- Nova tela de Contabilização em Lote de Encargos;
- Tratamento de Divergências: gravação da data do tratamento e da tipo de tratamento dado;
Versão 03.00.18h
- Concessão: inclusão do IDPLANOPREV nas queries de entrada de Salário-Base e Margem Consignável;
- Novo Relatório: Valores enviados/recebidos (Financeiro) - sintético por Item de Empréstimo;
Versão 03.00.18i
- Novo Relatório: Valores enviados/recebidos (Financeiro) - analítico;
- Quitação: se for quitação por morte ou por resgate, marca TODOS os itens como "quitados";
- Concessão (limites): passagem do valor líquido para a regra de limites;
Versão 03.00.18k
- Tratamento diferenciado para participantes LEF;
================================================================================
CM$VER      3.00.18d    05/05/2003
--------------------------------------------------------------------------------
Versão 03.00.17g
- Inscrição: passagem do campo IDTITULAR na query de entrada da regra de Margem Consignável;
Versão 03.00.18
- Tipo de Contrato: criação de nova regra para valor máximo;
Versão 03.00.18a
- Tratamento Individual: correção do desvio de CaR para Folha;
- Desfazer Envio: correção na exclusão de documentos de CaP/CaR;
- Desfazer Recebimento: filtro por data de recebimento;
- Inscrição: alterações na query de entrada para regra de Reserva de Poupança (inclusão de novos campos);
Versão 03.00.18b
- Inscrição: alterações na busca do mutuário solicitante para contemplar casos especiais: não participantes e participantes ativos em 2 patrocinadoras simultaneamente;
- Inscrição: uso da nova regra de Valor Máximo, caso esteja cadastrada no Tipo de Contrato;
- Inscrição: passagem do nome do Responsável nos SQLs de entrada das regras de Elegibilidade e Prazos de Concessão;
Versão 03.00.18c
- Contabilização: implementação de partida dobrada para todas as contabilizações do Sistema, obedecendo ao parâmetro PACDOBRADA da ParamContab;
Versão 03.00.18d
- Tratamento Individual: disponível para CentralAP;
================================================================================
CM$VER      3.00.17f    07/03/2003
--------------------------------------------------------------------------------
Versão 03.00.17
- Inscrição: seleção automática do mutuário quando se faz inscrição pela CentralAP;
Versão 03.00.17a
- Consulta de Contratos: disponibilizada na BPL de interface do Sistema;
Versão 03.00.17b
- Quitação: disponibilizada na BPL de interface do Sistema;
- Amortização: disponibilizada na BPL de interface do Sistema;
Versão 03.00.17f
- Cancelamento de Quitação: disponibilizada na BPL de interface do Sistema;
- Cancelamento de Amortização: disponibilizada na BPL de interface do Sistema;
================================================================================
CM$VER      3.00.17b    25/02/2003
--------------------------------------------------------------------------------
Versão 03.00.17
- Inscrição: seleção automática do mutuário quando se faz inscrição pela CentralAP;
Versão 03.00.17a
- Consulta de Contratos: disponibilizada na BPL de interface do Sistema;
Versão 03.00.17b
- Quitação: disponibilizada na BPL de interface do Sistema;
- Amortização: disponibilizada na BPL de interface do Sistema;
================================================================================
CM$VER      3.00.16p    24/02/2003
--------------------------------------------------------------------------------
Versão 03.00.16o/p
- Tratamento Individual: ajuste no agrupamento de itens quando da alteração de vencimento;
- Tratamento Individual: verificação da nova situação contratual quando de baixa manual / abono;
- Relatório de Resumo de Contratos - visão Saldo: mudança na lógica, para evitar problemas com a área de rollback do banco;
- Recebimento: nova lógica para verificação da nova situação contratual;
================================================================================
CM$VER      3.00.16m    17/02/2003
--------------------------------------------------------------------------------
Versão 03.00.16a
- Quitação: correção da data de lançamento para integração com Contas a Receber;
- Relatório de Valores enviados/recebidos (sintético por evento): correção das 3 colunas de "valor efetivo';
- Geração de Parcelas: adequação da seleção de itens a contabilizar à possibilidade de se contabilizar as parcelas após outros eventos (como quitação);
- Relatório de Valores enviados/recebidos (analítico): correção do valor recebido quando negativo;
Versão 03.00.16b
- Tratamento Individual (alteração de vencimento): não contabiliza mais no momento da alteração;
Versão 03.00.16e
- Recebimento: ajustes diversos;
- Parâmetros do Sistema: opção de não contabilização de Amortizações no momento das mesmas;
- Novo Menu: Contabilizações;
- Nova funcionalidade: Contabilização de Amortizações por Lote;
Versão 03.00.16f
- Cancelamento de Quitação por regate: correção;
- Novos relatorios;
Versão 03.00.16h
- Otimização do processo de devoluções em lote;
- Ajustes nos relatórios de Resumo - visão Saldo;
Versão 03.00.16i
- Alteração Contratual: criação de mensagem informativa;
Versão 03.00.16m
- Tratamento de Divergências: ajustes nos filtros;
- Tratamento de Divergências: seleção dos itens a contabilizar de acordo com os filtros escolhidos para o Tratamento;
- Tratamento de Divergências: exibição no "resultado" apenas dos itens calculados (exibia os itens calculados E os itens originais tratados);
================================================================================
CM$VER      3.00.15i    01/02/2003
--------------------------------------------------------------------------------
Versão 03.00.15f
- Relatório de Parcelas Geradas: opção de filtro por item + exibição do mês de competência e do item escolhido no cabeçalho do relatório;
- Envio: itens suspensos são desmarcados antes início do processo de envio / suspensão;
- Relatório de Resumo da Carteira - visão Saldo: quitações passam a ser exibidas em 2 colunas, com e sem parcela gerada;
- Relatório de Resumo da Carteira - visão Caixa: ajustes gerais;
Versão 03.00.15g
- Geral: ajustes na busca do Saldo Devedor;
- Relatório de Valores Devidos: ajustes na busca do Saldo Devedor;
- Relatório de Valores Devidos por Indexador: ajustes na busca do Saldo Devedor;
- Relatório de Provisões para Recebimentos Duvidosos: ajustes na busca do Saldo Devedor;
Versão 03.00.15h
- Relatório de Itens Envados / Recebidos (sintético por Evento): correção dos valores do Financeiro;
Versão 03.00.15i
- Envio: Participantes com SitPart = 'CA' e SitFunc = 'A' passam a ser enviados para a Folha da (s) Patrocinadora(s);
================================================================================
CM$VER      3.00.15e    27/01/2003
--------------------------------------------------------------------------------
Versão 03.00.14e
- Relatórios de Valores Enviados / Recebidos: valores negativos (devoluções) são mostrados e somados como positivos, para refletir a situação nas folhas e no CaP/CaR;
- Relatórios Conferência de ValoresEnviados / Recebidos: valores negativos (devoluções) são mostrados e somados como positivos, para refletir a situação nas folhas e no CaP/CaR;
Versão 03.00.14f
- Relatório de Resumo da Carteira (visão Saldo): exibição correta da quantidade de eventos;
- Relatório de Resumo da Carteira (visão Saldo): otimização da query do relatório;
- Relatório de Resumo da Carteira (visão Saldo): filtro por Contrato;
- Relatório Itens Enviados/Recebidos (sintético por Evento): filtro por Contrato;
- Envio: otimização do processo;
Versão 03.00.14g
- Envio: Correção da atualização da sitpart;
Versão 03.00.14h
- Desfazer Geração de Parcela: correção do processo quando não há itens a contabilizar;
- Abono: itens abonados não são mais marcados como "estornados";
Versão 03.00.15a
- Relatório de Resumo de Carteira (visão Saldo): criada nova coluna "Contratos Encerrados";
- Relatório de Quitações não Efetivadas: ajustes gerais;
Versão 03.00.15b
- Inscrição / Concessão: corrigido "vazamento de memória" que ocorria na impressão do Contrato;
Versão 03.00.15c
- Relatórios de Valores Devidos: ajuste para consirerar concessões do mês;
Versão 03.00.15e
- Relatórios de Valores Devidos: ajuste para consirerar o mês de competência ao buscar o saldo devedor;
- Relatório Fechamento de Carteira - Saldo: ajuste para consirerar o mês de competência ao buscar o saldo devedor nas datas limite;
- Envio: correção na atualização da forma de envio pré-envio;
================================================================================
CM$VER      3.00.14c    18/01/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11578
  > Tela\Opçao No Sistema: Quitação, Cancelamento de Quitação, Nova Tela
  Opção (regulada por parâmetro) de não contabilizar os itens de quitação no ato da mesma. Criar nova tela de contabilização de quitações em Lote. Estender essa condição à quitação por resgate / benefício único (AdmPrev)?
- Resolução da Pendência Nº 11581
  > Tela\Opçao No Sistema: Tratamento de Divergências
  Criar campo para indicação de data para os lançamentos contábeis de encargos.
- Resolução da Pendência Nº 11582
  > Tela\Opçao No Sistema: Tratamento de Divergências
  Testar o período contábil ANTES de iniciar o tratamento de divergências.
- Resolução da Pendência Nº 11583
  > Tela\Opçao No Sistema: Relatório de Resumo da Carteira (visão Saldo)
  Corrigir o nº de contratos informados nas colunas de Saldo Anterior e Saldo Atual. Está sendo exibido o total de contratos da carteira naquele momento. Precisa ser exibido o total de contratos que ainda possuam saldo devedor no momento do relatório.
- Resolução da Pendência Nº 11590
  > Tela\Opçao No Sistema: Geração de Parcelas
  Testar o período contábil antes de iniciar a geração.
- Resolução da Pendência Nº 11591
  > Tela\Opçao No Sistema: Desfazer geração de parcelas
  Adequar o processo à (nova) opção de não contabilização no momento da geração. Prever que pode não haver necessidade de estorno contábil. Opção de informar a data de estorno. Testar o período contábil antes de iniciar o processo.
================================================================================
CM$VER      3.00.14a    17/01/2003
--------------------------------------------------------------------------------
Versão 03.00.13a
- Cancelamento de Concessão: correção da busca de itens a estornar;
- Relatório de Valores Devidos: correção na query;
Versão 03.00.13b
- Relatório de Valores Devidos: correção na query;
- Relatório de Valores Devidos por Indexador: correção na query;
- Relatório de Provisão para Créditos Duvidosos: correção na query;
Versão 03.00.13c
- Relatório de Análise Contábil: adequação da busca (itens quitados, abonados e estornados);
Versão 03.00.13d
- Relatório de Valores Devidos: correção na query;
- Recebimento: valor recebido (TMPDESC) passa a ser comparado com o valor previsto na Hist, não na TMPDESC;
- Tratamento Individual: correção no filtro para exibição dos itens em aberto;
Versão 03.00.13e
- Quitação: marcação condicional de "quitado" (de acordo com regra) para os itens em aberto no momento da quitação;
Versão 03.00.13f
- Cancelamento de Concessão: correção da busca de itens a estornar;
- Consulta de Contratos: alteração da condição de exibição de itens em aberto;
Versão 03.00.13g
- Tratamento Individual: correção no filtro (itens suspensos);
Versão 03.00.13i
- Geração de Parcelas: opção de NÂO contabilizar;
- Recebimento: correção da marcação de itens baixados no recebimento financeiro;
- Tratamento Individual: possibilidade de baixar manualmente itens negativos com valor diferente;
Versão 03.00.13m
- Impressão da simulação: correta exibição do valor de quitação do contrato anterior;
Versão 03.00.14
- Preparação para gravação do LogTotalPrev - Empréstimos;
Versão 03.00.14a
- Tratamento Individual: ajuste no Desfazer Suspensão;
- Tratamento Individual: ajuste na ordenação dos itens;
- Relatório de Resumo da Carteira (Saldo): ajuste do saldo devedor anterior;
================================================================================
CM$VER      3.00.13     12/01/2003
--------------------------------------------------------------------------------
Versão 03.00.12a
- Consulta de Contratos: exibição da data de inclusão, origem e usuário que incluiu o item;
Versão 03.00.12b
- Cancelamento de quitação: correção da selecão de itens a estornar;
Versão 03.00.12c
- Recebimento: ajustes na inserção de recebimentos "inesperados" quando o item a receber está marcado como "quitado";
Versão 03.00.12d
- Recebimento: ajustes no recebimento de valores do Financeiro - a Receber;
Versão 03.00.12e
- Recebimento: ajustes no recebimento de valores do Financeiro - a Receber;
- Tratamento individual de parcelas: correção no Desvio;
Versão 03.00.12f
- Concessão: corrigido o nº de parcelas pagas passado para a regra de Limites;
Versão 03.00.12g
- Concessão: corrigida a busca do tipo de recebimento ou desembolso;
Versão 03.00.12h
- Concessão: opção de não contabilização da concessão;
- Cancelamento de Concessão: alterações para levar em conta a possível não contabilização da concessão/renovação;
Versão 03.00.12i
- Nova implementação: Contabilização de Concessões em Lote;
Versão 03.00.12k
- Recebimento: correção do recebimento de itens com divergência de datas;
Versão 03.00.13
- Nova implementação: Entrada Manual de Cobranças e Devoluções;
- Nova implementação: Envio de Devoluções em Lote - Financeiro;
- Nova implementação: Ajuste de Valores a Receber - Financeiro;
- Adequação dos relatórios de Dívidas (pasta inadimplência);
- Relatório de Valores a Creditar: filtro por contratos eftivados/não efetivados;
================================================================================
CM$VER      3.00.12     03/01/2003
--------------------------------------------------------------------------------
- Recebimento: Quitação de contratos quando do recebimento do item de quitação ou da último item em aberto (quando não houver mais saldo devedor);
================================================================================
CM$VER      3.00.11s    19/12/2002
--------------------------------------------------------------------------------
Versão 03.00.11n
- Geração mensal de Parcelas: itens divergentes anteriores deixam de ser restrição para geração de parcelas;
- Geração mensal de Parcelas: otimização da query que busca os contratos cuja parcela precisa ser gerada;
- Tratamento individual de Parcelas: retirada restrição ao abono de itens que estejam ligados a documentos de CaR;
- Inscrição: verificação dos contratos anteriores passa a tratar parcelas em aberto ainda não vencidas, de acordo com novo parâmetro do sistema;
Versão 03.00.11o
- Limites: alteração do SQL de entrada, para contemplar contratos encerrados porém ainda com itens em aberto;
Versão 03.00.11p
- Consulta de Contratos: novos filtros por evento e item;
Versão 03.00.11r
- Envio: otimização do processo de atualização de Rubricas, em caso de seleção de apenas 1 Contrato;
- Envio: otimização do processo de da forma de envio em função da SitPart, em caso de seleção de apenas 1 Contrato;
- Envio: atualização do RecPag dos itens: valores negativos invertem a natureza original do item;
- Envio: atualização da forma de envio passa a considerar flgInterno 'CA' como Financeiro, e 'CA' + pensionista como Folha;
- Consulta de Contratos: novo filtro para exibição de itens em aberto;
- Consulta de Contratos: exibiçao de itens abonados e quitados de forma diferenciada; 
- Relatórios de dívidas (todos): correção no filtro para levar em conta contratos com flgSituacao = 'Q' também;
- Relatórios de dívidas (por Contrato): opção de exibir apenas contratos com saldo devedor maior que ZERO;
- Desfazer recebimento: não mais exclui registros, apenas marca os itens como "estornados";
- Inscrição/Concessão: alterações no SQL de entrada da regra da Data de Crédito;
Versão 03.00.11s
- LogOperacoes ativado;
================================================================================
CM$VER      3.00.11k    06/12/2002
--------------------------------------------------------------------------------
- Cancelamento de concessão: a data da planilha de estorno do Contrato (de concessão) passa a ser a de cancelamento, e não mais a de concessão;
- Cancelamento de concessão: os itens de quitação do(s) cotrato(s) anterior(es) passam a ser estornados, assim como a contabilização, ao invés de excluídos;
================================================================================
CM$VER      3.00.11i    04/12/2002
--------------------------------------------------------------------------------
- Relatório de Conferência de Valores Enviados / Recebidos por Contrato: correção na query do relatório;
================================================================================
CM$VER      3.00.11h    04/12/2002
--------------------------------------------------------------------------------
- Quitação por resgate de reserva (AdmPrev): correção da envio de itens marcados como "quitados" ou "abonados";
- Cadastro de Datas por Patrocinadora: retirada da condição que verificava o campo TPPLANOPREV da tabela PLANPREV (que acarretava o preenchimento incorreto da árvore de planos);
================================================================================
CM$VER      3.00.11g    03/12/2002
--------------------------------------------------------------------------------
- Recebimento (Folha): otimização do tempo do processo;
- Desfazer quitação por resgate de reserva (AdmPrev): correção da exclusão dos registros da Folha;
================================================================================
CM$VER      3.00.11f    02/12/2002
--------------------------------------------------------------------------------
- Recebimento (Folha): Correção na passagem de parâmetros que estavam com erro;
================================================================================
CM$VER      3.00.11e    02/12/2002
--------------------------------------------------------------------------------
- Amortização: passagem dos valores de concessão para as regras de cálculo dos itens;
- Amortização: forma de envio só fica visível se houver item centralizador calculado;
- Cálculo de itens: passagem de dados da concessão (data de crédito e valor do crédito) para todas as regras de cálculo de itens;
================================================================================
CM$VER      3.00.11d    22/11/2002
--------------------------------------------------------------------------------
- Recebimento: acerto dos campos dos itens a ser inserido em caso de recebimento inesperado;
================================================================================
CM$VER      3.00.11c    22/11/2002
--------------------------------------------------------------------------------
Versão 03.00.11a
- Geração de Parcelas: Correção da gravação do número de parcelas remanescentes (só ocorria erro em caso de refinanciamento com mudança de prazo). No momento do cálculo, estava pegando o nº de parcelas remanescentes da query de busca do saldo devedor anterior (o que é o correto). Porém, logo antes da gravação, estava pegando NumParcelas da query principal de ContratosGeração, o que fazia com que não fossem levados em conta eventuais refinanciamentos com alteração do prazo contratual;
- Impressão da inscrição: correção da alteração (pelo usuário) do layout do relatório;
- correção no recebimento de Contas a Pagar (campo incorreto) que ficava em loop;
Versão 03.00.11b
- Alteração no layout do relatório de impressão da Inscrição (para contemplar detalhe para os itens de concessão);
- Alteração na ordenação do histórico na Consulta de Contratos para que quitações sejam exibidas por último, e não antes dos itens de atualização de saldo/débitos;
- Cancelamento de Concessão: correção da exclusão da planilha contábil de quitação do contrato anterior;
Versão 03.00.11c
- Tratamento de Divergências: correção do filtro de itens divergentes;
- Tipo de Contratos de Empréstimo: mudança no uso do FLGSEGURO ("Contrato Garantido por Seguro / Fundo em caso de morte"); O FLG passa a indicar TODOS os contratos que comportam quitação por morte;
- Resolução da Pendência Nº 7061
  > Tela\Opçao No Sistema: Concessão
  Permitir alteração no valor concedido até 5 dias após concessão.
- Resolução da Pendência Nº 8914
  > Tela\Opçao No Sistema: Consulta de contratos
  O sistema deve mostrar valores negativos com sinal de menos (-). 
- Resolução da Pendência Nº 9218
  > Tela\Opçao No Sistema: Tratamento Individual
  Controle de Acesso dos botões do tratamento Individual.
================================================================================
CM$VER      3.00.11     16/11/2002
--------------------------------------------------------------------------------
- Correção da marcação dos itens em aberto do(s) contrato(s) anteriores como 
  "quitados" na Renovação;
- Correção da gravação do valor efetivo ZERO quando esse for o caso;
- Envio: no envio para Folha(s), passa a haver paridade entre HistMovEmptmo e
  TMPDESC, ie, para cada registro da Hist haverá um correspondente na TMPDESC 
  (o campo ORDEM da TMPDESC corresponde ao IDHISTMOVEMPTMO);
- Recebimento: passa a levar em conta a paridade entre HistMov e TMPDESC (acima);
**************************************************************************
A partir desta versão, não pode haver NENHUM registro na TMPDESC
onde IDMODULO = 15, FLGTIPODESC = 'E' e ORDEM = NULL
TODOS os registros nessa situação serão considerados recebimentos inesperados,
e acarretarão devolução do valor cobrado.
**************************************************************************
- Resolução da Pendência Nº 9218
  > Tela\Opçao No Sistema: Tratamento Individual
  Controle de Acesso dos botões do tratamento Individual.
================================================================================
CM$VER      3.00.09     25/09/2002
--------------------------------------------------------------------------------
************************************************************************
A partir desta versão, são necessárias as seguintes BPLs para execução do Sistema:
- CMIntegraEP50.bpl;
- CMObjetosEP50.bpl;
- CMExecEP50.bpl;                                                                                               
************************************************************************
- Suspensão de Cobrança: 
Criado cadastro de tipo de suspensão
Criada tela de relacionamento de tipo de suspensão por tipo de contrato
Alterada tela de inscrição/concessão/renovação
Alterada tela de Alteração Contratual
Criada tela de Liberação de Suspensão
- Parâmetros do Sistema:
Incluido campo FLGMOSTRATIT, pois algumas fundações não querem que sejam mostrados os dados dos titulares nas telas de Inscrição/Concessão/Renovação, Cancelamento de Concessão e Consulta de Contratos.
- Suspensão de Concessão:
Criado Cadastro de Suspensão de Concessão 
Alterada tela de Inscrição/Concessão/Renovação
- Relatório de Conta-Corrente:
Data de quitação/abono levada em conta para cálculo dos valores;
Ajustes na tela de cancelamento de inscrição;
Ajustes na tela de cancelamento de concessão;
Ajustes na pesquisa na tela de alteração contratual;
Ajustes na pesquisa na tela de amortização;
Ajustes na pesquisa na tela de cancelamento de amortização;
Ajustes no recebimento para não levar em consideração itens de atualização diária;
Ajuste na tela de consulta de contratos para não mostrar os itens de atualização diária quando se escolhe visualizar somente itens de envio;
================================================================================
CM$VER      3.00.08     04/08/2002
--------------------------------------------------------------------------------
- Relatório de Conta-corrente: 
Se o mês de filtro for o mês de concessão, exibe o valor da parcela-base na coluna "Valor Parcela";
Se o mês de filtro for o mês de concessão, exibe o valor da coluna "saldo" na coluna "Total do Débito";
Filtro por Participante substituindo filtro por Contrato;
Filtro por por Situação do Participoante no Plano (SitPlanoPrev);
- Elegibilidade:
FLGBLOQUEIO (tabela PessoaFisica) passada para query de entrada da regra de elegibilidade;
- Incrição:
Query da regra de entrada de cálculo dos itens passa a ser ordenada por Hmetipomov + SeqCalculo 
(afeta apenas a ordem de cálculo da prestação básica que passa a ser o último item calculado, após todos os de concessão)
- Relatório de inscrições pendentes mudou de nome para "inscrições não efetivadas".
.Valor Maximo Permitido: Limpando apos gravar;
.Passando a forma de pagamento para Financeiro
.Campo data de credito habilitado sempre
.Envio financeiro sem erro de IDCBANCARIA
.Tratamento de divergencia sem erro em MOECODIGO
.Tratamento individual de parcela sem erro em MOECODIGO
- Passagem do MoeSigla para todas as regras de cálculo;
Periodo de 04/06/2002 a 07/06/2002
- Acerto no tratamento de divergencias
- Acerto no agrupamento de itens enviados para a tmpdesc
- Acerto no recebimento
- Acerto no relatorio de parcelas geradas no mes
- Geracao de divergencias de parcelas em aberto na tela de fechamento de patrocinadora
- Acerto nos totais do relatorio de parcelas geradas (sintetico) 
Parâmetros do Sitema:
- Parâmetro que indica envio de prestações agrupadas ou não
- Gravação do nº de parcelas / nº da parcela na TMPDESC (se for o caso: agrupa parcelas ou não);
Data: 17/06/2002
Recebimento da TMPDESC – Acerto na rotina 
Cancelamento de recebimento – Ajuste na rotina 
Relatório de itens enviados (analitico por patrocinadora) – Ajuste nas quebras
Data: 18/06/2002
Relatório de parcelas geradas – Ajuste no relatório 
Relatório de Valores a Creditar – Ajuste na quebra 
Consulta de Contratos – Ajuste nos filtros 
Tratamento individual de parcelas – Ajuste na baixa manual
Data: 19/06/2002
Relatório de Concessões – Colocada quebra plano/patro 
Fechamento de patrocinadoras – Colocado fechamento de recebimento para tratamento de divergências
- Alteração no layout do relatório de Movimentação por Contrato (extrato de movimentação)
(para ficar + parecido com consulta de contratos), alteração nas opções de ordenação
Concessão:
1) Grid de dividas contendo o tipo de contrato
2) Valor em aberto para cada contrato ativo
3) Valor da parcela
4) Solicitada a criacao das colunas VLRPARCELAMES NUMBER(17,2) e VLRPARCATRASO NUMBER(17,2) nas tabelas INSCRICAOEMPTMO e CONTRATOEMPTMO
5) Gravacao dos valores nas colunas acima
6) Checkbox para contratos selecionados para quitacao
7) Quitar os contratos selecionados
8) OnExit dos controles que disparam recalculo testa activecontrol em cancelar e sair
9) Disparo de recalculo se valores (salario e margem) tiverem sido alterados
10) Nao dispara recalculo quando troca valor maximo
- Suspensão indeterminada de cobrança na concessão - usa o flgSuspensaoAuto anteriormente não utilizado.
- Nova forma de agrupamento para envio: só por rubrica / contrato
- Passagem do VLRMAXPERMIT p/ regras de cálculo
- Alteração o conceito de "Titular + Beneficiário do Empréstimo" para "Mutuário + Titular do Mutuário"
- Resolução da Pendência Nº 7063
  > Tela\Opçao No Sistema: Recebimento / Tratamento de Divergências
  - Alterar Recebimento Automático para não mais gerar diferenças (passar para divergências);
- Alterar Tratamento de Divergências para permitir devolução/desvio/alteração de vencimento e prever incorporação de valores pendentes ao saldo devedor;
================================================================================
CM$VER      3.00.07     07/05/2002
--------------------------------------------------------------------------------
1) Concessão
   - correção na busca de verba para concessão;
   - verificação de contratos anteriores não efetivados previamente à quitação;
2) Consulta de Contratos:
   - Exibe saldo devedor atual e numero de parcelas restantes
   - Exibe os beneficiários de seguro
3) Cadastro de Itens por Tipo de Contrato:
   - Desabilitadas rubricas/conta de baixa para itens de cálculo diário
4) Amortização:
   - Não permite nova amortização quando existe amortização anterior em aberto
   - Não permite nova amortizaçào existindo parcelas anteriores em aberto, conforme parâmetro do sistema
5) Renovação:
   - Repete beneficiários do contrato anterior
   - Não permite renovação quando existem itens em aberto, não levando em consideração itens suspensos
6) Parâmetros do sistema:
   - Criado parâmetro para permitir ou não amortização para parcelas anteriores em aberto
   - Criado parâmetro para permitir ou não renovação para parcelas anteriores em aberto
   - Gravação automática do Protocolo
7) Tipo de Contrato:
   - Criado parâmetro para indicar obrigatoriedade de informação de beneficiário de seguro
   - Indexador Padrão;
8) Alteração Contratual:
   - Permite alteração de beneficiários de seguro;
9) Parametrização Financeira:
   - Habilita ou desabilita contas conforme itens centralizador ou destacado;
11) Contrato
   - Campos indicativos de Salário-Base (alimentado por nova Regra) e Valor máximo permitido;
   - Possibilidade de alteração dos valores de Salário-Base e Margem Consignável, com gravação dos valores no Contrato;
================================================================================
CM$VER      3.00.05     02/04/2002
--------------------------------------------------------------------------------
Recebimento:
- Permite recebimento separado de Folha de Benefícios, Folha da Patrocinadora e Financeiro;
Desfazer envio:
- Permite filtro por Folha de Benefícios, Folha da Patrocinadora, Financeiro;
Amortização 
- Envio para Financeiro no ato;
- Contabilização e geração de Documento para recebimento da(s) patrocinadoras corrigidos e realocados para o menu do cliclo básico;
Relatórios:
- Valores devidos: passou a ser histórico, ie, leva em conta a data dos recebimentos;
- Novo relatório: Resumo da Carteira (visão Caixa);
- Novo relatório: Itens Enviados (sintético);
- Novo relatório: Conta-corrente;
- Correção da gravação do CodDocumento do envio para financeiro;
- Correção no recebimento parcial de itens no processo de recebimento automático;
- Gravação da data de quitação nos itens em aberto e data do abono, com reflexo nos relatórios apropriados;
- Conferências analíticas atualizadas;
- Correção da gravação da Planilha no momento da Quitação e Amortização, quando havia mais de uma mo mesmo mês;
================================================================================
CM$VER      3.00.04     04/03/2002
--------------------------------------------------------------------------------
1) Relatório de Resumo da Carteira
    - Opção de só levar em consideração itens que afetam o saldo devedor
2) Relatório de Itens Enviados
    - Correção das parcelas em atraso
3) Envio                           			
   - Inclusão dos contratos "em quitação" na seleção de contratos com itens a enviar
4) Envio/Quitação
   - Correção na atualização do destino do Envio em função da situação do Participante
5) Relatório de Resumo da Carteira por Plano/Patro 	
6) Quitação						
   - SQL de entrada das regras de quitação refeito (ver documentação em separado)
7) Relatório de Dívidas				
   - filtro por saldo devedor zerado
================================================================================
CM$VER      3.00.03     18/02/2002
--------------------------------------------------------------------------------
- Padronização das colunas nas buscas de Contratos;
- Novos Parâmetros do Sistema:
  - Saldo Devedor "Anterior";
  - Centro de Custo para inbtegração financeira;
  - Item referente ao IOF;
- Novos Relatórios:
  - Rubricas Enviadas;
  - Valores Devidos;
  - Resumo da Carteira;
  - Itens Enviados;
  - Parcelas Geradas (sintético);
================================================================================
CM$VER      3.00.02     23/01/2002
--------------------------------------------------------------------------------
Versão inicial de produção.
================================================================================
CM$ALT}






































