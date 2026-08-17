{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlCargo;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMClientDataSet,
  uCtrlCustomRH, uDbCargo;

type
  TCtrlCargo = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbCargo: TDbCargo;
    FCdsCargo: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;    

    function ListCargo(IdCargo: double = 0; IdFaixaSalarial: integer = 0;
      CodNivel: integer = 0; CBO: double = 0; CodGrpTrein: string = '';
      CodGrpFunc: string = ''): OleVariant;
    function ListCargoXGrupoFunc(IdCargo: double): OleVariant;
    function ListCargoXTendPesquisaSal(IdPesqSalar: double): OleVariant;
    function ListCargoXFunc: OleVariant;

    function GravarCargo: boolean;

    property CdsCargo: TCMClientDataSet read FCdsCargo write FCdsCargo;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCargo }

constructor TCtrlCargo.Create;
begin
  inherited;
  FDbCargo := TDbCargo.Create(Self);
end;

destructor TCtrlCargo.Destroy;
begin
  FDbCargo.Free;
  if (IsAppServer) then
    FCdsCargo.Free;
  inherited;
end;

procedure TCtrlCargo.OnCreateAppServer;
begin
  inherited;
  FCdsCargo := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCargo.DoChangeDataBase;
begin
  inherited;
  FDbCargo.DataBaseName := DataBaseName;
end;

function TCtrlCargo.ListCargo(IdCargo: double; IdFaixaSalarial, CodNivel: integer; CBO: double;
  CodGrpTrein, CodGrpFunc: string): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (IdCargo = -1) then
    sSQL := 'WHERE (1 = 2)'
  else
  begin
    if (IdCargo > 0) then
      sSQL := sSQL +
        '      (IDCARGO = ' +FloatToStr(IdCargo)+ ')'+CR_LF;

    if (CBO > 0) then
      sSQL := sSQL +IFF(sSQL<>'','AND   ','      ')+
        '(CBO2002 = '+FloatToStr(CBO)+')'+CR_LF;

    if (IdFaixaSalarial > 0) then
      sSQL := sSQL +IFF(sSQL<>'','AND   ','      ')+
        '(IDFAIXASALARIAL = '+FloatToStr(IdFaixaSalarial)+')'+CR_LF;

    if (CodNivel > 0) then
      sSQL := sSQL +IFF(sSQL<>'','AND   ','      ')+
        '(CODNIVEL = '+FloatToStr(CodNivel)+')'+CR_LF;

    if (CodGrpTrein <> '') then
      sSQL := sSQL +IFF(sSQL<>'','AND   ','    ')+
        '(CODGRPTREIN = '+QuotedStr(CodGrpTrein)+')'+CR_LF;

    if (CodGrpFunc <> '') then
      sSQL := sSQL+IFF(sSQL<>'','AND   ','    ')+
        '(CODGRPFUNC = '+QuotedStr(CodGrpFunc)+')'+CR_LF;

    if (sSQL <> '') then
      sSQL := CR_LF+'WHERE'+ sSQL;

    sSQL := sSQL +
      'ORDER BY'+
      '  UPPER(TITULO)';
  end;

  Result := GetDataPacket(
    'SELECT'+ IFF(IdCargo = -1, ' /*+ OPTIMIZER_MODE RULE */', '')+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  CARGO'+CR_LF+
    sSQL);
end;

function TCtrlCargo.ListCargoXGrupoFunc(IdCargo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  C.*, GF.DESCGRPFUNC'+CR_LF+
    'FROM'+CR_LF+
    '  CARGO C, GRUPFUNC GF'+CR_LF+
    'WHERE'+CR_LF+
    IFF(IdCargo=0, '', '  (C.IDCARGO    = ' +FloatToStr(IdCargo)+ ') AND')+CR_LF+
    '  (C.CODGRPFUNC = GF.CODGRPFUNC)');
end;

function TCtrlCargo.ListCargoXTendPesquisaSal(IdPesqSalar: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '  C.IDCARGO, C.TITULO'+CR_LF+
    'FROM'+CR_LF+
    '  CARGO C, TENDPESQSAL T'+CR_LF+
    'WHERE'+CR_LF+
    '  (T.IDPESQSALAR = ' +FloatToStr(IdPesqSalar)+ ') AND'+CR_LF+
    '  (T.IDCARGO     = C.IDCARGO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  C.TITULO');
end;

function TCtrlCargo.ListCargoXFunc: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  C.IDCARGO, C.TITULO'+CR_LF+
    'FROM'+CR_LF+
    '  CARGO C, FUNCIONARIO F'+CR_LF+
    'WHERE'+CR_LF+
    '  (C.IDCARGO = F.IDCARGO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(C.TITULO)');
end;

function TCtrlCargo.GravarCargo: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarCargo(FCdsCargo.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsCargo, FDbCargo, [], []);
      if not(Result) then
        raise Exception.Create(FDbCargo.MessageInfo);

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
