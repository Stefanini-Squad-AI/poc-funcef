{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 24/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbBanco;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBanco = class(TCmDbObject)
  private
    FIdpessoa: TCmDbField;
    FMascaracc: TCmDbField;
    FFlgvalidacc: TCmDbField;
    FMascaraagencia: TCmDbField;
    FNumbanco: TCmDbField;
    procedure SetFlgvalidacc(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetMascaraagencia(const Value: TCmDbField);
    procedure SetMascaracc(const Value: TCmDbField);
    procedure SetNumbanco(const Value: TCmDbField);
  public
    Property Numbanco: TCmDbField  read FNumbanco write SetNumbanco;
    Property Mascaracc: TCmDbField  read FMascaracc write SetMascaracc;
    Property Mascaraagencia: TCmDbField  read FMascaraagencia write SetMascaraagencia;
    Property Idpessoa: TCmDbField  read FIdpessoa write SetIdpessoa;
    Property Flgvalidacc: TCmDbField  read FFlgvalidacc write SetFlgvalidacc;
    Constructor Create; Override;
    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
    function GetSqlSelect: String; Override;
  End;

implementation

{ TDbBanco }

constructor TDbBanco.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BANCO';

  fNumbanco := CreateCmDbField('NUMBANCO',ftString,True,False,False,True);
  fMascaracc := CreateCmDbField('MASCARACC',ftString,True,False,False,True);
  fMascaraagencia := CreateCmDbField('MASCARAAGENCIA',ftString,True,False,False,True);
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,True,False,True);
  fFlgvalidacc := CreateCmDbField('FLGVALIDACC',ftString,True,False,False,True);
end;

function TDbBanco.Insert: Boolean;
begin
  fIdpessoa.AsFloat := GetSequence('BANCO');
  Result := Inherited Insert;
end;

function TDbBanco.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

function TDbBanco.GetSqlSelect: String;
begin
  if fIdpessoa.asinteger < 0 then
    Result:='SELECT B.IDPESSOA, P.NOME AS BANCO, B.NUMBANCO '+
            'FROM PESSOA P, BANCO B '+
            'WHERE B.IDPESSOA = P.IDPESSOA '+
            'ORDER BY B.NUMBANCO '
  else
    inherited GetSqlSelect;
end;

procedure TDbBanco.SetFlgvalidacc(const Value: TCmDbField);
begin
  FFlgvalidacc := Value;
end;

procedure TDbBanco.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbBanco.SetMascaraagencia(const Value: TCmDbField);
begin
  FMascaraagencia := Value;
end;

procedure TDbBanco.SetMascaracc(const Value: TCmDbField);
begin
  FMascaracc := Value;
end;

procedure TDbBanco.SetNumbanco(const Value: TCmDbField);
begin
  FNumbanco := Value;
end;

end.



