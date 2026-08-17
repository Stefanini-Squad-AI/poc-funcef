{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbParamSCQ;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamSCQ = class(TCmDbObject)

  private

  public

     Property Numavali: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Flgzeroum: TCmDbField;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamSCQ }

constructor TDbParamSCQ.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMSCQ';

   fNumavali := CreateCmDbField('NUMAVALI',ftfloat,True,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fFlgzeroum := CreateCmDbField('FLGZEROUM',ftString,False,False,False,True,'');
end;

function TDbParamSCQ.Insert: Boolean;
begin

   fIdpessoa.AsFloat := GetSequence('PARAMSCQ');
   Result := Inherited Insert;

end;


end.



