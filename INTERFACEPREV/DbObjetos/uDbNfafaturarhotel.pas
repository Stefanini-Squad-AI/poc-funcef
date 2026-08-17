{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbNfafaturarhotel;

interface
Uses uCmCustomCdbObject,uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbNfafaturarhotel = class(TCmDbObject)

  private
    FDatafatura: TCmDbField;
    FCodcontrato: TCmDbField;
    FDatafaturamento: TCmDbField;
    FIdhotel: TCmDbField;
    FNumvoucher: TCmDbField;
    FIdcodlancamento: TCmDbField;
    FIdforcli: TCmDbField;
    FDatavencimento: TCmDbField;
    FNotafinal: TCmDbField;
    FFlgfaturaimpressa: TCmDbField;
    FDescricao: TCmDbField;
    FNotainicial: TCmDbField;
    FDatapartida: TCmDbField;
    FDatalancamento: TCmDbField;
    FComplementonota: TCmDbField;
    FDatachegada: TCmDbField;
    FValortotal: TCmDbField;
    FFlgadiantamento: TCmDbField;
    procedure SetCodcontrato(const Value: TCmDbField);
    procedure SetComplementonota(const Value: TCmDbField);
    procedure SetDatachegada(const Value: TCmDbField);
    procedure SetDatafatura(const Value: TCmDbField);
    procedure SetDatafaturamento(const Value: TCmDbField);
    procedure SetDatalancamento(const Value: TCmDbField);
    procedure SetDatapartida(const Value: TCmDbField);
    procedure SetDatavencimento(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgadiantamento(const Value: TCmDbField);
    procedure SetFlgfaturaimpressa(const Value: TCmDbField);
    procedure SetIdcodlancamento(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdhotel(const Value: TCmDbField);
    procedure SetNotafinal(const Value: TCmDbField);
    procedure SetNotainicial(const Value: TCmDbField);
    procedure SetNumvoucher(const Value: TCmDbField);
    procedure SetValortotal(const Value: TCmDbField);

  public

     Property Valortotal: TCmDbField read FValortotal write SetValortotal;
     Property Numvoucher: TCmDbField read FNumvoucher write SetNumvoucher;
     Property Notainicial: TCmDbField read FNotainicial write SetNotainicial;
     Property Notafinal: TCmDbField read FNotafinal write SetNotafinal;
     Property Idhotel: TCmDbField read FIdhotel write SetIdhotel;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Idcodlancamento: TCmDbField read FIdcodlancamento write SetIdcodlancamento;
     Property Flgfaturaimpressa: TCmDbField read FFlgfaturaimpressa write SetFlgfaturaimpressa;
     Property Flgadiantamento: TCmDbField read FFlgadiantamento write SetFlgadiantamento;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Datavencimento: TCmDbField read FDatavencimento write SetDatavencimento;
     Property Datapartida: TCmDbField read FDatapartida write SetDatapartida;
     Property Datalancamento: TCmDbField read FDatalancamento write SetDatalancamento;
     Property Datafaturamento: TCmDbField read FDatafaturamento write SetDatafaturamento;
     Property Datafatura: TCmDbField read FDatafatura write SetDatafatura;
     Property Datachegada: TCmDbField read FDatachegada write SetDatachegada;
     Property Complementonota: TCmDbField read FComplementonota write SetComplementonota;
     Property Codcontrato: TCmDbField read FCodcontrato write SetCodcontrato;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbNfafaturarhotel }

constructor TDbNfafaturarhotel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'NFAFATURARHOTEL';

   fValortotal := CreateCmDbField('VALORTOTAL',ftfloat,True,False,False,True,'');
   fNumvoucher := CreateCmDbField('NUMVOUCHER',ftString,False,False,False,True,'');
   fNotainicial := CreateCmDbField('NOTAINICIAL',ftfloat,True,False,False,True,'');
   fNotafinal := CreateCmDbField('NOTAFINAL',ftfloat,True,False,False,True,'');
   fIdhotel := CreateCmDbField('IDHOTEL',ftfloat,False,False,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,True,False,False,True,'');
   fIdcodlancamento := CreateCmDbField('IDCODLANCAMENTO',ftfloat,True,True,False,True,'');
   fFlgfaturaimpressa := CreateCmDbField('FLGFATURAIMPRESSA',ftString,False,False,False,True,'');
   fFlgadiantamento := CreateCmDbField('FLGADIANTAMENTO',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'');
   fDatavencimento := CreateCmDbField('DATAVENCIMENTO',ftDateTime,False,False,False,True,'');
   fDatapartida := CreateCmDbField('DATAPARTIDA',ftDateTime,True,False,False,True,'');
   fDatalancamento := CreateCmDbField('DATALANCAMENTO',ftDateTime,False,False,False,True,'');
   fDatafaturamento := CreateCmDbField('DATAFATURAMENTO',ftDateTime,True,False,False,True,'');
   fDatafatura := CreateCmDbField('DATAFATURA',ftDateTime,False,False,False,True,'');
   fDatachegada := CreateCmDbField('DATACHEGADA',ftDateTime,True,False,False,True,'');
   fComplementonota := CreateCmDbField('COMPLEMENTONOTA',ftString,False,False,False,True,'');
   fCodcontrato := CreateCmDbField('CODCONTRATO',ftfloat,True,False,False,True,'');
end;

function TDbNfafaturarhotel.Insert: Boolean;
begin

   fIdcodlancamento.AsFloat := GetSequence('NFAFATURARHOTEL');
   Result := Inherited Insert;

end;

function TDbNfafaturarhotel.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbNfafaturarhotel.SetCodcontrato(const Value: TCmDbField);
begin
  FCodcontrato := Value;
end;

procedure TDbNfafaturarhotel.SetComplementonota(const Value: TCmDbField);
begin
  FComplementonota := Value;
end;

procedure TDbNfafaturarhotel.SetDatachegada(const Value: TCmDbField);
begin
  FDatachegada := Value;
end;

procedure TDbNfafaturarhotel.SetDatafatura(const Value: TCmDbField);
begin
  FDatafatura := Value;
end;

procedure TDbNfafaturarhotel.SetDatafaturamento(const Value: TCmDbField);
begin
  FDatafaturamento := Value;
end;

procedure TDbNfafaturarhotel.SetDatalancamento(const Value: TCmDbField);
begin
  FDatalancamento := Value;
end;

procedure TDbNfafaturarhotel.SetDatapartida(const Value: TCmDbField);
begin
  FDatapartida := Value;
end;

procedure TDbNfafaturarhotel.SetDatavencimento(const Value: TCmDbField);
begin
  FDatavencimento := Value;
end;

procedure TDbNfafaturarhotel.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbNfafaturarhotel.SetFlgadiantamento(const Value: TCmDbField);
begin
  FFlgadiantamento := Value;
end;

procedure TDbNfafaturarhotel.SetFlgfaturaimpressa(const Value: TCmDbField);
begin
  FFlgfaturaimpressa := Value;
end;

procedure TDbNfafaturarhotel.SetIdcodlancamento(const Value: TCmDbField);
begin
  FIdcodlancamento := Value;
end;

procedure TDbNfafaturarhotel.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbNfafaturarhotel.SetIdhotel(const Value: TCmDbField);
begin
  FIdhotel := Value;
end;

procedure TDbNfafaturarhotel.SetNotafinal(const Value: TCmDbField);
begin
  FNotafinal := Value;
end;

procedure TDbNfafaturarhotel.SetNotainicial(const Value: TCmDbField);
begin
  FNotainicial := Value;
end;

procedure TDbNfafaturarhotel.SetNumvoucher(const Value: TCmDbField);
begin
  FNumvoucher := Value;
end;

procedure TDbNfafaturarhotel.SetValortotal(const Value: TCmDbField);
begin
  FValortotal := Value;
end;

end.



