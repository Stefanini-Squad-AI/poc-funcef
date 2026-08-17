{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/04/2002                             }
{                                                       }
{*******************************************************}

unit uDBReavalxMoeda;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBReavalxMoeda = class(TCmDbObject)

  private

  public

     Property Valorg: TCmDbField;
     Property Moecodigo: TCmDbField;
     Property Idreavaliacao: TCmDbField;
     Property Cmbem: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBReavalxMoeda }

constructor TDBReavalxMoeda.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'REAVALXMOEDA';

   fValorg := CreateCmDbField('VALORG',ftfloat,False,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,False,'');
   fIdreavaliacao := CreateCmDbField('IDREAVALIACAO',ftfloat,True,True,False,False,'');
   fCmbem := CreateCmDbField('CMBEM',ftfloat,False,False,False,False,'');
end;

function TDBReavalxMoeda.Insert: Boolean;
begin

   fMoecodigo.AsFloat := GetSequence('REAVALXMOEDA');
   fIdreavaliacao.AsFloat := GetSequence('REAVALXMOEDA');
   Result := Inherited Insert;

end;

function TDBReavalxMoeda.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



