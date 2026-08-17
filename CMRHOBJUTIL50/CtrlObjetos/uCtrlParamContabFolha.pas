// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit uCtrlParamContabFolha;

interface

uses SysUtils, Db, DbClient, Controls, Classes, Forms, uCmControlObject, uCmDbObject,
  IvDictio, uCMTranslate, uCMTypes, uCtrlCustomRH, uCtrlBancoPortFolha, uCtrlListTerceirosRH,
  uCtrlIntegraCAPCAR_RH, uCtrlIntegraContabRH, uCMClientDataSet, Messages, Windows, USistema;

{$I VERSAO_PADRAO.INC}
{ $DEFINE MUTUO}

type
  // Tipo do registro atual
  TLinhaLanc = record
    IdEmpresa: integer;
    IdPlano: integer;
    ContaDeb: string;
    ObrigaSubContaDeb: boolean;
    SubContaDeb: double;
    ObrigaCCustoDeb: boolean;
    CCustoDeb: string;
    ContaCre: string;
    ObrigaSubCOntaCre: boolean;
    SubContaCre: double;
    ObrigaCCustoCre: boolean;
    CCustoCre: string;
    HistoricoDeb: string;
    HistoricoCre: string;
  end;

  // Tipo das linhas dos Lançamentos Contábeis para o Relatório
  TLancRelat = class
  public
    CodRubrica: string;
    NomeRubrica: string;
    ContaDeb: string;
    ContaCre: string;
    HistoricoDeb: string;
    HistoricoCre: string;
    CCusto: string;
    NomeCCusto: string;
    ValorDeb: currency;
    ValorCre: currency;
  end;

  // Tipo das linhas dos Lançamentos Contábeis para o Relatório Resumido
  TLancRelatResumo = class
  public
    TipoConta: byte;
    Conta: string;
    Valor: currency;
  end;

  // Tipo das linhas dos Lançamentos Contábeis para o Relatório Detalhado
  TLancRelatDetalhado = class
  public
    IdPessoa: double;
    NomePessoa: string;
    TipoConta: byte;
    Conta: string;
    CodRubrica: string;
    Valor: currency;
  end;

  // Tipo das linhas dos Lançamentos Contábeis para a(s) Planilha(s)
  TLancPlanilha = class
  public
    IdEmpresa: integer;
    PlnCodigo: double;
    Tipo: TTipoLancContab;
    UnidNegoc: integer;
    IdPlano: integer;
    ContaDeb: string;
    SubContaDeb: double;
    CCustoDeb: string;
    ContaCre: string;
    SubContaCre: double;
    CCustoCre: string;
    Historico: string;
    Valor: currency;
  end;

  TCtrlParamContabFolha = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FCtrlIntegraContabRH: TCtrlIntegraContabRH;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlBancoPortFolha: TCtrlBancoPortFolha;
    FCtrlIntegraCAPCAR_RH: TCtrlIntegraCAPCAR_RH;

    // Usados no processo de Integração com o CAP e Contabilidade
    FCdsFunc: TClientDataSet;
    FCdsValor: TClientDataSet; // Rubricas de valor a serem processadas

    FSQL: TStringList;
    FListaGrupoIdPessoa: TStringList;

    FIndiceGrupoIdPessoa: word;

    FIAppCliente: OleVariant;

    FHoraInicial: TTime;
    FHoraAtual: TTime;
    FHoraInicial_Pessoa: TTime;
    FHoraFinal_Pessoa: TTime;

    FFazCAP: boolean;
    FFazContab: boolean;

    FIdHotel: double;
    FIdEstab: double;

    FCodSubContaIni: string;
    FCodSubContaFin: string;
    FNomeTabela: string;
    FAnoMes: string;
    FListaIdTipoFolha: string;
    FListaCodCCusto: string;
    FListaIdRubrica: string;
    FListaIdPessoa: string;

    // Usados somente na geração do Relatório de Verificação de Lançamentos Contábeis
    FCdsCCusto: TClientDataSet; // Centros de Custo

    // Usados no processo de Integração com o CAP
    FCdsCAPFolha: TClientDataSet; // Rubricas com parametrização CAP
    FCdsValCAP: TClientDataSet; // Valores das rubricas com parametrização CAP por pessoa
    FCdsDocumentos: TClientDataSet; // Dados a serem lançados

    FListaCodPortadorForma: TStringList;

    FGerouAP: boolean;
    FObrigaAbc: boolean;
    FObrigaCRespon: boolean;
    FUsaPlanoPatro: boolean;

    FPortadorFormaPadrao: integer;
    FIdModulo: integer;
    FIdUsuario: integer;
    FIdEmpresa: integer;
    FIdFavorecido: integer;

    FIdPatro: double;
    FIdPlanoPrev: double;

    FListaTipoDesemb: string;

    // Usados no processo de Integração com a Contabilidade
    FCdsEmpresa: TClientDataSet;
    FCdsPlano: TClientDataSet;
    FCdsContabFolha: TClientDataSet; // Rubricas com parametrização Contábil
    FCdsValContab: TClientDataSet; // Valores das rubricas com parametrização Contábil por pessoa
    FCdsValContabAux: TClientDataSet; // Usada para o Loop de Valores das rubricas
    FCdsConta_X_CC: TClientDataSet; // Contas Contábeis X Centros de Custo
    FCdsConta_X_SubConta: TClientDataSet; // Contas Contábeis X Sub-Contas
    FCdsParamRHDatas: TClientDataSet; // Contas de Rateio a Débito e a Crédito
    {$IFDEF MUTUO}
    FCdsRateioMutuo: TClientDataSet;
    {$ENDIF}
    FCdsHorasTrabOutroCC: TClientDataSet; // Horas Trabalhadas em Outro Setor das pessoas
    FCdsLancRelat: TClientDataSet; // Dados do relatório Principal
    FCdsLancRelatResumo: TClientDataSet; // Dados do relatório Resumido
    FCdsLancRelatDetalhado_Mestre: TClientDataSet; // Dados do relatório Detalhado - Mestre
    FCdsLancRelatDetalhado_Detalhe: TClientDataSet; // Dados do relatório Detalhado - Detalhe

    FLancRelat: TStringList; // Valores gerados para o relatório
    FLancRelatResumo: TStringList; // Valores gerados para o relatório Resumido
    FLancRelatDetalhado: TStringList; // Valores gerados para o relatório Detalhado
    FConta_x_Pessoa: TStringList; // Pessoas por Conta. Usada para calcular o número de pessoas em cada conta

    FLancPlanilha: TStringList; // Valores a serem lançadas na Planilha
    FLinhaLanc: TLinhaLanc; // Dados da linha atual a ser criada

    FGerouPlanilha: boolean;
    FConsolida: boolean;
    FVerificarLancContab: boolean;
    FPartidaDobrada: boolean;
    FTemOutroCC: boolean;

    FDataLancContab: TDate;

    FIdPlano: integer;

    FIdEmpresaContab: integer;

    FTipoOperacao: string;
    FCodCentroCusto: string;

    function GetTempoDecorrido: string;

    function AbrirQueryParamContab: boolean;
    function AbrirQueryParamCAP: boolean;
    function AbrirQueryFunc(const FazCAP: boolean): boolean;

    procedure PrepararCdsValores;

    procedure InitLinhaLanc;
    procedure SetLinhaLanc(const TipoLanc: TTipoLancContab);
    function  GerarLinhaLanc: boolean;
    
    {$IFDEF MUTUO}
    procedure InitTotalRateioMutuo;
    procedure SomarTotalRateioMutuo(const IdEmpresa: integer; const Tipo: char;
      const Valor: currency);
    {$ENDIF}
    procedure ListValores;

    procedure MontarValoresCAP;
    procedure MontarValoresContabeis;
    procedure MontarListaGrupoIdPessoa;

    function AbrirHorasTrabOutroCC: boolean;
    function AbrirCCusto: boolean;
    function AbrirLancContab_EmBranco: boolean;

    function GetIdFavorecido: boolean;

    procedure SetCodCentroCusto;
    procedure Filtrar_CdsValContab(const IdPessoa: double);

    procedure GerarRelatPrincipal(const TipoLanc: TTipoLancContab;
      const ValorLanc: currency; const CodRub: string; const DescrRub: string);
    procedure GerarRelatResumo(const TipoLanc: TTipoLancContab;
      const ValorLanc: currency);
    procedure GerarLancRelatDetalhado(const TipoLanc: TTipoLancContab;
      const ValorLanc: currency; const CodRub: string);
    procedure InserirDadosRelat(const TipoLanc: TTipoLancContab;
      const ValorLanc: currency; const CodRubrica: string = '';
      const DescrRubrica: string = '');
    procedure InserirDadosPlanilha(const IdEmpresa: integer;
      const TipoLanc: TTipoLancContab; const UnidNegoc, IdPlano: integer;
      const ContaDebito: string; const ObrigaSubContaDebito: boolean;
      const SubContaDebito: double; const ObrigaCentroCustoDebito: boolean;
      const CodCentroCustoDebito: string; const ContaCredito: string;
      const ObrigaSubContaCredito: boolean; const SubContaCredito: double;
      const ObrigaCentroCustoCredito: boolean; const CodCentroCustoCredito: string;
      const Historico: string; const Valor: currency);
    function GravarPlanilhas: boolean;

    function GerarCAP_Pessoa: boolean;
    function GerarLinhaCAP: boolean;

    function GerarContab_Pessoa: boolean;
    function GerarLinhaContab: boolean;
    function GetMsg(const TipoLanc: TTipoLancContab; const Msg: string): string;
    function ValidarCC_Contab(const TipoLanc: TTipoLancContab): boolean;
    function ValidarSC_Contab(const TipoLanc: TTipoLancContab): boolean;
    function GetCodSubConta(const TipoLanc: TTipoLancContab): double;
    function GetHistPadrao(const TipoLanc: TTipoLancContab): string;

    {$IFDEF MUTUO}
    procedure LancarTotalRateioMutuo;
    {$ENDIF}

    function LancarContabilidade: boolean;

    procedure MontarMensagemPlanilhas;
    procedure MontarMensagemTempo;

    function  VerificaTemOutroCC: boolean;

    {$IFDEF MUTUO}
    function  UsaContaDebitoRateioMutuo: boolean;
    function  UsaContaCreditoRateioMutuo: boolean;
    function  GetUsaRateioMutuo(const IdRubrica: double): boolean;
    {$ENDIF}

    function  GetUnidNegocio_CAP: integer;
    function  GetIdBancoContaSalario(IdAgenciaSalario: double): integer;

    procedure EnviarMensagem(const Processo: WideString; const NomePessoa: WideString = '';
      const TempoDecorrido: WideString = ''; NumRegistros: Integer = 0;
      Incremento: Integer = 0; const Msg: WideString = '');
  public
    constructor Create(IdEmpresa, IdModulo, IdUsuario: integer; IdHotel: double;
      UsaPlanoPatro: boolean; IdPatro, IdPlanoPrev: integer; UsuXFilial, UsuXCCusto,
      IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function GerarRelatIntegracaoContab(const IAppCliente: OleVariant; const Mes,
      Ano: integer; const IdEstab: double; const ListaIdTipoFolha, ListaIdRubrica,
      ListaCodCCusto, ListaIdPessoa, TipoOperacao: string; const CodSubContaIni,
      CodSubContaFin: string; const Previa, ObrigaAbc, ObrigaCRespon: boolean;
      const PlanoPrevGlobal, PatroGlobal: integer; const PartidaDobrada: boolean;
      var ovLancRelat, ovLancRelatResumo, ovLancRelatDetalhado_Mestre,
      ovLancRelatDetalhado_Detalhe: OleVariant): boolean;

    function GerarIntegracao(const IAppCliente: OleVariant; const FazCAP, FazContab,
      Consolida: boolean; const Mes, Ano: integer; const DataEmissao, DataPagamento,
      DataLancContab: TDateTime; const IdEstab: double; const ListaIdTipoFolha,
      ListaCodCCusto, ListaTipoDesemb, TipoOperacao, CodSubContaIni, CodSubContaFin: string;
      const Previa, ConsTipoDesemb, Rateio, ObrigaAbc, ObrigaCRespon: boolean;
      const PlanoPrevGlobal, PatroGlobal: integer; const PartidaDobrada: boolean;
      const CodTipDoc: integer): boolean;
  end;

implementation

uses Variants, uCtrlFuncoesRH, uCmCustomCdbObject;

const
  CAMPO_C: array[TTipoLancContab] of string = ('CONTADEBITO', 'CONTACREDITO', '');
  CAMPO_SC: array[TTipoLancContab] of string = ('CODSUBDEBITO', 'CODSUBCREDITO', '');
  CAMPO_OBRIGA_CC: array[TTipoLancContab] of string = ('OBRIGA_CCUSTO_DEB', 'OBRIGA_CCUSTO_CRE', '');
  CAMPO_OBRIGA_SC: array[TTipoLancContab] of string = ('OBRIGA_SUB_CONTA_DEB', 'OBRIGA_SUB_CONTA_CRE', '');
  CAMPO_SC_PESSOA: array[TTipoLancContab] of string = ('FLGSUBEMPREGDEB', 'FLGSUBEMPREGCRED', '');
  COD_HIST: array[TTipoLancContab] of string = ('COD_HISTPADRAO_CREDITO', 'COD_HISTPADRAO_DEBITO', '');
  DESCR_HIST: array[TTipoLancContab] of string = ('HISTPADRAO_CREDITO', 'HISTPADRAO_DEBITO', '');
  PLANO: array[TTipoLancContab] of string = ('IDPLANO1', 'IDPLANO2', '');
  TIPO_CAMPO_ORDEM: array[TTipoLancContab] of byte = (0, 1, 2);

  // Número de pessoas a serem selecionadas de uma vez na query de valores
  NUM_PESSOAS = 10;

  // Tipos de rateio
  REG_SEM_RATEIO = 0;
  REG_RATEIO_CC = 1;
  REG_RATEIO_MUTUO = 2;

  // Tipos de erro
  ERRO_GENERICO = 0;
  ERRO_CONTAB = 1;
  ERRO_CAP = 2;

  MSG_SEL_PROX_PESSOAS =
    'Selecionando as próximas :1 Pessoas...';

  MSG_CAD_PESSOAL =
    'Vindo do Cadastro de Pessoal';
  MSG_HORA_TRAB_OUTRO_CC =
    'Vindo do Registro de Horas Trabalhadas em Outro Setor de Pessoal';

  MSG_SEM_DADOS =
    'Não há dados a serem processados para esta competência ou :1'+
    'Dados Cadastrais incompletos.';
  MSG_SEM_PARAM_CONTAB =
    'Nenhuma parametrização de Integração Contábil foi encontrada com as opções:1'+
    'indicadas. Verifique-as na tela Rubricas de Integração Contábil que se encontra:2'+
    'no menu Cadastros e na tela que está usando para gerar a integração.';
  MSG_SEM_PARAM_CAP =
    'Nenhuma parametrização de Integração CAP foi encontrada com as opções:1'+
    'indicadas. Verifique-as na tela Rubricas de Integração Contábil que se encontra:2'+
    'no menu Cadastros e na tela que está usando para gerar a integração.';
  MSG_AVISO_GERACAO =
    'O processamento da integração não foi concluído :1'+
    'com sucesso devido a um problema de parametrização.';
  MSG_AVISO_RUB = '*** Rubrica ***:1Seu Código: :2Nome: :3';
  MSG_AVISO_FAVORECIDO =
    'O favorecido ":1" não está associado a Empresa Proprietária logada.:2' +
    'Efetue a associação e execute este processo novamente.';
  MSG_IDENT_PESSOA_RUB =
    '*** Empresa Proprietária ***:1' +
    'Nome: :2' +
    '*** Pessoa ***:3' +
    'Matrícula: :4' +
    'Nome: :5' +
    '*** Rubrica ***:6' +
    'Seu Código: :7' +
    'Nome: :8'+
    'Mensagem::9';
  MSG_SUB_CONTA_DEB =
    MSG_IDENT_PESSOA_RUB +
    'A Conta a Débito ":10" obriga a indicação da Sub-Conta, ' +
    'mas a que foi indicada na parametrização Contábil da Rubrica e também no ' +
    'Cadastro de Pessoal (caso a parametrização Contábil da Rubrica tenha a opção ' +
    'Sub-Conta por Empregado marcada) não está associada na Contabilidade.';
  MSG_SUB_CONTA_CRE =
    MSG_IDENT_PESSOA_RUB +
    'A Conta a Crédito ":10" obriga a indicação da Sub-Conta, ' +
    'mas a que foi indicada na parametrização Contábil da Rubrica e também no ' +
    'Cadastro de Pessoal (caso a parametrização Contábil da Rubrica tenha a opção ' +
    'Sub-Conta por Empregado marcada) não está associada na Contabilidade.';
  MSG_SUB_CONTA_VAZIA_DEB =
    MSG_IDENT_PESSOA_RUB +
    'A Conta a Débito ":10" obriga a indicação da Sub-Conta, ' +
    'mas nenhuma foi informada na parametrização Contábil da Rubrica e também no ' +
    'Cadastro de Pessoal (caso a parametrização Contábil da Rubrica tenha a opção ' +
    'Sub-Conta por Empregado marcada).';
  MSG_SUB_CONTA_VAZIA_CRE =
    MSG_IDENT_PESSOA_RUB +
    'A Conta a Crédito ":10" obriga a indicação da Sub-Conta, ' +
    'mas nenhuma foi informada na parametrização Contábil da Rubrica e também no ' +
    'Cadastro de Pessoal (caso a parametrização Contábil da Rubrica tenha a opção ' +
    'Sub-Conta por Empregado marcada).';
  MSG_IDENT_PESSOA_RUB_CCUSTO =
    '*** Empresa Proprietária ***:1' +
    'Nome: :2' +
    '*** Pessoa ***:3' +
    'Matrícula: :4' +
    'Nome: :5' +
    '*** Rubrica ***:6' +
    'Seu Código: :7' +
    'Nome: :8'+
    'Centro de Custo: ":9" - :10' +
    'Mensagem::11';
  MSG_ERRO_SEM_CC =
    MSG_IDENT_PESSOA_RUB_CCUSTO +
    'O Centro de Custo não consta em nenhuma das linhas de parametrização desta Rubrica e ' +
    'também não há nenhuma linha de parametrização padrão (sem o Centro de Custo).';
  MSG_ERRO_SEM_CC_CONTASXCC =
    MSG_IDENT_PESSOA_RUB_CCUSTO +
    'O Centro de Custo não consta em nenhuma das linhas de parametrização desta Rubrica e ' +
    'também não está associado a nenhuma das Contas na Contabilidade.';
  MSG_AVISO_PARAM_RUB =
    'Você pode verificar, dentre outras parametrizações, o seguinte::12'+
    '  * Se o Centro de Custo da Pessoa ou do Registro de Horas Trabalhadas em Outro Setor ' +
    'está devidamente informado no Cadastro das Contas na Contabilidade ou nas linhas de ' +
    'parametrização desta Rubrica.:13' +
    '  * Se a Subconta nas linhas de parametrização desta Rubrica está devidamente ' +
    'informada.';
  MSG_AVISO_PARAM_RUB_DEB =
    MSG_IDENT_PESSOA_RUB_CCUSTO +
    'Nenhuma Conta a Débito foi devidamente configurada nas linhas de parametrização ' +
    'desta Rubrica.' +
    MSG_AVISO_PARAM_RUB;
  MSG_AVISO_PARAM_RUB_CRE =
    MSG_IDENT_PESSOA_RUB_CCUSTO +
    'Nenhuma Conta a Crédito foi devidamente configurada nas linhas de parametrização ' +
    'desta Rubrica.' +
    MSG_AVISO_PARAM_RUB;
{  MSG_CCUSTO_DEB =
    MSG_IDENT_PESSOA_RUB_CCUSTO +
    'A Conta a Débito ":12" obriga a indicação do Centro de Custo, ' +
    'mas o que foi indicado não está associado na Contabilidade.';
  MSG_CCUSTO_CRE =
    MSG_IDENT_PESSOA_RUB_CCUSTO +
    'A Conta a Crédito ":12" obriga a indicação do Centro de Custo, ' +
    'mas o que foi indicado não está associado na Contabilidade.';
  MSG_CCUSTO_GRUPO_DEB =
    MSG_IDENT_PESSOA_RUB +
    'A parametrização desta Rubrica possui somente uma linha; esta linha ' +
    'tem a indicação do Centro de Custo. O comportamento do sistema neste ' +
    'caso, seria usar este Centro de Custo no Lançamento mas a Conta a ' +
    'Débito ":10" NÃO Obriga Centro de Custo.';
  MSG_CCUSTO_GRUPO_CRE =
    MSG_IDENT_PESSOA_RUB +
    'A parametrização desta Rubrica possui somente uma linha; esta linha ' +
    'tem a indicação do Centro de Custo. O comportamento do sistema neste ' +
    'caso, seria usar este Centro de Custo no Lançamento mas a Conta a ' +
    'Crédito ":10" NÃO Obriga Centro de Custo.';}
  MSG_SEM_FAVORECIDO =
    'Não foi possível identificar o Favorecido em::1' +
    ' * Na Parametrização Contábil da Rubrica ":2";:3' +
    ' * O Banco Salário da Pessoa ":4" não está selecionado no Portador Forma;:5'+
    ' * Não existe nenhum Portador Forma Padrão.';

{ TCtrlParamContabFolha }

constructor TCtrlParamContabFolha.Create(IdEmpresa, IdModulo, IdUsuario: integer;
  IdHotel: double; UsaPlanoPatro: boolean; IdPatro, IdPlanoPrev: integer;
  UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;

  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlIntegraContabRH := TCtrlIntegraContabRH.Create(IdModulo, IdUsuario, UsaPlanoPatro,
    IdPatro, IdPlanoPrev);
  FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create(IdEmpresa);
  FCtrlIntegraCAPCAR_RH := TCtrlIntegraCAPCAR_RH.Create(IdHotel, UsuXFilial, UsuXCCusto,
    IdUsuarioGeral);

  FListaCodPortadorForma := TStringList.Create;

  FCdsEmpresa := TClientDataSet.Create(nil);
  FCdsPlano := TClientDataSet.Create(nil);
  FCdsConta_X_CC := TClientDataSet.Create(nil);
  FCdsConta_X_SubConta := TClientDataSet.Create(nil);
  FCdsParamRHDatas := TClientDataSet.Create(nil);
  {$IFDEF MUTUO}
  FCdsRateioMutuo := TClientDataSet.Create(nil);
  {$ENDIF}
  FCdsHorasTrabOutroCC := TClientDataSet.Create(nil);

  FCdsHorasTrabOutroCC.Filtered := true;

  FCdsConta_X_CC.DisableStringTrim := true;

  FIdHotel := IdHotel;
  FIdEmpresa := IdEmpresa;
  FIdModulo := IdModulo;
  FIdUsuario := IdUsuario;
  FUsaPlanoPatro := UsaPlanoPatro;
  FIdPatro := IdPatro;
  FIdPlanoPrev := IdPlanoPrev;
  FVerificarLancContab := false;

  if not(IsAppServer) then
    GetTempDir;
end;

destructor TCtrlParamContabFolha.Destroy;
begin
  FCtrlListTerceirosRH.Free;
  FCtrlIntegraContabRH.Free;
  FCtrlBancoPortFolha.Free;
  FCtrlIntegraCAPCAR_RH.Free;

  FCdsConta_X_CC.Free;
  FCdsConta_X_SubConta.Free;
  FCdsParamRHDatas.Free;
  {$IFDEF MUTUO}
  FCdsRateioMutuo.Free;
  {$ENDIF}
  FCdsEmpresa.Free;
  FCdsPlano.Free;
  FCdsHorasTrabOutroCC.Free;

  FListaCodPortadorForma.Free;
  inherited;
end;

procedure TCtrlParamContabFolha.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlParamContabFolha.AfterInitialize;
begin
  inherited;
  FCtrlListTerceirosRH.InitializeAs(Self);
  FCtrlBancoPortFolha.InitializeAs(Self);
  FCtrlIntegraCAPCAR_RH.InitializeAs(Self);
  FCtrlIntegraContabRH.InitializeAs(Self);
end;

procedure TCtrlParamContabFolha.DoChangeDataBase;
begin
  inherited;
  FCtrlListTerceirosRH.DataBaseName := DataBaseName;
  FCtrlBancoPortFolha.DataBaseName := DataBaseName;
  FCtrlIntegraCAPCAR_RH.DataBaseName := DataBaseName;
  FCtrlIntegraContabRH.DataBaseName := DataBaseName;
end;

procedure TCtrlParamContabFolha.EnviarMensagem(const Processo, NomePessoa,
  TempoDecorrido: WideString; NumRegistros, Incremento: Integer; const Msg: WideString);
begin
  {$IFDEF DEPURANDO}
  if (Processo <> '') then
    FLog.Inserir(Processo);
  {$ENDIF}
  try
    FIAppCliente.ProcessarGeracaoIntegracaoContabCAP_CB(Processo, NomePessoa,
      TempoDecorrido, NumRegistros, Incremento, Msg);
  except
    on E: Exception do
      MessageInfo := E.Message;
  end;
end;

function TCtrlParamContabFolha.GetTempoDecorrido: string;
begin
  FHoraAtual := Time;
  Result := FormatDateTime('hh:nn:ss', FHoraAtual - FHoraInicial);
end;

function TCtrlParamContabFolha.AbrirQueryParamContab: boolean;
begin
  if not(FFazContab) then
  begin
    Result := true;
    exit;
  end;

  try
    EnviarMensagem(CMTranslate('Selecionando Parametrizações Contábeis das Rubricas...'), '', GetTempoDecorrido);
    FCdsContabFolha.Filter := '';
    FCdsContabFolha.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  C.IDCONTABFOLHA, C.IDPROVENTO, RP.DESCRPROVDESC AS DESCRICAO,' +CR_LF+
      '  C.IDEMPRESA, C.CODCENTROCUSTO, C.FLGSUBEMPREGDEB,' +CR_LF+
      {$IFDEF MUTUO}
      '  PD.FLGRATEIOCRED, PD.FLGRATEIODEB,' +CR_LF+
      {$ENDIF}
      '  C.IDPLANO1, C.CONTADEBITO, C.CODSUBDEBITO, C.IDPESSDEBITO,' +CR_LF+
      '  CONTA_D.PLASUBCONTA AS OBRIGA_SUB_CONTA_DEB,' +CR_LF+
      '  CONTA_D.PLACCUST AS OBRIGA_CCUSTO_DEB,' +CR_LF+
      '  H1.HITCODHIST AS COD_HISTPADRAO_DEBITO,' +CR_LF+
      '  RTRIM(H1.HITDESCR1) AS HISTPADRAO_DEBITO,' +CR_LF+
      '  C.FLGSUBEMPREGCRED,' +CR_LF+
      '  C.IDPLANO2, C.CONTACREDITO, C.CODSUBCREDITO, C.IDPESSCREDITO,' +CR_LF+
      '  CONTA_C.PLASUBCONTA AS OBRIGA_SUB_CONTA_CRE,' +CR_LF+
      '  CONTA_C.PLACCUST AS OBRIGA_CCUSTO_CRE,' +CR_LF+
      '  H2.HITCODHIST AS COD_HISTPADRAO_CREDITO,' +CR_LF+
      '  RTRIM(H2.HITDESCR1) AS HISTPADRAO_CREDITO' +CR_LF+
      'FROM' +CR_LF+
      '  RUBRICAXPESS RP, PROVDESC PD,' +CR_LF+
      '  (SELECT *' +CR_LF+
      '   FROM CONTABFOLHA' +CR_LF+
      '   WHERE' +CR_LF+
      IFF(FCodSubContaIni='', '',
        '     (CODSUBDEBITO    >= ' +FCodSubContaIni+ ') AND' +CR_LF+
        '     (CODSUBDEBITO    <= ' +FCodSubContaFin+ ') AND' +CR_LF+
        '     (CODSUBCREDITO   >= ' +FCodSubContaIni+ ') AND' +CR_LF+
        '     (CODSUBCREDITO   <= ' +FCodSubContaFin+ ') AND' +CR_LF)+
      '     ((CONTADEBITO    IS NULL) OR (IDPLANO1      = ' +IntToStr(FIdPlano)+ ')) AND' +CR_LF+
      '     ((CONTACREDITO   IS NULL) OR (IDPLANO2      = ' +IntToStr(FIdPlano)+ ')) AND' +CR_LF+
      '     ((CODSUBDEBITO   IS NULL) OR (IDPESSDEBITO  = ' +IntToStr(FIdEmpresa)+ ')) AND' +CR_LF+
      '     ((CODSUBCREDITO  IS NULL) OR (IDPESSCREDITO = ' +IntToStr(FIdEmpresa)+ ')) AND' +CR_LF+
      IFF(FListaCodCCusto='',
        '     ((CODCENTROCUSTO IS NULL) OR (IDEMPRESA     = ' +IntToStr(FIdEmpresa)+ '))',
        '     ((CODCENTROCUSTO IS NULL) OR ((IDEMPRESA    = ' +IntToStr(FIdEmpresa)+ ') AND '+
        MontaLinhaSelSQL('(CODCENTROCUSTO',FListaCodCCusto,2,false)+ '))') +CR_LF+
      '  ) C,' +CR_LF+
      '  (SELECT PLACONTA, PLASUBCONTA, PLACCUST' +CR_LF+
      '   FROM PLANOCONTA' +CR_LF+
      '   WHERE (PLANO = ' +IntToStr(FIdPlano)+ ')) CONTA_D,' +CR_LF+
      '  (SELECT PLACONTA, PLASUBCONTA, PLACCUST' +CR_LF+
      '   FROM PLANOCONTA' +CR_LF+
      '   WHERE (PLANO = ' +IntToStr(FIdPlano)+ ')) CONTA_C,' +CR_LF+
      '  (SELECT HITCODHIST, HITDESCR1' +CR_LF+
      '   FROM   HISTOPADRAO' +CR_LF+
      '   WHERE  (IDPESSOA = ' +IntToStr(FIdEmpresa)+ ')) H1,' +CR_LF+
      '  (SELECT HITCODHIST, HITDESCR1' +CR_LF+
      '   FROM   HISTOPADRAO' +CR_LF+
      '   WHERE  (IDPESSOA = ' +IntToStr(FIdEmpresa)+ ')) H2' +CR_LF+
      'WHERE' +CR_LF+
      '  (C.CODTIPRECDES     IS NULL) AND' +CR_LF+
      '  (PD.FLGTPRUBRICA  LIKE (''%F%'')) AND' +CR_LF+
      IFF(FListaIdRubrica='','',MontaLinhaSelSQL('  (PD.IDPROVENTO',FListaIdRubrica,6)+CR_LF)+
      '  (RP.IDPESSOA         = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
      '  (PD.IDPROVENTO       = RP.IDRUBRICA) AND' +CR_LF+
      '  (PD.IDPROVENTO       = C.IDPROVENTO) AND' +CR_LF+
      '  (C.CONTADEBITO       = CONTA_D.PLACONTA(+)) AND' +CR_LF+
      '  (C.CONTACREDITO      = CONTA_C.PLACONTA(+)) AND' +CR_LF+
      '  (C.HITCODHISTDEBITO  = H1.HITCODHIST(+)) AND' +CR_LF+
      '  (C.HITCODHISTCREDITO = H2.HITCODHIST(+))' +CR_LF+
      'ORDER BY' +CR_LF+
      '  PD.IDPROVENTO, C.IDCONTABFOLHA, C.IDEMPRESA');

    FCdsContabFolha.Filtered := true;
    {$IFDEF DEPURANDO}
    //FCdsContabFolha.SaveToFile('c:\CdsContabFolha.Cds');
    FCdsContabFolha.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CdsContabFolha.Cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    {$ENDIF}

    Result := not(FCdsContabFolha.IsEmpty);
    if (Result) then
      FTipoRetorno := RETORNO_NORMAL
    else
    begin
      FTipoRetorno := RETORNO_AVISO;
      MessageInfo := CMTranslateMsg(MSG_SEM_PARAM_CONTAB, [CR_LF, CR_LF]);
    end;
  except
    on E: Exception do
    begin
      Result := false;
      FTipoRetorno := RETORNO_ERRO;
      MessageInfo :=
        CMTranslate('Ocorreu um erro ao tentar selecionar as parametrizações Contábeis das rubricas.')+
        MSG_ERRO + E.Message;
    end;       
  end;
end;

function TCtrlParamContabFolha.AbrirQueryParamCAP: boolean;
begin
  if not(FFazCAP) then
  begin
    Result := true;
    exit;
  end;

  try
    EnviarMensagem(CMTranslate('Selecionando Parametrizações CAP das Rubricas...'), '', GetTempoDecorrido);
    FCdsCAPFolha.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  PD.IDPROVENTO, PD.DESCRICAO, C.IDEMPRESA,' +CR_LF+
      '  C.CODTIPRECDES, C.IDFAVORECIDO,' +CR_LF+
      IFF(FObrigaAbc, 'C.UNIDNEGOC,', '0 AS UNIDNEGOC,') +
      IFF(FObrigaCRespon, 'C.CODCENTRORESPON', '('' '') AS CODCENTRORESPON') +CR_LF+
      'FROM' +CR_LF+
      '  CONTABFOLHA C, PROVDESC PD' +CR_LF+
      'WHERE' +CR_LF+
      IFF(FListaIdRubrica='','',MontaLinhaSelSQL('  (PD.IDPROVENTO',FListaIdRubrica,2)+CR_LF)+
      IFF(FCodSubContaIni='', '', 
        '  (C.CODSUBDEBITO  >= ' +FCodSubContaIni+ ') AND' +CR_LF+
        '  (C.CODSUBDEBITO  <= ' +FCodSubContaFin+ ') AND' +CR_LF+
        '  (C.CODSUBCREDITO >= ' +FCodSubContaIni+ ') AND' +CR_LF+
        '  (C.CODSUBCREDITO <= ' +FCodSubContaFin+ ') AND' +CR_LF)+
      IFF(FListaTipoDesemb = '',
        '  (C.CODTIPRECDES  IS NOT NULL) AND',
        MontaLinhaSelSQL('  (RTRIM(C.CODTIPRECDES)', QuotedListaString(FListaTipoDesemb,','), 1)) +CR_LF+
      '  (C.IDEMPRESA     = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
      '  (C.IDPROVENTO    = PD.IDPROVENTO)' +CR_LF+
      'ORDER BY' +CR_LF+
      '  IDPROVENTO');

    {$IFDEF DEPURANDO}
    //FCdsCAPFolha.SaveToFile('c:\CdsCAPFolha.Cds');
    FCdsCAPFolha.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CdsCAPFolha.Cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    {$ENDIF}

    Result := not(FCdsCAPFolha.IsEmpty);
    if (Result) then
      FTipoRetorno := RETORNO_NORMAL
    else
    begin
      FTipoRetorno := RETORNO_AVISO;
      MessageInfo := CMTranslateMsg(MSG_SEM_PARAM_CAP, [CR_LF, CR_LF]);
    end;
  except
    on E: Exception do
    begin
      Result := false;
      FTipoRetorno := RETORNO_ERRO;
      MessageInfo :=
        CMTranslate('Ocorreu um erro ao tentar selecionar as parametrizações CAP das rubricas.')+
        MSG_ERRO + E.Message;
    end;       
  end;
