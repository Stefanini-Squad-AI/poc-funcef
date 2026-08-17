{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 08/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipoalterador;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTipoalterador = class(TCmDbObject)

  private

     FRecpag: TCmDbField;
     FPlano: TCmDbField;
     FPlaconta: TCmDbField;
     FIdusuarioinclusao: TCmDbField;
     FIdpessoa: TCmDbField;
     FIdempresa: TCmDbField;
     FFlgcalculaimposto: TCmDbField;
     FFlgagregasaldo: TCmDbField;
     FFlgagregabaixa: TCmDbField;
     FDescricao: TCmDbField;
     FConverte: TCmDbField;
     FCodsubconta: TCmDbField;
     FCodnatureza: TCmDbField;
     FCodcorresp: TCmDbField;
     FCodcentrocusto: TCmDbField;
     FCodalterador: TCmDbField;
     FAcresdecres: TCmDbField;
     Procedure SetRecpag(const Value: TCmDbField);
     Procedure SetPlano(const Value: TCmDbField);
     Procedure SetPlaconta(const Value: TCmDbField);
     Procedure SetIdusuarioinclusao(const Value: TCmDbField);
     Procedure SetIdpessoa(const Value: TCmDbField);
     Procedure SetIdempresa(const Value: TCmDbField);
     Procedure SetFlgcalculaimposto(const Value: TCmDbField);
     Procedure SetFlgagregasaldo(const Value: TCmDbField);
     Procedure SetFlgagregabaixa(const Value: TCmDbField);
     Procedure SetDescricao(const Value: TCmDbField);
     Procedure SetConverte(const Value: TCmDbField);
     Procedure SetCodsubconta(const Value: TCmDbField);
     Procedure SetCodnatureza(const Value: TCmDbField);
     Procedure SetCodcorresp(const Value: TCmDbField);
     Procedure SetCodcentrocusto(const Value: TCmDbField);
     Procedure SetCodalterador(const Value: TCmDbField);
     Procedure SetAcresdecres(const Value: TCmDbField);


  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Flgcalculaimposto: TCmDbField read FFlgcalculaimposto write SetFlgcalculaimposto;
     Property Flgagregasaldo: TCmDbField read FFlgagregasaldo write SetFlgagregasaldo;
     Property Flgagregabaixa: TCmDbField read FFlgagregabaixa write SetFlgagregabaixa;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Converte: TCmDbField read FConverte write SetConverte;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codnatureza: TCmDbField read FCodnatureza write SetCodnatureza;
     Property Codcorresp: TCmDbField read FCodcorresp write SetCodcorresp;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property Codalterador: TCmDbField read FCodalterador write SetCodalterador;
     Property Acresdecres: TCmDbField read FAcresdecres write SetAcresdecres;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipoalterador }

constructor TDbTipoalterador.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOALTERADOR';

   fRecpag := CreateCmDbField('RECPAG',ftString);
   fPlano := CreateCmDbField('PLANO',ftfloat);
   fPlaconta := CreateCmDbField('PLACONTA',ftString);
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat);
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat);
   fFlgcalculaimposto := CreateCmDbField('FLGCALCULAIMPOSTO',ftString);
   fFlgagregasaldo := CreateCmDbField('FLGAGREGASALDO',ftString);
   fFlgagregabaixa := CreateCmDbField('FLGAGREGABAIXA',ftString);
   fDescricao := CreateCmDbField('DESCRICAO',ftString);
   fConverte := CreateCmDbField('CONVERTE',ftString);
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat);
   fCodnatureza := CreateCmDbField('CODNATUREZA',ftString);
   fCodcorresp := CreateCmDbField('CODCORRESP',ftString);
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString);
   fCodalterador := CreateCmDbField( 'CODALTERADOR',ftfloat,true,true );
   fAcresdecres := CreateCmDbField('ACRESDECRES',ftString);
end;

function TDbTipoalterador.Insert: Boolean;
begin

   fCodalterador.AsFloat := GetSequence('TIPOALTERADOR');
   Result := Inherited Insert;

end;

function TDbTipoalterador.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTipoalterador.SetAcresdecres(const Value: TCmDbField);
begin
     FAcresdecres := value;
end;

procedure TDbTipoalterador.SetCodalterador(const Value: TCmDbField);
begin
     FCodalterador := value;
end;

procedure TDbTipoalterador.SetCodcentrocusto(const Value: TCmDbField);
begin
     FCodcentrocusto := value;
end;

procedure TDbTipoalterador.SetCodcorresp(const Value: TCmDbField);
begin
     FCodcorresp := value;
end;

procedure TDbTipoalterador.SetCodnatureza(const Value: TCmDbField);
begin
     FCodnatureza := value;
end;

procedure TDbTipoalterador.SetCodsubconta(const Value: TCmDbField);
begin
     FCodsubconta := value;
end;

procedure TDbTipoalterador.SetConverte(const Value: TCmDbField);
begin
     FConverte := value;
end;

procedure TDbTipoalterador.SetDescricao(const Value: TCmDbField);
begin
     FDescricao := value;
end;

procedure TDbTipoalterador.SetFlgagregabaixa(const Value: TCmDbField);
begin
     FFlgagregabaixa := value;
end;

procedure TDbTipoalterador.SetFlgagregasaldo(const Value: TCmDbField);
begin
     FFlgagregasaldo := value;
end;

procedure TDbTipoalterador.SetFlgcalculaimposto(const Value: TCmDbField);
begin
     FFlgcalculaimposto := value;
end;

procedure TDbTipoalterador.SetIdempresa(const Value: TCmDbField);
begin
     FIdempresa := value;
end;

procedure TDbTipoalterador.SetIdpessoa(const Value: TCmDbField);
begin
     FIdpessoa := value;
end;

procedure TDbTipoalterador.SetIdusuarioinclusao(const Value: TCmDbField);
begin
     FIdusuarioinclusao := value;
end;

procedure TDbTipoalterador.SetPlaconta(const Value: TCmDbField);
begin
     FPlaconta := value;
end;

procedure TDbTipoalterador.SetPlano(const Value: TCmDbField);
begin
     FPlano := value;
end;

procedure TDbTipoalterador.SetRecpag(const Value: TCmDbField);
begin
     FRecpag := value;
end;

end.



