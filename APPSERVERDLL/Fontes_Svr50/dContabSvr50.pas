unit dContabSvr50;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, StdVcl, Provider, Db, DBTables, Dialogs, CMContabSvr50_TLB,
  uMidasUtil, JclFileUtils,uCMFileUtils, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF},

  {**
    Classes de Controle de Negócio utilizadas pela aplicação
  **}
  uCmControlObject, uCtrlPeriodo, uCtrlProcessaContab, uCtrlLancamento,
  uCtrlContaContabil, uCtrlHistoContab, uCtrlDemonstrativo, 
  uCtrlContab, uCtrlGeral,uCtrlPlano,uCtrlEventoSrh,uCtrlSubConta,uCtrlSubGrupo,
  uCtrlTermoDiario,uCtrlRegrasContab,uCtrlElemDemonstrativo,uCtrlListTerceiros,
  uCtrlDemLinha, uCtrlDemColuna,uCtrlDesenhoDemo,uCtrlElemBalPatr,uCtrlPlanoSaldo,
  uCtrlPlanoConta, uCtrlPrePlanilha,uCtrlPrePlanilhaPP,uCtrlPrePlanilhaLA,uCtrlPlanilha,
  uCtrlPrePlanilhaRP,uCtrlPrePlanilhaRA,uCtrlPrePlanilhaRPP,uCtrlParamContab,
  uCtrlPadroesSrvr,uCtrlRptAvisoLan,uCtrlProcessaTotalPrev,uCtrlRateioAtivProj,
  uCtrlRateioApExtra,uCtrlPlanoContaPer,uCtrlPlanoData,uCtrlPlanoDePara,
  uCtrlTabelaDePara, uCtrlDiasBloqMod;

