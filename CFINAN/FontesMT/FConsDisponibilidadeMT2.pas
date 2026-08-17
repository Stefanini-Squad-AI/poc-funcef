unit FConsDisponibilidadeMT2;

// Alterações:
{---------------------------------------------------------------------------------------------------
//Data      : 06/10/2009
//Autor     : Marilza Colpani
//SOL       : 122335
//Kintana   : 598524
//Descrição : Implementação de um filtro para os planos ativos, inativos e ambos.
// --------------------------------------------------------------------------------------------------
Data        : 24/09/2009
Autor       : Marilza Colpani
SOL         : 122335
Kintana     : 598524
Descrição   : Implementação de filtro por plano contábil.
----------------------------------------------------------------------------------------------------
Data      : 06/09/2007
Autor     : Fabio Fagundes
Código    : AL_12
Pendência : 26308
SOL       : 68503
Descrição : Retirada do itens 1.9.2 e 4.2 de registros de INSS (GPS) que deverão vir do item 2.4 quando é
            gerado o documento de GPS pois estava duplicando lançamentos
----------------------------------------------------------------------------------------------------
Data      : 11/07/2007
Autor     : Fabio Fagundes
Código    : AL_11
Pendência : 25839
SOL       : 64125
Descrição : Alteração dos Itens 1.9.1 e 4.1 com inclusão de critica VLRINSS <> 0
            para não trazer se estiver baixado
----------------------------------------------------------------------------------------------------
Data      : 30/05/2007
Autor     : Fabio Fagundes
Código    : AL_10
Pendência : 21368
SOL       :
Descrição : Alteração das descrições da Disponibilidade Sintética para apresentar as datas solicitadas
----------------------------------------------------------------------------------------------------
Data      : 13/04/2007
Autor     : Fabio Fagundes
Código    : AL_9
Pendência : 24039
SOL       :
Descrição : Acerto na ordenação
----------------------------------------------------------------------------------------------------
Data      : 30/01/2007
Autor     : Fabio Fagundes
Código    : AL_8
Pendência : 24344
SOL       :
Descrição : Tratamento para não permitir a geração em data anterior a data inicial de Disponibilidade
----------------------------------------------------------------------------------------------------
Data      : 30/01/2007
Autor     : Fabio Fagundes
Código    : AL_7
Pendência : 24296
SOL       : 49782
Descrição : Acerto na montagem do periodo inicial do item 1.3 que estava trazendo registro na data
            inicial de Disponibilidade
----------------------------------------------------------------------------------------------------
Data      : 07/12/2006
Autor     : Fabio Fagundes
Código    : AL_6
Pendência : 24228
SOL       :
Descrição : Em complemento à retirada dos registros estornados, deve ser retirado a crítica que não
            trazia os lancamentos Não Identificados (RELACIONANI WHERE FLGNI = 'I') dos itens 2.1 e 2.3
----------------------------------------------------------------------------------------------------
Data      : 13/11/2006
Autor     : Fabio Fagundes
Código    : AL_8
Pendência : 21867
SOL       :
Descrição : Implemetação para trazer somente documentos baixados
----------------------------------------------------------------------------------------------------
Data      : 13/11/2006
Autor     : Fabio Fagundes
Código    : AL_7
Pendência : 21865
SOL       :
Descrição : Implemetação de Grupamento por Plano e Patro e Tipo de Receb/Desemb Operacional
            Pasagem para 3 camadas
----------------------------------------------------------------------------------------------------
Data      : 18/10/2006
Autor     : Fabio Fagundes
Código    : AL_6
Pendência : 23557
SOL       : 47420
Descrição : Acerto na montagem do CdsLoteAnalitica quando não tem CodLancFinanc e causava erro no sql.
            Acerto no Sub-select de Registros Englobados (retirada do filtro AND (D.STATUS <> 2) do item 2.7),
            pois qdo baixados geram um terceiro e este não tem Rateios
----------------------------------------------------------------------------------------------------
Data      : 25/07/2006
Autor     : Fabio Fagundes
Código    : AL_5
Pendência : 22783
SOL       : 44598
Descrição : Inclusao no nr AP na para o CdsLoteAnalitica
----------------------------------------------------------------------------------------------------
Data      : 25/07/2006
Autor     : Fabio Fagundes
Código    : AL_4
Pendência : 22783
SOL       : 44598
Descrição : Grupamento do centro de Responsabilidade da CdsAnalitica e passagem para o Centro de Resp
            para o CdsLoteAnalitica
----------------------------------------------------------------------------------------------------
Data      : 25/07/2006
Autor     : Fabio Fagundes
Código    : AL_3
Pendência : 22782
SOL       : 44601
Descrição : Acerto na Consulta de Documentos que compôem o Lote na Consulta Analítica com a Implementação
            da ListConsultaDoc (CdsLoteAnalitica)
----------------------------------------------------------------------------------------------------
Data      : 18/05/2006
Autor     : Fabio Fagundes
Código    : AL_2
Pendência : 20002
SOL       :
Descrição : Melhorias no detalhemento de Lote dos documentos baixados no Relatório Analícico
            Melhorias de lay-out
            Alterado o item 2.2 que foi substituido pelo item 1.2 nas qrySintetica, Analitica e Debug
----------------------------------------------------------------------------------------------------
Data      : 16/02/2006
Autor     : Fabio Fagundes
Código    : AL_1
Descrição : Melhorias para resolver divergência de 0,01 centavo
            Passa a ler os registros baixados do CFinan e não mais do CAP/CAR
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
  wwdbedit, Wwdotdot, Wwdbcomb, TB97Ctls, uCtrlPadroes, uCMMath,
  //AL_3
  uCtrlMovimFinanc;

type
  TfrmConsDisponibilidadeMT2 = class(TfrmSairAjuda)
    Panel1: TPanel;
    PgcSaldos: TPageControl;
    tbsSintetica: TTabSheet;
    tbsAnalitica: TTabSheet;
    Panel10: TPanel;
    dbgAnalitico: TwwDBGrid;
    dbgSintetico: TwwDBGrid;
    pnlDados: TPanel;
    Label1: TLabel;
    Timer: TTimer;
    ToolbarSep971: TToolbarSep97;
    dsSintetica: TwwDataSource;
    dsAnalitica: TwwDataSource;
    CdsParamFinanc: TCMClientDataSet;
    CdsDispFinanc: TCMClientDataSet;
    CdsParamFinancDATABLOQDISPFINAN: TDateTimeField;
    CdsParamFinancFLGDISPBLOQ: TStringField;
    Label2: TLabel;
    edtIntervalo: TdxTimeEdit;
    CMSqlParams1: TCMSqlParams;
    CdsDispAnalitica: TCMClientDataSet;
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
    pplRecebimentosA: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText6: TppDBText;
    pplNomeForcli: TppDBText;
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
    pplPlanoPatroS: TppLabel;
    pplSaldoAnteriorS: TppLabel;
    pplRecebimentosS: TppLabel;
    pplDesembolsosS: TppLabel;
    pplSaldoAtualS: TppLabel;
    ppDetailBand1: TppDetailBand;
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
    pplDesembolsosA: TppLabel;
    pplSaldoAtualA: TppLabel;
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
    ppSummaryBand2: TppSummaryBand;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLabel4: TppLabel;
    ppDBText12: TppDBText;
    edtDataRef: TCMDateTimePicker;
    CdsParamFinancDATAINIDISPFINANC: TDateTimeField;
    tbsDepuracao: TTabSheet;
    dsDebug: TwwDataSource;
    qryDebug: TwwQuery;
    CdsDispAnaliticaNODOCUMENTO: TStringField;
    CdsDispAnaliticaNOMEFORCLI: TStringField;
    CdsDispAnaliticaCODCENTRORESPON: TStringField;
    CdsDispAnaliticaNOME: TStringField;
    CdsDispAnaliticaTIPOREG: TFloatField;
    CdsDispAnaliticaSALDOANT: TFloatField;
    CdsDispAnaliticaRECEBIMENTOS: TFloatField;
    CdsDispAnaliticaDESEMBOLSOS: TFloatField;
    CdsDispAnaliticaIDPESSOA: TFloatField;
    CdsDispAnaliticaPLANO: TStringField;
    CdsDispAnaliticaPATRO: TStringField;
    CdsDispAnaliticaSALDO: TFloatField;
    pnlDepuracao: TPanel;
    cmbTipos: TwwDBComboBox;
    btnDebug: TToolbarButton97;
    pgcDebug: TPageControl;
    tbsResulDebug: TTabSheet;
    tbsQryDebug: TTabSheet;
    CdsDispAnaliticaNUMDOC: TStringField;
    CdsDispAnaliticaNUMAPGR: TFloatField;
    dbgDebug: TDBGrid;
    memoDebug: TMemo;
    CdsDispAnaliticaNUMLOTE: TFloatField;
    lblLote: TppLabel;
    ppdbLote: TppDBText;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    pplLoteAnalitica: TppBDEPipeline;
    dsLoteAnalitica: TwwDataSource;
    CdsLoteAnalitica: TCMClientDataSet;
    ppDBText11: TppDBText;
    ppDBText14: TppDBText;
    ppShape1: TppShape;
    chkExpandido: TCheckBox;
    ppTitleBand1: TppTitleBand;
    ppLabel21: TppLabel;
    ppLabel20: TppLabel;
    ppLabel18: TppLabel;
    ppShape2: TppShape;
    Documento: TppLabel;
    Valor: TppLabel;
    ppLabel17: TppLabel;
    ppDBText13: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLine1: TppLine;
    sqlLoteAnalitica: TCMSqlParams;
    ppLine3: TppLine;
    dbgGridLoteAnalitico: TwwDBGrid;
    CdsDispAnaliticaSALDODIA: TFloatField;
    CdsDispAnaliticaCODLANCFINANC: TFloatField;
    CdsLoteAnaliticaVALOR: TFloatField;
    CdsLoteAnaliticaCODCENTRORESPON: TStringField;
    CdsLoteAnaliticaRAZAOSOCIAL: TStringField;
    CdsLoteAnaliticaNODOCUMENTO: TFloatField;
    CdsLoteAnaliticaNUMAPGR: TFloatField;
    CdsLoteAnaliticaNUMLOTE: TFloatField;
    CdsLoteAnaliticaCODDOCUMENTO: TFloatField;
    CdsLoteAnaliticaCENTRORESPON: TStringField;
    ppDBText7: TppDBText;
    ppLabel19: TppLabel;
    ppLabel22: TppLabel;
    ppDBText15: TppDBText;
    rdgTipoRecDes: TRadioGroup;
    rdgGrupamento: TRadioGroup;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    CdsDispSintetica: TCMClientDataSet;
    CdsDispSinteticaNOMEGRUPO: TStringField;
    CdsDispSinteticaGRUPO: TStringField;
    CdsDispSinteticaIDPATRO: TFloatField;
    CdsDispSinteticaIDPLANOPREV: TFloatField;
    CdsDispSinteticaSALDOANT: TFloatField;
    CdsDispSinteticaRECEBIMENTOS: TFloatField;
    CdsDispSinteticaDESEMBOLSOS: TFloatField;
    CdsDispSinteticaSALDODIA: TFloatField;
    CdsDispAnaliticaNOMEPLANOPATRO: TStringField;
    CdsDispAnaliticaGRUPO: TStringField;
    CdsDispAnaliticaNOMEGRUPO: TStringField;
    btnAtualiza: TBitBtn;
    CdsDebug: TCMClientDataSet;
    CdsDispSinteticaTIPO: TFloatField;
    CdsDispAnaliticaTIPO: TFloatField;
    pplTipoRecDesS: TppLabel;
    pplTipoRecDesA: TppLabel;
    SitPlano: TLabel;
    cmbSitPlano: TComboBox;

    procedure FormActivate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
    procedure ppShape3Print(Sender: TObject);
    procedure ppShape4Print(Sender: TObject);
    procedure btnDebugClick(Sender: TObject);
    procedure cmbTiposChange(Sender: TObject);
    procedure dbgDebugCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgDebugTopRowChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppSubReport1Print(Sender: TObject);
    procedure CdsDispAnaliticaAfterScroll(DataSet: TDataSet);
    procedure btnAtualizaClick(Sender: TObject);
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
    CtrlDispFinanc    : TCtrlDisponFinanc;

    procedure Atualiza;
    procedure AtualizaGrids;
    function BuscaDiaRecolhCPMF(dDataRef:TDateTime):TDateTime;
    function BuscaPrimeiDiaAposCPMF(dDataRef:TDateTime):TDateTime;
    function BuscaPrimeiroDiaIRRF(dDataRef:TDateTime):TDateTime;
    function TrocaString (sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;


  public  { Public declarations }

    bmPosicao: TBookmark;


  end;




var
  frmConsDisponibilidadeMT2: TfrmConsDisponibilidadeMT2;
  bFirst,bConciliada,bFirstAtualiza : boolean;
  fSaldoAnterior, fRecebimentos, fDesembolsos, fSaldoDoDia : Double;
  dDataIniMes,dDataIniMesAnt,dDataFimMesAnt,dDataINSS,dDataIniIRRF,dDataFimIRRF,dDataCPMF : TDateTime;
  dDataDARF, dDataAnt, dDataRef : TDateTime;
  bGeraAnalitica : Boolean;
  sPatro, sPlano : String;
  iSaldoAntINSS, iSaldoAntIRRF, iQuarta : Integer;
  sFlgIndRecDes, sCodLanFinanc, sSqlReturn : String;
  //AL_10
  sDataAnt, sPlanoPatro, sOperNaoOper, sSaldoAnterior, sRecebimentos, sDesembolsos, sSaldoAtual : String;




implementation
{$R *.DFM}
uses
  FPrincipal;




procedure TfrmConsDisponibilidadeMT2.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;



procedure TfrmConsDisponibilidadeMT2.TimerTimer(Sender: TObject);
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



procedure TfrmConsDisponibilidadeMT2.FormShow(Sender: TObject);
begin
  inherited;

  edtIntervalo.Time := StrToTime('00:10:00');
  fMaxValor := 0;
  fMinValor := 0;
  PgcSaldos.ActivePage := tbsSintetica;
  bFaz := False;
  bFirstAtualiza := True;
  edtDataRef.Text := DateToStr(Now);

  // A nova Orelha de Depuração só é visualizada por Usuários .CM ou pela Karina (Funcef)
  if ((Pos('.CM', Sistema.NomeUsuario) > 0) or
      (Sistema.NomeUsuario = 'KARINAB')) then
     tbsDepuracao.TabVisible := True
  else
     tbsDepuracao.TabVisible := False;

  //AL_7
  rdgGrupamento.ItemIndex := 0;
  rdgTipoRecDes.ItemIndex := 0;
  cmbSitPlano.ItemIndex := 0; //Marilza Colpani - SOL: 122335/Kintana: 598524
end;



procedure TfrmConsDisponibilidadeMT2.Atualiza;
var
  sAtivPlano : string;
begin
   // Desabilita o Timer para não contar o tempo de abertura das queries no intervalo
   if (bFaz) then
   begin
      Timer.Enabled := False;
      Application.ProcessMessages;

      // Busca das tabelas Documento / Movimfinanc
      // Atualiza a disponibilidade Sintética
      dbgSintetico.Visible := True;
      dbgAnalitico.Visible := True;

      // Colocar no Parametro e trazer o default para a Tela
      if rdgTipoRecDes.ItemIndex = 0 then // Todos
         sFlgIndRecDes := 'null'
      else if rdgTipoRecDes.ItemIndex = 1 then // Operacional
         sFlgIndRecDes := 'S'
      else if rdgTipoRecDes.ItemIndex = 2 then // Não Operacioanal
         sFlgIndRecDes := 'N';

      //Marilza Colpani - SOL: 122335/Kintana: 598524 - início
      case cmbSitPlano.ItemIndex of
        0: sAtivPlano := 'S';
        1: sAtivPlano := 'N';
      End;
     //Marilza Colpani - SOL: 122335/Kintana: 598524 - fim


      CdsDispSintetica.Close;
      CdsDispSintetica.Data := CtrlDispFinanc.ListDisponibilidade('Sintetica',
                                                                  StrToDate(edtDataRef.Text),
                                                                  Sistema.IdEmpresa,
                                                                  'null',
                                                                  'null',
                                                                  IntToStr(rdgGrupamento.ItemIndex),
                                                                  sFlgIndRecDes,
                                                                  sAtivPlano);
      sSqlReturn := CtrlDispFinanc.SqlRetorno;

      //AL_10
      sPlanoPatro  := '';
      sOperNaoOper := '';
      sDataAnt := '';
      sSaldoAnterior := '';
      sRecebimentos := '';
      sDesembolsos := '';
      sSaldoAtual := '';

      if rdgGrupamento.ItemIndex = 0 then
         sPlanoPatro := 'Plano / Patrocinadora'
      else if rdgGrupamento.ItemIndex = 1 then
         sPlanoPatro := 'Plano'
      else if rdgGrupamento.ItemIndex = 2 then
         sPlanoPatro := 'Patrocinadora';

      if rdgTipoRecDes.ItemIndex = 0 then
         sOperNaoOper := ' : Todos  '
      else if rdgTipoRecDes.ItemIndex = 1 then
         sOperNaoOper := ' : Operacionais  '
      else if rdgTipoRecDes.ItemIndex = 2 then
         sOperNaoOper := ' : Não Operacacionais  ';

      sDataAnt := DateToStr(StrToDate(edtDataRef.Text) - 1);
      sSaldoAnterior := '  Saldo Anterior : '+ sDataAnt + '  ';
      sRecebimentos  := '  Recebimentos : '+ edtDataRef.Text + '  ';
      sDesembolsos   := '  Desembolsos : '+ edtDataRef.Text + '  ';
      sSaldoAtual    := '  Saldo Atual : '+ edtDataRef.Text + '  ';

      dbgSintetico.Columns[0].DisplayLabel := sPlanoPatro;
      dbgSintetico.Columns[1].DisplayLabel := sSaldoAnterior;
      dbgSintetico.Columns[2].DisplayLabel := sRecebimentos;
      dbgSintetico.Columns[3].DisplayLabel := sDesembolsos;
      dbgSintetico.Columns[4].DisplayLabel := sSaldoAtual;

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

      CdsDispSinteticaNOMEGRUPO.AsString := 'TOTAL GERAL';
      CdsDispSinteticaSALDOANT.AsFloat        := fSaldoAnterior;
      CdsDispSinteticaRECEBIMENTOS.AsFloat    := fRecebimentos;
      CdsDispSinteticaDESEMBOLSOS.AsFloat     := fDesembolsos;
      CdsDispSinteticaSALDODIA.AsFloat        := fSaldoDoDia;
      //AL_9
      CdsDispSinteticaTIPO.AsFloat            := 1;
      CdsDispSintetica.Post;

      CdsDispSintetica.EnableControls;

      // Habilita o Timer
      Timer.Enabled := True;
      if bFirstAtualiza then
         bFirstAtualiza := False;
      bFaz := False;
   end;
end;



procedure TfrmConsDisponibilidadeMT2.PgcSaldosChange(Sender: TObject);
var
   sAtivPlano: String; //Marilza Colpani - SOL: 122335/Kintana: 598524
begin
   inherited;
   bmPosicao := CdsDispSintetica.GetBookmark;
   cmbTipos.Text := '';
   if PgcSaldos.ActivePage = tbsAnalitica then
   begin
      //AL_2
      if not CdsDispSintetica.IsEmpty then
      begin
         qryDebug.Close;
         qryDebug.SQL.Clear;
         dbgAnalitico.RefreshDisplay;

         if rdgTipoRecDes.ItemIndex = 0 then // Todos
            sFlgIndRecDes := 'null'
         else if rdgTipoRecDes.ItemIndex = 1 then // Operacional
            sFlgIndRecDes := 'S'
         else if rdgTipoRecDes.ItemIndex = 2 then // Não Operacioanal
            sFlgIndRecDes := 'N';

         //Marilza Colpani - SOL: 122335/Kintana: 598524 - início
         case cmbSitPlano.ItemIndex of
           0: sAtivPlano := 'S';
           1: sAtivPlano := 'N';
         End;
         //Marilza Colpani - SOL: 122335/Kintana: 598524 - fim


         CdsDispAnalitica.Close;
         CdsDispAnalitica.Data := CtrlDispFinanc.ListDisponibilidade('Analitica',
                                                                     StrToDate(edtDataRef.Text),
                                                                     Sistema.IdEmpresa,
                                                                     IntToStr(CdsDispSinteticaIDPATRO.AsInteger),
                                                                     IntToStr(CdsDispSinteticaIDPLANOPREV.AsInteger),
                                                                     IntToStr(rdgGrupamento.ItemIndex),
                                                                     sFlgIndRecDes,
                                                                     sAtivPlano);
         sSqlReturn := CtrlDispFinanc.SqlRetorno;

         sPatro := CdsDispAnaliticaPATRO.AsString;
         sPlano := CdsDispAnaliticaPLANO.AsString;

         // Inclui Saldo Final
         if not CdsDispAnalitica.IsEmpty then
            CdsDispAnalitica.Append
         else
            CdsDispAnalitica.Insert;

         CdsDispAnaliticaNODOCUMENTO.AsString     := '';
         CdsDispAnaliticaNOMEFORCLI.AsString      := 'SALDO FINAL   - ' + CdsDispSinteticaNOMEGRUPO.AsString;
         CdsDispAnaliticaSALDO.AsFloat            := 0;
         CdsDispAnaliticaTIPOREG.AsString         := '4';
         CdsDispAnaliticaSALDOANT.AsFloat         := CdsDispSinteticaSALDODIA.AsFloat;
         CdsDispAnaliticaRECEBIMENTOS.AsFloat     := CdsDispSinteticaRECEBIMENTOS.AsFloat;
         CdsDispAnaliticaDESEMBOLSOS.AsFloat      := CdsDispSinteticaDESEMBOLSOS.AsFloat;
         CdsDispAnaliticaCODCENTRORESPON.AsString := '';
         CdsDispAnaliticaNOME.AsString := '';
         //AL_9
         CdsDispAnaliticaTIPO.AsFloat             := 1;
         CdsDispAnalitica.Post;
         CdsDispAnalitica.First;

         // Monta o Lote da Analitica
         sCodLanFinanc := '';
         while not CdsDispAnalitica.Eof do
         begin
             if CdsDispAnalitica.FieldByName('CODLANCFINANC').AsInteger <> 0 then
             begin
                if sCodLanFinanc = '' then
                   sCodLanFinanc := CdsDispAnalitica.FieldByName('CODLANCFINANC').AsString
                else
                   sCodLanFinanc := sCodLanFinanc + ',' + CdsDispAnalitica.FieldByName('CODLANCFINANC').AsString;
             end;
             CdsDispAnalitica.Next;
         end;
         CdsDispAnalitica.First;
         CdsDispAnalitica.EnableControls;
         if sCodLanFinanc <> '' then
         begin
            CdsLoteAnalitica.Close;
            CdsLoteAnalitica.Data := CtrlDispFinanc.ListConsultaDoc(sCodLanFinanc,
                                                                    Sistema.IdEmpresa,
                                                                    CdsDispSintetica.FieldByName('IDPATRO').AsInteger,
                                                                    CdsDispSintetica.FieldByName('IDPLANOPREV').AsInteger);
         end
         else
         begin
            CdsLoteAnalitica.Close;
            CdsLoteAnalitica.Data := CtrlDispFinanc.ListConsultaDoc('-1',
                                                                    Sistema.IdEmpresa,
                                                                    CdsDispSintetica.FieldByName('IDPATRO').AsInteger,
                                                                    CdsDispSintetica.FieldByName('IDPLANOPREV').AsInteger);
         end;
      end;
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



procedure TfrmConsDisponibilidadeMT2.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlDisponibxusu := TCtrlDisponibxusu.Create;
   CtrlDisponibxusu.InitializeAs(Padroes);

   CtrlDispFinanc := TCtrlDisponFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                              Sistema.IdUsuario,Sistema.UsaPlanoPatro);
   CtrlDispFinanc.InitializeAs(Padroes);

   CtrlParamFinanc := TCtrlParamFinanc.Create;
   CtrlParamFinanc.InitializeAs(Padroes);
   CdsParamFinanc.Data  := CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);


   edtDataRef.Date      := CdsParamFinanc.FieldByName('DATABLOQDISPFINAN').AsDateTime;

   AtualizaGrids;
