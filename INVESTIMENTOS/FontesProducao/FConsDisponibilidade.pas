unit FConsDisponibilidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, DBTables, Db, Wwdatsrc, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker, Mask, DBCtrls, StdCtrls, TREdit, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBGrids, fcLabel, mxtables, mxstore, mxDB,
  TeeProcs, TeEngine, Chart, mxgraph, Series, DBChart, dxCntner, dxEditor,
  dxExEdtr, dxEdLib, dxDBELib, FPreview;

type
  TfrmConsDisponibilidade = class(TfrmSairAjuda)
    Panel1: TPanel;
    PgcSaldos: TPageControl;
    tbsSintetica: TTabSheet;
    tbsAnalitica: TTabSheet;
    pnlTotais: TPanel;
    DBEdit1: TDBEdit;
    Panel10: TPanel;
    dbgAnalitico: TwwDBGrid;
    pnlTitulo: TPanel;
    lblTitulo: TfcLabel;
    tbsGrafico: TTabSheet;
    Panel3: TPanel;
    dbgConsolidado: TwwDBGrid;
    grfGrafico: TDBChart;
    pnlDados: TPanel;
    bvlSepTit: TBevel;
    edtDataRef: TCMDateTimePicker;
    Label1: TLabel;
    edtIntervalo: TdxTimeEdit;
    Label2: TLabel;
    bbtnIniciar: TBitBtn;
    Timer: TTimer;
    qryEmpresa: TwwQuery;
    qryEmpresaIDPESSOA: TFloatField;
    Series1: TBarSeries;
    Animate: TAnimate;
    lblAtualizando: TStaticText;
    bbtnImprimir: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormActivate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnIniciarClick(Sender: TObject);
    procedure PgcSaldosChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgConsolidadoDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure dbgAnaliticoDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure bbtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    bFaz: Boolean;
    fMaxValor, fMinValor: Double;
    iIntervalo: Integer;
    procedure Atualiza;
  public
    { Public declarations }
    bmPosicao: TBookmark;
  end;

var
  frmConsDisponibilidade: TfrmConsDisponibilidade;

implementation

uses FPrincipal, FDmRelDisponibilidade;

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
  if (bFaz) and (DmRelDisponibilidade.qrySintetica.Active) then
     Atualiza;
end;

procedure TfrmConsDisponibilidade.FormShow(Sender: TObject);
begin
  inherited;
  bFaz := False;
  edtDataRef.DateTime := Date;
  edtIntervalo.Time := StrToTime('00:10:00');
  qryEmpresa.Open;
  fMaxValor := 0;
  fMinValor := 0;
  PgcSaldos.ActivePage := tbsSintetica;
end;

procedure TfrmConsDisponibilidade.bbtnIniciarClick(Sender: TObject);
begin
  inherited;
  bFaz := True;
  iIntervalo := 0;
  iIntervalo := iIntervalo +  StrToInt( FormatDateTime('ss',edtIntervalo.Time));
  iIntervalo := iIntervalo + (StrToInt( FormatDateTime('nn',edtIntervalo.Time))* 60 );
  iIntervalo := iIntervalo + (StrToInt( FormatDateTime('hh',edtIntervalo.Time))* 3600 );
  iIntervalo := iIntervalo * 1000;
  Timer.Interval := iIntervalo;
  Atualiza;
end;