end;

function TCtrlParamContabFolha.AbrirQueryFunc(const FazCAP: boolean): boolean;
begin
  try
    with (FSQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  F.IDPESSOA,');
      Add('  F.MATRICULA,');
      Add('  P.NOME,');
      Add('  F.IDEMPRESA,');
      Add('  F.CODCENTROCUSTO,');
      Add('  F.IDAGENCIASALARIO,');
      Add('  F.UNIDNEGOC,');
      Add('  F.CODSUBCONTA');
      Add('FROM');
      Add('  PESSOA P, FUNCIONARIO F, ' +FNomeTabela+ ' H,');
      // ------------------------------------------------------------------------------- //
      if (FListaIdRubrica = '') then
        Add('  (SELECT DISTINCT IDPROVENTO FROM CONTABFOLHA) CF')
      else
      begin
        Add('  (SELECT DISTINCT PD.IDPROVENTO');
        Add('   FROM   CONTABFOLHA CF, PROVDESC PD');
        Add('   WHERE  ' + MontaLinhaSelSQL('(PD.IDPROVENTO',FListaIdRubrica,1));
        Add('          (PD.IDPROVENTO = CF.IDPROVENTO)) CF');
      end;
      // ------------------------------------------------------------------------------- //
      Add('WHERE');

      if (FListaIdPessoa <> '') then
        Add(MontaLinhaSelSQL('  (F.IDPESSOA',FListaIdPessoa,5))
      else
        Add('  (F.IDESTAB     = ' +FloatToStr(FIdEstab)+ ') AND');

      Add('  (H.MES         = ' +QuotedStr(FAnoMes)+ ') AND');

      if (FListaIdTipoFolha <> '') then
        Add(MontaLinhaSelSQL('  (H.IDMOTIVO', FListaIdTipoFolha, 3));

      if (FCodSubContaIni <> '') then
      begin
        Add('  ((F.CODSUBCONTA  IS NULL) OR');
        Add('   ((F.CODSUBCONTA IS NOT NULL) AND');
        Add('    (F.CODSUBCONTA >= ' +FCodSubContaIni+ ') AND');
        Add('    (F.CODSUBCONTA <= ' +FCodSubContaFin+ '))) AND');
      end;

      Add('  (F.IDPESSOA    = H.IDPESSOA) AND');
      Add('  (CF.IDPROVENTO = H.IDRUBRICA) AND');
      Add('  (F.IDPESSOA    = P.IDPESSOA)');
      Add('ORDER BY');
      Add('  P.NOME');
      if not(IsAppServer) then
        SaveToFile(DirTempLog + '\qryFuncContabFolha.txt');
    end;

    EnviarMensagem(CMTranslate('Selecionando Dados das Pessoas a Processar...'));
    FCdsFunc.Data := GetDataPacket(FSQL);

    EnviarMensagem('', '', '', FCdsFunc.RecordCount + IFF(FazCAP, 1, 0));

    Result := not(FCdsFunc.IsEmpty);
    if (Result) then
      FTipoRetorno := RETORNO_NORMAL
    else
    begin
      FTipoRetorno := RETORNO_AVISO;
      MessageInfo := CMTranslateMsg(MSG_SEM_DADOS, [CR_LF]);
    end;
  except
    on E: Exception do
    begin
      Result := false;
      FTipoRetorno := RETORNO_ERRO;
      MessageInfo :=
        CMTranslate('Ocorreu um erro ao tentar selecionar os dados das Pessoas.') +
        MSG_ERRO + E.Message;
    end;
  end;
end;

procedure TCtrlParamContabFolha.PrepararCdsValores;
begin
  if (FFazCAP) then
    FCdsValCAP.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  0 AS IDPESSOA,' +CR_LF+
      '  0 AS IDRUBRICA,' +CR_LF+
      '  LPAD(''1'',15,''1'') AS CODPROVDESC,' +CR_LF+
      '  0.00 AS VALOR' +CR_LF+
      'FROM' +CR_LF+
      '  DUAL' +CR_LF+
      'WHERE' +CR_LF+
      '  (1=2)');

  if (FFazContab) then
  begin
    FSQL.Text :=
      'SELECT' +CR_LF+
      '  0 AS IDPESSOA,' +CR_LF+
      '  0 AS IDRUBRICA,' +CR_LF+
      '  0 AS RATEIO,' +CR_LF+
      '  LPAD(''1'',15,''1'') AS CODPROVDESC,' +CR_LF+
      '  0 AS IDEMPRESA,' +CR_LF+
      '  0 AS UNIDNEGOC,' +CR_LF+
      '  LPAD(''1'',10,''1'') AS CODCENTROCUSTO,' +CR_LF+
      '  0.00 AS VALOR' +CR_LF+
      'FROM' +CR_LF+
      '  DUAL' +CR_LF+
      'WHERE' +CR_LF+
      '  (1=2)';

    FCdsValContab.Data := GetDataPacket(FSQL);
    FCdsValContabAux.Data := FCdsValContab.Data;
  end;
