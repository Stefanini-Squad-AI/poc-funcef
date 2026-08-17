{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 03/01/2003                             }
{                                                       }
{*******************************************************}

unit uDbResponsavel;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbResponsavel = class(TCmDbObject)

  private
    FFlgprojeto: TCmDbField;
    FFlgcontrato: TCmDbField;
    FIdresponsavel: TCmDbField;
    FFlgadmprev: TCmDbField;
    FFlgimobiliario: TCmDbField;
    FFlgtpresponsavel: TCmDbField;
    FFlgativofixo: TCmDbField;
  public
     Property Idresponsavel: TCmDbField read FIdresponsavel write FIdresponsavel;
     Property Flgtpresponsavel: TCmDbField read FFlgtpresponsavel write FFlgtpresponsavel;
     Property Flgprojeto: TCmDbField read FFlgprojeto write FFlgprojeto;
     Property Flgimobiliario: TCmDbField read FFlgimobiliario write FFlgimobiliario;
     Property Flgcontrato: TCmDbField read FFlgcontrato write FFlgcontrato;
     Property Flgativofixo: TCmDbField read FFlgativofixo write FFlgativofixo;
     Property Flgadmprev: TCmDbField read FFlgadmprev write FFlgadmprev;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbResponsavel }

constructor TDbResponsavel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RESPONSAVEL';

   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,True,True,False,True,'');
   fFlgtpresponsavel := CreateCmDbField('FLGTPRESPONSAVEL',ftfloat,False,False,False,False,'');
   fFlgprojeto := CreateCmDbField('FLGPROJETO',ftfloat,False,False,False,False,'');
   fFlgimobiliario := CreateCmDbField('FLGIMOBILIARIO',ftfloat,False,False,False,False,'');
   fFlgcontrato := CreateCmDbField('FLGCONTRATO',ftfloat,False,False,False,False,'');
   fFlgativofixo := CreateCmDbField('FLGATIVOFIXO',ftfloat,False,False,False,False,'');
   fFlgadmprev := CreateCmDbField('FLGADMPREV',ftfloat,False,False,False,False,'');
end;

function TDbResponsavel.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


end.



