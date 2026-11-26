{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbBenefretroativo;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBenefretroativo = class(TCmDbObject)

  private

  public

     Property Recpag: TCmDbField;
     Property Plano: TCmDbField;
     Property Placontad: TCmDbField;
     Property Placontac: TCmDbField;
     Property Idretroativo: TCmDbField;
     Property Idregraultpagto: TCmDbField;
     Property Idregraprimpagto: TCmDbField;
     Property Idregracalculo: TCmDbField;
     Property Idregracalcabono: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Idmotivo: TCmDbField;
     Property Idempresaprop: TCmDbField;
     Property Idempresa: TCmDbField;
     Property Idbeneficio: TCmDbField;
     Property Codsubcontad: TCmDbField;
     Property Codsubcontac: TCmDbField;
     Property Codcentrocustod: TCmDbField;
     Property Codcentrocustoc: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBenefretroativo }

constructor TDbBenefretroativo.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFRETROATIVO';

   fRecpag := CreateCmDbField('RECPAG',ftString,True,False,False,True);
   fPlano := CreateCmDbField('PLANO',ftfloat,True,False,False,True);
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,True,False,False,True);
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,True,False,False,True);
   fIdretroativo := CreateCmDbField('IDRETROATIVO',ftfloat,False,True,False,True);
   fIdregraultpagto := CreateCmDbField('IDREGRAULTPAGTO',ftfloat,True,False,False,True);
   fIdregraprimpagto := CreateCmDbField('IDREGRAPRIMPAGTO',ftfloat,True,False,False,True);
   fIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,True,False,False,True);
   fIdregracalcabono := CreateCmDbField('IDREGRACALCABONO',ftfloat,True,False,False,True);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True,False,True);
   fIdmotivo := CreateCmDbField('IDMOTIVO',ftfloat,True,False,False,True);
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,True,False,False,True);
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False,False,True);
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,False,True,False,True);
   fCodsubcontad := CreateCmDbField('CODSUBCONTAD',ftfloat,True,False,False,True);
   fCodsubcontac := CreateCmDbField('CODSUBCONTAC',ftfloat,True,False,False,True);
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,True,False,False,True);
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,True,False,False,True);
end;

function TDbBenefretroativo.Insert: Boolean;
begin

   
   Result := Inherited Insert;

end;

function TDbBenefretroativo.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



