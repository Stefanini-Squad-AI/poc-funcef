{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbNucleofamass;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbNucleofamass = class(TCmDbObject)

  private
     FIdtitular: TCmDbField;
     FIdResponsavel: TCmDbField;
     FIdNucleo: TCmDbField;
     Procedure SetIdTitular(const Value: TCmDbField);
     Procedure SetIdResponsavel(const Value: TCmDbField);
     Procedure SetIdNucleo(const Value: TCmDbField);

  public

     Property Idtitular: TCmDbField read FIdTitular write SetIdTitular;
     Property IdResponsavel: TCmDbField read FIdResponsavel write SetIdResponsavel;
     Property Idnucleo: TCmDbField read FIdNucleo write SetIdNucleo;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbNucleofamass }

constructor TDbNucleofamass.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'NUCLEOFAMASS';

  fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,True,False);
  fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,True,False);
  fIdnucleo := CreateCmDbField('IDNUCLEO',ftfloat,False,True);
end;

function TDbNucleoFamass.Insert: Boolean;
begin
  fIdnucleo.AsFloat := GetSequence('NUCLEOFAMASS');
  Result := Inherited Insert;
end;

function TDbNucleoFamass.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure SetIdTitular(const Value: TCmDbField);
begin
  FIdTitular:=Value;
end;

procedure SetIdResponsavel(const Value: TCmDbField);
begin
  FIdResponsavel:=Value;
end;

procedure SetIdNucleo(const Value: TCmDbField);
begin
  FIdNucleo:=Value;
end;

end.
