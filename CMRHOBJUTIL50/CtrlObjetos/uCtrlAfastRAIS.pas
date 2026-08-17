{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlAfastRAIS;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbAfastRAIS;

type
  TCtrlAfastRAIS = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbAfastRAIS;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListGeral(IdAfastRAIS: double = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlAfastRAIS }

constructor TCtrlAfastRAIS.Create;
begin
  inherited;
  FDb := TDbAfastRAIS.Create(Self);
end;

destructor TCtrlAfastRAIS.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlAfastRAIS.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlAfastRAIS.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlAfastRAIS.ListGeral(IdAfastRAIS: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdAfastRAIS=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDAFASTRAIS, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  AFASTRAIS'+CR_LF+
    IFF(IdAfastRAIS=-1, 'WHERE (1 = 2)',
      IFF(IdAfastRAIS=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDAFASTRAIS = '+FloatToStr(IdAfastRAIS)+')')));
end;

function TCtrlAfastRAIS.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarAfastRAIS(FCds.Data);
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
