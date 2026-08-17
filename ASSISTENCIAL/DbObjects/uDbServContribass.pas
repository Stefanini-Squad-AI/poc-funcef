{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbServContribass;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbServContribass = class(TCmDbObject)

  private
     fNome: TCmDbField;
     fIdServContribass: TCmDbField;
     fDescricao: TCmDbField;
     fPercIOF: TCmDbField;
     fPercProLabore: TCmDbField;

     procedure SetNome(const Value: TCmDbField);
     procedure SetIdServContribass(const Value: TCmDbField);
     procedure SetDescricao(const Value: TCmDbField);
     procedure SetPercIOF(const Value: TCmDbField);
     procedure SetPercProLabore(const Value: TCmDbField);

  public
     Property Nome: TCmDbField read FNome write SetNome;
     Property IdServContribass: TCmDbField read FIdServContribass write SetIdServContribass;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property PercIOF: TCmDbField read FPercIOF write SetPercIOF;
     Property PercProLabore: TCmDbField read FPercProLabore write SetPercProLabore;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbServContribass }

constructor TDbServContribass.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ServContribass';

  fNome := CreateCmDbField('NOME',ftString,False,False);
  fIdServContribass := CreateCmDbField('IDServContribass',ftfloat,False,True);
  fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False);
  fPercIOF   := CreateCmDbField('PERCIOF',ftfloat,True,False);
  fPercProLabore:= CreateCmDbField('PERCPROLABORE',ftfloat,True,False);
end;

function TDbServContribass.Insert: Boolean;
begin
  fIdServContribass.AsFloat := GetSequence(TableName);
  Result := Inherited Insert;
end;

function TDbServContribass.LoadFromDB: Boolean;
begin
  Result := True;
end;

procedure TDbServContribass.SetIdServContribass(const Value: TCmDbField);
begin
  FIdServContribass:=Value;
end;

procedure TDbServContribass.SetNome(const Value: TCmDbField);
begin
  FNome:=Value;
end;

procedure TDbServContribass.SetDescricao(const Value: TCmDbField);
begin
  FDescricao:=Value;
end;

procedure TDbServContribass.SetPercIOF(const Value: TCmDbField);
begin
  FPercIOF:=Value;
end;

procedure TDbServContribass.SetPercProLabore(const Value: TCmDbField);
begin
  FPercProLabore:=Value;
end;

end.
