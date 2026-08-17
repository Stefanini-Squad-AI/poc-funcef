{-------------------------------------------------------------------------------
-----------------------ALTERAÇÕES / IMPLEMENTAÇÕES -----------------------------
--------------------------------------------------------------------------------
 Atendimento.....: WO7471
 Data............: 31/01/2024
 Responsável.....: Arnaldo V. Scarin
 Descrição.......: Criação da Db
--------------------------------------------------------------------------------}

unit uDbContratoAreaTecnica;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbContratoAreaTecnica = class(TCmDbObject)
  private
    FCodCentroCusto: TCmDbField;
    FIdContrato: TCmDbField;
    FIdEmpresa: TCmDbField;
    procedure SetCodCentroCusto(const Value: TCmDbField);
    procedure SetIdContrato(const Value: TCmDbField);
    procedure SetIdEmpresa(const Value: TCmDbField);

  public
    property IdContrato : TCmDbField read FIdContrato write SetIdContrato;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write SetCodCentroCusto;
    property IdEmpresa : TCmDbField read FIdEmpresa write SetIdEmpresa;

    constructor Create(Aowner: TCmCustomCdbObject); Override;

  end;

implementation

{ TDbContratoAreaGestora }

constructor TDbContratoAreaTecnica.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRATO_AREATECNICA';

  FIdContrato     := CreateCmDbField('IDCONTRATO',     ftfloat,  True, True, False, True, '');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO', ftString, True, True, False, True, '');
  FIdEmpresa      := CreateCmDbField('IDEMPRESA',      ftfloat,  True, True, False, True, '');
end;

procedure TDbContratoAreaTecnica.SetCodCentroCusto(const Value: TCmDbField);
begin
  FCodCentroCusto := Value;
end;

procedure TDbContratoAreaTecnica.SetIdContrato(const Value: TCmDbField);
begin
  FIdContrato := Value;
end;

procedure TDbContratoAreaTecnica.SetIdEmpresa(const Value: TCmDbField);
begin
  FIdEmpresa := Value;
end;

end.
