{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 24/05/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlGrupoFatorAval;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbGrupoFatorAval;

type
  TCtrlGrupoFatorAval = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbGrupoFatorAval;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListGrupoFatorAval(IdGrupoFatorAval: double = 0): OleVariant;

    function GravarGrupoFatorAval: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlGrupoFatorAval }

constructor TCtrlGrupoFatorAval.Create;
begin
  inherited;
  FDb := TDbGrupoFatorAval.Create(Self);
end;

destructor TCtrlGrupoFatorAval.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlGrupoFatorAval.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlGrupoFatorAval.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlGrupoFatorAval.ListGrupoFatorAval(IdGrupoFatorAval: double): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (IdGrupoFatorAval = -1) then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL +CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  GRUPOFATORAVAL'+CR_LF;

  if (IdGrupoFatorAval = -1) then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (1 = 2)'
  else
  if (IdGrupoFatorAval > 0) then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (IDGRUPOFATORAVAL = '+FloatToStr(IdGrupoFatorAval)+')'
  else
    sSQL := sSQL +
      'ORDER BY'+CR_LF+
      '  DESCRICAO';

  Result := GetDataPacket(sSQL);
end;

function TCtrlGrupoFatorAval.GravarGrupoFatorAval: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarGrupoFatorAval(FCds.Data);
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
