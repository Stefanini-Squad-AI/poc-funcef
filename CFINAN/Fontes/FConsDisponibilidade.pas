// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit FConsDisponibilidade;

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
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE;

type
  TfrmConsDisponibilidade = class(TfrmSairAjuda)
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
    edtDataRef: TCMDateTimePicker;
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
    CdsDispAnaliticaNOMEPLANOPATRO: TStringField;
    CdsDispAnaliticaHISTORICO: TStringField;
    CdsDispAnaliticaIDPLANO: TFloatField;
    CdsDispAnaliticaIDPATRO: TFloatField;
    CdsDispAnaliticaDATADISPFINANC: TDateTimeField;
    dsDispSintetica: TwwDataSource;
    dsDispAnalitica: TwwDataSource;
    dspDispAnalitica: TDataSetProvider;
    dspDispSintetica: TDataSetProvider;
    qryDispSintetica: TwwQuery;
    qryDispAnalitica: TwwQuery;
    qrySintetica: TwwQuery;
    qrySinteticaIDPATRO: TFloatField;
    qrySinteticaNOMEPLANOPATRO: TStringField;
    qrySinteticaNOMEPLANO: TStringField;
    qrySinteticaNOMEPATRO: TStringField;
    qrySinteticaSALDOANT: TFloatField;
    qrySinteticaRECEBIMENTOS: TFloatField;
    qrySinteticaDESEMBOLSOS: TFloatField;
    qrySinteticaSALDODIA: TFloatField;
    qrySinteticaDIF: TFloatField;
    CdsDispSinteticaNOMEPLANOPATRO: TStringField;
    CdsDispSinteticaDATADISPFINANC: TDateTimeField;
    CdsDispSinteticaSALDOANT: TFloatField;
    CdsDispSinteticaDESENBOLSOS: TFloatField;
    CdsDispSinteticaRECEBIMENTOS: TFloatField;
    CdsDispSinteticaSALDODIA: TFloatField;
    CdsDispAnaliticaVALOR: TFloatField;
    CdsDispSinteticaIDPLANO: TFloatField;
    CdsDispSinteticaIDPATRO: TFloatField;
    CdsDispAnaliticaNOMEFORCLI: TStringField;
    tbsGrafico: TTabSheet;
    grfSintetica: TDBChart;
    Series1: TBarSeries;
    bbtnImprimir: TBitBtn;
    pplSintetica: TppBDEPipeline;
    pplAnalitica: TppBDEPipeline;
    rptDispAnalitica: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    lblEmpresaAnalitica: TppLabel;
    shpDispAnaCabecalho: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand2: TppDetailBand;
    shpDispAnaDetalhe: TppShape;
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
    shpDispConDetalhe: TppShape;
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
    qrySinteticaIDPLANO: TFloatField;
    Animate: TAnimate;
    ppLabel8: TppLabel;
    ppLabel15: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    qryAnaliticaNODOCUMENTO: TStringField;
    qryAnaliticaNOMEFORCLI: TStringField;
    qryAnaliticaVALOR: TFloatField;
    qryAnaliticaNOMEPLANOPATRO: TStringField;
    qryAnaliticaIDPLANO: TFloatField;
    qryAnaliticaIDPATRO: TFloatField;
    qryAnaliticaTIPOREG: TFloatField;
    qryAnaliticaSALDO: TFloatField;
    qryAnaliticaRECEBIMENTOS: TFloatField;
    qryAnaliticaDESEMBOLSOS: TFloatField;
    qryAnaliticaCODCENTRORESPON: TStringField;
    qryAnaliticaNOME: TStringField;
    dbiLogoEmpresa: TppDBImage;
    ppDBImage1: TppDBImage;
    ppDBImage2: TppDBImage;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine1: TppLine;
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
    ppLine3: TppLine;
    procedure FormActivate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnIniciarClick(Sender: TObject);
    procedure PgcSaldosChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgSinteticoDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure dbgAnaliticoDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
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
    procedure shpDispAnaDetalhePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
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

  public
    { Public declarations }
    bmPosicao: TBookmark;
  end;

