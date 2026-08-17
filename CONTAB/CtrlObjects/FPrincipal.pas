unit FPrincipal;

interface
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 24/05/08
  Rotina       :
  Pendência    : -
  Solução      : Retirado o menu importação do SAF
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Rodolpho da Silva
  Data         : 17/02/2005
  Rotina       :
  Pendência    : 18481
  Solução      : Transferido o item de  menu "Faixa de Datas do Plano Contábil"
                 De  :  Processamentos\De/Para Plano de Contas
                 Para: Cadastros
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: andré tavares
  Data         : 16/08/2004
  Rotina       :
  Pendência    : 16888
  Solução      : Adicionado os forms FExportaContab e FExcluiContab
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: andré tavares
  Data         : 13/08/2004
  Rotina       : GerararquivoSPCCAP1Click
  Pendência    : 16351
  Solução      : (ajuste)
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: andré tavares
  Data         : 11/05/2004
  Rotina       : GerararquivoSPCCAP1Click
  Pendência    : 16351
  Solução      : Implementação e incorporação ao projeto do novo layout de exportação de balancete SIC-CAP spc
------------------------------------------------------------------------------}

{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 06/01/04
  Rotina       : AppPadraoAfterLogin
  Pendência    : 14451
  Solução      : Nova estrutura de menus para a nova segregação
                 Habilitar os menus de segregação de acordo com parâmetro global
                 Retirados diversos ítens de menu.
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 05/12/03
  Pendência    : 14451
  Solução      : Nova estrutura de menus para a nova segregação
                 Retirados todas as referencias da segração por atividade
                 projeto, utilizada apenas pela CBS.
------------------------------------------------------------------------------}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, FCMPrincipal, TB97, USistema, Db,
  DBTables, Wwquery, Wwdatsrc, wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls,
  TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic, IvMulti,
  IvEMulti, CorreioCM, fcLabel, AppEvnts, StdActns, ActnList, ImgList,uModulo,
  fcStatusBar, CMApplicationEvents, DBClient, MConnect,ucmrptmanager,
  uCtrlParamIntegra, SConnect,  uCmSqlParams,  uCMClientDataSet,
  uCMTypes, uResource, FWizRenumPlanil, CMNetUsers, uCtrlParamContab;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuHistricoPadro: TMenuItem;
    mnuSubgrupos: TMenuItem;
    mnuSaldoAnterior: TMenuItem;
    mnuPerodosContbeis: TMenuItem;
    N3: TMenuItem;
    mnuTermosdoDirio: TMenuItem;
    mnuCadPlanilhas: TMenuItem;
    mnuRegras: TMenuItem;
    mnuCadPrePronta: TMenuItem;
    mnuCadRateio: TMenuItem;
    mnuQualificaodePlanos: TMenuItem;
    N4: TMenuItem;
    Lanamentos1: TMenuItem;
    mnuPlanilha: TMenuItem;
    mnuProcessamentos: TMenuItem;
    mnuAtualizaSaldo: TMenuItem;
    N5: TMenuItem;
    mnuIntegra: TMenuItem;
    mnuLancamento: TMenuItem;
    mnuPrePronta: TMenuItem;
    mnuRateio: TMenuItem;
    N6: TMenuItem;
    mnuSubconta: TMenuItem;
    mnuAtualizaMoeda: TMenuItem;
    N7: TMenuItem;
    mnuOramento: TMenuItem;
    mnuEncerraPerodo: TMenuItem;
    mnuEncerraExerccio: TMenuItem;
    mnuEncerraContasdeResultado: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    mnuDemontrativo: TMenuItem;
    mnuElementosdoDemonstrativo: TMenuItem;
    Dia1: TMenuItem;
    Planilha1: TMenuItem;
    Importar1: TMenuItem;
    Lanamentos2: TMenuItem;
    PlanodeContas1: TMenuItem;
    SaldoAnterior1: TMenuItem;
    LanamentoAutomtico1: TMenuItem;
    Automtico1: TMenuItem;
    mnuApuracaoP: TMenuItem;
    ConsisteRegras1: TMenuItem;
    GerararquivoSPCCAP1: TMenuItem;
    LanamentosModelo21: TMenuItem;
    LanamentosModelo31: TMenuItem;
    AtualizaSaldoAnaltica1: TMenuItem;
    N11: TMenuItem;
    VerificaLanamentos1: TMenuItem;
    Saldos1: TMenuItem;
    N13: TMenuItem;
    ColunasdoDemonstrativo1: TMenuItem;
    LinhasdoDemonstrativoColunado1: TMenuItem;
    PlanodeContasNovo1: TMenuItem;
    Toolbar971: TToolbar97;
    tbtnAtuAnal: TToolbarButton97;
    tbtnLancamentos: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    tbtnAtuSin: TToolbarButton97;
    tbtnRateio: TToolbarButton97;
    tbtnPrePronta: TToolbarButton97;
    tbtnAutomatica: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    tbtnIntegraDia: TToolbarButton97;
    tbtnOrcamento: TToolbarButton97;
    ToolbarSep974: TToolbarSep97;
    tbtnIntegraPlanilha: TToolbarButton97;
    tbtnEncerraPer: TToolbarButton97;
    ToolbarSep975: TToolbarSep97;
    tbtnConsultaLanc: TToolbarButton97;
    tbtnConsultaSaldo: TToolbarButton97;
    tbtnAtuMoeda: TToolbarButton97;
    MovimentodosExercciosAnteriores1: TMenuItem;
    tbtnContas: TToolbarButton97;
    N10: TMenuItem;
    RateioporAtividadeProjeto1: TMenuItem;
    SaldoAnteior1: TMenuItem;
    GeraRateioporPerodo1: TMenuItem;
    GeraLanamentosdoRateio1: TMenuItem;
    PercentuaisdoRateio1: TMenuItem;
    N14: TMenuItem;
    GeraLanamentosdoRateioAdministrativo1: TMenuItem;
    N15: TMenuItem;
    LayoutsdosDemonstrativos1: TMenuItem;
    GeraSaldoCalculadoporPerodo1: TMenuItem;
    ContaCorrespondente1: TMenuItem;
    AlteraodeData1: TMenuItem;
    ElementosdoBalanoPatrimonial1: TMenuItem;
    N17: TMenuItem;
    GeraodeLanamentosdoConsolidado1: TMenuItem;
    DeParadoPlanodecontas1: TMenuItem;
    DeParadeContas1: TMenuItem;
    AlterarPlanodeContas1: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    VerificaPlanilhasemPreodosBloqueados1: TMenuItem;
    TabelasdaContabilidade1: TMenuItem;
    RateioporPrograma1: TMenuItem;
    RateioporPrograma2: TMenuItem;
    Fidlio1: TMenuItem;
    RateioporPlanoePatrocinadora1: TMenuItem;
    RateioporPlanoePatrocinadora2: TMenuItem;
    ExclusodePlanilhasporFaixa1: TMenuItem;
    AtualizaCdigosReduzidos1: TMenuItem;
    AtualizaNumeraodasPlanilhas1: TMenuItem;
    SAF1: TMenuItem;
    LanamentodaMeiaNoite1: TMenuItem;
    LanamentosFolhaDinamica1: TMenuItem;
    N1: TMenuItem;
    AgrupamentoeDesmembramentodeContas1: TMenuItem;
    Exportaes1: TMenuItem;
    LanamentosSRHPlus1: TMenuItem;
    Eventos1: TMenuItem;
    Importao1: TMenuItem;
    SegregaoporPlanoePatrocinadora1: TMenuItem;
    GeraValordaCota1: TMenuItem;
    GeraosLanamentosdeSegregao1: TMenuItem;
    CadastrodeSaldodeCotas1: TMenuItem;
    ExportaContabil: TMenuItem;
    N2: TMenuItem;
    PercentuaisdoRateioAdministrativoporPlanoePatrocinadora1: TMenuItem;
    GeraLanamentosdoRateioAdministrativoporPlanoePatrocinadora1: TMenuItem;
    mnuValoresOrcados1: TMenuItem;
    DiasBloqueadosporMdulo1: TMenuItem;
    mnuSegregacaoRecursos: TMenuItem;
    MnuSegregaodeRecursos: TMenuItem;
    mnuCriterioSegregacao: TMenuItem;
    mnuCotacaoCriterio: TMenuItem;
    N12: TMenuItem;
    mnuFluxoFinanceiro: TMenuItem;
    SICCAP1: TMenuItem;
    SICCAPModelo20041: TMenuItem;
    ExclusodeExportaoContbil1: TMenuItem;
    mnuProcRentabilidadeContabil: TMenuItem;
    mnuCadRentabilidadeContabil: TMenuItem;
    FaixadeDatasdoPlanoContbil1: TMenuItem;
    mnuProcessaSegregao: TMenuItem;
    mnuAjustePlanilhaDiverg: TMenuItem;
    N16: TMenuItem;
    AtivarNumeraodePlanilhasPorSeqence1: TMenuItem;
    Button1: TButton;
    mnuIncluiApur: TMenuItem;
    N18: TMenuItem;
    mnuExcluiApur: TMenuItem;
    procedure mnuSubgruposClick(Sender: TObject);
    procedure nmuParametrosClick(Sender: TObject);
    procedure mnuQualificaodePlanosClick(Sender: TObject);
    procedure mnuPerodosContbeisClick(Sender: TObject);
    procedure mnuSaldoAnteriorClick(Sender: TObject);
    procedure mnuHistricoPadroClick(Sender: TObject);
    procedure mnuTermosdoDirioClick(Sender: TObject);
    procedure mnuCadPreProntaClick(Sender: TObject);
    procedure mnuCadRateioClick(Sender: TObject);
    procedure mnuLancamentoClick(Sender: TObject);
    procedure mnuAtualizaSaldoClick(Sender: TObject);
    procedure mnuPreProntaClick(Sender: TObject);
    procedure mnuRateioClick(Sender: TObject);
    procedure mnuSubcontaClick(Sender: TObject);
    procedure mnuAtualizaMoedaClick(Sender: TObject);
    procedure mnuOramentoClick(Sender: TObject);
    procedure mnuEncerraPerodoClick(Sender: TObject);
    procedure mnuEncerraExerccioClick(Sender: TObject);
    procedure mnuEncerraContasdeResultadoClick(Sender: TObject);
    procedure mnuDemontrativoClick(Sender: TObject);
    procedure mnuElementosdoDemonstrativoClick(Sender: TObject);
    procedure Dia1Click(Sender: TObject);
    procedure Planilha1Click(Sender: TObject);
    procedure mnuRegrasClick(Sender: TObject);
    procedure Lanamentos2Click(Sender: TObject);
    procedure PlanodeContas1Click(Sender: TObject);
    procedure SaldoAnterior1Click(Sender: TObject);
    procedure LanamentoAutomtico1Click(Sender: TObject);
    procedure Automtico1Click(Sender: TObject);
    procedure ConsisteRegras1Click(Sender: TObject);
    procedure GerararquivoSPCCAP1Click(Sender: TObject);
    procedure LanamentosModelo21Click(Sender: TObject);
    procedure LanamentosModelo31Click(Sender: TObject);
    procedure AtualizaSaldoAnaltica1Click(Sender: TObject);
    procedure VerificaLanamentos1Click(Sender: TObject);
    procedure Lanamentos1Click(Sender: TObject);
    procedure Saldos1Click(Sender: TObject);
    procedure ColunasdoDemonstrativo1Click(Sender: TObject);
    procedure LinhasdoDemonstrativoColunado1Click(Sender: TObject);
    procedure PlanodeContasNovo1Click(Sender: TObject);
    procedure MovimentodosExercciosAnteriores1Click(Sender: TObject);
    procedure BarradeAtalhos1Click(Sender: TObject);
    procedure SaldoAnteior1Click(Sender: TObject);
    procedure GeraRateioporPerodo1Click(Sender: TObject);
    procedure GeraLanamentosdoRateio1Click(Sender: TObject);
    procedure PercentuaisdoRateio1Click(Sender: TObject);
    procedure GeraLanamentosdoRateioAdministrativo1Click(Sender: TObject);
    procedure LayoutsdosDemonstrativos1Click(Sender: TObject);
    procedure GeraSaldoCalculadoporPerodo1Click(Sender: TObject);
    procedure ContaCorrespondente1Click(Sender: TObject);
    procedure AlteraodeData1Click(Sender: TObject);
    procedure ElementosdoBalanoPatrimonial1Click(Sender: TObject);
    procedure GeraodeLanamentosdoConsolidado1Click(Sender: TObject);
    procedure DeParadeContas1Click(Sender: TObject);
    procedure AlterarPlanodeContas1Click(Sender: TObject);
    procedure VerificaPlanilhasemPreodosBloqueados1Click(Sender: TObject);
    procedure TabelasdaContabilidade1Click(Sender: TObject);
    procedure RateioporPrograma1Click(Sender: TObject);
    procedure RateioporPrograma2Click(Sender: TObject);
    procedure Fidlio1Click(Sender: TObject);
    procedure RateioporPlanoePatrocinadora1Click(Sender: TObject);
    procedure RateioporPlanoePatrocinadora2Click(Sender: TObject);
    procedure AtualizaCdigosReduzidos1Click(Sender: TObject);
    procedure AtualizaNumeraodasPlanilhas1Click(Sender: TObject);
    procedure SAF1Click(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure LanamentodaMeiaNoite1Click(Sender: TObject);
    procedure ExclusodePlanilhasporFaixa1Click(Sender: TObject);
    procedure LanamentosFolhaDinamica1Click(Sender: TObject);
    procedure AgrupamentoeDesmembramentodeContas1Click(Sender: TObject);
    procedure Eventos1Click(Sender: TObject);
    procedure Importao1Click(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure GeraValordaCota1Click(Sender: TObject);
    procedure GeraosLanamentosdeSegregao1Click(Sender: TObject);
    procedure CadastrodeSaldodeCotas1Click(Sender: TObject);
    procedure PercentuaisdoRateioAdministrativoporPlanoePatrocinadora1Click(
      Sender: TObject);
    procedure GeraLanamentosdoRateioAdministrativoporPlanoePatrocinadora1Click(
      Sender: TObject);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure mnuValoresOrcados1Click(Sender: TObject);
    procedure DiasBloqueadosporMdulo1Click(Sender: TObject);
    procedure mnuCriterioSegregacaoClick(Sender: TObject);
    procedure mnuCotacaoCriterioClick(Sender: TObject);
    procedure mnuFluxoFinanceiroClick(Sender: TObject);
    procedure SICCAP1Click(Sender: TObject);
    procedure SICCAPModelo20041Click(Sender: TObject);
    procedure ExportaContabilClick(Sender: TObject);
    procedure ExclusodeExportaoContbil1Click(Sender: TObject);
    procedure mnuProcRentabilidadeContabilClick(Sender: TObject);
    procedure mnuCadRentabilidadeContabilClick(Sender: TObject);
    procedure FaixadeDatasdoPlanoContbil1Click(Sender: TObject);
    procedure mnuProcessaSegregaoClick(Sender: TObject);
    procedure AjustedePlanilhasDivergentes1Click(Sender: TObject);
    procedure AtivarNumeraodePlanilhasPorSeqence1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuIncluiApurClick(Sender: TObject);
    procedure mnuExcluiApurClick(Sender: TObject);
  private
    bFlgPlnSequence : Boolean;
    procedure VerificaBloqueados;
  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

// Alex 23/06 - retirado - qual era o motivo desta diretiva ? {$R Principal.res}

uses
  //*************************** realtorios *************************************
  FParamRazaoSint,      FParamRazaoAnal,      FParamConfCotas,      FParamDiario,
  FParamPlanilhas,      FParamBalanco,        FParamBalancete,      FParamRazaoCCusto,
  FParamConfSubConta,   FParamListaDemonst,   FParamSaldoInicial,   FParamDiarioResumido,
  FParamOrcamento,      FParamBalanceteCxSC,  FParamBalConsolidado, FParamBalanceteColMesCC,
  FParamDemonstrativo1, FParamDemonstrativo4, FParamDemonstrativo5, FParamRazaoAnalSimples,
  FParamOrcamentoCC,    FParamBalanceteCad,   FParamBalanceteCCxC,  FParamBalanceteCol,
  FParamBalanceteCxCC,  FParamDemonstrativo2, FParamDemonstrativo3, FParamBalanceteAnalAPSC,
  FParamDemonstrativo6, FParamDemoLayout,     FParamBalanceteAPCC,  FParamBalanceteCxAP,
  FParamSaldosAtuais,   FParamAvisoLan,       FParamMapaEvolu,      FParamCCConta,
  FParamContaCC,        FParamHistorico,      FParamPeriodo,        FParamSubConta,
  FParamPlanoContas,    FParamDemonstrativo7,
  //*************************** cadastros **************************************
  FCadHistoricoMT,         FCadContasContabMT,
  FCadPlanoContasMT,       FCadTermoDiarioMT,   FCadPeriodoContabilMT,  FCadLancPreProntaMT,
  FCadSubGrupoMT,          FCadSubContaMT,      FCadDemonstrativoMT,    FCadSPCConsiste,
  FCadSaldoAnteriorMT,     FCadLinhasDemoMT,    FCadElemDemoMT,
  FCadOrcamentoContabilMT, FCadLayoutDemoMT,    FCadMovAnteriorMT,      FCadParamContabMT,
  FCadPlanilPreProntaMT,   FCadPlanilRateioMT,  FCadLancamAutomMT,      FCadRateioPlanPrevMT,
  FCadLancRateioMT,        FCadRateioProgMT,    FAtualizaMoedaMT,       FImportaOrcadoExcelMT,
  FCadDiasBloqModMT,
  FCadDemo2ColunasMT,      FCadColunasDemoMT,   FParamDemoSPC,          FBalPatrSPC,// Rodolpho da Silva -P: 20809 - 22/11/2005

  // Alex 08/12 - menus segregação
  fCadCriterioSegregacao,  fCadSegregaCotacao,

  //*************************** processamentos **************************************
  FAtualizaSinMT,            FIntegraPlanilhasMT,    FEncerraPeriodoMT,         FIntegraDiasMT,
  FImportaPlanoContasMT,     FImportaPlanoSaldosMT,  FAtuSaldoAnaMT,            FVerifLancMT,
  FImportaCorrespMT,         FLancaContabMT,         { 24/05/2005 FImportaSAFMT, }
  FLancCadAutomMT,           FEncerraResultadosMT,   FAlteraDataMT,
  FConfereRegraMT,           FExcluiPlanilhaFaixaMT, FImportaExcelMT,
  FImportaLancamentosMT,     FEncerraExercicioMT,
  FGeraCotaPlanPatroMT,      FSegregaPlanPatroMT,    FCadSaldoCotasPlanPatroMT, FCadRatAdmPlanoPatroMT,
  FGeraRatAdmPlanPatroMT,    FCadContasporPeriodoMT, FCadFaixaDatasMT,          FCadDeParaContasMT,
  FAlteraPlanoContabilMT,    FCadTabelasContabMT,
  FDeficitSuperavitMT,       {FGeraSalContMT - andré tavares - pendência 16351 - 11/05/2004} FGeraSalCont2004MT,
  FVerificaBloqueadosMT,
  FRateioProgMT,             FRateioPlanoPrevMT,
  FGeraSaldoCalcMT,          { 24/05/2005 FLancMeiaNoiteMT, }
  FLancPesqMT,               FSaldosPesqMT,
  FAcertaNumPlanilhaMT,      FAcertaCodRedMT,

  // Alex 02/02/2004 - menus segregação
  fProcessaSegregacao,
  {
  06/01/03 Alex menus retirados pelo desenvolvimento da nova segregação
  backup em fontes descartados

  FCadEventoSrhMT,           FImportaDinamicaMT,     FImportaRMMT,
  FImpFidelioMT,             FExpPosadasMT,          FGeraConsolidadoMT,
  FImportaSRHMT,

  05/12/03 Alex menus retirados pelo desenvolvimento da nova segregação
  backup em fontes descartados

  FCadSaldoAntAtivProjMT,    FGeraRateioAtivProjMT,  FGeraLancRateioMT,
  FCadPercentRateioAPMT,     FGeraLancRateioAdminMT,

  retirados ainda:
  uCtrlRateioAtivProj,
  uCtrlRateioAPExtra,
  uCtrlProcessaContab.ExisteRateio
                     .RemoveRateioPorPeriodo
                     .GeraRateioPorPeriodo
                     .GeraLancaRateioAtivProj
                     .GeraLancRateioADM

  uDBRateioAtivProj
  uDbRateioAPextra
  uDbCompoRateioAp

  }
  //****************************************************************************
  dContab,
  dBaseDados,
  fTelaAut,
  UMensErro,
  uDatabase,
  uAutorizacao,
  uCtrlContab,
  uCmControlObject,
  uCtrlRptContab,
  // Relatatórios SPC
  fRelFluxoFinanceiro, FGeraSalContMT, FExportaContabMT, fExcluiExportContabMT,
  FCadTipoRentabilidade, FRentabilidadeContabilMT, fAjustaSegregacaoMT,
  fLancPlanAutomMT, FExcluiApuracao;
  //****************************************************************************

procedure TfrmPrincipal.mnuSubgruposClick(Sender: TObject);
begin
  inherited;
   //AbrirForm(frmCadSubGrupo, TfrmCadSubGrupo,false);
   AbrirForm(frmCadSubGrupoMT, TfrmCadSubGrupoMT,false);
end;

procedure TfrmPrincipal.nmuParametrosClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadParamContab, TfrmCadParamContab,false);
  AbrirForm(frmCadParamContabMT, TfrmCadParamContabMT,false);
end;

procedure TfrmPrincipal.mnuQualificaodePlanosClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadPlanoContas, TfrmCadPlanoContas,false);
  AbrirForm(frmCadPlanoContasMT, TfrmCadPlanoContasMT,false);
