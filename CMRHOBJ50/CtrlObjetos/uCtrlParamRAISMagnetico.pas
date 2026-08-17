// ****************************************************************************************//
// DISPOSIÇÕES GERAIS PARA A GERAÇÃO DOS DADOS DAS PESSOAS
// ****************************************************************************************//
// * Para cada período de Admissão e Demissão será gerado um registro no arquivo
// * Para cada Transferência serão gerados dois registros no arquivo (desde que ambos os
// Estabelecimentos tenham sido selecionados pelo usuário. Caso contrário, apenas o
// selecionado será gerado). O primeiro contendo a saída do Estabelecimento antigo e o
// segundo contendo a entrada no Estabelecimento novo.
//
// Para que esta classe possa reconhecer os períodos de Admissão e Demissão corretamente,
// o Histórico da Alteração da Situação Funcional deve estar na sempre na forma:
// 1º Registro - Admissão
// 2º Registro - Demissão (se existir)
// ...
// Nº Registro - Admissão
// Nº Registro - Demissão (se existir)
// Isto quer dizer que o par Admissão - Demissão deve estar nesta ordem.
//
// Evolução
// O registro de Admissão sempre deve existir para que a pessoa seja corretamente gerada.
//
// ****************************************************************************************//

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
//******************************************************************************
// Autor(a)    : Ewerton Beltramini
// Data        : 31/03/2021
// SIG         : 114711
// Descrição   : Aplicar alteração no layout da RAIS conforme solicitação no SIG.
//------------------------------------------------------------------------------
// Autor(a)    : Taffarel Sevaybriker
// Data        : 29/08/2019
// SIG         : 90393
// Descrição   : Aplicar alteração no layout da RAIS conforme solicitação.
//               Alterar de matrícula do funcionário para 2222.
//------------------------------------------------------------------------------
//Rotina:            GerarRegistro1
//Nº SOL:            224461/15703
//Nº KINTANA         2059184
//Data da Alteração: 04/02/2014
//Alteração Form:    Adição da informação do tipo de sistema de controle do ponto
//Responsável:       William Santana
//Descrição:         Solicitados adequação da Folha de Pagamento ao layout da RAIS ano-base 2013.
//                   Demanda Legal p atendimento Portaria nº 2072 de 31 de Dezembro de 2013.
// *****************************************************************************
// Autor(a)    : Rodrigo de Brito Figueredo
// Data        : 15/01/2013
// SOL_KINTANA : SOL 198151 - KTN 1905330
// Descricao   : Aplicar alterações conforme solicitado para RAIS 2012.
//------------------------------------------------------------------------------
// Autor(a)    : Edilaine Ferraresi
// Data        : 30/01/2012
// SOL_KINTANA : SOL 172250 - KTN 1547587
// Descricao   : Aplicar alterações conforme solicitado para RAIS 2011 e
//               utilização da nova informação de tela (Participa PAT).
//------------------------------------------------------------------------------
// Autor(a)    : Fábio Henrique Beccaria Sampaio
// Data        : 15/02/2011
// SOL_KINTANA : 152876_1146010
// Descricao   : Correção da rotina que gera o arquivo, para que a instrução
//               Sindicalizado saia como 1-SIM apenas se existir valor.
//------------------------------------------------------------------------------
// Autor(a)    : Arnaldo V. Scarin
// Data        : 08/04/2010
// SOL_KINTANA : 132664_768379
// Descricao   : Correção da rotina que gera o arquivo, para que o Grau de Instrução
//               saia correto.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 26/02/2009
// SOL_KINTANA : 129826_715518
// Descricao   : Alteração de layout e utilização da nova informação de tela
//              (Responsável).
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
// Autor(a)    : Ádler Teodoro de Souza
// Data        : 10/02/2009
// Pendência   : SOL 106839  KINTANA 479542
// Rotina      : GerarRegistro0
// Descricao   : Aplicar alterações conforme solicitado para RAIS 2008.
//------------------------------------------------------------------------------
unit uCtrlParamRAISMagnetico;

interface

uses SysUtils, Classes, Controls, DB, Forms, uCmControlObject, uCmDbObject, IvDictio,
  {uCMTranslate,} uCmClientDataSet, uCMTypes, uCtrlCustomRH{, uCtrlDiasTrab}, USistema;

type
  TOnProgRAISMagnetico = procedure (const TempoAtual, Mensagem: string;
    const NumPessoas: integer; const IncProg: boolean; const Log: string) of object;

  // Tipos usados nos métodos GetValContribIndivAssoc e GerarRegistro2 para a recuperação
  // dos dados dos Sindicatos.
  TArrayCNPJ_ContribIndivAssoc = array[1..2] of string;
  TArrayVal_ContribIndivAssoc = array[1..2] of double;

  // Tipo usado no retorno do método GetAfastamento
  TRegAfastamento = record
    Motivo: string;
    DataInicial: string;
    DataFinal: string;
  end;

  TTipoMsg = (tpAviso, tpInconsist);

  TCtrlParamRAISMagnetico = class(TCtrlCustomRH)
  protected
    procedure AfterInitialize; override;
    procedure DoChangeDataBase; override;
  private
    FOnProgRAISMagnetico: TOnProgRAISMagnetico;

    //FCtrlDiasTrab: TCtrlDiasTrab;

    FCdsPessoa: TCMClientDataSet; // DataSet que conterá os dados a serem gerados no arquivo
    FCdsEstab: TCMClientDataSet; // DataSet dos Estabelecimentos selecionados
    FCdsResp: TCMClientDataSet; // DataSet do Estabelecimento responsável
    FCdsNovoResp : TCMClientDataSet; //Bruno Bastos - Sol: 129826 - Kintana: 715518

    FCdsContrib: TCMClientDataSet;
    FCdsContribPatronal: TCMClientDataSet;

    FCdsLoopPessoa: TCMClientDataSet;
    FCdsAfastPessoa: TCMClientDataSet;

    FCdsListaMensagens: TCMClientDataSet;

    FCds_AdmDem: TCMClientDataSet; // DataSet de "trabalho" das Admissões e Demissões
    FCds_EvolFunc: TCMClientDataSet; // DataSet de "trabalho" das alterações funcionais
    FCds_Remuneracao: TCMClientDataSet; // DataSet de "trabalho" das remunerações
    FCds_1Parc13: TCMClientDataSet; // DataSet de "trabalho" da 1º parc do 13º salário
    FCds_2Parc13: TCMClientDataSet; // DataSet de "trabalho" da 2º parc do 13º salário
    FCds_PAT: TCMClientDataSet; // DataSet de "trabalho" do PAT
    FCds_AvisoPrevio: TCMClientDataSet; // DataSet de "trabalho" do Aviso Prévio Indenizado
    FCds_SalContratual: TCMClientDataSet; // DataSet de "trabalho" do Salário Contratual
    //FCds_QuantHorasMensaisHor: TCMClientDataSet; // DataSet de "trabalho" da Quant. Horas Mensais p/ Horistas
    FCds_QuantHorasExtras: TCMClientDataSet; // DataSet de "trabalho" da Quant. Horas Extras Mensais 
    FCds_FeriasIndeniz: TCMClientDataSet; // DataSet de "trabalho" das Férias Indenizadas
    FCds_BancoHoras: TCMClientDataSet; // DataSet de "trabalho" do Banco de Horas
    FCds_Dissidio: TCMClientDataSet; // DataSet de "trabalho" do Dissídio
    FCds_Gratif: TCMClientDataSet; // DataSet de "trabalho" das gratificações
    FCds_MultaResc: TCMClientDataSet; // DataSet de "trabalho" das Multas Rescisórias
    //FCds_Ferias: TCMClientDataSet; // DataSet de "trabalho" das Férias
    FCds_UltSalContr: TCMClientDataSet; // DataSet do último Salário Contratual

    FArq: TStringList;
    FSQL: TStringList;

    FSQL_AdmDem: string;
    FSQL_EvolFunc: string;
    FSQL_RemNormal: string;
    FSQL_1Parc13: string;
    FSQL_2Parc13: string;
    FSQL_PAT: string;
    FSQL_AvisoPrevio: string;
    FSQL_SalContratual: string;
    //FSQL_QuantHorasMensaisHor: string;
    FSQL_QuantHorasExtras: string;
    FSQL_FeriasIndeniz: string;
    FSQL_BancoHoras: string;
    FSQL_Dissidio: string;
    FSQL_Gratif: string;
    FSQL_MultaResc: string;
    //FSQL_Ferias: string;
    FSQL_UltSalContr: string;

    FCNPJPrimeiroEstab: string;
    FTempoDecorridoTotal: string;
    FIdEmpresa: integer;
    FAnoRef: string;
    FMesDataBase: integer;
    FNumeroProprietarios: integer;
    FListaTipoContratoSel: string;
    FListaIdEstab: string;
    FListaIdMotivoAdmSel: string;
    FListaIdMotivoDemSel: string;
    FListaIdMotivoAfastSel: string;
    FListaIdMotivoRetorSel: string;
    FIdResponsavel: double;
    FIdNovoResp : double; //Bruno Bastos - Sol: 129826 - Kintana: 715518
    FEmissaoNormal: boolean;
    FReciboParaEndResponsavel: boolean;
    FGerouPessoa: boolean;
    FIndicadorMicroEmpresa: integer;
    FOptanteSimples: integer;
    FListaIdRubricaRemNormal: string;
    FListaIdRubrica1Parc13: string;
    FListaIdRubrica2Parc13: string;
    FListaIdRubricaPAT: string;
    FListaIdMotivoResc: string;
    FListaIdRubricaAvisoPrevio: string;
    FListaRubricaSalContratual: string;
    //FListaRubricaQuantHorasMensaisHor: string;
    FListaRubricaQuantHorasExtras: string;
    FListaRubricaFeriasIndeniz: string;
    FListaRubricaBancoHoras: string;
    FListaRubricaDissidio: string;
    FListaRubricaGratif: string;
    FListaRubricaMultaResc: string;
    FListaIdRubContribPatronalAssoc: string;
    FListaIdRubContribPatronalSind: string;
    FListaIdRubContribPatronalAssis: string;
    FListaIdRubContribPatronalConf: string;
    FListaIdRubContribAssoc: string;
    FListaIdRubContribSind: string;
    FListaIdRubContribAssis: string;
    FListaIdRubContribConf: string;
    FPorcServProp: double;
    FPorcAdmCoz: double;
    FPorcRefConv: double;
    FPorcRefTransp: double;
    FPorcCestaAlim: double;
    FPorcAlimConv: double;
    FEncerrAtividades: boolean;
    FDataEncerrAtividades: string;
    FValorSalMinAtual: double;
    FDataRetif: string;
    FIdDocCNPJ: integer;
    FParticipaPAT: integer;     // Edilaine - SOL 172250 - KTN 1547587

    FNumEstab: integer;         // Número total de Estabelecimentos processados
    FNumRegistroAtual: integer; // Número do registro atual
    FNumPessoas: integer;       // Número total de Empregados processados

    FQuantDiasAfast: integer; // Total de dias de afastamento no ano-base
    //FNumAvisos: integer;
    //FNumInconsist: integer;

    FHoraIni: TTime; // Hora inicial do processamento

    FPularPessoa: boolean;

    procedure IncProgresso(const TempoAtual: string; const Mensagem: string = '';
      const NumPessoas: integer = 0; const IncProg: boolean = false; const Log: string = '');
    procedure IncListaMensagens(const IdEmpresa: integer; const IdPessoa: double;
      const TipoMsg: TTipoMsg; const Msg: string);

    function  GetNumMensagensTipo(const TipoMsg: TTipoMsg): integer;
    function  GetTempoDecorrido(Extendido: boolean = false): string;
    // Validar a CTPS encontrado e o ajusta(corta) para o tamanho especificado
    function  Val_CTPS(Ini,Tam: byte; Campo: string): string;
    function  MontarJoinRubricas(ListaIdRubrica: string; const Recudo: byte): string;

    function  GetAfastamento(const Posicao: byte): TRegAfastamento;
    function  GetDataAdmLimite(const Data: TDate): TDate;
    function  GetDataDemLimite(const Data: TDate): TDate;
    //function  GetCargaHorariaMes(const Mes: byte): string;
    function  GetHoraExtraMes(const Mes: byte): string;

    procedure FiltrarCdsValorNoPeriodo(Cds: TCMClientDataSet; const RubRescisao: boolean = false);
    //procedure FiltrarAfastNoPeriodo(const DataIni, DataFin: TDate);

    function VerificarInconsisCodRAIS: boolean;

    function AbrirQueryEstabelecimento: boolean;
    function AbrirQueryResponsavel: boolean;
    function AbrirQueryPessoa: boolean;
    function AbrirQueryContrib: boolean;
    function AbrirQueryContribPatronal: boolean;

    procedure MontarQueriesEmBranco;
    // Montar a Query que servirá de base para pegar os valores das pessoas
    function  MontarQueryValRubrica(const ListaIdRubrica: string;
      const Rescisao: boolean = false): string;

    function  PrepararDs_AdmDem: boolean;
    function  PrepararDs_EvolFunc: boolean;
    function  PrepararDs_Remuneracao: boolean;
    function  PrepararDs_1Parc13: boolean;
    function  PrepararDs_2Parc13: boolean;
    function  PrepararDs_PAT: boolean;
    function  PrepararDs_AvisoPrevio: boolean;
    function  PrepararDs_SalContratual: boolean;
    //function  PrepararDs_QuantHorasMensaisHor: boolean;
    function  PrepararDs_QuantHorasExtras: boolean;
    function  PrepararDs_FeriasIndeniz: boolean;
    function  PrepararDs_BancoHoras: boolean;
    function  PrepararDs_Dissidio: boolean;
    function  PrepararDs_Gratif: boolean;
    function  PrepararDs_MultaResc: boolean;
    //function  PrepararDs_Ferias: boolean;
    function  PrepararDs_UltSalContr: boolean;

    function  ListGenerico(const IdPessoa: double; const SQL: string): OleVariant;

    procedure List_AdmDem(const IdPessoa: double);
    procedure List_EvolFunc(const IdPessoa: double);
    procedure List_Remuneracao(const IdPessoa: double);
    procedure List_1Parc13(const IdPessoa: double);
    procedure List_2Parc13(const IdPessoa: double);
    procedure List_PAT(const IdPessoa: double);
    procedure List_AvisoPrevio(const IdPessoa: double);
    procedure List_SalContratual(const IdPessoa: double);
    //procedure List_QuantHorasMensaisHor(const IdPessoa: double);
    procedure List_QuantHorasExtras(const IdPessoa: double);
    procedure List_FeriasIndeniz(const IdPessoa: double);
    procedure List_BancoHoras(const IdPessoa: double);
    procedure List_Dissidio(const IdPessoa: double);
    procedure List_Gratif(const IdPessoa: double);
    procedure List_MultaResc(const IdPessoa: double);
    //procedure List_Ferias(const IdPessoa: double);
    procedure List_UltSalContr(const IdPessoa: double; DataLimite: TDate);    

    function  HistSitFunc_Admissao: boolean;
    function  HistSitFunc_Demissao: boolean;
    function  HistSitFunc_IniAfast: boolean;
    function  HistSitFunc_FimAfast: boolean;
    function  HistAltFunc_Admissao: boolean;
    function  HistAltFunc_Transferencia: boolean;

    procedure ExcluirAfastPessoa(const IdPessoa: double);
    function  PessoaDemitidaNoPeriodo: boolean;

    procedure Identificar_Afastamentos;
    procedure Identificar_AdmDem;
    procedure Identificar_EvolFunc;
    //procedure Identificar_HoraTrab;
    procedure Identificar_HorasExtras;
    procedure Identificar_Remuneracao;
    procedure Identificar_13SalPessoa;
    procedure Identificar_PAT;
    procedure Identificar_SalContratual;
    procedure Identificar_AvisoPrevio;
    procedure Identificar_FeriasIndeniz;
    procedure Identificar_BancoHoras;
    procedure Identificar_Dissidio;
    procedure Identificar_Gratif;
    procedure Identificar_MultaResc;

    function  IdentificarPessoas: boolean;
    //procedure Excluir_Pessoas_AfastAnoAnterior;
    //procedure MontarAvisoFinal;

    function GetIdDocCNPJ: integer;
    function GetCodTipoDeficiencia: string;

    procedure GetValContribPatronal(const IdEstab: double; const ListaIdRub: string;
      var CNPJ: string; var Valor: double);
    procedure GetValContribIndiv(const IdPessoa, IdEstab: double; const ListaIdRub: string;
      var CNPJ: string; var Valor: double);
    procedure GetValContribIndivAssoc(const IdPessoa, IdEstab: double; const ListaIdRub: string;
      var CNPJ: TArrayCNPJ_ContribIndivAssoc; var Valor: TArrayVal_ContribIndivAssoc);

    // Geração dos registros do arquivo
    function GerarRegistro0: string;
    function GerarRegistro1: string;
    function GerarRegistro2: string;
    function GerarRegistro9: string;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ProcessarGeracao(IdEmpresa: integer; AnoRef: string; MesDataBase: integer;
      ListaTipoContratoSel, ListaIdEstab, ListaIdMotivoAdmSel, ListaIdMotivoDemSel,
      ListaIdMotivoAfastSel, ListaIdMotivoRetorSel: string; IdResponsavel: double;
      EmissaoNormal, ReciboParaEndResponsavel, EncerrAtividades: boolean;
      DataEncerrAtividades: TDate; NumeroProprietarios, IndicadorMicroEmpresa,
      OptanteSimples: integer; ListaIdRubricaRemNormal, ListaIdRubrica1Parc13,
      ListaIdRubrica2Parc13, ListaRubricaSalContratual, {ListaRubricaQuantHorasMensaisHor,}
      ListaRubricaQuantHorasExtras, ListaIdRubricaPAT, ListaIdMotivoResc,
      ListaIdRubricaAvisoPrevio, ListaRubricaFeriasIndeniz, ListaRubricaBancoHoras,
      ListaRubricaDissidio, ListaRubricaGratif, ListaRubricaMultaResc,
      ListaIdRubContribPatronalAssoc, ListaIdRubContribPatronalSind,
      ListaIdRubContribPatronalAssis, ListaIdRubContribPatronalConf, ListaIdRubContribAssoc,
      ListaIdRubContribSind, ListaIdRubContribAssis, ListaIdRubContribConf: string;
      PorcServProp, PorcAdmCoz, PorcRefConv, PorcRefTransp, PorcCestaAlim, PorcAlimConv,
      ValorSalMinAtual: double; DataRetif: TDate; piIdNovoResp: Integer; piParticipaPAT: Integer): boolean;

    property TempoDecorridoTotal: string read FTempoDecorridoTotal;
    property DadosArquivo: TStringList read FArq;
    property OnProgresso: TOnProgRAISMagnetico read FOnProgRAISMagnetico write FOnProgRAISMagnetico;
  end;

implementation

uses {Variants, uCMTraduzSql, }uCtrlFuncoesRH;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_SEM_DADOS_ESTAB =
    'Dados do(s) Estabelecimento(s) selecionado(s) não estão completos.:1'+
    'Verifique as informações no cadastro abaixo e tente novamente::2'+
    ' * Endereço comercial completo (incluindo Cidade e Estado);:3'+
    ' * Telefone do Endereço comercial.';
  MSG_SEM_DADOS_RESP =
    'Dados do Responsável selecionado não estão completos.:1'+
    'Verifique as informações no cadastro abaixo e tente novamente::2'+
    ' * Endereço comercial completo (incluindo Cidade e Estado);:3'+
    ' * Telefone do Endereço comercial.';
  MSG_SEM_DADOS =
    'Dados Cadastrais das Pessoas incompletos.:1'+
    'Verifique as informações no cadastro abaixo e tente novamente::2'+
    ' * Tipo de Contrato;:3'+
    ' * Situação Funcional;:4'+
    ' * Horário de Trabalho;:5'+
    ' * Cargo;:6'+
    ' * CTPS;:7'+
    ' * PIS;:8'+
    ' * Grau de Instrução;:9'+
    ' * Nacionalidade.';

  MSG_GERACAO_SEM_PESSOAS =
    'RAIS :1 não foi gerada.:2'+
    'Provavelmente aconteceu um dos casos abaixo para que nenhuma pessoa:3'+
    'seja gerada no arquivo::4'+
    ' - Demissão anterior ao ano-base;:5'+
    ' - Admissão depois do ano-base;:6'+
    ' - Estabelecimento não selecionado na tela.:7'+
    'Verifique o Histórico da Alteração Funcional e o Histórico da Alteração:8'+
    'da Situação Funcional para verificar os possíveis problemas.';
  MSG_GERACAO_OK = 'RAIS :1 gerada com sucesso.';
  MSG_GERACAO_AVISO = 'RAIS :1 gerada com sucesso mas com avisos.';
  MSG_GERACAO_INCONSIST = 'RAIS :1 gerada com sucesso mas com inconsistências.';
  MSG_GERACAO_AVISO_INCONSIST = 'RAIS :1 gerada com sucesso mas com avisos e inconsistências.';
  MSG_GERACAO_ERRO = 'Ocorreu um erro ao gerar a RAIS :1.';
  MSG_NAO_GERA_PESSOA =
    '        >> A PESSOA NÃO FOI GERADA NO ARQUIVO <<';
  MSG_GERA_PESSOA =
    '        >> A PESSOA SERÁ GERADA NO ARQUIVO COM A DATA DO HISTÓRICO <<';

  MSG_MOTIVO =
    'Código: :1 - Descrição: :2';
  MSG_MOTIVO_SEM_CODRAIS =
    'Os motivos abaixo não possuem Código RAIS associado.:1'+
    'É necessário que este campo seja preenchido com o valor:2'+
    'correto conforme manual da RAIS :3';

{  MSG_PESSOA_AFAST_ANO_ATERIOR =
    '[AVISO] As pessoas listadas abaixo, não foram geradas no arquivo pois:1'+
    'permanecem afastadas desde o ano-base anterior e não tiveram nenhuma:2'+
    'remuneração no ano-base atual::3';}

  // Mensagens relativas ao Histórico da Alteração Funcional
  MSG_PESSOA_INCONSIST_EVOLFUNC =
    '[INCONSISTÊNCIA] Histórico da Alteração Funcional Inconsistente.:1';
  MSG_PESSOA_SEM_ADMISSAO_INICIAL_EVOLFUNC =
    MSG_PESSOA_INCONSIST_EVOLFUNC+
    '        O primeiro registro no Histórico da Alteração Funcional entre:2'+
    '        as datas de admissão: ":3" e demissão: ":4":5'+
    '        não é referente à admissão da pessoa.:6'+
    MSG_NAO_GERA_PESSOA +':7'+
    'Nome: :8';
  MSG_PESSOA_SEM_EVOLFUNC =
    MSG_PESSOA_INCONSIST_EVOLFUNC+
    '        Nenhum Histórico da Alteração Funcional foi encontrado.:2'+
    MSG_NAO_GERA_PESSOA +':3'+
    'Nome: :4';
  MSG_PESSOA_EVOLFUNC_INCOMPLETA =
    MSG_PESSOA_INCONSIST_EVOLFUNC+
    '        Um dos registros está sem Estabelecimento.:2'+
    MSG_NAO_GERA_PESSOA +':3'+
    'Nome: :4';

  // Mensagens relativas ao Histórico da Situação Funcional
  MSG_PESSOA_AVISO_SITFUNC =
    '[AVISO] Histórico da Situação Funcional Diferente do Cadastro.:1';
  MSG_PESSOA_INCONSIST_SITFUNC =
    '[INCONSISTÊNCIA] Histórico da Situação Funcional Inconsistente.:1';
  MSG_PESSOA_SEM_SITFUNC =
    MSG_PESSOA_INCONSIST_SITFUNC+
    '        Nenhum Histórico da Situação Funcional foi encontrado para:2'+
    '        os aventos de: admissão, demissão, afastamento e retorno.:3'+
    MSG_NAO_GERA_PESSOA +':4'+
    'Nome: :5';
  MSG_PESSOA_SEM_ADMISSAO_INICIAL_SITFUNC =
    MSG_PESSOA_INCONSIST_SITFUNC+
    '        O primeiro registro no Histórico da Situação Funcional:2'+
    '        não é referente à admissão da pessoa.:3'+
    MSG_NAO_GERA_PESSOA +':4'+
    'Nome: :5';
  MSG_PESSOA_SEM_ADMISSAO =
    MSG_PESSOA_INCONSIST_SITFUNC+
    '        Existe uma ou mais demissões sem as respectivas admissões.:2'+
    MSG_NAO_GERA_PESSOA +':3'+
    'Nome: :4';
  MSG_PESSOA_SEM_DEMISSAO =
    MSG_PESSOA_INCONSIST_SITFUNC+
    '        Existe uma ou mais admissões sem as respectivas demissões.:2'+
    MSG_NAO_GERA_PESSOA +':3'+
    'Nome: :4';
  MSG_PESSOA_DEM_ANO_ANTERIOR =
    MSG_PESSOA_INCONSIST_SITFUNC+
    '        A pessoa está como demitida no histórico e como ativa:2'+
    '        no Cadastro de Pessoal.:3'+
    MSG_NAO_GERA_PESSOA +':4'+
    'Nome: :5';
  MSG_PESSOA_ADMISSAO_INCONSIST =
    MSG_PESSOA_AVISO_SITFUNC+
    '        Data de Admissão que está no histórico não está compatível:2'+
    '        com a que está no Cadastro de Pessoal.:3'+
    '        Data do histórico: ":4" - Data do cadastro: ":5":6'+
    MSG_GERA_PESSOA +':7'+
    'Nome: :8';
  MSG_PESSOA_DEMISSAO_INCONSIST =
    MSG_PESSOA_AVISO_SITFUNC+
    '        Data de Demissão que está no histórico não está compatível:2'+
    '        com a que está no Cadastro de Pessoal.:3'+
    '        Data do histórico: ":4" - Data do cadastro: ":5":6'+
    MSG_GERA_PESSOA +':7'+
    'Nome: :8';
  MSG_PESSOA_ADM_DEM_INCONSIST =
    MSG_PESSOA_AVISO_SITFUNC+
    '        As datas de admissão e demissão que estão no histórico não:2'+
    '        estão compatíveis com as que estão no Cadastro de Pessoal.:3'+
    '        Admissão -> Histórico: ":4" - Cadastro: ":5":6'+
    '        Demissão -> Histórico: ":7" - Cadastro: ":8":9'+
    MSG_GERA_PESSOA +':10'+
    'Nome: :11';
  MSG_PESSOA_SEM_RETORNO =
    MSG_PESSOA_INCONSIST_SITFUNC+
    '        A pessoa tem um afastamento e depois uma outra Alteração na:2'+
    '        Situação Funcional que não é o retorno deste afastamento.:3'+
    MSG_NAO_GERA_PESSOA +':4'+
    'Nome: :5';
  MSG_PESSOA_SEM_AFASTAMENTO =
    MSG_PESSOA_INCONSIST_SITFUNC+
    '        A pessoa tem um retorno mas não tem um afastamento.:2'+
    MSG_NAO_GERA_PESSOA +':3'+
    'Nome: :4';

  // Mensagens relativas às remunerações
  MSG_PESSOA_SEM_REM =
    '[INCONSISTÊNCIA] Histórico de Rubricas Salariais.:1'+
    '        Nenhuma remuneração foi encontrada dentro do ano-base:2'+
    MSG_NAO_GERA_PESSOA +':3'+
    'Nome: :4';

