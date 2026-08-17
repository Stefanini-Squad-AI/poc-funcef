{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/04/2002                             }
{                                                       }
{*******************************************************}

unit uDBAcrescValorxMoeda;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBAcrescValorxMoeda = class(TCmDbObject)

  private

  public

     Property Valorg: TCmDbField;
     Property Moecodigo: TCmDbField;
     Property Idacrescimo: TCmDbField;
     Property Cmbem: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBAcrescValorxMoeda }

constructor TDBAcrescValorxMoeda.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ACRESCVALORXMOEDA';

   fValorg := CreateCmDbField('VALORG',ftfloat,False,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,False,'');
   fIdacrescimo := CreateCmDbField('IDACRESCIMO',ftfloat,True,True,False,False,'');
   fCmbem := CreateCmDbField('CMBEM',ftfloat,False,False,False,False,'');
end;

function TDBAcrescValorxMoeda.Insert: Boolean;
begin

   fMoecodigo.AsFloat := GetSequence('ACRESCVALORXMOEDA');
   fIdacrescimo.AsFloat := GetSequence('ACRESCVALORXMOEDA');
   Result := Inherited Insert;

end;

function TDBAcrescValorxMoeda.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



