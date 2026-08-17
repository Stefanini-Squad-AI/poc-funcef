unit FParamLimBancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UOperacaoInvest,
  UOperComum, dOperComum, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamLimBancos = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataRefExit(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamLimBancos: TFrmParamLimBancos;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, FDmRelatorios, UBibliotecaInvest;

Procedure TfrmParamLimBancos.FazQry;
var
    QryLocal :TwwQuery;
    dDataInicial : TDateTime;
    fValInicial, fValAplic, fRendimento, fResgate : double;
    fSaldo : double;
Begin
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    With DmRelatorios.qryLimBancos Do
      Begin
          DmRelatorios.RptLimBancosDataRef.Caption := edDataRef.Text;
          Close;
          Sql.Clear;
          Sql.add(' SELECT                                                              ');
          Sql.add('     EM.SIGLAEMISSOR, EM.IDEMISSOR, EM.IDCLASSINSTFIN,               ');
          Sql.add('     CL.SIGLACLASSINSTFIN,  CL.PERCLIMINSTFIN,                       ');
          Sql.add('     TO_DATE('''')  AS DATA, (0) AS PATRIMONIO, (0) AS LIMITE,         ');
          Sql.add('     (0) AS APLIC1D, (0) AS APLIC30D, (0) AS APLIC60D, (0) AS TOTAL, ');
          Sql.add('     (0) AS FOLGA1, (0) AS FOLGA2, (0) AS FOLGA3, (0) AS FUNDOS,     ');
          Sql.add('     (0) AS PARTICIPACAO                                             ');
          Sql.add('  FROM                                                               ');
          Sql.add('     EMISSOR EM, CLASSINSTFIN CL                                     ');
          Sql.add('  WHERE                                                              ');
          Sql.add('     (EM.FLGINSTFIN = ''S'') AND                                       ');
          Sql.add('     (EM.IDCLASSINSTFIN = CL.IDCLASSINSTFIN)                         ');
          Sql.add('  ORDER BY                                                           ');
          Sql.add('        EM.SIGLAEMISSOR                                              ');
          Open;
          First;
          While Not EOF Do Begin
            Edit;

            FazQuery(QryLocal,
              'SELECT  VPE.DATAREFPREMISSOR, VPE.VLRPARAMEMISSOR '+
              'FROM    VALPARAMXEMISSOR VPE, PARAMINVEST PAR '+
              'WHERE  (VPE.IDEMISSOR = '+ QuotedStr(FieldByName('IDEMISSOR').AsString)+')'+
              '   AND (VPE.IDPARAMEMISSOR  =  PAR.IDPARAMPATRLIQ) '+
              '   AND (VPE.DATAREFPREMISSOR = '+
              '        (SELECT MAX(VP1.DATAREFPREMISSOR) '+
              '         FROM   VALPARAMXEMISSOR VP1 '+
              '         WHERE (VP1.IDEMISSOR =VPE.IDEMISSOR) AND '+
              '               (VP1.IDPARAMEMISSOR   =VPE.IDPARAMEMISSOR) AND '+
              '               (VP1.DATAREFPREMISSOR  <= TO_DATE( '''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY'')))) ');


            FieldByName('DATA').asDateTime    := QryLocal.FieldByName('DATAREFPREMISSOR').asDateTime;
            FieldByName('PATRIMONIO').asFloat := QryLocal.FieldByName('VLRPARAMEMISSOR').asFloat;
            FieldByName('LIMITE').asFloat     := FieldByName('PERCLIMINSTFIN').asFloat / 100 *
                                                 QryLocal.FieldByName('VLRPARAMEMISSOR').asFloat;

            OperacaoInvest.BuscaSaldoAplicEmissor(
                            FieldByName('IDEMISSOR').AsInteger, 1,
                            edDataRef.Date, StrToDate('01/01/1990'), edDataRef.Date + 1, fSaldo);
            FieldByName('APLIC1D').asFloat := fSaldo;

            OperacaoInvest.BuscaSaldoAplicEmissor(
                            FieldByName('IDEMISSOR').AsInteger, 1,
                            edDataRef.Date, edDataRef.Date + 2, edDataRef.Date + 30, fSaldo);
            FieldByName('APLIC30D').asFloat := fSaldo;

            OperacaoInvest.BuscaSaldoAplicEmissor(
                            FieldByName('IDEMISSOR').AsInteger, 1,
                            edDataRef.Date, edDataRef.Date + 31, StrToDate('01/01/3000'), fSaldo);
            FieldByName('APLIC60D').asFloat := fSaldo;

            OperacaoInvest.BuscaSaldoAplicEmissor(
                            FieldByName('IDEMISSOR').AsInteger, 2,
                            edDataRef.Date, edDataRef.Date + 31, StrToDate('01/01/3000'), fSaldo);
            FieldByName('FUNDOS').asFloat := fSaldo;

            FieldByName('TOTAL').asFloat := FieldByName('APLIC1D').asFloat +
                                            FieldByName('APLIC30D').asFloat +
                                            FieldByName('APLIC60D').asFloat;

            FieldByName('FOLGA1').asFloat := FieldByName('LIMITE').asFloat -
                                             FieldByName('TOTAL').asFloat;

            if FieldByName('LIMITE').asFloat <> 0 then begin
              FieldByName('FOLGA2').asFloat := FieldByName('TOTAL').asFloat /
                                               FieldByName('LIMITE').asFloat * 100;
              FieldByName('FOLGA3').asFloat := (FieldByName('TOTAL').asFloat +
                                                FieldByName('FUNDOS').asFloat) /
                                               FieldByName('LIMITE').asFloat * 100;
            end else begin
              FieldByName('FOLGA2').asFloat := 0;
              FieldByName('FOLGA3').asFloat := 0;
            end;

            Post;
            Next;
          End;
          First;
      End;
End;
procedure TFrmParamLimBancos.FormCreate(Sender: TObject);
begin
  inherited;

  edDataRef.Date := Date;

end;

procedure TFrmParamLimBancos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamLimBancos.edDataRefExit(Sender: TObject);
begin
  inherited;
  If trim(edDataRef.Text) = '' Then
     Begin
         MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
         edDataRef.SetFocus;
     End;
end;

end.
