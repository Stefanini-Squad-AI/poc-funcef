//******************************************************************************
// Rotina     : 
// SOL        : 174651
// Kintana    : 1607521
// Data       : 03/04/2012
// Responsável: Otacilio Aquino
// Descrição  : Implementação dos FDmRelFundoDirCred, FDMRelLancFundo, FDmRelVerificaAcoes.
//******************************************************************************
// Rotina     : 
// SOL        : 92822 
// Kintana    : 389089
// Data       : 11/08/2008
// Responsável: Ricardo Cristiano
// Descrição  : Instrução CGPC 025 que altera a precificação dos ativos de mercado a vista.
//              Implementação dos fontes : FrmParamCotacaoRVMT, uCtrlParamCotacaoRV e uDbParamCotacaoRV
//******************************************************************************
// Data      : 23/07/2007
// Código    : AL_80
// Motivo    : Implementação de Agencia de Risco
//******************************************************************************
// Data      : 07/03/2007
// Código    : AL_79
// Motivo    : Implementação da transf. entre planos de cotas a
//             integralizar(FConsTransfPlanoCotaIntegr, FDMRelTransfPlanoCotaIntegr,
//             FCadTransfPlanoCotaIntegr)
//******************************************************************************
// Data      : 31/01/2006
// Código    : AL_78
// Motivo    : Implementação dos uDbAdmfdoinvest, uDbClassifanbid, uCtrlPessoaAdmFdoInvest
//             FCadClassifAnbid, FCadAdmFdoInvestMT, fpessoaMT
//******************************************************************************
// Data      : 19/01/2006
// Pendência : 233367
// SOL       : 21140
// Código    : AL_77
// Motivo    : Descontinuação do Relatório Saldo do Investimentos (qrySaldoInv) (Coisa Antiga)
//             FpConsSaldoInvest
//*****************************************************************************
//Data	    : 03/01/2006
//Código    : Al_78
//Motivo(S) : Implementação do Form de Classe de Risco de Renda Fixa em 3 Camadas
//            e (TfrmCadMercadoMT e uDbMercado)e Removido o TfrmCadMercado e
//            para o diretório de FontesDescontinuados
//*****************************************************************************
//Data	    : 03/01/2006
//Código    : Al_77
//Motivo(S) : Implementação do Form de Classe de Risco de Renda Fixa em 3 Camadas
//            e (TfrmCadClassRiscoRenFixMT e uDbClassriscorenfix)e
//            Removido o TfrmCadClassRiscoRenFix e para o diretório de FontesDescontinuados
//*****************************************************************************
//Data	    : 29/12/2005
//Código    : Al_76
//Motivo(S) : Implementação do Form de Item de Renda Fixa em 3 Camadas
//            e (TFrmCadCurvasRenFixMT)e Removido o FrmCadCurvasRenFix e
//            uDbCurvasrenfix
//            para o diretório de FontesDescontinuados
//*****************************************************************************
//Data	    : 14/12/2005
//Código    : Al_75
//Motivo(S) : Implementação do Form de Classe de Renda Fixa em 3 Camadas
//            e (TFrmCadClasseTitRenFixMT)e Removido o frmCadClasseTitRenFix
//            para o diretório de FontesDescontinuados
//*****************************************************************************
//Data	    : 14/11/2005
//Código    : Al_17
//Motivo(S) : Implementação de Forms em 3 Camadas
//*****************************************************************************
//Data	    : 09/11/2005
//Código    : Al_16
//Motivo(S) : Implementação de 3 Camadas
//*****************************************************************************
//Data	    : 20/10/2005
//Código    : Al_15
//Motivo(S) : Implementação da Bloqeuio de Cotas
//*****************************************************************************
//Data	    : 18/10/2005
//Código    : Al_14
//Motivo(S) : Implementação da CISÃO
//*****************************************************************************
//Data	    : 10/10/2005
//Código    : Al_13
//Motivo(S) : Implementação da Reorganização Societária
//*****************************************************************************
//Data	    : 06/10/2005
//Código    : Al_12
//Motivo(S) : Implementação da Permuta e da Reorganização Societária
//*****************************************************************************
//Data	    : 18/08/2005
//Código    : Al_11
//Motivo(S) : Implementação da consulta do Saldo de Qtd de Cotas a Integralizar
//*****************************************************************************
//Data	    : 22/07/2005
//Código    : Al_10
//Motivo(S) : Implementação do  cadastro de cotas a integralizar para Fundos de FIDC
//*****************************************************************************
//Data	    : 20/07/2005
//Código    : Al_9
//Motivo(S) : Implementação da Subscrição de cotas de Fundos Fechados
//*****************************************************************************
//Data	    : 19/07/2005
//Código    : Al_8
//Motivo(S) : Implementação da Consulta de Mapa de Investimento em Fundos por tipo de fundo
//******************************************************************************
// Data     : 14/07/2005
// Código   : AL_7
// Motivo   : Implementação do frmCadDesdobranmento.
//******************************************************************************
// Data     : 12/07/2005
// Código   : AL_6
// Motivo   : Implementação do frmCadSubscricao, frmCadBonificacao e frmCadGrupamento.
//******************************************************************************
// Data     : 28/06/2005
// Código   : AL_5
// Motivo   : Implementação do FParamConsCompCarteira, FDMConsComposicaoCarteira,
//            fConsComposicaoCarteira
//******************************************************************************
// Data     : 27/04/2005
// Código   : AL_4
// Motivo   : Implementação do frmCadRestituicaocapital
//******************************************************************************
// Data     : 02/03/2005
// Código   : AL_3
// Motivo   : Implementação do frmConsLanContPerRF, DmRelLanContPerRF e frmParamConsLanContPerRF
//******************************************************************************
// Data     : 18/02/2005
// Código   : AL_2
// Motivo   : Implementação do FCadDirAlteracaoTipo
//******************************************************************************
// Código   : AL_1
// Data     : 07/12/2004
// Motivo   : Inclusão do Form FConsCotaFundo
//******************************************************************************

