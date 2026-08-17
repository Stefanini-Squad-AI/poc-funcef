{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlRubCLT;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbRubCLT;

type
  TCtrlRubCLT = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbRubCLT;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(CodRubCLT: string = ''): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlRubCLT }

constructor TCtrlRubCLT.Create;
begin
  inherited;
  FDb := TDbRubCLT.Create(Self);
end;

destructor TCtrlRubCLT.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlRubCLT.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRubCLT.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlRubCLT.ListGeral(CodRubCLT: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodRubCLT='-1',' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  CODRUBCLT, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICACLT'+CR_LF+
    IFF(CodRubCLT='-1', 'WHERE (1 = 2)',
      IFF(CodRubCLT='', '', 'WHERE'+CR_LF+
        '  (CODRUBCLT = ' +QuotedStr(CodRubCLT)+ ')')));
end;

function TCtrlRubCLT.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarRubCLT(FCds.Data);
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
