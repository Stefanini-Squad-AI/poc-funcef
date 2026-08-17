{-------------------------------------------------------------------------------
-----------------------ALTERAÇÕES / IMPLEMENTAÇÕES -----------------------------
--------------------------------------------------------------------------------
 N. SIG..........: 46231
 Data............: 28/08/2019
 Responsável.....: Everson Cunha
 Descrição.......: Criação da Db
--------------------------------------------------------------------------------}

unit uDbContratoAreaGestora;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbContratoAreaGestora = class(TCmDbObject)
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

constructor TDbContratoAreaGestora.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRATO_AREAGESTORA';

  FIdContrato := CreateCmDbField('IDCONTRATO', ftfloat, True, True, False, True, '');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO', ftString, True, True, False, True, '');
  FIdEmpresa := CreateCmDbField('IDEMPRESA', ftfloat, True, True, False, True, '');
end;

procedure TDbContratoAreaGestora.SetCodCentroCusto(const Value: TCmDbField);
begin
  FCodCentroCusto := Value;
end;

procedure TDbContratoAreaGestora.SetIdContrato(const Value: TCmDbField);
begin
  FIdContrato := Value;
end;

procedure TDbContratoAreaGestora.SetIdEmpresa(const Value: TCmDbField);
begin
  FIdEmpresa := Value;
end;

end.
