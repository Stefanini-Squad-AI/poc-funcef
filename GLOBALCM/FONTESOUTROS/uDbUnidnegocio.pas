{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 27/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbUnidnegocio;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbUnidnegocio = class(TCmDbObject)

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

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbUnidnegocio }

constructor TDbUnidnegocio.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'UNIDNEGOCIO';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,True,False,True,'');
   fUnetipo := CreateCmDbField('UNETIPO',ftString,False,False,False,True,'');
   fUnecodigo := CreateCmDbField('UNECODIGO',ftString,False,False,False,True,'');
   fNome := CreateCmDbField('NOME',ftString,True,False,False,True,'');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
end;

function TDbUnidnegocio.Insert: Boolean;
begin

   fUnidnegoc.AsFloat := GetSequence('UNIDNEGOCIO');
   Result := Inherited Insert;

end;

function TDbUnidnegocio.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbUnidnegocio.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbUnidnegocio.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbUnidnegocio.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbUnidnegocio.SetUnecodigo(const Value: TCmDbField);
begin
  FUnecodigo := Value;
end;

procedure TDbUnidnegocio.SetUnetipo(const Value: TCmDbField);
begin
  FUnetipo := Value;
end;

procedure TDbUnidnegocio.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