end;



procedure TfrmConsDisponibilidadeMT2.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlParamFinanc.Free;
  CtrlDisponibxusu.Free;
  CtrlDispFinanc.Free;
end;



procedure TfrmConsDisponibilidadeMT2.eOnMessage(sMsg : string);
begin
  MsgDlg(sMsg,'Atenção',mtWarning,[mbOk],0);
end;



procedure TfrmConsDisponibilidadeMT2.edtDataRefExit(Sender: TObject);
begin
  inherited;
   begin
      CdsDispFinanc.Data   := CtrlDispFinanc.SelecionaDispFinanc(edtDataRef.Date );
      AtualizaGrids;
   end;
end;



procedure TfrmConsDisponibilidadeMT2.AtualizaGrids;
begin
  bConciliada := False;
  dbgSintetico.Visible := True;
  dbgAnalitico.Visible := True;
end;



procedure TfrmConsDisponibilidadeMT2.dbgAnaliticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmConsDisponibilidadeMT2.dbgDispAnaliticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmConsDisponibilidadeMT2.dbgDispSinteticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmConsDisponibilidadeMT2.dbgSinteticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmConsDisponibilidadeMT2.dbgAnaliticoTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT2.dbgDispAnaliticaTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT2.dbgDispSinteticaTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT2.dbgSinteticoTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT2.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
   lblEmpresaSintetica.Caption := Sistema.NomeEmpresa;
   lblEmpresaAnalitica.Caption := Sistema.NomeEmpresa;
   lblGrafico.Caption          := Sistema.NomeEmpresa;
   lblDataGrafico.Caption   := edtDataRef.Text;
   lblDataSintetica.Caption := edtDataRef.Text;
   lblDataAnalitica.Caption := edtDataRef.Text;

   //AL_10
   pplPlanoPatroS.Caption    := sPlanoPatro;
   pplSaldoAnteriorS.Caption := sSaldoAnterior;
   pplRecebimentosS.Caption  := sRecebimentos;
   pplDesembolsosS.Caption   := sDesembolsos;
   pplSaldoAtualS.Caption    := sSaldoAtual;
   pplTipoRecDesS.Caption    := 'Tipo de Recbto / Desemb.' + sOperNaoOper;
   pplTipoRecDesA.Caption    := 'Tipo de Recbto / Desemb.' + sOperNaoOper;

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
      CdsDispAnalitica.DisableControls;
      CdsLoteAnalitica.DisableControls;

      if chkExpandido.Checked then
         ppSubReport1.ExpandAll := True
      else
         ppSubReport1.ExpandAll := False;

      pplCaptionDispAnalitica.Caption := 'Disponibilidade Analítica' +' : ' + sPlano +' / ' + sPatro;
      TfrmPreview.CreateModalPreview(Application,
                                     rptDispAnalitica,
                                     rptDispAnalitica.PrinterSetup.DocumentName);
      CdsDispAnalitica.EnableControls;
      CdsLoteAnalitica.EnableControls;
   end
   else if PgcSaldos.ActivePage = tbsGrafico then
   begin
      TfrmPreview.CreateModalPreview(Application,
                                     rptDispGrafico,
                                     rptDispGrafico.PrinterSetup.DocumentName);
   end;
