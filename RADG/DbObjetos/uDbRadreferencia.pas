{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbRadreferencia;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadreferencia = class(TCmDbObject)

  private

  public

     Property Idreferencia: TCmDbField;
     Property Descreferencia: TCmDbField;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadreferencia }

constructor TDbRadreferencia.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADREFERENCIA';

   fIdreferencia := CreateCmDbField('IDREFERENCIA',ftfloat,True,True,False,True,'');
   fDescreferencia := CreateCmDbField('DESCREFERENCIA',ftString,False,False,False,True,'');
end;

function TDbRadreferencia.Insert: Boolean;
begin

   fIdreferencia.AsFloat := GetSequence('RADREFERENCIA');
   Result := Inherited Insert;

end;


end.



