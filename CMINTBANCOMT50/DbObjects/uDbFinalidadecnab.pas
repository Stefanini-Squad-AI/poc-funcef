{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/04/2008                             }
{                                                       }
{*******************************************************}

unit uDbFinalidadecnab;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbFinalidadecnab = class(TCmDbObject)

  private
    FIdmodeloscnab: TCmDbField;
    FDescfinalidade: TCmDbField;
    FCodfinalidade: TCmDbField;
    FIdfinalidadecnab: TCmDbField;
    procedure SetCodfinalidade(const Value: TCmDbField);
    procedure SetDescfinalidade(const Value: TCmDbField);
    procedure SetIdfinalidadecnab(const Value: TCmDbField);
    procedure SetIdmodeloscnab(const Value: TCmDbField);

  public

     Property Idmodeloscnab: TCmDbField read FIdmodeloscnab write SetIdmodeloscnab;
     Property Idfinalidadecnab: TCmDbField read FIdfinalidadecnab write SetIdfinalidadecnab;
     Property Descfinalidade: TCmDbField read FDescfinalidade write SetDescfinalidade;
     Property Codfinalidade: TCmDbField read FCodfinalidade write SetCodfinalidade;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbFinalidadecnab }

constructor TDbFinalidadecnab.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FINALIDADECNAB';

   fIdmodeloscnab := CreateCmDbField('IDMODELOSCNAB',ftfloat,False,False,False,True,'');
   fIdfinalidadecnab := CreateCmDbField('IDFINALIDADECNAB',ftfloat,True,True,False,True,'');
   fDescfinalidade := CreateCmDbField('DESCFINALIDADE',ftString,False,False,False,True,'');
   fCodfinalidade := CreateCmDbField('CODFINALIDADE',ftString,False,False,False,True,'');
end;

function TDbFinalidadecnab.Insert: Boolean;
begin

   fIdfinalidadecnab.AsFloat := GetSequence('FINALIDADECNAB');
   Result := Inherited Insert;

end;


procedure TDbFinalidadecnab.SetCodfinalidade(const Value: TCmDbField);
begin
  FCodfinalidade := Value;
end;

procedure TDbFinalidadecnab.SetDescfinalidade(const Value: TCmDbField);
begin
  FDescfinalidade := Value;
end;

procedure TDbFinalidadecnab.SetIdfinalidadecnab(const Value: TCmDbField);
begin
  FIdfinalidadecnab := Value;
end;

procedure TDbFinalidadecnab.SetIdmodeloscnab(const Value: TCmDbField);
begin
  FIdmodeloscnab := Value;
end;

end.