end;



procedure TfrmConsDisponibilidadeMT2.rptDispAnaliticaStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   ppShape4.Brush.Color := clWhite;
   bFirst := True;
end;



procedure TfrmConsDisponibilidadeMT2.ppGroupFooterBand1BeforePrint(
  Sender: TObject);
begin
  if ((Trim(CdsDispAnaliticaNOMEPLANOPATRO.AsString) = '') or
     (COPY(CdsDispAnaliticaNOMEFORCLI.AsString,1,13) = 'SALDO INICIAL')) and
     (not bFirst) then
  else if (bFirst) and
     (Trim(CdsDispAnaliticaNOMEPLANOPATRO.AsString) <> 'TOTAL GERAL') then
  else if bFirst then
     bFirst := False;

  inherited;
end;



procedure TfrmConsDisponibilidadeMT2.ppShape3Print(Sender: TObject);
begin
  inherited;
   if cCorZebra = clWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := clWhite;

   if COPY(CdsDispSinteticaNOMEGRUPO.AsString,1,11) = 'TOTAL GERAL' then
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



procedure TfrmConsDisponibilidadeMT2.ppShape4Print(Sender: TObject);
begin
  inherited;
   if cCorZebra = clWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := clWhite;

   TppShape(Sender).Brush.Color := cCorZebra;

  if CdsDispAnaliticaTIPOREG.AsInteger = 1 then // Saldo Incial
    dbtSaldoDoDia.BlankWhenZero := False
  else
    dbtSaldoDoDia.BlankWhenZero := True;
