unit CMContabRegra;

interface

uses
  ComObj, ActiveX, Contab_TLB, comctrls, uString, StdVcl,
  uCMClientDataSet,uCmControlObject;

type
  TCMContabRegra = class(TAutoObject, ICMContabRegra)
  private
    reLogResultado : TRichEdit;
    fExercicio : Integer;
    fPeriodo : Integer;
    fNome : string;
    FCtrlTelaObject: TCmControlObject;
    procedure AppendLog(const Text : string);
    procedure GeraLogRegraViolada(const Valor: Double);
    procedure MontaSQL(var SQL : string; const SubConta, PlanoPrev,
      Patro: Double; const CentCust: WideString; const AtivProj: Double);
    procedure SetCtrlTelaObject(const Value: TCmControlObject);
  protected
    function SaldoConta(const Placonta: WideString; SubConta, PlanoPrev,
      Patro: Double; const CentCust: WideString; AtivProj: Double): Double;
      safecall;
    procedure ProvaCredor(Valor: Double); safecall;
    procedure ProvaDevedor(Valor: Double); safecall;
    procedure ProvaValor(Valor, Resultado: Double); safecall;
    procedure ProvaZero(Valor: Double); safecall;
    function Get_Exercicio: Integer; safecall;
    function Get_Periodo: Integer; safecall;
    procedure Set_Exercicio(Value: Integer); safecall;
    procedure Set_Periodo(Value: Integer); safecall;
    function Exp(Valor: Double): Double; safecall;
    function Indice: Double; safecall;
    function MovContaPerAnt(const Placonta: WideString; SubConta, PlanoPrev,
      Patro: Double; const CentCust: WideString; AtivProj: Double;
      NumExAnt: Integer): Double; safecall;
    function SaldoContaExAnt(const Placonta: WideString; SubConta, PlanoPrev,
      Patro: Double; const CentCust: WideString; AtivProj: Double;
      NumExAnt: Integer): Double; safecall;
    function Mov_C(const Placonta: WideString; SubConta, PlanoPrev,
      Patro: Double; const CentCust: WideString; AtivProj: Double): Double;
      safecall;
    function Mov_CPerAnt(const Placonta: WideString; SubConta, PlanoPrev,
      Patro: Double; const CentCust: WideString; AtivProj: Double;
      NumExAnt: Integer): Double; safecall;
    function Mov_D(const Placonta: WideString; SubConta, PlanoPrev,
      Patro: Double; const CentCust: WideString; AtivProj: Double): Double;
      safecall;
    function Mov_DPerAnt(const Placonta: WideString; SubConta, PlanoPrev,
      Patro: Double; const CentCust: WideString; AtivProj: Double;
      NumExAnt: Integer): Double; safecall;
    function MovConta(const Placonta: WideString; SubConta, PlanoPrev,
      Patro: Double; const CentCust: WideString; AtivProj: Double): Double;
      safecall;
  public
    property CtrlTelaObject :TCmControlObject read FCtrlTelaObject write SetCtrlTelaObject;
    property Nome : string read fNome write fNome;
    constructor Create(RichEditResultado : TRichEdit);
  end;

implementation

uses ComServ, SysUtils,  uSistema, uCtrlParamIntegra;

constructor TCMContabRegra.Create(RichEditResultado : TRichEdit);
begin
  inherited Create;
  reLogResultado := RichEditResultado;
end;

procedure TCMContabRegra.AppendLog(const Text : string);
begin
  if reLogResultado <> nil then
    reLogResultado.Lines.Append(Text);
end;  

procedure TCMContabRegra.GeraLogRegraViolada(const Valor: Double);
begin
  AppendLog('Regra -> ' + Nome);
  AppendLog('Resultado : ' + FormatFloat('#0.00', Valor));
  AppendLog(StringOfChar('=', 80));
end;  

procedure TCMContabRegra.MontaSQL(var SQL : string; const SubConta, PlanoPrev,
  Patro: Double; const CentCust: WideString; const AtivProj: Double);
