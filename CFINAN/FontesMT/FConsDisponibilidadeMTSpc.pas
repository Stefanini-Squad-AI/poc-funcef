// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
{------------------------------------------------------------------------------
Data      : 18/05/2006
Autor     : Fabio Fagundes
Código    : AL_29
Pendência : 20002
SOL       :
Descrição : Melhorias no detalhemento de Lote dos documentos baixados no Relatório Analícico
            Melhorias de lay-out
----------------------------------------------------------------------------------------------------
Data      : 11/05/2006
Autor     : Fabio Fagundes
Código    : AL_28
Descrição : Melhoria de lay-out do relatório e inclusão do campo data no relatório analítico
            Gravação do Total Geral no Período
----------------------------------------------------------------------------------------------------
Data      : 10/02/2006
Autor     : Fabio Fagundes
Código    : AL_27
Descrição : Passagem de Parametro de Data Inicial e Final na ListDispSintética e ListDispAnalitica e
            Controle de usuario em depuração
--------------------------------------------------------------------------------------------------
Data      : 02/01/2006
Autor     : Fabio Fagundes
Pendência : 21138
SOL       : 31028
Código    : AL_26
Descrição : Implementação de Período na Disponibilidade  Sintética
----------------------------------------------------------------------------------------------------
Data      : 16/12/2005
Autor     : Fabio Fagundes
Pendência : 20755
SOL       : 38445
Descrição : Alterado o campo P.NOME para P.RAZAOSOCIAL no item 2.0 das qrys Sintética e Analítica e Debug
----------------------------------------------------------------------------------------------------
Data      : 28/07/2005
Autor     : Fabio Fagundes
Descrição : Acerto nos itens 1.10 que não testava o STATUS <> 2 para não trazer documentos baixados-
----------------------------------------------------------------------------------------------------
Data      : 05/01/2005
Autor     : Fabio Fagundes
Descrição : Retirado o Parâmetro dDataDARF por não estar sendo utilizado
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

unit FConsDisponibilidadeMTSpc;

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
  wwdbedit, Wwdotdot, Wwdbcomb, TB97Ctls, uCmRptManager;

type
  TfrmConsDisponibilidadeMTSpc = class(TfrmSairAjuda)
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
    lblDtIni: TLabel;
    Timer: TTimer;
    ToolbarSep971: TToolbarSep97;
    dsSintetica: TwwDataSource;
    dsAnalitica: TwwDataSource;
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
    lblDispSintSistema: TppLabel;
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
    edtDataIni: TCMDateTimePicker;
    btnAtualiza: TBitBtn;
    CdsParamFinancDATAINIDISPFINANC: TDateTimeField;
    tbsDepuracao: TTabSheet;
    dsDebug: TwwDataSource;
    qryDebug: TwwQuery;
    CdsDispSinteticaNOMEPLANOPATRO: TStringField;
    CdsDispSinteticaSALDOANT: TFloatField;
    CdsDispSinteticaRECEBIMENTOS: TFloatField;
    CdsDispSinteticaDESEMBOLSOS: TFloatField;
    CdsDispSinteticaSALDODIA: TFloatField;
    pnlDepuracao: TPanel;
    cmbTipos: TwwDBComboBox;
    btnDebug: TToolbarButton97;
    OpenDialog1: TOpenDialog;
    pgcDebug: TPageControl;
    tbsResulDebug: TTabSheet;
    tbsQryDebug: TTabSheet;
    DBGrid1: TDBGrid;
    memoDebug: TMemo;
    spDisponibilidade: TStoredProc;
    CdsDispSinteticaIDPATRO: TFloatField;
    CdsDispSinteticaIDPLANO: TFloatField;
    SqlDispAnalitica: TCMSqlParams;
    CdsDispAnaliticaNUMDOC: TFloatField;
    CdsDispAnaliticaNUMAPGR: TFloatField;
    CdsDispAnaliticaNOMEFORCLI: TStringField;
    CdsDispAnaliticaNODOCUMENTO: TStringField;
    CdsDispAnaliticaNOMEFORCLI_1: TStringField;
    CdsDispAnaliticaSALDO: TFloatField;
    CdsDispAnaliticaCODCENTRORESPON: TStringField;
    CdsDispAnaliticaNOMEPLANOPATRO: TStringField;
    CdsDispAnaliticaNOME: TStringField;
    CdsDispAnaliticaIDPLANO: TFloatField;
    CdsDispAnaliticaIDPATRO: TFloatField;
    CdsDispAnaliticaTIPOREG: TStringField;
    CdsDispAnaliticaSALDOANT: TFloatField;
    CdsDispAnaliticaRECEBIMENTOS: TFloatField;
    CdsDispAnaliticaDESEMBOLSOS: TFloatField;
    CdsDispAnaliticaSALDODIA: TFloatField;
    CdsDispAnaliticaIDPESSOA: TFloatField;
    CdsDispAnaliticaPLANO: TStringField;
    CdsDispAnaliticaPATRO: TStringField;
    qrySintetica: TwwQuery;
    qrySinteticaIDPATRO: TFloatField;
    qrySinteticaIDPLANO: TFloatField;
    qrySinteticaNOMEPLANOPATRO: TStringField;
    qrySinteticaSALDOANT: TFloatField;
    qrySinteticaRECEBIMENTOS: TFloatField;
    qrySinteticaDESEMBOLSOS: TFloatField;
    qrySinteticaSALDODIA: TFloatField;
    lblDtFim: TLabel;
    edtDtFim: TCMDateTimePicker;
    CdsDispSinteticaDATAREF: TDateTimeField;
    CdsDispAnaliticaDATAREF: TDateTimeField;
    SqlDispSintetica: TCMSqlParams;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText11: TppDBText;
    pplblDataRef: TppLabel;
    CmRptDispAnalitica: TCmRptManager;
    CmRptDispSintetica: TCmRptManager;
    CmRptDispGrafico: TCmRptManager;
    ppGroup3: TppGroup;
    ppCabGrpNomePlanoPatro: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppdbNomePlanPatroAnal: TppDBText;
    ppDBImage1: TppDBImage;
    ppShape1: TppShape;

    procedure FormActivate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnIniciarClick(Sender: TObject);
    procedure PgcSaldosChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure eOnMessage(sMsg : string);
    procedure edtDataIniExit(Sender: TObject);
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
    procedure ppCabGrpNomePlanoPatroBeforePrint(Sender: TObject);


  private { Private declarations }

    cCorZebra : TColor;
    bFaz: Boolean;
    fMaxValor, fMinValor: Double;
    iIntervalo: Integer;
    CtrlParamFinanc   : TCtrlParamFinanc;
    CtrlDisponibxusu  : TCtrlDisponibxusu;
    CtrlDisponFinanc  : TCtrlDisponFinanc;
    _sql : TCmSqlParams;

    procedure Atualiza;
    procedure AtualizaGrids;
    function BuscaDiaRecolhCPMF(dDataIni:TDateTime):TDateTime;
    function BuscaPrimeiDiaAposCPMF(dDataIni:TDateTime):TDateTime;
    function BuscaPrimeiroDiaIRRF(dDataIni:TDateTime):TDateTime;
    function TrocaString (sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;


  public  { Public declarations }

    bmPosicao: TBookmark;


  end;



var
  frmConsDisponibilidadeMTSpc: TfrmConsDisponibilidadeMTSpc;
  bFirst,bConciliada,bFirstAtualiza : boolean;
  fSaldoAnterior, fRecebimentos, fDesembolsos, fSaldoDoDia : Double;

  dDataIniMes,dDataIniMesAnt,dDataFimMesAnt,dDataINSS,dDataIniIRRF,dDataFimIRRF : TDateTime;
  dDataSaldoAnt, dDataDARF, dDataAnt, dDataIni, dDataFim : TDateTime;

  bGeraAnalitica : Boolean;
  sPatro, sPlano : String;
  iSaldoAntINSS, iSaldoAntIRRF, iQuarta, iPatro, iPlanoPrev, iPessoa : Integer;



implementation
{$R *.DFM}



procedure TfrmConsDisponibilidadeMTSpc.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;



procedure TfrmConsDisponibilidadeMTSpc.TimerTimer(Sender: TObject);
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



procedure TfrmConsDisponibilidadeMTSpc.FormShow(Sender: TObject);
begin
  inherited;
  edtIntervalo.Time := StrToTime('00:10:00');
  fMaxValor := 0;
  fMinValor := 0;
  PgcSaldos.ActivePage := tbsSintetica;
  bFaz := False;
  bFirstAtualiza := True;
  edtDataIni.Text := DateToStr(Now);

  //AL_26
  tbsGrafico.TabVisible := False;
end;



procedure TfrmConsDisponibilidadeMTSpc.bbtnIniciarClick(Sender: TObject);
begin
  inherited;
   //AL_26 Ini
   if Trim(edtDataIni.Text) <> '' then
   begin
      if not DiasUteis.DiaUtil(edtDataIni.Date,-1,1,'',True,True,False) then
      begin
         edtDataIni.Date := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,edtDataIni.Date,True,True,False);
         edtDtFim.Date := edtDataIni.Date;
         MsgDlg('A Data Inicial deve ser um dia útil','Atenção',mtWarning,[mbOk],0);
         if edtDataIni.CanFocus then
            edtDataIni.SetFocus;
         Exit;
      end
      else if not DiasUteis.DiaUtil(edtDtFim.Date, -1, 1, '', True, False, False) then
      begin
         edtDtFim.Date := edtDataIni.Date;
         MsgDlg('A Data Final deve ser um dia útil','Atenção',mtWarning,[mbOk],0);
         if edtDtFim.CanFocus then
            edtDtFim.SetFocus;
         Exit;
      end
      else if edtDataIni.Date < CdsParamFinancDATAINIDISPFINANC.AsDateTime then
      begin
         MsgDlg('A Data Inicial não pode ser menor que a Inicial de Disponibilidade '+ #13 +
                'definida no Parâmetro do Sistema (' + DateToStr(CdsParamFinancDATAINIDISPFINANC.AsDateTime) + ')','Atenção',mtWarning,[mbOk],0);
         edtDataIni.Text := edtDataIni.Text;
         if edtDataIni.CanFocus then
            edtDataIni.SetFocus;
         Exit;
      end
      else if edtDtFim.Date < edtDataIni.Date then
      begin
         MsgDlg('A Data Final não pode ser menor que a Data Inicial.','Atenção',mtWarning,[mbOk],0);
         edtDtFim.Text := edtDataIni.Text;
         if edtDataIni.CanFocus then
            edtDataIni.SetFocus;
         Exit;
      end
      else if Trim(edtDtFim.Text) = '' then
      begin
         MsgDlg('A Data Final não foi informada.','Atenção',mtWarning,[mbOk],0);
         edtDtFim.Text := edtDataIni.Text;
         if edtDataIni.CanFocus then
            edtDataIni.SetFocus;
         Exit;
      end;
   end
   else
   begin
      MsgDlg('A Data Inicial não foi informada.','Atenção',mtWarning,[mbOk],0);
      if edtDataIni.CanFocus then
         edtDataIni.SetFocus;
      Exit;
   end;
   //AL_26 Fim

   PgcSaldos.ActivePage := tbsSintetica;
   bFaz := True;
   TimerTimer(Sender);
   Atualiza;
end;



procedure TfrmConsDisponibilidadeMTSpc.Atualiza;
begin
   // Desabilita o Timer para não contar o tempo de abertura das queries no intervalo
   if (bFaz) then
   begin
      CdsDispAnalitica.Close;
      CdsDispSintetica.Close;
      Timer.Enabled := False;

      // Aciona a animação
      Animate.Visible := True;
      Animate.Active := True;
      Application.ProcessMessages;

      dbgSintetico.Visible := True;
      dbgAnalitico.Visible := True;

      //AL_26 Ini
      CtrlDisponFinanc.LimpaDispFinanc(Sistema.IdUsuario);

      dDataIni := StrToDate(edtDataIni.Text);
      dDataFim := StrToDate(edtDtFim.Text);

      while dDataIni <= dDataFim do
      begin
         CtrlDisponFinanc.MontaParametros(dDataIni,Sistema.IdEmpresa,
           dDataAnt, dDataSaldoAnt, dDataINSS, dDataIniMes,
           dDataIniMesAnt, dDataFimMesAnt, dDataIniIRRF, dDataFImIRRF,
           dDataDARF, iQuarta, iSaldoAntIRRF,
           iSaldoAntINSS);

         with spDisponibilidade do
         begin
            ParamByName('dDataRef').AsDatetime       := dDataIni;
            ParamByName('dDataAnt').AsDatetime       := dDataAnt;
            ParamByName('dDataSaldoAnt').AsDatetime  := dDataSaldoAnt;
            ParamByName('dDataINSS').AsDatetime      := dDataINSS;
            ParamByName('dDataIniMes').AsDatetime    := dDataIniMes;
            ParamByName('dDataIniMesAnt').AsDatetime := dDataIniMesAnt;
            ParamByName('dDataFimMesAnt').AsDatetime := dDataFimMesAnt;
            ParamByName('dDataIniIRRF').AsDatetime   := dDataIniIRRF;
            ParamByName('dDataFImIRRF').AsDatetime   := dDataFImIRRF;
            ParamByName('iQuarta').AsInteger         := iQuarta;
            ParamByName('iSaldoAntIRRF').AsInteger   := iSaldoAntIRRF;
            ParamByName('iSaldoAntINSS').AsInteger   := iSaldoAntINSS;
            ParamByName('iPessoa').AsInteger         := Sistema.IdEmpresa;
            //AL_27
            ParamByName('iUsuario').AsInteger        := Sistema.IdUsuario;
            ExecProc;
         end;
         // Avança o Período
         dDataIni := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dDataIni,True,True,False);
      end;
      //AL_26 Fim

      CdsDispSintetica.Data := CtrlDisponFinanc.ListDispSintetica(edtDataIni.Date,
                                                                  edtDtFim.Date,
                                                                  Sistema.IdEmpresa,
                                                                  Sistema.IdUsuario);

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



