{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbBenefplanpatro;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBenefplanpatro = class(TCmDbObject)

  private

  public

     Property Unidnegocabn: TCmDbField;
     Property Unidnegoc: TCmDbField;
     Property Tipcodigoabn: TCmDbField;
     Property Tipcodigo: TCmDbField;
     Property Recpagdevol: TCmDbField;
     Property Recpagabn: TCmDbField;
     Property Recpag: TCmDbField;
     Property Planoabn: TCmDbField;
     Property Plano: TCmDbField;
     Property Placontadprovis: TCmDbField;
     Property Placontadevpata: TCmDbField;
     Property Placontadevolpat: TCmDbField;
     Property Placontadevola: TCmDbField;
     Property Placontadevol: TCmDbField;
     Property Placontadabn: TCmDbField;
     Property Placontad: TCmDbField;
     Property Placontacprovis: TCmDbField;
     Property Placontacabn: TCmDbField;
     Property Placontac: TCmDbField;
     Property Idplanprevcontab: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Idpessjur: TCmDbField;
     Property Idempresapropabn: TCmDbField;
     Property Idempresaprop: TCmDbField;
     Property Idempresaabn: TCmDbField;
     Property Idempresa: TCmDbField;
     Property Idbeneficio: TCmDbField;
     Property Codtiprecebdevol: TCmDbField;
     Property Codtiprecebcap: TCmDbField;
     Property Codtiprecdesabn: TCmDbField;
     Property Codtiprecdes: TCmDbField;
     Property Codtipdocabn: TCmDbField;
     Property Codtipdoc: TCmDbField;
     Property Codsubcontaabn: TCmDbField;
     Property Codsubconta: TCmDbField;
     Property Codrecebcapabn: TCmDbField;
     Property Codportformaabn: TCmDbField;
     Property Codportforma: TCmDbField;
     Property Codcentrorespona: TCmDbField;
     Property Codcentrorespon: TCmDbField;
     Property Codcentrocustoda: TCmDbField;
     Property Codcentrocustod: TCmDbField;
     Property Codcentrocustoca: TCmDbField;
     Property Codcentrocustoc: TCmDbField;
     Property Codccustodprovis: TCmDbField;
     Property Codccustodevpata: TCmDbField;
     Property Codccustodevolpat: TCmDbField;
     Property Codccustodevola: TCmDbField;
     Property Codccustodevol: TCmDbField;
     Property Codccustocprovis: TCmDbField;
     Property Codalterajurosabn: TCmDbField;
     Property Codalteradorcorr: TCmDbField;
     Property Codalteracorrabn: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBenefplanpatro }

constructor TDbBenefplanpatro.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFPLANPATRO';

   fUnidnegocabn := CreateCmDbField('UNIDNEGOCABN',ftfloat,True,False,False,True);
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,False,False,True);
   fTipcodigoabn := CreateCmDbField('TIPCODIGOABN',ftString,True,False,False,True);
   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,True,False,False,True);
   fRecpagdevol := CreateCmDbField('RECPAGDEVOL',ftString,True,False,False,True);
   fRecpagabn := CreateCmDbField('RECPAGABN',ftString,True,False,False,True);
   fRecpag := CreateCmDbField('RECPAG',ftString,True,False,False,True);
   fPlanoabn := CreateCmDbField('PLANOABN',ftfloat,True,False,False,True);
   fPlano := CreateCmDbField('PLANO',ftfloat,True,False,False,True);
   fPlacontadprovis := CreateCmDbField('PLACONTADPROVIS',ftString,True,False,False,True);
   fPlacontadevpata := CreateCmDbField('PLACONTADEVPATA',ftString,True,False,False,True);
   fPlacontadevolpat := CreateCmDbField('PLACONTADEVOLPAT',ftString,True,False,False,True);
   fPlacontadevola := CreateCmDbField('PLACONTADEVOLA',ftString,True,False,False,True);
   fPlacontadevol := CreateCmDbField('PLACONTADEVOL',ftString,True,False,False,True);
   fPlacontadabn := CreateCmDbField('PLACONTADABN',ftString,True,False,False,True);
   fPlacontad := CreateCmDbField('PLACONTAD',ftString,True,False,False,True);
   fPlacontacprovis := CreateCmDbField('PLACONTACPROVIS',ftString,True,False,False,True);
   fPlacontacabn := CreateCmDbField('PLACONTACABN',ftString,True,False,False,True);
   fPlacontac := CreateCmDbField('PLACONTAC',ftString,True,False,False,True);
   fIdplanprevcontab := CreateCmDbField('IDPLANPREVCONTAB',ftfloat,True,False,False,True);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True,False,True);
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,True,False,True);
   fIdempresapropabn := CreateCmDbField('IDEMPRESAPROPABN',ftfloat,True,False,False,True);
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,True,False,False,True);
   fIdempresaabn := CreateCmDbField('IDEMPRESAABN',ftfloat,True,False,False,True);
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False,False,True);
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,False,True,False,True);
   fCodtiprecebdevol := CreateCmDbField('CODTIPRECEBDEVOL',ftString,True,False,False,True);
   fCodtiprecebcap := CreateCmDbField('CODTIPRECEBCAP',ftString,True,False,False,True);
   fCodtiprecdesabn := CreateCmDbField('CODTIPRECDESABN',ftString,True,False,False,True);
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False,False,True);
   fCodtipdocabn := CreateCmDbField('CODTIPDOCABN',ftfloat,True,False,False,True);
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,True,False,False,True);
   fCodsubcontaabn := CreateCmDbField('CODSUBCONTAABN',ftfloat,True,False,False,True);
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,True,False,False,True);
   fCodrecebcapabn := CreateCmDbField('CODRECEBCAPABN',ftString,True,False,False,True);
   fCodportformaabn := CreateCmDbField('CODPORTFORMAABN',ftfloat,True,False,False,True);
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False,False,True);
   fCodcentrorespona := CreateCmDbField('CODCENTRORESPONA',ftString,True,False,False,True);
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False,False,True);
   fCodcentrocustoda := CreateCmDbField('CODCENTROCUSTODA',ftString,True,False,False,True);
   fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,True,False,False,True);
   fCodcentrocustoca := CreateCmDbField('CODCENTROCUSTOCA',ftString,True,False,False,True);
   fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,True,False,False,True);
   fCodccustodprovis := CreateCmDbField('CODCCUSTODPROVIS',ftString,True,False,False,True);
   fCodccustodevpata := CreateCmDbField('CODCCUSTODEVPATA',ftString,True,False,False,True);
   fCodccustodevolpat := CreateCmDbField('CODCCUSTODEVOLPAT',ftString,True,False,False,True);
   fCodccustodevola := CreateCmDbField('CODCCUSTODEVOLA',ftString,True,False,False,True);
   fCodccustodevol := CreateCmDbField('CODCCUSTODEVOL',ftString,True,False,False,True);
   fCodccustocprovis := CreateCmDbField('CODCCUSTOCPROVIS',ftString,True,False,False,True);
   fCodalterajurosabn := CreateCmDbField('CODALTERAJUROSABN',ftfloat,True,False,False,True);
   fCodalteradorcorr := CreateCmDbField('CODALTERADORCORR',ftfloat,True,False,False,True);
   fCodalteracorrabn := CreateCmDbField('CODALTERACORRABN',ftfloat,True,False,False,True);
end;

function TDbBenefplanpatro.Insert: Boolean;
begin

   
   Result := Inherited Insert;

end;

function TDbBenefplanpatro.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



