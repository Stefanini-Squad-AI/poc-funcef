{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbBeneficiariopp;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBeneficiariopp = class(TCmDbObject)

  private

  public

     Property Matricula: TCmDbField;
     Property Idbeneficiariopp: TCmDbField;
     Property Codmantenedora: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBeneficiariopp }

constructor TDbBeneficiariopp.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFICIARIOPP';

   fMatricula := CreateCmDbField('MATRICULA',ftString,True,False,False,True);
   fIdbeneficiariopp := CreateCmDbField('IDBENEFICIARIOPP',ftfloat,False,True,False,True);
   fCodmantenedora := CreateCmDbField('CODMANTENEDORA',ftString,True,False,False,True);
end;

function TDbBeneficiariopp.Insert: Boolean;
begin

   
   Result := Inherited Insert;

end;

function TDbBeneficiariopp.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



