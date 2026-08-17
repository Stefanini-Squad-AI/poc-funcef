{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 20/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbFeriado;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbFeriado = class(TCmDbObject)

  private
    FDescferiado: TCmDbField;
    FFlgtipo: TCmDbField;
    FCodestado: TCmDbField;
    FFlgambito: TCmDbField;
    FIdestado: TCmDbField;
    FDataferiado: TCmDbField;
    FIdsindicato: TCmDbField;
    FIdpais: TCmDbField;
    FIdcidades: TCmDbField;
    FIdferiado: TCmDbField;
    procedure SetCodestado(const Value: TCmDbField);
    procedure SetDataferiado(const Value: TCmDbField);
    procedure SetDescferiado(const Value: TCmDbField);
    procedure SetFlgambito(const Value: TCmDbField);
    procedure SetFlgtipo(const Value: TCmDbField);
    procedure SetIdcidades(const Value: TCmDbField);
    procedure SetIdestado(const Value: TCmDbField);
    procedure SetIdferiado(const Value: TCmDbField);
    procedure SetIdpais(const Value: TCmDbField);
    procedure SetIdsindicato(const Value: TCmDbField);

  public
    Property Idsindicato: TCmDbField read FIdsindicato write SetIdsindicato;
    Property Idpais: TCmDbField read FIdpais write SetIdpais;
    Property Idferiado: TCmDbField read FIdferiado write SetIdferiado;
    Property Idestado: TCmDbField read FIdestado write SetIdestado;
    Property Idcidades: TCmDbField read FIdcidades write SetIdcidades;
    Property Flgtipo: TCmDbField read FFlgtipo write SetFlgtipo;
    Property Flgambito: TCmDbField read FFlgambito write SetFlgambito;
    Property Descferiado: TCmDbField read FDescferiado write SetDescferiado;
    Property Dataferiado: TCmDbField read FDataferiado write SetDataferiado;
    Property Codestado: TCmDbField read FCodestado write SetCodestado;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

implementation

{ TDbFeriado }

constructor TDbFeriado.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FERIADOS';

  fIdferiado   := CreateCmDbField('IDFERIADO',ftfloat,True,True,False,True,'Código');
  fDataferiado := CreateCmDbField('DATAFERIADO',ftDateTime,True,False,False,True,'Data');
  fIdsindicato := CreateCmDbField('IDSINDICATO',ftfloat,False,False,False,True,'Sindicato');
  fIdpais      := CreateCmDbField('IDPAIS',ftfloat,False,False,False,True,'País');
  fIdestado    := CreateCmDbField('IDESTADO',ftfloat,False,False,False,True,'Estado');
  fIdcidades   := CreateCmDbField('IDCIDADES',ftfloat,False,False,False,True,'Cidade');
  fFlgtipo     := CreateCmDbField('FLGTIPO',ftString,False,False,False,True,'Tipo');
  fFlgambito   := CreateCmDbField('FLGAMBITO',ftString,False,False,False,True,'Âmbito');
  fDescferiado := CreateCmDbField('DESCFERIADO',ftString,False,False,False,True,'Descrição');
  fCodestado   := CreateCmDbField('CODESTADO',ftString,False,False,False,True,'Sigla Estado');
end;

function TDbFeriado.Insert: Boolean;
begin
  fIdferiado.AsFloat := GetSequence('FERIADOS');
  Result := Inherited Insert;
end;

function TDbFeriado.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbFeriado.SetCodestado(const Value: TCmDbField);
begin
  FCodestado := Value;
end;

procedure TDbFeriado.SetDataferiado(const Value: TCmDbField);
begin
  FDataferiado := Value;
end;

procedure TDbFeriado.SetDescferiado(const Value: TCmDbField);
begin
  FDescferiado := Value;
end;

procedure TDbFeriado.SetFlgambito(const Value: TCmDbField);
begin
  FFlgambito := Value;
end;

procedure TDbFeriado.SetFlgtipo(const Value: TCmDbField);
begin
  FFlgtipo := Value;
end;

procedure TDbFeriado.SetIdcidades(const Value: TCmDbField);
begin
  FIdcidades := Value;
end;

procedure TDbFeriado.SetIdestado(const Value: TCmDbField);
begin
  FIdestado := Value;
end;

procedure TDbFeriado.SetIdferiado(const Value: TCmDbField);
begin
  FIdferiado := Value;
end;

procedure TDbFeriado.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDbFeriado.SetIdsindicato(const Value: TCmDbField);
begin
  FIdsindicato := Value;
end;

end.

