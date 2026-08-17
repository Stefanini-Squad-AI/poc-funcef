unit fUsuxCCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, DBCtrls,
  wwdbedit, CmEventosCadastro, ImgList, DBClient, uCMClientDataSet, uCtrlUsCCustoRH;

type
  TFrmUsuxCCusto = class(TfrmCadastroMT)
    Label1: TLabel;
    dsCCustoNaoHab: TwwDataSource;
    sbtnAdicionarTudo: TSpeedButton;
    sbtnAdicionar: TSpeedButton;
    sbtnRemover: TSpeedButton;
    sbtnRemoverTudo: TSpeedButton;
    dbgdCCustoHab: TwwDBGrid;
    dbgdCCustoNaoHab: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    edNomeUsu: TEdit;
    CdsCCustoNaoHab: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure sbtnAdicionarTudoClick(Sender: TObject);
    procedure sbtnRemoverTudoClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlUsCCustoRH: TCtrlUsCCustoRH;

    procedure Sel(IdUsuario: double; IdEmpresa: integer);
    procedure HabilitarBotoes;
    function  GravarRegistro: boolean;
  end;

var
  FrmUsuxCCusto: TFrmUsuxCCusto;

implementation

uses uCMTypes, uSistema, uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TFrmUsuxCCusto.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlUsCCustoRH := TCtrlUsCCustoRH.Create;
  CtrlUsCCustoRH.InitializeAs(Padroes);
  CtrlUsCCustoRH.Cds := Cds;
  Sel(-1, -1);
end;

procedure TFrmUsuxCCusto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlUsCCustoRH);
  inherited;
end;

procedure TFrmUsuxCCusto.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]), Sistema.IdEmpresa);
    edNomeUsu.Text := '  ' + MontaSelect.ValoresChave[1];
  end;
end;

procedure TFrmUsuxCCusto.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := (CdsCCustoNaoHab.RecordCount > 0) or (Cds.RecordCount > 0);
  pnlFundo.Enabled := true;
  dbgdCCustoNaoHab.Enabled := (CdsCCustoNaoHab.RecordCount > 0);
  dbgdCCustoHab.Enabled := (Cds.RecordCount > 0);
  HabilitarBotoes;  
end;

procedure TFrmUsuxCCusto.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TFrmUsuxCCusto.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TFrmUsuxCCusto.sbtnAdicionarClick(Sender: TObject);
begin
  if (CmeCadastro.Operacao = opAlterar) and (CdsCCustoNaoHab.RecordCount > 0) then
  begin
    Cds.Insert;
    Cds.FieldByName('CODCENTROCUSTO').asString := CdsCCustoNaoHab.FieldByName('CODCENTROCUSTO').asString;
    Cds.FieldByName('IDEMPRESA').asFloat := CdsCCustoNaoHab.FieldByName('IDEMPRESA').asFloat;
    Cds.FieldByName('IDUSUARIO').asFloat := StrToFloat(MontaSelect.ValoresChave[0]);
    Cds.FieldByName('NOME').asString := CdsCCustoNaoHab.FieldByName('NOME').asString;
    Cds.Post;
    CdsCCustoNaoHab.Delete;
  end;
  CmeCadastroAtualizaBotoes(Sender);
end;

procedure TFrmUsuxCCusto.sbtnRemoverClick(Sender: TObject);
begin
  if (CmeCadastro.Operacao = opAlterar) and (Cds.RecordCount > 0) then
  begin
    CdsCCustoNaoHab.Insert;
    CdsCCustoNaoHab.FieldByName('CODCENTROCUSTO').asString := Cds.FieldByName('CODCENTROCUSTO').asString;
    CdsCCustoNaoHab.FieldByName('IDEMPRESA').asFloat := Cds.FieldByName('IDEMPRESA').asFloat;
    CdsCCustoNaoHab.FieldByName('NOME').asString := Cds.FieldByName('NOME').asString;
    CdsCCustoNaoHab.Post;
    Cds.Delete;
  end;
  CmeCadastroAtualizaBotoes(Sender);
end;

procedure TFrmUsuxCCusto.sbtnAdicionarTudoClick(Sender: TObject);
begin
  CdsCCustoNaoHab.DisableControls;
  CdsCCustoNaoHab.First;
  while not(CdsCCustoNaoHab.EOF) do
    sbtnAdicionarClick(Sender);
  CdsCCustoNaoHab.EnableControls;
end;

procedure TFrmUsuxCCusto.sbtnRemoverTudoClick(Sender: TObject);
begin
  Cds.DisableControls;
  Cds.First;
  while not(Cds.EOF) do
    sbtnRemoverClick(Sender);
  Cds.EnableControls;
end;

procedure TFrmUsuxCCusto.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  HabilitarBotoes;
end;

procedure TFrmUsuxCCusto.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  bInserindo := (Cds.State = dsInsert);
  inherited;
  if not(bInserindo) then
    CmeCadastroFind(Sender);
end;

procedure TFrmUsuxCCusto.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Cds.CancelUpdates;
  CdsCCustoNaoHab.CancelUpdates;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TFrmUsuxCCusto.Sel(IdUsuario: double; IdEmpresa: integer);
begin
  Cds.Data := CtrlUsCCustoRH.ListUsCCustoRH(IdUsuario);
  CdsCCustoNaoHab.Data := CtrlUsCCustoRH.ListEstabNaoHab(IdUsuario, IdEmpresa);
end;

function TFrmUsuxCCusto.GravarRegistro: boolean;
begin
  Result := CtrlUsCCustoRH.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlUsCCustoRH.MessageInfo);
end;

procedure TFrmUsuxCCusto.HabilitarBotoes;
begin
  sbtnAdicionar.Enabled := (CdsCCustoNaoHab.RecordCount > 0) and (CmeCadastro.Operacao = opAlterar);
  sbtnAdicionarTudo.Enabled := (CdsCCustoNaoHab.RecordCount > 0) and (CmeCadastro.Operacao = opAlterar);
  sbtnRemover.Enabled := (Cds.RecordCount > 0) and (CmeCadastro.Operacao = opAlterar);
  sbtnRemoverTudo.Enabled := (Cds.RecordCount > 0) and (CmeCadastro.Operacao = opAlterar);
end;

end.
