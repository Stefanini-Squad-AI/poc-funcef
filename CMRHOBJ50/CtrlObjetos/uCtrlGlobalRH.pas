{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 27/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlGlobalRH;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbParamRH;

type
  TCtrlGlobalRH = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbParamRH: TDbParamRH;
    FCdsAux: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function GetNormalIni: TDateTime;
    function GetNormalFim: TDateTime;
    function GetParamRH(Campos: string): OleVariant;
    function GetIdTipoProcessoRAD(IdReferencia: integer): integer;
    function ListMotivo(IdMotivo: integer): OleVariant;
    function ListAdvogadoContratado(IdModulo: integer): OleVariant;
    function ListAdvogadoCasa: OleVariant;
    function ListAdvogadoDoReclamante(IdModulo: integer): OleVariant;
    function ListAssistenteTecnico(IdModulo: integer): OleVariant;
    function ListReclamantes(IdModulo: integer): OleVariant;
    function ListUltimosEmpregosPessoa(IdPessoa: double): OleVariant;

    property DbParamRH: TDbParamRH read FDbParamRH;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlGlobalRH }

constructor TCtrlGlobalRH.Create;
begin
  inherited;
  FDbParamRH := TDbParamRH.Create(Self);
  FCdsAux := TCMClientDataSet.Create(nil);
end;

destructor TCtrlGlobalRH.Destroy;
begin
  FDbParamRH.Free;
  FCdsAux.Free;
  inherited;
end;

procedure TCtrlGlobalRH.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlGlobalRH.DoChangeDataBase;
begin
  inherited;
  FDbParamRH.DataBaseName := DataBaseName;
end;

function TCtrlGlobalRH.GetNormalIni: TDateTime;
begin
  FCdsAux.Data := GetDataPacket('SELECT NORMALINI FROM PARAMRH');

  if (FCdsAux.IsEmpty) then
    Result := 0
  else
    Result := FCdsAux.FieldByName('NORMALINI').asDateTime;
end;

function TCtrlGlobalRH.GetNormalFim: TDateTime;
begin
  FCdsAux.Data := GetDataPacket('SELECT NORMALFIM FROM PARAMRH');

  if (FCdsAux.IsEmpty) then
    Result := 0
  else
    Result := FCdsAux.FieldByName('NORMALFIM').asDateTime;
end;

function TCtrlGlobalRH.GetParamRH(Campos: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  '+Campos+CR_LF+
    'FROM'+CR_LF+
    '  PARAMRH');
end;

function TCtrlGlobalRH.GetIdTipoProcessoRAD(IdReferencia: integer): integer;
begin
  FCdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDTIPOPROCESSO'+CR_LF+
    'FROM'+CR_LF+
    '  RADTIPOPROCESSO'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDREFERENCIA = '+IntToStr(IdReferencia)+')');

  if (FCdsAux.IsEmpty) then
    Result := -1
  else
    Result := FCdsAux.FieldByName('IDTIPOPROCESSO').asInteger;
end;

function TCtrlGlobalRH.ListMotivo(IdMotivo: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDMOTIVO, DESCRICAO, IDMOVCONTRCAGED, MOTIVORAIS, MOTIVOFGTS,'+CR_LF+
    '  OBSERVACAO, GRUPOMOTIVO, FLGTIPO'+CR_LF+
    'FROM'+CR_LF+
    '  MOTIVO'+CR_LF+
    'WHERE'+CR_LF+
    '  (GRUPOMOTIVO IN (''F'', ''D''))' +
    IFF(IdMotivo = -1, '', ' AND (IDMOTIVO = '+IntToStr(IdMotivo)+')'));
end;

function TCtrlGlobalRH.ListAdvogadoContratado(IdModulo: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA IN (SELECT DISTINCT IDADVOGRECDA'+CR_LF+
    '                FROM   PROCESSOTRAB'+CR_LF+
    '                WHERE  (IDADVOGRECDA IS NOT NULL) AND'+CR_LF+
    '                       (INDMATERIA  ' +
    IFF(IdModulo=MODCON,' = 1',IFF(IdModulo=PROCPREV,'IN (2,3)',IFF(IdModulo=PROCJUD,'IN (4,5,6,7)',' > 0')))+ ')))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NOME');
end;

function TCtrlGlobalRH.ListAdvogadoCasa: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA IN (SELECT DISTINCT IDADVOGCASA'+CR_LF+
    '                FROM   PROCESSOTRAB'+CR_LF+
    '                WHERE (IDADVOGCASA IS NOT NULL)))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NOME');
end;

function TCtrlGlobalRH.ListAdvogadoDoReclamante(IdModulo: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA IN (SELECT DISTINCT IDADVOGRECTE'+CR_LF+
    '                FROM   PROCESSOTRAB'+CR_LF+
    '                WHERE  (IDADVOGRECTE IS NOT NULL) AND'+CR_LF+
    '                       (INDMATERIA  ' +
    IFF(IdModulo=MODCON,' = 1',IFF(IdModulo=PROCPREV,'IN (2,3)',IFF(IdModulo=PROCJUD,'IN (4,5,6,7)',' > 0')))+ ')))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NOME');
end;

function TCtrlGlobalRH.ListAssistenteTecnico(IdModulo: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA IN (SELECT DISTINCT IDASSISTTECN'+CR_LF+
    '                FROM   PROCESSOTRAB'+CR_LF+
    '                WHERE  (IDASSISTTECN IS NOT NULL) AND'+CR_LF+
    '                       (INDMATERIA  ' +
    IFF(IdModulo=MODCON,' = 1',IFF(IdModulo=PROCPREV,'IN (2,3)',IFF(IdModulo=PROCJUD,'IN (4,5,6,7)',' > 0')))+ ')))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NOME');
end;

function TCtrlGlobalRH.ListReclamantes(IdModulo: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPESSOA, NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA IN (SELECT DISTINCT IDRECLAMANTE'+CR_LF+
    '                FROM   PROCESSOTRAB'+CR_LF+
    '                WHERE  (INDMATERIA '+
    IFF(IdModulo=MODCON,' = 1',IFF(IdModulo=PROCPREV,'IN (2,3)',IFF(IdModulo=PROCJUD,'IN (4,5,6,7)',' > 0')))+ ')))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NOME');
end;

function TCtrlGlobalRH.ListUltimosEmpregosPessoa(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  UL.*, MO.DESCRICAO AS MOTIVO, C.TITULO AS CARGO'+CR_LF+
    'FROM'+CR_LF+
    '  CARGO C, MOTIVO MO, ULTEMPR UL'+CR_LF+
    'WHERE'+CR_LF+
    '  (UL.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (UL.IDCARGO  = C.IDCARGO(+)) AND'+CR_LF+
    '  (UL.IDMOTIVO = MO.IDMOTIVO(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UL.NUMSEQ');
end;

end.