end;

procedure TCtrlParamContabFolha.InitLinhaLanc;
begin
  FillChar(FLinhaLanc, SizeOf(FLinhaLanc), 0);
  FLinhaLanc.IdEmpresa := -777; // Indicar que não existe nenhuma linha
end;

procedure TCtrlParamContabFolha.SetLinhaLanc(const TipoLanc: TTipoLancContab);
begin
  FLinhaLanc.IdEmpresa := FCdsValContab.FieldByName('IDEMPRESA').asInteger;

  case (TipoLanc) of
    tlcPartidaDobrada,tlcDebito :
    begin
      FLinhaLanc.IdPlano := FCdsContabFolha.FieldByName(PLANO[tlcDebito]).asInteger;
      FLinhaLanc.HistoricoDeb := GetHistPadrao(tlcDebito);
    end;
    else
    begin
      FLinhaLanc.IdPlano := FCdsContabFolha.FieldByName(PLANO[tlcCredito]).asInteger;
      FLinhaLanc.HistoricoCre := GetHistPadrao(tlcCredito);
    end;
  end;

  if (TipoLanc in [tlcDebito,tlcPartidaDobrada]) and
     (FCdsContabFolha.FieldByName(CAMPO_C[tlcDebito]).asString <> '') then
  begin
    FLinhaLanc.ContaDeb := FCdsContabFolha.FieldByName(CAMPO_C[tlcDebito]).asString;
    FLinhaLanc.ObrigaSubContaDeb := (FCdsContabFolha.FieldByName(CAMPO_OBRIGA_SC[tlcDebito]).asString = 'S');
    FLinhaLanc.SubContaDeb := GetCodSubConta(tlcDebito);
    FLinhaLanc.ObrigaCCustoDeb := (FCdsContabFolha.FieldByName(CAMPO_OBRIGA_CC[tlcDebito]).asString = 'S');
    FLinhaLanc.CCustoDeb := FCodCentroCusto;
  end;

  if (TipoLanc in [tlcCredito,tlcPartidaDobrada]) and
     (FCdsContabFolha.FieldByName(CAMPO_C[tlcCredito]).asString <> '') then
  begin
    FLinhaLanc.ContaCre := FCdsContabFolha.FieldByName(CAMPO_C[tlcCredito]).asString;
    FLinhaLanc.ObrigaSubContaCre := (FCdsContabFolha.FieldByName(CAMPO_OBRIGA_SC[tlcCredito]).asString = 'S');
    FLinhaLanc.SubContaCre := GetCodSubConta(tlcCredito);
    FLinhaLanc.ObrigaCCustoCre := (FCdsContabFolha.FieldByName(CAMPO_OBRIGA_CC[tlcCredito]).asString = 'S');
    FLinhaLanc.CCustoCre := FCodCentroCusto;
  end;
end;

function TCtrlParamContabFolha.GerarLinhaLanc: boolean;
begin
  Result := (FLinhaLanc.IdEmpresa > -777);
end;

{$IFDEF MUTUO}
procedure TCtrlParamContabFolha.InitTotalRateioMutuo;
var
  c: byte;
  _CdsAux: TClientDataSet;
begin
  _CdsAux := TClientDataSet.Create(nil);
  try
    FCdsParamRHDatas.Data := GetDataPacket(
      'SELECT IDEMPRESA, CONTARATEIOCRED, CONTARATEIODEB'+CR_LF+
      'FROM   PARAMRHDATAS');

    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  IDPESSOA1 AS IDEMPRESAORIGEM,' +CR_LF+
      '  IDPESSOA2 AS IDEMPRESADESTINO,' +CR_LF+
      '  SUBCONTAATIVO, CCUSTOATIVO, CONTAATIVO,' +CR_LF+
      '  SUBCONTAPASSIVO, CCUSTOPASSIVO, CONTAPASSIVO' +CR_LF+
      'FROM' +CR_LF+
      '  MUTUO');
    _CdsAux.Filtered := true;

    FCdsRateioMutuo.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  0 AS IDEMPRESA,' +CR_LF+
      '  ''D'' AS TIPO,' +CR_LF+
      '  LPAD(''1'',18,''1'') AS CONTA_DEB,' +CR_LF+
      '  LPAD(''1'',18,''1'') AS CONTA_CRE,' +CR_LF+
      '  LPAD(''1'',18,''1'') AS CONTA_ATIVO,' +CR_LF+
      '  LPAD(''1'',18,''1'') AS CONTA_PASSIVO,' +CR_LF+
      '  0.00 AS VALOR' +CR_LF+
      'FROM' +CR_LF+
      '  DUAL' +CR_LF+
      'WHERE' +CR_LF+
      '  (1=2)');

    FCdsParamRHDatas.First;
    while not(FCdsParamRHDatas.EOF) do
    begin
      if (FCdsParamRHDatas.FieldByName('CONTARATEIODEB').asString <> '') or
         (FCdsParamRHDatas.FieldByName('CONTARATEIOCRED').asString <> '') then
      begin
        _CdsAux.Filter :=
          'IDEMPRESAORIGEM = ' + FCdsParamRHDatas.FieldByName('IDEMPRESA').asString;
        _CdsAux.First;
        while not(_CdsAux.EOF) do
        begin
          for c:=1 to 2 do
          begin
            FCdsRateioMutuo.Append;
            FCdsRateioMutuo.FieldByName('TIPO').asString := IFF(c=1, 'D', 'C');
            FCdsRateioMutuo.FieldByName('IDEMPRESA').asInteger :=
              _CdsAux.FieldByName('IDEMPRESADESTINO').asInteger;
            FCdsRateioMutuo.FieldByName('CONTA_ATIVO').asString :=
              _CdsAux.FieldByName('CONTAATIVO').asString;
            FCdsRateioMutuo.FieldByName('CONTA_PASSIVO').asString :=
              _CdsAux.FieldByName('CONTAPASSIVO').asString;

            if (FCdsParamRHDatas.FieldByName('CONTARATEIOCRED').asString <> '') then
              FCdsRateioMutuo.FieldByName('CONTA_CRE').asString :=
                FCdsParamRHDatas.FieldByName('CONTARATEIOCRED').asString;

            if (FCdsParamRHDatas.FieldByName('CONTARATEIODEB').asString <> '') then
              FCdsRateioMutuo.FieldByName('CONTA_DEB').asString :=
                FCdsParamRHDatas.FieldByName('CONTARATEIODEB').asString;

            FCdsRateioMutuo.Post;
          end;

          _CdsAux.Next;
        end;
      end;
      FCdsParamRHDatas.Next;
    end;
  finally
    _CdsAux.Free;
  end;
end;

procedure TCtrlParamContabFolha.SomarTotalRateioMutuo(const IdEmpresa: integer;
  const Tipo: char; const Valor: currency);
begin
  if (FCdsRateioMutuo.Locate('IDEMPRESA;TIPO', VarArrayOf([IdEmpresa,Tipo]), [])) then
  begin
    FCdsRateioMutuo.Edit;
    FCdsRateioMutuo.FieldByName('VALOR').asCurrency :=
      FCdsRateioMutuo.FieldByName('VALOR').asCurrency + Valor;
    FCdsRateioMutuo.Post;
  end;
end;
{$ENDIF}

procedure TCtrlParamContabFolha.ListValores;
begin
  if (FCdsFunc.BOF) or ((FCdsFunc.RecNo mod NUM_PESSOAS) = 1) then
  begin
    {$IFDEF DEPURANDO}
    FLog.Inserir(CMTranslateMsg(MSG_SEL_PROX_PESSOAS, [IntToStr(NUM_PESSOAS)]));
    {$ENDIF}
    FCdsValor.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  H.IDPESSOA,' +CR_LF+
      '  H.IDRUBRICA,' +CR_LF+
      '  H.CODPROVDESC,' +CR_LF+
      '  H.VALORPROVENTO AS VALOR' +CR_LF+
      'FROM' +CR_LF+
      '  ' +FNomeTabela+ ' H,' +CR_LF+
      // ------------------------------------------------------------------------------- //
      IFF(FListaIdRubrica='',
        '  (SELECT DISTINCT IDPROVENTO FROM CONTABFOLHA) CF',
        '  (SELECT DISTINCT PD.IDPROVENTO' +CR_LF+
        '   FROM   CONTABFOLHA CF, PROVDESC PD' +CR_LF+
        '   WHERE  ' + MontaLinhaSelSQL('(PD.IDPROVENTO',FListaIdRubrica,1) +CR_LF+
        '          (PD.IDPROVENTO = CF.IDPROVENTO)) CF') +CR_LF+
      // ------------------------------------------------------------------------------- //
      'WHERE' +CR_LF+
      MontaLinhaSelSQL('  (H.IDPESSOA',FListaGrupoIdPessoa[FIndiceGrupoIdPessoa],1) +CR_LF+
      '  (H.MES       = ' +QuotedStr(FAnoMes)+ ') AND' +CR_LF+
      IFF(FListaIdTipoFolha='','',MontaLinhaSelSQL('  (H.IDMOTIVO',FListaIdTipoFolha,1)+CR_LF)+
      '  (H.IDRUBRICA = CF.IDPROVENTO)');

    if (FFazCAP) then
      MontarValoresCAP;

    if (FFazContab) then
      MontarValoresContabeis;
  end;

  if (FFazCAP) then
    FCdsValCAP.Filter := 'IDPESSOA = ' +FCdsFunc.FieldByName('IDPESSOA').asString;

  if (FFazContab) then
    Filtrar_CdsValContab(FCdsFunc.FieldByName('IDPESSOA').asFloat);
end;

procedure TCtrlParamContabFolha.MontarValoresCAP;
begin
  FCdsValCAP.EmptyDataSet;
  FCdsValor.First;
  while not(FCdsValor.EOF) do
  begin
    FCdsValCAP.Append;
    FCdsValCAP.FieldByName('IDPESSOA').asFLoat := FCdsValor.FieldByName('IDPESSOA').asFLoat;
    FCdsValCAP.FieldByName('IDRUBRICA').asFLoat := FCdsValor.FieldByName('IDRUBRICA').asFLoat;
    FCdsValCAP.FieldByName('CODPROVDESC').asString := FCdsValor.FieldByName('CODPROVDESC').asString;
    FCdsValCAP.FieldByName('VALOR').asCurrency := Arredondar(FCdsValor.FieldByName('VALOR').asCurrency,2);
    FCdsValCAP.Post;
    FCdsValor.Next;
  end;
end;

procedure TCtrlParamContabFolha.MontarValoresContabeis;
var
  c: byte;
  bmPessoa: TBookMark;
  dValTotRateio: currency;
  sListaGrupoIdPessoa, sIdPessoa: string;

{->}procedure InsertDados(CdsOrigem, CdsDestino: TClientDataSet);
    var
      c: byte;
    begin
      CdsDestino.EmptyDataSet;
      CdsOrigem.First;
      while not(CdsOrigem.EOF) do
      begin
        CdsDestino.Append;
        for c:=0 to CdsDestino.FieldCount-1 do
          CdsDestino.Fields[c].Value :=
            CdsOrigem.FieldByName(CdsDestino.Fields[c].FieldName).Value;
        CdsDestino.Post;
        CdsOrigem.Next;
      end;
{->}end;

begin
  bmPessoa := FCdsFunc.GetBookmark;
  FCdsValContab.EmptyDataSet;
  FCdsValor.First;
  while not(FCdsValor.EOF) do
  begin
    FCdsValContab.Append;
    FCdsFunc.Locate('IDPESSOA', FCdsValor.FieldByName('IDPESSOA').asFloat, []);
    FCdsValContab.FieldByName('IDPESSOA').asFloat := FCdsValor.FieldByName('IDPESSOA').asFloat;
    FCdsValContab.FieldByName('IDRUBRICA').asFloat := FCdsValor.FieldByName('IDRUBRICA').asFloat;
    FCdsValContab.FieldByName('CODPROVDESC').asString := FCdsValor.FieldByName('CODPROVDESC').asString;
    FCdsValContab.FieldByName('RATEIO').asInteger := REG_SEM_RATEIO;
    FCdsValContab.FieldByName('IDEMPRESA').asInteger := FCdsFunc.FieldByName('IDEMPRESA').asInteger;
    FCdsValContab.FieldByName('CODCENTROCUSTO').asString := FCdsFunc.FieldByName('CODCENTROCUSTO').asString;
    FCdsValContab.FieldByName('UNIDNEGOC').asInteger := FCdsFunc.FieldByName('UNIDNEGOC').asInteger;
    FCdsValContab.FieldByName('VALOR').asCurrency := FCdsValor.FieldByName('VALOR').Value;
    FCdsValContab.Post;                              
    FCdsValor.Next;
  end;
  FCdsFunc.GotoBookmark(bmPessoa);
  FCdsFunc.FreeBookmark(bmPessoa);

  // Fazer o rateio de Horas Trabalhadas em Outro Setor
  if (FTemOutroCC) then
  begin
    sListaGrupoIdPessoa := FListaGrupoIdPessoa[FIndiceGrupoIdPessoa];
    for c:=1 to ContaCaracter(sListaGrupoIdPessoa, ',')+1 do
    begin
      ExtraiString(sListaGrupoIdPessoa, sIdPessoa, ',');
      Filtrar_CdsValContab(StrToFloat(sIdPessoa));
      FCdsHorasTrabOutroCC.Filter := 'IDPESSOA = ' +sIdPessoa;
      if not(FCdsHorasTrabOutroCC.IsEmpty) then
      begin
        InsertDados(FCdsValContab, FCdsValContabAux);
        FCdsValContabAux.First;
        while not(FCdsValContabAux.EOF) do
        begin
          dValTotRateio := 0;
          FCdsHorasTrabOutroCC.First;
          while not(FCdsHorasTrabOutroCC.EOF) do
          begin
            // Caso o rateio NÃO deva ser gerado usando as contas do Mútuo e
            // todas as horas da pessoa sejam para outro C. Custo, alterar o registro atual.
            // Caso contrário, incluir um registro com o rateio.
            {$IFDEF MUTUO}
            if not(GetUsaRateioMutuo(FCdsValContabAux.FieldByName('IDRUBRICA').asFloat)) and
               (FCdsHorasTrabOutroCC.FieldByName('RATEIO').asFloat = 1) then
            {$ELSE}
            if (FCdsHorasTrabOutroCC.FieldByName('RATEIO').asFloat = 1) then   
            {$ENDIF}
              FCdsValContab.Edit
            else
            begin
              FCdsValContab.Append;
              FCdsValContab.FieldByName('IDPESSOA').Value := sIdPessoa;
              FCdsValContab.FieldByName('IDRUBRICA').Value := FCdsValContabAux.FieldByName('IDRUBRICA').Value;
              FCdsValContab.FieldByName('CODPROVDESC').Value := FCdsValContabAux.FieldByName('CODPROVDESC').Value;
              FCdsValContab.FieldByName('VALOR').asCurrency :=
                FCdsValContabAux.FieldByName('VALOR').asCurrency *
                FCdsHorasTrabOutroCC.FieldByName('RATEIO').asCurrency;
            end;

            // Indicar o tipo do registro atual
            {$IFDEF MUTUO}
            if (GetUsaRateioMutuo(FCdsValContabAux.FieldByName('IDRUBRICA').asFloat)) then
              FCdsValContab.FieldByName('RATEIO').asInteger := REG_RATEIO_MUTUO
            else                                           
            {$ENDIF}
              FCdsValContab.FieldByName('RATEIO').asInteger := REG_RATEIO_CC;

            FCdsValContab.FieldByName('IDEMPRESA').asFloat := FCdsHorasTrabOutroCC.FieldByName('IDEMPRESA').asFloat;
            FCdsValContab.FieldByName('CODCENTROCUSTO').asString := FCdsHorasTrabOutroCC.FieldByName('CODCENTROCUSTO').asString;
            FCdsValContab.FieldByName('UNIDNEGOC').asInteger := FCdsHorasTrabOutroCC.FieldByName('UNIDNEGOC').asInteger;

            // Só irá abater o valor do rateio atual caso este não seja com a conta do Mútuo
            {$IFDEF MUTUO}
            if (FCdsValContab.FieldByName('RATEIO').Value <> REG_RATEIO_MUTUO) then
            {$ENDIF}
              dValTotRateio := dValTotRateio + FCdsValContab.FieldByName('VALOR').asCurrency;

            FCdsValContab.Post;

            FCdsHorasTrabOutroCC.Next;
          end;

          // Abater o valor total do rateio do valor original da Rubrica
          if (FCdsValContab.Locate('IDRUBRICA;RATEIO',
              VarArrayOf([FCdsValContabAux.FieldByName('IDRUBRICA').asFloat,REG_SEM_RATEIO]),[])) then
          begin
            FCdsValContab.Edit;
            FCdsValContab.FieldByName('VALOR').asCurrency :=
              FCdsValContab.FieldByName('VALOR').asCurrency - dValTotRateio;
            FCdsValContab.Post;
          end;

          FCdsValContabAux.Next;
        end;
      end;
    end;
  end;

  if (FListaCodCCusto <> '') then
    FCdsValContab.Filter := MontaLinhaSelSQL('(CODCENTROCUSTO',FListaCodCCusto,1,false)
  else
    FCdsValContab.Filter := '';
    
  FCdsValContab.First;
  while not(FCdsValContab.EOF) do
  begin
    if (FCdsValContab.FieldByName('VALOR').asCurrency <= 0) then
      FCdsValContab.Delete
    else
      FCdsValContab.Next;
  end;
end;

procedure TCtrlParamContabFolha.MontarListaGrupoIdPessoa;
var
  sLinha: string;
begin
  FListaGrupoIdPessoa.Clear;
  if (FCdsFunc.IsEmpty) then
    exit;

  sLinha := '';
  FCdsFunc.First;
  repeat
    InserirCodigoEm(sLinha, FCdsFunc.FieldByName('IDPESSOA').asString);
    if ((FCdsFunc.RecNo mod NUM_PESSOAS) = 0) or (FCdsFunc.RecNo = FCdsFunc.RecordCount) then
    begin
      FListaGrupoIdPessoa.Add(sLinha);
      sLinha := '';
    end;
    FCdsFunc.Next;
  until (FCdsFunc.EOF);
  FIndiceGrupoIdPessoa := 0;
