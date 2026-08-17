{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbAlimentados;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbAlimentados = class(TCmDbObject)

  private

  public

     Property Idpessoa: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbAlimentados }

constructor TDbAlimentados.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ALIMENTADOS';

   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,True,False,True);
end;

function TDbAlimentados.Insert: Boolean;
begin

   
   Result := Inherited Insert;

end;

function TDbAlimentados.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



