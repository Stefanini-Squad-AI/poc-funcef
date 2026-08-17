{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbRadgrupoautoriza;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadgrupoautoriza = class(TCmDbObject)

  private
    FNomegrupoaut: TCmDbField;
    FIdgrupoautoriza: TCmDbField;
    procedure SetIdgrupoautoriza(const Value: TCmDbField);
    procedure SetNomegrupoaut(const Value: TCmDbField);

  public

     Property Nomegrupoaut: TCmDbField read FNomegrupoaut write SetNomegrupoaut;
     Property Idgrupoautoriza: TCmDbField read FIdgrupoautoriza write SetIdgrupoautoriza;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadgrupoautoriza }

constructor TDbRadgrupoautoriza.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADGRUPOAUTORIZA';

   fNomegrupoaut := CreateCmDbField('NOMEGRUPOAUT',ftString,False,False,False,True,'');
   fIdgrupoautoriza := CreateCmDbField('IDGRUPOAUTORIZA',ftfloat,True,True,False,True,'');
end;

function TDbRadgrupoautoriza.Insert: Boolean;
begin

   fIdgrupoautoriza.AsFloat := GetSequence('RADGRUPOAUTORIZACAO');
   Result := Inherited Insert;

end;


procedure TDbRadgrupoautoriza.SetIdgrupoautoriza(const Value: TCmDbField);
begin
  FIdgrupoautoriza := Value;
end;

procedure TDbRadgrupoautoriza.SetNomegrupoaut(const Value: TCmDbField);
begin
  FNomegrupoaut := Value;
end;

end.



