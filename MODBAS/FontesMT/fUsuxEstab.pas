unit fUsuxEstab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask,
  DBCtrls, ImgList, DBClient, CmEventosCadastro, uCMClientDataSet, uCtrlUsuarioXFilial;

type
  TfrmUsuxEstab = class(TFrmCadastroMT)
    dsEstabNaoHab: TwwDataSource;
    Label1: TLabel;
    Bevel1: TBevel;
    sbtnAdicionar: TSpeedButton;
    sbtnRemover: TSpeedButton;
    sbtnAdicionarTudo: TSpeedButton;
    sbtnRemoverTudo: TSpeedButton;
    dbgdEstabHab: TwwDBGrid;
    dbgdEstabNaoHab: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    edNomeUsu: TEdit;
    CdsEstabNaoHab: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure dbgdEstabNaoHabDblClick(Sender: TObject);
    procedure dbgdEstabHabDblClick(Sender: TObject);
    procedure sbtnAdicionarTudoClick(Sender: TObject);
    procedure sbtnRemoverTudoClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlUsuarioXFilial: TCtrlUsuarioXFilial;

    procedure Sel(IdUsuario: double; IdEmpresa: integer);
    procedure HabilitarBotoes;
    function  GravarRegistro: boolean;
  end;

var
  frmUsuxEstab: TfrmUsuxEstab;

implementation

uses uCMTypes, uSistema, uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmUsuxEstab.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlUsuarioXFilial := TCtrlUsuarioXFilial.Create;
  CtrlUsuarioXFilial.InitializeAs(Padroes);
  CtrlUsuarioXFilial.Cds := Cds;
  Sel(-1, -1);
end;

procedure TfrmUsuxEstab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlUsuarioXFilial);
  inherited;
end;

procedure TfrmUsuxEstab.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]), Sistema.IdEmpresa);
    edNomeUsu.Text := '  ' + MontaSelect.ValoresChave[1];
  end;
end;

procedure TfrmUsuxEstab.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := (CdsEstabNaoHab.RecordCount > 0) or (Cds.RecordCount > 0);
  pnlFundo.Enabled := true;
  dbgdEstabNaoHab.Enabled := (CdsEstabNaoHab.RecordCount > 0);
  dbgdEstabHab.Enabled := (Cds.RecordCount > 0);
  HabilitarBotoes;
end;

procedure TfrmUsuxEstab.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmUsuxEstab.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmUsuxEstab.sbtnAdicionarClick(Sender: TObject);
begin
  if (CmeCadastro.Operacao = opAlterar) and (CdsEstabNaoHab.RecordCount > 0) then
  begin
    Cds.Insert;
    Cds.FieldByName('IDFILIALPESSOA').asFloat := CdsEstabNaoHab.FieldByName('IDFILIALPESSOA').asFloat;
    Cds.FieldByName('IDUSUARIO').asFloat := StrToFloat(MontaSelect.ValoresChave[0]);
    Cds.FieldByName('NOME').asString := CdsEstabNaoHab.FieldByName('NOME').asString;
    Cds.Post;
    CdsEstabNaoHab.Delete;
  end;
  HabilitarBotoes;
end;

procedure TfrmUsuxEstab.sbtnRemoverClick(Sender: TObject);
begin
  if (CmeCadastro.Operacao = opAlterar) and (Cds.RecordCount > 0) then
  begin
    CdsEstabNaoHab.Insert;
    CdsEstabNaoHab.FieldByName('IDFILIALPESSOA').asFloat := Cds.FieldByName('IDFILIALPESSOA').asFloat;
    CdsEstabNaoHab.FieldByName('NOME').asString := Cds.FieldByName('NOME').asString;
    CdsEstabNaoHab.Post;
    Cds.Delete;
  end;
  HabilitarBotoes;
end;

procedure TfrmUsuxEstab.sbtnAdicionarTudoClick(Sender: TObject);
begin
  CdsEstabNaoHab.DisableControls;
  CdsEstabNaoHab.First;
  while not(CdsEstabNaoHab.EOF) do
    sbtnAdicionarClick(Sender);
  CdsEstabNaoHab.EnableControls;
end;

procedure TfrmUsuxEstab.sbtnRemoverTudoClick(Sender: TObject);
begin
  Cds.DisableControls;
  Cds.First;
  while not(Cds.EOF) do
    sbtnRemoverClick(Sender);
  Cds.EnableControls;
end;

procedure TfrmUsuxEstab.dbgdEstabNaoHabDblClick(Sender: TObject);
begin
  sbtnAdicionarClick(Sender);
end;

procedure TfrmUsuxEstab.dbgdEstabHabDblClick(Sender: TObject);
begin
  sbtnRemoverClick(Sender);
end;

procedure TfrmUsuxEstab.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  HabilitarBotoes;
end;

procedure TfrmUsuxEstab.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  bInserindo := (Cds.State = dsInsert);
  inherited;
  if not(bInserindo) then
    CmeCadastroFind(Sender);
end;

procedure TfrmUsuxEstab.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Cds.CancelUpdates;
  CdsEstabNaoHab.CancelUpdates;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmUsuxEstab.Sel(IdUsuario: double; IdEmpresa: integer);
begin
  Cds.Data := CtrlUsuarioXFilial.ListUsuarioXFilial(IdUsuario);
  CdsEstabNaoHab.Data := CtrlUsuarioXFilial.ListEstabNaoHab(IdUsuario, IdEmpresa);
end;

function TfrmUsuxEstab.GravarRegistro: boolean;
begin
  Result := CtrlUsuarioXFilial.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlUsuarioXFilial.MessageInfo);
end;

procedure TfrmUsuxEstab.HabilitarBotoes;
begin
  sbtnAdicionar.Enabled := (CdsEstabNaoHab.RecordCount > 0) and (CmeCadastro.Operacao = opAlterar);
  sbtnAdicionarTudo.Enabled := (CdsEstabNaoHab.RecordCount > 0) and (CmeCadastro.Operacao = opAlterar);
  sbtnRemover.Enabled := (Cds.RecordCount > 0) and (CmeCadastro.Operacao = opAlterar);
  sbtnRemoverTudo.Enabled := (Cds.RecordCount > 0) and (CmeCadastro.Operacao = opAlterar);
end;

end.
