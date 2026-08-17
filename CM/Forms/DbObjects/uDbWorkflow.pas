{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbWorkflow;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbWorkflow = class(TCmDbObject)

  private
    FIdmodulo: TCmDbField;
    FIdworkflow: TCmDbField;
    FDescworkflow: TCmDbField;
    procedure SetDescworkflow(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdworkflow(const Value: TCmDbField);

  public

     Property Idworkflow: TCmDbField read FIdworkflow write SetIdworkflow;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Descworkflow: TCmDbField read FDescworkflow write SetDescworkflow;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbWorkflow }

constructor TDbWorkflow.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WORKFLOW';

   fIdworkflow := CreateCmDbField('IDWORKFLOW',ftfloat,True,True,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,False,False,True,'');
   fDescworkflow := CreateCmDbField('DESCWORKFLOW',ftString,False,False,False,True,'');
end;

function TDbWorkflow.Insert: Boolean;
begin

   fIdworkflow.AsFloat := GetSequence('WORKFLOW');
   Result := Inherited Insert;

end;

function TDbWorkflow.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbWorkflow.SetDescworkflow(const Value: TCmDbField);
begin
  FDescworkflow := Value;
end;

procedure TDbWorkflow.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbWorkflow.SetIdworkflow(const Value: TCmDbField);
begin
  FIdworkflow := Value;
end;

end.



