{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da funcionalidade
--------------------------------------------------------------------------------}

unit FCadFuncaoOperacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, uCmSqlParams, fcTreeView, MontaSelect, Db,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons,
  TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe,
  ExtCtrls, wwdblook, CMDBLookupCombo, Mask, wwdbedit, uCmTypes,
  uCtrlFuncaoOperacao, uCtrlForm, uCtrlOperacao, uCtrlObjeto;

const
  MSG01 = 'Preencha o campo: ';
  MSG02 = 'Já existe esta Função cadastrada na base.' + #13#10 +
          'Utilize o registro que já está cadastrado';
  MSG03 = 'Esta função possui registro(s) filho(s) associado(s)';
  MSG04 = 'Já existe registro cadastrado com esses parâmetros para esta Função.'
           + #13#10 + 'Utilize o registro que já está cadastrado';
  MSG05 = 'Esta Operação possui Permissão de Acesso associada';

type
  TFrmCadFuncaoOperacao = class(TFrmCadastroMestreDetMT)
    sqlAutorizaAtu: TCMSqlParams;
    CdsAutorizaAtu: TClientDataSet;
    pnlModulo: TPanel;
    pnlTreeView: TPanel;
    tvFuncoes: TfcTreeView;
    CdsModulo: TCMClientDataSet;
    sqlModulo: TCMSqlParams;
    dblkpModulo: TCMDBLookupCombo;
    lblModulo: TLabel;
    lblFuncaoPai: TLabel;
    dblkpFuncaoPai: TCMDBLookupCombo;
    lblNomeFuncao: TLabel;
    dbedtFuncao: TwwDBEdit;
    CdsFuncaoPai: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    dblkpForm: TCMDBLookupCombo;
    dblkpOperacao: TCMDBLookupCombo;
    dblkpObjeto: TCMDBLookupCombo;
    lblForm: TLabel;
    lblOperacao: TLabel;
    lblObjeto: TLabel;
    CdsForm: TCMClientDataSet;
    CdsOperacao: TCMClientDataSet;
    CdsObjeto: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkpModuloCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure tvFuncoesChange(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeDetalheAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeDetalheApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);

  private
    { Private declarations }
    ctrlFuncaoOperacao : TCtrlFuncaoOperacao;
    ctrlForm : TCtrlForm;
    ctrlOperacao : TCtrlOperacao;
    ctrlObjeto : TCtrlObjeto;

    procedure AbreQueries;
    procedure Seleciona(idModulo: Double = -1; idFuncaoPai: Double = -1; idFuncao: Double = -1);
    procedure MontaArvore;
    function ValidaDados : Boolean;
    function ValidaDadosDet : Boolean;
  public
    { Public declarations }
  end;

var
  FrmCadFuncaoOperacao: TFrmCadFuncaoOperacao;

implementation

Uses uMensErro, dBasedados, uSistema, uFuncaoGeral;

{$R *.DFM}

{ TFrmCadFuncaoOperacao }

procedure TFrmCadFuncaoOperacao.FormCreate(Sender: TObject);
begin
  inherited;

  //Create
  ctrlFuncaoOperacao := TCtrlFuncaoOperacao.Create;
  ctrlForm := TCtrlForm.Create;
  ctrlOperacao := TCtrlOperacao.Create;
  ctrlObjeto := TCtrlObjeto.Create;

  //Initialize
  ctrlFuncaoOperacao.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  ctrlForm.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  ctrlOperacao.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  ctrlObjeto.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  //Atribuição de CDS
  ctrlFuncaoOperacao.cds := Cds;
  ctrlFuncaoOperacao.cdsDet := CdsDet;

  AbreQueries;

  Seleciona();
end;

procedure TFrmCadFuncaoOperacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(ctrlFuncaoOperacao);
  FreeAndNil(ctrlForm);
  FreeAndNil(ctrlOperacao);
  FreeAndNil(ctrlObjeto);
end;

procedure TFrmCadFuncaoOperacao.CmeCadastroInsert(Sender: TObject);
var
  LookupValue, Text : String;
