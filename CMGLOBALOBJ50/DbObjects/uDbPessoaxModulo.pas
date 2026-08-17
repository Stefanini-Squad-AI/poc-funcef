{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 08/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbPessoaxModulo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPessoaxModulo = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FIdModuloRespon: TCmDbField;
    procedure SetIdModuloRespon(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);

  public
    Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
    Property IdModuloRespon: TCmDbField read FIdmodulorespon write SetIdmodulorespon;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

implementation

{ TDbPessoaxModulo }

constructor TDbPessoaxModulo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PESSOA';

  fIdPessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Còdigo');
  fIdModuloRespon := CreateCmDbField('IDMODULORESPON',ftfloat,False,False,False,True,'Módulo');
end;

function TDbPessoaxModulo.Insert: Boolean;
begin
  fIdPessoa.AsFloat := GetSequence('PESSOA');
  Result := Inherited Insert;
end;

function TDbPessoaxModulo.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbPessoaxModulo.SetIdmodulorespon(const Value: TCmDbField);
begin
  FIdModuloRespon := Value;
end;

procedure TDbPessoaxModulo.SetIdpessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

end.