begin
  if SubConta > 0 then
    SQL := Format('%s AND CODSUBCONTA = ' + FloatToStrF(SubConta, ffNumber, 20, 0), [Sql]);
  if PlanoPrev > 0 then
    SQL := Format('%s AND IDPLANOPREV = ' + FloatToStrF(PlanoPrev, ffNumber, 20, 0), [Sql]);
  if Patro > 0 then
    SQL := Format('%s AND IDPATRO = ' + FloatToStrF(Patro, ffNumber, 20, 0), [Sql]);
  if Trim(CentCust) <> '' then
    SQL := Format('%s AND CODCENTROCUSTO = ' + Espaco(CentCust,10), [Sql]);
  if AtivProj > 0 then
    SQL := Format('%s AND UNIDNEGOC = ' + FloatToStrF(AtivProj, ffNumber, 20, 0), [Sql]);
end;

function TCMContabRegra.SaldoConta(const Placonta: WideString; SubConta,
  PlanoPrev, Patro: Double; const CentCust: WideString;
  AtivProj: Double): Double;
begin
  Result := SaldoContaExAnt(PlaConta, SubConta, PlanoPrev, Patro, CentCust, AtivProj, 0);
end;

procedure TCMContabRegra.ProvaCredor(Valor: Double);
begin
  if Valor < 0.01 then
    GeraLogRegraViolada(Valor);
end;

procedure TCMContabRegra.ProvaDevedor(Valor: Double);
begin
  if Valor > (-0.01) then
    GeraLogRegraViolada(Valor);
end;

procedure TCMContabRegra.ProvaValor(Valor, Resultado: Double);
begin
  if Abs(Valor - Resultado) >= 0.01 then
    GeraLogRegraViolada(Valor);
end;

procedure TCMContabRegra.ProvaZero(Valor: Double);
begin
  ProvaValor(Valor, 0);
end;

function TCMContabRegra.Get_Exercicio: Integer;
begin
  Result := fExercicio;
end;

function TCMContabRegra.Get_Periodo: Integer;
begin
  Result := fPeriodo;
end;

procedure TCMContabRegra.Set_Exercicio(Value: Integer);
begin
  fExercicio := Value;
end;

procedure TCMContabRegra.Set_Periodo(Value: Integer);
begin
  fPeriodo := Value;
end;

function TCMContabRegra.Exp(Valor: Double): Double;
begin
  Result := Exp(Valor);
end;

function TCMContabRegra.Indice: Double;
begin
//Buscar o indice de alguma coisa...

end;

function TCMContabRegra.MovContaPerAnt(const Placonta: WideString;
  SubConta, PlanoPrev, Patro: Double; const CentCust: WideString;
  AtivProj: Double; NumExAnt: Integer): Double;
begin
  Result := Mov_DPerAnt(PlaConta, SubConta, PlanoPrev, Patro, CentCust, AtivProj,
    NumExAnt) - Mov_CPerAnt(PlaConta, SubConta, PlanoPrev, Patro, CentCust, AtivProj,
    NumExAnt);
end;

function TCMContabRegra.SaldoContaExAnt(const Placonta: WideString;
  SubConta, PlanoPrev, Patro: Double; const CentCust: WideString;
  AtivProj: Double; NumExAnt: Integer): Double;
var
  sSQL : string;
  _cds :TCMClientDataSet;

begin
  _cds := TCMClientDataSet.Create(nil);

  sSQL := 'SELECT SUM(NVL(PLSCREDITOCOR,0)) AS CREDITO,   ' +
          '       SUM(NVL(PLSDEBITOCORRENTE,0)) AS DEBITO ' +
          'FROM PLANOSALDO                                ' +
          'WHERE IDPESSOA     = ' + IntToStr(Sistema.IdEmpresa) +
          '  AND PEREXERCICIO = ' + IntToStr(fExercicio - abs(NumExAnt)) +
          '  AND (PERNUMERO  <= ' + IntToStr(fPeriodo) +
          '  OR  PERNUMERO IS NULL) ' +
          '  AND PLANO    = ' + IntToStr(ParamIntegra.Plano) +
          '  AND PLACONTA = ' + Copy(Placonta + '                  ',1,18);

  MontaSQL(sSQL, SubConta, PlanoPrev, Patro, CentCust, AtivProj);

  _cds.Data := CtrlTelaObject.GetDataPacket(sSql);

  if not _cds.IsEmpty then
  begin
     Result := _cds.FieldByName('DEBITO').AsFloat - _cds.FieldByName('CREDITO').AsFloat
  end else
  begin
     Result := 0;
  end;
   _cds.free;

