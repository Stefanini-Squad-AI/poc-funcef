unit FpRelVariacoesInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  TB97, StdCtrls, Buttons, ComCtrls, ExtCtrls, Db, Wwdatsrc, DBTables,
  Wwquery, checklst, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  FOkCancelar, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmpRelVariacoesInvest = class(TfrmOkCancelar)
    QryInvestimento: TwwQuery;
    DsInvestimento: TwwDataSource;
    QryTipoInvest: TwwQuery;
    QryTipoInvestIDTIPOINVEST: TFloatField;
    QryTipoInvestDESCTIPOINVEST: TStringField;
    QryTipoTitulo: TwwQuery;
    QryTipoTituloCODTIPTITULO: TStringField;
    QryTipoTituloDESCTITULO: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CkLstInvestimentos: TCheckListBox;
    DateEdit1: TCMDateTimePicker;
    DateEdit2: TCMDateTimePicker;
    RadioGroup1: TRadioGroup;
    DbLkcTipoInvest: TwwDBLookupCombo;
    DbLkcTipoTitulo: TwwDBLookupCombo;
    RgCotacaoPor: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbtnVisualizarClick(Sender: TObject);
    Procedure MontaQueryRelat;
    procedure RadioGroup1Click(Sender: TObject);
    procedure DbLkcTipoInvestChange(Sender: TObject);
    procedure DbLkcTipoTituloChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmpRelVariacoesInvest: TFrmpRelVariacoesInvest;

implementation

Uses UBibliotecaInvest, UMensErro, FDmRelatorios;

Var
  Lista, ListaTipoInvest, ListaTipoTitulo, ListaSelecionados:TStringList;

{$R *.DFM}

procedure TFrmpRelVariacoesInvest.FormShow(Sender: TObject);
begin
  inherited;
  Lista            :=TStringList.Create;
  ListaTipoInvest  :=TStringList.Create;
  ListaTipoTitulo  :=TStringList.Create;
  ListaSelecionados:=TStringList.Create;

  QryTipoInvest.Open;
  QryInvestimento.Open;
  QryTipoTitulo.Open;
// Preenche o ListBox dos Investimentos
  While Not QryInvestimento.EOF Do Begin
    CkLstInvestimentos.Items.Add(QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString);
// Guarda Dados
    Lista.Add(QryInvestimento.FieldByName('IDINVESTIMENTO').AsString);
// Tipo Titulo
    ListaTipoInvest.Add(QryInvestimento.FieldByName('IDTIPOINVEST').AsString);
// Tipo de Titulo
    ListaTipoTitulo.Add(QryInvestimento.FieldByName('TIPOTITULO').AsString);
// Proximo Registro
    QryInvestimento.Next;
  End;
end;

procedure TFrmpRelVariacoesInvest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  QryInvestimento.Close;
  QryTipoInvest.Close;
  QryTipoTitulo.Close;
// Libera Objetos
  Lista.Free;
  ListaSelecionados.Free;
  ListaTipoInvest.Free;
  ListaTipoTitulo.Free;
end;

