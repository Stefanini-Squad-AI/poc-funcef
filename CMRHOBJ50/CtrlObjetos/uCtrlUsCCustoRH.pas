{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlUsCCustoRH;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbUsCCustoRH;

type
  TCtrlUsCCustoRH = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbUsCCustoRH;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListUsCCustoRH(IdUsuario: double): OleVariant;
    function ListEstabNaoHab(IdUsuario: double; IdEmpresa: integer): OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlUsCCustoRH }

constructor TCtrlUsCCustoRH.Create;
begin
  inherited;
  FDb := TDbUsCCustoRH.Create(Self);
end;

destructor TCtrlUsCCustoRH.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlUsCCustoRH.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlUsCCustoRH.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlUsCCustoRH.ListUsCCustoRH(IdUsuario: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  UC.IDUSUARIO, UC.IDEMPRESA, UC.CODCENTROCUSTO, UC.FLGSUPERVISOR, CC.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  USCCUSTORH UC, CENTCUST CC'+CR_LF+
    'WHERE'+CR_LF+
    '  (UC.IDUSUARIO      = ' +FloatToStr(IdUsuario)+ ') AND'+CR_LF+
    '  (UC.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'+CR_LF+
    '  (UC.IDEMPRESA      = CC.IDEMPRESA)');
end;

function TCtrlUsCCustoRH.ListEstabNaoHab(IdUsuario: double; IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODCENTROCUSTO, IDEMPRESA, NOME'+CR_LF+
    'FROM'+CR_LF+
    '  CENTCUST C, PARAMGLOBAL P'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDEMPRESA           = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (STATUSGRUPOCDC      = ''A'') AND'+CR_LF+
    '  (C.IDPLANCENTCUST    = P.IDPLANCENTCUST) AND'+CR_LF+
    '  (CODCENTROCUSTO NOT IN (SELECT CODCENTROCUSTO'+CR_LF+
    '                          FROM   USCCUSTORH'+CR_LF+
    '                          WHERE  (IDUSUARIO = ' +FloatToStr(IdUsuario)+ ') AND'+CR_LF+
    '                                 (IDEMPRESA = ' +IntToStr(IdEmpresa)+ ')))');
end;

function TCtrlUsCCustoRH.Gravar: boolean;
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
