{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbCargoxnivel;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCargoxnivel = class(TCmDbObject)

  private

  public

     Property Idpessjurnivel: TCmDbField;
     Property Idpessjur: TCmDbField;
     Property Idnivel: TCmDbField;
     Property Idcargoext: TCmDbField;
     Property Datavigencia: TCmDbField;
     Property Datafim: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCargoxnivel }

constructor TDbCargoxnivel.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CARGOXNIVEL';

   fIdpessjurnivel := CreateCmDbField('IDPESSJURNIVEL',ftfloat,True,False,False,True);
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,True,False,True);
   fIdnivel := CreateCmDbField('IDNIVEL',ftfloat,False,True,False,True);
   fIdcargoext := CreateCmDbField('IDCARGOEXT',ftfloat,False,True,False,True);
   fDatavigencia := CreateCmDbField('DATAVIGENCIA',ftDateTime,False,True,False,True);
   fDatafim := CreateCmDbField('DATAFIM',ftDateTime,True,False,False,True);
end;

function TDbCargoxnivel.Insert: Boolean;
begin

  
   Result := Inherited Insert;

end;

function TDbCargoxnivel.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



