unit UContribuicaoPrev;
{ Unit com as rotinas relativas às Contribuições Previdenciárias }

interface

uses SysUtils,wwQuery,UIntegraBack;

// *****************************************************************************
// Função CALCDATAFINAL - Calcula a data final de uma contribuicao
//                        levando em consideracao o numero de parcelas e
//                        a periodicidade
// Parâmetros : dDataInicio   = data de início da contribuicao
//              sQtdeParcelas = numero de parcelas no qual as contribuicoes serão pagas
//              sQtdeMeses    = numero de meses da periodicidade de pagamento
// Retorno    : -1 = data de inicio inválida
//              -2 = no. de meses inválido (para pagamento único deve ser ZERO)
//              Data(dd/mm/yyyy) = data final calculada
// *****************************************************************************
function CalcDataFinal(dDataInicio : TDateTime; sQtdeParcelas,sQtdeMeses : string) : string;

// *****************************************************************************
// Função BUSCAINFFINANCCONTRIB - Busca nos diversos níveis de tabela os campos relativos
//                        à contabilidade, contas a pagar ou contas a receber seguindo
//                        a seguinte ordem :
//                          CONTRIBPREVPARTP/CONTRIBPREVPATRO (a nivel de participante/patrocinadora)
//                          CONTPLANPATRO (a nivel de plano/patrocinadora)
//                          CONTPREV      (a nivel de plano)
// Parâmetros : sSQL       = string para a funcao adicionar o valor do campo encontrado (ou nulo)
//              sBrancos   = string para a funcao adicionar o nome do campo caso ele esteja em branco
//                           em todos os níveis
//              sValorEncontrado = valor encontrado
//              sNomeCampo = nome físico do campo a procurar nas tabelas
//              sValorCampo = valor do campo caso a funcao que chama já saiba
//              cTipo      = tipo do campo (N - Numérico, S - string)
//              pIdPessJur = identificador da patrocinadora
//              pIdPlanoPrev = identificador do plano previdenciario
//              pIdContrib   = identificador da contribuicao
// Retorno    : True = encontrou o valor
//              False = nao encontrou o valor
// *****************************************************************************
function BuscaInfFinancContrib(var sSQL,sBrancos,sValorEncontrado : string; sNomeCampo,sValorCampo : string; cTipo : char;
                               pIdPessJur,pIdPlanoPrev,pIdContrib, piIdContribAnt : integer ) : boolean;


// *****************************************************************************
// Função GERALOTE -  Gera o número do próximo lote e insere na tabela CTRLINTERFACE
//                    conforme os parâmetros passados
// Parâmetros :  idPatro        = identificador da patrocinadora (obrigatorio)
//               bGravaLote     = indica se é para a própria rotina gravar o lote ou
//                                se ela deve apenas retornar o numero do lote
//               sMesReferencia = mes de referencia da geracao do lote
//               sTipo          = tipo (P = Previdenciario,...)
//               sDescricao     = descricao do lote (não obrigatorio)
//               sNormalAtraso  = indica se é Normal(N), Atraso(A) ou Devolucao(D)
//               sFlgPreparado  = indica se o lote foi preparado ('1', '0', ou '')
//               sFlgIdaTmp     = indica se o lote foi para o ccp ('1', '0', ou '')
//               sFlgVoltaTmp   = indica se o lote foi lido de volta do ccp ('1', '0', ou '')
//               sFlgIdaInterface = indica se o lote foi do ccp para o banco ou interface ('1', '0', ou '')
//               sFlgVoltaInterface = indica se o lote voltou do banco ou interface para ccp ('1', '0', ou '')
//               sDataPreparo   = data que o lote foi preparado, se foi (nao obrigatorio)
//               sDataIdaTmp    = data que o lote foi para o ccp (nao obrigatorio)
//               sDataVoltaTmp  = data que o lote foi lido de volta do ccp (nao obrigatorio)
//               sDataIdaInterface = data que o lote foi do ccp para o banco ou interface (nao obrigatorio)
//               sDataVoltaInterface = data que o lote voltou do banco ou interface para ccp (nao obrigatorio)
// Retorno    : -1     = houve algum erro
//              número = número do lote gerado
// *****************************************************************************
function GeraLOTE(idPatro : integer; bGravaLote : boolean; sMesReferencia,sTipo,sDescricao,sAtrasoDevol,
                  sFlgPreparado,sFlgIdaTmp, sFlgVoltaTmp, sFlgIdaInterface,sFlgVoltaInterface,
                  sDataPreparo,sDataIdaTmp,sDataVoltaTmp,sDataIdaInterface,sDataVoltaInterface : string;
                  iTotalReg:Integer;sValorTotal:Double) : integer;
                                    
// *****************************************************************************
// Função ATUALIZACTRLINTERFACE -  Atualiza a ctrl de interface
//                    conforme os parâmetros passados
// Parâmetros :  idLote         = identificador do lote
//               sFlagAtu       = nome fisico do flag a atualizar
//               sValorFlag     = valor a gravar no flag
//               sDataAtu       = nome fisico da data a atualizar
//               sValorData     = valor a gravar na data
// Retorno    : True = encontrou o valor
//              False = nao encontrou o valor
// *****************************************************************************
function AtualizaCTRLINTERFACE(idLote : integer; sFlagAtu, sValorFlag, sDataAtu,
                               sValorData : string) : boolean;

// *****************************************************************************
// Função CALCULANUMPARCELA -  Calcula o número da próxima parcela de uma contribuicao
//                             que um determinado participante irá pagar
// Parâmetros :  sMesReferencia = mes de referencia da cobranca da contribuicao
//               piIdPessJur      = identificador da patrocinadora
//               piIdPlanoPrev    = identificador do plano previdenciario
//               piIdPessoa       = identificador do participante
//               piSeqProposta    = identificador da proposta
//               piIdContribuicao = identificador da contribuicao
// Retorno    : -1     = houve algum erro
//              número = número da proxima parcela
// *****************************************************************************
function CalculaNumParcela(sMesReferencia : string;piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,piIdContribuicao : integer): integer;

// *****************************************************************************
// Função ULTIMAPARCELA -  Verifica se a parcela informada é a ultima parcela a
//                         ser cobrada da contribuicao
// Parâmetros :  piParcela        = numero da parcela a ser verificada
//               piQtdeParcelas   = número total de parcelas que o participante deverá pagar
//                                  OBS.: se passar 0 ou -1 , a função lerá este valor
//                                        do banco de dados, senao considerará o que foi passado
//               piIdPessJur      = identificador da patrocinadora
//               piIdPlanoPrev    = identificador do plano previdenciario
//               piIdPessoa       = identificador do participante(=IdPessJur caso seja para patrocinadora)
//               piSeqProposta    = identificador da proposta
//               piIdContribuicao = identificador da contribuicao
// Retorno    : True   = é a última parcela
//              False  = não é a ultima parcela
// *****************************************************************************
function UltimaParcelaContrib(piParcela,piQtdeParcelas,piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,piIdContribuicao : integer): boolean;

// *****************************************************************************
// Função ENCERRACOBRANCACONTRIB -  Encerra a cobranca de uma contribuicao
// Parâmetros :  piIdPessJur      = identificador da patrocinadora
//               piIdPlanoPrev    = identificador do plano previdenciario
//               piIdPessoa       = identificador do participante(=IdPessJur caso seja para patrocinadora)
//               piIdContribuicao = identificador da contribuicao
// Retorno    : True   = operacao efetuada com sucesso
//              False  = erros na operacao
// *****************************************************************************
function EncerraCobrancaContrib(piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,piIdContribuicao : integer) : boolean;

// *****************************************************************************
// Função ATUALIZAULTMESPREPARO -  Atualiza o último mes no qual uma contribuicao foi preparada
// Parâmetros :  psMesReferencia  = mes de referencia do ultimo preparo
//               piIdPessJur      = identificador da patrocinadora
//               piIdPlanoPrev    = identificador do plano previdenciario
//               piIdPessoa       = identificador do participante(=IdPessJur caso seja para patrocinadora)
//               piSeqProposta    = identificador da proposta
//               piIdContribuicao = identificador da contribuicao
// Retorno    : True   = operacao efetuada com sucesso
//              False  = erros na operacao
// *****************************************************************************
function AtualizaUltMesPREPARO(psMesReferencia : string;
                               piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,piIdContribuicao : integer) : boolean;

// *****************************************************************************
// Função LERCONTRIBAENVIAR -  Lê do histórico de contribuicoes as contribuicoes
//                             pertencentes a um lote, que ainda nao foram enviadas
// Parâmetros :  piIdLote        = identificador do lote a ser lido
//               piSitRecebimento = situacao das contribuicoes que se deseja ler para enviar
//                                 (nos casos normais será 0 = nao enviada, mas em casos
//                                  especificos pode variar)
//                                  Se quiser usar o padrão, passar -1
//               psMesReferencia = mes de referencia do lote a ser lido
//               psTipo          = flag para indicar se é um lote de contribuicoes
//                                 Normais (N), Atrasadas(A) , Devolucoes(D) ou
//                                 Retroativas (R)
//                                 Diferença de Tratamento entre tipos :
//                                 N - lerá só as contribuicoes com mes IGUAL ao mes de referencia
//                                     usará a rubrica [NORMAL] da contribuicao
//                                 A - lerá  as contribuicoes com mes MENOR OU IGUAL ao mes de referencia
//                                     usará a rubrica [ATRASO] da contribuicao
//                                 D - lerá só as contribuicoes com mes MENOR OU IGUAL  ao mes de referencia
//                                     usará a rubrica [DEVOLUCAO] da contribuicao
//                                 R - lerá só as contribuicoes com mes MENOR OU IGUAL  ao mes de referencia
//                                     usará a rubrica [NORMAL] da contribuicao
//               qry             = qry que será retornada preenchida com os registros
//                                 do lote a ser lido
// Retorno    : True   = operacao efetuada com sucesso
//              False  = erros na operacao
// *****************************************************************************
function LerContribAEnviar(piIdLote,piSitRecebimento : integer; psMesReferencia, psTipo : string;
                           var qry : TwwQuery) : boolean;

// *****************************************************************************
// Função LERALTERADORCONTRIB -  Dado um número de recebimento, verifica se o mesmo
//                             possui correcao monetaria ou juros na tabela de alteradores
// Parâmetros :  piNumRecebimento= numero do recebimento em questao
//               piIdMotivo      = motivo do recebimento
//               psMesReferencia = mes de referencia da cobranca da contribuicao
//               psMesCobranca   = mes de cobranca da contribuicao
//               psTipo          = flag para indicar se é um lote de contribuicoes
//                                 Normais (N), Atrasadas(A) , Devolucoes(D) ou
//                                 Retroativas (R)
//                                 Diferença de Tratamento entre tipos :
//                                 N - lerá só as contribuicoes com mes IGUAL ao mes de referencia
//                                     usará a rubrica [NORMAL] da contribuicao
//                                 A - lerá  as contribuicoes com mes MENOR OU IGUAL ao mes de referencia
//                                     usará a rubrica [ATRASO] da contribuicao
//                                 D - lerá só as contribuicoes com mes MENOR OU IGUAL  ao mes de referencia
//                                     usará a rubrica [DEVOLUCAO] da contribuicao
//                                 R - lerá só as contribuicoes com mes MENOR OU IGUAL  ao mes de referencia
//                                     usará a rubrica [NORMAL] da contribuicao
//               qry             = qry que será retornada preenchida com os registros
//                                 do lote a ser lido
// Retorno    : True   = operacao efetuada com sucesso
//              False  = erros na operacao
// *****************************************************************************
function LerAlteradorContrib(piNumRecebimento,piIdMotivo,   piLote, piSitRecebimento : integer;
                             psMesReferencia, psMesCobranca,psTipo : string;
                             var qry : TwwQuery) : boolean;

// *****************************************************************************
// Função ENVIACONTRIBUICAO - Grava na TMPDESC o envio de um registro de contribuicao
// Parâmetros :  qry             = qry com o registro a ser enviado
//               piOrdem         = ordem do registro que está sendo enviado no lote
//               piIdLote        = identificador do lote a ser enviado
//               piSitRecebimento= Situação do recebimento que fora gerado no historico
//               liPeriodo       = periodo contabil do envio
//               liExercicio     = exercicio contabil do envio
//               sMes            = número do mês de referencia do envio ('01','02',...)
//               sAno            = número do ano de referencia do envio ('1998',...)
//               sSitFundacao    = situacao do participante na fundacao(flgINTERNO da SITPART)
//               sAtrasoDevol    = flag para indicar se é um lote de contribuicoes
//                                 Normais (N), Atrasadas(A) ou Devolucoes(D)
//               sAlterador      = flag para indicar se é um alterador de Juros(J) ou
//                                 Correcao(C). Caso nao seja nenhum dos dois passar ''
//               sTipoDesc       = flag para indicar o tipo de desconto
//               sCamposObrig    = string que será preenchida pela função com os nomes
//                                 dos campos de integracao financeira, OBRIGATORIOS,
//                                 que nao estao preenchidos.
//               sCamposNObrig    = string que será preenchida pela função com os nomes
//                                 dos campos de integracao financeira, NAO obrigatorios,
//                                 que nao estao preenchidos.
// Retorno    : -1     = erro no envio
//              valor  = valor enviado
// *****************************************************************************
function EnviaContribuicao(qry : TwwQuery; piOrdem,piIdLote : integer;
                           liPeriodo, liExercicio : longInt;
                           sMes,sAno,sSitFundacao,sAtrasoDevol,sAlterador,sTipoDesc : string;
                           var sCamposObrig,sCamposNObrig : string; piultimacontrib : integer) : real;

// *****************************************************************************
// Função ATUALIZASITCONTRIB - Grava a situacao da contribuicao no Historico
// Parâmetros :  qry              = qry com o registro a ser enviado
//               piIdLote         = identificador do lote a ser enviado
//               piSitRecebimento = situacao do recebimento
//                                Obs : 0 - não enviado
//                                      1 - enviado e não recebido
//                                      2 - recebido ok
//                                      3 - recebido com diverg. e nao tratado
//                                      4 - recebido com diverg. e tratado
//                                      5 - pagou a diverg. (regularizou o 4)
//                                      6 - diverg. enviada e nao recebida
//                                      7 - financiado ou renegociado                                  
// Retorno    : True    = atualizacao ok
//              False   = atualizacao com erro
// *****************************************************************************
function AtualizaSitContrib(qry : TwwQuery; piIdLote,piSitRecebimento : integer) : boolean;

// *****************************************************************************
// Função GRAVAALTERADOR -  Dado o valor de uma contribuicao, calcula o valor de
//                          correcao monetária ou juros para esta contribuicao
//                          e o grava na tabela HSTATRASOCONTRIB
// Parâmetros :  sTipo            = indica o tipo de alterador (C - Correcao, J - Juros)
//               sMesReferencia   = mes de referencia da contribuicao
//               sMesCobranca     = mes de cobranca do alterador da contribuicao
//               piNumRecebimento = numero do recebimento do qual está se cobrando o atraso
//               piIdMotivo       = motivo de contribuicao
//               pIdPlanoPrev     = Plano
//               pIdContribuicao  = Contribuição
//               sDataRef         = data de referencia para o calculo do alterador
//               sValor           = Valor total da contribuicao sobre a qual se calculará o alterador
// Retorno    : True   = operacao efetuada com sucesso
//              False  = erros na operacao
// *****************************************************************************
function GravaAlterador(sTipo,sMesReferencia,sMesCobranca : string;
                        piNumRecebimento,
                        piIdMotivo, pIdPlanoPrev, pIdContribuicao, pIdPessJur : integer;
                        sDataRef, sValor : string ) : boolean;

// *****************************************************************************
// Função PREPARACONTRIBUICAO -  dada uma query com dados de contribuicoes do
//                          participante ou da patrocinadora (CONTRIBPREVPARTP
//                          ou CONTRIBPREVPATRO), prepara as contribuicoes no
//                          histórico.
// Parâmetros :  piIdPessJur    = identificador da patrocinadora
//               piIdPlanoPrev  = identificador do plano previdenciario
//               piIdMotivo     = identificador do motivo de contribuicoes
//               piSitRecebimento = situacao do recebimento a gravar no historico
//               qryContrib     = qry que será aberta com contribuicoes a preparar,
//                                utilizando a query passada na string sSQL
//               qryAux         = qry auxiliar para a rotina utilizar internamente
//               sSQL           = string com sql que retornará as contribuicoes à preparar.
//                                Esta query deve conter um select na CONTRIBPREVPARTP,
//                                com o filtro que for conveniente à rotina chamadora, e com
//                                os seguintes campos : IDCONTRIBUICAO, CODPORTFORMA,
//                                FLGDESCFOLHA, VALORBASE1, VALORBASE2, VALORBASE3,
//                                DATAINICIO, DATAFINAL, IDPESSOA, SEQPROPOSTA
//               sSQLRegra      = SQL a passar para a regra de calculo da contribuicao
//                                OBS.: Só preencher se for um caso especifico,
//                                caso contrário a própria rotina já fará o SQL de acordo
//                                com a situacao passada como parâmetro. No caso de ser
//                                necessário utilizar este parametro, passar as clausulas
//                                SELECT e FROM da query, as outras clausulas serão passadas
//                                nos parametro a seguir
//               sWhereSQLRegra = passar os JOINS necessários para a query da regra.
//                                OBS.: Não passar a palavra WHERE
//               sAliasSQLRegra = passar o alias utilizado para a tabela CONTRIBPREVPARTP
//               sSitFundacao   = situacao na fundacao do lote que está sendo preparado
//               sDataRefInicio = data de inicio a preparar a contribuicao
//               sDataRefFinal  = data final a preparar a contribuicao
//               sDescPreparo   = descricao do lote do preparo
//               sAtrasoDevol   = flag para indicar se é um lote de contribuicoes
//                                Normais (N), Atrasadas(A) , Devolucoes(D) ou
//                                Retroativas (R)
//               bValorQry      = flag para indicar se é para usar o campo VALOR da
//                                query sSQL (True) ou se é para chamar a regra de
//                                calculo (False)
//               bParaCobranca  = flag para indicar se é para preparar a contribuicao
//                                e encerrá-la imediatamente, ou seja, ela será cobrada
//                                por este preparo e nunca mais
//               sMsgErro       = mensagem informando qual o erro ocorreu
//               iIdLote        = variavel para a funcao preencher com o numero do lote
//                                gerado
// Retorno :    True   = operacao efetuada com sucesso
//              False  = erros na operacao
// EXEMPLO :
//         ===================================================================
//        |      bErro := PreparaContribuicao(StrToInt(sPatro),               |
//        |                                   StrToInt(sPlano),               |
//        |                                   prmIdMotivoContrib,             |
//        |                                   0,                              |
//        |                                   qry,                            |
//        |                                   qryAux,                         |
//        |                                   sSQL,                           |
//        |                                   '',//sSQLRegra                  |
//        |                                   '',//sWhereSQLRegra             |
//        |                                   '',//sAliasSQLRegra             |
//        |                                   sSituacao,                      |
//        |                                   DateToStr(date),                |
//        |                                   DateToStr(date),                |
//        |                                   sDescPreparo,                   |
//        |                                   'N',   //sAtrasoDevol           |
//        |                                   False, // bValorQry             |
//        |                                   False, //bParaCobranca          |
//        |                                   sMsgErro);                      |
//        |      if bErro                                                     |
//        |      then begin                                                   |
//        |         MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);          |
//        |         Exit;                                                     |
//        |      end;                                                         |
//         ===================================================================
// *****************************************************************************

function PreparaContribuicao(piIdPessJur, piIdPlanoPrev,
                             piIdMotivo, piSitRecebimento : integer;
                             qryContrib,
                             qryAux     : TwwQuery;
                             sSQL,
                             sSQLRegra,
                             sWhereSQLRegra,
                             sAliasSQLRegra,
                             sSitFundacao,
                             sDataRefInicio,sDataRefFinal,
                             sDescPreparo,sAtrasoDevol : string;
                             bValorQry,
                             bParaCobranca : boolean;
                             var sMsgErro  : string;
                             var iIdLote   : integer;
                             sSalarioPart  : string) : boolean;

