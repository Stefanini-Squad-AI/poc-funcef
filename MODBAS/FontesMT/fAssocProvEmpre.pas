unit fAssocProvEmpre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Wwdbigrd, Wwdbgrid, DBCtrls, Grids, DBGrids, Db,
  DBTables, Wwdatsrc, Menus, FTelaAut, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, fcLabel,
  CheckLst, ColorListBox, DBClient, uCMClientDataSet, uCtrlFuncoesRH, uCtrlProvDesc,
  uCtrlListTerceirosRH;

type
  TfrmAssocProvEmpre = class(TfrmSairAjuda)
    dsEmpresa: TwwDataSource;
    pmenu: TPopupMenu;
    mnuAlterar: TMenuItem;
    sbtnDesassociar: TSpeedButton;
    sbtnDesassociarTodos: TSpeedButton;
    sbtnAssociar: TSpeedButton;
    sbtnAssociarTodos: TSpeedButton;
    Panel1: TPanel;
    fcLabel1: TfcLabel;
    dbgrdEmpre: TDBGrid;
    lblPlanPatro: TfcLabel;
    fcLabel3: TfcLabel;
    lstbxRubSel: TColorListBox;
    edPesquisaRubSel: TEdit;
    lstbxRubNaoSel: TColorListBox;
    edPesquisaRubNaoSel: TEdit;
    sbtnTornarInvisivelFolha: TSpeedButton;
    sbtnTornarVisivelFolha: TSpeedButton;
    CdsEmpresa: TCMClientDataSet;
    CdsRubNaoSel: TCMClientDataSet;
    CdsRubSel: TCMClientDataSet;
    procedure sbtnAssociarClick(Sender: TObject);
    procedure sbtnAssociarTodosClick(Sender: TObject);
    procedure sbtnDesassociarClick(Sender: TObject);
    procedure sbtnDesassociarTodosClick(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPesquisaRubSelChange(Sender: TObject);
    procedure edPesquisaRubNaoSelChange(Sender: TObject);
    procedure sbtnTornarVisivelFolhaClick(Sender: TObject);
    procedure lstbxRubSelColorItems(Col, Row: Integer; KeyField: String;
      State: TOwnerDrawState; Brush: TBrush; Font: TFont);
    procedure CdsEmpresaAfterScroll(DataSet: TDataSet);
    procedure CdsEmpresaBeforeScroll(DataSet: TDataSet);
  private
    CtrlProvDesc: TCtrlProvDesc;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    mrResultShow: TModalResult;
    bPrimeiraVez: boolean;
    iOldIndex: integer;
    iIdEmpresa: integer;

    procedure AtualizarRubSel(IdEmpresa: double);
    procedure AtualizarRubNaoSel(IdEmpresa: double);
    function  AlterarTodosTipoRub(Visivel: boolean): boolean;
    function  AlterarRubrica(Index: integer): boolean;
    function  AssociarRubrica(Index: integer; ExibirBtAbortar: boolean): boolean;
    function  DesassociarRubrica(Index: integer): boolean;
    function  AplicarAlteracoes(Operacao: TOperacaoDataSet): boolean;
    procedure DownButtons(bRubAss,bRubDes: boolean);
    procedure EnabledButtons(bRubAss,bRubDes: boolean);
  end;

var
  frmAssocProvEmpre: TfrmAssocProvEmpre;

implementation

uses uCtrlPadroes, uMensErro, {uDataBase, }uSistema, fAguarde, fLerCodProvento,
  uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmAssocProvEmpre.FormCreate(Sender: TObject);
begin
  inherited;
  frmLerCodProvento := TfrmLerCodProvento.Create(Application, lstbxRubSel);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  bPrimeiraVez := true;
  CdsEmpresa.Data := CtrlListTerceirosRH.ListEmpresaProp;
  bPrimeiraVez := false;

  case (Sistema.IdModulo) of
    MODBEN : HelpContext := 710004;
    MODFOL : HelpContext := 210023;    
  end;  
end;

procedure TfrmAssocProvEmpre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(frmLerCodProvento);  
  inherited;
end;

procedure TfrmAssocProvEmpre.lstbxRubSelColorItems(Col, Row: Integer;
  KeyField: String; State: TOwnerDrawState; Brush: TBrush; Font: TFont);
begin
  if not(odSelected in State) then
    if (Pos('F',KeyField) > 0) and (Col = 0) then
    begin
      Brush.Color := CL_AMARELO_CLARO;
      Font.Color  := clBlack;
    end
    else
    if (Col = 1) then
    begin
      Brush.Color := clTeal;
      Font.Color  := clWhite;
    end;
end;

procedure TfrmAssocProvEmpre.CdsEmpresaBeforeScroll(DataSet: TDataSet);
begin
  iIdEmpresa := CdsEmpresa.FieldByName('IDPESSOA').asInteger;
end;

procedure TfrmAssocProvEmpre.CdsEmpresaAfterScroll(DataSet: TDataSet);
begin
  if (bPrimeiraVez) or (iIdEmpresa <> CdsEmpresa.FieldByName('IDPESSOA').asInteger) then
  begin
    AtualizarRubSel(CdsEmpresa.FieldByName('IDPESSOA').asFloat);
    AtualizarRubNaoSel(CdsEmpresa.FieldByName('IDPESSOA').asFloat);

    EnabledButtons(not(CdsRubSel.IsEmpty), not(CdsRubNaoSel.IsEmpty));
  end;
end;

procedure TfrmAssocProvEmpre.edPesquisaRubSelChange(Sender: TObject);
begin
  lstbxRubSel.FindString(edPesquisaRubSel.Text);
end;

procedure TfrmAssocProvEmpre.edPesquisaRubNaoSelChange(Sender: TObject);
begin
  lstbxRubNaoSel.FindString(edPesquisaRubNaoSel.Text);
end;

procedure TfrmAssocProvEmpre.sbtnTornarVisivelFolhaClick(Sender: TObject);
begin
  AlterarTodosTipoRub(TComponent(Sender).Name = 'sbtnTornarVisivelFolha');
end;

procedure TfrmAssocProvEmpre.mnuAlterarClick(Sender: TObject);
begin
  AlterarRubrica(lstbxRubSel.ItemIndex);
end;

procedure TfrmAssocProvEmpre.sbtnAssociarClick(Sender: TObject);
begin
  AssociarRubrica(lstbxRubNaoSel.ItemIndex, false);
end;

procedure TfrmAssocProvEmpre.sbtnAssociarTodosClick(Sender: TObject);
var
  c: integer;
  bErro: boolean;
begin
  c := 0;
  repeat
    bErro := not(AssociarRubrica(c, true));
    if (bErro) or (mrResultShow = mrAbort) then
      break
    else
    if (mrResultShow = mrCancel) then
      Inc(c);    
  until (c = lstbxRubNaoSel.Items.Count);
end;

procedure TfrmAssocProvEmpre.sbtnDesassociarClick(Sender: TObject);
begin
  if (MsgDlg('Deseja realmente desassociar esta Rubrica da Empresa?', 'Aviso',
      mtInformation, [mbYes,mbNo], 0) = mrNo) then
    exit;

  DesassociarRubrica(lstbxRubSel.ItemIndex);
end;

procedure TfrmAssocProvEmpre.sbtnDesassociarTodosClick(Sender: TObject);
var
  c: integer;
  bErro: boolean;
begin
  if (MsgDlg('Deseja realmente desassociar TODAS as Rubricas da Empresa?', 'Aviso',
      mtInformation, [mbYes,mbNo], 0) = mrNo) then
    exit;

  frmAguarde.Mostra('Excluindo Associação das Rubricas da Empresa...');
  Self.Update;

  // Desabilito o Desenho da ColorListBox
  lstbxRubSel.Perform(WM_SETREDRAW, 0, 0);
  lstbxRubNaoSel.Perform(WM_SETREDRAW, 0, 0);

  c := 0;
  repeat
    bErro := not(DesassociarRubrica(c));
    if (bErro) then
      break
    else
    if (mrResultShow = mrCancel) then
      Inc(c);
  until (c = lstbxRubSel.Items.Count);

  frmAguarde.Apaga;

  // Habilito o Desenho da ColorListBox
  lstbxRubSel.Perform(WM_SETREDRAW, 1, 0);
  lstbxRubNaoSel.Perform(WM_SETREDRAW, 1, 0);
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmAssocProvEmpre.AtualizarRubSel(IdEmpresa: double);
begin
  CdsRubSel.Data := CtrlProvDesc.ListRubSel(IdEmpresa);

  // Desabilito o Desenho da ColorListBox
  lstbxRubSel.Perform(WM_SETREDRAW, 0, 0);

  // Preenche ColorListBox de Rubricas associadas
  lstbxRubSel.Items.Clear;
  while not(CdsRubSel.EOF) do
  begin
    lstbxRubSel.Items.Add(
      CdsRubSel.FieldByName('DESCRPROVDESC').asString +#9+
      CdsRubSel.FieldByName('CODPROVDESC').asString +#9+
      CdsRubSel.FieldByName('FLGTPRUBRICA').asString +#9+
      CdsRubSel.FieldByName('DESCRICAO').asString +#9+
      CdsRubSel.FieldByName('IDRUBRICA').asString);

    CdsRubSel.Next;
  end;

  // Habilito o Desenho da ColorListBox
  lstbxRubSel.Perform(WM_SETREDRAW, 1, 0);

  lstbxRubSel.ItemIndex := 0;
end;

procedure TfrmAssocProvEmpre.AtualizarRubNaoSel(IdEmpresa: double);
begin
  CdsRubNaoSel.Data := CtrlProvDesc.ListRubNaoSel(IdEmpresa);

  // Desabilito o Desenho da ColorListBox
  lstbxRubNaoSel.Perform(WM_SETREDRAW, 0, 0);

  // Preenche ColorListBox de Rubricas não associadas
  lstbxRubNaoSel.Items.Clear;
  while not(CdsRubNaoSel.EOF) do
  begin
    lstbxRubNaoSel.Items.Add(
      CdsRubNaoSel.FieldByName('DESCRICAO').asString +#9+
      CdsRubNaoSel.FieldByName('IDPROVENTO').asString +#9+
      CdsRubNaoSel.FieldByName('FLGTPRUBRICA').asString);

    CdsRubNaoSel.Next;
  end;

  // Habilito o Desenho da ColorListBox
  lstbxRubNaoSel.Perform(WM_SETREDRAW, 1, 0);

  lstbxRubNaoSel.ItemIndex := 0;
end;

function TfrmAssocProvEmpre.AlterarTodosTipoRub(Visivel: boolean): boolean;
begin
  if (lstbxRubSel.Items.Count <= 0) or (MsgDlg('Tem certeza de que deseja prosseguir?',
      'Aviso', mtWarning, [mbYes,mbNo,mbHelp], 0) <> mrYes) then
  begin
    Result := false;
    exit;
  end;

  frmAguarde.Mostra('Tornando todas as Rubricas da Empresa '+
    FU.IFF(Visivel, 'Visíveis', 'Invisíveis')+' para o RH...');
  frmAguarde.Update;

  Result := CtrlProvDesc.AlterarTipoRubricaEmpresa(Visivel,
    CdsEmpresa.FieldByName('IDPESSOA').asFloat);

  lstbxRubSel.ItemIndex := 0;
  frmAguarde.Apaga;

  if (Result) then
  begin
    AtualizarRubSel(CdsEmpresa.FieldByName('IDPESSOA').asFloat);
    lstbxRubSel.Repaint;
    MsgDlg('Processo executado com sucesso.', 'Informação', mtInformation, [mbOk], 0);
  end;
end;

function TfrmAssocProvEmpre.AlterarRubrica(Index: integer): boolean;
begin
  Result := true;

  // Se não existir Rubricas na lista, não execute este método
  if (lstbxRubSel.Items.Count <= 0) then
    exit;

  // Se não existir Rubrica selecionada, selecionar a primeira
  if (Index = -1) then
    Index := 0;

  lstbxRubSel.ItemIndex := Index;

  // Exibir Form de Alteração da Rubrica por Empresa
  mrResultShow := frmLerCodProvento.ExibirForm(
    false,                                   // Não Exibir Botão de Abortar Operação
    false,                                   // Indico que o usuário irá alterar a Rubrica 
    (Pos('F', lstbxRubSel.GetFieldItem(Index, 2)) > 0), // Visibilidade para o RH (Para
                                             // marcar ou não o CheckeBox de Visibilidade)
    CdsEmpresa.FieldByName('NOME').asString, // Nome da Empresa
    lstbxRubSel.GetFieldItem(Index, 0),      // Descrição do Usuário para a Rubrica
    lstbxRubSel.GetFieldItem(Index, 1),      // Código do Usuário para a Rubrica
    lstbxRubSel.GetFieldItem(Index, 2),      // Visibilidade para o RH (Somente para
                                             // interface entre os Forms)
    lstbxRubSel.GetFieldItem(Index, 3),      // Nossa Descrição para a Rubrica
    StrToFloat(lstbxRubSel.GetFieldItem(Index, 4))); // Nosso Código para a Rubrica

  if (mrResultShow = mrOk) then
  begin
    // Alterar a Rubrica no BD
    Result := AplicarAlteracoes(toAlterar);

    // Atualizar a Rubrica no ColorListBox
    if (Result) then
    begin
      lstbxRubSel.Items[Index] :=
        frmLerCodProvento.DescrProvDesc +#9+ // Descrição do Usuário para a Rubrica
        frmLerCodProvento.CodProvDesc +#9+   // Código do Usuário para a Rubrica
        frmLerCodProvento.TipoRubrica +#9+   // Visibilidade para o RH
        frmLerCodProvento.Descricao +#9+     // Nossa Descrição para a Rubrica
        FloatToStr(frmLerCodProvento.IdProvento); // Nosso Código para a Rubrica
      lstbxRubSel.InvalidateItem(Index);
    end;
  end;
end;

function TfrmAssocProvEmpre.AssociarRubrica(Index: integer; ExibirBtAbortar: boolean): boolean;
begin
  Result := true;

  // Se não existir Rubricas na lista, não execute este método
  if (lstbxRubNaoSel.Items.Count <= 0) then
    exit;

  // Se não existir Rubrica selecionada, selecionar a primeira
  if (Index = -1) then
    Index := 0;

  lstbxRubNaoSel.ItemIndex := Index;

  // Exibir Form de Alteração da Rubrica por Empresa
  mrResultShow := frmLerCodProvento.ExibirForm(
    ExibirBtAbortar,                         // Exibir Botão de Abortar Operação ou não?
    true,                                    // Indico que o usuário irá Associar a Rubrica
    true,                                    // Visibilidade para o RH (Para
                                             // marcar o CheckeBox de Visibilidade)
    CdsEmpresa.FieldByName('NOME').asString, // Nome da Empresa
    lstbxRubNaoSel.GetFieldItem(Index, 0),   // Descrição do Usuário para a Rubrica
    lstbxRubNaoSel.GetFieldItem(Index, 1),   // Código do Usuário para a Rubrica
    lstbxRubNaoSel.GetFieldItem(Index, 2),   // Visibilidade para o RH (Somente para
                                             // interface entre os Forms)
    lstbxRubNaoSel.GetFieldItem(Index, 0),   // Nossa Descrição para a Rubrica
    StrToFloat(lstbxRubNaoSel.GetFieldItem(Index, 1))); // Nosso Código para a Rubrica

  if (mrResultShow = mrOk) then
  begin
    // Inserir a Rubrica no BD
    Result := AplicarAlteracoes(toInserir);

    // Inserir a Rubrica no ColorListBox
    if (Result) then
    begin
      lstbxRubSel.ItemIndex := lstbxRubSel.Items.Add(
        frmLerCodProvento.DescrProvDesc +#9+ // Descrição do Usuário para a Rubrica
        frmLerCodProvento.CodProvDesc +#9+   // Código do Usuário para a Rubrica
        frmLerCodProvento.TipoRubrica +#9+   // Visibilidade para o RH
        frmLerCodProvento.Descricao +#9+     // Nossa Descrição para a Rubrica
        FloatToStr(frmLerCodProvento.IdProvento)); // Nosso Código para a Rubrica

      // Atualizo o índice do ColorListBox
      iOldIndex := lstbxRubNaoSel.ItemIndex;
      lstbxRubNaoSel.Items.Delete(iOldIndex);

      if (lstbxRubNaoSel.Items.Count = 0) then
        lstbxRubNaoSel.ItemIndex := -1
      else
      if (iOldIndex > lstbxRubNaoSel.Items.Count) then
        lstbxRubNaoSel.ItemIndex := lstbxRubNaoSel.Items.Count-1
      else
        lstbxRubNaoSel.ItemIndex := iOldIndex;

      lstbxRubSel.InvalidateItem(lstbxRubSel.ItemIndex);
      lstbxRubNaoSel.InvalidateItem(lstbxRubNaoSel.ItemIndex);
    end;
  end;

  EnabledButtons((lstbxRubSel.Items.Count > 0), (lstbxRubNaoSel.Items.Count > 0));
end;

function TfrmAssocProvEmpre.DesassociarRubrica(Index: integer): boolean;
begin
  Result := true;

  // Se não existir Rubricas na lista, não execute este método
  if (lstbxRubSel.Items.Count <= 0) then
    exit;

  // Se não existir Rubrica selecionada, selecionar a primeira
  if (Index = -1) then
    Index := 0;

  lstbxRubSel.ItemIndex := Index;

  // Excluir a Rubrica no BD
  with (frmLerCodProvento) do
  begin
    Visivel := false;
    IdProvento := StrToFloat(lstbxRubSel.GetFieldItem(Index, 4));
    TipoRubrica := '';
    CodProvDesc := '';
    DescrProvDesc := '';
  end;
  Result := AplicarAlteracoes(toExcluir);

  // Excluir a Rubrica do ColorListBox
  if (Result) then
  begin
    lstbxRubNaoSel.ItemIndex := lstbxRubNaoSel.Items.Add(
      lstbxRubSel.GetFieldItem(Index, 3) +#9+ // Nossa Descrição para a Rubrica
      lstbxRubSel.GetFieldItem(Index, 4) +#9+ // Nosso Código para a Rubrica
      lstbxRubSel.GetFieldItem(Index, 2));    // Visibilidade para o RH

    // Atualizo o índice do ColorListBox
    iOldIndex := lstbxRubSel.ItemIndex;
    lstbxRubSel.Items.Delete(iOldIndex);

    if (lstbxRubSel.Items.Count = 0) then
      lstbxRubSel.ItemIndex := -1
    else
    if (iOldIndex > lstbxRubSel.Items.Count) then
      lstbxRubSel.ItemIndex := lstbxRubSel.Items.Count-1
    else
      lstbxRubSel.ItemIndex := iOldIndex;

    lstbxRubSel.InvalidateItem(lstbxRubSel.ItemIndex);
    lstbxRubNaoSel.InvalidateItem(lstbxRubNaoSel.ItemIndex);
  end;

  EnabledButtons((lstbxRubSel.Items.Count > 0), (lstbxRubNaoSel.Items.Count > 0));
end;

function  TfrmAssocProvEmpre.AplicarAlteracoes(Operacao: TOperacaoDataSet): boolean;
begin
  with (frmLerCodProvento) do
  begin
    // Mudo o Tipo de Visualização para a Folha?
    if (   (Visivel) and (Pos('F',TipoRubrica) = 0)) or
       (not(Visivel) and (Pos('F',TipoRubrica) > 0)) then
    begin
      if (Visivel) and (Pos('F',TipoRubrica) = 0) then
        TipoRubrica := TipoRubrica + 'F'
      else
        TipoRubrica := FU.TrocaCaracter(TipoRubrica, 'F', ' ');

      Result := CtrlProvDesc.GravarRubricaEmpresa(Operacao, IdProvento,
        CdsEmpresa.FieldByName('IdPessoa').asFloat, TipoRubrica, CodProvDesc, DescrProvDesc);
    end
    else
      Result := CtrlProvDesc.GravarRubricaEmpresa(Operacao, IdProvento,
        CdsEmpresa.FieldByName('IdPessoa').asFloat, '', CodProvDesc, DescrProvDesc);
  end;

  if not(Result) then
    MsgDlg('O seguinte erro foi gerado ao tentar gravar os dados no Banco de Dados:'+CR_LF+
      CtrlProvDesc.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);

  DownButtons(false, false);
end;

procedure TfrmAssocProvEmpre.DownButtons(bRubAss,bRubDes: boolean);
begin
  sbtnDesassociar.Down := bRubAss;
  sbtnDesassociarTodos.Down := bRubAss;
  sbtnAssociar.Down := bRubDes;
  sbtnAssociarTodos.Down := bRubDes;
end;

procedure TfrmAssocProvEmpre.EnabledButtons(bRubAss,bRubDes: boolean);
begin
  sbtnTornarVisivelFolha.Enabled := bRubAss;
  sbtnTornarInvisivelFolha.Enabled := bRubAss;
  sbtnDesassociar.Enabled := bRubAss;
  sbtnDesassociarTodos.Enabled := bRubAss;
  sbtnAssociar.Enabled := bRubDes;
  sbtnAssociarTodos.Enabled := bRubDes;
end;

end.
