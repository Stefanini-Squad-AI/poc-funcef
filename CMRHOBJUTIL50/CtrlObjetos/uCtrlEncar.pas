{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 07/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlEncar;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMClientDataSet,
  uCtrlCustomRH, uDbEncargo;

type
  TCtrlEncar = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;    
  private
    FDb: TDbEncargo;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(IdEncargo: double = 0): OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlEncar }

constructor TCtrlEncar.Create;
begin
  inherited;
  FDb := TDbEncargo.Create(Self);
end;

destructor TCtrlEncar.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlEncar.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlEncar.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlEncar.ListGeral(IdEncargo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdEncargo=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDENCARGO, DESCRENCARGO, PERCENCARGO'+CR_LF+
    'FROM'+CR_LF+
    '  ENCARGO'+CR_LF+
    IFF(IdEncargo=-1, 'WHERE (1 = 2)',
      IFF(IdEncargo=0, 'ORDER BY'+CR_LF+'  UPPER(DESCRENCARGO)', 'WHERE'+CR_LF+
        '  (IDENCARGO = ' +FloatToStr(IdEncargo)+ ')')));
end;

function TCtrlEncar.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarEncargo(FCds.Data);
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
