{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 05/04/2002                             }
{                                                       }
{*******************************************************}

Unit uDbPeriodoOrcamen;

Interface
Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPeriodoorcamen = Class(TCmDbObject)

  Private
    FPeriodo        : TCmDbField;
    FNomeperiodo    : TCmDbField;
    FIdpessoa       : TCmDbField;
    FFlgbloqueado   : TCmDbField;
    FExercicio      : TCmDbField;
    FDatainiperiodo : TCmDbField;
    FDatafimperiodo : TCmDbField;

    Procedure SetPeriodo( const Value: TCmDbField );
    Procedure SetNomeperiodo( const Value: TCmDbField );
    Procedure SetIdpessoa( const Value: TCmDbField );
    Procedure SetFlgbloqueado( const Value: TCmDbField );
    Procedure SetExercicio( const Value: TCmDbField );
    Procedure SetDatainiperiodo( const Value: TCmDbField );
    Procedure SetDatafimperiodo( const Value: TCmDbField );

  Public

    Property Periodo        : TCmDbField Read FPeriodo        Write SetPeriodo;
    Property Nomeperiodo    : TCmDbField Read FNomeperiodo    Write SetNomeperiodo;
    Property Idpessoa       : TCmDbField Read FIdpessoa       Write SetIdpessoa;
    Property Flgbloqueado   : TCmDbField Read FFlgbloqueado   Write SetFlgbloqueado;
    Property Exercicio      : TCmDbField Read FExercicio      Write SetExercicio;
    Property Datainiperiodo : TCmDbField Read FDatainiperiodo Write SetDatainiperiodo;
    Property Datafimperiodo : TCmDbField Read FDatafimperiodo Write SetDatafimperiodo;

    Constructor Create( Aowner: TCmCustomCdbObject); Override;

    Function Insert     : Boolean; Override;
    Function LoadFromDb : Boolean; Override;
  End;

Implementation

{ TDbPeriodoorcamen }
//************************************************
Constructor TDbPeriodoorcamen.Create( Aowner: TCmCustomCdbObject);
Begin
  Inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PERIODOORCAMEN';

  fPeriodo        := CreateCmDbField( 'PERIODO',        ftfloat,    True,  True,  False, True, '' );
  fNomeperiodo    := CreateCmDbField( 'NOMEPERIODO',    ftString,   False, False, False, True, '' );
  fIdpessoa       := CreateCmDbField( 'IDPESSOA',       ftfloat,    True,  True,  False, True, '' );
  fFlgbloqueado   := CreateCmDbField( 'FLGBLOQUEADO',   ftString,   False, False, False, True, '' );
  fExercicio      := CreateCmDbField( 'EXERCICIO',      ftfloat,    True,  True,  False, True, '' );
  fDatainiperiodo := CreateCmDbField( 'DATAINIPERIODO', ftDateTime, False, False, False, True, '' );
  fDatafimperiodo := CreateCmDbField( 'DATAFIMPERIODO', ftDateTime, False, False, False, True, '' );
End;
//************************************************
Function TDbPeriodoorcamen.Insert: Boolean;
Begin

  Result := Inherited Insert;
End;
//************************************************
Function TDbPeriodoorcamen.LoadFromDB: Boolean;
Begin

  Result := Inherited LoadFromDB;
End;
//************************************************
Procedure TDbPeriodoorcamen.SetDatafimperiodo( const Value: TCmDbField );
Begin

  FDatafimperiodo := Value;
End;
//************************************************
Procedure TDbPeriodoorcamen.SetDatainiperiodo( const Value: TCmDbField );
Begin

  FDatainiperiodo := Value;
End;
//************************************************
Procedure TDbPeriodoorcamen.SetExercicio( const Value: TCmDbField );
Begin

  FExercicio := Value;
End;
//************************************************
Procedure TDbPeriodoorcamen.SetFlgbloqueado( const Value: TCmDbField );
Begin

  FFlgbloqueado := Value;
End;
//************************************************
Procedure TDbPeriodoorcamen.SetIdpessoa( const Value: TCmDbField );
Begin

  FIdpessoa := Value;
End;
//************************************************
Procedure TDbPeriodoorcamen.SetNomeperiodo( const Value: TCmDbField );
Begin

  FNomeperiodo := Value;
End;
//************************************************
Procedure TDbPeriodoorcamen.SetPeriodo( const Value: TCmDbField );
Begin

  FPeriodo := Value;
End;
//************************************************
End.

