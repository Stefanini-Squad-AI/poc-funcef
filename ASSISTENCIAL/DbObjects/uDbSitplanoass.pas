{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbSitplanoass;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbSitplanoass = class(TCmDbObject)

  private
     FIdSitPlanoAss: TCmDbField;
     FFlgInterno: TCmDbField;
     FDescricao: TCmDbField;
     Procedure SetIdSitPlanoAss(const Value: TCmDbField);
     Procedure SetFlgInterno(const Value: TCmDbField);
     Procedure SetDescricao(const Value: TCmDbField);

  public

     Property IdSitPlanoass: TCmDbField read FIdSitPlanoAss write SetIdSitPlanoAss;
     Property Flginterno: TCmDbField read FFlgInterno write SetFlgInterno;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbSitplanoass }

constructor TDbSitPlanoAss.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SITPLANOASS';

   fIdSitPlanoAss := CreateCmDbField('IDSITPLANOASS',ftfloat,False,True);
   fFlgInterno := CreateCmDbField('FLGINTERNO',ftString,True,False);
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False);
end;

function TDbSitPlanoAss.Insert: Boolean;
begin
  fIdsitplanoass.AsFloat := GetSequence('SITPLANOASS');
  Result := Inherited Insert;
end;

function TDbSitPlanoAss.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure SetIdSitPlanoAss(const Value: TCmDbField);
begin
  FIdSitPlanoAss:=Value;
end;

procedure SetFlgInterno(const Value: TCmDbField);
begin
  FFlgInterno:=Value;
end;

procedure SetDescricao(const Value: TCmDbField);
begin
  FDescricao:=Value;
end;

end.
