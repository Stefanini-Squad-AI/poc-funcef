// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
{------------------------------------------------------------------------------
Data      : 09/12/2004
Autor     : Fabio Fagundes
Descrição : Implementação do tratamento de PortadoForma que não afeta o Financeiro
            para não trazer os Documentos para a Disponibilidade
{ --------------------------------------------------------------------------------------------------
Data      : 28/10/2004
Autor     : Fabio Fagundes
Descrição : Acerto na qryAnalitica item (1.6) que estava fazendo carteziano com
            a RateioDocum
{ --------------------------------------------------------------------------------------------------
Data      : 18/10/2004
Autor     : Fabio Fagundes
Descrição : Implementacao de CPMF sobre Transferencia entre Contas
{ --------------------------------------------------------------------------------------------------
Rotina    : 
Data      : 14/10/2004
Autor     : Fabio Fagundes
Descrição : Melhoria de Lay-out e qryDebug
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : 
Data      : 20/09/2004
Autor     : Fabio Fagundes
Descrição : Melhoria de Lay-out e qryDebug
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : 
Data      : 17/08/2004
Autor     : Fabio Fagundes
Descrição : qryAnalítica e qrySintetica : Acertos no processamento e melhorias
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : 
Data      : 30/07/2004
Autor     : Fabio Fagundes
Descrição : qryAnalítica e qrySintetica : Acertos no processamento e melhorias
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : 
Data      : 22/07/2004
Autor     : Fabio Fagundes
Descrição : qryAnalítica e qrySintetica : Acertos no processamento
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : 
Data      : 04/06/2004
Autor     : Fabio Fagundes
Descrição : qryAnalítica e qrySintetica : Acertos no processamento
---------------------------------------------------------------------------------------------------}


// André Tavares - 29/03/2004 - pendência 15765
{ --------------------------------------------------------------------------------------------------
Rotina    : 
Data      : 29/03/2004
Autor     : André Tavares
Descrição : resolução da pendência 15765 - tirar o paâmetro cravado da query
qryAnalítica e utilizar o parâmetro do IRRF que identifica o tipo de imposto para INSS de autônomos
---------------------------------------------------------------------------------------------------}


{ --------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 23/01/2004
Autor     : Fabio Fagundes
Descrição : - Acerto nas qrys Analítica e Sintética
            - Criação do campo DATAINIDISPFINANC
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 04/12/2003
Autor     : Fabio Fagundes
Descrição : - Acerto na busca dos registros de CPMF da qryAnalitica 
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 30/10/2003
Autor     : Fabio Fagundes
Descrição : - Alteração do Caption do Relatório de Disp. Analítica para imprimir o Plano e Patro
            - Inclusão dos campos NODOCUMENTO,PLANO E PATRO na qryAnalitica
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 04/08/2003
Autor     : Fabio Fagundes
Descrição : Alteração no SQL da QryAnalitica e QrySintética para não buscar os documento baixados
            do CAR nas tabelas do CFinan e sim da DOCUMENTO.
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 04/08/2003
Autor     : Fabio Fagundes
Descrição : Alteração no SQL da QryAnalitica e QrySintética para Otimização
            do Processamento e inclusâo de cláusulas para busca de lançamentos
            de INSS
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : ValidaOperacao
Data      : 17/06/2003
Autor     : Fabio Fagundes
Descrição : Alteração no SQL da QryAnalitica para alteração do Beneficiário
            dos lançamentos do CFinan para apresentarem o histórico padrão
            do contas caixa X tipoOperação
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ValidaOperacao
Data      : 02/06/2003
Autor     : Fabio Fagundes
Descrição : Alteração no SQL da QryAnalitica para inclusão de CPMF e IRRF
---------------------------------------------------------------------------------------------------}

unit FConsDisponibilidadeMT;

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
  wwdbedit, Wwdotdot, Wwdbcomb, TB97Ctls;

type
  TfrmConsDisponibilidadeMT = class(TfrmSairAjuda)
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
    CdsParamFinancDATABLOQDISPFINAN: TDateTimeField;
    CdsParamFinancFLGDISPBLOQ: TStringField;
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
    ppDPTeeChartControl1: TppDPTeeChartControl;
    Series2: TBarSeries;
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
    BitBtn1: TBitBtn;
    CdsParamFinancDATAINIDISPFINANC: TDateTimeField;
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
    btnSldInicPlano: TToolbarButton97;
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
    procedure FormActivate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnIniciarClick(Sender: TObject);
    procedure PgcSaldosChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure eOnMessage(sMsg : string);
    procedure edtDataRefExit(Sender: TObject);
    procedure dbgAnaliticoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgDispAnaliticaCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure dbgDispSinteticaCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure dbgSinteticoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
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
    procedure btnSldInicPlanoClick(Sender: TObject);
    procedure cmbTiposChange(Sender: TObject);
    procedure dbgDebugCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgDebugTopRowChanged(Sender: TObject);

  private
    { Private declarations }
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

  public
    { Public declarations }
    bmPosicao: TBookmark;
  end;

var
  frmConsDisponibilidadeMT: TfrmConsDisponibilidadeMT;
  bFirst,bConciliada,bFirstAtualiza : boolean;
  fSaldoAnterior, fRecebimentos, fDesembolsos, fSaldoDoDia : Double;
  dDataIniMes,dDataIniMesAnt,dDataFimMesAnt,dDataINSS,dDataIniIRRF,dDataFimIRRF,dDataCPMF : TDateTime;
  dDataDARF, dDataAnt, dDataRef : TDateTime;
  bGeraAnalitica : Boolean;
  sPatro, sPlano : String;
  iSaldoAntINSS, iSaldoAntIRRF, iQuarta, iPatro, iPlanoPrev : Integer;

implementation

uses FPrincipal;

{$R *.DFM}

procedure TfrmConsDisponibilidadeMT.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;

procedure TfrmConsDisponibilidadeMT.TimerTimer(Sender: TObject);
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

procedure TfrmConsDisponibilidadeMT.FormShow(Sender: TObject);
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

end;

procedure TfrmConsDisponibilidadeMT.bbtnIniciarClick(Sender: TObject);
begin
  inherited;
  PgcSaldos.ActivePage := tbsSintetica;
  bFaz := True;
  TimerTimer(Sender);
  Atualiza;
end;

procedure TfrmConsDisponibilidadeMT.MontaParametros(sQry:String);
var
   iAno, iMes, iDia : word;
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
   dDataIniIRRF := BuscaPrimeiroDiaIRRF(StrToDate(edtDataRef.Text));
   dDataFImIRRF := dDataIniIRRF + 5;
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

procedure TfrmConsDisponibilidadeMT.Atualiza;
begin
   // Desabilita o Timer para não contar o tempo de abertura das queries no intervalo
   if (bFaz) then
   begin
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
      Timer.Enabled := True;
      if bFirstAtualiza then
         bFirstAtualiza := False;
      bFaz := False;
   end;

   //qrySintetica.sql.savetofile('c:\qrySintetica.txt');
   qrySintetica.sql.savetofile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\qrySintetica.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;

procedure TfrmConsDisponibilidadeMT.PgcSaldosChange(Sender: TObject);
begin
   inherited;
   bmPosicao := CdsDispSintetica.GetBookmark;
   if PgcSaldos.ActivePage = tbsAnalitica then
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

procedure TfrmConsDisponibilidadeMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlParamFinanc := TCtrlParamFinanc.Create;
   CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,
                               nil,False,eOnMessage);

   CtrlDisponibxusu := TCtrlDisponibxusu.Create;
   CtrlDisponibxusu.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,
                               nil,False,eOnMessage);

   CtrlDisponFinanc:=TCtrlDisponFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                              Sistema.IdUsuario,Sistema.UsaPlanoPatro);
   CtrlDisponFinanc.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,
                               nil,False,eOnMessage);

   CdsParamFinanc.Data  := CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);
   edtDataRef.Date      := CdsParamFinanc.FieldByName('DATABLOQDISPFINAN').AsDateTime;

   AtualizaGrids;
