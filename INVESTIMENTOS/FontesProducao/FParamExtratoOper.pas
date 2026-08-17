unit FParamExtratoOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UOperacaoInvest,
  UOperComum, dOperComum, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamExtratoOper = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    Label4: TLabel;
    DbLkcLote: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
    Label1: TLabel;
    QryLote: TwwQuery;
    QryLoteIDLOTE: TStringField;
    QryBuscaFluxoTitulo: TwwQuery;
    QryBuscaFluxoTituloVLRFLUXO: TFloatField;
    Label3: TLabel;
    dblcCarteira: TwwDBLookupCombo;
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
  FrmParamExtratoOper: TFrmParamExtratoOper;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, FDmRelatorios, UBibliotecaInvest;

Procedure TfrmParamExtratoOper.FazQry;
var
    QryLocal     :TwwQuery;
    dDataInicial : TDateTime;
    fValInicial, fValAplic, fRendimento, fResgate, fSaldoAnt, fOutrosRend : double;
    fJuros,fVariacao,fAgio,fRendto: double;
    iCartAnt, iInvAnt : integer;
    sLoteAnt, sSql : string;
Begin
    QryLocal              := TwwQuery.Create(Application);
    QryLocal.DatabaseName := 'BaseDados';

    iCartAnt := 0;
    iInvAnt  := 0;
    sLoteAnt := '';

    With DmRelatorios.qryExtratoOper Do
      Begin
          DmRelatorios.RptExtratoOperDataRef.Caption    := edDataRef.Text;
          Close;
          Sql.Clear;
          Sql.add(' SELECT  CA.DESCCARTINVEST, TP.DESCTIPRENFIXA, H1.IDLOTE, P.NOME,              ');
          Sql.add('     H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, H1.DATAMOVCARTINV, (0) AS SALDOVLRINVCART, ');
          Sql.add('     OI.NUMDOCUMENTO, ');
          Sql.add('     IV.DESCINVESTIMENTO, MO.MOEDESC, TO_DATE('''') AS DATAINICIAL, (0) AS VALINICIAL, (0) AS SALDOABERT,    ');
          Sql.add('     (0) AS RENDIMENTO, (0) AS RESGATE, (0) AS SALDO, (0) AS JUROS, (0) AS VARIACAO');
          Sql.add('  FROM                                                                       ');
          Sql.add('     HISTCARTINV H1,  CARTEIRAINVEST CA, INVESTIMENTO IV,           ');
          Sql.add('     PESSOA P, OPERACAOINVEST OI,                                      ');
          Sql.add('     TITRENFIXA TT, TIPOTITRENFIXA TP, MOEDA MO,                    ');
          Sql.add('        (SELECT MAX(H2.IDHISTCARTINV) AS IDHISTCARTINV, H2.DATAMOVCARTINV,   ');
          Sql.add('                H2.IDCARTEIRAINVEST, H2.IDLOTE                               ');
          Sql.add('         FROM HISTCARTINV H2                                                 ');
          Sql.add('         GROUP BY H2.DATAMOVCARTINV, H2.IDCARTEIRAINVEST,                    ');
          Sql.add('                  H2.IDLOTE)  MAXIMO                                         ');
          Sql.add('  WHERE ');
          Sql.add('        (H1.IDHISTCARTINV = MAXIMO.IDHISTCARTINV) AND ' );
          Sql.add('        (H1.DATAMOVCARTINV  <= TO_DATE('''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY'')) ');

          If Trim(dblcCarteira.Text) <> '' Then
             Sql.add('    AND (H1.IDCARTEIRAINVEST = '+dblcCarteira.LookupValue+') ');

          If Trim(DbLkcLote.Text) <> '' Then
             Sql.add('    AND (H1.IDLOTE = '+QuotedStr(DbLkcLote.LookupValue)+')   ');

          Sql.add('    AND (H1.IDCARTEIRAINVEST  = CA.IDCARTEIRAINVEST)        ');
          Sql.add('    AND (H1.IDINVESTIMENTO    = IV.IDINVESTIMENTO)          ');
          Sql.add('    AND (H1.IDOPERACAOINVEST  = OI.IDOPERACAOINVEST(+))        ');
          Sql.add('    AND (IV.IDINVESTIMENTO    = TT.IDTITRENFIXA)            ');
          Sql.add('    AND (TT.CODTIPRENFIXA     = TP.CODTIPRENFIXA)           ');
          Sql.add('    AND (TT.INDEXRENFIX       = MO.MOECODIGO(+))            ');
          Sql.add('    AND (P.IDPESSOA           = IV.IDEMISSOR)               ');

          Sql.add('                                                            ');
          Sql.add('  ORDER BY                                                  ');
          Sql.add('        CA.DESCCARTINVEST, TP.DESCTIPRENFIXA,               ');
          Sql.add('        H1.IDLOTE, H1.DATAMOVCARTINV                        ');
          Open;
          First;

          While Not EOF Do Begin
            Edit;
            if (IntToStr(iCartAnt) + IntToStr(iInvAnt) + sLoteAnt) <>
               (IntToStr(FieldByName('IDCARTEIRAINVEST').AsInteger) +
                IntToStr(FieldByName('IDINVESTIMENTO').AsInteger) +
                FieldByName('IDLOTE').AsString) then begin

               OperacaoInvest.BuscaInicioAplicacao(
                              FieldByName('IDINVESTIMENTO').AsInteger,
                              FieldByName('IDCARTEIRAINVEST').AsInteger,
                              FieldByName('IDLOTE').AsString, dDataInicial, fValInicial);

               FieldByName('DATAINICIAL').asDateTime   := dDataInicial;
               FieldByName('VALINICIAL').asFloat       := fValInicial;
               fSaldoAnt := fValInicial;

               iCartAnt := FieldByName('IDCARTEIRAINVEST').AsInteger;
               iInvAnt  := FieldByName('IDINVESTIMENTO').AsInteger;
               sLoteAnt := FieldByName('IDLOTE').AsString;
            end;

            FieldByName('DATAINICIAL').asDateTime   := dDataInicial;
            FieldByName('VALINICIAL').asFloat       := fValInicial;


            OperacaoInvest.BuscaSaldosAplicacao(
                              FieldByName('IDINVESTIMENTO').AsInteger,
                              FieldByName('IDCARTEIRAINVEST').AsInteger,
                              FieldByName('IDLOTE').AsString,
                              FieldByName('DATAMOVCARTINV').AsDateTime,
                              FieldByName('DATAMOVCARTINV').AsDateTime,
                              fValAplic, fRendimento, fResgate,
                              fRendto,fJuros,fVariacao,fAgio);

            sSql := 'SELECT SUM(VLRJUROS) AS JUROS, SUM(VLRVARIACAO) AS VARIACAO ' +
                    'FROM HISTCARTINV ' +
                    'WHERE (IDCARTEIRAINVEST = ' + FieldByName('IDCARTEIRAINVEST').AsString + ') AND ' +
                    '(IDINVESTIMENTO = ' + FieldByName('IDINVESTIMENTO').AsString + ') AND ' +
                    '(IDLOTE = '''+ FieldByName('IDLOTE').AsString + ''' ) AND ' +
                    '(DATAMOVCARTINV = TO_DATE('''+FieldByName('DATAMOVCARTINV').AsString + ''',''DD/MM/YYYY'') AND ' +
                    '(NATURMOVCARTINV IN (''G'',''P'',''L'',''R'')))';
            if FazQuery(QryLocal, sSql) then
            Begin
               FieldByName('JUROS').asFloat := QryLocal.FieldByName('JUROS').AsFloat;
               FieldByName('VARIACAO').asFloat := QryLocal.FieldByName('VARIACAO').AsFloat;
            End;

            fOutrosRend := fRendimento - (QryLocal.FieldByName('JUROS').AsFloat +
                                          QryLocal.FieldByName('VARIACAO').AsFloat);
            if Abs(fOutrosRend) > 0.01 then
               FieldByName('RENDIMENTO').asFloat     := fOutrosRend;


            FieldByName('RESGATE').asFloat        := fResgate;
            // Busca Pagamento de Juros e Amortização de Principal
            with QryBuscaFluxoTitulo do
            begin
               Close;
               ParamByName('dDataRef').AsString         := DmRelatorios.qryExtratoOper.FieldByName('DATAMOVCARTINV').AsString;
               ParamByName('iIdInvestimento').AsInteger := DmRelatorios.qryExtratoOper.FieldByName('IDINVESTIMENTO').AsInteger;
               Open;
               if (FieldByName('VLRFLUXO').asFloat <> 0) and (FieldByName('VLRFLUXO').asFloat <> null) then
               begin
                  DmRelatorios.qryExtratoOper.FieldByName('RESGATE').asFloat :=
                     ABS(DmRelatorios.qryExtratoOper.FieldByName('RESGATE').asFloat + FieldByName('VLRFLUXO').asFloat) * -1;
                  fResgate := ABS(fResgate + FieldByName('VLRFLUXO').asFloat) * -1;
               end;
            end;

            FieldByName('SALDOABERT').asFloat := fSaldoAnt;
            FieldByName('SALDO').asFloat      := fSaldoAnt + fRendimento + fResgate;

            fSaldoAnt := fSaldoAnt + fRendimento + fResgate;


            if FieldByName('NUMDOCUMENTO').IsNull then
            Begin
               sSql := 'SELECT DISTINCT OI.NUMDOCUMENTO ' +
                       'FROM OPERACAOINVEST OI, HISTCARTINV HI ' +
                       'WHERE HI.IDOPERACAOINVEST = OI.IDOPERACAOINVEST(+) AND ' +
                       '(HI.IDCARTEIRAINVEST = ' + FieldByName('IDCARTEIRAINVEST').AsString + ') AND ' +
                       '(HI.IDINVESTIMENTO = ' + FieldByName('IDINVESTIMENTO').AsString + ') AND ' +
                       '(HI.IDLOTE = '''+ FieldByName('IDLOTE').AsString + ''' ) AND ' +
                       '(HI.DATAMOVCARTINV = TO_DATE('''+FieldByName('DATAMOVCARTINV').AsString + ''',''DD/MM/YYYY'') AND ' +
                       '(HI.NATURMOVCARTINV IN (''G'',''P'',''L'',''R'')))';
               if FazQuery(QryLocal, sSql) then
                  FieldByName('NUMDOCUMENTO').AsString := QryLocal.FieldByName('NUMDOCUMENTO').AsString;
            end;
            Post;
            Next;
          End;
          First;
      End;
End;
procedure TFrmParamExtratoOper.FormCreate(Sender: TObject);
begin
  inherited;

  edDataRef.Date := Date;

end;

procedure TFrmParamExtratoOper.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamExtratoOper.edDataRefExit(Sender: TObject);
begin
  inherited;
  If trim(edDataRef.Text) = '' Then
     Begin
         MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
         edDataRef.SetFocus;
     End;
end;

procedure TFrmParamExtratoOper.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.Open;
  QryLote.Open;
end;

procedure TFrmParamExtratoOper.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
  QryLote.Close;
end;

end.
