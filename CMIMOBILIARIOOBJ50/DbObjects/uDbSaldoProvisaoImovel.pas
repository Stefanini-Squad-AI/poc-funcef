//--------------------------------------------------------------------------------
//Nº SIG......: 113136 
//Data........: 04/07/2022
//Responsável.: Cássio Florencio Rovaroto
//Descrição...: Implementação da provisão de custos de imóveis.
//--------------------------------------------------------------------------------
unit uDbSaldoProvisaoImovel;

interface
uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

Type
  TDbSaldoProvisaoImovel = class(TCmDbObject)

  private
    FDataProvisao: TCmDbField;
    FIdPlanoPrev: TCmDbField;
    FValorVariacao: TCmDbField;
    FValor: TCmDbField;
    FIdSaldoProvisaoImovel: TCmDbField;
    FIdBem: TCmDbField;
    FIdProvisaoImovel: TCmDbField;
    FIdMovimentacao: TCmDbField;
    FCodTipImovel: TCmDbField;
    FIdPatro: TCmDbField;
    procedure SetCodTipImovel(const Value: TCmDbField);
    procedure SetDataProvisao(const Value: TCmDbField);
    procedure SetIdBem(const Value: TCmDbField);
    procedure SetIdMovimentacao(const Value: TCmDbField);
    procedure SetIdPatro(const Value: TCmDbField);
    procedure SetIdPlanoPrev(const Value: TCmDbField);
    procedure SetIdProvisaoImovel(const Value: TCmDbField);
    procedure SetIdSaldoProvisaoImovel(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);
    procedure SetValorVariacao(const Value: TCmDbField);

  public
    property IdSaldoProvisaoImovel: TCmDbField read FIdSaldoProvisaoImovel write SetIdSaldoProvisaoImovel;
    property IdProvisaoImovel: TCmDbField read FIdProvisaoImovel write SetIdProvisaoImovel;
    property IdBem: TCmDbField read FIdBem write SetIdBem;
    property IdMovimentacao: TCmDbField read FIdMovimentacao write SetIdMovimentacao;
    property CodTipImovel: TCmDbField read FCodTipImovel write SetCodTipImovel;
    property DataProvisao: TCmDbField read FDataProvisao write SetDataProvisao;
    property IdPatro: TCmDbField read FIdPatro write SetIdPatro;
    property IdPlanoPrev: TCmDbField read FIdPlanoPrev write SetIdPlanoPrev;
    property Valor: TCmDbField read FValor write SetValor;
    property ValorVariacao: TCmDbField read FValorVariacao write SetValorVariacao;

    constructor Create(Aowner: TCmCustomCdbObject); override;

    function Insert :Boolean; override;
    function LoadFromDb :Boolean; override;
  end;

implementation

{ TDbSaldoProvisaoImovel }

constructor TDbSaldoProvisaoImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SALDOPROVISAOIMOVEL';

  FIdSaldoProvisaoImovel := CreateCmDbField('IDSALDOPROVISAOIMOVEL', ftFloat, True, True, False, False, '');
  FIdProvisaoImovel := CreateCmDbField('IDPROVISAOIMOVEL', ftFloat, True, False, False, False, '');
  FIdBem := CreateCmDbField('IDBEM', ftFloat, True, False, False, False, '');
  FIdMovimentacao := CreateCmDbField('IDMOVIMENTACAO', ftFloat, True, False, False, False, '');
  FCodTipImovel := CreateCmDbField('CODTIPIMOVEL', ftString, False, False, False, False, '');
  FDataProvisao := CreateCmDbField('DATAPROVISAO', ftDate, False, False, False, False, '');
  FIdPatro := CreateCmDbField('IDPATRO', ftFloat, False, False, False, False, '');
  FIdPlanoPrev := CreateCmDbField('IDPLANOPREV', ftFloat, False, False, False, False, '');
  FValor := CreateCmDbField('VALOR', ftFloat, False, False, False, False, '');
  FValorVariacao := CreateCmDbField('VALOR_VARIACAO', ftFloat, False, False, False, False, '');
  
end;

function TDbSaldoProvisaoImovel.Insert: Boolean;
begin
  FIdSaldoProvisaoImovel.AsFloat := GetSequence('SALDOPROVISAOIMOVEL');
  Result := Inherited Insert;
end;

function TDbSaldoProvisaoImovel.LoadFromDb: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbSaldoProvisaoImovel.SetCodTipImovel(const Value: TCmDbField);
begin
  FCodTipImovel := Value;
end;

procedure TDbSaldoProvisaoImovel.SetDataProvisao(const Value: TCmDbField);
begin
  FDataProvisao := Value;
end;

procedure TDbSaldoProvisaoImovel.SetIdBem(const Value: TCmDbField);
begin
  FIdBem := Value;
end;

procedure TDbSaldoProvisaoImovel.SetIdMovimentacao(
  const Value: TCmDbField);
begin
  FIdMovimentacao := Value;
end;

procedure TDbSaldoProvisaoImovel.SetIdPatro(const Value: TCmDbField);
begin
  FIdPatro := Value;
end;

procedure TDbSaldoProvisaoImovel.SetIdPlanoPrev(const Value: TCmDbField);
begin
  FIdPlanoPrev := Value;
end;

procedure TDbSaldoProvisaoImovel.SetIdProvisaoImovel(
  const Value: TCmDbField);
begin
  FIdProvisaoImovel := Value;
end;

procedure TDbSaldoProvisaoImovel.SetIdSaldoProvisaoImovel(
  const Value: TCmDbField);
begin
  FIdSaldoProvisaoImovel := Value;
end;

procedure TDbSaldoProvisaoImovel.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

procedure TDbSaldoProvisaoImovel.SetValorVariacao(const Value: TCmDbField);
begin
  FValorVariacao := Value;
end;

end.