end;

procedure TfrmPrincipal.mnuPerodosContbeisClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadPeriodoContabil, TfrmCadPeriodoContabil,false);
  AbrirForm(frmCadPeriodoContabilMT, TfrmCadPeriodoContabilMT,false);
end;

procedure TfrmPrincipal.mnuSaldoAnteriorClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadSaldoAnterior, TfrmCadSaldoAnterior,false);
  AbrirForm(frmCadSaldoAnteriorMT, TfrmCadSaldoAnteriorMT,false);
end;

procedure TfrmPrincipal.mnuHistricoPadroClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadHistorico, TfrmCadHistorico,false);
  AbrirForm(frmCadHistoricoMT, TfrmCadHistoricoMT,false);
end;

procedure TfrmPrincipal.mnuTermosdoDirioClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadTermo, TfrmCadTermo,false);
  AbrirForm(frmCadTermoDiarioMT, TfrmCadTermoDiarioMT,false);
end;

procedure TfrmPrincipal.mnuCadPreProntaClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadPlanilPrePronta, TfrmCadPlanilPrePronta,false);
  AbrirForm(frmCadPlanilPreProntaMT, TfrmCadPlanilPreProntaMT,false);
end;

procedure TfrmPrincipal.mnuCadRateioClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadPlanilRateio, TfrmCadPlanilRateio, false);
  AbrirForm(frmCadPlanilRateioMT, TfrmCadPlanilRateioMT, false);
