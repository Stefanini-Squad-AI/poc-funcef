{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbContplanpatro;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbContplanpatro = class(TCmDbObject)

  private

  public

     Property Unidnegoc13: TCmDbField;
     Property Unidnegoc: TCmDbField;
     Property Tipcodigo13: TCmDbField;
     Property Tipcodigo: TCmDbField;
     Property Recpag13: TCmDbField;
     Property Recpagdevol: TCmDbField;
     Property Recpag: TCmDbField;
     Property Plano13: TCmDbField;
     Property Plano: TCmDbField;
     Property Placontad13: TCmDbField;
     Property Placontadprovis: TCmDbField;
     Property Placontadev13: TCmDbField;
     Property Placontadevpat13: TCmDbField;
     Property Placontadevolpat: TCmDbField;
     Property Placontadevol: TCmDbField;
     Property Placontadbanco13: TCmDbField;
     Property Placontadbanco: TCmDbField;
     Property Placontad: TCmDbField;
     Property Placontac13: TCmDbField;
     Property Placontacprovis: TCmDbField;
     Property Placontac: TCmDbField;
     Property Idplanprevcontab: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Idpessjur: TCmDbField;
     Property Idempresa13: TCmDbField;
     Property Idempresaprop13: TCmDbField;
     Property Idempresaprop: TCmDbField;
     Property Idempresa: TCmDbField;
     Property Idcontribuicao: TCmDbField;
     Property Flgtpvlr: TCmDbField;
     Property Codtiprecdes13: TCmDbField;
     Property Codtiprecdes: TCmDbField;
     Property Codtipdoc13: TCmDbField;
     Property Codtipdoc: TCmDbField;
     Property Codtipdesemb13: TCmDbField;
     Property Codtipdesembdevol: TCmDbField;
     Property Codtipdesembcar: TCmDbField;
     Property Codsubconta13: TCmDbField;
     Property Codsubconta: TCmDbField;
     Property Codportforma13: TCmDbField;
     Property Codportforma: TCmDbField;
     Property Codcentrorespon13: TCmDbField;
     Property Codcentrorespon: TCmDbField;
     Property Codcentrocustod13: TCmDbField;
     Property Codcentrocustod: TCmDbField;
     Property Codcentrocustoc13: TCmDbField;
     Property Codcentrocustoc: TCmDbField;
     Property Codccustodprovis: TCmDbField;
     Property Codccustodev13: TCmDbField;
     Property Codccustodevpat13: TCmDbField;
     Property Codccustodevolpat: TCmDbField;
     Property Codccustodevol: TCmDbField;
     Property Codccustocprovis: TCmDbField;
     Property Codalterajuros13: TCmDbField;
     Property Codalteradorjuros: TCmDbField;
     Property Codalteradorcorr: TCmDbField;
     Property Codalteracorr13: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbContplanpatro }

