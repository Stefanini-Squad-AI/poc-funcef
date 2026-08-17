{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 05/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbLancPrevContimob;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbLancPrevContimob = class(TCmDbObject)

  private
    FPlncodigo: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdlancprevcontimob: TCmDbField;
    FDatalancto: TCmDbField;
    procedure SetDatalancto(const Value: TCmDbField);
    procedure SetIdlancprevcontimob(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);

  public

     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idlancprevcontimob: TCmDbField read FIdlancprevcontimob write SetIdlancprevcontimob;
     Property Datalancto: TCmDbField read FDatalancto write SetDatalancto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLancPrevContimob }

constructor TDbLancPrevContimob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LANCPREVCONTIMOB';

   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdlancprevcontimob := CreateCmDbField('IDLANCPREVCONTIMOB',ftfloat,True,True,False,True,'');
   fDatalancto := CreateCmDbField('DATALANCTO',ftDateTime,False,False,False,True,'');
end;

function TDbLancPrevContimob.Insert: Boolean;
begin

   fIdlancprevcontimob.AsFloat := GetSequence('LANCPREVCONTIMOB');
   Result := Inherited Insert;

end;


procedure TDbLancPrevContimob.SetDatalancto(const Value: TCmDbField);
begin
  FDatalancto := Value;
end;

procedure TDbLancPrevContimob.SetIdlancprevcontimob(
  const Value: TCmDbField);
begin
  FIdlancprevcontimob := Value;
end;

procedure TDbLancPrevContimob.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbLancPrevContimob.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

end.