end;

procedure TfrmPrincipal.mnuLancamentoClick(Sender: TObject);
begin
  inherited;
//  AbrirForm(frmLancamento, TfrmLancamento,false);
//  AbrirForm(frmCadLancamentos, TfrmCadLancamentos, false);
  AbrirForm(frmLancaContabMT, TfrmLancaContabMT, false);
end;

procedure TfrmPrincipal.mnuAtualizaSaldoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAtualizaSinMT, TfrmAtualizaSinMT, false);
end;

procedure TfrmPrincipal.mnuPreProntaClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadLancPrePronta, TfrmCadLancPrePronta, false);
  AbrirForm(frmCadLancPreProntaMT, TfrmCadLancPreProntaMT, false);
//  AbrirForm(frmLancCadPrePronta, TfrmLancCadPrePronta, false);
end;

procedure TfrmPrincipal.mnuRateioClick(Sender: TObject);
begin
  inherited;
 // AbrirForm(frmCadLancRateio, TfrmCadLancRateio, false);
  AbrirForm(frmCadLancRateioMT, TfrmCadLancRateioMT, false);
end;

procedure TfrmPrincipal.mnuSubcontaClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadSubconta, TfrmCadSubconta, false);
  AbrirForm(frmCadSubcontaMT, TfrmCadSubcontaMT, false);
