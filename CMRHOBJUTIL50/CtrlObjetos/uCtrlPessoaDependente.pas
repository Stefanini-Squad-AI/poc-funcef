{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/03/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPessoaDependente;

interface
{$I VERSAO_PADRAO.INC}

uses SysUtils, DbClient, IvDictio,  CmEventosCadastro, uCMTypes, uCtrlPessoa,
  uCtrlCustomRH, uCtrlFuncoesRH, uDbDependente, uDbDepenTit;

type
  TCtrlPessoaDependente = class(TCtrlCustomPessoaRH)
  protected
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
    procedure DoChangeDataBase; override;
    function  ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean; override;
    function  ExecAppServer(Operacao: TOperacao): boolean; override;
  private
    FDb: TDbDependente;
    FDbDepenTit: TDbDepenTit;

    FFU: TCtrlFuncoesRH;
    
    FCdsDepenTit: TClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function SelDependente(IdPessoa: double): OleVariant;
    function SelDependentesPessoa(IdPessoa: double; ListaTipo: string = ''): OleVariant;
    function SelDepenTit(IdPessoa: double): OleVariant;

    function GetProxNumSeq(IdTitular: double): integer;
    function GetListaIdTitularInconsistente(ListaIdPessoa: string): string;

    property CdsDepenTit: TClientDataSet read FCdsDepenTit write FCdsDepenTit;
  end;

implementation

uses  uMidasUtil;
//*Variants,
{ TCtrlPessoaDependente }

constructor TCtrlPessoaDependente.Create;
begin
  inherited;
  FDb := TDbDependente.Create(Self);
  FDbDepenTit := TDbDepenTit.Create(Self);
  FFU := TCtrlFuncoesRH.Create;
end;

procedure TCtrlPessoaDependente.OnCreateAppServer;
begin
  inherited;
  FCdsDepenTit := TClientDataSet.Create(nil);
end;

destructor TCtrlPessoaDependente.Destroy;
begin
  FDbDepenTit.Free;
  FDb.Free;
  FFU.Free;
  if (IsAppServer) then
    FCdsDepenTit.Free;
  inherited;
end;

procedure TCtrlPessoaDependente.AfterInitialize;
begin
  inherited;
  FFU.InitializeAs(Self);
end;

procedure TCtrlPessoaDependente.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FDbDepenTit.DataBaseName := DataBaseName;
  //*FFU.DataBaseName := DataBaseName;
end;

function TCtrlPessoaDependente.SelDependente(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  DP.IDPESSOA, DP.IDSITDEPENDENTE, DP.FLGDESIGNADO,'+CR_LF+
    '  SD.DESCRICAO AS SITUACAODEPENDENTE'+CR_LF+
    'FROM'+CR_LF+
    '  DEPENDENTE DP, SITDEPENDENTE SD'+CR_LF+
    'WHERE'+CR_LF+
    '  (DP.IDPESSOA        = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (DP.IDSITDEPENDENTE = SD.IDSITDEPENDENTE(+))');
end;

function TCtrlPessoaDependente.SelDependentesPessoa(IdPessoa: double; ListaTipo: string): OleVariant;
var
  sSQL: string;
begin
  if (ListaTipo = '') then
    sSQL := '  (DPT.IDDEPENDENCIA <> ''PRP'') AND'
  else
  begin
    if (Pos(',',ListaTipo) > 0) then
      sSQL := '  (DPT.IDDEPENDENCIA IN (' +FFU.QuotedListaString(ListaTipo, ',', true)+ ')) AND'
    else
      sSQL := '  (DPT.IDDEPENDENCIA  = ' +QuotedStr(ListaTipo)+ ') AND';
  end;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.NOME, DP.DESCRICAO, PF.DATANASC, DPT.FLGCONTAIMPOSTOR, DPT.FLGCONTASALARIOF,'+CR_LF+
    '  DPT.DATACADASTRO, DPT.FIMIMPOSTOR'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, DEPEN DP, DEPENTIT DPT, PESSOAFISICA PF'+CR_LF+
    'WHERE'+CR_LF+
    '  (DPT.IDTITULAR     = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    sSQL+CR_LF+
    '  (DPT.IDPESSOA      = PF.IDPESSOA) AND'+CR_LF+
    '  (DPT.IDDEPENDENCIA = DP.IDDEPENDENCIA) AND'+CR_LF+
    '  (DPT.IDPESSOA      = P.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NUMSEQUENCIA');
end;

function TCtrlPessoaDependente.SelDepenTit(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  DP.IDTITULAR, DP.IDPESSOA, DP.IDDEPENDENCIA,'+CR_LF+
    '  DP.NUMSEQUENCIA, DP.FLGCONTAIMPOSTOR, DP.FLGCONTASALARIOF,'+CR_LF+
    '  DP.FLGBENEFICIARIO, P.NUMDOCUMENTO, P.NOME AS TITULAR,'+CR_LF+
    '  DP.DATACADASTRO, DP.FIMIMPOSTOR,'+CR_LF+
    '  D.DESCRICAO AS TIPODEPENDENCIA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, DEPENTIT DP, DEPEN D'+CR_LF+
    'WHERE'+CR_LF+
    '  (DP.IDPESSOA      = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (DP.IDTITULAR     = P.IDPESSOA) AND'+CR_LF+
    '  (DP.IDDEPENDENCIA = D.IDDEPENDENCIA)');