{ TCtrlParamRAISMagnetico }

constructor TCtrlParamRAISMagnetico.Create;
begin
  inherited;
  //FCtrlDiasTrab := TCtrlDiasTrab.Create(false);

  FSQL := TStringList.Create;
  FArq := TStringList.Create;

  GetTempDir;
end;

destructor TCtrlParamRAISMagnetico.Destroy;
begin
  //FCtrlDiasTrab.Free;
  FSQL.Free;
  FArq.Free;
  inherited;
end;

procedure TCtrlParamRAISMagnetico.AfterInitialize;
begin
  inherited;
  //FCtrlDiasTrab.InitializeAs(Self);
end;

procedure TCtrlParamRAISMagnetico.DoChangeDataBase;
begin
  inherited;
  //FCtrlDiasTrab.DataBaseName := DataBaseName;
end;

procedure TCtrlParamRAISMagnetico.IncProgresso(const TempoAtual, Mensagem: string;
  const NumPessoas: integer; const IncProg: boolean; const Log: string);
begin
  if Assigned(OnProgresso) then
    OnProgresso(TempoAtual, Mensagem, NumPessoas, IncProg, Log);
end;

procedure TCtrlParamRAISMagnetico.IncListaMensagens(const IdEmpresa: integer;
  const IdPessoa: double; const TipoMsg: TTipoMsg; const Msg: string);
begin
  FCdsListaMensagens.Insert;
  FCdsListaMensagens.FieldByName('IDEMPRESA').asInteger := IdEmpresa;
  FCdsListaMensagens.FieldByName('IDPESSOA').asFloat := IdPessoa;
  FCdsListaMensagens.FieldByName('TIPO_MENSAGEM').asInteger := Integer(TipoMsg);
  FCdsListaMensagens.FieldByName('MENSAGEM').asString := Msg;
  FCdsListaMensagens.Post;
end;

function TCtrlParamRAISMagnetico.GetNumMensagensTipo(const TipoMsg: TTipoMsg): integer;
begin
  try
    FCdsListaMensagens.Filter :=
      'TIPO_MENSAGEM = ' +IntToStr(Integer(TipoMsg)) + ' AND '+
      'IDEMPRESA = ' + IntToStr(FIdEmpresa);
    FCdsListaMensagens.Filtered := true;
    Result := FCdsListaMensagens.RecordCount;
  finally
    FCdsListaMensagens.Filtered := false;
  end;
end;

function TCtrlParamRAISMagnetico.GetTempoDecorrido(Extendido: boolean): string;
begin
  if (Extendido) then
    Result := HoraPorExtenso(Time - FHoraIni)
  else
    Result := FormatDateTime('hh:mm:ss', Time - FHoraIni);
end;

function TCtrlParamRAISMagnetico.Val_CTPS(Ini,Tam: byte; Campo: string): string;
var
  c: byte;
  sAux: string;
begin
  try
    for c:=1 to Length(Campo) do
      if (Campo[c] in ['0'..'9']) then
        sAux := sAux + Campo[c];
    Result := Replicate ('0', Abs(Tam-Length(Copy(sAux,Ini,Tam)))) + Copy(sAux,Ini,Tam);
  except
    Result := Replicate(' ', Tam);
  end;
end;

function TCtrlParamRAISMagnetico.MontarJoinRubricas(ListaIdRubrica: string;
  const Recudo: byte): string;
var
  iPos: integer;
  sRubrica, sCodRubrica, sCodTipFol: string;
begin
  Result := '';
  while (ListaIdRubrica <> '') do
  begin
    ExtraiString(ListaIdRubrica, sRubrica, ',');

    iPos := Pos('=', sRubrica);
    // Pegar o Código da Rubrica Atual
    if (iPos = 0) then
      sCodRubrica := sRubrica
    else
      sCodRubrica := Copy(sRubrica, 1, iPos-1);
    // Pegar o Código do Tipo de Folha Atual
    if (iPos = 0) then
      sCodTipFol := ''
    else
      sCodTipFol := Copy(sRubrica, iPos+1, Length(sRubrica) - iPos+1);

    if (sCodTipFol <> '') then
      Result := Result +
        IFF(Result = '', '', ' OR' +CR_LF)+
        Replicate(' ',Recudo)+ ' ((H.CODPROVDESC = ' +QuotedStr(sCodRubrica)+ ') AND'+CR_LF+
        Replicate(' ',Recudo)+ '  (H.IDMOTIVO    = ' +sCodTipFol+ '))'
    else
      Result := Result +
        IFF(Result = '', '', ' OR' +CR_LF)+
        Replicate(' ',Recudo)+ ' (H.CODPROVDESC  = ' +QuotedStr(sCodRubrica)+ ')';
  end;

  if (Result <> '') then
    Result := Replicate(' ',Recudo)+ '('+CR_LF +Result+ CR_LF+'  ) AND';
end;

function TCtrlParamRAISMagnetico.GetAfastamento(const Posicao: byte): TRegAfastamento;
begin
  FCdsAfastPessoa.Filtered := false;
  FCdsAfastPessoa.Filter := 'IDPESSOA = ' + FCdsPessoa.FieldByName('IDPESSOA').asString;
  FCdsAfastPessoa.Filtered := true;
  if (Posicao <= FCdsAfastPessoa.RecordCount) then
  begin
    FCdsAfastPessoa.RecNo := Posicao;
    Result.Motivo := FCdsAfastPessoa.FieldByName('CODIGO').asString;
    Result.DataInicial := FormatDateTime('DDMM',FCdsAfastPessoa.FieldByName('DATA_INICIAL').asDateTime);
    Result.DataFinal := FormatDateTime('DDMM',FCdsAfastPessoa.FieldByName('DATA_FINAL').asDateTime);
    // Caso a Data Final do Afastamento estiver no próximo ano, não subtrair um ao dia
{    if (FCdsAfastPessoa.FieldByName('DATA_FINAL_ORIGINAL').asInteger = 0) then
      Result.DataFinal := FormatDateTime('DDMM',FCdsAfastPessoa.FieldByName('DATA_FINAL').asDateTime)
    else
      Result.DataFinal := FormatDateTime('DDMM',FCdsAfastPessoa.FieldByName('DATA_FINAL').asDateTime - 1);}
  end
  else
  begin
    Result.Motivo := '';
    Result.DataInicial := '';
    Result.DataFinal := '';
  end;
end;

function TCtrlParamRAISMagnetico.GetDataAdmLimite(const Data: TDate): TDate;
begin
  if (FormatDateTime('YYYY',Data) < FAnoRef) then
    Result := StrToDate('01/01/' +FAnoRef)
  else
    Result := Data;
end;

function TCtrlParamRAISMagnetico.GetDataDemLimite(const Data: TDate): TDate;
begin
  if (Data = 0) or ((Data > 0) and (FormatDateTime('YYYY',Data) > FAnoRef)) then
    Result := StrToDate('31/12/' +FAnoRef)
  else
    Result := Data;
end;

{function TCtrlParamRAISMagnetico.GetCargaHorariaMes(const Mes: byte): string;
begin
  if (FCdsPessoa.FieldByName('REM_MES_'+PoeZero(Mes)).asFloat > 0) then
    Result := fValidaDados('N',FCdsPessoa.FieldByName('HRS_TRAB_MES_'+PoeZero(Mes)).asString,3)
  else
    Result := '000';
end;}

function TCtrlParamRAISMagnetico.GetHoraExtraMes(const Mes: byte): string;
begin
  if (FCdsPessoa.FieldByName('REM_MES_'+PoeZero(Mes)).asFloat > 0) then
    Result := fValidaDados('N',FCdsPessoa.FieldByName('HRS_EXTRA_MES_'+PoeZero(Mes)).asString,3)
  else
    Result := '000';
end;

procedure TCtrlParamRAISMagnetico.FiltrarCdsValorNoPeriodo(Cds: TCMClientDataSet;
  const RubRescisao: boolean);
var
  sAdmissao, sDemissao: string;
begin
  sAdmissao := FormatDateTime('YYYY/MM', FCdsPessoa.FieldByName('DATA_ADMISSAO').asDateTime);
  if (FCdsPessoa.FieldByName('DATA_DEMISSAO').IsNull) or
     (FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime = 0) then
    sDemissao := FAnoRef +'/12'
  else
  begin
    {if (ExtraiDia(FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime) < 15) and
       not(RubRescisao) then
      sDemissao := IncDataAM(FormatDateTime('YYYY/MM', FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime), -1)
    else}
      sDemissao := FormatDateTime('YYYY/MM', FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime);
  end;

  Cds.Filter :=
    '(MES >= '+ QuotedStr(sAdmissao) +') AND '+
    '(MES <= '+ QuotedStr(sDemissao) +')';
  Cds.Filtered := true;
end;

{procedure TCtrlParamRAISMagnetico.FiltrarAfastNoPeriodo(const DataIni, DataFin: TDate);
begin
  FCdsAfastPessoa.Filtered := false;
  FCdsAfastPessoa.Filter :=
    '(IDPESSOA = ' +FCdsPessoa.FieldByName('IDPESSOA').asString+ ') AND '+
    '(DATA_INICIAL >= ' +QuotedStr(DateToStr(DataIni))+ ') AND '+
    '(DATA_FINAL <= ' +QuotedStr(DateToStr(DataFin))+ ')';
  FCdsAfastPessoa.Filtered := true;
end;}

function TCtrlParamRAISMagnetico.VerificarInconsisCodRAIS: boolean;
var
  sMsg: string;
  _CdsAux: TCMClientDataSet;

{->}procedure MontarMensagemMotivos(ListaIdMotivo: string);
    var
      sFiltro, sIdMotivo: string;
    begin
      sFiltro := '';
      while (ListaIdMotivo <> '') do
      begin
        ExtraiString(ListaIdMotivo, sIdMotivo, ',');
        if (sFiltro <> '') then
          sFiltro := sFiltro +' OR ';
        sFiltro := sFiltro + '(IDMOTIVO = ' +sIdMotivo+ ')';
      end;

      _CdsAux.Filtered := false;
      _CdsAux.Filter := sFiltro;
      _CdsAux.Filtered := true;
      _CdsAux.First;
      while not(_CdsAux.EOF) do
      begin
        if (_CdsAux.FieldByName('MOTIVORAIS').asString = '') then
        begin
          if (sMsg <> '') then
            sMsg := sMsg +CR_LF;
          sMsg := sMsg + CMTranslateMsg(MSG_MOTIVO, [
            _CdsAux.FieldByName('IDMOTIVO').asString,
            _CdsAux.FieldByName('DESCRICAO').asString]);
        end;
        _CdsAux.Next;    
      end;
{->}end;

