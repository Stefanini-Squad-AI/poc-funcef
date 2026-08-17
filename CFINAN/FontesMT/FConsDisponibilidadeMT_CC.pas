{
//******************************************************************************
N.WO............: WO28089
Data............: 27/11/2025
Responsável.....: Paulo Nobre
Descrição.......: Remover espaços em branco das condiçoes de STATUS e OPERACAO
                   .qrySintetica
                   .qryAnalitica
//******************************************************************************
N.WO............: B_MIGRACAO_ORACLE_2025
Data............: 13/10/2025
Responsável.....: LEANDRO POCEBON
Descrição.......: ajuste para o oracle na qryanalitica
//******************************************************************************
//WO11467 - Controle Financeiro - Transferência entre contas (Automático)
//Alterado por Arnaldo V. Scarin em 11/07/2024
//Descrição: Alteração da Transferencia entre Contas Correntes atráves da
//           disponibilidade Financeira.
//******************************************************************************
//Nº SIG: 132998
//Data da Alteração: 22/05/2023
//Responsável: André Imakawa
//Descrição: Transferencia do Saldo pela tela da Disponibilidade.
--------------------------------------------------------------------------------------------------
//Nº SIG.....: 77525 - TIBERO
//Data.......: 29/10/2018
//Responsável: Andre Imakawa
//Descrição..: Correção Relatorio
--------------------------------------------------------------------------------------------------
//Nº SIG: 77119 - TIBERO
//Data da Alteração: 19/10/2018
//Responsável: Everson Luiz Pereira da Cunha
//Descrição: Retirar o comando de alter session que existia na criação do form
--------------------------------------------------------------------------------------------------
//Nº SOL: 260640
//Nº KINTANA 1038942
//Data da Alteração: 25/08/2015
//Alteração Form: adição de código
//Responsável: William Moreira da Silva
//Descrição: Alteracao no SESSION para solução de problema com a perda de conexão
--------------------------------------------------------------------------------------------------
//Nº SOL: 224894.16671
//Nº KINTANA 570507
//Data da Alteração: 21/11/2014
//Alteração Form: adição de código
//Responsável: William Santana
//Descrição: StringReplace no parametro, pois existe um parametro em um dos campos no Select
--------------------------------------------------------------------------------------------------
//N. Sol..........: 236454
//N. Kintana......: 470439
//Data............: 05/08/2014
//Responsável.....: Thiago Melo
//Descrição.......: juste na qryAnalitica e qrySintetica para não agrupar
//                  rateios duplicados. * Alteração no .DFM
--------------------------------------------------------------------------------------------------
//N. Sol..........: 218051
//N. Kintana......: 2048724
//Data............: 10/10/2013
//Responsável.....: Marcio Sanches Spinosa
//Descrição.......: Ajuste na qryAnalitica tirando o null idpessoa e colocando
// 1 idpessoa.
--------------------------------------------------------------------------------------------------
Rotina......: *.dfm (alteração direta no componente qryAnalitica e qrySintetica)
Nº SOL......: 218051
Nº KINTANA..: 2048724 
Data........: 03/10/2013
Responsável.: Paulo Nobre / Everson
Descrição...: Incluir nas rotinas de Bloqueios e Desbloqueios dos rateios por plano/patro
--------------------------------------------------------------------------------------------------
Rotina......: *.dfm (alteração direta no componente qrySintetica)
Nº SOL......: 124845/15233
Nº KINTANA..: 2048036
Data........: 01/10/2013
Responsável.: Marcio Sanches Spinosa
Descrição...: Ajuste na qrySintetica conforme a tela da consulta nova
--------------------------------------------------------------------------------------------------
Rotina......: *.dfm (alteração direta no componente qryAnalitica e qrySintetica)
Nº SOL......: 31714/12842
Nº KINTANA..: 1873038
Data........: 29/11/2012
Responsável.: Edilaine Ferraresi
Descrição...: Alterada qryAnalitica e qrySintetica acrescetanto um UNION referente ao
              bloqueio judicial
--------------------------------------------------------------------------------------------------
Nº SOL......: 179184
Nº KINTANA..: 1648413
Data........: 08/05/2012
Responsável.: Vander Campos
Descrição...: Inclusão do código 740 nos SQLs que provem a Disponibilidade Financeira
--------------------------------------------------------------------------------------------------
Nº SOL......: 138463
Nº KINTANA..: 843717
Data........: 14/09/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação da Consulta da Disponibilidade Financeira por Conta Corrente
              (Semelhante a frmConsDisponibilidadeMT_Novo)
---------------------------------------------------------------------------------------------------}

unit FConsDisponibilidadeMT_CC;

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
  uCtrlHistPadrao, uCtrlTransfFundos,
  uCmControlObject, uCmDbObject, uDataBase,
     uCtrlFinanc, uCtrlListTercFinanc, uCtrlParamIntegra,
     uGeralFinanc, uCtrlPadroes, uDiasUteis,
     uCtrlImpostoRetido, uCtrlSegregacao, Math, Machklb, CheckLst, wwdblook,
  ppParameter, ppModule, raCodMod;