var
  frmConsDisponibilidade: TfrmConsDisponibilidade;
  bFirst,bConciliada,bFirstAtualiza : boolean;

implementation

uses FPrincipal;

{$R *.DFM}

procedure TfrmConsDisponibilidade.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;

procedure TfrmConsDisponibilidade.TimerTimer(Sender: TObject);
begin
  inherited;
   if bFirstAtualiza = True then
   begin
      Timer.Interval := 5000; // dois segundos
      bFaz := True;
      Atualiza;
      bFaz := False;
   end
   else
   begin
      iIntervalo := 0;
      iIntervalo := iIntervalo +  StrToInt( FormatDateTime('ss',edtIntervalo.Time));
      iIntervalo := iIntervalo + (StrToInt( FormatDateTime('nn',edtIntervalo.Time))* 60 );
      iIntervalo := iIntervalo + (StrToInt( FormatDateTime('hh',edtIntervalo.Time))* 3600 );
      iIntervalo := iIntervalo * 1000;
      Timer.Interval := iIntervalo;
      Atualiza;
   end;
end;

procedure TfrmConsDisponibilidade.FormShow(Sender: TObject);
begin
  inherited;
  edtIntervalo.Time := StrToTime('00:10:00');
  qryEmpresa.Open;
  fMaxValor := 0;
  fMinValor := 0;
  PgcSaldos.ActivePage := tbsSintetica;
  bFirstAtualiza := True;
end;

procedure TfrmConsDisponibilidade.bbtnIniciarClick(Sender: TObject);
begin
  inherited;
  PgcSaldos.ActivePage := tbsSintetica;
  bFaz := True;
  Atualiza;
end;

procedure TfrmConsDisponibilidade.Atualiza;
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

      qrySintetica.DisableControls;
      qrySintetica.Close;
      qrySintetica.ParamByName('DATAREF').AsString := edtDataRef.Text;
      qrySintetica.ParamByName('IDPESSOA').AsInteger := qryEmpresaIDPESSOA.AsInteger;
      qrySintetica.Open;
      qrySintetica.EnableControls;

      CMSqlParams1.SQL.Clear;
      CMSqlParams1.SQL.add(qrySintetica.sql.text);
      //CMSqlParams1.sql.savetofile('c:\QrySintetica.txt');
      CMSqlParams1.sql.savetofile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\QrySintetica.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

      // Atualiza a disponibilidade Analítica
      with qryAnalitica do
      begin
         DisableControls;
         Close;
         ParamByName('DATAREF').AsString := edtDataRef.Text;
         ParamByName('IDPESSOA').AsInteger := qryEmpresaIDPESSOA.AsInteger;
         Open;

         CMSqlParams1.SQL.Clear;
         CMSqlParams1.SQL.add(qryAnalitica.sql.text);
         //CMSqlParams1.sql.savetofile('c:\qryAnalitica.txt');
         CMSqlParams1.sql.savetofile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\qryAnalitica.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

         EnableControls;
      end;

      // Esconde a animação
      Animate.Active := False;
      Animate.Visible := False;

      // Habilita o Timer
      Timer.Enabled := True;
      if bFirstAtualiza then
         bFirstAtualiza := False;
   end;
end;

