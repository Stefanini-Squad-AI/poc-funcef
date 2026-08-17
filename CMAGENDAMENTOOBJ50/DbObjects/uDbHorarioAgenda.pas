{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/11/2005                             }
{                                                       }
{*******************************************************}

unit uDbHorarioAgenda;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHorarioAgenda = class(TCmDbObject)

  private
    FHorario: TCmDbField;
    FIdhorarioatende: TCmDbField;
    FIdperiodoagenda: TCmDbField;
    procedure SetHorario(const Value: TCmDbField);
    procedure SetIdhorarioatende(const Value: TCmDbField);
    procedure SetIdperiodoagenda(const Value: TCmDbField);

  public

     Property Idperiodoagenda: TCmDbField read FIdperiodoagenda write SetIdperiodoagenda;
     Property Idhorarioatende: TCmDbField read FIdhorarioatende write SetIdhorarioatende;
     Property Horario: TCmDbField read FHorario write SetHorario;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHorarioAgenda }

constructor TDbHorarioAgenda.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HORARIOAGENDA';

   fIdperiodoagenda := CreateCmDbField('IDPERIODOAGENDA',ftfloat,False,False,False,True,'Id. Período');
   fIdhorarioatende := CreateCmDbField('IDHORARIOATENDE',ftfloat,True,True,False,True,'Id. Horário');
   fHorario := CreateCmDbField('HORARIO',ftString,True,False,False,True,'Horário');
end;

function TDbHorarioAgenda.Insert: Boolean;
begin

   fIdhorarioatende.AsFloat := GetSequence('HORARIOAGENDA');
   Result := Inherited Insert;

end;


procedure TDbHorarioAgenda.SetHorario(const Value: TCmDbField);
begin
  FHorario := Value;
end;

procedure TDbHorarioAgenda.SetIdhorarioatende(const Value: TCmDbField);
begin
  FIdhorarioatende := Value;
end;

procedure TDbHorarioAgenda.SetIdperiodoagenda(const Value: TCmDbField);
begin
  FIdperiodoagenda := Value;
end;

end.



