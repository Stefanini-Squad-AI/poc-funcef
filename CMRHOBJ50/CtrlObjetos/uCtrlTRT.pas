{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTRT;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbTRT;

type
  TCtrlTRT = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbTRT: TDbTRT;
    FCdsTRT: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListTRT(CodigoTRT: double = 0): OleVariant;

    function GravarTRT: boolean;

    property CdsTRT: TCMClientDataSet read FCdsTRT write FCdsTRT;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTRT }

constructor TCtrlTRT.Create;
begin
  inherited;
  FDbTRT := TDbTRT.Create(Self);
end;

destructor TCtrlTRT.Destroy;
begin
  FDbTRT.Free;
  if (IsAppServer) then
    FCdsTRT.Free;
  inherited;
end;

procedure TCtrlTRT.OnCreateAppServer;
begin
  inherited;
  FCdsTRT := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTRT.DoChangeDataBase;
begin
  inherited;
  FDbTRT.DataBaseName := DataBaseName;
end;

function TCtrlTRT.ListTRT(CodigoTRT: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodigoTRT=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  CODIGOTRT, DESCRICAO, REGIAOTRT'+CR_LF+
    'FROM'+CR_LF+
    '  TRT'+CR_LF+
    IFF(CodigoTRT=-1, 'WHERE (1 = 2)',
      IFF(CodigoTRT=0, 'ORDER BY'+CR_LF+'DESCRICAO', 'WHERE'+CR_LF+
        '  (CODIGOTRT = ' +FloatToStr(CodigoTRT)+ ')')));
end;

function TCtrlTRT.GravarTRT: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTRT(FCdsTRT.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsTRT, FDbTRT, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbTRT.MessageInfo);
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