end;



function TfrmConsDisponibilidadeMT2.BuscaDiaRecolhCPMF(dDataRef:TDateTime):TDateTime;
var
  dData : TDateTime;
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



function TfrmConsDisponibilidadeMT2.BuscaPrimeiroDiaIRRF(dDataRef:TDateTime):TDateTime;
var dData : TDateTime;
begin
   // Buscar a Segunda-feira da semana anterior da DataRef.
   dData := dDataRef;
   if (DayOfWeek(dData) = 1) then // Domingo
      dData := dData - 6;
   if (DayOfWeek(dData) = 2) then // Segunda
      dData := dData - 7;
   if (DayOfWeek(dData) = 3) then // Terça
      dData := dData - 8;
   if (DayOfWeek(dData) = 4) then // Quarta
      dData := dData - 9;
   if (DayOfWeek(dData) = 5) then // Quinta
      dData := dData - 10;
   if (DayOfWeek(dData) = 6) then // Sexta
      dData := dData - 11;
   if (DayOfWeek(dData) = 7) then // Sábado
      dData := dData - 12;
   Result := dData;
end;



function TfrmConsDisponibilidadeMT2.BuscaPrimeiDiaAposCPMF(dDataRef:TDateTime):TDateTime;
var dData : TDateTime;
begin
  dData := BuscaDiaRecolhCPMF(StrToDate(edtDataRef.Text));
  Result := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dData,True,True,False);
