{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipProc;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbTipoProcesso;

type
  TCtrlTipProc = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTipoProcesso;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(IdTipoProc: real): OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uFuncoesUteis;

{ TCtrlTipProc }

constructor TCtrlTipProc.Create;
begin
  inherited;
  FDb := TDbTipoProcesso.Create(Self);
end;

destructor TCtrlTipProc.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlTipProc.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipProc.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlTipProc.ListGeral(IdTipoProc: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdTipoProc=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IdTipoProc, NomeTipoProc, ProcFixo'+CR_LF+
    'FROM'+CR_LF+
    '  TipoProcesso'+CR_LF+
    IFF(IdTipoProc=-1, 'WHERE (1 = 2)',
        IFF(IdTipoProc=0, '', 'WHERE'+CR_LF+
            '  (IdTipoProc = '+FloatToStr(IdTipoProc)+')')));
end;

function TCtrlTipProc.Gravar: boolean;
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