procedure TfrmConsDisponibilidade.PgcSaldosChange(Sender: TObject);
begin
   inherited;
   bmPosicao := qrySintetica.GetBookmark;
   if PgcSaldos.ActivePage = tbsGrafico then
   begin
      if (qrySinteticaIDPATRO.AsInteger <> -1) and (qrySinteticaIDPLANO.AsInteger <> -1) then
      begin
         qrySintetica.Filter := 'IDPLANO >= 0 AND IDPATRO >= 0';
         grfSintetica.RefreshData;
      end;
   end
   else if PgcSaldos.ActivePage = tbsAnalitica then
   begin
      if (qrySinteticaIDPATRO.AsInteger <> -1) and (qrySinteticaIDPLANO.AsInteger <> -1) then
{         qryAnalitica.Filter := '((TIPOREG = 1) AND (IDPLANO = -1) AND (IDPATRO = -1)) OR ' +
                                '((TIPOREG = 4) AND (IDPLANO = 9999999) AND (IDPATRO = 9999999)) OR ' +
                                '((TIPOREG = 2) AND (IDPLANO = -1) AND (IDPATRO = -1)) OR ' +
                                '((TIPOREG = 3) AND (IDPLANO = -1) AND (IDPATRO = -1))'
}
         qryAnalitica.Filter := 'IDPLANO = ' + qrySinteticaIDPLANO.AsString + ' AND ' +
                              'IDPATRO = ' + qrySinteticaIDPATRO.AsString + ' AND ' +
                              'IDPLANO IS NOT NULL AND IDPATRO IS NOT NULL'
      else
         qryAnalitica.Filter := '';
         
      dbgAnalitico.RefreshDisplay;
   end else if PgcSaldos.ActivePage = tbsSintetica then
      qrySintetica.Filter := '';
   qrySintetica.GotoBookmark(bmPosicao);
   qrySintetica.FreeBookmark(bmPosicao);
end;

procedure TfrmConsDisponibilidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryEmpresa.Close;
end;

procedure TfrmConsDisponibilidade.dbgSinteticoDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   inherited;
{      if Trim(qrySinteticaNOMEPLANOPATRO.AsString) = 'TOTAIS' then
      begin
         dbgSintetico.Canvas.Brush.Color := clBtnFace;
         dbgSintetico.Canvas.Font.Color := clMaroon;
      end;

      dbgSintetico.DefaultDrawDataCell(Rect, Field, State);
      }
end;

procedure TfrmConsDisponibilidade.dbgAnaliticoDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   inherited;
{      if (Trim(qryAnaliticaTIPOREG.AsString) = '1') or
         (Trim(qryAnaliticaTIPOREG.AsString) = '4') then
      begin
         dbgAnalitico.Canvas.Brush.Color := clBtnFace;
         dbgAnalitico.Canvas.Font.Color := clMaroon;
      end;

      dbgAnalitico.DefaultDrawDataCell(Rect, Field, State);
      }
end;

procedure TfrmConsDisponibilidade.FormCreate(Sender: TObject);
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

//   CdsDispFinanc.Data   := CtrlDisponFinanc.SelecionaDispFinanc(edtDataRef.Date );
//   CdsDispSintetica.Data := CtrlDisponibxusu.SelDispSintetica(Sistema.IdEmpresa,edtDataRef.Date);      CdsDispAnalitica.Data := CtrlDisponibxusu.SelDispAnalitica(Sistema.IdEmpresa,edtDataRef.Date);
//   CdsDispAnalitica.Data := CtrlDisponibxusu.SelDispAnalitica(Sistema.IdEmpresa,edtDataRef.Date);      CdsDispAnalitica.Data := CtrlDisponibxusu.SelDispAnalitica(Sistema.IdEmpresa,edtDataRef.Date);

   AtualizaGrids;
end;

procedure TfrmConsDisponibilidade.FormDestroy(Sender: TObject);
begin
  inherited;
   CtrlParamFinanc.Free;
   CtrlDisponibxusu.Free;
   CtrlDisponFinanc.Free;
end;

procedure TfrmConsDisponibilidade.eOnMessage(sMsg : string);
begin
  MsgDlg(sMsg,'Atenção',mtWarning,[mbOk],0);
end;


procedure TfrmConsDisponibilidade.edtDataRefExit(Sender: TObject);
begin
  inherited;
   begin
      CdsDispFinanc.Data   := CtrlDisponFinanc.SelecionaDispFinanc(edtDataRef.Date );

      AtualizaGrids;
   end;
end;

procedure TfrmConsDisponibilidade.AtualizaGrids;
begin
   bConciliada := False;
   dbgSintetico.Visible := True;
   dbgAnalitico.Visible := True;
end;

