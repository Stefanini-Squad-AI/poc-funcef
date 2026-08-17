//******************************************************************************
// Rotina     : EfetuaOperacoesRetro
// SOL        : 166338.6801
// Kintana    : 1451970
// Data       : 01/11/2011
// Responsável: Otacilio aquino
// Descrição  : Permitir mais de uma integralização para o mesmo fundo e na
//              mesma data
//******************************************************************************
// Rotina     : AlimentaFundo
// SOL        : 105440
// Kintana    : 471896
// Data       : 07/01/2009
// Responsável: Ricardo Cristiano
// Motivo     : Acerto na crítica de entrada para a rotina PesqAplicMesmoDia,
//               essa faz a unificação de certificados com data de aplicação
//               igual. Para operação de transferências -107 e -108 não é
//               preciso fazer a unificação, a mesma já é efetudado no momento
//               da gravação do histórico. 
//******************************************************************************
// Rotina     : AtualizaSaldoFundos
// SOL        : 103947
// Kintana    : 464524
// Data       : 18/12/2008
// Responsável: Ricardo Cristiano
// Motivo     : Retirado o tratamento de verificar se o registro é TRP, para fazer
//               atualização no mesmo dia
//******************************************************************************
// Rotina     : GravaOperacaoFundo
// SOL        : 100716 
// Kintana    : 447117
// Data       : 09/12/2008
// Responsável: Ricardo Cristiano
// Motivo     : Implementação para gravar o campo DATAVENCIMENTO com a data de
//              aplicação do certificado que sofreu transferência
//******************************************************************************
// Rotina     : MontaBuscaTransfLote / AtualizaAplicacaoHistFundo / AlimentaFundo /
//              AtualizaResgateHistFundo / TransfFundoLote / MontaBuscaTransfLote / 
//              MontaBuscaSaldo / VerificaTranferenciaPlanos / Reprocessamento / 
//              PesqAplicTransf
// SOL        : 100716
// Kintana    : 447117        
// Data       : 04/12/2008
// Responsável: Ricardo Cristiano
// Motivo     : Implementação na Transferência entre Planos em Lote para realizar 
//               operações de baixa e acréscimo no mesmo plano.   
//******************************************************************************
// Rotina     : TransfCotaIntegr / PesqAplicIntegr
// SOL        : 102784
// Kintana    : 457223
// Data       : 02/12/2008
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para buscar apenas o último registro atualizado. 
//               Para a funcionalidade de grupamento fazer a soma com o registro
//               de Transferência
//******************************************************************************
// Rotina     : TransfCotaIntegr / PesqAplicIntegr
// SOL        : 99876
// Kintana    : 441255  
// Data       : 28/11/2008  
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para unificar as subscrições quando ocorrer a operação 
//              de transferência entre planos
//******************************************************************************
// Rotina     : TransfTipoFundo
// SOL        : 99367
// Kintana    : 435730 
// Data       : 28/10/2008    
// Responsável: Ricardo Cristiano
// Descrição  : Implementação da rotina de transferência entre tipo de fundos.
//               Para contemplar a necessidade criar os registros "ATU" e em seguida
//               os "TRT". 
//******************************************************************************
// Rotina     : PesqAplicTransf
// SOL        : 98279
// Kintana    : 428095
// Data       : 13/10/2008  
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para não somar o tipo de operação -107(ref. a baixa).
//               Hoje é mantido o -107 e a patir dele é feito o novo saldo. 
//******************************************************************************
// Rotina     : AtualizaSaldoFundos/ListaAtuAplicacoes
// SOL        : 90557
// Kintana    : 381274
// Data       : 15/07/2008  
// Responsável: Carlos Gava
// Descrição  : Ajuste na atualizando os saldos para buscar a data a maior data 
//               bloqueada na Contabilidade útil anterior.
//******************************************************************************
// Data      : 24/06/2008
// Código    : AL_209
// Pendencia : 28070
// SOL       : 87276
// Desc      : Implementação de ajuste na rotina de apuração de variação e custo para
//              não duplicar o contábil. E só entrar na rotina de IOF se o Fundo for de RF(idtipoinvest = 5).
//******************************************************************************
// Data      : 11/03/2008
// Código    : AL_208
// Pendencia : 27558
// SOL       : 80579
// Desc      : Ajuste para desfazer a implementação de não deixar residuos em
//               resgates de fundos de investimentos quando o saldo remanescente
//               for menor que 1 cota.
//******************************************************************************
// Data      : 10/01/2008
// Código    : AL_207
// Pendencia : 26743
// SOL       :
// Desc      : Função que verifica se existem transferências entre Planos
//             posteriores ao lançamento da operação
//******************************************************************************
// Data      : 24/01/2007
// Código    : AL_206
// Pendencia : 26562
// SOL       : 70938
// Desc      : Implementação na rotina "MontaBuscaTransfLote" para tratar o lote quando
//              estiver em branco, devido a operação de transf. não ser por lote.
//******************************************************************************
// Data	     : 17/01/2008
// Codigo    : AL_205
// Pendência : 26744
// SOL       : 71043
// Desc      : Implementação do controle de processos para os fundos do tipo FMI
//******************************************************************************
// Data      : 16/01/2007
// Código    : AL_204
// Pendencia : 26562
// SOL       : 70938
// Desc      : Implementação na rotina "PesqAplicTransf" para não o registro de
//              transferência com o de atualização na variação. Evitando a duplicidade de valor.
//******************************************************************************
// Data      : 11/01/2007
// Código    : AL_203
// Pendencia : 26562
// SOL       : 70938
// Desc      : Implementação de ajustes para a operação de transferência entre lotes e
//             otimização de rotinas
//******************************************************************************
// Data      : 07/01/2007
// Código    : AL_199
// Pendencia : 26743
// Desc      : Implementação de ajustes na rotina de reprocessamento da operação
//             de transferência entre lotes
//******************************************************************************
// Data      : 19/12/2007
// Código    : AL_198
// Pendencia : 26743
// Desc      : Transferência entre Lotes
//******************************************************************************
// Data     : 23/08/2007
// Código   : AL_197
// Motivo   : Otimização da rotina de variação contábil. E formação de uma rotina
//            unica para todos os tipos de fundos. Retirada a query "QryVariacaoFundosRendaVar"
//******************************************************************************
// Data     : 22/08/2007
// Código   : AL_196
// Motivo   : Implementação da procedure ListaAtuAplicacoes com otimização do SQL
//******************************************************************************
// Data     : 22/08/2007
// Código   : AL_195
// Motivo   : Implementação da procedure ListaSaldoFundo e atualização da rotina BuscaSaldoFundo(
//******************************************************************************
// Data     : 22/08/2007
// Código   : AL_194
// Pendencia: 25706
// Motivo   : Implementações da crítica na BuscaSaldoFundo para verificar o saldo bloqueado
//            gerados em função da funcionalidade de Penhora e outros.
//******************************************************************************
// Data      : 02/10/2007
// Código    : AL_193
// Pendencia : 26386
// Desc      : Atulizando a chamada CtrlInvContab.BuscaPadrLanc.Executa
//             incluindo o Plano/Patro
//******************************************************************************
// Data      : 17/08/2007
// Código    : AL_192
// Pendencia : 25761
// SOL       : 63520 / 63519
// Desc      : Implementação para verificar a parametrização do IOF no momento da integralização
//******************************************************************************
// Data      : 09/08/2007
// Código    : AL_191
// Pendencia : 25761
// SOL       : 63520 / 63519
// Desc      : Implementação da flag que trata a provisão de IR e IOF no momento do resgate
//******************************************************************************
// Data      : 01/08/2007
// Código    : AL_190
// Pendencia : 25761
// SOL       : 63520 / 63519
// Desc      : Implementação do resgate para pagamento de iof(contabilização).
//******************************************************************************
// Data      : 12/07/2007
// Código    : AL_189
// Pendencia : 25671
// SOL       : 61747
// Motivo    : Nos locais de chamada da rotina ContabilizacaoFinanceiro( não estava
//             sendo passado o idplanoprev e o idpatro
//******************************************************************************
// Data      : 29/06/2007
// Código    : AL_188
// Pendencia : 24957
// SOL       : 56201
// Desc      : Criação da MontaMascaraDecQtdHist para utilizar os parâmetros de
//             acordo com a HistfundoInvest
//             Criação da MontaMascaraDecVlrdHist para utilizar os parâmetros de
//             acordo com a HistfundoInvest
//******************************************************************************
// Data      : 27/06/2007
// Código    : AL_187
// Pendencia : 25594
// SOL       : 56257
// Motivo    : Implementação de ajuste no custo histórico para as operações de
//             Amortização de Cotas
//******************************************************************************
// Data      : 31/01/2007
// Código    : AL_186
// Pendencia : 23705
// SOL       : 40671
// Desc      : Acerto na rotina IntegraPenhoraJuridico
//******************************************************************************
// Data      : 28/05/2007
// Código    : AL_185
// Motivo    : Implementação da exclusão das operações de resgate da
//             OPERINVXOPERFDO(Resgate de Fundos de Investimento com Compra de Ações)
//******************************************************************************
// Data      : 22/05/2007
// Código    : AL_184
// Pendencia : 24775
// SOL       : 55880
// Motivo    : Implementação da funcionalidade CtrlInvContab.IntegraCtbFinModulo
//             para controlar a integração do módulo de
//             Fundos de Investimentos do Módulo Contábil e Financeiro sem
//             alterar os parametros existentes.
//******************************************************************************
// Data      : 15/05/2007
// Código    : Al_183
// Motivo    : Implementação para lançar na histfundo o resgate a cotizar com a
//             data da cotização, não mais com a data da operação.
//******************************************************************************
// Data      : 15/05/2007
// Código    : Al_182
// Motivo    : Implementação para lançar na histfundo a aplicação a cotizar com a
//             data da cotização, não mais com a data da operação.
//******************************************************************************
// Data      : 18/04/2007
// Código    : Al_181
// Pendencia : 25065
// SOL       : 58083
// Motivo    : Inversão dos parâmetros da conta de baixa que estavam investidas
//******************************************************************************
// Data      : 18/04/2007
// Código    : Al_180
// Motivo    : Implementação para fechar as query's
//******************************************************************************
// Data      : 18/04/2007
// Código    : Al_179
// Motivo    : Implementação na rotina "CotizaResgate", para finalizar as query's,
//             mostrar mensagens e simplificação de código
//******************************************************************************
// Data      : 18/04/2007
// Código    : AL_178
// Motivo    : Implementação na rotina "CotizaAplicacao", para tratar também as
//             aplicações a cotizar, finalizar as query's, mostrar mensagens e
//             simplificação de código
//******************************************************************************
// Data      : 18/04/2007
// Código    : AL_177
// Motivo    : Implementação da exclusão dos registros do resgate a cotizar na
//             tabela "operacaofundo" que serviu para calcular a variação e o
//             custo contabilizado no lançamento
//******************************************************************************
// Data      : 17/04/2007
// Código    : Al_176
// Pendencia : 25071
// SOL       : 58166
// Motivo    : Implementação de ajustes em consequência da separação da rotina de
//             unificação de aplicações(PesqAplicMesmoDia) da alimentafundo
//******************************************************************************
// Código    : Al_175
// Pendencia : 25071
// SOL       : 58166
// Motivo    : Implementação da separação da rotina de unificação de
//             aplicações(PesqAplicMesmoDia) da alimentafundo
//******************************************************************************
// Código    : AL_174
// Motivo    : Acerto no retorno de mensagem da ContabilizaAtualizacao
//******************************************************************************
// Data      : 05/04/2007
// Código    : AL_173
// Motivo    : Ajuste para excluir as planilha de origem ao iniciar o Reprocessamento
//******************************************************************************
// Data      : 03/04/2007
// Código    : AL_172
// Pendencia : 25003
// SOL       : 57277
// Motivo    : Atualização e ajustes na rotina de cotização de resgates, devido a
//             utilização no reprocessamento
//******************************************************************************
// Data      : 26/03/2007
// Código    : AL_171
// Pendencia : 24775
// SOL       : 55880
// Motivo    : Acerto no Carregamento da iPlano qdo não tem Financeiro
//******************************************************************************
// Data      : 22/03/2007
// Código    : AL_170
// Pendencia : 24843
// Motivo    : Implementação das rotinas de aplicação e resgate a cotizar no
//             reprocessamento.
//******************************************************************************
// Data      : 21/03/2007
// Código    : AL_169
// Pendencia : 24839
// SOL       : 56244
// Motivo    : Acerto no reprocessamento após transf. de Planos
//******************************************************************************
// Data      : 20/03/2007
// Código    : AL_168
// Pendencia : 24774
// SOL       : 55877
// Desc      : Liga/Desliga a integração contabil financeira por módulo
//******************************************************************************
// Data      : 19/03/2007
// Código    : AL_167
// Pendencia : 24775
// SOL       : 55880
// Motivo    : Implementação da funcionalidade para controlar a integração do módulo de
//             Fundos de Investimentos do Módulo Contábil e Financeiro sem
//             alterar os parametros existentes.
//******************************************************************************
// Data      : 14/03/2007
// Código    : AL_166
// Pendencia : 24658
// SOL       : 55067
// Motivo    : Implementação do fechto das query´s(QryAtuHistCotaInteg e qryCotaIntegrFundo)
//             determinando o dmfundocomum e com a função OperComum.LimpaParametros.
//******************************************************************************
// Data      : 14/03/2007
// Código    : AL_165
// Pendencia : 24658
// SOL       : 55067
// Motivo    : Implementação da verificação do "TIPMOVCOTAINTEGR = 'TRP'" para
//             atualização da variação de cotas a integralizar
//******************************************************************************
// Data      : 08/03/2007
// Código    : AL_164
// Pendencia : 24689
// SOL       : 55325
// Desc      : Acerto na passagem de parâmetro de CC e CCI
//******************************************************************************
// Data      : 02/02/2007
// Código    : AL_163
// Pendencia : 22229
// Motivo    : Ajuste na rotina de bloqueio/desbloqueio de cotas, implementado o
//             tratamento para desbloqueio separado do bloqueio
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_162
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento da rotina AlimentaFundo
//             Criado um parametro novo com variável de retorno da mensagem
//******************************************************************************
// Data      : 31/01/2007
// Código    : AL_161
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação de Controls para gravação a Integração de Bloqueio
//             de Penhora com o Jurídico
//******************************************************************************
// Data      : 16/01/2007
// Código    : AL_160
// Pendencia : 22229
// Motivo    : Implementação do desbloqueio de cotas
//******************************************************************************
// Data      : 20/12/2006
// Código    : AL_159
// Motivo    : Implementada da alteração do tipo de parametro de datetime para string(QryPedidoFundosRetr)
//******************************************************************************
// Data      : 22/12/2006
// Código    : AL_158
// Pendencia : 23674
// SOL       : 47946
// Desc      : Segregação de Recursos
//             Exclusão de do Documentos
//******************************************************************************
// Data      : 05/12/2006
// Código    : AL_157
// Pendencia : 23674
// SOL       : 47946
// Desc      : Segregação de Recursos
//******************************************************************************
// Data      : 19/12/2006
// Código    : AL_156
// Motivo    : Implementada a limpeza do filtro na QryAtuAplicacoes antes de abrir
//******************************************************************************
// Data      : 13/12/2006
// Código    : AL_155
// Motivo    : Alterado o parametro "TIPOOPERACAO" para "IDTIPOOPERACAO" na
//             query "QryBuscaTipoOper".
//******************************************************************************
// Data      : 12/12/2006
// Código    : AL_154
// Pendencia : 23954
// Motivo    : Implementação na buscar da aplicação origem também por tipo de cota
//******************************************************************************
// Data      : 11/12/2006
// Código    : AL_153
// Pendencia : 23954
// Motivo    : Ajustes nas query(passagem de parametros, abertura e fechamento)
//             (QryVariacaoFundosRendaVar, QryVariacaoFundos, QryTipoFundos, QryPatroPlanPrevContab,
//              QryAtuAplicacoes, QryBuscaIofAnterior, QryPlanoPrevContabil, QryAplPgtoIR, QryVlrCota)
//******************************************************************************
// Data      : 11/12/2006
// Código    : AL_152
// Pendencia : 23954
// Motivo    : Implementação para buscar na parametrização contábil por tipo de titulo
//******************************************************************************
// Data      : 08/12/2006
// Código    : AL_151
// Motivo    : Implementação de ajuste que verifica o tipo de fundo
//******************************************************************************
// Data      : 01/12/2006
// Código    : AL_150
// Pendencia : 23349
// Motivo    : Implementação da rotina de unificação das transferência entre planos,
//             no momento do reprocessamento.
//******************************************************************************
// Data      : 20/11/2006
// Código    : AL_149
// Pendencia : 23349/23779
// Motivo    : Implementação da transferência entre Tipos de Fundo.
//******************************************************************************
// Data      : 20/11/2006
// Código    : AL_148
// Motivo    : Alterado o momento da deleção de histório e retirado a alteração
//             de planilha. Devido a funcionalidade de exclusão contabil, não excluir
//             a planilha.
//******************************************************************************
// Data      : 03/11/2006
// Código    : AL_147
// Pendencia : 22781
// Motivo    : Implementação para transferência entre plano funcionar para "n" planos
//******************************************************************************
// Data      : 08/09/2006
// Código    : AL_146
// Motivo    : Implementação do controle de processos para os fundos do tipo FIP
//******************************************************************************
// Data      : 05/09/2006
// Código    : AL_145
// Pendencia : 22781
// Motivo    : Implementação para tartar o tipo invest igual a 10, tipo de fundo FIP
//******************************************************************************
// Data      : 30/08/2006
// Código    : AL_144
// Pendencia : 22781
// Motivo    : Retirada a funcionalidade de transferencia entre planos
//******************************************************************************
// Data      : 30/08/2006
// Código    : AL_143
// Pendencia : 22781
// Motivo    : Implementação do processo de apuração de variação de saldo para o
//             tipo de fundo FIP
//******************************************************************************
// Data      : 30/08/2006
// Código    : AL_142
// Pendencia : 22781
// Motivo    : Retirado o processo de exclusão das operacoes de TRC entre Planos
//******************************************************************************
// Data      : 21/08/2006
// Código    : AL_141
// Pendencia : 22946
// SOL       : 45112
// Motivo    : Implementação do Fundo de Inv. em Participação
//******************************************************************************
// Data      : 02/08/2006
// Código    : AL_140
// Pendencia : 22781
// Motivo    : Implementação Tranf. entre Fundos(-38 e -40) na rotina de gravação
//             da aplicação
//******************************************************************************
// Data      : 31/07/2006
// Código    : AL_139
// Pendencia : 22781
// Motivo    : Implementação da gravação do idlote na QryInsertOperacaoFundo
//******************************************************************************
// Data      : 27/07/2006
// Código    : AL_138
// Motivo    : Alterada a rotina "ExcluiMovimento" para especificar a operação que
//             deseja excluir, com a implementação de passagem de parametros
//******************************************************************************
// Data      : 26/07/2006
// Código    : AL_137
// Motivo    : A exclusão dos historicos de fundos foi retirada devido ao
//             reprocessamento do fundo executar a atualização apenas de um fundo
//******************************************************************************
// Data      : 24/07/2006
// Código    : AL_136
// Motivo    : Alteração na rotina ProcExcluiFundo para buscar apenas os registros
//             que são passados os codigos(planilha e documento)
//******************************************************************************
// Data      : 24/07/2006
// Código    : AL_135
// Motivo    : Implementação no exception as mensagens
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_134
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 20/06/2006
// Código    : AL_132
// Pendencia : 22601
// SOL       : 44102
// Motivo    : Implementação nas funcionalidades do resgate, para essa ser efetuada
//             com data de cotização menor que a data de operação. Sem prejudicar o
//             resgate com data de cotização igual a da operação
//******************************************************************************
// Data      : 20/06/2006
// Código    : AL_131
// Motivo    : Ajuste na mensagem da busca da Cota de cotização
//******************************************************************************
// Data      : 19/06/2006
// Código    : AL_130
// Pendencia : 22589
// SOL       : 44014
// Motivo    : Inclusão dos campos VLRIOF e VLRIR na funcionalidade AlimentaFundo
//******************************************************************************
// Data      : 14/06/2006
// Código    : AL_129
// Pendencia : 22589
// SOL       : 44014
// Motivo    : Inclusão da variavel fVlrIOF na função ContabilizacaoFinanceiro
//             para ser integralizada
//******************************************************************************
// Data      : 12/06/2006
// Código    : AL_128
// Motivo    : Implementação do plano e patrocinadora para a rotina contabilização,
//             devido a transferência entre planos
//******************************************************************************
// Data      : 12/06/2006
// Código    : Al_127
// Motivo    : Acerto na rotina de integralização de cotas, não estava passando o
//             tipo de cota para fundos de FIDC
//******************************************************************************
// Data      : 30/05/2006
// Código    : Al_126
// Motivo    : Retirada de variaveis na rotina de bloqueio de cotas
//******************************************************************************
// Data      : 30/05/2006
// Código    : Al_125
// Motivo    : Retirada de variaveis não utilizadas na trasf. de planos.
//             Implementação de variaveis(dDataUltPGIR, fCotaAplic, iOperOrigem) e
//             tratamento desses na rotina
//******************************************************************************
// Data      : 30/05/2006
// Código    : Al_124
// Motivo    : Alterada a posição da efetuação da operação de transf. de planos
//******************************************************************************
// Data      : 30/05/2006
// Código    : Al_123
// Motivo    : Ajuste no retorna das  funcionalidades e mensagens.
//******************************************************************************
// Data      : 30/05/2006
// Código    : Al_122
// Motivo    : Acerto na passagem dos parametros conforme a funcionalidade
//******************************************************************************
// Data      : 30/05/2006
// Código    : Al_121
// Motivo    : Alterada a posição da busca da cota no ajuste de certificado.
//******************************************************************************
// Data      : 30/05/2006
// Código    : Al_120
// Motivo    : Implementação do custo atual no ajuste do certificado
//******************************************************************************
// Data      : 25/05/2006
// Código    : Al_119
// Motivo    : Ajuste na rotina de tranferencia entre planos, extamente na identificação do plano
//******************************************************************************
// Data      : 23/05/2006
// Código    : Al_118
// Motivo    : Otimização da Rotina ExcluiResgate e ProcExcluiFundo
//******************************************************************************
// Data      : 22/05/2006
// Código    : Al_117
// Motivo    : Melhora de performance das querys
//******************************************************************************
// Data      : 22/05/2006
// Código    : AL_116
// Motivo    : Implementação da unificação de resgate novo e antigo
//******************************************************************************
// Data      : 27/04/2006
// Código    : AL_115
// Motivo    : Otimização de rotinas e ajuste e padronização de mensagens
//******************************************************************************
// Data      : 19/04/2006
// Código    : AL_114
// Motivo    : Ajuste no reprocessamento do ajuste de certificado, levando em consideração a
//             quantidade x cotação no dia
//******************************************************************************
// Data      : 18/04/2006
// Código    : AL_113
// Motivo    : Ajuste no reprocessamento do acerto de certificado retroativo, para buscar a
//             a aplicação correta.
//******************************************************************************
// Data      : 12/04/2006
// Código    : AL_112
// Motivo    : Implementação da contabilização da conta invest(CC ou CCI) para operação
//             de amortização
//******************************************************************************
// Data      : 11/04/2006
// Código    : AL_111
// Motivo    : Acerto na passagem do paramentro sCentroCustoCred da Rateio.Inserir
//******************************************************************************
// Data      : 11/04/2006
// Código    : AL_110
// Motivo    : Acerto na passagem de Parametros que estava passando IDTIPOINVEST
//             ao invés de IDPLANPREVCTBPATR
//******************************************************************************
// Data      : 05/04/2006
// Código    : AL_109
// Motivo    : Simplificação da rotina UltimoDiaMes e desativação em alguns testes
//******************************************************************************
// Data      : 05/04/2006
// Código    : AL_108
// Motivo    : Ajuste na rotina de resgate retroativo para efetuar os que estão vinculados
//             a composição dos fundos FAC
//******************************************************************************
// Data      : 03/04/2006
// Código    : AL_107
// Motivo    : Retirada variaveis que não estão em uso pela rotina
//******************************************************************************
// Data      : 21/03/2006
// Código    : AL_106
// Motivo    : Implementada a verificação da variavel que controla a abertura de
//             processo do fundo por tipo de fundo, para quando voltar vazia dar
//             continuidade.
//******************************************************************************
// Data      : 21/03/2006
// Código    : AL_105
// Motivo    : Implementação da verificação da data de inicialização do fundo, para
//             não contabilizar a variação no mesmo dia de uma operação(saldo inicial)
//******************************************************************************
// Data      : 15/03/2006
// Código    : AL_104
// Motivo    : Não há variavel para identificar se o fundo esta em abertura na paraminvest
//******************************************************************************
// Data      : 09/03/2005
// Código    : AL_103
// Motivo    : Duplicidade na lanctodocum para fundos de ações
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_102
// Motivo    : Implementação da trava de atualização do fundo no momento do reprocessamento.
//******************************************************************************
// Data      : 18/01/2005
// Código    : AL_101
// Motivo    : Implementação da gravação da data de ultimo fechamento no fim do processo
//             de cada dia quando for a atualização de vários fundos.
//******************************************************************************
// Data      : 04/01/2005
// Código    : AL_100
// Motivo    : O tipo de operação e natureza devem estar na mesma condição,
//             por isso foi unificado. Meramente para entendimento.
//******************************************************************************
// Data      : 04/01/2005
// Código    : AL_99
// SOL       : 39360
// Motivo    : A critica volto devido a parametrização contabil do tipo de rubrica não estar
//             cadastrado.
//             (O reprocessamento da amortização de cotas estava com a restrinção de
//              contabilizar somente a operação de amortização a receber(-143).
//              A critica foi comentada.)
//******************************************************************************
// Data      : 02/01/2005
// Código    : AL_98
// SOL       : 39360
// Motivo    : O reprocessamento da amortização de cotas estava com a restrinção de
//             contabilizar somente a operação de amortização a receber(-143).
//             A critica foi comentada.
//******************************************************************************
// Data     : 12/12/2005
// Código   : AL_97
// Motivo   : Implementação do tratamento de saldo sintetico conforme a susbcrição
//******************************************************************************
// Data     : 25/11/2005
// Linha(s) : Al_96
// Motivo   : Implementação para atualizar o saldo a integralizar independente da data do fluxo de cotas
//******************************************************************************
// Data     : 17/11/2005
// Linha(s) : Al_95
// Motivo   : Implementação do valor para fazer apenas na amortização a receber
//******************************************************************************
// Data     : 18/11/2005
// Linha(s) : Al_94
// Motivo   : Implementação da descrição do tipo de operação e natureza no ajuste de certificado
//******************************************************************************
// Data     : 17/11/2005
// Linha(s) : Al_93
//******************************************************************************
// Data     : 27/10/2005
// Linha(s) : Al_92
// Motivo   : Implementação da atualização da integralização de cotas por difereça
//            de cota cadatrada e de operação.
//******************************************************************************
// Data     : 27/10/2005
// Linha(s) : Al_91
// Motivo   : Implementado a busca do planoprev e do patrocinador e retirado o caribo
//            de contabil e financeiro na HistFundo da operação de Integralização
//******************************************************************************
// Data     : 27/10/2005
// Linha(s) : Al_90
// Motivo   : Retirada a funcionalidade de atualização de coddocumento e plncodigo da integralização de cotas
//            na histfundo, devido essa ter passada a ser feita na operacaofundo.
//******************************************************************************
// Data     : 26/10/2005
// Linha(s) : Al_89
// Motivo   : Retirada a funcionalidade, não está sendo utilização
//******************************************************************************
// Data     : 24/10/2005
// Linha(s) : Al_88
// Motivo   : Implementação da rotina Bloqueio de Cotas retroativo
//******************************************************************************
// Data     : 20/10/2005
// Linha(s) : Al_87
// Motivo   : Implementação para tratar operaçöes com bloqueio de cotas
//******************************************************************************
// Data     : 20/10/2005
// Linha(s) : Al_86
// Motivo   : Implementação da rotina Bloqueio de Cotas
//******************************************************************************
// Data     : 03/10/2005
// Linha(s) : Al_85
// Motivo   : Implementação para buscar a mesma planilha
//******************************************************************************
// Data     : 03/10/2005
// Linha(s) : Al_84
// Motivo   : Retirada a critica, para gravar a lanctodocum
//******************************************************************************
// Data     : 30/09/2005
// Linha(s) : Al_83
// Motivo   : Acerto para não gerar lanctodocum no reprocessamento
//******************************************************************************
// Data     : 29/09/2005
// Linha(s) : Al_82
// Motivo   : Implementação do tratamento das variaveis iplano, iplanilha e icoddocumento
//******************************************************************************
// Data     : 21/09/2005
// Linha(s) : Al_81
// Motivo   : Implementação da exclusão contabil da amortização e lançamento contábil da operação
//******************************************************************************
// Data     : 20/09/2005
// Linha(s) : Al_80
// Motivo   : Implementação da duplicação da contabilização para atualização de cotas a integralizar - Ativo
//******************************************************************************
// Data     : 06/09/2005
// Linha(s) : Al_79
// Motivo   : Implementação do tratamento de float para string, levando o valor em branco para zero
//******************************************************************************
// Data     : 02/09/2005
// Linha(s) : Al_78
// Motivo   : Implementação da variação no cancelamento de cotas.s
//******************************************************************************
// Data     : 15/08/2005
// Linha(s) : Al_77
// Motivo   : Implementação do reprocessamento da Susbcrição do Fluxo de Cotas(SubscricaoCotasIntegRetr)
//******************************************************************************
// Data     : 15/08/2005
// Linha(s) : Al_76
// Motivo   : Implementação do reprocessamento da Integralização de Cotas para os Fundos de FDC
//******************************************************************************
// Data     : 15/08/2005
// Linha(s) : Al_75
// Motivo   : Implementação do reprocessamento do Fluxo de Cotas(FluxoCotasIntegRetr)
//******************************************************************************
// Data     : 11/08/2005
// Linha(s) : Al_74
// Motivo   : Ajuste na ordem de abertura e exclusão do reprocessamento. E implementação
//            do tratamento de Subscrição e Integralização
//******************************************************************************
// Data     : 11/08/2005
// Linha(s) : Al_73
// Motivo   : Ajuste no tamanho do progressbar
//******************************************************************************
// Data     : 11/08/2005
// Linha(s) : Al_72
// Motivo   : Ajuste no tratamento de transação e commit
//******************************************************************************
// Data     : 11/08/2005
// Linha(s) : Al_71
// Motivo   : Retirado o progress para rotinas pouco usada e melhora no tratamento
//            de messagens e saida da rotina
//******************************************************************************
// Data     : 11/08/2005
// Linha(s) : Al_70
// Motivo   : Ajuste em toda a rotina.
//******************************************************************************
// Data     : 11/08/2005
// Linha(s) : Al_69
// Motivo   : Alterado a rotina para gravar mais campos da tabela.
//******************************************************************************
// Data     : 11/08/2005
// Linha(s) : Al_68
// Motivo   : Alterado o nome da rotina de Subscrição para Integralização de Cotas que é o correto
//******************************************************************************
// Data     : 11/08/2005
// Linha(s) : Al_67
// Motivo   : Ajuste em toda a rotina.
//******************************************************************************
// Data     : 02/08/2005
// Linha(s) : Al_66
// Motivo   : Implementação de tratamento para da variação de subscrição ou integralização de cotas
//******************************************************************************
// Data     : 27/07/2005
// Linha(s) : Al_65
// Motivo   : Implementado da função de de atualização gravação de histórico e contabilização da variação
//******************************************************************************
// Data     : 27/07/2005
// Linha(s) : Al_64
// Motivo   : Implementado da função de gravação de histórico de integralização de cotas
//******************************************************************************
// Data     : 25/07/2005
// Código   : Al_63
// Motivo   : Implementação o acrescimo dos fundos de Ações e FIDC e o ordenamento
//            da seleção do sql. Retirado o comentario das mensagens e o abort do except.
//******************************************************************************
// Data     : 22/06/2005
// Código   : Al_62
// Motivo   : Implementado TipoTitulo FRFIP - Fundo de Inv. em Participação
//******************************************************************************
// Data     : 15/06/2005
// Linha(s) : Al_61
// Motivo   : Implementado o parametro IDPEDIDOFUNDO na query "qryConfirmação"
//******************************************************************************
//Data	    : 08/06/2005
//Código    : Al_60
//Motivo(S) : O tipo de resgate passa a receber o valor passado pela a origem do processo, senão
//            fica zerado e busca o saldo total
//******************************************************************************
//Data	    : 25/05/2005
//Código    : Al_59
//Motivo(S) : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
//Data	    : 31/05/2005
//Código    : Al_58
//Motivo(S) : Retirado o try para receber o tratamento direto da funcionalidade
//******************************************************************************
//Data	    : 31/05/2005
//Código    : Al_57
//Motivo(S) : Retirado o abort e implementado o result e exit
//******************************************************************************
//Data	    : 31/05/2005
//Código    : Al_56
//Motivo(S) : Implementação conta investimento
//******************************************************************************
//Data	    : 18/05/2005
//Código    : Al_55
//Motivo(S) : Implementação da busca do tipo de despesa por operação e tipo de investimento
//******************************************************************************
//Data	    : 18/05/2005
//Código    : Al_54
//Motivo(S) : Implementação do teste de rubrica para operações compostas pela mesma
//******************************************************************************
//Data	    : 03/05/2005
//Código    : Al_53
//Motivo(S) : O campo iFundo foi alterado para iTipoInvest, pois não era ultilizado na função.
//            O parametro iTipoInvest e passado para busca da descrição do tipo de operacação
//******************************************************************************
//Data	    : 03/05/2005
//Código    : Al_52
//Motivo(S) : Implementada rotina para busca da descrição da operação, assim compondo o historico
//******************************************************************************
//Data	    : 02/05/2005
//Código    : Al_51
//Motivo(S) : Implamentado o nome do Plano
//******************************************************************************
//Data	    : 29/04/2005
//Código    : Al_50
//Motivo(S) : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
//Data	    : 29/04/2005
//Código    : Al_49
//Motivo(S) : Implementado a varivel de historico contabil e ajustando o historico a ser garavdo
//******************************************************************************
//Data	    : 28/04/2005
//Código    : Al_48
//Motivo(S) : Retirado por não ter utilidade na rotina
//******************************************************************************
//Data	    : 12/04/2005
//Código    : Al_48
//Motivo(S) : Acerto na função RecebimentosRetr para não gerar contábil no Reprocessamento.
//******************************************************************************
//Data	    : 24/03/2005
//Código    : Al_47
//Motivo(S) : Implementação devido a data da cotização não estar preenchida
//******************************************************************************
//Data	    : 23/03/2005
//Código    : Al_46
//Motivo(S) : Ajuste nas mensagens do módulo
//******************************************************************************
//Data	    : 23/03/2005
//Código    : Al_45
//Motivo(S) : Retirada critica para variação de Fundos de Ações, agora a variação é igual p/todos
//******************************************************************************
//Data	    : 02/03/2005
//Código    : Al_44
//Motivo(S) : Alterada o prazo limite para 60 dias para zerar a cota do Cart. Gerencial
//******************************************************************************
// Data     : 25/02/2005
// Linha    : AL_43
// Descrição: Acerto na comparação da cota da operação com a cota cadastrada
//******************************************************************************
// Data     : 23/02/2005
// Linha    : AL_42
// Descrição: Implementação do tratamento da data de cotização para busca do saldo no dia
//******************************************************************************
// Data     : 23/02/2005
// Linha    : AL_41
// Descrição: Implementação da atualização de variação, prov. de ir e de iof p/ Fundos de Ações
//******************************************************************************
// Data     : 23/02/2005
// Linha    : AL_40
// Descrição: Alterada a Rotina de gravação de 2 aplicações no mesmo dia p/ gravar cota no histórico
//******************************************************************************
// Data     : 18/02/2005
// Linha    : AL_39
// Descrição: Incluido o tipo -34 no reprocessamento
//******************************************************************************
// Data     : 16/02/2005
// Linha    : AL_38
// Descrição: Incluído no if a variável bContab, pois só contabiliza se estiver marcado no parâmetro
//******************************************************************************
// Data     : 15/02/2005
// Linha    : AL_37
// Descrição: Implementação para permitir mais de uma aplicação no mesmo dia.
//******************************************************************************
// Data     : 03/02/2005
// Linha    : AL_36
// Descrição: Alterado FVACA para FRVAR.
//******************************************************************************
// Data     : 26/01/2005
// Linha    : Alt_35
// Descrição: Implementação da diferença tolerada de saldo no resgate
//******************************************************************************
// Data     : 17/01/2005
// Função   : BloqueiaOperacaoSeAbertura
// Linha    : Alt_34
// Descrição: Verifica se há processamento de algum Fundo de Investimento
//******************************************************************************
// Data     : 17/01/2005
// Linha    : Alt_33
// Descrição: Inclusão da Rotina ZeraCotaCartGerencRF - Zerar cota dos fundos de rf quando
//            reprocessar.
//******************************************************************************
// Data     : 04/01/2005
// Linha    : Alt_32
// Descrição: Incluída uma crítica para tolerar diferença no resgate do fundo.
//******************************************************************************
// Data     : 04/01/2005
// Função   : AjusteRetro
// Linha    : ALt_31
// Descrição: Implementado o tratamento de null para o PLANO e PLNCODIGO
//******************************************************************************
// Data     : 04/01/2005
// Função   : AjusteRetro
// Linha    : ALt_30
// Descrição: Implementado a condição de > 0 para iPlano e iTipoCota
//******************************************************************************
// Data     : 04/01/2005
// Função   : ResgateRetro
// Linha    : ALt_29
// Descrição: retirada a condição de DataAplicacao para o resgate novo - CCI
//******************************************************************************
// Data     : 08/12/2004
// Função   : GravaEmAbertura
// Linha    : Alt_28
// Descrição: Função de retorno booleano que recebe o ID do Tipo de Fundo de
//            Investimento e flag do tipo String e grava na Tabela PARAMINVEST
//            quando o usuário entra e sai do processamento
//******************************************************************************
// Data     : 08/12/2004
// Função   : VerEmAbertura
// Linha    : Alt_28
// Descrição: Função que recebe o ID do Tipo de Fundo de Investimento, verifica
//            se o sistema está em processamento e retorna verdadeiro ou falso
//******************************************************************************
// Data     : 08/12/2004
// Função   : LocalizaCampoFundo
// Linha    : Alt_27
// Descrição: Função que recebe o ID do Tipo de Fundo de Investimento e retorna
//            a sigla do resto do campo localizado na tabela PARAMINVEST
//******************************************************************************
// Data     : 30/11/2004
// Linha(s) : Alt_26
// Motivo   : Acerto na ContabilizaOperFundos para qdo não encontra a PadrLancContInv da DOP
//******************************************************************************
// Data     : 17/11/2004
// Linha(s) : Alt_25
// Motivo   : Implementação da determinação da aplic. a ser resgatada conforme o
//            tipo de conta CCI
//******************************************************************************
// Data     : 08/11/2004
// Linha(s) : Alt_24
// Motivo   : Na query que busca o certificado a ser resgatado só pode ser passado
//            o parametro de DatadeAplicação para resgate novo. (Traz o certificado
//            desta data exata)
//******************************************************************************
// Data     : 03/11/2004
// Linha(s) : Alt_23
// Motivo   : Implementação do Finally e Except]
//******************************************************************************
// Data     : 29/10/2004
// Linha(s) : Alt_22
// Motivo   : Acerto no Reprocessamento de TRC Planos
//******************************************************************************
// Data     : 28/10/2004
// Linha(s) : Alt_21
// Motivo   : Acerto na QryBuscaAplOrigem para passar a data da aplicação
//******************************************************************************
// Data     : 28/10/2004
// Linha(s) : Alt_20
// Motivo   : Implementação de funcao TransfPlanosRetr para a funcao EfetuaOperacoesRetro
//            Criação campo VLRCUSTOATUAL na função BuscaSaldoFundo
//******************************************************************************
// Data     : 26/10/2004
// Linha(s) : Alt_19
// Motivo   : Implementação de valores para o campo VLRVARIACAO
//******************************************************************************
// Data     : 21/10/2004
// Linha(s) : Alt_18
// Motivo   : Alteração do nome da query QryDelOperacaoFundo para QryUpdOperacaoFundoFinContb
//            Alteração do nome da query QryHistFundo para QryDelHistFundo
//            Alteração do nome da query QryIrLitigio para QryDelIrLitigio
//******************************************************************************
// Data     : 19/10/2004
// Linha(s) : Alt_17
// Motivo   : Alterada o iPlanPrevCtbPatro para iiPlanPrevCtbPatro devido a variavel do sistema.
//******************************************************************************
// Data     : 19/10/2004
// Linha(s) : Alt_16
// Motivo   : Faltou a critica q retorna true e false( if not ...
//******************************************************************************
// Data     : 08/10/2004
// Linha(s) : Alt_15
// Motivo   : Retirada a função q verifica se o fundo foi atualizado no dia.
//******************************************************************************
// Data     : 07/10/2004
// Linha(s) : Alt_14
// Motivo   : Implementação da Data de Inicio de Processamento na funcao Reprocessamento
//            Implementação de calculo do VlrAplicado e VlrCusto proporcional par
//            Transf entre planos (-107 e -108) na função AtualizaResgateHistFundo
//            Implementacao do fSldVlrFundo na funcao AlimentaFundo
//******************************************************************************
// Data     : 27/09/2004
// Linha(s) : Alt_13
// Motivo   : Implementação de funcao RecebimentosRetr para a funcao EfetuaOperacoesRetro
//******************************************************************************
// Data     : 27/09/2004
// Linha(s) : Alt_13
// Motivo   : Passagem de Paramentro do IdOperacao para a função Reprocessamento
//            para poder tratar a exclusão de operações de TRC (-108)
//******************************************************************************
// Data     : 23/09/2004
// Linha(s) : Alt_12
// Motivo   : Tratamento para gravacao de NaturezaOper = R na AlimentaFundo
//******************************************************************************
// Data     : 23/09/2004
// Linha(s) : Alt_11
// Motivo   : Tratamento para IDOPERACAOORIGEM nulo na GravOperacaoFundo
//            AlimentaFundo parâmetro de fVlrAplicado,fValorCusto
//******************************************************************************
// Data     : 20/09/2004
// Linha(s) : Alt_12
// Motivo   : Inclusão da nova concepção para apuração de CPMF sobre as operações de
//            resgate
//******************************************************************************
// Data     : 14/09/2004
// Linha(s) : Alt_10
// Motivo   : Incluido o parâmetro IDPLANPREVCTBPATR na QryBuscaAplOrigem da funcao
//            AtualizaResgateHistFundo
//******************************************************************************
// Data     : 13/09/2004
// Linha(s) : Alt_9
// Motivo   : Incluido tratamento para aplicação de TIPOOPERACAO = -108 (Tranf. Entre Planos)
//******************************************************************************
// Data     : 25/08/2004
// Linha(s) : Alt_8
// Motivo   : Implementada a rotina de reprocessamento para Cancelamento de Subscrição de Cotas
//******************************************************************************
// Data     : 18/08/2004
// Linha(s) : Alt_7
// Motivo   : Implementado nos parâmetros a passagem do planprev correto, conforme o plano contabil
//******************************************************************************
// Data     : 17/08/2004
// Linha(s) : Alt_6
// Motivo   : Implementada a rotina de reprocessamento para Subscrição de Cotas
//******************************************************************************
// Data     : 16/08/2004
// Linha(s) : Alt_5
// Motivo   : Devido a Subscrição e Fluxo de Cotas serem posicionados por quantidade de cotas
//******************************************************************************
// Data     : 06/08/2004
// Linha(s) : Alt_4
// Motivo   : Incluido o parametro fraFrame na rotina de reprocessamento
//******************************************************************************
// Data     : 05/08/2004
// Linha(s) : Alt_3
// Motivo   : Retirado a contabilização da oper. de Amortização no momento do
//            reprocessamento
//******************************************************************************
// Data     : 05/08/2004
// Linha(s) : Alt_2
// Motivo   : Tratamento para frmAguarde - Focus
//******************************************************************************
// Data     : 28/04/2004
// Função   : GravaAmortCustoAtual , AmortizacaoRetr
// Motivo   : Incluido de parâmetro default iTipoCota nas funções
//******************************************************************************
// Data     : 22/04/2004
// Função   : ContabilizacaoFinanceiro,ContabilizaProvRevIOF
// Motivo   : Incluido a variavel de Valor Atualizado na Aplicação de FDIC
//******************************************************************************
// Data     : 13/04/2004
// Função   :AmortizacaoRetr, GravaAmortCustoAtual, GravaIRAmort, GravaValorAmortContabil
// Linha(s) :3568,4908,5070
// Motivo   : Foi feita a implementações das funções da operação de Amortização
//            para ser utilizada no Reprocessamento
//******************************************************************************
// Data	    :06/04/2004
// Função   :ExcluiResgate
// LINHA(S) :4787
// Motivo(S): Implementada a QryUpdOperacaoFundoResg que libera a integração
//            com a tesouraria e contabil para exclusão
//******************************************************************************
// Data	    :06/04/2004
// Função   : CriarLanctoDocumentoOpe
// LINHA(S) :1981
// Motivo(S): Implementação do codigo de integração com a tesouraria e contabil,
//            na OPERACAOFUNDO
//******************************************************************************

unit UFundoComum;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, USistema, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti, FaMensagem,
  DBTables, MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls, UImpostos, URegra,
  uCtrlInvContab,
  //AL_161
  uCtrlInvestimento, dbclient, uCtrlPadroes, uCtrlFundos, uCMMath, uDbPedidofundo, dBaseDados;

type

//**************************************************************************************************
  TDadosCota = Record
                 DataCota:TDate;
                 VlrCota :Double
               End;
//**************************************************************************************************

      //Mascara do quantidade de cotas
      Function MontaMascaraDecQtd(IDFUNDOINVEST : Integer) : String;

      //Mascara do valor da cota
      Function MontaMascaraDecVlr(IDFUNDOINVEST : Integer) : String;

      //Alimenta Fundos
      //Alt_14
      //Alt_11
      Function AlimentaFundo(iTipoInvest, iTipoOperacao, iCarteira, iFundo,
                             iPlanoPrev, iPatrocinadora, iOperacao, iOperOrigem,
                             iQtdDecCotas, iTipoFundo, iForCli           : integer;
                             dDataApl, dDataOper, dDataLiq               : TDateTime;
                             fQtdInvestOperacao, fValorCota              : Double;
                             fValorOperacao, fValorIRProv, fValorIOFProv : currency;
                             sNaturMov, sHistorico, sTipoMov             : string;
                             bMostraMsg                                  : boolean;
                             iiPlanPrevCtbPatro, iIdOperacaoInvest, iComposicaoFundo : integer;
                             fVlrRendimento : Double;
                             var sMensagem   : String;
                             iTipoCota       : Integer = -1;
                             fVlrAplicado    : Double = 0;
                             fValorCusto     : Double = 0;
                             fSldVlrFundo    : Double = 0): boolean;

      //Busca saldos dos Fundos
      //AL_194
      //Al_60
      //Alt_20
      //Alt_17
      Function BuscaSaldoFundo(iFundo, iiPlanPrevCtbPatro, iCompFundo : integer;
                               dDataRef                             : TDateTime;
                               var fSdoAplicado, fSdoIrProv, fSdoIofProv, fSdoVariacao,
                                   fSdoCotasMovFundo, fSdoMovFundo, fSdoVlrFundo, fSdoQtdCotas,
                                   fSdoMercado, fSdoQtdCotasBloq : double;
                               var sDescFundo  : String;
                               iTipoCota       : Integer = -1;
                               iTipoResgate    : Integer =  0;
                               fVlrCustoAtual  : Double = 0) : boolean;

      // Resgate dos fundos de tipo FAC - FIF
      //Al_60
      Function ResgateFACFIF(iTipoInvest, iPedido, iTipoOperacao, iCarteira,
                             iFundo, iCompFundo, iPlano       : Integer;
                             dDataCotz, dDataOper, dDataLiq, dDataAplic : TDateTime;
                             fValorOperacao, fValorCota       : Double;
                             var fVlrCustoAcoes, fVlrVarAcoes : Currency;
                             iTipoCota    : Integer      = -1;
                             iTipoResgate : Integer      =  0;
                             fraFrame     : TfraMensagem = Nil)   : Boolean;

      // Atualiza saldos dos fundos
      Function AtualizaSaldoFundos(iTipoInvest, iTipoFundo, iFundo, iPlanoPrev : Integer;
                                   dDataOper                      : TDateTime;
                                   bMostraMsg, bForm              : Boolean;
                                   iTipoCota                      : Integer = -1) : Boolean;

      // Busca Cotas do Fundo
      Function BuscaCotaFundo(QryLocal       : TwwQuery;
                              IdFundoInvest  : Integer;
                              DataReferencia : TDate;
                              IdTipoCota     : Integer = -1): TDadosCota;

      Function AtualizaResgateHistFundo(iTipoInvest, iTipoOperacao, iCarteira, iFundo,
                                        iPlanoPrev, iPatrocinadora, iOperacao,
                                        iOperOrigem, iQtdDecCotas, iTipoFundo, iForCli,
                                        iComposicaoFundo, iiPlanPrevCtbPatro : Integer;
                                        dDataApl, dDataOper, dDataLiq        : TDateTime;
                                        fQtdInvestOperacao                   : Double;
                                        fValorOperacao, fValorIR, fValorIOF  : Currency;
                                        sNaturMov, sHistorico, sTipoMov      : String;
                                        fVlrRendimento                       : Double = 0;
                                        iTipoCota      : Integer = -1;
                                        fSldVlrFundo   : Double = 0) : Boolean;

      //AL_128                                  
      Function ContabilizaOperFundos(iEmpresaProp, iModuloOrigem, iTipoInvest, iTipoOperacao,
                                     iCarteira, iTipoFundo, iForCli, iTipoDespesa : integer;
                                     Var iPlano, iPlanilha, iDocumento            : Integer;
                                     fValor : double;
                                     dDataOper, dDataVenc : TDateTime;
                                     sNaturMov, sTipoMov, sHistorico : string;
                                     iFlgContaInvest   : Integer = 0;
                                     wiPlanoPrevContab : Integer = 0;
                                     wiPatrocinadora   : Integer = 0)  : Boolean;

      Function ProcExcluiContabil(iPlano, iPlanilha  : Integer) : Boolean;

      //AL_147
      Function ProcExcluiFundo(iDocumento, iPlanilha, iPlano, iTipoInvest : longint;
                               dDataExclusao : TDateTime;
                               bMostraMsg     : boolean;
                               iOperacaoFundo : Integer = -1;
                               iIdPlanoPrev   : Integer = -1) : Boolean;

      Function ContabilizaVariacao(iTipoFundo, iEmpresaProp, iModuloOrigem, iForCli : Integer;
                                   dDataOper  : TDateTime;
                                   bMostraMsg, bMostra : Boolean;
                                   Var iPlano, iPlanilha, iDocumento : Integer;
                                   Var fValorLancto : Double) : Boolean;
      //AL_197

      Function ContabilizaProvIRRF(iTipoFundo : Integer; dDataAtual  : TDateTime;
                                   Var iPlano, iPlanilha, iDocumento : Integer;
                                   Var fValorLancto : Double) : Boolean;

      Function ContabilizaProvRevIOF(iTipoFundo : Integer; dDataAtual : TDateTime;
                                     Var iPlano, iPlanilha, iDocumento : Integer;
                                     Var fValorLancto : Double) : Boolean;

      Function ContabilizaAtualizacao(iSegmentacao, iTipoOperacao, iEmpresaProp, iModuloOrigem, iTipoInvest,
                                      iCarteira, iForCli, iPlanoPrev, iPatro   : Integer;
                                      fValor                            : Double;
                                      sTipoTitulo, sDescFundos          : String;
                                      dDataOper                         : TDateTime;
                                      bMostraMsg                        : Boolean;
                                      var iPlano, iPlanilha, iDocumento : Integer) : Boolean;

      Function CriarLanctoDocumentoAtu(fValor : Double;
                                       dDataOper   : TDateTime;
                                       iTipoFundo, iPlano, iPlanilha, iDocumento : Integer) : Boolean;

      //Al_53
      Function CriarLanctoDocumentoOpe(fValor                : Double;
                                       dDataOper             : TDateTime;
                                       iTipoInvest, iTipoOper, iPlano, iPlanilha, iDocumento : Integer;
                                       sHistorico, sRecPag   : String;
                                       bDoc                  : Boolean;
                                       iTipoCota             : Integer = -1) : Boolean;

      Function UltimoDiaMes(Year, Month : Integer) : TDateTime;

      //Al_87
      Function GravaAplicacaoResgate(iTipoInvest, iTipoOperacao, iCarteira,
                                     iOperacao, iFundo : Integer;
                                     dDataApl, dDataOper, dDataUltPgtoIr : TDateTime;
                                     sHistorico, sNaturMov, sTipoMov : String; fVlrAplicado,
                                     fValorOperacao, fValorIRProv, fValorIOFProv, fValorVariacao,
                                     fQtdInvestOperacao, fSaldoFinalCotas, fSaldoFinalValor,
                                     fValorCotaApl, fValorCustoAtual : Double;
                                     iiPlanPrevCtbPatro, iOperacaoInvest, iComposicaoFundo : integer;
                                     iTipoCota : Integer   = -1;
                                     fQtdOperBloq : Double = 0) : Boolean;

      //AL_138                               
      Function ExcluiMovimento(iIdTipoInvest, iIdPlanPrevCtbPatr, iIdFundoInvest : Integer;
                               dDataAplicacao, dDataMovFundo : TDateTime;
                               bExibeErro, bExibeProgresso : Boolean;
                               iTipoCota : Integer = -1): Boolean;

      Function CotizaAplicacao(dData : TDateTime; iFundo, iPlano, iTipoFundoInvest : Integer) : Boolean;

      Function CotizaResgate(dData : TDateTime; iFundo, iPlano, iTipoFundoInvest   : Integer) : Boolean;

      //Al_129
      //AL_128
      function ContabilizacaoFinanceiro(Var iPlano, iPlanilha, iDocumento : Integer;
                                        iTipoOperacao, iTipoInvest, iCarteira,
                                        iTipoFundo, iForCli, iFundo                 : Integer;
                                        dDataApl, dDataOper                       : TDateTime;
                                        sTipoMov, sNaturMov, sHistorico           : String;
                                        bDoc                                      : Boolean;
                                        fValorOperacao, fValorIR, fValorCol,
                                        fValorTax, fValorCorret, fVlrCustoAcoes,
                                        fVlrVarAcoes                              : Currency;
                                        iTipoCota   : Integer = -1;
                                        fVlrUsufruto: Currency = 0;
                                        fVlrVarFDIC : Currency = 0;
                                        fVlrTxPerf  : Currency = 0;
                                        iFlgContaInvest   : Integer = 0;
                                        wiPlanoPrevContab : Integer = 0;
                                        wiPatrocinadora   : Integer = 0;
                                        fVlrIOF           : Currency = 0)  : Boolean;

      //Ricardo Cristiano - 09/12/2008 - N. Sol 100716 -  N. Kintana 447117
      //AL_139
      Function GravaOperacaoFundo(iOperOrigem, iTipoInvest, iPedido, iTipoOperacao,
                                  iCarteira, iFundo, iCompFundo, iPlano : Integer;
                                  dDataCotz, dDataLiq, dDataOper : TDateTime;
                                  fValorOperacao, fValorIR, fValorIOF, fValorRend,
                                  fQtdInvestOperacao, fValorCota        : Double;
                                  var iIDOperacao : Integer;
                                  iTipoCota       : Integer = -1;
                                  sLote           : String  = '';
                                  dDataVenc       : TDateTime = 0) : Boolean;

      //Al_67
      Function  AtualizaCotaIntegralizar(DataProc: TDateTime; iTipoFundo, iFundo : Integer; bForm : Boolean): Boolean;

      Function  PgtoIrIofFundos(iTipoFundo : Integer;
                                dDataOper  : TDateTime; bMostraMsg, bForm : boolean) : Boolean;

      Function  LimitePerCota(dData        : TDateTime; iIdFundo    : Integer;
                              fValorCota   : Double)  : Double;

      //AL_14
      Function  Reprocessamento(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                                dDataOper, dDataUltFech, dDataIniProc  : TDateTime;
                                bMostraMsg : Boolean;
                                iTipoCota  : Integer = -1;
                                fraFrame: TfraMensagem = nil;
                                flgTransfCota: boolean = False)    : Boolean;

      Function EfetuaOperacoesRetro(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                                    dDataProcesso : TDateTime;
                                    bMostraMsg    : boolean;
                                    iTipoCota     : Integer = -1) : Boolean;

      Function AjusteRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                          dDataProcesso : TDateTime;
                          bMostraMsg    : Boolean;
                          iTipoCota     : Integer = -1) : Boolean;

      Function AplicacaoRetr(iTipoInvest, iTipoFundoInvest, iTipoOperacao, iFundoInvest, iPlano : Integer;
                             dDataProcesso : TDateTime;
                             bMostraMsg    : Boolean;
                             iTipoCota     : Integer = -1) : Boolean;

      //Al_68
      Function IntegralizacaoCotasRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                                       iTipoOperacao : Integer;
                                       dDataProcesso : TDateTime;
                                       bMostraMsg    : Boolean;
                                       iTipoCota     : Integer = -1) : Boolean;

      Function CancelamentoSubsCotasRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                                         iTipoOperacao : Integer;
                                         dDataProcesso : TDateTime;
                                         bMostraMsg    : Boolean;
                                         iTipoCota     : Integer = -1) : Boolean;

      Function ResgateRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                           dDataProcesso : TDateTime;
                           bMostraMsg    : Boolean;
                           iTipoCota     : Integer = -1) : Boolean;

      Function AmortizacaoRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                               dDataProcesso : TDateTime;
                               bMostraMsg    : Boolean;
                               iTipoCota     : Integer = -1) : Boolean;

      Function RecebimentosRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                               dDataProcesso : TDateTime;
                               bMostraMsg    : Boolean;
                               iTipoCota     : Integer = -1) : Boolean;
      //Alt_20
      Function TransfPlanosRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                                dDataProcesso : TDateTime;
                                bMostraMsg    : Boolean;
                                iTipoCota     : Integer = -1) : Boolean;

      //Al_87
      //Alt_1
      Function GravaAmortCustoAtual(QryTmpDetalhe : TQuery;
                                    dDataOper     : TDateTime;
                                    sDescOper, sDescFundo  : String;
                                    iTipoInvest, iPlano, iOperacaoFundo, iTipoOper : Integer;
                                    fValorCustoNovo, fValorCustoTotal   : Currency;
                                    Var fValorOper : Currency;
                                    iTipoCota : Integer = -1) : Boolean;

      Function GravaIRAmort(dDataOper  : TDateTime;
                            fValorOper : Currency;
                            iOperacao, iCarteira, iTipoFundoInvest, iTipoInvest, iIdForCli : Integer;
                            sProvIR, sNatureza, sDescOper, sDescFundo     : String;
                            var iPlano, iPlanilha, iDocumento : Integer) : Boolean;

      //Al_89

      //AL_162
      Function  ExcluiResgate(iPedido: Integer; bMostraMsg: Boolean = True) : Boolean;

      Procedure MensagemErroPeriodo(iErroPeriodo: integer);

      function LocalizaCampoFundo(iIdTipoFundoInvest: Integer): String;

      // AL_34
      function BloqueiaOperacaoSeAbertura: Boolean;

      function VerEmAbertura(iIdTipoFundoInvest: Integer): Boolean;

      function GravaEmAbertura(iIdTipoFundoInvest: Integer; sFlag: String = 'S'): Boolean;

      // Alt_33
      function ZeraCotaCartGerencRF(wDtMov : TDateTime) : Boolean;

      //Al_97
      //Al_69
      //Al_64
      function GravaHistCotaIntegraliza(iIdTipoInvest, iIdFundoInvest, iIdTipoCota, iPlano, iPlanilha,
                                        iIdCotaIntegraliza, iIdPlanPrevCtbPatr, iIdOperacaoFundo : Integer;
                                        dDataHistCotaInteg, dDataAplicacao : TDateTime;
                                        fVlrHistCotaIntegr, fQtdHistCotaIntegr, fQtdMovCotaIntegr,
                                        fVlrCotaIntegr, fVlrVariacaoDia : Double;
                                        sTipoMov : String) : Boolean;

      //Al_70
      //Al_65
      function AtualizaHistCotaIntegr(dDataOper : TDateTime;
                                      iTipoCota, iTipoInvest, iTipoFundoInvest, iFundoInvest,
                                      iIdPlanPrevCtbPatr : Integer; bForm : Boolean) : Boolean;

      //Al_75
      Function FluxoCotasIntegRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                                   iTipoOperacao : Integer;
                                   dDataProcesso : TDateTime;
                                   bMostraMsg    : Boolean;
                                   iTipoCota     : Integer = -1) : Boolean;

      //Al_77
      Function SubscricaoCotasIntegRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                                        iTipoOperacao : Integer;
                                        dDataProcesso : TDateTime;
                                        bMostraMsg    : Boolean;
                                        iTipoCota     : Integer = -1) : Boolean;

      //Al_86
      Function BloqueioCotas(iTipoInvest, iPedido, iTipoOperacao,
                             iCarteira, iFundo, iPlano  : Integer;
                             dDataCotz, dDataOper, dDataLiq, dDataAplic   : TDateTime;
                             fValorCota, fQtdOperacao   : Double;
                             iTipoCota    : Integer      = -1;
                             fraFrame     : TfraMensagem = Nil) : Boolean;

      //Al_88
      Function BloqueioCotasRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                                 dDataProcesso : TDateTime;
                                 bMostraMsg    : Boolean;
                                 iTipoCota     : Integer = -1) : Boolean;

      //AL_198 Retirado
      //AL_150

      function BuscaTipoTitulo(iTpFundo, iTpInvest: Integer; sTipoFundo: String;
                               var sTipoTitulo, sComplemento: String): Boolean;

      //AL_161
      function IntegraPenhoraJuridico(dDataIni, dDataFim : TDateTime;
                                      iFlgInvLido : Integer;
                                      iTipoInvest : Integer = -1;
                                      iPlanPrev  : Integer = -1;
                                      iInvestimento : Integer = -1;
                                      iOperAplic : Integer = -1;
                                      iFundoInvest : integer = -1;
                                      iTipoCota : integer = 0) : Boolean;

//Al_178 - Implementação para tratar também as aplicações a cotizar
//Al_175
function PesqAplicMesmoDia(iTipoInvest, iTipoOperacao, iCarteira, iFundo, iOperacao,
                           iiPlanPrevCtbPatro, iIdOperacaoInvest, iComposicaoFundo : integer;
                           dDataApl   : TDateTime;
                           fValorCota : Double;
                           sNaturMov, sHistorico : string;
                           iTipoCota       : Integer = -1) : boolean;
      //AL_188
      //Mascara do quantidade de cotas (HistFundoInvest)
      Function MontaMascaraDecQtdHist(IDFUNDOINVEST : Integer; DATAOPERACAO:  String) : String;

      Function MontaMascaraDecVlrHist(IDFUNDOINVEST : Integer; DATAOPERACAO:  String) : String;

      //AL_196
      procedure ListaAtuAplicacoes(iIdTipoInvest, iIdTipoFundoInvest, iIdPalnPrevCtbPatr,
                                   iIdFundoInvest, iIdTipoCota : Integer;
                                   dDataMov, dDataBloq : TDateTime);
      //AL_195
      procedure ListaSaldoFundo(iIdTipoInvest, iIdPlanPrevCtbPatr, iIdFundoInvest, iIdTipoCota,
                                iIdTipoMaior, iIdTipoMenor, iIdComposicao  : Integer;
                                dDataAplic, dDataMov : TDateTime);
      //AL_197
      procedure ListaVariacaoFundo(iIdTipoInvest, iIdTipoFundoInvest : Integer;
                                   dDataMov : TDateTime);

      //Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
      //AL_203
      // Al_198
      Function TransfFundoLote(iTipoInvest,iFundoInvest,iTipoFundoInvest :  Integer;
                               dDataProcesso: TDateTime;
                               bMostraMsg: Boolean;
                               iTipoCota : Integer = -1): Boolean;
      //Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
      //AL_203
      //AL_198
      Function MontaBuscaTransfLote(iTipoInvest, iFundoInvest, iTipoFundoInvest, iTipoOperacao : Integer;
                                    dDataProcesso : TDateTime;
                                    sLote : String;
                                    const QryBuscaTransfLote : TwwQuery;
                                    iTipoCota : Integer = -1) : Boolean;

      //AL_203
      Function MontaBuscaSaldo(iTipoInvest, iFundoInvest, iTipoFundoInvest : Integer;
                               dDataProcesso : TDateTime;
                               const QryBuscaSaldo : TwwQuery;
                               iTipoCota : Integer = -1) : Boolean;
      //AL_204
      Function VerificaTranferenciaPlanos(iTipoInvest, iFundoInvest,iPlanoPatro: Integer;
                                          dDataOperacao: TDateTime;
                                          iTipoCota: Integer = -1): Boolean;

      //Ricardo Cristiano - 28/10/2008 - N. Sol 99367 -  N. Kintana 435730
      Function TransfTipoFundo(iTipoInvest, iFundoInvest, iTipoFundoInvest :  Integer;
                               dDataProcesso : TDateTime;
                               bMostraMsg : Boolean;
                               iTipoCota  : Integer = -1): Boolean;

      //Ricardo Cristiano - 28/11/2008 - N. Sol 99876 -  N. Kintana 441255
      function TransfCotaIntegr(iTipoInvest, iFundoInvest, iTipoFundoInvest :  Integer;
                                dDataProcesso : TDateTime;
                                bMostraMsg : Boolean;
                                iTipoCota  : Integer = -1): Boolean;

      function TransfHistCotaIntegr(iTipoInvest, iFundoInvest: Integer;
                                dDataProcesso : TDateTime;
                                bMostraMsg : Boolean;
                                iTipoCota  : Integer = -1): Boolean;

      //Ricardo Cristiano - 02/12/2008 - N. Sol 102784 -  N. Kintana 457223
      //Ricardo Cristiano - 28/11/2008 - N. Sol 99876 -  N. Kintana 441255
      function PesqAplicIntegr(iTipoInvest, iFundo, iOperacao, iiPlanPrevCtbPatro  : integer;
                               dDataApl, dDataOper : TDateTime;
                               fValorCota, fValorOper, fQtdOper : Double;
                               iTipoCota  : Integer = -1) : boolean;

      //Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
      Function AtualizaAplicacaoHistFundo(iTipoInvest, iTipoOperacao, iCarteira, iFundo,
                                          iPlanoPrev, iPatrocinadora, iOperacao,
                                          iOperOrigem, iQtdDecCotas, iTipoFundo, iForCli,
                                          iComposicaoFundo, iiPlanPrevCtbPatro  : integer;
                                          dDataApl, dDataOper, dDataLiq         : TDateTime;
                                          fQtdInvestOperacao, fValorCota        : Double;
                                          fValorOperacao, fValorIR, fValorIOF   : currency;
                                          sNaturMov, sHistorico, sTipoMov       : string;
                                          fVlrRendimento                        : Double = 0;
                                          iTipoCota      : Integer = -1;
                                          fSldVlrFundo   : Double = 0) : Boolean;
      //Ricardo Cristiano - 07/01/2010 - N. Sol 129265 -  N. Kintana 707133
      Procedure VerificaTipoFundoInvestVig(dData : TDateTime; iFundoInvest : Integer;
                                           var iTipoFundoInvest : Integer;
                                           var iTipoInvest : Integer;
                                           var iTipoCota  : Integer;
                                           var flgTransfCota: Boolean);

implementation

uses dFundoComum, uMensErro, uFuncaoGeral, uDataBase, uDiasUteis,
     UBibliotecaInvest, Math, UDiasUteisInv, DOperComum, UOperComum,
     //AL_2
     FCadLancamentoFundo, uDocumento, ULancContab, FAguarde, FAguardeInv,
     FFechtoFundos;

Function MontaMascaraDecQtd(IDFUNDOINVEST : Integer) : String;
Var
   sMascara : String;
   i        : Integer;
begin
   With  DmFundoComum.QryMontaMascaraDecQtd Do
   Begin
      Close;
      ParamByName('IDFUNDOINVEST').AsInteger := IDFUNDOINVEST;
      Open;
      If FieldByName('QTDDECQTD').AsInteger = 0 Then
         sMascara := '###,#0.000000000'
      Else
      Begin
         sMascara := '###,#0.';
         For i := 1 To FieldByName('QTDDECQTD').AsInteger Do
            sMascara := sMascara + '0';
      End;
      Close;
   End;
   Result := sMascara;
end;

function MontaMascaraDecVlr(IDFUNDOINVEST : Integer) : String;
Var
   sMascara : String;
   i        : Integer;
begin
   With DmFundoComum.QryMontaMascaraDecQtd Do
   Begin
      Close;
      ParamByName('IDFUNDOINVEST').AsInteger := IDFUNDOINVEST;
      Open;
      If FieldByName('QTDDECVALOR').AsInteger = 0 Then
         sMascara := '###,#0.000000000'
      Else
      Begin
         sMascara := '###,#0.';
         For i := 1 To FieldByName('QTDDECVALOR').AsInteger Do
            sMascara := sMascara + '0';
      End;
      Close;
   End;
   Result := sMascara;
end;

//Alt_14
//Alt_11
function AlimentaFundo(iTipoInvest, iTipoOperacao, iCarteira, iFundo,
                       iPlanoPrev, iPatrocinadora, iOperacao, iOperOrigem,
                       iQtdDecCotas, iTipoFundo, iForCli           : integer;
                       dDataApl, dDataOper, dDataLiq               : TDateTime;
                       fQtdInvestOperacao, fValorCota              : Double;
                       fValorOperacao, fValorIRProv, fValorIOFProv : currency;
                       sNaturMov, sHistorico, sTipoMov             : string;
                       bMostraMsg                                  : boolean;
                       iiPlanPrevCtbPatro,iIdOperacaoInvest, iComposicaoFundo : integer;
                       fVlrRendimento  : Double;
                       var sMensagem   : String;
                       iTipoCota       : Integer = -1;
                       fVlrAplicado    : Double = 0;
                       fValorCusto     : Double = 0;
                       fSldVlrFundo    : Double = 0): boolean;
var
   fSaldoInicialCotas, fValorPremio      : double;
   fSaldoInicialValor, fQtdeInicialInvest            : Double;
   fSaldoFinalCotas, fQtdeFinalInvest, fNulo         : Double;
   sRecPag, sTipoAtualizacao                         : String;
   iIdOpercaoFundoOrigem                             : Integer;
   //AL_37
   ftotvlraplicado,
   ftotcotasmovfundo,
   ftotvlrmovfundo,
   ftotsaldoqtdcotas,
   ftotsaldovlrfundo,
   ftotvlrcustoatual  : Extended;

begin
   Result := True;
   fNulo  := 0;
   //AL_162
   sMensagem := '';

   fQtdeInicialInvest := 0;

   if iCarteira = 0 then iCarteira := -1;

   If (sTipoMov <> 'CTZ') And (fValorCota = 0) Then
   Begin
      With DmFundoComum Do
      Begin
         OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
         //Alt_30
         If iTipoCota > 0 Then
            QryVlrCota.ParamByName('IDTIPOCOTA').AsInteger := iTipoCota;
         QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger := iFundo;
         QryVlrCota.ParamByName('DATACOTA').AsDateTime     := dDataOper;
         QryVlrCota.Open;
         fValorCota := QryVlrCota.FieldByName('VLRCOTA').AsFloat;
         OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
      End;

      If fValorCota = 0 Then
      Begin
         //AL_162
         sMensagem := 'Cota de cotização do dia '+DateToStr(dDataOper)+' não encontrada. Verificar o dia.';
         if bMostraMsg then begin
            //AL_131
            MsgDlg(sMensagem, 'Mensagem do Sistema', mtInformation, [mbOk], 0);
            sMensagem := '';
         end;
         Result := False;
         Exit;
      End;
   End;

   // para evitar qq Access Violation que pudesse ocorrer
   if length(trim(sNaturMov))  = 0 then sNaturMov  := ' ';

   try {...Finally}

      try {...Except}

         // Se a natureza indicar que não há alimentação da carteira, sai (com Result = True)
         if sNaturMov[1] = 'N' then Exit;

         // Se (Valor = 0 _e_ Qtde = 0), sai (com Result = True)
         if (fValorOperacao = 0) and (fQtdInvestOperacao = 0) then Exit;

         // Verifica a HistFundo p/ saber se esta será a primeira movimentação do Fundo
         with dmFundoComum.qryVerPrimeiraMov do begin
            OperComum.LimpaParametros(dmFundoComum.qryVerPrimeiraMov);
            if not(Prepared) then Prepare;
            ParamByName('IDFUNDOINVEST').AsInteger := iFundo;
            //Alt_30
            If iTipoCota > 0 Then
               ParamByName('IDTIPOCOTA').AsInteger := iTipoCota;
            //AL_132
            if dDataApl > dDataOper then
               ParamByName('DATAMOVFUNDO').AsString   := DateToStr(dDataApl)
            else
            ParamByName('DATAMOVFUNDO').AsString   := DateToStr(dDataOper);
            //AL_117
            ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvest;
            //AL_110
            ParamByName('IDPLANPREVCTBPATR').AsInteger  := iiPlanPrevCtbPatro;
            Open;
            First;
         end;

// @X Verificação dos saldos iniciais e cálculo do Valor da Cota -----------------------------------

         // Fundo ainda não possui movimentações: saldos zerados
         if DmFundoComum.qryVerPrimeiraMov.IsEmpty then begin

            // Caso seja a 1ª movimentação da fundo,
            // não permite movimento que diminua o saldo.
            if (
               ( (fValorOperacao < 0) and (sNaturMov[1] in ['A','G','L','O','R']) )
               )
            then begin
               //AL_162
               sMensagem := 'Fundo de Investimentos ainda não foi movimentado. ' +
                            'A primeira movimentação de um Fundo não pode diminuir seu saldo!';
               if bMostraMsg then begin
                  MsgDlg(sMensagem, 'Mensagem do Sistema',mtInformation, [mbOk], 0);
                  sMensagem := '';
               end;

               // Sai, (com Result = False)
               Result := False;
               Exit;

            end else begin

               // É a 1ª movimentacao da fundo;
               // Caso a 1ª movimentação aumente o saldo, inicializa os saldos
               if (sNaturMov[1] = 'A') or ((sNaturMov[1] = 'D')) then
               begin
                  fSaldoInicialCotas   := 0;
                  fQtdeInicialInvest   := 0;
               end
               else
               begin
                  // O primeiro movimento DEVE aumentar o nº de cotas
                  //AL_162
                  sMensagem := 'Fundo de Investimentos ainda não foi movimentado. ' +
                               'Movimentação não é permitida!';
                  if bMostraMsg then
                  begin
                     MsgDlg(sMensagem, 'Mensagem do Sistema', mtInformation, [mbOk], 0);
                     sMensagem := '';
                  end;

                  // Sai, (com Result = False)
                  Result := False;
                  Exit;
               end;

            end;

         end;

         // Verificação do saldo do INVESTIMENTO
         fQtdeInicialInvest   := 0;

// FIM da Verificação dos saldos iniciais e cálculo do Valor da Cota -------------------------------

         Case sNaturMov[1] of

            'A': // Aumenta quantidade de cotas (Aplicação)
            begin
               //AL_147
               //Al_140
               //Alt_9
               if ((iTipoOperacao = -38)  Or    // Tranf entre Fundos
                   (iTipoOperacao = -40)  Or    // Tranf entre Fundos
                   (iTipoOperacao = -161)) then // Tranf entre Tipos
               begin
                  //Al_122
                  //Alt_19

                  If Not GravaAplicacaoResgate(iTipoInvest, iTipoOperacao, iCarteira,
                                               iOperOrigem, iFundo,
                                               dDataApl, dDataOper, dDataLiq,
                                               sHistorico, sNaturMov, sTipoMov,
                                               fVlrAplicado, fValorOperacao, fValorIRProv,
                                               fValorIOFProv, fVlrRendimento,
                                               fQtdInvestOperacao, fQtdInvestOperacao,
                                               fValorOperacao, fValorCota, fValorCusto,
                                               iiPlanPrevCtbPatro, iIdOperacaoInvest,
                                               iComposicaoFundo, iTipoCota) Then
                  Begin
                      Result := False;
                      Exit;
                  End;
               end
               //AL_147
               else if iTipoOperacao = -108 then // Tranf entre Planos
               begin
                  //Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
                  if not AtualizaAplicacaoHistFundo(iTipoInvest, iTipoOperacao, iCarteira, iFundo,
                                                    iPlanoPrev, iPatrocinadora, iOperacao,
                                                    -1, iQtdDecCotas, iTipoFundo,
                                                    iForCli, iComposicaoFundo, iiPlanPrevCtbPatro,
                                                    dDataApl, dDataOper, dDataLiq,
                                                    fQtdInvestOperacao, fValorCota,
                                                    fValorOperacao, fValorIRProv, fValorIOFProv,
                                                    sNaturMov, sHistorico, sTipoMov,
                                                    fVlrRendimento, iTipoCota,
                                                    fSldVlrFundo) Then
                  begin
                     Result := False;
                     Exit;
                  end;
               end
               //AL_160
               else If (sTipoMov = 'BLQ') Then
               begin
                  If Not AtualizaResgateHistFundo(iTipoInvest, iTipoOperacao, iCarteira, iFundo,
                                                  iPlanoPrev, iPatrocinadora, iOperacao,
                                                  iOperOrigem, iQtdDecCotas, iTipoFundo,
                                                  iForCli, iComposicaoFundo, iiPlanPrevCtbPatro,
                                                  dDataApl, dDataOper, dDataLiq,
                                                  fQtdInvestOperacao,
                                                  fValorOperacao, fValorIRProv, fValorIOFProv,
                                                  sNaturMov, sHistorico, sTipoMov,
                                                  fVlrRendimento, iTipoCota,
                                                  fSldVlrFundo) Then
                  Begin
                     Result := False;
                     Exit;
                  End;
               end
               else
               begin
                  If Not GravaAplicacaoResgate(iTipoInvest, iTipoOperacao, iCarteira,
                                               iOperacao, iFundo,
                                               dDataApl, dDataApl, dDataApl,
                                               sHistorico, sNaturMov, sTipoMov,
                                               fValorOperacao, fValorOperacao, fValorIRProv,
                                               fValorIOFProv, 0, fQtdInvestOperacao, fQtdInvestOperacao,
                                               fValorOperacao, fValorCota, fValorOperacao,
                                               iiPlanPrevCtbPatro, iIdOperacaoInvest,
                                               iComposicaoFundo, iTipoCota) Then
                  Begin
                      Result := False;
                      Exit;
                  End;
               end;
            end;

            'D': // Diminui quantidade de cotas (Resgate) ou Bloqueia
            begin
               //Alt_14
               If Not AtualizaResgateHistFundo(iTipoInvest, iTipoOperacao, iCarteira, iFundo,
                                               iPlanoPrev, iPatrocinadora, iOperacao,
                                               iOperOrigem, iQtdDecCotas, iTipoFundo,
                                               iForCli, iComposicaoFundo, iiPlanPrevCtbPatro,
                                               dDataApl, dDataOper, dDataLiq,
                                               fQtdInvestOperacao,
                                               fValorOperacao, fValorIRProv, fValorIOFProv,
                                               sNaturMov, sHistorico, sTipoMov,
                                               fVlrRendimento, iTipoCota,
                                               fSldVlrFundo) Then
                Begin
                   Result := False;
                   Exit;
                End;
            end;
            //Alt_12
            'R': // Recebimentos
            begin
                If Not GravaAplicacaoResgate(iTipoInvest, iTipoOperacao, iCarteira,
                                             iOperacao, iFundo,
                                             dDataApl, dDataApl, dDataApl,
                                             sHistorico, sNaturMov, sTipoMov,
                                             fValorOperacao, fValorOperacao, fValorIRProv,
                                             fValorIOFProv, 0, fQtdInvestOperacao, fQtdInvestOperacao,
                                             fValorOperacao, fValorCota, fValorOperacao,
                                             iiPlanPrevCtbPatro, iIdOperacaoInvest,
                                             iComposicaoFundo, iTipoCota) Then
                Begin
                   Result := False;
                   Exit;
                End;

            end;
         end;

// FIM de Inclusão de Registro na HistCartInv ------------------------------------------------------
         //Ricardo Cristiano - 07/01/2009 - N. Sol 105440 -  N. Kintana 471896
         //Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
         // AL_198
         if ((iTipoOperacao <> -107) and (iTipoOperacao <> -108)) then
         begin
            //Al_178
            //Al_175
            if not PesqAplicMesmoDia(iTipoInvest, iTipoOperacao, iCarteira, iFundo, iOperacao,
                                     iiPlanPrevCtbPatro, iIdOperacaoInvest, iComposicaoFundo,
                                     dDataApl,
                                     fValorCota,
                                     sNaturMov, sHistorico,
                                     iTipoCota) then
            begin
               Result := False;
               Exit;
            end;
         end;
      except
         if bMostraMsg then Raise;
         Result := False;
      end;

   finally
      OperComum.LimpaParametros(DmFundoComum.qrySaldoFundo);
      OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
      OperComum.LimpaParametros(DmFundoComum.qryVerPrimeiraMov);
   end;
end;

//AL_194
//Al_60
//Alt_17
//Alt_20
// Busca Todos os Saldos de um Investimento/Carteira em um Lote na Data Informada
function BuscaSaldoFundo(iFundo,iiPlanPrevCtbPatro, iCompFundo : integer;
                         dDataRef : TDateTime;
                         var fSdoAplicado, fSdoIrProv, fSdoIofProv, fSdoVariacao,
                             fSdoCotasMovFundo, fSdoMovFundo, fSdoVlrFundo,
                             fSdoQtdCotas, fSdoMercado, fSdoQtdCotasBloq : double;
                         var sDescFundo  : String;
                         iTipoCota       : Integer = -1;
                         iTipoResgate    : Integer = 0;
                         fVlrCustoAtual  : Double  = 0): boolean;
begin
   fSdoAplicado      := 0;
   fSdoIrProv        := 0;
   fSdoIofProv       := 0;
   fSdoVariacao      := 0;
   fSdoCotasMovFundo := 0;
   fSdoMovFundo      := 0;
   fSdoQtdCotas      := 0;
   fSdoVlrFundo      := 0;
   fSdoMercado       := 0;
   //Alt_20
   fVlrCustoAtual    := 0;
   //AL_194
   fSdoQtdCotasBloq  := 0;
   
   //AL_195
   ListaSaldoFundo(iTipoInvestUsu, iiPlanPrevCtbPatro, iFundo, iTipoCota,
                   OperComum.IIF((iTipoResgate = 2),iTipoResgate,-1),
                   OperComum.IIF((iTipoResgate = 1),iTipoResgate,-1),
                   iCompFundo, pRPI.DTMUDACPMF, dDataRef);

   if not(DmFundoComum.qrySaldoFundo.isEmpty) then
   begin
      //AL_195
      with DmFundoComum do
      begin
         OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
         QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger     := iFundo;
           //Alt_30
         If iTipoCota > 0 Then
            QryVlrCota.ParamByName('IDTIPOCOTA').AsInteger     := iTipoCota;
         QryVlrCota.ParamByName('DATACOTA').AsDateTime         := dDataRef;
         QryVlrCota.Open;
         //AL_195
         fSdoAplicado      := qrySaldoFundo.FieldByName('VLRAPLICADO').AsFloat;
         fSdoIrProv        := qrySaldoFundo.FieldByName('VLRIRPROV').AsFloat;
         fSdoIofProv       := qrySaldoFundo.FieldByName('VLRIOFPROV').AsFloat;
         fSdoVariacao      := qrySaldoFundo.FieldByName('VLRVARIACAO').AsFloat;
         fSdoCotasMovFundo := qrySaldoFundo.FieldByName('COTASMOVFUNDO').AsFloat;
         fSdoMovFundo      := qrySaldoFundo.FieldByName('VLRMOVFUNDO').AsFloat;
         fSdoQtdCotas      := qrySaldoFundo.FieldByName('SALDOQTDCOTAS').AsFloat;
         fSdoVlrFundo      := qrySaldoFundo.FieldByName('SALDOVLRFUNDO').AsFloat;
         fSdoMercado       := OperComum.Round(qrySaldoFundo.FieldByName('SALDOQTDCOTAS').AsFloat * QryVlrCota.FieldByName('VLRCOTA').AsFloat,2);
         sDescFundo        := qrySaldoFundo.FieldByName('DESCFUNDOINVEST').AsString;
         //Alt_20
         fVlrCustoAtual    := qrySaldoFundo.FieldByName('VLRCUSTOATUAL').AsFloat;
         //AL_194
         fSdoQtdCotasBloq  := qrySaldoFundo.FieldByName('SALDOQTDCOTASBLQ').AsFloat;
      end;         
      Result := True;
   end
   else
      Result := False;
   //AL_195
   OperComum.LimpaParametros(DmFundoComum.qrySaldoFundo);
   OperComum.LimpaParametros(DmFundoComum.QryVlrCota);   
end;

//Al_60
function ResgateFACFIF(iTipoInvest, iPedido, iTipoOperacao, iCarteira, iFundo,
                       iCompFundo, iPlano               : Integer;
                       dDataCotz, dDataOper, dDataLiq, dDataAplic   : TDateTime;
                       fValorOperacao, fValorCota       : Double;
                       var fVlrCustoAcoes, fVlrVarAcoes : Currency;
                       iTipoCota    : Integer      = -1;
                       iTipoResgate : Integer      =  0;
                       fraFrame     : TfraMensagem = Nil) : Boolean;
Var
  //AL_190
  fValorOperProv, fVlrIofProv, fValor, fVlrIR, fVlrIOF, fVlrResgate, fQtdResgate, fNull, fSaldoFundo : Double;
  DadosCota       : TDadosCota;
  iIDOperacao     : Integer;
  dDataIniRefIR   : TDateTime;
  sDescFundo, sTipoSld : String;
  fVrlRendimento  : Double;
  //AL_191 
  bIOFPago        : Boolean;
  //AL_194
  fSdoQtdCotasBloq   : Double;
begin
   Result         := True;

   iIDOperacao    := 0;
   fVlrResgate    := 0;
   fQtdResgate    := 0;
   fVlrCustoAcoes := 0;
   fVlrVarAcoes   := 0;
   //AL_190
   fVlrIofProv    := 0;
   fVlrIOF        := 0;
   //AL_194
   fSdoQtdCotasBloq := 0;

   If iCarteira    = 0 Then
      iCarteira   := -1;

   //AL_191 - Verifica se a operação de IOF pago está cadastrada para descontar o mesmo
   OperComum.LimpaParametros(dmFundoComum.QryVerificaTipoOper);
   dmFundoComum.QryVerificaTipoOper.ParamByName('IDTIPOOPERACAO').AsInteger := -180;
   dmFundoComum.QryVerificaTipoOper.ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvest;
   dmFundoComum.QryVerificaTipoOper.Open;
   bIOFPago := (Not dmFundoComum.QryVerificaTipoOper.IsEmpty);
   OperComum.LimpaParametros(dmFundoComum.QryVerificaTipoOper);

   //AL_194
   //AL_190
   //AL_132
   //Alt_12
   BuscaSaldoFundo(iFundo,iPlano, iCompFundo, dDataOper, fNull , fNull ,fVlrIofProv ,fNull ,fNull ,
                   fNull, fSaldoFundo, fNull, fNull, fSdoQtdCotasBloq, sDescFundo, iTipoCota, iTipoResgate);

   //AL_190
   fValorOperProv := fValorOperacao;
   //AL_191
   if ((iTipoInvestUsu = 5) and (bIOFPago)) then
   begin
      //Resgate total pelo líquido. Deve ser feito o resgate total bruto com insidência do IOF, cravados.
      if ((fSaldoFundo - fVlrIofProv) - fValorOperProv) < 1 then
      begin
         fVlrIof        := fVlrIofProv;
         fValorOperacao := fSaldoFundo;
      end
      else
      begin
         fVlrIof    := OperComum.Round((fValorOperProv*fVlrIofProv)/fSaldoFundo,2);
         if fVlrIofProv-fVlrIof < 1 then
            fVlrIof := fVlrIofProv;
      end;
      fValorOperProv := fValorOperProv + fVlrIof;
   end;

   fVlrIof := 0;

   //Alt_35
   //AL_190
   If fValorOperProv > (fSaldoFundo + pRPI.DIFRESGFUNDOS) Then
   Begin
      sTipoSld := '';
      if iTipoResgate = 2 then
         sTipoSld := ' - CCI';
      // AL_59 - Ajusta o tipo de mensagem
      MsgDlg('Saldo insuficiente para resgate lançado no dia '+DateToStr(dDataOper)+' !'#13+
             'Valor do Resgate/Iof :   '+FloatToStrF(fValorOperProv,ffNumber,18,2)+' '#13+
             'Saldo do Fundo'+sTipoSld+' :   ' + FloatToStrF((fSaldoFundo + pRPI.DIFRESGFUNDOS),ffNumber,18,2)+' '#13+
             'Fundo : '+sDescFundo , 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
   End;

   With DmFundoComum Do
   Begin
      //AL_194
      If fValorCota = 0 Then
      Begin
         OperComum.LimpaParametros(QryVlrCota);
         QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger := iFundo;
         //Alt_30
         If iTipoCota > 0 Then
            QryVlrCota.ParamByName('IDTIPOCOTA').AsInteger := iTipoCota;
         QryVlrCota.ParamByName('DATACOTA').AsDateTime     := dDataCotz;
         QryVlrCota.Open;
         fValorCota := QryVlrCota.FieldByName('VLRCOTA').AsFloat;
         OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
      End;

      //AL_194
      if fSdoQtdCotasBloq > 0 then
      begin
         if fValorOperacao > ((fSaldoFundo-OperComum.Round(fSdoQtdCotasBloq*fValorCota,2)) + pRPI.DIFRESGFUNDOS) Then
         begin
            MsgDlg('Saldo bloqueado para resgate lançado no dia '+DateToStr(dDataOper)+' !'#13+
                   'Valor do Resgate :   '+FloatToStrF(fValorOperacao,ffNumber,18,2)+' '#13+
                   'Saldo do Fundo   :   '+FloatToStrF((fSaldoFundo + pRPI.DIFRESGFUNDOS),ffNumber,18,2)+' '#13+
                   'Saldo Bloqueado  :   '+FloatToStrF(OperComum.Round(fSdoQtdCotasBloq*fValorCota,2),ffNumber,18,2)+' '#13+
                   'Saldo Líquido    :   '+FloatToStrF(((fSaldoFundo-OperComum.Round(fSdoQtdCotasBloq*fValorCota,2)) + pRPI.DIFRESGFUNDOS),ffNumber,18,2)+' '#13+
                   'Fundo : '+sDescFundo , 'Mensagem do Sistema', mtInformation, [mbOk], 0);
            Result := False;
            Exit;
         end;
      end;

      Try
         OperComum.LimpaParametros(QryResgateFACFIF);
         //Alt_30
         If iTipoCota > 0 Then
            QryResgateFACFIF.ParamByName('IDTIPOCOTA').AsInteger     := iTipoCota;
         QryResgateFACFIF.ParamByName('IDFUNDOINVEST').AsInteger     := iFundo;
         //Al_108
         If iCompFundo > 0 Then
            QryResgateFACFIF.ParamByName('IDCOMPOSICAOFUNDO').AsInteger := iCompFundo;
         QryResgateFACFIF.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
         QryResgateFACFIF.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;

         //Alt_12
         If dDataAplic > 0 Then
         begin
            QryResgateFACFIF.ParamByName('DATAAPLICACAO').AsString   := DateToStr(dDataAplic);
            QryResgateFACFIF.ParamByName('TIPOIGUAL').AsInteger      := iTipoResgate;
         end
         Else
         Begin
            If iTipoResgate = 1 Then
            Begin
               QryResgateFACFIF.ParamByName('DATAAPLICACAO').AsString    := DateToStr(pRPI.DTMUDACPMF);
               QryResgateFACFIF.ParamByName('TIPOMENOR').AsInteger       := iTipoResgate;
            End
            Else If iTipoResgate = 2 Then
            Begin
               QryResgateFACFIF.ParamByName('DATAAPLICACAO').AsString    := DateToStr(pRPI.DTMUDACPMF);
               QryResgateFACFIF.ParamByName('TIPOMAIOR').AsInteger       := iTipoResgate;
            End;
         End;

         //AL_132
         QryResgateFACFIF.ParamByName('DATAMOVFUNDO').AsString       := DateToStr(dDataOper);
         QryResgateFACFIF.Open;

         If fraFrame <> Nil Then
         begin
            fraFrame.Mostra;
            fraFrame.Max := QryResgateFACFIF.RecordCount;
         end;

         If fValorCota = 0 Then
         Begin
            //AL_190
            OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
            QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger := iFundo;
            //Alt_30
            If iTipoCota > 0 Then
               QryVlrCota.ParamByName('IDTIPOCOTA').AsInteger := iTipoCota;
            QryVlrCota.ParamByName('DATACOTA').AsDateTime     := dDataCotz;
            QryVlrCota.Open;
            fValorCota := QryVlrCota.FieldByName('VLRCOTA').AsFloat;
            OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
         End;

         //AL_190
         OperComum.LimpaParametros(dmFundoComum.QryVerificaTipoOper);
         QryVerificaTipoOper.ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOperacao;
         QryVerificaTipoOper.ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvest;
         QryVerificaTipoOper.Open;

         While Not QryResgateFACFIF.EOF Do
         Begin
            //AL_190
            fVlrIof := 0;
            If (fValorOperacao > 0) Then
            Begin
               If fraFrame <> Nil Then
                  fraFrame.Mes := 'Resgate da Aplicação : '+ QryResgateFACFIF.FieldByName('DATAAPLICACAO').AsString;

               //AL_190               
               if (fValorOperacao <=
                   OperComum.Round(QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat*fValorCota,2)) Then
               begin
                  fVlrResgate     := fValorOperacao;
                  fQtdResgate     := OperComum.Round(fVlrResgate/fValorCota,QryResgateFACFIF.FieldByName('QTDDECQTD').AsInteger);

                  //Ricardo Cristiano - 02/12/2009 - N. Sol 127981 -  N. Kintana 682459
                  fValorOperProv  := OperComum.Round(QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat*fValorCota,2);
                  if ((ABS(ABS((fValorOperacao - (fValorOperProv)))-1) < 1) or
                      (fValorOperacao = OperComum.Round(QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat*fValorCota,2)) ) then
                     fQtdResgate    := QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat;

                  //AL_208
                  //If (QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat - fQtdResgate) < 1 Then
                  //    fQtdResgate    := QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat;

                  fVlrCustoAcoes := fVlrCustoAcoes +
                                        OperComum.Round(fQtdResgate*
                                                        QryResgateFACFIF.FieldByName('COTAAPLICACAO').AsFloat, 2);

                  fVlrVarAcoes   := fVlrVarAcoes +
                                       (fVlrResgate - OperComum.Round(fQtdResgate*
                                                               QryResgateFACFIF.FieldByName('COTAAPLICACAO').AsFloat,2));                  
                  if iTipoInvest = 5 then // Fundo Renda Fixa
                  begin
                     dDataIniRefIR := QryResgateFACFIF.FieldByName('DATAULTPGTOIR').AsDateTime;

                     //AL_191
                     if ((QryResgateFACFIF.FieldByName('STAPROVISIONAIOF').AsString = 'S') and (bIOFPago)) Then
                     begin
                        OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
                        QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger := QryResgateFACFIF.FieldByName('IDFUNDOINVEST').AsInteger;
                        QryVlrCota.ParamByName('DATACOTA').AsDateTime     := dDataIniRefIR;
                        QryVlrCota.Open;

                        //AL_132
                        fVlrIOF := Impostos.CalculaIOF(1,
                                                       QryResgateFACFIF.FieldByName('DATAAPLICACAO').AsDateTime,
                                                       dDataOper,
                                                       OperComum.Round(fQtdResgate*QryVlrCota.FieldByName('VLRCOTA').AsFloat,2),
                                                       fVlrResgate,'S');
                     end;
                  end
                  else
                     dDataIniRefIR := QryResgateFACFIF.FieldByName('DATAAPLICACAO').AsDateTime;
                  //AL_209
                  //caso tenha IOF, refaz a apuração da quantidade de cotas
                  if ((iTipoInvest = 5) and (fVlrIOF <> 0) and
                      ((fValorOperacao + fVlrIOF) <= OperComum.Round(QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat*fValorCota,2))) Then
                  begin
                     //AL_209
                     //Desfaz os valores apurados caso tenha IOF
                     fVlrCustoAcoes := fVlrCustoAcoes -
                                           OperComum.Round(fQtdResgate*
                                                           QryResgateFACFIF.FieldByName('COTAAPLICACAO').AsFloat, 2);
                     fVlrVarAcoes   := fVlrVarAcoes -
                                          (fVlrResgate - OperComum.Round(fQtdResgate*
                                                                  QryResgateFACFIF.FieldByName('COTAAPLICACAO').AsFloat,2));

                     //Apura o novo valor com IOF
                     fVlrResgate    := fValorOperacao + fVlrIOF;

                     fQtdResgate    := OperComum.Round(fVlrResgate/fValorCota,QryResgateFACFIF.FieldByName('QTDDECQTD').AsInteger);

                     //AL_208
                     //If (QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat - fQtdResgate) < 1 Then
                     //    fQtdResgate    := QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat;

                     fVlrCustoAcoes := fVlrCustoAcoes +
                                           OperComum.Round(fQtdResgate*
                                             QryResgateFACFIF.FieldByName('COTAAPLICACAO').AsFloat, 2);

                     fVlrVarAcoes   := fVlrVarAcoes +
                                          (fVlrResgate - OperComum.Round(fQtdResgate*
                                             QryResgateFACFIF.FieldByName('COTAAPLICACAO').AsFloat,2));
                     fValorOperacao  := 0;
                  end
                  else
                     //Ricardo Cristiano - 25/08/2010 - N. Sol 142508 -  N. Kintana 912002
//                     fValorOperacao := (fValorOperacao + fVlrIOF) -
//                                       OperComum.Round(QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat*fValorCota,2);
                     fValorOperacao := 0

               end
               else If (fValorOperacao > (OperComum.Round(QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat*
                                                          fValorCota,2)) ) Then
               begin
                  fVlrResgate     := OperComum.Round(QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat*fValorCota,2);

                  fVlrCustoAcoes  := fVlrCustoAcoes +
                                        OperComum.Round(QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat*
                                                        QryResgateFACFIF.FieldByName('COTAAPLICACAO').AsFloat, 2);
                  fVlrVarAcoes    := fVlrVarAcoes +
                                       (fVlrResgate -
                                        OperComum.Round(QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat*
                                                        QryResgateFACFIF.FieldByName('COTAAPLICACAO').AsFloat,2));

                  QryResgateFACFIF.Next;

                  if QryResgateFACFIF.Eof Then
                  begin
                     If ((fValorOperacao-fVlrResgate) <= 20) Then
                        fVlrResgate := fVlrResgate + (fValorOperacao-fVlrResgate);
                  end
                  else
                     QryResgateFACFIF.Prior;

                  fQtdResgate    := QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat;
                  
                  fValorOperacao := fValorOperacao - (OperComum.Round(QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat*
                                                                      fValorCota,2));

                  if iTipoInvest = 5 then // Fundo Renda Fixa
                  begin
                     dDataIniRefIR := QryResgateFACFIF.FieldByName('DATAULTPGTOIR').AsDateTime;
                     //AL_191
                     if ((QryResgateFACFIF.FieldByName('STAPROVISIONAIOF').AsString = 'S') and (bIOFPago)) Then
                     begin
                        OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
                        QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger := QryResgateFACFIF.FieldByName('IDFUNDOINVEST').AsInteger;
                        QryVlrCota.ParamByName('DATACOTA').AsDateTime     := dDataIniRefIR;
                        QryVlrCota.Open;

                        //AL_132                        
                        fVlrIOF := Impostos.CalculaIOF(1,
                                                       QryResgateFACFIF.FieldByName('DATAAPLICACAO').AsDateTime,
                                                       dDataOper,
                                                       OperComum.Round(fQtdResgate*
                                                       QryVlrCota.FieldByName('VLRCOTA').AsFloat,2),
                                                       fVlrResgate,'S');
                     end;
                  end
                  else
                     dDataIniRefIR := QryResgateFACFIF.FieldByName('DATAAPLICACAO').AsDateTime;

                  fValorOperacao := fValorOperacao + fVlrIOF;
               End;

               fVrlRendimento := 0;

               //AL_191
               if QryResgateFACFIF.FieldByName('STAPROVISIONAIR').AsString = 'S' Then
               begin
                  if iTipoInvest = 5 then    // Fundo Renda Fixa
                     //AL_132                  
                     fVlrIR  := Impostos.CalculaIr(QryResgateFACFIF.FieldByName('IDTIPOINVEST').AsInteger,
                                                   0{Investiment}, 0{Carteira}, 0{CARTEIRAGERENC},
                                                   0{TipoOperacao}, 0{Mercad}, ''{Lote},
                                                   QryResgateFACFIF.FieldByName('DATAULTPGTOIR').AsDateTime,
                                                   dDataOper,
                                                   OperComum.Round(fQtdResgate*QryVlrCota.FieldByName('VLRCOTA').AsFloat,2),
                                                   fVlrResgate, fVlrIof, 'S',
                                                   dmFundoComum.QryVerificaTipoOper.FieldByName('FLGTRATAIR').AsString,
                                                   fVrlRendimento)

                  else  // Outros Fundos
                     fVlrIR  := Impostos.CalculaIr(QryResgateFACFIF.FieldByName('IDTIPOINVEST').AsInteger,
                                                   0{Investiment}, 0{Carteira}, 0{CARTEIRAGERENC},
                                                   0{TipoOperacao}, 0{Mercad}, ''{Lote},
                                                   QryResgateFACFIF.FieldByName('DATAAPLICACAO').AsDateTime,
                                                   dDataCotz,
                                                   OperComum.Round(fQtdResgate*QryVlrCota.FieldByName('VLRCOTA').AsFloat,2),
                                                   fVlrResgate, fVlrIof, 'S',
                                                   dmFundoComum.QryVerificaTipoOper.FieldByName('FLGTRATAIR').AsString,
                                                   fVrlRendimento);
               End;

               //AL_191
               if iTipoInvest = 5 then // Fundo Renda Fixa
               begin
                  //Ricardo Cristiano - 15/12/2009 - N. Sol 128609 -  N. Kintana 690688
                  if ((QryResgateFACFIF.FieldByName('STAPROVISIONAIOF').AsString = 'S') and (bIOFPago)) Then
                  begin
                     OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
                     QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger := QryResgateFACFIF.FieldByName('IDFUNDOINVEST').AsInteger;
                     QryVlrCota.ParamByName('DATACOTA').AsDateTime     := dDataIniRefIR;
                     QryVlrCota.Open;

                     //AL_132                     
                     fVlrIOF := Impostos.CalculaIOF(1,
                                                    QryResgateFACFIF.FieldByName('DATAAPLICACAO').AsDateTime,
                                                    dDataOper,
                                                    OperComum.Round(fQtdResgate*
                                                    QryVlrCota.FieldByName('VLRCOTA').AsFloat,2),
                                                    fVlrResgate,'S');
                  end;
               end;

               If fVlrIR   < 0 Then
                  fVlrIR   := 0;

               If fVlrIOF  < 0 Then
                  fVlrIOF  := 0;

               OperComum.LimpaParametros(DmFundoComum.QryVlrCota);

               iIDOperacao := 0;
   
               //AL_190
               If Not GravaOperacaoFundo(QryResgateFACFIF.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                         iTipoInvest, iPedido, iTipoOperacao, iCarteira, iFundo,
                                         iCompFundo, iPlano,
                                         dDataCotz, dDataLiq, dDataOper,
                                         fVlrResgate, fVlrIR, fVlrIOF,
                                        (fVlrResgate-OperComum.Round(fQtdResgate*
                                                               QryResgateFACFIF.FieldByName('COTAAPLICACAO').AsFloat,2)),
                                         fQtdResgate, fValorCota, iIDOperacao, iTipoCota) Then
               Begin
                  //Ricardo Cristiano - 25/08/2010 - N. Sol 142508 -  N. Kintana 912002
                  OperComum.LimpaParametros(dmFundoComum.QryVerificaTipoOper);
                  OperComum.LimpaParametros(dmFundoComum.QryResgateFACFIF);
                  OperComum.LimpaParametros(dmFundoComum.QryVlrCota);
                  If fraFrame <> Nil Then
                     fraFrame.Apaga;
                  Result := False;
                  Exit;
               End;

               //Ricardo Cristiano - 25/08/2010 - N. Sol 142508 -  N. Kintana 912002
               if (FloatToStrF(fValorOperacao,ffNumber, 18,2) = '0,00') then
                  fValorOperacao := 0;

               Result := True;
            End
            Else If fQtdResgate <> 0 Then
            Begin
               //Ricardo Cristiano - 25/08/2010 - N. Sol 142508 -  N. Kintana 912002
               OperComum.LimpaParametros(dmFundoComum.QryVerificaTipoOper);
               OperComum.LimpaParametros(dmFundoComum.QryResgateFACFIF);
               OperComum.LimpaParametros(dmFundoComum.QryVlrCota);
               If fraFrame <> Nil Then
                  fraFrame.Apaga;
               Result := True;
               Exit;
            End
            Else If fQtdResgate  = 0 Then
            Begin
               //Ricardo Cristiano - 25/08/2010 - N. Sol 142508 -  N. Kintana 912002
               OperComum.LimpaParametros(dmFundoComum.QryVerificaTipoOper);
               OperComum.LimpaParametros(dmFundoComum.QryResgateFACFIF);
               OperComum.LimpaParametros(dmFundoComum.QryVlrCota);
               If fraFrame <> Nil Then
                  fraFrame.Apaga;
               Result := False;
               Exit;
            End
            Else
               Result := True;
   
            If fraFrame <> Nil Then
               fraFrame.Incrementa;
   
            QryResgateFACFIF.Next;
         End;
      Finally
         //AL_190
         OperComum.LimpaParametros(dmFundoComum.QryVerificaTipoOper);
         OperComum.LimpaParametros(dmFundoComum.QryResgateFACFIF);
         OperComum.LimpaParametros(dmFundoComum.QryVlrCota);
         If fraFrame <> Nil Then
            fraFrame.Apaga;
       end;
   End;
end;

Function BuscaCotaFundo(QryLocal       : TwwQuery;
                        IdFundoInvest  : Integer;
                        DataReferencia : TDate;
                        IdTipoCota     : Integer = -1): TDadosCota;
Var
  sTipoCota : String;
Begin
  sTipoCota    := '';
  If IdTipoCota > 0 Then
     sTipoCota := '      IDTIPOCOTA    = '+IntToStr(IdTipoCota)+' AND ';
   If FazQuery(QryLocal,
      'SELECT DATACOTA, VLRCOTA FROM COTAFUNDO '+
      'WHERE IDFUNDOINVEST = '+IntToStr(IdFundoInvest)+' AND '+ sTipoCota +
      '      DATACOTA      = TO_DATE('+QuotedStr(DateToStr(DataReferencia))+',''DD/MM/YYYY'')' )
   Then Begin
      Result.DataCota := QryLocal.FieldByName('DATACOTA').AsDateTime;
      Result.VlrCota  := QryLocal.FieldByName('VLRCOTA').AsFloat;
   End Else Begin
      Result.DataCota := 0;
      Result.VlrCota  := 0;
   End;
end;

//Al_87
Function GravaAplicacaoResgate(iTipoInvest, iTipoOperacao, iCarteira,
                               iOperacao, iFundo : Integer;
                               dDataApl, dDataOper, dDataUltPgtoIr : TDateTime;
                               sHistorico, sNaturMov, sTipoMov : String;
                               fVlrAplicado, fValorOperacao, fValorIRProv, fValorIOFProv,
                               fValorVariacao, fQtdInvestOperacao, fSaldoFinalCotas,
                               fSaldoFinalValor, fValorCotaApl, fValorCustoAtual : Double;
                               iiPlanPrevCtbPatro, iOperacaoInvest, iComposicaoFundo : integer;
                               iTipoCota    : Integer = -1;
                               fQtdOperBloq : Double  = 0) : Boolean;
begin

// @X Inclusão de Registro na HistFUNDO ----------------------------------------------------------
   Result := True;
   If iComposicaoFundo  = 0 Then
      iComposicaoFundo := -1;

   If iTipoCota  = 0 Then
      iTipoCota := -1;

   Try
      with DmFundoComum.qryInsertHistFundo do
      begin
         Close;
         if not(Prepared) then Prepare;

         ParamByName('IDHISTFUNDO').AsInteger     := LeUltRegistro(nil, 'HISTFUNDO');
         ParamByName('IDOPERACAOFUNDO').AsInteger := iOperacao;            if iOperacao = -1           then ParamByName('IDOPERACAOFUNDO').Clear;

         // Passa como NULL os parâmetros, quando necessário
         // não há preocupação aqui em verificar quais parâmetros _podem_ ser nulos...

         ParamByName('CODDOCUMENTO').Clear;
         ParamByName('PLNCODIGO').Clear;
         ParamByName('PLANO').Clear;
         //Al_108
         ParamByName('IDTIPOCOTA').AsInteger        := iTipoCota;         if iTipoCota        <=  0 then ParamByName('IDTIPOCOTA').Clear;
         ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvest;       if iTipoInvest      <=  0 then ParamByName('IDTIPOINVEST').Clear;
         ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacao;     if iTipoOperacao     =  0 then ParamByName('IDTIPOOPERACAO').Clear;
         ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteira;         if iCarteira        <=  0 then ParamByName('IDCARTEIRAINVEST').Clear;
         ParamByName('IDCOMPOSICAOFUNDO').AsInteger := iComposicaoFundo;  if iComposicaoFundo <=  0 then ParamByName('IDCOMPOSICAOFUNDO').Clear;
         ParamByName('IDOPERACAOINVEST').AsInteger  := iOperacaoInvest;   if iOperacaoInvest  <=  0 then ParamByName('IDOPERACAOINVEST').Clear;
         //Al_108
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iiPlanPrevCtbPatro;
         ParamByName('IDFUNDOINVEST').AsInteger     := iFundo;
         ParamByName('FLGCALCSALDO').AsString       := '1';
         ParamByName('HISTMOVFUNDO').AsString       := copy(sHistorico, 1, 59);
         ParamByName('NATURMOVFUNDO').AsString      := sNaturMov;
         ParamByName('TIPMOVFUNDO').AsString        := sTipoMov;
         ParamByName('DATAAPLICACAO').AsDateTime    := dDataApl;
         ParamByName('DATAMOVFUNDO').AsDateTime     := dDataOper;
         ParamByName('DATAULTPGTOIR').AsDateTime    := dDataUltPgtoIr;
         ParamByName('VLRAPLICADO').AsFloat         := fVlrAplicado;
         ParamByName('VLRIRPROV').AsFloat           := fValorIRProv;
         ParamByName('VLRIOFPROV').AsFloat          := fValorIOFProv;
         ParamByName('VLRVARIACAO').AsFloat         := fValorVariacao;
         ParamByName('COTASMOVFUNDO').AsFloat       := fQtdInvestOperacao;
         ParamByName('VLRMOVFUNDO').AsFloat         := fValorOperacao;
         ParamByName('COTAAPLICACAO').AsFloat       := fValorCotaApl;
         ParamByName('SALDOQTDCOTAS').AsFloat       := fSaldoFinalCotas;
         ParamByName('SALDOVLRFUNDO').AsFloat       := fSaldoFinalValor;
         ParamByName('VLRCUSTOATUAL').AsFloat       := fValorCustoAtual;
         //Al_87
         ParamByName('SALDOQTDCOTASBLQ').AsFloat    := fQtdOperBloq;
         ExecSql;
         Close;
      end;
   Except
      OperComum.LimpaParametros(DmFundoComum.qryInsertHistFundo);
      Result := False;
   End;
end;

//Ricardo Cristiano - 09/12/2008 - N. Sol 100716 -  N. Kintana 447117
//AL_139
Function GravaOperacaoFundo(iOperOrigem, iTipoInvest, iPedido, iTipoOperacao,
                            iCarteira, iFundo, iCompFundo, iPlano : Integer;
                            dDataCotz, dDataLiq, dDataOper : TDateTime;
                            fValorOperacao, fValorIR, fValorIOF, fValorRend,
                            fQtdInvestOperacao, fValorCota        : Double;
                            var iIDOperacao : Integer;
                            iTipoCota       : Integer = -1;
                            sLote           : String  = '';
                            dDataVenc       : TDateTime = 0) : Boolean;
begin
// @X Inclusão de Registro na HistCartInv ----------------------------------------------------------

   Result := True;

   Try
      with DmFundoComum.QryInsertOperacaoFundo do begin
         Close;
         if not(Prepared) then Prepare;

         iIDOperacao := LeUltRegistro(nil, 'OPERACAOFUNDO');

         ParamByName('IDOPERACAOFUNDO').AsInteger   := iIDOperacao;

         // Passa como NULL os parâmetros, quando necessário
         // não há preocupação aqui em verificar quais parâmetros _podem_ ser nulos...
         //Al_108
         ParamByName('IDTIPOCOTA').AsInteger        := iTipoCota;         if iTipoCota     <= 0  then ParamByName('IDTIPOCOTA').Clear;
         ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvest;       if iTipoInvest   <= 0  then ParamByName('IDTIPOINVEST').Clear;
         ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacao;     if iTipoOperacao  = 0  then ParamByName('IDTIPOOPERACAO').Clear;
         ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteira;         if iCarteira     <= 0  then ParamByName('IDCARTEIRAINVEST').Clear;
         ParamByName('IDPEDIDOFUNDO').AsInteger     := iPedido;           if iPedido       <= 0  then ParamByName('IDPEDIDOFUNDO').Clear;
         ParamByName('IDCOMPOSICAOFUNDO').AsInteger := iCompFundo;        if iCompFundo    <= 0  then ParamByName('IDCOMPOSICAOFUNDO').Clear;
         // Alt_11
         ParamByName('IDOPERACAOORIGEM').AsInteger  := iOperOrigem;       if iOperOrigem   <  0  then ParamByName('IDOPERACAOORIGEM').Clear;
         ParamByName('IDFUNDOINVEST').AsInteger     := iFundo;
         ParamByName('DATAOPERACAO').AsDateTime     := dDataOper;
         ParamByName('DATACOTIZACAO').AsDateTime    := dDataCotz;
         ParamByName('DATALIQUIDACAO').AsDateTime   := dDataLiq;
         ParamByName('QTDOPERACAO').AsFloat         := fQtdInvestOperacao;
         ParamByName('VLROPERACAO').AsFloat         := fValorOperacao;
         ParamByName('VLRCOTA').AsFloat             := fValorCota;
         ParamByName('VLRIR').AsFloat               := fValorIR;
         ParamByName('VLRIOF').AsFloat              := fValorIOF;
         ParamByName('VLRRENDIMENTO').AsFloat       := fValorRend;
         ParamByName('STACONFIRMA').AsString        := 'N';
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
         //AL_139
         ParamByName('IDLOTE').AsString             := sLote;             if sLote = '' then ParamByName('IDLOTE').Clear;
         //Ricardo Cristiano - 09/12/2008 - N. Sol 100716 -  N. Kintana 447117
         if dDataVenc > 0 then
            ParamByName('DATAVENCIMENTO').AsDateTime:= dDataVenc;
         ExecSql;
         Close;
      end;
   Except
      OperComum.LimpaParametros(DmFundoComum.QryInsertOperacaoFundo);
      Result := False;
   End;
end;

//Alt_14
Function AtualizaResgateHistFundo(iTipoInvest, iTipoOperacao, iCarteira, iFundo,
                                  iPlanoPrev, iPatrocinadora, iOperacao,
                                  iOperOrigem, iQtdDecCotas, iTipoFundo, iForCli,
                                  iComposicaoFundo, iiPlanPrevCtbPatro  : integer;
                                  dDataApl, dDataOper, dDataLiq         : TDateTime;
                                  fQtdInvestOperacao                    : Double;
                                  fValorOperacao, fValorIR, fValorIOF   : currency;
                                  sNaturMov, sHistorico, sTipoMov       : string;
                                  fVlrRendimento                        : Double = 0;
                                  iTipoCota      : Integer = -1;
                                  fSldVlrFundo   : Double = 0) : Boolean;
Var
   //Al_88
   fSaldoFinalCotas, fSaldoFinalValor, fValorIRProv, fValorIOFProv, fQtdCotasBloq : Double;
   sRecPag          : String;
   //Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
   dDtaUltDiaMes, dDtaAnt : TDateTime;
   Year, Month, Day : Word;
   qryTipoOper : TwwQuery;
   //Alt_14
   fVlrAplicado, fVlrCustoAtual : Double;
   //Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
   DadosCota        : TDadosCota;
begin
   //Al_88
   fQtdCotasBloq := 0;
   If iCarteira = 0 Then
      iCarteira := -1;
   With DmFundoComum Do
   Begin
      try
         Try
           qryTipoOper := TwwQuery.Create(Application);
           qryTipoOper.DatabaseName := 'BaseDados';
           //Al_87
           qryTipoOper.SQL.Add('SELECT FLGCONTAINVEST, TIPOMOVTO, NATUREZAOPERACAO');
           qryTipoOper.SQL.Add('FROM TIPOOPERACAO ');
           qryTipoOper.SQL.Add('WHERE IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao));
           qryTipoOper.Open;

           OperComum.LimpaParametros(DmFundoComum.QryBuscaAplOrigem);         
           //AL_147
           if iOperOrigem > 0 then
              QryBuscaAplOrigem.ParambyName('IDOPERACAOFUNDO').AsInteger:= iOperOrigem;
           //AL_149
           //AL_147
           if (iTipoOperacao = -107) or (iTipoOperacao = -160) then
              QryBuscaAplOrigem.ParambyName('DATAAPLICACAO').AsString   := DateToStr(dDataApl);
           //AL_132
           if dDataApl > dDataOper then
              QryBuscaAplOrigem.ParambyName('DATAMOVFUNDO').AsString    := DateToStr(dDataApl)
           else
              QryBuscaAplOrigem.ParambyName('DATAMOVFUNDO').AsString    := DateToStr(dDataOper);
           //Alt_10
           QryBuscaAplOrigem.ParambyName('IDPLANPREVCTBPATR').AsInteger := iiPlanPrevCtbPatro;
           //Alt_21
           //Alt_24
           //Al_117
           QryBuscaAplOrigem.ParambyName('IDTIPOINVEST').AsInteger      := iTipoInvest;
           QryBuscaAplOrigem.ParambyName('IDFUNDOINVEST').AsInteger     := iFundo;
           //AL_154
           If iTipoCota > 0 Then
              QryBuscaAplOrigem.ParambyName('IDTIPOCOTA').AsInteger     := iTipoCota;
           QryBuscaAplOrigem.Open;

           OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
           //Alt_30
           If iTipoCota > 0 Then
              QryVlrCota.ParamByName('IDTIPOCOTA').AsInteger := iTipoCota;
           QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger := iFundo;
           QryVlrCota.ParamByName('DATACOTA').AsDateTime     := dDataOper;
           QryVlrCota.Open;

           //Al_87
           if Trim(qryTipoOper.FieldByName('TIPOMOVTO').AsString) <> 'BLQ' then
           begin
              //Ricardo Cristiano - 10/08/2009 - N. Sol 122942 -  N. Kintana 608900
              while not QryBuscaAplOrigem.eof do
              begin
                 fSaldoFinalCotas := OperComum.Round(
                                        QryBuscaAplOrigem.FieldByName('SALDOQTDCOTAS').AsFloat -
                                               fQtdInvestOperacao,iQtdDecCotas);
                 if fSaldoFinalCotas < 0 then
                    QryBuscaAplOrigem.next
                 else
                    Break;
              end;
              //Al_88
              fQtdCotasBloq    := QryBuscaAplOrigem.FieldByName('SALDOQTDCOTASBLQ').AsFloat;

              //AL_147
              //Alt_14
              fSaldoFinalValor := OperComum.Round(fSaldoFinalCotas*QryVlrCota.FieldByName('VLRCOTA').AsFloat,2);

              //Ricardo Cristiano - 05/03/2010 - N. Sol 130827 -  N. Kintana 736750
              if fSaldoFinalValor  = 0 then
                 fSaldoFinalCotas := 0;

              //Ricardo Cristiano - 15/12/2009 - N. Sol 128609 -  N. Kintana 690688
              if fSaldoFinalValor > 0 then
              begin
                 fValorIRProv     := QryBuscaAplOrigem.FieldByName('VLRIRPROV').AsFloat - fValorIR;

                 fValorIOFProv    := QryBuscaAplOrigem.FieldByName('VLRIOFPROV').AsFloat - fValorIOF;
              end
              else
              begin
                 fValorIRProv     := 0;
                 fValorIOFProv    := 0;
              end;

              //Al_87
           end
           else
           begin
              //AL_160
              //Bloqueio de Cotas
              if Trim(qryTipoOper.FieldByName('NATUREZAOPERACAO').AsString) = 'D' then
                 fQtdCotasBloq    := fQtdInvestOperacao
              //Desbloqueio de Cotas
              else if Trim(qryTipoOper.FieldByName('NATUREZAOPERACAO').AsString) = 'A' then
                 fQtdCotasBloq    := QryBuscaAplOrigem.FieldByName('SALDOQTDCOTASBLQ').AsFloat-fQtdInvestOperacao;
              //Al_88
              fSaldoFinalCotas := QryBuscaAplOrigem.FieldByName('SALDOQTDCOTAS').AsFloat;
              fSaldoFinalValor := QryBuscaAplOrigem.FieldByName('SALDOVLRFUNDO').AsFloat;
              fValorIRProv     := QryBuscaAplOrigem.FieldByName('VLRIRPROV').AsFloat;
              fValorIOFProv    := QryBuscaAplOrigem.FieldByName('VLRIOFPROV').AsFloat;
           end;

           If fValorIRProv  < 0 Then
              fValorIRProv  := 0;

           If fValorIOFProv  < 0 Then
              fValorIOFProv := 0;

           //Alt_14
           fVlrAplicado   := QryBuscaAplOrigem.FieldByName('VLRAPLICADO').AsFloat;
           fVlrCustoAtual := QryBuscaAplOrigem.FieldByName('VLRCUSTOATUAL').AsFloat;
           if ((iTipoOperacao = -107) or (iTipoOperacao = -160)) then // Transf. Entre Planos (Baixa) - Transf. Entre Tipos (Baixa)
           begin
              //Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
              //AL_203
              if (iTipoOperacao = -107) then
              begin
                 dDtaAnt := DiasUteisInv.UltDiaUtilAnterior(dDataOper, -1, 1, '', True, False, False);

                 DadosCota := UFundoComum.BuscaCotaFundo(DmFundoComum.qryAux, iFundo, dDtaAnt,
                                                         OperComum.IIF((iTipoCota > 0), iTipoCota, -1));

                 //Ricardo Cristiano - 05/03/2010 - N. Sol 130827 -  N. Kintana 736750
                 fVlrRendimento := OperComum.Round(OperComum.Round((fQtdInvestOperacao*QryVlrCota.FieldByName('VLRCOTA').AsFloat),2) -
                                                            OperComum.Round((fQtdInvestOperacao*DadosCota.VlrCota),2),2)*-1;

              end
              else
              begin
                 //Valor do IR transferido proprocional, devido a alteração de cota e mudança de valor
                 fVlrRendimento   := OperComum.DivValorZero((QryBuscaAplOrigem.FieldByName('VLRVARIACAO').AsFloat * fQtdInvestOperacao),
                                                             QryBuscaAplOrigem.FieldByName('SALDOQTDCOTAS').AsFloat);
                 //Compensação
                 fVlrRendimento := QryBuscaAplOrigem.FieldByName('VLRVARIACAO').AsFloat - fVlrRendimento;
              end;
              //Valor do IR transferido proprocional, devido a alteração de cota e mudança de valor
              fValorIRProv   := OperComum.DivValorZero((QryBuscaAplOrigem.FieldByName('VLRIRPROV').AsFloat * fQtdInvestOperacao),
                                                        QryBuscaAplOrigem.FieldByName('SALDOQTDCOTAS').AsFloat);
              //Compensação
              fValorIRProv   := QryBuscaAplOrigem.FieldByName('VLRIRPROV').AsFloat - fValorIRProv;

              //Valor do IOF transferido proprocional, devido a alteração de cota e mudança de valor
              fValorIOFProv   := OperComum.DivValorZero((QryBuscaAplOrigem.FieldByName('VLRIOFPROV').AsFloat * fQtdInvestOperacao),
                                                         QryBuscaAplOrigem.FieldByName('SALDOQTDCOTAS').AsFloat);
              //Compensação
              fValorIOFProv    := QryBuscaAplOrigem.FieldByName('VLRIOFPROV').AsFloat - fValorIOFProv;

              // Valor transferido
              fVlrAplicado   := OperComum.DivValorZero((QryBuscaAplOrigem.FieldByName('VLRAPLICADO').AsFloat * fQtdInvestOperacao),
                                                       QryBuscaAplOrigem.FieldByName('SALDOQTDCOTAS').AsFloat);
              // Valor Anterior - Valor transferido
              fVlrAplicado   := QryBuscaAplOrigem.FieldByName('VLRAPLICADO').AsFloat - fVlrAplicado;

              // Valor transferido
              fVlrCustoAtual := OperComum.DivValorZero((QryBuscaAplOrigem.FieldByName('VLRCUSTOATUAL').AsFloat * fQtdInvestOperacao),
                                                       QryBuscaAplOrigem.FieldByName('SALDOQTDCOTAS').AsFloat);
              // Valor Anterior - Valor transferido
              fVlrCustoAtual := QryBuscaAplOrigem.FieldByName('VLRCUSTOATUAL').AsFloat - fVlrCustoAtual;
           end;

           //AL_149
           //AL_132
           //Último dia do mês
           if (dDataApl > dDataOper) or (iTipoOperacao = -160) then
              DecodeDate(dDataApl, Year, Month, Day)
           else
              DecodeDate(dDataOper, Year, Month, Day);

           dDtaUltDiaMes    := UltimoDiaMes(Year, Month);

           If dDataOper <> dDtaUltDiaMes Then
              dDtaUltDiaMes := QryBuscaAplOrigem.FieldByName('DATAULTPGTOIR').AsDateTime;

           //AL_147
           //AL_132
           //Al_122
           //Al_87
           //Alt_19
           //Alt_14
           if ((iTipoOperacao = -107) or (iTipoOperacao = -108)) then
           begin
              if dDataApl > dDataOper then
              begin
                 //AL_132              
                 //Al_123
                 If Not GravaAplicacaoResgate(iTipoInvest, iTipoOperacao, iCarteira, iOperacao, iFundo,
                                              QryBuscaAplOrigem.FieldByName('DATAAPLICACAO').AsDateTime,
                                              dDataApl, dDtaUltDiaMes,
                                              sHistorico, sNaturMov, sTipoMov,
                                              fVlrAplicado,
                                              fValorOperacao, fValorIRProv, fValorIOFProv, fVlrRendimento,
                                              fQtdInvestOperacao, fSaldoFinalCotas, fSaldoFinalValor,
                                              QryBuscaAplOrigem.FieldByName('COTAAPLICACAO').AsFloat,
                                              fVlrCustoAtual,
                                              iiPlanPrevCtbPatro,-1,iComposicaoFundo, iTipoCota,
                                              fQtdCotasBloq) Then
                    Raise Exception.Create('Não foi Possível gravar a Operação.');
              end
              else
              begin
                 If Not GravaAplicacaoResgate(iTipoInvest, iTipoOperacao, iCarteira, iOperacao, iFundo,
                                              QryBuscaAplOrigem.FieldByName('DATAAPLICACAO').AsDateTime,
                                              dDataOper, dDtaUltDiaMes,
                                              sHistorico, sNaturMov, sTipoMov,
                                              fVlrAplicado,
                                              fValorOperacao, fValorIRProv, fValorIOFProv, fVlrRendimento,
                                              fQtdInvestOperacao, fSaldoFinalCotas, fSaldoFinalValor,
                                              QryBuscaAplOrigem.FieldByName('COTAAPLICACAO').AsFloat,
                                              fVlrCustoAtual,
                                              iiPlanPrevCtbPatro,-1,iComposicaoFundo, iTipoCota,
                                              fQtdCotasBloq) Then
                    Raise Exception.Create('Não foi Possível gravar a Operação.');
              end;
           end
           else if dDataApl > dDataOper then
           begin
              If Not GravaAplicacaoResgate(iTipoInvest, iTipoOperacao, iCarteira, iOperOrigem, iFundo,
                                           QryBuscaAplOrigem.FieldByName('DATAAPLICACAO').AsDateTime,
                                           dDataApl, dDtaUltDiaMes,
                                           sHistorico, sNaturMov, sTipoMov,
                                           fVlrAplicado,
                                           fValorOperacao, fValorIRProv, fValorIOFProv, fVlrRendimento,
                                           fQtdInvestOperacao, fSaldoFinalCotas, fSaldoFinalValor,
                                           QryBuscaAplOrigem.FieldByName('COTAAPLICACAO').AsFloat,
                                           fVlrCustoAtual,
                                           iiPlanPrevCtbPatro,-1,iComposicaoFundo, iTipoCota,
                                           fQtdCotasBloq) Then
                 Raise Exception.Create('Não foi Possível gravar a Operação.');
           end
           else
           begin
              If Not GravaAplicacaoResgate(iTipoInvest, iTipoOperacao, iCarteira, iOperOrigem, iFundo,
                                           QryBuscaAplOrigem.FieldByName('DATAAPLICACAO').AsDateTime,
                                           dDataOper, dDtaUltDiaMes,
                                           sHistorico, sNaturMov, sTipoMov,
                                           fVlrAplicado,
                                           fValorOperacao, fValorIRProv, fValorIOFProv, fVlrRendimento,
                                           fQtdInvestOperacao, fSaldoFinalCotas, fSaldoFinalValor,
                                           QryBuscaAplOrigem.FieldByName('COTAAPLICACAO').AsFloat,
                                           fVlrCustoAtual,
                                           iiPlanPrevCtbPatro,-1,iComposicaoFundo, iTipoCota,
                                           fQtdCotasBloq) Then
                 Raise Exception.Create('Não foi Possível gravar a Operação.');
           end;
           //Al_87
           if Trim(qryTipoOper.FieldByName('TIPOMOVTO').AsString) <> 'BLQ' then
           begin
              If fValorIR > 0 Then
              begin
                 //AL_132
                 //Al_123
                 if dDataApl > dDataOper then
                 begin
                    if not Impostos.GravaIrLitigio(iTipoInvest, dDataApl, -1, sHistorico, -1,
                                                   iPlanoPrev, iPatrocinadora, fValorIR,
                                                   fVlrRendimento,-1, iOperacao) then
                       Raise Exception.Create('Não foi Possível gravar o Imposto da Operação.')
                 end
                 else
                 begin
                    if not Impostos.GravaIrLitigio(iTipoInvest, dDataOper, -1, sHistorico, -1,
                                                   iPlanoPrev, iPatrocinadora, fValorIR,
                                                   fVlrRendimento,-1, iOperacao) then
                       Raise Exception.Create('Não foi Possível gravar o Imposto da Operação.');
                 end
              end;
           end;

           Result := True;

         except
            //Al_123
            On E:Exception Do Begin
              MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
              Result := False;
            end;
         end;
      Finally
         OperComum.LimpaParametros(DmFundoComum.QryBuscaAplOrigem);
         OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
         qryTipoOper.Close;
         qryTipoOper.Free;
      end;
   End;
end;

//AL_128
// Função que efetua o par de lançamentos Contábeis e o lançamento de CAPCAR
Function ContabilizaOperFundos(iEmpresaProp, iModuloOrigem, iTipoInvest, iTipoOperacao,
                               iCarteira, iTipoFundo, iForCli, iTipoDespesa : integer;
                               Var iPlano, iPlanilha, iDocumento : Integer;
                               fValor: double;
                               dDataOper, dDataVenc : TDateTime;
                               sNaturMov, sTipoMov, sHistorico : string;
                               iFlgContaInvest   : Integer = 0;
                               wiPlanoPrevContab : Integer = 0;
                               wiPatrocinadora   : Integer = 0)  : Boolean;
Var
   iAchou, iPlanoPrev, iPatro, iNumFatura, iMoeda, iPortador, iNumLancamento, iTipoDoc: Integer;
   sMensagem, sComplemento, sStatus, sTipoTitulo, sOperacao, sContaDoc: String;
   //AL_49
   //AL_48
   bContab, bCapCar, bMostraMsg   : boolean;
   fNoDocumento : extended;
   // AL_193
   QryBuscaPlanPrevCtbPatro : TwwQuery;
begin
   //AL_49
   iNumFatura     :=  0;
   sOperacao      := '2';
   //AL_48
   bMostraMsg     := True;
   if iCarteira = 0 then iCarteira := -1;

   //AL_128
   if wiPlanoPrevContab  = 0 then
      wiPlanoPrevContab := iPlanoPrevContab;

   //AL_128
   if wiPatrocinadora    = 0 then
      wiPatrocinadora   := iPatrocinadora;

   //AL_48
   //Alt_23
   Try //Finally
      //AL_193
      QryBuscaPlanPrevCtbPatro := TwwQuery.Create(Application);
      QryBuscaPlanPrevCtbPatro.DatabaseName := 'BASEDADOS';
      // AL_193
      Try //Exception

         //AL_59
         //AL_134
         if not CtrlInvContab.TestaPeriodo(DateToStr(dDataOper)) then
            Raise Exception.Create(CtrlInvContab.MessageInfo);

         //AL_157
         if not BuscaTipoTitulo(iTipoFundo, iTipoInvest, '', sTipoTitulo, sComplemento) then
            Raise Exception.Create('Não foi possível determinar o Tipo de Título para contabilização');

         //Al_54
         If iTipoDespesa = 0 then
         begin
            //Verifica o Tipo de Operação para contabilização e financeiro
            With dmFundoComum.QryVerificaTipoOper Do
            Begin
               Close;
               ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOperacao;
               ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvest;
               Open;
               //AL_167
               bContab := (FieldByName('FLGGERACONTAB').AsInteger = 1);
               bCapCar := (FieldByName('FLGGERACAPCAR').AsInteger = 1);
               //AL_167
               iTipoDoc:= FieldByName('CODTIPDOC').AsInteger;
               Close;
            End;
         End
         //Al_55
         Else
         Begin
            With dmFundoComum.QryDespOper Do
            Begin
               Close;
               ParamByName('IDTIPODESPINVEST').AsInteger := iTipoDespesa;
               ParamByName('IDTIPOOPERACAO').AsInteger   := iTipoOperacao;
               ParamByName('IDTIPOINVEST').AsInteger     := iTipoInvest;
               Open;

               iTipoDoc := FieldByName('CODTIPDOC').AsInteger;
               bContab  := FieldByName('FLGGERACONTAB').AsInteger = 1;
               bCapCar  := FieldByName('FLGGERACAPCAR').AsInteger = 1;
               Close;
            End;
         End;

         //AL_193
         QryBuscaPlanPrevCtbPatro.Sql.Clear;
         QryBuscaPlanPrevCtbPatro.Sql.Add('SELECT VWP.IDPLANPREVCTBPATR FROM VWPLANPREVCTBPATR VWP');
         QryBuscaPlanPrevCtbPatro.Sql.Add('WHERE VWP.IDPLANOPREV = :IDPLANOPREV AND VWP.IDPATRO = :IDPATRO');
         QryBuscaPlanPrevCtbPatro.ParamByName('IDPLANOPREV').DataType := ftinteger;
         QryBuscaPlanPrevCtbPatro.ParamByName('IDPATRO').DataType := ftinteger;
         QryBuscaPlanPrevCtbPatro.ParamByName('IDPLANOPREV').AsInteger := wiPlanoPrevContab;
         QryBuscaPlanPrevCtbPatro.ParamByName('IDPATRO').AsInteger := wiPatrocinadora;
         QryBuscaPlanPrevCtbPatro.Open;

         //AL_49
         //AL_157
         //AL_193
         //Verifica o Padrão de lançamento


         iAchou := CtrlInvContab.BuscaPadrLanc.Executa(OperComum.RetornaSegmentacaoFdos(iTipoFundo,-1), //Renan CGPC,
                                                       dDataOper,iTipoInvest, iTipoOperacao, iTipoDespesa, -1, iCarteira,
                                                       QryBuscaPlanPrevCtbPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                       fValor, sTipoTitulo, sTipoMov);
         //AL_184
         if not CtrlInvContab.IntegraCtbFinModulo then
         begin
            Result := True;
            Exit;
         end;

         If Not bContab Then
            iAchou  := 0;

         //Alt_26
         //AL_38
         If (sTipoMov = 'DOP') and (iAchou = 0) and (bContab) Then
         Begin
            bContab := True;
            bCapCar := False;
            //Alt_26
         End;

         //AL_49
         //AL_157
         //AL_184
         If (bContab) then
             sHistorico        := CtrlInvContab.BuscaPadrLanc.Historico +' / '+ sComplemento +' - '+ sHistorico;
         //Al_46
         If iAchou <> 0 Then
         Begin
            If iAchou = -4 Then
               sMensagem := 'Ambigüidade no padrão de lançamento Contábil/Financeiro!'
            Else
               sMensagem := CtrlInvContab.BuscaPadrLanc.MessageInfo;   //Renan Cristiano Sol 130402 | Kintana 731769.

            Raise Exception.Create(sMensagem);

         End
         Else
         Begin
            //AL_128
            iPlanoPrev := wiPlanoPrevContab;
            iPatro     := wiPatrocinadora;

            //Al_58
            If (bContab) then
            Begin
               if iPlanilha  = -1 then
                  iPlanilha := 0;
               If not OperComum.LancamentoContabil(iEmpresaProp, iModuloOrigem,
                                                   CtrlInvContab.BuscaPadrLanc.Plano,
                                                   CtrlInvContab.BuscaPadrLanc.SubContaDeb,
                                                   CtrlInvContab.BuscaPadrLanc.SubContaCre,
                                                   CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                   iForCli, iPlanoPrev, iPatro,
                                                   CtrlInvContab.BuscaPadrLanc.ContaDeb,
                                                   CtrlInvContab.BuscaPadrLanc.ContaCre,
                                                   CtrlInvContab.BuscaPadrLanc.CentroCustoDeb,
                                                   CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                   sHistorico,
                                                   CtrlInvContab.BuscaPadrLanc.TipoPer,
                                                   CtrlInvContab.BuscaPadrLanc.RecPagNao,
                                                   dDataOper, fValor, bMostraMsg, iPlanilha, sMensagem) Then
                  Raise Exception.Create('Não foi possível efetuar o lançamento Contábil da operação. ' + #13 +
                                         'Mensagem: ' + sMensagem + #13 +
                                         'Entre em contato com a Contabilidade.');
               //AL_171
               if iPlanilha > 0 then
                  iPlano := CtrlInvContab.BuscaPadrLanc.Plano;
            End;

            If (bCAPCAR) then
            Begin
               //AL_157
               If iDocumento = -1 Then
               Begin
                  //AL_157
                  if CtrlInvContab.Documento.GetDocSequence then
                     iDocumento  := CtrlInvContab.Documento.CodDocumento;
                  iPortador   := -1;
                  CtrlInvContab.Documento.GetNoDocumento;
                  fNoDocumento := CtrlInvContab.Documento.NoDocumento;
                  //Al_181
                  sContaDoc := OperComum.IIF((CtrlInvContab.BuscaPadrLanc.RecPagNao = 'P'),
                                              CtrlInvContab.BuscaPadrLanc.ContaCre,
                                              CtrlInvContab.BuscaPadrLanc.ContaDeb);
                  sComplemento := '';
                  // Prepara um novo documento
                  CtrlInvContab.Documento.Prepare;

                  // Parametros para a Segregação
                  iPlano := CtrlInvContab.BuscaPadrLanc.Plano;
                  CtrlInvContab.Plano := iPlano;
                  CtrlInvContab.Patro := iPatro;
                  CtrlInvContab.PlanPrev := iPlanoPrev;
                  // Cria Documento
                  if not CtrlInvContab.Documento.SetValues(iDocumento, fNoDocumento,
                                                           sComplemento, sStatus, CtrlInvContab.BuscaPadrLanc.RecPagNao, sOperacao,
                                                           '' , '', sContaDoc,
                                                           CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                           '', '', '', '', '', '', '', '',
                                                           dDataVenc, dDataOper, dDataVenc, 0, 0, 0, 0, 0, 0, 0, 0,
                                                           iTipoDoc, Sistema.idEmpresa, iModuloOrigem, iForCli, iNumFatura, 0,
                                                           CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                           CtrlInvContab.BuscaPadrLanc.Plano,
                                                           0, 0, iMoeda, 0, -1, Sistema.idUsuario, Sistema.idEmpresa, 1, 0,
                                                           CtrlInvContab.BuscaPadrLanc.SubContaCre, iPortador,
                                                           0, 0, -1, dDataVenc, CtrlInvContab.CriterioSegregacao) then
                     //AL_158
                     Raise Exception.Create('Não foi possível criar um novo documento financeiro.' + #13 +
                                            'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);

                  //AL_164
                  CtrlInvContab.Documento.ContaInvest := iFlgContaInvest;
               End;

               //AL_157
               // Cria Rateio
               if not CtrlInvContab.Documento.RateioDocumSetValues(fValor, 0, 0, 0, Sistema.idEmpresa, iDocumento,
                                    CtrlInvContab.BuscaPadrLanc.UnidNegoc, 0, Sistema.idUsuario, 0,
                                    CtrlInvContab.BuscaPadrLanc.Plano, iPlanoPrev, iPatro, pRPI.IDPROGRAMA, 0,
                                    Sistema.idEmpresa, CtrlInvContab.BuscaPadrLanc.TipoRecDes, CtrlInvContab.BuscaPadrLanc.RecPagNao,
                                    CtrlInvContab.BuscaPadrLanc.CentroRespon, CtrlInvContab.BuscaPadrLanc.CentroCustoCred, '') then
                  //Al_158
                  Raise Exception.Create('Não foi possível lançar um rateio para o documento.' + #13 +
                                         'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);

            End;
         End;

         Result := True;
      except on E: Exception do
         begin
            Result := False;
            MsgDlg(E.Message,'Mensagem do Sistema ',mtInformation,[mbOK],0);
         end;
      end;
   Finally
      OperComum.LimpaParametros(DmFundoComum.QryTipoFundos);
      OperComum.LimpaParametros(DmFundoComum.QryVerificaTipoOper);
      QryBuscaPlanPrevCtbPatro.Close;
      FreeAndNil(QryBuscaPlanPrevCtbPatro);
   End;
End;

Function ContabilizaVariacao(iTipoFundo, iEmpresaProp, iModuloOrigem, iForCli : Integer;
                             dDataOper  : TDateTime;
                             bMostraMsg, bMostra : Boolean;
                             Var iPlano, iPlanilha, iDocumento : Integer;
                             var fValorLancto : Double) : Boolean;
Var
    fValor    : Double;
    iSegmentacao, iCarteira, iTipoOperacao : Integer;
    sTipoTitulo, sTipoMov, sComplemento  : String;
begin
   //AL_197
   //AL_153
   //Busca ultimo registro da aplicaçao atualizada
   ListaVariacaoFundo(iTipoInvestUsu, iTipoFundo,dDataOper);
   With DmFundoComum Do
   Begin
      If bMostra Then frmFechtoFundos.prbAtualizaFundos.Max := 0;
      If bMostra Then frmFechtoFundos.prbAtualizaFundos.StepIt;
      If bMostra Then frmFechtoFundos.prbAtualizaFundos.Max := QryVariacaoFundos.RecordCount;

      While Not QryVariacaoFundos.Eof Do
      Begin
         If bMostra Then Begin
            If Trim(frmFechtoFundos.lblDescFundo.Caption) <>
               Trim(QryVariacaoFundos.FieldByName('DESCFUNDOINVEST').AsString) Then
            Begin
               frmFechtoFundos.lblDescFundo.Caption := QryVariacaoFundos.FieldByName('DESCFUNDOINVEST').AsString;
               frmFechtoFundos.lblDescFundo.Repaint;
            End;
            frmFechtoFundos.prbAtualizaFundos.StepIt;
         End;

         iSegmentacao := OperComum.RetornaSegmentacaoFdos(QryVariacaoFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger,    //Renan CGPC28
                                                          -1);

         iCarteira := QryVariacaoFundos.FieldByName('IDCARTEIRAINVEST').AsInteger;
         fValor    := QryVariacaoFundos.FieldByName('VLRVARIACAO').AsFloat;
         sTipoMov  := '';

         If (QryVariacaoFundos.FieldByName('VLRVARIACAO').AsFloat <> 0)  Then
         Begin
            If QryVariacaoFundos.FieldByName('VLRVARIACAO').AsFloat  < 0 Then
               iTipoOperacao      := -13  //Atualização Negativa
            Else
               iTipoOperacao      := -12; //Atualização Positiva

            //AL_157
            if not BuscaTipoTitulo(iTipoFundo, iTipoInvestUsu, QryVariacaoFundos.FieldByName('DESCTIPOFUNDOINV').AsString,
                                   sTipoTitulo, sComplemento) then
               Raise Exception.Create('Não foi possível determinar o Tipo de Título para contabilização');

            If Not ContabilizaAtualizacao(iSegmentacao, iTipoOperacao, iEmpresaProp, iModuloOrigem,
                                          QryVariacaoFundos.FieldByName('IDTIPOINVEST').AsInteger,
                                          iCarteira, iForCli,
                                          QryVariacaoFundos.FieldByName('IDPLANOPREV').AsInteger,
                                          QryVariacaoFundos.FieldByName('IDPATRO').AsInteger,
                                          ABS(fValor),
                                          sTipoTitulo,
                                          Trim(QryVariacaoFundos.FieldByName('DESCTIPOFUNDOINV').AsString)+' - '+
                                          Trim(QryVariacaoFundos.FieldByName('DESCFUNDOINVEST').AsString)+' / '+
                                          Trim(QryVariacaoFundos.FieldByName('PLANPRVCONTABPATRO').AsString),
                                          dDataOper, True, iPlano, iPlanilha, iDocumento) Then
            Begin
               //Al_115
               OperComum.LimpaParametros(DmFundoComum.QryVariacaoFundos);
               Result := False;
               Exit;
            End;

            fValorLancto := fValorLancto + fValor;
         End;

         QryVariacaoFundos.Next;
      End;
      OperComum.LimpaParametros(DmFundoComum.QryVariacaoFundos);
   End;
   Result := True;
End;

//AL_197

Function ProcExcluiContabil(iPlano, iPlanilha : Integer) : Boolean;
Begin
   Result := True;
   if iPlanilha > 0 then
   begin
      Try
         with DmFundoComum do
         begin
            //AL_157 - Passa a valer a exclusão em 3 camadas
            //AL_168
            if not CtrlInvContab.InvExcluiLanc(iPlanilha, 0, Sistema.UsaPlanoPatro, False) then
               Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' + IntToStr(iPlanilha));
            //Alt_18
            // Deleta a IRLITIGIO
            OperComum.LimpaParametros(QryDelIrLitigio);
            QryDelIrLitigio.ParamByName('PLNCODIGO').AsInteger     := iPlanilha;
            QryDelIrLitigio.ExecSQL;
         end;

      Except
         //AL_135
         On E:Exception Do
         Begin
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         end;
      End;
   end;
End;

//AL_147
//--------------------------------------------------------------------------------------------------
//    Função com o processo de exclui os lançamentos de uma determinada Operação
//   (Finceiro/Tesouraria/Contabilidade)
function ProcExcluiFundo(iDocumento, iPlanilha, iPlano, iTipoInvest : longint;
                         dDataExclusao : TDateTime;
                         bMostraMsg    : boolean;
                         iOperacaoFundo : Integer = -1;
                         iIdPlanoPrev   : Integer = -1) : Boolean;
begin
   //AL_147
   if iIdPlanoPrev < 0 then
      iIdPlanoPrev := iPlanPrevCtbPatro;

   Result      := True;
   Try
      //Al_136
      with DmFundoComum do
      begin
         if (iPlanilha > 0) then
         begin
            //AL_137
            //Alt_18
            // Deleta Ir Litigio
            OperComum.LimpaParametros(QryDelIrLitigio);
            QryDelIrLitigio.ParamByName('PLNCODIGO').AsInteger      := iPlanilha;
            QryDelIrLitigio.ExecSQL;

            //Al_118
            OperComum.LimpaParametros(QryUpdOperacaoFundoContab);
            QryUpdOperacaoFundoContab.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvest;
            QryUpdOperacaoFundoContab.ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
            QryUpdOperacaoFundoContab.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataExclusao);
            //AL_147
            QryUpdOperacaoFundoContab.ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanoPrev;
            QryUpdOperacaoFundoContab.ExecSQL;
         End;

         //Alt_18
         If iOperacaoFundo > 0  Then
         begin
            OperComum.LimpaParametros(QryDelIncorporacaoFundo);
            QryDelIncorporacaoFundo.ParamByName('IDOPERACAOFUNDO').AsInteger := iOperacaoFundo;
            QryDelIncorporacaoFundo.ExecSQL;
         end;

         //Prepara para Exclui Documento da Tesouraria
         if iDocumento > 0 then
         begin
            //Al_118
            OperComum.LimpaParametros(QryUpdOperacaoFundoFinanc);
            QryUpdOperacaoFundoFinanc.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvest;
            QryUpdOperacaoFundoFinanc.ParamByName('CODDOCUMENTO').AsInteger      := iDocumento;
            QryUpdOperacaoFundoFinanc.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataExclusao);
            //AL_147
            QryUpdOperacaoFundoFinanc.ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanoPrev;
            QryUpdOperacaoFundoFinanc.ExecSQL;
         end;
      end;

      //AL_158
      //AL_168
      // Exclui Documento da Tesouraria
      if iDocumento > 0 then
      begin
         //AL_168
         if not CtrlInvContab.Documento.Delete(iDocumento) then
            Raise Exception.Create('Não foi possível excluir o documento financeiro.' + #13 +
                                   CtrlInvContab.Documento.MessageInfo);
      end;

      // Exclui Planilha da Contabilidade
      if (iPlanilha > 0) then
      begin
         If Not ProcExcluiContabil(iPlano, iPlanilha) Then
            Raise Exception.Create('Não foi Possível efetuar a exclusão contábil da Operação.');
      end;

   except
      //AL_135
      On E:Exception Do
      Begin
         if bMostraMsg then
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0)
         else
            Raise;

         Screen.Cursor := crDefault;

         Result := False;
      end;
   end;
end;

procedure MensagemErroPeriodo(iErroPeriodo: integer);
begin
   case iErroPeriodo of
      1: MsgDlg('O período escolhido não existe.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      2: MsgDlg('O período escolhido existe mas não é único.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      3: MsgDlg('O período escolhido está bloqueado.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      4: MsgDlg('O período escolhido está bloqueado.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
   end;
end;

Function ContabilizaProvIRRF(iTipoFundo: Integer; dDataAtual   : TDateTime;
                             Var iPlano, iPlanilha, iDocumento : Integer;
                             var fValorLancto : Double)        : Boolean;
Var
  iSegmentacao, iTipoOperacao, iCarteira : Integer;
  fValor        : Double;
  sTipoTitulo, sComplemento   : String;
begin
   With DmFundoComum Do
   Begin
      //AL_153
      OperComum.LimpaParametros(DmFundoComum.QryTipoFundos);
      QryTipoFundos.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      QryTipoFundos.ParamByName('IDTIPOFUNDOINVEST').AsInteger := iTipoFundo;
      QryTipoFundos.Open;
      While Not QryTipoFundos.EOF Do
      Begin
         //Provisão de IRRF
         iTipoOperacao := -32;

         OperComum.LimpaParametros(DmFundoComum.QryProvIRRF);
         QryProvIRRF.ParamByName('DATAMOVFUNDO').AsDateTime        := dDataAtual;
         QryProvIRRF.ParamByName('IDTIPOFUNDOINVEST').AsInteger    :=
                               QryTipoFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
         QryProvIRRF.Open;
         While Not QryProvIRRF.EOF Do
         Begin
            fValor := QryProvIRRF.FieldByName('VLRIRPROV').AsFloat;

            If fValor = 0 Then
            Begin
               OperComum.LimpaParametros(DmFundoComum.QryPgtoIrLitigio);
               QryPgtoIrLitigio.ParamByName('DATAMOVFUNDO').AsDateTime        := dDataAtual;
               QryPgtoIrLitigio.ParamByName('IDTIPOFUNDOINVEST').AsInteger    :=
                                  QryTipoFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
               QryPgtoIrLitigio.Open;
               fValor := QryPgtoIrLitigio.FieldByName('VLRIRPROV').AsFloat;
               OperComum.LimpaParametros(DmFundoComum.QryPgtoIrLitigio);
            End;

            //AL_157
            if not BuscaTipoTitulo(iTipoFundo, iTipoInvestUsu, QryTipoFundos.FieldByName('DESCTIPOFUNDOINV').AsString,
                                   sTipoTitulo, sComplemento) then
            Begin
               MsgDlg('Não foi possível determinar o Tipo de Título para contabilização :'+#13+
                      sTipoTitulo, 'Mensagem do Sistema', mtInformation, [mbOk], 0);
               //Al_115
               OperComum.LimpaParametros(DmFundoComum.QryPgtoIrLitigio);
               OperComum.LimpaParametros(DmFundoComum.QryTipoFundos);
               OperComum.LimpaParametros(DmFundoComum.QryProvIRRF);
               Result := False;
               Exit;
            End;

            iSegmentacao := OperComum.RetornaSegmentacaoFdos(-1,
                                                             QryProvIRRF.FieldByName('IDFUNDOINVEST').AsInteger);       //Renan CGPC28

            If fValor <> 0 Then
            Begin
               If Not ContabilizaAtualizacao(iSegmentacao, iTipoOperacao, Sistema.IdEmpresa, Sistema.IdModulo,
                                             QryTipoFundos.FieldByName('IDTIPOINVEST').AsInteger,
                                             QryProvIRRF.FieldByName('IDCARTEIRAINVEST').AsInteger, -1,
                                             QryProvIRRF.FieldByName('IDPLANOPREV').AsInteger,
                                             QryProvIRRF.FieldByName('IDPATRO').AsInteger,
                                             fValor,
                                             sTipoTitulo,
                                             Trim(QryTipoFundos.FieldByName('DESCTIPOFUNDOINV').AsString)+' / '+
                                             Trim(QryProvIRRF.FieldByName('PLANPRVCONTABPATRO').AsString),
                                             dDataAtual, True, iPlano, iPlanilha, iDocumento) Then
               Begin
                  //Al_115
                  OperComum.LimpaParametros(DmFundoComum.QryPgtoIrLitigio);
                  OperComum.LimpaParametros(DmFundoComum.QryTipoFundos);
                  OperComum.LimpaParametros(DmFundoComum.QryProvIRRF);
                  Result := False;
                  Exit;
               End;
            End;

            fValorLancto := fValorLancto - fValor;

            QryProvIRRF.Next;
         End;

         QryTipoFundos.Next;
      End;
      OperComum.LimpaParametros(DmFundoComum.QryPgtoIrLitigio);
      OperComum.LimpaParametros(DmFundoComum.QryTipoFundos);
      OperComum.LimpaParametros(DmFundoComum.QryProvIRRF);
   End;
   Result := True;
end;

Function ContabilizaProvRevIOF(iTipoFundo : Integer; dDataAtual  : TDateTime;
                               Var iPlano, iPlanilha, iDocumento : Integer;
                               Var fValorLancto : Double)        : Boolean;
Var
   dDataAnterior              : TDateTime;
   fVlrIOF                    : Double;
   iSegmentacao, iTipoOperacao      : Integer;
   sTipoTitulo, sComplemento  : String;
begin
   dDataAnterior    := dDataAtual-1;
   While not DiasUteisInv.DiaUtil(dDataAnterior,-1,1,'',True,False,False) Do
      dDataAnterior := dDataAnterior - 1;

   With DmFundoComum Do
   Begin
      OperComum.LimpaParametros(DmFundoComum.QryPatroPlanPrevContab);
      QryPatroPlanPrevContab.Open;
      //AL_153
      OperComum.LimpaParametros(DmFundoComum.QryTipoFundos);
      QryTipoFundos.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryTipoFundos.ParamByName('IDTIPOFUNDOINVEST').AsInteger := iTipoFundo;
      QryTipoFundos.Open;

      While Not QryTipoFundos.EOF Do
      Begin
         QryPatroPlanPrevContab.First;
         While Not QryPatroPlanPrevContab.EOF Do
         Begin
            fVlrIOF   := 0;
            OperComum.LimpaParametros(DmFundoComum.QryProvIOF);
            QryProvIOF.ParamByName('DATAMOVFUNDO').AsString          := DateToStr(dDataAtual);
            QryProvIOF.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
            QryProvIOF.ParamByName('IDTIPOFUNDOINVEST').AsInteger    :=
                                  QryTipoFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
            QryProvIOF.ParamByName('IDPLANPREVCTBPATR').AsInteger    :=
                                  QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            QryProvIOF.Open;

            fVlrIOF   := QryProvIOF.FieldByName('VLRIOFPROV').AsFloat;

            OperComum.LimpaParametros(DmFundoComum.QryProvIOF);
            QryProvIOF.ParamByName('DATAMOVFUNDO').AsString          := DateToStr(dDataAnterior);
            QryProvIOF.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
            QryProvIOF.ParamByName('IDTIPOFUNDOINVEST').AsInteger    :=
                                  QryTipoFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
            QryProvIOF.ParamByName('IDPLANPREVCTBPATR').AsInteger    :=
                                  QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            QryProvIOF.Open;

            fVlrIOF   := fVlrIOF-QryProvIOF.FieldByName('VLRIOFPROV').AsFloat;

            OperComum.LimpaParametros(DmFundoComum.QryProvIOF);

            //AL_157
            if not BuscaTipoTitulo(iTipoFundo, iTipoInvestUsu, QryTipoFundos.FieldByName('DESCTIPOFUNDOINV').AsString,
                                   sTipoTitulo, sComplemento) then
            Begin
               MsgDlg('Não foi possível determinar o Tipo de Título para contabilização :'+#13+
                      sTipoTitulo, 'Mensagem do Sistema', mtInformation, [mbOk], 0);
               //Al_115
               OperComum.LimpaParametros(DmFundoComum.QryTipoFundos);
               OperComum.LimpaParametros(DmFundoComum.QryProvIOF);
               OperComum.LimpaParametros(DmFundoComum.QryPatroPlanPrevContab);
               Result := False;
               Exit;
            End;

            iSegmentacao := OperComum.RetornaSegmentacaoFdos(iTipoFundo, -1);  //Renan CGPC28

            If (fVlrIOF > 0) Then
            Begin
               // Provisão de IOF
               iTipoOperacao := -29;

               If Not ContabilizaAtualizacao(iSegmentacao, iTipoOperacao, Sistema.IdEmpresa, Sistema.IdModulo,
                                             QryTipoFundos.FieldByName('IDTIPOINVEST').AsInteger,
                                             -1, -1,
                                             QryPatroPlanPrevContab.FieldByName('IDPLANOPREV').AsInteger,
                                             QryPatroPlanPrevContab.FieldByName('IDPATRO').AsInteger,
                                             fVlrIOF, sTipoTitulo,
                                             Trim(QryTipoFundos.FieldByName('DESCTIPOFUNDOINV').AsString)+' / '+
                                             Trim(QryPatroPlanPrevContab.FieldByName('PLANPRVCONTABPATRO').AsString),
                                             dDataAtual, True, iPlano, iPlanilha, iDocumento) Then
               Begin
                  //Al_115
                  OperComum.LimpaParametros(DmFundoComum.QryTipoFundos);
                  OperComum.LimpaParametros(DmFundoComum.QryProvIOF);
                  OperComum.LimpaParametros(DmFundoComum.QryPatroPlanPrevContab);
                  Result := False;
                  Exit;
               End;
            End;

            If (fVlrIOF < 0) Then
            Begin
               // Reversão de IOF
               iTipoOperacao := -28;

               If Not ContabilizaAtualizacao(iSegmentacao, iTipoOperacao, Sistema.IdEmpresa, Sistema.IdModulo,
                                             QryTipoFundos.FieldByName('IDTIPOINVEST').AsInteger,
                                             -1, -1,
                                             QryPatroPlanPrevContab.FieldByName('IDPLANOPREV').AsInteger,
                                             QryPatroPlanPrevContab.FieldByName('IDPATRO').AsInteger,
                                             ABS(fVlrIOF),
                                             sTipoTitulo,
                                             Trim(QryTipoFundos.FieldByName('DESCTIPOFUNDOINV').AsString)+' / '+
                                             Trim(QryPatroPlanPrevContab.FieldByName('PLANPRVCONTABPATRO').AsString),
                                             dDataAtual, True, iPlano, iPlanilha, iDocumento) Then
               Begin
                  //Al_115
                  OperComum.LimpaParametros(DmFundoComum.QryTipoFundos);
                  OperComum.LimpaParametros(DmFundoComum.QryProvIOF);
                  OperComum.LimpaParametros(DmFundoComum.QryPatroPlanPrevContab);
                  Result := False;
                  Exit;
               End;
            End;

            fValorLancto := fValorLancto + fVlrIOF;
            QryPatroPlanPrevContab.Next;
         End;
         QryTipoFundos.Next;
      End;

      //Al_115
      OperComum.LimpaParametros(DmFundoComum.QryTipoFundos);
      OperComum.LimpaParametros(DmFundoComum.QryProvIOF);
      OperComum.LimpaParametros(DmFundoComum.QryPatroPlanPrevContab);
   End;
   Result := True;
end;

Function ContabilizaAtualizacao(iSegmentacao, iTipoOperacao, iEmpresaProp, iModuloOrigem,
                                iTipoInvest, iCarteira, iForCli, iPlanoPrev, iPatro : Integer;
                                fValor      : Double;
                                sTipoTitulo, sDescFundos : String;
                                dDataOper   : TDateTime;
                                bMostraMsg  : Boolean;
                                var iPlano, iPlanilha, iDocumento : Integer) : Boolean;
var
   bContab, bCapCar : Boolean;

   iSubContaDeb, iSubContaCred, iUnidNegoc, iOperacao, iNumLancamento,
   iTipoDoc, iUnidNegocOp, iAchou,
   iPortador, iNumFatura, iTipoDespesa, iMoeda : Integer;

   sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred, sCentroRespon,
   sMensagem, sHistorico, sContaDoc,

   sTipoRecDes, sTipoPer, sRecPag, sTipoMov, sSubContaCred, sDebCre,
   sComplemento, sStatus, sOperacao : String;

 //  iSegmentacao : Integer;  //RENAN CGPC
// AL_193
   QryBuscaPlanPrevCtbPatro: TwwQuery;
   QryBuscaSegmentacao: TwwQuery;   //RENAN CGPC
begin
   Result := True;

   {////////// RENAN CGPC //////////
   if iTipoInvest > 4 then begin // Somente Fundos
     QryBuscaSegmentacao := TwwQuery.Create(Application);
     QryBuscaSegmentacao.DatabaseName := 'BASEDADOS';

     QryBuscaSegmentacao.Close;
     QryBuscaSegmentacao.Sql.Clear;
     QryBuscaSegmentacao.Sql.Add('SELECT IDSEGMENTACAO FROM SEGMENTACAOMERCADO');
     QryBuscaSegmentacao.Sql.Add('WHERE IDTIPOINVEST = ' + intToStr(iTipoInvest));
     QryBuscaSegmentacao.Open;

     iSegmentacao := QryBuscaSegmentacao.FieldByName('IDSEGMENTACAO').AsInteger;
   end;
   ////////// RENAN CGPC //////////    }

   //iSegmentacao := RetornaSegmentacaoFdos(iTipoInvest, sTipoTitulo);

   //Alt_23
   Try //Finally
      // AL_193
      QryBuscaPlanPrevCtbPatro := TwwQuery.Create(Application);
      QryBuscaPlanPrevCtbPatro.DatabaseName := 'BASEDADOS';
      // AL_193
      Try//Except
         // AL_59
         //AL_134
         if not CtrlInvContab.TestaPeriodo(DateToStr(dDataOper)) then
            Raise Exception.Create(CtrlInvContab.MessageInfo);

         iTipoDespesa := 0;
         iUnidNegocOp := 0;
         iNumFatura   := 0;
         iMoeda       := 0;
         //Verifica o Tipo de Operação para contabilização e financeiro
         With dmFundoComum.QryVerificaTipoOper Do
         Begin
            Close;
            ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOperacao;
            ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvest;
            Open;
            bContab := (FieldByName('FLGGERACONTAB').AsInteger = 1);
            bCapCar := (FieldByName('FLGGERACAPCAR').AsInteger = 1);
            iTipoDoc:=  FieldByName('CODTIPDOC').AsInteger;
            Close;
         End;

         //AL_184
         if not CtrlInvContab.IntegraCtbFinModulo then
         begin
            Result := True;
            Exit;
         end;

         //Verifica o Padrão de lançamento
         //AL_157
         If (bContab) then
         begin
            //AL_193
            QryBuscaPlanPrevCtbPatro.Sql.Clear;
            QryBuscaPlanPrevCtbPatro.Sql.Add('SELECT VWP.IDPLANPREVCTBPATR FROM VWPLANPREVCTBPATR VWP');
            QryBuscaPlanPrevCtbPatro.Sql.Add('WHERE VWP.IDPLANOPREV = :IDPLANOPREV AND VWP.IDPATRO = :IDPATRO');
            QryBuscaPlanPrevCtbPatro.ParamByName('IDPLANOPREV').DataType := ftinteger;
            QryBuscaPlanPrevCtbPatro.ParamByName('IDPATRO').DataType := ftinteger;
            QryBuscaPlanPrevCtbPatro.ParamByName('IDPLANOPREV').AsInteger := iPlanoPrev;
            QryBuscaPlanPrevCtbPatro.ParamByName('IDPATRO').AsInteger := iPatro;
            QryBuscaPlanPrevCtbPatro.Open;
            iAchou := CtrlInvContab.BuscaPadrLanc.Executa(iSegmentacao, //Renan CGPC
                                                          dDataOper, iTipoInvest, iTipoOperacao, iTipoDespesa, -1, -1,
                                                          QryBuscaPlanPrevCtbPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                          fValor, sTipoTitulo, 'OPE');
            iPlano := CtrlInvContab.BuscaPadrLanc.Plano;
         end
         Else
            iAchou := 0;
         //AL_184
         If (bContab) then
            sHistorico        := CtrlInvContab.BuscaPadrLanc.Historico + ' - ' + sDescFundos;

         If iAchou <> 0 Then
         Begin
            //Al_115
            If iAchou = -4 Then
            Begin
               If bMostraMsg then
                  MsgDlg('Ambigüidade no Padrão de Lançamento Contábil/Financeiro para a Atualização!'+#13+
                         'Verifique a Parametrização.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);

               Result := False;
            end
            Else If iAchou = -5 Then
            Begin
               If bMostraMsg then
                  MsgDlg( CtrlInvContab.BuscaPadrLanc.MessageInfo +#13+  //Renan Cristiano Sol 130402 | Kintana 731769.
                         'Verifique a Parametrização.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);

               Result := False;
            end
            else
               Result := True;

            Exit;
         End
         Else
         Begin
            If (bContab) then
            Begin
               if iPlanilha  = -1 then
                  iPlanilha := 0;
               //AL_157
               If not OperComum.LancamentoContabil(iEmpresaProp, iModuloOrigem,
                                                   CtrlInvContab.BuscaPadrLanc.Plano,
                                                   CtrlInvContab.BuscaPadrLanc.SubContaDeb,
                                                   CtrlInvContab.BuscaPadrLanc.SubContaCre,
                                                   CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                   iForCli, iPlanoPrev, iPatro,
                                                   CtrlInvContab.BuscaPadrLanc.ContaDeb,
                                                   CtrlInvContab.BuscaPadrLanc.ContaCre,
                                                   CtrlInvContab.BuscaPadrLanc.CentroCustoDeb,
                                                   CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                   sHistorico,
                                                   CtrlInvContab.BuscaPadrLanc.TipoPer,
                                                   CtrlInvContab.BuscaPadrLanc.RecPagNao,
                                                   dDataOper, fValor, bMostraMsg, iPlanilha, sMensagem) Then
               Begin
                  //Al_115
                  If bMostraMsg then
                     MsgDlg('Não foi possível efetuar o lançamento contábil!', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
                  Result := False;
                  Exit;
               End;
            End;

            //Ricardo Cristiano - 22/09/2011 SOL 165362 - KINTANA 1431423 - implementação para não integrar o financeiro da operação de Integralização de Cotas            
            // SOL 166338.6801 Kintana 1451970 Otacilio Aquino
            if ((iTipoOperacao <> -100) and (iTipoOperacao <> -105) and (iTipoOperacao <> -1005)) then
            begin
               //AL_157
               If (bCAPCAR) and (iDocumento = -1) then
               Begin
                  if CtrlInvContab.Documento.GetDocSequence then
                     iDocumento  := CtrlInvContab.Documento.CodDocumento;
                  iPortador    := -1;
                  CtrlInvContab.Documento.GetNoDocumento;
                  // Prepara um novo documento
                  CtrlInvContab.Documento.Prepare;
                  if CtrlInvContab.BuscaPadrLanc.RecPagNao = 'P' then
                     sContaDoc := CtrlInvContab.BuscaPadrLanc.ContaCre
                  else
                     sContaDoc := CtrlInvContab.BuscaPadrLanc.ContaDeb;

                  // Parametros para a Segregação
                  CtrlInvContab.Plano := iPlano;
                  CtrlInvContab.Patro := iPatro;
                  CtrlInvContab.PlanPrev := iPlanoPrev;
                  // Cria Documento
                  if not CtrlInvContab.Documento.SetValues(iDocumento, CtrlInvContab.Documento.NoDocumento,
                                                           sComplemento, sStatus, CtrlInvContab.BuscaPadrLanc.RecPagNao, sOperacao,
                                                           '' , '', sContaDoc,
                                                           CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                           '', '', '', '', '', '', '', '',
                                                           dDataOper, dDataOper, dDataOper, 0, 0, 0, 0, 0, 0, 0, 0,
                                                           iTipoDoc, Sistema.idEmpresa, iModuloOrigem, iForCli, iNumFatura, 0,
                                                           CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                           CtrlInvContab.BuscaPadrLanc.Plano,
                                                           0, 0, iMoeda, 0, -1, Sistema.idUsuario, Sistema.idEmpresa, 1, 0,
                                                           CtrlInvContab.BuscaPadrLanc.SubContaCre, iPortador,
                                                           0, 0, -1, dDataOper, CtrlInvContab.CriterioSegregacao) then
                  begin
                     If bMostraMsg then
                        //AL_158
                        MsgDlg('Não foi possível criar um novo documento financeiro.' + #13 +
                               'Mensagem: ' + CtrlInvContab.Documento.MessageInfo,
                               'Mensagem do Sistema', mtInformation, [mbOk], 0);
                     Result := False;
                     Exit;
                  end;
               End;

               If ( (bCAPCAR) and (CtrlInvContab.BuscaPadrLanc.RecPagNao <> 'N') ) then
               Begin
                  if not CtrlInvContab.Documento.RateioDocumSetValues(fValor, 0, 0, 0, Sistema.idEmpresa, iDocumento,
                                                                      0, 0, Sistema.idUsuario, 0,
                                                                      CtrlInvContab.BuscaPadrLanc.Plano, iPlanoPrev, iPatro, pRPI.IDPROGRAMA, 0,
                                                                      Sistema.idEmpresa, CtrlInvContab.BuscaPadrLanc.TipoRecDes,
                                                                      CtrlInvContab.BuscaPadrLanc.RecPagNao,
                                                                      CtrlInvContab.BuscaPadrLanc.CentroRespon,
                                                                      CtrlInvContab.BuscaPadrLanc.CentroCustoCred, '') then
                  begin
                     If bMostraMsg then
                        //AL_158
                        MsgDlg('Não foi possível lançar um rateio de documento.' + #13 +
                               'Mensagem: ' + CtrlInvContab.Documento.MessageInfo,
                               'Mensagem do Sistema', mtInformation, [mbOk], 0);
                     Result := False;
                     Exit;
                  end;
               End;
            End;
         End;

         Result := True;
      Except
         //AL_174
         On E:Exception do
         begin
            if bMostraMsg then
               MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         end;
      End;
   Finally
      OperComum.LimpaParametros(DmFundoComum.QryVerificaTipoOper);
      QryBuscaPlanPrevCtbPatro.Close;
      QryBuscaPlanPrevCtbPatro.Free;
   end;
End;

Function CriarLanctoDocumentoAtu(fValor : Double;
                                 dDataOper   : TDateTime;
                                 iTipoFundo, iPlano, iPlanilha, iDocumento : Integer) : Boolean;
var sDebCre : String;
Begin
   Result := True;
   Try //Except
      If (iDocumento <> -1) then
      Begin
         //AL_157
         If fValor > 0 Then
            sDebCre := 'C'
         Else
            sDebCre := 'D';

         if not CtrlInvContab.Documento.LancoDocumSetValues(
                              dDataOper, iDocumento, 0 {iNumLancamento},
                              fValor {Valor Liquido}, 0{rValorOM}, fValor,
                              CtrlInvContab.BuscaPadrLanc.UnidNegoc, iPlanilha, 0{liNumlotemanual},
                              Sistema.idUsuario, Sistema.idEmpresa,
                              0{liIdnflivro}, 0{liEstorno}, 0 {?iTipoDocDs?}, 0{liCoddocinss}, 0{liCodalterador},
                              ''{sOperacao}, ''{sNumrecibo}, ''{sNumnf}, ''{sNumfatura},
                              ''{sHistorico}, ''{sFlgtipofatura}, ''{sFlgrecebeunf}, ''{sFlgfatemitida},
                              sDebcre, Sistema.IdModulo, iPlano,
                              Sistema.UsaPlanoPatro) then
            //AL_158
            Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
         //AL_157
      End;
      With DmFundoComum.QryUpdHistFundoAtu Do
      Begin
         Close;
         //Renan Cristiano Sol 129607 | Kintana 717461 Inicio.
         ParamByName('DATAMOVFUNDO').AsString          := DateToStr(dDataOper);
         //Renan Cristiano Sol 129607 | Kintana 717461 Fim.
         ParamByName('IDTIPOFUNDOINVEST').AsInteger    := iTipoFundo;
         If iPlanilha <> -1 then
         Begin
            ParamByName('PLANO').AsInteger             := iPlano;
            ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
         End
         Else
         Begin
            ParamByName('PLANO').Clear;
            ParamByName('PLNCODIGO').Clear;
         End;

         If iDocumento <> -1 then
            ParamByName('CODDOCUMENTO').AsInteger      := iDocumento
         Else
            ParamByName('CODDOCUMENTO').Clear;

         ExecSQL;
         Close;
      End;
      Result := True;
   Except
      Result := False;
   End;
End;

//AL_53
Function CriarLanctoDocumentoOpe(fValor      : Double;
                                 dDataOper   : TDateTime;
                                 iTipoInvest, iTipoOper, iPlano, iPlanilha, iDocumento : Integer;
                                 sHistorico, sRecPag   : String;
                                 bDoc        : Boolean;
                                 iTipoCota   : Integer = -1) : Boolean;
var
   sOperacao, sDebCre, sDescTipoOper : String;
   iNumLancamento     : Integer;
Begin
   sOperacao := '2';

   //Alt_23
   Try //Except
      If (iDocumento <> -1) then
      Begin
         If sRecPag[1] = 'P' Then
            sDebCre := 'C'
         Else
            sDebCre := 'D';

         //AL_52
         OperComum.LimpaParametros(DmFundoComum.QryVerificaTipoOper);
         with DmFundoComum.QryVerificaTipoOper do
         begin
            ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvest;
            ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOper;
            Open;
            sDescTipoOper := FieldByName('DESCTIPOOPERACAO').AsString;
            Close;
         end;

         sHistorico := Trim(sDescTipoOper) +' / '+sHistorico;

         // AL_86 - Cria LanctoDocum em 3 camadas
         if not CtrlInvContab.Documento.LancoDocumSetValues(
                              dDataOper, iDocumento, 0 {iNumLancamento},
                              fValor {Valor Liquido}, 0{rValorOM}, fValor,
                              CtrlInvContab.BuscaPadrLanc.UnidNegoc, CtrlInvContab.Planilha, 0{liNumlotemanual},
                              Sistema.idUsuario, Sistema.idEmpresa,
                              0{liIdnflivro}, 0{liEstorno}, 0 {?iTipoDocDs?}, 0{liCoddocinss}, 0{liCodalterador},
                              sOperacao,  ''{sNumrecibo}, ''{sNumnf}, ''{sNumfatura},
                              sHistorico, ''{sFlgtipofatura}, ''{sFlgrecebeunf}, ''{sFlgfatemitida},
                              sDebcre, Sistema.IdModulo, iPlano,
                              Sistema.UsaPlanoPatro) then
            Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

      End;

      Result := True;
   Except
      Result := False;
   End;
End;

//AL_109
Function UltimoDiaMes(Year, Month : Integer) : TDateTime;
Var
   dDtaUltDiaMes : TDateTime;
Begin

   dDtaUltDiaMes :=  DiasUteisInv.UltDiaMes(Year, Month);

   While not DiasUteisInv.DiaUtil(dDtaUltDiaMes,-1,1,'',True,False,False) Do
       dDtaUltDiaMes := dDtaUltDiaMes  - 1;

   Result := dDtaUltDiaMes;
End;

//AL_138
//Rotina para exclusão de toda a movimentação de uma daterminada data para frente
Function ExcluiMovimento(iIdTipoInvest, iIdPlanPrevCtbPatr, iIdFundoInvest : Integer;
                         dDataAplicacao, dDataMovFundo : TDateTime;
                         bExibeErro, bExibeProgresso : Boolean;
                         iTipoCota : Integer = -1): Boolean;
var qryMovimento : TwwQuery;
    wComita : Boolean;
begin

   wComita := True;

   qryMovimento := TwwQuery.Create(Application);
   qryMovimento.DatabaseName := 'BaseDados';
   qryMovimento.SQL.Add('SELECT CODDOCUMENTO, PLNCODIGO, PLANO, IDTIPOINVEST, DATAMOVFUNDO FROM HISTFUNDO ');
   qryMovimento.SQL.Add('WHERE (IDTIPOINVEST      = ' + IntToStr(iIdTipoInvest)  + ') AND ');
   qryMovimento.SQL.Add('      (IDPLANPREVCTBPATR = ' + IntToStr(iIdPlanPrevCtbPatr) + ') AND ');
   qryMovimento.SQL.Add('      (IDFUNDOINVEST     = ' + IntToStr(iIdFundoInvest) + ') AND ');
   qryMovimento.SQL.Add('      (DATAAPLICACAO     = TO_DATE(''' + DateToStr(dDataAplicacao)+''',''dd/mm/yyyy'' )) AND ');
   qryMovimento.SQL.Add('      (DATAMOVFUNDO      > TO_DATE(''' + DateToStr(dDataMovFundo)+''',''dd/mm/yyyy'' ))');
   if iTipoCota > 0  then
      qryMovimento.SQL.Add('  AND (IDTIPOCOTA = ' + IntToStr(iTipoCota) + ') ');                                     
   qryMovimento.SQL.Add('ORDER BY IDTIPOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST, DATAAPLICACAO, DATAMOVFUNDO, IDTIPOCOTA, IDHISTFUNDO');
   qryMovimento.Prepare;
   qryMovimento.Open;
   qryMovimento.First;

   if bExibeProgresso then
   begin
      frmAguarde.Pos := 0;
      frmAguarde.Max := qryMovimento.RecordCount;
      frmAguarde.Mostra('Aguarde, Excluindo Movimentação...');
   end;

   Try
      // Se já houver uma transação, deixa o commit para a rotina que chamou.
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction
      else wComita := False;

      while not qryMovimento.Eof do
      begin
         // Exclui movimento Contábil / Financeiro
         if not ProcExcluiFundo(qryMovimento.FieldByName('CODDOCUMENTO').AsInteger,
                                qryMovimento.FieldByName('PLNCODIGO').AsInteger,
                                qryMovimento.FieldByName('PLANO').AsInteger,
                                qryMovimento.FieldByName('IDTIPOINVEST').AsInteger,
                                qryMovimento.FieldByName('DATAMOVFUNDO').AsDateTime, True) Then
            Raise Exception.Create('Não foi possível excluir a integração Contábil e Financeira.');

         qryMovimento.Next;

         if bExibeProgresso then
            frmAguarde.Pos := frmAguarde.Pos + 1;
      end;

      qryMovimento.Close;
      qryMovimento.SQL.Clear;
      qryMovimento.SQL.Add('DELETE FROM HISTFUNDO ');
      qryMovimento.SQL.Add('WHERE (IDTIPOINVEST      = ' + IntToStr(iIdTipoInvest)  + ') AND ');
      qryMovimento.SQL.Add('      (IDPLANPREVCTBPATR = ' + IntToStr(iIdPlanPrevCtbPatr) + ') AND ');
      qryMovimento.SQL.Add('      (IDFUNDOINVEST     = ' + IntToStr(iIdFundoInvest) + ') AND ');
      qryMovimento.SQL.Add('      (DATAAPLICACAO     = TO_DATE(''' + DateToStr(dDataAplicacao)+''',''dd/mm/yyyy'')) AND ');
      qryMovimento.SQL.Add('      (DATAMOVFUNDO      > TO_DATE(''' + DateToStr(dDataMovFundo)+''',''dd/mm/yyyy''))');
      if iTipoCota > 0  then
         qryMovimento.SQL.Add('  AND (IDTIPOCOTA     = ' + IntToStr(iTipoCota) + ') ');
      qryMovimento.Prepare;
      qryMovimento.ExecSQL;

      if wComita then
         dtmBaseDados.dbBaseDados.Commit;

      Result := True;

   except
      on E:Exception do begin
         if bExibeErro then
            MsgDlg('Não foi possível excluir o Movimento!'#13+
                   'Com a Mensagem:'#13+
                   E.Message,'Mensagem do Sistema', mtInformation,[mbOk],0);
         // Cancela Transação
         dtmBaseDados.dbBaseDados.Rollback;
         Result := False;
      end;
   end;

   if bExibeProgresso then
      frmAguarde.Apaga;
end;

Function CotizaAplicacao(dData : TDateTime; iFundo, iPlano, iTipoFundoInvest : Integer) : Boolean;
Var
   fQtdOperacao : Double;
   sMens : String;
Begin
   Result := True;
   With DmFundoComum Do
   Begin
      //Al_178
      Try
         OperComum.LimpaParametros(DmFundoComum.QryCotizaAplicacao);
         //Ricardo Cristiano - 11/01/2010 - N. Sol 129463 -  N. Kintana 709981
         QryCotizaAplicacao.ParamByName('DATACOTIZACAO').AsString   := DateToStr(dData);
         If iFundo > 0 Then
            QryCotizaAplicacao.ParamByName('IDFUNDOINVEST').AsInteger := iFundo;

         If iPlano > 0 Then
            QryCotizaAplicacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
         //Ricardo Cristiano - 07/01/2010 - N. Sol 129265 -  N. Kintana 707133
         QryCotizaAplicacao.Open;

         //Al_71
         While Not QryCotizaAplicacao.EOF Do
         Begin
            //Al_71
            OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
            QryVlrCota.ParamByName('DATACOTA').AsDateTime     := dData;
            QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger :=
                       QryCotizaAplicacao.FieldByName('IDFUNDOINVEST').AsInteger;
            QryVlrCota.Open;
            If QryVlrCota.FieldByName('VLRCOTA').AsFloat       = 0 Then
            Begin
               If MsgDlg('Não foi possível cotizar a operação do dia '+
                         QryCotizaAplicacao.FieldByName('DATACOTIZACAO').AsString+' para o '#13+
                         'Fundo : '+QryCotizaAplicacao.FieldByName('DESCFUNDOINVEST').AsString+'.'#13+
                         'Cota não encontrada para esse Fundo.'#13+
                         'Deseja Continuar ?','Mensagem ',mtInformation,[mbNo, mbYes],0) = mrNo Then
               Begin
                  Result := False;
                  QryCotizaAplicacao.Last;
               End;
            End
            Else
            Begin
               Try
                  fQtdOperacao := OperComum.Round(QryCotizaAplicacao.FieldByName('VLROPERACAO').AsFloat/
                                                  QryVlrCota.FieldByName('VLRCOTA').AsFloat,
                                                  QryCotizaAplicacao.FieldByName('QTDDECQTD').AsInteger);
                  //AL_170

                  OperComum.LimpaParametros(DmFundoComum.QryUpdOperFundoQtCot);
                  QryUpdOperFundoQtCot.ParamByName('QTDOPERACAO').AsFloat := fQtdOperacao;
                  QryUpdOperFundoQtCot.ParamByName('VLRCOTA').AsFloat     :=
                                                QryVlrCota.FieldByName('VLRCOTA').AsFloat;
                  QryUpdOperFundoQtCot.ParamByName('IDOPERACAOFUNDO').AsInteger :=
                               QryCotizaAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger;
                  QryUpdOperFundoQtCot.ExecSql;
                  OperComum.LimpaParametros(DmFundoComum.QryUpdOperFundoQtCot);

                  //Al_182                  
                  //Al_178
                  //Rotina de confirmação das operações
                  If Not AlimentaFundo(QryCotizaAplicacao.FieldByName('IDTIPOINVEST').AsInteger,
                                       QryCotizaAplicacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                       QryCotizaAplicacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       QryCotizaAplicacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                       QryCotizaAplicacao.FieldByName('IDPLANOPREV').AsInteger,
                                       QryCotizaAplicacao.FieldByName('IDPATRO').AsInteger,
                                       QryCotizaAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                       QryCotizaAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                       QryCotizaAplicacao.FieldByName('QTDDECQTD').AsInteger,
                                       QryCotizaAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                       -1,
                                       QryCotizaAplicacao.FieldByName('DATACOTIZACAO').AsDateTime,
                                       QryCotizaAplicacao.FieldByName('DATACOTIZACAO').AsDateTime,
                                       QryCotizaAplicacao.FieldByName('DATALIQUIDACAO').AsDateTime,
                                       fQtdOperacao,
                                       QryVlrCota.FieldByName('VLRCOTA').AsFloat,
                                       QryCotizaAplicacao.FieldByName('VLROPERACAO').AsFloat, 0{IRRF},  0{IOF},
                                       QryCotizaAplicacao.FieldByName('NATUREZAOPERACAO').AsString,
                                       Trim(QryCotizaAplicacao.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                            QryCotizaAplicacao.FieldByName('DESCFUNDOINVEST').AsString,
                                       'OPE', True,
                                       QryCotizaAplicacao.FieldByName('IDPLANPREVCTBPATR').AsInteger, -1, -1,
                                       0{Rendimento}, sMens) Then
                     Raise Exception.Create('Ocorreu um problema ao alimentar o histórico de Fundos.');

                  //AL_170

               Except
                 //Al_71
                  On E:Exception Do
                  Begin
                     //AL_170
                     MsgDlg('Não foi possível cotizar a Aplicação do dia '+
                            QryCotizaAplicacao.FieldByName('DATAOPERACAO').AsString+' '#13+
                            'do Fundo '+QryCotizaAplicacao.FieldByName('DESCFUNDOINVEST').AsString+'.'#13+
                            E.Message,'Mensagem do Sistema', mtInformation,[mbOK],0);
                     Result := False;
                     QryCotizaAplicacao.Last;
                  End;
               End;
            End;
            QryCotizaAplicacao.Next;
         end;
      //Al_178
      finally
         OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
         OperComum.LimpaParametros(DmFundoComum.QryCotizaAplicacao);
         OperComum.LimpaParametros(DmFundoComum.QryUpdOperFundoQtCot);
         OperComum.LimpaParametros(DmFundoComum.QryUpdHistFundoQtCot);
      end;
   End;
End;

Function CotizaResgate(dData : TDateTime; iFundo, iPlano, iTipoFundoInvest : Integer) : Boolean;
Var
   wiPlanilha, wiDocumento, wiPlano, iIdForCli : Integer;
   fValorIR : Double;
   fVlrCustoAcoes, fVlrVarAcoes : Currency;
   sMens: String;
begin
   Result := True;
   With DmFundoComum Do
   Begin
      //Al_179
      Try
         //AL_172
         OperComum.LimpaParametros(DmFundoComum.QryCotizaResgate);
         //Ricardo Cristiano - 11/01/2010 - N. Sol 129463 -  N. Kintana 709981
         QryCotizaResgate.ParamByName('DATACOTIZACAO').AsString := DateToStr(dData);
         //Al_179
         If iFundo > 0 Then
            QryCotizaResgate.ParamByName('IDFUNDOINVEST').AsInteger := iFundo;
         //Al_179
         If iPlano > 0 Then
            QryCotizaResgate.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
         //Ricardo Cristiano - 07/01/2010 - N. Sol 129265 -  N. Kintana 707133
         QryCotizaResgate.Open;

         While Not QryCotizaResgate.EOF Do
         Begin
            //AL_172
            OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
            QryVlrCota.ParamByName('DATACOTA').AsDateTime     :=
                       QryCotizaResgate.FieldByName('DATACOTIZACAO').AsDateTime;
            QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger :=
                       QryCotizaResgate.FieldByName('IDFUNDOINVEST').AsInteger;
            QryVlrCota.Open;
            If QryVlrCota.FieldByName('VLRCOTA').AsFloat       = 0 Then
            Begin
               If MsgDlg('Não foi possível cotizar a operação do dia '+
                         QryCotizaResgate.FieldByName('DATACOTIZACAO').AsString+' para o '#13+
                         'Fundo : '+QryCotizaResgate.FieldByName('DESCFUNDOINVEST').AsString+'.'#13+
                         'Cota não encontrada para esse Fundo.'#13+
                         'Deseja Continuar ?','Mensagem ',mtInformation,[mbNo, mbYes],0) = mrNo Then
               Begin
                  Result := False;
                  QryCotizaResgate.Last;
               End;
            End
            Else
            Begin
               Try
                 //AL_177
                 if not ExecutaQuery(QryAux,'DELETE FROM OPERACAOFUNDO WHERE IDPEDIDOFUNDO = '+
                                             QryCotizaResgate.FieldByName('IDPEDIDOFUNDO').AsString) then
                    Raise Exception.Create('Cotização de Resgate do Fundo '+
                                           Trim(QryCotizaResgate.FieldByName('DESCFUNDOINVEST').AsString)+','#13+
                                           'no valor '+ FloatToStrF(QryCotizaResgate.FieldByName('VLRPEDIDO').AsFloat,ffNumber,18,2)+#13+
                                           'e data de '+QryCotizaResgate.FieldByName('DATACOTIZACAO').AsString);
                 //AL_170
                 //Al_71                 
                 //Alt_12
                 If Not ResgateFACFIF(QryCotizaResgate.FieldByName('IDTIPOINVEST').AsInteger,
                                      QryCotizaResgate.FieldByName('IDPEDIDOFUNDO').AsInteger,
                                      QryCotizaResgate.FieldByName('IDTIPOOPERACAO').AsInteger,
                                      QryCotizaResgate.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                      QryCotizaResgate.FieldByName('IDFUNDOINVEST').AsInteger, -1,
                                      QryCotizaResgate.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                      QryCotizaResgate.FieldByName('DATACOTIZACAO').AsDateTime,
                                      QryCotizaResgate.FieldByName('DATAPEDIDO').AsDateTime,
                                      QryCotizaResgate.FieldByName('DATALIQUIDACAO').AsDateTime,
                                      0, QryCotizaResgate.FieldByName('VLRPEDIDO').AsFloat,0,
                                      fVlrCustoAcoes, fVlrVarAcoes, -1,
                                      QryCotizaResgate.FieldByName('IDTIPORESGATE').AsInteger) Then
                    Raise Exception.Create('Cotização de Resgate do Fundo '+
                                           Trim(QryCotizaResgate.FieldByName('DESCFUNDOINVEST').AsString)+','#13+
                                           'no valor '+ FloatToStrF(QryCotizaResgate.FieldByName('VLRPEDIDO').AsFloat,ffNumber,18,2)+#13+
                                           'e data de '+QryCotizaResgate.FieldByName('DATACOTIZACAO').AsString);
                 wiDocumento := -1;
                 wiPlanilha  := -1;
                 wiPlano     := -1;

                 //AL_172
                 OperComum.LimpaParametros(DmFundoComum.QryBuscaTipoOper);
                 QryBuscaTipoOper.ParamByName('IDTIPOINVEST').AsInteger    :=
                                  QryCotizaResgate.FieldByName('IDTIPOINVEST').AsInteger;
                 QryBuscaTipoOper.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                                  QryCotizaResgate.FieldByName('IDTIPOOPERACAO').AsInteger;
                 QryBuscaTipoOper.Open;

                 //AL_172
                 OperComum.LimpaParametros(DmFundoComum.QryConfirmacao);
                 QryConfirmacao.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                            QryCotizaResgate.FieldByName('IDFUNDOINVEST').AsInteger;
                 QryConfirmacao.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                                            QryCotizaResgate.FieldByName('IDTIPOOPERACAO').AsInteger;
                 QryConfirmacao.ParamByName('DATAOPERACAO').AsString       :=
                                            QryCotizaResgate.FieldByName('DATAPEDIDO').AsString;
//Ricardo Cristiano - 29/07/2009 - N. Sol 122539 -  N. Kintana 602388                                              
//                 QryConfirmacao.ParamByName('DATACOTIZACAO').AsString      := DateToStr(dData);
                 QryConfirmacao.ParamByName('DATACOTIZACAO').AsString      :=
                                            QryCotizaResgate.FieldByName('DATACOTIZACAO').AsString;
                 QryConfirmacao.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                            QryCotizaResgate.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                 //Al_61
                 QryConfirmacao.ParamByName('IDPEDIDOFUNDO').AsInteger     :=
                                            QryCotizaResgate.FieldByName('IDPEDIDOFUNDO').AsInteger;
                 QryConfirmacao.Open;

                 //AL_172
                 iIdForCli := OperComum.BuscaForCli(QryConfirmacaoIDTIPOINVEST.AsInteger,
                                                    QryConfirmacaoIDGESTORCARTEIRA.AsInteger,
                                                    QryConfirmacaoIDTIPOOPERACAO.AsInteger,
                                                    pRPI.IDTIPOCLIENTEEMI);

                 fValorIR := 0;
                 //AL_170
                 While Not QryConfirmacao.Eof Do
                 Begin
                    //Al_183                 
                    //AL_172
                    //AL_162
                    //Al_71
                    //Alt_7
                    //Rotina de confirmação das operações
                    If Not AlimentaFundo(QryConfirmacao.FieldByName('IDTIPOINVEST').AsInteger,
                                         QryConfirmacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                         QryConfirmacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryConfirmacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                         QryConfirmacao.FieldByName('IDPLANOPREV').AsInteger,
                                         iPatrocinadora,
                                         QryConfirmacao.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                         QryConfirmacao.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                         QryConfirmacao.FieldByName('QTDDECQTD').AsInteger,
                                         QryConfirmacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                         iIdForCli,
//Ricardo Cristiano - 29/07/2009 - N. Sol 122539 -  N. Kintana 602388
//QryConfirmacao.FieldByName('DATACOTIZACAO').AsDateTime,
                                         QryConfirmacao.FieldByName('DATAOPERACAO').AsDateTime,
                                         QryConfirmacao.FieldByName('DATACOTIZACAO').AsDateTime,
                                         QryConfirmacao.FieldByName('DATALIQUIDACAO').AsDateTime,
                                         QryConfirmacao.FieldByName('QTDOPERACAO').AsFloat,
                                         QryConfirmacao.FieldByName('VLRCOTA').AsFloat,
                                         QryConfirmacao.FieldByName('VLRLIQUIDO').AsFloat,
                                         QryConfirmacao.FieldByName('VLRIR').AsFloat,
                                         QryConfirmacao.FieldByName('VLRIOF').AsFloat,
                                         QryConfirmacao.FieldByName('NATUREZAOPERACAO').AsString,
                                         Trim(QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                         QryConfirmacao.FieldByName('DESCFUNDOINVEST').AsString, 'OPE', True,
                                         QryConfirmacao.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                         -1, -1, QryConfirmacao.FieldByName('VLRRENDIMENTO').AsFloat, sMens) Then
                    begin
                       //AL_162                    
                       //Al_71
                       if sMens <> '' then
                          Raise Exception.Create('Não foi possível confirmar a cotização de Resgate' + #13 +
                                                 'Fundo: ' + QryConfirmacao.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                                                 'Valor: '+ FloatToStrF(QryConfirmacao.FieldByName('VLRLIQUIDO').AsFloat,ffNumber,18,2)+#13+
                                                 'Data : '+ QryConfirmacao.FieldByName('DATACOTIZACAO').AsString + #13 +
                                                 'Mensagem: ' + sMens)
                       else
                          Raise Exception.Create('Não foi possível confirmar a cotização de Resgate' + #13 +
                                                 'Fundo: ' + QryConfirmacao.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                                                 'Valor: ' + FloatToStrF(QryConfirmacao.FieldByName('VLRLIQUIDO').AsFloat,ffNumber,18,2) + #13 +
                                                 'Data : ' + QryConfirmacao.FieldByName('DATACOTIZACAO').AsString + #13 +
                                                 'Ocorreu um problema ao gravar esta operação' + #13 +
                                                 'Tente mais tarde');
                    end;

                    fValorIR := fValorIR + QryConfirmacaoVLRIR.AsFloat;

                    ExecutaQuery(QryAux,'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'' WHERE '+
                                        '(IDOPERACAOFUNDO   = '''+IntToStr(QryConfirmacaoIDOPERACAOFUNDO.AsInteger)  +''')');
                    OperComum.LimpaParametros(QryAux);
                    //AL_172
                    //Al_71
                    QryConfirmacao.Next;
                 End;
                 //Al_72

                 OperComum.LimpaParametros(DmFundoComum.QryConfirmacao);

                 //AL_172
                 OperComum.LimpaParametros(DmFundoComum.QryBuscaTipoOper);
                 QryBuscaTipoOper.ParamByName('IDTIPOINVEST').AsInteger   :=
                                  QryConfirmacao.FieldByName('IDTIPOINVEST').AsInteger;
                 //AL_155
                 QryBuscaTipoOper.ParamByName('IDTIPOOPERACAO').AsInteger := -30;
                 QryBuscaTipoOper.Open;

                 fVlrCustoAcoes := 0;
                 fVlrVarAcoes   := 0;

                 If fValorIR > 0 Then
                 Begin
                    //AL_189
                    //Al_72
                    //Al_71                    
                    If Not ContabilizacaoFinanceiro(wiPlano, wiPlanilha, wiDocumento,
                                                    QryCotizaResgate.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                    QryCotizaResgate.FieldByName('IDTIPOINVEST').AsInteger,
                                                    QryCotizaResgate.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                    QryCotizaResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                                    iIdForCli,
                                                    QryCotizaResgate.FieldByName('IDFUNDOINVEST').AsInteger,
                                                    QryCotizaResgate.FieldByName('DATALIQUIDACAO').AsDateTime,
                                                    QryCotizaResgate.FieldByName('DATALIQUIDACAO').AsDateTime,
                                                    'OPE', QryBuscaTipoOperNATUREZAOPERACAO.AsString,
                                                    QryCotizaResgate.FieldByName('DESCFUNDOINVEST').AsString,
                                                    True,
                                                    0, fValorIR, 0, 0, 0, fVlrCustoAcoes, fVlrVarAcoes,
                                                    -1, 0, 0, 0, 0,
                                                    QryCotizaResgate.FieldByName('IDPLANOPREV').AsInteger,
                                                    QryCotizaResgate.FieldByName('IDPATRO').AsInteger) Then
                        Raise Exception.Create('Contabilização da cotização de Resgate do Fundo '#13+
                                               QryCotizaResgate.FieldByName('DESCFUNDOINVEST').AsString+','#13+
                                               'com data de '+ QryCotizaResgate.FieldByName('DATALIQUIDACAO').AsString);
                 End;
                 //AL_170
                 //AL_172

               Except
                  //Al_71
                  On E:Exception Do
                  Begin
                     //Al_72
                     //AL_170
                     MsgDlg('Não foi possivel efetuar a Operação de : '#13+
                            E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
                     //AL_172
                     QryCotizaResgate.Last;
                     Result := False;
                  End;
               End;
            End;
            //AL_172
            QryCotizaResgate.Next;
         End;
      //Al_179
      finally
         //AL_172
         OperComum.LimpaParametros(DmFundoComum.QryCotizaResgate);
         OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
         OperComum.LimpaParametros(DmFundoComum.QryConfirmacao);
         OperComum.LimpaParametros(DmFundoComum.QryBuscaTipoOper);
         OperComum.LimpaParametros(DmFundoComum.QryAux);
      end;
   End;
end;

//Al_129
//AL_128
function ContabilizacaoFinanceiro(Var iPlano, iPlanilha, iDocumento : Integer;
                                  iTipoOperacao, iTipoInvest, iCarteira,
                                  iTipoFundo, iForCli, iFundo                 : Integer;
                                  dDataApl, dDataOper                         : TDateTime;
                                  sTipoMov, sNaturMov, sHistorico             : String;
                                  bDoc                                        : Boolean;
                                  fValorOperacao, fValorIR, fValorCol,
                                  fValorTax, fValorCorret, fVlrCustoAcoes,
                                  fVlrVarAcoes                                : Currency;
                                  iTipoCota   : Integer = -1;
                                  fVlrUsufruto: Currency = 0;
                                  fVlrVarFDIC : Currency = 0;
                                  fVlrTxPerf  : Currency = 0;
                                  iFlgContaInvest   : Integer = 0;
                                  wiPlanoPrevContab : Integer = 0;
                                  wiPatrocinadora   : Integer = 0;
                                  fVlrIOF           : Currency = 0)  : Boolean;
Var
   sRecPag  : String;
   iTipoAtu : Integer;
begin
   Result      := True;
   if iCarteira = 0 then iCarteira := -1;
   //AL_59
   //AL_134
   if not CtrlInvContab.TestaPeriodo(DateToStr(dDataOper)) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistemas', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;

   //Al_46
   If OperComum.Round((fValorOperacao + fVlrUsufruto), 2) > 0 then
   Begin
      //AL_128
      //AL_189
      If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo, iTipoInvest,
                                   iTipoOperacao, iCarteira, iTipoFundo, iForCli, 0,
                                   iPlano, iPlanilha, iDocumento,
                                   (fValorOperacao + fVlrUsufruto),
                                   dDataApl, dDataOper,
                                   sNaturMov, sTipoMov, sHistorico,
                                   iFlgContaInvest, wiPlanoPrevContab, wiPatrocinadora) Then
      Begin
         Result := False;
         Exit;
      End;
   End;

   //Al_84

   If (fVlrVarAcoes <> 0) Then
   begin
      //AL_189
      If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo, iTipoInvest,
                                   iTipoOperacao, iCarteira, iTipoFundo, iForCli, -2,
                                   iPlano, iPlanilha, iDocumento,
                                   fVlrVarAcoes,
                                   dDataApl, dDataOper,
                                   sNaturMov, 'DOP', sHistorico,
                                   iFlgContaInvest, wiPlanoPrevContab, wiPatrocinadora) Then
      Begin
         Result := False;
         Exit;
      End;
      //AL_103
      //Al_87
      //AL_83
   end;

   If (fVlrUsufruto <> 0) Then
   begin
      If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo, iTipoInvest,
                                   iTipoOperacao, iCarteira, iTipoFundo, iForCli, -27,
                                   iPlano, iPlanilha, iDocumento,
                                   fVlrUsufruto,
                                   dDataApl, dDataOper,
                                   sNaturMov, 'DOP', sHistorico) Then
      Begin
         MsgDlg('Verificar o Usufruto da operação.', 'Mensagem do Sistemas', mtInformation, [mbOk], 0);
         Result := False;
         Exit;
      End;
   end;

   // Variação de Cotas na Aplicaçao de FDIC
   If OperComum.Round(fVlrVarFDIC,2) <> 0 Then
   Begin
      if fVlrVarFDIC > 0 then
         iTipoAtu := -12
      else
         iTipoAtu := -13;

      If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo, iTipoInvest,
                                   iTipoAtu, iCarteira, iTipoFundo, iForCli, 0,
                                   iPlano, iPlanilha, iDocumento,
                                   fVlrVarFDIC,
                                   dDataApl, dDataOper,
                                   sNaturMov, sTipoMov, sHistorico) Then
      Begin
         MsgDlg('Verificar a Varição na Aplicação.', 'Mensagem do Sistemas', mtInformation, [mbOk], 0);
         Result := False;
         Exit;
      End;
   end;

   // Taxa de Performance
   If OperComum.Round(fVlrTxPerf,2) <> 0 Then
   Begin
      //AL_145
      if (iTipoInvest in [9,10]) and (sNaturMov = 'D') then  // Se resgate de  FDIC e FIP
         fValorOperacao := fValorOperacao - fVlrTxPerf;

      If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo, iTipoInvest,
                                   -99, iCarteira, iTipoFundo, iForCli, 0,
                                   iPlano, iPlanilha, iDocumento,
                                   fVlrTxPerf,
                                   dDataApl, dDataOper,
                                   sNaturMov, sTipoMov, sHistorico) Then
      Begin
         MsgDlg('Verificar a Taxa de Performance.', 'Mensagem do Sistemas', mtInformation, [mbOk], 0);
         Result := False;
         Exit;
      End;
   end;

   If (fVlrCustoAcoes <> 0) Then
   begin
      //AL_189
      If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo, iTipoInvest,
                                   iTipoOperacao, iCarteira, iTipoFundo, iForCli, -1,
                                   iPlano, iPlanilha, iDocumento,
                                   fVlrCustoAcoes,
                                   dDataApl, dDataOper,
                                   sNaturMov, 'DOP', sHistorico,
                                   iFlgContaInvest, wiPlanoPrevContab, wiPatrocinadora) Then
      Begin
         MsgDlg('Verificar o Valor de Custo da operação.', 'Mensagem do Sistemas', mtInformation, [mbOk], 0);
         Result := False;
         Exit;
      End;
      //AL_103
      //Al_87
      //AL_83
   end;

   If OperComum.Round(fValorIR,2) > 0 Then
   Begin
      //AL_189
      If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo, iTipoInvest,
                                   -30, iCarteira, iTipoFundo, iForCli, 0,
                                   iPlano, iPlanilha, iDocumento,
                                   fValorIR*-1,
                                   dDataApl, dDataOper,
                                   sNaturMov, sTipoMov, sHistorico,
                                   iFlgContaInvest, wiPlanoPrevContab, wiPatrocinadora) Then
      Begin
         MsgDlg('Verificar o IR Litígio.', 'Mensagem do Sistemas', mtInformation, [mbOk], 0);
         Result := False;
         Exit;
      End;

      If (iTipoOperacao = -55) Or (iTipoOperacao = -56) Then
      Begin
         If fValorOperacao  = 0 Then
            fValorOperacao := fValorIR
         Else
            fValorOperacao := fValorOperacao-fValorIR;
      End;
   End;

   If (OperComum.Round(fValorCol,2) > 0) And (iTipoOperacao = -55) Then
   Begin
      If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo, iTipoInvest,
                                   -57, iCarteira, iTipoFundo, iForCli, 0,
                                   iPlano, iPlanilha, iDocumento,
                                   fValorCol*-1,
                                   dDataApl, dDataOper,
                                   sNaturMov, sTipoMov, sHistorico) Then
      Begin
         MsgDlg('Verificar a Aplicação de Cotas com Emolumentos.', 'Mensagem do Sistemas', mtInformation, [mbOk], 0);
         Result := False;
         Exit;
      End;
      fValorOperacao := fValorOperacao-fValorCol;
   End;

   If (OperComum.Round(fValorCol,2) > 0) And (iTipoOperacao = -56) Then
   Begin
      If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo, iTipoInvest,
                                   -60, iCarteira, iTipoFundo, iForCli, 0,
                                   iPlano, iPlanilha, iDocumento,
                                   fValorCol*-1,
                                   dDataApl, dDataOper,
                                   sNaturMov, sTipoMov, sHistorico) Then
      Begin
         MsgDlg('Verificar o Resgate de Cotas com Emolumentos.', 'Mensagem do Sistemas', mtInformation, [mbOk], 0);
         Result := False;
         Exit;
      End;
      fValorOperacao := fValorOperacao - fValorCol;
   End;

   If OperComum.Round(fValorTax, 2) > 0 Then
   Begin
      //AL_145
      if not iTipoInvest in [9,10] then  // Se não for FDIC e FIP
      begin
         fValorOperacao := fValorOperacao - fValorTax;
         fValorTax := fValorTax * -1;
      end
      else
      begin
         if sNaturMov = 'A' then
            fValorOperacao := fValorOperacao + fValorTax
         else if sNaturMov = 'D' then
            fValorOperacao := fValorOperacao - fValorTax;
      end;

      If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo, iTipoInvest,
                                   -58, iCarteira, iTipoFundo, iForCli, 0,
                                   iPlano, iPlanilha, iDocumento,
                                   fValorTax,
                                   dDataApl, dDataOper,
                                   sNaturMov, sTipoMov, sHistorico) Then
      Begin
         MsgDlg('Verificar a Taxa da operação.', 'Mensagem do Sistemas', mtInformation, [mbOk], 0);
         Result := False;
         Exit;
      End;
   End;

   If OperComum.Round(fValorCorret,2) > 0 Then
   Begin
      //AL_145
      if not iTipoInvest in [9,10] then  // Se não for FDIC e FIP
      begin
         fValorOperacao := fValorOperacao - fValorCorret;
         fValorCorret := fValorCorret * -1;
      end
      else
      begin
         if sNaturMov = 'A' then
            fValorOperacao := fValorOperacao + fValorCorret
         else if sNaturMov = 'D' then
            fValorOperacao := fValorOperacao - fValorCorret;
      end;

      If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo, iTipoInvest,
                                   -59, iCarteira, iTipoFundo, iForCli, 0,
                                   iPlano, iPlanilha, iDocumento,
                                   fValorCorret,
                                   dDataApl, dDataOper,
                                   sNaturMov, sTipoMov, sHistorico) Then
      Begin
         MsgDlg('Verificar a Corretagem da operação.', 'Mensagem do Sistemas', mtInformation, [mbOk], 0);
         Result := False;
         Exit;
      End;
   End;

   //Al_129
   If OperComum.Round(fVlrIOF,2) <> 0 Then
   Begin
      //AL_190
      if iTipoOperacao < 0 then
         iTipoAtu := -150   //IOF POR TRANSFERÊNCIA ENTRE PLANOS
      else
         iTipoAtu := -180;

      //AL_192 - Verifica se a operação de IOF pago está cadastrada para descontar o mesmo
      OperComum.LimpaParametros(dmFundoComum.QryVerificaTipoOper);
      dmFundoComum.QryVerificaTipoOper.ParamByName('IDTIPOOPERACAO').AsInteger := iTipoAtu;
      dmFundoComum.QryVerificaTipoOper.ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvest;
      dmFundoComum.QryVerificaTipoOper.Open;

      if not dmFundoComum.QryVerificaTipoOper.IsEmpty then
      begin
         If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo, iTipoInvest,
                                      iTipoAtu, iCarteira, iTipoFundo, iForCli, 0,
                                      iPlano, iPlanilha, iDocumento,
                                      fVlrIOF,
                                      dDataApl, dDataOper,
                                      sNaturMov, sTipoMov, sHistorico,
                                      iFlgContaInvest, wiPlanoPrevContab, wiPatrocinadora) Then
         Begin
            MsgDlg('Verificar o IOF.', 'Mensagem do Sistemas', mtInformation, [mbOk], 0);
            Result := False;
            Exit;
         End;

         fValorOperacao := fValorOperacao - fVlrIOF;
      end;
      OperComum.LimpaParametros(dmFundoComum.QryVerificaTipoOper);
   End;

   With dmFundoComum.QryVerificaTipoOper Do
   Begin
      Close;
      ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOperacao;
      ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvest;
      Open;
      sRecPag := FieldByName('RECPAG').AsString;
      Close;
   End;

   If OperComum.Round(fValorOperacao, 2) > 0 Then
   begin
      //AL_53
      If Not CriarLanctoDocumentoOpe(fValorOperacao, dDataApl,
                                     iTipoInvest, iTipoOperacao, iPlano, iPlanilha, iDocumento,
                                     sHistorico, sRecPag, bDoc, iTipoCota) Then
         Result := False;
   End;
   //AL_157 - Efetiva a inclusão do documento, caso exista um
   //AL_171
   if (CtrlInvContab.Documento.DocumentoPendente) and (iDocumento > 0) then
   begin
      //AL_168
      //AL_158
      if not CtrlInvContab.Documento.Insert then
      begin
         MsgDlg(CtrlInvContab.Documento.MessageInfo, 'Mensagem do Sistemas', mtInformation, [mbOk], 0);
         Result := False;
      end;
   end;
end;

//Al_67
function AtualizaCotaIntegralizar(DataProc: TDateTime; iTipoFundo, iFundo : Integer; bForm : Boolean): Boolean;
var qryAux     : TwwQuery;
    qryFundos  : TwwQuery;
    DataAnt    : TDateTime;
    wSql       : String;
    RegraFundo : TRegra ;
begin
   Result := False;

   RegraFundo                 := TRegra.Create(Application);
   RegraFundo.DatabaseName    := 'BaseDados';
   RegraFundo.TipoCliente     := tcFundacao;

   qryFundos := TwwQuery.Create(Application);
   qryFundos.DatabaseName := 'BaseDados';

   try
      try
         //Al_63
         qryFundos.SQL.Add('SELECT FI.IDTIPOFUNDOINVEST, FI.IDFUNDOINVEST, FI.DESCFUNDOINVEST ');
         qryFundos.SQL.Add('FROM FUNDOINVEST FI, TIPOINVEST TI, TIPOFUNDOINVEST TF ');
         //AL_145
         qryFundos.SQL.Add('WHERE (TI.IDTIPOINVEST IN (6,7,9,10)) ');
         qryFundos.SQL.Add('AND   (TF.IDTIPOINVEST      = TI.IDTIPOINVEST) ');
         qryFundos.SQL.Add('AND   (FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST) ');
         qryFundos.SQL.Add('AND   (FI.VLRCOTAINICIAL IS NOT NULL) ');
         qryFundos.SQL.Add('AND   (FI.VLRCOTAINICIAL    > 0) ');
         qryFundos.SQL.Add('AND   (FI.IDREGRA IS NOT NULL) ');
         if iFundo     > 0 then
            qryFundos.SQL.Add('AND   (FI.IDFUNDOINVEST      = ' + IntToStr(iFundo)+') ');
         if iTipoFundo > 0 then
            qryFundos.SQL.Add('AND   (FI.IDTIPOFUNDOINVEST  = ' + IntToStr(iTipoFundo)+') ');
         qryFundos.SQL.Add('ORDER BY FI.IDTIPOFUNDOINVEST, FI.DESCFUNDOINVEST ');
         qryFundos.Open;
         //Al_63

         if bForm then
         begin
            frmFechtoFundos.prbAtualizaFundos.Max := 0;
            frmFechtoFundos.prbAtualizaFundos.StepIt;
            frmFechtoFundos.prbAtualizaFundos.Max := qryFundos.RecordCount;
         end;

         while not qryFundos.Eof do
         begin
            if bForm then
            begin
               frmFechtoFundos.lblDescFundo.Caption := qryFundos.FieldByName('DESCFUNDOINVEST').AsString;
               frmFechtoFundos.lblDescFundo.Repaint;
            end;
            //Al_63
            with DmFundoComum do
            begin
               //Al_63
               DataAnt:= DataProc-1;
               If (qryFundos.FindField('IDTIPOFUNDOINVEST').AsInteger <> 1) Then //Fundo Imobiliário é contabilizado fim de semana
               begin
                   While not DiasUteisInv.DiaUtil(DataAnt,-1,1,'',True,False,False) Do
                      DataAnt := DataAnt  - 1;
               end;

               //Al_166
               OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
               qryCotaIntegrFundo.ParamByName('IDFUNDOINVEST').AsInteger := qryFundos.FindField('IDFUNDOINVEST').AsInteger;
               qryCotaIntegrFundo.ParamByName('DATACOTA').AsString       := DateToStr(DataAnt);
               qryCotaIntegrFundo.Open;
               if qryCotaIntegrFundo.IsEmpty then
                  Raise Exception.Create('Cota a integralizar não encontrada  '+DateToStr(DataAnt));

               FazQuery(qryAux,'SELECT ' +
                               QuotedStr(TrocaVirgulaPonto(qryCotaIntegrFundoVLRCOTA.AsString)) + ' AS VLRCOTA, ' +
                               QuotedStr(qryCotaIntegrFundoMOESIGLA.AsString) + ' AS MOECODIGO, ' +
                               QuotedStr(DateToStr(DataAnt)) + ' AS DATAATUAL, '+
                               QuotedStr(DateToStr(DataProc)) + ' AS DATAFINAL FROM DUAL');

               RegraFundo.RuleName := qryCotaIntegrFundoIDREGRA.AsString;
               RegraFundo.QueryIn  := qryAux;
               try
                  //RegraFundo.PassoaPasso;
                  RegraFundo.Execute;
               except
                  on E:Exception do
                  begin
                     //Al_71
                     MsgDlg('Não foi possível calcular cota a integralizar para o Fundo :  ' + #13 +
                            qryFundos.FindField('DESCFUNDOINVEST').AsString + #13 +
                            'Regra: '+ qryCotaIntegrFundoIDREGRA.AsString + #13 +
                            'Com a Mensagem:' + #13 + #13 +
                            E.Message, 'Mensagem do Sistema', mtInformation,[MbOk],0);
                     if bForm then
                     begin
                        frmFechtoFundos.prbAtualizaFundos.Max := 0;
                        frmFechtoFundos.prbAtualizaFundos.StepIt;
                        frmFechtoFundos.lblDescFundo.Caption := '';
                        frmFechtoFundos.lblDescFundo.Repaint;
                     end;
                     //Al_166
                     OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
                     RegraFundo.Free;
                     qryFundos.Free;
                     qryAux.Free;
                     Result := False;
                     Exit;
                  end;
               end;

               if not dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               wSql := 'SELECT VLRCOTA FROM COTAINTEGRFUNDO ' +
                       'WHERE IDFUNDOINVEST = ' + qryFundos.FindField('IDFUNDOINVEST').AsString + ' AND ' +
                       '      DATACOTA      = TO_DATE(' + QuotedStr(DateToStr(DataProc)) + ',' + QuotedStr('dd/mm/yyyy') + ')';

               If Not qryCotaIntegrFundo.FieldByName('IDTIPOCOTA').IsNull then
                  wSql := wSql+ ' AND IDTIPOCOTA = '+qryCotaIntegrFundo.FieldByName('IDTIPOCOTA').AsString;

               FazQuery(qryAux,wSql);

               if qryAux.IsEmpty then
               begin
                  If Not qryCotaIntegrFundo.FieldByName('IDTIPOCOTA').IsNull then
                     wSql := ',IDTIPOCOTA) '
                  else
                     wSql := ') ';

                  wSql := 'INSERT INTO COTAINTEGRFUNDO ' +
                          '(IDFUNDOINVEST, DATACOTA, VLRCOTA'+wSql+
                          'VALUES (' +
                          qryFundos.FindField('IDFUNDOINVEST').AsString + ', ' +
                          'TO_DATE(' + QuotedStr(DateToStr(DataProc)) + ',' + QuotedStr('dd/mm/yyyy') + ')' + ', ' +
                          RegraFundo.Result;

                  If Not qryCotaIntegrFundo.FieldByName('IDTIPOCOTA').IsNull then
                     wSql := wSql + ','+qryCotaIntegrFundo.FieldByName('IDTIPOCOTA').AsString+') '
                  else
                     wSql := wSql + ')';
               end
               else
               begin
                  If Not qryCotaIntegrFundo.FieldByName('IDTIPOCOTA').IsNull then
                     wSql := '   ,IDTIPOCOTA = '+qryCotaIntegrFundo.FieldByName('IDTIPOCOTA').AsString+' '
                  else
                     wSql := '';

                  wSql := 'UPDATE COTAINTEGRFUNDO ' +
                          'SET VLRCOTA    = ' + RegraFundo.Result + wSql +
                          'WHERE IDFUNDOINVEST = ' + qryFundos.FindField('IDFUNDOINVEST').AsString + ' AND ' +
                          '      DATACOTA   = TO_DATE(' + QuotedStr(DateToStr(DataProc)) + ',' + QuotedStr('dd/mm/yyyy') + ')';

                  If Not qryCotaIntegrFundo.FieldByName('IDTIPOCOTA').IsNull then
                     wSql := wSql + ' AND IDTIPOCOTA = '+qryCotaIntegrFundo.FieldByName('IDTIPOCOTA').AsString;

               end;

               ExecutaQuery(qryAux, wSql);

               dtmBaseDados.dbBaseDados.Commit;

            end;
            //Al_73
            if bForm then
               frmFechtoFundos.prbAtualizaFundos.StepIt;

            qryFundos.Next;
         end;
         //Al_72
         Result := True;
      except
         on E:Exception do
         begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            //Al_71
            MsgDlg('Não foi possível calcular cota a integralizar para o Fundo : ' + #13 +
                   qryFundos.FindField('DESCFUNDOINVEST').AsString + #13 +
                   'Com a Mensagem:' + #13 + #13 +
                   E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);

            Result := False;
            //Al_63
         end;
      end;
   finally
      //Al_73
      if bForm then
      begin
         frmFechtoFundos.prbAtualizaFundos.Max := 0;
         frmFechtoFundos.prbAtualizaFundos.StepIt;
         frmFechtoFundos.lblDescFundo.Caption := '';
         frmFechtoFundos.lblDescFundo.Repaint;
      end;
      //Al_166
      OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
      RegraFundo.Free;
      qryFundos.Free;
   end;
end;

Function PgtoIrIofFundos(iTipoFundo : Integer;
                         dDataOper  : TDateTime; bMostraMsg, bForm : boolean) : Boolean;
Var
   fVlrIRProv, fVlrIR, fVlrIOFProv, fVlrIOF, fQtdInvestOperacao,
   fVlrIRLitigio, fVlrIOFLitigio, fValorLancto, fValorLanctoIR, fValorLanctoIOF : Double;
   fVlr , fVlrOperacao : Currency;
   sTipo, sMensagem  : String;
   iIDOperacao : Integer;
   dDta, dDtaUltDiaMes, dDataUltPgtoIR, DadosCota, dDataAnt, dDataProcesso, dDataIniRefIR : TDateTime;
   Year, Month, Day : Word;
   fVlrRendimento : Double;
begin
   fvlr            :=  0;
   fVlrOperacao    :=  0;
   iIDOperacao     :=  0;

   If bForm Then
   begin
      frmFechtoFundos.Label2.Visible := True;
      frmFechtoFundos.Label2.Caption := frmFechtoFundos.Label2.Caption+' - '+DateToStr(dDataOper);
      frmFechtoFundos.Label2.Repaint;
   end;

   Try
      With DmFundoComum Do
      Begin
         //AL_153
         OperComum.LimpaParametros(DmFundoComum.QryPatroPlanPrevContab);
         QryPatroPlanPrevContab.Sql.Add(' AND IDPLANPREVCTBPATR IS NOT NULL');
         QryPatroPlanPrevContab.Open;
         QryPatroPlanPrevContab.First;
         While Not QryPatroPlanPrevContab.Eof Do
         Begin
            If bForm Then
            begin
               If Trim(frmFechtoFundos.pnlPlanoPatrocinadora.Caption) <>
                  Trim(QryPatroPlanPrevContab.FieldByName('PLANPRVCONTABPATRO').AsString) Then
               Begin
                  frmFechtoFundos.pnlPlanoPatrocinadora.Caption := QryPatroPlanPrevContab.FieldByName('PLANPRVCONTABPATRO').AsString;
                  frmFechtoFundos.pnlPlanoPatrocinadora.Repaint;
               End;
            end;

            //AL_153
            //Busca ultimo registro da aplicaçao atualizada
            OperComum.LimpaParametros(DmFundoComum.QryAtuAplicacoes);
            QryAtuAplicacoes.ParamByName('IDTIPOFUNDOINVEST').AsInteger := iTipoFundo;
            QryAtuAplicacoes.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
            QryAtuAplicacoes.ParamByName('IDTIPOFUNDOINVEST').AsInteger := iTipoFundo;
            QryAtuAplicacoes.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                             QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            QryAtuAplicacoes.ParamByName('DATAMOVFUNDO').AsString       := DateToStr(dDataOper);
            QryAtuAplicacoes.ParamByName('IDFUNDOINVEST').Clear;
            QryAtuAplicacoes.Open;

            // Busca dados do Tipo de Operacao - Fdo Imobiliário, recebto de dividendo, não influência no saldo
            FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST='+IntToStr(iTipoInvestUsu)+
                            ' AND NATUREZAOPERACAO =  ''R''');
            If Not QryAux.FieldByName('IDTIPOOPERACAO').IsNull Then
            Begin
               QryAtuAplicacoes.Filter   := 'IDTIPOOPERACAO <> '+QryAux.FieldByName('IDTIPOOPERACAO').AsString;
               QryAtuAplicacoes.Filtered := True;
            End;
            OperComum.LimpaParametros(DmFundoComum.QryAux);

            If not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;

            If QryAtuAplicacoes.RecordCount > 0 Then
            Begin
               ExecutaQuery(QryAux,'DELETE FROM IRLITIGIO WHERE  IDOPERACAOFUNDO IN '+
                                   '(SELECT IDOPERACAOFUNDO FROM FUNDOINVEST FI, OPERACAOFUNDO OP'+
                                   ' WHERE'+
                                   ' OP.IDFUNDOINVEST      = FI.IDFUNDOINVEST         AND'+
                                   ' FI.IDTIPOFUNDOINVEST  = '+IntToStr(iTipoFundo)+' AND'+
                                   ' OP.IDTIPOOPERACAO IN (-46,-47)                   AND'+
                                   ' OP.DATAOPERACAO       = TO_DATE('+QuotedStr(DateToStr(dDataOper))+',''DD/MM/YYYY''))');

               ExecutaQuery(QryAux,'DELETE FROM OPERACAOFUNDO WHERE  IDOPERACAOFUNDO IN '+
                                   '(SELECT IDOPERACAOFUNDO FROM FUNDOINVEST FI, OPERACAOFUNDO OP'+
                                   ' WHERE'+
                                   ' OP.IDFUNDOINVEST      = FI.IDFUNDOINVEST         AND'+
                                   ' FI.IDTIPOFUNDOINVEST  = '+IntToStr(iTipoFundo)+' AND'+
                                   ' OP.IDTIPOOPERACAO IN (-46,-47)                   AND'+
                                   ' OP.DATAOPERACAO       = TO_DATE('+QuotedStr(DateToStr(dDataOper))+',''DD/MM/YYYY''))');
            End;

            If bForm Then
            begin
               frmFechtoFundos.prbAtualizaFundos.Max := 0;
               frmFechtoFundos.prbAtualizaFundos.StepIt;
               frmFechtoFundos.prbAtualizaFundos.Max := QryAtuAplicacoes.RecordCount;
            end;   

            While Not QryAtuAplicacoes.Eof Do
            Begin
               If bForm Then
               begin
                  If Trim(frmFechtoFundos.lblDescFundo.Caption) <>
                     Trim(QryAtuAplicacoes.FieldByName('DESCFUNDOINVEST').AsString) Then
                  Begin
                     frmFechtoFundos.lblDescFundo.Caption := QryAtuAplicacoes.FieldByName('DESCFUNDOINVEST').AsString;
                     frmFechtoFundos.lblDescFundo.Repaint;
                  End;
                  frmFechtoFundos.prbAtualizaFundos.StepIt;
               end;

               dDataProcesso := QryAtuAplicacoes.FieldByName('DATAMOVFUNDO').AsDateTime;
               //Trazer a atualização atê a data atual
               While dDataProcesso = dDataOper Do
               Begin
                  //AL_153
                  OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
                  QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger :=
                                   QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsInteger;
                  QryVlrCota.ParamByName('DATACOTA').AsDateTime     := dDataProcesso;
                  QryVlrCota.Open;

                  If QryVlrCota.FieldByName('VLRCOTA').AsFloat <> 0 Then
                  Begin
                     fQtdInvestOperacao := QryAtuAplicacoes.FieldByName('SALDOQTDCOTAS').AsFloat;

                     If fQtdInvestOperacao < 0 Then
                     Begin
                        If bMostraMsg Then
                           MsgDlg('Divergência de cotas na atualização da aplicação! Operação será cancelada.',
                                  'Mensagem do Sistema', mtInformation, [mbOk], 0);
                        OperComum.LimpaParametros(DmFundoComum.QryAtuAplicacoes);
                        OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
                        Result       := False;
                        Exit;
                     End;

                     If QryVlrCota.FieldByName('VLRCOTA').AsFloat <> 0 Then
                     Begin
                        fVlrIRProv   := 0;
                        fVlrIR       := 0;
                        fVlrIOFProv  := 0;
                        fVlrIOF      := 0;

                        fVlrOperacao := OperComum.Round(fQtdInvestOperacao*QryVlrCota.FieldByName('VLRCOTA').AsFloat,2);
                        sTipo :=QryAtuAplicacoes.FieldByName('TIPMOVFUNDO').AsString;
                        dDta  :=QryAtuAplicacoes.FieldByName('DATAMOVFUNDO').AsDateTime;
                        fVlr  :=QryAtuAplicacoes.FieldByName('SALDOVLRFUNDO').AsFloat;

                        If ((TRIM(sTipo)   <> 'INI' ) Or
                            ((TRIM(sTipo)   = 'INI' ) And (ddta <> dDataProcesso))) Then
                        Begin
                           //Al_87
                           If (((QryAtuAplicacoes.FieldByName('IDTIPOOPERACAO').AsInteger <> -43)  And
                                (QryAtuAplicacoes.FieldByName('IDTIPOOPERACAO').AsInteger <> -143)) Or
                                (QryAtuAplicacoes.FieldByName('DATAMOVFUNDO').AsDateTime  <> dDataProcesso)) Then
                           Begin
                              If QryAtuAplicacoes.FieldByName('STAPROVISIONAIOF').AsString = 'S' Then
                              Begin
                                 //AL_153
                                 OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
                                 QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger :=
                                       QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsInteger;
                                 QryVlrCota.ParamByName('DATACOTA').AsDateTime     :=
                                       QryAtuAplicacoes.FieldByName('DATAAPLICACAO').AsDateTime;
                                 QryVlrCota.Open;
                                 fVlrIOF := Impostos.CalculaIOF(1,
                                                       QryAtuAplicacoes.FieldByName('DATAAPLICACAO').AsDateTime,
                                                       dDataProcesso,
                                                       OperComum.Round(fQtdInvestOperacao*
                                                                       QryVlrCota.FieldByName('VLRCOTA').AsFloat,2),
                                                       fVlrOperacao,
                                                       'S');
                                 fVlrIOFProv     := fVlrIOF;
                                 OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
                              End;

                              If QryAtuAplicacoes.FieldByName('STAPROVISIONAIR').AsString = 'S' Then
                              Begin
                                 // Para Fundo de Renda Fixa utilizar data do ultimo pgto IR
                                 // Para Fundo de Acoes utilizar data da aplicacao
                                 If QryAtuAplicacoes.FieldByName('IDTIPOINVEST').AsInteger=5 Then
                                 Begin
                                    If QryAtuAplicacoes.FieldByName('TIPMOVFUNDO').AsString = 'ATU' Then
                                    Begin
                                       //AL_153
                                       OperComum.LimpaParametros(DmFundoComum.QryAplPgtoIR);
                                       QryAplPgtoIR.ParamByName('IDFUNDOINVEST').AsInteger :=
                                                    QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsInteger;
                                       QryAplPgtoIR.ParamByName('IDTIPOINVEST').AsInteger :=
                                                    QryAtuAplicacoes.FieldByName('IDTIPOINVEST').AsInteger;
                                       QryAplPgtoIR.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                                    QryAtuAplicacoes.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                                       QryAplPgtoIR.ParamByName('DATAAPLICACAO').AsString :=
                                                    QryAtuAplicacoes.FieldByName('DATAAPLICACAO').AsString;
                                       QryAplPgtoIR.ParamByName('DATAMOVFUNDO').AsString := DateToStr(dDataProcesso);
                                       QryAplPgtoIR.Open;
                                       dDataIniRefIR:= QryAplPgtoIR.FieldByName('DATAULTPGTOIR').AsDateTime;
                                    End
                                    Else
                                       dDataIniRefIR:=QryAtuAplicacoes.FieldByName('DATAULTPGTOIR').AsDateTime;
                                 End
                                 Else
                                    dDataIniRefIR:=QryAtuAplicacoes.FieldByName('DATAAPLICACAO').AsDateTime;

                                 //AL_153
                                 OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
                                 QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger :=
                                         QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsInteger;
                                 QryVlrCota.ParamByName('DATACOTA').AsDateTime     :=dDataIniRefIR;
                                 QryVlrCota.Open;

                                 fVlrRendimento := 0;
                                 fVlrIR  := Impostos.CalculaIr(QryAtuAplicacoes.FieldByName('IDTIPOINVEST').AsInteger,
                                                      0{Investiment}, 0{Carteira}, 0{CARTEIRAGERENC}, 0{TipoOperacao}, 0{Mercado}, ''{Lote},
                                                      dDataIniRefIR,
                                                      dDataProcesso,
                                                      OperComum.Round(fQtdInvestOperacao*
                                                      QryVlrCota.FieldByName('VLRCOTA').AsFloat,2),
                                                      fVlrOperacao, 0,
                                                      QryAtuAplicacoes.FieldByName('STAPROVISIONAIR').AsString,
                                                      'G',fVlrRendimento);

                                 If fVlrIR > 0 Then      // Se ná houve prejuizo
                                    fVlrIRProv := fVlrIR;
                              End;

                              //Último dia do mês
                              DecodeDate(dDataProcesso, Year, Month, Day);

                              dDtaUltDiaMes     := UltimoDiaMes(Year, Month);

                              If (dDtaUltDiaMes=dDataProcesso) and
                                ((QryAtuAplicacoes.FieldByName('DESCTIPOFUNDOINV').AsString = 'FAC') Or
                                 (QryAtuAplicacoes.FieldByName('DESCTIPOFUNDOINV').AsString = 'FIF')) Then
                              Begin
                                 dDataUltPgtoIR := dDtaUltDiaMes;
                                 fVlrIRLitigio  := fVlrIRProv;
                                 fVlrIOFLitigio := fVlrIOFProv;
                                 fVlrIRProv     := 0;
                                 fVlrIOFProv    := 0;
                              End
                              Else
                              Begin
                                 dDataUltPgtoIR := QryAtuAplicacoes.FieldByName('DATAULTPGTOIR').AsDateTime;
                                 fVlrIRLitigio  := 0;
                                 fVlrIOFLitigio := 0;
                              End;

                              If iTipoFundo <> 4 Then
                              Begin
                                 If dDtaUltDiaMes = dDataProcesso Then
                                 Begin
                                    //AL_153
                                    OperComum.LimpaParametros(DmFundoComum.QryPlanoPrevContabil);
                                    QryPlanoPrevContabil.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                            QryAtuAplicacoes.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                                    QryPlanoPrevContabil.Open;

                                    If fVlrIRLitigio > 0 Then
                                    Begin
                                       ExecutaQuery(QryAux,
                                          ' UPDATE HISTFUNDO SET VLRIRPROV = 0, DATAULTPGTOIR = '+
                                          ' TO_DATE('+QuotedStr(DateToStr(dDtaUltDiaMes))+',''DD/MM/YYYY'') '+
                                          ' WHERE  IDHISTFUNDO IN ('+
                                          ' SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO FROM '+
                                          '  ( SELECT * FROM HISTFUNDO '+
                                          '    WHERE '+
                                          '    TIPMOVFUNDO   <> ''PIR'' AND '+
                                          '    DATAAPLICACAO = TO_DATE('+
                                              QuotedStr(QryAtuAplicacoes.FieldByName('DATAAPLICACAO').AsString)+',''DD/MM/YYYY'')    AND '+
                                          '    DATAMOVFUNDO       <= TO_DATE('+QuotedStr(DateToStr(dDataProcesso))+',''DD/MM/YYYY'') AND '+
                                          '    IDFUNDOINVEST       = '+QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsString+'      AND '+
                                          '    IDPLANPREVCTBPATR   = '+QryAtuAplicacoes.FieldByName('IDPLANPREVCTBPATR').AsString+'  AND '+
                                          '    IDTIPOINVEST        = '+QryAtuAplicacoes.FieldByName('IDTIPOINVEST').AsString+'           '+
                                          '    ORDER BY IDFUNDOINVEST, DATAAPLICACAO, DATAMOVFUNDO,IDHISTFUNDO )'+
                                          ' GROUP BY IDFUNDOINVEST, DATAAPLICACAO) AND '+
                                          ' SALDOQTDCOTAS > 0');

                                       If Not GravaOperacaoFundo(QryAtuAplicacoes.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                                                 QryAtuAplicacoes.FieldByName('IDTIPOINVEST').AsInteger,
                                                                 -1, -46, -1,
                                                                 QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsInteger, -1,
                                                                 QryAtuAplicacoes.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                                 dDataProcesso, dDataProcesso, dDataProcesso,
                                                                 0, fVlrIRLitigio, 0, 0, 0, 0, iIDOperacao) Then
                                          Abort;

                                       if not Impostos.GravaIrLitigio(QryAtuAplicacoes.FieldByName('IDTIPOINVEST').AsInteger,
                                                      dDataProcesso,
                                                      -1,
                                                      'PAGAMENTO DE IR MENSAL - '+QryAtuAplicacoes.FieldByName('DESCFUNDOINVEST').AsString,
                                                      -1, QryPlanoPrevContabil.FieldByName('IDPLANOPREV').AsInteger,
                                                      QryPlanoPrevContabil.FieldByName('IDPATRO').AsInteger, fVlrIRLitigio,
                                                      fVlrRendimento,-1,iIDOperacao) then
                                          Abort;

                                       If Not GravaAplicacaoResgate(QryAtuAplicacoes.FieldByName('IDTIPOINVEST').AsInteger,
                                                                    -46,
                                                                    QryAtuAplicacoes.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                    QryAtuAplicacoes.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                                                    QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsInteger,
                                                                    QryAtuAplicacoes.FieldByName('DATAAPLICACAO').AsDateTime,
                                                                    dDataProcesso, dDataUltPgtoIR,
                                                                    'PAGAMENTO DE IR MENSAL - '+QryAtuAplicacoes.FieldByName('DESCFUNDOINVEST').AsString,
                                                                    '', 'PIR', QryAtuAplicacoes.FieldByName('VLRAPLICADO').AsFloat,
                                                                    fVlrOperacao, fVlrIRLitigio, 0, 0, 0, 0, fVlrIRLitigio,
                                                                    QryAtuAplicacoes.FieldByName('COTAAPLICACAO').AsFloat,
                                                                    0,
                                                                    QryAtuAplicacoes.FieldByName('IDPLANPREVCTBPATR').AsInteger,-1,
                                                                    QryAtuAplicacoes.FieldByName('IDCOMPOSICAOFUNDO').AsInteger) Then
                                          Abort;

                                    End;

                                    If fVlrIOFLitigio > 0 Then
                                    Begin
                                       DecodeDate((dDataProcesso-31), Year, Month, Day);

                                       dDtaUltDiaMes     := UltimoDiaMes(Year, Month);

                                       //AL_153
                                       OperComum.LimpaParametros(DmFundoComum.QryBuscaIofAnterior);
                                       QryBuscaIofAnterior.ParamByName('DATAOPERACAO').AsDateTime   := dDtaUltDiaMes;
                                       QryBuscaIofAnterior.ParamByName('IDOPERACAOORIGEM').AsInteger :=
                                                        QryAtuAplicacoes.FieldByName('IDOPERACAOFUNDO').AsInteger;
                                       QryBuscaIofAnterior.ParamByName('IDFUNDOINVEST').AsInteger   :=
                                                        QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsInteger;
                                       QryBuscaIofAnterior.Open;

                                       fVlrIOFLitigio := ABS(fVlrIOFLitigio - QryBuscaIofAnterior.FieldByName('VLRIOF').AsFloat);

                                       OperComum.LimpaParametros(DmFundoComum.QryBuscaIofAnterior);

                                       If Not GravaOperacaoFundo(QryAtuAplicacoes.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                                                 QryAtuAplicacoes.FieldByName('IDTIPOINVEST').AsInteger,
                                                                 -1, -47, -1,
                                                                 QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsInteger, -1,
                                                                 QryAtuAplicacoes.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                                 dDataProcesso, dDataProcesso, dDataProcesso,
                                                                 0, 0, fVlrIOFLitigio, 0, 0, 0, iIDOperacao) Then
                                          Abort;

                                       If Not GravaAplicacaoResgate(QryAtuAplicacoes.FieldByName('IDTIPOINVEST').AsInteger,
                                                                    -47,
                                                                    QryAtuAplicacoes.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                    QryAtuAplicacoes.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                                                    QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsInteger,
                                                                    QryAtuAplicacoes.FieldByName('DATAAPLICACAO').AsDateTime,
                                                                    dDataProcesso, dDataUltPgtoIR,
                                                                    'PAGAMENTO DE IOF MENSAL - '+QryAtuAplicacoes.FieldByName('DESCFUNDOINVEST').AsString,
                                                                    '', 'PIR', QryAtuAplicacoes.FieldByName('VLRAPLICADO').AsFloat,
                                                                    fVlrOperacao, fVlrIOFLitigio, 0, 0, 0, 0, fVlrIOFLitigio,
                                                                    QryAtuAplicacoes.FieldByName('COTAAPLICACAO').AsFloat,
                                                                    0,
                                                                    QryAtuAplicacoes.FieldByName('IDPLANPREVCTBPATR').AsInteger,-1,
                                                                    QryAtuAplicacoes.FieldByName('IDCOMPOSICAOFUNDO').AsInteger) Then
                                          Abort;

                                    End;
                                    OperComum.LimpaParametros(DmFundoComum.QryPlanoPrevContabil);
                                 End;
                              End;
                           End;
                        End;

                        dDataProcesso := dDataProcesso  + 1;
                        While not DiasUteisInv.DiaUtil(dDataProcesso,-1,1,'',True,False,False) Do
                           dDataProcesso := dDataProcesso  + 1;

                     End;
                  End
                  Else
                    dDataProcesso := dDataProcesso+1;
               End;
               QryAtuAplicacoes.Next;
            End;
            QryPatroPlanPrevContab.Next;
         End;

         // Confirma Transação
         dtmBaseDados.dbBaseDados.Commit;

         //AL_153
         OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
         OperComum.LimpaParametros(DmFundoComum.QryAplPgtoIR);
         OperComum.LimpaParametros(DmFundoComum.QryAtuAplicacoes);
         OperComum.LimpaParametros(DmFundoComum.QryPlanoPrevContabil);
         OperComum.LimpaParametros(DmFundoComum.QryPatroPlanPrevContab);

         If bForm Then
         begin
            frmFechtoFundos.pnlPlanoPatrocinadora.Caption := ' ';
            frmFechtoFundos.pnlPlanoPatrocinadora.Repaint;

            frmFechtoFundos.Label2.Visible := True;
            frmFechtoFundos.Label2.Caption := ' ';
            frmFechtoFundos.Label2.Visible := False;
            frmFechtoFundos.Label2.Repaint;
         end;
      End;
   Except
      On E:Exception Do Begin
        DtmBaseDados.dbBaseDados.Rollback;

        If bMostraMsg Then
           MsgDlg('Não foi possível atualizar a aplicação! Operação será cancelada.'#13+
                  'Com a mensagem:'#13+
                  E.Message,'Mensagem do Sistema', mtInformation,[mbOk],0);

        If bForm Then
        begin
           frmFechtoFundos.Label2.Visible := False;
           frmFechtoFundos.Label2.Repaint;

           frmFechtoFundos.lblDescFundo.Caption := ' ';
           frmFechtoFundos.lblDescFundo.Repaint;
           frmFechtoFundos.pnlPlanoPatrocinadora.Caption := ' ';
           frmFechtoFundos.pnlPlanoPatrocinadora.Repaint;
        end;
        Result := False;
        Exit;
      End;
   End;
   Result := True;
   If bForm Then
   begin
      frmFechtoFundos.lblDescFundo.Caption := ' ';
      frmFechtoFundos.lblDescFundo.Repaint;
      frmFechtoFundos.pnlPlanoPatrocinadora.Caption := ' ';
      frmFechtoFundos.pnlPlanoPatrocinadora.Repaint;
   end;
end;

Function LimitePerCota(dData       : TDateTime;
                       iIdFundo    : Integer;
                       fValorCota  : Double) : Double;
Var
   QryAux     : TwwQuery;
   DadosCota  : TDadosCota;
Begin
   QryAux     := DmFundoComum.qryAux;
   dData      := dData - 1;
   While not DiasUteisInv.DiaUtil(dData, -1, 1,'',True,False,False) Do
      dData   := dData - 1;

   DadosCota  := UFundoComum.BuscaCotaFundo(QryAux, iIdFundo, dData);

   Result     := OperComum.Round(((OperComum.DivValorZero(fValorCota,DadosCota.VlrCota)-1)*100)-0.0049,2);

End;

//AL_14
//Alt_4
Function  Reprocessamento(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                          dDataOper, dDataUltFech, dDataIniProc : TDateTime;
                          bMostraMsg                 : Boolean;
                          iTipoCota  : Integer = -1;
                          fraFrame: TfraMensagem = nil;
                          flgTransfCota: boolean = False) : Boolean;
Var
   dDataProcesso, dDataFinal : TDateTime;
   i : Integer;
   //Ricardo Cristiano - 07/01/2010 - N. Sol 129265 -  N. Kintana 707133
   iTipoFundoInvestReproc : Integer;
begin
   Result := True;

   //Ricardo Cristiano - 07/01/2010 - N. Sol 129265 -  N. Kintana 707133
   iTipoFundoInvestReproc := iTipoFundoInvest;

   //Al_102
   if VerEmAbertura(iTipoFundoInvest) then
   begin
      Result := False;
      Exit;

   end;

   //AL_14
   if  (dDataIniProc <> 0) and (dDataOper <= dDataIniProc) then
   begin
      MsgDlg('A operação não será reprocessada pois a Data '+ #13+
             'da Operação : ' + DateToStr(dDataOper) + ' é menor ou igual à' +
             'Data de Início de Reprocessamento : '+ DateToStr(dDataIniProc),
             'Atenção', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;

   //AL_134
   //AL_59
   if not CtrlInvContab.TestaPeriodo(DateToStr(dDataOper)) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistemas', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;

   With DmFundoComum Do
   Begin
      dDataFinal    := dDataUltFech;
      dDataProcesso := dDataOper;

      //Alt_4
      if fraFrame <> nil then
      begin
         fraFrame.Mostra;
         fraFrame.Pos := 0;
         //Al_73
         fraFrame.Max := (DiasUteisInv.IntervaloDiasUteis(dDataProcesso, dDataFinal, -1, 1, '',True, False, False)*2);
         fraFrame.Mes := 'Aguarde - Reprocessando de '+DateToStr(dDataProcesso)+' até '+DateToStr(dDataFinal);
      end
      else
      begin
         frmAguardeInv.Pos := 0;
         //Al_73
         frmAguardeInv.Max := (DiasUteisInv.IntervaloDiasUteis(dDataProcesso, dDataFinal, -1, 1, '',True, False, False)*2);
         frmAguardeInv.Mostra('Aguarde - Reprocessando de '+DateToStr(dDataProcesso)+' até '+DateToStr(dDataFinal));
      end;

      Try
         //Al_102
         GravaEmAbertura(iTipoFundoInvest,'S');

         If not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         //Al_74
         //Guarda histórico ATU para deleção
         OperComum.LimpaParametros(QryHistFundoRetr);
         QryHistFundoRetr.ParamByName('DATAMOVFUNDO').AsDateTime        := dDataProcesso;
         QryHistFundoRetr.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvest;
         QryHistFundoRetr.ParamByName('IDFUNDOINVEST').AsInteger        := iFundoInvest;
         //Alt_30
         If iTipoCota > 0 Then
            QryHistFundoRetr.ParamByName('IDTIPOCOTA').AsInteger        := iTipoCota;
         //Alt_30
         If iPlano > 0 Then
            QryHistFundoRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
         QryHistFundoRetr.Open;

         //Guarda histórico de integracao de cotas para deleção do contabil
         OperComum.LimpaParametros(QryHistCotaIntegRetr);
         QryHistCotaIntegRetr.ParamByName('DATAHISTCOTA').AsString    := DateToStr(dDataProcesso);
         QryHistCotaIntegRetr.ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvest;
         QryHistCotaIntegRetr.ParamByName('IDFUNDOINVEST').AsInteger  := iFundoInvest;
         If iTipoCota > 0 Then
            QryHistCotaIntegRetr.ParamByName('IDTIPOCOTA').AsInteger  := iTipoCota;
         If iPlano > 0 Then
            QryHistCotaIntegRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
         QryHistCotaIntegRetr.Open;

         // AL_157
         if fraFrame <> nil then
         begin
            if QryHistCotaIntegRetr.RecordCount > 0 then
               fraFrame.Max := fraFrame.Max + (DiasUteisInv.IntervaloDiasUteis(dDataProcesso, dDataFinal, -1, 1, '',True, False, False));
            If iTipoInvest in [6,7,9,10] then
               fraFrame.Max := fraFrame.Max + QryHistFundoRetr.RecordCount + QryHistCotaIntegRetr.RecordCount + 13
            else
               fraFrame.Max := fraFrame.Max + QryHistFundoRetr.RecordCount + QryHistCotaIntegRetr.RecordCount + 12;
            fraFrame.Incrementa;
            fraFrame.Invalidate;
            fraFrame.Update;
         end
         else
         begin
            if QryHistCotaIntegRetr.RecordCount > 0 then
               frmAguardeInv.Max := frmAguardeInv.Max + (DiasUteisInv.IntervaloDiasUteis(dDataProcesso, dDataFinal, -1, 1, '',True, False, False));
            If iTipoInvest in [6,7,9,10] then
               frmAguardeInv.Max := frmAguardeInv.Max + QryHistFundoRetr.RecordCount + QryHistCotaIntegRetr.RecordCount + 13
            else
               frmAguardeInv.Max := frmAguardeInv.Max + QryHistFundoRetr.RecordCount + QryHistCotaIntegRetr.RecordCount + 12;
            Try
              frmAguardeInv.Incrementa;
            except
            end;
         end;

         //Alt_33
         if iTipoInvest = 5 then
         begin
            if not ZeraCotaCartGerencRF(dDataProcesso) then
            begin
               If dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.Rollback;
               //Al_102
               GravaEmAbertura(iTipoFundoInvest,'N');
               OperComum.LimpaParametros(DmFundoComum.QryHistCotaIntegRetr);
               OperComum.LimpaParametros(DmFundoComum.QryHistFundoRetr);
               Result := False;
               Exit;
            end;
         end;

         //AL_148

         if fraFrame <> nil then
         begin
            fraFrame.Incrementa;
            fraFrame.Invalidate;
            fraFrame.Update;
         end
         else
         begin
            Try
              frmAguardeInv.Caption := 'Limpando o histórico do Fluxo - Cotas';
              frmAguardeInv.Incrementa;
            except
            end;
         end;

         //AL_173
         //AL_148
         OperComum.LimpaParametros(QryDelHistCtIntRetr);
         QryDelHistCtIntRetr.ParamByName('DATAHISTCOTA').AsString    := DateToStr(dDataProcesso);
         QryDelHistCtIntRetr.ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvest;
         QryDelHistCtIntRetr.ParamByName('IDFUNDOINVEST').AsInteger  := iFundoInvest;
         If iTipoCota > 0 Then
            QryDelHistCtIntRetr.ParamByName('IDTIPOCOTA').AsInteger  := iTipoCota;
         If iPlano > 0 Then
            QryDelHistCtIntRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
         QryDelHistCtIntRetr.ExecSql;

         if fraFrame <> nil then
         begin
            fraFrame.Incrementa;
            fraFrame.Invalidate;
            fraFrame.Update;
         end
         else
         begin
            Try
              frmAguardeInv.Incrementa;
            except
            end;
         end;

         QryHistCotaIntegRetr.First;
         While Not QryHistCotaIntegRetr.Eof Do
         begin
            If ((QryHistCotaIntegRetr.FieldByName('PLANO').AsInteger > 0) And
                (QryHistCotaIntegRetr.FieldByName('PLNCODIGO').AsInteger > 0)) Then
            begin
               If Not ProcExcluiContabil(QryHistCotaIntegRetr.FieldByName('PLANO').AsInteger,
                                         QryHistCotaIntegRetr.FieldByName('PLNCODIGO').AsInteger) Then
               begin
                  If dtmBaseDados.dbBaseDados.InTransaction then
                     dtmBaseDados.dbBaseDados.Rollback;
                  //Al_102
                  GravaEmAbertura(iTipoFundoInvest,'N');
                  OperComum.LimpaParametros(DmFundoComum.QryHistCotaIntegRetr);
                  OperComum.LimpaParametros(DmFundoComum.QryHistFundoRetr);
                  Result := False;
                  Exit;
               end;
            end;
            QryHistCotaIntegRetr.Next;
         end;
         OperComum.LimpaParametros(DmFundoComum.QryHistCotaIntegRetr);

         if fraFrame <> nil then
         begin
            fraFrame.Incrementa;
            fraFrame.Invalidate;
            fraFrame.Update;
         end
         else
         begin
            Try
              frmAguardeInv.Caption := 'Preparando atualizações do dia';
              frmAguardeInv.Incrementa;
            except
            end;
         end;

         //AL_148
         //Al_142
         //AL_148
         //Exclui as operações de resgate da operacaofundo
         OperComum.LimpaParametros(QryDelIrLitigioRetr);
         QryDelIrLitigioRetr.ParamByName('DATAPEDIDO').AsDateTime        := dDataProcesso;
         QryDelIrLitigioRetr.ParamByName('IDTIPOINVEST').AsInteger       := iTipoInvest;
         QryDelIrLitigioRetr.ParamByName('IDFUNDOINVEST').AsInteger      := iFundoInvest;
         //Alt_30
         If iTipoCota > 0 Then
            QryDelIrLitigioRetr.ParamByName('IDTIPOCOTA').AsInteger      := iTipoCota;
         //Alt_30
         If iPlano > 0 Then
            QryDelIrLitigioRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
         QryDelIrLitigioRetr.ExecSql;

         if fraFrame <> nil then
         begin
            fraFrame.Incrementa;
            fraFrame.Invalidate;
            fraFrame.Update;
         end
         else
         begin
            Try
              frmAguardeInv.Incrementa;
            except
            end;
         end;

         //AL_185
         //Exclui as operações de resgate da OPERINVXOPERFDO(Resgate de Fundos de Investimento com Compra de Ações)
         OperComum.LimpaParametros(QryDelOperInvXoperFdo);
         QryDelOperInvXoperFdo.ParamByName('DATAPEDIDO').AsDateTime    := dDataProcesso;
         QryDelOperInvXoperFdo.ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvest;
         QryDelOperInvXoperFdo.ParamByName('IDFUNDOINVEST').AsInteger  := iFundoInvest;
         If iTipoCota > 0 Then
            QryDelOperInvXoperFdo.ParamByName('IDTIPOCOTA').AsInteger  := iTipoCota;
         If iPlano > 0 Then
            QryDelOperInvXoperFdo.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
         QryDelOperInvXoperFdo.ExecSql;

         if fraFrame <> nil then
         begin
            fraFrame.Incrementa;
            fraFrame.Invalidate;
            fraFrame.Update;
         end
         else
         begin
            Try
              frmAguardeInv.Incrementa;
            except
            end;
         end;

         //Exclui as operações de resgate da operacaofundo
         OperComum.LimpaParametros(QryDelResgOperFundoRetr);
         QryDelResgOperFundoRetr.ParamByName('DATAPEDIDO').AsDateTime    := dDataProcesso;
         QryDelResgOperFundoRetr.ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvest;
         QryDelResgOperFundoRetr.ParamByName('IDFUNDOINVEST').AsInteger  := iFundoInvest;
         //Alt_30
         If iTipoCota > 0 Then
            QryDelResgOperFundoRetr.ParamByName('IDTIPOCOTA').AsInteger  := iTipoCota;
         //Alt_30
         If iPlano > 0 Then
            QryDelResgOperFundoRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
         QryDelResgOperFundoRetr.ExecSql;

         if fraFrame <> nil then
         begin
            fraFrame.Incrementa;
            fraFrame.Invalidate;
            fraFrame.Update;
         end
         else
         begin
            Try
              frmAguardeInv.Caption := 'Limpando o histórico das Atualizações';
              frmAguardeInv.Incrementa;
            except
            end;
         end;

         //AL_170
         //Exclui as operações de resgate a cotizar da operacaofundo
         OperComum.LimpaParametros(QryDelResgOperCotizarRetr);
         QryDelResgOperCotizarRetr.ParamByName('DATAPEDIDO').AsDateTime    := dDataProcesso;
         QryDelResgOperCotizarRetr.ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvest;
         QryDelResgOperCotizarRetr.ParamByName('IDFUNDOINVEST').AsInteger  := iFundoInvest;
         If iTipoCota > 0 Then
            QryDelResgOperCotizarRetr.ParamByName('IDTIPOCOTA').AsInteger  := iTipoCota;
         If iPlano > 0 Then
            QryDelResgOperCotizarRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
         QryDelResgOperCotizarRetr.ExecSql;

         if fraFrame <> nil then
         begin
            fraFrame.Incrementa;
            fraFrame.Invalidate;
            fraFrame.Update;
         end
         else
         begin
            Try
              frmAguardeInv.Caption := 'Limpando o histórico das Atualizações';
              frmAguardeInv.Incrementa;
            except
            end;
         end;

         QryHistFundoRetr.First;
         While Not QryHistFundoRetr.Eof Do
         begin
            If Not ProcExcluiContabil(QryHistFundoRetr.FieldByName('PLANO').AsInteger,
                                      QryHistFundoRetr.FieldByName('PLNCODIGO').AsInteger) Then
            begin
               If dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.Rollback;
               //Al_102
               GravaEmAbertura(iTipoFundoInvest,'N');
               OperComum.LimpaParametros(DmFundoComum.QryHistCotaIntegRetr);
               OperComum.LimpaParametros(DmFundoComum.QryHistFundoRetr);
               Result := False;
               Exit;
            end;
            QryHistFundoRetr.Next;
         end;
         OperComum.LimpaParametros(DmFundoComum.QryHistFundoRetr);

         if fraFrame <> nil then
         begin
            fraFrame.Incrementa;
            fraFrame.Invalidate;
            fraFrame.Update;
         end
         else
         begin
            Try
              frmAguardeInv.Incrementa;
            except
            end;
         end;

         //AL_148
         //Exclui operações e atualizações no dia do Histórico
         OperComum.LimpaParametros(QryDelHistFundoRetr);
         QryDelHistFundoRetr.ParamByName('DATAMOVFUNDO').AsDateTime     := dDataProcesso;
         QryDelHistFundoRetr.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvest;
         QryDelHistFundoRetr.ParamByName('IDFUNDOINVEST').AsInteger     := iFundoInvest;
         //Alt_30
         If iTipoCota > 0 Then
            QryDelHistFundoRetr.ParamByName('IDTIPOCOTA').AsInteger     := iTipoCota;
         //Alt_30
         If iPlano > 0 Then
            QryDelHistFundoRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
         QryDelHistFundoRetr.ExecSql;

         if fraFrame <> nil then
         begin
            fraFrame.Mes := 'Aguarde - Reprocessando de '+DateToStr(dDataProcesso)+' até '+DateToStr(dDataFinal);
            fraFrame.Incrementa;
            fraFrame.Invalidate;
            fraFrame.Update;
         end
         else
         begin
            Try
              //AL_145
              If iTipoInvest in [6,7,9,10] then
                 frmAguardeInv.Caption := 'Atualizando o histórico do Fluxo - Cotas'
              else
                 frmAguardeInv.Caption := 'Atualizando o histórico das Aplicações  ';
              frmAguardeInv.Mostra('Aguarde - Reprocessando de '+DateToStr(dDataProcesso)+' até '+DateToStr(dDataFinal));
              frmAguardeInv.Incrementa;
            except
            end;
         end;

         If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;

         While (dDataProcesso <= dDataFinal) Do
         begin
             //Ricardo Cristiano - 07/01/2010 - N. Sol 129265 -  N. Kintana 707133
             VerificaTipoFundoInvestVig(dDataProcesso, iFundoInvest, iTipoFundoInvest, iTipoInvest, iTipoCota, flgTransfCota);

            //AL_145
            If iTipoInvest in [6,7,9,10] then
            begin
               If not AtualizaCotaIntegralizar(dDataProcesso, iTipoFundoInvest, iFundoInvest, False) then
               begin
                  //Ricardo Cristiano - 07/01/2010 - N. Sol 129265 -  N. Kintana 707133
                  iTipoFundoInvest := iTipoFundoInvestReproc;
                  //AL_157
                  //Al_102
                  GravaEmAbertura(iTipoFundoInvest,'N');
                  if fraFrame <> nil then
                  begin
                     fraFrame.Pos := 0;
                     fraFrame.Mes := '';
                     fraFrame.Apaga;
                  end
                  else
                     frmAguardeInv.Apaga;
                  Result := False;
                  Exit;
               end;

               //Al_70
               if Not AtualizaHistCotaIntegr(dDataProcesso, iTipoCota, iTipoInvest,
                                             iTipoFundoInvest, iFundoInvest, iPlano, False) then
               begin
                  //Ricardo Cristiano - 07/01/2010 - N. Sol 129265 -  N. Kintana 707133
                  iTipoFundoInvest := iTipoFundoInvestReproc;
                  //AL_157
                  //Al_102
                  GravaEmAbertura(iTipoFundoInvest,'N');
                  if fraFrame <> nil then
                  begin
                     fraFrame.Pos := 0;
                     fraFrame.Mes := '';
                     fraFrame.Apaga;
                  end
                  else
                     frmAguardeInv.Apaga;
                  Result := False;
                  Exit;
               end;

               if fraFrame <> nil then
               begin
                  fraFrame.Mes := 'Aguarde - Reprocessando de '+DateToStr(dDataProcesso)+' até '+DateToStr(dDataFinal);
                  fraFrame.Incrementa;
                  fraFrame.Invalidate;
                  fraFrame.Update;
               end
               else
               begin
                  Try
                    frmAguardeInv.Mostra('Aguarde - Reprocessando de '+DateToStr(dDataProcesso)+' até '+DateToStr(dDataFinal));
                    frmAguardeInv.Incrementa;
                  except
                  end;
               end;

               if fraFrame = nil then
                  frmAguardeInv.Caption := 'Atualizando o histórico das Aplicações  ';

            end;

            If not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;

            If Not AtualizaSaldoFundos(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                                       dDataProcesso, bMostraMsg, False, iTipoCota) Then
            begin
               If dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.Rollback;
               //Ricardo Cristiano - 07/01/2010 - N. Sol 129265 -  N. Kintana 707133
               iTipoFundoInvest := iTipoFundoInvestReproc;
               //Al_102
               GravaEmAbertura(iTipoFundoInvest,'N');
               //Alt_4
               if fraFrame <> nil then
               begin
                  fraFrame.Pos := 0;
                  fraFrame.Mes := '';
                  fraFrame.Apaga;
               end
               else
                  frmAguardeInv.Apaga;
               Result := False;
               Exit;
            end;

            if fraFrame <> nil then
            begin
               fraFrame.Incrementa;
               fraFrame.Invalidate;
               fraFrame.Update;
            end
            else
            begin
               Try
                 frmAguardeInv.Caption := 'Efetuando lançamento das Operações  ';
                 frmAguardeInv.Incrementa;
               except
               end;
            end;

            If Not EfetuaOperacoesRetro(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                                        dDataProcesso, bMostraMsg, iTipoCota) Then
            begin
               If dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.Rollback;
               //Ricardo Cristiano - 07/01/2010 - N. Sol 129265 -  N. Kintana 707133
               iTipoFundoInvest := iTipoFundoInvestReproc;
               //Al_102
               GravaEmAbertura(iTipoFundoInvest,'N');
               //Alt_4
               if fraFrame <> nil then
               begin
                  fraFrame.Pos := 0;
                  fraFrame.Mes := '';
                  fraFrame.Apaga;
               end
               else
                  frmAguardeInv.Apaga;
               Result := False;
               Exit;
            end;

            if fraFrame <> nil then
            begin
               fraFrame.Incrementa;
               fraFrame.Invalidate;
               fraFrame.Update;
            end
            else
            begin
               Try
                 //AL_145
                 If iTipoInvest in [6,7,9,10] then
                    frmAguardeInv.Caption := 'Atualizando o histórico do Fluxo - Cotas'
                 else
                    frmAguardeInv.Caption := 'Atualizando o histórico das Aplicações  ';
                 frmAguardeInv.Incrementa;
               except
               end;
            end;

            If dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Commit;

            dDataProcesso := dDataProcesso  + 1;
            If (iTipoFundoInvest <> 1) Then
            begin
                While not DiasUteisInv.DiaUtil(dDataProcesso,-1,1,'',True,False,False) Do
                begin
                   dDataProcesso := dDataProcesso  + 1;
                   for i := 1 to 2 do
                   begin
                      if fraFrame <> nil then
                      begin
                         fraFrame.Mes := 'Aguarde - Reprocessando de '+DateToStr(dDataProcesso)+' até '+DateToStr(dDataFinal);
                         fraFrame.Incrementa;
                         fraFrame.Invalidate;
                         fraFrame.Update;
                      end
                      else
                      begin
                         Try
                           frmAguardeInv.Mostra('Aguarde - Reprocessando de '+DateToStr(dDataProcesso)+' até '+DateToStr(dDataFinal));
                           frmAguardeInv.Incrementa;
                         except
                         end;
                      end;
                   end;
                end;
            end;
         end;
         Result := True;
      Except
         If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;

         OperComum.LimpaParametros(DmFundoComum.QryHistCotaIntegRetr);
         OperComum.LimpaParametros(DmFundoComum.QryHistFundoRetr);

         Result := False;
      End;

      //Ricardo Cristiano - 07/01/2010 - N. Sol 129265 -  N. Kintana 707133
      iTipoFundoInvest := iTipoFundoInvestReproc;
      //Al_102
      GravaEmAbertura(iTipoFundoInvest,'N');

      //Alt_4
      if fraFrame <> nil then
      begin
         fraFrame.Pos := 0;
         fraFrame.Mes := '';
         fraFrame.Apaga;
      end
      else
      begin
         try
            frmAguardeInv.Pos := 0;
            frmAguardeInv.Max := 0;
            frmAguardeInv.Mostra('Reprocessando finalizado');
            if frmAguardeInv <> nil then
               frmAguardeInv.Apaga;
         except
         end;
      end;
   end;
end;

Function EfetuaOperacoesRetro(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                              dDataProcesso : TDateTime;
                              bMostraMsg    : boolean;
                              iTipoCota     : Integer = -1) : Boolean;
begin
   With DmFundoComum Do
   begin
      Try
         If Not AjusteRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                           dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         //AL_203
         // AL_198
         // Lancar as transferências TRP na HistFundo
         If Not TransfFundoLote(iTipoInvest, iFundoInvest, iTipoFundoInvest,
                                dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         //Ricardo Cristiano - 28/10/2008 - N. Sol 99367 -  N. Kintana 435730
         If Not TransfTipoFundo(iTipoInvest, iFundoInvest, iTipoFundoInvest,
                                dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         //Ricardo Cristiano - 28/11/2008 - N. Sol 99876 -  N. Kintana 441255
         If Not TransfCotaIntegr(iTipoInvest, iFundoInvest, iTipoFundoInvest,
                                 dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         //Renan Cristiano SOL 130444 Kinana 733394
         if Not TransfHistCotaIntegr(iTipoInvest,iFundoInvest,dDataProcesso,
                                     bMostraMsg,iTipoCota) then
         Begin
           Result := False;
           Exit;
         End;

         //AL_198 - Retirado
         //AL_150

         //AL_170
         If Not CotizaAplicacao(dDataProcesso, iFundoInvest, iPlano, iTipoFundoInvest) Then
         Begin
            Result := False;
            Exit;
         End;

         OperComum.LimpaParametros(QryAplFundosRetr);
         QryAplFundosRetr.ParamByName('DATAOPERACAO').AsDateTime         := dDataProcesso;
         QryAplFundosRetr.ParamByName('IDTIPOINVEST').AsInteger          := iTipoInvest;
         QryAplFundosRetr.ParamByName('IDFUNDOINVEST').AsInteger         := iFundoInvest;
         //Alt_30
         If iTipoCota > 0 Then
            QryAplFundosRetr.ParamByName('IDTIPOCOTA').AsInteger         := iTipoCota;
         //Alt_30
         If iPlano    > 0 Then
            QryAplFundosRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger  := iPlano;
         QryAplFundosRetr.Open;

         //Todas as Operações menos as de Resgates
         QryAplFundosRetr.First;
         While Not QryAplFundosRetr.Eof Do
         begin
            // AL_39
            If ((QryAplFundosRetr.FieldByName('CODTIPDOC').AsInteger      <> 0)   And
               ((QryAplFundosRetr.FieldByName('IDTIPOOPERACAO').AsInteger  > 0) or
                (QryAplFundosRetr.FieldByName('IDTIPOOPERACAO').AsInteger  = -34)))  Or
               ((iTipoCota > 0) And
                (QryAplFundosRetr.FieldByName('IDTIPOOPERACAO').AsInteger  > 0))   Then
            begin
               If Not AplicacaoRetr(iTipoInvest, iTipoFundoInvest,
                                    QryAplFundosRetr.FieldByName('IDTIPOOPERACAO').AsInteger,
                                    iFundoInvest,
                                    QryAplFundosRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                    dDataProcesso, bMostraMsg
                                    iTipoCota) Then
               Begin
                  OperComum.LimpaParametros(DmFundoComum.QryAplFundosRetr);
                  Result := False;
                  Exit;
               End;
            end;

            QryAplFundosRetr.Next;
         end;
         OperComum.LimpaParametros(DmFundoComum.QryAplFundosRetr);

         //Al_88
         If Not BloqueioCotasRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                                  dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         //Al_77
         If Not SubscricaoCotasIntegRetr(iTipoInvest, iTipoFundoInvest,
                                         iFundoInvest, iPlano, -119,
                                         dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         //Al_75
         If Not FluxoCotasIntegRetr(iTipoInvest, iTipoFundoInvest,
                                    iFundoInvest, iPlano, -100,
                                    dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         If Not FluxoCotasIntegRetr(iTipoInvest, iTipoFundoInvest,
                                    iFundoInvest, iPlano, -105,
                                    dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         // SOL 166338.6801 Kintana 1451970 Otacilio Aquino
         If Not FluxoCotasIntegRetr(iTipoInvest, iTipoFundoInvest,
                                    iFundoInvest, iPlano, -1005,
                                    dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         //Al_76
         If Not IntegralizacaoCotasRetr(iTipoInvest, iTipoFundoInvest,
                                        iFundoInvest, iPlano, -100,
                                        dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         //Al_68
         //Alt_6
         If Not IntegralizacaoCotasRetr(iTipoInvest, iTipoFundoInvest,
                                        iFundoInvest, iPlano, -105,
                                        dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         // SOL 166338.6801 Kintana 1451970 Otacilio Aquino
         If Not IntegralizacaoCotasRetr(iTipoInvest, iTipoFundoInvest,
                                        iFundoInvest, iPlano, -1005,
                                        dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         //Ricardo Cristiano - 24/02/2010 - N. Sol 131393 -  N. Kintana 747826         
         If Not AmortizacaoRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                                 dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;         

         //Alt_8
         If Not CancelamentoSubsCotasRetr(iTipoInvest, iTipoFundoInvest,
                                          iFundoInvest, iPlano, -106,
                                          dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         //AL_170
         If Not CotizaResgate(dDataProcesso, iFundoInvest, iPlano, iTipoFundoInvest) Then
         Begin
            Result := False;
            Exit;
         End;

         //Alt_20
         //AL_144
         //Al_124
         If Not ResgateRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                            dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         //Ricardo Cristiano - 24/02/2010 - N. Sol 131393 -  N. Kintana 747826         

         //Alt_13
         If Not RecebimentosRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                                 dDataProcesso, bMostraMsg, iTipoCota) Then
         Begin
            Result := False;
            Exit;
         End;

         Result := True;
      Except
         Result := False;
      End;
   end;
end;

//Alt_13
function RecebimentosRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                         dDataProcesso : TDateTime;
                         bMostraMsg    : Boolean;
                         iTipoCota     : Integer = -1) : Boolean;
Var iIdForCli, iPlanilha, iDocumento : Integer;
    //AL_162
    sMens: String;
begin
   With DmFundoComum Do
   begin
      OperComum.LimpaParametros(qryRecebimentosRetr);
      qryRecebimentosRetr.ParamByName('DATAOPERACAO').AsString           := DateToStr(dDataProcesso);
      qryRecebimentosRetr.ParamByName('IDTIPOINVEST').AsInteger          := iTipoInvest;
      //Alt_30
      If iTipoCota > 0 Then
         qryRecebimentosRetr.ParamByName('IDTIPOCOTA').AsInteger         := iTipoCota;
      qryRecebimentosRetr.ParamByName('IDFUNDOINVEST').AsInteger         := iFundoInvest;
      //Alt_30
      If iPlano > 0 Then
         qryRecebimentosRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger  := iPlano;
      qryRecebimentosRetr.Open;

      Try
         qryRecebimentosRetr.First;
         While Not qryRecebimentosRetr.Eof Do
         Begin
            iPlanilha  := -1;
            iDocumento := -1;
            iPlano     := -1;

            iIdForCli := OperComum.BuscaForCli(qryRecebimentosRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                               qryRecebimentosRetr.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                               qryRecebimentosRetr.FieldByName('IDTIPOOPERACAO').AsInteger,
                                               pRPI.IDTIPOCLIENTEEMI);
            OperComum.LimpaParametros(DmFundoComum.QryAux);
            QryAux.SQL.Clear;
            QryAux.SQL.Add('SELECT PA.IDPLANPREVCTBPATR, PA.IDPATRO, PA.IDPLANOPREV');
            QryAux.SQL.Add('FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL');
            QryAux.SQL.Add('WHERE (PA.IDPLANPREVCTBPATR = ' + IntToStr(iPlano) +') AND');
            QryAux.SQL.Add('(PA.IDPATRO = PE.IDPESSOA(+)) AND');
            QryAux.SQL.Add('(PA.IDPLANOPREV = PL.IDPLANOPREV)');
            QryAux.Open;

            //AL_162
            if not AlimentaFundo(qryRecebimentosRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                 qryRecebimentosRetr.FieldByName('IDTIPOOPERACAO').AsInteger,
                                 qryRecebimentosRetr.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                 qryRecebimentosRetr.FieldByName('IDFUNDOINVEST').AsInteger,
                                 QryAux.FieldByName('IDPLANOPREV').AsInteger,
                                 QryAux.FieldByName('IDPATRO').AsInteger,
                                 qryRecebimentosRetr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                 qryRecebimentosRetr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                 qryRecebimentosRetr.FieldByName('QTDDECQTD').AsInteger,
                                 qryRecebimentosRetr.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                 iIdForCli,
                                 qryRecebimentosRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                 qryRecebimentosRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                 qryRecebimentosRetr.FieldByName('DATALIQUIDACAO').AsDateTime,
                                 qryRecebimentosRetr.FieldByName('QTDOPERACAO').AsFloat,
                                 qryRecebimentosRetr.FieldByName('VLRCOTA').AsFloat,
                                 qryRecebimentosRetr.FieldByName('VLROPERACAO').AsFloat,
                                 qryRecebimentosRetr.FieldByName('VLRIR').AsFloat,
                                 0{IOF},
                                 'R',
                                 Trim(qryRecebimentosRetr.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                 qryRecebimentosRetr.FieldByName('DESCFUNDOINVEST').AsString, 'OPE', True,
                                 qryRecebimentosRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger,-1,-1,
                                 qryRecebimentosRetr.FieldByName('VLRRENDIMENTO').AsFloat, sMens) then
            begin
               OperComum.LimpaParametros(DmFundoComum.QryAux);
               OperComum.LimpaParametros(DmFundoComum.qryRecebimentosRetr);
               Result := False;
               Exit;
            end;

            if qryRecebimentosRetr.FieldByName('VLRIR').AsFloat > 0 Then
            begin
               if not Impostos.GravaIrLitigio(qryRecebimentosRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                              qryRecebimentosRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                              -1,
                                              'IRRF (LIMINAR)/DIVIDENDOS - '+ qryRecebimentosRetr.FieldByName('DESCFUNDOINVEST').AsString,
                                              -1, iPlanoPrevContab, iPlanPrevCtbPatro,
                                              qryRecebimentosRetr.FieldByName('VLRIR').AsFloat,
                                              qryRecebimentosRetr.FieldByName('VLRRENDIMENTO').AsFloat,
                                              -1,qryRecebimentosRetr.FieldByName('IDOPERACAOFUNDO').AsInteger) then
               begin
                  OperComum.LimpaParametros(DmFundoComum.QryAux);
                  OperComum.LimpaParametros(DmFundoComum.qryRecebimentosRetr);
                  Result := False;
                  Exit;
               end;
            end;

            OperComum.LimpaParametros(DmFundoComum.QryAux);
            ExecutaQuery(QryAux, 'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'' WHERE '+
                                 '(IDOPERACAOFUNDO   = '''+
                                 IntToStr(qryRecebimentosRetr.FieldByName('IDOPERACAOFUNDO').AsInteger)  +''')');
            OperComum.LimpaParametros(DmFundoComum.QryAux);
            //Al_48
            qryRecebimentosRetr.Next
         end;
         Result := True;
      Except
         Result := False
      End;
      OperComum.LimpaParametros(DmFundoComum.qryRecebimentosRetr);
   end;
end;

//Alt_20
function TransfPlanosRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                          dDataProcesso : TDateTime;
                          bMostraMsg    : Boolean;
                          iTipoCota     : Integer = -1) : Boolean;
Var
  //Al_125
  //Al_119
  fSdoMovFundo, fSdoQtdCotas, fSdoAplicado, fVlrCustoAtual, fCotaAplic : Double;
  //AL_162
  sDescFundo, sNomePlanoPrev, sMens : string;
  iOperOrigem, iPatro, iPlanoPrev, iPlanPrevCtbPatro : integer;
  dDataUltPGIR, dDataApl : TDateTime;
begin
   try
   With DmFundoComum Do
   begin
      //Seleciona as operações de Transferencia
      OperComum.LimpaParametros(qryTransfPlanosRetr);
      qryTransfPlanosRetr.ParamByName('DATAOPERACAO').AsString           := DateToStr(dDataProcesso);
      qryTransfPlanosRetr.ParamByName('IDTIPOINVEST').AsInteger          := iTipoInvest;
      //Alt_30
      If iTipoCota > 0 Then
         qryTransfPlanosRetr.ParamByName('IDTIPOCOTA').AsInteger         := iTipoCota;
      qryTransfPlanosRetr.ParamByName('IDFUNDOINVEST').AsInteger         := iFundoInvest;
      //Alt_30
      If iPlano    > 0 Then
         qryTransfPlanosRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger  := iPlano;
      qryTransfPlanosRetr.Open;

      Try
         qryTransfPlanosRetr.First;
         While Not qryTransfPlanosRetr.Eof Do
         Begin
            //Al_125
            //Al_119
            // Origem
            OperComum.LimpaParametros(DmFundoComum.QryAux);
            QryAux.SQL.Clear;
            QryAux.SQL.Add('SELECT PA.IDPLANPREVCTBPATR, PA.IDPATRO, PA.IDPLANOPREV, ');
            //Al_51
            QryAux.SQL.Add(' (PL.NOME ||'' - ''|| PE.NOME) AS PLANPRVCONTABPATRO ');
            QryAux.SQL.Add('FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL');
            QryAux.SQL.Add('WHERE (PA.IDPLANPREVCTBPATR = ' + IntToStr(qryTransfPlanosRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger) +') AND');
            QryAux.SQL.Add('(PA.IDPATRO = PE.IDPESSOA(+)) AND');
            QryAux.SQL.Add('(PA.IDPLANOPREV = PL.IDPLANOPREV)');
            QryAux.Open;

            //Al_119
            //Al_51
            sNomePlanoPrev    := qryAux.FieldByName('PLANPRVCONTABPATRO').AsString;
            iPlanoPrev        := qryAux.FieldByName('IDPLANOPREV').AsInteger;
            iPatro            := qryAux.FieldByName('IDPATRO').AsInteger;
            iPlanPrevCtbPatro := qryAux.FieldByName('IDPLANPREVCTBPATR').AsInteger;

            OperComum.LimpaParametros(DmFundoComum.QryAux);
            QryAux.SQL.Clear;
            QryAux.SQL.Add('SELECT DESCTIPOOPERACAO, NATUREZAOPERACAO ');
            QryAux.SQL.Add('FROM TIPOOPERACAO ');
            QryAux.SQL.Add('WHERE IDTIPOINVEST = '+QuotedStr(qryTransfPlanosRetr.FieldByName('IDTIPOINVEST').AsString)+' ');
            QryAux.SQL.Add('AND IDTIPOOPERACAO = -107');
            QryAux.Open;

            OperComum.LimpaParametros(DmFundoComum.QryBuscaAplOrigem);
            //Al_119
            QryBuscaAplOrigem.ParambyName('IDOPERACAOFUNDO').AsInteger   := qryTransfPlanosRetr.FieldByName('IDOPERACAOORIGEM').AsInteger;
            QryBuscaAplOrigem.ParambyName('DATAMOVFUNDO').AsString       := qryTransfPlanosRetr.FieldByName('DATAOPERACAO').AsString;
            QryBuscaAplOrigem.ParambyName('IDPLANPREVCTBPATR').AsInteger := qryTransfPlanosRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            //Alt_24
            QryBuscaAplOrigem.ParambyName('IDTIPOINVEST').AsInteger      := qryTransfPlanosRetr.FieldByName('IDTIPOINVEST').AsInteger;
            QryBuscaAplOrigem.ParambyName('IDFUNDOINVEST').AsInteger     := qryTransfPlanosRetr.FieldByName('IDFUNDOINVEST').AsInteger;
            QryBuscaAplOrigem.Open;

            if not QryBuscaAplOrigem.IsEmpty then
            begin
               //Al_119
               fSdoMovFundo   := QryBuscaAplOrigem.FieldByName('SALDOVLRFUNDO').AsFloat;
               fSdoQtdCotas   := QryBuscaAplOrigem.FieldByName('SALDOQTDCOTAS').AsFloat;
               fSdoAplicado   := QryBuscaAplOrigem.FieldByName('VLRAPLICADO').AsFloat;
               fVlrCustoAtual := QryBuscaAplOrigem.FieldByName('VLRCUSTOATUAL').AsFloat;
               //Al_125
               if QryBuscaAplOrigem.FieldByName('DATAAPLICACAO').AsDateTime <
                  qryTransfPlanosRetr.FieldByName('DATACOTIZACAO').AsDateTime  then
                  dDataApl       := QryBuscaAplOrigem.FieldByName('DATAAPLICACAO').AsDateTime
               else
                  dDataApl       := qryTransfPlanosRetr.FieldByName('DATACOTIZACAO').AsDateTime;

               dDataUltPGIR   := QryBuscaAplOrigem.FieldByName('DATAULTPGTOIR').AsDateTime;
               fCotaAplic     := QryBuscaAplOrigem.FieldByName('COTAAPLICACAO').AsFloat;
               iOperOrigem    := QryBuscaAplOrigem.FieldByName('IDOPERACAOFUNDO').AsInteger;
            end
            else
            begin
               dDataApl       := qryTransfPlanosRetr.FieldByName('DATACOTIZACAO').AsDateTime;
               dDataUltPGIR   := qryTransfPlanosRetr.FieldByName('DATAOPERACAO').AsDateTime;
               iOperOrigem    := qryTransfPlanosRetr.FieldByName('IDOPERACAOFUNDO').AsInteger;
            end;
            //Al_125

            If Not AlimentaFundo(qryTransfPlanosRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                 -107,
                                 qryTransfPlanosRetr.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                 qryTransfPlanosRetr.FieldByName('IDFUNDOINVEST').AsInteger,
                                 //Al_119
                                 iPlanoPrev,
                                 iPatro,
                                 qryTransfPlanosRetr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                 //Al_125
                                 //Alt_22
                                 iOperOrigem,
                                 qryTransfPlanosRetr.FieldByName('QTDDECQTD').AsInteger,
                                 qryTransfPlanosRetr.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                 //Al_125
                                 -1,
                                 dDataApl,
                                 qryTransfPlanosRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                 qryTransfPlanosRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                 qryTransfPlanosRetr.FieldByName('QTDOPERACAO').AsFloat,
                                 //Al_119
                                 fCotaAplic,
                                 qryTransfPlanosRetr.FieldByName('VLROPERACAO').AsFloat,
                                 //Al_130
                                 qryTransfPlanosRetr.FieldByName('VLRIR').AsFloat,
                                 qryTransfPlanosRetr.FieldByName('VLRIOF').AsFloat,
                                 //Al_119
                                 qryAux.FieldByName('NATUREZAOPERACAO').AsString,
                                 Trim(qryAux.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                    qryTransfPlanosRetr.FieldByName('DESCFUNDOINVEST').AsString,
                                 'OPE', True,
                                 iPlanPrevCtbPatro, -1, -1, 0, sMens,-1, 0, 0,
                                 (fSdoMovFundo - OperComum.DivValorZero((fSdoMovFundo *  qryTransfPlanosRetr.FieldByName('QTDOPERACAO').AsFloat),
                                                                         fSdoQtdCotas)) ) Then
            begin
               OperComum.LimpaParametros(DmFundoComum.qryAux);
               OperComum.LimpaParametros(DmFundoComum.qryTransfPlanosRetr);
               Result := False;
               Exit;
            end;

            //Al_119
            //Al_50

            // Destino
            OperComum.LimpaParametros(DmFundoComum.QryAux);
            QryAux.SQL.Clear;
            //Al_119
            QryAux.SQL.Add('SELECT PA.IDPLANPREVCTBPATR, PA.IDPATRO, PA.IDPLANOPREV,');
            //Al_51
            QryAux.SQL.Add(' (PL.NOME ||'' - ''|| PE.NOME) AS PLANPRVCONTABPATRO ');
            QryAux.SQL.Add('FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL');
            QryAux.SQL.Add('WHERE (PA.IDPLANPREVCTBPATR = ' + IntToStr(qryTransfPlanosRetr.FieldByName('IDPLANDEST').AsInteger) +') AND');
            QryAux.SQL.Add('(PA.IDPATRO = PE.IDPESSOA(+)) AND');
            QryAux.SQL.Add('(PA.IDPLANOPREV = PL.IDPLANOPREV)');
            QryAux.Open;
            //Al_51
            sNomePlanoPrev    := qryAux.FieldByName('PLANPRVCONTABPATRO').AsString;
            iPlanoPrev        := qryAux.FieldByName('IDPLANOPREV').AsInteger;
            iPatro            := qryAux.FieldByName('IDPATRO').AsInteger;
            iPlanPrevCtbPatro := qryAux.FieldByName('IDPLANPREVCTBPATR').AsInteger;

            //Al_119
            OperComum.LimpaParametros(DmFundoComum.QryAux);
            QryAux.SQL.Clear;
            QryAux.SQL.Add('SELECT DESCTIPOOPERACAO, NATUREZAOPERACAO ');
            QryAux.SQL.Add('FROM TIPOOPERACAO ');
            QryAux.SQL.Add('WHERE IDTIPOINVEST = '+QuotedStr(qryTransfPlanosRetr.FieldByName('IDTIPOINVEST').AsString)+' ');
            QryAux.SQL.Add('AND IDTIPOOPERACAO = -108');
            QryAux.Open;

            //AL_162
            If Not AlimentaFundo(qryTransfPlanosRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                 -108,
                                 qryTransfPlanosRetr.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                 qryTransfPlanosRetr.FieldByName('IDFUNDOINVEST').AsInteger,
                                 //Al_119
                                 iPlanoPrev,
                                 iPatro,
                                 qryTransfPlanosRetr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                 //Al_125
                                 //Alt_22
                                 iOperOrigem,
                                 qryTransfPlanosRetr.FieldByName('QTDDECQTD').AsInteger,
                                 qryTransfPlanosRetr.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                 //Al_125
                                 -1,
                                 dDataApl,
                                 qryTransfPlanosRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                 //Al_125
                                 dDataUltPGIR,
                                 qryTransfPlanosRetr.FieldByName('QTDOPERACAO').AsFloat,
                                 //Al_119
                                 fCotaAplic,
                                 qryTransfPlanosRetr.FieldByName('VLROPERACAO').AsFloat,
                                 //Al_130
                                 qryTransfPlanosRetr.FieldByName('VLRIR').AsFloat,
                                 qryTransfPlanosRetr.FieldByName('VLRIOF').AsFloat,
                                 qryAux.FieldByName('NATUREZAOPERACAO').AsString,
                                 Trim(qryAux.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                    qryTransfPlanosRetr.FieldByName('DESCFUNDOINVEST').AsString,
                                 'OPE', True,
                                 iPlanPrevCtbPatro,
                                 -1, -1, 0, sMens, -1,
                                 OperComum.DivValorZero((fSdoAplicado *  qryTransfPlanosRetr.FieldByName('QTDOPERACAO').AsFloat),
                                                         fSdoQtdCotas),
                                 OperComum.DivValorZero((fVlrCustoAtual * qryTransfPlanosRetr.FieldByName('QTDOPERACAO').AsFloat),
                                                         fSdoQtdCotas)
                                 ) Then
            begin
               OperComum.LimpaParametros(DmFundoComum.qryAux);
               OperComum.LimpaParametros(DmFundoComum.qryTransfPlanosRetr);
               Result := False;
               Exit;
            end;

            //Al_119
            //Al_50

            qryTransfPlanosRetr.Next
         end;
         Result := True;
      Except
         Result := False;
      End;
   end;
   finally
      OperComum.LimpaParametros(DmFundoComum.qryAux);
      OperComum.LimpaParametros(DmFundoComum.QryBuscaAplOrigem);
      OperComum.LimpaParametros(DmFundoComum.qryTransfPlanosRetr);
   end;
end;

Function AmortizacaoRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                         dDataProcesso : TDateTime;
                         bMostraMsg    : Boolean;
                         iTipoCota     : Integer = -1) : Boolean;
var
   iIdForCli, iIdPlanilha, iIdDocumento, iIdPlano : Integer;
   fValorOperacao  : Currency;
begin
   With DmFundoComum Do
   begin
      OperComum.LimpaParametros(QryAmortizacaoFundoRetr);
      QryAmortizacaoFundoRetr.ParamByName('DATAOPERACAO').AsString           := DateToStr(dDataProcesso);
      QryAmortizacaoFundoRetr.ParamByName('IDTIPOINVEST').AsInteger          := iTipoInvest;
      //Alt_30
      If iTipoCota > 0 Then
         QryAmortizacaoFundoRetr.ParamByName('IDTIPOCOTA').AsInteger         := iTipoCota;
      QryAmortizacaoFundoRetr.ParamByName('IDFUNDOINVEST').AsInteger         := iFundoInvest;
      //Alt_30
      If iPlano > 0 Then
         QryAmortizacaoFundoRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger  := iPlano;
      QryAmortizacaoFundoRetr.Open;

      Try
         QryAmortizacaoFundoRetr.First;
         If Not QryAmortizacaoFundoRetr.Eof Then
            iIdForCli := OperComum.BuscaForCli(QryAmortizacaoFundoRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                               QryAmortizacaoFundoRetr.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                               QryAmortizacaoFundoRetr.FieldByName('IDTIPOOPERACAO').AsInteger,
                                               pRPI.IDTIPOCLIENTEEMI);

         While Not QryAmortizacaoFundoRetr.Eof Do
         Begin
            //Al_81
            If (Not ExecutaQuery(DmFundoComum.qryAux,'UPDATE OPERACAOFUNDO SET PLANO = NULL, PLNCODIGO = NULL WHERE IDOPERACAOFUNDO = '+
                                 QryAmortizacaoFundoRetr.FieldByName('IDOPERACAOFUNDO').AsString)) then
            begin
               OperComum.LimpaParametros(DmFundoComum.QryDetalheAplAmortizacao);
               OperComum.LimpaParametros(DmFundoComum.QryAmortizacaoFundoRetr);
               OperComum.LimpaParametros(DmFundoComum.QrySaldoTotalAmort);
               Result := False;
               Exit;
            end;

            if (Not ProcExcluiContabil(QryAmortizacaoFundoRetr.FieldByName('PLANO').AsInteger,
                                       QryAmortizacaoFundoRetr.FieldByName('PLNCODIGO').AsInteger)) then
            begin
               OperComum.LimpaParametros(DmFundoComum.QryDetalheAplAmortizacao);
               OperComum.LimpaParametros(DmFundoComum.QryAmortizacaoFundoRetr);
               OperComum.LimpaParametros(DmFundoComum.QrySaldoTotalAmort);
               Result := False;
               Exit;
            end;

            //Al_85
            //Al_82
            iIdDocumento := OperComum.IIF(QryAmortizacaoFundoRetr.FieldByName('CODDOCUMENTO').IsNull,
                                          -1, QryAmortizacaoFundoRetr.FieldByName('CODDOCUMENTO').AsInteger);
            iIdPlanilha  := OperComum.IIF(QryAmortizacaoFundoRetr.FieldByName('PLNCODIGO').IsNull,
                                          -1, QryAmortizacaoFundoRetr.FieldByName('PLNCODIGO').AsInteger);
            iIdPlano     := OperComum.IIF(QryAmortizacaoFundoRetr.FieldByName('PLANO').IsNull,
                                          -1, QryAmortizacaoFundoRetr.FieldByName('PLANO').AsInteger);

            fValorOperacao := QryAmortizacaoFundoRetr.FieldByName('VLROPERACAO').AsFloat;

            OperComum.LimpaParametros(QryDetalheAplAmortizacao);
            //AL_117
            QryDetalheAplAmortizacao.ParamByName('IDTIPOINVEST').AsInteger     :=
                                     QryAmortizacaoFundoRetr.FieldByName('IDTIPOINVEST').AsInteger;
            QryDetalheAplAmortizacao.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                     QryAmortizacaoFundoRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            QryDetalheAplAmortizacao.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                     QryAmortizacaoFundoRetr.FieldByName('IDFUNDOINVEST').AsInteger;
            //Ricardo Cristiano - 24/02/2010 - N. Sol 131393 -  N. Kintana 747826                                     
            QryDetalheAplAmortizacao.ParamByName('DATAMOVFUNDO').AsString     :=
                                     QryAmortizacaoFundoRetr.FieldByName('DATAOPERACAO').AsString;
            QryDetalheAplAmortizacao.Open;

            OperComum.LimpaParametros(QrySaldoTotalAmort);
            //AL_117
            QrySaldoTotalAmort.ParamByName('IDTIPOINVEST').AsInteger      :=
                                   QryAmortizacaoFundoRetr.FieldByName('IDTIPOINVEST').AsInteger;
            QrySaldoTotalAmort.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                               QryAmortizacaoFundoRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            QrySaldoTotalAmort.ParamByName('IDFUNDOINVEST').AsInteger     :=
                               QryAmortizacaoFundoRetr.FieldByName('IDFUNDOINVEST').AsInteger;
            QrySaldoTotalAmort.ParamByName('DATAMOVFUNDO').AsDateTime     :=
                               QryAmortizacaoFundoRetr.FieldByName('DATAOPERACAO').AsDateTime;
            QrySaldoTotalAmort.Open;

            //Al_87
            // Alt_1            
            //Inicia a amortizacao do custo atual
            If Not GravaAmortCustoAtual(QryDetalheAplAmortizacao,
                                        QryAmortizacaoFundoRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                        QryAmortizacaoFundoRetr.FieldByName('DESCTIPOOPERACAO').AsString,
                                        QryAmortizacaoFundoRetr.FieldByName('DESCFUNDOINVEST').AsString,
                                        QryAmortizacaoFundoRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                        QryAmortizacaoFundoRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                        QryAmortizacaoFundoRetr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                        QryAmortizacaoFundoRetr.FieldByName('IDTIPOOPERACAO').AsInteger,
                                        QryAmortizacaoFundoRetr.FieldByName('VLROPERACAO').AsFloat,
                                        QrySaldoTotalAmort.FieldByName('VLRTOTAPL').AsFloat,
                                        fValorOperacao,iTipoCota) Then
            begin
               OperComum.LimpaParametros(DmFundoComum.QryDetalheAplAmortizacao);
               OperComum.LimpaParametros(DmFundoComum.QryAmortizacaoFundoRetr);
               OperComum.LimpaParametros(DmFundoComum.QrySaldoTotalAmort);
               Result := False;
               Exit;
            end;

            // Se o custo atual foi todo resgatado, a difrenca deve ser resgatada do saldo atual e cobrada a aliquota do IR
            fValorOperacao := QryAmortizacaoFundoRetr.FieldByName('VLROPERACAO').AsFloat -
                                 QrySaldoTotalAmort.FieldByName('VLRTOTAPL').AsFloat;

            If fValorOperacao > 0 Then
            Begin
               //Calcula o IR do valor que exceder o valor de custo e contabiliza
               If Not GravaIRAmort(QryAmortizacaoFundoRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                   fValorOperacao,
                                   QryAmortizacaoFundoRetr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                   QryAmortizacaoFundoRetr.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                   QryAmortizacaoFundoRetr.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                   QryAmortizacaoFundoRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                   iIdForCli,
                                   QryAmortizacaoFundoRetr.FieldByName('STAPROVISIONAIR').AsString,
                                   QryAmortizacaoFundoRetr.FieldByName('NATUREZAOPERACAO').AsString,
                                   'IR DA AMORTIZAÇÃO',
                                   QryAmortizacaoFundoRetr.FieldByName('DESCFUNDOINVEST').AsString,
                                   iIdPlano, iIdPlanilha, iIdDocumento) Then
               begin
                  OperComum.LimpaParametros(DmFundoComum.QryDetalheAplAmortizacao);
                  OperComum.LimpaParametros(DmFundoComum.QryAmortizacaoFundoRetr);
                  OperComum.LimpaParametros(DmFundoComum.QrySaldoTotalAmort);
                  Result := False;
                  Exit;
               end;
            End;

            //Al_82
            if iIdPlano <= 0 then
               iIdPlano := -1;
            if iIdPlanilha <= 0 then
               iIdPlanilha := -1;
            if iIdDocumento <= 0 then
               iIdDocumento := -1;

            //AL_99
            //AL_98
            //AL_95
            fValorOperacao := 0;
            if QryAmortizacaoFundoRetr.FieldByName('IDTIPOOPERACAO').AsInteger = -143 then
               fValorOperacao := QryAmortizacaoFundoRetr.FieldByName('VLROPERACAO').AsFloat;

            //AL_189               
            //Al_112
            //AL_95
            //Al_81
            If Not ContabilizacaoFinanceiro(iIdPlano, iIdPlanilha, iIdDocumento,
                                            QryAmortizacaoFundoRetr.FieldByName('IDTIPOOPERACAO').AsInteger,
                                            QryAmortizacaoFundoRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                            QryAmortizacaoFundoRetr.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            QryAmortizacaoFundoRetr.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                            iIdForCli,
                                            QryAmortizacaoFundoRetr.FieldByName('IDFUNDOINVEST').AsInteger,
                                            QryAmortizacaoFundoRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                            QryAmortizacaoFundoRetr.FieldByName('DATALIQUIDACAO').AsDateTime,
                                            'OPE',
                                            QryAmortizacaoFundoRetr.FieldByName('NATUREZAOPERACAO').AsString,
                                            QryAmortizacaoFundoRetr.FieldByName('DESCFUNDOINVEST').AsString+' / '+
                                               QryAmortizacaoFundoRetr.FieldByName('PLANPRVCONTABPATRO').AsString,
                                            True,
                                            fValorOperacao,
                                            0, 0, 0, 0,
                                            QryAmortizacaoFundoRetr.FieldByName('VLROPERACAO').AsFloat,
                                            QryAmortizacaoFundoRetr.FieldByName('VLROPERACAO').AsFloat,
                                            -1, 0, 0, 0,
                                            QryAmortizacaoFundoRetr.FieldByName('FLGCONTAINVEST').AsInteger,
                                            QryAmortizacaoFundoRetr.FieldByName('IDPLANOPREV').AsInteger,
                                            QryAmortizacaoFundoRetr.FieldByName('IDPATRO').AsInteger) Then
            begin
               OperComum.LimpaParametros(DmFundoComum.QryDetalheAplAmortizacao);
               OperComum.LimpaParametros(DmFundoComum.QryAmortizacaoFundoRetr);
               OperComum.LimpaParametros(DmFundoComum.QrySaldoTotalAmort);
               Result := False;
               Exit;
            end;

            With QryUpdOpeFinCtb Do
            Begin
               Opercomum.LimpaParametros(DmFundoComum.QryUpdOpeFinCtb);
               ParamByName('IDOPERACAOFUNDO').AsInteger   := QryAmortizacaoFundoRetr.FieldByName('IDOPERACAOFUNDO').AsInteger;
               ParamByName('PLANO').AsInteger             := iIdPlano;
               ParamByName('PLNCODIGO').AsInteger         := iIdPlanilha;
               ParamByName('CODDOCUMENTO').AsInteger      := iIdDocumento;
               ExecSQL;
            End;

            QryAmortizacaoFundoRetr.Next;
         end;
         Result := True;
      Except
         Result := False;
      End;
      OperComum.LimpaParametros(DmFundoComum.QryDetalheAplAmortizacao);
      OperComum.LimpaParametros(DmFundoComum.QryAmortizacaoFundoRetr);
      OperComum.LimpaParametros(DmFundoComum.QrySaldoTotalAmort);
   end;
end;

//Al_68
Function IntegralizacaoCotasRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                                 iTipoOperacao : Integer;
                                 dDataProcesso : TDateTime;
                                 bMostraMsg    : Boolean;
                                 iTipoCota     : Integer = -1) : Boolean;
Var
   //Ricardo Cristiano - 22/09/2011 SOL 165362 - KINTANA 1431423 - implementação para contabilizar o valor da operação e a variação 
   iSegmentacao, iPlanoLocal, iPlanilhaLocal, iDocumentoLocal,
   //Al_92
   iiTipoOperacao, iIdForCli : Integer;
   sComplemento, sTipoTitulo, sNatureza, sHistorico : String;
   fVlrVar, fVlrAtu      : Double;
   DadosCota             : TDadosCota;
begin
   //Ricardo Cristiano - 22/09/2011 SOL 165362 - KINTANA 1431423 - implementação para contabilizar o valor da operação e a variação
   iSegmentacao   := 0;
   iIdForCli      := 0;
   sHistorico     := ' ';
   With DmFundoComum Do
   begin
      //Al_180
      Try
        Try
          OperComum.LimpaParametros(DmFundoComum.QryIntegralizacaoCotasRetr);
          //Ricardo Cristiano - 11/01/2010 - N. Sol 129463 -  N. Kintana 709981
          QryIntegralizacaoCotasRetr.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataProcesso);
          //Alt_30
          If iPlano > 0 Then
             QryIntegralizacaoCotasRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
          QryIntegralizacaoCotasRetr.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvest;
          QryIntegralizacaoCotasRetr.ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacao;
          //Alt_30
          If iTipoCota > 0 Then
             QryIntegralizacaoCotasRetr.ParamByName('IDTIPOCOTA').AsInteger     := iTipoCota;
          QryIntegralizacaoCotasRetr.ParamByName('IDFUNDOINVEST').AsInteger     := iFundoInvest;
          QryIntegralizacaoCotasRetr.ParamByName('IDTIPOFUNDOINVEST').AsInteger := iTipoFundoInvest;
          QryIntegralizacaoCotasRetr.Open;

          QryIntegralizacaoCotasRetr.First;

           While Not QryIntegralizacaoCotasRetr.Eof Do
           begin
              sHistorico := Trim(QryIntegralizacaoCotasRetr.FieldByName('DESCTIPOOPERACAO').AsString)+
                            ' / '+Trim(QryIntegralizacaoCotasRetr.FieldByName('DESCFUNDOINVEST').AsString);

              //Al_176
              //Apura lucro/prejuizo conforme a cota cadastrada para o dia da operação
              DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                       QryIntegralizacaoCotasRetr.FieldByName('IDFUNDOINVEST').AsInteger,
                                       QryIntegralizacaoCotasRetr.FieldByName('DATAOPERACAO').AsDateTime);

              DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
              DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;

              //Al_176
              if DadosCota.VlrCota <> 0 then
              begin
                 fVlrAtu := OperComum.Round(
                     QryIntegralizacaoCotasRetr.FieldByName('QTDOPERACAO').AsFloat*DadosCota.VlrCota,2);

                 fVlrVar   := fVlrAtu - QryIntegralizacaoCotasRetr.FieldByName('VLROPERACAO').AsFloat;
                 //Al_176                          
              end
              else
              begin
                 //Al_176                          
                 fVlrAtu := QryIntegralizacaoCotasRetr.FieldByName('VLROPERACAO').AsFloat;
                 fVlrVar   := 0;
              end;

              //Al_176
              //Al_127
              //Al_92
              //Al_91
              If Not GravaAplicacaoResgate(QryIntegralizacaoCotasRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                           QryIntegralizacaoCotasRetr.FieldByName('IDTIPOOPERACAO').AsInteger,
                                           QryIntegralizacaoCotasRetr.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           QryIntegralizacaoCotasRetr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                           QryIntegralizacaoCotasRetr.FieldByName('IDFUNDOINVEST').AsInteger,
                                           QryIntegralizacaoCotasRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                           QryIntegralizacaoCotasRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                           QryIntegralizacaoCotasRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                           sHistorico,
                                           QryIntegralizacaoCotasRetr.FieldByName('NATUREZAOPERACAO').AsString,
                                           'OPE',
                                           QryIntegralizacaoCotasRetr.FieldByName('VLROPERACAO').AsFloat,
                                           QryIntegralizacaoCotasRetr.FieldByName('VLROPERACAO').AsFloat,
                                           0, 0, fVlrVar,
                                           QryIntegralizacaoCotasRetr.FieldByName('QTDOPERACAO').AsFloat,
                                           QryIntegralizacaoCotasRetr.FieldByName('QTDOPERACAO').AsFloat,
                                           fVlrAtu,
                                           QryIntegralizacaoCotasRetr.FieldByName('VLRCOTA').AsFloat,
                                           QryIntegralizacaoCotasRetr.FieldByName('VLROPERACAO').AsFloat,
                                           QryIntegralizacaoCotasRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                            -1, 0,
                                           QryIntegralizacaoCotasRetr.FieldByName('IDTIPOCOTA').AsInteger) Then
                 raise Exception.Create('Não foi possível confirmar a operação de Integralização de Cotas do Fundo : '+#13+
                                        QryIntegralizacaoCotasRetr.FieldByName('DESCFUNDOINVEST').AsString +#13+
                                        'No dia : '+QryIntegralizacaoCotasRetr.FieldByName('DATAOPERACAO').AsString);

              //AL_178 
              //Al_176
              if not PesqAplicMesmoDia(QryIntegralizacaoCotasRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                       QryIntegralizacaoCotasRetr.FieldByName('IDTIPOOPERACAO').AsInteger,
                                       QryIntegralizacaoCotasRetr.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       QryIntegralizacaoCotasRetr.FieldByName('IDFUNDOINVEST').AsInteger,
                                       QryIntegralizacaoCotasRetr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                       QryIntegralizacaoCotasRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                       -1, -1,
                                       QryIntegralizacaoCotasRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                       QryIntegralizacaoCotasRetr.FieldByName('VLRCOTA').AsFloat,
                                       QryIntegralizacaoCotasRetr.FieldByName('NATUREZAOPERACAO').AsString,
                                       sHistorico,
                                       iTipoCota) then
                 raise Exception.Create('Não foi possível efetuar a unificação das aplicações na operação de Integralização de Cotas do Fundo : '+#13+
                                        QryIntegralizacaoCotasRetr.FieldByName('DESCFUNDOINVEST').AsString +#13+
                                        'No dia : '+QryIntegralizacaoCotasRetr.FieldByName('DATAOPERACAO').AsString);

              //Início  -- Ricardo Cristiano - 22/09/2011 SOL 165362 - KINTANA 1431423 - implementação para contabilizar o valor da operação e a variação
              iPlanoLocal := QryIntegralizacaoCotasRetr.FieldByName('PLANO').AsInteger;
              iPlanilhaLocal := QryIntegralizacaoCotasRetr.FieldByName('PLNCODIGO').AsInteger;
              iDocumentoLocal := QryIntegralizacaoCotasRetr.FieldByName('CODDOCUMENTO').AsInteger;

              If Not ProcExcluiContabil(iPlanoLocal, iPlanilhaLocal) Then
                 raise Exception.Create('Não foi possível efetuar a exclusão contábil da Integralização de Cotas do Fundo : '+#13+
                                        QryIntegralizacaoCotasRetr.FieldByName('DESCFUNDOINVEST').AsString +#13+
                                        'No dia : '+QryIntegralizacaoCotasRetr.FieldByName('DATAOPERACAO').AsString);

              iSegmentacao := OperComum.RetornaSegmentacaoFdos(iTipoFundoInvest, iFundoInvest);

              iIdForCli := OperComum.BuscaForCli(iTipoInvest,
                                                 QryIntegralizacaoCotasRetr.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                                 iTipoOperacao,
                                                 pRPI.IDTIPOCLIENTEEMI);      
              sTipoTitulo := '';

              if not BuscaTipoTitulo(iTipoFundoInvest, iTipoInvest, '', sTipoTitulo, sComplemento) then
                 Raise Exception.Create('Não foi possível determinar o Tipo de Título para contabilização na integralização do Fundo : '+#13+
                                        QryIntegralizacaoCotasRetr.FieldByName('DESCFUNDOINVEST').AsString +#13+
                                        'No dia : '+QryIntegralizacaoCotasRetr.FieldByName('DATAOPERACAO').AsString);

              //Contabiliza a operação e mantém o financeiro já lançado 
              If Not ContabilizaAtualizacao(iSegmentacao, iTipoOperacao, Sistema.IdEmpresa, Sistema.IdModulo,
                                            iTipoInvest,
                                            QryIntegralizacaoCotasRetr.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            iIdForCli,
                                            QryIntegralizacaoCotasRetr.FieldByName('IDPLANOPREV').AsInteger,
                                            QryIntegralizacaoCotasRetr.FieldByName('IDPATRO').AsInteger,
                                            QryIntegralizacaoCotasRetr.FieldByName('VLROPERACAO').AsFloat,
                                            sTipoTitulo,
                                            Trim(QryIntegralizacaoCotasRetr.FieldByName('DESCTIPOOPERACAO').AsString) + ' - '+
                                               Trim(QryIntegralizacaoCotasRetr.FieldByName('DESCFUNDOINVEST').AsString)+' / '+
                                                  Trim(QryIntegralizacaoCotasRetr.FieldByName('PLANPRVCONTABPATRO').AsString),
                                            QryIntegralizacaoCotasRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                            True, iPlanoLocal, iPlanilhaLocal, iDocumentoLocal) Then
                 Raise Exception.Create('Ocorreu um problema na integralização do Contábil da Operação de Integralização do Fundo : '+#13+
                                        QryIntegralizacaoCotasRetr.FieldByName('DESCFUNDOINVEST').AsString +#13+
                                        'No dia : '+QryIntegralizacaoCotasRetr.FieldByName('DATAOPERACAO').AsString);

              if fVlrVar <> 0 then
              begin
                 if fVlrVar < 0 then
                    iiTipoOperacao := -13   //Atualização Negativa
                 else
                    iiTipoOperacao := -12;  //Atualização Positiva

                 FazQuery(DmFundoComum.QryAux,'SELECT T.DESCTIPOOPERACAO FROM TIPOOPERACAO T WHERE T.IDTIPOINVEST = '+IntToStr(iTipoInvest)+
                                              '   AND T.IDTIPOOPERACAO = '+IntToStr(iiTipoOperacao));

                 sComplemento := DmFundoComum.QryAux.FieldByName('DESCTIPOOPERACAO').AsString;

                 DmFundoComum.QryAux.close;

                 iIdForCli := OperComum.BuscaForCli(iTipoInvest,
                                                    QryIntegralizacaoCotasRetr.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                                    iiTipoOperacao,
                                                    pRPI.IDTIPOCLIENTEEMI);

                 If Not ContabilizaAtualizacao(iSegmentacao, iiTipoOperacao, Sistema.IdEmpresa, Sistema.IdModulo,
                                               iTipoInvest,
                                               QryIntegralizacaoCotasRetr.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                               iIdForCli,
                                               QryIntegralizacaoCotasRetr.FieldByName('IDPLANOPREV').AsInteger,
                                               QryIntegralizacaoCotasRetr.FieldByName('IDPATRO').AsInteger,
                                               ABS(fVlrVar),
                                               sTipoTitulo,
                                               Trim(sComplemento) + ' - '+
                                                  Trim(QryIntegralizacaoCotasRetr.FieldByName('DESCFUNDOINVEST').AsString)+' / '+
                                                     Trim(QryIntegralizacaoCotasRetr.FieldByName('PLANPRVCONTABPATRO').AsString),
                                               QryIntegralizacaoCotasRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                               True, iPlanoLocal, iPlanilhaLocal, iDocumentoLocal) Then
                    Raise Exception.Create('Ocorreu um problema na integralização do Contábil/Financeiro de Variação da Operação.');
              end;
              //Fim  -- Ricardo Cristiano - 22/09/2011 SOL 165362 - KINTANA 1431423 - implementação para contabilizar o valor da operação e a variação                

              QryIntegralizacaoCotasRetr.Next;
           end;

           Result := True;
        Except
           On E:Exception Do Begin
              If bMostraMsg Then
                 MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
              Result := False;
           end;
        End;
      //Al_180  
      finally
         OperComum.LimpaParametros(DmFundoComum.QryIntegralizacaoCotasRetr)
      end;
   end;
end;
//Al_68

Function CancelamentoSubsCotasRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                                   iTipoOperacao : Integer;
                                   dDataProcesso : TDateTime;
                                   bMostraMsg    : Boolean;
                                   iTipoCota     : Integer = -1) : Boolean;
Var
   iIdForCli : Integer;
   sHistorico, sTipoOper, sMens : String;
   DadosCota             : TDadosCota;
begin
   iIdForCli      := 0;
   sHistorico     := ' ';
   With DmFundoComum Do
   begin
      Try
        OperComum.LimpaParametros(QryCancelamentoSubsCotasRetr);
        //Ricardo Cristiano - 11/01/2010 - N. Sol 129463 -  N. Kintana 709981
        QryCancelamentoSubsCotasRetr.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataProcesso);
        //Alt_30
        If iPlano > 0 Then
           QryCancelamentoSubsCotasRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
        QryCancelamentoSubsCotasRetr.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvest;
        QryCancelamentoSubsCotasRetr.ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacao;
        //Alt_30
        If iTipoCota > 0 Then
           QryCancelamentoSubsCotasRetr.ParamByName('IDTIPOCOTA').AsInteger     := iTipoCota;
        QryCancelamentoSubsCotasRetr.ParamByName('IDFUNDOINVEST').AsInteger     := iFundoInvest;
        QryCancelamentoSubsCotasRetr.ParamByName('IDTIPOFUNDOINVEST').AsInteger := iTipoFundoInvest;
        QryCancelamentoSubsCotasRetr.Open;

        QryCancelamentoSubsCotasRetr.First;

         While Not QryCancelamentoSubsCotasRetr.Eof Do
         begin
            //Ricardo Cristiano - 24/02/2010 - N. Sol 131393 -  N. Kintana 747826
            DadosCota       := UFundoComum.BuscaCotaFundo(DmFundoComum.QryAux,
                                                          iFundoInvest,
                                                          dDataProcesso);

            sHistorico := Trim(QryCancelamentoSubsCotasRetr.FieldByName('DESCTIPOOPERACAO').AsString)+
                          ' / '+QryCancelamentoSubsCotasRetr.FieldByName('DESCFUNDOINVEST').AsString;

            sTipoOper := 'OPE';

            //AL_162
            //Al_78            
            //Alt_7
            //Rotina de confirmação das operações
            If Not AlimentaFundo(QryCancelamentoSubsCotasRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                 QryCancelamentoSubsCotasRetr.FieldByName('IDTIPOOPERACAO').AsInteger,
                                 QryCancelamentoSubsCotasRetr.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                 QryCancelamentoSubsCotasRetr.FieldByName('IDFUNDOINVEST').AsInteger,
                                 QryCancelamentoSubsCotasRetr.FieldByName('IDPLANOPREV').AsInteger,
                                 iPatrocinadora,
                                 QryCancelamentoSubsCotasRetr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                 QryCancelamentoSubsCotasRetr.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                 QryCancelamentoSubsCotasRetr.FieldByName('QTDDECQTD').AsInteger,
                                 QryCancelamentoSubsCotasRetr.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                 -1{ForCli},
                                 QryCancelamentoSubsCotasRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                 QryCancelamentoSubsCotasRetr.FieldByName('DATACOTIZACAO').AsDateTime,
                                 QryCancelamentoSubsCotasRetr.FieldByName('DATALIQUIDACAO').AsDateTime,
                                 QryCancelamentoSubsCotasRetr.FieldByName('QTDOPERACAO').AsFloat,
                                 QryCancelamentoSubsCotasRetr.FieldByName('VLRCOTA').AsFloat,
                                 //Ricardo Cristiano - 24/02/2010 - N. Sol 131393 -  N. Kintana 747826
                                 OperComum.Round(QryCancelamentoSubsCotasRetr.FieldByName('QTDOPERACAO').AsFloat * DadosCota.VlrCota,2),
                                 0{IRRF}, 0{IOF},
                                 QryCancelamentoSubsCotasRetr.FieldByName('NATUREZAOPERACAO').AsString,
                                 sHistorico,
                                 sTipoOper, True,
                                 QryCancelamentoSubsCotasRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                 -1, -1,
                                 //Ricardo Cristiano - 24/02/2010 - N. Sol 131393 -  N. Kintana 747826                                 
                                 //QryCancelamentoSubsCotasRetr.FieldByName('VLROPERACAO').AsFloat, sMens, iTipoCota) Then
                                 0, sMens, iTipoCota) Then                                 
            Begin
               //AL_162
               If bMostraMsg Then
               begin
                  if sMens <> '' then
                     MsgDlg('Não foi possível confirmar a operação de Cancelamento de Subscrição de Cotas' + #13 +
                            'Fundo: ' + QryCancelamentoSubsCotasRetr.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                            'Data : '+ QryCancelamentoSubsCotasRetr.FieldByName('DATAOPERACAO').AsString + #13 +
                            'Mensagem: ' + sMens,
                            'Mensagem do Sistema', mtInformation, [mbOk], 0)
                  else
                     MsgDlg('Não foi possível confirmar a operação de Cancelamento de Subscrição de Cotas' + #13 +
                            'Fundo: ' + QryIntegralizacaoCotasRetr.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                            'Data : ' + QryIntegralizacaoCotasRetr.FieldByName('DATAOPERACAO').AsString + #13 +
                            'Ocorreu um problema ao gravar esta operação' + #13 +
                            'Tente mais tarde',
                            'Mensagem do Sistema', mtInformation, [mbOk], 0)
               end;
               OperComum.LimpaParametros(DmFundoComum.QryCancelamentoSubsCotasRetr);
               Result := False;
               Exit;
            End;

            //Ricardo Cristiano - 24/02/2010 - N. Sol 131393 -  N. Kintana 747826            
            ExecutaQuery(DmFundoComum.QryAux,'UPDATE OPERACAOFUNDO SET VLROPERACAO = '+
                                              TrocaVirgulaPonto(
                                                 FloatToStr(OperComum.Round(QryCancelamentoSubsCotasRetr.FieldByName('QTDOPERACAO').AsFloat *
                                                                            DadosCota.VlrCota,2)))+' '+
                                             'WHERE IDOPERACAOFUNDO = '+QryCancelamentoSubsCotasRetr.FieldByName('IDOPERACAOFUNDO').AsString);

            QryCancelamentoSubsCotasRetr.Next;
         end;

         Result := True;
      Except
         Result := False;
      End;
      OperComum.LimpaParametros(DmFundoComum.QryUpdHistFundo);
      OperComum.LimpaParametros(DmFundoComum.QryCancelamentoSubsCotasRetr);
   end;
end;

Function ResgateRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                     dDataProcesso : TDateTime;
                     bMostraMsg    : Boolean;
                     iTipoCota     : Integer = -1) : Boolean;
Var
   sDescFundo, sHistorico, sTipoOper, sMens : String;
   fVlrCustoAcoes, fVlrVarAcoes : Currency;
   fSaldoFundo, fNull : Double;
   bProcesso          : Boolean;
   iIdForCli          : Integer;
   dDataApl           : TDateTime;
begin
   iIdForCli  := 0;
   sHistorico := ' ';
   bProcesso  := True;

   With DmFundoComum Do
   begin
      //Al_159   
      OperComum.LimpaParametros(DmFundoComum.QryPedidoFundosRetr);
      QryPedidoFundosRetr.ParamByName('DATAPEDIDO').AsString             := DateToStr(dDataProcesso);
      QryPedidoFundosRetr.ParamByName('IDTIPOINVEST').AsInteger          := iTipoInvest;
      QryPedidoFundosRetr.ParamByName('IDTIPOFUNDOINVEST').AsInteger     := iTipoFundoInvest;
      QryPedidoFundosRetr.ParamByName('IDFUNDOINVEST').AsInteger         := iFundoInvest;
      //Alt_30
      If iTipoCota > 0 Then
         QryPedidoFundosRetr.ParamByName('IDTIPOCOTA').AsInteger         := iTipoCota;
      //Alt_30
      If iPlano    > 0 Then
         QryPedidoFundosRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger  := iPlano;
      QryPedidoFundosRetr.Open;

      Try
         //Operações de Resgate
         QryPedidoFundosRetr.First;
         If Not QryPedidoFundosRetr.Eof Then
            iIdForCli := OperComum.BuscaForCli(
                                   QryPedidoFundosRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                   QryPedidoFundosRetr.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                   QryPedidoFundosRetr.FieldByName('IDTIPOOPERACAO').AsInteger,
                                   pRPI.IDTIPOCLIENTEEMI);

         While Not QryPedidoFundosRetr.Eof Do
         Begin
            fSaldoFundo := 0;
            //AL_194
            //Alt_12
            BuscaSaldoFundo(QryPedidoFundosRetr.FieldByName('IDFUNDOINVEST').AsInteger,
                            QryPedidoFundosRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                            //Al_108
                            QryPedidoFundosRetr.FieldByName('IDCOMPOSICAOFUNDO').AsInteger,
                            //AL_132
                            QryPedidoFundosRetr.FieldByName('DATAPEDIDO').AsDateTime,
                            fNull ,fNull , fNull, fNull,
                            fNull, fNull, fSaldoFundo, fNull, fNull, fNull, sDescFundo,
                            iTipoCota,
                            QryPedidoFundosRetr.FieldByName('IDTIPORESGATE').AsInteger);

            //Alt_35
            If (fSaldoFundo+pRPI.DIFRESGFUNDOS) >= QryPedidoFundosRetr.FieldByName('VLRPEDIDO').AsFloat Then
            Begin
               //AL_132
               If (QryPedidoFundosRetr.FieldByName('DATAPEDIDO').AsDateTime >=
                   QryPedidoFundosRetr.FieldByName('DATACOTIZACAO').AsDateTime) Then
               Begin

                  dDataApl   := QryPedidoFundosRetr.FieldByName('DATAAPLICACAO').AsDateTime;

                  //Al_108                   
                  //Alt_12
                  If Not ResgateFACFIF(QryPedidoFundosRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                       QryPedidoFundosRetr.FieldByName('IDPEDIDOFUNDO').AsInteger,
                                       QryPedidoFundosRetr.FieldByName('IDTIPOOPERACAO').AsInteger,
                                       QryPedidoFundosRetr.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       QryPedidoFundosRetr.FieldByName('IDFUNDOINVEST').AsInteger,
                                       QryPedidoFundosRetr.FieldByName('IDCOMPOSICAOFUNDO').AsInteger,
                                       QryPedidoFundosRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                       QryPedidoFundosRetr.FieldByName('DATACOTIZACAO').AsDateTime,
                                       QryPedidoFundosRetr.FieldByName('DATAPEDIDO').AsDateTime,
                                       QryPedidoFundosRetr.FieldByName('DATALIQUIDACAO').AsDateTime,
                                       dDataApl,
                                       QryPedidoFundosRetr.FieldByName('VLRPEDIDO').AsFloat,
                                       0, fVlrCustoAcoes, fVlrVarAcoes, iTipoCota,
                                       QryPedidoFundosRetr.FieldByName('IDTIPORESGATE').AsInteger) Then
                  Begin
                     If bMostraMsg Then
                        MsgDlg('Ocorreu um problema no resgate do Fundo : '+#13+
                                QryPedidoFundosRetr.FieldByName('DESCFUNDOINVEST').AsString+#13+
                               'Dia : '+QryPedidoFundosRetr.FieldByName('DATAPEDIDO').AsString,
                               'Mensagem do Sistema', mtInformation,[MbOk],0);
                     OperComum.LimpaParametros(DmFundoComum.QryPedidoFundosRetr);
                     Result := False;
                     Exit;
                  End;

                  OperComum.LimpaParametros(QryConfirmacao);
                  //Alt_30
                  If iTipoCota > 0 Then
                     QryConfirmacao.ParamByName('IDTIPOCOTA').AsInteger     := iTipoCota;
                  QryConfirmacao.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                             QryPedidoFundosRetr.FieldByName('IDFUNDOINVEST').AsInteger;
                  QryConfirmacao.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                                             QryPedidoFundosRetr.FieldByName('IDTIPOOPERACAO').AsInteger;
                  QryConfirmacao.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataProcesso);
                  QryConfirmacao.ParamByName('DATACOTIZACAO').AsString      :=
                                             QryPedidoFundosRetr.FieldByName('DATACOTIZACAO').AsString;
                  QryConfirmacao.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                             QryPedidoFundosRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                  //Al_61
                  QryConfirmacao.ParamByName('IDPEDIDOFUNDO').AsInteger     :=
                                             QryPedidoFundosRetr.FieldByName('IDPEDIDOFUNDO').AsInteger;
                  QryConfirmacao.Open;

                  While Not QryConfirmacao.Eof Do
                  Begin
                     sHistorico := QryConfirmacao.FieldByName('DESCTIPOOPERACAO').AsString+
                                   ' / '+QryConfirmacao.FieldByName('DESCFUNDOINVEST').AsString;

                     If (QryConfirmacao.FieldByName('DATAOPERACAO').AsDateTime <>
                         QryConfirmacao.FieldByName('DATACOTIZACAO').AsDateTime) And
                        (QryConfirmacao.FieldByName('QTDOPERACAO').AsFloat = 0) Then
                         sTipoOper := 'CTZ'
                     Else
                         sTipoOper := 'OPE';

                     //ALT_29
                     //ALT_25
                     If (QryPedidoFundosRetr.FieldByName('IDTIPORESGATE').AsInteger = 2) Then
                        dDataApl   := QryPedidoFundosRetr.FieldByName('DATAAPLICACAO').AsDateTime
                     Else
                        dDataApl   := QryConfirmacao.FieldByName('DATAOPERACAO').AsDateTime;

                     //AL_162
                     //Al_108                              
                     //Alt_7
                     //Rotina de confirmação das operações
                     If Not AlimentaFundo(QryConfirmacao.FieldByName('IDTIPOINVEST').AsInteger,
                                          QryConfirmacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                          QryConfirmacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          QryConfirmacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                          QryConfirmacao.FieldByName('IDPLANOPREV').AsInteger,
                                          iPatrocinadora,
                                          QryConfirmacao.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                          QryConfirmacao.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                          QryConfirmacao.FieldByName('QTDDECQTD').AsInteger,
                                          QryConfirmacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                          iIdForCli,
                                          dDataApl,
                                          QryConfirmacao.FieldByName('DATACOTIZACAO').AsDateTime,
                                          QryConfirmacao.FieldByName('DATALIQUIDACAO').AsDateTime,
                                          QryConfirmacao.FieldByName('QTDOPERACAO').AsFloat,
                                          QryConfirmacao.FieldByName('VLRCOTA').AsFloat,
                                          QryConfirmacao.FieldByName('VLRLIQUIDO').AsFloat,
                                          QryConfirmacao.FieldByName('VLRIR').AsFloat,
                                          QryConfirmacao.FieldByName('VLRIOF').AsFloat,
                                          QryConfirmacao.FieldByName('NATUREZAOPERACAO').AsString,
                                          sHistorico, sTipoOper , True,
                                          QryConfirmacao.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                          -1,
                                          QryConfirmacao.FieldByName('IDCOMPOSICAOFUNDO').AsInteger,
                                          QryConfirmacao.FieldByName('VLRRENDIMENTO').AsFloat, sMens,
                                          iTipoCota) Then
                     Begin
                        //AL_162
                        If bMostraMsg Then
                        begin
                           if sMens <> '' then
                              MsgDlg('Não foi possível confirmar a operação de Resgate' + #13 +
                                     'Fundo: ' + QryConfirmacao.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                                     'Data : '+ QryConfirmacao.FieldByName('DATAOPERACAO').AsString + #13 +
                                     'Mensagem: ' + sMens,
                                     'Mensagem do Sistema', mtInformation, [mbOk], 0)
                           else
                              MsgDlg('Não foi possível confirmar a operação de Resgate' + #13 +
                                     'Fundo: ' + QryConfirmacao.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                                     'Data : ' + QryConfirmacao.FieldByName('DATAOPERACAO').AsString + #13 +
                                     'Ocorreu um problema ao gravar esta operação' + #13 +
                                     'Tente mais tarde',
                                     'Mensagem do Sistema', mtInformation, [mbOk], 0)
                        end;
                        OperComum.LimpaParametros(DmFundoComum.QryPedidoFundosRetr);
                        OperComum.LimpaParametros(DmFundoComum.QryConfirmacao);
                        Result := False;
                        Exit;
                     End;
                     QryConfirmacao.Next;
                  End;
               End;
            End
            else  //--Emerson KT 492521 SOL 108531 Inicio--//
            Begin
               if (MsgDlg('Atenção! Reprocessamento paralizado.' + #13 +
                          'Motivo : Saldo Insuficiente!' + #13 +
                          'Plano: ' + QryPedidoFundosRetr.FieldByName('PLANPRVCONTABPATRO').AsString + #13 +
                          'Deseja continuar o Reprocessamento?',
                          'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo ) then

                      begin
                          OperComum.LimpaParametros(DmFundoComum.QryConfirmacao);
                          OperComum.LimpaParametros(DmFundoComum.QryPedidoFundosRetr);
                          Result := False;
                          Exit; //--condição para abandonar o While (Not QryPedidoFundosRetr.Eof) --//
                      end;

            end;

            //--Emerson KT 492521 SOL 108531 Fim----//
            QryPedidoFundosRetr.Next;

         End;
         Result := True;
      Except
         Result := False;
      End;
      OperComum.LimpaParametros(DmFundoComum.QryConfirmacao);
      OperComum.LimpaParametros(DmFundoComum.QryPedidoFundosRetr);
   End;
end;

Function AplicacaoRetr(iTipoInvest, iTipoFundoInvest, iTipoOperacao, iFundoInvest, iPlano : Integer;
                       dDataProcesso : TDateTime;
                       bMostraMsg    : Boolean;
                       iTipoCota     : Integer = -1) : Boolean;
Var
   iIdForCli : Integer;
   sHistorico, sTipoOper, sMens : String;
   DadosCota             : TDadosCota;
begin
   iIdForCli      := 0;
   sHistorico     := ' ';
   With DmFundoComum Do
   begin
      OperComum.LimpaParametros(DmFundoComum.QryAplicacaoRetr);
      //Ricardo Cristiano - 11/01/2010 - N. Sol 129463 -  N. Kintana 709981
      QryAplicacaoRetr.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataProcesso);
      //Alt_30
      If iPlano > 0 Then
         QryAplicacaoRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
      QryAplicacaoRetr.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvest;
      QryAplicacaoRetr.ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacao;
      //Alt_30
      If iTipoCota > 0 Then
         QryAplicacaoRetr.ParamByName('IDTIPOCOTA').AsInteger     := iTipoCota;
      QryAplicacaoRetr.ParamByName('IDFUNDOINVEST').AsInteger     := iFundoInvest;
      QryAplicacaoRetr.ParamByName('IDTIPOFUNDOINVEST').AsInteger := iTipoFundoInvest;
      QryAplicacaoRetr.Open;
      Try
        QryAplicacaoRetr.First;
        If Not QryAplicacaoRetr.Eof Then
           iIdForCli := OperComum.BuscaForCli(QryAplicacaoRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                              QryAplicacaoRetr.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                              QryAplicacaoRetr.FieldByName('IDTIPOOPERACAO').AsInteger,
                                              pRPI.IDTIPOCLIENTEEMI);

         While Not QryAplicacaoRetr.Eof Do
         begin
            sHistorico := QryAplicacaoRetr.FieldByName('DESCTIPOOPERACAO').AsString+
                          ' / '+QryAplicacaoRetr.FieldByName('DESCFUNDOINVEST').AsString;

            If Not ((QryAplicacaoRetr.FieldByName('DATAOPERACAO').AsDateTime <>
                     QryAplicacaoRetr.FieldByName('DATACOTIZACAO').AsDateTime) And
                    (QryAplicacaoRetr.FieldByName('QTDOPERACAO').AsFloat  = 0)) Then
               sTipoOper := 'OPE';

            //Al_47
            If QryAplicacaoRetr.FieldByName('DATACOTIZACAO').AsDateTime <> 0 Then
               DadosCota := BuscaCotaFundo(QryAux,
                                           QryAplicacaoRetr.FieldByName('IDFUNDOINVEST').AsInteger,
                                           QryAplicacaoRetr.FieldByName('DATACOTIZACAO').AsDateTime,
                                           iTipoCota)
            Else
               DadosCota := BuscaCotaFundo(QryAux,
                                           QryAplicacaoRetr.FieldByName('IDFUNDOINVEST').AsInteger,
                                           QryAplicacaoRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                           iTipoCota);

            If DadosCota.VlrCota = 0 Then
            Begin
               MsgDlg('Cota não encontrada para o Fundo : '+#13+
                      QryAplicacaoRetr.FieldByName('DESCFUNDOINVEST').AsString +#13+
                      'No dia : '+QryAplicacaoRetr.FieldByName('DATAOPERACAO').AsString,
                      'Mensagem do Sistema', mtInformation,[MbOk],0);
               OperComum.LimpaParametros(DmFundoComum.QryAplicacaoRetr);
               Result := False;
               Exit;
            End;

            QryAplicacaoRetr.Edit;
            //Al_43
            //Alt_5

            //---Renan Cristiano KT 597419 SOL 121996 início.
               //Existia uma condição, onde ele verificava se na hora do reprocessamento foi alterado o valor da cota atual,
               //No caso de nao alteração, a quantidade nao era recalculada.
               //Hj ele sempre refaz a quantidade.

                QryAplicacaoRetr.FieldByName('QTDOPERACAO').AsFloat :=
                     OperComum.Round((QryAplicacaoRetr.FieldByName('VLROPERACAO').AsFloat/DadosCota.VlrCota),
                                                       QryAplicacaoRetr.FieldByName('QTDDECQTD').AsInteger);
            //---Renan Cristiano KT 597419 SOL 121996 início.

            QryAplicacaoRetr.FieldByName('VLRCOTA').AsFloat        := DadosCota.VlrCota;

            // Confirma Operacao
            QryAplicacaoRetr.Post;
            QryAplicacaoRetr.CommitUpdates;

            //Alt_7
            //AL_162
            //Rotina de confirmação das operações
            If Not AlimentaFundo(QryAplicacaoRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                 QryAplicacaoRetr.FieldByName('IDTIPOOPERACAO').AsInteger,
                                 QryAplicacaoRetr.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                 QryAplicacaoRetr.FieldByName('IDFUNDOINVEST').AsInteger,
                                 QryAplicacaoRetr.FieldByName('IDPLANOPREV').AsInteger,
                                 iPatrocinadora,
                                 QryAplicacaoRetr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                 QryAplicacaoRetr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                 QryAplicacaoRetr.FieldByName('QTDDECQTD').AsInteger,
                                 QryAplicacaoRetr.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                 iIdForCli,
                                 QryAplicacaoRetr.FieldByName('DATAOPERACAO').AsDateTime,
                                 QryAplicacaoRetr.FieldByName('DATACOTIZACAO').AsDateTime,
                                 QryAplicacaoRetr.FieldByName('DATALIQUIDACAO').AsDateTime,
                                 QryAplicacaoRetr.FieldByName('QTDOPERACAO').AsFloat,
                                 QryAplicacaoRetr.FieldByName('VLRCOTA').AsFloat,
                                 QryAplicacaoRetr.FieldByName('VLROPERACAO').AsFloat, 0{IRRF},  0{IOF},
                                 QryAplicacaoRetr.FieldByName('NATUREZAOPERACAO').AsString,
                                 sHistorico,
                                 sTipoOper, True,
                                 QryAplicacaoRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                  -1,
                                 QryAplicacaoRetr.FieldByName('IDCOMPOSICAOFUNDO').AsInteger,
                                 0 {Rendimento}, sMens, iTipoCota) Then
            Begin
               //AL_162
               If bMostraMsg Then
               begin
                  if sMens <> '' then
                     MsgDlg('Não foi possível confirmar a operação de Aplicação' + #13 +
                            'Fundo: ' + QryAplicacaoRetr.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                            'Data : '+ QryAplicacaoRetr.FieldByName('DATAOPERACAO').AsString + #13 +
                            'Mensagem: ' + sMens,
                            'Mensagem do Sistema', mtInformation, [mbOk], 0)
                  else
                     MsgDlg('Não foi possível confirmar a operação de Aplicação' + #13 +
                            'Fundo: ' + QryAplicacaoRetr.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                            'Data : ' + QryAplicacaoRetr.FieldByName('DATAOPERACAO').AsString + #13 +
                            'Ocorreu um problema ao gravar esta operação' + #13 +
                            'Tente mais tarde',
                            'Mensagem do Sistema', mtInformation, [mbOk], 0)
               end;
               OperComum.LimpaParametros(DmFundoComum.QryAplicacaoRetr);
               Result := False;
               Exit;
            End;

            QryAplicacaoRetr.Next;
         end;
         Result := True;
      Except
         Result := False;
      End;
      OperComum.LimpaParametros(DmFundoComum.QryAplicacaoRetr);
   end;
end;

Function AjusteRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                    dDataProcesso : TDateTime;
                    bMostraMsg    : Boolean;
                    iTipoCota     : Integer = -1) : Boolean;
begin
   With DmFundoComum Do
   begin
      Try
         OperComum.LimpaParametros(DmFundoComum.QryOperAjusteCert);
         QryOperAjusteCert.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvest;
         QryOperAjusteCert.ParamByName('IDTIPOFUNDOINVEST').AsInteger    := iTipoFundoInvest;         
         QryOperAjusteCert.ParamByName('IDFUNDOINVEST').AsInteger        := iFundoInvest;
         //Alt_30
         If iTipoCota > 0 Then
            QryOperAjusteCert.ParamByName('IDTIPOCOTA').AsInteger        := iTipoCota;
         //Alt_30
         If iPlano > 0 Then
            QryOperAjusteCert.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
         //Ricardo Cristiano - 11/01/2010 - N. Sol 129463 -  N. Kintana 709981   
         QryOperAjusteCert.ParamByName('DATAOPERACAO').AsString          := DateToStr(dDataProcesso);
         QryOperAjusteCert.Open;
         QryOperAjusteCert.First;
         While Not QryOperAjusteCert.Eof Do
         begin
            OperComum.LimpaParametros(QryHistAtuAjusteCert);
            //Al_113
            //Alt_30
            If iTipoCota > 0 Then
               QryHistAtuAjusteCert.ParamByName('IDTIPOCOTA').AsInteger        := iTipoCota;
            QryHistAtuAjusteCert.ParamByName('IDFUNDOINVEST').AsInteger        := iFundoInvest;
            QryHistAtuAjusteCert.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvest;
            QryHistAtuAjusteCert.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                 QryOperAjusteCert.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            QryHistAtuAjusteCert.ParamByName('DATAMOVFUNDO').AsDateTime        := dDataProcesso;
            //Al_113
            if not QryOperAjusteCert.FieldByName('DATACOTIZACAO').IsNull then
               QryHistAtuAjusteCert.ParamByName('DATAAPLICACAO').AsDateTime       :=
                                    QryOperAjusteCert.FieldByName('DATACOTIZACAO').AsDateTime;
            QryHistAtuAjusteCert.Open;

            //Al_113
            if not QryHistAtuAjusteCert.IsEmpty then
            begin
               //Al_121
               //Alt_30
               If iTipoCota > 0 Then
                  qryInsertHistFundo.ParamByName('IDTIPOCOTA').AsFloat       := iTipoCota;
               OperComum.LimpaParametros(DmFundoComum.QryVlrCotaAux);
               QryVlrCotaAux.SQL.Clear;
               QryVlrCotaAux.SQL.Add(' SELECT VLRCOTA   ');
               QryVlrCotaAux.SQL.Add(' FROM   COTAFUNDO ');
               QryVlrCotaAux.SQL.Add(' WHERE            ');
               QryVlrCotaAux.SQL.Add('        IDFUNDOINVEST = '+QryOperAjusteCert.FieldByName('IDFUNDOINVEST').AsString+' AND ');
               //Alt_30
               If iTipoCota > 0 Then
                  QryVlrCotaAux.SQL.Add('     IDTIPOCOTA    = '+IntToStr(iTipoCota)+' AND ');
               QryVlrCotaAux.SQL.Add('        DATACOTA      =                   ');
               QryVlrCotaAux.SQL.Add('           (SELECT MAX(DATACOTA)          ');
               QryVlrCotaAux.SQL.Add('            FROM   COTAFUNDO              ');
               QryVlrCotaAux.SQL.Add('            WHERE                         ');
               QryVlrCotaAux.SQL.Add('                   IDFUNDOINVEST  = '+QryOperAjusteCert.FieldByName('IDFUNDOINVEST').AsString+' AND ');
               //Alt_30
               If iTipoCota > 0 Then
                  QryVlrCotaAux.SQL.Add('                IDTIPOCOTA    = '+IntToStr(iTipoCota)+' AND ');
               If iTipoFundoInvest <> 1 Then //Se não for fundo Imobiliario busca a cota do dia
                  QryVlrCotaAux.SQL.Add('   DATACOTA        = TO_DATE('+QuotedStr(DateToStr(dDataProcesso))+',''DD/MM/YYYY''))')
               Else
                  QryVlrCotaAux.SQL.Add('   DATACOTA       <= TO_DATE('+QuotedStr(DateToStr(dDataProcesso))+',''DD/MM/YYYY''))');
               QryVlrCotaAux.Open;

               OperComum.LimpaParametros(DmFundoComum.QryAux);
               ExecutaQuery(qryAux,'UPDATE OPERACAOFUNDO SET IDOPERACAOORIGEM = '+
                                   QryHistAtuAjusteCert.FieldByName('IDOPERACAOFUNDO').AsString+
                                   ' WHERE IDOPERACAOFUNDO = '+
                                   QryOperAjusteCert.FieldByName('IDOPERACAOFUNDO').AsString);
               OperComum.LimpaParametros(DmFundoComum.QryAux);

               OperComum.LimpaParametros(qryInsertHistFundo);
               qryInsertHistFundo.ParamByName('IDHISTFUNDO').AsInteger       := LeUltRegistro(nil, 'HISTFUNDO');
               qryInsertHistFundo.ParamByName('IDOPERACAOFUNDO').AsInteger   :=
                                     QryHistAtuAjusteCert.FieldByName('IDOPERACAOFUNDO').AsInteger;
               qryInsertHistFundo.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvest;
               qryInsertHistFundo.ParamByName('IDTIPOOPERACAO').AsInteger    := QryOperAjusteCert.FieldByName('IDTIPOOPERACAO').AsInteger;
               qryInsertHistFundo.ParamByName('IDCARTEIRAINVEST').AsInteger  := QryOperAjusteCert.FieldByName('IDCARTEIRAINVEST').AsInteger;
               qryInsertHistFundo.ParamByName('IDFUNDOINVEST').AsInteger     := QryOperAjusteCert.FieldByName('IDFUNDOINVEST').AsInteger;
               qryInsertHistFundo.ParamByName('DATAAPLICACAO').AsDateTime    := QryHistAtuAjusteCert.FieldByName('DATAAPLICACAO').AsDateTime;
               qryInsertHistFundo.ParamByName('DATAMOVFUNDO').AsDateTime     := dDataProcesso;
               qryInsertHistFundo.ParamByName('DATAULTPGTOIR').AsDateTime    := QryHistAtuAjusteCert.FieldByName('DATAULTPGTOIR').AsDateTime;
               //Al_94
               qryInsertHistFundo.ParamByName('HISTMOVFUNDO').AsString       := COPY(TRIM(QryOperAjusteCert.FieldByName('DESCTIPOOPERACAO').AsString)+ ' / ' + TRIM(QryOperAjusteCert.FieldByName('DESCFUNDOINVEST').AsString),1,60);
               qryInsertHistFundo.ParamByName('NATURMOVFUNDO').AsString      := QryOperAjusteCert.FieldByName('NATUREZAOPERACAO').AsString;
               qryInsertHistFundo.ParamByName('TIPMOVFUNDO').AsString        := 'AJU';
               qryInsertHistFundo.ParamByName('VLRAPLICADO').AsFloat         := QryHistAtuAjusteCert.FieldByName('VLRAPLICADO').AsFloat;
               qryInsertHistFundo.ParamByName('VLRIRPROV').AsFloat           := QryHistAtuAjusteCert.FieldByName('VLRIRPROV').AsFloat;
               qryInsertHistFundo.ParamByName('VLRIOFPROV').AsFloat          := QryHistAtuAjusteCert.FieldByName('VLRIOFPROV').AsFloat;
               //Al_114
               qryInsertHistFundo.ParamByName('COTASMOVFUNDO').AsFloat       := QryOperAjusteCert.FieldByName('QTDOPERACAO').AsFloat;
               qryInsertHistFundo.ParamByName('FLGCALCSALDO').AsString       := '1';
               qryInsertHistFundo.ParamByName('COTAAPLICACAO').AsFloat       := QryHistAtuAjusteCert.FieldByName('COTAAPLICACAO').AsFloat;
               qryInsertHistFundo.ParamByName('SALDOQTDCOTAS').AsFloat       :=
                                  (QryHistAtuAjusteCert.FieldByName('SALDOQTDCOTAS').AsFloat+
                                   QryOperAjusteCert.FieldByName('QTDOPERACAO').AsFloat);
               qryInsertHistFundo.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                  QryHistAtuAjusteCert.FieldByName('IDPLANPREVCTBPATR').AsInteger;
               qryInsertHistFundo.ParamByName('SALDOVLRFUNDO').AsFloat       :=
                                  OperComum.Round((QryHistAtuAjusteCert.FieldByName('SALDOQTDCOTAS').AsFloat+
                                                   QryOperAjusteCert.FieldByName('QTDOPERACAO').AsFloat)*
                                                   QryVlrCotaAux.FieldByName('VLRCOTA').AsFloat,2);
               //Al_114
               qryInsertHistFundo.ParamByName('VLRVARIACAO').AsFloat :=OperComum.Round(QryOperAjusteCert.FieldByName('QTDOPERACAO').AsFloat*
                                                   QryVlrCotaAux.FieldByName('VLRCOTA').AsFloat,2);

               qryInsertHistFundo.ParamByName('VLRMOVFUNDO').AsFloat := OperComum.Round(QryOperAjusteCert.FieldByName('QTDOPERACAO').AsFloat*
                                                   QryVlrCotaAux.FieldByName('VLRCOTA').AsFloat,2);

               //AL_120
               qryInsertHistFundo.ParamByName('VLRCUSTOATUAL').AsFloat :=
                                  QryHistAtuAjusteCert.FieldByName('VLRCUSTOATUAL').AsFloat;

               qryInsertHistFundo.ExecSql;
               OperComum.LimpaParametros(DmFundoComum.qryInsertHistFundo);
               OperComum.LimpaParametros(DmFundoComum.QryVlrCotaAux);
            end
            else If bMostraMsg Then
            begin
               MsgDlg('Ocorreu um probelma no reprocessamento do Ajuste de Certificado do Fundo : '+#13+
                      QryOperAjusteCert.FieldByName('DESCFUNDOINVEST').AsString +#13+
                      'No dia : '+QryOperAjusteCert.FieldByName('DATAOPERACAO').AsString,
                      'Mensagem do Sistema', mtInformation,[MbOk],0);
               OperComum.LimpaParametros(DmFundoComum.QryOperAjusteCert);
               OperComum.LimpaParametros(DmFundoComum.QryHistAtuAjusteCert);
               Result := False;
               exit;
            end;
            OperComum.LimpaParametros(DmFundoComum.QryHistAtuAjusteCert);

            QryOperAjusteCert.Next;
         end;

         OperComum.LimpaParametros(DmFundoComum.QryOperAjusteCert);

         Result := True;

      Except
         If bMostraMsg Then
            MsgDlg('Problemas no reprocesso do Ajuste de Certificado do Fundo : '+#13+
                   QryOperAjusteCert.FieldByName('DESCFUNDOINVEST').AsString +#13+
                   'No dia : '+QryOperAjusteCert.FieldByName('DATAOPERACAO').AsString,
                   'Mensagem do Sistema', MtInformation,[MbOk],0);
         OperComum.LimpaParametros(DmFundoComum.QryOperAjusteCert);
         OperComum.LimpaParametros(DmFundoComum.QryHistAtuAjusteCert);
         Result := False;
      End;
   end;
end;

Function AtualizaSaldoFundos(iTipoInvest, iTipoFundo, iFundo, iPlanoPrev : Integer;
                             dDataOper                      : TDateTime;
                             bMostraMsg, bForm              : Boolean;
                             iTipoCota                      : Integer = -1) : Boolean;
Var
   fVlrIRProv, fVlrIR, fVlrIOFProv, fVlrIOF, fQtdInvestOperacao, fVlrInicial,
   fValorVariacao, fSaldoFinalCotas, fQtdeFinalInvest, fVlrIRLitigio, fVlrIOFLitigio,
   fNulo, fValorLancto, fValorAtualCusto : Double;
   fVlr , fVlrOperacao : Currency;
   sTipo : string;
   wStr, wStr1, sMensagem, wNaturezaMovimento   : String;
   iIDOperacao, iDocumento, iPlano, iPlanilha, iTipoOperacao : Integer;
   dDta, dDtaAnt, dDtaAntVar, dDtaUltDiaMes, dDataUltPgtoIR, dDataProcesso, dDataIniRefIR : TDateTime;
   Year, Month, Day : Word;
   fVrlRendimento : Double;
begin
   iDocumento      := -1;
   iPlano          := -1;
   iPlanilha       := -1;
   fvlr            :=  0;
   fVlrOperacao    :=  0;
   dDtaUltDiaMes   := dDataOper;

   If bForm Then
      frmFechtoFundos.LblAtualizacao.Visible := True;

   Try

      With DmFundoComum Do
      Begin
         OperComum.LimpaParametros(DmFundoComum.QryPlnCodigoHistFundo);
         QryPlnCodigoHistFundo.ParamByName('DATAMOVFUNDO').AsString        := DateToStr(dDataOper);
         QryPlnCodigoHistFundo.ParamByName('IDTIPOFUNDOINVEST').AsInteger  := iTipoFundo;
         //Al_115
         QryPlnCodigoHistFundo.ParamByName('IDTIPOINVEST').AsInteger       := iTipoInvest;
         QryPlnCodigoHistFundo.Open;

         dDtaAnt := dDataOper - 1;
         While not DiasUteisInv.DiaUtil(dDtaAnt, -1, 1,'',True,False,False) Do
            dDtaAnt := dDtaAnt  - 1;

         If (iTipoFundo <> 1) And (iTipoFundo <> 4) Then
         begin
            //Último dia do mês
            DecodeDate(dDtaAnt, Year, Month, Day);

            dDtaUltDiaMes := UltimoDiaMes(Year, Month);

            If dDtaAnt = dDtaUltDiaMes Then
            Begin
               If iFundo = -1 Then Begin
                  If not dtmBaseDados.dbBaseDados.InTransaction then
                     dtmBaseDados.dbBaseDados.StartTransaction;
               End;
               //Al_115
               OperComum.LimpaParametros(DmFundoComum.QryAux);
               ExecutaQuery(QryAux,'DELETE FROM HISTFUNDO WHERE '+
                                   'IDTIPOINVEST = '+QuotedStr(IntToStr(iTipoInvest))+' AND '+
                                   'IDPLANPREVCTBPATR > 0 AND   '+
                                   'IDFUNDOINVEST     > 0 AND   '+
                                   'DATAMOVFUNDO = TO_DATE('+QuotedStr(DateToStr(dDtaAnt))+',''DD/MM/YYYY'') AND '+
                                   'IDTIPOOPERACAO IN (-46,-47) ');
               OperComum.LimpaParametros(DmFundoComum.QryAux);                                   

               If iFundo = -1 Then dtmBaseDados.dbBaseDados.Commit;

            End;
         End;

         If Not QryPlnCodigoHistFundo.FieldByName('PLNCODIGO').IsNull Then
         Begin
            If iFundo = -1 Then Begin
               If not dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.StartTransaction;
            End;

            While Not QryPlnCodigoHistFundo.Eof Do
            begin
               If Not QryPlnCodigoHistFundo.FieldByName('PLNCODIGO').IsNull Then
               begin
                  ExecutaQuery(QryAux,'UPDATE HISTFUNDO SET PLNCODIGO = NULL WHERE PLNCODIGO = '+
                                      QryPlnCodigoHistFundo.FieldByName('PLNCODIGO').AsString);
                  //Al_115
                  If Not ProcExcluiContabil(QryPlnCodigoHistFundo.FieldByName('PLANO').AsInteger,
                                            QryPlnCodigoHistFundo.FieldByName('PLNCODIGO').AsInteger) Then
                  begin 
                     Result := False;                       
                     Exit; 
                  end; 
               end;

               QryPlnCodigoHistFundo.Next;
            end;
            OperComum.LimpaParametros(DmFundoComum.QryPlnCodigoHistFundo);

            If iFundo = -1 Then dtmBaseDados.dbBaseDados.Commit;

         End;

         //Al_156
         QryAtuAplicacoes.Filter   := '';
         QryAtuAplicacoes.Filtered := False;
         //Busca ultimo registro da aplicaçao atualizada

         //Carlos Gava - 15/07/2008 - N. Sol 90557 -  N. Kintana 381274
         //AL_196
         ListaAtuAplicacoes(iTipoInvest, iTipoFundo, iPlanoPrev, iFundo, iTipoCota,
                            dDataOper,
                            DiasUteisInv.UltDiaUtilAnterior(
                            CtrlInvContab.BuscaDataBloqContab(dDataOper), -1, 1, '',
                            True, False, False));

         OperComum.LimpaParametros(DmFundoComum.QryAux);
         // Busca dados do Tipo de Operacao - recebimento de dividendo, não influência no saldo
         FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST='+IntToStr(iTipoInvestUsu)+
                         ' AND NATUREZAOPERACAO =  ''R''');
         If Not QryAux.FieldByName('IDTIPOOPERACAO').IsNull Then
         Begin
            QryAtuAplicacoes.Filter   := 'IDTIPOOPERACAO <> '+QryAux.FieldByName('IDTIPOOPERACAO').AsString;
            QryAtuAplicacoes.Filtered := True;
         End;
         OperComum.LimpaParametros(DmFundoComum.QryAux);

         If iFundo = -1 Then
         Begin
            If bForm Then
            begin
               frmFechtoFundos.prbAtualizaFundos.Max := 0;
               frmFechtoFundos.prbAtualizaFundos.StepIt;
               frmFechtoFundos.prbAtualizaFundos.Max := QryAtuAplicacoes.RecordCount;
            end;
         End
         Else
         Begin
            If bForm Then
            Begin
               frmAguarde.Pos := 0;
               frmAguarde.Max := QryAtuAplicacoes.RecordCount;
               frmAguarde.Mostra('Aguarde, atualizando aplicações do dia '+DateToStr(dDataOper)+'.');
            End;
         End;

         While Not QryAtuAplicacoes.Eof Do
         Begin
            If iPlanoPrev = -1 Then
            Begin
               If bForm Then
               begin
                  If Trim(frmFechtoFundos.pnlPlanoPatrocinadora.Caption) <>
                     Trim(QryAtuAplicacoes.FieldByName('PLANPRVCONTABPATRO').AsString) Then
                  Begin
                     frmFechtoFundos.pnlPlanoPatrocinadora.Caption :=
                                     QryAtuAplicacoes.FieldByName('PLANPRVCONTABPATRO').AsString;
                     frmFechtoFundos.pnlPlanoPatrocinadora.Repaint;
                  End;
               end;
            End;

            If bForm Then
               frmFechtoFundos.LblDataAplDesc.Caption := QryAtuAplicacoes.FieldByName('DATAAPLICACAO').AsString;
            If iFundo = -1 Then
            Begin
               If bForm Then
               begin
                  If Trim(frmFechtoFundos.lblDescFundo.Caption) <>
                     Trim(QryAtuAplicacoes.FieldByName('DESCFUNDOINVEST').AsString) Then
                  Begin
                     frmFechtoFundos.lblDescFundo.Caption := QryAtuAplicacoes.FieldByName('DESCFUNDOINVEST').AsString;
                     frmFechtoFundos.lblDescFundo.Repaint;
                  End;
                  frmFechtoFundos.prbAtualizaFundos.StepIt;
               end;
            End;

            dDataProcesso := QryAtuAplicacoes.FieldByName('DATAMOVFUNDO').AsDateTime;
            //Trazer a atualização atê a data atual
            While dDataProcesso <= dDataOper Do
            Begin
               If bForm Then
                  frmFechtoFundos.LblDataMovDesc.Caption := DateToStr(dDataProcesso);
               OperComum.LimpaParametros(DmFundoComum.QryVlrCotaAux);
               QryVlrCotaAux.SQL.Clear;
               QryVlrCotaAux.SQL.Add(' SELECT VLRCOTA   ');
               QryVlrCotaAux.SQL.Add(' FROM   COTAFUNDO ');
               QryVlrCotaAux.SQL.Add(' WHERE            ');
               QryVlrCotaAux.SQL.Add('        IDFUNDOINVEST = '+QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsString+' AND ');
               If Not QryAtuAplicacoes.FieldByName('IDTIPOCOTA').IsNull Then
                  QryVlrCotaAux.SQL.Add('     IDTIPOCOTA    = '+QryAtuAplicacoes.FieldByName('IDTIPOCOTA').AsString+'   AND ');
               QryVlrCotaAux.SQL.Add('        DATACOTA      =                   ');
               QryVlrCotaAux.SQL.Add('           (SELECT MAX(DATACOTA)          ');
               QryVlrCotaAux.SQL.Add('            FROM   COTAFUNDO              ');
               QryVlrCotaAux.SQL.Add('            WHERE                         ');
               QryVlrCotaAux.SQL.Add('                   IDFUNDOINVEST  = '+QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsString+' AND ');
               If Not QryAtuAplicacoes.FieldByName('IDTIPOCOTA').IsNull Then
                  QryVlrCotaAux.SQL.Add('                IDTIPOCOTA     = '+QryAtuAplicacoes.FieldByName('IDTIPOCOTA').AsString+'   AND ');
               If iTipoFundo <> 1 Then //Se não for fundo Imobiliario busca a cota do dia
               begin
                  //AL_42
                  if dDataProcesso < QryAtuAplicacoes.FieldByName('DATACOTIZA').AsDateTime then
                     QryVlrCotaAux.SQL.Add('   DATACOTA     = TO_DATE('+QuotedStr(QryAtuAplicacoes.FieldByName('DATACOTIZA').AsString)+',''DD/MM/YYYY''))')
                  else
                     QryVlrCotaAux.SQL.Add('   DATACOTA     = TO_DATE('+QuotedStr(DateToStr(dDataProcesso))+',''DD/MM/YYYY''))');
               end
               Else
                  QryVlrCotaAux.SQL.Add('   DATACOTA       <= TO_DATE('+QuotedStr(DateToStr(dDataProcesso))+',''DD/MM/YYYY''))');
               QryVlrCotaAux.Open;

               If QryVlrCotaAux.FieldByName('VLRCOTA').AsFloat <> 0 Then
               Begin
                  fQtdInvestOperacao := QryAtuAplicacoes.FieldByName('SALDOQTDCOTAS').AsFloat;

                  If fQtdInvestOperacao < 0 Then
                  Begin
                     sMensagem := 'Divergência de cotas na atualização da aplicação! Operação será cancelada.';
                     If bMostraMsg Then
                        MsgDlg(sMensagem, 'Mensagem do Sistema', mtInformation, [mbOk], 0);
                     OperComum.LimpaParametros(DmFundoComum.QryAtuAplicacoes);
                     OperComum.LimpaParametros(DmFundoComum.QryVlrCotaAux);
                     If bForm Then
                     begin
                        If iFundo     = -1 Then frmFechtoFundos.lblDescFundo.Caption := ' ';
                        If iFundo     = -1 Then frmFechtoFundos.lblDescFundo.Repaint;
                        If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Caption := ' ';
                        If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Repaint;
                     end;
                     Result       := False;
                     Exit;
                  End;

                  If QryVlrCotaAux.FieldByName('VLRCOTA').AsFloat <> 0 Then
                  Begin
                     fVlrIRProv   := 0;
                     fVlrIR       := 0;
                     fVlrIOFProv  := 0;
                     fVlrIOF      := 0;

                     fVlrOperacao := OperComum.Round(fQtdInvestOperacao*QryVlrCotaAux.FieldByName('VLRCOTA').AsFloat,2);

                     sTipo :=QryAtuAplicacoes.FieldByName('TIPMOVFUNDO').AsString;
                     dDta  :=QryAtuAplicacoes.FieldByName('DATAMOVFUNDO').AsDateTime;
                     fVlr  :=QryAtuAplicacoes.FieldByName('SALDOVLRFUNDO').AsFloat;

                     //Ricardo Cristiano - 18/12/2008 - N. Sol 103947 -  N. Kintana 464524                     
                     //AL_169                     
                     If (((TRIM(sTipo)  <> 'INI' ) Or
                         ((TRIM(sTipo)   = 'INI' ) And (ddta <> dDataProcesso))) And
                        (((fVlrOperacao <>  fVlr)) Or
                         ((fVlrOperacao  =  fVlr)  And (dDataProcesso <> ddta)))) then
                     Begin
                        If  Not ((QryAtuAplicacoes.FieldByName('TIPMOVFUNDO').AsString   = 'ATU')  And
                                 (QryAtuAplicacoes.FieldByName('NATURMOVFUNDO').AsString = 'A' )   And
                                 (ddta = dDataProcesso) ) Then
                        begin
                           //Al_87
                           If (((QryAtuAplicacoes.FieldByName('IDTIPOOPERACAO').AsInteger <> -43)  And
                                (QryAtuAplicacoes.FieldByName('IDTIPOOPERACAO').AsInteger <> -143)) Or
                                (QryAtuAplicacoes.FieldByName('DATAMOVFUNDO').AsDateTime  <> dDataProcesso)) Then
                           Begin
                              If QryAtuAplicacoes.FieldByName('STAPROVISIONAIOF').AsString = 'S' Then
                              Begin
                                 //AL_41
                                 if (iTipoFundo <> 4) Or
                                    (QryAtuAplicacoes.FieldByName('COTAAPLICACAO').AsFloat = 0) then
                                 begin
                                    OperComum.LimpaParametros(DmFundoComum.QryVlrCotaAux);
                                    QryVlrCotaAux.SQL.Clear;
                                    QryVlrCotaAux.SQL.Add(' SELECT VLRCOTA   ');
                                    QryVlrCotaAux.SQL.Add(' FROM   COTAFUNDO ');
                                    QryVlrCotaAux.SQL.Add(' WHERE            ');
                                    QryVlrCotaAux.SQL.Add('        IDFUNDOINVEST = '+QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsString+' AND ');
                                    If Not QryAtuAplicacoes.FieldByName('IDTIPOCOTA').IsNull Then
                                       QryVlrCotaAux.SQL.Add('     IDTIPOCOTA    = '+QryAtuAplicacoes.FieldByName('IDTIPOCOTA').AsString+'   AND ');
                                    QryVlrCotaAux.SQL.Add('        DATACOTA      =                   ');
                                    QryVlrCotaAux.SQL.Add('           (SELECT MAX(DATACOTA)          ');
                                    QryVlrCotaAux.SQL.Add('            FROM   COTAFUNDO              ');
                                    QryVlrCotaAux.SQL.Add('            WHERE                         ');
                                    QryVlrCotaAux.SQL.Add('                   IDFUNDOINVEST  = '+QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsString+' AND ');
                                    If Not QryAtuAplicacoes.FieldByName('IDTIPOCOTA').IsNull Then
                                       QryVlrCotaAux.SQL.Add('                IDTIPOCOTA     = '+QryAtuAplicacoes.FieldByName('IDTIPOCOTA').AsString+'   AND ');
                                    If iTipoFundo <> 1 Then //Se não for fundo Imobiliario busca a cota do dia
                                       QryVlrCotaAux.SQL.Add('   DATACOTA        = TO_DATE('+QuotedStr(QryAtuAplicacoes.FieldByName('DATAAPLICACAO').AsString)+',''DD/MM/YYYY''))')
                                    Else
                                       QryVlrCotaAux.SQL.Add('   DATACOTA       <= TO_DATE('+QuotedStr(QryAtuAplicacoes.FieldByName('DATAAPLICACAO').AsString)+',''DD/MM/YYYY''))');
                                    QryVlrCotaAux.Open;

                                    fVlrIOF := Impostos.CalculaIOF(1,
                                                        QryAtuAplicacoes.FieldByName('DATAAPLICACAO').AsDateTime,
                                                        dDataProcesso,
                                                        OperComum.Round(fQtdInvestOperacao*
                                                                  QryVlrCotaAux.FieldByName('VLRCOTA').AsFloat,2),
                                                        fVlrOperacao,
                                                        'S');
                                    OperComum.LimpaParametros(DmFundoComum.QryVlrCotaAux);
                                 end
                                 else
                                    fVlrIOF := Impostos.CalculaIOF(1,
                                                        QryAtuAplicacoes.FieldByName('DATAAPLICACAO').AsDateTime,
                                                        dDataProcesso,
                                                        OperComum.Round(fQtdInvestOperacao*
                                                                  QryAtuAplicacoes.FieldByName('COTAAPLICACAO').AsFloat,2),
                                                        fVlrOperacao,
                                                        'S');
                                 fVlrIOFProv     := fVlrIOF;
                              End;

                              If QryAtuAplicacoes.FieldByName('STAPROVISIONAIR').AsString = 'S' Then
                              Begin
                                 If (QryAtuAplicacoes.FieldByName('DESCTIPOFUNDOINV').AsString = 'FAC') Or
                                    (QryAtuAplicacoes.FieldByName('DESCTIPOFUNDOINV').AsString = 'FIF') Then
                                     fVlrInicial := QryAtuAplicacoes.FieldByName('SALDOVLRFUNDO').AsFloat
                                 Else
                                     fVlrInicial := QryAtuAplicacoes.FieldByName('VLRAPLICADO').AsFloat;

                                 If QryAtuAplicacoes.FieldByName('IDTIPOINVEST').AsInteger=5 Then
                                    dDataIniRefIR:=QryAtuAplicacoes.FieldByName('DATAULTPGTOIR').AsDateTime
                                 Else
                                    dDataIniRefIR:=QryAtuAplicacoes.FieldByName('DATAAPLICACAO').AsDateTime;

                                 If (iTipoFundo = 1) and (pRPI.STARET = 'S') Then
                                    dDataIniRefIR := pRPI.DATAULTRET;

                                 fVrlRendimento := 0;

                                 //AL_41
                                 if (iTipoFundo <> 4) Or
                                    (QryAtuAplicacoes.FieldByName('COTAAPLICACAO').AsFloat = 0) then
                                 begin
                                    OperComum.LimpaParametros(DmFundoComum.QryVlrCotaAux);
                                    QryVlrCotaAux.SQL.Clear;
                                    QryVlrCotaAux.SQL.Add(' SELECT VLRCOTA   ');
                                    QryVlrCotaAux.SQL.Add(' FROM   COTAFUNDO ');
                                    QryVlrCotaAux.SQL.Add(' WHERE            ');
                                    QryVlrCotaAux.SQL.Add('        IDFUNDOINVEST = '+QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsString+' AND ');
                                    If Not QryAtuAplicacoes.FieldByName('IDTIPOCOTA').IsNull Then
                                       QryVlrCotaAux.SQL.Add('     IDTIPOCOTA    = '+QryAtuAplicacoes.FieldByName('IDTIPOCOTA').AsString+'   AND ');
                                    QryVlrCotaAux.SQL.Add('        DATACOTA      =                   ');
                                    QryVlrCotaAux.SQL.Add('           (SELECT MAX(DATACOTA)          ');
                                    QryVlrCotaAux.SQL.Add('            FROM   COTAFUNDO              ');
                                    QryVlrCotaAux.SQL.Add('            WHERE                         ');
                                    QryVlrCotaAux.SQL.Add('                   IDFUNDOINVEST  = '+QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsString+' AND ');
                                    If Not QryAtuAplicacoes.FieldByName('IDTIPOCOTA').IsNull Then
                                       QryVlrCotaAux.SQL.Add('                IDTIPOCOTA     = '+QryAtuAplicacoes.FieldByName('IDTIPOCOTA').AsString+'   AND ');
                                    If iTipoFundo <> 1 Then //Se não for fundo Imobiliario busca a cota do dia
                                       QryVlrCotaAux.SQL.Add('   DATACOTA        = TO_DATE('+QuotedStr(DateToStr(dDataIniRefIR))+',''DD/MM/YYYY''))')
                                    Else
                                       QryVlrCotaAux.SQL.Add('   DATACOTA       <= TO_DATE('+QuotedStr(DateToStr(dDataIniRefIR))+',''DD/MM/YYYY''))');
                                    QryVlrCotaAux.Open;

                                    fVlrIR  := Impostos.CalculaIr(QryAtuAplicacoes.FieldByName('IDTIPOINVEST').AsInteger,
                                                        0{Investiment}, 0{Carteira}, 0{CARTEIRAGERENC}, 0{TipoOperacao}, 0{Mercado}, ''{Lote},
                                                        dDataIniRefIR, dDataProcesso,
                                                        OperComum.Round(fQtdInvestOperacao*
                                                        QryVlrCotaAux.FieldByName('VLRCOTA').AsFloat,2),
                                                        fVlrOperacao, 0,
                                                        QryAtuAplicacoes.FieldByName('STAPROVISIONAIR').AsString, 'G',fVrlRendimento);
                                    OperComum.LimpaParametros(DmFundoComum.QryVlrCotaAux);
                                 end
                                 else
                                    fVlrIR  := Impostos.CalculaIr(QryAtuAplicacoes.FieldByName('IDTIPOINVEST').AsInteger,
                                                        0{Investiment}, 0{Carteira}, 0{CARTEIRAGERENC}, 0{TipoOperacao}, 0{Mercado}, ''{Lote},
                                                        dDataIniRefIR, dDataProcesso,
                                                        OperComum.Round(fQtdInvestOperacao*
                                                                  QryAtuAplicacoes.FieldByName('COTAAPLICACAO').AsFloat,2),
                                                        fVlrOperacao, 0,
                                                        QryAtuAplicacoes.FieldByName('STAPROVISIONAIR').AsString,
                                                        'G', fVrlRendimento);

                                 If fVlrIR > 0 Then
                                    fVlrIRProv := fVlrIR;
                              End;

                              //Al_66
                              if QryAtuAplicacoes.FieldByName('DATAMOVFUNDO').AsDateTime <> dDataProcesso then
                              begin
                                 dDtaAntVar := dDataProcesso  - 1;
                                 If iTipoFundo <> 1 Then //Se não for fundo Imobiliario busca a cota do dia
                                 begin
                                    While not DiasUteisInv.DiaUtil(dDtaAntVar,-1,1,'',True,False,False) Do
                                      dDtaAntVar := dDtaAntVar  - 1;
                                 end;

                                 //AL_41
                                 //AL_45
                                 OperComum.LimpaParametros(DmFundoComum.QryVlrCotaAux);
                                 QryVlrCotaAux.SQL.Clear;
                                 QryVlrCotaAux.SQL.Add(' SELECT VLRCOTA   ');
                                 QryVlrCotaAux.SQL.Add(' FROM   COTAFUNDO ');
                                 QryVlrCotaAux.SQL.Add(' WHERE            ');
                                 QryVlrCotaAux.SQL.Add('        IDFUNDOINVEST = '+QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsString+' AND ');
                                 If Not QryAtuAplicacoes.FieldByName('IDTIPOCOTA').IsNull Then
                                    QryVlrCotaAux.SQL.Add('     IDTIPOCOTA    = '+QryAtuAplicacoes.FieldByName('IDTIPOCOTA').AsString+'   AND ');
                                 QryVlrCotaAux.SQL.Add('        DATACOTA      =                   ');
                                 QryVlrCotaAux.SQL.Add('           (SELECT MAX(DATACOTA)          ');
                                 QryVlrCotaAux.SQL.Add('            FROM   COTAFUNDO              ');
                                 QryVlrCotaAux.SQL.Add('            WHERE                         ');
                                 QryVlrCotaAux.SQL.Add('                   IDFUNDOINVEST  = '+QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsString+' AND ');
                                 If Not QryAtuAplicacoes.FieldByName('IDTIPOCOTA').IsNull Then
                                    QryVlrCotaAux.SQL.Add('                IDTIPOCOTA     = '+QryAtuAplicacoes.FieldByName('IDTIPOCOTA').AsString+'   AND ');
                                 If iTipoFundo <> 1 Then //Se não for fundo Imobiliario busca a cota do dia
                                    QryVlrCotaAux.SQL.Add('   DATACOTA        = TO_DATE('+QuotedStr(DateToStr(dDtaAntVar))+',''DD/MM/YYYY''))')
                                 Else
                                    QryVlrCotaAux.SQL.Add('   DATACOTA       <= TO_DATE('+QuotedStr(DateToStr(dDtaAntVar))+',''DD/MM/YYYY''))');
                                 QryVlrCotaAux.Open;

                                 fValorVariacao    :=
                                       OperComum.Round(fVlrOperacao -
                                           OperComum.Round(fQtdInvestOperacao*
                                                     QryVlrCotaAux.FieldByName('VLRCOTA').AsFloat,2),2);
                                 OperComum.LimpaParametros(DmFundoComum.QryVlrCotaAux);
                              end
                              //AL_149
                              //AL_147
                              //AL_143
                              else if ((QryAtuAplicacoes.FieldByName('DATAMOVFUNDO').AsDateTime = dDataProcesso) and
                                      ((QryAtuAplicacoes.FieldByName('TIPMOVFUNDO').AsString    = 'TRP') or
                                       (QryAtuAplicacoes.FieldByName('TIPMOVFUNDO').AsString    = 'TRT'))) then
                              begin
                                 OperComum.LimpaParametros(DmFundoComum.QryVlrCotaAux);
                                 QryVlrCotaAux.SQL.Clear;
                                 QryVlrCotaAux.SQL.Add(' SELECT VLRCOTA   ');
                                 QryVlrCotaAux.SQL.Add(' FROM   COTAFUNDO ');
                                 QryVlrCotaAux.SQL.Add(' WHERE            ');
                                 QryVlrCotaAux.SQL.Add('        IDFUNDOINVEST = '+QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsString+' AND ');
                                 If Not QryAtuAplicacoes.FieldByName('IDTIPOCOTA').IsNull Then
                                    QryVlrCotaAux.SQL.Add('     IDTIPOCOTA    = '+QryAtuAplicacoes.FieldByName('IDTIPOCOTA').AsString+'   AND ');
                                 QryVlrCotaAux.SQL.Add('        DATACOTA      =                   ');
                                 QryVlrCotaAux.SQL.Add('           (SELECT MAX(DATACOTA)          ');
                                 QryVlrCotaAux.SQL.Add('            FROM   COTAFUNDO              ');
                                 QryVlrCotaAux.SQL.Add('            WHERE                         ');
                                 QryVlrCotaAux.SQL.Add('                   IDFUNDOINVEST  = '+QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsString+' AND ');
                                 If Not QryAtuAplicacoes.FieldByName('IDTIPOCOTA').IsNull Then
                                    QryVlrCotaAux.SQL.Add('                IDTIPOCOTA     = '+QryAtuAplicacoes.FieldByName('IDTIPOCOTA').AsString+'   AND ');
                                 If iTipoFundo <> 1 Then //Se não for fundo Imobiliario busca a cota do dia
                                 begin
                                    if dDataProcesso < QryAtuAplicacoes.FieldByName('DATACOTIZA').AsDateTime then
                                       QryVlrCotaAux.SQL.Add('   DATACOTA     = TO_DATE('+QuotedStr(QryAtuAplicacoes.FieldByName('DATACOTIZA').AsString)+',''DD/MM/YYYY''))')
                                    else
                                       QryVlrCotaAux.SQL.Add('   DATACOTA     = TO_DATE('+QuotedStr(DateToStr(dDataProcesso))+',''DD/MM/YYYY''))');
                                 end
                                 Else
                                    QryVlrCotaAux.SQL.Add('   DATACOTA       <= TO_DATE('+QuotedStr(DateToStr(dDataProcesso))+',''DD/MM/YYYY''))');
                                 QryVlrCotaAux.Open;

                                 fValorVariacao    :=
                                       OperComum.Round(OperComum.Round(fQtdInvestOperacao*
                                                                       QryVlrCotaAux.FieldByName('VLRCOTA').AsFloat,2) -
                                                       QryAtuAplicacoes.FieldByName('SALDOVLRFUNDO').AsFloat,2);
                                 OperComum.LimpaParametros(DmFundoComum.QryVlrCotaAux);

                              end
                              else
                                 fValorVariacao    := fVlrOperacao -
                                       OperComum.Round(fQtdInvestOperacao*
                                                 QryAtuAplicacoes.FieldByName('COTAAPLICACAO').AsFloat,2);

                              dDataUltPgtoIR := QryAtuAplicacoes.FieldByName('DATAULTPGTOIR').AsDateTime;

                              //Al_100
                              If fValorVariacao  > 0 Then
                              begin
                                 iTipoOperacao      := -12;  //Atualização Positiva
                                 wNaturezaMovimento := 'G';
                              end
                              else
                              begin
                                 iTipoOperacao      := -13;  //Atualização Negativa
                                 wNaturezaMovimento := 'P';
                              end;

                              If QryAtuAplicacoes.FieldByName('VLRCUSTOATUAL').AsFloat = 0 Then
                                 fValorAtualCusto   := QryAtuAplicacoes.FieldByName('VLRAPLICADO').AsFloat
                              Else
                                 fValorAtualCusto   := QryAtuAplicacoes.FieldByName('VLRCUSTOATUAL').AsFloat;

                              If iFundo = -1 Then Begin
                                 If not dtmBaseDados.dbBaseDados.InTransaction then
                                    dtmBaseDados.dbBaseDados.StartTransaction;
                              End;

                              //Al_87
                              If Not GravaAplicacaoResgate(QryAtuAplicacoes.FieldByName('IDTIPOINVEST').AsInteger,
                                                           iTipoOperacao,
                                                           QryAtuAplicacoes.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                           QryAtuAplicacoes.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                                           QryAtuAplicacoes.FieldByName('IDFUNDOINVEST').AsInteger,
                                                           QryAtuAplicacoes.FieldByName('DATAAPLICACAO').AsDateTime,
                                                           dDataProcesso, dDataUltPgtoIR,
                                                           'ATUALIZAÇÃO : '+ QryAtuAplicacoes.FieldByName('DESCFUNDOINVEST').AsString,
                                                           wNaturezaMovimento, 'ATU', QryAtuAplicacoes.FieldByName('VLRAPLICADO').AsFloat,
                                                           fValorVariacao, fVlrIRProv, fVlrIofProv, fValorVariacao,
                                                           fQtdInvestOperacao, fQtdInvestOperacao, fVlrOperacao,
                                                           QryAtuAplicacoes.FieldByName('COTAAPLICACAO').AsFloat,
                                                           fValorAtualCusto,
                                                           QryAtuAplicacoes.FieldByName('IDPLANPREVCTBPATR').AsInteger,-1,
                                                           QryAtuAplicacoes.FieldByName('IDCOMPOSICAOFUNDO').AsInteger,
                                                           QryAtuAplicacoes.FieldByName('IDTIPOCOTA').AsInteger,
                                                           QryAtuAplicacoes.FieldByName('SALDOQTDCOTASBLQ').AsFloat) Then
                                 Abort;

                              //AL_2
                              // Grava IR Litigio Trimestral para Fundo Imobiliario caso em RET
                              if (iTipoFundo = 1) and // Fundo Imobiliario
                                 (Impostos.VerificaRetTrimestral(dDataProcesso,False,False)) then
                                 Impostos.GravaIrLitigio(QryAtuAplicacoes.FieldByName('IDTIPOINVEST').AsInteger,
                                                         dDataProcesso,-1,
                                                         'IR TRIMESTRAL - '+QryAtuAplicacoes.FieldByName('DESCFUNDOINVEST').AsString,
                                                         -1,
                                                         QryPatroPlanPrevContab.FieldByName('IDPLANOPREV').AsInteger,
                                                         QryPatroPlanPrevContab.FieldByName('IDPATRO').AsInteger,
                                                         fVlrIRLitigio,
                                                         fVrlRendimento,
                                                         -1,QryAtuAplicacoes.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                                         -1,-1);
                              // Confirma Transação
                              If iFundo = -1 Then dtmBaseDados.dbBaseDados.Commit;
                           End;
                        End;
                     End;
                     dDataProcesso := dDataProcesso  + 1;
                     If (iTipoFundo <> 1) Then //Fundo Imobiliário é contabilizado fim de semana
                     begin
                         While not DiasUteisInv.DiaUtil(dDataProcesso,-1,1,'',True,False,False) Do
                            dDataProcesso := dDataProcesso  + 1;
                     end;
                  End;
               End
               Else
                 dDataProcesso := dDataProcesso + 1;
            End;

            QryAtuAplicacoes.Next;

            If bForm Then
            begin
               frmFechtoFundos.LblDataMovDesc.Caption := '     ';

               If iFundo <> -1 Then
                  frmAguarde.Pos := frmAguarde.Pos + 1;
            end;
         End;

         If bForm Then
         begin
            frmFechtoFundos.LblDataAplDesc.Caption := '     ';
            frmFechtoFundos.LblDataMovDesc.Caption := '     ';
            If iFundo = -1 Then
            Begin
              frmFechtoFundos.prbAtualizaFundos.Max := 0;
              frmFechtoFundos.prbAtualizaFundos.StepIt;
              frmFechtoFundos.lblDescFundo.Caption  := '';
              frmFechtoFundos.lblDescFundo.Repaint;
            End;
         end;

         OperComum.LimpaParametros(DmFundoComum.QryVlrCotaAux);
         OperComum.LimpaParametros(DmFundoComum.QryAtuAplicacoes);
         OperComum.LimpaParametros(DmFundoComum.QryPatroPlanPrevContab);

         If bForm Then
         begin
            If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Caption := ' ';
            If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Repaint;
         end;

         If iFundo = -1 Then Begin
            If not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;
         End;

         //AL_197

         If Not ContabilizaVariacao(iTipoFundo, Sistema.IdEmpresa, Sistema.IdModulo, -1,
                                    dDataOper,
                                    bMostraMsg, (iFundo = -1),
                                    iPlano, iPlanilha, iDocumento,
                                    fValorLancto) Then
         Begin
            //Al_115
            If bMostraMsg Then
               MsgDlg('O processo será cancelado.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
            If bForm Then
            begin
               If iFundo = -1 Then frmFechtoFundos.lblDescFundo.Caption := ' ';
               If iFundo = -1 Then frmFechtoFundos.lblDescFundo.Repaint;
               If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Caption := ' ';
               If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Repaint;
            end;
            Result := False;
            Exit;
         End;

         If iFundo = -1 Then dtmBaseDados.dbBaseDados.Commit;

         If fValorLancto <> 0 Then
         Begin
            If iFundo = -1 Then Begin
               If not dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.StartTransaction;
            End;

            If Not ContabilizaProvIRRF(iTipoFundo, dDataOper, iPlano, iPlanilha, iDocumento,
                                       fValorLancto) Then
            Begin
               //Al_115
               If bMostraMsg Then
                  MsgDlg('O processo será cancelado.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
               If bForm Then
               begin
                  If iFundo = -1 Then frmFechtoFundos.lblDescFundo.Caption := ' ';
                  If iFundo = -1 Then frmFechtoFundos.lblDescFundo.Repaint;
                  If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Caption := ' ';
                  If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Repaint;
               end;
               Result := False;
               Exit;
            End;

            If iFundo = -1 Then dtmBaseDados.dbBaseDados.Commit;
         End;

         If fValorLancto <> 0 Then
         Begin
            If (iTipoFundo <> 1) And (iTipoFundo <> 4) Then
            Begin
               If iFundo = -1 Then Begin
                  If not dtmBaseDados.dbBaseDados.InTransaction then
                     dtmBaseDados.dbBaseDados.StartTransaction;
               End;

               If Not ContabilizaProvRevIOF(iTipoFundo, dDataOper, iPlano, iPlanilha, iDocumento,
                                            fValorLancto) Then
               Begin
                  //Al_115
                  If bMostraMsg Then
                     MsgDlg('O processo será cancelado.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
                  If bForm Then
                  begin
                     If iFundo = -1 Then frmFechtoFundos.lblDescFundo.Caption := ' ';
                     If iFundo = -1 Then frmFechtoFundos.lblDescFundo.Repaint;
                     If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Caption := ' ';
                     If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Repaint;
                  end;
                  Result := False;
                  Exit;
               End;

               If iFundo = -1 Then dtmBaseDados.dbBaseDados.Commit;
            End;
         End;

         //AL_108

         If iFundo = -1 Then
         Begin
            If not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;
         End;

         If Not CriarLanctoDocumentoAtu(fValorLancto, dDataOper,
                                        iTipoFundo, iPlano, iPlanilha, iDocumento) Then
         Begin
            //Al_115
            If bMostraMsg Then
               MsgDlg('Não foi possível efetuar o lançamento do documento na Contabilidade!'+#13+
                      'A Operação será cancelada.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
            If bForm Then
            begin
               If iFundo = -1 Then frmFechtoFundos.lblDescFundo.Caption := ' ';
               If iFundo = -1 Then frmFechtoFundos.lblDescFundo.Repaint;
               If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Caption := ' ';
               If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Repaint;
            end;
            Result := False;
            Exit;
         End;

         //Al_101
         if iFundo = -1 Then
         begin
            ExecutaQuery(QryAux,'UPDATE PARAMINVEST SET DATAULTFECHFDO = TO_DATE('''+
                         DateToStr(dDataOper)+''',''DD/MM/YYYY'')');

            ExecutaQuery(QryAux,'UPDATE TIPOFUNDOINVEST SET DATAULTFECH = TO_DATE('''+
                         DateToStr(dDataOper)+''',''DD/MM/YYYY'') WHERE IDTIPOFUNDOINVEST ='+
                         IntToStr(iTipoFundo));
            //Al_115
            OperComum.LimpaParametros(DmFundoComum.QryAux);
         end;

         If iFundo = -1 Then dtmBaseDados.dbBaseDados.Commit;
         // AL_157
      End;
   Except
      On E:Exception Do Begin
        //Al_115
        If bMostraMsg Then
           MsgDlg('O processo de Atualização será cancelado.'#13+
                  'Mensagem : '+E.Message, 'Mensagem do Sistema',mtInformation,[mbOk],0);

        If iFundo = -1 Then DtmBaseDados.dbBaseDados.Rollback;

        If bForm Then
        begin
           frmFechtoFundos.LblAtualizacao.Visible := False;
           If iFundo = -1 Then frmFechtoFundos.lblDescFundo.Caption := ' ';
           If iFundo = -1 Then frmFechtoFundos.lblDescFundo.Repaint;
           If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Caption := ' ';
           If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Repaint;
        end;
        Result := False;
        Exit;
      End;
   End;

   Result := True;

   If bForm Then
   begin
      frmFechtoFundos.LblAtualizacao.Visible := False;

      If iFundo     = -1 Then frmFechtoFundos.lblDescFundo.Caption := ' ';
      If iFundo     = -1 Then frmFechtoFundos.lblDescFundo.Repaint;
      If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Caption := ' ';
      If iPlanoPrev = -1 Then frmFechtoFundos.pnlPlanoPatrocinadora.Repaint;
      If iFundo    <> -1 Then frmAguarde.Apaga;
   end;
end;

//AL_162
Function  ExcluiResgate(iPedido: Integer; bMostraMsg: Boolean = True) : Boolean;
begin
   With DmFundoComum Do
   begin
      //Al_118
      //AL_162
      Try
         Result := False;

         OperComum.LimpaParametros(DmFundoComum.QryVerDelResgate);
         QryVerDelResgate.ParamByName('IDPEDIDOFUNDO').AsInteger := iPedido;
         QryVerDelResgate.Open;

         OperComum.LimpaParametros(QryUpdPedidoFundo);
         QryUpdPedidoFundo.ParamByName('IDPEDIDOFUNDO').AsInteger := iPedido;
         QryUpdPedidoFundo.ExecSql;
         If Not ProcExcluiFundo(QryVerDelResgate.FieldByName('CODDOCUMENTO').AsInteger,
                                QryVerDelResgate.FieldByName('PLNCODIGO').AsInteger,
                                QryVerDelResgate.FieldByName('PLANO').AsInteger,
                                QryVerDelResgate.FieldByName('IDTIPOINVEST').AsInteger,
                                QryVerDelResgate.FieldByName('DATAMOVFUNDO').AsDateTime, bMostraMsg) Then
            Raise Exception.Create('Ocorreu um problema ao excluir os lançamentos contábeis e financeiros')
         else
         begin
            OperComum.LimpaParametros(QryDelIrLitigioPedido);
            QryDelIrLitigioPedido.ParamByName('IDPEDIDOFUNDO').AsInteger     := iPedido;
            QryDelIrLitigioPedido.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                  QryVerDelResgate.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            QryDelIrLitigioPedido.ParamByName('IDTIPOINVEST').AsInteger      :=
                                  QryVerDelResgate.FieldByName('IDTIPOINVEST').AsInteger;
            QryDelIrLitigioPedido.ParamByName('DATAMOVFUNDO').AsString       :=
                                  QryVerDelResgate.FieldByName('DATAMOVFUNDO').AsString;
            QryDelIrLitigioPedido.ExecSql;

            OperComum.LimpaParametros(QryDelHistFundoResg);
            QryDelHistFundoResg.ParamByName('IDPEDIDOFUNDO').AsInteger     := iPedido;
            QryDelHistFundoResg.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                QryVerDelResgate.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            QryDelHistFundoResg.ParamByName('IDTIPOINVEST').AsInteger      :=
                                QryVerDelResgate.FieldByName('IDTIPOINVEST').AsInteger;
            QryDelHistFundoResg.ParamByName('DATAMOVFUNDO').AsString       :=
                                QryVerDelResgate.FieldByName('DATAMOVFUNDO').AsString;
            QryDelHistFundoResg.ExecSql;

            OperComum.LimpaParametros(QryDelOperacaoFundoResg);
            QryDelOperacaoFundoResg.ParamByName('IDPEDIDOFUNDO').AsInteger     := iPedido;
            QryDelOperacaoFundoResg.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                    QryVerDelResgate.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            QryDelOperacaoFundoResg.ParamByName('IDTIPOINVEST').AsInteger      :=
                                    QryVerDelResgate.FieldByName('IDTIPOINVEST').AsInteger;
            QryDelOperacaoFundoResg.ParamByName('DATAMOVFUNDO').AsString       :=
                                    QryVerDelResgate.FieldByName('DATAMOVFUNDO').AsString;
            QryDelOperacaoFundoResg.ExecSql;

            OperComum.LimpaParametros(QryDelPedidoFundoResg);
            QryDelPedidoFundoResg.ParamByName('IDPEDIDOFUNDO').AsInteger   := iPedido;
            QryDelPedidoFundoResg.ExecSql;

            Result := True;
         end;
      finally
         OperComum.LimpaParametros(QryVerDelResgate);
         OperComum.LimpaParametros(QryUpdPedidoFundo);
         OperComum.LimpaParametros(QryDelIrLitigioPedido);
         OperComum.LimpaParametros(QryDelHistFundoResg);
         OperComum.LimpaParametros(QryDelOperacaoFundoResg);
         OperComum.LimpaParametros(QryDelPedidoFundoResg);
      end;
   end;
end;

//Al_87
//Alt_1
Function GravaAmortCustoAtual(QryTmpDetalhe : TQuery;
                              dDataOper     : TDateTime;
                              sDescOper, sDescFundo  : String;
                              iTipoInvest, iPlano, iOperacaoFundo, iTipoOper : Integer;
                              fValorCustoNovo, fValorCustoTotal : Currency;
                              Var fValorOper : Currency;
                              iTipoCota : Integer = -1) : Boolean;
//AL_107
Var  fValorAplicado, fValorGravar, fValorAtualCusto : Currency;
Begin
   Try
      fValorGravar      := fValorOper;
      //AL_187
      fValorOper        := fValorCustoTotal;

      QryTmpDetalhe.First;

      While Not QryTmpDetalhe.Eof Do
      Begin
         If (fValorGravar > 0) Then
         Begin
            fValorAplicado    := QryTmpDetalhe.FieldByName('VLRAPLICADO').AsFloat - fValorGravar;
            fValorGravar      := fValorGravar - QryTmpDetalhe.FieldByName('VLRAPLICADO').AsFloat;

            If fValorAplicado <  0 Then
               fValorAplicado := 0;

            If fValorGravar   < 0 Then
               fValorGravar   := 0;
         End
         Else
            fValorGravar      := QryTmpDetalhe.FieldByName('VLRAPLICADO').AsFloat;

         //AL_187
         If fValorOper > 0 Then
         Begin
            If ((QryTmpDetalhe.FieldByName('SALDOVLRFUNDO').AsFloat-fValorAplicado) >= fValorOper) Then
               fValorOper       := 0;
         End;

         If (fValorAplicado > QryTmpDetalhe.FieldByName('VLRCUSTOATUAL').AsFloat) Then
             fValorAtualCusto   := QryTmpDetalhe.FieldByName('VLRAPLICADO').AsFloat
         Else
             fValorAtualCusto   := QryTmpDetalhe.FieldByName('VLRCUSTOATUAL').AsFloat;

         //Al_57             
         //Alt_1
         If Not GravaAplicacaoResgate(iTipoInvest,
                                      iTipoOper,
                                      QryTmpDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                      iOperacaoFundo,
                                      QryTmpDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                      QryTmpDetalhe.FieldByName('DATAAPLICACAO').AsDateTime,
                                      dDataOper,
                                      QryTmpDetalhe.FieldByName('DATAULTPGTOIR').AsDateTime,
                                      sDescOper+' / '+sDescFundo,
                                      ''{NaturezaOperacao}, 'OPE',
                                      fValorAplicado,
                                      QryTmpDetalhe.FieldByName('VLRMOVFUNDO').AsFloat,
                                      QryTmpDetalhe.FieldByName('VLRIRPROV').AsFloat,
                                      QryTmpDetalhe.FieldByName('VLRIOFPROV').AsFloat,0,
                                      QryTmpDetalhe.FieldByName('COTASMOVFUNDO').AsFloat,
                                      QryTmpDetalhe.FieldByName('SALDOQTDCOTAS').AsFloat,
                                      QryTmpDetalhe.FieldByName('SALDOVLRFUNDO').AsFloat,
                                      QryTmpDetalhe.FieldByName('COTAAPLICACAO').AsFloat,
                                      fValorAtualCusto{Valor anterior},
                                      iPlano, -1, -1, iTipoCota,
                                      QryTmpDetalhe.FieldByName('SALDOQTDCOTASBLQ').AsFloat) Then
         begin
            Result := False;
            Exit;
         end;

         //AL_187
         If ((fValorGravar = 0) or (fValorOper <= 0)) Then
            QryTmpDetalhe.Last;

         QryTmpDetalhe.Next;
      End;
      Result := True;
   Except
      on E:Exception do
      begin
         MsgDlg('Não foi possível Amortizar o Valor de Custo! '+ #13 +
                 E.Message,'Mensagem do Sistema',mtWarning ,[mbOk],0);
         Result := False;
      end;
   End;
End;

function GravaIRAmort(dDataOper  : TDateTime;
                      fValorOper : Currency;
                      iOperacao, iCarteira, iTipoFundoInvest, iTipoInvest, iIdForCli : Integer;
                      sProvIR, sNatureza, sDescOper, sDescFundo    : String;
                      var iPlano, iPlanilha, iDocumento : Integer) : Boolean;
var
  fVlrRendimento, fVlrIR : Double;
Begin
   Try
      fVlrRendimento := 0;
      fVlrIR  := Impostos.CalculaIr(iTipoInvest,
                                    0{Investiment}, 0{Carteira}, 0{CARTEIRAGERENC},
                                    0{TipoOperacao}, 0{Mercad}, ''{Lote},
                                    dDataOper, dDataOper,
                                    0, fValorOper, 0{Valor Iof},
                                    sProvIR, 'G', fVlrRendimento);

      If fVlrIR > 0 Then
      Begin
         OperComum.LimpaParametros(DmFundoComum.QryUpdOperFundoIrLitigio);
         DmFundoComum.QryUpdOperFundoIrLitigio.ParamByName('IDOPERACAOFUNDO').AsInteger := iOperacao;                                ;
         DmFundoComum.QryUpdOperFundoIrLitigio.ParamByName('VLRIR').AsFloat             := fVlrIR;
         DmFundoComum.QryUpdOperFundoIrLitigio.ExecSql;

         //Al_57         
         if not Impostos.GravaIrLitigio(iTipoInvest,
                                        dDataOper,
                                        -1,
                                        sDescOper+' / '+sDescFundo,
                                        -1,
                                        iPlanoPrevContab, iPatrocinadora,
                                        fVlrIR, fVlrRendimento,
                                        -1,
                                        iOperacao) then
         begin
            Result := false;
            Exit;
         end;

         //Al_56
         OperComum.LimpaParametros(DmFundoComum.QryVerificaTipoOper);
         with DmFundoComum.QryVerificaTipoOper do
         begin
            ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvest;
            ParamByName('IDTIPOOPERACAO').AsInteger := -30;
            Open;
            If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo,
                                         iTipoInvest,
                                         -30,
                                         iCarteira,
                                         iTipoFundoInvest,
                                         iIdForCli, 0,
                                         iPlano, iPlanilha, iDocumento,
                                         fVlrIR,
                                         dDataOper, dDataOper,
                                         sNatureza, 'OPE',
                                         sDescFundo,
                                         FieldByName('FLGCONTAINVEST').AsInteger) Then
            begin
               Result := false;
               Close;
               Exit;
            end;
            Close;
         end;
      End;
      Result := True;
   Except
      MsgDlg('Não foi possível gravar o Imposto de Renda do Valor excedente da Amortização!','Mensagem do Sistema',mtInformation ,[mbOk],0);
      Result := False;
   End;
End;

//Al_89

//Alt_27
function LocalizaCampoFundo(iIdTipoFundoInvest: Integer): String;
var CtrlFundos : TCtrlFundos;
    CdsTipoFundoInvest : TClientDataSet;
begin
  { case iIdTipoFundoInvest of
      1  : LocalizaCampoFundo:='FIB';
      2  : LocalizaCampoFundo:='FAC';
      3  : LocalizaCampoFundo:='FIF';
      4  : LocalizaCampoFundo:='FAO';
      5  : LocalizaCampoFundo:='FID';
      14 : LocalizaCampoFundo:='FPT';
//Al_106
      15 : LocalizaCampoFundo:='FIC';
//AL_146
      16 : LocalizaCampoFundo:='FIP';
//AL_205
      20 : LocalizaCampoFundo:='FMI';
   end;
      }

      CtrlFundos := TCtrlFundos.Create;
      CtrlFundos.InitializeAs(Padroes);

      CdsTipoFundoInvest     := TClientDataSet.Create(nil);

      CdsTipoFundoInvest.Data := CtrlFundos.ListTipoFundoInvest(-1, iIdTipoFundoInvest);

      case CdsTipoFundoInvest.FieldByName('IDTIPOINVEST').AsInteger of
          7  : LocalizaCampoFundo:='FIB';  //FUNDO IMOBILIARIO
          5  : LocalizaCampoFundo:='FAC';  //FAC OU FIF
          6  : LocalizaCampoFundo:='FAO';  //FUNDO DE ACOES OU FUNDO DE INV. EM PARTICIPAÇÃO
          9  : LocalizaCampoFundo:='FID';  //FIDC OU FIC DE FIDC
          10 : LocalizaCampoFundo:='FIP';  //Fundo de Participações OU Fundo Mútuo de Invest. em Empresas Emergentes
      end;

      FreeAndNil(CdsTipoFundoInvest);
end;

//Alt_34
function BloqueiaOperacaoSeAbertura: Boolean;
var bytContador: Byte;
    bolEstaEmAbertura: Boolean;
begin
   bolEstaEmAbertura := False;
   bytContador := 1;
   while bytContador < 15 do begin
      if VerEmAbertura(bytContador) = False then
         BloqueiaOperacaoSeAbertura := False
      else
      begin
         BloqueiaOperacaoSeAbertura := True;
         Break;
      end;
      if bytContador <> 5 then
         bytContador := bytContador + 1
      else
         bytContador := 14;
   end;
end;

//Alt_28
function VerEmAbertura(iIdTipoFundoInvest: Integer): Boolean;
var qry: TwwQuery;
    strCampoFundo: String;
begin
   try
      try
         strCampoFundo := LocalizaCampoFundo(iIdTipoFundoInvest);
         qry := TwwQuery.Create(Application);
         qry.DatabaseName := 'BaseDados';
         //Al_106
         if Trim(strCampoFundo) <> '' then
         begin
            qry.SQL.Add('SELECT PA.FLGEMABERTURA'+strCampoFundo+', PE.NOME ');
            qry.SQL.Add('FROM PARAMINVEST PA, PESSOA PE ');
            qry.SQL.Add('WHERE PA.IDUSREMABERTURA'+strCampoFundo+' = PE.IDPESSOA(+)');
            qry.Open;
            Result := (qry.FieldByName('FLGEMABERTURA'+strCampoFundo).AsString = 'S');
            if Result then
               MsgDlg('O Sistema está sendo processado por ' + #13 +
                      qry.FieldByName('NOME').AsString + #13 +
                      'Nenhuma outra ação pode ser executada.',
                      'Mensagem do Sistema', mtWarning, [mbOK], 0);
         end;
      except
         Result := True;
         MsgDlg('Não foi possível verificar se o Sistema está em Abertura, '#13+
                'nenhuma outra ação pode ser executada.', 'Mensagem do Sistema', mtWarning, [mbOK], 0);
      end;
   finally
      qry.Free;
   end;
end;

//AL_29
function GravaEmAbertura(iIdTipoFundoInvest: Integer; sFlag: String = 'S'): Boolean;
var qry: TwwQuery;
    i: Integer;
    bComita: Boolean;
    strCampoFundo: String;
begin
   Result := False;
   bComita := False;
   i := 1;
   try
      if not DtmBaseDados.dbBaseDados.InTransaction Then
      begin
         DtmBaseDados.dbBaseDados.StartTransaction;
         bComita := True;
      end;

      // Tenta gravar o parametro no máximo 10 vezes até conseguir
      while (not Result) and (i <= 10) do
      begin
         try
            strCampoFundo := LocalizaCampoFundo(iIdTipoFundoInvest);
            //AL_104
            if trim(strCampoFundo) <> '' then
            begin
               qry := TwwQuery.Create(Application);
               qry.DatabaseName := 'BaseDados';
               qry.SQL.Add('UPDATE PARAMINVEST SET FLGEMABERTURA'+strCampoFundo+' = ' + QuotedStr(sFlag) +
                           ', IDUSREMABERTURA'+strCampoFundo+' = ' +
                           OperComum.IIF(sFlag = 'S',QuotedStr(IntToStr(Sistema.IdUsuario)),'NULL'));
               qry.ExecSQL;
            end
            else
            begin
               MsgDlg('Não foi possível identificar o parâmetro de controle de exclusividade de processo,'+#13+
                      'para esse tipo de fundo.','Mensagem do Sistema ', mtWarning, [mbOK], 0)
            end;
            Result := True;
         except
            Result := False;
         end;
         Inc(i);
      end;
      if bComita then
      begin
         try
            DtmBaseDados.dbBaseDados.Commit;
         except
            Result := False;
         end;
      end;
   finally
      if not Result then
      begin
         if sFlag = 'S' then
            MsgDlg('Não foi possível obter exclusividade de processo.',
                   'Mensagem do Sistema ', mtWarning, [mbOK], 0)
         else
            MsgDlg('Não foi possível liberar a exclusividade de processo.',
                   'Mensagem do Sistema ', mtWarning, [mbOK], 0);
      end;
      qry.Free;
   end;
end;

//Alt_33
function ZeraCotaCartGerencRF(wDtMov : TDateTime) : Boolean;
var
   QryAux   : TwwQuery;
   dDataRef : TDateTime;
begin
   Result := True;

   if wDtMov = 0 then
      Exit;

   dDataRef := wDtMov;

   //Al_44
   if dDataRef <= (pRPI.DATAULTFECH-60) then
      dDataRef := (pRPI.DATAULTFECH-60)+1;

   QryAux := TwwQuery.Create(Application);
   QryAux.DatabaseName := 'BaseDados';

   QryAux.Close;
   QryAux.SQL.Clear;
   QryAux.SQL.Text := 'DELETE FROM HISTCOTA WHERE (DATAHISTCOTA >= TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))';
   try
      QryAux.ExecSQL;
   except
      Result := False;
   end;

   QryAux.Close;
   QryAux.Free;
end;

//Al_97
//Al_69
//Al_64
Function GravaHistCotaIntegraliza(iIdTipoInvest, iIdFundoInvest, iIdTipoCota, iPlano, iPlanilha,
                                  iIdCotaIntegraliza, iIdPlanPrevCtbPatr, iIdOperacaoFundo : Integer;
                                  dDataHistCotaInteg, dDataAplicacao : TDateTime;
                                  fVlrHistCotaIntegr, fQtdHistCotaIntegr, fQtdMovCotaIntegr,
                                  fVlrCotaIntegr, fVlrVariacaoDia : Double;
                                  sTipoMov : String) : Boolean;
begin                                                 
   with DmFundoComum.QryInsHistCotaIntegraliza do
   begin
      Try
         OperComum.LimpaParametros(DmFundoComum.QryInsHistCotaIntegraliza);
         ParamByName('IDHISTCOTAINTEGR').AsInteger    := LeUltRegistro(nil, 'HISTCOTAINTEGRALIZA');
         //Al_97
         If iIdCotaIntegraliza > 0 then
            ParamByName('IDCOTAINTEGRALIZA').AsInteger:= iIdCotaIntegraliza;
         ParamByName('IDTIPOINVEST').AsInteger        := iIdTipoInvest;
         ParamByName('IDFUNDOINVEST').AsInteger       := iIdFundoInvest;
         If iIdTipoCota > 0 then
            ParamByName('IDTIPOCOTA').AsInteger       := iIdTipoCota;
         ParamByName('DATAHISTCOTAINTEG').AsDateTime  := dDataHistCotaInteg;
         ParamByName('VLRHISTCOTAINTEGR').AsFloat     := fVlrHistCotaIntegr;
         ParamByName('QTDHISTCOTAINTEGR').AsFloat     := fQtdHistCotaIntegr;
         ParamByName('QTDMOVCOTAINTEGR').AsFloat      := fQtdMovCotaIntegr;
         ParamByName('VLRCOTAINTEGR').AsFloat         := fVlrCotaIntegr;
         ParamByName('VLRVARIACAODIA').AsFloat        := fVlrVariacaoDia;
         If iPlano > 0 then
            ParamByName('PLANO').AsInteger            := iPlano;
         If iPlanilha > 0 then
            ParamByName('PLNCODIGO').AsInteger        := iPlanilha;
         ParamByName('IDPLANPREVCTBPATR').AsInteger   := iIdPlanPrevCtbPatr;
         ParamByName('TIPMOVCOTAINTEGR').AsString     := sTipoMov;
         //Al_97
         if iIdOperacaoFundo > 0 then
            ParamByName('IDOPERACAOFUNDO').AsInteger  := iIdOperacaoFundo;
         if dDataAplicacao > 0 then
            ParamByName('DATAAPLICACAO').AsDateTime   := dDataAplicacao;
         ExecSql;
         Close;
         Result := True;
      Except
         On E:Exception Do
         Begin
            MsgDlg('Ocorreu um problema na gravação do Histórico de Integralização de Cotas :'+#13+
                   E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         End;
      End;
      Close;
   end;
end;

//Al_70
//Al_65
function AtualizaHistCotaIntegr(dDataOper : TDateTime;
                                iTipoCota, iTipoInvest, iTipoFundoInvest, iFundoInvest,
                                iIdPlanPrevCtbPatr : Integer; bForm : Boolean) : Boolean;
var
    //Al_97
    fVlrVariacaoDia  : Currency;
    fVlrCotaDia, fVlrCotaDiaAnt, fVlrHistCotaIntegr : Double;
    iSegmentacao, iPlano, iPlanilha, iDocumento, iTipoOperacao    : Integer;
    sTipoTitulo, sSql, sComplemento  : String;
    dDataAnterior, dDataProcesso : TDateTime;
begin
   iPlano             := -1;
   iPlanilha          := -1;
   iDocumento         := -1;

   iSegmentacao := OperComum.RetornaSegmentacaoFdos(iTipoFundoInvest, iFundoInvest);  //Renan CGPC28

   with DmFundoComum do
   begin
      Try
         //AL_166
         OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
         OperComum.LimpaParametros(DmFundoComum.QryAtuHistCotaInteg);
         if iIdPlanPrevCtbPatr > 0 then
            QryAtuHistCotaInteg.ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanPrevCtbPatr;
         if iTipoFundoInvest > 0 then
            QryAtuHistCotaInteg.ParamByName('IDTIPOFUNDOINVEST').AsInteger := iTipoFundoInvest;
         if iFundoInvest > 0 then
            QryAtuHistCotaInteg.ParamByName('IDFUNDOINVEST').AsInteger     := iFundoInvest;
         if iTipoCota > 0 then
            QryAtuHistCotaInteg.ParamByName('IDTIPOCOTA').AsInteger        := iTipoCota;
         QryAtuHistCotaInteg.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvest;
         QryAtuHistCotaInteg.ParamByName('DATAHISTCOTAINTEG').AsString     := DateToStr(dDataOper);
         QryAtuHistCotaInteg.Open;

         if bForm then
         begin
            frmFechtoFundos.prbAtualizaFundos.Max := 0;
            frmFechtoFundos.prbAtualizaFundos.StepIt;
            frmFechtoFundos.prbAtualizaFundos.Max := QryAtuHistCotaInteg.RecordCount*2;
         end;

         While Not QryAtuHistCotaInteg.Eof do
         begin
            if bForm then
            begin
               frmFechtoFundos.lblDescFundo.Caption := QryAtuHistCotaInteg.FieldByName('DESCFUNDOINVEST').AsString;
               frmFechtoFundos.lblDescFundo.Repaint;
            end;

            //Al_97
            dDataProcesso    := QryAtuHistCotaInteg.FieldByName('DATAHISTCOTAINTEG').AsDateTime;
            If dDataProcesso <  dDataOper then
               dDataProcesso := dDataProcesso + 1;

            //AL_105
            if dDataProcesso <= QryAtuHistCotaInteg.FieldByName('DATAINICIOFUNDO').AsDateTime then
               dDataProcesso := QryAtuHistCotaInteg.FieldByName('DATAINICIOFUNDO').AsDateTime + 1;

            If (iTipoFundoInvest <> 1) Then //Fundo Imobiliário é contabilizado fim de semana
            begin
                While not DiasUteisInv.DiaUtil(dDataProcesso,-1,1,'',True,False,False) Do
                   dDataProcesso := dDataProcesso + 1;
            end;
            //Trazer a atualização atê a data atual
            While dDataProcesso <= dDataOper Do
            Begin
               //Al_165
               If (((QryAtuHistCotaInteg.FieldByName('QTDMOVCOTAINTEGR').AsFloat > 0) And
                   (QryAtuHistCotaInteg.FieldByName('DATAHISTCOTAINTEG').AsDateTime < dDataProcesso)) Or
                    (QryAtuHistCotaInteg.FieldByName('QTDMOVCOTAINTEGR').AsFloat = 0) Or
                    (QryAtuHistCotaInteg.FieldByName('TIPMOVCOTAINTEGR').AsString = 'TRP')) then
               begin
                  if (QryAtuHistCotaInteg.FieldByName('IDTIPOCOTA').AsInteger <>
                      qryCotaIntegrFundo.ParamByName('IDTIPOCOTA').AsInteger) or
                     (qryCotaIntegrFundo.ParamByName('IDFUNDOINVEST').AsInteger <>
                      QryAtuHistCotaInteg.FieldByName('IDFUNDOINVEST').AsInteger) or
                     (qryCotaIntegrFundo.ParamByName('DATACOTA').AsString <> DateToStr(dDataProcesso)) then
                  begin
                     dDataAnterior := dDataProcesso - 1;
                     If (iTipoFundoInvest <> 1) Then //Fundo Imobiliário é contabilizado fim de semana
                     begin
                         While not DiasUteisInv.DiaUtil(dDataAnterior,-1,1,'',True,False,False) Do
                            dDataAnterior := dDataAnterior - 1;
                     end;

                     //AL_166
                     OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
                     if QryAtuHistCotaInteg.FieldByName('IDTIPOCOTA').AsInteger > 0 then
                        qryCotaIntegrFundo.ParamByName('IDTIPOCOTA').AsInteger     :=
                                           QryAtuHistCotaInteg.FieldByName('IDTIPOCOTA').AsInteger;
                     qryCotaIntegrFundo.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                           QryAtuHistCotaInteg.FieldByName('IDFUNDOINVEST').AsInteger;
                     qryCotaIntegrFundo.ParamByName('DATACOTA').AsString  := DateToStr(dDataAnterior);
                     qryCotaIntegrFundo.Open;

                     fVlrCotaDiaAnt := qryCotaIntegrFundo.FieldByName('VLRCOTA').AsFloat;

                     //AL_166
                     OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
                     if QryAtuHistCotaInteg.FieldByName('IDTIPOCOTA').AsInteger > 0 then
                        qryCotaIntegrFundo.ParamByName('IDTIPOCOTA').AsInteger     :=
                                           QryAtuHistCotaInteg.FieldByName('IDTIPOCOTA').AsInteger;
                     qryCotaIntegrFundo.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                           QryAtuHistCotaInteg.FieldByName('IDFUNDOINVEST').AsInteger;
                     qryCotaIntegrFundo.ParamByName('DATACOTA').AsString  := DateToStr(dDataProcesso);
                     qryCotaIntegrFundo.Open;

                     fVlrCotaDia    := qryCotaIntegrFundo.FieldByName('VLRCOTA').AsFloat;

                  end;

                  fVlrHistCotaIntegr := OperComum.Round((QryAtuHistCotaInteg.FieldByName('QTDHISTCOTAINTEGR').AsFloat*
                                                        fVlrCotaDia),2);

                  fVlrVariacaoDia    := fVlrHistCotaIntegr -
                                                OperComum.Round((QryAtuHistCotaInteg.FieldByName('QTDHISTCOTAINTEGR').AsFloat*
                                                                 fVlrCotaDiaAnt),2);

                  If fVlrVariacaoDia  < 0 Then
                     iTipoOperacao   := -121  //Atualização de Cotas a Integralizar - Passivo(+)
                  else
                     iTipoOperacao   := -120; //Atualização de Cotas a Integralizar - Passivo(-)

                  //AL_157
                  if not BuscaTipoTitulo(iTipoFundoInvest, iTipoInvest, QryAtuHistCotaInteg.FieldByName('DESCTIPOFUNDOINV').AsString,
                                         sTipoTitulo, sComplemento) then
                     Raise Exception.Create('Não foi possível determinar o Tipo de Título para contabilização');

                  iPlano          := -1;
                  iPlanilha       := -1;
                  iDocumento      := -1;

                  if not dtmBaseDados.dbBaseDados.InTransaction then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  If fVlrVariacaoDia <> 0 Then
                  begin
                     If Not ContabilizaAtualizacao(iSegmentacao, iTipoOperacao, Sistema.IdEmpresa, Sistema.IdModulo,
                                                   QryAtuHistCotaInteg.FieldByName('IDTIPOINVEST').AsInteger,
                                                   QryAtuHistCotaInteg.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                   -1{iForCli},
                                                   QryAtuHistCotaInteg.FieldByName('IDPLANOPREV').AsInteger,
                                                   QryAtuHistCotaInteg.FieldByName('IDPATRO').AsInteger,
                                                   ABS(fVlrVariacaoDia),
                                                   sTipoTitulo,
                                                   Trim(QryAtuHistCotaInteg.FieldByName('DESCTIPOFUNDOINV').AsString)+' - '+
                                                   Trim(QryAtuHistCotaInteg.FieldByName('DESCFUNDOINVEST').AsString)+' / '+
                                                   Trim(QryAtuHistCotaInteg.FieldByName('PLANPRVCONTABPATRO').AsString),
                                                   dDataProcesso, True, iPlano, iPlanilha, iDocumento) Then
                        Raise Exception.Create('O processo será Cancelado.');

                     //Al_80
                     If fVlrVariacaoDia  < 0 Then
                        iTipoOperacao   := -123  //Atualização de Cotas a Integralizar - Ativo(-)
                     else
                        iTipoOperacao   := -122; //Atualização de Cotas a Integralizar - Ativo(+)

                     If Not ContabilizaAtualizacao(iSegmentacao, iTipoOperacao, Sistema.IdEmpresa, Sistema.IdModulo,
                                                   QryAtuHistCotaInteg.FieldByName('IDTIPOINVEST').AsInteger,
                                                   QryAtuHistCotaInteg.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                   -1,
                                                   QryAtuHistCotaInteg.FieldByName('IDPLANOPREV').AsInteger,
                                                   QryAtuHistCotaInteg.FieldByName('IDPATRO').AsInteger,
                                                   ABS(fVlrVariacaoDia),
                                                   sTipoTitulo,
                                                   Trim(QryAtuHistCotaInteg.FieldByName('DESCTIPOFUNDOINV').AsString)+' - '+
                                                   Trim(QryAtuHistCotaInteg.FieldByName('DESCFUNDOINVEST').AsString)+' / '+
                                                   Trim(QryAtuHistCotaInteg.FieldByName('PLANPRVCONTABPATRO').AsString),
                                                   dDataProcesso, True, iPlano, iPlanilha, iDocumento) Then
                        Raise Exception.Create('O processo será Cancelado.');
                  end;

                  //Al_166
                  //Al_97
                  OperComum.LimpaParametros(DmFundoComum.QryBuscaRegHistCotaInteg);
                  QryBuscaRegHistCotaInteg.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvest; //Renan SOL 130444 Kintana 733394.
                  QryBuscaRegHistCotaInteg.ParamByName('DATAHISTCOTAINTEG').AsString  := DateToStr(dDataProcesso);
                  QryBuscaRegHistCotaInteg.ParamByName('IDOPERACAOFUNDO').AsInteger :=
                                           QryAtuHistCotaInteg.FieldByName('IDOPERACAOFUNDO').AsInteger;
                  QryBuscaRegHistCotaInteg.Open;

                  if QryBuscaRegHistCotaInteg.IsEmpty then
                  begin
                     //Al_97
                     if not GravaHistCotaIntegraliza(
                            QryAtuHistCotaInteg.FieldByName('IDTIPOINVEST').AsInteger,
                            QryAtuHistCotaInteg.FieldByName('IDFUNDOINVEST').AsInteger,
                            QryAtuHistCotaInteg.FieldByName('IDTIPOCOTA').AsInteger,
                            iPlano, iPlanilha, -1,
                            QryAtuHistCotaInteg.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                            QryAtuHistCotaInteg.FieldByName('IDOPERACAOFUNDO').AsInteger,
                            dDataProcesso,
                            QryAtuHistCotaInteg.FieldByName('DATAAPLICACAO').AsDateTime,
                            fVlrHistCotaIntegr,
                            QryAtuHistCotaInteg.FieldByName('QTDHISTCOTAINTEGR').AsFloat, 0,
                            fVlrCotaDia,
                            fVlrVariacaoDia, 'ATU') then
                        Raise Exception.Create('O processo será Cancelado.');
                  end
                  else
                  begin
                     //Al_79
                     sSql := 'UPDATE HISTCOTAINTEGRALIZA SET VLRCOTAINTEGR = ' +  TrocaVirgulaPonto(FloatToStr(qryCotaIntegrFundo.FieldByName('VLRCOTA').AsFloat))+','+
                             ' QTDHISTCOTAINTEGR = '+ TrocaVirgulaPonto(FloatToStr(QryAtuHistCotaInteg.FieldByName('QTDHISTCOTAINTEGR').AsFloat))+','+
                             ' VLRHISTCOTAINTEGR = '+ TrocaVirgulaPonto(FloatToStr(fVlrHistCotaIntegr))+','+
                             ' VLRVARIACAODIA    = '+ TrocaVirgulaPonto(FloatToStr(fVlrVariacaoDia))+',';

                     If (iPlano > 0) And (iPlanilha > 0) then
                        sSql := sSql + ' PLANO     = '+IntToStr(iPlano)+', PLNCODIGO = '+IntToStr(iPlanilha)
                     else
                        sSql := sSql + ' PLANO     = NULL, PLNCODIGO = NULL';

                     sSql := sSql + ' WHERE IDHISTCOTAINTEGR = ' + QryBuscaRegHistCotaInteg.FieldByName('IDHISTCOTAINTEGR').AsString;

                     ExecutaQuery(qryAux, sSql);

                  end;

                  dtmBaseDados.dbBaseDados.Commit;

               end;

               dDataProcesso := dDataProcesso  + 1;
               If (iTipoFundoInvest <> 1) Then //Fundo Imobiliário é contabilizado fim de semana
               begin
                   While not DiasUteisInv.DiaUtil(dDataProcesso,-1,1,'',True,False,False) Do
                      dDataProcesso := dDataProcesso  + 1;
               end;
            end;

            if bForm then
               frmFechtoFundos.prbAtualizaFundos.StepIt;

            QryAtuHistCotaInteg.Next;
         end;
         Result := True;
      Except
         On E:Exception Do
         Begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         End;
      end;

      if bForm then
      begin
         frmFechtoFundos.prbAtualizaFundos.Max := 0;
         frmFechtoFundos.prbAtualizaFundos.StepIt;
         frmFechtoFundos.lblDescFundo.Caption := '';
         frmFechtoFundos.lblDescFundo.Repaint;
      end;
      //AL_166
      OperComum.LimpaParametros(DmFundoComum.QryBuscaRegHistCotaInteg);
      OperComum.LimpaParametros(DmFundoComum.QryAtuHistCotaInteg);
      OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
   end;
end;
//Al_70

//Al_75
Function FluxoCotasIntegRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                             iTipoOperacao : Integer;
                             dDataProcesso : TDateTime;
                             bMostraMsg    : Boolean;
                             iTipoCota     : Integer = -1) : Boolean;
var fQtdSaldo : Double;
begin
   With DmFundoComum Do
   begin
      Try
         OperComum.LimpaParametros(QryBuscaRegCotaIntegraliza);
         QryBuscaRegCotaIntegraliza.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataProcesso);
         If iTipoCota > 0 Then
            QryBuscaRegCotaIntegraliza.ParamByName('IDTIPOCOTA').AsInteger     := iTipoCota;
         If iPlano > 0 Then
            QryBuscaRegCotaIntegraliza.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
         QryBuscaRegCotaIntegraliza.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvest;
         QryBuscaRegCotaIntegraliza.ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacao;
         QryBuscaRegCotaIntegraliza.ParamByName('IDFUNDOINVEST').AsInteger     := iFundoInvest;
         QryBuscaRegCotaIntegraliza.ParamByName('IDTIPOFUNDOINVEST').AsInteger := iTipoFundoInvest;
         QryBuscaRegCotaIntegraliza.Open;
         QryBuscaRegCotaIntegraliza.First;
         While Not QryBuscaRegCotaIntegraliza.Eof Do
         begin
            //Al_97
            If Not GravaHistCotaIntegraliza(iTipoInvest, iFundoInvest,
                                            QryBuscaRegCotaIntegraliza.FieldByName('IDTIPOCOTA').AsInteger,
                                            -1, -1, -1,
                                            QryBuscaRegCotaIntegraliza.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                            QryBuscaRegCotaIntegraliza.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                            dDataProcesso,
                                            QryBuscaRegCotaIntegraliza.FieldByName('DATAAPLICACAO').AsDateTime,
                                            QryBuscaRegCotaIntegraliza.FieldByNAme('VLROPERACAO').AsFloat+
                                               QryBuscaRegCotaIntegraliza.FieldByNAme('VLRDESCONTO').AsFloat,
                                            QryBuscaRegCotaIntegraliza.FieldByName('QTDOPERACAO').AsFloat,
                                            QryBuscaRegCotaIntegraliza.FieldByName('QTDOPERACAO').AsFloat,
                                            QryBuscaRegCotaIntegraliza.FieldByName('VLRCOTA').AsFloat, 0, 'OPE') then
               Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização de Cotas.');

            //Al_166
            OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
            if iTipoCota > 0 then
               qryCotaIntegrFundo.ParamByName('IDTIPOCOTA').AsInteger  := iTipoCota;
            qryCotaIntegrFundo.ParamByName('IDFUNDOINVEST').AsInteger  := iFundoInvest;
            qryCotaIntegrFundo.ParamByName('DATACOTA').AsString        := DateToStr(dDataProcesso);
            qryCotaIntegrFundo.Open;

            //Al_97
            OperComum.LimpaParametros(QryCotasIntegraliza);
            QryCotasIntegraliza.ParamByName('IDOPERACAOFUNDO').AsInteger :=
                               QryBuscaRegCotaIntegraliza.FieldByName('IDOPERACAOORIGEM').AsInteger;
            QryCotasIntegraliza.ParamByName('DATAHISTCOTAINTEG').AsString  := DateToStr(dDataProcesso);
            QryCotasIntegraliza.Open;

            fQtdSaldo := QryCotasIntegraliza.FieldByName('QTDHISTCOTAINTEGR').AsFloat-
                          QryBuscaRegCotaIntegraliza.FieldByName('QTDOPERACAO').AsFloat;
            If fQtdSaldo < 0 then
               fQtdSaldo := 0;

            //Al_97
            If Not GravaHistCotaIntegraliza(iTipoInvest, iFundoInvest,
                                            QryBuscaRegCotaIntegraliza.FieldByName('IDTIPOCOTA').AsInteger,
                                             -1, -1, -1,
                                            QryBuscaRegCotaIntegraliza.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                            QryBuscaRegCotaIntegraliza.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                            dDataProcesso,
                                            QryBuscaRegCotaIntegraliza.FieldByName('DATAAPLICACAO').AsDateTime,
                                            OperComum.Round((fQtdSaldo)*qryCotaIntegrFundo.FieldByName('VLRCOTA').AsFloat,2),
                                            fQtdSaldo,
                                            QryBuscaRegCotaIntegraliza.FieldByName('QTDOPERACAO').AsFloat,
                                            qryCotaIntegrFundo.FieldByName('VLRCOTA').AsFloat, 0, 'ATU') then
               Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização de Cotas.');

            QryBuscaRegCotaIntegraliza.Next;
         end;

         Result := True;
      Except
         //AL_135
         On E:Exception Do
         Begin
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

         Result := False;
         end;
      End;
      //Al_166
      OperComum.LimpaParametros(DmFundoComum.QryAux);
      OperComum.LimpaParametros(DmFundoComum.QryCotasIntegraliza);
      OperComum.LimpaParametros(DmFundoComum.QryBuscaRegCotaIntegraliza);
      OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
   end;
end;

Function SubscricaoCotasIntegRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano,
                                  iTipoOperacao : Integer;
                                  dDataProcesso : TDateTime;
                                  bMostraMsg    : Boolean;
                                  iTipoCota     : Integer = -1) : Boolean;
begin
   With DmFundoComum Do
   begin
      Try
         OperComum.LimpaParametros(QrySubscricaoCotasIntegRetr);
         If iTipoCota > 0 Then
            QrySubscricaoCotasIntegRetr.ParamByName('IDTIPOCOTA').AsInteger     := iTipoCota;
         If iPlano > 0 Then
            QrySubscricaoCotasIntegRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
         QrySubscricaoCotasIntegRetr.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataProcesso);
         QrySubscricaoCotasIntegRetr.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvest;
         QrySubscricaoCotasIntegRetr.ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacao;
         QrySubscricaoCotasIntegRetr.ParamByName('IDFUNDOINVEST').AsInteger     := iFundoInvest;
         QrySubscricaoCotasIntegRetr.ParamByName('IDTIPOFUNDOINVEST').AsInteger := iTipoFundoInvest;
         QrySubscricaoCotasIntegRetr.Open;

         QrySubscricaoCotasIntegRetr.First;
         While Not QrySubscricaoCotasIntegRetr.Eof Do
         begin
            //Al_97
            //Al_96
            If Not GravaHistCotaIntegraliza(iTipoInvest, iFundoInvest,
                                            QrySubscricaoCotasIntegRetr.FieldByName('IDTIPOCOTA').AsInteger,
                                            -1, -1, -1,
                                            QrySubscricaoCotasIntegRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                            QrySubscricaoCotasIntegRetr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                            QrySubscricaoCotasIntegRetr.FieldByNAme('DATAOPERACAO').AsDateTime,
                                            QrySubscricaoCotasIntegRetr.FieldByNAme('DATAOPERACAO').AsDateTime,
                                            QrySubscricaoCotasIntegRetr.FieldByNAme('VLROPERACAO').AsFloat,
                                            QrySubscricaoCotasIntegRetr.FieldByName('QTDOPERACAO').AsFloat,
                                            QrySubscricaoCotasIntegRetr.FieldByName('QTDOPERACAO').AsFloat,
                                            QrySubscricaoCotasIntegRetr.FieldByName('VLRCOTA').AsFloat, 0, 'OPE') then
               Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização '+#13+
                                      'com a operação de Subscrição.');
            //Al_97
            If Not GravaHistCotaIntegraliza(iTipoInvest, iFundoInvest,
                                            QrySubscricaoCotasIntegRetr.FieldByName('IDTIPOCOTA').AsInteger,
                                            -1, -1, -1,
                                            QrySubscricaoCotasIntegRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                            QrySubscricaoCotasIntegRetr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                            QrySubscricaoCotasIntegRetr.FieldByNAme('DATAOPERACAO').AsDateTime,
                                            QrySubscricaoCotasIntegRetr.FieldByNAme('DATAOPERACAO').AsDateTime,
                                            QrySubscricaoCotasIntegRetr.FieldByNAme('VLROPERACAO').AsFloat,
                                            QrySubscricaoCotasIntegRetr.FieldByName('QTDOPERACAO').AsFloat, 0,
                                            QrySubscricaoCotasIntegRetr.FieldByName('VLRCOTA').AsFloat, 0, 'ATU') then
               Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');

            QrySubscricaoCotasIntegRetr.Next;
         end;

         Result := True;
      Except
         //AL_135
         On E:Exception Do
         Begin
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

            Result := False;
         end;
      End;
      OperComum.LimpaParametros(DmFundoComum.QrySubscricaoCotasIntegRetr);
   end;
end;

//Al_86
function BloqueioCotas(iTipoInvest, iPedido, iTipoOperacao,
                       iCarteira, iFundo, iPlano  : Integer;
                       dDataCotz, dDataOper, dDataLiq, dDataAplic   : TDateTime;
                       fValorCota, fQtdOperacao   : Double;
                       iTipoCota    : Integer      = -1;
                       fraFrame     : TfraMensagem = Nil) : Boolean;
Var
  fValor, fQtdBloqueio, fNull, fSaldoQtd : Double;
  iIDOperacao     : Integer;
  sDescFundo      : String;
begin
   Result         := True;
   //AL_163
   try
      try
         iIDOperacao    := 0;
         fQtdBloqueio   := 0;

         If iCarteira    = 0 Then
            iCarteira   := -1;

         //AL_194
         //AL_116
         BuscaSaldoFundo(iFundo,iPlano, -1, dDataCotz ,fNull ,fNull , fNull, fNull, fNull,
                         fNull, fNull, fSaldoQtd, fNull, fNull, sDescFundo, iTipoCota);

         If fQtdOperacao > fSaldoQtd Then
            Raise Exception.Create('Saldo insuficiente para Bloqueio no dia '+DateToStr(dDataOper)+' !'#13+
                                   'Quantidade de Bloqueio  :   '+FloatToStrF(fQtdOperacao,ffNumber,22,12)+' '#13+
                                   'Saldo do fundo   :   ' + FloatToStrF(fSaldoQtd, ffNumber, 22,12)+' '#13+
                                   'Fundo : '+sDescFundo);
         With DmFundoComum Do
         Begin
            //AL_163
            OperComum.LimpaParametros(QryBuscaTipoOper);
            QryBuscaTipoOper.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvest;
            QryBuscaTipoOper.ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOperacao;
            QryBuscaTipoOper.Open;

            OperComum.LimpaParametros(QryResgateFACFIF);
            If iTipoCota > 0 Then
               QryResgateFACFIF.ParamByName('IDTIPOCOTA').AsInteger     := iTipoCota;
            QryResgateFACFIF.ParamByName('IDFUNDOINVEST').AsInteger     := iFundo;
            QryResgateFACFIF.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
            QryResgateFACFIF.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlano;
            QryResgateFACFIF.ParamByName('DATAMOVFUNDO').AsString       := DateToStr(dDataCotz);
            QryResgateFACFIF.Open;

            If fraFrame <> Nil Then
            begin
               fraFrame.Mostra;
               fraFrame.Max := QryResgateFACFIF.RecordCount;
            end;

            If fValorCota = 0 Then
            Begin
               OperComum.LimpaParametros(QryVlrCota);
               QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger := iFundo;
               If iTipoCota > 0 Then
                  QryVlrCota.ParamByName('IDTIPOCOTA').AsInteger := iTipoCota;
               QryVlrCota.ParamByName('DATACOTA').AsDateTime     := dDataCotz;
               QryVlrCota.Open;
               fValorCota := QryVlrCota.FieldByName('VLRCOTA').AsFloat;
               OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
            End;

            While Not QryResgateFACFIF.EOF Do
            Begin
               If (fQtdOperacao > 0) Then
               Begin
                  If fraFrame <> Nil Then
                     fraFrame.Mes := 'Bloqueio - Aplicação : '+
                                      QryResgateFACFIF.FieldByName('DATAAPLICACAO').AsString;

                  //AL_163
                  If QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString = 'D' Then
                  begin
                     If ((fQtdOperacao+
                          QryResgateFACFIF.FieldByName('SALDOQTDCOTASBLQ').AsFloat) <=
                                  QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat) Then

                     begin
                        fQtdBloqueio := QryResgateFACFIF.FieldByName('SALDOQTDCOTASBLQ').AsFloat + fQtdOperacao;
                        fQtdOperacao := 0;
                     end
                     else If ((fQtdOperacao+
                               QryResgateFACFIF.FieldByName('SALDOQTDCOTASBLQ').AsFloat) >
                                         QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat) Then
                     begin
                        fQtdBloqueio   := QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat;
                        fQtdOperacao   := fQtdOperacao - QryResgateFACFIF.FieldByName('SALDOQTDCOTAS').AsFloat;
                     end;
                  end
                  Else If QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString = 'A' Then
                  begin
                     If (QryResgateFACFIF.FieldByName('SALDOQTDCOTASBLQ').AsFloat < fQtdOperacao) Then
                     begin
                        fQtdBloqueio := fQtdOperacao;
                        fQtdOperacao := fQtdOperacao - QryResgateFACFIF.FieldByName('SALDOQTDCOTASBLQ').AsFloat;
                     end
                     else If (QryResgateFACFIF.FieldByName('SALDOQTDCOTASBLQ').AsFloat >= fQtdOperacao) Then
                     begin
                        fQtdBloqueio   := fQtdOperacao;
                        fQtdOperacao   := 0;
                     end;
                  end;

                  iIDOperacao := 0;

                  If Not GravaOperacaoFundo(QryResgateFACFIF.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                            iTipoInvest, iPedido, iTipoOperacao, iCarteira, iFundo,
                                            -1, iPlano,
                                            dDataCotz, dDataLiq, dDataOper,
                                            OperComum.Round(fQtdBloqueio*fValorCota,2),
                                            0, 0, 0,
                                            fQtdBloqueio, fValorCota, iIDOperacao, iTipoCota) Then
                  Begin
                     If fraFrame <> Nil Then
                        fraFrame.Apaga;
                     Result := False;
                     Exit;
                  End;

                  Result := True;
               End
               Else If fQtdBloqueio <> 0 Then
               Begin
                  If fraFrame <> Nil Then
                     fraFrame.Apaga;
                  Result := True;
                  Exit;
               End
               Else If fQtdBloqueio  = 0 Then
               Begin
                  If fraFrame <> Nil Then
                     fraFrame.Apaga;
                  Result := False;
                  Exit;
               End
               Else
                  Result := True;

               If fraFrame <> Nil Then
                  fraFrame.Incrementa;

               QryResgateFACFIF.Next;
            End;
            OperComum.LimpaParametros(DmFundoComum.QryResgateFACFIF);
         End;

         If fraFrame <> Nil Then
            fraFrame.Apaga;

      except
         On E:Exception Do
         Begin
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

            If fraFrame <> Nil Then
               fraFrame.Apaga;

            Result := False;
         end;
      end;
   finally
      OperComum.LimpaParametros(DmFundoComum.QryResgateFACFIF);
      OperComum.LimpaParametros(DmFundoComum.QryBuscaTipoOper);
      OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
   end;
end;

//Al_88
Function BloqueioCotasRetr(iTipoInvest, iTipoFundoInvest, iFundoInvest, iPlano : Integer;
                           dDataProcesso : TDateTime;
                           bMostraMsg    : Boolean;
                           iTipoCota     : Integer = -1) : Boolean;
//Al_126
var sMens: String;
begin
   With DmFundoComum Do
   begin
      try
         OperComum.LimpaParametros(DmFundoComum.QryBloqueioCotasRetr);
         //Ricardo Cristiano - 11/01/2010 - N. Sol 129463 -  N. Kintana 709981
         QryBloqueioCotasRetr.ParamByName('DATAPEDIDO').AsString             := DateToStr(dDataProcesso);
         QryBloqueioCotasRetr.ParamByName('IDTIPOINVEST').AsInteger          := iTipoInvest;
         If iTipoCota > 0 Then
            QryBloqueioCotasRetr.ParamByName('IDTIPOCOTA').AsInteger         := iTipoCota;
         QryBloqueioCotasRetr.ParamByName('IDFUNDOINVEST').AsInteger         := iFundoInvest;
         If iPlano    > 0 Then
            QryBloqueioCotasRetr.ParamByName('IDPLANPREVCTBPATR').AsInteger  := iPlano;
         //Ricardo Cristiano - 11/01/2010 - N. Sol 129463 -  N. Kintana 709981            
         QryBloqueioCotasRetr.ParamByName('IDTIPOFUNDOINVEST').AsInteger     := iTipoFundoInvest;            
         QryBloqueioCotasRetr.Open;
         QryBloqueioCotasRetr.First;
         //Al_126
         While Not QryBloqueioCotasRetr.Eof Do
         Begin
            If Not BloqueioCotas(QryBloqueioCotasRetr.FieldByName('IDTIPOINVEST').AsInteger,
                                 QryBloqueioCotasRetr.FieldByName('IDPEDIDOFUNDO').AsInteger,
                                 QryBloqueioCotasRetr.FieldByName('IDTIPOOPERACAO').AsInteger,
                                 QryBloqueioCotasRetr.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                 QryBloqueioCotasRetr.FieldByName('IDFUNDOINVEST').AsInteger,
                                 QryBloqueioCotasRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                 QryBloqueioCotasRetr.FieldByName('DATACOTIZACAO').AsDateTime,
                                 QryBloqueioCotasRetr.FieldByName('DATAPEDIDO').AsDateTime,
                                 QryBloqueioCotasRetr.FieldByName('DATALIQUIDACAO').AsDateTime,
                                 0,
                                 QryBloqueioCotasRetr.FieldByName('VLRCOTA').AsFloat,
                                 QryBloqueioCotasRetr.FieldByName('QTDBLQPEDIDO').AsFloat) Then
            Begin
               If bMostraMsg Then
                  Raise Exception.Create('Ocorreu um problema no Bloqueio / Desbloqueio de Cotas do Fundo : '+#13+
                                         QryBloqueioCotasRetr.FieldByName('DESCFUNDOINVEST').AsString+#13+
                                         'Dia : '+QryBloqueioCotasRetr.FieldByName('DATAPEDIDO').AsString+#13+
                                         'o processo será cancelado.');
            End;

            OperComum.LimpaParametros(DmFundoComum.QryConfirmacao);
            If iTipoCota > 0 Then
               QryConfirmacao.ParamByName('IDTIPOCOTA').AsInteger     := iTipoCota;
            QryConfirmacao.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                       QryBloqueioCotasRetr.FieldByName('IDFUNDOINVEST').AsInteger;
            QryConfirmacao.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                                       QryBloqueioCotasRetr.FieldByName('IDTIPOOPERACAO').AsInteger;
            QryConfirmacao.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataProcesso);
            QryConfirmacao.ParamByName('DATACOTIZACAO').AsString      :=
                                       QryBloqueioCotasRetr.FieldByName('DATACOTIZACAO').AsString;
            QryConfirmacao.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                       QryBloqueioCotasRetr.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            QryConfirmacao.ParamByName('IDPEDIDOFUNDO').AsInteger     :=
                                       QryBloqueioCotasRetr.FieldByName('IDPEDIDOFUNDO').AsInteger;
            QryConfirmacao.Open;

            While Not QryConfirmacao.Eof Do
            Begin
               //AL_162
               //Al_126
               If Not AlimentaFundo(QryConfirmacao.FieldByName('IDTIPOINVEST').AsInteger,
                                    QryConfirmacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                    QryConfirmacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    QryConfirmacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                    QryConfirmacao.FieldByName('IDPLANOPREV').AsInteger,
                                    iPatrocinadora,
                                    QryConfirmacao.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                    QryConfirmacao.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                    QryConfirmacao.FieldByName('QTDDECQTD').AsInteger,
                                    QryConfirmacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                    -1,
                                    QryConfirmacao.FieldByName('DATAOPERACAO').AsDateTime,
                                    QryConfirmacao.FieldByName('DATACOTIZACAO').AsDateTime,
                                    QryConfirmacao.FieldByName('DATALIQUIDACAO').AsDateTime,
                                    QryConfirmacao.FieldByName('QTDOPERACAO').AsFloat,
                                    QryConfirmacao.FieldByName('VLRCOTA').AsFloat,
                                    QryConfirmacao.FieldByName('VLRLIQUIDO').AsFloat,
                                    QryConfirmacao.FieldByName('VLRIR').AsFloat,
                                    QryConfirmacao.FieldByName('VLRIOF').AsFloat,
                                    QryConfirmacao.FieldByName('NATUREZAOPERACAO').AsString,
                                    QryConfirmacao.FieldByName('DESCTIPOOPERACAO').AsString+
                                       ' / '+QryConfirmacao.FieldByName('DESCFUNDOINVEST').AsString,
                                    'BLQ', True,
                                    QryConfirmacao.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                    -1, -1,
                                    QryConfirmacao.FieldByName('VLRRENDIMENTO').AsFloat, sMens,
                                    iTipoCota) Then
               Begin
                  If bMostraMsg Then
                  begin
                     if sMens <> '' then
                        Raise Exception.Create('Não foi possível confirmar a operação de Bloqueio / Desbloqueio de Cotas' + #13 +
                                               'Fundo: ' + QryConfirmacao.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                                               'Data : '+ QryConfirmacao.FieldByName('DATAOPERACAO').AsString + #13 +
                                               'Mensagem: ' + sMens)
                     else
                        Raise Exception.Create('Não foi possível confirmar a operação de Bloqueio / Desbloqueio de Cotas' + #13 +
                                               'Fundo: ' + QryConfirmacao.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                                               'Data : ' + QryConfirmacao.FieldByName('DATAOPERACAO').AsString + #13 +
                                               'Ocorreu um problema ao gravar esta operação' + #13 +
                                               'Tente mais tarde');
                  end;
               End;
               QryConfirmacao.Next;
            End;

            QryBloqueioCotasRetr.Next;
         End;

         Result := True;
      except
         On E:Exception Do
         Begin
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         end;
      end;
      OperComum.LimpaParametros(DmFundoComum.QryConfirmacao);
      OperComum.LimpaParametros(DmFundoComum.QryBloqueioCotasRetr);
   End;
end;

//AL_198 Retirado
//AL_150

function BuscaTipoTitulo(iTpFundo, iTpInvest: Integer; sTipoFundo: String;
                         var sTipoTitulo, sComplemento: String): Boolean;
begin
   try
      Result := False;
      //Renan Cristiano Sol 129607 | Kintana 717461 Inicio.
      sTipoFundo := UPPERCASE(sTipoFundo);
      //Renan Cristiano Sol 129607 | Kintana 717461 Fim.
      if (iTpInvest <> -1) and (sTipoFundo = '') then
      begin
         OperComum.LimpaParametros(dmFundoComum.QryTipoFundos);
         dmFundoComum.QryTipoFundos.ParamByName('IDTIPOINVEST').AsInteger := iTpInvest;
         dmFundoComum.QryTipoFundos.ParamByName('IDTIPOFUNDOINVEST').AsInteger := iTpFundo;
         dmFundoComum.QryTipoFundos.Open;
         sTipoFundo := UpperCase(dmFundoComum.QryTipoFundos.FieldByName('DESCTIPOFUNDOINV').AsString);
         sComplemento := dmFundoComum.QryTipoFundos.FieldByName('DESCTIPOFUNDOINV').AsString;
      end;

      if ((iTpInvest = 5) and (Pos('FAC', sTipoFundo) > 0) ) then
         sTipoTitulo := 'FRFAC'  //FUNDO DE APLICAÇÕES EM COTAS
      else
      if ((iTpInvest = 5) and (Pos('FAQ', sTipoFundo) > 0) ) then
         sTipoTitulo := 'FRFAQ'  //FUNDO DE APLICAÇÕES EM QUOTAS
      else
      if ((iTpInvest = 5) and (Pos('FIF', sTipoFundo) > 0) ) then
         sTipoTitulo := 'FRFIF'  //FUNDO DE INVESTIMENTOS EM FUNDOS
      else
      if ((iTpInvest = 6) and ((POS('ACO', sTipoFundo) > 0) or (POS('AÇÕ', sTipoFundo) > 0)) ) then
         sTipoTitulo := 'FRVAR'  //FUNDO DE ACOES
      else
      if ((iTpInvest = 6) and (Pos('PART', sTipoFundo) > 0) ) then
         sTipoTitulo := 'FRFIP'  //FUNDO DE INVESTIMENTO EM PARTICIPACOES
      else
      if (iTpInvest = 7) then
         sTipoTitulo := 'FIMOB'  //FUNDO DE INVESTIMENTO IMOBILIARIO
      else
      if ((iTpInvest = 9) and (Pos('FIC', sTipoFundo) > 0) ) then
         sTipoTitulo := 'FICDC'  //FUNDO DE INVESTIMENTOS EM COTAS DE FIDC
      else
      if ((iTpInvest = 9) and (Pos('FIDC', sTipoFundo) > 0) ) then
         sTipoTitulo := 'FFIDC'  //FUNDO DE INVESTIMENTOS EM DIREITO CREDITORIOS
      else
//AL_205
      if ((iTpInvest = 10) and (Pos('PART', sTipoFundo) > 0) ) then
         sTipoTitulo := 'FRFPA'  //FUNDO DE PARTICIPACOES
      else
      if ((iTpInvest = 10) and (Pos('PART', sTipoFundo) = 0) ) then
         sTipoTitulo := 'FMIEE'; //FUNDO MUTUO DE INVEST. EM EMPRESAS EMERGENTES

      Result := True;
   finally
      if (iTpInvest <> -1) and (sTipoFundo = '') then
         OperComum.LimpaParametros(dmFundoComum.QryTipoFundos);
   end;
end;

//AL_161
function IntegraPenhoraJuridico(dDataIni, dDataFim : TDateTime;
                                iFlgInvLido : Integer;
                                iTipoInvest : Integer = -1;
                                iPlanPrev  : Integer = -1;
                                iInvestimento : Integer = -1;
                                iOperAplic : Integer = -1;
                                iFundoInvest : integer = -1;
                                iTipoCota : integer = 0) : Boolean;
var
   CdsListPenhoraJuridico, CdsOperBloqueioFdo, CdsCotaFundo : TClientDataSet;
   CdsHistFundoInvest, CdsPlanPatro, CdsTipoFundoInvest : TClientDataSet;
   FDbPedidoFundo : TDbPedidoFundo;
   CtrlInvestimento : TCtrlInvestimento;
   CtrlFundos : TCtrlFundos;
   sNaturMov, sMens : string;
   fQtdCotas : Double;
   iIdForCli : Integer;
begin
   Try
      Result := True;
      CtrlInvestimento := TCtrlInvestimento.Create;
      CtrlInvestimento.InitializeAs(Padroes);
      CtrlFundos := TCtrlFundos.Create;
      CtrlFundos.InitializeAs(Padroes);

      CdsListPenhoraJuridico := TClientDataSet.Create(nil);
      CdsOperBloqueioFdo     := TClientDataSet.Create(nil);
      CdsCotaFundo           := TClientDataSet.Create(nil);
      CdsHistFundoInvest     := TClientDataSet.Create(nil);
      CdsPlanPatro           := TClientDataSet.Create(nil);
      CdsTipoFundoInvest     := TClientDataSet.Create(nil);
      FDbPedidoFundo         := TDbPedidoFundo.Create(nil);

      CdsListPenhoraJuridico.Data := CtrlInvestimento.ListPenhoraJurico(dDataIni, dDataFim ,
                                                                        iFlgInvLido, iTipoInvest, iTipoCota,
                                                                        iPlanPrev, iInvestimento, iOperAplic, iFundoInvest);
      if not CdsListPenhoraJuridico.IsEmpty then
      begin
         Try
            while not CdsListPenhoraJuridico.EOF do
            begin
               //AL_186
               if CdsListPenhoraJuridico.FieldByName('IDFUNDOINVEST').IsNull then
               begin
                  CdsListPenhoraJuridico.Next;
                  Continue;
               end;

               if not dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               // Penhora - Faz um Bloqueio de Saldo
               if CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat > 0 then
                  sNaturMov := 'D'
               // Desbloqueia
               else if CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat < 0 then
                  sNaturMov := 'A';

               CdsOperBloqueioFdo.Data := CtrlFundos.ListOperBloqueioFundo(CdsListPenhoraJuridico.FieldByName('FDOTIPOINVEST').AsInteger,
                                                                           sNaturMov);

               if not CdsOperBloqueioFdo.IsEmpty then
               begin
                  CdsCotaFundo.Data := CtrlFundos.ListCotaFundo(CdsListPenhoraJuridico.FieldByName('IDFUNDOINVEST').AsInteger,
                                                                CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime);

                  CdsHistFundoInvest.Data := CtrlFundos.ListHistFundoInvest(CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime,
                                                                            CdsListPenhoraJuridico.FieldByName('FDOTIPOINVEST').AsInteger,
                                                                            CdsListPenhoraJuridico.FieldByName('IDFUNDOINVEST').AsInteger);

                  if not CdsCotaFundo.IsEmpty then
                  begin
                     CtrlFundos.DbPedidofundo.Clear;

                     CtrlFundos.DbPedidofundo.Idplanprevctbpatr.AsInteger := CdsListPenhoraJuridico.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                     CtrlFundos.DbPedidofundo.Idtipoinvest.AsInteger      := CdsListPenhoraJuridico.FieldByName('FDOTIPOINVEST').AsInteger;
                     CtrlFundos.DbPedidofundo.Idfundoinvest.AsInteger     := CdsListPenhoraJuridico.FieldByName('IDFUNDOINVEST').AsInteger;
                     CtrlFundos.DbPedidofundo.Idtipooperacao.AsInteger    := CdsOperBloqueioFdo.FieldByName('IDTIPOOPERACAO').AsInteger;
                     CtrlFundos.DbPedidofundo.Idtipocota.AsInteger        := CdsListPenhoraJuridico.FieldByName('IDTIPOCOTA').AsInteger;
                     CtrlFundos.DbPedidofundo.Idmotivobloqueio.AsInteger  := pRPI.IDMOTBLOQPENFDO;
                     CtrlFundos.DbPedidofundo.Datapedido.AsDateTime       := CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime;
                     CtrlFundos.DbPedidofundo.Datacotizacao.AsDateTime    := CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime;
                     CtrlFundos.DbPedidofundo.Dataliquidacao.AsDateTime   := CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime;
                     CtrlFundos.DbPedidofundo.Dataaplicacao.AsDateTime    := CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime;
                     CtrlFundos.DbPedidofundo.Vlrcota.AsFloat             := CdsCotaFundo.FieldByName('VLRCOTA').AsFloat;
                     CtrlFundos.DbPedidofundo.Vlrpedido.AsFloat           := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat);

                     fQtdCotas := RoundCM((CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat / CdsCotaFundo.FieldByName('VLRCOTA').AsFloat), CdsListPenhoraJuridico.FieldByName('QTDDECQTD').AsInteger);
                     CtrlFundos.DbPedidofundo.Qtdblqpedido.AsFloat        := fQtdCotas;

                     // Aplica a alteração na Tabela
                     if not CtrlFundos.DbPedidofundo.Insert then
                        Raise Exception.Create(CtrlFundos.DbPedidofundo.MessageInfo);

                     If Not BloqueioCotas(CdsListPenhoraJuridico.FieldByName('FDOTIPOINVEST').AsInteger,
                                          CtrlFundos.DbPedidofundo.IdPedidoFundo.AsInteger,
                                          CdsOperBloqueioFdo.FieldByName('IDTIPOOPERACAO').AsInteger,
                                          CdsHistFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          CdsListPenhoraJuridico.FieldByName('IDFUNDOINVEST').AsInteger,
                                          CdsListPenhoraJuridico.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                          CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime,
                                          CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime,
                                          CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime,
                                          0,
                                          CdsCotaFundo.FieldByName('VLRCOTA').AsFloat,
                                          ABS(fQtdCotas),
                                          CdsListPenhoraJuridico.FieldByName('IDTIPOCOTA').AsInteger) Then
                        Raise Exception.Create('Não foi possível efetuar a Operação, '+#13+
                                               'o processo será cancelado.');

                     With DmFundoComum Do
                     Begin
                        OperComum.LimpaParametros(QryConfirmacao);
                        QryConfirmacao.ParamByName('IDFUNDOINVEST').AsInteger     := CdsListPenhoraJuridico.FieldByName('IDFUNDOINVEST').AsInteger;
                        QryConfirmacao.ParamByName('IDTIPOOPERACAO').AsInteger    := CdsOperBloqueioFdo.FieldByName('IDTIPOOPERACAO').AsInteger;
                        QryConfirmacao.ParamByName('DATAOPERACAO').AsString       := CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsString;
                        QryConfirmacao.ParamByName('DATACOTIZACAO').AsString      := CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsString;
                        QryConfirmacao.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                                   CdsListPenhoraJuridico.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                        QryConfirmacao.ParamByName('IDPEDIDOFUNDO').AsInteger     := CtrlFundos.DbPedidofundo.IdPedidoFundo.AsInteger;
                        QryConfirmacao.Open;

                        while not QryConfirmacao.Eof do
                        begin
                           CdsPlanPatro.Data       := CtrlInvestimento.ListPlanoPatro(CdsListPenhoraJuridico.FieldByName('IDPLANPREVCTBPATR').AsInteger);
                           CdsTipoFundoInvest.Data := CtrlFundos.ListTipoFundoInvest(-1, CdsHistFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger);

                           iIdForCli := OperComum.BuscaForCli(QryConfirmacao.FieldByName('IDTIPOINVEST').AsInteger,
                                                              CdsHistFundoInvest.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                                              QryConfirmacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                              pRPI.IDTIPOCLIENTEEMI);

                           //AL_162
                           If Not AlimentaFundo(QryConfirmacao.FieldByName('IDTIPOINVEST').AsInteger,
                                                QryConfirmacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                QryConfirmacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                QryConfirmacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                                CdsPlanPatro.FieldByName('IDPLANOPREV').AsInteger,
                                                CdsPlanPatro.FieldByName('IDPATRO').AsInteger,
                                                QryConfirmacao.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                                QryConfirmacao.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                                QryConfirmacao.FieldByName('QTDDECQTD').AsInteger,
                                                QryConfirmacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                                iIdForCli,
                                                QryConfirmacao.FieldByName('DATAOPERACAO').AsDateTime,
                                                QryConfirmacao.FieldByName('DATACOTIZACAO').AsDateTime,
                                                QryConfirmacao.FieldByName('DATALIQUIDACAO').AsDateTime,
                                                QryConfirmacao.FieldByName('QTDOPERACAO').AsFloat,
                                                QryConfirmacao.FieldByName('VLRCOTA').AsFloat,
                                                QryConfirmacao.FieldByName('VLRLIQUIDO').AsFloat,
                                                QryConfirmacao.FieldByName('VLRIR').AsFloat,
                                                QryConfirmacao.FieldByName('VLRIOF').AsFloat,
                                                sNaturMov,
                                                Trim(CdsOperBloqueioFdo.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                                     QryConfirmacao.FieldByName('DESCFUNDOINVEST').AsString,
                                                'BLQ' , True, iPlanPrevCtbPatro, -1, -1,
                                                QryConfirmacao.FieldByName('VLRRENDIMENTO').AsFloat, sMens) Then
                           begin
                              if sMens <> '' then
                                 Raise Exception.Create('Não foi possível confirmar a operação de Bloqueio' + #13 +
                                                        'Fundo: ' + QryConfirmacao.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                                                        'Data : '+ QryConfirmacao.FieldByName('DATAOPERACAO').AsString + #13 +
                                                        'Mensagem: ' + sMens)
                              else
                                 Raise Exception.Create('Não foi possível confirmar a operação de Bloqueio' + #13 +
                                                        'Fundo: ' + QryConfirmacao.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                                                        'Data : ' + QryConfirmacao.FieldByName('DATAOPERACAO').AsString + #13 +
                                                        'Ocorreu um problema ao gravar esta operação' + #13 +
                                                        'Tente mais tarde');
                           end;
                           QryConfirmacao.Next;
                        end;
                     end;

                     If dtmBaseDados.dbBaseDados.InTransaction then
                        dtmBaseDados.dbBaseDados.Commit;

                     If (CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime < CdsTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime) Then
                     begin
                        If Not Reprocessamento(iTipoInvestUsu,
                                               CdsHistFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                               CdsListPenhoraJuridico.FieldByName('IDFUNDOINVEST').AsInteger,
                                               CdsListPenhoraJuridico.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime,
                                               CdsTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                               CdsHistFundoInvest.FieldByName('DTAINIPROC').AsDateTime,
                                               True) Then
                           MsgDlg('Atenção : A Operação foi concluída com sucesso!'+#13+
                                  'Mas o Reprocessamento foi cancelado!'+#13+
                                  'Faça o Reprocessamento para esse Fundo, a partir desse dia!',
                                  'Mensagem do Sistema', MtInformation,[MbOk],0);
                     end;
                  end
                  else
                      Raise Exception.Create('Não foi encotrado a Cota do Fundo :' + CdsListPenhoraJuridico.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                                             'para o dia : '+ CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsString + '');
               end
               else
                  Raise Exception.Create('Não foi encotrado o Tipo de Operação Bloqueio / Desbloqueio '+ #13 +
                                         'para Fundo : ' + CdsListPenhoraJuridico.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                                         'para o dia : ' + CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsString + '');

               if not dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               if not ExecutaQuery(dtmOperComum.qryAuxiliar,
                                   'UPDATE ETAPAPROCTRAB  SET FLGINVESTLIDO = 1 ' +
                                   'WHERE (NUMPROCTRAB = '+ IntToStr(CdsListPenhoraJuridico.FieldByName('NUMPROCTRAB').AsInteger) + ') AND ' +
                                   '      (NUMSEQ = '+ IntToStr(CdsListPenhoraJuridico.FieldByName('NUMSEQ').AsInteger) + ')') then
                  Raise Exception.Create('Ocorreu um problema ao atualizar o Jurídico.');

               If dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.Commit;
                  
               CdsListPenhoraJuridico.Next;
            end;
         except
            on E:Exception do
            begin
               MsgDlg('Não foi efetuar a Integração com o Jurídico!'#13+
                      'Com a Mensagem:'#13+
                      E.Message,'Mensagem do Sistema', mtInformation,[mbOk],0);
               dtmBaseDados.dbBaseDados.Rollback;
               Result := False;
            end;
         end;
      end;
   finally
      FreeAndNil(CtrlInvestimento);
      FreeAndNil(CdsListPenhoraJuridico);
      FreeAndNil(CdsOperBloqueioFdo);
      FreeAndNil(CdsCotaFundo);
      FreeAndNil(CdsHistFundoInvest);
      FreeAndNil(CdsPlanPatro);
      FreeAndNil(CdsTipoFundoInvest);
      FreeAndNil(FDbPedidoFundo);
   end;
end;

//Al_175
function PesqAplicMesmoDia(iTipoInvest, iTipoOperacao, iCarteira, iFundo, iOperacao,
                           iiPlanPrevCtbPatro, iIdOperacaoInvest, iComposicaoFundo : integer;
                           dDataApl   : TDateTime;
                           fValorCota : Double;
                           sNaturMov, sHistorico : string;
                           iTipoCota       : Integer = -1) : boolean;
var
   ftotvlraplicado,
   ftotcotasmovfundo,
   ftotvlrmovfundo,
   ftotsaldoqtdcotas,
   ftotsaldovlrfundo,
   ftotvlrcustoatual,
   ftotvlrvaratual  : Extended;
begin
   try
      try
         //AL_147
         //AL_37
         OperComum.LimpaParametros(DmFundoComum.QryPesqAplicMesmoDia);
         DmFundoComum.QryPesqAplicMesmoDia.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvest;
         DmFundoComum.QryPesqAplicMesmoDia.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteira;
         DmFundoComum.QryPesqAplicMesmoDia.ParamByName('IDFUNDOINVEST').AsInteger     := iFundo;
         DmFundoComum.QryPesqAplicMesmoDia.ParamByName('DATAAPLICACAO').AsDateTime    := dDataApl;
         DmFundoComum.QryPesqAplicMesmoDia.ParamByName('DATAMOVFUNDO').AsDateTime     := dDataApl;
         DmFundoComum.QryPesqAplicMesmoDia.ParamByName('NATURMOVFUNDO').AsString      := sNaturMov;
         DmFundoComum.QryPesqAplicMesmoDia.ParamByName('IDPLANPREVCTBPATR').AsInteger := iiPlanPrevCtbPatro;
         //AL_146
         if iTipoCota > 0 then
            DmFundoComum.QryPesqAplicMesmoDia.ParamByName('IDTIPOCOTA').AsInteger        := iTipoCota;
         DmFundoComum.QryPesqAplicMesmoDia.Open;

         if (DmFundoComum.QryPesqAplicMesmoDia.RecordCount > 1)   then
         begin
            fTotVlrAplicado   := 0;
            fTotCotasMovFundo := 0;
            fTotVlrMovFundo   := 0;
            fTotSaldoQtdCotas := 0;
            fTotSaldoVlrFundo := 0;
            fTotVlrCustoAtual := 0;
            fTotVlrVarAtual   := 0;

            while not (DmFundoComum.QryPesqAplicMesmoDia.Eof) do
            begin
               fTotVlrAplicado   := fTotVlrAplicado   + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('VLRAPLICADO').AsFloat;
               fTotCotasMovFundo := fTotCotasMovFundo + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('COTASMOVFUNDO').AsFloat;
               fTotVlrMovFundo   := fTotVlrMovFundo   + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('VLRMOVFUNDO').AsFloat;
               fTotSaldoQtdCotas := fTotSaldoQtdCotas + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('SALDOQTDCOTAS').AsFloat;
               fTotSaldoVlrFundo := fTotSaldoVlrFundo + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('SALDOVLRFUNDO').AsFloat;
               fTotVlrCustoAtual := fTotVlrCustoAtual + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('VLRCUSTOATUAL').AsFloat;
               fTotVlrVarAtual   := fTotVlrVarAtual   + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('VLRVARIACAO').AsFloat;

               DmFundoComum.QryPesqAplicMesmoDia.Next;
            end;

            // CASO EXISTA MAIS DE UM REGISTRO, FAZ A SOMA DOS DEMAIS E GRAVA NA HISTFUNDO.
            if not GravaAplicacaoResgate(iTipoInvest, iTipoOperacao, iCarteira, iOperacao,
                                         iFundo, dDataApl, dDataApl, dDataApl,
                                         sHistorico, sNaturMov, 'ATU',
                                         fTotVlrAplicado, fTotVlrMovFundo, 0, 0, ftotvlrvaratual,
                                         fTotCotasMovFundo, fTotSaldoQtdCotas, fTotSaldoVlrFundo,
                                        (fTotSaldoVlrFundo / fTotSaldoQtdCotas),
                                         fTotVlrCustoAtual,
                                         iiPlanPrevCtbPatro, iIdOperacaoInvest,
                                         iComposicaoFundo, iTipoCota) then
                 raise Exception.Create('Não foi possível efetuar a unificação das aplicações do dia '+DateToStr(dDataApl)+'.'+#13+
                                      sHistorico+'.');
         end;

         Result := True;

      except
         On E:Exception Do
         begin
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         end;
      end;
   finally
      OperComum.LimpaParametros(DmFundoComum.QryPesqAplicMesmoDia);
   end;
end;

//AL_188
Function MontaMascaraDecQtdHist(IDFUNDOINVEST : Integer; DATAOPERACAO : String) : String;
Var
   sMascara : String;
   i        : Integer;
begin
   With  DmFundoComum.QryMontaMascaraDecQtdHist Do
   Begin
      Close;
      ParamByName('IDFUNDOINVEST').AsInteger := IDFUNDOINVEST;
      ParamByName('DATAOPERACAO').AsString   := DATAOPERACAO;
      Open;
      If (FieldByName('QTDDECQTD').AsInteger = 0) or (FieldByName('QTDDECQTD').AsInteger = null) Then
         sMascara := '###,#0.000000000000' // 12 casas decimais(padrão) quando não informado
      Else
      Begin
         sMascara := '###,#0.';
         For i := 1 To FieldByName('QTDDECQTD').AsInteger Do
            sMascara := sMascara + '0';
      End;
      Close;
   End;
   Result := sMascara;
end;

//AL_188
Function MontaMascaraDecVlrHist(IDFUNDOINVEST : Integer; DATAOPERACAO : String) : String;
Var
   sMascara : String;
   i        : Integer;
begin
   With DmFundoComum.QryMontaMascaraDecQtdHist Do
   Begin
      Close;
      ParamByName('IDFUNDOINVEST').AsInteger := IDFUNDOINVEST;
      ParamByName('DATAOPERACAO').AsString   := DATAOPERACAO;
      Open;
      If (FieldByName('QTDDECVALOR').AsInteger = 0) or (FieldByName('QTDDECVALOR').AsInteger = null) Then
         sMascara := '###,#0.00' // 2 casas decimais(padrão) quando não informado
      Else
      Begin
         sMascara := '###,#0.';
         For i := 1 To FieldByName('QTDDECVALOR').AsInteger Do
            sMascara := sMascara + '0';
      End;
      Close;
   End;
   Result := sMascara;
end;

//AL_196
procedure ListaAtuAplicacoes(iIdTipoInvest, iIdTipoFundoInvest, iIdPalnPrevCtbPatr, iIdFundoInvest, iIdTipoCota : Integer;
                             dDataMov, dDataBloq : TDateTime);
begin
   with DmFundoComum Do
   begin
      OperComum.LimpaParametros(DmFundoComum.QryAtuAplicacoes);
      QryAtuAplicacoes.Sql.Clear;
      QryAtuAplicacoes.Sql.Add('SELECT  /*+INDEX (H.XPKHISTFUNDO)*/ ');
      QryAtuAplicacoes.Sql.Add('     O.DATACOTIZACAO AS DATACOTIZA, ');
      QryAtuAplicacoes.Sql.Add('     T.DESCTIPOFUNDOINV, ');
      QryAtuAplicacoes.Sql.Add('     P.PLANPRVCONTABPATRO, ');
      QryAtuAplicacoes.Sql.Add('     F.DESCFUNDOINVEST, F.IDFUNDOINVEST, F.IDCARTEIRAINVEST, ');
      QryAtuAplicacoes.Sql.Add('     F.STAPROVISIONAIOF, F.STAPROVISIONAIR, ');
      QryAtuAplicacoes.Sql.Add('     H.IDCOMPOSICAOFUNDO, H.IDPLANPREVCTBPATR, H.IDTIPOINVEST,     H.IDTIPOOPERACAO, ');
      QryAtuAplicacoes.Sql.Add('     H.IDOPERACAOFUNDO,   H.IDTIPOCOTA,        H.DATAMOVFUNDO,     H.DATAAPLICACAO, ');
      QryAtuAplicacoes.Sql.Add('     H.DATAULTPGTOIR,     H.COTAAPLICACAO,     H.VLRAPLICADO,      H.VLRCUSTOATUAL, ');
      QryAtuAplicacoes.Sql.Add('     H.SALDOQTDCOTAS,     H.SALDOVLRFUNDO,     H.SALDOQTDCOTASBLQ, H.TIPMOVFUNDO, ');
      QryAtuAplicacoes.Sql.Add('     H.NATURMOVFUNDO ');
      QryAtuAplicacoes.Sql.Add('FROM HISTFUNDO H, ');
      QryAtuAplicacoes.Sql.Add('    (SELECT /*+INDEX (HI2.XIE1HISTFUNDO)*/ ');
      QryAtuAplicacoes.Sql.Add('          MAX(HI2.IDHISTFUNDO) AS IDHISTFUNDO, ');
      QryAtuAplicacoes.Sql.Add('          MAX(HI2.DATAMOVFUNDO) AS DATAMOVFUNDO ');
      QryAtuAplicacoes.Sql.Add('     FROM HISTFUNDO HI2 ');
      QryAtuAplicacoes.Sql.Add('     WHERE ');
      QryAtuAplicacoes.Sql.Add('        (HI2.IDTIPOINVEST = '+IntToStr(iIdTipoInvest)+') AND ');
      if iIdPalnPrevCtbPatr > 0 then
         QryAtuAplicacoes.Sql.Add('        (HI2.IDPLANPREVCTBPATR = '+IntToStr(iIdPalnPrevCtbPatr)+') AND ')
      else
         QryAtuAplicacoes.Sql.Add('        (HI2.IDPLANPREVCTBPATR > 0) AND ');
      if iIdFundoInvest > 0 then
         QryAtuAplicacoes.Sql.Add('        (HI2.IDFUNDOINVEST = '+IntToStr(iIdFundoInvest)+') AND ')
      else
         QryAtuAplicacoes.Sql.Add('        (HI2.IDFUNDOINVEST > 0) AND ');
      QryAtuAplicacoes.Sql.Add('        (HI2.DATAAPLICACAO     <= TO_DATE('+QuotedStr(DateToStr(dDataMov))+',''DD/MM/YYYY''))    AND ');
      QryAtuAplicacoes.Sql.Add('        (HI2.DATAMOVFUNDO  BETWEEN  TO_DATE('+QuotedStr(DateToStr(dDataBloq))+',''DD/MM/YYYY'') AND ');
      QryAtuAplicacoes.Sql.Add('                                    TO_DATE('+QuotedStr(DateToStr(dDataMov))+',''DD/MM/YYYY''))  AND ');
      if iIdTipoCota > 0 then
         QryAtuAplicacoes.Sql.Add('        (HI2.IDTIPOCOTA = '+IntToStr(iIdTipoCota)+') AND ');
      QryAtuAplicacoes.Sql.Add('      (((HI2.IDTIPOINVEST IN (9,10))     AND (HI2.IDTIPOCOTA > 0)) OR ');
      QryAtuAplicacoes.Sql.Add('       ((HI2.IDTIPOINVEST NOT IN (9,10)) AND (HI2.IDTIPOCOTA IS NULL))) AND ');
      QryAtuAplicacoes.Sql.Add('        (HI2.TIPMOVFUNDO       <> ''PIR'') ');
      QryAtuAplicacoes.Sql.Add('     GROUP BY HI2.IDTIPOINVEST, HI2.IDPLANPREVCTBPATR, HI2.IDFUNDOINVEST, HI2.DATAAPLICACAO, HI2.IDTIPOCOTA) HM, ');
      QryAtuAplicacoes.Sql.Add('     OPERACAOFUNDO O, ');
      QryAtuAplicacoes.Sql.Add('    (SELECT TF1.IDTIPOFUNDOINVEST, TF1.DESCTIPOFUNDOINV ');
      QryAtuAplicacoes.Sql.Add('     FROM   TIPOFUNDOINVEST TF1 ');
      QryAtuAplicacoes.Sql.Add('     WHERE ');
      QryAtuAplicacoes.Sql.Add('         (TF1.IDTIPOINVEST = '+IntToStr(iIdTipoInvest)+') ');
      QryAtuAplicacoes.Sql.Add('     AND (TF1.IDTIPOFUNDOINVEST = '+IntToStr(iIdTipoFundoInvest)+')  ) T, ');
      QryAtuAplicacoes.Sql.Add('    (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.IDCARTEIRAINVEST, ');
      QryAtuAplicacoes.Sql.Add('            HF1.STAPROVISIONAIOF, HF1.STAPROVISIONAIR ');
      QryAtuAplicacoes.Sql.Add('     FROM HISTFUNDOINVEST HF1 ');
      QryAtuAplicacoes.Sql.Add('     WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN ');
      QryAtuAplicacoes.Sql.Add('           (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'') ');
      QryAtuAplicacoes.Sql.Add('            FROM HISTFUNDOINVEST HF ');
      QryAtuAplicacoes.Sql.Add('            WHERE ');
      if iIdFundoInvest > 0 then
         QryAtuAplicacoes.Sql.Add('                (HF.IDFUNDOINVEST = '+IntToStr(iIdFundoInvest)+') ')
      else
         QryAtuAplicacoes.Sql.Add('                (HF.IDFUNDOINVEST > 0) ');
      QryAtuAplicacoes.Sql.Add('            AND (HF.DTAVIGENCIA          < TO_DATE('+QuotedStr(DateToStr(dDataMov))+',''DD/MM/YYYY'')+1) ');
      QryAtuAplicacoes.Sql.Add('            AND (HF.IDTIPOFUNDOINVEST    = '+IntToStr(iIdTipoFundoInvest)+') ');
      QryAtuAplicacoes.Sql.Add('            GROUP BY HF.IDTIPOFUNDOINVEST, HF.IDFUNDOINVEST)) ');
      QryAtuAplicacoes.Sql.Add('     AND (HF1.IDTIPOFUNDOINVEST = '+IntToStr(iIdTipoFundoInvest)+') ) F, ');
      QryAtuAplicacoes.Sql.Add('     VWPLANPREVCTBPATR  P ');
      QryAtuAplicacoes.Sql.Add('WHERE ');
      QryAtuAplicacoes.Sql.Add('(H.IDHISTFUNDO          = HM.IDHISTFUNDO)       AND ');
      QryAtuAplicacoes.Sql.Add('(H.SALDOQTDCOTAS        > 0)                    AND ');
      QryAtuAplicacoes.Sql.Add('(F.IDFUNDOINVEST        = H.IDFUNDOINVEST)      AND ');
      QryAtuAplicacoes.Sql.Add('(T.IDTIPOFUNDOINVEST    = F.IDTIPOFUNDOINVEST)  AND ');
      QryAtuAplicacoes.Sql.Add('(P.IDPLANPREVCTBPATR    = H.IDPLANPREVCTBPATR)  AND ');
      QryAtuAplicacoes.Sql.Add('(O.IDOPERACAOFUNDO(+)   = H.IDOPERACAOFUNDO) ');
      QryAtuAplicacoes.Sql.Add('ORDER BY H.IDPLANPREVCTBPATR, H.IDFUNDOINVEST, H.DATAAPLICACAO, H.IDTIPOCOTA,  H.DATAMOVFUNDO, H.IDHISTFUNDO DESC ');
      QryAtuAplicacoes.Open;
   end;
end;

//AL_195
procedure ListaSaldoFundo(iIdTipoInvest, iIdPlanPrevCtbPatr, iIdFundoInvest, iIdTipoCota,
                          iIdTipoMaior, iIdTipoMenor, iIdComposicao  : Integer;
                          dDataAplic, dDataMov : TDateTime);
begin
   with DmFundoComum Do
   begin
      OperComum.LimpaParametros(DmFundoComum.QrySaldoFundo);
      QrySaldoFundo.Sql.Clear;
      QrySaldoFundo.Sql.Add('SELECT /*+INDEX (H1.XPKHISTFUNDO)*/ ');
      QrySaldoFundo.Sql.Add('   SUM(H1.VLRAPLICADO)        AS VLRAPLICADO, ');
      QrySaldoFundo.Sql.Add('   SUM(NVL(H1.VLRIRPROV,0))   AS VLRIRPROV, ');
      QrySaldoFundo.Sql.Add('   SUM(NVL(H1.VLRIOFPROV,0))  AS VLRIOFPROV, ');
      QrySaldoFundo.Sql.Add('   SUM(NVL(H1.VLRVARIACAO,0)) AS VLRVARIACAO, ');
      QrySaldoFundo.Sql.Add('   SUM(H1.COTASMOVFUNDO)      AS COTASMOVFUNDO, ');
      QrySaldoFundo.Sql.Add('   SUM(H1.VLRMOVFUNDO)        AS VLRMOVFUNDO, ');
      QrySaldoFundo.Sql.Add('   SUM(H1.SALDOQTDCOTAS)      AS SALDOQTDCOTAS, ');
      QrySaldoFundo.Sql.Add('   SUM(H1.SALDOVLRFUNDO)      AS SALDOVLRFUNDO, ');
      QrySaldoFundo.Sql.Add('   SUM(H1.VLRCUSTOATUAL)      AS VLRCUSTOATUAL, ');
      QrySaldoFundo.Sql.Add('   SUM((H1.SALDOVLRFUNDO-(NVL(H1.VLRIOFPROV,0)+NVL(H1.VLRIRPROV,0)))) AS  SALDOLIQUIDO, ');
      QrySaldoFundo.Sql.Add('   SUM(NVL(H1.SALDOQTDCOTASBLQ,0)) AS SALDOQTDCOTASBLQ, ');
      QrySaldoFundo.Sql.Add('   DESCFUNDOINVEST ');
      QrySaldoFundo.Sql.Add('FROM ');
      QrySaldoFundo.Sql.Add('   HISTFUNDO H1, ');
      QrySaldoFundo.Sql.Add('    (SELECT /*+INDEX (H.XIE1HISTFUNDO)*/ MAX(H.IDHISTFUNDO) AS IDHISTFUNDO ');
      QrySaldoFundo.Sql.Add('     FROM HISTFUNDO H, ');
      QrySaldoFundo.Sql.Add('         (SELECT IDTIPOINVEST, IDTIPOOPERACAO ');
      QrySaldoFundo.Sql.Add('          FROM TIPOOPERACAO ');
      QrySaldoFundo.Sql.Add('          WHERE (IDTIPOINVEST = '+IntToStr(iIdTipoInvest)+') AND (NATUREZAOPERACAO <> ''R'')) TP ');
      QrySaldoFundo.Sql.Add('     WHERE ');
      QrySaldoFundo.Sql.Add('           (H.IDTIPOINVEST      = '+IntToStr(iIdTipoInvest)+') ');
      QrySaldoFundo.Sql.Add('     AND   (H.IDPLANPREVCTBPATR = '+IntToStr(iIdPlanPrevCtbPatr)+') ');
      QrySaldoFundo.Sql.Add('     AND   (H.IDFUNDOINVEST     = '+IntToStr(iIdFundoInvest)+') ');
      if iIdTipoMaior > 0 then
         QrySaldoFundo.Sql.Add('     AND   (H.DATAAPLICACAO >= TO_DATE('+QuotedStr(DateToStr(dDataAplic))+',''DD/MM/YYYY'')) ');
      if iIdTipoMenor > 0 then
         QrySaldoFundo.Sql.Add('     AND   (H.DATAAPLICACAO < TO_DATE('+QuotedStr(DateToStr(dDataAplic))+',''DD/MM/YYYY'')) ');
      if ((iIdTipoMaior < 0) and (iIdTipoMenor < 0)) then
         QrySaldoFundo.Sql.Add('     AND   (H.DATAAPLICACAO <= TO_DATE('+QuotedStr(DateToStr(dDataMov))+',''DD/MM/YYYY'')) ');
      QrySaldoFundo.Sql.Add('     AND   (H.DATAMOVFUNDO      = TO_DATE('+QuotedStr(DateToStr(dDataMov))+',''DD/MM/YYYY'')) ');
      QrySaldoFundo.Sql.Add('     AND  ((H.DATAMOVFUNDO      < TO_DATE('+QuotedStr(DateToStr(dDataMov))+',''DD/MM/YYYY'')) OR H.IDHISTFUNDO < 999999999) ');
      if iIdTipoCota > 0 then
         QrySaldoFundo.Sql.Add('     AND   (H.IDTIPOCOTA        = '+IntToStr(iIdTipoCota)+') ');
      QrySaldoFundo.Sql.Add('     AND (((H.IDTIPOINVEST IN (9,10))     AND (H.IDTIPOCOTA > 0)) OR ');
      QrySaldoFundo.Sql.Add('          ((H.IDTIPOINVEST NOT IN (9,10)) AND (H.IDTIPOCOTA IS NULL))) ');
      if iIdComposicao > 0 then
         QrySaldoFundo.Sql.Add('     AND   (H.IDCOMPOSICAOFUNDO = '+IntToStr(iIdComposicao)+') ');
      QrySaldoFundo.Sql.Add('     AND   (H.TIPMOVFUNDO      <> ''PIR'') ');
      QrySaldoFundo.Sql.Add('     AND  (TP.IDTIPOINVEST      = H.IDTIPOINVEST) ');
      QrySaldoFundo.Sql.Add('     AND  (TP.IDTIPOOPERACAO    = H.IDTIPOOPERACAO) ');
      QrySaldoFundo.Sql.Add('     GROUP BY H.IDTIPOINVEST, H.IDPLANPREVCTBPATR, H.IDFUNDOINVEST, H.DATAAPLICACAO) HM, ');
      QrySaldoFundo.Sql.Add('    (SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.IDCARTEIRAINVEST, ');
      QrySaldoFundo.Sql.Add('            HF1.STAPROVISIONAIOF, HF1.STAPROVISIONAIR ');
      QrySaldoFundo.Sql.Add('     FROM HISTFUNDOINVEST HF1 ');
      QrySaldoFundo.Sql.Add('     WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN ');
      QrySaldoFundo.Sql.Add('           (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'') ');
      QrySaldoFundo.Sql.Add('            FROM HISTFUNDOINVEST HF ');
      QrySaldoFundo.Sql.Add('            WHERE ');
      QrySaldoFundo.Sql.Add('                (HF.IDFUNDOINVEST = '+IntToStr(iIdFundoInvest)+') ');
      QrySaldoFundo.Sql.Add('            AND (HF.DTAVIGENCIA          < TO_DATE('+QuotedStr(DateToStr(dDataMov))+',''DD/MM/YYYY'')+1) ');
      QrySaldoFundo.Sql.Add('            GROUP BY HF.IDFUNDOINVEST)) ) FI ');
      QrySaldoFundo.Sql.Add('WHERE ');
      QrySaldoFundo.Sql.Add('     (H1.IDHISTFUNDO   = HM.IDHISTFUNDO) ');
      QrySaldoFundo.Sql.Add(' AND (H1.SALDOQTDCOTAS > 0) ');
      QrySaldoFundo.Sql.Add(' AND (H1.IDFUNDOINVEST = FI.IDFUNDOINVEST) ');
      QrySaldoFundo.Sql.Add('GROUP BY FI.DESCFUNDOINVEST ');
      QrySaldoFundo.Open;
   end;
end;

//AL_197
procedure ListaVariacaoFundo(iIdTipoInvest, iIdTipoFundoInvest : Integer;
                             dDataMov : TDateTime);
begin
   with DmFundoComum Do
   begin
      OperComum.LimpaParametros(DmFundoComum.QryVariacaoFundos);
      QryVariacaoFundos.Sql.Clear;
      QryVariacaoFundos.Sql.Add('SELECT SUM(HF5.VLRVARIACAO) AS VLRVARIACAO, FI.DESCFUNDOINVEST, FI.DESCTIPOFUNDOINV, ');
      QryVariacaoFundos.Sql.Add('       FI.IDTIPOINVEST, FI.IDCARTEIRAINVEST, PL.IDPLANOPREV, PL.IDPATRO, PL.PLANPRVCONTABPATRO, ');
      QryVariacaoFundos.Sql.Add('       FI.IDTIPOFUNDOINVEST ');
      QryVariacaoFundos.Sql.Add('FROM ');
      QryVariacaoFundos.Sql.Add('    HISTFUNDO HF5, ');
      QryVariacaoFundos.Sql.Add('   (SELECT MAX(HF2.IDHISTFUNDO) AS IDHISTFUNDO ');
      QryVariacaoFundos.Sql.Add('    FROM HISTFUNDO HF2, ');
      QryVariacaoFundos.Sql.Add('       (SELECT HF1.IDFUNDOINVEST ');
      QryVariacaoFundos.Sql.Add('        FROM HISTFUNDOINVEST HF1, TIPOFUNDOINVEST TF1 ');
//Ricardo Cristiano - 30/04/2009 - N. Sol 95853 -  N. Kintana 541920
      QryVariacaoFundos.Sql.Add('        WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN ');
      QryVariacaoFundos.Sql.Add('              (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'') ');
      QryVariacaoFundos.Sql.Add('               FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF ');
      QryVariacaoFundos.Sql.Add('               WHERE ');
      QryVariacaoFundos.Sql.Add('                   (TF.IDTIPOINVEST      = '+IntToStr(iIdTipoInvest)+') ');
//Ricardo Cristiano - 30/04/2009 - N. Sol 95853 -  N. Kintana 541920
      QryVariacaoFundos.Sql.Add('               AND (HF.DTAVIGENCIA       < TO_DATE('+QuotedStr(DateToStr(dDataMov))+',''DD/MM/YYYY'')+1) ');
      QryVariacaoFundos.Sql.Add('               AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST) ');
//Ricardo Cristiano - 30/04/2009 - N. Sol 95853 -  N. Kintana 541920
      QryVariacaoFundos.Sql.Add('               GROUP BY HF.IDFUNDOINVEST) ) ');
      QryVariacaoFundos.Sql.Add('        AND (TF1.IDTIPOINVEST      = '+IntToStr(iIdTipoInvest)+') ');
      QryVariacaoFundos.Sql.Add('        AND (TF1.IDTIPOFUNDOINVEST = '+IntToStr(iIdTipoFundoInvest)+') ');
      QryVariacaoFundos.Sql.Add('        AND (HF1.IDTIPOFUNDOINVEST = TF1.IDTIPOFUNDOINVEST)        ) FI ');
      QryVariacaoFundos.Sql.Add('    WHERE ');
      QryVariacaoFundos.Sql.Add('       (HF2.IDTIPOINVEST      = '+IntToStr(iIdTipoInvest)+')    AND ');
      QryVariacaoFundos.Sql.Add('       (HF2.IDPLANPREVCTBPATR > 0) AND ');
      QryVariacaoFundos.Sql.Add('       (HF2.IDFUNDOINVEST     > 0) AND ');
      QryVariacaoFundos.Sql.Add('       (HF2.DATAAPLICACAO    <= TO_DATE('+QuotedStr(DateToStr(dDataMov))+',''DD/MM/YYYY'')) AND ');
      QryVariacaoFundos.Sql.Add('       (HF2.DATAMOVFUNDO      = TO_DATE('+QuotedStr(DateToStr(dDataMov))+',''DD/MM/YYYY'')) AND ');
      QryVariacaoFundos.Sql.Add('       (HF2.TIPMOVFUNDO       = ''ATU'')            AND ');
      QryVariacaoFundos.Sql.Add('       (FI.IDFUNDOINVEST      = HF2.IDFUNDOINVEST) ');
      QryVariacaoFundos.Sql.Add('    GROUP BY HF2.IDTIPOINVEST, HF2.IDPLANPREVCTBPATR, HF2.IDFUNDOINVEST, ');
      QryVariacaoFundos.Sql.Add('             HF2.DATAAPLICACAO, HF2.DATAMOVFUNDO, HF2.IDTIPOCOTA) HM, ');
      QryVariacaoFundos.Sql.Add('    VWPLANPREVCTBPATR PL, ');
      QryVariacaoFundos.Sql.Add('   (SELECT HF4.IDFUNDOINVEST, HF4.DESCFUNDOINVEST, TF2.DESCTIPOFUNDOINV, ');
      QryVariacaoFundos.Sql.Add('           TF2.IDTIPOINVEST, TF2.IDTIPOFUNDOINVEST, HF4.IDCARTEIRAINVEST ');
      QryVariacaoFundos.Sql.Add('    FROM HISTFUNDOINVEST HF4, TIPOFUNDOINVEST TF2 ');
//Ricardo Cristiano - 30/04/2009 - N. Sol 95853 -  N. Kintana 541920
      QryVariacaoFundos.Sql.Add('    WHERE (HF4.IDFUNDOINVEST || TO_CHAR(HF4.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN ');
      QryVariacaoFundos.Sql.Add('          (SELECT HF3.IDFUNDOINVEST || TO_CHAR(MAX(HF3.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'') ');
      QryVariacaoFundos.Sql.Add('           FROM HISTFUNDOINVEST HF3, TIPOFUNDOINVEST TF1 ');
      QryVariacaoFundos.Sql.Add('           WHERE ');
      QryVariacaoFundos.Sql.Add('               (TF1.IDTIPOINVEST      = '+IntToStr(iIdTipoInvest)+') ');
//Ricardo Cristiano - 30/04/2009 - N. Sol 95853 -  N. Kintana 541920
      QryVariacaoFundos.Sql.Add('           AND (HF3.DTAVIGENCIA       < TO_DATE('+QuotedStr(DateToStr(dDataMov))+',''DD/MM/YYYY'')+1) ');
      QryVariacaoFundos.Sql.Add('           AND (HF3.IDTIPOFUNDOINVEST = TF1.IDTIPOFUNDOINVEST) ');
//Ricardo Cristiano - 30/04/2009 - N. Sol 95853 -  N. Kintana 541920
      QryVariacaoFundos.Sql.Add('           GROUP BY HF3.IDFUNDOINVEST ) ) ');
      QryVariacaoFundos.Sql.Add('    AND (TF2.IDTIPOINVEST      = '+IntToStr(iIdTipoInvest)+') ');
      QryVariacaoFundos.Sql.Add('    AND (TF2.IDTIPOFUNDOINVEST = '+IntToStr(iIdTipoFundoInvest)+') ');
      QryVariacaoFundos.Sql.Add('    AND (HF4.IDTIPOFUNDOINVEST = TF2.IDTIPOFUNDOINVEST)  ) FI ');
      QryVariacaoFundos.Sql.Add('WHERE ');
      QryVariacaoFundos.Sql.Add('    HF5.IDHISTFUNDO      = HM.IDHISTFUNDO         AND ');
      QryVariacaoFundos.Sql.Add('    HF5.IDFUNDOINVEST    = FI.IDFUNDOINVEST       AND ');
      QryVariacaoFundos.Sql.Add('    PL.IDPLANPREVCTBPATR = HF5.IDPLANPREVCTBPATR ');
      QryVariacaoFundos.Sql.Add('GROUP BY PL.IDPLANOPREV, PL.IDPATRO, FI.DESCFUNDOINVEST, FI.DESCTIPOFUNDOINV, ');
      QryVariacaoFundos.Sql.Add('         FI.IDTIPOINVEST, FI.IDCARTEIRAINVEST, PL.PLANPRVCONTABPATRO, FI.IDTIPOFUNDOINVEST ');
      QryVariacaoFundos.Open;
   end;
end;

//Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
//AL_203
//AL_198
Function TransfFundoLote(iTipoInvest,iFundoInvest,iTipoFundoInvest :  Integer;
                         dDataProcesso: TDateTime;
                         bMostraMsg: Boolean;
                         iTipoCota : Integer = -1): Boolean;
Var
  smens: string;
  //AL_203
  //AL_199
  QryBuscaTransfLote, QryBuscaSaldo, QryAuxLocal : TwwQuery;
  DadosCota : TDadosCota;
Begin
   Try
      //AL_199
      QryBuscaTransfLote := TwwQuery.Create(Application);
      QryBuscaTransfLote.DatabaseName := 'BaseDados';
      //AL_203
      QryBuscaSaldo := TwwQuery.Create(Application);
      QryBuscaSaldo.DatabaseName := 'BaseDados';

      QryAuxLocal := TwwQuery.Create(Application);
      QryAuxLocal.DatabaseName := 'BaseDados';

      Try
         //AL_199 - início
         with DmFundoComum Do
         begin
            // Verifica se existem operacões de transferência
            OperComum.LimpaParametros(DmFundoComum.QryVerTransfPlanosLote);
            QryVerTransfPlanosLote.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvest;
            QryVerTransfPlanosLote.ParamByName('IDFUNDOINVEST').AsInteger := iFundoInvest;
            QryVerTransfPlanosLote.ParamByName('DATAOPERACAO').AsString   := DateToStr(dDataProcesso);
            //AL_203
            if iTipoCota > 0 then
               QryVerTransfPlanosLote.ParamByName('IDTIPOCOTA').AsInteger := iTipoCota;
            QryVerTransfPlanosLote.Open;

            //Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
            if not QryVerTransfPlanosLote.IsEmpty then
            begin
               //Monta query de busca saldo
               if not MontaBuscaSaldo(iTipoInvest, iFundoInvest, iTipoFundoInvest, dDataProcesso,
                                      QryBuscaSaldo,
                                      iTipoCota) then
                  Raise Exception.Create('Não foi possível montar a busca saldo da transferência por Lote.');

               if QryBuscaSaldo.IsEmpty then
                  Raise Exception.Create('Não foi possível montar a busca saldo da transferência por Lote.');
            end;
            //Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
            QryVerTransfPlanosLote.First;
            while not QryVerTransfPlanosLote.Eof do
            begin
               //Seleciona as operações de Transferência
               if not MontaBuscaTransfLote(iTipoInvest, iFundoInvest, iTipoFundoInvest, -107,
                                           dDataProcesso,
                                           QryVerTransfPlanosLote.FieldByName('IDLOTE').AsString,
                                           QryBuscaTransfLote,
                                           iTipoCota) then
                  Raise Exception.Create('Não foi possível montar a busca da transferência por Lote.');

               //Efetua a Transferência de baixa
               QryBuscaTransfLote.First;
               while not QryBuscaTransfLote.Eof do
               begin
                  sMens := '';
                 //AL_203  
                  QryBuscaSaldo.First;
                  //Ricardo Cristiano - 09/12/2008 - N. Sol 100716 -  N. Kintana 447117
                  if QryBuscaTransfLote.FieldByName('DATAVENCIMENTO').AsDateTime <> 0 then
                  begin
                     if not QryBuscaSaldo.Locate('DATAAPLICACAO', QryBuscaTransfLote.FieldByName('DATAVENCIMENTO').AsDateTime,[]) then
                        Raise Exception.Create('Divergência de Saldo, por favor atualizar o dia anterior.');
                  end
                  else
                  begin
                     if not QryBuscaSaldo.Locate('IDOPERACAOFUNDO',QryBuscaTransfLote.FieldByName('IDOPERACAOORIGEM').AsInteger,[]) then
                        Raise Exception.Create('Divergência de Saldo, por favor atualizar o dia anterior.');
                  end;

                  DadosCota := BuscaCotaFundo(QryAuxLocal,
                                              QryBuscaTransfLote.FieldByName('IDFUNDOINVEST').AsInteger,
                                              QryBuscaSaldo.FieldByName('DATAAPLICACAO').AsDateTime,
                                              OperComum.IIF((iTipoCota > 0), iTipoCota, -1));
                                              
                  //Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
                  if not AlimentaFundo(iTipoInvest,
                                       -107,
                                       QryBuscaTransfLote.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       QryBuscaTransfLote.FieldByName('IDFUNDOINVEST').AsInteger,
                                       QryBuscaTransfLote.FieldByName('IDPLANOPREV').AsInteger,
                                       QryBuscaTransfLote.FieldByName('IDPATRO').AsInteger,
                                       QryBuscaTransfLote.FieldByName('IDOPERACAOFUNDO').AsInteger {iIdOperacaoOrigemdoFundoDestino},
                                       -1{QryBuscaTransfLote.FieldByName('IDOPERACAOORIGEM').AsInteger {idoperacaofundo},
                                       QryBuscaTransfLote.FieldByName('QTDDECQTD').AsInteger {iQtdDecCotas},
                                       iTipoFundoInvest,
                                       -1{iForCli},
                                       QryBuscaSaldo.FieldByName('DATAAPLICACAO').AsDateTime{Aplicacao},
                                       QryBuscaTransfLote.FieldByName('DATAOPERACAO').AsDateTime {Operacao},
                                       QryBuscaTransfLote.FieldByName('DATAOPERACAO').AsDateTime {Liquidacao},
                                       QryBuscaTransfLote.FieldByName('QTDOPERACAO').AsFloat{Quantidade},
                                       DadosCota.VlrCota{CotaAplicacao},
                                       QryBuscaTransfLote.FieldByName('VLROPERACAO').AsFloat{Valor},
                                       0{Irrf},
                                       QryBuscaTransfLote.FieldByName('VLRIOF').AsFloat{Iof},
                                       QryBuscaTransfLote.FieldByName('NATUREZAOPERACAO').AsString {sNaturezaS},
                                       QryBuscaTransfLote.FieldByName('DESCTIPOOPERACAO').AsString+' / '+QryBuscaTransfLote.FieldByName('DESCFUNDOINVEST').AsString,
                                       'TRP', True,
                                       QryBuscaTransfLote.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                       -1,
                                       -1,
                                       0 {Variacao}, sMens,
                                       OperComum.IIF((QryBuscaTransfLote.FieldByName('IDTIPOCOTA').AsInteger > 0), QryBuscaTransfLote.FieldByName('IDTIPOCOTA').AsInteger, -1){idTipoCota},
                                       RoundCM(QryBuscaSaldo.FieldByName('VLRAPLICADO').AsFloat*
                                              (QryBuscaTransfLote.FieldByName('PERCENTUAL').AsFloat/100),2){VlrAplicado}) Then
                  begin
                     if sMens <> '' then
                        Raise Exception.Create('Não foi possível confirmar a operação de Origem.' + #13 +
                                               'Mensagem: ' + sMens)
                     else
                        Raise Exception.Create('Não foi possível confirmar a operação de Origem.' + #13 +
                                               'Ocorreu um problema durante o processo de gravação' + #13 +
                                               'Refaça a operação');
                  end;
                  QryBuscaTransfLote.Next;
               end;

               //Seleciona as operações de Transferência
               if not MontaBuscaTransfLote(iTipoInvest, iFundoInvest, iTipoFundoInvest, -108,
                                           dDataProcesso,
                                           QryVerTransfPlanosLote.FieldByName('IDLOTE').AsString,
                                           QryBuscaTransfLote,
                                           iTipoCota) then
                  Raise Exception.Create('Não foi possível montar a busca da transferência por Lote.');

               //Efetua a Transferência de acréscimo
               QryBuscaTransfLote.First;
               while not QryBuscaTransfLote.Eof do
               begin
                  sMens := '';
                  //AL_203
                  QryBuscaSaldo.First;
                  //Ricardo Cristiano - 09/12/2008 - N. Sol 100716 -  N. Kintana 447117
                  if QryBuscaTransfLote.FieldByName('DATAVENCIMENTO').AsDateTime <> 0 then
                  begin
                     if not QryBuscaSaldo.Locate('DATAAPLICACAO',QryBuscaTransfLote.FieldByName('DATAVENCIMENTO').AsDateTime,[]) then
                        Raise Exception.Create('Divergência de Saldo, por favor atualizar o dia anterior.');
                  end
                  else
                  begin
                     if not QryBuscaSaldo.Locate('IDOPERACAOFUNDO',QryBuscaTransfLote.FieldByName('IDOPERACAOORIGEM').AsInteger,[]) then
                        Raise Exception.Create('Divergência de Saldo, por favor atualizar o dia anterior.');
                  end;

                  DadosCota := BuscaCotaFundo(QryAuxLocal,
                                              QryBuscaTransfLote.FieldByName('IDFUNDOINVEST').AsInteger,
                                              QryBuscaSaldo.FieldByName('DATAAPLICACAO').AsDateTime,
                                              OperComum.IIF((iTipoCota > 0), iTipoCota, -1));
                  //Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
                  //AL_203
                  if not AlimentaFundo(iTipoInvest,
                                        -108,
                                       QryBuscaTransfLote.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       QryBuscaTransfLote.FieldByName('IDFUNDOINVEST').AsInteger,
                                       QryBuscaTransfLote.FieldByName('IDPLANOPREV').AsInteger,
                                       QryBuscaTransfLote.FieldByName('IDPATRO').AsInteger,
                                       QryBuscaTransfLote.FieldByName('IDOPERACAOFUNDO').AsInteger {iIdOperacaoOrigemdoFundoDestino},
                                       QryBuscaTransfLote.FieldByName('IDOPERACAOORIGEM').AsInteger {idoperacaofundo},
                                       QryBuscaTransfLote.FieldByName('QTDDECQTD').AsInteger {iQtdDecCotas},
                                       iTipoFundoInvest,
                                       -1{iForCli},
                                       QryBuscaSaldo.FieldByName('DATAAPLICACAO').AsDateTime{Aplicacao},
                                       QryBuscaTransfLote.FieldByName('DATAOPERACAO').AsDateTime {Operacao},
                                       QryBuscaTransfLote.FieldByName('DATAOPERACAO').AsDateTime {Liquidacao},
                                       QryBuscaTransfLote.FieldByName('QTDOPERACAO').AsFloat{Quantidade},
                                       DadosCota.VlrCota{CotaAplicacao},
                                       QryBuscaTransfLote.FieldByName('VLROPERACAO').AsFloat{Valor},
                                       0{Irrf},
                                       QryBuscaTransfLote.FieldByName('VLRIOF').AsFloat{Iof},
                                       QryBuscaTransfLote.FieldByName('NATUREZAOPERACAO').AsString {sNaturezaS},
                                       QryBuscaTransfLote.FieldByName('DESCTIPOOPERACAO').AsString+' / '+QryBuscaTransfLote.FieldByName('DESCFUNDOINVEST').AsString,
                                       'TRP', True,
                                       QryBuscaTransfLote.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                       -1,
                                       -1,
                                       0 {Variacao}, sMens,
                                       OperComum.IIF((QryBuscaTransfLote.FieldByName('IDTIPOCOTA').AsInteger > 0), QryBuscaTransfLote.FieldByName('IDTIPOCOTA').AsInteger, -1){idTipoCota},
                                       RoundCM(QryBuscaSaldo.FieldByName('VLRAPLICADO').AsFloat*
                                              (QryBuscaTransfLote.FieldByName('PERCENTUAL').AsFloat/100),2){VlrAplicado}) Then
                  begin
                     if sMens <> '' then
                        Raise Exception.Create('Não foi possível confirmar a operação de Destino.' + #13 +
                                               'Mensagem: ' + sMens)
                     else
                        Raise Exception.Create('Não foi possível confirmar a operação de Destino.' + #13 +
                                               'Ocorreu um problema durante o processo de gravação' + #13 +
                                               'Refaça a operação');
                  end;
                  QryBuscaTransfLote.Next;
               end;
               QryVerTransfPlanosLote.Next;
            end;
//Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
            //AL_203
{            if not QryVerTransfPlanosLote.IsEmpty then
            begin
               if Not AtualizaSaldoFundos(iTipoInvest, iTipoFundoInvest, iFundoInvest, -1,
                                          dDataProcesso, bMostraMsg, False, iTipoCota) Then
                  Raise Exception.Create('Não foi possível atualizar o Saldo após a operação de "Transferência entre Planos".')
            end;      }
            //AL_199 - fim
            Result := True;
         end;
      Except
         On E:Exception Do
         Begin
            if bMostraMsg then
               MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         end;
      end;
   Finally
      OperComum.LimpaParametros(DmFundoComum.QryVerTransfPlanosLote);
      //AL_199
      QryBuscaTransfLote.Close;
      FreeAndNil(QryBuscaTransfLote);

      QryBuscaSaldo.Close;
      FreeAndNil(QryBuscaSaldo);

      QryAuxLocal.Close;
      FreeAndNil(QryAuxLocal);
   End;
End;

//Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
//AL_203
//AL_199
Function MontaBuscaTransfLote(iTipoInvest, iFundoInvest, iTipoFundoInvest, iTipoOperacao : Integer;
                              dDataProcesso : TDateTime;
                              sLote : String;
                              const QryBuscaTransfLote : TwwQuery;
                              iTipoCota : Integer = -1) : Boolean;
begin
   try
      QryBuscaTransfLote.SQL.Clear;
      QryBuscaTransfLote.SQL.add(' SELECT');
//Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
      QryBuscaTransfLote.SQL.add('     OP.DATAOPERACAO,');
      QryBuscaTransfLote.SQL.add('     OP.IDLOTE,');
      QryBuscaTransfLote.SQL.add('     OP.IDFUNDOINVEST,');
      QryBuscaTransfLote.SQL.add('     OP.IDOPERACAOORIGEM,');
      QryBuscaTransfLote.SQL.add('     OP.IDOPERACAOFUNDO, ');
      QryBuscaTransfLote.SQL.add('     FI.DESCFUNDOINVEST,');
      QryBuscaTransfLote.SQL.add('     FI.QTDDECVALOR,');
      QryBuscaTransfLote.SQL.add('     FI.QTDDECQTD,');
      QryBuscaTransfLote.SQL.add('     FI.IDCARTEIRAINVEST,');
      QryBuscaTransfLote.SQL.add('     OP.VLROPERACAO,');
      QryBuscaTransfLote.SQL.add('     OP.QTDOPERACAO,');
      QryBuscaTransfLote.SQL.add('     OP.VLRIOF,');
      QryBuscaTransfLote.SQL.add('     OP.IDTIPOCOTA,');
      QryBuscaTransfLote.SQL.add('     OP.IDTIPOOPERACAO,');
      QryBuscaTransfLote.SQL.add('     TP.DESCTIPOOPERACAO,');
      QryBuscaTransfLote.SQL.add('     TP.NATUREZAOPERACAO,');
      QryBuscaTransfLote.SQL.add('     OP.IDPLANPREVCTBPATR,');
      QryBuscaTransfLote.SQL.add('     PL.PLANPRVCONTABPATRO,');
      QryBuscaTransfLote.SQL.add('     PL.IDPLANOPREV,');
      QryBuscaTransfLote.SQL.add('     PL.IDPATRO,');
      QryBuscaTransfLote.SQL.add('     OP.PERCENTUAL,');
      //Ricardo Cristiano - 09/12/2008 - N. Sol 100716 -  N. Kintana 447117
      QryBuscaTransfLote.SQL.add('     OP.DATAVENCIMENTO');
      QryBuscaTransfLote.SQL.add(' FROM');
      QryBuscaTransfLote.SQL.add('     OPERACAOFUNDO     OP,');
      QryBuscaTransfLote.SQL.add('     TIPOOPERACAO      TP,');
      QryBuscaTransfLote.SQL.add('     VWPLANPREVCTBPATR PL,');
      QryBuscaTransfLote.SQL.add('    (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.IDCARTEIRAINVEST,HF1.QTDDECVALOR,HF1.QTDDECQTD,HF1.DESCFUNDOINVEST');
      QryBuscaTransfLote.SQL.add('     FROM   HISTFUNDOINVEST HF1');
      QryBuscaTransfLote.SQL.add('     WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN');
      QryBuscaTransfLote.SQL.add('                    (SELECT HF2.IDFUNDOINVEST || TO_CHAR(MAX(HF2.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'')');
      QryBuscaTransfLote.SQL.add('                     FROM HISTFUNDOINVEST HF2, TIPOFUNDOINVEST TF');
      QryBuscaTransfLote.SQL.add('                     WHERE');
      QryBuscaTransfLote.SQL.add('                         (TF.IDTIPOINVEST       = '+IntToStr(iTipoInvest)+')');
      QryBuscaTransfLote.SQL.add('                     AND (TF.IDTIPOFUNDOINVEST  = '+IntToStr(iTipoFundoInvest)+')');
      QryBuscaTransfLote.SQL.add('                     AND (HF2.IDFUNDOINVEST      = '+IntToStr(iFundoInvest)+')');
      QryBuscaTransfLote.SQL.add('                     AND (TRUNC(HF2.DTAVIGENCIA) < TO_DATE('+QuotedStr(datetostr(dDataProcesso))+',''DD/MM/YYYY'')+1)');
      QryBuscaTransfLote.SQL.add('                     AND (HF2.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)');
      QryBuscaTransfLote.SQL.add('                     GROUP BY HF2.IDFUNDOINVEST, HF2.IDTIPOFUNDOINVEST) ) ) FI ');
      QryBuscaTransfLote.SQL.add(' WHERE');
      QryBuscaTransfLote.SQL.add('     OP.IDTIPOINVEST      = '+IntToStr(iTipoInvest)+'');
//Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
      QryBuscaTransfLote.SQL.add(' AND OP.IDTIPOOPERACAO    = '+IntToStr(iTipoOperacao)+'');
      QryBuscaTransfLote.SQL.add(' AND OP.IDFUNDOINVEST     = '+IntToStr(iFundoInvest));
      QryBuscaTransfLote.SQL.add(' AND OP.DATAOPERACAO      = TO_DATE('+QuotedStr(datetostr(dDataProcesso))+',''DD/MM/YYYY'')');
      //AL_206
      if sLote <> '' then
         QryBuscaTransfLote.SQL.add(' AND OP.IDLOTE            = '+QuotedStr(sLote));
      if iTipoCota > 0 then
         QryBuscaTransfLote.SQL.add(' AND OP.IDTIPOCOTA        = '+IntToStr(iTipoCota));
      QryBuscaTransfLote.SQL.add(' AND TP.IDTIPOINVEST      = OP.IDTIPOINVEST');
      QryBuscaTransfLote.SQL.add(' AND TP.IDTIPOOPERACAO    = OP.IDTIPOOPERACAO');
      QryBuscaTransfLote.SQL.add(' AND OP.IDPLANPREVCTBPATR = PL.IDPLANPREVCTBPATR');
      QryBuscaTransfLote.SQL.add(' AND OP.IDFUNDOINVEST     = FI.IDFUNDOINVEST');
      QryBuscaTransfLote.SQL.add(' ORDER BY OP.IDLOTE, OP.IDOPERACAOFUNDO, OP.IDTIPOCOTA');
      QryBuscaTransfLote.Open;
      Result := True;
   except
      Result := False;
   end;
end;

//AL_203
Function MontaBuscaSaldo(iTipoInvest, iFundoInvest, iTipoFundoInvest : Integer;
                         dDataProcesso : TDateTime;
                         const QryBuscaSaldo : TwwQuery;
                         iTipoCota : Integer = -1) : Boolean;
begin
   try
      QryBuscaSaldo.SQL.Clear;
      QryBuscaSaldo.SQL.add(' SELECT H.IDTIPOINVEST,');
      QryBuscaSaldo.SQL.add('        H.IDPLANPREVCTBPATR,');
      QryBuscaSaldo.SQL.add('        H.IDFUNDOINVEST,');
      QryBuscaSaldo.SQL.add('        H.DATAAPLICACAO,');
      QryBuscaSaldo.SQL.add('        H.DATAMOVFUNDO,');
      QryBuscaSaldo.SQL.add('        H.IDOPERACAOFUNDO,');
      QryBuscaSaldo.SQL.add('        H.SALDOVLRFUNDO,');
      //Ricardo Cristiano - 09/12/2008 - N. Sol 100716 -  N. Kintana 447117
      QryBuscaSaldo.SQL.add('        H.SALDOQTDCOTAS,');
      QryBuscaSaldo.SQL.add('        H.VLRAPLICADO,');
      QryBuscaSaldo.SQL.add('        H.IDTIPOCOTA');
      QryBuscaSaldo.SQL.add(' FROM HISTFUNDO H, ');
//Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
      QryBuscaSaldo.SQL.add('     (SELECT MAX(HI.IDHISTFUNDO) AS IDHISTFUNDO');
      QryBuscaSaldo.SQL.add('      FROM HISTFUNDO HI, ');
      QryBuscaSaldo.SQL.add('          (SELECT T.IDTIPOINVEST, T.IDTIPOOPERACAO');
      QryBuscaSaldo.SQL.add('           FROM TIPOOPERACAO T');
      QryBuscaSaldo.SQL.add('           WHERE');
      QryBuscaSaldo.SQL.add('               (T.IDTIPOINVEST      = '+IntToStr(iTipoInvest)+')');
      QryBuscaSaldo.SQL.add('           AND (T.NATUREZAOPERACAO <> ''R'')) TP');
      QryBuscaSaldo.SQL.add('      WHERE');
      QryBuscaSaldo.SQL.add('          (HI.IDTIPOINVEST       = '+IntToStr(iTipoInvest)+')');
      QryBuscaSaldo.SQL.add('      AND (HI.IDPLANPREVCTBPATR  > 0)');
      QryBuscaSaldo.SQL.add('      AND (HI.IDFUNDOINVEST      = '+IntToStr(iFundoInvest)+')');
      QryBuscaSaldo.SQL.add('      AND (HI.DATAAPLICACAO      < TO_DATE('+QuotedStr(datetostr(dDataProcesso))+',''DD/MM/YYYY''))');
      QryBuscaSaldo.SQL.add('      AND (HI.DATAMOVFUNDO       < TO_DATE('+QuotedStr(datetostr(dDataProcesso))+',''DD/MM/YYYY''))');
      if iTipoCota > 0 then
         QryBuscaSaldo.SQL.add('      AND (HI.IDTIPOCOTA         = '+IntToStr(iTipoCota)+')');
      QryBuscaSaldo.SQL.add('      AND (HI.TIPMOVFUNDO       <> ''PIR'')');
      QryBuscaSaldo.SQL.add('      AND (TP.IDTIPOINVEST       = HI.IDTIPOINVEST)');
      QryBuscaSaldo.SQL.add('      AND (TP.IDTIPOOPERACAO     = HI.IDTIPOOPERACAO)');
      QryBuscaSaldo.SQL.add('      GROUP BY  HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINVEST, ');
      QryBuscaSaldo.SQL.add('                HI.DATAAPLICACAO, HI.IDTIPOCOTA) HMAX');
      QryBuscaSaldo.SQL.add(' WHERE');
      QryBuscaSaldo.SQL.add('     H.IDHISTFUNDO = HMAX.IDHISTFUNDO');
      QryBuscaSaldo.Open;
      Result := True;
   except
      Result := False;
   end;
end;

//AL_207
function VerificaTranferenciaPlanos(iTipoInvest, iFundoInvest,iPlanoPatro: Integer;
                                    dDataOperacao: TDateTime;
                                    iTipoCota: Integer = -1) : Boolean;
Var
  QryVerificaTransfPlanos : TwwQuery;
begin
   QryVerificaTransfPlanos := TwwQuery.Create(Application);
   QryVerificaTransfPlanos.DatabaseName := 'BaseDados';
   Opercomum.LimpaParametros(QryVerificaTransfPlanos);
   QryVerificaTransfPlanos.Close;
   QryVerificaTransfPlanos.Sql.Clear;
//Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
   QryVerificaTransfPlanos.Sql.Add('SELECT OPERACAOFUNDO.IDOPERACAOFUNDO');
   QryVerificaTransfPlanos.Sql.Add('FROM OPERACAOFUNDO ');
   QryVerificaTransfPlanos.Sql.Add('WHERE OPERACAOFUNDO.IDTIPOOPERACAO    = -107 AND');
   QryVerificaTransfPlanos.Sql.Add('      OPERACAOFUNDO.IDTIPOINVEST      = '+IntToStr(iTipoInvest)+ ' AND');
   QryVerificaTransfPlanos.Sql.Add('      OPERACAOFUNDO.IDFUNDOINVEST     = '+IntToStr(iFundoInvest)+ ' AND');
   QryVerificaTransfPlanos.Sql.Add('      OPERACAOFUNDO.IDPLANPREVCTBPATR = '+IntToStr(iPlanoPatro)+ ' AND');
   If iTipoCota <> - 1 then
      QryVerificaTransfPlanos.Sql.Add('      OPERACAOFUNDO.IDTIPOCOTA        = '+IntToStr(iTipoCota)+ ' AND');
   QryVerificaTransfPlanos.Sql.Add('      OPERACAOFUNDO.DATAOPERACAO      > TO_DATE('+QuotedStr(datetostr(dDataOperacao))+',''DD/MM/YYYY'')');
   QryVerificaTransfPlanos.Open;
   If QryVerificaTransfPlanos.recordcount > 0 then
      Result := True
   else
      Result := False;

   QryVerificaTransfPlanos.Close;
   FreeAndNil(QryVerificaTransfPlanos);
end;

//Ricardo Cristiano - 28/10/2008 - N. Sol 99367 -  N. Kintana 435730
function TransfTipoFundo(iTipoInvest, iFundoInvest, iTipoFundoInvest :  Integer;
                         dDataProcesso : TDateTime;
                         bMostraMsg : Boolean;
                         iTipoCota  : Integer = -1): Boolean;
var sMens : String;
begin
   try
      try
         with DmFundoComum do
         begin
            OperComum.LimpaParametros(DmFundoComum.QryBuscaTransfTipoFundo);
            QryBuscaTransfTipoFundo.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvest;
            QryBuscaTransfTipoFundo.ParamByName('IDFUNDOINVEST').AsInteger := iFundoInvest;
            QryBuscaTransfTipoFundo.ParamByName('DATAOPERACAO').AsString   := DateToStr(dDataProcesso);
            if iTipoCota > 0 then
                QryBuscaTransfTipoFundo.ParamByName('IDTIPOCOTA').AsInteger := iTipoCota;
            QryBuscaTransfTipoFundo.Open;
                                                            
            while not QryBuscaTransfTipoFundo.Eof do
            begin
               OperComum.LimpaParametros(DmFundoComum.QryAux);
               QryAux.SQL.Clear;
               QryAux.SQL.Add('SELECT P.IDPLANOPREV, P.IDPATRO FROM VWPLANPREVCTBPATR P ');
               QryAux.SQL.Add('WHERE (P.IDPLANPREVCTBPATR = ' +
                               QryBuscaTransfTipoFundo.FieldByName('IDPLANPREVCTBPATR').AsString +') ');
               QryAux.Open;

               if not AlimentaFundo(QryBuscaTransfTipoFundo.FieldByName('IDTIPOINVEST').AsInteger,
                                    QryBuscaTransfTipoFundo.FieldByName('IDTIPOOPERACAO').AsInteger,
                                    QryBuscaTransfTipoFundo.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    QryBuscaTransfTipoFundo.FieldByName('IDFUNDOINVEST').AsInteger,
                                    QryAux.FieldByName('IDPLANOPREV').AsInteger,
                                    QryAux.FieldByName('IDPATRO').AsInteger,
                                    QryBuscaTransfTipoFundo.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                    QryBuscaTransfTipoFundo.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                    QryBuscaTransfTipoFundo.FieldByName('QTDDECVALOR').AsInteger,
                                    QryBuscaTransfTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                    -1,
                                    QryBuscaTransfTipoFundo.FieldByName('DATAAPLICACAO').AsDateTime,
                                    dDataProcesso,
                                    dDataProcesso,
                                    QryBuscaTransfTipoFundo.FieldByName('QTDOPERACAO').AsFloat,
                                    0,
                                    QryBuscaTransfTipoFundo.FieldByName('VLROPERACAO').AsFloat,
                                    0,
                                    0,
                                    QryBuscaTransfTipoFundo.FieldByName('NATUREZAOPERACAO').AsString,
                                    Trim(QryBuscaTransfTipoFundo.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                         QryBuscaTransfTipoFundo.FieldByName('DESCFUNDOINVEST').AsString,
                                    'TRT', True,
                                    QryBuscaTransfTipoFundo.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                    -1, -1, 0, sMens, iTipoCota) Then
               begin
                  if sMens <> '' then
                     Raise Exception.Create('Não foi possível confirmar a Baixa por Transferência de Tipo de Fundo.' + #13 +
                                            'Mensagem: ' + sMens)
                  else
                     Raise Exception.Create('Não foi possível confirmar a Baixa por Transferência de Tipo de Fundo.' + #13 +
                                            'Ocorreu um problema durante o processo de gravação.');
               end;

               QryBuscaTransfTipoFundo.Next;
            end;
         end;
         Result := True;
      except
         On E:Exception Do
         Begin
            if bMostraMsg then
               MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         end; 
      end;
   finally
      OperComum.LimpaParametros(DmFundoComum.QryBuscaTransfTipoFundo);
      OperComum.LimpaParametros(DmFundoComum.QryAux);
   end;
end;

//Ricardo Cristiano - 28/11/2008 - N. Sol 99876 -  N. Kintana 441255
function TransfCotaIntegr(iTipoInvest, iFundoInvest, iTipoFundoInvest :  Integer;
                          dDataProcesso : TDateTime;
                          bMostraMsg : Boolean;
                          iTipoCota  : Integer = -1): Boolean;
var sMens : String;
begin
   try
      try
         with DmFundoComum do
         begin
            OperComum.LimpaParametros(DmFundoComum.QryBuscaTransfCotaIntegr);
            QryBuscaTransfCotaIntegr.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvest;
            QryBuscaTransfCotaIntegr.ParamByName('IDFUNDOINVEST').AsInteger := iFundoInvest;
            QryBuscaTransfCotaIntegr.ParamByName('DATAOPERACAO').AsString   := DateToStr(dDataProcesso);
            if iTipoCota > 0 then
                QryBuscaTransfCotaIntegr.ParamByName('IDTIPOCOTA').AsInteger := iTipoCota;
            QryBuscaTransfCotaIntegr.Open;

            while not QryBuscaTransfCotaIntegr.Eof do
            begin
               //Transferência Saída-------------------------------------------------------------------------------------
               if (QryBuscaTransfCotaIntegr.FieldByName('IDTIPOOPERACAO').AsInteger = -165) then
               begin
              OperComum.LimpaParametros(DmFundoComum.QryBuscaSaldoCotaIntegr);
              QryBuscaSaldoCotaIntegr.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvest;
              QryBuscaSaldoCotaIntegr.ParamByName('IDFUNDOINVEST').AsInteger := iFundoInvest;
              QryBuscaSaldoCotaIntegr.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                      QryBuscaTransfCotaIntegr.FieldByName('IDPLANPREVCTBPATR').AsInteger;
              QryBuscaSaldoCotaIntegr.ParamByName('IDOPERACAOFUNDO').AsInteger :=
                                      QryBuscaTransfCotaIntegr.FieldByName('IDOPERACAOORIGEM').AsInteger;
              QryBuscaSaldoCotaIntegr.ParamByName('DATAMOVFUNDO').AsString   := DateToStr(dDataProcesso);
              if iTipoCota > 0 then
                QryBuscaSaldoCotaIntegr.ParamByName('IDTIPOCOTA').AsInteger := iTipoCota;
              QryBuscaSaldoCotaIntegr.Open;

                    if not GravaHistCotaIntegraliza(iTipoInvest,
                                                    iFundoInvest,
                                                    OperComum.IIF((iTipoCota > 0), iTipoCota, -1),
                                                    -1,-1,-1,
                                                    QryBuscaTransfCotaIntegr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                    QryBuscaTransfCotaIntegr.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                                    dDataProcesso,
                                                    QryBuscaSaldoCotaIntegr.FieldByName('DATAAPLICACAO').AsDateTime,
                                                    QryBuscaSaldoCotaIntegr.FieldByName('SALDOVLRFUNDO').AsFloat-
                                                       QryBuscaTransfCotaIntegr.FieldByName('VLROPERACAO').AsFloat,
                                                    QryBuscaSaldoCotaIntegr.FieldByName('SALDOQTDCOTAS').AsFloat-
                                                       QryBuscaTransfCotaIntegr.FieldByName('QTDOPERACAO').AsFloat,
                                                    QryBuscaTransfCotaIntegr.FieldByName('QTDOPERACAO').AsFloat,
                                                    QryBuscaSaldoCotaIntegr.FieldByName('VLRCOTAINTEGR').AsFloat,
                                                  0, 'TRP') then
                       Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');

                    if not GravaHistCotaIntegraliza(iTipoInvest,
                                                    iFundoInvest,
                                                    OperComum.IIF((iTipoCota > 0), iTipoCota, -1),
                                                    -1,-1,-1,
                                                    QryBuscaTransfCotaIntegr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                    QryBuscaTransfCotaIntegr.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                                    dDataProcesso,
                                                    QryBuscaSaldoCotaIntegr.FieldByName('DATAAPLICACAO').AsDateTime,
                                                    QryBuscaSaldoCotaIntegr.FieldByName('SALDOVLRFUNDO').AsFloat-
                                                       QryBuscaTransfCotaIntegr.FieldByName('VLROPERACAO').AsFloat,
                                                    QryBuscaSaldoCotaIntegr.FieldByName('SALDOQTDCOTAS').AsFloat-
                                                       QryBuscaTransfCotaIntegr.FieldByName('QTDOPERACAO').AsFloat,
                                                    0,
                                                    QryBuscaSaldoCotaIntegr.FieldByName('VLRCOTAINTEGR').AsFloat,
                                                    0, 'ATU') then
                    Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');
               end
               else
               begin
               //Transferência Entrada ----------------------------------------------------------------------------------
                  if not GravaHistCotaIntegraliza(iTipoInvest,
                                                  iFundoInvest,
                                                  OperComum.IIF((iTipoCota > 0), iTipoCota, -1),
                                                  -1,-1,-1,
                                                  QryBuscaTransfCotaIntegr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                  QryBuscaTransfCotaIntegr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                                  dDataProcesso,
                                                  QryBuscaSaldoCotaIntegr.FieldByName('DATAAPLICACAO').AsDateTime,
                                                  QryBuscaTransfCotaIntegr.FieldByName('VLROPERACAO').AsFloat,
                                                  QryBuscaTransfCotaIntegr.FieldByName('QTDOPERACAO').AsFloat,
                                                  QryBuscaTransfCotaIntegr.FieldByName('QTDOPERACAO').AsFloat,
                                                  QryBuscaSaldoCotaIntegr.FieldByName('VLRCOTAINTEGR').AsFloat,
                                                  0, 'TRP') then
                     Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');

                   //Ricardo Cristiano - 02/12/2008 - N. Sol 102784 -  N. Kintana 457223
{                  if not GravaHistCotaIntegraliza(iTipoInvest,
                                                  iFundoInvest,
                                                  OperComum.IIF((iTipoCota > 0), iTipoCota, -1),
                                                  -1,-1,-1,
                                                  QryBuscaTransfCotaIntegr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                  QryBuscaTransfCotaIntegr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                                  dDataProcesso,
                                                  QryBuscaSaldoCotaIntegr.FieldByName('DATAAPLICACAO').AsDateTime,
                                                  QryBuscaTransfCotaIntegr.FieldByName('VLROPERACAO').AsFloat,
                                                  QryBuscaTransfCotaIntegr.FieldByName('QTDOPERACAO').AsFloat,
                                                  0,
                                                  QryBuscaSaldoCotaIntegr.FieldByName('VLRCOTAINTEGR').AsFloat,
                                                  0, 'ATU') then
                     Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');}

                    //Ricardo Cristiano - 02/12/2008 - N. Sol 102784 -  N. Kintana 457223
                    if not PesqAplicIntegr(iTipoInvestUsu,
                                           iFundoInvest,
                                           QryBuscaTransfCotaIntegr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                           QryBuscaTransfCotaIntegr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                           QryBuscaSaldoCotaIntegr.FieldByName('DATAAPLICACAO').AsDateTime,
                                           dDataProcesso ,
                                           QryBuscaSaldoCotaIntegr.FieldByName('VLRCOTAINTEGR').AsFloat,
                                           QryBuscaTransfCotaIntegr.FieldByName('VLROPERACAO').AsFloat,
                                           QryBuscaTransfCotaIntegr.FieldByName('QTDOPERACAO').AsFloat
                                           OperComum.IIF((iTipoCota > 0), iTipoCota, -1)) then
                       Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');
               end;

               QryBuscaTransfCotaIntegr.Next;
            end;
         end;
         Result := True;
      except
         On E:Exception Do
         Begin
            if bMostraMsg then
               MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         end;
      end;
   finally
      OperComum.LimpaParametros(DmFundoComum.QryBuscaTransfTipoFundo);
      OperComum.LimpaParametros(DmFundoComum.QryAux);
   end;
end;

function TransfHistCotaIntegr(iTipoInvest, iFundoInvest:  Integer;
                          dDataProcesso : TDateTime;
                          bMostraMsg : Boolean;
                          iTipoCota  : Integer = -1): Boolean;
var sMens : String;
begin
   //TIPO DE OPERAÇÃO -190 E -191 = TRANSFERENCIA DE TIPOS DE FUNDOS
   try
      try
         with DmFundoComum do
         begin
            OperComum.LimpaParametros(DmFundoComum.QryBuscaTransfCotaIntegr);
            QryBuscaTransfCotaIntegr.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvest;
            QryBuscaTransfCotaIntegr.ParamByName('IDFUNDOINVEST').AsInteger := iFundoInvest;
            QryBuscaTransfCotaIntegr.ParamByName('DATAOPERACAO').AsString   := DateToStr(dDataProcesso);
            if iTipoCota > 0 then
                QryBuscaTransfCotaIntegr.ParamByName('IDTIPOCOTA').AsInteger := iTipoCota;
            QryBuscaTransfCotaIntegr.Open;

            while not QryBuscaTransfCotaIntegr.Eof do
            begin
              OperComum.LimpaParametros(DmFundoComum.QryBuscaSaldoCotaIntegr);
              QryBuscaSaldoCotaIntegr.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvest;
              QryBuscaSaldoCotaIntegr.ParamByName('IDFUNDOINVEST').AsInteger := iFundoInvest;
              QryBuscaSaldoCotaIntegr.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                      QryBuscaTransfCotaIntegr.FieldByName('IDPLANPREVCTBPATR').AsInteger;
              QryBuscaSaldoCotaIntegr.ParamByName('IDOPERACAOFUNDO').AsInteger :=
                                      QryBuscaTransfCotaIntegr.FieldByName('IDOPERACAOORIGEM').AsInteger;
              QryBuscaSaldoCotaIntegr.ParamByName('DATAMOVFUNDO').AsString   := DateToStr(dDataProcesso);
              if iTipoCota > 0 then
                QryBuscaSaldoCotaIntegr.ParamByName('IDTIPOCOTA').AsInteger := iTipoCota;
              QryBuscaSaldoCotaIntegr.Open;

               //Transferência Saída-------------------------------------------------------------------------------------
               if (QryBuscaTransfCotaIntegr.FieldByName('IDTIPOOPERACAO').AsInteger = -190) then
               begin

                    if not GravaHistCotaIntegraliza(iTipoInvest,
                                                    iFundoInvest,
                                                    OperComum.IIF((iTipoCota > 0), iTipoCota, -1),
                                                    -1,-1,-1,
                                                    QryBuscaTransfCotaIntegr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                    QryBuscaTransfCotaIntegr.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                                    dDataProcesso,
                                                    QryBuscaSaldoCotaIntegr.FieldByName('DATAAPLICACAO').AsDateTime,
                                                    0,
                                                    0,
                                                    0,
                                                    0,
                                                    0,
                                                    'TRT')
                                                     then
                       Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');
               end
               else if (QryBuscaTransfCotaIntegr.FieldByName('IDTIPOOPERACAO').AsInteger = -191) then
               begin
               //Transferência Entrada ----------------------------------------------------------------------------------
                  if not GravaHistCotaIntegraliza(iTipoInvest,
                                                  iFundoInvest,
                                                  OperComum.IIF((iTipoCota > 0), iTipoCota, -1),
                                                  -1,-1,-1,
                                                  QryBuscaTransfCotaIntegr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                  QryBuscaTransfCotaIntegr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                                  dDataProcesso,
                                                  QryBuscaSaldoCotaIntegr.FieldByName('DATAAPLICACAO').AsDateTime,
                                                  QryBuscaTransfCotaIntegr.FieldByName('VLROPERACAO').AsFloat,
                                                  QryBuscaTransfCotaIntegr.FieldByName('QTDOPERACAO').AsFloat,
                                                  QryBuscaTransfCotaIntegr.FieldByName('QTDOPERACAO').AsFloat,
                                                  QryBuscaSaldoCotaIntegr.FieldByName('VLRCOTAINTEGR').AsFloat,
                                                  QryBuscaSaldoCotaIntegr.FieldByName('VLRVARIACAODIA').AsFloat,
                                                  'TRT')
                                                   then
                     Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');

                   //Ricardo Cristiano - 02/12/2008 - N. Sol 102784 -  N. Kintana 457223
{                  if not GravaHistCotaIntegraliza(iTipoInvest,
                                                  iFundoInvest,
                                                  OperComum.IIF((iTipoCota > 0), iTipoCota, -1),
                                                  -1,-1,-1,
                                                  QryBuscaTransfCotaIntegr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                  QryBuscaTransfCotaIntegr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                                  dDataProcesso,
                                                  QryBuscaSaldoCotaIntegr.FieldByName('DATAAPLICACAO').AsDateTime,
                                                  QryBuscaTransfCotaIntegr.FieldByName('VLROPERACAO').AsFloat,
                                                  QryBuscaTransfCotaIntegr.FieldByName('QTDOPERACAO').AsFloat,
                                                  0,
                                                  QryBuscaSaldoCotaIntegr.FieldByName('VLRCOTAINTEGR').AsFloat,
                                                  0, 'ATU') then
                     Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');

                  if not(QryBuscaTransfCotaIntegr.FieldByName('IDTIPOOPERACAO').AsInteger = -191) then
                    //Ricardo Cristiano - 02/12/2008 - N. Sol 102784 -  N. Kintana 457223
                    if not PesqAplicIntegr(iTipoInvestUsu,
                                           iFundoInvest,
                                           QryBuscaTransfCotaIntegr.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                           QryBuscaTransfCotaIntegr.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                           QryBuscaSaldoCotaIntegr.FieldByName('DATAAPLICACAO').AsDateTime,
                                           dDataProcesso ,
                                           QryBuscaSaldoCotaIntegr.FieldByName('VLRCOTAINTEGR').AsFloat,
                                           QryBuscaTransfCotaIntegr.FieldByName('VLROPERACAO').AsFloat,
                                           QryBuscaTransfCotaIntegr.FieldByName('QTDOPERACAO').AsFloat
                                           OperComum.IIF((iTipoCota > 0), iTipoCota, -1)) then
                       Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');}
               end;

               QryBuscaTransfCotaIntegr.Next;
            end;
         end;
         Result := True;
      except
         On E:Exception Do
         Begin
            if bMostraMsg then
               MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         end;
      end;
   finally
      OperComum.LimpaParametros(DmFundoComum.QryBuscaTransfTipoFundo);
      OperComum.LimpaParametros(DmFundoComum.QryAux);
   end;
end;

//Ricardo Cristiano - 02/12/2008 - N. Sol 102784 -  N. Kintana 457223
//Ricardo Cristiano - 28/11/2008 - N. Sol 99876 -  N. Kintana 441255
function PesqAplicIntegr(iTipoInvest, iFundo, iOperacao, iiPlanPrevCtbPatro  : integer;
                         dDataApl, dDataOper : TDateTime;
                         fValorCota, fValorOper, fQtdOper : Double;
                         iTipoCota  : Integer = -1) : boolean;
var
   ftotvlrhist, ftotqtdhist, ftotvlrvar, ftotqtdmov : Extended;
begin
   try
      try
         OperComum.LimpaParametros(DmFundoComum.QryAjustaAplicIntegr);
         DmFundoComum.QryAjustaAplicIntegr.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvest;
         DmFundoComum.QryAjustaAplicIntegr.ParamByName('IDFUNDOINVEST').AsInteger     := iFundo;
         DmFundoComum.QryAjustaAplicIntegr.ParamByName('DATAAPLICACAO').AsString      := DateToStr(dDataApl);
         DmFundoComum.QryAjustaAplicIntegr.ParamByName('DATAHISTCOTAINTEG').AsString  := DateToStr(dDataOper);
         DmFundoComum.QryAjustaAplicIntegr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iiPlanPrevCtbPatro;
         if iTipoCota > 0 then
            DmFundoComum.QryAjustaAplicIntegr.ParamByName('IDTIPOCOTA').AsInteger     := iTipoCota;
         DmFundoComum.QryAjustaAplicIntegr.Open;

         //Ricardo Cristiano - 02/12/2008 - N. Sol 102784 -  N. Kintana 457223
         if (not DmFundoComum.QryAjustaAplicIntegr.IsEmpty) then
         begin
            ftotvlrhist:= fValorOper;
            ftotqtdhist:= fQtdOper;
            ftotvlrvar := 0;
            ftotqtdmov := fQtdOper;

            while not (DmFundoComum.QryAjustaAplicIntegr.Eof) do
            begin
               // SOMA A TRANSFERENCIA AO SALDO
               ftotvlrhist:= ftotvlrhist + DmFundoComum.QryAjustaAplicIntegr.FieldByName('VLRHISTCOTAINTEGR').AsFloat;
               ftotqtdhist:= ftotqtdhist + DmFundoComum.QryAjustaAplicIntegr.FieldByName('QTDHISTCOTAINTEGR').AsFloat;
               ftotvlrvar := ftotvlrvar  + DmFundoComum.QryAjustaAplicIntegr.FieldByName('VLRVARIACAODIA').AsFloat;
               ftotqtdmov := ftotqtdmov  + DmFundoComum.QryAjustaAplicIntegr.FieldByName('QTDMOVCOTAINTEGR').AsFloat;

               iOperacao  := DmFundoComum.QryAjustaAplicIntegr.FieldByName('IDOPERACAOFUNDO').AsInteger;
               fValorCota := DmFundoComum.QryAjustaAplicIntegr.FieldByName('VLRCOTAINTEGR').AsFloat;
               DmFundoComum.QryAjustaAplicIntegr.Next;
            end;

            if ftotqtdhist > 0 then                                                                                            
            begin
            //GRAVA NA HISTFUNDO O SALDO ATUALIZADO.
            if not GravaHistCotaIntegraliza(iTipoInvest, iFundo, iTipoCota,
                                            -1,-1,-1,
                                            iiPlanPrevCtbPatro, iOperacao,
                                            dDataOper, dDataApl,
                                            ftotvlrhist, ftotqtdhist, ftotqtdmov,
                                            fValorCota,  ftotvlrvar, 'ATU') then
               raise Exception.Create('Não foi possível efetuar a unificação das aplicações do dia '+DateToStr(dDataApl)+'.');
            end;
         //Ricardo Cristiano - 02/12/2008 - N. Sol 102784 -  N. Kintana 457223
         end
         else
         begin
            if not GravaHistCotaIntegraliza(iTipoInvest,
                                            iFundo,
                                            OperComum.IIF((iTipoCota > 0), iTipoCota, -1),
                                            -1,-1,-1,
                                            iiPlanPrevCtbPatro,
                                            iOperacao,
                                            dDataOper, dDataApl,
                                            fValorOper, fQtdOper, fQtdOper, fValorCota, 0, 'ATU') then
               Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');
         end;

         Result := True;
    except
         On E:Exception Do
         begin
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         end;
      end;
   finally
      OperComum.LimpaParametros(DmFundoComum.QryAjustaAplicIntegr);
   end;
end;

//Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
Function AtualizaAplicacaoHistFundo(iTipoInvest, iTipoOperacao, iCarteira, iFundo,
                                    iPlanoPrev, iPatrocinadora, iOperacao,
                                    iOperOrigem, iQtdDecCotas, iTipoFundo, iForCli,
                                    iComposicaoFundo, iiPlanPrevCtbPatro  : integer;
                                    dDataApl, dDataOper, dDataLiq         : TDateTime;
                                    fQtdInvestOperacao, fValorCota        : Double;
                                    fValorOperacao, fValorIR, fValorIOF   : currency;
                                    sNaturMov, sHistorico, sTipoMov       : string;
                                    fVlrRendimento                        : Double = 0;
                                    iTipoCota      : Integer = -1;
                                    fSldVlrFundo   : Double = 0) : Boolean;
Var
   fSaldoFinalCotas, fSaldoFinalValor, fValorIRProv, fValorIOFProv,
   fVlrAplicado, fVlrCustoAtual, fQtdCotasBloq : Double;
   dDtaUltDiaMes, dDtaAnt : TDateTime;
   Year, Month, Day : Word;
   DadosCota        : TDadosCota;
begin
   fQtdCotasBloq := 0;

   if iCarteira = 0 Then
      iCarteira := -1;

   with DmFundoComum do
   begin
      try
         Try

           OperComum.LimpaParametros(DmFundoComum.QryBuscaAplOrigem);
           if iOperOrigem > 0 then
              QryBuscaAplOrigem.ParambyName('IDOPERACAOFUNDO').AsInteger   := iOperOrigem;

           if dDataApl > 0 then
              QryBuscaAplOrigem.ParambyName('DATAAPLICACAO').AsString   := DateToStr(dDataApl);

           if dDataApl > dDataOper then
              QryBuscaAplOrigem.ParambyName('DATAMOVFUNDO').AsString    := DateToStr(dDataApl)
           else
              QryBuscaAplOrigem.ParambyName('DATAMOVFUNDO').AsString    := DateToStr(dDataOper);
           QryBuscaAplOrigem.ParambyName('IDPLANPREVCTBPATR').AsInteger := iiPlanPrevCtbPatro;
           QryBuscaAplOrigem.ParambyName('IDTIPOINVEST').AsInteger      := iTipoInvest;
           QryBuscaAplOrigem.ParambyName('IDFUNDOINVEST').AsInteger     := iFundo;
           if iTipoCota > 0 then
              QryBuscaAplOrigem.ParambyName('IDTIPOCOTA').AsInteger     := iTipoCota;
           QryBuscaAplOrigem.Open;

           OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
           if iTipoCota > 0 then
              QryVlrCota.ParamByName('IDTIPOCOTA').AsInteger := iTipoCota;
           QryVlrCota.ParamByName('IDFUNDOINVEST').AsInteger := iFundo;
           QryVlrCota.ParamByName('DATACOTA').AsDateTime     := dDataOper;
           QryVlrCota.Open;

           fSaldoFinalCotas := OperComum.Round(QryBuscaAplOrigem.FieldByName('SALDOQTDCOTAS').AsFloat +
                                               fQtdInvestOperacao,iQtdDecCotas);

           fQtdCotasBloq    := QryBuscaAplOrigem.FieldByName('SALDOQTDCOTASBLQ').AsFloat;

           fSaldoFinalValor := OperComum.Round(fSaldoFinalCotas*QryVlrCota.FieldByName('VLRCOTA').AsFloat,2);

           fValorIRProv     := QryBuscaAplOrigem.FieldByName('VLRIRPROV').AsFloat + fValorIR;

           fValorIOFProv    := QryBuscaAplOrigem.FieldByName('VLRIOFPROV').AsFloat + fValorIOF;

           if fValorIRProv  < 0 then
              fValorIRProv  := 0;

           if fValorIOFProv  < 0 then
              fValorIOFProv := 0;

           fVlrAplicado   := QryBuscaAplOrigem.FieldByName('VLRAPLICADO').AsFloat;

           fVlrCustoAtual := QryBuscaAplOrigem.FieldByName('VLRCUSTOATUAL').AsFloat;

           dDtaAnt := DiasUteisInv.UltDiaUtilAnterior(dDataOper, -1, 1, '', True, False, False);

           DadosCota := UFundoComum.BuscaCotaFundo(DmFundoComum.qryAux, iFundo, dDtaAnt,
                                                   OperComum.IIF((iTipoCota > 0), iTipoCota, -1));

           //Ricardo Cristiano - 03/11/2010 - N. Sol 146983 -  N. Kintana 1008483
           //Ricardo Cristiano - 05/03/2010 - N. Sol 130827 -  N. Kintana 736750
           fVlrRendimento := OperComum.Round(OperComum.Round((fQtdInvestOperacao*QryVlrCota.FieldByName('VLRCOTA').AsFloat),2) -
                                                OperComum.Round((fQtdInvestOperacao*DadosCota.VlrCota),2),2);

           //Valor do IR transferido proprocional, devido a alteração de cota e mudança de valor
           fValorIRProv   := OperComum.DivValorZero((QryBuscaAplOrigem.FieldByName('VLRIRPROV').AsFloat * fQtdInvestOperacao),
                                                     QryBuscaAplOrigem.FieldByName('SALDOQTDCOTAS').AsFloat);
           //Compensação
           fValorIRProv   := QryBuscaAplOrigem.FieldByName('VLRIRPROV').AsFloat + fValorIRProv;

           //Valor do IOF transferido proprocional, devido a alteração de cota e mudança de valor
           fValorIOFProv   := OperComum.DivValorZero((QryBuscaAplOrigem.FieldByName('VLRIOFPROV').AsFloat * fQtdInvestOperacao),
                                                      QryBuscaAplOrigem.FieldByName('SALDOQTDCOTAS').AsFloat);
           //Compensação
           fValorIOFProv    := QryBuscaAplOrigem.FieldByName('VLRIOFPROV').AsFloat + fValorIOFProv;

           // Valor transferido
           fVlrAplicado   := OperComum.DivValorZero((QryBuscaAplOrigem.FieldByName('VLRAPLICADO').AsFloat * fQtdInvestOperacao),
                                                    QryBuscaAplOrigem.FieldByName('SALDOQTDCOTAS').AsFloat);
           // Valor Anterior - Valor transferido
           fVlrAplicado   := QryBuscaAplOrigem.FieldByName('VLRAPLICADO').AsFloat + fVlrAplicado;

           // Valor transferido
           fVlrCustoAtual := OperComum.DivValorZero((QryBuscaAplOrigem.FieldByName('VLRCUSTOATUAL').AsFloat * fQtdInvestOperacao),
                                                    QryBuscaAplOrigem.FieldByName('SALDOQTDCOTAS').AsFloat);
           // Valor Anterior - Valor transferido
           fVlrCustoAtual := QryBuscaAplOrigem.FieldByName('VLRCUSTOATUAL').AsFloat + fVlrCustoAtual;

           //Último dia do mês
           if (dDataApl > dDataOper) then
              DecodeDate(dDataApl, Year, Month, Day)
           else
              DecodeDate(dDataOper, Year, Month, Day);

           dDtaUltDiaMes    := UltimoDiaMes(Year, Month);

           if ((dDataOper <> dDtaUltDiaMes) and (QryBuscaAplOrigem.FieldByName('DATAULTPGTOIR').AsDateTime > 0)) Then
              dDtaUltDiaMes := QryBuscaAplOrigem.FieldByName('DATAULTPGTOIR').AsDateTime;

           if not GravaAplicacaoResgate(iTipoInvest, iTipoOperacao, iCarteira, iOperacao, iFundo,
                                        dDataApl, dDataOper, dDtaUltDiaMes,
                                        sHistorico, sNaturMov, sTipoMov,
                                        fVlrAplicado,
                                        fValorOperacao, fValorIRProv, fValorIOFProv, fVlrRendimento,
                                        fQtdInvestOperacao, fSaldoFinalCotas, fSaldoFinalValor,
                                        fValorCota,
                                        fVlrCustoAtual,
                                        iiPlanPrevCtbPatro, -1, iComposicaoFundo, iTipoCota,
                                        fQtdCotasBloq) Then
              Raise Exception.Create('Não foi Possível gravar a Operação.');

           Result := True;

         except
            On E:Exception Do Begin
               MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
               Result := False;
            end;
         end;
      finally
         OperComum.LimpaParametros(DmFundoComum.QryBuscaAplOrigem);
         OperComum.LimpaParametros(DmFundoComum.QryVlrCota);
      end;
   end;
end;

//Ricardo Cristiano - 07/01/2010 - N. Sol 129265 -  N. Kintana 707133

Procedure VerificaTipoFundoInvestVig(dData : TDateTime; iFundoInvest : Integer;
                                     var iTipoFundoInvest : Integer;
                                     var iTipoInvest : Integer;
                                     var iTipoCota  : Integer;
                                     var flgTransfCota: Boolean);
var QryLocalVig : TwwQuery;
begin
   try
     QryLocalVig := TwwQuery.Create(Application);
     QryLocalVig.DatabaseName  := 'BaseDados';
     with DmFundoComum Do
     begin
        QryLocalVig.SQL.Add('SELECT HF1.DESCFUNDOINVEST, HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, TF1.IDTIPOINVEST ');
        QryLocalVig.SQL.Add('FROM HISTFUNDOINVEST HF1, TIPOFUNDOINVEST TF1 ');
        QryLocalVig.SQL.Add('WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN ');
        QryLocalVig.SQL.Add('      (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'')');
        QryLocalVig.SQL.Add('       FROM HISTFUNDOINVEST HF ');
        QryLocalVig.SQL.Add('       WHERE ');
        QryLocalVig.SQL.Add('           (HF.IDFUNDOINVEST = '+IntToStr(iFundoInvest)+') ');
        QryLocalVig.Sql.Add('       AND (HF.DTAVIGENCIA          < TO_DATE('+QuotedStr(DateToStr(dData))+',''DD/MM/YYYY'')+1) ');
        QryLocalVig.SQL.Add('       GROUP BY HF.IDFUNDOINVEST)) ');
        QryLocalVig.SQL.Add('AND TF1.IDTIPOFUNDOINVEST = HF1.IDTIPOFUNDOINVEST ');
        QryLocalVig.Open;

        if QryLocalVig.FieldByName('IDTIPOFUNDOINVEST').AsInteger <> 0 then
          if not(flgTransfCota) then //Renan
            iTipoFundoInvest := QryLocalVig.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
        //Renan Cristiano Sol 129607 | Kintana 717461 Inicio.
        if QryLocalVig.FieldByName('IDTIPOINVEST').AsInteger <> iTipoInvest then
           if not(flgTransfCota) then //Renan
              iTipoInvest := QryLocalVig.FieldByName('IDTIPOINVEST').AsInteger;

        if not (iTipoInvest in [9,10]) then
           iTipoCota := 0;
        //Renan Cristiano Sol 129607 | Kintana 717461 Fim.
     end;
   Finally
     QryLocalVig.Close;
     QryLocalVig.Free;
   end
end;

end.