type
  TfrmConsDisponibilidadeMT_CC = class(TfrmSairAjuda)
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
    Panel2: TPanel;
    Splitter1: TSplitter;
    chklstPortador: TCheckListBox;
    lblContaBanco: TLabel;
    Bevel1: TBevel;
    Panel3: TPanel;
    bbtnSelTodosCC: TBitBtn;
    bbtnInverteSelCC: TBitBtn;
    cdsPortador: TCMClientDataSet;
    tbsTransferencia: TTabSheet;
    dbGridTransf: TwwDBGrid;
    pnlDadosTransf: TPanel;
    lblData: TLabel;
    lblHistPad: TLabel;
    lblUnidNegoc: TLabel;
    edDataLanc: TCMDateTimePicker;
    dblcHistPad: TwwDBLookupCombo;
    dblcUnidNegocOri: TwwDBLookupCombo;
    rgTipoDocTransf: TGroupBox;
    Label6: TLabel;
    lblTituloTipoDes: TLabel;
    dblcTipoRecTransf: TwwDBLookupCombo;
    dblcTipoDesTransf: TwwDBLookupCombo;
    cdsTipoRec: TCMClientDataSet;
    cdsTipoDes: TCMClientDataSet;
    cdsUnidNegocio: TCMClientDataSet;
    cdsHistorico: TCMClientDataSet;
    spRateios: TCMSqlParams;
    cdsRateios: TCMClientDataSet;
    dsRateios: TDataSource;
    btnTransferir: TBitBtn;
    qryTransf: TwwQuery;
    dsTransf: TDataSource;
    qryDeParaTransf: TwwQuery;
    updTransf: TUpdateSQL;
    qryTransfContaxPlano: TwwQuery;
    cdsContaOrigem: TCMClientDataSet;
    cdsContaDestino: TCMClientDataSet;
    dsContaOrigem: TwwDataSource;
    dsContaDestino: TwwDataSource;
    qryTransfMARCAR: TFloatField;
    qryTransfNOMEPLANOPATRO: TStringField;
    qryTransfVALOR: TFloatField;
    qryTransfCODPORTADORORIGEM: TFloatField;
    qryTransfNOMEORIGEM: TStringField;
    qryTransfCODPORTADORDESTINO: TFloatField;
    qryTransfNOMEDESTINO: TStringField;
    qryTransfMOVIMENTO: TStringField;
    qryTransfIDPLANOPREV: TFloatField;
    qryTransfHISTORICO: TStringField;
    cdsPatrocinador: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    edNumDoc: TEdit;
    lblDocumento: TLabel;
    qryAnaliticaRel: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField10: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    dspDispAnaliticaRel: TDataSetProvider;
    dsAnaliticaRel: TwwDataSource;
    CdsDispAnaliticaRel: TCMClientDataSet;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    pplAnaliticaRel: TppBDEPipeline;
    pplAnaliticaRelppField1: TppField;
    pplAnaliticaRelppField2: TppField;
    pplAnaliticaRelppField3: TppField;
    pplAnaliticaRelppField4: TppField;
    pplAnaliticaRelppField5: TppField;
    pplAnaliticaRelppField6: TppField;
    pplAnaliticaRelppField7: TppField;
    pplAnaliticaRelppField8: TppField;
    pplAnaliticaRelppField9: TppField;
    pplAnaliticaRelppField10: TppField;
    pplAnaliticaRelppField11: TppField;
    pplAnaliticaRelppField12: TppField;
    pplAnaliticaRelppField13: TppField;
    pplAnaliticaRelppField14: TppField;
    pplAnaliticaRelppField15: TppField;
    pplAnaliticaRelppField16: TppField;
    pplAnaliticaRelppField17: TppField;
    GRUPO1: TppField;
    SALDO_INICIAL_GRUPO: TppField;
    RECEBIMENTO_TOTAL_GRUPO: TppField;
    DESEMBOLSO_TOTAL_GRUPO: TppField;
    SALDO_FINAL_GRUPO: TppField;
    rptDispAnaliticaRel: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel17: TppLabel;
    LblEmpresaAnaliticaRel: TppLabel;
    lblDataAnaliticaRel: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText11: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppSystemVariable7: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel27: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppDBText19: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppParameterList1: TppParameterList;
    raCodeModule1: TraCodeModule;
    ppParameterList2: TppParameterList;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;


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
    procedure bbtnSelTodosCCClick(Sender: TObject);
    procedure bbtnInverteSelCCClick(Sender: TObject);
    procedure dblcTipoRecTransfChange(Sender: TObject);
    procedure btnTransferirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure qryTransfMARCARChange(Sender: TField);
    procedure BitBtn1Click(Sender: TObject);

  private { Private declarations }

    cCorZebra : TColor;
    bFaz: Boolean;
    fMaxValor, fMinValor: Double;
    iIntervalo: Integer;

    //WO11467 - Controle Financeiro - Transferência entre contas (Automático)
    //Alterado por Arnaldo V. Scarin em 11/07/2024
    //Alteração da Transferencia entre Contas Correntes atráves da disponibilidade Financeira.
    sCodigoPortadorOrigem : String;
    //WO11467 - FIM

    CtrlParamFinanc   : TCtrlParamFinanc;
    CtrlDisponibxusu  : TCtrlDisponibxusu;
    CtrlDisponFinanc  : TCtrlDisponFinanc;
    CtrlListTerceiros : TCtrlListTercFinanc; // Alterado por FHBS - SOL: 138463 KTN: 843717
    ListaPortador     : TStringList; // Alterado por FHBS - SOL: 138463 KTN: 843717
    sListaPortador    : String; // Alterado por FHBS - SOL: 138463 KTN: 843717
    sSQLSintetica     : String; // Alterado por FHBS - SOL: 138463 KTN: 843717
    sSQLAnalitica     : String; // Alterado por FHBS - SOL: 138463 KTN: 843717
    bZeraSaldoAnterior: Boolean; // Alterado por FHBS - SOL: 138463 KTN: 843717

    CtrlHistPadrao    : TCtrlHistPadrao;   // Andre Imakawa - SIG 132998
    CtrlTransfFundos  : TCtrlTransfFundos; // Andre Imakawa - SIG 132998   

    DadosTransf : TDadosTransf;            // Andre Imakawa - SIG 132998
    rTotalRateado     : Double;            // Andre Imakawa - SIG 132998

    procedure Atualiza;
    procedure AtualizaGrids;
    procedure MontaParametros(sQry:String);
    function BuscaDiaRecolhCPMF(dDataRef:TDateTime):TDateTime;
    function BuscaPrimeiDiaAposCPMF(dDataRef:TDateTime):TDateTime;
    function BuscaPrimeiroDiaIRRF(dDataRef:TDateTime):TDateTime;
    function TrocaString (sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
    procedure PreencheGridTransferencia(pTipo: boolean);
    procedure VerificaMovimentoGrid;
    function HabilitaGridTransferencia: Boolean;
    function TransfereSaldo: Boolean;
    procedure PreencheStatus(var pIdPlanoInicial, pIdPlanoFinal: integer; pMSG: String; pLimpa: integer = -1);
    Function ValidaTransferencia: Boolean;



  public  { Public declarations }

    bmPosicao: TBookmark;

  end;



var
  frmConsDisponibilidadeMT_CC : TfrmConsDisponibilidadeMT_CC;
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
  FPrincipal, JCLSysUtils;

procedure TfrmConsDisponibilidadeMT_CC.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;



procedure TfrmConsDisponibilidadeMT_CC.TimerTimer(Sender: TObject);
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

procedure TfrmConsDisponibilidadeMT_CC.FormShow(Sender: TObject);
begin
  inherited;
  //AL_13

  fMaxValor := 0;
  fMinValor := 0;
  PgcSaldos.ActivePage := tbsSintetica;
  bFaz := False;
  bFirstAtualiza := True;
  edtDataRef.Text := DateToStr(Now);

  edNumDoc.Text := (FormatDateTime('DD', Now)); // Andre Imakawa - SIG 132998

  cmbSitPlano.ItemIndex := 0; //Bruno Bastos - SOL: 108052 - Kintana: 497961
end;

procedure TfrmConsDisponibilidadeMT_CC.bbtnIniciarClick(Sender: TObject);
var
  Contador: Integer;
begin
  inherited;
  PreencheGridTransferencia(False); // Andre Imakawa - SIG 132998
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

        // Alterado por FHBS - SOL: 138463 KTN: 843717 - Atulizando as contas selecionadas
        sListaPortador := '0';
        bZeraSaldoAnterior := False;

        for Contador := 0 to chklstPortador.Items.Count-1 do
          if chklstPortador.Checked[Contador] then
            sListaPortador := sListaPortador + ',' + ListaPortador.Strings[Contador]
          else
            bZeraSaldoAnterior := True;
        // Fim - Alterado por FHBS

        bFaz := True;
        TimerTimer(Sender);
        Atualiza;
     end;
  end;
  tbsTransferencia.TabVisible := HabilitaGridTransferencia; // Andre Imakawa - SIG 132998
  PreencheGridTransferencia(tbsTransferencia.TabVisible);   // Andre Imakawa - SIG 132998
end;

procedure TfrmConsDisponibilidadeMT_CC.MontaParametros(sQry:String);
var
   iAno, iMes, iDia : word;
   sAtivPlano       : String; //Bruno Bastos - SOL: 108052 - Kintana: 497961

begin
   dDataRef := StrToDate(edtDataRef.Text);

   DecodeDate(StrToDate(edtDataRef.Text), iAno, iMes, iDia);

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
      0: sAtivPlano := 'S';
      1: sAtivPlano := 'N';
   End;
   //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Fim

   if sQry = 'qrySintetica' then
   begin
      qrySintetica.Close;
      qrySintetica.DisableControls;

      // Alterado por FHBS - SOL: 138463 KTN: 843717
      qrySintetica.SQL.Text := sSQLSintetica;
      qrySintetica.SQL.Text := StringReplace(qrySintetica.SQL.Text, ':CODPORTADOR', sListaPortador, [rfReplaceAll, rfIgnoreCase]);
      // Fim - Alterado por FHBS   
      
      //Início - William Santana - SOL 224894.16671 PPM 570507
      // Replace no parametro, pois existe um parametro em um dos campos no Select
      qrySintetica.SQL.text := StringReplace(qrySintetica.sql.text,':IDPESSOA', intTostr(Sistema.IdEmpresa),[rfReplaceAll,rfIgnoreCase]);
      //Término  William Santana - SOL 224894.16671 PPM 570507

      qrySintetica.Prepare;

      qrySintetica.ParamByName('IDPATRO').Clear;
      qrySintetica.ParamByName('IDPLANOPREV').Clear;
      qrySintetica.ParamByName('DATAREF').AsString        := DateToStr(dDataRef);
      qrySintetica.ParamByName('DATAANT').AsString        := DateToStr(dDataAnt);
     // qrySintetica.ParamByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;  //William Santana - SOL 224894.16671 PPM 570507
      qrySintetica.ParamByName('DATASALDOANT').AsString   := DateToStr(CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime);

      //AL_15

      qrySintetica.ParamByName('DATAINIMESANT').AsString  := DateToStr(dDataIniMesAnt);
      qrySintetica.ParamByName('DATAFIMMESANT').AsString  := DateToStr(dDataFimMesAnt);
      qrySintetica.ParamByName('DATAINSS').AsString       := DateToStr(dDataINSS);
      qrySintetica.ParamByName('BSALDOANTINSS').AsInteger := iSaldoAntINSS;
      qrySintetica.ParamByName('DATAINIIRRF').AsString    := DateToStr(dDataIniIRRF);
      qrySintetica.ParamByName('DATAFIMIRRF').AsString    := DateToStr(dDataFimIRRF);
      qrySintetica.ParamByName('BSALDOANTIRRF').AsInteger := iSaldoAntIRRF;

      //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Início
      if cmbSitPlano.ItemIndex = 2 then
        qrySintetica.ParamByName('PSATIVO').Clear
      else
        qrySintetica.ParamByName('PSATIVO').AsString      := sAtivPlano;
      //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Fim
   end
   else if sQry = 'qryAnalitica' then
   begin
      qryAnalitica.Close;
      qryAnalitica.DisableControls;

      // Alterado por FHBS - SOL: 138463 KTN: 843717
      qryAnalitica.SQL.Text := sSQLAnalitica;
      qryAnalitica.SQL.Text := StringReplace(qryAnalitica.SQL.Text, ':CODPORTADOR', sListaPortador, [rfReplaceAll, rfIgnoreCase]);
      // Fim - Alterado por FHBS
      
      //Início - William Santana - SOL 224894.16671 PPM 570507
      // Replace no parametro, pois existe um parametro em um dos campos no Select
      qryAnalitica.SQL.text := StringReplace(qryAnalitica.sql.text,':IDPESSOA', intTostr(Sistema.IdEmpresa),[rfReplaceAll,rfIgnoreCase]);
      //Término  William Santana - SOL 224894.16671 PPM 570507

      qryAnalitica.Prepare;

      qryAnalitica.ParamByName('IDPATRO').AsInteger       := CdsDispSinteticaIDPATRO.AsInteger;
      qryAnalitica.ParamByName('IDPLANOPREV').AsInteger   := CdsDispSinteticaIDPLANO.AsInteger;
      qryAnalitica.ParamByName('DATAREF').AsString        := DateToStr(dDataRef);
      qryAnalitica.ParamByName('DATAANT').AsString        := DateToStr(dDataAnt);
     // qryAnalitica.ParamByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;  //William Santana - SOL 224894.16671 PPM 570507
      qryAnalitica.ParamByName('DATASALDOANT').AsString   := DateToStr(CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime);//'11/01/2004';

      //AL_15

      qryAnalitica.ParamByName('DATAINIMESANT').AsString  := DateToStr(dDataIniMesAnt);
      qryAnalitica.ParamByName('DATAFIMMESANT').AsString  := DateToStr(dDataFimMesAnt);
      qryAnalitica.ParamByName('DATAINSS').AsString       := DateToStr(dDataINSS);
      qryAnalitica.ParamByName('BSALDOANTINSS').AsInteger := iSaldoAntINSS;
      qryAnalitica.ParamByName('DATAINIIRRF').AsString    := DateToStr(dDataIniIRRF);
      qryAnalitica.ParamByName('DATAFIMIRRF').AsString    := DateToStr(dDataFimIRRF);
      qryAnalitica.ParamByName('BSALDOANTIRRF').AsInteger := iSaldoAntIRRF;

      //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Início
      if cmbSitPlano.ItemIndex = 2 then
        qryAnalitica.ParamByName('PSATIVO').Clear
      else
        qryAnalitica.ParamByName('PSATIVO').AsString      := sAtivPlano;
      //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Fim
   end
   else if sQry = 'qryDebug' then
   begin
      qryDebug.DatabaseName := qryAnalitica.DatabaseName;
      qryDebug.Close;

      // Alterado por FHBS - SOL: 138463 KTN: 843717
      qryDebug.SQL.Text := StringReplace(qryDebug.SQL.Text, ':CODPORTADOR', sListaPortador, [rfReplaceAll, rfIgnoreCase]);
      // Fim - Alterado por FHBS

      //Início - William Santana - SOL 224894.16671 PPM 570507
      // Replace no parametro, pois existe um parametro em um dos campos no Select
      qryDebug.SQL.text := StringReplace(qryDebug.sql.text,':IDPESSOA', intTostr(Sistema.IdEmpresa),[rfReplaceAll,rfIgnoreCase]);
      //Término  William Santana - SOL 224894.16671 PPM 570507

      qryDebug.Prepare;
      
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
      //Início - William Santana - SOL 224894.16671 PPM 570507
     // if qryDebug.Params.FindParam('IDPESSOA') <> nil then
      //   qryDebug.Params.FindParam('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
      //Término - William Santana - SOL 224894.16671 PPM 570507
      //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Início
      if qryDebug.Params.FindParam('PSATIVO') <> nil then
      begin
         if cmbSitPlano.ItemIndex = 2 then
            qryDebug.Params.FindParam('PSATIVO').Clear
         else
            qryDebug.Params.FindParam('PSATIVO').AsString := sAtivPlano;
      end;
     //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Fim

   end // Andre Imakawa - SIG 132998 - Inicio
   else if sQry = 'qryAnaliticaRel' then
   begin
      qryAnaliticaRel.Close;
      qryAnaliticaRel.DisableControls;

      qryAnaliticaRel.SQL.Text := StringReplace(qryAnaliticaRel.SQL.Text, ':CODPORTADOR', sListaPortador, [rfReplaceAll, rfIgnoreCase]);

      // Replace no parametro, pois existe um parametro em um dos campos no Select
      qryAnaliticaRel.SQL.text := StringReplace(qryAnaliticaRel.sql.text,':IDPESSOA', intTostr(Sistema.IdEmpresa),[rfReplaceAll,rfIgnoreCase]);


      qryAnaliticaRel.Prepare;
      qryAnaliticaRel.ParamByName('IDPATRO').Clear;
      qryAnaliticaRel.ParamByName('IDPLANOPREV').Clear;
      qryAnaliticaRel.ParamByName('DATAREF').AsString        := DateToStr(dDataRef);
      qryAnaliticaRel.ParamByName('DATAANT').AsString        := DateToStr(dDataAnt);
      qryAnaliticaRel.ParamByName('DATASALDOANT').AsString   := DateToStr(CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime);

      //AL_15

      qryAnaliticaRel.ParamByName('DATAINIMESANT').AsString  := DateToStr(dDataIniMesAnt);
      qryAnaliticaRel.ParamByName('DATAFIMMESANT').AsString  := DateToStr(dDataFimMesAnt);
      qryAnaliticaRel.ParamByName('DATAINSS').AsString       := DateToStr(dDataINSS);
      qryAnaliticaRel.ParamByName('BSALDOANTINSS').AsInteger := iSaldoAntINSS;
      qryAnaliticaRel.ParamByName('DATAINIIRRF').AsString    := DateToStr(dDataIniIRRF);
      qryAnaliticaRel.ParamByName('DATAFIMIRRF').AsString    := DateToStr(dDataFimIRRF);
      qryAnaliticaRel.ParamByName('BSALDOANTIRRF').AsInteger := iSaldoAntIRRF;

      if cmbSitPlano.ItemIndex = 2 then
        qryAnaliticaRel.ParamByName('PSATIVO').Clear
      else
        qryAnaliticaRel.ParamByName('PSATIVO').AsString      := sAtivPlano;
  
      // Andre Imakawa - SIG 132998 - Fim
   end;

end;
// Andre Imakawa - SIG 132998 - Inicio
procedure TfrmConsDisponibilidadeMT_CC.PreencheGridTransferencia(pTipo: boolean);
var
  i: Integer;
begin
  if pTipo then
  begin
    if not CdsDispSintetica.IsEmpty then
    begin
      CdsDispSintetica.first;
      For i := 1 to CdsDispSintetica.RecordCount -1 do
      begin
    
        if CdsDispSinteticaSALDODIA.AsFloat = 0 then
        begin
          CdsDispSintetica.Next;
          continue;
        end;                   
        qryTransf.DisableControls;
        qryTransf.Insert;
        qryTransf.FieldByName('NOMEPLANOPATRO').asString := CdsDispSinteticaNOMEPLANOPATRO.AsString;
        qryTransf.FieldByName('VALOR').AsFloat :=  CdsDispSinteticaSALDODIA.AsFloat;
        qryTransf.FieldByName('IDPLANOPREV').AsInteger := CdsDispSinteticaIDPLANO.AsInteger;
        qryTransf.FieldByName('IDPATRO').AsInteger := CdsDispSinteticaIDPATRO.AsInteger;
        qryTransf.FieldByName('MARCAR').AsInteger := 1;

        if not(qryTransfContaxPlano.Locate('CODPORTADOR_ORIGEM;IDPLANOPREVCONTABIL',
                                           varArrayOf([sCodigoPortadorOrigem, qryTransf.FieldByName('IDPLANOPREV').AsString]), [])) then
        begin
          MsgDlg('Falta parametrização no De/Para de contas para transferência.' + #13#13 +
                  'Favor entrar em contato com a GETEC.','Erro',mtError,[mbOK],0);
          Exit;
        end;

        qryTransf.FieldByName('CODPORTADORAUX').AsInteger := qryTransfContaxPlano.FieldByName('CODPORTADOR_DESTINO').AsInteger;

        {
        if CdsDispSinteticaSALDODIA.AsFloat > 0 then
        begin
          qryTransf.FieldByName('MOVIMENTO').asString := 'Depósito';
          qryTransf.FieldByName('CODPORTADORORIGEM').AsInteger := qryTransfContaxPlano.FieldByName('CODPORTADOR_ORIGEM').AsInteger;
          qryTransf.FieldByName('NOMEORIGEM').AsString := qryTransfContaxPlano.FieldByName('NOME_CODPORTADOR_ORIGEM').AsString;
          qryTransf.FieldByName('CODPORTADORDESTINO').AsInteger := qryTransfContaxPlano.FieldByName('CODPORTADOR_DESTINO').AsInteger;
          qryTransf.FieldByName('NOMEDESTINO').AsString := qryTransfContaxPlano.FieldByName('NOME_CODPORTADOR_DESTINO').AsString;

        end
        else
        begin
          qryTransf.FieldByName('MOVIMENTO').asString := 'Retirada';
          qryTransf.FieldByName('CODPORTADORORIGEM').AsInteger := qryTransfContaxPlano.FieldByName('CODPORTADOR_DESTINO').AsInteger;
          qryTransf.FieldByName('NOMEORIGEM').AsString := qryTransfContaxPlano.FieldByName('NOME_CODPORTADOR_DESTINO').AsString;
          qryTransf.FieldByName('CODPORTADORDESTINO').AsInteger := qryTransfContaxPlano.FieldByName('CODPORTADOR_ORIGEM').AsInteger;
          qryTransf.FieldByName('NOMEDESTINO').AsString := qryTransfContaxPlano.FieldByName('NOME_CODPORTADOR_ORIGEM').AsString;

        end;


        qryTransf.FieldByName('HISTORICO').AsString := 'Transf. '+Copy(Trim(qryTransf.FieldByName('NOMEORIGEM').AsString),1,23)+' para '+
                                                        Copy(Trim(qryTransf.FieldByName('NOMEDESTINO').AsString),1,23);

        }

        qryTransf.Post;
        qryTransf.EnableControls;
        CdsDispSintetica.Next;

      end;

      VerificaMovimentoGrid;

    end;
  end
  else
  begin
    qryTransf.DisableControls;
    qryTransf.first;
    while not qryTransf.Eof do
      qryTransf.delete;

    qryTransf.EnableControls;
  end;

end;

procedure TfrmConsDisponibilidadeMT_CC.VerificaMovimentoGrid;
var
  i, j, iCodPortadorAnterior: Integer;
  //MatrizMulti: array [0..3] of array [0..1] of double;
  CodPortadorArray : Array[0..5] of integer;
  VlPortadorArray : Array[0..5] of double;

begin
  try
    if not qryTransf.IsEmpty then
    begin
      iCodPortadorAnterior := 0;
      i := 0;
      qryTransf.DisableControls;
      qryTransf.first;
      while not qryTransf.Eof do
      begin

        if not(qryTransfContaxPlano.Locate('CODPORTADOR_ORIGEM;IDPLANOPREVCONTABIL',
                                           varArrayOf([sCodigoPortadorOrigem, qryTransf.FieldByName('IDPLANOPREV').AsString]), [])) then
        begin
          MsgDlg('Falta parametrização no De/Para de contas para transferência.' + #13#13 +
                  'Favor entrar em contato com a GETEC.','Erro',mtError,[mbOK],0);
          Exit;
        end
        else
        begin
          if (iCodPortadorAnterior = 0) or (iCodPortadorAnterior <> qryTransfContaxPlano.FieldByName('CODPORTADOR_DESTINO').AsInteger) then
          begin
            if iCodPortadorAnterior <> 0 then
              i := i + 1;
            CodPortadorArray[i] := qryTransfContaxPlano.FieldByName('CODPORTADOR_DESTINO').AsInteger;
            if qryTransf.FieldByName('MARCAR').AsInteger = 1 then
              VlPortadorArray[i] := VlPortadorArray[i] + qryTransf.FieldByName('VALOR').AsFloat;
              
            iCodPortadorAnterior := qryTransfContaxPlano.FieldByName('CODPORTADOR_DESTINO').AsInteger;
          end
          else
          begin
            if qryTransf.FieldByName('MARCAR').AsInteger = 1 then
              VlPortadorArray[i] := VlPortadorArray[i] + qryTransf.FieldByName('VALOR').AsFloat;
          end;
        end;

        qryTransf.Next;
      end;


      qryTransf.first;
      while not qryTransf.Eof do
      begin
        for j := 0 to i do
        begin
          if CodPortadorArray[j] = qryTransf.FieldByName('CODPORTADORAUX').AsInteger then
          begin
            qryTransf.Edit;
            if qryTransf.FieldByName('MARCAR').AsInteger = 1 then
            begin
              qryTransfContaxPlano.Locate('CODPORTADOR_ORIGEM;IDPLANOPREVCONTABIL',
                                          varArrayOf([sCodigoPortadorOrigem,qryTransf.FieldByName('IDPLANOPREV').AsString]), []);

              if VlPortadorArray[j] > 0 then
              begin
                qryTransf.FieldByName('MOVIMENTO').asString := 'Ingresso';
                qryTransf.FieldByName('CODPORTADORORIGEM').AsInteger := qryTransfContaxPlano.FieldByName('CODPORTADOR_ORIGEM').AsInteger;
                qryTransf.FieldByName('NOMEORIGEM').AsString := qryTransfContaxPlano.FieldByName('NOME_CODPORTADOR_ORIGEM').AsString;
                qryTransf.FieldByName('CODPORTADORDESTINO').AsInteger := qryTransfContaxPlano.FieldByName('CODPORTADOR_DESTINO').AsInteger;
                qryTransf.FieldByName('NOMEDESTINO').AsString := qryTransfContaxPlano.FieldByName('NOME_CODPORTADOR_DESTINO').AsString;

              end
              else
              begin
                qryTransf.FieldByName('MOVIMENTO').asString := 'Retirada';
                qryTransf.FieldByName('CODPORTADORORIGEM').AsInteger := qryTransfContaxPlano.FieldByName('CODPORTADOR_DESTINO').AsInteger;
                qryTransf.FieldByName('NOMEORIGEM').AsString := qryTransfContaxPlano.FieldByName('NOME_CODPORTADOR_DESTINO').AsString;
                qryTransf.FieldByName('CODPORTADORDESTINO').AsInteger := qryTransfContaxPlano.FieldByName('CODPORTADOR_ORIGEM').AsInteger;
                qryTransf.FieldByName('NOMEDESTINO').AsString := qryTransfContaxPlano.FieldByName('NOME_CODPORTADOR_ORIGEM').AsString;

              end;

              qryTransf.FieldByName('VALORGERAL').AsFloat := VlPortadorArray[j];
              qryTransf.FieldByName('HISTORICO').AsString := 'Transf. '+Copy(Trim(qryTransf.FieldByName('NOMEORIGEM').AsString),1,23)+' para '+
                                                              Copy(Trim(qryTransf.FieldByName('NOMEDESTINO').AsString),1,23);

            end
            else
            begin

              qryTransf.FieldByName('MOVIMENTO').asString := '';
              qryTransf.FieldByName('CODPORTADORORIGEM').AsInteger := 0;
              qryTransf.FieldByName('NOMEORIGEM').AsString := '';
              qryTransf.FieldByName('CODPORTADORDESTINO').AsInteger := 0;
              qryTransf.FieldByName('NOMEDESTINO').AsString := '';
              qryTransf.FieldByName('VALORGERAL').AsFloat := 0;
              qryTransf.FieldByName('HISTORICO').AsString := '';

            end;
            qryTransf.Post;

            Break;
          end;
        end;
        qryTransf.next;

      end;

      qryTransf.EnableControls;
    end;
  finally
    //FreeAndNil(CodPortadorArray);
    //FreeAndNil(VlPortadorArray);
  end;
end;

Function TfrmConsDisponibilidadeMT_CC.ValidaTransferencia:Boolean;
var
  i: Integer;
begin
  Result := True;

  i:=0;

  qryTransf.DisableControls;
  qryTransf.first;
  while not qryTransf.Eof do
  begin
    if qryTransf.FieldByName('MARCAR').AsInteger = 1 then
    begin
      i:= 1;
      Break;
    end;
    qryTransf.Next;
  end;
  qryTransf.EnableControls;

  if i = 0 then
  begin
    MsgDlg('Obrigatório selecionar ao menos uma conta para transferência.','Erro',mtError,[mbOk],0);
    Result := False;
    Exit;
  end;

  if Trim(dblcTipoRecTransf.Text)='' then
  begin
    MsgDlg('Obrigatório preencher o Tipo de Documento para Transferência de Recebimento','Erro',mtError,[mbOk],0);
    edDataLanc.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(dblcTipoDesTransf.Text)='' then
  begin
    MsgDlg('Obrigatório preencher o Tipo de Documento para Transferência de Pagamento','Erro',mtError,[mbOk],0);
    edDataLanc.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edDataLanc.Text)='' then
  begin
    MsgDlg('Obrigatório preencher a Data de Lançamento','Erro',mtError,[mbOk],0);
    edDataLanc.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(dblcUnidNegocOri.Text)='' then
  begin
    MsgDlg('Obrigatório preencher a Atividade/Projeto','Erro',mtError,[mbOk],0);
    dblcUnidNegocOri.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(dblcHistPad.Text)='' then
  begin
    MsgDlg('Obrigatório preencher o Histórico Padrão','Erro',mtError,[mbOk],0);
    dblcHistPad.SetFocus;
    Result := False;
    Exit;
  end;

  