// *****************************************************************************
// Função MontaSQLCalcContrib -  monta a query necessária para passar para a
//                            regra de cálculo de contribuicao
// Parâmetros :  piIdPessJur   : identificador da patrocinadora
//               piIdPlanoPrev : identificador do plano
//               piIdPessoa    : identificador da patrocinadora/participante
//               piSeqProposta : identif. da proposta (case seja do participante)
//               piIdContribuicao  : identif. da contribuicao
//               piIdMotivoContrib : identif. do motivo
//               sSitFundacao      : situacao na fundacao
//               sMesReferencia    : mes de referencia
//               sDataRef          : data de referencia a passar para regra
//               sValorFinal       : caso seja 1o. ou ultimo pagamento, passar
//                                   passar o valor da regra de calculo normal,
//                                   caso contrario, passar '0' (ZERO)
//               sInscricaoData : data de inscricao do participante
//               sDataNasc      : data de nascimento do participante
//               sTipoCalculo   : N - normal
//                                P - primeira contrib
//                                U - ultima contrib
//               sTabelaValor  : tabela de onde é para pegar o valor
//                               (TMPDESC OU HSTCONTRIBPREV)
//               sCampoValor   : nome do campo onde está o valor (valor, valoresperado,etc.)

// Retorno    : ''     = se houve algum problema
//              query  = sql resultante
// *****************************************************************************
function MontaSQLCalcContrib(piIdPessJur,  piIdPlanoPrev, piIdPessoa, piSeqProposta,
                             piIdContribuicao,piIdMotivoContrib : integer;
                             sSitFundacao, sMesReferencia, sDataRef,
                             sValorFinal,
                             sInscricaoData, sDataNasc,
                             sTipoCalculo,sTabelaValor,sCampoValor,sSalarioPart : string) : string;
// *****************************************************************************
// Função ULTIMADATACONTRIB -  Verifica se a data final informada é a ultima data
//                             de cobrança da contribuicao
// Parâmetros :  psDataFinal      = data final a ser verificada
//                                  OBS.: se passar '', a funcao lerá este valor do banco de dados
//               psMesReferencia  = mes de referencia que se quer testar se é o
//                                  ultimo mes de cobrança
//               piIdPessJur      = identificador da patrocinadora
//               piIdPlanoPrev    = identificador do plano previdenciario
//               piIdPessoa       = identificador do participante(=IdPessJur caso seja para patrocinadora)
//               piSeqProposta    = identificador da proposta
//               piIdContribuicao = identificador da contribuicao
// Retorno    : True   = é a última data
//              False  = não é a ultima data
// *****************************************************************************
function UltimaDataContrib(psDataFinal,psMesReferencia : string; piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,piIdContribuicao : integer): boolean;


// *****************************************************************************
// Função VALIDALOTE - Verifica as informacoes que podem fazer com que um lote nao
//                     seja enviado. As validações feitas no momento são :
//                     * Rubricas Nao Associadas
// Parâmetros : qryAux          = query auxiliar para uso interno da rotina
//              psMesReferencia = mes de referencia a verificar
//              pStrLotes       = string com nos. dos lotes a verificar, separados por virgula
//              sMsg            = mensagem de retorno da funcao dizendo o que está errado
// Retorno    : True   = lotes validos
//              False  = lotes nao validos
// *****************************************************************************
function  ValidaLote(qryAux : TwwQuery; psMesReferencia, pStrLotes : string; var sMsg : string) : boolean;

// *****************************************************************************
// Função VALIDARUBCONTRIB - Verifica as rubricas de uma contribuicao estão associadas
//                           a uma patrocinadora
// Parâmetros : qryAux           = query auxiliar para uso interno da rotina
//              piIdContribuicao = identificador da contribuicao a validar
//              piIdPessJur      = identificador da pessoa juridica(patrocinadora)
//              psTipoRubrica    = T - Todas; N - Normal;  A - Atraso ; D - Devolucao
// Retorno    : True   = rubricas existem
//              False  = rubricas nao existem
// *****************************************************************************
function  ValidaRubContrib(qryAux : TwwQuery; piIdContribuicao, piIdPlanoPrev, piIdPessJur : integer;
                           pcTipoRubrica : char) : boolean;

// *****************************************************************************
// Função TESTAPERIODICIDADE - Testa a periodicidade da contribuição
// Parâmetros : pQtdeMeses     = quantidade de meses da Periodicidade
//              pUltMesPreparo = ultimo mês em que a contribuição foi preparada
//              pMesReferencia = mês de referência
// Retorno    : True   = Pode cobrar contribuição (Periodicidade OK)
//              False  = Não pode cobrar contribuição
// *****************************************************************************
function TestaPeriodicidade(pQtdeMeses, pUltMesPreparo, pMesReferencia: string): boolean;

implementation

uses DAprev,UDataBase,USistema,UAdmPREV,UModulo, UParticipante, DBaseDados, UFuncoesUteis,
     ULancContab, UAdmAss;

function CalcDataFinal(dDataInicio : TDateTime; sQtdeParcelas,sQtdeMeses : string) : string;
var sDataInicio,
    sMesFim,
    sAnoFim,
    sDataFim : string;
    iQtdeParcelas,
    iQtdeMeses,
    iContaParcela,
    iMesInicio,
    iAnoInicio,
    iMesFim,
    iAnoFim : integer;
begin
  Result := '';
  // verificar se data de início é válida
  try
     sDataInicio := FormatDateTime('dd/mm/yyyy',dDataInicio);
  except
     Result := '-1';
     Exit;
  end;

  if sQtdeParcelas = ''
  then iQtdeParcelas := 0
  else iQtdeParcelas := StrToInt(sQtdeParcelas);

  if sQtdeMeses = ''
  then iQtdeMeses := 0
  else iQtdeMeses := StrToInt(sQtdeMeses);
  
  if iQtdeMeses < 0
  then begin
     Result := '-2';
     Exit;
  end;

  if iQtdeParcelas = 0
  then Exit // contribuicao por tempo indeterminado -> datafinal = ''
  else begin
     // Se for pagamento unico -> datafinal = datainicio
     if (iQtdeMeses = 0) or (iQtdeParcelas = 1)
     then sDataFim := sDataInicio
     else begin
        iMesInicio  := StrToInt(Copy(sDataInicio,4,2));
        iAnoInicio  := StrToInt(Copy(sDataInicio,7,4));
        iMesFim     := iMesInicio;
        iAnoFim     := iAnoInicio;
        iContaParcela := 1;
        while iContaParcela < iQtdeParcelas do
        begin
           iMesFim := iMesFim + iQtdeMeses;
           if iMesFim > 12
           then begin
              iMesFim := -(12 - iMesFim);
              iAnoFim := iAnoFim + 1;
           end;
           inc(iContaParcela);
        end;
        if iMesFim <= 9
        then sMesFim := '0'+IntToStr(iMesFim)
        else sMesFim := IntToStr(iMesFim);
        sAnoFim := IntToStr(iAnoFim);
        sDataFim := Copy(sDataInicio,1,2)+'/'+sMesFim+'/'+sAnoFim;
     end;
  end;
  Result := sDataFim;
end; //CalcDataFinal

// *****************************************************************************
function BuscaInfFinancContrib(var sSQL,sBrancos,sValorEncontrado : string;
                               sNomeCampo,sValorCampo : string;
                               cTipo : char;
                               pIdPessJur,pIdPlanoPrev,pIdContrib,piIdContribAnt : integer ) : boolean;
var
   sValorAchado : string;
