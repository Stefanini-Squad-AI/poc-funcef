{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/12/2003                             }
{                                                       }
{*******************************************************}

unit uDbLancOperContImob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLancOperContImob = class(TCmDbObject)

  private
    FPlncodigo: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdLancOperContImo: TCmDbField;
    FDatalancto: TCmDbField;
    procedure SetDatalancto(const Value: TCmDbField);
    procedure SetIdLancOperContImo(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);

  public

     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property IdLancOperContImo: TCmDbField read FIdLancOperContImo write SetIdLancOperContImo;
     Property Datalancto: TCmDbField read FDatalancto write SetDatalancto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLancOperContImob }

constructor TDbLancOperContImob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LANCOPERCONTIMOB';

   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,False,False,True,'');
   fIdLancOperContImo := CreateCmDbField('IDLANCOPERCONTIMO',ftfloat,True,True,False,True,'');
   fDatalancto := CreateCmDbField('DATALANCTO',ftDateTime,False,False,False,True,'');
end;

function TDbLancOperContImob.Insert: Boolean;
begin

   fIdLancOperContImo.AsFloat := GetSequence('LANCOPERCONTIMOB');
   Result := Inherited Insert;

end;


procedure TDbLancOperContImob.SetDatalancto(const Value: TCmDbField);
begin
  FDatalancto := Value;
end;

procedure TDbLancOperContImob.SetIdLancOperContImo(const Value: TCmDbField);
begin
  FIdLancOperContImo := Value;
end;

procedure TDbLancOperContImob.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbLancOperContImob.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

end.