program investimentos;

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
  FCadEmissor in 'FCadEmissor.pas' {frmCadEmissor},
  FCadOrigCap in 'FCadOrigCap.pas' {frmCadOrigCap},
  FCadTipoCap in 'FCadTipoCap.pas' {frmCadTipoCap},
  FCadValParamXInstFin in 'FCadValParamXInstFin.pas' {frmCadValParamInstFinOld},
  FCadParamInstFin in 'FCadParamInstFin.pas' {frmCadParamInstFin},
  fconsultaregra in 'fconsultaregra.pas' {FrmconsultaRegra},
  FCadInstFin in 'FCadInstFin.pas' {frmCadInstFin},
  FCadBolsa in 'FCadBolsa.pas' {frmCadBolsa},
  FCadCustodiante in 'FCadCustodiante.pas' {frmCadCustodiante},
  FCadGestor in 'FCadGestor.pas' {frmCadGestor},
  FCadCorretora in 'FCadCorretora.pas' {frmCadCorretora},
  FCadCarteira in 'FCadCarteira.pas' {frmCadCarteira},
  FCadPlano in 'FCadPlano.pas' {frmCadPlano},
  FCadFundo in 'FCadFundo.pas' {frmCadFundo},
  FCadTipoEvenEmissor in 'FCadTipoEvenEmissor.pas' {frmCadTipoEvenEmissor},
  FCadTipoOper in 'FCadTipoOper.pas' {frmCadTipoOper},
  Fpessoa in '..\..\Cm\Forms\Source\fPessoa.pas' {frmPessoa},
  FCadCotacaoAcao in 'FCadCotacaoAcao.pas' {frmCadCotacaoAcao},
  FCadCotacaoInvest in 'FCadCotacaoInvest.pas' {frmCadCotacaoInvest},
  FPrincipal in 'FPrincipal.pas' {FrmPrincipal},
  FCadastroGrid in '..\..\Cm\Forms\Source\FCadastroGrid.pas' {frmCadastroGrid},
  FPlanejaEtapas in 'FPlanejaEtapas.pas' {FrmPlanejaEtapas},
  UBibliotecaInvest in 'UBibliotecaInvest.pas',
  FCadTipoAcao in 'FCadTipoAcao.pas' {FrmCadTipoAcao},
  FCadDespTipoOper in 'FCadDespTipoOper.pas' {FrmCadDespTipoOper},
  FBuscaClassif in 'FBuscaClassif.pas' {FrmBuscaClassif},
  FParamInvest in 'FParamInvest.pas' {FrmParamInvest},
  FCadastraAcao in 'FCadastraAcao.pas' {FrmCadastraAcao},
  FImportaCotacoes in 'FImportaCotacoes.pas' {FrmImportaCotacoes},
  UModulo in 'UModulo.pas',
  FCadContaContab in 'FCadContaContab.pas' {FrmCadContaContab},
  UOperacaoInvest in 'UOperacaoInvest.pas',
  FConsHistInvest in 'FConsHistInvest.pas' {FrmConsHistInvest},
  dOperacaoInvest in 'dOperacaoInvest.pas' {dtmOperacaoInvest: TDataModule},
  FConsVariacaoInvest in 'FConsVariacaoInvest.pas' {FrmConsVariacaoInvest},
  FpRelVariacoesInvest in 'FpRelVariacoesInvest.pas' {FrmpRelVariacoesInvest},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  FDmRelatorios in 'FDmRelatorios.pas' {DmRelatorios},
  FpRelCotacoesInvest in 'FpRelCotacoesInvest.pas' {FrmpRelCotacoesInvest},
  FFechaBoleta in 'FFechaBoleta.pas' {FrmFechaBoleta},
  FConsHistCart in 'FConsHistCart.pas' {FrmConsHistCart},
  FParamBoleta in 'FParamBoleta.pas' {FrmParamBoleta},
  FParamDemCustoCarteira in 'FParamDemCustoCarteira.pas' {FrmParamDemCustoCarteira},
  FParamVarMesCarteira in 'FParamVarMesCarteira.pas' {FrmParamVarMesCarteira},
  FParamTIRSintetico in 'FParamTIRSintetico.pas' {FrmParamTIRSintetico},
  FpRelEnquadramento in 'FpRelEnquadramento.pas' {FrmpRelEnquadramento},
  FSaldoIniCart in 'FSaldoIniCart.pas' {frmCadSaldoIniCart},
  FParamGerCarteira in 'FParamGerCarteira.pas' {FrmParamGerCarteira},
  FParamGerCartSintetico in 'FParamGerCartSintetico.pas' {FrmParamGerCartSintetico},
  FParamTIRAnalitico in 'FParamTIRAnalitico.pas' {FrmParamTIRAnalitico},
  FParamCompGerLotes in 'FParamCompGerLotes.pas' {FrmParamCompGerLotes},
  FParamProvisaoIR in 'FParamProvisaoIR.pas' {FrmParamProvisaoIR},
  FCLassInstFin in 'FClassInstFin.pas' {FrmCadClassInstFin},
  DMRelatoriosClaudio in 'DMRelatoriosClaudio.pas' {dtmRelatoriosClaudio},
  FParamPerticEmp in 'FParamPerticEmp.pas' {frmParamPerticEmp},
  FIndiceAtuarial in 'FIndiceAtuarial.pas' {FrmIndiceAtuarial},
  FAcertaCustodia in 'FAcertaCustodia.pas' {frmAcertaCustodia},
  FConsHistCust in 'FConsHistCust.pas' {FrmConsHistCust},
  FpRelValorIndic in 'FpRelValorIndic.pas' {FrmPRelValorIndic},
  FpRelConsHistInvest in 'FpRelConsHistInvest.pas' {FrmpRelConsHistInvest},
  FDmRelatorio in 'FDmRelatorio.pas' {DtmRelatorio},
  FCadEventos in 'fcadeventos.pas' {FrmCadEventos},
  FpConsSaldoInvest in 'FPConsSaldoInvest.pas' {FrmpConsSaldoInvest},
  FParamRentRendaFixa in 'FParamRentRendaFixa.pas' {FrmParamRentRendaFixa},
  FParamResumoOper in 'FParamResumoOper.pas' {FrmParamResumoOper},
  FParamEnquadraRenFixa in 'FParamEnquadraRenFixa.pas' {FrmParamEnquadraRenFixa},
  FCadCotMoeda in 'FCadCotMoeda.pas' {FrmCadCotMoeda},
  FCadCotMoedaInd in 'FCadCotMoedaInd.pas' {FrmCadCotMoedaInd},
  FCadDadosMes in 'FCadDadosMes.pas' {FrmCadDadosMes},
  FParamExtratoOper in 'FParamExtratoOper.pas' {FrmParamExtratoOper},
  FParamBoletaRenFixa in 'FParamBoletaRenFixa.pas' {FrmParamBoletaRenFixa},
  FImportaCotacoesExcel in 'FImportaCotacoesExcel.pas' {FrmImportaCotacoesExcel},
  FParamImportExcel in 'FParamImportExcel.pas' {FrmParamImportExcel},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FParamLimBancos in 'FParamLimBancos.pas' {FrmParamLimBancos},
  FConsVencRenFix in 'FConsVencRenFix.pas' {FrmConsVencRenFix},
  FConsSaldoCust in 'FConsSaldoCust.pas' {FrmConsSaldoCust},
  FParamResumoOper2 in 'FParamResumoOper2.pas' {FrmParamResumoOper2},
  FCadMotivoBloqueio in 'FCadMotivoBloqueio.pas' {frmCadMotivoBloqueio},
  FParamGerCartCust in 'FParamGerCartCust.pas' {FrmParamGerCartCust},
  FParamMapaCorret in 'FParamMapaCorret.pas' {FrmParamMapaCorret},
  FParamTotTipoOper in 'FParamTotTipoOper.pas' {FrmParamTotTipoOper},
  FParamDetBoletas in 'FParamDetBoletas.pas' {FrmParamDetBoletas},
  FUtilitario in 'FUtilitario.pas' {FrmUtilitario},
  FParamListaFundos in 'FParamListaFundos.pas' {FrmParamListaFundos},
  FCadGrupUsuXTipoOper in 'FCadGrupUsuXTipoOper.pas' {FrmCadGrupUsuXTipoOper},
  UFuncoesRendaFixa in 'UFuncoesRendaFixa.pas',
  FParamIRRendaVar in 'FParamIRRendaVar.pas' {FrmParamIRRendaVar},
  FCadFeriadoInvest in 'FCadFeriadoInvest.pas' {frmCadFeriadoInvest},
  dFuncoesInvest in 'dFuncoesInvest.pas' {dtmFuncoesInvest: TDataModule},
  FParamTIRAnalitMov in 'FParamTIRAnalitMov.pas' {FrmParamTIRAnalitMov},
  uOperComum in 'uOperComum.pas',
  dOperComum in 'dOperComum.pas' {dtmOperComum: TDataModule},
  FCadIR in 'FCadIr.pas' {frmCadIR},
  FCadOrdemMovimentacao in 'FCadOrdemMovimentacao.pas' {frmOrdemMovimentacao},
  FCadAutOrdemMovimentacao in 'FCadAutOrdemMovimentacao.pas' {frmAutOrdemMovimentacao},
  FProcOperAcao in 'FProcOperAcao.pas' {FrmProcOperAcao},
  FParamFechaBoleta in 'FParamFechaBoleta.pas' {frmParamFechaBoleta},
  FCadEstornaBoletaRV in 'FCadEstornaBoletaRV.pas' {frmCadEstornaBoletaRV},
  uVersao in 'uVersao.pas',
  FParamCompCartCust in 'FParamCompCartCust.pas' {frmParamCompCartCust},
  FCadSerieBMF in 'FCadSerieBMF.pas' {frmCadSerieBMF},
  FParamContratoBMF in 'FParamContratoBMF.pas' {frmParamContratoBMF},
  FParamBMF in 'FParamBMF.pas' {frmParamBMF},
  FTipoMercadoBMF in 'FTipoMercadoBMF.pas' {frmTipoMercadoBMF},
  FCadTipoInvestidor in 'FCadTipoInvestidor.pas' {frmCadTipoInvestidor},
  FCadOrdemMovBMF in 'FCadOrdemMovBMF.pas' {frmOrdemMovBMF},
  FCadCotacaoBMF in 'FCadCotacaoBMF.pas' {frmCadCotacaoBMF},
  FCadConfOrdemMovimentacao in 'FCadConfOrdemMovimentacao.pas' {frmConfOrdemMovimentacao},
  FConsObservacaoOrdem in 'FConsObservacaoOrdem.pas' {FrmObservacaoOrdem},
  FConsMovCorretora in 'FConsMovCorretora.pas' {frmConsMovCorretora},
  dAGE in 'dAGE.pas' {dtmAGE: TDataModule},
  FCadPosicaoFundo in 'FCadPosicaoFundo.pas' {frmCadPosicaoFundo},
  FProcOperBMF in 'FProcOperBMF.pas' {frmProcOperBMF},
  FCadMascara in 'FCadMascara.pas' {frmCadMascara},
  FCadEventoEmissor in 'FCadEventoEmissor.pas' {frmCadEventoEmissor},
  FCadImpostoInvest in 'FCadImpostoInvest.pas' {frmCadImpostoInvest},
  FCadValParamInstFin in 'FCadValParamInstFin.pas' {FrmCadValParamInstFin},
  FCadAutMovFin in 'FCadAutMovFin.pas' {frmCadAutMovFin},
  FConsCustodia in 'FConsCustodia.pas' {FrmConsCustodia},
  FCadIOF in 'FCadIOF.pas' {frmCadIOF},
  UImpostos in 'UImpostos.pas',
  FConsCartRendVar in 'FConsCartRendVar.pas' {frmConsCartRendVar},
  FCadTitulo in 'FCadTitulo.pas' {frmCadTitulo},
  FCadPercIRFundo in 'FCadPercIRFundo.pas' {frmCadPercIRFundo},
  FCadTipoFundoInvest in 'FCadTipoFundoInvest.pas' {frmCadTipoFundoInvest},
  FCadPendenciaBolsa in 'FCadPendenciaBolsa.pas' {frmPendenciaBolsa},
  FConsPendenciaBolsa in 'FConsPendenciaBolsa.pas' {frmConsPendenciaBolsa},
  FConsExeDireitos in 'FConsExeDireitos.pas' {frmConsExeDireitos},
  FCadCotaFundo in 'FCadCotaFundo.pas' {frmCadCotaFundo},
  FCadPatrimonioFundo in 'FCadPatrimonioFundo.pas' {frmCadPatrimonioFundo},
  FConfPgJurosAmort in 'FConfPgJurosAmort.pas' {frmConfPgJurosAmort},
  FParamEvolImpostos in 'FParamEvolImpostos.pas' {frmParamEvolImpostos},
  FParamIntegraFinContabil in 'FParamIntegraFinContabil.pas' {frmParamIntegraFinContabil},
  FParamEvolIRLit in 'FParamEvolIRLit.pas' {frmParamEvolIRLit},
  FParamHistCotAcao in 'FParamHistCotAcao.pas' {frmParamHistCotAcao},
  FParamOperRendaVar in 'FParamOperRendaVar.pas' {frmParamOperRendaVar},
  FParamOperDireito in 'FParamOperDireito.pas' {frmParamOperDireito},
  FPVarMesCarteira in 'FPVarMesCarteira.pas' {FrmPVarMesCarteira},
  URendaFixa in 'URendaFixa.pas',
  FCadEstornaBoletaDirRV in 'FCadEstornaBoletaDirRV.pas' {frmCadEstornaBoletaDirRV},
  FParamFechaBoletaBMF in 'FParamFechaBoletaBMF.pas' {frmParamFechaBoletaBMF},
  FFechaBoletaBMF in 'FFechaBoletaBMF.pas' {FrmFechaBoletaBMF},
  FCMParamRel in '..\..\Cm\Relats\Source\FCMParamRel.pas' {CMParamRel},
  cmRepBtn in '..\..\Cm\Relats\Source\cmRepBtn.pas',
  FCadExcluiBoletaBMF in 'FCadExcluiBoletaBMF.pas' {frmCadExcluiBoletaBMF},
  dFundoComum in 'dFundoComum.pas' {DmFundoComum: TDataModule},
  UFundoComum in 'UFundoComum.pas',
  FConsMovFundos in 'FConsMovFundos.pas' {frmConsMovFundos},
  FConsMovBMF in 'FConsMovBMF.pas' {frmConsMovBMF},
  FImportaConciliacaoExcel in 'FImportaConciliacaoExcel.pas' {FrmImportaConciliacaoExcel},
  fCadCPMF in 'fCadCPMF.pas' {frmCadCPMF},
  FConsLancCont in 'FConsLancCont.pas' {frmConsLancCont},
  FCadAutOperacao in 'FCadAutOperacao.pas' {frmCadAutOperacao},
  uHelp in 'uHelp.pas',
  FConsIndicadores in 'FConsIndicadores.pas' {frmConsIndicadores},
  FCadPlanoContabPatro in 'FCadPlanoContabPatro.pas' {frmCadPlanoContabPatro},
  FConsVerificaResgate in 'FConsVerificaResgate.pas' {frmConsVerificaResgates},
  FConsRentFundos in 'FConsRentFundos.pas' {frmConsRentFundos},
  FDmRelatoriosFundos in 'FDmRelatoriosFundos.pas' {DmRelatoriosFundo},
  FConsMovRentabilidade in 'FConsMovRentabilidade.pas' {frmConsMovRentabilidade},
  FCadLanctoFundoVdAcoes in 'FCadLanctoFundoVdAcoes.pas' {frmCadLanctoFundoVdAcoes},
  FConsRentabilidade in 'FConsRentabilidade.pas' {frmConsRentabilidade},
  FGrafRentabilidadeCotas in 'FGrafRentabilidadeCotas.pas' {frmGrafRentabilidadeCotas},
  FCadCancelaSubsCotas in 'FCadCancelaSubsCotas.pas' {frmCadCancelaSubsCotas},
  FCadLanctoVdFundoCpAcoes in 'FCadLanctoVdFundoCpAcoes.pas' {frmCadLanctoVdFundoCpAcoes},
  FParamOperTransf in 'FParamOperTransf.pas' {frmParamOperTransf},
  FConsRentFundoAcoes in 'FConsRentFundoAcoes.pas' {frmConsRentFundoAcoes},
  FCadAmortizacaoCotasAcoes in 'FCadAmortizacaoCotasAcoes.pas' {FrmCadAmortizacaoCotasAcoes},
  FCadastroCSInv in 'FCadastroCSInv.pas' {frmCadastroCSInv},
  FCadCurvasRenFix in 'FCadCurvasRenFix.pas' {frmCadCurvasRenFix},
  dEmprestAcoes in 'dEmprestAcoes.pas' {DMEmprestAcoes: TDataModule},
  FDMRelatoriosRendaFixa in 'FDMRelatoriosRendaFixa.pas' {DmRelatoriosRendaFixa},
  FCadastroMDetCSInv in 'FCadastroMDetCSInv.pas' {frmCadastroMDetInv},
  FCadOperRenFix in 'FCadOperRenFix.pas' {frmCadOperRenFix},
  FExportaDadoTexto in 'FExportaDadoTexto.pas' {frmExportaDadoTexto},
  FCadastroDetCSInv in 'FCadastroDetCSInv.pas' {frmCadastroDetCSInv},
  FCadastroRMDetCSInv in 'FCadastroRMDetCSInv.pas' {frmCadastroRMDetInv},
  FCadCurvasXItems in 'FCadCurvasXItems.pas' {frmCadCurvasXITems},
  FCadFluxoInvRenFix in 'FCadFluxoInvRenFix.pas' {frmCadFluxoInvestRenFix},
  FCadInvRenFix in 'FCadInvRenFix.pas' {frmCadInvRenFix},
  FCadItemRFXTipoOper in 'FCadItemRFXTipoOper.pas' {frmCadItemRFXTipoOper},
  FOkCancelarInv in 'FOkCancelarInv.pas' {frmOkCancelarInv},
  FFechtoRenFix in 'FFechtoRenFix.pas' {frmFechtoRenFix},
  FConsSaldoEmpAcoes in 'FConsSaldoEmpAcoes.pas' {frmConsSaldoEmpAcoes},
  FDMRelRenFixSaldo in 'FDMRelRenFixSaldo.pas' {DmRelRenFixSaldo},
  FConsOperEmpAcoes in 'FConsOperEmpAcoes.pas' {frmConsOperEmpAcoes},
  fAguardeInv in 'fAguardeInv.pas' {frmAguardeInv},
  FImportaOrdens in 'FImportaOrdens.pas' {frmImportaOrdens},
  FParamDemoOperVendas in 'FParamDemoOperVendas.pas' {frmParamDemoOperVendas},
  FConsExtratoInvRV in 'FConsExtratoInvRV.pas' {FrmConsExtratoInvRV},
  FDmRelExtratoInvRV in 'FDmRelExtratoInvRV.pas' {DmRelExtratoInvRV},
  FCadOperDividendosFdo in 'FCadOperDividendosFdo.pas' {frmCadOperDividendosFdo},
  FCadCotasIntegralizar in 'FCadCotasIntegralizar.pas' {frmCadCotasIntegralizar},
  FCadOperEmpAcoes in 'FCadOperEmpAcoes.pas' {frmCadOperEmpAcoes},
  uEmprestAcoes in 'uEmprestAcoes.pas',
  dRendaFixa in 'dRendaFixa.pas' {DMRendaFixa: TDataModule},
  FDMRelEmpAcoesOper in 'FDMRelEmpAcoesOper.pas' {DmRelEmpAcoesOper},
  FDMRelEmpAcoesSaldo in 'FDMRelEmpAcoesSaldo.pas' {DmRelEmpAcoesSaldo},
  FDMRelRenFixOper in 'FDMRelRenFixOper.pas' {DmRelRenFixOper},
  FConsOperRenFix in 'FConsOperRenFix.pas' {frmConsOperRenFix},
  FConsSaldoRenFix in 'FConsSaldoRenFix.pas' {frmConsSaldoRenFix},
  FSaldoIniRenFix in 'FSaldoIniRenFix.pas' {frmVerSaldoRenFix},
  FImportaCotacoesBeta in 'FImportaCotacoesBeta.pas' {FrmImportaCotacoesBeta},
  FCadCartGerenciais in 'FCadCartGerenciais.pas' {frmCadCartGerenciais},
  FDMRelSldCartGerenc in 'FDMRelSldCartGerenc.pas' {DMRelSldCartGerenc},
  FGrafPatrimonial in 'FGrafPatrimonial.pas' {frmGraficoPatrimonial},
  FConsBeta in 'FConsBeta.pas' {frmConsBeta},
  FDMRelBeta in 'FDMRelBeta.pas' {DmRelBeta},
  FCadEspLancamento in 'FCadEspLancamento.pas' {frmEspLancamento},
  FCadFluxoRenFix in 'FCadFluxoRenFix.pas' {frmCadFluxoRenFix},
  FCadComposicaoFundo in 'FCadComposicaoFundo.pas' {frmCadComposicaoFundo},
  FConsSldCompFundo in 'FConsSldCompFundo.pas' {FrmConsSldCompFundo},
  FAutorizaParametros in 'FAutorizaParametros.pas' {frmAutorizaParametros},
  FCadLancFundosEmol in 'FCadLancFundosEmol.pas' {FrmCadLancFundosEmol},
  FCadIntCtbDirProcura in 'FCadIntCtbDirProcura.pas' {frmCadIntCtbDirProcura},
  FCadIntCtbDir in 'FCadIntCtbDir.pas' {FrmCadIntCtbDir},
  FCalculaBetaCarteira in 'FCalculaBetaCarteira.pas' {frmCalculaBetaCarteira},
  FCadCartaFianca in 'FCadCartaFianca.pas' {frmCadCartaFianca},
  FOperGarantiaBMF in 'FOperGarantiaBMF.pas' {frmOperGarantiaBMF},
  FImportaCartFdoInv in 'FImportaCartFdoInv.pas' {FrmImportaCartFdoInv},
  FConsOperGarantiaBMF in 'FConsOperGarantiaBMF.pas' {FrmConsGarantiaBMF},
  FDmRelConsGarantiaBMF in 'FDmRelConsGarantiaBMF.pas' {DmRelConsGarantiaBMF},
  FSimulacaoOperBMF in 'FSimulacaoOperBMF.pas' {FrmSimulacaoOperBMF},
  FConsCarteiraFundos in 'FConsCarteiraFundos.pas' {FrmConsCarteiraFundos},
  FCadEspOrdemMovimentacao in 'FCadEspOrdemMovimentacao.pas' {frmEspOrdemMovimentacao},
  FGrafRenFix in 'FGrafRenFix.pas' {frmGrafRenFix},
  FCadOpeVirtual in 'FCadOpeVirtual.pas' {frmCadOpeVirtual},
  FDmRelCarteiraFundos in 'FDmRelCarteiraFundos.pas' {DmRelCarteiraFundos},
  FDmRelRentabInvest in 'FDmRelRentabInvest.pas' {DmRelRentabInvest},
  FCadIntegContabil in 'FCadIntegContabil.pas' {FrmCadIntegContabil},
  FCadAcertaContabil in 'FCadAcertaContabil.pas' {FrmCadAcertaContabil},
  FCadCotacaoRenFix in 'FCadCotacaoRenFix.pas' {frmCadCotacaoRenFix},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  FConsHistCota in 'FConsHistCota.pas' {frmConsHistCota},
  FConsHistCaixa in 'FConsHistCaixa.pas' {frmConsHistCaixa},
  FCadastroGridCsInvFMD in 'FCadastroGridCsInvFMD.pas' {FrmCadastroGridCSInvFMD},
  FFechtoFundos in 'FFechtoFundos.pas' {frmFechtoFundos},
  FDMRelatoriosInv in 'FDMRelatoriosInv.pas' {DmRelatoriosInv},
  FDmRelContabVendas in 'FDmRelContabVendas.pas' {DmRelContabVendas},
  FConsContabVendas in 'FConsContabVendas.pas' {frmConsContabVendas},
  FDmRelCarteiraGerenc in 'FDmRelCarteiraGerenc.pas' {DmRelCarteiraGerenc},
  UDiasUteisInv in 'UDiasUteisInv.pas',
  UCotaComum in 'UCotaComum.pas',
  DCotaComum in 'DCotaComum.pas' {DtmCotaComum: TDataModule},
  FCadTransfCarteira in 'FCadTransfCarteira.pas' {frmCadTransfCarteira},
  FConsAtuarial in 'FConsAtuarial.pas' {frmConsAtuarial},
  FDmRelAtuarial in 'FDmRelAtuarial.pas' {DmRelAtuarial},
  UCaixaComum in 'UCaixaComum.pas',
  DCaixaComum in 'DCaixaComum.pas' {DtmCaixaComum: TDataModule},
  UProvisaoComum in 'UProvisaoComum.pas',
  DProvisaoComum in 'DProvisaoComum.pas' {DtmProvisaoComum: TDataModule},
  FConsCartGerenc in 'FConsCartGerenc.pas' {frmConsCartGerenc},
  FConsAgendaEventos in 'FConsAgendaEventos.pas' {frmConsAgendaEventos},
  FDmRelAgendaEventos in 'FDmRelAgendaEventos.pas' {dmRelAgendaEventos},
  FCadCategoriaFundo in 'FCadCategoriaFundo.pas' {frmCadCatogoriaFundo},
  FDmRelPerfisAtualizacao in 'FDmRelPerfisAtualizacao.pas' {DmRelPerfisAtualizacao},
  FConsDisponibilidade in 'FConsDisponibilidade.pas' {frmConsDisponibilidade},
  FDmRelDisponibilidade in 'FDmRelDisponibilidade.pas' {DmRelDisponibilidade},
  FTesteDatas in 'FTesteDatas.pas' {frmTesteDatas},
  fConsLanContRF in 'fConsLanContRF.pas' {frmConsLanContRF},
  FDmRelLanContRF in 'FDmRelLanContRF.pas' {DmRelLanContRF},
  FParamDemoOperCustoRet in 'FParamDemoOperCustoRet.pas' {frmParamDemoOperCustoRet},
  FDmRelDemOpCustoRet in 'FDmRelDemOpCustoRet.pas' {DmRelDemOpCustoRet},
  FDmRelBoletaEmpAcoes in 'FDmRelBoletaEmpAcoes.pas' {DMRelBoletaEmpAcoes},
  fParamPerfisRendaFixa in 'FParamPerfisRendaFixa.PAS' {frmParamPerfisRendaFixa},
  FFechtoEmp in 'FFechtoEmp.pas' {frmFechtoEmp},
  FCadResgFdoAnuncioProv in 'FCadResgFdoAnuncioProv.pas' {frmCadResgFdoAnuncioProv},
  FParamIRRfxRet in 'FParamIRRfxRet.pas' {frmParamIRRfxRet},
  FDMRelIRRfxRet in 'FDMRelIRRfxRet.pas' {DMRelIRRfxRet},
  FConsLanContRVOPE in 'FConsLanContRVOPE.PAS' {frmConsLanContRVOPE},
  FDmRelLanContRVOPE in 'FDmRelLanContRVOPE.PAS' {DmRelLanContRVOPE},
  FDmRelLanContAtuRV in 'FDmRelLanContAtuRV.pas' {DmRelLanContAtuRV},
  FCadOpcoesRenVar in 'FCadOpcoesRenVar.pas' {frmCadOpcoesRenVar},
  FCadProvPerdaRenFix in 'FCadProvPerdaRenFix.pas' {frmCadProvPerdaRenFix},
  UOpcoes in 'UOpcoes.pas',
  dOpcoes in 'dOpcoes.pas' {DMOpcoes: TDataModule},
  FCadRevOpcoes in 'FCadRevOpcoes.pas' {frmCadRevOpcoes},
  FdmRelRenFixCotacoes in 'fdmRelRenFixCotacoes.pas' {dmRelRenFixCotacoes},
  fConsCotacaoRenFix in 'fConsCotacaoRenFix.pas' {frmConsCotacaoRenFix},
  FConsIRPeriodo in 'FConsIRPeriodo.pas' {frmConsIRPeriodo},
  faMensagem in 'faMensagem.pas' {fraMensagem: TFrame},
  FDmRelFundosSaldo in 'FDmRelFundosSaldo.pas' {DmRelFundosSaldo},
  FDmRelFundosEmol in 'FDMRelFundosEmol.pas' {DmRelFundosEmol},
  FDmRelFundosConsMov in 'FDMRelFundosConsMov.pas' {DmRelFundosConsMov},
  FCadTransfFundoTipo in 'FCadTransfFundoTipo.pas' {frmCadTransfFundoTipo},
  FDmRelConsIncorporacao in 'FDmRelConsIncorporacao.pas' {DmRelConsIncorporacao},
  FCadIncorporacaoFundo in 'FCadIncorporacaoFundo.pas' {FrmCadIncorporacaoFundo},
  FCadCestaOpcInd in 'FCadCestaOpcInd.pas' {frmCadCestaOpcInd},
  FCadEstornaBoletaOpcInd in 'FCadEstornaBoletaOpcInd.pas' {frmCadEstornaBoletaOpcInd},
  FCadItemOpcInd in 'FCadItemOpcInd.pas' {frmCadItemOpcInd},
  FCadOrdemOpcInd in 'FCadOrdemOpcInd.pas' {frmCadOrdemOpcInd},
  FConsSaldoOpcInd in 'FConsSaldoOpcInd.pas' {frmConsSaldoOpcInd},
  FFechaBoletaOpcInd in 'FFechaBoletaOpcInd.pas' {frmFechaBoletaOpcInd},
  UOpcaoIndice in 'UOpcaoIndice.pas',
  FDmRelConsBoletaOpcInd in 'FDmRelConsBoletaOpcInd.pas' {DmRelConsBoletaOpcInd},
  FCadAcertaCustodia in 'FCadAcertaCustodia.pas' {FrmCadAcertaCustodia},
  FCadEstornaCestaOpcInd in 'fCadEstornaCestaOpcInd.pas' {frmCadEstornaCestaOpcInd},
  FFechaBoletaAltCesta in 'FFechaBoletaAltCesta.pas' {frmFechaBoletaAltCesta},
  FDmRelOpcIndSaldo in 'FDmRelOpcIndSaldo.pas' {DmRelOpcIndSaldo},
  FDmRelConsMovOpcInd in 'fDmRelConsMovOpcInd.pas' {DmRelConsMovOpcInd},
  FExclusaoAltCestaOpcInd in 'FExclusaoAltCestaOpcInd.pas' {frmExclusaoAltCestaOpcInd},
  URendaVariavel in 'URendaVariavel.pas',
  FConsMovAltCestaOpcInd in 'FConsMovAltCestaOpcInd.pas' {frmConsMovAltCestaOpcInd},
  FDmRelConsMovAltCestaOpcInd in 'FDmRelConsMovAltCestaOpcInd.pas' {DmRelConsMovAltCestaOpcInd},
  dRendaVariavel in 'dRendaVariavel.pas' {DMRendaVariavel: TDataModule},
  FDmRelConsPosAltCestaOpcInd in 'FDmRelConsPosAltCestaOpcInd.PAS' {DmRelConsPosAltCestaOpcInd},
  FCadOpcoesIndice in 'FCadOpcoesIndice.pas' {frmCadOpcoesIndice},
  FFechtoRenVar in 'FFechtoRenVar.pas' {FrmFechtoRenVar},
  FGrafOpcInd in 'FGrafOpcInd.pas' {frmGrafOpcInd},
  FDmRelGrafOpcInd in 'FDmRelGrafOpcInd.pas' {DmRelGrafOpcInd},
  FDmRelBoletaBMF in 'FDmRelBoletaBMF.pas' {DmRelBoletaBMF},
  FDmRelGrafRentabCotas in 'FDmRelGrafRentabCotas.pas' {DmRelatoriosInv1},
  FReprocOpcInd in 'FReprocOpcInd.pas' {frmReprocOpcInd},
  dBMF in 'dBMF.pas' {DMBMF: TDataModule},
  uBMF in 'uBMF.pas',
  FDmRelSaldosRFGrp in 'FDmRelSaldosRFGrp.pas' {DmRelSaldosRFGrp},
  FConsSaldosRFGrp in 'FConsSaldosRFGrp.pas' {frmConsSaldosRFGrp},
  FCadAnuncioCarteiraGerenc in 'FCadAnuncioCarteiraGerenc.pas' {FrmCadAnuncioCarteiraGerenc},
  FFechtoCartGerenc in 'FFechtoCartGerenc.pas' {frmFechtoCartGerenc},
  FExportaCargaMaps in 'FExportaCargaMaps.pas' {frmExportaCargaMaps},
  dDisponibilidade in 'dDisponibilidade.pas' {dmDisponibilidade: TDataModule},
  FimportaCotacoesFundos in 'FimportaCotacoesFundos.pas' {FrmImportaCotacoesFundos},
  FCadCarteiraSPC in 'FCadCarteiraSPC.pas' {frmCadCarteiraSPC},
  FConsRentabCartSPC in 'FConsRentabCartSPC.pas' {frmConsRentabCartSPC},
  FDmRelRentabSPC in 'FDmRelRentabSPC.pas' {DmRelRentabSPC},
  FConsMovRentabSPC in 'FConsMovRentabSPC.pas' {frmConsMovRentabSPC},
  FCadTipoCota in 'FCadTipoCota.pas' {frmCadTipoCota},
  FCadCotaFundoDirCred in 'FCadCotaFundoDirCred.pas' {frmCadCotaFundoDirCred},
  FCadOperFundosDirCred in 'FCadOperFundosDirCred.pas' {FrmCadOperFundosDirCred},
  FCadFluxoCotaIntDirCred in 'FCadFluxoCotaIntDirCred.pas' {frmCadFluxoCotaIntDirCred},
  FCadCotasIntegrDirCred in 'FCadCotasIntegrDirCred.pas' {frmCadCotasIntegrDirCred},
  FCadAmortizCotaDirCred in 'FCadAmortizCotaDirCred.pas' {FrmCadAmortizCotaDirCred},
  FCadPatrimonioFDC in 'FCadPatrimonioFDC.pas' {frmCadPatrimonioFDC},
  FConsBoletaOperRenFix in 'FConsBoletaOperRenFix.pas' {frmConsBoletaOperRenFix},
  FDMRelBoletaRenFixOper in 'fDMRelBoletaRenFixOper.pas' {DMRelBoletaRenFixOper},
  FDmRelRFMapaMensal in 'FDmRelRFMapaMensal.pas' {DmRelRFMapaMensal},
  FParamMapaInvRF in 'FParamMapaInvRF.pas' {frmParamMapaInvRF},
  dOpcoesIndice in 'dOpcoesIndice.pas' {DMOpcoesIndice: TDataModule},
  FImportaPUExcel in 'FImportaPUExcel.pas' {FrmImportaPUExcel},
  FCadAmortizacaoCotas in 'FCadAmortizacaoCotas.pas' {FrmCadAmortizacaoCotas},
  FCadLancamentoFundo in 'FCadLancamentoFundo.pas' {frmCadLancamentoFundo},
  FConsSaldoFundos in 'FConsSaldoFundos.pas' {frmConsSaldoFundos},
  FCadFluxoCotasIntegralizar in 'FCadFluxoCotasIntegralizar.pas' {frmCadFluxoCotasIntegralizar},
  FCadIntegralizacaoCotasAcoes in 'FCadIntegralizacaoCotasAcoes.pas' {frmCadIntegralizacaoCotasAcoes},
  FDmRelParamContab in 'FDmRelParamContab.pas' {DmRelParamContab},
  FOkCancelarRelInv in 'FOkCancelarRelInv.pas' {frmOkCancelarRelInv},
  FCadAjusteCertificado in 'FCadAjusteCertificado.pas' {frmCadAjusteCertificado},
  FConsConciliacaoCustodia in 'FConsConciliacaoCustodia.pas' {frmConsConciliacaoCustodia},
  FCadTransfRenFix in 'FCadTransfRenFix.pas' {frmCadTransfRenFix},
  FCadTransfPlanos in 'FCadTransfPlanos.pas' {frmCadTransfPlanos},
  FDmRelSaldosCustodia in 'FDmRelSaldosCustodia.pas' {DmRelSaldosCustodia},
  FAtualizaSequences in 'FAtualizaSequences.pas' {frmAtualizaSequences},
  FDmRelConsCotaFundo in 'FDmRelConsCotaFundo.pas' {DmRelConsCotaFundo},
  FParamCotaFundo in 'FParamCotaFundo.pas' {FrmParamCotaFundo},
  FDMRelOperRecebtoFdo in 'FDMRelOperRecebtoFdo.pas' {DMRelOperRecebtoFdo},
  FParamOperRecebtoFdo in 'FParamOperRecebtoFdo.pas' {FrmParamOperRecebtoFdo},
  FParamCotaIntegrFundo in 'FParamCotaIntegrFundo.pas' {FrmParamCotaIntegrFundo},
  FDmRelConsCotaIntegrFundo in 'FDmRelConsCotaIntegrFundo.pas' {DmRelConsCotaIntegrFundo},
  FDmRelOrdemRV in 'FDmRelOrdemRV.pas' {DmRelOrdemRV},
  FConsCartRendVarCCI in 'FConsCartRendVarCCI.pas' {frmConsCartRendVarCCI},
  FDmRelConsCartRenVarCCI in 'FDmRelConsCartRenVarCCI.pas' {DmRelConsCartRenVarCCI},
  FConsAnuncioProvento in 'FConsAnuncioProvento.PAS' {frmConsAnunciosProventos},
  FDmRelAGE in 'FDmRelAGE.PAS' {dmRelAGE},
  FDmRelConsAmortFdo in 'FDmRelConsAmortFdo.pas' {DmRelConsAmortFdo},
  FParamOperAmortFdo in 'FParamOperAmortFdo.pas' {frmParamOperAmortFdo},
  FConsCotaFundo in 'FConsCotaFundo.pas' {frmConsCotaFundo},
  FCadOperAjusteCustoRV in 'FCadOperAjusteCustoRV.pas' {frmCadOperAjusteCustoRV},
  FConsLancCtbFdoAtu in 'FConsLancCtbFdoAtu.pas' {frmConsLancCtbFdoAtu},
  FDmLancContabFundos in 'FDmLancContabFundos.pas' {DmLancContabFundos},
  fParamConsLanContAtuRV in 'fParamConsLanContAtuRV.pas' {frmParamConsLanContAtuRV},
  fConsLanContAtuRV in 'fConsLanContAtuRV.pas' {frmConsLanContAtuRV},
  FCadMestreDetCSInv in 'FCadMestreDetCSInv.pas' {frmCadMestreDetalheCSInv},
  DAutorizacao in '..\..\Cm\Forms\Source\DAutorizacao.pas' {DtmAutorizacao: TDataModule},
  FCadAnuncioSubscricao in 'FCadAnuncioSubscricao.pas' {frmCadAnuncioSubscricao},
  FCadDirAlteracaoTipo in 'FCadDirAlteracaoTipo.pas' {frmCadDirAlteracaoTipo},
  FConsLanContPerRF in 'fConsLanContPerRF.pas' {frmConsLanContPerRF},
  FDmRelLanContPerRF in 'FDmRelLanContPerRF.pas' {DmRelLanContPerRF},
  fParamConsLanContPerRF in 'fParamConsLanContPerRF.pas' {frmParamConsLanContPerRF},
  FCadDividendos in 'FCadDividendos.pas' {frmCadDividendos},
  FCadOperVendaPRP in 'FCadOperVendaPRP.pas' {frmCadOperVendaPRP},
  FConsLancContabFundos in 'FConsLancContabFundos.pas' {frmConsLancContabFundos},
  FCadCotIntegrFundo in 'FCadCotIntegrFundo.pas' {frmCadCotIntegrFundo},
  FCadRestituicaoCapital in 'FCadRestituicaoCapital.pas' {FrmCadRestituicaoCapital},
  FParamMapaInvFdo in 'FParamMapaInvFdo.pas' {frmParamMapaInvFdo},
  FDmRelMapaInvFdo in 'FDmRelMapaInvFdo.pas' {DmRelMapaInvFdo},
  FParamAnunciosAbt in 'FParamAnunciosAbt.pas' {frmParamAnunciosAbt},
  FDmRelAnuncAbt in 'FDmRelAnuncAbt.pas' {DmRelAnuncAbt},
  FConsAnunciosAbertos in 'FConsAnunciosAbertos.pas' {frmConsAnunciosAbertos},
  FConsAnuncPeriodo in 'FConsAnuncPeriodo.pas' {frmConsAnuncPeriodo},
  FDmRelAnuncPeriodo in 'FDmRelAnuncPeriodo.pas' {DmRelAnuncPeriodo},
  FParamAnuncPeriodo in 'FParamAnuncPeriodo.pas' {frmParamAnuncPeriodo},
  FParamConsCompCarteira in 'FParamConsCompCarteira.pas' {frmParamConsCompCarteira},
  FDMConsComposicaoCarteira in 'FDMConsComposicaoCarteira.pas' {DMConsComposicaoCarteira},
  FConsComposicaoCarteira in 'FConsComposicaoCarteira.pas' {frmConsComposicaoCarteira},
  FCadBonificacao in 'FCadBonificacao.pas' {frmCadBonificacao},
  FCadSubscricao in 'FCadSubscricao.pas' {frmCadSubscricao},
  FCadGrupamento in 'FCadGrupamento.pas' {frmCadGrupamento},
  FCadDesdobramento in 'FCadDesdobramento.pas' {frmCadDesdobramento},
  FConsMapaInvFdoAcoes in 'FConsMapaInvFdoAcoes.pas' {frmConsMapaInvFdoAcoes},
  fConsMapaInvFdo in 'fConsMapaInvFdo.pas' {frmConsMapaInvFdo},
  FParamMapaInvFdoAcoes in 'FParamMapaInvFdoAcoes.pas' {frmParamMapaInvFdoAcoes},
  FDmRelMapaRenVar in 'FDmRelMapaRenVar.pas' {DmRelMapaRenVar},
  fConsMapaRenVar in 'fConsMapaRenVar.pas' {frmConsMapaRenVar},
  FCadSubscricaoCotasFundos in 'FCadSubscricaoCotasFundos.pas' {FrmCadSubscricaoCotasFundos},
  FCadCotIntegrFundoFDC in 'FCadCotIntegrFundoFDC.pas' {frmCadCotIntegrFundoFDC},
  fConsMapaCustoRenVar in 'fConsMapaCustoRenVar.pas' {frmConsMapaCustoRenVar},
  fConsMapaPosicaoRenVar in 'fConsMapaPosicaoRenVar.pas' {frmConsMapaPosicaoRenVar},
  FConsSldQtdCotasInteg in 'FConsSldQtdCotasInteg.pas' {FrmConsSldQtdCotasInteg},
  FDmRelSldQtdCotasInteg in 'FDmRelSldQtdCotasInteg.pas' {DmRelSldQtdCotasInteg},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  uCtrlInvContab in 'CtrlObjects\uCtrlInvContab.pas',
  FCadRepacVenc in 'FCadRepacVenc.pas' {FrmCadRepacVenc},
  uDireitos in 'uDireitos.pas',
  FCadPermuta in 'FCadPermuta.pas' {frmCadPermuta},
  FParamMapaIOF in 'fParamMapaIOF.PAS' {frmParamMapaIOF},
  FDmRelRenFixMapaIOF in 'FDmRelRenFixMapaIOF.pas' {DmRelRenFixMapaIOF},
  FCadReorgSocietaria in 'FCadReorgSocietaria.pas' {FrmCadReorgSocietaria},
  FCadCisao in 'FCadCisao.pas' {FrmCadCisao},
  FCadastroGridCsInv in 'FCadastroGridCsInv.pas' {FrmCadastroGridCSInv},
  FCadBloqueioCotasFdo in 'FCadBloqueioCotasFdo.pas' {FrmCadBloqueioCotasFdo},
  FCadSubscricaoComAcoes in 'FCadSubscricaoComAcoes.pas' {frmCadSubscricaoComAcoes},
  FConsPosPlanoModulo in 'FConsPosPlanoModulo.pas' {frmConsPosPlanoModulo},
  FDmRelPosPlanoModulo in 'FDmRelPosPlanoModulo.pas' {DmRelPosPlanoModulo},
  FCadContAcoes in 'FCadContAcoes.pas' {frmCadContAcoes},
  uDbTipoOperacao in 'DbObjects\uDbTipoOperacao.pas',
  FParamInvestMT in 'FontesMT\FParamInvestMT.pas' {FrmParamInvestMT},
  uDbParamInvest in 'DbObjects\uDbParamInvest.pas',
  uCtrlParamInvest in 'CtrlObjects\uCtrlParamInvest.pas',
  uDbCustodiante in 'DbObjects\uDbCustodiante.pas',
  uCtrlInvestimento in 'CtrlObjects\uCtrlInvestimento.pas',
  uCtrlRendaFixa in 'CtrlObjectsRF\uCtrlRendaFixa.pas',
  uDbItemRenfix in 'DbObjectsRF\uDbItemRenfix.pas',
  uDbClasseRenfix in 'DbObjectsRF\uDbClasseRenfix.pas',
  uDbInvestimento in 'DbObjects\uDbInvestimento.pas',
  uDbCarteirainvest in 'DbObjects\uDbCarteiraInvest.pas',
  uCtrlRendaVariavel in 'CtrlObjectsRV\uCtrlRendaVariavel.pas',
  uDbBolsavalores in 'DbObjectsRV\uDbBolsavalores.pas',
  uCtrlBMeF in 'CtrlObjectsBMF\uCtrlBMeF.pas',
  uDbTipoinvestidor in 'DbObjectsBMF\uDbTipoinvestidor.pas',
  uCtrlFundos in 'CtrlObjectsFDO\uCtrlFundos.pas',
  uDbTipofundoinvest in 'DbObjectsFDO\uDbTipofundoinvest.pas',
  FMarcaDesmarcaInvRV in 'FMarcaDesmarcaInvRV.pas' {frmMarcaDesmarcaInvRV},
  FCadEveXCart in 'FCadEveXCart.pas' {frmCadEveXCart},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FCadastroMTInv in 'FontesMT\FCadastroMTInv.pas' {FrmCadastroMTInv},
  FCadastroGridMTInv in 'FontesMT\FCadastroGridMTInv.pas' {FrmCadastroGridMTInv},
  FCadClasseTitRenFixMT in 'FontesMT\FCadClasseTitRenFixMT.pas' {FrmCadClasseTitRenFixMT},
  FCadEveCaixaCota in 'FCadEveCaixaCota.pas' {frmCadEveCaixaCota},
  FDMRelContSaldos in 'FDMRelContSaldos.pas' {DMRelContSaldos},
  FParamSldContAcoes in 'FParamSldContAcoes.pas' {frmParamSldContAcoes},
  FConsHistCustMT in 'FontesMT\FConsHistCustMT.pas' {FrmConsHistCustMT},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  RHistCustodia in 'Reports\RHistCustodia.pas' {RelHistCustodia},
  FCadItemRendaFixaMT in 'FontesMT\FCadItemRendaFixaMT.pas' {FrmCadItemRendaFixaMT},
  FCadCurvasRenFixMT in 'FontesMT\FCadCurvasRenFixMT.pas' {FrmCadCurvasRenFixMT},
  uDbCurvasrenfix in 'DbObjectsRF\uDbCurvasrenfix.pas',
  uCtrlCustodia in 'CtrlObjectsRV\uCtrlCustodia.pas',
  uCtrlRelatorios in 'CtrlReports\uCtrlRelatorios.pas',
  FCadClassRiscoRenFixMT in 'FontesMT\FCadClassRiscoRenFixMT.pas' {frmCadClassRiscoRenFixMT},
  FCadMercadoMT in 'FontesMT\FCadMercadoMT.pas' {frmCadMercadoMT},
  uDbClassriscorenfix in 'DbObjectsRF\uDbClassriscorenfix.pas',
  uDbMercado in 'DbObjects\uDbMercado.pas',
  FCadMotivoBloqueioMT in 'FontesMT\FCadMotivoBloqueioMT.pas' {frmCadMotivoBloqueioMT},
  uDbMotivobloqueio in 'DbObjects\uDbMotivobloqueio.pas',
  RSaldosCustodia in 'Reports\RSaldosCustodia.pas' {RelSaldosCustodia},
  FConsSaldoCustMT in 'FontesMT\FConsSaldoCustMT.pas' {FrmConsSaldoCustMT},
  uDbAdmfdoinvest in 'DbObjectsFDO\uDbAdmfdoinvest.pas',
  uDbClassifanbid in 'DbObjectsFDO\uDbClassifanbid.pas',
  uCtrlPessoaAdmFdoInvest in 'CtrlObjectsFDO\uCtrlPessoaAdmFdoInvest.pas',
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  FCadastroGridMTInvFMD in 'FontesMT\FCadastroGridMTInvFMD.pas' {FrmCadastroGridMTInvFMD},
  FDmRelMapaCorret in 'FDmRelMapaCorret.pas' {DmRelMapaCorret},
  FConsMovOperVirtualMT in 'FontesMT\FConsMovOperVirtualMT.pas' {FrmConsMovOperVirtualMT},
  RMovOperVirtual in 'Reports\RMovOperVirtual.pas' {RelMovOperVirtual},
  uCtrlCarteiraGerenc in 'CtrlObjectsRV\uCtrlCarteiraGerenc.pas',
  FParamOperAjuste in 'fParamOperAjuste.pas' {frmParamOperAjuste},
  FDMRelContOpe in 'FDMRelContOpe.pas' {DMRelContOpe},
  FParamOpeContAcoes in 'FParamOpeContAcoes.pas' {frmParamOpeContAcoes},
  uCtrlDireitos in 'CtrlObjectsRV\uCtrlDireitos.pas',
  RAnunciosCanc in 'Reports\RAnunciosCanc.pas' {RelAnunciosCanc},
  FConsAnunciosCancMT in 'FontesMT\FConsAnunciosCancMT.pas' {frmConsAnunciosCancMT},
  FCadClassifAnbidMT in 'FontesMT\FCadClassifAnbidMT.pas' {FrmCadClassifAnbidMT},
  FCadRiscoFundoMT in 'FontesMT\FCadRiscoFundoMT.pas' {FrmCadRiscoFundoMT},
  uDbFundoinvest in 'DbObjectsFDO\uDbFundoinvest.pas',
  uDbHistfundoinvest in 'DbObjectsFDO\uDbHistfundoinvest.pas',
  uDbRiscoFundoInvest in 'DbObjectsFDO\uDbRiscoFundoInvest.pas',
  FDmRelSldComposicaoFdoRF in 'FDmRelSldComposicaoFdoRF.pas' {DmRelSldComposicaoFdoRF},
  FCadAdmFdoInvestMT in 'FontesMT\FCadAdmFdoInvestMT.pas' {FrmCadAdmFdoInvestMT},
  FCadTravaContabInvestMT in 'FontesMT\FCadTravaContabInvestMT.pas' {FrmCadTravaContabInvest},
  FCadTransfRenFixLote in 'FCadTransfRenFixLote.pas' {frmCadTransfRenFixLote},
  FCadProvPerdaRVMT in 'FontesMT\FCadProvPerdaRVMT.pas' {frmCadProvPerdaRVMT},
  uDbBoleta in 'DbObjectsRV\uDbBoleta.pas',
  uDbProvPerdaRV in 'DbObjectsRV\uDbProvPerdaRV.pas',
  FConsTransPlanosMT in 'FontesMT\FConsTransPlanosMT.pas' {FrmConsTransPlanosMT},
  FCadTransfRenVarLote in 'fCadTransfRenVarLote.pas' {frmCadTransfRenVarLote},
  FCadTransfFundos in 'FCadTransfFundos.pas' {frmCadTransfFundos},
  uDbTipoinvest in 'DbObjects\uDbTipoinvest.pas',
  uDbHistcustodia in 'DbObjectsRV\uDbHistcustodia.pas',
  uDbOperacaoinvest in 'DbObjectsRV\uDbOperacaoinvest.pas',
  uDbOperCustodia in 'DbObjectsRV\uDbOperCustodia.pas',
  FCadastroMestreDetMTInv in 'FontesMT\FCadastroMestreDetMTInv.pas' {FrmCadastroMestreDetMTInv},
  FCadTransfCustodiaMT in 'FontesMT\FCadTransfCustodiaMT.pas' {frmCadTransfCustodiaMT},
  FDmRelConsCartRenVar in 'FDmRelConsCartRenVar.pas' {DmRelConsCartRenVar},
  FDmRelHistCota in 'FDmRelHistCota.pas' {DmRelHistCota},
  FDmRelHistCaixa in 'FDmRelHistCaixa.pas' {DmRelHistCaixa},
  RConsTransPlanosRV in 'Reports\RConsTransPlanosRV.pas' {RelConsTransPlanosRV},
  fCadTransfRenVarCCeCCI in 'fCadTransfRenVarCCeCCI.pas' {frmCadTransfRenVarCCeCCI},
  FConsTransCCeCCIMT in 'FontesMT\FConsTransCCeCCIMT.pas' {FrmConsTransCCeCCIMT},
  RConsTransCCeCCI in 'Reports\RConsTransCCeCCI.pas' {RelConsTransCCeCCI},
  FConsTransfPlanosRFMT in 'FontesMT\FConsTransfPlanosRFMT.pas' {frmConsTransfPlanosRFMT},
  RConsTransPlanosRF in 'Reports\RConsTransPlanosRF.pas' {RelConsTransPlanosRF},
  FCadTransfPlanoFdoLote in 'FCadTransfPlanoFdoLote.pas' {frmCadTransfPlanoFdoLote},
  FConsTransfPlanoFdoLote in 'FConsTransfPlanoFdoLote.pas' {FrmConsTransfPlanoFdoLote},
  FDMRelTransfPlanoLoteFDO in 'FDMRelTransfPlanoLoteFDO.pas' {DmTransfPlanoLoteFDO},
  uCtrlPessoaConselhInvest in 'CtrlObjectsRV\uCtrlPessoaConselhInvest.pas',
  uDbConselhinvest in 'DbObjectsRV\uDbConselhinvest.pas',
  FCadConselhInvestMT in 'FontesMT\FCadConselhInvestMT.pas' {FrmCadConselhInvestMT},
  uDbHistrenfix in 'DbObjectsRF\uDbHistrenfix.pas',
  uDbHistrenfixxitens in 'DbObjectsRF\uDbHistrenfixxitens.pas',
  uDbOperrenfix in 'DbObjectsRF\uDbOperrenfix.pas',
  uDbOperrenfixxcurvas in 'DbObjectsRF\uDbOperrenfixxcurvas.pas',
  uCtrlBiblioteca in 'CtrlObjects\uCtrlBiblioteca.pas',
  uDbTipoDespInvest in 'DbObjects\uDbTipoDespInvest.pas',
  FCadTipoDespInvestMT in 'FontesMT\FCadTipoDespInvestMT.pas' {frmCadTipoDespInvestMT},
  FConsAmortizacaoRecMT in 'FontesMT\FConsAmortizacaoRecMT.pas' {FrmConsAmortizacaoRecMT},
  RConsAmortizacaoRec in 'Reports\RConsAmortizacaoRec.Pas' {RelConsAmortizacaoRec},
  uDbPedidofundo in 'DbObjectsFDO\uDbPedidofundo.pas',
  uDbUsuarioTipoMenu in 'DbObjects\uDbUsuarioTipoMenu.pas',
  FCadTipoInvUsuMT in 'FontesMT\FCadTipoInvUsuMT.pas' {FrmCadTipoInvUsuMT},
  FAlteraPatroPlanPrevContabMT in 'FontesMT\FAlteraPatroPlanPrevContabMT.pas' {frmAlteraPatroPlanPrevContabMT},
  uInvestimento in 'CtrlObjects\uInvestimento.pas',
  uDbOperacaofundo in 'DbObjectsFDO\uDbOperacaofundo.pas',
  FConsAmortizacaoBloqMT in 'FontesMT\FConsAmortizacaoBloqMT.pas' {FrmConsAmortizacaoBloqMT},
  RConsAmortizacaoBloq in 'Reports\RConsAmortizacaoBloq.pas' {RelConsAmortizacaoBloq},
  RConsBoletaOperFundo in 'Reports\RConsBoletaOperFundo.pas' {RelConsBoletaOperFundo},
  FConsBoletaOperFundosMT in 'FontesMT\FConsBoletaOperFundosMT.pas' {FrmConsBoletaOperFundosMT},
  FCadTransfPlanoCotaIntegr in 'FCadTransfPlanoCotaIntegr.pas' {frmCadTransfPlanoCotaIntegr},
  FConsTransfPlanoCotaIntegr in 'FConsTransfPlanoCotaIntegr.pas' {FrmConsTransfPlanoCotaIntegr},
  FDMRelTransfPlanoCotaIntegr in 'FDMRelTransfPlanoCotaIntegr.pas' {DmTransfPlanoCotaIntegr},
  FCmReportInv in 'Reports\FCmReportInv.pas' {FrmCmReportInv},
  uDbAgenciaRisco in 'DbObjects\uDbAgenciaRisco.pas',
  FCadAgenciaRiscoMT in 'FontesMT\FCadAgenciaRiscoMT.pas' {FrmCadAgenciaRiscoMT},
  uCtrlAcessoCarteira in 'CtrlObjectsRV\uCtrlAcessoCarteira.pas',
  uDbGrupoAcessoXCart in 'DbObjectsRV\uDbGrupoAcessoXCart.pas',
  FCadGrupoXCart in 'FontesMT\FCadGrupoXCart.pas' {frmCadGrupoXCart},
  FCadCarteiraInvestMT in 'FontesMT\FCadCarteiraInvestMT.pas' {FrmCadCarteiraInvestMT},
  uCtrlDiasUteis in 'CtrlObjects\uCtrlDiasUteis.pas',
  FCadAmortizacaoBloq in 'FCadAmortizacaoBloq.pas' {FrmCadAmortizacaoBloq},
  FImportCotacoesBovespa in 'FontesMT\FImportCotacoesBovespa.pas' {FrmImportCotacoesBovespa},
  FImplantaSaldoRVMT in 'FontesMT\FImplantaSaldoRVMT.pas' {FrmImplantaSaldoRVMT},
  uDbCotacaoacao in 'DbObjectsRV\uDbCotacaoacao.pas',
  uDbHistcartinv in 'DbObjectsRV\uDbHistcartinv.pas',
  FCadParamEmissorMT in 'FontesMT\FCadParamEmissorMT.pas' {FrmCadParamEmissorMT},
  FAssociaEmissorMT in 'FontesMT\FAssociaEmissorMT.pas' {FrmAssociaEmissorMT},
  FCadSetorEmissorMT in 'FontesMT\FCadSetorEmissorMT.pas' {FrmCadSetorEmissorMT},
  FCadValParamEmissMT in 'FontesMT\FCadValParamEmissMT.pas' {FrmCadValParamEmissMT},
  uDbParamEmissor in 'DbObjects\uDbParamEmissor.pas',
  uDbValParamXEmissor in 'DbObjects\uDbValParamXEmissor.pas',
  uDbSetorEmissor in 'DbObjects\uDbSetorEmissor.pas',
  uDbParamXEmissor in 'DbObjects\uDbParamXEmissor.pas',
  FDmRelIRPeriodo in 'FDmRelIRPeriodo.pas' {DmRelIRPeriodo},
  FImportaCxaCotMovSAF in 'FImportaCxaCotMovSAF.pas' {FrmImportaCxCotMovSAF},
  FMarcaDesmarcaInvRF in 'FMarcaDesmarcaInvRF.pas' {frmMarcaDesmarcaInvRF},
  UFuncoesInvest in 'UFuncoesInvest.pas',
  uCtrlEmpAcoes in 'CtrlObjectsRV\uCtrlEmpAcoes.pas',
  uDbHistEmpAcoes in 'DbObjectsRV\uDbHistEmpAcoes.pas',
  uDbOperEmpAcoes in 'DbObjectsRV\uDbOperEmpAcoes.pas',
  FCadEmpAcoesMT in 'FontesMT\FCadEmpAcoesMT.pas' {frmCadEmpAcoesMT},
  RBoletaEmpAcoes in 'Reports\RBoletaEmpAcoes.pas' {RelBoletaEmpAcoes},
  uCtrlParamCotacaoRV in 'CtrlObjectsRV\uCtrlParamCotacaoRV.pas',
  uDbParamCotacaoRV in 'DbObjectsRV\uDbParamCotacaoRV.pas',
  FParamCotacaoRVMT in 'FontesMT\FParamCotacaoRVMT.pas' {FrmParamCotacaoRVMT},
  FConsAnunRece in 'FConsAnunRece.pas' {frmConsAnunRece},
  uDbLancVigEmp in 'DbObjectsRV\uDbLancVigEmp.pas',
  FCadVigTipoLanc in 'FontesMT\FCadVigTipoLanc.pas' {frmCadVigTipoLanc},
  RContratosLiqEmpAcoes in 'Reports\RContratosLiqEmpAcoes.pas' {DmRContratosLiqEmpAcoes},
  FConsTransPlanosDireitosMT in 'FontesMT\FConsTransPlanosDireitosMT.pas' {FrmConsTransPlanosDireitosMT},
  RConsTransPlanosDireitosRV in 'Reports\RConsTransPlanosDireitosRV.pas' {RelConsTransPlanosDireitosRV},
  uDbOperDirTransf in 'DbObjectsRV\uDbOperDirTransf.pas',
  FConsJurosProvisionados in 'FConsJurosProvisionados.pas' {FrmConsJurosProvisionados},
  FDMRelEmpAcoesJuros in 'FDMRelEmpAcoesJuros.pas' {DmRelEmpAcoesJuros},
  FDMRelPosicaoJurosEmAberto in 'FDMRelPosicaoJurosEmAberto.pas' {DMRelPosicaoJurosEmAberto},
  FConsPosicaoJurosEmAberto in 'FConsPosicaoJurosEmAberto.pas' {frmConsPosicaoJurosEmAberto},
  FImportaEmpAcoes in 'FImportaEmpAcoes.pas' {FrmImportaEmpAcoes},
  FContratosLiqEmpAcoes in 'FContratosLiqEmpAcoes.pas' {frmContratosLiqEmpAcoes},
  FDmRelFundoDirCred in 'FDmRelFundoDirCred.pas' {DmRelFundoDirCred},
  FDMRelLancFundo in 'FDMRelLancFundo.pas' {DmRelLancFundo},
  FDmRelVerificaAcoes in 'FDmRelVerificaAcoes.pas' {DmRelVerificaAcoes};

