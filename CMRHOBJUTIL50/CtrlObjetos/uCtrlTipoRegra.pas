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

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMClientDataSet,
  uCtrlCustomRH, uDbTipoRegra;

type
  TCtrlTipoRegra = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTipoRegra;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdTipoRegra: double = 0): OleVariant;
    function ListGrupoRegra: OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

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

  sSQL := sSQL +CR_LF+
    '  IDTIPOREGRA, DESCREGRA, IDGRUPOREGRA, SQLREGRA' +CR_LF+
    'FROM' +CR_LF+
    '  TIPOREGRA' +CR_LF;

  if (IdTipoRegra = -1) then
    sSQL := sSQL + 'WHERE (1 = 2)'
  else
  begin
    if (IdTipoRegra = 0) then
      sSQL := sSQL +
        'ORDER BY' +CR_LF+
        '  DESCREGRA'
    else
      sSQL := sSQL +
        'WHERE'+CR_LF+
        '  (IDTIPOREGRA = ' +FloatToStr(IdTipoRegra)+ ')';
  end;
  Result := GetDataPacket(sSQL);
end;

function TCtrlTipoRegra.ListGrupoRegra: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDGRUPOREGRA, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  GRUPOREGRA'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlTipoRegra.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTipoRegra(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCds, FDb, [], []);
      if not(Result) then
        MessageInfo := FDb.MessageInfo;

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