end;

Procedure TfrmConsDisponibilidadeMT_CC.PreencheStatus(var pIdPlanoInicial, pIdPlanoFinal: integer; pMSG: String; pLimpa: integer = -1);
var
  i: Integer;
begin
  if pLimpa = -1 then
  begin
    i := 0 ;
    While qryTransf.RecordCount > 0  do
    begin

      if (i = 0) and (qryTransf.FieldByName('IDPLANOPREV').AsInteger <> pIdPlanoInicial) then
        qryTransf.Locate('IDPLANOPREV', IntToStr(pIdPlanoInicial), []);

      if qryTransf.FieldByName('MARCAR').AsInteger = 1 then
      begin
        qryTransf.Edit;
        qryTransf.FieldByName('STATUS').AsString := pMSG;
        qryTransf.Post;
      end;
      if qryTransf.FieldByName('IDPLANOPREV').AsInteger = pIdPlanoFinal then
      begin
        qryTransf.Next;
        Break;
      end;
      i:= 1;
      qryTransf.Next;
    end;

    pIdPlanoInicial := 0;
    pIdPlanoFinal := 0;
  end
  else
  begin
    if not qryTransf.IsEmpty then
    begin
      qryTransf.DisableControls;
      qryTransf.first;
      while not qryTransf.Eof do
      begin
        qryTransf.Edit;
        qryTransf.FieldByName('STATUS').AsString := '';
        qryTransf.Post;
        qryTransf.Next;
      end;
      qryTransf.EnableControls;
    end;
  end;

