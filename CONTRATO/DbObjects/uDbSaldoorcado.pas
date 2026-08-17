{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alexandre Goncalves             }
{ Atualizado Em: 12/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbSaldoorcado;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbSaldoorcado = class(TCmDbObject)

  private
     FVlrreservado: TCmDbField;
     FVlrrealizado: TCmDbField;
     FVlrrealacum: TCmDbField;
     FVlrorcado: TCmDbField;
     FVlrorcacum: TCmDbField;
     FVlrcomprometido: TCmDbField;
     FPeriodo: TCmDbField;
     FPercutilrateio: TCmDbField;
     FIdplanoorcamen: TCmDbField;
     FIdpessoa: TCmDbField;
     FIdcriterioratorc: TCmDbField;
     FIdcontaorcamen: TCmDbField;
     FFlgsimulaativo: TCmDbField;
     FExercicio: TCmDbField;
     FDatareferencia: TCmDbField;

     Procedure SetVlrreservado(const Value: TCmDbField);
     Procedure SetVlrrealizado(const Value: TCmDbField);
     Procedure SetVlrrealacum(const Value: TCmDbField);
     Procedure SetVlrorcado(const Value: TCmDbField);
     Procedure SetVlrorcacum(const Value: TCmDbField);
     Procedure SetVlrcomprometido(const Value: TCmDbField);
     Procedure SetPeriodo(const Value: TCmDbField);
     Procedure SetPercutilrateio(const Value: TCmDbField);
     Procedure SetIdplanoorcamen(const Value: TCmDbField);
     Procedure SetIdpessoa(const Value: TCmDbField);
     Procedure SetIdcriterioratorc(const Value: TCmDbField);
     Procedure SetIdcontaorcamen(const Value: TCmDbField);
     Procedure SetFlgsimulaativo(const Value: TCmDbField);
     Procedure SetExercicio(const Value: TCmDbField);
     Procedure SetDatareferencia(const Value: TCmDbField);

  public

     Property Vlrreservado    : TCmDbField Read FVlrreservado     Write SetVlrreservado;
     Property Vlrrealizado    : TCmDbField Read FVlrrealizado     Write SetVlrrealizado;
     Property Vlrrealacum     : TCmDbField Read FVlrrealacum      Write SetVlrrealacum;
     Property Vlrorcado       : TCmDbField Read FVlrorcado        Write SetVlrorcado;
     Property Vlrorcacum      : TCmDbField Read FVlrorcacum       Write SetVlrorcacum;
     Property Vlrcomprometido : TCmDbField Read FVlrcomprometido  Write SetVlrcomprometido;
     Property Periodo         : TCmDbField Read FPeriodo          Write SetPeriodo;
     Property Percutilrateio  : TCmDbField Read FPercutilrateio   Write SetPercutilrateio;
     Property Idplanoorcamen  : TCmDbField Read FIdplanoorcamen   Write SetIdplanoorcamen;
     Property Idpessoa        : TCmDbField Read FIdpessoa         Write SetIdpessoa;
     Property Idcriterioratorc: TCmDbField Read FIdcriterioratorc Write SetIdcriterioratorc;
     Property Idcontaorcamen  : TCmDbField Read FIdcontaorcamen   Write SetIdcontaorcamen;
     Property Flgsimulaativo  : TCmDbField Read FFlgsimulaativo   Write SetFlgsimulaativo;
     Property Exercicio       : TCmDbField Read FExercicio        Write SetExercicio;
     Property Datareferencia  : TCmDbField Read FDatareferencia   Write SetDatareferencia;

     Constructor Create(AOwner: TcmCustomcdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbSaldoorcado }
//************************************************
Constructor TDbSaldoOrcado.Create(AOwner: TcmCustomcdbObject);
Begin
  Inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SALDOORCADO';

  fVlrreservado     := CreateCmDbField( 'VLRRESERVADO'    , ftfloat,    False, False, False, True, '' );
  fVlrrealizado     := CreateCmDbField( 'VLRREALIZADO'    , ftfloat,    False, False, False, True, '' );
  fVlrrealacum      := CreateCmDbField( 'VLRREALACUM'     , ftfloat,    False, False, False, True, '' );
  fVlrorcado        := CreateCmDbField( 'VLRORCADO'       , ftfloat,    False, False, False, True, '' );
  fVlrorcacum       := CreateCmDbField( 'VLRORCACUM'      , ftfloat,    False, False, False, True, '' );
  fVlrcomprometido  := CreateCmDbField( 'VLRCOMPROMETIDO' , ftfloat,    False, False, False, True, '' );
  fPeriodo          := CreateCmDbField( 'PERIODO'         , ftfloat,    False, False, False, True, '' );
  fPercutilrateio   := CreateCmDbField( 'PERCUTILRATEIO'  , ftfloat,    False, False, False, True, '' );
  fIdplanoorcamen   := CreateCmDbField( 'IDPLANOORCAMEN'  , ftfloat,    True,  True , False, True, '' );
  fIdpessoa         := CreateCmDbField( 'IDPESSOA'        , ftfloat,    True,  True , False, True, '' );
  fIdcriterioratorc := CreateCmDbField( 'IDCRITERIORATORC', ftfloat,    False, False, False, True, '' );
  fIdcontaorcamen   := CreateCmDbField( 'IDCONTAORCAMEN'  , ftString,   True,  True , False, True, '' );
  fFlgsimulaativo   := CreateCmDbField( 'FLGSIMULAATIVO'  , ftString,   False, False, False, True, '' );
  fExercicio        := CreateCmDbField( 'EXERCICIO'       , ftfloat     False, False, False, True, '' );
  fDatareferencia   := CreateCmDbField( 'DATAREFERENCIA'  , ftDateTime, True,  True , False, True, '' );
End;

function TDbSaldoorcado.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbSaldoorcado.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

Procedure TDbSaldoorcado.SetVlrreservado(const Value: TCmDbField);
Begin

  FVlrreservado := Value;
End;

Procedure TDbSaldoorcado.SetVlrrealizado(const Value: TCmDbField);
Begin

  FVlrrealizado := Value;
End;

Procedure TDbSaldoorcado.SetVlrrealacum(const Value: TCmDbField);
Begin

  FVlrrealacum := Value;
End;

Procedure TDbSaldoorcado.SetVlrorcado(const Value: TCmDbField);
Begin

  FVlrorcado := Value;
End;

Procedure TDbSaldoorcado.SetVlrorcacum(const Value: TCmDbField);
Begin

  FVlrorcacum := Value;
End;

Procedure TDbSaldoorcado.SetVlrcomprometido(const Value: TCmDbField);
Begin

  FVlrcomprometido := Value;
End;

Procedure TDbSaldoorcado.SetPeriodo(const Value: TCmDbField);
Begin

  FPeriodo := Value;
End;

Procedure TDbSaldoorcado.SetPercutilrateio(const Value: TCmDbField);
Begin

  FPercutilrateio := Value;
End;

Procedure TDbSaldoorcado.SetIdplanoorcamen(const Value: TCmDbField);
Begin

  FIdplanoorcamen := Value;
End;

Procedure TDbSaldoorcado.SetIdpessoa(const Value: TCmDbField);
Begin

  FIdpessoa := Value;
End;

Procedure TDbSaldoorcado.SetIdcriterioratorc(const Value: TCmDbField);
Begin

  FIdcriterioratorc := Value;
End;

Procedure TDbSaldoorcado.SetIdcontaorcamen(const Value: TCmDbField);
Begin

  FIdcontaorcamen := Value;
End;

Procedure TDbSaldoorcado.SetFlgsimulaativo(const Value: TCmDbField);
Begin

  FFlgsimulaativo := Value;
End;

Procedure TDbSaldoorcado.SetExercicio(const Value: TCmDbField);
Begin

  FExercicio := Value;
End;

Procedure TDbSaldoorcado.SetDatareferencia(const Value: TCmDbField);
Begin

  FDatareferencia := Value;
End;

end.