begin
  Result := false;
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  IDMOTIVO, MOTIVORAIS, DESCRICAO' +CR_LF+
      'FROM' +CR_LF+
      '  MOTIVO' +CR_LF+
      'ORDER BY' +CR_LF+
      '  DESCRICAO');

    sMsg := '';
    MontarMensagemMotivos(FListaIdMotivoAdmSel);
    MontarMensagemMotivos(FListaIdMotivoDemSel);
    MontarMensagemMotivos(FListaIdMotivoAfastSel);
    if (sMsg = '') then
      Result := true
    else  
      IncProgresso('', '', 0, false,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_MOTIVO_SEM_CODRAIS, [CR_LF, CR_LF, FAnoRef])+ CR_LF+
        sMsg +CR_LF+ Replicate('-',40));
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlParamRAISMagnetico.AbrirQueryEstabelecimento: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ.IDPESSOA AS IDESTAB,');
    Add('  (CASE WHEN CEI.IDDOCUMENTO = DI.IDDOCUMENTO THEN 3');
    Add('        ELSE 1');
    Add('   END) AS TIPO_INSCRICAO,');
    Add('  (CASE WHEN CEI.IDDOCUMENTO = DI.IDDOCUMENTO THEN CEI.NUM');
    Add('        ELSE CNPJ.NUM');
    Add('   END) AS INSCRICAO,');
    Add('  TO_CHAR(DECODE(CNPJ.NUM,');
    Add('    NULL,'''',');
    Add('    CEI.NUM');
    Add('  )) AS MATRICULA_CEI,');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS NOME,');
    Add('  E.LOGRADOURO,');
    Add('  E.NUMERO,');
    Add('  RTRIM(E.COMPLEMENTO) AS COMPLEMENTO,');
    Add('  RTRIM(E.BAIRRO) AS BAIRRO,');
    Add('  RTRIM(E.CEP) AS CEP,');
    Add('  RTRIM(CI.CODMUNICIPIO) AS COD_MUNICIPIO,');
    Add('  RTRIM(CI.NOME) AS NOM_MUNICIPIO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(TEL.DDD) AS DDD,');
    Add('  RTRIM(TEL.NUMERO) AS TELEFONE,');
    Add('  RTRIM(PJ.EMAIL) AS EMAIL,');
    Add('  FP.IDITEMCNAE AS CNAE,');
    Add('  FP.IDNATEMPRE AS NAT_JURIDICA');
    Add(', FP.IDSISTEMACONTROLEPONTORAIS ');                //William Santana SOL 224461/15703 KIN 2059184
    // -------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, CIDADES CI, ESTADO ES, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------- //
    // Obter o documento identificador da Empresa
    Add('  (SELECT P.IDPESSOA, TDO.IDDOCUMENTO');
    Add('   FROM   PESSOA P, FILIALPESSOA FP, TIPODOCOFICIAL TDO');
    Add('   WHERE (FP.IDFILIALPESSOA = P.IDPESSOA) AND');
    Add('         (P.IDDOCUMENTO     = TDO.IDDOCUMENTO)) DI,');
    // -------------------------------------------------------------------------- //
    // CNPJ da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.IDDOCUMENTO, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('          (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DP.IDPESSOA)) CNPJ,');
    // -------------------------------------------------------------------------- //
    // CEI da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.IDDOCUMENTO, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  (TDO.SIGLADOCUMENTO = ''CEI:'') AND');
    Add('          (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA  = DP.IDPESSOA)) CEI,');
    // -------------------------------------------------------------------------- //
    // Telefone da Empresa
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) ENDER');
    Add('   WHERE');
    Add('     (ENDER.IDTELEFONE = TE.IDTELEFONE)) TEL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add(MontaLinhaSelSQL('  (PJ.IDPESSOA',FListaIdEstab,6));
    Add('  (PJ.NUMDOCUMENTO   IS NOT NULL) AND');
    Add('  (PJ.IDPESSOA       = FP.IDFILIALPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = TEL.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CI.IDCIDADES) AND');
    Add('  (CI.IDESTADO       = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = DI.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = CEI.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = CNPJ.IDPESSOA(+))');
    //SaveToFile('c:\qryEstab.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryEstab.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  IncProgresso('', CMTranslate('Selecionando dados do(s) Estabelecimento(s)...'));
  FCdsEstab.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido);

  Result := not(FCdsEstab.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS_ESTAB, [CR_LF, CR_LF, CR_LF]);
end;

function TCtrlParamRAISMagnetico.AbrirQueryResponsavel: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT'); // +IFF(TTipoBDPadrao(iTipoBD_Padrao) in [tbdSQLServer, tbdSQLServerOdbc],' TOP 1', ''));

    Add('  (CASE WHEN CEI.IDDOCUMENTO = DI.IDDOCUMENTO THEN 3');
    Add('        ELSE 1');
    Add('   END) AS TIPO_INSCRICAO,');
    Add('  (CASE WHEN CEI.IDDOCUMENTO = DI.IDDOCUMENTO THEN CEI.NUM');
    Add('        ELSE CNPJ.NUM');
    Add('   END) AS INSCRICAO,');

    Add('  PJ.RAZAOSOCIAL,');
    Add('  PJ.NOME,');
    Add('  E.LOGRADOURO,');
    Add('  E.NUMERO,');
    Add('  RTRIM(E.COMPLEMENTO) AS COMPLEMENTO,');
    Add('  RTRIM(E.BAIRRO) AS BAIRRO,');
    Add('  RTRIM(E.CEP) AS CEP,');
    Add('  RTRIM(CI.CODMUNICIPIO) AS COD_MUNICIPIO,');
    Add('  RTRIM(CI.NOME) AS NOM_MUNICIPIO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(TEL.DDD) AS DDD,');
    Add('  RTRIM(TEL.NUMERO) AS TELEFONE,');
    Add('  RTRIM(PJ.EMAIL) AS EMAIL');
    // -------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, CIDADES CI, ESTADO ES,');
    // -------------------------------------------------------------------------- //
    // Obter o documento identificador da Empresa
    Add('  (SELECT P.IDPESSOA, TDO.IDDOCUMENTO');
    Add('   FROM   PESSOA P, FILIALPESSOA FP, TIPODOCOFICIAL TDO');
    Add('   WHERE (FP.IDFILIALPESSOA = P.IDPESSOA) AND');
    Add('         (P.IDDOCUMENTO     = TDO.IDDOCUMENTO)) DI,');
    // -------------------------------------------------------------------------- //
    // CNPJ da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.IDDOCUMENTO, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('          (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DP.IDPESSOA)) CNPJ,');
    // -------------------------------------------------------------------------- //
    // CEI da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.IDDOCUMENTO, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  (TDO.SIGLADOCUMENTO = ''CEI:'') AND');
    Add('          (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA  = DP.IDPESSOA)) CEI,');
    // -------------------------------------------------------------------------- //
    // Telefone da Empresa
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) ENDER');
    Add('   WHERE');
    Add('     (ENDER.IDTELEFONE = TE.IDTELEFONE)) TEL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA       = ' +FloatToStr(FIdResponsavel)+ ') AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = TEL.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CI.IDCIDADES) AND');
    Add('  (CI.IDESTADO       = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = DI.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = CEI.IDPESSOA(+)) AND');

    if (True) then // (TTipoBDPadrao(iTipoBD_Padrao) = tbdOracle) then
    begin
      Add('  (PJ.IDPESSOA       = CNPJ.IDPESSOA(+)) AND');
      Add('  (ROWNUM = 1)');
    end
    else
      Add('  (PJ.IDPESSOA       = CNPJ.IDPESSOA(+))');

   //SaveToFile('c:\qryResp.txt');
   SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryResp.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  IncProgresso('', CMTranslate('Selecionando dados do Responsável...'));
  FCdsResp.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido);

  //Bruno Bastos - Sol: 129826 - Kintana: 715518 - Início
  FCdsNovoResp.Data := GetDataPacket(' SELECT '+
                                     '   PES.IDPESSOA, '+
                                     '   PES.NOME, '+
                                     '   PES.EMAIL, '+
                                     '   PES.NUMDOCUMENTO AS CPF, '+
                                     '   PSF.DATANASC '+

                                     ' FROM '+
                                     '   PESSOA       PES, '+
                                     '   FUNCIONARIO  FUN, '+
                                     '   SITFUNC      STF, '+
                                     '   PESSOAFISICA PSF  '+

                                     ' WHERE FUN.IDSITFUNC = STF.IDSITFUNC '+
                                     '   AND STF.TIPOSIT   = ''A'' '+
                                     '   AND FUN.IDPESSOA  = PES.IDPESSOA '+
                                     '   AND PSF.IDPESSOA  = PES.IDPESSOA '+
                                     '   AND PES.IDPESSOA  = '+FloatToStr(FIdNovoResp)+

                                     ' ORDER BY '+
                                     '   PES.NOME ');
  //Bruno Bastos - Sol: 129826 - Kintana: 715518 - Fim

  //Bruno Bastos - Sol: 129826 - Kintana: 715518 - Result := not(FCdsResp.IsEmpty);
  Result := (not (FCdsResp.IsEmpty)) and (not (FCdsNovoResp.IsEmpty)); //Bruno Bastos - Sol: 129826 - Kintana: 715518
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS_RESP, [CR_LF, CR_LF, CR_LF]);
end;

function TCtrlParamRAISMagnetico.AbrirQueryPessoa: boolean;
var
  c: byte;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  F.IDPESSOA, F.IDEMPRESA,');
    Add('  RTRIM(P.NOME) AS EMPREGADO,');
    Add('  TO_CHAR(DECODE(EST.ANOCHEGADA,');
    Add('    NULL,'''',');
    Add('    TO_CHAR(EST.ANOCHEGADA,''YYYY'')');
    Add('  )) ANOCHEGADA,');
    Add('  P.NUMDOCUMENTO AS CPF,');
    Add('  CTPS.NUM AS CTPS,');
    Add('  PIS.NUM AS PIS,');
    Add('  C.CBO2002 AS CBO,');
    Add('  GI.CODRAIS AS GRAU_INSTR,');
    Add('  PAIS.CODRECEITAFEDERAL AS NACIONALIDADE,');
    Add('  F.IDVINCEMPREG AS VINC_EMPREG,');
    Add('  F.MATRICULA,');
    Add('  PF.DATANASC,');
    Add('  PF.SEXO,');
    Add('  NVL(PF.FLGDEFICIENTE,2) AS FLGDEFICIENTE,');
    // (1->Indígena; 2->Branca; 4->Negra; 6->Amarela; 8->Parda; 9->Não informado)
    Add('  TO_NUMBER(DECODE(PF.CORPESSOA,');
    Add('    NULL,9,');
    Add('    0,1,');
    Add('    PF.CORPESSOA');
    Add('  )) AS COR,');
    Add('  F.DATAREFHORARIO AS DATAREF, F.IDHORARIO,');
    Add('  HT.FLGTIPOHORARIO AS TIPOHORARIO, HT.HORASFOLGA1,');
    Add('  HT.HORASSERVICO, HT.HORASFOLGA2,');
    Add('  HT.JORNADAMENSAL AS HRS_TRAB_MES,');
    Add('  F.SALARIOATUAL AS VAL_SAL_CONTRATUAL,');
    Add('  0.00 AS VAL_AVISO_PREVIO,');
    Add('  0 AS QUANT_DIAS_AFAST,');

    for c:=1 to 12 do
      Add('  0.00 AS REM_MES_' +PoeZero(c)+ ',');

    for c:=1 to 12 do
      //Add('  0 AS HRS_TRAB_MES_' +PoeZero(c)+ ',');
      Add('  0 AS HRS_EXTRA_MES_' +PoeZero(c)+ ',');

    Add('  0 AS MES_1_PARC_13,');
    Add('  0.00 AS VAL_1_PARC_13,');
    Add('  0 AS MES_2_PARC_13,');
    Add('  0.00 AS VAL_2_PARC_13,');
    Add('  0.00 AS VAL_FERIAS_INDENIZ,');
    Add('  0.00 AS VAL_BANCO_HORAS,');
    Add('  0 AS QUANT_BANCO_HORAS,');
    Add('  0.00 AS VAL_DISSIDIO,');
    Add('  0 AS QUANT_DISSIDIO,');
    Add('  0.00 AS VAL_GRATIF,');
    Add('  0 AS QUANT_GRATIF,');
    Add('  0.00 AS VAL_MULTA_RESC,');
    Add('  ''N'' AS PARTICIPA_PAT,');
    Add('  0 AS IDESTAB,');
    Add('  (''    '') AS TIPO_ADMISSAO,');
    Add('  (''    '') AS TIPO_DEMISSAO,');
    Add('  F.DATAADMISSAO AS DATA_ADMISSAO,');
    Add('  F.DATADESLIGAMENTO AS DATA_DEMISSAO,');
    Add('  TO_CHAR(DECODE(F.TIPOPAGAMENTO,');
    Add('    ''H'',''5'',');
    Add('    ''D'',''4'',');
    Add('    ''M'',''1'',');
    Add('    ''T'',''6'',');
    Add('    ''''');
    Add('  )) AS TIPO_PAGAMENTO');
    // -------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA P, PESSOAFISICA PF, FUNCIONARIO F, CARGO C, HORATRAB HT,');
    Add('  PAIS, ESTRANGEIRO EST, SITFUNC SF, GRINSTR GI,');
    // -------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) CTPS,');
    // -------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) PIS');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    //Add(MontaLinhaSelSQL('  (F.IDESTAB',FListaIdEstab,6));
    Add('  (((SF.TIPOSIT   <> ''D'') AND');
    Add('    (TO_CHAR(F.DATAADMISSAO,''YYYY'') <= ' +QuotedStr(FAnoRef)+ ')) OR');
    Add('   ((SF.TIPOSIT    = ''D'') AND');
    Add('    (TO_CHAR(F.DATAADMISSAO,''YYYY'') <= ' +QuotedStr(FAnoRef)+ ') AND');
    Add('    (TO_CHAR(F.DATADESLIGAMENTO,''YYYY'') >= ' +QuotedStr(FAnoRef)+ '))) AND');
    Add(MontaLinhaSelSQL('  (F.TIPOCONTRATO',FListaTipoContratoSel,1));
    Add('  (F.IDSITFUNC     = SF.IDSITFUNC) AND');
    Add('  (F.IDHORARIO     = HT.IDHORARIO) AND');
    Add('  (F.IDCARGO       = C.IDCARGO) AND');
    Add('  (F.IDPESSOA      = CTPS.IDPESSOA) AND');
    Add('  (F.IDPESSOA      = PIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA      = PF.IDPESSOA) AND');
    Add('  (PF.IDGRINSTR    = GI.IDGRINSTR) AND');
    Add('  (PF.IDPAIS       = PAIS.IDPAIS) AND');
    Add('  (PF.IDPESSOA     = P.IDPESSOA) AND');
    Add('  (PF.IDPESSOA     = EST.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  EMPREGADO');
    //SaveToFile('c:\qryPessoa.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryPessoa.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;
  IncProgresso('', CMTranslate('Selecionando dados das Pessoas...'));
  FCdsPessoa.IndexName := '';
  if (FCdsPessoa.IndexDefs.IndexOf('Indice') > 0) then
    FCdsPessoa.DeleteIndex('Indice');
  FCdsPessoa.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido, '', FCdsPessoa.RecordCount);

  Result := not(FCdsPessoa.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS, [CR_LF]);
end;

function TCtrlParamRAISMagnetico.GetIdDocCNPJ: integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT TDP.IDDOCUMENTO' +CR_LF+
      'FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO' +CR_LF+
      'WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR' +CR_LF+
      '        (TDO.SIGLADOCUMENTO = ''CGC:'')) AND' +CR_LF+
      '       (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO)');
    Result := _CdsAux.FieldByName('IDDOCUMENTO').asInteger;
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlParamRAISMagnetico.GetCodTipoDeficiencia: string;
var
  sFlgDeficiente: string;
begin
  sFlgDeficiente := FCdsPessoa.FieldByName('FLGDEFICIENTE').asString;
  if (sFlgDeficiente = '1') then // Física
    Result := '1'
  else
  if (sFlgDeficiente = '3') then // Auditiva
    Result := '2'
  else
  if (sFlgDeficiente = '4') then // Visual
    Result := '3'
  else
  if (sFlgDeficiente = '5') then // Mental
    Result := '4'
  else
  if (sFlgDeficiente = '6') then // Múltipla
    Result := '5'
  else
  if (sFlgDeficiente = '7') then // Reabilitado
    Result := '6'
  else
  // FlgDeficiente = '2' ou Nenhuma das anteriores. Não é Portador de Deficiência
    Result := '0';
end;

procedure TCtrlParamRAISMagnetico.GetValContribPatronal(const IdEstab: double;
  const ListaIdRub: string; var CNPJ: string; var Valor: double);
begin
  CNPJ := '';
  Valor := 0;
  if (ListaIdRub = '') then
    exit;

  FCdsContribPatronal.Filter :=
    '(IDESTAB = ' +FloatToStr(IdEstab)+ ') AND '+
    MontaLinhaSelSQL('(CODPROVDESC', QuotedListaString(ListaIdRub,','), 1, false);
  FCdsContribPatronal.Filtered := true;

  if not(FCdsContribPatronal.IsEmpty) then
  begin
    FCdsContribPatronal.First;
    CNPJ := FCdsContribPatronal.FieldByName('CNPJ').asString;
    repeat
      Valor := Valor + FCdsContribPatronal.FieldByName('VALOR').asFloat;
      FCdsContribPatronal.Next;
    until (FCdsContribPatronal.EOF);
  end;

  FCdsContribPatronal.Filtered := false;
end;

procedure TCtrlParamRAISMagnetico.GetValContribIndiv(const IdPessoa, IdEstab: double;
  const ListaIdRub: string; var CNPJ: string; var Valor: double);
begin
  CNPJ := '';
  Valor := 0;
  if (ListaIdRub = '') then
    exit;

  FCdsContrib.Filter :=
    '(IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND '+
    '(IDESTAB = ' +FloatToStr(IdEstab)+ ') AND '+
    MontaLinhaSelSQL('(CODPROVDESC', QuotedListaString(ListaIdRub,','), 1, false);
  FCdsContrib.Filtered := true;

  if not(FCdsContrib.IsEmpty) then
  begin
    FCdsContrib.First;
    CNPJ := FCdsContrib.FieldByName('CNPJ').asString;
    while not(FCdsContrib.EOF) do
    begin
      Valor := Valor + FCdsContrib.FieldByName('VALOR').asFloat;
      FCdsContrib.Next;
    end;  
  end;

  FCdsContrib.Filtered := false;
end;

procedure TCtrlParamRAISMagnetico.GetValContribIndivAssoc(const IdPessoa, IdEstab: double;
  const ListaIdRub: string; var CNPJ: TArrayCNPJ_ContribIndivAssoc;
  var Valor: TArrayVal_ContribIndivAssoc);
begin
  CNPJ[1] := '';
  CNPJ[2] := '';
  Valor[1] := 0;
  Valor[2] := 0;
  if (ListaIdRub = '') then
    exit;

  FCdsContrib.Filter :=
    '(IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND '+
    '(IDESTAB = ' +FloatToStr(IdEstab)+ ') AND '+
    MontaLinhaSelSQL('(CODPROVDESC', QuotedListaString(ListaIdRub,','), 1, false);
  FCdsContrib.Filtered := true;

  if not(FCdsContrib.IsEmpty) then
  begin
    FCdsContrib.First;
    CNPJ[1] := FCdsContrib.FieldByName('CNPJ').asString;
    while not(FCdsContrib.EOF) do
    begin
      Valor[1] := Valor[1] + FCdsContrib.FieldByName('VALOR').asFloat;
      FCdsContrib.Next;
    end;
  end;

{  if not(FCdsContrib.IsEmpty) then
  begin
    FCdsContrib.First;                  
    CNPJ[1] := FCdsContrib.FieldByName('CNPJ').asString;
    Valor[1] := FCdsContrib.FieldByName('VALOR').asFloat;
    if (FCdsContrib.RecordCount > 1) then
    begin
      FCdsContrib.Next;
      CNPJ[2] := FCdsContrib.FieldByName('CNPJ').asString;
      Valor[2] := FCdsContrib.FieldByName('VALOR').asFloat;
    end;
  end;}

  FCdsContrib.Filtered := false;
end;

procedure TCtrlParamRAISMagnetico.MontarQueriesEmBranco;
begin
  FCdsListaMensagens.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  0 AS IDEMPRESA, 0 AS IDPESSOA, 0 AS TIPO_MENSAGEM,' +CR_LF+
    '  LPAD(''1'',1000,''1'') AS MENSAGEM' +CR_LF+
    'FROM' +CR_LF+
    '  DUAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (1 = 2)');

  FCds_EvolFunc.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  0 AS IDMOTIVO, 0 AS IDEMPRESA, 0 AS IDESTAB, 0.00 AS SALARIO,' +CR_LF+
    '  SYSDATE AS DATA, ''1'' AS TIPO_PAGAMENTO, 0 AS CBO,' +CR_LF+
    '  ''1234'' AS ANO,' +CR_LF+
    '  ''1234'' AS MOTIVO' +CR_LF+
    'FROM' +CR_LF+
    '  DUAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (1 = 2)');

  FCds_AdmDem.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  0 AS IDMOTIVO, SYSDATE AS DATA,' +CR_LF+
    '  ''1234'' AS ANO,' +CR_LF+
    '  ''1234'' AS MOTIVO' +CR_LF+
    'FROM' +CR_LF+
    '  DUAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (1 = 2)');

  FCdsAfastPessoa.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  0 AS IDPESSOA, ''1234'' AS CODIGO,' +CR_LF+
    '  SYSDATE AS DATA_INICIAL, SYSDATE AS DATA_FINAL,' +CR_LF+
    '  0 AS DATA_FINAL_ORIGINAL' +CR_LF+
    'FROM' +CR_LF+
    '  DUAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (1 = 2)');

  FCds_Remuneracao.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  ''AAAA/MM'' AS MES,' +CR_LF+
    '  0.00 AS VALOR' +CR_LF+
    'FROM' +CR_LF+
    '  DUAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (1 = 2)');
  FCds_1Parc13.Data := FCds_Remuneracao.Data;
  FCds_2Parc13.Data := FCds_Remuneracao.Data;
  FCds_PAT.Data := FCds_Remuneracao.Data;
  FCds_AvisoPrevio.Data := FCds_Remuneracao.Data;
  FCds_SalContratual.Data := FCds_Remuneracao.Data;
  //FCds_QuantHorasMensaisHor.Data := FCds_Remuneracao.Data;
  FCds_QuantHorasExtras.Data := FCds_Remuneracao.Data;
  FCds_FeriasIndeniz.Data := FCds_Remuneracao.Data;
  FCds_BancoHoras.Data := FCds_Remuneracao.Data;
  FCds_Dissidio.Data := FCds_Remuneracao.Data;
  FCds_Gratif.Data := FCds_Remuneracao.Data;
  FCds_MultaResc.Data := FCds_Remuneracao.Data;

  {FCds_Ferias.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  SYSDATE AS INIGOZOFERIAS,' +CR_LF+
    '  SYSDATE AS FIMGOZOFERIAS' +CR_LF+
    'FROM' +CR_LF+
    '  DUAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (1 = 2)');}
end;

function TCtrlParamRAISMagnetico.MontarQueryValRubrica(const ListaIdRubrica: string;
  const Rescisao: boolean): string;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  H.MES,');
    Add('  SUM(TO_NUMBER(DECODE(PD.FLGDESCONTO,');
    Add('        1,-H.VALORPROVENTO,');
    Add('        H.VALORPROVENTO');
    Add('      ))) AS VALOR');
    Add('FROM');
    Add('  HISTRUBSAL H, PROVDESC PD');
    Add('WHERE');
    Add('  (H.IDPESSOA     = :IDPESSOA) AND');

    if (ListaIdRubrica <> '') then
    begin
      if (Rescisao) then
      begin
        if (FListaIdMotivoResc <> '') then
          Add(MontaLinhaSelSQL('  (H.IDMOTIVO', FListaIdMotivoResc, 4));

        Add(MontaLinhaSelSQL('  (H.CODPROVDESC', QuotedListaString(ListaIdRubrica,','), 1));
      end
      else
        Add(MontarJoinRubricas(ListaIdRubrica,2));
    end
    else
      Add('  (H.IDRUBRICA    = -1) AND');

    Add('  (H.MES         >= ' +QuotedStr(FAnoRef+'/01')+ ') AND');
    Add('  (H.MES         <= ' +QuotedStr(FAnoRef+'/12')+ ') AND');
    Add('  (H.IDRUBRICA    = PD.IDPROVENTO)');
    Add('GROUP BY');
    Add('  H.MES');
  end;
  Result := FSQL.Text;
end;

function TCtrlParamRAISMagnetico.PrepararDs_AdmDem: boolean;
var
  sListaIdMotivo: string;
begin
  try
    InserirCodigoEm(sListaIdMotivo, FListaIdMotivoAdmSel);
    InserirCodigoEm(sListaIdMotivo, FListaIdMotivoDemSel);
    InserirCodigoEm(sListaIdMotivo, FListaIdMotivoAfastSel);
    InserirCodigoEm(sListaIdMotivo, FListaIdMotivoRetorSel);

    with (FSQL) do
    begin
      Clear;
      // Admissões, Demissões e Afastamentos ocorridos até o ano-base
      Add('SELECT');
      Add('  H.IDMOTIVOOFIC AS IDMOTIVO, H.DATASITFUNC AS DATA,');
      Add('  TO_CHAR(H.DATASITFUNC,''YYYY'') AS ANO,');
      Add('  RTRIM(MO.MOTIVORAIS) AS MOTIVO');
      Add('FROM');
      Add('  HSTSITFUNC H, MOTIVO MO');
      Add('WHERE');
      Add('  (H.IDPESSOA     = :IDPESSOA) AND');
      Add(MontaLinhaSelSQL('  (H.IDMOTIVOOFIC', sListaIdMotivo, 3));
      Add('  (TO_CHAR(H.DATASITFUNC,''YYYY'') <= ' +QuotedStr(FAnoRef)+ ') AND');
      Add('  (H.IDMOTIVOOFIC = MO.IDMOTIVO)');
      Add('ORDER BY');
      Add('  DATA');
      //SaveToFile('c:\qryHist_AdmDem.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryHist_AdmDem.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
      end;
    FSQL_AdmDem := FSQL.Text;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.PrepararDs_EvolFunc: boolean;
begin
  try
    with (FSQL) do
    begin
      Clear;
      // Transferências ocorridas até o ano-base
      Add('SELECT');
      Add('  H.IDMOTIVO, H.IDEMPRESA, H.IDESTAB, H.SALARIO, H.DATAALTERFUNC AS DATA,');
      Add('  TO_CHAR(DECODE(H.TIPOPAGAMENTO,');
      Add('    ''H'',''5'',');
      Add('    ''D'',''4'',');
      Add('    ''M'',''1'',');
      Add('    ''T'',''6'',');
      Add('    ''''');
      Add('  )) AS TIPO_PAGAMENTO,');
      Add('  C.CBO2002 AS CBO,');
      Add('  TO_CHAR(H.DATAALTERFUNC,''YYYY'') AS ANO,');
      Add('  RTRIM(MO.MOTIVORAIS) AS MOTIVO');
      Add('FROM');
      Add('  EVOLFUNC H, MOTIVO MO, CARGO C');
      Add('WHERE');
      Add('  (H.IDPESSOA = :IDPESSOA) AND');
      Add('  (TO_CHAR(H.DATAALTERFUNC,''YYYY'') <= ' +QuotedStr(FAnoRef)+ ') AND');
      Add('  (H.IDMOTIVO = MO.IDMOTIVO) AND');
      Add('  (H.IDCARGO  = C.IDCARGO)');
      Add('ORDER BY');
      Add('  DATA, H.TRGDTINCLUSAO');
      //SaveToFile('c:\qryHist_EvolFunc.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryHist_EvolFunc.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;
    FSQL_EvolFunc := FSQL.Text;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.PrepararDs_Remuneracao: boolean;
begin
  try
    FSQL_RemNormal := MontarQueryValRubrica(FListaIdRubricaRemNormal);
    //FSQL.SaveToFile('c:\qryRemuneracao.txt');
    FSQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryRemuneracao.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.PrepararDs_1Parc13: boolean;
begin
  try
    FSQL_1Parc13 := MontarQueryValRubrica(FListaIdRubrica1Parc13);
    //FSQL.SaveToFile('c:\qry1Parc13.txt');
    FSQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry1Parc13.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.PrepararDs_2Parc13: boolean;
begin
  try
    FSQL_2Parc13 := MontarQueryValRubrica(FListaIdRubrica2Parc13);
    //FSQL.SaveToFile('c:\qry2Parc13.txt');
    FSQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry2Parc13.txt');
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.PrepararDs_PAT: boolean;
begin
  try
    FSQL_PAT := MontarQueryValRubrica(FListaIdRubricaPAT);
    //FSQL.SaveToFile('c:\qryPAT.txt');
    FSQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryPAT.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.PrepararDs_AvisoPrevio: boolean;
begin
  try
    FSQL_AvisoPrevio := MontarQueryValRubrica(FListaIdRubricaAvisoPrevio, true);
    //FSQL.SaveToFile('c:\qryAvisoPrevio.txt');
    FSQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\qryAvisoPrevio.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.PrepararDs_SalContratual: boolean;
begin
  try
    FSQL_SalContratual := MontarQueryValRubrica(FListaRubricaSalContratual);
    //FSQL.SaveToFile('c:\qrySalContratual.txt');
    FSQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qrySalContratual.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

{function TCtrlParamRAISMagnetico.PrepararDs_QuantHorasMensaisHor: boolean;
begin
  try
    FSQL_QuantHorasMensaisHor := MontarQueryValRubrica(FListaRubricaQuantHorasMensaisHor, true);
    FSQL.SaveToFile('c:\qryQuantHorasMensaisHor.txt');
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;}

function TCtrlParamRAISMagnetico.PrepararDs_QuantHorasExtras: boolean;
begin
  try
    FSQL_QuantHorasExtras := MontarQueryValRubrica(FListaRubricaQuantHorasExtras);
    //FSQL.SaveToFile('c:\qryQuantHorasExtras.txt');
    FSQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryQuantHorasExtras.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.PrepararDs_FeriasIndeniz: boolean;
begin
  try
    FSQL_FeriasIndeniz := MontarQueryValRubrica(FListaRubricaFeriasIndeniz, true);
    //FSQL.SaveToFile('c:\qryFeriasIndeniz.txt');
    FSQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryFeriasIndeniz.txt');
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.PrepararDs_BancoHoras: boolean;
begin
  try
    FSQL_BancoHoras := MontarQueryValRubrica(FListaRubricaBancoHoras, true);
    //FSQL.SaveToFile('c:\qryBancoHoras.txt');
    FSQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryBancoHoras.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.PrepararDs_Dissidio: boolean;
begin
  try
    FSQL_Dissidio := MontarQueryValRubrica(FListaRubricaDissidio, true);
    //FSQL.SaveToFile('c:\qryDissidio.txt');
    FSQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryDissidio.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.PrepararDs_Gratif: boolean;
begin
  try
    FSQL_Gratif := MontarQueryValRubrica(FListaRubricaGratif, true);
    //FSQL.SaveToFile('c:\qryGratif.txt');
    FSQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryGratif.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.PrepararDs_MultaResc: boolean;
begin
  try
    FSQL_MultaResc := MontarQueryValRubrica(FListaRubricaMultaResc, true);
    //FSQL.SaveToFile('c:\qryMultaResc.txt');
    FSQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryMultaResc.txt');
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

