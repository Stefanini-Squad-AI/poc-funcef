//------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS
// Objetivo .: Formulário de Parametros do Relatorio de Cotacoes dos Investimentos
// Form     .: FrmpRelCotacoesInvest - Unit .: FpRelCotacoesInvest
// Data     .: 01/07/1999
//------------------------------------------------------------------
unit FpRelCotacoesInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  TB97, StdCtrls, Buttons, ComCtrls, ExtCtrls, Db, Wwdatsrc, DBTables,
  Wwquery, checklst, Grids, Wwdbigrd, Wwdbgrid, FOkCancelar,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmpRelCotacoesInvest = class(TFrmOkCancelar)
    QryInvestimento: TwwQuery;
    DsInvestimento: TwwDataSource;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CkLstInvestimentos: TCheckListBox;
    DateEdit1: TCMDateTimePicker;
    DateEdit2: TCMDateTimePicker;
    BtMarcar: TBitBtn;
    RgCotacaoPor: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtMarcarClick(Sender: TObject);
    Procedure MontaQueryRelat;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmpRelCotacoesInvest: TFrmpRelCotacoesInvest;

implementation

Uses UBibliotecaInvest, UMensErro, FDmRelatorios;

Var
  Lista, ListaSelecionados:TStringList;

{$R *.DFM}

//---------------------------------------------------------
// Mostra Formulario
procedure TFrmpRelCotacoesInvest.FormShow(Sender: TObject);
begin
  inherited;
// Cria Lista
  Lista            :=TStringList.Create;
  ListaSelecionados:=TStringList.Create;
// Abre Tabelas
  QryInvestimento.Open;
// Preenche o ListBox dos Investimentos
  While Not QryInvestimento.EOF Do Begin
    CkLstInvestimentos.Items.Add(QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString);
    Lista.Add(QryInvestimento.FieldByName('IDINVESTIMENTO').AsString);
// Proximo Registro
    QryInvestimento.Next;
  End;
end;

//---------------------------------------------------------
// Fecha Formulario
procedure TFrmpRelCotacoesInvest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha Tabelas
  QryInvestimento.Close;
// Libera Objetos
  Lista.Free;
  ListaSelecionados.Free;
end;

//----------------------------------------------------------
// Marcar Todos os Investimentos
procedure TFrmpRelCotacoesInvest.BtMarcarClick(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
// Marca Todos os Investimentos
  If BtMarcar.Caption = 'Marcar Todos' Then Begin
    For I:=0 To (CkLstInvestimentos.Items.Count-1) Do Begin
      CkLstInvestimentos.Checked[I]:=True;
    End;
    BtMarcar.Caption:='Desmarcar Todos'
  End Else Begin
    For I:=0 To (CkLstInvestimentos.Items.Count-1) Do Begin
      CkLstInvestimentos.Checked[I]:=False;
    End;
    BtMarcar.Caption:='Marcar Todos'
  End;
end;

//-----------------------------------------------
// Monta o SQL da Query
Procedure TFrmpRelCotacoesInvest.MontaQueryRelat;
Var
  wLinha : String;
Begin
// Monta o SQL da Query
  DmRelatorios.QryRelatCotacoes.SQL.Clear;
  If RgCotacaoPor.ItemIndex = 0 Then Begin
    wLinha :='SELECT CI.DATACOTACAO, CI.VLRCONTABIL, CI.QTDTITLOTE, IV.IDINVESTIMENTO, ';
    DmRelatorios.EdVlrContabil.DisplayFormat:='###,###,#0.00';
  End Else Begin
    wLinha :='SELECT CI.DATACOTACAO, (CI.VLRCONTABIL/CI.QTDTITLOTE) AS VLRCONTABIL, CI.QTDTITLOTE, IV.IDINVESTIMENTO, ';
    DmRelatorios.EdVlrContabil.DisplayFormat:='###,###,#0.00#####';
  End;
  DmRelatorios.QryRelatCotacoes.SQL.Add(wLinha+
    '       IV.DESCINVESTIMENTO '+
    ' FROM COTACAOINVEST CI,INVESTIMENTO IV '+
    ' WHERE 	(DATACOTACAO >= TO_DATE('''+DateEdit1.Text+''',''DD/MM/YYYY'')) 	AND '+
    '       	(DATACOTACAO <= TO_DATE('''+DateEdit2.Text+''',''DD/MM/YYYY'')) 	AND '+
    '	      (CI.IDINVESTIMENTO IN ('+ListaSelecionados.Text+')) 	AND'+
	   '        (CI.IDINVESTIMENTO = IV.IDINVESTIMENTO) '+
    ' ORDER BY CI.IDINVESTIMENTO, CI.DATACOTACAO');
End;

procedure TFrmpRelCotacoesInvest.bbtnConfirmarClick(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
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

// Monta a Query do Relatorio
  MontaQueryRelat;

// Preenche o Periodo
  DmRelatorios.ppLPeriodoCotacaoInvest.Text := DateEdit1.Text+' a '+DateEdit2.Text;
end;

end.




