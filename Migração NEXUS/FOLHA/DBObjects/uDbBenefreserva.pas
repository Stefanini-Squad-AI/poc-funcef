{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbBenefreserva;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBenefreserva = class(TCmDbObject)

  private

  public

     Property Numordem: TCmDbField;
     Property Idtiporeserva: TCmDbField;
     Property Idregraabaterese: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Idbeneficio: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBenefreserva }

constructor TDbBenefreserva.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFRESERVA';

   fNumordem := CreateCmDbField('NUMORDEM',ftfloat,False,False,False,True);
   fIdtiporeserva := CreateCmDbField('IDTIPORESERVA',ftfloat,False,True,False,True);
   fIdregraabaterese := CreateCmDbField('IDREGRAABATERESE',ftfloat,True,False,False,True);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True,False,True);
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,False,True,False,True);
end;

function TDbBenefreserva.Insert: Boolean;
begin

   
   Result := Inherited Insert;

end;

function TDbBenefreserva.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



