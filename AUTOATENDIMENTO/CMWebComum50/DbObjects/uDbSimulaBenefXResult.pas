{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 11/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbSimulaBenefXResult;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSimulaBenefXResult = class(TCmDbObject)

  private
    FIdsimulabenef: TCmDbField;
    FOrdem: TCmDbField;
    FIdresult: TCmDbField;
    procedure SetIdresult(const Value: TCmDbField);
    procedure SetIdsimulabenef(const Value: TCmDbField);
    procedure SetOrdem(const Value: TCmDbField);

  public

     Property Ordem: TCmDbField read FOrdem write SetOrdem;
     Property Idsimulabenef: TCmDbField read FIdsimulabenef write SetIdsimulabenef;
     Property Idresult: TCmDbField read FIdresult write SetIdresult;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbSimulaBenefXResult }

constructor TDbSimulaBenefXResult.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SIMULABENEFXRESULT';

   fOrdem := CreateCmDbField('ORDEM',ftfloat,True,False,False,True,'Ordem');
   fIdsimulabenef := CreateCmDbField('IDSIMULABENEF',ftfloat,True,True,False,True,'Id. Simulação de Benefício');
   fIdresult := CreateCmDbField('IDRESULT',ftfloat,False,True,False,True,'Id. Resultado');
end;

procedure TDbSimulaBenefXResult.SetIdresult(const Value: TCmDbField);
begin
  FIdresult := Value;
end;

procedure TDbSimulaBenefXResult.SetIdsimulabenef(const Value: TCmDbField);
begin
  FIdsimulabenef := Value;
end;

procedure TDbSimulaBenefXResult.SetOrdem(const Value: TCmDbField);
begin
  FOrdem := Value;
end;

end.



