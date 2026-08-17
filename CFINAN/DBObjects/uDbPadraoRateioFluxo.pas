{ --------------------------------------------------------------------------------------------------
//N. WO ..........: 13599
//Data............: 30/09/2024
//Responsável.....: Leandro Pocebon
//Descrição.......: Inclusão combo programa na configuração do rateio
---------------------------------------------------------------------------------------------------
Nº SOL......: 128685
Nº KINTANA..: 692049
Data........: 06/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
---------------------------------------------------------------------------------------------------}
unit uDbPadraoRateioFluxo;

interface

uses
  uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbPadraoRateioFluxo = class(TCmDbObject)

  private

    FIdPadraoRateioFluxo: TCmDbField;
    FIdGrupoRateioFluxo: TCmDbField;
    FIdEmpresaProp: TCmDbField;
    FUnidNegoc: TCmDbField;
    FCodCentroRespon: TCmDbField;
    FCodCentroCusto: TCmDbField; //leandro wo13599
    FCodLinhaFluxo: TCmDbField;
    FRecPag: TCmDbField;
    FCodTipRecDes: TCmDbField;
    FIdPatro: TCmDbField;
    FIdPlanoPrev: TCmDbField;
    FCodTipDoc: TCmDbField;
    FMoeCodigo: TCmDbField;
    FPercentRateio: TCmDbField;
    FIdSegregaCriter: TCmDbField;
    FIdFluxoCaixa: TCmDbField;
    FIdPrograma: TCmDbField;  // Leandro WO13599

    procedure SetCodCentroRespon(const Value: TCmDbField);
    procedure SetCodCentroCusto(const Value: TCmDbField); //leandro wo13599
    procedure SetCodLinhaFluxo(const Value: TCmDbField);
    procedure SetCodTipDoc(const Value: TCmDbField);
    procedure SetCodTipRecDes(const Value: TCmDbField);
    procedure SetIdEmpresaProp(const Value: TCmDbField);
    procedure SetIdGrupoRateioFluxo(const Value: TCmDbField);
    procedure SetIdPadraoRateioFluxo(const Value: TCmDbField);
    procedure SetIdPatro(const Value: TCmDbField);
    procedure SetIdPlanoPrev(const Value: TCmDbField);
    procedure SetMoeCodigo(const Value: TCmDbField);
    procedure SetPercentRateio(const Value: TCmDbField);
    procedure SetRecPag(const Value: TCmDbField);
    procedure SetUnidNegoc(const Value: TCmDbField);
    procedure SetIdSegregaCriter(const Value: TCmDbField);
    procedure SetIdFluxoCaixa(const Value: TCmDbField);
    procedure SetIdPrograma(const Value: TCmDbField); // Leandro WO13599

  public

    property IdPadraoRateioFluxo: TCmDbField read FIdPadraoRateioFluxo write SetIdPadraoRateioFluxo;
    property IdGrupoRateioFluxo: TCmDbField read FIdGrupoRateioFluxo write SetIdGrupoRateioFluxo;
    property IdEmpresaProp: TCmDbField read FIdEmpresaProp write SetIdEmpresaProp;
    property UnidNegoc: TCmDbField read FUnidNegoc write SetUnidNegoc;
    property CodCentroRespon: TCmDbField read FCodCentroRespon write SetCodCentroRespon;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write SetCodCentroCusto; // leandro wo13599
    property IdFluxoCaixa: TCmDbField read FIdFluxoCaixa write SetIdFluxoCaixa;
    property CodLinhaFluxo: TCmDbField read FCodLinhaFluxo write SetCodLinhaFluxo;
    property RecPag: TCmDbField read FRecPag write SetRecPag;
    property CodTipRecDes: TCmDbField read FCodTipRecDes write SetCodTipRecDes;
    property IdSegregaCriter : TCmDbField read FIdSegregaCriter write SetIdSegregaCriter;
    property IdPatro: TCmDbField read FIdPatro write SetIdPatro;
    property IdPlanoPrev: TCmDbField read FIdPlanoPrev write SetIdPlanoPrev;
    property CodTipDoc: TCmDbField read FCodTipDoc write SetCodTipDoc;
    property MoeCodigo: TCmDbField read FMoeCodigo write SetMoeCodigo;
    property PercentRateio: TCmDbField read FPercentRateio write SetPercentRateio;
    property IdPrograma: TCmDbField read FIdPrograma write SetIdPrograma;  //Leandro WO13599

    constructor Create(Aowner: TCmCustomCdbObject); override;

    function Insert: Boolean; Override;
  End;

implementation

{ TDbPadraoRateioFluxo }