end;

procedure TfrmConsDisponibilidadeMT.FormDestroy(Sender: TObject);
begin
  inherited;
   CtrlParamFinanc.Free;
   CtrlDisponibxusu.Free;
   CtrlDisponFinanc.Free;
end;

procedure TfrmConsDisponibilidadeMT.eOnMessage(sMsg : string);
begin
  MsgDlg(sMsg,'Atenção',mtWarning,[mbOk],0);
end;


procedure TfrmConsDisponibilidadeMT.edtDataRefExit(Sender: TObject);
begin
  inherited;
   begin
      CdsDispFinanc.Data   := CtrlDisponFinanc.SelecionaDispFinanc(edtDataRef.Date );
      AtualizaGrids;
   end;
end;

procedure TfrmConsDisponibilidadeMT.AtualizaGrids;
begin
   bConciliada := False;
   dbgSintetico.Visible := True;
   dbgAnalitico.Visible := True;
end;

procedure TfrmConsDisponibilidadeMT.dbgAnaliticoCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmConsDisponibilidadeMT.dbgDispAnaliticaCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmConsDisponibilidadeMT.dbgDispSinteticaCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmConsDisponibilidadeMT.dbgSinteticoCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmConsDisponibilidadeMT.dbgAnaliticoTopRowChanged(
  Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidadeMT.dbgDispAnaliticaTopRowChanged(
  Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidadeMT.dbgDispSinteticaTopRowChanged(
  Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidadeMT.dbgSinteticoTopRowChanged(
  Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidadeMT.bbtnImprimirClick(Sender: TObject);
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

procedure TfrmConsDisponibilidadeMT.rptDispAnaliticaStartPage(
  Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   ppShape4.Brush.Color := clWhite;
   bFirst := True;
end;

procedure TfrmConsDisponibilidadeMT.ppGroupFooterBand1BeforePrint(
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

procedure TfrmConsDisponibilidadeMT.edtIntervaloExit(Sender: TObject);
begin
  inherited;
//   bbtnIniciar.Click;
end;

procedure TfrmConsDisponibilidadeMT.ppShape3Print(Sender: TObject);
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

procedure TfrmConsDisponibilidadeMT.ppShape4Print(Sender: TObject);
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

function TfrmConsDisponibilidadeMT.BuscaDiaRecolhCPMF(dDataRef:TDateTime):TDateTime;
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

function TfrmConsDisponibilidadeMT.BuscaPrimeiroDiaIRRF(dDataRef:TDateTime):TDateTime;
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

function TfrmConsDisponibilidadeMT.BuscaPrimeiDiaAposCPMF(dDataRef:TDateTime):TDateTime;
var dData : TDateTime;
begin
    dData := BuscaDiaRecolhCPMF(StrToDate(edtDataRef.Text));
    Result := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dData,True,True,False);
end;

procedure TfrmConsDisponibilidadeMT.btnSldInicPlanoClick(Sender: TObject);
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
            end;

            // Copia a linha de SQL para a query de debug
            if bCopia then
            begin
               qryDebug.SQL.Add(qrySintetica.SQL.Strings[I]);
               // TROCA PARAMETROS
   //           sParametro := qrySintetica.SQL.Strings[I];
   //            if sParametro = qrySintetica.SQL.Strings[I]
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':DATAREF'      , QuotedStr(DateToStr(dDataRef)));
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':DATAANT'      , QuotedStr(DateToStr(dDataAnt)));
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':DATASALDOANT' , QuotedStr(DateToStr(CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime)));
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':DATAINIMESANT', QuotedStr(DateToStr(dDataIniMesAnt)));
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':DATAFIMMESANT', QuotedStr(DateToStr(dDataFimMesAnt)));
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':DATAINIMES'   , QuotedStr(DateToStr(dDataIniMes)));
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':DATAINSS'     , QuotedStr(DateToStr(dDataINSS)));
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':DATAINIIRRF'  , QuotedStr(DateToStr(dDataIniIRRF)));
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':DATAFIMIRRF'  , QuotedStr(DateToStr(dDataFimIRRF)));
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':IDPATRO'      , IntToStr(CdsDispSinteticaIDPATRO.AsInteger));
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':IDPLANOPREV'  , IntToStr(CdsDispSinteticaIDPLANO.AsInteger));
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':IDPESSOA'     , IntToStr(Sistema.IdEmpresa));
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':BSALDOANTINSS', IntToStr(iSaldoAntINSS));
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':BSALDOANTIRRF', IntToStr(iSaldoAntIRRF));
               qrySintetica.SQL.Strings[I] := TrocaString(qrySintetica.SQL.Strings[I], ':BQUARTA'      , IntToStr(iQuarta));

               memoDebug.Lines.Add(qrySintetica.SQL.Strings[I]);
