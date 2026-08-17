{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 15/04/2002                             }
{                                                       }
{*******************************************************}
unit uDbPessoaXCresp;

interface
Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPessoaXCresp = class(TCmDbObject)

  private
    FIdpessoaacesso  : TCmDbField;
    FIdpessoa        : TCmDbField;
    FCodcentrorespon : TCmDbField;

    Procedure SetIdpessoaacesso( const Value : TCmDbField );
    Procedure SetIdpessoa( const Value : TCmDbField );
    Procedure SetCodcentrorespon( const Value : TCmDbField );

  public

     Property Idpessoaacesso  : TCmDbField Read FIdpessoaacesso  Write SetIdpessoaacesso;
     Property Idpessoa        : TCmDbField Read FIdpessoa        Write SetIdpessoa;
     Property Codcentrorespon : TCmDbField Read FCodcentrorespon Write SetCodcentrorespon;

     Constructor Create( Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPessoaXCresp }
//************************************************
constructor TDbPessoaXCresp.Create( Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PESSOAXCRESP';

  fIdpessoaacesso  := CreateCmDbField( 'IDPESSOAACESSO',  ftfloat, True, True, False, True, '' );
  fIdpessoa        := CreateCmDbField( 'IDPESSOA',        ftfloat, True, True, False, True, '' );
  fCodcentrorespon := CreateCmDbField( 'CODCENTRORESPON', ftString,True, True, False, True, '' );
end;
//************************************************
function TDbPessoaXCresp.Insert: Boolean;
begin

   Result := Inherited Insert;
end;
//************************************************
function TDbPessoaXCresp.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;
end;
//************************************************
procedure TDbPessoaXCresp.SetCodcentrorespon(const Value: TCmDbField);
begin

  FCodcentrorespon := Value;
end;
//************************************************
procedure TDbPessoaXCresp.SetIdpessoa(const Value: TCmDbField);
begin

  FIdpessoa := Value;
end;
//************************************************
procedure TDbPessoaXCresp.SetIdpessoaacesso(const Value: TCmDbField);
begin

  FIdpessoaacesso := Value;
end;
//************************************************
end.

