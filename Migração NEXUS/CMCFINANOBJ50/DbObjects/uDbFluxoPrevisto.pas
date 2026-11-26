{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 06/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbFluxoPrevisto;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbFluxoPrevisto = class(TCmDbObject)

  private
    FFlgprevisao: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FValor: TCmDbField;
    FIdpatro: TCmDbField;
    FUnidnegoc: TCmDbField;
    FCodtipdoc: TCmDbField;
    FIdfluxoprevisto: TCmDbField;
    FRecpag: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FDataprogramada: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FIdempresa: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdprograma: TCmDbField;
    FIdplanoprev: TCmDbField;

  public

     Property Valor: TCmDbField read FValor write FValor;
     Property Unidnegoc: TCmDbField read FUnidnegoc write FUnidnegoc;
     Property Recpag: TCmDbField read FRecpag write FRecpag;
     Property Idprograma: TCmDbField read FIdprograma write FIdprograma;
     Property Idplanoprev: TCmDbField read FIdplanoprev write FIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write FIdpatro;
     Property Idfluxoprevisto: TCmDbField read FIdfluxoprevisto write FIdfluxoprevisto;
     Property Idempresa: TCmDbField read FIdempresa write FIdempresa;
     Property Flgprevisao: TCmDbField read FFlgprevisao write FFlgprevisao;
     Property Dataprogramada: TCmDbField read FDataprogramada write FDataprogramada;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write FCodtiprecdes;
     Property Codtipdoc: TCmDbField read FCodtipdoc write FCodtipdoc;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write FCodcentrorespon;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write FCodcentrocusto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbFluxoPrevisto }

constructor TDbFluxoPrevisto.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FLUXOPREVISTO';

   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,False,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,True,False,False,True,'');
   fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdfluxoprevisto := CreateCmDbField('IDFLUXOPREVISTO',ftfloat,True,True,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fFlgprevisao := CreateCmDbField('FLGPREVISAO',ftString,False,False,False,True,'');
   fDataprogramada := CreateCmDbField('DATAPROGRAMADA',ftDateTime,True,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False,False,True,'');
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
end;

function TDbFluxoPrevisto.Insert: Boolean;
begin
   fIdfluxoprevisto.AsFloat := GetSequence('FLUXOPREVISTO');
   Result := Inherited Insert;
end;

function TDbFluxoPrevisto.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

end.



