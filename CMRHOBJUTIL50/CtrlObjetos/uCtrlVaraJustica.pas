{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlVaraJustica;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbVaraJustica;

type
  TCtrlVaraJustica = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbVaraJustica: TDbVaraJustica;
    FCdsVaraJustica: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListVaraJustica(IdVaraJustica: double = 0): OleVariant;
    function ListVarasDoModulo(IdModulo: integer): OleVariant;

    function GravarVaraJustica: boolean;

    property CdsVaraJustica: TCMClientDataSet read FCdsVaraJustica write FCdsVaraJustica;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlVara }

constructor TCtrlVaraJustica.Create;
begin
  inherited;
  FDbVaraJustica := TDbVaraJustica.Create(Self);
end;

destructor TCtrlVaraJustica.Destroy;
begin
  FDbVaraJustica.Free;
  if (IsAppServer) then
    FCdsVaraJustica.Free;
  inherited;
end;

procedure TCtrlVaraJustica.OnCreateAppServer;
begin
  inherited;
  FCdsVaraJustica := TCMClientDataSet.Create(nil);
end;

procedure TCtrlVaraJustica.DoChangeDataBase;
begin
  inherited;
  FDbVaraJustica.DataBaseName := DataBaseName;
end;

function TCtrlVaraJustica.ListVaraJustica(IdVaraJustica: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdVaraJustica=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  V.IDVARAJUSTICA, V.DESCRICAO, V.IDESTADO, E.CODESTADO, E.NOMEESTADO'+CR_LF+
    'FROM'+CR_LF+
    '  VARAJUSTICA V, ESTADO E'+CR_LF+
    'WHERE V.IDESTADO = E.IDESTADO(+)'+CR_LF+
    IFF(IdVaraJustica=-1, 'AND (1 = 2)',
      IFF(IdVaraJustica=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'AND'+CR_LF+
        '  (IDVARAJUSTICA = ' +FloatToStr(IdVaraJustica)+ ')')));
end;

function TCtrlVaraJustica.ListVarasDoModulo(IdModulo: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '  V.IDVARAJUSTICA, V.DESCRICAO, E.CODESTADO, E.NOMEESTADO'+CR_LF+
    'FROM'+CR_LF+
    '  VARAJUSTICA V, PROCESSOTRAB P, ESTADO E'+CR_LF+
    'WHERE'+CR_LF+
    '  (V.IDVARAJUSTICA = P.IDVARAJUSTICA) AND'+CR_LF+
    '  (V.IDESTADO      = E.IDESTADO(+)) AND'+CR_LF+
    '  (P.INDMATERIA  ' +
    IFF(IdModulo=MODCON,' = 1',IFF(IdModulo=PROCPREV,'IN (2,3)',IFF(IdModulo=PROCJUD,'IN (4,5,6,7)',' > 0')))+ ')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(V.DESCRICAO)');
end;

function TCtrlVaraJustica.GravarVaraJustica: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarVaraJustica(FCdsVaraJustica.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsVaraJustica, FDbVaraJustica, [], []);
      if not(Result) then
        Exception.Create(FDbVaraJustica.MessageInfo);

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
