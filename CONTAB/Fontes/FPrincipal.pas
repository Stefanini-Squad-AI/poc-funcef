unit FPrincipal;

interface
{ --------------------------------------------------------------------------------------------------
Rotina......: tbtnRelBalAnalPP, tbtnRelRazAnal
Nº SIG......: 71751
Data........: 24/07/2018
Responsável.: Darivaldo Alencar
Descrição...: Inclusão de botões de atalho: tbtnRelBalAnalPP, tbtnRelRazAnal
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: AppPadraoShowParamReportPadrao
Nº SOL......: 132992, 132743
Nº KINTANA..: 770843, 767392
Data........: 10/08/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Alteração dos IdReports de 20404->20406 e 20405->20407
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: AppPadraoShowParamReportPadrao
Nº SOL......: 132742, 132741, 132744, 132758, 132992, 132743
Nº KINTANA..: 767273, 767272, 767396, 767599, 770843, 767392
Data........: 21/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação dos relatórios para atender a CGPC28
---------------------------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
Rotina..........: AppPadraoAfterLogin
N. Sol..........: 130437
N. Kintana......: 732116
Data............: 04/02/2010
Responsável.....: Cássio Camargo
Descrição.......: Alteração na chamada dos processos de cadastro 'Critério para
                  Segregação' e 'Cotação de Critério', e processamentos
                  'Processa Segregação' e 'Ajuste Planilhas Divergentes',
                  para que ambos apareçam independente da flag SEGREGAVIRTUAL
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 23/01/2007
  Rotina       :
  Pendência    : -
  Solução      : Associação dos botões com o menu (Action List)
------------------------------------------------------------------------------}
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
  uCMTypes, uResource, FWizRenumPlanil, CMNetUsers, uCtrlParamContab, fGeraSALCONT2010MT,
  wwstorep;

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
    mnuIncluiApur: TMenuItem;
    N18: TMenuItem;
    mnuExcluiApur: TMenuItem;
    ActAtualizaMoeda: TAction;
    ActAtuAnal: TAction;
    ActAtuSin: TAction;
    ActIntegracaoDia: TAction;
    ActIntPlanilha: TAction;
    ActEncerraPer: TAction;
    ActLancamento: TAction;
    ActPrePronta: TAction;
    ActRateio: TAction;
    ActAutomatico: TAction;
    actContas: TAction;
    ActOrcamento: TAction;
    ActConsultLancamento: TAction;
    ActConsultaSaldo: TAction;
    AtualizaSaldodeEncerramentodasContas1: TMenuItem;
    mnuSIPCCAPModelo2010: TMenuItem;
    tbtnRelBalAnalPP: TToolbarButton97;
    tbtnRelRazAnal: TToolbarButton97;
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
    procedure LanamentosModelo21Click(Sender: TObject);
    procedure AtualizaSaldoAnaltica1Click(Sender: TObject);
    procedure VerificaLanamentos1Click(Sender: TObject);
    procedure Lanamentos1Click(Sender: TObject);
    procedure Saldos1Click(Sender: TObject);
    procedure ColunasdoDemonstrativo1Click(Sender: TObject);
    procedure LinhasdoDemonstrativoColunado1Click(Sender: TObject);
    procedure PlanodeContasNovo1Click(Sender: TObject);
    procedure MovimentodosExercciosAnteriores1Click(Sender: TObject);
    procedure LayoutsdosDemonstrativos1Click(Sender: TObject);
    procedure GeraSaldoCalculadoporPerodo1Click(Sender: TObject);
    procedure ContaCorrespondente1Click(Sender: TObject);
    procedure AlteraodeData1Click(Sender: TObject);
    procedure ElementosdoBalanoPatrimonial1Click(Sender: TObject);
    procedure DeParadeContas1Click(Sender: TObject);
    procedure AlterarPlanodeContas1Click(Sender: TObject);
    procedure VerificaPlanilhasemPreodosBloqueados1Click(Sender: TObject);
    procedure TabelasdaContabilidade1Click(Sender: TObject);
    procedure RateioporPrograma1Click(Sender: TObject);
    procedure RateioporPrograma2Click(Sender: TObject);
    procedure RateioporPlanoePatrocinadora1Click(Sender: TObject);
    procedure RateioporPlanoePatrocinadora2Click(Sender: TObject);
    procedure AtualizaCdigosReduzidos1Click(Sender: TObject);
    procedure AtualizaNumeraodasPlanilhas1Click(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure ExclusodePlanilhasporFaixa1Click(Sender: TObject);
    procedure AgrupamentoeDesmembramentodeContas1Click(Sender: TObject);
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
    procedure AtualizaSaldodeEncerramentodasContas1Click(Sender: TObject);
    procedure mnuSIPCCAPModelo2010Click(Sender: TObject);
    procedure tbtnRelBalAnalPPClick(Sender: TObject);
    procedure tbtnRelRazAnalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActLoginExecute(Sender: TObject);
  private
    bFlgPlnSequence : Boolean;
    procedure VerificaBloqueados;
    function VerificaPermissaoAtalho: Boolean;//SIG71751
  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

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
  FParamPlanoContas,    FParamDemonstrativo7, FParamBalanceteAnalPP,
  fParamCGPC28,
  
  //*************************** cadastros **************************************
  FCadHistoricoMT,         FCadContasContabMT,
  FCadPlanoContasMT,       FCadTermoDiarioMT,   FCadPeriodoContabilMT,  FCadLancPreProntaMT,
  FCadSubGrupoMT,          FCadSubContaMT,      FCadDemonstrativoMT,    FCadSPCConsiste,
  FCadSaldoAnteriorMT,     FCadLinhasDemoMT,    FCadElemDemoMT,
  FCadOrcamentoContabilMT, FCadLayoutDemoMT,    FCadMovAnteriorMT,      FCadParamContabMT,
  FCadPlanilPreProntaMT,   FCadPlanilRateioMT,  FCadLancamAutomMT,      FCadRateioPlanPrevMT,
  FCadLancRateioMT,        FCadRateioProgMT,    FAtualizaMoedaMT,       FImportaOrcadoExcelMT,
  FCadDiasBloqModMT,
  FCadDemo2ColunasMT,      FCadColunasDemoMT,   FParamDemoSPC,          FBalPatrSPC,

  fCadCriterioSegregacao,  fCadSegregaCotacao,

  //*************************** processamentos **************************************
  FAtualizaSinMT,            FIntegraPlanilhasMT,    FEncerraPeriodoMT,         FIntegraDiasMT,
  FImportaPlanoContasMT,     FImportaPlanoSaldosMT,  FAtuSaldoAnaMT,            FVerifLancMT,
  FImportaCorrespMT,         FLancaContabMT,
  FLancCadAutomMT,           FEncerraResultadosMT,   FAlteraDataMT,
  FConfereRegraMT,           FExcluiPlanilhaFaixaMT, FImportaExcelMT,
  FImportaLancamentosMT,     FEncerraExercicioMT,
  FGeraCotaPlanPatroMT,      FSegregaPlanPatroMT,    FCadSaldoCotasPlanPatroMT, FCadRatAdmPlanoPatroMT,
  FGeraRatAdmPlanPatroMT,    FCadFaixaDatasMT,       FCadDeParaContasMT,
  FCadTabelasContabMT,
  FDeficitSuperavitMT,       FGeraSalCont2004MT,
  FVerificaBloqueadosMT,
  FRateioProgMT,             FRateioPlanoPrevMT,
  FGeraSaldoCalcMT,
  FLancPesqMT,               FSaldosPesqMT,
  FAcertaNumPlanilhaMT,      FAcertaCodRedMT,

  FWizDesmembraAgrupa,
  fProcessaSegregacao,

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
  FExcluiApuracao, FParamBalanceteAnalSubConta,
  FAlteraPlanoContabilMT,
  FAtuSaldoEncerramentoMT;
  //****************************************************************************

procedure TfrmPrincipal.mnuSubgruposClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadSubGrupoMT, TfrmCadSubGrupoMT,false);
end;

