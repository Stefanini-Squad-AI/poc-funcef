{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbTipoAvaliacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipoAvaliacao = class(TCmDbObject)

  private

  public

     Property Idtipoavaliacao: TCmDbField;
     Property Desctipoavaliacao: TCmDbField;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTipoAvaliacao }

constructor TDbTipoAvaliacao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOAVALIACAO';

   fIdtipoavaliacao := CreateCmDbField('IDTIPOAVALIACAO',ftfloat,True,True,False,True,'');
   fDesctipoavaliacao := CreateCmDbField('DESCTIPOAVALIACAO',ftString,False,False,False,True,'');
end;

function TDbTipoAvaliacao.Insert: Boolean;
begin

   fIdtipoavaliacao.AsFloat := GetSequence('TIPOAVALIACAO');
   Result := Inherited Insert;

end;


end.