end;

function TCtrlParamContabFolha.GetIdFavorecido: boolean;
var
  _CdsAux: TClientDataSet;
  iCodPortadorForma: integer;
begin
  _CdsAux := TClientDataSet.Create(nil);
  try
    // O Favorecido será obtido na seguinte ordem:
    //  * Parametrização Contábil da Rubrica;
    //  * Banco que a Pessoa possui Conta Salário e esteja parametrizado como um dos
    //    Bancos indicados no Portador Forma;
    //  * Portador Forma Padrão.
    FIdFavorecido := FCdsCAPFolha.FieldByName('IDFAVORECIDO').asInteger;
    if not(FCdsCAPFolha.FieldByName('IDFAVORECIDO').IsNull) then
      FIdFavorecido := FCdsCAPFolha.FieldByName('IDFAVORECIDO').asInteger
    else
    begin
      FIdFavorecido := GetIdBancoContaSalario(FCdsFunc.FieldByName('IDAGENCIASALARIO').asFloat);
      if (FIdFavorecido > 0) then
      begin
        iCodPortadorForma := ExisteCodigo(FListaCodPortadorForma, IntToStr(FIdFavorecido));
        if (iCodPortadorForma = -1) then
        begin
          iCodPortadorForma := FCtrlBancoPortFolha.GetCodPortForma(FIdFavorecido);
          FListaCodPortadorForma.Add(IntToStr(FIdFavorecido) +'='+ IntToStr(iCodPortadorForma));
        end;
      end
      else
      if (FPortadorFormaPadrao > 0) then
        FIdFavorecido := FCtrlBancoPortFolha.GetBancoEmpresa(FPortadorFormaPadrao);
    end;

    Result := (FIdFavorecido > 0);

    // Guardar o valor da Rubrica
    if (Result) then
    begin
      _CdsAux.Data := GetDataPacket(
        'SELECT IDPESSOA' +CR_LF+
        'FROM   EMPRESAFORN' +CR_LF+
        'WHERE  (IDFORCLI = ' +FloatToStr(FIdFavorecido)+ ') AND'+ CR_LF+
        '       (IDPESSOA = ' +IntToStr(FIdEmpresa)+ ')');

      if (_CdsAux.IsEmpty) then
      begin
        _CdsAux.Data := GetDataPacket(
          'SELECT RAZAOSOCIAL FROM PESSOA WHERE IDPESSOA = '+ FloatToStr(FIdFavorecido));
        MessageInfo := CMTranslateMsg(MSG_AVISO_FAVORECIDO,
          [Trim(_CdsAux.FieldByName('RAZAOSOCIAL').asString), CR_LF]);
        Result := false;
      end;
    end
    else
      MessageInfo := CMTranslateMsg(MSG_SEM_FAVORECIDO,
        [CR_LF, Trim(FCdsCAPFolha.FieldByName('DESCRICAO').asString), CR_LF,
         FCdsFunc.FieldByName('NOME').asString, CR_LF]);
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := CMTranslate(
        'Ocorreu um erro ao obter a associação do Favorecido com a Empresa Proprietária.') +
        MSG_ERRO + E.Message;
    end;
  end;
  _CdsAux.Free;
end;

procedure TCtrlParamContabFolha.SetCodCentroCusto;
begin
  if (FCdsValContab.FieldByName('CODCENTROCUSTO').asString <>
      FCdsFunc.FieldByName('CODCENTROCUSTO').asString) then
    FCodCentroCusto := FCdsValContab.FieldByName('CODCENTROCUSTO').asString
  else
    FCodCentroCusto := FCdsFunc.FieldByName('CODCENTROCUSTO').asString;
end;

procedure TCtrlParamContabFolha.Filtrar_CdsValContab(const IdPessoa: double);
begin
  FCdsValContab.Filter := 'IDPESSOA = ' +FloatToStr(IdPessoa);

  if (FListaCodCCusto <> '') then
    FCdsValContab.Filter := FCdsValContab.Filter +' AND '+
      MontaLinhaSelSQL('(CODCENTROCUSTO',FListaCodCCusto,1,false);
end;

function TCtrlParamContabFolha.AbrirHorasTrabOutroCC: boolean;
begin
  FTipoRetorno := RETORNO_NORMAL;
  try
    FCdsHorasTrabOutroCC.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  HC.IDEMPRESA, HC.IDPESSOA, HC.CODCENTROCUSTO, HC.UNIDNEGOC,' +CR_LF+   
      '  TO_NUMBER(DECODE(HC.FLGCARGATOTAL,' +CR_LF+
      '    1,1,' +CR_LF+
      '    SUM(HC.HORASTRAB * TO_NUMBER(DECODE(NVL(HC.INDHORAPERC,0),' +CR_LF+
      '      0,1,' +CR_LF+
      '      HT.JORNADAMENSAL / 100.00))) / HT.JORNADAMENSAL)' +CR_LF+
      '  ) AS RATEIO' +CR_LF+
      'FROM' +CR_LF+
      '  HORATRABOUTROCC HC, FUNCIONARIO F, HORATRAB HT' +CR_LF+
      'WHERE' +CR_LF+
      IFF(FListaCodCCusto='','',
        MontaLinhaSelSQL('  (HC.CODCENTROCUSTO',FListaCodCCusto,1) +CR_LF)+
      '  (HC.FLGRATEIO = 1) AND' +CR_LF+
      '  (' +CR_LF+
      '    (TO_CHAR(HC.DATATRAB,''YYYY/MM'') = ' +QuotedStr(FAnoMes)+ ') OR' +CR_LF+
      '    (' +CR_LF+
      '      (TO_CHAR(HC.DATATRAB,''YYYY/MM'') <= ' +QuotedStr(FAnoMes)+ ') AND' +CR_LF+
      '      (HC.FLGPERMANENTE = 1)' +CR_LF+
      '    )' +CR_LF+
      '  ) AND' +CR_LF+
      '  (HC.IDPESSOA  = F.IDPESSOA) AND' +CR_LF+
      '  (F.IDHORARIO  = HT.IDHORARIO)' +CR_LF+
      'GROUP BY' +CR_LF+
      '  HC.CODCENTROCUSTO, HC.IDPESSOA, HC.IDEMPRESA,' +CR_LF+
      '  HC.UNIDNEGOC, HC.FLGCARGATOTAL, HT.JORNADAMENSAL');
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      FTipoRetorno := RETORNO_ERRO;
      MessageInfo :=
        CMTranslate('Ocorreu um erro ao tentar abrir os dados das Horas Trabalhadas em Outro Setor.') +
        MSG_ERRO + E.Message;
    end;
  end;
end;

function TCtrlParamContabFolha.AbrirCCusto: boolean;
begin
  FTipoRetorno := RETORNO_NORMAL;
  try
    FCdsCCusto.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  IDEMPRESA,' +CR_LF+
      '  CODCENTROCUSTO AS CODIGO,' +CR_LF+
      '  NOME' +CR_LF+
      'FROM' +CR_LF+
      '  CENTCUST' +CR_LF+
      IFF(FListaCodCCusto='','',
        'WHERE' +CR_LF+
        MontaLinhaSelSQL('  (CODCENTROCUSTO',FListaCodCCusto,1,false) +CR_LF)+
      'ORDER BY' +CR_LF+
      '  CODCENTROCUSTO, IDEMPRESA');
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      FTipoRetorno := RETORNO_ERRO;
      MessageInfo :=
        CMTranslate('Ocorreu um erro ao tentar abrir os dados dos Centros de Custo.') +
        MSG_ERRO + E.Message;
    end;
  end;
end;

function TCtrlParamContabFolha.AbrirLancContab_EmBranco: boolean;
begin
  FTipoRetorno := RETORNO_NORMAL;
  try
    FCdsLancRelat.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  0 AS IDEMPRESA,' +CR_LF+
      '  LPAD(''1'',60,''1'') AS NOME_EMPRESA,' +CR_LF+
      '  LPAD(''1'',15,''1'') AS CODPROVDESC,' +CR_LF+
      '  LPAD(''1'',130,''1'') AS DESCRPROVDESC,' +CR_LF+
      '  LPAD(''1'',18,''1'') AS CONTADEBITO,' +CR_LF+
      '  LPAD(''1'',18,''1'') AS CONTACREDITO,' +CR_LF+
      '  LPAD(''1'',200,''1'') AS HISTORICO_DEBITO,' +CR_LF+
      '  LPAD(''1'',200,''1'') AS HISTORICO_CREDITO,' +CR_LF+
      '  LPAD(''1'',10,''1'') AS CODCENTROCUSTO,' +CR_LF+
      '  LPAD(''1'',30,''1'') AS NOME_CENTROCUSTO,' +CR_LF+
      '  0.00 AS VALOR,' +CR_LF+
      '  0.00 AS VALOR_ABS,' +CR_LF+
      '  0.00 AS VALOR_DEBITO,' +CR_LF+
      '  0.00 AS VALOR_CREDITO' +CR_LF+
      'FROM' +CR_LF+
      '  DUAL' +CR_LF+
      'WHERE' +CR_LF+
      '  (1=2)');

    FCdsLancRelatResumo.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  0 AS NUM_PESSOAS,' +CR_LF+
      '  LPAD(''1'',18,''1'') AS CONTA,' +CR_LF+
      '  LPAD(''1'',40,''1'') AS NOME_CONTA,' +CR_LF+
      '  ''1234567'' AS TIPO_CONTA,' +CR_LF+
      '  0 AS TIPO_CONTA_ORDEM,' +CR_LF+
      '  0.00 AS VALOR' +CR_LF+
      'FROM' +CR_LF+
      '  DUAL' +CR_LF+
      'WHERE' +CR_LF+
      '  (1=2)');

    FCdsLancRelatDetalhado_Mestre.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  LPAD(''1'',18,''1'') AS CONTA,' +CR_LF+
      '  LPAD(''1'',40,''1'') AS NOME_CONTA,' +CR_LF+
      '  ''1234567'' AS TIPO_CONTA,' +CR_LF+
      '  0 AS TIPO_CONTA_ORDEM,' +CR_LF+
      '  0.00 AS VALOR' +CR_LF+
      'FROM' +CR_LF+
      '  DUAL' +CR_LF+
      'WHERE' +CR_LF+
      '  (1=2)');

    FCdsLancRelatDetalhado_Detalhe.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  0 AS IDPESSOA,' +CR_LF+
      '  LPAD(''1'',60,''1'') AS NOME_PESSOA,' +CR_LF+
      '  LPAD(''1'',18,''1'') AS CONTA,' +CR_LF+
      '  0 AS TIPO_CONTA_ORDEM,' +CR_LF+
      '  LPAD(''1'',15,''1'') AS COD_RUBRICA,' +CR_LF+
      '  0.00 AS VALOR' +CR_LF+
      'FROM' +CR_LF+
      '  DUAL' +CR_LF+
      'WHERE' +CR_LF+
      '  (1=2)');

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      FTipoRetorno := RETORNO_ERRO;
      MessageInfo :=
        CMTranslate('Ocorreu um erro ao abrir os dados auxiliares dos Lançamentos Contábeis.') +
        MSG_ERRO + E.Message;
    end;
  end;
end;

procedure TCtrlParamContabFolha.GerarRelatPrincipal(const TipoLanc: TTipoLancContab;
  const ValorLanc: currency; const CodRub: string; const DescrRub: string);
var
  sID, sLinha: string;
  iPos: integer;

{->}procedure InserirPessoaLista(const ID: string);
    var
      sIdPessoa: string;
    begin
      sIdPessoa := '#'+FCdsFunc.FieldByName('IDPESSOA').asString+'#';
      if (FConta_x_Pessoa.IndexOfName(ID) = -1) then
        FConta_x_Pessoa.Add(ID +'='+ sIdPessoa)
      else
      begin
        sLinha := FConta_x_Pessoa.Values[ID];
        if (Pos(sIdPessoa, sLinha) <= 0) then
        begin
          InserirCodigoEm(sLinha, sIdPessoa);
          FConta_x_Pessoa.Values[ID] := sLinha;
        end;
      end;
{->}end;

begin
  if (TipoLanc = tlcDebito) or (FPartidaDobrada) then
    sID := '1_' + FLinhaLanc.ContaDeb; // O '1' serve somente para ordenar

  if (TipoLanc = tlcCredito) or (FPartidaDobrada) then
    sID := '2_' + FLinhaLanc.ContaCre; // O '2' serve somente para ordenar

  if (CodRub = '') then
    sID := sID + FCdsValContab.FieldByName('CODPROVDESC').asString
  else
    sID := sID + CodRub;

  iPos := FLancRelat.IndexOf(sID);
  if (iPos > -1) then
  begin
    {$IFDEF DEPURANDO}
    //FLog.Inserir('Edit');
    {$ENDIF}
    if (TipoLanc in [tlcDebito,tlcPartidaDobrada]) and (FLinhaLanc.ContaDeb <> '') then
      TLancRelat(FLancRelat.Objects[iPos]).ValorDeb :=
        TLancRelat(FLancRelat.Objects[iPos]).ValorDeb + Arredondar(ValorLanc,2);

    if (TipoLanc in [tlcCredito,tlcPartidaDobrada]) and (FLinhaLanc.ContaCre <> '') then
      TLancRelat(FLancRelat.Objects[iPos]).ValorCre :=
        TLancRelat(FLancRelat.Objects[iPos]).ValorCre + Arredondar(ValorLanc,2);
  end
  else
  begin
    {$IFDEF DEPURANDO}
    //FLog.Inserir('Insert');
    {$ENDIF}
    iPos := FLancRelat.AddObject(sID, TLancRelat.Create);

    with TLancRelat(FLancRelat.Objects[iPos]) do
    begin
      if (CodRub = '') then
        CodRubrica := FCdsValContab.FieldByName('CODPROVDESC').asString
      else
        CodRubrica := CodRub;

      if (DescrRub = '') then
        NomeRubrica := FCdsContabFolha.FieldByName('DESCRICAO').asString
      else
        NomeRubrica := DescrRub;

      if (TipoLanc in [tlcDebito,tlcPartidaDobrada]) and (FLinhaLanc.ContaDeb <> '') then
      begin
        ContaDeb := FLinhaLanc.ContaDeb;
        HistoricoDeb := FLinhaLanc.HistoricoDeb;
        ValorDeb := Arredondar(ValorLanc,2);

        if (FLinhaLanc.ObrigaCCustoDeb) then
        begin
          if (FCdsCCusto.Locate('CODIGO;IDEMPRESA',
              VarArrayOf([FLinhaLanc.CCustoDeb,FIdEmpresa]), [])) then
          begin
            CCusto := FLinhaLanc.CCustoDeb;
            NomeCCusto := FCdsCCusto.FieldByName('NOME').asString;
          end;
        end;
      end;

      if (TipoLanc in [tlcCredito,tlcPartidaDobrada]) and (FLinhaLanc.ContaCre <> '') then
      begin
        ContaCre := FLinhaLanc.ContaCre;
        HistoricoCre := FLinhaLanc.HistoricoCre;
        ValorCre := Arredondar(ValorLanc,2);

        if (FLinhaLanc.ObrigaCCustoCre) then
        begin
          if (FCdsCCusto.Locate('CODIGO;IDEMPRESA',
              VarArrayOf([FLinhaLanc.CCustoCre,FIdEmpresa]), [])) then
          begin
            CCusto := FLinhaLanc.CCustoCre;
            NomeCCusto := FCdsCCusto.FieldByName('NOME').asString;
          end;
        end;
      end;

      // Indicar o Centro de Custo Padrão para o caso de não ter sido indicado nenhum
      if (((TipoLanc in [tlcDebito,tlcPartidaDobrada]) and (FLinhaLanc.ContaDeb <> '')) or
          ((TipoLanc in [tlcCredito,tlcPartidaDobrada]) and (FLinhaLanc.ContaCre <> ''))) and
         (CCusto = '') then
      begin
        CCusto := '00';
        NomeCCusto := CMTranslate('Centro de Custo Padrão');
      end;
    end;  
  end;

  if (TipoLanc in [tlcDebito,tlcPartidaDobrada]) and (FLinhaLanc.ContaDeb <> '') then
    InserirPessoaLista('1_' + TLancRelat(FLancRelat.Objects[iPos]).ContaDeb);

  if (TipoLanc in [tlcCredito,tlcPartidaDobrada]) and (FLinhaLanc.ContaCre <> '') then
    InserirPessoaLista('2_' + TLancRelat(FLancRelat.Objects[iPos]).ContaCre);
end;

procedure TCtrlParamContabFolha.GerarRelatResumo(const TipoLanc: TTipoLancContab;
  const ValorLanc: currency);
var
  sID: string;
  iPos: integer;
begin
  if (TipoLanc = tlcDebito) then
    sID := '1_' + FLinhaLanc.ContaDeb // O '1_' serve somente para ordenar
  else
    sID := '2_' + FLinhaLanc.ContaCre; // O '2_' serve somente para ordenar

  sID := IntToStr(FLinhaLanc.IdEmpresa) + sID;

  iPos := FLancRelatResumo.IndexOf(sID);
  if (iPos > -1) then
  begin
    {$IFDEF DEPURANDO}
    //FLog.Inserir('Edit');
    {$ENDIF}
    TLancRelatResumo(FLancRelatResumo.Objects[iPos]).Valor :=
      TLancRelatResumo(FLancRelatResumo.Objects[iPos]).Valor + Abs(Arredondar(ValorLanc,2));
  end
  else
  begin
    {$IFDEF DEPURANDO}
    //FLog.Inserir('Insert');
    {$ENDIF}
    iPos := FLancRelatResumo.AddObject(sID, TLancRelatResumo.Create);

    with TLancRelatResumo(FLancRelatResumo.Objects[iPos]) do
    begin
      if (TipoLanc = tlcDebito) then
        Conta := FLinhaLanc.ContaDeb
      else
        Conta := FLinhaLanc.ContaCre;

      TipoConta := TIPO_CAMPO_ORDEM[TipoLanc];
      Valor := Abs(Arredondar(ValorLanc,2));
    end;
  end;
end;

procedure TCtrlParamContabFolha.GerarLancRelatDetalhado(const TipoLanc: TTipoLancContab;
  const ValorLanc: currency; const CodRub: string);
var
  sID: string;
  iPos: integer;
begin
  if (TipoLanc = tlcDebito) then
    sID := '1_' + FLinhaLanc.ContaDeb // O '1_' serve somente para ordenar
  else
    sID := '2_' + FLinhaLanc.ContaCre; // O '2_' serve somente para ordenar

  sID := sID +FCdsFunc.FieldByName('IDPESSOA').asString+ CodRub;

  iPos := FLancRelatDetalhado.AddObject(sID, TLancRelatDetalhado.Create);

  with TLancRelatDetalhado(FLancRelatDetalhado.Objects[iPos]) do
  begin
    if (TipoLanc = tlcDebito) then
      Conta := FLinhaLanc.ContaDeb
    else
      Conta := FLinhaLanc.ContaCre;

    if (CodRub = '') then
      CodRubrica := FCdsValContab.FieldByName('CODPROVDESC').asString
    else
      CodRubrica := CodRub;

    IdPessoa := FCdsFunc.FieldByName('IDPESSOA').asFloat;
    NomePessoa := FCdsFunc.FieldByName('NOME').asString;
    TipoConta := TIPO_CAMPO_ORDEM[TipoLanc];
    Valor := Abs(Arredondar(ValorLanc,2));
  end;
