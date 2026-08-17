{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/04/2002                             }
{                                                       }
{*******************************************************}

unit uDBAcrescValorxDep;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBAcrescValorxDep = class(TCmDbObject)

  private

  public

     Property Taxadep: TCmDbField;
     Property Moecodigo: TCmDbField;
     Property Idacrescimoxdep: TCmDbField;
     Property Idacrescimo: TCmDbField;
     Property Deplanc: TCmDbField;
     Property Cmdep: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBAcrescValorxDep }

constructor TDBAcrescValorxDep.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ACRESCVALORXDEP';

   fTaxadep := CreateCmDbField('TAXADEP',ftfloat,False,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,False,'');
   fIdacrescimoxdep := CreateCmDbField('IDACRESCIMOXDEP',ftfloat,True,True,False,False,'');
   fIdacrescimo := CreateCmDbField('IDACRESCIMO',ftfloat,True,True,False,False,'');
   fDeplanc := CreateCmDbField('DEPLANC',ftfloat,False,False,False,False,'');
   fCmdep := CreateCmDbField('CMDEP',ftfloat,False,False,False,False,'');
end;

function TDBAcrescValorxDep.Insert: Boolean;
begin

   fMoecodigo.AsFloat := GetSequence('ACRESCVALORXDEP');
   fIdacrescimoxdep.AsFloat := GetSequence('ACRESCVALORXDEP');
   fIdacrescimo.AsFloat := GetSequence('ACRESCVALORXDEP');
   Result := Inherited Insert;

end;

function TDBAcrescValorxDep.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



