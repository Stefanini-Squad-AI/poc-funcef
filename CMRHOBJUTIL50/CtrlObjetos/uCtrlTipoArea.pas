unit uCtrlTipoArea;

interface

uses SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH, uDbTipoArea;

type
  TCtrlTipoArea = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbTipoArea: TDbTipoArea;

    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function AplicaOperacao: boolean;
    function Procurar(IdTipoArea: double): OleVariant;
    function ListaTipoArea: OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTipoArea }

constructor TCtrlTipoArea.Create;
begin
  inherited;
  FDbTipoArea := TDbTipoArea.Create(Self);
end;

destructor TCtrlTipoArea.Destroy;
begin
  FDbTipoArea.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlTipoArea.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipoArea.DoChangeDataBase;
begin
  inherited;
  FDbTipoArea.DataBaseName := DataBaseName;
end;

function TCtrlTipoArea.Procurar(IdTipoArea: double): OleVariant;
begin
  FDbTipoArea.IdTipoArea.asFloat := IdTipoArea;
  Result := GetDataPacket(FDbTipoArea.sSQLSelect);
end;

function TCtrlTipoArea.ListaTipoArea: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDTIPOAREA, DESCTIPOAREA'+CR_LF+
    'FROM'+CR_LF+
    '  TIPOAREA'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCTIPOAREA');
end;

function TCtrlTipoArea.AplicaOperacao: Boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.AplicaOperacaoTipoArea(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCds, FDbTipoArea, [], []);
      if not(Result) then
        raise Exception.Create(FDbTipoArea.MessageInfo);

      Commit;
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
