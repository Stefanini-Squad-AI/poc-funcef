{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlVincEmpr;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbVincEmpregRAIS;

type
  TCtrlVincEmpr = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbVincEmpregRAIS;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdVincEmpreg: double = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlVincEmpr }

constructor TCtrlVincEmpr.Create;
begin
  inherited;
  FDb := TDbVincEmpregRAIS.Create(Self);
end;

destructor TCtrlVincEmpr.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlVincEmpr.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlVincEmpr.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlVincEmpr.ListGeral(IdVincEmpreg: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdVincEmpreg=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDVINCEMPREG, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  VINCEMPREGRAIS'+CR_LF+
    IFF(IdVincEmpreg=-1, 'WHERE (1 = 2)',
      IFF(IdVincEmpreg=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDVINCEMPREG = ' +FloatToStr(IdVincEmpreg)+ ')')));
end;

function TCtrlVincEmpr.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarVincEmpr(FCds.Data);
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
