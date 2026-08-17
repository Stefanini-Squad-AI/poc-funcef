{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 07/03/2005                             }
{                                                       }
{*******************************************************}

unit uDBBemLeasing;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBBemLeasing = class(TCmDbObject)

  private

  public

     Property Valleasing: TCmDbField;
     Property Perjuros: TCmDbField;
     Property Nparcpag: TCmDbField;
     Property Nparcelas: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Idbem: TCmDbField;
     Property Dataultpag: TCmDbField;
     Property Datainicio: TCmDbField;
     Property Cotaamortizacao: TCmDbField;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBBemLeasing }

constructor TDBBemLeasing.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BEMLEASING';

   fValleasing := CreateCmDbField('VALLEASING',ftfloat,True,False,False,False,'');
   fPerjuros := CreateCmDbField('PERJUROS',ftfloat,True,False,False,False,'');
   fNparcpag := CreateCmDbField('NPARCPAG',ftfloat,True,False,False,False,'');
   fNparcelas := CreateCmDbField('NPARCELAS',ftfloat,True,False,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,False,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,False,'');
   fDataultpag := CreateCmDbField('DATAULTPAG',ftDateTime,False,False,False,True,'');
   fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,True,False,False,False,'');
   fCotaamortizacao := CreateCmDbField('COTAAMORTIZACAO',ftfloat,True,False,False,False,'');
end;

function TDBBemLeasing.Insert: Boolean;
begin

   fIdpessoa.AsFloat := GetSequence('BEMLEASING');
   fIdbem.AsFloat := GetSequence('BEMLEASING');
   Result := Inherited Insert;

end;


end.



