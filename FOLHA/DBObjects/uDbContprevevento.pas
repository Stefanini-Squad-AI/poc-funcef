{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbContprevevento;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbContprevevento = class(TCmDbObject)

  private

  public

     Property Idregravalidaass: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Ideventogerador: TCmDbField;
     Property Idcontribuicao: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbContprevevento }

constructor TDbContprevevento.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTPREVEVENTO';

   fIdregravalidaass := CreateCmDbField('IDREGRAVALIDAASS',ftfloat,True,False,False,True);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True,False,True);
   fIdeventogerador := CreateCmDbField('IDEVENTOGERADOR',ftfloat,False,True,False,True);
   fIdcontribuicao := CreateCmDbField('IDCONTRIBUICAO',ftfloat,False,True,False,True);
end;

function TDbContprevevento.Insert: Boolean;
begin

   
   Result := Inherited Insert;

end;

function TDbContprevevento.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