{$R *.RES}
{$R INVESTIMENTOS_RES.RES}


begin
	frmCMEntrada:= TfrmCMEntrada.Create(Application);
	frmCMEntrada.Show;
	frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Sistema de Investimentos';
  Application.HelpFile := 'C:\ProjetosCM5\Help\Investimentos.chm';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TdtmOperacaoInvest, dtmOperacaoInvest);
  Application.CreateForm(TdtmReports, dtmReports);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TdtmFuncoesInvest, dtmFuncoesInvest);
  Application.CreateForm(TdtmOperComum, dtmOperComum);
  Application.CreateForm(TdtmAGE, dtmAGE);
  Application.CreateForm(TDmFundoComum, DmFundoComum);
  Application.CreateForm(TDMEmprestAcoes, DMEmprestAcoes);
  Application.CreateForm(TfrmAguardeInv, frmAguardeInv);
  Application.CreateForm(TDMRendaFixa, DMRendaFixa);
  Application.CreateForm(TDtmCotaComum, DtmCotaComum);
  Application.CreateForm(TDtmCaixaComum, DtmCaixaComum);
  Application.CreateForm(TDtmProvisaoComum, DtmProvisaoComum);
  Application.CreateForm(TDMOpcoes, DMOpcoes);
  Application.CreateForm(TDMRendaVariavel, DMRendaVariavel);
  Application.CreateForm(TDMOpcoesIndice, DMOpcoesIndice);
  Application.CreateForm(TDtmAutorizacao, DtmAutorizacao);
  Application.CreateForm(TDmRelFundoDirCred, DmRelFundoDirCred);
  Application.CreateForm(TDmRelLancFundo, DmRelLancFundo);
  Application.CreateForm(TDmRelVerificaAcoes, DmRelVerificaAcoes);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Investimentos
================================================================================
CM$VER      3.18.01v    26/06/2008
--------------------------------------------------------------------------------
- Pendência : 28070
  Ajuste na rotina de Resgate de Fundos de Investimentos(Ações).
- Pendência : 26447
  Acerto no coluna de VlrJuros para trazer o somatório de juros do dia quando
  existir baixas de resgate.
================================================================================
CM$VER      3.18.01u    23/06/2008
--------------------------------------------------------------------------------
- Pendência : 27993
  Ajuste na rotina de exclusão das ações.
================================================================================
CM$VER      3.18.01t    20/06/2008
--------------------------------------------------------------------------------
- Pendência : 27453
  Ajuste no lançamento financeiro e contábil das operações de direito de
    Recebimento Fracionado e Restituição de Capital e nas operações.
- Pendência : 27645
  Ajuste no lançamento financeiro e contábil das operações de direito de
    Recebimento de Subscrição por Anúncio de AGE.
- Pendência : 27958
  Ajuste no reprocessamento das operações de Alteração de Tipo.
- Pendência : 22229
  Ajuste na liberação de autorização de acesso à tela de Amortização a Receber.
================================================================================
CM$VER      3.18.01s    13/06/2008
--------------------------------------------------------------------------------
- Pendência : 25354
  Implementação de Plano/Patrocinadora independente do plano de login do sistema
    nas telas de Conferencia e Autorização de ordens de renda variável.
- Pendência : 25729
  Implementação de limitação na seleção de datas para operar carteiras
    gerenciais de acordo com o parametro cadastrado.
- Pendência : 27993
  Ajuste na rotina de exclusão de ações no cadastro de ações para identificar o
    motivo quando for impossível a exclusão.
- Pendência : 27565
  Implementação de reimportação do arquivo de cotações de ações.
- Pendência : 22229
  Implementação de laqnçamento contábil e financeiro por custo e variação na 
    tela de Recebimento de Amortizações Bloqueadas.
================================================================================
CM$VER      3.18.01r    05/06/2008
--------------------------------------------------------------------------------
- Pendência : 28020
  Ajuste nas telas de recebimento de fluxo e operações de títulos para acerto na
    captação dos campos Plano e Decrição do Item respectivamente.
  Ajuste no relatório de Mapa de Movimentação para Restituição de Capital.
================================================================================
CM$VER      3.18.01q    30/05/2008
--------------------------------------------------------------------------------
- Pendência : 28010
  Ajuste na  Natureza das operações de Restituição de Capital.
================================================================================
CM$VER      3.18.01p    29/05/2008
--------------------------------------------------------------------------------
- Pendência : 24716
  Ajustes para evitar mensagem de Out of Memory no reprocessamento de títulos de
    renda fixa.
- Pendências: 26357, 26447, 26456, 26577, 27100, 27775
  Implementação de novo empréstimo de ações em Multi-Tier
- Pendência : 28010
  Ajuste na quantidade movimentada nas operações de Restituição de Capital.
================================================================================
CM$VER      3.18.01o    28/05/2008
--------------------------------------------------------------------------------
- Pendência : 27960
  Ajuste na implementação de Entradas e Saidas p/ Transf. Carteiras no Mapa de
    Movimentação.
================================================================================
CM$VER      3.18.01n    16/05/2008
--------------------------------------------------------------------------------
- Pendência : 27913
  Implementação de ajuste no Fechamento de Boleta de Opções, na rotina que
   verifica integração contábil e financeira do Módulo.
================================================================================
CM$VER      3.18.01m    13/05/2008
--------------------------------------------------------------------------------
- Pendência : 25129
  Implementação do Bloqueio Contábil e Financeiro para o módulo Opções de Índice.
- Pendência : 25997
  Implementação para testar o périodo contábil antes da Importação das Ordens de
   Movimentação, no módulo de Renda Variável.
- Pendência : 26319
  Implementação para buscar o histórico do cadastro do Fundo no botão Procurar,
   da consulta das Carteiras dos Fundos de Investimentos.
- Pendência : 27913
  Implementação de ajuste na rotina que retorna a maior data bloqueada na
   contabilidade. A mesma estava sendo incrementada e trazendo a próxima data
   disponível.
   Esta data define o filtro da atualização de saldo dos Fundos de Investimentos.
================================================================================
CM$VER      3.18.01l    09/05/2008
--------------------------------------------------------------------------------
- Pendência : 27452
  Acerto na busca de saldo de origem de carteiras na Operação de Direitos de
   Subscrição de Ações que estava trazendo carteiras gerênciais com saldos zera-
   dos.
================================================================================
CM$VER      3.18.01k    06/05/2008
--------------------------------------------------------------------------------
- Pendência : 27840
  Recompilação do relatório de Mapa de Movimentação de Renda Fixa.
================================================================================
CM$VER      3.18.01j    05/05/2008
--------------------------------------------------------------------------------
- Pendência : 27863
  Ajuste no SQL de entrada nas regras de cálculo de fluxo de Títulos.
================================================================================
CM$VER      3.18.01i    25/04/2008
--------------------------------------------------------------------------------
- Recompilação do Padrão 18
  implementação da pendência 27768 no Padrão 16
================================================================================
CM$VER      3.18.01h    18/04/2008
--------------------------------------------------------------------------------
- Pendência : 27707
  Liberação da alteração das datas de fechamento dos módulos.
================================================================================
CM$VER      3.18.01g    26/03/2008
--------------------------------------------------------------------------------
- Pendência : 26744
  Implementação no Ajuste de Custo do Renda Variável.
================================================================================
CM$VER      3.18.01f    18/03/2008
--------------------------------------------------------------------------------
Implementação do Help no Sistema.
================================================================================
CM$VER      3.18.01e    14/03/2008
--------------------------------------------------------------------------------
- Implementação de senha no cadastro de Tipo de Fundo ao alterar a
  data do último fechamento.
================================================================================
CM$VER      3.18.01d    11/03/2008
--------------------------------------------------------------------------------
- Recompilação do Padrão 18
================================================================================
CM$VER      3.18.01c    25/01/2008
--------------------------------------------------------------------------------
- Recompilação do Padrão 18
================================================================================
CM$VER      3.18.01b    22/01/2008
--------------------------------------------------------------------------------
- Pendência : 26744
  Implementação do tipo de fundo, Fundo Mútuo de Investimentos em Empresas
   Emergentes, subordinado ao tipo de investimento Fundo de Participações - FIP,
   utilizando as funcionalidades já existentes.
================================================================================
CM$VER      3.18.01a    21/01/2008
--------------------------------------------------------------------------------
- Pendência : 25925
  Implementação do Cadastro de Valores de Indicadores (3 camadas)
- Pendência : 25924
  Implementação do Cadastro de Tipos de Indicadores (3 camadas)
- Pendência : 25923
  Implementação do Cadastro de Associação de Indicadores (3 camadas)
- Pendência : 25922
  Implementação do Cadastro de Setores (3 camadas)
- Pendência : 25706
  Implementação da crítica do Resgate de Fundos e no Reprocessamento para
   verificar os saldos bloqueados gerados em função da funcionalidade de
   Penhora.
- Pendência : 26098
  Implementação de crítica na tela de pendência de liquidação para que não seja
   lançada uma liquidação em somente uma das operações pendentes da boleta.
- Pendência : 26084
  Implementação de cálculo de Swap em Títulos de Renda Fixa
- Pendência : 26200
  Implementação de ajuste na exclusão do Tipo de Fundo de Investimento.
- Pendencia : 26214
  Implementação do submenu para as Transferências de Fundo de Investimentos
- Pendência : 25641
  Implementação do menu de Amortização para o tipo de fundo de Participações.
- Pendência : 23886
  Implementação de crítica para impedir a troca do perfil de um investimento já
    comprado.
================================================================================
CM$VER      3.17.02f    03/06/2008
--------------------------------------------------------------------------------
- Pendência : 26743
  Retirada de crítica à existência de transferência de Fundos entre Planos
    por Lote, posterior a operação de débito, impedindo sua realização.
================================================================================
CM$VER      3.17.02l    25/01/2008
--------------------------------------------------------------------------------
- Pendência : 26562
  Implementação na tela de Transferência entre Planos(Fundos de Investimentos),
   para otimizar o processo de exclusão da operação.
================================================================================
CM$VER      3.17.01k    24/01/2008
--------------------------------------------------------------------------------
- Pendência : 26562
  Implementação no módulo de Fundos de Investimentos na rotina de
   reprocessamento, do tratamento das operações de "Transferência de Fundos
   entre Planos" sem Lote.
- Pendência : 26561
  Inplementação do Código ISIN do investimento no relatório de Posição da
    Carteira de Renda Variável
- Pendência : 27146
  Inplementação do Código ISIN do investimento nos relatórios de Operações e de
    Saldos de Títulos de Renda Fixa.
================================================================================
CM$VER      3.17.01i    26/12/2007
--------------------------------------------------------------------------------
- Recompilação do Padrão 17
================================================================================
CM$VER      3.17.01h    29/10/2007
--------------------------------------------------------------------------------
- Recompilação do Padrão 17
================================================================================
CM$VER      3.17.01g    17/10/2007
--------------------------------------------------------------------------------
- Recompilação do Padrão 17
================================================================================
CM$VER      3.17.01f    11/09/2007
--------------------------------------------------------------------------------
- Pendência: 22229
  Implementação do Cadastro e da Consulta de Amortização Bloqueada para o
   Sistema de Fundos de Investimentos.
================================================================================
CM$VER      3.17.01e    06/09/2007
--------------------------------------------------------------------------------
- Recomplilação do Padrão 17
================================================================================
CM$VER      3.17.01d    04/09/2007
--------------------------------------------------------------------------------
Implementações
- Pendencia : 25671
  Implementação de ajuste na rotina de reprocessamento dos Fundos de
   Investimentos, para a Amortização ser carimbada com o plano de origem do
   lançamento no módulo Contábil.
================================================================================
CM$VER      3.17.01c    04/09/2007
--------------------------------------------------------------------------------
- Recomplilação do Padrão 17
================================================================================
CM$VER      3.17.01b    21/08/2007
--------------------------------------------------------------------------------
Implementações
- Pendência : 24957
  Implementação do Relatório Consolidado por Ativo: Anúncio de Proventos em
   aberto, Anúncio de Proventos no período, Exercício de Direito e Anúncios
   Cancelados.
- Pendência : 25728
  Ajuste no controle de acesso as carteiras de renda variável para buscar todas
   as carteiras quando não houver acesso cadastrado.  
================================================================================
CM$VER      3.17.01a    15/08/2007
--------------------------------------------------------------------------------
Implementações
- Pendência : 25728
  Implementação de Controle de Acesso as carteiras de renda variável por grupo
   de usuários.
- Pendência : 24957
  Saldo de Fundos Consolidado por Investimento, Saldo de Renda Fixa Consolidado
   por Investimento e Mapa de Posição de Renda Variável Consolidado por
    Investimento.
- Pendência : 24875
  Implementação da Agencia de Risco, Rating´s e RiskBank.
- Pendência : 24874
  Implementação do Relatório de Fundos de Renda Fixa, incluindo a Rentabilidade
   e desde o início da aplicação, permitir selecionar um plano patrocinadora e
   inclusão da regra para cálculo do índice.
- Pendência : 25291
  Melhorar a performance de Saldo de Fundos.
- Pendência : 25964
  No fechamento dos títulos, passa a utilizar a regra do perfil quando no
    histórico não houver nenhuma.
- Pendência : 25682
  Implementação dos gráficos de rentabilidade da cota e do indicador comparativo
   nos relatórios de rentabilidade.
- Pendência : 24799
  Ajuste no cálculo do valor aplicado no mapa de movimentação de títulos para
   aplicações transferidas.
- Pendência : 24876
  Implementação de Cadastro de Agência de Risco.
- Pendência : 25694
  Implementaçãos da Amortização de Cotas para os Fundo de Participações.
- Pendência : 25539
  Implementação do filtro por tipo de fundo na tela de Integralização de Cotas
   para os Fundos de Participações e FIDC.
- Pendência : 25594
  Implementação da taxa de saída na tela de Amortização de Cotas para os Fundos
   de Participações e FIDC.
  Implementação da taxa de saída na tela de Lançamento de Resgate para Fundos de
   Investimentos em Ações.
  Implementação da taxa de ingresso na tela de Lançamento de Aplicação para
   Fundos de Investimentos em Ações.
  Implementação da taxa de saída e ingresso nos relatórios de Movimentação das
   Operações e Mapa de Movimentação dos Fundos de Investimentos para os Fundos
   de Participação, FIDC e FIA.
- Pendência : 25116
  Implementação na tela de Amortização de Cotas para melhor a performance da
   operação.
- Pendência : 25640
  Implementação na tela de Operação em Fundos de Direitos Creditórios dos campos
   observação, data de vencimento e boleta na pasta de Aplicação/Subscrição.
- Pendência : 25679
  Implementação da rentabilidade do início da aplicação no fundo, na
   Rentabilidade dos Fundos de Investimentos em Ações.
- Pendência : 25707
  Implementação na tela de Cadastro de Ordens de Movimentação de Renda Variável,
   da troca no campo "Ação", de Descrição do Ativo para Código do Ativo.
- Pendência : 25194
  Implementação no módulo de Renda Variável, nas operações de Direitos, para NÃO
   gerar o recebimento em Carteiras Gerenciais, conforme a parametrização.
================================================================================
CM$VER      3.16.03m    18/04/2008
--------------------------------------------------------------------------------
- Pendência : 27767
   Verificação de Out of Memory do Empréstimo de Ações
- Pendência : 27768
  Implementação de ajuste na parametrização Contábil da busca por tipo de
   títulos para Fundo de Investimentos.
================================================================================
CM$VER      3.16.03l    16/04/2008
--------------------------------------------------------------------------------
- Pendência : 27747
  Ajuste na rotina de integração contábil de IOF provisionado para Fundos de
   Investimentos.
================================================================================
CM$VER      3.16.03k    04/04/2008
--------------------------------------------------------------------------------
- Pendência : 27452
  Ajuste na seleção das operações da tela de Subscrição com Ações para operações
    efetuadas com saldos CCI.
- Pendência : 27461
  Ajuste seleção de Plano Patrocinadora na tela de operações de Ajuste de Custo.
