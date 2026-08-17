{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbPlanassTipoPart;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbPlanassTipoPart = class(TCmDbObject)

  private
     fNome: TCmDbField;
     fIdPlanassTipoPart: TCmDbField;
     fDescricao: TCmDbField;
     fPercIOF: TCmDbField;
     fPercProLabore: TCmDbField;

     procedure SetNome(const Value: TCmDbField);
     procedure SetIdPlanassTipoPart(const Value: TCmDbField);
     procedure SetDescricao(const Value: TCmDbField);
     procedure SetPercIOF(const Value: TCmDbField);
     procedure SetPercProLabore(const Value: TCmDbField);

  public
     Property Nome: TCmDbField read FNome write SetNome;
     Property IdPlanassTipoPart: TCmDbField read FIdPlanassTipoPart write SetIdPlanassTipoPart;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property PercIOF: TCmDbField read FPercIOF write SetPercIOF;
     Property PercProLabore: TCmDbField read FPercProLabore write SetPercProLabore;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPlanassTipoPart }

constructor TDbPlanassTipoPart.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PlanassTipoPart';

  fNome := CreateCmDbField('NOME',ftString,False,False);
  fIdPlanassTipoPart := CreateCmDbField('IDPlanassTipoPart',ftfloat,False,True);
  fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False);
  fPercIOF   := CreateCmDbField('PERCIOF',ftfloat,True,False);
  fPercProLabore:= CreateCmDbField('PERCPROLABORE',ftfloat,True,False);
end;

function TDbPlanassTipoPart.Insert: Boolean;
begin
  fIdPlanassTipoPart.AsFloat := GetSequence(TableName);
  Result := Inherited Insert;
end;

function TDbPlanassTipoPart.LoadFromDB: Boolean;
begin
  Result := True;
end;

procedure TDbPlanassTipoPart.SetIdPlanassTipoPart(const Value: TCmDbField);
begin
  FIdPlanassTipoPart:=Value;
end;

procedure TDbPlanassTipoPart.SetNome(const Value: TCmDbField);
begin
  FNome:=Value;
end;

procedure TDbPlanassTipoPart.SetDescricao(const Value: TCmDbField);
begin
  FDescricao:=Value;
end;

procedure TDbPlanassTipoPart.SetPercIOF(const Value: TCmDbField);
begin
  FPercIOF:=Value;
end;

procedure TDbPlanassTipoPart.SetPercProLabore(const Value: TCmDbField);
begin
  FPercProLabore:=Value;
end;

end.
