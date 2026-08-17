{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio Frioli                  }
{ Criado Em: 15/01/2004                                 }
{                                                       }
{*******************************************************}

unit uCtrlBancoHoras;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbBancoHoras;

type
  TCtrlBancoHoras = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbBancoHoras: TDbBancoHoras;
    FCdsBancoHoras: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListBancoHoras(IdBancoHoras: double): OleVariant;
    function ListBancoHorasPeriodo(IdPessoa: double; DataIni, DataFim: string): OleVariant;

    function VerificaSaldoBancoHoras(IdPessoa: double; DataIni, DataFim: string): integer;
    function VerificaSaldoBancoHorasPeriodo(IdPessoa: double; DataIni, DataFim: string): integer;
    function SimulaValorBancoHoras(Matricula: string; Saldo, Perc: double): double;

    function GravarBancoHoras: boolean;
    function GravarSitBancoHoras(IdBancoHoras: double; SitBancoHoras: string): boolean;
    
    property CdsBancoHoras: TCMClientDataSet read FCdsBancoHoras write FCdsBancoHoras;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlBancoHoras }

constructor TCtrlBancoHoras.Create;
begin
  inherited;
  FDbBancoHoras := TDbBancoHoras.Create(Self);
end;

destructor TCtrlBancoHoras.Destroy;
begin
  FDbBancoHoras.Free;
  if (IsAppServer) then
    FCdsBancoHoras.Free;
  inherited;
end;

procedure TCtrlBancoHoras.OnCreateAppServer;
begin
  inherited;
  FCdsBancoHoras := TCMClientDataSet.Create(nil);
end;

procedure TCtrlBancoHoras.DoChangeDataBase;
begin
  inherited;
  FDbBancoHoras.DataBaseName := DataBaseName;
end;

function TCtrlBancoHoras.ListBancoHoras(IdBancoHoras: double): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  if (IdBancoHoras = -1) then
    sSQL := sSQL + ' /*+ OPTIMIZER_MODE RULE */';

  sSQL := sSQL +CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  BANCOHORAS'+CR_LF;

  if (IdBancoHoras = -1) then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (1 = 2)'
  else
    if (IdBancoHoras > 0) then
      sSQL := sSQL + 'WHERE (IDBANCOHORAS = ' +FloatToStr(IdBancoHoras)+ ')';

  sSQL := sSQL +CR_LF+
    'ORDER BY'+CR_LF+
    '  IDPESSOA, DATABANCOHORAS';

  Result := GetDataPacket(sSQL);
end;

function TCtrlBancoHoras.ListBancoHorasPeriodo(IdPessoa: double;
              DataIni, DataFim: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  B.*,' +CR_LF+
    '  (CASE WHEN B.VALBANCOHORAS <= 0 THEN ' +QuotedStr(('Débito')) +CR_LF+
    '        ELSE ' +QuotedStr(('Crédito')) +CR_LF+
    '   END) AS TIPO,' +CR_LF+
    '  (CASE WHEN B.SITBANCOHORAS = 0 THEN ' +QuotedStr(('Aberto')) +CR_LF+
    '        WHEN B.SITBANCOHORAS = 1 THEN ' +QuotedStr(('Processado')) +CR_LF+
    '        ELSE ' +QuotedStr(('Expirado')) +CR_LF+
    '   END) AS SITUACAO' +CR_LF+
    'FROM' +CR_LF+
    '  BANCOHORAS B' +CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA        = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (DATABANCOHORAS >= TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')) AND'+CR_LF+
    '  (DATABANCOHORAS <= TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY''))'+CR_LF+
    'ORDER BY' +CR_LF+
    '  DATABANCOHORAS');
end;

function TCtrlBancoHoras.VerificaSaldoBancoHoras(IdPessoa: double; DataIni, DataFim: string): integer;
var
  CdsAux: TCMClientDataSet;
begin
  CdsAux := TCMClientDataSet.Create(nil);

  CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  SUM(VALBANCOHORAS) AS SALDO'+CR_LF+
    'FROM'+CR_LF+
    '  BANCOHORAS'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA      = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (DATABANCOHORAS < TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')) AND '+CR_LF+
//    '   TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY'')+1) AND'+CR_LF+
    '  (SITBANCOHORAS >= 0)');

  Result := CdsAux.FieldByName('SALDO').asInteger;
  CdsAux.Free;
end;

function TCtrlBancoHoras.VerificaSaldoBancoHorasPeriodo(IdPessoa: double; DataIni, DataFim: string): integer;
var
  CdsAux: TCMClientDataSet;
begin
  CdsAux := TCMClientDataSet.Create(nil);

  CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  SUM(VALBANCOHORAS) AS SALDO'+CR_LF+
    'FROM'+CR_LF+
    '  BANCOHORAS'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA      = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (DATABANCOHORAS BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'') AND '+CR_LF+
    '   TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY'')+1) AND'+CR_LF+
    '  (SITBANCOHORAS >= 0)');

  Result := CdsAux.FieldByName('SALDO').asInteger;
  CdsAux.Free;
end;

function TCtrlBancoHoras.SimulaValorBancoHoras(Matricula: string; Saldo, Perc: double): double;
var
  CdsAux: TCMClientDataSet;
begin
  CdsAux := TCMClientDataSet.Create(nil);

  CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  F.SALARIOATUAL * DECODE(F.TIPOPAGAMENTO,''D'',30,''H'',H.JORNADAMENSAL,1) AS SALARIO, H.JORNADAMENSAL'+CR_LF+
    'FROM'+CR_LF+
    '  FUNCIONARIO F, HORATRAB H'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.MATRICULA      = ' +QuotedStr(Matricula)+ ') AND'+CR_LF+
    '  (F.IDHORARIO      = H.IDHORARIO)');

  Result := Round(Saldo * CdsAux.FieldByName('SALARIO').asFloat /
    CdsAux.FieldByName('JORNADAMENSAL').asInteger / 60 * (100 + Perc)) / 100;
  CdsAux.Free;
end;

function TCtrlBancoHoras.GravarBancoHoras: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarBancoHoras(FCdsBancoHoras.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsBancoHoras, FDbBancoHoras, [], []);
      if not(Result) then
        raise Exception.Create(FDbBancoHoras.MessageInfo);

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

function TCtrlBancoHoras.GravarSitBancoHoras(IdBancoHoras: double; SitBancoHoras: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarSitBancoHoras(IdBancoHoras, SitBancoHoras);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSQL(
        'UPDATE' +CR_LF+
        '  BANCOHORAS' +CR_LF+
        'SET' +CR_LF+
        '  SITBANCOHORAS = ' +SitBancoHoras+CR_LF+
        'WHERE' +CR_LF+
        '  (IDBANCOHORAS = ' +FloatToStr(IdBancoHoras)+ ')');
      if not(Result) then
        raise Exception.Create(MessageInfo);

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
