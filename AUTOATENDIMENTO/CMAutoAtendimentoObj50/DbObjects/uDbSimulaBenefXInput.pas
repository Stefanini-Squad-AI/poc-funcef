{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 21/02/2003                             }
{                                                       }
{*******************************************************}

unit uDbSimulaBenefXInput;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSimulaBenefXInput = class(TCmDbObject)

  private
    FIdsimulabenef: TCmDbField;
    FOrdem: TCmDbField;
    FIdinput: TCmDbField;
    procedure SetIdinput(const Value: TCmDbField);
    procedure SetIdsimulabenef(const Value: TCmDbField);
    procedure SetOrdem(const Value: TCmDbField);

  public

     Property Ordem: TCmDbField read FOrdem write SetOrdem;
     Property Idsimulabenef: TCmDbField read FIdsimulabenef write SetIdsimulabenef;
     Property Idinput: TCmDbField read FIdinput write SetIdinput;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbSimulaBenefXInput }

constructor TDbSimulaBenefXInput.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SIMULABENEFXINPUT';

   fOrdem := CreateCmDbField('ORDEM',ftfloat,True,False,False,False,'Ordem');
   fIdsimulabenef := CreateCmDbField('IDSIMULABENEF',ftfloat,True,True,False,False,'Id. Simulação de Benefício');
   fIdinput := CreateCmDbField('IDINPUT',ftfloat,True,True,False,False,'Id. Input');
end;

procedure TDbSimulaBenefXInput.SetIdinput(const Value: TCmDbField);
begin
  FIdinput := Value;
end;

procedure TDbSimulaBenefXInput.SetIdsimulabenef(const Value: TCmDbField);
begin
  FIdsimulabenef := Value;
end;

procedure TDbSimulaBenefXInput.SetOrdem(const Value: TCmDbField);
begin
  FOrdem := Value;
end;

end.



