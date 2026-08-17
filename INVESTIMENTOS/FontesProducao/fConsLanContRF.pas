//******************************************************************************
// Data      : 01/04/2005
// Alteracao : AL_2
// Motivo    : Inclusão do Filtro de Plano/Patrocinadora
//******************************************************************************
// Data      : 02/03/2005
// Alteracao : AL_1
// Motivo    : Limpeza de parâmetro da qryOperacao e acerto na qryOperacao
//******************************************************************************

unit FConsLanContRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery,
  Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker, FPreview,
  wwdblook, faMensagem;

type
  TfrmConsLanContRF = class(TfrmOkCancelarInv)
    pnlDados: TPanel;
    Label1: TLabel;
    dtDataRef: TCMDateTimePicker;
    dbgLanContRF: TwwDBGrid;
    bbtnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    qryInvestimento: TwwQuery;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    dblInvestimento: TwwDBLookupCombo;
    Label2: TLabel;
    qryOperacao: TwwQuery;
    dsInvestimento: TwwDataSource;
    dblOperacao: TwwDBLookupCombo;
    Label3: TLabel;
    qryOperacaoDATAOPERACAO: TDateTimeField;
    qryOperacaoPLANPRVCONTABPATRO: TStringField;
    qryOperacaoQTDEOPERACAO: TFloatField;
    qryOperacaoVLROPERACAO: TFloatField;
    qryOperacaoIDOPERRENFIX: TFloatField;
    fraMensLanContRF: TfraMensagem;
    Label4: TLabel;
    dblPlanPrevCtbPatr: TwwDBLookupCombo;
    qryPlanPrevCtbPatr: TwwQuery;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField;
    procedure dbgLanContRFDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblInvestimentoExit(Sender: TObject);
  private
    { Private declarations }
     procedure AbreQry;
  public
    { Public declarations }
  end;

var
  frmConsLanContRF: TfrmConsLanContRF;
  sInvestimento: String;
  clCorLinha: TColor;

const clCorAmarelo: TColor = $00C0FFFF;


implementation

uses UOperComum, FDmRelLanContRF, UBibliotecaInvest, uSistema, uString;

{$R *.DFM}

procedure TfrmConsLanContRF.dbgLanContRFDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   inherited;
   if not ((gdSelected in State) or (gdFixed in State)) then
   begin
      dbgLanContRF.Canvas.Brush.Color := DmRelLanContRF.qryLancContATURFCOR.AsInteger;
      dbgLanContRF.Canvas.Font.Color := clBlack;
      dbgLanContRF.DefaultDrawDataCell(Rect, Field, State);
   end
   else if (gdSelected in State) or (gdFocused in State) then
   begin
      dbgLanContRF.Canvas.Brush.Color := DmRelLanContRF.qryLancContATURFCOR.AsInteger;
      dbgLanContRF.Canvas.Font.Color := clBlack;
      dbgLanContRF.DefaultDrawDataCell(Rect, Field, State);
   end;
end;

procedure TfrmConsLanContRF.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  with DmRelLanContRF do
  begin
     OperComum.LimpaParametros(qryLancContATURF);
     qryLancContATURF.Open;
  end;
  bbtnImprimir.Enabled := False;
end;

procedure TfrmConsLanContRF.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  with DmRelLanContRF do
  begin
     qryLancContATURF.DisableControls;
     TfrmPreview.CreateModalPreview(Application,
                                    pprLanContRF,
                                    pprLanContRF.PrinterSetup.DocumentName);

     qryLancContATURF.EnableControls;
  end;
end;

procedure TfrmConsLanContRF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DmRelLanContRF.qryLancContATURF.Close;
  qryInvestimento.Close;
  qryOperacao.Close;

  // AL_2
  qryPlanPrevCtbPatr.Close;
end;

procedure TfrmConsLanContRF.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmConsLanContRF.FormShow(Sender: TObject);
begin
   inherited;
   fraMensLanContRF.Apaga;
   dtDataRef.Date := pRPI.DATAULTFECHRF;
   qryInvestimento.Open;
   //AL_1
   OperComum.LimpaParametros(qryOperacao);
   qryOperacao.Open;

   // AL_2
   qryPlanPrevCtbPatr.Open;
end;

procedure TfrmConsLanContRF.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbreQry;
end;

procedure TfrmConsLanContRF.AbreQry;
begin
  if Trim(dtDataRef.Text) = '' then
     Exit;

  with DmRelLanContRF do
  begin
     qryLancContATURF.DisableControls;
     fraMensLanContRF.Mes := 'Buscando Lançamentos Contabeis...';
     fraMensLanContRF.Mostra;
     OperComum.LimpaParametros(qryLancContATURF);
     qryLancContATURF.ParamByName('DATAATU').AsString := dtDataRef.Text;
     if Trim(dblInvestimento.Text) <> '' then
        qryLancContATURF.ParamByName('IDINVESTIMENTO').AsInteger := StrToInt(dblInvestimento.LookupValue);
     if Trim(dblOperacao.Text) <> '' then
        qryLancContATURF.ParamByName('IDOPERRENFIXAPLIC').AsInteger := StrToInt(dblOperacao.LookupValue);

     // AL_2 
     if Trim(dblPlanPrevCtbPatr.Text) <> '' then
        qryLancContATURF.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblPlanPrevCtbPatr.LookupValue);

     qryLancContATURF.Open;

     sInvestimento := '';
     clCorLinha := clWhite;
     fraMensLanContRF.Max := qryLancContATURF.RecordCount;

     while not qryLancContATURF.Eof do
     begin
        fraMensLanContRF.Mes := 'Processando Lançamentos Contabeis...';
        if not (qryLancContATURFIDINVESTIMENTO.AsString = sInvestimento) then
        begin
           if clCorLinha = clCorAmarelo then
              clCorLinha := clWhite
           else
              clCorLinha := clCorAmarelo;

           sInvestimento := qryLancContATURFIDINVESTIMENTO.AsString;
        end;

        OperComum.LimpaParametros(qryPlanoConta);
        qryPlanoConta.ParamByName('PLANO').AsInteger := qryLancContATURFPLANO.AsInteger;
        qryPlanoConta.ParamByName('PLACONTA').AsString :=  Espaco(qryLancContATURFPLACONTA.AsString, 18);
        qryPlanoConta.Open;

        qryLancContATURF.Edit;
        qryLancContATURFCOR.AsInteger := clCorLinha;
        if qryPlanoContaPLANATUREZA.AsString = 'C' then
           qryLancContATURFLACVALOR.AsFloat := qryLancContATURFLACVALOR.AsFloat * -1;
        qryLancContATURF.Post;

        qryLancContATURF.Next;
        fraMensLanContRF.Incrementa;
     end;

     qryLancContATURF.First;

     if not qryLancContATURF.Eof then
        bbtnImprimir.Enabled := True
     else
        bbtnImprimir.Enabled := False;

     fraMensLanContRF.Apaga;
     qryLancContATURF.EnableControls;
  end;
end;

procedure TfrmConsLanContRF.dblInvestimentoExit(Sender: TObject);
begin
  inherited;
   //AL_1
   OperComum.LimpaParametros(qryOperacao);
   qryOperacao.ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
   qryOperacao.Open;
end;

end.

