//******************************************************************************
// Data      : 06/07/2007
// Código    : AL_3
// Pendencia : 25679
// SOL       :
// Motivo    : Implementação da rentabilidade do início da aplicação no fundo
//******************************************************************************
// Data      : 18/04/2006
// Código    : AL_2
// Motivo    : Retirada a query qrySaldoTotal para melhorar a performance.
//******************************************************************************
// Data      : 23/02/2005
// Código    : Al_1
// Motivo    : Ajuste no layout da tela.
//******************************************************************************

unit FConsRentFundoAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, Wwdatsrc, Wwquery, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, DBGrids, wwdbdatetimepicker, CMDateTimePicker,
  TREdit, CheckLst, Spin, Menus, FPreview, fcLabel;

type
  TfrmConsRentFundoAcoes = class(TfrmOkCancelar)
    Label3: TLabel;
    bt_Imprime: TBitBtn;
    pnlConsulta: TPanel;
    Label2: TLabel;
    edData: TCMDateTimePicker;
    pnlTotal: TPanel;
    dbGConsRentFundos: TwwDBGrid;
    qryAux: TwwQuery;
    Label5: TLabel;
    ToolbarSep972: TToolbarSep97;
    pmnuConsRentFundos: TPopupMenu;
    FixarColuna1: TMenuItem;
    LiberarColuna1: TMenuItem;
    LiberaTodasasColunas1: TMenuItem;
    N1: TMenuItem;
    qryPlanPrevCtbPatr: TwwQuery;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    cmbRanking: TComboBox;
    Label1: TLabel;
    dbeTotal: TDBRealEdit;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FixarColuna1Click(Sender: TObject);
    procedure LiberarColuna1Click(Sender: TObject);
    procedure pmnuConsRentFundosPopup(Sender: TObject);
    procedure LiberaTodasasColunas1Click(Sender: TObject);
    procedure dbGConsRentFundosDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
  private
    Procedure FazQuery;
    { Private declarations }
  public
    { Public declarations }
    wSaldoTot: Double;
  end;

var
  frmConsRentFundoAcoes: TfrmConsRentFundoAcoes;

implementation

{$R *.DFM}
Uses DBaseDados, UOperComum, UDiasUteisInv, FDmRelatoriosFundos, uMensErro,
     UFuncoesRendaFixa, uBibliotecaInvest;

Procedure TfrmConsRentFundoAcoes.FazQuery;
Var
   wSaldo, wRentAno, wRentIndAno, wDifAno,wRentMes, wRentIndMes, wDifMes,
   wRentDia, wRentIndDia, wDifDia, wCotaIni, wCotaFim : Double;
   dDtaAnt, dDtaIniMes, dDtaIniAno : TDateTime;
   Year, Month, Day: Word;
begin

   DecodeDate(edData.DateTime, Year, Month, Day);
   // Último Dia útil anterior
   dDtaAnt := DiasUteisInv.UltDiaUtilAnterior(edData.DateTime,-1,1,'',True,False,False);

   // Ultimo dia util do mes anterior
   if Month > 1 then
      dDtaIniMes := DiasUteisInv.UltDiaUtilMes(Year,(Month-1),1,-1,'',True,False,False)
   else
      dDtaIniMes := DiasUteisInv.UltDiaUtilMes(Year-1,12,1,-1,'',True,False,False);

   // Ultimo dia util do ano anterior
   dDtaIniAno := DiasUteisInv.UltDiaUtilMes((Year-1),12,1,1,'',True,False,False);

   DmRelatoriosFundo.qryConsRentFndAcoes.Close;
   DmRelatoriosFundo.qryConsRentFndAcoes.DisableControls;
   DmRelatoriosFundo.qryConsRentFndAcoes.ParamByName('DATAREF').AsDateTime := edData.DateTime;
   DmRelatoriosFundo.qryConsRentFndAcoes.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   DmRelatoriosFundo.qryConsRentFndAcoes.ParamByName('DATADIA').AsDateTime := dDtaAnt;
   DmRelatoriosFundo.qryConsRentFndAcoes.ParamByName('DATAMES').AsDateTime := dDtaIniMes;
   DmRelatoriosFundo.qryConsRentFndAcoes.ParamByName('DATAANO').AsDateTime := dDtaIniAno;
   DmRelatoriosFundo.qryConsRentFndAcoes.ParamByName('ORDEM').AsInteger := cmbRanking.ItemIndex;
   DmRelatoriosFundo.qryConsRentFndAcoes.Prepare;
   DmRelatoriosFundo.qryConsRentFndAcoes.Open;
   DmRelatoriosFundo.qryConsRentFndAcoes.First;

   //AL_2

   DmRelatoriosFundo.qryConsRentFndAcoes.Filtered := True;
   DmRelatoriosFundo.qryConsRentFndAcoes.EnableControls;

   dbGConsRentFundos.FixedCols := 0;
   LiberaTodasasColunas1.Enabled := False;
   LiberarColuna1.Enabled := False;
   FixarColuna1.Enabled := True;

end;

procedure TfrmConsRentFundoAcoes.FormCreate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
end;

procedure TfrmConsRentFundoAcoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmConsRentFundoAcoes.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  If Trim(edData.Text) = '' then
  begin
    MsgDlg('Informe a Data de Referência.','Mensagem do Sistema',MtError,[MbOk],0);
    edData.SetFocus;
    exit;
  end;

  FazQuery;
end;

