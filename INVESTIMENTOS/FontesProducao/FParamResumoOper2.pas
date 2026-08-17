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

unit FParamResumoOper2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UOperacaoInvest,
  UOperComum, dOperComum, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamResumoOper2 = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    Label4: TLabel;
    dblcCarteira: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
    RgCotacaoPor: TRadioGroup;
    cbxBoletaVencResg: TCheckBox;
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
  FrmParamResumoOper2: TFrmParamResumoOper2;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, FDmRelatorio, UBibliotecaInvest ;

Procedure TfrmParamResumoOper2.FazQry;
var
    QryLocal :TwwQuery;
    dDataInicial : TDateTime;
    fValInicial, fValAplic, fRendimento, fResgate, wCotacao1,wSaldoInutil,wVlrSaldoInvest : double;
    fSaldo,fJuros,fVariacao,fAgio,fRendto : double;
    UsaLote:Boolean;
Begin
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    With DtmRelatorio.qryResumoOper2 Do
      Begin
          DtmRelatorio.RptResumoOperDataRef.Caption := edDataRef.Text;
          Close;
          Sql.Clear;
          Sql.add(' SELECT                                                                               ');
          Sql.add('     CA.DESCCARTINVEST, TP.DESCTIPRENFIXA, H1.IDLOTE,                                 ');
          Sql.add('     H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, H1.SALDOVLRINVCART, H1.SALDOQTDEINVCART, ');
          Sql.add('     IV.DESCINVESTIMENTO,                                                             ');
          Sql.add('     TO_DATE('''') AS DATAINICIAL, (0) AS VALAPLIC, (0) AS COTACAO,                   ');
          Sql.add('     (0) AS SALDO ');
          Sql.add('  FROM                                                                             ');
          Sql.add('     HISTCARTINV H1,  CARTEIRAINVEST CA, INVESTIMENTO IV,                 ');
          Sql.add('     TITRENFIXA TT, TIPOTITRENFIXA TP                                        ');
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

          Sql.add('    AND (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST) ');
          Sql.add('    AND (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO)   ');
          Sql.add('    AND (IV.IDINVESTIMENTO = TT.IDTITRENFIXA)           ');
          Sql.add('    AND (TT.CODTIPRENFIXA = TP.CODTIPRENFIXA)           ');
          Sql.add('    AND (H1.SALDOVLRINVCART <> 0)                       ');
          Sql.add('    AND (H1.SALDOQTDEINVCART <> 0)                      ');          

          if cbxBoletaVencResg.Checked = False then
             Sql.add('    AND (IV.FLGATIVO <> ''N'')                          ');

          Sql.add('    AND ((TT.DATAVENCTITRENFIX >= TO_DATE('''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY'')) ');
          Sql.add('    OR  (TT.DATAVENCTITRENFIX IS NULL))                 ');
          Sql.add('  ORDER BY                                              ');
          Sql.add('        CA.DESCCARTINVEST,                              ');
          Sql.add('        TP.DESCTIPRENFIXA,                              ');
          Sql.add('        H1.IDLOTE                                       ');
          Open;
          First;
          While Not EOF Do Begin
            Edit;
            OperacaoInvest.BuscaInicioAplicacao(
                              FieldByName('IDINVESTIMENTO').AsInteger,
                              FieldByName('IDCARTEIRAINVEST').AsInteger,
                              FieldByName('IDLOTE').AsString, dDataInicial, fValInicial);
            OperacaoInvest.BuscaSaldosAplicacao(
                              FieldByName('IDINVESTIMENTO').AsInteger,
                              FieldByName('IDCARTEIRAINVEST').AsInteger,
                              FieldByName('IDLOTE').AsString, dDataInicial, edDataRef.Date,
                              fValAplic, fRendimento, fResgate,
                              fRendto,fJuros,fVariacao,fAgio);
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
                               wSaldoInutil, wSaldoInutil,    wSaldoInutil, wSaldoInutil, wSaldoInutil,
                               wSaldoInutil, wSaldoInutil,    wSaldoInutil, wSaldoInutil, wSaldoInutil,
                               wSaldoInutil, wSaldoInutil,    wSaldoInutil, wSaldoInutil);


            FieldByName('DATAINICIAL').asDateTime := dDataInicial;
            FieldByName('VALAPLIC').asFloat       := fValAplic;
            FieldByName('SALDO').asFloat          := wVlrSaldoInvest;
            fSaldo := wVlrSaldoInvest ;

// Cotacao Por Lote ou Investimento
            If RgCotacaoPor.ItemIndex = 0 Then
              UsaLote:=False
            Else
              UsaLote:=True;
            FieldByName('COTACAO').asFloat := OperComum.DivValorZero(FieldByName('SALDO').asFloat,
                                               FieldByName('SALDOQTDEINVCART').asFloat);


            Post;
            Next;
          End;
          First;
      End;
End;
procedure TFrmParamResumoOper2.FormCreate(Sender: TObject);
begin
  inherited;

  edDataRef.Date := Date;

end;

procedure TFrmParamResumoOper2.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;

end;

procedure TFrmParamResumoOper2.edDataRefExit(Sender: TObject);
begin
  inherited;
  If trim(edDataRef.Text) = '' Then
     Begin
         MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
         edDataRef.SetFocus;
     End;
end;

procedure TFrmParamResumoOper2.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.open;
end;

procedure TFrmParamResumoOper2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
end;

end.