end;

procedure TfrmPrincipal.mnuAtualizaMoedaClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmAtualizaMoeda, TfrmAtualizaMoeda, false);
  AbrirForm(frmAtualizaMoedaMT, TfrmAtualizaMoedaMT, false);
end;

procedure TfrmPrincipal.mnuOramentoClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadOrcamentoContabil, TfrmCadOrcamentoContabil, false);
  AbrirForm(frmCadOrcamentoContabilMT, TfrmCadOrcamentoContabilMT, false);
end;

procedure TfrmPrincipal.mnuEncerraPerodoClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmEncerraPeriodo, TfrmEncerraPeriodo, false);
  AbrirForm(frmEncerraPeriodoMT, TfrmEncerraPeriodoMT, false);
end;

procedure TfrmPrincipal.mnuEncerraExerccioClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmEncerraExercicio, TfrmEncerraExercicio, false);
  AbrirForm(frmEncerraExercicioMT, TfrmEncerraExercicioMT, false);
end;

procedure TfrmPrincipal.mnuEncerraContasdeResultadoClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmEncerraResultados, TfrmEncerraResultados, false);
  AbrirForm(frmEncerraResultadosMT, TfrmEncerraResultadosMT, false);
end;

procedure TfrmPrincipal.mnuDemontrativoClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadDemonstrativo, TfrmCadDemonstrativo, false);
  AbrirForm(frmCadDemonstrativoMT, TfrmCadDemonstrativoMT, false);
end;

procedure TfrmPrincipal.mnuElementosdoDemonstrativoClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadElemDemo, TfrmCadElemDemo, false);
  AbrirForm(frmCadElemDemoMT, TfrmCadElemDemoMT, false);
end;

procedure TfrmPrincipal.Dia1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmIntegraDiasMT, TfrmIntegraDiasMT,false);
end;

procedure TfrmPrincipal.Planilha1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmIntegraPlanilhasMT, TfrmIntegraPlanilhasMT, false);
end;

procedure TfrmPrincipal.mnuRegrasClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadSPCConsiste, TfrmCadSPCConsiste, False );
end;

procedure TfrmPrincipal.Lanamentos2Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmImportaLancamentos, TfrmImportaLancamentos, false);
  AbrirForm(frmImportaLancamentosMT, TfrmImportaLancamentosMT, false);
end;

procedure TfrmPrincipal.PlanodeContas1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmImportaPlanoContas, TfrmImportaPlanoContas, false);
  AbrirForm(frmImportaPlanoContasMT, TfrmImportaPlanoContasMT, false);
end;

procedure TfrmPrincipal.SaldoAnterior1Click(Sender: TObject);
begin
  inherited;
 // AbrirForm(frmImportaSaldos, TfrmImportaSaldos, false);
  AbrirForm(frmImportaSaldosMT, TfrmImportaSaldosMT, false);
end;

procedure TfrmPrincipal.LanamentoAutomtico1Click(Sender: TObject);
begin
  inherited;              
  //AbrirForm(frmCadLancamAutom, TfrmCadLancamAutom, false);
  AbrirForm(frmCadLancamAutomMT, TfrmCadLancamAutomMT, false);
end;

procedure TfrmPrincipal.Automtico1Click(Sender: TObject);
begin
  inherited;
 // AbrirForm(frmLancCadAutom, TfrmLancCadAutom, false);
  AbrirForm(frmLancCadAutomMT, TfrmLancCadAutomMT, false);
end;

procedure TfrmPrincipal.ConsisteRegras1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConfereRegraMT, TfrmConfereRegraMT, false);
end;

procedure TfrmPrincipal.GerararquivoSPCCAP1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmGeraSALCONT, TfrmGeraSALCONT, false);
//início - andré tavares - pendência 16351 - 11/05/2004
//  AbrirForm(frmGeraSALCONTMT, TfrmGeraSALCONTMT, false);
//  AbrirForm(frmGeraSALCONT2004MT, TfrmGeraSALCONT2004MT, false);
//fim - andré tavares - pendência 16351 - 11/05/2004
end;