procedure TfrmPrincipal.nmuParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadParamContabMT, TfrmCadParamContabMT,false);
end;

procedure TfrmPrincipal.mnuQualificaodePlanosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadPlanoContasMT, TfrmCadPlanoContasMT,false);
end;

procedure TfrmPrincipal.mnuPerodosContbeisClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadPeriodoContabilMT, TfrmCadPeriodoContabilMT,false);
end;

procedure TfrmPrincipal.mnuSaldoAnteriorClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadSaldoAnteriorMT, TfrmCadSaldoAnteriorMT,false);
end;

procedure TfrmPrincipal.mnuHistricoPadroClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadHistoricoMT, TfrmCadHistoricoMT,false);
end;

procedure TfrmPrincipal.mnuTermosdoDirioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTermoDiarioMT, TfrmCadTermoDiarioMT,false);
end;

procedure TfrmPrincipal.mnuCadPreProntaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadPlanilPreProntaMT, TfrmCadPlanilPreProntaMT,false);
end;

procedure TfrmPrincipal.mnuCadRateioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadPlanilRateioMT, TfrmCadPlanilRateioMT, false);
end;

procedure TfrmPrincipal.mnuLancamentoClick(Sender: TObject);
begin
  inherited;
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
  AbrirForm(frmCadLancPreProntaMT, TfrmCadLancPreProntaMT, false);
