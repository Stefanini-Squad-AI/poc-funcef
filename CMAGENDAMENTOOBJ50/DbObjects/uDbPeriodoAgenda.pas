{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/11/2005                             }
{                                                       }
{*******************************************************}

unit uDbPeriodoAgenda;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPeriodoAgenda = class(TCmDbObject)

  private
    FDatafim: TCmDbField;
    FIdperiodoagenda: TCmDbField;
    FIdgrupoatende: TCmDbField;
    FDatainicio: TCmDbField;
    procedure SetDatafim(const Value: TCmDbField);
    procedure SetDatainicio(const Value: TCmDbField);
    procedure SetIdgrupoatende(const Value: TCmDbField);
    procedure SetIdperiodoagenda(const Value: TCmDbField);

  public

     Property Idperiodoagenda: TCmDbField read FIdperiodoagenda write SetIdperiodoagenda;
     Property Idgrupoatende: TCmDbField read FIdgrupoatende write SetIdgrupoatende;
     Property Datainicio: TCmDbField read FDatainicio write SetDatainicio;
     Property Datafim: TCmDbField read FDatafim write SetDatafim;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPeriodoAgenda }

constructor TDbPeriodoAgenda.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PERIODOAGENDA';

   fIdperiodoagenda := CreateCmDbField('IDPERIODOAGENDA',ftfloat,True,True,False,True,'Id. Período');
   fIdgrupoatende := CreateCmDbField('IDGRUPOATENDE',ftfloat,True,False,False,True,'Id. Grupo de Atendentes');
   fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,True,False,False,True,'Data Inicial');
   fDatafim := CreateCmDbField('DATAFIM',ftDateTime,True,False,False,True,'Data Final');
end;

function TDbPeriodoAgenda.Insert: Boolean;
begin

   fIdperiodoagenda.AsFloat := GetSequence('PERIODOAGENDA');
   Result := Inherited Insert;

end;


procedure TDbPeriodoAgenda.SetDatafim(const Value: TCmDbField);
begin
  FDatafim := Value;
end;

procedure TDbPeriodoAgenda.SetDatainicio(const Value: TCmDbField);
begin
  FDatainicio := Value;
end;

procedure TDbPeriodoAgenda.SetIdgrupoatende(const Value: TCmDbField);
begin
  FIdgrupoatende := Value;
end;

procedure TDbPeriodoAgenda.SetIdperiodoagenda(const Value: TCmDbField);
begin
  FIdperiodoagenda := Value;
end;

end.



