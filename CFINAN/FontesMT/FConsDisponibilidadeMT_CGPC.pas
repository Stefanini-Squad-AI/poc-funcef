unit FConsDisponibilidadeMT_CGPC;

// Alterações:
{---------------------------------------------------------------------------------------------------
Data        : 08/04/2009
Autor       : Bruno Bastos
SOL_Kintana : 108052_497961
Descrição   : Implementação de filtro por plano contábil.
----------------------------------------------------------------------------------------------------

Data      : 07/01/2009
Autor     : Bruno Bastos
Pendência : Kintana: 472013
SOL       : 105489
Descrição : Verificar se o mês a ser subtraído é janeiro. Se for, o novo mês será 12, senão será o
            mês anterior. 
----------------------------------------------------------------------------------------------------
Data      : 27/11/2008
Autor     : Bruno Bastos
Pendência : Kintana: 451499
SOL       : 101670
Descrição : Alterar o vencimento do DARF de Imposto de Renda para o último dia
            útil do segundo decêndio. Alterei também a pedido do Gustavo
            a busca do dia útil que agora é feita para os dias anteriores
            e não mais para dias posteriores.
----------------------------------------------------------------------------------------------------
Data      : 06/09/2007
Autor     : Fabio Fagundes
Código    : AL_16
Pendência : 26308
SOL       : 68503
Descrição : Retirada do itens 1.9.2 e 4.2 de registros de INSS (GPS) que deverão vir do item 2.4 quando é
            gerado o documento de GPS pois estava duplicando lançamentos
----------------------------------------------------------------------------------------------------
Data      : 11/07/2007
Autor     : Fabio Fagundes
Código    : AL_15
Pendência : 25839
SOL       : 64125
Descrição : Alteração dos Itens 1.9.1 e 4.1 com inclusão de critica VLRINSS <> 0
            para não trazer se estiver baixado
----------------------------------------------------------------------------------------------------
Data      : 29/06/2007
Autor     : Fabio Fagundes
Código    : AL_15
Pendência : 25733
SOL       :
Descrição : Alteração do Item 1.9.1, 1.9.2, 4.1 e 4.2 para adaptar os registros de INSS com legislação
            vigente a partir Jan/2007 e a partir de 01/02/2007 o INSS passa a ser recolhido no dia 10
            ou próximo dia útil subsequente
----------------------------------------------------------------------------------------------------
Data      : 28/03/2007
Autor     : Fabio Fagundes
Código    : AL_14
Pendência : 24923
SOL       : 56740
Descrição : Retirada do DISTINCT do item 2.1 na qrySintetica e qryAnalitica e qryDebug pois não
            estava trazendo corretamente os registros
----------------------------------------------------------------------------------------------------
Data      : 08/03/2007
Autor     : Fabio Fagundes
Código    : AL_13
Pendência : 24131
SOL       : 52190
Descrição : Implementação do Intervalo de Disponibilidade Financeira
----------------------------------------------------------------------------------------------------
Data      : 05/02/2007
Autor     : Fabio Fagundes
Código    : AL_11
Pendência : 24415
SOL       :
Descrição : Troca dos Union do Saldo Anterio para Union ALL pois estava gerando divergência no total
----------------------------------------------------------------------------------------------------
Data      : 30/01/2007
Autor     : Fabio Fagundes
Código    : AL_11
Pendência : 24344
SOL       :
Descrição : Tratamento para não permitir a geração em data anterior a data inicial de Disponibilidade
----------------------------------------------------------------------------------------------------
Data      : 30/01/2007
Autor     : Fabio Fagundes
Código    : AL_10
Pendência : 24296
SOL       : 49782
Descrição : Acerto na montagem do periodo inicial do item 1.3 que estava trazendo registro na data
            inicial de Disponibilidade
----------------------------------------------------------------------------------------------------
Data      : 30/01/2007
Autor     : Fabio Fagundes
Código    : AL_9
Pendência :
SOL       :
Descrição : Liberação da Tab Depuração para todos os usuários
----------------------------------------------------------------------------------------------------
Data      : 07/12/2006
Autor     : Fabio Fagundes
Código    : AL_8
Pendência : 24228
SOL       :
Descrição : Em complemento à retirada dos registros estornados, deve ser retirado a crítica que não
            trazia os lancamentos Não Identificados (RELACIONANI WHERE FLGNI = 'I') dos itens 2.1 e 2.3
----------------------------------------------------------------------------------------------------
Data      : 07/12/2006
Autor     : Fabio Fagundes
Código    : AL_7
Pendência : 23953
SOL       :
Descrição : Passa a trazer os registros estornados
----------------------------------------------------------------------------------------------------
Data      : 16/12/2005
Autor     : Fabio Fagundes
Pendência : 20755
SOL       : 38445
Descrição : Alterado o campo P.NOME para P.RAZAOSOCIAL no item 2.0 das qrys Sintética e Analítica e Debug
----------------------------------------------------------------------------------------------------
Data      : 28/07/2005
Autor     : Fabio Fagundes
Descrição : Acerto nos itens 1.10 que não testava o STATUS <> 2 para não trazer documentos baixados
----------------------------------------------------------------------------------------------------
Data      : 24/02/2005
Autor     : Fabio Fagundes
Descrição : Acerto nos itens 1.x para trazer o IDPESSOA
            Alteração do item 2.5 para não ler a RATEIODOCUM e ficar igual ao item 1.6
            Alteração do item 2.6 para fabioficar igual ao item 1.7
            Alteração do item 1.7 pare ficar igual ao 1.6 só que para Pagamentos
----------------------------------------------------------------------------------------------------
Data      : 04/02/2005
Autor     : Fabio Fagundes
Descrição : Acerto no item 2.6 que estava apresentando cartesiano após alteração de 03/02/2005
----------------------------------------------------------------------------------------------------
Data      : 03/02/2005
Autor     : Fabio Fagundes
Descrição : Implementado Alteradores em documento de Recebimentos de Investimentos
            IteNS 1.10 e 2.6
----------------------------------------------------------------------------------------------------
Data      : 17/01/2005
Autor     : Fabio Fagundes
Descrição : Implementado Alteradores em documento Englobado itens 1.10 e 2.7
----------------------------------------------------------------------------------------------------
Data      : 13/01/2005
Autor     : Fabio Fagundes
Descrição : Acerto nos parâmetros IDPESSOA
----------------------------------------------------------------------------------------------------
Data      : 05/01/2005
Autor     : Fabio Fagundes
Descrição : Retirado os Trunc do somatória da qrySintética em função de diferença de 0,01
----------------------------------------------------------------------------------------------------
Data      : 04/01/2005
Autor     : Fabio Fagundes
Descrição : Acerto no item 1.10 das qry's para não trazer documentos englobados baixados
----------------------------------------------------------------------------------------------------
Data      : 03/01/2005
Autor     : Fabio Fagundes
Descrição : Retirado o Round do item 2.4 da qryAnalitica e qrySintetica
----------------------------------------------------------------------------------------------------
Data      : 30/12/2004
Autor     : Fabio Fagundes
Descrição : Melhoria no tratamento de PortadorForma que não gera financeiro e não afeta a Disponibilidade
            Implementação de tratamento para não trazer registros Não Identificado depois da Regularização
----------------------------------------------------------------------------------------------------
Data      : 16/12/2004
Autor     : Fabio Fagundes
Alteração : AL_1
Descrição : Acerto na geração da qryDebug
----------------------------------------------------------------------------------------------------
Data      : 09/12/2004
Autor     : Fabio Fagundes
Descrição : Implementação do tratamento de PortadoForma que não afeta o Financeiro
            para não trazer os Documentos para a Disponibilidade
----------------------------------------------------------------------------------------------------
Data      : 28/10/2004
Autor     : Fabio Fagundes
Descrição : Acerto na qryAnalitica item (1.6) que estava fazendo carteziano com
            a RateioDocum
----------------------------------------------------------------------------------------------------
Data      : 18/10/2004
Autor     : Fabio Fagundes
Descrição : Implementacao de CPMF sobre Transferencia entre Contas
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 14/10/2004
Autor     : Fabio Fagundes
Descrição : Melhoria de Lay-out e qryDebug
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 20/09/2004
Autor     : Fabio Fagundes
Descrição : Melhoria de Lay-out e qryDebug
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 17/08/2004
Autor     : Fabio Fagundes
Descrição : qryAnalítica e qrySintetica : Acertos no processamento e melhorias
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 30/07/2004
Autor     : Fabio Fagundes
Descrição : qryAnalítica e qrySintetica : Acertos no processamento e melhorias
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 22/07/2004
Autor     : Fabio Fagundes
Descrição : qryAnalítica e qrySintetica : Acertos no processamento
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 04/06/2004
Autor     : Fabio Fagundes
Descrição : qryAnalítica e qrySintetica : Acertos no processamento
----------------------------------------------------------------------------------------------------
// André Tavares - 29/03/2004 - pendência 15765
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 29/03/2004
Autor     : André Tavares
Descrição : resolução da pendência 15765 - tirar o paâmetro cravado da query
qryAnalítica e utilizar o parâmetro do IRRF que identifica o tipo de imposto para INSS de autônomos
----------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 23/01/2004
Autor     : Fabio Fagundes
Descrição : - Acerto nas qrys Analítica e Sintética
            - Criação do campo DATAINIDISPFINANC
----------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 04/12/2003
Autor     : Fabio Fagundes
Descrição : - Acerto na busca dos registros de CPMF da qryAnalitica
----------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 30/10/2003
Autor     : Fabio Fagundes
Descrição : - Alteração do Caption do Relatório de Disp. Analítica para imprimir o Plano e Patro
            - Inclusão dos campos NODOCUMENTO,PLANO E PATRO na qryAnalitica
----------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 04/08/2003
Autor     : Fabio Fagundes
Descrição : Alteração no SQL da QryAnalitica e QrySintética para não buscar os documento baixados
            do CAR nas tabelas do CFinan e sim da DOCUMENTO.
----------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 04/08/2003
Autor     : Fabio Fagundes
Descrição : Alteração no SQL da QryAnalitica e QrySintética para Otimização
            do Processamento e inclusâo de cláusulas para busca de lançamentos
            de INSS
----------------------------------------------------------------------------------------------------
Rotina    : ValidaOperacao
Data      : 17/06/2003
Autor     : Fabio Fagundes
Descrição : Alteração no SQL da QryAnalitica para alteração do Beneficiário
            dos lançamentos do CFinan para apresentarem o histórico padrão
            do contas caixa X tipoOperação
----------------------------------------------------------------------------------------------------
Rotina    : ValidaOperacao
Data      : 02/06/2003
Autor     : Fabio Fagundes
Descrição : Alteração no SQL da QryAnalitica para inclusão de CPMF e IRRF
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, DBTables, Db, Wwdatsrc, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker, Mask, DBCtrls, StdCtrls, TREdit, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBGrids, fcLabel, mxtables, mxstore, mxDB,
  TeeProcs, TeEngine, Chart, mxgraph, Series, DBChart, dxCntner, dxEditor,
  dxExEdtr, dxEdLib, dxDBELib, FPreview,uCtrlParamFinanc,uDbParamfinanc,
  dBaseDados,uCMTypes, DBClient, uCMClientDataSet,uSistema,uMensErro,
  uCtrlDisponibxusu, Provider,uCtrlDispFinanc, uCmSqlParams, ppChrtDP,
  ppChrt, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt,
  wwdbedit, Wwdotdot, Wwdbcomb, TB97Ctls,

  uCmControlObject, uCmDbObject, uDataBase,
     uCtrlFinanc, uCtrlListTercFinanc, uCtrlParamIntegra,
     uGeralFinanc, uCtrlPadroes, uDiasUteis,
     uCtrlImpostoRetido, uCtrlSegregacao, Math;


type
  TfrmConsDisponibilidadeMT_CGPC = class(TfrmSairAjuda)
    Panel1: TPanel;
    PgcSaldos: TPageControl;
    tbsSintetica: TTabSheet;
    tbsAnalitica: TTabSheet;
    Panel10: TPanel;
    dbgAnalitico: TwwDBGrid;
    pnlTitulo: TPanel;
    lblTitulo: TfcLabel;
    dbgSintetico: TwwDBGrid;
    pnlDados: TPanel;
    bvlSepTit: TBevel;
    Label1: TLabel;
    Timer: TTimer;
    ToolbarSep971: TToolbarSep97;
    dsSintetica: TwwDataSource;
    dsAnalitica: TwwDataSource;
    qryAnalitica: TwwQuery;
    bbtnIniciar: TBitBtn;
    CdsParamFinanc: TCMClientDataSet;
    CdsDispFinanc: TCMClientDataSet;
    dspParamFinanc: TDataSetProvider;
    qryParamFinanc: TwwQuery;
    Label2: TLabel;
    edtIntervalo: TdxTimeEdit;
    CMSqlParams1: TCMSqlParams;
    CdsDispSintetica: TCMClientDataSet;
    CdsDispAnalitica: TCMClientDataSet;
    dspDispAnalitica: TDataSetProvider;
    dspDispSintetica: TDataSetProvider;
    qrySintetica: TwwQuery;
    tbsGrafico: TTabSheet;
    grfSintetica: TDBChart;
    Series1: TBarSeries;
    bbtnImprimir: TBitBtn;
    pplSintetica: TppBDEPipeline;
    pplAnalitica: TppBDEPipeline;
    rptDispAnalitica: TppReport;
    ppHeaderBand2: TppHeaderBand;
    pplCaptionDispAnalitica: TppLabel;
    lblEmpresaAnalitica: TppLabel;
    shpDispAnaCabecalho: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppLine4: TppLine;
    lblDispAnaSistema: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    rptDispSintetica: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    lblEmpresaSintetica: TppLabel;
    shpDispConCabecalho: TppShape;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    rptDispGrafico: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLine5: TppLine;
    lblGrafico: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppSystemVariable5: TppSystemVariable;
    ppLine6: TppLine;
    ppLabel9: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDPTeeChart1: TppDPTeeChart;
    ppDBText8: TppDBText;
    ppLabel2: TppLabel;
    lblDataSintetica: TppLabel;
    lblDataAnalitica: TppLabel;
    lblDataGrafico: TppLabel;
    Animate: TAnimate;
    ppLabel8: TppLabel;
    ppLabel15: TppLabel;
    ppDBText10: TppDBText;
    dbtSaldoDoDia: TppDBText;
    dsEmpresa: TwwDataSource;
    qryEmpresa: TwwQuery;
    qryEmpresaIDPESSOA: TFloatField;
    qryEmpresaNOMEEMPRESA: TStringField;
    qryEmpresaRAZAOSOCIAL: TStringField;
    qryEmpresaIDENDERECO: TFloatField;
    qryEmpresaCEP: TStringField;
    qryEmpresaIMAGEM: TBlobField;
    pplEmpresa: TppBDEPipeline;
    pplEmpresappField1: TppField;
    pplEmpresappField2: TppField;
    pplEmpresappField3: TppField;
    pplEmpresappField5: TppField;
    pplEmpresappField6: TppField;
    pplEmpresappField7: TppField;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLabel4: TppLabel;
    ppDBText12: TppDBText;
    edtDataRef: TCMDateTimePicker;
    btnAtualiza: TBitBtn;
    tbsDepuracao: TTabSheet;
    dsDebug: TwwDataSource;
    qryDebug: TwwQuery;
    CdsDispAnaliticaNODOCUMENTO: TStringField;
    CdsDispAnaliticaNOMEFORCLI: TStringField;
    CdsDispAnaliticaCODCENTRORESPON: TStringField;
    CdsDispAnaliticaNOMEPLANOPATRO: TStringField;
    CdsDispAnaliticaNOME: TStringField;
    CdsDispAnaliticaIDPLANO: TFloatField;
    CdsDispAnaliticaIDPATRO: TFloatField;
    CdsDispAnaliticaTIPOREG: TFloatField;
    CdsDispAnaliticaSALDOANT: TFloatField;
    CdsDispAnaliticaRECEBIMENTOS: TFloatField;
    CdsDispAnaliticaDESEMBOLSOS: TFloatField;
    CdsDispAnaliticaIDPESSOA: TFloatField;
    CdsDispAnaliticaPLANO: TStringField;
    CdsDispAnaliticaPATRO: TStringField;
    qryAnaliticaNODOCUMENTO: TStringField;
    qryAnaliticaNOMEFORCLI: TStringField;
    qryAnaliticaSALDO: TFloatField;
    qryAnaliticaCODCENTRORESPON: TStringField;
    qryAnaliticaNOMEPLANOPATRO: TStringField;
    qryAnaliticaNOME: TStringField;
    qryAnaliticaIDPLANO: TFloatField;
    qryAnaliticaIDPATRO: TFloatField;
    qryAnaliticaTIPOREG: TFloatField;
    qryAnaliticaSALDOANT: TFloatField;
    qryAnaliticaRECEBIMENTOS: TFloatField;
    qryAnaliticaDESEMBOLSOS: TFloatField;
    qryAnaliticaSALDODIA: TFloatField;
    qryAnaliticaIDPESSOA: TFloatField;
    qryAnaliticaPLANO: TStringField;
    qryAnaliticaPATRO: TStringField;
    qrySinteticaIDPATRO: TFloatField;
    qrySinteticaIDPLANO: TFloatField;
    qrySinteticaNOMEPLANOPATRO: TStringField;
    qrySinteticaSALDOANT: TFloatField;
    qrySinteticaRECEBIMENTOS: TFloatField;
    qrySinteticaDESEMBOLSOS: TFloatField;
    qrySinteticaSALDODIA: TFloatField;
    CdsDispSinteticaNOMEPLANOPATRO: TStringField;
    CdsDispSinteticaSALDOANT: TFloatField;
    CdsDispSinteticaRECEBIMENTOS: TFloatField;
    CdsDispSinteticaDESEMBOLSOS: TFloatField;
    CdsDispSinteticaSALDODIA: TFloatField;
    CdsDispSinteticaIDPATRO: TFloatField;
    CdsDispSinteticaIDPLANO: TFloatField;
    CdsDispAnaliticaSALDO: TFloatField;
    pnlDepuracao: TPanel;
    cmbTipos: TwwDBComboBox;
    btnDebug: TToolbarButton97;
    OpenDialog1: TOpenDialog;
    pgcDebug: TPageControl;
    tbsResulDebug: TTabSheet;
    tbsQryDebug: TTabSheet;
    qryAnaliticaNUMDOC: TStringField;
    qryAnaliticaNUMAPGR: TFloatField;
    CdsDispAnaliticaNUMDOC: TStringField;
    CdsDispAnaliticaNUMAPGR: TFloatField;
    DBGrid1: TDBGrid;
    memoDebug: TMemo;
    Label3: TLabel;
    cmbSitPlano: TComboBox;
    lblTempo: TLabel;

    procedure FormActivate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnIniciarClick(Sender: TObject);
    procedure PgcSaldosChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure eOnMessage(sMsg : string);
    procedure edtDataRefExit(Sender: TObject);
    procedure dbgAnaliticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgDispAnaliticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgDispSinteticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgSinteticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgAnaliticoTopRowChanged(Sender: TObject);
    procedure dbgDispAnaliticaTopRowChanged(Sender: TObject);
    procedure dbgDispSinteticaTopRowChanged(Sender: TObject);
    procedure dbgSinteticoTopRowChanged(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure rptDispAnaliticaStartPage(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure edtIntervaloExit(Sender: TObject);
    procedure ppShape3Print(Sender: TObject);
    procedure ppShape4Print(Sender: TObject);
    procedure btnDebugClick(Sender: TObject);
    procedure cmbTiposChange(Sender: TObject);
    procedure dbgDebugCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgDebugTopRowChanged(Sender: TObject);
    procedure ppLabel3Print(Sender: TObject);
    procedure lblDispAnaSistemaPrint(Sender: TObject);
    procedure ppLabel9Print(Sender: TObject);


  private { Private declarations }

    cCorZebra : TColor;
    bFaz: Boolean;
    fMaxValor, fMinValor: Double;
    iIntervalo: Integer;
    CtrlParamFinanc   : TCtrlParamFinanc;
    CtrlDisponibxusu  : TCtrlDisponibxusu;
    CtrlDisponFinanc  : TCtrlDisponFinanc;
    procedure Atualiza;
    procedure AtualizaGrids;
    procedure MontaParametros(sQry:String);
    function BuscaDiaRecolhCPMF(dDataRef:TDateTime):TDateTime;
    function BuscaPrimeiDiaAposCPMF(dDataRef:TDateTime):TDateTime;
    function BuscaPrimeiroDiaIRRF(dDataRef:TDateTime):TDateTime;
    function TrocaString (sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
    function MontaQueryDisponibilidade(Const pTipoDisp      : Integer;
                                       Const pDataRef,
                                             pDataAnt       : TDateTime;
                                       Const pIdPessoa      : Integer;
                                       Const pDataSaldoAnt  : TDateTime;
                                             pAnoRateio     : String;
                                       Const pDataIniMesAnt,
                                             pDataFimMesAnt,
                                             pDataINSS      : TDateTime;
                                       Const pBSaldoAntINSS : Integer;
                                       Const pDataIniIRRF,
                                             pDataFimIRRF   : TDateTime;
                                       Const pBSaldoAntIRRF : Integer;
                                       Const pPSAtivo       : String;
                                       Const pIdPatro       : Integer = -1;
                                       Const pIdPlanoPrev   : Integer = -1) : String;

  public  { Public declarations }

    bmPosicao: TBookmark;

  end;

var
  frmConsDisponibilidadeMT_CGPC: TfrmConsDisponibilidadeMT_CGPC;
  
  bFirst,bConciliada,bFirstAtualiza : boolean;
  fSaldoAnterior, fRecebimentos, fDesembolsos, fSaldoDoDia : Double;
  dDataIniMes,dDataIniMesAnt,dDataFimMesAnt,dDataINSS,dDataIniIRRF,dDataFimIRRF,dDataCPMF : TDateTime;
  dDataDARF, dDataAnt, dDataRef : TDateTime;
  bGeraAnalitica : Boolean;
  sPatro, sPlano : String;
  iSaldoAntINSS, iSaldoAntIRRF, iQuarta, iPatro, iPlanoPrev : Integer;


implementation
{$R *.DFM}
uses
  FPrincipal;



procedure TfrmConsDisponibilidadeMT_CGPC.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.TimerTimer(Sender: TObject);
begin
  inherited;
   iIntervalo := 0;
   iIntervalo := iIntervalo +  StrToInt( FormatDateTime('ss',edtIntervalo.Time));
   iIntervalo := iIntervalo + (StrToInt( FormatDateTime('nn',edtIntervalo.Time))* 60 );
   iIntervalo := iIntervalo + (StrToInt( FormatDateTime('hh',edtIntervalo.Time))* 3600 );
   iIntervalo := iIntervalo * 1000;
   Timer.Interval := iIntervalo;
   if bFirstAtualiza = True then
   begin
      bFirstAtualiza := False;
      bFaz := False;
   end
   else
      bFaz := True;
   Atualiza;
end;

procedure TfrmConsDisponibilidadeMT_CGPC.FormShow(Sender: TObject);
begin
  inherited;
  //AL_13

  fMaxValor := 0;
  fMinValor := 0;
  PgcSaldos.ActivePage := tbsSintetica;
  bFaz := False;
  bFirstAtualiza := True;
  edtDataRef.Text := DateToStr(Now);

  cmbSitPlano.ItemIndex := 0; //Bruno Bastos - SOL: 108052 - Kintana: 497961
end;

procedure TfrmConsDisponibilidadeMT_CGPC.bbtnIniciarClick(Sender: TObject);
begin
  inherited;
  //AL_11
  if Trim(edtDataRef.Text) <> '' then
  begin
     if StrToDate(edtDataRef.Text) <= CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime then
     begin
        MsgDlg('A data da Consulta não pode ser menor ou igual à data de ' + #13 +
               'Início de Disponibilidade : ' + CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsString + '','Atenção',mtWarning,[mbOk],0);
        if edtDataRef.CanFocus then
           edtDataRef.SetFocus;
     end
     else
     begin
        PgcSaldos.ActivePage := tbsSintetica;
        bFaz := True;
        TimerTimer(Sender);
        Atualiza;
     end;
  end;
end;

procedure TfrmConsDisponibilidadeMT_CGPC.MontaParametros(sQry:String);
var
   iAno, iMes, iDia : word;
   sAno        : String;
   sAtivPlano  : String; //Bruno Bastos - SOL: 108052 - Kintana: 497961

begin
   dDataRef := StrToDate(edtDataRef.Text);

   DecodeDate(StrToDate(edtDataRef.Text), iAno, iMes, iDia);

   If iAno <= 2009 then
     sAno := '2009'
   else
     sAno := '2010';

   //AL_15
   if dDataRef < StrToDate('01/02/2007') then
   // INSS - Todo dia 2 (útil) ou 1º útil subsequente
      dDataINSS := EncodeDate(iAno, iMes, 2)
   else
      // INSS - Todo dia 10 (útil) ou 1º útil subsequente
      //dDataINSS := EncodeDate(iAno, iMes, 10); //Bruno Bastos - SOL: 101670 Kintana: 451499
      dDataINSS := EncodeDate(iAno, iMes, 20); //Bruno Bastos - SOL: 101670 Kintana: 451499

   if not DiasUteis.DiaUtil(dDataINSS,-1,1,'',True,True,False) then
      //dDataINSS := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dDataINSS,True,True,False); //Bruno Bastos - SOL: 101670 Kintana: 451499
      dDataINSS := DiasUteis.UltDiaUtilAnterior(Sistema.IdEmpresa,dDataINSS,True,True,False); //Bruno Bastos - SOL: 101670 Kintana: 451499
   if StrToDate(edtDataRef.Text) = dDataINSS then
      dDataINSS := StrToDate(edtDataRef.Text);
   iSaldoAntINSS := 0;

   // Somente registros de INSS para o mês subsequente ao de início de Disponibilidade (PARAMFINANC.DATAINIDISPFINANC)
   if ((StrToDate(edtDataRef.Text) > dDataINSS) and
       (StrToDate(edtDataRef.Text) > StrToDate('02/08/2004'))) then
      iSaldoAntINSS := 1;

   // Primeiro dia do mes da DATAREF
   dDataIniMes := EncodeDate(iAno, iMes, 1);

   // Primeiro dia do mes Anterior da DATAREF
   dDataIniMesAnt := DiasUteis.SomaMeses(dDataIniMes, -1);
   DecodeDate(dDataIniMesAnt, iAno, iMes, iDia);

   // Último dia do mes Anterior da DATAREF
   dDataFimMesAnt := DiasUteis.UltDiaMes(iAno, iMes);

   // Data Anterior
   dDataAnt := edtDataRef.Date - 1;

   // IRRF
   dDataIniIRRF := BuscaPrimeiroDiaIRRF(StrToDate(edtDataRef.Text));

   if dDataIniIRRF = 1 then
      dDataFImIRRF := 1
   else
      //dDataFImIRRF := edtDataRef.Date; //Bruno Bastos - Sol: 101670 Kintana: 451499
      dDataFimIRRF := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataIniIRRF), DiasUteis.ExtraiMes(dDataIniIRRF));//Bruno Bastos - Sol: 101670 Kintana: 451499

   // DARF 3º dia útil da semana subsequente ao fato gerador
   dDataDARF    := DiasUteis.SomaDiasUteis(dDataFImIRRF, 3, -1, 1, '', True, True, False);
   iSaldoAntIRRF := 0;
   if ((DayOfWeek(StrToDate(edtDataRef.Text)) = 5) or
       (DayOfWeek(StrToDate(edtDataRef.Text)) = 6)) then
      iSaldoAntIRRF := 1;
   iQuarta := 0;
   if DayOfWeek(StrToDate(edtDataRef.Text)) = 4 then
      iQuarta := 4;

   iPatro     := CdsDispSinteticaIDPATRO.AsInteger;
   iPlanoPrev := CdsDispSinteticaIDPLANO.AsInteger;

   //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Início
   case cmbSitPlano.ItemIndex of
      0: sAtivPlano := QuotedStr('S');
      1: sAtivPlano := QuotedStr('N');
      2: sAtivPlano := 'NULL';
   End;
   //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Fim

   if sQry = 'qrySintetica' then
   begin
      qrySintetica.Close;
      qrySintetica.DisableControls;
      qrySintetica.SQL.Text := MontaQueryDisponibilidade(0,
                                                         dDataRef,
                                                         dDataAnt,
                                                         Sistema.IdEmpresa,
                                                         CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime,
                                                         sAno,
                                                         dDataIniMesAnt,
                                                         dDataFimMesAnt,
                                                         dDataINSS,
                                                         iSaldoAntINSS,
                                                         dDataIniIRRF,
                                                         dDataFimIRRF,
                                                         iSaldoAntIRRF,
                                                         sAtivPlano,
                                                         -1,
                                                         -1);
      //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Fim
   end
   else if sQry = 'qryAnalitica' then
   begin
      qryAnalitica.Close;
      qryAnalitica.DisableControls;
      qryAnalitica.SQL.Text := MontaQueryDisponibilidade(1,
                                                         dDataRef,
                                                         dDataAnt,
                                                         Sistema.IdEmpresa,
                                                         CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime,
                                                         sAno,
                                                         dDataIniMesAnt,
                                                         dDataFimMesAnt,
                                                         dDataINSS,
                                                         iSaldoAntINSS,
                                                         dDataIniIRRF,
                                                         dDataFimIRRF,
                                                         iSaldoAntIRRF,
                                                         sAtivPlano,
                                                         iPatro,
                                                         iPlanoPrev);
      //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Fim
   end
   else if sQry = 'qryDebug' then
   begin
      qryDebug.DatabaseName := qryAnalitica.DatabaseName;
      qryDebug.Close;
      qryDebug.Prepare;
      if qryDebug.Params.FindParam('ANORATEIO') <> nil then
         qryDebug.ParamByName('ANORATEIO').asString  := sAno;
      if qryDebug.Params.FindParam('DATASALDOANT') <> nil then
         qryDebug.Params.FindParam('DATASALDOANT').AsString  := DateToStr(CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime);//'11/01/2004';
      if qryDebug.Params.FindParam('DATAREF') <> nil then
         qryDebug.Params.FindParam('DATAREF').AsString       := DateToStr(dDataRef);
      if qryDebug.Params.FindParam('DATAANT') <> nil then
         qryDebug.Params.FindParam('DATAANT').AsString       := DateToStr(edtDataRef.Date - 1);

      //AL_15

      if qryDebug.Params.FindParam('DATAINIMESANT') <> nil then
         qryDebug.Params.FindParam('DATAINIMESANT').AsString := DateToStr(dDataIniMesAnt);
      if qryDebug.Params.FindParam('DATAFIMMESANT') <> nil then
         qryDebug.Params.FindParam('DATAFIMMESANT').AsString := DateToStr(dDataFimMesAnt);
      if qryDebug.Params.FindParam('DATAINSS') <> nil then
         qryDebug.Params.FindParam('DATAINSS').AsString      := DateToStr(dDataINSS);
      if qryDebug.Params.FindParam('DATAINIIRRF') <> nil then
         qryDebug.Params.FindParam('DATAINIIRRF').AsString   := DateToStr(dDataIniIRRF);
      if qryDebug.Params.FindParam('DATAFIMIRRF') <> nil then
         qryDebug.Params.FindParam('DATAFIMIRRF').AsString   := DateToStr(dDataFimIRRF);
      if qryDebug.Params.FindParam('BQUARTA') <> nil then
         qryDebug.Params.FindParam('BQUARTA').AsInteger := iQuarta;
      if qryDebug.Params.FindParam('BSALDOANTINSS') <> nil then
         qryDebug.Params.FindParam('BSALDOANTINSS').AsInteger := iSaldoAntINSS;
      if qryDebug.Params.FindParam('BSALDOANTIRRF') <> nil then
         qryDebug.Params.FindParam('BSALDOANTIRRF').AsInteger := iSaldoAntIRRF;
      if qryDebug.Params.FindParam('IDPATRO') <> nil then
         qryDebug.Params.FindParam('IDPATRO').Clear;
      if qryDebug.Params.FindParam('IDPLANOPREV')<> nil then
         qryDebug.Params.FindParam('IDPLANOPREV').Clear;
      if (CdsDispSinteticaIDPATRO.AsInteger <> -1) and
         (CdsDispSinteticaIDPLANO.AsInteger <> -1) then
      begin
         if qryDebug.Params.FindParam('IDPATRO') <> nil then
            qryDebug.Params.FindParam('IDPATRO').AsInteger     := iPatro;
         if qryDebug.Params.FindParam('IDPLANOPREV')<> nil then
            qryDebug.Params.FindParam('IDPLANOPREV').AsInteger := iPlanoPrev;
      end;
      if qryDebug.Params.FindParam('IDPESSOA') <> nil then
         qryDebug.Params.FindParam('IDPESSOA').AsInteger    := Sistema.IdEmpresa;

      //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Início
      if qryDebug.Params.FindParam('PSATIVO') <> nil then
      begin
         if cmbSitPlano.ItemIndex = 2 then
            qryDebug.Params.FindParam('PSATIVO').Clear
         else
            qryDebug.Params.FindParam('PSATIVO').AsString := sAtivPlano;
      end;
     //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Fim
   end;

end;



procedure TfrmConsDisponibilidadeMT_CGPC.Atualiza;
var dtInicio : TDateTime;
begin
   // Desabilita o Timer para não contar o tempo de abertura das queries no intervalo
   if (bFaz) then
   begin
       // Desabilita o Timer para não contar o tempo de abertura das queries no intervalo
       Timer.Enabled := False;
       // Aciona a animação
       Animate.Visible := True;
       Animate.Active := True;
       lblTempo.Caption := '';
       dtInicio := Now;
       Application.ProcessMessages;
       // Busca das tabelas Documento / Movimfinanc
       // Atualiza a disponibilidade Sintética
       dbgSintetico.Visible := True;
       dbgAnalitico.Visible := True;

       MontaParametros('qrySintetica');

//       qrySintetica.Sql.SaveToFile('c:\planus\temp\DispFinancSintetica.txt');

       CdsDispSintetica.Close;
       CdsDispSintetica.Open;
       CdsDispSintetica.DisableControls;
       fSaldoAnterior := 0;
       fRecebimentos  := 0;
       fDesembolsos   := 0;
       fSaldoDoDia    := 0;
       while not CdsDispSintetica.Eof do
       begin
          fSaldoAnterior := fSaldoAnterior + CdsDispSinteticaSALDOANT.AsFloat;
          fRecebimentos  := fRecebimentos  + CdsDispSinteticaRECEBIMENTOS.AsFloat;
          fDesembolsos   := fDesembolsos   + CdsDispSinteticaDESEMBOLSOS.AsFloat;
          fSaldoDoDia    := fSaldoDoDia    + CdsDispSinteticaSALDODIA.AsFloat;
          CdsDispSintetica.Next;
       end;

       if not CdsDispSintetica.IsEmpty then
          CdsDispSintetica.Append
       else
          CdsDispSintetica.Insert;

       CdsDispSinteticaNOMEPLANOPATRO.AsString := 'TOTAL GERAL';
       CdsDispSinteticaSALDOANT.AsFloat        := fSaldoAnterior;
       CdsDispSinteticaRECEBIMENTOS.AsFloat    := fRecebimentos;
       CdsDispSinteticaDESEMBOLSOS.AsFloat     := fDesembolsos;
       CdsDispSinteticaSALDODIA.AsFloat        := fSaldoDoDia;
       CdsDispSintetica.Post;

       // Esconde a animação
       Animate.Active := False;
       Animate.Visible := False;

       CdsDispSintetica.EnableControls;

       // Habilita o Timer
       lblTempo.Caption := Format('Tempo decorrido - Consulta Sintética: %s',[TimeToStr(Now - dtInicio)]);
       Timer.Enabled := True;
       if bFirstAtualiza then
          bFirstAtualiza := False;
       bFaz := False;
   end;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.PgcSaldosChange(Sender: TObject);
var dtInicio : TDateTime;
begin
   inherited;
   bmPosicao := CdsDispSintetica.GetBookmark;
   cmbTipos.Text := '';
   if PgcSaldos.ActivePage = tbsAnalitica then
   begin
      lblTempo.Caption := '';
      dtInicio := Now;
      qryDebug.Close;
      qryDebug.SQL.Clear;
      dbgAnalitico.RefreshDisplay;

      MontaParametros('qryAnalitica');

//      qryAnalitica.Sql.SaveToFile('c:\planus\temp\DispFinancAnalitica.txt');

      CdsDispAnalitica.Close;
      CdsDispAnalitica.Open;

      sPatro := CdsDispAnaliticaPATRO.AsString;
      sPlano := CdsDispAnaliticaPLANO.AsString;

      // Inclui Saldo Final
      if not CdsDispAnalitica.IsEmpty then
         CdsDispAnalitica.Append
      else
         CdsDispAnalitica.Insert;
      CdsDispAnaliticaNODOCUMENTO.AsString := '';
      CdsDispAnaliticaNOMEFORCLI.AsString  := 'SALDO FINAL   - ' + CdsDispSinteticaNOMEPLANOPATRO.AsString;
      CdsDispAnaliticaSALDO.AsFloat        := 0;
      CdsDispAnaliticaTIPOREG.AsString     := '4';
      CdsDispAnaliticaIDPLANO.AsInteger    := CdsDispSinteticaIDPLANO.AsInteger;
      CdsDispAnaliticaIDPATRO.AsInteger    := CdsDispSinteticaIDPATRO.AsInteger;
      CdsDispAnaliticaSALDOANT.AsFloat     := CdsDispSinteticaSALDODIA.AsFloat;
      CdsDispAnaliticaRECEBIMENTOS.AsFloat := CdsDispSinteticaRECEBIMENTOS.AsFloat;
      CdsDispAnaliticaDESEMBOLSOS.AsFloat  := CdsDispSinteticaDESEMBOLSOS.AsFloat;
      CdsDispAnaliticaCODCENTRORESPON.AsString := '';
      CdsDispAnaliticaNOME.AsString := '';
      CdsDispAnalitica.Post;

      qryAnalitica.EnableControls;
      lblTempo.Caption := Format('Tempo decorrido - Consulta Analítica: %s',[TimeToStr(Now - dtInicio)]);
   end
   else if PgcSaldos.ActivePage = tbsSintetica then
      CdsDispSintetica.Filter := ''
   else if PgcSaldos.ActivePage = tbsDepuracao then
   begin
      qryDebug.Close;
      qryDebug.SQL.Clear;
      memoDebug.Clear;
   end;

   CdsDispSintetica.GotoBookmark(bmPosicao);
   CdsDispSintetica.FreeBookmark(bmPosicao);
end;



procedure TfrmConsDisponibilidadeMT_CGPC.FormCreate(Sender: TObject);
begin
  inherited;
   lbltempo.caption := '';
   CtrlDisponibxusu := TCtrlDisponibxusu.Create;
   CtrlDisponibxusu.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,
                               nil,False,eOnMessage);

   CtrlDisponFinanc:=TCtrlDisponFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                              Sistema.IdUsuario,Sistema.UsaPlanoPatro);
   CtrlDisponFinanc.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,
                               nil,False,eOnMessage);

   CtrlParamFinanc := TCtrlParamFinanc.Create;
   CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,
                               nil,False,eOnMessage);
   CdsParamFinanc.Data  := CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);

   edtDataRef.Date      := CdsParamFinanc.FieldByName('DATABLOQDISPFINAN').AsDateTime;

   //AL_13
   CtrlParamFinanc.CdsParamFinanc := CdsParamFinanc;
   edtIntervalo.Text := CdsParamFinanc.FieldByName('PERIODDISPONIB').AsString;

   AtualizaGrids;
