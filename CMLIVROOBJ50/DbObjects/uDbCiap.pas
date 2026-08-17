{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 12/08/2002                             }
{                                                       }
{*******************************************************}

unit uDbCiap;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCiap = class(TCmDbObject)

  private
    FIdbem: TCmDbField;
    FEntrada: TCmDbField;
    FNfsaida: TCmDbField;
    FIdhotel: TCmDbField;
    FCodigo: TCmDbField;
    FIdciap: TCmDbField;
    FDatasaida: TCmDbField;
    FTipoevento: TCmDbField;
    FFolhalre: TCmDbField;
    FData: TCmDbField;
    FNumerolre: TCmDbField;
    FCodmodelo: TCmDbField;
    FNf: TCmDbField;
    FSaida: TCmDbField;
    FIdforcli: TCmDbField;
    FDescri: TCmDbField;
    FDataocorrencia: TCmDbField;
    FIdpessoa: TCmDbField;
    procedure SetCodigo(const Value: TCmDbField);
    procedure SetCodmodelo(const Value: TCmDbField);
    procedure SetData(const Value: TCmDbField);
    procedure SetDataocorrencia(const Value: TCmDbField);
    procedure SetDatasaida(const Value: TCmDbField);
    procedure SetDescri(const Value: TCmDbField);
    procedure SetEntrada(const Value: TCmDbField);
    procedure SetFolhalre(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdciap(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdhotel(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNf(const Value: TCmDbField);
    procedure SetNfsaida(const Value: TCmDbField);
    procedure SetNumerolre(const Value: TCmDbField);
    procedure SetSaida(const Value: TCmDbField);
    procedure SetTipoevento(const Value: TCmDbField);

  public

     Property Tipoevento: TCmDbField read FTipoevento write SetTipoevento;
     Property Saida: TCmDbField read FSaida write SetSaida;
     Property Numerolre: TCmDbField read FNumerolre write SetNumerolre;
     Property Nfsaida: TCmDbField read FNfsaida write SetNfsaida;
     Property Nf: TCmDbField read FNf write SetNf;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idhotel: TCmDbField read FIdhotel write SetIdhotel;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Idciap: TCmDbField read FIdciap write SetIdciap;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Folhalre: TCmDbField read FFolhalre write SetFolhalre;
     Property Entrada: TCmDbField read FEntrada write SetEntrada;
     Property Descri: TCmDbField read FDescri write SetDescri;
     Property Datasaida: TCmDbField read FDatasaida write SetDatasaida;
     Property Dataocorrencia: TCmDbField read FDataocorrencia write SetDataocorrencia;
     Property Data: TCmDbField read FData write SetData;
     Property Codmodelo: TCmDbField read FCodmodelo write SetCodmodelo;
     Property Codigo: TCmDbField read FCodigo write SetCodigo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCiap }

constructor TDbCiap.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CIAP';

   fTipoevento := CreateCmDbField('TIPOEVENTO',ftString,False,False,False,True,'');
   fSaida := CreateCmDbField('SAIDA',ftfloat,False,False,False,True,'');
   fNumerolre := CreateCmDbField('NUMEROLRE',ftfloat,False,False,False,True,'');
   fNfsaida := CreateCmDbField('NFSAIDA',ftfloat,False,False,False,True,'');
   fNf := CreateCmDbField('NF',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdhotel := CreateCmDbField('IDHOTEL',ftfloat,False,False,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'');
   fIdciap := CreateCmDbField('IDCIAP',ftfloat,True,True,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,False,False,False,True,'');
   fFolhalre := CreateCmDbField('FOLHALRE',ftfloat,False,False,False,True,'');
   fEntrada := CreateCmDbField('ENTRADA',ftfloat,False,False,False,True,'');
   fDescri := CreateCmDbField('DESCRI',ftString,False,False,False,True,'');
   fDatasaida := CreateCmDbField('DATASAIDA',ftDateTime,False,False,False,True,'');
   fDataocorrencia := CreateCmDbField('DATAOCORRENCIA',ftDateTime,False,False,False,True,'');
   fData := CreateCmDbField('DATA',ftDateTime,False,False,False,True,'');
   fCodmodelo := CreateCmDbField('CODMODELO',ftString,False,False,False,True,'');
   fCodigo := CreateCmDbField('CODIGO',ftfloat,False,False,False,True,'');
end;

function TDbCiap.Insert: Boolean;
begin

   fIdciap.AsFloat := GetSequence('CIAP');
   Result := Inherited Insert;

end;


procedure TDbCiap.SetCodigo(const Value: TCmDbField);
begin
  FCodigo := Value;
end;

procedure TDbCiap.SetCodmodelo(const Value: TCmDbField);
begin
  FCodmodelo := Value;
end;

procedure TDbCiap.SetData(const Value: TCmDbField);
begin
  FData := Value;
end;

procedure TDbCiap.SetDataocorrencia(const Value: TCmDbField);
begin
  FDataocorrencia := Value;
end;

procedure TDbCiap.SetDatasaida(const Value: TCmDbField);
begin
  FDatasaida := Value;
end;

procedure TDbCiap.SetDescri(const Value: TCmDbField);
begin
  FDescri := Value;
end;

procedure TDbCiap.SetEntrada(const Value: TCmDbField);
begin
  FEntrada := Value;
end;

procedure TDbCiap.SetFolhalre(const Value: TCmDbField);
begin
  FFolhalre := Value;
end;

procedure TDbCiap.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDbCiap.SetIdciap(const Value: TCmDbField);
begin
  FIdciap := Value;
end;

procedure TDbCiap.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbCiap.SetIdhotel(const Value: TCmDbField);
begin
  FIdhotel := Value;
end;

procedure TDbCiap.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbCiap.SetNf(const Value: TCmDbField);
begin
  FNf := Value;
end;

procedure TDbCiap.SetNfsaida(const Value: TCmDbField);
begin
  FNfsaida := Value;
end;

procedure TDbCiap.SetNumerolre(const Value: TCmDbField);
begin
  FNumerolre := Value;
end;

procedure TDbCiap.SetSaida(const Value: TCmDbField);
begin
  FSaida := Value;
end;

procedure TDbCiap.SetTipoevento(const Value: TCmDbField);
begin
  FTipoevento := Value;
end;

end.