end;

procedure TCtrlParamContabFolha.InserirDadosRelat(const TipoLanc: TTipoLancContab;
  const ValorLanc: currency; const CodRubrica: string; const DescrRubrica: string);
begin
  GerarRelatPrincipal(TipoLanc, ValorLanc, CodRubrica, DescrRubrica);
  GerarRelatResumo(TipoLanc, ValorLanc);
  GerarLancRelatDetalhado(TipoLanc, ValorLanc, CodRubrica);
end;

procedure TCtrlParamContabFolha.InserirDadosPlanilha(const IdEmpresa: integer;
  const TipoLanc: TTipoLancContab; const UnidNegoc, IdPlano: integer;
  const ContaDebito: string; const ObrigaSubContaDebito: boolean;
  const SubContaDebito: double; const ObrigaCentroCustoDebito: boolean;
  const CodCentroCustoDebito: string; const ContaCredito: string;
  const ObrigaSubContaCredito: boolean; const SubContaCredito: double;
  const ObrigaCentroCustoCredito: boolean; const CodCentroCustoCredito: string;
  const Historico: string; const Valor: currency);
var
  sID: string;
  iPos: integer;
begin
  sID :=
    IntToStr(IdEmpresa)+
    IntToStr(UnidNegoc)+
    IntToStr(Integer(TipoLanc))+
    IFF((TipoLanc in [tlcDebito,tlcPartidaDobrada]) and (ContaDebito=''),'',ContaDebito+
      IFF(not(ObrigaSubContaDebito) or (SubContaDebito=0),'',FloatToStr(SubContaDebito))+
      IFF(not(ObrigaCentroCustoDebito) or (CodCentroCustoDebito=''),'',CodCentroCustoDebito))+
    IFF((TipoLanc in [tlcCredito,tlcPartidaDobrada]) and (ContaCredito=''),'',ContaCredito+
      IFF(not(ObrigaSubContaCredito) or (SubContaCredito=0),'', FloatToStr(SubContaCredito))+
      IFF(not(ObrigaCentroCustoCredito) or (CodCentroCustoCredito=''),'', CodCentroCustoCredito))+
    IFF(FConsolida, '', Historico)+
    IntToStr(IdPlano);

  {$IFDEF DEPURANDO}
  FLog.Inserir(IFF(TipoLanc = tlcDebito, ContaDebito +'D=', ContaCredito +'C=') +FloatToStr(Valor));
  {$ENDIF}

  iPos := FLancPlanilha.IndexOf(sID);
  if (iPos > -1) then
  begin
    {$IFDEF DEPURANDO}
    //FLog.Inserir('Edit');
    {$ENDIF}
    TLancPlanilha(FLancPlanilha.Objects[iPos]).Valor :=
      TLancPlanilha(FLancPlanilha.Objects[iPos]).Valor + Arredondar(Valor,2);
  end
  else
  begin
    {$IFDEF DEPURANDO}
    //FLog.Inserir('Insert');
    {$ENDIF}
    iPos := FLancPlanilha.AddObject(sID, TLancPlanilha.Create);
    
    TLancPlanilha(FLancPlanilha.Objects[iPos]).IdEmpresa := IdEmpresa;
    TLancPlanilha(FLancPlanilha.Objects[iPos]).Tipo := TipoLanc;
    TLancPlanilha(FLancPlanilha.Objects[iPos]).UnidNegoc := UnidNegoc;
    TLancPlanilha(FLancPlanilha.Objects[iPos]).IdPlano := IdPlano;
    TLancPlanilha(FLancPlanilha.Objects[iPos]).Historico := Historico;
    TLancPlanilha(FLancPlanilha.Objects[iPos]).Valor := Arredondar(Valor,2);

    if (TipoLanc in [tlcDebito,tlcPartidaDobrada]) and (ContaDebito <> '') then
    begin
      TLancPlanilha(FLancPlanilha.Objects[iPos]).ContaDeb := ContaDebito;
      if (ObrigaSubContaDebito) then
        TLancPlanilha(FLancPlanilha.Objects[iPos]).SubContaDeb := SubContaDebito;
      if (ObrigaCentroCustoDebito) then
        TLancPlanilha(FLancPlanilha.Objects[iPos]).CCustoDeb := CodCentroCustoDebito;
    end;

    if (TipoLanc in [tlcCredito,tlcPartidaDobrada]) and (ContaCredito <> '') then
    begin
      TLancPlanilha(FLancPlanilha.Objects[iPos]).ContaCre := ContaCredito;
      if (ObrigaSubContaCredito) then
        TLancPlanilha(FLancPlanilha.Objects[iPos]).SubContaCre := SubContaCredito;
      if (ObrigaCentroCustoCredito) then
        TLancPlanilha(FLancPlanilha.Objects[iPos]).CCustoCre := CodCentroCustoCredito;
    end;
  end;
end;

function TCtrlParamContabFolha.GravarPlanilhas: boolean;
var
  bPrimeiroReg: boolean;
  c: integer;
  _ListaPlnCodigo: TStringList;

{->}function GetPlnCodigo: double;
    var
      iPos: integer;
    begin
      iPos := _ListaPlnCodigo.IndexOfName(FCdsEmpresa.FieldByName('IDPESSOA').asString);
      if (iPos = -1) then
        Result := 0
      else
        Result := StrToFloat(_ListaPlnCodigo.Values[_ListaPlnCodigo.Names[iPos]]);
{->}end;

{->}procedure SetPlnCodigo(const PlnCodigo: double);
    var
      iPos: integer;
    begin
      iPos := _ListaPlnCodigo.IndexOfName(FCdsEmpresa.FieldByName('IDPESSOA').asString);
      if (iPos = -1) then
        _ListaPlnCodigo.Add(FCdsEmpresa.FieldByName('IDPESSOA').asString +
          '='+ FloatToStr(PlnCodigo));
{->}end;

{$IFDEF DEPURANDO}
{->}procedure SalvarLancamentos;
    var
      c: integer;
      _ListLanc: TStringList;
    begin
      _ListLanc := TStringList.Create;
      try
        _ListLanc.Add(
          Alinha('IdEmpresa',10,'D',' ') +' | '+
          Alinha('PlnCodigo',10,'D',' ') +' | '+
          Alinha('TipoLanc',10,'D',' ') +' | '+
          Alinha('UnidNegoc',10,'D',' ') +' | '+
          Alinha('Plano',10,'D',' ') +' | '+
          Alinha('ContaDeb',18,'D',' ') +' | '+
          Alinha('SubContaDeb',13,'D',' ') +' | '+
          Alinha('CCustoDeb',10,'D',' ') +' | '+
          Alinha('ContaCre',18,'D',' ') +' | '+
          Alinha('SubContaCre',13,'D',' ') +' | '+
          Alinha('CCustoCre',10,'D',' ') +' | '+
          Alinha('Historico',100,'E',' ') +' | '+
          Alinha('Valor',10,'D',' '));

        // Valores das colunas
        for c:=0 to FLancPlanilha.Count-1 do
        begin
          _ListLanc.Add(
            Alinha(FloatToStr(TLancPlanilha(FLancPlanilha.Objects[c]).IdEmpresa),10,'D',' ') +' | '+
            Alinha(FloatToStr(TLancPlanilha(FLancPlanilha.Objects[c]).PlnCodigo),10,'D',' ') +' | '+
            Alinha(IntToStr(Integer(TLancPlanilha(FLancPlanilha.Objects[c]).Tipo)),10,'D',' ') +' | '+
            Alinha(FloatToStr(TLancPlanilha(FLancPlanilha.Objects[c]).UnidNegoc),10,'D',' ') +' | '+
            Alinha(IntToStr(TLancPlanilha(FLancPlanilha.Objects[c]).IdPlano),10,'D',' ') +' | '+
            Alinha(QuotedStr(TLancPlanilha(FLancPlanilha.Objects[c]).ContaDeb),18,'D',' ') +' | '+
            Alinha(FloatToStr(TLancPlanilha(FLancPlanilha.Objects[c]).SubContaDeb),13,'D',' ') +' | '+
            Alinha(QuotedStr(TLancPlanilha(FLancPlanilha.Objects[c]).CCustoDeb),10,'D',' ') +' | '+
            Alinha(QuotedStr(TLancPlanilha(FLancPlanilha.Objects[c]).ContaCre),18,'D',' ') +' | '+
            Alinha(FloatToStr(TLancPlanilha(FLancPlanilha.Objects[c]).SubContaCre),13,'D',' ') +' | '+
            Alinha(QuotedStr(TLancPlanilha(FLancPlanilha.Objects[c]).CCustoCre),10,'D',' ') +' | '+
            Alinha(QuotedStr(TLancPlanilha(FLancPlanilha.Objects[c]).Historico),100,'E',' ') +' | '+
            Alinha(FormatFloat('###,###,###,##0.00', TLancPlanilha(FLancPlanilha.Objects[c]).Valor),10,'D',' '));
        end;
      finally
        //istLanc.SaveToFile('c:\LancPlanilha.txt');
        istLanc.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\LancPlanilha.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
        _ListLanc.Free;
      end;
{->}end;
{$ENDIF}

begin
  EnviarMensagem(CMTranslate('Gravando dados da Integração com a Contabilidade...'));

  _ListaPlnCodigo := TStringList.Create;
  try
    while not(FCdsEmpresa.EOF) do
    begin
      bPrimeiroReg := true;
      for c:=0 to FLancPlanilha.Count-1 do
      begin
        if (TLancPlanilha(FLancPlanilha.Objects[c]).IdEmpresa <>
            FCdsEmpresa.FieldByName('IDPESSOA').asInteger) then
          continue;

        Result := FCtrlIntegraContabRH.InserirLancamento(
          GetPlnCodigo, 
          TLancPlanilha(FLancPlanilha.Objects[c]).IdEmpresa,
          TLancPlanilha(FLancPlanilha.Objects[c]).Tipo,
          FTipoOperacao,
          FConsolida, 
          FDataLancContab,
          TLancPlanilha(FLancPlanilha.Objects[c]).UnidNegoc,
          TLancPlanilha(FLancPlanilha.Objects[c]).IdPlano,
          TLancPlanilha(FLancPlanilha.Objects[c]).ContaDeb,
          TLancPlanilha(FLancPlanilha.Objects[c]).SubContaDeb,
          TLancPlanilha(FLancPlanilha.Objects[c]).CCustoDeb,
          TLancPlanilha(FLancPlanilha.Objects[c]).ContaCre,
          TLancPlanilha(FLancPlanilha.Objects[c]).SubContaCre,
          TLancPlanilha(FLancPlanilha.Objects[c]).CCustoCre,
          FAnoMes, // Número do Documento
          TLancPlanilha(FLancPlanilha.Objects[c]).Historico, // 1ª Linha da Histórico
          '', // 2ª Linha da Histórico
          TLancPlanilha(FLancPlanilha.Objects[c]).Valor);

        if (Result) then
        begin
          if (bPrimeiroReg) then
            SetPlnCodigo(FCtrlIntegraContabRH.PlnCodigo);
        end
        else
          raise Exception.Create(FCtrlIntegraContabRH.MessageInfo);

        bPrimeiroReg := false;
      end;

      // Gravar o PlnCodigo do Lançamento gerado em todas os outros lançamentos da Empresa
      // Proprietária atual
      for c:=0 to FLancPlanilha.Count-1 do
      begin
        if (TLancPlanilha(FLancPlanilha.Objects[c]).IdEmpresa =
            FCdsEmpresa.FieldByName('IDPESSOA').asInteger) then
          TLancPlanilha(FLancPlanilha.Objects[c]).PlnCodigo := FCtrlIntegraContabRH.PlnCodigo;
      end;

      FCdsEmpresa.Next;
    end;

    {$IFDEF DEPURANDO}
    SalvarLancamentos;
    {$ENDIF}

    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
  _ListaPlnCodigo.Free;
end;

function TCtrlParamContabFolha.GerarRelatIntegracaoContab(const IAppCliente: OleVariant;
  const Mes, Ano: integer; const IdEstab: double; const ListaIdTipoFolha, ListaIdRubrica,
  ListaCodCCusto, ListaIdPessoa, TipoOperacao: string; const CodSubContaIni,
  CodSubContaFin: string; const Previa, ObrigaAbc, ObrigaCRespon: boolean;
  const PlanoPrevGlobal, PatroGlobal: integer; const PartidaDobrada: boolean;
  var ovLancRelat, ovLancRelatResumo, ovLancRelatDetalhado_Mestre,
  ovLancRelatDetalhado_Detalhe: OleVariant): boolean;
const
  TIPO_CAMPO: array[0..1] of string = ('Débito', 'Crédito');
  CAMPO: array[0..1] of string = ('CONTADEBITO', 'CONTACREDITO');
  CAMPO_VALOR: array[0..1] of string = ('VALOR_DEBITO', 'VALOR_CREDITO');
var
  bOk: boolean;
  c: integer;
  _CdsAux: TCMClientDataSet;

{->}function GetNumPessoas(const ID: string): integer;
    var
      iPos: integer;
    begin
      Result := 0;
      repeat
        iPos := FConta_x_Pessoa.IndexOfName(ID);
        if (iPos >= 0) then
        begin
          Result := ContaCaracter(FConta_x_Pessoa.Values[ID], ',') + 1;
          FConta_x_Pessoa.Delete(iPos);
        end;
      until (iPos = -1);
{->}end;

{-->}function GetNomeConta(const Conta: string): string;
     begin
       if (_CdsAux.Locate('PLACONTA', Conta, [])) then
         Result := _CdsAux.FieldByName('PLANOME').asString
       else
         Result := '';
{-->}end;

{->}procedure GerarRelatPrincipal;
    var
      c: integer;
    begin
      for c:=0 to FLancRelat.Count-1 do
        with TLancRelat(FLancRelat.Objects[c]),FCdsLancRelat do
        begin
          Append;
          FieldByName('IDEMPRESA').asInteger := FIdEmpresa;
          FieldByName('NOME_EMPRESA').asString := FCdsEmpresa.FieldByName('NOME').asString;
          FieldByName('CODPROVDESC').asString := CodRubrica;
          FieldByName('DESCRPROVDESC').asString := NomeRubrica;
          FieldByName('CONTADEBITO').asString := ContaDeb;
          FieldByName('CONTACREDITO').asString := ContaCre;
          FieldByName('HISTORICO_DEBITO').asString := HistoricoDeb;
          FieldByName('HISTORICO_CREDITO').asString := HistoricoCre;
          FieldByName('CODCENTROCUSTO').asString := CCusto;
          FieldByName('NOME_CENTROCUSTO').asString := NomeCCusto;

          if (ContaDeb <> '') then
            FieldByName('VALOR_ABS').asCurrency := Abs(ValorDeb);

          if (ContaCre <> '') then
            FieldByName('VALOR_ABS').asCurrency := Abs(ValorCre);

          FieldByName('VALOR').asCurrency := ValorDeb - ValorCre;
          FieldByName('VALOR_DEBITO').asCurrency := ValorDeb;
          FieldByName('VALOR_CREDITO').asCurrency := ValorCre;
          Post;
        end;
{->}end;

{->}procedure GerarRelatResumo(const Posicao: integer);
    begin
      with TLancRelatResumo(FLancRelatResumo.Objects[Posicao]),FCdsLancRelatResumo do
      begin
        Append;
        FieldByName('CONTA').asString := Conta;
        FieldByName('TIPO_CONTA').asString := CMTranslate(TIPO_CAMPO[TipoConta]);
        FieldByName('TIPO_CONTA_ORDEM').asInteger := TipoConta;
        FieldByName('NOME_CONTA').asString := GetNomeConta(Conta);
        FieldByName('NUM_PESSOAS').asInteger :=
          GetNumPessoas(IntToStr(TipoConta+1) +'_'+ Conta);
        FieldByName('VALOR').asFloat := Valor;
        Post;
      end;
{->}end;

{->}procedure GerarRelatDetalhado_Mestre(const Posicao: integer);
    begin
      with TLancRelatResumo(FLancRelatResumo.Objects[Posicao]),FCdsLancRelatDetalhado_Mestre do
      begin
        Append;
        FieldByName('CONTA').asString := Conta;
        FieldByName('TIPO_CONTA').asString := CMTranslate(TIPO_CAMPO[TipoConta]);
        FieldByName('TIPO_CONTA_ORDEM').asInteger := TipoConta;
        FieldByName('NOME_CONTA').asString := GetNomeConta(Conta);
        FieldByName('VALOR').asFloat := Valor;
        Post;
      end;
{->}end;

{->}procedure GerarRelatDetalhado_Detalhe;
    var
      c: integer;
    begin
      for c:=0 to FLancRelatDetalhado.Count-1 do
        with TLancRelatDetalhado(FLancRelatDetalhado.Objects[c]),FCdsLancRelatDetalhado_Detalhe do
        begin
          Insert;
          FieldByName('IDPESSOA').asFloat := IdPessoa;
          FieldByName('NOME_PESSOA').asString := NomePessoa;
          FieldByName('TIPO_CONTA_ORDEM').asInteger := TipoConta;
          FieldByName('CONTA').asString := Conta;
          FieldByName('COD_RUBRICA').asString := CodRubrica;
          FieldByName('VALOR').asFloat := Valor;
          Post;
        end;
{->}end;

{->}procedure CriarRegistrosEmBranco;
    begin
      FCdsLancRelat.EmptyDataSet;
      FCdsLancRelat.Append;
      FCdsLancRelat.Post;
      FCdsLancRelatResumo.EmptyDataSet;
      FCdsLancRelatResumo.Append;
      FCdsLancRelatResumo.Post;
      FCdsLancRelatDetalhado_Mestre.EmptyDataSet;
      FCdsLancRelatDetalhado_Mestre.Append;
      FCdsLancRelatDetalhado_Mestre.Post;
      FCdsLancRelatDetalhado_Detalhe.EmptyDataSet;
      FCdsLancRelatDetalhado_Detalhe.Append;
      FCdsLancRelatDetalhado_Detalhe.Post;
{->}end;

{$IFDEF DEPURANDO}
{->}procedure SalvarLancamentos;
    var
      c: integer;
      _ListLanc: TStringList;
    begin
      _ListLanc := TStringList.Create;
      try
        _ListLanc.Add(
          Alinha('ID',40,'E',' ') +' | '+
          Alinha('CodRubrica',15,'D',' ') +' | '+
          Alinha('NomeRubrica',100,'E',' ') +' | '+
          Alinha('ContaDeb',18,'D',' ') +' | '+
          Alinha('ContaCre',18,'D',' ') +' | '+
          Alinha('HistoricoDeb',50,'E',' ') +' | '+
          Alinha('HistoricoCre',50,'E',' ') +' | '+
          Alinha('CCusto',10,'D',' ') +' | '+
          Alinha('ValorDeb',13,'D',' ') +' | '+
          Alinha('ValorCre',13,'D',' '));

        // Valores das colunas
        for c:=0 to FLancRelat.Count-1 do
        begin
          _ListLanc.Add(
            Alinha(QuotedStr(FLancRelat[c]),40,'E',' ') +' | '+
            Alinha(QuotedStr(TLancRelat(FLancRelat.Objects[c]).CodRubrica),15,'D',' ') +' | '+
            Alinha(QuotedStr(TLancRelat(FLancRelat.Objects[c]).NomeRubrica),100,'E',' ') +' | '+
            Alinha(QuotedStr(TLancRelat(FLancRelat.Objects[c]).ContaDeb),18,'D',' ') +' | '+
            Alinha(QuotedStr(TLancRelat(FLancRelat.Objects[c]).ContaCre),18,'D',' ') +' | '+
            Alinha(QuotedStr(TLancRelat(FLancRelat.Objects[c]).HistoricoDeb),50,'E',' ') +' | '+
            Alinha(QuotedStr(TLancRelat(FLancRelat.Objects[c]).HistoricoCre),50,'E',' ') +' | '+
            Alinha(QuotedStr(TLancRelat(FLancRelat.Objects[c]).CCusto),10,'D',' ') +' | '+
            Alinha(FormatFloat('###,###,###,##0.00', TLancRelat(FLancRelat.Objects[c]).ValorDeb),13,'D',' ') +' | '+
            Alinha(FormatFloat('###,###,###,##0.00', TLancRelat(FLancRelat.Objects[c]).ValorCre),13,'D',' '));
        end;
      finally
        //_ListLanc.SaveToFile('c:\LancRelat.txt');
        _ListLanc.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\LancRelat.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
        _ListLanc.Free;
      end;
{->}end;
{$ENDIF}

begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GerarRelatIntegracaoContab(IAppCliente,
      FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, Mes, Ano, FIdEmpresa, FIdModulo, FIdUsuario,
      FIdHotel, IdEstab, ListaIdTipoFolha, ListaIdRubrica, ListaCodCCusto, ListaIdPessoa,
      TipoOperacao, CodSubContaIni, CodSubContaFin, Previa, ObrigaAbc, ObrigaCRespon,
      PlanoPrevGlobal, PatroGlobal, PartidaDobrada, FUsaPlanoPatro, FIdPatro, FIdPlanoPrev,
      FTipoRetorno, ovLancRelat, ovLancRelatResumo, ovLancRelatDetalhado_Mestre,
      ovLancRelatDetalhado_Detalhe);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    bOk := false;
    FListaIdRubrica := ListaIdRubrica;
    FListaIdPessoa := ListaIdPessoa;

    {$IFDEF DEPURANDO}
    //FLog.Init(tlArquivo, 'c:\ContabFolha.log');
    FLog.Init(tlArquivo, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ContabFolha.log');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    {$ENDIF}
    try
      FCdsLancRelat := TClientDataSet.Create(nil);
      FCdsLancRelatResumo := TClientDataSet.Create(nil);
      FCdsLancRelatDetalhado_Mestre := TClientDataSet.Create(nil);
      FCdsLancRelatDetalhado_Detalhe := TClientDataSet.Create(nil);

      _CdsAux := TCMClientDataSet.Create(nil);
      FCdsCCusto := TClientDataSet.Create(nil);

      FLancRelat := TStringList.Create;
      FLancRelatResumo := TStringList.Create;
      FLancRelatDetalhado := TStringList.Create;
      FConta_x_Pessoa := TStringList.Create;
      try
        FLancRelat.Sorted := true;
        FCdsCCusto.DisableStringTrim := true;

        FVerificarLancContab := true;

        // Selecionar tabela que conterá as Linhas do Relatório, Contas Bancárias
        // (resumo do relatório) e os Centros de Custo.
        if not(AbrirLancContab_EmBranco) or not(AbrirCCusto) then
          raise Exception.Create(MessageInfo);

        if not(GerarIntegracao(IAppCliente, false, true, true, Mes, Ano, Date, Date, Date,
          IdEstab, ListaIdTipoFolha, ListaCodCCusto, '', TipoOperacao, CodSubContaIni,
          CodSubContaFin, Previa, false, false, ObrigaAbc, ObrigaCRespon, PlanoPrevGlobal,
          PatroGlobal, PartidaDobrada, -1)) then
        begin
          raise Exception.Create(MessageInfo);
        end;

        //FConta_x_Pessoa.Sorted := true;
        {$IFDEF DEPURANDO}
        //FConta_x_Pessoa.SaveToFile('c:\ContaContabil_x_Pessoa.txt');
        FConta_x_Pessoa.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ContaContabil_x_Pessoa.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
        SalvarLancamentos;
        FLog.Inserir('Gerando Dados para os Componentes...');
        {$ENDIF}

        if (FLancRelat.Count > 0) then
        begin
          FCdsEmpresa.Locate('IDPESSOA', FIdEmpresa, []);
          _CdsAux.Data := FCtrlListTerceirosRH.ListContaContab;
          GerarRelatPrincipal;
          GerarRelatDetalhado_Detalhe;
          for c:=0 to FLancRelatResumo.Count-1 do
          begin
            GerarRelatResumo(c);
            GerarRelatDetalhado_Mestre(c);
          end;
        end;

        bOk := true;
      finally
        Result := (bOk) and (FLancRelat.Count > 0);

        if (FLancRelat.Count = 0) then
          CriarRegistrosEmBranco;

        {$IFDEF DEPURANDO}
        //FCdsLancRelat.SaveToFile('c:\CdsLancRelat.Cds');
        FCdsLancRelat.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CdsLancRelat.Cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
        //FCdsLancRelatResumo.SaveToFile('c:\CdsLancRelatResumo.Cds');
        FCdsLancRelatResumo.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CdsLancRelatResumo.Cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
        //FCdsLancRelatDetalhado_Mestre.SaveToFile('c:\CdsLancRelatDetalhado_Mestre.Cds');
        FCdsLancRelatDetalhado_Mestre.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CdsLancRelatDetalhado_Mestre.Cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
        //FCdsLancRelatDetalhado_Detalhe.SaveToFile('c:\CdsLancRelatDetalhado_Detalhe.Cds');
        FCdsLancRelatDetalhado_Detalhe.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CdsLancRelatDetalhado_Detalhe.Cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
        FLog.Inserir('Dados gerados.');
        {$ENDIF}

        ovLancRelat := FCdsLancRelat.Data;
        ovLancRelatResumo := FCdsLancRelatResumo.Data;
        ovLancRelatDetalhado_Mestre := FCdsLancRelatDetalhado_Mestre.Data;
        ovLancRelatDetalhado_Detalhe := FCdsLancRelatDetalhado_Detalhe.Data;

        FCdsLancRelat.Free;
        FCdsLancRelatResumo.Free;
        FCdsLancRelatDetalhado_Mestre.Free;
        FCdsLancRelatDetalhado_Detalhe.Free;
        _CdsAux.Free;
        FCdsCCusto.Free;

        FLancRelat.Clear;
        FLancRelat.Free;
        FLancRelatResumo.Clear;
        FLancRelatResumo.Free;
        FLancRelatDetalhado.Clear;
        FLancRelatDetalhado.Free;
        //FConta_x_Pessoa.Clear;
        FConta_x_Pessoa.Free;
      end;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
        if (FTipoRetorno <> RETORNO_AVISO) then
          FTipoRetorno := RETORNO_ERRO;
      end;
    end;
    {$IFDEF DEPURANDO}
    FLog.Finish;
    {$ENDIF}
  end;
end;

function TCtrlParamContabFolha.GerarIntegracao(const IAppCliente: OleVariant; const FazCAP,
  FazContab, Consolida: boolean; const Mes, Ano: integer; const DataEmissao, DataPagamento,
  DataLancContab: TDateTime; const IdEstab: double; const ListaIdTipoFolha, ListaCodCCusto,
  ListaTipoDesemb, TipoOperacao, CodSubContaIni, CodSubContaFin: string; const Previa,
  ConsTipoDesemb, Rateio, ObrigaAbc, ObrigaCRespon: boolean; const PlanoPrevGlobal,
  PatroGlobal: integer; const PartidaDobrada: boolean; const CodTipDoc: integer): boolean;
var
  {$IFDEF DEPURANDO}
  IniHoraPessoa: TTime;
  {$ENDIF}
  LocalErro: integer;
begin
  if (ConnectionSide = cnsClient) and not(FVerificarLancContab) then
  begin
    Result := Connection.AppServer.GerarIntegracaoContabCAP(IAppCliente,
      FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, FazCAP, FazContab, Consolida, Mes, Ano,
      DataEmissao, DataPagamento, DataLancContab, FIdEmpresa, FIdModulo, FIdUsuario,
      FIdHotel, IdEstab, ListaIdTipoFolha, ListaCodCCusto, ListaTipoDesemb, TipoOperacao,
      CodSubContaIni, CodSubContaFin, Previa, ConsTipoDesemb, Rateio, ObrigaAbc,
      ObrigaCRespon, PlanoPrevGlobal, PatroGlobal, PartidaDobrada, CodTipDoc, FUsaPlanoPatro,
      FIdPatro, FIdPlanoPrev, FTipoRetorno);
    MessageInfo := Connection.AppServer.MessageInfo;
  end  
  else
  begin
    Result := true;
    FTipoRetorno := RETORNO_NORMAL;
    LocalErro := ERRO_GENERICO;
    FIAppCliente := IAppCliente;

    {$IFDEF DEPURANDO}
    if not(FVerificarLancContab) then
      //FLog.Init(tlArquivo, 'c:\ContabFolha.log');
      FLog.Init(tlArquivo, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ContabFolha.log');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    {$ENDIF}

    FHoraInicial := Time;
    try
      FCdsFunc := TClientDataSet.Create(nil);
      FCdsCAPFolha := TClientDataSet.Create(nil);
      FCdsValor := TClientDataSet.Create(nil);
      FCdsValCAP := TClientDataSet.Create(nil);
      FCdsContabFolha := TClientDataSet.Create(nil);
      FCdsValContab := TClientDataSet.Create(nil);
      FCdsValContabAux := TClientDataSet.Create(nil);
      FCdsDocumentos := TClientDataSet.Create(nil);

      FLancPlanilha := TStringList.Create;
      FLancPlanilha.Sorted := true;

      FSQL := TStringList.Create;
      FListaGrupoIdPessoa := TStringList.Create;

      // Não pode fazer o TRIM das Strings pois o código do Histórico Padrão é do tipo CHAR
      // e portanto pode ser composto de brancos à direita.
      FCdsFunc.DisableStringTrim := true;
      FCdsValCAP.DisableStringTrim := true;
      FCdsValContab.DisableStringTrim := true;
      FCdsValContabAux.DisableStringTrim := true;
      FCdsContabFolha.DisableStringTrim := true;

      FCdsValCAP.Filtered := true;
      FCdsValContab.Filtered := true;

      if (Previa) then
        FNomeTabela := 'PREVIAFOLPAG'
      else
        FNomeTabela := 'HISTRUBSAL';

      FIdEstab := IdEstab;
      FDataLancContab := DataLancContab;
      FAnoMes := IntToStr(Ano) +'/'+ PoeZero(Mes);
      FListaIdTipoFolha := ListaIdTipoFolha;
      FListaCodCCusto := ListaCodCCusto;
      FListaTipoDesemb := ListaTipoDesemb;
      FCodSubContaIni := CodSubContaIni;
      FCodSubContaFin := CodSubContaFin;
      FGerouPlanilha := false;
      FGerouAP := false;
      FConsolida := Consolida;
      FPartidaDobrada := PartidaDobrada;
      FObrigaAbc := ObrigaAbc;
      FObrigaCRespon := ObrigaCRespon;
      FFazCAP := FazCAP;
      FFazContab := FazContab;
      FTipoOperacao := TipoOperacao;

      FCtrlIntegraCAPCAR_RH.CdsDocumentos := TCMClientDataSet(FCdsDocumentos);
      FCtrlIntegraCAPCAR_RH.ObrigaAbc := FObrigaAbc;
      FCtrlIntegraCAPCAR_RH.ObrigaCRespon := FObrigaCRespon;
      FCtrlIntegraCAPCAR_RH.IdModulo := FIdModulo;
      FCtrlIntegraCAPCAR_RH.IdUsuario := FIdUsuario;
      FCtrlIntegraCAPCAR_RH.CodTipDoc := CodTipDoc;
      FCtrlIntegraCAPCAR_RH.IdEmpresa := FIdEmpresa;
      FCtrlIntegraCAPCAR_RH.ConsTipoDesemb := ConsTipoDesemb;

      try
        if not(FCtrlIntegraContabRH.VerificaPeriodoContabil(FIdEmpresa, FDataLancContab)) then
        begin
          FTipoRetorno := RETORNO_AVISO;
          raise Exception.Create(FCtrlIntegraContabRH.MessageInfo);
        end;

        // Fazer o preparo da query que irá obter os valores das rubricas de cada pessoa
        PrepararCdsValores;

        // Selecionar todas as Parametrizações
        {$IFDEF DEPURANDO}
        FLog.Inserir('Selecionando as Parametrizações...');
        {$ENDIF}

        // Selecionar dados auxiliares para a geração das planilhas contábeis
        if (FazContab) then
        begin
          // Nomes de todas as Empresas Proprietárias
          FCdsEmpresa.Data := FCtrlListTerceirosRH.ListEmpresaProp;
          // Lista dos Planos de Contas de todas as Empresas Proprietárias
          FCdsPlano.Data := GetDataPacket('SELECT IDPESSOA, PLANO FROM PARAMCONTAB');
          FCdsPlano.Filtered := true;
          FCdsPlano.Filter := 'IDPESSOA = ' + FloatToStr(FIdEmpresa);
          FIdPlano := FCdsPlano.FieldByName('PLANO').asInteger;
          FCdsPlano.Filter := '';
          // Contas Contábeis x Centros de Custo de todas as Empresas Proprietárias
          FCdsConta_X_CC.Data := GetDataPacket(
            'SELECT' +CR_LF+
            '  PLANO, PLACONTA, IDEMPRESA, CODCENTROCUSTO' +CR_LF+
            'FROM' +CR_LF+
            '  CONTASXCC'+
            IFF(FListaCodCCusto='','',
              CR_LF+ 'WHERE' +CR_LF+
              MontaLinhaSelSQL('  (CODCENTROCUSTO',FListaCodCCusto,1,false)));
          FCdsConta_X_CC.Filter := '';
          FCdsConta_X_CC.Filtered := true;
          // Contas Contábeis x Sub-Conta de todas as Empresas Proprietárias
          FCdsConta_X_SubConta.Data := GetDataPacket(
            'SELECT' +CR_LF+
            '  PLANO, PLACONTA, IDPESSOA, CODSUBCONTA' +CR_LF+
            'FROM' +CR_LF+
            '  CONTASXSUBC'+
            IFF(FCodSubContaIni='', '', CR_LF+
              'WHERE' +CR_LF+
              '  (CODSUBCONTA >= ' +FCodSubContaIni+ ') AND' +CR_LF+
              '  (CODSUBCONTA <= ' +FCodSubContaFin+ ')'));
          //FCdsConta_X_SubConta.Filter := '';
          //FCdsConta_X_SubConta.Filtered := true;

          // Verificar se algum empregado trabalhou em outros Centros de Custo no Mês
          FTemOutroCC := VerificaTemOutroCC;

          // Listar todos os registros de Horas Trabalhadas em Outro Centro de Custo
          if (FTemOutroCC) then
          begin
            {$IFDEF DEPURANDO}
            FLog.Inserir('Selecionando Horas Trabalhadas em Outro Setor...');
            {$ENDIF}
            if not(AbrirHorasTrabOutroCC) then
              raise Exception.Create(MessageInfo);
          end;

          // Inicializar as variáveis totalizadoras do rateio de contas Mútuo
          {$IFDEF MUTUO}
          InitTotalRateioMutuo;
          {$ENDIF}
        end;

        // Selecionar dados auxiliares para a geração da(s) AP(s)
        if (FazCAP) then
        begin
          if not(FCtrlIntegraCAPCAR_RH.AbrirQueryDocumentos) then
            raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);

          FPortadorFormaPadrao := FCtrlBancoPortFolha.GetCodPortFormaPadrao;
        end;

        if not(AbrirQueryParamContab) or not(AbrirQueryParamCAP) then
          raise Exception.Create(MessageInfo);

        // Montar Query com os dados das pessoas
        if not(AbrirQueryFunc(FazCAP)) then
          raise Exception.Create(MessageInfo);

        MontarListaGrupoIdPessoa;

        EnviarMensagem(CMTranslate('Processando informações...'));

        FHoraInicial_Pessoa := Time;

        // LOOP Principal da geração da Linhas de Integração
        FCdsFunc.First;
        repeat
          {$IFDEF DEPURANDO}
          IniHoraPessoa := Time;
          {$ENDIF}

          EnviarMensagem('',
            CMTranslate('Matr: ') +Trim(FCdsFunc.FieldByName('MATRICULA').asString) +
            CMTranslate('  Nome: ') +Trim(FCdsFunc.FieldByName('NOME').asString),
            GetTempoDecorrido);

          // Montar Query com os dados dos valores
          ListValores;

          // Geração dos Documentos para o CAP
          if (FazCAP) then
            if not(GerarCAP_Pessoa) then
            begin
              LocalErro := ERRO_CAP;
              raise Exception.Create(MessageInfo);
            end;

          // Geração das Planilhas Contábeis
          if (FazContab) then
            if not(GerarContab_Pessoa) then
            begin
              LocalErro := ERRO_CONTAB;
              raise Exception.Create(MessageInfo);
            end;

          {$IFDEF DEPURANDO}
          FLog.Inserir(
            '(' + Alinha(IntToStr(FCdsFunc.RecNo),4,'D',' ')+' de '+
            IntToStr(FCdsFunc.RecordCount)+ ' - ' +
            Alinha(FloatToStr((FCdsFunc.RecNo * 100) div FCdsFunc.RecordCount),3,'D',' ')+
            ' % ) - '+
            CMTranslate('Pessoa: ')+Alinha(FCdsFunc.FieldByName('NOME').asString,60,'E',' ')+
            ' - Tempo: ' +HoraPorExtenso(Time - IniHoraPessoa));
          {$ENDIF}

          if ((FCdsFunc.RecNo mod NUM_PESSOAS) = 1) or
             (FCdsFunc.RecNo = FCdsFunc.RecordCount) then
          begin
            Inc(FIndiceGrupoIdPessoa);
          end;

          FCdsFunc.Next;
          EnviarMensagem('', '', GetTempoDecorrido, 0, 1);
        until (FCdsFunc.EOF);

        FHoraFinal_Pessoa := Time;

        {$IFDEF DEPURANDO}
        FLog.Inserir('Gravando Dados...');
        {$ENDIF}

        // Fazer o lançamento dos valores de rateio usando as contas do Mútuo
        {$IFDEF MUTUO}
        if (FazContab) then
          LancarTotalRateioMutuo;
        {$ENDIF}

        if not(FVerificarLancContab) then
        begin
          try
            StartTransaction;

            // Gravar os Documentos no Banco da Dados
            if (FazCAP) then
            begin
              EnviarMensagem(CMTranslate('Gravando dados da Integração com o Contas a Pagar...'));
              FGerouAP := FCtrlIntegraCAPCAR_RH.GravarDocumentos(
                DataEmissao, DataPagamento, Rateio,
                FUsaPlanoPatro, PlanoPrevGlobal, PatroGlobal);

              if not(FGerouAP) then
              begin
                FTipoRetorno := FCtrlIntegraCAPCAR_RH.TipoRetorno;
                raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);
              end;

              EnviarMensagem('', '', GetTempoDecorrido, 0, 1,
                Replicate('-',40) +CR_LF+
                CMTranslate('*** AP(s) gerada(s) ***') +CR_LF+
                FCtrlIntegraCAPCAR_RH.NumDocGerados +CR_LF+
                Replicate('-',40));
            end;

            if (FazContab) then
            begin
              FGerouPlanilha := GravarPlanilhas;
              if not(FGerouPlanilha) then
                raise Exception.Create(MessageInfo);

              MontarMensagemPlanilhas;
            end;

            EnviarMensagem(CMTranslate('Efetivando dados da Integração...'));
            Commit;

            MontarMensagemTempo;
          except
            Rollback;
            raise;
          end;
        end;

        if (FazContab) and (FGerouPlanilha) and (not(FazCAP) or not(FGerouAP)) then
          MessageInfo := CMTranslate('Contabilização realizada com sucesso.')
        else
        if (FazCAP) and (FGerouAP) and (not(FazContab) or not(FGerouPlanilha)) then
          MessageInfo := CMTranslate('Integração com Contas a Pagar realizada com sucesso.')
        else
          MessageInfo := CMTranslate('Integração com Contas a Pagar e Contabilidade realizada com sucesso.');

        {$IFDEF DEPURANDO}
        FLog.Inserir(MessageInfo);
        {$ENDIF}
      except
        on E: Exception do
        begin
          Result := false;

          if (FTipoRetorno = RETORNO_AVISO) then
            MessageInfo := CMTranslateMsg(MSG_AVISO_GERACAO, [CR_LF])
          else
          begin
            FTipoRetorno := RETORNO_AVISO;
            MessageInfo := CMTranslate('Ocorreu um erro durante o processamento da integração.');
          end;  

          if (FVerificarLancContab) then
            MessageInfo := MessageInfo +CR_LF+CR_LF+ E.Message
          else
          begin
            MessageInfo := MessageInfo + CR_LF+
              CMTranslate('Consulte Resultado da geração para maiores detalhes.');

            EnviarMensagem('', '', '', 0, 0,
              IFF(FTipoRetorno=RETORNO_AVISO,CMTranslate('[AVISO]'),CMTranslate('[ERRO]'))+
              IFF(LocalErro=ERRO_GENERICO, '',
                IFF(LocalErro=ERRO_CONTAB, CMTranslate(' Geração da integração com a Contabilidade'),
                  IFF(LocalErro=ERRO_CAP, CMTranslate(' Geração da integração com o Contas a Pagar'), ''))) +CR_LF+
              E.Message +CR_LF+ Replicate('-',40));
          end;

          {$IFDEF DEPURANDO}
          FLog.Inserir(MessageInfo);
          {$ENDIF}
        end;
      end;
    finally
      FreeAndNil(FCdsFunc);
      FreeAndNil(FCdsValor);
      FreeAndNil(FCdsValCAP);
      FreeAndNil(FCdsValContab);
      FreeAndNil(FCdsValContabAux);
      FreeAndNil(FCdsContabFolha);
      FreeAndNil(FCdsCAPFolha);
      FreeAndNil(FCdsDocumentos);

      FLancPlanilha.Clear;
      FreeAndNil(FLancPlanilha);

      FreeAndNil(FSQL);
      FreeAndNil(FListaGrupoIdPessoa);
    end;

    EnviarMensagem('', '', GetTempoDecorrido);
    
    {$IFDEF DEPURANDO}
    if not(FVerificarLancContab) then
      FLog.Finish;
    {$ENDIF}
  end;
