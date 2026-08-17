{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 27/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbAdminImovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbAdminImovel = class(TCmDbObject)

  private
    FIdadminimovel: TCmDbField;
    procedure SetIdadminimovel(const Value: TCmDbField);

  public

     Property Idadminimovel: TCmDbField read FIdadminimovel write SetIdadminimovel;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAdminImovel }

constructor TDbAdminImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ADMINIMOVEL';

  fIdadminimovel := CreateCmDbField('IDADMINIMOVEL',ftfloat,True,True,False,True,'');
end;

function TDbAdminImovel.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbAdminImovel.SetIdadminimovel(const Value: TCmDbField);
begin
  FIdadminimovel := Value;
end;

end.



