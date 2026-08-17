//*****************************************************************************
//Data        : 29/09/2011
//SOL         : 165694
//Kintana     : 1438823
//Rotina      : qryBuscaFlgReproc
//Responsável : Ricardo Cristiano
//Problema    : otimização do tempo de execução da query
//Solução     : Retirado o comando e tratamento "IN" via subselect.
//*****************************************************************************
//Data        : 17/05/2011
//SOL         : 157990.4821
//Kintana     : 1273974
//Rotina      : qryBuscaBoletaTRCAtu / qryBuscaFlgReproc
//Responsável : Ricardo Cristiano
//Problema    : O fechamento da carteira de empréstimo não esta registrando as
//               atualizações dos ativos.
//Solução     : Criação da qryBuscaBoletaTRCAtu desconsiderando os registro de
//                 atualização na HISTCARTINV, para relançar o mesmo, já que a
//                 rotina exclui e lança o registro atualizado com a transferência.
//              Implementação de ordenação por carteira prórpria na query que
//               comando o reprocessamento dos ativos qryBuscaFlgReproc.
//*****************************************************************************
//Data        : 07/06/2010
//SOL         : 124730
//Kintana     : 668611
//Rotina      : QryBuscaVendasDia,  QryVerDireitosCancelar, qryProvisao,
//              qryRecebimento, cdsSelBoleta, qryBoletaCanc, qryCancelamento
//Responsável : Ricardo Cristiano
//Problema    : Alterar a data de contabilização rendas/variações positivas
//               provenientes de bonificações, dividen...
//Solução     : Implementação de querys para auxiliar a operação ...
//******************************************************************************
//Data        : 22/10/2009 
//SOL         : 125777
//Kintana     : 652392
//Rotina      : drendavariavel.qryBuscaFlgReproc
//Responsável : Ricardo Cristiano
//Problema    :  No dia 22/10/2009 houve uma operação de incorporação das ações de
// SADIA S/A PN à BRF FOODS ON. Ocorre que a transferência do custo de SADIA foi
// registrada em BRF FOODS como variação, ocosionando diferenças entre o saldo
// contábil da conta de custo e o relatório de custo. Verificamos ainda que a
// baixa da variação de Sadia não foi contabilizada via sistema.
//
//Solução     : Alterada a order de index com o idcarteirainvest
//******************************************************************************
//Data        : 28/09/2009
//SOL         : 124246
//Kintana     : 630481
//Rotina      : reprocessamento \ LancaBoletaDTI
//Responsável : Ricardo Cristiano
//Problema    : Realizada a operação de Alteração de Tipo e após realizar o
//                reprocessamento os valores da variação ficaram incorretos
//Solução     : Implementação na query qryBuscaBoletaDTI(dRendaVariavel), para o
//              seguir a ordem das operações(origem e destino).
//******************************************************************************
//Data        : 01/07/2009
//SOL         : 121358
//Kintana     : 584020
//Rotina      : reprocessamento
//Responsável : Ricardo Cristiano
//Problema    : Inconsistência de saldo de quantidade na tabela histcustodia
//Solução     : Implementação na query qryVerTRCPeriodo(dRendaVariavel), para o
//              plano não ser nulo.
//******************************************************************************
//Data       : 29/05/2009
//SOL        : 118375
//Kintana    : 561761
//Rotina     : reprocessamento
//Responsável: Ricardo Cristiano
//Problema   : Conforme análise realizada através dos SOL's 118032 e 117855,
//              solicitamos promover a correção da rotina de reprocessamento,
//              quando houver registros com a posição zerada, visto que, nestes
//              casos,a rotina parte dessa posição zerada, verifica o saldo e
//              descarta-o.
//Solução    : O reprocessamento está partindo de uma posição zerada e com isso
//             as rotinas que verificam saldo e descartam o mesmo.
//             A rotina fará o tratamento de identificar os ativos com saldo
//             igual a zero e irá criar um registro temporário, esse já é
//             tratado nas demais operações.
//Alteração  : qryVerTRCPeriodo -> Inclusão do tratamento quando o parâmetro
//              passado for nulo("TIPMOVBOLETA") 
//******************************************************************************
// Rotina     : qryBuscaFlgReproc
// SOL        : 96592
// Kintana    : 418922 
// Data       : 24/09/2008
// Responsável: Ricardo Cristiano
// Descrição  : Implementação de ajuste na query "", ordernando essa para tratar as
//               operações(CV, VV) primeiro e depois as transferências.  
//******************************************************************************
// Rotina     : qryMarcaFlagReprocMenor/qryBuscaHistDelecao/qryBuscaFlgReproc/
//              qryAtuSldInvRV/qryDesmarcaFlgReproc/qryBuscaATU
// SOL        : 92857
// Kintana    : 396741
// Data       : 07/08/2008
// Responsável: Ricardo Cristiano
// Descrição  : Otimização de query´s vinculadas as rotinas do reprocessamento :
//              qryMarcaFlagReprocMenor, qryBuscaHistDelecao, qryBuscaFlgReproc,
//              qryAtuSldInvRV, qryDesmarcaFlgReproc e qryBuscaATU
//******************************************************************************
// Data      : 18/06/2008
// Código    : AL_142
// Pendencia : 27958
// SOL       : 85827
// Motivo    : Implementação de filtro na "qryBuscaBoletaDTI" por "id" do investimento,
//              carteira e plano.
//******************************************************************************
// Data      : 05/03/2008
// Código    : AL_141
// Pendencia : 27531
// SOL       : 80495
// Desc      : Ajuste na qryVerTRCPeriodo:
//               Passa a buscar em data maior que o parametro passado. (Era >=)
//             Ex.: Ao reprocessar o dia 01/02/2008, o sistema marca o dia
//                  31/01/2008 e quando vai buscar as TRC no período, acaba
//                  encontrando a TRC de 31/01/2008, e marca o investimento em
//                  30/01/2008. Se a contabilidade estiver fechada em 31/01/2008
//                  não vai conseguir reprocessar, pois tentará excluir registros
//                  em 31/01/2008.
//******************************************************************************
// Data      : 22/08/2007
// Código    : AL_140
// Pendencia : 25877
// SOL       : 64596
// Desc      : Ajuste na rotina de Relançamento de DTI para relançar sempre todas
//               as operações da AGE
//******************************************************************************
// Data      : 19/07/2007
// Código    : AL_139
// Pendencia : 25813
// SOL       :
// Desc      : Inclusão da QryLogTotalPrev
//******************************************************************************
// Data      : 13/06/2007
// Código    : AL_138
// Pendencia : 25637
// SOL       :
// Desc      : Inclusão do campo DESCCARTINVEST na qryBuscaBoletaTRC, pois estava dando
//             erro de InvalidFieldname pois o raise referenciava este campo nas
//             msg de tratamento
//******************************************************************************
// Data      : 02/03/2007
// Código    : AL_137
// Pendencia : 24551
// SOL       :
// Desc      : Ajuste nos filtros da query qryBuscaBoletas.
//               Traz todas as boletas de TRP independentemente do plano passado
//******************************************************************************
// Data      : 28/02/2007
// Código    : AL_136
// Pendencia : 24563
// SOL       :
// Desc      : Acerto na qryBuscaHistDelecao que estava cartesianando com as opera
//             ções de Transf. Plano
//             Ajuste no reprocessamento e ordenação da reprocessamento
//******************************************************************************
// Data      : 12/02/2007
// Código    : AL_136
// Pendencia : 24464
// SOL       :
// Desc      : Acerto na qryBuscaBoletaDTG para trazer o IDOPERCUSTODIA
//******************************************************************************
// Data      : 04/01/2007
// Código    : AL_135
// Pendencia : 24122
// SOL       :
// Desc      : Acerto na qryBuscaBoletaDTS para trazer o IDOPERCUSTODIA
//******************************************************************************
// Data      : 28/12/2006
// Código    : AL_134
// Pendencia : 24058
// SOL       :
// Desc      : Acerto na query qryBuscaBoletaDTG: Falta um parentese
//             Acerto na query qryBuscaBoletaDTS: Faltam vários parenteses
//             Erro na query qryBuscaBoletaTCU: "Type Mismach for field FLGTIPOCONTAORIG"
//             Implementação na qryBuscaBoletaTRP: Passa a trazer Dados da BOLETA
//******************************************************************************
// Data      : 24/11/2006
// Código    : AL_133
// Pendencia :
// SOL       :
// Desc      : Retirado o Prepare do Create pois estava dado problema com a Valia
//******************************************************************************
// Data      : 09/11/2006
// Código    : AL_132
// Pendencia : 23722
// SOL       :
// Desc      : Segregação de Plano / Patrocinadora
//              - Ajuste no reprocessamento da Transferencia entre Planos (TRP)
//              - Ajuste no reprocessamento da Transferência de Custódia (TCU)
//******************************************************************************
// Data      : 05/10/2006
// Código    : AL_131
// Pendencia : 23346
// SOL       :
// Desc      : Transferencia de CC para CCI (qryBuscaBoletaTRI)
//******************************************************************************
// Data      : 18/10/2006
// Código    : AL_130
// Pendencia : 23564
// SOL       :
// Desc      : Ajuste de Segregação e da TRC CC e CCI
//******************************************************************************
// Data      : 05/10/2006
// Código    : AL_129
// Pendencia : 22965
// SOL       :
// Desc      : Segregação de Plano / Patrocinadora
//             Alterada a querie: qryAtuSldInvRV
//******************************************************************************
// Data      : 24/08/2006
// Código    : AL_128
// Pendencia : 22965
// SOL       :
// Desc      : Segregação de Plano / Patrocinadora
//             Alteradas as queries:
//                  qryMarcaFlagReprocMenor
//                  qryDesmarcaFlgReproc
//                  qryBuscaFlgReproc
//                  qryVerTRCPeriodo
//                  qryBuscaBoletas
//                  qryBuscaBoletaOPE
//                  qryBuscaBoletaTRC
//                  qryBuscaBoletaTRP
//                  qryBuscaBoletaTCU
//                  qryBuscaBoletaTCG
//                  qryBuscaBoletaDTO
//                  qryBuscaBoletaDTA
//                  qryBuscaBoletaAJQ
//                  qryBuscaBoletaDTG
//                  qryBuscaBoletaDTS
//                  qryBuscaBoletaDTI
//                  qryBuscaBoletaDTB
//                  qryBuscaBoletaDTD
//                  qryBuscaBoletaDRS
//                  qryBuscaBoletaDCI
//                  qryBuscaBoletaVSU
//                  qryBuscaBoletaDRE
//                  qryBuscaBoletaDSA
//                  qryBuscaBoletaCSA
//                  qryBuscaATU
//                  qryAtuSldInvRV
//******************************************************************************
// Data      : 14/08/2006
// Código    : AL_127
// Pendencia : 22957
// SOL       :
// Desc      : Implementação da qryNumBoleta
//             Criação da qryBuscaBoletaTRP
//             qryVerTRCPeriodo
//******************************************************************************
// Data      : 06/06/2006
// Código    : AL_126
// Pendencia : 22384
// SOL       : 43283
//           : Alteração da qryBuscaBoletaDTO para tb trazer o campo
//               VLRREMUNERACAO para contabilização diferenciada
//******************************************************************************
// Data     : 17/04/2006
// Código   : AL_125
// Pendencia: 22047
// SOL      : 42021
// Desc     : Busca dos campos VLRCUSTOATUAL e VLRVARIACAOATUAL para a
//            IncluiRegistros DTI
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_124
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia  e inclusao do campo
//            TipoOperacao.FLGCONTAINVEST nas qrys
//******************************************************************************
// Data      : 23/03/2006
// Código    : AL_123
// Pendencia :
// SOL       :
//           : Implementação na qryBuscaBoletas, para não buscar boletas OPE que
//                não foram fechadas (Boletas pendentes não serão mais relançadas)
//             Implementação na qyrBuscaATU de parametro IDCARTEIRAGERENC, para
//                filtrar os registros
//******************************************************************************
// Data      : 20/03/2006
// Código    : AL_122
// Pendencia :
// SOL       :
//           : Acerto na qryBuscaFlgContab para ordernar por data e boleta, para
//                não duplicar os lançamentos de compensação REC/PAG
//******************************************************************************
// Data      : 17/03/2006
// Código    : AL_121
// Pendencia :
// SOL       :
//           : Criação da qryDesmarcaFlgReproc para commit diário do reprocessamento
//******************************************************************************
// Data      : 16/03/2006
// Código    : AL_120
// Pendencia :
// SOL       :
//           : Acerto na qryOperacao para trazer o CodDocumento da Operacaoinvest
//             com o campo CODDOCUMOPER
//******************************************************************************
// Data      : 15/03/2006
// Código    : AL_119
// Pendencia :
// SOL       :
//           : Ajuste na qryMarcaFlagReprocMenor para melhorar a performance
//******************************************************************************
// Data      : 07/03/2006
// Código    : AL_118
// Pendencia :
// SOL       :
//           : Ajuste na qryBuscaBoletaDTO para operação de Multa
//******************************************************************************
// Data      : 06/03/2006
// Código    : AL_117
// Pendencia :
// SOL       :
//           : Novo reprocessamento linear - Orientado pelas Datas e não por investimentos
//           : Ajuste na qryMarcaFlgReprocMenor e na qryBuscaFlgReproc para grupar tb por data,
//                não busca mais um id maior em data menor
//           : Nova qryVerTRCPeriodo para buscar as TRC pela OperCustodia e Boleta
//           : Implementação na qryBuscaBoletasTRC dos campos IDTIPOOPERORIG e IDTIPOOPERDEST
//                para o novo reprocessamento linear
//******************************************************************************
// Data      : 06/02/2006
// Código    : AL_116
// Pendencia :
// SOL       :
//           : Implementação de melhoria de performance. Preparação das queries
//                mais utilizadas pelo reprocessamento no Create do DataModule
//******************************************************************************
// Data      : 01/02/2006
// Código    : AL_115
// Pendencia :
// SOL       :
//           : Ajuste na qryBuscaBoletaDTO para buscar o valor do ajuste no recebimento
//******************************************************************************
// Data      : 25/01/2006
// Código    : AL_114
// Pendencia :
// SOL       :
//           : Ajuste na qryBuscaFlgReproc e a qryMarcaFlgReprocTRC para prever
//               o registro temporário de reprocessamento - REP
//             Criacao da qryVerTRCPeriodo para reprocessamento de TRC
//******************************************************************************
// Data      : 12/01/2006
// Código    : AL_113
// Pendencia :
// SOL       :
//           : Implementação do parametro UNIDIRECIONAL na query qryAtuSldInvRV
//                para melhora de performance e menor utilização de memória
//******************************************************************************
// Data      : 20/12/2005
// Código    : AL_112
// Pendencia : 20781
// SOL       : 38597
//           : Implementação de Cancelamento de Subscrição com Ações / criação
//             da qryBuscaBoletaCSA
//******************************************************************************
//Data	     : 27/10/2005
//Query     : qryBuscaBoletaDSA
//Descrição : Criada a busca da operação de Subscrição Com Ações
//******************************************************************************
//Data	     : 18/10/2005
//Query     : qryBuscaBoletaDCI
//Descrição : Incluido campos VLRCUSTOATUAL e VLRVARIACAOATUAL
//******************************************************************************
//Data	     : 10/10/2005
//Query     : qryBuscaBoletaDTB
//Descrição : Incluido campo para contabilização da operação (TP.RECPAG)
//******************************************************************************
//Data	     : 11/10/2005
//Query     : qryUpdBoleta
//Descrição : Implementação do tratamento para parametro nulo, principalmente no caso do financeiro
//******************************************************************************
//Data	     : 10/10/2005
//Query     : qryBuscaBoletaDRE
//Descrição : Criada a busca da operação de Reorganização Societária
//******************************************************************************
//Data	     :  05/10/2005
//Função    :  Inclusão do TipoOperacao -124 e -125 na qryBuscaBoletaAJQ
//******************************************************************************
//Data	     : 05/10/2005
//Query     : QryBuscaBoletaDTB
//Descrição : Implementação da identificação das operações já lançadas nna query qryBuscaBoletaDTB
//******************************************************************************
//Data	     : 23/08/2005
//Query     : QryBuscaBoletaDTI
//Descrição : Implementação dos campos PERCENTUAL e IDOPERACAODIREITO
//******************************************************************************
//Data	    : 10/08/2005
//Query     : qryBuscaBoletaSVU
//Descrição : Acerto no filtro de Tipo de Operação para CCI
//******************************************************************************
//Data	    : 29/07/2005
//Query     : qryBuscaHistDelecao
//Descrição : Acerto na seleção de datas (SQL)
//******************************************************************************
//Data	    : 27/07/2005
//Query     : QryBuscaBoletaVSU
//Descrição : Acerto no sql, retirada o join da operacaoinvest com a opercustodia, essa estava
//            ocasionado duplicidade e tranzia informações desnecessárias.
//******************************************************************************
//Data	    : 26/07/2005
//Query     : QryBuscaBoletaVSU
//Descrição : Acerto no sql, estava triplicando as informações e ocasionado a gravação de custodia para carteira gerencial
//******************************************************************************
//Data	    : 15/07/2005
//Query     : QryBuscaBoletaVSU
//Descrição : Implementado a busca da descrição do tipo de operação.
//******************************************************************************
//Data	    : 14/07/2005
//Query     : QryBuscaBoletaVSU
//Descrição : Criado o campo DATAVENCOPER
//******************************************************************************
//Data	    : 14/07/2005
//Query     : qryBuscaBoletaDTS
//Descrição : Criado o campo IDMOTIVOBLOQDEST e IDMOTIVOBLOQORIG E DATAVENCOPER
//******************************************************************************
//Data	    : 13/07/2005
//Query     : qryBuscaBoletaDTS, qryBuscaBoletaDTG e qryBuscaBoletaDTB
//Descrição : Alterado a busca do campo ORIGDEST na OPERDIREITOXINV  para OPERACAOINVEST
//******************************************************************************
//Data	    : 21/06/2005
//Query     : qryBuscaBoletaTRC
//Motivo(S) : Implentação para tratar o IDTIPOOPERCAO preenchido para TRC referente a  CCI
//******************************************************************************
//Data	    : 09/06/2005
//Query     : qryBuscaBoletaDTS
//Descrição : Criado o campo IDOPERACAODIREITO e adicionado os TFields
//Query     : qryBuscaBoletaDTS
//Descrição : Alterada para buscar SUBSCRIÇÃO
//******************************************************************************
//Data	    : 12/05/2005
//Query     : qryBuscaBoletaDTO, qryBuscaBoletaDTA
//Descrição : Criado o campo IDOPERACAOORIGEM e adicionado os TFields
//Query     : qryBuscaAnuncio
//Descrição : Alterada para buscar Anúncio por operação individual para recebimento novo
//******************************************************************************
//Data	    : 11/05/2005
//Query     : qryBuscaBoletaDTO, qryBuscaBoletaDTA
//Descrição : Ajuste no calculo do Valor da Operação (Somando a Remuneração)
//            Ordena pelas carteiras
//******************************************************************************
//Data	    : 29/04/2005
//Query     : qryBuscaBoletaDRS
//Descrição : Incluido o campo IDOPERACAODIREITO
//******************************************************************************
//Data	    : 19/04/2005
//Query     : qryMarcaFlagReprocMenor, qryMarcaFlagReprocMaior e qryBuscaHistDelecao
//Descrição : Passa a marcar tb o registro de INI que for igual a 0 (zero)
//            Para reprocessar um papel comprado pela primeira vez que (Reg INI = 0
//              incluido somente para isso
//******************************************************************************
//Data	    : 18/03/2005
//Query     : QryBuscaAnuncio
//Descrição : Criada para buscar o anuncio da AGE a partir da operãção.
//******************************************************************************
//Data	    : 17/03/2005
//Query     : qryBuscaBoletaTCU
//Descrição : Incluido nova query para tratamento das boletas de transferencia de custodiante
//            Alterado o layout para melhorar a visualização (DFM - Organisação das queries)
//******************************************************************************
//Data	    : 10/03/2005
//Query     : qryBuscaHistDelecao
//Descrição : Incluido a ordenação por DATAMOVCARTINV DESC, IDHISTCARTINV DESC
//******************************************************************************
//Data	    : 08/03/2005
//Query     : qryOperacao e qryBuscaHistDelecao
//Descrição : Incluido o campo TIPMOVBOLETA para identificar o Anuncio de Proventos no
//            momento da exclusao de um direito
//******************************************************************************
//Data	    : 25/02/2005
//Query     : QryBuscaBoletaVSU
//Descrição : Query para Pesquisar boletas 'VSU - Vencimento de Subscrição' para reprocessamento.
//******************************************************************************
//Data	    : 15/02/2005
//Query     : qryUpdBoleta
//Descrição : Alteração na qryBuscaBoletaDTI para pegar Origem e Destino pela
//            OperaçãoInvest
//******************************************************************************
//Data	    : 15/02/2005
//Query     : qryUpdBoleta
//Descrição : Especificação dos tipos de parametros
//******************************************************************************
//Data	    : 21/12/2004
//Query     : qryBuscaBoletaAJQ
//Descrição : Acerto para operações somente de custódia ou somente de carteira
//            Passa a trazer todas as operações de custódia, mesmo tendo histórico
//            retirada a seguinte cláusula:
//            AND (NOT EXISTS(SELECT DISTINCT IDOPERACAOINVEST
//                            FROM HISTCUSTODIA
//                            WHERE IDOPERACAOINVEST = OI.IDOPERACAOINVEST))
//******************************************************************************
//Data	    : 20/12/2004
//Query     : QryBuscaHistCPMF e QryUpdHistCPMF
//Descrição : Busca e altera a quantidade de CPMF, conforme o grupamento
//******************************************************************************
//Data	    : 06/12/2004
//Query     : qryMarcaFlagReprocMenor, qryMarcaFlagReprocIgual
//Descrição : Alteração do nome da qryMarcaFlagReproc para qryMarcaFlagReprocMenor
//            Implementação da qryMarcaFlagReprocIgual
//******************************************************************************
//Data	    : 01/12/2004
//Query     : qryBuscaBoletas
//Descrição : Implementação do CODDOCUMENTO
//******************************************************************************
//Data	    : 01/12/2004
//Query     : qryBuscaBoletaDTA
//Descrição : Implementação para Anuncio de Proventos no reprocessamento
//******************************************************************************
//Data	    : 23/11/2004
//Query     : QryBuscaOperPendentes
//Descrição : Alterada a query para buscar a qtde pendendente na tabela OPERACAOPENDENTE
//******************************************************************************
//Data	    : 27/10/2004
//Query     : qryMarcaFlgContab
//Descrição : Não exclui o registro marcado para o reprocessamento
//******************************************************************************
//Data	    : 25/10/2004
//Query     : qryMarcaFlgContab
//Descrição : ESSA CONTABILIZAVA AS CARTEIRAS GERENCIAIS
//******************************************************************************
//Data      : 15/07/2004
//Query     : qryMarcaFlagReproc
//Descrição : Não marca papeis sem saldo anterior
//******************************************************************************
//Data	    : 06/10/2004
//Origem    : FUNCEF
//Query     : qryBuscaBoletaDRS
//******************************************************************************
//Data	    : 09/09/2004
//Origem    : FUNCEF
//Query     : qryBuscaBoletaDTO, qryBuscaBoletaDTS, qryBuscaBoletaDTI
//Motivo(S) : Implementação de campos para contabilização
//******************************************************************************
//Data	    : 19/08/2004
//Origem    : FUNCEF
//Query     : qryBuscaBoletaDTD
//Motivo(S) : Implementação da operação de DESDOBRAMENTO
//******************************************************************************
//Data      : 15/07/2004
//Query     : qryBuscaBoletaDTG
//Descrição : Busca a operação original de custódia para lançar no bloqueio correto
//******************************************************************************
//Data	    : 01/07/2004
//Origem    : FUNCEF
//Query     : qryBuscaHistDelecao
//Motivo(S) : Retirado o parametro 'OPERADOR', Passa a buscar tb registros sem o IDPLANPREVCTBPATR
//******************************************************************************
//Data	    : 24/06/2004
//Query     : qryBuscaBoletaDTO
//Motivo(S) : Incluido o campo IDOPERACAODIREITO
//******************************************************************************
//Data	    : 31/05/2004
//Query     : qryVerMarcaReproc
//Motivo(S) : Criada nova query
//******************************************************************************
//Data	    : 31/05/2004
//Query     : qryMarcaFlgReprocAux
//Motivo(S) : Criada nova query
//******************************************************************************
//Data	    : 31/05/2004
//Query     : qryMarcaFlagReproc
//Motivo(S) : Ajuste na performance com filtro pelo indice
//******************************************************************************
//Data	    : 26/05/2004
//Origem    : FUNCEF
//Função    :
//LINHA(S)  :
//Motivo(S) : Ajustes nas queries de reprocessamento p/ carteiras gerenciais
//******************************************************************************
//Data	    : 04/05/2004
//Origem    : FUNCEF
//Função    : qryBuscaBoletaTCG
//LINHA(S)  :
//Motivo(S) : Implementação do reprocessamento da transf. p/ as Carteiras Gerenciais
//******************************************************************************
//Data	    : 29/04/2004
//Origem    : FUNCEF
//Função    : qryBuscaDatasReproc
//LINHA( S) :
//Motivo(S) : Retirado o filtro de IDCARTEIRAGERENC
//******************************************************************************
// Data	    : 14/04/2004
// Origem   : FUNCEF
// Função   : qryBuscaBoletaDTI
// LINHA(S) :
// Motivo(S): Essa query trata as operações de Incorporação, Permulta e
//                  Alteração do tipo .
//******************************************************************************
// Data	    : 08/03/2004
// Origem   : FUNCEF
// Função   : qryMarcaFlagReproc , qryMarcaFlgReprocTRC e qryBuscaHistDelecao
// LINHA(S) :
// Motivo(S): retirado o tratamento da Carteira Gerencial, essa passa a ser marcada.
//******************************************************************************