end;

procedure TfrmConsDisponibilidadeMT_CGPC.FormDestroy(Sender: TObject);
begin
  inherited;

  //AL_13

  CtrlParamFinanc.Free;
  CtrlDisponibxusu.Free;
  CtrlDisponFinanc.Free;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.eOnMessage(sMsg : string);
begin
  MsgDlg(sMsg,'Atenção',mtWarning,[mbOk],0);
end;



procedure TfrmConsDisponibilidadeMT_CGPC.edtDataRefExit(Sender: TObject);
begin
  inherited;
   begin
      CdsDispFinanc.Data   := CtrlDisponFinanc.SelecionaDispFinanc(edtDataRef.Date );
      AtualizaGrids;
   end;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.AtualizaGrids;
begin
   bConciliada := False;
   dbgSintetico.Visible := True;
   dbgAnalitico.Visible := True;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.dbgAnaliticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.dbgDispAnaliticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.dbgDispSinteticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.dbgSinteticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.dbgAnaliticoTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.dbgDispAnaliticaTopRowChanged(Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.dbgDispSinteticaTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.dbgSinteticoTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.bbtnImprimirClick(Sender: TObject);
begin
  inherited;

   lblEmpresaSintetica.Caption := Sistema.NomeEmpresa;
   lblEmpresaAnalitica.Caption := Sistema.NomeEmpresa;
   lblGrafico.Caption          := Sistema.NomeEmpresa;
   lblDataGrafico.Caption   := edtDataRef.Text;
   lblDataSintetica.Caption := edtDataRef.Text;
   lblDataAnalitica.Caption := edtDataRef.Text;

   pplSintetica.DataSource := dsSintetica;
   pplAnalitica.DataSource := dsAnalitica;
   pplSintetica.AutoCreateFields := False;
   pplSintetica.AutoCreateFields := True;
   pplAnalitica.AutoCreateFields := False;
   pplAnalitica.AutoCreateFields := True;

   if PgcSaldos.ActivePage = tbsSintetica then
   begin
      CdsDispSintetica.DisableControls;
      TfrmPreview.CreateModalPreview(Application,
                                     rptDispSintetica,
                                     rptDispSintetica.PrinterSetup.DocumentName);
      CdsDispSintetica.EnableControls;
   end else
   if PgcSaldos.ActivePage = tbsAnalitica then
   begin
      qryAnalitica.DisableControls;
      CdsDispAnalitica.DisableControls;

      pplCaptionDispAnalitica.Caption := 'Disponibilidade Analítica' +' : ' + sPlano +' / ' + sPatro;
      TfrmPreview.CreateModalPreview(Application,
                                     rptDispAnalitica,
                                     rptDispAnalitica.PrinterSetup.DocumentName);
      qryAnalitica.EnableControls;
      CdsDispAnalitica.EnableControls;
   end
   else if PgcSaldos.ActivePage = tbsGrafico then
   begin
      qrySintetica.DisableControls;
      TfrmPreview.CreateModalPreview(Application,
                                     rptDispGrafico,
                                     rptDispGrafico.PrinterSetup.DocumentName);
      qrySintetica.EnableControls;
   end;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.rptDispAnaliticaStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   ppShape4.Brush.Color := clWhite;
   bFirst := True;
end;


procedure TfrmConsDisponibilidadeMT_CGPC.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
   if ((Trim(qryAnaliticaNOMEPLANOPATRO.AsString) = '') or
      (COPY(qryAnaliticaNOMEFORCLI.AsString,1,13) = 'SALDO INICIAL')) and
      (not bFirst) then
   else if (bFirst) and
      (Trim(qryAnaliticaNOMEPLANOPATRO.AsString) <> 'TOTAL GERAL') then
   else if bFirst then
      bFirst := False;
  inherited;
end;



//AL_13
procedure TfrmConsDisponibilidadeMT_CGPC.edtIntervaloExit(Sender: TObject);
var
   iIntervalo : string;
begin
  inherited;

   iIntervalo := DateTimeToStr(edtIntervalo.time);
   iIntervalo := FormatDateTime('hh:nn:ss',StrToDateTime(iIntervalo));
   try
      if Trim(iIntervalo) > '' then
      begin
         CdsParamFinanc.Edit;
         CdsParamFinanc.FieldByName('PERIODDISPONIB').AsString := edtIntervalo.Text;
         CdsParamFinanc.Post;
         if not(CtrlParamFinanc.AplicaAtualParamFinanc) then
            MsgDlg(CtrlParamFinanc.MessageInfo,'Erro',mtError,[mbOK],0)
      end;
   except
      MsgDlg(CtrlParamFinanc.MessageInfo,'Erro',mtError,[mbOK],0);
   end;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.ppShape3Print(Sender: TObject);
begin
  inherited;
   if cCorZebra = clWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := clWhite;

   if COPY(CdsDispSinteticaNOMEPLANOPATRO.AsString,1,11) = 'TOTAL GERAL' then
   begin
      TppShape(Sender).Brush.Color := clSilver;
      TppShape(Sender).Pen.Style := psSolid;
   end
   else
   begin
      TppShape(Sender).Brush.Color := cCorZebra;
      TppShape(Sender).Pen.Style := psClear;
   end;
end;



procedure TfrmConsDisponibilidadeMT_CGPC.ppShape4Print(Sender: TObject);
begin
  inherited;
   if cCorZebra = clWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := clWhite;

   if (qryAnaliticaIDPATRO.AsInteger = -1) or (qryAnaliticaIDPATRO.AsInteger = 9999999) then
      TppShape(Sender).Brush.Color := clSilver
   else
      TppShape(Sender).Brush.Color := cCorZebra;

   if CdsDispAnaliticaTIPOREG.AsInteger = 1 then // Saldo Incial
      dbtSaldoDoDia.BlankWhenZero := False
   else
      dbtSaldoDoDia.BlankWhenZero := True;
end;



function TfrmConsDisponibilidadeMT_CGPC.BuscaDiaRecolhCPMF(dDataRef:TDateTime):TDateTime;
var dData : TDateTime;
begin
   // Buscar a Quarta-feira da semana da DataRef.
   dData := dDataRef;
   if (DayOfWeek(dData) = 5) then // Quinta
      dData := dData + 6;
   if (DayOfWeek(dData) = 6) then // Sexta
      dData := dData + 5;
   if (DayOfWeek(dData) = 7) then // Sábado
      dData := dData + 4;
   if (DayOfWeek(dData) = 1) then // Domingo
      dData := dData + 3;
   if (DayOfWeek(dData) = 2) then // Segunda
      dData := dData + 2;
   if (DayOfWeek(dData) = 3) then // Terça
      dData := dData + 1;
   if (DayOfWeek(dData) = 4) then // Quarta
      dData := dData;
   dData := dData - 7; // Quanta anterior

   // Verificar se é útil. Se não, buscar o próximo dia útil. Achei o Dia Inicial da CPMF
   if not DiasUteis.DiaUtil(dData,-1,1,'',True,True,False) then
      dData := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dData,True,True,False);

   // Somar 02 dias úteis para achar o Dia de Recolhimento da CPMF
   Result := DiasUteis.SomaDiasUteis(dData, 2, -1, 1, '', True, True, False);
