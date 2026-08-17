{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 43337
 Data........: 10/03/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da DB
--------------------------------------------------------------------------------}

unit uDbCertificado;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCertificado = class(TCmDbObject)

  private

    FIdCertificado: TCmDbField;
    FDescricao: TCmDbField;
    FSigla: TCmDbField;

    procedure SetIdCertificado(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetSigla(const Value: TCmDbField);

  public
    Property IdCertificado : TCmDbField read FIdCertificado write SetIdCertificado;
    Property Descricao : TCmDbField read FDescricao write SetDescricao;
    Property Sigla : TCmDbField read FSigla write SetSigla;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCertificado }

constructor TDbCertificado.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CERTIFICADO';

  FIdCertificado := CreateCmDbField('IDCERTIFICADO', ftfloat,  True,  True,  False, True, 'Id');
  FDescricao     := CreateCmDbField('DESCRICAO',     ftString, False, False, False, True, 'Descricao');
  FSigla         := CreateCmDbField('SIGLA',         ftString, False, False, False, True, 'Sigla');
end;

function TDbCertificado.Insert: Boolean;
begin
  FIdCertificado.AsFloat := GetSequence('CERTIFICADO');
  Result := Inherited Insert;
end;

function TDbCertificado.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbCertificado.SetIdCertificado(const Value: TCmDbField);
begin
  FIdCertificado := Value;
end;

procedure TDbCertificado.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbCertificado.SetSigla(const Value: TCmDbField);
begin
  FSigla := Value;
end;

end.
