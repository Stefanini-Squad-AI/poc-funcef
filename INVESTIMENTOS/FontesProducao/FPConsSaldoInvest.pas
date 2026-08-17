//******************************************************************************
// Data      : 03/10/2006
// Código    : AL_1
// Pendencia : 22965
// Desc      : Segregação de Planp/Patrocinadora
//******************************************************************************
unit FpConsSaldoInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UOperacaoInvest,
  UOperComum, dOperComum, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmpConsSaldoInvest = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    Label4: TLabel;
    dblkCarteira: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraDESCCARTINVEST: TStringField;
    QryAux1: TwwQuery;
    QryLocal: TwwQuery;
    QryAux2: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDataRefExit(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
    function BuscaDadosCotacaoInvest(iInvestimento: Longint; dDataRef: TDateTime;
                              UsaLote:Boolean; var QtdLote : double): double;

  public
    { Public declarations }
  end;

var FrmpConsSaldoInvest: TFrmpConsSaldoInvest;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, UBibliotecaInvest, FDmRelatorio;

Procedure TFrmpConsSaldoInvest.FazQry;
var
    wVlrMovCartInv, wCotacao1, wCotacaoAtu, wSalVlrInvCart,
    wValor1, QtdLote, wSaldoQtd, wSaldoLiberado, wSaldoBloqueado, wSaldoLib, wSaldoBloq: double;
    UsaLote  : Boolean;
    dDataCotacao: TDateTime;
    fTotal : Double;
Begin
   fTotal := 0;
   UsaLote:= True;

   DtmRelatorio.LblPeriodoInv.Caption := 'DATA DE REFERÊNCIA: ' +edDataRef.Text;
   DtmRelatorio.LblCarteira.Caption := 'CARTEIRA: ' +dblkCarteira.Text;

   OperComum.LimpaParametros(DtmRelatorio.QrySaldoInv);
   With DtmRelatorio.qrySaldoInv Do
   Begin
      ParamByName('dDataRef').AsString := edDataRef.Text;
      ParamByName('IDCARTEIRAINVEST').AsInteger := QryCarteiraIDCARTEIRAINVEST.AsInteger;
      Open;
      First;

      While Not EOF Do
      Begin
         // Busca Saldos Liberado e Bloqueado de Custodiantes
         wSaldoLiberado  := 0;
         wSaldoBloqueado := 0;

         FazQuery(QryAux1, 'SELECT IDCUSTODIANTE '+
                           'FROM CUSTODIANTE ');
         While Not QryAux1.Eof Do
         Begin
            //AL_1
            OperacaoInvest.BuscaSaldosCustodia(iPlanPrevCtbPatro,
                         FieldByName('IDCARTEIRAINVEST').AsInteger,
                         FieldByName('IDINVESTIMENTO').AsInteger, 9999999,
                         QryAux1.FieldByName('IDCUSTODIANTE').AsInteger, -1,
                         FieldByName('IDLOTE').AsString, edDataRef.Date,
                         wSaldoBloq, wSaldoLib);
            wSaldoLiberado := wSaldoLiberado + wSaldoLib;

            FazQuery(QryAux2, 'SELECT IDMOTIVOBLOQUEIO '+
                              'FROM MOTIVOBLOQUEIO '+
                              'WHERE  IDMOTIVOBLOQUEIO <> -1');

            While Not QryAux2.Eof Do
            Begin
               //AL_1
               OperacaoInvest.BuscaSaldosCustodia(iPlanPrevCtbPatro,
                              FieldByName('IDCARTEIRAINVEST').AsInteger,
                              FieldByName('IDINVESTIMENTO').AsInteger, 9999999,
                              QryAux1.FieldByName('IDCUSTODIANTE').AsInteger,
                              QryAux2.FieldByName('IDMOTIVOBLOQUEIO').AsInteger,
                              FieldByName('IDLOTE').AsString, edDataRef.Date,
                              wSaldoBloq, wSaldoLib);
               wSaldoBloqueado := wSaldoBloqueado + wSaldoBloq;
               QryAux2.Next;
            End;

            QryAux1.Next;
         End;

         // Busca a Cotacao
         wCotacao1 := BuscaDadosCotacaoInvest(
             FieldByName('IDINVESTIMENTO').AsInteger, FieldByName('DATAMOVCARTINV').AsDateTime, UsaLote, QtdLote);

         Edit;

         FieldByName('COTACAO').asFloat  := Opercomum.DivValorZero(wCotacao1,QtdLote);
         FieldByName('SALDOLIBERADO').asFloat  := wSaldoLiberado;
         FieldByName('SALDOBLOQUEADO').asFloat := wSaldoBloqueado;

         fTotal := fTotal + FieldByName('SALDOVLRINVCART').asFloat;

         Post;
         Next;
      End;
      First;
   End;
End;

procedure TFrmpConsSaldoInvest.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := Date;
end;

procedure TFrmpConsSaldoInvest.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If trim(edDataRef.Text) = '' Then
  Begin
      MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
      if edDataRef.CanFocus then
         edDataRef.SetFocus;
      Exit;
  End;

  if Trim(dblkCarteira.Text) = '' then
  begin
      MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
      if dblkCarteira.CanFocus then
         dblkCarteira.SetFocus;
      Exit;
  end;

  FazQry;
end;

procedure TFrmpConsSaldoInvest.FormShow(Sender: TObject);
begin
  inherited;
  edDataRef.Text := DateToStr(pRPI.DATAULTFECH);
  qryCarteira.Open;
end;

procedure TFrmpConsSaldoInvest.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
end;

// Função que Busca Cotação de um Investimento numa determinada data.
function TFrmpConsSaldoInvest.BuscaDadosCotacaoInvest(iInvestimento: Longint; dDataRef: TDateTime;
                              UsaLote:Boolean; var QtdLote : double): double;
var
   QryLocal  :TwwQuery;
begin
    Result := 0;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    FazQuery(QryLocal,
      'SELECT DATACOTACAO, VLRCONTABIL, QTDTITLOTE '+
      'FROM COTACAOINVEST '+
      'WHERE 	(IDINVESTIMENTO = '''+ InttoStr(iInvestimento)+''') AND '+
      '      	(DATACOTACAO <= TO_DATE( '''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+
      'ORDER BY DATACOTACAO DESC ');

// Caso Utilize Lote Faz Calculo
    If UsaLote = True Then Begin
      If QryLocal.FieldByName('QTDTITLOTE').AsFloat <> 0 then
         Result := (QryLocal.FieldByName('VLRCONTABIL').AsFloat /
                   QryLocal.FieldByName('QTDTITLOTE').AsFloat)

      Else
         Result := QryLocal.FieldByName('VLRCONTABIL').AsFloat;
    End Else Begin
// Caso Não Utilize Lote. Guarda
      Result := QryLocal.FieldByName('VLRCONTABIL').AsFloat;
    End;
    QtdLote := QryLocal.FieldByName('QTDTITLOTE').AsFloat;
    QryLocal.Free;
end;

procedure TFrmpConsSaldoInvest.edDataRefExit(Sender: TObject);
begin
  inherited;
   if edDataRef.Date > pRPI.DATAULTFECH then
      edDataRef.Text := DateToStr(pRPI.DATAULTFECH);
end;

end.
