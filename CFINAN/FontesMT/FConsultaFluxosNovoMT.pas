unit FConsultaFluxosNovoMT;

{-------------------------------------------------------------------------------
Rotina......: bbtnConfirmarClick, GetParametros
Nº SIG......: 96575
Data........: 23/07/2021
Responsável.: Cássio Florencio Rovaroto
Descrição...: Inclusão de parâmetro para verificação de fluxo de caixa anual.
--------------------------------------------------------------------------------
Rotina......: TotalizaFluxo
Nº SIG......: 46608/88515
Data........: 08/07/2019
Responsável.: Everson Cunha
Descrição...: Inclusão de coluna com totalizador por linha
--------------------------------------------------------------------------------
Rotina......: MontaConsultaDadosFluxo
Nº SIG......: 88013
Data........: 03/07/2019
Responsável.: Darivaldo Alencar
Descrição...: Colunas invertidas devido ordenação do tíbero
-----------------------------------------------------------------------------------------
Rotina......: rbPrevistoClick
Nº SIG......: 22407
Data........: 15/09/2016
Responsável.: William Santana
Descrição...: Implementação de exibição sintética do relatório comparativo
--------------------------------------------------------------------------------
Rotina......: GeraDados_Compara, ppDetailBand5BeforePrint
Nº SOL......: 255386
Nº PPM......: 818743
Data........: 02/06/2015
Responsável.: Edilaine Ferraresi
Descrição...: O lado previsto não está saindo quando não há realizado no
              relatorio comparativo
--------------------------------------------------------------------------------
Rotina......: GeraDados_Compara
Nº SOL......: 250388
Nº KINTANA..: 722851
Data........: 20/06/2014
Responsável.: Edilaine Ferraresi
Descrição...: incluir lançamentos não vinculados a documentos
--------------------------------------------------------------------------------
Nº SOL......: 250346
Nº KINTANA..: 714315
Data........: 16/06/2014
Responsável.: Edilaine Ferraresi
Descrição...: O sistema apresenta o mesmo nome para as 2 colunas no fluxo
              previxo x real mensal
--------------------------------------------------------------------------------
Nº SOL......: 136203
Nº KINTANA..: 813205
Data........: 16/06/2014
Responsável.: Edilaine Ferraresi
Descrição...: Nova funcionalidade para Fluxo de Caixa
--------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, wwdblook, Mask, wwdbedit, Wwdbspin, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet,
  uCtrlFluxoCaixa, uCtrlListTercFinanc, uCtrlPadroes, uCtrlMontaFluxo,
  DBTables, Wwquery, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport,
  uCmSqlParams, ppChrt, ppChrtDP, Provider, Wwtable, wwclient, ppStrtch,
  ppRegion, ppParameter;

type
  TfrmConsultaFluxosNovoMT = class(TfrmOkCancelar)
    gbDatas: TGroupBox;
    lbla: TLabel;
    deDatIni: TCMDateTimePicker;
    deDatFim: TCMDateTimePicker;
    edtGrau: TwwDBSpinEdit;
    Label4: TLabel;
    rgAgrupa: TRadioGroup;
    rgDocs: TRadioGroup;
    gbTipoRel: TGroupBox;
    pnlTipoRel: TPanel;
    rbPrevisto: TRadioButton;
    rbRealizado: TRadioButton;
    rbPrevxReal: TRadioButton;
    rbCompara: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    dblcLinhaIni: TwwDBLookupCombo;
    Label3: TLabel;
    dblcLinhaFim: TwwDBLookupCombo;
    lblUnidNegoc: TLabel;
    lblCentroRespon: TLabel;
    Label18: TLabel;
    Label5: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    dblcCentroRespon: TwwDBLookupCombo;
    dblcPatrocinador: TwwDBLookupCombo;
    dblcPlano: TwwDBLookupCombo;
    Label6: TLabel;
    dblcDiretoria: TwwDBLookupCombo;
    Label7: TLabel;
    dblcCentCust: TwwDBLookupCombo;
    gbQuebra: TGroupBox;
    rbQuebraNao: TRadioButton;
    rbQuebraCC: TRadioButton;
    rbQuebraCR: TRadioButton;
    rbQuebraPlan: TRadioButton;
    cdsPlanoPrev: TCMClientDataSet;
    cdsPatrocinador: TCMClientDataSet;
    cdsCentroRespon: TCMClientDataSet;
    cdsUnidNeg: TCMClientDataSet;
    cdsCCusto: TCMClientDataSet;
    cdsDiretoria: TCMClientDataSet;
    cdsLinhaIni: TCMClientDataSet;
    cdsLinhaFim: TCMClientDataSet;
    cdsSemRelacao: TCMClientDataSet;
    rptSemRelacao: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    lblSemTit: TppLabel;
    ppShape22: TppShape;
    ppShape27: TppShape;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    lblSemTipoDR: TppLabel;
    ppLabel52: TppLabel;
    ppDetailBand6: TppDetailBand;
    dbDtProgramada: TppDBText;
    dbRecPag: TppDBText;
    dbDescricao: TppDBText;
    dbValor: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppShape28: TppShape;
    lblModulo: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel64: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppSemReserva: TppBDEPipeline;
    dsSemReserva: TDataSource;
    cdsFluxos: TCMClientDataSet;
    dsFluxos: TwwDataSource;
    ppFluxos: TppBDEPipeline;
    ppCompara: TppBDEPipeline;
    ppQuadro: TppBDEPipeline;
    rptFluxoRetrato: TppReport;
    bndRHeader: TppHeaderBand;
    lblDEmpresa: TppLabel;
    lblDEnd1: TppLabel;
    lblDEnd2: TppLabel;
    pplblDataIni: TppLabel;
    pplblDataFim: TppLabel;
    pplblLinhaIni: TppLabel;
    pplblLinhaFim: TppLabel;
    bndRDetalhe: TppDetailBand;
    dbRLinha: TppDBText;
    dbRDia1: TppDBText;
    dbRDia2: TppDBText;
    dbRDia3: TppDBText;
    ppFooterBand1: TppFooterBand;
    lblRModulo: TppLabel;
    lblPag: TppLabel;
    lblNumPag: TppSystemVariable;
    rptQuadro: TppReport;
    bndQHeader: TppHeaderBand;
    ppShape12: TppShape;
    ppShape10: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppShape11: TppShape;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    lblQEmpresa: TppLabel;
    lblQEnd1: TppLabel;
    lblQEnd2: TppLabel;
    lblQTitulo: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppShape15: TppShape;
    ppShape14: TppShape;
    ppShape13: TppShape;
    ppShape16: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape17: TppShape;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppShape20: TppShape;
    ppLabel62: TppLabel;
    ppShape21: TppShape;
    ppLabel63: TppLabel;
    rptPCompara: TppReport;
    bndCPHeader: TppHeaderBand;
    lblEmpresa: TppLabel;
    lblEnd1: TppLabel;
    lblEnd2: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    lblPTitulo: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppFooterBand5: TppFooterBand;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppShape32: TppShape;
    cdsPeriodo: TCMClientDataSet;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDFiltro1: TppDBText;
    ppDFiltro3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDFiltro6: TppDBText;
    ppDFiltro2: TppDBText;
    ppDFiltro5: TppDBText;
    ppDFiltro4: TppDBText;
    ppFiltros: TppBDEPipeline;
    ppDBText31: TppDBText;
    dsFiltros: TDataSource;
    cdsFiltros: TCMClientDataSet;
    ppShape2: TppShape;
    dbRDia4: TppDBText;
    cdsFiltrosDataIni: TStringField;
    cdsFiltrosDataFim: TStringField;
    cdsFiltrosLinhaIni: TStringField;
    cdsFiltrosLinhaFim: TStringField;
    cdsFiltrosNomeRel: TStringField;
    cdsFiltrosFiltro1: TStringField;
    cdsFiltrosFiltro2: TStringField;
    cdsFiltrosFiltro3: TStringField;
    cdsFiltrosFiltro4: TStringField;
    cdsFiltrosFiltro5: TStringField;
    cdsFiltrosFiltro6: TStringField;
    ppDBText43: TppDBText;
    cdsFiltrosTitFiltro: TStringField;
    ppCPFiltro1: TppDBText;
    ppCPFiltro3: TppDBText;
    ppCPFiltro6: TppDBText;
    ppCPFiltro2: TppDBText;
    ppCPFiltro5: TppDBText;
    ppCPFiltro4: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppGroup3: TppGroup;
    bndRQuebra: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    rptGrafico: TppReport;
    bndGHeader: TppHeaderBand;
    ppShapeG1: TppShape;
    ppShapeG2: TppShape;
    ppDetailBand1: TppDetailBand;
    ppFooterBand7: TppFooterBand;
    rptFluxoPaisagem: TppReport;
    bndPHeader: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppPFiltro1: TppDBText;
    ppPFiltro3: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppPFiltro6: TppDBText;
    ppPFiltro2: TppDBText;
    ppPFiltro5: TppDBText;
    ppPFiltro4: TppDBText;
    ppDBText32: TppDBText;
    ppDBText34: TppDBText;
    bndPDetalhe: TppDetailBand;
    dbPLinha: TppDBText;
    dbPDia1: TppDBText;
    dbPDia2: TppDBText;
    dbPDia3: TppDBText;
    dbPDia4: TppDBText;
    ppFooterBand2: TppFooterBand;
    lblPModulo: TppLabel;
    ppLabel9: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppShape3: TppShape;
    lblPD2: TppLabel;
    lblPD3: TppLabel;
    ppShape4: TppShape;
    ppFPGrupo: TppDBText;
    lblPD4: TppLabel;
    ppPTracoCab2: TppShape;
    lblPD1: TppLabel;
    ppGroup5: TppGroup;
    bndPQuebra: TppGroupHeaderBand;
    ppDBText49: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    lblPD7: TppLabel;
    lblPD6: TppLabel;
    lblPD5: TppLabel;
    dbPDia7: TppDBText;
    dbPDia6: TppDBText;
    dbPDia5: TppDBText;
    lblPD8: TppLabel;
    dbPDia8: TppDBText;
    rptRCompara: TppReport;
    bndCRHeader: TppHeaderBand;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    lblRTitulo: TppLabel;
    ppCRFiltro1: TppDBText;
    ppCRFiltro3: TppDBText;
    ppCRFiltro6: TppDBText;
    ppCRFiltro2: TppDBText;
    ppCRFiltro5: TppDBText;
    ppCRFiltro4: TppDBText;
    ppDBText21: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppShape5: TppShape;
    ppGroup6: TppGroup;
    bndRCQuebra: TppGroupHeaderBand;
    ppShape6: TppShape;
    ppShape44: TppShape;
    ppShape45: TppShape;
    ppShape46: TppShape;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    lblRLinhaC: TppLabel;
    ppLabel40: TppLabel;
    lblRDesRecC: TppLabel;
    ppLabel66: TppLabel;
    lblRForCli: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    cdsCompara: TCMClientDataSet;
    dbPeriodo: TppDBText;
    dbUsuario: TppDBText;
    dbTipoRecDes: TppDBText;
    dbVlrRecDes: TppDBText;
    dbDesembolso: TppDBText;
    dbVrlBaixa: TppDBText;
    dbVlrRateio: TppDBText;
    dbForCli: TppDBText;
    ppShape23: TppShape;
    ppShape26: TppShape;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    lblData: TppLabel;
    lblUsuario: TppLabel;
    lblPLinhaC: TppLabel;
    lblPrevVlr: TppLabel;
    lblPDesRecC: TppLabel;
    lblDesRecVlr: TppLabel;
    lblEspVlr: TppLabel;
    lblPForCli: TppLabel;
    dbPPeriodo: TppDBText;
    ppGroup2: TppGroup;
    bndPCQuebra: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    dsCompara: TDataSource;
    ppShape47: TppShape;
    ppShape48: TppShape;
    ppShape49: TppShape;
    ppShape50: TppShape;
    ppShape51: TppShape;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    dsQuadro: TDataSource;
    cdsQuadro: TCMClientDataSet;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppQFiltro1: TppDBText;
    ppQFiltro3: TppDBText;
    ppQFiltro2: TppDBText;
    ppQFiltro4: TppDBText;
    ppDBText25: TppDBText;
    ppQFiltro5: TppDBText;
    ppQFiltro6: TppDBText;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    lblTitGraf: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppGFiltro1: TppDBText;
    ppGFiltro3: TppDBText;
    ppGFiltro2: TppDBText;
    ppGFiltro4: TppDBText;
    ppDBText28: TppDBText;
    ppGFiltro5: TppDBText;
    ppGFiltro6: TppDBText;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel35: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    sqlQuadro: TCMSqlParams;
    wwQuery1: TwwQuery;
    DataSetProvider1: TDataSetProvider;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppImage3: TppImage;
    ppImage4: TppImage;
    ppImage5: TppImage;
    ppImage6: TppImage;
    ppGroup7: TppGroup;
    bndRCabec: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    lblRD2: TppLabel;
    lblRD3: TppLabel;
    ppTracoQuebra1: TppShape;
    ppFRGrupo: TppDBText;
    lblRD4: TppLabel;
    lblRD1: TppLabel;
    ppRTracoCab2: TppShape;
    ppGroup1: TppGroup;
    bndPCabec: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppImage7: TppImage;
    cdsExporta: TCMClientDataSet;
    ppDBText33: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppShape1: TppShape;
    ppShape25: TppShape;
    ppShape29: TppShape;
    ppShape30: TppShape;
    dbRPeriodo: TppDBText;
    dbPQuebra: TppDBText;
    ppGroup4: TppGroup;
    bndCPGruPer: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    dbRQuebra: TppDBText;
    ppGroup8: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppLabel14: TppLabel;
    bndQDTit: TppTitleBand;
    ppSystemVariable6: TppSystemVariable;
    ppLabel15: TppLabel;
    ppZebra: TppShape;
    ppDPTeeChart1: TppDPTeeChart;
    bndTitGraf: TppTitleBand;
    qryCompara: TwwQuery;
    updCompara: TUpdateSQL;
    ppGroup9: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppDBText19: TppDBText;
    ppGroup10: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppRLinEsq: TppLine;
    ppRLinDir: TppLine;
    ppRLinTop: TppLine;
    ppRLinDown: TppLine;
    ppPLinEsq: TppLine;
    ppPLinDir: TppLine;
    ppPLinTop: TppLine;
    ppPLinDown: TppLine;
    ppShape24: TppShape;
    ppLabel16: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    chkSintetico: TCheckBox;
    lblTotalPorLinha: TppLabel;
    pdbtxtTotalPorLinha: TppDBText;
    lblTotalPorLinhaP: TppLabel;
    pdbtxtTotalPorLinhaP: TppDBText;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcDiretoriaChange(Sender: TObject);
    procedure dblcLinhaIniChange(Sender: TObject);
    procedure rbPrevistoClick(Sender: TObject);
    procedure bndRHeaderBeforePrint(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbRDia1Print(Sender: TObject);
    procedure dbPDia1Print(Sender: TObject);
    procedure bndCPHeaderBeforePrint(Sender: TObject);
    procedure ppFRGrupoPrint(Sender: TObject);
    procedure bndRQuebraBeforePrint(Sender: TObject);
    procedure ppFPGrupoPrint(Sender: TObject);
    procedure bndPQuebraBeforePrint(Sender: TObject);
    procedure bndCRHeaderBeforePrint(Sender: TObject);
    procedure edtGrauKeyPress(Sender: TObject; var Key: Char);
    procedure bndQDTitBeforePrint(Sender: TObject);
    procedure ppDetailBand6BeforePrint(Sender: TObject);
    procedure bndTitGrafBeforePrint(Sender: TObject);
    procedure ppDetailBand5BeforePrint(Sender: TObject);
    procedure bndCPGruPerBeforePrint(Sender: TObject);
  private
    { Private declarations }
    CtrlListTerceiros    : TCtrlListTercFinanc;
    CtrlFluxoCaixa       : TCtrlFluxoCaixa;
    CtrlMontaFluxo       : TCtrlMontaFluxo;
    iIdFluxo             : byte;
    tipoPeriodo          : TTpPeriodo;
    sParams              : TParamRel;
    cdsSintetico         : TCMClientDataSet;
    cdsTotal             : TCMClientDataSet;
    lstPeriodo           : TStringList;
    iGrupoImp            : integer;

    procedure GetParametros;
    procedure LimpaParametros;
    procedure AjustaLabel(var lblAux : TppLabel);
    procedure MudaLabelPeriodo;
    procedure CarregaDatasParaGrupoImpresso;
    procedure AtivaDesativaFiltro(var _cds : TCMClientDataSet; sFiltro : string);
    procedure InsereLadoDireitoRelCompara(bPrimeiroReg  : boolean;
                                          iGrupoDoc     : integer;
                                          rColunaRel    : TTpColunaCompara;
                                          sPeriodoBusca : string;
                                          sPeriodo      : string;
                                          var bExiste   : boolean;
                                          var iQtdLanca : integer;
                                          iOrdem        : integer;
                                          sCodigo       : string;
                                          sDescricao    : string;
                                          rValor        : Currency;
                                          bForcaLinha   : boolean;
                                          var iUltVazia : integer);

    function  VerificaParametrosOk : boolean;
    function  GeraDados_Fluxos    : boolean;
    function  GeraDados_Compara   : boolean;
    function  TotalizaFluxo(var _cdsFase : TCMClientDataSet; fase : byte) : boolean;
    procedure LimpaDiretoria;

  public
    { Public declarations }
  end;

var
  frmConsultaFluxosNovoMT: TfrmConsultaFluxosNovoMT;

implementation

{$R *.DFM}

uses
  uSistema, uMensErro, Math, uFuncaoGeral, FPreviewFinanc, uCtrlParamIntegra, FFormaImpConsFluxoMT;


function IIf(condicao : boolean; vlrTrue, vlrFalse : string) : string; overload;
begin
  if condicao then
     result := vlrTrue
  else
     result := vlrFalse;
end;

function IIf(condicao : boolean; vlrTrue, vlrFalse : integer) : integer; overload;
begin
  if condicao then
     result := vlrTrue
  else
     result := vlrFalse;
end;


function TfrmConsultaFluxosNovoMT.VerificaParametrosOk: boolean;
begin
  Result := true;

  if (deDatIni.Date = 0) or (deDatFim.Date = 0) then
  begin
    Result := false;
    if (deDatIni.Date = 0) and (deDatFim.Date = 0) then
       MsgDlg('É obrigatório informar a data inicial e data final para emissão do fluxo de caixa.','Fluxos',mtInformation,[mbOk],0)
    else if (deDatIni.Date = 0) then
       MsgDlg('É obrigatório informar a data inicial','Fluxos',mtInformation,[mbOk],0)
    else if (deDatFim.Date = 0) then
       MsgDlg('É obrigatório informar a data final','Fluxos',mtInformation,[mbOk],0);

    if (deDatIni.Date = 0) then deDatIni.SetFocus
                           else deDatFim.SetFocus;
  end;

  if (Result) and (deDatIni.date > deDatFim.Date) then
  begin
    Result := false;
    MsgDlg('A data inicial deve ser menor ou igual a data final.','Fluxos',mtInformation,[mbOk],0);
    deDatIni.SetFocus;
  end;

  if (Result) and
     (not rbPrevisto.Checked) and (not rbRealizado.Checked) and (not rbPrevxReal.Checked) and (not rbCompara.Checked) then
  begin
    Result := false;
    MsgDlg('É obrigatório selecionar um dos tipos de relatório para emissão do fluxo de caixa.','Fluxos',mtInformation,[mbOk],0);
    pnlTipoRel.SetFocus;
  end;

  if (Result) and (rgDocs.ItemIndex = -1) then
  begin
    Result := false;
    MsgDlg('É obrigatório selecionar o tipo de documento para emissão do fluxo de caixa.','Fluxos',mtInformation,[mbOk],0);
    rgDocs.SetFocus;
  end;

  if (Result) and (not rbCompara.Checked) and ((edtGrau.text = '') or (edtGrau.Value = 0)) then
  begin
    Result := false;
    MsgDlg('É obrigatório informar o grau para emissão do fluxo de caixa.','Fluxos',mtInformation,[mbOk],0);
    edtGrau.Value := 5;
    edtGrau.SetFocus;
  end;

  if (Result) and (rgAgrupa.ItemIndex = -1) then
  begin
    Result := false;
    MsgDlg('É obrigatório selecionar um dos tipos de agrupamento.','Fluxos',mtInformation,[mbOk],0);
    rgAgrupa.SetFocus;
  end;

  if (Result) and (rbCompara.Checked) and (dblcCentroRespon.Value = '') then
  begin
    Result := false;
    MsgDlg('É obrigatório selecionar o centro de responsabilidade para emissão do relatório comparativo.','Fluxos',mtInformation,[mbOk],0);
    dblcCentroRespon.SetFocus;
  end;

  if (Result) and (rbCompara.Checked) and (rgDocs.ItemIndex = 0) then
  begin
    Result := false;
    MsgDlg('Para emissão do Relatório Comparativo é necessário selecionar Pagamentos ou Recebimentos. '+#13#10+'Não é possível emitir relatório para Todos.','Fluxos',mtInformation,[mbOk],0);
    rgDocs.SetFocus;
  end;

end;

procedure TfrmConsultaFluxosNovoMT.bbtnConfirmarClick(Sender: TObject);
var
   bGeraOk   : boolean;
   bImpSemRelacao : boolean;
   sFiltro   : string;
   numRel, i : integer;
   Relatorio : TppReport;
begin
  inherited;

  if VerificaParametrosOk then
  begin

    // setando tipo de periodo
    if rbCompara.Checked then
       tipoPeriodo := tpDiario
    else
       case rgAgrupa.itemIndex of
         0 : tipoPeriodo := tpDiario;
         1 : tipoPeriodo := tpSemanal;
         2 : tipoPeriodo := tpMensal;
         3 : tipoPeriodo := tpAnual; //Cássio Rovaroto - SIG nº 96575
       end;

    // Parametros
    GetParametros();

    // escolhe a orientação de impressão
    with TfrmFormaImpConsFluxoMT.Create(Self) do
    try
       if sParams.TipoRelat = trCompara then
          rgOrientacao.ItemIndex := 1;
       ShowModal;
       case rgOrientacao.ItemIndex of
          0: sParams.OrientaImp := opRetrato;
          1: sParams.OrientaImp := opPaisagem;
       end;
       if Cancela then
          Abort;
    finally
       Free;
    end;

    // define no. de colunas do relatorio
    sParams.iColuna := iif(sParams.OrientaImp = opRetrato, 4, 8);

    // monta períodos de acordo com o agrupamento
    cdsPeriodo.data := CtrlMontaFluxo.GetPeriodoFluxo(sParams);

    // busca linhas sintéticas do fluxo
    cdsSintetico.data := CtrlMontaFluxo.GetLinhasSinteticas(iIdFluxo);

    // busca dados conforme relatorio
    case sParams.TipoRelat of
      trPrevisto,
      trRealizado,
      trPrevxReal : bGeraOk := GeraDados_Fluxos();
      trCompara   : bGeraOk := GeraDados_Compara();
    end;

    if (sParams.TipoRelat <> trCompara) and (cdsFluxos.IsEmpty) then
    begin
      MsgDlg('Não existem dados a serem apresentados.','Fluxos',mtInformation,[mbOk],0);
      Abort;
    end;

    if bGeraOk then
    begin

      if sParams.TipoRelat <> trCompara then
      begin
        try
          // aplicando filtros de linha inicial e final / grau
          AtivaDesativaFiltro(cdsFluxos,  '');
          AtivaDesativaFiltro(cdsExporta, '');

          sFiltro := '';
          if (sParams.sLinhaIni <> EmptyStr) then
             sFiltro := iif(sParams.sLinhaIni <> EmptyStr, '(ORDEM >= '+sParams.sLinhaIni+')', '');
          if (sParams.sLinhaFim <> EmptyStr) then
             sFiltro := sFiltro + iif(sFiltro <> EmptyStr, ' and ', '') + '(ORDEM <= '+sParams.sLinhaFim+')';
          if sParams.sGrau <> EmptyStr then
             sFiltro := sFiltro + iif(sFiltro <> EmptyStr, ' and ', '') + '(FLGGRAU <= '+sParams.sGrau+')';

          if sFiltro <> EmptyStr then
          begin
            AtivaDesativaFiltro(cdsFluxos,  sFiltro);
            AtivaDesativaFiltro(cdsExporta, sFiltro);
          end;


          // valida se há dados
          if cdsFluxos.IsEmpty then
          begin
            MsgDlg('Não existem dados a serem apresentados.','Fluxos',mtInformation,[mbOk],0);
            Abort;
          end;

          case sParams.OrientaImp of
            opRetrato  : Relatorio := rptFluxoRetrato;
            opPaisagem : Relatorio := rptFluxoPaisagem;
          end;


          if sParams.TipoRelat = trRealizado then
          begin
            // verifica itens sem Relação
            CdsSemRelacao.Filtered := false;
            CdsSemRelacao.Data     := CtrlFluxoCaixa.ListaFluxoDesrelac('R', '', Sistema.IdEmpresa, iIdFluxo, deDatIni.Date, deDatFim.Date);
            if rgDocs.ItemIndex <> 0 then
            begin
              if rgDocs.ItemIndex = 1 then
                 CdsSemRelacao.Filter := 'RECPAG = ''P'' '
              else
                 CdsSemRelacao.Filter := 'RECPAG = ''R'' ';
              CdsSemRelacao.Filtered := true;
            end;

            if not CdsSemRelacao.isEmpty then
            begin
              bImpSemRelacao := MsgDlg('Existe(m) lançamento(s) para este modelo de fluxo, cujo(s) Tipo(s) de Recebimento '   +#13+
                                '/Desembolso não estão relacionados a nenhuma linha do respectivo fluxo. Isto provoca '+#13+
                                'diferença nos saldos a transportar/transportado.  '+#13+
                                'Deseja visualizar as inconsistências?',Sistema.NomeAplicativo, mtWarning, [mbYes,mbNo],0) = mrYes;
            end;
          end;

          // ordernacao
          cdsFluxos.IndexName  := iif(sParams.Quebra <> EmptyStr, 'IdxQuebra', 'IdxOrdem');
          cdsExporta.IndexName := iif(sParams.Quebra <> EmptyStr, 'IdxQuebra', 'IdxOrdem');

          // imprime relatorio itens nao relacioandos
          if bImpSemRelacao then
          begin
            lblSemTit.Caption := 'Lançamento(s) em Tipo de ' + iif((sParams.tipoDoc = 'P') or (sParams.tipoDoc = ''), 'Desembolso', '') +
                                                               iif((sParams.tipoDoc = ''), ' / ', '') +
                                                               iif((sParams.tipoDoc = 'R') or (sParams.tipoDoc = ''), 'Recebimento', '') + ' sem Relacionamento(s)';

            lblSemTipoDR.Caption := 'Tipo de '+ iif((sParams.tipoDoc = 'P') or (sParams.tipoDoc = ''), 'Desembolso', '') +
                                                iif((sParams.tipoDoc = ''), ' / ', '') +
                                                iif((sParams.tipoDoc = 'R') or (sParams.tipoDoc = ''), 'Recebimento', '');

             TFrmPreviewFinanc.CreateModalPreviewFinanc(Application,
                                               rptSemRelacao,
                                               rptSemRelacao.PrinterSetup.DocumentName,
                                               cdsSemRelacao);
          end;

          // exibe relatorio
          TFrmPreviewFinanc.CreateModalPreviewFinanc(Application,
                                               Relatorio,
                                               Relatorio.PrinterSetup.DocumentName,
                                               cdsFluxos,
                                               cdsExporta);

        finally
          AtivaDesativaFiltro(cdsFluxos,  '');
          AtivaDesativaFiltro(cdsExporta, '');
        end;

      end
      else
      begin
        // acertando labels
        if sParams.OrientaImp = opRetrato then
        begin
          lblRDesRecC.caption  := iif(sParams.tipoDoc = 'R', 'Tipo de Recebimento', 'Tipo de Desembolso');
          lblRLinhaC.Caption := iif(sParams.tipoDoc = 'R', 'Recebimento', 'Desembolso')+' / Linha do Fluxo';
          lblRForCli.caption  := 'Especificação do '+iif(sParams.tipoDoc = 'R', 'Recebimento', 'Pagamento');
        end
        else
        begin
          lblPDesRecC.caption  := iif(sParams.tipoDoc = 'R', 'Tipo de Recebimento', 'Tipo de Desembolso');
          lblPLinhaC.Caption   := iif(sParams.tipoDoc = 'R', 'Recebimento', 'Desembolso')+' / Linha do Fluxo';
          lblPForCli.caption  := 'Especificação do '+iif(sParams.tipoDoc = 'R', 'Recebimento', 'Pagamento');
        end;

        for numRel := 1 to 3 do
        begin
          case numRel of
            1 : begin
                  // ordernacao
                  cdsCompara.IndexName := iif(sParams.Quebra <> EmptyStr, 'indQuebra', 'indOrdem');
                  while not qryCompara.eof do
                  begin
                    if Trim(qryCompara.FieldByName('BUSCA').AsString) <> EmptyStr then
                    begin
                      cdsCompara.Append;
                      for i := 0 to qryCompara.FieldCount-1 do
                         cdsCompara.FieldByName(qryCompara.Fields[i].FieldName).Value := qryCompara.Fields[i].Value;
                      cdsCompara.Post;
                    end;

                    qryCompara.next;
                  end;
                  cdsCompara.first;

                  // valida se há dados
                  if cdsCompara.IsEmpty then
                  begin
                    MsgDlg('Não existem dados a serem apresentados.','Fluxos',mtInformation,[mbOk],0);
                    Abort;
                  end;

                  iGrupoImp := 0;

                  case sParams.OrientaImp of
                    opRetrato  : Relatorio := rptRCompara;
                    opPaisagem : Relatorio := rptPCompara;
                  end;
                end;
            2 : Relatorio := rptQuadro;
            3 : Relatorio := rptGrafico;
          end;

          // exibe relatorio
          if numRel = 1 then
             TFrmPreviewFinanc.CreateModalPreviewFinanc(Application,
                                                  Relatorio,
                                                  Relatorio.PrinterSetup.DocumentName,
                                                  cdsCompara)
          else
             TFrmPreviewFinanc.CreateModalPreviewFinanc(Application,
                                                  Relatorio,
                                                  Relatorio.PrinterSetup.DocumentName,
                                                  cdsQuadro);

        end;
        cdsQuadro.close;

      end;
    end;
  end;
end;



procedure TfrmConsultaFluxosNovoMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Inicializa CtrlFluxoCaixa
  CtrlFluxoCaixa := TCtrlFluxoCaixa.Create(Sistema.IdEmpresa,Sistema.IdModulo, Sistema.IdUsuario,Sistema.UsaPlanoPatro);
  CtrlFluxoCaixa.InitializeAs(Padroes);

  //Inicializa CtrlListTerceiros
  CtrlListTerceiros := TCtrlListTercFinanc.Create;
  CtrlListTerceiros.InitializeAs(Padroes);

  //Inicializa CtrlListTerceiros
  CtrlMontaFluxo:=TCtrlMontaFluxo.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);
  CtrlMontaFluxo.InitializeAs(Padroes);

  //buscar Fluxo atual
  iIdFluxo := CtrlMontaFluxo.GetIdFluxoCaixa();

  // criando objetos
  cdsSintetico := TCMClientDataSet.Create(self);
  cdsTotal     := TCMClientDataSet.Create(self);
  lstPeriodo   := TStringList.create;

  //Carrega cdsDiretoria
  cdsDiretoria.data    := CtrlListTerceiros.ListCentroCusto(true);
  //Carrega cdsUnidNeg
  cdsUnidNeg.data      := CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa,0, '', '');
  //Carrega cdsCentroResp
  cdsCentroRespon.data := CtrlListTerceiros.ListCentroRespon();
  //Carrega cdsCCusto
  cdsCCusto.data       := CtrlListTerceiros.ListCentroCusto(false);
  //Carrega cdsPatrocinador
  cdsPatrocinador.Data := CtrlListTerceiros.ListPatrocinador;
  //Carrega cdsPlanoPrev
  cdsPlanoPrev.Data    := CtrlListTerceiros.ListPlanoPrev;

  //Carrega Linha Inicial e Final
  cdsLinhaIni.data  := CtrlMontaFluxo.ListMontaFluxo(iIdFluxo, 0, false);
  cdsLinhaFim.data  := CtrlMontaFluxo.ListMontaFluxo(iIdFluxo, 0, false);

  cdsFiltros.data   := CtrlMontaFluxo.ListCamposFiltro();

  sParams.TipoRelat := trNone;

end;

procedure TfrmConsultaFluxosNovoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CtrlListTerceiros.Free;
  CtrlFluxoCaixa.Free;
  CtrlMontaFluxo.Free;

  FreeAndNil(cdsSintetico);
  FreeAndNIl(cdsTotal);
  lstPeriodo.free;

  inherited;
  Action:=caFree;
end;

procedure TfrmConsultaFluxosNovoMT.dblcDiretoriaChange(Sender: TObject);
begin
  inherited;
  if (dblcDiretoria.Value <> '') and
     (cdsDiretoria.Locate('NOME', dblcDiretoria.Value, [loCaseInsensitive])) then
  begin
    dblcCentCust.Clear;
    cdsCCusto.Filtered := false;
    cdsCCusto.Filter   := 'DIRETORIA = '+ cdsDiretoria.FieldByName('CODEXTERNO').AsString;
    cdsCCusto.Filtered := true;

    dblcCentroRespon.clear;
    cdsCentroRespon.Filtered := false;
    cdsCentroRespon.Filter   := 'DIRETORIA = '+ cdsDiretoria.FieldByName('CODEXTERNO').AsString;
    cdsCentroRespon.Filtered := true;
  end
  else
    LimpaDiretoria(); 
end;

procedure TfrmConsultaFluxosNovoMT.dblcLinhaIniChange(Sender: TObject);
begin
  inherited;
  if (dblcLinhaIni.Value <> '') and
     (cdsLinhaIni.Locate('DESCRICAO', dblcLinhaIni.Value, [loCaseInsensitive])) then
  begin
    dblcLinhaFim.clear;
    cdsLinhaFim.Filtered := false;
    cdsLinhaFim.Filter   := 'ORDEM >= '+cdsLinhaIni.FieldByName('ORDEM').AsString;
    cdsLinhaFim.Filtered := true;
  end
  else
  begin
    cdsLinhaFim.Filtered := false;
    cdsLinhaFim.Filter   := '';
  end;
end;

procedure TfrmConsultaFluxosNovoMT.rbPrevistoClick(Sender: TObject);
begin
  inherited;
  dblcLinhaIni.enabled := not rbCompara.checked;
  dblcLinhaFim.enabled := not rbCompara.checked;
  edtGrau.Enabled      := not rbCompara.checked;
  rgAgrupa.Enabled     := not rbCompara.checked;

  gbQuebra.Enabled     := not rbCompara.checked;
  rbQuebraCC.Enabled   := not rbCompara.checked;
  rbQuebraCR.Enabled   := not rbCompara.checked;
  rbQuebraPlan.Enabled := not rbCompara.checked;

  dblcDiretoria.enabled := not rbPrevisto.checked;
  dblcCentCust.enabled  := not rbPrevisto.checked;
  if rbPrevisto.Checked then
     LimpaDiretoria();

  if rbCompara.checked then
  begin
    rgAgrupa.ItemIndex  := 0;
    rbQuebraNao.checked := true;
   //Início - William Santana - SIG 22407
    chkSintetico.Enabled := True;
    chkSintetico.checked := True;
  end
  else
  begin
   chkSintetico.Enabled := False;
   chkSintetico.checked := False;
  end;
   //Término - William Santana - SIG 22407
end;


function  TfrmConsultaFluxosNovoMT.TotalizaFluxo(var _cdsFase : TCMClientDataSet; fase : byte) : boolean;
var
  i, j, l  : integer;
  iNumCol  : integer;
  campo    : string;
  sDia     : string;
  bExiste  : boolean;
  _cdsAux  : TCMClientDataSet;
begin
  try
    try
      _cdsAux  := TCMClientDataSet.Create(self);

      //SIG88013 -Inicio
      if (rbRealizado.Checked) then
        iNumCol := cdsPeriodo.RecordCount
      else
      //SIG88013 -Fim
        iNumCol := iif(fase = 1, sParams.iColuna, cdsPeriodo.RecordCount);

      {busca os mesmos dados do cdsFluxo só que totalizados por linha do fluxo}
      cdsTotal.Data  := CtrlMontaFluxo.GetTotalDados(sParams, cdsPeriodo, (fase = 2) );
      while not cdsTotal.eof do
      begin
        // busca a linha sintetica grau 4 do item
        if cdsSintetico.Locate('CODLINHAFLUXO', cdsTotal.FieldByName('codlinhafluxo').AsInteger, [loCaseInsensitive]) then
        begin
          // verifica se a linha ja existe
          case fase of
            1 : begin
                  if sParams.Quebra <> EmptyStr then
                     bExiste := _cdsFase.Locate('quebra;grupo;codlinhafluxo;flggrau',varArrayof([cdsTotal.fieldByName('QUEBRA').AsString, cdsTotal.FieldByName('grupo').AsInteger, cdsSintetico.FieldByName('codlinhafluxo').AsInteger, 4]), [loCaseInsensitive])
                  else
                     bExiste := _cdsFase.Locate('grupo;codlinhafluxo;flggrau', VarArrayOf([cdsTotal.FieldByName('grupo').AsInteger, cdsSintetico.FieldByName('codlinhafluxo').AsInteger,4]), [loCaseInsensitive]);
                end;
            2 : begin
                  if sParams.Quebra <> EmptyStr then
                     bExiste := _cdsFase.Locate('quebra;codlinhafluxo;flggrau',varArrayof([cdsTotal.fieldByName('QUEBRA').AsString, cdsSintetico.FieldByName('codlinhafluxo').AsInteger,4]), [loCaseInsensitive])
                  else
                     bExiste := _cdsFase.Locate('codlinhafluxo;flggrau', varArrayof([cdsSintetico.FieldByName('codlinhafluxo').AsInteger, 4]), [loCaseInsensitive]);
                end;
          end;

          if not bExiste then
          begin
            _cdsFase.Insert;
            if sParams.Quebra <> EmptyStr then
               _cdsFase.FieldByName('QUEBRA').AsString      := Trim(cdsTotal.fieldByName('QUEBRA').AsString);
            if fase = 1 then
               _cdsFase.FieldByName('GRUPO').AsString       := cdsTotal.fieldByName('GRUPO').AsString;
            _cdsFase.FieldByName('CODLINHAFLUXO').AsString  := cdsTotal.fieldByName('CODLINHAFLUXO').AsString;
            _cdsFase.FieldByName('FLGGRAU').AsInteger       := cdsSintetico.fieldByName('FLGGRAU').AsInteger;
            _cdsFase.FieldByName('ORDEM').AsString          := cdsSintetico.fieldByName('ORDEM').AsString;
            _cdsFase.FieldByName('LINHAFLUXO').AsString     := cdsSintetico.fieldByName('LINHAFLUXO').AsString;
            _cdsFase.FieldByName('RECPAG').AsString         := cdsTotal.fieldByName('RECPAG').AsString;

            // campos de valores (P1, P2, P3...
            for j := 1 to iNumCol do
            begin
              campo := 'P'+IntToStr(j);
              _cdsFase.FieldByName(campo).AsCurrency := cdsTotal.fieldByName(campo).AsCurrency;
            end;

            //Everson Cunha - SIG46608/88515 - Início
            campo := 'PT';
            _cdsFase.FieldByName(campo).AsCurrency := cdsTotal.fieldByName(campo).AsCurrency;
            //Everson Cunha - SIG46608/88515 - Fim

            _cdsFase.post;

          end
          else
          begin
            _cdsFase.Edit;

            // campos de valores (P1, P2, P3...
            for j := 1 to iNumCol do
            begin
              campo := 'P'+IntToStr(j);
              _cdsFase.FieldByName(campo).AsCurrency := cdsTotal.fieldByName(campo).AsCurrency;
            end;

            //Everson Cunha - SIG46608/88515 - Início
            campo := 'PT';
            _cdsFase.FieldByName(campo).AsCurrency := cdsTotal.fieldByName(campo).AsCurrency;
            //Everson Cunha - SIG46608/88515 - Fim

            _cdsFase.post;

          end;


          // localiza linha grau 3 do item
          if cdsSintetico.Locate('CODCOMPLINHA', cdsTotal.FieldByName('codlinhafluxo').AsInteger, [loCaseInsensitive]) then
          begin
            // verifica se a linha grau 3 ja existe no Fluxo
            case fase of
              1 : begin
                    if sParams.Quebra <> EmptyStr then
                       bExiste := _cdsFase.Locate('quebra;grupo;codlinhafluxo',varArrayof([cdsTotal.fieldByName('QUEBRA').AsString, cdsTotal.FieldByName('grupo').AsInteger, cdsSintetico.FieldByName('codlinhafluxo').AsInteger]), [loCaseInsensitive])
                    else
                       bExiste := _cdsFase.Locate('grupo;codlinhafluxo', VarArrayOf([cdsTotal.FieldByName('grupo').AsInteger, cdsSintetico.FieldByName('codlinhafluxo').AsInteger]), [loCaseInsensitive]);
                  end;
              2 : begin
                    if sParams.Quebra <> EmptyStr then
                       bExiste := _cdsFase.Locate('quebra;codlinhafluxo',varArrayof([cdsTotal.fieldByName('QUEBRA').AsString, cdsSintetico.FieldByName('codlinhafluxo').AsInteger]), [loCaseInsensitive])
                    else
                       bExiste := _cdsFase.Locate('codlinhafluxo', cdsSintetico.FieldByName('codlinhafluxo').AsInteger, [loCaseInsensitive]);
                  end;
            end;

            if bExiste then
               _cdsFase.Edit
            else
               _cdsFase.Insert;

            if sParams.Quebra <> EmptyStr then
               _cdsFase.FieldByName('QUEBRA').AsString      := Trim(cdsTotal.fieldByName('QUEBRA').AsString);
            if fase = 1 then
               _cdsFase.FieldByName('GRUPO').AsInteger      := cdsTotal.fieldByName('GRUPO').AsInteger;
            _cdsFase.FieldByName('CODLINHAFLUXO').AsString  := cdsSintetico.fieldByName('CODLINHAFLUXO').AsString;
            _cdsFase.FieldByName('FLGGRAU').AsInteger       := cdsSintetico.fieldByName('FLGGRAU').AsInteger;
            _cdsFase.FieldByName('ORDEM').AsString          := cdsSintetico.fieldByName('ORDEM').AsString;
            _cdsFase.FieldByName('LINHAFLUXO').AsString     := cdsSintetico.fieldByName('LINHAFLUXO').AsString;
            _cdsFase.FieldByName('RECPAG').AsString         := cdsTotal.fieldByName('RECPAG').AsString;
            // campos de valores (P1, P2, P3...
            for j := 1 to iNumCol do
            begin
              campo := 'P'+IntToStr(j);
              _cdsFase.FieldByName(campo).AsCurrency := _cdsFase.FieldByName(campo).AsCurrency + cdsTotal.fieldByName(campo).AsCurrency;
            end;

            //Everson Cunha - SIG46608/88515 - Início
            campo := 'PT';
            _cdsFase.FieldByName(campo).AsCurrency := _cdsFase.FieldByName(campo).AsCurrency + cdsTotal.fieldByName(campo).AsCurrency;
            //Everson Cunha - SIG46608/88515 - Fim

            _cdsFase.post;

          end;
        end;

        cdsTotal.next;
      end;

      // agrupa os dados grau 2 e 1
      for i := 2 downto 1 do
      begin
        // copia os dados do cdsFluxo ou cdsExporta
        _cdsAux.CloneCursor(_cdsFase, false, true);

        // aplica o filtro do grau nos itens copiados (grau do filtro será um acima do i)
        AtivaDesativaFiltro(_cdsAux, 'FLGGRAU = '+IntToStr(i+1));

        while not _cdsAux.eof do
        begin
          // busca o item sintetico do grau i (a linha a qual o item está associada) 
          if cdsSintetico.Locate('CODCOMPLINHA', _cdsAux.FieldByName('codlinhafluxo').AsInteger, [loCaseInsensitive]) then
          begin
            // verifica se a linha grau i ja existe no Fluxo
            case fase of
              1 : begin
                    if sParams.Quebra <> EmptyStr then
                       bExiste := _cdsFase.Locate('quebra;grupo;codlinhafluxo',varArrayof([_cdsAux.fieldByName('QUEBRA').AsString, _cdsAux.FieldByName('grupo').AsInteger, cdsSintetico.FieldByName('codlinhafluxo').AsInteger]), [loCaseInsensitive])
                    else
                       bExiste := _cdsFase.Locate('grupo;codlinhafluxo', VarArrayOf([_cdsAux.FieldByName('grupo').AsInteger, cdsSintetico.FieldByName('codlinhafluxo').AsInteger]), [loCaseInsensitive]);
                  end;
              2 : begin
                    if sParams.Quebra <> EmptyStr then
                       bExiste := _cdsFase.Locate('quebra;codlinhafluxo',varArrayof([_cdsAux.fieldByName('QUEBRA').AsString, cdsSintetico.FieldByName('codlinhafluxo').AsInteger]), [loCaseInsensitive])
                    else
                       bExiste := _cdsFase.Locate('codlinhafluxo', cdsSintetico.FieldByName('codlinhafluxo').AsInteger, [loCaseInsensitive]);
                  end;
            end;

            if bExiste then
               _cdsFase.Edit
            else
               _cdsFase.Insert;

            if sParams.Quebra <> EmptyStr then
               _cdsFase.FieldByName('QUEBRA').AsString      := Trim(_cdsAux.fieldByName('QUEBRA').AsString);
            if fase = 1 then
               _cdsFase.FieldByName('GRUPO').AsInteger      := _cdsAux.fieldByName('GRUPO').AsInteger;
            _cdsFase.FieldByName('CODLINHAFLUXO').AsString  := cdsSintetico.fieldByName('CODLINHAFLUXO').AsString;
            _cdsFase.FieldByName('FLGGRAU').AsInteger       := cdsSintetico.fieldByName('FLGGRAU').AsInteger;
            _cdsFase.FieldByName('ORDEM').AsString          := cdsSintetico.fieldByName('ORDEM').AsString;
            _cdsFase.FieldByName('LINHAFLUXO').AsString     := cdsSintetico.fieldByName('LINHAFLUXO').AsString;
            _cdsFase.FieldByName('RECPAG').AsString         := _cdsAux.fieldByName('RECPAG').AsString;
            // campos de valores (P1, P2, P3...
            for j := 1 to iNumCol do
            begin
              campo := 'P'+IntToStr(j);
              _cdsFase.FieldByName(campo).AsCurrency := _cdsFase.FieldByName(campo).AsCurrency + _cdsAux.fieldByName(campo).AsCurrency;
            end;

            //Everson Cunha - SIG46608/88515 - Início
            campo := 'PT';
            _cdsFase.FieldByName(campo).AsCurrency := _cdsFase.FieldByName(campo).AsCurrency + _cdsAux.fieldByName(campo).AsCurrency;
            //Everson Cunha - SIG46608/88515 - Fim

            _cdsFase.post;

          end;
          _cdsAux.next;
        end;
      end;
      // agrupa os dados grau 2 e 1
      Result := true
    except
      on E:Exception do
      begin
         Result := False;
         Application.MessageBox(Pchar(E.Message),'Atenção',Mb_IconStop);
      end;
    end;

  finally
    FreeAndNil(_cdsAux);
  end;
end;


function TfrmConsultaFluxosNovoMT.GeraDados_Fluxos: boolean;
var
  i     : integer;
  fase  : integer;
  campo : string;
  sDia  : string;
begin
  try
    // remove ordernacao
    cdsFluxos.IndexName  := '';
    cdsExporta.IndexName := '';

    // busca dados
    cdsFluxos.Data  := CtrlMontaFluxo.GetDadosFluxo(sParams, cdsPeriodo);
    cdsExporta.data := CtrlMontaFluxo.GetDadosFluxo(sParams, cdsPeriodo, true);

    // colocando label nos campos para as colunas de exportação
    if sParams.Quebra <> EmptyStr then
       cdsExporta.FieldByName('QUEBRA').DisplayLabel     := 'Quebra';
    cdsExporta.FieldByName('CODLINHAFLUXO').DisplayLabel := 'Codigo Linha';
    cdsExporta.FieldByName('FLGGRAU').DisplayLabel       := 'Grau';
    cdsExporta.FieldByName('ORDEM').DisplayLabel         := 'Ordem';
    cdsExporta.FieldByName('LINHAFLUXO').DisplayLabel    := 'Linha do Fluxo/Desembolso';
    cdsExporta.FieldByName('RECPAG').DisplayLabel        := 'Rec/Pag';
    cdsPeriodo.First;
    while not cdsPeriodo.eof do
    begin
      sDia := iif(tipoPeriodo = tpSemanal, cdsPeriodo.Fields[3].AsString, cdsPeriodo.Fields[0].AsString);

      if sParams.TipoRelat = trPrevxReal then
      begin
        i := (cdsPeriodo.Recno *2)-1;
        cdsExporta.FieldByName('P'+IntToStr(i)).DisplayLabel   := 'PREVISTO '+sDia;
        cdsExporta.FieldByName('P'+IntToStr(i+1)).DisplayLabel := 'REALIZADO '+sDia;
      end
      else
      begin
        i := cdsPeriodo.Recno;
        cdsExporta.FieldByName('P'+IntToStr(i)).DisplayLabel := sDia;
      end;

      cdsPeriodo.next;
    end;

    cdsExporta.FieldByName('PT').DisplayLabel := 'Total por Linha'; //Everson Cunha - SIG46608/88515

    // agrupa os dados grau 4 e 3
    for  fase := 1 to 2 do
    begin
      case fase of
        1 : TotalizaFluxo( cdsFluxos, fase );     // fase 1: gera linhas de totais (graus 4/3/2/1) para relatório (em 4 ou 8 colunas)
        2 : TotalizaFluxo( cdsExporta, fase );    // fase 1: gera linhas de totais (graus 4/3/2/1) para exportação (n colunas para período)
      end;

    end;

    Result := true;

  except
    on E:Exception do
    begin
       Result := False;
       Application.MessageBox(Pchar(E.Message),'Atenção',Mb_IconStop);
    end;
  end;

end;


procedure TfrmConsultaFluxosNovoMT.InsereLadoDireitoRelCompara(bPrimeiroReg  : boolean;
                                                               iGrupoDoc     : integer;
                                                               rColunaRel    : TTpColunaCompara;
                                                               sPeriodoBusca : string;
                                                               sPeriodo      : string;
                                                               var bExiste   : boolean;
                                                               var iQtdLanca : integer;
                                                               iOrdem        : integer;
                                                               sCodigo       : string;
                                                               sDescricao    : string;
                                                               rValor        : Currency;
                                                               bForcaLinha   : boolean;
                                                               var iUltVazia : integer);
var
  bTemLinha : boolean;
  bAcumula  : boolean;
  sCpoBusca : string;
  sValBusca : string;
begin
  bAcumula := (sDescricao = 'Sicov 6034') or (sDescricao = 'Sicov 6002');

  // se for 1o registro precisa emparelhar com a data da coluna esquerda (campo periodo)
  sCpoBusca := iif(bPrimeiroReg, 'PERIODO;', 'BUSCA;');
  sCpoBusca := sCpoBusca + iif(rColunaRel = tcTipoDesembRecebe, 'CODTIPRECDES', iif(bAcumula, 'FORCLI', 'CODDOCUMENTO'));
  sValBusca := iif(bPrimeiroReg, sPeriodo, sPeriodoBusca);

  qryCompara.first;
  if bForcaLinha then
     bTemLinha := false
  else if (sDescricao = 'Sicov 6034') or (sDescricao = 'Sicov 6002') then
     bTemLinha := qryCompara.locate(sCpoBusca+';GRUPODOC', VarArrayOf([sValBusca, sDescricao, iGrupoDoc]), [loCaseInsensitive])
  else
  begin
     if iUltVazia <> -1 then
        bTemLinha := qryCompara.locate(sCpoBusca+';GRUPODOC;ORDEM', VarArrayOf([sValBusca, '', iGrupoDoc, iUltVazia+1]), [loCaseInsensitive])
     else
        bTemLinha := qryCompara.locate(sCpoBusca+';GRUPODOC', VarArrayOf([sValBusca, '', iGrupoDoc]), [loCaseInsensitive]);
  end;

  // insere documento na coluna Especificação
  if bTemLinha then
  begin
    if bAcumula then
       iUltVazia := qryCompara.FieldByName('ORDEM').AsInteger;

    qryCompara.edit;
    if rColunaRel = tcTipoDesembRecebe then
    begin
      qryCompara.FieldByName('CODTIPRECDES').AsString  := sCodigo;
      qryCompara.FieldByName('DESEMBOLSO').AsString    := sDescricao;
      qryCompara.FieldByName('VLRBAIXA').AsCurrency    := rValor;
    end
    else
    begin
      qryCompara.FieldByName('CODDOCUMENTO').AsString  := sCodigo;
      qryCompara.FieldByName('FORCLI').AsString        := sDescricao;
      if bAcumula then
         qryCompara.FieldByName('VLRRATEIO').AsCurrency := qryCompara.FieldByName('VLRRATEIO').AsCurrency + rValor
      else
         qryCompara.FieldByName('VLRRATEIO').AsCurrency := rValor;
    end;
    qryCompara.Post;
  end
  else
  begin
    qryCompara.insert;
    qryCompara.FieldByName('ORDEM').AsInteger        := iQtdLanca;
    qryCompara.FieldByName('PERIODO').AsString       := iif(bExiste, '', sPeriodo);
    qryCompara.FieldByName('BUSCA').AsString         := sPeriodoBusca;
    qryCompara.FieldByName('USUARIO').AsString       := '';
    qryCompara.FieldByName('TIPORECDES').AsString    := '';
    qryCompara.FieldByName('VALOR').AsString         := '';

    qryCompara.FieldByName('GRUPODOC').AsInteger     := iGrupoDoc;

    if rColunaRel = tcTipoDesembRecebe then
    begin
      qryCompara.FieldByName('CODTIPRECDES').AsString  := sCodigo;
      qryCompara.FieldByName('DESEMBOLSO').AsString    := sDescricao;
      qryCompara.FieldByName('VLRBAIXA').AsCurrency    := rValor;
      qryCompara.FieldByName('CODDOCUMENTO').AsString  := '';
      qryCompara.FieldByName('FORCLI').AsString        := '';
      qryCompara.FieldByName('VLRRATEIO').AsString     := '';
    end
    else
    begin
      qryCompara.FieldByName('CODTIPRECDES').AsString  := '';
      qryCompara.FieldByName('DESEMBOLSO').AsString    := '';
      qryCompara.FieldByName('VLRBAIXA').AsString      := '';
      qryCompara.FieldByName('CODDOCUMENTO').AsString  := sCodigo;
      qryCompara.FieldByName('FORCLI').AsString        := sDescricao;
      qryCompara.FieldByName('VLRRATEIO').AsCurrency   := rValor;
    end;
    qryCompara.Post;
    inc(iQtdLanca);

  end;

  // inseriu a data referente ao período, altera flag para TRUE
  if not bExiste then
     bExiste := true;
end;


function TfrmConsultaFluxosNovoMT.GeraDados_Compara: boolean;
var
  _cdsSemDoc  : TCMClientDataSet;    // edilaine - SOL 250388 / PPM 722851
  _cdsDados   : TCMClientDataSet;
  _cdsPrev    : TCMClientDataSet;
  _cdsTotPrev : TCMClientDataSet;
  _cdsTotReal : TCMClientDataSet;
  _cdsDesRec  : TCMClientDataSet;
  _cdsDocxTRD : TCMClientDataSet;
  bExiste     : boolean;
  bTemDesemb  : boolean;
  bTemDado    : boolean;
  bTemLinha   : boolean;
  iQtdLanca   : integer;
  sDesembolso : string;
  sQuebra     : string;
  rVlrDesemb  : Currency;
  iVlrPercent : integer;
  rTotPrev    : Currency;
  rTotBaixa   : Currency;
  rTotRateio  : Currency;
  rVlrForCli  : Currency;
  lstQuebra   : TStringList;
  lstDocs     : TStringList;
  lstDesRec   : TStringList;
  nItens      : integer;
  oDataSet    : OleVariant;
  sForCli     : string;
  iQtdDocs, i : integer;
  sPeriodoBusca : string;
  bPrimeiroDoc  : boolean;
  bNovoDoc      : boolean;
  iUltVazia     : integer;
  bTemLancaDia  : boolean;  // edilaine - SOL 250388 / PPM 722851
begin
  Result := true;

  try
    try
      _cdsDados   := TCMClientDataSet.Create(self);
      _cdsPrev    := TCMClientDataSet.Create(self);
      _cdsTotPrev := TCMClientDataSet.Create(self);
      _cdsTotReal := TCMClientDataSet.Create(self);
      _cdsDesRec  := TCMClientDataSet.Create(self);
      _cdsDocxTRD := TCMClientDataSet.Create(self);
      _cdsSemDoc  := TCMClientDataSet.Create(self);    // edilaine - SOL 250388 / PPM 722851

      lstQuebra   := TStringList.create;
      lstDocs     := TStringList.create;
      lstDesRec   := TStringList.create;

      // criando estrutura
      cdsCompara.IndexName := '';
      cdsCompara.Data      := CtrlMontaFluxo.GetEstruturaCompara();
      cdsCompara.EmptyDataSet;

      qryCompara.Close;
      qryCompara.Open;

      cdsQuadro.data  := CtrlMontaFluxo.GetEstruturaQuadro();
      cdsQuadro.EmptyDataSet;

      // colocando label nos campos para as colunas de exportação
      if sParams.Quebra <> EmptyStr then
         cdsCompara.FieldByName('QUEBRA').DisplayLabel  := 'Quebra';
      cdsCompara.FieldByName('ORDEM').DisplayLabel      := 'Ordenação';
      cdsCompara.FieldByName('BUSCA').DisplayLabel      := 'Compara período';
      cdsCompara.FieldByName('PERIODO').DisplayLabel    := 'Período';
      cdsCompara.FieldByName('USUARIO').DisplayLabel    := 'Usuário';
      cdsCompara.FieldByName('TIPORECDES').DisplayLabel := iif(sParams.tipoDoc = 'R', 'Recebimento', 'Desembolso')+' / Linha do Fluxo';
      cdsCompara.FieldByName('VALOR').DisplayLabel      := 'Valor';
      cdsCompara.FieldByName('DESEMBOLSO').DisplayLabel := iif(sParams.tipoDoc = 'R', 'Tipo de Recebimento', 'Tipo de Desembolso');
      cdsCompara.FieldByName('VLRBAIXA').DisplayLabel   := 'Valor';
      cdsCompara.FieldByName('FORCLI').DisplayLabel     := 'Especificação do '+iif(sParams.tipoDoc = 'R', 'Recebimento', 'Pagamento');
      cdsCompara.FieldByName('VLRRATEIO').DisplayLabel  := 'Valor';

      // dados
      _cdsPrev.data    := CtrlMontaFluxo.GetDadosComparaPrevisto(sParams);
      _cdsDados.Data   := CtrlMontaFluxo.GetDadosFluxo(sParams, cdsPeriodo);
      _cdsTotPrev.data := CtrlMontaFluxo.GetTotalCompara(trPrevisto, sParams);
      _cdsTotReal.data := CtrlMontaFluxo.GetTotalCompara(trCompara, sParams);

      _cdsSemDoc.Data  := CtrlMontaFluxo.GetDadosFluxo(sParams, cdsPeriodo, false, true);    // edilaine - SOL 250388 / PPM 722851

      // monta relatorio comparação
      cdsPeriodo.first;
      while not cdsPeriodo.eof do
      begin
        sPeriodoBusca := FormatDateTime('YYYYMMDD', cdsPeriodo.Fields[0].AsDateTime);

        rTotPrev   := 0;
        rTotBaixa  := 0;
        rTotRateio := 0;
        rVlrDesemb := 0;
        rVlrForCli := 0;

        iQtdLanca := 1;

        bTemLancaDia := false;   // edilaine - SOL 250388 / PPM 722851

        // -------------------------------------------------------------------- lado direito
        { - buscar desembolsos/recebimentos no movimento financeiro do dia
          - buscar documentos baixados no dia
          - buscar desembolsos associados por documento

          1. insere documento na coluna Especificação
          2. pesquisa desembolsos/recebimentos associados ao documento inserido
          3. insere desembolsos/recebimentos do documento
             - a cada desembolso, verifica se há outros documentos associados (volta passo 1)
        }
        // filtra lançamentos financeiros do dia
        _cdsDados.Filtered := false;
        _cdsDados.Filter   := '(PERIODO = '+Quotedstr(cdsPeriodo.FieldByName('PERIODO').AsString) + ')';
        _cdsDados.Filtered := true;
        if not _cdsDados.isEmpty then
        begin
          // inicia contador de documentos
          iQtdDocs     := 0;
          bPrimeiroDoc := true;

          // verifica se precisa preencher o campo PERÍODO (caso o lado esquerdo não tenha dados)
          bExiste := qryCompara.Locate('PERIODO', cdsPeriodo.FieldByName('PERIODO').AsString, [loCaseInsensitive]);

          // consulta documentos x desembolsos/recebimentos do dia
          _cdsDocxTRD.data := CtrlMontaFluxo.GetDocumentosxDesembReceb(sParams, cdsPeriodo.FieldByName('PERIODO').AsString);

          // busca documentos pagos/recebidos no dia
          _cdsDesRec.data :=  CtrlMontaFluxo.GetDocumentosCompara(sParams, cdsPeriodo.FieldByName('PERIODO').AsString, '');

          AtivaDesativaFiltro(_cdsDesRec, 'LANCADO = ''N'' ');

          lstDocs.clear;

          if  not _cdsDesRec.isEmpty then
          begin

            repeat

              // se não tiver nenhum doc na lista, pega o proximo disponivel na relação de documentos
              if lstDocs.Count = 0 then
              begin
                _cdsDesRec.first;
                lstDocs.Add( _cdsDesRec.FieldByName('CODDOCUMENTO').AsString );
                bNovoDOC := true;
                inc(iQtdDocs);
                iUltVazia := -1;
              end
              else
                bNovoDOC := false;

              // insere documento na coluna Especificação
              if _cdsDesRec.Locate('CODDOCUMENTO', lstDocs.Strings[0], [loCaseInsensitive]) then
              begin
                if not bTemLancaDia then    // edilaine - SOL 250388 / PPM 722851
                   bTemLancaDia := true;

                InsereLadoDireitoRelCompara(bPrimeiroDoc,
                                            iQtdDocs,
                                            tcEspecificaDoc,
                                            sPeriodoBusca,
                                            cdsPeriodo.FieldByName('PERIODO').AsString,
                                            bExiste,
                                            iQtdLanca,
                                            0,
                                            _cdsDesRec.FieldByName('CODDOCUMENTO').AsString,
                                            _cdsDesRec.FieldByName('CEDENTE').AsString,
                                            _cdsDesRec.FieldByName('VLRDOC').AsCurrency,
                                            bNovoDOC,
                                            iUltVazia);

                rTotRateio := rTotRateio + _cdsDesRec.FieldByName('VLRDOC').AsCurrency;
              end;

              // primeiro cria uma lista dos desembolsos/recebimentos vinculados ao documento
              lstDesRec.clear;
              AtivaDesativaFiltro(_cdsDocxTRD, 'CODDOCUMENTO = '+Trim( lstDocs.Strings[0] ) );
              while not _cdsDocxTRD.eof do
              begin
                if not qryCompara.Locate('busca;codtiprecdes', VarArrayOf([sPeriodoBusca, _cdsDocxTRD.FieldByName('CODTIPRECDES').AsString]), [loCaseInsensitive]) then
                   lstDesRec.Add( _cdsDocxTRD.FieldByName('CODTIPRECDES').AsString );
                _cdsDocxTRD.next;
              end;
              AtivaDesativaFiltro(_cdsDocxTRD, '');

              // insere desembolsos/recebimentos do documento
              for i := 0 to lstDesRec.count-1 do
              begin
                // localiza o desembolso/recebimento
                if _cdsDados.Locate('CODTIPRECDES',  lstDesRec.Strings[i], [loCaseInsensitive]) then
                begin

                  // insere dados na coluna Tipo Desembolso/Recebimento
                  InsereLadoDireitoRelCompara(bPrimeiroDoc,
                                              iQtdDocs,
                                              tcTipoDesembRecebe,
                                              sPeriodoBusca,
                                              cdsPeriodo.FieldByName('PERIODO').AsString,
                                              bExiste,
                                              iQtdLanca,
                                              0,
                                              _cdsDados.FieldByName('CODTIPRECDES').AsString,
                                              _cdsDados.FieldByName('DESEMBOLSO').AsString,
                                              _cdsDados.FieldByName('VLRBAIXA').AsCurrency,
                                              false,
                                              iUltVazia);

                  rTotBaixa := rTotBaixa + _cdsDados.FieldByName('VLRBAIXA').AsCurrency;

                  if bPrimeiroDoc then
                     bPrimeiroDoc := false;
                end;

                // verifica se há outros documentos vinculados ao desembolso
                AtivaDesativaFiltro(_cdsDocxTRD, '(CODDOCUMENTO <> '+lstDocs.Strings[0] + ') and (CODTIPRECDES = '+Quotedstr(lstDesRec.Strings[i])+')' );
                while not _cdsDocxTRD.eof do
                begin
                  if not qryCompara.Locate('busca;CODDOCUMENTO', VarArrayOf([sPeriodoBusca, _cdsDocxTRD.FieldByName('CODDOCUMENTO').AsString]), [loCaseInsensitive]) then
                     lstDocs.Add( _cdsDocxTRD.FieldByName('CODDOCUMENTO').AsString );

                  _cdsDocxTRD.next;
                end;
                AtivaDesativaFiltro(_cdsDocxTRD, '');
              end;

              // marca como lancado sempre o 1o documento da lista, que será eliminado pelo filtro ativado no inicio da rotina
              if _cdsDesRec.Locate('CODDOCUMENTO', lstDocs.Strings[0], [loCaseInsensitive]) then
              begin
                _cdsDesRec.edit;
                _cdsDesRec.FieldByName('LANCADO').AsString := 'S';
                _cdsDesRec.Post;
              end;
              // apagar o documento da lista (sempre o 1o)
              lstDocs.Delete(0);

            until  _cdsDesRec.eof;

          end;

          // edilaine - SOL 250388 / PPM 722851 - INICIO
          {* lançamentos que não possuem documentos vinculados ao desembolso/recebimento *}
          _cdsSemDoc.Filtered := false;
          _cdsSemDoc.Filter   := '(PERIODO = '+Quotedstr(cdsPeriodo.FieldByName('PERIODO').AsString) + ')';
          _cdsSemDoc.Filtered := true;
          while not _cdsSemDoc.eof do
          begin
            { verifica se todos os desembolsos estão no arquivo }
            if not qryCompara.Locate('busca;codtiprecdes', VarArrayOf([sPeriodoBusca, _cdsSemDoc.FieldByName('CODTIPRECDES').AsString]), [loCaseInsensitive]) then
            begin
              if not bTemLancaDia then
              begin
                bTemLancaDia := true;
                inc(iQtdDocs);           // edilaine - SOL 255386 / PPM 818743
              end;

              // insere dados na coluna Tipo Desembolso/Recebimento
              InsereLadoDireitoRelCompara(bPrimeiroDoc,
                                          iQtdDocs,
                                          tcTipoDesembRecebe,
                                          sPeriodoBusca,
                                          cdsPeriodo.FieldByName('PERIODO').AsString,
                                          bExiste,
                                          iQtdLanca,
                                          0,
                                          _cdsSemDoc.FieldByName('CODTIPRECDES').AsString,
                                          _cdsSemDoc.FieldByName('DESEMBOLSO').AsString,
                                          _cdsSemDoc.FieldByName('VLRBAIXA').AsCurrency,
                                          false,
                                          iUltVazia);

              rTotBaixa := rTotBaixa + _cdsSemDoc.FieldByName('VLRBAIXA').AsCurrency;
            end;
            _cdsSemDoc.next;
          end;
          // edilaine - SOL 250388 / PPM 722851 - FIM

        end; // edilaine - SOL 255386 / PPM 818743

        // ------------------------------------------------------------------- lado esquerdo
        _cdsPrev.Filtered := false;
        _cdsPrev.Filter   := '(PERIODO = '+Quotedstr(cdsPeriodo.Fields[0].AsString) +')';
        _cdsPrev.Filtered := true;
        if not _cdsPrev.isEmpty then
        begin

          if not bTemLancaDia then   // edilaine - SOL 250388 / PPM 722851
             bTemLancaDia := true;

          // preenche lado esquerdo
          while not _cdsPrev.eof do
          begin
            // verifica se precisa preencher o o campo Periodo (só deve ser preenchido uma vez por dia)
            bExiste := qryCompara.Locate('PERIODO', _cdsPrev.FieldByName('PERIODO').AsString, [loCaseInsensitive]);

            // se for 1o registro emparelha com a data da coluna esquerda
            if _cdsPrev.recno = 1 then
               bTemLinha := qryCompara.locate('PERIODO;TIPORECDES;ORDEM', VarArrayOf([cdsPeriodo.FieldByName('PERIODO').AsString, '', _cdsPrev.recno]), [loCaseInsensitive])
            else
               bTemLinha := qryCompara.locate('BUSCA;TIPORECDES;ORDEM', VarArrayOf([sPeriodoBusca, '', _cdsPrev.recno]), [loCaseInsensitive]);

            if bTemLinha then
            begin
              qryCompara.Edit;
              qryCompara.FieldByName('USUARIO').AsString       := _cdsPrev.FieldByName('USUARIO').AsString;
              qryCompara.FieldByName('TIPORECDES').AsString    := _cdsPrev.FieldByName('LINHAFLUXO').AsString;
              qryCompara.FieldByName('VALOR').AsCurrency       := _cdsPrev.FieldByName('VALOR').AsCurrency;
              qryCompara.post;
            end
            else
            begin
              qryCompara.Insert;
              qryCompara.FieldByName('ORDEM').AsInteger        := iQtdLanca;
              qryCompara.FieldByName('PERIODO').AsString       := iif(bExiste, '', _cdsPrev.FieldByName('PERIODO').AsString);
              qryCompara.FieldByName('BUSCA').AsString         := sPeriodoBusca;
              qryCompara.FieldByName('USUARIO').AsString       := _cdsPrev.FieldByName('USUARIO').AsString;
              qryCompara.FieldByName('TIPORECDES').AsString    := _cdsPrev.FieldByName('LINHAFLUXO').AsString;
              qryCompara.FieldByName('VALOR').AsCurrency       := _cdsPrev.FieldByName('VALOR').AsCurrency;
              qryCompara.FieldByName('GRUPODOC').AsInteger     := 0;
              qryCompara.FieldByName('CODTIPRECDES').AsString  := '';
              qryCompara.FieldByName('DESEMBOLSO').AsString    := '';
              qryCompara.FieldByName('VLRBAIXA').AsString      := '';
              qryCompara.FieldByName('CODDOCUMENTO').AsInteger := _cdsPrev.recno;
              qryCompara.FieldByName('FORCLI').AsString        := '';
              qryCompara.FieldByName('VLRRATEIO').AsString     := '';
              qryCompara.Post;
              inc(iQtdLanca);
            end;

            rTotPrev := rTotPrev + _cdsPrev.FieldByName('VALOR').AsCurrency;

            _cdsPrev.next;
          end;
        end;

        //end;    // edilaine - SOL 255386 / PPM 818743 - comentado

        // linha de total
        //if (not _cdsDados.isEmpty) or (not _cdsprev.isEmpty) then             // edilaine - SOL 250388 / PPM 722851 - comentado
        if bTemLancaDia then                                                    // edilaine - SOL 250388 / PPM 722851
        begin
          inc(iQtdDocs);
          qryCompara.insert;
          qryCompara.FieldByName('ORDEM').AsInteger      := iQtdLanca;
          qryCompara.FieldByName('PERIODO').AsString     := 'Total';
          qryCompara.FieldByName('BUSCA').AsString       := sPeriodoBusca;
          qryCompara.FieldByName('USUARIO').AsString     := '';
          qryCompara.FieldByName('GRUPODOC').AsInteger   := iQtdDocs;
          qryCompara.FieldByName('TIPORECDES').AsString  := '';
          qryCompara.FieldByName('VALOR').AsCurrency     := rTotPrev;
          qryCompara.FieldByName('DESEMBOLSO').AsString  := 'Total';
          qryCompara.FieldByName('VLRBAIXA').AsCurrency  := rTotBaixa;
          qryCompara.FieldByName('FORCLI').AsString      := 'Total';
          qryCompara.FieldByName('VLRRATEIO').AsCurrency := rTotRateio;
          qryCompara.Post;
          inc(iQtdLanca);
        end;

        cdsPeriodo.next;
      end;


      // quadro
      cdsPeriodo.First;
      while not cdsPeriodo.eof do
      begin

        sPeriodoBusca := FormatDateTime('YYYYMMDD', cdsPeriodo.Fields[0].AsDateTime);

        if _cdsTotPrev.Locate('PERIODO', cdsPeriodo.Fields[0].AsString, [loCaseInsensitive]) then
        begin
          cdsQuadro.insert;
          cdsQuadro.FieldByName('PERIODO').AsString      := copy(cdsPeriodo.Fields[0].AsString,1,2);
          cdsQuadro.FieldByName('DATA').AsString         := cdsPeriodo.Fields[0].AsString;
          cdsQuadro.FieldByName('BUSCA').AsString        := sPeriodoBusca;
          cdsQuadro.FieldByName('PREVISTO').AsCurrency   := _cdsTotPrev.Fields[1].AsCurrency;
          cdsQuadro.FieldByName('REALIZADO').AsCurrency  := 0;
          cdsQuadro.FieldByName('PERCENTUAL').AsCurrency := 0;
          cdsQuadro.FieldByName('REFERENCIA').AsInteger  := 100;
          cdsQuadro.FieldByName('FXLIMITESUP').AsInteger := 110;
          cdsQuadro.FieldByName('FXLIMITEINF').AsInteger := 90;
          cdsQuadro.post;
        end;

        //if _cdsTotReal.Locate('PERIODO', cdsPeriodo.Fields[0].AsString, [loCaseInsensitive]) then            // edilaine - SOL 250388 / PPM 722851 - comentado
        if qryCompara.Locate('PERIODO;BUSCA', VarArrayOf(['Total',sPeriodoBusca]), [loCaseInsensitive]) then   // edilaine - SOL 250388 / PPM 722851
        begin
          if not cdsQuadro.Locate('DATA', cdsPeriodo.Fields[0].AsString, [loCaseInsensitive]) then
          begin
            cdsQuadro.insert;
            cdsQuadro.FieldByName('PERIODO').AsString      := copy(cdsPeriodo.Fields[0].AsString,1,2);
            cdsQuadro.FieldByName('DATA').AsString         := cdsPeriodo.Fields[0].AsString;
            cdsQuadro.FieldByName('BUSCA').AsString        := sPeriodoBusca;
            cdsQuadro.FieldByName('PREVISTO').AsCurrency   := 0;
            cdsQuadro.FieldByName('REFERENCIA').AsInteger  := 100;
            cdsQuadro.FieldByName('FXLIMITESUP').AsInteger := 110;
            cdsQuadro.FieldByName('FXLIMITEINF').AsInteger := 90;
            cdsQuadro.Post;
          end;

          // edilaine - SOL 250388 / PPM 722851 - inicio
          //if _cdsTotReal.Fields[1].AsCurrency <> 0 then
          //   iVlrPercent := Round( (cdsQuadro.FieldByName('PREVISTO').AsCurrency *100) / _cdsTotReal.Fields[1].AsCurrency)
          if qryCompara.FieldByName('VLRBAIXA').AsCurrency <> 0 then
             iVlrPercent := Round( (cdsQuadro.FieldByName('PREVISTO').AsCurrency *100) / qryCompara.FieldByName('VLRBAIXA').AsCurrency)
          else
             iVlrPercent := Round( (cdsQuadro.FieldByName('PREVISTO').AsCurrency *100) / 1 );
          // edilaine - SOL 250388 / PPM 722851 - fim

          cdsQuadro.edit;
          //cdsQuadro.FieldByName('REALIZADO').AsCurrency  := _cdsTotReal.Fields[1].AsCurrency;               // edilaine - SOL 250388 / PPM 722851 - comentado
          cdsQuadro.FieldByName('REALIZADO').AsCurrency  := qryCompara.FieldByName('VLRBAIXA').AsCurrency;    // edilaine - SOL 250388 / PPM 722851
          cdsQuadro.FieldByName('PERCENTUAL').AsInteger  := iVlrPercent;
          cdsQuadro.Post;
        end;
        cdsPeriodo.next;
      end;

      qryCompara.first;
      cdsQuadro.first;

    except
      on E:Exception do
      begin
         Result := False;
         Application.MessageBox(Pchar(E.Message),'Atenção',Mb_IconStop);
      end;
    end;
    
  finally
    FreeAndNil(_cdsDados);
    FreeAndNil(_cdsPrev);
    FreeAndNil(_cdsTotPrev);
    FreeAndNil(_cdsTotReal);
    FreeAndNil(_cdsSemDoc);       // edilaine - SOL 250388 / PPM 722851
  end;

end;


procedure TfrmConsultaFluxosNovoMT.GetParametros;
var
  iFiltro, i : byte;
  sValor     : string;
begin
  LimpaParametros();

  sParams.iIdFluxo := iIdFluxo;

  // setando tipo de relatorio
  if      rbPrevisto.Checked  then sParams.TipoRelat := trPrevisto
  else if rbRealizado.Checked then sParams.TipoRelat := trRealizado
  else if rbPrevxReal.Checked then sParams.TipoRelat := trPrevxReal
  else if rbCompara.Checked   then sParams.TipoRelat := trCompara;

  // filtros para apresentar nos relatorios
  cdsFiltros.EmptyDataSet;
  cdsFiltros.Insert;
  cdsFiltrosDataIni.AsString   := DateToStr(deDatIni.Date);
  cdsFiltrosDataFim.AsString   := DateToStr(deDatFim.Date);
  cdsFiltrosLinhaIni.AsString  := dblcLinhaIni.Text;
  cdsFiltrosLinhaFim.AsString  := dblcLinhaFim.Text;

  iFiltro := 1;
  for i := 1 to 6 do
  begin
    sValor := '';
    case i of
      1 : if dblcDiretoria.Text <> EmptyStr    then sValor := 'Diretoria: '+dblcDiretoria.Text;
      2 : if dblcUnidNegoc.Text <> EmptyStr    then sValor := 'Atividade/Projeto: '+dblcUnidNegoc.Text;
      3 : if dblcCentroRespon.Text <> EmptyStr then sValor := 'Centro de Responsabilidade: '+dblcCentroRespon.Text;
      4 : if dblcCentCust.Text <> EmptyStr     then sValor := 'Centro de Custo: '+dblcCentCust.Text;
      5 : if dblcPatrocinador.text <> EmptyStr then sValor := 'Patrocinadora: '+dblcPatrocinador.Text;
      6 : if dblcPlano.text <> EmptyStr        then sValor := 'Plano Previdenciário: '+dblcPlano.Text;
    end;
    if sValor <> EmptyStr then
    begin
      if iFiltro = 1 then
         cdsFiltrosTitFiltro.AsString := '[FILTROS]';
         
      cdsFiltros.FieldByName('Filtro'+InttoStr(iFiltro)).AsString := sValor;
      inc(iFiltro);
    end;
  end;

  case sParams.TipoRelat of
    trPrevisto  : cdsFiltrosNOMEREL.AsString := 'Fluxo Previsto ';
    trRealizado : cdsFiltrosNOMEREL.AsString := 'Fluxo Realizado ';
    trPrevxReal : cdsFiltrosNOMEREL.AsString := 'Fluxo Previsto x Realizado ';
  end;
  case tipoPeriodo of
    tpDiario  : cdsFiltrosNOMEREL.AsString := cdsFiltrosNOMEREL.AsString + ' Diário';
    tpSemanal : cdsFiltrosNOMEREL.AsString := cdsFiltrosNOMEREL.AsString + ' Semanal';
    tpMensal  : cdsFiltrosNOMEREL.AsString := cdsFiltrosNOMEREL.AsString + ' Mensal';
    tpAnual   : cdsFiltrosNOMEREL.AsString := cdsFiltrosNOMEREL.AsString + ' Anual';  //Cássio Rovaroto - SIG nº 96575
  end;
  cdsFiltros.Post;

  // tipo documento
  case rgDocs.ItemIndex of
    0 : sParams.tipoDoc := '';
    1 : sParams.tipoDoc := 'P';
    2 : sParams.tipoDoc := 'R';
  end;
  // grau de detalhamento
  if sParams.TipoRelat <> trCompara then
     sParams.sGrau := edtGrau.text;
  // linha inicial
  if dblcLinhaIni.Value <> '' then
     sParams.sLinhaIni := iif(dblcLinhaIni.Text <> Emptystr, dblcLinhaIni.LookUpValue, '');
  // linha final
  if dblcLinhaFim.Value <> '' then
     sParams.sLinhaFim := iif(dblcLinhaFim.Text <> Emptystr, dblcLinhaFim.LookUpValue, '');
  // datas
  sParams.sDataIni  := DateToStr(deDatIni.Date);
  sParams.sDataFim  := DateToStr(deDatFim.Date);
  // diretoria
  if dblcDiretoria.Value <> '' then
     sParams.CodDiretoria  := dblcDiretoria.LookUpValue;
  // Atividade
  if dblcUnidNegoc.Value <> '' then
     sParams.iAtividade    := StrToIntDef(dblcUnidNegoc.LookUpValue, 0);
  // Centro de Responsabilidade
  if dblcCentroRespon.Value <> '' then
     sParams.iCentroResp   := StrToIntDef(dblcCentroRespon.LookUpValue, -1);
  // Centro de Custo
  if dblcCentCust.Value <> '' then
     sParams.iCentCusto    := StrToIntDef(dblcCentCust.LookUpValue, -1);
  // Patrocinadora
  if dblcPatrocinador.Value <> '' then
     sParams.iPatro        := StrToIntDef(dblcPatrocinador.LookUpValue, -1);
  // Plano Previdenciario
  if dblcPlano.Value  <> '' then
     sParams.iPlano        := StrToIntDef(dblcPlano.LookupValue, -1);
  // Agrupamentos
  sParams.Agrupa        := tipoPeriodo;

  // Quebra
  sParams.Quebra     := '';
  sParams.nomeQuebra := '';

  if rbQuebraCC.Checked   then        // 'CODCENTROCUSTO'
  begin
    sParams.Quebra     := 'CCUSTO';
    sParams.nomeQuebra := 'Centro de Custo';
  end
  else if rbQuebraCR.Checked   then   // 'CODCENTRORESPON'
  begin
    sParams.Quebra     := 'CRESPON';
    sParams.nomeQuebra := 'Centro de Responsabilidade';
  end
  else if rbQuebraPlan.Checked then
  begin                               // 'IDPLANOPREV';
    sParams.Quebra     := 'PLANOPREV';
    sParams.nomeQuebra := 'Plano Previdenciário';
  end;

  if (rbQuebraCR.Checked) and (sParams.TipoRelat = trCompara) then
     sParams.Quebra := '';

  // orientacao
  sParams.OrientaImp := opRetrato;
  if sParams.TipoRelat = trCompara then
     sParams.OrientaImp := opPaisagem;

   sParams.bSintetico := chkSintetico.Checked;

end;

procedure TfrmConsultaFluxosNovoMT.AtivaDesativaFiltro(var _cds: TCMClientDataSet; sFiltro: string);
begin
  _cds.Filtered := false;
  _cds.filter   := sFiltro;
  if sFiltro <> EmptyStr then
     _cds.Filtered := true;
end;

procedure TfrmConsultaFluxosNovoMT.bndRHeaderBeforePrint(
  Sender: TObject);
begin
  inherited;
  case sParams.OrientaImp of
   opRetrato  : bndRHeader.Height := 39.158;
   opPaisagem : bndPHeader.Height := 39.158;
  end;

  if cdsFiltrosFiltro2.AsString <> EmptyStr then
  begin
    if sParams.OrientaImp = opRetrato then
    begin
      ppDFiltro2.Top  := ppDFiltro1.Top + ppDFiltro1.Height + 0.427;
      ppDFiltro2.Left := ppDFiltro1.Left;
    end
    else
    begin
      ppPFiltro2.Top  := ppPFiltro1.Top + ppPFiltro1.Height + 0.427;
      ppPFiltro2.Left := ppPFiltro1.Left;
    end;
  end;
  if cdsFiltrosFiltro3.AsString <> EmptyStr then
  begin
    if sParams.OrientaImp = opRetrato then
    begin
      ppDFiltro3.Top  := ppDFiltro2.Top + ppDFiltro2.Height + 0.427;
      ppDFiltro3.Left := ppDFiltro2.Left;
    end
    else
    begin
      ppPFiltro3.Top  := ppPFiltro2.Top + ppPFiltro2.Height + 0.427;
      ppPFiltro3.Left := ppPFiltro2.Left;
    end;
  end;
  if cdsFiltrosFiltro4.AsString <> EmptyStr then
  begin
    if sParams.OrientaImp = opRetrato then
    begin
      ppDFiltro4.Top  := ppDFiltro3.Top + ppDFiltro3.Height + 0.427;
      ppDFiltro4.Left := ppDFiltro3.Left;
    end
    else
    begin
      ppPFiltro4.Top  := ppPFiltro3.Top + ppPFiltro3.Height + 0.427;
      ppPFiltro4.Left := ppPFiltro3.Left;
    end;
  end;
  if cdsFiltrosFiltro5.AsString <> EmptyStr then
  begin
    if sParams.OrientaImp = opRetrato then
    begin
      ppDFiltro5.Top  := ppDFiltro4.Top + ppDFiltro4.Height + 0.427;
      ppDFiltro5.Left := ppDFiltro4.Left;
    end
    else
    begin
      ppPFiltro5.Top  := ppPFiltro4.Top + ppPFiltro4.Height + 0.427;
      ppPFiltro5.Left := ppPFiltro4.Left;
    end;
  end;
  if cdsFiltrosFiltro6.AsString <> EmptyStr then
  begin
    if sParams.OrientaImp = opRetrato then
    begin
      ppDFiltro6.Top  := ppDFiltro5.Top + ppDFiltro5.Height + 0.427;
      ppDFiltro6.Left := ppDFiltro5.Left;
    end
    else
    begin
      ppPFiltro6.Top  := ppPFiltro5.Top + ppPFiltro5.Height + 0.427;
      ppPFiltro6.Left := ppPFiltro5.Left;
    end;
  end;
end;

procedure TfrmConsultaFluxosNovoMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  // limpando controles
  // --- datas
  deDatIni.date := 0;
  deDatFim.date := 0;

  // --- tipo de relatorio
  rbPrevisto.Checked  := false;
  rbRealizado.Checked := false;
  rbPrevxReal.Checked := false;
  rbCompara.Checked   := false;

  // --- tipo de documento
  rgDocs.ItemIndex := -1;

  // --- Grau
  edtGrau.Value := 5;

  // --- linhas
  dblcLinhaIni.Clear;
  dblcLinhaFim.Clear;

  // --- filtros
  dblcDiretoria.clear;
  dblcUnidNegoc.clear;
  dblcCentroRespon.clear;
  dblcCentCust.clear;
  dblcPatrocinador.clear;
  dblcPlano.clear;

  // --- quebra
  rbQuebraNao.Checked := true;

  // --- agrupamento
  rgAgrupa.ItemIndex := -1;

  edtGrau.enabled      := true;
  dblcLinhaIni.enabled := true;
  dblcLinhaFim.enabled := true;

  LimpaParametros();
end;

procedure TfrmConsultaFluxosNovoMT.LimpaParametros;
begin
  sParams.tipoDoc      := '';
  sParams.sGrau        := '';
  sParams.sLinhaIni    := '';
  sParams.sLinhaFim    := '';
  sParams.sDataIni     := '';
  sParams.sDataFim     := '';
  sParams.CodDiretoria := '';
  sParams.iAtividade   := 0;
  sParams.iCentroResp  := -1;
  sParams.iCentCusto   := -1;
  sParams.iPatro       := -1;
  sParams.iPlano       := -1;
  sParams.TipoRelat    := trNone;
  sParams.Agrupa       := tpNone;
  sParams.Quebra       := '';
end;

procedure TfrmConsultaFluxosNovoMT.dbRDia1Print(Sender: TObject);
begin
  inherited;
  if cdsFluxos.FindField( TppDBText(sender).DataField ) <> nil then
  begin
    if cdsFluxos.FieldByName( TppDBText(sender).DataField ).AsCurrency < 0 then
       TppDBText(sender).Font.Color := clRed
    else
       TppDBText(sender).Font.Color := clBlack;

    //SIG88013 -Inicio
    if (TppDBText(sender)= dbRDia1) and (rbRealizado.CheCked) then
    begin
      dbRDia1.DataField:= 'P' + IntToStr((cdsFluxos.FieldByName('GRUPO').AsInteger));
      dbRDia2.DataField:= 'P' + IntToStr((cdsFluxos.FieldByName('GRUPO').AsInteger + 1));
      dbRDia3.DataField:= 'P' + IntToStr((cdsFluxos.FieldByName('GRUPO').AsInteger + 2));
      dbRDia4.DataField:= 'P' + IntToStr((cdsFluxos.FieldByName('GRUPO').AsInteger + 3));
    end;
    //SIG88013 -Fim
  end;
end;

procedure TfrmConsultaFluxosNovoMT.dbPDia1Print(Sender: TObject);
begin
  inherited;
  if cdsFluxos.FindField( TppDBText(sender).DataField ) <> nil then
  begin
    if cdsFluxos.FieldByName( TppDBText(sender).DataField ).AsCurrency < 0 then
       TppDBText(sender).Font.Color := clRed
    else
       TppDBText(sender).Font.Color := clBlack;

    //SIG88013 -Inicio
    if (TppDBText(sender) = dbPDia1) and (rbRealizado.CheCked) then
    begin
      dbPDia1.DataField:= 'P' + IntToStr((cdsFluxos.FieldByName('GRUPO').AsInteger));
      dbPDia2.DataField:= 'P' + IntToStr((cdsFluxos.FieldByName('GRUPO').AsInteger + 1));
      dbPDia3.DataField:= 'P' + IntToStr((cdsFluxos.FieldByName('GRUPO').AsInteger + 2));
      dbPDia4.DataField:= 'P' + IntToStr((cdsFluxos.FieldByName('GRUPO').AsInteger + 3));
      dbPDia5.DataField:= 'P' + IntToStr((cdsFluxos.FieldByName('GRUPO').AsInteger + 4));
      dbPDia6.DataField:= 'P' + IntToStr((cdsFluxos.FieldByName('GRUPO').AsInteger + 5));
      dbPDia7.DataField:= 'P' + IntToStr((cdsFluxos.FieldByName('GRUPO').AsInteger + 6));
      dbPDia8.DataField:= 'P' + IntToStr((cdsFluxos.FieldByName('GRUPO').AsInteger + 7));
    end;
    //SIG88013 -Fim
  end;
end;


procedure TfrmConsultaFluxosNovoMT.bndCPHeaderBeforePrint(
  Sender: TObject);
begin
  inherited;
  bndCPHeader.Height := 43.127;

  if cdsFiltrosFiltro2.AsString <> EmptyStr then
  begin
    ppCPFiltro2.Top  := ppCPFiltro1.Top + ppCPFiltro1.Height + 0.427;
    ppCPFiltro2.Left := ppCPFiltro1.Left;
  end;
  if cdsFiltrosFiltro3.AsString <> EmptyStr then
  begin
    ppCPFiltro3.Top  := ppCPFiltro2.Top + ppCPFiltro2.Height + 0.427;
    ppCPFiltro3.Left := ppCPFiltro2.Left;
  end;
  if cdsFiltrosFiltro4.AsString <> EmptyStr then
  begin
    ppCPFiltro4.Top  := ppCPFiltro3.Top + ppCPFiltro3.Height + 0.427;
    ppCPFiltro4.Left := ppCPFiltro3.Left;
  end;
  if cdsFiltrosFiltro5.AsString <> EmptyStr then
  begin
    ppCPFiltro5.Top  := ppCPFiltro4.Top + ppCPFiltro4.Height + 0.427;
    ppCPFiltro5.Left := ppCPFiltro4.Left;
  end;
  if cdsFiltrosFiltro6.AsString <> EmptyStr then
  begin
    ppCPFiltro6.Top  := ppCPFiltro5.Top + ppCPFiltro5.Height + 0.427;
    ppCPFiltro6.Left := ppCPFiltro5.Left;
  end;

  bndPCQuebra.Visible := sParams.Quebra <> EmptyStr;
end;

procedure TfrmConsultaFluxosNovoMT.CarregaDatasParaGrupoImpresso;
var
   i : byte;
begin
  // monta períodos de acordo com o agrupamento
  AtivaDesativaFiltro(cdsPeriodo, 'GRUPO = '+cdsFluxos.FieldByName('GRUPO').AsString);
  lstPeriodo.clear;
  while not cdsPeriodo.Eof do
  begin
    if tipoPeriodo = tpSemanal then
       lstPeriodo.Add( cdsPeriodo.Fields[3].AsString )
    else
       lstPeriodo.Add( cdsPeriodo.Fields[0].AsString );

    cdsPeriodo.next;
  end;

  AtivaDesativaFiltro(cdsPeriodo, '');
end;


procedure TfrmConsultaFluxosNovoMT.ppFRGrupoPrint(Sender: TObject);
begin
  inherited;
  CarregaDatasParaGrupoImpresso();
  MudaLabelPeriodo();
end;

procedure TfrmConsultaFluxosNovoMT.MudaLabelPeriodo;
var
  i : byte;
  lblCol : TppLabel;
begin
  inherited;

  if sParams.OrientaImp = opRetrato then
  begin
    bndRCabec.Height := 6.085;
    ppPTracoCab2.Top := 5.292;

    if sParams.TipoRelat = trPrevxReal then
    begin
      bndRCabec.Height := 9.250;
      ppRTracoCab2.Top := 8.985;
    end;

    for i := 1 to 4 do
    begin
      case i of
        1 : AjustaLabel( lblRD1 );
        2 : AjustaLabel( lblRD2 );
        3 : AjustaLabel( lblRD3 );
        4 : AjustaLabel( lblRD4 );
      end;
    end;

    for i := 0 to lstPeriodo.count-1 do
    begin
      if sParams.TipoRelat = trPrevxReal then
      begin
        case i of
          0 : begin
                lblRD1.Caption := 'Previsto ' + lstPeriodo.Strings[i];
                lblRD2.Caption := 'Realizado '+ lstPeriodo.Strings[i];
              end;
          1 : begin
                lblRD3.Caption := 'Previsto ' + lstPeriodo.Strings[i];
                lblRD4.Caption := 'Realizado '+ lstPeriodo.Strings[i];
              end;
        end;
        if (sParams.Agrupa = tpMensal) then
        begin
          lblRD1.Caption := UpperCase(lblRD1.Caption);
          //lblRD2.Caption := UpperCase(lblRD1.Caption);   // edilaine - SOL 250346 / PPM 714315
          lblRD2.Caption := UpperCase(lblRD2.Caption);     // edilaine - SOL 250346 / PPM 714315
          lblRD3.Caption := UpperCase(lblRD3.Caption);
          lblRD4.Caption := UpperCase(lblRD4.Caption);
        end;
      end
      else
      begin
         case i of
           0 : lblRD1.Caption := lstPeriodo.Strings[i];
           1 : lblRD2.Caption := lstPeriodo.Strings[i];
           2 : lblRD3.Caption := lstPeriodo.Strings[i];
           3 : lblRD4.Caption := lstPeriodo.Strings[i];
         end;
      end;
    end;

    // limpar dado
    for i := 1 to 4 do
    begin
      case i of
        1 : dbRDia1.BlankWhenZero := (Trim(lblRD1.Caption) = EmptyStr);
        2 : dbRDia2.BlankWhenZero := (Trim(lblRD2.Caption) = EmptyStr);
        3 : dbRDia3.BlankWhenZero := (Trim(lblRD3.Caption) = EmptyStr);
        4 : dbRDia4.BlankWhenZero := (Trim(lblRD4.Caption) = EmptyStr);
      end;
    end;

  end
  else
  begin

    bndPCabec.Height := 6.085;
    ppPTracoCab2.Top := 5.292;

    if (sParams.TipoRelat = trPrevxReal) or (sParams.Agrupa = tpSemanal) then
    begin
      bndPCabec.Height := 9.250;
      ppPTracoCab2.Top := 8.985;
    end;

    for i := 1 to 8 do
    begin
      case i of
        1 : AjustaLabel( lblPD1 );
        2 : AjustaLabel( lblPD2 );
        3 : AjustaLabel( lblPD3 );
        4 : AjustaLabel( lblPD4 );
        5 : AjustaLabel( lblPD5 );
        6 : AjustaLabel( lblPD6 );
        7 : AjustaLabel( lblPD7 );
        8 : AjustaLabel( lblPD8 );
      end;
    end;

    for i := 0 to lstPeriodo.count-1 do
    begin
      if sParams.TipoRelat = trPrevxReal then
      begin
        case i of
          0 : begin
                lblPD1.Caption := 'Previsto ' + lstPeriodo.Strings[i];
                lblPD2.Caption := 'Realizado '+ lstPeriodo.Strings[i];
              end;
          1 : begin
                lblPD3.Caption := 'Previsto ' + lstPeriodo.Strings[i];
                lblPD4.Caption := 'Realizado '+ lstPeriodo.Strings[i];
              end;
          2 : begin
                lblPD5.Caption := 'Previsto ' + lstPeriodo.Strings[i];
                lblPD6.Caption := 'Realizado '+ lstPeriodo.Strings[i];
              end;
          3 : begin
                lblPD7.Caption := 'Previsto ' + lstPeriodo.Strings[i];
                lblPD8.Caption := 'Realizado '+ lstPeriodo.Strings[i];
              end;
        end;
        if (sParams.Agrupa = tpMensal) then
        begin
          lblPD1.Caption := UpperCase(lblPD1.Caption);
          lblPD2.Caption := UpperCase(lblPD2.Caption);
          lblPD3.Caption := UpperCase(lblPD3.Caption);
          lblPD4.Caption := UpperCase(lblPD4.Caption);
          lblPD5.Caption := UpperCase(lblPD5.Caption);
          lblPD6.Caption := UpperCase(lblPD6.Caption);
          lblPD7.Caption := UpperCase(lblPD7.Caption);
          lblPD8.Caption := UpperCase(lblPD8.Caption);
        end;
      end
      else
      begin
         case i of
           0 : lblPD1.Caption := lstPeriodo.Strings[i];
           1 : lblPD2.Caption := lstPeriodo.Strings[i];
           2 : lblPD3.Caption := lstPeriodo.Strings[i];
           3 : lblPD4.Caption := lstPeriodo.Strings[i];
           4 : lblPD5.Caption := lstPeriodo.Strings[i];
           5 : lblPD6.Caption := lstPeriodo.Strings[i];
           6 : lblPD7.Caption := lstPeriodo.Strings[i];
           7 : lblPD8.Caption := lstPeriodo.Strings[i];
         end;
      end;
    end;
    
    // limpar dado
    for i := 1 to 8 do
    begin
      case i of
        1 : dbPDia1.BlankWhenZero := (Trim(lblPD1.Caption) = EmptyStr);
        2 : dbPDia2.BlankWhenZero := (Trim(lblPD2.Caption) = EmptyStr);
        3 : dbPDia3.BlankWhenZero := (Trim(lblPD3.Caption) = EmptyStr);
        4 : dbPDia4.BlankWhenZero := (Trim(lblPD4.Caption) = EmptyStr);
        5 : dbPDia5.BlankWhenZero := (Trim(lblPD5.Caption) = EmptyStr);
        6 : dbPDia6.BlankWhenZero := (Trim(lblPD6.Caption) = EmptyStr);
        7 : dbPDia7.BlankWhenZero := (Trim(lblPD7.Caption) = EmptyStr);
        8 : dbPDia8.BlankWhenZero := (Trim(lblPD8.Caption) = EmptyStr);
      end;
    end;
  end;
end;

procedure TfrmConsultaFluxosNovoMT.bndPQuebraBeforePrint(Sender: TObject);
begin
  inherited;
  bndPQuebra.Visible := sParams.Quebra <> EmptyStr;
end;


procedure TfrmConsultaFluxosNovoMT.bndRQuebraBeforePrint(Sender: TObject);
begin
  inherited;
  bndRQuebra.Visible := sParams.Quebra <> EmptyStr;
end;


procedure TfrmConsultaFluxosNovoMT.ppFPGrupoPrint(Sender: TObject);
begin
  inherited;
  CarregaDatasParaGrupoImpresso();
  MudaLabelPeriodo();
end;


procedure TfrmConsultaFluxosNovoMT.bndCRHeaderBeforePrint(Sender: TObject);
begin
  inherited;

  bndCRHeader.Height := 42.598;

  if cdsFiltrosFiltro2.AsString <> EmptyStr then
  begin
    ppCRFiltro2.Top  := ppCRFiltro1.Top + ppCRFiltro1.Height + 0.427;
    ppCRFiltro2.Left := ppCRFiltro1.Left;
  end;
  if cdsFiltrosFiltro3.AsString <> EmptyStr then
  begin
    ppCRFiltro3.Top  := ppCRFiltro2.Top + ppCRFiltro2.Height + 0.427;
    ppCRFiltro3.Left := ppCRFiltro2.Left;
  end;
  if cdsFiltrosFiltro4.AsString <> EmptyStr then
  begin
    ppCRFiltro4.Top  := ppCRFiltro3.Top + ppCRFiltro3.Height + 0.427;
    ppCRFiltro4.Left := ppCRFiltro3.Left;
  end;
  if cdsFiltrosFiltro5.AsString <> EmptyStr then
  begin
    ppCRFiltro5.Top  := ppCRFiltro4.Top + ppCRFiltro4.Height + 0.427;
    ppCRFiltro5.Left := ppCRFiltro4.Left;
  end;
  if cdsFiltrosFiltro6.AsString <> EmptyStr then
  begin
    ppCRFiltro6.Top  := ppCRFiltro5.Top + ppCRFiltro5.Height + 0.427;
    ppCRFiltro6.Left := ppCRFiltro5.Left;
  end;

  bndRCQuebra.Visible := sParams.Quebra <> EmptyStr;
end;


procedure TfrmConsultaFluxosNovoMT.AjustaLabel(var lblAux : TppLabel);
var
  i, c : byte;
begin

  TppLabel(lblAux).Caption   := ' ';
  TppLabel(lblAux).Font.Size := iif((sParams.Agrupa = tpSemanal) and (sParams.OrientaImp = opRetrato), 8, 9);

  if (sParams.TipoRelat = trPrevxReal) or
     ((sParams.OrientaImp = opPaisagem) and (sParams.Agrupa = tpSemanal)) then
  begin
    if sParams.Agrupa = tpSemanal then
       TppLabel(lblAux).Top    := 1.853
    else
       TppLabel(lblAux).Top    := 1.588;
    TppLabel(lblAux).Height := 7.410;   //7.408;   // edilaine - SOL 250346 / PPM 714315
  end
  else
  begin
    TppLabel(lblAux).Top    := 1.323 + (1*0.265);
    TppLabel(lblAux).Height := 3.600;   //3.598;   // edilaine - SOL 250346 / PPM 714315
  end;

end;

procedure TfrmConsultaFluxosNovoMT.edtGrauKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_CONTROL)) then
     exit;

  if not (key in ['1'..'5', ' ', #08]) then
     key := #0;
end;

procedure TfrmConsultaFluxosNovoMT.LimpaDiretoria;
begin
  cdsCCusto.Filtered := false;
  cdsCCusto.Filter   := '';

  cdsCentroRespon.Filtered := false;
  cdsCentroRespon.Filter   := '';
end;

procedure TfrmConsultaFluxosNovoMT.bndQDTitBeforePrint(Sender: TObject);
begin
  inherited;
  bndQDTit.Height :=  39.158;;

  if cdsFiltrosFiltro2.AsString <> EmptyStr then
  begin
    ppQFiltro2.Top    := ppQFiltro1.Top + ppQFiltro1.Height + 0.427;
    ppQFiltro2.Left   := ppQFiltro1.Left;
    bndQDTit.Height := bndQDTit.Height + (3.704 + 0.427);
  end;

  if cdsFiltrosFiltro3.AsString <> EmptyStr then
  begin
    ppQFiltro3.Top  := ppQFiltro2.Top + ppQFiltro2.Height + 0.427;
    ppQFiltro3.Left := ppQFiltro2.Left;
    bndQDTit.Height := bndQDTit.Height + (3.704 + 0.427);
  end;

  if cdsFiltrosFiltro4.AsString <> EmptyStr then
  begin
    ppQFiltro4.Top  := ppQFiltro3.Top + ppQFiltro3.Height + 0.427;
    ppQFiltro4.Left := ppQFiltro3.Left;
    bndQDTit.Height := bndQDTit.Height + (3.704 + 0.427);
  end;

  if cdsFiltrosFiltro5.AsString <> EmptyStr then
  begin
    ppQFiltro5.Top  := ppQFiltro4.Top + ppQFiltro4.Height + 0.427;
    ppQFiltro5.Left := ppQFiltro4.Left;
    bndQDTit.Height := bndQDTit.Height + (3.704 + 0.427);
  end;

  if cdsFiltrosFiltro6.AsString <> EmptyStr then
  begin
    ppQFiltro6.Top  := ppQFiltro5.Top + ppQFiltro5.Height + 0.427;
    ppQFiltro6.Left := ppQFiltro5.Left;
    bndQDTit.Height := bndQDTit.Height + (3.704 + 0.427);
  end;

end;

procedure TfrmConsultaFluxosNovoMT.ppDetailBand6BeforePrint(
  Sender: TObject);
begin
  inherited;
  if ppZebra.Brush.Color = clWhite then
    ppZebra.Brush.Color := $00D3D3D3
  else
    ppZebra.Brush.Color := clWhite;
end;

procedure TfrmConsultaFluxosNovoMT.bndTitGrafBeforePrint(
  Sender: TObject);
begin
  inherited;
  bndTitGraf.Height := 39.158;

  if cdsFiltrosFiltro2.AsString <> EmptyStr then
  begin
    ppGFiltro2.Top  := ppGFiltro1.Top + ppGFiltro1.Height + 0.427;
    ppGFiltro2.Left := ppGFiltro1.Left;
    bndTitGraf.Height := bndTitGraf.Height + (3.704 + 0.427);
  end;

  if cdsFiltrosFiltro3.AsString <> EmptyStr then
  begin
    ppGFiltro3.Top  := ppGFiltro2.Top + ppGFiltro2.Height + 0.427;
    ppGFiltro3.Left := ppGFiltro2.Left;
    bndTitGraf.Height := bndTitGraf.Height + (3.704 + 0.427);
  end;

  if cdsFiltrosFiltro4.AsString <> EmptyStr then
  begin
    ppGFiltro4.Top  := ppGFiltro3.Top + ppGFiltro3.Height + 0.427;
    ppGFiltro4.Left := ppGFiltro3.Left;
    bndTitGraf.Height := bndTitGraf.Height + (3.704 + 0.427);
  end;

  if cdsFiltrosFiltro5.AsString <> EmptyStr then
  begin
    ppGFiltro5.Top  := ppGFiltro4.Top + ppGFiltro4.Height + 0.427;
    ppGFiltro5.Left := ppGFiltro4.Left;
    bndTitGraf.Height := bndTitGraf.Height + (3.704 + 0.427);
  end;

  if cdsFiltrosFiltro6.AsString <> EmptyStr then
  begin
    ppGFiltro6.Top  := ppGFiltro5.Top + ppGFiltro5.Height + 0.427;
    ppGFiltro6.Left := ppGFiltro5.Left;
    bndTitGraf.Height := bndTitGraf.Height + (3.704 + 0.427);
  end;
end;

procedure TfrmConsultaFluxosNovoMT.ppDetailBand5BeforePrint(Sender: TObject);
begin
  inherited;
  // pintando o lado Esquerdo
  if Trim(cdsCompara.FieldByName('PERIODO').AsString) = EmptyStr then
  begin
    ppPLinTop.Pen.Color  := $00D4D4D4;
    ppPLinDown.Pen.Color := $00D4D4D4;
  end
  else
  begin
    ppPLinTop.Pen.Color  := clBlack;
    if cdsCompara.FieldByName('PERIODO').AsString = 'Total' then
       ppPLinDown.Pen.Color := clBlack
    else
       ppPLinDown.Pen.Color := $00D4D4D4;
  end;

  // pintando o lado Direito
  if (iGrupoImp <> cdsCompara.FieldByName('GRUPODOC').AsInteger) and
     (cdsCompara.FieldByName('GRUPODOC').AsInteger > 0) then
  begin
    iGrupoImp := cdsCompara.FieldByName('GRUPODOC').AsInteger;
    ppRLinTop.Pen.Color  := clBlack;
    if cdsCompara.FieldByName('PERIODO').AsString = 'Total' then
       ppRLinDown.Pen.Color := clBlack
    else
       ppRLinDown.Pen.Color := $00D4D4D4;
  end
  // edilaine - SOL 255386 / PPM 818743 - inicio
  else if (cdsCompara.FieldByName('CODDOCUMENTO').AsString = '1') then
  begin
    ppRLinTop.Pen.Color  := clBlack;
    ppRLinDown.Pen.Color := $00D4D4D4;
  end
  else if (cdsCompara.FieldByName('CODDOCUMENTO').AsString = emptyStr) and (cdsCompara.FieldByName('PERIODO').AsString = 'Total') then
  begin
    ppRLinTop.Pen.Color  := clBlack;
    ppRLinDown.Pen.Color := clBlack;
  end
  // edilaine - SOL 255386 / PPM 818743 - fim
  else
  begin
    ppRLinTop.Pen.Color  := $00D4D4D4;
    ppRLinDown.Pen.Color := $00D4D4D4;
  end;

  // colocar negrito
  if cdsCompara.FieldByName('PERIODO').AsString = 'Total' then
  begin
    dbVlrRecDes.Font.Style  := [fsBold];
    dbDesembolso.Font.style := [fsbold];
    dbVrlBaixa.Font.style   := [fsbold];
    dbForCli.Font.style     := [fsbold];
    dbVlrRateio.Font.style  := [fsbold];
  end
  else
  begin
    dbVlrRecDes.Font.style  := [];
    dbDesembolso.Font.style := [];
    dbVrlBaixa.Font.style   := [];
    dbForCli.Font.style     := [];
    dbVlrRateio.Font.style  := [];
  end;
end;

procedure TfrmConsultaFluxosNovoMT.bndCPGruPerBeforePrint(
  Sender: TObject);
begin
  inherited;
  bndCPGruPer.Visible := (cdsCompara.RecNo > 1);
end;

end.