procedure TfrmConsDisponibilidade.dbgAnaliticoCalcCellColors(
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

procedure TfrmConsDisponibilidade.dbgDispAnaliticaCalcCellColors(
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

procedure TfrmConsDisponibilidade.dbgDispSinteticaCalcCellColors(
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

procedure TfrmConsDisponibilidade.dbgSinteticoCalcCellColors(
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

procedure TfrmConsDisponibilidade.dbgAnaliticoTopRowChanged(
  Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidade.dbgDispAnaliticaTopRowChanged(
  Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidade.dbgDispSinteticaTopRowChanged(
  Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidade.dbgSinteticoTopRowChanged(
  Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidade.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
   lblEmpresaSintetica.Caption := Sistema.NomeEmpresa;
   lblEmpresaAnalitica.Caption := Sistema.NomeEmpresa;
   lblGrafico.Caption          := Sistema.NomeEmpresa;
   lblDataGrafico.Caption   := edtDataRef.Text;
   lblDataSintetica.Caption := edtDataRef.Text;
   lblDataAnalitica.Caption := edtDataRef.Text;

//   if not bConciliada then
//   begin
     pplSintetica.DataSource := dsSintetica;
     pplAnalitica.DataSource := dsAnalitica;
     pplSintetica.AutoCreateFields := False;
     pplSintetica.AutoCreateFields := True;
     pplAnalitica.AutoCreateFields := False;
     pplAnalitica.AutoCreateFields := True;

     if PgcSaldos.ActivePage = tbsSintetica then
     begin
        qrySintetica.DisableControls;
        TfrmPreview.CreateModalPreview(Application,
                                       rptDispSintetica,
                                       rptDispSintetica.PrinterSetup.DocumentName);
        qrySintetica.EnableControls;
     end else
     if PgcSaldos.ActivePage = tbsAnalitica then
     begin
        qryAnalitica.DisableControls;
        TfrmPreview.CreateModalPreview(Application,
                                       rptDispAnalitica,
                                       rptDispAnalitica.PrinterSetup.DocumentName);
        qryAnalitica.EnableControls;
     end else
     if PgcSaldos.ActivePage = tbsGrafico then
     begin
        qrySintetica.DisableControls;
        TfrmPreview.CreateModalPreview(Application,
                                       rptDispGrafico,
                                       rptDispGrafico.PrinterSetup.DocumentName);
        qrySintetica.EnableControls;
     end;
{   end
   else
   begin
     pplSintetica.DataSource := dsDispSintetica;
     pplAnalitica.DataSource := dsDispAnalitica;
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
        TfrmPreview.CreateModalPreview(Application,
                                       rptDispAnalitica,
                                       rptDispAnalitica.PrinterSetup.DocumentName);
        CdsDispAnalitica.EnableControls;
     end else
     if PgcSaldos.ActivePage = tbsGrafico then
     begin
        CdsDispSintetica.DisableControls;
        TfrmPreview.CreateModalPreview(Application,
                                       rptDispGrafico,
                                       rptDispGrafico.PrinterSetup.DocumentName);
        CdsDispSintetica.EnableControls;
     end;
   end;}
end;

procedure TfrmConsDisponibilidade.rptDispAnaliticaStartPage(
  Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpDispAnaDetalhe.Brush.Color := clWhite;
   bFirst := True;
end;

procedure TfrmConsDisponibilidade.shpDispAnaDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = clWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := clWhite;

   if (qryAnaliticaIDPATRO.AsInteger = -1) or (qryAnaliticaIDPATRO.AsInteger = 9999999) then
      TppShape(Sender).Brush.Color := clSilver
   else
      TppShape(Sender).Brush.Color := cCorZebra

end;

procedure TfrmConsDisponibilidade.ppGroupFooterBand1BeforePrint(
  Sender: TObject);
begin
   if ((Trim(qryAnaliticaNOMEPLANOPATRO.AsString) = '') or
      (Trim(qryAnaliticaNOMEFORCLI.AsString) = 'SALDO INICIAL')) and
      (not bFirst) then
      ppGroupFooterBand1.Visible := False
   else if (bFirst) and
      (Trim(qryAnaliticaNOMEPLANOPATRO.AsString) <> 'TOTAL GERAL') then
      ppGroupFooterBand1.Visible := False
   else
      ppGroupFooterBand1.Visible := True;

   if bFirst then bFirst := False;
  inherited;

end;

end.
