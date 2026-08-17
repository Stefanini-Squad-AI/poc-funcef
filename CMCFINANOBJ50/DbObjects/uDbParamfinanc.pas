{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 29/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamfinanc;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbParamfinanc = class(TCmDbObject)

  private
    FFlgdesverm: TCmDbField;
    FFlgcalcimposto: TCmDbField;
    FDatabloqdispfinan: TCmDbField;
    FCodcormonet: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodvarcambial: TCmDbField;
    FFlgseparadata: TCmDbField;
    FFlgexibecolexp: TCmDbField;
    FFlgconfirmarecpag: TCmDbField;
    FFlgimpcheque: TCmDbField;
    FIntegracontab: TCmDbField;
    FCoddirjurere: TCmDbField;
    FCodempjurere: TCmDbField;
    FTrdfinalcap: TCmDbField;
    FTipoaplicacao: TCmDbField;
    FCodtipdocinvest: TCmDbField;
    FFlgorcadoprevisto: TCmDbField;
    FTrdfinalcar: TCmDbField;
    FTitsaldotransp: TCmDbField;
    FCodjuros: TCmDbField;
    FPlano: TCmDbField;
    FFlgatualflx: TCmDbField;
    FDiasbloqorclp: TCmDbField;
    FDiasbloqorcmp: TCmDbField;
    FSubcontanaoident: TCmDbField;
    FContalancnaoident: TCmDbField;
    FTitsaldoant: TCmDbField;
    FDiasbloqorccp: TCmDbField;
    FCcustolancnaoid: TCmDbField;
    FIdempresa: TCmDbField;
    FFlgDispBloq : TCmDbField;
    FFlgIntDispFin : TCmDbField;
    FCodtipocustagreg :TCmDbField;

    //  Rodolpho da Silva - 25/02/2005
    FIdPrograma: TCmDbField;
    FCodCentroCusto: TCmDbField;



  public

     Property Trdfinalcar: TCmDbField read FTrdfinalcar write FTrdfinalcar;
     Property Trdfinalcap: TCmDbField read FTrdfinalcap write FTrdfinalcap;
     Property Titsaldotransp: TCmDbField read FTitsaldotransp write FTitsaldotransp;
     Property Titsaldoant: TCmDbField read FTitsaldoant write FTitsaldoant;
     Property Tipoaplicacao: TCmDbField read FTipoaplicacao write FTipoaplicacao;
     Property Subcontanaoident: TCmDbField read FSubcontanaoident write FSubcontanaoident;
     Property Plano: TCmDbField read FPlano write FPlano;
     Property Integracontab: TCmDbField read FIntegracontab write FIntegracontab;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idempresa: TCmDbField read FIdempresa write FIdempresa;
     Property Flgseparadata: TCmDbField read FFlgseparadata write FFlgseparadata;
     Property Flgorcadoprevisto: TCmDbField read FFlgorcadoprevisto write FFlgorcadoprevisto;
     Property Flgimpcheque: TCmDbField read FFlgimpcheque write FFlgimpcheque;
     Property Flgexibecolexp: TCmDbField read FFlgexibecolexp write FFlgexibecolexp;
     Property Flgdesverm: TCmDbField read FFlgdesverm write FFlgdesverm;
     Property Flgconfirmarecpag: TCmDbField read FFlgconfirmarecpag write FFlgconfirmarecpag;
     Property Flgcalcimposto: TCmDbField read FFlgcalcimposto write FFlgcalcimposto;
     Property Flgatualflx: TCmDbField read FFlgatualflx write FFlgatualflx;
     Property Diasbloqorcmp: TCmDbField read FDiasbloqorcmp write FDiasbloqorcmp;
     Property Diasbloqorclp: TCmDbField read FDiasbloqorclp write FDiasbloqorclp;
     Property Diasbloqorccp: TCmDbField read FDiasbloqorccp write FDiasbloqorccp;
     Property Databloqdispfinan: TCmDbField read FDatabloqdispfinan write FDatabloqdispfinan;
     Property Contalancnaoident: TCmDbField read FContalancnaoident write FContalancnaoident;
     Property Codvarcambial: TCmDbField read FCodvarcambial write FCodvarcambial;
     Property Codtipdocinvest: TCmDbField read FCodtipdocinvest write FCodtipdocinvest;
     Property Codjuros: TCmDbField read FCodjuros write FCodjuros;
     Property Codempjurere: TCmDbField read FCodempjurere write FCodempjurere;
     Property Coddirjurere: TCmDbField read FCoddirjurere write FCoddirjurere;
     Property Codcormonet: TCmDbField read FCodcormonet write FCodcormonet;
     Property Ccustolancnaoid: TCmDbField read FCcustolancnaoid write FCcustolancnaoid;
     Property FlgDispBloq: TCmDbField read FFlgDispBloq write FFlgDispBloq;
     Property FlgIntDispFin: TCmDbField read FFlgIntDispFin write FFlgIntDispFin;



     
     //  Rodolpho da Silva - 25/02/2005
     Property IdPrograma: TCmDbField read FIdPrograma write FIdPrograma;
     Property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
     //  Rodolpho da Silva - 25/02/2005





     // Marchetti

     property Codtipocustagreg: TCmDbField read FCodtipocustagreg  write FCodtipocustagreg;
     // Fim Marchetti

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
     Function PegaCampos : String;
  End;

implementation

{ TDbParamfinanc }

constructor TDbParamfinanc.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'PARAMFINANC';

   fTrdfinalcar := CreateCmDbField('TRDFINALCAR',ftString,False,False,False,True,'');
   fTrdfinalcap := CreateCmDbField('TRDFINALCAP',ftString,False,False,False,True,'');
   fTitsaldotransp := CreateCmDbField('TITSALDOTRANSP',ftString,False,False,False,True,'');
   fTitsaldoant := CreateCmDbField('TITSALDOANT',ftString,False,False,False,True,'');
   fTipoaplicacao := CreateCmDbField('TIPOAPLICACAO',ftfloat,False,False,False,True,'');
   fSubcontanaoident := CreateCmDbField('SUBCONTANAOIDENT',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fIntegracontab := CreateCmDbField('INTEGRACONTAB',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fFlgseparadata := CreateCmDbField('FLGSEPARADATA',ftString,False,False,False,True,'');
   fFlgorcadoprevisto := CreateCmDbField('FLGORCADOPREVISTO',ftString,False,False,False,True,'');
   fFlgimpcheque := CreateCmDbField('FLGIMPCHEQUE',ftString,False,False,False,True,'');
   fFlgexibecolexp := CreateCmDbField('FLGEXIBECOLEXP',ftString,False,False,False,True,'');
   fFlgdesverm := CreateCmDbField('FLGDESVERM',ftString,False,False,False,True,'');
   fFlgconfirmarecpag := CreateCmDbField('FLGCONFIRMARECPAG',ftString,False,False,False,True,'');
   fFlgcalcimposto := CreateCmDbField('FLGCALCIMPOSTO',ftString,False,False,False,True,'');
   fFlgatualflx := CreateCmDbField('FLGATUALFLX',ftString,False,False,False,True,'');
   fDiasbloqorcmp := CreateCmDbField('DIASBLOQORCMP',ftfloat,False,False,False,True,'');
   fDiasbloqorclp := CreateCmDbField('DIASBLOQORCLP',ftfloat,False,False,False,True,'');
   fDiasbloqorccp := CreateCmDbField('DIASBLOQORCCP',ftfloat,False,False,False,True,'');
   fDatabloqdispfinan := CreateCmDbField('DATABLOQDISPFINAN',ftDateTime,False,False,False,True,'');
   fContalancnaoident := CreateCmDbField('CONTALANCNAOIDENT',ftString,False,False,False,True,'');
   fCodvarcambial := CreateCmDbField('CODVARCAMBIAL',ftfloat,False,False,False,True,'');
   fCodtipdocinvest := CreateCmDbField('CODTIPDOCINVEST',ftfloat,False,False,False,True,'');
   fCodjuros := CreateCmDbField('CODJUROS',ftfloat,False,False,False,True,'');
   fCodempjurere := CreateCmDbField('CODEMPJURERE',ftString,False,False,False,True,'');
   fCoddirjurere := CreateCmDbField('CODDIRJURERE',ftString,False,False,False,True,'');
   fCodcormonet := CreateCmDbField('CODCORMONET',ftfloat,False,False,False,True,'');
   fCcustolancnaoid := CreateCmDbField('CCUSTOLANCNAOID',ftString,False,False,False,True,'');
   flgDispBloq := CreateCmDbField('FLGDISPBLOQ',ftString,False,False,False,True,'');
   flgIntDispFin := CreateCmDbField('FLGINTDISPFIN',ftString,False,False,False,True,'');
   FCodtipocustagreg :=CreateCmDbField('CODTIPOCUSTAGREG',ftFloat,False,False,False,True,'');



   //  Rodolpho da Silva - 25/02/2005
   FIdPrograma :=CreateCmDbField('IDPROGRAMA',ftFloat,False,False,False,True,'');
   FCodCentroCusto :=CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   //  Rodolpho da Silva - 25/02/2005




end;

function TDbParamfinanc.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbParamfinanc.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

function TDbParamfinanc.PegaCampos: String;
begin
  Result := GetFieldsForSelect;

end;

end.



