unit uMsgRH;

interface

uses uFuncoesUteisRH;

// Indicação do Módulo
// M0021 = Indica que se refere ao módulo Folha de Pagamento

// Indicação da Tela
// T0001 = Tela de Recibo de Pagamento a Terceiros
// T0002 = Tela de Geração da Folha de Pagamento
// T0003 = Tela de Geração da Rescisão  

const
  // ********** MENSAGENS GENÉRICAS ********** //
  // Usado para Mensagens de erro
  MSG_ERRO = CR_LF+ 'Erro:' +CR_LF;
  MSG_ERRO_SEL_DADOS_PESSOAS = 'Não há dados a serem processados para esta competência ou' +CR_LF+ 'Dados Cadastrais incompletos.';
  MSG_ERRO_GERACAO_CAP = 'Ocorreu um erro durante o processamento da integração.' +CR_LF+ 'Consulte Resultado da geração para maiores detalhes.';
  MSG_SEL_DADOS_PESSOAS = 'Selecionando dados das Pessoas...';
  MSG_PROCESSANDO = 'Processando informações...';
  MSG_GRAVANDO_CAP = 'Gravando dados da Integração com o Contas a Pagar...';
  MSG_GERACAO_CAP_OK = 'Contas a Pagar efetuada com sucesso.' +CR_LF+ 'Documento(s) Nº.: ';

  // ********** RECIBO DE PAGAMENTO A TERCEIROS ********** //
  MSG_M0021T0001_ERRO_SEL_DADOS_RUBRICA = 'Parametrização incorreta para a Rubrica Nº ';

  // ********** GERAÇÃO DA FOLHA DE PAGAMENTO ********** //
  // Mensagens de erro
  MSG_M0021T0002_ERRO_CRIACAO_CAP = '* Criação do Documento CAP.' + MSG_ERRO;
  MSG_M0021T0002_ERRO_GERACAO_PAG_ELETRONICO = '* Geração do Pagamento Eletrônico.';
  MSG_M0021T0002_ERRO_ALTERACAO_RUBRICA = '* Não foi possível alterar a Rubrica Nº ';
  MSG_M0021T0002_ERRO_ALTERACAO_NUM_OCORR = '* Alteração do Número de Ocorrências da Rubrica Nº ';
  MSG_M0021T0002_ERRO_ALOCACAO_OBJETOS = '* Alocação de memória para os objetos' +CR_LF+ 'envolvidos no processo de Geração da Rescisão.' + MSG_ERRO;
  MSG_M0021T0002_ERRO_LIBERACAO_OBJETOS = '* Liberação de memória para os objetos' +CR_LF+ 'envolvidos no processo de Geração da Rescisão.' + MSG_ERRO;
  MSG_M0021T0002_ERRO_EXCLUSAO_PREVIA = '* Na eliminação da Prévia anterior.' + MSG_ERRO;
  MSG_M0021T0002_ERRO_PREPARO_RUB_ESPECIAIS = '* Ao carregar a lista das Rubricas Especiais.' + MSG_ERRO;
  MSG_M0021T0002_ERRO_ESCREVE_RUB = '* Ao gravar Histórico de Rubricas Salariais.' + MSG_ERRO;
  MSG_M0021T0002_ERRO_GERACAO = 'Ocorreu um erro na Geração da Folha de Pagamento.' +CR_LF;
  MSG_M0021T0002_ERRO_SEM_PESSOAS = '* Não foi possível selecionar os dados da(s) Pessoa(s).' +CR_LF+ 'Verifique-os e tente novamente.';
  MSG_M0021T0002_ERRO_SELECAO_PESSOAS = '* Na seleção dos dados da(s) Pessoa(s).' + MSG_ERRO;
  MSG_M0021T0002_ERRO_ALIMENTAR_PREVIA = '* Não foi possível alimentar a Prévia.' + MSG_ERRO;
  MSG_M0021T0002_ERRO_PREPARO_FERIAS = '* Ao preparar os dados das férias do Empregado ' +CR_LF;
  MSG_M0021T0002_ERRO_PREPARO_LANC_SEM_INCID = '* Ao preparar Lançamentos sem incidência.' + MSG_ERRO;
  MSG_M0021T0002_ERRO_PREPARO_RUB_DEPEND_REGRA = '* Ao preparar Rubricas dependentes somente de Regras/Formas de Cálculo.' + MSG_ERRO;
  MSG_M0021T0002_ERRO_CALC_RETROATIVO = '* No cálculo do Retroativo.' + MSG_ERRO;
  // Mensagens de processamento
  MSG_M0021T0002_NAO_GRAVA_CAP = '[AVISO] A integração com o Contas a Pagar não foi efetuada.' +CR_LF+ 'Verifique se alguma informação requerida está faltando.' +CR_LF+ 'Ex: Favorecido não indicado na Parametrização das Rubricas.' + CR_LF;
  MSG_M0021T0002_NAO_GRAVA_PAG_ELETRONICO = '[AVISO] O Arquivo de Pagamento Eletrônico não foi criado.' +CR_LF+ 'Verifique se possui acesso à pasta indicada para gravação' +CR_LF+ 'ou alguma informação requerida está faltando.' +CR_LF+ 'Ex: Associação da Rubrica CLT' + CR_LF;
  MSG_M0021T0002_GERACAO_OK = 'Geração da Folha de Pagamento efetuada com sucesso.';
  MSG_M0021T0002_PROCESSANDO = 'Processando dados da Pessoa indicada abaixo. Aguarde...';
  MSG_M0021T0002_SEL_DADOS_INTEGRA = 'Selecionando dados necessários à integração...';
  MSG_M0021T0002_PREPARO_RUB_ESPECIAIS = 'Preparando Rubricas Especiais...';
  MSG_M0021T0002_INICIO_PROCESSO = 'Iniciando Processando...';
  MSG_M0021T0002_APAGANDO_PREVIA = 'Apagando Prévia...';
  MSG_M0021T0002_GRAVANDO_PAG_ELETRONICO = 'Gravando dados do Pagamento Eletrônico...';

  // ********** GERAÇÃO DA RESCISÃO ********** //
  // Mensagens de erro
  MSG_M0021T0003_ERRO_GERACAO = 'Ocorreu um erro na Geração da Rescisão.' +CR_LF;
  MSG_M0021T0003_ERRO_SEM_DEMITIDOS_NO_PERIODO = '* Não Há Demitidos no Período Indicado.';
  MSG_M0021T0003_ERRO_LANC_PENDENTES = '* Na leitura dos Lançamentos Pendentes no mês da rescisão.' + MSG_ERRO;
  // Mensagens de processamento
  MSG_M0021T0003_GERACAO_OK = 'Geração da Rescisão efetuada com sucesso.';
  MSG_M0021T0003_PROCESSANDO = 'Processando Rescisão...';

implementation

end.
