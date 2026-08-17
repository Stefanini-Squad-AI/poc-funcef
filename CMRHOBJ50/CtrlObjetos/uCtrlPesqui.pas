{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 07/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPesqui;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbPesqiSal;

type
  TCtrlPesqui = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;    
  private
    FDb: TDbPesqiSal;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(IdPesqSalar: real): OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uFuncoesUteis;

{ TCtrlPesqui }

constructor TCtrlPesqui.Create;
begin
  inherited;
  FDb := TDbPesqiSal.Create(Self);
end;

destructor TCtrlPesqui.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlPesqui.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlPesqui.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlPesqui.ListGeral(IdPesqSalar: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdPesqSalar=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IdPesqSalar, NomePesqSalar, DataRefPesq'+CR_LF+
    'FROM'+CR_LF+
    '  PesqiSal'+CR_LF+
    IFF(IdPesqSalar=-1, 'WHERE (1 = 2)',
        IFF(IdPesqSalar=0, '', 'WHERE'+CR_LF+
            '  (IdPesqSalar = '+FloatToStr(IdPesqSalar)+')')));
end;

function TCtrlPesqui.Gravar: boolean;
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
