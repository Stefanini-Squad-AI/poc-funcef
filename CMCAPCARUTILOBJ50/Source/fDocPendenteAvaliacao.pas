unit fDocPendenteAvaliacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, DBGrids, Db, DBClient, uCMClientDataSet,
  uCmSqlParams, Wwdbigrd, Wwdbgrid, Wwdatsrc, TB97Ctls,FCadForne,uCtrlAvaliacaoFornec
 ,DBTables,uDataBase, uCmDbObject, uCmControlObject,Provider,uDbAvaliacaofornec,uCtrlPadroes,uSistema;

type
  TfrmDocPendenteAvaliacao = class(TfrmSairAjuda)
    rgFundo: TPanel;
    pnl1: TPanel;
    lbl1: TLabel;
    SqlDocPendente: TCMSqlParams;
    cdsDocPendente: TCMClientDataSet;
    dsDocPendente: TwwDataSource;
    dbgDocPendente: TwwDBGrid;
    btn1: TBitBtn;
    btnAvaliacao: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnAvaliacaoClick(Sender: TObject);
    procedure AbrirAvaliacao;
    procedure FormShow(Sender: TObject);
    procedure ParamGrid;
    procedure ServicoPraco;
    procedure dbgDocPendenteCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgDocPendenteDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure dbgDocPendenteDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    CtrlAvaliacaoFornec: TCtrlAvaliacaoFornec;
    { Private declarations }
  public
    flgPrazo : boolean;
     // CtrlAvaliacaoFornec: TCtrlAvaliacaoFornec;
    { Public declarations }
  end;

var
  frmDocPendenteAvaliacao: TfrmDocPendenteAvaliacao;


implementation

{$R *.DFM}

procedure TfrmDocPendenteAvaliacao.FormCreate(Sender: TObject);
begin
  flgPrazo := false;
  ParamGrid();
  ServicoPraco;
  inherited;

end;

procedure TfrmDocPendenteAvaliacao.btnAvaliacaoClick(Sender: TObject);
begin
  flgPrazo := false;
  AbrirAvaliacao;
  ParamGrid;
  ServicoPraco;
  inherited;
end;

procedure TfrmDocPendenteAvaliacao.AbrirAvaliacao;
var
    frmCadForneAvalia: TfrmCadForne;
    vdocumento, vidforcli,vnodcumento : integer;
begin
   // Edilaine - SOL 174919 / KTN 1591697
    Application.CreateForm(TFrmCadForne, frmCadForneAvalia);
    if frmCadForneAvalia.FormStyle <> fsNormal then
    begin
      frmCadForneAvalia.FormStyle := fsNormal;
      frmCadForneAvalia.Visible := False;
    end;

    frmCadForneAvalia.nConsModulo:= 4;
    frmCadForneAvalia.nIdPessoa:= cdsDocPendente.FieldByName('IDFORCLI').AsInteger;
    frmCadForneAvalia.DtEmissao:= cdsDocPendente.FieldByName('DATAEMISSAO').AsDateTime;
    frmCadForneAvalia.WindowState:= wsMaximized;


    frmCadForneAvalia.ShowModal;
    frmCadForneAvalia.Release;

    vnodcumento := cdsDocPendente.FieldByName('NODOCUMENTO').AsInteger;
    vidforcli  := cdsDocPendente.FieldByName('IDFORCLI').AsInteger;
    vdocumento := cdsDocPendente.FieldByName('CODDOCUMENTO').AsInteger;
    if(vdocumento <> 0) then begin
      CtrlAvaliacaoFornec.AtualizaAvaliacao(vnodcumento, vdocumento,
      strTOint(CtrlAvaliacaoFornec.BuscaAvaliacao(vidforcli)),vidforcli);
    end;
    inherited;

end;



procedure TfrmDocPendenteAvaliacao.FormShow(Sender: TObject);
var teste : integer;
begin
  inherited;


end;

procedure TfrmDocPendenteAvaliacao.ParamGrid;
begin
  SqlDocPendente.Prepare;
  SqlDocPendente.ParamByName('IDUSUARIOINCLUSAO').AsInteger :=   Sistema.IdUsuario;
  SqlDocPendente.Open;
  CtrlAvaliacaoFornec := TCtrlAvaliacaoFornec.Create;
  CtrlAvaliacaoFornec.InitializeAs(Padroes);
end;

procedure TfrmDocPendenteAvaliacao.dbgDocPendenteCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin

   if (cdsDocPendente.FieldByName('PRAZO').AsInteger > 4) then
         AFont.Color:=clRed
   else
         AFont.Color:=clWindowText;

end;

procedure TfrmDocPendenteAvaliacao.dbgDocPendenteDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField;
  State: TGridDrawState);
var
  R : TRect;
begin
  inherited;
  R := Rect;
  Dec(R.Bottom,2);
  
  if Field = cdsDocPendente.FieldByName('IDFORCLI') then begin
    if not (gdSelected in State) then begin
      dbgDocPendente.Canvas.FillRect(Rect);
    end;
    dbgDocPendente.Canvas.TextRect(R,R.Left,R.Top, cdsDocPendente.FieldByName('IDFORCLI').AsString);
  end;
end;

procedure TfrmDocPendenteAvaliacao.dbgDocPendenteDblClick(Sender: TObject);
begin
  flgPrazo := false;
  AbrirAvaliacao;
  ParamGrid;
  ServicoPraco;
end;

procedure TfrmDocPendenteAvaliacao.ServicoPraco;
begin
  while  not cdsDocPendente.EOF do
  begin
     if(cdsDocPendente.FieldByName('PRAZO').AsInteger > 4) then
        flgPrazo := true;
     cdsDocPendente.Next;
  end;

  if flgPrazo then
    bbtnSair.Enabled := false
  else
    bbtnSair.Enabled := true;

  if cdsDocPendente.IsEmpty then
    btnAvaliacao.Enabled:= false
  else
    btnAvaliacao.Enabled:= true;


end;
procedure TfrmDocPendenteAvaliacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;

   if flgPrazo then
          CanClose := false;


  if CanClose then exit;

//  exit;
//  If cds.ChangeCount > 0 Then cds.CancelUpdates;
end;

end.
