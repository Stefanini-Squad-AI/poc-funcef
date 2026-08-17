{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Rodrigo de Brito Figueredo      }
{ Atualizado Em: 23/08/2012                             }
{                                                       }
{*******************************************************}

unit uDbRequipesxcaracpessoais;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRequipesxcaracpessoais = class(TCmDbObject)
  private
    FNumreq          : TCmDbField;
    FIdcaracpessoais : TCmDbField;
  public
     Property Numreq          : TCmDbField Read FNumreq          Write FNumreq         ;
     Property IdCaracPessoais : TCmDbField Read FIdcaracpessoais Write FIdcaracpessoais;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbRequipesxcaracpessoais }

constructor TDbRequipesxcaracpessoais.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'REQUIPESXCARACPESSOAIS';

  fNumreq          := CreateCmDbField('NUMREQ',         ftfloat,True,True,False,False,'');
  fIdcaracpessoais := CreateCmDbField('IDCARACPESSOAIS',ftfloat,True,True,False,False,'');
end;

end.



