{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 22/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbUnidNegocio;

interface

Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbUnidNegocio = class(TCmDbObject)
  private
    FNome: TCmDbField;
    FUnetipo: TCmDbField;
    FIdpessoa: TCmDbField;
    FUnecodigo: TCmDbField;
    FIdusuario: TCmDbField;
    FUnidnegoc: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetUnecodigo(const Value: TCmDbField);
    procedure SetUnetipo(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);

  public
    Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
    Property Unetipo: TCmDbField read FUnetipo write SetUnetipo;
    Property Unecodigo: TCmDbField read FUnecodigo write SetUnecodigo;
    Property Nome: TCmDbField read FNome write SetNome;
    Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
    Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

    Constructor Create; Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

implementation

{ TDbUnidNegocio }

constructor TDbUnidNegocio.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'UNIDNEGOCIO';

  fIdpessoa  := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Empresa');
  fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,True,False,True,'Unid. Negócio');
  fUnetipo   := CreateCmDbField('UNETIPO',ftString,False,False,False,True,'Tipo');
  fUnecodigo := CreateCmDbField('UNECODIGO',ftString,False,False,False,True,'Cód. Interno');
  fNome      := CreateCmDbField('NOME',ftString,True,False,False,True,'Nome');
  fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'Responsável');
end;

function TDbUnidNegocio.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbUnidNegocio.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbUnidNegocio.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbUnidNegocio.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbUnidNegocio.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbUnidNegocio.SetUnecodigo(const Value: TCmDbField);
begin
  FUnecodigo := Value;
end;

procedure TDbUnidNegocio.SetUnetipo(const Value: TCmDbField);
begin
  FUnetipo := Value;
end;

procedure TDbUnidNegocio.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.