end;



procedure TfrmConsDisponibilidadeMT2.btnDebugClick(Sender: TObject);
var I, iPos: Integer;
    bCopia: Boolean;
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
      qryDebug.SQL.Clear;
      memoDebug.Clear;
      Application.ProcessMessages;
      bCopia := False;
      // Somente executa se houver tiver rodado a qrySintetica
      if not CdsDispAnalitica.IsEmpty then
      begin
         qryDebug.SQL.Text := sSqlReturn;
         for I := 0 to (qryDebug.SQL.Count -1) do
         begin
            // Verifica se a TAG existe na linha atual do SQL
            iPos := Pos(cmbTipos.Value + '_', qryDebug.SQL.Strings[I]);
            if iPos > 0 then
            begin
               // Verifica se é a TAG inicial ou a final
               if Copy(qryDebug.SQL.Strings[I], iPos + Length(cmbTipos.Value), 2) = '_I' then
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
               memoDebug.Lines.Add(qryDebug.SQL.Strings[I]);
               memoDebug.refresh;
               Repaint;
            end;
         end;

         // Retira a Primeira linha ( linha com o comentário da TAG )
         if Trim(memoDebug.Text) <> '' then
         begin
            memoDebug.Lines[0] := '';

            CdsDebug.Data := CtrlDispFinanc.ListDispDebug(memoDebug.Text);

            pgcDebug.ActivePage := tbsResulDebug;
         //AL_1 Fim
         end
         else
            MsgDlg('A TAG ' + cmbTipos.Value + ' não foi encontrada no SQL','Atenção',mtWarning,[mbOk],0);
      end
         else
            MsgDlg('A Disponibilidade Analítica não foi executada.','Atenção',mtWarning,[mbOk],0);
   end;
