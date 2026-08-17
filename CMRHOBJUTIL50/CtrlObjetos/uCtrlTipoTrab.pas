{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipoTrab;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMClientDataSet,
  uCtrlCustomRH, uDbTipoTrabalhador;

type
  TCtrlTipoTrab = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTipoTrabalhador;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdTipoTrab: integer = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTipoTrab }

constructor TCtrlTipoTrab.Create;
begin
  inherited;
  FDb := TDbTipoTrabalhador.Create(Self);
end;

destructor TCtrlTipoTrab.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlTipoTrab.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipoTrab.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlTipoTrab.ListGeral(IdTipoTrab: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdTipoTrab=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDTIPOTRAB, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  TIPOTRABALHADOR'+CR_LF+
    IFF(IdTipoTrab=-1, 'WHERE (1 = 2)',
      IFF(IdTipoTrab=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDTIPOTRAB = ' +IntToStr(IdTipoTrab)+ ')')));
end;

function TCtrlTipoTrab.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTipoTrab(FCds.Data);
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
