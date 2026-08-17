//******************************************************************************
// Alterações:
//------------------------------------------------------------------------------
// Alexandre Ramos / Pendencia 21373 - 07/02/2006
// Atualizar novos campos da tabela TABGENER
//------------------------------------------------------------------------------
unit fCadTabelaGenerica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  TB97Tlbr, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, DBGrids, wwdblook, DBCtrls,
  CmEventosCadastro, ImgList, {DBCtrlt,} TREdit,
  Menus, Machklb, uSistema;

type
  TfrmcadTabelaGenerica = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    dedCodigo: TwwDBEdit;
    dedDescricao: TwwDBEdit;
    Label2: TLabel;
    updDetalhe: TUpdateSQL;
    QryDetalhe: TwwQuery;
    QryCampos: TwwQuery;
    updCampos: TUpdateSQL;
    dsCampos: TwwDataSource;
    tbsCampos: TTabSheet;
    dbgrdCampos: TwwDBGrid;
    pnlControlesCampos: TPanel;
    Label3: TLabel;
    wwDBEdit1: TwwDBEdit;
    Label4: TLabel;
    wwDBEdit2: TwwDBEdit;
    qryTpDado: TwwQuery;
    dsTpDado: TwwDataSource;
    dblkcmbTipo: TwwDBLookupCombo;
    Label5: TLabel;
    Label6: TLabel;
    DBText1: TDBText;
    Label7: TLabel;
    DBText2: TDBText;
    Label8: TLabel;
    dsDetalhe: TwwDataSource;
    dedValor: TwwDBEdit;
    Label9: TLabel;
    DBText3: TDBText;
    QryLinhas: TwwQuery;
    dsLinhas: TwwDataSource;
    nbk: TNotebook;
    dbgrTabela: TDBGrid;
    Toolbar972: TToolbar97;
    SbtnAtualizar: TSpeedButton;
    updLinha: TUpdateSQL;
    QryFormulas: TwwQuery;
    QryRegras: TwwQuery;
    dsRegras: TwwDataSource;
    dsFormulas: TwwDataSource;
    tbsFormulas: TTabSheet;
    tbsRegras: TTabSheet;
    dbrgFormulas: TwwDBGrid;
    dbgrRegras: TwwDBGrid;
    qryAux: TwwQuery;
    dsAux: TwwDataSource;
    procedure dsDetalheDataChange(Sender: TObject; Field: TField);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dedCodigoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure SbtnAtualizarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    Procedure Procurar;
    procedure tbcDetalheChange(Sender: TObject);
    procedure QryLinhasAfterInsert(DataSet: TDataSet);
    procedure dsLinhasDataChange(Sender: TObject; Field: TField);
    procedure QryLinhasAfterPost(DataSet: TDataSet);
    function Espaco( Valor : String; Tamanho : LongInt) : String;
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);

    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure IncluiAutorizacao(sCodTabela : String);

  private
    { Private declarations }
    procedure Sel( n : String );
  public
    { Public declarations }
  end;

var
  frmcadTabelaGenerica: TfrmcadTabelaGenerica;
  vNum, vUlt, vQtdCampos : LongInt;
  vOk, vInsLin : Boolean;

implementation

uses uMensErro, uDataBase, fAguarde;

{$R *.DFM}

procedure TfrmCadTabelaGenerica.Sel( n : String );
begin
  Refresh;
  //If n = '' Then Exit;
  If n = '' Then n := '-1';

  with Qry do begin
    Close;
    Params[0].Value := n;
    Open;
  end;

  qryTpDado.Close;
  qryTpDado.Open;

  with QryCampos do begin
    Close;
    Params[0].Value := n;
    Open;
  end;

  with QryDetalhe do begin
    Close;
    Params[0].Value := n;
    Open;
  end;

  with QryRegras do begin
    Close;
    Params[0].Value := '%'+n+'%';
    Open;
  end;

  with QryFormulas do begin
    Close;
    Params[0].Value := '%'+n+'%';
    Open;
  end;
  SbtnAtualizar.Click;
end;

