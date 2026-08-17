{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlSitFunc;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbSitFunc;

type
  arChar = array of char;

  TCtrlSitFunc = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbSitFunc;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdSitFunc: integer = 0; TipoSit: string = '';
      FlgUso: string = ''; FlgInterno: string = ''): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlSitFunc }

constructor TCtrlSitFunc.Create;
begin
  inherited;
  FDb := TDbSitFunc.Create(Self);
end;

destructor TCtrlSitFunc.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlSitFunc.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlSitFunc.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlSitFunc.ListGeral(IdSitFunc: integer; TipoSit, FlgUso, FlgInterno: string): OleVariant;
var
  sWhere: string;
begin
  // Se qualquer um dos parâmetros for igual a (-1), não é para trazer registro algum
  if (IdSitFunc = -1) or (TipoSit = '-1') or (FlgUso = '-1') or (FlgInterno = '-1') then
    sWhere := 'WHERE (1 = 2)'
  else // Se não, faz as seleções cabíveis
  begin
    sWhere := '';
    if (IdSitFunc <> 0) then
      sWhere := sWhere + '  (IDSITFUNC = ' +IntToStr(IdSitFunc)+ ')' +CR_LF;

    if (TipoSit <> '') then
    begin
      if (sWhere = '') then
        sWhere := Replicate(' ', 4)
      else
        sWhere := sWhere + 'AND ';

      if (Pos(',',TipoSit) > 0) then
      begin
        TipoSit := QuotedListaString(TipoSit, ',');
        sWhere := sWhere+ '(TIPOSIT IN (' +TipoSit+ '))' +CR_LF;
      end
      else
        sWhere := sWhere+ '(TIPOSIT = ' +QuotedStr(TipoSit)+ ')' +CR_LF;
    end;

    if (FlgUso <> '') then
    begin
      if (sWhere = '') then
        sWhere := Replicate(' ', 4)
      else
        sWhere := sWhere + 'AND ';

      if (Pos(',',FlgUso) > 0) then
      begin
        FlgUso := QuotedListaString(FlgUso, ',');
        sWhere := sWhere+ '(FLGUSO IN (' +FlgUso+ '))' +CR_LF;
      end
      else
        sWhere := sWhere+ '(FLGUSO = ' +QuotedStr(FlgUso)+ ')' +CR_LF;
    end;

    if (FlgInterno <> '') then
    begin
      if (sWhere = '') then
        sWhere := Replicate(' ', 4)
      else
        sWhere := sWhere + 'AND ';

      if (Pos(',',FlgInterno) > 0) then
      begin
        FlgInterno := QuotedListaString(FlgInterno, ',');
        sWhere := sWhere+ '(FLGINTERNO IN (' +FlgInterno+ '))' +CR_LF;
      end
      else
        sWhere := sWhere+ '(FLGINTERNO = ' +QuotedStr(FlgInterno)+ ')' +CR_LF;
    end;

    if (sWhere <> '') then
      sWhere := CR_LF +'WHERE '+ sWhere;
  end;

  Result := GetDataPacket(
    'SELECT'+IFF(sWhere='WHERE (1 = 2)',' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  SITFUNC'+CR_LF+
    sWhere+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlSitFunc.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarSitFunc(FCds.Data);
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
