unit fCadEstacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97, TB97Tlbr,
  Buttons, ExtCtrls, DBCtrls, wwdblook, Mask, CmEventosCadastro, ImgList, DBClient, TREdit, 
  fCadastroMT, uCMClientDataSet, wwdbedit, Wwdotdot, Wwdbcomb,
  uCtrlEstacaoAcesso, uCtrlLocalizacoes, IvEMulti;

type
  TfrmCadEstacao = class(TFrmCadastroMT)
    CdsLocalizacao: TCMClientDataSet;
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedEstacao: TDBEdit;
    Label4: TLabel;
    dblckLocalizacao: TwwDBLookupCombo;
    lblGrupo: TLabel;
    dbcmbFuncao: TwwDBComboBox;
    dbrgEntraSai: TDBRadioGroup;
    dbrgIdentificacao: TDBRadioGroup;
    dbrgLiberacao: TDBRadioGroup;
    gbxCatraca: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbedPorta: TDBEdit;
    dbcbMarca: TDBComboBox;
    dbcbModelo: TDBComboBox;
    lblDescricao: TLabel;
    dbmemDescr: TDBMemo;
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
    procedure dbcbMarcaChange(Sender: TObject);
    procedure dbrgIdentificacaoChange(Sender: TObject);
    procedure dbedEstacaoExit(Sender: TObject);
  private
    CtrlEstacaoAcesso: TCtrlEstacaoAcesso;
    CtrlLocalizacoes: TCtrlLocalizacoes;

    dIdEstacao: double;

    procedure SelEstacaoAcesso(IdEstacaoAcesso: double);
    function  GravarOperacao: boolean;
  end;

var
  frmCadEstacao: TfrmCadEstacao;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadEstacao.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlEstacaoAcesso := TCtrlEstacaoAcesso.Create;
  CtrlEstacaoAcesso.InitializeAs(Padroes);
  CtrlEstacaoAcesso.CdsEstacaoAcesso := Cds;

  CtrlLocalizacoes := TCtrlLocalizacoes.Create;
  CtrlLocalizacoes.InitializeAs(Padroes);

  SelEstacaoAcesso(-1);
  CdsLocalizacao.Data := CtrlLocalizacoes.ListaNomeLocalizacao(Sistema.IdEmpresa);
end;

procedure TfrmCadEstacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlLocalizacoes);
  FreeAndNil(CtrlEstacaoAcesso);
  inherited;
end;

procedure TfrmCadEstacao.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    dIdEstacao := StrToFloat(MontaSelect.ValoresChave[0]);
    SelEstacaoAcesso(dIdEstacao);
  end;
end;

procedure TfrmCadEstacao.CmeCadastroInsert(Sender: TObject);
begin
  SelEstacaoAcesso(-1);
  inherited;
  Cds.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
end;

procedure TfrmCadEstacao.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadEstacao.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarOperacao;
end;

procedure TfrmCadEstacao.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarOperacao;
end;

procedure TfrmCadEstacao.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarOperacao;
end;

procedure TfrmCadEstacao.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert,dsEdit]) and (dbedEstacao.CanFocus) then
    dbedEstacao.SetFocus;
end;

procedure TfrmCadEstacao.dbrgIdentificacaoChange(Sender: TObject);
var
  c: byte;
begin
  dbrgLiberacao.OnChange := nil;

  // Habilitar todas as opções
  for c:=0 to dbrgLiberacao.ControlCount-1 do
    dbrgLiberacao.Controls[c].Enabled := true;

  // Desabilitar os tipos de passagem COM Catraca quando for usado o
  // Tipo de Identificação TECLADO ou LEITOR SEM CATRACA
  if (dbrgIdentificacao.ItemIndex in [0,1]) then
  begin
    for c:=0 to dbrgLiberacao.ControlCount-1 do
      if (Pos('COM', UpperCase(TRadioButton(dbrgLiberacao.Controls[c]).Caption)) > 0) then
        dbrgLiberacao.Controls[c].Enabled := false;

    if (dbrgLiberacao.ItemIndex > -1) and
       not(dbrgLiberacao.Controls[dbrgLiberacao.ItemIndex].Enabled) then
      dbrgLiberacao.ItemIndex := 0;
  end;

  // Desabilitar os tipos de passagem SEM Catraca quando for usado o
  // Tipo de Identificação LEITOR COM CATRACA
  if (dbrgIdentificacao.ItemIndex = 2) then
  begin
    for c:=0 to dbrgLiberacao.ControlCount-1 do
      if (Pos('SEM', UpperCase(TRadioButton(dbrgLiberacao.Controls[c]).Caption)) > 0) then
        dbrgLiberacao.Controls[c].Enabled := false;

    if (dbrgLiberacao.ItemIndex > -1) and
       not(dbrgLiberacao.Controls[dbrgLiberacao.ItemIndex].Enabled) then
      dbrgLiberacao.ItemIndex := 1;
  end;

  dbrgLiberacao.OnChange := dbrgIdentificacaoChange;

  gbxCatraca.Visible := (dbrgIdentificacao.ItemIndex = 2) or
                        (dbrgLiberacao.ItemIndex in [1,2]);

  if not(gbxCatraca.Visible) and (Cds.State in [dsInsert,dsEdit]) then
  begin
    Cds.FieldByName('MARCACATRACA').Clear;
    Cds.FieldByName('PORTACATRACA').Clear;
    Cds.FieldByName('MODELOCATRACA').Clear;
    dbcbMarca.Update;
    dbedPorta.Update;
    dbcbModelo.Update;
  end;
