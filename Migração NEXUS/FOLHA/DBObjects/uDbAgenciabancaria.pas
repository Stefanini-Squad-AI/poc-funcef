{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 24/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbAgenciabancaria;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbAgenciabancaria = class(TCmDbObject)
  private
    fNumagencia: TCmDbField;
    fIdpessoa: TCmDbField;
    fIdbanco: TCmDbField;
    fFlgtipo: TCmDbField;
    fFlgativo: TCmDbField;
    procedure SetFlgativo(const Value: TCmDbField);
    procedure SetFlgtipo(const Value: TCmDbField);
    procedure SetIdbanco(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNumagencia(const Value: TCmDbField);
  public
    Property Numagencia: TCmDbField  read FNumagencia write SetNumagencia;
    Property Idpessoa: TCmDbField  read FIdpessoa write SetIdpessoa;
    Property Idbanco: TCmDbField  read FIdbanco write SetIdbanco;
    Property Flgtipo: TCmDbField  read FFlgtipo write SetFlgtipo;
    Property Flgativo: TCmDbField  read FFlgativo write SetFlgativo;
    Constructor Create; Override;
    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
    function GetSqlSelect: String; Override;
  End;

implementation

{ TDbAgenciabancaria }

constructor TDbAgenciabancaria.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'AGENCIABANCARIA';

  fNumagencia := CreateCmDbField('NUMAGENCIA',ftString,True,False,False,True);
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,True,False,True);
  fIdbanco := CreateCmDbField('IDBANCO',ftfloat,True,False,False,True);
  fFlgtipo := CreateCmDbField('FLGTIPO',ftString,True,False,False,True);
  fFlgativo := CreateCmDbField('FLGATIVO',ftString,True,False,False,True);
end;

function TDbAgenciabancaria.Insert: Boolean;
begin
  fIdpessoa.AsFloat := GetSequence('AGENCIABANCARIA');
  Result := Inherited Insert;
end;

function TDbAgenciabancaria.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

function TDbAgenciabancaria.GetSqlSelect: String;
begin
  if fIdpessoa.asinteger < 0 then
    Result:='SELECT AG.IDPESSOA, P.NOME AS AGENCIA, AG.NUMAGENCIA, AG.IDBANCO '+
            'FROM PESSOA P, AGENCIABANCARIA AG '+
            'WHERE AG.IDPESSOA = P.IDPESSOA '+
            'AND AG.IDBANCO = '+Idbanco.asstring+' '+
            'ORDER BY AG.NUMAGENCIA '
  else
    inherited GetSqlSelect;
end;

procedure TDbAgenciabancaria.SetFlgativo(const Value: TCmDbField);
begin
  FFlgativo := Value;
end;

procedure TDbAgenciabancaria.SetFlgtipo(const Value: TCmDbField);
begin
  FFlgtipo := Value;
end;

procedure TDbAgenciabancaria.SetIdbanco(const Value: TCmDbField);
begin
  FIdbanco := Value;
end;

procedure TDbAgenciabancaria.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbAgenciabancaria.SetNumagencia(const Value: TCmDbField);
begin
  FNumagencia := Value;
end;

end.



