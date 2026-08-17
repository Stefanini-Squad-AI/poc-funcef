//------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS
// Objetivo .: Monta Arvore (Tree) com as Classificacoes de uma Tabela
//             e Retorna a Classificacao Escolhida
// Form     .: FrmBuscaReserva - Unit .: FBuscaReserva
// Data     .: 11/02/1999
//------------------------------------------------------------------
unit FBuscaClassif;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook, DBTables, Wwquery,
  ComCtrls, CMTree, TB97Ctls, TB97Tlbr, Grids, DBGrids, Menus, IvDictio,
  IvMulti, IvEMulti, CmEventosCadastro, wwDialog, ImgList;

type
  TFrmBuscaClassif = class(TfrmCadastro)
    pnlArvore: TPanel;
    QryDetalhe: TwwQuery;
    qryAux: TwwQuery;
    BitBtn1: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    ImageList1: TImageList;
    TvDetalhe: TTreeView;
    Maskara: TMaskEdit;
    PopupMenu1: TPopupMenu;
    ExpandeRamos1: TMenuItem;
    N1: TMenuItem;
    ComprimeRamos1: TMenuItem;
    BitBtn2: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    procedure cmtvTipoReservaChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MontaArvore;
    procedure TvDetalheChange(Sender: TObject; Node: TTreeNode);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TvDetalheCollapsed(Sender: TObject; Node: TTreeNode);
    procedure TvDetalheExpanded(Sender: TObject; Node: TTreeNode);
    procedure ExpandeRamos1Click(Sender: TObject);
    procedure ComprimeRamos1Click(Sender: TObject);
    procedure TvDetalheKeyPress(Sender: TObject; var Key: Char);
    procedure TvDetalheDblClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
// Funcoes
    Function AcertaNiveis       (Texto:String):String;
  private
    { Private declarations }
  public
    { Public declarations }
    wReserva:Integer;
    wClassifEscolhida  :String;
    wTexto,wMascara    :String;
    wCodTabelaClassif  :String;
    wDescTabelaClassif :String;
// Variaveis
  end;
// Tipo Ponteiro
  TpPoint = ^TpRecord;
// Tipo Record
  TpRecord = Record
    wCodClassInvest :String;
  End;

var
  FrmBuscaClassif: TFrmBuscaClassif;
  sAnaliticoSintetico, sCodPai, sIdTipoReserva: string;
  bArvoreEnabled : boolean;
  wNivel, wNode  :Integer;
  wTextoNivel    :String;
  sMascTpReserva : String;



implementation

uses
    UMensErro, USistema, FTelaAut, UBibliotecaInvest;

{$R *.DFM}

