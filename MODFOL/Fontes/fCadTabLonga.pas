unit fCadTabLonga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadMestreDetCS,
  Spin, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, Menus, DBGrids, CmEventosCadastro, ImgList;

type
  TfrmCadTabLonga = class(TfrmCadMestreDetalheCS)
    dedNome: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    wwDBEdit2: TwwDBEdit;
    Label3: TLabel;
    Spin: TSpinEdit;
    QryDet: TwwQuery;
    updDet: TUpdateSQL;
    QryCmp: TwwQuery;
    dsCmp: TwwDataSource;
    updCmp: TUpdateSQL;
    QryCmpIDTABELA: TFloatField;
    QryCmpIDCAMPO: TFloatField;
    QryCmpDESCRICAO: TStringField;
    ppmTab: TPopupMenu;
    mnuIncluirCampo: TMenuItem;
    mnuAlterarCampo: TMenuItem;
    mnuVisualizarCampos: TMenuItem;
    mnuExcluirCampo: TMenuItem;
    dbgrpcmp: TDBGrid;
    Toolbar972: TToolbar97;
    sbtnCopiar: TToolbarButton97;
    QryCopia: TwwQuery;
    bbtnExportar: TBitBtn;
    SaveDialog: TSaveDialog;
    MemHelp: TMemo;
    QryAux: TwwQuery;
    procedure mnuVisualizarCamposClick(Sender: TObject);
    procedure mnuAlterarCampoClick(Sender: TObject);
    procedure mnuIncluirCampoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnCopiarClick(Sender: TObject);
    procedure bbtnExportarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbgrdDetKeyPress(Sender: TObject; var Key: Char);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure QryDetBeforePost(DataSet: TDataSet);
  private
    vInclui, IsDetail: boolean;
    vId: LongInt;
    dProxNumLinha: double;

    procedure Sel(SelPrincipal: boolean; IdTabela: double);
  end;

var
  frmCadTabLonga: TfrmCadTabLonga;

implementation

uses uDataBase, uMensErro, fAguarde, uFuncoesUteisRH;

{$R *.DFM}

procedure TfrmCadTabLonga.FormCreate(Sender: TObject);
begin
  inherited;
  IsDetail := true;
end;

procedure TfrmCadTabLonga.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Refresh;
    vId := StrToInt(MontaSelect.ValoresChave[0]);
    Sel(true, vId);
  end;
end;

procedure TfrmCadTabLonga.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  vId := LeUltRegistro(nil, 'LONGTABGENER');
  Qry.FieldByName('IDTABELA').asInteger := vId;

  Sel(false, vId);
  dedNome.SetFocus;
end;

procedure TfrmCadTabLonga.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dedNome.SetFocus;
  vId := Qry.FieldByName('IDTABELA').asInteger;
end;

procedure TfrmCadTabLonga.CmeCadastroConfirma(Sender: TObject);
begin
  if (qry.State in [dsEdit,dsInsert]) then
  begin
    if (Trim(dedNome.Text) = '') then
      MsgDlg('Existem campos em branco.', 'Aviso', mtInformation, [mbOk, mbHelp], 0)
    else
      inherited;
  end
  else
    inherited;
end;

procedure TfrmCadTabLonga.QryDetBeforePost(DataSet: TDataSet);
begin
  FazQuery(QryAux, 'SELECT MAX(NUMLINHA) AS PROXREG FROM LONGVALTABGENER WHERE IDTABELA = '+
    qry.FieldByName('IDTABELA').asString);

  if (dProxNumLinha < (QryAux.FieldByName('PROXREG').asInteger+1)) then
    dProxNumLinha := QryAux.FieldByName('PROXREG').asInteger + 1
  else
    dProxNumLinha := dProxNumLinha+1;

  QryDet.FieldByName('IDTABELA').asString := qry.FieldByName('IDTABELA').asString;
  QryDet.FieldByName('NUMLINHA').asFloat := dProxNumLinha;
  inherited;
end;

procedure TfrmCadTabLonga.dbgrdDetKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Ord(Key) = 32) then  //Barra de Espaço
    dbgrdDetDblClick(Sender);
end;

