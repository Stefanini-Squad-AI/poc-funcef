{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 43337
 Data........: 10/03/2022
 Responsável.: Everson Cunha
 Descrição...: Desenvolvimento da DB
--------------------------------------------------------------------------------}

unit uDbCertificadoPessoa;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCertificadoPessoa = class(TCmDbObject)

  private
    FId: TCmDbField;
    FIdCertificado: TCmDbField;
    FIdPessoa: TCmDbField;
    FDtInicio: TCmDbField;
    FDtValidade: TCmDbField;
    FFlgHabilitacao: TCmDbField;
    FNumHabilitacao: TCmDbField;
    FDtValidadeHabilitacao: TCmDbField;
    FStatusHabilitacao: TCmDbField;

    procedure SetId(const Value: TCmDbField);
    procedure SetIdCertificado(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetDtInicio(const Value: TCmDbField);
    procedure SetDtValidade(const Value: TCmDbField);
    procedure SetFlgHabilitacao(const Value: TCmDbField);
    procedure SetNumHabilitacao(const Value: TCmDbField);
    procedure SetDtValidadeHabilitacao(const Value: TCmDbField);
    procedure SetStatusHabilitacao(const Value: TCmDbField);

  public
    Property Id : TCmDbField read FId write SetId;
    Property IdCertificado : TCmDbField read FIdCertificado write SetIdCertificado;
    Property IdPessoa : TCmDbField read FIdPessoa write SetIdPessoa;
    Property DtInicio : TCmDbField read FDtInicio write SetDtInicio;
    Property DtValidade : TCmDbField read FDtValidade write SetDtValidade;
    Property FlgHabilitacao : TCmDbField read FFlgHabilitacao write SetFlgHabilitacao;
    Property NumHabilitacao : TCmDbField read FNumHabilitacao write SetNumHabilitacao;
    Property DtValidadeHabilitacao : TCmDbField read FDtValidadeHabilitacao write SetDtValidadeHabilitacao;
    Property StatusHabilitacao : TCmDbField read FStatusHabilitacao write SetStatusHabilitacao;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCertificadoPessoa }

constructor TDbCertificadoPessoa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CERTIFICADO_PESSOA';

  FId             := CreateCmDbField('ID',              ftfloat,    True,  True,  False, True, '');
  FIdCertificado  := CreateCmDbField('IDCERTIFICADO',   ftfloat,    True,  False, False, True, '');
  FIdPessoa       := CreateCmDbField('IDPESSOA',        ftfloat,    True,  False, False, True, '');
  FDtInicio       := CreateCmDbField('DT_INICIO',       ftDateTime, False, False, False, True, '');
  FDtValidade     := CreateCmDbField('DT_VALIDADE',     ftDateTime, False, False, False, True, '');
  FFlgHabilitacao := CreateCmDbField('FLGHABILITACAO',  ftString,   False, False, False, True, '');
  FNumHabilitacao := CreateCmDbField('NUM_HABILITACAO', ftString,   False, False, False, True, '');
  FDtValidadeHabilitacao := CreateCmDbField('DT_VALIDADE_HABILITACAO', ftDateTime, False, False, False, True, '');
  FStatusHabilitacao     := CreateCmDbField('STATUS_HABILITACAO',      ftInteger,  False, False, False, True, '');
end;

function TDbCertificadoPessoa.Insert: Boolean;
begin
  FId.AsFloat := GetSequence('CERTIFICADO_PESSOA');
  Result := Inherited Insert;
end;

function TDbCertificadoPessoa.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbCertificadoPessoa.SetId(const Value: TCmDbField);
begin
  FId := Value;
end;

procedure TDbCertificadoPessoa.SetIdCertificado(const Value: TCmDbField);
begin
  FIdCertificado := Value;
end; 

procedure TDbCertificadoPessoa.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;  

procedure TDbCertificadoPessoa.SetDtInicio(const Value: TCmDbField);
begin
  FDtInicio := Value;
end;

procedure TDbCertificadoPessoa.SetDtValidade(const Value: TCmDbField);
begin
  FDtValidade := Value;
end;       

procedure TDbCertificadoPessoa.SetFlgHabilitacao(const Value: TCmDbField);
begin
  FFlgHabilitacao := Value;
end; 

procedure TDbCertificadoPessoa.SetNumHabilitacao(const Value: TCmDbField);
begin
  FNumHabilitacao := Value;
end;

procedure TDbCertificadoPessoa.SetDtValidadeHabilitacao(
  const Value: TCmDbField);
begin
  FDtValidadeHabilitacao := Value;
end;

procedure TDbCertificadoPessoa.SetStatusHabilitacao(
  const Value: TCmDbField);
begin
  FStatusHabilitacao := Value;
end;

end.
