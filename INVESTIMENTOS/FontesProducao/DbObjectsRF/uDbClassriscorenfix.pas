{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/01/2006                             }
{                                                       }
{*******************************************************}

unit uDbClassriscorenfix;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbClassriscorenfix = class(TCmDbObject)

  private
    FIdclassriscorenfix: TCmDbField;
    FNivelclassrisco: TCmDbField;
    FCorclassrisco: TCmDbField;
    FNomeclassrisco: TCmDbField;
    procedure SetCorclassrisco(const Value: TCmDbField);
    procedure SetIdclassriscorenfix(const Value: TCmDbField);
    procedure SetNivelclassrisco(const Value: TCmDbField);
    procedure SetNomeclassrisco(const Value: TCmDbField);

  public

     Property Nomeclassrisco: TCmDbField read FNomeclassrisco write SetNomeclassrisco;
     Property Nivelclassrisco: TCmDbField read FNivelclassrisco write SetNivelclassrisco;
     Property Idclassriscorenfix: TCmDbField read FIdclassriscorenfix write SetIdclassriscorenfix;
     Property Corclassrisco: TCmDbField read FCorclassrisco write SetCorclassrisco;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbClassriscorenfix }

constructor TDbClassriscorenfix.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CLASSRISCORENFIX';

   fNomeclassrisco := CreateCmDbField('NOMECLASSRISCO',ftString,True,False,False,True,'');
   fNivelclassrisco := CreateCmDbField('NIVELCLASSRISCO',ftfloat,False,False,False,True,'');
   fIdclassriscorenfix := CreateCmDbField('IDCLASSRISCORENFIX',ftfloat,True,True,False,True,'');
   fCorclassrisco := CreateCmDbField('CORCLASSRISCO',ftfloat,False,False,False,True,'');
end;

function TDbClassriscorenfix.Insert: Boolean;
begin

   fIdclassriscorenfix.AsFloat := GetSequence('CLASSRISCORENFIX');
   Result := Inherited Insert;

end;


procedure TDbClassriscorenfix.SetCorclassrisco(const Value: TCmDbField);
begin
  FCorclassrisco := Value;
end;

procedure TDbClassriscorenfix.SetIdclassriscorenfix(
  const Value: TCmDbField);
begin
  FIdclassriscorenfix := Value;
end;

procedure TDbClassriscorenfix.SetNivelclassrisco(const Value: TCmDbField);
begin
  FNivelclassrisco := Value;
end;

procedure TDbClassriscorenfix.SetNomeclassrisco(const Value: TCmDbField);
begin
  FNomeclassrisco := Value;
end;

end.



