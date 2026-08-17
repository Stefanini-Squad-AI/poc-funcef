unit fCadGrpTr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  DBCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, fCadastroMT, DBClient, uCMClientDataSet, uCtrlGrpTrein;

type
  TfrmCadGrpTr = class(TFrmCadastroMT)
    pnlCargos: TPanel;
    Label5: TLabel;
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    dsCargo: TwwDataSource;
    ToolbarSep972: TToolbarSep97;
    bbtnCargos: TToolbarButton97;
    CdsCargo: TCMClientDataSet;
    dbGridCargos: TwwDBGrid;
    dsCurso: TwwDataSource;
    CdsCurso: TCMClientDataSet;
    pnlCursos: TPanel;
    Label3: TLabel;
    dbGridCursos: TwwDBGrid;
    bbtnCursos: TToolbarButton97;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnCargosClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure bbtnCursosClick(Sender: TObject);
  private
    CtrlGrpTrein: TCtrlGrpTrein;

    procedure Sel(CodGrpFunc: string);
    function  GravarRegistro: boolean;
  end;

var
  frmCadGrpTr: TfrmCadGrpTr;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadGrpTr.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGrpTrein := TCtrlGrpTrein.Create;
  CtrlGrpTrein.InitializeAs(Padroes);
  CtrlGrpTrein.CdsGrpTrein := Cds;
  Sel('-1');
end;

procedure TfrmCadGrpTr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGrpTrein);
  inherited;
end;

procedure TfrmCadGrpTr.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(MontaSelect.ValoresChave[0]);
end;

procedure TfrmCadGrpTr.CmeCadastroInsert(Sender: TObject);
begin
  Sel('-1');
  inherited;
end;

procedure TfrmCadGrpTr.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadGrpTr.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrpTr.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrpTr.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrpTr.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadGrpTr.bbtnCargosClick(Sender: TObject);
begin
  pnlCargos.Visible := not(pnlCargos.Visible);
  if (pnlCargos.Visible) then
  begin
    pnlCargos.Top := 46;
    pnlCursos.Visible := False;
  end
  else
    pnlCargos.Top := 222;
end;

procedure TfrmCadGrpTr.bbtnCursosClick(Sender: TObject);
begin
  inherited;
  pnlCursos.Visible := not(pnlCursos.Visible);
  if (pnlCursos.Visible) then
  begin
    pnlCursos.Top := 46;
    pnlCargos.Visible := False;
  end
  else
    pnlCursos.Top := 382;
end;

procedure TfrmCadGrpTr.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadGrpTr.Sel(CodGrpFunc: string);
begin
  Cds.Data := CtrlGrpTrein.ListGrpTrein(CodGrpFunc);
  if (Trim(Cds.FieldByName('CodGrpTrein').asString) <> '') then
  begin
    CdsCargo.Data := CtrlGrpTrein.ListCargo(Cds.FieldByName('CodGrpTrein').asString);
    CdsCurso.Data := CtrlGrpTrein.ListCurso(Cds.FieldByName('CodGrpTrein').asString);
  end
  else
  begin
    CdsCargo.Data := CtrlGrpTrein.ListCargo('-1');
    CdsCurso.Data := CtrlGrpTrein.ListCurso('-1');
  end;
end;

function TfrmCadGrpTr.GravarRegistro: boolean;
begin
  Result := CtrlGrpTrein.GravarGrpTrein;
  if not(Result) then
    raise exception.Create(CtrlGrpTrein.MessageInfo);
end;

end.
