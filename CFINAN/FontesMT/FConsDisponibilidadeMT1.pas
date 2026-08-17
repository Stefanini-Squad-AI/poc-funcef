unit FConsDisponibilidadeMT1;

// Alterações:
{---------------------------------------------------------------------------------------------------
Data      : 13/07/2007
Autor     : Fabio Fagundes
Código    : AL_15
Pendência : 25338
SOL       : 59836
Descrição : Acerto no item 2.7 que deve trazer somente os documentos com (Status <> 2)  pois quando
             são englobados, geram um novo documento que deverá vir por outros itens
----------------------------------------------------------------------------------------------------
Data      : 13/06/2007
Autor     : Fabio Fagundes
Código    : AL_14
Pendência : 24131
SOL       : 52190
Descrição : Implementação do Intervalo de Disponibilidade Financeira
----------------------------------------------------------------------------------------------------
Data      : 08/03/2007
Autor     : Fabio Fagundes
Código    : AL_13
Pendência : 24131
SOL       : 52190
Descrição : Implementação do Intervalo de Disponibilidade Financeira
----------------------------------------------------------------------------------------------------
Data      : 08/03/2007
Autor     : Fabio Fagundes
Código    : AL_12
Pendência : 24113
SOL       :
Descrição : Alteração do item 1.11 e 2.8 para trazer os registro de IRRF de documentos baixados e
            não baixados que não estajam em DARF gerado.
            O IRRF é recolhido todo dia 10 de cada mês (se não for dia útil, retroagir até o dia
            anterior) com os documentos gerados no mês anterior.
            O item 1.11 foi descontinuado pois o IRRF somente é gerado no dia 10
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
Código    : AL_10
Pendência : 24344
SOL       :
Descrição : Tratamento para não permitir a geração em data anterior a data inicial de Disponibilidade
----------------------------------------------------------------------------------------------------
Data      : 30/01/2007
Autor     : Fabio Fagundes
Código    : AL_09
Pendência : 24296
SOL       : 49782
Descrição : Acerto na montagem do periodo inicial do item 1.3 que estava trazendo registro na data
            inicial de Disponibilidade
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
Descrição : Acerto na qryAnalitica item (1.6) que estava fazendo carteziano com a RateioDocum
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
  TfrmConsDisponibilidadeMT1 = class(TfrmSairAjuda)
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
    qryAnaliticaNUMLOTE: TFloatField;
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
    qryAnaliticaCODLANCFINANC: TFloatField;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppSubReport1Print(Sender: TObject);
    procedure CdsDispAnaliticaAfterScroll(DataSet: TDataSet);


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
    procedure MontaParametros(sQry:String);
    function BuscaDiaRecolhCPMF(dDataRef:TDateTime):TDateTime;
    function BuscaPrimeiDiaAposCPMF(dDataRef:TDateTime):TDateTime;
    function BuscaPrimeiroDiaIRRF(dDataRef:TDateTime):TDateTime;
    function TrocaString (sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;


  public  { Public declarations }

    bmPosicao: TBookmark;


  end;



var
  frmConsDisponibilidadeMT1: TfrmConsDisponibilidadeMT1;
  bFirst,bConciliada,bFirstAtualiza : boolean;
  fSaldoAnterior, fRecebimentos, fDesembolsos, fSaldoDoDia : Double;
  dDataIniMes,dDataIniMesAnt,dDataFimMesAnt,dDataINSS,dDataIniIRRF,dDataFimIRRF,dDataCPMF : TDateTime;
  dDataDARF, dDataAnt, dDataRef : TDateTime;
  bGeraAnalitica : Boolean;
  sPatro, sPlano : String;
  iSaldoAntINSS, iSaldoAntIRRF, iQuarta, iPatro, iPlanoPrev : Integer;
  //AL_12
  iDiaDarf : Integer;



implementation
{$R *.DFM}
uses
  FPrincipal;



procedure TfrmConsDisponibilidadeMT1.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;



procedure TfrmConsDisponibilidadeMT1.TimerTimer(Sender: TObject);
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



procedure TfrmConsDisponibilidadeMT1.FormShow(Sender: TObject);
begin
  inherited;
  //AL_13

  fMaxValor := 0;
  fMinValor := 0;
  PgcSaldos.ActivePage := tbsSintetica;
  bFaz := False;
  bFirstAtualiza := True;
  edtDataRef.Text := DateToStr(Now);

end;



procedure TfrmConsDisponibilidadeMT1.bbtnIniciarClick(Sender: TObject);
begin
  inherited;

  //AL_10
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



procedure TfrmConsDisponibilidadeMT1.MontaParametros(sQry:String);
var
   iAno, iMes, iDia : word;
   fValorTot, fValor, fDif : Double;
   iLote : Integer;
   SaveReg: TBookmark;
   //AL_3
   sCodLanFinanc : String;
begin
   dDataRef := StrToDate(edtDataRef.Text);

   DecodeDate(StrToDate(edtDataRef.Text), iAno, iMes, iDia);

   // INSS - Todo dia 2 (útil) ou 1º útil subsequente
   dDataINSS := EncodeDate(iAno, iMes, 2);
   if not DiasUteis.DiaUtil(dDataINSS,-1,1,'',True,True,False) then
      dDataINSS := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dDataINSS,True,True,False);
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
   //AL_12 Ini
   // Passa a buscar os registros do mês anterior
   dDataIniIRRF := dDataIniMesAnt;
   dDataFImIRRF := dDataFimMesAnt;

   // DARF 3º dia útil da semana subsequente ao fato gerador
   // DARF - Recolhe todo dia 10 de cada mês se dia útil ou primeiro anterior útil
   DecodeDate(StrToDate(edtDataRef.Text), iAno, iMes, iDia);
   dDataDARF := EncodeDate(iAno, iMes, 10);
   if not DiasUteis.DiaUtil(dDataDARF,-1,1,'',True,True,False) then
      dDataDARF := DiasUteis.UltDiaUtilAnterior(Sistema.IdEmpresa,dDataDARF,True,True,False);
   iDiaDarf := 0;
   if dDataRef = dDataDARF then
      iDiaDarf := 1;

   //AL_12 Fim
   iPatro     := CdsDispSinteticaIDPATRO.AsInteger;
   iPlanoPrev := CdsDispSinteticaIDPLANO.AsInteger;

   if sQry = 'qrySintetica' then
   begin
      qrySintetica.Close;
      qrySintetica.DisableControls;
      qrySintetica.ParamByName('IDPATRO').Clear;
      qrySintetica.ParamByName('IDPLANOPREV').Clear;
      qrySintetica.ParamByName('DATAREF').AsString        := DateToStr(dDataRef);
      qrySintetica.ParamByName('DATAANT').AsString        := DateToStr(dDataAnt);
      qrySintetica.ParamByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
      qrySintetica.ParamByName('DATASALDOANT').AsString   := DateToStr(CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime);
      qrySintetica.ParamByName('DATAINIMES').AsString     := DateToStr(dDataIniMes);
      qrySintetica.ParamByName('DATAINIMESANT').AsString  := DateToStr(dDataIniMesAnt);
      qrySintetica.ParamByName('DATAFIMMESANT').AsString  := DateToStr(dDataFimMesAnt);
      qrySintetica.ParamByName('DATAINSS').AsString       := DateToStr(dDataINSS);
      qrySintetica.ParamByName('BSALDOANTINSS').AsInteger := iSaldoAntINSS;
      qrySintetica.ParamByName('DATAINIIRRF').AsString    := DateToStr(dDataIniIRRF);
      qrySintetica.ParamByName('DATAFIMIRRF').AsString    := DateToStr(dDataFimIRRF);
      //AL_12
      qrySintetica.ParamByName('BSALDOANTIRRF').AsInteger := iSaldoAntIRRF;
      qrySintetica.ParamByName('BQUARTA').AsInteger       := iQuarta;
   end
   else if sQry = 'qryAnalitica' then
   begin
      qryAnalitica.Close;
      qryAnalitica.DisableControls;
      qryAnalitica.ParamByName('IDPATRO').AsInteger       := CdsDispSinteticaIDPATRO.AsInteger;
      qryAnalitica.ParamByName('IDPLANOPREV').AsInteger   := CdsDispSinteticaIDPLANO.AsInteger;
      qryAnalitica.ParamByName('DATAREF').AsString        := DateToStr(dDataRef);
      qryAnalitica.ParamByName('DATAANT').AsString        := DateToStr(dDataAnt);
      qryAnalitica.ParamByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
      qryAnalitica.ParamByName('DATASALDOANT').AsString   := DateToStr(CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime);//'11/01/2004';
      qryAnalitica.ParamByName('DATAINIMES').AsString     := DateToStr(dDataIniMes);
      qryAnalitica.ParamByName('DATAINIMESANT').AsString  := DateToStr(dDataIniMesAnt);
      qryAnalitica.ParamByName('DATAFIMMESANT').AsString  := DateToStr(dDataFimMesAnt);
      qryAnalitica.ParamByName('DATAINSS').AsString       := DateToStr(dDataINSS);
      qryAnalitica.ParamByName('BSALDOANTINSS').AsInteger := iSaldoAntINSS;
      qryAnalitica.ParamByName('DATAINIIRRF').AsString    := DateToStr(dDataIniIRRF);
      qryAnalitica.ParamByName('DATAFIMIRRF').AsString    := DateToStr(dDataFimIRRF);
      qryAnalitica.ParamByName('BSALDOANTIRRF').AsInteger := iSaldoAntIRRF;
      qryAnalitica.ParamByName('BQUARTA').AsInteger       := iQuarta;
   end
   else if sQry = 'qryLoteAnalitica' then
   begin
         CdsDispAnalitica.DisableControls;
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
         //AL_6
         if sCodLanFinanc <> '' then
            CdsLoteAnalitica.Data := CtrlDispFinanc.ListConsultaDoc(sCodLanFinanc,
                                                                    Sistema.IdEmpresa,
                                                                    CdsDispSintetica.FieldByName('IDPATRO').AsInteger,
                                                                    CdsDispSintetica.FieldByName('IDPLANO').AsInteger);

   end
   else if sQry = 'qryDebug' then
   begin
      qryDebug.DatabaseName := qryAnalitica.DatabaseName;
      qryDebug.Close;
      if qryDebug.Params.FindParam('DATASALDOANT') <> nil then
         qryDebug.Params.FindParam('DATASALDOANT').AsString  := DateToStr(CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime);//'11/01/2004';
      if qryDebug.Params.FindParam('DATAREF') <> nil then
         qryDebug.Params.FindParam('DATAREF').AsString       := DateToStr(dDataRef);
      if qryDebug.Params.FindParam('DATAANT') <> nil then
         qryDebug.Params.FindParam('DATAANT').AsString       := DateToStr(edtDataRef.Date - 1);
      if qryDebug.Params.FindParam('DATAINIMES') <> nil then
         qryDebug.Params.FindParam('DATAINIMES').AsString    := DateToStr(dDataIniMes);
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
   end;
end;



procedure TfrmConsDisponibilidadeMT1.Atualiza;
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

      MontaParametros('qrySintetica');

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
      
      CdsDispSintetica.EnableControls;

      // Habilita o Timer
      Timer.Enabled := True;
      if bFirstAtualiza then
         bFirstAtualiza := False;
      bFaz := False;
   end;
end;



procedure TfrmConsDisponibilidadeMT1.PgcSaldosChange(Sender: TObject);
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

         MontaParametros('qryAnalitica');

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
         //AL_2
         CdsDispAnalitica.First;
         MontaParametros('qryLoteAnalitica');
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



procedure TfrmConsDisponibilidadeMT1.FormCreate(Sender: TObject);
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

   //AL_13
   CtrlParamFinanc.CdsParamFinanc := CdsParamFinanc;
   edtIntervalo.Text := CdsParamFinanc.FieldByName('PERIODDISPONIB').AsString;

   AtualizaGrids;
end;



procedure TfrmConsDisponibilidadeMT1.FormDestroy(Sender: TObject);
begin
  inherited;
   CtrlParamFinanc.Free;
   CtrlDisponibxusu.Free;
   CtrlDispFinanc.Free;
end;



procedure TfrmConsDisponibilidadeMT1.eOnMessage(sMsg : string);
begin
  MsgDlg(sMsg,'Atenção',mtWarning,[mbOk],0);
end;



procedure TfrmConsDisponibilidadeMT1.edtDataRefExit(Sender: TObject);
begin
  inherited;
   begin
      CdsDispFinanc.Data   := CtrlDispFinanc.SelecionaDispFinanc(edtDataRef.Date );
      AtualizaGrids;
   end;
end;



procedure TfrmConsDisponibilidadeMT1.AtualizaGrids;
begin
   bConciliada := False;
   dbgSintetico.Visible := True;
   dbgAnalitico.Visible := True;
end;



procedure TfrmConsDisponibilidadeMT1.dbgAnaliticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmConsDisponibilidadeMT1.dbgDispAnaliticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmConsDisponibilidadeMT1.dbgDispSinteticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmConsDisponibilidadeMT1.dbgSinteticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmConsDisponibilidadeMT1.dbgAnaliticoTopRowChanged(
  Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT1.dbgDispAnaliticaTopRowChanged(Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT1.dbgDispSinteticaTopRowChanged(Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT1.dbgSinteticoTopRowChanged(Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT1.bbtnImprimirClick(Sender: TObject);
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
      CdsLoteAnalitica.DisableControls;

      if chkExpandido.Checked then
         ppSubReport1.ExpandAll := True
      else
         ppSubReport1.ExpandAll := False;

      pplCaptionDispAnalitica.Caption := 'Disponibilidade Analítica' +' : ' + sPlano +' / ' + sPatro;
      TfrmPreview.CreateModalPreview(Application,
                                     rptDispAnalitica,
                                     rptDispAnalitica.PrinterSetup.DocumentName);
      qryAnalitica.EnableControls;
      CdsDispAnalitica.EnableControls;
      CdsLoteAnalitica.EnableControls;
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



procedure TfrmConsDisponibilidadeMT1.rptDispAnaliticaStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   ppShape4.Brush.Color := clWhite;
   bFirst := True;
end;



procedure TfrmConsDisponibilidadeMT1.ppGroupFooterBand1BeforePrint(
  Sender: TObject);
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
procedure TfrmConsDisponibilidadeMT1.edtIntervaloExit(Sender: TObject);
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
         CdsParamFinanc.FieldByName('PERIODDISPONIB').AsString := iIntervalo;
         CdsParamFinanc.Post;
         if not(CtrlParamFinanc.AplicaAtualParamFinanc) then
            MsgDlg(CtrlParamFinanc.MessageInfo,'Erro',mtError,[mbOK],0);
      end;
   except
      MsgDlg(CtrlParamFinanc.MessageInfo,'Erro',mtError,[mbOK],0);
   end;
end;



procedure TfrmConsDisponibilidadeMT1.ppShape3Print(Sender: TObject);
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



procedure TfrmConsDisponibilidadeMT1.ppShape4Print(Sender: TObject);
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



function TfrmConsDisponibilidadeMT1.BuscaDiaRecolhCPMF(dDataRef:TDateTime):TDateTime;
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



function TfrmConsDisponibilidadeMT1.BuscaPrimeiroDiaIRRF(dDataRef:TDateTime):TDateTime;
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



function TfrmConsDisponibilidadeMT1.BuscaPrimeiDiaAposCPMF(dDataRef:TDateTime):TDateTime;
var dData : TDateTime;
begin
    dData := BuscaDiaRecolhCPMF(StrToDate(edtDataRef.Text));
    Result := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dData,True,True,False);
end;



procedure TfrmConsDisponibilidadeMT1.btnDebugClick(Sender: TObject);
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
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAINIMES'   , QuotedStr(DateToStr(dDataIniMes)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAINSS'     , QuotedStr(DateToStr(dDataINSS)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAINIIRRF'  , QuotedStr(DateToStr(dDataIniIRRF)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAFIMIRRF'  , QuotedStr(DateToStr(dDataFimIRRF)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':IDPATRO'      , IntToStr(CdsDispSinteticaIDPATRO.AsInteger));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':IDPLANOPREV'  , IntToStr(CdsDispSinteticaIDPLANO.AsInteger));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':IDPESSOA'     , IntToStr(Sistema.IdEmpresa));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':BSALDOANTINSS', IntToStr(iSaldoAntINSS));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':BSALDOANTIRRF', IntToStr(iSaldoAntIRRF));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':BQUARTA'      , IntToStr(iQuarta));

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



