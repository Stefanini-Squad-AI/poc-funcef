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

unit FParamResumoOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UOperacaoInvest,
  ComCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamResumoOper = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    Label4: TLabel;
    dblcCarteira: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
    Animate1: TAnimate;
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
  FrmParamResumoOper: TFrmParamResumoOper;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, FDmRelatorios, UBibliotecaInvest, UOperComum;

Procedure TfrmParamResumoOper.FazQry;
var
    QryLocal :TwwQuery;
    dDataInicial : TDateTime;
    fValInicial, fValAplic, fRendimento, fResgate, wVlrSaldoInvest, wSaldoInutil : double;
    fSaldo,fJuros,fVariacao,fAgio,fRendto : double;
Begin
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    Animate1.Visible:=True;
    Animate1.Active :=True;


    With DmRelatorios.qryResumoOper Do
      Begin
          DmRelatorios.RptResumoOperDataRef.Caption := edDataRef.Text;
          Close;
          Sql.Clear;
          Sql.add(' SELECT                                                                            ');
          Sql.add('     CA.DESCCARTINVEST, TP.DESCTIPRENFIXA, H1.IDLOTE, E.SIGLAEMISSOR AS NOME,                      ');
          Sql.add('     H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, H1.SALDOVLRINVCART,                   ');
          Sql.add('     IV.DESCINVESTIMENTO, IV.FLGATIVO,                                             ');
          Sql.add('     TO_DATE('''') AS DATAINICIAL, (0) AS VALAPLIC, (0) AS RENDIMENTO, (0) AS RESGATE,');
          Sql.add('     (0) AS SALDO ');
          Sql.add('  FROM                                                                             ');
          Sql.add('     EMISSOR E, HISTCARTINV H1,  CARTEIRAINVEST CA, INVESTIMENTO IV,    ');
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

          Sql.add('    AND (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)     ');
          Sql.add('    AND (H1.IDINVESTIMENTO  = IV.IDINVESTIMENTO)        ');
          Sql.add('    AND (IV.IDINVESTIMENTO  = TT.IDTITRENFIXA)          ');
          Sql.add('    AND (TT.CODTIPRENFIXA   = TP.CODTIPRENFIXA)         ');
          Sql.add('    AND (E.IDEMISSOR        = IV.IDEMISSOR)             ');

          if cbxBoletaVencResg.Checked = False then
             Sql.add('    AND (IV.FLGATIVO <> ''N'')                          ');

          Sql.add('    AND (H1.SALDOVLRINVCART <> 0)                       ');
          Sql.add('    AND ((TT.DATAVENCTITRENFIX >= TO_DATE('''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY'')) ');
          Sql.add('    OR  (TT.DATAVENCTITRENFIX IS NULL))                 ');
          Sql.add('  ORDER BY                                              ');
          Sql.add('        H1.IDLOTE                                       ');
          Open;
          First;

          While Not EOF Do Begin
            Edit;
            OperacaoInvest.BuscaInicioAplicacao(
                              FieldByName('IDINVESTIMENTO').AsInteger,
                              FieldByName('IDCARTEIRAINVEST').AsInteger,
                              FieldByName('IDLOTE').AsString, dDataInicial, fValInicial);
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

            OperacaoInvest.BuscaSaldosAplicacao(
                              FieldByName('IDINVESTIMENTO').AsInteger,
                              FieldByName('IDCARTEIRAINVEST').AsInteger,
                              FieldByName('IDLOTE').AsString, dDataInicial, edDataRef.Date,
                              fValAplic, fRendimento, fResgate,
                              fRendto,fJuros,fVariacao,fAgio);

            FieldByName('DATAINICIAL').asDateTime := dDataInicial;
            FieldByName('VALAPLIC').asFloat       := fValAplic;
            FieldByName('RENDIMENTO').asFloat     := fRendimento;
            FieldByName('RESGATE').asFloat        := fResgate;
            FieldByName('SALDO').asFloat          := wVlrSaldoInvest;
            fSaldo :=  (wVlrSaldoInvest);

            Post;
            Next;
          End;
          First;
      End;
  Animate1.Visible:=False;
  Animate1.Active :=False;

End;
procedure TFrmParamResumoOper.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := Date;

end;

procedure TFrmParamResumoOper.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;

end;

procedure TFrmParamResumoOper.edDataRefExit(Sender: TObject);
begin
  inherited;
  If trim(edDataRef.Text) = '' Then
     Begin
         MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
         edDataRef.SetFocus;
     End;
end;

procedure TFrmParamResumoOper.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.open;
end;

procedure TFrmParamResumoOper.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
end;

end.