end;

procedure TfrmPrincipal.mnuRateioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadLancRateioMT, TfrmCadLancRateioMT, false);
end;

procedure TfrmPrincipal.mnuSubcontaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadSubcontaMT, TfrmCadSubcontaMT, false);
end;

procedure TfrmPrincipal.mnuAtualizaMoedaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAtualizaMoedaMT, TfrmAtualizaMoedaMT, false);
end;

procedure TfrmPrincipal.mnuOramentoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadOrcamentoContabilMT, TfrmCadOrcamentoContabilMT, false);
end;

procedure TfrmPrincipal.mnuEncerraPerodoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmEncerraPeriodoMT, TfrmEncerraPeriodoMT, false);
end;

procedure TfrmPrincipal.mnuEncerraExerccioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmEncerraExercicioMT, TfrmEncerraExercicioMT, false);
end;

procedure TfrmPrincipal.mnuEncerraContasdeResultadoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmEncerraResultadosMT, TfrmEncerraResultadosMT, false);
end;

procedure TfrmPrincipal.mnuDemontrativoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadDemonstrativoMT, TfrmCadDemonstrativoMT, false);
end;

procedure TfrmPrincipal.mnuElementosdoDemonstrativoClick(Sender: TObject);
begin
  inherited;
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
  AbrirForm(frmImportaLancamentosMT, TfrmImportaLancamentosMT, false);
end;

procedure TfrmPrincipal.PlanodeContas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmImportaPlanoContasMT, TfrmImportaPlanoContasMT, false);
end;

procedure TfrmPrincipal.SaldoAnterior1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmImportaSaldosMT, TfrmImportaSaldosMT, false);
end;

procedure TfrmPrincipal.LanamentoAutomtico1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadLancamAutomMT, TfrmCadLancamAutomMT, false);
end;

procedure TfrmPrincipal.Automtico1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmLancCadAutomMT, TfrmLancCadAutomMT, false);
end;

procedure TfrmPrincipal.ConsisteRegras1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConfereRegraMT, TfrmConfereRegraMT, false);
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
  AbrirForm(frmImportaExcelMT, TfrmImportaExcelMT, false);
end;

procedure TfrmPrincipal.AtualizaSaldoAnaltica1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAtuSaldoAnaMT, TfrmAtuSaldoAnaMT, false);
end;

procedure TfrmPrincipal.VerificaLanamentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmVerifLancMT, TfrmVerifLancMT, false);
end;

procedure TfrmPrincipal.Lanamentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmLancPesquisaMT, TfrmLancPesquisaMT, false);
end;

