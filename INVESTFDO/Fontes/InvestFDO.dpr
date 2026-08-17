program InvestFDO;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  Fpessoa in '..\..\Cm\Forms\Source\fPessoa.pas' {frmPessoa},
  FCadastroGrid in '..\..\Cm\Forms\Source\FCadastroGrid.pas' {frmCadastroGrid},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCMParamRel in '..\..\Cm\Relats\Source\FCMParamRel.pas' {CMParamRel},
  cmRepBtn in '..\..\Cm\Relats\Source\cmRepBtn.pas',
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  FPrincipal in 'FPrincipal.pas' {FrmPrincipal},
  UBibliotecaInvest in '..\..\Investimentos\FontesProducao\UBibliotecaInvest.pas',
  UOperacaoInvest in '..\..\Investimentos\FontesProducao\UOperacaoInvest.pas',
  fAguardeInv in '..\..\Investimentos\FontesProducao\FAguardeInv.pas' {frmAguardeInv},
  dOperacaoInvest in '..\..\Investimentos\FontesProducao\dOperacaoInvest.pas' {dtmOperacaoInvest: TDataModule},
  UDiasUteisInvest in '..\..\Investimentos\FontesProducao\UDiasUteisInvest.pas',
  UDiasUteisInv in '..\..\Investimentos\FontesProducao\UDiasUteisInv.pas',
  UOperComum in '..\..\Investimentos\FontesProducao\uOperComum.pas',
  UImpostos in '..\..\Investimentos\FontesProducao\UImpostos.pas',
  dOperComum in '..\..\Investimentos\FontesProducao\dOperComum.pas' {dtmOperComum: TDataModule},
  dFuncoesInvest in '..\..\Investimentos\FontesProducao\dFuncoesInvest.pas' {dtmFuncoesInvest: TDataModule},
  UFuncoesRendaFixa in '..\..\Investimentos\FontesProducao\UFuncoesRendaFixa.pas',
  dRendaVariavel in '..\..\Investimentos\FontesProducao\dRendaVariavel.pas' {DMRendaVariavel: TDataModule},
  UCotaComum in '..\..\Investimentos\FontesProducao\UCotaComum.pas',
  DCotaComum in '..\..\Investimentos\FontesProducao\DCotaComum.pas' {DtmCotaComum: TDataModule},
  UCaixaComum in '..\..\Investimentos\FontesProducao\UCaixaComum.pas',
  DCaixaComum in '..\..\Investimentos\FontesProducao\DCaixaComum.pas' {DtmCaixaComum: TDataModule},
  UProvisaoComum in '..\..\Investimentos\FontesProducao\UProvisaoComum.pas',
  DProvisaoComum in '..\..\Investimentos\FontesProducao\DProvisaoComum.pas' {DtmProvisaoComum: TDataModule},
  FFechtoCartGerenc in '..\..\Investimentos\FontesProducao\FFechtoCartGerenc.pas',
  FOkCancelarInv in '..\..\Investimentos\FontesProducao\FOkCancelarInv.pas' {frmOkCancelarInv},
  fconsultaregra in '..\..\Investimentos\FontesProducao\FConsultaRegra.pas' {FrmconsultaRegra},
  uEmprestAcoes in '..\..\Investimentos\FontesProducao\UEmprestAcoes.pas',
  dRendaFixa in '..\..\Investimentos\FontesProducao\dRendaFixa.pas' {DMRendaFixa: TDataModule},
  dEmprestAcoes in '..\..\Investimentos\FontesProducao\dEmprestAcoes.pas' {DMEmprestAcoes: TDataModule},
  URendaVariavel in '..\..\Investimentos\FontesProducao\URendaVariavel.pas',
  UOpcaoIndice in '..\..\Investimentos\FontesProducao\UOpcaoIndice.pas',
  faMensagem in '..\..\Investimentos\FontesProducao\faMensagem.pas' {fraMensagem: TFrame},
  dOpcoesIndice in '..\..\Investimentos\FontesProducao\dOpcoesIndice.pas' {DMOpcoesIndice: TDataModule},
  dOpcoes in '..\..\Investimentos\FontesProducao\dOpcoes.pas' {DMOpcoes: TDataModule},
  URendaFixa in '..\..\Investimentos\FontesProducao\URendaFixa.pas',
  FParamInvest in '..\..\Investimentos\FontesProducao\FParamInvest.pas' {FrmParamInvest},
  FAutorizaParametros in '..\..\Investimentos\FontesProducao\FAutorizaParametros.pas' {frmAutorizaParametros},
  FParamImportExcel in '..\..\Investimentos\FontesProducao\FParamImportExcel.pas' {FrmParamImportExcel},
  FSQL in '..\..\Investimentos\FontesProducao\FSQL.pas' {frmSQL},
  FVerificaMenuSAD in '..\..\Investimentos\FontesProducao\FVerificaMenuSAD.pas' {frmVerificaMenuSAD},
  FTesteDatas in '..\..\Investimentos\FontesProducao\FTesteDatas.pas' {frmTesteDatas},
  FCadGestor in '..\..\Investimentos\FontesProducao\FCadGestor.pas' {frmCadGestor},
  FCadastroRMDetCSInv in '..\..\Investimentos\FontesProducao\FCadastroRMDetCSInv.pas' {frmCadastroRMDetInv},
  FCadastroCSInv in '..\..\Investimentos\FontesProducao\FCadastroCSInv.pas' {frmCadastroCSInv},
  FCadastroDetCSInv in '..\..\Investimentos\FontesProducao\FCadastroDetCSInv.pas' {frmCadastroDetCSInv},
  FCadastroGridCsInvFMD in '..\..\Investimentos\FontesProducao\FCadastroGridCsInvFMD.pas' {FrmCadastroGridCSInvFMD},
  FCadastroMDetCSInv in '..\..\Investimentos\FontesProducao\FCadastroMDetCSInv.pas' {frmCadastroMDetInv},
  FCadCarteira in '..\..\Investimentos\FontesProducao\FCadCarteira.pas' {frmCadCarteira},
  FBuscaClassif in '..\..\Investimentos\FontesProducao\FBuscaClassif.pas' {FrmBuscaClassif},
  FCadTipoFundoInvest in '..\..\Investimentos\FontesProducao\FCadTipoFundoInvest.pas' {frmCadTipoFundoInvest},
  FCadFundo in '..\..\Investimentos\FontesProducao\FCadFundo.pas' {frmCadFundo},
  dFundoComum in '..\..\Investimentos\FontesProducao\dFundoComum.pas' {DmFundoComum: TDataModule},
  FCadCategoriaFundo in '..\..\Investimentos\FontesProducao\FCadCategoriaFundo.pas' {frmCadCatogoriaFundo},
  FCadComposicaoFundo in '..\..\Investimentos\FontesProducao\FCadComposicaoFundo.pas' {frmCadComposicaoFundo},
  FCadTipoCota in '..\..\Investimentos\FontesProducao\FCadTipoCota.pas' {frmCadTipoCota},
  FimportaCotacoesFundos in '..\..\Investimentos\FontesProducao\FimportaCotacoesFundos.pas' {FrmImportaCotacoesFundos},
  UFundoComum in '..\..\Investimentos\FontesProducao\UFundoComum.pas',
  FConsMovFundos in '..\..\Investimentos\FontesProducao\FConsMovFundos.PAS' {frmConsMovFundos},
  FDmRelFundosConsMov in '..\..\Investimentos\FontesProducao\FDMRelFundosConsMov.pas',
  FDMRelatoriosInv in '..\..\Investimentos\FontesProducao\FDMRelatoriosInv.pas' {DmRelatoriosInv},
  FCadLancFundosEmol in '..\..\Investimentos\FontesProducao\FCadLancFundosEmol.pas' {FrmCadLancFundosEmol},
  FConsVerificaResgate in '..\..\Investimentos\FontesProducao\FConsVerificaResgate.pas' {frmConsVerificaResgates},
  FProcResgates in '..\..\Investimentos\FontesProducao\FProcResgates.pas' {frmProcResgates},
  FGrafPatrimonial in '..\..\Investimentos\FontesProducao\FGrafPatrimonial.pas' {frmGraficoPatrimonial},
  FDmRelFundosEmol in '..\..\Investimentos\FontesProducao\FDMRelFundosEmol.pas' {DmRelFundosEmol},
  FCadOperFundosDirCred in '..\..\Investimentos\FontesProducao\FCadOperFundosDirCred.pas' {FrmCadOperFundosDirCred},
  FGrafRentabilidadeCotas in '..\..\Investimentos\FontesProducao\FGrafRentabilidadeCotas.pas' {frmGrafRentabilidadeCotas},
  FDmRelGrafRentabCotas in '..\..\Investimentos\FontesProducao\FDmRelGrafRentabCotas.pas' {DmRelatoriosInv1},
  FCadEspLancamento in '..\..\Investimentos\FontesProducao\FCadEspLancamento.pas' {frmEspLancamento},
  FDmRelFundosSaldo in '..\..\Investimentos\FontesProducao\FDmRelFundosSaldo.pas' {DmRelFundosSaldo},
  FDmRelatoriosFundos in '..\..\Investimentos\FontesProducao\FDmRelatoriosFundos.pas' {DmRelatoriosFundo},
  FConsRentFundos in '..\..\Investimentos\FontesProducao\FConsRentFundos.pas' {frmConsRentFundos},
  FConsRentFundoAcoes in '..\..\Investimentos\FontesProducao\FConsRentFundoAcoes.pas' {frmConsRentFundoAcoes},
  FParamOperTransf in '..\..\Investimentos\FontesProducao\FParamOperTransf.pas' {frmParamOperTransf},
  FCadTransfFundos in '..\..\Investimentos\FontesProducao\FCadTransfFundos.pas' {frmCadTransfFundos},
  FCadAmortizacaoCotas in '..\..\Investimentos\FontesProducao\FCadAmortizacaoCotas.pas' {FrmCadAmortizacaoCotas},
  FCadLanctoVdFundoCpAcoes in '..\..\Investimentos\FontesProducao\FCadLanctoVdFundoCpAcoes.pas' {frmCadLanctoVdFundoCpAcoes},
  FCadLanctoFundoVdAcoes in '..\..\Investimentos\FontesProducao\FCadLanctoFundoVdAcoes.pas' {frmCadLanctoFundoVdAcoes},
  FFechtoFundos in '..\..\Investimentos\FontesProducao\FFechtoFundos.pas' {frmFechtoFundos},
  FCadCotaFundo in '..\..\Investimentos\FontesProducao\FCadCotaFundo.pas' {frmCadCotaFundo},
  FCadPatrimonioFundo in '..\..\Investimentos\FontesProducao\FCadPatrimonioFundo.pas' {frmCadPatrimonioFundo},
  FCadAjusteCertificado in '..\..\Investimentos\FontesProducao\FCadAjusteCertificado.pas' {frmCadAjusteCertificado},
  FParamOperAjuste in '..\..\Investimentos\FontesProducao\FParamOperAjuste.pas' {frmParamOperAjuste},
  FCadIncorporacaoFundo in '..\..\Investimentos\FontesProducao\FCadIncorporacaoFundo.pas' {FrmCadIncorporacaoFundo},
  FDmRelConsIncorporacao in '..\..\Investimentos\FontesProducao\FDmRelConsIncorporacao.pas' {DmRelConsIncorporacao},
  FCadResgFdoAnuncioProv in '..\..\Investimentos\FontesProducao\FCadResgFdoAnuncioProv.pas' {frmCadResgFdoAnuncioProv},
  FCadCotIntegrFundo in '..\..\Investimentos\FontesProducao\FCadCotIntegrFundo.pas' {frmCadCotIntegrFundo},
  FCadCotasIntegralizar in '..\..\Investimentos\FontesProducao\FCadCotasIntegralizar.pas' {frmCadCotasIntegralizar},
  FCadFluxoCotasIntegralizar in '..\..\Investimentos\FontesProducao\FCadFluxoCotasIntegralizar.pas' {frmCadFluxoCotasIntegralizar},
  FCadCotaFundoDirCred in '..\..\Investimentos\FontesProducao\FCadCotaFundoDirCred.pas' {frmCadCotaFundoDirCred},
  FCadPatrimonioFDC in '..\..\Investimentos\FontesProducao\FCadPatrimonioFDC.pas' {frmCadPatrimonioFDC},
  FCadFluxoCotaIntDirCred in '..\..\Investimentos\FontesProducao\FCadFluxoCotaIntDirCred.pas' {frmCadFluxoCotaIntDirCred},
  FCadCotasIntegrDirCred in '..\..\Investimentos\FontesProducao\FCadCotasIntegrDirCred.pas' {frmCadCotasIntegrDirCred},
  FCadAmortizCotaDirCred in '..\..\Investimentos\FontesProducao\FCadAmortizCotaDirCred.pas' {FrmCadAmortizCotaDirCred},
  FConsCarteiraFundos in '..\..\Investimentos\FontesProducao\FConsCarteiraFundos.pas' {FrmConsCarteiraFundos},
  FDmRelCarteiraFundos in '..\..\Investimentos\FontesProducao\FDmRelCarteiraFundos.pas',
  FDMRelatoriosRendaFixa in '..\..\Investimentos\FontesProducao\FDMRelatoriosRendaFixa.pas' {DmRelatoriosRendaFixa},
  FConsSldCompFundo in '..\..\Investimentos\FontesProducao\FConsSldCompFundo.pas' {FrmConsSldCompFundo},
  FConsRentabilidade in '..\..\Investimentos\FontesProducao\FConsRentabilidade.pas' {frmConsRentabilidade},
  FConsMovRentabilidade in '..\..\Investimentos\FontesProducao\FConsMovRentabilidade.pas' {frmConsMovRentabilidade},
  FDmRelRentabInvest in '..\..\Investimentos\FontesProducao\FDmRelRentabInvest.pas' {DmRelRentabInvest},
  FConsRentabCartSPC in '..\..\Investimentos\FontesProducao\FConsRentabCartSPC.pas' {frmConsRentabCartSPC},
  FConsMovRentabSPC in '..\..\Investimentos\FontesProducao\FConsMovRentabSPC.pas' {frmConsMovRentabSPC},
  FDmRelRentabSPC in '..\..\Investimentos\FontesProducao\FDmRelRentabSPC.pas' {DmRelRentabSPC},
  FImportaCotacoesExcel in '..\..\Investimentos\FontesProducao\FImportaCotacoesExcel.pas' {FrmImportaCotacoesExcel},
  FImportaCotacoes in '..\..\Investimentos\FontesProducao\FImportaCotacoes.pas' {FrmImportaCotacoes},
  UModulo in '..\..\Investimentos\FontesProducao\UModulo.pas',
  FCadTipoOper in '..\..\Investimentos\FontesProducao\FCadTipoOper.pas' {frmCadTipoOper},
  FCadContaContab in '..\..\Investimentos\FontesProducao\FCadContaContab.pas' {FrmCadContaContab},
  FDmRelParamContab in '..\..\Investimentos\FontesProducao\FDmRelParamContab.pas' {DmRelParamContab},
  FCadTransfPlanos in '..\..\Investimentos\FontesProducao\FCadTransfPlanos.pas' {frmCadTransfPlanos},
  FDMRelOperRecebtoFdo in '..\..\Investimentos\FontesProducao\FDMRelOperRecebtoFdo.pas' {DMRelOperRecebtoFdo},
  FDmRelConsCotaFundo in '..\..\Investimentos\FontesProducao\FDmRelConsCotaFundo.pas' {DmRelConsCotaFundo},
  FParamCotaFundo in '..\..\Investimentos\FontesProducao\FParamCotaFundo.pas' {FrmParamCotaFundo},
  FParamOperRecebtoFdo in '..\..\Investimentos\FontesProducao\FParamOperRecebtoFdo.pas' {frmParamOperRecebtoFdo},
  FCadLancamentoFundo in 'FCadLancamentoFundo.pas' {frmCadLancamentoFundo},
  FDmRelConsCotaIntegrFundo in '..\..\Investimentos\FontesProducao\FDmRelConsCotaIntegrFundo.pas' {DmRelConsCotaIntegrFundo},
  FParamCotaIntegrFundo in '..\..\Investimentos\FontesProducao\FParamCotaIntegrFundo.pas' {FrmParamCotaIntegrFundo},
  FDmRelConsAmortFdo in '..\..\Investimentos\FontesProducao\FDmRelConsAmortFdo.pas' {DmRelConsAmortFdo},
  FParamOperAmortFdo in '..\..\Investimentos\FontesProducao\FParamOperAmortFdo.pas' {frmParamOperAmortFdo},
  FParamMapaInvFdo in '..\..\Investimentos\FontesProducao\FParamMapaInvFdo.pas' {frmParamMapaInvFdo},
  FDmRelMapaInvFdo in '..\..\Investimentos\FontesProducao\FDmRelMapaInvFdo.pas' {DmRelMapaInvFdo},
  FParamMapaInvRF in '..\..\Investimentos\FontesProducao\FParamMapaInvRF.pas' {frmParamMapaInvRF},
  FDmRelRFMapaMensal in '..\..\Investimentos\FontesProducao\FDmRelRFMapaMensal.pas' {DmRelRFMapaMensal},
  FDmRelCarteiraGerenc in '..\..\Investimentos\FontesProducao\FDmRelCarteiraGerenc.pas' {DmRelCarteiraGerenc},
  FConsCartGerenc in '..\..\Investimentos\FontesProducao\FConsCartGerenc.pas' {frmConsCartGerenc},
  FConsSaldoFundos in 'FConsSaldoFundos.pas' {frmConsSaldoFundos},
  FCadAmortizacaoCotasAcoes in 'FCadAmortizacaoCotasAcoes.pas' {FrmCadAmortizacaoCotasAcoes},
  FCadOperDividendosFdo in 'FCadOperDividendosFdo.pas' {frmCadOperDividendosFdo},
  uCtrlInvContab in '..\..\Investimentos\FontesProducao\CtrlObjects\uCtrlInvContab.pas',
  uCtrlInvestimento in '..\..\Investimentos\FontesProducao\CtrlObjects\uCtrlInvestimento.pas',
  uCtrlParamInvest in '..\..\Investimentos\FontesProducao\CtrlObjects\uCtrlParamInvest.pas',
  uDbTipoOperacao in '..\..\Investimentos\FontesProducao\DbObjects\uDbTipoOperacao.pas',
  uDbCarteirainvest in '..\..\Investimentos\FontesProducao\DbObjects\uDbCarteiraInvest.pas',
  uDbCustodiante in '..\..\Investimentos\FontesProducao\DbObjects\uDbCustodiante.pas',
  uDbInvestimento in '..\..\Investimentos\FontesProducao\DbObjects\uDbInvestimento.pas',
  uDbMercado in '..\..\Investimentos\FontesProducao\DbObjects\uDbMercado.pas',
  uDbMotivobloqueio in '..\..\Investimentos\FontesProducao\DbObjects\uDbMotivobloqueio.pas',
  uDbParaminvest in '..\..\Investimentos\FontesProducao\DbObjects\uDbParaminvest.pas',
  uCtrlRendaVariavel in '..\..\Investimentos\FontesProducao\CtrlObjectsRV\uCtrlRendaVariavel.pas',
  uDbBolsavalores in '..\..\Investimentos\FontesProducao\DbObjectsRV\uDbBolsavalores.pas',
  uCtrlPessoaAdmFdoInvest in '..\..\Investimentos\FontesProducao\CtrlObjectsFDO\uCtrlPessoaAdmFdoInvest.pas',
  uDbAdmfdoinvest in '..\..\Investimentos\FontesProducao\DbObjectsFDO\uDbAdmfdoinvest.pas',
  uDbBoleta in '..\..\Investimentos\FontesProducao\DbObjectsRV\uDbBoleta.pas',
  uDbProvPerdaRV in '..\..\Investimentos\FontesProducao\DbObjectsRV\uDbProvPerdaRV.pas',
  FDmRelSldComposicaoFdoRF in '..\..\Investimentos\FontesProducao\FDmRelSldComposicaoFdoRF.pas' {DmRelSldComposicaoFdoRF},
  uCtrlCarteiraGerenc in '..\..\Investimentos\FontesProducao\CtrlObjectsRV\uCtrlCarteiraGerenc.pas',
  uCtrlCustodia in '..\..\Investimentos\FontesProducao\CtrlObjectsRV\uCtrlCustodia.pas',
  uDbTipoinvest in '..\..\Investimentos\FontesProducao\DbObjects\uDbTipoinvest.pas',
  uDbOperacaoinvest in '..\..\Investimentos\FontesProducao\DbObjectsRV\uDbOperacaoinvest.pas',
  uDbOperCustodia in '..\..\Investimentos\FontesProducao\DbObjectsRV\uDbOperCustodia.pas',
  uDbHistcustodia in '..\..\Investimentos\FontesProducao\DbObjectsRV\uDbHistcustodia.pas',
  FCadTipoDespInvest in '..\..\Investimentos\FontesProducao\FCadTipoDespInvest.pas' {frmCadTipoDespInvest},
  FCadDespTipoOper in '..\..\Investimentos\FontesProducao\FCadDespTipoOper.pas' {FrmCadDespTipoOper},
  uCtrlRendaFixa in '..\..\Investimentos\FontesProducao\CtrlObjectsRF\uCtrlRendaFixa.pas',
  uDbItemRenfix in '..\..\Investimentos\FontesProducao\DbObjectsRF\uDbItemRenfix.pas',
  uDbClasseRenfix in '..\..\Investimentos\FontesProducao\DbObjectsRF\uDbClasseRenfix.pas',
  uDbCurvasrenfix in '..\..\Investimentos\FontesProducao\DbObjectsRF\uDbCurvasrenfix.pas',
  uDbClassriscorenfix in '..\..\Investimentos\FontesProducao\DbObjectsRF\uDbClassriscorenfix.pas',
  uDbOperrenfix in '..\..\Investimentos\FontesProducao\DbObjectsRF\uDbOperrenfix.pas',
  uDbOperrenfixxcurvas in '..\..\Investimentos\FontesProducao\DbObjectsRF\uDbOperrenfixxcurvas.pas',
  uDbHistrenfix in '..\..\Investimentos\FontesProducao\DbObjectsRF\uDbHistrenfix.pas',
  uDbHistrenfixxitens in '..\..\Investimentos\FontesProducao\DbObjectsRF\uDbHistrenfixxitens.pas',
  UFuncoesInvest in '..\..\Investimentos\FontesProducao\UFuncoesInvest.pas',
  uCtrlFundos in '..\..\Investimentos\FontesProducao\CtrlObjectsFDO\uCtrlFundos.pas',
  uDbClassifanbid in '..\..\Investimentos\FontesProducao\DbObjectsFDO\uDbClassifanbid.pas',
  uDbRiscoFundoInvest in '..\..\Investimentos\FontesProducao\DbObjectsFDO\uDbRiscoFundoInvest.pas',
  uDbFundoinvest in '..\..\Investimentos\FontesProducao\DbObjectsFDO\uDbFundoinvest.pas',
  uDbPedidofundo in '..\..\Investimentos\FontesProducao\DbObjectsFDO\uDbPedidofundo.pas',
  uDbTipoDespInvest in '..\..\Investimentos\FontesProducao\DbObjects\uDbTipoDespInvest.pas',
  uDbUsuarioTipoMenu in '..\..\Investimentos\FontesProducao\DbObjects\uDbUsuarioTipoMenu.pas',
  FCadTipoInvUsuMT in '..\..\Investimentos\FontesProducao\FontesMT\FCadTipoInvUsuMT.pas',
  FCadastroGridMTInv in '..\..\Investimentos\FontesProducao\FontesMT\FCadastroGridMTInv.pas',
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas',
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadTipoDespInvestMT in '..\..\Investimentos\FontesProducao\FontesMT\FCadTipoDespInvestMT.pas',
  FAlteraPatroPlanPrevContabMT in '..\..\Investimentos\FontesProducao\FontesMT\FAlteraPatroPlanPrevContabMT.pas' {frmAlteraPatroPlanPrevContabMT},
  uInvestimento in '..\..\Investimentos\FontesProducao\CtrlObjects\uInvestimento.pas',
  uDbOperacaofundo in '..\..\Investimentos\FontesProducao\DbObjectsFDO\uDbOperacaofundo.pas',
  uDbAgenciaRisco in '..\..\Investimentos\FontesProducao\DbObjects\uDbAgenciaRisco.pas';