procedure TfrmCadTabLonga.sbtnInsDetClick(Sender: TObject);
begin
  dProxNumLinha := 0;
  QryDet.Append;
  QryDet.FieldByName('IDTABELA').asInteger := vId;
  tb97Detalhe.Visible := true;
  sbtnInsDet.Down := false;
end;

procedure TfrmCadTabLonga.sbtnAltDetClick(Sender: TObject);
begin
  QryDet.Edit;
  QryDet.FieldByName('IDTABELA').asInteger := vId;
  tb97Detalhe.Visible := true;
  sbtnAltDet.Down := false;
end;

procedure TfrmCadTabLonga.mnuIncluirCampoClick(Sender: TObject);
var
  I, Numero: LongInt;
  NomeNew, NomeOld: string;
begin
  Spin.Value := Spin.Value + 1;

  Numero := 2;
  for i:= 101 downto 2 do
  begin
    if (QryDet.Fields[i].Visible) then
    begin
      Numero := i + 1;
      Break;
    end;
  end;

  QryDet.Fields[Numero].Visible := true;
  NomeOld := QryDet.Fields[Numero].DisplayLabel;
  NomeNew := InputBox('Nomear campo','Informe o nome do campo:', NomeOld);
  NomeNew := UpperCase(NomeNew);
  QryDet.Fields[Numero].DisplayLabel := NomeNew;

  if not(qryCmp.Locate('IDTABELA;IDCAMPO', VarArrayOf([vId,Numero - 1]), [])) then
  begin
    QryCmp.Insert;
    QryCmp.FieldByName('IDTABELA').asInteger := vId;
    QryCmp.FieldByName('IDCAMPO').asInteger  := Numero - 1;
    QryCmp.FieldByName('DESCRICAO').asString := NomeNew;
    try
      QryCmp.post;
      QryCmp.ApplyUpdates;
    except
      MsgDlg('Erro na gravação do tipo de campo.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      QryCmp.Cancel;
      QryCmp.CancelUpdates;
      QryDet.Fields[Numero].Visible := false;
      Spin.Value := Spin.Value - 1;
      exit;
    end;
  end;
end;

procedure TfrmCadTabLonga.mnuAlterarCampoClick(Sender: TObject);
var
  NomeOld: string;
begin
  inherited;
  NomeOld := dbgrdDet.SelectedField.DisplayLabel;
  dbgrdDet.SelectedField.DisplayLabel := InputBox('Nomear campo', 'Informe o nome do campo:', NomeOld);
  if qryCmp.Locate('IDTABELA;DESCRICAO', VarArrayOf([vId, NomeOld]), []) then
  begin
    QryCmp.Edit;
    QryCmp.FieldByName('DESCRICAO').asString := UpperCase(dbgrdDet.SelectedField.DisplayLabel);
    try
      QryCmp.Post;
      QryCmp.ApplyUpdates;
    except
      MsgDlg('Erro na gravação do tipo de campo.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      dbgrdDet.SelectedField.DisplayLabel := NomeOld;
      exit;
    end;
  end;
end;

procedure TfrmCadTabLonga.sbtnExcluiDetClick(Sender: TObject);
var
  c: LongInt;
begin
  if not(IsDetail) then
  begin
    QryCmp.Last;
    if (MsgDlg('Deseja excluir campo '+QryCmp.FieldByName('DESCRICAO').asString+'?',
       'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
    begin
      QryCmp.Delete;

      for c:=2 to 101 do
        QryDet.Fields[c].Visible := false;

      QryCmp.First;
      while not(QryCmp.EOF) do
      begin
        if (QryCmp.FieldByName('IDCAMPO').asInteger > 0) then
        begin
          QryDet.Fields[QryCmp.FieldByName('IDCAMPO').asInteger + 1].Visible := true;
          QryDet.Fields[QryCmp.FieldByName('IDCAMPO').asInteger + 1].DisplayLabel :=
            QryCmp.FieldByName('DESCRICAO').asString;
        end;
        QryCmp.Next;
      end;
      Spin.Value := Spin.Value - 1;
    end;
  end
  else
  begin
    if (MsgDlg('Deseja excluir linha da tabela?', 'Exclusão', mtConfirmation,
        [mbYes,mbNo],0) = mrYes) then
      QryDet.Delete;
  end;
  sbtnExcluiDet.Down := false;
end;

procedure TfrmCadTabLonga.mnuVisualizarCamposClick(Sender: TObject);
begin
  if (mnuIncluirCampo.Visible) then
  begin
    mnuIncluirCampo.Visible := false;
    mnuAlterarCampo.Visible := false;
    mnuExcluirCampo.Visible := false;
    sbtnInsDet.Enabled := false;
    sbtnAltDet.Enabled := false;
    mnuVisualizarCampos.Caption := '&Voltar';
    dbgrpcmp.BringToFront;
    IsDetail := false;
    QryCmp.Close;
    QryCmp.Open;
  end
  else
  begin
    mnuIncluirCampo.Visible := true;
    mnuAlterarCampo.Visible := true;
    mnuExcluirCampo.Visible := true;
    sbtnInsDet.Enabled := true;
    sbtnAltDet.Enabled := true;
    mnuVisualizarCampos.Caption := '&Visualizar Campos';
    dbgrdDet.BringToFront;
    IsDetail := true;
  end;
end;

procedure TfrmCadTabLonga.dbgrdDetDblClick(Sender: TObject);
var
  Numero: LongInt;
  Campo, Valor, Aux: string;
begin
  if (qryDet.State in ([dsInsert,dsEdit])) then
  begin
    Numero := dbgrdDet.SelectedIndex;
    if (Numero > 0) then
    begin
      Campo := QryDet.Fields[Numero].DisplayLabel;
      Valor := QryDet.Fields[Numero].asString;
      Aux := InputBox(Campo,'Informe o Valor:', Valor);
      if (Valor <> Aux) then
        QryDet.Fields[Numero].asString := UpperCase(Aux);
    end
    else
      MsgDlg('Este Campo não pode ser usado.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
  end;
end;

procedure TfrmCadTabLonga.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dbgrdDet.PopupMenu := ppmTab;
  dbgrpcmp.PopupMenu := ppmTab;
  MemHelp.Visible := true;
  if (Qry.State = dsInsert) then
  begin
    vInclui := true;
    AplicaAlteracoes([TDBDataSet(ds.DataSet)]);
    Qry.Edit;
  end;
end;

procedure TfrmCadTabLonga.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  dbgrdDet.PopupMenu := ppmTab;
  dbgrpcmp.PopupMenu := ppmTab;
  MemHelp.Visible := true;
  vInclui := false;
end;

procedure TfrmCadTabLonga.bbtnConfirmarClick(Sender: TObject);
begin
  dbgrdDet.PopupMenu := nil;
  dbgrpcmp.PopupMenu := nil;
  AplicaAlteracoes([TDBDataSet(ds.DataSet)]);
  AplicaAlteracoes([TDBDataSet(dsCmp.DataSet)]);
  AplicaAlteracoes([TDBDataSet(dsDet.DataSet)]);
  MemHelp.Visible := false;
  inherited;
  if not(vInclui) then
    vInclui := false;
end;

procedure TfrmCadTabLonga.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dbgrdDet.PopupMenu := nil;
  dbgrpcmp.PopupMenu := nil;
  MemHelp.Visible := false;
  if (vInclui) then
  begin
    AplicaAlteracoes([TDBDataSet(ds.DataSet)]);
    Qry.Delete;
    AplicaAlteracoes([TDBDataSet(ds.DataSet)]);
    Sel(true, -8940);
  end;
  vInclui := false;
end;

procedure TfrmCadTabLonga.sbtnCopiarClick(Sender: TObject);
var
  vSql: string;
  c: byte;
  vNew: LongInt;
begin
  if (MsgDlg('Deseja copiar tabela?', 'Copia', mtConfirmation, [mbYes,mbNo],0) = mrNo) then
  begin
    SbtnCopiar.Down := false;
    Exit;
  end;

  qryDet.DisableControls;

  frmAguarde.Mostra('Verificando SEQUENCE...');
  frmAguarde.Refresh;

  vNew := LeUltRegistro(nil, 'LONGTABGENER');
  while (Qry.Locate('IDTABELA', IntToStr(vNew), [])) do
    vNew := LeUltRegistro(nil, 'LONGTABGENER');

  frmAguarde.Mostra('Copiando Tabela... (1)');
  frmAguarde.Refresh;

  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  frmAguarde.Max := QryCmp.RecordCount + qryDet.RecordCount + 1;

  QryCopia.Close;
  QryCopia.Sql.Clear;
  vSql := 'INSERT INTO LONGTABGENER (IDTABELA, DESCRICAO) '+
          'VALUES ('+IntToStr(vNew)+', '''+'Cópia '+
          qry.FieldByName('DESCRICAO').asString+''')';

  QryCopia.Sql.Add(vSql);
  QryCopia.ExecSql;

  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Refresh;
  frmAguarde.Mostra('Copiando Tabela... (2)');
  frmAguarde.Refresh;

  QryCmp.First;
  while not(QryCmp.EOF) do
  begin
    QryCopia.Close;
    QryCopia.Sql.Clear;
    vSql := 'INSERT INTO LONGCMPTABGENER (IDTABELA, IDCAMPO, DESCRICAO) '+
            'VALUES ('+IntToStr(vNew)+', '+QryCmp.FieldByName('IDCAMPO').asString+', '''+
            QryCmp.FieldByName('DESCRICAO').asString+''')';
    QryCopia.Sql.Add(vSql);
    QryCopia.ExecSql;

    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Refresh;
    QryCmp.Next;
  end;

  frmAguarde.Mostra('Copiando Tabela... (3)');
  frmAguarde.Refresh;

  while not(QryDet.EOF) do
  begin
    QryCopia.Close;
    QryCopia.Sql.Clear;
    vSql := 'INSERT INTO LONGVALTABGENER '+
            '(IDTABELA, NUMLINHA, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12,'+
            'C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26,'+
            'C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39, C40,'+
            'C41, C42, C43, C44, C45, C46, C47, C48, C49, C50, C51, C52, C53, C54,'+
            'C55, C56, C57, C58, C59, C60, C61, C62, C63, C64, C65, C66, C67, C68,'+
            'C69, C70, C71, C72, C73, C74, C75, C76, C77, C78, C79, C80, C81, C82,'+
            'C83, C84, C85, C86, C87, C88, C89, C90, C91, C92, C93, C94, C95, C96,'+
            'C97, C98, C99, C100) VALUES '+
            '('+IntToStr(vNew)+', '+QryDet.FieldByName('NUMLINHA').asString;

    for c:=1 to 99 do
      vSQL := vSQL +', '+ QuotedStr(QryDet.FieldByName('C'+IntToStr(c)).asString);
    vSQL := vSQL +')';

    QryCopia.Sql.Add(vSql);
    QryCopia.ExecSql;

    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Refresh;
    QryDet.Next;
  end;
  qryDet.EnableControls;
  frmAguarde.Apaga;
  SbtnCopiar.Down := false;
end;

procedure TfrmCadTabLonga.bbtnExportarClick(Sender: TObject);
var
  Aux: TStringList;
  vLin: string;
  c: byte;
  Total, wAcerto: LongInt;
begin
  SaveDialog.FileName := dedNome.Text+'.txt';
  SaveDialog.Execute;

  QryDet.DisableControls;

  frmAguarde.Mostra('Verificando dados...');
  frmAguarde.Refresh;
  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  frmAguarde.Max := QryDet.RecordCount;
  frmAguarde.Refresh;

  frmAguarde.Mostra('Selecionando dados...');
  frmAguarde.Refresh;

  Aux := TStringList.Create;
  Total := dbgrdDet.FieldCount;
  QryDet.First;

  vLin := '';
  for c:=2 to 101 do
  begin
    if (QryDet.Fields[c].Visible) then
    begin
      wAcerto := 20 - Length(QryDet.Fields[c].DisplayLabel);
      vLin := vLin + Trim(QryDet.Fields[c].DisplayLabel) +' '+ Replicate(' ',wAcerto);
    end;
  end;
  Aux.Add(vLin);

  while not(QryDet.EOF) do
  begin
    vLin := '';
    for c:=0 to Total-1 do
    begin
      try
        if (dbgrdDet.Fields[c].asString <> '') then
        begin
          wAcerto := 20 - Length(dbgrdDet.Fields[c].asString);
          vLin := vLin + Trim(dbgrdDet.Fields[c].asString)+' '+ Replicate(' ',wAcerto);
        end;
      except
        raise;
      end;
    end;
    Aux.Add(vLin);
    QryDet.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
  end;
  QryDet.First;

  frmAguarde.Mostra('Salvando Arquivo ' +SaveDialog.FileName+ '...');
  frmAguarde.Refresh;

  Aux.SaveToFile(SaveDialog.FileName);
  FreeAndNil(Aux);
  frmAguarde.Apaga;

  QryDet.EnableControls;
end;

procedure TfrmCadTabLonga.sbtnApagarClick(Sender: TObject);
begin
  if (MsgDlg('Deseja excluir tabela?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
  begin
    frmAguarde.Mostra('Excluindo dados...');
    frmAguarde.Refresh;
    frmAguarde.Pos := 0;
    frmAguarde.Max := 3;
    frmAguarde.Min := 0;

    StartTransacao;
    with QryCopia do
    begin
      Close;
      Sql.Clear;
      Sql.Add('DELETE FROM LONGCMPTABGENER WHERE IDTABELA = '+IntToStr(vId));;
      try
        ExecSql;
      except
        frmAguarde.Apaga;
        RollBackTransacao;
        MsgDlg('Campos da Tabela não foram excluídos.', 'Erro', mtError, [mbOk,mbHelp], 0);
        sbtnApagar.Down := false;
        exit;
      end;
      frmAguarde.Pos := frmAguarde.Pos + 1;

      Close;
      Sql.Clear;
      Sql.Add('DELETE FROM LONGVALTABGENER WHERE IDTABELA = '+IntToStr(vId));;
      try
        ExecSql;
      except
        frmAguarde.Apaga;
        RollBackTransacao;
        MsgDlg('Detalhes da Tabela não foram excluídos.', 'Erro', mtError, [mbOk,mbHelp], 0);
        sbtnApagar.Down := false;
        exit;
      end;
      frmAguarde.Pos := frmAguarde.Pos + 1;

      Close;
      Sql.Clear;
      Sql.Add('DELETE FROM LONGTABGENER WHERE IDTABELA = '+IntToStr(vId));;
      try
        ExecSql;
      except
        frmAguarde.Apaga;
        RollBackTransacao;
        MsgDlg('Tabela não foi excluída.', 'Erro', mtError, [mbOk,mbHelp], 0);
        sbtnApagar.Down := false;
        exit;
      end;
      frmAguarde.Pos := frmAguarde.Pos + 1;
    end;
    CommitTransacao;
  end;

  frmAguarde.Apaga;
  sbtnApagar.Down := false;
  Sel(true, vId);
end;

procedure TfrmCadTabLonga.bbtnOkDetClick(Sender: TObject);
begin
  AplicaAlteracoes([TDBDataSet(ds.DataSet)]);
  AplicaAlteracoes([TDBDataSet(dsCmp.DataSet)]);
  AplicaAlteracoes([TDBDataSet(dsDet.DataSet)]);
  Qry.Edit;
  inherited;
  bbtnCancelarDet.Click;
  sbtnInsDet.Click;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadTabLonga.Sel(SelPrincipal: boolean; IdTabela: double);
var
  c: LongInt;
begin
  frmAguarde.Mostra('Abrindo Tabelas ...');
  frmAguarde.Refresh;

  if (SelPrincipal) then
  begin
    qry.Close;
    qry.ParamByName('IDTABELA').asFloat := IdTabela;
    qry.Open;
  end;

  QryCmp.Close;
  QryCmp.ParamByName('IDTABELA').asFloat := IdTabela;
  QryCmp.Open;

  QryDet.Close;
  QryDet.ParamByName('IDTABELA').asFloat := IdTabela;
  QryDet.Open;

  for c:=0 to 101 do
    QryDet.Fields[c].Visible := false;

  QryCmp.First;
  c := 0;
  while not(QryCmp.EOF) do
  begin
    if (QryCmp.FieldByName('IDCAMPO').asInteger > 0) then
    begin
      QryDet.Fields[QryCmp.FieldByName('IDCAMPO').asInteger + 1].Visible := true;
      QryDet.Fields[QryCmp.FieldByName('IDCAMPO').asInteger + 1].DisplayLabel :=
        QryCmp.FieldByName('DESCRICAO').asString;
      Inc(c);
    end;
    QryCmp.Next;
  end;
  Spin.Value := c;

  frmAguarde.Apaga;
end;

end.
