{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipAcao;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbTipoAcaoProcJur;

type
  TCtrlTipAcao = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTipoAcaoProcJur;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(IdTipoAcao: real): OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uFuncoesUteis;

{ TCtrlTipAcao }

constructor TCtrlTipAcao.Create;
begin
  inherited;
  FDb := TDbTipoAcaoProcJur.Create(Self);
end;

destructor TCtrlTipAcao.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlTipAcao.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipAcao.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlTipAcao.ListGeral(IdTipoAcao: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdTipoAcao=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IdTipoAcao, Descricao'+CR_LF+
    'FROM'+CR_LF+
    '  TipoAcaoProcJur'+CR_LF+
    IFF(IdTipoAcao=-1, 'WHERE (1 = 2)',
        IFF(IdTipoAcao=0, '', 'WHERE'+CR_LF+
            '  (IdTipoAcao = '+FloatToStr(IdTipoAcao)+')')));
end;

function TCtrlTipAcao.Gravar: boolean;
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
