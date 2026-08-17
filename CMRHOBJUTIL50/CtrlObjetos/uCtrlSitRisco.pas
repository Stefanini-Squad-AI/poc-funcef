{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlSitRisco;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbSitRiscoFGTS;

type
  TCtrlSitRisco = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbSitRiscoFGTS;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdSitRisco: double = -2): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlSitRisco }

constructor TCtrlSitRisco.Create;
begin
  inherited;
  FDb := TDbSitRiscoFGTS.Create(Self);
end;

destructor TCtrlSitRisco.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlSitRisco.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlSitRisco.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlSitRisco.ListGeral(IdSitRisco: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdSitRisco=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDSITRISCO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  SITRISCOFGTS'+CR_LF+
    IFF(IdSitRisco=-1, 'WHERE (1 = 2)',
      IFF(IdSitRisco=-2, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDSITRISCO = '+FloatToStr(IdSitRisco)+')')));
end;

function TCtrlSitRisco.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarSitRisco(FCds.Data);
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
