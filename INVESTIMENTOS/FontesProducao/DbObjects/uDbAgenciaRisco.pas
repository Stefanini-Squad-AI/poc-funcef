{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Pendencia: 24875                                      }
{ Atualizado Em: 23/07/2007                             }
{                                                       }
{*******************************************************}

unit uDbAgenciaRisco;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbAgenciaRisco = class(TCmDbObject)

  private
    FDescAgenciaRisco: TCmDbField;
    FIdAgenciaRisco: TCmDbField;
    procedure SetDescAgenciaRisco(const Value: TCmDbField);
    procedure SetIdAgenciaRisco(const Value: TCmDbField);

  public

     Property IdAgenciaRisco: TCmDbField read FIdAgenciaRisco write SetIdAgenciaRisco;
     Property DescAgenciaRisco: TCmDbField read FDescAgenciaRisco write SetDescAgenciaRisco;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAgenciaRisco }

constructor TDbAgenciaRisco.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'AGENCIARISCO';

   fIdagenciarisco := CreateCmDbField('IDAGENCIARISCO',ftfloat,True,True,False,True,'Identificador único da Agência');
   fDescagenciarisco := CreateCmDbField('DESCAGENCIARISCO',ftString,True,False,False,True,'Descrição da Agência de Risco');
end;

function TDbAgenciaRisco.Insert: Boolean;
begin

   fIdagenciarisco.AsFloat := GetSequence('AGENCIARISCO');
   Result := Inherited Insert;

end;


procedure TDbAgenciaRisco.SetDescAgenciaRisco(const Value: TCmDbField);
begin
  FDescAgenciaRisco := Value;
end;

procedure TDbAgenciaRisco.SetIdAgenciaRisco(const Value: TCmDbField);
begin
  FIdAgenciaRisco := Value;
end;

end.



