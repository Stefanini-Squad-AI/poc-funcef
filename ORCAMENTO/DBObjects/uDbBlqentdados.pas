{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Rodolpho da Silva               }
{ Atualizado Em: 02/08/2007                             }
{                                                       }
{*******************************************************}

unit uDbBlqentdados;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbBlqentdados = class(TCmDbObject)

  private
    FExercicio: TCmDbField;
    FPeriodo: TCmDbField;
    FIdblqentdados: TCmDbField;
    procedure SetExercicio(const Value: TCmDbField);
    procedure SetIdblqentdados(const Value: TCmDbField);
    procedure SetPeriodo(const Value: TCmDbField);

  public

     Property Periodo: TCmDbField read FPeriodo write SetPeriodo;
     Property Idblqentdados: TCmDbField read FIdblqentdados write SetIdblqentdados;
     Property Exercicio: TCmDbField read FExercicio write SetExercicio;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbBlqentdados }

constructor TDbBlqentdados.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BLQENTDADOS';

   fPeriodo := CreateCmDbField('PERIODO',ftfloat,False,False,False,True,'');
   fIdblqentdados := CreateCmDbField('IDBLQENTDADOS',ftfloat,True,True,False,True,'');
   fExercicio := CreateCmDbField('EXERCICIO',ftfloat,False,False,False,True,'');
end;

function TDbBlqentdados.Insert: Boolean;
begin

   fIdblqentdados.AsFloat := GetSequence('BLQENTDADOS');
   Result := Inherited Insert;

end;


procedure TDbBlqentdados.SetExercicio(const Value: TCmDbField);
begin
  FExercicio := Value;
end;

procedure TDbBlqentdados.SetIdblqentdados(const Value: TCmDbField);
begin
  FIdblqentdados := Value;
end;

procedure TDbBlqentdados.SetPeriodo(const Value: TCmDbField);
begin
  FPeriodo := Value;
end;

end.



