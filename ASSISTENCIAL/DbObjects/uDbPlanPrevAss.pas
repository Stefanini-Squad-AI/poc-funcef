{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbPlanPrevAss;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbPlanPrevAss = class(TCmDbObject)

  private
     fNome: TCmDbField;
     fIdPlanPrevAss: TCmDbField;
     fDescricao: TCmDbField;
     fPercIOF: TCmDbField;
     fPercProLabore: TCmDbField;

     procedure SetNome(const Value: TCmDbField);
     procedure SetIdPlanPrevAss(const Value: TCmDbField);
     procedure SetDescricao(const Value: TCmDbField);
     procedure SetPercIOF(const Value: TCmDbField);
     procedure SetPercProLabore(const Value: TCmDbField);

  public
     Property Nome: TCmDbField read FNome write SetNome;
     Property IdPlanPrevAss: TCmDbField read FIdPlanPrevAss write SetIdPlanPrevAss;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property PercIOF: TCmDbField read FPercIOF write SetPercIOF;
     Property PercProLabore: TCmDbField read FPercProLabore write SetPercProLabore;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPlanPrevAss }

constructor TDbPlanPrevAss.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PlanPrevAss';

  fNome := CreateCmDbField('NOME',ftString,False,False);
  fIdPlanPrevAss := CreateCmDbField('IDPlanPrevAss',ftfloat,False,True);
  fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False);
  fPercIOF   := CreateCmDbField('PERCIOF',ftfloat,True,False);
  fPercProLabore:= CreateCmDbField('PERCPROLABORE',ftfloat,True,False);
end;

function TDbPlanPrevAss.Insert: Boolean;
begin
  fIdPlanPrevAss.AsFloat := GetSequence(TableName);
  Result := Inherited Insert;
end;

function TDbPlanPrevAss.LoadFromDB: Boolean;
begin
  Result := True;
end;

procedure TDbPlanPrevAss.SetIdPlanPrevAss(const Value: TCmDbField);
begin
  FIdPlanPrevAss:=Value;
end;

procedure TDbPlanPrevAss.SetNome(const Value: TCmDbField);
begin
  FNome:=Value;
end;

procedure TDbPlanPrevAss.SetDescricao(const Value: TCmDbField);
begin
  FDescricao:=Value;
end;

procedure TDbPlanPrevAss.SetPercIOF(const Value: TCmDbField);
begin
  FPercIOF:=Value;
end;

procedure TDbPlanPrevAss.SetPercProLabore(const Value: TCmDbField);
begin
  FPercProLabore:=Value;
end;

end.