procedure TfrmCadTabelaGenerica.CmeCadastroFind(Sender: TObject);
begin
     Inherited;
     Refresh;
     If MontaSelect.RetornouValor Then
        Sel(MontaSelect.ValoresChave[0]);
end;

procedure TfrmCadTabelaGenerica.CmeCadastroConfirma(Sender: TObject);
Var
    bInserindo : Boolean;
begin
     frmAguarde.Mostra('Confirmando Operação ...');
     frmAguarde.Refresh;

     bInserindo := False;
     If Qry.State In [dsinsert] Then bInserindo := True;

     If Qry.State In [dsinsert, dsEdit] Then Begin
       Qry.FieldByName('IDMODULO').AsInteger := Sistema.IdModulo;
       Qry.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
     End;

     Inherited;

     { Caso esteja incluindo, gera autorizações }
     If bInserindo = True Then Begin
       IncluiAutorizacao( dedCodigo.Text );
     End;

     { Grava Log da operação - 19/12/2002 }
     If Not Sistema.GravaLogOperacoes('Manutenção do Cadastro de Regra de Negócio') Then
       Raise Exception.Create('Não Consegui Gravar o Log');

     try
        AplicaAlteracoes([TDBDataSet(dsCampos.DataSet)]);
        AplicaAlteracoes([TDBDataSet(dsDetalhe.DataSet)]);
     except
           try
              AplicaAlteracoes([TDBDataSet(dsDetalhe.DataSet)]);
              AplicaAlteracoes([TDBDataSet(dsCampos.DataSet)]);
           except
                 MsgDlg( 'Ocorreu algum erro na gravação final desta tabela.', 'Erro', mtError, [mbOk],0);
           end;
     end;
     QryDetalhe.Close;
     QryDetalhe.Open;
     frmAguarde.Apaga;
end;

procedure TfrmcadTabelaGenerica.dsDetalheDataChange(Sender: TObject;
  Field: TField);
var
   Tipo : LongInt;
begin
  inherited;
  if QryDetalhe.FieldbyName('CODCAMPO').AsString <> '' then
     if QryCampos.Locate('CODCAMPO', QryDetalhe.FieldbyName('CODCAMPO').AsString,[]) then begin
        if QryCampos.FieldbyName('IDTIPODADO').AsString = '' then
           Tipo := 0
        else
           Tipo := QryCampos.FieldbyName('IDTIPODADO').AsInteger;
        QryTpDado.Locate('IDTIPODADO', Tipo,[]);
     end;
end;

procedure TfrmcadTabelaGenerica.sbtnInsDetClick(Sender: TObject);
begin
  vInsLin := False;
  if pgctrlDetalhe.ActivePage = tbsDet then begin
     if QryLinhas.IsEmpty then
        nbk.Visible := False
     else begin
          QryLinhas.Append;
          SbtnInsDet.Down := False;
          Exit;
     end;
     SbtnInsDet.Down := False;
     vInsLin := True;
     if QryCampos.IsEmpty then begin
        MsgDlg( 'É necessário incluir os campos primeiro.', 'Erro', mtError, [mbOk],0);
        SbtnInsDet.Down := False;
        Exit;
     end;
     QryDetalhe.Last;
     vUlt := QryDetalhe.FieldbyName('NUMLINHA').AsInteger + 1;

     QryCampos.First;
     while not QryCampos.Eof do begin
           QryDetalhe.Append;
           QryDetalhe.FieldbyName('CODTABELA').AsString := Qry.Fieldbyname('CODTABELA').AsString;
           QryDetalhe.FieldbyName('NUMLINHA').AsInteger := vUlt;
           QryDetalhe.FieldbyName('CODCAMPO').AsString := QryCampos.Fieldbyname('CODCAMPO').AsString;
           QryDetalhe.Post;
           QryCampos.Next;
     end;
     QryDetalhe.Locate('NUMLINHA',vUlt, []);

     dbgrdDet.SendToBack;
     tb97Detalhe.Visible := true;
     CmeDetalhe.Edit(Self);
//     ApertaBotoesDetalhe;
  end else begin
      inherited;
      QryCampos.FieldByName('CODTABELA').AsString := Qry.FieldByName('CODTABELA').AsString;
  end;
