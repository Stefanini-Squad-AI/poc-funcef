//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_5
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_4
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_3
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//********************************************************************************************************
// Data     : 06/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************

unit FparamIRRendaVar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UBibliotecaInvest, UOperacaoInvest,
  MontaSelect, UOperComum, dOperComum, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamIRRendaVar = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataIni: TCMDateTimePicker;
    Label1: TLabel;
    edDataFim: TCMDateTimePicker;
    Label3: TLabel;
    edDataRef: TCMDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure edDataRefExit(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var FrmParamIRRendaVar: TFrmParamIRRendaVar;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, FDmRelatorio, FDmRelatorios;

Procedure TFrmparamIRRendaVar.FazQry;
Var
  wQtdInvest, wVlrSaldoInvest, wSaldoInutil, wSaldoAqui, wVlrUnitCompra, wLucro : Double;
  QryLocal :TwwQuery;
Begin

 QryLocal             := TwwQuery.Create(Application);
 QryLocal.DatabaseName:= 'BaseDados';

 DtmRelatorio.RptIRRendaVarLabel6.Caption    := edDataRef.Text;

 wVlrUnitCompra       := 0;

 With DtmRelatorio.QryIRRendaVar Do Begin
   Close;
   Sql.Clear;

   Sql.add(' SELECT H.DATAMOVCARTINV, H.IDHISTCARTINV, E.SIGLAEMISSOR,                      ');
   Sql.add('        H.IDCARTEIRAINVEST, H.IDINVESTIMENTO, H.IDLOTE, DOP.TOTALDESP,          ');
   Sql.add('        A.CODTIPOACAO, H.QTDEMOVINVCART, ABS(H.VLRMOVCARTINV) AS VLRMOVCARTINV, ');
   Sql.add('        (0) AS VLRUNITVENDA, (0) AS VLRUNITCOMPRA, (0) AS LOTE, (0) AS LUCRO,   ');
   Sql.add('        (0) AS PREJUIZO                                                         ');
   Sql.add('                                                                          ');
   Sql.add('  FROM  HISTCARTINV H, INVESTIMENTO I, ACAO A, EMISSOR E,                 ');
   Sql.add('        (SELECT  H1.IDOPERACAOINVEST, SUM(H1.VLRMOVCARTINV) AS TOTALDESP  ');
   Sql.add('         FROM HISTCARTINV H1                                           ');
   Sql.add('         WHERE (H1.TIPMOVCARTINV    = ''DOP'')                            ');
   Sql.add('         GROUP BY H1.IDOPERACAOINVEST ) DOP                               ');
   Sql.add('                                                                          ');
   Sql.add('  WHERE                                                                   ');

   If (Trim(edDataIni.Text) <> '' )  Then Begin
     DtmRelatorio.RptIRRendaVarLabel2.Caption    := edDataIni.Text;
     Sql.Add(' (H.DATAMOVCARTINV >= TO_DATE('''+DateToStr(edDataIni.Date)+''',''DD/MM/YYYY''))  AND');
   End;

   If (Trim(edDataFim.Text) <> '' )  Then Begin
     DtmRelatorio.RptIRRendaVarLabel4.Caption    := edDataFim.Text;
     Sql.Add(' (H.DATAMOVCARTINV <= TO_DATE('''+DateToStr(edDataFim.Date)+''',''DD/MM/YYYY''))  AND');
   End;

   Sql.add('  (H.NATURMOVCARTINV = ''D'')                 AND                   ');
   Sql.add('  (H.IDINVESTIMENTO = I.IDINVESTIMENTO)       AND                   ');
   Sql.add('  (H.IDINVESTIMENTO = A.IDACAO)               AND                   ');
   Sql.add('  (I.IDEMISSOR = E.IDEMISSOR)                 AND                   ');
   Sql.add('  (H.IDOPERACAOINVEST = DOP.IDOPERACAOINVEST)                       ');

   Sql.add(' ORDER BY H.DATAMOVCARTINV, H.IDHISTCARTINV                         ');
   Open;
   First;

   While Not Eof Do
   Begin

     Edit;

     //Busca Quantidade de Lote
     if FazQuery(QryLocal, 'SELECT QTDTITLOTE FROM COTACAOINVEST  '+
                        'WHERE IDINVESTIMENTO = '''+
                               FieldByName('IDINVESTIMENTO').AsString+'''AND '+
                        '      DATACOTACAO <= TO_DATE('''+FieldByName('DATAMOVCARTINV').AsString+''',''DD/MM/YYYY'') '+
                        '      ORDER BY DATACOTACAO DESC') then

       FieldByName('LOTE').AsInteger   := QryLocal.FieldByName('QTDTITLOTE').AsInteger;

     // Acha Valor Unitário de Compra
     // Busca Cotação de Mercado se achar registro no HistCartInv na Data de Referencia.
     // Senão, busca Custo de Aquisição imediatamente anterior a Venda.
     //AL_1
     //AL_2
     //AL_3
     //AL_4
     //AL_5
     if OperComum.BuscaTodosSaldosInvestLote(
                  FieldByName('IDCARTEIRAINVEST').AsInteger,
                  0{IDCARTEIRAGERENC},
                  FieldByName('IDINVESTIMENTO').AsInteger, 9999999,-1,
                  FieldByName('IDLOTE').AsString,
                  DateToStr(edDataRef.Date), -1,
                  wQtdInvest,   wVlrSaldoInvest, wSaldoInutil, wSaldoInutil, wSaldoAqui,
                  wSaldoInutil, wSaldoInutil,    wSaldoInutil, wSaldoInutil, wSaldoInutil,
                  wSaldoInutil, wSaldoInutil,    wSaldoInutil, wSaldoInutil, wSaldoInutil,
                  wSaldoInutil, wSaldoInutil,    wSaldoInutil, wSaldoInutil) then
     begin
        wVlrUnitCompra := OperComum.BuscaCotacaoInvest(
                               FieldByName('IDINVESTIMENTO').AsInteger, edDataRef.Date, True);

     end
     else
     begin
        //AL_1
        //AL_2
        //AL_3
        //AL_4
        //AL_5
        if OperComum.BuscaTodosSaldosInvestLote(
                     FieldByName('IDCARTEIRAINVEST').AsInteger,
                     0{IDCARTEIRAGERENC},
                     FieldByName('IDINVESTIMENTO').AsInteger,
                     FieldByName('IDHISTCARTINV').AsInteger,-1,
                     FieldByName('IDLOTE').AsString,
                     DateToStr(FieldByName('DATAMOVCARTINV').AsDateTime), -1,
                     wQtdInvest,   wVlrSaldoInvest, wSaldoInutil, wSaldoInutil, wSaldoAqui,
                     wSaldoInutil, wSaldoInutil,    wSaldoInutil, wSaldoInutil, wSaldoInutil,
                     wSaldoInutil, wSaldoInutil,    wSaldoInutil, wSaldoInutil, wSaldoInutil,
                     wSaldoInutil, wSaldoInutil,    wSaldoInutil, wSaldoInutil) then

           wVlrUnitCompra := wSaldoAqui / wQtdInvest;
     end;

     FieldByName('VLRUNITCOMPRA').AsFloat   := wVlrUnitCompra;

     FieldByName('VLRUNITVENDA').AsFloat   := FieldByName('VLRMOVCARTINV').AsFloat /
                                              FieldByName('QTDEMOVINVCART').AsFloat;

     wLucro := DtmRelatorio.QryIRRendaVar.FieldByName('VLRMOVCARTINV').AsFloat -
               (DtmRelatorio.QryIRRendaVar.FieldByName('QTDEMOVINVCART').AsFloat * wVlrUnitCompra) -
               DtmRelatorio.QryIRRendaVar.FieldByName('TOTALDESP').AsFloat;

     If wLucro > 0 then
       FieldByName('LUCRO').AsFloat   := wLucro
     else
       FieldByName('PREJUIZO').AsFloat   := wLucro;

     Post;
     Next;
   End;
 End;
End;

procedure TFrmparamIRRendaVar.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := StrToDate('31/12/1999');
  edDataIni.Date := Date;
  edDataFim.Date := Date;
end;

procedure TFrmparamIRRendaVar.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If (trim(edDataRef.Text) = '') Then Begin
     MsgDlg('Preencher Data. ','Erro',mtError,[mbOK],0);
     edDataRef.SetFocus;
  End;

  FazQry;

  DtmRelatorio.QryIRRendaVar.Open;

end;


procedure TFrmParamIRRendaVar.edDataIniExit(Sender: TObject);
begin
  inherited;
  If trim(edDataIni.Text) = '' Then
     Begin
         MsgDlg('Data Inicial não foi preenchida','Erro',mtError,[mbOK],0);
         edDataIni.SetFocus;
     End;
end;

procedure TFrmParamIRRendaVar.edDataFimExit(Sender: TObject);
begin
  inherited;
  If trim(edDataFim.Text) = '' Then
     Begin
         MsgDlg('Data Final não foi preenchida','Erro',mtError,[mbOK],0);
         edDataFim.SetFocus;
     End;

end;

procedure TFrmParamIRRendaVar.edDataRefExit(Sender: TObject);
begin
  inherited;
  If trim(edDataRef.Text) = '' Then
     Begin
         MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
         edDataRef.SetFocus;
     End;

end;

end.
