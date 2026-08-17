{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 07/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbNaturezaestoque;

interface

Uses uCmCustomCDbObject, uCmDbObject, DB, uDataBase;

Type
  TDbNaturezaestoque = class(TCmDbObject)

  private
    FCodnatureza: TCmDbField;
    FIdnaturezaestoque: TCmDbField;
    FDescnatureza: TCmDbField;
    procedure SetCodnatureza(const Value: TCmDbField);
    procedure SetDescnatureza(const Value: TCmDbField);
    procedure SetIdnaturezaestoque(const Value: TCmDbField);

  public

     Property Idnaturezaestoque: TCmDbField read FIdnaturezaestoque write SetIdnaturezaestoque;
     Property Descnatureza: TCmDbField read FDescnatureza write SetDescnatureza;
     Property Codnatureza: TCmDbField read FCodnatureza write SetCodnatureza;

     Constructor Create (Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbNaturezaestoque }

constructor TDbNaturezaestoque.Create (Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'NATUREZAESTOQUE';

   fIdnaturezaestoque := CreateCmDbField('IDNATUREZAESTOQUE',ftfloat,True,True,False,True,'');
   fDescnatureza := CreateCmDbField('DESCNATUREZA',ftString,True,False,False,True,'');
   fCodnatureza := CreateCmDbField('CODNATUREZA',ftString,True,False,False,True,'');
end;

function TDbNaturezaestoque.Insert: Boolean;
begin

   fIdnaturezaestoque.AsFloat := GetSequence('NATUREZAESTOQUE');
   Result := Inherited Insert;

end;

function TDbNaturezaestoque.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbNaturezaestoque.SetCodnatureza(const Value: TCmDbField);
begin
  FCodnatureza := Value;
end;

procedure TDbNaturezaestoque.SetDescnatureza(const Value: TCmDbField);
begin
  FDescnatureza := Value;
end;

procedure TDbNaturezaestoque.SetIdnaturezaestoque(const Value: TCmDbField);
begin
  FIdnaturezaestoque := Value;
end;

end.



