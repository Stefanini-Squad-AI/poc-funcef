{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbCritAvaliacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCritAvaliacao = class(TCmDbObject)

  private

  public

     Property Peso: TCmDbField;
     Property Idtipoavaliacao: TCmDbField;
     Property Idcritavaliacao: TCmDbField;
     Property Desccritavaliacao: TCmDbField;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCritAvaliacao }

constructor TDbCritAvaliacao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CRITAVALIACAO';

   fPeso := CreateCmDbField('PESO',ftfloat,True,False,False,True,'');
   fIdtipoavaliacao := CreateCmDbField('IDTIPOAVALIACAO',ftfloat,True,False,False,True,'');
   fIdcritavaliacao := CreateCmDbField('IDCRITAVALIACAO',ftfloat,True,True,False,True,'');
   fDesccritavaliacao := CreateCmDbField('DESCCRITAVALIACAO',ftString,False,False,False,True,'');
end;

function TDbCritAvaliacao.Insert: Boolean;
begin

   fIdcritavaliacao.AsFloat := GetSequence('CRITAVALIACAO');
   Result := Inherited Insert;

end;


end.



