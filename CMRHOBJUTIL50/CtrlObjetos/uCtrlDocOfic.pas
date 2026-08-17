{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 18/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlDocOfic;

interface

uses SysUtils, DB, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbTipoDocOficial;

type
  TCtrlDocOfic = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDocOfic: TDbTipoDocOficial;
    FCdsDocOfic: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListDocOfic(CodDocumento: string = ''): OleVariant;

    function GetIdDocumento(Sigla: string): double;

    function DocumentoJaSelecionado(CodDocumento, IdDocumento: string): boolean;

    function GravarDocOfic: boolean;

    property CdsDocOfic: TCMClientDataSet read FCdsDocOfic write FCdsDocOfic;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlDocOfic }

constructor TCtrlDocOfic.Create;
begin
  inherited;
  FDbDocOfic := TDbTipoDocOficial.Create(Self);
end;

destructor TCtrlDocOfic.Destroy;
begin
  FDbDocOfic.Free;
  if (IsAppServer) then
    FCdsDocOfic.Free;
  inherited;
end;

procedure TCtrlDocOfic.OnCreateAppServer;
begin
  inherited;
  FCdsDocOfic := TCMClientDataSet.Create(nil);
end;

procedure TCtrlDocOfic.DoChangeDataBase;
begin
  inherited;
  FDbDocOfic.DataBaseName := DataBaseName;
end;

function TCtrlDocOfic.ListDocOfic(CodDocumento: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(CodDocumento='-1',' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  CODDOCUMENTO, IDDOCUMENTO, SIGLADOCUMENTO'+CR_LF+
    'FROM'+CR_LF+
    '  TIPODOCOFICIAL'+CR_LF+
    IFF(CodDocumento='-1', 'WHERE (1 = 2)',
      IFF(CodDocumento='', 'ORDER BY'+CR_LF+'  UPPER(SIGLADOCUMENTO)', 'WHERE'+CR_LF+
        '  (CODDOCUMENTO = ' +QuotedStr(CodDocumento)+ ')')));
end;

function TCtrlDocOfic.DocumentoJaSelecionado(CodDocumento, IdDocumento: string): boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT CODDOCUMENTO'+CR_LF+
    'FROM   TIPODOCOFICIAL'+CR_LF+
    'WHERE  (IDDOCUMENTO   = ' +IdDocumento+ ') AND'+CR_LF+
    '       (CODDOCUMENTO <> ' +CodDocumento+ ')');

  Result := not(_CdsAux.IsEmpty);

  _CdsAux.Free;
end;

function TCtrlDocOfic.GetIdDocumento(Sigla: string): double;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT TDO.IDDOCUMENTO'+CR_LF+
    'FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO'+CR_LF+
    'WHERE (TDO.SIGLADOCUMENTO = '+QuotedStr(Sigla+':')+') AND'+CR_LF+
    '      (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO)');

  Result := _CdsAux.FieldByName('IDDOCUMENTO').asFloat;

  _CdsAux.Free;
end;

function TCtrlDocOfic.GravarDocOfic: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarDocOfic(FCdsDocOfic.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsDocOfic, FDbDocOfic, [], []);
      if not(Result) then
        raise Exception.Create(FDbDocOfic.MessageInfo);

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