procedure TfrmPrincipal.Saldos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmSaldosPesquisaMT, TfrmSaldosPesquisaMT, false);
end;

procedure TfrmPrincipal.ColunasdoDemonstrativo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadColunasDemoMT, TfrmCadColunasDemoMT, false);
end;

procedure TfrmPrincipal.LinhasdoDemonstrativoColunado1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadLinhasDemoMT, TfrmCadLinhasDemoMT, false);
end;

procedure TfrmPrincipal.PlanodeContasNovo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadContasContabMT, TfrmCadContasContabMT, false);
end;

procedure TfrmPrincipal.MovimentodosExercciosAnteriores1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadMovAnteriorMT, TfrmCadMovAnteriorMT, false);
end;

procedure TfrmPrincipal.LayoutsdosDemonstrativos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadLayoutDemoMT, TfrmCadLayoutDemoMT, false);
end;

procedure TfrmPrincipal.GeraSaldoCalculadoporPerodo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmGeraSaldoCalcMT, TfrmGeraSaldoCalcMT, false);
end;

procedure TfrmPrincipal.ContaCorrespondente1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmImportaCorrespMT, TfrmImportaCorrespMT, false);
end;

procedure TfrmPrincipal.AlteraodeData1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAlteraDataMT, TfrmAlteraDataMT, false);
end;

procedure TfrmPrincipal.ElementosdoBalanoPatrimonial1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadDemo2ColunasMT, TfrmCadDemo2ColunasMT, false);

end;

procedure TfrmPrincipal.DeParadeContas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadDeParaContasMT, TfrmCadDeParaContasMT, false);
end;

procedure TfrmPrincipal.AlterarPlanodeContas1Click(Sender: TObject);
begin
  inherited;
   AbrirForm(frmAlteraPlanoContabilMT,TfrmAlteraPlanoContabilMT, false);
end;

procedure TfrmPrincipal.VerificaPlanilhasemPreodosBloqueados1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmVerificaBloqueadosMT, TfrmVerificaBloqueadosMT, false);
end;

procedure TfrmPrincipal.TabelasdaContabilidade1Click(Sender: TObject);
begin
  inherited;
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
  AbrirForm(FrmCadRateioProgMT, TFrmCadRateioProgMT, false);
end;

procedure TfrmPrincipal.RateioporPlanoePatrocinadora1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadRateioPlanPrevMT, TFrmCadRateioPlanPrevMT, false);
end;

procedure TfrmPrincipal.RateioporPlanoePatrocinadora2Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmRateioPlanoPrevMT, TFrmRateioPlanoPrevMT, false);
end;

procedure TfrmPrincipal.AtualizaCdigosReduzidos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAcertaCodRedMT, TFrmAcertaCodRedMT, false);
end;

procedure TfrmPrincipal.AtualizaNumeraodasPlanilhas1Click(Sender: TObject);
Var
  CtrlParamContab: TCtrlParamContab;
  CdsParamContab : TclientDataSet;
