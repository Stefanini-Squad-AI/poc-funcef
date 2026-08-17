unit FCadTabClassif;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, ComCtrls,
  TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid, DBGrids, wwdblook,
  TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CmEventosCadastro,
  ImgList;

type
  TFrmCadTabClassif = class(TfrmCadastroCS)
    QryAux: TwwQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    BtInserir: TSpeedButton;
    BtAlterar: TSpeedButton;
    BtExcluir: TSpeedButton;
    TvDetalhe: TTreeView;
    Panel1: TPanel;
    DsAux: TwwDataSource;
    Label13: TLabel;
    qryCODTABCLASSINV: TStringField;
    qryDESCTABCLASSINV: TStringField;
    DsDetalhe: TwwDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    QryDetalhe: TwwQuery;
    ImageList1: TImageList;
    Maskara: TMaskEdit;
    procedure FormShow(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure MontaArvore;
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure BtInserirClick(Sender: TObject);
    procedure TvDetalheChange(Sender: TObject; Node: TTreeNode);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure LkcDocumentosNotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    Function  AcertaNiveis(Texto:String):String;
    Function  CalculaProxClasssif(NodeSelecionado:TTreeNode):String;
    procedure QryDetalheAfterScroll(DataSet: TDataSet);
    procedure TvDetalheCollapsed(Sender: TObject; Node: TTreeNode);
    procedure TvDetalheExpanded(Sender: TObject; Node: TTreeNode);
    procedure TvDetalheKeyPress(Sender: TObject; var Key: Char);
    procedure TvDetalheDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
// Tipo Ponteiro
  TpPoint = ^TpRecord;
// Tipo Record
  TpRecord = Record
    wCodClassInvest :String;
  End;

var
  FrmCadTabClassif: TFrmCadTabClassif; wNode: String; wIndex: Integer;
  wNivel: Integer; wIndice : Array[0..100] Of Integer;wOrdAnt:Integer;


implementation

uses DBaseDados,UDataBase,UMensErro, UBibliotecaInvest;

Var
  wTextoNivel :String;
  wMascara    :String;

{$R *.DFM}

procedure TFrmCadTabClassif.FormShow(Sender: TObject);
begin
  inherited;

  Panel1.Visible   :=False;
  Label13.Visible  :=False;
  TvDetalhe.Visible:=True;

  Qry.Open;
  QryDetalhe.Open;
// Acerta Mascara
//  Busca Maskara nos Parametros
  If FazQuery(QryAux,'SELECT MASCCLASSIFINV FROM PARAMINVEST') Then Begin
    wMascara := QryAux.FieldByName('MASCCLASSIFINV').AsString+'._;0;_';
  End Else Begin
    wMascara := '99.99.99.99'+'._;0;_';
  End;
// Caso Mascara não Cadastrada
  If QryAux.FieldByName('MASCCLASSIFINV').AsString  = '' Then Begin
    ShowMessage('Atenção, Parâmetro, Máscara de Classificação não cadastrado ...');
    FrmCadTabClassif.Close;
    wMascara := '99.99.99.99'+'._;0;_';
    ExecutarQuery(QryAux,'UPDATE PARAMINVEST SET MASCCLASSIFINV = ''99.99.99''');
  End;

  MaskEdit1.EditMask := wMascara;
  Maskara.EditMask   := wMascara;

  MontaArvore;
// Inabilita Botoes
  BbtnConfirmar.Enabled:=False;
  BbtnCancelar.Enabled :=False;
  SbtnAlterar.Enabled  :=True;
  SbtnApagar.Enabled   :=True;
End;

Procedure TFrmCadTabClassif.MontaArvore;
Var
  sMascTpReserva : String;
  wPointId:TpPoint;
Begin
  TVDetalhe.Items.Clear;
// Inclui Tabelas no TreeView
// Carrega o Ponteiro
  New(wPointId);
  wPointId^.wCodClassInvest :='0';
  TVDetalhe.Items.AddObject(Nil, DbEdit2.Text,wPointId);
  TVDetalhe.Items[0].ImageIndex   :=1;       // Icones
  TVDetalhe.Items[0].SelectedIndex:=1;
// Acerta Mascara de Niveis
  sMascTpReserva := wMascara;
  wTextoNivel    := AcertaNiveis(sMascTpReserva);
// Variacao de Nodes por causa dos Documentos
  QryDetalhe.First;
  While Not QryDetalhe.Eof Do Begin
// Caso Não seja do Primeiro Nivel
// Primeiro Nivel
    If Length(Trim(QryDetalhe.FieldByName('CODCLASSINVEST').AsString)) >
      (Pos('1',wTextoNivel)-1) Then Begin
      QryDetalhe.Next;
      Continue;
    End;
// Carrega o Ponteiro
    New(wPointId);
    wPointId^.wCodClassInvest :=QryDetalhe.FieldByName('CODCLASSINVEST').AsString;
// Inclui Node no TreeView alimentando propriedade DATA como Ponteiro
    TvDetalhe.Items.AddChildObject(TVDetalhe.Items[0],
      QryDetalhe.FieldByName('CODCLASSINVEST').AsString+' - '+
      QryDetalhe.FieldByName('DESCCLASSINVEST').AsString,wPointId);
// Inclui Icone no Ramo
    If QryDetalhe.FieldByName('CLASSIFANALIT').AsString = 'S'Then Begin
      TVDetalhe.Items[0].ImageIndex   :=0;
      TVDetalhe.Items[0].SelectedIndex:=1;
    End Else Begin
      TVDetalhe.Items[0].GetLastChild.ImageIndex   :=2;
      TVDetalhe.Items[0].GetLastChild.SelectedIndex:=2;
    End;

    QryDetalhe.Next;
  End;
  TVDetalhe.FullExpand;
  TvDetalhe.TopItem:=TvDetalhe.Items[0];
End;

procedure TFrmCadTabClassif.CmeCadastroConfirma(Sender: TObject);
Begin
  ds.DataSet.CheckBrowseMode;
  dtmBaseDados.dbBaseDados.ApplyUpdates([qry]);
end;

procedure TFrmCadTabClassif.sbtnInserirClick(Sender: TObject);
begin
  Inherited;
// Inabilita Botoes
  BtInserir.Enabled:=False;
  BtExcluir.Enabled:=False;
  BtAlterar.Enabled:=False;
// Limpa TreeView
  TvDetalhe.Items.Clear;
end;

procedure TFrmCadTabClassif.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha Querys
  Qry.Close;
  QryDetalhe.Close;
end;

procedure TFrmCadTabClassif.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
// Abre Query com o SubTipo
  If Not Qry.IsEmpty Then Begin
    FazQuery(QryDetalhe,'SELECT CODTABCLASSINV, CODCLASSINVEST, DESCCLASSINVEST, CLASSIFANALIT'+
                        '   FROM CLASSIFINVEST '+
                        '   WHERE CODTABCLASSINV = '''+Qry.FieldByName('CODTABCLASSINV').AsString+''''+
                        '   ORDER BY CODCLASSINVEST ');
    MontaArvore;
  End;
end;

procedure TFrmCadTabClassif.BtInserirClick(Sender: TObject);
Var
  wTamanho:Integer;
begin
// Caso Node Vazio
  If (wNode = '') Then Begin
    ShowMessage('Item não Escolhido !!!!! ');
    BtInserir.Down:=False;
    Exit;
  End;
// Pega Tamanho do Codigo a Inserir
  If TvDetalhe.Selected.HasChildren Then
    wTamanho := Length(TpPoint(TvDetalhe.Selected.Data)^.wCodClassInvest)
  Else
    wTamanho := Length(TpPoint(TvDetalhe.Selected.Data)^.wCodClassInvest);

// Testa se Estourou o Tamanho do Campo
  If (wTamanho >= QryDetalhe.Fields[1].Size) Or
     (wTamanho >= Length(TiraPonto(Copy(wMascara,1,Pos('_',wMascara)-2)))) Then Begin
    ShowMessage('Valor limite Estourado ...');
    BtInserir.Down := False;
    Exit;
  End;
// Inabilita Botoes
  BtInserir.Enabled:=False;
  BtExcluir.Enabled:=False;
  BtAlterar.Enabled:=False;
// Mostra Tela de Cadastro
  TvDetalhe.Visible:=False;
  Panel1.Visible   :=True;
// Inclui Registro
  QryDetalhe.Append;
// Calcula Código da Proxima Classificacao
  MaskEdit1.Text:=CalculaProxClasssif(TvDetalhe.Selected);
// Seta Focus
  DbEdit4.SetFocus;
End;

procedure TFrmCadTabClassif.TvDetalheChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
// Guarda Dados do Escolhido
  wNivel :=Node.Level;
  wNode  :=Node.Text;
  wIndex :=Node.AbsoluteIndex;
// Caso Nivel = 0 Desabilita Botoes
  If wNivel = 0 Then Begin
    BtExcluir.Enabled:=False;
    BtAlterar.Enabled:=False;
  End Else Begin
// habilita Botoes
    BtInserir.Enabled:=True;
    BtExcluir.Enabled:=True;
    BtAlterar.Enabled:=True;
  End;
End;

procedure TFrmCadTabClassif.bbtnCancelarDetClick(Sender: TObject);
begin
// Cancela Alteracao
  QryDetalhe.Cancel;
// Mostra Treeview
  Panel1.Visible   :=False;
  Label13.Visible  :=False;
  TvDetalhe.Visible:=True;
// habilita Botoes
  If wNivel = 0 Then Begin
    BtInserir.Enabled:=True;
  End Else Begin
    BtInserir.Enabled:=True;
    BtExcluir.Enabled:=True;
    BtAlterar.Enabled:=True;
  End;
// Sobe Botoes
  BtInserir.Down:=False;
  BtExcluir.Down:=False;
  BtAlterar.Down:=False;
// Esconde o Painel
  TvDetalhe.SetFocus;
End;

procedure TFrmCadTabClassif.bbtnOkDetClick(Sender: TObject);
Var
  wCodClassif : String;
  wPointId:TpPoint;
  wMaskaraTexto:String;
begin
// Testa parametros
  If (MaskEdit1.Text = '') Or (DbEdit4.Text = '') Or
     (DBRadioGroup1.Value = '') Then Begin
    ShowMessage('Faltam preencher campos ....');
    DbEdit4.SetFocus;
    Exit;
  End;

// Testa Se Class pode ser Sint;etica
  If (DBRadioGroup1.Value = 'A') And (TvDetalhe.Selected.HasChildren) And
     (BtAlterar.Down) Then Begin
    ShowMessage('Classificação não pode ser Analítica ....');
    DBRadioGroup1.SetFocus;
    Exit;
  End;
 wCodClassif := MaskEdit1.Text;
// Caso Inserindo,
  If BtInserir.Down = True Then Begin
    QryDetalhe.FieldByName('CODCLASSINVEST').AsString := wCodClassif;
    QryDetalhe.FieldByName('CODTABCLASSINV').AsString  :=
      Qry.FieldByName('CODTABCLASSINV').AsString;
  End;


  Try
    QryDetalhe.Post;
  Except
    bbtnCancelarDet.Click;
    Exit;
  End;

// Inclui Novo Nó Caso Inserindo
  If BtInserir.Down = True Then Begin
// Carrega o Ponteiro
    New(wPointId);
    wPointId^.wCodClassInvest :=QryDetalhe.FieldByName('CODCLASSINVEST').AsString;
// Carrega Maskara na Classificaçao
    Maskara.Text :=QryDetalhe.FieldByName('CODCLASSINVEST').AsString;
    wMaskaraTexto:=Copy(Maskara.EditText,1,Pos('_',Maskara.EditText)-2);
// Inclui Node no TreeView alimentando propriedade DATA como Ponteiro
    TvDetalhe.Items.AddChildObject(TVDetalhe.Selected,
      wMaskaraTexto+' - '+QryDetalhe.FieldByName('DESCCLASSINVEST').AsString,wPointId);
// Inclui Icone no Ramo
    If QryDetalhe.FieldByName('CLASSIFANALIT').AsString = 'S'Then Begin
      TVDetalhe.Items[wIndex].GetLastChild.ImageIndex   :=0;
      TVDetalhe.Items[wIndex].GetLastChild.SelectedIndex:=1;
    End Else Begin
      TVDetalhe.Items[wIndex].GetLastChild.ImageIndex   :=2;
      TVDetalhe.Items[wIndex].GetLastChild.SelectedIndex:=2;
    End;
// Muda Icone do Pai
    TVDetalhe.Items[wIndex].ImageIndex   :=0;
    TVDetalhe.Items[wIndex].SelectedIndex:=1;
  End Else Begin

// Carrega Maskara na Classificaçao
    Maskara.Text :=QryDetalhe.FieldByName('CODCLASSINVEST').AsString;
    wMaskaraTexto:=Copy(Maskara.EditText,1,Pos('_',Maskara.EditText)-2);
// Altera Descricao do Nó
    TVDetalhe.Selected.Text :=
      wMaskaraTexto+' - '+QryDetalhe.FieldByName('DESCCLASSINVEST').AsString;
// Inclui Icone de Acordo
    If QryDetalhe.FieldByName('CLASSIFANALIT').AsString = 'S' Then Begin
      TVDetalhe.Selected.ImageIndex   :=0;
      TVDetalhe.Selected.SelectedIndex:=1;
    End Else Begin
      TVDetalhe.Selected.ImageIndex   :=2;
      TVDetalhe.Selected.SelectedIndex:=2;
    End;
  End;

// habilita Botoes
  BtInserir.Enabled:=True;
  BtExcluir.Enabled:=True;
  BtAlterar.Enabled:=True;
// Sobe Botoes
  BtInserir.Down   :=False;
  BtExcluir.Down   :=False;
  BtAlterar.Down   :=False;
// Atualiza Dados remontando a Query
  FazQuery(QryDetalhe,'SELECT 	CODTABCLASSINV, CODCLASSINVEST, DESCCLASSINVEST, CLASSIFANALIT'+
                      '   FROM CLASSIFINVEST '+
                      '   WHERE CODTABCLASSINV = '''+Qry.FieldByName('CODTABCLASSINV').AsString+''''+
                      '   ORDER BY CODCLASSINVEST ');
  QryDetalhe.Open;
// Mostra Treeview
  Panel1.Visible   :=False;
  Label13.Visible  :=False;
  TvDetalhe.Visible:=True;
// Seta Focus
  TvDetalhe.FullExpand;
  TvDetalhe.SetFocus;
end;

procedure TFrmCadTabClassif.LkcDocumentosNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
  ShowMessage('Documento não Encontrado !!!');
  Accept:=False;
end;

procedure TFrmCadTabClassif.BtExcluirClick(Sender: TObject);
Var
  wIdNode,I,wNum,wNodeExclu:Integer;
begin
  inherited;
// Caso Node Vazio
  If (wNode = '') Or (wNivel = 0) Then Begin
    ShowMessage('Item não Escolhido !!!!! ');
    BtExcluir.Down:=False;
    Exit;
  End;
  If TvDetalhe.Selected.HasChildren = True Then Begin
    ShowMessage('Item não pode ser excluido, Possui Sub-Itens ... ');
    BtExcluir.Down:=False;
    Exit;
  End;
// Inabilita Botoes
  BtExcluir.Down:=False;
// Confirma Exclusao ou Nao
// Se Confirmar, Exclui Registro Posicionado
  If MsgDlg('Confirma Exclusão de '+wNode , 'Mensagem do Sistema ',
    mtConfirmation , [mbYes, mbNo], 0) = mrNo Then Begin
    Exit;
  End;
// Excluir Classificacao \\

// Busca Classificacao
  QryDetalhe.Locate('CODTABCLASSINV;CODCLASSINVEST',
    VarArrayOf([Qry.FieldbyName('CODTABCLASSINV').AsString,
    TpPoint(TvDetalhe.Selected.Data)^.wCodClassInvest]),[]);

  QryDetalhe.Delete;
  TvDetalhe.Selected.Delete;
End;

procedure TFrmCadTabClassif.BtAlterarClick(Sender: TObject);
Var
  wParametros : Variant;
begin
  inherited;
// Caso Node Vazio
  If (wNode = '') Or (wNivel = 0) Then Begin
    ShowMessage('Item não Escolhido !!!!! ');
    BtAlterar.Down:=False;
    Exit;
  End;
// desabilita Botoes
  BtInserir.Enabled:=False;
  BtExcluir.Enabled:=False;
  BtAlterar.Enabled:=False;
// Mostra Tela de Alteracao
  TvDetalhe.Visible:=False;
  Panel1.Visible   :=True;

// Busca Classificacao
  QryDetalhe.Locate('CODTABCLASSINV;CODCLASSINVEST',
    VarArrayOf([Qry.FieldbyName('CODTABCLASSINV').AsString,
    TpPoint(TvDetalhe.Selected.Data)^.wCodClassInvest]),[]);
  QryDetalhe.Edit;

// desabilita Mascara e Seta Focus
  MaskEdit1.Enabled := True;
  MaskEdit1.Color   := ClSilver;
  DbEdit4.SetFocus;
end;

procedure TFrmCadTabClassif.bbtnConfirmarClick(Sender: TObject);
begin
// Testa parametros
  If (DbEdit1.Text = '') Or (DbEdit2.Text = '') Then Begin
    ShowMessage('Faltam preencher campos ....');
    DbEdit1.SetFocus;
    Exit;
  End;
// Trata erro de Duplicidade na Heranca
  Try
    inherited;
  Except
    ShowMessage('Este Código já existe ....');
    DbEdit1.SetFocus;
    Exit;
  End;
// desabilita Codigo
  DBEdit1.Enabled := True;
  DBEdit1.Color   := ClWindow;
// Excuta Botao Cancelar
  BbtnCancelar.Click;
// Inclui Tabelas no TreeView
  TVDetalhe.Items[0].Text:=DbEdit2.Text;
// habilita Botoes
  BtInserir.Enabled:=True;
  BtExcluir.Enabled:=True;
  BtAlterar.Enabled:=True;
end;

procedure TFrmCadTabClassif.sbtnApagarClick(Sender: TObject);
begin
// caso Possua Filhos Não Exclui
  If Not QryDetalhe.IsEmpty Then Begin
    ShowMessage('Registro não pode ser Excluido, Possui Detalhes !!!!');
    SbtnApagar.Down:=False;
    Exit;
  End;
  inherited;
end;

procedure TFrmCadTabClassif.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// desabilita Codigo
  DBEdit1.Enabled := True;
  DBEdit1.Color   := ClWindow;
// desabilita Botoes
  BtInserir.Enabled:=True;
  BtExcluir.Enabled:=True;
  BtAlterar.Enabled:=True;
// Monta Arvore
  QryAfterScroll(Qry);
  PnlFundo.Enabled    := True;

end;

procedure TFrmCadTabClassif.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
// habilita Codigo
  DBEdit1.Enabled := True;
  DBEdit1.Color   := ClBtnFace;
// Seta Focus
  DbEdit2.SetFocus;
// desabilita Botoes
  BtInserir.Enabled:=False;
  BtExcluir.Enabled:=False;
  BtAlterar.Enabled:=False;
end;

//---------------------------------------------------------------
procedure TFrmCadTabClassif.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   If (MontaSelect.ValoresChave.Count > 0) and
      (MontaSelect.ValoresChave[0] <> '') then
      Qry.Locate('CODTABCLASSINV',MontaSelect.ValoresChave[0],[]);

  PnlFundo.Enabled    := True;
end;

Function TFrmCadTabClassif.AcertaNiveis(Texto:String):String;
Var
  I,wNum:Integer;
Begin
  Result:='';
// Testar Parametros
  If Texto = ''  Then Exit;
  For I :=1 To Length(Texto) Do Begin
// Trocar 9 por #
    If (Texto[I] = '9') Then Begin
      Texto[I]:='_';
    End;
// Incrementa Resultado
    Result := Result + Texto[I];
  End;
// Troca Pontos
  wNum:=1;
  For I:=1 to 100 Do Begin
    Result:=Copy(Result,1,(Pos('.',Result)-1))+IntToStr(wNum)+
            Copy(Result,(Pos('.',Result)+1),Length(Result));
    Inc(wNum);
    If Pos('.',Result) = 0 Then Break;
  End;
  Result:=Copy(Result,1,(Pos(';',Result)-1))+IntToStr(wNum)+
          Copy(Result,(Pos(';',Result)),Length(Result));
End;

procedure TFrmCadTabClassif.QryDetalheAfterScroll(DataSet: TDataSet);
begin
  inherited;
// Acerta Campo
  MaskEdit1.Text := QryDetalhe.FieldByName('CODCLASSINVEST').AsString;
end;

procedure TFrmCadTabClassif.TvDetalheCollapsed(Sender: TObject; Node: TTreeNode);
begin
  inherited;
// Altera Caso Nivel Maior que Zero
  If Node.Level <> 0 Then Begin
    Node.ImageIndex   :=0;   // Pasta Fechada
    Node.SelectedIndex:=0;
  End;
end;

procedure TFrmCadTabClassif.TvDetalheExpanded(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  Node.ImageIndex   :=1;  // Pasta Aberta
  Node.SelectedIndex:=1;
end;

procedure TFrmCadTabClassif.TvDetalheKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  If Key = #13 Then TvDetalheDblClick(Self);
end;

procedure TFrmCadTabClassif.TvDetalheDblClick(Sender: TObject);
Var
  wPointId:TpPoint;
  wTamanho:Integer;
  wMaskaraTexto:String;
begin
  inherited;
// Variacao de Nodes por causa dos Documentos
  QryDetalhe.First;
// Caso seja do Primeiro Nivel
  If wNivel = 0 Then Exit;
// Caso já Espandida
  If TvDetalhe.Selected.HasChildren = True Then Begin
    Exit;
  End;
  wMaskaraTexto:='';
  While Not QryDetalhe.Eof Do Begin
// Guarda Tamanho da Strng Selecionada
    wTamanho := Length(Trim(TpPoint(TvDetalhe.Selected.Data)^.wCodClassInvest));
// Testa se String do Node Selecionado esta no Campo do Arquivo
    If (TpPoint(TvDetalhe.Selected.Data)^.wCodClassInvest  <>
       Copy(QryDetalhe.FieldByName('CODCLASSINVEST').AsString,1,wTamanho))
       Then Begin
      QryDetalhe.Next;
      Continue;
    End;

// Inclui Maskara no Campo da Tabela
    Maskara.Text:=QryDetalhe.FieldByName('CODCLASSINVEST').AsString;
// Testa Registros
    If (Length(Copy(Maskara.EditText,1,(Pos('_',Maskara.EditText)-2))) <
      (Pos(IntToStr(TvDetalhe.Selected.Level+1),wTextoNivel)-1))
    Or
      (QryDetalhe.FieldByName('CODCLASSINVEST').AsString =
       TpPoint(TvDetalhe.Selected.Data)^.wCodClassInvest)
      Then Begin
      QryDetalhe.Next;
      Continue;
    End;
// Caso Maior
    If (Length(Copy(Maskara.EditText,1,(Pos('_',Maskara.EditText)-2))) >
      (Pos(IntToStr(TvDetalhe.Selected.Level+1),wTextoNivel)-1))
      Then Begin
// Altera Icone no Ramo
      TVDetalhe.Items[TvDetalhe.Selected.GetLastChild.AbsoluteIndex].ImageIndex   :=0;
      TVDetalhe.Items[TvDetalhe.Selected.GetLastChild.AbsoluteIndex].SelectedIndex:=0;
      QryDetalhe.Next;
      Continue;
    End;
// Carrega o Ponteiro
    New(wPointId);
    wPointId^.wCodClassInvest :=QryDetalhe.FieldByName('CODCLASSINVEST').AsString;
    Maskara.Text              :=QryDetalhe.FieldByName('CODCLASSINVEST').AsString;
    wMaskaraTexto             :=Copy(Maskara.EditText,1,Pos('_',Maskara.EditText)-2);
// Inclui Node no TreeView alimentando propriedade DATA como Ponteiro
    TvDetalhe.Items.AddChildObject(TvDetalhe.Selected,
      wMaskaraTexto+' - '+
      QryDetalhe.FieldByName('DESCCLASSINVEST').AsString,wPointId);
// Inclui Icone no Ramo
    TVDetalhe.Items[TvDetalhe.Selected.GetLastChild.AbsoluteIndex].ImageIndex   :=2;
    TVDetalhe.Items[TvDetalhe.Selected.GetLastChild.AbsoluteIndex].SelectedIndex:=2;
// Proximo Registro Etapa
    QryDetalhe.Next;
  End;
  TvDetalhe.Selected.Expanded  :=True;
end;

Function TFrmCadTabClassif.CalculaProxClasssif(NodeSelecionado:TTreeNode):String;
Var
  wUltimoNode  :String;
  wProximo     :String;
  wContador    : Integer;
  I,wTamanho,wUltimoCod   :Integer;
Begin

// Caso Nó Tenha Filhos \\
 If TvDetalhe.Selected.HasChildren Then Begin
// Pega Ultimo Filho Existente
   wUltimoNode:= TpPoint(NodeSelecionado.GetLastChild.Data)^.wCodClassInvest;
   wUltimoCod := StrToInt(TpPoint(NodeSelecionado.GetLastChild.Data)^.wCodClassInvest);
// Calcula Proximo
   wProximo   :=IntToStr(wUltimoCod+1);

   If Length(wUltimoNode) > Length(wProximo) Then Begin
     wProximo:='0'+wProximo;
   End;
 End Else Begin

// Caso Nó não Tenha Filhos \\

// Pega Informacoes
   wProximo :=TpPoint(NodeSelecionado.Data)^.wCodClassInvest;
   Maskara.Text :=wProximo;
   wUltimoNode  :=Copy(Maskara.EditText,1,Pos('_',Maskara.EditText)-2);
   wTamanho :=Length(wUltimoNode)+2;
   wProximo:='';


   For I := wTamanho To Length(wMascara)-4 Do Begin
     If wMascara[I] = '.' Then Break ;
     wProximo := wProximo+'0'
   End;

   wProximo := Copy(wProximo,0,Length(wProximo)-1)+'1';
   wProximo :=TpPoint(NodeSelecionado.Data)^.wCodClassInvest+wProximo;

 End;

 Result   := wProximo;

End;

procedure TFrmCadTabClassif.FormCreate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled    := True;

end;

end.