procedure TfrmPrincipal.VerificaBloqueados;
var
   sMensagem: string;
begin
   DtmContab.sqlVerificaBloqueados.Prepare;
   DtmContab.sqlVerificaBloqueados.ParamByName('PEREXERCICIO').asInteger := modulo.iExercicioAtual;
   DtmContab.sqlVerificaBloqueados.ParamByName('IDPESSOA').asInteger     := sistema.idEmpresa;
   DtmContab.sqlVerificaBloqueados.Open;

   if not DtmContab.cdsVerificaBloqueados.isEmpty then begin
      sMensagem := 'Existem Lançamentos não Integrados em Períodos já Bloqueados.' + CHR(13) + 'Deseja verificar?';
      if MsgDlg(sMensagem,'Aviso',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
         Modulo.bExcluiuBloqueados := False;
         AbrirForm(frmVerificaBloqueadosMT, TfrmVerificaBloqueadosMT, false);
      end;
   end;

   DtmContab.cdsVerificaBloqueados.Close;
end;



procedure TfrmPrincipal.LanamentosModelo21Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmImportaExcel, TfrmImportaExcel, false);
  AbrirForm(frmImportaExcelMT, TfrmImportaExcelMT, false);
end;

procedure TfrmPrincipal.LanamentosModelo31Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmImportaRM, TfrmImportaRM, false);
// Alex 06/01/04 Fonte Descartado pelo Darcy  AbrirForm(frmImportaRMMT, TfrmImportaRMMT, false);
end;

procedure TfrmPrincipal.AtualizaSaldoAnaltica1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAtuSaldoAnaMT, TfrmAtuSaldoAnaMT, false);
end;

procedure TfrmPrincipal.VerificaLanamentos1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmVerifLanc, TfrmVerifLanc, false);
  AbrirForm(frmVerifLancMT, TfrmVerifLancMT, false);
end;

procedure TfrmPrincipal.Lanamentos1Click(Sender: TObject);
begin
  inherited;
 // AbrirForm(frmLancPesquisa, TfrmLancPesquisa, false);
  AbrirForm(frmLancPesquisaMT, TfrmLancPesquisaMT, false);
end;

procedure TfrmPrincipal.Saldos1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmSaldosPesquisa, TfrmSaldosPesquisa, false);
  AbrirForm(frmSaldosPesquisaMT, TfrmSaldosPesquisaMT, false);
end;

procedure TfrmPrincipal.ColunasdoDemonstrativo1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadColunasDemo, TfrmCadColunasDemo, false);
  AbrirForm(frmCadColunasDemoMT, TfrmCadColunasDemoMT, false);
end;

procedure TfrmPrincipal.LinhasdoDemonstrativoColunado1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadLinhasDemo, TfrmCadLinhasDemo, false);
  AbrirForm(frmCadLinhasDemoMT, TfrmCadLinhasDemoMT, false);
end;

procedure TfrmPrincipal.PlanodeContasNovo1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadContasContab, TfrmCadContasContab, false);
  AbrirForm(frmCadContasContabMT, TfrmCadContasContabMT, false);
end;

procedure TfrmPrincipal.MovimentodosExercciosAnteriores1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadMovAnterior, TfrmCadMovAnterior, false);
  AbrirForm(frmCadMovAnteriorMT, TfrmCadMovAnteriorMT, false);
end;

procedure TfrmPrincipal.BarradeAtalhos1Click(Sender: TObject);
begin
   inherited;
   Toolbar971.visible := BarradeAtalhos1.checked;
end;

procedure TfrmPrincipal.SaldoAnteior1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadSaldoAntAtivProj, TfrmCadSaldoAntAtivProj, false);
  // 05/12/03 Alex - Nova segregação, fontes em fontes descartados
  //AbrirForm(frmCadSaldoAntAtivProjMT, TfrmCadSaldoAntAtivProjMT, false);
end;

procedure TfrmPrincipal.GeraRateioporPerodo1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmGeraRateioAtivProj, TfrmGeraRateioAtivProj, false);
  // 05/12/03 Alex - Nova segregação, fontes em fontes descartados
  //AbrirForm(frmGeraRateioAtivProjMT, TfrmGeraRateioAtivProjMT, false);
end;

procedure TfrmPrincipal.GeraLanamentosdoRateio1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmGeraLancRateio, TfrmGeraLancRateio, false);
  // 05/12/03 Alex - Nova segregação, fontes em fontes descartados
  //AbrirForm(frmGeraLancRateioMT, TfrmGeraLancRateioMT, false);
end;

procedure TfrmPrincipal.PercentuaisdoRateio1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadPercentRateioAP, TfrmCadPercentRateioAP, false);
  // 05/12/03 Alex - Nova segregação, fontes em fontes descartados
  //AbrirForm(frmCadPercentRateioAPMT, TfrmCadPercentRateioAPMT, false);
end;

procedure TfrmPrincipal.GeraLanamentosdoRateioAdministrativo1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmGeraLancRateioAdmin, TfrmGeraLancRateioAdmin, false);
  // 05/12/03 Alex - Nova segregação, fontes em fontes descartados
  // AbrirForm(frmGeraLancRateioAdminMT, TfrmGeraLancRateioAdminMT, false);
end;

procedure TfrmPrincipal.LayoutsdosDemonstrativos1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadLayoutDemo, TfrmCadLayoutDemo, false);
  AbrirForm(frmCadLayoutDemoMT, TfrmCadLayoutDemoMT, false);
end;

procedure TfrmPrincipal.GeraSaldoCalculadoporPerodo1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmGeraSaldoCalc, TfrmGeraSaldoCalc, false);
  AbrirForm(frmGeraSaldoCalcMT, TfrmGeraSaldoCalcMT, false);
end;

procedure TfrmPrincipal.ContaCorrespondente1Click(Sender: TObject);
begin
  inherited;
 // AbrirForm(frmImportaCorresp, TfrmImportaCorresp, false);
  AbrirForm(frmImportaCorrespMT, TfrmImportaCorrespMT, false);
end;

procedure TfrmPrincipal.AlteraodeData1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmAlteraData, TfrmAlteraData, false);
  AbrirForm(frmAlteraDataMT, TfrmAlteraDataMT, false);
end;

procedure TfrmPrincipal.ElementosdoBalanoPatrimonial1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadDemo2Colunas, TfrmCadDemo2Colunas, false);
  AbrirForm(frmCadDemo2ColunasMT, TfrmCadDemo2ColunasMT, false);

end;

procedure TfrmPrincipal.GeraodeLanamentosdoConsolidado1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmGeraConsolidado, TfrmGeraConsolidado, false);
//06/01/04 AbrirForm(frmGeraConsolidadoMT, TfrmGeraConsolidadoMT, false);
end;

procedure TfrmPrincipal.DeParadeContas1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadDeParaContas, TfrmCadDeParaContas, false);
  AbrirForm(frmCadDeParaContasMT, TfrmCadDeParaContasMT, false);
end;

procedure TfrmPrincipal.AlterarPlanodeContas1Click(Sender: TObject);
begin
  inherited;
  // AbrirForm(frmAlteraPlanoContabil, TfrmAlteraPlanoContabil, false);
   AbrirForm(frmAlteraPlanoContabilMT,TfrmAlteraPlanoContabilMT, false);
