{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 03/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbCadCenario;

interface
Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;       

Type
  TDbCadCenario = class(TCmDbObject)

  private
    FNomecenario      : TCmDbField;
    FIdcenarioorcamen : TCmDbField;

    procedure SetNomecenario( Const Value : TCmDbField );
    procedure SetIdcenarioorcamen( Const Value : TCmDbField );

  public

     Property Nomecenario      : TCmDbField Read FNomecenario      Write SetNomecenario;
     Property Idcenarioorcamen : TCmDbField Read FIdcenarioorcamen Write SetIdcenarioorcamen;

     Constructor Create( Aowner: TCmCustomCdbObject) ; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCadCenario }
//************************************************
Constructor TDbCadCenario.Create( Aowner: TCmCustomCdbObject) ;
Begin
  Inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CENARIOORCAMEN';

   fNomecenario := CreateCmDbField('NOMECENARIO',ftString,True,False,False,True,'Nome do Cenário');
   fIdcenarioorcamen := CreateCmDbField('IDCENARIOORCAMEN',ftfloat,True,True,False,True,'Código do Cenário');
End;
//************************************************
Function TDbCadCenario.Insert: Boolean;
Begin

   fIdcenarioorcamen.AsFloat := GetSequence('CENARIOORCAMEN');
   Result := Inherited Insert;
End;
//************************************************
Function TDbCadCenario.LoadFromDB: Boolean;
Begin

   Result := Inherited LoadFromDB;
End;
//************************************************
Procedure TDbCadCenario.SetIdcenarioorcamen(const Value: TCmDbField);
Begin

  FNomecenario      := Value;
End;
//************************************************
Procedure TDbCadCenario.SetNomecenario(const Value: TCmDbField);
Begin

  FIdcenarioorcamen := Value;
End;
//************************************************
End.
