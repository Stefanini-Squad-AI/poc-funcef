{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListGeral
Nº SOL......: 229873/16664
Nº PPM......: 570033
Data........: 11/12/2014
Responsável.: Felipe A. Santos
Descrição...: incluído o campo CodigoeSocial.
-------------------------------------------------------------------------------------------------- }

unit uCtrlPpraAgenteRisco;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbPpraAgenteRisco;

type
  TCtrlPpraAgenteRisco = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbPpraAgenteRisco;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListGeral(IdAgenteRisco: double = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlPpraAgenteRisco }

constructor TCtrlPpraAgenteRisco.Create;
begin
  inherited;
  FDb := TDbPpraAgenteRisco.Create(Self);
end;

destructor TCtrlPpraAgenteRisco.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlPpraAgenteRisco.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlPpraAgenteRisco.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlPpraAgenteRisco.ListGeral(IdAgenteRisco: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdAgenteRisco=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDAGENTERISCO, INDTIPO, DESCRICAO, '+CR_LF+
    '  CODIGOESOCIAL ' + // Felipe A. Santos SOL229873/16664 PPM 570033
    'FROM'+CR_LF+
    '  PPRAAGENTERISCO'+CR_LF+
    IFF(IdAgenteRisco=-1, 'WHERE (1 = 2)',
      IFF(IdAgenteRisco=0, 'ORDER BY' +CR_LF+ '  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDAGENTERISCO = ' +FloatToStr(IdAgenteRisco)+ ')')));
end;

function TCtrlPpraAgenteRisco.Gravar: boolean;
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