procedure TfrmConsDisponibilidadeMTSpc.PgcSaldosChange(Sender: TObject);
begin
   inherited;
   bmPosicao := CdsDispSintetica.GetBookmark;
   cmbTipos.Text := '';
   if PgcSaldos.ActivePage = tbsAnalitica then
   begin
      qryDebug.Close;
      qryDebug.SQL.Clear;
      dbgAnalitico.RefreshDisplay;

      //AL_27
      CdsDispAnalitica.Data := CtrlDisponFinanc.ListDispAnalitica(Sistema.IdEmpresa,
                                                                  CdsDispSinteticaIDPATRO.AsInteger,
                                                                  CdsDispSinteticaIDPLANO.AsInteger,
                                                                  Sistema.IdUsuario,
                                                                  edtDataIni.Date, edtDtFim.Date);
      //AL_28
      if (CdsDispSinteticaIDPATRO.AsInteger <> -1) and (CdsDispSinteticaIDPLANO.AsInteger <> -1) then
      begin
         CtrlDisponFinanc.IncluiLogDisponibilidade(CdsDispSinteticaDATAREF.AsDateTime,
                                                   Sistema.IdUsuario,
                                                   CdsDispSinteticaIDPLANO.AsInteger,
                                                   CdsDispSinteticaIDPATRO.AsInteger,
                                                   Sistema.IdEmpresa,
                                                   0, 0,
                                                   CdsDispSinteticaSALDODIA.AsFloat,
                                                   CdsDispSinteticaRECEBIMENTOS.AsFloat,
                                                   CdsDispSinteticaDESEMBOLSOS.AsFloat,
                                                   0, 0,
                                                   '',
                                                   'SALDO FINAL   - ' + CdsDispSinteticaNOMEPLANOPATRO.AsString,
                                                   CdsDispAnaliticaPLANO.AsString,
                                                   CdsDispAnaliticaPATRO.AsString,
                                                   '',
                                                   CdsDispSinteticaNOMEPLANOPATRO.AsString,
                                                   '',
                                                   '4');

         CdsDispAnalitica.Data := CtrlDisponFinanc.ListDispAnalitica(Sistema.IdEmpresa,
                                                                     CdsDispSinteticaIDPATRO.AsInteger,
                                                                     CdsDispSinteticaIDPLANO.AsInteger,
                                                                     Sistema.IdUsuario,
                                                                     edtDataIni.Date, edtDtFim.Date);
      end;

      //AL_28
      if (CdsDispSinteticaIDPATRO.AsInteger = -1) and (CdsDispSinteticaIDPLANO.AsInteger = -1) then
      begin
         sPlano := 'Todos os Planos / Patro';
         sPatro := '';
         CdsDispAnalitica.Fields[8].Visible := True; // NOMEPLANOPATRO
      end
      else
      begin
         sPatro := CdsDispAnaliticaPATRO.AsString;
         sPlano := CdsDispAnaliticaPLANO.AsString;
         CdsDispAnalitica.Fields[8].Visible := False; // NOMEPLANOPATRO
      end;

      // Inclui Saldo Final
      CdsDispAnalitica.DisableControls;
      //AL_26 Ini
      dDataIni := StrToDate(edtDataIni.Text);
      dDataFim := StrToDate(edtDtFim.Text);
      CdsDispAnalitica.Filtered := True;
      CdsDispAnalitica.Filter   := 'DATAREF = ' + quotedStr(DateToStr(CdsDispSinteticaDATAREF.AsDateTime));
      if not CdsDispAnalitica.IsEmpty then
      begin
         if CdsDispAnalitica.Locate('TIPOREG','5',[]) then // TOTAL GERAL INICIAL
         begin
            CdsDispAnalitica.Edit;
            CdsDispAnaliticaSALDOANT.AsFloat     := CdsDispSinteticaSALDODIA.AsFloat;
            CdsDispAnalitica.Post;
         end;
         //AL_28
      //AL_26 Fim
      CdsDispAnalitica.EnableControls;
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