end;

Function TfrmConsDisponibilidadeMT_CC.TransfereSaldo:Boolean;
  function GeraTransferencia(var pPortadorAnterior, pIdPlanoPrevInicial, pIdPlanoPrevFinal: integer ):boolean;
  var
    sMSG: string;
    bTransfere: Boolean;
  begin
    Result := True;
    bTransfere := ((pPortadorAnterior <> 0) and
                   (pPortadorAnterior <> qryTransf.FieldByName('CODPORTADORAUX').AsInteger) and
                    not(cdsRateios.IsEmpty));

    if bTransfere then
      qryTransf.Locate('IDPLANOPREV', IntToStr(pIdPlanoPrevInicial), []);
    // Atualiza Valor de Rateio, antes de chamar o cdsRateiosAfterScroll
    cdsContaOrigem.Locate('CODPORTADOR', qryTransf.FieldByName('CODPORTADORORIGEM').AsString , []);
    cdsContaDestino.Locate('CODPORTADOR', qryTransf.FieldByName('CODPORTADORDESTINO').AsString , []);
    cdsPatrocinador.Locate('IDPESSOA', qryTransf.FieldByName('IDPATRO').AsString , []);
    cdsPlanoPrev.Locate('IDPLANOPREV', qryTransf.FieldByName('IDPLANOPREV').AsString , []);

    if ParamIntegra.IntegraContab then
    begin
      if (Trim(cdsContaOrigem.FieldByName('PLACONTA').AsString)='') or
         (Trim(cdsContaDestino.FieldByName('PLACONTA').AsString)='') then
      begin
        MsgDlg('Como a contabilidade está integrada é obrigatório preencher a conta contábil das contas bancárias/caixas: ' + #13 +
               cdsContaOrigem.FieldByName('DESCRICAO').AsString + #13 +
               cdsContaDestino.FieldByName('DESCRICAO').AsString ,'Erro',mtError,[mbOk],0);
        Result := False;
        Exit;
      end;
    end;


    if bTransfere then
    begin
      //Carrega dados da Transferência
      DadosTransf.sPlaContaOrig       := cdsContaOrigem.FieldByName('PLACONTA').AsString;
      DadosTransf.rPlanoOrig          := cdsContaOrigem.FieldByName('PLANO').AsFloat;
      DadosTransf.rCodSubContaOrig    := cdsContaOrigem.FieldByName('CODSUBCONTA').AsFloat;
      DadosTransf.sCodCentroCustoOrig := cdsContaOrigem.FieldByName('CODCENTROCUSTO').AsString;
      DadosTransf.rUnidNegOrig        := StrToFloat(dblcUnidNegocOri.LookupValue);
      DadosTransf.rCodPortadorOrig    := cdsContaOrigem.FieldByName('CODPORTADOR').AsFloat;
      DadosTransf.rMoeCodigoOrig      := cdsContaOrigem.FieldByName('MOECODIGO').AsFloat;

      DadosTransf.sPlaContaDest       := cdsContaDestino.FieldByName('PLACONTA').AsString;
      DadosTransf.rPlanoDest          := cdsContaDestino.FieldByName('PLANO').AsFloat;
      DadosTransf.rCodSubContaDest    := cdsContaDestino.FieldByName('CODSUBCONTA').AsFloat;
      DadosTransf.sCodCentroCustoDest := cdsContaDestino.FieldByName('CODCENTROCUSTO').AsString;

      DadosTransf.iBancoDest          := cdscontaDestino.FieldByName('IDBANCO').AsInteger;

      DadosTransf.rUnidNegDest        := StrToFloat(dblcUnidNegocOri.LookupValue);

      DadosTransf.rCodPortadorDest    := cdsContaDestino.FieldByName('CODPORTADOR').AsFloat;
      DadosTransf.rMoeCodigoDest      := cdsContaDestino.FieldByName('MOECODIGO').AsFloat;
      DadosTransf.rValor              := Abs(qryTransf.FieldByName('VALORGERAL').AsFloat);
      DadosTransf.sNumDoc             := edNumDoc.Text;
      DadosTransf.rHistPadrao         := StrToFloat(dblcHistPad.LookupValue);
      DadosTransf.sHistorico          := qryTransf.FieldByName('HISTORICO').AsString;
      DadosTransf.sCodTipRec          := dblcTipoRecTransf.LookupValue;
      DadosTransf.sCodTipDes          := dblcTipoDesTransf.LookupValue;
      DadosTransf.dDataLanc           := edDataLanc.Date;

      DadosTransf.iFlgContaInvestOrig := cdsContaOrigem.FieldByName('FLGCONTAINVEST').AsInteger;
      DadosTransf.iFlgContaInvestDest := cdsContaDestino.FieldByName('FLGCONTAINVEST').AsInteger;
      DadosTransf.iEmpresa            := Sistema.IdEmpresa;
      DadosTransf.iBanco              := cdsContaOrigem.FieldByName('IDBANCO').AsInteger;

      if not(CtrlTransfFundos.TransfereFundos(DadosTransf,cdsRateios.Data)) then
      begin
        qryTransf.edit;
        sMSG := 'Falha na transferência.';
        qryTransf.post;
        Result := False;
        Exit;
      end
      else
      begin
         qryTransf.edit;
         sMSG := 'Transferência realizada.';
         qryTransf.post;
         cdsRateios.EmptyDataSet;
      end;

      PreencheStatus(pIdPlanoPrevInicial,pIdPlanoPrevFinal, sMSG);

    end;
  end;