end;


function TfrmConsDisponibilidadeMT_CGPC.BuscaPrimeiroDiaIRRF(dDataRef:TDateTime):TDateTime;
var
   iAno, iMes, iDia : word;
begin
   DecodeDate(dDataRef, iAno, iMes, iDia);

   //if ((DiasUteis.ExtraiDia(dDataRef) = 10) or //Bruno Bastos - Sol: 101670 Kintana: 451499
   //    (DiasUteis.ExtraiDia(DiasUteis.UltDiaUtilAnterior(Sistema.IdEmpresa,EncodeDate(iAno,iMes,10),true,true,false)) = DiasUteis.ExtraiDia(dDataRef))) then //Bruno Bastos - Sol: 101670 Kintana: 451499
   //Bruno Bastos - Sol: 101670 Kintana: 451499 - Início
   if ((DiasUteis.ExtraiDia(dDataRef) = 20) or
       (DiasUteis.ExtraiDia(DiasUteis.UltDiaUtilAnterior(Sistema.IdEmpresa,EncodeDate(iAno,iMes,20),true,true,false)) = DiasUteis.ExtraiDia(dDataRef))) then
   //Bruno Bastos - Sol: 101670 Kintana: 451499 - Fim
   begin
      if DiasUteis.DiaUtil(Sistema.IdEmpresa,dDataRef,true,true,false) then
      begin
         //while not (DiasUteis.ExtraiDia(dDataRef) = 11) do //Bruno Bastos - Sol: 101670 Kintana: 451499
         //while not (DiasUteis.ExtraiDia(dDataRef) = DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(iAno, (iMes - 1)))) do //Bruno Bastos - Sol: 101670 Kintana: 451499
         //   dDataRef := dDataRef - 1; //Bruno Bastos - Sol: 101670 Kintana: 451499

         //Bruno Bastos - Sol: 105489 Kintana: 472013 - Início
         if iMes > 1 then
           iMes := iMes - 1
         else
           iMes := 12;
         //Bruno Bastos - Sol: 105489 Kintana: 472013 - Fim

         result := EncodeDate(iAno,iMes,1); //Bruno Bastos - Sol: 105489 Kintana: 472013
         //Bruno Bastos - Sol: 105489 Kintana: 472013 - result := EncodeDate(iAno,iMes - 1,1); //Bruno Bastos - Sol: 101670 Kintana: 451499
         //Result := dDataRef; //Bruno Bastos - Sol: 101670 Kintana: 451499
      end
      else
         Result := 1;
   end
   else
      Result := 1;
end;

function TfrmConsDisponibilidadeMT_CGPC.BuscaPrimeiDiaAposCPMF(dDataRef:TDateTime):TDateTime;
var
  dData : TDateTime;
begin
  dData := BuscaDiaRecolhCPMF(StrToDate(edtDataRef.Text));
  Result := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dData,True,True,False);
end;

procedure TfrmConsDisponibilidadeMT_CGPC.btnDebugClick(Sender: TObject);
var
  I, iPos: Integer;
  bCopia: Boolean;
  sAtivPlano : string; //Bruno Bastos - SOL: 108052 - Kintana: 497961