================================================================================
CM$VER      3.16.03j    27/03/2008
--------------------------------------------------------------------------------
- Pendência : 27668
  Implementação no Mapa de Movimentação de Títulos de Renda Fixa para perfis com
    mais de um item do tipo Moeda (BNDESPAR).
================================================================================
CM$VER      3.16.03i    18/03/2008
--------------------------------------------------------------------------------
- Pendência : 27615
  Ajuste na Amortização de Direito Creditório para poder utilizar o tipo de
    fundo de acordo com o tipoinvest do usuário.
================================================================================
CM$VER      3.16.03h    11/03/2008
--------------------------------------------------------------------------------
- Pendência : 27558
  Ajuste na rotina de resgates de fundos de investimentos para não zerar saldos
    remanescentes quando menores que 1(uma) cota.
================================================================================
CM$VER      3.16.03g    06/03/2008
--------------------------------------------------------------------------------
- Pendência : 27531
  Ajuste na rotina de marcação de ações para reprocessamento para não marcar
    ações transferidas em data anterior à data solicitada.
- Pendência : 26743
  Implementação de crítica à existência de transferência de Fundos entre Planos
    por Lote, posterior a operação de débito, impedindo sua realização.
- Pendência : 25925
  Implementação do Cadastro de Valores de Indicadores (3 camadas)
- Pendência : 25924
  Implementação do Cadastro de Tipos de Indicadores (3 camadas)
- Pendência : 25923
  Implementação do Cadastro de Associação de Indicadores (3 camadas)
- Pendência : 25922
  Implementação do Cadastro de Setores (3 camadas)
================================================================================
CM$VER      3.16.03f    25/01/2008
--------------------------------------------------------------------------------
- Pendência : 27296
  Implementação no cadastro de Fundos de Investimentos para trazer o CNPJ do
   Gestor e do Custodiante pela Regra -1 (CNPJ).
- Pendência : 26562
  Implementação no módulo de Fundos de Investimentos, na rotina de
   reprocessamento, quando é feita a busca das operações de "Transferência de
   Fundos entre Planos por Lote", para tratar os fundos do tipo Participações e
   Direitos Creditórios, com "n" cotas.
================================================================================
CM$VER      3.16.03e    16/01/2008
--------------------------------------------------------------------------------
- Pendência : 26562
  Implementação no módulo de Fundos de Investimentos na rotina de
   reprocessamento, quando é somada as operações de "Transferência de Fundos
   entre Planos por Lote", para certificados com a mesma data de aplicação.
  Implementação no módulo de Fundos de Investimentos no relatório de
   "Mapa de Movimentação em Fundos de Investimentos de Ações", referente a
   a composição da variação, quando ocorre a operação de "Transferência de
   Fundos entre Planos por Lote".
- Pendência : 27227
  Ajuste nas críticas dos filtro na tela de Amortização de Cotas.
- Pendência : 26457
  Ajuste na contabilização dos Juros Contratados de Empréstimo de Ações
   para que seja contabilizado independente do Plano/Patro que o usuário esteja
   logado no momento.
- Pendência : 26455
  Ajuste na contabilização dos  Reversão de Empréstimo de Ações
   para que seja contabilizado independente do Plano/Patro que o usuário esteja
   logado no momento.
================================================================================
CM$VER      3.16.03d    11/01/2008
--------------------------------------------------------------------------------
- Pendência : 27227
  Ajuste na Amortização de Cotas, devido a problema de Constraint
================================================================================
CM$VER      3.16.03c    08/01/2008
--------------------------------------------------------------------------------
- Pendência : 26743
  Implementação da soma de operações de Transferência de Fundos entre Planos por
   Lote com a mesma data de aplicação.
================================================================================
CM$VER      3.16.03b    26/12/2007
--------------------------------------------------------------------------------
- Pendência : 25948
  Ajuste no relatório de saldos de títulos de renda fixa. Ajustado o cálculo do
    saldo líquido para títulos com IOF e Deságio.
- Pendência : 24943
  Ajuste no relatório de operações de títulos de renda fixa para exibir o PU da
    transferência nas operações de transferência e não o PU de compra original.
================================================================================
CM$VER      3.16.03a    14/12/2007
--------------------------------------------------------------------------------
- Pendência : 27016
  Implementação do parâmetro de controle da integração contábil e financeira por
   fundo no cadastro do mesmo.
- Pendência : 27000
  Ajuste no cálculo de valor de mercado de NTN.
   Permite cadastrar PU PAR para títulos de renda fixa ainda não comprados.
- Pendência : 26796
  Ajuste para dispensar operações de Anúncio de Provento e Cancelamento de
    Proventos nos relatórios de Mapa de Movimentação e Mapa de Posição de renda
    variável.
- Pendência: 26386
  Implementação de parametrização contábil por Fundo.
================================================================================
CM$VER      3.16.02a    14/11/2007
--------------------------------------------------------------------------------
- Pendência : 26870
  Implementação do Tipo de Operação no relatório de Operações de BM&F
================================================================================
CM$VER      3.16.01z    14/11/2007
--------------------------------------------------------------------------------
- Pendência : 26798
  Ajuste para gravação do documento financeiro no lançamento de fluxo de títulos
    de renda fixa.
================================================================================
CM$VER      3.16.01y    13/11/2007
--------------------------------------------------------------------------------
- Pendência : 26852
Implementação de Outras Despesas no Fechamento de Boleta de BM&F e permitir
a alteração das demais despesas;    
================================================================================
CM$VER      3.16.01x    09/11/2007
--------------------------------------------------------------------------------
- Pendência : 26636
  Implementação da crítica das datas;
  Implementação de ajuste no relançamento da venda de ações;
  Implementação de ajuste no relançamento da compra de Fundos;
  Implementação de ajuste na rotina de exclusão da venda de ações;
  Implementação de ajuste na rotina de exclusão da compra de Fundos;
  Implementação no "Procurar" para buscar o espelho da operação;
================================================================================
CM$VER      3.16.01v    06/11/2007
--------------------------------------------------------------------------------
- Pendência : 26636
  Implementação no reprocessamento dos Fundos de Investimento, na rotina de
  cotização de aplicação(d + n), para atualizar o tipo de operação "Aplicação
  em Fundos para Venda de Ações"(-34) com cotização em d + 1.
================================================================================
CM$VER      3.16.01u    31/10/2007
--------------------------------------------------------------------------------
- Pendência : 26721
  Ajuste no botão Procura da tela de recebimento de dividendos para não duplicar
    informações.
  Implementação de menu pop-up nos botões de Ordens e Direitos na barra atalho
    da tela principal do sistema.
- Pendência : 26732
  Ajuste no relatório para evitar duplicidade de registros quando o perfil do
    título possuir o item Agio ou Deságio.
- Pendência : 26737
  Ajuste na atualização da data de última importação das cotações na tela de
    importação de cotações via planilha Excel.
- Pendência : 26731
  Ajuste das operações de Ajuste de certificado
- Pendência : 26506
  Ajuste nas críticas da tela de Fluxo de Títulos de Renda Fixa e na consulta as
    operações efetuadas
================================================================================
CM$VER      3.16.01t    26/10/2007
--------------------------------------------------------------------------------
- Pendência : 26636
  Implementação no reprocessamento de Renda Variável, da rotina de atualização
  da operação de Venda de Ações com Compra de Fundos de
  Investimentos - Nova(-118).
================================================================================
CM$VER      3.16.01s    25/10/2007
--------------------------------------------------------------------------------
- Pendência : 26636
  Implementação no reprocessamento de Renda Variável, da rotina de atualização
  da operação de Venda de Ações com Compra de Fundos de Investimentos(-35). 
================================================================================
CM$VER      3.16.01r    23/10/2007
--------------------------------------------------------------------------------
- Pendência : 25780
  Em Operações\Renda Variável\Ordem Movimentação\Conferência
  Em Operações\Renda Variável\Ordem Movimentação\Autorização
  Foi ajustado as cores da fonte do rodapé
- Pendência : 25945
  Em Cadastro\Renda Variável\Provisão de Perda
  Foi ajustado a rotina de exclusão.
================================================================================
CM$VER      3.16.01q    22/10/2007
--------------------------------------------------------------------------------
- Pendência : 26547
  Em Operações\Renda Variável\Ordem Movimentação\Lançamento
    Ajuste no botão "Voltar" para não zerar o saldo.
- Pendência : 26386
  Implementação de parametrização contábil por Plano / Patrocinadora.
  Implementação de nova metodologia de busca dos parâmetros contábeis.
================================================================================
CM$VER      3.16.01p    17/10/2007
--------------------------------------------------------------------------------
- Pendência : 26539
  Ajustes na tela de cadastro de Investimentos de Renda Fixa e na tela de Itens
    por Perfil. (Implantação em novo Cliente).
- Pendência : 26496
  Ajuste nos lançamentos financeiros das operações de títulos de renda fixa para
    efetuar o rateio quando o lançamento não é pelo valor líquido da operação.
- Pendência : 26506
  Ajuste nas críticas da tela de Fluxo de Títulos de Renda Fixa e na consulta as
    operações efetuadas
- Pendência : 26459
  Implementado as Transferências entre Carteiras como Entrada e Saída no Mapa de
   Movimentação de Renda Variável
================================================================================
CM$VER      3.16.01o    09/10/2007
--------------------------------------------------------------------------------
- Pendência : 26503
  Alteração no fechamento do empréstimo para avisar quando existir operações
   Vencidas e não Revertidas no período;
- Pendência : 26504
  Ajuste no empréstimo de ações para retornar os campos "valor de juros" e
   "valor do empréstimo" preenchidos;
- Pendência : 26447
  Acrescido ao relatório de saldos de empréstimo de ações o campo Valor de
   Juros;
- Pendência : 26454
  Alteração no relatório de operações de empréstimo de ações a descrição da
   coluna "valor resgate" para "valor na data do vencimento";
- Pendência : 26367
  Acrescido ao relatório de operações de empréstimo de ações o filtro de
   "tipo de operações" para segregar os lançamentos;
================================================================================
CM$VER      3.16.01n    28/09/2007
--------------------------------------------------------------------------------
- Pendência : 26357 / 26448
  Implementação de reprocessamento e segregação de planos no Empréstimo de Ações
- Pendência : 26389
  Implementação da visualização do passo a passo das regras executadas no Cálculo
   de Despesas de Renda Variável;
================================================================================
CM$VER      3.16.01m    17/09/2007
--------------------------------------------------------------------------------
- Pendência : 26366
  Implementação de ajuste na consulta do Mapa de Movimentação dos Fundos de
   Renda Fixa, o qual apresentava a informação duplicada, quando ocorria mais de
   um resgate com tipo de operação distinta.
- Pendência : 26293
  Ajuste nos cálculos dos valores arredondados mostrados na tela de Pendência de
    Liquidação. Os cálculos passam a ter o resultado truncado em duas casas.
-Pendência : 26219
  Implementação de Importação de Cotações de Ações através do arquivos BDIN.TXT
  da Bovespa;
- Pendência : 26199
  Implementações de nova Tela de Implantação de Saldos para o módulo Renda Variável;
- Pendência : 26346
  Acerto na seleção de Administradores no Cadastro de Fundos de Investimentos;
- Pendência : 26349
  Acerto na contabilização de Transferência Entre Carteiras com tipo de Conta CCI;
- Pendência : 26308
  Retirada do itens 1.9.2 e 4.2 de registros de INSS (GPS) que deverão
  vir do item 2.4 quando é gerado o documento de GPS pois estava duplicando
  lançamentos
================================================================================
CM$VER      3.16.01l    05/09/2007
--------------------------------------------------------------------------------
- Pendência : 26269
  Implementação de ajuste para operação de Direito de Grupamento, módulo de
   Renda Variável, na apuração das quantidades das contas CC e CCI.
================================================================================
CM$VER      3.16.01k    04/09/2007
--------------------------------------------------------------------------------
- Pendência : 23283
  Implementação de contabilização de CCB Celg
================================================================================
CM$VER      3.16.01j    04/09/2007
--------------------------------------------------------------------------------
- Pendência : 26274
  Acerto no relatório de Rentabilidades SPC que não estava tratando corretamente  
  a cotização das operações de baixa / resgates;
================================================================================
CM$VER      3.16.01i    30/08/2007
--------------------------------------------------------------------------------
- Pendência : 26220
  Desfeita a implementação. A crítica da data para exclusão de Pendência de
    Liquidação volta a ser pela data da operação.   
================================================================================
CM$VER      3.16.01h    29/08/2007
--------------------------------------------------------------------------------
- Pendência  : 26223
  Acerto no tratamento da crítica de saldo disponível para resgates e
    verificação de saldo penhorado.
================================================================================
CM$VER      3.16.01g    28/08/2007
--------------------------------------------------------------------------------
- Pendência : 26220
  Implementação da crítica da data pelo vencimento e não pela data da operacao
   de Pendência de Liquidação
================================================================================
CM$VER      3.16.01f    27/08/2007
--------------------------------------------------------------------------------
- Pendência : 26213
  Ajuste na descrição dos lançamentos contábeis de títulos de renda fixa
================================================================================
CM$VER      3.16.01e    24/08/2007
--------------------------------------------------------------------------------
- Pendência : 25877
  Ajuste no reprocessamento de operações de Alteração de Tipo e Incorporação no
    módulo de renda variável
================================================================================
CM$VER      3.16.01d    23/08/2007
--------------------------------------------------------------------------------
- Pendência : 26012
  Remodelagem / Implementação do Cadastro de Carteiras de Investimento em 3
    camadas;
  Passa a não obrigar o Tipo de Investimento na Carteira para que a carteira
    possa ter vários segmentos;
  Alteração do Cadastro de Ordem de Movimentação de Renda Variável para trazer
    as Carteiras de Investimento que não tenha Tipo de Investimento associado;
  Alteração do Cadastro de Ordem de Renda Fixa para trazer as Carteiras de
    Investimento que não tenha Tipo de Investimento associado;
================================================================================
CM$VER      3.16.01c    20/08/2007
--------------------------------------------------------------------------------
- Recompilação no Padrão 16
================================================================================
CM$VER      3.16.01b    15/08/2007
--------------------------------------------------------------------------------
- Pendencia : 26098
  Implementação de crítica para não liquidar somente uma pendência
- Pendencia : 26074
  Implementação da alteração do PU nas operações de Pendência
================================================================================
CM$VER      3.16.01a    06/08/2007
--------------------------------------------------------------------------------
- Pendência : 26016
  Ajuste na transferência entre planos para gerar, na operação de transferência,
    os itens criados com o título já decorrido para que possam ser reprocessados
- Pendência : 25964
  Quando não houver regra gravada no histórico, o reprocessamento passa a
    utilizar a regra do perfil.
================================================================================
CM$VER      3.15.01a    20/08/2007
--------------------------------------------------------------------------------
- Recompilação do Padrão 15
================================================================================
CM$VER      3.14.01r    17/08/2007
--------------------------------------------------------------------------------
- Pendencia : 25761
   Implementação para verificar a parametrização do IOF pago no momento da
    integralização com o Financeiro, tratando a redução no valor lançado.
================================================================================
CM$VER      3.14.01q    15/08/2007
--------------------------------------------------------------------------------
- Pendencia : 26114
  Ajustes na tela de Cadastro de Ações para liberar a digitação da moeda de
    registro por Bolsa de valor
================================================================================
CM$VER      3.14.01p    10/08/2007
--------------------------------------------------------------------------------
- Pendência : 25761
  Implementação da retirada do IOF pago para a operação de Resgate em Fundos de
   Renda Fixa.
  Implementação para lançar "n" operações de resgate em Fundo de Renda Fixa.
================================================================================
CM$VER      3.14.01o    06/08/2007
--------------------------------------------------------------------------------
- Pendência : 25761
  Implementação do IOF pago para a operação de Resgate em Fundos de Renda Fixa.
================================================================================
CM$VER      3.14.01n    31/07/2007
--------------------------------------------------------------------------------
- Pendência : 25962
  Corrigido o problema em que a busca dos alteradores de IRRF não estavam
   sendo executados conforme nova regra da RF, ou seja, no primeiro decêndio de 
   cada mês.
================================================================================
CM$VER      3.14.01m    24/07/2007
--------------------------------------------------------------------------------
- Pendência : 25943
  Acerto de Contrato de Ações: Constraint R_11070
================================================================================
CM$VER      3.14.01l    23/07/2007
--------------------------------------------------------------------------------
- Pendência : 25911
  Ajuste no relatório de Anúncios em Aberto para multiplos recebimentos em AGE
    marcada como totalmente recebida.
- Pendência : 25919
  Implementação de manutenção do padrão 14.
================================================================================
CM$VER      3.14.01k    19/07/2007
--------------------------------------------------------------------------------
- Pendência : 25813
  Implementação de Log de segurança para apuração do cálculo de variação de RV
================================================================================
CM$VER      3.14.01j    17/07/2007
--------------------------------------------------------------------------------
- Pendência : 25309
  Perfil de Atualização para CCB Celg
- Pendência : 25880
  Implementação na tela de cadastro de itens de renda fixa do novo tipo de
  item "Valores para Cálculo".
- Pendência : 25874
  Implementação da nova coluna Ágio / Deságio no relatório de saldos de
  títulos de renda fixa.
- Pendência : 24717
  Ajustes no processo de abertura do sistema de renda fixa para evitar consumo
  excessivo de memória e a mensagem "Out of Memory".  
================================================================================
CM$VER      3.14.01i    10/07/2007
--------------------------------------------------------------------------------
- Pendencia : 25793
  Acerto em Cadastro\Renda Fixa\Itens por Perfil de Atualização
  inserted value too large for column
================================================================================
CM$VER      3.14.01h    05/07/2007
--------------------------------------------------------------------------------
- Pendencia : 25246
  Acerto no Relatório de Saldo de Contrato de Ações:
  O Relatório passará a imprimir o saldo dos contratos na data informada.
  Quando o usuário optar por imprimir o gráfico, o sistema solicitará o período
  Quando não houver contratos na data solicitada, será impresso somente o
  cabeçalho.
- Pendencia : 25779
  Implementação de ajuste no Mapa de Movimentação de Fundos na busca dos resgates 
  para determinado período;
- Pendencia : 25765 
  Acerto no reprocessamento de Poupança após Transferência entre Planos que não
  estava calculando Juros e Correção;
================================================================================
CM$VER      3.14.01g    04/07/2007
--------------------------------------------------------------------------------
- Pendencia : 25766
  Acerto na data de parâmetro passado para verificar se há integralização no dia
  para o Fundo de Ações.
================================================================================
CM$VER      3.14.01f    02/07/2007
--------------------------------------------------------------------------------
- Pendência 25733
  Correção do Saldo da Disponibilidade Financeira para os lançamentos de INSS
   conforme nova legislação que passa a ser gerado
   no décimo dia ou próximo útil do mês subsequente.
================================================================================
CM$VER      3.14.01e    29/06/2007
--------------------------------------------------------------------------------
Implementações
- Pendência : 25594
  Implementação da taxa de ingresso na tela de Integralização de Cotas para os
   Fundos de Participações e FIDC.
  Implementação da taxa de ingresso nos relatórios de Movimentação das Operações 
   e Mapa de Movimentação dos Fundos de Investimentos.
- Pendencia : 25246
  Acerto no Relatório de Saldo de Contrato de Ações:
   Após a liquidação do contrato todos os saldo devem ser igual a zero.   
================================================================================
CM$VER      3.14.01d    22/06/2007
--------------------------------------------------------------------------------
Implementações
- Pendencia : 25681
  Acerto de tratamento de busca de saldos de Poupança após Transferência entre
   Planos.
================================================================================
CM$VER      3.14.01c    21/06/2007
--------------------------------------------------------------------------------
Implementações
- Pendencia : 25651
  Acerto de tratamento de saldo Bloqueado para Penhora no Resgate de Renda Fixa.
================================================================================
CM$VER      3.14.01b    18/06/2007
--------------------------------------------------------------------------------
Implementações
- Pendencia : 25637
  Acerto de Fechamento de Renda Variável ao realizar uma transferência entre
  planos
- Pendencia : 24842
  Implementações para visualizar o relatório de consulta de cotas de fundos
   quando alterado o tipo de investimento
- Pendencia : 25291
   Implementação na Amortização de Principal dos Fundos de Investimentos
   Imobiliários para melhor a performance.
================================================================================
CM$VER      3.14.01a    29/05/2007
--------------------------------------------------------------------------------
Compilação por alterações na versão do padrão 13 a partir da versão 3.13.01s
Implementações
- Pendencia : 24834
  Somente realizar Integração da Penhora com o Juridico se o motivo de bloqueio
    for informado
- Pendência : 24176
  Implementação no módulo de fundos de investimento para exclusão de mais de um
    cancelamento de cotas no mesmo dia.
- Pendencia : 24176
  Implementações para verificar o controle de integração contábil do módulo de
    fundos de investimento.
- Pendência : 21000
  Somente será permitida a alteração da data de operação, na primeira inclusão
    de recebimentos. A data do Financeiro será a data de operação alterada.
- Pendência : 24774
  Implementação de parâmetro para ligar/desligar a integração contábil e
    financeira por módulo.
  Tela de Parâmetros e Modulo de Renda Variável.
    Corrigido o Fechamento de Empréstimo de Ações que não estava tratando
      corretamente a integração financeira causando divergência com o Flag de
      integração contábil e financeira;
    Acerto no lançamento de Contrato de Ações;
  Implementação da crítica de tratamento de Liga/Desliga a integração contábil/
    financeira por módulo, para Pendência de Liquidação de Bolsa e Empréstimo de
    Ações.
  Implementação ajuste na operação de Compra de Fundos de Investimento com
    Venda de Ações.
  Acerto na Integração Contábil e Financeira na funcionalidade de Ajuste de
    Custo;
  Acerto na Integração Contábil e Financeira na funcionalidade de Ajuste de
    Quantidade;
  Acerto na Integração Contábil e Financeira na funcionalidade de Opções de
    Índices.
- Pendência : 24773
  Implementação de parâmetro pata ligar/desligar a integração contábil e
    financeira para o módulo de renda fixa
- Pendencia : 25003
  Implementação na rotina de cotização de resgates devido a utilização no
    reprocessamento;
- Pendência : 24844
  Implementação na tela de consulta de saldo e operações para Contrato de Ações,
    da seleção de contratos obrigatória.
- Pendência : 24775
  Implementação de parâmetro para ligar/desligar a integração contábil e
    financeira por módulo.
  Modulo de Fundos de Investimentos.
    Acerto no problema de integridade relacional no banco de dados na operação
      de Incorporação de Fundos de Renda Variável.
- Pendência : 24771
  Aumento do tamanho do campo de quantidade transferida no relatório de
   Transferência entre Planos de Renda Fixa.
- Pendência : 24475
  Implementação da Consulta Boleta de Operação de Fundos.
- Pendência : 24028
  Tratamento para Transferência entre Planos na Consulta \ Rentabilidade.
- Pendência : 24029
  Tratamento para Transferência entre Planos na Consulta \ Rentabilidade SPC.
- Pendencia : 23674
  Segregação de Recursos - Exclusão de Documentos de Fundos de Investimento.
- Pendencia : 23674
  Segregação de Recursos - Implementação em Títulos de Renda Fixa.
- Pendencia : 23674
  Segregação de Recursos - Implementação em Empréstimo de Ações.
- Pendencia : 23674
  Segregação de Recursos - Implementação em Opções de Indice.
- Pendencia : 24046
  Acerto na Truncagem de Valores no Cálculo de Despesas de Renda Variável.
- Pendencia : 20704
  Implementação do Cadastro de Conselheiros nas Carteiras de Renda Variável.
- Pendência : 22979
  Implementação de Segregação de Planos para Direito de Subscrição com Ações.
- Pendência : 22988
  Implementação de Segregação de Planos para Ajuste de Custo.
- Pendencia : 24254
  Implementação da tela de seleção de Plano / Patrocinadora em 3 camadas.
- Pendencia : 24238
  Ajuste na tela de cadastro de Mercados para melhorar a funcionalidade da tela.
- Pendência : 24235
  Implementação da tela de Usuário por Tipo de Investimento em 3 camadas.
- Pendência : 22555
  Mudança no padrão de cores nas telas de Ordem e Fechamento de Boletas.
- Pendência : 23280
  Implementada a Conciliação de Carteiras Gerenciais
- Pendência : 23705
  Implementada da Integração com o Sistema Jurídico para operações de Penhora,
    Bloqueio e Desbloqueio de Penhora para Renda Fixa e Fundos de Investimentos.
- Pendência : 24349
  Ajuste no tratamento de mensagens nas rotinas de Fundos de Investimento
- Implementação
  Implementação da tela de Tipo de Rubricas em 3 camadas.
- Pendência : 24384
  Sugerir, na tela de Abertura de Fundos de Investimento, o Tipo de Fundo quando
    houver apenas um tipo.
- Pendência : 24453
  Alteração na Implementação do Cadastro de Item Renda Fixa 3 camadas
- Pendência : 24464
  Ajuste no lançamento de operações de direito que afetam quantidade. Excluir
    o relacionamento da Operação de Custódia com o Histórico da Carteira. Telas
    corrigidas:
    * Incorporação / Alteração de Tipo
    * Bonificação
    * Desdobramento
    * Grupamento
    * Permuta
    * Subscrição / Direito de Subscrição
    * Subscrição Com Ações
    * Reorganização Societária
    * Cisão
- Pendência : 24420
  Ajuste nas telas de Rentabilidade e Rentabilidade SPC para mostrar valores
    recebidos em dias não úteis em suas datas de liquidação.
- Pendência : 22229
  Cadastro de Amortização Bloqueada 3 camadas.
================================================================================
CM$VER      3.13.03i    12/06/2007
--------------------------------------------------------------------------------
- Pendencia : 25509
   Implementaçâo de tratamento para identificar o Tipo de Operação que traz as
    contas transitórias de liquidação para operações de Renda Variável no Cadastro
    de Tipo de Operação;
================================================================================
CM$VER      3.13.03h    29/05/2007
--------------------------------------------------------------------------------
- Pendencia : 25291
   Implementação na consulta de Saldo dos Fundos de Investimentos para melhor a
    performance.
- Pendência : 25455
   Implemnetações na tela de lançamentos de operações de Renda Fixa :
     Ajuste no cálculo de Ágio de Deságio na data de emissão;
     Ajuste no número de casas decimais da taxa de juros;
     Ajuste no número de casas decimais do PU de Mercado (DFM);
- Pendência : 25309
   Implementação de Atualização na data da emissão para títulos indicados pelo
     novo flag na tela de cadastro de investimentos de Renda Fixa.
   Implementação de novo flag na tela de Itens por Perfil para informar se o
     item será exibido na tela de cadastro operações de renda fixa.
================================================================================
CM$VER      3.13.03g    23/05/2007
--------------------------------------------------------------------------------
- Pendência : 25434
  Implementação do filtro plano/patrocinadora na operação de Pendência de
   Liquidação de Bolsa.
================================================================================
CM$VER      3.13.03f    22/05/2007
--------------------------------------------------------------------------------
- Pendência : 25434
  Ajuste na rotina de Transferência entre Carteiras que não estava zerando o
  Saldo de Custo na Carteira de Origem.
================================================================================
CM$VER      3.13.03e    21/05/2007
--------------------------------------------------------------------------------
- Pendência : 25417
  Ajuste no mapa de movimentação de Renda Variável para buscar as informações de
   saldo anterior e variação.
================================================================================
CM$VER      3.13.03d    18/05/2007
--------------------------------------------------------------------------------
- Pendência : 25410
  Aumento para 15 digitos na quantidade de decimais no campo PERCENTUAL na 
   funcionalidade de Transferência entre Planos de Renda Variável;
================================================================================
CM$VER      3.13.03c    18/05/2007
--------------------------------------------------------------------------------
- Pendência : 25404
  Implementação para buscar as variações por plano no relatório de saldos a
   integralizar dos Fundos de Investimentos.
================================================================================
CM$VER      3.13.03b    17/05/2007
--------------------------------------------------------------------------------
- Pendência : 25336
   Acerto na Busca de Saldos de Operações de Renda Fixa que estava trazendo o
    saldo incorreto;