begin
  Result := True;
  if Trim(sValorCampo) <> ''
  then begin // o campo já está preenchido
    if cTipo = 'S'
    then sSQL := sSQL +', '''+sValorCampo+''''
    else sSQL := sSQL +', '+sValorCampo;
    sValorEncontrado := sValorCampo;
    Exit;
  end
  else begin
    with dtmAPrev do
    begin
       sValorAchado := '';
       //procurar em CONTPLANPATRO
       try
          if piIdContribAnt <> pIdContrib
          then begin
          qryContPlanPatro.Close;
          qryContPlanPatro.ParambyName('IdPlanoPrev').AsInteger := pIdPlanoPrev;
          qryContPlanPatro.ParambyName('IdPessJur').AsInteger := pIdPessJur;
          qryContPlanPatro.ParambyName('IdContribuicao').AsInteger := pIdContrib;
          qryContPlanPatro.Open;
          end;
          if qryContPlanPatro.FieldByName(sNomeCampo).AsString <> ''
          then sValorAchado := qryContPlanPatro.FieldByName(sNomeCampo).AsString;
       except
       end;
       if sValorAchado <> ''
       then begin
          if cTipo = 'S'
          then sSQL := sSQL +', '''+sValorAchado+''''
          else sSQL := sSQL +', '+sValorAchado;
          sValorEncontrado := sValorAchado;
          Exit;
       end;

       // PROCURAR EM CONTPREV
       try
          if piIdContribAnt <> pIdContrib
          then begin
          qryContPREV.Close;
          qryContPREV.ParambyName('IdPlanoPrev').AsInteger := pIdPlanoPrev;
          qryContPREV.ParambyName('IdContribuicao').AsInteger := pIdContrib;
          qryContPREV.Open;
          end;
          if qryContPREV.FieldByName(sNomeCampo).AsString <> ''
          then sValorAchado := qryContPREV.FieldByName(sNomeCampo).AsString;
       except
       end;

       if sValorAchado <> ''
       then begin
          if cTipo = 'S'
          then sSQL := sSQL +', '''+sValorAchado+''''
          else sSQL := sSQL +', '+sValorAchado;
          sValorEncontrado := sValorAchado;
          Exit;
       end;
    end;// with dtmAPrev
  end;//else-if sValorCampo <> ''

  if sValorAchado = ''
  then begin
    sSQL := sSQL+', NULL ';
    sBrancos := sBrancos + sNomeCampo+',';
    sValorEncontrado := sValorAchado;
    Result := False;
  end;
end; //BuscaInfFinancContab

function GeraLOTE(idPatro : integer; bGravaLote : boolean; sMesReferencia,sTipo,sDescricao,sAtrasoDevol,
                  sFlgPreparado,sFlgIdaTmp, sFlgVoltaTmp, sFlgIdaInterface,sFlgVoltaInterface,
                  sDataPreparo,sDataIdaTmp,sDataVoltaTmp,sDataIdaInterface,sDataVoltaInterface : string;
                  iTotalReg:Integer;sValorTotal:Double) : integer;
var iIdLote    : integer;
    sSQLValues : string;
begin
   iIdLote := LeUltRegistro(dtmAPrev.qry,'CTRLINTERFACE');
   Result := iIdLote;
   if not bGravaLote then Exit;
   if sDescricao = ''
   then sDescricao := ' NULL '
   else sDescricao := ''''+sDescricao+'''';

   if sFlgPreparado          = '' then sFlgPreparado          := '0';
   if sFlgIdaTmp             = '' then sFlgIdaTmp             := '0';
   if sFlgVoltaTmp           = '' then sFlgVoltaTmp           := '0';
   if sFlgIdaInterface       = '' then sFlgIdaInterface       := '0';
   if sFlgVoltaInterface     = '' then sFlgVoltaInterface     := '0';

   if sDataPreparo   = ''
   then sDataPreparo := ' NULL'
   else sDataPreparo := ' TO_DATE('''+sDataPreparo+''',''dd/mm/yyyy'') ';

   if sDataIdaTmp    = ''
   then sDataIdaTmp  := ' NULL'
   else sDataIdaTmp := ' TO_DATE('''+sDataIdaTmp+''',''dd/mm/yyyy'') ';

   if sDataVoltaTmp  = ''
   then sDataVoltaTmp := ' NULL'
   else sDataVoltaTmp := ' TO_DATE('''+sDataVoltaTmp+''',''dd/mm/yyyy'') ';

   if sDataIdaInterface   = ''
   then sDataIdaInterface   := ' NULL'
   else sDataIdaInterface := ' TO_DATE('''+sDataIdaInterface+''',''dd/mm/yyyy'') ';

   if sDataVoltaInterface = ''
   then sDataVoltaInterface := ' NULL'
   else sDataVoltaInterface := ' TO_DATE('''+sDataVoltaInterface+''',''dd/mm/yyyy'') ';


   sSQLValues := '';
   sSQLValues := IntToStr(iIdLote);
   sSQLValues := sSQLValues +', '+IntToStr(idPatro);
   sSQLValues := sSQLValues+', '''+sMesReferencia+'''';
   sSQLValues := sSQLValues+', '''+sTipo+'''';
   sSQLValues := sSQLValues+', '+sDescricao;
   sSQLValues := sSQLValues+', '''+sAtrasoDevol+'''';
   sSQLValues := sSQLValues+', '+sFlgPreparado;
   sSQLValues := sSQLValues+', '+sFlgIdaTmp;
   sSQLValues := sSQLValues+', '+sFlgVoltaTmp;
   sSQLValues := sSQLValues+', '+sFlgIdaInterface;
   sSQLValues := sSQLValues+', '+sFlgVoltaInterface;
   sSQLValues := sSQLValues+', '+sDataPreparo;
   sSQLValues := sSQLValues+', '+sDataIdaTmp;
   sSQLValues := sSQLValues+', '+sDataVoltaTmp;
   sSQLValues := sSQLValues+', '+sDataIdaInterface;
   sSQLValues := sSQLValues+', '+sDataVoltaInterface;
   sSQLValues := sSQLValues+', :TOTALREG';
   sSQLValues := sSQLValues+', :VALORTOTAL';

   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' INSERT INTO CTRLINTERFACE (IDLOTE, IDPESSOA, MESREFERENCIA, TIPO, DESCRICAO, FLGATRASODEVOL,'+
              ' FLGPREPARADO, FLGIDATMP, FLGVOLTATMP,'+
              ' FLGIDAINTERFACE, FLGVOLTAINTERFACE,'+
              ' DATAPREPARO, DATAIDATMP, DATAVOLTATMP, DATAIDAINTERFACE, DATAVOLTAINTERFA, NUMREG, VLRTOTAL) '+
              ' VALUES('+sSQLValues+')');
      ParamByName('TOTALREG').asInteger:=iTotalReg;
      ParamByName('VALORTOTAL').asFloat:=sValorTotal;

      try
        ExecSQL;
      except
        Exit;
      end;
   end;
   Result := iIdLote;
end;//GeraLOTE

function AtualizaCTRLINTERFACE(idLote : Integer; sFlagAtu, sValorFlag, sDataAtu,
                               sValorData : string) : boolean;
begin
   Result := False;

   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE CTRLINTERFACE SET '+sFlagAtu+' = '+sValorFlag+', '+
              sDataAtu+ ' = TO_DATE('''+sValorData+''', ''dd/mm/yyyy'' ) '+
              ' WHERE IDLOTE = '+IntToStr(idLote) );

      try
        ExecSQL;
      except
        Exit;
      end;
   end;
   Result := True;
end;//AtualizaCTRLINTERFACE

function CalculaNumParcela(sMesReferencia : string;piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,piIdContribuicao : integer): integer;
var iNumParcela : integer;
begin
   Result := -1;
   if piSeqProposta <= 0 then piSeqProposta := 1;

   with dtmAPrev.qry do
   begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT MAX(PARCELA) AS NUMULTIMAPARCELA '+
               ' FROM   HSTCONTRIBPREV '+
               ' WHERE  IDPESSOA = '+IntToStr(piIdPessoa)+' AND '+
               '        SEQPROPOSTA = '+IntToStr(piSeqProposta)+' AND '+
               '        MESREFERENCIA < '''+sMesReferencia+''' AND '+
               '        IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
               '        IDPESSJUR = '+IntToStr(piIdPessJur)+'  AND '+
               '        IDPLANOPREV = '+IntToStr(piIdPlanoPrev));
       try
          Open;
       except
          Close;
          exit;
       end;
       iNumParcela := FieldByName('NUMULTIMAPARCELA').AsInteger + 1;
       Close;
   end;//with
   Result := iNumParcela;
end; //CalculaNumParcela

function UltimaParcelaContrib(piParcela,piQtdeParcelas,piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,piIdContribuicao : integer): boolean;
var sSQL : string;
begin
   Result := False;
   if piIdPessJur = piIdPessoa // contribuicao da patrocinadora
   then begin
      sSQL := ' SELECT QTDEPARCELAS  '+
              ' FROM   CONTRIBPREVPATRO '+
              ' WHERE  IDPESSOA = '+IntToStr(piIdPessJur)+'  AND '+
              '        IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
              '        IDPLANOPREV = '+IntToStr(piIdPlanoPrev);

   end
   else begin
      sSQL := ' SELECT QTDEPARCELAS  '+
              ' FROM   CONTRIBPREVPARTP '+
              ' WHERE  IDPESSOA = '+IntToStr(piIdPessoa)+' AND '+
              '        SEQPROPOSTA = '+IntToStr(piSeqProposta)+' AND '+
              '        IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
              '        IDPESSJUR = '+IntToStr(piIdPessJur)+'  AND '+
              '        IDPLANOPREV = '+IntToStr(piIdPlanoPrev);

   end;

   if piQtdeParcelas <= 0 // Qtde de Parcelas nao preenchida
   then begin
      with dtmAPrev.qry do
      begin
          Close;
          SQL.Clear;
          SQL.Add(sSQL );
          try
             Open;
          except
             Close;
             exit;
          end;
          if FieldByName('QtdeParcelas').AsString = ''
          then piQtdeParcelas := 0
          else piQtdeParcelas := FieldByName('QtdeParcelas').AsInteger;
      end;//with
   end;//if qtdeParcelas <= 0

   // Se qtde de parcelas = 0 entao é porque a contribuicao é por prazo indeterminado
   // Logo, result = false (nao é a ultima parcela
   // Senao, comparar com o número da parcela
   if piQtdeParcelas > 0
   then begin
      if piParcela >= piQtdeParcelas // Se parcela > total de parcelas
      then Result := True            // -> entao, é a ultima parcela
      else Result := False;          // -> senao, NAO é a ultima parcela
   end
   else Result := False
end;//UltimaParcelaContrib

function EncerraCobrancaContrib(piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,piIdContribuicao : integer) : boolean;
var sSQL : string;
begin
   Result := False;
   if piIdPessJur = piIdPessoa // contribuicao da patrocinadora
   then begin
      sSQL := ' UPDATE CONTRIBPREVPATRO SET FLGCOBRA = 0  '+
              ' WHERE  IDPESSOA = '+IntToStr(piIdPessJur)+'  AND '+
              '        IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
              '        IDPLANOPREV = '+IntToStr(piIdPlanoPrev);
   end
   else begin
      sSQL := ' UPDATE CONTRIBPREVPARTP  SET FLGCOBRA = 0  '+
              ' WHERE  IDPESSOA = '+IntToStr(piIdPessoa)+' AND '+
              '        SEQPROPOSTA = '+IntToStr(piSeqProposta)+' AND '+
              '        IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
              '        IDPESSJUR = '+IntToStr(piIdPessJur)+'  AND '+
              '        IDPLANOPREV = '+IntToStr(piIdPlanoPrev);
   end;

   with dtmAPrev.qry do
   begin
       Close;
       SQL.Clear;
       SQL.Add(sSQL);
       try
          ExecSQL;
       except
          exit;
       end;
   end;//with

   Result := True;
end;//EncerraCobrancaContrib

function AtualizaUltMesPREPARO(psMesReferencia : string;
                               piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,piIdContribuicao : integer) : boolean;
var //sNomeTabela,
    //sCampoPessJur : string;
    sSQL : string;
begin
   Result := False;

   if piIdPessJur = piIdPessoa // contribuicao da patrocinadora
   then begin
      sSQL :=  ' UPDATE CONTRIBPREVPATRO SET ULTMESPREPARO = '''+psMesReferencia+''''+
               ' WHERE  IDPESSOA  = '+IntToStr(piIdPessJur)+'  AND '+
               '        IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
               '        IDPLANOPREV = '+IntToStr(piIdPlanoPrev);
   end
   else begin
     sSQL := ' UPDATE CONTRIBPREVPARTP SET ULTMESPREPARO = '''+psMesReferencia+''''+
             ' WHERE  IDPESSOA = '+IntToStr(piIdPessoa)+' AND '+
             '        SEQPROPOSTA = '+IntToStr(piSeqProposta)+' AND '+
             '        IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
             '        IDPESSJUR = '+IntToStr(piIdPessJur)+' AND '+
             '        IDPLANOPREV = '+IntToStr(piIdPlanoPrev);
   end;


   with dtmAPrev.qry do
   begin
       Close;
       SQL.Clear;
       SQL.Add(sSQL);
       try
          ExecSQL;
       except
          exit;
       end;
   end;//with
   Result := True;
end;//AtualizaUltMesPREPARO

function LerContribAEnviar(piIdLote, piSitRecebimento : integer; psMesReferencia, psTipo : string;
                           var qry : TwwQuery) : boolean;
var
   sCampoRubrica,
   sSinalMes,
   sSitRecebimento,
   sMes,
   sSQL1,sSQL2,
   sSQL : string;
begin
   Result := False;

   sMes := Copy(psMesReferencia,6,2);

   // Verificar se é Normal, Atraso ou Devolucao, para saber o nome do campo
   // a usar como rubrica
   if psTipo = '' then psTipo := 'N';

   if psTipo = 'N'    // Ler Contribuicoes NORMAIS a Enviar
   then begin
      if sMes <> '13'
      then sCampoRubrica := ' CP.IDRUBRICA '
      else sCampoRubrica := ' CP.IDRUBDECTERC ';
      sSinalMes := '=';
   end
   else begin
      if psTipo = 'A' // Ler contribuicoes de ATRASO
      then begin
         if sMes <> '13'
         then sCampoRubrica := ' CP.IDRUBRICAATRASO '
         else sCampoRubrica := ' CP.IDRUBDECTERCATRASO ';
         sSinalMes := '<=';
      end
      else begin
         if psTipo = 'D' // Ler as DEVOLUCOES
         then begin
            if sMes <> '13'
            then sCampoRubrica := ' CP.IDRUBRICADEVOLUC '
            else sCampoRubrica := ' CP.IDRUBDECTERCDEVOL ';
            sSinalMes := '<=';
         end
         else begin // Ler as contribuicoes RETROATIVAS
            if sMes <> '13'
            then sCampoRubrica := ' CP.IDRUBRICA '
            else sCampoRubrica := ' CP.IDRUBDECTERC ';
            sSinalMes := '<=';
         end;
      end;
   end;
   // Preencher sSitRecebimento
   if piSitRecebimento < 0
   then begin
      if (psTipo = 'N') or (psTipo = 'R')
      then sSitRecebimento := '0'
      else sSitRecebimento := '4'
   end
   else sSitRecebimento := IntToStr(piSitRecebimento);
   // Filtrar do Histórico de contribuicoes todas as contribuicoes
   // relativas ao mes de referencia, mes de cobranca e motivo informados
   // na tela que estejam com Situacao do Recebimento = 0 que estejam
   // calculadas.

   sSQL1 := '';
   sSQL2 := '';
   sSQL  := '';
   sSQL1 := ' SELECT HST.MESREFERENCIA, HST.NUMRECEBIMENTO,    HST.MESCOBRANCA,        '+
           '        HST.IDMOTIVO,      HST.VALORESPERADO,      HST.IDREGRAALIMRESE, '+
           '        HST.IDREGRACALCULO,HST.DATARECEBIMENTO,    HST.VALORRECEBIDO,      '+
           '        HST.QUANTCOTAS,    HST.DATAPREVISAORECE, HST.CODPORTFORMA,  '+
           '        HST.PLNCODIGOPREV, HST.VALORBASE1,         HST.CODDOCUMENTOPREV,   '+
           '        HST.PLNCODIGOEFET, HST.CODDOCUMENTOEFET,   HST.VALORBASE2,         '+
           '        HST.FLGCALCRESERVA,HST.VALORCALCULADO,     HST.VALOROP1,           '+
           '        HST.VALOROP2,      HST.VALOROP3,           HST.FLGDESCFOLHA,       '+
           '        HST.CODREFERENCIA, HST.FATOR,              HST.IDCONTRIBUICAO,     '+
           '        HST.IDPESSJUR,     HST.IDPLANOPREV,        HST.IDPESSOA,           '+
           '        HST.SEQPROPOSTA,   HST.DATAINICIO,         HST.DATAFINAL,          '+
           '        HST.IDHISTPROPOSTA,HST.FLGSITFUNDACAO,     EL.MATRICULA,           '+
           '        PV.CODPROVDESC,    PV.IDRUBRICA,           CP.IDREGRACOBRANCA,     '+
           '        CP.NUMPRIORIDADE,  PP.INSCRICAONUMERO,     PT.IDFUNDACAO,          '+
           '        CPP.FLGDESCFOLHA,  C.NOME AS NOMECONTRIB,  CPP.DIAVENCIMENTO,      '+
           '        CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONTAD,          '+
           '        CPP.CODCENTROCUSTOC,  CPP.CODCENTROCUSTOD,    CPP.IDEMPRESA,          '+
           '        CPP.UNIDNEGOC,        CPP.IDEMPRESAPROP,      CPP.CODCENTRORESPON,    '+
           '        CPP.CODSUBCONTA,      CPP.RECPAG,             CPP.CODTIPRECDES,       '+
           '        CPP.TIPCODIGO,        CPP.CODTIPDOC,          CPP.CODPORTFORMA,       '+
           '        CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONTAD13,        '+
           '        CPP.CODCENTROCUSTOC13, CPP.IDEMPRESA13,       CPP.CODCENTROCUSTOD13,  '+
           '        CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,  '+
           '        CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPRECDES13,     '+
           '        CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORTFORMA13      '+
           ' FROM   CONTRIBUICAO C,     CONTPREV CP, RUBRICAXPESS PV,  PATRO PT,       '+
           '        ELEGPATRO EL,       PARTPREVPLAN PP, CONTRIBPREVPARTP CPP,      '+
	   '        HSTCONTRIBPREV HST, CTRLINTERFACE INT    '+
           ' WHERE  HST.IDLOTE = '+IntToStr(piIdLote)+' AND  '+
           '        HST.MESREFERENCIA '+sSinalMes+' '''+psMesReferencia+''' AND '+
           '        HST.SITRECEBIMENTO = '+sSitRecebimento+' AND '+
           '        PV.IDRUBRICA       = '+sCampoRubrica + ' AND '+
           '        PV.IDPESSOA        = PT.IDPESSOA     AND     '+
           '        INT.IDLOTE         = HST.IDLOTE      AND    '+
           '        INT.FLGIDATMP      <> 1              AND    '+
           '        CPP.IDPESSJUR      = HST.IDPESSJUR   AND    '+
           '        CPP.IDPLANOPREV    = HST.IDPLANOPREV AND    '+
           '        CPP.IDPESSOA       = HST.IDPESSOA AND       '+
           '        CPP.SEQPROPOSTA    = HST.SEQPROPOSTA AND    '+
           '        CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO AND '+
           '        PP.IDPESSJUR       = CPP.IDPESSJUR AND      '+
           '        PP.IDPLANOPREV     = CPP.IDPLANOPREV AND    '+
           '        PP.IDPESSOA        = CPP.IDPESSOA AND       '+
           '        PP.SEQPROPOSTA     = CPP.SEQPROPOSTA AND    '+
           '        PT.IDPESSOA        = PP.IDPESSJUR AND       '+
           '        EL.IDPESSOA        = PP.IDPESSOA AND        '+
           '        EL.IDPESSJUR       = PP.IDPESSJUR AND       '+
           '        CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO AND '+
           '        CP.IDPLANOPREV     = CPP.IDPLANOPREV AND    '+
           '        C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO      ';

   sSQL2 := ' SELECT HST.MESREFERENCIA,    HST.NUMRECEBIMENTO,     HST.MESCOBRANCA,        '+
           '         HST.IDMOTIVO,         HST.VALORESPERADO,      HST.IDREGRAALIMRESE, '+
           '         HST.IDREGRACALCULO,   HST.DATARECEBIMENTO,    HST.VALORRECEBIDO,      '+
           '         HST.QUANTCOTAS,       HST.DATAPREVISAORECE, HST.CODPORTFORMA,  '+
           '         HST.PLNCODIGOPREV,    HST.VALORBASE1,         HST.CODDOCUMENTOPREV,   '+
           '         HST.PLNCODIGOEFET,    HST.CODDOCUMENTOEFET,   HST.VALORBASE2,         '+
           '         HST.FLGCALCRESERVA,   HST.VALORCALCULADO,     HST.VALOROP1,           '+
           '         HST.VALOROP2,         HST.VALOROP3,           HST.FLGDESCFOLHA,       '+
           '         HST.CODREFERENCIA,    HST.FATOR,              HST.IDCONTRIBUICAO,     '+
           '         HST.IDPESSJUR,        HST.IDPLANOPREV,        HST.IDPESSOA,           '+
           '         HST.SEQPROPOSTA,                                                      '+
           '         HST.DATAINICIO,       HST.DATAFINAL,          HST.IDHISTPROPOSTA,     '+
           '         HST.FLGSITFUNDACAO,   ''0'' AS MATRICULA,                             '+
           '         PV.CODPROVDESC,       PV.IDRUBRICA,           CP.IDREGRACOBRANCA,     '+
           '         CP.NUMPRIORIDADE,     0 AS  INSCRICAONUMERO,  PT.IDFUNDACAO,          '+
           '         0 AS FLGDESCFOLHA,    C.NOME AS NOMECONTRIB,  CPP.DIAVENCIMENTO,      '+
           '         CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONTAD,          '+
           '         CPP.CODCENTROCUSTOC,  CPP.CODCENTROCUSTOD,    CPP.IDEMPRESA,          '+
           '         CPP.UNIDNEGOC,        CPP.IDEMPRESAPROP,      CPP.CODCENTRORESPON,    '+
           '         CPP.CODSUBCONTA,      CPP.RECPAG,             CPP.CODTIPRECDES,       '+
           '         CPP.TIPCODIGO,        CPP.CODTIPDOC,          CPP.CODPORTFORMA,       '+
           '         CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONTAD13,        '+
           '         CPP.CODCENTROCUSTOC13, CPP.IDEMPRESA13,       CPP.CODCENTROCUSTOD13,  '+
           '         CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,  '+
           '         CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPRECDES13,     '+
           '         CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORTFORMA13      '+
           ' FROM    CONTRIBUICAO C,  CONTPREV CP, RUBRICAXPESS PV,  PATRO PT, '+
           '         CONTRIBPREVPATRO CPP,  HSTCONTRIBPREV HST   '+
           ' WHERE   HST.IDLOTE = '+IntToStr(piIdLote)+' AND     '+
           '         HST.MESREFERENCIA '+sSinalMes+' '''+psMesReferencia+''' AND '+
           '         HST.SITRECEBIMENTO = '+sSitRecebimento+' AND '+
           '         PV.IDRUBRICA       = '+sCampoRubrica + ' AND '+
           '         PV.IDPESSOA        = PT.IDPESSOA AND '+
           '         CPP.IDPLANOPREV    = HST.IDPLANOPREV AND  '+
           '         CPP.IDPESSOA       = HST.IDPESSOA  AND   '+
           '         CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO AND  '+
           '         PT.IDPESSOA        = CPP.IDPESSOA AND '+
           '         CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO AND  '+
           '         CP.IDPLANOPREV     = CPP.IDPLANOPREV AND  '+
           '         C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO ';
   sSQL := sSQL1+' UNION '+sSQL2+' ORDER BY IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO,IDPESSOA ';

   // Abrir query de cobranças a fazer
   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      try
         Open;
      except
         Exit;
      end;//except
   end;//with
   Result := True;
end;//LerContribAEnviar

function LerAlteradorContrib(piNumRecebimento,piIdMotivo, piLote, piSitRecebimento : integer;
                             psMesReferencia, psMesCobranca, psTipo : string;
                             var qry : TwwQuery) : boolean;
var
    sSitRecebimento,
    sSQL1,
    sSQL2,
    sSQL  : string;
begin
   Result := False;
   //  Filtrar do Histórico de contribuicoes todas as contribuicoes
   //  relativas ao mes de referencia, mes de cobranca e motivo informados
   //  na tela que estejam com Situacao do Recebimento = 0 que estejam
   //  calculadas.
    sSQL  := '';
    sSQL1 := '';
    sSQL2 := '';

    if (psTipo = 'N') or (psTipo = 'R')
    then sSitRecebimento := '0'
    else sSitRecebimento := '4';

    sSitRecebimento := IntToStr(piSitRecebimento); // É a situação que foi gravada no historico contrib.

    sSQL1:= ' SELECT HST.MESREFERENCIA,  HST.NUMRECEBIMENTO,     HST.MESCOBRANCA,        '+
            '        HST.IDMOTIVO,       HST.VALORESPERADO,      HST.IDREGRAALIMRESE, '+
            '        HST.IDREGRACALCULO, HST.DATARECEBIMENTO,    HST.VALORRECEBIDO,      '+
            '        HST.QUANTCOTAS,     HST.DATAPREVISAORECE, HST.CODPORTFORMA,  '+
            '        HST.PLNCODIGOPREV,  HST.VALORBASE1,         HST.CODDOCUMENTOPREV,   '+
            '        HST.PLNCODIGOEFET,  HST.CODDOCUMENTOEFET,   HST.VALORBASE2,         '+
            '        HST.FLGCALCRESERVA, HST.VALORCALCULADO,     HST.VALOROP1,           '+
            '        HST.VALOROP2,       HST.VALOROP3,           HST.FLGDESCFOLHA,       '+
            '        HST.CODREFERENCIA,  HST.FATOR,              HST.IDCONTRIBUICAO,     '+
            '        HST.IDPESSJUR,      HST.IDPLANOPREV,        HST.IDPESSOA,           '+
            '        HST.SEQPROPOSTA,                                                    '+
            '        HST.DATAINICIO,     HST.DATAFINAL,          HST.IDHISTPROPOSTA,     '+
            '        HST.FLGSITFUNDACAO, EL.MATRICULA,           PV.CODPROVDESC,         '+
            '        PV.IDRUBRICA,       CP.IDREGRACOBRANCA,     CP.NUMPRIORIDADE,       '+
            '        PP.INSCRICAONUMERO, PT.IDFUNDACAO,          CP.CODTIPDOC,           '+
            '        CP.CODTIPRECDES,    CP.RECPAG,              C.NOME AS NOMECONTRIB,  '+
            '        CPP.PLACONTAD,      CPP.TIPCODIGO,          CPP.CODCENTRORESPON,    '+
            '        CPP.PLANO,          CPP.IDEMPRESAPROP,      CPP.PLACONTAC,          '+
            '        CPP.DIAVENCIMENTO,   CPP.CODSUBCONTA,       CPP.CODCENTROCUSTOD,    '+
            '        CPP.CODCENTROCUSTOC, CPP.UNIDNEGOC,         CPP.IDEMPRESA,          '+
            '        CPP.CODPORTFORMA,    CPP.FLGDESCFOLHA ,                             '+
            '        HSTDIV.FLGTIPO,      HSTDIV.VALOR  AS VALORALTERADOR,               '+
            '        HSTDIV.CODALTERADOR                                                 '+
            ' FROM   CONTRIBUICAO C,  CONTPREV CP, RUBRICAXPESS PV, PATRO PT, SITPART ST, ELEGPATRO EL, '+
            '        PARTPREVPLAN PP, CONTRIBPREVPARTP CPP,    '+
            '        HSTATRASOCONTRIB HSTDIV, HSTCONTRIBPREV HST  '+
//          ' WHERE  HST.NUMRECEBIMENTO    = '+IntToStr(piNumRecebimento)+' AND     '+
            ' WHERE  (HST.IDLOTE            = '+IntToStr(piLote)    +') AND '+
            '        (HST.IDMOTIVO          = '+IntToStr(piIdMotivo)+') AND '+
//          '        (HST.MESREFERENCIA     = '''+psMesReferencia+''' ) AND  '+
            '        (HST.MESCOBRANCA       = '''+psMesCobranca+'''   ) AND '+
            '        (HST.SITRECEBIMENTO    = '+sSitRecebimento+'     ) AND '+
            '        (HSTDIV.NUMRECEBIMENTO = HST.NUMRECEBIMENTO      ) AND '+
            '        (HSTDIV.MESREFERENCIA  = HST.MESREFERENCIA       ) AND '+
            '        (HSTDIV.MESCOBRANCA    = HST.MESCOBRANCA         ) AND '+
            '        (HSTDIV.IDMOTIVO       = HST.IDMOTIVO            ) AND '+
            '        (HSTDIV.FLGTIPO        = '''+psTipo+'''          ) AND '+
            '        (HST.IDPESSOA  = EL.IDPESSOA                     ) AND '+
            '        (HST.IDPESSJUR = EL.IDPESSJUR                    ) AND '+
            '        (HST.IDCONTRIBUICAO = CP.IDCONTRIBUICAO          ) AND '+
            '        (HST.IDPLANOPREV = CP.IDPLANOPREV                ) AND '+
            '        (CPP.IDPESSJUR   = HST.IDPESSJUR                 ) AND '+
            '        (CPP.IDPLANOPREV = HST.IDPLANOPREV               ) AND '+
            '        (CPP.IDPESSOA    = HST.IDPESSOA                  ) AND '+
            '        (CPP.SEQPROPOSTA = HST.SEQPROPOSTA               ) AND '+
            '        (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO         ) AND '+
            '        (PV.IDPESSOA = HST.IDPESSJUR                     ) AND '+
            '        (CP.IDRUBRICA = PV.IDRUBRICA                     ) AND '+
            '        (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO            ) AND '+
            '        (PP.IDPESSJUR   = CPP.IDPESSJUR                  ) AND '+
            '        (PP.IDPLANOPREV = CPP.IDPLANOPREV                ) AND '+
            '        (PP.IDPESSOA    = CPP.IDPESSOA                   ) AND '+
            '        (PP.SEQPROPOSTA = CPP.SEQPROPOSTA                ) AND '+
            '        (ST.IDSITPART   = PP.IDSITPART                   ) AND '+
            '        (PT.IDPESSOA    = PP.IDPESSJUR )  ';
//            ' UNION '+
    sSQL2:= ' SELECT HST.MESREFERENCIA, HST.NUMRECEBIMENTO,     HST.MESCOBRANCA,        '+
            '        HST.IDMOTIVO,      HST.VALORESPERADO,      HST.IDREGRAALIMRESE, '+
            '        HST.IDREGRACALCULO,HST.DATARECEBIMENTO,    HST.VALORRECEBIDO,      '+
            '        HST.QUANTCOTAS,    HST.DATAPREVISAORECE, HST.CODPORTFORMA,  '+
            '        HST.PLNCODIGOPREV, HST.VALORBASE1,         HST.CODDOCUMENTOPREV,   '+
            '        HST.PLNCODIGOEFET, HST.CODDOCUMENTOEFET,   HST.VALORBASE2,         '+
            '        HST.FLGCALCRESERVA,HST.VALORCALCULADO,     HST.VALOROP1,           '+
            '        HST.VALOROP2,      HST.VALOROP3,           HST.FLGDESCFOLHA,       '+
            '        HST.CODREFERENCIA, HST.FATOR,              HST.IDCONTRIBUICAO,     '+
            '        HST.IDPESSJUR,     HST.IDPLANOPREV,        HST.IDPESSOA,           '+
            '        HST.SEQPROPOSTA,                                                   '+
            '        HST.DATAINICIO,    HST.DATAFINAL,          HST.IDHISTPROPOSTA,     '+
            '        HST.FLGSITFUNDACAO, EL.MATRICULA,           PV.CODPROVDESC,        '+
            '        PV.IDRUBRICA,      CP.IDREGRACOBRANCA,     CP.NUMPRIORIDADE,       '+
            '        PP.INSCRICAONUMERO,PT.IDFUNDACAO,          CP.CODTIPDOC,           '+
            '        CP.CODTIPRECDES,   CP.RECPAG,              C.NOME AS NOMECONTRIB,  '+
            '        CPP.PLACONTAD,     CPP.TIPCODIGO,          CPP.CODCENTRORESPON,    '+
            '        CPP.PLANO,         CPP.IDEMPRESAPROP,      CPP.PLACONTAC,          '+
            '        CPP.DIAVENCIMENTO, CPP.CODSUBCONTA,        CPP.CODCENTROCUSTOD,    '+
            '        CPP.CODCENTROCUSTOC, CPP.UNIDNEGOC,        CPP.IDEMPRESA,          '+
            '        CPP.CODPORTFORMA,    CPP.FLGDESCFOLHA ,                            '+
            '        HSTDIV.FLGTIPO,      HSTDIV.VALOR  AS VALORALTERADOR,              '+
            '        HSTDIV.CODALTERADOR                                                '+
            ' FROM   CONTRIBUICAO C,CONTPREV CP, RUBRICAXPESS PV, PATRO PT, SITPART ST, ELEGPATRO EL, '+
            '        PARTPREVPLAN PP, CONTRIBPREVPARTP CPP,    '+
            '        HSTATRASOCONTRIB HSTDIV, HSTCONTRIBPREV HST  '+
//          ' WHERE  HST.NUMRECEBIMENTO  = '+IntToStr(piNumRecebimento) +' AND     '+
            ' WHERE  (HST.IDLOTE            = '+IntToStr(piLote)    +') AND '+
            '        (HST.IDMOTIVO          = '+IntToStr(piIdMotivo)+') AND '+
//          '        (HST.MESREFERENCIA     = '''+psMesReferencia+''' ) AND '+
            '        (HST.MESCOBRANCA       = '''+psMesCobranca+'''   ) AND '+
            '        (HST.SITRECEBIMENTO    = '+sSitRecebimento+'     ) AND '+
            '        (HSTDIV.NUMRECEBIMENTO = HST.NUMRECEBIMENTO      ) AND '+
            '        (HSTDIV.MESREFERENCIA  = HST.MESREFERENCIA       ) AND '+
            '        (HSTDIV.MESCOBRANCA    = HST.MESCOBRANCA         ) AND '+
            '        (HSTDIV.IDMOTIVO       = HST.IDMOTIVO            ) AND '+
            '        (HSTDIV.FLGTIPO        = '''+psTipo+'''          ) AND '+
            '        (HST.IDPESSOA  = EL.IDPESSOA                     ) AND '+
            '        (HST.IDPESSJUR = EL.IDPESSJUR                    ) AND '+
            '        (HST.IDCONTRIBUICAO = CP.IDCONTRIBUICAO          ) AND '+
            '        (HST.IDPLANOPREV = CP.IDPLANOPREV                ) AND '+
            '        (CPP.IDPESSJUR   = HST.IDPESSJUR                 ) AND '+
            '        (CPP.IDPLANOPREV = HST.IDPLANOPREV               ) AND '+
            '        (CPP.IDPESSOA    = HST.IDPESSOA                  ) AND '+
            '        (CPP.SEQPROPOSTA = HST.SEQPROPOSTA               ) AND '+
            '        (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO         ) AND '+
            '        (PV.IDPESSOA = HST.IDPESSJUR                     ) AND '+
            '        (CP.IDRUBRICA = PV.IDRUBRICA                     ) AND '+
            '        (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO            ) AND '+
            '        (PP.IDPESSJUR   = CPP.IDPESSJUR                  ) AND '+
            '        (PP.IDPLANOPREV = CPP.IDPLANOPREV                ) AND '+
            '        (PP.IDPESSOA    = CPP.IDPESSOA                   ) AND '+
            '        (PP.SEQPROPOSTA = CPP.SEQPROPOSTA                ) AND '+
            '        (ST.IDSITPART   = PP.IDSITPART                   ) AND '+
            '        (PT.IDPESSOA    = PP.IDPESSJUR ) ';

   sSQL := sSQL1 + ' UNION '+sSQL2 +' ORDER BY IDPESSJUR,IDPLANOPREV,IDPESSOA ,IDCONTRIBUICAO ';

   // Abrir query de cobranças a fazer
   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      try
         Open;
      except
         Exit;
      end;//except
   end;//with
   Result := True;
end;//LerAlteradorAEnviar



function EnviaContribuicao(qry : TwwQuery; piOrdem,piIdLote : integer;
                           liPeriodo, liExercicio : longInt;
                           sMes,sAno,sSitFundacao,sAtrasoDevol,sAlterador,sTipoDesc : string;
                           var sCamposObrig,sCamposNObrig : string; piultimacontrib : integer) : real;
var
    sSQLFields,
    sSQLValues,
    sCodPortForma,
    sValorEncontrado,
    sDataCobranca,
    sMesCobranca : string;
    bCCustoCObrig,
    bCCustoDObrig,
    bCResponObrig,
    bUnidNegocObrig : boolean;
    rValorEnviado : real;

    // Campos de Integracao com financeiro
    sPlano,            sPlaContaC,        sPlaContaD,
    sCodCentroCustoC,  sCodCentroCustoD,  sIdEmpresa,
    sUnidNegoc,        sIdEmpresaProp,    sCodCentroRespon,
    sCodSubConta,      sRecPag,           sCodTipRecDes,
    sTipCodigo,        sCodTipDoc,        sCodPortadorForma   : string;
begin
    Result        := -1;
    // rValorEnviado := 0;
    // Preencher nomes dos campos de acordo com o mes
    if sMes <> '13'
    then begin
       sPlano            := 'PLANO';
       sPlaContaC        := 'PLACONTAC';
       sPlaContaD        := 'PLACONTAD';
       sCodCentroCustoC  := 'CODCENTROCUSTOC';
       sCodCentroCustoD  := 'CODCENTROCUSTOD';
       sIdEmpresa        := 'IDEMPRESA';
       sUnidNegoc        := 'UNIDNEGOC';
       sIdEmpresaProp    := 'IDEMPRESAPROP';
       sCodCentroRespon  := 'CODCENTRORESPON';
       sCodSubConta      := 'CODSUBCONTA';
       sRecPag           := 'RECPAG';
       sCodTipRecDes     := 'CODTIPRECDES';
       sTipCodigo        := 'TIPCODIGO';
       sCodTipDoc        := 'CODTIPDOC';
       sCodPortadorForma := 'CODPORTFORMA';
    end
    else begin
       sPlano            := 'PLANO13';
       sPlaContaC        := 'PLACONTAC13';
       sPlaContaD        := 'PLACONTAD13';
       sCodCentroCustoC  := 'CODCENTROCUSTOC13';
       sCodCentroCustoD  := 'CODCENTROCUSTOD13';
       sIdEmpresa        := 'IDEMPRESA13';
       sUnidNegoc        := 'UNIDNEGOC13';
       sIdEmpresaProp    := 'IDEMPRESAPROP13';
       sCodCentroRespon  := 'CODCENTRORESPON13';
       sCodSubConta      := 'CODSUBCONTA13';
       sRecPag           := 'RECPAG13';
       sCodTipRecDes     := 'CODTIPRECDES13';
       sTipCodigo        := 'TIPCODIGO133';
       sCodTipDoc        := 'CODTIPDOC13';
       sCodPortadorForma := 'CODPORTFORMA13';
    end;

    // Preencher codportforma qualquer
    with dtmAPrev do
    begin
       qry.Close;
       qry.SQL.Clear;
       qry.SQL.Add('SELECT CODPORTFORMA FROM PORTADORFORMA ');
       qry.Open;
       qry.First;
       if qry.IsEmpty
       then sCodPortForma := 'NULL'
       else sCodPortForma := qry.FieldByName('CodPortForma').AsString;
       qry.Close;
    end; //with dtmAPrev

    // Data Cobranca é a mesma do Historico de Contribuicao
    sDataCobranca := DateToStr(qry.FieldByName('DATAPREVISAORECE').AsDateTime);
    // Preencher Ano/Mes de Cobranca
    sMesCobranca  := Copy(sDataCobranca,7,4)+'/'+Copy(sDataCobranca,4,2);

    sCamposObrig  := '';
    sCamposNObrig := '';

    // Verificar se Unidade de Negocio e Centro de Responsabilidade sao obrigatorios
    dtmAPrev.qryVerificaObrig.Close;
    dtmAPrev.qryVerificaObrig.SQL.Clear;
    dtmAPrev.qryVerificaObrig.SQL.Add(' SELECT USACRESPON,USAABC FROM PARAMGLOBAL  '+
                                      ' WHERE IDPESSOA = '+IntToStr(Sistema.idEmpresa));
    dtmAPrev.qryVerificaObrig.Open;
    if dtmAPrev.qryVerificaObrig.IsEmpty or (dtmAPrev.qryVerificaObrig.FieldByName('USACRESPON').AsString = 'N')
    then bCResponObrig := False
    else bCResponObrig := True;

    if dtmAPrev.qryVerificaObrig.IsEmpty or (dtmAPrev.qryVerificaObrig.FieldByName('USAABC').AsString = 'N')
    then bUnidNegocObrig := False
    else bUnidNegocObrig := True;

    dtmAPrev.qryVerificaObrig.Close;

   // Gravar contribuicao na tabela tmpDesc
    sSQLFields := ' CODPROVDESC,     CODALTERADOR,   FLGALTERADOR,    FLGATRASODEVOL,  '+
                  ' FLGDESCFOLHA,    FLGDESCONTO,    FLGTIPODESC,     SEQPROPOSTA,     '+
                  ' IDDESCONTO,      IDFUNDACAO,     IDMOTIVO,        IDPESSJUR,       '+
                  ' IDPESSOA,        IDPLANOPREV,    IDPROVENTO,      IDTITULAR,       '+
                  ' INSCRICAONUMERO, MATRICULA,      MESCOBRANCA,     MESREFERENCIA,   '+
                  ' NUMPRIORIDADE,   ORDEM,          SISTORIGEM,      VALOR,           '+
                  ' PLACONTAC,       PLACONTAD,      PLANO,           UNIDNEGOC,       '+
                  ' CODPORTFORMA,    CODTIPDOC,      CODTIPRECDES,    RECPAG,          '+
                  ' VALORBASE1,      VALORBASE2,     VALORBASE3,      DATAREFERENCIA,  '+
                  ' DESCRICAO,       REFERENCIA,     CODCENTROCUSTOC, CODCENTROCUSTOD, '+
                  ' CODCENTRORESPON, CODSUBCONTA,    IDEMPRESA,       IDEMPRESAPROP,   '+
                  ' DATACOBRANCA,    NODOCUMENTO,    COMPLDOCUMENTO,  IDLOTE,          '+
                  ' IDEMPCOBRANCA,   PERIODO,        EXERCICIO,       TIPCODIGO,       '+
                  ' FLGEXISTEHST,    SITENVIO  , IDTMPDESC   ' ;   // P. 16777

    sSQLValues   := ''''+qry.FieldByName('CodProvDesc').AsString+'''';

    if sAlterador <> ''
    then begin
       sSQLValues := sSQLValues +','''+qry.FieldByName('CodAlterador').AsString+''''; // CodAlterador
       sSQLValues := sSQLValues +','''+sAlterador+'''';  //flgAlterador
    end
    else begin
       sSQLValues := sSQLValues +', NULL ';//codalterador
       sSQLValues := sSQLValues +', NULL ';//flgalterador
    end;

    // ALTERADO POR CAMILLE EM 24.11
    if (sAtrasoDevol = 'R') or (sAtrasoDevol = 'N')
    then sSQLValues := sSQLValues +',''N'''                   //flgAtrasoDevol
    else sSQLValues := sSQLValues +','''+sAtrasoDevol+'''';   //flgAtrasoDevol

    // Se o participante é assistido, o desconto vai para B - Folha de Beneficio
    //                         senao, o desconto vai paara P - Folha de Pagamento
    if sSitFundacao = 'AS'
    then sSQLValues := sSQLValues +', ''B'''   // FLGDESCFOLHA
    else if qry.FieldByName('flgDescFolha').AsInteger = 1
         then sSQLValues := sSQLValues +', ''P'''     // FLGDESCFOLHA
         else sSQLValues := sSQLValues +', ''O''';    // FLGDESCFOLHA

    sSQLValues := sSQLValues +', 1';  // FLGDESCONTO
    sSQLValues := sSQLValues +', '''+sTipoDesc+'''';  // FLGTIPODESC

    sSQLValues := sSQLValues +', '+qry.FieldByName('SeqProposta').AsString;   // SEQPROPOSTA  CAMILLE
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdContribuicao').AsString;// IDDESCONTO
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdFundacao').AsString;    // IDFUNDACAO
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdMotivo').AsString;      // IDMOTIVO
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdPessJur').AsString;     // IDPESSJUR
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdPessoa').AsString;      // IDPESSOA
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdPlanoPrev').AsString;   // IDPLANOPREV
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdRubrica').AsString;     // IDPROVENTO
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdPessoa').AsString;      // IDTITULAR
    sSQLValues := sSQLValues +', '+qry.FieldByName('InscricaoNumero').AsString; // INSCRICAONUMERO
    sSQLValues := sSQLValues +', '''+qry.FieldByName('Matricula').AsString+'''';       //MATRICULA
    sSQLValues := sSQLValues +', '''+sMesCobranca+'''';
    sSQLValues := sSQLValues +', '''+qry.FieldByName('MESREFERENCIA').AsString+'''';//MESREFERENCIA
    if qry.FieldByName('NumPrioridade').AsString <> ''                              // NUMPRIORIDADE
    then sSQLValues := sSQLValues +', '+qry.FieldByName('NumPrioridade').AsString
    else sSQLValues := sSQLValues+', NULL ';
    sSQLValues := sSQLValues +', '+IntToStr(piOrdem);                               //ORDEM
    sSQLValues := sSQLValues +', '+IntToStr(Sistema.IdModulo);                         //SISTORIGEM
    if sAlterador <> ''
    then sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorAlterador').AsString) //VALOR
    else sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorEsperado').AsString); //VALOR


    BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sPlaContaC,
                       qry.FieldByName(sPlaContaC).AsString,
                       'S',
                       qry.FieldbyName('IdPessJur').AsInteger,
                       qry.FieldbyName('IdPlanoPrev').AsInteger,
                       qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //PLACONTAC

   // Testar se, para a conta crédito encontrada, o CentroCustoC é obrigatorio
   bCCustoCObrig := False;
   if sValorEncontrado <> ''
   then begin
      dtmAPrev.qryVerificaObrig.Close;
      dtmAPrev.qryVerificaObrig.SQL.Clear;
      dtmAPrev.qryVerificaObrig.SQL.Add(' SELECT PLACCUST FROM PLANOCONTA '+
                               ' WHERE PLANO = '+IntToStr(IntegraBack.Plano)+' AND '+
                               '       PLACONTA = '''+sValorEncontrado+'''');
      dtmAPrev.qryVerificaObrig.Open;
      if dtmAPrev.qryVerificaObrig.IsEmpty or (dtmAPrev.qryVerificaObrig.FieldByName('PlaCCust').AsString = 'N')
      then bCCustoCObrig := False
      else bCCustoCObrig := True;
      dtmAPrev.qryVerificaObrig.Close;
   end;

   BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sPlaContaD,
                      qry.FieldByName(sPlaContaD).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //PLACONTAD

   // Testar se, para a conta débito encontrada, o CentroCustoD é obrigatorio
   bCCustoDObrig := False;
   if sValorEncontrado <> ''
   then begin
      dtmAPrev.qryVerificaObrig.Close;
      dtmAPrev.qryVerificaObrig.SQL.Clear;
      dtmAPrev.qryVerificaObrig.SQL.Add(' SELECT PLACCUST FROM PLANOCONTA '+
                               ' WHERE PLANO    = '+IntToStr(IntegraBack.Plano)+' AND '+
                               '       PLACONTA = '''+sValorEncontrado+'''');
      dtmAPrev.qryVerificaObrig.Open;
      if dtmAPrev.qryVerificaObrig.IsEmpty or (dtmAPrev.qryVerificaObrig.FieldByName('PlaCCust').AsString = 'N')
      then bCCustoDObrig := False
      else bCCustoDObrig := True;
      dtmAPrev.qryVerificaObrig.Close;
   end;

   sSQLValues := sSQLValues + ',' +IntToStr(IntegraBack.Plano);   //plano

   if bUnidNegocObrig //UNIDNEGOC
   then BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                      sUNIDNEGOC,qry.FieldByName(sUNIDNEGOC).AsString,
                      'N',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib )
   else BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,
                      sUNIDNEGOC,qry.FieldByName(sUNIDNEGOC).AsString,
                      'N',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);

    // Se nao for desconto em folha, o portador forma é obrigatório
    if Trim(qry.FieldByName(sCodPortadorForma).AsString) <> '' //CODPORTFORMA
    then sSQLValues := sSQLValues +', '+qry.FieldByName(sCodPortadorForma).AsString
    else sSQLValues := sSQLValues+', '+sCodPortForma;

    BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                     sCODTIPDOC,qry.FieldByName(sCodTipDoc).AsString,
                     'N',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //CODTIPDOC

   BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                      sCODTIPRECDES,qry.FieldByName(sCodTipRecDes).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //CODTIPRECDES

   BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                      sRECPAG,qry.FieldByName(sRecPag).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib); //RECPAG

    if qry.FieldByName('ValorOP1').AsString <> ''                           //VALORBASE1
    then sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorOP1').AsString)
    else sSQLValues := sSQLValues+', NULL ';

    if qry.FieldByName('ValorOP2').AsString <> ''                           //VALORBASE2
    then sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorOP2').AsString)
    else sSQLValues := sSQLValues+', NULL ';

    if qry.FieldByName('ValorOP3').AsString <> ''                           //VALORBASE3
    then sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorOP3').AsString)
    else sSQLValues := sSQLValues+', NULL ';

    sSQLValues := sSQLValues+', TO_DATE('''+sDataCobranca+''',''dd/mm/yyyy'') ';//DATAREFERENCIA
    sSQLValues := sSQLValues+', '''+Copy('Inscrição : '+qry.FieldByName('InscricaoNumero').AsString+
                              ' - '+qry.FieldByName('NOMECONTRIB').AsString,1,40)+'''';//DESCRICAO

    if sAlterador = 'J'
    then sSQLValues := sSQLValues+', ''Juros'' ' //REFERENCIA
    else if sAlterador = 'C'
         then sSQLValues := sSQLValues+', ''Correção'' '
         else sSQLValues := sSQLValues+', ''*** ''';

   if bCCustoCObrig  //CODCENTROCUSTOC
   then BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sCODCENTROCUSTOC,
                      qry.FieldByName(sCodCentroCustoC).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib )
   else BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,
                      sCODCENTROCUSTOC,qry.FieldByName(sCodCentroCustoC).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib );

   if bCCustoDObrig //CODCENTROCUSTOD
   then BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sCODCENTROCUSTOD,
                     qry.FieldByName(sCodCentroCustoD).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib)
   else BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,sCODCENTROCUSTOD,
                     qry.FieldByName(sCodCentroCustoD).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);


   if bCResponObrig //CODCENTRORESPON
   then BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sCODCENTRORESPON,
                      qry.FieldByName(sCodCentroRespon).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib)
   else BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,sCODCENTRORESPON,
                      qry.FieldByName(sCodCentroRespon).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib );

   BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,sCODSUBCONTA,
                      qry.FieldByName(sCodSUBCONTA).AsString,
                      'N',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //CODSUBCONTA

   if (bCCustoCObrig) or (bCCustoDObrig)                                //IDEMPRESA
   then BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sIDEMPRESA,
                       qry.FieldByName(sIDEMPRESA).AsString,
                       'N',
                       qry.FieldbyName('IdPessJur').AsInteger,
                       qry.FieldbyName('IdPlanoPrev').AsInteger,
                       qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib) //IDEMPRESA
   else BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,sIDEMPRESA,
                       qry.FieldByName(sIDEMPRESA).AsString,
                       'N',
                       qry.FieldbyName('IdPessJur').AsInteger,
                       qry.FieldbyName('IdPlanoPrev').AsInteger,
                       qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib); //IDEMPRESA

   sSQLValues := sSQLValues+', '+IntToStr(Sistema.IdEmpresa); // IDEMPRESAPROP
   sSQLValues := sSQLValues +', To_Date('''+sDataCobranca+''', ''dd/mm/yyyy'') ';// DATACOBRANCA
   sSQLValues := sSQLValues +', '+qry.FieldByName('NumRecebimento').AsString;    // NODOCUMENTO
   sSQLValues := sSQLValues +', '''+sMes+ '''';                                  // COMPLDOCUMENTO
   sSQLValues := sSQLValues +', '+IntToStr(piIdLote);                            // IDLOTE
   sSQLValues := sSQLValues +', '+qry.FieldByName('IdPessJur').AsString;         // IDEMPCOBRANCA
   sSQLValues := sSQLValues +', '+IntToStr(liPeriodo);                           // PERIODO
   sSQLValues := sSQLValues +', '+IntToStr(liExercicio);                         // EXERCICIO

   BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,
                    sTIPCODIGO,'',
                    'S',
                     qry.FieldbyName('IdPessJur').AsInteger,
                     qry.FieldbyName('IdPlanoPrev').AsInteger,
                     qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib); //TIPCODIGO

   sSQLValues := sSQLValues +', 1 ';       //FLGEXISTEHST  - ROSANA
   sSQLValues := sSQLValues +', ''0''';     //SITENVIO  - CAMILLE
   sSQLVAlues := sSQLVAlues +', '+Inttostr(LeUltRegistro(nil,'TMPDESC'));  // idtmpdesc - FERNANDO - p. 16777 

   // Se alguns dos campos estavam em branco -> Avisar e NAO GRAVAR na TMPDESC
   if Trim(sCamposObrig) <> ''
   then Exit;

   dtmAPrev.qry.Close;
   dtmAPrev.qry.SQL.Clear;
   dtmAPrev.qry.SQL.Add('INSERT INTO TMPDESC ('+sSQLFields+ ') VALUES ('+sSQLValues+')');
   try
       dtmAPrev.qry.ExecSQL;
      // Totalizar valor esperado
      if sAlterador <> ''
      then rValorEnviado := qry.FieldByName('ValorAlterador').AsFloat
      else rValorEnviado := qry.FieldByName('ValorEsperado').AsFloat;
   except
      Exit;
   end;

   // Atualizar ctrlinterface
{  // COMENTADO POR CAMILLE EM 18.12.98 -> FAZER FORA DO LOTE
   if not AtualizaCTRLINTERFACE(piIdLote,'FLGIDATMP','1','DATAIDATMP',
                                DateToStr(date))
   then begin
      Exit;
   end;
   }
   Result := rValorEnviado;
