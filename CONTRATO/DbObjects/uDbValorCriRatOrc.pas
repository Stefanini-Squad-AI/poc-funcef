{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 18/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbValorCriRatOrc;

interface
Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbValorcriratorc = class(TCmDbObject)

  private

    FVlrcriratorc     : TCmDbField;
    FPeriodo          : TCmDbField;
    FIdvalorcriratorc : TCmDbField;
    FIdpessoa         : TCmDbField;
    FIdempresa        : TCmDbField;
    FIdcriterioratorc : TCmDbField;
    FExercicio        : TCmDbField;
    FCodcentrocusto   : TCmDbField;

    Procedure SetVlrcriratorc( Const Value : TCmDbField );
    Procedure SetPeriodo( Const Value : TCmDbField );
    Procedure SetIdvalorcriratorc( Const Value : TCmDbField );
    Procedure SetIdpessoa( Const Value : TCmDbField );
    Procedure SetIdempresa( Const Value : TCmDbField );
    Procedure SetIdcriterioratorc( Const Value : TCmDbField );
    Procedure SetExercicio( Const Value : TCmDbField );
    Procedure SetCodcentrocusto( Const Value : TCmDbField );

  public

    Property Vlrcriratorc     : TCmDbField Read FVlrcriratorc     Write SetVlrcriratorc;
    Property Periodo          : TCmDbField Read FPeriodo          Write SetPeriodo;
    Property Idvalorcriratorc : TCmDbField Read FIdvalorcriratorc Write SetIdvalorcriratorc;
    Property Idpessoa         : TCmDbField Read FIdpessoa         Write SetIdpessoa;
    Property Idempresa        : TCmDbField Read FIdempresa        Write SetIdempresa;
    Property Idcriterioratorc : TCmDbField Read FIdcriterioratorc Write SetIdcriterioratorc;
    Property Exercicio        : TCmDbField Read FExercicio        Write SetExercicio;
    Property Codcentrocusto   : TCmDbField Read FCodcentrocusto   Write SetCodcentrocusto;

    Constructor Create( Aowner: TCmCustomCdbObject) ; Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbValorcriratorc }
//************************************************
constructor TDbValorcriratorc.Create( Aowner: TCmCustomCdbObject) ;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'VALORCRIRATORC';

   fVlrcriratorc     := CreateCmDbField( 'VLRCRIRATORC',     ftfloat,  False, False, False, True, ''  );
   fPeriodo          := CreateCmDbField( 'PERIODO',          ftfloat,  False, False, False, True, ''  );
   fIdvalorcriratorc := CreateCmDbField( 'IDVALORCRIRATORC', ftfloat,  True,  True,  False, True, ''  );
   fIdpessoa         := CreateCmDbField( 'IDPESSOA',         ftfloat,  False, False, False, True, ''  );
   fIdempresa        := CreateCmDbField( 'IDEMPRESA',        ftfloat,  False, False, False, True, ''  );
   fIdcriterioratorc := CreateCmDbField( 'IDCRITERIORATORC', ftfloat,  False, False, False, True, ''  );
   fExercicio        := CreateCmDbField( 'EXERCICIO',        ftfloat,  False, False, False, True, ''  );
   fCodcentrocusto   := CreateCmDbField( 'CODCENTROCUSTO',   ftString, False, False, False, True, ''  );
end;
//************************************************
function TDbValorcriratorc.Insert: Boolean;
begin

   fIdvalorcriratorc.AsFloat := GetSequence( 'VALORCRIRATORC' );
   Result := Inherited Insert;

end;
//************************************************
function TDbValorcriratorc.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;
//************************************************
procedure TDbValorcriratorc.SetCodcentrocusto(const Value: TCmDbField);
begin

  FCodcentrocusto := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetExercicio(const Value: TCmDbField);
begin

  FExercicio := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetIdcriterioratorc(const Value: TCmDbField);
begin

  FIdcriterioratorc := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetIdempresa(const Value: TCmDbField);
begin

  FIdempresa := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetIdpessoa(const Value: TCmDbField);
begin

  FIdpessoa := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetIdvalorcriratorc(const Value: TCmDbField);
begin

  FIdvalorcriratorc := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetPeriodo(const Value: TCmDbField);
begin

  FPeriodo := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetVlrcriratorc(const Value: TCmDbField);
begin

  FVlrcriratorc := Value;
end;
//************************************************
end.