end;

procedure TfrmPrincipal.VerificaPlanilhasemPreodosBloqueados1Click(
  Sender: TObject);
begin
  inherited;
  //Modulo.ExcluiuBloqueados := False;
  //AbrirForm(frmVerificaBloqueados, TfrmVerificaBloqueados, false);
  AbrirForm(frmVerificaBloqueadosMT, TfrmVerificaBloqueadosMT, false);
end;

procedure TfrmPrincipal.TabelasdaContabilidade1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadTabelasContab, TfrmCadTabelasContab, false);
  AbrirForm(frmCadTabelasContabMT, TfrmCadTabelasContabMT, false);
end;

procedure TfrmPrincipal.RateioporPrograma1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmRateioProgMT, TFrmRateioProgMT, false);
end;

procedure TfrmPrincipal.RateioporPrograma2Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(FrmCadRateioProg, TFrmCadRateioProg, false);
  AbrirForm(FrmCadRateioProgMT, TFrmCadRateioProgMT, false);
end;

procedure TfrmPrincipal.Fidlio1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(FrmImpFidelio, TFrmImpFidelio, false);
// 06/01/04 Alex Fonte descartado pelo Darcy AbrirForm(FrmImpFidelioMT, TFrmImpFidelioMT, false);
end;

procedure TfrmPrincipal.RateioporPlanoePatrocinadora1Click(
  Sender: TObject);
begin
  inherited;
  //AbrirForm(FrmCadRateioPlanPrev, TFrmCadRateioPlanPrev, false);
  AbrirForm(FrmCadRateioPlanPrevMT, TFrmCadRateioPlanPrevMT, false);
end;

procedure TfrmPrincipal.RateioporPlanoePatrocinadora2Click(
  Sender: TObject);
begin
  inherited;
  //AbrirForm(FrmRateioPlanoPrev, TFrmRateioPlanoPrev, false);
  AbrirForm(FrmRateioPlanoPrevMT, TFrmRateioPlanoPrevMT, false);
end;

procedure TfrmPrincipal.AtualizaCdigosReduzidos1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(FrmAcertaCodRed, TFrmAcertaCodRed, false);
  AbrirForm(FrmAcertaCodRedMT, TFrmAcertaCodRedMT, false);
end;

procedure TfrmPrincipal.AtualizaNumeraodasPlanilhas1Click(Sender: TObject);
Var //andre tavares - pendência 16888 - 16/08/2004
  CtrlParamContab: TCtrlParamContab;
  CdsParamContab : TclientDataSet;
begin
  inherited;
  //AbrirForm(FrmAcertaNumPlanilha, TFrmAcertaNumPlanilha, false);

// início andre tavares - pendência 16888 - 16/08/2004
  CdsParamContab := TClientDataset.Create(nil);
  CtrlParamContab := TCtrlParamContab.Create;
  CtrlParamContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                   Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  CdsParamContab.Data := CtrlParamContab.ListParamContab(sistema.idEmpresa);
  bFlgPlnSequence := CdsParamContab.fieldByName('FLGPLNSEQUENCE').asString = 'S';
  CtrlParamContab.Free;
  CdsParamContab.Free;

  if bFlgPlnSequence then
    MsgDlg('Atenção! Esta funcionalidade tornou-se inaplicável e foi desativada,'+#13
          +' pois foi ativado o parâmetro de numeração de planilhas por sequence.'+#13, 'Aviso', mtWarning, [mbOk], 0 )
  else // fim andre tavares - pendência 16888 - 16/08/2004
    AbrirForm(FrmAcertaNumPlanilhaMT, TFrmAcertaNumPlanilhaMT, false);
end;

procedure TfrmPrincipal.SAF1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(FrmImportaSAF, TFrmImportaSAF, false);
// Alex 24/05/05  AbrirForm(FrmImportaSAFMT, TFrmImportaSAFMT, false);
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
var CrlContab :TCtrlContab;
begin
  inherited;

  if Sistema.FezLogin then
  begin
     stbarStatusBar.Panels[2].Text := Sistema.AliasServidor; // + '/' + Sistema.AliasDB;

     if Sistema.MudouEmpresa then
        ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB','PARAMCAP',tiCAP);


     // 06/01/03 14451 - habilitar os menus de segregação de acordo com parâmetro global
     // novos menus da segregação
     // os menus foram colocados invisíveis, pois não faz sentido existirem com a nova segregação
     mnuSegregacaoRecursos.Visible := ParamIntegra.SegregaVirtual; // Cadastros
     MnuSegregaodeRecursos.Visible := ParamIntegra.SegregaVirtual; // Cadastros

     // menus antigos da segregação
     //Bruno Bastos - 12/01/2005 - A pedido do Alex - SegregaoporPlanoePatrocinadora1.Visible := not ParamIntegra.SegregaVirtual; // Processamentos

     // rateio por programa e plano/patro não previsto na nova segregação.
     // Avaliar posteriormente. CBS não usa. FUNCEF usa.
     // Alex 22/02/05 17813 RateioporPrograma1.Visible              := not ParamIntegra.SegregaVirtual; // Processamentos
     RateioporPlanoePatrocinadora2.Visible   := not ParamIntegra.SegregaVirtual; // Processamentos
     // Alex 22/02/05 17813 RateioporPrograma2.Visible              := not ParamIntegra.SegregaVirtual; // Cadastros
     RateioporPlanoePatrocinadora1.Visible   := not ParamIntegra.SegregaVirtual; // Cadastros
     // fim 06/01/03 14451 - habilitar os menus de segregação de acordo com parâmetro global

     // Alex 9/01/04 14451 desabilitar para análises futuras (cbs não usa) Ivete 9/1/4
     // os menus foram colocados desabilitados, pois faz sentido existirem com a nova segregação
     if ParamIntegra.SegregaVirtual then begin   // sem o if quem não utiliza segreação habilitaria o menu, mesmo sem acesso.
       mnuRateio.Enabled     := false; // Processamentos
       mnuCadRateio.Enabled  := false; // Cadastros
       tbtnRateio.Enabled    := false; // Processamentos  ==> botão de atalho
     end;
     // fim Alex 09/01/04

     CrlContab := TCtrlContab.Create;
     Try
        CrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                   Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

        // Incluir a Criação do Contab Para Selecionar parâmetros
        if not CrlContab.SelecionaParametros(Sistema.IdEmpresa) then begin
           modulo.iExercicioAtual := 0;
           modulo.sMascaraContas  := '';
           modulo.iPlano := 0;
        end else begin
           modulo.iExercicioAtual := CrlContab.ExercicioAtual;
           modulo.iPlano := CrlContab.PlanoParam;
           modulo.sMascaraContas  := CrlContab.MascaraContaParam;

        end;
     finally
        CrlContab.Free;
     End;
     //
     modulo.sMascaraCCusto    := ParamIntegra.MascaraCC;
     modulo.sMascaraUnidNegoc := ParamIntegra.MascaraUnidNegoc;
     modulo.iUnidGlobal       := ParamIntegra.uNidNegoc;
     //
     DtmContab.sqlMoedaCorrente.Prepare;
     DtmContab.sqlMoedaCorrente.ParamByName('IDPESSOA').AsFloat := Sistema.idEmpresa;
     DtmContab.sqlMoedaCorrente.Open;

     if DtmContab.cdsMoedaCorrente.IsEmpty then
        modulo.sSiglaMoedaCorr   := ''
     else
        modulo.sSiglaMoedaCorr   := DtmContab.cdsMoedaCorrente.FieldByName('MOESIGLA').AsString;

     DtmContab.cdsMoedaCorrente.CLose;
     VerificaBloqueados;
  end;
// início andre tavares - pendência 16888 - 16/08/2004
   if sistema.TipoCliente = 20041 then
   begin
     Exportaes1.visible := true;
     Exportaes1.Enabled := true;
     ExportaContabil.Enabled := true;
     ExclusodeExportaoContbil1.Enabled := true;
   end;
// fim andre tavares - pendência 16888 - 16/08/2004

end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
 // Application.CreateForm(TdtmRelatoriosContabil, dtmRelatoriosContabil);
 // Application.CreateForm(TdtmRelatoriosContabil2, dtmRelatoriosContabil2);
end;

procedure TfrmPrincipal.LanamentodaMeiaNoite1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(FrmLancMeiaNoite, TFrmLancMeiaNoite, false);
// Alex 24/05/2005  AbrirForm(FrmLancMeiaNoiteMT, TFrmLancMeiaNoiteMT, false);
end;

procedure TfrmPrincipal.ExclusodePlanilhasporFaixa1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(FrmExcluiPlanilhaFaixa, TFrmExcluiPlanilhaFaixa, false);
  AbrirForm(FrmExcluiPlanilhaFaixaMT, TFrmExcluiPlanilhaFaixaMT, false);
end;

procedure TfrmPrincipal.LanamentosFolhaDinamica1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(FrmImportaDinamica, TFrmImportaDinamica, false);
// 01/01/04 Alex - retirardo por Darcy  AbrirForm(FrmImportaDinamicaMT, TFrmImportaDinamicaMT, false);

end;


procedure TfrmPrincipal.AgrupamentoeDesmembramentodeContas1Click(
  Sender: TObject);
begin
  inherited;
  //AbrirForm(FrmCadContasporPeriodo, TfrmCadContasporPeriodo, false);
  AbrirForm(FrmCadContasporPeriodoMT, TfrmCadContasporPeriodoMT, false);
end;
procedure TfrmPrincipal.Eventos1Click(Sender: TObject);
begin
  inherited;
// Alex 06/01/04  AbrirForm(frmCadEventoSrhMT, TfrmCadEventoSrhMT, false);
end;

procedure TfrmPrincipal.Importao1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmImportaSRH, TfrmImportaSRH, false);
// 06/01/04 Alex  AbrirForm(frmImportaSRHMT, TfrmImportaSRHMT, false);
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
Var
  RptContab :TCtrlRptContab;