var
  iPortadorAnterior, iIdPlanoPrevInicial, iIdPlanoPrevFinal: Integer;


begin
  Try
    Try
      Result := False;
      
      iIdPlanoPrevInicial := 0;
      iPortadorAnterior := 0;
      cdsRateios.EmptyDataSet;
      qryTransf.DisableControls;
      qryTransf.first;

      while not qryTransf.Eof do
      begin

        if not(GeraTransferencia(iPortadorAnterior, iIdPlanoPrevInicial,iIdPlanoPrevFinal )) then
        begin
          Result := False;
          Exit;
        end;


        if (qryTransf.FieldByName('MARCAR').AsInteger = 1) then
        begin

          if iIdPlanoPrevInicial = 0 then
            iIdPlanoPrevInicial := qryTransf.FieldByName('IDPLANOPREV').AsInteger;

          iIdPlanoPrevFinal := qryTransf.FieldByName('IDPLANOPREV').AsInteger;

          cdsRateios.Append;
          cdsRateios.FieldByName('IDPATROORIG').AsFloat        := qryTransf.FieldByName('IDPATRO').AsInteger;
          cdsRateios.FieldByName('IDPLANOPREVORIG').AsFloat    := qryTransf.FieldByName('IDPLANOPREV').AsInteger;
          cdsRateios.FieldByName('DescPATROORIG').AsString     := Trim(cdsPatrocinador.FieldByName('RAZAOSOCIAL').AsString);
          cdsRateios.FieldByName('DescPLANOPREVORIG').AsString := Trim(cdsPlanoPrev.FieldByName('NOME').AsString);

          cdsRateios.FieldByName('IDPATRODEST').AsFloat        := qryTransf.FieldByName('IDPATRO').Asinteger;
          cdsRateios.FieldByName('IDPLANOPREVDEST').AsFloat    := qryTransf.FieldByName('IDPLANOPREV').AsInteger;
          cdsRateios.FieldByName('DescPATRODEST').AsString     := Trim(cdsPatrocinador.FieldByName('RAZAOSOCIAL').AsString);
          cdsRateios.FieldByName('DescPLANOPREVDEST').AsString := Trim(cdsPlanoPrev.FieldByName('NOME').AsString);

          cdsRateios.FieldByName('IDPATRO').AsFloat            := qryTransf.FieldByName('IDPATRO').Asinteger;
          cdsRateios.FieldByName('IDPLANOPREV').AsFloat        := qryTransf.FieldByName('IDPLANOPREV').AsInteger;

          if qryTransf.FieldByName('VALORGERAL').AsFloat > 0 then
            cdsRateios.FieldByName('VALOR').AsFloat              := qryTransf.FieldByName('VALOR').AsFloat
          else
            cdsRateios.FieldByName('VALOR').AsFloat              := (qryTransf.FieldByName('VALOR').AsFloat) * -1;

          cdsRateios.FieldByName('PLANO').asInteger            := paramIntegra.Plano;
          cdsRateios.FieldByName('CODCENTROCUSTO').asString    := cdsContaOrigem.FieldByName('CODCENTROCUSTO').AsString;
          cdsRateios.Post;
        end;

        iPortadorAnterior := qryTransf.FieldByName('CODPORTADORAUX').AsInteger;


        qryTransf.next;
      end;
      iPortadorAnterior := -1;
      if cdsRateios.RecordCount>0 then
        if not(GeraTransferencia(iPortadorAnterior, iIdPlanoPrevInicial,iIdPlanoPrevFinal )) then
        begin
          Result := False;
          Exit;
        end;

      Result := True;
      qryTransf.EnableControls;

    except
      MsgDlg('Falha ao transferir saldo.' ,'Erro',mtError,[mbOk],0);
      Result := False;
    end;
  finally

  end;