//               memoDebug.Items.Add(qrySintetica.SQL.Strings[I]);
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
            //qryDebug.sql.savetofile('c:\qryDebug.txt');
            qryDebug.sql.savetofile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\qryDebug.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
            pgcDebug.ActivePage := tbsResulDebug;

            // Inclui Saldo Final
   {            if not qryDebug.IsEmpty then
               qryDebug.Append
            else
               qryDebug.Insert;
            qryDebugNODOCUMENTO.AsString := '';
            qryDebugNOMEFORCLI.AsString  := 'SALDO FINAL   - ' + CdsDispSinteticaNOMEPLANOPATRO.AsString;
            qryDebugSALDO.AsFloat        := 0;
            qryDebugTIPOREG.AsString     := '4';
            qryDebugIDPLANO.AsInteger    := CdsDispSinteticaIDPLANO.AsInteger;
            qryDebugIDPATRO.AsInteger    := CdsDispSinteticaIDPATRO.AsInteger;
            qryDebugSALDOANT.AsFloat     := CdsDispSinteticaSALDODIA.AsFloat;
            qryDebugRECEBIMENTOS.AsFloat := CdsDispSinteticaRECEBIMENTOS.AsFloat;
            qryDebugDESEMBOLSOS.AsFloat  := CdsDispSinteticaDESEMBOLSOS.AsFloat;
            qryDebugCODCENTRORESPON.AsString := '';
            qryDebugNOME.AsString := '';
            qryDebug.Post;
   }

         end
         else
            MsgDlg('A TAG ' + cmbTipos.Value + ' não foi encontrada no SQL','Atenção',mtWarning,[mbOk],0);
      end
         else
            MsgDlg('A Disponibilidade Consolidada não foi executada.','Atenção',mtWarning,[mbOk],0);
   end;