begin
  inherited;
    RptContab:= TCtrlRptContab.Create;
    Try
       Printed := ShowReport(IdReports, RptContab);
       RptContab.Free;
    Except
         RptContab.Free;
         Raise;
    End;

end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  Case IdReports of
     1719: FrmPreviewReports := TfrmParamConfCotas.Create(Self);
     1593: FrmPreviewReports := TfrmParamRazaoAnal.Create(Self);
     3613: FrmPreviewReports := TfrmParamRazaoAnalSimpl.Create(Self);
     1198: FrmPreviewReports := TfrmParamDiario.Create(Self);
     1596: FrmPreviewReports := TfrmParamBalancete.Create(Self);
     1887: FrmPreviewReports := TfrmParamBalConsolidado.Create(Self);
     1629: FrmPreviewReports := TfrmParamBalanceteCxCC.Create(Self);
     1652: FrmPreviewReports := TfrmParamBalanceteCxAP.Create(Self);
     2076: FrmPreviewReports := TfrmParamBalanceteAPCC.Create(Self);
     1697: FrmPreviewReports := TfrmParamBalanceteAnalAPSC.Create(Self);
     2259: FrmPreviewReports := TfrmParamBalanceteCCxC.Create(Self);
     2323: FrmPreviewReports := TfrmParamBalanceteCad.Create(Self);
     1600: FrmPreviewReports := TfrmParamPlanilhas.Create(Self);
     1202: FrmPreviewReports := TfrmParamBalanco.Create(Self);
     1271: FrmPreviewReports := TfrmParamRazaoSint.Create(Self);
     1384: FrmPreviewReports := TfrmParamRazaoCCusto.Create(Self);
     1628: FrmPreviewReports := TfrmParamConfSubConta.Create(Self);
     2208: FrmPreviewReports := TfrmParamListaDemonst.Create(Self);
     1201: FrmPreviewReports := TfrmParamSaldoInicial.Create(Self);
     3394: FrmPreviewReports := TfrmParamDiarioResumido.Create(Self);
     1539: FrmPreviewReports := TfrmParamOrcamento.Create(Self);
     3717: FrmPreviewReports := TfrmParamOrcamentoCC.Create(Self);
     2860: FrmPreviewReports := TfrmParamBalanceteColMesCC.Create(Self);
     1643: FrmPreviewReports := TfrmParamBalanceteCxSC.Create(Self);
     3148: FrmPreviewReports := TfrmParamBalanceteCol.Create(Self);
     1542: FrmPreviewReports := TfrmParamDemonstrativo1.Create(Self);
     1285: FrmPreviewReports := TfrmParamDemonstrativo4.Create(Self);
     1661: FrmPreviewReports := TfrmParamDemonstrativo5.Create(Self);
     1207: FrmPreviewReports := TfrmParamDemonstrativo2.Create(Self);
     1194: FrmPreviewReports := TfrmParamDemonstrativo3.Create(Self);
     1695: FrmPreviewReports := TfrmParamDemonstrativo6.Create(Self);
     3906: FrmPreviewReports := TfrmParamDemonstrativo7.Create(Self);
     1819: FrmPreviewReports := TfrmParamDemoLayout.Create(Self);
     1854: FrmPreviewReports := TfrmParamSaldosAtuais.Create(Self);
     2686: FrmPreviewReports := TfrmParamAvisoLan.Create(Self);
     2050: FrmPreviewReports := TfrmParamMapaEvolu.Create(Self);
     1794: FrmPreviewReports := TfrmParamCCConta.Create(Self);
     1427: FrmPreviewReports := TfrmParamContaCC.Create(Self);
     1429: FrmPreviewReports := TfrmParamHistorico.Create(Self);
     1430: FrmPreviewReports := TfrmParamPeriodos.Create(Self);
     1428: FrmPreviewReports := TfrmParamSubConta.Create(Self);
     1610: FrmPreviewReports := TfrmParamPlanoContas.Create(Self);

     // Rodolpho da Silva - P: 20809 - 22/11/2005
     20176: FrmPreviewReports := TFrmParamDemoSPC.Create(self);
     20177: FrmPreviewReports := TFrmBalPatrSPC.Create(self);

   Else
    FrmPreviewReports := nil;
  End;
  inherited;

end;

