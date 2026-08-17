unit uCtrlGuiaGPS;

interface

uses SysUtils, Controls, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
  uCtrlCustomRH, uDbGuiaGRPS;

type
  TCtrlGuiaGPS = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FCds: TCMClientDataSet;
    FDb: TDbGuiaGRPS;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGuiaGPS(IdEstab: double = 0; AnoMes: string = ''; DataVencGRPS: TDate = 0;
      DataFimGRPS: TDate = 0): OleVariant;
    function ListHistGuiaGPS(IdEstab: double = 0): OleVariant;

    function GravarGuiaGPS: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlGuiaGPS }

constructor TCtrlGuiaGPS.Create;
begin
  inherited;
  FDb := TDbGuiaGRPS.Create(Self);
end;

destructor TCtrlGuiaGPS.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlGuiaGPS.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlGuiaGPS.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlGuiaGPS.ListGuiaGPS(IdEstab: double; AnoMes: string; DataVencGRPS,
  DataFimGRPS: TDate): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (IdEstab = -1) then
    sSQL := 'WHERE' +CR_LF+ '  (1 = 2)'
  else
  begin
    if (IdEstab > 0) or (AnoMes <> '') or (DataVencGRPS > 0) or (DataFimGRPS > 0) then
      sSQL := 'WHERE'+CR_LF;

    if (IdEstab > 0) then
      sSQL := sSQL +'  (IDFILIALPESSOA = '+FloatToStr(IdEstab)+')';

    if (AnoMes <> '') then
      sSQL := sSQL +IFF(sSQL = 'WHERE', '', ' AND'+CR_LF)+
        '  (MES = '+QuotedStr(AnoMes)+')';

    if (DataVencGRPS > 0) then
      sSQL := sSQL +IFF(sSQL = 'WHERE', '', ' AND'+CR_LF)+
        '  (DATAVENCGRPS = '+QuotedStr(DateToStr(DataVencGRPS))+')';

    if (DataFimGRPS > 0) then
      sSQL := sSQL +IFF(sSQL = 'WHERE', '', ' AND'+CR_LF)+
        '  (DATAFIMGRPS = '+QuotedStr(DateToStr(DataFimGRPS))+')';
  end;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  GUIAGRPS'+CR_LF+
    sSQL);
end;

function TCtrlGuiaGPS.ListHistGuiaGPS(IdEstab: double = 0): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (IdEstab = -1) then
    sSQL := CR_LF+ 'WHERE' +CR_LF+ '  (1 = 2)'
  else
  if (IdEstab > 0) then
    sSQL := CR_LF+ 'WHERE' +CR_LF+ '  (IDFILIALPESSOA = ' +FloatToStr(IdEstab)+ ')';

  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  DECODE(MES,'''','''',SUBSTR(MES,6,2) ||''/''|| SUBSTR(MES,1,4)) AS MES,' +CR_LF+
    '  DATAVENCGRPS AS DATA_VENC, DATAFIMGRPS AS DATA_PAG,' +CR_LF+
    '  NVL(SALARMATERNIDADE,0) AS SAL_MAT, NVL(SALARIOFAMILIA,0) AS SAL_FAM,' +CR_LF+
    '  NVL(AUXILIODOENCA,0) AS AUX_DOENCA, NVL(AUXILIONATALIDADE,0) AS AUX_NAT,' +CR_LF+
    '  NVL(SEGACIDTRABALHO,0) AS SAT, TOTAL' +CR_LF+
    'FROM' +CR_LF+
    '  GUIAGRPS'+
    sSQL);
end;

function TCtrlGuiaGPS.GravarGuiaGPS: Boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarGuiaGPS(Cds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDb.MessageInfo);
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