constructor TDbPadraoRateioFluxo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PADRAORATEIOFLUXO';

  FIdPadraoRateioFluxo := CreateCmDbField('IdPadraoRateioFluxo',ftfloat, True, True, False,False,'');
  FIdGrupoRateioFluxo  := CreateCmDbField('IdGrupoRateioFluxo', ftfloat, False,False,False,False,'');
  FIdEmpresaProp       := CreateCmDbField('IdEmpresaProp',      ftfloat, False,False,False,False,'');
  FUnidNegoc           := CreateCmDbField('UnidNegoc',          ftfloat, False,False,False,False,'');
  FCodCentroRespon     := CreateCmDbField('CodCentroRespon',    ftString,False,False,False,False,'');
  FCodCentroCusto      := CreateCmDbField('CodCentroCusto',     ftString,False,False,False,False,''); //leandro wo13599
  FIdFluxoCaixa        := CreateCmDbField('IdFluxoCaixa',       ftfloat, False,False,False,False,'');
  FCodLinhaFluxo       := CreateCmDbField('CodLinhaFluxo',      ftfloat, False,False,False,False,'');
  FRecPag              := CreateCmDbField('RecPag',             ftString,False,False,False,False,'');
  FCodTipRecDes        := CreateCmDbField('CodTipRecDes',       ftString,False,False,False,False,'');
  FIdSegregaCriter     := CreateCmDbField('IdSegregaCriter',    ftfloat, False,False,False,False,'');
  FIdPatro             := CreateCmDbField('IdPatro',            ftfloat, False,False,False,False,'');
  FIdPlanoPrev         := CreateCmDbField('IdPlanoPrev',        ftfloat, False,False,False,False,'');
  FCodTipDoc           := CreateCmDbField('CodTipDoc',          ftfloat, False,False,False,False,'');
  FMoeCodigo           := CreateCmDbField('MoeCodigo',          ftfloat, False,False,False,False,'');
  FPercentRateio       := CreateCmDbField('PercentRateio',      ftfloat, False,False,False,False,'');
  FIdPrograma          := CreateCmDbField('IdPrograma',         ftfloat, False,False,False,False,''); //Leandro WO13599

end;

function TDbPadraoRateioFluxo.Insert: Boolean;
begin
   FIdPadraoRateioFluxo.AsFloat := GetSequence('PADRAORATEIOFLUXO');
   Result := Inherited Insert;
end;

procedure TDbPadraoRateioFluxo.SetCodCentroRespon(const Value: TCmDbField);
begin
  FCodCentroRespon := Value;
end;

procedure TDbPadraoRateioFluxo.SetCodCentroCusto(const Value: TCmDbField);
begin
  FCodCentroCusto := Value;
end;

procedure TDbPadraoRateioFluxo.SetCodLinhaFluxo(const Value: TCmDbField);
begin
  FCodLinhaFluxo := Value;
end;

procedure TDbPadraoRateioFluxo.SetCodTipDoc(const Value: TCmDbField);
begin
  FCodTipDoc := Value;
end;

procedure TDbPadraoRateioFluxo.SetCodTipRecDes(const Value: TCmDbField);
begin
  FCodTipRecDes := Value;
end;

procedure TDbPadraoRateioFluxo.SetIdEmpresaProp(const Value: TCmDbField);
begin
  FIdEmpresaProp := Value;
end;

procedure TDbPadraoRateioFluxo.SetIdFluxoCaixa(const Value: TCmDbField);
begin
  FIdFluxoCaixa := Value;
end;

procedure TDbPadraoRateioFluxo.SetIdGrupoRateioFluxo(
  const Value: TCmDbField);
begin
  FIdGrupoRateioFluxo := Value;
end;

procedure TDbPadraoRateioFluxo.SetIdPadraoRateioFluxo(
  const Value: TCmDbField);
begin
  FIdPadraoRateioFluxo := Value;
end;

procedure TDbPadraoRateioFluxo.SetIdPatro(const Value: TCmDbField);
begin
  FIdPatro := Value;
end;

procedure TDbPadraoRateioFluxo.SetIdPlanoPrev(const Value: TCmDbField);
begin
  FIdPlanoPrev := Value;
end;

procedure TDbPadraoRateioFluxo.SetIdSegregaCriter(const Value: TCmDbField);
begin
  FIdSegregaCriter := Value;
end;

procedure TDbPadraoRateioFluxo.SetMoeCodigo(const Value: TCmDbField);
begin
  FMoeCodigo := Value;
end;

procedure TDbPadraoRateioFluxo.SetPercentRateio(const Value: TCmDbField);
begin
  FPercentRateio := Value;
end;

procedure TDbPadraoRateioFluxo.SetRecPag(const Value: TCmDbField);
begin
  FRecPag := Value;
end;

procedure TDbPadraoRateioFluxo.SetUnidNegoc(const Value: TCmDbField);
begin
  FUnidNegoc := Value;
end;

procedure TDbPadraoRateioFluxo.SetIdPrograma(const Value: TCmDbField);
begin
  FIdPrograma := Value;
end;

end.