procedure TfrmPrincipal.GeraValordaCota1Click(Sender: TObject);
begin
  inherited;
  If ParamIntegra.SegregaVirtual Then
  Begin
    If MsgDlg('Segregação Virtual está ligada! Deseja continuar mesmo assim? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0 ) = MrYes Then
      AbrirForm(frmGeraCotaPlanPatroMT, TfrmGeraCotaPlanPatroMT, false);
  End
  Else
    AbrirForm(frmGeraCotaPlanPatroMT, TfrmGeraCotaPlanPatroMT, false);
end;

procedure TfrmPrincipal.GeraosLanamentosdeSegregao1Click(Sender: TObject);
begin
  inherited;
  If ParamIntegra.SegregaVirtual Then
  Begin
    If MsgDlg('Segregação Virtual está ligada! Deseja continuar mesmo assim? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0 ) = MrYes Then
      AbrirForm(frmSegregaPlanPatroMT, TfrmSegregaPlanPatroMT, false);
  End
  Else
    AbrirForm(frmSegregaPlanPatroMT, TfrmSegregaPlanPatroMT, false);
end;

procedure TfrmPrincipal.CadastrodeSaldodeCotas1Click(Sender: TObject);
begin
  inherited;
  If ParamIntegra.SegregaVirtual Then
  Begin
    If MsgDlg('Segregação Virtual está ligada! Deseja continuar mesmo assim? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0 ) = MrYes Then
      AbrirForm(frmCadSaldoCotasPlanPatroMT, TfrmCadSaldoCotasPlanPatroMT, false);
  End
  Else
    AbrirForm(frmCadSaldoCotasPlanPatroMT, TfrmCadSaldoCotasPlanPatroMT, false);
end;

procedure TfrmPrincipal.PercentuaisdoRateioAdministrativoporPlanoePatrocinadora1Click(
  Sender: TObject);
begin
  inherited;
  If ParamIntegra.SegregaVirtual Then
  Begin
    If MsgDlg('Segregação Virtual está ligada! Deseja continuar mesmo assim? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0 ) = MrYes Then
      AbrirForm(frmCadRatAdmPlanoPatroMT, TfrmCadRatAdmPlanoPatroMT, false)
  End    
  Else
    AbrirForm(frmCadRatAdmPlanoPatroMT, TfrmCadRatAdmPlanoPatroMT, false);
end;

procedure TfrmPrincipal.GeraLanamentosdoRateioAdministrativoporPlanoePatrocinadora1Click(
  Sender: TObject);
begin
  inherited;
  If ParamIntegra.SegregaVirtual Then
  Begin
    If MsgDlg('Segregação Virtual está ligada! Deseja continuar mesmo assim? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0 ) = MrYes Then
      AbrirForm(frmGeraRatAdmPlanPatroMT, TfrmGeraRatAdmPlanPatroMT, false);
  End
  Else
    AbrirForm(frmGeraRatAdmPlanPatroMT, TfrmGeraRatAdmPlanPatroMT, false);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
  liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
var
    RptContab :TCtrlRptContab;
begin
  inherited;
  RptContab := TCtrlRptContab.Create;
  Try
     Config := ConfigReport(liIdReports,liOrigemCm,RptContab,DesReport);
     RptContab.Free;
  Except
     RptContab.Free;
     Raise;
  End;

End;

procedure TfrmPrincipal.mnuValoresOrcados1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmImportaOrcExcelMT, TfrmImportaOrcExcelMT, false);
end;

procedure TfrmPrincipal.DiasBloqueadosporMdulo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadDiasBloqModMT, TfrmCadDiasBloqModMT, false);

end;

procedure TfrmPrincipal.mnuCriterioSegregacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadCriterioSegregacao, TfrmCadCriterioSegregacao, false);
end;

procedure TfrmPrincipal.mnuCotacaoCriterioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadSegregaCotacao, TfrmCadSegregaCotacao, false);
end;

procedure TfrmPrincipal.mnuFluxoFinanceiroClick(Sender: TObject);
begin
  inherited;
  //amf 13.02.2006 p:21336 - novo fluxo financeiro para a planilha da SPC
  AbrirForm(frmRelFluxoFinanceiro, TfrmRelFluxoFinanceiro, false);
end;

procedure TfrmPrincipal.SICCAP1Click(Sender: TObject);
begin
  inherited;
//início - andré tavares - pendência 16351 - 13/08/2004
  AbrirForm(frmGeraSALCONTMT, TfrmGeraSALCONTMT, false);
//fim - andré tavares - pendência 16351 - 13/08/2004
end;

procedure TfrmPrincipal.SICCAPModelo20041Click(Sender: TObject);
begin
  inherited;
//início - andré tavares - pendência 16351 - 13/08/2004
  AbrirForm(frmGeraSALCONT2004MT, TfrmGeraSALCONT2004MT, false);
//fim - andré tavares - pendência 16351 - 13/08/2004
end;

procedure TfrmPrincipal.ExportaContabilClick(Sender: TObject);
begin
  inherited;
// Alex 06/01/04  AbrirForm(frmExpPosadasMT, TfrmExpPosadasMT, false);
  AbrirForm(FrmExportaContabMT, TFrmExportaContabMT, false); // tavares - pendência 16888 - 16/008/2004
end;

procedure TfrmPrincipal.ExclusodeExportaoContbil1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExcluiExportContabMT, TfrmExcluiExportContabMT, false); // tavares - pendência 16888 - 16/008/2004
end;

procedure TfrmPrincipal.mnuProcRentabilidadeContabilClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmRentabilidadeContabilMT, TFrmRentabilidadeContabilMT, False);
end;

procedure TfrmPrincipal.mnuCadRentabilidadeContabilClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadTipoRentabilidade, TFrmCadTipoRentabilidade, False);
end;

procedure TfrmPrincipal.FaixadeDatasdoPlanoContbil1Click(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmCadFaixaDatas, TfrmCadFaixaDatas, false);
  AbrirForm(frmCadFaixaDatasMT, TfrmCadFaixaDatasMT, false);
end;



procedure TfrmPrincipal.mnuProcessaSegregaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmProcessaSegregacao, TfrmProcessaSegregacao, false);

end;

procedure TfrmPrincipal.AjustedePlanilhasDivergentes1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAjustaSegregacaoMT,TFrmAjustaSegregacaoMT,False);

end;

procedure TfrmPrincipal.AtivarNumeraodePlanilhasPorSeqence1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmWizRenumPlanil,TFrmWizRenumPlanil,False);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  bFlgPlnSequence := false;
end;

procedure TfrmPrincipal.mnuIncluiApurClick(Sender: TObject);
begin
  inherited;
  //AbrirForm(frmDeficitSuperavit, TfrmDeficitSuperavit, false);
  AbrirForm(frmDeficitSuperavitMT, TfrmDeficitSuperavitMT, false);
end;

procedure TfrmPrincipal.mnuExcluiApurClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmExcluiApuracao, TFrmExcluiApuracao, false);
end;

initialization
   Sistema.NomeModulo     := 'Contabilidade';    // Nome do Módulo
   Sistema.IdModulo       := 1;                  // Numero do Módulo
   Sistema.LoadOldReport  := False;              // Todos os relatorios estão para 3 camadas
   Sistema.Versao := '3.12.06f';
   Sistema.NomeAplicativo := 'Contabilidade';    // Nome do Modulo
   Sistema.UsaLogOperacoes := True;
   Modulo := TModulo.Create;

finalization
   Modulo.free;
end.