{function TCtrlParamRAISMagnetico.PrepararDs_Ferias: boolean;
begin
  try
    with (FSQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  INIGOZOFERIAS, FIMGOZOFERIAS');
      Add('FROM');
      Add('  FERIAS');
      Add('WHERE');
      Add('  (IDPESSOA = :IDPESSOA) AND');
      Add('  ((TO_CHAR(INIGOZOFERIAS,''YYYY'') = ' +QuotedStr(FAnoRef)+ ') OR');
      Add('   (TO_CHAR(FIMGOZOFERIAS,''YYYY'') = ' +QuotedStr(FAnoRef)+ '))');
      Add('ORDER BY');
      Add('  INIGOZOFERIAS');
      SaveToFile('c:\qryHist_Ferias.txt');
    end;
    FSQL_Ferias := FSQL.Text;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;}

function TCtrlParamRAISMagnetico.PrepararDs_UltSalContr: boolean;
begin
  try
    with (FSQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  C.CBO2002 AS CBO, EF.TIPOPAGAMENTO AS TIPO_PAGAMENTO, EF.SALARIO');
      Add('FROM');
      Add('  EVOLFUNC EF, CARGO C,');
      Add('  (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
      Add('   FROM   EVOLFUNC');
      Add('   WHERE  (IDPESSOA       = :IDPESSOA) AND');
      Add('          (DATAALTERFUNC <= TO_DATE(:DATA,''DD/MM/YYYY''))');
      Add('   GROUP BY IDPESSOA) HST2');
      Add('WHERE');
      Add('  (EF.IDPESSOA      = :IDPESSOA) AND');
      Add('  (EF.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
      Add('  (EF.IDPESSOA      = HST2.IDPESSOA) AND');
      Add('  (EF.IDCARGO       = C.IDCARGO)');
      //SaveToFile('c:\qryHist_UltSalContr.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryHist_UltSalContr.txt');
    end;
    FSQL_UltSalContr := FSQL.Text;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.ListGenerico(const IdPessoa: double; const SQL: string): OleVariant;
begin
  Result := GetDataPacket(
    StringReplace(SQL, ':IDPESSOA', FloatToStr(IdPessoa),
    [rfReplaceAll, rfIgnoreCase]));
end;

procedure TCtrlParamRAISMagnetico.List_AdmDem(const IdPessoa: double);
begin
  FCds_AdmDem.Data := ListGenerico(IdPessoa, FSQL_AdmDem);
end;

procedure TCtrlParamRAISMagnetico.List_EvolFunc(const IdPessoa: double);
begin
  FCds_EvolFunc.Data := ListGenerico(IdPessoa, FSQL_EvolFunc);
end;

procedure TCtrlParamRAISMagnetico.List_Remuneracao(const IdPessoa: double);
begin
  FCds_Remuneracao.Data := ListGenerico(IdPessoa, FSQL_RemNormal);
end;

procedure TCtrlParamRAISMagnetico.List_1Parc13(const IdPessoa: double);
begin
  FCds_1Parc13.Data := ListGenerico(IdPessoa, FSQL_1Parc13);
end;

procedure TCtrlParamRAISMagnetico.List_2Parc13(const IdPessoa: double);
begin
  FCds_2Parc13.Data := ListGenerico(IdPessoa, FSQL_2Parc13);
end;

procedure TCtrlParamRAISMagnetico.List_PAT(const IdPessoa: double);
begin
  FCds_PAT.Data := ListGenerico(IdPessoa, FSQL_PAT);
end;

procedure TCtrlParamRAISMagnetico.List_AvisoPrevio(const IdPessoa: double);
begin
  FCds_AvisoPrevio.Data := ListGenerico(IdPessoa, FSQL_AvisoPrevio);
end;

procedure TCtrlParamRAISMagnetico.List_SalContratual(const IdPessoa: double);
begin
  FCds_SalContratual.Data := ListGenerico(IdPessoa, FSQL_SalContratual);
end;

{procedure TCtrlParamRAISMagnetico.List_QuantHorasMensaisHor(const IdPessoa: double);
begin
  FCds_QuantHorasMensaisHor.Data := ListGenerico(IdPessoa, FSQL_QuantHorasMensaisHor);
end;}

procedure TCtrlParamRAISMagnetico.List_QuantHorasExtras(const IdPessoa: double);
begin
  FCds_QuantHorasExtras.Data := ListGenerico(IdPessoa, FSQL_QuantHorasExtras);
end;

procedure TCtrlParamRAISMagnetico.List_FeriasIndeniz(const IdPessoa: double);
begin
  FCds_FeriasIndeniz.Data := ListGenerico(IdPessoa, FSQL_FeriasIndeniz);
end;

procedure TCtrlParamRAISMagnetico.List_BancoHoras(const IdPessoa: double);
begin
  FCds_BancoHoras.Data := ListGenerico(IdPessoa, FSQL_BancoHoras);
end;

procedure TCtrlParamRAISMagnetico.List_Dissidio(const IdPessoa: double);
begin
  FCds_Dissidio.Data := ListGenerico(IdPessoa, FSQL_Dissidio);
end;

procedure TCtrlParamRAISMagnetico.List_Gratif(const IdPessoa: double);
begin
  FCds_Gratif.Data := ListGenerico(IdPessoa, FSQL_Gratif);
end;

procedure TCtrlParamRAISMagnetico.List_MultaResc(const IdPessoa: double);
begin
  FCds_MultaResc.Data := ListGenerico(IdPessoa, FSQL_MultaResc);
end;

{procedure TCtrlParamRAISMagnetico.List_Ferias(const IdPessoa: double);
begin
  FCds_Ferias.Data := ListGenerico(IdPessoa, FSQL_Ferias);
end;}

procedure TCtrlParamRAISMagnetico.List_UltSalContr(const IdPessoa: double; DataLimite: TDate);
var
  sSQL: string;
begin
  DataLimite := StrToDate(IncData(DateToStr(DataLimite),-1,0,0));
  // Substituir IDPESSOA
  sSQL :=
    StringReplace(FSQL_UltSalContr, ':IDPESSOA', FloatToStr(IdPessoa),
    [rfReplaceAll, rfIgnoreCase]);
  // Substituir DATA
  sSQL :=
    StringReplace(sSQL, ':DATA', QuotedStr(DateToStr(DataLimite)),
    [rfReplaceAll, rfIgnoreCase]);

  FCds_UltSalContr.Data := GetDataPacket(sSQL);
end;

function TCtrlParamRAISMagnetico.AbrirQueryContrib: boolean;
var
  sListaIdRubricas: string;
begin
  try
    sListaIdRubricas := '';
    InserirCodigoEm(sListaIdRubricas, FListaIdRubContribAssoc);
    InserirCodigoEm(sListaIdRubricas, FListaIdRubContribSind);
    InserirCodigoEm(sListaIdRubricas, FListaIdRubContribAssis);
    InserirCodigoEm(sListaIdRubricas, FListaIdRubContribConf);

    with (FSQL) do
    begin
      Clear;
      if (sListaIdRubricas = '') then
      begin
        Add('SELECT');
        Add('  0 AS IDPESSOA,');
        Add('  0 AS IDESTAB,');
        Add('  LPAD(''1'',18,''1'') AS CNPJ,');
        Add('  LPAD(''1'',15,''1'') AS CODPROVDESC,');
        Add('  0.00 AS VALOR');
        Add('FROM');
        Add('  DUAL');
        Add('WHERE');
        Add('  (1 = 2)');
      end
      else
      begin
        Add('SELECT');
        Add('  PF.IDPESSOA,');
        Add('  F.IDESTAB,');
        Add('  DP.NUMDOCUMENTO AS CNPJ,');
        Add('  H.CODPROVDESC,');
        Add('  H.VALORPROVENTO AS VALOR');
        Add('FROM');
        Add('  HISTRUBSAL H, DOCPESSOA DP, PESSOAFISICA PF, FUNCIONARIO F, SINDICATO S');
        Add('WHERE');
        Add('  (DP.IDDOCUMENTO  = ' +IntToStr(FIdDocCNPJ)+ ') AND');
        Add('  (PF.IDSINDICATO IS NOT NULL) AND');
        Add(MontaLinhaSelSQL('  (F.IDESTAB',FListaIdEstab,6));
        Add('  (F.IDPESSOA      = PF.IDPESSOA) AND');
        Add('  (PF.IDSINDICATO  = S.IDPESSOA) AND');
        Add('  (PF.IDSINDICATO  = DP.IDPESSOA) AND');
        Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(sListaIdRubricas,','),2));
        Add('  (F.IDPESSOA      = H.IDPESSOA) AND');
        Add('  (H.MES          >= ' +QuotedStr(FAnoRef+'/01')+ ') AND');
        Add('  (H.MES          <= ' +QuotedStr(FAnoRef+'/12')+ ')');
        Add('ORDER BY');
        Add('  PF.IDPESSOA, F.IDESTAB, H.CODPROVDESC');
      end;  
      //SaveToFile('c:\qryContribuicoes.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryContribuicoes.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;
    IncProgresso('', CMTranslate('Selecionando Contribuições...'));
    FCdsContrib.Data := GetDataPacket(FSQL);
    IncProgresso(GetTempoDecorrido);

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.AbrirQueryContribPatronal: boolean;
var
  sListaIdRubricas: string;
begin
  try
    sListaIdRubricas := '';
    InserirCodigoEm(sListaIdRubricas, FListaIdRubContribPatronalAssoc);
    InserirCodigoEm(sListaIdRubricas, FListaIdRubContribPatronalSind);
    InserirCodigoEm(sListaIdRubricas, FListaIdRubContribPatronalAssis);
    InserirCodigoEm(sListaIdRubricas, FListaIdRubContribPatronalConf);

    with (FSQL) do
    begin
      Clear;
      if (sListaIdRubricas = '') then
      begin
        Add('SELECT');
        Add('  0 AS IDESTAB,');
        Add('  LPAD(''1'',18,''1'') AS CNPJ,');
        Add('  LPAD(''1'',15,''1'') AS CODPROVDESC,');
        Add('  0.00 AS VALOR');
        Add('FROM');
        Add('  DUAL');
        Add('WHERE');
        Add('  (1 = 2)');
      end
      else
      begin
        Add('SELECT');
        Add('  F.IDESTAB,');
        Add('  DP.NUMDOCUMENTO AS CNPJ,');
        Add('  H.CODPROVDESC,');
        Add('  SUM(H.VALORPROVENTO) AS VALOR');
        Add('FROM');
        Add('  HISTRUBSAL H, DOCPESSOA DP, PESSOAFISICA PF, FUNCIONARIO F, SINDICATO S');
        Add('WHERE');
        Add('  (DP.IDDOCUMENTO  = ' +IntToStr(FIdDocCNPJ)+ ') AND');
        Add('  (PF.IDSINDICATO IS NOT NULL) AND');
        Add(MontaLinhaSelSQL('  (F.IDESTAB',FListaIdEstab,6));
        Add('  (F.IDPESSOA      = PF.IDPESSOA) AND');
        Add('  (PF.IDSINDICATO  = S.IDPESSOA) AND');
        Add('  (PF.IDSINDICATO  = DP.IDPESSOA) AND');
        Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(sListaIdRubricas,','),2));
        Add('  (F.IDPESSOA      = H.IDPESSOA) AND');
        Add('  (H.MES          >= ' +QuotedStr(FAnoRef+'/01')+ ') AND');
        Add('  (H.MES          <= ' +QuotedStr(FAnoRef+'/12')+ ')');
        Add('GROUP BY');
        Add('  F.IDESTAB, DP.NUMDOCUMENTO, H.CODPROVDESC');
      end;  
      //SaveToFile('c:\qryContribPatronal.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryContribPatronal.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;
    IncProgresso('', CMTranslate('Selecionando Contribuição Patronal...'));
    FCdsContribPatronal.Data := GetDataPacket(FSQL);
    IncProgresso(GetTempoDecorrido);

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamRAISMagnetico.HistSitFunc_Admissao: boolean;
begin
  Result :=
    (VerificaCodigoEm(FListaIdMotivoAdmSel,
     FCds_AdmDem.FieldByName('IDMOTIVO').asString, ',') = 1);
end;

function TCtrlParamRAISMagnetico.HistSitFunc_Demissao: boolean;
begin
  Result :=
    (VerificaCodigoEm(FListaIdMotivoDemSel,
     FCds_AdmDem.FieldByName('IDMOTIVO').asString, ',') = 1);
end;

function TCtrlParamRAISMagnetico.HistSitFunc_IniAfast: boolean;
begin
  Result :=
    (VerificaCodigoEm(FListaIdMotivoAfastSel,
     FCds_AdmDem.FieldByName('IDMOTIVO').asString, ',') = 1);
end;

function TCtrlParamRAISMagnetico.HistSitFunc_FimAfast: boolean;
begin
  Result :=
    (VerificaCodigoEm(FListaIdMotivoRetorSel,
     FCds_AdmDem.FieldByName('IDMOTIVO').asString, ',') = 1);
end;

function TCtrlParamRAISMagnetico.HistAltFunc_Admissao: boolean;
begin
  Result :=
    (VerificaCodigoEm(FListaIdMotivoAdmSel,
     FCds_EvolFunc.FieldByName('IDMOTIVO').asString, ',') = 1);
end;

function TCtrlParamRAISMagnetico.HistAltFunc_Transferencia: boolean;
begin
  Result :=
    (VerificaCodigoEm('30,31',
     FCds_EvolFunc.FieldByName('MOTIVO').asString, ',') = 1);
end;

procedure TCtrlParamRAISMagnetico.ExcluirAfastPessoa(const IdPessoa: double);
begin
  FCds_AdmDem.EmptyDataSet;

  FCdsAfastPessoa.Filter := 'IDPESSOA = ' + FloatToStr(IdPessoa);
  FCdsAfastPessoa.Filtered := true;
  FCdsAfastPessoa.First;
  while not(FCdsAfastPessoa.EOF) do
    FCdsAfastPessoa.Delete;
  FCdsAfastPessoa.Filtered := false;
end;

function TCtrlParamRAISMagnetico.PessoaDemitidaNoPeriodo: boolean;
begin
  Result := (FCdsPessoa.FieldByName('TIPO_DEMISSAO').asString <> '30') and
            (FCdsPessoa.FieldByName('TIPO_DEMISSAO').asString <> '31') and
            (FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime > 0);
end;

procedure TCtrlParamRAISMagnetico.Identificar_Afastamentos;
var
  bAchou, bDataFimOriginal: boolean;
  sMotivo: string;
  sAnoIniOrig, sAnoFinOrig: string;
  dtDataIni, dtDataFim: TDate;

{->}procedure MontarAviso_SemRetorno;
    begin
      //Inc(FNumInconsist);
      IncListaMensagens(
        FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger,
        FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat, tpInconsist,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_RETORNO,
          [CR_LF, CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));
{      IncProgresso('', '', 0, false,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_RETORNO,
          [CR_LF, CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));}
{->}end;

{->}procedure MontarAviso_SemAfast;
    begin
      //Inc(FNumInconsist);
      IncListaMensagens(
        FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger,
        FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat, tpInconsist,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_AFASTAMENTO,
          [CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));
{      IncProgresso('', '', 0, false,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_AFASTAMENTO,
          [CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));}
{->}end;

begin
  dtDataFim := 0;
  FQuantDiasAfast := 0;
  while not(FCds_AdmDem.EOF) do
  begin
    // Caso o primeiro registro seja retorno,
    // quer dizer que há uma inconsistência no histórico.
    // Esta pessoa não deve ser gerada.
    if (HistSitFunc_FimAfast) then
    begin
      MontarAviso_SemAfast;
      ExcluirAfastPessoa(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);
      exit;
    end;

    // Procurar o início do afastamento
    bAchou := false;
    while not(FCds_AdmDem.EOF) do
    begin
      if (HistSitFunc_IniAfast) then
      begin
        bAchou := true;
        break;
      end;
      FCds_AdmDem.Next;
    end;

    if (bAchou) then
    begin
      bDataFimOriginal := true;
      sMotivo := FCds_AdmDem.FieldByName('MOTIVO').asString;

      // Obter o início do afastamento.
      // Caso esteja no ano-base anterior, usar o primeiro dia do ano-base atual
      if (FCds_AdmDem.FieldByName('ANO').asString < FAnoRef) then
        dtDataIni := StrToDate('01/01/'+ FAnoRef)
      else
        dtDataIni := FCds_AdmDem.FieldByName('DATA').asDateTime;

      sAnoIniOrig := FCds_AdmDem.FieldByName('ANO').asString;

      // Obter o retorno do afastamento
      FCds_AdmDem.Next;

      // Caso já esteja no último registro e este não seja o de retorno, quer dizer
      // que o retorno deve estar no próximo ano-base e por isso, deve-se usar o
      // último dia do ano-base atual.
      sAnoFinOrig := '';
      if (FCds_AdmDem.EOF) and not(HistSitFunc_FimAfast) then
      begin
        dtDataFim := StrToDate('31/12/'+ FAnoRef);
        bDataFimOriginal := false;

        if (dtDataIni = StrToDate('01/01/'+ FAnoRef)) then
          sAnoFinOrig := FAnoRef;
      end
      else
      // Obter a data de retorno do afastamento do histórico atual caso este registro
      // esteja imediatamente depois do registro do início do afastamento.
      if (HistSitFunc_FimAfast) then
      begin
        dtDataFim := FCds_AdmDem.FieldByName('DATA').asDateTime;
        sAnoFinOrig := FCds_AdmDem.FieldByName('ANO').asString;
        // Voltar ao registro anterior e excluir o registro do início do afastamento
        FCds_AdmDem.Prior;
        FCds_AdmDem.Delete;
      end
      else
      // Caso o registro depois do início do afastamento não seja um registro de retorno,
      // quer dizer que há uma inconsistência no histórico.
      // Esta pessoa não deve ser gerada.
      begin
        MontarAviso_SemRetorno;
        ExcluirAfastPessoa(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);
        exit;
      end;

      // Excluir o registro de afastamento restante. Há duas possibilidades:
      // 1) Caso tenha sido encontrado somente um início de afastamento, o registro que
      //    será apagado corresponderá a este registro;
      // 2) Caso o início e o final do afastamento tenham sido encontrados, o registro que
      //    será apagado corresponderá ao registro do final do afastamento.
      FCds_AdmDem.Delete;

      // Caso o histórico atual seja do ano-base anterior, descartá-lo
      if (sAnoIniOrig < FAnoRef) and (sAnoFinOrig < FAnoRef) then
        continue;

      // Gravação dos dados do afastamento
      FCdsAfastPessoa.Append;
      FCdsAfastPessoa.FieldByName('IDPESSOA').asFloat := FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat;
      FCdsAfastPessoa.FieldByName('CODIGO').asString := sMotivo;
      FCdsAfastPessoa.FieldByName('DATA_FINAL_ORIGINAL').asInteger := IFF(bDataFimOriginal, 1, 0);
      FCdsAfastPessoa.FieldByName('DATA_INICIAL').asDateTime := dtDataIni;
      
      // Caso a Data Final do Afastamento estiver no próximo ano, não subtrair um ao dia
      if (FCdsAfastPessoa.FieldByName('DATA_FINAL_ORIGINAL').asInteger = 0) then
        FCdsAfastPessoa.FieldByName('DATA_FINAL').asDateTime := dtDataFim
      else
        FCdsAfastPessoa.FieldByName('DATA_FINAL').asDateTime := dtDataFim - 1;

      FCdsAfastPessoa.Post;

      FQuantDiasAfast := FQuantDiasAfast + Round(dtDataFim - dtDataIni);
    end
    else
    begin
      // Caso exista somente registro(s) de retorno,
      // quer dizer que há uma inconsistência no histórico.
      // Esta pessoa não deve ser gerada.
      FCds_AdmDem.First;
      while not(FCds_AdmDem.EOF) do
      begin
        if (HistSitFunc_FimAfast) then
        begin
          MontarAviso_SemAfast;
          ExcluirAfastPessoa(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);
          exit;
        end;
        FCds_AdmDem.Next;
      end;
    end;
  end;
end;

procedure TCtrlParamRAISMagnetico.Identificar_AdmDem;
var
  c, iNumLoop: byte;
  bGravarPessoa: boolean;
  dtAdmissao, dtDemissao: TDate;
  sTipoAdmissao, sTipoDemissao: string;

{->}procedure SetDados(const Campo, Tipo: string; const Data: TDate);
    begin
      if (Data = 0) then
      begin
        FCdsPessoa.FieldByName('TIPO_' + Campo).Clear;
        FCdsPessoa.FieldByName('DATA_' + Campo).Clear;
      end
      else
      begin
        FCdsPessoa.FieldByName('TIPO_' + Campo).asString := Tipo;
        FCdsPessoa.FieldByName('DATA_' + Campo).asDateTime := Data;
      end;
{->}end;

{->}procedure ExcluirDadosPessoaAtual;
    begin
      FCdsPessoa.Filtered := true;
      FCdsPessoa.Filter := 'IDPESSOA = ' + FCdsLoopPessoa.FieldByName('IDPESSOA').asString;
      FCdsPessoa.First;
      while not(FCdsPessoa.EOF) do
        FCdsPessoa.Delete;
      FCdsPessoa.Filtered := false;
{->}end;

{->}procedure MontarAviso_SemSitFunc;
    begin
      //Inc(FNumInconsist);
      bGravarPessoa := false;
      IncListaMensagens(
        FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger,
        FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat, tpInconsist,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_SITFUNC,
          [CR_LF, CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));
{      IncProgresso('', '', 0, false,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_SITFUNC,
          [CR_LF, CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));}
{->}end;

{->}procedure MontarAviso_SemAdmInicial;
    begin
      //Inc(FNumInconsist);
      bGravarPessoa := false;
      IncListaMensagens(
        FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger,
        FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat, tpInconsist,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_ADMISSAO_INICIAL_SITFUNC,
          [CR_LF, CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));
{      IncProgresso('', '', 0, false,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_ADMISSAO_INICIAL_SITFUNC,
          [CR_LF, CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));}
{->}end;

{->}procedure MontarAviso_DemSemAdm;
    begin
      //Inc(FNumInconsist);
      bGravarPessoa := false;
      IncListaMensagens(
        FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger,
        FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat, tpInconsist,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_ADMISSAO,
          [CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));
{      IncProgresso('', '', 0, false,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_ADMISSAO,
          [CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));}
{->}end;

{->}procedure MontarAviso_AdmPosteriorDem;
    begin
      //Inc(FNumInconsist);
      bGravarPessoa := false;
      IncListaMensagens(
        FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger,
        FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat, tpInconsist,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_DEMISSAO,
          [CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));
{      IncProgresso('', '', 0, false,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_DEMISSAO,
          [CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));}
{->}end;

{->}procedure MontarAviso_AdmDemAnoAnterior;
    begin
      //Inc(FNumInconsist);
      bGravarPessoa := false;
      IncListaMensagens(
        FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger,
        FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat, tpInconsist,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_DEM_ANO_ANTERIOR,
          [CR_LF, CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));
{      IncProgresso('', '', 0, false,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_DEM_ANO_ANTERIOR,
          [CR_LF, CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));}
{->}end;

