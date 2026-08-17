{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlFormFGTS;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbFormaRescFGTS;

type
  TCtrlFormFGTS = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbFormaRescFGTS;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdFormaResc: double = -2): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlFormFGTS }

constructor TCtrlFormFGTS.Create;
begin
  inherited;
  FDb := TDbFormaRescFGTS.Create(Self);
end;

destructor TCtrlFormFGTS.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlFormFGTS.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlFormFGTS.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlFormFGTS.ListGeral(IdFormaResc: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdFormaResc=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDFORMARESC, DESCRICAO, FLGOPTANTE, CODDEPOSITO, CODOFICIAL'+CR_LF+
    'FROM'+CR_LF+
    '  FORMARESCFGTS'+CR_LF+
    IFF(IdFormaResc=-1, 'WHERE (1 = 2)',
      IFF(IdFormaResc=-2, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDFORMARESC = ' +FloatToStr(IdFormaResc)+ ')')));
end;

function TCtrlFormFGTS.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarFormFGTS(FCds.Data);
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