unit dRendaVariavel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
//Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
  Db, DBTables, Wwquery, Wwdatsrc, DBClient, uCMClientDataSet, Provider;

type
  TDMRendaVariavel = class(TDataModule)
    qryLocalAux: TwwQuery;
    qryBoleta: TwwQuery;
    qryBoletaCODDOCUMENTO: TFloatField;
    qryBoletaPLANO: TFloatField;
    qryBoletaPLNCODIGO: TFloatField;
    qryBoletaDATABOLETA: TDateTimeField;
    qryAuxiliar: TwwQuery;
    qryUpdFinContBoleta: TwwQuery;
    qryHistPlnCodigo: TwwQuery;
    qryHistPlnCodigoPLANO: TFloatField;
    qryHistPlnCodigoPLNCODIGO: TFloatField;
    qryMarcaFlagReprocMenor: TwwQuery;
    qryBuscaFlgReproc: TwwQuery;
    qryBuscaFlgReprocIDINVESTIMENTO: TFloatField;
    qryBuscaFlgReprocIDCARTEIRAINVEST: TFloatField;
    qryBuscaFlgReprocDATAMOVCARTINV: TDateTimeField;
    qryBuscaHistDelecao: TwwQuery;
    qryBuscaHistDelecaoIDHISTCARTINV: TFloatField;
    qryBuscaHistDelecaoPLNCODIGO: TFloatField;
    qryBuscaHistDelecaoPLANO: TFloatField;
    qryBuscaHistDelecaoDATAMOVCARTINV: TDateTimeField;
    qryOperacao: TwwQuery;
    qryAux: TwwQuery;    
    qryBuscaBoletas: TwwQuery;
    DateTimeField1: TDateTimeField;
    qryBuscaBoletasIDBOLETA: TStringField;
    qryBuscaBoletasSEQBOLETA: TFloatField;
    qryBuscaBoletasTIPMOVBOLETA: TStringField;
    qryBuscaBoletaOPE: TwwQuery;
    qryBuscaBoletaOPEIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaOPEIDCUSTODIANTE: TFloatField;
    qryBuscaBoletaOPEIDCORRETVALORES: TFloatField;
    qryBuscaBoletaOPEEMPRESAPROP: TFloatField;
    qryBuscaBoletaOPEIDMODULO: TFloatField;
    qryBuscaBoletaOPEIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaOPEIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaOPEIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaOPEDATAOPERACAO: TDateTimeField;
    qryBuscaBoletaOPENUMDOCUMENTO: TStringField;
    qryBuscaBoletaOPEQTDEOPERACAO: TFloatField;
    qryBuscaBoletaOPEPRECOUNITOPERACAO: TFloatField;
    qryBuscaBoletaOPEDATAVENCOPER: TDateTimeField;
    qryBuscaBoletaOPEIDFORCLI: TFloatField;
    qryBuscaBoletaOPEFLGSTATUSFECHBOL: TStringField;
    qryBuscaBoletaOPEFLGSTATUSORDMOV: TStringField;
    qryBuscaBoletaOPEIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaOPETIPOMOVTO: TStringField;
    qryBuscaBoletaOPENATUREZAOPERACAO: TStringField;
    qryBuscaBoletaOPEIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaOPEVLROPERACAO: TFloatField;
    qryBuscaBoletaOPEVLRIR: TFloatField;
    qryBuscaBoletaOPEDESCINVESTIMENTO: TStringField;
    qryBuscaBoletaOPETIPOCUSTODIA: TStringField;
    QryDespesasOperacao: TwwQuery;
    qryBuscaFlgContab: TwwQuery;
    qryBuscaFlgContabIDINVESTIMENTO: TFloatField;
    qryBuscaFlgContabIDCARTEIRAINVEST: TFloatField;
    qryBuscaFlgContabDATAMOVCARTINV: TDateTimeField;
    qryBuscaFlgContabIDPLANPREVCTBPATR: TFloatField;
    qryBuscaFlgContabIDHISTCARTINV: TFloatField;
    qryBuscaFlgContabVLRTOTLIQUIDAR: TFloatField;
    qryBuscaFlgContabIDTIPOOPERACAO: TFloatField;
    qryBuscaFlgContabIDOPERACAOINVEST: TFloatField;
    qryBuscaFlgContabIDCORRETVALORES: TFloatField;
    qryBuscaFlgContabIDLOTE: TStringField;
    qryBuscaFlgContabDATAVENCOPER: TDateTimeField;
    qryBuscaFlgContabMOECODIGO: TFloatField;
    qryBuscaFlgContabIDBOLETA: TStringField;
    qryBuscaFlgContabCODTIPOACAO: TStringField;
    qryBuscaFlgReprocIDPLANPREVCTBPATR: TFloatField;
    qryAtuSldInvRV: TwwQuery;
    qryAtuSldInvRVIDCARTEIRAINVEST: TFloatField;
    qryAtuSldInvRVIDCARTEIRAGERENC: TFloatField;
    qryAtuSldInvRVIDINVESTIMENTO: TFloatField;
    qryAtuSldInvRVIDLOTE: TStringField;
    qryAtuSldInvRVDESCINVESTIMENTO: TStringField;
    qryAtuSldInvRVIDTIPOINVEST: TFloatField;
    qryAtuSldInvRVFLGCALCDIARIO: TStringField;
    qryAtuSldInvRVFLGIRRVA: TStringField;
    qryAtuSldInvRVIDEMISSOR: TFloatField;
    qryBuscaBoletaOPEDESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaOPEIDLOTE: TStringField;
    qryBuscaHistDelecaoIDOPERACAOINVEST: TFloatField;
    QryDespesasOperacaoIDDESPOPERINVEST: TFloatField;
    QryDespesasOperacaoIDFORCLI: TFloatField;
    QryDespesasOperacaoIDOPERACAOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOOPERACAO: TFloatField;
    QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField;
    QryDespesasOperacaoIDTIPODESPINVEST: TFloatField;
    QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField;
    QryDespesasOperacaoIDREGRACALCUSADA: TFloatField;
    QryDespesasOperacaoVLRDESPOPER: TFloatField;
    QryDespesasOperacaoDATAOPERACAO: TDateTimeField;
    QryDespesasOperacaoNUMDOCUMENTO: TStringField;
    QryDespesasOperacaoIDINVESTIMENTO: TFloatField;
    QryDespesasOperacaoIDCORRETVALORES: TFloatField;
    QryDespesasOperacaoIDCARTEIRAINVEST: TFloatField;
    QryDespesasOperacaoIDCARTEIRAGERENC: TFloatField;
    QryDespesasOperacaoVLROPERACAO: TFloatField;
    QryDespesasOperacaoQTDEOPERACAO: TFloatField;
    QryDespesasOperacaoMOECODIGO: TFloatField;
    QryDespesasOperacaoIDLOTE: TStringField;
    QryDespesasOperacaoFLGCALCDIARIO: TStringField;
    QryDespesasOperacaoIDPLANPREVCTBPATR: TFloatField;
    QryDespesasOperacaoDESCTIPOOPERACAO: TStringField;
    QryDespesasOperacaoNATUREZAOPERACAO: TStringField;
    QryDespesasOperacaoNOME: TStringField;
    QryDespesasOperacaoDESCTIPODESPINV: TStringField;
    QryDespesasOperacaoDESCINVESTIMENTO: TStringField;
    QryDespesasOperacaoNATOPERDESP: TStringField;
    qryBuscaFlgContabVLRMOVCARTINV: TFloatField;
    qryBuscaFlgContabIDFORCLI: TFloatField;
    qryBuscaFlgContabNUMDOCUMENTO: TStringField;
    qryBuscaFlgContabCODDOCUMENTO: TFloatField;
    qryBuscaBoletaTRC: TwwQuery;
    qryBuscaBoletaTRCIDOPERCUSTODIA: TFloatField;
    qryBuscaBoletaTRCIDMOTIVOBLOQDEST: TFloatField;
    qryBuscaBoletaTRCIDMOTIVOBLOQORIG: TFloatField;
    qryBuscaBoletaTRCIDCUSTODIANTEDEST: TFloatField;
    qryBuscaBoletaTRCIDCUSTODIANTEORIG: TFloatField;
    qryBuscaBoletaTRCIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaTRCIDCARTEIRADEST: TFloatField;
    qryBuscaBoletaTRCIDCARTEIRAORIG: TFloatField;
    qryBuscaBoletaTRCIDHISTCARTINVDEST: TFloatField;
    qryBuscaBoletaTRCIDHISTCARTINVORIG: TFloatField;
    qryBuscaBoletaTRCIDCUSTODIAORIG: TFloatField;
    qryBuscaBoletaTRCIDCUSTODIADEST: TFloatField;
    qryBuscaBoletaTRCDATAMOVCUSTOD: TDateTimeField;
    qryBuscaBoletaTRCIDLOTE: TStringField;
    qryBuscaBoletaTRCQUANTIDADE: TFloatField;
    qryBuscaBoletaTRCIDBOLETA: TStringField;
    qryBuscaBoletaTRCDESCINVESTIMENTO: TStringField;
    qryBuscaBoletasPLNCODIGO: TFloatField;
    qryBuscaFlgContabPLANO: TFloatField;
    qryBuscaFlgContabPLNCODIGO: TFloatField;
    qryBuscaFlgReprocIDHISTCARTINV: TFloatField;
    qryBuscaFlgReprocTIPMOVCARTINV: TStringField;
    qryBuscaHistDelecaoTIPMOVCARTINV: TStringField;
    qryMarcaFlgReprocTRC: TwwQuery;
    qryBuscaBoletaDTO: TwwQuery;
    qryBuscaBoletaTRCIDEMISSOR: TFloatField;
    qryBuscaBoletasPLANO: TFloatField;
    qryBuscaFlgContabTIPMOVCARTINV: TStringField;
    qryBuscaHistDelecaoIDCARTEIRAINVEST: TFloatField;
    qryBuscaHistDelecaoIDBOLETA: TStringField;
    qryBuscaBoletaAJQ: TwwQuery;
    qryBuscaBoletaAJQTIPREG: TStringField;
    qryBuscaBoletaAJQIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaAJQDESCINVESTIMENTO: TStringField;
    qryBuscaBoletaAJQIDLOTE: TStringField;
    qryBuscaBoletaAJQIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaAJQIDBOLETA: TStringField;
    qryBuscaBoletaAJQIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaAJQDATAOPERACAO: TDateTimeField;
    qryBuscaBoletaAJQQUANTIDADE: TFloatField;
    qryBuscaBoletaAJQIDOPERACAO: TFloatField;
    qryBuscaBoletaAJQIDMOTIVOBLOQDEST: TFloatField;
    qryBuscaBoletaAJQIDMOTIVOBLOQORIG: TFloatField;
    qryBuscaBoletaAJQIDCUSTODIANTEDEST: TFloatField;
    qryBuscaBoletaAJQIDCUSTODIANTEORIG: TFloatField;
    qryBuscaBoletaAJQIDHISTCARTINVDEST: TFloatField;
    qryBuscaBoletaAJQIDHISTCARTINVORIG: TFloatField;
    qryBuscaBoletaAJQIDCUSTODIAORIG: TFloatField;
    qryBuscaBoletaAJQIDCUSTODIADEST: TFloatField;
    qryBuscaBoletaAJQIDEMISSOR: TFloatField;
    qryBuscaBoletaAJQIDCUSTODIANTE: TFloatField;
    qryBuscaBoletaAJQEMPRESAPROP: TFloatField;
    qryBuscaBoletaAJQIDMODULO: TFloatField;
    qryBuscaBoletaAJQIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaAJQPRECOUNITOPERACAO: TFloatField;
    qryBuscaBoletaAJQIDFORCLI: TFloatField;
    qryBuscaBoletaAJQFLGSTATUSFECHBOL: TStringField;
    qryBuscaBoletaAJQFLGSTATUSORDMOV: TStringField;
    qryBuscaBoletaAJQIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaAJQVLROPERACAO: TFloatField;
    qryBuscaBoletaAJQVLRIR: TFloatField;
    qryBuscaBoletaAJQTIPOMOVTO: TStringField;
    qryBuscaBoletaAJQNATUREZAOPERACAO: TStringField;
    qryBuscaBoletaAJQTIPOCUSTODIA: TStringField;
    qryBuscaBoletaAJQDESCTIPOOPERACAO: TStringField;
    qryMarcaFlgContab: TwwQuery;
    qryInsBoleta: TwwQuery;
    qryBuscaBoletaAJQIDOPERACAOINVEST: TFloatField;
    qryBuscaHistDelecaoIDOPERCUSTODIA: TFloatField;
    qryBuscaFlgReprocDESCINVESTIMENTO: TStringField;
    qryVerCotacaoPeriodo: TwwQuery;
    qryVerCotacaoPeriodoPRIMCOT: TFloatField;
    qryVerCotacaoPeriodoDATACOTACAO: TDateTimeField;
    qryVerCotacaoPeriodoCOTACAO: TFloatField;
    qryVerOperPeriodo: TwwQuery;
    qryVerOperPeriodoBOLETAS: TStringField;
    qryBuscaDatasReproc: TwwQuery;
    qryBuscaDatasReprocDATA: TDateTimeField;
    QryBuscaOperPendentes: TwwQuery;
    qryBuscaBoletaOPEIDOPERACAOORIGEM: TFloatField;
    qryBuscaBoletaDTG: TwwQuery;
    qryBuscaHistDelecaoIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaDTS: TwwQuery;
    qryBuscaBoletaDTI: TwwQuery;
    qryBuscaBoletaTCG: TwwQuery;
    qryHistPlnCodigoCODDOCUMENTO: TFloatField;
    qryDesmarcaFlgReproc: TwwQuery;
    qryBuscaFlgReprocIDCARTEIRAGERENC: TFloatField;
    qryBuscaFlgReprocDESCCARTINVEST: TStringField;
    qryAux1: TwwQuery;
    qryBuscaATU: TwwQuery;
    qryBuscaATUIDHISTCARTINV: TFloatField;
    qryAtuSldInvRVIDPLANPREVCTBPATR: TFloatField;
    qryMarcaFlgReprocAux: TwwQuery;
    qryMarcaFlgReprocAuxIDINVESTIMENTO: TFloatField;
    qryMarcaFlgReprocAuxIDCARTEIRAINVEST: TFloatField;
    qryMarcaFlgReprocAuxIDPLANPREVCTBPATR: TFloatField;
    qryMarcaFlgReprocAuxDESCINVESTIMENTO: TStringField;
    qryVerMarcaReproc: TwwQuery;
    qryVerMarcaReprocDATA: TDateTimeField;
    qryBuscaFlgContabDESCINVESTIMENTO: TStringField;
    qryBuscaFlgContabDESCTIPOOPERACAO: TStringField;
    qryBuscaHistDelecaoFLGCALCSALDO: TStringField;
    qryVerPrimeiroSaldo: TwwQuery;
    qryVerPrimeiroSaldoNUMREG: TFloatField;
    qryBuscaBoletaDTB: TwwQuery;
    qryBuscaBoletaDTGIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaDTGIDCUSTODIANTE: TFloatField;
    qryBuscaBoletaDTGIDCORRETVALORES: TFloatField;
    qryBuscaBoletaDTGEMPRESAPROP: TFloatField;
    qryBuscaBoletaDTGIDMODULO: TFloatField;
    qryBuscaBoletaDTGIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaDTGIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaDTGIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaDTGDATAOPERACAO: TDateTimeField;
    qryBuscaBoletaDTGNUMDOCUMENTO: TStringField;
    qryBuscaBoletaDTGQTDEOPERACAO: TFloatField;
    qryBuscaBoletaDTGPRECOUNITOPERACAO: TFloatField;
    qryBuscaBoletaDTGDATAVENCOPER: TDateTimeField;
    qryBuscaBoletaDTGIDFORCLI: TFloatField;
    qryBuscaBoletaDTGFLGSTATUSFECHBOL: TStringField;
    qryBuscaBoletaDTGFLGSTATUSORDMOV: TStringField;
    qryBuscaBoletaDTGIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaDTGVLROPERACAO: TFloatField;
    qryBuscaBoletaDTGIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaDTGVLRIR: TFloatField;
    qryBuscaBoletaDTGIDLOTE: TStringField;
    qryBuscaBoletaDTGIDOPERACAOORIGEM: TFloatField;
    qryBuscaBoletaDTGORIGDEST: TStringField;
    qryBuscaBoletaDTGTIPOMOVTO: TStringField;
    qryBuscaBoletaDTGNATUREZAOPERACAO: TStringField;
    qryBuscaBoletaDTGTIPOCUSTODIA: TStringField;
    qryBuscaBoletaDTGDESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaDTGDESCINVESTIMENTO: TStringField;
    qryBuscaBoletaDTGIDMOTIVOBLOQDEST: TFloatField;
    qryBuscaBoletaDTGIDMOTIVOBLOQORIG: TFloatField;
    qryBuscaBoletaDTD: TwwQuery;
    qryBuscaBoletaDRS: TwwQuery;
    qryBuscaBoletaDCI: TwwQuery;
    QryVerInvestOrigDest: TwwQuery;
    QryBuscaOperInvestPend: TwwQuery;
    qryBuscaBoletaDTA: TwwQuery;
    qryBuscaBoletasCODDOCUMENTO: TFloatField;
    qryBoletaTIPMOVBOLETA: TStringField;
    QryUpdHistCPMF: TwwQuery;
    QryBuscaHistCPMF: TwwQuery;
    qryBuscaBoletaDTGIDOPERACAODIREITO: TFloatField;
    QryOperacaoDireito: TwwQuery;
    QryBuscaBoletaVSU: TwwQuery;
    qryOperacaoIDOPERACAOINVEST: TFloatField;
    qryOperacaoIDINVESTIMENTO: TFloatField;
    qryOperacaoIDCUSTODIANTE: TFloatField;
    qryOperacaoIDCARTEIRAINVEST: TFloatField;
    qryOperacaoIDCARTEIRAGERENC: TFloatField;
    qryOperacaoDATAOPERACAO: TDateTimeField;
    qryOperacaoIDPLANPREVCTBPATR: TFloatField;
    qryOperacaoCODDOCUMENTO: TFloatField;
    qryOperacaoIDOPERCUSTODIA: TFloatField;
    qryOperacaoIDOPERACAODIREITO: TFloatField;
    qryOperacaoTIPMOVBOLETA: TStringField;
    qryBuscaHistDelecaoTIPMOVBOLETA: TStringField;
    qryBuscaHistDelecaoIDOPERACAODIREITO: TFloatField;
    qryBuscaBoletaTCU: TwwQuery;
    qryBuscaBoletaTCUIDOPERCUSTODIA: TFloatField;
    qryBuscaBoletaTCUIDMOTIVOBLOQDEST: TFloatField;
    qryBuscaBoletaTCUIDMOTIVOBLOQORIG: TFloatField;
    qryBuscaBoletaTCUIDCUSTODIANTEDEST: TFloatField;
    qryBuscaBoletaTCUIDCUSTODIANTEORIG: TFloatField;
    qryBuscaBoletaTCUIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaTCUIDCARTEIRADEST: TFloatField;
    qryBuscaBoletaTCUIDCARTEIRAORIG: TFloatField;
    qryBuscaBoletaTCUIDHISTCARTINVDEST: TFloatField;
    qryBuscaBoletaTCUIDHISTCARTINVORIG: TFloatField;
    qryBuscaBoletaTCUIDCUSTODIAORIG: TFloatField;
    qryBuscaBoletaTCUIDCUSTODIADEST: TFloatField;
    qryBuscaBoletaTCUDATAMOVCUSTOD: TDateTimeField;
    qryBuscaBoletaTCUIDLOTE: TStringField;
    qryBuscaBoletaTCUQUANTIDADE: TFloatField;
    qryBuscaBoletaTCUIDBOLETA: TStringField;
    qryBuscaBoletaTCUIDEMISSOR: TFloatField;
    qryBuscaBoletaTCUDESCINVESTIMENTO: TStringField;
    qryBuscaBoletaTCUIDPLANPREVCTBPATR: TFloatField;
    QryBuscaAnuncio: TwwQuery;
    QryCarteiraGerenc: TwwQuery;
    QryVerProvisaoCartGerenc: TwwQuery;
    qryBuscaBoletaDTOIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaDTOIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaDTOIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaDTOIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaDTOIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaDTODATAOPERACAO: TDateTimeField;
    qryBuscaBoletaDTOQTDEOPERACAO: TFloatField;
    qryBuscaBoletaDTOIDOPERACAOORIGEM: TFloatField;
    qryBuscaBoletaDTOVLROPERACAO: TFloatField;
    qryBuscaBoletaDTOIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaDTOIDOPERACAODIREITO: TFloatField;
    qryBuscaBoletaDTONUMDOCUMENTO: TStringField;
    qryBuscaBoletaDTOVLRIR: TFloatField;
    qryBuscaBoletaDTOIDLOTE: TStringField;
    qryBuscaBoletaDTODATAVENCOPER: TDateTimeField;
    qryBuscaBoletaDTONATUREZAOPERACAO: TStringField;
    qryBuscaBoletaDTODESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaDTORECPAG: TStringField;
    qryBuscaBoletaDTODESCINVESTIMENTO: TStringField;
    qryBuscaBoletaDTAIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaDTAIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaDTAIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaDTAIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaDTAIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaDTADATAOPERACAO: TDateTimeField;
    qryBuscaBoletaDTAQTDEOPERACAO: TFloatField;
    qryBuscaBoletaDTAVLROPERACAO: TFloatField;
    qryBuscaBoletaDTAIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaDTAIDOPERACAODIREITO: TFloatField;
    qryBuscaBoletaDTANUMDOCUMENTO: TStringField;
    qryBuscaBoletaDTAVLRIR: TFloatField;
    qryBuscaBoletaDTAIDLOTE: TStringField;
    qryBuscaBoletaDTADATAVENCOPER: TDateTimeField;
    qryBuscaBoletaDTANATUREZAOPERACAO: TStringField;
    qryBuscaBoletaDTADESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaDTARECPAG: TStringField;
    qryBuscaBoletaDTADESCINVESTIMENTO: TStringField;
    qryBuscaBoletaTRCIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaDRE: TwwQuery;
    qryUpdBoleta: TwwQuery;
    qryBuscaBoletaDSA: TwwQuery;
    qryBuscaBoletaCSA: TwwQuery;
    qryVerTRCPeriodo: TwwQuery;
    qryBuscaBoletaDTOVLROPERACAOOM: TFloatField;
    qryVerTRCPeriodoDATAMOVCUSTOD: TDateTimeField;
    qryVerTRCPeriodoIDINVESTIMENTO: TFloatField;
    qryVerTRCPeriodoIDPLANPREVCTBPATR: TFloatField;
    qryVerTRCPeriodoIDCARTEIRAINVEST: TFloatField;
    qryBuscaFlgReprocMENORDATA: TDateTimeField;
    qryBuscaBoletaTRCIDTIPOOPERORIG: TFloatField;
    qryBuscaBoletaTRCIDTIPOOPERDEST: TFloatField;
    qryBuscaBoletaDTOIDTIPOOPERACAOAGE: TFloatField;
    qryBuscaBoletaDTAIDTIPOOPERACAOAGE: TFloatField;
    qryOperacaoCODDOCUMOPER: TFloatField;
    qryBuscaATUPLNCODIGO: TFloatField;
    qryBuscaATUPLANO: TFloatField;
    qryBuscaBoletaOPEFLGCONTAINVEST: TFloatField;
    qryBuscaBoletaTRCFLGCONTAINVEST: TFloatField;
    qryBuscaBoletaDTGFLGCONTAINVEST: TFloatField;
    qryBuscaBoletaDTSIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaDTSIDCUSTODIANTE: TFloatField;
    qryBuscaBoletaDTSIDCORRETVALORES: TFloatField;
    qryBuscaBoletaDTSEMPRESAPROP: TFloatField;
    qryBuscaBoletaDTSIDMODULO: TFloatField;
    qryBuscaBoletaDTSIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaDTSIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaDTSIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaDTSDATAOPERACAO: TDateTimeField;
    qryBuscaBoletaDTSNUMDOCUMENTO: TStringField;
    qryBuscaBoletaDTSQTDEOPERACAO: TFloatField;
    qryBuscaBoletaDTSPRECOUNITOPERACAO: TFloatField;
    qryBuscaBoletaDTSDATAVENCOPER: TDateTimeField;
    qryBuscaBoletaDTSIDFORCLI: TFloatField;
    qryBuscaBoletaDTSFLGSTATUSFECHBOL: TStringField;
    qryBuscaBoletaDTSFLGSTATUSORDMOV: TStringField;
    qryBuscaBoletaDTSIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaDTSVLROPERACAO: TFloatField;
    qryBuscaBoletaDTSIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaDTSVLRIR: TFloatField;
    qryBuscaBoletaDTSIDLOTE: TStringField;
    qryBuscaBoletaDTSIDOPERACAOORIGEM: TFloatField;
    qryBuscaBoletaDTSIDOPERACAODIREITO: TFloatField;
    qryBuscaBoletaDTSORIGDEST: TStringField;
    qryBuscaBoletaDTSTIPOMOVTO: TStringField;
    qryBuscaBoletaDTSNATUREZAOPERACAO: TStringField;
    qryBuscaBoletaDTSTIPOCUSTODIA: TStringField;
    qryBuscaBoletaDTSRECPAG: TStringField;
    qryBuscaBoletaDTSDESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaDTSDESCINVESTIMENTO: TStringField;
    qryBuscaBoletaDTSIDMOTIVOBLOQDEST: TFloatField;
    qryBuscaBoletaDTSIDMOTIVOBLOQORIG: TFloatField;
    qryBuscaBoletaDTSFLGCONTAINVEST: TFloatField;
    qryBuscaBoletaDTIIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaDTIIDCUSTODIANTE: TFloatField;
    qryBuscaBoletaDTIIDCORRETVALORES: TFloatField;
    qryBuscaBoletaDTIEMPRESAPROP: TFloatField;
    qryBuscaBoletaDTIIDMODULO: TFloatField;
    qryBuscaBoletaDTIIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaDTIIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaDTIIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaDTIDATAOPERACAO: TDateTimeField;
    qryBuscaBoletaDTINUMDOCUMENTO: TStringField;
    qryBuscaBoletaDTIQTDEOPERACAO: TFloatField;
    qryBuscaBoletaDTIPRECOUNITOPERACAO: TFloatField;
    qryBuscaBoletaDTIDATAVENCOPER: TDateTimeField;
    qryBuscaBoletaDTIIDFORCLI: TFloatField;
    qryBuscaBoletaDTIFLGSTATUSFECHBOL: TStringField;
    qryBuscaBoletaDTIFLGSTATUSORDMOV: TStringField;
    qryBuscaBoletaDTIIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaDTIVLROPERACAO: TFloatField;
    qryBuscaBoletaDTIIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaDTIVLRIR: TFloatField;
    qryBuscaBoletaDTIIDLOTE: TStringField;
    qryBuscaBoletaDTIIDOPERACAOORIGEM: TFloatField;
    qryBuscaBoletaDTIORIGDEST: TStringField;
    qryBuscaBoletaDTIPERCENTUAL: TFloatField;
    qryBuscaBoletaDTIIDOPERACAODIREITO: TFloatField;
    qryBuscaBoletaDTITIPOMOVTO: TStringField;
    qryBuscaBoletaDTINATUREZAOPERACAO: TStringField;
    qryBuscaBoletaDTITIPOCUSTODIA: TStringField;
    qryBuscaBoletaDTIRECPAG: TStringField;
    qryBuscaBoletaDTIDESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaDTIDESCINVESTIMENTO: TStringField;
    qryBuscaBoletaDTIIDMOTIVOBLOQDEST: TFloatField;
    qryBuscaBoletaDTIIDMOTIVOBLOQORIG: TFloatField;
    qryBuscaBoletaDTIFLGCONTAINVEST: TFloatField;
    qryBuscaBoletaDTDIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaDTDIDCUSTODIANTE: TFloatField;
    qryBuscaBoletaDTDIDCORRETVALORES: TFloatField;
    qryBuscaBoletaDTDEMPRESAPROP: TFloatField;
    qryBuscaBoletaDTDIDMODULO: TFloatField;
    qryBuscaBoletaDTDIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaDTDIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaDTDIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaDTDDATAOPERACAO: TDateTimeField;
    qryBuscaBoletaDTDNUMDOCUMENTO: TStringField;
    qryBuscaBoletaDTDQTDEOPERACAO: TFloatField;
    qryBuscaBoletaDTDPRECOUNITOPERACAO: TFloatField;
    qryBuscaBoletaDTDDATAVENCOPER: TDateTimeField;
    qryBuscaBoletaDTDIDFORCLI: TFloatField;
    qryBuscaBoletaDTDFLGSTATUSFECHBOL: TStringField;
    qryBuscaBoletaDTDFLGSTATUSORDMOV: TStringField;
    qryBuscaBoletaDTDIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaDTDVLROPERACAO: TFloatField;
    qryBuscaBoletaDTDIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaDTDVLRIR: TFloatField;
    qryBuscaBoletaDTDIDLOTE: TStringField;
    qryBuscaBoletaDTDIDOPERACAOORIGEM: TFloatField;
    qryBuscaBoletaDTDORIGDEST: TStringField;
    qryBuscaBoletaDTDTIPOMOVTO: TStringField;
    qryBuscaBoletaDTDNATUREZAOPERACAO: TStringField;
    qryBuscaBoletaDTDTIPOCUSTODIA: TStringField;
    qryBuscaBoletaDTDDESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaDTDDESCINVESTIMENTO: TStringField;
    qryBuscaBoletaDTDIDMOTIVOBLOQDEST: TFloatField;
    qryBuscaBoletaDTDIDMOTIVOBLOQORIG: TFloatField;
    qryBuscaBoletaDTDFLGCONTAINVEST: TFloatField;
    qryBuscaBoletaDCIIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaDCIIDCUSTODIANTE: TFloatField;
    qryBuscaBoletaDCIIDCORRETVALORES: TFloatField;
    qryBuscaBoletaDCIEMPRESAPROP: TFloatField;
    qryBuscaBoletaDCIIDMODULO: TFloatField;
    qryBuscaBoletaDCIIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaDCIIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaDCIIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaDCIDATAOPERACAO: TDateTimeField;
    qryBuscaBoletaDCINUMDOCUMENTO: TStringField;
    qryBuscaBoletaDCIQTDEOPERACAO: TFloatField;
    qryBuscaBoletaDCIPRECOUNITOPERACAO: TFloatField;
    qryBuscaBoletaDCIDATAVENCOPER: TDateTimeField;
    qryBuscaBoletaDCIIDFORCLI: TFloatField;
    qryBuscaBoletaDCIFLGSTATUSFECHBOL: TStringField;
    qryBuscaBoletaDCIFLGSTATUSORDMOV: TStringField;
    qryBuscaBoletaDCIIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaDCIVLROPERACAO: TFloatField;
    qryBuscaBoletaDCIIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaDCIVLRIR: TFloatField;
    qryBuscaBoletaDCIIDLOTE: TStringField;
    qryBuscaBoletaDCIIDOPERACAOORIGEM: TFloatField;
    qryBuscaBoletaDCIIDOPERCUSTODIA: TFloatField;
    qryBuscaBoletaDCIIDOPERACAODIREITO: TFloatField;
    qryBuscaBoletaDCIVLRCUSTOATUAL: TFloatField;
    qryBuscaBoletaDCIVLRVARIACAOATUAL: TFloatField;
    qryBuscaBoletaDCIORIGDEST: TStringField;
    qryBuscaBoletaDCITIPOMOVTO: TStringField;
    qryBuscaBoletaDCINATUREZAOPERACAO: TStringField;
    qryBuscaBoletaDCITIPOCUSTODIA: TStringField;
    qryBuscaBoletaDCIDESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaDCIDESCINVESTIMENTO: TStringField;
    qryBuscaBoletaDCIIDMOTIVOBLOQDEST: TFloatField;
    qryBuscaBoletaDCIIDMOTIVOBLOQORIG: TFloatField;
    qryBuscaBoletaDCIFLGCONTAINVEST: TFloatField;
    qryBuscaBoletaAJQFLGCONTAINVEST: TFloatField;
    QryBuscaBoletaVSUIDINVESTIMENTO: TFloatField;
    QryBuscaBoletaVSUIDEMISSOR: TFloatField;
    QryBuscaBoletaVSUDESCINVESTIMENTO: TStringField;
    QryBuscaBoletaVSUIDLOTE: TStringField;
    QryBuscaBoletaVSUIDPLANPREVCTBPATR: TFloatField;
    QryBuscaBoletaVSUNUMDOCUMENTO: TStringField;
    QryBuscaBoletaVSUIDCARTEIRAINVEST: TFloatField;
    QryBuscaBoletaVSUDATAOPERACAO: TDateTimeField;
    QryBuscaBoletaVSUQTDEOPERACAO: TFloatField;
    QryBuscaBoletaVSUIDOPERACAOINVEST: TFloatField;
    QryBuscaBoletaVSUDATAVENCOPER: TDateTimeField;
    QryBuscaBoletaVSUIDCUSTODIANTE: TFloatField;
    QryBuscaBoletaVSUEMPRESAPROP: TFloatField;
    QryBuscaBoletaVSUIDMODULO: TFloatField;
    QryBuscaBoletaVSUIDTIPOOPERACAO: TFloatField;
    QryBuscaBoletaVSUPRECOUNITOPERACAO: TFloatField;
    QryBuscaBoletaVSUIDFORCLI: TFloatField;
    QryBuscaBoletaVSUFLGSTATUSFECHBOL: TStringField;
    QryBuscaBoletaVSUFLGSTATUSORDMOV: TStringField;
    QryBuscaBoletaVSUIDCARTEIRAGERENC: TFloatField;
    QryBuscaBoletaVSUVLROPERACAO: TFloatField;
    QryBuscaBoletaVSUVLRIR: TFloatField;
    QryBuscaBoletaVSUTIPOMOVTO: TStringField;
    QryBuscaBoletaVSUNATUREZAOPERACAO: TStringField;
    QryBuscaBoletaVSUTIPOCUSTODIA: TStringField;
    QryBuscaBoletaVSUDESCTIPOOPERACAO: TStringField;
    QryBuscaBoletaVSUFLGCONTAINVEST: TFloatField;
    qryBuscaBoletaDREIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaDREIDCUSTODIANTE: TFloatField;
    qryBuscaBoletaDREIDCORRETVALORES: TFloatField;
    qryBuscaBoletaDREEMPRESAPROP: TFloatField;
    qryBuscaBoletaDREIDMODULO: TFloatField;
    qryBuscaBoletaDREIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaDREIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaDREIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaDREDATAOPERACAO: TDateTimeField;
    qryBuscaBoletaDRENUMDOCUMENTO: TStringField;
    qryBuscaBoletaDREQTDEOPERACAO: TFloatField;
    qryBuscaBoletaDREPRECOUNITOPERACAO: TFloatField;
    qryBuscaBoletaDREDATAVENCOPER: TDateTimeField;
    qryBuscaBoletaDREIDFORCLI: TFloatField;
    qryBuscaBoletaDREFLGSTATUSFECHBOL: TStringField;
    qryBuscaBoletaDREFLGSTATUSORDMOV: TStringField;
    qryBuscaBoletaDREIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaDREVLROPERACAO: TFloatField;
    qryBuscaBoletaDREIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaDREVLRIR: TFloatField;
    qryBuscaBoletaDREIDLOTE: TStringField;
    qryBuscaBoletaDREIDOPERACAOORIGEM: TFloatField;
    qryBuscaBoletaDREIDOPERACAODIREITO: TFloatField;
    qryBuscaBoletaDREORIGDEST: TStringField;
    qryBuscaBoletaDRETIPOMOVTO: TStringField;
    qryBuscaBoletaDRENATUREZAOPERACAO: TStringField;
    qryBuscaBoletaDRETIPOCUSTODIA: TStringField;
    qryBuscaBoletaDRERECPAG: TStringField;
    qryBuscaBoletaDREDESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaDREDESCINVESTIMENTO: TStringField;
    qryBuscaBoletaDREIDMOTIVOBLOQDEST: TFloatField;
    qryBuscaBoletaDREIDMOTIVOBLOQORIG: TFloatField;
    qryBuscaBoletaDREFLGCONTAINVEST: TFloatField;
    qryBuscaBoletaDSAIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaDSAIDCUSTODIANTE: TFloatField;
    qryBuscaBoletaDSAIDCORRETVALORES: TFloatField;
    qryBuscaBoletaDSAEMPRESAPROP: TFloatField;
    qryBuscaBoletaDSAIDMODULO: TFloatField;
    qryBuscaBoletaDSAIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaDSAIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaDSAIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaDSADATAOPERACAO: TDateTimeField;
    qryBuscaBoletaDSANUMDOCUMENTO: TStringField;
    qryBuscaBoletaDSAQTDEOPERACAO: TFloatField;
    qryBuscaBoletaDSAPRECOUNITOPERACAO: TFloatField;
    qryBuscaBoletaDSADATAVENCOPER: TDateTimeField;
    qryBuscaBoletaDSAIDFORCLI: TFloatField;
    qryBuscaBoletaDSAFLGSTATUSFECHBOL: TStringField;
    qryBuscaBoletaDSAFLGSTATUSORDMOV: TStringField;
    qryBuscaBoletaDSAIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaDSAVLROPERACAO: TFloatField;
    qryBuscaBoletaDSAIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaDSAVLRIR: TFloatField;
    qryBuscaBoletaDSAIDLOTE: TStringField;
    qryBuscaBoletaDSAIDOPERACAOORIGEM: TFloatField;
    qryBuscaBoletaDSAIDOPERACAODIREITO: TFloatField;
    qryBuscaBoletaDSAORIGDEST: TStringField;
    qryBuscaBoletaDSAVLRCUSTOATUAL: TFloatField;
    qryBuscaBoletaDSAVLRVARIACAOATUAL: TFloatField;
    qryBuscaBoletaDSATIPOMOVTO: TStringField;
    qryBuscaBoletaDSANATUREZAOPERACAO: TStringField;
    qryBuscaBoletaDSATIPOCUSTODIA: TStringField;
    qryBuscaBoletaDSARECPAG: TStringField;
    qryBuscaBoletaDSADESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaDSADESCINVESTIMENTO: TStringField;
    qryBuscaBoletaDSAIDMOTIVOBLOQDEST: TFloatField;
    qryBuscaBoletaDSAIDMOTIVOBLOQORIG: TFloatField;
    qryBuscaBoletaDSAFLGCONTAINVEST: TFloatField;
    qryBuscaBoletaCSAIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaCSAIDCUSTODIANTE: TFloatField;
    qryBuscaBoletaCSAIDCORRETVALORES: TFloatField;
    qryBuscaBoletaCSAEMPRESAPROP: TFloatField;
    qryBuscaBoletaCSAIDMODULO: TFloatField;
    qryBuscaBoletaCSAIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaCSAIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaCSAIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaCSADATAOPERACAO: TDateTimeField;
    qryBuscaBoletaCSANUMDOCUMENTO: TStringField;
    qryBuscaBoletaCSAQTDEOPERACAO: TFloatField;
    qryBuscaBoletaCSAPRECOUNITOPERACAO: TFloatField;
    qryBuscaBoletaCSADATAVENCOPER: TDateTimeField;
    qryBuscaBoletaCSAIDFORCLI: TFloatField;
    qryBuscaBoletaCSAFLGSTATUSFECHBOL: TStringField;
    qryBuscaBoletaCSAFLGSTATUSORDMOV: TStringField;
    qryBuscaBoletaCSAIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaCSAVLROPERACAO: TFloatField;
    qryBuscaBoletaCSAIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaCSAVLRIR: TFloatField;
    qryBuscaBoletaCSAIDLOTE: TStringField;
    qryBuscaBoletaCSAIDOPERACAOORIGEM: TFloatField;
    qryBuscaBoletaCSAIDOPERACAODIREITO: TFloatField;
    qryBuscaBoletaCSAORIGDEST: TStringField;
    qryBuscaBoletaCSAVLRCUSTOATUAL: TFloatField;
    qryBuscaBoletaCSAVLRVARIACAOATUAL: TFloatField;
    qryBuscaBoletaCSATIPOMOVTO: TStringField;
    qryBuscaBoletaCSANATUREZAOPERACAO: TStringField;
    qryBuscaBoletaCSATIPOCUSTODIA: TStringField;
    qryBuscaBoletaCSARECPAG: TStringField;
    qryBuscaBoletaCSADESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaCSADESCINVESTIMENTO: TStringField;
    qryBuscaBoletaCSAIDMOTIVOBLOQDEST: TFloatField;
    qryBuscaBoletaCSAIDMOTIVOBLOQORIG: TFloatField;
    qryBuscaBoletaCSAFLGCONTAINVEST: TFloatField;
    qryBuscaBoletaDTIVLRCUSTOATUAL: TFloatField;
    qryBuscaBoletaDTIVLRVARIACAOATUAL: TFloatField;
    qryBuscaBoletaDTOVLRREMUNERACAO: TFloatField;
    qryNumBoleta: TwwQuery;
    qrySaldosTRCPlanos: TwwQuery;
    qrySaldosTRCPlanosDESCCARTINVEST: TStringField;
    qrySaldosTRCPlanosDESCINVESTIMENTO: TStringField;
    qrySaldosTRCPlanosSALDOQTDEINVCART: TFloatField;
    qrySaldosTRCPlanosSALDOVLRINVCART: TFloatField;
    qrySaldosTRCPlanosPERCTRANSFERIDO: TFloatField;
    qrySaldosTRCPlanosQTDTRANSFERIDO: TFloatField;
    qrySaldosTRCPlanosSALDOCCI: TFloatField;
    qrySaldosTRCPlanosSALDOQTDECPMF: TFloatField;
    qrySaldosTRCPlanosSALDOAQUI: TFloatField;
    qrySaldosTRCPlanosPUCUSTO: TFloatField;
    qrySaldosTRCPlanosSALDOVARIACAO: TFloatField;
    qrySaldosTRCPlanosSALDOPROVPERDA: TFloatField;
    qrySaldosTRCPlanosVLRTRANSFERIDO: TFloatField;
    qryBuscaBoletaTRCIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaOPEPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaOPEDESCCARTINVEST: TStringField;
    qryBuscaBoletaTRCPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaDTADESCCARTINVEST: TStringField;
    qryBuscaBoletaDTAPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaAJQPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaAJQDESCCARTINVEST: TStringField;
    qryBuscaBoletaDTGDESCCARTINVEST: TStringField;
    qryBuscaBoletaDTGPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaDTIPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaDTIDESCCARTINVEST: TStringField;
    qryBuscaBoletaDTBIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaDTBIDCUSTODIANTE: TFloatField;
    qryBuscaBoletaDTBIDCORRETVALORES: TFloatField;
    qryBuscaBoletaDTBEMPRESAPROP: TFloatField;
    qryBuscaBoletaDTBIDMODULO: TFloatField;
    qryBuscaBoletaDTBIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaDTBIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaDTBIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaDTBDATAOPERACAO: TDateTimeField;
    qryBuscaBoletaDTBNUMDOCUMENTO: TStringField;
    qryBuscaBoletaDTBQTDEOPERACAO: TFloatField;
    qryBuscaBoletaDTBPRECOUNITOPERACAO: TFloatField;
    qryBuscaBoletaDTBDATAVENCOPER: TDateTimeField;
    qryBuscaBoletaDTBIDFORCLI: TFloatField;
    qryBuscaBoletaDTBFLGSTATUSFECHBOL: TStringField;
    qryBuscaBoletaDTBFLGSTATUSORDMOV: TStringField;
    qryBuscaBoletaDTBIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaDTBVLROPERACAO: TFloatField;
    qryBuscaBoletaDTBIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaDTBVLRIR: TFloatField;
    qryBuscaBoletaDTBIDLOTE: TStringField;
    qryBuscaBoletaDTBIDOPERACAOORIGEM: TFloatField;
    qryBuscaBoletaDTBIDMOTIVOBLOQUEIO: TFloatField;
    qryBuscaBoletaDTBORIGDEST: TStringField;
    qryBuscaBoletaDTBTIPOMOVTO: TStringField;
    qryBuscaBoletaDTBNATUREZAOPERACAO: TStringField;
    qryBuscaBoletaDTBTIPOCUSTODIA: TStringField;
    qryBuscaBoletaDTBRECPAG: TStringField;
    qryBuscaBoletaDTBDESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaDTBDESCINVESTIMENTO: TStringField;
    qryBuscaBoletaDTBPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaDTBDESCCARTINVEST: TStringField;
    qryBuscaBoletaDTDPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaDTDDESCCARTINVEST: TStringField;
    qryBuscaBoletaDRSIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaDRSIDCUSTODIANTE: TFloatField;
    qryBuscaBoletaDRSIDCORRETVALORES: TFloatField;
    qryBuscaBoletaDRSEMPRESAPROP: TFloatField;
    qryBuscaBoletaDRSIDMODULO: TFloatField;
    qryBuscaBoletaDRSIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaDRSIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaDRSIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaDRSDATAOPERACAO: TDateTimeField;
    qryBuscaBoletaDRSNUMDOCUMENTO: TStringField;
    qryBuscaBoletaDRSQTDEOPERACAO: TFloatField;
    qryBuscaBoletaDRSPRECOUNITOPERACAO: TFloatField;
    qryBuscaBoletaDRSDATAVENCOPER: TDateTimeField;
    qryBuscaBoletaDRSIDFORCLI: TFloatField;
    qryBuscaBoletaDRSFLGSTATUSFECHBOL: TStringField;
    qryBuscaBoletaDRSFLGSTATUSORDMOV: TStringField;
    qryBuscaBoletaDRSIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaDRSVLROPERACAO: TFloatField;
    qryBuscaBoletaDRSIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaDRSVLRIR: TFloatField;
    qryBuscaBoletaDRSIDLOTE: TStringField;
    qryBuscaBoletaDRSIDOPERACAOORIGEM: TFloatField;
    qryBuscaBoletaDRSIDOPERACAODIREITO: TFloatField;
    qryBuscaBoletaDRSORIGDEST: TStringField;
    qryBuscaBoletaDRSTIPOMOVTO: TStringField;
    qryBuscaBoletaDRSNATUREZAOPERACAO: TStringField;
    qryBuscaBoletaDRSTIPOCUSTODIA: TStringField;
    qryBuscaBoletaDRSRECPAG: TStringField;
    qryBuscaBoletaDRSDESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaDRSDESCINVESTIMENTO: TStringField;
    qryBuscaBoletaDRSPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaDRSDESCCARTINVEST: TStringField;
    qryBuscaBoletaTRP: TwwQuery;
    qryBuscaBoletaDCIPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaDCIDESCCARTINVEST: TStringField;
    QryBuscaBoletaVSUPLANPRVCONTABPATRO: TStringField;
    QryBuscaBoletaVSUDESCCARTINVEST: TStringField;
    qryBuscaBoletaDREPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaDREDESCCARTINVEST: TStringField;
    qryBuscaBoletaDSAPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaDSADESCCARTINVEST: TStringField;
    qryBuscaBoletaCSAPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaCSADESCCARTINVEST: TStringField;
    qryBuscaBoletaDTOPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaDTODESCCARTINVEST: TStringField;
    qryBuscaFlgReprocPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaTRPDATAOPERACAO: TDateTimeField;
    qryBuscaBoletaTRPDESCINVESTIMENTO: TStringField;
    qryBuscaBoletaTRPPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaTRPDESCCARTINVEST: TStringField;
    qryBuscaBoletaTRPDESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaTRPQTDEOPERACAO: TFloatField;
    qryBuscaBoletaTRPIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaTRPIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaTRPIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaTRPIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaTRPIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaTRPIDEMISSOR: TFloatField;
    qryBuscaBoletaTRPIDLOTE: TStringField;
    qryBuscaBoletaTRPIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaTRPIDOPERCUSTODIA: TFloatField;
    qryBuscaBoletaTRPIDCUSTODIANTE: TFloatField;
    qryBuscaBoletaTRPIDMOTIVOBLOQUEIO: TFloatField;
    qryBuscaBoletaTRPORIGDEST: TStringField;
    //AL_129
    qryAtuSldInvRVPLANPRVCONTABPATRO: TStringField;
    qryAtuSldInvRVDESCCARTINVEST: TStringField;
    qryBuscaBoletaTRI: TwwQuery;
    qryBuscaBoletaTRIDATAOPERACAO: TDateTimeField;
    qryBuscaBoletaTRIDESCINVESTIMENTO: TStringField;
    qryBuscaBoletaTRIPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaTRIDESCCARTINVEST: TStringField;
    qryBuscaBoletaTRIDESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaTRIQTDEOPERACAO: TFloatField;
    qryBuscaBoletaTRIIDOPERACAOINVEST: TFloatField;
    qryBuscaBoletaTRIIDINVESTIMENTO: TFloatField;
    qryBuscaBoletaTRIIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaTRIIDCARTEIRAINVEST: TFloatField;
    qryBuscaBoletaTRIIDCARTEIRAGERENC: TFloatField;
    qryBuscaBoletaTRIIDEMISSOR: TFloatField;
    qryBuscaBoletaTRIIDLOTE: TStringField;
    qryBuscaBoletaTRIIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaTRIIDOPERCUSTODIA: TFloatField;
    qryBuscaBoletaTRIIDCUSTODIANTE: TFloatField;
    qryBuscaBoletaTRIORIGDEST: TStringField;
    qryBuscaHistDelecaoIDINVESTIMENTO: TFloatField;
    qryBuscaHistDelecaoIDPLANPREVCTBPATR: TFloatField;
    qryBuscaBoletaTCUDESCTIPOOPERACAO: TStringField;
    qryBuscaBoletaTCUDESCCARTINVEST: TStringField;
    qryBuscaBoletaTCUPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaTCUIDPLANPREVCTBDEST: TFloatField;
    qryBuscaBoletaTRPPLANO: TFloatField;
    qryBuscaBoletaTRPPLNCODIGO: TFloatField;
    qryBuscaBoletaTRPCODDOCUMENTO: TFloatField;
    qryBuscaBoletaDTSPLANPRVCONTABPATRO: TStringField;
    qryBuscaBoletaDTSDESCCARTINVEST: TStringField;
    qryBuscaBoletaDTSIDOPERCUSTODIA: TFloatField;
    qryBuscaBoletaTCUFLGTIPOCONTAORIG: TFloatField;
    qryBuscaBoletaTCUFLGTIPOCONTADEST: TFloatField;
    //AL_136
    qryBuscaBoletaDTGIDOPERCUSTODIA: TFloatField;
    //AL_138
    qryBuscaBoletaTRCDESCCARTINVEST: TStringField;
    //AL_139
    QryGravaLogTotalPrev: TwwQuery;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611 - Início
    qryBuscaBoletaDTADATAAGE: TDateTimeField;
    qryBuscaBoletaDTBDATAAGE: TDateTimeField;
    QryBuscaVendasDia: TwwQuery;
    QryVerDireitosCancelar: TwwQuery;
    qryRecebimento: TwwQuery;
    qryRecebimentoDESCCARTINVEST: TStringField;
    qryRecebimentoNUMDOCUMENTO: TStringField;
    qryRecebimentoDESCTIPOOPERACAO: TStringField;
    qryRecebimentoDESCINVESTIMENTO: TStringField;
    qryRecebimentoPLANPRVCONTABPATRO: TStringField;
    qryRecebimentoSGLCUSTODIANTE: TStringField;
    qryRecebimentoSIGLAMOTBLOQ: TStringField;
    qryRecebimentoQTDEOPERACAO: TFloatField;
    qryRecebimentoPRECOUNITOPERACAO: TFloatField;
    qryRecebimentoVLROPERACAO: TFloatField;
    qryRecebimentoVLRREMUNERACAO: TFloatField;
    qryRecebimentoVLRIRREMUNER: TFloatField;
    qryRecebimentoVLRIR: TFloatField;
    qryRecebimentoVLRLIQUIDO: TFloatField;
    qryRecebimentoDATABASE: TDateTimeField;
    qryRecebimentoDATAOPERACAO: TDateTimeField;
    qryRecebimentoDATAVENCOPER: TDateTimeField;
    qryRecebimentoIDOPERACAOINVEST: TFloatField;
    qryRecebimentoMOECODIGO: TFloatField;
    qryRecebimentoIDMODULO: TFloatField;
    qryRecebimentoORIGDEST: TStringField;
    qryRecebimentoEMPRESAPROP: TFloatField;
    qryRecebimentoIDINVESTIMENTO: TFloatField;
    qryRecebimentoIDCARTEIRAINVEST: TFloatField;
    qryRecebimentoIDTIPOINVEST: TFloatField;
    qryRecebimentoIDTIPOOPERACAO: TFloatField;
    qryRecebimentoNUMDOCUMENTO_1: TStringField;
    qryRecebimentoIDFORCLI: TFloatField;
    qryRecebimentoIDLOTE: TStringField;
    qryRecebimentoIDCUSTODIANTE: TFloatField;
    qryRecebimentoFLGSTATUSFECHBOL: TStringField;
    qryRecebimentoFLGSTATUSORDMOV: TStringField;
    qryRecebimentoIDOPERACAODIREITO: TFloatField;
    qryRecebimentoPERCENTUAL: TFloatField;
    qryRecebimentoIDCARTEIRAGERENC: TFloatField;
    qryRecebimentoIDPLANPREVCTBPATR: TFloatField;
    qryRecebimentoIDOPERCUSTODIA: TFloatField;
    qryRecebimentoIDCUSTORIG: TFloatField;
    qryRecebimentoIDMOTIVOBLOQUEIO: TFloatField;
    qryRecebimentoNATUREZAOPERACAO: TStringField;
    qryRecebimentoIDCARTEIRA: TStringField;
    qryRecebimentoIDOPERACAOORIGEM: TFloatField;
    qryRecebimentoALTERADO: TStringField;
    qryRecebimentoCARTGERENCIAL: TStringField;
    updRecebimento: TUpdateSQL;
    dsRecebimento: TwwDataSource;
    qryCancelamento: TwwQuery;
    qryCancelamentoNUMDOCUMENTO: TStringField;
    qryCancelamentoDESCINVESTIMENTO: TStringField;
    qryCancelamentoDESCTIPOOPERACAO: TStringField;
    qryCancelamentoPLANPRVCONTABPATRO: TStringField;
    qryCancelamentoDESCCARTINVEST: TStringField;
    qryCancelamentoQTDEOPERACAO: TFloatField;
    qryCancelamentoVLROPERACAO: TFloatField;
    qryCancelamentoVLRREMUNERACAO: TFloatField;
    qryCancelamentoVLRIRREMUNER: TFloatField;
    qryCancelamentoVLRIR: TFloatField;
    qryCancelamentoVLRLIQUIDO: TFloatField;
    qryCancelamentoSGLCUSTODIANTE: TStringField;
    qryCancelamentoSIGLAMOTBLOQ: TStringField;
    qryCancelamentoDATABASE: TDateTimeField;
    qryCancelamentoDATACOM: TDateTimeField;
    qryCancelamentoIDOPERACAOINVEST: TFloatField;
    qryCancelamentoMOECODIGO: TFloatField;
    qryCancelamentoIDMODULO: TFloatField;
    qryCancelamentoORIGDEST: TStringField;
    qryCancelamentoEMPRESAPROP: TFloatField;
    qryCancelamentoIDINVESTIMENTO: TFloatField;
    qryCancelamentoIDCARTEIRAINVEST: TFloatField;
    qryCancelamentoIDTIPOINVEST: TFloatField;
    qryCancelamentoIDTIPOOPERACAO: TFloatField;
    qryCancelamentoDATAOPERACAO: TDateTimeField;
    qryCancelamentoNUMDOCUMENTO_1: TStringField;
    qryCancelamentoPRECOUNITOPERACAO: TFloatField;
    qryCancelamentoDATAVENCOPER: TDateTimeField;
    qryCancelamentoIDFORCLI: TFloatField;
    qryCancelamentoIDLOTE: TStringField;
    qryCancelamentoIDCUSTODIANTE: TFloatField;
    qryCancelamentoFLGSTATUSFECHBOL: TStringField;
    qryCancelamentoFLGSTATUSORDMOV: TStringField;
    qryCancelamentoIDOPERACAODIREITO: TFloatField;
    qryCancelamentoPERCENTUAL: TFloatField;
    qryCancelamentoIDCARTEIRAGERENC: TFloatField;
    qryCancelamentoIDPLANPREVCTBPATR: TFloatField;
    qryCancelamentoIDOPERCUSTODIA: TFloatField;
    qryCancelamentoIDCUSTORIG: TFloatField;
    qryCancelamentoIDMOTIVOBLOQUEIO: TFloatField;
    qryCancelamentoNATUREZAOPERACAO: TStringField;
    qryCancelamentoIDCARTEIRA: TStringField;
    qryCancelamentoIDOPERACAOORIGEM: TFloatField;
    qryCancelamentoALTERADO: TStringField;
    qryCancelamentoCARTGERENCIAL: TStringField;
    qryCancelamentoIDEMISSOR: TFloatField;
    qryCancelamentoDATAAGE: TDateTimeField;
    qryTipoOperCan: TwwQuery;
    qryInvestimentoAcao: TwwQuery;
    qryInvestimentoAcaoDESCINVESTIMENTO: TStringField;
    qryInvestimentoAcaoQTDTITLOTE: TFloatField;
    qryInvestimentoAcaoIDINVESTIMENTO: TFloatField;
    qryInvestimentoAcaoIDTIPOINVEST: TFloatField;
    qryInvestimentoAcaoIDEMISSOR: TFloatField;
    qryInvestimentoAcaoIDMOEDACONTAB: TFloatField;
    dspSelBoleta: TDataSetProvider;
    cdsSelBoleta: TCMClientDataSet;
    qryBoletaCanc: TwwQuery;    
    qryBoletaCancIDBOLETA: TStringField;
    qryBoletaCancSTATUS: TStringField;
    qryBoletaCancDATABOLETA: TDateTimeField;
    qryBoletaCancTIPMOVBOLETA: TStringField;
    qryBoletaCancIDFORCLI: TFloatField;
    qryBoletaCancPLANO: TFloatField;
    qryBoletaCancPLNCODIGO: TFloatField;
    qryBoletaCancCODDOCUMENTO: TFloatField;
    qryBoletaCancEXCLUIBOLETA: TStringField;
    qryBoletaCancCONTACCI: TFloatField;
    qryBoletaCancVALOR: TFloatField;
    updBoletaCanc: TUpdateSQL;
    qryProvisao: TwwQuery;
    qryProvisaoDESCCARTINVEST: TStringField;
    qryProvisaoNUMDOCUMENTO: TStringField;
    qryProvisaoDESCTIPOOPERACAO: TStringField;
    qryProvisaoDESCINVESTIMENTO: TStringField;
    qryProvisaoPLANPRVCONTABPATRO: TStringField;
    qryProvisaoSGLCUSTODIANTE: TStringField;
    qryProvisaoSIGLAMOTBLOQ: TStringField;
    qryProvisaoQTDEOPERACAO: TFloatField;
    qryProvisaoPRECOUNITOPERACAO: TFloatField;
    qryProvisaoVLROPERACAO: TFloatField;
    qryProvisaoVLRREMUNERACAO: TFloatField;
    qryProvisaoVLRIRREMUNER: TFloatField;
    qryProvisaoVLRIR: TFloatField;
    qryProvisaoVLRLIQUIDO: TFloatField;
    qryProvisaoDATABASE: TDateTimeField;
    qryProvisaoDATAOPERACAO: TDateTimeField;
    qryProvisaoDATAVENCOPER: TDateTimeField;
    qryProvisaoIDOPERACAOINVEST: TFloatField;
    qryProvisaoMOECODIGO: TFloatField;
    qryProvisaoIDMODULO: TFloatField;
    qryProvisaoORIGDEST: TStringField;
    qryProvisaoEMPRESAPROP: TFloatField;
    qryProvisaoIDINVESTIMENTO: TFloatField;
    qryProvisaoIDCARTEIRAINVEST: TFloatField;
    qryProvisaoIDTIPOINVEST: TFloatField;
    qryProvisaoIDTIPOOPERACAO: TFloatField;
    qryProvisaoNUMDOCUMENTO_1: TStringField;
    qryProvisaoIDFORCLI: TFloatField;
    qryProvisaoIDLOTE: TStringField;
    qryProvisaoIDCUSTODIANTE: TFloatField;
    qryProvisaoFLGSTATUSFECHBOL: TStringField;
    qryProvisaoFLGSTATUSORDMOV: TStringField;
    qryProvisaoIDOPERACAODIREITO: TFloatField;
    qryProvisaoPERCENTUAL: TFloatField;
    qryProvisaoIDCARTEIRAGERENC: TFloatField;
    qryProvisaoIDPLANPREVCTBPATR: TFloatField;
    qryProvisaoIDOPERCUSTODIA: TFloatField;
    qryProvisaoIDCUSTORIG: TFloatField;
    qryProvisaoIDMOTIVOBLOQUEIO: TFloatField;
    qryProvisaoNATUREZAOPERACAO: TStringField;
    qryProvisaoIDCARTEIRA: TStringField;
    qryProvisaoQTDEEXERCIDA: TFloatField;
    qryProvisaoALTERADO: TStringField;
    qryProvisaoCARTGERENCIAL: TStringField;
    updProvisao: TUpdateSQL;
    dsProvisao: TwwDataSource;
    qryBuscaBoletaDTODATAAGE: TDateTimeField;
    //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
    qryBuscaBoletaTRD: TwwQuery;
    qryVerTRPPeriodo: TwwQuery;
    //Ricardo Cristiano - 17/05/2011 - N. Sol 157990.4821 -  N. Kintana 1273974
    qryBuscaBoletaTRCAtu: TwwQuery;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611 - Fim
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure qryBuscaHistDelecaoBeforeOpen(DataSet: TDataSet);
    procedure qryAtuSldInvRVBeforeOpen(DataSet: TDataSet);
    procedure qryBuscaBoletasBeforeOpen(DataSet: TDataSet);
    procedure qryBuscaFlgReprocBeforeOpen(DataSet: TDataSet);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRendaVariavel: TDMRendaVariavel;