{->}procedure MontarAvisosInconsistDatas;
    begin
      if not(FCds_AdmDem.EOF) then
        exit;

      if (dtAdmissao <> FCdsLoopPessoa.FieldByName('DATA_ADMISSAO').asDateTime) and
         (dtDemissao > 0) and
         (dtDemissao <> FCdsLoopPessoa.FieldByName('DATA_DEMISSAO').asDateTime) then
      begin
        //Inc(FNumAvisos);
        IncListaMensagens(
          FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger,
          FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat, tpAviso,
          Replicate('-',40) +CR_LF+
          CMTranslateMsg(MSG_PESSOA_ADM_DEM_INCONSIST,
            [CR_LF, CR_LF, CR_LF, DateToStr(dtAdmissao),
             FCdsLoopPessoa.FieldByName('DATA_ADMISSAO').asString, CR_LF,
             DateToStr(dtDemissao),
             FCdsLoopPessoa.FieldByName('DATA_DEMISSAO').asString, CR_LF, CR_LF,
             FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));
{        IncProgresso('', '', 0, false,
          Replicate('-',40) +CR_LF+
          CMTranslateMsg(MSG_PESSOA_ADM_DEM_INCONSIST,
            [CR_LF, CR_LF, CR_LF, DateToStr(dtAdmissao),
             FCdsLoopPessoa.FieldByName('DATA_ADMISSAO').asString, CR_LF,
             DateToStr(dtDemissao),
             FCdsLoopPessoa.FieldByName('DATA_DEMISSAO').asString, CR_LF, CR_LF,
             FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));}
      end
      else
      begin
        if (dtAdmissao <> FCdsLoopPessoa.FieldByName('DATA_ADMISSAO').asDateTime) then
        begin
          //Inc(FNumAvisos);
          IncListaMensagens(
            FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger,
            FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat, tpAviso,
            Replicate('-',40) +CR_LF+
            CMTranslateMsg(MSG_PESSOA_ADMISSAO_INCONSIST,
              [CR_LF, CR_LF, CR_LF, DateToStr(dtAdmissao),
               FCdsLoopPessoa.FieldByName('DATA_ADMISSAO').asString, CR_LF, CR_LF,
               FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));
{          IncProgresso('', '', 0, false,
            Replicate('-',40) +CR_LF+
            CMTranslateMsg(MSG_PESSOA_ADMISSAO_INCONSIST,
              [CR_LF, CR_LF, CR_LF, DateToStr(dtAdmissao),
               FCdsLoopPessoa.FieldByName('DATA_ADMISSAO').asString, CR_LF, CR_LF,
               FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));}
        end;

        if (dtDemissao > 0) and
           (dtDemissao <> FCdsLoopPessoa.FieldByName('DATA_DEMISSAO').asDateTime) then
        begin
          //Inc(FNumAvisos);
          IncListaMensagens(
            FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger,
            FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat, tpAviso,
            Replicate('-',40) +CR_LF+
            CMTranslateMsg(MSG_PESSOA_DEMISSAO_INCONSIST,
              [CR_LF, CR_LF, CR_LF, DateToStr(dtDemissao),
               FCdsLoopPessoa.FieldByName('DATA_DEMISSAO').asString, CR_LF, CR_LF,
               FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));
{          IncProgresso('', '', 0, false,
            Replicate('-',40) +CR_LF+
            CMTranslateMsg(MSG_PESSOA_DEMISSAO_INCONSIST,
              [CR_LF, CR_LF, CR_LF, DateToStr(dtDemissao),
               FCdsLoopPessoa.FieldByName('DATA_DEMISSAO').asString, CR_LF, CR_LF,
               FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));}
        end;
      end;
{->}end;

begin
  List_AdmDem(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);

  FPularPessoa := false;
  if (FCds_AdmDem.IsEmpty) then
  begin
    MontarAviso_SemSitFunc;
    FPularPessoa := true;
    exit;
  end
  else
  begin
    // Caso o Histórico de Admissão não seja o primeiro, pular a pessoa
    FCds_AdmDem.First;
    if not(HistSitFunc_Admissao) then
    begin
      MontarAviso_SemAdmInicial;
      FPularPessoa := true;
      exit;
    end;

    Identificar_Afastamentos;
    FCds_AdmDem.First;
  end;

  while not(FCds_AdmDem.EOF) do
  begin
    sTipoAdmissao := '';
    sTipoDemissao := '';
    dtAdmissao := 0;
    dtDemissao := 0;
    // Calcular o número de passadas do Loop que pega a admissão e demissão
    if ((FCds_AdmDem.RecordCount - FCds_AdmDem.RecNo + 1) >= 2) then
      iNumLoop := 2
    else
      iNumLoop := 1;

    // Obter as datas de admissão e demissão (caso exista)
    for c:=1 to iNumLoop do
    begin
      // Histórico de Admissão
      if (HistSitFunc_Admissao) then
      begin
        if (dtAdmissao > 0) then // Indicar que existem duas Admissões consecutivas
        begin
          dtAdmissao := 0;
          break;
        end;
        sTipoAdmissao := FCds_AdmDem.FieldByName('MOTIVO').asString;
        dtAdmissao := FCds_AdmDem.FieldByName('DATA').asDateTime;
      end
      else
      // Histórico de Demissão
      if (HistSitFunc_Demissao) then
      begin
        sTipoDemissao := FCds_AdmDem.FieldByName('MOTIVO').asString;
        dtDemissao := FCds_AdmDem.FieldByName('DATA').asDateTime;
      end;

      FCds_AdmDem.Next;
    end;

    // Admissão e Demissão no ano anterior ao ano-base
    // Pode acontecer somente para os dois primeiros registros
    bGravarPessoa := true;
    if (IntToStr(ExtraiAno(dtAdmissao)) < FAnoRef) and (dtDemissao > 0) and
       (IntToStr(ExtraiAno(dtDemissao)) < FAnoRef) then
    begin
      if (dtAdmissao <= dtDemissao) then
      begin
        // Caso a pessoa possua somente estes registros de Admissão e Demissão no
        // ano-base anterior,  significa que há um problema entre o cadastro de
        // pessoal e o histórico.
        if (FCds_AdmDem.EOF) then
          MontarAviso_AdmDemAnoAnterior
        // Caso a admissão e a demissão estejam corretamente cadastradas no histórico
        // mas não estão no ano-base e há outras linhas no histórico, descartar estas
        // informações e passar para os outros registros. (pois para a RAIS só importa
        // as ocorrências de admissão e demissão que têm relação com o ano-base atual)
        else
          continue;
      end
      else
      // Possui uma Admissão posterior à Demissão.
      // Quer dizer que já trabalhou antes desta admissão.
      // Neste caso, utilizar a admissão encontrada e procurar a próxima demissão.
      if (dtAdmissao > dtDemissao) then
      begin
        // Caso seja o último registro, quer dizer que a pessoa foi admitida em um ano-base
        // anterior, não teve mais nenhuma Alteração da Situação e ainda está ativa.
        if (FCds_AdmDem.EOF) then
          dtDemissao := 0
        else
        // Verificar se o próximo Histórico é uma Demissão
        if (HistSitFunc_Demissao) then
        begin
          sTipoDemissao := FCds_AdmDem.FieldByName('MOTIVO').asString;
          dtDemissao := FCds_AdmDem.FieldByName('DATA').asDateTime;
        end
        // Se existir uma outra admissão, exibir aviso de inconsistência.
        else
          MontarAviso_AdmPosteriorDem;
      end;
    end
    else
    begin
      // Demissão sem Admissão
      if (dtDemissao > 0) and (dtAdmissao = 0) then
        MontarAviso_DemSemAdm
      else
      // Admissão posterior à Demissão
      if ((dtAdmissao > dtDemissao) and (dtDemissao > 0)) or
      // Duas Admissões consecutivas
         (dtAdmissao = 0) then
        MontarAviso_AdmPosteriorDem;
    end;

    if not(bGravarPessoa) then
    begin
      ExcluirAfastPessoa(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);
      ExcluirDadosPessoaAtual;
      FPularPessoa := true;
      exit;
    end
    else
    begin
      MontarAvisosInconsistDatas;

      // Inserir o registro
      FCdsPessoa.Append;
      for c:=0 to FCdsPessoa.FieldCount-1 do
        FCdsPessoa.Fields[c].Value := FCdsLoopPessoa.Fields[c].Value;

      SetDados('ADMISSAO', sTipoAdmissao, dtAdmissao);
      SetDados('DEMISSAO', sTipoDemissao, dtDemissao);
      FCdsPessoa.FieldByName('QUANT_DIAS_AFAST').asInteger := FQuantDiasAfast;
      FCdsPessoa.Post;
    end;
  end;
end;

procedure TCtrlParamRAISMagnetico.Identificar_EvolFunc;
var
  c, iNumReg: integer;
  sMotivo: string;
  Admissao, Demissao: TDate;

{->}procedure Filtrar_EvolFunc;
    begin
      if (FCdsPessoa.FieldByName('TIPO_ADMISSAO').asString = '3') or
         (FCdsPessoa.FieldByName('TIPO_ADMISSAO').asString = '4') then
        Admissao := StrToDate(IncData(FCdsPessoa.FieldByName('DATA_ADMISSAO').asString,1,0,0))
      else
        Admissao := StrToDate(FCdsPessoa.FieldByName('DATA_ADMISSAO').asString);

      if (FCdsPessoa.FieldByName('DATA_DEMISSAO').IsNull) or
         (FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime = 0) then
        Demissao := StrToDate('31/12/' +FAnoRef)
      else
        Demissao := FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime;

      FCds_EvolFunc.Filter :=
        '(DATA >= ' +QuotedStr(DateToStr(Admissao))+ ') AND '+
        '(DATA <= ' +QuotedStr(DateToStr(Demissao))+ ')';
      FCds_EvolFunc.Filtered := true;
{->}end;

{->}procedure MontarAviso_SemAdmInicial_EvolFunc;
    begin
      //Inc(FNumInconsist);
      IncListaMensagens(
        FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger,
        FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat, tpInconsist,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_ADMISSAO_INICIAL_EVOLFUNC,
          [CR_LF, CR_LF, DateToStr(Admissao), DateToStr(Demissao), CR_LF, CR_LF, CR_LF,
           FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));
{      IncProgresso('', '', 0, false,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_ADMISSAO_INICIAL_EVOLFUNC,
          [CR_LF, CR_LF, DateToStr(Admissao), DateToStr(Demissao), CR_LF, CR_LF, CR_LF,
           FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));}
{->}end;

{->}procedure MontarAviso_EvolFunc;
    begin
      //Inc(FNumInconsist);
      IncListaMensagens(
        FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger,
        FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat, tpInconsist,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_EVOLFUNC,
          [CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));
{      IncProgresso('', '', 0, false,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_EVOLFUNC,
          [CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));}
{->}end;

{->}procedure MontarAviso_SemEstab;
    begin
      //Inc(FNumInconsist);
      IncListaMensagens(
        FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger,
        FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat, tpInconsist,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_EVOLFUNC_INCOMPLETA,
          [CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));
{      IncProgresso('', '', 0, false,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_EVOLFUNC_INCOMPLETA,
          [CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));}
{->}end;

begin
  FCds_EvolFunc.Filtered := false;
  List_EvolFunc(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);
  if (FCds_EvolFunc.IsEmpty) then
  begin
    if (FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger = FIdEmpresa) then
      MontarAviso_EvolFunc;
    FPularPessoa := true;
    exit;
  end;

  // Loop para analisar cada período de admissão - demissão
  FCdsPessoa.First;
  while not(FCdsPessoa.EOF) do
  begin
    // Filtrar pelas alterações funcionais dentro do período de admissão - demissão
    Filtrar_EvolFunc;
    FCds_EvolFunc.First;

    // Caso o Histórico de Admissão não seja o primeiro, pular a pessoa
    if not(HistAltFunc_Admissao) then
    begin
      MontarAviso_SemAdmInicial_EvolFunc;
      FPularPessoa := true;
      break;
    end;

    // Preencher os dados da admissão atual (sempre o primeiro registro)
    FCdsPessoa.Edit;
    FCdsPessoa.FieldByName('IDEMPRESA').asString := FCds_EvolFunc.FieldByName('IDEMPRESA').asString;
    FCdsPessoa.FieldByName('IDESTAB').asString := FCds_EvolFunc.FieldByName('IDESTAB').asString;
    //FCdsPessoa.FieldByName('VAL_SAL_CONTRATUAL').asFloat := FCds_EvolFunc.FieldByName('SALARIO').asFloat;
    FCdsPessoa.FieldByName('TIPO_PAGAMENTO').asString := FCds_EvolFunc.FieldByName('TIPO_PAGAMENTO').asString;
    FCdsPessoa.FieldByName('CBO').asString := FCds_EvolFunc.FieldByName('CBO').asString;
    FCdsPessoa.FieldByName('TIPO_ADMISSAO').asString := FCds_EvolFunc.FieldByName('MOTIVO').asString;
    FCdsPessoa.FieldByName('DATA_ADMISSAO').asDateTime := FCds_EvolFunc.FieldByName('DATA').asDateTime;
    FCdsPessoa.Post;

    // Pular o primeiro registro pois é referente à admissão
    FCds_EvolFunc.Next;

    while not(FCds_EvolFunc.EOF) do
    begin
      // Caso o registro for uma transferência
      if (HistAltFunc_Transferencia) then
      begin
        iNumReg := FCdsPessoa.RecNo;

        sMotivo := FCdsPessoa.FieldByName('TIPO_DEMISSAO').asString;
        Demissao := FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime;

        // Alterar o registro de onde se originou a transferência
        FCdsPessoa.Edit;
        FCdsPessoa.FieldByName('TIPO_DEMISSAO').asString := FCds_EvolFunc.FieldByName('MOTIVO').asString;
        FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime := FCds_EvolFunc.FieldByName('DATA').asDateTime;
        FCdsPessoa.Post;

        // Incluir o registro de destino da transferência
        FCdsPessoa.Insert;
        for c:=0 to FCdsPessoa.FieldCount-1 do
          FCdsPessoa.Fields[c].Value := FCdsLoopPessoa.Fields[c].Value;

        FCdsPessoa.FieldByName('IDEMPRESA').asString := FCds_EvolFunc.FieldByName('IDEMPRESA').asString;
        FCdsPessoa.FieldByName('IDESTAB').asString := FCds_EvolFunc.FieldByName('IDESTAB').asString;
        //FCdsPessoa.FieldByName('VAL_SAL_CONTRATUAL').asFloat := FCds_EvolFunc.FieldByName('SALARIO').asFloat;
        FCdsPessoa.FieldByName('TIPO_PAGAMENTO').asString := FCds_EvolFunc.FieldByName('TIPO_PAGAMENTO').asString;
        FCdsPessoa.FieldByName('CBO').asString := FCds_EvolFunc.FieldByName('CBO').asString;

        if (FCds_EvolFunc.FieldByName('MOTIVO').asString = '31') then
          FCdsPessoa.FieldByName('TIPO_ADMISSAO').asString := '3'
        else
          FCdsPessoa.FieldByName('TIPO_ADMISSAO').asString := '4';

        FCdsPessoa.FieldByName('DATA_ADMISSAO').asDateTime := FCds_EvolFunc.FieldByName('DATA').asDateTime;
        FCdsPessoa.FieldByName('TIPO_DEMISSAO').asString := sMotivo;
        FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime := Demissao;
        FCdsPessoa.Post;
        FCdsPessoa.RecNo := iNumReg+1;
      end;

      FCds_EvolFunc.Next;
    end;
    FCdsPessoa.Next;
  end;

  // Excluir os períodos que estão fora do ano-base atual
  FCdsPessoa.First;
  while not(FCdsPessoa.EOF) do
  begin
    if (FCdsPessoa.FieldByName('IDEMPRESA').asInteger <> FIdEmpresa) then
      FCdsPessoa.Delete
    else
    if (FCdsPessoa.FieldByName('IDESTAB').asFloat = 0) then
    begin
      MontarAviso_SemEstab;
      while not(FCdsPessoa.EOF) do
        FCdsPessoa.Delete;
    end
    else
    if ((ExtraiAno(FCdsPessoa.FieldByName('DATA_ADMISSAO').asDateTime) < StrToInt(FAnoRef)) and
        (FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime > 0) and
        (ExtraiAno(FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime) < StrToInt(FAnoRef))) or
       ((ExtraiAno(FCdsPessoa.FieldByName('DATA_ADMISSAO').asDateTime) > StrToInt(FAnoRef)) and
        (FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime > 0) and
        (ExtraiAno(FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime) > StrToInt(FAnoRef))) or
       (VerificaCodigoEm(FListaIdEstab, FCdsPessoa.FieldByName('IDESTAB').asString, ',') <> 1) then
      FCdsPessoa.Delete
    else
      FCdsPessoa.Next;
  end;

  if (FCdsPessoa.IsEmpty) then
    FPularPessoa := true;
end;

procedure TCtrlParamRAISMagnetico.Identificar_HorasExtras;
var
  c, iMesIni, iMesFin: byte;
begin
  FCds_QuantHorasExtras.Filtered := false;
  List_QuantHorasExtras(FCdsPessoa.FieldByName('IDPESSOA').asFloat);

  if not(FCds_QuantHorasExtras.IsEmpty) then
  begin
    FCdsPessoa.First;
    while not(FCdsPessoa.EOF) do
    begin
      iMesIni := ExtraiMes(GetDataAdmLimite(FCdsPessoa.FieldByName('DATA_ADMISSAO').asDateTime));
      iMesFin := ExtraiMes(GetDataDemLimite(FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime));

      FCdsPessoa.Edit;

      for c:=iMesIni to iMesFin do
        if (FCds_QuantHorasExtras.Locate('MES', FAnoRef+'/'+PoeZero(c), [])) then
          FCdsPessoa.FieldByName('HRS_EXTRA_MES_' +PoeZero(c)).asInteger :=
            Round(FCds_QuantHorasExtras.FieldByName('VALOR').asFloat);

      FCdsPessoa.Post;
      FCdsPessoa.Next;
    end;
  end;
end;

(*procedure TCtrlParamRAISMagnetico.Identificar_HoraTrab;
var
  bUsaRubHorista: boolean;
  iMesIni, iMesFin: byte;
  dtDataAdm, dtDataDem: TDate;

{->}function GetMunDiasTrabFerias(const Mes: integer; const DataInicial, DataFinal: TDate): integer;
    var
      iDiaIni, iDiaFin: byte;
    begin
      if (ExtraiMes(DataInicial) = Mes) then
        iDiaIni := ExtraiDia(DataInicial)
      else
        iDiaIni := 1;

      if (ExtraiMes(DataFinal) = Mes) then
        iDiaFin := ExtraiDia(DataFinal)
      else
        iDiaFin := 30;

      Result := 30 - (iDiaFin - iDiaIni + 1);
{->}end;

{->}procedure GravarHoraTrabPeriodoFerias;
    var
      c, iNumDias, iHorasTrab: byte;
    begin
      FCds_Ferias.Filtered := false;
      FCds_Ferias.Filter :=
        '(INIGOZOFERIAS >= ' + QuotedStr(FCdsPessoa.FieldByName('DATA_ADMISSAO').asString) +') AND '+
        '(FIMGOZOFERIAS <= ' + QuotedStr(DateToStr(GetDataDemLimite(FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime))) +')';
      FCds_Ferias.Filtered := true;
      while not(FCds_Ferias.EOF) do
      begin
        if (FAnoRef <>
            IntToStr(ExtraiAno(FCds_Ferias.FieldByName('INIGOZOFERIAS').asDateTime))) then
          iMesIni := 1
        else
          iMesIni := ExtraiMes(FCds_Ferias.FieldByName('INIGOZOFERIAS').asDateTime);

        if (FAnoRef <>
            IntToStr(ExtraiAno(FCds_Ferias.FieldByName('FIMGOZOFERIAS').asDateTime))) then
          iMesFin := 12
        else
          iMesFin := ExtraiMes(FCds_Ferias.FieldByName('FIMGOZOFERIAS').asDateTime);

        for c:=iMesIni to iMesFin do
        begin
          iNumDias := FCtrlDiasTrab.Calcular(
            FCdsPessoa.FieldByName('IDPESSOA').asFloat,
            false, false, false, true, true, false,
            StrToDate('01/'+PoeZero(c)+'/'+FAnoRef),
            StrToDate(PoeZero(TrazUltDiaMes(c, StrToInt(FAnoRef)))+'/'+PoeZero(c)+'/'+FAnoRef),
            FCds_Ferias.FieldByName('INIGOZOFERIAS').asDateTime,
            FCds_Ferias.FieldByName('FIMGOZOFERIAS').asDateTime);

          if (iNumDias > 0) then
          begin
            iNumDias := GetMunDiasTrabFerias(c,
              FCds_Ferias.FieldByName('INIGOZOFERIAS').asDateTime,
              FCds_Ferias.FieldByName('FIMGOZOFERIAS').asDateTime);

            iHorasTrab := Round(iNumDias * FCdsPessoa.FieldByName('HRS_TRAB_MES').asFloat / 30);
          end
          else
            iHorasTrab := 0;

          if (iHorasTrab <= 0) then
            FCdsPessoa.FieldByName('HRS_TRAB_MES_' +PoeZero(c)).asInteger := 999
          else
            FCdsPessoa.FieldByName('HRS_TRAB_MES_' +PoeZero(c)).asInteger := iHorasTrab;
        end;
        FCds_Ferias.Next;
      end;
{->}end;

{->}procedure GravarHoraTrabPeriodoAtual;
    var
      c: byte;
    begin
      if (bUsaRubHorista) then
      begin
        FCds_QuantHorasMensaisHor.Filter :=
          '(MES >= ' +QuotedStr(FAnoRef+'/'+PoeZero(iMesIni))+ ') AND '+
          '(MES <= ' +QuotedStr(FAnoRef+'/'+PoeZero(iMesFin))+ ')';
        FCds_QuantHorasMensaisHor.Filtered := true;

        for c:=iMesIni to iMesFin do
          if (FCds_QuantHorasMensaisHor.Locate('MES', FAnoRef+'/'+PoeZero(c), [])) then
            FCdsPessoa.FieldByName('HRS_TRAB_MES_' +PoeZero(c)).asInteger :=
              Round(FCds_QuantHorasMensaisHor.FieldByName('VALOR').asFloat)
          else
            FCdsPessoa.FieldByName('HRS_TRAB_MES_' +PoeZero(c)).asInteger :=
              Round(FCdsPessoa.FieldByName('HRS_TRAB_MES').asFloat);
      end
      else
      begin
        for c:=iMesIni to iMesFin do
          FCdsPessoa.FieldByName('HRS_TRAB_MES_' +PoeZero(c)).asInteger :=
            Round(FCdsPessoa.FieldByName('HRS_TRAB_MES').asFloat);
      end;
{->}end;

begin
  // Horistas
  if (FCdsPessoa.FieldByName('TIPO_PAGAMENTO').asString = '5') then
  begin
    FCds_QuantHorasMensaisHor.Filtered := false;
    List_QuantHorasMensaisHor(FCdsPessoa.FieldByName('IDPESSOA').asFloat);
    bUsaRubHorista := not(FCds_QuantHorasMensaisHor.IsEmpty);
  end
  else
    bUsaRubHorista := false;

  if not(bUsaRubHorista) then
    List_Ferias(FCdsPessoa.FieldByName('IDPESSOA').asFloat);

  // Loop para analisar cada período de admissão - demissão
  FCdsPessoa.First;
  while not(FCdsPessoa.EOF) do
  begin
    dtDataAdm := GetDataAdmLimite(FCdsPessoa.FieldByName('DATA_ADMISSAO').asDateTime);
    dtDataDem := GetDataDemLimite(FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime);

    FCdsPessoa.Edit;

    iMesIni := ExtraiMes(dtDataAdm);

    FiltrarAfastNoPeriodo(dtDataAdm, dtDataDem);
    if not(FCdsAfastPessoa.IsEmpty) then
    begin
      while not(FCdsAfastPessoa.EOF) do
      begin
        iMesFin := ExtraiMes(FCdsAfastPessoa.FieldByName('DATA_INICIAL').asDateTime) - 1;

        GravarHoraTrabPeriodoAtual;

        iMesIni := ExtraiMes(FCdsAfastPessoa.FieldByName('DATA_FINAL').asDateTime) + 1;
        FCdsAfastPessoa.Next;
      end;
    end;

    iMesFin := ExtraiMes(dtDataDem);
    if (FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime > 0) and
       (FCdsPessoa.FieldByName('REM_MES_' +PoeZero(ExtraiMes(
        FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime))).asFloat = 0) then
      Dec(iMesFin);

    GravarHoraTrabPeriodoAtual;

    if not(bUsaRubHorista) then
      GravarHoraTrabPeriodoFerias;

    FCdsPessoa.Post;
    FCdsPessoa.Next;
  end;
end;*)

procedure TCtrlParamRAISMagnetico.Identificar_Remuneracao;
var
  bAfastTodoAno, bDemissaoEmJaneiro, bDemissaoMesmoMes: boolean;

{->}procedure MontarAviso_Remuneracao;
    begin
      //Inc(FNumInconsist);
      IncListaMensagens(
        FCdsLoopPessoa.FieldByName('IDEMPRESA').asInteger,
        FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat, tpInconsist,    
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_REM,
          [CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));
{      IncProgresso('', '', 0, false,
        Replicate('-',40) +CR_LF+
        CMTranslateMsg(MSG_PESSOA_SEM_REM,
          [CR_LF, CR_LF, CR_LF, FCdsLoopPessoa.FieldByName('EMPREGADO').asString]));}
{->}end;

begin
  FCds_Remuneracao.Filtered := false;
  List_Remuneracao(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);

  FCdsPessoa.First;
  repeat
    // Filtrar as remunerações do período admissão - demissão
    FiltrarCdsValorNoPeriodo(FCds_Remuneracao);

    if (FCds_Remuneracao.IsEmpty) then
    begin
      bAfastTodoAno := false;
      bDemissaoEmJaneiro := false;
      bDemissaoMesmoMes := false;
      
      FCdsAfastPessoa.Filtered := false;
      FCdsAfastPessoa.Filter := 'IDPESSOA = ' + FCdsPessoa.FieldByName('IDPESSOA').asString;
      FCdsAfastPessoa.Filtered := true;
      if not(FCdsAfastPessoa.IsEmpty) then
      begin
        FCdsAfastPessoa.Last;
        // Afastamentos ocorridos no ano-base anterior e permaneceram assim todo ano-base.
        if (FCdsAfastPessoa.FieldByName('DATA_INICIAL').asDateTime = StrToDate('01/01/'+ FAnoRef)) and
           (FCdsAfastPessoa.FieldByName('DATA_FINAL').asDateTime = StrToDate('31/12/'+ FAnoRef)) then
          bAfastTodoAno := true;
      end;

      // Caso a demissão seja em Janeiro do ano-base, gerar esta pessoa mesmo assim.
      if (FormatDateTime('YYYY/MM',FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime) =
          FAnoRef + '/01') then
        bDemissaoEmJaneiro := true;

      // Caso a demissão seja em Janeiro do ano-base, gerar esta pessoa mesmo assim.
      if (FormatDateTime('YYYY/MM',FCdsPessoa.FieldByName('DATA_ADMISSAO').asDateTime) =
          FormatDateTime('YYYY/MM',FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime)) then
        bDemissaoMesmoMes := true;

      if not(bAfastTodoAno) and not(bDemissaoEmJaneiro) and not(bDemissaoMesmoMes) then
      begin
        MontarAviso_Remuneracao;
        FPularPessoa := true;
        exit;
      end;
    end
    else
    begin
      // Atribuir a remuneração de cada mês ao respectivo campo
      if not(FCds_Remuneracao.IsEmpty) then
      begin
        FCdsPessoa.Edit;
        FCds_Remuneracao.First;
        while not(FCds_Remuneracao.EOF) do
        begin
          {if ((FCdsPessoa.FieldByName('TIPO_DEMISSAO').asString <> '30') and
              (FCdsPessoa.FieldByName('TIPO_DEMISSAO').asString <> '31')) or
             (Copy(FCds_Remuneracao.FieldByName('MES').asString,6,2) <
               FormatDateTime('MM', FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime)) then
          }begin
            FCdsPessoa.FieldByName('REM_MES_' +
              Copy(FCds_Remuneracao.FieldByName('MES').asString,6,2)).asFloat :=
              FCds_Remuneracao.FieldByName('VALOR').asFloat;
          end;

          FCds_Remuneracao.Next;
        end;
        //FCdsPessoa.Post;
      end;
      FCds_Remuneracao.Filtered := false;
    end;
    FCdsPessoa.Next;
  until (FCdsPessoa.EOF);
end;

procedure TCtrlParamRAISMagnetico.Identificar_13SalPessoa;
var
  iMes, c: byte;
  dValor: double;
  _CdsAux: TCMClientDataSet;
begin
  for c:=1 to 2 do
  begin
    if (c = 1) then
    begin
      List_1Parc13(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);
      _CdsAux := FCds_1Parc13;
    end
    else
    begin
      List_2Parc13(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);
      _CdsAux := FCds_2Parc13;
    end;

    _CdsAux.Filtered := false;
    if not(_CdsAux.IsEmpty) then
    begin
      FCdsPessoa.First;
      repeat
        // Filtrar as remunerações do período admissão - demissão
        FiltrarCdsValorNoPeriodo(_CdsAux);

        // Atribuir o valor do 13. salário no respectivo campo
        // Não é feito um agrupamento pelo mês pois pode ocorrer
        // de ser pago em meses diferentes. Neste caso, o mês de referência é tido como o último
        // mês encontrado usando MAX(MES) ao invés de somente MES.
        if not(_CdsAux.IsEmpty) then
        begin
          iMes := 0;
          dValor := 0;
          _CdsAux.First;
          while not(_CdsAux.EOF) do
          begin
            if (iMes < StrToInt(Copy(_CdsAux.FieldByName('MES').asString,6,2))) then
              iMes := StrToInt(Copy(_CdsAux.FieldByName('MES').asString,6,2));
            dValor := dValor + _CdsAux.FieldByName('VALOR').asFloat;
            _CdsAux.Next;
          end;

          FCdsPessoa.Edit;
          FCdsPessoa.FieldByName('MES_' +IntToStr(c)+ '_PARC_13').asInteger := iMes;
          FCdsPessoa.FieldByName('VAL_' +IntToStr(c)+ '_PARC_13').asFloat := dValor;
          FCdsPessoa.Post;
        end;

        FCdsPessoa.Next;
      until (FCdsPessoa.EOF);
      _CdsAux.Filtered := false;
    end;
  end;
end;

procedure TCtrlParamRAISMagnetico.Identificar_PAT;
begin
  FCds_PAT.Filtered := false;
  List_PAT(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);
  if not(FCds_PAT.IsEmpty) then
  begin
    FCdsPessoa.First;
    repeat
      // Filtrar as remunerações do período admissão - demissão
      FiltrarCdsValorNoPeriodo(FCds_PAT);

      // Caso algum valor tenha sido gerado para a pessoa, indicar no campo correspondente
      if not(FCds_PAT.IsEmpty) then
      begin
        FCdsPessoa.Edit;
        FCdsPessoa.FieldByName('PARTICIPA_PAT').asString := 'S';
        FCdsPessoa.Post;
      end;

      FCdsPessoa.Next;
    until (FCdsPessoa.EOF);
  end;
end;

procedure TCtrlParamRAISMagnetico.Identificar_AvisoPrevio;
var
  dValor: double;
begin
  FCds_AvisoPrevio.Filtered := false;
  List_AvisoPrevio(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);

  if not(FCds_AvisoPrevio.IsEmpty) then
  begin
    FCdsPessoa.First;
    repeat
      if (PessoaDemitidaNoPeriodo) then
      begin
        // Filtrar as remunerações do período admissão - demissão
        FiltrarCdsValorNoPeriodo(FCds_AvisoPrevio, true);

        // Somar todos os valores encontrados
        dValor := 0;
        FCds_AvisoPrevio.First;
        while not(FCds_AvisoPrevio.EOF) do
        begin
          dValor := dValor + FCds_AvisoPrevio.FieldByName('VALOR').asFloat;
          FCds_AvisoPrevio.Next;
        end;

        // Caso algum valor tenha sido gerado para a pessoa, indicar no campo correspondente
        if (dValor > 0) then
        begin
          FCdsPessoa.Edit;
          FCdsPessoa.FieldByName('VAL_AVISO_PREVIO').asFloat := dValor;
          FCdsPessoa.Post;
        end;
      end;
      FCdsPessoa.Next;
    until (FCdsPessoa.EOF);
  end;
end;

procedure TCtrlParamRAISMagnetico.Identificar_SalContratual;
var
  iMes: integer;
  dValor: double;
begin
  FCds_SalContratual.Filtered := false;
  List_SalContratual(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);
  if not(FCds_SalContratual.IsEmpty) then
  begin
    FCdsPessoa.First;
    repeat
      // Filtrar as remunerações do período admissão - demissão
      FiltrarCdsValorNoPeriodo(FCds_SalContratual);

      // Pegar o último dos valores encontrados
      iMes := 0;
      dValor := 0;
      FCds_SalContratual.First;
      while not(FCds_SalContratual.EOF) do
      begin
        if (iMes < StrToInt(Copy(FCds_SalContratual.FieldByName('MES').asString,6,2))) then
        begin
          iMes := StrToInt(Copy(FCds_SalContratual.FieldByName('MES').asString,6,2));
          dValor := FCds_SalContratual.FieldByName('VALOR').asFloat;
        end;
        FCds_SalContratual.Next;
      end;

      // Caso algum valor tenha sido gerado para a pessoa, indicar no campo correspondente
      if (dValor > 0) then
      begin
        FCdsPessoa.Edit;
        FCdsPessoa.FieldByName('VAL_SAL_CONTRATUAL').asFloat := dValor;
        FCdsPessoa.Post;
      end;

      List_UltSalContr(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat,
        GetDataDemLimite(FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime));

      if not(FCds_UltSalContr.IsEmpty) then
      begin
        FCdsPessoa.Edit;
        FCdsPessoa.FieldByName('CBO').asInteger := FCds_UltSalContr.FieldByName('CBO').asInteger;
        FCdsPessoa.Post;
      end;

      FCdsPessoa.Next;
    until (FCdsPessoa.EOF);
  end
  else
  begin
    FCdsPessoa.First;
    repeat
      List_UltSalContr(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat,
        GetDataDemLimite(FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime));

      if not(FCds_UltSalContr.IsEmpty) then
      begin
        dValor := FCds_UltSalContr.FieldByName('SALARIO').asFloat;
        if (FCds_UltSalContr.FieldByName('TIPO_PAGAMENTO').asString = '5') then
          dValor := dValor * FCdsPessoa.FieldByName('HRS_TRAB_MES').asFloat;

        FCdsPessoa.Edit;
        FCdsPessoa.FieldByName('VAL_SAL_CONTRATUAL').asFloat := dValor;
        FCdsPessoa.FieldByName('CBO').asInteger := FCds_UltSalContr.FieldByName('CBO').asInteger;
        FCdsPessoa.Post;
      end;

      FCdsPessoa.Next;
    until (FCdsPessoa.EOF);
  end;
end;

procedure TCtrlParamRAISMagnetico.Identificar_FeriasIndeniz;
var
  iMes: integer;
  dValor: double;
begin
  FCds_FeriasIndeniz.Filtered := false;
  List_FeriasIndeniz(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);
  if not(FCds_FeriasIndeniz.IsEmpty) then
  begin
    FCdsPessoa.First;
    repeat
      if (PessoaDemitidaNoPeriodo) then
      begin
        // Filtrar as remunerações do período admissão - demissão
        FiltrarCdsValorNoPeriodo(FCds_FeriasIndeniz, true);

        // Pegar o último dos valores encontrados
        iMes := 0;
        dValor := 0;
        FCds_FeriasIndeniz.First;
        while not(FCds_FeriasIndeniz.EOF) do
        begin
          if (iMes < StrToInt(Copy(FCds_FeriasIndeniz.FieldByName('MES').asString,6,2))) then
          begin
            iMes := StrToInt(Copy(FCds_FeriasIndeniz.FieldByName('MES').asString,6,2));
            dValor := FCds_FeriasIndeniz.FieldByName('VALOR').asFloat;
          end;
          FCds_FeriasIndeniz.Next;
        end;

        // Caso algum valor tenha sido gerado para a pessoa, indicar no campo correspondente
        if (dValor > 0) then
        begin
          FCdsPessoa.Edit;
          FCdsPessoa.FieldByName('VAL_FERIAS_INDENIZ').asFloat := dValor;
          FCdsPessoa.Post;
        end;
      end;
      FCdsPessoa.Next;
    until (FCdsPessoa.EOF);
  end;
end;

procedure TCtrlParamRAISMagnetico.Identificar_BancoHoras;
var
  iQuantMeses: integer;
  dValor: double;
begin
  FCds_BancoHoras.Filtered := false;
  List_BancoHoras(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);
  if not(FCds_BancoHoras.IsEmpty) then
  begin
    FCdsPessoa.First;
    repeat
      if (PessoaDemitidaNoPeriodo) then
      begin
        // Filtrar as remunerações do período admissão - demissão
        FiltrarCdsValorNoPeriodo(FCds_BancoHoras, true);

        // Pegar o último dos valores encontrados
        iQuantMeses := 0;
        dValor := 0;
        FCds_BancoHoras.First;
        while not(FCds_BancoHoras.EOF) do
        begin
          Inc(iQuantMeses);
          dValor := dValor + FCds_BancoHoras.FieldByName('VALOR').asFloat;
          FCds_BancoHoras.Next;
        end;

        // Caso algum valor tenha sido gerado para a pessoa, indicar no campo correspondente
        if (dValor > 0) then
        begin
          FCdsPessoa.Edit;
          FCdsPessoa.FieldByName('VAL_BANCO_HORAS').asFloat := dValor;
          FCdsPessoa.FieldByName('QUANT_BANCO_HORAS').asInteger := iQuantMeses;
          FCdsPessoa.Post;
        end;
      end;
      FCdsPessoa.Next;
    until (FCdsPessoa.EOF);
  end;
end;

procedure TCtrlParamRAISMagnetico.Identificar_Dissidio;
var
  iQuantMeses: integer;
  dValor: double;
begin
  FCds_Dissidio.Filtered := false;
  List_Dissidio(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);
  if not(FCds_Dissidio.IsEmpty) then
  begin
    FCdsPessoa.First;
    repeat
      if (PessoaDemitidaNoPeriodo) then
      begin
        // Filtrar as remunerações do período admissão - demissão
        FiltrarCdsValorNoPeriodo(FCds_Dissidio, true);

        // Pegar o último dos valores encontrados
        iQuantMeses := 0;
        dValor := 0;
        FCds_Dissidio.First;
        while not(FCds_Dissidio.EOF) do
        begin
          Inc(iQuantMeses);
          dValor := dValor + FCds_Dissidio.FieldByName('VALOR').asFloat;
          FCds_Dissidio.Next;
        end;

        // Caso algum valor tenha sido gerado para a pessoa, indicar no campo correspondente
        if (dValor > 0) then
        begin
          FCdsPessoa.Edit;
          FCdsPessoa.FieldByName('VAL_DISSIDIO').asFloat := dValor;
          FCdsPessoa.FieldByName('QUANT_DISSIDIO').asInteger := iQuantMeses;
          FCdsPessoa.Post;
        end;
      end;
      FCdsPessoa.Next;
    until (FCdsPessoa.EOF);
  end;
end;

procedure TCtrlParamRAISMagnetico.Identificar_Gratif;
var
  iQuantMeses: integer;
  dValor: double;
begin
  FCds_Gratif.Filtered := false;
  List_Gratif(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);
  if not(FCds_Gratif.IsEmpty) then
  begin
    FCdsPessoa.First;
    repeat
      if (PessoaDemitidaNoPeriodo) then
      begin
        // Filtrar as remunerações do período admissão - demissão
        FiltrarCdsValorNoPeriodo(FCds_Gratif, true);

        // Pegar o último dos valores encontrados
        iQuantMeses := 0;
        dValor := 0;
        FCds_Gratif.First;
        while not(FCds_Gratif.EOF) do
        begin
          Inc(iQuantMeses);
          dValor := dValor + FCds_Gratif.FieldByName('VALOR').asFloat;
          FCds_Gratif.Next;
        end;

        // Caso algum valor tenha sido gerado para a pessoa, indicar no campo correspondente
        if (dValor > 0) then
        begin
          FCdsPessoa.Edit;
          FCdsPessoa.FieldByName('VAL_GRATIF').asFloat := dValor;
          FCdsPessoa.FieldByName('QUANT_GRATIF').asInteger := iQuantMeses;
          FCdsPessoa.Post;
        end;
      end;
      FCdsPessoa.Next;
    until (FCdsPessoa.EOF);
  end;
end;

procedure TCtrlParamRAISMagnetico.Identificar_MultaResc;
var
  dValor: double;
begin
  FCds_MultaResc.Filtered := false;
  List_MultaResc(FCdsLoopPessoa.FieldByName('IDPESSOA').asFloat);
  if not(FCds_MultaResc.IsEmpty) then
  begin
    FCdsPessoa.First;
    repeat
      if (PessoaDemitidaNoPeriodo) then
      begin
        // Filtrar as remunerações do período admissão - demissão
        FiltrarCdsValorNoPeriodo(FCds_MultaResc, true);

        // Pegar o último dos valores encontrados
        dValor := 0;
        FCds_MultaResc.First;
        while not(FCds_MultaResc.EOF) do
        begin
          dValor := dValor + FCds_MultaResc.FieldByName('VALOR').asFloat;
          FCds_MultaResc.Next;
        end;

        // Caso algum valor tenha sido gerado para a pessoa, indicar no campo correspondente
        if (dValor > 0) then
        begin
          FCdsPessoa.Edit;
          FCdsPessoa.FieldByName('VAL_MULTA_RESC').asFloat := dValor;
          FCdsPessoa.Post;
        end;
      end;
      FCdsPessoa.Next;
    until (FCdsPessoa.EOF);
  end;
end;

function TCtrlParamRAISMagnetico.IdentificarPessoas: boolean;

{->}function FoiDemitidoAnoBase: boolean;
    begin
      Result := false;
      FCdsPessoa.First;
      repeat
        if (PessoaDemitidaNoPeriodo) then
        begin
          Result := true;
          break;
        end;
        FCdsPessoa.Next;
      until (FCdsPessoa.EOF);
{->}end;

begin
  try
    FCdsLoopPessoa.Data := FCdsPessoa.Data;
    FCdsPessoa.EmptyDataSet;
    FCdsLoopPessoa.First;

    repeat
      Identificar_AdmDem;
      if not(FPularPessoa) then
      begin
        FCdsPessoa.Filter := 'IDPESSOA = ' +FCdsLoopPessoa.FieldByName('IDPESSOA').asString;
        FCdsPessoa.Filtered := true;

        Identificar_EvolFunc;
        if not(FPularPessoa) then
        begin
          Identificar_Remuneracao;
          if not(FPularPessoa) then
          begin
            //Identificar_HoraTrab;
            Identificar_HorasExtras;
            Identificar_13SalPessoa;
            Identificar_SalContratual;
            Identificar_PAT;

            if (FoiDemitidoAnoBase) then
            begin
              Identificar_AvisoPrevio;
              Identificar_FeriasIndeniz;
              Identificar_BancoHoras;
              Identificar_Dissidio;
              Identificar_Gratif;
              Identificar_MultaResc;
            end;
          end
          else
//          if (FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime < 0) or
//             (FormatDateTime('YYYY',FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime) >= FAnoRef) then
            FCdsPessoa.Delete;
        end;    

        FCdsPessoa.Filtered := false;
      end;

      FCdsLoopPessoa.Next;
      IncProgresso(GetTempoDecorrido, '', 0, true);
    until (FCdsLoopPessoa.EOF);

    FCdsPessoa.First;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

{procedure TCtrlParamRAISMagnetico.Excluir_Pessoas_AfastAnoAnterior;
var
  c: byte;
  bTemRem: boolean; 
  sListaPessoas: string;
begin
  FCdsPessoa.First;
  sListaPessoas := '';
  repeat
    if (FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime > 0) and
       (FormatDateTime('YYYY',FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime) < FAnoRef) then
    begin
      bTemRem := false;
      for c:=1 to 12 do
        if (FCdsPessoa.FieldByName('REM_MES_' +PoeZero(c)).asFloat > 0) then
        begin
          bTemRem := true;
          break;
        end;

      if not(bTemRem) then
      begin
        if (sListaPessoas = '') then
          sListaPessoas := ' - ' + FCdsPessoa.FieldByName('EMPREGADO').asString
        else
          sListaPessoas := sListaPessoas +CR_LF+' - ' + FCdsPessoa.FieldByName('EMPREGADO').asString;
        FCdsPessoa.Delete;
      end
      else
        FCdsPessoa.Next;
    end
    else
      FCdsPessoa.Next;
  until (FCdsPessoa.EOF);

  if (sListaPessoas <> '') then
    IncProgresso('', '', 0, false,
      Replicate('-',40) +CR_LF+
      CMTranslateMsg(MSG_PESSOA_AFAST_ANO_ATERIOR,
        [CR_LF, CR_LF, CR_LF + CR_LF + sListaPessoas]) +CR_LF+
      Replicate('-',40));
end;}

{procedure TCtrlParamRAISMagnetico.MontarAvisoFinal;
var
  c: byte;
  iAdmitidos, iDemitidos: integer;
  iAdm, iDem, iAfa, iRet, iTra: array [1..12] of integer;
  sAdm, sDem, sAfa, sRet, sTra: array [1..12] of string;
const
  MSG_AVISO_FINAL =
    '| Número de Admissões      | :1 :2 :3 :4 :5 :6 :7 :8 :9 :10 :11 :12'+
    '| Número de Demitidos      | :13 :14 :15 :16 :17 :18 :19 :20 :21 :22 :23 :24'+
    '| Número de Afatamentos    | :25 :26 :27 :28 :29 :30 :31 :32 :33 :34 :35 :36'+
    '| Número de Retornos       | :37 :38 :39 :40 :41 :42 :43 :44 :45 :46 :47 :48'+
    '| Número de Transferências | :49 :50 :51 :52 :53 :54 :55 :56 :57 :58 :59 :60';
begin
  FillChar(iAdm, 12, 0);
  FillChar(iDem, 12, 0);
  FillChar(iAfa, 12, 0);
  FillChar(iRet, 12, 0);
  FillChar(iTra, 12, 0);
  FCdsPessoa.First;
  while not(FCdsPessoa.EOF) do
  begin
    if (FormatDateTime('YYYY', FCdsPessoa.FieldByName('DATA_ADMISSAO').asDateTime) = FAnoRef) then
    begin
      if (FCdsPessoa.FieldByName('TIPO_ADMISSAO').asString = '3') or
         (FCdsPessoa.FieldByName('TIPO_ADMISSAO').asString = '4') then
      begin
        iAdm[ExtraiMes(FCdsPessoa.FieldByName('DATA_ADMISSAO').asDateTime)] :=
          iAdm[ExtraiMes(FCdsPessoa.FieldByName('DATA_ADMISSAO').asDateTime)] + 1;
      end
      else
      begin
        iTra[ExtraiMes(FCdsPessoa.FieldByName('DATA_ADMISSAO').asDateTime)] :=
          iTra[ExtraiMes(FCdsPessoa.FieldByName('DATA_ADMISSAO').asDateTime)] + 1;
      end;
    end;

    if (FormatDateTime('YYYY', FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime) = FAnoRef) then
    begin
      if (FCdsPessoa.FieldByName('TIPO_DEMISSAO').asString = '30') or
         (FCdsPessoa.FieldByName('TIPO_DEMISSAO').asString = '31') then
      begin
        iDem[ExtraiMes(FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime)] :=
          iDem[ExtraiMes(FCdsPessoa.FieldByName('DATA_DEMISSAO').asDateTime)] + 1;
      end;
    end;

    FCdsPessoa.Next;
  end;

  for c:=1 to 12 do
  begin
    sAdm[c] := Alinha(IntToStr(iAdm[c]), 3, 'D', ' ');
    sDem[c] := Alinha(IntToStr(iDem[c]), 3, 'D', ' ');
    sAfa[c] := Alinha(IntToStr(iAfa[c]), 3, 'D', ' ');
    sRet[c] := Alinha(IntToStr(iRet[c]), 3, 'D', ' ');
    sTra[c] := Alinha(IntToStr(iTra[c]), 3, 'D', ' ');
  end;

  IncProgresso('', '', 0, false,
    Replicate('_', 91)+ CR_LF+
    CMTranslateMsg(MSG_AVISO_FINAL, [
      sAdm[01], sAdm[02], sAdm[03], sAdm[04], sAdm[05], sAdm[06],
      sAdm[07], sAdm[08], sAdm[09], sAdm[10], sAdm[11], sAdm[12] +CR_LF,
      sDem[01], sDem[02], sDem[03], sDem[04], sDem[05], sDem[06],
      sDem[07], sDem[08], sDem[09], sDem[10], sDem[11], sDem[12] +CR_LF,
      sAfa[01], sAfa[02], sAfa[03], sAfa[04], sAfa[05], sAfa[06],
      sAfa[07], sAfa[08], sAfa[09], sAfa[10], sAfa[11], sAfa[12] +CR_LF,
      sRet[01], sRet[02], sRet[03], sRet[04], sRet[05], sRet[06],
      sRet[07], sRet[08], sRet[09], sRet[10], sRet[11], sRet[12] +CR_LF,
      sTra[01], sTra[02], sTra[03], sTra[04], sTra[05], sTra[06],
      sTra[07], sTra[08], sTra[09], sTra[10], sTra[11], sTra[12]]) +CR_LF+
    Replicate('_', 91));
end;}

function TCtrlParamRAISMagnetico.GerarRegistro0: string;
begin
  // Número de registros começa em 1
  FNumRegistroAtual := 1;

  Result :=
    // 01 (001 até 006 / tam. 006) Número do registro no arquivo
    fValidaDados('N', IntToStr(FNumRegistroAtual), 6)+
    // 02 (007 até 020 / tam. 014) Inscrição CGC/CNPJ/CEI do primeiro estabelecimento do arquivo
    fValidaDados('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14)+
    // 03 (021 até 022 / tam. 002) Prefixo do primeiro estabelecimento do arquivo
    '00'+
    // 04 (023 até 023 / tam. 001) Tipo do registro
    '0'+
    // 05 (024 até 024 / tam. 001) Indicador p/envio do recibo definitivo
    // 1 - o recibo será enviado pelo correio para o endereço do responsável
    // 2 - o recibo será enviado pelo correio para o endereço do estabelecimento
    //IFF(FReciboParaEndResponsavel, '2', '1')+
    '1'+
    // 06 (025 até 038 / tam. 014) Inscrição CNPJ/CEI/CPF do responsável
    fValidaDados('N', FCdsResp.FieldByName('INSCRICAO').asString, 14)+
    // 07 (039 até 039 / tam. 001) Tipo de Inscrição do responsável
    // 1 -> CNPJ
    // 3 -> CEI
    // 4 -> CPF
    fValidaDados('N', FCdsResp.FieldByName('TIPO_INSCRICAO').asString, 1)+
    // 08 (040 até 079 / tam. 040) Razão social do Responsável
    fValidaDados('*', FCdsResp.FieldByName('RAZAOSOCIAL').asString, 40)+
    // 09 (080 até 119 / tam. 040) Logradouro
    fValidaDados('*', FCdsResp.FieldByName('LOGRADOURO').asString, 40)+
    // 10 (120 até 125 / tam. 006) Número
    fValidaDados('N', FCdsResp.FieldByName('NUMERO').asString, 6)+
    // 11 (126 até 146 / tam. 021) Complemento
    fValidaDados('*', FCdsResp.FieldByName('COMPLEMENTO').asString, 21)+
    // 12 (147 até 165 / tam. 019) Bairro
    fValidaDados('*', FCdsResp.FieldByName('BAIRRO').asString, 19)+
    // 13 (166 até 173 / tam. 008) CEP
    fValidaDados('N', FCdsResp.FieldByName('CEP').asString, 8)+
    // 14 (174 até 180 / tam. 007) Código do Município
    fValidaDados('N', FCdsResp.FieldByName('COD_MUNICIPIO').asString, 7)+
    // 15 (181 até 210 / tam. 030) Nome do Município
    fValidaDados('*', FCdsResp.FieldByName('NOM_MUNICIPIO').asString, 30)+
    // 16 (211 até 212 / tam. 002) UF
    fValidaDados('A', FCdsResp.FieldByName('UF').asString, 2)+
    // 17 (213 até 214 / tam. 002) DDD
    fValidaDados('N', FCdsResp.FieldByName('DDD').asString, 2)+
    // 18 (215 até 223 / tam. 009) Telefone
    //Rodrigo de Brito Figueredo SOL 198151 KINTANA 1905330: fValidaDados('N', FCdsResp.FieldByName('TELEFONE').asString, 8)+
    fValidaDados('N', FCdsResp.FieldByName('TELEFONE').asString, 9)+ //Rodrigo de Brito Figueredo SOL 198151 KINTANA 1905330
    // 19 (224 até 224 / tam. 001) Indicador de retificação de declaração
    // 1 -> Este arquivo retifica a declaração dos estabelecimentos presentes
    // 2 -> A declaração não é de retificação (é primeira entrega)
    // no arquivo e que foram entregues anteriormente
    IFF(FEmissaoNormal, '2', '1')+
    // 20 (225 até 232 / tam. 008) Data da geração do arquivo de retificação
    IFF(not(FEmissaoNormal), TiraBarra(FDataRetif), '00000000')+
    // 21 (233 até 240 / tam. 008) Data da geração do arquivo
    FormatDateTime('DDMMYYYY', Date)+
    // 22 (241 até 285 / tam. 045) E-MAIL do responsável
    //Bruno Bastos - Sol: 129826 - Kintana: 715518 - fValidaDados('*', FCdsResp.FieldByName('EMAIL').asString, 45)+
    // Edilaine - SOL 172250 - KTN 1547587 - fValidaDados('*', FCdsNovoResp.FieldByName('EMAIL').asString, 45)+ //Bruno Bastos - Sol: 129826 - Kintana: 715518
    fValidaDados('*', 'geape@funcef.com.br', 45)+  // Edilaine - SOL 172250 - KTN 1547587

    // 23 (286 até 337 / tam. 052) Nome do Responsável
    //Bruno Bastos - Sol: 129826 - Kintana: 715518 - fValidaDados('*', FCdsResp.FieldByName('NOME').asString, 52)+
    fValidaDados('*', FCdsNovoResp.FieldByName('NOME').asString, 52)+//Bruno Bastos - Sol: 129826 - Kintana: 715518

    // ---------------------------------------------
    // -- Alteração 10/Fev/2008 ref Layout RAIS-2008
    // -- Ádler Teodoro de Souza - SOL 106839  KINTANA 479542
    // ---------------------------------------------
    // 24 (338 até 361 / tam. 024) Espaços
    //Rodrigo de Brito Figueredo SOL 198151 KINTANA 1905330 : Replicate(' ', 20)+
    Replicate(' ', 24)+ //Rodrigo de Brito Figueredo SOL 198151 KINTANA 1905330
    //Rodrigo de Brito Figueredo SOL 198151 KINTANA 1905330 - Inicio  OBS:Campo Excluído
    {// 25 (357 até 360 / tam. 04) Constante 0550  // Edilaine - SOL 172250 - KTN 1547587 - constante passou a ser 0551
    '0551'+                                       // Edilaine - SOL 172250 - KTN 1547587
    }//Rodrigo de Brito Figueredo SOL 198151 KINTANA 1905330 - Fim  OBS:Campo Excluído
    // 25 (362 até 372 / tam. 11) CPF do responsável
    //Bruno Bastos - Sol: 129826 - Kintana: 715518 - Replicate(' ', 11)+
    fValidaDados('*', FCdsNovoResp.FieldByName('CPF').asString, 11)+//Bruno Bastos - Sol: 129826 - Kintana: 715518

    // 26 (373 até 384 / tam. 12) CREA a ser retificado
    Replicate(' ', 12)+

    // 27 (385 até 392 / tam. 8) Data de Nascimento do Responsável
    fValidaDados('*', FCdsNovoResp.FieldByName('DATANASC').asString, 8)+//Bruno Bastos - Sol: 129826 - Kintana: 715518

    // 28 (393 até 551 / tam. 159) Espaços
    //Bruno Bastos - Sol: 129826 - Kintana: 715518 - Replicate(' ', 167);
    //Bruno Bastos - Sol: 129826 - Kintana: 715518 - Replicate(' ', 159);
    // Edilaine - SOL 172250 - KTN 1547587;  Replicate(' ', 160);

    //Replicate(' ', 159); //Rodrigo de Brito Figueredo SOL 198151 KINTANA 1905330
    //Ewerton Beltramini - 31/03/2021 - SIG114711 (Comentada a linha anterior e colocado o novo tamanho do campo)
    Replicate(' ', 192);






end;

function TCtrlParamRAISMagnetico.GerarRegistro1: string;
var
  sCNPJ_SindContribAssoc, sCNPJ_SindContribSind: string;
  sCNPJ_SindContribAssis, sCNPJ_SindContribConf: string;
  dVal_SindContribAssoc, dVal_SindContribSind: double;
  dVal_SindContribAssis, dVal_SindContribConf: double;
  iNumEmprPATMenos5Sal, iNumEmprPATMais5Sal: integer;
  dMediaSal: double;
  c, iNumDenom: integer;
begin
  GetValContribPatronal(FCdsEstab.FieldByName('IDESTAB').asFloat, FListaIdRubContribAssoc,
    sCNPJ_SindContribAssoc, dVal_SindContribAssoc);

  GetValContribPatronal(FCdsEstab.FieldByName('IDESTAB').asFloat, FListaIdRubContribSind,
    sCNPJ_SindContribSind, dVal_SindContribSind);

  GetValContribPatronal(FCdsEstab.FieldByName('IDESTAB').asFloat, FListaIdRubContribAssis,
    sCNPJ_SindContribAssis, dVal_SindContribAssis);

  GetValContribPatronal(FCdsEstab.FieldByName('IDESTAB').asFloat, FListaIdRubContribConf,
    sCNPJ_SindContribConf, dVal_SindContribConf);

  // Calcular a Quant. de participantes do PAT, na faixa salarial de até 5 salários mínimos
  // e a Quant. de participantes do PAT, na faixa salarial acima de 5 salários mínimos
  iNumEmprPATMenos5Sal := 0;
  iNumEmprPATMais5Sal := 0;
  
  FCdsPessoa.First;
  while not(FCdsPessoa.EOF) do
  begin
    if (FCdsPessoa.FieldByName('PARTICIPA_PAT').asString = 'S') then
    begin
      // Calcular a média das remunerações recebidas pela pessoa no ano-base
      iNumDenom := 0;
      dMediaSal := 0;
      for c:=1 to 12 do
        if (FCdsPessoa.FieldByName('REM_MES_' +PoeZero(c)).asFloat > 0) then
        begin
          dMediaSal := dMediaSal + FCdsPessoa.FieldByName('REM_MES_' +PoeZero(c)).asFloat;
          Inc(iNumDenom);
        end;

      if (iNumDenom > 0) then
        dMediaSal := dMediaSal / iNumDenom;

      // Verificar se a pessoa teve média salarial maior ou menor que cinco salários mínimos
      if (dMediaSal <= FValorSalMinAtual * 5) then
        Inc(iNumEmprPATMenos5Sal)
      else
        Inc(iNumEmprPATMais5Sal);
    end;

    FCdsPessoa.Next;
  end;

  // Incrementar o número de Estabelecimentos
  Inc(FNumEstab);
  // Incrementar o número de registros
  Inc(FNumRegistroAtual);

  Result :=
    // 01 (001 até 006 / tam. 006) Número do registro no arquivo
    fValidaDados('N', IntToStr(FNumRegistroAtual), 6)+
    // 02 (007 até 020 / tam. 014) Inscrição CGC/CNPJ/CEI do estabelecimento
    fValidaDados('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14)+
    // 03 (021 até 022 / tam. 002) Prefixo do estabelecimento
    '00'+
    // 04 (023 até 023 / tam. 001) Tipo do registro
    '1'+
    // 05 (024 até 075 / tam. 052) Razão Social
    fValidaDados('*', FCdsEstab.FieldByName('NOME').asString, 52)+
    // 06 (076 até 115 / tam. 040) Logradouro
    fValidaDados('*', FCdsEstab.FieldByName('LOGRADOURO').asString, 40)+
    // 07 (116 até 121 / tam. 006) Número
    fValidaDados('N', FCdsEstab.FieldByName('NUMERO').asString, 6)+
    // 08 (122 até 142 / tam. 021) Complemento
    fValidaDados('*', FCdsEstab.FieldByName('COMPLEMENTO').asString, 21)+
    // 09 (143 até 161 / tam. 019) Bairro
    fValidaDados('*', FCdsEstab.FieldByName('BAIRRO').asString, 19)+
    // 10 (162 até 169 / tam. 008) CEP
    fValidaDados('N', FCdsEstab.FieldByName('CEP').asString, 8)+
    // 11 (170 até 176 / tam. 007) Código do Município
    fValidaDados('N', FCdsEstab.FieldByName('COD_MUNICIPIO').asString, 7)+
    // 12 (177 até 206 / tam. 030) Nome do Município
    fValidaDados('*', FCdsEstab.FieldByName('NOM_MUNICIPIO').asString, 30)+
    // 13 (207 até 208 / tam. 002) UF
    fValidaDados('A', FCdsEstab.FieldByName('UF').asString, 2)+
    // 14 (209 até 210 / tam. 002) DDD
    fValidaDados('N', FCdsEstab.FieldByName('DDD').asString, 2)+
    // 15 (211 até 219 / tam. 009) Telefone
    //Rodrigo de Brito Figueredo SOL 198151 KINTANA 1905330: fValidaDados('N', FCdsEstab.FieldByName('TELEFONE').asString, 8)+
    fValidaDados('N', FCdsEstab.FieldByName('TELEFONE').asString, 9)+//Rodrigo de Brito Figueredo SOL 198151 KINTANA 1905330
    // 16 (220 até 264 / tam. 045) E-MAIL
    fValidaDados('*', FCdsEstab.FieldByName('EMAIL').asString, 45)+
    // 17 (265 até 271 / tam. 007) Código CNAE
    //fValidaDados('N', FCdsEstab.FieldByName('CNAE').asString, 7)+ // Edilaine - SOL 172250 - KTN 1547587 - comentei
    fValidaDados('N', '6541300', 7)+   // Edilaine - SOL 172250 - KTN 1547587
    // 18 (272 até 275 / tam. 004) Natureza Jurídica
    fValidaDados('N', FCdsEstab.FieldByName('NAT_JURIDICA').asString, 4)+
    // 19 (276 até 279 / tam. 004) Número de Proprietários
    //Rodrigo de Brito Figueredo SOL 198151 KINTANA 1905330: PoeZero(FNumeroProprietarios)+
    fValidaDados('N', IntTostr(FNumeroProprietarios), 4)+ //Rodrigo de Brito Figueredo SOL 198151 KINTANA 1905330
    // 20 (280 até 281 / tam. 002) Mês da Data-Base
    PoeZero(FMesDataBase)+
    // 21 (282 até 282 / tam. 001) Tipo de inscrição do Estabelecimento
    // 1 -> CGC/CNPJ
    // 3 -> CEI
    FCdsEstab.FieldByName('TIPO_INSCRICAO').asString+
    // 22 (283 até 283 / tam. 001) Tipo de RAIS
    // 0 -> Estab. com empregados
    // 1 -> Estab. sem empregados (RAIS negativa)
    '0'+
    // 23 (284 até 285 / tam. 002) Zeros
    '00'+
    // 24 (286 até 297 / tam. 012) Matrícula CEI vinculada à uma inscrição CNPJ
    fValidaDados('N', FCdsEstab.FieldByName('MATRICULA_CEI').asString, 12)+
    // 25 (298 até 301 / tam. 004) Competência (Ano-Base)
    FAnoRef+
    // 26 (302 até 302 / tam. 001) Indicador de Porte da Empresa
    // 1 -> Micro-empresa
    // 2 -> Empresa de Pequeno Porte
    // 3 -> Empresa não classificada nos ítens anteriores
    // 4 -> Micro Empreendedor   Obs.: Criada a partir de 2009
    IntToStr(FIndicadorMicroEmpresa)+
    // 27 (303 até 303 / tam. 001) Indicador de Participação no Simples
    // 1 -> Sim
    // 2 -> Não
    IntToStr(FOptanteSimples)+
    // 28 (304 até 304 / tam. 001) Indicador de Participação no PAT
    // 1 -> Sim
    // 2 -> Não
    //IFF(iNumEmprPATMenos5Sal + iNumEmprPATMais5Sal > 0, '1', '2')+      // Edilaine - SOL 172250 - KTN 1547587 - comentei
    IFF(FParticipaPAT = 0, '1', '2')+                                     // Edilaine - SOL 172250 - KTN 1547587
    // 29 (305 até 310 / tam. 006) Quant. de participantes do PAT e recebem salário até 5 SM
    fValidaDados('N', IntToStr(iNumEmprPATMenos5Sal), 6)+
    // 30 (311 até 316 / tam. 006) Quant. de participantes do PAT e recebem salário até 5 SM
    fValidaDados('N', IntToStr(iNumEmprPATMais5Sal), 6)+
    // 31 (317 até 319 / tam. 003) Percentual de Serviço Próprio
    fValidaDados('N', FloatToStr(FPorcServProp), 3)+
    // 32 (320 até 322 / tam. 003) Percentual de Administração de cozinhas
    fValidaDados('N', FloatToStr(FPorcAdmCoz), 3)+
    // 33 (323 até 325 / tam. 003) Percentual de Refeição-convênio
    fValidaDados('N', FloatToStr(FPorcRefConv), 3)+
    // 34 (326 até 328 / tam. 003) Percentual de Refeições transportadas
    fValidaDados('N', FloatToStr(FPorcRefTransp), 3)+
    // 35 (329 até 331 / tam. 003) Percentual de Cesta de alimentos
    fValidaDados('N', FloatToStr(FPorcCestaAlim), 3)+
    // 36 (332 até 334 / tam. 003) Percentual de Alimentação-convênio
    fValidaDados('N', FloatToStr(FPorcAlimConv), 3)+
    // 37 (335 até 335 / tam. 001) Indicador de Encerramento de Atividades
    // 1 -> O Estabelecimento encerrou as atividades
    // 2 -> O Estabelecimento não encerrou as atividades
    IFF(FEncerrAtividades, '2', '1')+
    // 38 (336 até 343 / tam. 008) Data de Encerramento de Atividades
    fValidaDados('N', TiraBarra(FDataEncerrAtividades), 8)+
    // 39 (344 até 357 / tam. 014) CNPJ da entidade sindical patronal beneficiada pela
    // contribuição associativa
    fValidaDados('N', sCNPJ_SindContribAssoc, 14)+
    // 40 (358 até 366 / tam. 009) Valor total acumulado no ano-base e repassado pelo
    // estabelecimento para a entidade sindical beneficiada pela contribuição associativa
    //Bruno Bastos - Sol: 129826 - Kintana: 715518 - fValidaDados('N', FormatFloat('#########0.00', dVal_SindContribAssoc), 8)+
    fValidaDados('N', FormatFloat('#########0.00', dVal_SindContribAssoc), 9)+ //Bruno Bastos - Sol: 129826 - Kintana: 715518

    // 41 (367 até 380 / tam. 014) CNPJ da entidade sindical patronal beneficiada pela
    // contribuição sindical
    fValidaDados('N', sCNPJ_SindContribSind, 14)+
    // 42 (381 até 389 / tam. 009) Valor total acumulado no ano-base e repassado pelo
    // estabelecimento para a entidade sindical beneficiada pela contribuição sindical
    //Bruno Bastos - Sol: 129826 - Kintana: 715518 - fValidaDados('N', FormatFloat('#########0.00', dVal_SindContribSind), 8)+
    fValidaDados('N', FormatFloat('#########0.00', dVal_SindContribSind), 9)+//Bruno Bastos - Sol: 129826 - Kintana: 715518

    // 43 (390 até 403 / tam. 014) CNPJ da entidade sindical patronal beneficiada pela
    // contribuição assistencial
    fValidaDados('N', sCNPJ_SindContribAssis, 14)+

    // 44 (404 até 412 / tam. 009) Valor total acumulado no ano-base e repassado pelo
    // estabelecimento para a entidade sindical beneficiada pela contribuição assistencial
    //Bruno Bastos - Sol: 129826 - Kintana: 715518 - fValidaDados('N', FormatFloat('#########0.00', dVal_SindContribAssis), 8)+
    fValidaDados('N', FormatFloat('#########0.00', dVal_SindContribAssis), 9)+//Bruno Bastos - Sol: 129826 - Kintana: 715518

    // 45 (413 até 426 / tam. 014) CNPJ da entidade sindical patronal beneficiada pela
    // contribuição confederativa
    fValidaDados('N', sCNPJ_SindContribConf, 14)+

    // 46 (427 até 435 / tam. 009) Valor total acumulado no ano-base e repassado pelo
    // estabelecimento para a entidade sindical beneficiada pela contribuição confederativa
    //Bruno Bastos - Sol: 129826 - Kintana: 715518 - fValidaDados('N', FormatFloat('#########0.00', dVal_SindContribConf), 8)+
    fValidaDados('N', FormatFloat('#########0.00', dVal_SindContribConf), 9)+//Bruno Bastos - Sol: 129826 - Kintana: 715518

    // 47 (436 até 436 / tam. 001) Exerceu atividade durante o ano-base
    // 1 -> Sim
    // 2 -> Não
    '1'+
    // 48 (437 até 437 / tam. 001) Indicador de centralização do pagamento da contribuição sindical
    // 1 -> Sim
    // 2 -> Não
    '2'+
    // 49 (438 até 451 / tam. 014) CNPJ - Centralizadora das Contribuições Sindicais
    Replicate('0', 14)+
    // 50 (452 até 452 / tam. 001) Indicador de empresa Sindicalizada
    // 1 -> Sim
    // 2 -> Não
    //IFF((dVal_SindContribAssoc > 0) or (dVal_SindContribSind > 0) or           // Edilaine - SOL 172250 - KTN 1547587 - comentei
    //    (dVal_SindContribAssis > 0) or (dVal_SindContribConf > 0), '1', '2')+  // Edilaine - SOL 172250 - KTN 1547587 - comentei
    '2'+                                                                          // Edilaine - SOL 172250 - KTN 1547587
    //Início - William Santana - SOL 224461/15703 KIN 2059184
    //50 (453 a 454 / tam. 002) Tipo de Sitema de Controle de Ponto
    IFF((strtoint(FAnoRef) >= 2013),fValidaDados('N',FCdsEstab.FieldByName('IDSISTEMACONTROLEPONTORAIS').asString, 2),'  ') +
    // 51 (455 até 539 / tam. 087) Brancos
    //else
  { // 51 (453 até 537 / tam. 085) Brancos -- linha modificada}
    //Término - William Santana - SOL 224461/15703 KIN 2059184
    //Bruno Bastos - Sol: 129826 - Kintana: 715518 - Replicate(' ', 93)+
    //Bruno Bastos - Sol: 129826 - Kintana: 715518 - Replicate(' ', 89)+
    //Edilaine - SOL 172250 - KTN 1547587 :Replicate(' ', 90)+

    // William Santana - SOL 224461/15703 KIN 2059184
    //Replicate(' ', 87)+ //Rodrigo de Brito Figueredo SOL 198151 KINTANA 1905330
    Replicate(' ', 85)+
    // William Santana - SOL 224461/15703 KIN 2059184 - fim

    // 52 (540 até 551 / tam. 012) Uso exclusivo da empresa
    //Replicate(' ', 12);
    //Ewerton Beltramini - 31/03/2021 - SIG114711 (Comentada a linha anterior e colocado o novo tamanho do campo) (540 a 584 45) Layout 2020
    Replicate(' ', 45);
end;

function TCtrlParamRAISMagnetico.GerarRegistro2: string;
var
  ArrayCNPJ_SindContribAssoc: TArrayCNPJ_ContribIndivAssoc;
  ArrayVal_SindContribAssoc: TArrayVal_ContribIndivAssoc;
  sCNPJ_SindContribSind, sCNPJ_SindContribAssis, sCNPJ_SindContribConf: string;
  dVal_SindContribSind, dVal_SindContribAssis, dVal_SindContribConf: double;
  iHorasTrab: integer;
begin
  iHorasTrab := Round(FCdsPessoa.FieldByName('HRS_TRAB_MES').asFloat / 5);
  if (iHorasTrab = 0) then
    iHorasTrab := 1;

  GetValContribIndivAssoc(FCdsPessoa.FieldByName('IDPESSOA').asFloat,
    FCdsPessoa.FieldByName('IDESTAB').asFloat, FListaIdRubContribAssoc,
    ArrayCNPJ_SindContribAssoc, ArrayVal_SindContribAssoc);

  GetValContribIndiv(FCdsPessoa.FieldByName('IDPESSOA').asFloat,
    FCdsPessoa.FieldByName('IDESTAB').asFloat, FListaIdRubContribSind,
    sCNPJ_SindContribSind, dVal_SindContribSind);

  GetValContribIndiv(FCdsPessoa.FieldByName('IDPESSOA').asFloat,
    FCdsPessoa.FieldByName('IDESTAB').asFloat, FListaIdRubContribAssis,
    sCNPJ_SindContribAssis, dVal_SindContribAssis);

  GetValContribIndiv(FCdsPessoa.FieldByName('IDPESSOA').asFloat,
    FCdsPessoa.FieldByName('IDESTAB').asFloat, FListaIdRubContribConf,
    sCNPJ_SindContribConf, dVal_SindContribConf);

  // Alterado por FHBS - SOL: 152876 KTN: 1146010 - Se não existir valor não é para sair o CNPJ
  if (ArrayVal_SindContribAssoc[1] = 0) then ArrayCNPJ_SindContribAssoc[1] := '';
{  // Caso não exista contribuição associativa mas existe Contribuição Sindical, informar o
  // CNPJ do Sindicato da Contribuição Sindical. O GDRAIS necessita desta informação.
  if (ArrayCNPJ_SindContribAssoc[1] = '') then
    if (dVal_SindContribSind > 0) then
      ArrayCNPJ_SindContribAssoc[1] := sCNPJ_SindContribSind
    else
    if (dVal_SindContribAssis > 0) then
      ArrayCNPJ_SindContribAssoc[1] := sCNPJ_SindContribAssis
    else
    if (dVal_SindContribConf > 0) then
      ArrayCNPJ_SindContribAssoc[1] := sCNPJ_SindContribConf;}
  // Fim - Alterado por FHBS - SOL: 152876 KTN: 1146010

  // Incrementar o número de Funcionários
  Inc(FNumPessoas);
  // Incrementar o número de registros
  Inc(FNumRegistroAtual);

  Result :=
    // 01 (001 até 006 / tam. 006) Número do registro no arquivo
    fValidaDados('N', IntToStr(FNumRegistroAtual), 6)+
    // 02 (007 até 020 / tam. 014) Inscrição CGC/CNPJ/CEI do estabelecimento
    fValidaDados('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14)+
    // 03 (021 até 022 / tam. 002) Prefixo do estabelecimento
    '00'+
    // 04 (023 até 023 / tam. 001) Tipo do registro
    '2'+
    // 05 (024 até 034 / tam. 011) PIS/PASEP
    fValidaDados('N', FCdsPessoa.FieldByName('PIS').asString, 11)+
    // 06 (035 até 086 / tam. 052) Nome do Empregado
    fValidaDados('*', FCdsPessoa.FieldByName('EMPREGADO').asString, 52)+
    // 07 (087 até 094 / tam. 008) Data de Nascimento
    fValidaDados('N', TiraBarra(FCdsPessoa.FieldByName('DATANASC').asString), 8)+
    // 08 (095 até 096 / tam. 002) Nacionalidade
    fValidaDados('N', FCdsPessoa.FieldByName('NACIONALIDADE').asString, 2)+
    // 09 (097 até 100 / tam. 004) Ano de chegada ao país
    fValidaDados('N', FCdsPessoa.FieldByName('ANOCHEGADA').asString, 4)+
    // 10 (101 até 102 / tam. 002) Grau de instrução
    fValidaDados('N', FCdsPessoa.FieldByName('GRAU_INSTR').asString, 2)+
    // 11 (103 até 113 / tam. 011) CPF
    fValidaDados('N', FCdsPessoa.FieldByName('CPF').asString, 11)+
    // 12 (114 até 121 / tam. 008) Número da CTPS
    Val_CTPS(1, 8, Trim(FCdsPessoa.FieldByName('CTPS').asString))+
    // 13 (122 até 126 / tam. 005) Série da CTPS
    Val_CTPS(9, 5, Trim(FCdsPessoa.FieldByName('CTPS').asString))+
    // 14 (127 até 134 / tam. 008) Data de admissão/transferência
    fValidaDados('N', TiraBarra(FCdsPessoa.FieldByName('DATA_ADMISSAO').asString), 8)+
    // 15 (135 até 136 / tam. 002) Tipo de admissão/transferência
    //fValidaDados('N', FCdsPessoa.FieldByName('TIPO_ADMISSAO').asString, 1)+ // Edilaine - SOL 172250 - KTN 1547587 - comentei
    fValidaDados('N', FCdsPessoa.FieldByName('TIPO_ADMISSAO').asString, 2)+   // Edilaine - SOL 172250 - KTN 1547587
    // 16 (137 até 145 / tam. 009) Salário Contratual
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('VAL_SAL_CONTRATUAL').asFloat), 9)+
    // 17 (146 até 146 / tam. 001) Tipo de Salário Contratual
    fValidaDados('N', FCdsPessoa.FieldByName('TIPO_PAGAMENTO').asString, 1)+
    // 18 (147 até 148 / tam. 002) Horas Semanais
    fValidaDados('N', IntToStr(iHorasTrab), 2)+
    // 19 (149 até 154 / tam. 006) CBO
    fValidaDados('N', FCdsPessoa.FieldByName('CBO').asString, 6)+
    // 20 (155 até 156 / tam. 002) Código do Vínculo Empregatício
    fValidaDados('N', FCdsPessoa.FieldByName('VINC_EMPREG').asString, 2)+
    // 21 (157 até 158 / tam. 002) Código do desligamento/transferência
    fValidaDados('N', FCdsPessoa.FieldByName('TIPO_DEMISSAO').asString, 2)+
    // 22 (159 até 162 / tam. 004) Data de desligamento/transferência
    fValidaDados('N', TiraBarra(FCdsPessoa.FieldByName('DATA_DEMISSAO').asString), 4)+
    // 23 (163 até 171 / tam. 009) Remuneração JANEIRO
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('REM_MES_01').asFloat), 9)+
    // 24 (172 até 180 / tam. 009) Remuneração FEVEREIRO
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('REM_MES_02').asFloat), 9)+
    // 25 (181 até 189 / tam. 009) Remuneração MARÇO
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('REM_MES_03').asFloat), 9)+
    // 26 (190 até 198 / tam. 009) Remuneração ABRIL
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('REM_MES_04').asFloat), 9)+
    // 27 (199 até 207 / tam. 009) Remuneração MAIO
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('REM_MES_05').asFloat), 9)+
    // 28 (208 até 216 / tam. 009) Remuneração JUNHO
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('REM_MES_06').asFloat), 9)+
    // 29 (217 até 225 / tam. 009) Remuneração JULHO
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('REM_MES_07').asFloat), 9)+
    // 30 (226 até 234 / tam. 009) Remuneração AGOSTO
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('REM_MES_08').asFloat), 9)+
    // 31 (235 até 243 / tam. 009) Remuneração SETEMBRO
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('REM_MES_09').asFloat), 9)+
    // 32 (244 até 252 / tam. 009) Remuneração OUTUBRO
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('REM_MES_10').asFloat), 9)+
    // 33 (253 até 261 / tam. 009) Remuneração NOVEMBRO
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('REM_MES_11').asFloat), 9)+
    // 34 (262 até 270 / tam. 009) Remuneração DEZEMBRO
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('REM_MES_12').asFloat), 9)+
    // 35 (271 até 279 / tam. 009) Remuneração do 13º Adiantamento
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('VAL_1_PARC_13').asFloat), 9)+
    // 36 (280 até 281 / tam. 002) Mês de Pagamento do 13º Adiantamento
    PoeZero(FCdsPessoa.FieldByName('MES_1_PARC_13').asInteger)+
    // 37 (282 até 290 / tam. 009) Remuneração do 13º Final
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('VAL_2_PARC_13').asFloat), 9)+
    // 38 (291 até 292 / tam. 002) Mês de Pagamento do 13º Final
    PoeZero(FCdsPessoa.FieldByName('MES_2_PARC_13').asInteger)+
    // 39 (293 até 293 / tam. 001) Raça/Cor
    FCdsPessoa.FieldByName('COR').asString+
    // 40 (294 até 294 / tam. 001) Indicador de Deficiência
    // 1 -> Sim
    // 2 -> Não
    IFF(FCdsPessoa.FieldByName('FLGDEFICIENTE').asString='2', '2', '1')+
    // 41 (295 até 295 / tam. 001) Tipo de Deficiência
    GetCodTipoDeficiencia+
    // 42 (296 até 296 / tam. 001) Indicador de Alvará Judicial para Trabalhar
    // 1 - Sim
    // 2 - Não
    '2'+
    // 43 (297 até 305 / tam. 009) Aviso Prévio Indenizado
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('VAL_AVISO_PREVIO').asFloat), 9)+
    // 44 (306 até 306 / tam. 001) Sexo
    IFF(FCdsPessoa.FieldByName('SEXO').asString='M', '1', '2')+
    // 45 (307 até 308 / tam. 002) Motivo primeiro afastamento
    fValidaDados('N', GetAfastamento(1).Motivo, 2)+
    // 46 (309 até 312 / tam. 004) Data inicial do primeiro afastamento
    fValidaDados('N', GetAfastamento(1).DataInicial, 4)+
    // 47 (313 até 316 / tam. 004) Data final do primeiro afastamento
    fValidaDados('N', GetAfastamento(1).DataFinal, 4)+
    // 48 (317 até 318 / tam. 002) Motivo segundo afastamento
    fValidaDados('N', GetAfastamento(2).Motivo, 2)+
    // 49 (319 até 322 / tam. 004) Data inicial do segundo afastamento
    fValidaDados('N', GetAfastamento(2).DataInicial, 4)+
    // 50 (323 até 326 / tam. 004) Data final do segundo afastamento
    fValidaDados('N', GetAfastamento(2).DataFinal, 4)+
    // 51 (327 até 328 / tam. 002) Motivo terceiro afastamento
    fValidaDados('N', GetAfastamento(3).Motivo, 2)+
    // 52 (329 até 332 / tam. 004) Data inicial do terceiro afastamento
    fValidaDados('N', GetAfastamento(3).DataInicial, 4)+
    // 53 (333 até 336 / tam. 004) Data final do terceiro afastamento
    fValidaDados('N', GetAfastamento(3).DataFinal, 4)+
    // 54 (337 até 339 / tam. 003) Quantidade de dias de afastamento
    fValidaDados('N', FCdsPessoa.FieldByName('QUANT_DIAS_AFAST').asString, 3)+
    // 55 (340 até 347 / tam. 008) Férias Indenizadas
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('VAL_FERIAS_INDENIZ').asFloat), 8)+
    // 56 (348 até 355 / tam. 008) Banco de Horas
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('VAL_BANCO_HORAS').asFloat), 8)+
    // 57 (356 até 357 / tam. 002) Quantidade de meses que houve Banco de Horas
    fValidaDados('N', FCdsPessoa.FieldByName('QUANT_BANCO_HORAS').asString, 2)+
    // 58 (358 até 365 / tam. 008) Dissídio Coletivo pago na Rescisão
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('VAL_DISSIDIO').asFloat), 8)+
    // 59 (366 até 367 / tam. 002) Quantidade de meses que houve Dissídio Coletivo pago na Rescisão
    fValidaDados('N', FCdsPessoa.FieldByName('QUANT_DISSIDIO').asString, 2)+
    // 60 (368 até 375 / tam. 008) Gratificações pagas na Rescisão
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('VAL_GRATIF').asFloat), 8)+
    // 61 (376 até 377 / tam. 002) Quantidade de meses que houve Gratificações pagas na Rescisão
    fValidaDados('N', FCdsPessoa.FieldByName('QUANT_GRATIF').asString, 2)+
    // 62 (378 até 385 / tam. 008) Multa Rescisória
    fValidaDados('N', FormatFloat('#########0.00', FCdsPessoa.FieldByName('VAL_MULTA_RESC').asFloat), 8)+
    // 63 (386 até 399 / tam. 014) CNPJ do sindicato beneficiado pela contribuição
    // associativa (PRIMEIRA OCORRÊNCIA)
    fValidaDados('N', ArrayCNPJ_SindContribAssoc[1], 14)+
    // 64 (400 até 407 / tam. 008) Valor total acumulado no ano-base e repassado pelo
    // estabelecimento para o sindicato beneficiado pela contribuição associativa
    // (PRIMEIRA OCORRÊNCIA)
    fValidaDados('N', FormatFloat('#########0.00', ArrayVal_SindContribAssoc[1]), 8)+
    // 65 (408 até 421 / tam. 014) CNPJ do sindicato beneficiado pela contribuição
    // associativa (SEGUNDA OCORRÊNCIA)
    fValidaDados('N', ArrayCNPJ_SindContribAssoc[2], 14)+
    // 66 (422 até 429 / tam. 008) Valor total acumulado no ano-base e repassado pelo
    // estabelecimento para o sindicato beneficiado pela contribuição associativa
    // (SEGUNDA OCORRÊNCIA)
    fValidaDados('N', FormatFloat('#########0.00', ArrayVal_SindContribAssoc[2]), 8)+
    // 67 (430 até 443 / tam. 014) CNPJ da entidade sindical patronal beneficiada pela
    // contribuição sindical
    fValidaDados('N', sCNPJ_SindContribSind, 14)+
    // 68 (444 até 451 / tam. 008) Valor total acumulado no ano-base e repassado pelo
    // estabelecimento para a entidade sindical beneficiada pela contribuição sindical
    fValidaDados('N', FormatFloat('#########0.00', dVal_SindContribSind), 8)+
    // 69 (452 até 465 / tam. 014) CNPJ da entidade sindical patronal beneficiada pela
    // contribuição assistencial
    fValidaDados('N', sCNPJ_SindContribAssis, 14)+
    // 70 (466 até 473 / tam. 008) Valor total acumulado no ano-base e repassado pelo
    // estabelecimento para a entidade sindical beneficiada pela contribuição assistencial
    fValidaDados('N', FormatFloat('#########0.00', dVal_SindContribAssis), 8)+
    // 71 (474 até 487 / tam. 014) CNPJ da entidade sindical patronal beneficiada pela
    // contribuição confederativa
    fValidaDados('N', sCNPJ_SindContribConf, 14)+
    // 72 (488 até 495 / tam. 008) Valor total acumulado no ano-base e repassado pelo
    // estabelecimento para a entidade sindical beneficiada pela contribuição confederativa
    fValidaDados('N', FormatFloat('#########0.00', dVal_SindContribConf), 8)+
    // 73 (496 até 502 / tam. 007) Código do município onde a pessoa trabalha
    fValidaDados('N', FCdsResp.FieldByName('COD_MUNICIPIO').asString, 7)+
    // 74 (503 até 505 / tam. 003) Carga Horária - JANEIRO
    GetHoraExtraMes(1)+ //GetCargaHorariaMes(1)+
    // 75 (506 até 508 / tam. 003) Cara Horária - FEVEREIRO
    GetHoraExtraMes(2)+ //GetCargaHorariaMes(2)+
    // 76 (509 até 511 / tam. 003) Cara Horária - MARÇO
    GetHoraExtraMes(3)+ //GetCargaHorariaMes(3)+
    // 77 (512 até 514 / tam. 003) Cara Horária - ABRIL
    GetHoraExtraMes(4)+ //GetCargaHorariaMes(4)+
    // 78 (515 até 517 / tam. 003) Cara Horária - MAIO
    GetHoraExtraMes(5)+ //GetCargaHorariaMes(5)+
    // 79 (518 até 520 / tam. 003) Cara Horária - JUNHO
    GetHoraExtraMes(6)+ //GetCargaHorariaMes(6)+
    // 80 (521 até 523 / tam. 003) Cara Horária - JULHO
    GetHoraExtraMes(7)+ //GetCargaHorariaMes(7)+
    // 81 (524 até 526 / tam. 003) Cara Horária - AGOSTO
    GetHoraExtraMes(8)+ //GetCargaHorariaMes(8)+
    // 82 (527 até 529 / tam. 003) Cara Horária - SETEMBRO
    GetHoraExtraMes(9)+ //GetCargaHorariaMes(9)+
    // 83 (530 até 532 / tam. 003) Cara Horária - OUTUBRO
    GetHoraExtraMes(10)+ //GetCargaHorariaMes(10)+
    // 84 (533 até 535 / tam. 003) Cara Horária - NOVEMBRO
    GetHoraExtraMes(11)+ //GetCargaHorariaMes(11)+
    // 85 (536 até 538 / tam. 003) Cara Horária - DEZEMBRO
    GetHoraExtraMes(12)+ //GetCargaHorariaMes(12)+
    // 86 (539 até 539 / tam. 001) Sindicalizado ?
    // 1 -> Sim
    // 2 -> Não
    // Alterado por FHBS - SOL: 152876 KTN: 1146010
    //IFF((ArrayCNPJ_SindContribAssoc[1] <> '') or (sCNPJ_SindContribSind <> '') or
    //    (sCNPJ_SindContribAssis <> '') or (sCNPJ_SindContribConf <> ''), '1', '2')+
    // Alterado por Edilaine - SOL 172250 - KTN 1547587
    // IFF(( (ArrayCNPJ_SindContribAssoc[1] <> '') and (ArrayVal_SindContribAssoc[1] <> 0) ), '1', '2')+
    '2'+ // Edilaine - SOL 172250 - KTN 1547587
    // 87 (540 até 551 / tam. 012) Reservado para informação de uso exclusivo da empresa
    //fValidaDados('*', FCdsPessoa.FieldByName('MATRICULA').asString, 12);

    //Ewerton Beltramini - 31/03/2021 - SIG114711 -- Inicio...
    '2222' +  //; //TAES - SIG90393
    Replicate(' ', 30) +
    Replicate(' ', 3) +
    Replicate(' ', 8);
    //Ewerton Beltramini - 31/03/2021 - SIG114711 -- fim.

  FGerouPessoa := true;
