{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 01/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlSegAcidTrab;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,uCMClientDataSet,
  uCtrlCustomRH, uDbSegAcidTrab;

type
  TCtrlSegAcidTrab = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbSegAcidTrab;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdSegAcidTrab: integer = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlSegAcidTrab }

constructor TCtrlSegAcidTrab.Create;
begin
  inherited;
  FDb := TDbSegAcidTrab.Create(Self);
end;

destructor TCtrlSegAcidTrab.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlSegAcidTrab.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlSegAcidTrab.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlSegAcidTrab.ListGeral(IdSegAcidTrab: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdSegAcidTrab=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDSEGACIDTRAB, DESCRICAO, PERCSEGACIDTRAB'+CR_LF+
    'FROM'+CR_LF+
    '  SEGACIDTRAB'+CR_LF+
    IFF(IdSegAcidTrab=-1, 'WHERE (1 = 2)',
      IFF(IdSegAcidTrab=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDSEGACIDTRAB = '+IntToStr(IdSegAcidTrab)+')')));
end;

function TCtrlSegAcidTrab.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarSegAcidTrab(FCds.Data);
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