{$R *.RES}
{$R INVESTFDO_RES.RES}

begin
	frmCMEntrada:= TfrmCMEntrada.Create(Application);
	frmCMEntrada.Show;
	frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Sistema de Fundos de Investimentos';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TdtmOperacaoInvest, dtmOperacaoInvest);
  Application.CreateForm(TdtmReports, dtmReports);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TfrmAguardeInv, frmAguardeInv);
  Application.CreateForm(TdtmOperComum, dtmOperComum);
  Application.CreateForm(TdtmFuncoesInvest, dtmFuncoesInvest);
  Application.CreateForm(TDMRendaVariavel, DMRendaVariavel);
  Application.CreateForm(TDtmCotaComum, DtmCotaComum);
  Application.CreateForm(TDtmCaixaComum, DtmCaixaComum);
  Application.CreateForm(TDtmProvisaoComum, DtmProvisaoComum);
  Application.CreateForm(TDMRendaFixa, DMRendaFixa);
  Application.CreateForm(TDMEmprestAcoes, DMEmprestAcoes);
  Application.CreateForm(TDMOpcoesIndice, DMOpcoesIndice);
  Application.CreateForm(TDMOpcoes, DMOpcoes);
  Application.CreateForm(TDmFundoComum, DmFundoComum);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo InvestFDO