begin
  LookupValue := Cds.FieldByName('idfuncao').AsString;
  Text := Cds.FieldByName('nomefuncao').AsString;

  inherited;

  dblkpFuncaoPai.LookupValue := LookupValue;
  dblkpFuncaoPai.Text := Text;

  cds.FieldByName('IDFUNCAO').asFloat := ctrlFuncaoOperacao.GetSequenceFuncao;
  cds.FieldByName('IDMODULO').asFloat := StrToFloat(dblkpModulo.LookupValue);

  with CdsDet do
  begin
    if ChangeCount > 0 then
      CancelUpdates;

    EmptyDataSet;

    Filter := '';
    Filtered := False;
  end;

  if dbedtFuncao.CanFocus then
    dbedtFuncao.SetFocus;
end;

procedure TFrmCadFuncaoOperacao.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := ctrlFuncaoOperacao.Gravar;

  if Accept then
    MsgDlg('Registro incluído com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
end;

procedure TFrmCadFuncaoOperacao.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := ctrlFuncaoOperacao.Gravar;

  if Accept then
    MsgDlg('Registro alterado com Sucesso', 'Aviso', mtInformation, [mbOK], 0);
end;

procedure TFrmCadFuncaoOperacao.CmeCadastroDelete(Sender: TObject);
begin
  CdsAux.Data := ctrlFuncaoOperacao.ListaFuncao(StrToFloat(dblkpModulo.LookupValue), cds.FieldByName('idfuncao').asFloat);

  If Not CdsAux.IsEmpty Then
  Begin
    MsgDlg(MSG03, 'Erro', mtError, [mbOk], 0);
    sbtnApagar.Down := False;
    CdsAux.Close;

    Exit;
  End;

  CdsAux.Close;

  with CdsDet do
  begin
    First;
    while not Eof do
    begin
      if ctrlFuncaoOperacao.VerificaAutorizacaoVinculada(FieldByName('idoperfunc').AsString) then
      begin
        MsgDlg(MSG05, 'Erro', mtError, [mbOk], 0);

        exit;
      end;

      Delete;
    end;
  end;

  inherited;
end;

procedure TFrmCadFuncaoOperacao.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := ctrlFuncaoOperacao.Apagar;

  if Accept then
    MsgDlg('Registro excluído com Sucesso', 'Aviso', mtInformation, [mbOK], 0);

  if dblkpModulo.LookupValue <> '' then
    MontaArvore;
end;

procedure TFrmCadFuncaoOperacao.sbtnApagarClick(Sender: TObject);
begin
  if cds.isEmpty then
  begin
    CmeCadastro.Operacao := opVazio;
    Exit;
  end
  else
    CmeCadastro.Operacao := opIdle;

  inherited;
end;

procedure TFrmCadFuncaoOperacao.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;

  MontaArvore;
end;

procedure TFrmCadFuncaoOperacao.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;

  MsgDlg(ctrlFuncaoOperacao.MessageInfo, 'Erro', mtError, [mbOK], 0);
end;

procedure TFrmCadFuncaoOperacao.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  if CdsDet.State in [dsInsert, dsEdit] then
  begin
    CdsDet.FieldByName('NOMEFORM').AsString := dblkpForm.Text;
    CdsDet.FieldByName('NOMEOPERACAO').AsString := dblkpOperacao.Text;
    CdsDet.FieldByName('NOMEOBJETO').AsString := dblkpObjeto.Text;
  end;
end;

procedure TFrmCadFuncaoOperacao.CmeDetalheDelete(Sender: TObject);
begin
  if ctrlFuncaoOperacao.VerificaAutorizacaoVinculada(CdsDet.FieldByName('idoperfunc').AsString) then
  begin
    MsgDlg(MSG05, 'Erro', mtError, [mbOk], 0);

    exit;
  end;

  inherited;
end;

procedure TFrmCadFuncaoOperacao.CmeDetalheApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := ctrlFuncaoOperacao.ApagarDet;

  if not(Accept) then
  begin
    MsgDlg(ctrlFuncaoOperacao.MessageInfo, 'Erro', mtError, [mbOK], 0);
    bbtnCancelarClick(Self);
  end;
end;

procedure TFrmCadFuncaoOperacao.CmeDetalheAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;

  MsgDlg(ctrlFuncaoOperacao.MessageInfo, 'Erro', mtError, [mbOK], 0);
end;

procedure TFrmCadFuncaoOperacao.bbtnConfirmarClick(Sender: TObject);
begin
  if not(ValidaDados) then
    exit;

  inherited;
end;

procedure TFrmCadFuncaoOperacao.bbtnCancelarClick(Sender: TObject);
begin
  if ctrlFuncaoOperacao.InTransaction then
    ctrlFuncaoOperacao.RollBack;

  inherited;

  if dblkpModulo.LookupValue <> '' then
    MontaArvore;
end;

procedure TFrmCadFuncaoOperacao.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;

  CmeCadastro.RepetirInsert := False;

  sbtnInserir.Enabled := (dblkpModulo.LookupValue <> '') and not(CmeCadastro.Operacao in [OpAlterar, OpApagar]);

  if CmeCadastro.Operacao = OpInserir then
    sbtnAlterar.Enabled := False
  else
    sbtnAlterar.Enabled := Not cds.IsEmpty;

  if CmeCadastro.Operacao In [OpAlterar, OpInserir] then
    sbtnApagar.Enabled := False
  else
    sbtnApagar.Enabled := Not cds.IsEmpty;

  tvFuncoes.Enabled := not(bbtnConfirmar.Enabled);
  dblkpModulo.Enabled := not(bbtnConfirmar.Enabled);

  if tvFuncoes.CanFocus then
      tvFuncoes.SetFocus;
end;

procedure TFrmCadFuncaoOperacao.AbreQueries;
begin
  //SQL
  sqlModulo.Prepare;
  sqlModulo.Open;

  //Cds
  CdsOperacao.Data := ctrlOperacao.ListaOperacao();
  CdsObjeto.Data := ctrlObjeto.ListaObjeto();
end;

procedure TFrmCadFuncaoOperacao.Seleciona(idModulo, idFuncaoPai, idFuncao: Double);
begin
  Cds.Data := ctrlFuncaoOperacao.ListaFuncao(idModulo, idFuncaoPai);
  CdsFuncaoPai.Data := Cds.Data;

  CdsDet.Data := ctrlFuncaoOperacao.ListaOperFuncObjeto(idModulo, idFuncao);

  CdsForm.Data := ctrlForm.ListaForm(0, idModulo);
end;

procedure TFrmCadFuncaoOperacao.dblkpModuloCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  
  if dblkpModulo.LookupValue <> '' then
    MontaArvore
  else
  begin
    tvFuncoes.Items.Clear;
    Seleciona();
  end;

  sbtnInserir.Enabled := dblkpModulo.LookupValue <> '';
end;

procedure TFrmCadFuncaoOperacao.tvFuncoesChange(
  TreeView: TfcCustomTreeView; Node: TfcTreeNode);
begin
  inherited;

  Cds.Locate('IDFUNCAO', integer(tvFuncoes.Selected.Data), []);

  With CdsDet do
  begin
    Filter := '';
    Filtered := False;

    Filter := ' IDFUNCAO = ' + Cds.fieldbyname('idfuncao').AsString;
    Filtered := True;
  end;
end;

function TFrmCadFuncaoOperacao.ValidaDados: Boolean;
begin
  result := True;

  if (dblkpModulo.Text = EmptyStr) then
  begin
    MsgDlg(MSG01 + lblModulo.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dblkpModulo.CanFocus then
    begin
      dblkpModulo.SetFocus;
      dblkpModulo.DropDown;
    end;

    result := false;
    Exit;
  end;

  if (dblkpFuncaoPai.Text = EmptyStr) then
  begin
    MsgDlg(MSG01 + lblFuncaoPai.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dblkpFuncaoPai.CanFocus then
    begin
      dblkpFuncaoPai.SetFocus;
      dblkpFuncaoPai.DropDown;
    end;

    result := false;
    Exit;
  end;

  if (dbedtFuncao.Text = EmptyStr) then
  begin
    MsgDlg(MSG01 + lblNomeFuncao.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dbedtFuncao.CanFocus then
      dbedtFuncao.SetFocus;
      
    result := false;
    Exit;
  end;

  if ctrlFuncaoOperacao.VerificaDuplicado(dblkpFuncaoPai.LookupValue, cds.fieldbyname('idfuncao').AsString, FuncaoGeral.RemoveCaracterEspecial(dbedtFuncao.Text, False), dblkpModulo.LookupValue) then
  begin
    MsgDlg(MSG02, 'Aviso', mtWarning, [mbOK], 0);

    if dbedtFuncao.CanFocus then
    begin
      dbedtFuncao.SetFocus;
      dbedtFuncao.SelectAll;
    end;
      
    result := false;
    Exit;
  end;
end;

function TFrmCadFuncaoOperacao.ValidaDadosDet: Boolean;
begin
  result := True;

  if (dblkpForm.Text = EmptyStr) then
  begin
    MsgDlg(MSG01 + lblForm.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dblkpForm.CanFocus then
    begin
      dblkpForm.SetFocus;
      dblkpForm.DropDown;
    end;

    result := false;
    Exit;
  end;

  if (dblkpOperacao.Text = EmptyStr) then
  begin
    MsgDlg(MSG01 + lblOperacao.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dblkpOperacao.CanFocus then
    begin
      dblkpOperacao.SetFocus;
      dblkpOperacao.DropDown;
    end;

    result := false;
    Exit;
  end;

  if (dblkpObjeto.Text = EmptyStr) then
  begin
    MsgDlg(MSG01 + lblObjeto.Caption, 'Aviso', mtWarning, [mbOK], 0);

    if dblkpObjeto.CanFocus then
    begin
      dblkpObjeto.SetFocus;
      dblkpObjeto.DropDown;
    end;
      
    result := false;
    Exit;
  end;

  if ctrlFuncaoOperacao.VerificaDuplicadoDet(dblkpModulo.LookupValue, cds.fieldbyname('idfuncao').AsString, dblkpForm.LookupValue, dblkpOperacao.LookupValue, dblkpObjeto.LookupValue) then
  begin
    MsgDlg(MSG04, 'Aviso', mtWarning, [mbOK], 0);

    result := false;
    Exit;
  end;
end;

//Procedure copiada da FDireitosUsu (CM / Forms)
procedure TFrmCadFuncaoOperacao.MontaArvore;
var
   iIdFuncaoPai, iIdFuncao, i: LongInt;
   bHabilita, bAchou, bMenuPrincipal, bTemOperacao : Boolean;

   TreePai, TreeFilho, TreeOperacao, Node: TfcTreeNode;
begin
  tvFuncoes.Items.Clear;

  iIdFuncaoPai := -1;
  iIdFuncao    := -1;
  TreePai      := nil;

  if CdsAutorizaAtu.Active then
    CdsAutorizaAtu.Close;

  SqlAutorizaAtu.Prepare;
  SqlAutorizaAtu.ParamByName('IdModulo').AsInteger    := StrToInt(dblkpModulo.LookupValue);
  SqlAutorizaAtu.ParamByName('IdPessoa').AsInteger    := Sistema.IdEmpresa;
  SqlAutorizaAtu.ParamByName('IdEspAcesso').AsInteger := Sistema.IdEspAcesso;
  SqlAutorizaAtu.Open;

  Seleciona(StrToFloat(dblkpModulo.LookupValue), 0, 0);

  with Cds do
  begin
    First;

    while Not Eof do
    begin
      //Pega o Idfuncaopai para pesquisa posterior(logo abaixo) na TreeView
      if FieldByName('IDFUNCAOPAI').AsInteger <> iIdFuncaoPai then
      begin
        iIdFuncaoPai := FieldByName('IDFUNCAOPAI').AsInteger;
        bAchou := False;
        i := 0;

        //Esta pesquisa verifica se o nó pai já está na Treeview
        while (Not bAchou) And (i < tvFuncoes.Items.Count) do
        begin
          TreePai := Nil;
          
          if Integer(tvFuncoes.Items[i].Data) = iIdFuncaoPai then
          begin
            bAchou := True;
            TreePai := tvFuncoes.Items[i];
          end
          else
            Inc(i);
        end;
      end;

      bHabilita := True;

      if (((FieldByName('NOMEFUNCAO').AsString = 'Usuários') or
           (FieldByName('NOMEFUNCAO').AsString = 'Propriedades do Usuario')) and
          ((FieldByName('NOMEFUNCAO').AsString = 'Direitos') or
           (FieldByName('NOMEFUNCAO').AsString = 'Novo') or
           (FieldByName('NOMEFUNCAO').AsString = 'Propriedades') or
           (FieldByName('NOMEFUNCAO').AsString = 'Excluir') or
           (FieldByName('NOMEFUNCAO').AsString = 'Grupos') or
           (FieldByName('NOMEFUNCAO').AsString = 'Tabelas') or
           (FieldByName('NOMEFUNCAO').AsString = 'Visões') or
           (FieldByName('NOMEFUNCAO').AsString = 'Centro de Custo X Cargo X Funcao X Grupo') or
           (FieldByName('NOMEFUNCAO').AsString = 'Esconder Usuários Desabilitados') or
           (FieldByName('NOMEFUNCAO').AsString = 'Mostrar Usuários Desabilitados'))) then
      begin
        if Sistema.IdUsuario <= 0 then  // Só abrir para Super Usuário
          bHabilita := true
        else
          bHabilita := CdsAutorizaAtu.Locate('IDFUNCAO;IDOPERACAO',
                          VarArrayOf([FieldByname('IDFUNCAO').AsInteger,
                          FieldByname('IDOPERACAO').AsInteger]), []);
      end;

      if (bHabilita) then
      begin
        TreeFilho := tvFuncoes.Items.AddChildObject(
                                 TreePai,
                                 FieldByName('NOMEFUNCAO').AsString,
                                 TObject(FieldByName('IDFUNCAO').AsInteger)
                                 );
      end;
      Next;
    end;
    First;
  end;

  CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmCadFuncaoOperacao.CmeDetalheInsert(Sender: TObject);
begin
  inherited;

  CdsDet.FieldByName('IDFUNCAO').AsFloat := Cds.FieldByName('IDFUNCAO').AsFloat;
  CdsDet.FieldByName('IDMODULO').AsFloat := Cds.FieldByName('IDMODULO').AsFloat;

  if dblkpForm.CanFocus then
  begin
    dblkpForm.SetFocus;
    dblkpForm.DropDown;
  end;
end;

procedure TFrmCadFuncaoOperacao.CmeCadastroFind(Sender: TObject);
var
  i : integer;
begin
  inherited;

  if MontaSelect.RetornouValor then
  begin
    dblkpModulo.LookupValue := MontaSelect.ValoresChave[1];

    MontaArvore;

    Cds.Locate('IDFUNCAO', MontaSelect.ValoresChave[0], []);

    With CdsDet do
    begin
      Filter := '';
      Filtered := False;

      Filter := ' IDFUNCAO = ' + Cds.fieldbyname('idfuncao').AsString;
      Filtered := True;
    end;

    for i :=0 to tvFuncoes.Items.Count-1 do
    if (integer(tvFuncoes.Items.Item[i].Data) = Cds.fieldbyname('idfuncao').AsInteger) then
    begin
      tvFuncoes.Items.Item[i].Selected := True;
      Continue;
    end;
  end;

  Repaint;
end;

procedure TFrmCadFuncaoOperacao.bbtnOkDetClick(Sender: TObject);
begin
  if not(ValidaDadosDet) then
    exit;

  inherited;  
end;

end.
