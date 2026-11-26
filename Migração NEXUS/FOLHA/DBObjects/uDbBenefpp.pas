{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbBenefpp;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBenefpp = class(TCmDbObject)

  private

  public

     Property Unidnegocio: TCmDbField;
     Property Unidnegoc: TCmDbField;
     Property Recpagdevol: TCmDbField;
     Property Recpag: TCmDbField;
     Property Plano: TCmDbField;
     Property Placontadprovis: TCmDbField;
     Property Placontadevolpat: TCmDbField;
     Property Placontadevol: TCmDbField;
     Property Placontad: TCmDbField;
     Property Placontacprovis: TCmDbField;
     Property Placontac: TCmDbField;
     Property Idrubrica: TCmDbField;
     Property Idrubabono: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Idempresaprop: TCmDbField;
     Property Idempresa: TCmDbField;
     Property Idbeneficio: TCmDbField;
     Property Codtiprecebdevol: TCmDbField;
     Property Codtiprecebcap: TCmDbField;
     Property Codtiprecdes: TCmDbField;
     Property Codsubconta: TCmDbField;
     Property Codportforma: TCmDbField;
     Property Codcentrorespon: TCmDbField;
     Property Codcentrocustod: TCmDbField;
     Property Codcentrocustoc: TCmDbField;
     Property Codcentcustdevol: TCmDbField;
     Property Codccustodprovis: TCmDbField;
     Property Codccustodevolpat: TCmDbField;
     Property Codccustocprovis: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBenefpp }

constructor TDbBenefpp.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFPP';

   fUnidnegocio := CreateCmDbField('UNIDNEGOCIO',ftfloat,True,False,False,True);
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,False,False,True);
   fRecpagdevol := CreateCmDbField('RECPAGDEVOL',ftString,True,False,False,True);
   fRecpag := CreateCmDbField('RECPAG',ftString,True,False,False,True);
   fPlano := CreateCmDbField('PLANO',ftfloat,True,False,False,True);
   fPlacontadprovis := CreateCmDbField('PLACONTADPROVIS',ftString,True,False,False,True);
   fPlacontadevolpat := CreateCmDbField('PLACONTADEVOLPAT',ftString,True,False,False,True);
   fPlacontadevol := CreateCmDbField('PLACONTADEVOL',ftString,True,False,False,True);
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,True,False,False,True);
   fPlacontacprovis := CreateCmDbField('PLACONTACPROVIS',ftString,True,False,False,True);
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,True,False,False,True);
   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,True,False,False,True);
   fIdrubabono := CreateCmDbField('IDRUBABONO',ftfloat,True,False,False,True);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True);
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,True,False,False,True);
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False,False,True);
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,False,True,False,True);
   fCodtiprecebdevol := CreateCmDbField('CODTIPRECEBDEVOL',ftString,True,False,False,True);
   fCodtiprecebcap := CreateCmDbField('CODTIPRECEBCAP',ftString,True,False,False,True);
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False,False,True);
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,True,False,False,True);
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False,False,True);
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False,False,True);
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,True,False,False,True);
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,True,False,False,True);
   fCodcentcustdevol := CreateCmDbField('CODCENTCUSTDEVOL',ftString,True,False,False,True);
   fCodccustodprovis := CreateCmDbField('CODCCUSTODPROVIS',ftString,True,False,False,True);
   fCodccustodevolpat := CreateCmDbField('CODCCUSTODEVOLPAT',ftString,True,False,False,True);
   fCodccustocprovis := CreateCmDbField('CODCCUSTOCPROVIS',ftString,True,False,False,True);
end;

function TDbBenefpp.Insert: Boolean;
begin

  
   Result := Inherited Insert;

end;

function TDbBenefpp.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



