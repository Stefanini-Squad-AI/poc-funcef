{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 08/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbRelatOrc;

interface
Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRelatorc = class(TCmDbObject)

  private

    FSequencia        : TCmDbField;
    FNomerelatorc     : TCmDbField;
    FNomecomprelatorc : TCmDbField;
    FIdrelatorc       : TCmDbField;
    FFlgimprimeneg    : TCmDbField;

    Procedure SetSequencia(const Value: TCmDbField);
    Procedure SetNomerelatorc(const Value: TCmDbField);
    Procedure SetNomecomprelatorc(const Value: TCmDbField);
    Procedure SetIdrelatorc(const Value: TCmDbField);
    Procedure SetFlgimprimeneg(const Value: TCmDbField);

  public

     Property Sequencia        : TCmDbField Read FSequencia         Write SetSequencia;
     Property Nomerelatorc     : TCmDbField Read FNomerelatorc      Write SetNomerelatorc;
     Property Nomecomprelatorc : TCmDbField Read FNomecomprelatorc  Write SetNomecomprelatorc;
     Property Idrelatorc       : TCmDbField Read FIdrelatorc        Write SetIdrelatorc;
     Property Flgimprimeneg    : TCmDbField Read FFlgimprimeneg     Write SetFlgimprimeneg;

     Constructor Create( Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbRelatorc }
//************************************************
constructor TDbRelatorc.Create( Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RELATORC';

   fSequencia        := CreateCmDbField( 'SEQUENCIA',        ftfloat,  False, False, False, True, '' );
   fNomerelatorc     := CreateCmDbField( 'NOMERELATORC',     ftString, False, False, False, True, '' );
   fNomecomprelatorc := CreateCmDbField( 'NOMECOMPRELATORC', ftString, False, False, False, True, '' );
   fIdrelatorc       := CreateCmDbField( 'IDRELATORC',       ftfloat,  True,  True,  False, True, '' );
   fFlgimprimeneg    := CreateCmDbField( 'FLGIMPRIMENEG',    ftString, False, False, False, True, '' );
end;
//************************************************
function TDbRelatorc.Insert: Boolean;
begin

   fIdrelatorc.AsFloat := GetSequence('RELATORC');
   Result := Inherited Insert;

end;
//************************************************
function TDbRelatorc.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;
//************************************************
procedure TDbRelatorc.SetFlgimprimeneg(const Value: TCmDbField);
begin

  Flgimprimeneg := Value;
end;
//************************************************
procedure TDbRelatorc.SetIdrelatorc(const Value: TCmDbField);
begin

  FIdrelatorc := Value;
end;
//************************************************
procedure TDbRelatorc.SetNomecomprelatorc(const Value: TCmDbField);
begin

  FNomecomprelatorc := Value;
end;
//************************************************
procedure TDbRelatorc.SetNomerelatorc(const Value: TCmDbField);
begin

  FNomerelatorc := Value;
end;
//************************************************
procedure TDbRelatorc.SetSequencia( const Value: TCmDbField );
begin

  FSequencia := Value;
end;
//************************************************
end.

