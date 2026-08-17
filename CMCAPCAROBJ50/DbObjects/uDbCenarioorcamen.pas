{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 02/04/2002                             }
{                                                       }
{*******************************************************}
Unit uDbCenarioOrcamen;

Interface
Uses
  uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCenarioOrcamen = class(TCmDbObject)

  private
    FNomecenario: TCmDbField;
    FIdcenarioorcamen: TCmDbField;
    procedure SetIdcenarioorcamen(const Value: TCmDbField);
    procedure SetNomecenario(const Value: TCmDbField);

  public

     Property Nomecenario: TCmDbField read FNomecenario write SetNomecenario;
     Property Idcenarioorcamen: TCmDbField read FIdcenarioorcamen write SetIdcenarioorcamen;

     Constructor Create( Aowner: TCmCustomCdbObject) ; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCenarioOrcamen }

Constructor TDbCenarioOrcamen.Create( Aowner: TCmCustomCdbObject); 
Begin
  Inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CENARIOORCAMEN';

   fNomecenario := CreateCmDbField('NOMECENARIO',ftString,True,False,False,True,'Nome do Cenário');
   fIdcenarioorcamen := CreateCmDbField('IDCENARIOORCAMEN',ftfloat,True,True,False,True,'Código do Cenário');
end;

function TDbCenarioOrcamen.Insert: Boolean;
begin

   fIdcenarioorcamen.AsFloat := GetSequence('CENARIOORCAMEN');
   Result := Inherited Insert;

end;

function TDbCenarioOrcamen.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbCenarioOrcamen.SetIdcenarioorcamen(const Value: TCmDbField);
begin
  FIdcenarioorcamen := Value;
end;

procedure TDbCenarioOrcamen.SetNomecenario(const Value: TCmDbField);
begin
  FNomecenario := Value;
end;

end.



