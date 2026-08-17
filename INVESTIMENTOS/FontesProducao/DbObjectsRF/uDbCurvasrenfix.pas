{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 29/12/2005                             }
{                                                       }
{*******************************************************}

unit uDbCurvasrenfix;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCurvasrenfix = class(TCmDbObject)

  private
    FIdcurvarenfix: TCmDbField;
    FDesccurvarenfix: TCmDbField;
    procedure SetDesccurvarenfix(const Value: TCmDbField);
    procedure SetIdcurvarenfix(const Value: TCmDbField);

  public

     Property Idcurvarenfix: TCmDbField read FIdcurvarenfix write SetIdcurvarenfix;
     Property Desccurvarenfix: TCmDbField read FDesccurvarenfix write SetDesccurvarenfix;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCurvasrenfix }

constructor TDbCurvasrenfix.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CURVASRENFIX';

   fIdcurvarenfix := CreateCmDbField('IDCURVARENFIX',ftfloat,True,True,False,True,'Perfil de Renda Fixa');
   fDesccurvarenfix := CreateCmDbField('DESCCURVARENFIX',ftString,False,False,False,True,'');
end;

function TDbCurvasrenfix.Insert: Boolean;
begin

   fIdcurvarenfix.AsFloat := GetSequence('CURVASRENFIX');
   Result := Inherited Insert;

end;


procedure TDbCurvasrenfix.SetDesccurvarenfix(const Value: TCmDbField);
begin
  FDesccurvarenfix := Value;
end;

procedure TDbCurvasrenfix.SetIdcurvarenfix(const Value: TCmDbField);
begin
  FIdcurvarenfix := Value;
end;

end.



