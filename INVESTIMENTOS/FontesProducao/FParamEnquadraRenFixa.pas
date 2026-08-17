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

unit FParamEnquadraRenFixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UOperacaoInvest,
  Grids, DBGrids, ComCtrls, Wwdatsrc, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TFrmParamEnquadraRenFixa = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    Label4: TLabel;
    dblcCarteira: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
    Label14: TLabel;
    DbLkcTabClassif: TwwDBLookupCombo;
    QryTabClassif: TwwQuery;
    Animate1: TAnimate;
    qryEnquadraRenFixaTemp: TwwQuery;
    QryAux: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataRefExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamEnquadraRenFixa: TFrmParamEnquadraRenFixa;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, FDmRelatorios, UBibliotecaInvest, UOperComum;

Procedure TfrmParamEnquadraRenFixa.FazQry;
var
  QryLocal :TwwQuery;
  dDataInicial : TDateTime;
  fValInicial, fValAplic, fRendimento, fResgate,wTaxaOver,fSaldo,wSaldoInutil,
  wVlrSaldoInvest,fJuros, fRendto,fVariacao, fAgio : double;
  wTabela, wCodClassif, sSQL : String;
Begin
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    Animate1.Visible:=True;
    Animate1.Active :=True;

    wTabela:=QryTabClassif.FieldByName('CODTABCLASSINV').AsString;
    With qryEnquadraRenFixaTemp Do
    Begin
       Close;
       Sql.Clear;
       Sql.add(' SELECT                                                                            ');
       Sql.add('     H1.IDCARTEIRAINVEST, IV.IDINVESTIMENTO                    ');
       Sql.add('  FROM                                                                             ');
       Sql.add('     HISTCARTINV H1,  CARTEIRAINVEST CA, INVESTIMENTO IV, PESSOA P,    ');
       Sql.add('     TITRENFIXA TT, TIPOTITRENFIXA TP, MOEDA MO, TIPOJUROS TJ                ');
       Sql.add('  WHERE                                                                            ');
       Sql.add('     (H1.DATAMOVCARTINV =                                                          ');
       Sql.add('         (SELECT MAX(H2.DATAMOVCARTINV)                                            ');
       Sql.add('          FROM   HISTCARTINV H2                                                    ');
       Sql.add('          WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND                    ');
       Sql.add('                (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND                      ');
       Sql.add('                (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND ');
       Sql.add('                (H2.DATAMOVCARTINV  <= TO_DATE('''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY'')))) ');
       Sql.add('     AND (H1.IDHISTCARTINV =                                                       ');
       Sql.add('         (SELECT MAX(H3.IDHISTCARTINV)                                             ');
       Sql.add('          FROM   HISTCARTINV H3                                                    ');
       Sql.add('          WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND                    ');
       Sql.add('                (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND                      ');
       Sql.add('                (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND ');
       Sql.add('                (H3.DATAMOVCARTINV   = H1.DATAMOVCARTINV)))                        ');

       if Trim(dblcCarteira.Text) <> '' Then
          Sql.add('    AND (H1.IDCARTEIRAINVEST = '+dblcCarteira.LookupValue+')  ');
       Sql.add('    AND (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) ');
       Sql.add('    AND (H1.IDINVESTIMENTO = IV.IDINVESTIMENTO)     ');
       Sql.add('    AND (IV.IDINVESTIMENTO = TT.IDTITRENFIXA)       ');
       Sql.add('    AND (TT.CODTIPRENFIXA  = TP.CODTIPRENFIXA)      ');
       Sql.add('    AND (TT.INDEXRENFIX    = MO.MOECODIGO(+))       ');
       Sql.add('    AND (TT.CODTIPTXJUROS  = TJ.CODTIPTXJUROS(+))   ');
       Sql.add('    AND (P.IDPESSOA        = IV.IDEMISSOR)          ');
       Sql.add('    AND ((TT.DATAVENCTITRENFIX >= TO_DATE('''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY'')) ');
       Sql.add('    OR  (TT.DATAVENCTITRENFIX IS NULL))                 ');
       Open;
       First;
       While Not EOF Do
       Begin
          // Acha Classificação do Investimento
          AchaClassInvestimento(FieldByName('IDCARTEIRAINVEST').AsInteger,
                                FieldByName('IDINVESTIMENTO').AsInteger,
                                wTabela, edDataRef.Date, wCodClassif);
          QryAux.Close;
          if  wCodClassif <> '' then
          begin
          // Caso Exista Busca a Descricao
          FazQuery(QryLocal,
               'SELECT  DESCCLASSINVEST '+
               'FROM CLASSIFINVEST '+
               'WHERE (CODTABCLASSINV = '+QuotedStr(wTabela)    +') AND '+
               '      (CODCLASSINVEST = '+QuotedStr(wCodClassif)+')');

             QryAux.ParamByName('DESCCLASSINVEST').AsString := QryLocal.FieldByName('DESCCLASSINVEST').asString;
          end
          else
          begin
             QryAux.ParamByName('DESCCLASSINVEST').asString := 'INVESTIMENTOS NÃO CLASSIFICADOS';
          end;

          QryAux.ParamByName('IDINVESTIMENTO').asInteger := qryEnquadraRenFixaTemp.FieldByName('IDINVESTIMENTO').asInteger;
          QryAux.ExecSQL;
          Next;
       End;
    End;

    With DmRelatorios.qryEnquadraRenFixa Do
    Begin
       DmRelatorios.RptEnquadraRenFixaDataRef1.Caption    := edDataRef.Text;
       Filter   := '';
       Filtered := False;
       Close;
       Sql.Clear;
       Sql.add(' SELECT                                                                                ');
       Sql.add('     CA.DESCCARTINVEST, H1.IDLOTE, P.NOME,                                             ');
       Sql.add('     (''                                              '') AS CODCLASS,                 ');
       Sql.add('     IV.DESCCLASSINVEST AS DESCCLASS,                                                  ');
       Sql.add('     MO.MOEDESC, TT.JUROSRENFIX, TJ.DESCTIPJUROS,  DESCINVESTIMENTO,                   ');
       Sql.add('     H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, H1.SALDOVLRINVCART, TT.DATAVENCTITRENFIX, ');
       Sql.add('     TO_DATE('''') AS DATAINICIAL, (0) AS VALAPLIC, (0) AS RENDIMENTO, (0) AS RESGATE, ');
       Sql.add('     (0) AS VARIACAO, (0) AS JUROS, (0) AS AGIO, (0) AS RENDTO,');
       Sql.add('     ROUND(0,2) AS SALDO, (0) AS TAXAOVER                                              ');
       Sql.add('  FROM                                                                             ');
       Sql.add('     HISTCARTINV H1,  CARTEIRAINVEST CA, INVESTIMENTO IV, PESSOA P,    ');
       Sql.add('     TITRENFIXA TT, TIPOTITRENFIXA TP, MOEDA MO, TIPOJUROS TJ                ');
       Sql.add('  WHERE                                                                            ');
       Sql.add('     (H1.DATAMOVCARTINV =                                                          ');
       Sql.add('         (SELECT MAX(H2.DATAMOVCARTINV)                                            ');
       Sql.add('          FROM   HISTCARTINV H2                                                    ');
       Sql.add('          WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND                    ');
       Sql.add('                (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND                      ');
       Sql.add('                (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND ');
       Sql.add('                (H2.DATAMOVCARTINV  <= TO_DATE('''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY'')))) ');
       Sql.add('     AND (H1.IDHISTCARTINV =                                                       ');
       Sql.add('         (SELECT MAX(H3.IDHISTCARTINV)                                             ');
       Sql.add('          FROM   HISTCARTINV H3                                                    ');
       Sql.add('          WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND                    ');
       Sql.add('                (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND                      ');
       Sql.add('                (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND ');
       Sql.add('                (H3.DATAMOVCARTINV   = H1.DATAMOVCARTINV)))                        ');

       if Trim(dblcCarteira.Text) <> '' Then
          Sql.add('    AND (H1.IDCARTEIRAINVEST = '+dblcCarteira.LookupValue+')  ');

       Sql.add('    AND (H1.SALDOQTDEINVCART <> 0)                  ');
       Sql.add('    AND (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) ');
       Sql.add('    AND (H1.IDINVESTIMENTO = IV.IDINVESTIMENTO)     ');
       Sql.add('    AND (IV.IDINVESTIMENTO = TT.IDTITRENFIXA)       ');
       Sql.add('    AND (TT.CODTIPRENFIXA  = TP.CODTIPRENFIXA)      ');
       Sql.add('    AND (TT.INDEXRENFIX    = MO.MOECODIGO(+))       ');
       Sql.add('    AND (TT.CODTIPTXJUROS  = TJ.CODTIPTXJUROS(+))   ');
       Sql.add('    AND (P.IDPESSOA        = IV.IDEMISSOR)          ');
       Sql.add('    AND ((TT.DATAVENCTITRENFIX >= TO_DATE('''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY'')) ');
       Sql.add('    OR  (TT.DATAVENCTITRENFIX IS NULL))                 ');
       Sql.add('  ORDER BY                                          ');
       Sql.add('        CA.DESCCARTINVEST,                          ');
       Sql.add('        DESCCLASS,                                  ');
       Sql.add('        P.NOME,                                     ');
       Sql.add('        H1.IDLOTE                                   ');
       Open;
       First;
       While Not EOF Do
       Begin
          // Acha Classificação do Investimento
          Edit;

          AchaClassInvestimento(FieldByName('IDCARTEIRAINVEST').AsInteger,
                                  FieldByName('IDINVESTIMENTO').AsInteger,
                                  wTabela, edDataRef.Date, wCodClassif);
          FieldByName('CODCLASS').asString := wCodClassif;

          OperacaoInvest.BuscaInicioAplicacao(
                              FieldByName('IDINVESTIMENTO').AsInteger,
                              FieldByName('IDCARTEIRAINVEST').AsInteger,
                              FieldByName('IDLOTE').AsString, dDataInicial, fValInicial);

          FieldByName('DATAINICIAL').asDateTime := dDataInicial;
          //AL_1
          //AL_2
          //AL_3
          //AL_4
          //AL_5
          OperComum.BuscaTodosSaldosInvestLote(
                      FieldByName('IDCARTEIRAINVEST').AsInteger,
                      0{IDCARTEIRAGERENC},
                      FieldByName('IDINVESTIMENTO').AsInteger,
                      9999999,-1,
                      FieldByName('IDLOTE').AsString,
                      DateToStr(edDataRef.Date), -1,
                      wSaldoInutil, wVlrSaldoInvest, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil);

          OperacaoInvest.BuscaSaldosAplicacao(
                              FieldByName('IDINVESTIMENTO').AsInteger,
                              FieldByName('IDCARTEIRAINVEST').AsInteger,
                              FieldByName('IDLOTE').AsString, dDataInicial, edDataRef.Date,
                              fValAplic, fRendimento, fResgate,
                              fRendto,fJuros,fVariacao,fAgio);

          FieldByName('VALAPLIC').asFloat   := fValAplic;
          FieldByName('RENDTO').asFloat     := fRendto;
          FieldByName('JUROS').asFloat      := fJuros;
          FieldByName('VARIACAO').asFloat   := fVariacao;
          FieldByName('AGIO').asFloat       := fAgio;
          FieldByName('RESGATE').asFloat    := fResgate;
          FieldByName('SALDO').asFloat      := StrToFloat(FormatFloat('#################0.00',wVlrSaldoInvest));

          If FieldByName('JUROSRENFIX').IsNull Then
             FieldByName('JUROSRENFIX').AsFloat := 0
          else
          begin
             wTaxaOver := OperacaoInvest.CalculaTaxaOver(FieldByName('IDINVESTIMENTO').AsInteger,
                                                         dDataInicial,
                                                         FieldByName('DATAVENCTITRENFIX').AsDateTime);
             FieldByName('TAXAOVER').asFloat       := wTaxaOver;
          end;

          fSaldo := wVlrSaldoInvest;

          If FieldByName('SALDO').AsFloat <> 0 Then
             Post;
          Next;
       End;
       First;

       Filter   := 'SALDO > 0';
       Filtered := True;
    End;
  Animate1.Visible:=False;
  Animate1.Active :=False;
End;

procedure TFrmParamEnquadraRenFixa.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := Date;
end;

procedure TFrmParamEnquadraRenFixa.bbtnConfirmarClick(Sender: TObject);
begin
  If (DbLkcTabClassif.Text = '') Then Begin
    MsgDlg('Faltam preencher parâmetros ','Erro',mtError,[mbOK],0);
    DbLkcTabClassif.SetFocus;
    Exit;
  end;
  inherited;
  FazQry;
end;

procedure TFrmParamEnquadraRenFixa.edDataRefExit(Sender: TObject);
begin
  inherited;
  If Trim(EdDataRef.Text) = '' Then Begin
    MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
    EdDataRef.SetFocus;
  End;
end;

procedure TFrmParamEnquadraRenFixa.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.close;
  qryCarteira.open;
  QryTabClassif.close;
  QryTabClassif.Open;
end;

procedure TFrmParamEnquadraRenFixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  QryCarteira.Close;
  QryTabClassif.Close;
end;

end.



