{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPpraMeio;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbPpraMeio;

type
  TCtrlPpraMeio = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbPpraMeio;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListGeral(IdPpraMeio: double = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlPpraMeio }

constructor TCtrlPpraMeio.Create;
begin
  inherited;
  FDb := TDbPpraMeio.Create(Self);
end;

destructor TCtrlPpraMeio.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlPpraMeio.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlPpraMeio.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlPpraMeio.ListGeral(IdPpraMeio: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdPpraMeio=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDPPRAMEIO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PPRAMEIO'+CR_LF+
    IFF(IdPpraMeio=-1, 'WHERE (1 = 2)',
      IFF(IdPpraMeio=0, 'ORDER BY' +CR_LF+ '  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDPPRAMEIO = ' +FloatToStr(IdPpraMeio)+ ')')));
end;

function TCtrlPpraMeio.Gravar: boolean;
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