constructor TDbContplanpatro.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTPLANPATRO';

   fUnidnegoc13 := CreateCmDbField('UNIDNEGOC13',ftfloat,True,False,False,True);
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,False,False,True);
   fTipcodigo13 := CreateCmDbField('TIPCODIGO13',ftString,True,False,False,True);
   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,True,False,False,True);
   fRecpag13 := CreateCmDbField('RECPAG13',ftString,True,False,False,True);
   fRecpagdevol := CreateCmDbField('RECPAGDEVOL',ftString,True,False,False,True);
   fRecpag := CreateCmDbField('RECPAG',ftString,True,False,False,True);
   fPlano13 := CreateCmDbField('PLANO13',ftfloat,True,False,False,True);
   fPlano := CreateCmDbField('PLANO',ftfloat,True,False,False,True);
   fPlacontad13 := CreateCmDbField('PLACONTAD13',ftString,True,False,False,True);
   fPlacontadprovis := CreateCmDbField('PLACONTADPROVIS',ftString,True,False,False,True);
   fPlacontadev13 := CreateCmDbField('PLACONTADEV13',ftString,True,False,False,True);
   fPlacontadevpat13 := CreateCmDbField('PLACONTADEVPAT13',ftString,True,False,False,True);
   fPlacontadevolpat := CreateCmDbField('PLACONTADEVOLPAT',ftString,True,False,False,True);
   fPlacontadevol := CreateCmDbField('PLACONTADEVOL',ftString,True,False,False,True);
   fPlacontadbanco13 := CreateCmDbField('PLACONTADBANCO13',ftString,True,False,False,True);
   fPlacontadbanco := CreateCmDbField('PLACONTADBANCO',ftString,True,False,False,True);
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,True,False,False,True);
   fPlacontac13 := CreateCmDbField('PLACONTAC13',ftString,True,False,False,True);
   fPlacontacprovis := CreateCmDbField('PLACONTACPROVIS',ftString,True,False,False,True);
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,True,False,False,True);
   fIdplanprevcontab := CreateCmDbField('IDPLANPREVCONTAB',ftfloat,True,False,False,True);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True,False,True);
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,True,False,True);
   fIdempresa13 := CreateCmDbField('IDEMPRESA13',ftfloat,True,False,False,True);
   fIdempresaprop13 := CreateCmDbField('IDEMPRESAPROP13',ftfloat,True,False,False,True);
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,True,False,False,True);
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False,False,True);
   fIdcontribuicao := CreateCmDbField('IDCONTRIBUICAO',ftfloat,False,True,False,True);
   fFlgtpvlr := CreateCmDbField('FLGTPVLR',ftString,True,False,False,True);
   fCodtiprecdes13 := CreateCmDbField('CODTIPRECDES13',ftString,True,False,False,True);
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False,False,True);
   fCodtipdoc13 := CreateCmDbField('CODTIPDOC13',ftfloat,True,False,False,True);
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,True,False,False,True);
   fCodtipdesemb13 := CreateCmDbField('CODTIPDESEMB13',ftString,True,False,False,True);
   fCodtipdesembdevol := CreateCmDbField('CODTIPDESEMBDEVOL',ftString,True,False,False,True);
   fCodtipdesembcar := CreateCmDbField('CODTIPDESEMBCAR',ftString,True,False,False,True);
   fCodsubconta13 := CreateCmDbField('CODSUBCONTA13',ftfloat,True,False,False,True);
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,True,False,False,True);
   fCodportforma13 := CreateCmDbField('CODPORTFORMA13',ftfloat,True,False,False,True);
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False,False,True);
   fCodcentrorespon13 := CreateCmDbField('CODCENTRORESPON13',ftString,True,False,False,True);
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False,False,True);
   fCodcentrocustod13 := CreateCmDbField('CODCENTROCUSTOD13',ftString,True,False,False,True);
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,True,False,False,True);
   fCodcentrocustoc13 := CreateCmDbField('CODCENTROCUSTOC13',ftString,True,False,False,True);
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,True,False,False,True);
   fCodccustodprovis := CreateCmDbField('CODCCUSTODPROVIS',ftString,True,False,False,True);
   fCodccustodev13 := CreateCmDbField('CODCCUSTODEV13',ftString,True,False,False,True);
   fCodccustodevpat13 := CreateCmDbField('CODCCUSTODEVPAT13',ftString,True,False,False,True);
   fCodccustodevolpat := CreateCmDbField('CODCCUSTODEVOLPAT',ftString,True,False,False,True);
   fCodccustodevol := CreateCmDbField('CODCCUSTODEVOL',ftString,True,False,False,True);
   fCodccustocprovis := CreateCmDbField('CODCCUSTOCPROVIS',ftString,True,False,False,True);
   fCodalterajuros13 := CreateCmDbField('CODALTERAJUROS13',ftfloat,True,False,False,True);
   fCodalteradorjuros := CreateCmDbField('CODALTERADORJUROS',ftfloat,True,False,False,True);
   fCodalteradorcorr := CreateCmDbField('CODALTERADORCORR',ftfloat,True,False,False,True);
   fCodalteracorr13 := CreateCmDbField('CODALTERACORR13',ftfloat,True,False,False,True);
end;

function TDbContplanpatro.Insert: Boolean;
begin

   
   Result := Inherited Insert;

end;

function TDbContplanpatro.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