end;



procedure TfrmConsDisponibilidadeMT2.cmbTiposChange(Sender: TObject);
begin
   inherited;
   with qryDebug do
   begin
      Close;
      SQL.Clear;
   end;
end;



function TfrmConsDisponibilidadeMT2.TrocaString(sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
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



procedure TfrmConsDisponibilidadeMT2.dbgDebugCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmConsDisponibilidadeMT2.dbgDebugTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CdsLoteAnalitica.Close;
end;



procedure TfrmConsDisponibilidadeMT2.ppSubReport1Print(Sender: TObject);
begin
  inherited;
  if CdsDispAnalitica.FieldByName('NUMLOTE').AsInteger <> 0 then
     CdsLoteAnalitica.Filter := ' NUMLOTE = ' + CdsDispAnalitica.FieldByName('NUMLOTE').AsString
  else
     CdsLoteAnalitica.Filter := 'NUMLOTE = -1';
end;



procedure TfrmConsDisponibilidadeMT2.CdsDispAnaliticaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if CdsDispAnalitica.FieldByName('NUMLOTE').AsInteger <> 0 then
     CdsLoteAnalitica.Filter := ' NUMLOTE = ' + CdsDispAnalitica.FieldByName('NUMLOTE').AsString
  else
     CdsLoteAnalitica.Filter := 'NUMLOTE = -1';
end;



procedure TfrmConsDisponibilidadeMT2.btnAtualizaClick(Sender: TObject);
begin
  inherited;
  //AL_8
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



procedure TfrmConsDisponibilidadeMT2.ppLabel3Print(Sender: TObject);
begin
  inherited;
   TppLabel(Sender).Caption:=Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;



procedure TfrmConsDisponibilidadeMT2.lblDispAnaSistemaPrint(Sender: TObject);
begin
  inherited;
   TppLabel(Sender).Caption:=Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;



procedure TfrmConsDisponibilidadeMT2.ppLabel9Print(Sender: TObject);
begin
  inherited;
   TppLabel(Sender).Caption:=Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;



end.
