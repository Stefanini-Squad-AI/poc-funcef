{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/11/2005                             }
{                                                       }
{*******************************************************}

unit uDbAtendeAgenda;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbAtendeAgenda = class(TCmDbObject)

  private
    FIdgrupoatende: TCmDbField;
    FIdusuario: TCmDbField;
    FIdatendeagenda: TCmDbField;
    procedure SetIdatendeagenda(const Value: TCmDbField);
    procedure SetIdgrupoatende(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);

  public

     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idgrupoatende: TCmDbField read FIdgrupoatende write SetIdgrupoatende;
     Property Idatendeagenda: TCmDbField read FIdatendeagenda write SetIdatendeagenda;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAtendeAgenda }

constructor TDbAtendeAgenda.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ATENDEAGENDA';

   fIdatendeagenda := CreateCmDbField('IDATENDEAGENDA',ftfloat,True,True,False,True,'Id. Atendente');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,False,False,True,'Id. Usuário');
   fIdgrupoatende := CreateCmDbField('IDGRUPOATENDE',ftfloat,False,False,False,True,'Id. Grupo de Atendentes');
end;

function TDbAtendeAgenda.Insert: Boolean;
begin

   fIdatendeagenda.AsFloat := GetSequence('ATENDEAGENDA');
   Result := Inherited Insert;

end;


procedure TDbAtendeAgenda.SetIdatendeagenda(const Value: TCmDbField);
begin
  FIdatendeagenda := Value;
end;

procedure TDbAtendeAgenda.SetIdgrupoatende(const Value: TCmDbField);
begin
  FIdgrupoatende := Value;
end;

procedure TDbAtendeAgenda.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

end.



