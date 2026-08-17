{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlMotivo;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbMotivo;

type
  TCtrlMotivo = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbMotivo;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListGeral(IdMotivo: integer = 0; IdMovContrCAGED: integer = 0;
      GrupoMotivo: string = ''; FlgTipo: string = ''): OleVariant;
    function ListMotivo_Id_e_Descricao(ListaGrupoMotivo: string = '';
      ListaFlgTipo: string = ''): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlMotivo }

constructor TCtrlMotivo.Create;
begin
  inherited;
  FDb := TDbMotivo.Create(Self);
end;

destructor TCtrlMotivo.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlMotivo.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlMotivo.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlMotivo.ListGeral(IdMotivo, IdMovContrCAGED: integer; GrupoMotivo,
  FlgTipo: string): OleVariant;
var
  sSQL: string;
begin
  // Se qualquer um dos parâmetros for igual a (-1), não é para trazer registro algum
  if (IdMotivo = -1) or (IdMovContrCAGED = -1) or (GrupoMotivo = '-1') or (FlgTipo = '-1') then
    sSQL := 'WHERE (1 = 2)'
  else // Se não, faz as seleções cabíveis
  begin
    sSQL := '';
    if (IdMotivo <> 0) then
      sSQL := '  (IDMOTIVO = '+IntToStr(IdMotivo)+')'+CR_LF;

    if (IdMovContrCAGED <> 0) then
      sSQL := sSQL+IFF(sSQL<>'','AND ','    ')+'(IDMOVCONTRCAGED = '+IntToStr(IdMovContrCAGED)+')'+CR_LF;

    if (GrupoMotivo <> '') then
      sSQL := sSQL+IFF(sSQL<>'','AND ','    ')+'(GRUPOMOTIVO = '+QuotedStr(GrupoMotivo)+')'+CR_LF;

    if (FlgTipo <> '') then
      sSQL := sSQL+IFF(sSQL<>'','AND ','    ')+'(FLGTIPO = '+QuotedStr(FlgTipo)+')'+CR_LF;

    if (sSQL <> '') then
      sSQL := 'WHERE '+sSQL;

    sSQL := sSQL + 'ORDER BY' +CR_LF+ '  DESCRICAO';
  end;

  Result := GetDataPacket(
    'SELECT'+IFF(sSQL='WHERE (1 = 2)',' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  MOTIVO'+CR_LF+
    sSQL);
end;

function TCtrlMotivo.ListMotivo_Id_e_Descricao(ListaGrupoMotivo, ListaFlgTipo: string): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (ListaGrupoMotivo <> '') then
  begin
    sSQL := 'WHERE' +CR_LF+ '  (GRUPOMOTIVO ';
    if (Pos(',', ListaGrupoMotivo) > 0) then
      sSQL := sSQL + 'IN (' + QuotedListaString(ListaGrupoMotivo, ',') + '))'
    else
      sSQL := sSQL + '= ' + QuotedListaString(ListaGrupoMotivo, ',') + ')';
  end;

  if (ListaFlgTipo <> '') then
  begin
    if (sSQL = '') then
      sSQL := 'WHERE' +CR_LF+ '  (FLGTIPO '
    else
      sSQL := ' AND (FLGTIPO ';
    if (Pos(',', ListaFlgTipo) > 0) then
      sSQL := sSQL + 'IN (' + QuotedListaString(ListaFlgTipo, ',') + '))'
    else
      sSQL := sSQL + '= ' + QuotedListaString(ListaFlgTipo, ',') + ')';
  end;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDMOTIVO, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  MOTIVO'+CR_LF+
    sSQL+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlMotivo.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarMotivo(FCds.Data);
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
