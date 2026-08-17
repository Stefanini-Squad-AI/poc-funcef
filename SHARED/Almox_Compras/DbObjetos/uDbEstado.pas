{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 22/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbEstado;

interface

Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbEstado = class(TCmDbObject)

  private
    FIdestado: TCmDbField;
    FCodestado: TCmDbField;
    FIdpais: TCmDbField;
    FNomeestado: TCmDbField;
    procedure SetCodestado(const Value: TCmDbField);
    procedure SetIdestado(const Value: TCmDbField);
    procedure SetIdpais(const Value: TCmDbField);
    procedure SetNomeestado(const Value: TCmDbField);

  public
    Property Nomeestado: TCmDbField read FNomeestado write SetNomeestado;
    Property Idpais: TCmDbField read FIdpais write SetIdpais;
    Property Idestado: TCmDbField read FIdestado write SetIdestado;
    Property Codestado: TCmDbField read FCodestado write SetCodestado;

    Constructor Create; Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbEstado }

constructor TDbEstado.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ESTADO';

  fNomeestado := CreateCmDbField('NOMEESTADO',ftString,False,False,False,True,'Nome');
  fIdpais     := CreateCmDbField('IDPAIS',ftfloat,True,False,False,True,'País');
  fIdestado   := CreateCmDbField('IDESTADO',ftfloat,True,True,False,True,'Código');
  fCodestado  := CreateCmDbField('CODESTADO',ftString,True,False,False,True,'Sigla');
end;

function TDbEstado.Insert: Boolean;
begin
  fIdEstado.AsFloat := GetSequence('ESTADO');
  Result := Inherited Insert;
end;

function TDbEstado.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbEstado.SetCodestado(const Value: TCmDbField);
begin
  FCodestado := Value;
end;

procedure TDbEstado.SetIdestado(const Value: TCmDbField);
begin
  FIdestado := Value;
end;

procedure TDbEstado.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDbEstado.SetNomeestado(const Value: TCmDbField);
begin
  FNomeestado := Value;
end;

end.