end;//EnviaContribuicao

function AtualizaSitContrib(qry : TwwQuery; piIdLote,piSitRecebimento : integer) : boolean;
begin
   Result := False;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO = '+IntToStr(piSitRecebimento) +
                        ' WHERE  IDLOTE  = '+IntToStr(piIdLote) );
   try
      qry.ExecSQL;
   except
      Exit;
   end;
   Result := True;
end; // AtualizaSitContrib

function GravaAlterador(sTipo,sMesReferencia,sMesCobranca : string;
                        piNumRecebimento,
                        piIdMotivo, pIdPlanoPrev, pIdContribuicao, pIdPessJur : integer;
                        sDataRef, sValor : string ) : boolean;
var sSQLRegra,
    sMesRef,
    sValorRegra : string;
    bErroRegra  : boolean;
    Dec,
    sFlgAtraso,
    sFlgDevol   : char;
begin
   Result       := False;
   // sTipo - Parametro que especifica o tipo de alterador (A-traso, D-evolução)
   sFlgAtraso   := '0';
   sFlgDevol    := '0';

   if sTipo = 'A'
   then sFlgAtraso := '1'
   else sFlgDevol  := '1';

   //== Procura pelos alteradores c/ flgcobra p/ a contribuição mencionadada e p/ Atraso ou Devolução
   dtmAPrev.qryAux2.Close;
   dtmAPrev.qryAux2.Sql.Clear;
   dtmAPrev.qryAux2.Sql.Add(' SELECT CODALTERADOR, IDREGRACALCULO FROM ALTERADORXCONTRIB  ' +
                            ' WHERE ( IDCONTRIBUICAO = '  + IntToStr(pIdContribuicao) + ' )'+
                            ' AND   ( IDPLANOPREV    = '  + IntToStr(pIdPlanoPrev)    + ' )'+
                            ' AND   ( FLGCOBRA       = 1                                  )'+
                            ' AND  (( FLGATRASO      = '  + sFlgAtraso +') OR '+
                            '       ( FLGDEVOL       = '  + sFlgDevol  +'))   ');

   dtmAPrev.qryAux2.Open;
   if not dtmAPrev.qryAux2.IsEmpty  //== Verifica se a contrib. está associada a rubricaxpess
   then begin
      with dtmAPrev.qry do
      begin
        Close;
        Sql.Clear;
        Sql.Add(' SELECT PV.IDRUBRICA FROM CONTPREV CP, RUBRICAXPESS PV '+
                ' WHERE  (CP.IDCONTRIBUICAO = '+IntToStr(pIdContribuicao) + ' )'+
                ' AND    (CP.IDPLANOPREV    = '+IntToStr(pIdPlanoPrev)    + ' )'+
                ' AND    (CP.IDRUBRICA      = PV.IDRUBRICA   ) '+
                ' AND    (PV.IDPESSOA       = '+IntToStr(pIdPessJur) +' ) ');
        Open;
        if dtmAPrev.qry.IsEmpty
        then begin
             dtmAPrev.qryAux2.Close;
             dtmAPrev.qry.Close;
             Exit;
        end;
      end;
   end;

   while not dtmAPrev.qryAux2.EOF do
     begin
         if dtmAPrev.qryAux2.FieldByName('IDREGRACALCULO').AsString = '' then
            continue;

         sMesRef   := Copy(sDataRef,7,4)+Copy(sDataRef,3,3);
         sSQLRegra := ' SELECT '+OraNumero(sValor)+' AS VALORPREV , '+
                      ''''+sDataRef+''' AS DATAREF '+
                      ''''+sMesRef +''' AS MESREFERENCIA '+
                      ' FROM DUAL  ';

         sValorRegra := RegraNumerica(dtmAPrev.qryAux2.FieldByName('IDREGRACALCULO').AsString, sSQLRegra, bErroRegra,iIdCalculoGeral);
         if sValorRegra = '' then
            continue;

         // Trocar decimal separator
         Dec := DecimalSeparator ;
         DecimalSeparator := '.';

         sValorRegra      := FormatFloat('###,###,###,###,##0.00',StrToFloat(sValorRegra));
         DecimalSeparator := Dec;

         with dtmAPrev.qry do
         begin
            //== Grava alteradores no HistoricoAlteradores
            Close;
            SQL.Clear;
            SQL.Add(' INSERT INTO HSTATRASOCONTRIB (NUMRECEBIMENTO,MESREFERENCIA, '+
                    '             MESCOBRANCA,IDMOTIVO,FLGTIPO,VALOR,CODALTERADOR)'+
                    ' VALUES('+IntToStr(piNumRecebimento)+', '+
                    ''''+sMesReferencia    +''', '+
                    ''''+sMesCobranca      +''', '+
                    ''  +IntToStr(piIdMotivo)+', '+
                    ''''+sTipo+''','+sValorRegra  + ',' + dtmAPrev.qryAux2.FieldByName('CODALTERADOR').AsString + ')');
            try
               ExecSQL;
            except
               Exit;
            end;
         end;//with
         dtmAPrev.qryAux2.Next;
     end;

   Result := True;