================================================================================
CM$VER      3.13.03a    16/05/2007
--------------------------------------------------------------------------------
- Pendência : 25381
  Implementação no Mapa de Movimentação de Fundos da apuração de variação, para
   a operação de integralização de cotas.
- Pendência : 25336 
  Acerto na Busca de Saldos de Operações de Renda Fixa para trazer os diversos
   Planos / Patrocinadoras
- Pendência : 25297 / 25298 / 25299  / 25300
  Possibilitar a visualização dos dados de carteira gerencial de acordo com o
   parâmetro Utiliza Carteira Gerencial/Data no Parâmetros do sistema.  
================================================================================
CM$VER      3.13.02z    11/05/2007
--------------------------------------------------------------------------------
- Pendência : 25330
  Ajuste na segregação de plano para a operação Pendência de Liquidação de Bolsa 
================================================================================
CM$VER      3.13.02x    09/05/2007
--------------------------------------------------------------------------------
- Pendência : 25308
   Ajustes na Integralização de Cotas dos Fundos de Investimentos, para
    verificar as operações já existentes no dia.
- Pendência : 25065
   Inversão dos parâmetros da conta de baixa que estavam invertidas para a
    geração do documento no módulo de Fundos de Investimentos.
================================================================================
CM$VER      3.13.02v    03/05/2007
--------------------------------------------------------------------------------
- Pendência : 25197 / 25198 / 25199 / 25200
   Ajustes nos relatórios Mapa de Custo, Mapa de Posição, Mapa de Movimentação
     para permitir tirar agrupado por carteira própria.
- Pendência : 25260
   Implementação na Rentabilidade e Rentabilidade SPC para buscar as operações
     de transferências entre planos.
- Pendência : 25195
   Ajuste no relatório de Saldo de Quantidade para evitar duplicidade dos saldos
     dos investimentos que tiveram o peso do lote alterados.
================================================================================
CM$VER      3.13.02u    30/04/2007
--------------------------------------------------------------------------------
- Pendencia : 24388
  Implementação de tratamento para não gerar Carteiras Gerenciais na funcionali-
   dade de Recebimento de Dividendos e Juros Sobre capital;
- Pendência : 25195 / 25197 / 25198 / 25199 / 25200
   Implementação nos relatórios Saldo de Quantidades, Mapa de Custo, Mapa de 
    Posição, Mapa de Movimentação para permitir tirar agrupado por carteira 
    Própria. 
================================================================================
CM$VER      3.13.02t    27/04/2007
--------------------------------------------------------------------------------
- Pendencia : 24388
  Implementação de tratamento para não gerar Carteiras Gerenciais na funcionali-
   dade de Recebimento de Dividendos e Juros Sobre capital;
- Pendência : 25195 / 25197 / 25198 / 25199 / 25200
   Implementação nos relatórios Saldo de Quantidades, Mapa de Custo, Mapa de 
    Posição, Mapa de Movimentação para permitir tirar agrupado por carteira 
    Própria. 
================================================================================
CM$VER      3.13.02s    25/04/2007
--------------------------------------------------------------------------------
- Pendencia : 25157
  Acerto par marcar para Reprocessamento de Renda Fixa somente a aplicação
   escolhida;
================================================================================
CM$VER      3.13.02r    24/04/2007
--------------------------------------------------------------------------------
- Pendencia : 24388
  Acerto no lançamento de Transferência entre Carteiras Próprias de Renda Variá-
  vel que estava apresentando erro de Constraint com o Contábil;
  Acerto na Operação de Anuncio na Carteira Gerencial que não estava verificando
   o Parâmetro que define a Integração com a Carteira Gerancial;
================================================================================
CM$VER      3.13.02q    19/04/2007
--------------------------------------------------------------------------------
- Pendencia : 25116
  Tratamento para não duplicar a busca quando o fundo e data forem os mesmos
================================================================================
CM$VER      3.13.02p    18/04/2007
--------------------------------------------------------------------------------
- Pendência : 25073
  Reestruturação do relatório de Exercício de Direitos
    Passa a considerar somente as operações de:
        Subscricao, Direito de Subscricao, Juros sob Capital, Dividendos,
        Restituição de Capital e Recebimento Fracionado.
        Obs.: *Direito de Subscricao não terá financeiro
              *Subscricao e Direito de Subscricao somente (destino)
================================================================================
CM$VER      3.13.02o    17/04/2007
--------------------------------------------------------------------------------
- Pendência : 25071
  Implementação da rotina de unificação das operações de Integralização de Cotas
================================================================================
CM$VER      3.13.02n    17/04/2007
--------------------------------------------------------------------------------
- Pendência : 25090
  Ajuste na seleção de valores de Direito de Subscrição no Mapa de Movimentação
    de Renda variável
================================================================================
CM$VER      3.13.02m    13/04/2007
--------------------------------------------------------------------------------
- Pendência : 25026
  Ajuste na geração das operações de Não Exercício de Subscrição.
================================================================================
CM$VER      3.13.02l    12/04/2007
--------------------------------------------------------------------------------
- Pendência : 22978
  Implementação de Segregação de Planos na funcionalidade de Subscrição e Direi-
   to de Subscrição de Renda Variavel;
- Pendência : 25054
  Acerto na Consulta Rentabilidade SPC (DNP) que estava trazendo quantidade de
   ações negativa;
================================================================================
CM$VER      3.13.02k    11/04/2007
--------------------------------------------------------------------------------
- Pendência : 25022
  Implementação para tratar diversas subscrições com a mesma data de subscrição
   para Fundos de Investimentos.
================================================================================
CM$VER      3.13.02j    10/04/2007
--------------------------------------------------------------------------------
- Pendência : 24627
  Implementação de ajuste na divergência de saldo apurado na Rentabilidade e na
   Rentabilidade SPC;
- Pendência : 24610
  Implementação a Cota Senior dos Fundos de Investimentos como aplicação na Con-
   sulta de Rentabilidade e Rentabilidade SPC;
- Pendência : 24623
  Implementação de Integralização dos Fundos de Investimentos como aplicação na
  Consulta de Rentabilidade e Rentabilidade SPC;
================================================================================
CM$VER      3.13.02i    05/04/2007
--------------------------------------------------------------------------------
- Pendência : 22977
  Implementação de ajuste de segregação de planos no lançamento de Restituição
   de Capital de Renda Variável(Contabil/Financeiro).  
================================================================================
CM$VER      3.13.02h    05/04/2007
--------------------------------------------------------------------------------
- Pendência : 24758
  Implementação da Coluna Data EX na Consulta de Exercício de Direitos de RV.
- Pendência : 22977
  Implementação de ajuste de segregação de planos no lançamento de Restituição
   de Capital de Renda Variável.
================================================================================
CM$VER      3.13.02g    04/04/2007
--------------------------------------------------------------------------------
- Pendência : 24843
  Implementação de ajustes na rotina de cotização de resgate, devido a
   utilização no reprocessamento de Fundos de Investimentos.
================================================================================
CM$VER      3.13.02f    30/03/2007
--------------------------------------------------------------------------------
- Pendência : 24912
  Implementação no Relatório Mapa de Movimentação de Renda Fixa para trazer o
   Saldo de IOF na data final e não mais o acumulado no período;
- Pendência : 24891
  Implementação no Mapa de Movimentação de Fundo Imobiliário para buscar o saldo
   anterior em dias não úteis;
================================================================================
CM$VER      3.13.02e    29/03/2007
--------------------------------------------------------------------------------
- Pendência : 24934
  Acerto para buscar os cancelamentos de anúncios no caixa e mostrar no a 
   pagar/receber e ajuste para identificar os anuncios corretos devido a 
   transferência do dia 01/09/2006 no Relatório e Consulta de Carteira Gerêncial;
- Pendência : 
  Acerto na funcionalidade de Ajuste de quantidade que estava calculando incorreta
   mente o custo e variação;
================================================================================
CM$VER      3.13.02d    28/03/2007
--------------------------------------------------------------------------------
- Pendência : 24907
  Implementação para trazer corretamente no procurar as Subscrições de Cotas de
  Fundos Fechados após a operação de Transferência.
================================================================================
CM$VER      3.13.02c    27/03/2007
--------------------------------------------------------------------------------
- Pendência : 24919
  Implementação de ajuste no reprocessamento dos Resgates de Fundo de
  Investimentos;
- Pendência : 24907
  Implementação de ajuste na Susbcrição de Cotas de Fundos Fechados para trazer
  os dados de cada plano;
================================================================================
CM$VER      3.13.02b    23/03/2007
--------------------------------------------------------------------------------
- Pendência : 24839
  Implementação no relatório de Mapa de Movimentação de Fundos de Investimentos
  para apurar de entrada e saída das transferências entre planos;
================================================================================
CM$VER      3.13.02a    22/03/2007
--------------------------------------------------------------------------------
- Pendência : 24841
  Acerto na Rotina de Restituição de Capital de Renda Variável;
================================================================================
CM$VER      3.13.01z    22/03/2007
--------------------------------------------------------------------------------
- Pendência : 24843
  Implementação das rotinas de aplicação e resgate a cotizar no reprocessamento
  de fundos de investimentos.
================================================================================
CM$VER      3.13.01y    21/03/2007
--------------------------------------------------------------------------------
- Pendência : 24839
  Acerto no reprocessamento após transf. de Planos
================================================================================
CM$VER      3.13.01x    21/03/2007
--------------------------------------------------------------------------------
- Pendência : 24801
  Implementação para identificar a baixa futura de transferência por determinado
  plano origem e fundo;
- Pendência : 24008
  Implementação de ajuste no mapa de movimentação dos fundos, para atender a
   posição do fundo Brasil Private em junho/2006.
================================================================================
CM$VER      3.13.01v    19/03/2007
--------------------------------------------------------------------------------
- Pendência : 24658
  Implementações da funcionalidade de transferência de cotas a integralizar para
   o Fundo de Investimentos.
- Pendência : 24740
  Implementação para trazer o valor da operação de Transferência entre Planos
  (Baixa) como negativo;
================================================================================
CM$VER      3.13.01u    13/03/2007
--------------------------------------------------------------------------------
- Pendência : 24712
  Implementação no Fechamento de Renda Variável na rotina de verificação das
   Operações de Direito que não foram fechadas no determinado período e plano.
- Pendencia : 23275
  Implementação da coluna "Cód.BOVESPA" do papel na Consulta de Carteira de
   Renda Variável e Mapa de Posição;
================================================================================
CM$VER      3.13.01t    09/03/2007
--------------------------------------------------------------------------------
- Pendencia : 24676
  Implementação de Plano/Patrocinadora no relatório de saldos e operações de
    Contrato de Ações.
- Pendência : 24684
  Ajuste na tela de recebimento de juros de títulos de renda fixa para captar
    corretamente a quantidade da aplicação.
- Pendência : 24658
  Implementação da transsferência entre planos de cotas a integralizar de fundos
    de investimento
- Pandência : 24689
  Ajuste nos lançamentos contábil e financeiro diferenciados por Conta
    Investimento.
================================================================================
CM$VER      3.13.01s    06/03/2007
--------------------------------------------------------------------------------
Pendência : 24640
- Implementação do nome do Plano / Patrocinadora selecionado no relatório
Pendência : 24662
- Ajuste na verificação das operações do dia para transferência de planos por
    lote de fundos de investimentos.
================================================================================
CM$VER      3.13.01r    05/03/2007
--------------------------------------------------------------------------------
Pendência : 24636
- Acerto na Transferência por Lote que não estava calculando o valor da Operação
  quando título diferente de Poupança.  
================================================================================
CM$VER      3.13.01q    02/03/2007
--------------------------------------------------------------------------------
Pendência : 24551
- Ajuste no reprocessamento das operações de transferência entre planos de renda 
    variável para relançar as operações na mesma ordem em que as transferências 
    foram efetuadas.
================================================================================
CM$VER      3.13.01p    01/03/2007
--------------------------------------------------------------------------------
Pendência : 24600
Implementação de ajuste no relatório de Mapa de Movimentação do Fundo de Ações,
 devido a alteração do tipo de fundo do BRASIL PRIVATE;
Pendência : 24551
Implementação no relatório Transferências entre Planos de Renda Variável, para 
 que o saldo anterior e posterior, quando existirem mais de uma conta, apareça 
 a quantidade real;
Pendência : 24553
 Acerto na gravação do Plano / Patro na contabilização de Contrato de Ações e inclusão
 do campo Observação no relatório de Operações;
Pendência : 24563 
 Acerto no reprocessamento de Renda Variável que não estava atualizando as ações
 após a Transferência entre Planos;
Pendência : 22779
 Alteração da busca de saldos para a data anterior no lançamento de Transferência
 entre Planos de Renda Fixa e cálculo de poupanças pelo Valor;
================================================================================
CM$VER      3.13.01o    26/02/2007
--------------------------------------------------------------------------------
Pendência : 22779
Implementação de mais de uma operação de Transferência entre Planos para a mesma
aplicação no mesmo dia no módulo de Renda Fixa.
================================================================================
CM$VER      3.13.01n    22/02/2007
--------------------------------------------------------------------------------
Pendencia : 24559
Permitir a seleção de Ações com Saldo zerado na funcionalidade de Transferência
entre Planos;
================================================================================
CM$VER      3.13.01m    07/02/2007
--------------------------------------------------------------------------------
Unificação com a Consulta de Disponibilidade Financeira
Pendência : 24415
Pendência : 24344
================================================================================
CM$VER      3.13.01l    06/02/2007
--------------------------------------------------------------------------------
Implementação de ajuste no retorno de mensagem nos Fundos, no momento da
 contabilização.
================================================================================
CM$VER      3.13.01j    01/02/2007
--------------------------------------------------------------------------------
Implementação na Integração Contábil/Financeira para selecionar o tipo de título
 dos Fundos de FIDC, com qualquer nomenclatura.
================================================================================
CM$VER      3.13.01i    30/01/2007
--------------------------------------------------------------------------------
Ajuste na query qryBuscaBoletaTCU: "Type Mismach for field FLGTIPOCONTAORIG"
================================================================================
CM$VER      3.13.01h    22/01/2007
--------------------------------------------------------------------------------
Acerto na busca de saldos de Renda Variável para Contratos de Ações
================================================================================
CM$VER      3.13.01g    18/01/2007
--------------------------------------------------------------------------------
- Pendência : 24232
  Ajuste na busca do procurar no Bloqueio de Cotas do Fundo de Investimentos,
   que estava trazendo registros duplicados.
================================================================================
CM$VER      3.13.01f    17/01/2007
--------------------------------------------------------------------------------
Pendencia : 23891
- Acerto na busca de saldos CC e CCI na funcionalidade de Contrato de Ações;
================================================================================
CM$VER      3.13.01e    15/01/2007
--------------------------------------------------------------------------------
- Pendencia : 24176
   Ajuste na exclusão do Cancelamento de Cotas;
================================================================================
CM$VER      3.13.01d    10/01/2007
--------------------------------------------------------------------------------
Implementação
- Pendência : 23968
  Ajuste na rotina de tratamento para contas CCI de Resgate de Fundos;
- Pendencia : 24173
  Otimização do relatório Mapa de Movimentação de Fundos de Renda Fixa;
================================================================================
CM$VER      3.13.01c    10/01/2007
--------------------------------------------------------------------------------
Implementação
- Pendência : 24047
  Ajuste na geração de boletas de Cancelamento de Anúncio na tela de Direito de
    Recebimentos
- Pendência : 24054
  Ajuste nos cálculos de Quantidade e Valores Percentuais no Saldo de Origem da
    Tela de Direito de Permuta
- Pendência : 24058
  Ajuste nas rotinas de reprocessamento de Grupamento, Cisão e Transferência
    entre Planos
- Pendência : 24061
  Ajuste na exclusão de Tipo de Ações;
- Pendência : 24063
  Melhoria na mensagem de Cadastramento de Corretoras quando é exigido o
   cadastramento de Sub-Contas;
- Pendência : 22982
  Acerto na abertura da consulta de operações de Empréstimo de Ações que estava
   apresentando mensagem de campo inválido;
- Pendência : 24066
  Acerto na impressão do Relatório de Gráfico de Evolução de Opções de Índices;
- Pendência : 24046
  Acerto no fechamento de boletas para ajustar o rateio de despesas no documento
    financeiro
- Pendência : 24099
  Retirada a obrigatoriedade do Plano / Patro na Consulta \ Renda Variavel \ 
   Lanc. Contábeis de Operações
- Pendência : 24094
  Acerto na abertura do form Consultas\Gerenciais\Operações Virtuais que estava
   apresentando erro;
- Pendência : 23891
  Acerto na Transferência entre Planos de Renda Variável que estava apresentando
   erro na Gravação da Operação;
- Pendência : 24102
  Ajuste nos filtros e na dinâmica da tela de Consulta Posição da Carteira de
    Renda Variável.
- Pendência : 24116
  Ajuste nos filtros e na dinâmica da tela de Consulta Saldos de Quantidade de
    Renda Variável.
- Pendência : 24122
  Ajuste no Reprocessamento de operações de Recebimento de Subscrição por
    Anúncio de AGE.
- Pendência : 24075
  Ajuste na segregação de Planos e na busca dos saldos de origem.
- Pendência : 24058
  Ajuste nas rotinas de reprocessamento das operações de Grupamento, Subscrição
    e Transferência de Custódia.
- Pendência : 21859
  Implementação da permissão da transferência mesmo que seja verificado a
   existência de anúncios e recebimento de direitos. Será apenas apresentada a
   mensagem.
================================================================================
CM$VER      3.13.01b    26/12/2006
--------------------------------------------------------------------------------
Implementações
- Ajuste no relatório de Movimentação dos Fundos devido ao tratamento para
  contas CCI.
- Ajuste na gravação dos parâmetros do tipo de operação de Resgate, devido ao
   tratamento para contas CCI.
- Ajuste no relatório de Mapa de Movimentação do Fundo de Investimentos, para
   fazer a segregação de tipo de fundos em todos os períodos selecionados
================================================================================
CM$VER      3.13.01a    20/12/2006
--------------------------------------------------------------------------------
Implementações
- Otimização do relatório de Mapa de Movimentação do Fundo de Investimentos
- Otimização do processo de atualização de Saldo do Fundo de Investimentos
- Pendência :24008
  Implementações no relatório de Mapa de Movimentação, ajuste no filtro de busca
   dos Fundos que sofreram alteração de tipo de fundo
- Pendência :23813
  Retirada a critica que desabilita o Prazo de Cotização(D+N) para o tipo de Fundo com
    Ações
- Pendência : 23674
   Finalização da segregação de recursos de Fundos de Investimentos.
- Ajuste no relatório de Mapa de Movimentação do Fundo de Investimentos, para
   fazer a segregação de tipo de fundos em todos os períodos selecionados
================================================================================
CM$VER      3.13.00     19/12/2006
--------------------------------------------------------------------------------
- Pendencia : 23891
  Implementação da Liquidação Com Ações
- Pendência : 23999
  Ajuste na geração de boleta de financeiro na tela de rebecimentos
- Pendência : 22984 e 22986
  Segregação de Planos: Criação de nova tela de Transferência de Custódia,
    abrangendo transferências tanto de Custodiante quanto de Motivo de Bloqueio.
    
- Pendência : 23872
  Acerto na tela de Ajuste de Quantidade para gravar o Tipo de Operação. 
- Pendência : 23690
  Alteração do Lay-out do relatório de Transferência entre Planos de Renda
    Variável para que os saldos ficassem em colunas.
- Pendência : 22360
  Impressão da data de referência no relatório de Composição da Carteira de
    Fundos de Investimentos.
- Pendência : 23667
  Segregação de Planos: Relatório/Consulta de Extrato dos Investimentos.
- Pendência : 22973
  Segregação de Planos: Tela de Direito de Grupamento.
- Pendência : 23632
  Segregação de Planos: Ajuste no relatório para mostrar o valor aplicado
    proporcional as quantidades transferidas do título (Acerto na Coluna do
    Saldo Anterior após Pagamentos de Juros)
- Pendencia : 22492
  Implementação de Contabilização no próximo dia útil para ativos de Renda Fixa
    que geram registros em dias não uteis, através da ativação da Parâmetrização
- Pendência : 17568
  Implementação de Contabilização e Lançamento Financeiro em 3 camadas.
- Pendência : 23872
  Implementação da gravação do novo campo Tipo de Operação nas operações de
    Ajuste de Quantidade na custódia.
- Pendência : 22975
  Segregação de Planos: Permuta (Renda Variável)
- Pendência : 22976
  Segregação de Planos: Recebimento de Subscrição por Anúncio de AGE
                       (Renda Variável)
- Pendência : 22977
  Segregação de Planos: Restituição de Capital / Recebimento Fracionado
                       (Renda Variável)
- Pendência : 22980
  Segregação de Planos: Reorganização Societária (Renda Variável)
- Pendência : 22985
  Segregação de Planos: Transferência de Custodiante / Motivo de Bloqueio
                       (Renda Variável)
- Pendência : 22987
  Segregação de Planos: Ajuste de Quantidade (Renda Variável)
- Pendência : 22989
  Segregação de Planos: Lançamentos Contábeis de Operações de Renda Variável e
                        Lançamentos Contábeis de Atualização de Renda Variável
                       (Renda Variável)
- Pendência : 22981
  Segregação de Planos: Cisão (Renda Variável)
- Pendência : 23813
  No Cadastro de Fundos foi retirada a critica que desabilita o
  Prazo de Cotização para o tipo de Fundo com Ações
================================================================================
CM$VER      3.12.01e  1 /12/2006
--------------------------------------------------------------------------------
Implementações
- Pendência : 23954
  Implementações da transferência entre planos em lote para Fundos de
    Participações
================================================================================
CM$VER      3.12.01d  1 /12/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Pendência : 23968
  Tratamento para contas CCI nas operações de Resgate de Fundos a partir de
    01/10/2006;
================================================================================
CM$VER      3.12.01c  0 /11/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Implementação
  Alteração da Procura de Operações de Transferência entre Planos (Individual)
    para permitir a exclusão tanto pelo Plano de Origem quanto o de Destino;
================================================================================
CM$VER      3.12.01b  0 /11/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Pendência : 23778
  Inclusão da descrição do Investimento no histórico contábil das Transferências
    entre Planos de Renda Fixa;
- Pendência : 23787
  Implementação do Relatório das operações de transferências de Fundos de
    Investimentos;
- Pendência : 23779
  Implementação da Transferência de Fundo de Ações para FIP;
- Pendência : 23782
  Inclusão do Campo Percentual na Operação de Transferência entre Plano no
    módulo de Renda Variável, Renda Fixa e Fundos de Investimentos;
- Pendência : 23861
  Implementação de tratamento para não zerar o número de casas decimais da
    quantidade nas classes de CDB Pré e CDB Pós.
- Pendência : 23674
  Implementação de Segregação de Recursos.
- Pendencia : 23632
  Ajuste no relatório Mapa Mensal de Renda Fixa para mostrar o valor aplicado
    proporcional as quantidades transferidas do título.
  Ajustar na operações de Pagamento de Juros pela data de liquidação;
- Pendência : 23213
  Implementação de Centro de Custo único para lançamento financeiro e contábil.
- Pendencia : 21002
  Alteração da Descrição de Recebimento para Recebimentos/Recbtos no mapa de
    movimentação de Renda Fixa;
================================================================================
CM$VER      3.12.01a  1 /11/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Pendencia : 23698
  Ajustar a seleção de emissores na tela de consulta de saldos da carteira de
    renda variável.
- Pendência : 23666
  Segregação de Planos: Ajuste na seleção de carteiras do Relatório de Exercício
    de Direitos.
- Pendencia : 22972
  Segregação de Planos: Ajuste no lançamento manual na tela de Desdobramento
- Pendência : 23722
  Segregação de Planos: Ajuste nas rotinas de transferência de plano por lote
    de renda variável.
- Pendência : 22971
  Acerto nas operações de destino para levar o percentual das operações de
    origem na tela de Bonificação.
- Pendência : 48652
  Ajuste no totalizador de contas a pagar e receber na consulta da carteira
    gerencial.
================================================================================
CM$VER      3.11.02b  0 /11/2006
--------------------------------------------------------------------------------
Implementações
- Pendência : 23659
  Segregação de Planos: Tela de Recebimentos (Renda Variavel)
                        Adaptação para inclusão de provisão manual.
                        Ajuste na geração da Boleta de Cancelamento
- Pendência : 23661
  Segregação de Planos: Relatório de Anúncio de Proventos em Aberto.
- Pendência : 23665
  Segregação de Planos: Relatório de Anúncio de Proventos no Período.
- Pendência : 23666
  Segregação de Planos: Relatório de Exercício de Direitos.
- Pendência : 23670
  Segregação de Planos: Relatório de Anúncios Cancelados.
================================================================================
CM$VER      3.11.02a  2 /10/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Pendência : 23366
  Acerto na rotina de reprocessamento para reprocessar um investimento com saldo
    em múltiplos planos.
- Pendência : 23558
  Ajuste no relatório de Mapa de Movimentação de Renda Variável para mostrar
    corretamente os valores transferidos entre planos.
- Pendencia : 22856
  Implementação no cadastro de cotação de ações do Renda Variável, para
    verificar se a data de cotação é menor que a data de fechamento e o valor da
    média alterado é diferente do existente.
    Nessas condições o papel será marcado para reprocessamento.
- Pendência : 23564
  Ajuste nas rotinas de reprocessamento de Transferência entre Carteiras para
    prever transferência entre planos e transferência CC e CCI.
- Pendência : 22781
  Ajuste no relatório mapa de Movimentação de Fundo de Investimentos, na
    transferência entre planos por lote.
Implementações
- Pendência : 22957
  Segregação de Planos: Transferência por Lote (Renda Variável)
                        Consulta e Relatório das Operações
- Pendência : 22958
  Segregação de Planos: Importação de Ordens (Renda Variável)
- Pendência : 22959
  Segregação de Planos: Lançamento de Ordens (Renda Variável)
- Pendência : 22960
  Segregação de Planos: Cálculo das Despesas (Renda Variável)
- Pendência : 22961
  Segregação de Planos: Fechamento de Boletas (Renda Variável)
- Pendência : 22962
  Segregação de Planos: Recebimento de Dividendos (Renda Variável)
- Pendência : 22963
  Segregação de Planos: Transferência entre Carteiras (Renda Variável)
- Pendencia : 22964
  Segregação de Planos: Tela de Lançamento de operações gerenciais
  (Renda Variável - Carteira Gerencial).
- Pendência : 22965
  Segregação de Planos: Fechamento Diário (Renda Variável)
- Pendencia : 22966
  Segregação de Planos: Fechamento das Carteiras Gerenciais
  (Renda Variável - Carteira Gerencial).
- Pendência : 22967
  Segregação de Planos: Relatórios (Renda Variável)
- Pendência : 22968
  Segregação de Planos: Tela de Rentabilidade (Renda Variável)
- Pendência : 22969
  Segregação de Planos: Tela de Rentabilidade SPC (Renda Variável)
- Pendencia : 22970
  Segregação de Planos: Relatórios Gerenciais(Carteira Gerencial, Evolução do
  Caixa, Evolução Cota e Operações Virtuais).
- Pendencia : 22971
  Segregação de Planos: Tela de Direito de Bonificação (Renda Variável).
- Pendencia : 22972
  Segregação de Planos: Tela de Direito de Desdobramento (Renda Variável).
- Pendencia : 22974
  Segregação de Planos: Tela de Incorporação e Alteração de Tipo(Renda Variável)
- Pendencia : 22982
  Segregação de Planos: Empréstimo de Ações (Renda Variável)
- Pendencia : 22983
  Segregação de Planos: Relatórios de Empréstimo de Ações (Renda Variável)
- Pendência : 23346
  Transferência de CC para CCI.
- Pendência : 23582
  Consulta / Relatório de Transferência entre CC e CCI.
================================================================================
CM$VER      3.11.01d 26 10/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Pendencia : 23603
  Ajuste no reprocessamento de Transferência de Renda Fixa para relançar
    operações de recebimento de juros após a atualização quando esta ocorrer no
    mesmo dia da transferência.
  Ajuste no relatório de Mapa de Movimentação de Renda Fixa para captar
    corretamente o valor de pagamento de juros em títulos transferidos.
