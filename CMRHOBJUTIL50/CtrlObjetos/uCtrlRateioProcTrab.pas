{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/04/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlRateioProcTrab;

interface

uses SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH, uDbRateioProcTrab;

type
  TCtrlRateioProcTrab = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbRateioProcTrab;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdEstab: double): OleVariant;
    function ListEstab(IdEstab: double): OleVariant;
    function ListEntid: OleVariant;
    function ListRateioDoEstab(IdEstab: double): OleVariant;

    function RateioCusto(ValorRef: double; DataAdmissao, DataDemissao, DataNotif,
      DataBase: TDate; TipoRateio, Periodo: integer; Percent1, ValorBase1, Percent2,
      ValorBase2, Percent3, ValorBase3, Percent4, ValorBase4, Percent5,
      ValorBase5: double): double;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlRateioProcTrab }

constructor TCtrlRateioProcTrab.Create;
begin
  inherited;
  FDb := TDbRateioProcTrab.Create(Self);
end;

destructor TCtrlRateioProcTrab.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlRateioProcTrab.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRateioProcTrab.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlRateioProcTrab.ListGeral(IdEstab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDFILIALPESSOA, IDPESSOA, TIPORATEIO, DATABASERATEIO, PERIODO,'+CR_LF+
    '  VALORBASE1, VALORBASE2, VALORBASE3, VALORBASE4, VALORBASE5,'+CR_LF+
    '  PERCENT1, PERCENT2, PERCENT3, PERCENT4, PERCENT5'+CR_LF+
    'FROM'+CR_LF+
    '  RATEIOPROCTRAB'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDFILIALPESSOA = ' +FloatToStr(IdEstab)+ ')');
end;

function TCtrlRateioProcTrab.ListEstab(IdEstab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA = ' +FloatToStr(IdEstab)+ ')');
end;

function TCtrlRateioProcTrab.ListEntid: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDPESSOA, P.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, FORNSERV F'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA = P.IDPESSOA)');
end;

function TCtrlRateioProcTrab.ListRateioDoEstab(IdEstab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  R.*, P.NOME, 0.00 AS RAT_IND_RECL, 0.00 AS RAT_PERC_RECL,'+CR_LF+
    '  0.00 AS RAT_IND_PROV, 0.00 AS RAT_PERC_PROV,'+CR_LF+
    '  0.00 AS RAT_IND_REAL, 0.00 AS RAT_PERC_REAL'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, RATEIOPROCTRAB R'+CR_LF+
    'WHERE'+CR_LF+
    '  (R.IDFILIALPESSOA = ' +FloatToStr(IdEstab)+ ') AND'+CR_LF+
    '  (R.IDPESSOA       = P.IDPESSOA)');
end;

function TCtrlRateioProcTrab.RateioCusto(ValorRef: double; DataAdmissao, DataDemissao,
  DataNotif: TDate; DataBase: TDate; TipoRateio, Periodo: integer; Percent1, ValorBase1,
  Percent2, ValorBase2, Percent3, ValorBase3, Percent4, ValorBase4, Percent5,
  ValorBase5: double): double;
var
  DataPrescricao: TDate;
  PeriodoTotal, Periodo1: integer;
begin
  DataPrescricao := DataNotif - Round(Periodo * 365.25 / 12);
  if (DataAdmissao > DataPrescricao) then
    DataPrescricao := DataAdmissao;
  PeriodoTotal := Round(DataDemissao - DataPrescricao);
  Periodo1 := Round(DataBase - DataPrescricao);

  Result := 0;
  if (PeriodoTotal <= 0) then
    exit;

  if (Periodo1 < 0) then
    Periodo1 := 0;
    
  if (Periodo1 > PeriodoTotal) then
    Periodo1 := PeriodoTotal;

  if (TipoRateio = 1) then // Por Data
    Result := 100 - (((Periodo1 * Percent1) + ((PeriodoTotal - Periodo1) *
      Percent2)) / PeriodoTotal)
  else // Por Valor
  if (ValorRef <= ValorBase1) then
    Result := (100 - Percent1) * ValorRef / 100
  else
  if (ValorRef > ValorBase1) and (ValorRef <= ValorBase2) then
    Result := (100 - Percent2) * ValorRef / 100
  else
  if (ValorRef > ValorBase2) and (ValorRef <= ValorBase3) then
    Result := (100 - Percent3) * ValorRef / 100
  else
  if (ValorRef > ValorBase3) and (ValorRef <= ValorBase4) then
    Result := (100 - Percent4) * ValorRef / 100
  else
  if (ValorRef > ValorBase4) and (ValorRef <= ValorBase5) then
    Result := (100 - Percent5) * ValorRef / 100
  else
  if (ValorRef > ValorBase5) then
    Result := 0;
end;

function TCtrlRateioProcTrab.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarRateioProcTrab(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCds, FDb, [], []);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