procedure TfrmConsRentFundoAcoes.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DmRelatoriosFundo.qryConsRentFndAcoes.Close;
  dbGConsRentFundos.FixedCols := 0;
  LiberaTodasasColunas1.Enabled := False;
  LiberarColuna1.Enabled := False;
  FixarColuna1.Enabled := False;

  edData.Text := '';

  cmbRanking.ItemIndex := 0;
  edData.SetFocus;
end;

procedure TfrmConsRentFundoAcoes.FormShow(Sender: TObject);
begin
  inherited;
  cmbRanking.ItemIndex := 0;
end;

procedure TfrmConsRentFundoAcoes.bt_ImprimeClick(Sender: TObject);
begin
  inherited;

  DmRelatoriosFundo.qryConsRentFndAcoes.DisableControls;
  qryPlanPrevCtbPatr.Close;
  qryPlanPrevCtbPatr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
  qryPlanPrevCtbPatr.Open;
  DmRelatoriosFundo.lblConsRFAPlanoPatr.Caption :=' ';
  DmRelatoriosFundo.lblConsRFAPlanoPatr.Caption :=
                    DmRelatoriosFundo.lblConsRFAPlanoPatr.Caption +
                    qryPlanPrevCtbPatr.FieldByName('PLANPRVCONTABPATRO').AsString;
  qryPlanPrevCtbPatr.Close;

  if cmbRanking.ItemIndex = -1 then
     DmRelatoriosFundo.lblConsRFARankingTit2.Caption := 'DIA'
  else
     DmRelatoriosFundo.lblConsRFARankingTit2.Caption := cmbRanking.Text;

  DmRelatoriosFundo.lblConsRFATotal.Text := FloatToStrF(dbeTotal.Value,ffNumber,12,2 );
  DmRelatoriosFundo.lblConsRFADtRef.Text := edData.Text;

  TfrmPreview.CreateModalPreview(Application,
                                 DmRelatoriosFundo.rptConsRentFndAcoes,
                                 DmRelatoriosFundo.rptConsRentFndAcoes.PrinterSetup.DocumentName);

  DmRelatoriosFundo.qryConsRentFndAcoes.EnableControls;

end;

procedure TfrmConsRentFundoAcoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DmRelatoriosFundo.qryConsRentFndAcoes.Close;
  DmRelatoriosFundo.qryConsRentFndAcoes.ParamByName('DATAREF').Clear;
  DmRelatoriosFundo.qryConsRentFndAcoes.ParamByName('IDPLANPREVCTBPATR').Clear;
  DmRelatoriosFundo.qryConsRentFndAcoes.ParamByName('DATADIA').Clear;
  DmRelatoriosFundo.qryConsRentFndAcoes.ParamByName('DATAMES').Clear;
  DmRelatoriosFundo.qryConsRentFndAcoes.ParamByName('DATAANO').Clear;
  DmRelatoriosFundo.qryConsRentFndAcoes.SQL.Strings[55] := '';

end;

procedure TfrmConsRentFundoAcoes.FixarColuna1Click(Sender: TObject);
begin
  inherited;
  dbGConsRentFundos.FixedCols := dbGConsRentFundos.FixedCols + 1;
end;

procedure TfrmConsRentFundoAcoes.LiberarColuna1Click(Sender: TObject);
begin
  inherited;
  dbGConsRentFundos.FixedCols := dbGConsRentFundos.FixedCols - 1;
end;

procedure TfrmConsRentFundoAcoes.pmnuConsRentFundosPopup(Sender: TObject);
begin
  inherited;
  if dbGConsRentFundos.DataSource.DataSet.Active then
  begin
     if dbGConsRentFundos.FixedCols = 0 then begin
        LiberarColuna1.Enabled := False;
        LiberaTodasasColunas1.Enabled := False;
        end
     else begin
        LiberarColuna1.Enabled := True;
        LiberaTodasasColunas1.Enabled := True;
     end;

     if dbGConsRentFundos.FixedCols = dbGConsRentFundos.GetColCount then
        FixarColuna1.Enabled := False
     else
        FixarColuna1.Enabled := True;
  end
  else
  begin
     LiberarColuna1.Enabled := False;
     LiberaTodasasColunas1.Enabled := False;
     FixarColuna1.Enabled := False
  end;

end;

procedure TfrmConsRentFundoAcoes.LiberaTodasasColunas1Click(Sender: TObject);
begin
  inherited;
  dbGConsRentFundos.FixedCols := 0;
end;

procedure TfrmConsRentFundoAcoes.dbGConsRentFundosDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField;
  State: TGridDrawState);
begin
  inherited;
  if not ((gdSelected in State) or (gdFixed in State) or (gdFocused in State)) then
  begin
     if DmRelatoriosFundo.qryConsRentFndAcoesCORCATEGFUNDO.AsInteger <> 0 then
        dbGConsRentFundos.Canvas.Font.Color := DmRelatoriosFundo.qryConsRentFndAcoesCORCATEGFUNDO.AsInteger
     else
        dbGConsRentFundos.Canvas.Font.Color := clWindowText;

        dbGConsRentFundos.DefaultDrawDataCell(Rect, Field, State);
  end
  else if (gdSelected in State) or (gdFocused in State) then
  begin
     if DmRelatoriosFundo.qryConsRentFndAcoesCORCATEGFUNDO.AsInteger <> 0 then
        dbGConsRentFundos.Canvas.Font.Color := DmRelatoriosFundo.qryConsRentFndAcoesCORCATEGFUNDO.AsInteger
     else
        dbGConsRentFundos.Canvas.Font.Color := clWhite;

     if (State = [gdSelected]) then
        dbGConsRentFundos.Canvas.Brush.Color := clNavy;

        dbGConsRentFundos.DefaultDrawDataCell(Rect, Field, State);
  end;
end;

end.