end;

function TCtrlParamRAISMagnetico.GerarRegistro9: string;
begin
  // Incrementar o número de registros
  Inc(FNumRegistroAtual);

  Result :=
    // 01 (001 até 006 / tam. 006) Número do registro no arquivo
    fValidaDados('N', IntToStr(FNumRegistroAtual), 6)+
    // 02 (007 até 020 / tam. 014) Inscrição CGC/CNPJ/CEI do último estabelecimento do arquivo
    fValidaDados('N', FCNPJPrimeiroEstab, 14)+
    // 03 (021 até 022 / tam. 002) Prefixo do último estabelecimento do arquivo
    '00'+
    // 04 (023 até 023 / tam. 001) Tipo do registro
    '9'+
    // 05 (024 até 029 / tam. 006) Número de registros Tipo 1
    fValidaDados('N', IntToStr(FNumEstab), 6)+
    // 06 (030 até 035 / tam. 006) Número de registros Tipo 2
    fValidaDados('N', IntToStr(FNumPessoas), 6)+
    // 07 (036 até 551 / tam. 516) Espaços
    //Replicate(' ', 515);  // Edilaine - SOL 172250 - KTN 1547587 - comentei
    //Ewerton Beltramini - 31/03/2021 - SIG114711 - Incicio...
    //Replicate(' ', 516);  // Edilaine - SOL 172250 - KTN 1547587
    Replicate(' ', 549);
    //Ewerton Beltramini - 31/03/2021 - SIG114711 - Fim.
