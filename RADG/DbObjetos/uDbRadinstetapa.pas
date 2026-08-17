{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbRadinstetapa;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadinstetapa = class(TCmDbObject)

  private

  public

     Property Idtipoetapa: TCmDbField;
     Property Idprocesso: TCmDbField;
     Property Idetapaant: TCmDbField;
     Property Idetapa: TCmDbField;
     Property Idandamento: TCmDbField;
     Property Datainietapa: TCmDbField;
     Property Datafimprev: TCmDbField;
     Property Datafimetapa: TCmDbField;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadinstetapa }

constructor TDbRadinstetapa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADINSTETAPA';

   fIdtipoetapa := CreateCmDbField('IDTIPOETAPA',ftfloat,False,False,False,True,'');
   fIdprocesso := CreateCmDbField('IDPROCESSO',ftfloat,True,True,False,True,'');
   fIdetapaant := CreateCmDbField('IDETAPAANT',ftfloat,False,False,False,True,'');
   fIdetapa := CreateCmDbField('IDETAPA',ftfloat,True,True,False,True,'');
   fIdandamento := CreateCmDbField('IDANDAMENTO',ftfloat,False,False,False,True,'');
   fDatainietapa := CreateCmDbField('DATAINIETAPA',ftDateTime,False,False,False,True,'');
   fDatafimprev := CreateCmDbField('DATAFIMPREV',ftDateTime,False,False,False,True,'');
   fDatafimetapa := CreateCmDbField('DATAFIMETAPA',ftDateTime,False,False,False,True,'');
end;

function TDbRadinstetapa.Insert: Boolean;
begin

   fIdprocesso.AsFloat := GetSequence('RADINSTETAPA');
   fIdetapa.AsFloat := GetSequence('RADINSTETAPA');
   Result := Inherited Insert;

end;


end.



