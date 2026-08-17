{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbWebTipoUsuario;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbWebTipoUsuario = class(TCmDbObject)

  private
    FDesctipousuario: TCmDbField;
    FIdtipousuario: TCmDbField;
    procedure SetDesctipousuario(const Value: TCmDbField);
    procedure SetIdtipousuario(const Value: TCmDbField);

  public

     Property Idtipousuario: TCmDbField read FIdtipousuario write SetIdtipousuario;
     Property Desctipousuario: TCmDbField read FDesctipousuario write SetDesctipousuario;

     Constructor Create( AOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbWebTipoUsuario }

constructor TDbWebTipoUsuario.Create( AOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBTIPOUSUARIO';

   fIdtipousuario := CreateCmDbField('IDTIPOUSUARIO',ftfloat,True,True,False,False,'Código do Tipo de Usuário');
   fDesctipousuario := CreateCmDbField('DESCTIPOUSUARIO',ftString,True,False,False,False,'Descrição do Tipo de Usuário');
end;

function TDbWebTipoUsuario.Insert: Boolean;
begin

   fIdtipousuario.AsFloat := GetSequence('WEBTIPOUSUARIO');
   Result := Inherited Insert;

end;

function TDbWebTipoUsuario.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbWebTipoUsuario.SetDesctipousuario(const Value: TCmDbField);
begin
  FDesctipousuario := Value;
end;

procedure TDbWebTipoUsuario.SetIdtipousuario(const Value: TCmDbField);
begin
  FIdtipousuario := Value;
end;

end.