end;

function TCtrlParamContabFolha.GerarCAP_Pessoa: boolean;
begin
  FCdsValCAP.First;
  repeat
    if (FCdsCAPFolha.Locate('IDPROVENTO',
        FCdsValCAP.FieldByName('IDRUBRICA').asString, [])) then
      if not(GerarLinhaCAP) then
      begin
        if (FTipoRetorno <> RETORNO_AVISO) then
          FTipoRetorno := RETORNO_ERRO;
        Result := false;
        exit;
      end;

    FCdsValCAP.Next;
  until (FCdsValCAP.EOF);

  FTipoRetorno := RETORNO_NORMAL;
  Result := true;
end;

function TCtrlParamContabFolha.GerarLinhaCAP: boolean;
begin
  FTipoRetorno := RETORNO_NORMAL;

  if not(GetIdFavorecido) then
  begin
    FTipoRetorno := RETORNO_AVISO;
    Result := false;
    exit;
  end;

  try
    // Guardar o valor da Rubrica
    if (FIdFavorecido > 0) then
    begin
      if not(FCtrlIntegraCAPCAR_RH.SetDadosDocumento(
             FIdFavorecido, FPortadorFormaPadrao, 'P',
             FCdsCAPFolha.FieldByName('CODTIPRECDES').asString,
             GetUnidNegocio_CAP,
             FCdsFunc.FieldByName('CODCENTROCUSTO').asString,
             FCdsCAPFolha.FieldByName('CODCENTRORESPON').asString,
             FCdsValCAP.FieldByName('VALOR').asFloat)) then
      begin
        if (FCtrlIntegraCAPCAR_RH.TipoRetorno = RETORNO_AVISO) then
          FTipoRetorno := RETORNO_AVISO;

        raise Exception.Create(CR_LF +
          CMTranslateMsg(MSG_AVISO_RUB,
            [CR_LF, Trim(FCdsValCAP.FieldByName('CODPROVDESC').asString) + CR_LF,
             Trim(FCdsCAPFolha.FieldByName('DESCRICAO').asString)]) +
          MSG_ERRO + FCtrlIntegraCAPCAR_RH.MessageInfo);
      end;
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

function TCtrlParamContabFolha.GerarContab_Pessoa: boolean;
begin
  if (FCdsValContab.IsEmpty) then
  begin
    Result := true;
    exit;
  end;
  
  FCdsValContab.First;
  FIdEmpresaContab := -1;
  repeat
    // Pegar todas as parametrizações da Empresa Proprietária atual
    FCdsContabFolha.Filter := 'IDPROVENTO = '+FCdsValContab.FieldByName('IDRUBRICA').asString;
    if not(FCdsContabFolha.IsEmpty) then
    begin
      if (FIdEmpresaContab <> FCdsValContab.FieldByName('IDEMPRESA').asInteger) then
      begin
        FIdEmpresaContab := FCdsValContab.FieldByName('IDEMPRESA').asInteger;
        FCdsPlano.Filter := 'IDPESSOA = ' + IntToStr(FIdEmpresaContab);
      end;

      SetCodCentroCusto;

      // Geração da linha da Planilha
      if not(GerarLinhaContab) then
      begin
        Result := false;
        exit;
      end;
    end;

    FCdsValContab.Next;
  until (FCdsValContab.EOF);

  {$IFDEF DEPURANDO}
  //FCdsValContab.SaveToFile('c:\CdsValContab.Cds');
  FCdsValContab.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CdsValContab.Cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  {$ENDIF}

  FTipoRetorno := RETORNO_NORMAL;
  Result := true;
end;

function TCtrlParamContabFolha.GerarLinhaContab: boolean;
var
  c: byte;
  bValidou, bAchou: boolean;
  TipoConta: TTipoLancContab;
  sFiltro: string;

{->}function GetMsgErroSemCC: string;
    begin
      FCdsEmpresa.Locate('IDPESSOA', FIdEmpresaContab, []);
      FTipoRetorno := RETORNO_AVISO;
      Result := CR_LF +
        CMTranslateMsg(MSG_ERRO_SEM_CC,
          [CR_LF,
           Trim(FCdsEmpresa.FieldByName('NOME').asString) + CR_LF,
           CR_LF,
           Trim(FCdsFunc.FieldByName('MATRICULA').asString) + CR_LF,
           Trim(FCdsFunc.FieldByName('NOME').asString) + CR_LF,
           CR_LF,
           Trim(FCdsValContab.FieldByName('CODPROVDESC').asString) + CR_LF,
           Trim(FCdsContabFolha.FieldByName('DESCRICAO').asString) + CR_LF,
           Trim(FCodCentroCusto),
           IFF(FCodCentroCusto = FCdsFunc.FieldByName('CODCENTROCUSTO').asString,
             MSG_CAD_PESSOAL,
             MSG_HORA_TRAB_OUTRO_CC
           ) +CR_LF+CR_LF,
           CR_LF]);
{->}end;

{->}function GetMsgErroValidacao(const TipoLanc: TTipoLancContab): string;
    var
      sMsg: string;
    begin
      if (TipoLanc = tlcDebito) then
        sMsg := MSG_AVISO_PARAM_RUB_DEB
      else
        sMsg := MSG_AVISO_PARAM_RUB_CRE;

      Result := CR_LF +
        CMTranslateMsg(sMsg,
          [CR_LF,
           Trim(FCdsEmpresa.FieldByName('NOME').asString) + CR_LF,
           CR_LF,
           Trim(FCdsFunc.FieldByName('MATRICULA').asString) + CR_LF,
           Trim(FCdsFunc.FieldByName('NOME').asString) + CR_LF,
           CR_LF,
           Trim(FCdsValContab.FieldByName('CODPROVDESC').asString) + CR_LF,
           Trim(FCdsContabFolha.FieldByName('DESCRICAO').asString) + CR_LF,
           Trim(FCodCentroCusto),
           IFF(FCodCentroCusto = FCdsFunc.FieldByName('CODCENTROCUSTO').asString,
             MSG_CAD_PESSOAL,
             MSG_HORA_TRAB_OUTRO_CC
           ) +CR_LF+CR_LF,
           CR_LF,
           CR_LF,
           CR_LF,
           CR_LF]);
{->}end;

{->}function Validar_e_Lancar: boolean;
    begin
      Result := false;
      if (FCdsContabFolha.FieldByName(CAMPO_C[TipoConta]).asString <> '') then
      begin
        // Verificar se o Centro de Custo e a Sub-Conta estão associados à Conta
        if (ValidarCC_Contab(TipoConta)) and (ValidarSC_Contab(TipoConta)) then
        begin
          SetLinhaLanc(TipoConta);
          Result := true;
        end
        else
        if (FTipoRetorno <> RETORNO_NORMAL) then
          raise Exception.Create(MessageInfo);
      end;
{->}end;

{->}function ExisteAlgumaConta: boolean;
    begin
      Result := false;
      FCdsContabFolha.First;
      while not(FCdsContabFolha.EOF) do
      begin
        Result := (FCdsContabFolha.FieldByName(CAMPO_C[TipoConta]).asString <> '');
        if (Result) then
          break;
        FCdsContabFolha.Next;
      end;
{->}end;

