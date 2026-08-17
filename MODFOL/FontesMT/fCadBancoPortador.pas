unit fCadBancoPortador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, Db, DBTables, Wwdatsrc, Mask, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook,
  DBClient, uCMClientDataSet, uCtrlBancoPortFolha, uCtrlListTerceirosRH;

type
  TfrmCadBancoPortador = class(TfrmOkCancelar)
    dsBanco: TwwDataSource;
    Bevel2: TBevel;
    Label1: TLabel;
    dblkPortadorPadrao: TwwDBLookupCombo;
    wwDBGrid1: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    sbAssociaAg: TSpeedButton;
    sbDesassociaAg: TSpeedButton;
    Bevel1: TBevel;
    dbgdPortForma: TwwDBGrid;
    dsPortForma: TwwDataSource;
    dsPortBanco: TwwDataSource;
    CdsBanco: TCMClientDataSet;
    CdsPortForma: TCMClientDataSet;
    CdsPortFormaPadrao: TCMClientDataSet;
    CdsPortBanco: TCMClientDataSet;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbDesassociaAgClick(Sender: TObject);
    procedure sbAssociaAgClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlBancoPortFolha: TCtrlBancoPortFolha;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CodPortFormaPadraoAnterior: integer;

    procedure Sel;
  end;

var
  frmCadBancoPortador: TfrmCadBancoPortador;

implementation

uses uSistema, uMensErro, uCtrlPadroes, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadBancoPortador.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlBancoPortFolha := TCtrlBancoPortFolha.Create;
  CtrlBancoPortFolha.InitializeAs(Padroes);
  CtrlBancoPortFolha.CdsBancoPortFolha := CdsPortBanco;

  Sel;
end;

procedure TfrmCadBancoPortador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlBancoPortFolha);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmCadBancoPortador.sbAssociaAgClick(Sender: TObject);
begin
  with (CdsPortBanco) do
  begin
    Insert;
    FieldByName('IDBANCO').asFloat := CdsBanco.FieldByName('IDPESSOA').asFloat;
    FieldByName('NOMEBANCO').asString := CdsBanco.FieldByName('NOME').asString;
    FieldByName('CODPORTFORMA').asInteger := CdsPortForma.FieldByName('CODPORTFORMA').asInteger;
    FieldByName('DESCRICAO').asString := CdsPortForma.FieldByName('DESCRICAO').asString;
    Post;
  end;
  CdsBanco.Delete;
  sbAssociaAg.Enabled := not(CdsBanco.IsEmpty);
  sbDesassociaAg.Enabled := not(CdsPortBanco.IsEmpty);
end;

procedure TfrmCadBancoPortador.sbDesassociaAgClick(Sender: TObject);
begin
  with (CdsBanco) do
  begin
    Insert;
    FieldByName('IDPESSOA').asInteger := CdsPortBanco.FieldByName('IDBANCO').asInteger;
    FieldByName('NOME').asString := CdsPortBanco.FieldByName('NOMEBANCO').asString;
    Post;
  end;
  CdsPortBanco.Delete;
  sbAssociaAg.Enabled := not(CdsBanco.IsEmpty);
  sbDesassociaAg.Enabled := not(CdsPortBanco.IsEmpty);
end;

procedure TfrmCadBancoPortador.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (CdsPortFormaPadrao.FieldByName('CODPORTFORMA').asInteger = CodPortFormaPadraoAnterior) then
    CtrlBancoPortFolha.CodPortFormaPadrao := 0
  else
    CtrlBancoPortFolha.CodPortFormaPadrao := CdsPortFormaPadrao.FieldByName('CODPORTFORMA').asInteger;

  if not(CtrlBancoPortFolha.GravarBancoPortFolha(dblkPortadorPadrao.Text = '')) then
    raise Exception.Create(CtrlBancoPortFolha.MessageInfo);

  Sel;
end;

procedure TfrmCadBancoPortador.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Sel;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadBancoPortador.Sel;
var
  CodPortFormaPadrao: integer;
begin
  frmAguarde.Mostra('Selecionando Dados...');
  frmAguarde.Min := 0;
  frmAguarde.Max := 5;

  frmAguarde.Pos := 0;
  CdsPortFormaPadrao.Data := CtrlBancoPortFolha.ListBancoPortFolha;
  frmAguarde.Pos := 1;
  CdsBanco.Data := CtrlListTerceirosRH.ListBanco;
  frmAguarde.Pos := 2;
  CdsPortForma.Data := CtrlBancoPortFolha.ListBancoPortFolha('P');
  frmAguarde.Pos := 3;
  CdsPortBanco.Data := CtrlBancoPortFolha.ListPortBanco;
  frmAguarde.Pos := 4;

  // Seleciona o Portador Forma Padrão
  CodPortFormaPadrao := CtrlBancoPortFolha.GetCodPortFormaPadrao;
  CodPortFormaPadraoAnterior := CodPortFormaPadrao;
  if (CodPortFormaPadrao <> -1) then
  begin
    CdsPortFormaPadrao.Locate('CODPORTFORMA', CodPortFormaPadrao, []);
    dblkPortadorPadrao.Text := CdsPortFormaPadrao.FieldByName('DESCRICAO').asString;
    dblkPortadorPadrao.LookupValue := IntToStr(CodPortFormaPadrao);
  end;
  frmAguarde.Pos := 5;

  sbAssociaAg.Enabled := not(CdsBanco.IsEmpty);
  sbDesassociaAg.Enabled := not(CdsPortBanco.IsEmpty);

  frmAguarde.Apaga;
end;

end.