procedure TfrmConsDisponibilidadeMTSpc.FormCreate(Sender: TObject);
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
   edtDataIni.Date      := CdsParamFinanc.FieldByName('DATABLOQDISPFINAN').AsDateTime;

   _sql               := TCmSqlParams.Create(nil);

   AtualizaGrids;
end;



procedure TfrmConsDisponibilidadeMTSpc.FormDestroy(Sender: TObject);
begin
   FreeAndNil(CtrlParamFinanc);
   CtrlDisponibxusu.Free;
   CtrlDisponFinanc.Free;
  inherited;
   _sql.Free;
end;



procedure TfrmConsDisponibilidadeMTSpc.eOnMessage(sMsg : string);
begin
  MsgDlg(sMsg,'Atenção',mtWarning,[mbOk],0);
end;



procedure TfrmConsDisponibilidadeMTSpc.edtDataIniExit(Sender: TObject);
begin
  inherited;
  begin
    AtualizaGrids;
    if Trim(edtDataIni.Text) <> '' then edtDtFim.Text := edtDataIni.Text
  end;
end;



procedure TfrmConsDisponibilidadeMTSpc.AtualizaGrids;
begin
   bConciliada := False;
   dbgSintetico.Visible := True;
   dbgAnalitico.Visible := True;
end;



