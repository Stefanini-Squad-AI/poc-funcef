{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/11/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlProcessoTrab;

interface

uses SysUtils, Controls, Db, DbClient, uCmDbObject, uCmControlObject, IvDictio, 
  uCMClientDataSet, uCtrlCustomRH, uCtrlLancamento, uCtrlParamIntegra, uCtrlListTerceirosRH,
  uCtrlDocumento, uCtrlSubConta, uCtrlCalcRub, uCtrlBancoPortFolha, uCtrlIntegraCAPCAR_RH,
  uDbProcessoTrab, uDbObjProcTrab, uDbHonorarios, uDbEtapaProcTrab, uDbCopartProcTrab,
  uDbSubConta, uCtrlEtapaProcesso, uDbImovel, uDbEventoImovel;

type
  TCtrlProcessoTrab = class(TCtrlCustomRH)
  protected
    FCtrlLancamento: TCtrlLancamento;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlDocumento: TCtrlDocumento;
    FCtrlSubConta: TCtrlSubConta;
    FCtrlCalcRub: TCtrlCalcRub;
    FCtrlBancoPortFolha: TCtrlBancoPortFolha;
    FCtrlIntegraCAPCAR_RH: TCtrlIntegraCAPCAR_RH;
    FCtrlEtapaProcesso: TCtrlEtapaProcesso;

    FCdsDocumentoCAPCAR: TCMClientDataSet;
    FCdsDocumentos: TCMClientDataSet;
    FCdsImovel: TCMClientDataSet;
    FCdsEventoImovel: TCMClientDataSet;

    FCodTipRecDes: string;
    FListaNumDocCAPCAR: string;
    FListaPlnCodigo: string;
    FRecPag: string;

    FFazCAPCAR: boolean;
    FFazContab: boolean;
    FObrigaAbc: boolean;
    FObrigaCRespon: boolean;
    FUsaPlanoPatro: boolean;

    FIdHotel: double;

    FValorTotal_Original: double;
    FValorTotal_Atual: double;
    FValorCAPCAR: double;
    FValorReclamado_Atual: double;
    FValorAtualizacaoMonetaria_Atual: double;

    FDataDemissao: TDate;
    FDataEmissao: TDate;
    FDataPagamento: TDate;

    FSituacao_Original: integer;
    FIdPlano: integer;
    FPortadorFormaPadrao: integer;
    FIdModulo: integer;
    FIdUsuario: integer;
    FIdEspAcesso: integer;
    FIdEmpresa: integer;
    FNumObjetos_Original: integer;
    FPlanoPrevGlobal: integer;
    FPatroGlobal: integer;
    FIdFavorecido: integer;

    FCodObjeto_Original: OleVariant;
    FValorReclamado_Original: OleVariant;
    FValorAtualizacaoMonetaria_Original: OleVariant;
    //DataHonor: OleVariant;

    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;

    function  GetValorLancamento(Aplica_se_A: integer; ValorJuros: double): double;
    procedure SetValoresIntegracao;

    function GerarIntegracaoContabil(IdPlanoPrev, IdPatro: integer; TipoOperacao: string;
      ValorJuros: double): boolean;
    function GerarIntegracaoCAPCAR: boolean;
    function GerarCAPCAR: boolean;
    function GetValorObjeto: double;
    function GetDataHistorico(DataDemissao: TDate): string;
  private
    FDbProcesso: TDbProcessoTrab;
    FDbObjetos: TDbObjProcTrab;
    FDbHonorarios: TDbHonorarios;
    FDbEtapas: TDbEtapaProcTrab;
    FDbLitisconsortes: TDbCopartProcTrab;
    FDbSubConta: TDbSubConta;
    FDbImovel: TDbImovel;
    FDbEventoImovel: TDbEventoImovel;

    FCdsProcesso: TCMClientDataSet;
    FCdsObjetos: TCMClientDataSet;
    FCdsHonorarios: TCMClientDataSet;
    FCdsHonor: TCMClientDataSet;
    FCdsEtapas: TCMClientDataSet;
    FCdsLitisconsortes: TCMClientDataSet;
  public
    constructor Create(IdModulo, IdUsuario, IdEmpresa: integer; IdHotel: double;
      UsaPlanoPatro: boolean; UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function ListProcesso(NumProcTrab: double): OleVariant;
    function ListDadosProcesso(NumProcTrab: double): OleVariant;
    function ListDadosLitisconsortes(NumProcTrab: double): OleVariant;
    function ListLitisconsorte(NumProcTrab: double): OleVariant;
    function ListObjeto(NumProcTrab: double): OleVariant;
    function ListObjetoXTipo(NumProcTrab: double): OleVariant;
    function ListObjetoComTipo(NumProcTrab: double): OleVariant;
    function ListProcessosVinculados(NumProcTrab: double): OleVariant;
    function ListAdvogadosDoProcesso(NumProcTrab: double): OleVariant;
    function ListAdvogadosDaContraParte(NumProcTrab: double): OleVariant;
    function ListReclamantesDoProcesso(NumProcTrab: double): OleVariant;
    function ListProcessosEnvolvidos(IdPessoa: double): OleVariant;
    function ListAgendaDoUsuario(IdUsuario: double): OleVariant;

    function GravarProcessoTrab(NomeSubConta: string = ''): boolean;
    function ExcluirProcessoTrab: boolean;

    // Inicializa variáveis usadas na integração
    procedure IniciarIntegracao(IdEmpresa, IdModulo, IdUsuario, IdEspAcesso: integer;
      UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal, PatroGlobal: integer);

    procedure ZerarValoresProcesso;
    function  VerificaNumProcesso(NumProcesso: string): boolean;
    function  VerificaContraParte(sIdPessoa: string): OleVariant;
    function  GetRecPag: string;
    procedure SetRecPag(RecPag: string);
    procedure SetNumContraparte;

    procedure IniciarValoresContabeis(DataDemissao: TDate);
    procedure IniciarValoresContabeisAppServer(Situacao_Original: integer;
      NumObjetos_Original: integer; CodObjeto_Original: OleVariant;
      ValorReclamado_Original: OleVariant; ValorAtualizacaoMonetaria_Original: OleVariant;
      ValorTotal_Original: OleVariant);

    function  GerarIntegracao(const IAppCliente: OleVariant; FazCAPCAR, FazContab: boolean;
      DataEmissao, DataPagamento, DataDemissao: TDateTime; IdPlanoPrev, IdPatro: integer;
      Plano: integer; TipoOperacao, CodTipRecDes: string; CodTipDoc: integer;
      ValorJuros: double): boolean;
    function  RatearDespesas(Valor,CodEtapa: double; ListaProcesso: string): boolean;

    function AtualizarImovel(IdImovel: double; Inicio: boolean): boolean;

    function InserirEventoImovel(IdImovel: double; EviData: TDate;
      Inicio: boolean; EviDescricao: string; EviPercent, EviVlrAjustado: double): boolean;

    procedure AssociarCdsImovel(CdsImovel, CdsEventoImovel: TCMClientDataSet);

    property CdsProcesso: TCMClientDataSet read FCdsProcesso write FCdsProcesso;
    property CdsObjetos: TCMClientDataSet read FCdsObjetos write FCdsObjetos;
    property CdsHonorarios: TCMClientDataSet read FCdsHonorarios write FCdsHonorarios;
    property CdsHonor: TCMClientDataSet read FCdsHonor write FCdsHonor;
    property CdsEtapas: TCMClientDataSet read FCdsEtapas write FCdsEtapas;
    property CdsLitisconsortes: TCMClientDataSet read FCdsLitisconsortes write FCdsLitisconsortes;
    property CdsImovel: TCMClientDataSet read FCdsImovel write FCdsImovel;
    property CdsEventoImovel: TCMClientDataSet read FCdsEventoImovel write FCdsEventoImovel;
  end;

implementation

uses  uCMTypes, uCtrlFuncoesRH;
 //* Variants,
const
  ABERTO = 0;
  ENCERRADO = 1;

{ TCtrlProcessoTrab }

constructor TCtrlProcessoTrab.Create(IdModulo, IdUsuario, IdEmpresa: integer;
  IdHotel: double; UsaPlanoPatro: boolean; UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  FDbProcesso := TDbProcessoTrab.Create(Self);
  FDbObjetos := TDbObjProcTrab.Create(Self);
  FDbHonorarios := TDbHonorarios.Create(Self);
  FDbEtapas := TDbEtapaProcTrab.Create(Self);
  FDbLitisconsortes := TDbCopartProcTrab.Create(Self);
  FDbSubConta := TDbSubConta.Create(Self);
  FDbImovel := TDbImovel.Create(Self);
  FDbEventoImovel := TDbEventoImovel.Create(Self);

  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlCalcRub := TCtrlCalcRub.Create;
  FCtrlDocumento := TCtrlDocumento.Create;
  FCtrlSubConta := TCtrlSubConta.Create;
  FCtrlLancamento := TCtrlLancamento.Create;
  FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create(IdEmpresa);
  FCtrlIntegraCAPCAR_RH := TCtrlIntegraCAPCAR_RH.Create(IdHotel, UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlEtapaProcesso := TCtrlEtapaProcesso.Create(
    IdEmpresa, IdHotel, UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCtrlDocumento.OpenTransaction := false;
  FCtrlSubConta.OpenTransaction := false;
  FCtrlLancamento.OpenTransaction := false;

  FIdModulo := IdModulo;
  FIdUsuario := IdUsuario;
  FIdEmpresa := IdEmpresa;
  FIdHotel := IdHotel;
  FUsaPlanoPatro := UsaPlanoPatro;

  inherited Create;
end;

destructor TCtrlProcessoTrab.Destroy;
begin
  FDbProcesso.Free;
  FDbObjetos.Free;
  FDbHonorarios.Free;
  FDbEtapas.Free;
  FDbLitisconsortes.Free;
  FDbSubConta.Free;
  FDbImovel.Free;
  FDbEventoImovel.Free;

  FCtrlLancamento.Free;
  FCtrlDocumento.Free;
  FCtrlListTerceirosRH.Free;
  FCtrlSubConta.Free;
  FCtrlCalcRub.Free;
  FCtrlBancoPortFolha.Free;
  FCtrlIntegraCAPCAR_RH.Free;
  FCtrlEtapaProcesso.Free;
  if (IsAppServer) then
  begin
    FCdsProcesso.Free;
    FCdsObjetos.Free;
    FCdsHonorarios.Free;
    FCdsHonor.Free;
    FCdsEtapas.Free;
    FCdsLitisconsortes.Free;
    FCdsDocumentoCAPCAR.Free;
  end;
  inherited;
end;

procedure TCtrlProcessoTrab.AfterInitialize;
begin
  inherited;
  FCtrlListTerceirosRH.InitializeAs(Self);
  FCtrlCalcRub.InitializeAs(Self);
  FCtrlDocumento.InitializeAs(Self);
  FCtrlSubConta.InitializeAs(Self);
  FCtrlLancamento.InitializeAs(Self);
  FCtrlBancoPortFolha.InitializeAs(Self);
  FCtrlIntegraCAPCAR_RH.InitializeAs(Self);
  FCtrlEtapaProcesso.InitializeAs(Self);

  FCtrlCalcRub.IdEmpresa := FIdEmpresa;
end;

procedure TCtrlProcessoTrab.OnCreateAppServer;
begin
  inherited;
  FCdsProcesso := TCMClientDataSet.Create(nil);
  FCdsObjetos := TCMClientDataSet.Create(nil);
  FCdsHonorarios := TCMClientDataSet.Create(nil);
  FCdsHonor := TCMClientDataSet.Create(nil);
  FCdsDocumentoCAPCAR := TCMClientDataSet.Create(nil);
  FCdsEtapas := TCMClientDataSet.Create(nil);
  FCdsLitisconsortes := TCMClientDataSet.Create(nil);
  FCdsImovel := TCMClientDataSet.Create(nil);
  FCdsEventoImovel := TCMClientDataSet.Create(nil);
end;

procedure TCtrlProcessoTrab.DoChangeDataBase;
begin
  inherited;
  FDbProcesso.DataBaseName := DataBaseName;
  FDbObjetos.DataBaseName := DataBaseName;
  FDbHonorarios.DataBaseName := DataBaseName;
  FDbEtapas.DataBaseName := DataBaseName;
  FDbLitisconsortes.DataBaseName := DataBaseName;
  FDbSubConta.DataBaseName := DataBaseName;
  FDbImovel.DataBaseName := DataBaseName;
  FDbEventoImovel.DataBaseName := DataBaseName;

//*  FCtrlDocumento.DataBaseName := DataBaseName;
//*  FCtrlBancoPortFolha.DataBaseName := DataBaseName;
//*  FCtrlIntegraCAPCAR_RH.DataBaseName := DataBaseName;
//*  FCtrlEtapaProcesso.DataBaseName := DataBaseName;
end;

function TCtrlProcessoTrab.ListProcesso(NumProcTrab: double): OleVariant;
begin
  FDbProcesso.NumProcTrab.asFloat := NumProcTrab;
  Result := GetDataPacket(FDbProcesso.sSqlSelect);
end;

function TCtrlProcessoTrab.ListDadosProcesso(NumProcTrab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PT.*, P5.NOME AS PARTICIPANTE, TP.NOMETIPOPROC AS TIPO_PROCESSO,'+CR_LF+
    '  TA.DESCRICAO AS TIPO_ACAO, VJ.DESCRICAO AS VARA_JUSTICA, P1.NOME AS ADVOG_REQ,'+CR_LF+
    '  P2.NOME AS NOSSO_ADVOG, P3.NOME AS ADVOG_CASA, P4.NOME AS ASSIST_TECNICO,'+CR_LF+
    '  CI.NOME AS CIDADE, TS.DESCRICAO AS TIPO_SENT'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P1, PESSOA P2, PESSOA P3, PESSOA P4, PESSOA P5, PROCESSOTRAB PT, TIPOPROCESSO TP,'+CR_LF+
    '  TIPOACAOPROCJUR TA, VARAJUSTICA VJ, TIPOSENTENCA TS, CIDADES CI'+CR_LF+
    'WHERE'+CR_LF+
    '  (PT.NUMPROCTRAB   = ' +FloatToStr(NumProcTrab)+ ') AND'+CR_LF+
    '  (PT.IDRECLAMANTE  = P5.IDPESSOA) AND'+CR_LF+
    '  (PT.IDTIPOPROC    = TP.IDTIPOPROC(+)) AND'+CR_LF+
    '  (PT.IDTIPOACAO    = TA.IDTIPOACAO(+)) AND'+CR_LF+
    '  (PT.IDVARAJUSTICA = VJ.IDVARAJUSTICA(+)) AND'+CR_LF+
    '  (PT.IDCIDADES     = CI.IDCIDADES(+)) AND'+CR_LF+
    '  (PT.IDADVOGRECTE  = P1.IDPESSOA(+)) AND'+CR_LF+
    '  (PT.IDADVOGRECDA  = P2.IDPESSOA(+)) AND'+CR_LF+
    '  (PT.IDADVOGCASA   = P3.IDPESSOA(+)) AND'+CR_LF+
    '  (PT.IDASSISTTECN  = P4.IDPESSOA(+)) AND'+CR_LF+
    '  (PT.CODTIPOSENT   = TS.CODTIPOSENT(+))');
end;

function TCtrlProcessoTrab.ListDadosLitisconsortes(NumProcTrab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  DECODE(P.TIPO,''F'',P.NOME,P.RAZAOSOCIAL) AS NOME,'+CR_LF+
    '  DECODE(C.IDMOTIVO,NULL,' +QuotedStr(('Normal'))+ ',M.DESCRICAO) AS SITUACAO,'+CR_LF+
    '  DECODE(NVL(C.INDTESTEMUNHA,0),'+CR_LF+
    '    0,' +QuotedStr(('Litisconsorte Contraparte'))+ ','+CR_LF+
    '    3,' +QuotedStr(('Nossa Litisconsorte'))+ ','+CR_LF+
    '    1,' +QuotedStr(('Testemunha Contraparte'))+ ','+CR_LF+
    '    2,' +QuotedStr(('Nossa Testemunha'))+CR_LF+
    '  ) AS CATEGORIA,'+CR_LF+
    '  C.IDPESSOA,'+CR_LF+
    '  C.NUMPROCTRAB,'+CR_LF+
    '  C.IDMOTIVO,'+CR_LF+
    '  C.INDTESTEMUNHA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, COPARTPROCTRAB C, MOTIVO M'+CR_LF+
    'WHERE'+CR_LF+
    '  (C.NUMPROCTRAB = ' +FloatToStr(NumProcTrab)+ ') AND'+CR_LF+
    '  (C.IDPESSOA    = P.IDPESSOA) AND'+CR_LF+
    '  (C.IDMOTIVO    = M.IDMOTIVO(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(NOME)');
end;

function TCtrlProcessoTrab.ListLitisconsorte(NumProcTrab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  DECODE(P.TIPO,''F'',P.NOME,P.RAZAOSOCIAL) AS NOME, C.IDPESSOA, C.NUMPROCTRAB'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, COPARTPROCTRAB C'+CR_LF+
    'WHERE'+CR_LF+
    '  (C.NUMPROCTRAB = ' +FloatToStr(NumProcTrab)+ ') AND'+CR_LF+
    '  (C.IDPESSOA    = P.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(NOME)');
end;

function TCtrlProcessoTrab.ListObjeto(NumProcTrab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  NUMPROCTRAB, CODTIPOOBJETO, VALORRECL, PERCPROB, VALORSENTENCA,'+CR_LF+
    '  OBSERVACAO, INDVALOR, DATAINICIO, DATAFINAL, PERCORIG, DATAAVAL'+CR_LF+
    'FROM'+CR_LF+
    '  OBJPROCTRAB'+CR_LF+
    'WHERE'+CR_LF+
    '  (NUMPROCTRAB = ' +FloatToStr(NumProcTrab)+ ')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  CODTIPOOBJETO');
end;

function TCtrlProcessoTrab.ListObjetoXTipo(NumProcTrab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  OBJ.NUMPROCTRAB, OBJ.CODTIPOOBJETO, OBJ.VALORRECL, OBJ.PERCPROB, OBJ.PERCORIG,'+CR_LF+
    '  OBJ.VALORSENTENCA, OBJ.INDVALOR, OBJ.DATAINICIO, OBJ.DATAFINAL, OBJ.OBSERVACAO,'+CR_LF+
    '  ((OBJ.VALORRECL * OBJ.PERCPROB) / 100) AS VALORPROVAVEL, TOBJ.DESCRICAO,'+CR_LF+
    '  ((OBJ.VALORRECL * OBJ.PERCORIG) / 100) AS VALORORIG, OBJ.DATAAVAL'+CR_LF+
    'FROM'+CR_LF+
    '  OBJPROCTRAB OBJ, TIPOOBJPROCTRAB TOBJ'+CR_LF+
    'WHERE'+CR_LF+
    '  (OBJ.NUMPROCTRAB   = ' +FloatToStr(NumProcTrab)+ ') AND'+CR_LF+
    '  (OBJ.CODTIPOOBJETO = TOBJ.CODTIPOOBJETO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlProcessoTrab.ListObjetoComTipo(NumProcTrab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  TOBJ.DESCRICAO, OBJ.VALORRECL, OBJ.PERCPROB, OBJ.VALORSENTENCA,'+CR_LF+
    '  ((OBJ.VALORRECL * OBJ.PERCPROB) / 100) AS VALORPROVAVEL, OBJ.OBSERVACAO,'+CR_LF+
    '  ((OBJ.VALORRECL * OBJ.PERCORIG) / 100) AS VALORORIG, OBJ.DATAAVAL'+CR_LF+
    'FROM'+CR_LF+
    '  OBJPROCTRAB OBJ, TIPOOBJPROCTRAB TOBJ'+CR_LF+
    'WHERE'+CR_LF+
    '  (OBJ.NUMPROCTRAB   = ' +FloatToStr(NumProcTrab)+ ') AND'+CR_LF+
    '  (OBJ.CODTIPOOBJETO = TOBJ.CODTIPOOBJETO)');
end;

function TCtrlProcessoTrab.ListProcessosVinculados(NumProcTrab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.NOME, P.IDPESSOA, PT.*'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PROCESSOTRAB PT'+CR_LF+
    'WHERE'+CR_LF+
    '  (PT.IDPROCVINCULADO = ' +FloatToStr(NumProcTrab)+ ') AND'+CR_LF+
    '  (PT.IDRECLAMANTE    = P.IDPESSOA)');
end;

function TCtrlProcessoTrab.ListAdvogadosDoProcesso(NumProcTrab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDPESSOA, P.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PROCESSOTRAB PT'+CR_LF+
    'WHERE'+CR_LF+
    '  (PT.NUMPROCTRAB   = ' +FloatToStr(NumProcTrab)+ ') AND'+CR_LF+
    '  ((PT.IDADVOGRECDA = P.IDPESSOA) OR'+CR_LF+
    '   (PT.IDASSISTTECN = P.IDPESSOA))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(NOME)');
end;

function TCtrlProcessoTrab.ListAdvogadosDaContraParte(NumProcTrab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDPESSOA, P.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PROCESSOTRAB PT'+CR_LF+
    'WHERE'+CR_LF+
    '  (PT.NUMPROCTRAB  = ' +FloatToStr(NumProcTrab)+ ') AND'+CR_LF+
    '  (PT.IDADVOGRECTE = P.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(NOME)');
end;

function TCtrlProcessoTrab.ListReclamantesDoProcesso(NumProcTrab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PT.PROCJCJNUM, P.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PROCESSOTRAB PT'+CR_LF+
    'WHERE'+CR_LF+
    '  (PT.NUMPROCTRAB  = ' +FloatToStr(NumProcTrab)+ ') AND'+CR_LF+
    '  (PT.IDRECLAMANTE = P.IDPESSOA)');
end;

function TCtrlProcessoTrab.ListProcessosEnvolvidos(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    '(SELECT'+CR_LF+
    '   NUMPROCTRAB, DATANOTIF, ' +QuotedStr(('Contraparte'))+ ' AS CATEGORIA,'+CR_LF+
    '   DECODE(INDMATERIA,1,' +QuotedStr(('Trabalhista'))+ ',2,' +QuotedStr(('Previdenciário'))+ ',' +QuotedStr(('Judicial'))+ ') AS TIPO'+CR_LF+
    ' FROM'+CR_LF+
    '   PROCESSOTRAB'+CR_LF+
    ' WHERE'+CR_LF+
    '   (IDRECLAMANTE = ' +FloatToStr(IdPessoa)+ '))'+CR_LF+
    'UNION'+CR_LF+
    '(SELECT'+CR_LF+
    '   C.NUMPROCTRAB, P.DATANOTIF,'+CR_LF+
    '   DECODE(NVL(C.INDTESTEMUNHA,0),'+CR_LF+
    '     0,' +QuotedStr(('Litisconsorte Contraparte'))+ ','+CR_LF+
    '     3,' +QuotedStr(('Nossa Litisconsorte'))+ ','+CR_LF+
    '     1,' +QuotedStr(('Testemunha Contraparte'))+ ','+CR_LF+
    '     2,' +QuotedStr(('Nossa Testemunha'))+CR_LF+
    '   ) AS CATEGORIA,'+CR_LF+
    '   DECODE(P.INDMATERIA,1,' +QuotedStr(('Trabalhista'))+ ',2,' +QuotedStr(('Previdenciário'))+ ',' +QuotedStr(('Judicial'))+ ') AS TIPO'+CR_LF+
    ' FROM'+CR_LF+
    '   COPARTPROCTRAB C, PROCESSOTRAB P'+CR_LF+
    ' WHERE'+CR_LF+
    '   (C.IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '   (C.NUMPROCTRAB = P.NUMPROCTRAB))'+CR_LF+
    'ORDER BY 1');
end;

function TCtrlProcessoTrab.ListAgendaDoUsuario(IdUsuario: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  EP.ASSUNTO, EP.DATAREALOCOR, EP.NUMSEQ, EP.OBSERVETAPA,'+CR_LF+
    '  TR.DESCRICAO, P.NOME, PT.PROCJCJNUM, VJ.DESCRICAO AS VARA,'+CR_LF+
    '  CI.NOME AS CIDADE, ES.CODESTADO AS UF'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PROCESSOTRAB PT, ETAPAPROCTRAB EP, TIPORECTRAB TR,'+CR_LF+
    '  CIDADES CI, ESTADO ES, VARAJUSTICA VJ'+CR_LF+
    'WHERE'+CR_LF+
    '  (EP.NUMPROCTRAB    = PT.NUMPROCTRAB) AND'+CR_LF+
    '  (EP.CODTIPORECURSO = TR.CODTIPORECURSO) AND'+CR_LF+
    '  (PT.IDADVOGCASA    = ' +FloatToStr(IdUsuario)+ ') AND'+CR_LF+
    '  (EP.DATAREALOCOR  >= SYSDATE) AND'+CR_LF+
    '  (PT.IDRECLAMANTE   = P.IDPESSOA) AND'+CR_LF+
    '  (PT.IDVARAJUSTICA  = VJ.IDVARAJUSTICA(+)) AND'+CR_LF+
    '  (PT.IDCIDADES      = CI.IDCIDADES(+)) AND'+CR_LF+
    '  (CI.IDESTADO       = ES.IDESTADO(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  EP.DATAREALOCOR');
end;

function TCtrlProcessoTrab.VerificaNumProcesso(NumProcesso: string): boolean;
var
  _CdsProcesso: TCMClientDataSet;
begin
  _CdsProcesso := TCMClientDataSet.Create(nil);

  _CdsProcesso.Data := GetDataPacket(
    'SELECT NUMPROCTRAB'+CR_LF+
    'FROM   PROCESSOTRAB'+CR_LF+
    'WHERE  (PROCJCJNUM = ' +QuotedStr(NumProcesso)+ ')');
  Result := not(_CdsProcesso.IsEmpty);

  _CdsProcesso.Free;
end;

function  TCtrlProcessoTrab.VerificaContraParte(sIdPessoa: string): OleVariant;
begin
  Result := GetDataPacket(
    '(SELECT DISTINCT'+CR_LF+
    '   P.NOME, PT.NUMPROCTRAB, PT.PROCJCJNUM, ' +QuotedStr(('Contraparte'))+ ' AS TIPO'+CR_LF+
    ' FROM'+CR_LF+
    '   PESSOA P, PROCESSOTRAB PT'+CR_LF+
    ' WHERE'+CR_LF+
    '   (P.IDPESSOA = ' +sIdPessoa+ ') AND'+CR_LF+
    '   (P.IDPESSOA = PT.IDRECLAMANTE))'+CR_LF+
    'UNION'+CR_LF+
    '(SELECT DISTINCT'+CR_LF+
    '   P.NOME, PT.NUMPROCTRAB, PT.PROCJCJNUM,'+CR_LF+
    '   DECODE(NVL(CP.INDTESTEMUNHA,0),'+CR_LF+
    '     0,' +QuotedStr(('Litisconsorte Contraparte'))+ ','+CR_LF+
    '     3,' +QuotedStr(('Nossa Litisconsorte'))+ ','+CR_LF+
    '     1,' +QuotedStr(('Testemunha Contraparte'))+ ','+CR_LF+
    '     2,' +QuotedStr(('Nossa Testemunha'))+CR_LF+
    '   ) AS TIPO'+CR_LF+
    ' FROM'+CR_LF+
    '   PESSOA P, COPARTPROCTRAB CP, PROCESSOTRAB PT'+CR_LF+
    ' WHERE'+CR_LF+
    '   (P.IDPESSOA     = ' +sIdPessoa+ ') AND'+CR_LF+
    '   (P.IDPESSOA     = CP.IDPESSOA) AND'+CR_LF+
    '   (CP.NUMPROCTRAB = PT.NUMPROCTRAB))');
end;

function TCtrlProcessoTrab.GravarProcessoTrab(NomeSubConta: string): boolean;
var
  _CdsSubConta: TCMClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarProcessoTrab(FIdModulo, FIdUsuario, FIdEmpresa,
      FIdHotel, FUsaPlanoPatro, FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, NomeSubConta,
      FCdsProcesso.Data, FCdsHonorarios.Data, FCdsHonor.Data, FCdsObjetos.Data,
      FCdsEtapas.Data, FCdsLitisconsortes.Data, FCdsImovel.Data, FCdsEventoImovel.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    _CdsSubConta := TCMClientDataSet.Create(nil);
    try
      StartTransaction;

      // Criar Sub-Conta se for indicado no parâmetro e esta não existir
      NomeSubConta := Trim(NomeSubConta);
      if (NomeSubConta <> '') then
      begin
        _CdsSubConta.Data := FCtrlListTerceirosRH.ListSubConta(FIdEmpresa, 0, NomeSubConta);

        if (_CdsSubConta.IsEmpty) then
        begin
          _CdsSubConta.Insert;
          _CdsSubConta.FieldByName('CODSUBCONTA').asFloat :=
            FCtrlSubConta.LeUltimoRegSubConta(FIdEmpresa) + 1;
          _CdsSubConta.FieldByName('IDPESSOA').asInteger := FIdEmpresa;
          _CdsSubConta.FieldByName('NOMESUBCONTA').asString := NomeSubConta;
          _CdsSubConta.Post;

          Result := ApplyCds(_CdsSubConta, FDbSubConta, [], []);
          if not(Result) then
            raise Exception.Create(FDbSubConta.MessageInfo);
        end;

        FCdsProcesso.FieldByName('CODSUBCONTA').asFloat :=
          _CdsSubConta.FieldByName('CODSUBCONTA').asFloat;
      end;

      // Gravar Processo
      Result := ApplyCds(FCdsProcesso, FDbProcesso, [], []);
      if not(Result) then
        raise Exception.Create(FDbProcesso.MessageInfo);

      // Gravar Litisconsortes
      Result := ApplyCds(FCdsLitisconsortes, FDbLitisconsortes,
        [FDbProcesso.NumProcTrab], [FDbLitisconsortes.NumProcTrab]);
      if not(Result) then
        raise Exception.Create(FDbLitisconsortes.MessageInfo);

      // Gravar Honorários das Etapas
      Result := ApplyCds(FCdsHonorarios, FDbHonorarios,
        [FDbProcesso.NumProcTrab], [FDbHonorarios.NumProcTrab]);
      if not(Result) then
        raise Exception.Create(FDbHonorarios.MessageInfo);

      // Gravar Honorários da Aba
      Result := ApplyCds(FCdsHonor, FDbHonorarios,
        [FDbProcesso.NumProcTrab], [FDbHonorarios.NumProcTrab]);
      if not(Result) then
        raise Exception.Create(FDbHonorarios.MessageInfo);

      // Gravar Objetos
      Result := ApplyCds(FCdsObjetos, FDbObjetos,
        [FDbProcesso.NumProcTrab], [FDbObjetos.NumProcTrab]);
      if not(Result) then
        raise Exception.Create(FDbObjetos.MessageInfo);

      // Gravar Etapas
      Result := ApplyCds(FCdsEtapas, FDbEtapas,
        [FDbProcesso.NumProcTrab], [FDbEtapas.NumProcTrab]);
      if not(Result) then
        raise Exception.Create(FDbEtapas.MessageInfo);

      // Gravar Imóvel
      Result := ApplyCds(FCdsImovel, FDbImovel, [], []);
      if not(Result) then
        raise Exception.Create(FDbImovel.MessageInfo);

      // Gravar Evento Imóvel
      Result := ApplyCds(FCdsEventoImovel, FDbEventoImovel, [], []);
      if not(Result) then
        raise Exception.Create(FDbEventoImovel.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
    _CdsSubConta.Free;
  end;
end;

function TCtrlProcessoTrab.ExcluirProcessoTrab: boolean;
var
  sNumProcTrab, sListaIdImagem: string;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirProcessoTrab(FIdModulo, FIdUsuario, FIdEmpresa,
      FIdHotel, FUsaPlanoPatro, FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, FCdsProcesso.Data,
      FCdsHonorarios.Data, FCdsHonor.Data, FCdsObjetos.Data, FCdsEtapas.Data,
      FCdsLitisconsortes.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      sNumProcTrab := FDbProcesso.NumProcTrab.asString;

      // Excluir Honorários
      if (FCdsHonorarios.RecordCount > 0) then
      begin
        ExecSQL('DELETE HONORARIOS WHERE NUMPROCTRAB = '+ sNumProcTrab);
        FCdsHonorarios.EmptyDataSet;
      end;

      // Excluir Honorários
      if (FCdsHonor.RecordCount > 0) then
      begin
        ExecSQL('DELETE HONORARIOS WHERE NUMPROCTRAB = '+ sNumProcTrab);
        FCdsHonor.EmptyDataSet;
      end;

      // Excluir Objetos
      if (FCdsObjetos.RecordCount > 0) then
      begin
        ExecSQL('DELETE OBJPROCTRAB WHERE NUMPROCTRAB = '+ sNumProcTrab);
        FCdsObjetos.EmptyDataSet;
      end;

      if (FCdsEtapas.RecordCount > 0) then
      begin
        // Excluir Imagens associadas às Etapas
        sListaIdImagem := '';
        FCdsEtapas.DisableControls;
        FCdsEtapas.First;
        while not(FCdsEtapas.EOF) do
        begin
          if (sListaIdImagem = '') then
            sListaIdImagem := FCdsEtapas.FieldByName('IDIMAGEM').asString
          else
            sListaIdImagem := sListaIdImagem +','+ FCdsEtapas.FieldByName('IDIMAGEM').asString;
          FCdsEtapas.Next;
        end;
        
        if (sListaIdImagem <> '') then
        begin
          if (Pos(',', sListaIdImagem) > 0) then
            sListaIdImagem := ' IN (' +sListaIdImagem+ ')'
          else
            sListaIdImagem := ' = ' +sListaIdImagem;
            
          ExecSQL('DELETE IMAGENS WHERE IDIMAGEM '+ sListaIdImagem);
        end;
        
        // Excluir Etapas
        ExecSQL('DELETE ETAPAPROCTRAB WHERE NUMPROCTRAB = '+ sNumProcTrab);
        FCdsEtapas.EmptyDataSet;
        FCdsEtapas.EnableControls;
      end;

      // Excluir Litisconsortes
      if (FCdsLitisconsortes.RecordCount > 0) then
      begin
        ExecSQL('DELETE COPARTPROCTRAB WHERE NUMPROCTRAB = '+ sNumProcTrab);
        FCdsLitisconsortes.EmptyDataSet;
      end;

      // Desassociar Processos Vinculados
      ExecSQL(
        'UPDATE PROCESSOTRAB SET IDPROCVINCULADO=NULL WHERE (IDPROCVINCULADO = ' +
        sNumProcTrab+ ')');

      // Excluir Processo
      Result := ApplyCds(FCdsProcesso, FDbProcesso, [], []);
      if not(Result) then
        raise Exception.Create(FDbProcesso.MessageInfo);

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

procedure TCtrlProcessoTrab.IniciarIntegracao(IdEmpresa, IdModulo, IdUsuario,
  IdEspAcesso: integer; UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal,
  PatroGlobal: integer);
begin
  FIdEmpresa := IdEmpresa;
  FIdModulo := IdModulo;
  FIdUsuario := IdUsuario;
  FIdEspAcesso := IdEspAcesso;
  FPortadorFormaPadrao := FCtrlBancoPortFolha.GetCodPortFormaPadrao;
  FUsaPlanoPatro := UsaPlanoPatro;
  FObrigaAbc := ObrigaAbc;
  FObrigaCRespon := ObrigaCRespon;
  FPlanoPrevGlobal := PlanoPrevGlobal;
  FPatroGlobal := PatroGlobal;
end;

function TCtrlProcessoTrab.GerarIntegracao(const IAppCliente: OleVariant;
  FazCAPCAR, FazContab: boolean; DataEmissao, DataPagamento, DataDemissao: TDateTime;
  IdPlanoPrev, IdPatro: integer; Plano: integer; TipoOperacao, CodTipRecDes: string;
  CodTipDoc: integer; ValorJuros: double): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GerarIntegracaoProcessoTrab(IAppCliente,
      FIdModulo, FIdUsuario, FIdEmpresa, FIdHotel, FUsaPlanoPatro, FUsuXFilial, FUsuXCCusto,
      FIdUsuarioGeral, FazCAPCAR, FazContab, DataEmissao, DataPagamento, DataDemissao,
      IdPlanoPrev, IdPatro, Plano, TipoOperacao, CodTipRecDes, CodTipDoc, FIdEspAcesso,
      FObrigaAbc, FObrigaCRespon, FPlanoPrevGlobal, FPatroGlobal, ValorJuros,
      FRecPag, FCdsProcesso.Data, FCdsObjetos.Data, FSituacao_Original,
      FNumObjetos_Original, FCodObjeto_Original, FValorReclamado_Original,
      FValorAtualizacaoMonetaria_Original, FValorTotal_Original);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := true;

    FCodTipRecDes := CodTipRecDes;
    FIdPlano := Plano;
    FListaNumDocCAPCAR := '';
    FListaPlnCodigo := '';
    FFazCAPCAR := FazCAPCAR;
    FFazContab := FazContab;
    FDataEmissao := DataEmissao;
    FDataDemissao := DataDemissao;
    FDataPagamento := DataPagamento;
    FValorTotal_Atual := 0;
    FValorCAPCAR := 0;
    MessageInfo := '';

    try
      if (FazCAPCAR) then
      begin
        FCdsDocumentos := TCMClientDataSet.Create(nil);

        FCtrlIntegraCAPCAR_RH.CdsDocumentos := FCdsDocumentos;
        FCtrlIntegraCAPCAR_RH.ObrigaAbc := FObrigaAbc;
        FCtrlIntegraCAPCAR_RH.ObrigaCRespon := FObrigaCRespon;
        FCtrlIntegraCAPCAR_RH.IdEmpresa := FIdEmpresa;
        FCtrlIntegraCAPCAR_RH.IdModulo := FIdModulo;
        FCtrlIntegraCAPCAR_RH.IdUsuario := FIdUsuario;
        FCtrlIntegraCAPCAR_RH.CodTipDoc := CodTipDoc;

        if not(FCtrlIntegraCAPCAR_RH.AbrirQueryDocumentos) then
          raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);
      end;

      FCdsObjetos.DisableControls;
      FCdsObjetos.First;
      try
        StartTransaction;

        // Enviar mensagem ao cliente
        try
          IAppCliente.GerarIntegracaoProcesso_CB;
        except
        end;

        while not(FCdsObjetos.EOF) do
        begin
          if not(GerarIntegracaoContabil(IdPlanoPrev, IdPatro, TipoOperacao, ValorJuros)) then
            raise Exception.Create(MessageInfo);

          FCdsObjetos.Next;

          // Enviar mensagem ao cliente
          try
            IAppCliente.GerarIntegracaoProcesso_CB;
          except
          end;
        end;

        if (FazCAPCAR) and (FValorCAPCAR <> 0) then
          if not(GerarIntegracaoCAPCAR) then
            raise Exception.Create(MessageInfo);

        // Enviar mensagem ao cliente
        try
          IAppCliente.GerarIntegracaoProcesso_CB;
        except
        end;

        Commit;

        // Criação das mensagens de término do processo de integração
        if (FazCAPCAR) then
        begin
          if (FListaNumDocCAPCAR <> '') then
            MessageInfo :=
              IFF(FRecPag='P',
                ('Contas a Pagar gerada com sucesso.'),
                ('Contas a Receber gerada com sucesso.'))+
              ('Documento(s) Nº.: ') +FListaNumDocCAPCAR
          else
            MessageInfo :=
              IFF(FRecPag='P',
                ('Contas a Pagar não foi feita.'),
                ('Contas a Receber não foi feita.'));
        end;

        if (FazContab) then
        begin
          if (MessageInfo <> '') then
            MessageInfo := MessageInfo +CR_LF+CR_LF;

          if (FListaPlnCodigo <> '') then
            MessageInfo := MessageInfo +
              ('Contabilização gerada com sucesso.') +CR_LF+
              ('Planilha(s) Nº.: ') + FListaPlnCodigo
          else
            MessageInfo := MessageInfo +
              ('Contabilidade não foi feita.');
        end;   
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;

      FCdsObjetos.First;
      FCdsObjetos.EnableControls;

      if (FazCAPCAR) then
        FCdsDocumentos.Free;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;

    // A nova situação passa a ser a "anterior", caso o usuário faça nova atualização
    IniciarValoresContabeis(DataDemissao);
  end;
end;

function TCtrlProcessoTrab.GerarIntegracaoContabil(IdPlanoPrev, IdPatro: integer;
  TipoOperacao: string; ValorJuros: double): boolean;
var
  _CdsAux: TCmClientDataSet;
  dPlnCodigo, dValorLancamento: double;
  sPlnCodigo, sDataEmissao: string;
  Aplica_se_A: integer;
  bErro: boolean;
begin
  Result := false;
  try
    _CdsAux := TCmClientDataSet.Create(nil);

    bErro := false;
    dPlnCodigo := 0;
    sDataEmissao := DateToStr(FDataEmissao);

    try
      SetValoresIntegracao;

      // LOOP para cada Aplicação do Objeto (campo "Aplica-se a" na tela de parametrização).
      // Pode ter os valores: 0 -> Principal; 1 -> Correção Monetária; 2 -> Juros
      for Aplica_se_A:=0 to 2 do
      begin
        dValorLancamento := GetValorLancamento(Aplica_se_A, ValorJuros);

        if (FFazContab) and (dValorLancamento <> 0) then
        begin
          _CdsAux.Data := FCtrlListTerceirosRH.ListContabJurid(
            FCdsObjetos.FieldByName('CODTIPOOBJETO').asFloat,
          FCdsProcesso.FieldByName('INDMATERIA').asInteger, Aplica_se_A);

          if (_CdsAux.IsEmpty) then
            _CdsAux.Data := FCtrlListTerceirosRH.ListContabJurid(
            FCdsObjetos.FieldByName('CODTIPOOBJETO').asFloat, 0, Aplica_se_A);

          if not(_CdsAux.IsEmpty) then
          begin
            // Gravar o Lançamento na Contabilidade para a Conta Débito
            if (_CdsAux.FieldByName('CONTADEBITO').asString <> '') then
            begin
              if (FCtrlLancamento.InsereLancaContab(
                  '0', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
                  FIdEmpresa, // Empresa
                  FIdModulo, // Módulo de Origem
                  FIdUsuario, // Usuário Ativo
                  _CdsAux.FieldByName('IDPLANO2').asFloat, // Plano de Contas
                  -1, // Unidade de Negócio
                  FCdsProcesso.FieldByName('CODSUBCONTA').asFloat, // Sub-Conta de Débito
                  0, // Sub-Conta de Crédito
                  IdPlanoPrev, // ID do Plano Previdenciário
                  IdPatro, // ID da Patrocinadora
                dPlnCodigo, // Número da Planilha
                  0, // Número do Lançamento
                sDataEmissao, // Data do Lançamento
                Copy(sDataEmissao,7,4) + Copy(sDataEmissao,3,3), // Número do Documento
                  Copy(FCdsObjetos.FieldByName('CODTIPOOBJETO').asString + '     ',1,7), // 1ª Linha da Histórico
                  Copy(_CdsAux.FieldByName('DESCRICAO').asString,1,40), // 2ª Linha da Histórico
                Copy(sDataEmissao,7,4) + Copy(sDataEmissao,3,3), // 3ª Linha da Histórico
                  '', // 4ª Linha da Histórico
                  '', // 5ª Linha da Histórico
                  TipoOperacao, // Tipo de Operação Indicado
                  '', // Centro de Custo para Débito
                  _CdsAux.FieldByName('CONTADEBITO').asString, // Conta para Débito
                  '', // Centro de Custo para Crédito
                  '', // Conta para Crédito
                  '', // Código do Histórico Padrão
                dValorLancamento, // Valor a ser Lançado
                  false, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
                  FUsaPlanoPatro // Indica se usa Plano da Patrocinadora
                )) then
                dPlnCodigo := FCtrlLancamento.RetornoPlnCodigo
              else
                raise Exception.Create(FCtrlLancamento.MessageInfo);
            end;

            // Gravar o Lançamento na Contabilidade para a Conta Crédito
            if (_CdsAux.FieldByName('CONTACREDITO').asString <> '') then
            begin
              if (FCtrlLancamento.InsereLancaContab(
                  '1', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
                  FIdEmpresa, // Empresa
                  FIdModulo, // Módulo de Origem
                  FIdUsuario, // Usuário Ativo
                  _CdsAux.FieldByName('IDPLANO1').asFloat, // Plano de Contas
                  -1, // Unidade de Negócio
                  0, // Sub-Conta de Debito
                  FCdsProcesso.FieldByName('CODSUBCONTA').asFloat, // Sub-Conta de Crédito
                  IdPlanoPrev, // ID do Plano Previdenciário
                  IdPatro, // ID da Patrocinadora
                dPlnCodigo, // Número da Planilha
                  0, // Número do Lançamento
                sDataEmissao, // Data do Lançamento
                Copy(sDataEmissao,7,4) + Copy(sDataEmissao,3,3), // Número do Documento
                  Copy(FCdsObjetos.FieldByName('CODTIPOOBJETO').asString + '     ',1,7), // 1ª Linha da Histórico
                  Copy(_CdsAux.FieldByName('DESCRICAO').asString,1,40), // 2ª Linha da Histórico
                Copy(sDataEmissao,7,4) + Copy(sDataEmissao,3,3), // 3ª Linha da Histórico
                  '', // 4ª Linha da Histórico
                  '', // 5ª Linha da Histórico
                  TipoOperacao, // Tipo de Operação Indicado
                  '', // Centro de Custo para Débito
                  '', // Conta para Débito
                  '', // Centro de Custo para Crédito
                  _CdsAux.FieldByName('CONTACREDITO').asString, // Conta para Crédito
                  '', // Código do Histórico Padrão
                dValorLancamento, // Valor a ser Lançado
                  false, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
                  FUsaPlanoPatro // Indica se usa Plano da Patrocinadora
                )) then
                dPlnCodigo := FCtrlLancamento.RetornoPlnCodigo
              else
                raise Exception.Create(FCtrlLancamento.MessageInfo);
            end;
          end;  
        end;
      end;
    except
      on E: Exception do
      begin
        MessageInfo := E.Message;
        bErro := true;
      end;
    end;

    if (bErro) then
      MessageInfo := ('Contabilização Não Efetuada.') +CR_LF+CR_LF+ MessageInfo
    else
    if (dPlnCodigo > 0) then
    begin
      sPlnCodigo := FloatToStr(FCtrlListTerceirosRH.GetNumeroPlanilha(dPlnCodigo));
      if (FListaPlnCodigo = '') then
        FListaPlnCodigo := sPlnCodigo
      else
        FListaPlnCodigo := FListaPlnCodigo +','+ sPlnCodigo;
    end;

    Result := not(bErro);
  finally
    FreeAndNil(_CdsAux);
  end;
end;

function TCtrlProcessoTrab.GerarIntegracaoCAPCAR: boolean;
var
  bErro: boolean;
begin
  try
    FIdFavorecido := FCdsProcesso.FieldByName('IDRECLAMANTE').asInteger;
    bErro := not(GerarCAPCAR);
    if not(bErro) then
    begin
      // Gravar no Banco os Documentos
      if not(FCtrlIntegraCAPCAR_RH.GravarDocumentos(
             FDataEmissao, FDataPagamento, false,
             FUsaPlanoPatro, FPlanoPrevGlobal, FPatroGlobal)) then
      begin
        raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);
        end;

      FCdsDocumentos.EmptyDataSet;
      end;
    except
      on E: Exception do
      begin
        MessageInfo := E.Message;
      bErro := true;
      end;
    end;

  if (bErro) then
    MessageInfo :=('Contas a Pagar/Receber Não Efetuada.') +CR_LF+CR_LF+ MessageInfo
  else
  begin
    if (FListaNumDocCAPCAR = '') then
      FListaNumDocCAPCAR := FCtrlIntegraCAPCAR_RH.NumDocGerados
    else
      FListaNumDocCAPCAR := FListaNumDocCAPCAR +','+ FCtrlIntegraCAPCAR_RH.NumDocGerados;
  end;

  Result := not(bErro);
end;

procedure TCtrlProcessoTrab.SetNumContraparte;
var
  iNum: integer;
begin
  FCdsLitisconsortes.DisableControls;
  FCdsLitisconsortes.First;

  iNum := 0;
  while not(FCdsLitisconsortes.EOF) do
  begin
    if (FCdsLitisconsortes.FieldByName('INDTESTEMUNHA').asInteger = 0) then
      Inc(iNum);
    FCdsLitisconsortes.Next;
  end;
  FCdsProcesso.FieldByName('QTDERECTES').asInteger := iNum + 1;

  FCdsLitisconsortes.First;
  FCdsLitisconsortes.EnableControls;
end;

function TCtrlProcessoTrab.GetRecPag: string;
var
  dValorObjeto, dValorAtualizacaoMonetaria: double;
begin
  FCdsObjetos.DisableControls;
  FCdsObjetos.First;

  FValorTotal_Atual := 0;
  while not(FCdsObjetos.EOF) do
  begin
    dValorObjeto := GetValorObjeto;
    dValorAtualizacaoMonetaria := FCtrlCalcRub.ValorAtualProcesso(
      dValorObjeto, GetDataHistorico(FDataDemissao),
      FCdsProcesso.FieldByName('MOEDAPROCTRAB').asString,
      FCdsProcesso.FieldByName('IDREGRA').asString,
      FCdsProcesso.FieldByName('NUMPROCTRAB').asString,
      FCdsProcesso.FieldByName('INDTAXACONV').asInteger) - dValorObjeto;

    FValorTotal_Atual := FValorTotal_Atual + dValorObjeto + dValorAtualizacaoMonetaria;

    FCdsObjetos.Next;
  end;

  FCdsObjetos.First;
  FCdsObjetos.EnableControls;

  // Indicação de Integração com o Contas A Pagar ou A Receber é feito de acordo com a
  // Parte da empresa no processo (Ativa ou Passiva) e se o valor aumentou ou diminuiu
  // |------------|---------------------|
  // |            |        Valor        |
  // |    Parte   |----------|----------|
  // |            | Aumentou | Diminuiu |
  // |------------|----------|----------|
  // |  Passiva   |     P    |    R     |
  // |------------|----------|----------|
  // |   Ativa    |     R    |    P     |
  // |------------|----------|----------|
  case (FCdsProcesso.FieldByName('FLGPARTEATIVA').asInteger) of
    0 :  // Parte Passiva
    begin
      if (FValorTotal_Atual > FValorTotal_Original) then
        FRecPag := 'P'
      else
        FRecPag := 'R';
    end;
    1 :  // Parte Ativa
    begin
      if (FValorTotal_Atual > FValorTotal_Original) then
        FRecPag := 'R'
      else
        FRecPag := 'P';
    end;
  end;
  Result := FRecPag;
end;

procedure TCtrlProcessoTrab.SetRecPag(RecPag: string);
begin
  FRecPag := RecPag;
end;

function TCtrlProcessoTrab.GerarCAPCAR: boolean;
begin
  try
    // Guardar o valor da Rubrica
    if not(FCtrlIntegraCAPCAR_RH.SetDadosDocumento(
           FIdFavorecido, FPortadorFormaPadrao, FRecPag, FCodTipRecDes,
           UNIDNEGOC_PADRAO, '', CODCENTRORESPON_PADRAO, Abs(FValorCAPCAR))) then
    begin
      raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);
    end;

    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
    Result := false;
  end;
  end;
end;

procedure TCtrlProcessoTrab.ZerarValoresProcesso;
begin
  FValorTotal_Original := 0;
  FValorReclamado_Atual := 0;
  FValorAtualizacaoMonetaria_Atual := 0;
end;

function TCtrlProcessoTrab.GetValorObjeto: double;
begin
  // Se o processo está encerrado, o valor do objeto será o Valor da Sentença se não,
  // será o Valor Provável
  if (FCdsProcesso.FieldByName('FLGSITPROC').asInteger = 1) then
    Result := FCdsObjetos.FieldByName('VALORSENTENCA').asFloat
  else
    Result := FCdsObjetos.FieldByName('VALORPROVAVEL').asFloat;
end;

function TCtrlProcessoTrab.GetDataHistorico(DataDemissao: TDate): string;
begin
  if (FCdsProcesso.FieldByName('FLGSITPROC').asInteger = 0) then
  begin
    if (FIdModulo = MODCON) then
    begin
      if (DataDemissao = 0) then
        Result := FCdsProcesso.FieldByName('DATANOTIF').asString
      else
        Result := DateToStr(DataDemissao);
    end
    else
      Result := FCdsProcesso.FieldByName('DATANOTIF').asString;
  end
  else
    Result := FCdsProcesso.FieldByName('DATAEFETENC').asString;
end;

procedure TCtrlProcessoTrab.IniciarValoresContabeis(DataDemissao: TDate);
var
  c: integer;
  dValorObjeto: double;
begin
  FCdsObjetos.DisableControls;
  FCdsObjetos.First;

  FSituacao_Original := FCdsProcesso.FieldByName('FLGSITPROC').asInteger;
  FNumObjetos_Original := FCdsObjetos.RecordCount;

  FCodObjeto_Original := VarArrayCreate([1, FNumObjetos_Original], varDouble);
  FValorReclamado_Original := VarArrayCreate([1, FNumObjetos_Original], varDouble);
  FValorAtualizacaoMonetaria_Original := VarArrayCreate([1, FNumObjetos_Original], varDouble);

  c := 1;
  FValorTotal_Original := 0;
  while not(FCdsObjetos.EOF) do
  begin
    dValorObjeto := GetValorObjeto;

    FCodObjeto_Original[c] := FCdsObjetos.FieldByName('CODTIPOOBJETO').asFloat;
    FValorReclamado_Original[c] := dValorObjeto;
    FValorAtualizacaoMonetaria_Original[c] := FCtrlCalcRub.ValorAtualProcesso(
      dValorObjeto, GetDataHistorico(DataDemissao),
      FCdsProcesso.FieldByName('MOEDAPROCTRAB').asString,
      FCdsProcesso.FieldByName('IDREGRA').asString,
      FCdsProcesso.FieldByName('NUMPROCTRAB').asString,
      FCdsProcesso.FieldByName('INDTAXACONV').asInteger) - dValorObjeto;

    FValorTotal_Original := FValorTotal_Original + dValorObjeto;
    FCdsObjetos.Next;
    Inc(c);
  end;
  FCdsObjetos.First;
  FCdsObjetos.EnableControls;
end;

procedure TCtrlProcessoTrab.IniciarValoresContabeisAppServer(Situacao_Original: integer;
  NumObjetos_Original: integer; CodObjeto_Original: OleVariant;
  ValorReclamado_Original: OleVariant; ValorAtualizacaoMonetaria_Original: OleVariant;
  ValorTotal_Original: OleVariant);
begin
  FSituacao_Original := Situacao_Original;
  FNumObjetos_Original := NumObjetos_Original;
  FCodObjeto_Original := CodObjeto_Original;
  FValorReclamado_Original := ValorReclamado_Original;
  FValorAtualizacaoMonetaria_Original := ValorAtualizacaoMonetaria_Original;
  FValorTotal_Original := ValorTotal_Original;
end;

procedure TCtrlProcessoTrab.SetValoresIntegracao;
var
  c: integer;
  dValorObjeto: double;
begin
  dValorObjeto := GetValorObjeto;

  FValorReclamado_Atual := dValorObjeto;
  FValorAtualizacaoMonetaria_Atual := FCtrlCalcRub.ValorAtualProcesso(
    dValorObjeto, GetDataHistorico(FDataDemissao),
    FCdsProcesso.FieldByName('MOEDAPROCTRAB').asString,
    FCdsProcesso.FieldByName('IDREGRA').asString,
    FCdsProcesso.FieldByName('NUMPROCTRAB').asString,
    FCdsProcesso.FieldByName('INDTAXACONV').asInteger) - dValorObjeto;

  if (FFazCAPCAR) and (FSituacao_Original = ABERTO) then
    FValorCAPCAR := FValorCAPCAR + FValorAtualizacaoMonetaria_Atual + dValorObjeto;

  if (FValorTotal_Original > 0) then
    for c:=1 to FNumObjetos_Original do
      if (FCdsObjetos.FieldByName('CODTIPOOBJETO').asFloat = FCodObjeto_Original[c]) then
      begin
        FValorReclamado_Atual := FValorReclamado_Atual - FValorReclamado_Original[c];
        FValorAtualizacaoMonetaria_Atual := FValorAtualizacaoMonetaria_Atual -
          FValorAtualizacaoMonetaria_Original[c];

        if (FFazCAPCAR) and (FSituacao_Original = ENCERRADO) then
          FValorCAPCAR := FValorCAPCAR +
            FValorAtualizacaoMonetaria_Atual + FValorReclamado_Atual;

        break;
      end;
end;

function TCtrlProcessoTrab.GetValorLancamento(Aplica_se_A: integer; ValorJuros: double): double;
var
  iNumDias, iNumMeses, iNumAnos: integer;
begin
  case (Aplica_se_A) of
    0 : Result := FValorReclamado_Atual; // Principal
    1 : Result := FValorAtualizacaoMonetaria_Atual; // Correção Monetária
    2 : // Juros
    begin
      CalculaDifData(IFF(FCdsProcesso.FieldByName('FLGSITPROC').asInteger=0,
        FCdsProcesso.FieldByName('DATANOTIF').asString,
        FCdsProcesso.FieldByName('DATAEFETENC').asString),
        DateToStr(FDataEmissao), iNumDias, iNumMeses, iNumAnos);

      if (ValorJuros > 0) then
        Result := FValorReclamado_Atual * iNumMeses * ValorJuros / 100
      else
        Result := JuroComposto(FValorReclamado_Atual, iNumMeses, ValorJuros);

      if (FFazCAPCAR) then
        FValorCAPCAR := FValorCAPCAR + Result;
    end;
    else Result := 0;
  end;
end;

function TCtrlProcessoTrab.RatearDespesas(Valor, CodEtapa: double; ListaProcesso: string): boolean;
var
  sNumProcesso: String;
  iNumSeq: integer;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.RatearDespesas(FIdModulo, FIdUsuario, FIdEmpresa,
      FIdHotel, FUsaPlanoPatro, FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, Valor,
      CodEtapa, ListaProcesso);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      ExecSQL('UPDATE PROCESSOTRAB SET DESPESAPROC = DESPESAPROC + '+Float2String(Valor)+
              ' WHERE NUMPROCTRAB IN ('+ ListaProcesso + ')');

      while (CodEtapa > 0) and (ListaProcesso <> '') do
      begin
        ExtraiString(ListaProcesso, sNumProcesso, ',');
        iNumSeq := FCtrlEtapaProcesso.ApanhaProximoNumSeq(sNumProcesso);
        ExecSQL('INSERT INTO ETAPAPROCTRAB (NUMPROCTRAB,NUMSEQ,CODTIPORECURSO,'+
                '  VALORREC,DATAREALOCOR,ASSUNTO,FLGVALORABATE) '+
                'VALUES ('+ sNumProcesso + ','+IntToStr(iNumSeq)+
                ','+FloatToStr(CodEtapa)+','+Float2String(Valor)+
                ',TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY''),'+
                QuotedStr(('Rateio de Despesas'))+ ',0)');
      end;

      Commit;
      Result := true;
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

function TCtrlProcessoTrab.AtualizarImovel(IdImovel: double; Inicio: boolean): boolean;
begin
  Result := FCtrlEtapaProcesso.AtualizarImovel(IdImovel, Inicio);
end;

function TCtrlProcessoTrab.InserirEventoImovel(IdImovel: double; EviData: TDate;
  Inicio: boolean; EviDescricao: string; EviPercent, EviVlrAjustado: double): boolean;
begin
  Result := FCtrlEtapaProcesso.InserirEventoImovel(IdImovel, EviData, Inicio,
    EviDescricao, EviPercent, EviVlrAjustado);
end;

procedure TCtrlProcessoTrab.AssociarCdsImovel(CdsImovel, CdsEventoImovel: TCMClientDataSet);
begin
  FCdsImovel := CdsImovel;
  FCdsEventoImovel := CdsEventoImovel;
  FCtrlEtapaProcesso.CdsImovel := FCdsImovel;
  FCtrlEtapaProcesso.CdsEventoImovel := FCdsEventoImovel;
end;

end.