end;

procedure TfrmConsDisponibilidadeMT.cmbTiposChange(Sender: TObject);
begin
   inherited;
   with qryDebug do
   begin
      Close;
      SQL.Clear;
   end;
end;

function TfrmConsDisponibilidadeMT.TrocaString(sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
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


procedure TfrmConsDisponibilidadeMT.dbgDebugCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmConsDisponibilidadeMT.dbgDebugTopRowChanged(
  Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

end.


{

      for I := 0 to SQL.Count - 1 do
         Sql.Strings[I] := TrocaString(Sql.Strings[I], '0000', sInvRVBMF);

         
QRY DE CPMF COM CENTRO DE RESPONSABILIDADE : AGRARDAR DEFINICAO
    SELECT
       DECODE(XX.IDFORCLI,-1,' ','CPMF : '||P.NOME) AS NOMEFORCLI,
       ' ' AS NODOCUMENTO,
       0 AS NUMAPGR,
       XX.VALOR,
       XX.IDPLANOPREV,
       XX.IDPATRO,
       3 AS TIPOREG,
       XX.CODCENTRORESPON,
       XX.IDPESSOA
    FROM
       PESSOA P,
       (SELECT
           X.IDFORCLI,
           SUM(X.VALOR*-1) AS VALOR,
           X.IDPLANOPREV,
           X.IDPATRO,
           X.IDPESSOA,
           X.CODCENTRORESPON
        FROM
           (
            -- (6B) REGISTROS BAIXADOS NA DATAREF DE CPMF 
            -- TAG _CPMFB_I
            SELECT
               PO.IDBANCO AS IDFORCLI,
               0 AS NUMAPGR,
               '' AS NODOCUMENTO,
               R.IDPLANOPREV,
               R.IDPATRO,
               M.IDPESSOA,
               R.CODCENTRORESPON,
               SUM(R.VALOR) AS VALOR
            FROM
               MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO
            WHERE
               (M.CODLANCFINANC IN(SELECT M.CODLANCFINANC
                                       FROM MOVIMFINANC M
                                       WHERE
                                          (IDMODULO = 3)
                                          AND (IDPESSOA = 1)
                                          AND (DATALANCFINAN = TO_DATE('23/07/2004','DD/MM/YYYY'))
                                          AND (M.CODLANCFINANC IN (SELECT DISTINCT CODLANCFINANC
                                                                   FROM RATEIOFINANC
                                                                   WHERE CODTIPDOC=(SELECT CODTIPDOCCPMF
                                                                                    FROM PARAMCAP
                                                                                    WHERE IDPESSOA = 1
                                                                                       AND RECPAG = 'P')))))
               AND ((null IS NULL) OR (R.IDPATRO = null))
               AND ((null IS NULL) OR (R.IDPLANOPREV = null))
               AND (M.CODLANCFINANC = R.CODLANCFINANC)
               AND (M.CODPORTADOR = PO.CODPORTADOR)
            GROUP BY R.IDPLANOPREV,R.IDPATRO,M.IDPESSOA,M.CODPORTADOR,PO.IDBANCO,R.CODCENTRORESPON
            -- TAG _CPMFB_F

            UNION

            -- (6A) REGISTROS NA DATAREF DE CPMF NAO BAIXADOS
            -- TAG _CPMFNB_I
            SELECT
               D.IDFORCLI,
               D.NUMAPGR,
               DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'/'||D.COMPLDOCUMENTO)) AS NODOCUMENTO,
               R.IDPLANOPREV,
               R.IDPATRO,
               D.IDPESSOA,
               R.CODCENTRORESPON,
               SUM(R.VALOR) AS VALOR
            FROM
               DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,
               (SELECT P.CODTIPDOCCPMF FROM PARAMCAP P WHERE P.IDPESSOA = 1 AND P.RECPAG = 'P') P
            WHERE
               (D.DATAPROGRAMADA = TO_DATE('23/07/2004','DD/MM/YYYY'))
               AND (D.IDPESSOA = 1)
               AND (D.RECPAG = 'P')
               AND (D.OPERACAO IN ('2 ','1 '))
               AND (D.STATUS <> '2')
               AND ((null IS NULL) OR (R.IDPATRO = null))
               AND ((null IS NULL) OR (R.IDPLANOPREV = null))
               AND (D.CODTIPDOC = P.CODTIPDOCCPMF)
               AND (D.CODDOCUMENTO = L.CODDOCUMENTO)
               AND (D.CODDOCUMENTO = R.CODDOCUMENTO)
            GROUP BY D.IDFORCLI, D.NUMAPGR, D.COMPLDOCUMENTO, D.NODOCUMENTO,
                     R.IDPLANOPREV, R.IDPATRO, D.IDPESSOA, R.CODCENTRORESPON
            -- TAG _CPMFNB_F
       ) X
    GROUP BY X.IDFORCLI, X.IDPLANOPREV,X.IDPATRO, X.IDPESSOA,X.CODCENTRORESPON )XX
    WHERE
       (XX.IDFORCLI = P.IDPESSOA(+))
}

