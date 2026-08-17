{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/01/2008                             }
{                                                       }
{*******************************************************}

unit uDbEnviodocumento;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbEnviodocumento = class(TCmDbObject)

  private

  public

     Property Usuarioenvio: TCmDbField;
     Property Idenviodocumento: TCmDbField;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbEnviodocumento }

constructor TDbEnviodocumento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ENVIODOCUMENTO';

   fUsuarioenvio := CreateCmDbField('USUARIOENVIO',ftString,False,False,False,True,'');
   fIdenviodocumento := CreateCmDbField('IDENVIODOCUMENTO',ftfloat,True,True,False,True,'');
end;

function TDbEnviodocumento.Insert: Boolean;
begin

   fIdenviodocumento.AsFloat := GetSequence('ENVIODOCUMENTO');
   Result := Inherited Insert;

end;


end.



