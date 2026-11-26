{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbCalenddatas;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCalenddatas = class(TCmDbObject)

  private

  public

     Property Idcalendario: TCmDbField;
     Property Flginterno: TCmDbField;
     Property Datapagbenef: TCmDbField;
     Property Datapagantbenef: TCmDbField;
     Property Datapagantabono: TCmDbField;
     Property Datapagabono: TCmDbField;
     Property Datacobnormal: TCmDbField;
     Property Datacobdevolucao: TCmDbField;
     Property Datacobatraso: TCmDbField;
     Property Anomesref: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCalenddatas }

constructor TDbCalenddatas.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CALENDDATAS';

   fIdcalendario := CreateCmDbField('IDCALENDARIO',ftfloat,False,True,False,True);
   fFlginterno := CreateCmDbField('FLGINTERNO',ftString,False,True,False,True);
   fDatapagbenef := CreateCmDbField('DATAPAGBENEF',ftDateTime,True,False,False,True);
   fDatapagantbenef := CreateCmDbField('DATAPAGANTBENEF',ftDateTime,True,False,False,True);
   fDatapagantabono := CreateCmDbField('DATAPAGANTABONO',ftDateTime,True,False,False,True);
   fDatapagabono := CreateCmDbField('DATAPAGABONO',ftDateTime,True,False,False,True);
   fDatacobnormal := CreateCmDbField('DATACOBNORMAL',ftDateTime,True,False,False,True);
   fDatacobdevolucao := CreateCmDbField('DATACOBDEVOLUCAO',ftDateTime,True,False,False,True);
   fDatacobatraso := CreateCmDbField('DATACOBATRASO',ftDateTime,True,False,False,True);
   fAnomesref := CreateCmDbField('ANOMESREF',ftString,False,True,False,True);
end;

function TDbCalenddatas.Insert: Boolean;
begin

  
   Result := Inherited Insert;

end;

function TDbCalenddatas.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