end;//GravaAlterador

function PreparaContribuicao(piIdPessJur, piIdPlanoPrev,
                             piIdMotivo,  piSitRecebimento : integer;
                             qryContrib,
                             qryAux     : TwwQuery;
                             sSQL,
                             sSQLRegra,
                             sWhereSQLRegra,
                             sAliasSQLRegra,
                             sSitFundacao,
                             sDataRefInicio,sDataRefFinal,
                             sDescPreparo,sAtrasoDevol : string;
                             bValorQry,
                             bParaCobranca : boolean;
                             var sMsgErro  : string;
                             var iIdLote   : integer;
                             sSalarioPart  : string) : boolean;
var
   iMes,
   iAno,
   iIdContribuicao,
   iNumRecebimento,
   iOrdem,
   iParcela,
   iNumReg, iUltDiaMes  : integer;
   sMesHoje,
   sAnoHoje,
   sAnoMesHoje,
   sAnoMesAtual,
   sAnoMesInicio,
   sAnoMesFinal,
   sAnoMesCobranca,
   sDataCobranca,
   sDataAux,
   sDataRef,
   sValorRegra,
   sValorFinal,
   sSQLRegraAUX,
   sCamposObrig,
   sCamposNObrig,
   sAno, sMes,
   sStrNumRecebimento,
   sSQLValues,
   sMensErro,
   sAnoMesCalc13Aux : string;
   bErro,
   bErroRegra, bCalc13 : boolean;
   liExercicio, liPeriodo, liEmpresa : longInt;
   rTotalLote : real;
begin
   Result   := False;
   bErro    := False;
   sMsgErro := '';
   sMensErro := '';
   if Trim(sSQL) = ''
   then begin
      sMsgErro := 'Parâmetros para o preparo incompletos : contribuições a cobrar.';
      Result := True;
      Exit;
   end;

   if Trim(sSitFundacao) = ''
   then begin
      sMsgErro := 'Parâmetros para o preparo incompletos : situação do titular.';
      Result   := True;
      Exit;
   end;

   if Trim(sDataRefInicio) = ''
   then begin
      sMsgErro := 'Parâmetros para o preparo incompletos : data de início.';
      Result := True;
      Exit;
   end;

   iNumReg := 0;
   rTotalLote := 0;

   // Abrir a query e verificar se tem alguma coisa a preparar
   qryContrib.Close;
   qryContrib.SQL.Clear;
   qryContrib.SQL.Add(sSQL);
   try
      qryContrib.Open;
   except
      sMsgErro := ' Erro na consulta de contribuições a preparar. ';
      Result := True;
      Exit;
   end;

   if qryContrib.IsEmpty
   then begin
      sMsgErro := ' Nenhuma contribuição encontrada para preparar. ';
      Result   := True;
      qryContrib.Close;
      Exit;
   end;

   // Preencher datas
   sAnoMesHoje := Copy(DateToStr(date), 7,4)+'/'+Copy(DateToStr(date),4,2);
   sMesHoje    := Copy(sAnoMesHoje,6,2);
   sAnoHoje    := Copy(sAnoMesHoje,1,4);

   sAnoMesInicio   := Copy(sDataRefInicio, 7,4) + '/' + Copy(sDataRefInicio, 4,2);

   // Preencher data da cobranca da contribuicao
   sDataCobranca   := CriticaDataCobrancaSit(dtmAPrev.qry,IntToStr(piIdPessJur),
                                           IntToStr(piIdPlanoPrev),
                                           sSitFundacao, 'N',
                                           sMesHoje, sAnoHoje);
   sAnoMesCobranca := Copy(sDataCobranca,7,4)+'/'+Copy(sDataCobranca,4,2);

   // Se nao tiver data final -> gerar até hoje
   // Se tiver e for menor que hoje -> gerar até a data
   // Se tiver e for maior que hoje -> gerar até hoje
   if sDataRefFinal    = ''
   then sAnoMesFinal  := sAnoMesHoje
   else if StrToDate(sDataRefFinal) < Date
        then sAnoMesFinal    := Copy(sDataRefFinal,7,4)+'/'+ Copy(sDataRefFinal,4,2)
        else sAnoMesFinal    := sAnoMesHoje;

 // Alterado por Camille em 04.11.98 às 16:37hs
 //        else sAnoMesFinal := Copy(sDataCobranca, 7,4) + '/' + Copy(sDataCobranca, 4,2);

   sAnoMesAtual       := sAnoMesInicio;
   iMes               := StrToInt(Copy(sAnoMesAtual,6,2));
   sStrNumRecebimento := '';

   // Gerar lote de contribuicao
   iIdLote := GeraLOTE(piIdPessJur,
                      True, // gravar o lote
                      sAnoMesHoje,
                      // sAnoMesCobranca, // Alterado por Camille em 04.11.98 às 17:56 hs
                      'P', sDescPreparo,sAtrasoDevol,
                      '1','0','0','0','0', DateToStr(date),'','','','',0,0);
   if iIdLote < 0
   then begin
      sMsgErro := ' Erro na geração do lote de contribuições. ';
      Exit;
   end;

   // A qry está com as contribuicoes da CONTRIBPREVPARTP que devem
   // ser preparadas
   qryContrib.First;
   while not qryContrib.eof do
   begin
      // Ler Rubricas Salariais
{     sValorSalPart     := CalcSALPART(piIdPessJur,qryContrib.FieldByName('IdPessoa').AsInteger,
                                      sAnoMesHoje, qryAux);
      sValorRemTotal    := CalcREMTotal(piIdPessJur,qryContrib.FieldByName('IdPessoa').AsInteger,
                                      sAnoMesHoje, qryAux);
      sValorRubParcial  := CalcRUBParcial(piIdPessJur,piIdPlanoPrev,
                                         qryContrib.FieldByName('IdPessoa').AsInteger,
                                         qryContrib.FieldByName('SeqProposta').AsInteger,
                                         sAnoMesHoje, qryAux);
      sValorRubMantido  := CalcRUBMantido(piIdPessJur,piIdPlanoPrev,
                                         qryContrib.FieldByName('IdPessoa').AsInteger,
                                         qryContrib.FieldByName('SeqProposta').AsInteger,
                                         sAnoMesHoje, qryAux);

      sValorSalPart    := OraNumero(sValorSalPart);
      sValorRemTotal   := OraNumero(sValorRemTotal);
      sValorRubParcial := OraNumero(sValorRubParcial);
      sValorRubMantido := OraNumero(sValorRubMantido);
}
      // Preencher qryAux com dados da contribuicao
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT CP.IDREGRACALCULO, CP.IDREGRAPRIMPAGTO, CP.IDREGRAULTPAGTO,        '+
                     '        C.QTDEPARCELAS, C.IDTPPERIODICIDADE, TP.QTDEMESES,                 '+
                     '        CP.FLGCORRECAOATRASO,  PL.IDREGRAATRASOCOR, CP.FLGJUROSATRASO, '+
                     '        PL.IDREGRAATRASOJUR, CP.FLGPAGADOR                                '+
                     ' FROM   CONTRIBUICAO C, TPPERIODICIDADE TP, PLANPREV PL, CONTPREV CP        '+
                     ' WHERE  CP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+' AND                    '+
                     '        CP.IDCONTRIBUICAO = '+qryContrib.FieldByName('IdContribuicao').AsString+' AND '+
                     '        PL.IDPLANOPREV = CP.IDPLANOPREV AND '+
                     '        CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND '+
                     '        C.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+) ');
      try
         qryAux.Open;
      except
         sMsgErro := ' Erro ao ler dados da contribuição. ';
         bErro := True;
         break;
      end;

      if qryAux.IsEmpty
      then begin
         sMsgErro := 'Parâmetros para o preparo incompleto. ';
         bErro := True;
         break;
      end;

      // Preencher variavel mes atual com o mes que esta sendo preparado no loop
      sAnoMesAtual:= sAnoMesInicio;
      bCalc13 := true;     //leonardo  ---  03/03/1999
      while (sAnoMesAtual <= sAnoMesFinal) do
      begin
         iIdContribuicao  := qryContrib.fieldbyname('IdContribuicao').AsInteger;

         //leonardo  ---  03/03/1999
         if (copy(sAnoMesAtual,6,2) = '12') and ( not  bCalc13 ) then
         sAnoMesCalc13Aux := copy(sAnoMesAtual,1,5)+'13'
         else sAnoMesCalc13Aux := sAnoMesAtual;
         //

         // Verificar se é para usar a regra de calculo ou se é para usar um valor
         // fixo passado na qry
         if not bValorQry
         then begin
            // Montar SQL para regra de calculo
            // Se a SQLRegra passada como parametro estiver em branco, utilizar a
            // funcao MontaSQLCalcContrib
            // Senao, montar sql baseada nos parametros passados
            if Trim(sSQLRegra) = ''
            then begin
                iUltDiaMes := TrazUltDiaMes(StrToInt(copy(sAnoMesAtual,6,2)),(StrToInt(copy(sAnoMesAtual,1,4))));
                sDataRef := IntToStr(iUltDiaMes) + '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);
                sSQLRegraAux := MontaSQLCalcContrib(piIdPessJur,  piIdPlanoPrev,
                                qryContrib.FieldByName('IdPessoa').AsInteger,
                                qryContrib.FieldByName('SeqProposta').AsInteger,
                                qryContrib.FieldByName('IdContribuicao').AsInteger,
                                piIdMotivo,
                                sSitFundacao,
                                sAnoMesCalc13Aux,          //leonardo  ---  03/03/1999
                                sDataRef, '0',
                                qryContrib.FieldByName('InscricaoData').AsString,
                                qryContrib.FieldByName('DataNasc').AsString,'N',
                                'HSTCONTRIBPREV','VALORESPERADO',sSalarioPart ); // PROVISORIO
             end
            else begin
               sSQLRegraAux := sSQLRegra  +' WHERE '+
                            sAliasSQLRegra+'.IDPESSOA       = '+qryContrib.FieldByName('IdPessoa').AsString+' AND '+
                            sAliasSQLRegra+'.IDPESSJUR      = '+IntToStr(piIdPessJur)+' AND '+
                            sAliasSQLRegra+'.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+' AND '+
                            sAliasSQLRegra+'.IDCONTRIBUICAO = '+qryContrib.FieldByName('IdContribuicao').AsString+' AND ';
               if sWhereSQLRegra <> ''
               then sSQLRegraAux := sSQLRegraAux + sWhereSQLRegra
               else sSQLRegraAux := Copy(sSQLRegraAux, 1, Length(sSQLRegraAux)-5);
            end;

            // Chamar regra
            sValorRegra := RegraNumerica(qryAux.FieldbyName('IdRegraCalculo').AsString,
                                         sSQLRegraAux,bErroRegra,iIdCalculoGeral);
            if bErroRegra
            then begin
               sMsgErro := 'Erro na Execução da Regra.';
               bErro := True;
               break;
            end
            else if sValorRegra = ''
                 then begin
                    sMsgErro := 'A Regra de Cálculo retornou um valor em branco.';
                    bErro := True;
                    break;
                 end
            else if (sValorRegra = '0') or (sValorRegra = '0.00')
                 then begin
                    sMsgErro := 'A Regra de Cálculo retornou Zero.';
                    bErro := True;
                    break;
                 end;

            sValorFinal := OraNumero(sValorRegra);

            // Verificar se é o primeiro ou ultimo pagamento
            if (sAnoMesAtual = sAnoMesInicio) and
               (qryAux.FieldbyName('IDREGRAPRIMPAGTO').AsString <> '')
            then begin
               // Se a regra de primeiro pagamento estiver em branco, supor
               // que o valor do primeiro pagamento é igual ao valor total
//             iUltDiaMes := TrazUltDiaMes(StrToInt(copy(sAnoMesAtual,6,2)),(StrToInt(copy(sAnoMesAtual,1,4))));
//             sDataRef := IntToStr(iUltDiaMes) + '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);
               sDataRef := Copy(sDataRefInicio,1,2)+'/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4);
               sSQLRegraAux := MontaSQLCalcContrib(piIdPessJur,  piIdPlanoPrev,
                                qryContrib.FieldByName('IdPessoa').AsInteger,
                                qryContrib.FieldByName('SeqProposta').AsInteger,
                                qryContrib.FieldByName('IdContribuicao').AsInteger,
                                piIdMotivo,
                                sSitFundacao,
                                sAnoMesCalc13Aux,          //leonardo  ---  03/03/1999
                                sDataRef, sValorFinal,
                                qryContrib.FieldByName('InscricaoData').AsString,
                                qryContrib.FieldByName('DataNasc').AsString,
                                'P','HSTCONTRIBPREV','VALORESPERADO',sSalarioPart );

               sValorRegra := RegraNumerica(qryAux.FieldbyName('IDREGRAPRIMPAGTO').AsString,
                                            sSQLRegraAux,bErroRegra,iIdCalculoGeral);

               if bErroRegra
               then begin
                  sMsgErro := 'Erro na Execução da Regra de Cálculo do Primeiro Pagamento. ';
                  bErro := True;
                  break;
               end
               else
               if sValorRegra = ''
               then begin
                  sMsgErro := 'A Regra de Cálculo do Primeiro Pagamento retornou um valor em branco';
                  bErro := True;
                  break;
               end;

             //  if StrToFloat(ClienteNumero(sValorRegra)) < 0 then
               if StrToFloat(ClienteNumero(sValorRegra)) >= 0
               then sValorFinal := sValorRegra;
            end // if MesAtual = MesInicio
            else begin
               if (sAnoMesAtual = sAnoMesFinal) and
                    (sDataRefFinal <> '')         and
                    (sAnoMesFinal <= sAnoMesHoje) and
                    (qryAux.FieldbyName('IDREGRAULTPAGTO').AsString <> '')
               then begin
