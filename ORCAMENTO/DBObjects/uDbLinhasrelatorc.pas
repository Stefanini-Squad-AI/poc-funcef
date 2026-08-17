{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 09/04/2002                             }
{                                                       }
{*******************************************************}

Unit uDbLinhasrelatorc;

Interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLinhasrelatorc = Class(TCmDbObject)

  Private

    FNumdecimais      : TCmDbField;
    FIdrelatorc       : TCmDbField;
    FIdplanoorcamen   : TCmDbField;
    FIdlinhasrelatorc : TCmDbField;
    FIdcontapara100   : TCmDbField;
    FIdcontaorcamen   : TCmDbField;
    FFlgtipolinha     : TCmDbField;
    FFlgindentacao    : TCmDbField;
    FFlgacumulado     : TCmDbField;

    Procedure SetNumdecimais( const Value: TCmDbField );
    Procedure SetIdrelatorc( const Value: TCmDbField );
    Procedure SetIdplanoorcamen( const Value: TCmDbField );
    Procedure SetIdlinhasrelatorc( const Value: TCmDbField );
    Procedure SetIdcontapara100( const Value: TCmDbField );
    Procedure SetIdcontaorcamen( const Value: TCmDbField );
    Procedure SetFlgtipolinha( const Value: TCmDbField );
    Procedure SetFlgindentacao( const Value: TCmDbField );
    Procedure SetFlgacumulado( const Value: TCmDbField );

  Public

     Property Numdecimais      : TCmDbField Read FNumdecimais      Write SetNumdecimais;
     Property Idrelatorc       : TCmDbField Read FIdrelatorc       Write SetIdrelatorc;
     Property Idplanoorcamen   : TCmDbField Read FIdplanoorcamen   Write SetIdplanoorcamen;
     Property Idlinhasrelatorc : TCmDbField Read FIdlinhasrelatorc Write SetIdlinhasrelatorc;
     Property Idcontapara100   : TCmDbField Read FIdcontapara100   Write SetIdcontapara100;
     Property Idcontaorcamen   : TCmDbField Read FIdcontaorcamen   Write SetIdcontaorcamen;
     Property Flgtipolinha     : TCmDbField Read FFlgtipolinha     Write SetFlgtipolinha;
     Property Flgindentacao    : TCmDbField Read FFlgindentacao    Write SetFlgindentacao;
     Property Flgacumulado     : TCmDbField Read FFlgacumulado     Write SetFlgacumulado;

     Constructor Create( Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

Implementation

{ TDbLinhasrelatorc }

Constructor TDbLinhasrelatorc.Create( Aowner: TCmCustomCdbObject);
Begin
  Inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LINHASRELATORC';

   fNumdecimais      := CreateCmDbField( 'NUMDECIMAIS',      ftfloat,  False, False, False, True, '' );
   fIdrelatorc       := CreateCmDbField( 'IDRELATORC' ,      ftfloat,  True,  True,  False, True, '' );
   fIdplanoorcamen   := CreateCmDbField( 'IDPLANOORCAMEN',   ftfloat,  False, False, False, True, '' );
   fIdlinhasrelatorc := CreateCmDbField( 'IDLINHASRELATORC', ftfloat,  True,  True,  False, True, '' );
   fIdcontapara100   := CreateCmDbField( 'IDCONTAPARA100',   ftString, False, False, False, True, '' );
   fIdcontaorcamen   := CreateCmDbField( 'IDCONTAORCAMEN',   ftString, False, False, False, True, '' );
   fFlgtipolinha     := CreateCmDbField( 'FLGTIPOLINHA',     ftString, False, False, False, True, '' );
   fFlgindentacao    := CreateCmDbField( 'FLGINDENTACAO',    ftString, False, False, False, True, '' );
   fFlgacumulado     := CreateCmDbField( 'FLGACUMULADO',     ftString, False, False, False, True, '' );
End;
//************************************************
Function TDbLinhasrelatorc.Insert: Boolean;
Begin

   Result := Inherited Insert;
End;
//************************************************
Function TDbLinhasrelatorc.LoadFromDB: Boolean;
Begin

  Result := Inherited LoadFromDB;

End;
//************************************************
Procedure TDbLinhasrelatorc.SetFlgacumulado(const Value: TCmDbField);
Begin

  Flgacumulado := Value;
End;
//************************************************
Procedure TDbLinhasrelatorc.SetFlgindentacao(const Value: TCmDbField);
Begin

  Flgindentacao := Value;
End;
//************************************************
Procedure TDbLinhasrelatorc.SetFlgtipolinha(const Value: TCmDbField);
Begin

  Flgtipolinha := Value;
End;
//************************************************
Procedure TDbLinhasrelatorc.SetIdcontaorcamen(const Value: TCmDbField);
Begin

  FIdcontaorcamen := Value;
End;
//************************************************
Procedure TDbLinhasrelatorc.SetIdcontapara100(const Value: TCmDbField);
Begin

  FIdcontapara100 := Value;
End;
//************************************************
Procedure TDbLinhasrelatorc.SetIdlinhasrelatorc(const Value: TCmDbField);
Begin

  FIdlinhasrelatorc := Value;
End;
//************************************************
Procedure TDbLinhasrelatorc.SetIdplanoorcamen(const Value: TCmDbField);
Begin

  FIdplanoorcamen := Value;
End;
//************************************************
Procedure TDbLinhasrelatorc.SetIdrelatorc(const Value: TCmDbField);
Begin

  FIdrelatorc := Value;
End;
//************************************************
Procedure TDbLinhasrelatorc.SetNumdecimais(const Value: TCmDbField);
Begin

  FNumdecimais := Value;
End;
//************************************************
End.
