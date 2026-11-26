{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 27/06/2002                             }
{                                                       }
{*******************************************************}
Unit uDbLogCenario;

Interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLogCenario = class(TCmDbObject)

  Private
    FLogcsalvo      : TCmDbField;
    FLogcperiodoini : TCmDbField;
    FLogcperiodofim : TCmDbField;
    FLogcexercicio  : TCmDbField;
    FLogcefetivado  : TCmDbField;
    FLogcdata       : TCmDbField;
    FLogcanterior   : TCmDbField;
    FIdusuario      : TCmDbField;
    FIdpessoa       : TCmDbField;
    FIdlogcenario   : TCmDbField;

    Procedure SetIdlogcenario  ( Const Value : TCmDbField );
    Procedure SetLogcsalvo     ( Const Value : TCmDbField );
    Procedure SetLogcperiodoini( Const Value : TCmDbField );
    Procedure SetLogcperiodofim( Const Value : TCmDbField );
    procedure SetLogcexercicio ( const Value : TCmDbField );
    Procedure SetLogcefetivado ( Const Value : TCmDbField );
    procedure SetLogcdata      ( const Value : TCmDbField );
    Procedure SetLogcanterior  ( Const Value : TCmDbField );
    Procedure SetIdpessoa      ( Const Value : TCmDbField );
    procedure SetIdusuario     ( const Value : TCmDbField );

  Public

     Property Logcsalvo      : TCmDbField Read FLogcsalvo      Write SetLogcsalvo;
     Property Logcperiodoini : TCmDbField Read FLogcperiodoini Write SetLogcperiodoini;
     Property Logcperiodofim : TCmDbField Read FLogcperiodofim Write SetLogcperiodofim;
     Property Logcexercicio  : TCmDbField Read FLogcexercicio  Write SetLogcexercicio;
     Property Logcefetivado  : TCmDbField Read FLogcefetivado  Write SetLogcefetivado;
     Property Logcdata       : TCmDbField Read FLogcdata       Write SetLogcdata;
     Property Logcanterior   : TCmDbField Read FLogcanterior   Write SetLogcanterior;
     Property Idusuario      : TCmDbField Read FIdusuario      Write SetIdusuario;
     Property Idpessoa       : TCmDbField Read FIdpessoa       Write SetIdpessoa;
     Property Idlogcenario   : TCmDbField Read FIdlogcenario   Write SetIdlogcenario;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

Implementation

{ TDbLogCenario }

Constructor TDbLogCenario.Create(Aowner: TCmCustomCdbObject);
Begin
  Inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LOGCENARIO';

  fIdlogCenario   := CreateCmDbField( 'IDLOGCENARIO',   ftfloat,    True,  True,  False,  True, '' );
  fLogcSalvo      := CreateCmDbField( 'LOGCSALVO',      ftfloat,    False, False, False,  True, '' );
  fLogcPeriodoIni := CreateCmDbField( 'LOGCPERIODOINI', ftfloat,    False, False, False,  True, '' );
  fLogcPeriodoFim := CreateCmDbField( 'LOGCPERIODOFIM', ftfloat,    False, False, False,  True, '' );
  fLogcExercicio  := CreateCmDbField( 'LOGCEXERCICIO',  ftfloat,    False, False, False,  True, '' );
  fLogcEfetivado  := CreateCmDbField( 'LOGCEFETIVADO',  ftfloat,    False, False, False,  True, '' );
  fLogcAnterior   := CreateCmDbField( 'LOGCANTERIOR',   ftString,   False, False, False,  True, '' );
  fIdUsuario      := CreateCmDbField( 'IDUSUARIO',      ftfloat,    False, False, False,  True, '' );
  fIdPessoa       := CreateCmDbField( 'IDPESSOA',       ftfloat,    False, False, False,  True, '' );
End;
//************************************************
Function TDbLogCenario.Insert: Boolean;
Begin

   fIdlogcenario.AsFloat := GetSequence('LOGCENARIO');
   Result := Inherited Insert;
End;
//************************************************
Procedure TDbLogCenario.SetIdlogcenario( const Value: TCmDbField );
Begin

  FIdlogcenario := Value;
End;
//************************************************
Procedure TDbLogCenario.SetLogcsalvo( const Value: TCmDbField );
Begin

  FLogcsalvo := Value;
End;
//************************************************
Procedure TDbLogCenario.SetLogcperiodoini( const Value: TCmDbField );
Begin

  FLogcperiodoini := Value;
End;
//************************************************
Procedure TDbLogCenario.SetLogcperiodofim( const Value: TCmDbField );
Begin

  FLogcperiodofim := Value;
End;
//************************************************
Procedure TDbLogCenario.SetLogcexercicio( const Value: TCmDbField );
Begin

  FLogcexercicio := Value;
End;
//************************************************
Procedure TDbLogCenario.SetLogcefetivado( const Value: TCmDbField );
Begin

  FLogcefetivado := Value;
End;
//************************************************
Procedure TDbLogCenario.SetLogcdata( const Value: TCmDbField );
Begin

  FLogcdata := Value;
End;
//************************************************
Procedure TDbLogCenario.SetLogcanterior( const Value: TCmDbField );
Begin

  FLogcAnterior := Value;
End;
//************************************************
Procedure TDbLogCenario.SetIdusuario( const Value: TCmDbField );
Begin

  FIdusuario := Value;
End;
//************************************************
Procedure TDbLogCenario.SetIdpessoa( const Value: TCmDbField );
Begin

  FIdpessoa := Value;
End;
//************************************************
End.
