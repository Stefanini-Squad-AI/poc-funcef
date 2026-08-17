{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 15/01/2008                             }
{                                                       }
{*******************************************************}

unit uDbAdminimovelAlex;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbAdminimovelAlex = class(TCmDbObject)

  private

  public

     Property Idadminimovel: TCmDbField;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAdminimovelAlex }

constructor TDbAdminimovelAlex.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ADMINIMOVEL';

   fIdadminimovel := CreateCmDbField('IDADMINIMOVEL',ftfloat,True,True,False,True,'');
end;

function TDbAdminimovelAlex.Insert: Boolean;
begin

   fIdadminimovel.AsFloat := GetSequence('ADMINIMOVEL');
   Result := Inherited Insert;

end;


end.



