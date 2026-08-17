unit FAssocProvEmpre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Wwdbigrd, Wwdbgrid,
  DBCtrls, Grids, DBGrids, Db, DBTables, Wwquery, Wwdatsrc, Menus, FTelaAut,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, fcLabel, CheckLst,
  ColorListBox;

type
  TfrmAssocProvEmpre = class(TfrmSairAjuda)
    dsEmpre: TwwDataSource;
    qryEmpre: TwwQuery;
    dsRubSel: TwwDataSource;
    pmenu: TPopupMenu;
    mnuAlterar: TMenuItem;
    qryRubSel: TwwQuery;
    qryRubNaoSel: TwwQuery;
    sbtnDesassociar: TSpeedButton;
    sbtnDesassociarTodos: TSpeedButton;
    sbtnAssociar: TSpeedButton;
    sbtnAssociarTodos: TSpeedButton;
    updRubSel: TUpdateSQL;
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
    qryAux: TwwQuery;
    procedure sbtnAssociarClick(Sender: TObject);
    procedure sbtnAssociarTodosClick(Sender: TObject);
    procedure sbtnDesassociarClick(Sender: TObject);
    procedure sbtnDesassociarTodosClick(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
    procedure qryEmpreAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPesquisaRubSelChange(Sender: TObject);
    procedure edPesquisaRubNaoSelChange(Sender: TObject);
    procedure sbtnTornarVisivelFolhaClick(Sender: TObject);
    procedure sbtnTornarInvisivelFolhaClick(Sender: TObject);
    procedure qryEmpreBeforeScroll(DataSet: TDataSet);
    procedure lstbxRubSelColorItems(Col, Row: Integer; KeyField: String;
      State: TOwnerDrawState; Brush: TBrush; Font: TFont);
  private
    mrResultShow: TModalResult;
    bPrimeiraVez, bErro: boolean;
    iOldIndex, iIDEmpresa, iIndice: integer;
    sItemAtual, sIDProv, sNomeProv, sTipoRubAux: string;

    procedure AtualizarRubNaoSel(ID: integer);
    procedure AtualizarRubSel(ID: integer);

    procedure AlterarTodosTipoRub(bTipo: boolean);
    procedure MudaVisibProvento(ID: string);

    procedure AssociarRubrica(Index: integer);
    procedure DesassociarRubrica(Index: integer);

    procedure AplicarAlteracoes;

    procedure DownButtons(bRubAss,bRubDes: boolean);
    procedure EnabledButtons(bRubAss,bRubDes: boolean);
  public
  end;

var
  frmAssocProvEmpre: TfrmAssocProvEmpre;

implementation

uses dBaseDados, uMensErro, uDataBase, uSistema, uFuncoesUteis, fAguarde, fLerCodProvento;

{$R *.DFM}

procedure TfrmAssocProvEmpre.FormCreate(Sender: TObject);
begin
  inherited;
  frmLerCodProvento := TfrmLerCodProvento.Create(Application);

  bPrimeiraVez := true;
  qryEmpre.Open;
  bPrimeiraVez := false;
end;

procedure TfrmAssocProvEmpre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmLerCodProvento.Free;
  inherited;
end;

procedure TfrmAssocProvEmpre.qryEmpreBeforeScroll(DataSet: TDataSet);
begin
  inherited;
  iIDEmpresa := qryEmpre.FieldByName('IDPESSOA').asInteger;
end;

procedure TfrmAssocProvEmpre.qryEmpreAfterScroll(DataSet: TDataSet);
begin
  if (bPrimeiraVez) or (iIDEmpresa <> qryEmpre.FieldByName('IDPESSOA').asInteger) then
  begin
    AtualizarRubSel(qryEmpre.FieldByName('IDPESSOA').asInteger);
    AtualizarRubNaoSel(qryEmpre.FieldByName('IDPESSOA').asInteger);

    EnabledButtons(not(qryRubSel.IsEmpty), not(qryRubNaoSel.IsEmpty));
  end;
end;

procedure TfrmAssocProvEmpre.edPesquisaRubSelChange(Sender: TObject);
begin
  lstbxRubSel.FindString(edPesquisaRubSel.Text);
end;

procedure TfrmAssocProvEmpre.lstbxRubSelColorItems(Col, Row: Integer;
  KeyField: String; State: TOwnerDrawState; Brush: TBrush; Font: TFont);
begin
  inherited;
  sTipoRubAux := lstbxRubSel.GetFieldItem(Row, 2);

  if not(odSelected in State) then
    if (Pos('F',sTipoRubAux) > 0) and (Col = 0) then
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

procedure TfrmAssocProvEmpre.edPesquisaRubNaoSelChange(Sender: TObject);
begin
  lstbxRubNaoSel.FindString(edPesquisaRubNaoSel.Text);
end;

procedure TfrmAssocProvEmpre.sbtnAssociarClick(Sender: TObject);
begin
  frmLerCodProvento.bHabilitaSair := false;

  AssociarRubrica(lstbxRubNaoSel.ItemIndex);
  if (bErro) then
    EnabledButtons(not(qryRubSel.IsEmpty), not(qryRubNaoSel.IsEmpty));
end;

procedure TfrmAssocProvEmpre.sbtnAssociarTodosClick(Sender: TObject);
begin
  qryRubNaoSel.First;
  while not(qryRubNaoSel.EOF) do
  begin
    frmLerCodProvento.bHabilitaSair := true;

    AssociarRubrica(lstbxRubNaoSel.Items.IndexOf(
      qryRubNaoSel.FieldByName('DESCRICAO').asString +#9+
      qryRubNaoSel.FieldByName('IDPROVENTO').asString));

    if (bErro) or (mrResultShow = mrAbort) then
      break;

    qryRubNaoSel.Next;
  end;

  if not(bErro) then
    EnabledButtons(not(qryRubSel.IsEmpty), not(qryRubNaoSel.IsEmpty));
end;

procedure TfrmAssocProvEmpre.sbtnDesassociarClick(Sender: TObject);
begin
  if (MsgDlg ('Deseja realmente desassociar esta Rubrica da Empresa ?','Aviso',mtInformation,[mbYes,mbNo],0) = mrNo) then
    exit;

  frmLerCodProvento.bHabilitaSair := false;

  DesassociarRubrica(lstbxRubSel.ItemIndex);
  if (bErro) then
    EnabledButtons(not(qryRubSel.IsEmpty), not(qryRubNaoSel.IsEmpty));
end;

procedure TfrmAssocProvEmpre.sbtnDesassociarTodosClick(Sender: TObject);
begin
  if (MsgDlg ('Deseja realmente desassociar TODAS as Rubricas da Empresa ?','Aviso', mtInformation,[mbYes,mbNo],0) = mrNo) then
    exit;

  qryRubSel.First;
  while not(qryRubSel.EOF) do
  begin
    frmLerCodProvento.bHabilitaSair := true;

    DesassociarRubrica(lstbxRubSel.Items.IndexOf(
      qryRubSel.FieldByName('DESCRPROVDESC').asString +#9+
      qryRubSel.FieldByName('CODPROVDESC').asString +#9+
      qryRubSel.FieldByName('FLGTPRUBRICA').asString));

    if (bErro) or (mrResultShow = mrAbort) then
      break;

    qryRubSel.Next;
  end;

  if not(bErro) then
    EnabledButtons(not(qryRubSel.IsEmpty), not(qryRubNaoSel.IsEmpty));
end;

procedure TfrmAssocProvEmpre.sbtnTornarVisivelFolhaClick(Sender: TObject);
begin
  inherited;
  AlterarTodosTipoRub(true);
end;

procedure TfrmAssocProvEmpre.sbtnTornarInvisivelFolhaClick(Sender: TObject);
begin
  inherited;
  AlterarTodosTipoRub(false);
end;

procedure TfrmAssocProvEmpre.mnuAlterarClick(Sender: TObject);
begin
  bErro := false;

  if (lstbxRubSel.Items.Count <= 0) then
    exit;

  if (lstbxRubSel.ItemIndex = -1) then
    lstbxRubSel.ItemIndex := 0;

  sTipoRubAux := lstbxRubSel.GetFieldItem(lstbxRubSel.ItemIndex, 2);
  sItemAtual  := lstbxRubSel.GetFieldItem(lstbxRubSel.ItemIndex, 1);

  qryRubSel.Locate('CODPROVDESC',sItemAtual,[]);
  sIDProv   := qryRubSel.FieldByName('IDRUBRICA').asString;
  sNomeProv := qryRubSel.FieldByName('DESCRICAO').asString;

  with (frmLerCodProvento) do
  begin
    chkbxVisivel.Checked := (Pos('F',sTipoRubAux) > 0);
    lblEmpresa.Caption   := qryEmpre.FieldByName('NOME').asString;
    lblProvento.Caption  := 'Rubrica ' + sNomeProv +' - ('+ sIDProv +')';
    edDescProvento.Text  := qryRubSel.FieldByName('DESCRPROVDESC').asString;
    edCodProvento.Text   := qryRubSel.FieldByName('CODPROVDESC').asString;

    mrResultShow := ShowModal;
    if (mrResultShow = mrCancel) then
      exit;

    // Alterar a Rubrica Associada à Empresa
    try
      qryRubSel.Locate('IDRUBRICA;IDPESSOA',VarArrayOf([
        sIDProv, qryEmpre.FieldByName('IDPESSOA').asInteger]),[]);
      qryRubSel.Edit;
      if (sCodProvento <> '') then
        qryRubSel.FieldByName('CODPROVDESC').asString := sCodProvento;

      if (Trim(sDescProvento) <> '') then
        qryRubSel.FieldByName('DESCRPROVDESC').asString := sDescProvento;
      qryRubSel.Post;
    except
      on E: EDBEngineError do
      begin
        MostrarErro(E);
        bErro := true;
      end;
    end;
  end;

  AplicarAlteracoes;

  // Muda a Visibilidade da Rubrica do Cadastro para para ser a selecionada
  if not(bErro) then
  begin
    MudaVisibProvento(qryRubSel.FieldByName('IDRUBRICA').asString);
    lstbxRubSel.Items[lstbxRubSel.ItemIndex] :=
      qryRubSel.FieldByName('DESCRPROVDESC').asString +#9+
      qryRubSel.FieldByName('CODPROVDESC').asString +#9+ sTipoRubAux;
  end;

  if not(bErro) then
    lstbxRubSel.InvalidateItem(lstbxRubSel.ItemIndex);
end;

procedure TfrmAssocProvEmpre.AssociarRubrica(Index: integer);
begin
  bErro := false;

  if (lstbxRubNaoSel.Items.Count <= 0) then
    exit;

  if (Index = -1) then
    Index := 0;

  lstbxRubNaoSel.ItemIndex := Index;  

  sItemAtual := lstbxRubNaoSel.GetFieldItem(Index, 1);

  qryRubNaoSel.Locate('IDPROVENTO',sItemAtual,[]);
  sIDProv     := qryRubNaoSel.FieldByName('IDPROVENTO').asString;
  sNomeProv   := qryRubNaoSel.FieldByName('DESCRICAO').asString;
  sTipoRubAux := qryRubNaoSel.FieldByName('FLGTPRUBRICA').asString;

  with (frmLerCodProvento) do
  begin
    chkbxVisivel.Checked := true;
    lblEmpresa.Caption   := qryEmpre.FieldByName('NOME').asString;
    lblProvento.Caption  := 'Rubrica ' + sNomeProv +' - ('+ sIDProv +')';
    edDescProvento.Text  := qryRubNaoSel.FieldByName('DESCRICAO').asString;
    edCodProvento.Text   := '';

    mrResultShow := ShowModal;
    if (mrResultShow in [mrCancel, mrAbort]) then
      exit;

    // Insiro a Rubrica Associada à Empresa
    try
      qryRubSel.Insert;
      qryRubSel.FieldByName('IDRUBRICA').asString     := sIDProv;
      qryRubSel.FieldByName('IDPESSOA').asString      := qryEmpre.FieldByName('IDPESSOA').asString;
      qryRubSel.FieldByName('CODPROVDESC').asString   := sCodProvento;
      qryRubSel.FieldByName('DESCRPROVDESC').asString := sDescProvento;
      qryRubSel.FieldByName('DESCRICAO').asString     := sNomeProv;
      qryRubSel.Post;
    except
      on E: EDBEngineError do
      begin
        MostrarErro(E);
        bErro := true;
      end;
    end;
  end;

  // Muda a Visibilidade da Rubrica do Cadastro para para ser a selecionada
  if not(bErro) then
    MudaVisibProvento(sIDProv);

  AplicarAlteracoes;

  if not(bErro) then
  begin
    iIndice := lstbxRubSel.Items.Add(qryRubSel.FieldByName('DESCRPROVDESC').asString +#9+
      qryRubSel.FieldByName('CODPROVDESC').asString +#9+ sTipoRubAux +#9+
      qryRubSel.FieldByName('IDRUBRICA').asString);
    lstbxRubSel.ItemIndex := iIndice;

    iOldIndex := lstbxRubNaoSel.ItemIndex;

    if (iOldIndex > -1) then
    begin
      lstbxRubNaoSel.Items.Delete(iOldIndex);

      if (lstbxRubNaoSel.Items.Count = 0) then
        lstbxRubNaoSel.ItemIndex := -1
      else
      if (iOldIndex > lstbxRubNaoSel.Items.Count) then
        lstbxRubNaoSel.ItemIndex := lstbxRubNaoSel.Items.Count-1
      else
        lstbxRubNaoSel.ItemIndex := iOldIndex;
    end
    else
      bErro := true;
  end;

  if not(bErro) then
  begin
    lstbxRubSel.InvalidateItem(lstbxRubSel.ItemIndex);
    lstbxRubNaoSel.InvalidateItem(lstbxRubNaoSel.ItemIndex);
  end;
end;

procedure TfrmAssocProvEmpre.DesassociarRubrica(Index: integer);
begin
  bErro := false;

  if (lstbxRubSel.Items.Count <= 0) then
    exit;

  if (Index = -1) then
    Index := 0;

  lstbxRubSel.ItemIndex := Index;  

  sTipoRubAux := lstbxRubSel.GetFieldItem(Index, 2);
  sItemAtual  := lstbxRubSel.GetFieldItem(Index, 1);

  qryRubSel.Locate('CODPROVDESC',sItemAtual,[]);
  sIDProv   := qryRubSel.FieldByName('IDRUBRICA').asString;
  sNomeProv := qryRubSel.FieldByName('DESCRICAO').asString;

  // Apaga a Rubrica Associada à Empresa
  try
    if (qryRubSel.Locate('IDRUBRICA;IDPESSOA',VarArrayOf([
      sIDProv, qryEmpre.FieldByName('IDPESSOA').asInteger]),[])) then
      qryRubSel.Delete
    else
      bErro := true;
  except
    on E: EDBEngineError do
    begin
      MostrarErro(E);
      bErro := true;
    end;
  end;

  // Muda a Visibilidade da Rubrica do Cadastro para para ser invisível
  if not(bErro) then
  begin
    frmLerCodProvento.bVisivel := false;
    MudaVisibProvento(sIDProv);
  end;

  AplicarAlteracoes;

  // Apaga a respectiva Rubrica da Lista de Rubricas Selecionadas
  if not(bErro) then
  begin
    lstbxRubNaoSel.ItemIndex := lstbxRubNaoSel.Items.Add(sNomeProv +#9+ sIDProv);

    iOldIndex := lstbxRubSel.ItemIndex;

    if (iOldIndex > -1) then
    begin
      lstbxRubSel.Items.Delete(iOldIndex);

      if (lstbxRubSel.Items.Count = 0) then
        lstbxRubSel.ItemIndex := -1
      else
      if (iOldIndex > lstbxRubSel.Items.Count) then
        lstbxRubSel.ItemIndex := lstbxRubSel.Items.Count-1
      else
        lstbxRubSel.ItemIndex := iOldIndex;
    end
    else
      bErro := true;
  end;

  if not(bErro) then
  begin
    lstbxRubSel.InvalidateItem(lstbxRubSel.ItemIndex);
    lstbxRubNaoSel.InvalidateItem(lstbxRubNaoSel.ItemIndex);
  end;
end;

procedure TfrmAssocProvEmpre.AlterarTodosTipoRub(bTipo: boolean);
begin
  if (lstbxRubSel.Items.Count <= 0) or (MsgDlg('Tem certeza de que deseja prosseguir ?',
      'Aviso',mtWarning, [mbYes,mbNo,mbHelp],0) <> mrYes) then
      exit;

  frmAguarde.Mostra('Processando...');

  try
    StartTransacao;
    with (qryAux.SQL) do
    begin
      Clear;
      Add('UPDATE PROVDESC SET');

      if (bTipo) then
      begin // Para Tornar todas VISÍVEIS
        Add('FLGTPRUBRICA = DECODE(RTRIM(LTRIM(FLGTPRUBRICA)), '''', ''F'',');
        Add('  DECODE(INSTR(RTRIM(LTRIM(FLGTPRUBRICA)),''F''), 0,');
        Add('  RTRIM(LTRIM(FLGTPRUBRICA)) || ''F'', RTRIM(LTRIM(FLGTPRUBRICA))))');
      end
      else
      begin // Para Tornar todas INVISÍVEIS
        Add('FLGTPRUBRICA = DECODE(RTRIM(LTRIM(FLGTPRUBRICA)), '''', '''',');
        Add('  DECODE(INSTR(RTRIM(LTRIM(FLGTPRUBRICA)),''F''), 0,');
        Add('  RTRIM(LTRIM(FLGTPRUBRICA)), RTRIM(LTRIM(REPLACE(FLGTPRUBRICA,''F'','''')))))');
      end;

      Add('WHERE');
      Add('  IDPROVENTO IN (SELECT IDRUBRICA FROM RUBRICAXPESS WHERE IDPESSOA = ' +IntToStr(Sistema.IdEmpresa)+')');
    end;
    qryAux.ExecSQL;
    CommitTransacao;
  except
    on E: EDBEngineError do
    begin
      RollBackTransacao;
      MostrarErro(E);
      bErro := true;
    end;
  end;

  lstbxRubSel.ItemIndex := 0;
  frmAguarde.Apaga;

  if not(bErro) then
  begin
    AtualizarRubSel(qryEmpre.FieldByName('IDPESSOA').asInteger);
    lstbxRubSel.Repaint;
  end;  
end;

procedure TfrmAssocProvEmpre.MudaVisibProvento(ID: string);
begin
  // Gravar na ProvDesc o tipo da Rubrica
  if ((frmLerCodProvento.bVisivel)    and (Pos('F',sTipoRubAux) = 0)) or
     (not(frmLerCodProvento.bVisivel) and (Pos('F',sTipoRubAux) > 0)) then
  begin
    if (frmLerCodProvento.bVisivel) and (Pos('F',sTipoRubAux) = 0) then
      sTipoRubAux := OverStr(Pos(' ',sTipoRubAux), sTipoRubAux, 'F')
    else
      sTipoRubAux := OverStr(Pos('F',sTipoRubAux), sTipoRubAux, ' ');

    sTipoRubAux := Trim(sTipoRubAux);
    try
      StartTransacao;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('UPDATE PROVDESC SET FLGTPRUBRICA = '+
        QuotedStr(sTipoRubAux) +' WHERE '+ '(IDPROVENTO = '+ID+')');
      qryAux.ExecSQL;
      CommitTransacao;
    except
      on E: EDBEngineError do
      begin
        RollBackTransacao;
        MostrarErro(E);
        bErro := true;
      end;
    end;
  end;
end;

procedure TfrmAssocProvEmpre.AtualizarRubSel(ID: integer);
begin
  qryRubSel.Close;
  qryRubSel.ParamByName('IDPESSOA').asInteger := ID;
  qryRubSel.Open;

  // Habilito o Desenho da ListBox
  lstbxRubSel.Perform(WM_SETREDRAW, 0, 0);

  // Preenche a Lista de Rubricas associadas com seus respectivos códigos,
  // sua Visibilidade e os seus respectivos Campos-Chave
  lstbxRubSel.Items.Clear;
  while not(qryRubSel.EOF) do
  begin
    iIndice := lstbxRubSel.Items.Add(qryRubSel.FieldByName('DESCRPROVDESC').asString +#9+
      qryRubSel.FieldByName('CODPROVDESC').asString +#9+
      qryRubSel.FieldByName('FLGTPRUBRICA').asString +#9+
      qryRubSel.FieldByName('IDRUBRICA').asString);

    qryRubSel.Next;
  end;

  // Desabilito o Desenho da ListBox
  lstbxRubSel.Perform(WM_SETREDRAW, 1, 0);

  lstbxRubSel.ItemIndex := 0;
end;

procedure TfrmAssocProvEmpre.AtualizarRubNaoSel (ID: integer);
begin
  qryRubNaoSel.Close;
  qryRubNaoSel.ParamByName('IDPESSOA').asInteger := ID;
  qryRubNaoSel.Open;

  // Habilito o Desenho da ListBox
  lstbxRubNaoSel.Perform(WM_SETREDRAW, 0, 0);

  // Preenche Lista de Rubricas não associadas e dos seus respectivos códigos
  lstbxRubNaoSel.Items.Clear;
  while not(qryRubNaoSel.EOF) do
  begin
    lstbxRubNaoSel.Items.Add(qryRubNaoSel.FieldByName('DESCRICAO').asString +#9+
      qryRubNaoSel.FieldByName('IDPROVENTO').asString);

    qryRubNaoSel.Next;
  end;

  // Desabilito o Desenho da ListBox
  lstbxRubNaoSel.Perform(WM_SETREDRAW, 1, 0);

  lstbxRubNaoSel.ItemIndex := 0;
end;

procedure TfrmAssocProvEmpre.DownButtons(bRubAss,bRubDes: boolean);
begin
  sbtnDesassociar.Down      := bRubAss;
  sbtnDesassociarTodos.Down := bRubAss;
  sbtnAssociar.Down         := bRubDes;
  sbtnAssociarTodos.Down    := bRubDes;
end;

procedure TfrmAssocProvEmpre.EnabledButtons(bRubAss,bRubDes: boolean);
begin
  sbtnTornarVisivelFolha.Enabled   := bRubAss;
  sbtnTornarInvisivelFolha.Enabled := bRubAss;
  sbtnDesassociar.Enabled          := bRubAss;
  sbtnDesassociarTodos.Enabled     := bRubAss;
  sbtnAssociar.Enabled             := bRubDes;
  sbtnAssociarTodos.Enabled        := bRubDes;
end;

procedure TfrmAssocProvEmpre.AplicarAlteracoes;
begin
  if not(bErro) then
  begin
    try
      dtmBaseDados.dbBaseDados.ApplyUpdates([qryRubSel]);
    except
      on E: EDBEngineError do
      begin
        qryRubSel.CancelUpdates;
        bErro := true;

        MostrarErro(E);
      end;
    end;
  end
  else
    qryRubSel.CancelUpdates;

  DownButtons(false, false);
end;

end.