end;

function TfrmConsDisponibilidadeMT_CC.HabilitaGridTransferencia: Boolean;
var
  i, Contador: Integer;
begin
  Result := False;
  Contador := 0;
  for i := 0 to chklstPortador.Items.Count-1 do
    if chklstPortador.Checked[i] then
    begin
      if Contador > 0 then
      begin
        Result := False;
        Exit;
      end
      else
      begin
        if (qryTransfContaxPlano.recordcount > 0 ) then
          if (qryTransfContaxPlano.Locate('CODPORTADOR_ORIGEM', ListaPortador.Strings[i], [])) then
          begin
            //WO11467 - Controle Financeiro - Transferência entre contas (Automático)
            //Alterado por Arnaldo V. Scarin em 11/07/2024
            //Alteração da Transferencia entre Contas Correntes atráves da disponibilidade Financeira.
            sCodigoPortadorOrigem := ListaPortador.Strings[i];
            //WO11467 - FIM
            Result := True;
          end;
      end;
      Contador := Contador + 1;
    end;                      
end;
// Andre Imakawa - SIG 132998 - Fim

procedure TfrmConsDisponibilidadeMT_CC.Atualiza;
begin
   // Desabilita o Timer para não contar o tempo de abertura das queries no intervalo
   if (bFaz) then
   begin
      // Desabilita o Timer para não contar o tempo de abertura das queries no intervalo
       Timer.Enabled := False;
       // Aciona a animação
       Animate.Visible := True;
       Animate.Active := True;
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
          // Alterado por FHBS - SOL: 138463 KTN: 843717
          if bZeraSaldoAnterior then
          begin
            CdsDispSintetica.Edit;
            CdsDispSinteticaSALDOANT.AsFloat := 0;
            CdsDispSinteticaSALDODIA.AsFloat := CdsDispSinteticaRECEBIMENTOS.AsFloat + CdsDispSinteticaDESEMBOLSOS.AsFloat;
            CdsDispSintetica.Post;
          end;
          // Fim - Alterado por FHBS

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
       Timer.Enabled := True;
       if bFirstAtualiza then
          bFirstAtualiza := False;
       bFaz := False;
   end;
