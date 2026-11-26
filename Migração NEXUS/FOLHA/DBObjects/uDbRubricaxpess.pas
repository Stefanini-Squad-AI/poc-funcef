{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbRubricaxpess;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbRubricaxpess = class(TCmDbObject)

  private

  public

     Property Idrubrica: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Descrprovdesc: TCmDbField;
     Property Codprovdesc: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbRubricaxpess }

constructor TDbRubricaxpess.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RUBRICAXPESS';

   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,False,True);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,True);
   fDescrprovdesc := CreateCmDbField('DESCRPROVDESC',ftString,True,False);
   fCodprovdesc := CreateCmDbField('CODPROVDESC',ftString,True,False);
end;

function TDbRubricaxpess.Insert: Boolean;
begin

  
   Result := Inherited Insert;

end;

end.