procedure TfrmConsDisponibilidadeMTSpc.dbgAnaliticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmConsDisponibilidadeMTSpc.dbgDispAnaliticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmConsDisponibilidadeMTSpc.dbgDispSinteticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmConsDisponibilidadeMTSpc.dbgSinteticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmConsDisponibilidadeMTSpc.dbgAnaliticoTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMTSpc.dbgDispAnaliticaTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMTSpc.dbgDispSinteticaTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMTSpc.dbgSinteticoTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMTSpc.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
   lblEmpresaSintetica.Caption := Sistema.NomeEmpresa;
   lblEmpresaAnalitica.Caption := Sistema.NomeEmpresa;
   lblGrafico.Caption          := Sistema.NomeEmpresa;
   lblDataGrafico.Caption      := edtDataIni.Text;
   lblDataSintetica.Caption    := 'Período : ' + edtDataIni.Text + ' a ' + edtDtFim.Text;
   lblDataAnalitica.Caption    := edtDataIni.Text;

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

      pplCaptionDispAnalitica.Caption := 'Disponibilidade Analítica' +' : ' + sPlano +' / ' + sPatro;
      TfrmPreview.CreateModalPreview(Application,
                                     rptDispAnalitica,
                                     rptDispAnalitica.PrinterSetup.DocumentName);
      CdsDispAnalitica.EnableControls;
   end
   else if PgcSaldos.ActivePage = tbsGrafico then
   begin
      CdsDispSintetica.DisableControls;
      TfrmPreview.CreateModalPreview(Application,
                                     rptDispGrafico,
                                     rptDispGrafico.PrinterSetup.DocumentName);
      CdsDispSintetica.EnableControls;
   end;