end;



procedure TfrmConsDisponibilidadeMT_CC.PgcSaldosChange(Sender: TObject);
begin
   inherited;
   bmPosicao := CdsDispSintetica.GetBookmark;
   cmbTipos.Text := '';
   if PgcSaldos.ActivePage = tbsAnalitica then
   begin
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



procedure TfrmConsDisponibilidadeMT_CC.FormCreate(Sender: TObject);
var
  cdsAux : TCMClientDataSet;
  TipoRecTransf, TipoDesTransf : String;
begin
  inherited;
  //William Moreira da Silva - SOL 260640 PPM  1038942
  //dtmBaseDados.dbBaseDados.Execute(' alter session set optimizer_features_enable=''9.2.0'' ');  //Everson Luiz - SIG TIBERO
  //William Moreira da Silva - SOL 260640 PPM  1038942

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

  // Alterado por FHBS - SOL: 138463 KTN: 843717
  CtrlListTerceiros := TCtrlListTercFinanc.Create;
  CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados, True);
  cdsPortador.Data  := CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa, 0);

  chklstPortador.Items.Clear;

  ListaPortador := TStringList.Create;
  ListaPortador.Clear;

  cdsPortador.First;
  while not cdsPortador.Eof do
  begin
    ListaPortador.Add(cdsPortador.FieldByName('CODPORTADOR').AsString);
    chklstPortador.Items.Add(cdsPortador.FieldByName('DESCRICAO').AsString);
    cdsPortador.Next;
  end;

  sListaPortador := '0';



  // Salvando o SQL original
  sSQLSintetica := qrySintetica.SQL.Text;
  sSQLAnalitica := qryAnalitica.SQL.Text;

  bZeraSaldoAnterior := False;

  // Fim - Alterado por FHBS

  //Inicializa CtrlTransfFundos
  CtrlTransfFundos:=TCtrlTransfFundos.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                             Sistema.IdUsuario,Sistema.UsaPlanoPatro);

  CtrlTransfFundos.Initialize(dtmBaseDados.dbBaseDados,True);

  //Carrega cds's de Conta Origem e Destino
  cdsContaOrigem.Data  := CtrlTransfFundos.ListPortadorComSaldo;
  cdsContaDestino.Data := cdsContaOrigem.Data;

  if Sistema.UsaPlanoPatro then
  begin
     cdsPatrocinador.Data := CtrlListTerceiros.ListPatrocinador;
     cdsPlanoPrev.Data    := CtrlListTerceiros.ListPlanoPrev;
  end;

  cdsAux:=TCMClientDataSet.Create(nil);
  try
    //Carrega Parâmetros Globais
    cdsAux.Data:=CtrlListTerceiros.ListParamGlobal(Sistema.IdEmpresa);

    //Carrega cds de Unidade de Negócio
    if (cdsAux.FieldByName('USAABC').AsString='S') then
      cdsUnidNegocio.Data:=CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa,0,'A','')
    else
      begin
        cdsUnidNegocio.Data:=CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa,
                              cdsAux.FieldByName('UNIDNEGOC').AsFloat,'','');
        dblcUnidNegocOri.Enabled:=False;
      end;

    if (cdsUnidNegocio.RecordCount=1) then
    begin
      dblcUnidNegocOri.LookupValue  := cdsUnidNegocio.FieldByName('UNIDNEGOC').AsString;
    end;

    //Carrega cds Tipo de Rec/Des
    cdsTipoRec.Data:=CtrlListTerceiros.ListTipoRD(Sistema.IdEmpresa,'R','');
    cdsTipoDes.Data:=CtrlListTerceiros.ListTipoRD(Sistema.IdEmpresa,'P','');

    //Inicializa CtrlHistPadrao
    CtrlHistPadrao:=TCtrlHistPadrao.Create;
    CtrlHistPadrao.Initialize(dtmBaseDados.dbBaseDados,True);

    //Carrega cds de Históricos
    cdsHistorico.Data:=CtrlHistPadrao.ListHsitoricoPadrao(0);

    //Carrega Parâmetros do Param Financ
    cdsAux.Close;
    cdsAux.Data   := CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);


    TipoRecTransf := (cdsAux.FieldByName('TIPORECEB').AsString);
    TipoDesTransf := (cdsAux.FieldByName('TIPODESEMB').AsString);

    dblcTipoRecTransf.LookupValue := TipoRecTransf;
    dblcTipoDesTransf.LookupValue := TipoDesTransf;

    //cdsHistorico.Locate('HISTPADFINAN', '13' , []);
    dblcUnidNegocOri.LookupValue  := '-1';
    dblcHistPad.LookupValue := ('13');

    edDataLanc.Date         := Date;
    tbsTransferencia.TabVisible := False;
    spRateios.Open;
    qryTransfContaxPlano.Open;
    qryDeParaTransf.Open;
    qryTransf.Open;
  finally
    cdsAux.Free;
  end;



  AtualizaGrids;