================================================================================
CM$VER      3.16.00     22/06/2007
--------------------------------------------------------------------------------
Compilação Padrão 16
================================================================================
CM$VER      3.15.00     10/05/2007
--------------------------------------------------------------------------------
Liberação Padrâo 15
================================================================================
CM$VER      3.14.01a    16/02/2007
--------------------------------------------------------------------------------
- Compilar com Padrão 14
- Acertar Fundo de Investimento Abertura - Sugerir um Fundo de Investimento
  quando só existir 1 Fundo
================================================================================
CM$VER      3.13.00b    01/12/2006
--------------------------------------------------------------------------------
- Recompilação com Padrão 13
- Acerto no cadastro de Cota Contábil e Cota Gerencial que estavam apresentando
   erro na abertura e na impressão do relatório;
================================================================================
CM$VER      3.11.00     03/10/2006
--------------------------------------------------------------------------------
Compilação com Padrao 5.10.11
================================================================================
CM$VER      3.06.00a    13/07/2006
--------------------------------------------------------------------------------
Compilação com padrão 5.10.10
================================================================================
CM$VER      3.05.00a    08/05/2006
--------------------------------------------------------------------------------
Copmiplação com Padrao 5.10.09
================================================================================
CM$VER      3.03.00a    23/01/2006
--------------------------------------------------------------------------------
Compilação com o Padrão 5.10.08
================================================================================
CM$VER      3.02.07     29/08/2005
--------------------------------------------------------------------------------
Compilação no Padrão CM 5.10.07
================================================================================
CM$VER      3.00.00a    24/01/2006
--------------------------------------------------------------------------------
Liberação Padrâo 8
================================================================================
CM$ALT}







