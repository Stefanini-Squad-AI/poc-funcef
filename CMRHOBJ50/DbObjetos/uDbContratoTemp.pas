unit uDbContratoTemp;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
    TDbContratoTemp = class(TCmDbObject)

    private
      FNivelIndiv1: TCmDbField;
      FIdContratoTemp: TCmDbField;
      FDataDesl_Efet: TCmDbField;
      FIdCargo: TCmDbField;
      FDuracaoContrato: TCmDbField;
      FPrevisaoTermino: TCmDbField;
      FNivelIndiv2: TCmDbField;
      FSalarioAtual: TCmDbField;
      FSituacao: TCmDbField;
      FPrevisaoAvisoPrev: TCmDbField;
      FIdPessoa: TCmDbField;

      procedure SetDataDesl_Efet(const Value: TCmDbField);
      procedure SetDuracaoContrato(const Value: TCmDbField);
      procedure SetIdCargo(const Value: TCmDbField);
      procedure SetIdContratoTemp(const Value: TCmDbField);
      procedure SetNivelIndiv1(const Value: TCmDbField);
      procedure SetNivelIndiv2(const Value: TCmDbField);
      procedure SetPrevisaoAvisoPrev(const Value: TCmDbField);
      procedure SetPrevisaoTermino(const Value: TCmDbField);
      procedure SetSalarioAtual(const Value: TCmDbField);
      procedure SetSituacao(const Value: TCmDbField);
      procedure SetIdPessoa(const Value: TCmDbField);


    public
      function Insert : boolean; override;

      constructor Create(Aowner : TCmCustomCdbObject); override;

      property IdContratoTemp : TCmDbField read FIdContratoTemp write SetIdContratoTemp;
      property IdCargo : TCmDbField read FIdCargo write SetIdCargo;
      property NivelIndiv1: TCmDbField read FNivelIndiv1 write SetNivelIndiv1;
      property NivelIndiv2 : TCmDbField read FNivelIndiv2 write SetNivelIndiv2;
      property DuracaoContrato : TCmDbField read FDuracaoContrato write SetDuracaoContrato;
      property PrevisaoTermino : TCmDbField read FPrevisaoTermino write SetPrevisaoTermino;
      property PrevisaoAvisoPrev : TCmDbField read FPrevisaoAvisoPrev write SetPrevisaoAvisoPrev;
      property SalarioAtual : TCmDbField read FSalarioAtual write SetSalarioAtual;
      property Situacao : TCmDbField read FSituacao write SetSituacao;
      property DataDesl_Efet : TCmDbField read FDataDesl_Efet write SetDataDesl_Efet;
      property IdPessoa : TCmDbField read FIdPessoa write SetIdPessoa;


    end;

implementation

{ TDbContratoTemp }

constructor TDbContratoTemp.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'CONTRATOTEMP';

  FIdContratoTemp := CreateCmDbField('IDCONTRATOTEMP', ftInteger, True, True, False, True, '');
  FNivelIndiv1 := CreateCmDbField('NIVELINDIV1', ftInteger, False, False, False, True, '');
  FDataDesl_Efet := CreateCmDbField('DATADESL_EFET', ftDateTime, False, False, False, True, '');
  FIdCargo := CreateCmDbField('IDCARGO', ftInteger, True, False, False, True, '');
  FDuracaoContrato := CreateCmDbField('DURACAOCONTRATO', ftInteger, False, False, False, True, '');
  FPrevisaoTermino := CreateCmDbField('PREVISAOTERMINO', ftDateTime, False, False, False, True, '');
  FNivelIndiv2 := CreateCmDbField('NIVELINDIV2 ', ftInteger, False, False, False, True, '');
  FSalarioAtual := CreateCmDbField('SALARIOATUAL', ftFloat, False, False, False, True, '');
  FSituacao := CreateCmDbField('SITUACAO', ftString, False, False, False, True, '');
  FPrevisaoAvisoPrev := CreateCmDbField('PREVISAOAVISOPREV', ftDateTime, False, False, False, True, '');
  FIdPessoa := CreateCmDbField('IDPESSOA', ftInteger, True, False, False, True, '');


end;

function TDbContratoTemp.Insert: boolean;
begin
  FIdContratoTemp.AsInteger := GetSequence('CONTRATOTEMP');
  Result := inherited Insert;
end;

procedure TDbContratoTemp.SetDataDesl_Efet(const Value: TCmDbField);
begin
  FDataDesl_Efet := Value;
end;

procedure TDbContratoTemp.SetDuracaoContrato(const Value: TCmDbField);
begin
  FDuracaoContrato := Value;
end;

procedure TDbContratoTemp.SetIdCargo(const Value: TCmDbField);
begin
  FIdCargo := Value;
end;

procedure TDbContratoTemp.SetIdContratoTemp(const Value: TCmDbField);
begin
  FIdContratoTemp := Value;
end;

procedure TDbContratoTemp.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbContratoTemp.SetNivelIndiv1(const Value: TCmDbField);
begin
  FNivelIndiv1 := Value;
end;

procedure TDbContratoTemp.SetNivelIndiv2(const Value: TCmDbField);
begin
  FNivelIndiv2 := Value;
end;

procedure TDbContratoTemp.SetPrevisaoAvisoPrev(const Value: TCmDbField);
begin
  FPrevisaoAvisoPrev := Value;
end;

procedure TDbContratoTemp.SetPrevisaoTermino(const Value: TCmDbField);
begin
  FPrevisaoTermino := Value;
end;

procedure TDbContratoTemp.SetSalarioAtual(const Value: TCmDbField);
begin
  FSalarioAtual := Value;
end;

procedure TDbContratoTemp.SetSituacao(const Value: TCmDbField);
begin
  FSituacao := Value;
end;

end.
