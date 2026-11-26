{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbCalendprev;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCalendprev = class(TCmDbObject)

  private

  public

     Property Nome: TCmDbField;
     Property Idcalendario: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCalendprev }

constructor TDbCalendprev.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CALENDPREV';

   fNome := CreateCmDbField('NOME',ftString,False,False,False,True);
   fIdcalendario := CreateCmDbField('IDCALENDARIO',ftfloat,False,True,False,True);
end;

function TDbCalendprev.Insert: Boolean;
begin

   f'Idcalendario'.AsFloat := GetSequence(CALENDPREV);
   Result := Inherited Insert;

end;

function TDbCalendprev.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