begin
   inherited;
   if Trim(cmbTipos.Text) = '' then
   begin
      MsgDlg('Não foi selecionado o tipo de query para "Debugar".','Atenção',mtWarning,[mbOk],0);
      if cmbTipos.CanFocus then
         cmbTipos.SetFocus;
      Exit;
   end
   else
   begin
      qryDebug.Close;
      qryDebug.SQL.Clear;
      memoDebug.Clear;
      Application.ProcessMessages;
      bCopia := False;

      // Somente executa se houver tiver rodado a qrySintetica
      if not CdsDispSintetica.IsEmpty then
      begin
         for I := 0 to (qrySintetica.SQL.Count -1) do
         begin
            // Verifica se a TAG existe na linha atual do SQL
            iPos := Pos(cmbTipos.Value + '_', qrySintetica.SQL.Strings[I]);
            if iPos > 0 then
            begin
               // Verifica se é a TAG inicial ou a final
               if Copy(qrySintetica.SQL.Strings[I], iPos + Length(cmbTipos.Value), 2) = '_I' then
                  // Copia a PRÓXIMA linha e as seguintes
                  bCopia := True
               else
                  // Para de copiar as linhas seguintes
                  bCopia := False;
            end

            //AL_1 Ini
            else
               if bCopia = False then
                  qryDebug.SQL.Add('');

            // Copia a linha de SQL para a query de debug
            if bCopia then
            begin
               qryDebug.SQL.Add(qrySintetica.SQL.Strings[I]);

               // TROCA PARAMETROS
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAREF'      , QuotedStr(DateToStr(dDataRef)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAANT'      , QuotedStr(DateToStr(dDataAnt)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATASALDOANT' , QuotedStr(DateToStr(CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAINIMESANT', QuotedStr(DateToStr(dDataIniMesAnt)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAFIMMESANT', QuotedStr(DateToStr(dDataFimMesAnt)));

               //AL_15
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAINSS'     , QuotedStr(DateToStr(dDataINSS)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAINIIRRF'  , QuotedStr(DateToStr(dDataIniIRRF)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAFIMIRRF'  , QuotedStr(DateToStr(dDataFimIRRF)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':IDPATRO'      , IntToStr(CdsDispSinteticaIDPATRO.AsInteger));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':IDPLANOPREV'  , IntToStr(CdsDispSinteticaIDPLANO.AsInteger));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':IDPESSOA'     , IntToStr(Sistema.IdEmpresa));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':BSALDOANTINSS', IntToStr(iSaldoAntINSS));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':BSALDOANTIRRF', IntToStr(iSaldoAntIRRF));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':BQUARTA'      , IntToStr(iQuarta));

               //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Início
               case cmbSitPlano.ItemIndex of
                  0: sAtivPlano := QuotedStr('S');
                  1: sAtivPlano := QuotedStr('N');
                  2: sAtivPlano := 'NULL';
               end;

               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':PSATIVO'      , sAtivPlano);
               //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Fim

               memoDebug.Lines.Add(qryDebug.SQL.Strings[I]);
               memoDebug.refresh;
               Repaint;
            end;
         end;

         // Retira a Primeira linha ( linha com o comentário da TAG )
         if Trim(qryDebug.SQL.Text) <> '' then
         begin
            qryDebug.SQL.Strings[0] := '';

            MontaParametros('qryDebug');

            qryDebug.Open;
            pgcDebug.ActivePage := tbsResulDebug;

         //AL_1 Fim
         end
         else
            MsgDlg('A TAG ' + cmbTipos.Value + ' não foi encontrada no SQL','Atenção',mtWarning,[mbOk],0);
      end
         else
            MsgDlg('A Disponibilidade Consolidada não foi executada.','Atenção',mtWarning,[mbOk],0);
   end;
end;

procedure TfrmConsDisponibilidadeMT_CGPC.cmbTiposChange(Sender: TObject);
begin
   inherited;
   with qryDebug do
   begin
      Close;
      SQL.Clear;
   end;
end;

function TfrmConsDisponibilidadeMT_CGPC.TrocaString(sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
var
   iPos: Integer;
begin
   Result := sValor;
   if sBusca = sTroca then Exit;
   iPos := Pos(sBusca, sValor);
   while iPos <> 0 do
   begin
      Delete(sValor,iPos, Length(sBusca));
      if sTroca <> '' then
         Insert(sTroca,sValor,iPos);
      if bPrimeira then Exit;
      iPos := Pos(sBusca, sValor);
   end;
   Result := sValor;
end;

procedure TfrmConsDisponibilidadeMT_CGPC.dbgDebugCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmConsDisponibilidadeMT_CGPC.dbgDebugTopRowChanged(Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidadeMT_CGPC.ppLabel3Print(Sender: TObject);
begin
  inherited;
  TppLabel(Sender).Caption:=Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

procedure TfrmConsDisponibilidadeMT_CGPC.lblDispAnaSistemaPrint(Sender: TObject);
begin
  inherited;
  TppLabel(Sender).Caption:=Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

procedure TfrmConsDisponibilidadeMT_CGPC.ppLabel9Print(Sender: TObject);
begin
  inherited;
  TppLabel(Sender).Caption:=Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

Function TFrmConsDisponibilidadeMT_CGPC.MontaQueryDisponibilidade(Const pTipoDisp      : Integer;
                                                                  Const pDataRef,
                                                                        pDataAnt       : TDateTime;
                                                                  Const pIdPessoa      : Integer;
                                                                  Const pDataSaldoAnt  : TDateTime;
                                                                        pAnoRateio     : String;
                                                                  Const pDataIniMesAnt,
                                                                        pDataFimMesAnt,
                                                                        pDataINSS      : TDateTime;
                                                                  Const pBSaldoAntINSS : Integer;
                                                                  Const pDataIniIRRF,
                                                                        pDataFimIRRF   : TDateTime;
                                                                  Const pBSaldoAntIRRF : Integer;
                                                                  Const pPSAtivo       : String;
                                                                  Const pIdPatro       : Integer = -1;
                                                                  Const pIdPlanoPrev   : Integer = -1) : String;
var sSql : TStringList;
    sNomeArquivo,
    sPatro, 
    sPlanoPrev : String;
begin
  Case pTipoDisp of
    0 : sNomeArquivo := 'QryDispFinanNormalSinteticaCGPC.Sql';
    1 : sNomeArquivo := 'QryDispFinanNormalAnaliticaCGPC.Sql';
    2 : sNomeArquivo := 'QryDispFinanNormalDebugCGPC.Sql';
  end;

  If pIdPatro = -1 then
    sPatro := 'Null'
  else
    sPatro := IntToStr(pIdPatro);

  If pIdPlanoPrev = -1 then
    sPlanoPrev := 'Null'
  else
    sPlanoPrev := IntToStr(pIdPlanoPrev);


  sSql := TStringList.Create;
  // Se Disponibilidade Sintética
  If pTipoDisp = 0 then
  begin
    sSql.Add('SELECT');
    sSql.Add('   UU.IDPATRO,');
    sSql.Add('   UU.IDPLANO,');
    sSql.Add('   UU. NOMEPLANOPATRO,');
    sSql.Add('   NVL(SUM(UU.SALDOANT),0) AS SALDOANT,');
    sSql.Add('   NVL(SUM(UU.RECEBIMENTOS),0) AS RECEBIMENTOS,');
    sSql.Add('   NVL(SUM(UU.DESEMBOLSOS),0) AS DESEMBOLSOS,');
    sSql.Add('   NVL((SUM(UU.SALDOANT) + SUM(UU.RECEBIMENTOS) + SUM(UU.DESEMBOLSOS)),0) AS SALDODIA');
    sSql.Add('FROM');
    sSql.Add('   (');
    sSql.Add('-- (1) INICIO DA QRYANALITICA');
    sSql.Add('-- TAG QRYANALIT_I');
  end;

  sSql.Add('SELECT');
  sSql.Add('   DECODE(DECODE(U.NUMAPGR,NULL,U.NODOCUMENTO,U.NUMAPGR),NULL,U.NODOCUMENTO,U.NUMAPGR) AS NUMDOC,');
  sSql.Add('   U.NUMAPGR,');
  sSql.Add('   U.NODOCUMENTO AS NODOCUMENTO,');
  sSql.Add('   U.NOMEFORCLI || DECODE(');
  sSql.Add('                          DECODE(U.IDPATRO,-1,''TOTAL GERAL'',');
  sSql.Add('                          DECODE(U.IDPATRO,9999999,''TOTAL GERAL'',');
  sSql.Add('                          DECODE(INSTR(''23'',TIPOREG),0,PT.NOME|| '' - '' ||P.NOME,''''))),'''','''',');
  sSql.Add('                          '' - '' || DECODE(U.IDPATRO,-1,''TOTAL GERAL'',');
  sSql.Add('                                   DECODE(U.IDPATRO,9999999,''TOTAL GERAL'',');
  sSql.Add('                                   DECODE(INSTR(''23'',TIPOREG),0,PT.NOME||'' - '' ||P.NOME,'''')))) AS NOMEFORCLI,');
  sSql.Add('   U.SALDO,');
  sSql.Add('   U.CODCENTRORESPON,');
  sSql.Add('   (PT.NOME||'' - '' ||P.NOME) AS NOMEPLANOPATRO,');
  sSql.Add('   CN.NOME,');
  sSql.Add('   U.IDPLANOPREV AS IDPLANO,');
  sSql.Add('   U.IDPATRO,');
  sSql.Add('   U.TIPOREG,');
  sSql.Add('   NVL(DECODE(INSTR(''14'',TIPOREG),0,0,U.SALDO),0) AS SALDOANT,');
  sSql.Add('   NVL(DECODE(INSTR(''23'',TIPOREG),0,0,DECODE(SIGN(U.SALDO),1,U.SALDO,0)),0) AS RECEBIMENTOS,');
  sSql.Add('   NVL(DECODE(INSTR(''23'',TIPOREG),0,0,DECODE(SIGN(U.SALDO),-1,U.SALDO,0)),0) AS DESEMBOLSOS,');
  sSql.Add('   0 AS SALDODIA,');
  sSql.Add('   U.IDPESSOA,');
  sSql.Add('   PT.NOME AS PLANO,');
  sSql.Add('   P.NOME AS PATRO');
  sSql.Add('FROM PESSOA P, PLANPREVCONTABIL PT,CENTRESPON CN,');
  sSql.Add('   (');
  sSql.Add('    -- (1.0) SALDO ANTERIOR');
  sSql.Add('    -- TAG SALDOANT_10_I');
  sSql.Add('    SELECT');
  sSql.Add('       ''SALDO INICIAL'' AS NOMEFORCLI, (DECODE(SIGN(SUM(SALDO)),-1,SUM(SALDO),0) + DECODE(SIGN(SUM(SALDO)),1,SUM(SALDO),0))  AS SALDO, '' '' AS NODOCUMENTO, 0 AS NUMAPGR, IDPLANOPREV, IDPATRO, 1 AS TIPOREG, '' '' AS CODCENTRORESPON, IDPESSOA');
  sSql.Add('    FROM');
  sSql.Add('       (');
  sSql.Add('        -- (1.1) SALDO ANTERIOR - REGISTROS BAIXADOS E MODULO <> INVESTIMENTOS');
  sSql.Add('        -- TAG SALDOANT_11_I');
  sSql.Add('        SELECT');
  sSql.Add('           ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO,');
  sSql.Add('           0 AS IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO,');
  sSql.Add('           '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
  sSql.Add('        FROM MOVIMFINANC M, RATEIOFINANC R');
  sSql.Add('        WHERE (M.DATADISPFINANC > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('           AND (M.DATADISPFINANC < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('           AND (M.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('           AND (M.STATUSCONCILIA <> ''C'')');
  sSql.Add('           AND (M.VALORLANCFINAN <> 0)');
  sSql.Add('           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBTOPAGTO R1, DOCUMENTO D1');
  sSql.Add('                             WHERE ((M1.CODLANCTRANSF IS NULL) OR (M1.CODLANCTRANSF = 0))');
  sSql.Add('                                AND (M1.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                                AND (M1.STATUSCONCILIA <> ''C'')');
  sSql.Add('                                AND (M.DATADISPFINANC  > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('                                AND (M.DATADISPFINANC  < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                                AND (R1.CODLANCFINANC(+) = M1.CODLANCFINANC)');
  sSql.Add('                                AND (D1.CODDOCUMENTO(+)   = R1.CODDOCUMENTO)');
  sSql.Add('                                AND (D1.IDMODULO = 79)');
  sSql.Add('                                AND (M1.CODLANCFINANC = M.CODLANCFINANC)))');
  sSql.Add('           AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('           AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('           AND (M.CODLANCFINANC = R.CODLANCFINANC)');
  sSql.Add('        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA');
  sSql.Add('        -- TAG SALDOANT_11_F');
  sSql.Add('');
  sSql.Add('        UNION ALL');
  sSql.Add('');
  sSql.Add('        -- (1.2) SALDO ANTERIOR - REGISTRO BAIXADOS PELO RECBTO X PAGTO E MODULO <> INVESTIMENTOS');
  sSql.Add('        -- TAG SALDOANT_12_I');
  sSql.Add('        SELECT');
  sSql.Add('           ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO,');
  sSql.Add('           0 AS IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO,');
  sSql.Add('           '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
  sSql.Add('        FROM MOVIMFINANC M, RATEIOFINANC R');
  sSql.Add('        WHERE (M.DATADISPFINANC > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('          AND (M.DATADISPFINANC < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('          AND (M.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('          AND (M.STATUSCONCILIA <> ''C'')');
  sSql.Add('          AND ((M.VALORLANCFINAN = 0) AND (M.CODLANCTRANSF IS NULL))');
  sSql.Add('          AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBTOPAGTO R1, DOCUMENTO D1');
  sSql.Add('                            WHERE ((M1.CODLANCTRANSF IS NULL) OR (M1.CODLANCTRANSF = 0))');
  sSql.Add('                              AND (M1.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                              AND (M1.STATUSCONCILIA <> ''C'')');
  sSql.Add('                              AND (M.DATADISPFINANC  > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('                              AND (M.DATADISPFINANC  < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                              AND (R1.CODLANCFINANC(+) = M1.CODLANCFINANC)');
  sSql.Add('                              AND (D1.CODDOCUMENTO(+)  = R1.CODDOCUMENTO)');
  sSql.Add('                              AND (D1.IDMODULO = 79)');
  sSql.Add('                              AND (M1.CODLANCFINANC = M.CODLANCFINANC)))');
  sSql.Add('          AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('          AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('          AND (M.CODLANCFINANC = R.CODLANCFINANC)');
  sSql.Add('        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA');
  sSql.Add('        -- TAG SALDOANT_12_F');
  sSql.Add('');
  sSql.Add('        UNION ALL');
  sSql.Add('');
  sSql.Add('        -- (1.3) SALDO ANTERIOR - REGISTROS TRC ENTRE PLANOS E MODULO <> INVESTIMENTOS');
  sSql.Add('        -- TAG SALDOANT_13_I');
  sSql.Add('        SELECT');
  sSql.Add('           ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDO, R.IDPLANOPREV, R.IDPATRO,');
  sSql.Add('           0 AS IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO,');
  sSql.Add('           '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
  sSql.Add('        FROM MOVIMFINANC M, RATEIOFINANC R');
  sSql.Add('        WHERE (((M.DATALANCFINAN  BETWEEN TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY'') AND TO_DATE('+QuotedStr(DateToStr(pDataAnt))+',''DD/MM/YYYY'')) AND (M.DATADISPFINANC IS NULL)) OR');
  sSql.Add('               ((M.DATALANCFINAN  BETWEEN TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY'') AND TO_DATE('+QuotedStr(DateToStr(pDataAnt))+',''DD/MM/YYYY'')) AND (M.DATADISPFINANC BETWEEN TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY'') AND TO_DATE('+QuotedStr(DateToStr(pDataAnt))+',''DD/MM/YYYY''))) OR');
  sSql.Add('               ((M.DATADISPFINANC BETWEEN TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY'') AND TO_DATE('+QuotedStr(DateToStr(pDataAnt))+',''DD/MM/YYYY''))))');
  sSql.Add('          AND (M.DATADISPFINANC > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('          AND (M.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('          AND (M.STATUSCONCILIA <> ''C'')');
  sSql.Add('          AND (M.VALORLANCFINAN = 0)');
  sSql.Add('          AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRANSF = M.CODLANCFINANC))');
  sSql.Add('          AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBTOPAGTO R1, DOCUMENTO D1');
  sSql.Add('                            WHERE ((M1.CODLANCTRANSF IS NULL) OR (M1.CODLANCTRANSF = 0))');
  sSql.Add('                              AND (M1.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                              AND (M1.IDMODULO <> 3)');
  sSql.Add('                              AND (M1.STATUSCONCILIA <> ''C'')');
  sSql.Add('                              AND (((M1.DATALANCFINAN  BETWEEN TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY'') AND TO_DATE('+QuotedStr(DateToStr(pDataAnt))+',''DD/MM/YYYY'')) AND (M1.DATADISPFINANC IS NULL)) OR');
  sSql.Add('                                   ((M1.DATALANCFINAN  BETWEEN TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY'') AND TO_DATE('+QuotedStr(DateToStr(pDataAnt))+',''DD/MM/YYYY'')) AND (M1.DATADISPFINANC BETWEEN TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY'') AND TO_DATE('+QuotedStr(DateToStr(pDataAnt))+',''DD/MM/YYYY''))) OR');
  sSql.Add('                                   ((M1.DATADISPFINANC BETWEEN TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY'') AND TO_DATE('+QuotedStr(DateToStr(pDataAnt))+',''DD/MM/YYYY''))))');
  sSql.Add('                              AND (M1.DATADISPFINANC > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('                              AND (R1.CODLANCFINANC(+) = M1.CODLANCFINANC)');
  sSql.Add('                              AND (D1.CODDOCUMENTO(+)   = R1.CODDOCUMENTO)');
  sSql.Add('                              AND (D1.IDMODULO = 79)');
  sSql.Add('                              AND (M1.CODLANCFINANC = M.CODLANCFINANC)))');
  sSql.Add('          AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('          AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('          AND (M.CODLANCFINANC = R.CODLANCFINANC)');
  sSql.Add('        GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA');
  sSql.Add('        -- TAG SALDOANT_13_F');
  sSql.Add('');
  sSql.Add('        UNION ALL');
  sSql.Add('');
  sSql.Add('        -- (1.4) SALDO ANTERIOR - REGISTROS DE CPMF BAIXADOS');
  sSql.Add('        -- TAG SALDOANT_14_I');
  sSql.Add('        SELECT');
  sSql.Add('           ''SALDO INICIAL'' AS NOMEFORCLI, SUM(R.VALOR) * -1 AS SALDO, R.IDPLANOPREV, R.IDPATRO,');
  sSql.Add('           0 AS IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR,');
  sSql.Add('           1 AS TIPOREG, '''' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
  sSql.Add('        FROM MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO');
  sSql.Add('        WHERE (M.CODLANCFINANC IN (SELECT M.CODLANCFINANC FROM MOVIMFINANC M');
  sSql.Add('                                   WHERE (M.IDMODULO = 3)');
  sSql.Add('                                     AND (IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                                     AND (DATALANCFINAN > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('                                     AND (DATALANCFINAN < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                                     AND (M.CODLANCFINANC IN (SELECT DISTINCT CODLANCFINANC FROM RATEIOFINANC');
  sSql.Add('                                                              WHERE CODTIPDOC = (SELECT CODTIPDOCCPMF FROM PARAMCAP WHERE IDPESSOA = '+IntToStr(pIdPessoa)+' AND RECPAG = ''P'')))))');
  sSql.Add('          AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('          AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('          AND (M.CODLANCFINANC = R.CODLANCFINANC)');
  sSql.Add('          AND (M.CODPORTADOR = PO.CODPORTADOR)');
  sSql.Add('        GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPORTADOR');
  sSql.Add('        -- TAG SALDOANT_14_F');
  sSql.Add('');
  sSql.Add('        UNION ALL');
  sSql.Add('        -- (1.4.1) SALDO ANTERIOR - CPMF NAO BAIXADOS DE TRANSF ENTRE CONTAS');
  sSql.Add('        -- TAG SALDOANT_141_I');
  sSql.Add('        SELECT');
  sSql.Add('           ''SALDO INICIAL'' AS NOMEFORCLI, SUM(R.VLRCPMF) * -1 AS SALDO, R.IDPLANOPREV, R.IDPATRO,');
  sSql.Add('           0 AS IDFORCLI, 0 AS CODDOCUMENTO, I.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR,');
  sSql.Add('           1 AS TIPOREG, '''' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
  sSql.Add('        FROM IMPOSTORETIDO  I, RATEIOIMPOSTORETIDO R');
  sSql.Add('        WHERE I.DATARETENCAO > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY'')');
  sSql.Add('          AND I.DATARETENCAO < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY'')');
  sSql.Add('          AND I.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FROM PARAMFINANC)');
  sSql.Add('          AND I.CODDOCUMENTO IS NULL');
  sSql.Add('          AND I.NUMLOTEMANUAL = 0');
  sSql.Add('          AND I.CODLANCFINANC IS NOT NULL');
  sSql.Add('          AND I.IDPESSOA = '+IntToStr(pIdPessoa)+'');
  sSql.Add('          AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('          AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('          AND (I.IDIMPOSTORETIDO = R.IDIMPOSTORETIDO)');
  sSql.Add('        GROUP BY R.IDPLANOPREV,R.IDPATRO, I.IDPESSOA, I.CODPORTADOR, I.IDFORCLI');
  sSql.Add('        -- TAG SALDOANT_141_F');
  sSql.Add('');
  sSql.Add('        UNION ALL');
  sSql.Add('');
  sSql.Add('        -- (1.5) SALDO ANTERIOR - REGISTROS DE CPMF NAO BAIXADOS');
  sSql.Add('        -- TAG SALDOANT_15_I');
  sSql.Add('        SELECT');
  sSql.Add('          ''SALDO INICIAL'' AS NOMEFORCLI, SUM(R.VALOR) * -1 AS SALDO, R.IDPLANOPREV, R.IDPATRO,');
  sSql.Add('          0 AS IDFORCLI, 0 AS CODDOCUMENTO, D.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR,');
  sSql.Add('          1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
  sSql.Add('        FROM DOCUMENTO D, LANCTODOCUM L, VW_RateioDocum R,');
  sSql.Add('            (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = '+IntToStr(pIdPessoa)+' AND P.RECPAG = ''P'') P');
  sSql.Add('        WHERE (D.DATAPROGRAMADA > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('          AND (D.DATAPROGRAMADA < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('          AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('          AND (D.RECPAG = ''P'')');
  sSql.Add('          AND (D.OPERACAO IN (''2 '',''1 ''))');
  sSql.Add('          AND (D.STATUS <> ''2'')');
  sSql.Add('          AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('          AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('          AND (D.CODTIPDOC = P.CODTIPDOCCPMF)');
  sSql.Add('          AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('          AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('          AND (R.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('        GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.NODOCUMENTO,');
  sSql.Add('                 R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.CODCENTRORESPON');
  sSql.Add('        -- TAG SALDOANT_15_F');
  sSql.Add('');
  sSql.Add('        UNION ALL');
  sSql.Add('');
  sSql.Add('        -- (1.6) SALDO ANTERIOR - REGISTROS DE RECEBIMENTO E MODULO DE INVESTIMENTOS');
  sSql.Add('        -- TAG SALDOANT_16_I');
  sSql.Add('         SELECT');
  sSql.Add('            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG');
  sSql.Add('         FROM LANCTODOCUM L,');
  sSql.Add('             (SELECT');
  sSql.Add('                ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO,');
  sSql.Add('                D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG,');
  sSql.Add('                DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, '' '' AS CODCENTRORESPON, D.RECPAG');
  sSql.Add('              FROM DOCUMENTO D,LANCTODOCUM L,');
  sSql.Add('                  (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO');
  sSql.Add('                   FROM VW_RateioDocum R1, DOCUMENTO D1');
  sSql.Add('                   WHERE (D1.DATADISPONIB > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('                     AND (D1.DATADISPONIB < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                     AND (D1.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                     AND (D1.OPERACAO IN (''2 ''))');
  sSql.Add('                     AND (D1.RECPAG = ''R'')');
  sSql.Add('                     AND (D1.IDMODULO  = 79)');
  sSql.Add('                     AND (('+sPatro+' IS NULL) OR (R1.IDPATRO = '+sPatro+'))');
  sSql.Add('                     AND (('+sPlanoPrev+' IS NULL) OR (R1.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('                     AND (R1.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('                     AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,');
  sSql.Add('                  (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR');
  sSql.Add('                   FROM RECBTOPAGTO RE, LANCTODOCUM LA');
  sSql.Add('                   WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
  sSql.Add('                     AND LA.DEBCRE = ''D''');
  sSql.Add('                     AND LA.NUMLANCTO = RE.NUMLANCTO) P');
  sSql.Add('              WHERE (D.DATADISPONIB > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('                AND (D.DATADISPONIB < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                AND (NVL(L.VALOR,0) <> 0)');
  sSql.Add('                AND (D.OPERACAO IN (''2 ''))');
  sSql.Add('                AND (L.OPERACAO <> 5)');
  sSql.Add('                AND (D.RECPAG = ''R'')');
  sSql.Add('                AND (D.IDMODULO  = 79)');
  sSql.Add('                AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('                AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
  sSql.Add('              GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO,');
  sSql.Add('                       D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,');
  sSql.Add('                       R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OPERACAO,');
  sSql.Add('                       D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO');
  sSql.Add('              HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A');
  sSql.Add('         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO');
  sSql.Add('           AND L.OPERACAO NOT IN (''4 '',''5 '')');
  sSql.Add('        -- TAG SALDOANT_16_F');
  sSql.Add('');
  sSql.Add('        UNION ALL');
  sSql.Add('');
  sSql.Add('        -- (1.7) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E MODULO DE INVESTIMENTOS');
  sSql.Add('        -- TAG SALDOANT_17_I');
  sSql.Add('        SELECT');
  sSql.Add('            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG');
  sSql.Add('        FROM LANCTODOCUM L,');
  sSql.Add('            (SELECT');
  sSql.Add('                ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI,');
  sSql.Add('                D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG,');
  sSql.Add('                DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, '' '' AS CODCENTRORESPON, D.RECPAG');
  sSql.Add('             FROM DOCUMENTO D,LANCTODOCUM L,');
  sSql.Add('                 (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO');
  sSql.Add('                  FROM VW_RateioDocum R1, DOCUMENTO D1');
  sSql.Add('                  WHERE  (D1.DATADISPONIB > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('                    AND (D1.DATADISPONIB < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                    AND (D1.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                    AND (D1.OPERACAO IN (''2 ''))');
  sSql.Add('                    AND (D1.RECPAG = ''P'')');
  sSql.Add('                    AND (D1.IDMODULO  = 79)');
  sSql.Add('                    AND (('+sPatro+' IS NULL) OR (R1.IDPATRO = '+sPatro+'))');
  sSql.Add('                    AND (('+sPlanoPrev+' IS NULL) OR (R1.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('                    AND (R1.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,');
  sSql.Add('                 (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR');
  sSql.Add('                  FROM RECBTOPAGTO RE, LANCTODOCUM LA');
  sSql.Add('                  WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
  sSql.Add('                    AND LA.DEBCRE = ''D''');
  sSql.Add('                    AND LA.NUMLANCTO = RE.NUMLANCTO) P');
  sSql.Add('             WHERE (D.DATADISPONIB > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('               AND (D.DATADISPONIB < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('               AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('               AND (NVL(L.VALOR,0) <> 0)');
  sSql.Add('               AND (D.OPERACAO IN (''2 ''))');
  sSql.Add('               AND (L.OPERACAO <> 5)');
  sSql.Add('               -- Arnaldo V. Scarin - 19/01/2010 - Inicio');
  sSql.Add('               AND NOT Exists (Select 1 From DocumxDocum dxd');
  sSql.Add('                               where dxd.iddocumento = d.coddocumento');
  sSql.Add('                                 and dxd.flgdispfinanc = ''S'')');
  sSql.Add('               -- Arnaldo V. Scarin - 19/01/2010 - Fim');
  sSql.Add('               AND (D.RECPAG = ''P'')');
  sSql.Add('               AND (D.IDMODULO  = 79)');
  sSql.Add('               AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('               AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('               AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
  sSql.Add('             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO,');
  sSql.Add('                      D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,');
  sSql.Add('                      R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OPERACAO,');
  sSql.Add('                      D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO');
  sSql.Add('             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A');
  sSql.Add('        WHERE A.CODDOCUMENTO = L.CODDOCUMENTO');
  sSql.Add('          AND L.OPERACAO NOT IN (''4 '',''5 '')');
  sSql.Add('        -- TAG SALDOANT_17_F');
  sSql.Add('');
  sSql.Add('        UNION ALL');
  sSql.Add('');
  sSql.Add('        -- (1.8) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E RECEBIMENTO NAO BAIXADOS E MODULO <> INVESTIMENTOS');
  sSql.Add('        -- TAG SALDOANT_18_I');
  sSql.Add('        SELECT');
  sSql.Add('           ''SALDO INICIAL'' AS NOMEFORCLI,  SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI,');
  sSql.Add('           D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG,');
  sSql.Add('           DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDES, '' '' AS CODCENTRORESPON, R.RECPAG');
  sSql.Add('        FROM DOCUMENTO D,LANCTODOCUM L,VW_RateioDocum R,');
  sSql.Add('            (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = '+IntToStr(pIdPessoa)+' AND P.RECPAG = ''P'') P,');
  sSql.Add('            (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDO');
  sSql.Add('             FROM DOCUMENTO D, LANCTODOCUM L');
  sSql.Add('             WHERE (D.OPERACAO IN (''2 ''))');
  sSql.Add('               AND (D.RECPAG = ''P'')');
  sSql.Add('               AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('               AND (L.OPERACAO <> 5)');
  sSql.Add('               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('             GROUP BY D.CODDOCUMENTO) S,');
  sSql.Add('            (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''D'',LA.VALOR * -1,LA.VALOR) AS VALOR');
  sSql.Add('             FROM RECBTOPAGTO RE, LANCTODOCUM LA');
  sSql.Add('             WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
  sSql.Add('               AND LA.DEBCRE = ''D''');
  sSql.Add('               AND LA.NUMLANCTO = RE.NUMLANCTO) P');
  sSql.Add('        WHERE (D.DATAPROGRAMADA > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('          AND (D.DATAPROGRAMADA < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('          AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('          AND (NVL(L.VALOR,0) <> 0)');
  sSql.Add('          AND (D.OPERACAO IN (''2 ''))');
  sSql.Add('          AND (D.STATUS <> 2)');
  sSql.Add('          AND (D.RECPAG = ''P'')');
  sSql.Add('          AND (L.OPERACAO <> 5)');
  sSql.Add('          -- Arnaldo V. Scarin - 19/01/2010 - Inicio');
  sSql.Add('          AND NOT Exists (Select 1 From DocumxDocum dxd');
  sSql.Add('                          where dxd.iddocumento = d.coddocumento');
  sSql.Add('                            and dxd.flgdispfinanc = ''S'')');
  sSql.Add('          -- Arnaldo V. Scarin - 19/01/2010 - Fim');
  sSql.Add('          AND (D.IDMODULO  <> 79)');
  sSql.Add('          AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)');
  sSql.Add('          AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('          AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('          AND (R.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('          AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('          AND (D.OPERACAO = L.OPERACAO)');
  sSql.Add('          AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('          AND (D.CODDOCUMENTO = S.CODDOCUMENTO)');
  sSql.Add('          AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
  sSql.Add('        GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO,');
  sSql.Add('                 D.DATAPROGRAMADA,L.HISTORICOCOMPL,L.DATALANCTO,R.CODTIPRECDES,');
  sSql.Add('                 R.IDPLANOPREV,R.IDPATRO,R.RECPAG,D.IDPESSOA,D.OPERACAO,');
  sSql.Add('                 D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO');
  sSql.Add('        HAVING SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0');
  sSql.Add('        -- TAG SALDOANT_18_F');
  sSql.Add('');
  sSql.Add('        UNION ALL');
  sSql.Add('');
  sSql.Add('        -- (1.9) SALDO ANTERIOR - REGISTROS DE INSS');
  sSql.Add('        -- TAG SALDOANT_19_I');
  sSql.Add('        SELECT');
  sSql.Add('           DISTINCT');
  sSql.Add('           ''SALDO INICIAL'' AS NOMEFORCLI, (X.SALDO * -1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, 0 AS IDFORCLI,');
  sSql.Add('           0 AS CODDOCUMENTO, D.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO,');
  sSql.Add('           '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
  sSql.Add('        FROM DOCUMENTO D,LANCTODOCUM L,VW_RateioDocum R,');
  sSql.Add('            (');
  sSql.Add('             -- (1.9.1) REGISTROS QUE NAO ESTAO EM GPS');
  sSql.Add('             -- TAG SALDOANT_191_I');
  sSql.Add('             SELECT DISTINCT');
  sSql.Add('                L.DATALANCTO AS DATALANCTO, D.IDFORCLI AS IDFORCLI, P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, DECODE(L.DEBCRE, ''D'', L.VALOR, L.VALOR*-1) AS SALDO, D.OPERACAO, D.NUMFATURA, T.PLACONTA, D.NODOCUMENTO');
  sSql.Add('             FROM PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR T, VW_RateioDocum R, LANCIRRF N');
  sSql.Add('             WHERE (L.DATALANCTO >= TO_DATE('+QuotedStr(DateToStr(pDataIniMesAnt))+',''DD/MM/YYYY''))');
  sSql.Add('               AND (L.DATALANCTO <= TO_DATE('+QuotedStr(DateToStr(pDataFimMesAnt))+',''DD/MM/YYYY''))');
  sSql.Add('               AND (L.OPERACAO      = ''4'')');
  sSql.Add('               AND (D.IDPESSOA      = '+IntToStr(pIdPessoa)+')');
  sSql.Add('               AND (D.RECPAG        = ''P'')');
  sSql.Add('               AND (L.CODDOCINSS   IS NULL)');
  sSql.Add('               AND (N.IDDOCINSS IS NULL)');
  sSql.Add('               AND (NVL(N.VLRINSS,0) <> 0)');
  sSql.Add('               AND (L.ESTORNO      IS NULL)');
  sSql.Add('               AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO = 2))');
  sSql.Add('               AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('               AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('               AND (R.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('               AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)');
  sSql.Add('               AND (P.IDPESSOA      = D.IDFORCLI)');
  sSql.Add('               AND (L.CODALTERADOR  = T.CODALTERADOR)');
  sSql.Add('               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('               AND (D.CODDOCUMENTO  = N.CODDOCUMENTO(+))');
  sSql.Add('             -- TAG SALDOANT_191_F');
  sSql.Add('             ) X');
  sSql.Add('        WHERE 1 = '+IntToStr(pBSaldoAntINSS)+'');
  sSql.Add('          AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('          AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('          AND (D.CODDOCUMENTO = X.CODDOCUMENTO)');
  sSql.Add('          AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('          AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('          AND (L.NUMLANCTO = X.NUMLANCTO)');
  sSql.Add('          AND (R.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('        -- TAG SALDOANT_19_F');
  sSql.Add('');
  sSql.Add('        UNION ALL');
  sSql.Add('');
  sSql.Add('        -- (1.10) REGISTRO DE PAGAMENTOS ENGLOBADOS NAO BAIXADOS E MODULO <> INVESTIMENTOS');
  sSql.Add('        -- TAG SALDOANT_110_I');
  sSql.Add('        SELECT');
  sSql.Add('           ''SALDO INICIAL'' AS NOMEFORCLI, SUM(A.SALDO) AS SALDO, A.IDPLANOPREV, A.IDPATRO,');
  sSql.Add('           0 AS IDFORCLI, 0 AS CODDOCUMENTO, A.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR,');
  sSql.Add('           1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
  sSql.Add('        FROM');
  sSql.Add('            (SELECT');
  sSql.Add('               '''' AS NOMEFORCLI,');
  sSql.Add('               (SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))))-((SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) * C.SALDOALT)/SS.SALDOTOT) AS SALDO,');
  sSql.Add('               R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '''' AS TIPOREG,');
  sSql.Add('               DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, D.DATAPROGRAMADA, D.DATAVENCTO, L.DATALANCTO, R.RECPAG, D.NUMFATURA,');
  sSql.Add('               SS.SALDOTOT, C.SALDOALT');
  sSql.Add('             FROM DOCUMENTO D, LANCTODOCUM L,');
  sSql.Add('                 (SELECT D.NUMFATURA, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDOTOT');
  sSql.Add('                  FROM DOCUMENTO D, LANCTODOCUM L');
  sSql.Add('                  WHERE (D.OPERACAO IN (''1 ''))');
  sSql.Add('                    AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                    AND (D.RECPAG = ''P'')');
  sSql.Add('                    AND (D.NUMFATURA IS NOT NULL)');
  sSql.Add('                    AND (D.OPERACAO = L.OPERACAO)');
  sSql.Add('                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('                  GROUP BY D.NUMFATURA) SS,');
  sSql.Add('                 (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDODOC');
  sSql.Add('                  FROM DOCUMENTO D, LANCTODOCUM L');
  sSql.Add('                  WHERE (D.OPERACAO IN (''1 ''))');
  sSql.Add('                    AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                    AND (D.RECPAG = ''P'')');
  sSql.Add('                    AND (L.OPERACAO <> 5)');
  sSql.Add('                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('                  GROUP BY D.CODDOCUMENTO) S,');
  sSql.Add('                 (SELECT D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODCENTRORESPON');
  sSql.Add('                  FROM DOCUMENTO D, VW_RateioDocum R');
  sSql.Add('                  WHERE (D.OPERACAO IN (''1 ''))');
  sSql.Add('                    AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                    AND (D.RECPAG = ''P'')');
  sSql.Add('                    AND (D.NUMFATURA IS NOT NULL)');
  sSql.Add('                    AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('                    AND (R.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('                  GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R,');
  sSql.Add('                 (SELECT D.NUMFATURA, (SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1))* -1) AS SALDOALT');
  sSql.Add('                  FROM DOCUMENTO D, LANCTODOCUM L');
  sSql.Add('                  WHERE (D.OPERACAO IN (''3 ''))');
  sSql.Add('                    AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                    AND (D.RECPAG = ''P'')');
  sSql.Add('                    AND (L.OPERACAO NOT IN (''5 '',''3 ''))');
  sSql.Add('                    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('                  GROUP BY D.NUMFATURA) C,');
  sSql.Add('                 (SELECT D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO');
  sSql.Add('                  FROM DOCUMENTO D');
  sSql.Add('                  WHERE (D.OPERACAO IN (''3 ''))');
  sSql.Add('                    AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                    AND (D.RECPAG = ''P'')');
  sSql.Add('                    AND (D.NUMFATURA IS NOT NULL)) X');
  sSql.Add('             WHERE (X.DATAPROGRAMADA > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('               AND (X.DATAPROGRAMADA < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('               AND (D.RECPAG = ''P'')');
  sSql.Add('               AND (NVL(SS.SALDOTOT,0) <> 0 )');
  sSql.Add('               AND (D.STATUS <> ''2'')');
  sSql.Add('               AND (D.OPERACAO IN (''1 ''))');
  sSql.Add('               AND (L.OPERACAO <> 5)');
  sSql.Add('               -- Arnaldo V. Scarin - 19/01/2010 - Inicio');
  sSql.Add('               AND NOT Exists (Select 1 From DocumxDocum dxd');
  sSql.Add('                               where dxd.iddocumento = d.coddocumento');
  sSql.Add('                                 and dxd.flgdispfinanc = ''S'')');
  sSql.Add('               -- Arnaldo V. Scarin - 19/01/2010 - Fim');
  sSql.Add('               AND (D.IDMODULO <> 79)');
  sSql.Add('               AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('               AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('               AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('               AND (D.OPERACAO = L.OPERACAO)');
  sSql.Add('               AND (D.NUMFATURA = R.NUMFATURA)');
  sSql.Add('               AND (D.CODDOCUMENTO = S.CODDOCUMENTO)');
  sSql.Add('               AND (D.NUMFATURA = SS.NUMFATURA)');
  sSql.Add('               AND (D.NUMFATURA = C.NUMFATURA)');
  sSql.Add('               AND (D.NUMFATURA = X.NUMFATURA)');
  sSql.Add('             GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NODOCUMENTO, D.DATAPROGRAMADA,');
  sSql.Add('                      L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO,');
  sSql.Add('                      R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D.IDMODULO, D.CODDOCUMENTO,');
  sSql.Add('                      R.CODCENTRORESPON, D.NUMAPGR, D.NUMFATURA, SS.SALDOTOT, C.SALDOALT) A,');
  sSql.Add('            (SELECT D.NUMFATURA, D.DATAPROGRAMADA,  DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL');
  sSql.Add('             FROM DOCUMENTO D, LANCTODOCUM L');
  sSql.Add('             WHERE (D.OPERACAO IN (''3 ''))');
  sSql.Add('               AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('               AND (D.RECPAG = ''P'')');
  sSql.Add('               AND (D.NUMFATURA IS NOT NULL)');
  sSql.Add('               AND (L.OPERACAO=3)');
  sSql.Add('               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)) B');
  sSql.Add('        WHERE A.NUMFATURA = B.NUMFATURA(+)');
  sSql.Add('        GROUP BY A.NOMEFORCLI, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.IDPESSOA, A.CODTIPDOC,');
  sSql.Add('                 A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.HISTORICOCOMPL, A.CODTIPRECDES,');
  sSql.Add('                 A.CODCENTRORESPON, A.RECPAG');
  sSql.Add('        -- TAG SALDOANT_110_F');
  sSql.Add('');
  sSql.Add('        UNION ALL');
  sSql.Add('');
  sSql.Add('        -- (1.11) REGISTROS DE IRRF QUE NAO ESTAO EM DARF GERADO DA SEMANA ANTERIOR');
  sSql.Add('        -- TAG SALDOANT_111_I');
  sSql.Add('        SELECT DISTINCT');
  sSql.Add('           ''SALDO INICIAL'' AS NOMEFORCLI, (S.VALOR*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI,');
  sSql.Add('           D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, '' '' AS NODOCUMENTO,');
  sSql.Add('           '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
  sSql.Add('        FROM DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, VW_RateioDocum R,');
  sSql.Add('            (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO=1) X,');
  sSql.Add('            (SELECT L.CODDOCUMENTO,L.CODALTERADOR,L.VALOR,L.NUMLANCTO');
  sSql.Add('             FROM LANCTODOCUM L, DOCUMENTO D');
  sSql.Add('             WHERE (D.DATAVENCTO BETWEEN TO_DATE('+QuotedStr(DateToStr(pDataIniIRRF))+',''DD/MM/YYYY'') AND TO_DATE('+QuotedStr(DateToStr(pDataFimIRRF))+',''DD/MM/YYYY''))');
  sSql.Add('               AND (CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO=1))');
  sSql.Add('               AND (L.CODDOCUMENTO=D.CODDOCUMENTO)) S');
  sSql.Add('        WHERE (I.IDDARF IS NULL)');
  sSql.Add('          AND (VLRIRRF <> 0)');
  sSql.Add('          AND (L.CODALTERADOR IN X.CODALTERADOR)');
  sSql.Add('          AND (D.RECPAG = ''P'')');
  sSql.Add('          AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('          AND (L.OPERACAO <> 5)');
  sSql.Add('          AND (D.STATUS=2)');
  sSql.Add('          AND (1 = '+IntToStr(pBSaldoAntIRRF)+')');
  sSql.Add('          AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('          AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('          AND (R.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('          AND (D.CODDOCUMENTO = S.CODDOCUMENTO)');
  sSql.Add('          AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('          AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('          AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))');
  sSql.Add('        -- TAG SALDOANT_111_F');
  sSql.Add('');
  sSql.Add('        UNION ALL');
  sSql.Add('');
  sSql.Add('        -- (1.12) REGISTRO ZERADOS PARA SAIREM OS PLANOS/PATROS SEM MOVIMENTO QUANDO HOUVER');
  sSql.Add('        -- TAG SALDOANT_112_I');
  sSql.Add('        SELECT');
  sSql.Add('           ''SALDO INICIAL'' AS NOMEFORCLI, 0 AS SALDO, PA.IDPLANOPREV, PA.IDPATRO, 0 AS IDFORCLI,');
  sSql.Add('           0 AS CODDOCUMENTO, ('+IntToStr(pIdPessoa)+') AS IDPESSOA,  0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR,');
  sSql.Add('           1 AS TIPOREG, '' '' AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, '' '' AS CODTIPRECDES, '' '' AS CODCENTRORESPON, ''F'' AS RECPAG');
  sSql.Add('        FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL');
  sSql.Add('        WHERE (('+sPatro+' IS NULL) OR (PA.IDPATRO = '+sPatro+'))');
  sSql.Add('          AND (('+sPlanoPrev+' IS NULL) OR (PA.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('          AND (PA.IDPATRO = PE.IDPESSOA(+))');
  sSql.Add('          AND (PA.IDPLANOPREV = PL.IDPLANOPREV)');
  sSql.Add('          AND (PA.IDPLANOPREV NOT IN (23))');
  sSql.Add('          AND (('+pPSAtivo+' IS NULL) OR (PL.ATIVO = '+pPSAtivo+'))');
  sSql.Add('');
  sSql.Add('        -- TAG SALDOANT_112_F');
  sSql.Add('');
  sSql.Add('        --Bruno Bastos - 26/11/2009 - Início');
  sSql.Add('        UNION ALL');
  sSql.Add('        -- (1.13) SALDO ANTERIOR - REGISTROS DE RECEBIMENTO E MODULO DE INVESTIMENTOS');
  sSql.Add('        -- TAG SALDOANT_113_I');
  sSql.Add('        SELECT');
  sSql.Add('            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG');
  sSql.Add('        FROM LANCTODOCUM L,');
  sSql.Add('            (SELECT');
  sSql.Add('                ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI,');
  sSql.Add('                D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG,');
  sSql.Add('                DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, '' '' AS CODCENTRORESPON, D.RECPAG');
  sSql.Add('             FROM DOCUMENTO D,LANCTODOCUM L,');
  sSql.Add('                 (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO');
  sSql.Add('                  FROM VW_RateioDocum R1, DOCUMENTO D1');
  sSql.Add('                  WHERE (D1.DATADISPONIB > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('                    AND (D1.DATADISPONIB < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                    AND (D1.IDPESSOA = 1)');
  sSql.Add('                    AND (D1.OPERACAO IN (''2 ''))');
  sSql.Add('                    AND (D1.RECPAG = ''R'')');
  sSql.Add('                    AND (('+sPatro+' IS NULL) OR (R1.IDPATRO = '+sPatro+'))');
  sSql.Add('                    AND (('+sPlanoPrev+' IS NULL) OR (R1.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('                    AND (R1.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,');
  sSql.Add('                 (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR');
  sSql.Add('                  FROM RECBTOPAGTO RE, LANCTODOCUM LA');
  sSql.Add('                  WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
  sSql.Add('                    AND LA.DEBCRE = ''D''');
  sSql.Add('                    AND LA.NUMLANCTO = RE.NUMLANCTO) P,');
  sSql.Add('                  --bruno bastos - 26/11/2009');
  sSql.Add('                  DOCUMXDOCUM DXD');
  sSql.Add('             WHERE (D.DATADISPONIB > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('               AND (D.DATADISPONIB < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('               AND (D.IDPESSOA = 1)');
  sSql.Add('               AND (NVL(L.VALOR,0) <> 0)');
  sSql.Add('               AND (D.OPERACAO IN (''2 ''))');
  sSql.Add('               AND (L.OPERACAO <> 5)');
  sSql.Add('               AND (D.RECPAG = ''R'')');
  sSql.Add('               --bruno bastos - 26/11/2009');
  sSql.Add('               AND (D.CODDOCUMENTO    = DXD.IDDOCUMENTO)');
  sSql.Add('               AND (DXD.FLGDISPFINANC = ''S'')');
  sSql.Add('               -- Arnaldo V. Scarin - 09/02/2010');
  sSql.Add('               AND NOT EXISTS (SELECT 1 FROM LANCTODOCUM');
  sSql.Add('                               WHERE OPERACAO = ''5''');
  sSql.Add('                                 AND CODDOCUMENTO = D.CODDOCUMENTO)');
  sSql.Add('               -- Arnaldo V. Scarin - 09/02/2010');
  sSql.Add('               AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('               AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('               AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
  sSql.Add('             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO,');
  sSql.Add('                      D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,');
  sSql.Add('                      R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OPERACAO,');
  sSql.Add('                      D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO');
  sSql.Add('             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A');
  sSql.Add('        WHERE A.CODDOCUMENTO = L.CODDOCUMENTO');
  sSql.Add('          AND L.OPERACAO NOT IN (''4 '',''5 '')');
  sSql.Add('        -- TAG SALDOANT_113_F');
  sSql.Add('');
  sSql.Add('        UNION ALL');
  sSql.Add('');
  sSql.Add('        -- (1.14) SALDO ANTERIOR - REGISTROS DE PAGAMENTO E MODULO DE INVESTIMENTOS');
  sSql.Add('        -- TAG SALDOANT_114_I');
  sSql.Add('        SELECT');
  sSql.Add('            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG');
  sSql.Add('        FROM LANCTODOCUM L,');
  sSql.Add('            (SELECT');
  sSql.Add('                ''SALDO INICIAL'' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI,');
  sSql.Add('                D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, 1 AS TIPOREG, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO,');
  sSql.Add('                R.CODTIPRECDES, '' '' AS CODCENTRORESPON, D.RECPAG');
  sSql.Add('             FROM DOCUMENTO D, LANCTODOCUM L, DOCUMXDOCUM DXD,');
  sSql.Add('                 (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO');
  sSql.Add('                  FROM VW_RateioDocum R1, DOCUMENTO D1');
  sSql.Add('                  WHERE (D1.DATADISPONIB > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('                    AND (D1.DATADISPONIB < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                    AND (D1.IDPESSOA = 1)');
  sSql.Add('                    AND (D1.OPERACAO IN (''2 ''))');
  sSql.Add('                    AND (D1.RECPAG = ''P'')');
  sSql.Add('                    AND (('+sPatro+' IS NULL) OR (R1.IDPATRO = '+sPatro+'))');
  sSql.Add('                    AND (('+sPlanoPrev+' IS NULL) OR (R1.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('                    AND (R1.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('                    AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,');
  sSql.Add('                 (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR');
  sSql.Add('                  FROM RECBTOPAGTO RE, LANCTODOCUM LA');
  sSql.Add('                  WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
  sSql.Add('                    AND LA.DEBCRE = ''D''');
  sSql.Add('                    AND LA.NUMLANCTO = RE.NUMLANCTO) P');
  sSql.Add('             WHERE (D.DATADISPONIB > TO_DATE('+QuotedStr(DateToStr(pDataSaldoAnt))+',''DD/MM/YYYY''))');
  sSql.Add('               AND (D.DATADISPONIB < TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('               AND (D.IDPESSOA = 1)');
  sSql.Add('               --bruno bastos - 26/11/2009');
  sSql.Add('               AND (D.CODDOCUMENTO = DXD.IDDOCUMENTO)');
  sSql.Add('               AND (DXD.FLGDISPFINANC = ''S'')');
  sSql.Add('               AND (NVL(L.VALOR,0) <> 0)');
  sSql.Add('               AND (D.OPERACAO IN (''2 ''))');
  sSql.Add('               AND (L.OPERACAO <> 5)');
  sSql.Add('               AND (D.RECPAG = ''P'')');
  sSql.Add('               -- Arnaldo V. Scarin - 19/01/2010 - Inicio');
  sSql.Add('               AND NOT Exists (Select 1 From DocumxDocum dxd');
  sSql.Add('                               where dxd.iddocumento = d.coddocumento');
  sSql.Add('                                 and dxd.flgdispfinanc = ''S'')');
  sSql.Add('               -- Arnaldo V. Scarin - 19/01/2010 - Fim');
  sSql.Add('               AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('               AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('               AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
  sSql.Add('             GROUP BY D.IDFORCLI,D.DATAVENCTO,D.COMPLDOCUMENTO,D.NODOCUMENTO,');
  sSql.Add('                      D.DATAPROGRAMADA,L.DATALANCTO,R.CODTIPRECDES,');
  sSql.Add('                      R.IDPLANOPREV,R.IDPATRO,D.RECPAG,D.IDPESSOA,D.OPERACAO,');
  sSql.Add('                      D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO');
  sSql.Add('             HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A');
  sSql.Add('        WHERE A.CODDOCUMENTO = L.CODDOCUMENTO');
  sSql.Add('          AND L.OPERACAO NOT IN (''4 '',''5 '')');
  sSql.Add('        -- TAG SALDOANT_114_F');
  sSql.Add('        --Bruno Bastos - 26/11/2009 - Fim');
  sSql.Add('       )');
  sSql.Add('    GROUP BY IDPLANOPREV, IDPATRO, IDPESSOA');
  sSql.Add('    -- TAG SALDOANT_10_F');
  sSql.Add('');
  sSql.Add('    UNION ALL');
  sSql.Add('');
  sSql.Add('    -- (2.0) REGISTRO NA DATAREF');
  sSql.Add('    -- TAG REGNADATA_20_I');
  sSql.Add('    SELECT');
  sSql.Add('       DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.RAZAOSOCIAL) AS NOMEFORCLI,');
  sSql.Add('       (SUM(DECODE(SIGN(U.SALDO),-1,U.SALDO,0)) + SUM(DECODE(SIGN(U.SALDO),1,U.SALDO,0)))  AS SALDO,');
  sSql.Add('       U.NODOCUMENTO, U.NUMAPGR, U.IDPLANOPREV, U.IDPATRO,');
  sSql.Add('       DECODE(U.IDMODULO,79,2,3) AS TIPOREG, U.CODCENTRORESPON, U.IDPESSOA');
  sSql.Add('    FROM PESSOA P, PESSOA PT, TIPORECEBDESEMB T, PLANPREVCONTABIL PP,');
  sSql.Add('         TIPODOCRECPAG TD, MODULO M,');
  sSql.Add('        (');
  sSql.Add('         -- (2.1) REGISTROS DE RECEBIMENTO BAIXADOS NA DATAREF <> DE INVESTIMENTOS');
  sSql.Add('         -- TAG REGNADATA_21_I');
  sSql.Add('         SELECT');
  sSql.Add('           '''' AS NOMEFORCLI, DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI,');
  sSql.Add('           0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, '''' AS TIPOREG, M.HISTORICO||'' / ''||TO_CHAR(M.CODLANCFINANC,''9999999999'') AS NODOCUMENTO,');
  sSql.Add('           '' '' AS HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, ''F'' AS RECPAG');
  sSql.Add('         FROM MOVIMFINANC M, RATEIOFINANC R');
  sSql.Add('         WHERE (M.DATADISPFINANC = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('           AND (M.IDMODULO <> 3)');
  sSql.Add('           AND (M.STATUSCONCILIA <> ''C'')');
  sSql.Add('           AND (M.VALORLANCFINAN <> 0)');
  sSql.Add('           AND (DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))<>0');
  sSql.Add('           AND ((M.CODLANCTRANSF IS NULL) OR (M.CODLANCTRANSF = 0))');
  sSql.Add('           AND (M.IDPESSOA   = '+IntToStr(pIdPessoa)+')');
  sSql.Add('           AND ( NOT EXISTS (SELECT * FROM MOVIMFINANC M1, RECBTOPAGTO R1, DOCUMENTO D1');
  sSql.Add('                             WHERE (((M1.DATALANCFINAN = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY'')) AND (M1.DATADISPFINANC IS NULL)) OR');
  sSql.Add('                                    ((M1.DATALANCFINAN = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY'')) AND (M1.DATADISPFINANC = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))) OR');
  sSql.Add('                                    ((M1.DATADISPFINANC = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))))');
  sSql.Add('                               AND (D1.IDMODULO = 79)');
  sSql.Add('                               AND (M1.IDMODULO <> 3)');
  sSql.Add('                               AND ((M1.CODLANCTRANSF IS NULL) OR (M1.CODLANCTRANSF = 0))');
  sSql.Add('                               AND (M1.STATUSCONCILIA <> ''C'')');
  sSql.Add('                               AND (M1.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                               AND (R1.CODLANCFINANC(+) = M1.CODLANCFINANC)');
  sSql.Add('                               AND (D1.CODDOCUMENTO(+)   = R1.CODDOCUMENTO)');
  sSql.Add('                               AND (M1.CODLANCFINANC = M.CODLANCFINANC)))');
  sSql.Add('           AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('           AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('           AND (M.CODLANCFINANC  = R.CODLANCFINANC)');
  sSql.Add('         -- TAG REGNADATA_21_F');
  sSql.Add('');
  sSql.Add('         UNION ALL');
  sSql.Add('');
  sSql.Add('         -- (2.2) REGISTROS DE RECEBIMENTO BAIXADOS NA DATAREF <> DE INVESTIMENTOS E GERADOS PELO BAIXA DE RECBTO / PAGTO');
  sSql.Add('         -- TAG REGNADATA_22_I');
  sSql.Add('         SELECT DISTINCT');
  sSql.Add('            '''' AS NOMEFORCLI, DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO, -1 AS IDFORCLI,');
  sSql.Add('            0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, '' '' AS TIPOREG, M.HISTORICO||'' / ''||TO_CHAR(M.CODLANCFINANC,''9999999999'') AS NODOCUMENTO,');
  sSql.Add('            '' '' AS HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, ''F'' AS RECPAG');
  sSql.Add('         FROM MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCUMENTO D');
  sSql.Add('         WHERE (M.DATADISPFINANC = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('           AND (M.IDPESSOA   = '+IntToStr(pIdPessoa)+')');
  sSql.Add('           AND ((M.CODLANCTRANSF IS NULL) OR (M.CODLANCTRANSF = 0))');
  sSql.Add('           AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT IN (79)))');
  sSql.Add('           AND (M.STATUSCONCILIA <> ''C'')');
  sSql.Add('           AND (M.VALORLANCFINAN = 0)');
  sSql.Add('           AND (R.RECPAG = ''R'')');
  sSql.Add('           AND (DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))<>0');
  sSql.Add('           AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('           AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('           AND (M.CODLANCFINANC  = R.CODLANCFINANC)');
  sSql.Add('           AND (RC.CODLANCFINANC(+) = M.CODLANCFINANC)');
  sSql.Add('           AND (D.CODDOCUMENTO(+)   = RC.CODDOCUMENTO)');
  sSql.Add('         -- TAG REGNADATA_22_F');
  sSql.Add('');
  sSql.Add('         UNION ALL');
  sSql.Add('');
  sSql.Add('         -- (2.3) REGISTRO DE RECEBIMENTO BAIXADOS NA DATAREF <> DE INVESTIMENTO  E GERADOS PELA TRANSF. ENTRE PLANOS');
  sSql.Add('         -- TAG REGNADATA_23_I');
  sSql.Add('         SELECT DISTINCT');
  sSql.Add('            '''' AS NOMEFORCLI, DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1) AS SALDO, R.IDPLANOPREV, R.IDPATRO,');
  sSql.Add('            -1 AS IDFORCLI, 0 AS CODDOCUMENTO, M.IDPESSOA, 0 AS CODTIPDOC, 0 AS IDMODULO, 0 AS NUMAPGR, '' '' AS TIPOREG,');
  sSql.Add('            M.HISTORICO||'' / ''||TO_CHAR(M.CODLANCFINANC,''9999999999'') AS NODOCUMENTO, '' '' AS HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, ''F'' AS RECPAG');
  sSql.Add('         FROM MOVIMFINANC M, RATEIOFINANC R,  RECBTOPAGTO RC, DOCUMENTO D');
  sSql.Add('         WHERE (M.DATADISPFINANC = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('           AND (M.IDPESSOA   = '+IntToStr(pIdPessoa)+')');
  sSql.Add('           AND ((M.CODLANCTRANSF IS NOT NULL) AND (M.CODLANCTRANSF = M.CODLANCFINANC))');
  sSql.Add('           AND ((RC.CODLANCFINANC IS NULL) OR (D.IDMODULO NOT IN (79)))');
  sSql.Add('           AND (M.STATUSCONCILIA <> ''C'')');
  sSql.Add('           AND (M.VALORLANCFINAN = 0)');
  sSql.Add('           AND (DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))<>0');
  sSql.Add('           AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('           AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('           AND (M.CODLANCFINANC  = R.CODLANCFINANC)');
  sSql.Add('           AND (RC.CODLANCFINANC(+) = M.CODLANCFINANC)');
  sSql.Add('           AND (D.CODDOCUMENTO(+)   = RC.CODDOCUMENTO)');
  sSql.Add('         -- TAG REGNADATA_23_F');
  sSql.Add('');
  sSql.Add('         UNION ALL');
  sSql.Add('');
  sSql.Add('         -- (2.4) REGISTRO DE PAGAMENTOS NA DATAREF <> DE CPMF E MODULO <> INVESTIMENTOS');
  sSql.Add('         -- TAG REGNADATA_24_I');
  sSql.Add('         SELECT');
  sSql.Add('            '''' AS NOMEFORCLI, SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO,');
  sSql.Add('            D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '' '' AS TIPOREG,');
  sSql.Add('            DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG');
  sSql.Add('         FROM DOCUMENTO D, LANCTODOCUM L, VW_RateioDocum R,');
  sSql.Add('             (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = '+IntToStr(pIdPessoa)+' AND P.RECPAG = ''P'') P,');
  sSql.Add('             (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDO');
  sSql.Add('              FROM DOCUMENTO D, LANCTODOCUM L');
  sSql.Add('              WHERE (D.OPERACAO IN (''2 ''))');
  sSql.Add('                AND (D.RECPAG = ''P'')');
  sSql.Add('                AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                AND (L.OPERACAO <> 5)');
  sSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('              GROUP BY D.CODDOCUMENTO) S,');
  sSql.Add('             (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''D'',LA.VALOR * -1,LA.VALOR) AS VALOR');
  sSql.Add('              FROM RECBTOPAGTO RE, LANCTODOCUM LA');
  sSql.Add('              WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
  sSql.Add('                AND LA.DEBCRE = ''D''');
  sSql.Add('                AND LA.NUMLANCTO = RE.NUMLANCTO) P');
  sSql.Add('         WHERE (D.DATAPROGRAMADA = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('           AND (D.RECPAG = ''P'')');
  sSql.Add('           AND (NVL(L.VALOR,0) <> 0)');
  sSql.Add('           AND (D.OPERACAO IN (''2 ''))');
  sSql.Add('           AND (L.OPERACAO <> 5)');
  sSql.Add('           -- Arnaldo V. Scarin - 19/01/2010 - Inicio');
  sSql.Add('           AND NOT Exists (Select 1 From DocumxDocum dxd');
  sSql.Add('                           where dxd.iddocumento = d.coddocumento');
  sSql.Add('                             and dxd.flgdispfinanc = ''S'')');
  sSql.Add('           -- Arnaldo V. Scarin - 19/01/2010 - Fim');
  sSql.Add('           AND (D.CODTIPDOC <> P.CODTIPDOCCPMF)');
  sSql.Add('           AND (D.IDMODULO  <> 79)');
  sSql.Add('           AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('           AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('           AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('           AND (R.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('           AND (D.OPERACAO = L.OPERACAO)');
  sSql.Add('           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('           AND (D.CODDOCUMENTO = S.CODDOCUMENTO)');
  sSql.Add('           AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
  sSql.Add('         GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NODOCUMENTO, D.DATAPROGRAMADA,');
  sSql.Add('                  L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO,');
  sSql.Add('                  R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D.IDMODULO, D.CODDOCUMENTO,');
  sSql.Add('                  R.CODCENTRORESPON, D.NUMAPGR');
  sSql.Add('         HAVING SUM(((R.VALOR*S.SALDO)/L.VALOR)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0');
  sSql.Add('         -- TAG REGNADATA_24_F');
  sSql.Add('');
  sSql.Add('         UNION ALL');
  sSql.Add('');
  sSql.Add('         -- (2.5) REGISTRO DE PAGAMENTOS NA DATAREF E MODULO = INVESTIMENTOS E <> DE CPMF');
  sSql.Add('         -- TAG REGNADATA_25_I');
  sSql.Add('         SELECT');
  sSql.Add('            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG');
  sSql.Add('         FROM LANCTODOCUM L,');
  sSql.Add('             (SELECT');
  sSql.Add('                 '''' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI,');
  sSql.Add('                 D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '' '' AS TIPOREG,');
  sSql.Add('                 DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTRORESPON, D.RECPAG');
  sSql.Add('              FROM DOCUMENTO D,LANCTODOCUM L,');
  sSql.Add('                  (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON');
  sSql.Add('                   FROM VW_RateioDocum R1, DOCUMENTO D1');
  sSql.Add('                   WHERE (D1.DATADISPONIB = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                     AND (D1.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                     AND (D1.OPERACAO IN (''2 ''))');
  sSql.Add('                     AND (D1.RECPAG = ''P'')');
  sSql.Add('                     AND (D1.IDMODULO  = 79)');
  sSql.Add('                     AND (('+sPatro+' IS NULL) OR (R1.IDPATRO = '+sPatro+'))');
  sSql.Add('                     AND (('+sPlanoPrev+' IS NULL) OR (R1.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('                     AND (R1.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('                     AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,');
  sSql.Add('                  (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR');
  sSql.Add('                   FROM RECBTOPAGTO RE, LANCTODOCUM LA');
  sSql.Add('                   WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
  sSql.Add('                     AND LA.DEBCRE = ''D''');
  sSql.Add('                     AND LA.NUMLANCTO = RE.NUMLANCTO) P');
  sSql.Add('              WHERE (D.DATADISPONIB = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                AND (NVL(L.VALOR,0) <> 0)');
  sSql.Add('                AND (D.OPERACAO IN (''2 ''))');
  sSql.Add('                AND (L.OPERACAO <> 5)');
  sSql.Add('                AND (D.RECPAG = ''P'')');
  sSql.Add('                -- Arnaldo V. Scarin - 19/01/2010 - Inicio');
  sSql.Add('                AND NOT Exists (Select 1 From DocumxDocum dxd');
  sSql.Add('                                where dxd.iddocumento = d.coddocumento');
  sSql.Add('                                  and dxd.flgdispfinanc = ''S'')');
  sSql.Add('                -- Arnaldo V. Scarin - 19/01/2010 - Fim');
  sSql.Add('                AND (D.IDMODULO  = 79)');
  sSql.Add('                AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('                AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
  sSql.Add('              GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, D.CODDOCUMENTO, D.CODTIPDOC,');
  sSql.Add('                       D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.COMPLDOCUMENTO,');
  sSql.Add('                       R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPON');
  sSql.Add('              HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A');
  sSql.Add('         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO');
  sSql.Add('           AND L.OPERACAO NOT IN (''4 '',''5 '')');
  sSql.Add('         -- TAG REGNADATA_25_F');
  sSql.Add('');
  sSql.Add('         UNION ALL');
  sSql.Add('');
  sSql.Add('         -- (2.6) REGISTRO DE RECEBIMENTOS NA DATAREF E MODULO = INVESTIMENTOS');
  sSql.Add('         -- TAG REGNADATA_26_I');
  sSql.Add('         SELECT');
  sSql.Add('            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI,');
  sSql.Add('            A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR,');
  sSql.Add('            A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG');
  sSql.Add('         FROM LANCTODOCUM L,');
  sSql.Add('             (SELECT');
  sSql.Add('                  '''' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI,');
  sSql.Add('                  D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR,'' '' AS TIPOREG,');
  sSql.Add('                  DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTRORESPON, D.RECPAG');
  sSql.Add('              FROM DOCUMENTO D,LANCTODOCUM L,');
  sSql.Add('                  (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON');
  sSql.Add('                   FROM VW_RateioDocum R1, DOCUMENTO D1');
  sSql.Add('                   WHERE (D1.DATADISPONIB = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                     AND (D1.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                     AND (D1.OPERACAO IN (''2 ''))');
  sSql.Add('                     AND (D1.RECPAG = ''R'')');
  sSql.Add('                     AND (D1.IDMODULO  = 79)');
  sSql.Add('                     AND (('+sPatro+' IS NULL) OR (R1.IDPATRO = '+sPatro+'))');
  sSql.Add('                     AND (('+sPlanoPrev+' IS NULL) OR (R1.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('                     AND (R1.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('                     AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,');
  sSql.Add('                  (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR');
  sSql.Add('                   FROM RECBTOPAGTO RE, LANCTODOCUM LA');
  sSql.Add('                   WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
  sSql.Add('                     AND LA.DEBCRE = ''D''');
  sSql.Add('                     AND LA.NUMLANCTO = RE.NUMLANCTO) P');
  sSql.Add('              WHERE (D.DATADISPONIB = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                AND (NVL(L.VALOR,0) <> 0)');
  sSql.Add('                AND (D.OPERACAO IN (''2 ''))');
  sSql.Add('                AND (L.OPERACAO <> 5)');
  sSql.Add('                AND (D.RECPAG = ''R'')');
  sSql.Add('                AND (D.IDMODULO  = 79)');
  sSql.Add('                AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('                AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
  sSql.Add('              GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, D.CODDOCUMENTO, D.CODTIPDOC,');
  sSql.Add('                       D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.COMPLDOCUMENTO,');
  sSql.Add('                       R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPON');
  sSql.Add('              HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A');
  sSql.Add('         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO');
  sSql.Add('            AND L.OPERACAO NOT IN (''4 '',''5 '')');
  sSql.Add('         -- TAG REGNADATA_26_F');
  sSql.Add('');
  sSql.Add('         UNION ALL');
  sSql.Add('');
  sSql.Add('         -- (2.7) REGISTRO DE PAGAMENTOS ENGLOBADOS NA DATAREF E MODULO <> INVESTIMENTOS');
  sSql.Add('         -- TAG REGNADATA_27_I');
  sSql.Add('         SELECT');
  sSql.Add('             A.NOMEFORCLI, SUM(A.SALDO) AS SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, 0 AS CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG');
  sSql.Add('         FROM');
  sSql.Add('             (SELECT');
  sSql.Add('                '''' AS NOMEFORCLI,');
  sSql.Add('                (SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))))-((SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) * DECODE(C.SALDOALT,NULL,0,C.SALDOALT))/SS.SALDOTOT) AS SALDO,');
  sSql.Add('                R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR,  '' '' AS TIPOREG,');
  sSql.Add('                DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO,  L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG, D.NUMFATURA,');
  sSql.Add('                SS.SALDOTOT, C.SALDOALT');
  sSql.Add('              FROM DOCUMENTO D, LANCTODOCUM L,');
  sSql.Add('                  (SELECT D.NUMFATURA, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDOTOT');
  sSql.Add('                   FROM DOCUMENTO D, LANCTODOCUM L');
  sSql.Add('                   WHERE (D.OPERACAO IN (''1 ''))');
  sSql.Add('                     AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                     AND (D.RECPAG = ''P'')');
  sSql.Add('                     AND (D.NUMFATURA IS NOT NULL)');
  sSql.Add('                     AND (D.OPERACAO = L.OPERACAO)');
  sSql.Add('                     AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('                   GROUP BY D.NUMFATURA) SS,');
  sSql.Add('                  (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDODOC');
  sSql.Add('                   FROM DOCUMENTO D, LANCTODOCUM L');
  sSql.Add('                   WHERE (D.OPERACAO IN (''1 ''))');
  sSql.Add('                     AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                     AND (D.RECPAG = ''P'')');
  sSql.Add('                     AND (L.OPERACAO <> 5)');
  sSql.Add('                     -- Arnaldo V. Scarin - 19/01/2010 - Inicio');
  sSql.Add('                     AND NOT Exists (Select 1 From DocumxDocum dxd');
  sSql.Add('                                     where dxd.iddocumento = d.coddocumento');
  sSql.Add('                                       and dxd.flgdispfinanc = ''S'')');
  sSql.Add('                     -- Arnaldo V. Scarin - 19/01/2010 - Fim');
  sSql.Add('                     AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('                   GROUP BY D.CODDOCUMENTO) S,');
  sSql.Add('                  (SELECT D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, R.IDPESSOA, R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODCENTRORESPON');
  sSql.Add('                   FROM DOCUMENTO D, VW_RateioDocum R');
  sSql.Add('                   WHERE (D.OPERACAO IN (''1 ''))');
  sSql.Add('                     AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                     AND (D.RECPAG = ''P'')');
  sSql.Add('                     AND (D.NUMFATURA IS NOT NULL)');
  sSql.Add('                     AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('                     AND (R.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('                   GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R,');
  sSql.Add('                  (SELECT D.NUMFATURA, (SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1))* -1) AS SALDOALT');
  sSql.Add('                   FROM DOCUMENTO D, LANCTODOCUM L');
  sSql.Add('                   WHERE (D.OPERACAO IN (''3 ''))');
  sSql.Add('                     AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                     AND (D.RECPAG = ''P'')');
  sSql.Add('                     AND (L.OPERACAO NOT IN (''5 '',''3 ''))');
  sSql.Add('                     AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('                   GROUP BY D.NUMFATURA) C,');
  sSql.Add('                  (SELECT D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO');
  sSql.Add('                   FROM DOCUMENTO D');
  sSql.Add('                   WHERE (D.OPERACAO IN (''3 ''))');
  sSql.Add('                     AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                     AND (D.RECPAG = ''P'')');
  sSql.Add('                     AND (D.NUMFATURA IS NOT NULL)) X');
  sSql.Add('              WHERE (X.DATAPROGRAMADA = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                AND (D.RECPAG = ''P'')');
  sSql.Add('                AND (NVL(SS.SALDOTOT,0) <> 0 )');
  sSql.Add('                AND (D.OPERACAO IN (''1 ''))');
  sSql.Add('                AND (L.OPERACAO <> 5)');
  sSql.Add('                AND (D.IDMODULO <> 79)');
  sSql.Add('                AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('                AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('                AND (D.OPERACAO = L.OPERACAO)');
  sSql.Add('                AND (D.NUMFATURA = R.NUMFATURA)');
  sSql.Add('                AND (D.CODDOCUMENTO = S.CODDOCUMENTO)');
  sSql.Add('                AND (D.NUMFATURA = SS.NUMFATURA)');
  sSql.Add('                AND (D.NUMFATURA = C.NUMFATURA(+))');
  sSql.Add('                AND (D.NUMFATURA = X.NUMFATURA)');
  sSql.Add('              GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NODOCUMENTO, D.DATAPROGRAMADA,');
  sSql.Add('                       L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO,');
  sSql.Add('                       R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D.IDMODULO, D.CODDOCUMENTO,');
  sSql.Add('                       R.CODCENTRORESPON, D.NUMAPGR, D.NUMFATURA, SS.SALDOTOT, C.SALDOALT) A,');
  sSql.Add('             (SELECT D.NUMFATURA, D.DATAPROGRAMADA, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, L.HISTORICOCOMPL');
  sSql.Add('              FROM DOCUMENTO D, LANCTODOCUM L');
  sSql.Add('              WHERE (D.OPERACAO IN (''3 ''))');
  sSql.Add('                AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                AND (D.RECPAG = ''P'')');
  sSql.Add('                AND (D.NUMFATURA IS NOT NULL)');
  sSql.Add('                AND (L.OPERACAO=3)');
  sSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)) B');
  sSql.Add('         WHERE A.NUMFATURA=B.NUMFATURA(+)');
  sSql.Add('         GROUP BY A.NOMEFORCLI, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.IDPESSOA, A.CODTIPDOC,');
  sSql.Add('                  A.IDMODULO, A.NUMAPGR, A.TIPOREG, B.NODOCUMENTO, B.HISTORICOCOMPL, A.CODTIPRECDES,');
  sSql.Add('                  A.CODCENTRORESPON, A.RECPAG');
  sSql.Add('         -- TAG REGNADATA_27_F');
  sSql.Add('');
  sSql.Add('         UNION ALL');
  sSql.Add('');
  sSql.Add('         -- (2.8) REGISTRO NA DATAREF DE IRRF QUE NAO ESTAO EM DARF GERADO');
  sSql.Add('         -- TAG REGNADATA_28_I');
  sSql.Add('         SELECT');
  sSql.Add('            DISTINCT');
  sSql.Add('            '''' AS NOMEFORCLI, S.VALOR*-1 AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI,');
  sSql.Add('            D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, 0 AS NUMAPGR, '' '' AS TIPOREG,');
  sSql.Add('            DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO,');
  sSql.Add('            L.HISTORICOCOMPL, R.CODTIPRECDES, R.CODCENTRORESPON, R.RECPAG');
  sSql.Add('         FROM DOCUMENTO D, LANCIRRF I, LANCTODOCUM L, VW_RateioDocum R,');
  sSql.Add('             (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO=1) X,');
  sSql.Add('             (SELECT L.CODDOCUMENTO,L.CODALTERADOR,L.VALOR,L.NUMLANCTO');
  sSql.Add('              FROM LANCTODOCUM L, DOCUMENTO D');
  sSql.Add('              WHERE (D.DATAVENCTO BETWEEN TO_DATE('+QuotedStr(DateToStr(pDataIniIRRF))+',''DD/MM/YYYY'') AND TO_DATE('+QuotedStr(DateToStr(pDataFimIRRF))+',''DD/MM/YYYY''))');
  sSql.Add('                AND (CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO=1))');
  sSql.Add('                AND (L.CODDOCUMENTO=D.CODDOCUMENTO)) S');
  sSql.Add('         WHERE (I.IDDARF IS NULL)');
  sSql.Add('           AND (VLRIRRF <> 0)');
  sSql.Add('           AND (L.CODALTERADOR IN X.CODALTERADOR)');
  sSql.Add('           AND (D.RECPAG = ''P'')');
  sSql.Add('           AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('           AND (L.OPERACAO <> 5)');
  sSql.Add('           AND (D.STATUS=2)');
  sSql.Add('           AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('           AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('           AND (D.CODDOCUMENTO = S.CODDOCUMENTO)');
  sSql.Add('           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('           AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('           AND (D.CODDOCUMENTO = I.CODDOCUMENTO(+))');
  sSql.Add('           AND (R.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('         -- TAG REGNADATA_28_F');
  sSql.Add('');
  sSql.Add('         --bruno bastos - 26/11/2009 - início');
  sSql.Add('         UNION ALL');
  sSql.Add('');
  sSql.Add('         -- (2.9) REGISTRO DE PAGAMENTOS BAIXADOS NA DATAREF PARA DOCUMENTOS DA DOCUMXDOCUM <> DE CPMF');
  sSql.Add('         -- TAG REGNADATA_29_I');
  sSql.Add('         SELECT');
  sSql.Add('            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG');
  sSql.Add('         FROM LANCTODOCUM L,');
  sSql.Add('             (SELECT');
  sSql.Add('                 '''' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO, D.IDFORCLI,');
  sSql.Add('                 D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '' '' AS TIPOREG,DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO,');
  sSql.Add('                 R.CODTIPRECDES, R.CODCENTRORESPON, D.RECPAG');
  sSql.Add('              FROM DOCUMENTO D,LANCTODOCUM L, documxdocum dxd,');
  sSql.Add('                  (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON');
  sSql.Add('                   FROM RATEIODOCUM R1, DOCUMENTO D1');
  sSql.Add('                   WHERE (D1.DATADISPONIB = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                     AND (D1.IDPESSOA = 1)');
  sSql.Add('                     AND (D1.OPERACAO IN (''2 ''))');
  sSql.Add('                     AND (D1.RECPAG = ''P'')');
  sSql.Add('                     AND (('+sPatro+' IS NULL) OR (R1.IDPATRO = '+sPatro+'))');
  sSql.Add('                     AND (('+sPlanoPrev+' IS NULL) OR (R1.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('                     AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,');
  sSql.Add('                  (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''D'',LA.VALOR,LA.VALOR * -1) AS VALOR');
  sSql.Add('                   FROM RECBTOPAGTO RE, LANCTODOCUM LA');
  sSql.Add('                   WHERE RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
  sSql.Add('                     AND LA.DEBCRE = ''D''');
  sSql.Add('                     AND LA.NUMLANCTO = RE.NUMLANCTO) P');
  sSql.Add('              WHERE (D.DATADISPONIB = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                and (dxd.iddocumento   = d.coddocumento)');
  sSql.Add('                and (dxd.flgdispfinanc = ''S'')');
  sSql.Add('                -- Arnaldo V. Scarin - 19/01/2010 - Inicio');
  sSql.Add('                and Exists (Select 1 From lanctoDocum lctdoc');
  sSql.Add('                            where lctdoc.coddocumento = dxd.iddocumentopai');
  sSql.Add('                              and lctdoc.operacao = ''5 '')');
  sSql.Add('                -- Arnaldo V. Scarin - 19/01/2010 - Fim');
  sSql.Add('                AND (D.IDPESSOA = 1)');
  sSql.Add('                AND (NVL(L.VALOR,0) <> 0)');
  sSql.Add('                AND (D.OPERACAO IN (''2 ''))');
  sSql.Add('                AND (L.OPERACAO = 5)');
  sSql.Add('                AND (D.RECPAG = ''P'')');
  sSql.Add('                AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('                AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
  sSql.Add('              GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, D.CODDOCUMENTO, D.CODTIPDOC,');
  sSql.Add('                       D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.COMPLDOCUMENTO,');
  sSql.Add('                       R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPON');
  sSql.Add('              HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A');
  sSql.Add('         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO');
  sSql.Add('            AND L.OPERACAO IN (''5 '')');
  sSql.Add('         -- TAG REGNADATA_29_F');
  sSql.Add('');
  sSql.Add('         UNION ALL');
  sSql.Add('');
  sSql.Add('         -- (2.10) REGISTRO DE RECEBIMENTOS NA DATAREF PARA DOCUMENTOS DA DOCUMXDOCUM <> DE CPMF');
  sSql.Add('         -- TAG REGNADATA_210_I');
  sSql.Add('         SELECT');
  sSql.Add('            A.NOMEFORCLI, A.SALDO, A.IDPLANOPREV, A.IDPATRO, A.IDFORCLI, A.CODDOCUMENTO, A.IDPESSOA, A.CODTIPDOC, A.IDMODULO, A.NUMAPGR, A.TIPOREG, A.NODOCUMENTO, L.HISTORICOCOMPL, A.CODTIPRECDES, A.CODCENTRORESPON, A.RECPAG');
  sSql.Add('         FROM LANCTODOCUM L,');
  sSql.Add('             (SELECT');
  sSql.Add('                 '''' AS NOMEFORCLI, SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR * -1)-(DECODE(P.VALOR,NULL,0,P.VALOR))) AS SALDO, R.IDPLANOPREV, R.IDPATRO,');
  sSql.Add('                 D.IDFORCLI, D.CODDOCUMENTO, D.IDPESSOA, D.CODTIPDOC, D.IDMODULO, D.NUMAPGR, '' '' AS TIPOREG,');
  sSql.Add('                 DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.CODTIPRECDES, R.CODCENTRORESPON, D.RECPAG');
  sSql.Add('              FROM DOCUMENTO D,LANCTODOCUM L, DOCUMXDOCUM DXD,');
  sSql.Add('                  (SELECT DISTINCT R1.IDPATRO,R1.IDPLANOPREV,R1.CODTIPRECDES, D1.CODDOCUMENTO, R1.CODCENTRORESPON');
  sSql.Add('                   FROM VW_RateioDocum R1, DOCUMENTO D1');
  sSql.Add('                   WHERE  (D1.DATADISPONIB = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                     AND (D1.IDPESSOA = 1)');
  sSql.Add('                     AND (D1.OPERACAO IN (''2 ''))');
  sSql.Add('                     AND (D1.RECPAG = ''R'')');
  sSql.Add('                     AND (('+sPatro+' IS NULL) OR (R1.IDPATRO = '+sPatro+'))');
  sSql.Add('                     AND (('+sPlanoPrev+' IS NULL) OR (R1.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('                     AND (R1.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('                     AND (D1.CODDOCUMENTO = R1.CODDOCUMENTO)) R,');
  sSql.Add('                  (SELECT LA.CODDOCUMENTO, DECODE(LA.DEBCRE,''C'',LA.VALOR,LA.VALOR * -1) AS VALOR');
  sSql.Add('                   FROM RECBTOPAGTO RE, LANCTODOCUM LA');
  sSql.Add('                   WHERE  RE.CODPORTFORMA IN (SELECT CODPORTFORMA FROM PORTADORFORMA WHERE LANCAFINANC = ''N'')');
  sSql.Add('                     AND LA.DEBCRE = ''D''');
  sSql.Add('                     AND LA.NUMLANCTO = RE.NUMLANCTO) P');
  sSql.Add('              WHERE (D.DATADISPONIB = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                AND (D.IDPESSOA = 1)');
  sSql.Add('                 --bruno bastos - 26/11/2009');
  sSql.Add('                AND (D.CODDOCUMENTO = DXD.IDDOCUMENTO)');
  sSql.Add('                AND (DXD.FLGDISPFINANC = ''S'')');
  sSql.Add('                -- Arnaldo V. Scarin - 19/01/2010 - Inicio');
  sSql.Add('                and Not Exists (Select 1 From lanctoDocum lctdoc');
  sSql.Add('                                where lctdoc.coddocumento = dxd.iddocumentopai');
  sSql.Add('                                  and lctdoc.operacao = ''5 '')');
  sSql.Add('                -- Arnaldo V. Scarin - 19/01/2010 - Fim');
  sSql.Add('                AND (NVL(L.VALOR,0) <> 0)');
  sSql.Add('                AND (D.OPERACAO IN (''2 ''))');
  sSql.Add('                AND (L.OPERACAO <> 5)');
  sSql.Add('                AND (D.RECPAG = ''R'')');
  sSql.Add('                AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('                AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('                AND (D.CODDOCUMENTO = P.CODDOCUMENTO(+))');
  sSql.Add('              GROUP BY D.IDFORCLI, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, D.CODDOCUMENTO, D.CODTIPDOC,');
  sSql.Add('                       D.IDMODULO, D.NUMAPGR, D.NODOCUMENTO, D.COMPLDOCUMENTO,');
  sSql.Add('                       R.CODTIPRECDES, D.RECPAG, R.CODCENTRORESPON');
  sSql.Add('              HAVING SUM(NVL(L.VALOR,0)-(DECODE(P.VALOR,NULL,0,P.VALOR))) <> 0) A');
  sSql.Add('         WHERE A.CODDOCUMENTO = L.CODDOCUMENTO');
  sSql.Add('            AND L.OPERACAO NOT IN (''4 '',''5 '')');
  sSql.Add('         -- TAG REGNADATA_210_F');
  sSql.Add('');
  sSql.Add('        ) U');
  sSql.Add('    WHERE (('+sPatro+' IS NULL) OR (U.IDPATRO = '+sPatro+'))');
  sSql.Add('      AND (('+sPlanoPrev+' IS NULL) OR (U.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('      AND (U.IDFORCLI = P.IDPESSOA(+))');
  sSql.Add('      AND (U.IDPLANOPREV = PP.IDPLANOPREV(+))');
  sSql.Add('      AND (U.IDPATRO = PT.IDPESSOA(+))');
  sSql.Add('      AND (U.CODTIPDOC = TD.CODTIPDOC(+))');
  sSql.Add('      AND (U.CODTIPRECDES = T.CODTIPRECDES(+))');
  sSql.Add('      AND (U.IDPESSOA = T.IDPESSOA(+))');
  sSql.Add('      AND (U.RECPAG = T.RECPAG(+))');
  sSql.Add('      AND (U.IDMODULO = M.IDMODULO(+))');
  sSql.Add('      AND (('+pPSAtivo+' IS NULL) OR (PP.ATIVO = '+pPSAtivo+'))');
  sSql.Add('    GROUP BY U.NODOCUMENTO,DECODE(U.IDFORCLI,-1,U.NODOCUMENTO,P.RAZAOSOCIAL),');
  sSql.Add('             U.IDPLANOPREV,U.IDPATRO,U.IDMODULO, U.CODCENTRORESPON, U.NUMAPGR,U.IDPESSOA');
  sSql.Add('    -- TAG REGNADATA_20_F');
  sSql.Add('');
  sSql.Add('    UNION ALL');
  sSql.Add('');
  sSql.Add('    -- (3.0) REGISTROS NA DATAREF DE CPMF');
  sSql.Add('    -- TAG REGNADATA_30_I');
  sSql.Add('    SELECT DECODE(XX.IDFORCLI,-1,'' '',''CPMF - ''||P.NOME) AS NOMEFORCLI, XX.SALDO, '' '' AS NODOCUMENTO, 0 AS NUMAPGR, XX.IDPLANOPREV,');
  sSql.Add('           XX.IDPATRO, 3 AS TIPOREG, '' '' AS CODCENTRORESPON, XX.IDPESSOA');
  sSql.Add('    FROM PESSOA P,');
  sSql.Add('        (SELECT X.IDFORCLI, SUM(X.SALDO * -1) AS SALDO, X.IDPLANOPREV, X.IDPATRO, X.IDPESSOA');
  sSql.Add('         FROM');
  sSql.Add('           (');
  sSql.Add('            -- (3.1) REGISTROS BAIXADOS NA DATAREF DE CPMF');
  sSql.Add('            -- TAG REGNADATA_31_I');
  sSql.Add('            SELECT PO.IDBANCO AS IDFORCLI, 0 AS NUMAPGR, '' '' AS NODOCUMENTO, R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA, '' '' AS CODCENTRORESPON, SUM(R.VALOR) AS SALDO');
  sSql.Add('            FROM MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO');
  sSql.Add('            WHERE (M.CODLANCFINANC IN (SELECT M.CODLANCFINANC FROM MOVIMFINANC M');
  sSql.Add('                                       WHERE (IDMODULO = 3)');
  sSql.Add('                                         AND (IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('                                         AND (DATALANCFINAN = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('                                         AND (M.CODLANCFINANC IN (SELECT DISTINCT CODLANCFINANC FROM RATEIOFINANC');
  sSql.Add('                                                                  WHERE CODTIPDOC=(SELECT CODTIPDOCCPMF FROM PARAMCAP WHERE IDPESSOA = '+IntToStr(pIdPessoa)+' AND RECPAG = ''P'')))))');
  sSql.Add('              AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('              AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('              AND (M.CODLANCFINANC = R.CODLANCFINANC)');
  sSql.Add('              AND (M.CODPORTADOR = PO.CODPORTADOR)');
  sSql.Add('            GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPORTADOR,PO.IDBANCO');
  sSql.Add('            -- TAG REGNADATA_31_F');
  sSql.Add('');
  sSql.Add('            UNION ALL');
  sSql.Add('');
  sSql.Add('            -- (3.2) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS');
  sSql.Add('            -- TAG REGNADATA_32_I');
  sSql.Add('            SELECT  D.IDFORCLI, D.NUMAPGR, DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO, R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.CODCENTRORESPON, SUM(R.VALOR) AS SALDO');
  sSql.Add('            FROM DOCUMENTO D, LANCTODOCUM L, VW_RateioDocum R,');
  sSql.Add('                (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = '+IntToStr(pIdPessoa)+' AND P.RECPAG = ''P'') P');
  sSql.Add('            WHERE (D.DATAPROGRAMADA = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('              AND (D.IDPESSOA = '+IntToStr(pIdPessoa)+')');
  sSql.Add('              AND (D.RECPAG = ''P'')');
  sSql.Add('              AND (D.OPERACAO IN (''2 '',''1 ''))');
  sSql.Add('              AND (D.STATUS <> ''2'')');
  sSql.Add('              AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('              AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('              AND (D.CODTIPDOC = P.CODTIPDOCCPMF)');
  sSql.Add('              AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('              AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('              AND (R.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('            GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.NODOCUMENTO,');
  sSql.Add('                     R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.CODCENTRORESPON');
  sSql.Add('            -- TAG REGNADATA_32_F');
  sSql.Add('');
  sSql.Add('            UNION ALL');
  sSql.Add('            -- (3.3) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS DE TRANSF ENTRE CONTAS');
  sSql.Add('            -- TAG REGNADATA_33_I');
  sSql.Add('            SELECT I.IDFORCLI, 0 AS NUMAPGR, '' '' AS NODOCUMENTO, R.IDPLANOPREV, R.IDPATRO, I.IDPESSOA, '' '' AS CODCENTRORESPON, SUM(R.VLRCPMF) AS SALDO');
  sSql.Add('            FROM IMPOSTORETIDO  I, RATEIOIMPOSTORETIDO R');
  sSql.Add('            WHERE I.DATARETENCAO = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY'')');
  sSql.Add('              AND I.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FROM PARAMFINANC)');
  sSql.Add('              AND I.CODDOCUMENTO IS NULL');
  sSql.Add('              AND I.NUMLOTEMANUAL = 0');
  sSql.Add('              AND I.CODLANCFINANC IS NOT NULL');
  sSql.Add('              AND I.IDPESSOA = '+IntToStr(pIdPessoa)+'');
  sSql.Add('              AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('              AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('              AND (I.IDIMPOSTORETIDO = R.IDIMPOSTORETIDO)');
  sSql.Add('            GROUP BY R.IDPLANOPREV,R.IDPATRO, I.IDPESSOA, I.CODPORTADOR, I.IDFORCLI');
  sSql.Add('            -- TAG REGNADATA_33_F');
  sSql.Add('           ) X');
  sSql.Add('         GROUP BY X.IDFORCLI, X.IDPLANOPREV,X.IDPATRO, X.IDPESSOA ) XX');
  sSql.Add('    WHERE (XX.IDFORCLI = P.IDPESSOA(+))');
  sSql.Add('    -- TAG REGNADATA_30_F');
  sSql.Add('');
  sSql.Add('    UNION ALL');
  sSql.Add('');
  sSql.Add('    -- (4.0) REGISTROS DE INSS');
  sSql.Add('    -- TAG REGNADATA_40_I');
  sSql.Add('    SELECT DISTINCT');
  sSql.Add('           DECODE(D.IDFORCLI,-1,'' '',X.RAZAOSOCIAL||'' - INSS'') AS NOMEFORCLI,');
  sSql.Add('           X.SALDO * -1,');
  sSql.Add('           DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO,');
  sSql.Add('           0 AS NUMAPGR,');
  sSql.Add('           R.IDPLANOPREV,');
  sSql.Add('           R.IDPATRO,');
  sSql.Add('           3 AS TIPOREG,');
  sSql.Add('           R.CODCENTRORESPON,');
  sSql.Add('           D.IDPESSOA');
  sSql.Add('    FROM DOCUMENTO D,LANCTODOCUM L,VW_RateioDocum R,');
  sSql.Add('        (');
  sSql.Add('         -- (4.1) REGISTROS QUE NAO ESTAO EM GPS');
  sSql.Add('         -- TAG REGNADATA_41_I');
  sSql.Add('         SELECT DISTINCT');
  sSql.Add('            L.DATALANCTO AS DATALANCTO, D.IDFORCLI AS IDFORCLI, P.RAZAOSOCIAL AS RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, DECODE(L.DEBCRE, ''D'', L.VALOR, L.VALOR*-1) AS SALDO, D.OPERACAO, D.NUMFATURA, T.PLACONTA, D.NODOCUMENTO');
  sSql.Add('         FROM PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR T, VW_RateioDocum R, LANCIRRF N');
  sSql.Add('         WHERE (L.DATALANCTO >= TO_DATE('+QuotedStr(DateToStr(pDataIniMesAnt))+',''DD/MM/YYYY''))');
  sSql.Add('           AND (L.DATALANCTO <= TO_DATE('+QuotedStr(DateToStr(pDataFimMesAnt))+',''DD/MM/YYYY''))');
  sSql.Add('           AND (L.OPERACAO      = ''4'')');
  sSql.Add('           AND (D.IDPESSOA      = '+IntToStr(pIdPessoa)+')');
  sSql.Add('           AND (D.RECPAG        = ''P'')');
  sSql.Add('           AND (L.CODDOCINSS IS NULL)');
  sSql.Add('           AND (N.IDDOCINSS IS NULL)');
  sSql.Add('           AND (NVL(N.VLRINSS,0) <> 0)');
  sSql.Add('           AND (L.ESTORNO IS NULL)');
  sSql.Add('           AND (L.CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHERE CODIMPOSTO = 2))');
  sSql.Add('           AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('           AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('           AND (R.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('           AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)');
  sSql.Add('           AND (P.IDPESSOA      = D.IDFORCLI)');
  sSql.Add('           AND (L.CODALTERADOR  = T.CODALTERADOR)');
  sSql.Add('           AND (D.CODDOCUMENTO  = R.CODDOCUMENTO)');
  sSql.Add('           AND (D.CODDOCUMENTO  = N.CODDOCUMENTO(+))');
  sSql.Add('         -- TAG REGNADATA_41_F');
  sSql.Add('         ) X');
  sSql.Add('    WHERE (TO_DATE('+QuotedStr(DateToStr(pDataINSS))+',''DD/MM/YYYY'') = TO_DATE('+QuotedStr(DateToStr(pDataRef))+',''DD/MM/YYYY''))');
  sSql.Add('      AND (('+sPatro+' IS NULL) OR (R.IDPATRO = '+sPatro+'))');
  sSql.Add('      AND (('+sPlanoPrev+' IS NULL) OR (R.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('      AND (D.CODDOCUMENTO = X.CODDOCUMENTO)');
  sSql.Add('      AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  sSql.Add('      AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
  sSql.Add('      AND (L.NUMLANCTO = X.NUMLANCTO)');
  sSql.Add('      AND (R.EXERCICIO = '+QuotedStr(pAnoRateio)+')');
  sSql.Add('    -- TAG REGNADATA_40_F');
  sSql.Add('   ) U');
  sSql.Add('WHERE U.IDPATRO = P.IDPESSOA(+)');
  sSql.Add('  AND (('+sPatro+' IS NULL) OR (U.IDPATRO = '+sPatro+'))');
  sSql.Add('  AND (('+sPlanoPrev+' IS NULL) OR (U.IDPLANOPREV = '+sPlanoPrev+'))');
  sSql.Add('  AND U.IDPLANOPREV = PT.IDPLANOPREV(+)');
  sSql.Add('  AND U.CODCENTRORESPON  = CN.CODCENTRORESPON(+)');
  sSql.Add('  AND U.IDPESSOA  = CN.IDPESSOA(+)');
  sSql.Add('  AND (('+pPSAtivo+' IS NULL) OR (PT.ATIVO = '+pPSAtivo+'))');
  // Se Disponibilidade Sintética
  If pTipoDisp = 0 then
  begin
    sSql.Add('-- FIM DA QRYANALITICA');
    sSql.Add('-- TAG QRYANALIT_F');
    sSql.Add('   ) UU');
    sSql.Add('GROUP BY UU.NOMEPLANOPATRO, UU.IDPATRO, UU.IDPLANO');
    sSql.Add('ORDER BY NOMEPLANOPATRO');
  end;
  sSql.SaveToFile('c:\planus\temp\'+sNomeArquivo);
  Result := sSql.Text;
  FreeAndNil(sSql);
end;

end.

