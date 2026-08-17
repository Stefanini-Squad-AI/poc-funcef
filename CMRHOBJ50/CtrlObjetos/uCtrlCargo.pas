{
*******************************************************
RESPONSÁVEL.: Petri Nocentini
Nº SOL......: 253547
Nº PPM......: 780736
Data........: 11/05/2015
Descrição...: Mensagem de erro campo Faixa Salarial PCS
*******************************************************
RESPONSÁVEL.: Marcio Sanches Spinosa
Nº SOL......: 149111
Nº KINTANA..: 1066131
Data........: 12/12/2012
Descrição...: Inclusão do campo Faixa Salarial PCS
*******************************************************
}
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

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
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
      CodGrpFunc: string = ''; pIsModfol : Boolean = false): OleVariant;//Marcio Sanches Spinosa SOL 149111 Kintana 1066131
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
  CodGrpTrein, CodGrpFunc: string; pIsModfol : Boolean): OleVariant;//Marcio Sanches Spinosa SOL 149111 Kintana 1066131
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
  //Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Inicio
  if not (pIsModfol) then
    Result := GetDataPacket(
      'SELECT'+ IFF(IdCargo = -1, ' /*+ OPTIMIZER_MODE RULE */', '')+CR_LF+
      '  CARGO.* , FAIXASAL.CODFAIXAPCS '+CR_LF+ //Petri Nocentini SOL 253547 PPM 780736
      'FROM'+CR_LF+
      '  CARGO'+CR_LF+
      ' LEFT JOIN FAIXASAL ON FAIXASAL.IDFAIXASALARIAL = CARGO.IDFAIXASALARIAL ' + CR_LF +//Petri Nocentini SOL 253547 PPM 780736
      sSQL)
  else
    Result := GetDataPacket(
      'SELECT'+ IFF(IdCargo = -1, ' /*+ OPTIMIZER_MODE RULE */', '')+CR_LF+
      '  CARGO.* , FAIXASAL.CODFAIXAPCS '+CR_LF+
      'FROM'+CR_LF+
      '  CARGO'+CR_LF+
      ' LEFT JOIN FAIXASAL ON FAIXASAL.IDFAIXASALARIAL = CARGO.IDFAIXASALARIAL ' + CR_LF +
      sSQL);
  //Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Fim
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
    'SELECT DISTINCT'+CR_LF+
    '  C.IDCARGO, C.TITULO'+CR_LF+
    'FROM'+CR_LF+
    '  CARGO C, FUNCIONARIO F'+CR_LF+
    'WHERE'+CR_LF+
    '  (C.IDCARGO = F.IDCARGO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  C.TITULO');
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
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbCargo.MessageInfo);
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
