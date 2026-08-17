{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 24/02/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlEstacaoAcesso;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlCustomRH,
  uDbEstacaoAcesso;

type
  TCtrlEstacaoAcesso = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbEstacaoAcesso: TDbEstacaoAcesso;
    FCdsEstacaoAcesso: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListEstacaoAcesso(IdEstacaoAcesso: double; Estacao: string = ''): OleVariant;

    function GravarEstacaoAcesso: boolean;

    function GetExisteEstacaoAcesso(const Estacao: string;
      const IdEstAcesso: double): boolean;

    property CdsEstacaoAcesso: TCMClientDataSet read FCdsEstacaoAcesso write FCdsEstacaoAcesso;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlEstacaoAcesso }

constructor TCtrlEstacaoAcesso.Create;
begin
  inherited;
  FDbEstacaoAcesso := TDbEstacaoAcesso.Create(Self);
end;

destructor TCtrlEstacaoAcesso.Destroy;
begin
  FDbEstacaoAcesso.Free;
  if (IsAppServer) then
    FCdsEstacaoAcesso.Free;
  inherited;
end;

procedure TCtrlEstacaoAcesso.OnCreateAppServer;
begin
  inherited;
  FCdsEstacaoAcesso := TCMClientDataSet.Create(nil);
end;

procedure TCtrlEstacaoAcesso.DoChangeDataBase;
begin
  inherited;
  FDbEstacaoAcesso.DataBaseName := DataBaseName;
end;

function TCtrlEstacaoAcesso.ListEstacaoAcesso(IdEstacaoAcesso: double; Estacao: string): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (IdEstacaoAcesso = -1) then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL +
    '  * '+
    'FROM'+
    '  ESTACAOACESSO';

  if (IdEstacaoAcesso = -1) then
    sSQL := sSQL +
      ' WHERE'+
      '  (1 = 2)'
  else
  begin
    if (IdEstacaoAcesso > 0) or (Estacao <> '') then
      sSQL := sSQL + ' WHERE ';

    if (IdEstacaoAcesso > 0) then
      sSQL := sSQL + '  (IDESTACAOACESSO = ' +FloatToStr(IdEstacaoAcesso)+ ')';

    if (Estacao <> '') then
      sSQL := sSQL +FU.IFF(IdEstacaoAcesso>0, ' AND', '')+
        '  (ESTACAO = ' +QuotedStr(Estacao)+ ')'
  end;

  sSQL := sSQL +
    ' ORDER BY'+
    '  ESTACAO';

  Result := GetDataPacket(sSQL);
end;

function TCtrlEstacaoAcesso.GravarEstacaoAcesso: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarEstacaoAcesso(FCdsEstacaoAcesso.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      
      Result := ApplyCds(FCdsEstacaoAcesso, FDbEstacaoAcesso, [], []);
      if not(Result) then
        raise Exception.Create(FDbEstacaoAcesso.MessageInfo);

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

function TCtrlEstacaoAcesso.GetExisteEstacaoAcesso(const Estacao: string;
  const IdEstAcesso: double): boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT IDESTACAOACESSO' +CR_LF+
      'FROM   ESTACAOACESSO' +CR_LF+
      'WHERE  (ESTACAO          = ' +QuotedStr(Estacao)+ ') AND' +CR_LF+
      '       (IDESTACAOACESSO <> ' +FloatToStr(IdEstAcesso)+ ')');
    Result := not(_CdsAux.IsEmpty);
  finally
    _CdsAux.Free;
  end;
end;

end.
