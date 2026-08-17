//---------------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS
// Objetivo .: Formulário de Criação de Tipos de Contratos
//             e relacionamentos com Etapas e Tipos de Operacao
//             Form - FrmCadTipoContrato  /  Unit - FCadTipoContrato
// Data     .: 04/02/1999
// Autor    .: Alexandre Ramos
//---------------------------------------------------------------------------
unit FCadTipoContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, ComCtrls,
  TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid, DBGrids, wwdblook,
  TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbedit,
  CmEventosCadastro, ImgList;

type
  TFrmCadTipoContrato = class(TfrmCadastroCS)
    QryAux: TwwQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    BtInserir: TSpeedButton;
    BtAlterar: TSpeedButton;
    BtExcluir: TSpeedButton;
    DsEtapas: TwwDataSource;
    TvDetalhe: TTreeView;
    ImageList1: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    dbeNomeEtapa: TDBEdit;
    Label5: TLabel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    DsAux: TwwDataSource;
    DsEtapaAnteced: TwwDataSource;
    SpeedButton1: TSpeedButton;
    Label13: TLabel;
    dblcTipoOper: TwwDBLookupCombo;
    QryTipoOperacao: TwwQuery;
    QryEtapas: TwwQuery;
    Label8: TLabel;
    Label9: TLabel;
    DBLkRegraData: TwwDBLookupCombo;
    DBLKRegraValor: TwwDBLookupCombo;
    bbtnRegraValor: TBitBtn;
    bbtnRegraData: TBitBtn;
    QryRegraValor: TwwQuery;
    qryRegraData: TwwQuery;
    QryEtapaAnteced: TwwQuery;
    QryTipoInvest: TwwQuery;
    qryIDTIPOCONTRINVEST: TFloatField;
    qryDESCTIPOCTINVEST: TStringField;
    qryIDTIPOINVEST: TFloatField;
    QryTipoOper: TwwQuery;
    qryIDNAOEXPADRAO: TFloatField;
    QryClasseTitulo: TwwQuery;
    qryIDCLASSETIT: TFloatField;
    wwQuery1: TwwQuery;
    qryUNDCONTRINVEST: TStringField;
    Panel3: TPanel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label22: TLabel;
    dbeDescContrato: TDBEdit;
    DblkcTipoInvest: TwwDBLookupCombo;
    dbeUnidade: TwwDBEdit;
    Panel4: TPanel;
    DbLkcClasseTitulo: TwwDBLookupCombo;
    Label10: TLabel;
    Label11: TLabel;
    DbLkcNaoExercicio: TwwDBLookupCombo;
    procedure FormShow(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
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
    procedure TvDetalheEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure TvDetalheEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnRegraDataClick(Sender: TObject);
    procedure DBLkRegraDataChange(Sender: TObject);
    procedure DBLKRegraValorChange(Sender: TObject);
    procedure TvDetalheCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure DblkcTipoInvestChange(Sender: TObject);
  private
    lstIndice	:TStringList;
	 procedure FechaEAbre( Monta :Boolean );
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadTipoContrato: TFrmCadTipoContrato;
  wIndex	:Integer;
  wNivel	:Integer;
  wOrdAnt:Integer;

implementation

uses DBaseDados,UDataBase,UMensErro, USistema, UBibliotecaInvest,
  UOperComum ;

{$R *.DFM}

procedure TFrmCadTipoContrato.FormShow(Sender: TObject);
begin
	inherited;
// Mostra Tela de Cadastro
	Panel1.Visible   :=False;
	Label13.Visible  :=False;
	TvDetalhe.Visible:=True;

// Abre as Querys
	Qry.Open;
        QryClasseTitulo.Open;
	qryTipoOperacao.Open;
	qryRegraData.Open;
 QryRegraValor.Open;
 QryTipoInvest.Open;

	FechaEAbre( True );

// Inabilita Botoes
	BbtnConfirmar.Enabled:=False;
	BbtnCancelar.Enabled :=False;
	SbtnAlterar.Enabled  :=True;
	SbtnApagar.Enabled   :=True;

End;

//------------------------------------------
// Monta a Arvore (TreeView)
Procedure TFrmCadTipoContrato.MontaArvore;
Var
  Node:TTreeNode;
Begin
// Limpa TreeView
  TVDetalhe.Items.Clear;
// Inclui Tabelas no TreeView
  TVDetalhe.Items.Add(Nil, dbeDescContrato.Text);
  TVDetalhe.Items[0].ImageIndex   	:=1;       // Icones
  TVDetalhe.Items[0].SelectedIndex	:=1;
  if lstIndice=nil then
     lstIndice := TStringList.Create;
  lstIndice.Add('0='+ qry.FieldByName('IDTIPOCONTRINVEST').AsString );

  While not( QryEtapaAnteced.Eof ) do begin
// Inclui Item no TreeView
    TvDetalhe.Items.AddChild(TvDetalhe.Items[
      QryEtapaAnteced.FieldByName('INDICEPAI').AsInteger],
      QryEtapaAnteced.FieldByName('DESCETAPA').AsString);

// Inclui Identificador do Indice na Lista
    LstIndice.Add(QryEtapaAnteced.FieldByName('INDICE').AsString +'='+
      QryEtapaAnteced.FieldByName('SEQCONTRATOINVEST').AsString );

// Inclui Icone
    TVDetalhe.Items[QryEtapaAnteced.FieldByName('INDICE').AsInteger].ImageIndex   :=2;
    TVDetalhe.Items[QryEtapaAnteced.FieldByName('INDICE').AsInteger].SelectedIndex:=2;

// Proximo Registro Etapa
    QryEtapaAnteced.Next;
  End;

// Expande Arvore e Volta ao Topo 
  TVDetalhe.FullExpand;
  TvDetalhe.TopItem:=TvDetalhe.Items[0];
End;

//-- Procedures do Padrão --\\

//----------------------------------------------
// Confirmar
procedure TFrmCadTipoContrato.CmeCadastroConfirma(Sender: TObject);
Begin
  ds.DataSet.CheckBrowseMode;
  dtmBaseDados.dbBaseDados.ApplyUpdates([qry]);
end;

//------------------------------------------
// Retorno da Procura
procedure TFrmCadTipoContrato.CmeCadastroFind(Sender: TObject);
begin
	If (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
	begin
   	Qry.Locate('IDTIPOCONTRINVEST',StrToInt(MontaSelect.ValoresChave[0]),[]);
      FechaEAbre( True );
	end;
end;

//------------------------------------------
// Botão Inserir
procedure TFrmCadTipoContrato.sbtnInserirClick(Sender: TObject);
begin
  Inherited;
  Qry.FieldByName('IDTIPOCONTRINVEST').AsInteger := LeUltRegistro(Nil,'TIPOCONTRINVEST');
// Inabilita Botoes
  BtInserir.Enabled:=False;
  BtExcluir.Enabled:=False;
  BtAlterar.Enabled:=False;
// Limpa TreeView
  TvDetalhe.Items.Clear;

//  dbeNomeEtapa.SetFocus;
end;

// Fim Procedures do Padrao \\
//-------------------------------------------------------------------------

procedure TFrmCadTipoContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// Fecha Querys
  Qry.Close;
  QryEtapas.Close;
  QryEtapaAnteced.Close;
  QryTipoInvest.Close;
  QryClasseTitulo.Close;

  LstIndice.Free;
  inherited;
end;

//-------------------------------------------
// Monta a Arvore ao Rolar o Arquivo
procedure TFrmCadTipoContrato.qryAfterScroll(DataSet: TDataSet);
begin
 inherited;
end;

//-----------------------------------------------
// Botao de Inclui Etapa ou Documento
procedure TFrmCadTipoContrato.BtInserirClick(Sender: TObject);
begin
// Caso Node Vazio
  If (TvDetalhe.Selected = nil) Then Begin
    ShowMessage('Item não Escolhido !!!!! ');
    BtInserir.Down:=False;
    Exit;
  End;
// Inabilita Botoes
  BtInserir.Enabled:=False;
  BtExcluir.Enabled:=False;
  BtAlterar.Enabled:=False;
// Mostra Tela de Cadastro
  TvDetalhe.Visible:=False;
  Panel1.Visible   :=True;
  Label13.Visible  :=True;
// Caso 1 Nivel
  If (wNivel = 0) Then
    Label13.Caption  := 'Contrato .: '+TvDetalhe.Selected.Text
  Else
    Label13.Caption  := ''+TvDetalhe.Selected.Text;

// Inclui Etapas
  Label1.Caption:= 'Cadastro de Etapas';
  Panel2.Visible:=True;
  Panel2.Left   := 2;
  Panel2.Top    := 32;

  QryEtapas.Append;
  dblcTipoOper.SetFocus;
End;

procedure TFrmCadTipoContrato.TvDetalheChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
// Guarda Dados do Escolhido
  wNivel :=Node.Level;
  wIndex :=Node.AbsoluteIndex;
// Caso Nivel = 0 Desabilita Botoes
  If wNivel = 0 Then Begin
    BtExcluir.Enabled:=False;
    BtAlterar.Enabled:=False;
  End Else Begin
// Abilita Botoes
    BtInserir.Enabled:=True;
    BtExcluir.Enabled:=True;
    BtAlterar.Enabled:=True;
  End;
Label6.Caption:='ID       -> '+lstIndice.Names[TvDetalhe.Selected.AbsoluteIndex];
Label7.Caption:='ABSOLUTO -> '+IntToStr(TvDetalhe.Selected.AbsoluteIndex);
End;

//---------------------------------------------------------
// Botão Cancelar Detalhe
procedure TFrmCadTipoContrato.bbtnCancelarDetClick(Sender: TObject);
begin
// Cancela Alteracao
  QryEtapas.Cancel;
// Mostra Treeview
  Panel1.Visible   :=False;
  Label13.Visible  :=False;
  TvDetalhe.Visible:=True;
// Abilita Botoes
  If wNivel = 0 Then Begin
    BtInserir.Enabled:=True;
   // Sb1.Enabled      :=True;
  End Else Begin
    BtInserir.Enabled:=True;
    BtExcluir.Enabled:=True;
    BtAlterar.Enabled:=True;
    //Sb1.Enabled      :=True;
  End;
// Sobe Botoes
  BtInserir.Down:=False;
  BtExcluir.Down:=False;
  BtAlterar.Down:=False;
// Esconde o Painel
  Panel2.Visible:=False;
  TvDetalhe.SetFocus;
  PnlFundo.Enabled     := True;
End;

//---------------------------------------------------------
// Botão Ok Detalhe
procedure TFrmCadTipoContrato.bbtnOkDetClick(Sender: TObject);
var
	 wProx,I,wNum : Integer;
  wSeqContrato : String;
begin
  Inherited;
  Try
//****************************************************************************\\
// Incluir Registros nas Etapas
//****************************************************************************\\
  If BtInserir.Down=True Then Begin
// Inicia Transacao
     DtmBaseDados.dbBaseDados.StartTransaction;
// Etapas
     Try
// Cria Registros de Etapas
       With QryAux Do Begin
         Close;
         SQL.Clear;
         SQL.Add('BEGIN ');
         SQL.Add('INSERT INTO ETAPACONTRATOINV(SEQCONTRATOINVEST,IDTIPOCONTRINVEST,');
         SQL.Add('IDTIPOINVEST,IDTIPOOPERACAO,IDREGRADATAOPER,IDREGRAVALOROPER,DESCETAPACONTRATO)' );
         SQL.Add('VALUES( '+	IntToStr( LeUltRegistro(Nil,'ETAPACONTRATOINV') ) 		+ ','+
                           Qry.FieldByName('IDTIPOCONTRINVEST').AsString     	  	+ ','+
                           QryTipoOperacao.FieldByName('IDTIPOINVEST').AsString 		+ ','+
                           QryTipoOperacao.FieldByName('IDTIPOOPERACAO').AsString 	+ ','''+
                           QryEtapas.FieldByName('IDREGRADATAOPER').AsString 			+ ''','''+
                           QryEtapas.FieldByName('IDREGRAVALOROPER').AsString 			+ ''','''+
                            QryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString	+ ''');' );
         SQL.Add( 'COMMIT; ');
         SQL.Add( 'END; ');
         Prepare;
         ExecSQL;
       End;
       FechaEAbre( False );
       QryEtapas.Last;

//-- Inclui Node no TreeView --\\
       TvDetalhe.Items.AddChild(TvDetalhe.Selected,
         QryEtapas.FieldByName('DESCETAPACONTRATO').AsString);

// Acertar o TreeView
       If (TvDetalhe.Selected.GetLastChild.AbsoluteIndex < TvDetalhe.Items.Count-1) then	begin
         wProx:=TvDetalhe.Selected.GetLastChild.AbsoluteIndex;
// Acerta Valores dos Indices
         For wNum := TvDetalhe.Items.Count-1 DownTo wProx Do Begin
           lstIndice.Values[IntToStr(wNum+1)] := lstIndice.Values[IntToStr(wNum)];
         End;
         lstIndice.Values[IntToStr(wProx)]	 := QryEtapas.FieldByName('SEQCONTRATOINVEST').AsString;
       End Else Begin
// Inclui Indice do Node no Vetor
         lstIndice.Add( IntToStr(TvDetalhe.Selected.GetLastChild.AbsoluteIndex)+'='+
                   QryEtapas.FieldByName('SEQCONTRATOINVEST').AsString );
       End;

// Atualiza Dados da Arvore \\
// Exclui Dados Atuais
       QryAux.Close;
       QryAux.Sql.Clear;
       QryAux.Sql.Add('DELETE FROM '+ Sistema.PrefixoServidor +'OPERANTECEDENTE ');
       QryAux.Sql.Add('WHERE IDTIPOCONTRINVEST = '+ Qry.FieldByName('IDTIPOCONTRINVEST').AsString);

       QryAux.Prepare;
       QryAux.ExecSQL;
// Icone do Node
       TvDetalhe.Selected.GetLastChild.ImageIndex   :=2;
       TvDetalhe.Selected.GetLastChild.SelectedIndex:=2;
// Grava Dados Novos
       QryAux.Close;
       QryAux.SQL.Clear;
       QryAux.SQL.Add('BEGIN ');
       For I := 1 To (TvDetalhe.Items.Count-1) do begin
// Recurso de Programacao - Caso Tree com 1 Item dava erro no StrList ...
         If (TvDetalhe.Items.Count-1) > 1 Then
           wSeqContrato := lstIndice.Values[IntToStr(TvDetalhe.Items[I].AbsoluteIndex)]
         Else Begin
           wSeqContrato := QryEtapas.FieldByName('SEQCONTRATOINVEST').AsString;
           lstIndice.Values[IntToStr(TvDetalhe.Items[I].AbsoluteIndex)] :=
             QryEtapas.FieldByName('SEQCONTRATOINVEST').AsString;
         End;
// Localiza o Tipo de Operacao sendo Gravada
         QryEtapas.Locate('SEQCONTRATOINVEST',wSeqContrato,[] );
// Inclui dados da Arvore na tabela
         QryAux.SQL.Add('INSERT INTO OPERANTECEDENTE(SEQOPERANTECED, ');
         QryAux.SQL.Add('       IDTIPOCONTRINVEST,SEQCONTRATOINVEST,');
         QryAux.SQL.Add('       INDICEPAI,INDICE,DESCETAPA, IDTIPOINVEST, IDTIPOOPERACAO) ');
         QryAux.SQL.Add('VALUES( '+wSeqContrato                                   +','+
                          Qry.FieldByName('IDTIPOCONTRINVEST').AsString		       +','+
                          wSeqContrato 	                                         +','+
                          IntToStr( TvDetalhe.Items.Item[I].Parent.AbsoluteIndex )+','+
                          IntToStr( TvDetalhe.Items.Item[I].AbsoluteIndex )			 +','''+
                          TvDetalhe.Items.Item[I].Text                            +''','+
                          QryEtapas.FieldByName('IDTIPOINVEST').AsString          +','+
                          QryEtapas.FieldByName('IDTIPOOPERACAO').AsString        +' );');

// Tenta Baixar na Tabela, Caso já exista Continua
       End;
       QryAux.SQL.Add('COMMIT; ');
       QryAux.SQL.Add('END; ');

       QryAux.Prepare;
       QryAux.ExecSQL;

// Confirma Transacao
       DtmBaseDados.dbBaseDados.Commit;
// Expande Ramo
       TvDetalhe.FullExpand;
     Except
       DtmBaseDados.dbBaseDados.RollBack;
       MsgDlg('Erro ao Incluir Registros na Arvore. ' , 'Mensagem do Sistema ',
              mtError , [mbOk], 0);
       Exit;
     End;
//****************************************************************************\\
// Alterar Registros de Etapas
//****************************************************************************\\
  End Else Begin
    Try
      DtmBaseDados.dbBaseDados.StartTransaction;

      QryEtapas.Post;

      TvDetalhe.Selected.Text:=dblcTipoOper.Text;

// Alterar Descricao da Etapa no Item
      QryEtapaAnteced.Locate('INDICE',TvDetalhe.Selected.AbsoluteIndex,[]);

      QryEtapaAnteced.Edit;
      QryEtapaAnteced.FieldByName('DESCETAPA').AsString:=DblcTipoOper.Text;

      QryEtapaAnteced.FieldByName('IDTIPOOPERACAO').AsInteger:=
        QryEtapas.FieldByName('IDTIPOOPERACAO').AsInteger;

      QryEtapaAnteced.Post;

      DtmBaseDados.dbBaseDados.Commit;
    Except
      On E:Exception Do Begin
        DtmBaseDados.dbBaseDados.RollBack;
        BtAlterar.Down:=False;
        MsgDlg('Erro ao Alterar Registro, Com  a Mensagem: '+#13+
               E.Message, 'Mensagem do Sistema ', MtError, [MbOk], 0);
        Exit;
      End;
    End;
		end;
// Atualiza Dados
		FechaEAbre( False );
	Except
		If BtInserir.Down Then
			TvDetalhe.Selected.GetLastChild.Delete;
		BtInserir.Down:=False;
		BtAlterar.Down:=False;
// Rollback na Transacao
   DtmBaseDados.dbBaseDados.RollBack;
		Raise;
	End;
// Abilita Botoes
	BtInserir.Enabled:=True;
	BtExcluir.Enabled:=True;
	BtAlterar.Enabled:=True;
// Sobe Botoes
	BtInserir.Down:=False;
	BtExcluir.Down:=False;
	BtAlterar.Down:=False;
// Mostra Treeview
	Panel1.Visible   :=False;
	Label13.Visible  :=False;
	Panel2.Visible   :=False;
	TvDetalhe.Visible:=True;
	TvDetalhe.SetFocus;
 PnlFundo.Enabled     := True;
end;

procedure TFrmCadTipoContrato.LkcDocumentosNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
  ShowMessage('Documento não Encontrado !!!');
  Accept:=False;
end;

//---------------------------------------------------------
// Botão Excluir Detalhe
procedure TFrmCadTipoContrato.BtExcluirClick(Sender: TObject);
Var
  wIdNode,I,wNum,wNodeExclu:Integer;
begin
  inherited;
// Caso Node Vazio
  If (TvDetalhe.Selected = nil) Or (wNivel = 0) then begin
    ShowMessage('Item não Escolhido !!!!! ');
    BtExcluir.Down:=False;
    Exit;
  end;
  If TvDetalhe.Selected.HasChildren = True Then begin
    ShowMessage('Item não pode ser excluido, Possui Sub-Itens ... ');
    BtExcluir.Down:=False;
    Exit;
  end;
// Inabilita Botoes
  BtExcluir.Down:=False;
// Confirma Exclusao ou Nao
// Se Confirmar, Exclui Registro Posicionado
  If MsgDlg('Confirma Exclusão de '+TvDetalhe.Selected.Text , 'Mensagem do Sistema ',
    mtConfirmation , [mbYes, mbNo], 0) = mrNo Then Begin
    Exit;
  End;

//-- Acerto do TreeView --\\
// Guarda Node
  try
// Inicia Transacao
    DtmBaseDados.dbBaseDados.StartTransaction;
    QryAux.RequestLive:=False;

    wNodeExclu:=TvDetalhe.Selected.AbsoluteIndex;
    wIdNode   :=StrToInt(lstIndice.Values[IntToStr(TvDetalhe.Selected.AbsoluteIndex)]);
// Exclui Node do TreeView
    TvDetalhe.Items.Delete(TvDetalhe.Selected);
// Caso nao Seja o Ultimo Node Acerta Posteriores
    if (wNodeExclu < (TvDetalhe.Items.Count-1)) Then begin
// Acerta Valores dos Indices
      for wNum := wNodeExclu To  (TvDetalhe.Items.Count-1) do
        lstIndice.Values[IntToStr(wNum)]:=lstIndice.Values[IntToStr(wNum+1)];
      lstIndice.Values[IntToStr(wNum)]:='0';
    end else begin
// Inclui Ponteiro do Node no Vetor
      lstIndice.Values[IntToStr(wNodeExclu)]:='0';
    end;
// Expande Ramo
    TvDetalhe.FullExpand;
// Atualiza Dados da Arvore \\

// Exclui Dados Atuais
    QryAux.Close;
    QryAux.Sql.Clear;
    QryAux.Sql.Add('DELETE FROM '+ Sistema.PrefixoServidor +'OPERANTECEDENTE WHERE IDTIPOCONTRINVEST = '+
    Qry.FieldByName('IDTIPOCONTRINVEST').AsString);
    QryAux.ExecSQL;

// Grava Dados Novos Caso Existam
    If (TvDetalhe.Items.Count-1)> 0 Then Begin
      QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.Add('BEGIN' );
      For I := 1 To (TvDetalhe.Items.Count-1) Do Begin
// Localiza o Tipo de Operacao sendo Gravada
        QryEtapas.Locate('SEQCONTRATOINVEST',
                        lstIndice.Values[IntToStr(TvDetalhe.Items[I].AbsoluteIndex)],[] );
// Grava Dados da Arvore na Tabela
        QryAux.SQL.Add('INSERT INTO OPERANTECEDENTE(SEQOPERANTECED,IDTIPOCONTRINVEST, ');
        QryAux.SQL.Add('       SEQCONTRATOINVEST,INDICEPAI,INDICE,IDTIPOINVEST, IDTIPOOPERACAO, DESCETAPA) ');
// Programa tentava incluir sequencial no lugar do valor vindo da tabela pai do relacionamento.
//   AUGUSTO 01/11/00
//        QryAux.SQL.Add('VALUES( '+	IntToStr( LeUltRegistro(nil,'OPERANTECEDENTE') ) 				+','+
        QryAux.SQL.Add('VALUES( '+QryEtapas.FieldByName('SEQCONTRATOINVEST').AsString+','+
          Qry.FieldByName('IDTIPOCONTRINVEST').AsString		+','+
          lstIndice.Values[IntToStr(TvDetalhe.Items[I].AbsoluteIndex)]+ ','+
          IntToStr( TvDetalhe.Items.Item[I].Parent.AbsoluteIndex )	 	+ ','+
          IntToStr( TvDetalhe.Items.Item[I].AbsoluteIndex )					  + ','+
          QryEtapas.FieldByName('IDTIPOINVEST').AsString + ','+
          QryEtapas.FieldByName('IDTIPOOPERACAO').AsString + ','''+
          TvDetalhe.Items.Item[I].Text + ''' );' );

// Tenta Baixar na Tabela, Caso já exista Continua
      End;
      QryAux.SQL.Add('END;');
      Try
        QryAux.Prepare;
        QryAux.ExecSQL;
      Except
       MsgDlg('Registro não pode ser excluido. ' , 'Mensagem do Sistema ',
              mtError , [mbOk], 0);
// Caso não Tenha Etapas a Incluir Nao Mostra Erro
        BtExcluir.Down:=False;
// Cancela Transacao
        DtmBaseDados.dbBaseDados.Rollback;
// Remonta a Arvore
      	 FechaEAbre(True);
//         raise;
         Exit;
      End;
    End;
//******************************************************************************
// Qry Para Buscar Etapa
    QryAux.Close;
    QryAux.Sql.Clear;
    QryAux.Sql.Add('DELETE FROM '+ Sistema.PrefixoServidor +'ETAPACONTRATOINV WHERE SEQCONTRATOINVEST = '+
                   IntToStr(wIdNode));

    QryAux.Prepare;
    QryAux.ExecSQL;

// Confirma Transacao
    DtmBaseDados.dbBaseDados.Commit;
  Except
// Cancela Transacao
    DtmBaseDados.dbBaseDados.Rollback;
    MsgDlg('Registro não pode ser excluido. ' , 'Mensagem do Sistema ',
           mtError , [mbOk], 0);
    BtExcluir.Down:=False;
  	 FechaEAbre(True);
    Exit;
  End;
  BtExcluir.Down:=False;
// Remonta a Arvore
  FechaEAbre( False );
End;

//---------------------------------------------------------
// Botão Alterar Detalhe
procedure TFrmCadTipoContrato.BtAlterarClick(Sender: TObject);
Var
  Indice : LongInt;
begin
  inherited;
// Caso Node Vazio
  if (TvDetalhe.Selected = nil) Or (wNivel = 0) Then begin
    ShowMessage('Item não Escolhido !!!!! ');
    BtAlterar.Down:=False;
    Exit;
  end;
// Inabilita Botoes
  BtInserir.Enabled:=False;
  BtExcluir.Enabled:=False;
  BtAlterar.Enabled:=False;
// Mostra Tela de Cadastro
  TvDetalhe.Visible:=False;
  Panel1.Visible   :=True;
  Label13.Visible  :=True;
  Label13.Caption  := ''+TvDetalhe.Selected.Text;

// Qry Para Buscar Etapa

  // Recurso de programação.
  Indice:= StrToInt(lstIndice.Values[IntToStr(TvDetalhe.Items[wIndex].AbsoluteIndex)]);

  QryEtapas.Locate('SEQCONTRATOINVEST',Indice,[] );

  Label1.Caption:= 'Alteração de Etapas';
  Panel2.Visible:=True;
  Panel2.Left   := 2;
  Panel2.Top    := 32;

  QryEtapas.Edit;
  dblcTipoOper.SetFocus;
end;

//--------------------------------------------------------
// Confirma Alteraçoes do Treeview
procedure TFrmCadTipoContrato.TvDetalheEdited(Sender: TObject; Node: TTreeNode;
  var S: String);
begin
	inherited;
// Caso Vazio
	If S = '' Then Begin
   	S:=QryEtapas.FieldByName('NOMETIPOETAPA').AsString;
		Exit;
	End;
// Qry Para Buscar Etapa
	QryEtapas.Locate('SEQCONTRATOINVEST',
   	lstIndice.Values[IntToStr(TvDetalhe.Items[wIndex].AbsoluteIndex)],[]);
	QryEtapas.Edit;
// Guarda a Descricao
	QryEtapas.FieldByName('NOMETIPOETAPA').AsString :=S;
	QryEtapas.Post;

// Qry Para Buscar Etapa da TAbela de Etapas Antecedentes
	QryEtapaAnteced.Locate('SEQCONTRATOINVEST',
   	lstIndice.Values[IntToStr(TvDetalhe.Items[wIndex].AbsoluteIndex)],[]);
	QryEtapaAnteced.Edit;
// Guarda a Descricao
	QryEtapaAnteced.FieldByName('DESCETAPA').AsString :=S;
	QryEtapaAnteced.Post;
end;

//--------------------------------------------------------
// Permite ou Não editar treeview de acordo com o Nivel
procedure TFrmCadTipoContrato.TvDetalheEditing(Sender: TObject;
  Node: TTreeNode; var AllowEdit: Boolean);
begin
  inherited;
// Caso Nivel # de 0 não Deixa
  If wNivel = 0 Then begin
    AllowEdit:=False;
  End;
end;

procedure TFrmCadTipoContrato.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
// Excuta Botao Cancelar
  BbtnCancelar.Click;
// Inclui Tabelas no TreeView
  TVDetalhe.Items[0].Text:=dbeDescContrato.Text;
// Abilita Botoes
  BtInserir.Enabled:=True;
  BtExcluir.Enabled:=True;
  BtAlterar.Enabled:=True;
  DblkcTipoInvest.Enabled:=True;
end;

procedure TFrmCadTipoContrato.sbtnApagarClick(Sender: TObject);
begin
// Caso Tabela Vazia Sai
  If Qry.IsEmpty Then Begin
    MsgDlg('Tabela Vazia ','Mensagem do Sistema',MtError,[MbOk],0);
    sbtnApagar.Down:=False;
    Exit;
  End;
// Pede Confirmacao
  If (MsgDlg('Deseja realmente excluir este registro ?',
             'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) Then Begin
    sbtnApagar.Down:=False;
    Exit;
  End;

// Tenta Excluir Detalhes
  Try
    DtmBaseDados.dbBaseDados.StartTransaction;
    ExecutaQuery(QryAux,'DELETE FROM '+ Sistema.PrefixoServidor +'OPERANTECEDENTE  WHERE IDTIPOCONTRINVEST = '+
                        Qry.FieldByName('IDTIPOCONTRINVEST').AsString);
    ExecutaQuery(QryAux,'DELETE FROM '+ Sistema.PrefixoServidor +'ETAPACONTRATOINV WHERE IDTIPOCONTRINVEST = '+
                         Qry.FieldByName('IDTIPOCONTRINVEST').AsString);
    ExecutaQuery(QryAux,'DELETE FROM '+ Sistema.PrefixoServidor +'TIPOCONTRINVEST  WHERE IDTIPOCONTRINVEST = '+
                        Qry.FieldByName('IDTIPOCONTRINVEST').AsString);
// Confirma Transacao
    DtmBaseDados.dbBaseDados.Commit;
  Except
    MsgDlg('Registro não pode ser excluido. ' , 'Mensagem do Sistema ',
           mtError , [mbOk], 0);
// Cancela Transacao
    DtmBaseDados.dbBaseDados.Rollback;
// Monta Arvore
    FechaEAbre( True );
    PnlFundo.Enabled := True;
    sbtnApagar.Down  := False;
  End;
// Erança
//  inherited;
// Refaz Ambiente
  sbtnApagar.Down:=False;
  Qry.Close;
  Qry.Open;
// Monta Arvore
  FechaEAbre( True );
  PnlFundo.Enabled     := True;
end;

procedure TFrmCadTipoContrato.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Abilita Botoes
  BtInserir.Enabled:=True;
  BtExcluir.Enabled:=True;
  BtAlterar.Enabled:=True;
  DblkcTipoInvest.Enabled:=True;
// Monta Arvore
  FechaEAbre( True );
  PnlFundo.Enabled     := True;
end;

procedure TFrmCadTipoContrato.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
// Inabilita Botoes
  BtInserir.Enabled:=False;
  BtExcluir.Enabled:=False;
  BtAlterar.Enabled:=False;
end;

procedure TFrmCadTipoContrato.SpeedButton1Click(Sender: TObject);
Begin
	Inherited;
End;

//---------------------------------------------------------------
procedure TFrmCadTipoContrato.bbtnRegraDataClick(Sender: TObject);
begin
	inherited;
	if Sender = bbtnRegraData then
   	   OperComum.ChamaRegra(qryRegraData.FieldByName('IdRegra').AsString,0)
	else
   	   OperComum.ChamaRegra(qryRegraValor.FieldByName('IdRegra').AsString,0);
end;

procedure TFrmCadTipoContrato.DBLkRegraDataChange(Sender: TObject);
begin
	inherited;
//   bbtnRegraData.Enabled	:= DBLkRegraData.Text <> '';
end;

procedure TFrmCadTipoContrato.DBLKRegraValorChange(Sender: TObject);
begin
	inherited;
//   bbtnRegraValor.Enabled	:= DBLkRegraValor.Text <> '';
end;

procedure TFrmCadTipoContrato.FechaEAbre( Monta :Boolean );
begin
  QryEtapas.Close;
	 QryEtapas.ParamByName('IDTIPOCONTRINVEST').AsString	:= Qry.FieldByName('IDTIPOCONTRINVEST').AsString;
  QryEtapas.Open;

  QryEtapaAnteced.Close;
	 QryEtapaAnteced.ParamByName('IDTIPOCONTRINVEST').AsString	:= Qry.FieldByName('IDTIPOCONTRINVEST').AsString;
	 QryEtapaAnteced.Open;

  If Monta then
   	MontaArvore;
end;
//----------------------------------------------------------------
// Quando Implodindo - Não Permite
procedure TFrmCadTipoContrato.TvDetalheCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  inherited;
  AllowCollapse :=False;
end;

procedure TFrmCadTipoContrato.FormCreate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled     := True;
end;

procedure TFrmCadTipoContrato.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled     := True;

end;

procedure TFrmCadTipoContrato.DblkcTipoInvestChange(Sender: TObject);
begin
  inherited;
  If (DbLkcTipoInvest.LookupValue = '1') Then
  Begin
     Label11.Visible           := True;
     DbLkcClasseTitulo.Visible := True;
     Label10.Visible           := False;
     DbLkcNaoExercicio.Visible := False;
     Panel4.Visible := True;
  End
  else if (DbLkcTipoInvest.LookupValue = '2') Then
  Begin
     Label10.Visible           := True;
     DbLkcNaoExercicio.Visible := True;
     Label11.Visible           := False;
     DbLkcClasseTitulo.Visible := False;
     Panel4.Visible := True;
  End
  Else
     Panel4.Visible := False;
end;

end.



