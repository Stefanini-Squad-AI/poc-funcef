{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbCargoextxpess;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCargoextxpess = class(TCmDbObject)

  private

  public

     Property Idpessjur: TCmDbField;
     Property Idcargoext: TCmDbField;
     Property Datainicio: TCmDbField;
     Property Datafim: TCmDbField;
     Property Codpatro: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCargoextxpess }

constructor TDbCargoextxpess.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CARGOEXTXPESS';

   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,True,False,True);
   fIdcargoext := CreateCmDbField('IDCARGOEXT',ftfloat,False,True,False,True);
   fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,False,True,False,True);
   fDatafim := CreateCmDbField('DATAFIM',ftDateTime,True,False,False,True);
   fCodpatro := CreateCmDbField('CODPATRO',ftString,True,False,False,True);
end;

function TDbCargoextxpess.Insert: Boolean;
begin

  
   Result := Inherited Insert;

end;

function TDbCargoextxpess.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