begin
  inherited;

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
  else
    AbrirForm(FrmAcertaNumPlanilhaMT, TFrmAcertaNumPlanilhaMT, false);
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
var CrlContab :TCtrlContab;
begin
  inherited;

  if Sistema.FezLogin then
  begin
     stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

     if Sistema.MudouEmpresa then
        ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB','PARAMCAP',tiCAP);

     // 06/01/03 14451 - habilitar os menus de segregação de acordo com parâmetro global
     // novos menus da segregação
     // os menus foram colocados invisíveis, pois não faz sentido existirem com a nova segregação

     //Cássio - SOL Nº 130437 KINTANA Nº 732116 - Início
     //Exibição das opções de segregação de recursos independente da ativação da flag SEGREGAVIRTUAL
     //mnuSegregacaoRecursos.Visible := ParamIntegra.SegregaVirtual;
     //MnuSegregaodeRecursos.Visible := ParamIntegra.SegregaVirtual;

     // rateio por programa e plano/patro não previsto na nova segregação.
     RateioporPlanoePatrocinadora2.Visible   := not ParamIntegra.SegregaVirtual; // Processamentos
     RateioporPlanoePatrocinadora1.Visible   := not ParamIntegra.SegregaVirtual; // Cadastros
     // fim 06/01/03 14451 - habilitar os menus de segregação de acordo com parâmetro global

     // os menus foram colocados desabilitados, pois faz sentido existirem com a nova segregação
     if ParamIntegra.SegregaVirtual then begin
       mnuRateio.Enabled     := false; // Processamentos
       mnuCadRateio.Enabled  := false; // Cadastros
       tbtnRateio.Enabled    := false; // Processamentos  ==> botão de atalho
     end;

     CrlContab := TCtrlContab.Create;
     Try
        CrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                   Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

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
     modulo.sMascaraCCusto    := ParamIntegra.MascaraCC;
     modulo.sMascaraUnidNegoc := ParamIntegra.MascaraUnidNegoc;
     modulo.iUnidGlobal       := ParamIntegra.uNidNegoc;

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
   if sistema.TipoCliente = 20041 then
   begin
     Exportaes1.visible := true;
     Exportaes1.Enabled := true;
     ExportaContabil.Enabled := true;
     ExclusodeExportaoContbil1.Enabled := true;
   end;


  ActAtualizaMoeda.Enabled := false;
  mnuAtualizaMoeda.Enabled := false;
  tbtnAtuMoeda.Enabled := false;

  MnuConsPart_Padrao.Visible    := False;
  Mnu_UsoPessoal_Padrao.Visible := False;
end;

procedure TfrmPrincipal.ExclusodePlanilhasporFaixa1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmExcluiPlanilhaFaixaMT, TFrmExcluiPlanilhaFaixaMT, false);
end;

procedure TfrmPrincipal.AgrupamentoeDesmembramentodeContas1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmWizDesmembraAgrupa, TFrmWizDesmembraAgrupa, false);
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
     20176: FrmPreviewReports := TFrmParamDemoSPC.Create(self);
     20177: FrmPreviewReports := TFrmBalPatrSPC.Create(self);
     20192: FrmPreviewReports := TFrmParamBalanceteAnalPP.Create(self);
     20335: FrmPreviewReports := TFrmParamBalanceteAnalSubConta.Create(self);

     20400: FrmPreviewReports := TFrmParamCGPC28.Create(Self, IdReports); // Alterado por FHBS - SOL: 132742 KTN: 767273
     20401: FrmPreviewReports := TFrmParamCGPC28.Create(Self, IdReports); // Alterado por FHBS - SOL: 132741 KTN: 767272
     20402: FrmPreviewReports := TFrmParamCGPC28.Create(Self, IdReports); // Alterado por FHBS - SOL: 132744 KTN: 767396
     20403: FrmPreviewReports := TFrmParamCGPC28.Create(Self, IdReports); // Alterado por FHBS - SOL: 132758 KTN: 767599
     20406: FrmPreviewReports := TFrmParamCGPC28.Create(Self, IdReports); // Alterado por FHBS - SOL: 132992 KTN: 770843
     20407: FrmPreviewReports := TFrmParamCGPC28.Create(Self, IdReports); // Alterado por FHBS - SOL: 132743 KTN: 767392
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
  AbrirForm(frmRelFluxoFinanceiro, TfrmRelFluxoFinanceiro, false);
end;

procedure TfrmPrincipal.SICCAP1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmGeraSALCONTMT, TfrmGeraSALCONTMT, false);
end;

procedure TfrmPrincipal.SICCAPModelo20041Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmGeraSALCONT2004MT, TfrmGeraSALCONT2004MT, false);
end;

procedure TfrmPrincipal.ExportaContabilClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmExportaContabMT, TFrmExportaContabMT, false);
end;

procedure TfrmPrincipal.ExclusodeExportaoContbil1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExcluiExportContabMT, TfrmExcluiExportContabMT, false);
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
  AbrirForm(frmDeficitSuperavitMT, TfrmDeficitSuperavitMT, false);