procedure TFrmBuscaClassif.cmtvTipoReservaChanging
(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
begin
end;



//------------------------------------------
// Monta a Arvore (TreeView)
Procedure TFrmBuscaClassif.MontaArvore;
Var
  wPointId:TpPoint;
Begin
// Limpa TreeView
  TvDetalhe.Items.Clear;
// Inclui Tabelas no TreeView
// Carrega o Ponteiro
  New(wPointId);
  wPointId^.wCodClassInvest :='0';
  TVDetalhe.Items.AddObject(Nil, wDescTabelaClassif,wPointId);
  TVDetalhe.Items[0].ImageIndex   :=1;       // Icones
  TVDetalhe.Items[0].SelectedIndex:=1;
// Acerta Mascara de Niveis
//  sMascTpReserva := wMascara;
  wTextoNivel    := AcertaNiveis(sMascTpReserva);
// Variacao de Nodes por causa dos Documentos
  QryDetalhe.First;
  While Not QryDetalhe.Eof Do Begin
// Caso Não seja do Primeiro Nivel
// Primeiro Nivel
    If Length(QryDetalhe.FieldByName('CODCLASSINVEST').AsString) >
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
// Proximo Registro Etapa
    QryDetalhe.Next;
  End;
  TVDetalhe.FullExpand;
  TvDetalhe.TopItem:=TvDetalhe.Items[0];
End;

//--------------------------------------------------------
// Abre as Querys
procedure TFrmBuscaClassif.FormActivate(Sender: TObject);
begin
  inherited;
end;

//--------------------------------------------------------
// Abre Form
procedure TFrmBuscaClassif.FormShow(Sender: TObject);
begin
  inherited;
// Ambiente
  DbNav.Visible:=False;
  If FazQuery(QryAux,'SELECT MASCCLASSIFINV FROM PARAMINVEST') Then Begin
    Maskara.EditMask:=QryAux.FieldByName('MASCCLASSIFINV').AsString+'._;0;_';
    sMascTpReserva  :=Maskara.EditMask
  End Else Begin
    ShowMessage('Não existe Mascara cadastrada.. ');
    Close;
  End;

// Abre a Query
  FazQuery(QryDetalhe,'SELECT 	CODTABCLASSINV, CODCLASSINVEST, DESCCLASSINVEST, '+
                      '       	CLASSIFANALIT '+
                      'FROM CLASSIFINVEST '+
                      'WHERE (CODTABCLASSINV = '''+wCodTabelaClassif+''')'+
                      'ORDER BY CODCLASSINVEST ');
// Monta Arvore
  MontaArvore()
end;

procedure TFrmBuscaClassif.TvDetalheChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
// Guarda Dados do Node
  wNivel :=Node.Level;
  wNode:=Node.AbsoluteIndex;
  If wNode = 0 Then Begin
    If TvDetalhe.Items[0].HasChildren Then
    TvDetalhe.Items[0].GetFirstChild.Selected := True;
  End;
end;


procedure TFrmBuscaClassif.BitBtn1Click(Sender: TObject);
begin
  inherited;
// Iguala Dados
  wClassifEscolhida := TpPoint(TvDetalhe.Selected.Data)^.wCodClassInvest;
// Fecha Formulario
  Close;
end;

procedure TFrmBuscaClassif.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryDetalhe.Close;
  If wClassifEscolhida <= '' Then wClassifEscolhida:='';
end;

//----------------------------------------
// Acerta Niveis
Function TFrmBuscaClassif.AcertaNiveis(Texto:String):String;
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

//--------------------------------------------------------------
// Ramo Comprimido
procedure TFrmBuscaClassif.TvDetalheCollapsed(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
// Altera Caso Nivel Maior que Zero
  If Node.Level <> 0 Then Begin
    Node.ImageIndex   :=0;   // Pasta Fechada
    Node.SelectedIndex:=0;
  End;
end;

//--------------------------------------------------------------
// Ramo Expandido
procedure TFrmBuscaClassif.TvDetalheExpanded(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  Node.ImageIndex   :=1;  // Pasta Aberta
  Node.SelectedIndex:=1;
end;

//--------------------------------------------------------------
// Expande Ramos
procedure TFrmBuscaClassif.ExpandeRamos1Click(Sender: TObject);
begin
  inherited;
  TvDetalhe.FullExpand;
end;
//--------------------------------------------------------------
// Comprime Ramos
procedure TFrmBuscaClassif.ComprimeRamos1Click(Sender: TObject);
begin
  inherited;
  TvDetalhe.FullCollapse;
end;

procedure TFrmBuscaClassif.TvDetalheKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
end;

//------------------------------------------------------------
// Duplo Click no Form
procedure TFrmBuscaClassif.TvDetalheDblClick(Sender: TObject);
Var
  wPointId:TpPoint;
  wTamanho:Integer;
  wMaskaraTexto:String;
Begin
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
    wTamanho := Length(TpPoint(TvDetalhe.Selected.Data)^.wCodClassInvest);
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
  TvDetalhe.TopItem            :=TvDetalhe.Items[0];
  TvDetalhe.Selected.Expanded  :=True;
end;

//------------------------------------------------------------
// Botao Calncelar
procedure TFrmBuscaClassif.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Iguala Dados
  wClassifEscolhida := '';
  wMascara := '';
  wTexto   := '';
// Fecha Formulario
  Close;
end;

end.