end;

procedure TfrmcadTabelaGenerica.bbtnOkDetClick(Sender: TObject);
var
   vNum : LongInt;
   vDescr : String;
begin
  if pgctrlDetalhe.ActivePage = tbsDet then begin
     if Copy(qryTpDado.FieldbyName('NOMETIPODADO').AsString,1,1) = 'D' then begin
        try
           StrtoDate(dedValor.Text);
        except
              begin
                   MsgDlg( 'Formato do Valor inválido, tem que ser Data.', 'Erro', mtError, [mbOk],0);
                   dedValor.SetFocus;
                   Exit;
              end;
        end;
     end;

     if Copy(qryTpDado.FieldbyName('NOMETIPODADO').AsString,1,1) = 'N' then begin
        try
           StrtoFloat(dedValor.Text);
        except
              begin
                   MsgDlg( 'Formato do Valor inválido, tem que ser Numérico.', 'Erro', mtError, [mbOk],0);
                   dedValor.SetFocus;
                   Exit;
              end;
        end;
     end;
     if vInsLin then begin
        QryDetalhe.Post;
        QryDetalhe.Next;
        if QryDetalhe.Eof then
           bbtnCancelarDet.Click
        else
            QryDetalhe.Edit;
     end else
         inherited;
     //nbk.Visible := True;
     //SbtnAtualizar.Click;
  end else begin
      QryCampos.FieldbyName('CODTABELA').AsString := Qry.FieldbyName('CODTABELA').AsString;
      vDescr := QryCampos.FieldbyName('CODCAMPO').AsString;
      inherited;
      if QryCampos.State = dsInsert then begin
         frmAguarde.Mostra('Incluindo campo no Detalhe');
         frmAguarde.Refresh;
         frmAguarde.Pos := 0;
         frmAguarde.Min := 0;
         frmAguarde.Max := QryDetalhe.RecordCount;

         QryDetalhe.First;
         vNum := 0;
         while not QryDetalhe.Eof do begin
               if vNum <> QryDetalhe.FieldbyName('NUMLINHA').AsInteger then begin
                  vNum := QryDetalhe.FieldbyName('NUMLINHA').AsInteger;
                  QryDetalhe.Insert;
                  QryDetalhe.FieldbyName('CODTABELA').AsString := Qry.Fieldbyname('CODTABELA').AsString;
                  QryDetalhe.FieldbyName('NUMLINHA').AsInteger := vNum;
                  QryDetalhe.FieldbyName('CODCAMPO').AsString := vDescr;
                  QryDetalhe.FieldbyName('VALOR').AsString := '';

                  try
                     QryDetalhe.Post;
                  except
                        QryDetalhe.Cancel;
                  end;
               end;
               QryDetalhe.Next;
               frmAguarde.Pos := frmAguarde.Pos + 1;
         end;
         frmAguarde.Apaga;
         QryCampos.Insert;
      end;
  end;
end;

procedure TfrmcadTabelaGenerica.sbtnExcluiDetClick(Sender: TObject);
var
   vNum : LongInt;
   vCampo : String;
