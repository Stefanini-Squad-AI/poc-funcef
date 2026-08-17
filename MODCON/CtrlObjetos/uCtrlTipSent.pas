{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipSent;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbTipoSentenca;

type
  TCtrlTipSent = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTipoSentenca;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(CodTipoSent: real): OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uFuncoesUteis;

{ TCtrlTipSent }

constructor TCtrlTipSent.Create;
begin
  inherited;
  FDb := TDbTipoSentenca.Create(Self);
end;

destructor TCtrlTipSent.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlTipSent.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipSent.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlTipSent.ListGeral(CodTipoSent: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodTipoSent=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  CodTipoSent, Descricao'+CR_LF+
    'FROM'+CR_LF+
    '  TipoSentenca'+CR_LF+
    IFF(CodTipoSent=-1, 'WHERE (1 = 2)',
        IFF(CodTipoSent=0, '', 'WHERE'+CR_LF+
            '  (CodTipoSent = '+FloatToStr(CodTipoSent)+')')));
end;

function TCtrlTipSent.Gravar: boolean;
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
