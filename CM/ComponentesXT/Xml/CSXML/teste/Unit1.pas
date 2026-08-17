unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Database1: TDatabase;
    Query1: TQuery;
    Query1IDRESERVASFRONT: TFloatField;
    Query1IDROOMLIST: TFloatField;
    Query1IDCONTATOCLIENTE: TFloatField;
    Query1STATUSRESERVA: TFloatField;
    Query1IDHOTEL: TFloatField;
    Query1CODUH: TStringField;
    Query1IDTARIFA: TFloatField;
    Query1CODSEGMENTO: TStringField;
    Query1IDDOCUMENTO: TFloatField;
    Query1IDCLUBES: TFloatField;
    Query1IDMEIOCOMUNICACAO: TFloatField;
    Query1IDPROMOTOR: TFloatField;
    Query1IDVEICULOS: TFloatField;
    Query1IDORIGEM: TFloatField;
    Query1IDMOTIVO: TFloatField;
    Query1CLIENTEHOSPEDE: TFloatField;
    Query1CONTRATOFINAL: TFloatField;
    Query1CLIENTERESERVANTE: TFloatField;
    Query1CONTRATOINICIAL: TFloatField;
    Query1IDGRUPOUH: TFloatField;
    Query1IDPACOTE: TFloatField;
    Query1TIPOUHESTADIA: TFloatField;
    Query1TIPOUHTARIFA: TFloatField;
    Query1RESERVANTE: TStringField;
    Query1TELRESERVANTE: TStringField;
    Query1DATACHEGPREVISTA: TDateTimeField;
    Query1HORACHEGPREVISTA: TDateTimeField;
    Query1DATAPARTPREVISTA: TDateTimeField;
    Query1HORAPARTPREVISTA: TDateTimeField;
    Query1ADULTOS: TFloatField;
    Query1CRIANCAS1: TFloatField;
    Query1CRIANCAS2: TFloatField;
    Query1CODPENSAO: TStringField;
    Query1VLRDIARIA: TFloatField;
    Query1PERCDESCONTODIARIA: TFloatField;
    Query1GARANTENOSHOW: TStringField;
    Query1DATACONFIRMACAO: TDateTimeField;
    Query1DATARESERVA: TDateTimeField;
    Query1HORARESERVA: TDateTimeField;
    Query1AJUSTE: TStringField;
    Query1POOLLISTA: TStringField;
    Query1VLRUPSAILING: TFloatField;
    Query1AUTOCHECKOUT: TStringField;
    Query1DATAINIDEPOSITO: TDateTimeField;
    Query1DATAFIMDEPOSITO: TDateTimeField;
    Query1DATADEPOSITO: TDateTimeField;
    Query1VLRDIARIASDEPOSITO: TFloatField;
    Query1VLREXTRASDEPOSITO: TFloatField;
    Query1PERCPREPAGDEPOSITO: TFloatField;
    Query1WALKIN: TStringField;
    Query1OBSERVACOES: TMemoField;
    Query1DOCUMENTO: TStringField;
    Query1NUMRESERVA: TFloatField;
    Query1FLAGCOMPARTILHADA: TStringField;
    Query1DATACHEGADAREAL: TDateTimeField;
    Query1HORACHEGADAREAL: TDateTimeField;
    Query1DATAPARTIDAREAL: TDateTimeField;
    Query1HORAPARTIDAREAL: TDateTimeField;
    Query1VLRDIFDIARIA: TFloatField;
    Query1VLRDIARIAPADRAO: TFloatField;
    Query1IDRESERVAMULTROOM: TFloatField;
    Query1NUMCANCELAMENTO: TFloatField;
    Query1DATAVALCARTAO: TStringField;
    Query1USUARIO: TFloatField;
    Query1DATAPRORROGRES: TDateTimeField;
    Query1DATAULTALTERACAO: TDateTimeField;
    Query1DATAREATIVACAO: TDateTimeField;
    Query1DATAREATIVACAONS: TDateTimeField;
    Query1DATACANCELAMENTO: TDateTimeField;
    Query1FLGDIARIAFIXA: TStringField;
    Query1TRGDTINCLUSAO: TDateTimeField;
    Query1TRGUSERINCLUSAO: TStringField;
    Query1NUMRESERVAGDS: TFloatField;
    Query1IDUSUALTERACAO: TFloatField;
    Query1IDEVENTO: TFloatField;
    Query1LOCRESERVA: TFloatField;
    Query1NUMVOO: TStringField;
    Query1VLRPENSAO: TFloatField;
    Query1REQVIAGEM: TStringField;
    Query1MATRICFUNC: TStringField;
    Query1CENTROCUSTO: TStringField;
    Query1NOMEDEPTO: TStringField;
    Query1NUMCARTVIRTUAL: TStringField;
    Query1ESTABELEC: TStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses XMLWriter;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var XML: TXMLWriter;
    i: integer;
begin
  XML := TXMLStreamWriter.Create(TFileStream.Create('reserva.xml',
      fmCreate), True, True);
  try
    // this example creates a near copy of the sample.xml file used in Charlie
    // Calvert's XML demos which can be found at:
    // http://homepages.borland.com/ccalvert/TechPapers/Delphi/XMLBrowse/index.htm
    XML.StartDoc;
    XML.WriteTag('RESERVA');
    //XML.WriteStandaloneDocumentDeclaration;
    Query1.Open;
    for i := 0 to pred(Query1.FieldCount) do
      if not Query1.Fields[i].IsNull then
        case Query1.Fields[i].DataType of
          ftString: XML.WriteBasicData(Query1.Fields[i].FieldName,Query1.Fields[i].AsString);
          ftSmallint,
          ftInteger: XML.WriteBasicData(Query1.Fields[i].FieldName,Query1.Fields[i].AsInteger);
          ftFloat,
          ftCurrency: XML.WriteBasicData(Query1.Fields[i].FieldName,Query1.Fields[i].AsFloat, XML.DecimalDigits(Query1.Fields[i].AsFloat));
          ftDate,
          ftTime,
          ftDateTime: XML.WriteBasicData(Query1.Fields[i].FieldName,Query1.Fields[i].AsDateTime);
          else
            ShowMessage(Query1.Fields[i].FieldName);

      end;
    XML.WriteTag('RESERVA', xttEnding);
    XML.EndDoc;
  finally
    XML.Free;
    Query1.Close;
  end;
end;

end.
