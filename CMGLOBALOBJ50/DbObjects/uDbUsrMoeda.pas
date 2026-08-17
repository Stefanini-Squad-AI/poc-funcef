{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 29/01/2003                             }
{                                                       }
{*******************************************************}

unit uDbUsrMoeda;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbUsrMoeda = class(TCmDbObject)

  private
    FIdusuario: TCmDbField;
    FMoeCodigo: TCmDbField;
    procedure SetMoeCodigo(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);

  public
    Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
    Property MoeCodigo: TCmDbField read FMoeCodigo write SetMoeCodigo;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

implementation

{ TDbUsrMoeda }

constructor TDbUsrMoeda.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'USUARIOXMOEDA';

  fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'Usuário');
  FMoeCodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,True,'Moeda');
end;

function TDbUsrMoeda.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbUsrMoeda.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbUsrMoeda.SetMoeCodigo(const Value: TCmDbField);
begin
  FMoeCodigo := Value;
end;

procedure TDbUsrMoeda.SetIdUsuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

end.



