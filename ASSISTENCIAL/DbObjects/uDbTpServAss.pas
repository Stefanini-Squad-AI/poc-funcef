{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbTpServAss;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbTpServAss = class(TCmDbObject)

  private
     fNome: TCmDbField;
     fIdTpServAss: TCmDbField;
     fDescricao: TCmDbField;
     fPercIOF: TCmDbField;
     fPercProLabore: TCmDbField;

     procedure SetNome(const Value: TCmDbField);
     procedure SetIdTpServAss(const Value: TCmDbField);
     procedure SetDescricao(const Value: TCmDbField);
     procedure SetPercIOF(const Value: TCmDbField);
     procedure SetPercProLabore(const Value: TCmDbField);

  public
     Property Nome: TCmDbField read FNome write SetNome;
     Property IdTpServAss: TCmDbField read FIdTpServAss write SetIdTpServAss;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property PercIOF: TCmDbField read FPercIOF write SetPercIOF;
     Property PercProLabore: TCmDbField read FPercProLabore write SetPercProLabore;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTpServAss }

constructor TDbTpServAss.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TpServAss';

  fNome := CreateCmDbField('NOME',ftString,False,False);
  fIdTpServAss := CreateCmDbField('IDTpServAss',ftfloat,False,True);
  fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False);
  fPercIOF   := CreateCmDbField('PERCIOF',ftfloat,True,False);
  fPercProLabore:= CreateCmDbField('PERCPROLABORE',ftfloat,True,False);
end;

function TDbTpServAss.Insert: Boolean;
begin
  fIdTpServAss.AsFloat := GetSequence(TableName);
  Result := Inherited Insert;
end;

function TDbTpServAss.LoadFromDB: Boolean;
begin
  Result := True;
end;

procedure TDbTpServAss.SetIdTpServAss(const Value: TCmDbField);
begin
  FIdTpServAss:=Value;
end;

procedure TDbTpServAss.SetNome(const Value: TCmDbField);
begin
  FNome:=Value;
end;

procedure TDbTpServAss.SetDescricao(const Value: TCmDbField);
begin
  FDescricao:=Value;
end;

procedure TDbTpServAss.SetPercIOF(const Value: TCmDbField);
begin
  FPercIOF:=Value;
end;

procedure TDbTpServAss.SetPercProLabore(const Value: TCmDbField);
begin
  FPercProLabore:=Value;
end;

end.