begin
  if MsgDlg('Deseja excluir este registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo then
     Exit;
  if pgctrlDetalhe.ActivePage = tbsDet then begin //Linhas
     Procurar;
     if vOk then begin
        frmAguarde.Mostra('Apagando conjunto de dados ...');
        frmAguarde.Refresh;
        vNum := QryDetalhe.Fieldbyname('NUMLINHA').AsInteger;
        while QryDetalhe.Locate('NUMLINHA', vNum, []) do
              QryDetalhe.Delete;
        QryLinhas.Delete;
     end else
         QryLinhas.Delete;
     SbtnAtualizar.Click;
  end else begin //Campos
      frmAguarde.Mostra('Apagando Campos ...');
      frmAguarde.Refresh;
      vCampo := QryCampos.Fieldbyname('CODCAMPO').AsString;
      while QryDetalhe.Locate('CODCAMPO', vCampo, []) do
            QryDetalhe.Delete;
      inherited;
      SbtnAtualizar.Click;
  end;
  frmAguarde.Apaga;
  sbtnExcluiDet.Down := False;
end;

procedure TfrmcadTabelaGenerica.sbtnApagarClick(Sender: TObject);
begin
  if not QryRegras.IsEmpty then begin
    MsgDlg( 'Existem Regras utilizando esta tabela genérica.', 'Erro', mtError, [mbOk],0);
    SbtnApagar.Down := False;
    Exit;
  end;

  if not QryFormulas.IsEmpty then begin
    MsgDlg( 'Existem Formulas utilizando esta tabela genérica.', 'Erro', mtError, [mbOk],0);
    SbtnApagar.Down := False;
    Exit;
  end;

  if (MsgDlg('Deseja realmente excluir este registro ?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) then begin
    SbtnApagar.Down := False;
    Exit;
  end;

  frmAguarde.Mostra('Apagando Dados');
  frmAguarde.Refresh;

  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  frmAguarde.Max := QryDetalhe.RecordCount + QryCampos.RecordCount + 1;

  QryDetalhe.First;
  while not QryDetalhe.Eof do begin
       QryDetalhe.Delete;
       frmAguarde.Pos := frmAguarde.Pos + 1;
  end;

  QryCampos.First;
  while not QryCampos.Eof do begin
       QryCampos.Delete;
       frmAguarde.Pos := frmAguarde.Pos + 1;
  end;
  Qry.Delete;

  try
    AplicaAlteracoes([TDBDataSet(dsDetalhe.DataSet)]);
  except
       raise;
  end;
  try
    AplicaAlteracoes([TDBDataSet(dsCampos.DataSet)]);
  except
       raise;
  end;
  try
    AplicaAlteracoes([TDBDataSet(ds.DataSet)]);
  except
       raise;
  end;
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Apaga;
  sbtnApagar.Down := False;
end;

procedure TfrmcadTabelaGenerica.CmeCadastroInsert(Sender: TObject);
begin
     inherited;
     dedCodigo.SetFocus;
end;

procedure TfrmcadTabelaGenerica.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dedCodigo.SetFocus;
end;


procedure TfrmcadTabelaGenerica.dedCodigoExit(Sender: TObject);
begin
  inherited;
  if Qry.State = dsInsert then begin
     qryTpDado.Close;
     qryTpDado.Open;
  end;

end;

procedure TfrmcadTabelaGenerica.FormShow(Sender: TObject);
begin
  inherited;
  Sel('');
end;

procedure TfrmcadTabelaGenerica.sbtnInserirClick(Sender: TObject);
begin
  if not Qry.IsEmpty then Sel('');
  inherited;
end;

procedure TfrmcadTabelaGenerica.SbtnAtualizarClick(Sender: TObject);
var
   i, vNum : LongInt;
   vDado, vValor, vSql, vLin : String;
begin
  inherited;
  SbtnAtualizar.Down := False;
  vNum := 0;
  vSql := '';
  frmAguarde.Mostra('Selecionando dados ...');
  frmAguarde.Refresh;
  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;

  try
     frmAguarde.Max := QryDetalhe.RecordCount div QryCampos.RecordCount;
  except
        frmAguarde.Max := 0;
  end;


  QryDetalhe.DisableControls;
  QryDetalhe.First;
  vSql := '';
  while not QryDetalhe.Eof do begin
        if vNum <> QryDetalhe.FieldbyName('NUMLINHA').AsInteger then begin
           vNum := QryDetalhe.FieldbyName('NUMLINHA').AsInteger;
           QryCampos.First;
           vLin := 'SELECT '+InttoStr(vNum)+' AS NUMLINHA ';
           While not QryCampos.EOF do begin
                 vDado := QryCampos.FieldbyName('CODCAMPO').AsString;
                 QryDetalhe.Locate('NUMLINHA;CODCAMPO',varArrayOf([InttoStr(vNum),vDado]),[]);
                 vValor := QryDetalhe.FieldbyName('VALOR').AsString;
                 vValor := Espaco(vValor, QryDetalhe.FieldbyName('VALOR').Size);
                 if vValor = '' then
                    vValor := ' ';
                 vLin := vLin +', '''+vValor+''' AS "'+vDado+'"';
                 QryCampos.Next;
           end;
           vSql := vSql + vLin +' FROM DUAL UNION ';
        end;
        QryDetalhe.Next;
        frmAguarde.Pos := frmAguarde.Pos + 1;
  end;
  vSql := Copy(vSql,1,Length(vSql)-7);

  If vSql <> '' then begin//Abre a Qry
     with QryLinhas do begin
          Close;
          Sql.Clear;
          Sql.Add(vSql);
          Open;
     end;
     for i := 0 to dbgrTabela.FieldCount - 1 do begin
         if i = 0 then dbgrTabela.Fields[i].DisplayWidth := 5
            else dbgrTabela.Fields[i].DisplayWidth := 20;
     end;
  end else begin //Fecha a Qry .. se estiver aberta.
      QryLinhas.Close;
  end;
  QryDetalhe.EnableControls;
  frmAguarde.Apaga;
end;

procedure TfrmcadTabelaGenerica.sbtnAltDetClick(Sender: TObject);
begin
     Procurar;
     if pgctrlDetalhe.ActivePage = tbsCampos then begin
        if not vOk then begin
           MsgDlg( 'Campo não disponivel para tal operação.', 'Erro', mtError, [mbOk],0);
           SbtnAltDet.Down := False;
           Exit;
        end;
        inherited;
     end else
         QryLinhas.Edit;
     SbtnAltDet.Down := False;
end;

procedure TfrmcadTabelaGenerica.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsDet then begin
     SbtnAtualizar.Click;
     nbk.Visible := True;
  end else begin
      nbk.Visible := False;
  end;
end;

Procedure TfrmCadTabelaGenerica.Procurar;
var
   vNum : LongInt;
   vCmp : String;
begin
  vNum := QryLinhas.FieldbyName('NUMLINHA').AsInteger;
  vCmp := dbgrTabela.SelectedField.DisplayName;
  vOk := False;
  if QryDetalhe.Locate('NUMLINHA;CODCAMPO',varArrayOf([InttoStr(vNum),vCmp]),[]) then
     if QryCampos.Locate('CODCAMPO', QryDetalhe.FieldbyName('CODCAMPO').AsString,[]) then
        if QryTpDado.Locate('IDTIPODADO', QryCampos.FieldbyName('IDTIPODADO').AsString,[]) then
           vOk := True;
end;

procedure TfrmcadTabelaGenerica.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsDet then nbk.Visible := True
     else nbk.Visible := False;

  tb97BotoesDetalhe.Visible := True;
  Toolbar972.Visible := True;
  if (pgctrlDetalhe.ActivePage= tbsFormulas) or (pgctrlDetalhe.ActivePage= tbsRegras) then begin
     tb97BotoesDetalhe.Visible := False;
     Toolbar972.Visible := False;
  end;
end;

procedure TfrmcadTabelaGenerica.QryLinhasAfterInsert(DataSet: TDataSet);
begin
  inherited;
  QryLinhas.FieldbyName('NUMLINHA').AsInteger := vNum;
end;

procedure TfrmcadTabelaGenerica.dsLinhasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if QryLinhas.State = dsBrowse then begin
     vNum := QryLinhas.FieldbyName('NUMLINHA').AsInteger + 1;
  end else begin
      if QryLinhas.IsEmpty then
         vNum := 1;
  end;
end;

procedure TfrmcadTabelaGenerica.QryLinhasAfterPost(DataSet: TDataSet);
var
   i : LongInt;
begin
  inherited;
  frmAguarde.Mostra('Gravando Dados ...');
  frmAguarde.Refresh;
  if QryDetalhe.Locate('NUMLINHA',QryLinhas.FieldbyName('NUMLINHA').AsInteger,[]) then begin
     while QryDetalhe.Locate('NUMLINHA',QryLinhas.FieldbyName('NUMLINHA').AsInteger,[]) do
           QryDetalhe.Delete;
     for i := 1 to QryLinhas.FieldCount - 1  do begin
         QryDetalhe.Insert;
         QryDetalhe.FieldbyName('CODTABELA').AsString := Qry.Fieldbyname('CODTABELA').AsString;
         QryDetalhe.FieldbyName('NUMLINHA').AsInteger := QryLinhas.Fields[0].AsInteger;
         QryDetalhe.FieldbyName('CODCAMPO').AsString := QryLinhas.Fields[i].DisplayName;
         QryDetalhe.FieldbyName('VALOR').AsString := QryLinhas.Fields[i].AsString;
         QryDetalhe.Post;
     end;
  end else begin
      for i := 1 to QryLinhas.FieldCount - 1  do begin
          QryDetalhe.Append;
          QryDetalhe.FieldbyName('CODTABELA').AsString := Qry.Fieldbyname('CODTABELA').AsString;
          QryDetalhe.FieldbyName('NUMLINHA').AsInteger := QryLinhas.Fields[0].AsInteger;
          QryDetalhe.FieldbyName('CODCAMPO').AsString := QryLinhas.Fields[i].DisplayName;
          QryDetalhe.FieldbyName('VALOR').AsString := QryLinhas.Fields[i].AsString;
          QryDetalhe.Post;
      end;
  end;
  frmAguarde.Apaga;
end;

function TfrmcadTabelaGenerica.Espaco( Valor : String; Tamanho : LongInt) : String;
var
   i, vTam : LongInt;
   vAux : String;
begin
     vTam := Length(Valor);
     if vTam > Tamanho then begin
        vTam := Tamanho;
        Result := Copy(Valor,1,vTam);
     end else begin
         Tamanho := Tamanho - vTam;
         vAux := '';
         for i := 1 to Tamanho do
             vAux := vAux + ' ';
         Result := Valor + vAux;
     end;
end;

procedure TfrmcadTabelaGenerica.sbtnAlterarClick(Sender: TObject);
begin
  if (Qry.FieldByName('FLGALTERAR').AsInteger = 0) then begin
     MsgDlg('O usuário ('+Sistema.NomeUsuario+') não está autorizado a Alterar esta Tabela Genérica .',
            'Erro',mtError,[mbOk,mbHelp],0);
     sbtnAlterar.Down := False;
     Exit;
  end;
  inherited;
  dbgrTabela.ReadOnly := False;
end;

procedure TfrmcadTabelaGenerica.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dbgrTabela.ReadOnly := True;
end;

procedure TfrmcadTabelaGenerica.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dbgrTabela.ReadOnly := True;
end;

procedure TfrmcadTabelaGenerica.FormCreate(Sender: TObject);
begin
  inherited;
  { Preenche o ususario do MontaSelect de pesquisa de Regras }
  MontaSelect.Filtro.Add ('TABGENERUSUARIO.IDUSUARIO = '+
                          IntToStr(Sistema.IdUsuario));
end;

procedure TfrmcadTabelaGenerica.CmeCadastroDelete(Sender: TObject);
begin
  if (Qry.FieldByName('FLGEXCLUIR').AsInteger = 0) then begin
     MsgDlg('O usuário ('+Sistema.NomeUsuario+') não está autorizado a Excluit esta Tabela Genérica .',
            'Erro',mtError,[mbOk,mbHelp],0);
     sbtnApagar.Down := False;
     Exit;
  end;
  inherited;


end;

procedure TfrmcadTabelaGenerica.IncluiAutorizacao(sCodTabela : String);
Var
  sSQL : String;
begin
  sSQL := 'INSERT INTO TABGENERUSUARIO '+
          ' (CODTABELA, IDUSUARIO, FLGALTERAR, FLGEXCLUIR, FLGPROCURAR) VALUES '+
          ' ('+QuotedStr(sCodTabela)+', '+
          IntToStr(Sistema.IdUsuario) +', '+
          '1, 1, 1) ';
  If Not ExecutarQuery(QryAux,sSQL) Then Begin
     MsgDlg('Erro ao incluir autorização.','Erro',mterror,[mbOk],0);
     Exit;
  End;
end;


end.
