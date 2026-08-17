{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlCID;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbCID;

type
  TCtrlCID = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbCID: TDbCID;
    FCdsCID: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function GravarCID: boolean;
    function ListCID(CodCID: string = ''): OleVariant;

    property CdsCID: TCMClientDataSet read FCdsCID write FCdsCID;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCID }

constructor TCtrlCID.Create;
begin
  inherited;
  FDbCID := TDbCID.Create(Self);
end;

destructor TCtrlCID.Destroy;
begin
  FDbCID.Free;
  if (IsAppServer) then
    FCdsCID.Free;
  inherited;
end;

procedure TCtrlCID.OnCreateAppServer;
begin
  inherited;
  FCdsCID := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCID.DoChangeDataBase;
begin
  inherited;
  FDbCID.DataBaseName := DataBaseName;
end;

function TCtrlCID.ListCID(CodCID: string): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (CodCID = '-1') then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL +CR_LF+
    '  CODCID, DESCRCID'+CR_LF+
    'FROM'+CR_LF+
    '  CID'+CR_LF;

  if (CodCID = '-1') then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (1 = 2)'
  else
  if (CodCID <> '') then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (CODCID = '+QuotedStr(CodCID)+')'
  else
  sSQL := sSQL +
    'ORDER BY'+CR_LF+
    '  DESCRCID';

  Result := GetDataPacket(sSQL);
end;

function TCtrlCID.GravarCID: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarCID(FCdsCID.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsCID, FDbCID, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbCID.MessageInfo);
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
