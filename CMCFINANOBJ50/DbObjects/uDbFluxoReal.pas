{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 27/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbFluxoReal;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbFluxoReal = class(TCmDbObject)

  private
    FIdempresa: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIdplanoprev: TCmDbField;
    FValor: TCmDbField;
    FMoecodigo: TCmDbField;
    FRecpag: TCmDbField;
    FIdfluxoreal: TCmDbField;
    FCodtipdoc: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdpatro: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FIdprograma: TCmDbField;
    FIdpessoa: TCmDbField;
    FDatacfloat: TCmDbField;
    FCodPortador: TCmDbField;

  public

     Property Valor: TCmDbField read FValor write FValor;
     Property Unidnegoc: TCmDbField read FUnidnegoc write FUnidnegoc;
     Property Recpag: TCmDbField read FRecpag write FRecpag;
     Property Moecodigo: TCmDbField read FMoecodigo write FMoecodigo;
     Property Idprograma: TCmDbField read FIdprograma write FIdprograma;
     Property Idplanoprev: TCmDbField read FIdplanoprev write FIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write FIdpatro;
     Property Idfluxoreal: TCmDbField read FIdfluxoreal write FIdfluxoreal;
     Property Idempresa: TCmDbField read FIdempresa write FIdempresa;
     Property Datacfloat: TCmDbField read FDatacfloat write FDatacfloat;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write FCodtiprecdes;
     Property Codtipdoc: TCmDbField read FCodtipdoc write FCodtipdoc;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write FCodcentrorespon;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write FCodcentrocusto;
     Property CodPortador: TCmDbField read FCodPortador write FCodPortador;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbFluxoReal }

constructor TDbFluxoReal.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FLUXOREAL';

   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,False,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,True,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,False,False,True,'');
   fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdfluxoreal := CreateCmDbField('IDFLUXOREAL',ftfloat,True,True,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fDatacfloat := CreateCmDbField('DATACFLOAT',ftDateTime,True,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False,False,True,'');
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   FCodPortador := CreateCmDbField('CODPORTADOR',ftFloat,False,False,False,True,'');
end;



function TDbFluxoReal.Insert: Boolean;
begin
   fIdfluxoreal.AsFloat := GetSequence('FLUXOREAL');
   Result := Inherited Insert;
end;



function TDbFluxoReal.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;



end.