end;



procedure TfrmConsDisponibilidadeMTSpc.rptDispAnaliticaStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   ppShape4.Brush.Color := clWhite;
   bFirst := True;
end;



procedure TfrmConsDisponibilidadeMTSpc.ppGroupFooterBand1BeforePrint(
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



procedure TfrmConsDisponibilidadeMTSpc.ppShape3Print(Sender: TObject);
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



procedure TfrmConsDisponibilidadeMTSpc.ppShape4Print(Sender: TObject);
begin
  inherited;
   if cCorZebra = clWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := clWhite;

   if (CdsDispAnaliticaIDPATRO.AsInteger = -1) or (CdsDispAnaliticaIDPATRO.AsInteger = 9999999) then
   begin
      TppShape(Sender).Brush.Color := clSilver;
      TppShape(Sender).Pen.Style := psSolid;
   end
   else
   begin
      TppShape(Sender).Brush.Color := cCorZebra;
      TppShape(Sender).Pen.Style := psClear;
   end;

   if CdsDispAnaliticaTIPOREG.AsInteger = 1 then // Saldo Incial
      dbtSaldoDoDia.BlankWhenZero := False
   else
      dbtSaldoDoDia.BlankWhenZero := True;
end;



function TfrmConsDisponibilidadeMTSpc.BuscaDiaRecolhCPMF(dDataIni:TDateTime):TDateTime;
var dData : TDateTime;
begin
   // Buscar a Quarta-feira da semana da DataRef.
   dData := dDataIni;
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



function TfrmConsDisponibilidadeMTSpc.BuscaPrimeiroDiaIRRF(dDataIni:TDateTime):TDateTime;
var dData : TDateTime;
begin
   // Buscar a Segunda-feira da semana anterior da DataRef.
   dData := dDataIni;
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



function TfrmConsDisponibilidadeMTSpc.BuscaPrimeiDiaAposCPMF(dDataIni:TDateTime):TDateTime;
var dData : TDateTime;
begin
    dData := BuscaDiaRecolhCPMF(StrToDate(edtDataIni.Text));
    Result := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dData,True,True,False);
