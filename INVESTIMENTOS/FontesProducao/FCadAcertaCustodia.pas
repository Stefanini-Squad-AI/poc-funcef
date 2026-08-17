unit FCadAcertaCustodia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, wwdblook, Db, Wwdatsrc, DBTables, Wwquery, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls;

type
  TFrmCadAcertaCustodia = class(TfrmOkCancelarInv)
    Label1: TLabel;
    dDtaIni: TCMDateTimePicker;
    dDtaFim: TCMDateTimePicker;
    Label2: TLabel;
    qryConsCarteira: TwwQuery;
    qryConsCarteiraDESCCARTINVEST: TStringField;
    qryConsCarteiraIDCARTEIRAINVEST: TFloatField;
    dtsConsCarteira: TwwDataSource;
    dblConsCarteira: TwwDBLookupCombo;
    Label3: TLabel;
    QryConciliaCustodia: TwwQuery;
    QryUpdHistCustodia: TwwQuery;
    dblConsInvestimento: TwwDBLookupCombo;
    Label4: TLabel;
    QryInvestimento: TwwQuery;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    LbSaldo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadAcertaCustodia: TFrmCadAcertaCustodia;

implementation

{$R *.DFM}

uses UDiasUteisInv, dBaseDados, UMensErro;

procedure TFrmCadAcertaCustodia.FormShow(Sender: TObject);
begin
  inherited;
   qryConsCarteira.Open;
   QryInvestimento.Open;
end;

procedure TFrmCadAcertaCustodia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryConsCarteira.Close;
end;

procedure TFrmCadAcertaCustodia.bbtnConfirmarClick(Sender: TObject);
var
   dDataInicial, dDataFinal : TDateTime;
begin
  inherited;

   dDataInicial    := dDtaIni.Date;
   While not DiasUteisInv.DiaUtil(dDataInicial,-1,1,'',True,False,False) Do
      dDataInicial := dDataInicial + 1;

   dDataFinal      := dDtaFim.Date;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   While dDataInicial <= dDataFinal Do
   begin
      QryConciliaCustodia.Close;
      QryConciliaCustodia.ParamByName('DATA').AsString := DateToStr(dDataInicial);
      QryConciliaCustodia.ParamByName('IDCARTEIRAINVEST').AsInteger := StrToInt(dblConsCarteira.LookupValue);
      QryConciliaCustodia.ParamByName('IDINVESTIMENTO').AsInteger   := StrToInt(dblConsInvestimento.LookupValue);
      QryConciliaCustodia.Open;

      QryConciliaCustodia.First;
      While Not QryConciliaCustodia.Eof Do
      begin
         QryUpdHistCustodia.Close;
         QryUpdHistCustodia.ParamByName('SALDOLIBERADO').AsFloat :=
                     (QryConciliaCustodia.FieldByName('SALDOLIBERADO').AsFloat +
                         QryConciliaCustodia.FieldByName('DIFERENCA').AsFloat);
         QryUpdHistCustodia.ParamByName('IDCUSTODIA').AsInteger  :=
                         QryConciliaCustodia.FieldByName('IDCUSTODIA').AsInteger;
         QryUpdHistCustodia.ExecSQL;
         QryUpdHistCustodia.Close;            

         LbSaldo.Caption :=   FloatToStrF(QryConciliaCustodia.FieldByName('SALDOLIBERADO').AsFloat +
                                          QryConciliaCustodia.FieldByName('DIFERENCA').AsFloat,ffNumber,18,2);
         QryConciliaCustodia.Next;
      end;

      QryConciliaCustodia.Close;

      dDataInicial := dDataInicial + 1;
      While not DiasUteisInv.DiaUtil(dDataInicial,-1,1,'',True,False,False) Do
        dDataInicial := dDataInicial + 1;

   end;


   If (MsgDlg('Processo Concluído. Confirma?',
               'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrYes)  Then
       DtmBaseDados.dbBaseDados.Commit
   Else
       DtmBaseDados.dbBaseDados.RollBack;

end;

end.