{
        UNION
        (
         -- (9) REGISTRO DE PAGAMENTOS COM PARCELAMENTO NA DATAREF NAO BAIXADOS E MODULO <> INVESTIMENTOS
         -- TAG _SDTNBPARC_I
         SELECT
            '' AS NOMEFORCLI,
            SUM(((R.VALORRAT*S.SALDODOC)/abs(SS.SALDOTOT))) AS SALDO,
            R.IDPLANOPREV,
            R.IDPATRO,
            D.IDFORCLI,
            D.CODDOCUMENTO,
            D.IDPESSOA,
            D.CODTIPDOC,
            D.IDMODULO,
            D.NUMAPGR,
            '' AS TIPOREG,
            DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),(TO_CHAR(D.NODOCUMENTO)||'/'||D.COMPLDOCUMENTO)) AS NODOCUMENTO,
            L.HISTORICOCOMPL,
            R.CODTIPRECDES,
            R.CODCENTRORESPON,
            D.DATAPROGRAMADA,
            D.DATAVENCTO,
            L.DATALANCTO,
            R.RECPAG
         FROM
            DOCUMENTO D, LANCTODOCUM L,
            (SELECT
                D.NUMFATURA, SUM(DECODE(L.DEBCRE,'D',L.VALOR,L.VALOR*-1)) AS SALDOTOT              
             FROM
                DOCUMENTO D, LANCTODOCUM L
             WHERE
                (D.OPERACAO IN ('1 '))
                AND (D.IDPESSOA = :IDPESSOA)
                AND (D.RECPAG = 'P')
                AND (D.NUMFATURA IS NOT NULL)
                AND (D.OPERACAO = L.OPERACAO)
                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)
             GROUP BY D.NUMFATURA) SS,
            (SELECT
                D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'D',L.VALOR,L.VALOR*-1)) AS SALDODOC
             FROM
                DOCUMENTO D, LANCTODOCUM L
             WHERE
                (D.OPERACAO IN ('1 '))
                AND (D.IDPESSOA = :IDPESSOA)
                AND (D.RECPAG = 'P')
                AND (L.OPERACAO <> 5)
                AND (D.CODDOCUMENTO = L.CODDOCUMENTO)
             GROUP BY D.CODDOCUMENTO) S,
            (SELECT
                D.NUMFATURA, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, R.IDPESSOA,
                R.RECPAG, SUM(R.VALOR) AS VALORRAT,R.CODCENTRORESPON
             FROM
                DOCUMENTO D, RATEIODOCUM R
             WHERE
                (D.OPERACAO IN ('1 '))
                AND (D.IDPESSOA = :IDPESSOA)
                AND (D.RECPAG = 'P')
                AND (D.NUMFATURA IS NOT NULL)
                AND (D.CODDOCUMENTO = R.CODDOCUMENTO)
             GROUP BY R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO, R.IDPESSOA, R.RECPAG, D.NUMFATURA,R.CODCENTRORESPON) R,
            (SELECT
                D.NUMFATURA, D.DATAPROGRAMADA
             FROM
                DOCUMENTO D
             WHERE
                (D.OPERACAO IN ('3 '))
                AND (D.IDPESSOA = 1)
                AND (D.RECPAG = 'P')
                AND (D.NUMFATURA IS NOT NULL)) X
         WHERE
            (X.DATAPROGRAMADA = TO_DATE(:DATAREF,'DD/MM/YYYY'))
            AND (D.RECPAG = 'P')
            AND (NVL(SS.SALDOTOT,0) <> 0 )
            AND (D.OPERACAO IN ('1 '))
            AND (L.OPERACAO <> 5)
            AND (D.IDMODULO <> 79)
            AND (D.IDPESSOA = :IDPESSOA)
            AND ((:IDPATRO IS NULL) OR (R.IDPATRO = :IDPATRO))
            AND ((:IDPLANOPREV IS NULL) OR (R.IDPLANOPREV = :IDPLANOPREV))
            AND (D.CODDOCUMENTO = L.CODDOCUMENTO)
            AND (D.OPERACAO = L.OPERACAO)
            AND (D.NUMFATURA = R.NUMFATURA)
            AND (D.CODDOCUMENTO = S.CODDOCUMENTO)
            AND (D.NUMFATURA = SS.NUMFATURA)
            AND (D.NUMFATURA = X.NUMFATURA)
         GROUP BY D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NODOCUMENTO, D.DATAPROGRAMADA,
                L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPATRO,
                R.RECPAG, D.IDPESSOA, D.OPERACAO, D.CODTIPDOC, D.IDMODULO, D.CODDOCUMENTO,
                R.CODCENTRORESPON, D.NUMAPGR
        -- TAG _SDTNBPARC_F
        )


}
