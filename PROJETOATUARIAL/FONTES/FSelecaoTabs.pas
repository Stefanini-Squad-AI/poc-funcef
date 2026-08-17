unit FSelecaoTabs;

//Definição Propprodutor

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, StdCtrls, Buttons, MAHlpBtn, ExtCtrls, DBCtrls, Db, Wwdatsrc,
  DBTables, Wwquery, Grids, DBGrids, Wwdbigrd, Wwdbgrid, Menus, FSairAjuda,
  TB97, TB97Tlbr, wwdblook, IvDictio, IvMulti, IvEMulti;

type
  TfrmSelecaoTabs = class(TfrmSairAjuda)
    dsPlanPatro: TwwDataSource;
    qryCampos: TwwQuery;
    Panel5: TPanel;
    nome2: TLabel;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    nome1: TLabel;
    Descricao: TwwDBGrid;
    EscolheCampos: TListBox;
    campo: TListBox;
    LkcTabelas: TwwDBLookupCombo;
    Label1: TLabel;
    DsSelecionaTabela: TwwDataSource;
    QrySelecionaTabela: TwwQuery;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    total: TBitBtn;
    QryAux: TwwQuery;
    QrySelecionaTabelaDESCRICAO: TStringField;
    QrySelecionaTabelaIDTABELA: TFloatField;
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnDesassociaTodosClick(Sender: TObject);
    procedure dblkplistPlanoMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dblkplistPlanoDragDrop(Sender, Source: TObject; X,Y: Integer);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    procedure DescricaoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrdPlanPatroMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LkcTabelasChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure totalClick(Sender: TObject);
  private
    sTpPlano : string;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecaoTabs: TfrmSelecaoTabs;

implementation

uses
    UMensErro,Usistema,UDataBase,UBibliotecaAtuarial;

{$R *.DFM}

procedure TfrmSelecaoTabs.sbtnDesassociaClick(Sender: TObject);
var
achou : boolean;
i : integer;
begin
  inherited;
  achou := false;
  for i := 0 to (EscolheCampos.Items.Count - 1) do
   if EscolheCampos.Items.strings[i] = qryCampos['descricao'] then begin
    MsgDlg('Esta informação já foi escolhida','Atenção',mtError,[mbOk],0);
    achou := true;
    break;
  end;
  if not(achou) then begin
   EscolheCampos.Items.add(qryCampos['descricao']);
   if qrycampos['tipo'] = 1 then
    Campo.Items.add('TO_NUMBER('+qryCampos['relacao']+ ') AS '+qryCampos['idcampo'])
   else
    if qrycampos['tipo'] = 3 then
     Campo.Items.add('TO_DATE('+qryCampos['relacao']+','+'''dd/mm/yyyy'''+')' + ' AS '+qryCampos['idcampo'])
    else
     Campo.Items.add(qryCampos['relacao']+ ' AS '+qryCampos['idcampo']);
  end;

end;

procedure TfrmSelecaoTabs.sbtnAssociaClick(Sender: TObject);
var
 i : integer;
begin
  inherited;
  i := EscolheCampos.ItemIndex;
  EscolheCampos.items.delete(EscolheCampos.ItemIndex);
  Campo.items.delete(i);
end;

procedure TfrmSelecaoTabs.sbtnDesassociaTodosClick(Sender: TObject);
var
i,j: integer;
achou : boolean;
begin
 inherited;
 j := EscolheCampos.Items.Count - 1;
 qryCampos.first;
 while not(qryCampos.eof) do begin
  achou := false;
  for i := 0 to j do
   if EscolheCampos.Items.strings[i] = qryCampos['descricao'] then begin
    achou := true;
    break;
   end;
  if not(achou) then begin
   EscolheCampos.Items.add(qryCampos['descricao']);
   if qrycampos['tipo'] = 1 then
    Campo.Items.add('TO_NUMBER('+qryCampos['relacao']+ ') AS '+qryCampos['idcampo'])
   else
    if qrycampos['tipo'] = 3 then
     Campo.Items.add('TO_DATE('+qryCampos['relacao']+','+'''dd/mm/yyyy'''+')' + ' AS '+qryCampos['idcampo'])
    else
     Campo.Items.add(qryCampos['relacao']+ ' AS '+qryCampos['idcampo']);
  end;
  qryCampos.next;
 end;
end;

procedure TfrmSelecaoTabs.sbtnAssociaTodosClick(Sender: TObject);
var
  sSql : String;
begin
  inherited;
  EscolheCampos.clear;
  Campo.clear;
end;

procedure TfrmSelecaoTabs.DescricaoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  AFont.Color := clWindowText;
  ABrush.Color := clWindow;

