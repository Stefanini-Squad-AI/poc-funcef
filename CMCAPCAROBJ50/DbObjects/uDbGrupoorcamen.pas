{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 12/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrupoOrcamen;

interface
Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbGrupoOrcamen = class(TCmDbObject)

  private
    FNomeGrupoOrcamen : TCmDbField;
    FIdGrupoOrcamen   : TCmDbField;
    FFlgsinalgrupo    : TCmDbField;
    FFlgresultado     : TCmDbField;
    FFlganalsint      : TCmDbField;
    FCodgrupoorc      : TCmDbField;

    Procedure SetNomeGrupoOrcamen( const Value: TCmDbField );
    Procedure SetIdGrupoOrcamen( const Value: TCmDbField );
    Procedure SetFlgsinalgrupo( const Value: TCmDbField );
    Procedure SetFlgresultado( const Value: TCmDbField );
    Procedure SetFlganalsint( const Value: TCmDbField );
    Procedure SetCodgrupoorc( const Value: TCmDbField );

  public

     Property NomeGrupoOrcamen : TCmDbField Read FNomeGrupoOrcamen Write SetNomeGrupoOrcamen;
     Property IdGrupoOrcamen   : TCmDbField Read FIdGrupoOrcamen   Write SetIdGrupoOrcamen;
     Property Flgsinalgrupo    : TCmDbField Read FFlgsinalgrupo    Write SetFlgsinalgrupo;
     Property Flgresultado     : TCmDbField Read FFlgresultado     Write SetFlgresultado;
     Property Flganalsint      : TCmDbField Read FFlganalsint      Write SetFlganalsint;
     Property Codgrupoorc      : TCmDbField Read FCodgrupoorc      Write SetCodgrupoorc;

     Constructor Create( Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbGrupoOrcamen }
//************************************************
constructor TDbGrupoOrcamen.Create( Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GrupoOrcamen';

   fNomeGrupoOrcamen := CreateCmDbField( 'NOMEGRUPOORCAMEN', ftString, False, False, False, True, '' );
   fIdGrupoOrcamen   := CreateCmDbField( 'IDGRUPOORCAMEN',   ftfloat,  True,  True,  False, True, '' );
   fFlgsinalgrupo    := CreateCmDbField( 'FLGSINALGRUPO',    ftString, False, False, False, True, '' );
   fFlgresultado     := CreateCmDbField( 'FLGRESULTADO',     ftString, False, False, False, True, '' );
   fFlganalsint      := CreateCmDbField( 'FLGANALSINT',      ftString, False, False, False, True, '' );
   fCodgrupoorc      := CreateCmDbField( 'CODGRUPOORC',      ftString, False, False, False, True, '' );
end;
//************************************************
function TDbGrupoOrcamen.Insert: Boolean;
begin

   fIdGrupoOrcamen.AsFloat := GetSequence('GrupoOrcamen');
   Result := Inherited Insert;

end;
//************************************************
function TDbGrupoOrcamen.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;
//************************************************
procedure TDbGrupoOrcamen.SetCodgrupoorc(const Value: TCmDbField);
begin

  FCodgrupoorc := Value;
end;
//************************************************
procedure TDbGrupoOrcamen.SetFlganalsint(const Value: TCmDbField);
begin

  FFlganalsint := Value;
end;
//************************************************
procedure TDbGrupoOrcamen.SetFlgresultado(const Value: TCmDbField);
begin

  FFlgresultado := Value;
end;
//************************************************
procedure TDbGrupoOrcamen.SetFlgsinalgrupo(const Value: TCmDbField);
begin

  FFlgsinalgrupo := Value;
end;
//************************************************
procedure TDbGrupoOrcamen.SetIdGrupoOrcamen(const Value: TCmDbField);
begin

  FIdGrupoOrcamen := Value;
end;
//************************************************
procedure TDbGrupoOrcamen.SetNomeGrupoOrcamen(const Value: TCmDbField);
begin

  FNomeGrupoOrcamen := Value;
end;
//************************************************
end.