procedure TfrmConsDisponibilidadeMT1.cmbTiposChange(Sender: TObject);
begin
   inherited;
   with qryDebug do
   begin
      Close;
      SQL.Clear;
   end;
end;



function TfrmConsDisponibilidadeMT1.TrocaString(sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
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



procedure TfrmConsDisponibilidadeMT1.dbgDebugCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmConsDisponibilidadeMT1.dbgDebugTopRowChanged(
  Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   CdsLoteAnalitica.Close;
end;



procedure TfrmConsDisponibilidadeMT1.ppSubReport1Print(Sender: TObject);
begin
  inherited;
   if CdsDispAnalitica.FieldByName('NUMLOTE').AsInteger <> 0 then
      CdsLoteAnalitica.Filter := ' NUMLOTE = ' + CdsDispAnalitica.FieldByName('NUMLOTE').AsString
   else
      CdsLoteAnalitica.Filter := 'NUMLOTE = -1';
end;



procedure TfrmConsDisponibilidadeMT1.CdsDispAnaliticaAfterScroll(DataSet: TDataSet);
begin
  inherited;
   if CdsDispAnalitica.FieldByName('NUMLOTE').AsInteger <> 0 then
      CdsLoteAnalitica.Filter := ' NUMLOTE = ' + CdsDispAnalitica.FieldByName('NUMLOTE').AsString
   else
      CdsLoteAnalitica.Filter := 'NUMLOTE = -1';
end;



end.