//                     iUltDiaMes := TrazUltDiaMes(StrToInt(copy(sAnoMesAtual,6,2)),(StrToInt(copy(sAnoMesAtual,1,4))));
//                     sDataRef := IntToStr(iUltDiaMes) + '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);
                     sDataRef := Copy(sDataRefFinal,1,2)+'/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4);
                     sSQLRegraAux := MontaSQLCalcContrib(piIdPessJur,  piIdPlanoPrev,
                                     qryContrib.FieldByName('IdPessoa').AsInteger,
                                     qryContrib.FieldByName('SeqProposta').AsInteger,
                                     qryContrib.FieldByName('IdContribuicao').AsInteger,
                                     piIdMotivo,
                                     sSitFundacao,
                                     sAnoMesCalc13Aux,          //leonardo  ---  03/03/1999
                                     sDataRef, sValorFinal,
                                     qryContrib.FieldByName('InscricaoData').AsString,
                                     qryContrib.FieldByName('DataNasc').AsString,
                                     'U','HSTCONTRIBPREV','VALORESPERADO',sSalarioPart );
                     sValorRegra := RegraNumerica(qryAux.FieldbyName('IDREGRAULTPAGTO').AsString,
                                                  sSQLRegraAux,bErroRegra,iIdCalculoGeral);
                     if bErroRegra
                     then begin
                        sMsgErro := 'Erro na Execução da Regra de Cálculo do Último Pagamento. ';
                        bErro    := True;
                        break;
                     end
                     else if sValorRegra = ''
                          then begin
                             sMsgErro := 'A Regra de Cálculo do Último Pagamento retornou um valor em branco.';
                             bErro := True;
                             break;
                          end;
                     // if StrToFloat(ClienteNumero(sValorRegra)) < 0 // comentado por CAMILLE em 19.11
                     if StrToFloat(ClienteNumero(sValorRegra)) >= 0
                     then sValorFinal := sValorRegra;
               end; // if MesAtual
            end; //else-if MesAtual = MesInicio
         end// if not bValorQry
         else sValorFinal := qryContrib.FieldByName('Valor').AsString;

         // Gerar numero do recebimento
         iNumRecebimento := LeUltRegistro(dtmAPrev.qry, 'HSTCONTRIBPREV');

         // Calcular número da parcela
         iParcela := CalculaNumParcela(sAnoMesCalc13Aux,  //leonardo --- 03/03/1999
                                  piIdPessJur,
                                  piIdPlanoPrev,
                                  qryContrib.FieldByName('IdPessoa').AsInteger,
                                  qryContrib.FieldByName('SeqProposta').AsInteger,
                                  qryContrib.FieldByName('IdContribuicao').AsInteger);
         if iParcela < 0 then iParcela := 0;

         // Inserir valor final na HSTCONTRIBPREV
         with dtmAPrev.qry do
         begin
            sSQLValues := ''''+sAnoMesCalc13Aux+''''; // MESREFERENCIA          //leonardo  ---  03/03/1999
            sSQLValues := sSQLValues+','''+sAnoMesCobranca+'''';
            sSQLValues := sSQLValues+',' +IntToStr(iNumRecebimento);
            sSQLValues := sSQLValues+',' +IntToStr(piIdMotivo);
            if (Trim(qryContrib.FieldByName('CodPortForma').AsString) <> '') and
               (qryContrib.FieldByName('CodPortForma').AsInteger > 0)
            then sSQLValues := sSQLValues+', ' +qryContrib.FieldByName('CodPortForma').AsString
            else sSQLValues := sSQLValues+', NULL ';
            sSQLValues := sSQLValues+', TO_DATE('''+sDataCobranca+''',''DD/MM/YYYY'') ';//DATAPREVISAORECE
            sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);//VALORESPERADO
            sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);//VALORCALCULADO
            sSQLValues := sSQLValues+', '+qryAux.FieldByName('IdRegraCalculo').AsString;
            sSQLValues := sSQLValues+', '+qryContrib.FieldByName('FlgDescFolha').AsString;
            sSQLValues := sSQLValues+', '+qryContrib.FieldbyName('IdPessoa').AsString;
            sSQLValues := sSQLValues+', '+qryContrib.FieldbyName('SeqProposta').AsString;
            sSQLValues := sSQLValues+', '+IntToStr(piIdPessJur);
            sSQLValues := sSQLValues+', '+IntToStr(piIdPlanoPrev);
            sSQLValues := sSQLValues+', '+qryContrib.FieldByName('IdContribuicao').AsString;
            sSQLValues := sSQLValues+', 0'; //FLGCALCRESERVA
            if Trim(qryContrib.FieldbyName('ValorBase1').AsString) <> ''
            then sSQLValues := sSQLValues+', '+OraNumero(qryContrib.FieldbyName('ValorBase1').AsString)
            else sSQLValues := sSQLValues+', NULL ';

            if Trim(qryContrib.FieldbyName('ValorBase2').AsString) <> ''
            then sSQLValues := sSQLValues+', '+OraNumero(qryContrib.FieldbyName('ValorBase2').AsString)
            else sSQLValues := sSQLValues+', NULL ';

            if Trim(qryContrib.FieldbyName('ValorBase3').AsString) <> ''
            then sSQLValues := sSQLValues+', '+OraNumero(qryContrib.FieldbyName('ValorBase3').AsString)
            else sSQLValues := sSQLValues+', NULL ';

            if Trim(qryContrib.FieldbyName('DATAINICIO').AsString) <> ''
            then sSQLValues := sSQLValues+', TO_DATE('''+qryContrib.FieldByName('DataInicio').AsString+''',''DD/MM/YYYY'') '
            else sSQLValues := sSQLValues+', NULL ';

            if Trim(qryContrib.FieldbyName('DATAFINAL').AsString) <> ''
            then sSQLValues := sSQLValues+', TO_DATE('''+qryContrib.FieldByName('DataFINAL').AsString+''',''DD/MM/YYYY'') '
            else sSQLValues := sSQLValues+', NULL ';

            sSQLValues := sSQLValues+', '''+sSitFundacao+'''';       //FLGSITFUNDACAO
            sSQLValues := sSQLValues+', '+IntToStr(piSitRecebimento);//SITRECEBIMENTO
            sSQLValues := sSQLValues+', '''+sTipoPrevidencia+'''';   //TIPO
            sSQLValues := sSQLValues+', '+IntToStr(iIdLote);         //IDLOTE
            sSQLValues := sSQLValues+', '+IntToStr(iParcela);        //PARCELA

            Close;
            SQL.Clear;
            SQL.Add(' INSERT INTO HSTCONTRIBPREV (MESREFERENCIA,MESCOBRANCA,NUMRECEBIMENTO,IDMOTIVO,'+
                    '                             CODPORTFORMA,DATAPREVISAORECE,'+
                    '                             VALORESPERADO,VALORCALCULADO,IDREGRACALCULO, '+
                    '                             FLGDESCFOLHA,IDPESSOA,SEQPROPOSTA,IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
                    '                             FLGCALCRESERVA,VALOROP1,VALOROP2,VALOROP3,DATAINICIO,DATAFINAL,         '+
                    '                             FLGSITFUNDACAO,SITRECEBIMENTO,TIPO,IDLOTE,PARCELA) '+
                    ' VALUES('+sSQLValues+')');
            try
               Execsql;
               inc(iNumReg);
               rTotalLote := rTotalLote + StrToFloat(ClienteNumero(sValorFinal));
 //              if dtmbasedados.dbbasedados.intransaction
 //              then begin
 //                 dtmBaseDados.dbbasedados.commit;
 //                 dtmbasedados.dbbasedados.starttransaction;
 //              end;
             except
               sMsgErro := 'Erro na gravação do Histórico de Contribuições. ';
               bErro := True;
               break;
            end;
         end;//with

         // Se a contribuicao for atrasada -> Gravar Alteradores
         if (sAnoMesAtual < sAnoMesHoje)
         then begin
            //== Grava no HistoricoDeAtraso e faz o Envio para TmpDesc
            if not GravaAlterador('A',sAnoMesCalc13Aux, //leonardo --- 03/03/1999
                        sAnoMesCobranca,
                        iNumRecebimento,
                        piIdMotivo,
                        piIdPlanoPrev,
                        qryContrib.FieldByName('IdContribuicao').AsInteger,
                        piIdPessJur,
                        sDataRefInicio,
                        sValorFinal )
            then begin                                         // PAREI AQUI
               sMsgErro := ' Erro na gravação dos alteradores da contribuição.  '+ #13 +
                           ' Verifique associação de rubricas da contribuição - '+qryContrib.FieldByName('IdContribuicao').AsString;
               bErro    := True;
               break;
            end;
            sStrNumRecebimento := sStrNumRecebimento + IntToStr(iNumRecebimento) +',';
         end; //if sAnoMesAtual < sAnoMesHoje


         // Gravar juros da contribuicao - Saiu não existe mais J/C e sim uma tab. de alteradores
{        if (sAnoMesAtual < sAnoMesHoje) and
            (qryAux.FieldByName('FLGJUROSATRASO').AsInteger = 1)
         then begin
            if not GravaAlterador('J',sAnoMesAtual,sAnoMesCobranca,
                        iNumRecebimento,
                        piIdMotivo,
                        piIdPlanoPrev,
                        qryContrib.FieldByName('IdContribuicao').AsInteger,
                        sDataRefInicio,
                        sValorFinal)
            then begin
               sMsgErro := ' Erro na gravação do juros da contribuição. ';
               bErro    := True;
               break;
            end;
         end;// if flgCorrecaoAtraso}

         if bParaCobranca
         then begin
            if not EncerraCobrancaContrib(piIdPessJur,piIdPlanoPrev,
                                          qryContrib.FieldbyName('IdPessoa').AsInteger,
                                          qryContrib.FieldbyName('SeqProposta').AsInteger,
                                          qryContrib.FieldByName('IdContribuicao').AsInteger)
            then begin
               sMsgErro := ' Erro no encerramento da cobrança da contribuição. ';
               bErro    := True;
               break;
            end;
         end;

         //verifica se o mes atual é dezembro e se o 13 já
         //foi calculado, se não então não muda o mês e
         //faz com o mês 13
         //leonardo  ---  03/03/1999
         if (copy(sAnoMesAtual,6,2) = '12') and ( bCalc13 ) then
         bCalc13 := false
         else
         begin
            sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
            bCalc13 := true;
         end;


      end;// while mesatual < mesfinal

      if bErro then break;

      if not AtualizaUltMesPREPARO(sAnoMesFinal, piIdPessJur, piIdPlanoPrev,
                                   qryContrib.FieldbyName('IdPessoa').AsInteger,
                                   qryContrib.FieldbyName('SeqProposta').AsInteger,
                                   qryContrib.FieldByName('IdContribuicao').AsInteger)
      then begin
         sMsgErro := ' Erro na gravação do Último Mês de Preparo. ';
         bErro    := True;
         break;
      end;

      qryContrib.next;
   end;//while


   //===== Gravar os alteradores na TempDesc (Envio de Alteradores)
   if sStrNumRecebimento <> '' then
   begin
      // Verifica Tabela de Parametros Contábeis, para pegar o Plano
      qryAux.Sql.Clear;
      qryAux.Sql.Text := ' SELECT  MASCARA,   PAR.PLANO       '+
                         ' FROM    PLANO PLA, PARAMCONTAB PAR '+
                         ' WHERE ( PAR.IDPESSOA = '+IntToStr(Sistema.idEmpresa) +' )'+
                         ' AND   ( PLA.PLANO    = PAR.PLANO )';
      qryAux.Open;
      if (not qryAux.EOF)
      then begin
           IntegraBack.Plano        := qryAux.FieldbyName('PLANO').AsInteger;
           IntegraBack.MascaraPlano := qryAux.FieldbyName('MASCARA').AsString;
      end
      else begin
         sMsgErro := 'Erro ao ler parâmetros contábeis. No envio de alteradores.';
         Result   := True;
         qryAux.Close;
         Exit;
      end;

      if LerAlteradorContrib(1, piIdMotivo, iIdLote, piSitRecebimento,
                             sAnoMesAtual,  sAnoMesCobranca, 'A', qryAux)
      then begin
         if prmFlgIntContab = 1
           then begin
                liEmpresa := Sistema.IdEmpresa;
                if TestaPeriodo(False,dtmBaseDados.dbBaseDados.DatabaseName,
                                DateToStr(date),
                                IntToStr(Sistema.IdModulo),
                                liExercicio,
                                liPeriodo,
                                liEmpresa,sMensErro) <> 0
                then begin
                     sMsgErro := 'Erro no Envio de alteradores. O Período Contábil para lançamentos em '+DateToStr(date)+' já foi encerrado.';
                     Result   := True;
                     Exit;
                end;
           end
           else begin
                liExercicio := -1;
                liPeriodo   := -1;
           end;

           sCamposObrig     := '';
           sCamposNObrig    := '';

           sAno   := Copy(sAnoMesAtual,1,4);
           sMes   := Copy(sAnoMesAtual,6,2);
           iOrdem := 0;

           while not qryAux.Eof do
           begin
               Inc(iOrdem);
               if EnviaContribuicao(qryAux, iOrdem, iIdLote, liPeriodo, liExercicio,
                                    sMes, sAno,   sSitFundacao, 'A', 'C', 'P',
                                    sCamposObrig, sCamposNObrig, 1) = -1
               then begin
                   sMsgErro := 'Erro ao efetuar o envio de alteradores. ';
                   Result   := True;
                   Exit;
               end;
               qryAux.next;
           end;
      end;// Fim Envia Alteradores
   end;// Fim sStrNumRecebimento <> ''


   // Gravar total do lote
   if not AtualizaCTRLINTERFACE(iIdLote, 'FLGPREPARADO',
                               '1','DATAPREPARO',DateToStr(date))
   then begin
      sMsgErro := ' Erro na atualização do total do lote. ';
      bErro := True;
      Exit;
   end;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' UPDATE CTRLINTERFACE SET NUMREG = '+IntToStr(iNumReg)+', '+
                  '        VLRTOTAL = '+OraNumero(FloatToStr(rTotalLote)));
   try
      qryAux.ExecSQL;
   except
      sMsgErro := ' Erro na atualização do total do lote. ';
      bErro    := True;
      Exit;
   end;

   qryContrib.Close;
   Result      := bErro;
end;//PreparaContribuicao

function MontaSQLCalcContrib(piIdPessJur,  piIdPlanoPrev, piIdPessoa, piSeqProposta,
                             piIdContribuicao,piIdMotivoContrib : integer;
                             sSitFundacao, sMesReferencia, sDataRef, sValorFinal,
                             sInscricaoData, sDataNasc,
                             sTipoCalculo,sTabelaValor,sCampoValor,sSalarioPart : string) : string;
var sSQLRegra,
    sMesReferenAnt : string;
    sSQLFinal,                                  
    sNomeTabela,sCampoPessJur  : string;
    sValorSalPart,
    sValorRemTotal,
    sValorRubParcial,
    sValorRubMantido,
    sAssoc1Op1, sAssoc1Op2, sAssoc1Op3, sValorAssociado,
    sAssoc2Op1, sAssoc2Op2, sAssoc2Op3, sValorAssociado2,
    sAssoc3Op1, sAssoc3Op2, sAssoc3Op3, sValorAssociado3  : string;
    piQtdeContribAssoc,
    piIdContribAssoc1 {, piIdContribAssoc2} {,piIdContribAssoc3} : integer;
    psFlgPagadorAssoc1, psFlgPagadorAssoc2, psFlgPagadorAssoc3 : string;
    sCampoContrib : string;
    sDataDemissao, sValorBase1,sValorBase2,sValorBase3 : string; // camille em 01.02
begin
   Result := '';
   sSQLFinal := '';
   if UpperCase(sTabelaValor) = 'TMPDESC'
   then sCampoContrib := 'IDDESCONTO'
   else sCampoContrib := 'IDCONTRIBUICAO';

   sAssoc1Op1       := '0';
   sAssoc1Op2       := '0';
   sAssoc1Op3       := '0';
   sValorAssociado  := '0';
   sAssoc2Op1       := '0';
   sAssoc2Op2       := '0';
   sAssoc2Op3       := '0';
   sValorAssociado2 := '0';
   sAssoc3Op1       := '0';
   sAssoc3Op2       := '0';
   sAssoc3Op3       := '0';
   sValorAssociado3 := '0';
   psFlgPagadorAssoc1 := '';
   psFlgPagadorAssoc2 := '';
   psFlgPagadorAssoc3 := '';


   // Ler contribuicoes Associadas
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT CPP.IDCONTRIBPAI, '+
               '       CPART.VALORBASE1,CPART.VALORBASE2,CPART.VALORBASE3, '+
              '        CPP.IDCONTRIBPAI2, CPP.IDCONTRIBPAI3, CASSOC1.FLGPAGADOR AS FLGPAGADORASSOC1, '+
              '        CASSOC2.FLGPAGADOR AS FLGPAGADORASSOC2,CASSOC3.FLGPAGADOR AS FLGPAGADORASSOC3 '+
              ' FROM   CONTRIBUICAO C, CONTPREV CPP, CONTPREV CASSOC1, CONTPREV CASSOC2, '+
              '        CONTPREV CASSOC3, CONTRIBPREVPARTP CPART '+
              ' WHERE  C.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO AND '+
              '        CPP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+' AND      '+
              '        CPP.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND      '+
              '        CPART.IDPESSOA = '+IntToStr(piIdPessoa)+' AND '+
              '        CPART.SEQPROPOSTA = '+IntToStr(piSeqProposta)+' AND '+
              '        CPART.IDPESSJUR = '+IntToStr(piIdPessJur)+' AND '+
              '        CPART.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+' AND '+
              '        CPART.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
              '        CPP.IDPLANOPREV  = CASSOC1.IDPLANOPREV(+) AND    '+
              '        CPP.IDCONTRIBPAI = CASSOC1.IDCONTRIBUICAO(+) AND '+
              '        CPP.IDPLANOPREV  = CASSOC2.IDPLANOPREV(+) AND    '+
              '        CPP.IDCONTRIBPAI2 = CASSOC2.IDCONTRIBUICAO(+) AND  '+
              '        CPP.IDPLANOPREV  = CASSOC3.IDPLANOPREV(+) AND    '+
              '        CPP.IDCONTRIBPAI3 = CASSOC3.IDCONTRIBUICAO(+) '+
              ' ORDER  BY CPP.ORDEMCALCULO ');
      Open;
      if IsEmpty then Exit;

      sValorBase1 := OraNumero(FieldByName('ValorBase1').AsString);
      sValorBase2 := OraNumero(FieldByName('ValorBase2').AsString);
      sValorBase3 := OraNumero(FieldByName('ValorBase3').AsString);

      piQtdeContribAssoc := 0;

      if FieldByName('IdContribPai').AsString <> ''
      then begin
         piIdContribAssoc1 := FieldByName('IdContribPai').AsInteger;
         psFlgPagadorAssoc1 := FieldByName('FlgPagadorAssoc1').AsString;
         inc(piQtdeContribAssoc);
      end;
      if FieldByName('IdContribPai2').AsString <> ''
      then begin
        // piIdContribAssoc2 := FieldByName('IdContribPai2').AsInteger;
         psFlgPagadorAssoc2 := FieldByName('FlgPagadorAssoc2').AsString;
         inc(piQtdeContribAssoc);
      end;
      if FieldByName('IdContribPai3').AsString <> ''
      then begin
        // piIdContribAssoc3 := FieldByName('IdContribPai3').AsInteger;
         psFlgPagadorAssoc3 := FieldByName('FlgPagadorAssoc3').AsString;
         inc(piQtdeContribAssoc);
      end;
   end;

   // Calcular 1a. opcao
   if piQtdeContribAssoc >= 1
   then begin
      if psFlgPagadorAssoc1 = 'E'
      then begin
         sNomeTabela   := 'CONTRIBPREVPATRO';
         sCampoPessJur := 'IDPESSOA';
      end
      else begin
         sNomeTabela   := 'CONTRIBPREVPARTP';
         sCampoPessJur := 'IDPESSJUR';
      end;

      dtmAPrev.qry.Close;
      dtmAPrev.qry.SQL.Clear;
      dtmAPrev.qry.SQL.Add(' SELECT H.'+Trim(sCampoValor)+', C.VALORBASE1, C.VALORBASE2, C.VALORBASE3 '+
                     ' FROM   '+sTabelaValor+' H, '+sNomeTabela+' C '+
                     ' WHERE  C.'+sCampoPessJur+'  = '+IntToStr(piIdPessJur)  +' AND '+
                     '        C.IDPLANOPREV        = '+IntToStr(piIdPlanoPrev)+' AND '+
                     '        C.IDPESSOA           = '+IntToStr(piIdPessoa)   +' AND '+
                     '        C.IDCONTRIBUICAO     = '+IntToStr(piIdContribAssoc1)+' AND '+
                     '        H.SEQPROPOSTA(+)     = '+IntToStr(piSeqProposta)+' AND '+
                     '        H.MESREFERENCIA(+)   <= '''+sMesReferencia +''' AND '+
                     '        C.'+sCampoPessJur+' = H.IDPESSJUR(+) AND '+
                     '        C.IDPLANOPREV    = H.IDPLANOPREV(+) AND '+
                     '        C.IDPESSOA       = H.IDPESSOA(+) AND '+
                     '        C.IDCONTRIBUICAO = H.'+sCampoContrib+'(+) ORDER BY H.MESREFERENCIA DESC ');
      dtmAPrev.qry.Open;

      if not dtmAPrev.qry.IsEmpty then dtmAPrev.qry.First;
      if dtmAPrev.qry.FieldByName(sCampoValor).AsString = ''
      then sValorAssociado := '0'
      else sValorAssociado := OraNumero(dtmAPrev.qry.FieldByName(sCampoValor).AsString);

      if dtmAPrev.qry.FieldByName('ValorBase1').AsString = ''
      then sAssoc1Op1 := '0'
      else sAssoc1Op1 := OraNumero(dtmAPrev.qry.FieldByName('ValorBase1').AsString);

      if dtmAPrev.qry.FieldByName('ValorBase2').AsString = ''
      then sAssoc1Op2 := '0'
      else sAssoc1Op2 := OraNumero(dtmAPrev.qry.FieldByName('ValorBase2').AsString);

      if dtmAPrev.qry.FieldByName('ValorBase3').AsString = ''
      then sAssoc1Op3 := '0'
      else sAssoc1Op3 := OraNumero(dtmAPrev.qry.FieldByName('ValorBase3').AsString);
   end;

   // Calcular 2a. opcao
   if piQtdeContribAssoc >= 2
   then begin
      if psFlgPagadorAssoc2 = 'E'
      then begin
         sNomeTabela   := 'CONTRIBPREVPATRO';
         sCampoPessJur := 'IDPESSOA';
      end
      else begin
         sNomeTabela   := 'CONTRIBPREVPARTP';
         sCampoPessJur := 'IDPESSJUR';
      end;
      dtmAPrev.qry.Close;
      dtmAPrev.qry.SQL.Clear;
      dtmAPrev.qry.SQL.Add(' SELECT H.'+Trim(sCampoValor)+', C.VALORBASE1, C.VALORBASE2, C.VALORBASE3 '+
                     ' FROM   '+sTabelaValor+' H, '+sNomeTabela+' C '+
                     ' WHERE  C.'+sCampoPessJur+'  = '+IntToStr(piIdPessJur)  +' AND '+
                     '        C.IDPLANOPREV        = '+IntToStr(piIdPlanoPrev)+' AND '+
                     '        C.IDPESSOA           = '+IntToStr(piIdPessoa)   +' AND '+
                     '        C.IDCONTRIBUICAO     = '+IntToStr(piIdContribAssoc1)+' AND '+
                     '        H.SEQPROPOSTA(+)     = '+IntToStr(piSeqProposta)+' AND '+
                     '        H.MESREFERENCIA(+)   <= '''+sMesReferencia      +''' AND '+
                     '        C.'+sCampoPessJur+' = H.IDPESSJUR(+) AND '+
                     '        C.IDPESSOA       = H.IDPESSOA(+) AND '+
                     '        C.IDPLANOPREV    = H.IDPLANOPREV(+) AND '+
                     '        C.IDCONTRIBUICAO = H.'+sCampoContrib+'(+) ORDER BY H.MESREFERENCIA DESC ');
      dtmAPrev.qry.Open;
      if not dtmAPrev.qry.IsEmpty then dtmAPrev.qry.First;
      if dtmAPrev.qry.FieldByName(sCampoValor).AsString = ''
      then sValorAssociado2 := '0'
      else sValorAssociado2 := OraNumero(dtmAPrev.qry.FieldByName(sCampoValor).AsString);

      if dtmAPrev.qry.FieldByName('ValorBase1').AsString = ''
      then sAssoc2Op1 := '0'
      else sAssoc2Op1 := OraNumero(dtmAPrev.qry.FieldByName('ValorBase1').AsString);

      if dtmAPrev.qry.FieldByName('ValorBase2').AsString = ''
      then sAssoc2Op2 := '0'
      else sAssoc2Op2 := OraNumero(dtmAPrev.qry.FieldByName('ValorBase2').AsString);

      if dtmAPrev.qry.FieldByName('ValorBase3').AsString = ''
      then sAssoc2Op3 := '0'
      else sAssoc2Op3 := OraNumero(dtmAPrev.qry.FieldByName('ValorBase3').AsString);
   end;// opcao 2

   // Calcular 3a. opcao
   if piQtdeContribAssoc >= 3
   then begin
      if psFlgPagadorAssoc3 = 'E'
      then begin
         sNomeTabela   := 'CONTRIBPREVPATRO';
         sCampoPessJur := 'IDPESSOA';
      end
      else begin
         sNomeTabela   := 'CONTRIBPREVPARTP';
         sCampoPessJur := 'IDPESSJUR';
      end;
      dtmAPrev.qry.Close;
      dtmAPrev.qry.SQL.Clear;
      dtmAPrev.qry.SQL.Add(' SELECT H.'+Trim(sCampoValor)+', C.VALORBASE1, C.VALORBASE2, C.VALORBASE3 '+
                     ' FROM   '+sTabelaValor+' H, '+sNomeTabela+' C '+
                     ' WHERE  C.'+sCampoPessJur+'  = '+IntToStr(piIdPessJur)  +' AND '+
                     '        C.IDPLANOPREV        = '+IntToStr(piIdPlanoPrev)+' AND '+
                     '        C.IDPESSOA           = '+IntToStr(piIdPessoa)   +' AND '+
                     '        C.IDCONTRIBUICAO     = '+IntToStr(piIdContribAssoc1)+' AND '+
                     '        H.SEQPROPOSTA(+)     = '+IntToStr(piSeqProposta)+' AND '+
                     '        H.MESREFERENCIA(+)   <= '''+sMesReferencia      +''' AND '+
                     '        C.'+sCampoPessJur+'  = H.IDPESSJUR(+) AND '+
                     '        C.IDPESSOA           = H.IDPESSOA(+) AND '+
                     '        C.IDPLANOPREV        = H.IDPLANOPREV(+) AND '+
                     '        C.IDCONTRIBUICAO     = H.'+sCampoContrib+'(+) ORDER BY H.MESREFERENCIA DESC ');
      dtmAPrev.qry.Open;
      if not dtmAPrev.qry.IsEmpty then dtmAPrev.qry.First;
      if dtmAPrev.qry.FieldByName(sCampoValor).AsString = ''
      then sValorAssociado3 := '0'
      else sValorAssociado3 := OraNumero(dtmAPrev.qry.FieldByName(sCampoValor).AsString);

      if dtmAPrev.qry.FieldByName('ValorBase1').AsString = ''
      then sAssoc3Op1 := '0'
      else sAssoc3Op1 := OraNumero(dtmAPrev.qry.FieldByName('ValorBase1').AsString);

      if dtmAPrev.qry.FieldByName('ValorBase2').AsString = ''
      then sAssoc3Op2 := '0'
      else sAssoc3Op2 := OraNumero(dtmAPrev.qry.FieldByName('ValorBase2').AsString);

      if dtmAPrev.qry.FieldByName('ValorBase3').AsString = ''
      then sAssoc3Op3 := '0'
      else sAssoc3Op3 := OraNumero(dtmAPrev.qry.FieldByName('ValorBase3').AsString);
   end;//opcao 3


   sValorSalPart    := OraNumero(sSalarioPart);
   sValorRemTotal   := OraNumero(sSalarioPart);
   sValorRubParcial := OraNumero(sSalarioPart);
   sValorRubMantido := OraNumero(sSalarioPart);
   if sSalarioPart = ''
   then begin
         // Ler Rubricas Salariais
         sValorSalPart    := CalcSALPART(piIdPessJur,piIdPessoa,sMesReferencia, dtmAPrev.qry);
         sValorRemTotal   := CalcREMTotal(piIdPessJur,piIdPessoa,sMesReferencia, dtmAPrev.qry);
         sValorRubParcial := CalcRUBParcial(piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,
                                            sMesReferencia, dtmAPrev.qry);
         sValorRubMantido := CalcRUBMantido(piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,
                                            sMesReferencia, dtmAPrev.qry);

         sValorSalPart    := OraNumero(sValorSalPart);
         sValorRemTotal   := OraNumero(sValorRemTotal);
         sValorRubParcial := OraNumero(sValorRubParcial);
         sValorRubMantido := OraNumero(sValorRubMantido);
   end;

   if (sTipoCalculo = 'P') or (sTipoCalculo = 'U')
   then begin // Se for calculo do 1o. pagamento ou ultimo pagamento
      if sInscricaoData = '' then sInscricaoData := sDataRef;
      if sDataNasc = ''      then sDataNasc := sDataRef;
      sDataDemissao := CalcDataDemissao(piIdPessoa, piIdpessJur,dtmAPrev.qry); //camille em 01.02
      if trim(sDataDemissao) = '' then sDataDemissao := sDataRef;

      sSQLRegra := ' SELECT '+sValorFinal+' AS VALORREFERENCIA, '+
                              sValorFinal+' AS VALORPREV, '+
                          ''''+sDataRef+''' AS DATAREF, '+
                          ''''+sDataDemissao+''' AS DATADEMISSAO, '+
                          sValorBase1+ ' AS VALORBASE1, '+
                          sValorBase2+ ' AS VALORBASE2, '+
                          sValorBase3+ ' AS VALORBASE3, '+
                          IntToStr(piIdPessJur)+' AS IDPESSJUR, '+
                          IntToStr(piIdPlanoPrev)+' AS IDPLANOPREV, '+
                          IntToStr(piIdPessoa)+' AS IDPESSOA, '+
                          IntToStr(piSeqProposta)+' AS SEQPROPOSTA, '+
                          IntToStr(piIdContribuicao)+' AS IDCONTRIBUICAO, '+
                          sValorSalPart+' AS VALORPROVENTO, '+
                          sValorRemTotal+' AS VALORREMTOTAL, '+
                          sValorRubParcial+' AS RUBPARCIAL, '+
                          sValorRubMantido+' AS RUBMANTIDO, '+
                          ''''+sInscricaoData+''' AS INSCRICAODATA, '+
                          ''''+sDataNasc+''' AS DATANASC, '+
                          sValorAssociado+' AS VALORASSOCIADO, '+sValorAssociado2+' AS VALORASSOCIADO2, '+
                          sValorAssociado3+' AS VALORASSOCIADO3, '+
                          sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                          sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                          sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3 '+
                   ' FROM DUAL ';

   end
   else begin
      sMesReferenAnt := SAnoMesAnterior(sMesReferencia);
      if sSitFundacao = 'AS' // Montar qry de regra para ASSISTIDOS
      then begin
        sSQLRegra := ' SELECT  CP.IDHISTPROPOSTA,CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBUICAO, CP.PLACONTAD, '+
                     '         CP.TIPCODIGO, CP.CODCENTRORESPON, CP.PLANO, CP.IDEMPRESAPROP, CP.PLACONTAC,     '+
                     '         CP.DIAVENCIMENTO, CP.CODSUBCONTA, CP.CODCENTROCUSTOD, CP.CODCENTROCUSTOC,       '+
                     '         CP.UNIDNEGOC, CP.IDEMPRESA, CP.CODPORTFORMA,CP.FLGDESCFOLHA, CP.VALORBASE1,     '+
                     '         CP.VALORBASE2, CP.VALORBASE3, CP.FLGCOBRA, CP.TEMPOCONTRIB, CP.VLRCONTDIGITADO, '+
                     '         CP.VLRCONTCALCULADO, CP.QTDEPARCELAS, CP.FLGRECALCULA, CP.FLGRETROATIVO,        '+
                     '         C.IDREGRACALCULO, C.FLGACEITAOPCAO,C.NUMOPCOES ,                                '+
                     '         CP.DATAINICIO,CP.DATAFINAL,ST.FLGINTERNO,                                       '+
                     '         CONT.NOME AS CONTRIBUICAO, -1 AS NUMRECEBIMENTO ,PL.FLGMESCOBRANCA,PL.DIACOBRANCA, '+
                     '         EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC, P.NUMDOCUMENTO, PF.DATAMORTE,PP.SALPARTICIPACAO, '+
                     '         PP.INSCRICAODATA,  '+
                     '         C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO, '''+sDataRef+''' AS DATAREF, '+
                     '         HST.VALORPREV AS VLBENEFPGTO, HST.VALORPREV AS VALORATUAL, '+
                     '         CP.VLCONTREAL,    CP.VLBENEFREAL,    CP.IDADEINGRESSO,     CP.DTPRIMPAGAMENTO,  '+
                     '         CP.IDADEINGCOMERCIAL, CP.TMPPAGTORENDA, CP.MESREAJCONTRIB, CP.INDICEREAJCONTRIB, CP.FLGFORMACALC, '+
                     '         CP.IDADEINGREAL, CP.SEQPROPOSTA, ST.IDSITPART, EL.IDSITFUNC, EL.TEMPOSERVANTERIOR, EL.DATAADMISSAO, '+
                     sValorAssociado+' AS VALORASSOCIADO, '+sValorAssociado2+' AS VALORASSOCIADO2, '+
                     sValorAssociado3+' AS VALORASSOCIADO3, '+
                     sValorSalPart+' AS VALORPROVENTO, '+
                     sValorRemTotal+' AS VALORREMTOTAL, '+
                     sValorRubParcial+' AS RUBPARCIAL, '+
                     sValorRubMantido+' AS RUBMANTIDO, '+
                     sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                     sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                     sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3 '+
                     ' FROM    CONTRIBPREVPARTP CP,         '+
                     '         CONTPREV            C,          '+
                     '         CONTRIBUICAO        CONT,       '+
                     '         PARTPREVPLAN        PP,         '+
                     '         SITPART             ST,         '+
                     '         ELEGPATRO           EL,         '+
                     '         PESSOA              P,          '+
                     '         PESSOAFISICA        PF,         '+
                     '         PLANPREV            PL,         '+
                     '         HSTBENEFBFCIARIO    HST         '+
                     ' WHERE   CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND     '+
                     '         CP.IDPESSJUR = '+IntToStr(piIdPessJur)+' AND '+
                     '         CP.IDPLANOPREV =  '+IntToStr(piIdPlanoPrev)+' AND '+
                     '         CP.IDPESSOA = '+IntToStr(piIdPessoa)+' AND '+
                     '         CP.SEQPROPOSTA = '+IntToStr(piSeqProposta)+' AND '+
                     '         CP.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND   '+
                     '         ST.FLGINTERNO = '''+sSitFundacao+''' AND           '+
                     '         CP.IDPLANOPREV = C.IDPLANOPREV AND           '+
                     '         PL.IDPLANOPREV = CP.IDPLANOPREV  AND         '+
                     '         CONT.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND   '+
                     '         PP.IDPESSOA = CP.IDPESSOA AND                '+
                     '         PP.IDPESSJUR = CP.IDPESSJUR AND              '+
                     '         PP.IDPLANOPREV = CP.IDPLANOPREV AND          '+
                     '         EL.IDPESSOA = PP.IDPESSOA AND                '+
                     '         EL.IDPESSJUR = PP.IDPESSJUR AND              '+
                     '         P.IDPESSOA = EL.IDPESSOA AND                 '+
                     '         PF.IDPESSOA = P.IDPESSOA AND                 '+
                     '         PP.IDSITPART = ST.IDSITPART AND              '+
                     '         HST.IDPESSOA = PP.IDPESSOA AND               '+
                     '         HST.IDPESSJUR = PP.IDPESSJUR AND             '+
                     '         HST.IDTITULAR = PP.IDPESSOA  AND             '+
                     '         HST.MESREFERENCIA = '''+sMesReferencia+'''';
      end
      else begin
         if sSitFundacao = 'MA' // Montar qry de regra para MANTIDOS
         then begin
            sSQLRegra := ' SELECT  CP.IDHISTPROPOSTA,CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBUICAO, CP.PLACONTAD, '+
                         '         CP.TIPCODIGO, CP.CODCENTRORESPON, CP.PLANO, CP.IDEMPRESAPROP, CP.PLACONTAC,                   '+
                         '         CP.DIAVENCIMENTO, CP.CODSUBCONTA, CP.CODCENTROCUSTOD, CP.CODCENTROCUSTOC,                     '+
                         '         CP.UNIDNEGOC, CP.IDEMPRESA, CP.CODPORTFORMA,CP.FLGDESCFOLHA, CP.VALORBASE1,                   '+
                         '         CP.VALORBASE2, CP.VALORBASE3, CP.FLGCOBRA, CP.TEMPOCONTRIB, CP.VLRCONTDIGITADO,               '+
                         '         CP.VLRCONTCALCULADO, CP.QTDEPARCELAS, CP.FLGRECALCULA, CP.FLGRETROATIVO,                      '+
                         '         CP.DATAINICIO,CP.DATAFINAL,ST.FLGINTERNO,                                                     '+
                         '         C.IDREGRACALCULO, C.FLGACEITAOPCAO,C.NUMOPCOES ,                                              '+
                         '         CONT.NOME AS CONTRIBUICAO, -1 AS NUMRECEBIMENTO ,PL.FLGMESCOBRANCA,PL.DIACOBRANCA,            '+
                         '         EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC, P.NUMDOCUMENTO, PF.DATAMORTE,PP.SALPARTICIPACAO, '+
                         '         PP.INSCRICAODATA, PP.SALMANTIDO, EL.IDSITFUNC, EL.TEMPOSERVANTERIOR, EL.DATAADMISSAO, '+
                         '         C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO,'''+sDataRef+''' AS DATAREF, '+
                         '         CP.VLCONTREAL,    CP.VLBENEFREAL,    CP.IDADEINGRESSO,     CP.DTPRIMPAGAMENTO,                   '+
                         '         CP.IDADEINGCOMERCIAL, CP.TMPPAGTORENDA, CP.MESREAJCONTRIB, CP.INDICEREAJCONTRIB, CP.FLGFORMACALC,'+
                         '         CP.IDADEINGREAL, CP.SEQPROPOSTA, ST.IDSITPART,'+
                     sValorAssociado+' AS VALORASSOCIADO, '+sValorAssociado2+' AS VALORASSOCIADO2, '+
                     sValorAssociado3+' AS VALORASSOCIADO3, '+
                     sValorSalPart+' AS VALORPROVENTO, '+
                     sValorRemTotal+' AS VALORREMTOTAL, '+
                     sValorRubParcial+' AS RUBPARCIAL, '+
                     sValorRubMantido+' AS RUBMANTIDO, '+
                     sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                     sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                     sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3 '+
                         ' FROM    CONTRIBPREVPARTP CP,         '+
                         '         CONTPREV            C,          '+
                         '         CONTRIBUICAO        CONT,       '+
                         '         PARTPREVPLAN        PP,         '+
                         '         SITPART             ST,         '+
                         '         ELEGPATRO           EL,         '+
                         '         PESSOA              P,          '+
                         '         PESSOAFISICA        PF,         '+
                         '         PLANPREV            PL,         '+
                         '         PATRO               PAT         '+
                         ' WHERE   CP.IDPESSJUR      = '+IntToStr(piIdPessJur)    +' AND '+
                         '         CP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)  +' AND '+
                         '         CP.IDPESSOA       = '+IntToStr(piIdPessoa)     +' AND '+
                         '         CP.SEQPROPOSTA    = '+IntToStr(piSeqProposta)  +' AND '+
                         '         CP.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+ ' AND  '+
                         '         ST.FLGINTERNO = '''+sSitFundacao+''' AND '+
                         '         CP.IDPLANOPREV = C.IDPLANOPREV AND           '+
                         '         CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND     '+
                         '         CP.IDPLANOPREV = PL.IDPLANOPREV  AND         '+
                         '         C.IDCONTRIBUICAO = CONT.IDCONTRIBUICAO AND   '+
                         '         CP.IDPESSOA = PP.IDPESSOA AND                '+
                         '         CP.IDPESSJUR = PP.IDPESSJUR AND              '+
                         '         CP.IDPLANOPREV = PP.IDPLANOPREV AND          '+
                         '         PP.IDPESSOA = EL.IDPESSOA AND                '+
                         '         PP.IDPESSJUR = EL.IDPESSJUR AND              '+
                         '         EL.IDPESSOA = P.IDPESSOA AND                 '+
                         '         PF.IDPESSOA = P.IDPESSOA AND                 '+
                         '         PP.IDSITPART = ST.IDSITPART AND              '+
                         '         PAT.IDPESSOA = PP.IDPESSJUR                  ';
         end
         else begin
            if sSitFundacao = 'PT' // Montar qry da regra para PATROCINADORA
            then begin
               sSQLRegra := ' SELECT   CP.IDPESSOA, CP.IDPESSOA AS IDPESSJUR, CP.IDPLANOPREV, '+
                            '          CP.IDCONTRIBUICAO, CP.UNIDNEGOC, CP.TIPCODIGO,         '+
                            '          CP.CODCENTRORESPON, CP.IDEMPRESA, CP.IDEMPRESAPROP,    '+
                            '          CP.PLANO, CP.CODSUBCONTA,                              '+
                            '          CP.PLACONTAC, CP.CODPORTFORMA, CP.PLACONTAD,           '+
                            '          CP.CODCENTROCUSTOC, CP.CODCENTROCUSTOD,                '+
                            '          CP.DIAVENCIMENTO, CP.VALORBASE1, CP.VALORBASE2, CP.VALORBASE3, '+
                            '          DATAINICIO, DATAFINAL, NULL AS FLGINTERNO,             '+
                            '          C.IDREGRACALCULO, C.FLGACEITAOPCAO,C.NUMOPCOES ,       '+
                            '          CONT.NOME AS CONTRIBUICAO, -1 AS NUMRECEBIMENTO,       '+
                            '          C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO, ''PT'' AS FLGINTERNO, '+
                            '          0 AS FLGDESCFOLHA, 0 AS IDHISTPROPOSTA, 1 AS SEQPROPOSTA, '+
                            '          CP.QTDEPARCELAS,    '+
                           sValorAssociado+' AS VALORASSOCIADO, '+sValorAssociado2+' AS VALORASSOCIADO2, '+
                           sValorAssociado3+' AS VALORASSOCIADO3, '+
                           sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                           sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                           sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3 '+
                            ' FROM     CONTRIBPREVPATRO    CP,                 '+
                            '          CONTPREV            C,                  '+
                            '          CONTRIBUICAO        CONT,               '+
                            '          PLANPREV            PL                  '+
                            ' WHERE    CP.IDPESSOA       =  '+IntToStr(piIdPessJur)     +' AND '+
                            '          CP.IDPLANOPREV    =  '+IntToStr(piIdPlanoPrev)   +' AND '+
                            '          CP.IDCONTRIBUICAO =  '+IntToStr(piIdContribuicao)+' AND '+
                            '          C.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO AND  '+
                            '          C.IDPLANOPREV     = CP.IDPLANOPREV AND     '+
                            '          PL.IDPLANOPREV    = C.IDPLANOPREV  AND     '+
                            '          CONT.IDCONTRIBUICAO = C.IDCONTRIBUICAO     ';

            end
            else begin // Montar qry da regra para ATIVOS e OUTROS
               sSQLRegra := ' SELECT  CP.IDHISTPROPOSTA,CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBUICAO, CP.PLACONTAD, '+
                            '         CP.TIPCODIGO, CP.CODCENTRORESPON, CP.PLANO, CP.IDEMPRESAPROP, CP.PLACONTAC,     '+
                            '         CP.DIAVENCIMENTO, CP.CODSUBCONTA, CP.CODCENTROCUSTOD, CP.CODCENTROCUSTOC,       '+
                            '         CP.UNIDNEGOC, CP.IDEMPRESA, CP.CODPORTFORMA,CP.FLGDESCFOLHA, CP.VALORBASE1,     '+
                            '         CP.VALORBASE2, CP.VALORBASE3, CP.FLGCOBRA, CP.TEMPOCONTRIB, CP.VLRCONTDIGITADO, '+
                            '         CP.VLRCONTCALCULADO, CP.QTDEPARCELAS, CP.FLGRECALCULA, CP.FLGRETROATIVO,        '+
                            '         CP.DATAINICIO,CP.DATAFINAL,ST.FLGINTERNO, EL.IDSITFUNC, EL.TEMPOSERVANTERIOR, EL.DATAADMISSAO, '+
                            '         C.IDREGRACALCULO, C.FLGACEITAOPCAO,C.NUMOPCOES ,                                '+
                            '         CONT.NOME AS CONTRIBUICAO, -1 AS NUMRECEBIMENTO ,PL.FLGMESCOBRANCA,PL.DIACOBRANCA, '+
                            '         EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC, P.NUMDOCUMENTO, PF.DATAMORTE, PP.SALPARTICIPACAO, ';
               if piIdPlanoPrev <> -1  //== Planos Fechados e Individuais
               then begin
                  sSQLRegra := sSQLRegra +
                          '         PP.INSCRICAODATA,   ST.IDSITPART,   '+
                          '         C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO,'''+sDataRef+''' AS DATAREF, '+
                          '         CP.VLCONTREAL,    CP.VLBENEFREAL,    CP.IDADEINGRESSO,     CP.DTPRIMPAGAMENTO,  '+
                          '         CP.IDADEINGCOMERCIAL, CP.TMPPAGTORENDA, CP.MESREAJCONTRIB, CP.INDICEREAJCONTRIB, CP.FLGFORMACALC, '+
                          '         CP.IDADEINGREAL, CP.SEQPROPOSTA, '+
                         sValorAssociado+' AS VALORASSOCIADO, '+sValorAssociado2+' AS VALORASSOCIADO2, '+
                         sValorAssociado3+' AS VALORASSOCIADO3, '+
                         sValorSalPart+' AS VALORPROVENTO, '+
                         sValorRemTotal+' AS VALORREMTOTAL, '+
                         sValorRubParcial+' AS RUBPARCIAL, '+
                         sValorRubMantido+' AS RUBMANTIDO, '+
                         sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                         sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                         sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3 '+
                          ' FROM    CONTRIBPREVPARTP CP,         '+
                          '         CONTPREV            C,          '+
                          '         CONTRIBUICAO        CONT,       '+
                          '         PARTPREVPLAN        PP,         '+
                          '         SITPART             ST,         '+
                          '         ELEGPATRO           EL,         '+
                          '         PESSOA              P,          '+
                          '         PESSOAFISICA        PF,         '+
                          '         PLANPREV            PL,         '+
                          '         PATRO               PAT         '+
                          ' WHERE   CP.IDPESSJUR = '+IntToStr(piIdPessJur)+' AND     '+
                          '         CP.IDPLANOPREV =  '+IntToStr(piIdPlanoPrev)+' AND '+
                          '         CP.IDPESSOA    =  '+IntToStr(piIdPessoa)+' AND    '+
                          '         CP.SEQPROPOSTA =  '+IntToStr(piSeqProposta)+' AND '+
                          '         CP.IDCONTRIBUICAO =  '+IntToStr(piIdContribuicao)+' AND '+
                          '         ST.FLGINTERNO = '''+sSitFundacao+''' AND          '+
                          '         CP.IDPLANOPREV = C.IDPLANOPREV AND                '+
                          '         CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND          '+
                          '         CP.IDPLANOPREV = PL.IDPLANOPREV  AND              '+
                          '         C.IDCONTRIBUICAO = CONT.IDCONTRIBUICAO AND        '+
                          '         CP.IDPESSOA = PP.IDPESSOA AND                     '+
                          '         CP.IDPESSJUR = PP.IDPESSJUR AND                   '+
                          '         CP.IDPLANOPREV = PP.IDPLANOPREV AND               '+
                          '         PP.IDPESSOA = EL.IDPESSOA AND                     '+
                          '         PP.IDPESSJUR = EL.IDPESSJUR AND                   '+
                          '         EL.IDPESSOA = P.IDPESSOA AND                      '+
                          '         PF.IDPESSOA = P.IDPESSOA AND                      '+
                          '         PP.IDSITPART = ST.IDSITPART AND                   '+
                          '         PAT.IDPESSOA = PP.IDPESSJUR ';
               end
               else begin   //== Plano = -1 - Centralizador de Individuais
                  sSQLRegra := sSQLRegra +
                       '         PP.INSCRICAODATA,     '+
                       '         C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO,'''+sDataRef+''' AS DATAREF, '+
                       '         CP.VLCONTREAL,    CP.VLBENEFREAL,    CP.IDADEINGRESSO,     CP.DTPRIMPAGAMENTO,  '+
                       '         CP.IDADEINGCOMERCIAL, CP.TMPPAGTORENDA, CP.MESREAJCONTRIB, CP.INDICEREAJCONTRIB, CP.FLGFORMACALC, '+
                       '         CP.IDADEINGREAL, CP.SEQPROPOSTA, '+
                      sValorAssociado+' AS VALORASSOCIADO, '+sValorAssociado2+' AS VALORASSOCIADO2, '+
                      sValorAssociado3+' AS VALORASSOCIADO3, '+
                      sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                      sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                      sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3 '+
                       ' FROM    CONTRIBPREVPARTP CP,         '+
                       '         CONTPREV            C,          '+
                       '         CONTRIBUICAO        CONT,       '+
                       '         PARTPREVPLAN        PP,         '+
                       '         SITPART             ST,         '+
                       '         SITPLANOPREV        SIP,        '+
                       '         ELEGPATRO           EL,         '+
                       '         PESSOA              P,          '+
                       '         PESSOAFISICA        PF,         '+
                       '         PLANPREV            PL,         '+
                       '         PATRO               PAT         '+
                       ' WHERE   CP.IDPESSJUR   =  '+IntToStr(piIdPessJur)+' AND     '+
                       '         CP.IDPLANOPREV =  '+IntToStr(piIdPlanoPrev)+' AND '+
                       '         CP.IDPESSOA    =  '+IntToStr(piIdPessoa)+' AND    '+
                       '         CP.SEQPROPOSTA =  '+IntToStr(piSeqProposta)+' AND '+
                       '         CP.IDCONTRIBUICAO =  '+IntToStr(piIdContribuicao)+' AND '+
                       '         ST.FLGINTERNO  = '''+sSitFundacao+''' AND         '+
                       '         SIP.FLGINTERNO <> '''+'AC'+'''        AND         '+
                       '         CP.IDPLANOPREV = C.IDPLANOPREV AND                '+
                       '         CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND          '+
                       '         CP.IDPLANOPREV = PL.IDPLANOPREV  AND              '+
                       '         C.IDCONTRIBUICAO = CONT.IDCONTRIBUICAO AND        '+
                       '         CP.IDPESSOA = PP.IDPESSOA AND                     '+
                       '         CP.IDPESSJUR = PP.IDPESSJUR AND                   '+
                       '         CP.IDPLANOPREV = PP.IDPLANOPREV AND               '+
                       '         PP.IDPESSOA = EL.IDPESSOA AND                     '+
                       '         PP.IDPESSJUR = EL.IDPESSJUR AND                   '+
                       '         EL.IDPESSOA = P.IDPESSOA AND                      '+
                       '         PF.IDPESSOA = P.IDPESSOA AND                      '+
                       '         PP.IDSITPART = ST.IDSITPART AND                   '+
                       '         PP.IDSITPLANOPREV = SIP.IDSITPLANOPREV AND        '+
                       '         PAT.IDPESSOA = PP.IDPESSJUR ';
               end; // else - if piIdPlanoPrev <> -1
            end; // else - if sSitFundacao = PT
         end; // else - if sSitFundacao = MA
      end;// else - if sSitFundacao = AS
   end;// else -if sTipoCalculo = U ou P
   Result :=  sSQLRegra;
end;//MontaSQLCalcContrib

function UltimaDataContrib(psDataFinal,psMesReferencia : string; piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,piIdContribuicao : integer): boolean;
var sSQL,
    sMesDataFinal : string;
begin
   Result := False;
   if piIdPessJur = piIdPessoa // contribuicao da patrocinadora
   then begin
      sSQL := ' SELECT DATAFINAL  '+
                  ' FROM   CONTRIBPREVPATRO '+
                  ' WHERE  IDPESSOA = '+IntToStr(piIdPessJur)+'  AND '+
                  '        IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
                  '        IDPLANOPREV = '+IntToStr(piIdPlanoPrev);

   end
   else begin
      sSQL := ' SELECT DATAFINAL '+
              ' FROM   CONTRIBPREVPARTP '+
              ' WHERE  IDPESSOA = '+IntToStr(piIdPessoa)+' AND '+
              '        SEQPROPOSTA = '+IntToStr(piSeqProposta)+' AND '+
              '        IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
              '        IDPESSJUR = '+IntToStr(piIdPessJur)+'  AND '+
              '        IDPLANOPREV = '+IntToStr(piIdPlanoPrev);

   end;

   if psDataFinal = '' // Data Final nao preenchida
   then begin
      with dtmAPrev.qry do
      begin
          Close;
          SQL.Clear;
          SQL.Add(sSQL );
          try
             Open;
          except
             Close;
             exit;
          end;
          if FieldByName('DataFinal').AsString = ''
          then psDataFinal := ''
          else psDataFinal := FieldByName('DataFinal').AsString;
      end;//with
   end;//if DataFinal = ''

   // Se data final = '' entao é porque a contribuicao é por prazo indeterminado
   // Logo, result = false (nao é a ultima data
   // Senao, comparar com o mes da data final com o mes de referencia
   if psDataFinal <> ''
   then begin
      sMesDataFinal := Copy(psDataFinal,7,4)+'/'+Copy(psDataFinal,4,2);
      if sMesDataFinal <= psMesReferencia // Se o mes da data final <= ao de referencia
      then Result := True                 // -> entao, é a ultima data
      else Result := False;               // -> senao, NAO é a ultima data
   end
   else Result := False
end;//UltimaDataContrib

function  ValidaLote(qryAux : TwwQuery; psMesReferencia, pStrLotes : string; var sMsg : string) : boolean;
var sContribuicoes,
    sPatrocinadoras : string;
begin
   Result := False;
   sMsg := '';
   // Verificar se , para os lotes selecionados, as rubricas estão associadas
   // às devidas patrocinadoras
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT DISTINCT HST.IDPESSJUR,HST.IDPLANOPREV,HST.IDCONTRIBUICAO, '+
                  '        CP.IDRUBRICA, CP.IDRUBRICAATRASO, CP.IDRUBRICADEVOLUC, '+
                  '        C.NOME AS NOMECONTRIB, P.NOME AS NOMEPATRO '+
                  ' FROM  CONTRIBUICAO C, CONTPREV CP, HSTCONTRIBPREV HST, PESSOA P '+
                  ' WHERE HST.MESREFERENCIA =  '''+psMesReferencia+''' AND '+
                  '       HST.IDLOTE IN ('+pStrLotes+') AND  '+
                  '       CP.IDPLANOPREV    = HST.IDPLANOPREV AND '+
                  '       CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO AND '+
                  '       C.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO AND   '+
                  '       P.IDPESSOA   = HST.IDPESSJUR  AND '+
                  '       NOT EXISTS   '+
                  ' (SELECT DESCRPROVDESC FROM RUBRICAXPESS  R '+
                  '  WHERE R.IDPESSOA  = HST.IDPESSJUR AND      '+
                  '        R.IDRUBRICA = CP.IDRUBRICA) ');
   qryAux.Open;
   if not qryAux.IsEmpty
   then begin
      sContribuicoes  := '';
      sPatrocinadoras := '';
      qryAux.First;
      while not qryAux.Eof do
      begin
         sContribuicoes  := sContribuicoes+' * '+qryAux.FieldByName('NOMECONTRIB').AsString;
         sPatrocinadoras := sPatrocinadoras+' * '+qryAux.FieldByName('NOMEPATRO').AsString;
         qryAux.Next;
      end;
      sMsg := ' As contribuições '+sContribuicoes+ ' não possuem suas rubricas associadas '+
              ' às empresas '+sPatrocinadoras;
      qryAux.Close;
      Exit;
   end;

   // Verificar se para as contribuicoes dos lotes selecionados, as informacoes
   // contabeis estao preenchidas, pelo menos no nivel mais alto


   Result := True;
end; // ValidaLote

function  ValidaRubContrib(qryAux : TwwQuery; piIdContribuicao, piIdPlanoPrev, piIdPessJur : integer;
                           pcTipoRubrica : char) : boolean;
var sSQL : string;
begin
   Result := False;

   sSQL := '';
   if pcTipoRubrica = '' then pcTipoRubrica := 'T';

   case pcTipoRubrica of
        'T' : sSQL := ' SELECT CP.IDCONTRIBUICAO FROM CONTPREV CP '+
                      ' WHERE  CP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)   +' AND '+
                      '        CP.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
                      '        NOT EXISTS (SELECT RP.IDRUBRICA '+
                      '                    FROM   RUBRICAXPESS RP '+
                      '                    WHERE  RP.IDPESSOA = '+IntToStr(piIdPessJur)+' AND '+
                      '                           RP.IDRUBRICA = CP.IDRUBRICA ) AND'+
                      '        NOT EXISTS (SELECT RP.IDRUBRICA '+
                      '                    FROM   RUBRICAXPESS RP '+
                      '                    WHERE  RP.IDPESSOA = '+IntToStr(piIdPessJur)+' AND '+
                      '                           RP.IDRUBRICA = CP.IDRUBRICAATRASO ) AND '+
                      '        NOT EXISTS (SELECT RP.IDRUBRICA '+
                      '                    FROM   RUBRICAXPESS RP '+
                      '                    WHERE  RP.IDPESSOA = '+IntToStr(piIdPessJur)+' AND '+
                      '                           RP.IDRUBRICA = CP.IDRUBRICADEVOLUC )';
        'N' : sSQL := ' SELECT CP.IDCONTRIBUICAO FROM CONTPREV CP '+
                      ' WHERE  CP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)   +' AND '+
                      '        CP.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
                      '        NOT EXISTS (SELECT RP.IDRUBRICA '+
                      '                    FROM   RUBRICAXPESS RP '+
                      '                    WHERE  RP.IDPESSOA = '+IntToStr(piIdPessJur)+' AND '+
                      '                           RP.IDRUBRICA = CP.IDRUBRICA )';

        'A' : sSQL := ' SELECT CP.IDCONTRIBUICAO FROM CONTPREV CP '+
                      ' WHERE  CP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)   +' AND '+
                      '        CP.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
                      '        NOT EXISTS (SELECT RP.IDRUBRICA '+
                      '                    FROM   RUBRICAXPESS RP '+
                      '                    WHERE  RP.IDPESSOA = '+IntToStr(piIdPessJur)+' AND '+
                      '                           RP.IDRUBRICA = CP.IDRUBRICAATRASO )';

        'D' : sSQL := ' SELECT CP.IDCONTRIBUICAO FROM CONTPREV CP '+
                      ' WHERE  CP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)   +' AND '+
                      '        CP.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
                      '        NOT EXISTS (SELECT RP.IDRUBRICA '+
                      '                    FROM   RUBRICAXPESS RP '+
                      '                    WHERE  RP.IDPESSOA = '+IntToStr(piIdPessJur)+' AND '+
                      '                           RP.IDRUBRICA = CP.IDRUBRICADEVOLUC )';
   end;//case

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.Open;
   if qryAux.IsEmpty
   then Result := True   // rubrica existe associada
   else Result := False; // rubrica nao existe associada       
end; // ValidaRubContrib

function TestaPeriodicidade(pQtdeMeses, pUltMesPreparo, pMesReferencia: string): boolean;
var
  sData1, sData2: string;
  iDia, iMes, iAno: integer;
begin
  Result := False;

  if (pQtdeMeses = '') or
     (StrToInt(pQtdeMeses) = 0) then
      Result := True
  else
 {Pagamento único}
  if StrToInt(pQtdeMeses) = 1 then
     begin
         {testa se já foi efetuado o pagamento único}
          if (pUltMesPreparo = '') or
             (pUltMesPreparo = '0000/00') then
              Result := True;
     end
  else
    {se não for pagamento único}
     begin
         {Se ainda não foi efetivado nenhum pagamento}
          if (pUltMesPreparo = '') or
             (pUltMesPreparo = '0000/00') then
              Result := True
          else
            {testa se já foi efetivado o pagamento deste mês}
             begin
              {// sdata1 e sdata2 devem estar sem as barras, senao calcula errado
                  caso necessario usar funcao tirabarra}
                  sData1 := DataBrit(pUltMesPreparo + '/01');
                  sData2 := DataBrit(pMesReferencia + '/01');
                  if CalculaData(sData1,sData2,iDia,iMes,iAno) then
                     begin
                          iMes := iMes + 12 * iAno;
                          if (iMes mod StrToInt(pQtdeMeses)) = 0 then
                              Result := True;
                     end;
             end;
     end;
end;

end.
