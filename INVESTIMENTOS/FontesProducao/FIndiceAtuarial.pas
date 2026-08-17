unit FIndiceAtuarial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, TREdit,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmIndiceAtuarial = class(TfrmOkCancelar)
    EdDataFinal: TCMDateTimePicker;
    QryAux: TwwQuery;
    Label1: TLabel;
    EdValor: TRealEdit;
    Label3: TLabel;
    GbFlags: TGroupBox;
    CbPulaFeriados: TCheckBox;
    CbGravaResultado: TCheckBox;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    PnDescIndice: TPanel;
    EdVlrUltCotacao: TRealEdit;
    Label5: TLabel;
    Label2: TLabel;
    EdDtUltCotacao: TCMDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure EdDtUltCotacaoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIndiceAtuarial: TFrmIndiceAtuarial;
  wIdMoedaAtuarial:String;
  wDataUltCotacao:TDate;

implementation

Uses UBibliotecaInvest, UMensErro;

{$R *.DFM}

procedure TFrmIndiceAtuarial.FormShow(Sender: TObject);
begin
  inherited;
// Busca Moeda Atuarial
  FazQuery(QryAux,'SELECT * FROM PARAMINVEST');
// Guarda Moeda Atuarial
  wIdMoedaAtuarial:=QryAux.FieldByName('MOEDAATU').AsString;
// Busca Ultima Cotacao e os Dados, Caso Não Exista Sai
  If Not FazQuery(QryAux,
    'SELECT * FROM COTACAOMOEDA COT1, PARAMINVEST PI, MOEDA MO,          '+
    '         (SELECT MAX(CT.COTDATA) AS DATAMAIOR FROM COTACAOMOEDA CT  '+
    '          WHERE CT.MOECODIGO = '+QuotedStr(wIdMoedaAtuarial)+') COT2 '+
    'WHERE (COT1.MOECODIGO = '+QuotedStr(wIdMoedaAtuarial)+') AND         '+
    '      (COT1.COTDATA   = DATAMAIOR)    AND '+
    '      (COT1.MOECODIGO = MO.MOECODIGO)     ') Then Begin

    MsgDlg('Não Foram encontrados Informações Suficientes nos Cadastros.',
           'Mensagem do Sistema ',MtError,[MbOk],0);
    Close;
  End;
// Guarda Data Ultima Cotacao
  wDataUltCotacao := QryAux.FieldByName('COTDATA').AsDateTime;
// Mostra Dados
  PnDescIndice.Caption :=' '+QryAux.FieldByName('MOEDESC').AsString;
  EdDtultCotacao.Text  :=QryAux.FieldByName('COTDATA').AsString;
  EdVlrUltCotacao.Value:=QryAux.FieldByName('COTVALOR').AsFloat;
end;

procedure TFrmIndiceAtuarial.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If EdValor.Value = 0 Then Begin
    MsgDlg('Percentual não pode ser zero!',
           'Mensagem do Sistema ',MtError,[MbOk],0);
    Exit;
  End;
// Executa Funcao de Capitalizacao
  CapitalizaMoeda(StrToInt(wIdMoedaAtuarial),(EdValor.Value/100), (wDataUltCotacao+1),
                  StrToDate(EdDataFinal.Text), CbPulaFeriados.Checked,True,True);

  BbtnConfirmar.Enabled:=False;
  MsgDlg('Procedimento Terminado!',
         'Mensagem do Sistema ',MtInformation,[MbOk],0);
// Busca Ultima Cotacao e os Dados, Caso Não Exista Sai
  If Not FazQuery(QryAux,
    'SELECT * FROM COTACAOMOEDA COT1, PARAMINVEST PI, MOEDA MO,          '+
    '         (SELECT MAX(CT.COTDATA) AS DATAMAIOR FROM COTACAOMOEDA CT  '+
    '          WHERE CT.MOECODIGO = '+QuotedStr(wIdMoedaAtuarial)+') COT2 '+
    'WHERE (COT1.MOECODIGO = '+QuotedStr(wIdMoedaAtuarial)+') AND         '+
    '      (COT1.COTDATA   = DATAMAIOR)    AND '+
    '      (COT1.MOECODIGO = MO.MOECODIGO)     ') Then Begin

    MsgDlg('Não Foram encontrados Informações Suficientes nos Cadastros.',
           'Mensagem do Sistema ',MtError,[MbOk],0);
    Close;
  End;
// Guarda Data Ultima Cotacao
  wDataUltCotacao := QryAux.FieldByName('COTDATA').AsDateTime;
// Mostra Dados
  PnDescIndice.Caption :=' '+QryAux.FieldByName('MOEDESC').AsString;
  EdDtultCotacao.Text  :=QryAux.FieldByName('COTDATA').AsString;
  EdVlrUltCotacao.Value:=QryAux.FieldByName('COTVALOR').AsFloat;

// Limpa Dados
  EdDataFinal.Text:='';
  EdValor.Value   :=0;

// Habilita Botao Ok
  BbtnConfirmar.Enabled:=True;
end;

procedure TFrmIndiceAtuarial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryAux.Close;
end;

procedure TFrmIndiceAtuarial.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Limpa Dados
  EdDataFinal.Text:='';
  EdValor.Value   :=0;
end;

procedure TFrmIndiceAtuarial.EdDtUltCotacaoExit(Sender: TObject);
begin
  inherited;

  If Not FazQuery(QryAux,
    'SELECT * FROM COTACAOMOEDA COT1, PARAMINVEST PI, MOEDA MO,          '+
    '         (SELECT MAX(CT.COTDATA) AS DATAMAIOR FROM COTACAOMOEDA CT  '+
    '          WHERE CT.MOECODIGO = '+QuotedStr(wIdMoedaAtuarial)+' AND '+
    '                CT.COTDATA  <= TO_DATE('+QuotedStr(EdDtUltCotacao.Text)+',''DD/MM/YYYY'')) COT2 '+
    'WHERE (COT1.MOECODIGO = '+QuotedStr(wIdMoedaAtuarial)+') AND         '+
    '      (COT1.COTDATA   = DATAMAIOR)    AND '+
    '      (COT1.MOECODIGO = MO.MOECODIGO)     ') Then Begin

    MsgDlg('Não Foram encontrados Informações Suficientes nos Cadastros.',
           'Mensagem do Sistema ',MtError,[MbOk],0);
    Close;
  End;
// Guarda Data Ultima Cotacao
  wDataUltCotacao := QryAux.FieldByName('COTDATA').AsDateTime;
// Mostra Dados
  PnDescIndice.Caption :=' '+QryAux.FieldByName('MOEDESC').AsString;
  EdDtultCotacao.Text  :=QryAux.FieldByName('COTDATA').AsString;
  EdVlrUltCotacao.Value:=QryAux.FieldByName('COTVALOR').AsFloat;
end;

end.