end;

procedure TfrmConsDisponibilidadeMT_CC.FormDestroy(Sender: TObject);
begin
  inherited;

  //AL_13

  CtrlParamFinanc.Free;
  CtrlDisponibxusu.Free;
  CtrlDisponFinanc.Free;

  CtrlListTerceiros.Free; // Alterado por FHBS - SOL: 138463 KTN: 843717

  CtrlTransfFundos.Free;
  CtrlHistPadrao.Free;
end;

procedure TfrmConsDisponibilidadeMT_CC.eOnMessage(sMsg : string);
begin
  MsgDlg(sMsg,'Atenção',mtWarning,[mbOk],0);
end;

procedure TfrmConsDisponibilidadeMT_CC.edtDataRefExit(Sender: TObject);
begin
  inherited;
   begin
      CdsDispFinanc.Data   := CtrlDisponFinanc.SelecionaDispFinanc(edtDataRef.Date );
      AtualizaGrids;
   end;
end;

procedure TfrmConsDisponibilidadeMT_CC.AtualizaGrids;
begin
   bConciliada := False;
   dbgSintetico.Visible := True;
   dbgAnalitico.Visible := True;
end;

procedure TfrmConsDisponibilidadeMT_CC.dbgAnaliticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmConsDisponibilidadeMT_CC.dbgDispAnaliticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmConsDisponibilidadeMT_CC.dbgDispSinteticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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
        
procedure TfrmConsDisponibilidadeMT_CC.dbgSinteticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmConsDisponibilidadeMT_CC.dbgAnaliticoTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidadeMT_CC.dbgDispAnaliticaTopRowChanged(Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidadeMT_CC.dbgDispSinteticaTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidadeMT_CC.dbgSinteticoTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidadeMT_CC.bbtnImprimirClick(Sender: TObject);
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

procedure TfrmConsDisponibilidadeMT_CC.rptDispAnaliticaStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   ppShape4.Brush.Color := clWhite;
   bFirst := True;
end;

procedure TfrmConsDisponibilidadeMT_CC.ppGroupFooterBand1BeforePrint(Sender: TObject);
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
procedure TfrmConsDisponibilidadeMT_CC.edtIntervaloExit(Sender: TObject);
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

procedure TfrmConsDisponibilidadeMT_CC.ppShape3Print(Sender: TObject);
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

procedure TfrmConsDisponibilidadeMT_CC.ppShape4Print(Sender: TObject);
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

function TfrmConsDisponibilidadeMT_CC.BuscaDiaRecolhCPMF(dDataRef:TDateTime):TDateTime;
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

function TfrmConsDisponibilidadeMT_CC.BuscaPrimeiroDiaIRRF(dDataRef:TDateTime):TDateTime;
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

function TfrmConsDisponibilidadeMT_CC.BuscaPrimeiDiaAposCPMF(dDataRef:TDateTime):TDateTime;
var
  dData : TDateTime;
begin
  dData := BuscaDiaRecolhCPMF(StrToDate(edtDataRef.Text));
  Result := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dData,True,True,False);
end;

procedure TfrmConsDisponibilidadeMT_CC.btnDebugClick(Sender: TObject);
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

procedure TfrmConsDisponibilidadeMT_CC.cmbTiposChange(Sender: TObject);
begin
   inherited;
   with qryDebug do
   begin
      Close;
      SQL.Clear;
   end;
end;

function TfrmConsDisponibilidadeMT_CC.TrocaString(sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
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

procedure TfrmConsDisponibilidadeMT_CC.dbgDebugCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmConsDisponibilidadeMT_CC.dbgDebugTopRowChanged(Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidadeMT_CC.ppLabel3Print(Sender: TObject);
begin
  inherited;
  TppLabel(Sender).Caption:=Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

procedure TfrmConsDisponibilidadeMT_CC.lblDispAnaSistemaPrint(Sender: TObject);
begin
  inherited;
  TppLabel(Sender).Caption:=Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

procedure TfrmConsDisponibilidadeMT_CC.ppLabel9Print(Sender: TObject);
begin
  inherited;
  TppLabel(Sender).Caption:=Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

procedure TfrmConsDisponibilidadeMT_CC.bbtnSelTodosCCClick(
  Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstPortador.Items.Count-1 do
    chklstPortador.Checked[c] := true;
  chklstPortador.Repaint;
end;

procedure TfrmConsDisponibilidadeMT_CC.bbtnInverteSelCCClick(
  Sender: TObject);
var
  c: integer;
begin
  inherited;
  for c:=0 to chklstPortador.Items.Count-1 do
    chklstPortador.Checked[c] := not(chklstPortador.Checked[c]);
  chklstPortador.Repaint;
end;
// Andre Imakawa - SIG 132998 - Inicio
procedure TfrmConsDisponibilidadeMT_CC.dblcTipoRecTransfChange(
  Sender: TObject);
begin
  inherited;
  dblcTipoDesTransf.Enabled:=(Trim(dblcTipoRecTransf.Text)<>'');
  lblTituloTipoDes.Enabled:=(Trim(dblcTipoRecTransf.Text)<>'');
end;

procedure TfrmConsDisponibilidadeMT_CC.btnTransferirClick(Sender: TObject);
var
  aIdplanoInicial, aIdplanofinal: integer;
begin
  inherited;
  if not qryTransf.IsEmpty then
  begin
    aIdplanoInicial := -1;
    aIdplanofinal := -1;
    PreencheStatus(aIdplanoInicial, aIdplanofinal, '', 1);
    if ValidaTransferencia then
    begin
      if TransfereSaldo then
        MsgDlg('Transferência executada com sucesso.','Atenção',mtWarning,[mbOk],0);
    end;
  end;
end;

procedure TfrmConsDisponibilidadeMT_CC.Button1Click(Sender: TObject);
begin
  inherited;
  VerificaMovimentoGrid;
end;

procedure TfrmConsDisponibilidadeMT_CC.qryTransfMARCARChange(
  Sender: TField);
begin
  inherited;
  if qryTransf.ControlsDisabled then
    exit;
  VerificaMovimentoGrid;
end;

procedure TfrmConsDisponibilidadeMT_CC.BitBtn1Click(Sender: TObject);
begin
  inherited;

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

      if sListaPortador = '0' then
      begin
        MsgDlg('Necessário atualizar a grid antes de emitir o relatório.','Atenção',mtWarning,[mbOk],0);
        exit;             
      end;


      MontaParametros('qryAnaliticaRel');
      //qryAnaliticaRel.Sql.SaveToFile('c:\planus\temp\DispFinancAnaliticaRel.txt');
      CdsDispAnaliticaRel.Close;
      CdsDispAnaliticaRel.Open;

      pplAnaliticaRel.DataSource := dsAnaliticaRel;


      LblEmpresaAnaliticaRel.Caption := Sistema.NomeEmpresa;
      lblDataAnaliticaRel.Caption := edtDataRef.Text;

      pplAnaliticaRel.AutoCreateFields := False;
      pplAnaliticaRel.AutoCreateFields := True;

      qryAnaliticaRel.DisableControls;
      CdsDispAnaliticaRel.DisableControls;


      TfrmPreview.CreateModalPreview(Application,
                                     rptDispAnaliticaRel,
                                     rptDispAnaliticaRel.PrinterSetup.DocumentName);
      qryAnaliticaRel.EnableControls;
      CdsDispAnaliticaRel.EnableControls;
     end;
  end;
end;
// Andre Imakawa - SIG 132998 - Fim

end.