Implementações
- Implementação de nova crítica de preenchimento da carteira no cadastro de
    Fundos de Investimento.
- Pendência : 23632
  O relatório Mapa de Movimentação de Renda Fixa passa a mostrar o Valor
    Aplicado proporcional à quantidade transferida entre planos.
================================================================================
CM$VER      3.11.01c  1 /10/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Pendência : 23413
  Acerto na passagem de paramentro para contabilização de Poupança durante um
    fechamento normal que ficando sempre zerado, não contabilizava.
  Acerto na atualização de Poupança após Transferência de Planos que estava
    ficando com o Saldo zerado
- Pendência : 23508
  Acerto na Data de Liquidação de Aplicações em Renda Fixa na Lista de
    Observações quando da alteração da data de operação;
- Pendencia : 21859
  Implementação na transferência das Carteiras Gerenciais, da verificação de
    anúncios e recebimento de direitos.
- Pendência : 23344
  Tratamento para contas CCI nas operações de Resgate a partir de 01/10/2006;
- Pendência : 23528
  Acerto na exclusão das operações Transferência entre Plano (Tela Individua)
   pois, não estava excluindo a ponta de destino.
================================================================================
CM$VER      3.11.01b 03 10/2006
--------------------------------------------------------------------------------
- Acerto no lançcamento de Bonificações para as Carteiras Gerenciais
================================================================================
CM$VER      3.11.01a 03 10/2006
--------------------------------------------------------------------------------
- Recompilação com padrão 5.10.11
================================================================================
CM$VER      3.11.01  28 09/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Pendência : 20979
  Reforma na tela de Ajuste de Quantidade, incluíndo a crítica do não
    preenchimento do Motivo de Bloqueio.
- Pendência : 21301
  Ajuste nas mensagems do sistema na tela de lançamento de ordens.
- Pendência : 22895
  Permitir a contabilização de Incorporação quando o valor da operação for zero
  em função do Custo - Variação ser igual a zero.
- Pendência : 22458
  Ajuste na retirada do campo Valor Exercido do Grid de Destino e Não Exercício
  para operações de Vencimento de Subscrição.
Implementações
Pendências Implementadas
- Pendência : 23348
  Tratamento para Gerar como Conta CCI todas as Operações de Fundos de Investimento
  a partir de 01/10/2006;
- Pendência : 23344
  Tratamento para Gerar como Conta CCI todas as Operações de Renda Fixa a partir
  de 01/10/2006;
- Implementação no relatório de Saldo da Quantidade de Cotas a Integralizar, do
  apuração da variação do saldo por tipo de cotas.
- Pendência : 22860
  Controle de reprocessamento por operação na tela de Alteração de Tipo.
- Pendência : 22779
  Transferência de Títulos de Renda Fixa em Lote.
- Pendência : 22658
  Crítica para verificar a necessidade de reprocessamento de um título de renda
   fixa antes de efetuar qualquer operação de baixa (Venda, Transferencia, etc).
   Obs.: Será bloqueanda a execussão da operação em caso de necessidade de
         reprocessamento.
- Pendência : 20453
  Trava Contábil por Módulo.
- Pendência : 21302
  Crítica para não autorizar ordens não confirmadas.
- Pendência : 21854
  Alteração na forma de utilização da tela:
      Marca investimentos em uma única data.
      Desmarca investimentos em um período.
- Pendência : 20777
  Provisão de Perda de Renda Variável:
    Nova tela de cadastro da provisão de perda por investimento.
    Chamada para a nova tela no menu principal.
    Mudança na atualização dos investimentos provisionados.
- Pendencia : 22726
  Implementação do cadastramento de Rúbricas de Sistema (Negativas).
================================================================================
CM$VER      3.10.01z  2 /09/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Implementação no relatório de Saldo da Quantidade de Cotas a Integralizar, do
  apuração da variação do saldo por tipo de cotas.
================================================================================
CM$VER      3.10.01x  2 /09/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Implementação no relatório de Saldo da Quantidade de Cotas a Integralizar, da
  apuração da variação do saldo quando ocorrer integralização de cotas.   
================================================================================
CM$VER      3.10.01v  2 /09/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Implementação do tipo de cota para apurar a variação de saldos dos Fundos de
  Investimentos do tipo FIP.
================================================================================
CM$VER      3.10.01u  1 /09/2006
--------------------------------------------------------------------------------
Pendências Implementadas 
- Implementação de Segregação de Planos: Transferência de títulos de Renda Fixa
  * Nova forma de arredondamento de quantidades e calculo do valor transferido
    pelo PU do dia.
  * Ajustes no reprocessamento de caderneta de poupança.
================================================================================
CM$VER      3.10.01t  1 /09/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 22946
  Implementação no relatório de Mapa de Movimentação, operação de Amortização de
  cotas.
================================================================================
CM$VER      3.10.01s  1 /09/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 22946
  Implementação no relatório de Mapa de Movimentação para os fundos com tipo de
  cota.
================================================================================
CM$VER      3.10.01r  1 /09/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 22946
  Implementação na rotina de atualização do saldo de cotas a integralizar para
  "n" aplicações, com "n" tipos de cotas.
================================================================================
CM$VER      3.10.01q  1 /09/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 22946
  Implementação do Fechamento Diário, do Reprocessamento e do relatório de Mapa
  de Movimentação dos Fundos de Investimentos para o tipo de fundo FIP.
================================================================================
CM$VER      3.10.01p  1 /09/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 23279
  Implementação na operação de Desdobramento de Renda Variável, tratamento na
  busca do fornecedor/cliente para as operações da carteira gerencial.
================================================================================
CM$VER      3.10.01o  1 /09/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 23279
  Implementação na operação de Desdobramento de Renda Variável, a busca do saldo
  por carteira, por custódia, por motivo de bloqueio e por conta investimento.
================================================================================
CM$VER      3.10.01n  0 /09/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 23245
  Retirada a crítica de quantidade zerada para Poupanças no relatório de Saldos
   de Renda Fixa;
  Acerto no Reprocessamento de Poupanças que não estava gerando a atualização
   após a Transferência entre Planos
================================================================================
CM$VER      3.10.01m    5/09/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Implementação :
  Implementação da inversão do valor de IOF no momento da baixa, na operação de
   Transferência entre Plano de Fundos de Investimentos.
================================================================================
CM$VER      3.10.01l    5/09/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 23242
  Ajuste no totalizador do relatório de Movimentação dos Fundos de Investimento.
- Pendência : 23245
  Acerto no relatório de Saldos de Renda Fixa que não estava trazendo as
   operações de Transferência entre Planos (Destino) quando solicitado a opção
   de Abertura
- Implementação :
  Implementação da inversão do valor de IOF no momento da baixa, na operação de
   Transferência entre Plano de Fundos de Investimentos.
================================================================================
CM$VER      3.10.01k    4/09/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência :
  Ajuste na tela de recebimento de fluxos de títulos de renda fixa para buscar
    operações efetuadas na mesma data do fluxo (Transferências entre Planos)
================================================================================
CM$VER      3.10.01j    1/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 23008
  Acerto na filtragem da aplicação da Tela de transferência de títulos de renda 
   fixa entre planos/patrocinadoras por lote.
  Acerto na consulta de Saldos de Renda Fixa que estava apresentando duplicidade
   de Informações após as Transferências de Plano.
================================================================================
CM$VER      3.10.01i    1/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 22781
  Implementação da Transferência entre Planos por Lote de Fundo de Investimentos
- Pendência : 23008
  Tela de transferência de títulos de renda fixa entre planos/patrocinadoras
  por lote. 
================================================================================
CM$VER      3.10.01h    8/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 23183
  Implementação do cadastro de Cotas a Integralizar de Fundos de Ações.
================================================================================
CM$VER      3.10.01g    5/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 22946
  Implementação da operação de Integralização de Cotas para o Fundo de
  Participação.
================================================================================
CM$VER      3.10.01f    4/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 22946
  Implementação de Fundo de Participação no Modulo de Fundos de Investimentos
================================================================================
CM$VER      3.10.01e    3/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência :
  Ajuste no relatório Mapa de Movimentação em Renda Fixa para correção do valor
   total de IOF no período.
================================================================================
CM$VER      3.10.01d    2/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 22384
  Implementação de contabilização específica para Remuneração nas operações de
   recebimento.
================================================================================
CM$VER      3.10.01c    8/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência :
  Recompilação no padrão 10
================================================================================
CM$VER      3.10.01b    5/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência :
  Recompilação no padrão 10
================================================================================
CM$VER      3.10.01a    5/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência :
  Compilação no padrão 10
================================================================================
CM$VER      3.05.04a    8/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 23008
  Acerto no tipo de conta CC/CCI nas operações de Pagamento de Juros após a
  Transferência de Planos.
- Pendência :
  Implementação da busca do tipo de fundo de FIC de FIDC na Amortização.
================================================================================
CM$VER      3.05.03z    5/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência :
  Alteração na busca do recebimento parcial de anúncio com cancelamento para a
  Carteira Gerencial.
================================================================================
CM$VER      3.05.03x    5/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência :
  Alteração do tipo de campo do CODISIN no cadastro de Fundo de Investimentos.
================================================================================
CM$VER      3.05.03v    4/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 23008
  Transferência de Renda Fixa por Lote e Individual, buscando o saldo do dia
  anterior para a transferência.
================================================================================
CM$VER      3.05.03u    0/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 23051
  A operação de Subscrição de Cotas Fundos Fechados, foi desvinculada da
  operação de Fluxo de Cotas a Integralizar.
================================================================================
CM$VER      3.05.03t    9/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 23037
  Na Susbcrição de Cotas de Fundos de Investimentos, foi retirada as críticas
  para o lançamento de fluxo de integralização.
================================================================================
CM$VER      3.05.03s    8/08/2006
--------------------------------------------------------------------------------
Pendências Implementadas
- Pendência : 23009
  Vizualizar na Consulta Anúncios em Aberto um anúncio mesmo marcado como
  totalmente recebido quando a maior data de seus recebimentos for maior que
  a data de referência do relatório.
- Pendência : 23026
  Implementação de busca das operações de Transferência de Fundos no momento da
    apuração da valorização da cota que rentabiliza o saldo de caixa das
    Carteiras Gerenciais.
================================================================================
CM$VER      3.05.03r    8/07/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Acerto no Cadastro de Administrador de Fundos.
================================================================================
CM$VER      3.05.03q    6/07/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Ajuste na rotina de exclusão do Fundo de Investimento para identificar
  atualizações de Saldo sem contabilização.
- Ajustes na integralizações de cotas do Fundo de Investimento.
- Ajuste na Tela de Recebimentos por Dividendos dos Fundos de Investimentos.
Implementações
- Implementação de controle de reprocessamento por operação na tela de Alteração
   de Tipo
- Implementação de crítica para não mostrar dividendos a receber de AGE's
   marcadas como totalmente recebidas.
================================================================================
CM$VER      3.05.03p    0/07/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Ajuste na Tela de Recebimentos por Dividendos de Fundos de Investimento.
Implementações
- Pendência : 22860
  Implementação de Percentual nas operações de Incorporação e Alteração de Tipo
================================================================================
CM$VER      3.05.03o    7/07/2006
--------------------------------------------------------------------------------
Pendências Resolvidas
- Pendência  : 22860
  Melhoria da crítica de operação já existente na tela de de Incorporação e
  Alteração de Tipo.
================================================================================
CM$VER      3.05.03n    3/07/2006
--------------------------------------------------------------------------------
Pendências Resolvidas
- Pendência  : 22480
  Acerto no pagamento de juros para ficar negativo
Implementações
- Pendência : 22708
  Implementação de Não Exercício de Contrato de Ações
- Pendencia : 22845
  Ajuste na busca das vendas de ações - CC, o flag que identifica a conta de
    investimento estava sendo tratado apenas quando NULO, agora é tratado quando
    for igual a zero(0) ou NULO
================================================================================
CM$VER      3.05.03m    1/07/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Ajuste no relatório de Mapa de Movimentação de Renda Fixa, o Saldo Anterior
  das aplicações que sofreram um resgate total no período não eram trazidos.
================================================================================
CM$VER      3.05.03l    0/07/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Pendência : 22808
  Ajuste no relatório de Consulta de Movimentação dos Fundos de Investimentos.
- Pendência : 22809
  Implementação no relatório Mapa de Movimentação em Fundos de Renda Fixa, a
  dedução do IOF no Saldo e o valor do IOF negativo.
================================================================================
CM$VER      3.05.03k    7/07/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Pendência : 22723
  Ajuste na tela de Contrato de Ações para contabilizar variações negativas.
- Pendência : 22458
  Retirado o campo Valor Exercido do Grid de Destino e Não Exercício para
  operações de Vencimento de Subscrição
- Implementações :
- Ajuste no relatório de Movimentação de Fundos de Investimentos;
- Ajuste no relatório de Mapa de Movimentação de Fundos de Investimentos;
- Ajuste de Certificado dos Fundos;
- Trava por Tipo de Fundos na abertura do módulo de Fundos de Investimento;
- Implementação de Ajuste na integralização de Cotas dos Fundos de FIDC, no
  lançamento de uma operação os botões "ok" , "cancela" e "Voltar" não eram
  habilitados;
- Cadastro de Classificação ANBID, Administrador de Fundos e Nível de Risco dos
  Fundos menu cadastro de Fundos;
- Alteração no menu de cadastro de fundos (ordenação);
- Alteração do lay-out do cadastro do Fundo;
================================================================================
CM$VER      3.05.03.j   03/07/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Pendência : 22589
  Implementação da dedução do IOF no total da aplicação do valor líquido no
  relatório de Movimentação dos Fundos de Investimentos.
- Pendência : 22607
  Ajuste na busca da operação de Transferência nas Carteiras Gerencias, para
  afetar o caixa com liquidação em D+0.
================================================================================
CM$VER      3.05.03.i   03/07/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Pendência : 22589
  Implementação da contabilização do IOF para a rotina de Transferência entre
  Plano de Fundos.
================================================================================
CM$VER      3.05.03.h   27/05/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Pendência : 22695
  Ajuste na rotina de atualização do saldo da aplicação, quando no momento do
  resgate, a data de cotização for menor que a data da operação.
================================================================================
CM$VER      3.05.03.g   23/05/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Ajuste na atualização das provisões da Carteira Gerencial.
================================================================================
CM$VER      3.05.03.f   22/05/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Pendência : 22607
- Ajuste na Carteira Gerencial para sensibilizar o Caixa e a Cota com a operação
  de Transferência de Ações em D+0 separadamente das outras operações.
================================================================================
CM$VER      3.05.03.e   21/05/2006
--------------------------------------------------------------------------------
Pendências resolvidas
- Pendência : 22607
  Ajuste na Carteira Gerencial para sensibilizar o Caixa e a Cota com a operação
  de Transferência de Ações em D+0.
================================================================================
CM$VER      3.05.03.d   20/06/2006
--------------------------------------------------------------------------------
- Pendência : 22601
  Implementação no resgate de Fundo de Investimento para ser efetuado com a data
  de cotização inferior a data de operação.
================================================================================
CM$VER      3.05.03.c   14/06/2006
--------------------------------------------------------------------------------
- Pendência : 22480
  Implementação de Transferência entre Planos
- Pendencia : 22584
  Implementação de reprocessamento dos investimentos para Boleta retroativa.
================================================================================
CM$VER      3.05.03.b   09/06/2006
--------------------------------------------------------------------------------
- Pendencia : 22439
  Implementação de atualizações na rotina de Transferência entre Planos dos
  Fundos de Investimentos.
  Ref. Código do Cliente : 43516
- Pendencia : 22439
  Implementação da coluna de Transferência de Planos na consulta de Mapa de
  Movimentação.
  Ref. Código do Cliente : 43516
================================================================================
CM$VER      3.05.03.a   06/06/2006
--------------------------------------------------------------------------------
- Pendencia : 22375
  Implementação de Consulta / Relatório de Cancelamento de Anúncios de Proventos
  Ref. Código do Cliente : 43236
- Pendência : 22047
  Implementação de Contabilização de Incorporação de Variação quando o saldo de
  variação é negativo
  Ref. Código do Cliente : 42021
- Pendência : 22364
  Implementação da data e hora no rodapé do relatório Mapa de Movimentação.
  Ref. Código do Cliente : 43225
- Pendência : 21303
  Implementação da identificação do usuário no cadastro de Integração Contábil e
  Financeira.
  Ref. Código do Cliente: 20264
- Pendência : 21208
  Implementação na consulta de Exercício de Direito do campo Remuneração, Valor
  Recibido e Total Recebido.
  Ref. Código do Cliente: 39584
- Pendência : 22437
  Implementação da unificação do Resgate CC e CCI em uma única pasta, da tela de
  lançamento de Fundos. O layout da consulta de Saldo nessa mesma tela também
  foi atualizado.
- Pendência : 22446
  Implementação de otimização na consulta do relatório de Movimentação das
  Operações dos Fundos de Investimentos.
- Pendência : 20697
  Implementação de otimização na consulta do relatório de Mapa de Movimentação
  dos Fundos de Investimentos.
  Ref. Código do Cliente: 37059
- Pendência : 21103
  Implementação de otimização na consulta do relatório de Saldo dos Fundos de
  Investimentos.
  Ref. Código do Cliente: 38543
- Pendência : 21678
  Implementação do totalizador na consulta da Movimentação por Corretora de
  Renda Variável.
  Ref. Código do Cliente: 36904
- Pendência : 21408
  Retirado o período de consulta para os relatórios de Mapa de Custo e Mapa de
  Posição de Renda Variável.
  Ref. Código do Cliente: 40084
================================================================================
CM$VER      3.05.02.z   05/06/2006
--------------------------------------------------------------------------------
- Pendencia : 22527
  Melhoria na crítica de boletas calculadas e não fechadas no período.
  Ajuste na tela de Operações de Carteiras Gerenciais para gravar o status da
  boleta já como fechada.
  Ref. Código do Cliente : 43810
================================================================================
CM$VER      3.05.02.y   23/05/2006
--------------------------------------------------------------------------------
- Pendência : 22424
  Implementação de filtro no reprocessamento de Alteração de Tipo para buscar
  o saldo de Custo e Variação corretos quando existires saldos em mais de um
  custodiante.
================================================================================
CM$VER      3.05.02.x   19/05/2006
--------------------------------------------------------------------------------
- Pendência : 22388
  Acerto no reprocessamento de Cancelamento de Anúncios para evitar duplicação
  do lançamento contábil.
- Pendência : 22379
  Implementação na Importação de Cotas dos Fundos, atualização das informações
  no banco de dados a cada registro(Commit).
================================================================================
CM$VER      3.05.02.v   18/05/2006
--------------------------------------------------------------------------------
- Pendência : 22383
  Implementação de trava para não excluir históricos de títulos vencidos no
  próprio dia do vencimento durante o reprocessamento.
================================================================================
CM$VER      3.05.02.u   17/05/2006
--------------------------------------------------------------------------------
- Pendência : 22369
  Implementação de ajuste na exclusão da Subscrição de Cotas de Fundos Fechados,
  para verificar a ocorrência de Integralização de Cotas.
- Pendência : 22361
  Implementação de trava para não reprocessar um investimento aplicado no dia
  em que o sistema está aberto, passa a ignorar e deixar este investimento para
  ser reprocessado somente no dia seguinte.
================================================================================
CM$VER      3.05.02.t   16/05/2006
--------------------------------------------------------------------------------
- Pendência : 21650
  Acerto no Aplicação de Renda Fixa que não estava gravando corretamente a data
  de liquidação;
  Tratamento da Consulta de Operações com a data de liquidação;
  Acerto no retorno do Procurar do Lançamento de Fluxos de Renda Fixa
Implementações do Sistema
- Pendência : 21652
  Implementação de Ajuste na Integralização de Cotas dos Fundos de FIDC, no
  lançamento de uma operação os botões de "Ok", "Cancelar" e "Voltar" não eram
  habilitados. 
================================================================================
CM$VER      3.05.02.s   15/05/2006
--------------------------------------------------------------------------------
- Pendencia : 22317
  Implementação de relatório de operações de Contrato de Ações
  Criação de Menu na tela principal para impressão do relatório
- Pendencia : 22317
  Implementação de relatório de operações de Contrato de Ações
  Criação de Menu na tela principal para impressão do relatório
- Pendencia : 22331
  Implementação de melhoria no preenchimento e crítica do campo Recebimento /
  Pagamento na parametrização dos lançamentos financeiros
================================================================================
CM$VER      3.05.02.r   12/05/2006
--------------------------------------------------------------------------------
- Pendencia : 20998
  Alterado a descrição das data - para vencimento onde se encontra data da
  operação e data da liquidação onde se encontra vencimento.
- Pendencia : 22135
  Implementação de liquidação de Contrato de Ações sem baixa de Ações
- Pendencia : 22317
  Implementação de relatório de operações de Contrato de Ações
================================================================================
CM$VER      3.05.02.q   11/05/2006
--------------------------------------------------------------------------------
- Pendência : 21397
  Ajuste nas críticas das informações de cancelamento de provisão na tela de
  Recebimentos.
  Ajuste no relatório de Exercício de Direitos para desconsiderar as operações
  de Cancelamento de Provisão
================================================================================
CM$VER      3.05.02.p   09/05/2006
--------------------------------------------------------------------------------
Implementações do Sistema
- Implementação de Ajuste / Estorno contábil na Reversâo de Empréstimo de Ações
================================================================================
CM$VER      3.05.02.o   05/05/2006
--------------------------------------------------------------------------------
- Ajuste nas telas de rentabilidade para desprezar o valor de amortização no
  saldo dos fundos de investimentos
================================================================================
CM$VER      3.05.02.n   04/05/2006
--------------------------------------------------------------------------------
- Pendência : 21579
  Implementação da descrição do tipo de investimento, no relatório de mapa de
  movimentação dos Fundos de Renda Fixa.
================================================================================
CM$VER      3.05.02.m   02/05/2006
--------------------------------------------------------------------------------
- Pendência : 21650
  Implementação para permitir informar a data de liquidação financeira nas
  operações de Renda Fixa.
- Pendencia : 21769
  Acerto do relatório Mapa de Movimentação de Renda Fixa que estava trazendo
  Títulos totalmente resgatados
- Pendencia : 20779
  Implementação dos filtros por Classe, Emissor e Investimento
================================================================================
CM$VER      3.05.02.l   25/04/2006
--------------------------------------------------------------------------------
- Ajuste na Bonificação de Renda Variável, só as operações de destino serão
  alteradas conforme o percentual informado.
  Pendência : 22131
================================================================================
CM$VER      3.05.02.k   24/04/2006
--------------------------------------------------------------------------------
- Ajuste no controle de contabilização das boletas durante o reprocesso
================================================================================
CM$VER      3.05.02.J   20/04/2006
--------------------------------------------------------------------------------
- Acerto na filtragem das Operações na Tela de Conferência de Ordens de
  Movimentação
================================================================================
CM$VER      3.05.02.i   19/04/2006
--------------------------------------------------------------------------------
- Novo tratamento de calculo dos valores de ajuste de quantidade dos fundos de
  investimento.
================================================================================
CM$VER      3.05.02.h   19/04/2006
--------------------------------------------------------------------------------
- Correção no lançamento da operação de Ajuste de Certificado de Fundos.
- Acerto no Reprocessamento da funcionalidade de Incorporação de Ações
  Pendência : 22047
- Aumento em duas cadas decimais o PU de Custo - de 8 foi para 10 do relatório
  Mapa de Custo de Renda Variável
  Pendência :
================================================================================
CM$VER      3.05.02.g   18/04/2006
--------------------------------------------------------------------------------
- Inversão do sinal dos valores de Variação do Extrato de Investimentos.
  Pendencia : 22049
- Alterações na funcionalidade de Incorporação de Ações
  Pendência : 22047
- Acerto na operação de Ajuste de Certificado para ser carimbada corretamente
  e identificada no reprocessamento do Fundo de Investimento.
================================================================================
CM$VER      3.05.02.f   18/04/2006
--------------------------------------------------------------------------------
- Inversão do sinal dos valores de Variação do Extrato de Investimentos.
  Pendencia: 22049
- Implementação de relançamento de operações sem histórico na data do
  fechamento.
  Pendencia: 22050
================================================================================
CM$VER      3.05.02.e   12/04/2006
--------------------------------------------------------------------------------
- Implementação do novo reprocessamento comitando as operações no banco por dia.
- Implementação da consulta "Movimentação das Operações da Carteira Gerencial"
  Operações virtuais.
  Pendência: 20775
- Acerto do Totalizador do Relatório do Extrato de Investimento de Renda
  Variável.
  Pendência: 20192
- Acerto no problema na tela de Conferência de Ordens de Movimentação de Renda
  Variável que estava apresentando erro na chamada do Procurar.
  Pendência: 21264
- Acerto na consulta de rentabilidade por período para o módulo renda variável.
  Pendência: 20152
- Acerto na consulta de rentabilidade dos saldos de títulos LCI.
  Pendência: 21583
- Implementação da contabilização da conta CC ou CCI) para operação
  de amortização dos Fundos de FIDC
  Pendencia: 22077
- Ajuste na tela de Autorização das Ordens para não deixar ordens com quantidade
  zero.
- Implementação de crítica de quantidade zerada na importação de ordens de renda
  variável.
- Implementação de crítica de quantidade zerada no fechamento de boletas de
  renda variável.
================================================================================
CM$VER      3.05.02.d   05/04/2006
--------------------------------------------------------------------------------
- Acerto na confirmação de operação de Direito de Subscrição para não exigir o
  preenchimento da Data Ex.
  Pendência : 22006
================================================================================
CM$VER      3.05.02.c   04/04/2006
--------------------------------------------------------------------------------
- Ajuste na habilitação do menu de Consulta da Conciliação de Custódia do módulo
  de Renda Variável.
================================================================================
CM$VER      3.05.02.b   31/03/2006
--------------------------------------------------------------------------------
- Ajuste na seleção das cotas de fundos de investimento para trazer as cotas de
  todos os fundos no relatório de cotas de fundos de investimento.
- Alteração na Tela Subscrição para alterar a Data Ex para Data de Operação e
  permitir a alteração da Data Prevista a ser utilizada na Integração Financeira
  qdo a Operação for de Subscrição
  Pendência: 21880
- Acerto na movimentação entre as "orelhas" na tela de Cadastro de Emissores.
  Pendência: 20802
- Implementado de filtro na consulta de carteira gerencial do relatório de
  movimentação por corretora para não ocorrer duplicidade no resultado final.
  Pendência: 21266
================================================================================
CM$VER      3.05.02.a   29/03/2006
--------------------------------------------------------------------------------
- Ajuste na seleção dos Fundos de Investimentos na tela de consulta de cotas de
  fundos de investimento.
- Ajuste nas movimentações das cotas no relatório de cotas de fundos de
  investimentos.
- Ajustes na tela de transferência de fundos entre planos:
  * Ajuste na exclusão dos lancamentos contábeis.
  * Ajuste das mensagens, implementação do reprocessamento, do carimbo da
    integralização contábil/finaceira na tabela OPERACAOFUNDO e de acerto na
    gravação da cota de aplicação na tabela COTAFUNDO.
  * Implementação do carimbo da integralização contábil/finaceira na tabela
    OPERACAOFUNDO.
- Ajustes na tela de transfêrencia entre fundos:
  * Ajuste na exclusão dos lançamentos contábeis.
  * Ajuste das mensagens, implementação do reprocessamento, do carimbo da
    integralização contábil/finaceira na tabela OPERACAOFUNDO e de acerto na
    gravação da cota de aplicação na tabela COTAFUNDO.
- Acerto na forma de marcar os investimentos para reprocessamento na tela de
  transferencia entre carteiras.
- Melhoria de lay-out do relatório de Detalhamento de Boletas para acertar a
  quebra de operações e para não trazer as operações de Carteiras Gerenciais.
- Acerto funcionalidade de cadastro de emissor.
  Pendência: 20802
- Acerto no Cadastro de Setores de Emissores que estava apresentando erro na
  chamada do Procurar.
  Pendência: 21259