end;

function TCtrlPessoaDependente.GetProxNumSeq(IdTitular: double): integer;
var
  _Cds: TClientDataSet;
begin
  _Cds := TClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  MAX(NUMSEQUENCIA) AS MAX_NUM'+CR_LF+
    'FROM'+CR_LF+
    '  DEPENTIT'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDTITULAR = ' +FloatToStr(IdTitular)+ ')');

  Result := _Cds.FieldByName('MAX_NUM').asInteger + 1;

  _Cds.Free;
end;

function TCtrlPessoaDependente.GetListaIdTitularInconsistente(ListaIdPessoa: string): string;
var
  K: integer;
  sListaIdTitular, sSQL: string;
  _Cds: TClientDataSet;
begin
  _Cds := TClientDataSet.Create(nil);

  sSQL :=
    'SELECT'+CR_LF+
    '  F.IDPESSOA,'+CR_LF+
    '  NVL(PF.NUMDEPIRRF,0) AS NUMDEPIRRF, DEPENDENTE.NUM_IRRF,'+CR_LF+
    '  NVL(PF.NUMDEPSALF,0) AS NUMDEPSALF, DEPENDENTE.NUM_SAL_FAM'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOAFISICA PF, FUNCIONARIO F,'+CR_LF+
    '  (SELECT'+CR_LF+
    '     DP.IDTITULAR, SUM(DP.FLGCONTAIMPOSTOR) NUM_IRRF,'+CR_LF+
    '     SUM(DP.FLGCONTASALARIOF) NUM_SAL_FAM'+CR_LF+
    '   FROM'+CR_LF+
    '     DEPENTIT DP, DEPEN D'+CR_LF+
    '   WHERE'+CR_LF;

  if (Pos(',',ListaIdPessoa) > 0) then
    sSQL := sSQL + FFU.MontaLinhaSelSQL('      (DP.IDTITULAR',ListaIdPessoa,4)+CR_LF;

  sSQL := sSQL +
    '     (DP.IDDEPENDENCIA <> ''PRP'') AND'+CR_LF+
    '     (DP.IDDEPENDENCIA  = D.IDDEPENDENCIA)'+CR_LF+
    '   GROUP BY'+CR_LF+
    '     DP.IDTITULAR) DEPENDENTE'+CR_LF+
    'WHERE'+CR_LF;

  if (Pos(',',ListaIdPessoa) > 0) then
    sSQL := sSQL + FFU.MontaLinhaSelSQL('  (F.IDPESSOA',ListaIdPessoa,1)+CR_LF;

  sSQL := sSQL +
    '  (F.IDPESSOA  = PF.IDPESSOA) AND'+CR_LF+
    '  (F.IDPESSOA  = DEPENDENTE.IDTITULAR)';

  _Cds.Data := GetDataPacket(sSQL);

  sListaIdTitular := '';
  K := 1;
  while not(_Cds.EOF) do
  begin
    if (_Cds.FieldByName('NUMDEPIRRF').asInteger <> _Cds.FieldByName('NUM_IRRF').asInteger) or
       (_Cds.FieldByName('NUMDEPSALF').asInteger <> _Cds.FieldByName('NUM_SAL_FAM').asInteger) then
      if (K = 1) then
      begin
        sListaIdTitular := sListaIdTitular + _Cds.FieldByName('IDPESSOA').asString;
        Inc(K);
      end
      else
        sListaIdTitular := sListaIdTitular +','+ _Cds.FieldByName('IDPESSOA').asString;

    _Cds.Next;
  end;

  _Cds.Free;

  Result := sListaIdTitular;
end;

function TCtrlPessoaDependente.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean;
begin
  try
    if (Operacao = opApagar) then
    begin
      EmptyCds([CdsSubTipo, FCdsDepenTit]);

      Result := ApplyCds(FCdsDepenTit, FDbDepenTit, [], []);
      if not(Result) then
        raise Exception.Create(FDbDepenTit.MessageInfo);

      Result := ApplyCds(CdsSubTipo, FDb, [], []);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);
    end
    else
    begin
      Result := ApplyCds(CdsSubTipo, FDb, [_DbPessoa.IdPessoa], [FDb.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);

      Result := ApplyCds(FCdsDepenTit, FDbDepenTit, [_DbPessoa.IdPessoa], [FDbDepenTit.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDbDepenTit.MessageInfo);
    end;
  except
    on E:Exception do
    begin
      Result := false;
      Mensagem := E.Message;
    end;
  end;
end;

function TCtrlPessoaDependente.ExecAppServer(Operacao: TOperacao): boolean;
begin
  Result := Connection.AppServer.ProcessaPessoaDependente(Integer(Operacao),
    CdsPessoa.Data, CdsPessoafisica.Data, CdsDocpessoa.Data, CdsSubTipo.Data,
    CdsEndpess.Data, CdsTelendpess.Data, CdsContatopess.Data, CdsTelcontato.Data,
    CdsContaBancaria.Data, CdsImagensPessoa.Data, CdsImagensDOC.Data,
    //*{$IFDEF PADRAO_7_08_05}
    //*CdsAtributosPessoa.Data, CdsEventosPessoa.Data,
    //*{$ELSE}
    //*NULL, NULL,
    //*{$ENDIF}
    FCdsDepenTit.Data);
end;

end.
