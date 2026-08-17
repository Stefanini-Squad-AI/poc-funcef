{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTRT;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbTRT;

type
  TCtrlTRT = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTRT;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(CodigoTRT: real): OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uFuncoesUteis;

{ TCtrlTRT }

constructor TCtrlTRT.Create;
begin
  inherited;
  FDb := TDbTRT.Create(Self);
end;

destructor TCtrlTRT.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlTRT.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTRT.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlTRT.ListGeral(CodigoTRT: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodigoTRT=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  CodigoTRT, Descricao, RegiaoTRT'+CR_LF+
    'FROM'+CR_LF+
    '  TRT'+CR_LF+
    IFF(CodigoTRT=-1, 'WHERE (1 = 2)',
        IFF(CodigoTRT=0, '', 'WHERE'+CR_LF+
            '  (CodigoTRT = '+FloatToStr(CodigoTRT)+')')));
end;

function TCtrlTRT.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := ApplyCds(FCds, FDb, [], []);
      if not(Result) then
        MessageInfo := FDb.MessageInfo;
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
