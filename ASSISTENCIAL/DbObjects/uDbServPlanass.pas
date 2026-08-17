{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbServPlanass;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbServPlanass = class(TCmDbObject)

  private
     fNome: TCmDbField;
     fIdServPlanass: TCmDbField;
     fDescricao: TCmDbField;
     fPercIOF: TCmDbField;
     fPercProLabore: TCmDbField;

     procedure SetNome(const Value: TCmDbField);
     procedure SetIdServPlanass(const Value: TCmDbField);
     procedure SetDescricao(const Value: TCmDbField);
     procedure SetPercIOF(const Value: TCmDbField);
     procedure SetPercProLabore(const Value: TCmDbField);

  public
     Property Nome: TCmDbField read FNome write SetNome;
     Property IdServPlanass: TCmDbField read FIdServPlanass write SetIdServPlanass;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property PercIOF: TCmDbField read FPercIOF write SetPercIOF;
     Property PercProLabore: TCmDbField read FPercProLabore write SetPercProLabore;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbServPlanass }

constructor TDbServPlanass.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ServPlanass';

  fNome := CreateCmDbField('NOME',ftString,False,False);
  fIdServPlanass := CreateCmDbField('IDServPlanass',ftfloat,False,True);
  fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False);
  fPercIOF   := CreateCmDbField('PERCIOF',ftfloat,True,False);
  fPercProLabore:= CreateCmDbField('PERCPROLABORE',ftfloat,True,False);
end;

function TDbServPlanass.Insert: Boolean;
begin
  fIdServPlanass.AsFloat := GetSequence(TableName);
  Result := Inherited Insert;
end;

function TDbServPlanass.LoadFromDB: Boolean;
begin
  Result := True;
end;

procedure TDbServPlanass.SetIdServPlanass(const Value: TCmDbField);
begin
  FIdServPlanass:=Value;
end;

procedure TDbServPlanass.SetNome(const Value: TCmDbField);
begin
  FNome:=Value;
end;

procedure TDbServPlanass.SetDescricao(const Value: TCmDbField);
begin
  FDescricao:=Value;
end;

procedure TDbServPlanass.SetPercIOF(const Value: TCmDbField);
begin
  FPercIOF:=Value;
end;

procedure TDbServPlanass.SetPercProLabore(const Value: TCmDbField);
begin
  FPercProLabore:=Value;
end;

end.
