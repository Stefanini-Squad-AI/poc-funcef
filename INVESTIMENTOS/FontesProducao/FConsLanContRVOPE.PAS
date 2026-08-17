//******************************************************************************
// Data     : 03/01/2007
// Código   : AL_2
// Pendencia: 24099
// SOL      :
// Desc     : Retirada da obrigatoriedade do Plano / Patro na qryBoleta, qryHistoricos
//******************************************************************************
// Data     : 27/10/2006
// Código   : AL_1
// Pendencia: 22989
// SOL      :
// Desc     : Segregação de Planos
//******************************************************************************

unit FConsLanContRVOPE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Db,
  DBTables, FPreview;

type
  TfrmConsLanContRVOPE = class(TfrmOkCancelarInv)
    pnlDados: TPanel;
    Label1: TLabel;
    dtDataRef: TCMDateTimePicker;
    pnlBoletas: TPanel;
    dbgBoletas: TwwDBGrid;
    splBoletas: TSplitter;
    pnlDetalhes: TPanel;
    pnlLancamento: TPanel;
    splDetalhes: TSplitter;
    pnlHistoricos: TPanel;
    dbgHistorico: TwwDBGrid;
    dbgLancamento: TwwDBGrid;
    bbtnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    //AL_1
    LkcPlanPatro: TwwDBLookupCombo;
    lblPlanoPatro: TLabel;
    procedure dbgHistoricoDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure dbgBoletasDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    //AL_1
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    //AL_1
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    //AL_2
    procedure dtDataRefExit(Sender: TObject);
    procedure dtDataRefEnter(Sender: TObject);
  private
    { Private declarations }
    //AL_2
    dDataAnt : TDateTime;
    //AL_1
  public
    { Public declarations }
  end;

var
  frmConsLanContRVOPE: TfrmConsLanContRVOPE;
  //AL_1
const clCorAmarelo: TColor = $00C0FFFF;

implementation

//AL_1
uses UOperComum, UBibliotecaInvest, FDmRelLanContRVOPE, FPrincipal, uMensErro;

{$R *.DFM}

{ TfrmConsLanContRVOPE }

//AL_1
procedure TfrmConsLanContRVOPE.dbgHistoricoDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   inherited;
   if (DmRelLanContRVOPE.qryHistoricos.Active) and
      (not DmRelLanContRVOPE.qryHistoricos.IsEmpty) then
   begin
      if not ((gdSelected in State) or (gdFixed in State)) then
      begin
         dbgHistorico.Canvas.Brush.Color := DmRelLanContRVOPE.qryHistoricosCOR.AsInteger;
         dbgHistorico.Canvas.Font.Color := clBlack;
         dbgHistorico.DefaultDrawDataCell(Rect, Field, State);
      end
      else if (gdSelected in State) or (gdFocused in State) then
      begin
         dbgHistorico.Canvas.Brush.Color := DmRelLanContRVOPE.qryHistoricosCOR.AsInteger;
         dbgHistorico.Canvas.Font.Color := clBlack;
         dbgHistorico.DefaultDrawDataCell(Rect, Field, State);
      end;
   end;
end;

procedure TfrmConsLanContRVOPE.dbgBoletasDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   inherited;
   if (DmRelLanContRVOPE.qryBoletas.Active) and
      (not DmRelLanContRVOPE.qryBoletas.IsEmpty) then
   begin
      if not ((gdSelected in State) or (gdFixed in State)) then
      begin
         dbgBoletas.Canvas.Brush.Color := DmRelLanContRVOPE.qryBoletasCOR.AsInteger;
         dbgBoletas.Canvas.Font.Color := clBlack;
         dbgBoletas.DefaultDrawDataCell(Rect, Field, State);
      end
      else if (gdSelected in State) or (gdFocused in State) then
      begin
         dbgBoletas.Canvas.Brush.Color := DmRelLanContRVOPE.qryBoletasCOR.AsInteger;
         dbgBoletas.Canvas.Font.Color := clBlack;
         dbgBoletas.DefaultDrawDataCell(Rect, Field, State);
      end;
   end;
end;

//AL_1
procedure TfrmConsLanContRVOPE.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   with DmRelLanContRVOPE do
   begin
      OperComum.LimpaParametros(qryBoletas);
      OperComum.LimpaParametros(qryHistoricos);
      OperComum.LimpaParametros(qryLancamento);
      qryBoletas.Open;
      qryHistoricos.Open;
      qryLancamento.Open;
   end;
   bbtnImprimir.Enabled := False;
