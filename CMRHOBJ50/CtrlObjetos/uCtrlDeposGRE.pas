{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlDeposGRE;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbDeposGRE;

type
  TCtrlDeposGRE = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;    
  private
    FDb: TDbDeposGRE;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListGeral(IdDeposGRE: double = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlDeposGRE }

constructor TCtrlDeposGRE.Create;
begin
  inherited;
  FDb := TDbDeposGRE.Create(Self);
end;

destructor TCtrlDeposGRE.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlDeposGRE.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlDeposGRE.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlDeposGRE.ListGeral(IdDeposGRE: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdDeposGRE=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IdDeposGRE, Descricao, TipoContrato'+CR_LF+
    'FROM'+CR_LF+
    '  DeposGRE'+CR_LF+
    IFF(IdDeposGRE=-1, 'WHERE (1 = 2)',
      IFF(IdDeposGRE=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IdDeposGRE = '+FloatToStr(IdDeposGRE)+')')));
end;

function TCtrlDeposGRE.Gravar: boolean;
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