begin
  FTipoRetorno := RETORNO_NORMAL;
  InitLinhaLanc;
  try
    // Caso o Centro de Custo (do cadastro da Pessoa ou de horas trabalhadas em outro setor)
    // esteja indicado em ContabFolha ou só tenha uma linha em ContabFolha
    bAchou := (FCdsContabFolha.Locate('CODCENTROCUSTO', FCodCentroCusto, [])) or
              (FCdsContabFolha.RecordCount = 1);

    if not(bAchou) then
    begin
      // Filtrar as linhas em ContabFolha que não possuem o Centro de Custo associado
      // pois neste caso, deve procurá-lo em ContasXCC
      sFiltro := FCdsContabFolha.Filter;
      FCdsContabFolha.Filter := sFiltro + ' AND TRIM(CODCENTROCUSTO) = ''''';

      if (FCdsContabFolha.IsEmpty) then
        raise Exception.Create(GetMsgErroSemCC);
    end
    else
      sFiltro := '';

    // Validar a(s) linha(s) em ContabFolha e fazer o Lançamento no
    // StringList auxiliar (FLinhaLanc)
    if (FPartidaDobrada) then
    begin
      // Procurar a linha com Conta a Débito válida e fazer o Lançamento em FLinhaLanc
      FCdsContabFolha.First;
      repeat
        TipoConta := tlcDebito;
        bValidou := Validar_e_Lancar;
        if (bValidou) then
          break;

        FCdsContabFolha.Next;
      until (FCdsContabFolha.EOF);

      if not(bValidou) then
        raise Exception.Create(GetMsgErroValidacao(TipoConta));

      // Caso uma linha com Conta a Débito válida tenha sido encontrada, validar a
      // Conta a Crédito desta mesma linha e fazer o Lançamento em FLinhaLanc
      if (GerarLinhaLanc) then
      begin
        TipoConta := tlcCredito;
        bValidou := Validar_e_Lancar;
      end;

      if not(bValidou) then
        raise Exception.Create(GetMsgErroValidacao(TipoConta));
    end
    else
    begin
      // Procurar a primeira conta a crédito e conta a débito das linhas de parametrização
      for c:=0 to 1 do
      begin
        TipoConta := TTipoLancContab(c);
        if (ExisteAlgumaConta) then
        begin
          FCdsContabFolha.First;
          repeat
            bValidou := Validar_e_Lancar;
            if (bValidou) then
              break;

            FCdsContabFolha.Next;
          until (FCdsContabFolha.EOF);

          if not(bValidou) then
            raise Exception.Create(GetMsgErroValidacao(TipoConta));
        end;
      end;
    end;

    // Lançamento da(s) Conta(s)
    if (GerarLinhaLanc) then
    begin
      if not(LancarContabilidade) then
        raise Exception.Create(MessageInfo);
    end
    else
    begin
      FCdsEmpresa.Locate('IDPESSOA', FIdEmpresaContab, []);
      FTipoRetorno := RETORNO_AVISO;
      raise Exception.Create(CR_LF +
        CMTranslateMsg(MSG_ERRO_SEM_CC_CONTASXCC,
          [CR_LF,
           Trim(FCdsEmpresa.FieldByName('NOME').asString) + CR_LF,
           CR_LF,
           Trim(FCdsFunc.FieldByName('MATRICULA').asString) + CR_LF,
           Trim(FCdsFunc.FieldByName('NOME').asString) + CR_LF,
           CR_LF,
           Trim(FCdsValContab.FieldByName('CODPROVDESC').asString) + CR_LF,
           Trim(FCdsContabFolha.FieldByName('DESCRICAO').asString) + CR_LF,
           Trim(FCodCentroCusto),
           IFF(FCodCentroCusto = FCdsFunc.FieldByName('CODCENTROCUSTO').asString,
             MSG_CAD_PESSOAL,
             MSG_HORA_TRAB_OUTRO_CC
           ) +CR_LF+CR_LF,
           CR_LF]));
    end;

    if (sFiltro <> '') then
      FCdsContabFolha.Filter := sFiltro;

    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      if (FTipoRetorno <> RETORNO_AVISO) then
        FTipoRetorno := RETORNO_ERRO;
      Result := false;
    end;
  end;
end;

function TCtrlParamContabFolha.GetMsg(const TipoLanc: TTipoLancContab; const Msg: string): string;
begin
  FCdsEmpresa.Locate('IDPESSOA', FIdEmpresaContab, []);
  FTipoRetorno := RETORNO_AVISO;
  Result := CR_LF +
    CMTranslateMsg(Msg,
      [CR_LF,
       Trim(FCdsEmpresa.FieldByName('NOME').asString) + CR_LF,
       CR_LF,
       Trim(FCdsFunc.FieldByName('MATRICULA').asString) + CR_LF,
       Trim(FCdsFunc.FieldByName('NOME').asString) + CR_LF,
       CR_LF,
       Trim(FCdsValContab.FieldByName('CODPROVDESC').asString) + CR_LF,
       Trim(FCdsContabFolha.FieldByName('DESCRICAO').asString) + CR_LF+CR_LF,
       CR_LF,
       Trim(FCdsContabFolha.FieldByName(CAMPO_C[TipoLanc]).asString)]);
end;

function TCtrlParamContabFolha.ValidarCC_Contab(const TipoLanc: TTipoLancContab): boolean;
begin
  if (FCdsContabFolha.FieldByName(CAMPO_OBRIGA_CC[TipoLanc]).asString = 'S') then
  begin
    FCdsConta_X_CC.Filter :=
      'IDEMPRESA = ' +FloatToStr(FIdEmpresaContab)+ ' AND '+
      'PLANO = ' +FCdsPlano.FieldByName('PLANO').asString+ ' AND '+
      'PLACONTA = ' +FCdsContabFolha.FieldByName(CAMPO_C[TipoLanc]).asString;
    if (FCdsConta_X_CC.RecordCount = 1) and (FCdsContabFolha.RecordCount = 1) then
    begin
      FCodCentroCusto := FCdsConta_X_CC.FieldByName('CODCENTROCUSTO').asString;
      Result := true;
    end
    else
    begin
      if (FCdsContabFolha.FieldByName('CODCENTROCUSTO').asString <> '') then
        FCodCentroCusto := FCdsContabFolha.FieldByName('CODCENTROCUSTO').asString
      else // Usar o C. Custo da pessoa ou das Horas Trabalhadas em Outro Setor
        SetCodCentroCusto;

      Result :=
        (FCdsContabFolha.FieldByName(CAMPO_OBRIGA_CC[TipoLanc]).asString = 'N') or
        (FCdsConta_X_CC.Locate('PLACONTA;PLANO;CODCENTROCUSTO;IDEMPRESA',
           VarArrayOf([FCdsContabFolha.FieldByName(CAMPO_C[TipoLanc]).asString,
                       FCdsPlano.FieldByName('PLANO').asInteger,
                       FCodCentroCusto, FIdEmpresaContab]), []));
    end;
    FCdsConta_X_CC.Filter := '';
  end
  else
    Result := true;
end;

function TCtrlParamContabFolha.ValidarSC_Contab(const TipoLanc: TTipoLancContab): boolean;
var
  bAchou: boolean;
  dCodSubConta: double;
  sMsgSC, sMsgSC_Vazio: string;
begin
  if (TipoLanc = tlcDebito) then
  begin
    sMsgSC := MSG_SUB_CONTA_DEB;
    sMsgSC_Vazio := MSG_SUB_CONTA_VAZIA_DEB;
  end
  else
  begin
    sMsgSC := MSG_SUB_CONTA_CRE;
    sMsgSC_Vazio := MSG_SUB_CONTA_VAZIA_CRE;
  end;

  try
    // Validar a Sub-Conta indicada na linha de Parametrização Contábil com as que estão
    // associadas à Conta Contábil
    if (FCdsContabFolha.FieldByName(CAMPO_OBRIGA_SC[TipoLanc]).asString = 'S') then
    begin
      dCodSubConta := GetCodSubConta(TipoLanc);
      // Verificar primeiro se tem alguma Sub-Conta na linha de parametrização
      bAchou := (dCodSubConta > 0);
      if not(bAchou) then // Retornar o erro de parametrização
        raise Exception.Create(GetMsg(TipoLanc, sMsgSC_Vazio));

      // Procurar a Sub-Conta em Conta Contábil X Sub-Conta
      bAchou :=
        (FCdsConta_X_SubConta.Locate('PLACONTA;PLANO;IDPESSOA;CODSUBCONTA',
         VarArrayOf([FCdsContabFolha.FieldByName(CAMPO_C[TipoLanc]).asString,
                     FCdsPlano.FieldByName('PLANO').asInteger,
                     FIdEmpresaContab, dCodSubConta]), []));

      if not(bAchou) then // Retornar o erro de parametrização
        raise Exception.Create(GetMsg(TipoLanc, sMsgSC));
    end;

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;

      if not(Result) and (FTipoRetorno <> RETORNO_AVISO) then
        FTipoRetorno := RETORNO_ERRO;
    end;
  end;
end;

function TCtrlParamContabFolha.GetCodSubConta(const TipoLanc: TTipoLancContab): double;
begin
  if (FCdsContabFolha.FieldByName(CAMPO_SC_PESSOA[TipoLanc]).asInteger = 1) then
    Result := FCdsFunc.FieldByName('CODSUBCONTA').asFloat
  else
  if (FCdsContabFolha.FieldByName(CAMPO_SC[TipoLanc]).IsNull) then
    Result := 0
  else
    Result := FCdsContabFolha.FieldByName(CAMPO_SC[TipoLanc]).asFloat;
end;

function TCtrlParamContabFolha.GetHistPadrao(const TipoLanc: TTipoLancContab): string;
begin
  if (Trim(FCdsContabFolha.FieldByName(COD_HIST[TipoLanc]).asString) <> '') then
    Result := FCdsContabFolha.FieldByName(DESCR_HIST[TipoLanc]).asString
  else
    Result := FCdsValContab.FieldByName('CODPROVDESC').asString +' '+
              FCdsContabFolha.FieldByName('DESCRICAO').asString +' '+ FAnoMes;
end;

{$IFDEF MUTUO}
procedure TCtrlParamContabFolha.LancarTotalRateioMutuo;
begin
  {$IFDEF DEPURANDO}
  //FCdsRateioMutuo.SaveToFile('c:\CdsRateioMutuo.Cds');
  FCdsRateioMutuo.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CdsRateioMutuo.Cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  {$ENDIF}

  FCdsRateioMutuo.First;
  while not(FCdsRateioMutuo.EOF) do
  begin
    if (FCdsRateioMutuo.FieldByName('VALOR').asFloat > 0) then
    begin
      if (FVerificarLancContab) then
      begin
        InitLinhaLanc;
        FLinhaLanc.IdEmpresa := FCdsRateioMutuo.FieldByName('IDEMPRESA').asInteger;
        FLinhaLanc.IdPlano := FCdsContabFolha.FieldByName(PLANO[tlcDebito]).asInteger;
        FLinhaLanc.ContaDeb := FCdsRateioMutuo.FieldByName('CONTA_DEB').asString;
        FLinhaLanc.ContaCre := FCdsRateioMutuo.FieldByName('CONTA_CRE').asString;

        if (FPartidaDobrada) then
        begin
          InserirDadosRelat(tlcPartidaDobrada,
            FCdsRateioMutuo.FieldByName('VALOR').asFloat,
            'XXXXXXX', CMTranslate('Total do Rateio entre Empresas Proprietárias'));
        end
        else
        begin
          InserirDadosRelat(tlcDebito,
            FCdsRateioMutuo.FieldByName('VALOR').asFloat,
            'XXXXXXX', CMTranslate('Total a Débito do Rateio entre Empresas Proprietárias'));

          InserirDadosRelat(tlcCredito,
            FCdsRateioMutuo.FieldByName('VALOR').asFloat,
            'XXXXXXX', CMTranslate('Total a Crédito do Rateio entre Empresas Proprietárias'));
        end;
      end
      else
      begin
        if (FCdsRateioMutuo.FieldByName('TIPO').asString = 'D') then
        begin
          // Geração do Lançamento na Empresa Proprietária logada
          InserirDadosPlanilha(
            FIdEmpresa, tlcPartidaDobrada, UNIDNEGOC_PADRAO, FIdPlano,
            FCdsRateioMutuo.FieldByName('CONTA_ATIVO').asString, false, 0, false, '',
            FCdsRateioMutuo.FieldByName('CONTA_CRE').asString, false, 0, false, '',
            CMTranslate('Débito Rateio em Outra Empresa'),
            FCdsRateioMutuo.FieldByName('VALOR').asFloat);

          // Geração do Lançamento na outra Empresa Proprietária
          InserirDadosPlanilha(
            FCdsRateioMutuo.FieldByName('IDEMPRESA').asInteger,
            tlcPartidaDobrada, UNIDNEGOC_PADRAO, FIdPlano,
            FCdsRateioMutuo.FieldByName('CONTA_DEB').asString, false, 0, false, '',
            FCdsRateioMutuo.FieldByName('CONTA_PASSIVO').asString, false, 0, false, '',
            CMTranslate('Débito Rateio de Outra Empresa'),
            FCdsRateioMutuo.FieldByName('VALOR').asFloat);
        end
        else
        begin
          // Geração do Lançamento na Empresa Proprietária logada
          InserirDadosPlanilha(
            FIdEmpresa, tlcPartidaDobrada, UNIDNEGOC_PADRAO, FIdPlano,
            FCdsRateioMutuo.FieldByName('CONTA_DEB').asString, false, 0, false, '',
            FCdsRateioMutuo.FieldByName('CONTA_PASSIVO').asString, false, 0, false, '',
            CMTranslate('Crédito Rateio em Outra Empresa'),
            FCdsRateioMutuo.FieldByName('VALOR').asFloat);

          // Geração do Lançamento na outra Empresa Proprietária
          InserirDadosPlanilha(
            FCdsRateioMutuo.FieldByName('IDEMPRESA').asInteger,
            tlcPartidaDobrada, UNIDNEGOC_PADRAO, FIdPlano,
            FCdsRateioMutuo.FieldByName('CONTA_CRE').asString, false, 0, false, '',
            FCdsRateioMutuo.FieldByName('CONTA_ATIVO').asString, false, 0, false, '',
            CMTranslate('Crédito Rateio de Outra Empresa'),
            FCdsRateioMutuo.FieldByName('VALOR').asFloat);
        end;
      end;
    end;
    FCdsRateioMutuo.Next;
  end;
end;
{$ENDIF}

function TCtrlParamContabFolha.LancarContabilidade: boolean;
var
  c, iIni, iFim: byte;
begin
  Result := true;

  if (FPartidaDobrada) then
  begin
    iIni := Integer(tlcPartidaDobrada);
    iFim := Integer(tlcPartidaDobrada);
  end
  else
  begin
    if (FLinhaLanc.ContaDeb <> '') and (FLinhaLanc.ContaCre <> '') then
    begin
      iIni := Integer(tlcDebito);
      iFim := Integer(tlcCredito);
    end
    else
    if (FLinhaLanc.ContaDeb <> '') and (FLinhaLanc.ContaCre = '') then
    begin
      iIni := Integer(tlcDebito);
      iFim := Integer(tlcDebito);
    end
    else
    begin
      iIni := Integer(tlcCredito);
      iFim := Integer(tlcCredito);
    end;
  end;

  for c:=iIni to iFim do
  begin
    // Somar valores a serem rateados com as contas do Mútuo
    {$IFDEF MUTUO}
    if (FCdsValContab.FieldByName('RATEIO').asInteger = REG_RATEIO_MUTUO) then
    begin
      case (TTipoLancContab(c)) of
        tlcDebito :
        begin
          if (FCdsContabFolha.FieldByName('FLGRATEIODEB').asInteger = 1) then
            SomarTotalRateioMutuo(FCdsValContab.FieldByName('IDEMPRESA').asInteger, 'D',
              FCdsValContab.FieldByName('VALOR').asFloat)
        end;
        tlcCredito :
        begin
          if (FCdsContabFolha.FieldByName('FLGRATEIOCRED').asInteger = 1) then
            SomarTotalRateioMutuo(FCdsValContab.FieldByName('IDEMPRESA').asInteger, 'C',
              FCdsValContab.FieldByName('VALOR').asFloat);
        end;
        tlcPartidaDobrada :
        begin
          if (FCdsContabFolha.FieldByName('FLGRATEIODEB').asInteger = 1) then
            SomarTotalRateioMutuo(FCdsValContab.FieldByName('IDEMPRESA').asInteger, 'D',
              FCdsValContab.FieldByName('VALOR').asFloat);

          if (FCdsContabFolha.FieldByName('FLGRATEIOCRED').asInteger = 1) then
            SomarTotalRateioMutuo(FCdsValContab.FieldByName('IDEMPRESA').asInteger, 'C',
              FCdsValContab.FieldByName('VALOR').asFloat);
        end;
      end;
    end
    else
    {$ENDIF}
    begin
      if (FVerificarLancContab) then
      begin
//        Result := FCtrlIntegraContabRH.VerificarLancamento(
//          FLinhaLanc.IdEmpresa, TTipoLancContab(c), FTipoOperacao, FDataLancContab,
//          FCdsValContab.FieldByName('UNIDNEGOC').asInteger, FLinhaLanc.IdPlano,
//          FLinhaLanc.ContaDeb, IFF(FLinhaLanc.ObrigaSubContaDeb, FLinhaLanc.SubContaDeb, 0),
//          IFF(FLinhaLanc.ObrigaCCustoDeb, FLinhaLanc.CCustoDeb, ''),
//          FLinhaLanc.ContaCre, IFF(FLinhaLanc.ObrigaSubContaCre, FLinhaLanc.SubContaCre, 0),
//          IFF(FLinhaLanc.ObrigaCCustoCre, FLinhaLanc.CCustoCre, ''),
//          FCdsValContab.FieldByName('VALOR').asFloat);
        InserirDadosRelat(TTipoLancContab(c), FCdsValContab.FieldByName('VALOR').asFloat);
      end
      else
        InserirDadosPlanilha(FLinhaLanc.IdEmpresa, TTipoLancContab(c),
          FCdsValContab.FieldByName('UNIDNEGOC').asInteger, FLinhaLanc.IdPlano,
          FLinhaLanc.ContaDeb, FLinhaLanc.ObrigaSubContaDeb, FLinhaLanc.SubContaDeb,
          FLinhaLanc.ObrigaCCustoDeb, FLinhaLanc.CCustoDeb, FLinhaLanc.ContaCre,
          FLinhaLanc.ObrigaSubContaCre, FLinhaLanc.SubContaCre, FLinhaLanc.ObrigaCCustoCre,
          FLinhaLanc.CCustoCre,
          IFF(TTipoLancContab(c)=tlcCredito,FLinhaLanc.HistoricoCre,FLinhaLanc.HistoricoDeb),
          FCdsValContab.FieldByName('VALOR').asFloat);
    end;
  end;

  if not(Result) then
  begin
    FTipoRetorno := RETORNO_AVISO;
    raise Exception.Create(CR_LF +
      CMTranslateMsg(MSG_AVISO_RUB,
        [CR_LF, Trim(FCdsValContab.FieldByName('CODPROVDESC').asString) + CR_LF,
         Trim(FCdsContabFolha.FieldByName('DESCRICAO').asString)]) +CR_LF+
      CMTranslate('Centro de Custo: ') +'"'+ Trim(FCodCentroCusto) +'"'+
      MSG_ERRO + FCtrlIntegraContabRH.MessageInfo);
  end;
end;

procedure TCtrlParamContabFolha.MontarMensagemPlanilhas;
var
  c, iEmpresa: integer;
  sNumPlanilha: string;
  dPlnCodigo: double;
  dValDebito, dValCredito: currency;
  _ListaIdEmpresa: TStringList;
begin
  if (FLancPlanilha.Count = 0) then
  begin
    FGerouPlanilha := false;
    FTipoRetorno := RETORNO_AVISO;
    raise Exception.Create(
      Replicate('-',40) +CR_LF+
      CMTranslate('*** NENHUMA Planilha foi gerada ***') +CR_LF+
      CMTranslate('Provavelmente, nenhuma das Rubricas geradas estão parametrizadas.'));
  end;

  EnviarMensagem('', '', GetTempoDecorrido, 0, 1,
    Replicate('-',40) +CR_LF+
    CMTranslate('*** Planilha(s) gerada(s) ***') +CR_LF);

  _ListaIdEmpresa := TStringList.Create;
  try
    // Obter a lista de Empresas que geraram Planilhas
    for c:=0 to FLancPlanilha.Count-1 do
      if (_ListaIdEmpresa.IndexOf(FloatToStr(TLancPlanilha(
          FLancPlanilha.Objects[c]).IdEmpresa)) = -1) then
        _ListaIdEmpresa.Add(FloatToStr(TLancPlanilha(FLancPlanilha.Objects[c]).IdEmpresa));

    for iEmpresa:=0 to _ListaIdEmpresa.Count-1 do
    begin
      // Calcular os valores totais do Débito e do Crédito
      dValDebito := 0;
      dValCredito := 0;
      dPlnCodigo := 0;
      for c:=0 to FLancPlanilha.Count-1 do
      begin
        if (TLancPlanilha(FLancPlanilha.Objects[c]).IdEmpresa <>
            StrToInt(_ListaIdEmpresa[iEmpresa])) then
          continue
        else
          dPlnCodigo := TLancPlanilha(FLancPlanilha.Objects[iEmpresa]).PlnCodigo;

        if (TLancPlanilha(FLancPlanilha.Objects[c]).Tipo in [tlcDebito,tlcPartidaDobrada]) and
           (TLancPlanilha(FLancPlanilha.Objects[c]).ContaDeb <> '') then
          dValDebito := dValDebito + Arredondar(TLancPlanilha(FLancPlanilha.Objects[c]).Valor,2);

        if (TLancPlanilha(FLancPlanilha.Objects[c]).Tipo in [tlcCredito,tlcPartidaDobrada]) and
           (TLancPlanilha(FLancPlanilha.Objects[c]).ContaCre <> '') then
          dValCredito := dValCredito + Arredondar(TLancPlanilha(FLancPlanilha.Objects[c]).Valor,2);
      end;

      // Mostrar os totais da Empresa Proprietária atual
      sNumPlanilha := FloatToStr(FCtrlListTerceirosRH.GetNumPlanilha(dPlnCodigo));
      FCdsEmpresa.Locate('IDPESSOA', _ListaIdEmpresa[iEmpresa], []);
      EnviarMensagem('', '', '', 0, 0,
        Replicate('-',40) +CR_LF+
        CMTranslate('Empresa: ')+ FCdsEmpresa.FieldByName('NOME').asString +CR_LF+
        CMTranslate('Planilha Nº.: ')+ sNumPlanilha +CR_LF+
        CMTranslate('Valor Débito: ')+ FormatFloat('###,###,###,##0.00', dValDebito) +CR_LF+
        CMTranslate('Valor Crédito: ')+ FormatFloat('###,###,###,##0.00', dValCredito) +CR_LF+
        IFF(dValDebito = dValCredito,
          CMTranslate('** PLANILHA BALANCEADA **'),
          CMTranslate('** PLANILHA DESBALANÇEADA **')) +CR_LF+
        Replicate('-',40));
    end;
  finally
    _ListaIdEmpresa.Free;
  end;
end;

procedure TCtrlParamContabFolha.MontarMensagemTempo;
begin
  EnviarMensagem('', '', GetTempoDecorrido, 0, 0,
    CR_LF+ Replicate('-',40) +CR_LF+
    CMTranslate('Número de Pessoas: ') +IntToStr(FCdsFunc.RecordCount) +CR_LF+
    CMTranslate('Hora Inicial: ') + FormatDateTime('hh:nn:ss', FHoraInicial) +CR_LF+
    CMTranslate('Hora Final: ') + FormatDateTime('hh:nn:ss', FHoraAtual) +CR_LF+
    CMTranslate('Tempo de Processamento: ') + HoraPorExtenso(FHoraAtual - FHoraInicial) +CR_LF+
    CMTranslate('Tempo Médio por Pessoa: ') +
    HoraPorExtenso((FHoraFinal_Pessoa - FHoraInicial_Pessoa) /
    FCdsFunc.RecordCount));
end;

function TCtrlParamContabFolha.VerificaTemOutroCC: boolean;
begin
  _Cds.Data := GetDataPacket(
    'SELECT COUNT(*) AS CONTA'+CR_LF+
    'FROM   HORATRABOUTROCC H, FUNCIONARIO F'+CR_LF+
    'WHERE'+CR_LF+
    IFF(FListaCodCCusto='','',
      MontaLinhaSelSQL('  (H.CODCENTROCUSTO',FListaCodCCusto,3) +CR_LF)+
    '  ('+CR_LF+
    '    (TO_CHAR(H.DATATRAB,''YYYY/MM'') = ' +QuotedStr(FAnoMes)+ ') OR'+CR_LF+
    '    ('+CR_LF+
    '      (TO_CHAR(H.DATATRAB,''YYYY/MM'') <= ' +QuotedStr(FAnoMes)+ ') AND'+CR_LF+
    '      (H.FLGPERMANENTE = 1)'+CR_LF+
    '    )'+CR_LF+
    '  ) AND'+CR_LF+
    '  (H.FLGRATEIO = 1) AND'+CR_LF+
    '  (H.IDPESSOA  = F.IDPESSOA) AND'+CR_LF+
    '  (F.IDEMPRESA = ' +FloatToStr(FIdEmpresa)+ ')');

  Result := (_Cds.FieldByName('CONTA').asInteger > 0);
end;

{$IFDEF MUTUO}
function TCtrlParamContabFolha.UsaContaDebitoRateioMutuo: boolean;
begin
  Result := (FCdsContabFolha.FieldByName('FLGRATEIODEB').asInteger = 1) and
            (FCdsContabFolha.FieldByName('CONTADEBITO').asString <> '');
end;

function TCtrlParamContabFolha.UsaContaCreditoRateioMutuo: boolean;
begin
  Result := (FCdsContabFolha.FieldByName('FLGRATEIOCRED').asInteger = 1) and
            (FCdsContabFolha.FieldByName('CONTACREDITO').asString <> '');
end;

function TCtrlParamContabFolha.GetUsaRateioMutuo(const IdRubrica: double): boolean;
begin
  // Deverá gerar a conta baseada no Mútuo quando:
  // 1) O registro em ParamRHDatas para a Empresa Proprietária logada estiver com a
  //    seleção da Conta a Débito e/ou a Crédito;
  // 2) As Horas Trabalhadas em Outro Setor for para outra Empresa Proprietária;
  // 3) A rubrica atual estiver configurada para fazer este rateio com a
  //    Conta a Débito/Crédito e esta conta tiver sido indicada em ContabFolha.
  if (FCdsParamRHDatas.Locate('IDEMPRESA', FIdEmpresa, [])) and
     ((FCdsParamRHDatas.FieldByName('CONTARATEIODEB').asString <> '') or
      (FCdsParamRHDatas.FieldByName('CONTARATEIOCRED').asString <> '')) then
  begin
    FCdsContabFolha.Locate('IDPROVENTO', IdRubrica, []);
    Result := (FCdsHorasTrabOutroCC.FieldByName('IDEMPRESA').asInteger <> FIdEmpresa) and
              (UsaContaDebitoRateioMutuo or UsaContaCreditoRateioMutuo);
  end
  else
    Result := false;
end;
{$ENDIF}

function TCtrlParamContabFolha.GetUnidNegocio_CAP: integer;
begin
  Result := UNIDNEGOC_PADRAO;
  if not(FObrigaAbc) then
    exit;

  if (FCdsFunc.FieldByName('UNIDNEGOC').asInteger <> 0) then
    Result := FCdsFunc.FieldByName('UNIDNEGOC').asInteger
  else
  if (FCdsCAPFolha.FieldByName('UNIDNEGOC').asInteger <> 0) then
    Result := FCdsCAPFolha.FieldByName('UNIDNEGOC').asInteger;
end;

function TCtrlParamContabFolha.GetIdBancoContaSalario(IdAgenciaSalario: double): integer;
begin
  _Cds.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  NVL(AG.IDBANCO,0) AS IDBANCO' +CR_LF+
    'FROM' +CR_LF+
    '  AGENCIABANCARIA AG, BANCOPORTFOLHA BPF' +CR_LF+
    'WHERE' +CR_LF+
    '  (AG.IDPESSOA   = ' +FloatToStr(IdAgenciaSalario)+ ') AND' +CR_LF+
    '  (BPF.IDEMPRESA = ' +FloatToStr(FIdEmpresa)+ ') AND' +CR_LF+
    '  (AG.IDBANCO    = BPF.IDBANCO)');

  Result := _Cds.FieldByName('IDBANCO').asInteger;
end;

end.
