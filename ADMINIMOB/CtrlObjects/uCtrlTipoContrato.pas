unit uCtrlTipoContrato;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCMTypes, uDBTipoContrImob;


type
  tCtrlTipoContrato = class(TCmControlObject)
  private
    FCdsTipoContrato: TCMClientDataSet;
    FdbTipoContrato: TDbTipoContrImob;
    procedure SetCdsTipoContrato(const Value: TCMClientDataSet);
    procedure SetdbTipoContrato(const Value: TDbTipoContrImob);
  protected
    procedure onCreateAppServer; override;
    procedure AfterInitialize; override;

  public
    constructor Create; override;
    destructor Destroy; override;

    // tabela TIPOCONTRIMOB
    property dbTipoContrato  : TDbTipoContrImob read FdbTipoContrato write SetdbTipoContrato;
    property CdsTipoContrato : TCMClientDataSet read FCdsTipoContrato write SetCdsTipoContrato;

    function LookupTipoContrato(const sCodTipoContrato: string = ''): OLEVariant;

    function GravaTipoContrato: boolean;

  published

end;

implementation

{ tCtrlTipoContrato }

constructor tCtrlTipoContrato.Create;
begin
  inherited;
  FdbTipoContrato := TDbTipoContrImob.Create( Self );
end;

procedure tCtrlTipoContrato.onCreateAppServer;
begin
  inherited;
  FCdsTipoContrato := TCMClientDataSet.Create (nil);
end;

destructor tCtrlTipoContrato.Destroy;
begin
  inherited;
  FreeAndNil (FdbTipoContrato);

  if isAppServer then
    FreeAndNil (FCdsTipoContrato);
end;

procedure tCtrlTipoContrato.AfterInitialize;
begin
  inherited;
  FdbTipoContrato.DataBaseName := DataBaseName;
end;

function tCtrlTipoContrato.GravaTipoContrato: boolean;
var
  sMsg : string;
begin
    if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaTipoContrato (CdsTipoContrato.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;
      Result := ApplyCds(CdsTipoContrato, dbTipoContrato, [], []);
      sMsg := dbTipoContrato.MessageInfo;

      if  not Result then raise Exception.Create(sMsg);

      Commit;
    except
      on E:Exception do begin
        Result := false;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

procedure tCtrlTipoContrato.SetCdsTipoContrato(
  const Value: TCMClientDataSet);
begin
  FCdsTipoContrato := Value;
end;

procedure tCtrlTipoContrato.SetdbTipoContrato(
  const Value: TDbTipoContrImob);
begin
  FdbTipoContrato := Value;
end;

function tCtrlTipoContrato.LookupTipoContrato(
  const sCodTipoContrato: string): OLEVariant;
var
  sSql,sParam : String;
begin
  sParam := '';

  sSql := ' SELECT ' + #13 +
          '   TC.IDTIPOCONTRIMOB, ' + #13 +
          '   TC.SIGLA, ' + #13 +
          '   TC.NOME, '+#13+
          '   (TRIM(TC.SIGLA) || ' + ''' - ''' + ' || TRIM(TC.NOME)) AS DESCRICAO ' + #13 +
          ' FROM ' + #13 +
          '   TIPOCONTRIMOB TC '+#13;

  if sCodTipoContrato <> '' then begin
    sSql := sSql + '   WHERE ' + #13;
    sSql := sSql + '     IDTIPOCONTRIMOB = ' + QuotedStr(sCodTipoContrato) + #13;
  end;

  sSql := sSql + ' ORDER BY ' + #13 + '   TC.SIGLA ';

  Result := GetDataPacket( sSql );
end;

end.