end;

function TCtrlParamRAISMagnetico.ProcessarGeracao(IdEmpresa: integer; AnoRef: string;
  MesDataBase: integer; ListaTipoContratoSel, ListaIdEstab, ListaIdMotivoAdmSel,
  ListaIdMotivoDemSel, ListaIdMotivoAfastSel, ListaIdMotivoRetorSel: string;
  IdResponsavel: double; EmissaoNormal, ReciboParaEndResponsavel, EncerrAtividades: boolean;
  DataEncerrAtividades: TDate; NumeroProprietarios, IndicadorMicroEmpresa,
  OptanteSimples: integer; ListaIdRubricaRemNormal, ListaIdRubrica1Parc13,
  ListaIdRubrica2Parc13, ListaRubricaSalContratual, {ListaRubricaQuantHorasMensaisHor,}
  ListaRubricaQuantHorasExtras, ListaIdRubricaPAT, ListaIdMotivoResc,
  ListaIdRubricaAvisoPrevio, ListaRubricaFeriasIndeniz, ListaRubricaBancoHoras,
  ListaRubricaDissidio, ListaRubricaGratif, ListaRubricaMultaResc,
  ListaIdRubContribPatronalAssoc, ListaIdRubContribPatronalSind,
  ListaIdRubContribPatronalAssis, ListaIdRubContribPatronalConf, ListaIdRubContribAssoc,
  ListaIdRubContribSind, ListaIdRubContribAssis, ListaIdRubContribConf: string;
  PorcServProp, PorcAdmCoz, PorcRefConv, PorcRefTransp, PorcCestaAlim, PorcAlimConv,
  ValorSalMinAtual: double; DataRetif: TDate; piIdNovoResp: Integer; piParticipaPAT: Integer): boolean;
