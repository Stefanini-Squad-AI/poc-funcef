{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbProdass;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbProdass = class(TCmDbObject)

  private
     fNome: TCmDbField;
     fIdprodass: TCmDbField;
     fDescricao: TCmDbField;
     fPercIOF: TCmDbField;
     fPercProLabore: TCmDbField;

     procedure SetNome(const Value: TCmDbField);
     procedure SetIdProdass(const Value: TCmDbField);
     procedure SetDescricao(const Value: TCmDbField);
     procedure SetPercIOF(const Value: TCmDbField);
     procedure SetPercProLabore(const Value: TCmDbField);

  public
     Property Nome: TCmDbField read FNome write SetNome;
     Property IdProdass: TCmDbField read FIdProdass write SetIdProdass;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property PercIOF: TCmDbField read FPercIOF write SetPercIOF;
     Property PercProLabore: TCmDbField read FPercProLabore write SetPercProLabore;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbProdass }

constructor TDbProdass.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PRODASS';

  fNome := CreateCmDbField('NOME',ftString,False,False);
  fIdprodass := CreateCmDbField('IDPRODASS',ftfloat,False,True);
  fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False);
  fPercIOF   := CreateCmDbField('PERCIOF',ftfloat,True,False);
  fPercProLabore:= CreateCmDbField('PERCPROLABORE',ftfloat,True,False);
end;

function TDbProdass.Insert: Boolean;
begin
  fIdprodass.AsFloat := GetSequence(TableName);
  Result := Inherited Insert;
end;

function TDbProdass.LoadFromDB: Boolean;
begin
  Result := True;
end;

procedure TDbProdass.SetIdProdass(const Value: TCmDbField);
begin
  FIdProdass:=Value;
end;

procedure TDbProdass.SetNome(const Value: TCmDbField);
begin
  FNome:=Value;
end;

procedure TDbProdass.SetDescricao(const Value: TCmDbField);
begin
  FDescricao:=Value;
end;

procedure TDbProdass.SetPercIOF(const Value: TCmDbField);
begin
  FPercIOF:=Value;
end;

procedure TDbProdass.SetPercProLabore(const Value: TCmDbField);
begin
  FPercProLabore:=Value;
end;

end.