end;

function TCMContabRegra.Mov_C(const Placonta: WideString; SubConta,
  PlanoPrev, Patro: Double; const CentCust: WideString;
  AtivProj: Double): Double;
begin
  Result := Mov_CPerAnt(PlaConta, SubConta, PlanoPrev, Patro, CentCust, AtivProj, 0);
end;

function TCMContabRegra.Mov_CPerAnt(const Placonta: WideString; SubConta,
  PlanoPrev, Patro: Double; const CentCust: WideString; AtivProj: Double;
  NumExAnt: Integer): Double;
var
  sSQL : string;
  _cds :TCMClientDataSet;

begin
  _cds := TCMClientDataSet.Create(nil);

  sSQL := 'SELECT SUM(NVL(PLSCREDITOCOR,0)) AS CREDITO ' +
          'FROM PLANOSALDO      ' +
          'WHERE IDPESSOA     = ' + IntToStr(Sistema.IdEmpresa) +
          ' AND  PEREXERCICIO = ' + IntToStr(fExercicio - abs(NumExAnt)) +
          ' AND PERNUMERO     = ' + IntToStr(fPeriodo) +
          ' AND PLANO         = ' + IntToStr(ParamIntegra.Plano) +
          ' AND PLACONTA      = ' + Copy(Placonta + '                   ',1,18);

  MontaSQL(sSQL, SubConta, PlanoPrev, Patro, CentCust, AtivProj);

  _cds.Data := CtrlTelaObject.GetDataPacket(sSql);

  if not _cds.IsEmpty then
  begin
     Result := _cds.FieldByName('CREDITO').AsFloat;
  end else
  begin
     Result := 0;
  end;

    _cds.free;
end;

function TCMContabRegra.Mov_D(const Placonta: WideString; SubConta,
  PlanoPrev, Patro: Double; const CentCust: WideString;
  AtivProj: Double): Double;
begin
  Result := Mov_DPerAnt(PlaConta, SubConta, PlanoPrev, Patro, CentCust, AtivProj, 0);
end;

function TCMContabRegra.Mov_DPerAnt(const Placonta: WideString; SubConta,
  PlanoPrev, Patro: Double; const CentCust: WideString; AtivProj: Double;
  NumExAnt: Integer): Double;
var
  sSQL : string;
  _cds :TCMClientDataSet;
begin
  _cds := TCMClientDataSet.Create(nil);

  sSQL := 'SELECT SUM(NVL(PLSDEBITOCORRENTE,0)) AS DEBITO ' +
          'FROM PLANOSALDO                       ' +
          'WHERE IDPESSOA     = ' + IntToStr(Sistema.IdEmpresa) +
          '  AND PEREXERCICIO = ' + IntToStr(fExercicio - abs(NumExAnt)) +
          '  AND PERNUMERO    = ' + IntToStr(fPeriodo) +
          '  AND PLANO        = ' + IntToStr(ParamIntegra.Plano) +
          '  AND PLACONTA     = ' + Copy(Placonta + '                  ',1,18);

  MontaSQL(sSQL, SubConta, PlanoPrev, Patro, CentCust, AtivProj);

  _cds.Data := CtrlTelaObject.GetDataPacket(sSql);

  if not _cds.IsEmpty then
  begin
     Result := _cds.FieldByName('DEBITO').AsFloat;
  end else
  begin
     Result := 0;
  end;

    _cds.free;
end;

function TCMContabRegra.MovConta(const Placonta: WideString; SubConta,
  PlanoPrev, Patro: Double; const CentCust: WideString;
  AtivProj: Double): Double;
begin
  Result := Mov_D(PlaConta, SubConta, PlanoPrev, Patro, CentCust, AtivProj) - Mov_C(PlaConta, SubConta, PlanoPrev, Patro, CentCust, AtivProj);
end;


procedure TCMContabRegra.SetCtrlTelaObject(const Value: TCmControlObject);
begin
  FCtrlTelaObject := Value;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TCMContabRegra, Class_CMContabRegra, ciMultiInstance);
end.
