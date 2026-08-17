{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/10/2006                             }
{                                                       }
{*******************************************************}

unit uDbDescdivergorc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDescdivergorc = class(TCmDbObject)

  private
    FIdcontaorcamen: TCmDbField;
    FExercicio: TCmDbField;
    FIddescdivergorc: TCmDbField;
    FDescricao: TCmDbField;
    FIdplanoorcamen: TCmDbField;
    FPeriodo: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetExercicio(const Value: TCmDbField);
    procedure SetIdcontaorcamen(const Value: TCmDbField);
    procedure SetIddescdivergorc(const Value: TCmDbField);
    procedure SetIdplanoorcamen(const Value: TCmDbField);
    procedure SetPeriodo(const Value: TCmDbField);

  public

     Property Periodo: TCmDbField read FPeriodo write SetPeriodo;
     Property Idplanoorcamen: TCmDbField read FIdplanoorcamen write SetIdplanoorcamen;
     Property Iddescdivergorc: TCmDbField read FIddescdivergorc write SetIddescdivergorc;
     Property Idcontaorcamen: TCmDbField read FIdcontaorcamen write SetIdcontaorcamen;
     Property Exercicio: TCmDbField read FExercicio write SetExercicio;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbDescdivergorc }

constructor TDbDescdivergorc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DESCDIVERGORC';

   fPeriodo := CreateCmDbField('PERIODO',ftfloat,False,False,False,True,'');
   fIdplanoorcamen := CreateCmDbField('IDPLANOORCAMEN',ftfloat,False,False,False,True,'');
   fIddescdivergorc := CreateCmDbField('IDDESCDIVERGORC',ftfloat,True,True,False,True,'');
   fIdcontaorcamen := CreateCmDbField('IDCONTAORCAMEN',ftString,False,False,False,True,'');
   fExercicio := CreateCmDbField('EXERCICIO',ftfloat,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbDescdivergorc.Insert: Boolean;
begin
   fIddescdivergorc.AsFloat := GetSequence('DESCDIVERGORC');
   Result := Inherited Insert;

end;


procedure TDbDescdivergorc.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbDescdivergorc.SetExercicio(const Value: TCmDbField);
begin
  FExercicio := Value;
end;

procedure TDbDescdivergorc.SetIdcontaorcamen(const Value: TCmDbField);
begin
  FIdcontaorcamen := Value;
end;

procedure TDbDescdivergorc.SetIddescdivergorc(const Value: TCmDbField);
begin
  FIddescdivergorc := Value;
end;

procedure TDbDescdivergorc.SetIdplanoorcamen(const Value: TCmDbField);
begin
  FIdplanoorcamen := Value;
end;

procedure TDbDescdivergorc.SetPeriodo(const Value: TCmDbField);
begin
  FPeriodo := Value;
end;

end.



