unit fCadPacote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, cmseldlg, wwidlg,
  Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBTables, TB97, TB97Ctls, TB97Tlbr, wwDialog, CmEventosCadastro,
  ImgList, IvDictio, IvMulti, IvEMulti, FCadastroMT, MontaSelect, DBClient, uCMClientDataSet,
  uCtrlPacote;

type
  TfrmCadPacote = class(TfrmCadastroMT)
    dsCurso: TwwDataSource;
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    sbtnCursos: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    pnlCargos: TPanel;
    Label5: TLabel;
    dbGridCargos: TwwDBGrid;
    CdsCurso: TCMClientDataSet;
    dbrgTipo: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure sbtnCursosClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    CtrlPacote: TCtrlPacote;
    
    procedure Sel(IdPacote: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadPacote: TfrmCadPacote;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadPacote.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPacote := TCtrlPacote.Create;
  CtrlPacote.InitializeAs(Padroes);
  CtrlPacote.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadPacote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPacote);
  inherited;
end;

procedure TfrmCadPacote.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadPacote.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadPacote.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadPacote.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPacote.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPacote.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPacote.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadPacote.sbtnCursosClick(Sender: TObject);
begin
  pnlCargos.Visible := not(pnlCargos.Visible);
  if (pnlCargos.Visible) then
    pnlCargos.Top := 46
  else
    pnlCargos.Top := 214;
end;

procedure TfrmCadPacote.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadPacote.Sel(IdPacote: double);
begin
  Cds.Data := CtrlPacote.ListGeral(IdPacote);
  if (Trim(Cds.FieldByName('IDPACOTE').asString) <> '') then
    CdsCurso.Data := CtrlPacote.ListCurso(Cds.FieldByName('IDPACOTE').asFloat)
  else
    CdsCurso.Data := CtrlPacote.ListCurso(-1);
end;

function TfrmCadPacote.GravarRegistro: boolean;
begin
  Result := CtrlPacote.Gravar;
  if not(Result) then
    raise exception.Create(CtrlPacote.MessageInfo);
end;

end.
