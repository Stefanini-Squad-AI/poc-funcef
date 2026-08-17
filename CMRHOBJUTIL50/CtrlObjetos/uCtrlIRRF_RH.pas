unit uCtrlIRRF_RH;

interface

uses SysUtils, Classes, Controls, uCmClientDataSet, uCmControlObject, IvDictio, 
  uCtrlCustomRH, uCtrlFuncoesRH;

type
  TFaixa = record
    Faixa, Aliquota, ParcDeduzir: double;
  end;

  TCtrlIRRF = class(TCtrlCustomRH)
  private
    FListaFaixas: array of TFaixa;

    FNumTotalFaixas: integer;
    FIdadeIdoso: integer;
    FValorIdoso: double;
    FValorDependente: double;

    function  GetPosFaixa(Base: double): integer;
    // Atenção: Rever esta rotina, pois os Anos Bisextos não estão sendo considerados
    function CalcIdade(DataRef, DataNasc: TDate): integer;
  public
    constructor Create; override;
    destructor  Destroy; override;

    procedure CarregaFaixas(IdEmpresa: integer);
    
    function Calcular(NumDependentes: integer; DataNasc: TDate;
      var Base, Percentual: double; DataRef: TDate; Tipo: LongInt): double;

    property IdadeIdoso: integer read FIdadeIdoso;
    property ValorIdoso: double read FValorIdoso;
    property ValorDependente: double read FValorDependente;
  end;

implementation

constructor TCtrlIRRF.Create;
begin
  inherited Create;
end;

destructor TCtrlIRRF.Destroy;
begin
  inherited Destroy;
end;

procedure TCtrlIRRF.CarregaFaixas(IdEmpresa: integer);
var
  c: integer;
begin
  //DataRef := DateToStr(Date);

  _Cds.Close;
  _Cds.Data := GetDataPacket(
    'SELECT IDADEIDOSO, VLRIDOSOS, VLRDEPENDENTE' +CR_LF+
    'FROM   PARAMIRRF'+CR_LF+
    'WHERE  (IDPESSOA = ' +IntToStr(IdEmpresa)+ ')');
{    'SELECT H.IDADEIDOSO, H.VLRIDOSO, H.VLRDEPENDENTE' +CR_LF+
    'FROM   HSTPARAMIRRF H,' +CR_LF+
    '       (SELECT DISTINCT FAIXA_IRRF, MAX(DATAINIVIGENCIA) AS DATA' +CR_LF+
    '        FROM   IRRF' +CR_LF+
    '        WHERE  (DATAINIVIGENCIA <= TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY''))'+CR_LF+
    '        GROUP BY FAIXA_IRRF) T' +CR_LF+
    'WHERE  (H.DATAINIVIGENCIA = T.DATA)');}

  FIdadeIdoso := _Cds.FieldByName('IDADEIDOSO').asInteger;
  FValorIdoso := _Cds.FieldByName('VLRIDOSOS').asFloat;
  FValorDependente := _Cds.FieldByName('VLRDEPENDENTE').asFloat;

  _Cds.Close;
  _Cds.Data := GetDataPacket(
    'SELECT FAIXA_IRRF, ALIQUOTA_IRRF, PARCDEDUZIRRF' +CR_LF+
    'FROM   IRRF' +CR_LF+
    'ORDER BY FAIXA_IRRF');
{    'SELECT' +CR_LF+
    '  I.IDIRRF, I.FAIXA_IRRF, I.ALIQUOTA_IRRF, I.PARCDEDUZIRRF, I.DATAINIVIGENCIA' +CR_LF+
    'FROM' +CR_LF+
    '  IRRF I,' +CR_LF+
    '  (SELECT DISTINCT FAIXA_IRRF, MAX(DATAINIVIGENCIA) AS DATA' +CR_LF+
    '   FROM   IRRF' +CR_LF+
    '   WHERE  (DATAINIVIGENCIA <= TO_DATE(' +QuotedStr(dataRef)+ ',''DD/MM/YYYY''))' +CR_LF+
    '   GROUP BY FAIXA_IRRF) T' +CR_LF+
    'WHERE' +CR_LF+
    '  (T.FAIXA_IRRF = I.FAIXA_IRRF) AND' +CR_LF+
    '  (T.DATA       = I.DATAINIVIGENCIA');}

  FNumTotalFaixas := _Cds.RecordCount;
  SetLength(FListaFaixas, 0);
  SetLength(FListaFaixas, FNumTotalFaixas);
  for c:=0 to FNumTotalFaixas-1 do
  begin
    FListaFaixas[c].Faixa := _Cds.FieldByName('FAIXA_IRRF').asFloat;
    FListaFaixas[c].Aliquota := _Cds.FieldByName('ALIQUOTA_IRRF').asFloat;
    FListaFaixas[c].ParcDeduzir := _Cds.FieldByName('PARCDEDUZIRRF').asFloat;
    _Cds.Next;
  end;
  _Cds.Close;
end;

function TCtrlIRRF.GetPosFaixa(Base: double): integer;
var
  c: integer;
begin
  Result := -1;
  for c:=0 to FNumTotalFaixas-1 do
    if (FListaFaixas[c].Faixa > Base) then
    begin
      Result := c;
      break;
    end;
end;

function TCtrlIRRF.CalcIdade(DataRef, DataNasc: TDate): integer;
begin
 if (DataNasc = 0) then
   Result := 0
 else
   Result := Trunc((DataRef - DataNasc) / 365.25);
end;

function TCtrlIRRF.Calcular(NumDependentes: integer; DataNasc: TDate;
  var Base, Percentual: double; DataRef: TDate; Tipo: LongInt): double;
var
  iNumFaixa: integer;
begin
  Percentual := 0;
  Result := 0;

  Base := Base - FValorDependente * NumDependentes;
  if (CalcIdade(DataRef, DataNasc) >= FIdadeIdoso) then
    Base := Base - FValorIdoso;

  iNumFaixa := GetPosFaixa(Base);
  if (iNumFaixa > -1) then
  begin
    Percentual := FListaFaixas[iNumFaixa].Aliquota;
    case (Tipo) of
      0 : Result := Percentual / 100 * Base - FListaFaixas[iNumFaixa].ParcDeduzir; // Imposto Devido
      1 : Result := Percentual; // Alíquota IRRF
      2 : Result := FListaFaixas[iNumFaixa].ParcDeduzir; // Parcela a deduzir
    end;
  end;
end;

end.
