{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/04/2002                             }
{                                                       }
{*******************************************************}

unit uDBReavalxDep;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBReavalxDep = class(TCmDbObject)

  private

  public

     Property Taxadep: TCmDbField;
     Property Moecodigo: TCmDbField;
     Property Idreavalxdep: TCmDbField;
     Property Idreavaliacao: TCmDbField;
     Property Deplanc: TCmDbField;
     Property Cmdep: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBReavalxDep }

constructor TDBReavalxDep.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'REAVALXDEP';

   fTaxadep := CreateCmDbField('TAXADEP',ftfloat,False,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,False,'');
   fIdreavalxdep := CreateCmDbField('IDREAVALXDEP',ftfloat,True,True,False,False,'');
   fIdreavaliacao := CreateCmDbField('IDREAVALIACAO',ftfloat,True,True,False,False,'');
   fDeplanc := CreateCmDbField('DEPLANC',ftfloat,False,False,False,False,'');
   fCmdep := CreateCmDbField('CMDEP',ftfloat,False,False,False,False,'');
end;

function TDBReavalxDep.Insert: Boolean;
begin

   fMoecodigo.AsFloat := GetSequence('REAVALXDEP');
   fIdreavalxdep.AsFloat := GetSequence('REAVALXDEP');
   fIdreavaliacao.AsFloat := GetSequence('REAVALXDEP');
   Result := Inherited Insert;

end;

function TDBReavalxDep.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



