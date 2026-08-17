{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/08/2004                             }
{                                                       }
{*******************************************************}

unit uDbCotacaomoeda;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCotacaomoeda = class(TCmDbObject)

  private

  public

     Property Moecodigo: TCmDbField;
     Property Idcotacaomoeda: TCmDbField;
     Property Cotvalor: TCmDbField;
     Property Cotdata: TCmDbField;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCotacaomoeda }

constructor TDbCotacaomoeda.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COTACAOMOEDA';

   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,False,False,True,'');
   fIdcotacaomoeda := CreateCmDbField('IDCOTACAOMOEDA',ftfloat,True,True,False,True,'');
   fCotvalor := CreateCmDbField('COTVALOR',ftfloat,True,False,False,True,'');
   fCotdata := CreateCmDbField('COTDATA',ftDateTime,True,False,False,True,'');
end;

function TDbCotacaomoeda.Insert: Boolean;
begin

   fIdcotacaomoeda.AsFloat := GetSequence('COTACAOMOEDA');
   Result := Inherited Insert;

end;


end.



