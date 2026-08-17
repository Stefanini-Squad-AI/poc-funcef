//------------------------------------------------------------------
// Sistema   .: Sistema de Cálculos Atuariais
// Objetivo  .: Formulário de Criação de Filtros em Tabelas
//              Form - FrmFiltraTabela  /  Unit - UFiltraTabela
// Data      .: 11/06/1998
// Autor     .: Alexandre Ramos
//------------------------------------------------------------------
unit UFiltraTabela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Db, DBTables, Wwquery, Wwdatsrc, wwdblook,
  MAHlpBtn, Buttons, TB97, {ExtCtrlt, }Grids, DBGrids, ComCtrls,
  Mask, TREdit, TEdNum, Menus, DBCtrls, wwdbedit, Wwdbspin, cmseldlg, Math,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti,FTelaAut, wwdbdatetimepicker,
  CMDateTimePicker, ExtCtrls;

type
  TFrmFiltraTabela = class(TfrmOkCancelar)
    DsSelecionaTabela: TwwDataSource;
    QrySelecionaTabela: TwwQuery;
    DsMostraCampos: TwwDataSource;
    QryMostraCampos: TwwQuery;
    DsSQL: TwwDataSource;
    QrySQL: TwwQuery;
    DsBuscaCampo: TwwDataSource;
    QryBuscaCampo: TwwQuery;
    Paginas: TPageControl;
    Pg1: TTabSheet;
    Label1: TLabel;
    LkcTabelas: TwwDBLookupCombo;
    Label2: TLabel;
    LstCampos: TListBox;
    LstSql: TListBox;
    LstCamposBd: TListBox;
    GroupBox1: TGroupBox;
    BtnExcluir: TSpeedButton;
    BtnIncluir: TSpeedButton;
    LblTexto: TLabel;
    LblSinal: TLabel;
    EData: TCMDateTimePicker;
    EConteudo: TEdit;
    RgEstCiv: TRadioGroup;
    RgFiltros: TRadioGroup;
    RgVF: TRadioGroup;
    RgMF: TRadioGroup;
    Label3: TLabel;
    LstResult: TListBox;
    Pg2: TTabSheet;
    DBGrid1: TDBGrid;
    BtnFiltrar: TBitBtn;
    QryFiltros: TwwQuery;
    Panel2: TPanel;
    Label7: TLabel;
    PrgBar1: TProgressBar;
    BtnExistentes: TSpeedButton;
    SelDlg1: TcmSelectDlg;
    QryExistentes: TwwQuery;
    wwDataSource1: TwwDataSource;
    DsAux: TwwDataSource;
    QryAux: TwwQuery;
    LstIdCamposBd: TListBox;
    tabfiltro: TTable;
    QryTabFiltro: TwwQuery;
    QryMostraCamposDESCRICAO: TStringField;
    QryMostraCamposIDCAMPO: TStringField;
    QryMostraCamposTIPO: TFloatField;
    QryMostraCamposRELACAO: TStringField;
    QryMostraCamposIDTABELA: TFloatField;
    QryBuscaCampoDESCRICAO: TStringField;
    QryBuscaCampoIDCAMPO: TStringField;
    QryBuscaCampoTIPO: TFloatField;
    QryBuscaCampoRELACAO: TStringField;
    QrySelecionaTabelaIDTABELA: TFloatField;
    QrySelecionaTabelaIDFILTRO: TFloatField;
    QrySelecionaTabelaDESCRICAOFILTRO: TStringField;
    QrySelecionaTabelaMONTASQL: TMemoField;
    GrupoOperadores: TGroupBox;
    op1: TCheckBox;
    op2: TCheckBox;
    op3: TCheckBox;
    op4: TCheckBox;
    OpColoca: TButton;
    OpTira: TButton;
    BitBtn1: TBitBtn;
    RgOrdem: TRadioGroup;
    BtInsOrdem: TSpeedButton;
    BtExcOrdem: TSpeedButton;
    EOrdem: TEdit;
    listaselecionados: TListBox;
    btnselecao: TBitBtn;
    Listatipos: TListBox;
    ListaCodSelecionados: TListBox;
    LstRelacao: TListBox;
    Function  MontaTabela(wTabela:integer;filtro:string):String;
    procedure RgFiltrosClick(Sender: TObject);
    procedure LkcTabelasChange(Sender: TObject);
    procedure LstCamposClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure LstResultClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BtnFiltrarClick(Sender: TObject);
    procedure EConteudoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnExistentesClick(Sender: TObject);
    procedure DBComboExistentesChange(Sender: TObject);
    procedure OpColocaClick(Sender: TObject);
    procedure OpTiraClick(Sender: TObject);
    procedure op1Click(Sender: TObject);
    procedure op2Click(Sender: TObject);
    procedure op3Click(Sender: TObject);
    procedure op4Click(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RgOrdemClick(Sender: TObject);
    procedure BtInsOrdemClick(Sender: TObject);
    procedure btnselecaoClick(Sender: TObject);
    procedure listaselecionadosClick(Sender: TObject);
    procedure ListatiposClick(Sender: TObject);

  private
    { Private declarations }
    procedure EscolheOperador(operadorlinha,operadorSQL : string);
  public
    { Public declarations }
  end;

var
  FrmFiltraTabela: TFrmFiltraTabela;
  SQLOriginal,wCampo,SqlFinal,wLSql: String;
  WglobalNumFiltro : integer;

implementation

Uses UBibliotecaAtuarial,Usistema,FCadRelatorios,UModeloRelatCM,Udatabase,UMensErro;
{$R *.DFM}

procedure TFrmFiltraTabela.RgFiltrosClick(Sender: TObject);
Var
I,Tipodado:Integer;
Begin
  Inherited;
  If (LstCampos.ItemIndex < 0)   Or
     (LstCampos.Items.Count < 0) Then
    Begin
      ShowMessage('Campo deve ser Selecionado ');
      Exit;
    End;

// Tipos de Filtros - Mostra as Opções caso Campo Escolhido \\
  wCampo := LstCamposBd.Items[LstCampos.ItemIndex];
// Muda Texto e o Filtro de Acordo com a Selecao
  Case RgFiltros.ItemIndex of
     0 : {= }
     Begin
       LblTexto.Caption := 'Igual a ';
       LblSinal.Caption := ' = ';
     End;
     1 : {<>}
     Begin
       LblTexto.Caption := 'Diferente de';
       LblSinal.Caption := ' <> ';
     End;
     2 : {< }
     Begin
       LblTexto.Caption := 'Menor que ';
       LblSinal.Caption := ' < ';
     End;
     3 : {> }
     Begin
       LblTexto.Caption := 'Maior que ';
       LblSinal.Caption := ' > ';
     End;
     4 : {<=}
     Begin
       LblTexto.Caption := 'Menor ou Igual a ';
       LblSinal.Caption := ' <= ';
     End;
     5 : {>=}
     Begin
       LblTexto.Caption := 'Maior ou Igual a ';
       LblSinal.Caption := ' >= ';
     End;
    End;
// Testa se Foi e o Tipo de Campo Escolhido
  If wCampo <> '' Then
    Begin
// Busca o Tipo de Campo
      QryBuscaCampo.Close;
      QryBuscaCampo.ParamByName('IDTABELA').AsInteger:=
                   QrySelecionaTabela['Idtabela'];
      QryBuscaCampo.ParamByName('IDCAMPO').AsString:=
          LstIdCamposBd.Items[LstCampos.ItemIndex];
      QryBuscaCampo.Open;
      BtnIncluir.Enabled:=True;
    

// Utilizar de Acordo com Tipo de Filtro
// String ou Namber
      Tipodado := QryBuscaCampo['Tipo'];
      If (Tipodado = 1) Or (Tipodado = 2) Then Begin
        EConteudo.Text:='';
        EConteudo.Visible:=True;
        EConteudo.Left:=8;
        EConteudo.Top:=99;
        EConteudo.SetFocus;
        wCampo:='';
      End;

// Data
      If TipoDado = 3 Then Begin
        EData.Text   := '';
        EData.Visible:=True;
        EData.Left   :=8;
        EData.Top    :=99;
        EData.SetFocus;
      End;
    End;
    btnselecao.visible := true;
End;

procedure TFrmFiltraTabela.LkcTabelasChange(Sender: TObject);
var
Wsql : string;
waux,campo,texto,pedaco : string;
filtro,pegav,pega_as,tipo,v,i,j,k : integer;
vet : array[1..60] of string;
begin
  inherited;
  btnselecao.visible := false;
  WglobalNumFiltro := QrySelecionaTabela['IDFILTRO']; // PEGA UM  filtro JÁ criado
// Mudou a Tabela Escolhida Zera os Dados Já Esclhidos
  LstIdCamposBd.Clear;
  LstCampos.Clear;
  LstResult.Clear;
  LstSql.Clear;
  LstCamposBd.Clear;
  LstRelacao.Clear;
// Tipos
  EConteudo.Visible:=False;
  EOrdem.Visible := False;
  EData.Visible    :=False;
  RgMF.Visible     :=False;
  RgEstCiv.Visible :=False;
  RgVF.Visible     :=False;
  BtnIncluir.Enabled:=False;
  BtInsOrdem.Enabled:=False;
  BtnExcluir.Enabled:=False;
  BtExcOrdem.Enabled:=False;

// Textos
  LblTexto.Caption := 'Filtro';
  LblSinal.Caption := '   ';
// Limpa Dados do Filtro
  RgFiltros.ItemIndex:=-1;
  RgOrdem.ItemIndex := -1;

  texto :=  QrySelecionaTabela['montasql'] ;
  SQLOriginal := texto;
  //limpar vetor
  for j:= 1 to 60 do
    vet[j] := '';

  waux := ' ';
  tipo := pos('as',texto);
  if tipo = 0 then begin
   tipo := pos('AS',texto);
   if tipo <> 0 then waux := 'AS';
  end
  else
   waux := 'as';

  if tipo = 0 then begin
   i := pos('FROM',texto);  //ANTES ERA SÓ <F>
   pedaco := copy(texto,8,i-9);
   k := 1;
   for j:= 1 to 60 do begin
    i := pos(',',pedaco);
    if i = 0 then  begin
     vet[j] := pedaco;
     break;
    end;
    vet[j] := copy(pedaco,1,i-1);
    v := length(pedaco);
    k := i+1;
    pedaco := copy(pedaco,k,v);
   end;
  end
  else begin
   i := pos('FROM',texto);  //ANTES ERA SÓ <F>
   pedaco := copy(texto,8,i-9);
   k := 1;
   pegav := 0;
   for j:= 1 to 60 do begin
    pegav := pos('V'+inttostr(j),pedaco);
    if pegav <> 0 then
     vet[j] := 'V'+inttostr(j);
   end;
  end;

  Wsql := 'SELECT * FROM '+sistema.PrefixoServidor+'TBCAMPOPART WHERE (';
  for k:= 1 to (j - 1) do begin
   if vet[k] <> '' then
    Wsql := Wsql + 'RELACAO = '+''''+vet[k]+ '''' +' OR ';
  end;
  Wsql := copy(Wsql,1,length(Wsql) - 3);
  Wsql := Wsql + ') AND (IDTABELA = '+ inttostr(QrySelecionaTabela['IDTABELA'])+')'+
          ' ORDER BY RELACAO';
// Dispara Query que Mostra Campos
  with QryMostraCampos do begin
   Close;
   UnPrepare;
   sql.clear;
   sql.add(Wsql);
   Prepare;
   Open;
  end;
// Inclui Campos Na Lista
  While Not QryMostraCampos.EOF Do
    Begin
// Ids dos Campo
      LstIdCamposBd.Items.Add(QryMostraCampos.FieldByname('IDCAMPO').AsString);
// Campo Real
      LstCamposBd.Items.Add(QryMostraCamposDESCRICAO.Value);
// Descricao do campo
      LstCampos.Items.Add(QryMostraCamposDESCRICAO.Value);
// Relação dos campos (V1, V2, V3 - nome verdadeiro do campo
      LstRelacao.Items.Add(QryMostraCampos.FieldByname('RELACAO').AsString) ;
      QryMostraCampos.Next;
    End;
// Fecha Query
  QryMostraCampos.Close;
  QryMostraCampos.Unprepare;

  filtro :=  QrySelecionaTabela['IDFILTRO'];
// Preenche Formulário com as Linhas da Query
// Fecha a Query
  QryExistentes.Close;
  QryExistentes.SQL.Clear;
  QryExistentes.SQL.Add('SELECT LINHA,LINHASQL ');
  QryExistentes.SQL.Add('FROM '+sistema.PrefixoServidor+'FILTROSATUARIAIS ');
  QryExistentes.SQL.Add('WHERE IDFILTRO  = :params0');
  QryExistentes.params[0].asinteger := filtro;
// Abre a Query
  Try
    QryExistentes.Open;
  Except
    ShowMessage('Tabela sem filtros.');
  End;
 QryExistentes.First;
 if not(QryExistentes.eof) then begin
  // Com o Filtro Setado Faz Enquanto = (Preenche a tela)
   While Not QryExistentes.EOF Do Begin
  // Inclui Resultado no LstBox
     if QryExistentes['LINHA'] <> ' ' then
      LstResult.Items.Add(QryExistentes['LINHA']);
  // Inclui Resultado no LstBox
     if QryExistentes['LINHASQL'] <> ' ' then
      LstSql.Items.Add(QryExistentes['LINHASQL']);
     QryExistentes.Next;
   End;
  end;
  // Fecha a Query
  QryExistentes.Close;
  btnexistentes.visible := true;
end;

Procedure TFrmFiltraTabela.LstCamposClick(Sender: TObject);
begin
  Inherited;
  lstCampos.hint := 'Campo '+inttostr(lstcampos.itemindex + 1);
// Limpa Dados do Filtro
  RgFiltros.ItemIndex := -1;
  RgOrdem.ItemIndex   := -1;
// Textos
  LblTexto.Caption := 'Filtro';
  LblSinal.Caption := '  ';
// Tipos
  op1.Checked := false;
  op2.Checked := false;
  op3.Checked := false;
  op4.Checked := false;
  EConteudo.Visible:=False;
  EData.Visible    :=False;
  RgMF.Visible     :=False;
  RgEstCiv.Visible :=False;
  RgVF.Visible     :=False;
  BtnIncluir.Enabled:=False;
  BtInsOrdem.Enabled:=False;
  BtnExcluir.Enabled:=False;
  BtExcOrdem.Enabled:=False;
end;

procedure TFrmFiltraTabela.BtnIncluirClick(Sender: TObject);
begin
 EscolheOperador('','');
end;

procedure TFrmFiltraTabela.EscolheOperador(operadorlinha,operadorSQL : string);
Var
wLinha,wFiltro,wFSql,wLBS:String;
begin
  inherited;
// Muda o Valor de Acordo com a Opcao
  wFiltro:=' ';  // Zera Filtro
  wFSql  :=' ';  // Zera Filtro
// Caso eConteudo Vazio
  If (EConteudo.Visible=True) and (EConteudo.Text='') Then Exit;

// Caso Texto Acrecensta Plics
  If (EConteudo.Text <> '') Then Begin
      wFiltro:=EConteudo.Text;
// Caso String e Sinal = (Igual) Utiliza "LIKE"
    If (EConteudo.Text <> '')   And
       (QryBuscaCampo['Tipo'] = 2) And
       (LblSinal.Caption=' = ') Then
      wFSql  :=''''+EConteudo.Text+'''';

// Caso Numerico
    If (EConteudo.Text <> '') And
       (QryBuscaCampo['Tipo'] = 1) Then
      wFSql  :=EConteudo.Text;
  End;

// Caso MASC/FEM Vazio
  If (RgMF.Visible=True) and (RgMF.ItemIndex=-1) Then Exit;
// Caso MASC/FEM
  Case RgMF.ItemIndex Of
    0 : Begin
          wFiltro :='Feminino';
          wFSql   :=''''+'F''';
        End;
    1 : Begin
          wFiltro :='Masculino';
          wFSql   :=''''+'M''';
        End;
  End;

// Caso VERD/FALSE Vazio
  If (RgVF.Visible=True) and (RgVF.ItemIndex=-1) Then Exit;
// Caso VERD/FALSE
  Case RgVF.ItemIndex Of
    0 : Begin
          wFiltro :='Verdadeiro';
          wFSql   :=''''+'0''';
        End;
    1 : Begin
          wFiltro :='Falso';
          wFSql   :=''''+'1''';
        End;
  End;

// Caso Estado Civil Vazio
  If (RgEstCiv.Visible=True) and (RgEstCiv.ItemIndex=-1) Then Exit;
// Caso Estado Civil
  Case RgEstCiv.ItemIndex Of
    0 : Begin
          wFiltro :='Solteiro';
          wFSql   :=''''+'S''';
        End;
    1 : Begin
          wFiltro :='Casado';
          wFSql   :=''''+'C''';
        End;
    2 : Begin
          wFiltro :='Divorciado';
          wFSql   :=''''+'D''';
        End;
    3 : Begin
          wFiltro :='Viúvo';
          wFSql   :=''''+'V''';
        End;
  End;
// Caso Data Vazio
  If (EData.Visible=True) and (EData.Text='') Then Exit;
// Caso Data
  If EData.Text <> '' Then
    //andre ver
    Begin
      wFiltro:=EData.Text;
      wFSql  :=EData.Text;
      wFSQL  :=FormatDateTime('dd/mm/yyyy',StrToDate(EData.Text));
      wFSQL  :=''''+wFSQL+'''';
    End;
// Inclui seleção na Lista de Textos
  wLinha:=LstCampos.Items[LstCampos.ItemIndex]+
          LblSinal.Caption+wFiltro;
// Caso String e Sinal = (Igual) Utiliza LIKE = "
  If (EConteudo.Text <> '')   And
     (QryBuscaCampo['Tipo'] = 2) And
     (LblSinal.Caption=' = ') Then LblSinal.Caption:=' = ';

// Inclui seleção na Lista
 if (QryBuscaCampo['Tipo'] = 1) then begin
  wLSql:='TO_NUMBER('+QryBuscaCampo['relacao']+')'+
         LblSinal.Caption+' TO_NUMBER('+wFSql+')';
 end;

 if (QryBuscaCampo['Tipo'] = 3) then begin
  wLSql:='TO_DATE('+QryBuscaCampo['relacao']+','+'''dd/mm/yyyy'''+')'+
         LblSinal.Caption+' TO_DATE('+wFSql+','+'''dd/mm/yyyy'''+')';
 end;


 if (QryBuscaCampo['Tipo'] = 2) then begin
  wLSql:=QryBuscaCampo['relacao']+
         LblSinal.Caption+wFSql;
 end;

  wLinha :=wLinha + OperadorLinha;
  wLSql  :=wLSql  + OperadorSQL;

// Inclui Resultado no LstBox
  LstResult.Items.Add(wLinha);
// Inclui Resultado no LstBox
  LstSql.Items.Add(wLSql);

// Desabilita Botão e  Filtros
  BtnIncluir.Enabled:=False;
  RgMF.ItemIndex:=-1;
  RgVF.ItemIndex:=-1;
  RgEstCiv.ItemIndex:=-1;
  EData.Text:='';
  EConteudo.Text:='';
  EConteudo.Visible:=False;
  EData.Visible    :=False;
  RgMF.Visible     :=False;
  RgEstCiv.Visible :=False;
  RgVF.Visible     :=False;
// Textos
  LblTexto.Caption := 'Filtro';
  LblSinal.Caption := '   ';
// Limpa Dados do Filtro
  RgFiltros.ItemIndex:=-1;
end;

procedure TFrmFiltraTabela.LstResultClick(Sender: TObject);
begin
  inherited;
// Selecionado Liga Botão de Excluir
  If (LstResult.ItemIndex < 0) Then Exit;
    Begin
      BtnExcluir.Enabled:=True;
      op1.checked := false;
      op2.checked := false;
      op3.checked := false;
      op4.checked := false;
    End;
end;

procedure TFrmFiltraTabela.BtnExcluirClick(Sender: TObject);
begin
  inherited;
// Botão de Excluir
  LstSql.Items.Delete(LstResult.ItemIndex);
  LstResult.Items.Delete(LstResult.ItemIndex);
  BtExcOrdem.Enabled:=False;
end;

procedure TFrmFiltraTabela.bbtnConfirmarClick(Sender: TObject);
Var
  k,I,j:Integer;
  inclusao,wdescricao,wclassname,wSQL,wNomeFiltro:String;
begin
  inherited;
//----------------------------------------------
// Botão de Confirmar, Cria e Guarda o Filtro
//----------------------------------------------
  // Pede Nome de Referencia do Filtro
  wNomeFiltro:=InputBox('Sistema Atuarial','Nome de Referência ao Filtro ',QrySelecionaTabela['descricaoFILTRO']);
  If wNomeFiltro = '' Then Begin
    Exit;
  End;

 // Verifica se Já existe Filtro
  With QryAux Do Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM '+sistema.PrefixoServidor+'TABFILTROSQL ');
    SQL.Add('WHERE UPPER(DESCRICAOFILTRO) = UPPER('''+wNomeFiltro+''')');
    Open;
    If (Eof=False) {and (LstSql.Items.Count = 0)}  Then Begin
      ShowMessage('Esta tabela já existe!!!');
      Close;
      Exit
    End;
  End;

 if  WglobalNumFiltro = - 1 then begin // irá gravar um novo conjunto de filtros
  With QryAux Do Begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT IDFILTRO AS IDATUAL FROM '+sistema.PrefixoServidor+'FILTROSATUARIAIS');
     SQL.Add('ORDER BY IDFILTRO DESC');
     Open;
     First;
  End;
  if QryAux.eof then
     j:= 1
  else
     j := QryAux.FieldByName('IDATUAL').AsInteger+1;   // irá criar um novo <idfiltro>

 end
 else
   j := WglobalNumFiltro; // mantem o filtro já criado

  With TabFiltro Do Begin
    Try
      Open;
    Except
      On E: Exception Do Begin
        ShowMessage('Erro, Problema na Tabela de descrição de filtros.'+
                    #13+'Com a Mensagem, '+#13+
                    #13+E.Message+#13);
        Exit;
      End;
    End;
    append;
    Tabfiltro['idtabela']        :=  qrySelecionatabela['idtabela'];
    Tabfiltro['idfiltro']        := j;
    Tabfiltro['descricaofiltro'] := uppercase(wNomeFiltro);
    Tabfiltro['montasql']        := SqlFinal;
    post;
    close;
  End;

  try
     QryFiltros.Open;
   Except
     On E: Exception Do Begin
      ShowMessage('Erro, Problema na abertura da Tabela de definição de filtros.'+
                    #13+'Com a Mensagem, '+#13+
                    #13+E.Message+#13);
      Exit;
     end;
  End;

  if  WglobalNumFiltro = - 1 then begin // irá gravar um novo conjunto de filtros
   For I :=0 To LstSql.Items.Count -1 Do Begin
      QryFiltros.Append;
      QryFiltros.FieldByName('IDFILTRO').AsInteger := j;
      QryFiltros.FieldByName('LINHA').AsString     :=LstResult.Items[I];
      QryFiltros.FieldByName('LINHASQL').AsString  :=LstSql.Items[I];
      QryFiltros.Post;
   End;
  end;

   // grava na tab DATAVIEW PARA POSTERIOR USO DO GERADOR DE RELATÓRIOS
   // TEMPLATE associado a variável WstrDataview
  k := LeUltRegistro(nil,'DATAVIEW');
  wclassname := 'TDvQryManual';
  Wdescricao := 'Atuarial';
  with QryAux do begin
     close;
     requestlive := true;
     sql.clear;
     sql.add('SELECT IDDATAVIEW,NAME,CLASSNAME,ORIGEMCMDV,CLASSDESCRIPTION,TEMPLATE ');
     sql.add('FROM '+sistema.PrefixoServidor+'DATAVIEW');
     Try
      Open;
     Except
      On E: Exception Do Begin
       ShowMessage('Erro, Problema na gravação da Tabela de definição de relatórios.'+
                    #13+'Com a Mensagem, '+#13+
                    #13+E.Message+#13);
       Exit;
      End;
     End;
     Append;
     QryAux['IDDATAVIEW'] := K;
     QryAux['NAME'] := WNomeFiltro;
     QryAux['CLASSNAME'] := WClassname;
     QryAux['ORIGEMCMDV'] := 0;
     QryAux['CLASSDESCRIPTION'] := WDescricao;
     QryAux['TEMPLATE'] := SQLFinal;
     Post;
     close;
     requestlive := false;
  end;

  If (LstSql.Items.Count = 0)  Then
    showmessage('Não foi feito nenhum filtro na tabela selecionada')
  else begin
   showmessage('Gravação dos filtros concluída !');
    Try
     with QrySelecionaTabela do begin
      sql.clear;
      sql.add('SELECT IDTABELA,IDFILTRO,DESCRICAOFILTRO,MONTASQL ');
      sql.add('FROM '+sistema.PrefixoServidor+'TABFILTROSQL ORDER BY IDTABELA,IDFILTRO');
      open;
     end;
    Except
     ShowMessage('Erro, nenhum Filtro existente, Verifique !!!');
     Exit;
    End;
   end;

 // Fecha Querys
  QryFiltros.Close;
  QryAux.Close;
// inibe botão OK
  bbtnConfirmar.enabled := false;
End;

procedure TFrmFiltraTabela.FormShow(Sender: TObject);
begin
  inherited;
// Abre Seleciona Tabelas
  QrySelecionaTabela.Prepare;
  QrySelecionaTabela.Open;
// Seta Pagina para 1
  Paginas.ActivePage:=Pg1;
// Seta Focus
  LkcTabelas.SetFocus;
// inibe botão de OK
  bbtnConfirmar.enabled := false;
// inibe botão de filtros existentes;
  btnexistentes.visible := false;
end;

procedure TFrmFiltraTabela.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Botao de Cancelar Zera os Dados Já Esclhidos
  LkcTabelas.Text:='';
  LstCampos.Clear;
  LstResult.Clear;
  LstSql.Clear;
  LstCamposBd.Clear;
  btnexistentes.visible := false;
// Tipos
  op1.Checked := false;
  op2.Checked := false;
  op3.Checked := false;
  op4.Checked := false;
  EConteudo.Visible:=False;
  EData.Visible    :=False;
  RgMF.Visible     :=False;
  RgEstCiv.Visible :=False;
  RgVF.Visible     :=False;
// Textos
  LblTexto.Caption := 'Filtro';
  LblSinal.Caption := '   ';
// Limpa Dados do Filtro
  RgFiltros.ItemIndex:=-1;
// Volta a Pagina 1
  Paginas.ActivePage:=Pg1;
end;

procedure TFrmFiltraTabela.BtnFiltrarClick(Sender: TObject);
Var
  I:Integer;
  wSQL:String;
begin
  inherited;
//----------------------------------------------
// Botão de Filtrar, Executa o Filtro e Mostra Resultado
//----------------------------------------------

// Caso nao tenha sido selecionada uma Tabela ..
  If LkcTabelas.Text='' Then Begin
      ShowMessage('Nenhuma Tabela foi Selecionada !!!');
      Exit;
  End;

  If (LstSql.Items.Count <> 0)  Then begin
   // aqui determina se o filtro montado será gravado
   // em caso afirmativo será criado um novo <idfiltro> para o conjunto criado
   // -1 indica filtro novo
   if MsgDlg('Deseja criar um filtro novo ?', 'Se o filtro já existe não é necessário recriá-lo!', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
    WglobalNumFiltro := - 1;
   // Monta Linha de SQL (Filtros)
   For I :=0 To LstSql.Items.Count -1 Do Begin
    wSQL:= wSQL+LstSql.Items[I];
   End;
  end
  // no caso de nenhum filtro ser criado o idfiltro permanescerá o criado
  // na seleção dos campos
  else begin
   wSQL:= '';
  end;

// Monta Tabela a ser Fitrada
   MontaTabela(QrySelecionaTabela['IdTabela'],wSQL);

  Try
// Alimenta a propriedade Filter para Filtrar o Arquivo
// Esconde PgragressBar e Mostra Resultado do Filtro
    Panel2.Visible:=False;
    Paginas.ActivePage:=Pg2;
  Except
    ShowMessage('Erro, Tabela não Filtrada, Verifique !!!');
    Exit;
  End;
// Esconde PgragressBar
  PrgBar1.Position :=0;
  Label7.Caption   :='Aguarde, Gerando Tabela .....';
  Panel2.Visible   :=False;
  bbtnConfirmar.enabled := true;
end;

procedure TFrmFiltraTabela.EConteudoKeyPress(Sender: TObject;
  var Key: Char);
Begin
  Inherited;
// Caso Filtro Numerico e Letra Teclada ..
  If (QryBuscaCampo['Tipo'] = 1) Then
    Begin
// Transforma , em .
      If Key=',' Then Key:='.';
// Testa se Tecla é Valida
      If (Pos(Key,'0123456789.,')=0) And (Key <> #8) Then
        Begin
          ShowMessage('Caracter não Permitido neste Tipo de Campo');
          Key:=#0;   // Tranforma Tecla em Nulo
        End;
    End;
End;

procedure TFrmFiltraTabela.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha Querys
  QrySelecionaTabela.Close;
  QrySelecionaTabela.Unprepare;
  QryFiltros.Close;
  QryFiltros.Unprepare;
  QryBuscaCampo.Close;
  QryBuscaCampo.Unprepare;
  QryMostraCampos.Close;
  QryMostraCampos.Unprepare;
  QrySQL.Close;
  QrySQL.Unprepare;
end;


//-----------------------------------------------------------------
// Extrai Dados da Tabela Genérica e Monta Tabela a ser Filtrada
Function TFrmFiltraTabela.MontaTabela(wTabela:Integer;filtro:string):String;
Var
  posFrom,i,indice : Integer;
  ParteOrdena,montasql,wValInt,wLinha,wSqlAdd : String;
  hora,min,seg,mseg : word;
Begin
   // Marca Tamanho da ProgressBar e Visualisa
    PrgBar1.Max   := 60 ;
    Panel2.Visible:=True;
    Label7.Caption:='Aguarde, Gerando Tabela .....';
    Label7.Update;
    decodetime(time,hora,min,seg,mseg);
    PrgBar1.Position:= seg;  // Incrementa ProgressBar em segundos
    ParteOrdena := '';
    if filtro <> '' then begin
     indice := pos('ORDER BY',Filtro);
     if indice = 2 then begin  // neste caso não há condições, só ordenação
      delete(Filtro,length(Filtro),1);
      ParteOrdena := Filtro;
      Filtro := '';
     end
     else begin
      if indice > 2 then begin
      ParteOrdena := copy(Filtro,indice,length(Filtro)-(indice - 1));
      delete(ParteOrdena,length(ParteOrdena),1);
      Filtro      := copy(Filtro,1,indice - 1);
      end;
     end;
    end;
    posFrom := pos('FROM',SQLOriginal);
    montasql := copy(SQLOriginal,1, (posFrom - 1 ) );

    if filtro <> '' then begin
     MontaSQL := Copy(MontaSQL,0,Length(MontaSQL)-1)+' FROM '+sistema.PrefixoServidor+'TBVALPART WHERE ' + filtro;
     MontaSql := MontaSql + ' AND IDTABELA = '+ inttostr(wtabela);
    end
    else  // tabela sem filtros
     MontaSQL := Copy(MontaSQL,0,Length(MontaSQL)-1)+
                 ' FROM '+sistema.PrefixoServidor+'TBVALPART WHERE IDTABELA = ' + inttostr(wtabela);

    if ParteOrdena <> '' then
     MontaSQL := MontaSQL + ' '+ ParteOrdena ;

    SqlFinal := MontaSql; // passa a SQL toda montada para variável global
    wSqlAdd  := MontaSQL;

  decodetime(time,hora,min,seg,mseg);
  PrgBar1.Position:= seg;  // Incrementa ProgressBar em segundos

// Monta a Query e Abre \\
  QrySQL.Close;
  QrySQL.SQL.Clear;
  QrySQL.SQL.Add(wSqlAdd);
// Tenta Abrir a Query
  Label7.Caption:='Aguarde, Preparando Resultado .....';
  Label7.Update;
  Try
    QrySQL.Open;
  Except
    ShowMessage('Tabela não Gerada, Verifique !!!');
    // Esconde ProgressBar
    Panel2.Visible:=False;
  End;
  Showmessage('Foram selecionados '+ inttostr(QrySQL.recordcount)+' registros');
//-- Fim da Montagem da Query  --\\

End;

//--------------------------------------------------
// Preenche a Tela com os Dados do Filtro Já Existente
Procedure TFrmFiltraTabela.BtnExistentesClick(Sender: TObject);
Var
  wFiltro,wTabela : integer;
  parte1,parte2 : string;
Begin
  Inherited;
// Preenche a Query (Busca os Filtros)
  QryExistentes.SQL.Clear;
  QryExistentes.SQL.Add('SELECT B.IDFILTRO,B.LINHA,B.LINHASQL ');
  QryExistentes.SQL.Add('FROM '+sistema.PrefixoServidor+'FILTROSATUARIAIS B ');
  QryExistentes.SQL.Add('WHERE B.LINHA  <> :params0');
  QryExistentes.params[0].asstring := ' ';
  QryExistentes.SQL.Add('ORDER BY B.IDFILTRO');
// Abre a Query
  Try
    QryExistentes.Open;
  Except
    ShowMessage('Problema na tabela de filtros atuariais.Avise ao responsável');
    Exit;
  End;
  if QryExistentes.recordcount = 0 then
   ShowMessage('Não existem filtros criados');
// Executa procura
  if SelDlg1.Execute then begin

  wFiltro:=QryExistentes.FieldByname('IDFILTRO').Asinteger;{String;}
  WglobalNumFiltro := WFiltro;
// Preenche Formulário com as Linhas da Query
// Fecha a Query
  QryExistentes.Close;
  QryExistentes.SQL.Clear;
  QryExistentes.SQL.Add('SELECT LINHA,LINHASQL ');
  QryExistentes.SQL.Add('FROM '+sistema.PrefixoServidor+'FILTROSATUARIAIS ');
  QryExistentes.SQL.Add('WHERE IDFILTRO  = :params0');

  QryExistentes.params[0].asinteger := wFiltro;
// Abre a Query
  Try
    QryExistentes.Open;
    QryExistentes.First;
  Except
    ShowMessage('Tabela sem filtros.');
    QryExistentes.Close;
    Exit;
  End;

 if not(QryExistentes.eof) then begin
  // Com o Filtro Setado Faz Enquanto = (Preenche a tela)
   While Not QryExistentes.EOF Do Begin
  // Inclui Resultado no LstBox
     LstResult.Items.Add(QryExistentes['linha']);
  // Inclui Resultado no LstBox
     LstSql.Items.Add(QryExistentes['LINHASQL']);
    QryExistentes.Next;
   End;
  // Fecha a Query
   QryExistentes.Close;
 end;

 end; // do execute seldlg1

End;

procedure TFrmFiltraTabela.DBComboExistentesChange(Sender: TObject);
var
parte : string;
begin
  inherited;
  Try
    QryExistentes.Open;
  Except
    ShowMessage('Erro, nenhum Filtro existente, Verifique !!!');
    Exit;
  End;
  parte := QryExistentes['linha'];
end;

procedure TFrmFiltraTabela.OpColocaClick(Sender: TObject);
begin
  inherited;
 if op1.Checked then begin
  if lstresult.itemindex <> - 1 then begin
     lstresult.items.strings[lstresult.itemindex] := '(' +
             lstresult.items.strings[lstresult.itemindex];
     lstsql.items.strings[lstresult.itemindex] := '(' +
             lstsql.items.strings[lstresult.itemindex];
  end;
 end;

 if op2.Checked then begin
   if lstresult.itemindex <> - 1 then begin
      lstresult.items.strings[lstresult.itemindex] :=
             lstresult.items.strings[lstresult.itemindex]+')';
      lstsql.items.strings[lstresult.itemindex] :=
             lstsql.items.strings[lstresult.itemindex]+')';
   end;
 end;

 if op3.Checked then begin
    if lstresult.itemindex <> - 1 then begin
      lstresult.items.strings[lstresult.itemindex] :=
             lstresult.items.strings[lstresult.itemindex]+' e ';
      lstsql.items.strings[lstresult.itemindex] :=
             lstsql.items.strings[lstresult.itemindex]+' AND ';
    end;
 end;

 if op4.Checked then begin
   if lstresult.itemindex <> - 1 then begin
      lstresult.items.strings[lstresult.itemindex] :=
             lstresult.items.strings[lstresult.itemindex]+' ou ';
      lstsql.items.strings[lstresult.itemindex] :=
             lstsql.items.strings[lstresult.itemindex]+' OR ';
   end;
 end;

end;

procedure TFrmFiltraTabela.OpTiraClick(Sender: TObject);
var
posicao : integer;
texto : string;
begin
  inherited;
 if op1.Checked then begin
  if lstresult.itemindex <> - 1 then begin
     posicao := pos('(',lstresult.items.strings[lstresult.itemindex]);
     texto := lstresult.items.strings[lstresult.itemindex] ;
     delete(texto,posicao,1);
     lstresult.items.strings[lstresult.itemindex] := texto;

     posicao := pos('(',lstsql.items.strings[lstresult.itemindex]);
     texto := lstsql.items.strings[lstresult.itemindex];
     delete(texto,posicao,1);
     lstsql.items.strings[lstresult.itemindex] := texto;
  end;
 end;

 if op2.Checked then begin
   if lstresult.itemindex <> - 1 then begin
     posicao := pos(')',lstresult.items.strings[lstresult.itemindex]);
     texto := lstresult.items.strings[lstresult.itemindex] ;
     delete(texto,posicao,1);
     lstresult.items.strings[lstresult.itemindex] := texto;

     posicao := pos(')',lstsql.items.strings[lstresult.itemindex]);
     texto := lstsql.items.strings[lstresult.itemindex] ;
     delete(texto,posicao,1);
     lstsql.items.strings[lstresult.itemindex] := texto;
   end;
 end;

 if op3.Checked then begin
    if lstresult.itemindex <> - 1 then begin
     posicao := pos(' e ',lstresult.items.strings[lstresult.itemindex]);
     texto := lstresult.items.strings[lstresult.itemindex];
     delete(texto,posicao,3);
     lstresult.items.strings[lstresult.itemindex] := texto;
     posicao := pos(' AND ',lstsql.items.strings[lstresult.itemindex]);
     texto := lstsql.items.strings[lstresult.itemindex];
     delete(texto,posicao,5);
     lstsql.items.strings[lstresult.itemindex] := texto;
    end;
 end;

 if op4.Checked then begin
   if lstresult.itemindex <> - 1 then begin
     posicao := pos(' ou ',lstresult.items.strings[lstresult.itemindex]);
     texto := lstresult.items.strings[lstresult.itemindex] ;
     delete(texto,posicao,4);
     lstresult.items.strings[lstresult.itemindex] := texto;
     posicao := pos(' OR ',lstsql.items.strings[lstresult.itemindex]);
     texto := lstsql.items.strings[lstresult.itemindex];
     delete(texto,posicao,4);
     lstsql.items.strings[lstresult.itemindex] := texto;
   end;
 end;

end;

procedure TFrmFiltraTabela.op1Click(Sender: TObject);
begin
  inherited;
 op2.Checked := false;
 op3.Checked := false;
 op4.Checked := false;
end;

procedure TFrmFiltraTabela.op2Click(Sender: TObject);
begin
  inherited;
 op1.Checked := false;
 op3.Checked := false;
 op4.Checked := false;

end;

procedure TFrmFiltraTabela.op3Click(Sender: TObject);
begin
  inherited;
 op1.Checked := false;
 op2.Checked := false;
 op4.Checked := false;

end;

procedure TFrmFiltraTabela.op4Click(Sender: TObject);
begin
  inherited;
 op2.Checked := false;
 op3.Checked := false;
 op1.Checked := false;
end;

procedure TFrmFiltraTabela.bbtnSairClick(Sender: TObject);
begin
  inherited;
  op1.Checked := false;
  op2.Checked := false;
  op3.Checked := false;
  op4.Checked := false;
end;

procedure TFrmFiltraTabela.BitBtn1Click(Sender: TObject);
begin
  inherited;
   FrmCadRelatorios := TFrmCadRelatorios.create(self);
   FrmCadRelatorios.Show;
End;

procedure TFrmFiltraTabela.RgOrdemClick(Sender: TObject);
var
indice : integer;
nome : string;
begin
  inherited;
  If (LstCampos.ItemIndex < 0)   Or
      (LstCampos.Items.Count < 0) Then Begin
     ShowMessage('Campo deve ser Selecionado ');
     Exit;
  End;

  nome := LstRelacao.Items[LstCampos.ItemIndex];
  Case RgOrdem.ItemIndex of
     0 : {ORDENA POR}
     Begin
       EOrdem.Visible := true;
       if pos('Ordem',EOrdem.text) = 0 then
        EOrdem.text := 'Ordem :';
     End;
     1 : {TRATAMENTO DE CAMPO DATA}
     Begin
      if pos('Ordem',EOrdem.text) <> 0 then begin
         EOrdem.text := EOrdem.text +' #';
      end;
     End;

     2 : {CRESCENTE}
     Begin
      if pos('Ordem',EOrdem.text) <> 0 then begin
        EOrdem.text := EOrdem.text + nome+' ASC,';
      end;
     End;
     3 : {DECRESCENTE }
     Begin
      if pos('Ordem',EOrdem.text) <> 0 then begin
        EOrdem.text := EOrdem.text + nome+' DESC,';
      end;
     End;
    End;

    if EOrdem.text <> ''then
     BtInsOrdem.enabled := true;
end;

procedure TFrmFiltraTabela.BtInsOrdemClick(Sender: TObject);
var
numero,txdata,texto,parte1,parte2 : string;
valor,code,indice,tamanho : integer;
begin
  inherited;
  if EOrdem.text <> '' then begin
   texto := EOrdem.text;
   BtInsOrdem.enabled := false;
   // Inclui Resultado no LstBox
   LstResult.Items.Add(texto);
   // Prepara o texto para o padrão SQL
   // Primeiro : procurar campos de data : vem com <#> na frente
   parte1 := texto;
   indice := pos('#',texto);
   While indice > 0 do begin
    // pega o número do campo
    val(copy(texto,indice+2,2),valor,code);
    if code = 0 then // são 2 números
     numero := copy(texto,indice+1,3)
    else
     numero := copy(texto,indice+1,2);
    txdata :='TO_DATE('+numero+','+'''DD/MM/YYYY'''+')';
    // deleta o <#>
    if code = 0 then
     delete(texto,indice,4)
    else
     delete(texto,indice,3);
    insert(txdata,texto,indice);
    indice := pos('#',texto);
   end;

   indice := pos('Ordem :',texto);
   delete(texto,indice,7);

   texto := ' ORDER BY ' + texto;


   // Inclui Resultado no LstBox
   LstSql.Items.Add(texto);

   BtexcOrdem.enabled := true;
   EOrdem.text := '';
  end;

  RgOrdem.ItemIndex := -1;

end;

procedure TFrmFiltraTabela.btnselecaoClick(Sender: TObject);
const
tabelas : array[1..14] of string[60] = ('Tipo de Plano',
                                       'Tipo de Contribuição',
                                       'Tipo de Benefício',
                                       'Tipo de Cargo',
                                       'Situação do Participante discriminada',
                                       'Situação do Participante consolidada',
                                       'Situação do Empregado na Patrocinadora',
                                       'Patrocinadoras',
                                       'Patrocinadoras - Subdivisões',
                                       'Situação do Benefício',
                                       'Contas de Reservas Individuais',
                                       'Contas de Reservas Coletivas',
                                       'Tipos de Dependentes',
                                       'Situação do tipo de benefício');

var
i : integer;
begin
  inherited;
  listatipos.visible := false;
  listaselecionados.Clear;
  for i:= 1 to 13 do
   listaselecionados.Items.Add(tabelas[i]);
  listaselecionados.visible := true;
end;
procedure TFrmFiltraTabela.listaselecionadosClick(Sender: TObject);
var
num,code : integer;
montasql : string;
begin
  inherited;
  case listaselecionados.itemindex of
   0:  montasql := 'SELECT IDPLANOPREV AS ID1,NOME  FROM '+sistema.PrefixoServidor+'PLANPREV ORDER BY IDPLANOPREV';
   1:  montasql := 'SELECT IDCONTRIBUICAO AS ID1,NOME FROM '+sistema.PrefixoServidor+'CONTRIBUICAO ORDER BY IDCONTRIBUICAO';
   2:  montasql := 'SELECT IDBENEFICIO AS ID1,NOME FROM '+sistema.PrefixoServidor+'BENEFICIO ORDER BY IDBENEFICIO';
   3:  montasql := 'SELECT IDCARGO AS ID1,TITULO AS NOME FROM '+sistema.PrefixoServidor+'CARGO ORDER BY IDCARGO';
   4:  montasql := 'SELECT IDSITPART AS ID1,DESCRICAO AS NOME FROM '+sistema.PrefixoServidor+'SITPART ORDER BY IDSITPART';
   5:  montasql := 'SELECT IDSITPLANOPREV AS ID1,DESCRICAO AS NOME FROM '+sistema.PrefixoServidor+'SITPLANOPREV ORDER BY IDSITPLANOPREV';
   6:  montasql := 'SELECT IDSITFUNC AS ID1,DESCRICAO AS NOME FROM '+sistema.PrefixoServidor+'SITFUNC ORDER BY IDSITFUNC';
   7:  montasql := 'SELECT IDPESSOA AS ID1,NOME FROM '+sistema.PrefixoServidor+'PESSOA WHERE FLGPATROCINADORA = 1 ORDER BY IDPESSOA';
   8:  montasql := 'SELECT IDFILIAL AS ID1,DESCFILIAL AS NOME FROM '+sistema.PrefixoServidor+'FILIAL ORDER BY IDFILIAL';
   9:  montasql := 'SELECT IDSITBENEFICIO AS ID1,DESCRICAO AS NOME FROM '+sistema.PrefixoServidor+'SITBENEFICIO ORDER BY IDSITBENEFICIO';
  10:  montasql := 'SELECT IDTIPORESERVA AS ID1,NOME FROM '+sistema.PrefixoServidor+'RESERVAXPLANO WHERE FLGCOLETIVA = 0 ORDER BY IDTIPORESERVA';
  11:  montasql := 'SELECT IDTIPORESERVA AS ID1,NOME FROM '+sistema.PrefixoServidor+'RESERVAXPLANO WHERE FLGCOLETIVA = 1 ORDER BY IDTIPORESERVA';
  12:  montasql := 'SELECT IDDEPENDENCIA AS ID1,DESCRICAO AS NOME FROM '+sistema.PrefixoServidor+'DEPEN ORDER BY IDDEPENDENCIA';
  13:  montasql := 'SELECT IDBENEFICIO AS ID1,NOME FROM '+sistema.PrefixoServidor+'BENEFICIO ORDER BY IDBENEFICIO';
  end;
  listaselecionados.visible := false;
  listatipos.clear;
  listaCodSelecionados.clear;
  With QryAux Do Begin
    Close;
    SQL.Clear;
    SQL.Add(montasql);
    try
     Open;
    except
     showmessage('Problemas na abertura da tabela');
     close;
     exit;
    end;
    If (Eof)  Then Begin
      ShowMessage('Esta tabela está vazia !!');
      Close;
      Exit;
    End;

    first;
    while not qryaux.EOF do begin
    listatipos.Items.Add(qryaux['NOME']);
    val(qryaux['ID1'],num,code);
    if code = 0 then
     listaCodSelecionados.items.add(inttostr(qryaux['ID1']))
    else
     listaCodSelecionados.items.add(qryaux['ID1']);
    qryaux.Next;
    end;
    close;
    listatipos.visible := true;
  End;


end;

procedure TFrmFiltraTabela.ListatiposClick(Sender: TObject);
begin
  inherited;
  EConteudo.Text := listaCodSelecionados.Items[listatipos.itemindex];
  listatipos.visible := false;
end;

End.

// FIM DA LISTAGEM \\

