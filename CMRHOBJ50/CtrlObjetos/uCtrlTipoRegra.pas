{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 20/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlTipoRegra;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbTipoRegra;

type
  TCtrlTipoRegra = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTipoRegra;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(IdTipoRegra: double = 0): OleVariant;
    function ListGrupoRegra: OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes;

{ TCtrlTipoRegra }

constructor TCtrlTipoRegra.Create;
begin
  inherited;
  FDb := TDbTipoRegra.Create(Self);
end;

destructor TCtrlTipoRegra.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlTipoRegra.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTipoRegra.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlTipoRegra.ListGeral(IdTipoRegra: double): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (IdTipoRegra = -1) then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL +#13+
    '  IDTIPOREGRA, DESCREGRA, IDGRUPOREGRA, SQLREGRA' +#13+
    'FROM' +#13+
    '  TIPOREGRA' +#13;

  if (IdTipoRegra = -1) then
    sSQL := sSQL + 'WHERE (1 = 2)'
  else
  begin
    if (IdTipoRegra = 0) then
      sSQL := sSQL +
        'ORDER BY' +#13+
        '  DESCREGRA'
    else
      sSQL := sSQL +
        'WHERE'+#13+
        '  (IDTIPOREGRA = ' +FloatToStr(IdTipoRegra)+ ')';
  end;
  Result := GetDataPacket(sSQL);
end;

function TCtrlTipoRegra.ListGrupoRegra: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+#13+
    '  IDGRUPOREGRA, DESCRICAO'+#13+
    'FROM'+#13+
    '  GRUPOREGRA'+#13+
    'ORDER BY'+#13+
    '  DESCRICAO');
end;

function TCtrlTipoRegra.Gravar: boolean;
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