- Acerto na abertura do cadastro Gerais / Recursos Garantidores.
  Pendência: 21260
- Acerto na abertura do relatório Lançamentos Contábeis no Período através da
  consulta de Relatórios.
  Pendência: 21262
- Acerto no Retorno do Procurar e Inclusão de Operações de Empréstimo de Ações.
  Pendência: 21265
- Ajuste no layout da consulta "Movimentação por Corretora" e implementação da
  busca pelas corretoras que movimentaram no período.
  Pendência: 21266
- Acerto na Paginação dos Relatório Mapa de Movimentação, Custo e Posição.
  Pendência: 21267
- Acerto da tela de contrato de opção,pois o nome "pu do saldo a Pagar"
  invertidas.
  Pendência: 21548
- Acerto na tela de cadastro do tipo de operação, mostrar os campos da tela
  em branco.
  Pendência: 21586
================================================================================
CM$VER      3.05.01.p   28/03/2006
--------------------------------------------------------------------------------
- Acerto na criação do relatório Resumo das Operações Realizadas na abertura do
  sistema para retirar o erro de divisor zero.
================================================================================
CM$VER      3.05.01.o   27/03/2006
--------------------------------------------------------------------------------
- Ajuste na rotina de exclusão de lançamentos contábeis
================================================================================
CM$VER      3.05.01.n   24/03/2006
--------------------------------------------------------------------------------
- Ajuste no reprocessamento das boletas de renda variável. Não gera mais
  históricos para boletas pendentes.
- Ajuste na exclusão de boletas de renda variável para excluir os históricos
  posteriores em outra transação com o banco.
================================================================================
CM$VER      3.05.01.m   22/03/2006
--------------------------------------------------------------------------------
- Ajuste na composição do Patrimônio Final da Carteira Gerencial
================================================================================
CM$VER      3.05.01.l   20/03/2006
--------------------------------------------------------------------------------
- Ajuste no reprocessamento do lançamento da compensação entre pagamentos e
  recebimentos de uma boleta de renda variável.
================================================================================
CM$VER      3.05.01.k   20/03/2006
--------------------------------------------------------------------------------
- Ajuste na exclusão da subscrição de cotas dos Fundos para excluir os
  históricos de atualização e o contábil.
- Ajuste na tela de fechamento de boletas para impedir duplicidade de
  movimentação da carteira.
================================================================================
CM$VER      3.05.01.j   20/03/2006
--------------------------------------------------------------------------------
- Ajuste no cálculo da devolução de corretagem diferenciada por boleta
================================================================================
CM$VER      3.05.01.i   20/03/2006
--------------------------------------------------------------------------------
- Ajuste no lançamento da Integralização de Cotas para fundos de FIDC,
  a seleção do Fundo não trazia todos os fundos referente ao tipo FIDC.
- Ajuste na implementação de alteração do cálculo do Lucro das Vendas de Renda
  Variável para não diminuir as despesas da operação.
  Pendencia 21714
================================================================================
CM$VER      3.05.01.h   18/03/2006
--------------------------------------------------------------------------------
- Ajuste nos cálculos das despesas das operações para não afetar a variação
================================================================================
CM$VER      3.05.01.g   17/03/2006
--------------------------------------------------------------------------------
- Implementação no Tipo de Fundo, da tela de autorização quando for acionada a
  alteração, com liberação da data de último fechamento.
================================================================================
CM$VER      3.05.01.f   15/03/2006
--------------------------------------------------------------------------------
- Ajuste na exclusão de boleta - melhora da velocidade e integridade referencial
================================================================================
CM$VER      3.05.01.e   09/03/2006
--------------------------------------------------------------------------------
- Implementação de Alteração do cálculo do Lucro das Vendas de Renda Variável
  para não diminuir as despesas da operação.
  Pendencia 21714
- Pendencia 21586: Implementação de filtro de um tipo de operação somente,
  filtrando na entrada, nenhuma operação.
- Implementação do Flag de AGE totalmente recebida na tela de recebimentos.
- Melhoria de lay-out do relatório de Detalhamento de Boletas para acertar a
  quebra de operações e para não trazer as operações de Carteiras Gerenciais.
================================================================================
CM$VER      3.05.01.d   22/02/2006
--------------------------------------------------------------------------------
- Implementação do recolhimento de CPMF conforme a Portaria MF No. 433,
  de 27 de dezembro de 2005. Que passa a vigorar a partir de 01/03/2006.
================================================================================
CM$VER      3.05.01.c   17/02/2006
--------------------------------------------------------------------------------
- Implementação de trava de período máximo de um mês para impressão do relatório
  de lançamentos contábeis por período
- Acerto no Processamento dos cálculos de despesas de Boletas de Renda Variável
  quando existem mais de uma Boleta para a mesma Corretora na mesma data;
================================================================================
CM$VER      3.05.01.b   14/02/2006
--------------------------------------------------------------------------------
- Implementação da conta CC e CCI na Transferência entre Carteiras Gerenciais
- Implementação da descrição do tipo de investimento no relatório
  Mapa de Movimentação em Fundos de Investimentos para Fundo de Ações
================================================================================
CM$VER      3.05.01.a   09/02/2006
--------------------------------------------------------------------------------
- Ajuste na rotina do módulo de Renda Fixa, que verifica  se a atualização da
  poupança é diário ou não.
- Compilação no padrão 5.10.08
================================================================================
CM$VER      3.04.07.k   06/02/2006
--------------------------------------------------------------------------------
- Ajuste na abertura das queries da tela de Contrato de Ações
================================================================================
CM$VER      3.04.07.j   30/01/2006
--------------------------------------------------------------------------------
- Ajuste no tratamento dos menus por tipo de fundo de investimento.
================================================================================
CM$VER      3.04.07.i   16/01/2006
--------------------------------------------------------------------------------
- Ajuste na tela de lançamento de títulos para resgatar títulos utilizando
  conta CCI.
================================================================================
CM$VER      3.04.07.h   16/01/2006
--------------------------------------------------------------------------------
- Ajuste nas rotinas de atualização de renda variável para desprezar registros
  financeiros (Dividendos, Juros e Multa)
================================================================================
CM$VER      3.04.07.g   13/01/2006
--------------------------------------------------------------------------------
- Implementação da contabilização por registro para a operação de Direito de
  Subscrição e Subcrição no módulo de Renda Variável.
================================================================================
CM$VER      3.04.07.f   11/01/2006
--------------------------------------------------------------------------------
- Implementação da contabilização diferenciada por investimento para contrato
  de ações
================================================================================
CM$VER      3.04.07.e   11/01/2006
--------------------------------------------------------------------------------
- Ajuste no pró-rata do custodiante para operações de subscrição e direito de
  subscrição
- Alteração no cálculo do saldo dos contratos de ação de acordo com a
  redefinição de que o saldo não pode ser negativo.
================================================================================
CM$VER      3.04.07.d   10/01/2006
--------------------------------------------------------------------------------
- Ajuste na crítica de obrigatoriedade de digitação da data de registro de
  data de provisão de perda.
- Implementação dos novos relatórios de Saldos de Custódia e Histórico de
  Custódia.
================================================================================
CM$VER      3.04.07.c   09/01/2006
--------------------------------------------------------------------------------
- Alteração nas descrições de alguns campos da tela e relatório de contratos de
  ação por solicitação da Funcef
- Ajuste no tratamento de lançamentos contábeis dos contratos de ação.
- Implementação dos campos Data de Emissão e PU de Emissão no cadastro de
  títulos
- Implementação do preenchimento automático da data e PU de emissão na tela de
  lançamento de operações com títulos de renda fixa.
- Ajuste no relatório de histórico de custódia para exibir descrição detalhada
  das operações de movimentação na custódia
================================================================================
CM$VER      3.04.07.b   06/01/2006
--------------------------------------------------------------------------------
- Implementação do tratamento do reprocessamento especifico para Fundos
  Imóbiliarios e tratamento especifico para outros Fundos.
  Ocorrendo o reprocessamento para ambos com determinada especificação.
  (SOL : 39526)
- Ajuste na busca de saldos da tela de dividendos (SOL: 39397)
================================================================================
CM$VER      3.04.07.a   05/01/2006
--------------------------------------------------------------------------------
- Ajuste no tratamentos de Cancelamento de Subscrição no Mapa de Custo de
  Renda Variável;
================================================================================
CM$VER      3.04.06.z   05/01/2006
--------------------------------------------------------------------------------
- Ajustes gerais solicitados na tela de contrato de ações
- Implementação de tratamentos de Cancelamento de Subscrição no Mapa de Custo de
  Renda Variável;
================================================================================
CM$VER      3.04.06.y   04/01/2006
--------------------------------------------------------------------------------
- Ajuste nas críticas e lay-out da tela de Contrato de Ações.
- Ajuste nos relatórios Mapa de Movimentação e Operações de títulos.
- Reimplementação da restrição de contabilização da amortização de cotas (-43)
  no reprocessamento de fundos de investimentos.
================================================================================
CM$VER      3.04.06.x   02/01/2006
--------------------------------------------------------------------------------
- Ajuste nas críticas e implementação de cálculo de PU no cadastro de contrato
  de ações.
- Ajuste nas máscaras de exibição de provisão de perda no grid de saldos.
- Implementação do relatório de histórico de movimentação de custódia.
- Retirada a restrinção de contabilização da amortização de cotas(-43) no
  reprocessamento de Fundos de Investimentos.
- Implementação da coluna de quantidade bloqueada no relatório de Saldo de
  Fundos de Investimentos  
================================================================================
CM$VER      3.04.06.v   28/12/2005
--------------------------------------------------------------------------------
- Ajuste no reprocessamento de Alteração de Tipo e Incorporação
================================================================================
CM$VER      3.04.06.u   27/12/2005
--------------------------------------------------------------------------------
- Ajuste na tela de cancelamento de subscrição.
================================================================================
CM$VER      3.04.06.t   27/12/2005
--------------------------------------------------------------------------------
- Acerto na inicialização do Sistema
================================================================================
CM$VER      3.04.06.s   26/12/2005
--------------------------------------------------------------------------------
- Ajuste no relatório Resumo das Operações para não imprimir o PU Médio em
  negrito
- Implementação da operação de cisão.
- Implementação de cancelamento de subscrição de ações.
================================================================================
CM$VER      3.04.06.r   20/12/2005
--------------------------------------------------------------------------------
- Ajuste na tela de contrato de ações para acerto da exclusão de contratos
- Ajuste nas rotinas de reprocessamento de transferência de carteira.
- Ajuste nas rotinas de processamento e reprocessamento de custo e variação nas
  operações de Incorporação e Alteração de Tipo
================================================================================
CM$VER      3.04.06.q   14/12/2005
--------------------------------------------------------------------------------
- Ajuste nas operações de incorporação e alteração de tipo para calcular saldos
  de custo e variação para quantidades CCI e Normal proporcionalmente.
- Ajuste na tela principal para mostrar o Plano/Patrocinadora corretamente.
- Implementação de nova concepção de saldo sintético de cotas a integralizar
  para fundos de investimento
================================================================================
CM$VER      3.04.06.p   12/12/2005
--------------------------------------------------------------------------------
- Implementação do regime de caixa nas operações de recebimento de juros de
  títulos de renda fixa. (Pendência 20901)
================================================================================
CM$VER      3.04.06.o   12/12/2005
--------------------------------------------------------------------------------
- Ajuste na atualização do saldo a integralizar de cotas de fundos de
  investimentos
================================================================================
CM$VER      3.04.06.n   09/12/2005
--------------------------------------------------------------------------------
- Implementação da funcionalidade de Contrato de Ações.
- Ajuste no lay-out do relatório Mapa de Custo (Renda Variável).
- Ajuste na organização do Menu principal do sistema por ordem de prioridade de
  uso.
================================================================================
CM$VER      3.04.06.m   07/12/2005
--------------------------------------------------------------------------------
- Melhora na performance e nos filtros das queries do relatório de Anúncio de
  proventos em Aberto
================================================================================
CM$VER      3.04.06.l   07/12/2005
--------------------------------------------------------------------------------
- Alteração no título da tela de "Dividendos/Juros/Multa" para "Recebimentos"
- Ajuste na crítica de saldo de Anúncio a Receber para avisar, mas permitir
  ajustes de valores a receber maiores do que o anúncio (um centavo).
- Retirada da chamada de menu para as telas antigas de direito.
================================================================================
CM$VER      3.04.06.k   06/12/2005
--------------------------------------------------------------------------------
- Ajuste para permitir lançamento futuro de amortização de cotas
- Ajuste no controle de abertura de query´s de movimentação com implementação
  de botão de Ok para abertura.
================================================================================
CM$VER      3.04.06.J   05/12/2005
--------------------------------------------------------------------------------
- Ajusta a gravação do Plano / Patrocinadora do financeiro de recebimento de
  fluxo de títulos de renda fixa.
================================================================================
CM$VER      3.04.06.i   02/12/2005
--------------------------------------------------------------------------------
- Ajuste nas rotinas de saldos para captar corretamente os saldos liberados e
  bloqueados na custódia.
================================================================================
CM$VER      3.04.06.h   30/11/2005
--------------------------------------------------------------------------------
- Implementação na tela de lançamento de Incorporação e Alteração de Tipo para
  selecionar investimento sem cotação no período, passando a captar o peso do
  lote do cadastro de ações por bolsa
================================================================================
CM$VER      3.04.06.g   29/11/2005
--------------------------------------------------------------------------------
- Implementação na tela de lançamento de Incorporação e Alteração de Tipo para
  permitir efetuar incorporação em investimento destino de outro emissor
================================================================================
CM$VER      3.04.06.f   28/11/2005
--------------------------------------------------------------------------------
- Acerto no lançamento e reprocessamento de operações de desdobramento para não
  calcular um valor financeiro.
- Implementação no reprocessamento de títulos de renda fixa para excluir
  eventuais atualizações duplicadas.
================================================================================
CM$VER      3.04.06.e   25/11/2005
--------------------------------------------------------------------------------
- Melhorias na tela de Cadastro de Emissores
- Ajuste no relatório e na rotina de atualização de Saldos a Integralizar de
  Fundos
- Melhoria na nova tela de cadastro de eventos por carteira. Criação de botão de
  Procurar e Filtrar
================================================================================
CM$VER      3.04.06.d   23/11/2005
--------------------------------------------------------------------------------
- Ajuste no relatório de Saldos de Renda Fixa para exibir posição de todos os
  títulos nos fins de semana.
- Ajuste no relatório Mapa de Movimentação de Fundos para melhora de performance
================================================================================
CM$VER      3.04.06.c   23/11/2005
--------------------------------------------------------------------------------
- Nova tela de cadastro de Eventos Caixa/Cota
- Ajuste na transferência da variação das operações de Incorporação e Alteração
  de Tipo
- Ajuste no Mapa de Variação de Renda Variável para mostrar investimentos que
  deixem de existir na carteira, durante o período do relatório.
- Implementação de método para exclusão de atualização dobrada, exceto para
  investimentos de cotação de renda fixa que tenham operações no dia
================================================================================
CM$VER      3.04.06.b   18/11/2005
--------------------------------------------------------------------------------
- Ajustes no cadastro de Amortização de Cotas de Fundos
- Implementação de Integralização de Cotas
- Acerto na tela de Ajuste de Certificado
- Acerto no lay out do relatório de IR no Período
- Acerto no Mapa de Movimentação de Fundos de Investimento para exibir os fundos
  que foram zerados durante o período
================================================================================
CM$VER      3.04.06.a   16/11/2005
--------------------------------------------------------------------------------
- Ajuste na tela de resgate de títulos para resgate no dia do pagamento de juros
- Implementação de Amortização a Receber no relatório de movimentação dos fundos
- Implementação da tela de bloqueio de cotas de fundos
- Implementação da consulta da quantidade bloqueada na tela de lançamento de
  fundos
- Implementação do Tipo de Operação 'Amortização à Receber'
- Implementação da nova tela de 'Carteira X Evento' - Melhoria de lay-Out
================================================================================
CM$VER      3.04.05.Z   11/11/2005
--------------------------------------------------------------------------------
- Implementação da nova tela para marcar ou desmarcar um ou mais investimentos
  para reprocessamento no Renda Variável.
- Implementação da alteração de subscrição e do fluxo separadamente
  (fundos de investimento).
================================================================================
CM$VER      3.04.05.y   10/11/2005
--------------------------------------------------------------------------------
- Ajuste na consulta das carteiras gerenciais - Valores a Pagar e a Receber,
  para recebimentos cancelados no dia.
================================================================================
CM$VER      3.04.05.x   09/11/200
--------------------------------------------------------------------------------
- Ajuste nas rotinas de resgate de títulos de renda fixa para resgate no mesmo
  dia de um pagamento de juros.
================================================================================
CM$VER      3.04.05.v   08/11/200
--------------------------------------------------------------------------------
- Ajuste na duplicação de cadastro de recebimento fracionado.
- Implementação da tela de cadastro de mercados.
================================================================================
CM$VER      3.04.05.u   04/11/200
--------------------------------------------------------------------------------
- Ajuste na crítica de PU da tela de recebimento fracionado
- Ajuste na exclusão da cústódia na tela de subscrição
- Ajuste na exclusão de custódia e implementação do campo percentual nas telas
  de Bonificação e Permuta
================================================================================
CM$VER      3.04.05.t   04/11/200
--------------------------------------------------------------------------------
- Ajuste na coluna Variação do relatório Mapa de Movimentação de Renda Variável
================================================================================
CM$VER      3.04.05.s   03/11/200
--------------------------------------------------------------------------------
- Ajuste no relatório Mapa de Movimentação de Renda Variável (Venda de Papel com
  cotação zero)
================================================================================
CM$VER      3.04.05.r   03/11/200
--------------------------------------------------------------------------------
- Ajuste na impressão do relatório Anúncio de Proventos em Aberto
- Retirada a crítica de evento Caixa/Cota para subscrição com ações
================================================================================
CM$VER      3.04.05.q   03/11/200
--------------------------------------------------------------------------------
- Implementação da funcionalidade Subscrição com Ações (Liberação para Produção)
================================================================================
CM$VER      3.04.05.p   01/11/200
--------------------------------------------------------------------------------
- Implementado o filtro por tipo de investimento Renda Variável na tela de
  consulta de Anúncio de Proventos em Aberto.
- Implementação de Subscrição com Ações
================================================================================
CM$VER      3.04.05.n   31/10/200
--------------------------------------------------------------------------------
- Retirada das últimas implementações de Amortização de Cotas de Fundos
- Implementada na tela de recebimentos a Crítica de Percentual pelo parâmetro
  do tipo de operação
================================================================================
CM$VER      3.04.05.m   28/10/200
--------------------------------------------------------------------------------
- Ajuste na tela de Transferencia de Carteira para mostrar o saldo CCI e Normal
- Compilação no Padrão CM 5.10.07
================================================================================
CM$VER      3.04.05.l   27/10/200
--------------------------------------------------------------------------------
- Ajuste na Transferência retroativa de carteira para empréstimo de ações
- Ajuste no reprocessamento de integralização de cotas dos fundos de
  investimentos
================================================================================
CM$VER      3.04.05.k   26/10/200
--------------------------------------------------------------------------------
- Ajuste no Relatório de Mapa de Fundos de Investimentos - Acerto na busca da
  posição atual por data movimentada
================================================================================
CM$VER      3.04.05.j   26/10/200
--------------------------------------------------------------------------------
- Ajuste na transferencia de carteira para reversão de empréstimo
- Implementação de Cisão e Amortização de Cotas a Receber
================================================================================
CM$VER      3.04.05.i   24/10/200
--------------------------------------------------------------------------------
- Ajuste no relatório de Resumo das Operações Realizadas para mostrar IR,
  despesas e remunerações, ajuste no lay-out do relatório;
- Ajuste no filtro por Data EX do relatório Anúncio de Proventos em Aberto;
- Ajuste no relatório Mapa de Movimentação para não mostrar Recebimento
  Fracionado;
================================================================================
CM$VER      3.04.05.h   21/10/200
--------------------------------------------------------------------------------
- Implementação de tratamento para a operação de Amortização à Receber no
  relatório Mapa de Movimentação de Fundos e consulta de Movimentação de Fundos;
- Implementação da coluna Amortização a Receber no relatório Mapa de
  Movimentação de Fundos e consulta de Movimentação de Fundos;
================================================================================
CM$VER      3.04.05.g   20/10/200
--------------------------------------------------------------------------------
- Ajuste na geração de operação de direito de subscrição para não calcular valor
  de operação
================================================================================
CM$VER      3.04.05.f   20/10/200
--------------------------------------------------------------------------------
- Ajuste no relatório de Proventos a Receber para recebimento parcial
- Ajuste na tela de cadastramento de cotações de ações
- Ajuste na verificação de operações de direito subscrição lançadas no mesmo dia
- Ajuste no procurar para retirar os fundos FDIC na tela de cotas de fundos
- Implementado os totalizadores por operação na tela de movimentação de
  fundos e no relatório.
- Implementado um totalizador geral na tela de saldo de quantidades a
  integralizar e no relatório
================================================================================
CM$VER      3.04.05.e   20/10/20
--------------------------------------------------------------------------------
- Ajuste no relatório de Proventos a Receber para recebimento parcial
- Ajuste na tela de cadastramento de cotações de ações
================================================================================
CM$VER      3.04.05.d   19/10/20
--------------------------------------------------------------------------------
- Ajuste no processamento das provisões de perda
- Ajuste no relatório Mapa de Posição de Renda Variável
- Ajuste no arredondamento do PU de Operação do form de Restituição de Capital
================================================================================
CM$VER      3.04.05.c   19/10/20
--------------------------------------------------------------------------------
- Implementação da funcionalidade de recebimentos fracionados de direitos
================================================================================
CM$VER      3.04.05.b   18/10/20
--------------------------------------------------------------------------------
- Ajuste no rateio das carteiras gerenciais do recebimento de direitos
- Ajuste no controle dos saldos bloqueados da bonificação
================================================================================
CM$VER      3.04.05.a   17/10/20
--------------------------------------------------------------------------------
- Ajuste no reprocessamento de Bonificação
- Ajuste no relatório 'Exercício de Direitos'
================================================================================
CM$VER      3.04.04.z   13/10/20
--------------------------------------------------------------------------------
- Implementação de nova tela de Reorganização Societária (Direitos)
- Ajuste no lay-out da tela de Recebimento de Dividendo para Fundos
- Ajustes na tela de Recebimento de Dividendos - Implementação de Bloqueio de
  Ações
- Ajuste nos relatórios de Anúncio - Implementação de Bloqueio de Ações
- Ajuste no relatório Resumo das Operações Realizadas
================================================================================
CM$VER      3.04.04.y   11/10/20
--------------------------------------------------------------------------------
- Ajustes no Mapa de Movimentação de RF
- Ajuste no Recebimento de Fluxo para vizualizar todos os plano/patro
- Ajustes nas rotinas de IOF e no Mapa de IOF
================================================================================
CM$VER      3.04.04.x   07/10/20
--------------------------------------------------------------------------------
- Implementação da label de diferença no Mapa de Movimento de RF
- Ajuste no cadastramento de fluxo retroativo de RF
- Segregação da tela de Permuta
- Implementação do campo de observação
================================================================================
CM$VER      3.04.04.v   05/10/20
--------------------------------------------------------------------------------
- Ajuste no rateio gerencial dos anúncios de recebimento
- Ajuste nos saldos iniciais e finais e na variação do Mapa de Movimentação de RF
- Ajuste na atualização da custodia nas rotinas de direito de grupamento
================================================================================
CM$VER      3.04.04.u   05/10/20
--------------------------------------------------------------------------------
- Ajuste na edição a quantidade de anúncio de proventos
- Ajuste no lay out do Mapa de Movimentação
- Implementado o identificador para os ajustes de custo e quantidade no Mapa de
  Custo
================================================================================
CM$VER      3.04.04.t   03/10/20
--------------------------------------------------------------------------------
- Ajuste na rotina de verificação de títulos repactuados durante a abertura do
  modulo de títulos de renda fixa
- Ajuste na data inicial do mapa de movimentação
- Implementação da Observação na tela de ajuste de quantidade
- Implementação da Observação na tela de ajuste de custo
- Ajuste para reutilização de planilha no reprocessamento de amortização
- Ajuste no Mapa de Movimentação de RF para imprimir no fim de semana
- Melhora na performance do novo mapa de movimentação de RF
================================================================================
CM$VER      3.04.04.s   30/09/20
--------------------------------------------------------------------------------
- Acerto no Reprocessamento de Amortização de Fundos que estava duplicando lança-
  mentos no Financeiro;
- Acerto no cálculo de Custo e Variação na Operação de Acerto de Quantidade de
  Renda Variável;
================================================================================
CM$VER      3.04.04.r   29/09/20
--------------------------------------------------------------------------------
- Acerto no Reprocessamento de Boletas com compra e venda de Ações;
- Acerto na crítica de fechamento contábil para Fundo de Dto Creditório;
- Acerto no Mapa de Movimentação para tratar operações de permuta;
- Acerto em relatórios de Dividendos
================================================================================
CM$VER      3.04.04.q   28/09/20
--------------------------------------------------------------------------------
- Acerto no na funcionalidade de Grupamento;
- Acerto na Consulta de Carteira Gerencial para Parcelamento de Anúncios;
- Melhorias na funcionalidade de Parcelamento de Recebimento de Dividendos;
================================================================================
CM$VER      3.04.04.p   27/09/20
--------------------------------------------------------------------------------
- Acerto no reprocessamento de Grupamentos de Ações de R.Variável;
- Implementação de tratamento para Cancelamento de Anúncios de Proventos na Consulta
  de Carteira Gerencial;
================================================================================
CM$VER      3.04.04.o   27/09/20
--------------------------------------------------------------------------------
- Acerto no menu de Fundos de Investimentos para liberação da Consulta da Carteira
  de Fundos;
================================================================================
CM$VER      3.04.04.n   23/09/20
--------------------------------------------------------------------------------
- Melhoria na Consulta de Saldo para tratamento de Provisão de Perda;
- Acerto na contabilização de Amortização de Fundos de Direito Creditório;
================================================================================
CM$VER      3.04.04.m   22/09/20
--------------------------------------------------------------------------------
- Implementado da transferência de 100% do custo e variação da ação origem para
  a destino;
- Acerto na contabilização de Amortização de Fundos;
- Acerto na contabilização de Permuta de Ações;
================================================================================
CM$VER      3.04.04.l   19/09/20
--------------------------------------------------------------------------------
- Implementado da funcionalidade de Cancelamento de Anúncio de Dividendos;
- Acerto no relatório Mapa de Movimentação de Renda Variável;
================================================================================
CM$VER      3.04.04.k   16/09/20
--------------------------------------------------------------------------------
- Implementado da coluna de Restituição de Capital e mudança do lay-out do Relatório
  Mapa de Movimentação de Renda Variável;
- Acerto na rotina de cálculo do caixa da Carteira Gerencial para não lançar
  Anúncios de Proventos;
================================================================================
CM$VER      3.04.04.j   15/09/20
--------------------------------------------------------------------------------
- Implementação de tratamento para Restituição de Capital no relatório Mapa de
  Movimentação de Renda Variável;
- Implementação de contabilização de Custo e Variação para operações de Permuta
  de Ações;
================================================================================
CM$VER      3.04.04.i   13/09/20
--------------------------------------------------------------------------------
- Travamento da data de último fechamento no cadastro de Tipo de Fundo de Inves-
  timentos;
- Implementação de Rotina para zerar a contabilização de Boletas de Renda Variável
  quando existem compra e venda na mesma boleta;
- Implementação de Relatório Mapa de IOF;
- Implementação de Cálculo de IOF após Repactuação de Títulos;
================================================================================
CM$VER      3.04.04.h   09/09/20
--------------------------------------------------------------------------------
- Ajustes na rotina de Repactuação de Títulos de Renda Fixa;
================================================================================
CM$VER      3.04.04.g   08/09/20
--------------------------------------------------------------------------------
- Acerto na Inicialização da data de controle de reprocessamento da Importação de
  Cotas de Fundos de Investimentos;
- Acerto no calculo da variação de Fundos Imobiliário;
- Acerto na Baixa de Custo na Origem para operação de Permuta;
- Melhoria na critica de datas para reprocessamento de Renda Fixa com Repactuação
  de Títulos;
