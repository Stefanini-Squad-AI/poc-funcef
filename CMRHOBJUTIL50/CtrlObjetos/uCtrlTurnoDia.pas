{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTurnoDia;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMClientDataSet,
  uCtrlCustomRH, uDbTurnoDia;

type
  TCtrlTurnoDia = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTurnoDia;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListTurnoDiario(IdTurnoDiario: integer = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTurnoDia }

constructor TCtrlTurnoDia.Create;
begin
  inherited;
  FDb := TDbTurnoDia.Create(Self);
end;

destructor TCtrlTurnoDia.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlTurnoDia.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTurnoDia.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlTurnoDia.ListTurnoDiario(IdTurnoDiario: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdTurnoDiario=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  TURNODIA'+CR_LF+
    IFF(IdTurnoDiario=-1, 'WHERE (1 = 2)',
      IFF(IdTurnoDiario=0,
        'ORDER BY'+CR_LF+
        '  INICIOEXPEDIENTE, INICIOALMOCO, FINALALMOCO, FINALEXPEDIENTE',
        'WHERE'+CR_LF+
        '  (IDTURNODIARIO = '+FloatToStr(IdTurnoDiario)+')')));
end;

function TCtrlTurnoDia.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTurnoDia(FCds.Data);
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
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