procedure TFrmpRelVariacoesInvest.rbtnVisualizarClick(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
// Testa parametros
  If (DateEdit1.Text = '') Or (DateEdit2.Text = '') Then Begin
    MsgDlg('Faltam Preencher Dados ','Mensagem do Sistema ',
           mtError,[MbOk],0);
    Exit;
  End;

// Limpa Linha dos Selecionados
  ListaSelecionados.Clear;
// Monta Lista dos Selecionados
  For I:=0 To (CkLstInvestimentos.Items.Count-1) Do Begin
// Caso Checado inclui na lista
    If CkLstInvestimentos.Checked[I] Then Begin
      ListaSelecionados.Add(Lista.Strings[I]+',');
    End;
  End;
// Acerta Final da Linha dos Selecionados
  If (ListaSelecionados.Count) > 0 Then Begin
    ListaSelecionados.Strings[ListaSelecionados.Count-1]:=
      Copy(ListaSelecionados.Strings[ListaSelecionados.Count-1],
           0,Length(ListaSelecionados.Strings[ListaSelecionados.Count-1])-1);
  End Else Begin
// Testa se Investimento foi escolhido
    MsgDlg('Investimentos não foram escolhidos ','Mensagem do Sistema ',
           mtWarning,[MbOk],0);
    Exit;
  End;


  MontaQueryRelat;
// Preenche o Periodo
  DmRelatorios.LbDataInicial.Text := DateEdit1.Text;
  DmRelatorios.LbDataFinal.Text   := DateEdit2.Text;

end;

Procedure TFrmpRelVariacoesInvest.MontaQueryRelat;
Var
  wLinha:String;
Begin
// Monta o SQL da Query
  DmRelatorios.QryRelatConsInvest.SQL.Clear;
// Inicia a Linha
  wLinha :=
    'SELECT IV.IDINVESTIMENTO, IV.DESCINVESTIMENTO, CI.DATACOTACAO, ';
// Tipo de Cotacao
  If RgCotacaoPor.ItemIndex = 0 Then
    wLinha := wLinha + ' CI.VLRCONTABIL, CI.QTDTITLOTE '
  Else
    wLinha := wLinha + ' (CI.VLRCONTABIL/CI.QTDTITLOTE) AS VLRCONTABIL, CI.QTDTITLOTE ';

// Continua Linha
  wLinha := wLinha +
    ' FROM COTACAOINVEST CI,INVESTIMENTO IV '+
    ' WHERE 	(DATACOTACAO >= TO_DATE('''+DateEdit1.Text+''',''DD/MM/YYYY'')) 	AND '+
    '       	(DATACOTACAO <= TO_DATE('''+DateEdit2.Text+''',''DD/MM/YYYY'')) 	AND '+
    '	      (CI.IDINVESTIMENTO IN ('+ListaSelecionados.Text+')) 	AND'+
	   '        (CI.IDINVESTIMENTO = IV.IDINVESTIMENTO) '+
    ' ORDER BY CI.IDINVESTIMENTO, CI.DATACOTACAO';

  DmRelatorios.QryRelatConsInvest.SQL.Add(wLinha);
End;

procedure TFrmpRelVariacoesInvest.RadioGroup1Click(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  DbLkcTipoInvest.Visible:=False;
  DbLkcTipoTitulo.Visible:=False;

// Todos \\
  If RadioGroup1.ItemIndex = 0 Then Begin
// Marca Todos os Investimentos
    For I:=0 To (CkLstInvestimentos.Items.Count-1) Do Begin
      CkLstInvestimentos.Checked[I]:=True;
    End;

// Tipo de Investimento \\
  End Else If RadioGroup1.ItemIndex = 1 Then Begin
// Desmarca Todos os Investimentos
    For I:=0 To (CkLstInvestimentos.Items.Count-1) Do Begin
      CkLstInvestimentos.Checked[I]:=False;
    End;
// Marca os do Tipo de Investimento Selecionado
    DbLkcTipoInvest.Visible:=True;
// Executa a Mudanca no Combo de Tipos de Investimentos
    DbLkcTipoInvestChange(Self);

// Tipo de Titulo \\
  End Else If RadioGroup1.ItemIndex = 2 Then Begin
// Desmarca Todos os Investimentos
    For I:=0 To (CkLstInvestimentos.Items.Count-1) Do Begin
      CkLstInvestimentos.Checked[I]:=False;
    End;
// Marca os do Tipo de titulo Selecionado
    DbLkcTipoTitulo.Visible:=True;
// Executa a Mudanca no Combo de Tipos de Investimentos
    DbLkcTipoTituloChange(Self);


  End;

end;

procedure TFrmpRelVariacoesInvest.DbLkcTipoInvestChange(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  If DbLkcTipoInvest.Text = '' Then Exit;

  For I:=0 To (CkLstInvestimentos.Items.Count-1) Do Begin
    If ListaTipoInvest.Strings[I] =
      QryTipoInvest.FieldByName('IDTIPOINVEST').AsString Then Begin
      CkLstInvestimentos.Checked[I]:=True;
    End Else Begin
      CkLstInvestimentos.Checked[I]:=False;
    End;
  End;
end;

procedure TFrmpRelVariacoesInvest.DbLkcTipoTituloChange(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  If DbLkcTipoTitulo.Text = '' Then Exit;

  For I:=0 To (CkLstInvestimentos.Items.Count-1) Do Begin
    If ListaTipoTitulo.Strings[I] =
      QryTipoTitulo.FieldByName('CODTIPTITULO').AsString Then Begin
      CkLstInvestimentos.Checked[I]:=True;
    End Else Begin
      CkLstInvestimentos.Checked[I]:=False;
    End;
  End;
end;

end.


