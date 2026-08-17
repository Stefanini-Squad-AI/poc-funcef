{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlVara;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbVaraJustica;

type
  TCtrlVara = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbVaraJustica;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(IdVaraJustica: real): OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uFuncoesUteisRH;

{ TCtrlVara }

constructor TCtrlVara.Create;
begin
  inherited;
  FDb := TDbVaraJustica.Create(Self);
end;

destructor TCtrlVara.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlVara.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlVara.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlVara.ListGeral(IdVaraJustica: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdVaraJustica=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IdVaraJustica, Descricao'+CR_LF+
    'FROM'+CR_LF+
    '  VaraJustica'+CR_LF+
    IFF(IdVaraJustica=-1, 'WHERE (1 = 2)',
        IFF(IdVaraJustica=0, '', 'WHERE'+CR_LF+
            '  (IdVaraJustica = '+FloatToStr(IdVaraJustica)+')')));
end;

function TCtrlVara.Gravar: boolean;
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
      Result := ApplyCds(FCds, FDb, [], []);
      if not(Result) then
        MessageInfo := FDb.MessageInfo;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
