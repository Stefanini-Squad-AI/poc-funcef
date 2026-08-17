{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 28/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbRubricaxinforme;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbRubricaxinforme = class(TCmDbObject)

  private
    FIdinforme: TCmDbField;
    FIdrubricaprin: TCmDbField;
    FPrioridade: TCmDbField;
    FIdrubrica: TCmDbField;
    procedure SetIdinforme(const Value: TCmDbField);
    procedure SetIdrubrica(const Value: TCmDbField);
    procedure SetIdrubricaprin(const Value: TCmDbField);
    procedure SetPrioridade(const Value: TCmDbField);

  public

     Property Prioridade: TCmDbField read FPrioridade write SetPrioridade;
     Property Idrubricaprin: TCmDbField read FIdrubricaprin write SetIdrubricaprin;
     Property Idrubrica: TCmDbField read FIdrubrica write SetIdrubrica;
     Property Idinforme: TCmDbField read FIdinforme write SetIdinforme;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbRubricaxinforme }

constructor TDbRubricaxinforme.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RUBRICAXINFORME';

   fPrioridade := CreateCmDbField('PRIORIDADE',ftfloat,False,False,False,True,'');
   fIdrubricaprin := CreateCmDbField('IDRUBRICAPRIN',ftfloat,True,True,False,True,'');
   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,True,True,False,True,'');
   fIdinforme := CreateCmDbField('IDINFORME',ftfloat,False,False,False,True,'');
end;

function TDbRubricaxinforme.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbRubricaxinforme.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbRubricaxinforme.SetIdinforme(const Value: TCmDbField);
begin
  FIdinforme := Value;
end;

procedure TDbRubricaxinforme.SetIdrubrica(const Value: TCmDbField);
begin
  FIdrubrica := Value;
end;

procedure TDbRubricaxinforme.SetIdrubricaprin(const Value: TCmDbField);
begin
  FIdrubricaprin := Value;
end;

procedure TDbRubricaxinforme.SetPrioridade(const Value: TCmDbField);
begin
  FPrioridade := Value;
end;

end.