end;

procedure TfrmCadEstacao.dbcbMarcaChange(Sender: TObject);
begin
  dbcbModelo.Items.Clear;
  case (dbcbMarca.ItemIndex) of
    0 : // Rodbel
    begin
      dbcbModelo.Items.Add(fu.CMTranslate('0101 - RBC-2801 ou Equivalente - Tempo Real - Porta Serial'));
      dbcbModelo.Items.Add(fu.CMTranslate('0102 - RBC-2801 ou Equivalente - Tempo Real - Porta Paralela'));
    end;
    1 : // Passo
    begin
      dbcbModelo.Items.Add(fu.CMTranslate('0201 - Passo - CA 1M'));
    end;
    2 : // Topdata
    begin
      dbcbModelo.Items.Add(fu.CMTranslate('0301 - Topdata Inner'));
    end;
  end;

  if (Cds.FieldByName('MODELOCATRACA').IsNull) then
    dbcbModelo.ItemIndex := -1
  else
    dbcbModelo.ItemIndex :=
      dbcbModelo.Items.IndexOf(Cds.FieldByName('MODELOCATRACA').asString);
end;

procedure TfrmCadEstacao.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dbedEstacao.Text) = '') then
  begin
    MsgDlg(fu.CMTranslate('Preencha a Estação.'), FU.CMTranslate('Aviso'),
      mtInformation, [mbOk,mbHelp], 0);
    dbedEstacao.SetFocus;
  end
  else
  if (Trim(dblckLocalizacao.Text) = '') then
  begin
    MsgDlg(FU.CMTranslate('Preencha a Localização.'), FU.CMTranslate('Aviso'),
      mtInformation, [mbOk,mbHelp], 0);
    dblckLocalizacao.SetFocus;
  end
  else
  if (Trim(dbcmbFuncao.Text) = '') then
  begin
    MsgDlg(FU.CMTranslate('Preencha a Função.'), FU.CMTranslate('Aviso'),
      mtInformation, [mbOk,mbHelp], 0);
    dbcmbFuncao.SetFocus;
  end
  else
  begin
    if (dbcmbFuncao.ItemIndex = 0) and (dbrgEntraSai.ItemIndex = 1) then
      if (MsgDlg(
          FU.CMTranslate('A Estação atual é de Ponto mas a Forma de Operação é somente de Entrada.')+
          CR_LF+ FU.CMTranslate('Deseja realmente permanecer com esta opção?'),
          FU.CMTranslate('Aviso'), mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo) then
      begin
        dbcmbFuncao.SetFocus;
        exit;
      end;

    inherited;
    if (Cds.State = dsInsert) then
      dIdEstacao := -1
    else
      SelEstacaoAcesso(dIdEstacao);
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadEstacao.SelEstacaoAcesso(IdEstacaoAcesso: double);
begin
  Cds.Data := CtrlEstacaoAcesso.ListEstacaoAcesso(IdEstacaoAcesso);
  dbcbMarcaChange(nil);
end;

function TfrmCadEstacao.GravarOperacao: boolean;
begin
  Result := CtrlEstacaoAcesso.GravarEstacaoAcesso;
  if not(Result) then
    MsgDlg(CtrlEstacaoAcesso.MessageInfo, FU.CMTranslate('Erro'), mtError, [mbOk,mbHelp], 0);
end;

procedure TfrmCadEstacao.dbedEstacaoExit(Sender: TObject);
begin
  inherited;
  if (CtrlEstacaoAcesso.GetExisteEstacaoAcesso(dbedEstacao.Text,
      Cds.FieldByName('IDESTACAOACESSO').asInteger)) then
    if (MsgDlg(FU.CMTranslate('Já existe uma Estação de Acesso para a mesma máquina.')+CR_LF+
        FU.CMTranslate('Deseja continuar mesmo assim?'), FU.CMTranslate('Aviso'), mtConfirmation,
        [mbYes, mbNo], 0) = mrNo) then
      dbedEstacao.Clear;
end;

end.
