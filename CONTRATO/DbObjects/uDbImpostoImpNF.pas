{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 02/05/2003                             }
{                                                       }
{*******************************************************}

unit uDbImpostoImpNF;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbImpostoImpNF = class(TCmDbObject)

  private
    FCodalterador: TCmDbField;
    FIdpessoa: TCmDbField;
  public
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Codalterador: TCmDbField read FCodalterador write FCodalterador;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
     Function Insert :Boolean; Override;
  End;

implementation

{ TDbImpostoImpNF }

constructor TDbImpostoImpNF.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'IMPOSTOIMPNF';

   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fCodalterador := CreateCmDbField('CODALTERADOR',ftfloat,True,True,False,True,'');
end;

function TDbImpostoImpNF.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

end.