implementation

{$R *.DFM}

// AL_116
procedure TDMRendaVariavel.DataModuleCreate(Sender: TObject);
begin

end;

// AL_116
procedure TDMRendaVariavel.DataModuleDestroy(Sender: TObject);
var i: Word;
begin
   for i := 0 to TDataModule(Sender).ComponentCount -1 do
   begin
      if TDataModule(Sender).Components[i] is TQuery then
      begin
         if TQuery(TDataModule(Sender).Components[i]).State <> dsInactive then
            TQuery(TDataModule(Sender).Components[i]).Close;
      end;
   end;

   if qryAtuSldInvRV.Prepared then
      qryAtuSldInvRV.UnPrepare;
   if qryBuscaFlgReproc.Prepared then
      qryBuscaFlgReproc.UnPrepare;
   if qryBuscaHistDelecao.Prepared then
      qryBuscaHistDelecao.UnPrepare;
   if qryBuscaBoletas.Prepared then
      qryBuscaBoletas.UnPrepare;
end;

//AL_133
procedure TDMRendaVariavel.qryAtuSldInvRVBeforeOpen(DataSet: TDataSet);
begin
   if not qryAtuSldInvRV.Prepared then
      qryAtuSldInvRV.Prepare;
end;

//AL_133
procedure TDMRendaVariavel.qryBuscaHistDelecaoBeforeOpen(
  DataSet: TDataSet);
begin
   if not qryBuscaHistDelecao.Prepared then
      qryBuscaHistDelecao.Prepare;
end;

//AL_133
procedure TDMRendaVariavel.qryBuscaBoletasBeforeOpen(DataSet: TDataSet);
begin
   if not qryBuscaBoletas.Prepared then
      qryBuscaBoletas.Prepare;
end;

//AL_133
procedure TDMRendaVariavel.qryBuscaFlgReprocBeforeOpen(DataSet: TDataSet);
begin
   if not qryBuscaFlgReproc.Prepared then
      qryBuscaFlgReproc.Prepare;
end;

end.