begin
  try
    Result := false;

    FCdsPessoa := TCMClientDataSet.Create(nil);
    FCdsLoopPessoa := TCMClientDataSet.Create(nil);
    FCdsEstab := TCMClientDataSet.Create(nil);
    FCdsResp := TCMClientDataSet.Create(nil);
    FCdsNovoResp := TCMClientDataSet.Create(nil); //Bruno Bastos - Sol: 129826 - Kintana: 715518
    
    FCds_Remuneracao := TCMClientDataSet.Create(nil);
    FCds_1Parc13 := TCMClientDataSet.Create(nil);
    FCds_2Parc13 := TCMClientDataSet.Create(nil);
    FCds_PAT := TCMClientDataSet.Create(nil);
    FCds_AvisoPrevio := TCMClientDataSet.Create(nil);
    FCds_SalContratual := TCMClientDataSet.Create(nil);
    //FCds_QuantHorasMensaisHor := TCMClientDataSet.Create(nil);
    FCds_QuantHorasExtras := TCMClientDataSet.Create(nil);
    FCds_FeriasIndeniz := TCMClientDataSet.Create(nil);
    FCds_BancoHoras := TCMClientDataSet.Create(nil);
    FCds_Dissidio := TCMClientDataSet.Create(nil);
    FCds_Gratif := TCMClientDataSet.Create(nil);
    FCds_MultaResc := TCMClientDataSet.Create(nil);
    //FCds_Ferias := TCMClientDataSet.Create(nil);
    FCdsContrib := TCMClientDataSet.Create(nil);
    FCdsContribPatronal := TCMClientDataSet.Create(nil);
    FCds_AdmDem := TCMClientDataSet.Create(nil);
    FCdsAfastPessoa := TCMClientDataSet.Create(nil);
    FCdsListaMensagens := TCMClientDataSet.Create(nil);
    FCds_EvolFunc := TCMClientDataSet.Create(nil);
    FCds_UltSalContr := TCMClientDataSet.Create(nil);

    //FCtrlDiasTrab.CdsPessoa := FCdsPessoa;

    FHoraIni := Time;
    FArq.Clear;

    FIdEmpresa := IdEmpresa;
    FAnoRef := AnoRef;
    FMesDataBase := MesDataBase;
    FListaTipoContratoSel := ListaTipoContratoSel;
    FListaIdEstab := ListaIdEstab;
    FListaIdMotivoAdmSel := ListaIdMotivoAdmSel;
    FListaIdMotivoDemSel := ListaIdMotivoDemSel;
    FListaIdMotivoAfastSel := ListaIdMotivoAfastSel;
    FListaIdMotivoRetorSel := ListaIdMotivoRetorSel;
    FIdResponsavel := IdResponsavel;
    FEmissaoNormal := EmissaoNormal;
    FReciboParaEndResponsavel := ReciboParaEndResponsavel;
    FNumeroProprietarios := NumeroProprietarios;
    FIndicadorMicroEmpresa := IndicadorMicroEmpresa;
    FOptanteSimples := OptanteSimples;
    FListaIdRubricaRemNormal := ListaIdRubricaRemNormal;
    FListaIdRubrica1Parc13 := ListaIdRubrica1Parc13;
    FListaIdRubrica2Parc13 := ListaIdRubrica2Parc13;
    FListaIdRubricaPAT := ListaIdRubricaPAT;
    FListaIdMotivoResc := ListaIdMotivoResc;
    FListaIdRubricaAvisoPrevio := ListaIdRubricaAvisoPrevio;
    FListaRubricaSalContratual := ListaRubricaSalContratual;
    //FListaRubricaQuantHorasMensaisHor := ListaRubricaQuantHorasMensaisHor;
    FListaRubricaQuantHorasExtras := ListaRubricaQuantHorasExtras;
    FListaRubricaFeriasIndeniz := ListaRubricaFeriasIndeniz;
    FListaRubricaBancoHoras := ListaRubricaBancoHoras;
    FListaRubricaDissidio := ListaRubricaDissidio;
    FListaRubricaGratif := ListaRubricaGratif;
    FListaRubricaMultaResc := ListaRubricaMultaResc;
    FListaIdRubContribPatronalAssoc := ListaIdRubContribPatronalAssoc;
    FListaIdRubContribPatronalSind := ListaIdRubContribPatronalSind;
    FListaIdRubContribPatronalAssis := ListaIdRubContribPatronalAssis;
    FListaIdRubContribPatronalConf := ListaIdRubContribPatronalConf;
    FListaIdRubContribAssoc := ListaIdRubContribAssoc;
    FListaIdRubContribSind := ListaIdRubContribSind;
    FListaIdRubContribAssis := ListaIdRubContribAssis;
    FListaIdRubContribConf := ListaIdRubContribConf;
    FIdNovoResp := piIdNovoResp; //Bruno Bastos - Sol: 129826 - Kintana: 715518
    FParticipaPAT := piParticipaPAT;  // Edilaine - SOL 172250 - KTN 1547587

    FPorcServProp := PorcServProp;
    FPorcAdmCoz := PorcAdmCoz;
    FPorcRefConv := PorcRefConv;
    FPorcRefTransp := PorcRefTransp;
    FPorcCestaAlim := PorcCestaAlim;
    FPorcAlimConv := PorcAlimConv;
    FValorSalMinAtual := ValorSalMinAtual;
    FEncerrAtividades := EncerrAtividades;

    FIdDocCNPJ := GetIdDocCNPJ;
    //FNumAvisos := 0;
    //FNumInconsist := 0;

    if (DataEncerrAtividades > 0) then
      FDataEncerrAtividades := DateToStr(DataEncerrAtividades)
    else
      FDataEncerrAtividades := '';

    if (DataRetif > 0) then
      FDataRetif := DateToStr(DataRetif)
    else
      FDataRetif := '';

    try
      // Verificar se algum Código RAIS não foi preenchido
      if not(VerificarInconsisCodRAIS) or
      // Abrir queries principais
         not(AbrirQueryEstabelecimento) or not(AbrirQueryResponsavel) or
         not(AbrirQueryPessoa) then
      begin
        Result := true;
        raise Exception.Create(MessageInfo);
      end;

      FCdsPessoa.First;

      if not(PrepararDs_AdmDem) or not(PrepararDs_EvolFunc) or
         not(PrepararDs_Remuneracao) or not(PrepararDs_1Parc13) or
         not(PrepararDs_2Parc13) or not(PrepararDs_PAT) or
         not(PrepararDs_AvisoPrevio) or not(PrepararDs_SalContratual) or
         {not(PrepararDs_QuantHorasMensaisHor)} not(PrepararDs_QuantHorasExtras) or
         not(PrepararDs_FeriasIndeniz) or
         not(PrepararDs_BancoHoras) or not(PrepararDs_Dissidio) or
         not(PrepararDs_Gratif) or not(PrepararDs_MultaResc) or
         {not(PrepararDs_Ferias) or} not(PrepararDs_UltSalContr) then
        raise Exception.Create(MessageInfo);

      MontarQueriesEmBranco;

      // Os registros têm que ser ordenados pelo IDPESSOA e Datas de Admissão e Demissão
      FCdsPessoa.AddIndex('Indice', 'IDPESSOA;DATA_ADMISSAO;DATA_DEMISSAO', []);
      FCdsPessoa.IndexDefs.Update;
      FCdsPessoa.IndexName := 'Indice';

      if not(AbrirQueryContrib) or not(AbrirQueryContribPatronal) then
        raise Exception.Create(MessageInfo);

      // Processar dados para a geração do arquivo
      IncProgresso('', CMTranslate('Identificando Pessoas...'));

      // Identificar a situação de cada pessoa durante o Ano de Referência
      if not(IdentificarPessoas) then
        raise Exception.Create(MessageInfo);

      // Excluir as pessoas que foram afastadas anteriormente ao Ano-Base atual e
      // ainda permanecem afastadas.  
      //Excluir_Pessoas_AfastAnoAnterior;

      //MontarAvisoFinal;

      // Processar dados para a geração do arquivo
      IncProgresso('', CMTranslate('Processando Dados...'));

      FCdsPessoa.Filtered := false;

      // Os registros têm que ser ordenados pelo PIS
      if (FCdsPessoa.IndexDefs.IndexOf('Indice') > 0) then
        FCdsPessoa.DeleteIndex('Indice');
      FCdsPessoa.AddIndex('Indice', 'PIS', []);
      FCdsPessoa.IndexDefs.Update;

      // **************************************************************
      // Registro Tipo '0' - Informações do estabelecimento responsável
      // **************************************************************
      FArq.Add(GerarRegistro0);

      // LOOP para gerar o subarquivo de todos os estabelecimentos selecionados
      FNumPessoas := 0;
      FNumEstab := 0;
      FCdsEstab.First;
      FCNPJPrimeiroEstab := '';
      FGerouPessoa := false;
      repeat
        // Filtrar pessoas do Estabelecimento atual
        FCdsPessoa.Filter := 'IDESTAB = ' + FCdsEstab.FieldByName('IDESTAB').asString;
        FCdsPessoa.Filtered := true;
        if not(FCdsPessoa.IsEmpty) then
        begin
          FCNPJPrimeiroEstab := FCdsEstab.FieldByName('INSCRICAO').asString;
          // **************************************************
          // Registro Tipo '1' - Informações do Estabelecimento
          // **************************************************
          FArq.Add(GerarRegistro1);

          // ********************************
          // Registro Tipo '2' - Funcionários
          // ********************************
          FCdsPessoa.First;
          repeat
            FArq.Add(GerarRegistro2);
            FCdsPessoa.Next;
          until (FCdsPessoa.EOF);
        end;
        FCdsEstab.Next;
      until (FCdsEstab.EOF);

      // **********************
      // '9' - Registro Trailer
      // **********************
      FArq.Add(GerarRegistro9);

      if not(FGerouPessoa) then
      begin
        FArq.Clear;
        MessageInfo := CMTranslateMsg(MSG_GERACAO_SEM_PESSOAS,
          [FAnoRef, CR_LF, CR_LF, CR_LF, CR_LF, CR_LF, CR_LF, CR_LF]);
      end
      else
      if ((GetNumMensagensTipo(tpAviso) + GetNumMensagensTipo(tpInconsist)) = 0) then
        MessageInfo := CMTranslateMsg(MSG_GERACAO_OK, [FAnoRef])
      else
      if (GetNumMensagensTipo(tpAviso) > 0) and (GetNumMensagensTipo(tpInconsist) = 0) then
        MessageInfo := CMTranslateMsg(MSG_GERACAO_AVISO, [FAnoRef])
      else
      if (GetNumMensagensTipo(tpAviso) = 0) and (GetNumMensagensTipo(tpInconsist) > 0) then
        MessageInfo := CMTranslateMsg(MSG_GERACAO_INCONSIST, [FAnoRef])
      else
      //if ((GetNumMensagensTipo(tpAviso) + GetNumMensagensTipo(tpInconsist)) > 0) then
        MessageInfo := CMTranslateMsg(MSG_GERACAO_AVISO_INCONSIST, [FAnoRef]);

      Result := true;
    except
      on E: Exception do
      begin
        if (Result) then
          MessageInfo := CMTranslate('A RAIS não pode ser gerada devido a falta de informações nos cadastros.')
        else
        begin
          IncProgresso('', '', 0, false, CMTranslateMsg(MSG_GERACAO_ERRO, [FAnoRef]));
          MessageInfo := E.Message;
        end;
        FArq.Clear;
      end;
    end;

    // Apresentação das mensagens de erro e inconsistência somente da empresa proprietária atual.
    if not(FCdsListaMensagens.IsEmpty) then
    begin
      FCdsListaMensagens.Filter := 'IDEMPRESA = ' + IntToStr(FIdEmpresa);
      FCdsListaMensagens.Filtered := true;

      FCdsListaMensagens.First;
      while not(FCdsListaMensagens.EOF) do
      begin
        IncProgresso('', '', 0, false, FCdsListaMensagens.FieldByName('MENSAGEM').asString);
        FCdsListaMensagens.Next;
      end;

      FCdsListaMensagens.Filter := '';
      FCdsListaMensagens.Filtered := false;
    end;

    IncProgresso(GetTempoDecorrido);
    FTempoDecorridoTotal := GetTempoDecorrido(true);
  finally
    //FCtrlDiasTrab.CdsPessoa := nil;
    FreeAndNil(FCdsPessoa);
    FreeAndNil(FCdsLoopPessoa);
    FreeAndNil(FCdsEstab);
    FreeAndNil(FCdsResp);
    FreeAndNil(FCdsNovoResp); //Bruno Bastos - Sol: 129826 - Kintana: 715518

    FreeAndNil(FCds_Remuneracao);
    FreeAndNil(FCds_1Parc13);
    FreeAndNil(FCds_2Parc13);
    FreeAndNil(FCds_PAT);
    FreeAndNil(FCds_AvisoPrevio);
    FreeAndNil(FCds_SalContratual);
    //FreeAndNil(FCds_QuantHorasMensaisHor);
    FreeAndNil(FCds_QuantHorasExtras);
    FreeAndNil(FCds_FeriasIndeniz);
    FreeAndNil(FCds_BancoHoras);
    FreeAndNil(FCds_Dissidio);
    FreeAndNil(FCds_Gratif);
    FreeAndNil(FCds_MultaResc);
    //FreeAndNil(FCds_Ferias);
    FreeAndNil(FCdsContrib);
    FreeAndNil(FCdsContribPatronal);
    FreeAndNil(FCds_AdmDem);
    FreeAndNil(FCdsAfastPessoa);
    FreeAndNil(FCdsListaMensagens);
    FreeAndNil(FCds_EvolFunc);
    FreeAndNil(FCds_UltSalContr);
  end;
end;

end.