end;

procedure TfrmConsLanContRVOPE.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  with DmRelLanContRVOPE do
  begin
     //AL_1
     if not qryBoletas.IsEmpty then
     begin
        qryBoletas.DisableControls;
        qryHistoricos.DisableControls;
        qryLancamento.DisableControls;

        //AL_2

        TfrmPreview.CreateModalPreview(Application,
                                       pprLanContRVOPE,
                                       pprLanContRVOPE.PrinterSetup.DocumentName);

        qryBoletas.EnableControls;
        qryHistoricos.EnableControls;
        qryLancamento.EnableControls;
     end;
  end;
end;

procedure TfrmConsLanContRVOPE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DmRelLanContRVOPE do
  begin
     qryBoletas.Close;
     qryHistoricos.Close;
     qryLancamento.Close;
  end;
end;

procedure TfrmConsLanContRVOPE.FormCreate(Sender: TObject);
begin
  inherited;
   //AL_1
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

//AL_1
procedure TfrmConsLanContRVOPE.FormShow(Sender: TObject);
begin
  inherited;
   DmRelLanContRVOPE.QryPlanoPatro.Open;
end;

//AL_1
procedure TfrmConsLanContRVOPE.bbtnConfirmarClick(Sender: TObject);
var iInvestimento: Integer;
    sBoleta: String;
    clCorLinha: TColor;
begin

  inherited;

  if (Trim(dtDataRef.Text) = '') then
  begin
     MsgDlg('Informe a Data de Referência!','Mensagem do Sistema ',mtWarning,[mbOK],0);
     if dtDataRef.CanFocus then
        dtDataRef.SetFocus;
     Exit;
  end;
  //AL_2

  with DmRelLanContRVOPE do
  begin
     qryBoletas.DisableControls;
     qryHistoricos.DisableControls;
     qryLancamento.DisableControls;

     OperComum.LimpaParametros(qryBoletas);
     qryBoletas.ParamByName('DATA').AsString := dtDataRef.Text;
     //AL_2
     if Trim(LkcPlanPatro.Text) <> '' then
        qryBoletas.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(LkcPlanPatro.LookupValue);
     qryBoletas.Open;

     OperComum.LimpaParametros(qryHistoricos);
     //AL_2
     if Trim(LkcPlanPatro.Text) <> '' then
        qryHistoricos.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(LkcPlanPatro.LookupValue);
     qryHistoricos.ParamByName('DATABOLETA').AsString := dtDataRef.Text;
     qryHistoricos.Open;

     sBoleta := '';
     clCorLinha := clWhite;
     while not qryBoletas.Eof do
     begin
        if not (qryBoletasIDBOLETA.AsString = sBoleta) then
        begin
           if clCorLinha = clCorAmarelo then
              clCorLinha := clWhite
           else
              clCorLinha := clCorAmarelo;

           sBoleta := qryBoletasIDBOLETA.AsString;
        end;

        qryBoletas.Edit;
        qryBoletasCOR.AsInteger := clCorLinha;
        qryBoletas.Post;

        qryBoletas.Next;
     end;
     qryBoletas.First;

     iInvestimento := 0;
     clCorLinha := clWhite;
     while not qryHistoricos.Eof do
     begin
        if not (qryHistoricosIDINVESTIMENTO.AsInteger = iInvestimento) then
        begin
           if clCorLinha = clCorAmarelo then
              clCorLinha := clWhite
           else
              clCorLinha := clCorAmarelo;

           iInvestimento := qryHistoricosIDINVESTIMENTO.AsInteger;
        end;

        qryHistoricos.Edit;
        qryHistoricosCOR.AsInteger := clCorLinha;
        qryHistoricos.Post;

        qryHistoricos.Next;
     end;
     qryHistoricos.First;

     if not qryBoletas.Eof then
        bbtnImprimir.Enabled := True
     else
        bbtnImprimir.Enabled := False;

     qryBoletas.EnableControls;
     qryHistoricos.EnableControls;
     qryLancamento.EnableControls;
  end;
end;

//AL_2
procedure TfrmConsLanContRVOPE.dtDataRefExit(Sender: TObject);
begin
  inherited;
   if dDataAnt <> dtDataRef.Date then
      bbtnCancelarClick(self);
end;

//AL_2
procedure TfrmConsLanContRVOPE.dtDataRefEnter(Sender: TObject);
begin
  inherited;
  dDataAnt := dtDataRef.Date;
end;

end.
