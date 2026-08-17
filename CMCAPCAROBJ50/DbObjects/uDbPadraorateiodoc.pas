{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 21/05/2003                             }
{                                                       }
{*******************************************************}

unit uDbPadraorateiodoc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPadraorateiodoc = class(TCmDbObject)

  private
    FRecpag: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FPercentrateio: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdempresaprop: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FIdpatro: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdgruporateio: TCmDbField;
    FIdpadrrateiodoc: TCmDbField;
    FIdprograma: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdgruporateio(const Value: TCmDbField);
    procedure SetIdpadrrateiodoc(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetPercentrateio(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Percentrateio: TCmDbField read FPercentrateio write SetPercentrateio;
     Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idpadrrateiodoc: TCmDbField read FIdpadrrateiodoc write SetIdpadrrateiodoc;
     Property Idgruporateio: TCmDbField read FIdgruporateio write SetIdgruporateio;
     Property Idempresaprop: TCmDbField read FIdempresaprop write SetIdempresaprop;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPadraorateiodoc }

constructor TDbPadraorateiodoc.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'PADRAORATEIODOC';

   fUnidnegoc        := CreateCmDbField('UNIDNEGOC',        ftfloat,  False, False, False, True, '');
   fRecpag           := CreateCmDbField('RECPAG',           ftString, False, False, False, True, '');
   fPercentrateio    := CreateCmDbField('PERCENTRATEIO',    ftfloat,  False, False, False, True, '');
   fIdprograma       := CreateCmDbField('IDPROGRAMA',       ftfloat,  False, False, False, True, '');
   fIdplanoprev      := CreateCmDbField('IDPLANOPREV',      ftfloat,  False, False, False, True, '');
   fIdpatro          := CreateCmDbField('IDPATRO',          ftfloat,  False, False, False, True, '');
   fIdpadrrateiodoc  := CreateCmDbField('IDPADRRATEIODOC',  ftfloat,  True,  True,  False, True, '');
   fIdgruporateio    := CreateCmDbField('IDGRUPORATEIO',    ftfloat,  False, False, False, True, '');
   fIdempresaprop    := CreateCmDbField('IDEMPRESAPROP',    ftfloat,  False, False, False, True, '');
   fCodtiprecdes     := CreateCmDbField('CODTIPRECDES',     ftString, False, False, False, True, '');
   fCodcentrorespon  := CreateCmDbField('CODCENTRORESPON',  ftString, False, False, False, True, '');
   fCodcentrocusto   := CreateCmDbField('CODCENTROCUSTO',   ftString, False, False, False, True, '');
end;



function TDbPadraorateiodoc.Insert: Boolean;
begin
   fIdpadrrateiodoc.AsFloat := GetSequence('PADRAORATEIODOC');
   Result := Inherited Insert;
end;



procedure TDbPadraorateiodoc.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;



procedure TDbPadraorateiodoc.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;



procedure TDbPadraorateiodoc.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;



procedure TDbPadraorateiodoc.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;



procedure TDbPadraorateiodoc.SetIdgruporateio(const Value: TCmDbField);
begin
  FIdgruporateio := Value;
end;



procedure TDbPadraorateiodoc.SetIdpadrrateiodoc(const Value: TCmDbField);
begin
  FIdpadrrateiodoc := Value;
end;



procedure TDbPadraorateiodoc.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;



procedure TDbPadraorateiodoc.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;



procedure TDbPadraorateiodoc.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;



procedure TDbPadraorateiodoc.SetPercentrateio(const Value: TCmDbField);
begin
  FPercentrateio := Value;
end;



procedure TDbPadraorateiodoc.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;



procedure TDbPadraorateiodoc.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;



end.