end;



procedure TfrmConsDisponibilidadeMTSpc.btnDebugClick(Sender: TObject);
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
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAREF'      , QuotedStr(DateToStr(dDataIni)));
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
            //qryDebug.sql.savetofile('c:\qryDebug.txt');
            qryDebug.sql.savetofile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\qryDebug.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
         //AL_1 Fim
         end
         else
            MsgDlg('A TAG ' + cmbTipos.Value + ' não foi encontrada no SQL','Atenção',mtWarning,[mbOk],0);
      end
         else
            MsgDlg('A Disponibilidade Consolidada não foi executada.','Atenção',mtWarning,[mbOk],0);
   end;
end;



procedure TfrmConsDisponibilidadeMTSpc.cmbTiposChange(Sender: TObject);
begin
   inherited;
   with qryDebug do
   begin
      Close;
      SQL.Clear;
   end;
end;



function TfrmConsDisponibilidadeMTSpc.TrocaString(sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
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



procedure TfrmConsDisponibilidadeMTSpc.dbgDebugCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmConsDisponibilidadeMTSpc.dbgDebugTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMTSpc.ppCabGrpNomePlanoPatroBeforePrint(Sender: TObject);
begin
   //AL_28
   if CdsDispAnaliticaNOMEPLANOPATRO.AsString = 'TOTAL GERAL - Final' then
      ppCabGrpNomePlanoPatro.Visible := False
   else
      ppCabGrpNomePlanoPatro.Visible := True;
  inherited;
end;



end.
