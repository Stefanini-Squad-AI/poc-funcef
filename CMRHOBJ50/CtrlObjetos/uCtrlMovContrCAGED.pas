{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 01/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlMovContrCAGED;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbMovContrCAGED;

type
  TCtrlMovContrCAGED = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbMovContrCAGED;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListGeral(IdMovContrCAGED: integer = 0): OleVariant;

    function Gravar: boolean;    

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlMovContrCAGED }

constructor TCtrlMovContrCAGED.Create;
begin
  inherited;
  FDb := TDbMovContrCAGED.Create(Self);
end;

destructor TCtrlMovContrCAGED.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlMovContrCAGED.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlMovContrCAGED.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlMovContrCAGED.ListGeral(IdMovContrCAGED: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdMovContrCAGED=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDMOVCONTRCAGED, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  MOVCONTRCAGED'+CR_LF+
    IFF(IdMovContrCAGED=-1, 'WHERE (1 = 2)',
      IFF(IdMovContrCAGED=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDMOVCONTRCAGED = '+FloatToStr(IdMovContrCAGED)+')')));
end;

function TCtrlMovContrCAGED.Gravar: boolean;
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