end;

procedure TfrmSelecaoTabs.dblkplistPlanoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Sender is TDBLookUpListBox
  then TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TfrmSelecaoTabs.dblkplistPlanoDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  TwwDbGrid(Sender).EndDrag(True);
  sbtnDesassociaClick(Sender);
end;

procedure TfrmSelecaoTabs.dbgrdPlanPatroMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft
  then if Sender is TwwDBGrid
       then TwwDBGrid(Sender).BeginDrag(True);
end;

procedure TfrmSelecaoTabs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCampos.close;
  qrySelecionaTabela.close;
end;

procedure TfrmSelecaoTabs.LkcTabelasChange(Sender: TObject);
var
i:integer;
anterior : string;
begin
  inherited;
  EscolheCampos.clear;
  Campo.clear;
  if lkctabelas.value <> '' then begin
     descricao.visible := true;
     anterior := lkctabelas.value;
     total.visible := true;
  end;
end;

procedure TfrmSelecaoTabs.FormShow(Sender: TObject);
begin
  inherited;
   qrySelecionaTabela.open;
   qryCampos.open;
   if lkctabelas.value = '' then
     descricao.visible := false;
   total.visible := false;


end;

procedure TfrmSelecaoTabs.bbtnConfirmarClick(Sender: TObject);
var
 k,i,j : integer;
 wclassname,wdescricao,inclusao,wnomeselecao,nome,textosql : string;
 OK : boolean;
begin
  inherited;
  OK := false;
  if EscolheCampos.Items.Count <> 0 then begin
  textosql := 'SELECT ';
  for i := 0 to (Campo.Items.Count - 1) do
   textosql := textosql+Campo.Items.strings[i]+',';
  textosql :=  Copy(textosql,0,Length(textosql)-1)+
               ' FROM '+sistema.PrefixoServidor+'TBVALPART'+
               ' WHERE IDTABELA = '+ inttostr(qrySelecionatabela['idtabela']);

// Pega a Proxima Id a Criar (o idfiltro cresce independente do idtabela)
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

  nome := 'Seleção '+inttostr(j)+' da '+qrySelecionatabela['descricao'];
  OK :=InputQuery('Sistema Atuarial','Nome de Referência da Seleção ',nome);
  if not(OK) then begin
    Showmessage('Seleção abandonada');
    exit;
  end;
  wNomeSelecao := nome;

  if WNomeselecao = '' then begin
    Showmessage('Descrição em branco : Seleção abandonada');
    exit;
  end;

  With QryAux Do Begin
    close;
    requestlive := true;
    sql.clear;
    sql.add('SELECT IDTABELA,IDFILTRO,DESCRICAOFILTRO,MONTASQL FROM '+sistema.PrefixoServidor+'TABFILTROSQL');
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
    QryAux['idtabela']        :=  qrySelecionatabela['idtabela'];
    QryAux['idfiltro']        := j;
    QryAux['descricaofiltro'] := uppercase(wNomeSelecao);
    QryAux['montasql']        := TextoSQL;
    post;
    close;
    requestlive := false;
   End;

   inclusao := 'INSERT INTO '+sistema.PrefixoServidor+'FILTROSATUARIAIS (IDFILTRO,LINHA,LINHASQL) '+
                         ' values ('+inttostr(J)+','+''' '''+','+''' '''+')';
   ExecutaQuery(QryAux,inclusao);

   k := LeUltRegistro(nil,'DATAVIEW');
   wclassname := 'TDvQryManual';
   Wdescricao := 'Atuarial';

   with QryAux do begin
     close;
     requestlive := true;
     sql.clear;
     sql.add('SELECT IDDATAVIEW,NAME,CLASSNAME,ORIGEMCMDV,CLASSDESCRIPTION,TEMPLATE FROM '+sistema.PrefixoServidor+'DATAVIEW ');
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
     QryAux['NAME'] := WNomeSelecao;
     QryAux['CLASSNAME'] := WClassname;
     QryAux['ORIGEMCMDV'] := 0;
     QryAux['CLASSDESCRIPTION'] := WDescricao;
     QryAux['TEMPLATE'] := TextoSQL;
     Post;
     close;
     requestlive := false;
    end;
   showmessage('Seleção dos campos concluída !');
  end
  else
  showmessage('Não ocorreu nenhuma seleção de campos !');

end;

procedure TfrmSelecaoTabs.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  EscolheCampos.clear;
  Campo.clear;
end;

procedure TfrmSelecaoTabs.totalClick(Sender: TObject);
begin
  inherited;
  showmessage('Total de campos selecionados : '+inttostr(escolhecampos.items.count));
end;

end.
