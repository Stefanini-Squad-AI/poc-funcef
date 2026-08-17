unit fCadTipCurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, TB97, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls,
  TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Mask, CmEventosCadastro,
  ImgList, FCadastroMT, DBClient, uCMClientDataSet, uCtrlTipCurso;

type
  TfrmCadTipCurso = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    pnlCursos: TPanel;
    Label3: TLabel;
    dbGridCursos: TwwDBGrid;
    bbtnCursos: TToolbarButton97;
    dsCurso: TwwDataSource;
    CdsCurso: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnCursosClick(Sender: TObject);
  private
    CtrlTipCurso: TCtrlTipCurso;

    procedure Sel(IdTipoCurso: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadTipCurso: TfrmCadTipCurso;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadTipCurso.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipCurso := TCtrlTipCurso.Create;
  CtrlTipCurso.InitializeAs(Padroes);
  CtrlTipCurso.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadTipCurso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipCurso);
  inherited;
end;

procedure TfrmCadTipCurso.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipCurso.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadTipCurso.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadTipCurso.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipCurso.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipCurso.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipCurso.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadTipCurso.bbtnCursosClick(Sender: TObject);
begin
  pnlCursos.Visible := not(pnlCursos.Visible);
  if (pnlCursos.Visible) then
    pnlCursos.Top := 46
  else
    pnlCursos.Top := 222;
end;

procedure TfrmCadTipCurso.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
  end
  else
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
  end
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadTipCurso.Sel(IdTipoCurso: double);
begin
  Cds.Data := CtrlTipCurso.ListGeral(IdTipoCurso);
  if (Cds.FieldByName('IDTIPOCURSO').asInteger <> 0) then
    CdsCurso.Data := CtrlTipCurso.ListCurso(Cds.FieldByName('IDTIPOCURSO').asFloat)
  else
    CdsCurso.Data := CtrlTipCurso.ListCurso(-1);
end;

function TfrmCadTipCurso.GravarRegistro: boolean;
begin
  Result := CtrlTipCurso.Gravar;
  if not(Result) then
    raise exception.Create(CtrlTipCurso.MessageInfo);
end;

end.
