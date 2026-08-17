{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/01/2006                             }
{                                                       }
{*******************************************************}

unit uDbMercado;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbMercado = class(TCmDbObject)

  private
    FIdmercado: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FDescmercado: TCmDbField;
    procedure SetDescmercado(const Value: TCmDbField);
    procedure SetIdmercado(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);

  public

     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idmercado: TCmDbField read FIdmercado write SetIdmercado;
     Property Descmercado: TCmDbField read FDescmercado write SetDescmercado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbMercado }

constructor TDbMercado.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MERCADO';

   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'');
   fIdmercado := CreateCmDbField('IDMERCADO',ftfloat,True,True,False,True,'');
   fDescmercado := CreateCmDbField('DESCMERCADO',ftString,True,False,False,True,'');
end;

function TDbMercado.Insert: Boolean;
begin

   fIdmercado.AsFloat := GetSequence('MERCADO');
   Result := Inherited Insert;

end;


procedure TDbMercado.SetDescmercado(const Value: TCmDbField);
begin
  FDescmercado := Value;
end;

procedure TDbMercado.SetIdmercado(const Value: TCmDbField);
begin
  FIdmercado := Value;
end;

procedure TDbMercado.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

end.