type
  TDtmContabSvr50 = class(TRemoteDataModule, IDtmContabSvr50)
    DbContab: TDatabase;
    SsnDbContab: TSession;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    Periodo           : TCtrlPeriodo;
    ProcessaContab    : TCtrlProcessaContab;
    Lancamento        : TCtrlLancamento;
    ContaContabil     : TCtrlContaContabil;
    HistoContab       : TCtrlHistoContab;
    ParamContab       : TCtrlParamContab;
    Demonstrativo     : TCtrlDemonstrativo;
    Contab            : TCtrlContab;
    DiasBloqMod       : TCtrlDiasBloqMod;
    Geral             : TCtrlGeral;
    Plano             : TCtrlPlano;
    TabelaDePara      : TCtrlTabelaDePara;
    PlanoDePara       : TCtrlPlanoDePara;
    PlanoData         : TCtrlPlanoData;
    PlanoContaPer     : TCtrlPlanoContaPer;
    RateioApExtra     : TCtrlRateioApExtra;
    rptAvisoLan       : TCtrlRptAvisoLan;
    Eventosrh         : TCtrlEventosrh;
    SubConta          : TCtrlSubConta;
    RateioAtivProj    : TCtrlRateioAtivProj;
    SubGrupo          : TCtrlSubGrupo;
    TermoDiario       : TCtrlTermoDiario;
    RegrasContab      : TCtrlRegrasContab;
    ElemDemonstrativo : TCtrlElemDemonstrativo;
    ListTerceiros     : TCtrlListTerceiros;
    DemLinha          : TCtrlDemLinha;
    DemColuna         : TCtrlDemColuna;
    Planilha          : TCtrlPlanilha;
    PrePlanilha       : TCtrlPrePlanilha;
    PrePlanilhaRP     : TCtrlPrePlanilhaRP;
    PrePlanilhaRPP    : TCtrlPrePlanilhaRPP;
    PrePlanilhaRA     : TCtrlPrePlanilhaRA;
    PrePlanilhaPP     : TCtrlPrePlanilhaPP;
    PrePlanilhaLA     : TCtrlPrePlanilhaLA;
    DesenhoDemo       : TCtrlDesenhoDemo;
    ElemBalPatr       : TCtrlElemBalPatr;
    PlanoSaldo        : TCtrlPlanoSaldo;
    Planoconta        : TCtrlPlanoConta;
    ProcessaTotalPrev : TCtrlProcessaTotalPrev;

    _MessageInfo      : String;
    _MessageInfo2     : String;
    _TempDir: String;
    _PadroesSrvr: TCtrlPadroesSrvr;

    procedure MensagemPadroes(sMens: string);

  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function AcertaTipoSaldopeloTipoConta(dEmpresa,dModulo,dUsuario: Double; IExercicio,
      iPeriodo: Integer): WordBool; safecall;
    function AlteraOrcamento(iPlanosaldo,dOrcadoDebito, dOrcadoCredito: Double): WordBool; safecall;
    function ApagarColunaDemo(cdsDetalhe, cdsMestre: OleVariant): WordBool;
      safecall;
    function ApagarElemDemo(cdsDetalheConta, cdsDetalheSoma,
      cdsMestre: OleVariant): WordBool; safecall;
    function ApagarPrePlanilha(dEmpresa,dModulo,dUsuario:Double;cdsPreDetalhe,
      cdsPrePlanilha: OleVariant): WordBool; safecall;
    function ArredondaValores(dEmpresa,dModulo,dUsuario: Double): WordBool; safecall;
    function AtualizaOutraMoedaPadrao(IdEmpresa: Double; IExercicio, iPeriodo,
      TipoPeriodo: Integer): WordBool; safecall;
    function BloqueiaData(IdEmpresa: Double;
      const sData: WideString): WordBool; safecall;
    function CopiarDemonstrativoAPS(dDemoOri, dDemoDes, rgEscolha,
      dEmpresaProp: Double): WordBool; safecall;
    function CopiouLancAuto(cdsCopiaPrePlanilha,
      cdsCopiaPreDetalhe: OleVariant;
      const NomePlaNovo: WideString): WordBool; safecall;
    function DeletarContasContabeis(cdsContasxSC, cdsContasxCC,
      cdsPlanoConta: OleVariant): WordBool; safecall;
    function DeletaSaldoAnterior(IEmpresa, IExercicio: Integer): WordBool;
      safecall;
    function DeletaSaldoContas(IdEmpresa: Double; IExercicio,
      iPeriodo: Integer; bDeletaEstatistica, bDeletaOrcado: WordBool;
      TipoConta, TipoPeriodo: Integer): WordBool; safecall;
    function EncerraContasDeResultado(dEmpresa, dExercicio, dPeriodo, dModuloO,
      dCodPlano: Double; iUsuario: Integer; const sHist1, sHist2, sHist3,
      sHist4, sHist5, sContaD, sCCustoD, sDataLanc, sTipoOper: WideString;
      bJunta, bUsaPPatro: WordBool): WordBool; safecall;
    function EncerraExercicio(IEmpresa, IExercicio, iUsuario: Integer;
      bChecado, bUsaPlanoPatro: WordBool): WordBool; safecall;
    function EncerraPeriodo(IdEmpresa,IdModulo,IdUsuario: Double; IExercicio, iPeriodo,
      TipoBloqGra: Integer): WordBool; safecall;
    function ExcluiPlanilhasNaData(iEmpresa,iUsuario, iModulo: Integer;
      bUsaPPatro: WordBool; var RetornaPlnCod: Double;
      FCdsPlanilhanaData: OleVariant): WordBool; safecall;
    function FazLancamentosPlanilPP(dEmpresa: Double; iModulo, iPlano,
      iUsuario: Integer; const sDataLanc: WideString; bJunta,
      bUsaPlanoPatro: WordBool; var FRetornoPlnPlanil: Double;
      cdsLancamentos: OleVariant): WordBool; safecall;
    function FazRateio(liEmpresa, liModulo, liUsuario, liCodPlano,
      liPlanilRateio, liPlanoPrev, liPatro, liSubContaCp, liSubContaRt,
      liUnidNegoc: Integer; const sDataLanc, sNumDoc, sTipoOper, sCcustoCp,
      sContaCp, sCodHist1Cp, sHist1Cp, sHist2Cp, sHist3Cp, sHist4Cp,
      sHist5Cp, sCcustoRt, sContaRt, sCodHistRt, sHist1Rt, sHist2Rt,
      sHist3Rt, sHist4Rt, sHist5Rt, sDebCre: WideString; dValor: Double;
      bJunta, bUsaPPatro: WordBool;
      var FRetornoPlnPlanil: Double): WordBool; safecall;
    function GravaCodReduz(iIdEmpresa: Double;
      const sGrupo: WideString): WordBool; safecall;
    function GravaHistoContab(cdsHistoContab: OleVariant): WordBool; safecall;
    function GravarColunasDemo(cdsMestre, cdsDetalhe: OleVariant): WordBool;
      safecall;
    function GravarContasContabeis(cdsPlanoConta, cdsContasxCC,
      cdsContasxSC: OleVariant): WordBool; safecall;
    function GravarDemLinha(cdsDemLinha: OleVariant): WordBool; safecall;
    function GravarDemonstrativo(cdsDemonstrativo: OleVariant): WordBool;
      safecall;
    function GravarDesenhoDemo(cdsReports,
      cdsDesenhoDemo: OleVariant): WordBool; safecall;
    function GravarElemBalPatr(cdsElemBalPatr: OleVariant): WordBool; safecall;
    function GravarElemDemo(cdsMestre, cdsDetalheConta,
      cdsDetalheSoma: OleVariant): WordBool; safecall;
    function GravarEventoSRH(CdsEventoSRH: OleVariant): WordBool; safecall;
    function GravarParamContab(cdsParamContab: OleVariant): WordBool; safecall;
    function GravarPeriodo(cdsPeriodo: OleVariant): WordBool; safecall;
    function GravarPlano(CdsPlano: OleVariant): WordBool; safecall;
    function GravarPrePlanilha(dEmpresa, dModulo, dUsuaro: Double;cdsPrePlanilha,
      cdsPreDetalhe: OleVariant): WordBool; safecall;
    function GravarRegrasContab(dEmpresa,dModulo,dUsuario:Double;cdsRegrasContab: OleVariant): WordBool;
      safecall;
    function GravarSubConta(cdsSubConta: OleVariant; iUsuario: Double;
      bAssociaContas: WordBool): WordBool; safecall;
    function GravarSubGrupo(CdsSubGrupo: OleVariant): WordBool; safecall;
    function GravarTermoDiario(cdsTermoDiario: OleVariant): WordBool; safecall;
    function ImportaDadosRM(ArqTexto: OleVariant; dEmpresa: Double; iPlano,
      iModulo, iUsuario, rgVersao: Integer; const sTipoOper, sAtivProj,
      Caminho: WideString; bUsaPPatro: WordBool; FContaLinhaTexto: Integer;
      const FLinhaTexto: WideString): WordBool; safecall;
    function ImportaFidelio(ArqDiarias, ArqLanc: OleVariant; dEmpresa,
      dHotel: Double; iPlano, iUsuario: Integer; const Caminho: WideString;
      dtDataIni, dtDataFim: TDateTime; bUsaPPatro: WordBool;
      var FCodDC: WideString): WordBool; safecall;
    function ImportaLancamentos(ArqTexto: OleVariant; dEmpresa: Double; iPlano,
      iUsuario, iModulo, iNumCommit: Integer; const sTipoOper,
      sCaminho: WideString; bTestaConta, bHistChecked,
      bUsaPPatro: WordBool; var FsMensAPS,
      FsMesAPS_Log: WideString): WordBool; safecall;
    function ImportaPlanilhaExcel(ArqTexto: OleVariant; dEmpresa: Double;
      iPlano, iModulo, iUsuario: Integer; const sDataLanc,
      sTipoOper: WideString; bUsaPPatro: WordBool;
      var ContaLinhaTexto: Integer; var LinhaTexto,
      sMensAdd: WideString): WordBool; safecall;
    function InserePlanoSaldo(iPlano, iUniNegoc, iUsuInclusao, IdEmpresa,idModulo,
      idPessoa, IExercicio, iPernumero, iPatro, iPlanoprev,
      iSubConta: Integer; const sConta, sCcusto, sTipoconta: WideString;
      dDebitocorrente, dCreditocor, dDebitoOficial, dCreditoOficial,
      dDebitoHist, dCreditoHist, dDebitoGer, dCreditoGer, dDebitoGeren1,
      dCreditoGeren1, dDebitoGeren2, dCreditoGeren2, dOrcadoDebito,
      dOrcadoCredito: Double): WordBool; safecall;
    function ProcessaExcluiLanc(idEmpresa,iPlanilha, iModuloOrigem, iUsuario: Double;
      iNumLanc: Integer; bUsaPlanoPatro,
      bExcluiPlanilha: WordBool): WordBool; safecall;
    function ProcessaIntegraData(IdEmpresa,IdModulo, IdUsuario: Double; IExercicio,
      iPeriodo: Integer; bUsaPlanoPatro, bBloqueia: WordBool; const sData,
      sModulos: WideString): WordBool; safecall;
    function ProcessaIntegraPlanilha(iModulo,iUsuario, IEmpresa: Double;
      bUsaPlanoPatro: WordBool; Cds: OleVariant): WordBool; safecall;
    function ProcessaLancamento(IdEmpresa, iModuloOrigem, iUsuario: Double;
      bUsaPlanoPatro: WordBool; iPlnCodigo: Double;
      const sPlnDatDia: WideString; var RetornaPlnCodigo,
      RetornaPlnPlanil: Double; var RetornaPlnNumLan: Integer;
      CdsLancamento: OleVariant): WordBool; safecall;
    function ProcessaPlaLancAuto(dEmp, dUsu, dModulo, dPlano: Double; iPeriodo,
      IExercicio: Integer; const sDataFim, sDataLanc,
      sTipoFecha: WideString; bUsaPatro, bRateiaUnid: WordBool;
      cdsPlaSelecionadas: OleVariant;
      const FsMensAPS_Log: WideString): WordBool; safecall;
    function ProcessaSaldoAnalitica(IdEmpresa,IdModulo, iUsuario: Double; IExercicio,
      iPeriodo: Integer; bUsaPlanoPatro: WordBool): WordBool; safecall;
    function ProcessaSaldoSintetica(IdEmpresa, IdModulo,IdUsuario: Double; IExercicio,
      iPeriodo: Integer; bUsaPlanoPatro: WordBool;
      TipoPeriodo: Integer): WordBool; safecall;
    function RetornaElemOrdemLinhaAPS(dDemo: Double;
      var ProximaElemOrdemLinha: Double): WordBool; safecall;
    function TestaDebCrePlanilha(IdEmpresa: Double; IExercicio,
      iPeriodo: Integer): WordBool; safecall;
    function TestaDebCreSaldo(IdEmpresa: Double; IExercicio, iPeriodo,
      TipoPeriodo: Integer): WordBool; safecall;
    function TestaIntegraPlanilha(IdEmpresa: Double; IExercicio,
      iPeriodo: Integer): WordBool; safecall;
    function TestaOutraMoeda(IdEmpresa: Double; IExercicio, iPeriodo,
      TipoPeriodo: Integer): WordBool; safecall;
    function TestaParamContab(dIdEmpresa: Double; var ContaEncer,
      TipoOpEncer: WideString): WordBool; safecall;
    function TestaSaldoContraNatureza(IEmpresa: Double; IExercicio,
      iPeriodo: Integer): WordBool; safecall;
    function ZeraSaldoContas(IdEmpresa: Double; IExercicio, iPeriodo: Integer;
      bZeraEstatistica, bZeraOrcado: WordBool; TipoConta,
      TipoPeriodo: Integer): WordBool; safecall;
    function ProcAlteraDataPlanilha(dEmpresa,dModulo,dUsuario, dPlnCodigo: Double;
      iExercicioNovo, iPeriodoNovo: Integer; const sDataNova,
      sDiaMes: WideString): WordBool; safecall;
    function ProcAlteraDataPlanilha2(dEmpresa,dModulo, dPlnCodigo: Double; iExercicio,
      iPeriodo, iExercicioNovo, iPeriodoNovo, iUsuario: Integer;
      const sDataNova, sEfetivado, sMascaraContas, sDiaMes: WideString;
      bUsaPlanoPatro: WordBool): WordBool; safecall;
    function ConectaDB(const UserName, PassWord,
      ServerName: WideString): WordBool; safecall;
    function ExecSqlAndCommit(const sSql: WideString): WordBool; safecall;
    function GetContentFile(const sFileName: WideString): WideString; safecall;
    function GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
      TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
      ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
      ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
      ovNaturalidade, ovBanco, ovDocumento,
      ovTipoDoc: OleVariant): WordBool; safecall;
    function GetDataPacket(const sSql: WideString): OleVariant; safecall;
    function GetDataPacketTS(lSQL: OleVariant): OleVariant; safecall;
    function GravaHistSenha(aCdsHistSenha: OleVariant): WordBool; safecall;
    function GravaLogOperacoes(dIdPessoa, dIdModulo, dIdUsuario: Double;
      const sDescOperacao: WideString): WordBool; safecall;
    function MessageInfo: WideString; safecall;
    function ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage,
      IdMensagem: Integer): WordBool; safecall;
    function ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa,
      CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc: OleVariant): WordBool; safecall;
    function ProcessaPessoaBanco(Operacao: Integer; CdsPessoa, CdsPessoaFisica,
      CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess,
      CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc: OleVariant): WordBool; safecall;
    function ProcessaPessoaCliente(Operacao: Integer; CdsPessoa,
      CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli, CdsImAgregCli,
      CdsTiposCli: OleVariant): WordBool; safecall;
    function ProcessaPessoaForne(Operacao: Integer; CdsPessoa, CdsPessoaFisica,
      CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess,
      CdsTelContato, CdsContaBancaria, CdsImagensPessoa, CdsImagensDoc,
      CdsImAgregForn, CdsEmpresaForn, CdsFornXDesemb,
      CdsFornXRamo: OleVariant): WordBool; safecall;
    function SelDadosCli(rIdEmpresa, rIdForcli: Double; out ovSubTipo,
      ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
      ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool; safecall;
    function SelDadosForne(rIdEmpresa, rIdForcli: Double; out ovSubTipo,
      ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
      ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
      safecall;
    function TestaConsistenciaLanc(IdEmpresa,IdModulo,IdUsuario: Double; IExercicio,
      iPeriodo: Integer): WordBool; safecall;
    function ProcessaRptAvisoLan(dEmpresa: Double; iExercicio,
      iPeriodo: Integer; bChecado: WordBool): WordBool; safecall;
    function ProcessaDeletaRateioPlanPatro(iEmpresa,iModulo,iUsuario, iExercicio,
      iPeriodo: Integer): WordBool; safecall;
    function ProcessaGeraRateioPlanPatro(const sBilhete: WideString; iEmpresa,iModulo,iUsuario,
      iExercicio, iPeriodo, iSinal: Integer): WordBool; safecall;
    function ProcessaGeraLancamentoRateioPlanPatro(const sBilhete,
      sTipoOper: WideString; iEmpresa, iModulo,iUsuario, iPlanoPrev, iPatro,
      iExercicio, iPeriodo: Integer): WordBool; safecall;
    function ProcessaGeraLancamentoRatAdmPlanPatro(const sBilhete,
      sTipoOper: WideString; IEmpresa, IModulo,iUsuario: Double; iExercicio,
      iPeriodo: Integer): WordBool; safecall;
    function AplicaOperacaoRatAdm(dEmpresa,dModulo,dUsuario:Double;Operacao: Integer; cdsPrin,
      cdsDet: OleVariant): WordBool; safecall;
    function AplicaOperacaoSaldoCotas(dEmpresa,dModulo,dUsuario:Double;cdsPrin: OleVariant): WordBool; safecall;  function IDtmContabSvr50.GravarSubConta = IDtmContabSvr50_GravarSubConta;

    function IDtmContabSvr50_GravarSubConta(iUsuario: Double;
      bAssociaContas: WordBool; cdsSubConta: OleVariant): WordBool;
      safecall;
    function ImportaSaldoAnterior(ArqTexto: OleVariant; const sExercicio,
      sCaminho, sMascara: WideString; iPlano, iUsuario: Integer;
      dEmpresa,dModulo: Double; var FsMensAPS: WideString): WordBool; safecall;
    function ImportaContaCorresp(ArqTexto: OleVariant;
      const sCaminho: WideString; iPlano: Integer; dEmpresa,dModulo,dUsuario: Double;
      var FsMensAPS: WideString): WordBool; safecall;
    function ImportaSAF(ArqTexto: OleVariant; const sTipoOper,
      sCaminho: WideString; iModulo, iUsuario, iPlano, iPlanoPrev,
      iPlanoPatro, iNumCommit, iContMax: Integer; dEmpresa: Double;
      bUsaPPatro, bTestaConta: WordBool; var FsMensAPS,
      FsMensAPS_Log: WideString): WordBool; safecall;
    function ImportaFolhaDinamica(ArqTexto: OleVariant; const sTipoOper,
      sCaminho: WideString; iModulo, iUsuario, iPlano, iContMax: Integer;
      dEmpresa: Double; bUsaPPatro, bTestaConta, bHistoChecado: WordBool;
      var FsMensAPS, FsMensAPS_Log: WideString): WordBool; safecall;
    function ImportaSRH(ArqTexto: OleVariant; const sTipoOper, sCaminho,
      sAtivProj: WideString; iModulo, iUsuario, iPlano, iContMax: Integer;
      dNumColunas, dEmpresa: Double; bUsaPPatro: WordBool;
      var FsMensAPS: WideString): WordBool; safecall;
    function VerificaBloqueados(dEmpresa: Double; iUsuario: Integer;
      bUsaPPatro: WordBool; cdsVerificaBloqueados: OleVariant): WordBool;
      safecall;
    function ApuraResultadoPer(dModulo,dEmpresa: Double; iUsuario, iPlano, iExercicio,
      iPeriodo: Integer; const sProgPrev, sCodHist, sDefTec, sResCont,
      sFormDefTec, sRevSupTecN, sFormSupTer, sFdoCobOscRisc, sResMat,
      sRevDefTec, sDataLanc: WideString; bUsaPPatro: WordBool;
      const FsMensAPS_Log: WideString): WordBool; safecall;
    function ProcessaAtuMoeda(dEmpresa,dModulo: Double; iUsuario, iPlano, iExercicio,
      iPeriodo: Integer; const sHistorico, sCodHist, sTipoOper, sTipoFecha,
      sDataLanc, sPerdaGanho: WideString; dtDataIni, dtDataFim: TDateTime;
      bUsaPPatro: WordBool; const FsMensAPS_Log: WideString): WordBool;
      safecall;
    function GeraSaldoCalculado(dEmpresa,dModulo,dUsuario: Double; iExercicio,
      iPeriodo: Integer; const sMascara: WideString; bSubConta,
      bCCusto: WordBool): WordBool; safecall;
    function LancaMeiaNoite(dEmpresa: Double; iUsuario, iPlano, IExercicio,
      iPeriodo: Integer; const sProgPrev, sCodHist, sDefTec, sDefTecA,
      sResCont, sResContA, sFormDefTec, sRevSupTecN, sFormSupTec,
      sFdoCobOscRisc, sFdoCobOscRiscA, sResMat, sRevDefTec,
      sDataLanc: WideString; bUsaPPatro: WordBool;
      const FsMensAPS_Log: WideString): WordBool; safecall;
    function GravarRateioAtivProj(dEmpresa,dModulo,dUsuario: Double; iCodMoeda: Integer;
      FcdsRateioAtivProj: OleVariant): WordBool; safecall;
    function RemoveRateioPorPeriodo(dEmpresa,dModulo,dUsuario: Double; iExercicio,
      iPeriodo: Integer): WordBool; safecall;
    function GeraRateioPorPeriodo(dEmpresa,dModulo,dUsuario: Double; iCodMoeda, iSinal,
      iExercicio, iPeriodo: Integer; const sDataLanc,
      FsMensAPS_Log: WideString): WordBool; safecall;
    function GeraLancaRateioAtivProj(dEmpresa: Double; iUsuario, iPlano,
      iExercicio, iPeriodo, iUnidNegoc: Integer; const sTipoOper,
      sDataLanc: WideString; bUsaPPatro: WordBool;
      const FsMensAPP_Log: WideString): WordBool; safecall;
    function GravarRateioApExtra(dEmpresa,dModulo,dUsuario: Double;cdsMestre, cdsDetalhe: OleVariant): WordBool;
      safecall;
    function GeraLancaRateioADM(dEmpresa,dModulo: Double; iUsuario, iPlano, iExercicio,
      iPeriodo: Integer; const sTipoOper, sDataLanc: WideString;
      bUsaPPatro: WordBool; const FsMensAPS_Log: WideString): WordBool;
      safecall;
    function GeraRateioPorPrograma(dEmpresa,dModulo: Double; iUsuario, iPlano,
      IExercicio, iPeriodo: Integer; const sTipoOper,
      sDataGera: WideString; bUsaPPatro: WordBool;
      const FsMensAPS_Log: WideString): WordBool; safecall;
    function GeraRateioPPrevePatro(dEmpresa: Double; iUsuario, iPlano,
      iExercicio, iPeriodo: Integer; const sTipoOper, sDataGera,
      sTipoFecha: WideString; bUsaPPatro: WordBool;
      const FsMensAPS_Log: WideString): WordBool; safecall;
    function GeraLancaConsolidado(dEmpresa: Double; iUsuario, iPlano,
      iExercicio, iPeriodo: Integer; const sTipoOper, sDataLanc,
      sMascara: WideString; bUsaPPatro, bOrcamento, bConsoUnidNegoc,
      bConsoSubConta: WordBool; cdsEmpresasSel: OleVariant): WordBool;
      safecall;
    function  GravarPlanoContaPer(iEmpresa: Integer; iUsuario: Integer; iModulo: Integer; 
                                  iPlano: Integer; iPeriodo: Integer; 
                                  const NomeContaAnal: WideString; 
                                  const ComplContaAnal: WideString; const Conta: WideString; 
                                  const MascaraPlano: WideString; const DataIni: WideString; 
                                  UsaPPatro: WordBool; cdsPlanoContaPer: OleVariant): WordBool; safecall;
    function GravarPlanoData(cdsPlanoData: OleVariant): WordBool; safecall;
    function GravarPlanoDePara(cdsPlanoDePara: OleVariant): WordBool; safecall;
    function AlteraPlanoConta(dEmpresa, dUsuario: Double; const sMascara,
      sDataRef: WideString; iPlano, iPlanoVigente, IExercicio: Integer;
      bMesmoPlano, bMesmosCCSC, bGeraLancSaldoAnt,
      bSoSaldoAnt: WordBool): WordBool; safecall;
    function GravarTabelaDePara(cdsMestre, cdsDetalhe: OleVariant): WordBool;
      safecall;
    function ApagarTabelaDePara(cdsMestre, cdsDetalhe: OleVariant): WordBool;
      safecall;
    function ImportaPlanoContas(ArqTexto: OleVariant; const sMascara,
      sCaminho: WideString; iPlano: Integer; dEmpresa,dModulo,dUsuario: Double;
      var FsMensAPS: WideString): WordBool; safecall;
    function ApagarRateioApExtra(dEmpresa,dModulo,dUsuario:Double;cdsDetalhe, cdsMestre: OleVariant): WordBool;
      safecall;
    function ProcessaDepositoVHF(dEmpresa: Double; iPlano, IExercicio,
      iPeriodo, iHotel, iUsuario: Integer; const sDataLanc: WideString;
      dtDataIni, dtDataFim: TDateTime): WordBool; safecall;
    function AtuCodigoReduzido(dEmpresa,dModulo,dUsuario: Double; iPlano,
      rgRenumera: Integer): WordBool; safecall;
    function AcertaNumPlanilha(dEmpresa,dModulo,dUsuario: Double; iPlano, iExercicio,
      iPeriodo: Integer; const sPacDiaMes: WideString): WordBool; safecall;
    function FazEstorno(dUsuario, dCodPlanilha, dModulo, dEmpresa: Double;
      bUsaPPatro: WordBool; const sDataEstorno: WideString): WordBool;
      safecall;
    function ProcessaWorkFlow(ovWorkFlowUsuario, ovWorkFlow,
      ovPassoWorkFlow: OleVariant; Operacao: Integer): WordBool; safecall;
    function GravarReports(ovCds: OleVariant): WordBool; safecall;
    function ProcurarReports(idReports, OrigemCM: Integer): WordBool; safecall;
    function ProcessaConfigModelo(ovReports: OleVariant): WordBool; safecall;
    function ProcessaGrupoUsu(ovDataViewAcesso, ovTabelaAcesso, ovColunaAcesso,
      ovGrupo, ovUsuario, ovPessoa, ovGrupoXUsu, ovAutoriza, ovAutorizaRpt,
      ovAutorizaMS: OleVariant; OperacaoProcessa: Integer): WordBool;
      safecall;
    function ProcessaConfig(ovCds, ovCdsReport: OleVariant;
      Operacao: Integer): WordBool; safecall;
    function ApagarDesenhoDemo(CdsDesenhoDemo, CdsReports: OleVariant): WordBool; safecall;
    function AtualizaParamContab(dEmpresa, dPlnCodigo: Double): WordBool; safecall;
    function AlteraMovimAnterior(idPlanosaldo,dDebitoCorrente, dCreditoCor: Double): WordBool; safecall;
    function AlteraSaldoAnterior(dEmpresa,dModulo,dUsuario,idPlanoSaldo,dDebitoCorrente,dCreditoCor,dDebitoOficial,
                                  dCreditoOficial, dDebitoHist,dCreditoHist,dDebitoGer,
                                  dCreditoGer,dDebitoGeren1, dCreditoGeren1,dDebitoGeren2,
                                  dCreditoGeren2: Double): WordBool; safecall;

    function  GravarDiasBloqMod(cdsDiasBloqMod: OleVariant): WordBool; safecall;
    function  ApagarPlanoContaPer(CdsPlanoContaPer: OleVariant): WordBool; safecall;

  public
    { Public declarations }
  end;

implementation

Uses uDataBase;

{$R *.DFM}

class procedure TDtmContabSvr50.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TDtmContabSvr50.RemoteDataModuleCreate(Sender: TObject);
begin
   _TempDir := GeraDataBaseName(self, DbContab, True, SsnDbContab);

   _MessageInfo  := '';
   _MessageInfo2 := '';

   _PadroesSrvr := TCtrlPadroesSrvr.Create;
   _PadroesSrvr.Initialize(DbContab, True, cntBde, cnsServer, nil, false, MensagemPadroes,nil,True);

   Periodo := TCtrlPeriodo.Create;
   Periodo.InitializeAs(_PadroesSrvr);

   DiasBloqMod := TCtrlDiasBloqMod.Create;
   DiasBloqMod.InitializeAs(_PadroesSrvr);

   RateioAtivProj := TCtrlRateioAtivProj.Create;
   RateioAtivProj.InitializeAs(_PadroesSrvr);

   PlanoData := TCtrlPlanoData.Create;
   PlanoData.InitializeAs(_PadroesSrvr);

   PlanoContaPer := TCtrlPlanoContaPer.Create;
   PlanoContaPer.InitializeAs(_PadroesSrvr);

   TabelaDePara := TCtrlTabelaDePara.Create;
   TabelaDePara.InitializeAs(_PadroesSrvr);

   RateioApExtra := TCtrlRateioApExtra.Create;
   RateioApExtra.InitializeAs(_PadroesSrvr);

   ProcessaContab := TCtrlProcessaContab.Create;
   ProcessaContab.InitializeAs(_PadroesSrvr);

   ProcessaTotalPrev := TCtrlProcessaTotalPrev.Create;
   ProcessaTotalPrev.InitializeAs(_PadroesSrvr);

   Lancamento := TCtrlLancamento.Create;
   Lancamento.InitializeAs(_PadroesSrvr);

   ContaContabil := TCtrlContaContabil.Create;
   ContaContabil.InitializeAs(_PadroesSrvr);

   HistoContab    := TCtrlHistoContab.Create;
   HistoContab.InitializeAs(_PadroesSrvr);

   rptAvisoLan    := TCtrlRptAvisoLan.Create;
   rptAvisoLan.InitializeAs(_PadroesSrvr);

   ParamContab    := TCtrlParamContab.Create;
   ParamContab.InitializeAs(_PadroesSrvr);

   Demonstrativo  := TCtrlDemonstrativo.Create;
   Demonstrativo.InitializeAs(_PadroesSrvr);

   Contab  := TCtrlContab.Create;
   Contab.InitializeAs(_PadroesSrvr);

   Geral   := TCtrlGeral.Create;
   Geral.InitializeAs(_PadroesSrvr);
   //
   Plano  := TCtrlPlano.Create;
   Plano.InitializeAs(_PadroesSrvr);
   //
   EventoSrh  := TCtrlEventoSrh.Create;
   EventoSrh.InitializeAs(_PadroesSrvr);
   //
   SubGrupo  := TCtrlSubGrupo.Create;
   SubGrupo.InitializeAs(_PadroesSrvr);
   //
   PlanoSaldo  := TCtrlPlanoSaldo.Create;
   PlanoSaldo.InitializeAs(_PadroesSrvr);
   //
   DemLinha  := TCtrlDemLinha.Create;
   DemLinha.InitializeAs(_PadroesSrvr);
   //
   PlanoDePara := TCtrlPlanoDePara.Create;
   PlanoDePara.InitializeAs(_PadroesSrvr);

   ElemBalPatr  := TCtrlElemBalPatr.Create;
   ElemBalPatr.InitializeAs(_PadroesSrvr);
   //
   DemColuna  := TCtrlDemColuna.Create;
   DemColuna.InitializeAs(_PadroesSrvr);
   //
   SubConta  := TCtrlSubConta.Create;
   SubConta.InitializeAs(_PadroesSrvr);
   //
   DesenhoDemo := TCtrlDesenhoDemo.Create;
   DesenhoDemo.InitializeAs(_PadroesSrvr);
   //
   TermoDiario  := TCtrlTermoDiario.Create;
   TermoDiario.InitializeAs(_PadroesSrvr);
   //
   ListTerceiros  := TCtrlListTerceiros.Create;
   ListTerceiros.InitializeAs(_PadroesSrvr);
   //
   Planoconta  := TCtrlPlanoconta.Create;
   Planoconta.InitializeAs(_PadroesSrvr);
   //
   RegrasContab  := TCtrlRegrasContab.Create;
   RegrasContab.InitializeAs(_PadroesSrvr);
   //
   Planilha  := TCtrlPlanilha.Create;
   Planilha.InitializeAs(_PadroesSrvr);

   PrePlanilha  := TCtrlPrePlanilha.Create;
   PrePlanilha.InitializeAs(_PadroesSrvr);

   PrePlanilhaLA  := TCtrlPrePlanilhaLA.Create;
   PrePlanilhaLA.InitializeAs(_PadroesSrvr);

   PrePlanilhaPP  := TCtrlPrePlanilhaPP.Create;
   PrePlanilhaPP.InitializeAs(_PadroesSrvr);

   PrePlanilhaRA  := TCtrlPrePlanilhaRA.Create;
   PrePlanilhaRA.InitializeAs(_PadroesSrvr);

   PrePlanilhaRP  := TCtrlPrePlanilhaRP.Create;
   PrePlanilhaRP.InitializeAs(_PadroesSrvr);

   PrePlanilhaRPP  := TCtrlPrePlanilhaRPP.Create;
   PrePlanilhaRPP.InitializeAs(_PadroesSrvr);

   ElemDemonstrativo  := TCtrlElemDemonstrativo.Create;
   ElemDemonstrativo.InitializeAs(_PadroesSrvr);

end;

procedure TDtmContabSvr50.RemoteDataModuleDestroy(Sender: TObject);
begin
  ProcessaTotalPrev.free;
  Periodo.Free;
  DiasBloqMod.free;
  TabelaDePara.free;
  PlanoContaPer.free;
  PlanoDePara.free;
  RateioApExtra.free;
  rptAvisoLan.free;
  RateioAtivProj.free;
  ProcessaContab.Free;
  Lancamento.Free;
  ContaContabil.Free;
  HistoContab.Free;
  ParamContab.Free;
  PrePlanilha.Free;
  Planilha.Free;
  PrePlanilhaRP.Free;
  PrePlanilhaRA.Free;
  PrePlanilhaPP.Free;
  PrePlanilhaLA.Free;
  ElemBalPatr.Free;
  Demonstrativo.Free;
  Planoconta.Free;
  DesenhoDemo.Free;
  Contab.Free;
  Plano.Free;
  Eventosrh.Free;
  SubConta.Free;
  PlanoSaldo.Free;
  ListTerceiros.Free;
  SubGrupo.Free;
  ElemDemonstrativo.Free;
  DemLinha.Free;
  TermoDiario.Free;
  RegrasContab.Free;
  Geral.Free;
  _PadroesSrvr.Free;
  
  If DbContab.Connected Then DbContab.CLose;
  If SsnDbContab.Active Then SsnDbContab.Close;

  If DirectoryExists(_TempDir) Then DelTree(_TempDir);
end;

function TDtmContabSvr50.TestaOutraMoeda(IdEmpresa: Double; iExercicio,
  iPeriodo, TipoPeriodo: Integer): WordBool;
begin
   Result := ProcessaContab.TestaOutraMoeda(IdEmpresa, iExercicio, iPeriodo, TTipoPeriodo(TipoPeriodo));
   Try
      If Not Result Then
         _MessageInfo := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.AtualizaOutraMoedaPadrao(IdEmpresa: Double;
  iExercicio, iPeriodo, TipoPeriodo: Integer): WordBool;
begin
   Try
     Result := ProcessaContab.AtualizaOutraMoedaPadrao(IdEmpresa,iExercicio,iPeriodo,TTipoPeriodo(TipoPeriodo));
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.TestaDebCrePlanilha(IdEmpresa: Double; iExercicio,
  iPeriodo: Integer): WordBool;
begin
   Try

     Result := ProcessaContab.TestaDebCrePlanilha(IdEmpresa, iExercicio, iPeriodo);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.TestaIntegraPlanilha(IdEmpresa: Double; iExercicio,
  IPeriodo: Integer): WordBool;
begin
   Try
     Result := ProcessaContab.TestaIntegraPlanilha(IdEmpresa,iExercicio,iPeriodo);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;
{
function TDtmContabSvr50.TestaConsistenciaLanc(IdEmpresa: Double;
  IExercicio, iPeriodo: Integer): WordBool;
//var
 /// StrlMensagens :TStringList;

begin
   Try
   //   StrlMensagens :=TStringList.Create;

   //  VariantToStringlist(StrlMens,StrlMensagens);

     Result := ProcessaContab.TestaConsistenciaLanc(IdEmpresa, iExercicio, iPeriodo);

   //  _MessageInfo := StrlMensagens.Text;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;
     }
function TDtmContabSvr50.ArredondaValores(dEmpresa,dModulo,dUsuario: Double): WordBool;
begin
   Try
     Result := ProcessaContab.ArredondaValores(dEmpresa,dModulo,dUsuario);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.AcertaTipoSaldopeloTipoConta(dEmpresa,dModulo,dUsuario:Double;
  IExercicio, iPeriodo: Integer): WordBool;
begin
   Try
      Result := ProcessaContab.AcertaTipoSaldopeloTipoConta(dEmpresa,dModulo,dUsuario, iExercicio, iPeriodo);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.DeletaSaldoContas(IdEmpresa: Double; iExercicio,
  iPeriodo: Integer; bDeletaEstatistica, bDeletaOrcado: WordBool;
  TipoConta, TipoPeriodo: Integer): WordBool;
begin
   Try

     Result := ProcessaContab.DeletaSaldoContas(IdEmpresa, iExercicio, iPeriodo,
               bDeletaEstatistica, bDeletaOrcado, uCtrlProcessaContab.TTipoConta(TipoConta), TTipoPeriodo(TipoPeriodo));
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ZeraSaldoContas(IdEmpresa: Double; iExercicio,
  iPeriodo: Integer; bZeraEstatistica, bZeraOrcado: WordBool; TipoConta,
  TipoPeriodo: Integer): WordBool;
begin
   Try

     Result := ProcessaContab.ZeraSaldoContas(IdEmpresa, iExercicio, iPeriodo,
               bZeraEstatistica, bZeraOrcado, uCtrlProcessaContab.TTipoConta(TipoConta), TTipoPeriodo(TipoPeriodo));
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ProcessaSaldoAnalitica(IdEmpresa,IdModulo, iUsuario: Double;
  iExercicio, iPeriodo: Integer; bUsaPlanoPatro: WordBool): WordBool;
begin
   Try

     Result := ProcessaContab.ProcessaSaldoAnalitica(IdEmpresa, IdModulo,iUsuario, iExercicio,
              iPeriodo, bUsaPlanoPatro);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ProcessaSaldoSintetica(IdEmpresa, IdModulo,
  IdUsuario: Double; IExercicio, iPeriodo: Integer;
  bUsaPlanoPatro: WordBool; TipoPeriodo: Integer): WordBool;
begin
   Try

      Result := ProcessaContab.ProcessaSaldoSintetica(IdEmpresa,IdModulo, IdUsuario, iExercicio,
                iPeriodo, bUsaPlanoPatro, TTipoPeriodo(TipoPeriodo));
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.TestaDebCreSaldo(IdEmpresa: Double; iExercicio,
  iPeriodo, TipoPeriodo: Integer): WordBool;
begin
   Try

     Result := ProcessaContab.TestaDebCreSaldo(IdEmpresa, iExercicio,
                iPeriodo, TTipoPeriodo(TipoPeriodo));
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ProcessaIntegraData(IdEmpresa, IdModulo,IdUsuario: Double;
  iExercicio, iPeriodo: Integer; bUsaPlanoPatro, bBloqueia: WordBool;
  const sData, sModulos: WideString): WordBool;
begin
   Try

      Result := ProcessaContab.ProcessaIntegraData(IdEmpresa,IdModulo, IdUsuario, iExercicio,
              iPeriodo, bUsaPlanoPatro, bBloqueia, sData, sModulos);
      If Not Result Then
        _MessageInfo := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.ProcessaIntegraPlanilha(iModulo,iUsuario, IEmpresa: Double;
  bUsaPlanoPatro: WordBool; Cds: OleVariant): WordBool;
begin
   Try

     If ProcessaContab.cdsPlanilha.Active Then ProcessaContab.cdsPlanilha.Close;
     ProcessaContab.cdsPlanilha.Data := Cds;

     Result := ProcessaContab.ProcessaIntegraPlanilha(iModulo,iUsuario, iEmpresa, bUsaPlanoPatro);
      If Not Result Then
        _MessageInfo := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.ProcessaLancamento(idEmpresa, iModuloOrigem,
  iUsuario: Double; bUsaPlanoPatro: WordBool; iPlnCodigo: Double;
  const sPlnDatDia: WideString; var RetornaPlnCodigo,
  RetornaPlnPlanil: Double; var RetornaPlnNumLan: Integer;
  CdsLancamento: OleVariant): WordBool;
begin
   Try

      If ProcessaContab.cdsLancamento.Active Then ProcessaContab.cdsLancamento.Close;
      ProcessaContab.cdsLancamento.Data := CdsLancamento;

      Result := ProcessaContab.ProcessaLancamento(idEmpresa, iModuloOrigem, iUsuario, bUsaPlanoPatro,
      iPlnCodigo, sPlnDatDia);

      If Result Then
      Begin
        RetornaPlnCodigo := ProcessaContab.RetornaPlnCodigo;
        RetornaPlnPlanil := ProcessaContab.RetornaPlnPlanil;
        RetornaPlnNumLan := ProcessaContab.RetornaPlnNumLan;
      End Else
          _MessageInfo := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.ProcessaExcluiLanc(idEmpresa,iPlanilha, iModuloOrigem,
  iUsuario: Double; iNumLanc: Integer; bUsaPlanoPatro,
  bExcluiPlanilha: WordBool): WordBool;
begin
   Try

      Result := ProcessaContab.ProcessaExcluiLanc(idEmpresa,iPlanilha, iModuloOrigem, iUsuario,
                 iNumLanc, bUsaPlanoPatro, bExcluiPlanilha);
      If Not Result Then
         _MessageInfo := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;



end;

function TDtmContabSvr50.TestaSaldoContraNatureza(iEmpresa: Double;
  iExercicio, iPeriodo: Integer): WordBool;
begin
   Try

        Result := ProcessaContab.TestaSaldoContraNatureza(iEmpresa, iExercicio, iPeriodo);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;
function TDtmContabSvr50.BloqueiaData(IdEmpresa: Double;
  const sData: WideString): WordBool;
begin
   Try

        Result := Contab.BloqueiaData(IdEmpresa, sData);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;
function TDtmContabSvr50.EncerraPeriodo(IdEmpresa,IdModulo,IdUsuario: Double; iExercicio,
  iPeriodo, TipoBloqGra: Integer): WordBool;
begin
   Try
      Result := Periodo.EncerraPeriodo(IdEmpresa,IdModulo,IdUsuario, iExercicio, iPeriodo, TTipoBloqueGra(TipoBloqGra));
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;
end;

function TDtmContabSvr50.GravarPlano(CdsPlano: OleVariant): WordBool;
begin
   Try
       Plano.cdsPlano.Data := CdsPlano;
       result := Plano.Gravar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;
end;


function TDtmContabSvr50.GravarEventoSRH(
  CdsEventoSRH: OleVariant): WordBool;
begin
   Try

      Eventosrh.cdsEventoSrh.Data := cdsEventoSrh;
      result := Eventosrh.Gravar;
    Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GravarSubGrupo(CdsSubGrupo: OleVariant): WordBool;
begin
   Try

       SubGrupo.cdsSubGrupo.Data := cdsSubGrupo;
       result := SubGrupo.Gravar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GravarSubConta(cdsSubConta: OleVariant;
  iUsuario: Double; bAssociaContas: WordBool): WordBool;
begin
   Try

     SubConta.cdsSubConta.Data := cdsSubConta;
     result := SubConta.Gravar(iUsuario,bAssociaContas);
    Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;



function TDtmContabSvr50.GravarTermoDiario(
  cdsTermoDiario: OleVariant): WordBool;
begin
   Try

      TermoDiario.cdsTermoDiario.Data := cdsTermoDiario;
      result := TermoDiario.Gravar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.GravarRegrasContab(dEmpresa,dModulo,dUsuario:Double;
  cdsRegrasContab: OleVariant): WordBool;
begin
   Try

      RegrasContab.cdsRegrasContab.Data := cdsRegrasContab;
      result := RegrasContab.Gravar(dEmpresa,dModulo,dUsuario);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.GravarDemonstrativo(
  cdsDemonstrativo: OleVariant): WordBool;
begin
   Try

      Demonstrativo.cdsDemonstrativo.Data := cdsDemonstrativo;
      result := Demonstrativo.Gravar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.GravarElemDemo(cdsMestre, cdsDetalheConta,
  cdsDetalheSoma: OleVariant): WordBool;
begin
   Try

       ElemDemonstrativo.cdsMestre.Data       := cdsMestre;
       ElemDemonstrativo.cdsDetalheConta.Data := cdsDetalheConta;
       ElemDemonstrativo.cdsDetalheSoma.Data  := cdsDetalheSoma;
       result := ElemDemonstrativo.Gravar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.ApagarElemDemo(cdsDetalheConta, cdsDetalheSoma,
  cdsMestre: OleVariant): WordBool;
begin
   Try

      ElemDemonstrativo.cdsDetalheConta.Data := cdsDetalheConta;
      ElemDemonstrativo.cdsDetalheSoma.Data  := cdsDetalheSoma;
      ElemDemonstrativo.cdsMestre.Data       := cdsMestre;
      result := ElemDemonstrativo.Apagar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;



function TDtmContabSvr50.GravarDemLinha(cdsDemLinha: OleVariant): WordBool;
begin
   Try

      DemLinha.cdsDemLinha.Data := cdsDemLinha;
      result := DemLinha.Gravar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.GravarColunasDemo(cdsMestre,
  cdsDetalhe: OleVariant): WordBool;
begin
   Try

       DemColuna.cdsMestre.Data   := cdsMestre;
       DemColuna.cdsDetalhe.Data  := cdsDetalhe;
       result := DemColuna.Gravar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.ApagarColunaDemo(cdsDetalhe,
  cdsMestre: OleVariant): WordBool;
begin
   Try
       DemColuna.cdsDetalhe.Data  := cdsDetalhe;
       DemColuna.cdsMestre.Data   := cdsMestre;
       result := DemColuna.Apagar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;
function TDtmContabSvr50.GravarElemBalPatr(
  cdsElemBalPatr: OleVariant): WordBool;
begin
   Try

       ElemBalPatr.cdsElemBalPatr.Data   := cdsElemBalPatr;
       result := ElemBalPatr.Gravar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.InserePlanoSaldo(iPlano, iUniNegoc, iUsuInclusao,
  idEmpresa,idModulo, idPessoa, iExercicio, iPernumero, iPatro, iPlanoprev,
  iSubConta: Integer; const sConta, sCcusto, sTipoconta: WideString;
  dDebitocorrente, dCreditocor, dDebitoOficial, dCreditoOficial,
  dDebitoHist, dCreditoHist, dDebitoGer, dCreditoGer, dDebitoGeren1,
  dCreditoGeren1, dDebitoGeren2, dCreditoGeren2, dOrcadoDebito,
  dOrcadoCredito: Double): WordBool;
begin
   Try

      Result := PlanoSaldo.InserePlanoSaldo(iPlano, iUniNegoc, iUsuInclusao,idEmpresa,idModulo,
                                           idPessoa, iExercicio, iPernumero, iPatro, iPlanoprev,
                                           iSubConta, sConta, sCcusto, sTipoconta,dDebitocorrente,
                                           dCreditocor,dDebitoOficial, dCreditoOficial, dDebitoHist,
                                           dCreditoHist, dDebitoGer, dCreditoGer, dDebitoGeren1,
                                           dCreditoGeren1, dDebitoGeren2, dCreditoGeren2, dOrcadoDebito,
                                           dOrcadoCredito);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.AlteraOrcamento(iPlanosaldo, dOrcadodebito, dOrcadocredito: Double): WordBool;
begin
   Try

       result := PlanoSaldo.AlteraOrcamento(iPlanosaldo, dOrcadodebito,dOrcadocredito);

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;



function TDtmContabSvr50.GravaCodReduz(iIdEmpresa: Double;
  const sGrupo: WideString): WordBool;
begin
   Try

   result := PlanoConta.GravaCodReduz(iIdEmpresa, sGrupo);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GravarContasContabeis(cdsPlanoConta, cdsContasxCC,
  cdsContasxSC: OleVariant): WordBool;
begin
   Try

       PlanoConta.cdsPlanoConta.Data  := cdsPlanoConta;
       PlanoConta.cdsContasxCC.Data   := cdsContasxCC;
       PlanoConta.cdsContasxSC.Data   := cdsContasxSC;
       result := PlanoConta.Gravar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.DeletarContasContabeis(cdsContasxSC, cdsContasxCC,
  cdsPlanoConta: OleVariant): WordBool;
begin
   Try

       PlanoConta.cdsContasxSC.Data   := cdsContasxSC;
       PlanoConta.cdsContasxCC.Data   := cdsContasxCC;
       PlanoConta.cdsPlanoConta.Data  := cdsPlanoConta;
       result := PlanoConta.Apagar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;


function TDtmContabSvr50.GravarPrePlanilha(dEmpresa,dModulo,dUsuaro:Double;cdsPrePlanilha,
  cdsPreDetalhe: OleVariant): WordBool;
begin
   Try

       PrePlanilha.cdsPrePlanilha.Data := cdsPrePlanilha;
       PrePlanilha.cdsPreDetalhe.Data  := cdsPreDetalhe;
       result := PrePlanilha.Gravar(dEmpresa, dModulo,dUsuaro);

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ApagarPrePlanilha(dEmpresa,dModulo,dUsuario:Double;cdsPreDetalhe,
  cdsPrePlanilha: OleVariant): WordBool;
begin
   Try
       PrePlanilha.cdsPreDetalhe.Data  := cdsPreDetalhe;
       PrePlanilha.cdsPrePlanilha.Data := cdsPrePlanilha;
       result := PrePlanilha.Apagar(dEmpresa,dModulo,dUsuario);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.CopiouLancAuto(cdsCopiaPrePlanilha,
  cdsCopiaPreDetalhe: OleVariant; const NomePlaNovo: WideString): WordBool;
begin
   Try

      PrePlanilhaLA.cdsCopiaPrePlanilha.Data := cdsCopiaPrePlanilha;
      PrePlanilhaLA.cdsCopiaPreDetalhe.Data  := cdsCopiaPreDetalhe;
      result := PrePlanilhaLA.CopiouLancamentoAut(NomePlaNovo);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GravaHistoContab(
  cdsHistoContab: OleVariant): WordBool;
begin
   Try
      HistoContab.cdsHistoContab.Data := cdsHistoContab;
      result := HistoContab.Gravar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GravarPeriodo(cdsPeriodo: OleVariant): WordBool;
begin
   Try

       Periodo.cdsPeriodo.Data := cdsPeriodo;
       result := Periodo.Gravar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.CopiarDemonstrativoAPS(dDemoOri, dDemoDes,
  rgEscolha, dEmpresaProp: Double): WordBool;
begin
   Try

       result := ElemDemonstrativo.CopiarDemonstrativo(dDemoOri, dDemoDes,rgEscolha,
                                                   dEmpresaProp);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.EncerraContasDeResultado(dEmpresa, dExercicio,
  dPeriodo, dModuloO, dCodPlano: Double; iUsuario: Integer; const sHist1,
  sHist2, sHist3, sHist4, sHist5, sContaD, sCCustoD, sDataLanc,
  sTipoOper: WideString; bJunta, bUsaPPatro: WordBool): WordBool;
begin
   Try

      Result := ProcessaContab.EncerraContasDeResultado(dEmpresa, dExercicio,
                               dPeriodo, dModuloO, dCodPlano,iUsuario,sHist1,
                               sHist2, sHist3, sHist4, sHist5, sContaD, sCCustoD, sDataLanc,
                               sTipoOper,bJunta, bUsaPPatro);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;


function TDtmContabSvr50.TestaParamContab(dIdEmpresa: Double;
  var ContaEncer, TipoOpEncer: WideString): WordBool;
begin
   Try

        Result := ProcessaContab.TestaParamContab(dIdEmpresa);
        ContaEncer  := ProcessaContab.ContaDeb;
        TipoOpEncer := ProcessaContab.TipoOper;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.EncerraExercicio(IEmpresa, IExercicio,
  iUsuario: Integer; bChecado, bUsaPlanoPatro: WordBool): WordBool;
begin
   Try

      Result := ProcessaContab.EncerraExercicio(iEmpresa,iExercicio,
                                                iUsuario,bChecado,bUsaPlanoPatro);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.DeletaSaldoAnterior(iEmpresa,
  iExercicio: Integer): WordBool;
begin
   Try
      Result := ProcessaContab.DeletaSaldoAnterior(iEmpresa,iExercicio);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.RetornaElemOrdemLinhaAPS(dDemo: Double;
  var ProximaElemOrdemLinha: Double): WordBool;
begin
   Try
      Result := ElemDemonstrativo.RetornaElemOrdemLinha(dDemo);
      If Result Then
         ProximaElemOrdemLinha := ElemDemonstrativo.ProximaElemOrdemLinha;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.GravarDesenhoDemo(cdsReports,
  cdsDesenhoDemo: OleVariant): WordBool;
begin
   Try

       DesenhoDemo.cdsDesenhoDemo.Data := cdsDesenhoDemo;
       DesenhoDemo.cdsReports.Data     := cdsReports;
       result := DesenhoDemo.Gravar;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;
function TDtmContabSvr50.FazLancamentosPlanilPP(dEmpresa: Double; iModulo,
  iPlano, iUsuario: Integer; const sDataLanc: WideString; bJunta,
  bUsaPlanoPatro: WordBool; var FRetornoPlnPlanil: Double;
  cdsLancamentos: OleVariant): WordBool;
begin
   Try

       PrePlanilhaPP.cdsLancamentos.Data := CdsLancamentos;
       result := PrePlanilhaPP.FazLancamentos(dEmpresa,iModulo,iPlano,iUsuario,
                                              sDataLanc,bJunta, bUsaPlanoPatro);
       If Result Then
          _MessageInfo := FloatToStr(PrePlanilhaPP.RetornoPlnPlanil)
       Else
         _MessageInfo := PrePlanilhaPP.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;


function TDtmContabSvr50.ProcessaPlaLancAuto(dEmp, dUsu, dModulo,
  dPlano: Double; iPeriodo, IExercicio: Integer; const sDataFim, sDataLanc,
  sTipoFecha: WideString; bUsaPatro, bRateiaUnid: WordBool;
  cdsPlaSelecionadas: OleVariant;
  const FsMensAPS_Log: WideString): WordBool;
begin
   Try

       PrePlanilhaLA.cdsPlaSelecionadas.Data := cdsPlaSelecionadas;

       Result := PrePlanilhaLA.ProcessaPlaLancAuto(dEmp, dUsu, dModulo,
                                    dPlano,iPeriodo, iExercicio,sDataFim,
                                    sDataLanc, sTipoFecha,bUsaPatro,
                                    bRateiaUnid);

       If Result Then
       Begin
          _MessageInfo  := PrePlanilhaLA.sMensAPS_Log;
       End Else
         _MessageInfo  := PrePlanilhaLA.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.FazRateio(liEmpresa, liModulo, liUsuario,
  liCodPlano, liPlanilRateio, liPlanoPrev, liPatro, liSubContaCp,
  liSubContaRt, liUnidNegoc: Integer; const sDataLanc, sNumDoc, sTipoOper,
  sCcustoCp, sContaCp, sCodHist1Cp, sHist1Cp, sHist2Cp, sHist3Cp, sHist4Cp,
  sHist5Cp, sCcustoRt, sContaRt, sCodHistRt, sHist1Rt, sHist2Rt, sHist3Rt,
  sHist4Rt, sHist5Rt, sDebCre: WideString; dValor: Double; bJunta,
  bUsaPPatro: WordBool; var FRetornoPlnPlanil: Double): WordBool;
begin
   Try

       Result := Lancamento.FazRateio(liEmpresa, liModulo, liUsuario, liCodPlano,
                         liPlanilRateio, liPlanoPrev, liPatro,liSubContaCp, liSubContaRt,
                         liUnidNegoc, sDataLanc, sNumDoc, sTipoOper,sCcustoCp, sContaCp,
                         sCodHist1Cp, sHist1Cp, sHist2Cp, sHist3Cp, sHist4Cp, sHist5Cp,
                         sCcustoRt, sContaRt, sCodHistRt, sHist1Rt, sHist2Rt, sHist3Rt,
                         sHist4Rt, sHist5Rt,sDebCre,dValor,bJunta, bUsaPPatro);

       If Not Result Then
          _MessageInfo := Lancamento.MessageInfo
       Else
          _MessageInfo := FloatToStr(Lancamento.RetornoPlnPlanil);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GravarParamContab(cdsParamContab: OleVariant): WordBool;
begin
   Try

       ParamContab.cdsParamContab.Data := cdsParamContab;
       Result := ParamContab.Gravar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ExcluiPlanilhasNaData(iEmpresa,iUsuario, iModulo: Integer;
  bUsaPPatro: WordBool; var RetornaPlnCod: Double;
  FCdsPlanilhanaData: OleVariant): WordBool;
begin
   Try

      Planilha.cdsPlanilhaNaData.Data := FCdsPlanilhanaData;
      Result := Planilha.ExcluiPlanilhasNaData(iEmpresa,iUsuario, iModulo, bUsaPPatro);

      If Not Result Then
         _MessageInfo := Lancamento.MessageInfo
      Else
         _MessageInfo := FloatToStr(Planilha.RetornaPlnCod);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;


function TDtmContabSvr50.ImportaLancamentos(ArqTexto: OleVariant;
  dEmpresa: Double; iPlano, iUsuario, iModulo, iNumCommit: Integer;
  const sTipoOper, sCaminho: WideString; bTestaConta, bHistChecked,
  bUsaPPatro: WordBool; var FsMensAPS, FsMesAPS_Log: WideString): WordBool;
var
  StrlTexto :TStringList;

begin
   Try

       StrlTexto :=TStringList.Create;

       VariantToStringlist(ArqTexto, StrlTexto);
       Result := ProcessaContab.ImportaLancamentos(StrlTexto,dEmpresa,iPlano,iUsuario,
                                         iModulo,iNumCommit, sTipoOper, sCaminho, bTestaConta,
                                          bHistChecked, bUsaPPatro);

       If Result Then
       Begin
          _MessageInfo  := ProcessaContab.sMensAPS;
          _MessageInfo2 := ProcessaContab.sMensAPS_Log;
       End Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;
function TDtmContabSvr50.ImportaPlanilhaExcel(ArqTexto: OleVariant;
  dEmpresa: Double; iPlano, iModulo, iUsuario: Integer; const sDataLanc,
  sTipoOper: WideString; bUsaPPatro: WordBool;
  var ContaLinhaTexto: Integer; var LinhaTexto,
  sMensAdd: WideString): WordBool;
var
  StrlTexto :TStringList;
begin
   Try

       StrlTexto :=TStringList.Create;

       VariantToStringlist(ArqTexto, StrlTexto);
       Result := ProcessaContab.ImportaPlanilhaExcel(StrlTexto,dEmpresa,iPlano,iModulo,iUsuario,
                                                 sDataLanc,sTipoOper,bUsaPPatro);

       StrlTexto.Free;
       If not Result Then
         _MessageInfo  := IntToStr(ProcessaContab.ContaLinhaTexto) + ' - ' + ProcessaContab.LinhaTexto
       Else
         _MessageInfo := ProcessaContab.sMensAdd;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;


function TDtmContabSvr50.ImportaDadosRM(ArqTexto: OleVariant;
  dEmpresa: Double; iPlano, iModulo, iUsuario, rgVersao: Integer;
  const sTipoOper, sAtivProj, Caminho: WideString; bUsaPPatro: WordBool;
  FContaLinhaTexto: Integer; const FLinhaTexto: WideString): WordBool;
var
  StrlTexto :TStringList;
begin
   Try

       StrlTexto :=TStringList.Create;

       VariantToStringlist(ArqTexto, StrlTexto);

      Result := ProcessaContab.ImportaDadosRM(StrlTexto,dEmpresa,iPlano, iModulo,
                                          iUsuario, rgVersao,sTipoOper, sAtivProj,
                                          Caminho, bUsaPPatro);

      StrlTexto.Free;

      If not Result Then
         _MessageInfo  := IntToStr(ProcessaContab.ContaLinhaTexto) + ' - ' + ProcessaContab.LinhaTexto;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ImportaFidelio(ArqDiarias, ArqLanc: OleVariant;
  dEmpresa, dHotel: Double; iPlano, iUsuario: Integer;
  const Caminho: WideString; dtDataIni, dtDataFim: TDateTime;
  bUsaPPatro: WordBool; var FCodDC: WideString): WordBool;
begin
   Try

      ProcessaContab.cdsLancamentosDBF.Data := ArqLanc;
      ProcessaContab.cdsDiariasDBF.Data     := ArqDiarias;

      Result := ProcessaContab.ImportaFidelio(dEmpresa, dHotel,iPlano,iUsuario,Caminho,
                                            dtDataIni,dtDataFim,bUsaPPatro);
      If Not Result Then
         _MessageInfo := ProcessaContab.CodDC;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;


function TDtmContabSvr50.ProcAlteraDataPlanilha(dEmpresa, dModulo,dusuario,
  dPlnCodigo: Double; iExercicioNovo, iPeriodoNovo: Integer;
  const sDataNova, sDiaMes: WideString): WordBool;
begin
   Try

      Result := Planilha.ProcAlteraDataPlanilha(dEmpresa,dModulo,dUsuario,
                dPlnCodigo,iExercicioNovo, iPeriodoNovo, sDataNova, sDiaMes);
      If Not Result Then
         _MessageInfo := Planilha.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;


function TDtmContabSvr50.ProcAlteraDataPlanilha2(dEmpresa, dModulo,
  dPlnCodigo: Double; iExercicio, iPeriodo, iExercicioNovo, iPeriodoNovo,
  iUsuario: Integer; const sDataNova, sEfetivado, sMascaraContas,
  sDiaMes: WideString; bUsaPlanoPatro: WordBool): WordBool;
begin
   Try

      Result := Planilha.ProcAlteraDataPlanilha2(dEmpresa,dModulo, dPlnCodigo, iExercicio, iPeriodo,
                                    iExercicioNovo, iPeriodoNovo, iUsuario, sDataNova,
                                    sEfetivado, sMascaraContas, sDiaMes, bUsaPlanoPatro);
      If Not Result Then
         _MessageInfo := Planilha.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ConectaDB(const UserName, PassWord,
  ServerName: WideString): WordBool;
begin
  Result := _PadroesSrvr.ConectaDb(UserName, PassWord, ServerName);
end;

function TDtmContabSvr50.GravaLogOperacoes(dIdPessoa, dIdModulo,
  dIdUsuario: Double; const sDescOperacao: WideString): WordBool;
begin
    Result := _PadroesSrvr.GravaLogOperacoes(dIdPessoa, dIdModulo,
            dIdUsuario, sDescOperacao);
end;

function TDtmContabSvr50.GetDataPacket(
  const sSql: WideString): OleVariant;
begin
    Result := _PadroesSrvr.GetDataPacket(sSql);
end;

function TDtmContabSvr50.ProcessaPessoaAgencia(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaAgencia(Operacao,
            CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
            CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
            CdsImagensPessoa, CdsImagensDoc)
end;

function TDtmContabSvr50.ProcessaPessoaBanco(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.ProcessaPessoaBanco(Operacao,
              CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
              CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
              CdsImagensPessoa, CdsImagensDoc);
end;

function TDtmContabSvr50.ProcessaPessoaCliente(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli,
  CdsImAgregCli, CdsTiposCli: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.ProcessaPessoaCliente(Operacao,
              CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
              CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
              CdsImagensPessoa, CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli,
              CdsImAgregCli, CdsTiposCli)
end;

function TDtmContabSvr50.ProcessaPessoaForne(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc, CdsImAgregForn, CdsEmpresaForn,
  CdsFornXDesemb, CdsFornXRamo: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.ProcessaPessoaForne(Operacao,
              CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
              CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
              CdsImagensPessoa, CdsImagensDoc, CdsImAgregForn, CdsEmpresaForn,
              CdsFornXDesemb, CdsFornXRamo);
end;

function TDtmContabSvr50.ExecSqlAndCommit(
  const sSql: WideString): WordBool;
begin
    Result := _PadroesSrvr.ExecSqlAndCommit(sSql);
end;

function TDtmContabSvr50.ProcessaMensagem(CdsMensagem: OleVariant;
  iOperacaoMensage, IdMensagem: Integer): WordBool;
begin
    Result := _PadroesSrvr.ProcessaMensagem(CdsMensagem, iOperacaoMensage, IdMensagem);
end;

function TDtmContabSvr50.GravaHistSenha(
  aCdsHistSenha: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.GravaHistSenha(aCdsHistSenha);
end;

function TDtmContabSvr50.GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
  TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
  ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
  ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
  ovNaturalidade, ovBanco, ovDocumento,
  ovTipoDoc: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.GetDadosPessoa(rIdPessoa, TipoGetPessoa,
             TipoPessoa, ovPessoa, ovPessoaFisica, ovDocPessoa,
             ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
             ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
             ovNaturalidade, ovBanco, ovDocumento,
             ovTipoDoc);
end;

function TDtmContabSvr50.SelDadosCli(rIdEmpresa, rIdForcli: Double;
  out ovSubTipo, ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
  ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.SelDadosCli(rIdEmpresa, rIdForcli, ovSubTipo,
              ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
              ovImAgregCli, ovTipos, ovTiposCli);
end;

function TDtmContabSvr50.SelDadosForne(rIdEmpresa, rIdForCli: Double;
  out ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
  ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.SelDadosForne(rIdEmpresa, rIdForCli,
             ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
             ovTipoDesembForn, ovImAgregForn, ovRamoXForne);
end;

function TDtmContabSvr50.GetDataPacketTS(lSQL: OleVariant): OleVariant;
begin
    Result := _PadroesSrvr.GetDataPacketTS(lSQL);
end;

function TDtmContabSvr50.GetContentFile(
  const sFileName: WideString): WideString;
begin
    Result := _PadroesSrvr.GetContentFile(sFileName);
end;

procedure TDtmContabSvr50.MensagemPadroes(sMens: string);
begin
    _MessageInfo := sMens;
end;

function TDtmContabSvr50.MessageInfo: WideString;
begin
   Result := _MessageInfo;
end;

function TDtmContabSvr50.TestaConsistenciaLanc(IdEmpresa,IdModulo,IdUsuario: Double;
  IExercicio, iPeriodo: Integer): WordBool;
begin
   Try
      Result := ProcessaContab.TestaConsistenciaLanc(IdEmpresa,IdModulo,IdUsuario, iExercicio, iPeriodo);

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;


function TDtmContabSvr50.ProcessaRptAvisoLan(dEmpresa: Double; iExercicio,
  iPeriodo: Integer; bChecado: WordBool): WordBool;
begin
   Try
      Result := rptAvisoLan.ProcessaRptAvisoLan(dEmpresa, iExercicio, iPeriodo,bChecado);

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ProcessaDeletaRateioPlanPatro(iEmpresa,iModulo,iUsuario,
  iExercicio, iPeriodo: Integer): WordBool;
begin
   Try
     Result := ProcessaTotalPrev.ProcessaDeletaRateioPlanPatro(IEmpresa,iModulo,iUsuario,iExercicio,iPeriodo);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ProcessaGeraRateioPlanPatro(
  const sBilhete: WideString; iEmpresa,iModulo,iUsuario, iExercicio, iPeriodo,
  iSinal: Integer): WordBool;
begin
   Try
     Result := ProcessaTotalPrev.ProcessaGeraRateioPlanPatro(sBilhete,iEmpresa,iModulo,iUsuario,iExercicio,iPeriodo,iSinal);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ProcessaGeraLancamentoRateioPlanPatro(
  const sBilhete, sTipoOper: WideString; iEmpresa, iModulo,iUsuario, iPlanoPrev,
  iPatro, iExercicio, iPeriodo: Integer): WordBool;
begin
   Try
     Result := ProcessaTotalPrev.ProcessaGeraLancamentoRateioPlanPatro(sBilhete, sTipoOper,iEmpresa,iModulo,
                                   iUsuario,iPlanoPrev, iPatro,iExercicio, iPeriodo);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;
function TDtmContabSvr50.ProcessaGeraLancamentoRatAdmPlanPatro(
  const sBilhete, sTipoOper: WideString; IEmpresa, IModulo,iUsuario: Double;
  iExercicio, iPeriodo: Integer): WordBool;
begin
   Try
     Result := ProcessaTotalPrev.ProcessaGeraLancamentoRatAdmPlanPatro(sBilhete, sTipoOper,IEmpresa, IModulo,
                                   iUsuario,iExercicio, iPeriodo);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.AplicaOperacaoRatAdm(dEmpresa,dModulo,dUsuario :Double;Operacao: Integer; cdsPrin,
  cdsDet: OleVariant): WordBool;
begin
    Try

      ProcessaTotalPrev.CdsPrin.Data := CdsPrin;
      ProcessaTotalPrev.CdsDet.Data  := CdsDet;

      Result := ProcessaTotalPrev.AplicaOperacaoRatAdm(dEmpresa,dModulo,dUsuario,TOperacao(Operacao));

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.AplicaOperacaoSaldoCotas(dEmpresa,dModulo,dUsuario:Double;
  cdsPrin: OleVariant): WordBool;
begin
    Try

      ProcessaTotalPrev.CdsPrin.Data := CdsPrin;
      Result := ProcessaTotalPrev.AplicaOperacaoSaldoCotas(dEmpresa,dModulo,dUsuario);

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.IDtmContabSvr50_GravarSubConta(iUsuario: Double;
  bAssociaContas: WordBool; cdsSubConta: OleVariant): WordBool;
begin

end;

function TDtmContabSvr50.ImportaSaldoAnterior(ArqTexto: OleVariant;
  const sExercicio, sCaminho, sMascara: WideString; iPlano,
  iUsuario: Integer; dEmpresa,dModulo: Double;
  var FsMensAPS: WideString): WordBool;
var
  StrlTexto :TStringList;
begin
   Try
       StrlTexto :=TStringList.Create;

       VariantToStringlist(ArqTexto, StrlTexto);
       Result := ProcessaContab.ImportaSaldoAnterior(StrlTexto,sExercicio,sCaminho,
                                        sMascara,iPlano,iUsuario,dEmpresa,dModulo);
       If Result Then
       Begin
          _MessageInfo  := ProcessaContab.sMensAPS;
       End Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ImportaContaCorresp(ArqTexto: OleVariant;
  const sCaminho: WideString; iPlano: Integer; dEmpresa,dModulo,dUsuario: Double;
  var FsMensAPS: WideString): WordBool;
var
  StrlTexto :TStringList;
begin
   Try
       StrlTexto :=TStringList.Create;

       VariantToStringlist(ArqTexto, StrlTexto);
       Result := ProcessaContab.ImportaContaCorresp(StrlTexto,sCaminho,
                                        iPlano,dEmpresa,dModulo,dUsuario);
       If Result Then
       Begin
          _MessageInfo  := ProcessaContab.sMensAPS;
       End Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ImportaSAF(ArqTexto: OleVariant; const sTipoOper,
  sCaminho: WideString; iModulo, iUsuario, iPlano, iPlanoPrev, iPlanoPatro,
  iNumCommit, iContMax: Integer; dEmpresa: Double; bUsaPPatro,
  bTestaConta: WordBool; var FsMensAPS,
  FsMensAPS_Log: WideString): WordBool;
var
  StrlTexto :TStringList;
begin
   Try
       StrlTexto :=TStringList.Create;

       VariantToStringlist(ArqTexto, StrlTexto);
       Result := ProcessaContab.ImportaSAF(StrlTexto,sTipoOper, sCaminho,
                              iModulo, iUsuario, iPlano, iPlanoPrev, iPlanoPatro,
                              iNumCommit, iContMax, dEmpresa,bUsaPPatro, bTestaConta);


       If Result Then
       Begin
          _MessageInfo  := ProcessaContab.sMensAPS;
          _MessageInfo2 := ProcessaContab.sMensAPS_Log;
       End Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ImportaFolhaDinamica(ArqTexto: OleVariant;
  const sTipoOper, sCaminho: WideString; iModulo, iUsuario, iPlano,
  iContMax: Integer; dEmpresa: Double; bUsaPPatro, bTestaConta,
  bHistoChecado: WordBool; var FsMensAPS,
  FsMensAPS_Log: WideString): WordBool;
var
  StrlTexto :TStringList;
begin
   Try
       StrlTexto :=TStringList.Create;

       VariantToStringlist(ArqTexto, StrlTexto);
       Result := ProcessaContab.ImportaFolhaDinamica(StrlTexto,sTipoOper,
                             sCaminho,iModulo, iUsuario, iPlano,iContMax,
                             dEmpresa, bUsaPPatro, bTestaConta, bHistoChecado);


       If Result Then
       Begin
          _MessageInfo  := ProcessaContab.sMensAPS;
          _MessageInfo2 := ProcessaContab.sMensAPS_Log;
       End Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ImportaSRH(ArqTexto: OleVariant; const sTipoOper,
  sCaminho, sAtivProj: WideString; iModulo, iUsuario, iPlano,
  iContMax: Integer; dNumColunas, dEmpresa: Double; bUsaPPatro: WordBool;
  var FsMensAPS: WideString): WordBool;
var
  StrlTexto :TStringList;
begin
   Try
       StrlTexto :=TStringList.Create;

       VariantToStringlist(ArqTexto, StrlTexto);
       Result := ProcessaContab.ImportaSRH(StrlTexto,sTipoOper, sCaminho,
                       sAtivProj,iModulo, iUsuario, iPlano, iContMax,
                       dNumColunas, dEmpresa,bUsaPPatro);


       If Result Then
       Begin
          _MessageInfo  := ProcessaContab.sMensAPS;
       End Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.VerificaBloqueados(dEmpresa: Double;
  iUsuario: Integer; bUsaPPatro: WordBool;
  cdsVerificaBloqueados: OleVariant): WordBool;
begin
   Try
       ProcessaContab.cdsVerificaBloqueados.Data  := cdsVerificaBloqueados;
       Result := ProcessaContab.VerificaBloqueados(dEmpresa,iUsuario,bUsaPPatro);

       If Not Result Then
         _MessageInfo := ProcessaContab.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ApuraResultadoPer(dModulo,dEmpresa: Double; iUsuario,
  iPlano, iExercicio, iPeriodo: Integer; const sProgPrev, sCodHist,
  sDefTec, sResCont, sFormDefTec, sRevSupTecN, sFormSupTer, sFdoCobOscRisc,
  sResMat, sRevDefTec, sDataLanc: WideString; bUsaPPatro: WordBool;
  const FsMensAPS_Log: WideString): WordBool;
begin
   Try
       Result := ProcessaContab.ApuraResultadoPer(dModulo,dEmpresa,iUsuario,iPlano,
                        iExercicio,iPeriodo,sProgPrev, sCodHist, sDefTec,
                         sResCont, sFormDefTec, sRevSupTecN, sFormSupTer,
                         sFdoCobOscRisc, sResMat, sRevDefTec, sDataLanc,
                         bUsaPPatro);


       If Result Then
       Begin
          _MessageInfo  := ProcessaContab.sMensAPS_Log;
       End Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ProcessaAtuMoeda(dEmpresa,dModulo: Double; iUsuario,
  iPlano, iExercicio, iPeriodo: Integer; const sHistorico, sCodHist,
  sTipoOper, sTipoFecha, sDataLanc, sPerdaGanho: WideString; dtDataIni,
  dtDataFim: TDateTime; bUsaPPatro: WordBool; const FsMensAPS_Log: WideString): WordBool;
begin
   Try
       Result := ProcessaContab.ProcessaAtuMoeda(dEmpresa,dModulo,iUsuario,iPlano,
                    iExercicio, iPeriodo,sHistorico, sCodHist, sTipoOper,
                    sTipoFecha, sDataLanc, sPerdaGanho,dtDataIni,
                    dtDataFim,bUsaPPatro);


       If Result Then
       Begin
          _MessageInfo  := ProcessaContab.sMensAPS_Log;
       End Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.GeraSaldoCalculado(dEmpresa,dModulo,dUsuario: Double; iExercicio,
  iPeriodo: Integer; const sMascara: WideString; bSubConta,
  bCCusto: WordBool): WordBool;
begin
   Try
       Result := ProcessaContab.GeraSaldoCalculado(dEmpresa,dModulo,dUsuario,iExercicio,iPeriodo,
                                          sMascara,bSubConta, bCCusto);

       If Not Result Then
         _MessageInfo := ProcessaContab.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.LancaMeiaNoite(dEmpresa: Double; iUsuario, iPlano,
  IExercicio, iPeriodo: Integer; const sProgPrev, sCodHist, sDefTec,
  sDefTecA, sResCont, sResContA, sFormDefTec, sRevSupTecN, sFormSupTec,
  sFdoCobOscRisc, sFdoCobOscRiscA, sResMat, sRevDefTec,
  sDataLanc: WideString; bUsaPPatro: WordBool;
  const FsMensAPS_Log: WideString): WordBool;
begin

   Try
       Result := ProcessaContab.LancaMeiaNoite(dEmpresa,iUsuario,iPlano,iExercicio,
                     iPeriodo,sProgPrev, sCodHist,sDefTec, sDefTecA, sResCont,
                     sResContA, sFormDefTec, sRevSupTecN, sFormSupTec, sFdoCobOscRisc,
                     sFdoCobOscRiscA, sResMat, sRevDefTec,sDataLanc,bUsaPPatro);


       If Result Then
          _MessageInfo  := ProcessaContab.sMensAPS_Log
       Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GravarRateioAtivProj(dEmpresa,dModulo,dUsuario: Double;
  iCodMoeda: Integer; FcdsRateioAtivProj: OleVariant): WordBool;
begin
   Try
       RateioAtivProj.cdsRateioAtivProj.Data  := FcdsRateioAtivProj;
       Result := RateioAtivProj.Gravar(dEmpresa,dModulo,dUsuario,iCodMoeda);

       If Not Result Then
         _MessageInfo := RateioAtivProj.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;


function TDtmContabSvr50.RemoveRateioPorPeriodo(dEmpresa,dModulo,dUsuario: Double;
  iExercicio, iPeriodo: Integer): WordBool;
begin
   Try
       Result := ProcessaContab.RemoveRateioPorPeriodo(dEmpresa,dModulo,dUsuario,iExercicio,iPeriodo);

       If not Result Then
         _MessageInfo  := ProcessaContab.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GeraRateioPorPeriodo(dEmpresa,dModulo,dUsuario: Double; iCodMoeda,
  iSinal, iExercicio, iPeriodo: Integer; const sDataLanc,
  FsMensAPS_Log: WideString): WordBool;
begin
   Try
       Result := ProcessaContab.GeraRateioPorPeriodo(dEmpresa,dModulo,dUsuario,iCodMoeda,iSinal,
                               iExercicio,iPeriodo,sDataLanc);

       If Result Then
          _MessageInfo  := ProcessaContab.sMensAPS_Log
       Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GeraLancaRateioAtivProj(dEmpresa: Double;
  iUsuario, iPlano, iExercicio, iPeriodo, iUnidNegoc: Integer;
  const sTipoOper, sDataLanc: WideString; bUsaPPatro: WordBool;
  const FsMensAPP_Log: WideString): WordBool;
begin

   Try
       Result := ProcessaContab.GeraLancaRateioAtivProj(dEmpresa,iUsuario, iPlano,
                                iExercicio, iPeriodo, iUnidNegoc,sTipoOper,sDataLanc,
                                bUsaPPatro);

       If Result Then
          _MessageInfo  := ProcessaContab.sMensAPS_Log
       Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GravarRateioApExtra(dEmpresa,dModulo,dUsuario:Double;cdsMestre,
  cdsDetalhe: OleVariant): WordBool;
begin

   Try
       RateioApExtra.cdsMestre.Data   := cdsMestre;
       RateioApExtra.cdsDetalhe.Data  := cdsDetalhe;
       result := RateioApExtra.Gravar(dEmpresa,dModulo,dUsuario);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GeraLancaRateioADM(dEmpresa,dModulo: Double; iUsuario,
  iPlano, iExercicio, iPeriodo: Integer; const sTipoOper,
  sDataLanc: WideString; bUsaPPatro: WordBool;
  const FsMensAPS_Log: WideString): WordBool;
begin

   Try
       Result := ProcessaContab.GeraLancaRateioADM(dEmpresa,dModulo,iUsuario,iPlano,
                            iExercicio, iPeriodo, sTipoOper,sDataLanc, bUsaPPatro);

       If Result Then
          _MessageInfo  := ProcessaContab.sMensAPS_Log
       Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GeraRateioPorPrograma(dEmpresa,dModulo: Double; iUsuario,
  iPlano, IExercicio, iPeriodo: Integer; const sTipoOper,
  sDataGera: WideString; bUsaPPatro: WordBool;
  const FsMensAPS_Log: WideString): WordBool;
begin
   Try
       Result := ProcessaContab.GeraRateioPorPrograma(dEmpresa,dModulo,iUsuario,iPlano,
                            iExercicio, iPeriodo, sTipoOper,sDataGera, bUsaPPatro);

       If Result Then
          _MessageInfo  := ProcessaContab.sMensAPS_Log
       Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GeraRateioPPrevePatro(dEmpresa: Double; iUsuario,
  iPlano, iExercicio, iPeriodo: Integer; const sTipoOper, sDataGera,
  sTipoFecha: WideString; bUsaPPatro: WordBool;
  const FsMensAPS_Log: WideString): WordBool;
begin
   Try
       Result := ProcessaContab.GeraRateioPorPPrevePatro(dEmpresa,iUsuario,iPlano,
                            iExercicio, iPeriodo, sTipoOper,sDataGera,sTipoFecha,
                             bUsaPPatro);

       If Result Then
          _MessageInfo  := ProcessaContab.sMensAPS_Log
       Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.GeraLancaConsolidado(dEmpresa: Double; iUsuario,
  iPlano, iExercicio, iPeriodo: Integer; const sTipoOper, sDataLanc,
  sMascara: WideString; bUsaPPatro, bOrcamento, bConsoUnidNegoc,
  bConsoSubConta: WordBool; cdsEmpresasSel: OleVariant): WordBool;
begin

   Try
       ProcessaContab.cdsEmpresasSel.Data  := cdsEmpresasSel;
       Result := ProcessaContab.GeraLancaConsolidado(dEmpresa,iUsuario,iPlano,
                   iExercicio,iPeriodo,sTipoOper, sDataLanc,sMascara,
                   bUsaPPatro, bOrcamento, bConsoUnidNegoc,bConsoSubConta);

       If Not Result Then
         _MessageInfo := ProcessaContab.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;


function TDtmContabSvr50.GravarPlanoData(
  cdsPlanoData: OleVariant): WordBool;
begin
   Try
      PlanoData.cdsPlanoData.Data := cdsPlanoData;
      result := PlanoData.Gravar;

     If Not Result Then
       _MessageInfo := PlanoData.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GravarPlanoDePara(
  cdsPlanoDePara: OleVariant): WordBool;
begin
   Try
      PlanoDePara.cdsPlanoDePara.Data := cdsPlanoDePara;
      result := PlanoDePara.Gravar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.AlteraPlanoConta(dEmpresa, dUsuario: Double;
  const sMascara, sDataRef: WideString; iPlano, iPlanoVigente,
  IExercicio: Integer; bMesmoPlano, bMesmosCCSC, bGeraLancSaldoAnt,
  bSoSaldoAnt: WordBool): WordBool;
begin
   Try
       Result := ProcessaContab.AlteraPlanoConta(dEmpresa,dUsuario,sMascara,sDataRef,
                           iPlano,iPlanoVigente,iExercicio, bMesmoPlano,bMesmosCCSC,
                           bGeraLancSaldoAnt,bSoSaldoAnt);

       If not Result Then
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.GravarTabelaDePara(cdsMestre,
  cdsDetalhe: OleVariant): WordBool;
begin
      Try

       TabelaDePara.cdsDetalhe.Data  := cdsDetalhe;
       TabelaDePara.cdsMestre.Data   := cdsMestre;
       result := TabelaDePara.Gravar;

       If not Result Then
         _MessageInfo  := TabelaDePara.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ApagarTabelaDePara(cdsMestre,
  cdsDetalhe: OleVariant): WordBool;
begin
      Try

       TabelaDePara.cdsDetalhe.Data  := cdsDetalhe;
       TabelaDePara.cdsMestre.Data   := cdsMestre;
       result := TabelaDePara.Apagar;

       If not Result Then
         _MessageInfo  := TabelaDePara.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;


function TDtmContabSvr50.ImportaPlanoContas(ArqTexto: OleVariant;
  const sMascara, sCaminho: WideString; iPlano: Integer; dEmpresa,dModulo,dUsuario: Double;
  var FsMensAPS: WideString): WordBool;
var
  StrlTexto :TStringList;

begin

   Try
       StrlTexto :=TStringList.Create;

       VariantToStringlist(ArqTexto, StrlTexto);
       Result := ProcessaContab.ImportaPlanoContas(StrlTexto,sMascara,sCaminho,iPlano,
                                                  dEmpresa,dModulo,dUsuario);
       If Result Then
       Begin
          _MessageInfo  := ProcessaContab.sMensAPS;
       End Else
         _MessageInfo  := ProcessaContab.MessageInfo;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;
function TDtmContabSvr50.ApagarRateioApExtra(dEmpresa,dModulo,dUsuario :Double;cdsDetalhe,
  cdsMestre: OleVariant): WordBool;
begin
   Try
       RateioApExtra.cdsDetalhe.Data  := cdsDetalhe;
       RateioApExtra.cdsMestre.Data   := cdsMestre;
       result := RateioApExtra.Apagar(dEmpresa,dModulo,dUsuario);
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.ProcessaDepositoVHF(dEmpresa: Double; iPlano,
  IExercicio, iPeriodo, iHotel, iUsuario: Integer;
  const sDataLanc: WideString; dtDataIni, dtDataFim: TDateTime): WordBool;
begin

   Try
       Result := ProcessaContab.ProcessaDepositoVHF(dEmpresa,iPlano,IExercicio,
                         iPeriodo,iHotel,iUsuario,sDataLanc,dtDataIni,dtDataFim);

       If not Result Then
         _MessageInfo  := ProcessaContab.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.AtuCodigoReduzido(dEmpresa,dModulo,dUsuario: Double; iPlano,
  rgRenumera: Integer): WordBool;
begin
   Try
       Result := ProcessaContab.AtuCodigoReduzido(dEmpresa,dModulo,dUsuario,iPlano,rgRenumera);

       If not Result Then
         _MessageInfo  := ProcessaContab.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.AcertaNumPlanilha(dEmpresa,dModulo,dUsuario: Double; iPlano,
  iExercicio, iPeriodo: Integer; const sPacDiaMes: WideString): WordBool;
begin
   Try
       Result := ProcessaContab.AcertaNumPlanilha(dEmpresa,dModulo,dUsuario,iPlano,iExercicio,
                                    iPeriodo,sPacDiaMes);

       If not Result Then
         _MessageInfo  := ProcessaContab.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.FazEstorno(dUsuario, dCodPlanilha, dModulo,
  dEmpresa: Double; bUsaPPatro: WordBool;
  const sDataEstorno: WideString): WordBool;
begin
   Try
       Result := ProcessaContab.FazEstorno(dUsuario, dCodPlanilha, dModulo,
                                            dEmpresa, bUsaPPatro,sDataEstorno);

       If not Result Then
         _MessageInfo  := ProcessaContab.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;
//===
function TDtmContabSvr50.ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
  ovPassoWorkflow: OleVariant; oPeracao: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
            ovPassoWorkflow, oPeracao);
end;

function TDtmContabSvr50.ProcessaGrupoUsu(ovDataViewAcesso,
  ovTabelaAcesso, ovColunaAcesso, ovGrupo, ovUsuario, ovPessoa,
  ovGrupoXUsu, ovAutoriza, ovAutorizaRpt, ovAutorizaMS: OleVariant;
  OperacaoProcessa: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaGrupoUsu(ovDataViewAcesso,
            ovTabelaAcesso, ovColunaAcesso, ovGrupo, ovUsuario, ovPessoa,
            ovGrupoXUsu, ovAutoriza, ovAutorizaRpt, ovAutorizaMS, OperacaoProcessa);
end;

function TDtmContabSvr50.GravarReports(ovCds: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.GravarReports(ovCds);
end;

function TDtmContabSvr50.ProcurarReports(IdReports,
  OrigemCm: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcurarReports(IdReports, OrigemCm);
end;

function TDtmContabSvr50.ProcessaConfig(ovCds, ovCdsReport: OleVariant;
  Operacao: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaConfig(ovCds, ovCdsReport, Operacao);
end;

function TDtmContabSvr50.ProcessaConfigModelo(
  ovReports: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaConfigModelo(ovReports);
end;



function TDtmContabSvr50.ApagarDesenhoDemo(CdsDEsenhoDemo,
  CdsReports: OleVariant): WordBool;
begin
   Try
       DesenhoDemo.CdsDesenhoDemo.Data  := CdsDesenhoDemo;
       DesenhoDemo.CdsReports.Data      := CdsReports;
       result := DesenhoDemo.Apagar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.AtualizaParamContab(dEmpresa,dPlnCodigo: Double): WordBool;
begin
   Try
       Result := ProcessaContab.AtualizaParamContab(dEmpresa,dPlnCodigo);

       If not Result Then
         _MessageInfo  := ProcessaContab.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.AlteraMovimAnterior(idPlanosaldo, dDebitoCorrente,
  dCreditoCor: Double): WordBool;
begin

   Try

       result := PlanoSaldo.AlteraMovimAnterior(idPlanosaldo, dDebitoCorrente,dCreditoCor);

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.AlteraSaldoAnterior(dEmpresa,dModulo,dUsuario,idPlanoSaldo, dDebitoCorrente,
  dCreditoCor, dDebitoOficial, dCreditoOficial, dDebitoHist, dCreditoHist,
  dDebitoGer, dCreditoGer, dDebitoGeren1, dCreditoGeren1, dDebitoGeren2,
  dCreditoGeren2: Double): WordBool;
begin
   Try

       result := PlanoSaldo.AlteraSaldoAnterior(dEmpresa,dModulo,dUsuario,idPlanoSaldo, dDebitoCorrente,
                                  dCreditoCor, dDebitoOficial, dCreditoOficial, dDebitoHist, dCreditoHist,
                                  dDebitoGer, dCreditoGer, dDebitoGeren1, dCreditoGeren1, dDebitoGeren2,
                                  dCreditoGeren2);

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GravarDiasBloqMod(cdsDiasBloqMod: OleVariant): WordBool;
begin
   Try
       DiasBloqMod.cdsDiasBloqMod.Data  := cdsDiasBloqMod;
       result := cdsDiasBloqMod.Gravar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;


end;

function TDtmContabSvr50.ApagarPlanoContaPer(
  CdsPlanoContaPer: OleVariant): WordBool;
begin
   Try
       PlanoContaPer.cdsPlanoContaPer.Data   := CdsPlanoContaPer;
       result := PlanoContaPer.Apagar;
   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

function TDtmContabSvr50.GravarPlanoContaPer(iEmpresa, iUsuario, iModulo,
  iPlano, iPeriodo: Integer; const NomeContaAnal, ComplContaAnal, Conta,
  MascaraPlano, DataIni: WideString; UsaPPatro: WordBool;
  cdsPlanoContaPer: OleVariant): WordBool;
begin
   Try
       PlanoContaPer.cdsPlanoContaPer.Data   := CdsPlanoContaPer;
       result := PlanoContaPer.Gravar(iEmpresa,iUsuario, iModulo,iPlano,
                         iPeriodo,NomeContaAnal, ComplContaAnal, Conta,
                         MascaraPlano, DataIni,UsaPPatro);

      If not Result Then
         _MessageInfo  := PlanoContaPer.MessageInfo;

   Except
     On E:Exception Do
     Begin
       Result := False;
       _MessageInfo := E.Message;
     End;
   End;

end;

initialization
  TComponentFactory.Create(ComServer, TDtmContabSvr50,
    Class_DtmContabSvr50, ciMultiInstance, tmApartment);
end.