================================================================================
CM$VER      3.04.04.f   06/09/20
--------------------------------------------------------------------------------
- Acerto no relatório de Mapa de Movimentação de Fundos Imobiliários;
- Ajuste no relatório de Saldo de Fundos para emissão de Fundo FDIC (Tipo de Cota)
- Criado o Botão e Menu para impressão do relatório de saldo de FDIC
- Ajuste no Fechamento de Fundos para seleção de Tipo de Fundo;
================================================================================
CM$VER      3.04.04.e   05/09/20
--------------------------------------------------------------------------------
- Acerto no PU de Custo do relatório Mapa de Custo para retiranda da crítica de
  Subscrições;
- Implementação de Campo Data de Vigência na qry de entrada do Regra para o Sis-
  tema de Renda Fixa;
- Implementação da trava de reprocessamento para títulos repactuados
================================================================================
CM$VER      3.04.04.d   02/09/20
--------------------------------------------------------------------------------
- Acerto na crítica de papel origem e destino já cadastrado no Cadastramento
  de Bonificações e Desdobramento;
- Melhoria no Mapa de custo de Renda Variável;
- Melhoria nos Mapas de Movimentação de Fundos de Investimentos;
- Melhoria na funcionalidade de Empréstimos de Ações;
================================================================================
CM$VER      3.04.04.c   01/09/20
--------------------------------------------------------------------------------
- Melhorias de Fundos de Investimentos
- Implementação de Carga de Dados para a funcionalidade de Repactuação
  de vencimento de títulos de Renda Fixa
================================================================================
CM$VER      3.04.04.b   01/09/20
--------------------------------------------------------------------------------
- Acerto na no relatório Mapa de Posição e Custo de Renda Variável;
- Melhoria no processo de lançamentos de Direitos de Subscriçaõ
================================================================================
CM$VER      3.04.04.a   25/08/20
--------------------------------------------------------------------------------
- Acerto na Exclusão de Perfil de Investimentos para não permitir ficar sem Perfil
  o Investimento que tiver operações cadastradas;
================================================================================
CM$VER      3.04.03.z   24/08/20
--------------------------------------------------------------------------------
- Acerto na Integração Contábil Financeira para Atualização do tipo de desenbolso
  conforme o tipo de lançamento
- Melhorias na funcionalidade de Alteração de Tipo (Custo)
================================================================================
CM$VER      3.04.03.y   22/08/20
--------------------------------------------------------------------------------
- Implementação da Funcionalidade de Repacutação de Vencimento de Títulos de
  Renda Fixa
================================================================================
CM$VER      3.04.03.x   17/08/20
--------------------------------------------------------------------------------
- Acerto na rotina de Resgate Bruto de Renda Fixa que estava apurando incorreta-
  mente o valor Líquido da Operação e causando erro de Contabilização;
================================================================================
CM$VER      3.04.03.v   16/08/20
--------------------------------------------------------------------------------
- Melhorias nos relatórios Mapa de Custo de Renda Variável, Mapa de Posição de
  Renda Variável;
================================================================================
CM$VER      3.04.03.u   12/08/20
--------------------------------------------------------------------------------
- Acerto no cadastro de Bonificação
================================================================================
CM$VER      3.04.03.t   11/08/20
--------------------------------------------------------------------------------
- Melhorias nos relatórios Mapa de Custo de Renda Variável, Mapa de Posição de
  Renda Variável e Mapa de Movimentacao de Fundos de Renda Fixa;
================================================================================
CM$VER      3.04.03.s   08/08/20
--------------------------------------------------------------------------------
- Implementação do relatório Mapa de Custo de Renda Variável;
- Implementação do relatório Mapa de Posição de Renda Variável;
================================================================================
CM$VER      3.04.03.r   05/08/20
--------------------------------------------------------------------------------
- Acerto no relatório Mapa de Movimentação de Fundos de Investimentos que não
  estava tratando corretamente a data anterior quando feriado;
- Compilação com padrão 5.10.06;
================================================================================
CM$VER      3.04.03.p   03/08/20
--------------------------------------------------------------------------------
- Acerto no relatório Mapa de Movimentação de R.Variável para trazer corretamente
  o dia anterior;
- Acerto no cálculo da Disponibilidade item 1.10
================================================================================
CM$VER      3.04.03.o   02/08/20
--------------------------------------------------------------------------------
- Acerto na rotina de Reprocessamento de resgates totais de Poupança;
================================================================================
CM$VER      3.04.03.n   02/08/20
--------------------------------------------------------------------------------
- Acerto na rotina de Reprocessamento de resgates totais de Poupança;
- Acerto no cálculo de variação de Fundos de Investimentos após registro de Aplicação
================================================================================
CM$VER      3.04.03.m   01/08/20
--------------------------------------------------------------------------------
- Implementação Subscrição de Cotas para Fundos Fechados;
================================================================================
CM$VER      3.04.03.l   29/07/20
--------------------------------------------------------------------------------
- Acerto no reprocessamento de Resgates de Poupança
- Acerto no cadastramento de Fluxo de Títulos de Renda Fixa
================================================================================
CM$VER      3.04.03.k   28/07/20
--------------------------------------------------------------------------------
- Melhorias na Consulta e Relatório de Mapa de Movimentação de Renda Variável
- Acerto no processamento de Importação de Cotações pelo Excell
================================================================================
CM$VER      3.04.03.j   28/07/20
--------------------------------------------------------------------------------
- Implementação da Consulta e Relatório de Mapa de Movimentação de Renda Variável
================================================================================
CM$VER      3.04.03.i   27/07/20
--------------------------------------------------------------------------------
- Acerto no reprocessamentos de Renda Variável
================================================================================
CM$VER      3.04.03.h   26/07/20
--------------------------------------------------------------------------------
- Acerto na Gravação de Custodia que estava triplicando as informações e ocasionado
  divergência para carteira gerencial
================================================================================
CM$VER      3.04.03.g   25/07/20
--------------------------------------------------------------------------------
- Acerto na buscar de Investimento de Destino no Vencimento de Subscrição
================================================================================
CM$VER      3.04.03.f   22/07/20
--------------------------------------------------------------------------------
- Acerto para no grupamento ajustar a quantidade CPMF para as Cart. Gerenciais.
================================================================================
CM$VER      3.04.03.e   21/07/20
--------------------------------------------------------------------------------
- Acerto no Mapa de Movimentação de Renda Fixa (juros e correção) de Poupança;
- Melhorias no Mapa de Movimentação de Fundos de Investimentos em Ações;
- Melhorias no Extrato de Investimentos de Renda Variável;
- Acerto na Subscrição para buscar os investimentos com cotação zeradas
================================================================================
CM$VER      3.04.03.d   19/07/20
--------------------------------------------------------------------------------
- Acerto na rotina de Apropriação de Juros e Correçao no Aniversário (Mensal)
  onde a verificação do OR não estava fechada para o teste do ItemRenfix
================================================================================
CM$VER      3.04.03.c   15/07/20
--------------------------------------------------------------------------------
- Ajuste no reprocessamento da operação de Desdobramento;
================================================================================
CM$VER      3.04.03.b   14/07/20
--------------------------------------------------------------------------------
- Ajuste no reprocessamento da operação de Subscrição, Direito de Subscrição e
  Vencimento de Subscrição;
- Implementação de Custo e Variação no Relatório de Extratos de Investimento de RV
================================================================================
CM$VER      3.04.03.a   13/07/20
--------------------------------------------------------------------------------
- Acerto no lay-out da totalização da Consulta de Movimentação de Fundos de
  Investiementos;
- Implementação de Despesas e Lucro/Prejuízo no Relatório de Extratos de Investimento
  de RV;
- Acerto no Reprocessamento de Subscrição e Vencimento de Subscrição
================================================================================
CM$VER      3.04.02.z   12/07/20
--------------------------------------------------------------------------------
- Acerto na Consulta de Movimentação de Fundos de Investiementos;
================================================================================
CM$VER      3.04.02.y   12/07/20
--------------------------------------------------------------------------------
- Implementação do Tipo de Fundo no lançamento de Amortizações para Fundos de Ações e FIP
- Retirada da coluna de Variação da Consulta de Saldos
================================================================================
CM$VER      3.04.02.x   11/07/20
--------------------------------------------------------------------------------
- Retirado a operação de Subscrição do Relatório de Exercício de Direitos
- Tratamento para Saldo Líquido de IOF no Relatório Mapa de Movimentação de Fundos de Investimentos
================================================================================
CM$VER      3.04.02.v   11/07/20
--------------------------------------------------------------------------------
- Acerto na atualização mensal de poupança que não estava gerando Correção Monetária quando o aniversário cai em dia não útil
================================================================================
CM$VER      3.04.02.u   07/07/20
--------------------------------------------------------------------------------
- Acerto na funcionalidade de alteração de Tipo que estava trazendo somente da Carteira Gerencial
================================================================================
CM$VER      3.04.02.t   06/07/20
--------------------------------------------------------------------------------
- Acerto no cálculo da Disponibilidade Financeira;
- Melhorias na rotina de Grupamento de Renda Variável;
- Melhorias na rotina de Permuta de Renda Variável;
- Implementação do Novo Cadastro de Bonificação
================================================================================
CM$VER      3.04.02.s   30/06/20
--------------------------------------------------------------------------------
- Implementação de Somatório das Colunas do relatório de Mapa de Movimentação de
  Fundos de Investimentos;
- Melhorias no relatório de Anúncios de Direitos no Período;
- Acerto no relatório de Saldos de Fundos de Investimento;
- Acerto na exclusão de Operações de Amortização de Fundos;
================================================================================
CM$VER      3.04.02.r   29/06/20
--------------------------------------------------------------------------------
- Acerto no Relatório de Saldos de Fundos de Investimentos e Anúncios de Direitos
  por Período;
- Acerto na verificação de Atualização diária ou Mensal para Poupanças
================================================================================
CM$VER      3.04.02.q   28/06/20
--------------------------------------------------------------------------------
- Acerto ao testar o período contábil bloqueado no Reprocessamento de Renda FIxa
- Acerto na apuração de Patrimônio de Carteira Gerencial
================================================================================
CM$VER      3.04.02.p   27/06/20
--------------------------------------------------------------------------------
- Implementação de Contabilização do IOF;
- Implementação de Atualização mensal de Poupança
- Acerto no tratamento de busca da posição de destino da operação de Direito de
  Subscrição que não estava aparecedo pra a efetuar a operação;
- Acerto na rotina de deleção de Cotas Intregralizar de Fundos de FDC que não
  estava efetivando a deleção do registro de operação.
- Acerto no Cadastro de Parâmetros contábeis de Fundos de Investimentos que estava
  apresentando duplicidade com os tipos de fundos
================================================================================
CM$VER      3.04.02.o   22/06/20
--------------------------------------------------------------------------------
- Implentação de tratamento con
- Implentação de tratamento contábil para Fundos de Invetimentos em Participações
  na Integração Contábil;
================================================================================
CM$VER      3.04.02.n   21/06/20
--------------------------------------------------------------------------------
- Implentação para pegar saldo zerado ou cotação menor que 0,000000001 no módulo
  de Renda Variável
================================================================================
CM$VER      3.04.02.m   16/06/20
--------------------------------------------------------------------------------
- Acerto no relatório Mapa de Movimentação de Fundos de Investimento
================================================================================
CM$VER      3.04.02.l   13/06/20
--------------------------------------------------------------------------------
-
================================================================================
CM$VER      3.04.02.k   10/06/20
--------------------------------------------------------------------------------
- Implementação de Trava no contábil por período
================================================================================
CM$VER      3.04.02.j   06/06/20
--------------------------------------------------------------------------------
- Acerto na ordenação de datas do cadastro de Cotas a Integralizar
- Acerto na Funcionalidade de Amortização de Cotas
- Melhoria no relatório de Carteira Gerencial
================================================================================
CM$VER      3.04.02.i   03/06/20
--------------------------------------------------------------------------------
- Melhorias no Anúncio de Subscrição e Incorporação de Fundos
================================================================================
CM$VER      3.04.02.h   02/06/20
--------------------------------------------------------------------------------
- Melhorias na funcionalidade de Fundos de Invetimentos
================================================================================
CM$VER      3.04.02.g   01/06/20
--------------------------------------------------------------------------------
- Acerto no relatório de Mapa de Movimentação de Renda Fixa
- Acerto no tratamento de mudança de menu quando Fundo de Direito Creditório
- Melhoria na funcionalidade de Amortização de Cotas de Fundos de Investimentos
================================================================================
CM$VER      3.04.02.f   31/05/20
--------------------------------------------------------------------------------
- Implementação da flag de conta de investimento, no momento da integralização;
- Implementação da busca de venda de ações CCI, separada da normal para ter
  saldos independentes e Implementação do "Valor" zerado para o evento
  "SALDO ANTERIOR" para Carteiras Gerenciais;
- Melhorias no relatório Mapa de Movimentação em Fundos de Investimentos;
- Implementação de Rentabilidade Mensal na Consulta/Relatório de Saldos de Renda
  Fixa;
- Melhorias na funcionalidade de Fundos de Direito Creditório e Amortização de
  Cotas de Fundos de Investimentos
================================================================================
CM$VER      3.04.02.e   26/05/20
--------------------------------------------------------------------------------
- Melhorias do relatório Mapa de Movimentação em Renda Fixa
================================================================================
CM$VER      3.04.02.d   24/05/20
--------------------------------------------------------------------------------
- Acerto no cálculo de poupanças após resgate parciais no mesmo dia;
- Acertos em Restituição de Capital
  - Implementada a rotina que marca a boleta para deleção e tratado a
  - Alteração da data para criar uma nova boleta
  - A data da operação é a DATACOM(data prevista do cadastro da AGE)
  - Habilitado o botão Confirma, qdo e efetuado a exclusão de todos os recebimentos
  - Testa se o idforcli e null, ocorre geralmente para Cart. Gerencial.
  - Implementação da QryHistCustodia para a exclusão individual, antes ocorria
    o erro no confirma onde ocorre o applyupdate na OPERACAOINVEST
- Acerto no Cadatro de AGE
================================================================================
CM$VER      3.04.02.c   20/05/20
--------------------------------------------------------------------------------
- Implementação do Teste de Período Contábil por Módulo e por Período conforme
  definido no Módulo de Contabilidade (3 camadas)
================================================================================
CM$VER      3.04.02.b   19/05/20
--------------------------------------------------------------------------------
- Implementação para o cancelamento de uma operação de Fundos de Investimentos
- Implementação da gravação no caixa qdo a subscrição para a Gerencial
================================================================================
CM$VER      3.04.02.a   18/05/20
--------------------------------------------------------------------------------
- Melhorias no Relatório : Mapa de Movimentação em Fundos de Investimento
- Melhorias no Relatório : Mapa de Movimentação em Renda Fixa
================================================================================
CM$VER      3.04.01.z   17/05/20
--------------------------------------------------------------------------------
- Implementação do campo FLGPOUPAPROPDIA no Parâmetro para tratamento de atuali-
  zação de Poupanças Mensalmente;
- Acerto no Anuncio de Subscrição;
- Acerto no processamento de Carteira Gerencial;
- Arredondamento do PU de custo com 08 decimais no relatório de Posição da Cartei-
  ra de Renda Variável;
================================================================================
CM$VER      3.04.01.y   12/05/20
--------------------------------------------------------------------------------
- Acerto no Mapa de Investimentos em Renda Fixa que não estava trazendo correta-
  mente os Resgates em função de não estar trazendo o Lucro/Prejuízo.
- Ajuste no reprocessamento de Anúncio e Recebimento de direito
================================================================================
CM$VER      3.04.01.x   10/05/20
--------------------------------------------------------------------------------
- Implementação do relatório Mapa de Investimentos em FUndos
- Inclusão do campo PU de Custo na Consulta Posição de Renda Variável
- Incluido a udiasuteis e alterado para utilizar na funcionalidade de CPMF
================================================================================
CM$VER      3.04.01.v   09/05/20
--------------------------------------------------------------------------------
- Acerto no Relatório de Carteira Gerencial
================================================================================
CM$VER      3.04.01.u   09/05/20
--------------------------------------------------------------------------------
-
================================================================================
CM$VER      3.04.01.t   09/05/20
--------------------------------------------------------------------------------
-
================================================================================
CM$VER      3.04.01.s   06/05/20
--------------------------------------------------------------------------------
- Acerto na funcionalidade de Alteração de Tipo e Anúncio de Proventos
================================================================================
CM$VER      3.04.01.r   05/05/20
--------------------------------------------------------------------------------
- Acerto no Cadastro de Dividendos / Anuncio de Age / Cadastro de Age
================================================================================
CM$VER      3.04.01.q   04/05/20
--------------------------------------------------------------------------------
- Acerto na passagem de data da AGE no Cadastro de Dividendos
- Acerto na contabilização de Custo de Operações de Compra de Renda Variável
- Implementação do PUORIG para as AGE que tiverem o seu PU alterado no momento do
  recebimento ;
- Implementação da DATAOPERACAO para a busca do anúncio
- Ajuste na consulta da query QryOrigemDivJur para buscar especificamente os anúncios
  e o PU original da operação;
- Busca o anúncio original para contabilização por diferença
- Alterado para buscar o anuncio original e verificar se a diferença a
  contabilizar
================================================================================
CM$VER      3.04.01.p   03/05/20
--------------------------------------------------------------------------------
- Melhorias nas rotinas de Restituição de Capital do Módulo de Renda Variável.
- Acerto na gravação do Histórico de Operações de Fundos de Investimentos na
  Contabilidade e Financeiro.
- Acerto no relatório de Lancamentos Contábeis de Renda Variável que estáva
  trazendo registros de Carteira Gerencial
================================================================================
CM$VER      3.04.01.o   02/05/20
--------------------------------------------------------------------------------
- Melhorias nas rotinas de Direitos de Renda Variável
================================================================================
CM$VER      3.04.01.l   29/04/20
--------------------------------------------------------------------------------
- Acertos no Ajuste da busca dos Anuncios em aberto
- Implementação do form de Cadastro de Restituição de Capital
================================================================================
CM$VER      3.04.01.k   28/04/20
--------------------------------------------------------------------------------
- Acerto nas rotinas de Anúncio de Proventos e Reprocessamento destes com
  efeito nas Carteira Gerenciais.
- Acerto na gravação do histórico contábil de operações de Fundos de Investmentos
================================================================================
CM$VER      3.04.01.j   25/04/20
--------------------------------------------------------------------------------
- Acerto no relatório Mapa de Investimentos de Renda Fixa que apresentava erro
  no item de Lucro/Prejuizo e Aplicações vencidas dentro do período solicitado.
- Acerto na rotinca de cálculo de Custo de Renda Variável.
- Acerto na rotina RefazOperações para regerar o contábil das operações no
  Reprocessamento de Renda Fixa.
================================================================================
CM$VER      3.04.01.i   22/04/20
--------------------------------------------------------------------------------
- Acerto na rotina de fechamento de Renda Fixa
================================================================================
CM$VER      3.04.01.h   19/04/20
--------------------------------------------------------------------------------
- Alteração da rotina de contabilização de custo de Compra de Renda Variável
- Ajuste na consulta da AnÚncio de Proventos
================================================================================
CM$VER      3.04.01.g   19/04/20
--------------------------------------------------------------------------------
- Alteração da Mensagem de Divergência de Saldo no lançamento de AGE;
- Acerto na Consulta de Saldos de Renda Fixa para trazer corretamente as Cartei-
  ras da SPC;
- Alteração do cálculo do custo na Venda de Ações (Renda Variável) onde as despe-
  sas não podem afetar o mesmo.
================================================================================
CM$VER      3.04.01.f   18/04/20
--------------------------------------------------------------------------------
- Ajuste na consulta da query qryAnuncioProv
- Acerto no valor contábil de Poupança
================================================================================
CM$VER      3.04.01.e   18/04/20
--------------------------------------------------------------------------------
- Acerto na rotina de Reprocessamento de Vencimento de Subscrições
- Acerto na rotina de Reprocessamento de Vencimento de Subscrições
================================================================================
CM$VER      3.04.01.d   15/04/20
--------------------------------------------------------------------------------
- Acerto na rotina de verificação de recebimento parcial.
================================================================================
CM$VER      3.04.01.c   14/04/20
--------------------------------------------------------------------------------
- Acerto no tratamento contábil de Operações de Renda Fixa qdo não está feita a
  parametrização contábil da operação;
- Unificação de qry da Consulta de Carteira Gerencial
- Acerto na funcionalidade de Anúncio de Proventos e operações de direitos
================================================================================
CM$VER      3.04.01.b   12/04/20
--------------------------------------------------------------------------------
- Acerto na rotina Reprocessamento de Recebimentos de Fundos de Investimento
  para na regerar contábil e financeiro.
- Acerto na rotina que Busca Investimentos de RFixa para Reprocessamento onde
  passa a buscar datas anteriores ao do último fechamento.
================================================================================
CM$VER      3.04.01.a   11/04/20
--------------------------------------------------------------------------------
- Acerto na rotina de Alteração de Tipo de Renda Variável
- Acerto na crítica de atualização de Renda Variável qdo a cotação é zéro.
================================================================================
CM$VER      3.03.09     18/02/2005
--------------------------------------------------------------------------------
-Ajustes diversos
================================================================================
CM$VER      3.03.08     14/02/2005
--------------------------------------------------------------------------------
- Ajuste no sinal do valor a ser invertido para a devolução de corretagem
bater no rateio das despesas;
- Ajuste na rotina de Atualiza Saldo do módulo de RV para tratamento do Tipo de Operação
no momento do Fechamento Diário - Atualização;
- Ajuste no tipo de operação de Atualização no RV;
- Na Importação de Ordens, foi alterado a rotina de Posicionamento da Boleta para gerar novas,
no caso de operações CCI e Normais na mesma corretora no mesmo dia. E alterado o 
Layout do form;
================================================================================
CM$VER      3.03.07     04/02/2005
--------------------------------------------------------------------------------
- Compatibilização de qry com a Disponibilidade
================================================================================
CM$VER      3.03.06     02/02/2005
--------------------------------------------------------------------------------
- Ajuste na busca do tipo de operação "aplicação", no módulo de Fundos de
Investimentos;
- Ajuste na rotina de gravação da atualização positiva e negativa no 
módulo de Renda Variável;
================================================================================
CM$VER      3.03.05     28/01/2005
--------------------------------------------------------------------------------
- Implementado na Carteira Gerencial a rotina que busca os Anúncios vencidos e não 
recebidos. Principalmente quando ocorrer o reprocessamento da Carteira Gerencial e 
houver o recebimento em uma data superior.
- Ajuste na rotina de reprocessamento dos Fundos de Investimentos para a operação 
de Ajuste de Quantidade. 
================================================================================
CM$VER      3.02.12     18/01/2005
--------------------------------------------------------------------------------
- Implementado no Parâmetro do Sistema o campo de Tolerância para resgate de 
fundo de investimentos;
- Implementado a crítica de tolerância dos Fundos de Investimentos no momento do Resgate
para comparação no saldo;
- Implementado no Fechamento de Renda Variável a identação da rotina de 
vencimento de Subscrições;
- Corrigído o Titulo da coluna "Quantidade Nova Atual"  no relatório de Saldo das 
Quantidades no Renda Variável;
================================================================================
CM$VER      3.02.11     10/01/2005
--------------------------------------------------------------------------------
Implementação do relatório de Consulta dos Lançamentos Contábeis de Fundo de Investimentos.
================================================================================
CM$VER      3.02.10     10/01/2005
--------------------------------------------------------------------------------
Ajuste na tela de Consulta dos Anúncios de Proventos em Abertos :
- Implementação da busca da quantidade;
 Ajuste no Cálculo de Cota da Carteira Gerencial:
- Implementação da exclusão do CMPF gerado no momento da apuração dos valores a receber; 
Ajuste na Disponibilidade :
- Atualização do SQL;
================================================================================
CM$VER      3.02.09     10/01/2005
--------------------------------------------------------------------------------
Ajuste na tela de Resgate Novo do Lançamento de Fundos de Investimentos:
- Implementação da seleção de apenas uma aplicação por resgate;
Ajuste na tela de Cadastro de Operações de Títulos de Renda Fixa :
- Implementação da alteração dos dados da operação de Aplicação ou Resgate;
================================================================================
CM$VER      3.02.08     10/01/2005
--------------------------------------------------------------------------------
Nova
================================================================================
CM$VER      3.01.97     05/10/2004
--------------------------------------------------------------------------------
Implementação do tratamento da CCI e CC,
nos módulos de Renda Fixa e Fundo de Investimentos.
================================================================================
CM$VER      3.01.64     04/12/2003
--------------------------------------------------------------------------------
1)Implementação na Consulta de Posição de Carteiras de Renda Variável para
  posicionar na maior data, conforme a data de referência.
  Fontes Alterados : FConsCartRendVar
2) Otimização da tela de Implantação de Saldo das Carteiras e disponibilização
   da data para digitação.
   Fontes Alterados : FSaldoIniCart
3) Inclusão de rotina de cálculo de LFT para o Renda Fixa antigo.
   Fontes Alterados : UOperacaoInvest, UFuncoesRendaFixa
4) Acerto no Somatório de variação do Mês Anterior e acerto no relatorio
   de Mapa de Variacao Mensal da Carteira
   Fontes Alterados : FParamVarMesCarteira, FDMRelatorios
5) Zera variaveis de Agio/Desagio no renda fixa antigo
   Fontes Alterados : FFechamentoDiario
6) Foi tirado o RpBoletaBMF do DataModule
   Fontes Alterados : FDMRelatorio
7) Criação do relatório de Boletas de BMF
   Fontes Alterados : FDmRelBoletaBMF
8) Passa a filtrar as Regras pelo tipo de investimento
   Fontes Alterados : FCadDespTipoOper
9) Inclusao do DmRelBoletaBMF na função AppPadraoCreateFormReports
   Fontes Alterados : Investimento.dpr
10) Tirei o lixo do final do arquivo Inclusao do DmRelBoletaBMF na função
    AppPadraoCreateFormReports
    Fontes Alterados : FPrincipal
11) Inclusão de novos tipos de operacao
    Fontes Alterados : UHelp
12) Melhoria de performance na qry BuscaCorretValores
    Inclusao do campo de NUMDOCUMENTO  no form
    Fontes Alterados : FFechaBoletaBMF
13) Acerto no form show da dataref para trazer d+1 da data de ultimo fechamento
    Fontes Alterados : FProcOperBMF e FCadOrdemMOvBMF
14) Inclusão do campo IDBOLETA que passa a ser utilizado nos processamento ao invës do NODOCUMENTO
    e inclusao do campo NODOCUMENTO com informado
    Fontes Alterados : fCadExcluiBoletaBMF
15) Acerto no form show da dataref para trazer d+1 da data de ultimo fechamento
    Acerto na qry que busca as despesas para deleção.
    Inclusao dos Campos IDLOTE E NUMDOCUMENTO no MontaSelect
16) Implementação do tipo de operação no caso Direitos na busca do Saldo da Carteira
    Fontes Alterados : DOperComum e UOperComum
17) Implementação da inversão de recebimento e pagamento no Fechamento de Boleta
    Fontes Alterados : FFechaBoleta
18) Alteração nas Rotinas de BM&F
    Fontes Alterados : FFechaBoletaBMF, FDmRelBoletaBMF
19) Ajustes nas queries
    Fontes Alterados : dOpcaoIndice
20) Melhora no Lay Out do gráfico
    Fontes Alterados : FDmRelGrafOpcInd
21) Ajuste nos cálculos
    Fontes Alterados : FFechaBoletaOpcInd
22) Ajuste no LayOut
    Fontes Alterados : FFechtoRenVar
23) Ajuste no LayOut do gráfico
    Fontes Alterados : FGrafOpcInd
24) Novo form de reprocessamento de Opções
    Fontes Alterados : FReprocOpcInd
25) Novas rotinas de reprocessamento por investimento
    Fontes Alterados : uOpcaoIndice
26) Habilitação provisória dos menus ainda não atualizados no SADS
    Fontes Alterados : FPrincipal
================================================================================
CM$ALT}