end;

procedure TfrmPrincipal.mnuExcluiApurClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmExcluiApuracao, TFrmExcluiApuracao, false);
end;

procedure TfrmPrincipal.AtualizaSaldodeEncerramentodasContas1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmAtuSaldoEncerramentoMT, TfrmAtuSaldoEncerramentoMT, false);
end;

procedure TfrmPrincipal.mnuSIPCCAPModelo2010Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmGeraSALCONT2010MT, TfrmGeraSALCONT2010MT, false);
end;

//Darivaldo ALencar SIG71751 -Inicio
procedure TfrmPrincipal.tbtnRelBalAnalPPClick(Sender: TObject);
begin
  inherited;
  AppPadrao.PrintReportPadrao(20192,EmptyStr);
end;

procedure TfrmPrincipal.tbtnRelRazAnalClick(Sender: TObject);
begin
  inherited;
  AppPadrao.PrintReportPadrao(1593,EmptyStr);
end;

function TfrmPrincipal.VerificaPermissaoAtalho: Boolean;
var
  sSQL: String;
  qryMenu: TwwQuery;
begin
 sSQL:='SELECT                                         '+
        '    USUXRELXEMP.IDREPORTS,USUXRELXEMP.ORIGEMCM '+
        '  FROM USUXRELXEMP, REPORTS  '+
        'WHERE                        '+
        '  (USUXRELXEMP.IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa) +') AND      '+
        '  ((REPORTS.IDMODULO = '+ IntToStr(Sistema.IdModulo) +') OR            '+
        '  ((REPORTS.IDMODULO = 2) AND (REPORTS.IDDATAVIEW IS NOT NULL))) AND   '+
        '  ((USUXRELXEMP.IDESPACESSO = '+ IntToStr(Sistema.IdEspacesso) +' ) OR '+
        '  (USUXRELXEMP.IDESPACESSO IN          '+
        '            (SELECT                    '+
        '               GRUPOACESSO.IDESPACESSO '+
        '             FROM                      '+
        '               GRUPOACESSO, GRUPOUSU   '+
        '             WHERE                     '+
        '                GRUPOUSU.IDUSUARIO = '+ IntToStr(Sistema.IdUsuario) +' AND '+
        '                GRUPOACESSO.IDGRUPO = GRUPOUSU.IDGRUPO))) AND              '+
        ' (REPORTS.IDREPORTS = USUXRELXEMP.IDREPORTS) AND                           '+
        ' (REPORTS.ORIGEMCM = USUXRELXEMP.ORIGEMCM)                                 ';
  try
    try
     qryMenu:= TwwQuery.create(self);
     qryMenu.DatabaseName:=  'BaseDados';
     FazQuery(qryMenu,sSQL + ' AND REPORTS.IDREPORTS = 20192');
     tbtnRelBalAnalPP.Enabled:= not(qryMenu.IsEmpty);
     FazQuery(qryMenu,sSQL + ' AND REPORTS.IDREPORTS = 1593');
     tbtnRelRazAnal.Enabled:= not(qryMenu.IsEmpty);

    except on e: exception do
      raise exception.create(e.message);
    end;
  finally
    FreeAndNil(qryMenu);
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  VerificaPermissaoAtalho;
end;

procedure TfrmPrincipal.ActLoginExecute(Sender: TObject);
begin
  inherited;
  VerificaPermissaoAtalho;
end;
//Darivaldo ALencar SIG71751 -Fim


initialization
   Sistema.NomeModulo     := 'Contabilidade';    // Nome do Módulo
   Sistema.IdModulo       := 1;                  // Numero do Módulo
   Sistema.LoadOldReport  := False;              // Todos os relatorios estão para 3 camadas
   Sistema.Versao := '3.13.17r';
   Sistema.NomeAplicativo := 'Contabilidade';    // Nome do Modulo
   Sistema.UsaLogOperacoes := True;
   Modulo := TModulo.Create;

finalization
   Modulo.free;
end.