procedure TfrmConsDisponibilidade.Atualiza;
begin
   // Desabilita o Timer para não contar o tempo de abertura das queries no intervalo
   Timer.Enabled := False;

   // Aciona a animação
   Animate.Visible := True;
   Animate.Active := True;
   Application.ProcessMessages;
   lblAtualizando.Visible := True;
   lblAtualizando.Refresh;

   with DmRelDisponibilidade do
   begin
      // Atualiza a disponibilidade Sintética
      qrySintetica.DisableControls;
      qrySintetica.Close;
      qrySintetica.ParamByName('DATAREF').AsString := edtDataRef.Text;
      qrySintetica.ParamByName('IDPESSOA').AsInteger := qryEmpresaIDPESSOA.AsInteger;
      qrySintetica.Open;
      qrySintetica.EnableControls;

      // Atualiza a disponibilidade Analítica
      with qryAnalitica do
      begin
         DisableControls;
         Close;
         ParamByName('DATAREF').AsString := edtDataRef.Text;
         ParamByName('IDPESSOA').AsInteger := qryEmpresaIDPESSOA.AsInteger;
         Open;
         EnableControls;
      end;
   end;

   // Esconde a animação
   Animate.Active := False;
   Animate.Visible := False;
   lblAtualizando.Visible := False;

   // Habilita o Timer
   Timer.Enabled := True;

end;

procedure TfrmConsDisponibilidade.PgcSaldosChange(Sender: TObject);
begin
   inherited;
   with DmRelDisponibilidade do
   begin
      bmPosicao := qrySintetica.GetBookmark;
      if PgcSaldos.ActivePage = tbsGrafico then
      begin
         qrySintetica.Filter := 'IDPLANOPREV >= 0 AND IDPATRO >= 0';
         grfGrafico.RefreshData;
      end else
      if PgcSaldos.ActivePage = tbsAnalitica then
      begin
         if (qrySinteticaIDPATRO.AsInteger = -1) and (qrySinteticaIDPLANOPREV.AsInteger = -1) then
            qryAnalitica.Filter := '((TIPOREG = 1) AND (IDPLANOPREV = -1) AND (IDPATRO = -1)) OR ' +
                                 '((TIPOREG = 4) AND (IDPLANOPREV = -1) AND (IDPATRO = -1)) OR ' +
                                 '((TIPOREG = 2) OR  (TIPOREG = 3))'

         else if (qrySinteticaIDPATRO.IsNull) and (qrySinteticaIDPLANOPREV.IsNull) then
            qryAnalitica.Filter := 'IDPLANOPREV IS NULL AND ' +
                                 'IDPATRO IS NULL'
         else
            qryAnalitica.Filter := 'IDPLANOPREV = ' + qrySinteticaIDPLANOPREV.AsString + ' AND ' +
                                 'IDPATRO = ' + qrySinteticaIDPATRO.AsString + ' AND ' +
                                 'IDPLANOPREV IS NOT NULL AND IDPATRO IS NOT NULL';
         dbgAnalitico.RefreshDisplay;
      end else if PgcSaldos.ActivePage = tbsSintetica then
         qrySintetica.Filter := '';
      qrySintetica.GotoBookmark(bmPosicao);
      qrySintetica.FreeBookmark(bmPosicao);
   end;
end;

procedure TfrmConsDisponibilidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryEmpresa.Close;
end;

procedure TfrmConsDisponibilidade.dbgConsolidadoDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   inherited;
   with DmRelDisponibilidade do
   begin
      if Trim(qrySinteticaNOMEPLANOPATRO.AsString) = 'TOTAIS' then
      begin
         dbgConsolidado.Canvas.Brush.Color := clBtnFace;
         dbgConsolidado.Canvas.Font.Color := clMaroon;
      end;

      dbgConsolidado.DefaultDrawDataCell(Rect, Field, State);
   end;
end;

procedure TfrmConsDisponibilidade.dbgAnaliticoDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   inherited;
   with DmRelDisponibilidade do
   begin
      if (Trim(qryAnaliticaTIPOREG.AsString) = '1') or
         (Trim(qryAnaliticaTIPOREG.AsString) = '4') then
      begin
         dbgAnalitico.Canvas.Brush.Color := clBtnFace;
         dbgAnalitico.Canvas.Font.Color := clMaroon;
      end;

      dbgAnalitico.DefaultDrawDataCell(Rect, Field, State);
   end;
end;

procedure TfrmConsDisponibilidade.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  with DmRelDisponibilidade do
  begin
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
  end;
end;

end.
