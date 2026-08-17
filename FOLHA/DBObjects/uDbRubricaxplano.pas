{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbRubricaxplano;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbRubricaxplano = class(TCmDbObject)

  private

  public

     Property Unidnegoc: TCmDbField;
     Property Tipcodigo: TCmDbField;
     Property Recpag: TCmDbField;
     Property Plano: TCmDbField;
     Property Placontad: TCmDbField;
     Property Placontac: TCmDbField;
     Property Idrubrica: TCmDbField;
     Property Idplanprevcontab: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Idpessjur: TCmDbField;
     Property Idempresaprop: TCmDbField;
     Property Idempresa: TCmDbField;
     Property Flgcompoesalpart: TCmDbField;
     Property Flgcompoesalbenef: TCmDbField;
     Property Flgcompoeremtotal: TCmDbField;
     Property Codtiprecdesfav: TCmDbField;
     Property Codtiprecdes: TCmDbField;
     Property Codtipdoc: TCmDbField;
     Property Codsubconta: TCmDbField;
     Property Codportforma: TCmDbField;
     Property Codcentrorespon: TCmDbField;
     Property Codcentrocustod: TCmDbField;
     Property Codcentrocustoc: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbRubricaxplano }

constructor TDbRubricaxplano.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RUBRICAXPLANO';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,False);
   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,True,False);
   fRecpag := CreateCmDbField('RECPAG',ftString,True,False);
   fPlano := CreateCmDbField('PLANO',ftfloat,True,False);
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,True,False);
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,True,False);
   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,False,True);
   fIdplanprevcontab := CreateCmDbField('IDPLANPREVCONTAB',ftfloat,True,False);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False);
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,True);
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,True,False);
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False);
   fFlgcompoesalpart := CreateCmDbField('FLGCOMPOESALPART',ftfloat,True,False);
   fFlgcompoesalbenef := CreateCmDbField('FLGCOMPOESALBENEF',ftfloat,True,False);
   fFlgcompoeremtotal := CreateCmDbField('FLGCOMPOEREMTOTAL',ftfloat,True,False);
   fCodtiprecdesfav := CreateCmDbField('CODTIPRECDESFAV',ftString,True,False);
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False);
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,True,False);
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,True,False);
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False);
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False);
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,True,False);
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,True,False);
end;

function TDbRubricaxplano.Insert: Boolean;
begin

   
   Result := Inherited Insert;

end;

end.



