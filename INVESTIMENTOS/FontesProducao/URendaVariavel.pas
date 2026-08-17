//******************************************************************************
// Rotina     :
// SOL        : 179205
// Kintana    : 1653012
// Data       : 02/05/2012
// Responsável: Otacilio Aquino
// Descrição  : Implementado para permitir uma ação seja incorporada em duas ou
//              mais ações destinos. Utilizar data PREV para movimentar a Carteira
//******************************************************************************
// Rotina     : BtProcessarClick
// SOL        : 170047.7461
// Kintana    : 1533918
// Data       : 13/01/2012
// Responsável: Otacilio Aquino
// Descrição  : Gravar boletas fechadas e sem registros na HstCartinv
//******************************************************************************
// Rotina     : AtualizaSaldoInvestRV();
// SOL        : 64043
// Kintana    : 523191
// Data       : 29/07/2009
// Responsável: William M. Santos
// Descrição  : Implementação para não permitir que seja gravado no banco variação
//              de R$ 0,01 na tabala HistCartInv.
//******************************************************************************
//SOL 122382 Kintana 605342 Thiago Passos - 21/08/2009
//******************************************************************************
// Rotina     : RendaVariavel.SincronizacaCotacaoAcaoXCotacaoInvest
// SOL        : 122382
// Kintana    : 605342
// Data       : 21/08/2009
// Responsável: Thiago Passos
// Descrição  : Sincronização das Tabelas CotacaoAcao com CotacaoInvest
//******************************************************************************
// Rotina     : MarcarFlagReproc/qryVerTRCPeriodo
// SOL        : 107630
// Kintana    : 484313
// Data       : 19/02/2009
// Responsável: Renan Cristiano
// Descrição  : Implementação na operação de MarcarFlagReproc, parametro adicionado
//              para saber qual o tipo de transferencia esta sendo executada(TRC/TRP).
//******************************************************************************
// Rotina     : AtualizaSubscricaoVencida(
// SOL        : 107933
// Kintana    : 486332
// Data       : 03/02/2008
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para desconsidferar os registros de "Vencimento de
//               Subscrição"(-10114, -114)
//******************************************************************************
// Rotina     : TransfEntrePlanos
// SOL        : 95179
// Kintana    : 411114
// Data       : 09/09/2008
// Responsável: Ricardo Cristiano
// Descrição  : Implementação na operação de transferência entre planos para
//               identificar o custodiante quando não informado e para quando
//               informado fazer a Exceção, conforme a tela de origem. E
//               retornar a mensagem correta.
//******************************************************************************
// Rotina     : MontaAtuSldInvRV/BuscaDataAntBloqContab/MarcarFlagReproc/RemarcaFlgReproc/AtualizaSaldoInvestRV
// SOL        : 92857
// Kintana    : 396741
// Data       : 07/08/2008
// Responsável: Ricardo Cristiano
// Descrição  : Implementação de ajustes para otimização do reprocessamento
//******************************************************************************
// Data      : 18/06/2008
// Código    : AL_160
// Pendencia : 27958
// SOL       : 85827
// Motivo    : Implementação para filtrar a operação de Alteração de Tipo e Incorporação
//              por "id" do investimento, carteira e plano.
//******************************************************************************
// Data      : 30/05/2008
// Código    : AL_159
// Pendencia : 28010
// SOL       :
// Motivo    : Ajuste na natureza das operações de Restituição de Capital
//******************************************************************************
// Data      : 29/05/2008
// Código    : AL_158
// Pendencia : 28010
// SOL       :
// Motivo    : Ajuste na quantidade movimentada nas operações de Restituição de
//               Capital
//******************************************************************************
// Data      : 23/10/2007
// Código    : AL_157
// Pendencia : 26636
// SOL       : 71212
// Motivo    : Implementação de ajuste na rotina de reprocesamento das operações de
//             venda(-35). Implementação para tratar a Compra de Fundos de Investimento com Venda de Ações
//******************************************************************************
// Data      : 20/09/2007
// Código    : AL_156
// Pendencia :
// SOL       :
// Desc      : Ajuste na rotina de marcação de investimentos.
//             Acerto na pendência 25877
//******************************************************************************
// Data      : 04/09/2007
// Código    : AL_155
// Pendencia : 26269
// SOL       : 68079
// Desc      : Implementação de ajuste para operação de Grupamento, alterado o
//             tratamento de apuração de contas CC e CCI
//******************************************************************************
// Data      : 03/09/2007
// Código    : AL_154
// Pendencia :
// SOL       :
// Desc      : Alteração do local da query(qryBuscaAltTP) devido não estar criada,
//             ocorrendo erro
//******************************************************************************
// Data      : 03/09/2007
// Código    : AL_153
// Pendencia : 25942
// SOL       : 65072
// Desc      : Implementação do tratamento para identificação do investimento de origem e
//             e destino para setar a natureza da operação de baixa ou acréscimo
//******************************************************************************
// Data      : 22/08/2007
// Código    : AL_152
// Pendencia : 25877
// SOL       : 64596
// Desc      : Ajuste na rotina de marcação de investimentos para marcar sempre
//               as duas pontas da operação de Alteração de Tipo
//******************************************************************************
// Data      : 19/07/2007
// Código    : AL_151
// Pendencia : 25813
// SOL       :
// Desc      : Implememtação para gravação de log na tabela LogTotalPrev
//             Quando as cotações anterior e atual forem iguais e o saldo
//             anterior e atual forem diferentes....
//******************************************************************************
// Data      : 22/05/2007
// Código    : AL_150
// Pendencia : 25434
// SOL       :
// Desc      : Acerto na rotina LancaBoletaTRC que estava inicializando a variavel
//             para privada quando ela tem que ser global.
//******************************************************************************
// Data      : 08/05/2007
// Código    : AL_149
// Pendencia : 25297
// SOL       :
// Desc      : Implementacao da funcioanidade de Permissão do uso de Carteira
//             gerencial
//******************************************************************************
// Data      : 24/04/2007
// Código    : AL_148
// Pendencia : 25026
// SOL       : 57699
// Desc      : Acerto na LancaBoletaTRC para nao gravar iPlanilha, iDocumento e ,
//             iPlano na AlimentaCarteira
//******************************************************************************
// Data      : 20/03/2007
// Código    : AL_147
// Pendencia : 24774
// SOL       : 55877
// Desc      : Liga/Desliga a integração contabil financeira por módulo
//******************************************************************************
// Data      : 13/04/2007
// Código    : AL_146
// Pendencia : 25026
// SOL       : 57699
// Desc      : Ajuste na geração das operações de não exercício de subscrição
//******************************************************************************
// Data      : 28/02/2007
// Código    : AL_145
// Pendencia : 24563
// SOL       :
// Desc      : Ajuste no reprocessamento e ordenação da reprocessamento
//******************************************************************************
// Data      : 22/02/2007
// Código    : AL_144
// Pendencia : 24559
// SOL       : 54025
// Desc      : Permitir a seleção de Acoes com Saldo zerado e sem contabilização
//******************************************************************************
// Data      : 12/02/2007
// Código    : AL_143
// Pendencia : 24464
// SOL       :
// Desc      : Passa a não gravar o ID do HistCartInv nas OperCustodia das
//               operações de direito que envolvem quantidade
//             Não relança operações (nem de custódia) no reprocessamento,
//               relança somente históricos
//******************************************************************************
// Data      : 04/01/2007
// Código    : AL_142
// Pendencia : 24122
// SOL       :
// Desc      : Ajuste no Relançamento da Boleta DTS (LancaBoletaDTS)
//             Ajuste na exclusão de boletas (problema na exclusão de boletas DTS)
//             Ajuste na rotina AtualizaSubscricaoVencida
//******************************************************************************
// Data      : 28/12/2006
// Código    : AL_141
// Pendencia : 24058
// SOL       :
// Desc      : Ajuste no Relançamento da Boleta TRP (LancaBoletaTRP)
//             Ajuste no Relançamento da Boleta DCI (LancaBoletaDCI)
//******************************************************************************
// Data      : 28/11/2006
// Código    : AL_140
// Pendencia : 23891
// SOL       : 42459
// Desc      : Implementação da Liquidação Com Ações
//******************************************************************************
// Data      : 06/12/2006
// Código    : AL_139
// Pendencia : 23674
// SOL       : 45954
// Desc      : Segregação de Recursos
//******************************************************************************
// Data      : 10/11/2006
// Código    : AL_138
// Pendencia : 23722
// SOL       :
// Desc      : Segregação de Planos
//              Ajuste no reprocessamento de TCU por causa da TRP
//              Ajuste no reprocessamento da TRP
//******************************************************************************
// Data      : 05/10/2006
// Código    : AL_137
// Pendencia : 23346
// SOL       :
// Desc      : Transferencia de CC para CCI
//******************************************************************************
// Data      : 18/10/2006
// Código    : AL_136
// Pendencia : 23564
// SOL       :
// Desc      : Ajuste de Segregação e da TRC CC e CCI
//******************************************************************************
// Data      : 25/09/2006
// Código    : AL_135
// Pendencia : 22965
// SOL       :
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 16/08/2006
// Código    : AL_134
// Pendencia : 22957
// SOL       :
// Desc      : Implementação de Transferência entre Planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_133
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_132
// Pendencia:
// SOL      :
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006, 06/07/2006 e 03/08/2006
// Código   : AL_131
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 06/06/2006
// Código   : AL_130
// Pendencia: 22384
// SOL      : 43283
// Desc     : Contabilização da remuneração como ganho de capital noe recebimentos
//******************************************************************************
// Data     : 19/05/2006
// Código   : AL_129
// Pendencia: 22388
// SOL      : 43354
// Desc     : Ajuste para não contabilizar o Cancelamento de Anúncio
//******************************************************************************
// Data     : 16/05/2006
// Código   : AL_128
// Pendencia:
// SOL      :
// Desc     : Ajuste na rotina MarcaOpeSemHist para fazer por período
//******************************************************************************
// Data     : 17/04/2006
// Código   : AL_127
// Pendencia: 22047
// SOL      : 42021
// Desc     : Implementação de Histórico Contábil de Incorporacao e alteração para
//            na carregar a variação para a Ação de Destino
//******************************************************************************
// Data      : 17/04/2006
// Código    : AL_126
// Pendencia :
// SOL       :
//           : Ajuste no reprocessamento para marcar investimentos de operações
//               sem histórico no dia do reprocessamento
//             Ajuste no SQL de seleção de carteiras para gravação de registro REP
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_125
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//******************************************************************************
// Data      : 24/03/2006
// Código    : AL_124
// Pendencia :
// SOL       :
//           : Ajuste na rotina de atualização para refazer a atualização de
//                investimentos mesmo quando já houver uma atualização gravada
//******************************************************************************
// Data      : 18/03/2006
// Código    : AL_123
// Pendencia : 21714
// SOL       : 41065
//           : Ajuste na gravação do registro de lucro
//             Melhora na mensagem de erro de limpeza de planilha
//******************************************************************************
// Data      : 16/03/2006
// Código    : AL_122
// Pendencia :
// SOL       :
//           : Acerto na qryOperacao para trazer o CodDocumento da Operacaoinvest
//             com o campo CODDOCUMOPER na ExcluiBoleta
//******************************************************************************
// Data      : 07/03/2006
// Código    : AL_121
// Pendencia :
// SOL       :
//           : Ajuste no reprocessamento para operação de Multa
//******************************************************************************
// Data      : 06/03/2006
// Código    : AL_120
// Pendencia :
// SOL       :
//           : Reengenharia do reprocessamento de transferencia
//           : Reprocessamento linear
//******************************************************************************
// Data      : 06/02/2006
// Código    : AL_119
// Pendencia :
// SOL       :
//           : Implementação de um evento para atualizar o progress bar do form
//                de fechamento de renda variavel
//             Ajuste na rotina de Atualização de RV para destruir objetos locais
//                e fechar as queries abertas no processo
//******************************************************************************
// Data      : 01/02/2006
// Código    : AL_118
// Pendencia :
// SOL       :
//           : Ajuste para Reprocessamento de transferência
//******************************************************************************
// Data      : 01/02/2006
// Código    : AL_117
// Pendencia :
// SOL       :
//           : Ajuste na rotina IncluiRegistros (DTO) para reprocessamento do ajuste
//                no recebimento
//******************************************************************************
// Data      : 05/01/2006
// Código    : AL_116
// Pendencia : 21181
// SOL       : 39566
//           : Acerto no Reprocessamento de Ajuste de Quantidade se Ajuste na Carteira
//             TipoOperacao -124 e -125 para nâo gerar HISTCARTINV
//******************************************************************************
// Data      : 28/12/2005
// Código    : AL_115
// Pendencia :
// SOL       :
//           : Ajuste no cálculo da quantidade da operaçãp de Alteração de Tipo e Incorporação
//******************************************************************************
// Data      : 20/12/2005
// Código    : AL_114
// Pendencia : 20781
// SOL       : 38597
//           : Implementação de Cancelamento de Subscrição com Ações
//*****************************************************************************
//Data	    : 26/12/2005
//Codigo    : AL_113
//Pendencia :
//Sol       :
//Motivo(S) : Ajuste no reprocessamento de Cisão
//*****************************************************************************
//Data	    : 20/12/2005
//Codigo    : AL_112
//Pendencia :
//Sol       :
//Motivo(S) : Ajuste no calculo da transferencia de Custo e Variação na operação
//              de transferencia entre carteiras
//*****************************************************************************
//Data	    : 14/12/2005
//Codigo    : AL_111
//Pendencia : 21025
//Sol       : 39102
//Motivo(S) : Ajuste para efetuar o cálculo proporcional de Custo e Variação
//               no relançamento das operações de incorporação e alteração de tipo
//*****************************************************************************
//Data	    : 28/11/2005
//Codigo    : AL_110
//Motivo(S) : Acerto na rotina de reprocessamento da operação de Desdobramento,
//            não exite financeiro.
//*****************************************************************************
//Data	     : 28/10/2005
//Codigo    : AL_109
//Motivo(S) : Implementação do tratamento da planilha para qdo haver
//            mais de um valor, de uma mesma operação ser contabilizado na mesma planilha
//*****************************************************************************
//Data	     : 27/10/2005
//Codigo    : AL_108
//Motivo(S) : Criado o reprocessamento da operação de Subscrição com Ações
//******************************************************************************
//Data      :  19/10/2005
//Codigo    :  AL_107
//Motivo(S) :  Ajuste na rotina de Cisão conforme nova concepção.
//******************************************************************************
//Data      :  19/10/2005
//Codigo    :  AL_106
//Motivo(S) :  Alterado o tratamento de cotação zero para atualizar as PRP
//******************************************************************************
//Data      :  17/10/2005
//Codigo    :  AL_105
//Motivo(S) :  Alterado o posicionamento das variaveis que sao carregadas com a planilha e o documento,
//             para ser gravado o mesmo.
//******************************************************************************
//Data      :  17/10/2005
//Codigo    :  AL_104
//Motivo(S) :  Ajuste na atualiza;áo da boleta com o codigo da planilha ,testando se ela e maior q zero.
//******************************************************************************
//Data	     :  13/10/2005
//Codigo    :  AL_103
//Motivo(S) :  Teste as variaveis no momento de gravar na boleta
//******************************************************************************
//Data	     :  10/10/2005
//Codigo    :  AL_102
//Motivo(S) :  Implementação no reprocessamento a operação de Reorganização Societária
//******************************************************************************
//Data	     :  05/10/2005
//          :  AL_101
//Função    :  Implementação do TipoOperacao -124 e -125 para Ajuste de Aumento e Baixa de Quantidade sem
//             ajuste dos Saldos
//******************************************************************************
//Data	     :  05/10/2005
//Codigo    :  AL_100
//Motivo(S) :  Retirado o if devido a critica ja estar sendo feita antes
//******************************************************************************
//Data	     :  30/09/2005
//Codigo    :  AL_99
//Motivo(S) :  Implementação da varaiação, custo e ir na operação de Ajuste de Quantidade
//******************************************************************************
//Data	     :  29/09/2005
//Codigo    :  AL_100
//Motivo(S) :  Acerto na gravação de custo e variação para DTI ser negativa qdo
//               for Origem pois a natureza é D
//******************************************************************************
//Data	     :  26/09/2005
//Codigo    :  AL_98
//Motivo(S) :  Muda a alteração AL_95 - Inverte a retirada e acerta erros
//******************************************************************************
//Data	     :  28/09/2005
//Codigo    :  AL_97
//Motivo(S) :  Acerto de Grupamento para o campo SALDOQTDCPMF
//******************************************************************************
//Data	    :  27/09/2005
//Codigo    :  AL_96
//Motivo(S) :  Retirado um not para nâo fazer qdo carteira gerencial
//******************************************************************************
//Data	    :  26/09/2005
//Codigo    :  AL_95
//Motivo(S) :  Retirado por causas duplicidade.
//******************************************************************************
//Data	    :  21/09/2005
//Codigo    :  AL_94
//Motivo(S) :  Alterado de lugar devido a soma do custo e variação no destino
//******************************************************************************
//Data	    :  21/09/2005
//Codigo    :  AL_93
//Motivo(S) :  Implementação do campo que trata o destino com a contabilização invertida
//******************************************************************************
//Data	    :  20/09/2005
//Codigo    :  AL_92
//Motivo(S) :  Ajuste na rotina de custo e implementação da variação
//******************************************************************************
//Data	    : 01/08/2005
//Código    : Al_91
//Motivo(S) : Transporte do método AtualizaSubscricaoVencida do fFechtoRenVar
//            Ajuste nas rotinas de Vencimento de Subscrição
//******************************************************************************
//Data	    :  23/08/2005
//Codigo    :  AL_90
//Motivo(S) : Implementação do Custo na operação de Permulta
//*****************************************************************************
//Data	    : 16/08/2005
//Código    : Al_89
//Motivo(S) : Implementado o divisor zero(pode ser base, masssss ...)
//*****************************************************************************
//Data	    : 27/07/2005
//Código    : Al_88
//Motivo(S) : Retirada a critica para deletar a custodia apenas qdo não for registro de cart. gerencial
//*****************************************************************************
//Data	    : 27/07/2005
//Código    : Al_87
//Motivo(S) : Acerto no reprocessamento da operação de vencimento de subscrição,
 //           onde ocorreu a troca dos campos conforme a query "QryBuscaBoletaVSU" .
//*****************************************************************************
//Data	    : 21/07/2005
//Código    : Al_86
//Motivo(S) : Acerto para no grupamento ajustar a quantidade CPMF para as Cart. Gerenciais.
//*****************************************************************************
//Data	    : 21/07/2005
//Código    : Al_85
//Motivo(S) : Implementação da remuneração para ser contabilizado no momento do recebimento
//*****************************************************************************
//Data	    : 15/07/2005
//Código    : Al_84
//Motivo(S) : Atualização na operação de Desdobramento.
//*****************************************************************************
//Data	    : 14/07/2005
//Código    : Al_83
//Motivo(S) : Atualização na rotina InsereCustodia
//********************************************************************************************************
//Data	    : 13/07/2005
//Código    : Al_82
//Motivo(S) : Atualização na operação de Vencimento de Subscrição .
//********************************************************************************************************
//Data	    : 13/07/2005
//Código    : Al_81
//Motivo(S) : Atualização na operação de Subscrição para atualizar a custódia.
//********************************************************************************************************
//Data	    : 12/07/2005
//Código    : Al_80
//Motivo(S) : Implementação para fazer somente qdo for o destino na operacaoinvest
//********************************************************************************************************
//Data	    : 04/07/2005
//Código    : Al_79
//Motivo(S) : Implementação do teste se é null o motivo de bloqueio e se ocorrer algum erro na rotina de alimentacustodia abortar o processo
//********************************************************************************************************
//Data	    : 27/06/2005
//Código    : Al_78
//Motivo(S) : IMPLEMENTADO O TRY EXCEPT NA ROYINA INCLUIREGISTRO
//********************************************************************************************************
//Data	    : 21/06/2005
//Código    : Al_77
//Motivo(S) : Acerto na mensagem do sistema, retirando o erro e corrigindo o anunciado
//********************************************************************************************************
//Data	    : 21/06/2005
//Código    : Al_76
//Motivo(S) : Implentação para tratar o IDTIPOOPERCAO preenchido para TRC referente a  CCI
//********************************************************************************************************
//Data	    : 21/06/2005
//Código    : Al_75
//Motivo(S) : Implentação para pegar saldo zerado ou cotação menor que 0,000000001
//********************************************************************************************************
//Data	    : 25/05/2005
//Código    : Al_74
//Motivo(S) : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
//Data	    : 16/05/2005
//Código    : Al_73
//Descrição : Implementado a rotina de atualização do histórico de caixa
//******************************************************************************
//Data	    : 12/05/2005
//Código    : Al_72
//Descrição : Novo parametro na qryBuscaAnuncio para identificar uma só Operacao de Origem
//******************************************************************************
//Data	    : 11/05/2005
//Código    : Al_71
//Descrição : Ajuste no reprocessamento de Anúncio e Recebimento de direito
//                Passa a reutilizar uma planilha para mais de um lançamento
//******************************************************************************
//Data	    : 03/05/2005
//Código    : Al_70
//Descrição : Ajuste no relançamento de Alteração de Tipo (InsereRegistro)
//******************************************************************************
//Data	    : 27/04/2005
//Código    : Al_69
//Descrição : Retirado pois nao vai mais gravar origem e destino , é sempre destino mesmo
//******************************************************************************
//Data	    : 27/04/2005
//Código    : Al_68
//Descrição : Verifica se há planilha antes de limpar
//******************************************************************************
//Data	    : 27/04/2005
//Código    : Al_67
//Descrição : Implementação para somento excluir qdo for um Anuncio de Proventos
//******************************************************************************
//Data	    : 26/04/2005
//Código    : Al_66
//Descrição : Comentada a contabiliza para essa operação.
//******************************************************************************
//Data	    : 26/04/2005
//Código    : Al_65
//Descrição : Atualização dos parametros da rotina
//******************************************************************************
//Data	    : 25/04/2005
//Código    : Al_64
//Descrição : Implementado o tratamento de atualizção de caixa, caso cart. gerencial.
//******************************************************************************
//Data	    : 25/04/2005
//Código    : Al_62
//Descrição : Retirado o tratamento de custódia, pois a Restituição não afeta custódia
//******************************************************************************
//Data	    : 25/04/2005
//Código    : Al_61
//Descrição : Retirado o tratamento de origem e destino
//******************************************************************************
//Data	    : 18/04/2005
//Código    : Al_61
//Descrição : Ajuste no valor da variação para evitar erro de arredondamento
//******************************************************************************
//Data	    : 18/04/2005
//Código    : Al_60
//Descrição : Crítica para não fazer update de não tiver sido gerado o IDHISTCARTINV
//******************************************************************************
//Data	    : 13/04/2005
//Código    : Al_59
//Descrição : Implementação da verificação e gravação do evento de caixa da carteira gerencial
//******************************************************************************
//Data	    : 13/04/2005
//Código    : Al_58
//Descrição : Implementação da verificação do eventos de caixa da carteira gerencial
//******************************************************************************
//Data	    : 11/04/2005
//Código    : Al_57
//Motivo(S) : Ajuste para as cotações com valores 0,00000000, quando utiliza a func "trunca" continua
//            existindo o valor, para isso será feito o teste com a func "round".
//******************************************************************************
//Data	    : 07/04/2005
//Código    : Al_56
//Descrição : Alterada a ordem de exclusão da operacaoinvest, poderia ocorrer erro e nao excluiria
//******************************************************************************
//Data	    : 06/04/2005
//Código    : Al_55
//Descrição : Alterada para excluir as operações que se referem de fato a Carteira Gerencial
//******************************************************************************
//Data	    : 05/04/2005
//Código    : Al_54
//Descrição : Rotina resumida da BuscaTodosSaldosInvestLote
//******************************************************************************
//Data	    : 05/04/2005
//Código    : Al_53
//Descrição : Implementação da rotina para compor a HistProvisao dos Anúncios de Proventos, para aqueles q não
//            se enquadrarão na rotina nova, a qual grava a OperacaoInvest da Cart. Gerencial
//******************************************************************************
//Data	    : 29/03/2005
//Código    : Al_52
//Descrição : Implementado o parametro null para acertar o PLNCODIGO do reprocessamento
//******************************************************************************
//Data	    : 22/03/2005
//Código    : Al_51
//Motivo(S) : Passa a não atualizar os saldos após incluir registro de Lucro. Deixa
//            para ser feito na FFechaBoleta
//******************************************************************************
//Data	    : 18/03/2005
//Código    : Al_50
//Descrição : Incluido a rotina para contabilizar o Div/Jur pelo valor da diferença
//            entre o anúncio e a operação
//******************************************************************************
//Data	    : 17/03/2005
//Código    : Al_49
//Descrição : Incluido novo tratamento na IncluiRegistros:
//              Boleta TCU - Transferencia entre Custodiantes
//******************************************************************************
//Data	    : 10/03/2005
//Código    : Al_48
//Descrição : Incluido a verificação da deleção da custodia com carteira gerencial nula,
//            essa não tem custódia
//******************************************************************************
//Data	    : 09/03/2005
//Código    : Al_47
//Descrição : A rotina passa agora a tratar a Carteira Gerencial
//******************************************************************************
//Data	    : 08/03/2005
//Código    : Al_46
//Descrição : A rotina passa agora a tratar a Carteira Gerencial
//******************************************************************************
//Data	    : 02/03/2005
//Código    : Al_45
//Motivo(S) : Alterada o prazo limite para 60 dias para zerar a cota do Cart. Gerencial
//******************************************************************************
//Data	    : 28/02/2005
//Código    : AL_44
//Motivo(S) : Ajuste no Tratamento de reprocessamento da operação DTI
//******************************************************************************
//Data      : 28/02/2005
//Código    : AL_43
//Motivo    : Alterada a critica devido a operação de Recebimento de Subscrição por
//            Anuncio de AGE
//******************************************************************************
// Data	    : 25/02/2005
// Código   : AL_42
// Motivo(S): Incluído o Reprocessamento do tipo 'VSU' na função IncluiRegistro.
//******************************************************************************
// Data	    : 21/02/2005
// Código   : AL_41
// Motivo(S): Ajuste na alteração do Tipo de Operação na AtualizaSaldoInvestRV
//******************************************************************************
// Data	    : 11/02/2005
// Código   : AL_40
// Motivo(S): Ajuste na AtualizaSaldoInvestRV para tratamento do Tipo de Operação
//               na Atualização
//******************************************************************************
//Data      : 11/01/2005
//Código    : AL_39
//Motivo    : GravaEmAbertura - Controla processo de abertura
//******************************************************************************
//Data      : 11/01/2005
//Código    : AL_38
//Motivo    : VerEmAbertura - Controla processo de abertura
//******************************************************************************
// Data	    : 11/01/2005
// Função   : ExcluiBoleta
// Código   : AL_37
// Motivo(S): Novo parametro: Frame para acompanhamento pelo form sem a frmAguarde
//******************************************************************************
// Data	    : 23/12/2004
// Função   : IncluiRegistro
// Código   : AL_36
// Motivo(S): Alterado o tratamento de relançamento de AJQ, alterada a ordem de
//            exclusão dos registros para evitar erro de constraint
//******************************************************************************
//Data      : 23/12/2004
//Código    : AL_35
//Motivo    : Delimita para excluir apenas trinta dias antes do ultimo fechamento
//******************************************************************************
// Data     : 20/12/2004
// Código   : AL_34
// Motivo   : Ajuste dos parametros que serão passados para custodia
//******************************************************************************
// Data     : 20/12/2004
// Código   : AL_33
// Motivo   : Implementação da alteração da qtd de CPMF no grupamento
//******************************************************************************
// Data	    : 21/12/2004
// Função   : IncluiRegistro
// Código   : AL_32
// Motivo(S): Relançamento da Boleta de AJQ com operações de custodia sem carteira
//******************************************************************************
// Data	    : 07/12/2004
// Função   : IncluiRegistro
// Código   : AL_31
// Motivo(S): Adaptação para CCI, pode haver mais de uma boleta para uma mesma corretora
//******************************************************************************
// Data	    : 03/12/2004
// Função   : IncluiRegistro
// Código   : AL_30
// Motivo(S): Nas operações de Ajuste de Custo Não gera Lucro
//******************************************************************************
// Data     : 07/12/2004
// Código   : AL_29
// Motivo   : A provisão da transferencia passa a ter a cotação do dia
//******************************************************************************
// Data     : 06/12/2004
// Código   : AL_28
// Motivo   : Implementação da aproximação decimal conforme a bovespa
//******************************************************************************
// Data     : 06/12/2004
// Código   : AL_27
// Motivo   : Implementação da na transf. da Cart. Gerencial a busca da cotação,
//            caso tenha alterado a mesma.
//******************************************************************************
// Data     : 06/12/2004
// Código   : AL_26
// Motivo   : Implementação da busca de registro quando o saldo inicia-se a partir
//            da determinada data
//******************************************************************************
// Data     : 01/12/2004
// Código   : AL_25
// Motivo   : Ajuste para so contabilizar a operação e implementação da descrição,
//            conforme a operação
//******************************************************************************
// Data     : 01/12/2004
// Código   : AL_24
// Motivo   : Implementado o reprocessamento do Anuncio de Proventos
//******************************************************************************
// Data     : 01/12/2004
// Código   : AL_23
// Motivo   : Retirada a buscasaldo, essa so buscava o ir provisionado, sem necessidade
//******************************************************************************
// Data     : 25/11/2004
// Código   : AL_22
// Motivo   : Implentação da AtualizaSaldoCustodia
//******************************************************************************
// Data     : 24/11/2004
// Código   : AL_21
// Motivo   : Implementação do tratamento da Carteira Gerencial para não contabilizar
//******************************************************************************
// Data	    : 23/11/2004
// Função   : IncluiRegistros
// LINHA(S) : AL_20
// Motivo(S): Ajuste na montagem  da qtde com pendencia de liquidação de bolsa
//******************************************************************************
// Data	    : 27/10/2004
// Função   : ExcluiHistRV e ExcluiBoleta
// LINHA(S) : AL_19
// Motivo(S): Não exclui o Registro marcado
//******************************************************************************
// Data	    : 19/10/2004
// Função   : AtualizaSaldoInvestRV
// LINHA(S) : AL_18
// Motivo(S): Passa a gravar saldo diariamente independentemente de haver variação
//******************************************************************************
// Data	    : 15/10/2004
// Função   : IncluiRegistros
// LINHA(S) : AL_17
// Motivo(S): Implementado o reprocessamento da operação de Cisão
//******************************************************************************
// Data	    : 07/10/2004
// Função   : IncluiRegistros
// LINHA(S) : AL_16
// Motivo(S): Implementado a contabilização da operação de Restituição de Capital
//******************************************************************************
// Data     : 06/10/2004
// Código   : AL_15
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data	    : 09/09/2004
// Código   : AL_14
// Motivo(S): Implementado a contabilização das operações de Direitos
//******************************************************************************
// Data	    : 19/08/2004
// Código   : AL_13
// Motivo(S): Implementado o reprocessamento da operação de DESDOBRAMENTO
//******************************************************************************
// Data	    : 22/07/2004
// Código   : AL_12
// Descrição: Implementação da rotina de reprocessamento das operações de Incorporação/Permuta/Alteração
//******************************************************************************
// Data	    : 22/07/2004
// Código   : AL_11
// Descrição: Atualização das rotinas de subscrição
//******************************************************************************
// Data	    : 15/07/2004
// Código   : AL_10
// Descrição: Ajuste para excluir as boletas de direito com movimentação de custódia
//******************************************************************************
// Data	    : 01/07/2004
// Código   : AL_9
// Motivo(S): Retirado o Parametro OPERADOR e o Loop necessário para ele funcionar
//******************************************************************************
// Data	    : 26/06/2004
// Código   : AL_8
// Motivo(S): INCLUÍDA A ROTINA REPROCESSAMENTO DA BONIFICAÇÃO
//******************************************************************************
// Data	    : 26/06/2004
// Código   : AL_7
// Motivo(S): INCLUÍDA A ROTINA DE GRAVAÇÃO NO HISTCAIXA
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_6
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************
// Data	    : 16/06/2004
// Código   : AL_5
// Motivo(S): Passa a refazer os históricos de Custódia também
//******************************************************************************
// Data	    : 14/06/2004
// Código   : AL_4
// Motivo(S): Passa a Excluir Custódia da Transferencia
//******************************************************************************
// Data	    : 04/06/2004
// Código   : AL_3
// Motivo(S): Se a Transferencia for o primeiro registro na carteira, Marca para
//            Reprocessamento
//******************************************************************************
// Data	    : 01/06/2004
// Código   : AL_2
// Motivo(S): Não Exclui ATU marcado para reprocessamento
//******************************************************************************
// Data	    :31/05/2004
// Código   : AL_1
// Motivo(S):Atualização do saldo conforme cotação do dia
//******************************************************************************
// Data	    : 26/05/2004
// Origem   : FUNCEF
// Motivo(S): Ajustes nas rotinas de reprocessamento (Geral)
//******************************************************************************
// Data	    :17/05/2004
// Origem   :FUNCEF
// Função   :ExcluiBoleta
// LINHA(S) :275 e 320
// Motivo(S): Passa a excluir também as operações de Pendência
//            Passa a "flegar" o parâmetro da Ordem para "Aberta"
//******************************************************************************
// Data	    :04/05/2004
// Origem   :FUNCEF
// Função   :IncluiRegistros
// LINHA(S) :908
// Motivo(S): Implementada nessa rotina o tratamento para as operações de
//            Transf. entre Carteiras Gerenciais "TCG"
//******************************************************************************
// Data	    :14/04/2004
// Origem   :FUNCEF
// Função   :IncluiRegistros
// LINHA(S) :1100
// Motivo(S): Implementada nessa rotina o tratamento para as operações de
//            Incorporação, Permulta, Alteração do tipo "DTI"
//******************************************************************************
unit URendaVariavel;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, USistema, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls,UOperacaoInvest,UBibliotecaInvest,
  faMensagem, uCtrlInvContab,
  //AL_134
  uCtrlRendaVariavel, uCtrlPadroes, uOperComum, DbClient, uCtrlCustodia, uDbOperacaoinvest,
  //AL_152
  uCtrlParamInvest;

type

   TRendaVariavel = Class(TObject)

   private

      //AL_135 - Ini
      // Kintana 1533918 SOL 170047.7461 Otacilio Aquino
      //function LancaBoletaOPE(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      // Kintana 1533918 SOL 170047.7461 Otacilio Aquino
      //function LancaBoletaTRC(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaTCU(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaTCG(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaDTA(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaDTO(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaDTC(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaDTG(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaDTS(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaDTI(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaDTB(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaDTD(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaDRS(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaDCI(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaAJQ(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaVSU(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaDRE(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaDSA(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      function LancaBoletaCSA(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
      //AL_134
      function LancaBoletaTRP(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
      //AL_135 - Fim

      //AL_137
      function LancaBoletaTRI(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
      
      function GravaREP(iPlanPrev, iInvestimento, iCarteira: Integer;  dDataRef: TDateTime; var sMessage: String): Boolean;

      // Kintana 1533918 SOL 170047.7461 Otacilio Aquino
      //function AtualizaTotLiqBoleta(sBoleta: String; dDataOper: TDateTime;  var sMessage: String): Boolean;

      //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
      function LancaBoletaTRD(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
      function LancaTransfDirSubs(iTipoOperacao, iInvestimento, iOperInvest, iCarteiraInvest, iCarteiraGerenc,
                                  iPlanoPrevCtbPatrL, iCustodiante,  iMotivoBloq, iOperCust: Integer;
                                  dDataOper: TDateTime;
                                  fValorTransf: Currency;
                                  fQtdTransf: Double;
                                  sDescInvest, sBoleta, sDescTipoOper, sNatureza : String): Boolean;  
   public
      // Kintana 1533918 SOL 170047.7461 Otacilio Aquino ** Inicio **
      function LancaBoletaOPE(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;

      // Kintana 1533918 SOL 170047.7461 Otacilio Aquino
      function LancaBoletaTRC(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
      
      // Kintana 1533918 SOL 170047.7461 Otacilio Aquino
      function AtualizaTotLiqBoleta(sBoleta: String; dDataOper: TDateTime;  var sMessage: String): Boolean;

      //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
      function MarcarFlagReproc(iInvestimento, iICarteiraInvest, iIdPlanPrevCtbPatro: Integer;
                                dDataRef:TDateTime;
                                bExclui: Boolean = False;
                                bMarcaTransf: Boolean = True;
                                bMostraMens: Boolean = True;
                                bRemarca: Boolean = False;
                                sTipoTransf: string = ''): boolean;

      function RemarcaFlgReproc(iInvestimento,iCarteiraInvest, iIdPlanPrevCtbPatro: Integer;
                                dDataAnt, dDataProx: TDateTime): boolean;

      function MarcarFlagContab(sBoleta: String;
                                iHistCartInv: Integer = -1;
                                iOperacaoInvest: Integer = -1): boolean;

      // AL_19 - 27/10/2004 - Novo parametro Default = True;
      function ExcluiBoleta(sBoleta: String;
                            bMostraMsg: boolean;
                            bExclui: Boolean = True;
                            fraFrame: TfraMensagem = nil): boolean;

      function IncluiRegistros(iInvestimento,iCarteiraInvest,
                               iPlanPrev:Integer;
                               dDataProc:TDateTime;
                               //Ricardo Cristiano - 25/07/2011 - N. Sol 156970 -  N. Kintana 1360831
                               bTRC : Boolean = True;
                               //Ricardo Cristiano - 11/08/2011 SOL 163042 - KINTANA 1388966
                               bDTI : Boolean = True): boolean;

      function AtualizaSaldoInvestRV(iInvestimento,iCarteiraInvest,
                                     iPlanoPrev: Integer;
                                     DataProc:TDateTime) : Boolean;
      //AL_135
      function ExcluiHistRV(iPlanPrev, iCarteira, iInvestimento: Integer; dDataIni: TDateTime;
                            idHistcartinv: Integer = -1; sMens: String = ''): boolean;

      function BuscaVlrLiqBoleta(sBoleta: String; var wTotalLiquido: Double): Boolean;

      function MarcaOpeSemHist(dDataIni, dDataFim: TDateTime): Boolean;

      function VerEmAbertura: Boolean;

      function GravaEmAbertura(sFlag: String = 'S'): Boolean;

      function AtualizaSubscricaoVencida(const dDataProc: TDateTime;
                                         Const iOperacaoDireito: Integer = -1;
                                         fraFrame: TfraMensagem = nil): Boolean;

      //Al_134
      function TransfEntrePlanos(CdsSldTRCPlanoSintetico : TClientDataSet;
                                 sBoleta, sObs : String; iCustEx: Integer = -1): boolean;
      //AL_134
      function GeraNumBoleta(dDataOper : TDateTime;
                             sBoleta: String = ''): String;
      //AL_135
      function VerificaMarcado(iPlanPrev, iCarteira, iInvestimento: Integer): Boolean;

      //Al_137
      function TransfEntreCCeCCI(CdsSldTRCCCeCCISintetico : TClientDataSet;
                                 iTipoOperacao : Integer;
                                 sBoleta, sObs : String;
                                 iCustEx: Integer = -1): boolean;
      //AL_149
      Function PermiteUtilizarCarteiraGerenc(DataOperacao: TDateTime; Var sMens: String): Boolean;

      //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
      Function MontaAtuSldInvRV(dDataRef : TDateTime;
                                iIdInvestimento : Integer = -1;
                                iIdCarteiraInvest  : Integer = -1;
                                iIdPlanoPrev  : Integer = -1) : Boolean;

      //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
      Function BuscaDataAntBloqContab(dDataRef: TDateTime): TDateTime;
      Function SincronizacaCotacaoAcaoXCotacaoInvest(iInvestimento:integer;dDataCotacao:TDateTime):Boolean;

      //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
      Function LancaCancelamentoDireitos(dDataOper : TDateTime) : Boolean;

      //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
      procedure FornecedorCli(iIdCustodiante, iInvestimento  : Integer;
                              Var qryTipoOperacao : TwwQuery;
                              Var qryForCli : TwwQuery;
                              Var iIdForCli : Integer);

      //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509                              
      function TransfEntrePlanosDir(CdsDirTRCPlano : TClientDataSet;
                                    iPlanPatroO, iPlanPatroD : Integer;
                                    sObs, sBoleta, sTipoDir : String): boolean;

      //Ricardo Cristiano - 17/04/2011 - N. Sol 157990.4821 -  N. Kintana 1273974                                    
      function AtualizaCarteiraDestino(iInvestimento,iCarteiraInvest,
                                       iPlanoPrev: Integer;
                                       dDataProc:TDateTime) : Boolean;

   end;

   //Renan 17/08/2010 - Sol. 127135 - Kintana 694808 Inicio
   TCustodia = class(TObject)
     FSaldoQtdCustodia: Double;
     FSldLibCustodia: Double;
     FSaldoBloqueado: Double;
   public
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     QryCustodia: TwwQuery;
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     procedure BuscaSaldoCustodia(iPlanoPatro, iCarteira, iCarteiraGerenc,
                                iInvestimento, iCustodiante: Integer;
                                sLote: String; dData: TDateTime);
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     procedure ConciliaCustodia(iPlanoPatro, iCarteira, iCarteiraGerenc,
                                iInvestimento, iCustodiante: Integer;
                                sLote: String; dData: TDateTime);
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     Procedure GravaLogCartXCust(iPlanoPatro, iCarteira, iCarteiraGerenc,
                                   iInvestimento, iCustodiante: Integer;
                                   sLote: String; dData: TDateTime;
                                   FSaldoQtd, FSLiberado, FSBloqueado : Double);
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     procedure ArrumaCustodia(iPlanoPatro, iCarteira, iCarteiraGerenc,
                              iInvestimento, iCustodiante: Integer;
                              sLote: String; dData: TDateTime;
                              FSLiberado, FSBloqueado : Double);
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808 Fim

   end;

var
  RendaVariavel  : TRendaVariavel;
  iIdHistCartInv : Integer;

  //Renan 17/08/2010 - Sol. 127135 - Kintana 694808 Inicio.
  Custodia: TCustodia;
  SLiberado, SBloqueado: Double;
  SLiberadoCC, SBloqueadoCC, SLiberadoCCI, SBloqueadoCCI : Double;
  //Renan 17/08/2010 - Sol. 127135 - Kintana 694808 Fim.

  // AL_119
  AtualizaProcFech: procedure(sMsg: String; iMaximo: Integer = -1);

  fVlrRendimento, wSdoQtdCPMF, wSaldoQtd, wSaldoVlr, wSaldoIRApu, wSaldoInutil,
  // AL_111                                      // AL_131
  wSaldoAqui, wSaldoVar, wSldQtdCCI, wSdoQtdCCI, wSaldoProvPerda : Double;

implementation

uses
  uLancContab, uMensErro,  uDataBase, UImpostos, dOperComum,
  dBaseDados, dOperacaoInvest, fAguarde, UCaixaComum,
  dRendaVariavel, UDiasUteisInv, uIntegraBack, uOpcaoIndice, DCotaComum,
  //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
  UCotaComum, UProvisaoComum, uCMMath, uDocumento;

{ TRendaVariavel }
function TRendaVariavel.ExcluiBoleta(sBoleta: String;
                                     bMostraMsg: boolean;
                                     bExclui: Boolean = True;
                                     fraFrame: TfraMensagem = nil): boolean;
Var
   iPlanilha, iPlano, iDocumento, iIdHistCartInv: longint;
   wDtMov : TDateTime;
   //Ricardo
   sTipoMov : String;
begin
   Result := True;
   try
      try
         with DMRendaVariavel, OperComum do
         begin
            LimpaParametros(qryBoleta);
            qryBoleta.ParamByName('IDBOLETA').AsString := sBoleta;
            qryBoleta.Open;

            if not qryBoleta.isEmpty then
            begin
               //Ricardo 
               sTipoMov := QryBoleta.FieldByName('TIPMOVBOLETA').AsString;

               OperComum.LimpaParametros(qryOperacao);
               qryOperacao.ParamByName('NUMDOCUMENTO').AsString := sBoleta;
               qryOperacao.Open;

               // AL_37
               if fraFrame = nil then
               begin
                  frmAguarde.Pos := 0;
                  frmAguarde.Max := qryBoleta.RecordCount+qryOperacao.RecordCount;
                  frmAguarde.Mostra('Aguarde, Excluindo a Boleta ' + sBoleta);
               end
               else
               begin
                  fraFrame.Mostra;
                  fraFrame.Pos := 0;
                  fraFrame.Max := qryBoleta.RecordCount+qryOperacao.RecordCount;
                  fraFrame.Mes := 'Aguarde, Excluindo a Boleta ' + sBoleta;
                  Application.ProcessMessages;
               end;

               // Exclui as Planilhas e Documentos da Boleta
               qryBoleta.First;
               while not qryBoleta.EOF do
               begin
                  iPlanilha  := -1;
                  iPlano     := -1;
                  iDocumento := -1;

                  if not qryBoleta.FieldByName('CODDOCUMENTO').IsNull then
                     iDocumento := qryBoleta.FieldByName('CODDOCUMENTO').asInteger;

                  if ((qryBoleta.FieldByName('CODDOCUMENTO').IsNull) and
                      (qryBoleta.FieldByName('PLNCODIGO').IsNull)) then
                  begin
                     OperComum.LimpaParametros(qryHistPlnCodigo);
                     qryHistPlnCodigo.ParamByName('IDBOLETA').AsString := sBoleta;
                     qryHistPlnCodigo.Open;
                     if not qryHistPlnCodigo.FieldByName('PLNCODIGO').IsNull then
                     begin
                        iPlano    := qryHistPlnCodigo.FieldByName('PLANO').AsInteger;
                        iPlanilha := qryHistPlnCodigo.FieldByName('PLNCODIGO').AsInteger;
                        iDocumento:= qryHistPlnCodigo.FieldByName('CODDOCUMENTO').AsInteger;
                     end;
                  end
                  else
                  begin
                     if not qryBoleta.FieldByName('PLNCODIGO').IsNull then
                     begin
                        iPlano    := qryBoleta.FieldByName('PLANO').AsInteger;
                        iPlanilha := qryBoleta.FieldByName('PLNCODIGO').AsInteger;
                     end;
                  end;

                  if ((iDocumento > 0) or (iPlanilha > 0)) then
                  begin
                     // Exclui Lançamentos
                     if not ProcExclui(iDocumento, iPlanilha, iPlano, -1,
                                       qryBoleta.FieldByName('DATABOLETA').AsDateTime, bMostraMsg) then
                     begin
                        Result := false;
                        // AL_37
                        if fraFrame = nil then
                           frmAguarde.Apaga
                        else
                           fraFrame.Apaga;
                        Application.ProcessMessages;
                        Exit;
                     end;
                  end;
                  qryBoleta.Next;
                  // AL_37
                  if fraFrame = nil then
                     frmAguarde.Pos := frmAguarde.Pos + 1
                  else
                     fraFrame.Incrementa;
                  Application.ProcessMessages;
               end;

               // Inicia exclusões das Tabelas do Investimento
               qryOperacao.First;
               while not qryOperacao.Eof do
               begin

                  //Ricardo Cristiano - 25/07/2011 - N. Sol 156970 -  N. Kintana 1360831
                  if ((sTipoMov <> 'DTA') and (sTipoMov <> 'DTC') and (sTipoMov <> 'DTO')) then
                  begin
                     // Marca as flags de Recálculo do Histórico
                     MarcaFlgHistCartInv('OPE', qryOperacao.FieldByName('IDOPERACAOINVEST').AsInteger);
                     // Marca as flags de Recálculo da Custódia
                     If qryOperacao.FieldByName('IDCARTEIRAGERENC').IsNull Then
                        MarcaFlgHistCustodia(-1,  qryOperacao.FieldByName('IDOPERACAOINVEST').AsInteger, -1);
                  end;

                  // AL_10 - 15/07/2004 - Direitos com OperCustodia
                  // Capta as Operações de Custodia
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add('SELECT C.IDOPERCUSTODIA, C.IDCUSTODIAORIG, C.IDCUSTODIADEST ');
                  qryAux.SQL.Add('FROM OPERCUSTODIA C');
                  // AL_10 - 15/07/2004
                  qryAux.SQL.Add('WHERE C.IDBOLETA = ''' + sBoleta + ''' ');
                  qryAux.Open;

                  while not qryAux.Eof do
                  begin
                     // Exclui os Históricos de Custódia
                     qryAuxiliar.SQL.Clear;
                     qryAuxiliar.SQL.Add('UPDATE OPERCUSTODIA ');
                     qryAuxiliar.SQL.Add('SET IDCUSTODIAORIG = NULL, IDCUSTODIADEST = NULL ');
                     qryAuxiliar.SQL.Add('WHERE IDOPERCUSTODIA = ' + qryAux.FieldByName('IDOPERCUSTODIA').AsString);
                     qryAuxiliar.ExecSQL;
                     if not qryAux.FieldByName('IDCUSTODIAORIG').IsNull then
                     begin
                        qryAuxiliar.SQL.Clear;
                        qryAuxiliar.SQL.Add('DELETE FROM HISTCUSTODIA ');
                        qryAuxiliar.SQL.Add('WHERE IDCUSTODIA = ' + qryAux.FieldByName('IDCUSTODIAORIG').AsString);
                        qryAuxiliar.ExecSQL;
                     end;
                     if not qryAux.FieldByName('IDCUSTODIADEST').IsNull then
                     begin
                        qryAuxiliar.SQL.Clear;
                        qryAuxiliar.SQL.Add('DELETE FROM HISTCUSTODIA ');
                        qryAuxiliar.SQL.Add('WHERE IDCUSTODIA = ' + qryAux.FieldByName('IDCUSTODIADEST').AsString);
                        qryAuxiliar.ExecSQL;
                     end;

                     if not qryAux.FieldByName('IDOPERCUSTODIA').IsNull then
                     begin
                        qryAuxiliar.SQL.Clear;
                        qryAuxiliar.SQL.Add('DELETE FROM HISTCUSTODIA ');
                        qryAuxiliar.SQL.Add('WHERE IDOPERCUSTODIA = ' + qryAux.FieldByName('IDOPERCUSTODIA').AsString);
                        qryAuxiliar.ExecSQL;

                        // AL_10 - 15/07/2004
                        qryAuxiliar.SQL.Clear;
                        qryAuxiliar.SQL.Add('UPDATE OPERACAOINVEST ');
                        qryAuxiliar.SQL.Add('SET IDOPERCUSTODIA = NULL ');
                        qryAuxiliar.SQL.Add('WHERE IDOPERCUSTODIA = ' + qryAux.FieldByName('IDOPERCUSTODIA').AsString);
                        qryAuxiliar.ExecSQL;

                        qryAuxiliar.SQL.Clear;
                        qryAuxiliar.SQL.Add('DELETE FROM OPERCUSTODIA ');
                        qryAuxiliar.SQL.Add('WHERE IDOPERCUSTODIA = ' + qryAux.FieldByName('IDOPERCUSTODIA').AsString);
                        qryAuxiliar.ExecSQL;
                     end;
                     qryAux.Next;
                  end;

                  // Exclui os Registros da HISTCUSTODIA
                  // Fica para manter compatibilidade de operações que afetam custódia
                  //   sem gravar uma opercustodia
                  //AL_48 - 10/03/2005
                  If qryOperacao.FieldByName('IDCARTEIRAGERENC').IsNull Then
                  begin
                     qryAuxiliar.Close;
                     qryAuxiliar.SQL.Clear;
                     qryAuxiliar.SQL.Text := 'DELETE FROM HISTCUSTODIA WHERE IDOPERACAOINVEST = ' +
                                     qryOperacao.FieldByName('IDOPERACAOINVEST').AsString;
                     qryAuxiliar.ExecSQL;
                     qryAuxiliar.Close;
                  end;
                  //AL_48 - Fim

                  // IRLitigio
                  Impostos.EstornaIRLitigio(qryOperacao.FieldByName('IDOPERACAOINVEST').AsInteger,
                                            qryBoleta.FieldByName('DATABOLETA').AsDateTime);

                  // HistCartinv
                  qryAuxiliar.Close;
                  qryAuxiliar.SQL.Clear;
                  qryAuxiliar.SQL.Text := 'DELETE FROM HISTCARTINV WHERE IDOPERACAOINVEST = ' +
                                  qryOperacao.FieldByName('IDOPERACAOINVEST').AsString;
                  qryAuxiliar.ExecSQL;
                  qryAuxiliar.Close;

                  // DespOperInvest
                  qryAuxiliar.Close;
                  qryAuxiliar.SQL.Clear;
                  qryAuxiliar.SQL.Text := 'DELETE FROM DESPOPERINVEST WHERE IDOPERACAOINVEST = ' +
                                          qryOperacao.FieldByName('IDOPERACAOINVEST').AsString;
                  qryAuxiliar.ExecSQL;
                  qryAuxiliar.Close;

                  // OperXContrato
                  qryAuxiliar.Close;
                  qryAuxiliar.SQL.Clear;
                  qryAuxiliar.SQL.Text := 'DELETE FROM OPERXCONTRATO WHERE IDOPERACAOINVEST = ' +
                                          qryOperacao.FieldByName('IDOPERACAOINVEST').AsString;
                  qryAuxiliar.ExecSQL;
                  qryAuxiliar.Close;

                  // OperInvXOperFdo
                  qryAuxiliar.Close;
                  qryAuxiliar.SQL.Clear;
                  qryAuxiliar.SQL.Text := 'DELETE FROM OPERINVXOPERFDO WHERE IDOPERACAOINVEST = ' +
                                          qryOperacao.FieldByName('IDOPERACAOINVEST').AsString;
                  qryAuxiliar.ExecSQL;
                  qryAuxiliar.Close;

                  //AL_48 - 10/03/2005
                  If Not qryOperacao.FieldByName('IDCARTEIRAGERENC').IsNull Then
                  begin
                     // HistProvisao
                     qryAuxiliar.Close;
                     qryAuxiliar.SQL.Clear;
                     qryAuxiliar.SQL.Text := 'DELETE FROM HISTPROVISAO WHERE IDOPERACAOINVEST = ' +
                                     qryOperacao.FieldByName('IDOPERACAOINVEST').AsString;
                     qryAuxiliar.ExecSQL;
                     qryAuxiliar.Close;

                     //Al_67 - 27/04/2005
                     if qryOperacao.FieldByName('TIPMOVBOLETA').AsString = 'DTA' then
                     begin
                        //AL_46 - 08/03/2005
                        if (not qryOperacao.FieldByName('IDOPERACAODIREITO').IsNull) then
                        begin
                           qryAuxiliar.Close;
                           qryAuxiliar.SQL.Clear;
                           qryAuxiliar.SQL.Text := 'DELETE FROM HISTPROVISAO WHERE IDOPERACAODIREITO = ' +
                                           qryOperacao.FieldByName('IDOPERACAODIREITO').AsString;
                           qryAuxiliar.ExecSQL;
                           qryAuxiliar.Close;
                        end;
                     end;
                     //Al_67 - Fim

                     // HistCaixa
                     qryAuxiliar.Close;
                     qryAuxiliar.SQL.Clear;
                     qryAuxiliar.SQL.Text := 'DELETE FROM HISTCAIXA WHERE IDOPERACAOINVEST = ' +
                                     qryOperacao.FieldByName('IDOPERACAOINVEST').AsString;
                     qryAuxiliar.ExecSQL;
                     qryAuxiliar.Close;

                     wDtMov    := qryBoleta.FieldByName('DATABOLETA').AsDateTime;
                     //AL_45 - 02/03/2005
                     //AL_35 - 23/12/2004
                     if wDtMov <= (pRPI.DATAULTFECH-60) then
                        wDtMov := (pRPI.DATAULTFECH-60)+1;
                     //AL_35 - Fim
                     //AL_45 - Fim

                     //HistCota
                     qryAuxiliar.Close;
                     qryAuxiliar.SQL.Clear;
                     qryAuxiliar.SQL.Text := 'DELETE FROM HISTCOTA WHERE ' +
                                             '(DATAHISTCOTA >= TO_DATE('''+
                                              DateToStr(wDtMov)+''',''DD/MM/YYYY'')) ';
                     qryAuxiliar.ExecSQL;
                     qryAuxiliar.Close;
                  end;
                  //AL_48 - Fim

                  // OperacaoInvest - Tira o Autorelacionamento
                  qryAuxiliar.Close;
                  qryAuxiliar.SQL.Clear;
                  qryAuxiliar.SQL.Text := 'UPDATE OPERACAOINVEST SET IDOPERACAOORIGEM = NULL WHERE IDOPERACAOORIGEM = ' +
                                           qryOperacao.FieldByName('IDOPERACAOINVEST').AsString;
                  qryAuxiliar.ExecSQL;
                  qryAuxiliar.Close;

                  // OperacaoDireito - Volta STATUS da Operação de Direito para Nulo
                  qryAuxiliar.Close;
                  qryAuxiliar.SQL.Clear;
                  qryAuxiliar.SQL.Text := 'UPDATE OPERACAODIREITO ' +
                                          'SET STATUS = NULL ' +
                                          'WHERE IDOPERACAODIREITO = ' +
                                                '(SELECT IDOPERACAODIREITO ' +
                                                ' FROM OPERACAOINVEST ' +
                                                ' WHERE IDOPERACAOINVEST = ' +
                                                  qryOperacao.FieldByName('IDOPERACAOINVEST').AsString + ')';
                  qryAuxiliar.ExecSQL;
                  qryAuxiliar.Close;

                  // OperDireitoXinv - Volta OPERACAOINVEST da Operação de Direito para Nulo
                  qryAuxiliar.Close;
                  qryAuxiliar.SQL.Clear;
                  qryAuxiliar.SQL.Text := 'UPDATE OPERDIREITOXINV SET IDOPERACAOINVEST = NULL '+
                                          'WHERE IDOPERACAODIREITO = ' +
                                                '(SELECT IDOPERACAODIREITO ' +
                                                ' FROM OPERACAOINVEST ' +
                                                ' WHERE IDOPERACAOINVEST = ' +
                                                  qryOperacao.FieldByName('IDOPERACAOINVEST').AsString + ')';
                  qryAuxiliar.ExecSQL;
                  qryAuxiliar.Close;

                  // OperacaoPendencia - Exclui as Pendências desta Operação
                  qryAuxiliar.Close;
                  qryAuxiliar.SQL.Clear;
                  qryAuxiliar.SQL.Text := 'DELETE FROM OPERACAOPENDENTE WHERE IDOPERACAOINVEST = ' +
                                          qryOperacao.FieldByName('IDOPERACAOINVEST').AsString;
                  qryAuxiliar.ExecSQL;
                  qryAuxiliar.Close;

                  //AL_56 - 07/04/2005
                  // OprAcao
                  qryAuxiliar.Close;
                  qryAuxiliar.SQL.Clear;
                  qryAuxiliar.SQL.Text := 'DELETE FROM OPRACAO WHERE IDOPERACAOINVEST = ' +
                                          qryOperacao.FieldByName('IDOPERACAOINVEST').AsString;
                  qryAuxiliar.ExecSQL;
                  qryAuxiliar.Close;

                  // Caso seja Operação de Pendencia e Tiver um Documento, Exclui
                  //AL_122
                  if not qryOperacao.FieldByName('CODDOCUMOPER').IsNull then
                  begin
                     qryAuxiliar.Close;
                     qryAuxiliar.SQL.Clear;
                     qryAuxiliar.SQL.Text := 'UPDATE OPERACAOINVEST SET CODDOCUMENTO = NULL WHERE CODDOCUMENTO = ' +
                                             //AL_122
                                             qryOperacao.FieldByName('CODDOCUMOPER').AsString;
                     qryAuxiliar.ExecSQL;
                     qryAuxiliar.Close;

                     if not ProcExclui(qryOperacao.FieldByName('CODDOCUMOPER').AsInteger ,
                                       //AL_122
                                       -1, -1, -1,
                                       qryOperacao.FieldByName('DATAOPERACAO').AsDateTime,
                                       bMostraMsg) then
                        Raise Exception.Create('Não Foi Possível Excluir Documento de Pendencia.');
                  end;
                  // AL_10 - Fim
                  //AL_122

                  // OperacaoInvest - Exclui a Operação
                  qryAuxiliar.Close;
                  qryAuxiliar.SQL.Clear;
                  qryAuxiliar.SQL.Text := 'DELETE FROM OPERACAOINVEST WHERE IDOPERACAOINVEST = ' +
                                          qryOperacao.FieldByName('IDOPERACAOINVEST').AsString;
                  qryAuxiliar.ExecSQL;
                  qryAuxiliar.Close;
                  //AL_56 - Fim

                  //Ricardo Cristiano - 25/07/2011 - N. Sol 156970 -  N. Kintana 1360831
                  if ((sTipoMov <> 'DTA') and (sTipoMov <> 'DTC') and (sTipoMov <> 'DTO')) then
                  begin
                     // AL_19 - 27/10/2004 - Novo Parametro
                     if not MarcarFlagReproc(qryOperacao.FieldByName('IDINVESTIMENTO').AsInteger,
                                             qryOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             qryOperacao.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                             qryOperacao.FieldByName('DATAOPERACAO').AsDateTime,
                                             bExclui) then
                        Raise Exception.Create('Não Foi Possível Marcar os Registros para Reprocessamento.');
                  end;

                  qryOperacao.Next;
                  // AL_37
                  if fraFrame = nil then
                     frmAguarde.Pos := frmAguarde.Pos + 1
                  else
                     fraFrame.Incrementa;
                  Application.ProcessMessages;
               end;

               //AL_142 - Se não achou a boleta e não fez nada, não precisa executar estes comandos
               // Exclui a Boleta
               qryAuxiliar.Close;
               qryAuxiliar.SQL.Clear;
               qryAuxiliar.SQL.Text := 'DELETE FROM BOLETA WHERE IDBOLETA = ' + QuotedStr(sBoleta);
               qryAuxiliar.ExecSQL;
               qryAuxiliar.Close;

               // Atualiza Saldos da Custodia
               OperacaoInvest.AtualizaSaldosCustodia;

               // Atualiza os Saldos da Carteira Após o Estorno
               AtualizaSaldos(pRPI.VLRCOTAINICART, -1);

               ExecutaQuery(qryAuxiliar, 'UPDATE ORDMOVINV SET STATMOVINV = ''A'', '+
                                         'QTDEORDMOVINV = QTDEORDENADA             '+
                                         'WHERE (NUMDOCMOVINV = ''' + Trim(sBoleta) + ''')');
            end;

         end;

      except on E: Exception do
         begin
            Result := false;
            MsgDlg('Ocorreu um Problema no Estorno da Boleta :'+ #13 +
                    E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   finally
      DMRendaVariavel.qryBoleta.Close;
      DMRendaVariavel.qryOperacao.Close;
      DMRendaVariavel.qryHistPlnCodigo.Close;
      dtmOperComum.qryAuxiliar.Close;
      // AL_37
      if fraFrame = nil then
         frmAguarde.Apaga
      else
         fraFrame.Apaga;
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
   end;
end; 

//Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
function TRendaVariavel.MarcarFlagReproc(iInvestimento, iICarteiraInvest, iIdPlanPrevCtbPatro: Integer;
                                         dDataRef:TDateTime;
                                         bExclui: Boolean = False;
                                         bMarcaTransf: Boolean = True;
                                         bMostraMens: Boolean = True;
                                         bRemarca: Boolean = False;
                                         sTipoTransf: string = ''): boolean;
var wDtMov, dDataAnt, dDataAtu : TDateTime;
    qryBuscaMarcados, qryCarteiras, qryBuscaAltTP  : TwwQuery;
    sCartTransf : String;
    fSaldoQtd, fSaldoInutil: Double;
    //AL_135
    CtrlRV : TCtrlRendaVariavel;
    //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
    iRegAff, iPlanPrev : Integer;
    dDataAno : TDateTime;
    sMessage : String;
begin
   Result := False;
   try
      try
         // AL_74
         //AL_133
         if not CtrlInvContab.TestaPeriodo(DateToStr(dDataRef), 2) then
            Raise Exception.Create(CtrlInvContab.MessageInfo);

         //AL_135
         CtrlRV := TCtrlRendaVariavel.Create;
         CtrlRV.InitializeAs(Padroes);

         //AL_26 - 06/12/2004
         qryBuscaMarcados              := TwwQuery.Create(Application);
         qryBuscaMarcados.DatabaseName := DMRendaVariavel.qryBuscaFlgReproc.DatabaseName;
         qryBuscaMarcados.SQL          := DMRendaVariavel.qryBuscaFlgReproc.SQL;
         qryBuscaMarcados.Params       := DMRendaVariavel.qryBuscaFlgReproc.Params;

         //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
         // AL_118 - Ini

         //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
         //Busca uma Data anterior a data de bloqueio da contabilidade
         dDataAno := BuscaDataAntBloqContab(dDataRef);

         iRegAff := 0;
         if not (CtrlRV.AplicaAtualMarcaFlagReprocMenor(dDataRef,dDataAno,iRegAff,iICarteiraInvest,iIdPlanPrevCtbPatro,iInvestimento)) then
            Raise Exception.Create(CtrlRV.MessageInfo);
         //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
         if ((iRegAff <= 0) and (iInvestimento > 0)) then
         begin
            // Se nenhum registro foi marcado, então
            //    grava um registro do tipo REP temporário, para reprocessar o investimento
            //    Obs. O Registro REP é similar ao INI, porém é excluido ao final do reprocessamento

            //AL_135 - Busca Saldos por Plano / Patrocinadora
            CtrlRV.BuscaSaldoRV.Executa((dDataRef - 1), iIdPlanPrevCtbPatro, iInvestimento, iICarteiraInvest, 0, High(Integer));
            fSaldoQtd := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;

            // Testa saldo = 0, pois os PRP tem saldo negativo
            if fSaldoQtd = 0 then
            begin
               qryCarteiras := TwwQuery.Create(Application);
               qryCarteiras.DatabaseName := 'BaseDados';

               //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
               //AL_136 - Ajuste para Segregação de Planos
               // Verifica na Histcartinv e nas operações (OperacaoInvest e OperCustodia)
               // O histórico pode ter sido excluído
               // AL_126 - Acerto no SQL
               qryCarteiras.SQL.Add('SELECT DISTINCT HISTCARTINV.IDCARTEIRAINVEST, HISTCARTINV.IDPLANPREVCTBPATR ');
               qryCarteiras.SQL.Add('FROM HISTCARTINV ');
               qryCarteiras.SQL.Add('WHERE    HISTCARTINV.IDTIPOINVEST = 2 ');
               if iICarteiraInvest > 0 then
                  qryCarteiras.SQL.Add('  AND HISTCARTINV.IDCARTEIRAINVEST = ' + IntToStr(iICarteiraInvest) + ' ');
               if iInvestimento > 0 then
                  qryCarteiras.SQL.Add('  AND HISTCARTINV.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' ');
               qryCarteiras.SQL.Add('     AND HISTCARTINV.DATAMOVCARTINV BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ',' + QuotedStr('DD/MM/YYYY') + ') AND ');
               qryCarteiras.SQL.Add('                                            TO_DATE(' + QuotedStr(DateToStr(pRPI.DATAULTFECH)) + ',' + QuotedStr('DD/MM/YYYY') + ') ');
               qryCarteiras.SQL.Add('UNION ');
               qryCarteiras.SQL.Add('SELECT DISTINCT OPERACAOINVEST.IDCARTEIRAINVEST, OPERACAOINVEST.IDPLANPREVCTBPATR ');
               qryCarteiras.SQL.Add('FROM OPERACAOINVEST ');
               qryCarteiras.SQL.Add('WHERE    OPERACAOINVEST.DATAOPERACAO BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ',' + QuotedStr('DD/MM/YYYY') + ') AND ');
               qryCarteiras.SQL.Add('                           TO_DATE(' + QuotedStr(DateToStr(pRPI.DATAULTFECH)) + ',' + QuotedStr('DD/MM/YYYY') + ') ');
               if iICarteiraInvest > 0 then
                  qryCarteiras.SQL.Add('  AND OPERACAOINVEST.IDCARTEIRAINVEST = ' + IntToStr(iICarteiraInvest) + ' ');
               if iInvestimento > 0 then
                  qryCarteiras.SQL.Add('  AND OPERACAOINVEST.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' ');
               qryCarteiras.SQL.Add('  AND OPERACAOINVEST.IDTIPOINVEST = 2 ');
               qryCarteiras.SQL.Add('UNION ');
               qryCarteiras.SQL.Add('SELECT DISTINCT OPERCUSTODIA.IDCARTEIRAORIG AS IDCARTEIRAINVEST, OPERCUSTODIA.IDPLANPREVCTBPATR ');
               qryCarteiras.SQL.Add('FROM OPERCUSTODIA ');
               qryCarteiras.SQL.Add('WHERE OPERCUSTODIA.DATAMOVCUSTOD BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ',' + QuotedStr('DD/MM/YYYY') + ') AND ');
               qryCarteiras.SQL.Add('                            TO_DATE(' + QuotedStr(DateToStr(pRPI.DATAULTFECH)) + ',' + QuotedStr('DD/MM/YYYY') + ') ');
               if iICarteiraInvest > 0 then
                  qryCarteiras.SQL.Add('  AND OPERCUSTODIA.IDCARTEIRAORIG = ' + IntToStr(iICarteiraInvest) + ' ');
               if iInvestimento > 0 then
                  qryCarteiras.SQL.Add('  AND OPERCUSTODIA.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' ');
               qryCarteiras.SQL.Add('UNION ');
               qryCarteiras.SQL.Add('SELECT DISTINCT OPERCUSTODIA.IDCARTEIRADEST AS IDCARTEIRAINVEST, OPERCUSTODIA.IDPLANPREVCTBDEST AS IDPLANPREVCTBPATR ');
               qryCarteiras.SQL.Add('FROM OPERCUSTODIA ');
               qryCarteiras.SQL.Add('WHERE OPERCUSTODIA.DATAMOVCUSTOD BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ',' + QuotedStr('DD/MM/YYYY') + ') AND ');
               qryCarteiras.SQL.Add('                            TO_DATE(' + QuotedStr(DateToStr(pRPI.DATAULTFECH)) + ',' + QuotedStr('DD/MM/YYYY') + ') ');
               if iICarteiraInvest > 0 then
                  qryCarteiras.SQL.Add('  AND OPERCUSTODIA.IDCARTEIRADEST = ' + IntToStr(iICarteiraInvest) + ' ');
               if iInvestimento > 0 then
                  qryCarteiras.SQL.Add('  AND OPERCUSTODIA.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' ');
               qryCarteiras.Open;

               while not qryCarteiras.Eof do
               begin
                  //AL_136 - Ajuste para Segregação de Planos
                  if (iIdPlanPrevCtbPatro < 0) or (qryCarteiras.FieldByName('IDPLANPREVCTBPATR').AsInteger = iIdPlanPrevCtbPatro)  then
                  begin
                     if qryCarteiras.FieldByName('IDPLANPREVCTBPATR').IsNull then
                        iPlanPrev := iPlanPrevCtbPatro
                     else
                        iPlanPrev := qryCarteiras.FieldByName('IDPLANPREVCTBPATR').AsInteger;

                     if Not GravaREP(iPlanPrev, iInvestimento, qryCarteiras.FieldByName('IDCARTEIRAINVEST').AsInteger, dDataRef, sMessage) then
                        Raise Exception.Create(sMessage);

                  end;
                  qryCarteiras.Next;
               end;
               FreeAndNil(qryCarteiras);
            end;
         end;
         //AL_26 - FIM

         if bMarcaTransf then
         begin
            OperComum.LimpaParametros(qryBuscaMarcados);
            //Ricardo Cristiano - 29/09/2011 - N. Sol 165694 -  N. Kintana 1438823 - Início
            if iIdPlanPrevCtbPatro > 0 then
               qryBuscaMarcados.ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanPrevCtbPatro;
            if iICarteiraInvest    > 0 then
               qryBuscaMarcados.ParamByName('IDCARTEIRAINVEST').AsInteger := iICarteiraInvest;
            if iInvestimento > 0 then
               qryBuscaMarcados.ParamByName('IDINVESTIMENTO').AsInteger   := iInvestimento;
            //Ricardo Cristiano - 29/09/2011 - N. Sol 165694 -  N. Kintana 1438823 - Fim               
            qryBuscaMarcados.Open;               
            qryBuscaMarcados.First;
            while not qryBuscaMarcados.Eof do
            begin
               // Busca TRCs no período
               OperComum.LimpaParametros(DMRendaVariavel.qryVerTRCPeriodo);
               DMRendaVariavel.qryVerTRCPeriodo.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryBuscaMarcados.FieldByName('IDPLANPREVCTBPATR').AsInteger;
               DMRendaVariavel.qryVerTRCPeriodo.ParamByName('IDCARTEIRAINVEST').AsInteger  := qryBuscaMarcados.FieldByName('IDCARTEIRAINVEST').AsInteger;
               DMRendaVariavel.qryVerTRCPeriodo.ParamByName('IDINVESTIMENTO').AsInteger    := qryBuscaMarcados.FieldByName('IDINVESTIMENTO').AsInteger;
               DMRendaVariavel.qryVerTRCPeriodo.ParamByName('DATAMOVCUSTOD').AsString      := qryBuscaMarcados.FieldByName('DATAMOVCARTINV').AsString;
               //Renan Cristiano - 19/02/2009 - N Sol 107630 - N. Kintana 484313
               DMRendaVariavel.qryVerTRCPeriodo.ParamByName('TIPMOVBOLETA').AsString      := sTipoTransf;
               DMRendaVariavel.qryVerTRCPeriodo.Open;
               while not DMRendaVariavel.qryVerTRCPeriodo.Eof do
               begin
                  //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
                  //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
                  //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
                  //Busca uma Data anterior a data de bloqueio da contabilidade
                  dDataAno := BuscaDataAntBloqContab(dDataRef);
                  //Ricardo Cristiano - 07/08/2008 - N. Sol 92822 -  N. Kintana 389089
                  iRegAff := 0;
                  if not (CtrlRV.AplicaAtualMarcaFlagReprocMenor(DMRendaVariavel.qryVerTRCPeriodo.FieldByName('DATAMOVCUSTOD').AsDateTime,
                                                                 dDataAno, iRegAff,
                                                                 DMRendaVariavel.qryVerTRCPeriodo.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                 DMRendaVariavel.qryVerTRCPeriodo.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                                 DMRendaVariavel.qryVerTRCPeriodo.FieldByName('IDINVESTIMENTO').AsInteger)) then
                     Raise Exception.Create(CtrlRV.MessageInfo);
                  //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
                  if iRegAff <= 0 then
                  begin
                     // Se não marcou ninguém, é por que não tem registro no dia anterior, então inclui um saldo REP
                     if Not GravaREP(DMRendaVariavel.qryVerTRCPeriodo.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                     DMRendaVariavel.qryVerTRCPeriodo.FieldByName('IDINVESTIMENTO').AsInteger,
                                     DMRendaVariavel.qryVerTRCPeriodo.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                     DMRendaVariavel.qryVerTRCPeriodo.FieldByName('DATAMOVCUSTOD').AsDateTime, sMessage) then
                        Raise Exception.Create(sMessage);

                  end;                 
                  DMRendaVariavel.qryVerTRCPeriodo.Next;
               end;

               //Ricardo Cristiano - 06/11/2010 - N. Sol 147252 -  N. Kintana 1014147
               DMRendaVariavel.qryVerTRCPeriodo.Close;

               //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
               //Ricardo Cristiano - 06/11/2010 - N. Sol 147252 -  N. Kintana 1014147
               DMRendaVariavel.qryVerTRPPeriodo.Close;
               // Busca TPDs no período
               OperComum.LimpaParametros(DMRendaVariavel.qryVerTRPPeriodo);
               DMRendaVariavel.qryVerTRPPeriodo.ParamByName('IDCARTEIRAINVEST').AsInteger  := qryBuscaMarcados.FieldByName('IDCARTEIRAINVEST').AsInteger;
               DMRendaVariavel.qryVerTRPPeriodo.ParamByName('IDINVESTIMENTO').AsInteger    := qryBuscaMarcados.FieldByName('IDINVESTIMENTO').AsInteger;
               DMRendaVariavel.qryVerTRPPeriodo.ParamByName('DATAMOVCUSTOD').AsString      := qryBuscaMarcados.FieldByName('DATAMOVCARTINV').AsString;
               //Ricardo Cristiano - 06/11/2010 - N. Sol 147252 -  N. Kintana 1014147
               DMRendaVariavel.qryVerTRPPeriodo.ParamByName('TIPMOVBOLETA').AsString       := 'TPD';
               DMRendaVariavel.qryVerTRPPeriodo.Open;
               
               while not DMRendaVariavel.qryVerTRPPeriodo.Eof do
               begin
                  //Busca uma Data anterior a data de bloqueio da contabilidade
                  dDataAno := BuscaDataAntBloqContab(dDataRef);
                  iRegAff := 0;
                  if not (CtrlRV.AplicaAtualMarcaFlagReprocMenor(DMRendaVariavel.qryVerTRPPeriodo.FieldByName('DATAMOVCUSTOD').AsDateTime, dDataAno, iRegAff,
                                                                 DMRendaVariavel.qryVerTRPPeriodo.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                 DMRendaVariavel.qryVerTRPPeriodo.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                                 DMRendaVariavel.qryVerTRPPeriodo.FieldByName('IDINVESTIMENTO').AsInteger)) then
                     Raise Exception.Create(CtrlRV.MessageInfo);

                  if iRegAff <= 0 then
                  begin
                     // Se não marcou ninguém, é por que não tem registro no dia anterior, então inclui um saldo REP
                     if Not GravaREP(DMRendaVariavel.qryVerTRPPeriodo.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                     DMRendaVariavel.qryVerTRPPeriodo.FieldByName('IDINVESTIMENTO').AsInteger,
                                     DMRendaVariavel.qryVerTRPPeriodo.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                     DMRendaVariavel.qryVerTRPPeriodo.FieldByName('DATAMOVCUSTOD').AsDateTime, sMessage) then
                        Raise Exception.Create(sMessage);
                  end;
                  DMRendaVariavel.qryVerTRPPeriodo.Next;
               end;
               DMRendaVariavel.qryVerTRPPeriodo.Close;
               //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509

               qryBuscaMarcados.Next;
            end;
            OperComum.LimpaParametros(DMRendaVariavel.qryVerTRCPeriodo);
         end;
         //AL_118 - Fim

         //AL_152 - Ini - Marcar as duas pontas das operações de Alteração de Tipo
         OperComum.LimpaParametros(qryBuscaMarcados);
         //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
         if bRemarca then
         begin
            //Ricardo Cristiano - 29/09/2011 - N. Sol 165694 -  N. Kintana 1438823 - Início
            if iIdPlanPrevCtbPatro > 0 then
               qryBuscaMarcados.ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanPrevCtbPatro;
            if iICarteiraInvest    > 0 then
               qryBuscaMarcados.ParamByName('IDCARTEIRAINVEST').AsInteger := iICarteiraInvest;
            if iInvestimento > 0 then
               qryBuscaMarcados.ParamByName('IDINVESTIMENTO').AsInteger   := iInvestimento;
            //Ricardo Cristiano - 29/09/2011 - N. Sol 165694 -  N. Kintana 1438823 - Fim               
         end;
         qryBuscaMarcados.Open;
         qryBuscaMarcados.First;
         //AL_156 - Ini
         if not qryBuscaMarcados.Eof then
         begin
            qryBuscaAltTP := TwwQuery.Create(Application);
            qryBuscaAltTP.DatabaseName := 'BaseDados';
         end;
         while not qryBuscaMarcados.Eof do
         begin
            // Busca Alterações de Tipo no período
            qryBuscaAltTP.Close;
            qryBuscaAltTP.SQL.Clear;
            //AL_156 - Fim
            qryBuscaAltTP.SQL.Add('SELECT DISTINCT O.IDINVESTIMENTO, O.IDCARTEIRAINVEST, O.IDPLANPREVCTBPATR, O.DATAOPERACAO ');
            qryBuscaAltTP.SQL.Add('FROM OPERACAOINVEST O ');
            qryBuscaAltTP.SQL.Add('WHERE O.IDOPERACAODIREITO IN ');
            qryBuscaAltTP.SQL.Add('        (SELECT IDOPERACAODIREITO ');
            qryBuscaAltTP.SQL.Add('         FROM OPERACAOINVEST OP ');
            qryBuscaAltTP.SQL.Add('         WHERE OP.IDINVESTIMENTO = ' + qryBuscaMarcados.FieldByName('IDINVESTIMENTO').AsString);
            qryBuscaAltTP.SQL.Add('           AND OP.IDPLANPREVCTBPATR = ' + qryBuscaMarcados.FieldByName('IDPLANPREVCTBPATR').AsString);
            qryBuscaAltTP.SQL.Add('           AND OP.IDCARTEIRAINVEST = ' + qryBuscaMarcados.FieldByName('IDCARTEIRAINVEST').AsString);
            qryBuscaAltTP.SQL.Add('           AND OP.DATAOPERACAO >= TO_DATE(' + QuotedStr(qryBuscaMarcados.FieldByName('DATAMOVCARTINV').AsString) + ',' + QuotedStr('DD/MM/YYYY') + ')');
            qryBuscaAltTP.SQL.Add('           AND OP.IDTIPOOPERACAO IN (' + IntToStr(CtrlPInv.IdTipoOperDirAlt) + ',' +
                                                                            IntToStr(CtrlPInv.IdTipoOperDirAlt + 10000) + ' ))');
            qryBuscaAltTP.Open;

            while not qryBuscaAltTP.Eof do
            begin
               //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
               // Marca a outra ponta de cada TRC

               //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
               //Busca uma Data anterior a data de bloqueio da contabilidade
               dDataAno := BuscaDataAntBloqContab(dDataRef);
               //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
               iRegAff := 0;
               if not (CtrlRV.AplicaAtualMarcaFlagReprocMenor(qryBuscaAltTP.FieldByName('DATAOPERACAO').AsDateTime, dDataAno, iRegAff,
                                                              qryBuscaAltTP.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                              qryBuscaAltTP.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                              qryBuscaAltTP.FieldByName('IDINVESTIMENTO').AsInteger)) then
                  Raise Exception.Create(CtrlRV.MessageInfo);
               //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
               if iRegAff <= 0 then
               begin
                  // Se não marcou ninguém, é por que não tem registro no dia anterior, então inclui um saldo REP
                  if Not GravaREP(qryBuscaAltTP.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                  qryBuscaAltTP.FieldByName('IDINVESTIMENTO').AsInteger,
                                  qryBuscaAltTP.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                  qryBuscaAltTP.FieldByName('DATAOPERACAO').AsDateTime, sMessage) then
                     Raise Exception.Create(sMessage);

               end;
               qryBuscaAltTP.Next;
            end;
            qryBuscaMarcados.Next;
            //AL_154
            qryBuscaAltTP.Close;
         end;
         //AL_152 - Fim

         if qryBuscaAltTP <> nil then
            FreeAndNil(qryBuscaAltTP);

         //AL_154

         if bExclui then
         begin
            OperComum.LimpaParametros(qryBuscaMarcados);
            qryBuscaMarcados.Open;
            qryBuscaMarcados.First;
            while not qryBuscaMarcados.Eof do
            begin
               //Al_77 - 21/06/2005
               //AL_19 - Não exclui o registro marcado
               //AL_135
               if not RendaVariavel.ExcluiHistRV(qryBuscaMarcados.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 qryBuscaMarcados.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                 qryBuscaMarcados.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 dDataRef) then
                  Raise Exception.Create('Não foi possível excluir os históricos.');
               qryBuscaMarcados.Next;
            end;
            OperComum.LimpaParametros(qryBuscaMarcados);
         end;

         Result := True;
      except
         on E: Exception do
         begin
            Result := False;
            if bMostraMens then
               MsgDlg('Ocorreu um problema ao marcar os registros para exclusão.'#13+
                      E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   finally
      //AL_135
      FreeAndNil(CtrlRV);
      //AL_152
      //AL_156
      if qryBuscaAltTP <> nil then
         FreeAndNil(qryBuscaAltTP);
      if qryCarteiras <> nil then
         FreeAndNil(qryCarteiras);

      //Ricardo Cristiano - 06/11/2010 - N. Sol 147252 -  N. Kintana 1014147
      DMRendaVariavel.qryVerTRPPeriodo.Close;
      DMRendaVariavel.qryVerTRCPeriodo.Close;

      OperComum.LimpaParametros(DMRendaVariavel.qryVerTRPPeriodo);
      OperComum.LimpaParametros(DMRendaVariavel.qryVerTRCPeriodo);
      OperComum.LimpaParametros(qryBuscaMarcados);
   end;
end;

// AL_120
function TRendaVariavel.RemarcaFlgReproc(iInvestimento, iCarteiraInvest, iIdPlanPrevCtbPatro: Integer;
                                         dDataAnt, dDataProx: TDateTime): boolean;
begin
   //AL_135 - Ini
   try
      try
         Result := False;
         // Desmarca o Investimento
         OperComum.LimpaParametros(DMRendaVariavel.qryDesmarcaFlgReproc, True);
         if iIdPlanPrevCtbPatro > 0 then
            DMRendaVariavel.qryDesmarcaFlgReproc.ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanPrevCtbPatro;
         if iCarteiraInvest > 0 then
            DMRendaVariavel.qryDesmarcaFlgReproc.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteiraInvest;
         if iInvestimento > 0 then
            DMRendaVariavel.qryDesmarcaFlgReproc.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         DMRendaVariavel.qryDesmarcaFlgReproc.ParamByName('DATAMOVCARTINV').AsString := DateToStr(dDataAnt);
         DMRendaVariavel.qryDesmarcaFlgReproc.ExecSQL;
         if DMRendaVariavel.qryDesmarcaFlgReproc.RowsAffected <= 0 then
            Raise Exception.Create('O Investimento não pode ser remarcado do dia ' + DateToStr(dDataAnt));
         OperComum.LimpaParametros(DMRendaVariavel.qryDesmarcaFlgReproc);

         //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
         // Além de desmarcar, exclui o Registro REP, para o investimento ser remarcado para o dia seguinte
         OperComum.LimpaParametros(DMRendaVariavel.qryAux);         
         DMRendaVariavel.qryAux.SQL.Clear;
         DMRendaVariavel.qryAux.SQL.Add('DELETE FROM HISTCARTINV  ');
         DMRendaVariavel.qryAux.SQL.Add('WHERE HISTCARTINV.IDTIPOINVEST = 2 ');
         if iIdPlanPrevCtbPatro > 0 then
            DMRendaVariavel.qryAux.SQL.Add('  AND HISTCARTINV.IDPLANPREVCTBPATR = ' + IntToStr(iIdPlanPrevCtbPatro));
         if iCarteiraInvest > 0 then
            DMRendaVariavel.qryAux.SQL.Add('  AND HISTCARTINV.IDCARTEIRAINVEST = ' + IntToStr(iCarteiraInvest));
         if iInvestimento > 0 then
            DMRendaVariavel.qryAux.SQL.Add('  AND HISTCARTINV.IDINVESTIMENTO = ' + IntToStr(iInvestimento));
         DMRendaVariavel.qryAux.SQL.Add('  AND HISTCARTINV.DATAMOVCARTINV <= TO_DATE(' + QuotedStr(DateToStr(dDataAnt)) + ', ' + QuotedStr('dd/mm/yyyy') + ')');
         DMRendaVariavel.qryAux.SQL.Add('  AND HISTCARTINV.TIPMOVCARTINV = ''REP'' ');
         DMRendaVariavel.qryAux.ExecSql;
         OperComum.LimpaParametros(DMRendaVariavel.qryAux);
         DMRendaVariavel.qryAux.SQL.Clear;         

         Result := True;
      except
         on E: Exception do
         begin
            Result := False;
            MsgDlg('Ocorreu um problema.'#13+
                   E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;      
      end;
   finally
      OperComum.LimpaParametros(DMRendaVariavel.qryDesmarcaFlgReproc);
      OperComum.LimpaParametros(DMRendaVariavel.qryAux);
   end;
   //AL_135 - Fim
end;

//AL_135 - Segregação de Carteiras - Toda a rotina foi alterada
function TRendaVariavel.IncluiRegistros(iInvestimento,iCarteiraInvest,
                                        iPlanPrev:Integer;
                                        dDataProc:TDateTime;
                                        //Ricardo Cristiano - 25/07/2011 - N. Sol 156970 -  N. Kintana 1360831
                                        bTRC : Boolean = True;
                                        //Ricardo Cristiano - 11/08/2011 SOL 163042 - KINTANA 1388966
                                        bDTI : Boolean = True): boolean;
var bFazAtu: Boolean;
    sMessage, sBoleta : String;
begin
   bFazAtu := True;
   //Al_78 - 27/06/2005
   // Verifico se existem boletas do Investimento para Relançar
   try
      try
         OperComum.LimpaParametros(DMRendaVariavel.qryBuscaBoletas);
         DMRendaVariavel.qryBuscaBoletas.ParamByName('dDataRef').AsString           := DateToStr(dDataProc);
         DMRendaVariavel.qryBuscaBoletas.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
         DMRendaVariavel.qryBuscaBoletas.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
         //AL_135
         DMRendaVariavel.qryBuscaBoletas.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         DMRendaVariavel.qryBuscaBoletas.Open;
         while not DMRendaVariavel.qryBuscaBoletas.EOF do
         begin
            //AL_74
            //AL_133
            if not CtrlInvContab.TestaPeriodo(DateToStr(dDataProc), 2) then
               Raise Exception.Create(CtrlInvContab.MessageInfo);

            sBoleta := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
            while not (DMRendaVariavel.qryBuscaBoletas.EOF) and (sBoleta = DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString) do
            begin
               //AL_135 - Ini
               if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'OPE') or
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'AJC')  then
                  //OPE - Operações de C/V
                  LancaBoletaOPE(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'TRC') then
               begin
                  //Ricardo Cristiano - 25/07/2011 - N. Sol 156970 -  N. Kintana 1360831
                  //TRC - Tranferência entre Carteiras - Alteração de Cesta Opções de Índice
                  if bTRC then
                     LancaBoletaTRC(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
                  else
                     DMRendaVariavel.qryBuscaBoletas.Last;
               end
               //AL_134
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'TRP') then
                  //TRP - Tranferência entre Planos
                  LancaBoletaTRP(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               //AL_137
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'TRI') then
                  //TRI - Tranferência entre CC e CCI
                  LancaBoletaTRI(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'TCU') then
                  //TCU - Tranferência entre Custodiantes
                  LancaBoletaTCU(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'TCG') then
                  //TCG - Tranferência entre Carteiras Gerenciais
                  LancaBoletaTCG(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'DTA') then
                  //DTA - Anuncio de Proventos dos Direitos que não afetam a Quantidade (Dividendos, Juros s/ Capital e Multa)
                  LancaBoletaDTA(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'DTO') then
                  //DTO - Direitos que não afetam a Quantidade (Dividendos, Juros s/ Capital e Multa)
                  LancaBoletaDTO(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'DTC') then
                  //DTC - Cancelamento de Dividendos
                  LancaBoletaDTC(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'DTG') then
                  //DTG - Direitos que afetam a Quantidade(GRUPAMENTO ...)
                  LancaBoletaDTG(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'DTS') then
                  //DTS - Direitos que afetam a Quantidade(SUBSCRIÇÃO ...)
                  LancaBoletaDTS(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'DTI') then
               begin
                  //Ricardo Cristiano - 11/08/2011 SOL 163042 - KINTANA 1388966
                  //DTI - Direitos que afetam a Quantidade(INCORPORAÇÃO, ALTERAÇÃO DE TIPO, PERMUTA)
                  if bDTI then
                     LancaBoletaDTI(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
                  else
                     DMRendaVariavel.qryBuscaBoletas.Last;
               end      
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'DTB') then
                  //DTB - Direitos que afetam a Quantidade(Bonificação)
                  LancaBoletaDTB(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'DTD') then
                  //DTD - Direitos que afetam a Quantidade(Desdobramento)
                  LancaBoletaDTD(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'DRS') then
                  //DRS - Direitos nao afetam a Quantidade(Restituição de Capital ...)
                  LancaBoletaDRS(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'DCI') then
                  //DCI - CISÃO - Direito que afetam a Quantidade
                  LancaBoletaDCI(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'AJQ') then
                  //AJQ - Ajuste de Quantidade - Tela de Ajuste de Custódia
                  LancaBoletaAJQ(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'DRE') then
                  //DRE - Reorganização Societária
                  LancaBoletaDRE(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'VSU') then
                  //VSU - Vencimento de Subscrição
                  LancaBoletaVSU(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'DSA') then
                  //DSA - Direitos que afetam a Quantidade(SUBSCRICAO COM AÇÕES)
                  LancaBoletaDSA(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'CSA') then
                  //CSA - Cancelamento de  SUBSCRICAO COM AÇÕES
                  LancaBoletaCSA(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev)
               //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
               else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'TPD') then
                  //TPD - Transferência de planos de Direitos, subscrição.
                  LancaBoletaTRD(dDataProc, iInvestimento, iCarteiraInvest, iPlanPrev);

               // Marcar Flg = 6 para Contabilizar
               // AL_102 - 10/10/2005 - DRE - Reorganização Societária
               // AL_91 - 10/08/2005 - VSU Já contabiliza
               // AL_114
               // AL_129
               if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'TRC') and   //Transf. entre Carteiras
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'TRP') and   //Transf. entre Planos
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'TCG') and   //Transf. entre Carteiras Gerenciais
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'DTG') and   //Direitos - Grupamento
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'DTS') and   //Direitos - Subscrição
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'DTA') and   //Anuncio de Proventos / Direitos - Dividendos, Juros s/Cap e Multa
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'DTO') and   //Direitos - Dividendos e Juros s/Cap
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'DTI') and   //Direitos - Incorporação/Permulta/Alteração do Tipo
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'DTB') and   //Direitos - Bonificação
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'DTD') and   //Direitos - Desdobramento
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'DRS') and   //Direitos - Restituição de Capital
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'DCI') and   //Direitos - Cisão
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'PEN') and   //Pendência de Liquidação de Bolsa
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'AJQ') and   //Ajuste de Quantidade
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'VSU') and   //Vencimento de Subscrição
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'DSA') and   //Subscrição com Ações
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'DRE') and   //Reorganização Societária
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'CSA') and   //Cancelamento de Subscrição com Ações
                  (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString <> 'DTC') then  //Cancelamento de Anúncios
               begin
                  if not MarcarFlagContab(sBoleta) then
                     Raise Exception.Create('Não foi possível marcar uma Boleta para Contabilização ' + #13 +
                                            'Dia: ' + DateToStr(dDataProc) + #13 +
                                            'Boleta: ' + sBoleta + #13 +
                                            'O Processo será Cancelado');

                  // Atualiza o Valor Total a Liquidar da Boleta
                  AtualizaTotLiqBoleta(sBoleta, dDataProc, sMessage);

                  // AL_31 - Fim
               end;

               // Proximo Registro
               DMRendaVariavel.qryBuscaBoletas.Next;
            end;
         end;

         Result  := True;
      except
         On E:Exception Do
         Begin
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         end;
      end;
   finally
      DMRendaVariavel.qryBuscaBoletas.close;
   end;
   //Al_78 - 27/06/2005

end;

// Atualiza os Saldos dos Investimentos
Function TRendaVariavel.AtualizaSaldoInvestRV(iInvestimento,iCarteiraInvest,
                                              iPlanoPrev : Integer;
                                              DataProc: TDateTime) : Boolean;
Var
   //AL_135
   wMoedaReg, wMoeCodigo, wTipoOperacao, wIdForCli: Integer;
   wAgioDesagio, wQtdInvest, wVlrNovaCotacao, wSaldoVariacaoDia, wVlrIRDia,
   wVlrIOF, wSaldoIRProv, wSaldoIOFProv, wSaldoInutil, wSaldoAqui, wSaldoVariacao, wVlrAntCotacao,
   wVariacaoContab, fVlrVariacao, fPercProvPerda, wSaldoProvPerda : Double;
   //William Manoel dos Santos - Kintana 523191 SOL 64043 - INI
   wVlrNovoSaldo, wVlrSaldoInvest : Currency;
   //William Manoel dos Santos - Kintana 523191 SOL 64043 - FIM
   wPlanilha, wDocumento, wPlano, wPlanoAC, wPlanilhaAC, wDocumentoAC: Integer;
   wDia, wMes, wAno : Word;
   wDataProcAnt: TDateTime;
   wNaturezaMovimento, wTipoPapel, wMensErro,sDescricaoLog: String;
   CtrlRV: TCtrlRendaVariavel;
Const
   wMensagem: Array[-9..0] Of String =
              (' ',
               ' ',
               'Não foi possível efetuar o lançamento de CAP/CAR.',
               'Não foi possível efetuar o lançamento contábil.',
               'Não foi encontrado Padrão de Lançamento que atenda os parâmetros passados.',
               'Problema na gravação.',
               'Ambigüidade no Padrão de Lançamento.',
               'Operação com valor igual a "ZERO".',
               'Tipo de Operação não gera Lançamento Contábil nem Lançamento CAP/CAR.',
               'Lançamento(s) realizados com sucesso.');
Begin
   // AL_119
   // Cria um try/finally para destruir os objetos locais e fechar as queries abertas
   try // Finally
      try
         Result := True;
         // Cria Objetos Locais

         //AL_135
         CtrlRV := TCtrlRendaVariavel.Create;
         CtrlRV.InitializeAs(Padroes);

         wMoedaReg     :=  0;
         wAgioDesagio  :=  0;
         wMoecodigo    :=  0;

         wTipoOperacao := -1;
         wPlanilha     := -1;
         wPlano        := -1;
         wDocumento    := -1;
         wPlanilhaAC   := -1;
         wPlanoAC      := -1;
         wDocumentoAC  := -1;

         // Busca Dados dos Investimentos nas Carteiras
         //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
         if not MontaAtuSldInvRV(DataProc, iInvestimento, iCarteiraInvest, iPlanoPrev) then
            Raise Exception.Create('Não foi possível Atualizar os Saldos dos Investimentos no dia '+DateToStr(DataProc)+'. '#13+
                                   'O processo será cancelado.');

         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Processando Dia : ' + DateToStr(DataProc) + #13 +
                             'Plano/Patrocinadora: ' + DMRendaVariavel.qryAtuSldInvRV.FieldByName('PLANPRVCONTABPATRO').AsString + #13 +
                             'Carteira: ' + DMRendaVariavel.qryAtuSldInvRV.FieldByName('DESCCARTINVEST').AsString + #13 +
                             'Investimento: ' + DMRendaVariavel.qryAtuSldInvRV.FieldByName('DESCINVESTIMENTO').AsString,
                             DMRendaVariavel.qryAtuSldInvRV.RecordCount);

         // Decodifica Data
         DecodeDate(DataProc, wAno, wMes, wDia);

         // Achar o dia útil anterior
         wDataProcAnt    := DataProc - 1;
         While not DiasUteisInv.DiaUtil(wDataProcAnt, -1, 1,'',True,False,False) Do
            wDataProcAnt:= wDataProcAnt - 1;   // Achar o dia útil anterior

         // Enquanto existem Registro na tabela calcula Atualização
         While Not DMRendaVariavel.qryAtuSldInvRV.Eof Do
         Begin
            OperComum.LimpaParametros(DMRendaVariavel.qryBuscaATU);
            DMRendaVariavel.qryBuscaATU.ParamByName('IDCARTEIRAINVEST').AsInteger  := DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDCARTEIRAINVEST').AsInteger;
            if not DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDCARTEIRAGERENC').IsNull then
               DMRendaVariavel.qryBuscaATU.ParamByName('IDCARTEIRAGERENC').AsInteger := DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDCARTEIRAGERENC').AsInteger;
            DMRendaVariavel.qryBuscaATU.ParamByName('IDINVESTIMENTO').AsInteger      := DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDINVESTIMENTO').AsInteger;
            DMRendaVariavel.qryBuscaATU.ParamByName('DATAMOVCARTINV').AsString       := DateToStr(DataProc);
            DMRendaVariavel.qryBuscaATU.ParamByName('IDPLANPREVCTBPATR').AsInteger   := DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            DMRendaVariavel.qryBuscaATU.Open;
            if not DMRendaVariavel.qryBuscaATU.IsEmpty then
            begin
               //AL_124 - Não esquipa mais, exclui o ATU e lança outro
               while not DMRendaVariavel.qryBuscaATU.Eof do
               begin
                  if DMRendaVariavel.qryBuscaATU.FieldByName('PLNCODIGO').IsNull then
                  begin
                     //AL_139 - Passa a valer a exclusão em 3 camadas
                     //AL_147
                     if not CtrlInvContab.InvExcluiLanc(DMRendaVariavel.qryBuscaATU.FieldByName('PLNCODIGO').AsInteger, 0, Sistema.UsaPlanoPatro, False) then
                        Raise Exception.Create('Não foi possível limpar planilha da atualização existente.' + #13 +
                                               'Planilha: ' +DMRendaVariavel.qryBuscaATU.FieldByName('PLNCODIGO').AsString + ' em ' + DateToStr(DataProc));
                  end;

                  CtrlRV.ExecSQL('DELETE FROM HISTCARTINV WHERE IDHISTCARTINV = ' + DMRendaVariavel.qryBuscaATU.FieldByName('IDHISTCARTINV').AsString);

                  DMRendaVariavel.qryBuscaATU.Next;
               end;

               //AL_124 - Fim
            end;
            //AL_124
            OperComum.LimpaParametros(DMRendaVariavel.qryBuscaATU);

            // Verifica o Saldo do Investimento em questão na Carteira em Questao
            wQtdInvest         :=0;
            wVlrSaldoInvest    :=0;
            wVlrNovoSaldo      :=0;
            wSaldoVariacaoDia  :=0;
            wVlrIRDia          :=0;
            wVlrIOF            :=0;
            wVlrNovaCotacao    :=0;
            wSaldoIRProv       :=0;
            wSaldoIOFProv      :=0;
            wSaldoInutil       :=0;
            wSaldoAqui         :=0;
            wSaldoVariacao     :=0;

            //AL_135
            // Busca Todos os Saldos do Investimento (3 camadas) - Segregação de Planos
            CtrlRV.BuscaSaldoRV.Executa(DataProc,
                                        DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                        DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDINVESTIMENTO').AsInteger,
                                        DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDCARTEIRAGERENC').AsInteger);

            wQtdInvest := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;
            wVlrSaldoInvest := CtrlRV.BuscaSaldoRV.SaldoVlrTotal;
            wSaldoAqui := CtrlRV.BuscaSaldoRV.SaldoCusto;
            wSaldoVariacao := CtrlRV.BuscaSaldoRV.SaldoVariacao;
            wSaldoIRProv := CtrlRV.BuscaSaldoRV.SaldoIRProv;
            wSaldoIOFProv := CtrlRV.BuscaSaldoRV.SaldoIOFProv;
            wSaldoProvPerda := CtrlRV.BuscaSaldoRV.SaldoProvPerda;

            // Caso Saldo zerado pula
            If (wQtdInvest = 0) then
            Begin
               DMRendaVariavel.qryAtuSldInvRV.Next;
               Continue;
            End;

            //AL_131 - Saldo = Saldo + Provisão de Perda
            wVlrSaldoInvest := wVlrSaldoInvest + wSaldoProvPerda;

            // Busca Cotacao do Investimento
            wVlrNovaCotacao := OperComum.BuscaCotacaoInvest(DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDINVESTIMENTO').AsInteger,
                                                            DataProc, True);
            //Al_24 - 11/04/2005
            if wVlrNovaCotacao = 0 then // Não existe Cotação
               wVlrNovoSaldo  := wVlrSaldoInvest
            else
            begin
               //Al_75 - 21/06/2005
               if OperComum.Round(wQtdInvest*wVlrNovaCotacao,2) = 0 then
                  wVlrNovoSaldo  := 0
               else
               begin
                  // AL_106
                  If FloatToStrF(wVlrNovaCotacao,ffNumber,18,9) = '0,000000001' then
                     wVlrNovoSaldo  := 0
                  else
                     wVlrNovoSaldo  := OperComum.Trunca(wQtdInvest*wVlrNovaCotacao,2);
               end;
               //Al_75 - Fim
            end;
            //Al_24 - Fim

            // Busca Cotacao do Investimento
            wVlrAntCotacao := OperComum.BuscaCotacaoInvest(DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDINVESTIMENTO').AsInteger,
                                                           wDataProcAnt, True);
            // Calcula Novo Valor do Saldo caso Renda Variavel
            wVariacaoContab   :=(wVlrNovoSaldo-OperComum.Trunca(wQtdInvest*wVlrAntCotacao,2));

            wSaldoVariacaoDia := wVlrNovoSaldo - wSaldoAqui;

            //William Manoel dos Santos - Kintana 523191 SOL 64043 - INI

            // AL_61 - 25/04/2005
            if wVlrSaldoInvest = wVlrNovoSaldo then
               fVlrVariacao := 0
            else
            if ((wVlrAntCotacao = wVlrNovaCotacao) and (wVlrNovoSaldo <> wVlrSaldoInvest)) or
               (Copy(Trim(DMRendaVariavel.qryAtuSldInvRV.FieldByName('DESCINVESTIMENTO').AsString),
                          Length(Trim(DMRendaVariavel.qryAtuSldInvRV.FieldByName('DESCINVESTIMENTO').AsString))-2,3) = 'PRP') or
               (Copy(DMRendaVariavel.qryAtuSldInvRV.FieldByName('DESCINVESTIMENTO').AsString,1,1) = '*') then
               fVlrVariacao := 0
            else
               fVlrVariacao      := wSaldoVariacaoDia - wSaldoVariacao;

             //William Manoel dos Santos - Kintana 523191 SOL 64043 - FIM

            // Arredonda Saldos Calculados
            fVlrVariacao      := StrToFloat(FormatFloat('###############0.00',fVlrVariacao));
            wVlrNovoSaldo     := StrToFloat(FormatFloat('###############0.00',wVlrNovoSaldo));
            wVlrSaldoInvest   := StrToFloat(FormatFloat('###############0.00',wVlrSaldoInvest));

            //AL_18 - Replica saldos diariamente

            // AL_40 - 11/02/2005
            // Verifica Tipo de Lancamento
            If (wVlrNovoSaldo - wVlrSaldoInvest) < 0 Then
            begin
               wNaturezaMovimento := 'P';
               wTipoOperacao := -9;    // Variação Negativa de RV
            end
            Else If (wVlrNovoSaldo - wVlrSaldoInvest) > 0 Then
            begin
               wNaturezaMovimento := 'G';
               wTipoOperacao := -1;    // Variação Positiva de RV
            end
            else
            begin
               //AL_18 - Natureza neutra sem ser N pois N não alimenta a carteira
               wNaturezaMovimento := 'X';
               wTipoOperacao := -1;
            end;
            //AL_40 - Fim

            //AL_151
            // Gravando na tabela LogTotalPrev quando encontrar uma variação de 0,01
            If ((wNaturezaMovimento = 'G') or (wNaturezaMovimento = 'P')) and
               (wVlrAntCotacao = wVlrNovaCotacao) and (wVlrNovoSaldo <> wVlrSaldoInvest) then
            begin
               sDescricaoLog := '';
               sDescricaoLog := 'O Investimento: '+inttostr(DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDINVESTIMENTO').AsInteger)+ ' ';
               sDescricaoLog := sDescricaoLog + ' Qdade = ' + FloatToStrF(wQtdInvest,ffNumber,18,9);
               sDescricaoLog := sDescricaoLog + ' Variação =  '+ FormatFloat('###############0.00',fVlrVariacao);
               sDescricaoLog := sDescricaoLog + ' Natureza =  '+ wNaturezaMovimento;
               sDescricaoLog := sDescricaoLog + ' Com Anterior: Saldo =' + FormatFloat('###############0.00',wVlrSaldoInvest);
               sDescricaoLog := sDescricaoLog + ' Cotação =' + FloatToStrF(wVlrAntCotacao,ffNumber,18,9);
               sDescricaoLog := sDescricaoLog + ' Com Atual: Saldo =' + FormatFloat('###############0.00',wVlrNovoSaldo);
               sDescricaoLog := sDescricaoLog + ' Cotação =' + FloatToStrF(wVlrNovaCotacao,ffNumber,18,9);
               Opercomum.GravaLogTotalPrev(sDescricaoLog);
            End;
            //AL_151 - Fim

            // Contabiliza Atualização
            wIdForCli :=-1;
            //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
            // Busca Dados de Contabilização de Renda Variável
            FazQuery(DMRendaVariavel.qryAuxiliar,'SELECT ACAO.CODTIPOACAO FROM ACAO '+
                                                 'WHERE (ACAO.IDACAO = '+QuotedStr(DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDINVESTIMENTO').AsString)+')');

            wTipoPapel := DMRendaVariavel.qryAuxiliar.FieldByName('CODTIPOACAO').AsString;
            wMoedaReg  := wMoecodigo;
            DMRendaVariavel.qryAuxiliar.Close;

            // Calcula Imposto de Renda
            //AL_135
            wVlrIRDia:= Impostos.CalculaIR(DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDTIPOINVEST').AsInteger,
                                           DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDINVESTIMENTO').AsInteger,
                                           DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           0,-1,-1,
                                           DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDLOTE').AsString,
                                           0, DataProc,
                                           wSaldoAqui, wVlrNovoSaldo, wVlrIOF,
                                           DMRendaVariavel.qryAtuSldInvRV.FieldByName('FLGIRRVA').AsString,
                                           'G',fVlrRendimento);

            // Alimenta Carteira
            //AL_135
            If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                              DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDINVESTIMENTO').AsInteger,
                                              DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDTIPOINVEST').AsInteger, -1,-1,
                                              wTipoOperacao,
                                              DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                              DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                              -1, -1, wPlanilhaAC, wDocumentoAC, wPlanoAC, DataProc,
                                              Abs(wVlrNovoSaldo - wVlrSaldoInvest), 0, wValIniCotasGlobal,
                                              fVlrVariacao, 0,
                                              (wVlrIRDia-wSaldoIRProv),0,(wVlrIOF-wSaldoIOFProv),0,
                                              wAgioDesagio, 0, 0,
                                              wNaturezaMovimento,   ' ',
                                              DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDLOTE').AsString,
                                              'ATUALIZAÇÃO : '+DMRendaVariavel.qryAtuSldInvRV.FieldByName('DESCINVESTIMENTO').AsString,
                                              'ATU', '', '', True,
                                              -1,
                                              DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                              iIdHistCartInv) Then
               //Al_77 - 21/06/2005
               Raise Exception.Create('Não foi possível Alimentar a Carteira do dia '+DateToStr(DataProc)+', '#13+
                                      ' com ATUALIZAÇÃO da ação '+Trim(DMRendaVariavel.qryAtuSldInvRV.FieldByName('DESCINVESTIMENTO').AsString)+', '#13+
                                      'o processo será cancelado.');

{            If Not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) Then
               //Al_77 - 21/06/2005
               Raise Exception.Create('Não foi possível Atualizar o Saldo do dia '+ DateToStr(DataProc) +', '#13 +
                                      ' para ação ' + Trim(DMRendaVariavel.qryAtuSldInvRV.FieldByName('DESCINVESTIMENTO').AsString)+', '#13+
                                      'o processo será cancelado.');}

            //AL_131 - Ini - Recalcula o saldo provisionado para perda
            fPercProvPerda := OperComum.BuscaPercProvPerda(DataProc, DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDINVESTIMENTO').AsInteger);
            if fPercProvPerda > 0 then
               wVlrNovoSaldo := wVlrNovoSaldo - RoundCM(wVlrNovoSaldo * (fPercProvPerda / 100),2);

            //Al_1
            //Atualização do saldo conforme a cotação do dia
            CtrlRV.ExecSQL('UPDATE HISTCARTINV SET HISTCARTINV.SALDOVLRINVCART = '+TrocaVirgulaPonto(FloatToStr(wVlrNovoSaldo))+
                           ' WHERE (HISTCARTINV.IDHISTCARTINV = '+QuotedStr(IntToStr(iIdHistCartInv))+')');
            //AL_131 - Fim


            //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
            // Busca Dados de Contabilização
            FazQuery(DMRendaVariavel.qryAuxiliar,'SELECT ACAO.CODTIPOACAO FROM ACAO '+
                                                 'WHERE (ACAO.IDACAO = '+QuotedStr(DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDINVESTIMENTO').AsString)+')');

            wTipoPapel  := DMRendaVariavel.qryAuxiliar.FieldByName('CODTIPOACAO').AsString;
            DMRendaVariavel.qryAuxiliar.Close;

            wMoedaReg   := wMoecodigo;
            wIdForCli   := -1;
            wPlanilha   := -1;

            //Al_21
            // Contabiliza
            If DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDCARTEIRAGERENC').IsNull Then
            begin
               //AL_135 - Contabiliza por Plano/Patro
               If OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,
                                          DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDTIPOINVEST').AsInteger,
                                          DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDINVESTIMENTO').AsInteger,
                                          wTipoOperacao, -1,
                                          wIdForCli,
                                          DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          wMoedaReg, wTipoPapel,
                                          DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDLOTE').AsString, '','',
                                          '', wTipoRecDesBol, bCriaLancto, 0,fVlrVariacao,
                                          DataProc, DataProc,wPlano, wPlanilha, wDocumento, wMensErro,
                                          '', True, True, 0, True,
                                          DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDPLANPREVCTBPATR').AsInteger) <> 0 then
                  //Al_77 - 21/06/2005
                  Raise Exception.Create('Atenção: Ocorreu um problema na contabilização do '#13+
                                         'dia '+DateToStr(DataProc)+' com ATUALIZAÇÃO na acão '+
                                         Trim(DMRendaVariavel.qryAtuSldInvRV.FieldByName('DESCINVESTIMENTO').AsString)+', '#13+
                                         'o processo será cancelado.');

               if (RecBuscaTipoOperVarRV.VLRSALDO <> 0) and
                  (DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDTIPOINVEST').AsInteger = 2) then // Sobrou saldo de variacao para contabilizar
               begin
                  //AL_135 - Contabiliza por Plano/Patro
                  If OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,
                                             DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDTIPOINVEST').AsInteger,
                                             DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDINVESTIMENTO').AsInteger,
                                             RecBuscaTipoOperVarRV.TIPOOPERSALDO, -1,
                                             wIdForCli,
                                             DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             wMoedaReg, wTipoPapel,
                                             DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDLOTE').AsString, '','',
                                             '',wTipoRecDesBol, bCriaLancto, 0,
                                             RecBuscaTipoOperVarRV.VLRSALDO,
                                             DataProc, DataProc,wPlano, wPlanilha, wDocumento, wMensErro,
                                             '', True, True, 0, True,
                                             DMRendaVariavel.qryAtuSldInvRV.FieldByName('IDPLANPREVCTBPATR').AsInteger) <> 0 then
                     //Al_77 - 21/06/2005
                     Raise Exception.Create('Atenção: Ocorreu um problema na contabilização do '#13+
                                            'dia '+DateToStr(DataProc)+' com ATUALIZAÇÃO na acão '+
                                             Trim(DMRendaVariavel.qryAtuSldInvRV.FieldByName('DESCINVESTIMENTO').AsString)+', '#13+
                                            'o processo será cancelado');
               end;

               RecBuscaTipoOperVarRV.VLRSALDO := 0;
               RecBuscaTipoOperVarRV.TIPOOPERSALDO := 0;
            end;

            if Trim(wMensErro) <> '' then
               Raise Exception.Create('Atenção: Ocorreu um problema na contabilização do '#13+
                                      'dia '+DateToStr(DataProc)+' com ATUALIZAÇÃO na acão '+
                                      Trim(DMRendaVariavel.qryAtuSldInvRV.FieldByName('DESCINVESTIMENTO').AsString)+', '#13+
                                      'o processo será cancelado.');

            // Pula para o Proximo Registro
            DMRendaVariavel.qryAtuSldInvRV.Next;

            //AL_119
            //AL_135
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('Processando Dia : ' + DateToStr(DataProc) + #13 +
                                'Plano/Patrocinadora: ' + DMRendaVariavel.qryAtuSldInvRV.FieldByName('PLANPRVCONTABPATRO').AsString + #13 +
                                'Carteira: ' + DMRendaVariavel.qryAtuSldInvRV.FieldByName('DESCCARTINVEST').AsString + #13 +
                                'Investimento: ' + DMRendaVariavel.qryAtuSldInvRV.FieldByName('DESCINVESTIMENTO').AsString);
         end;





         Result := True;
      except
         On E:Exception Do
         Begin
            MsgDlg(E.Message,'Mensagem do Sistema', mtWarning,[mbOk],0);
            Result := False;
         end;
      end;
   finally
      //AL_135
      FreeAndNil(CtrlRV);
      OperComum.LimpaParametros(DMRendaVariavel.qryAtuSldInvRV);
      OperComum.LimpaParametros(DMRendaVariavel.qryBuscaATU);
      //AL_135
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('', -2);
   end;
end;

function TRendaVariavel.MarcarFlagContab(sBoleta: String;
                                         iHistCartInv: Integer = -1;
                                         iOperacaoInvest: Integer = -1): boolean;
begin
   try
      OperComum.LimpaParametros(DMRendaVariavel.qryMarcaFlgContab);
      if Trim(sBoleta) = '' then
      begin
         if iHistCartinv <> -1 then
            DMRendaVariavel.qryMarcaFlgContab.ParamByName('IDHISTCARTINV').AsInteger := iHistCartInv
         else
            DMRendaVariavel.qryMarcaFlgContab.ParamByName('IDOPERACAOINVEST').AsInteger := iOperacaoInvest;
      end
      else
         DMRendaVariavel.qryMarcaFlgContab.ParamByName('IDBOLETA').AsString := sBoleta;
      DMRendaVariavel.qryMarcaFlgContab.ExecSQL;
      OperComum.LimpaParametros(DMRendaVariavel.qryMarcaFlgContab);
      Result := True;      
   except
      //Al_77 - 27/06/2005
      MsgDlg('Não foi possível marcar a boleta '+sBoleta+' para reprocessar o Contábil.',
             'Mensagem do Sistema ', MtWarning,[MbOk],0);
      OperComum.LimpaParametros(DMRendaVariavel.qryMarcaFlgContab);             
      Result := False;
   end;
end;

//AL_135
function TRendaVariavel.ExcluiHistRV(iPlanPrev, iCarteira, iInvestimento: Integer;
                                     dDataIni: TDateTime;
                                     idHistcartinv: Integer = -1;
                                     sMens: String = ''): boolean;
var
    bExcluiPlanilha : Boolean;
    I               : Integer;
    sAcao           : String;
    qryBuscaMarcados: TwwQuery;
begin
   try
      try
         sAcao := 'Buscando Registros Marcados';

         qryBuscaMarcados        := TwwQuery.Create(Application);
         qryBuscaMarcados.DatabaseName := DMRendaVariavel.qryBuscaFlgReproc.DatabaseName;
         qryBuscaMarcados.SQL    := DMRendaVariavel.qryBuscaFlgReproc.SQL;
         qryBuscaMarcados.Params := DMRendaVariavel.qryBuscaFlgReproc.Params;

         OperComum.LimpaParametros(qryBuscaMarcados);
         //AL_135
         if iPlanPrev     > 0 then
            qryBuscaMarcados.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         if iCarteira     > 0 then
            qryBuscaMarcados.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteira;
         if iInvestimento > 0 then
            qryBuscaMarcados.ParamByName('IDINVESTIMENTO').AsInteger   := iInvestimento;
         qryBuscaMarcados.Open;

         while not qryBuscaMarcados.Eof do
         begin
            sAcao := 'Buscando Registros a Serem Excluídos';
            OperComum.LimpaParametros(DMRendaVariavel.qryBuscaHistDelecao);
            //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
            DMRendaVariavel.qryBuscaHistDelecao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
            if not qryBuscaMarcados.FieldByName('IDCARTEIRAINVEST').IsNull Then
               DMRendaVariavel.qryBuscaHistDelecao.ParamByName('IDCARTEIRAINVEST').AsInteger :=
                                   qryBuscaMarcados.FieldByName('IDCARTEIRAINVEST').AsInteger;
            if not qryBuscaMarcados.FieldByName('IDINVESTIMENTO').IsNull Then
               DMRendaVariavel.qryBuscaHistDelecao.ParamByName('IDINVESTIMENTO').AsInteger :=
                                   qryBuscaMarcados.FieldByName('IDINVESTIMENTO').AsInteger;
            if not qryBuscaMarcados.FieldByName('IDPLANPREVCTBPATR').IsNull Then
               DMRendaVariavel.qryBuscaHistDelecao.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                   qryBuscaMarcados.FieldByName('IDPLANPREVCTBPATR').AsInteger;

            // AL_9 - 01/07/2004 - Retirado o parametro OPERADOR
            // AL_19 - Não exclui o registro marcado
            DMRendaVariavel.qryBuscaHistDelecao.ParamByName('DATAMOVCARTINV').AsString :=
                                   qryBuscaMarcados.FieldByName('DATAMOVCARTINV').AsString;
            DMRendaVariavel.qryBuscaHistDelecao.ParamByName('DATAINI').AsString := DateToStr(dDataIni);
            DMRendaVariavel.qryBuscaHistDelecao.Open;

            // AL_120
            // AL_135
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech(OperComum.IIF(sMens = '', sMens, sMens + #13) +
                                'Plano/Patrocinadora: ' + qryBuscaMarcados.FieldByName('PLANPRVCONTABPATRO').AsString + #13 +
                                'Investimento: ' + qryBuscaMarcados.FieldByName('DESCINVESTIMENTO').AsString,
                                DMRendaVariavel.qryBuscaHistDelecao.RecordCount);

            while not DMRendaVariavel.qryBuscaHistDelecao.Eof do
            begin
               // AL_2 - 03/06/2004 - Não exclui ATU Marcado - Inicio
               // Só exclui se não for INI,
               if (DMRendaVariavel.qryBuscaHistDelecao.FieldByName('TIPMOVCARTINV').AsString = 'INI') then
               begin
                  DMRendaVariavel.qryBuscaHistDelecao.Next;
                  Continue;
               end;
               // AL_2 - Fim

               // AL_74
               //AL_133
               if not CtrlInvContab.TestaPeriodo(DMRendaVariavel.qryBuscaHistDelecao.FieldByName('DATAMOVCARTINV').AsString, 2) then
                  Raise Exception.Create(CtrlInvContab.MessageInfo);

               if DMRendaVariavel.qryBuscaHistDelecao.FieldByName('PLNCODIGO').AsInteger > 0 then
               begin
                  // Limpa a Planilha da tabela LanctoDocum
                  sAcao := 'Limpando Contábil dos Documentos';
{                  DMRendaVariavel.qryAuxiliar.Close;
                  DMRendaVariavel.qryAuxiliar.SQL.Clear;
                  DMRendaVariavel.qryAuxiliar.SQL.Text := 'UPDATE LANCTODOCUM SET PLNCODIGO = NULL WHERE PLNCODIGO = ' +
                                                          DMRendaVariavel.qryBuscaHistDelecao.FieldByName('PLNCODIGO').AsString;
                  DMRendaVariavel.qryAuxiliar.ExecSQL;

                  if DMRendaVariavel.qryBuscaHistDelecao.FieldByName('TIPMOVCARTINV').AsString = 'ATU' then
                  begin
                     // Limpar Planilha da HistCartinv para ATU
                     sAcao := 'Limpando Contábil da Carteira';
                     DMRendaVariavel.qryAuxiliar.Close;
                     DMRendaVariavel.qryAuxiliar.SQL.Clear;
                     DMRendaVariavel.qryAuxiliar.SQL.Text := 'UPDATE HISTCARTINV SET PLNCODIGO = NULL WHERE IDHISTCARTINV = ' +
                                                              DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').AsString;
                     DMRendaVariavel.qryAuxiliar.ExecSQL;
                  end;}

                  // Não se exclui mais as Planilhas, só zera o valor
                  bExcluiPlanilha := False;
                  //Al_68 - 27/04/2005
                  // Exclui Lançamentos Contábeis da Planilha sem excluir a Planilha
                  if DMRendaVariavel.qryBuscaHistDelecao.FieldByName('PLNCODIGO').AsInteger > 0 then
                  begin
                     sAcao := 'Zerando Lançamentos Contábeis';
                     //AL_139 - Passa a valer a exclusão em 3 camadas
                     //AL_147
                     if not CtrlInvContab.InvExcluiLanc(DMRendaVariavel.qryBuscaHistDelecao.FieldByName('PLNCODIGO').AsInteger,
                                                        0, Sistema.UsaPlanoPatro, False) then
                        Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis em ' + DMRendaVariavel.qryBuscaHistDelecao.FieldByName('DATAMOVCARTINV').AsString);
                   end;
                  //Al_68 - Fim
               end;

               // HistCustodia
               if not DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDOPERACAOINVEST').IsNull then
               begin
                  //AL_55 - 06/04/2005
                  //Se a Cart. Gerencial não for nula executa todo o processo
                  if Not DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDCARTEIRAGERENC').IsNull then
                  begin
                     DMRendaVariavel.qryAuxiliar.Close;
                     DMRendaVariavel.qryAuxiliar.SQL.Clear;
                     DMRendaVariavel.qryAuxiliar.SQL.Add('DELETE FROM HISTCAIXA WHERE IDOPERACAOINVEST = ' +
                                                              DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDOPERACAOINVEST').AsString+'; ');
                     DMRendaVariavel.qryAuxiliar.SQL.Add('DELETE FROM HISTPROVISAO WHERE IDOPERACAOINVEST = ' +
                                                              DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDOPERACAOINVEST').AsString+'; ');
                     DMRendaVariavel.qryAuxiliar.ExecSQL;

                     //AL_46 - 08/03/2005
                     if DMRendaVariavel.qryBuscaHistDelecao.FieldByName('TIPMOVBOLETA').AsString = 'DTA' then
                     begin
                        if (not DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDOPERACAODIREITO').IsNull) then
                        begin
                           DMRendaVariavel.qryAuxiliar.Close;
                           DMRendaVariavel.qryAuxiliar.SQL.Clear;
                           DMRendaVariavel.qryAuxiliar.SQL.Text := 'DELETE FROM HISTPROVISAO WHERE IDOPERACAODIREITO = ' +
                                                                    DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDOPERACAODIREITO').AsString;
                           DMRendaVariavel.qryAuxiliar.ExecSQL;
                        end;
                     end;
                  end;
                  //AL_55 - Fim

                  if DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDCARTEIRAGERENC').IsNull then
                  begin
                     // AL_48 - 10/03/2005
                     if (not DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDOPERCUSTODIA').IsNull) then
                     begin
                        sAcao := 'Limpando Custódia - Operação';
                        MarcaFlgHistCustodia (-1, DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDOPERACAOINVEST').AsInteger, -1);
                        DMRendaVariavel.qryAuxiliar.Close;
                        DMRendaVariavel.qryAuxiliar.SQL.Clear;
                        DMRendaVariavel.qryAuxiliar.SQL.Text := 'UPDATE OPERCUSTODIA SET OPERCUSTODIA.IDCUSTODIAORIG = NULL, OPERCUSTODIA.IDCUSTODIADEST = NULL ' +
                                                                'WHERE OPERCUSTODIA.IDOPERCUSTODIA = ' +
                                                                 DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDOPERCUSTODIA').AsString;
                        DMRendaVariavel.qryAuxiliar.ExecSQL;
                     end;

                     sAcao := 'Excluindo Custódia';
                     MarcaFlgHistCustodia (-1, DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDOPERACAOINVEST').AsInteger, -1);
                     DMRendaVariavel.qryAuxiliar.Close;
                     DMRendaVariavel.qryAuxiliar.SQL.Clear;
                     DMRendaVariavel.qryAuxiliar.SQL.Text := 'DELETE FROM HISTCUSTODIA WHERE IDOPERACAOINVEST = ' +
                                                              DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDOPERACAOINVEST').AsString;
                     DMRendaVariavel.qryAuxiliar.ExecSQL;
                  end;
                  // AL_48 - Fim
               end;

               // HistCartinv
               if not DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').IsNull then
               begin
                  // AL_48
                  // AL_4 - Passa a Excluir Custódia da Transferencia
                  // Exclui a Histcustodia
                  // Exclui os identificadores de operação
                  //Al_88 - 27/07/2005
                  sAcao := 'Limpando Histórico da Operações de Custódia';
{                  DMRendaVariavel.qryAuxiliar.Close;
                  DMRendaVariavel.qryAuxiliar.SQL.Clear;
                  DMRendaVariavel.qryAuxiliar.SQL.Add('UPDATE OPERCUSTODIA SET IDCUSTODIADEST = NULL, IDCUSTODIAORIG = NULL ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' WHERE IDHISTCARTINVORIG = ' + DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').AsString);
                  DMRendaVariavel.qryAuxiliar.SQL.Add('    OR IDHISTCARTINVDEST = ' + DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').AsString+';');
                  // HistCustodia
                  sAcao := 'Excluindo Histórico de Custódia';
                  //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
                  DMRendaVariavel.qryAuxiliar.SQL.Add('DELETE FROM HISTCUSTODIA ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' WHERE HISTCUSTODIA.IDOPERCUSTODIA IN ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('      (SELECT OPERCUSTODIA.IDOPERCUSTODIA ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('       FROM OPERCUSTODIA ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('       WHERE OPERCUSTODIA.IDHISTCARTINVORIG = ' + DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').AsString);
                  DMRendaVariavel.qryAuxiliar.SQL.Add('          OR OPERCUSTODIA.IDHISTCARTINVDEST = ' + DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').AsString+';');
                  // Exclui o identificador da operação Destino
                  sAcao := 'Limpando Operações de Custódia - Destino';
                  DMRendaVariavel.qryAuxiliar.SQL.Add('UPDATE OPERCUSTODIA SET IDHISTCARTINVDEST = NULL ' +
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' WHERE IDHISTCARTINVDEST = ' + DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').AsString+';');
                  // Exclui o identificador da operação Origem
                  sAcao := 'Limpando Operações de Custódia - Origem';
                  DMRendaVariavel.qryAuxiliar.SQL.Add('UPDATE OPERCUSTODIA SET IDHISTCARTINVORIG = NULL ' +
                  DMRendaVariavel.qryAuxiliar.SQL.Add('WHERE IDHISTCARTINVORIG = ' +DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').AsString+';');
                  DMRendaVariavel.qryAuxiliar.ExecSQL; }
                  //Al_88 - 27/07/2005
                  //AL_48 - Fim

                  //AL_138 - Ini
                  // Exclui os históricos das operações de transferência de custodia
                  sAcao := 'Limpando Históricos de Transferencia de Custódia';
                  DMRendaVariavel.qryAuxiliar.Close;
                  DMRendaVariavel.qryAuxiliar.SQL.Clear;
                  DMRendaVariavel.qryAuxiliar.SQL.Add('DECLARE ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('BEGIN ');

                  sAcao := 'Limpando Histórico da Operações de Custódia';
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' UPDATE OPERCUSTODIA SET IDCUSTODIADEST = NULL, IDCUSTODIAORIG = NULL ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' WHERE IDHISTCARTINVORIG = ' + DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').AsString);
                  DMRendaVariavel.qryAuxiliar.SQL.Add('    OR IDHISTCARTINVDEST = ' + DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').AsString+';');

                  // HistCustodia
                  sAcao := 'Excluindo Histórico de Custódia';
                  //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' DELETE FROM HISTCUSTODIA ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' WHERE HISTCUSTODIA.IDOPERCUSTODIA IN ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('      (SELECT OPERCUSTODIA.IDOPERCUSTODIA ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('       FROM OPERCUSTODIA ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('       WHERE OPERCUSTODIA.IDHISTCARTINVORIG = ' + DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').AsString);
                  DMRendaVariavel.qryAuxiliar.SQL.Add('          OR OPERCUSTODIA.IDHISTCARTINVDEST = ' + DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').AsString+'); ');

                  //Renan 17/08/2010 - Sol. 127135 - Kintana 694808 Inicio.
                  DMRendaVariavel.qryAuxiliar.SQL.Add('DELETE ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('FROM HISTCUSTODIA ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('WHERE (IDINVESTIMENTO = '+DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDINVESTIMENTO').AsString+' ) ' );
                  DMRendaVariavel.qryAuxiliar.SQL.Add('AND   (IDPLANPREVCTBPATR = '+DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDPLANPREVCTBPATR').AsString+' ) ' );
                  DMRendaVariavel.qryAuxiliar.SQL.Add('AND   (IDCARTEIRAINVEST = '+DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDCARTEIRAINVEST').AsString+' ) ' );
                  DMRendaVariavel.qryAuxiliar.SQL.Add('AND DATAMOVCUSTOD = '+ QuotedStr(DMRendaVariavel.qryBuscaHistDelecao.FieldByName('DATAMOVCARTINV').AsString));
                  DMRendaVariavel.qryAuxiliar.SQL.Add('AND IDOPERACAOINVEST IS NULL');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('AND IDOPERCUSTODIA   IS NULL;');
                  //Renan 17/08/2010 - Sol. 127135 - Kintana 694808 Fim.

                  // Exclui o identificador da operação Destino
                  sAcao := 'Limpando Operações de Custódia - Destino';
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' UPDATE OPERCUSTODIA SET OPERCUSTODIA.IDHISTCARTINVDEST = NULL  ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' WHERE  OPERCUSTODIA.IDHISTCARTINVDEST = ' + DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').AsString+'; ');

                  // Exclui o identificador da operação Origem
                  sAcao := 'Limpando Operações de Custódia - Origem';
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' UPDATE OPERCUSTODIA SET OPERCUSTODIA.IDHISTCARTINVORIG = NULL ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' WHERE  OPERCUSTODIA.IDHISTCARTINVORIG = ' +DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').AsString+'; ');

                  DMRendaVariavel.qryAuxiliar.SQL.Add('FOR X IN ( ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('SELECT H.IDCUSTODIA, H.IDOPERCUSTODIA ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('FROM HISTCUSTODIA H ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('WHERE H.IDINVESTIMENTO    = ' + DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDINVESTIMENTO').AsString);
                  DMRendaVariavel.qryAuxiliar.SQL.Add('  AND H.IDPLANPREVCTBPATR = ' + DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDPLANPREVCTBPATR').AsString);
                  DMRendaVariavel.qryAuxiliar.SQL.Add('  AND H.IDCARTEIRAINVEST  = ' + DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDCARTEIRAINVEST').AsString);
                  DMRendaVariavel.qryAuxiliar.SQL.Add('  AND H.DATAMOVCUSTOD = TO_DATE(' + QuotedStr(DMRendaVariavel.qryBuscaHistDelecao.FieldByName('DATAMOVCARTINV').AsString) + ', ' + QuotedStr('DD/MM/YYYY') + ')');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('  AND EXISTS (SELECT B.TIPMOVBOLETA ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('              FROM BOLETA B, OPERCUSTODIA O ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('              WHERE B.IDBOLETA = O.IDBOLETA ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('                AND B.TIPMOVBOLETA = ' + QuotedStr('TCU'));
                  DMRendaVariavel.qryAuxiliar.SQL.Add('                AND O.IDOPERCUSTODIA = H.IDOPERCUSTODIA))LOOP ');

                  DMRendaVariavel.qryAuxiliar.SQL.Add(' UPDATE OPERCUSTODIA SET OPERCUSTODIA.IDCUSTODIAORIG = NULL ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' WHERE OPERCUSTODIA.IDOPERCUSTODIA = X.IDOPERCUSTODIA ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('   AND OPERCUSTODIA.IDCUSTODIAORIG  = X.IDCUSTODIA; ');

                  DMRendaVariavel.qryAuxiliar.SQL.Add(' UPDATE OPERCUSTODIA SET OPERCUSTODIA.IDCUSTODIADEST = NULL ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' WHERE OPERCUSTODIA.IDOPERCUSTODIA = X.IDOPERCUSTODIA ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add('  AND  OPERCUSTODIA.IDCUSTODIADEST = X.IDCUSTODIA; ');

                  DMRendaVariavel.qryAuxiliar.SQL.Add(' DELETE FROM HISTCUSTODIA WHERE IDCUSTODIA = X.IDCUSTODIA; ');

                  DMRendaVariavel.qryAuxiliar.SQL.Add(' END LOOP; ');
                  // HistCartinv
                  sAcao := 'Excluindo Histórico de Carteira';
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' DELETE FROM HISTCARTINV WHERE IDHISTCARTINV = ' +
                                                           DMRendaVariavel.qryBuscaHistDelecao.FieldByName('IDHISTCARTINV').AsString+'; ');
                  DMRendaVariavel.qryAuxiliar.SQL.Add(' END; ');
                  DMRendaVariavel.qryAuxiliar.ExecSQL;
                  // AL_4 - 14/06/2004 - Fim
               end;

               // Deixa a Query Limpa
               DMRendaVariavel.qryAuxiliar.Close;
               DMRendaVariavel.qryAuxiliar.SQL.Clear;
               DMRendaVariavel.qryBuscaHistDelecao.Next;

               // AL_120 - Atualiza o progress bar
               //AL_135
               if Assigned(AtualizaProcFech) then
                  AtualizaProcFech(OperComum.IIF(sMens = '', sMens, sMens + #13) +
                                   'Plano/Patrocinadora: ' + qryBuscaMarcados.FieldByName('PLANPRVCONTABPATRO').AsString + #13 +
                                   'Investimento: ' + qryBuscaMarcados.FieldByName('DESCINVESTIMENTO').AsString);

            end;

            qryBuscaMarcados.Next;
         end;

         // Atualiza Saldos da Custodia - Verificar se precisa marcar algum flag
         sAcao := 'Atualizando Saldos de Custódia';
         OperacaoInvest.AtualizaSaldosCustodia;
         Result := True;
      except
         on E: Exception do
         begin
            MsgDlg('Ocorreu problema ao excluir o Histórico.' + #13 + E.Message + ' ' + #13 +
                   'Última Ação: ' + sAcao,
                   'Mensagem do Sistema ',mtWarning,[mbOK],0);
            Result := False;
         end;
      end;
   finally
      FreeAndNil(qryBuscaMarcados);
   end;
end;

function TRendaVariavel.BuscaVlrLiqBoleta(sBoleta: String; var wTotalLiquido: Double): Boolean;
var wTotalDespesa: Double;
begin
   Result := True;
   try
      try
         dmRendaVariavel.qryAux.Close;
         dmRendaVariavel.qryAux.SQL.Clear;
         dmRendaVariavel.qryAux.SQL.Add('SELECT SUM(ABS((DECODE(INSTR(''AVUM'',TI.NATUREZAOPERACAO),0, ');
         dmRendaVariavel.qryAux.SQL.Add('                DECODE(INSTR(''DSORI'', TI.NATUREZAOPERACAO),0, 0, OI.VLROPERACAO * -1), OI.VLROPERACAO) + ');
         dmRendaVariavel.qryAux.SQL.Add('           DS.TOTALDESPESAS))) AS VLRLIQUIDO ');
         dmRendaVariavel.qryAux.SQL.Add('FROM OPERACAOINVEST OI, TIPOOPERACAO TI, ');
         dmRendaVariavel.qryAux.SQL.Add('     (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS');
         dmRendaVariavel.qryAux.SQL.Add('      FROM   DESPOPERINVEST DOI, TIPODESPINVEST TDI, OPERACAOINVEST OIV ');
         dmRendaVariavel.qryAux.SQL.Add('      WHERE  OIV.NUMDOCUMENTO = '''+ sBoleta +''' AND ');
         dmRendaVariavel.qryAux.SQL.Add('             OIV.IDOPERACAOINVEST = DOI.IDOPERACAOINVEST AND ');
         dmRendaVariavel.qryAux.SQL.Add('             DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND ');
         dmRendaVariavel.qryAux.SQL.Add('             TDI.NATUREZAOPERACAO <> ''N''');
         dmRendaVariavel.qryAux.SQL.Add('      GROUP BY DOI.IDOPERACAOINVEST) DS');
         dmRendaVariavel.qryAux.SQL.Add('WHERE (OI.NUMDOCUMENTO     = '''+ sBoleta +''')      AND');
         dmRendaVariavel.qryAux.SQL.Add('      (OI.IDCARTEIRAGERENC IS NULL)                  AND');
         dmRendaVariavel.qryAux.SQL.Add('      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+)) AND');
         dmRendaVariavel.qryAux.SQL.Add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO) ');
         dmRendaVariavel.qryAux.Open;
         wTotalLiquido := dmRendaVariavel.qryAux.FieldByName('VLRLIQUIDO').AsFloat;
      except
         Result := False;
      end;
   finally
      dmRendaVariavel.qryAux.Close;
      dmRendaVariavel.qryAux.SQL.Clear;
   end;
end;


function TRendaVariavel.MarcaOpeSemHist(dDataIni, dDataFim: TDateTime): Boolean;
var qryBuscaoper: TwwQuery;
begin
   try
      //AL_128 - Ini
      //Foi feita a alteração para ela captar no período a ser reprocessado e não em uma data fixa
      //    a fim de posiciona sua chamada para antes da exclusão dos históricos.
      //Com data fixa e a chamada durante o loop, marcava investimentos que não tinham os históricos
      //   excluidos, e a rotina de atualização, ao invés de excluir a planilha, lançava outro histórico ficando
      //   a perna do histórico anterior solta no contábil
      Result := False;
      qryBuscaoper := TwwQuery.Create(Application);
      qryBuscaoper.DatabaseName := 'BaseDados';
      //AL_126 - Ini
      //AL_135 - Ini
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('Buscando Operações sem Histórico', 0);

      qryBuscaoper.SQL.Add('SELECT DISTINCT O.IDINVESTIMENTO, O.IDCARTEIRAINVEST, O.IDPLANPREVCTBPATR, O.DATAOPERACAO AS DATA ');
      qryBuscaoper.SQL.Add('FROM OPERACAOINVEST O, BOLETA B, HISTCARTINV H ');
      qryBuscaoper.SQL.Add('WHERE O.DATAOPERACAO BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataIni)) + ',' + QuotedStr('dd/mm/yyyy') + ') AND TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ',' + QuotedStr('dd/mm/yyyy') + ') ' );
      qryBuscaoper.SQL.Add('  AND (((B.TIPMOVBOLETA = ' + QuotedStr('DTB') + ') AND (O.ORIGDEST = ' + QuotedStr('D') + ')) OR ');
      qryBuscaoper.SQL.Add('       (B.TIPMOVBOLETA <> ' + QuotedStr('DTB') + ')) ');
      qryBuscaoper.SQL.Add('  AND O.NUMDOCUMENTO = B.IDBOLETA ');
      qryBuscaoper.SQL.Add('  AND O.IDOPERACAOINVEST = H.IDOPERACAOINVEST(+) ');
      qryBuscaoper.SQL.Add('  AND H.IDOPERACAOINVEST IS NULL');
      qryBuscaoper.SQL.Add('UNION ALL ');
      qryBuscaoper.SQL.Add('SELECT DISTINCT O.IDINVESTIMENTO, O.IDCARTEIRAORIG AS IDCARTEIRAINVEST, O.IDPLANPREVCTBPATR, O.DATAMOVCUSTOD AS DATA ');
      qryBuscaoper.SQL.Add('FROM OPERCUSTODIA O, HISTCARTINV H ');
      qryBuscaoper.SQL.Add('WHERE O.DATAMOVCUSTOD BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataIni)) + ',' + QuotedStr('dd/mm/yyyy') + ') AND TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ',' + QuotedStr('dd/mm/yyyy') + ') ' );
      qryBuscaoper.SQL.Add('  AND O.IDCARTEIRAORIG <> IDCARTEIRADEST ');
      qryBuscaoper.SQL.Add('  AND O.IDHISTCARTINVORIG = H.IDHISTCARTINV(+) ');
      qryBuscaoper.SQL.Add('  AND H.IDHISTCARTINV IS NULL');
      qryBuscaoper.SQL.Add('UNION ALL ');
      qryBuscaoper.SQL.Add('SELECT DISTINCT O.IDINVESTIMENTO, O.IDCARTEIRADEST AS IDCARTEIRAINVEST, O.IDPLANPREVCTBPATR, O.DATAMOVCUSTOD AS DATA ');
      qryBuscaoper.SQL.Add('FROM OPERCUSTODIA O, HISTCARTINV H ');
      qryBuscaoper.SQL.Add('WHERE O.DATAMOVCUSTOD BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataIni)) + ',' + QuotedStr('dd/mm/yyyy') + ') AND TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ',' + QuotedStr('dd/mm/yyyy') + ') ' );
      qryBuscaoper.SQL.Add('  AND O.IDCARTEIRAORIG <> IDCARTEIRADEST ');
      qryBuscaoper.SQL.Add('  AND O.IDHISTCARTINVDEST = H.IDHISTCARTINV(+) ');
      qryBuscaoper.SQL.Add('  AND H.IDHISTCARTINV IS NULL');
      qryBuscaoper.Open;

      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('Marcando Operações sem Histórico para Reprocessamento', qryBuscaoper.RecordCount);

      while not qryBuscaoper.Eof do
      begin
         if not RendaVariavel.MarcarFlagReproc(qryBuscaoper.FieldByName('IDINVESTIMENTO').AsInteger,
                                               qryBuscaoper.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                               qryBuscaoper.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               qryBuscaoper.FieldByName('DATA').AsDateTime, False) then
            Raise Exception.Create('Existem operações sem histórico que os investimentos não podem ser marcados para reprocessamento.');
         qryBuscaoper.Next;
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('');
      end;

      Result := True;
      //AL_135 - Fim
      //AL_126 - Fim
      //AL_128 - Fim
   finally
      //AL_135
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('', -2);
      qryBuscaoper.Close;
      FreeAndNil(qryBuscaoper);
   end;
end;

// AL_38 - 11/01/2005
function TRendaVariavel.VerEmAbertura: Boolean;
var qryVerAbt: TwwQuery;
begin
   try
      try
         qryVerAbt := TwwQuery.Create(Application);
         qryVerAbt.DatabaseName := 'BaseDados';
         qryVerAbt.SQL.Add('SELECT PA.FLGRVEMABERTURA, PE.NOME ');
         qryVerAbt.SQL.Add('FROM PARAMINVEST PA, PESSOA PE ');
         qryVerAbt.SQL.Add('WHERE PA.IDUSUARIOPROCRV = PE.IDPESSOA(+)');
         qryVerAbt.Open;
         Result := (qryVerAbt.FieldByName('FLGRVEMABERTURA').AsString = 'S');
         if Result then
            MsgDlg('O Sistema está sendo processado por ' + #13 +
                   qryVerAbt.FieldByName('NOME').AsString + #13 +
                   'Essa ação não pode ser executada.',
                   'Mensagem do Sistema', mtWarning, [mbOK], 0);
      except
         Result := True;
         MsgDlg('Não foi possível verificar se o sistema está em Fechamento, '+
                'Essa ação não pode ser executada.',
                'Mensagem do Sistema', mtWarning, [mbOK], 0);
      end;
   finally
      FreeAndNil(qryVerAbt);
   end;
end;

// AL_39 - 11/01/2005
function TRendaVariavel.GravaEmAbertura(sFlag: String = 'S'): Boolean;
var qryEmAbt: TwwQuery;
    i: Integer;
    bComita: Boolean;
begin
   Result := False;
   bComita := False;
   i := 1;
   try
      try
         if not DtmBaseDados.dbBaseDados.InTransaction Then
         begin
            DtmBaseDados.dbBaseDados.StartTransaction;
            bComita := True;
         end;

         //AL_120 - Cria somente uma vez
         qryEmAbt := TwwQuery.Create(Application);
         qryEmAbt.DatabaseName := 'BaseDados';

         // Tenta gravar o parametro no máximo 10 vezes até conseguir
         while (not Result) and (i <= 10) do
         begin
            qryEmAbt.SQL.Clear;
            qryEmAbt.SQL.Add('UPDATE PARAMINVEST SET PARAMINVEST.FLGRVEMABERTURA = ' + QuotedStr(sFlag) + ', ');
            qryEmAbt.SQL.Add(' PARAMINVEST.IDUSUARIOPROCRV = ' + OperComum.IIF(sFlag = 'S',QuotedStr(IntToStr(Sistema.IdUsuario)),'NULL'));
            qryEmAbt.ExecSQL;
            if qryEmAbt.RowsAffected >= 1 then
               Result := True;
            Inc(i);
         end;

         if bComita then
            DtmBaseDados.dbBaseDados.Commit;
      except
         Result := False;
         if bComita then
            DtmBaseDados.dbBaseDados.Rollback;
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
      FreeAndNil(qryEmAbt);
   end;
end;

// AL_91
function TRendaVariavel.AtualizaSubscricaoVencida(Const dDataProc: TDateTime;
                                                  Const iOperacaoDireito: Integer = -1;
                                                  fraFrame: TfraMensagem = nil): Boolean;
var
   QryOpDireito, QryPesqDel, QryInsOperacaoInvest: TwwQuery;
   fPU, fSaldoAquiPro, fSaldoVariacaoPro, fSaldoIrApuPro, fSaldoQtd, fSaldoCPMF, fSaldoVlr,
   fSaldoInutil, fSaldoAqui, fSaldoRend, fSaldoVariacao, fSaldoIrApu, fValorOper: Double;
   Tipo, sNatureza, sBoleta, sTipoOperacao, sInvestimento, wMensErro, wTipoRecDesBol: String;
   idOperCustodia, iTipoOperacao, idOperacaoInvest, iPlano, iPlanilha, iDocumento, wPlano,
   iIdHistCartInv, iIdHistCustodiaOrig, iIdHistCustodiaDest, iIdCarteiraInvest, iIdOperDireito,
   iIdCarteiraGerenc, iIdInvestimento, iIdCustodiante, iIdEmissor: Integer;
   I: Integer;
   bCriaLancto: Boolean;
   fQtd: Extended;
   dDtAge: TDateTime;
   //AL_125
   //AL_132
   iTipoConta, iPlanPrev : Integer;
   //AL_146
   CtrlRV: TCtrlRendaVariavel;
begin
   Result := True;
   try // Finally
      try // Except

         {*** CRIA OBJETOS A SEREM UTILIZADOS ***}
         QryOpDireito := TwwQuery.Create(Application);
         QryOpDireito.DataBaseName := 'BaseDados';
         QryPesqDel := TwwQuery.Create(Application);
         QryPesqDel.DataBaseName := 'BaseDados';
         QryInsOperacaoInvest := TwwQuery.Create(Application);
         QryInsOperacaoInvest.DataBaseName := 'BaseDados';
         //AL_146
         CtrlRV := TCtrlRendaVariavel.Create;
         CtrlRV.InitializeAs(Padroes);

          //Ricardo Cristiano - 16/06/2009 - N. Sol 119534 -  N. Kintana 568940
         {*** AVALIAR OS VENCIMENTOS ***}
         QryPesqDel.Sql.Clear;
         QryPesqDel.Sql.Add('SELECT DISTINCT O.IDOPERACAODIREITO ');
         QryPesqDel.Sql.Add('FROM OPERACAOINVEST O');
         QryPesqDel.Sql.Add('WHERE (O.IDTIPOOPERACAO IN (-114, -10114)) ');
         if iOperacaoDireito > 0 then
            QryPesqDel.Sql.Add('   AND O.IDOPERACAODIREITO = ' + IntToStr(iOperacaoDireito) + ' ');
         QryPesqDel.Sql.Add('   AND O.DATAOPERACAO = TO_DATE(' + QuotedStr(DateToStr(dDataProc)) + ',' + QuotedStr('dd/mm/yyyy') + ') ');
         QryPesqDel.Open;

         //Ricardo Cristiano - 16/06/2009 - N. Sol 119534 -  N. Kintana 568940

         if not DiasUteisInv.DiaUtil(dDataProc, -1, 1,'',True,False,False) then
            Exit;

         {*** GERA VENCIMENTO DE SUBSCRIÇÃO ***}
         QryOpDireito.Sql.Clear;
         QryOpDireito.Sql.Add('SELECT OI.IDOPERACAOINVEST,                          ');
         QryOpDireito.Sql.Add('       OD.DATAAGE,                                   ');
         //Ricardo Cristiano - 16/06/2009 - N. Sol 119534 -  N. Kintana 568940
         QryOpDireito.Sql.Add('       OD.DATAEX,                                    ');
         QryOpDireito.Sql.Add('       OD.IDEMISSOR,                                 ');
         QryOpDireito.Sql.Add('       OD.IDTIPOOPERACAO,                            ');
         QryOpDireito.Sql.Add('       OD.IDOPERACAODIREITO,                         ');
         QryOpDireito.Sql.Add('       OI.IDINVESTIMENTO,                            ');
         QryOpDireito.Sql.Add('       OI.IDCARTEIRAINVEST,                          ');
         QryOpDireito.Sql.Add('       OI.IDCARTEIRAGERENC,                          ');
         QryOpDireito.Sql.Add('       OI.IDCUSTODIANTE,                             ');
         QryOpDireito.Sql.Add('       TO_DATE(OD.DATAVENCIMENTO) AS DATAVENCIMENTO, ');
         QryOpDireito.Sql.Add('       OI.QTDEOPERACAO AS QTD,                       ');
         QryOpDireito.Sql.Add('       OD.DIVPORACAO   AS PU,                        ');
         QryOpDireito.Sql.Add('       (OI.QTDEOPERACAO * OD.DIVPORACAO) AS VALOR,   ');
         QryOpDireito.Sql.Add('       IV.DESCINVESTIMENTO,                          ');
         QryOpDireito.Sql.Add('       OI.IDPLANPREVCTBPATR                          ');
         QryOpDireito.Sql.Add('FROM OPERACAODIREITO OD, OPERDIREITOXINV OX, OPERACAOINVEST  OI, ');
         QryOpDireito.Sql.Add('     HISTCUSTODIA HC, INVESTIMENTO IV                ');
         QryOpDireito.Sql.Add('WHERE OX.IDOPERACAODIREITO    = OD.IDOPERACAODIREITO ');
         QryOpDireito.Sql.Add('  AND OX.IDINVESTIMENTO       = IV.IDINVESTIMENTO    ');
         QryOpDireito.Sql.Add('  AND OI.IDOPERACAODIREITO(+) = OD.IDOPERACAODIREITO ');
         QryOpDireito.Sql.Add('  AND HC.IDOPERCUSTODIA(+)    = OI.IDOPERCUSTODIA    ');
         if iOperacaoDireito > 0 then
            QryOpDireito.Sql.Add('  AND OD.IDOPERACAODIREITO = ' + IntToStr(iOperacaoDireito) + ' ');
         QryOpDireito.Sql.Add('  AND OX.ORIGDEST             = ' + QuotedStr('D') + ' ');
         QryOpDireito.Sql.Add('  AND OI.ORIGDEST             = ' + QuotedStr('D') + ' ');
         //Ricardo Cristiano - 16/06/2009 - N. Sol 119534 -  N. Kintana 568940
         //QryOpDireito.Sql.Add('  AND OD.DATAVENCIMENTO      IS NOT NULL ');
         QryOpDireito.Sql.Add('  AND OI.IDOPERACAOINVEST    IS NOT NULL ');
         QryOpDireito.Sql.Add('  AND OI.IDINVESTIMENTO      IS NOT NULL ');
         QryOpDireito.Sql.Add('  AND OD.DATAVENCIMENTO      = TO_DATE(' + QuotedStr(DateToStr(dDataProc)) + ',' + QuotedStr('DD/MM/YYYY') + ') ');
         //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509         
         QryOpDireito.Sql.Add('  AND OI.IDOPERACAOINVEST IN (SELECT MAX(OI1.IDOPERACAOINVEST) AS IDOPERACAOINVEST');
         QryOpDireito.Sql.Add('                              FROM OPERACAOINVEST OI1');
         QryOpDireito.Sql.Add('                              WHERE OI1.IDOPERACAODIREITO = OD.IDOPERACAODIREITO');
         QryOpDireito.Sql.Add('                                AND OI1.ORIGDEST          = ''D''');
         QryOpDireito.Sql.Add('                              GROUP BY OI1.IDPLANPREVCTBPATR, OI1.IDCARTEIRAINVEST) ');
         QryOpDireito.Sql.Add('ORDER BY OI.IDINVESTIMENTO, OI.IDCARTEIRAGERENC DESC ');
         QryOpDireito.Open;
         QryOpDireito.First;

         if fraFrame <> nil then
         begin
            fraFrame.Mostra;
            fraFrame.Pos := 0;
            fraFrame.Max := QryOpDireito.RecordCount;
            fraFrame.Mes := 'Verificando Subscrições Vencidas';
            Application.ProcessMessages;
         end;

         while not QryOpDireito.Eof do
         begin
            //Ricardo Cristiano - 16/06/2009 - N. Sol 119534 -  N. Kintana 568940
            QryPesqDel.First;
            if QryPesqDel.Locate('IDOPERACAODIREITO',QryOpDireito.FieldByName('IDOPERACAODIREITO').AsInteger,[]) Then
            begin
               QryOpDireito.Next;
               Continue;
            end;
            
            for I := 1 to 2 do
            begin
               if fraFrame <> nil then
               begin
                  fraFrame.Mes := 'Lançando Não Exercício de ' + QryOpDireito.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                                  'Cadastrando Operação';
                  Application.ProcessMessages;
               end;

               Tipo          := 'V';
               iTipoOperacao := OperComum.IIF(I = 1, -114, -10114);
               //AL_125
               iTipoConta    := OperComum.IIF(I = 1, 0, 1);
               sNatureza     := 'D';
               wPlano        := -1;
               iIdOperDireito    := QryOpDireito.FieldByName('IDOPERACAODIREITO').AsInteger;
               iIdCarteiraInvest := QryOpDireito.FieldByName('IDCARTEIRAINVEST').AsInteger;
               iIdCarteiraGerenc := QryOpDireito.FieldByName('IDCARTEIRAGERENC').AsInteger;
               iIdInvestimento   := QryOpDireito.FieldByName('IDINVESTIMENTO').AsInteger;
               iIdCustodiante    := QryOpDireito.FieldByName('IDCUSTODIANTE').AsInteger;
               //Ricardo Cristiano - 16/06/2009 - N. Sol 119534 -  N. Kintana 568940
               dDtAge            := dDataProc;  
               iIdEmissor        := QryOpDireito.FieldByName('IDEMISSOR').AsInteger;
               if QryOpDireito.FieldByName('IDPLANPREVCTBPATR').IsNull then
                  iPlanPrev      := iPlanPrevCtbPatro
               else
                  iPlanPrev      := QryOpDireito.FieldByName('IDPLANPREVCTBPATR').AsInteger;

               //AL_125
               //AL_131
               //AL_132
               //AL_146
               //AL_142
               //Ricardo Cristiano - 03/02/2009 - N. Sol 107933 -  N. Kintana 486332
               CtrlRV.BuscaSaldoRV.Executa(dDtAge, iPlanPrev, iIdInvestimento, iIdCarteiraInvest, iIdCarteiraGerenc, MaxInt, iIdCustodiante,
                                           '',-1, high(integer), 0, -114);
               fQtd := OperComum.IIF(I = 1, CtrlRV.BuscaSaldoRV.SaldoQtdCC, CtrlRV.BuscaSaldoRV.SaldoQtdCCI);

               if fQtd > 0 then
               begin
                  //Ricardo Cristiano - 27/07/2011 - N. Sol 162070 -  N. Kintana 1373935
                  //Ricardo Cristiano - 16/06/2009 - N. Sol 119534 -  N. Kintana 568940
{                  if QryOpDireito.FieldByName('QTD').AsFloat > 0 then
                     if QryOpDireito.FieldByName('QTD').AsFloat < fQtd then //Renan Cristiano SOL 135554 KINTATA 806980.
                        fQtd := QryOpDireito.FieldByName('QTD').AsFloat;     }
                  // Gera a Boleta - Uma para cada Operação para não ocorrer cartesiano
                  //                 na query BuscaHistDelecao do reprocessamento
                  sBoleta := 'RV-' + Copy(DateToStr(dDataProc),9,2) + '/' +
                                     FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                     Copy(DateToStr(dDataProc),9,2)));
                  //AL_142
                  OperComum.LimpaParametros(dmRendaVariavel.qryInsBoleta, True);
                  dmRendaVariavel.qryInsBoleta.ParamByName('IDBOLETA').AsString     := sBoleta;
                  dmRendaVariavel.qryInsBoleta.ParamByName('STATUS').AsString       := 'F';
                  dmRendaVariavel.qryInsBoleta.ParamByName('DATABOLETA').AsDateTime := dDataProc;
                  dmRendaVariavel.qryInsBoleta.ParamByName('TIPMOVBOLETA').AsString := 'VSU';
                  dmRendaVariavel.qryInsBoleta.ParamByName('IDFORCLI').AsInteger    := iIdEmissor;
                  dmRendaVariavel.qryInsBoleta.ExecSQL;

                  // Gera a OperacaoInvest
                  idOperacaoInvest := LeUltRegistro(Nil,'OPERACAOINVEST');

                  //AL_146 - Ini
                  //AL_142 - Ini
                  fPU               := OperComum.Round(OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoCusto, CtrlRV.BuscaSaldoRV.SaldoQtdTotal),9);
                  fSaldoAquiPro     := OperComum.Round(fPU * fQtd,2);

                  fPU               := OperComum.Round(OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoVariacao, CtrlRV.BuscaSaldoRV.SaldoQtdTotal),9);
                  fSaldoVariacaoPro := OperComum.Round(fPU * fQtd,2);

                  fPU               := OperComum.Round(OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoIRApurado, CtrlRV.BuscaSaldoRV.SaldoQtdTotal),9);
                  fSaldoIrApuPro    := OperComum.Round(fPU * fQtd,2);

                  fPU               := OperComum.Round(OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoVlrTotal, CtrlRV.BuscaSaldoRV.SaldoQtdTotal),9);
                  fValorOper        := OperComum.Round(fQtd * fPU,2);
                  //AL_142 - Fim
                  //AL_146 - Fim

                  with QryInsOperacaoInvest do
                  begin
                     SQL.Clear;
                     SQL.Add('INSERT INTO OPERACAOINVEST ');
                     SQL.Add('   (IDOPERACAOINVEST,   MOECODIGO,        IDMODULO, ');
                     SQL.Add('    EMPRESAPROP,        IDINVESTIMENTO,    IDCARTEIRAINVEST, IDCARTEIRAGERENC, ');
                     SQL.Add('    IDTIPOINVEST,       IDTIPOOPERACAO,    DATAOPERACAO,     NUMDOCUMENTO, ');
                     SQL.Add('    QTDEOPERACAO,       PRECOUNITOPERACAO, VLROPERACAO,      DATAVENCOPER, ');
                     SQL.Add('    IDCUSTODIANTE,      VLRIR,             IDOPERACAODIREITO,  ');
                     //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509                     
                     SQL.Add('    FLGSTATUSFECHBOL,   FLGSTATUSORDMOV,   IDPLANPREVCTBPATR,  ');
                     SQL.Add('    IDOPERACAOORIGEM) ');                     
                     SQL.Add('VALUES ');
                     SQL.Add('   (' + IntToStr(idOperacaoInvest) + ', ');
                     SQL.Add('    ' + IntToStr(pRPI.MOECODIGO) + ', ');
                     SQL.Add('    ' + IntToStr(Sistema.IdModulo) + ', ');
                     SQL.Add('    ' + IntToStr(Sistema.IdEmpresa) + ', ');
                     SQL.Add('    ' + IntToStr(iIdInvestimento) + ', ');
                     SQL.Add('    ' + IntToStr(iIdCarteiraInvest) + ', ');
                     SQL.Add('    ' + OperComum.IIF(iIdCarteiraGerenc > 0, IntToStr(iIdCarteiraGerenc), 'NULL') + ', ');
                     SQL.Add('    2, ');
                     SQL.Add('    ' + IntToStr(iTipoOperacao) + ', ');
                     SQL.Add('    TO_DATE(' + QuotedStr(DateToStr(dDataProc)) + ',' + QuotedStr('DD/MM/YYYY') + '), ');
                     SQL.Add('    ' + QuotedStr(sBoleta) + ', ');
                     SQL.Add('    ' + OperComum.OraNumero(fQtd) + ', ');
                     SQL.Add('    ' + IntToStr(0) + ', ');
                     SQL.Add('    ' + OperComum.OraNumero(fValorOper) + ', ');
                     SQL.Add('    TO_DATE(' + QuotedStr(DateToStr(dDataProc)) + ',' + QuotedStr('DD/MM/YYYY') + '), ');
                     SQL.Add('    ' + OperComum.IIF(iIdCarteiraGerenc = 0, IntToStr(iIdCustodiante), 'NULL') + ', ');
                     SQL.Add('    ' + IntToStr(0) + ', ');
                     SQL.Add('    ' + IntToStr(iIdOperDireito) + ', ');
                     SQL.Add('    ' + QuotedStr('F') + ', ');
                     SQL.Add('    ' + QuotedStr('L') + ', ');
                     //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
                     SQL.Add('    ' + IntToStr(iPlanPrev) + ', ');
                     SQL.Add('    ' + QryOpDireito.FieldByName('IDOPERACAOINVEST').AsString+ ') ');
                     ExecSQL;
                  end;

                  // faz atualização na Custódia
                  iIdHistCustodiaOrig := -1;
                  iIdHistCustodiaDest := -1;

                  if iIdCarteiraGerenc = 0 then
                  begin
                      if fraFrame <> nil then
                      begin
                         fraFrame.Mes := 'Lançando Não Exercício de ' + QryOpDireito.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                                         'Cadastrando Custódia';
                         Application.ProcessMessages;
                      end;

                     //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509

                     // Insere OperCustodia
                     idOperCustodia := LeUltRegistro(Nil,'OPERCUSTODIA');

                     if not OperacaoInvest.AlimentaOperCustodia(idOperCustodia,
                                                                iIdHistCustodiaOrig,
                                                                iIdHistCustodiaDest,
                                                                -1,-1,
                                                                iIdCarteiraInvest,
                                                                iIdCarteiraInvest,
                                                                iIdInvestimento,
                                                                iIdCustodiante,
                                                                iIdCustodiante,
                                                                -1,
                                                                -1,
                                                                fQtd,
                                                                dDataProc,
                                                                '',
                                                                sBoleta,
                                                                iPlanPrev) then
                        Raise Exception.Create('Não Foi Possivel Gravar a Operação na Custódia');

                     //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509                        
                     //AL_125
                     // Atualiza Histórico de Custódia
                     if not OperacaoInvest.InsereCustodia(iIdCarteiraInvest,
                                                          iIdInvestimento,
                                                          iIdCustodiante, -1,
                                                          idOperacaoInvest, idOperCustodia,
                                                          '', Tipo, dDataProc, fQtd, iIdHistCustodiaOrig,
                                                          iPlanPrev, iTipoConta) then
                       Raise Exception.Create('Não Foi Possivel Gravar o Histórico de Custódia');

                     with dtmOperComum.QryLocal do
                     begin
                        Close;
                        Sql.Clear; 
                        Sql.Add('UPDATE OPERACAOINVEST ');
                        Sql.Add('SET OPERACAOINVEST.IDOPERCUSTODIA = ' + IntToStr(idOperCustodia) + ' ');
                        Sql.Add('WHERE OPERACAOINVEST.IDOPERACAOINVEST = '+ IntToStr(idOperacaoInvest));
                        ExecSQL;
                        Close;
                     end;
                  end;

                  // Ajusta a Carteira
                  with dtmOperComum.QryLocal do
                  begin
                     Close;
                     Sql.Clear;
                     //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
                     Sql.Add('SELECT T.DESCTIPOOPERACAO FROM TIPOOPERACAO T ');
                     Sql.Add('WHERE (T.IDTIPOINVEST = '+ IntToStr(iTipoInvestUsu)+')');
                     Sql.Add('  AND (T.IDTIPOOPERACAO = '+ IntToStr(iTipoOperacao)+')');
                     Open;
                     sTipoOperacao := FieldByName('DESCTIPOOPERACAO').AsString;
                     Close;
                  end;

                  with dtmOperComum.QryLocal do
                  begin
                     Close;
                     Sql.Clear;
                     //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
                     Sql.Add('SELECT I.DESCINVESTIMENTO FROM INVESTIMENTO I ');
                     Sql.Add('WHERE (I.IDINVESTIMENTO = '+ IntToStr(iIdInvestimento) + ')');
                     Open;
                     sInvestimento := FieldByName('DESCINVESTIMENTO').AsString;
                     Close;
                  end;

                  if fraFrame <> nil then
                  begin
                     fraFrame.Mes := 'Lançando Não Exercício de ' + QryOpDireito.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                                     'Cadastrando histórico da carteira';
                     Application.ProcessMessages;
                  end;

                  // Variáveis para Contabilização
                  bCriaLancto := False;
                  iPlanilha   := -1;
                  iDocumento  := -1;
                  iPlano      := -1;

                  //Credito na Carteira
                  if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                                    iIdInvestimento,2,
                                                    idOperacaoInvest,-1,
                                                    iTipoOperacao,
                                                    iIdCarteiraInvest,
                                                    iIdCarteiraGerenc,
                                                    -1,-1,iPlanilha,iDocumento,iPlano,dDataProc,
                                                    fValorOper,fQtd,
                                                    1,0,0,0,0,0,0,0,0,0,
                                                    sNatureza ,sNatureza ,'',
                                                    Trim(sTipoOperacao) +' / '+ Trim(sInvestimento),
                                                    'OPE', '', '', True, -1,
                                                    iPlanPrev,
                                                    iIdHistCartInv) Then
                     Raise Exception.Create('Não Foi Possivel Atualizar a Carteira');

                  ExecutaQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET HISTCARTINV.MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(fSaldoAquiPro))+','+
                                                     ' HISTCARTINV.VLRVARIACAO = '+TrocaVirgulaPonto(FloatToStr(fSaldoVariacaoPro))+','+
                                                     ' HISTCARTINV.VLRIRAPU = '+TrocaVirgulaPonto(FloatToStr(fSaldoIrApuPro))+' '+
                                                     ' WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv));
                  //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509                  
                  dtmOperComum.QryLocal.Close;

                  if iIdCarteiraGerenc = 0 then
                  begin
                      if fraFrame <> nil then
                      begin
                         fraFrame.Mes := 'Lançando Não Exercício de ' + QryOpDireito.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                                         'Contabilizando a operação';
                         Application.ProcessMessages;
                      end;

                     // Custo
                     wTipoRecDesBol := '';

                     //AL_135 - Contabiliza por Plano/Patro
                     OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                             iIdInvestimento,
                                             iTipoOperacao,-1,
                                             iIdEmissor,
                                             iIdCarteiraInvest,
                                             pRPI.MOECODIGO, '','','','',
                                             sBoleta,
                                             wTipoRecDesBol, bCriaLancto, 0,
                                             fValorOper,
                                             dDataProc,dDataProc,
                                             iPlano, iPlanilha, iDocumento, wMensErro,
                                             '', True, True, 0, True, iPlanPrev);

                     if Trim(wMensErro) <> '' then
                        Raise Exception.Create('Não foi Possível Contabilizar o Valor da Operação');

                     iPlano := wPlano;

                     // Variacao
                     wTipoRecDesBol := '';

                     //AL_135 - Contabiliza por Plano/Patro
                     OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                             iIdInvestimento,
                                             iTipoOperacao,-1,
                                             iIdEmissor,
                                             iIdCarteiraInvest,
                                             pRPI.MOECODIGO, '','','','',
                                             sBoleta,
                                             wTipoRecDesBol,bCriaLancto, 0,
                                             fSaldoVariacaoPro,
                                             dDataProc,dDataProc,
                                             iPlano, iPlanilha, iDocumento, wMensErro,
                                             '', True, True, 0, True, iPlanPrev);

                     if Trim(wMensErro) <> '' then
                        Raise Exception.Create('Não foi Possível Contabilizar a Variação Proporcional');

                     //AL_146 - Ini
                     // Atualiza a Boleta com a Planilha
                     CtrlRV.UpdateBoleta(sBoleta,
                                         ['STATUS', 'PLANO', 'PLNCODIGO', 'CODDOCUMENTO'],
                                         ['F', IntToStr(iPlano), IntToStr(iPlanilha), IntToStr(iDocumento)]);
                     //AL_146 - Fim
                  end;
                  //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
               end;
            end;
            QryOpDireito.Next;
         end;

         //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
         QryOpDireito.First;
         if not QryOpDireito.IsEmpty then
         begin
            if not OperComum.AtualizaSaldos(1,-1) then
               Raise Exception.Create('Não Foi Possivel Atualizar o Saldo de carteira');

            if not OperacaoInvest.AtualizaSaldosCustodia then
               Raise Exception.Create('Não Foi Possivel Atualizar o Saldo de Custódia');

            iIdInvestimento   := -1;
            
            QryOpDireito.First;
            while not QryOpDireito.eof do
            begin
               QryPesqDel.First;
               if QryPesqDel.Locate('IDOPERACAODIREITO',QryOpDireito.FieldByName('IDOPERACAODIREITO').AsInteger,[]) Then
               begin
                  QryOpDireito.Next;
                  Continue;
               end;
               // Só marca o papel se for alterada a carteira
               if ((dDataProc <= pRPI.DATAULTFECH) and (iIdInvestimento <> QryOpDireito.FieldByName('IDINVESTIMENTO').AsInteger)) Then
               begin
                  RendaVariavel.MarcarFlagReproc(QryOpDireito.FieldByName('IDINVESTIMENTO').AsInteger, -1, -1, dDataProc);
                  iIdInvestimento   := QryOpDireito.FieldByName('IDINVESTIMENTO').AsInteger;
               end;
               QryOpDireito.Next;
            end;
         end;
         
         Result := True;
      except
         On E : Exception do
         begin
            Result := False;
            MsgDlg('Operação Não Efetivada (Vencimento de Subscrições).' + #13 +
                   E.Message, 'Mensagem do Sistema', MtWarning,[MbOk],0);
            //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509                   
         end;
      end;
   finally
      if fraFrame <> nil then
      begin
         fraFrame.Apaga;
         Application.ProcessMessages;
      end;
      QryOpDireito.Close;
      QryPesqDel.Close;
      QryInsOperacaoInvest.Close;
      FreeAndNil(QryPesqDel);
      FreeAndNil(QryOpDireito);
      FreeAndNil(QryInsOperacaoInvest);
      //AL_142
      FreeAndNil(CtrlRV);
   end;
end;

//Al_134 - > Colocar na CtrlRendaVariavel
function TRendaVariavel.TransfEntrePlanos(CdsSldTRCPlanoSintetico : TClientDataSet;
                                          sBoleta, sObs : String; iCustEx: Integer = -1): boolean;
Var
   fQtdTransf, fSaldoAquiPro, fSaldoVariacaoPro, fSaldoIrApuPro, fValorOper,
     fQtdTotP, fQtdCarP, fQtdP : Double;
   iIdOperCustodia, iIdHistCustodiaOrig, iIdHistCustodiaDest, iIdHistCartInvDest, iIdHistCartInvOrig,
     i : Integer;
   iTipoOperacao, iDocumento, iPlano, iPlanilha, iIdCustodiante : Integer;
   //AL_135
   sTipoOperacao, sMens1, sMens2 : String;
   CdsSldTRCPlanoAnalitico  : TClientDataSet;
   CdsOperacaoInvest : TClientDataSet;
   CtrlRendaVariavel : TCtrlRendaVariavel;
begin
   Result := True;
   Try
      CtrlRendaVariavel := TCtrlRendaVariavel.Create;
      CtrlRendaVariavel.InitializeAs(Padroes);

      CdsSldTRCPlanoAnalitico := TClientDataSet.Create(nil);
      CdsOperacaoInvest       := TClientDataSet.Create(nil);

      CtrlRendaVariavel.CdsOperacaoInvest := CdsOperacaoInvest;
      CdsOperacaoInvest.Data := CtrlRendaVariavel.ListOperacaoInvest(0);

      // Inicia o Processo
      iDocumento:= -1;
      iPlano    := -1;
      iPlanilha := -1;
      Try
         // Busca os Saldos na Carteira
         CdsSldTRCPlanoSintetico.First;

         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('', CdsSldTRCPlanoSintetico.RecordCount);

         while not CdsSldTRCPlanoSintetico.EOF do
         begin
            sMens1 := 'Transferindo ' + CdsSldTRCPlanoSintetico.FieldByName('DESCINVESTIMENTO').AsString;

            if Assigned(AtualizaProcFech) then
               AtualizaProcFech(sMens1, 0);

            //Busca os Saldos na Custodia aberto por Custodiante e Motivo de Bloqueio
            CdsSldTRCPlanoAnalitico.Data := CtrlRendaVariavel.BuscaSldTRCPlanoAnalitico(CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                                                        CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                                        CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBORIG').AsInteger,
                                                                                        CdsSldTRCPlanoSintetico.FieldByName('IDCARTEIRAINVEST').AsInteger);
            CdsSldTRCPlanoAnalitico.First;
            while not CdsSldTRCPlanoAnalitico.EOF do
            begin
               //Ricardo Cristiano - 04/11/2010 - N. Sol 144087.2861 -  N. Kintana 1011203
               if ((CdsSldTRCPlanoAnalitico.RecordCount > 1) and
                   (CdsSldTRCPlanoAnalitico.FieldByName('IDCARTEIRAGERENC').IsNull) and
                   (cdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').IsNull)) then
               begin
                  cdsSldTRCPlanoAnalitico.Next;
                  Continue;
               end;    

               // Busca o Saldo do Plano de Origem
               iIdCustodiante := -1;
               if not cdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').IsNull then
               begin
                  //AL_135 - Se for a custodia de exceção, pula para o próximo registro
                  if CdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').AsInteger = iCustEx then
                  begin
                     //Ricardo Cristiano - 09/09/2008 - N. Sol 95179 -  N. Kintana 411114
                     Result := False;
                     CdsSldTRCPlanoAnalitico.Next;
                     Continue;
                  end;
                  //Ricardo Cristiano - 09/09/2008 - N. Sol 95179 -  N. Kintana 411114
                  Result := True;
                  iIdCustodiante := CdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').AsInteger;
               end;
                //Ricardo Cristiano - 09/09/2008 - N. Sol 95179 -  N. Kintana 411114
               //AL_135 - Saldos do Dia anterior
               if not CtrlRendaVariavel.BuscaSaldoRV.Executa(CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime - 1,
                                                      CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBORIG').AsInteger,
                                                      CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                      CdsSldTRCPlanoSintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                      CdsSldTRCPlanoAnalitico.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                      9999999,
                                                      iIdCustodiante,
                                                      '',
                                                      CdsSldTRCPlanoAnalitico.FieldByName('IDMOTIVOBLOQUEIO').AsInteger) then
                  Raise Exception.Create('Não foi encontrado Saldo para o Investimento.');

               // AL_135 - Faz CC e CCI - Ini
               for i := 1 to 2 do
               begin
                  if ((i = 1) and (CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCC > 0)) or
                     ((i = 2) and (CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCCI > 0)) then
                  begin
                     fQtdTotP := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal * (CdsSldTRCPlanoSintetico.FieldByName('PERCTRANSFERIDO').AsFloat / 100);

                     if (i = 1) then
                     begin
                        // CC
                        fQtdCarP := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCC * (CdsSldTRCPlanoSintetico.FieldByName('PERCTRANSFERIDO').AsFloat / 100);
                        sMens2 := 'Custódia: ' + CdsSldTRCPlanoAnalitico.FieldByName('SGLCUSTODIANTE').AsString + ' (CC): ';
                     end
                     else
                     begin
                        // CCI
                        fQtdCarP := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCCI * (CdsSldTRCPlanoSintetico.FieldByName('PERCTRANSFERIDO').AsFloat / 100);
                        sMens2 := 'Custódia: ' + CdsSldTRCPlanoAnalitico.FieldByName('SGLCUSTODIANTE').AsString + ' (CCI): ';
                     end;

                     fQtdP := CdsSldTRCPlanoAnalitico.FieldByName('QTDE').AsFloat * (CdsSldTRCPlanoSintetico.FieldByName('PERCTRANSFERIDO').AsFloat / 100);
                     fQtdTransf := RoundCM((fQtdCarP / fQtdTotP) * fQtdP, 0);
                     fSaldoAquiPro     := RoundCM((CtrlRendaVariavel.BuscaSaldoRV.SaldoCusto /
                                                   CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal) * fQtdTransf, 2);
                     fSaldoVariacaoPro := RoundCM((CtrlRendaVariavel.BuscaSaldoRV.SaldoVariacao /
                                                  CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal) * fQtdTransf, 2);
                     fSaldoIrApuPro :=    RoundCM((CtrlRendaVariavel.BuscaSaldoRV.SaldoIRApurado /
                                                   CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal) * fQtdTransf, 2);

                     sMens2 := sMens2 + FormatFloat('###,###,###,##0', fQtdTransf);
                     if Assigned(AtualizaProcFech) then
                        AtualizaProcFech(sMens1 + #13 + sMens2, 0);

                     //AL_135 - Verifica se Tem quantidade a transferir
                     if fQtdTransf <= 0 then
                     begin
                        if OperComum.InvMsgBox('O percentual a ser transferido para: ' + #13 +
                                               'Investimento: ' + CdsSldTRCPlanoAnalitico.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                                               'Carteira: ' + CdsSldTRCPlanoAnalitico.FieldByName('DESCCARTINVEST').AsString + #13 +
                                               'Custodia: ' + CdsSldTRCPlanoAnalitico.FieldByName('SGLCUSTODIANTE').AsString + #13 +
                                               'Saldo ' + OperComum.IIF(i = 1, 'CC', 'CCI') + #13 +
                                               'é 0(zero) ou não é significativo' + #13 +
                                               'Esta posição não será transferida.',
                                               mtWarning, 'Mensagem do Sistema', [mbYes, mbCancel], 'Continua;Cancela') = mrCancel then
                           Raise Exception.Create('Processo interrompido pelo usuário')
                        else
                           Continue;
                     end;

                     // Verifica se possui saldo para transferir.
                     if CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal < fQtdTransf then
                        Raise Exception.Create('A Quantidade é superior ao saldo para transferência.');

                     // Pesquisa se Boleta ja tem Registro na Tabela de Boletas
                     OperComum.LimpaParametros(dtmOperComum.QryBoleta);
                     dtmOperComum.QryBoleta.ParamByName('IDBOLETA').AsString := sBoleta;
                     dtmOperComum.QryBoleta.Open;

                     // Caso não tenha, cria um registro
                     If dtmOperComum.QryBoleta.IsEmpty Then
                     begin
                        sBoleta :=  'RV-'+Copy(DateToStr(CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime),9,2)+'/'+FormatFloat('0000',
                                     LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(DateToStr(CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime),9,2)));

                        // Não leva o IDFORCLI em função do LOTE da Boleta
                        ExecutaQuery(dtmOperComum.QryAuxiliar,'INSERT INTO BOLETA (IDBOLETA, DATABOLETA, STATUS, TIPMOVBOLETA) VALUES ('+
                                               QuotedStr(sBoleta)+', TO_DATE('+
                                               QuotedStr(DateToStr(CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime))+',''DD/MM/YYYY''), '+
                                               ' ''F'''+',''TRP'')');
                     end;

                     // Grava a Custódia
                     //AL_135
                     iIdOperCustodia := 0;
                     if not CdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').IsNull then
                     begin
                        iIdOperCustodia := LeUltRegistro(Nil,'OPERCUSTODIA');
                        if not OperacaoInvest.AlimentaOperCustodia(iIdOperCustodia,
                                                                   -1,-1,-1,-1,
                                                                   CdsSldTRCPlanoSintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                   CdsSldTRCPlanoSintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                   CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                   CdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').AsInteger,
                                                                   CdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').AsInteger,
                                                                   CdsSldTRCPlanoAnalitico.FieldByName('IDMOTIVOBLOQUEIO').AsInteger,
                                                                   CdsSldTRCPlanoAnalitico.FieldByName('IDMOTIVOBLOQUEIO').AsInteger,
                                                                   fQtdTransf,
                                                                   CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                                   '',
                                                                   sBoleta,
                                                                   CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBORIG').AsInteger,
                                                                   -1,
                                                                   CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBDEST').AsInteger) then
                           Raise Exception.Create('Não é possível alimentar a custódia com essa operação!');

                        // Grava HistCustodia Origem
                        OperComum.AlteraHistCustodiaOrigem(iIdOperCustodia,
                                                           CdsSldTRCPlanoAnalitico.FieldByName('IDMOTIVOBLOQUEIO').AsInteger,
                                                           CdsSldTRCPlanoSintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                           CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                           CdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').AsInteger,
                                                           '',
                                                           CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                           fQtdTransf,
                                                           iIdHistCustodiaOrig,
                                                           CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBORIG').AsInteger);

                        OperacaoInvest.AtualizaSaldosCustodia;

                        // Grava HistCustodia Destino
                        OperComum.InsereHistCustodiaDestino(iIdOperCustodia,
                                                            CdsSldTRCPlanoAnalitico.FieldByName('IDMOTIVOBLOQUEIO').AsInteger,
                                                            CdsSldTRCPlanoSintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                            CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                            CdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').AsInteger,
                                                            '',
                                                            CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                            fQtdTransf,
                                                            iIdHistCustodiaDest,
                                                            CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBDEST').AsInteger);

                        OperacaoInvest.AtualizaSaldosCustodia;
                     end;

                     //AL_135
                     fValorOper :=  RoundCM(fQtdTransf * OperComum.DivValorZero(CtrlRendaVariavel.BuscaSaldoRV.SaldoVlrTotal, CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal),2);

                     //Baixa na HistCartInv
                     //AL_135
                     if i = 1 then
                        iTipoOperacao  := -158
                     else
                        iTipoOperacao  := -10158;

                     // Capta a descrição do Tipo de Operação no cadastro
                     dtmOperComum.QryLocal.Close;
                     dtmOperComum.QryLocal.Sql.Clear;
                     dtmOperComum.QryLocal.Sql.Add('SELECT TP.DESCTIPOOPERACAO FROM TIPOOPERACAO TP ');
                     dtmOperComum.QryLocal.Sql.Add('WHERE (TP.IDTIPOOPERACAO = '+ IntToStr(iTipoOperacao)+')');
                     dtmOperComum.QryLocal.Open;
                     sTipoOperacao   := dtmOperComum.QryLocal.FieldByName('DESCTIPOOPERACAO').AsString;
                     if dtmOperComum.QryLocal.eof then
                     begin
                        dtmOperComum.QryLocal.Close;
                        Raise Exception.Create('Não foi encontrado o Tipo de Operação = '+IntToStr(iTipoOperacao)+'!'+#13+
                                               'Verifique o cadastro de Tipos de Operação.');
                     end;

                     // Atualiza o Tipo de operação destino utilizada
                     if not CdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').IsNull then
                     begin
                        ExecutarQuery(dtmOperComum.QryLocal,'UPDATE OPERCUSTODIA SET OPERCUSTODIA.IDTIPOOPERORIG = ' + IntToStr(iTipoOperacao) + ' ' +
                                                            'WHERE OPERCUSTODIA.IDOPERCUSTODIA = ' + IntToStr(iIdOperCustodia));
                     end;

                     //Grava OperacaoInvest Origem
                     if not CtrlRendaVariavel.AplicaAtualOperacaoInvest(CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                                        0, 0, 0, 0, 0, 0,
                                                                        iTipoOperacao,
                                                                        2,
                                                                        CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBORIG').AsInteger,
                                                                        iIdOperCustodia,
                                                                        -1,
                                                                        Sistema.IdModulo,
                                                                        CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                        CdsSldTRCPlanoSintetico.FieldByName('IDEMISSOR').AsInteger,
                                                                        CdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').AsInteger,
                                                                        -1,
                                                                        CdsSldTRCPlanoSintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                        CdsSldTRCPlanoAnalitico.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                                        -1, -1, -1, -1, -1, -1, -1,
                                                                        Sistema.IdEmpresa,
                                                                        -1,
                                                                        fValorOper,
                                                                        OperComum.DivValorZero(fValorOper,fQtdTransf),//,fPrecounitoperacao;
                                                                        fQtdTransf,
                                                                        CdsSldTRCPlanoSintetico.FieldByName('PERCTRANSFERIDO').AsFloat,
                                                                         0,
                                                                         0,
                                                                         0,
                                                                         0,
                                                                         0,
                                                                         0,
                                                                         'O',
                                                                         sObs,
                                                                         sBoleta) then
                        Raise Exception.Create('Não foi possível gravar a operação.');

                     // Baixa no Plano Origem
                     If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                                       CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                       2,
                                                       CtrlRendaVariavel.IdOperacaoInvest,
                                                       -1,iTipoOperacao,
                                                       CdsSldTRCPlanoSintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                       CdsSldTRCPlanoAnalitico.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                       -1,-1,-1,-1,-1,
                                                       CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                       fValorOper,
                                                       fQtdTransf,
                                                       1,0,0,0,0,0,0,0,0,0,
                                                       'D','D','',
                                                       sTipoOperacao + ' : ' + CdsSldTRCPlanoSintetico.FieldByName('DESCINVESTIMENTO').AsString,
                                                       'TRP', '', '', True, -1,
                                                       CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBORIG').AsInteger,
                                                       iIdHistCartInv) Then
                        Raise Exception.Create('Não foi possível alimentar a carteira com essa operação!');

                     iIdHistCartInvOrig := iIdHistCartInv;

                     ExecutaQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET HISTCARTINV.MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(fSaldoAquiPro))+','+
                                                        ' HISTCARTINV.VLRVARIACAO = '+TrocaVirgulaPonto(FloatToStr(fSaldoVariacaoPro))+','+
                                                        ' HISTCARTINV.VLRIRAPU = '+TrocaVirgulaPonto(FloatToStr(fSaldoIrApuPro))+' '+
                                                        ' WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv));

                     if not OperComum.AtualizaSaldos(1,-1) Then
                        Raise Exception.Create('Não foi possível atualizar o saldo ' + #13 +
                                               'Data ' + DateToStr(CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime) + #13 +
                                               'Operação' + sTipoOperacao + #13 +
                                               'Investimento ' + CdsSldTRCPlanoSintetico.FieldByName('DESCINVESTIMENTO').AsString);

                     // Atualiza o IDHistCartInvDest na OperCustodia
                     if not CdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').IsNull then
                     begin
                        if not OperacaoInvest.AtualizaOperCustodia(iIdOperCustodia,-1, -1, -1, iIdHistCartInvOrig) then
                        Raise Exception.Create('Não foi possível atualizar a custódia destino' + #13 +
                                               'Data ' + DateToStr(CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime) + #13 +
                                               'Operação' + sTipoOperacao + #13 +
                                               'Investimento ' + CdsSldTRCPlanoSintetico.FieldByName('DESCINVESTIMENTO').AsString);
                     end;

                     // Variáveis para Contabilização
                     bCriaLancto := False;
                     wTipoRecDesBol := '';
                     if CdsSldTRCPlanoAnalitico.FieldByName('IDCARTEIRAGERENC').IsNull then
                     begin
                        //AL_135 - Contabiliza por Plano/Patro
                        OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                                CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                iTipoOperacao,
                                                CtrlRendaVariavel.IdOperacaoInvest,
                                                CdsSldTRCPlanoSintetico.FieldByName('IDEMISSOR').AsInteger,
                                                CdsSldTRCPlanoSintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                pRPI.MOECODIGO, '','','','','',
                                                wTipoRecDesBol,
                                                bCriaLancto,
                                                0, fValorOper,
                                                CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                iPlano, iPlanilha, iDocumento, wMensErro,'N',False,False, 0, True,
                                                CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBORIG').AsInteger);
                     if Trim(wMensErro) <> '' then
                        Raise Exception.Create('Ocorreu um problema na contabilização da operação :' + wMensErro);
                     end;

                     ExecutarQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET HISTCARTINV.FLGCUSTODIA = NULL WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv));

                     //AL_135
                     if i = 1 then
                        iTipoOperacao  := -159
                     else
                        iTipoOperacao  := -10159;

                     // Capta a descrição do Tipo de Operação no cadastro
                     dtmOperComum.QryLocal.Close;
                     dtmOperComum.QryLocal.Sql.Clear;
                     dtmOperComum.QryLocal.Sql.Add('SELECT TP.DESCTIPOOPERACAO FROM TIPOOPERACAO TP ');
                     dtmOperComum.QryLocal.Sql.Add('WHERE (TP.IDTIPOOPERACAO = '+ IntToStr(iTipoOperacao)+')');
                     dtmOperComum.QryLocal.Open;
                     sTipoOperacao := dtmOperComum.QryLocal.FieldByName('DESCTIPOOPERACAO').AsString;
                     if dtmOperComum.QryLocal.eof then
                     begin
                        dtmOperComum.QryLocal.Close;
                        Raise Exception.Create('Não foi encontrado o Tipo de Operação = '+IntToStr(iTipoOperacao)+'!'+#13+
                                               'Verifique o cadastro de Tipos de Operação.');
                     end;

                     // Atualiza o Tipo de operação Origem utilizada
                     if not CdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').IsNull then
                     begin
                        ExecutarQuery(dtmOperComum.QryLocal,'UPDATE OPERCUSTODIA SET OPERCUSTODIA.IDTIPOOPERDEST = ' + IntToStr(iTipoOperacao) + ' ' +
                                                            'WHERE OPERCUSTODIA.IDOPERCUSTODIA = ' + IntToStr(iIdOperCustodia));
                     end;

                     //Grava OperacaoInvest Destino
                     if not CtrlRendaVariavel.AplicaAtualOperacaoInvest(CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                                        0, 0, 0, 0, 0, 0,
                                                                        iTipoOperacao,
                                                                        2,
                                                                        CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBDEST').AsInteger,
                                                                        iIdOperCustodia,
                                                                        -1,
                                                                        Sistema.IdModulo,
                                                                        CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                        CdsSldTRCPlanoSintetico.FieldByName('IDEMISSOR').AsInteger,
                                                                        CdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').AsInteger,
                                                                        -1,
                                                                        CdsSldTRCPlanoSintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                        CdsSldTRCPlanoAnalitico.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                                        -1, -1, -1, -1, -1, -1, -1,
                                                                        Sistema.IdEmpresa,
                                                                        -1,
                                                                        fValorOper,
                                                                        OperComum.DivValorZero(fValorOper,fQtdTransf),//,fPrecounitoperacao;
                                                                        fQtdTransf,
                                                                        CdsSldTRCPlanoSintetico.FieldByName('PERCTRANSFERIDO').AsFloat,
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        'D',
                                                                        sObs,
                                                                        sBoleta) then
                     Raise Exception.Create('Não foi possível gravar a operação.');

                     //Aumento mo Plano de Destino
                     if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                                       CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                       2,
                                                       CtrlRendaVariavel.IdOperacaoInvest,
                                                       -1,iTipoOperacao,
                                                       CdsSldTRCPlanoSintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                       CdsSldTRCPlanoAnalitico.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                       -1,-1,-1,-1,-1,
                                                       CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                       fValorOper,
                                                       fQtdTransf,
                                                       1, fSaldoVariacaoPro,0, fSaldoIrApuPro,0,0,0,0,0,0,
                                                       'A','A', '',
                                                       sTipoOperacao +' : '+ CdsSldTRCPlanoSintetico.FieldByName('DESCINVESTIMENTO').AsString,
                                                       'TRP', '', '', True,-1,
                                                       CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBDEST').AsInteger,
                                                       iIdHistCartInv) Then
                        Raise Exception.Create('Não foi possível alimentar a carteira com essa operação!');

                     iIdHistCartInvDest := iIdHistCartInv;

                     ExecutaQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET HISTCARTINV.MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(fSaldoAquiPro))+','+
                                                        ' HISTCARTINV.VLRVARIACAO = '+TrocaVirgulaPonto(FloatToStr(fSaldoVariacaoPro))+','+
                                                        ' HISTCARTINV.VLRIRAPU = '+TrocaVirgulaPonto(FloatToStr(fSaldoIrApuPro))+' '+
                                                        ' WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv));


                     if not OperComum.AtualizaSaldos(1,-1) Then
                        Raise Exception.Create('Não foi possível atualizar o saldo ' + #13 +
                                               'Data ' + DateToStr(CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime) + #13 +
                                               'Operação' + sTipoOperacao + #13 +
                                               'Investimento ' + CdsSldTRCPlanoSintetico.FieldByName('DESCINVESTIMENTO').AsString);

                     if not CdsSldTRCPlanoAnalitico.FieldByName('IDCUSTODIANTE').IsNull then
                     begin
                        if not OperacaoInvest.AtualizaOperCustodia(iIdOperCustodia,
                                                                   iIdHistCustodiaOrig,
                                                                   iIdHistCustodiaDest,
                                                                   iIdHistCartInvOrig,iIdHistCartInvDest) then
                           Raise Exception.Create('Não foi possível atualizar a custódia ' + #13 +
                                               'Data ' + DateToStr(CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime) + #13 +
                                               'Operação' + sTipoOperacao + #13 +
                                               'Investimento ' + CdsSldTRCPlanoSintetico.FieldByName('DESCINVESTIMENTO').AsString);
                     end;

                     ExecutarQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET HISTCARTINV.FLGCUSTODIA = NULL WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv));

                     wTipoRecDesBol := '';

                     if CdsSldTRCPlanoAnalitico.FieldByName('IDCARTEIRAGERENC').IsNull then
                     begin
                        //AL_135 - Contabiliza por Plano/Patro
                        OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                                CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                iTipoOperacao,
                                                CtrlRendaVariavel.IdOperacaoInvest,
                                                CdsSldTRCPlanoSintetico.FieldByName('IDEMISSOR').AsInteger,
                                                CdsSldTRCPlanoSintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                pRPI.MOECODIGO, '','','','','',
                                                wTipoRecDesBol,
                                                bCriaLancto,
                                                0, fValorOper,
                                                CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                iPlano, iPlanilha, iDocumento, wMensErro,'N',False,False, 0, True,
                                                CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBORIG').AsInteger);
                        if Trim(wMensErro) <> '' then
                           Raise Exception.Create('Ocorreu um problema na contabilização da operação :' + wMensErro);

                        // Atualiza a Boleta com a Planilha
                        //AL_144
                        if iPlanilha > 0 then
                        begin
                           dtmOperComum.qryLocal.Close;
                           dtmOperComum.qryLocal.SQL.Clear;
                           dtmOperComum.qryLocal.SQL.Add(' UPDATE BOLETA SET ');
                           if iPlano <> -1 then
                              dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ')
                           else
                              dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = '''' ,');
                           if iPlanilha <> -1 then
                              dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilha)) + ' ')
                           else
                              dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = '''' ');
                           dtmOperComum.qryLocal.SQL.Add('WHERE BOLETA.IDBOLETA = ' + QuotedStr(sBoleta) + ' ');
                           dtmOperComum.qryLocal.ExecSQL;
                        end;
                     end;
                  end;
               end;
               // AL_135 - Faz CC e CCI - Ini

               // AL_135
               if CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime < pRPI.DATAULTFECH then
               begin

                  if Assigned(AtualizaProcFech) then
                     AtualizaProcFech(sMens1 + #13 + 'Marcando para Reprocessamento', 0);

                  // Carteira Origem
                  if not RendaVariavel.MarcarFlagReproc(CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                        CdsSldTRCPlanoSintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                        CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBORIG').AsInteger,
                                                        CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                        False,
                                                        True,
                                                        True,
                                                        False,
                                                        'TRP') then
                     Raise Exception.Create('Não foi possível marcar ' + CdsSldTRCPlanoSintetico.FieldByName('DESCINVESTIMENTO').AsString + 'para Reprocessamento no Plano de Origem.');

                  // Carteira Destino
                  if not RendaVariavel.MarcarFlagReproc(CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                        CdsSldTRCPlanoSintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                        CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBDEST').AsInteger,
                                                        CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                        False,
                                                        True,
                                                        True,
                                                        False,
                                                        'TRP') then
                     Raise Exception.Create('Não foi possível marcar ' + CdsSldTRCPlanoSintetico.FieldByName('DESCINVESTIMENTO').AsString + 'para Reprocessamento no Plano de Destino.');
               end;
               CdsSldTRCPlanoAnalitico.Next;
               if Assigned(AtualizaProcFech) then
                  AtualizaProcFech('');
            end;

            CdsSldTRCPlanoSintetico.Next
         end;
      Except
         On E:Exception Do
         Begin
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         End;
      End;
  Finally
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('', -2);
      FreeAndNil(CtrlRendaVariavel);
      FreeAndNil(CdsSldTRCPlanoAnalitico);
      FreeAndNil(CdsOperacaoInvest);
  end;
end;

//AL_134
function TRendaVariavel.GeraNumBoleta(dDataOper : TDateTime;
                                      sBoleta: String = ''): String;
begin
   Result := '';
   with DMRendaVariavel, DMRendaVariavel.qryNumBoleta do
   begin
      Try
         if sBoleta <> '' then
         begin
            OperComum.LimpaParametros(qryNumBoleta);
            ParamByName('IDBOLETA').AsString := sBoleta;
            Open;
            if not IsEmpty then
               Result := FieldByName('BOLETA').AsString
            else
               Result := 'RV-' + Copy(DateToStr(dDataoper),9,2) + '/' +
                         FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR'))
         end
         else
            Result := 'RV-' + Copy(DateToStr(dDataoper),9,2) + '/' +
                      FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR'))
      finally
         Close;
      end;
   end;
end;

//AL_135
function TRendaVariavel.VerificaMarcado(iPlanPrev, iCarteira, iInvestimento: Integer): Boolean;
begin
   OperComum.LimpaParametros(DMRendaVariavel.qryBuscaFlgReproc);
   //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
   if iPlanPrev > 0 then
      DMRendaVariavel.qryBuscaFlgReproc.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
   //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
   if iCarteira > 0 then
      DMRendaVariavel.qryBuscaFlgReproc.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteira;
   DMRendaVariavel.qryBuscaFlgReproc.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
   DMRendaVariavel.qryBuscaFlgReproc.Open;
   Result := not (DMRendaVariavel.qryBuscaFlgReproc.IsEmpty);
   //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
   DMRendaVariavel.qryBuscaFlgReproc.Close;
end;

// AL_30 - Ini
// OPE - Operações de C/V
function TRendaVariavel.LancaBoletaOPE(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var fQtdeOperacao, fVlrOperacao: Double;
    iIdHistCartInv, iIdOperCust: Integer;
    sFlgCustodia: String;
begin
   try
      Result := False;
      OperComum.LimpaParametros(DMRendaVariavel.qryBuscaBoletaOPE);
      //AL_20 - 23/11/2004
      if pRPI.IDTIPOOPERLIQPEND <> 0 then
         DMRendaVariavel.qryBuscaBoletaOPE.ParamByName('IDTIPOOPERACAO').AsInteger := pRPI.IDTIPOOPERLIQPEND;
      DMRendaVariavel.qryBuscaBoletaOPE.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataProc);
      DMRendaVariavel.qryBuscaBoletaOPE.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
      DMRendaVariavel.qryBuscaBoletaOPE.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
      if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
         DMRendaVariavel.qryBuscaBoletaOPE.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
      DMRendaVariavel.qryBuscaBoletaOPE.ParamByName('IDBOLETA').AsString           := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
      DMRendaVariavel.qryBuscaBoletaOPE.Open;

      while not DMRendaVariavel.qryBuscaBoletaOPE.EOF do
      begin
         if DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('TIPOMOVTO').AsString = 'OPE' then
         begin
            fQtdeOperacao := DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('QTDEOPERACAO').AsFloat;
            fVlrOperacao  := DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('VLROPERACAO').AsFloat;
            //Busca quantidade original da operação de pendencia de liquidacao de bolsa
            If Not DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDOPERACAOORIGEM').IsNull Then
            begin
               //Busca o valor que está na tabela de OPERACAOPENDENTE
               OperComum.LimpaParametros(DMRendaVariavel.QryBuscaOperPendentes);
               DMRendaVariavel.QryBuscaOperPendentes.ParamByName('IDOPERACAOORIGEM').AsInteger := DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDOPERACAOORIGEM').AsInteger;
               DMRendaVariavel.QryBuscaOperPendentes.Open;
               //AL_20 - 23/11/2004
               fQtdeOperacao := fQtdeOperacao + DMRendaVariavel.QryBuscaOperPendentes.FieldByName('QTDEOPERACAO').AsFloat;
               //Busca o valor da pendência da pendência na tabela de OPERACAOINVEST
               OperComum.LimpaParametros(DMRendaVariavel.QryBuscaOperInvestPend);
               DMRendaVariavel.QryBuscaOperInvestPend.ParamByName('IDTIPOOPERACAO').AsInteger := pRPI.IDTIPOOPERLIQPEND;
               DMRendaVariavel.QryBuscaOperInvestPend.ParamByName('IDOPERACAOORIGEM').AsInteger := DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDOPERACAOORIGEM').AsInteger;
               DMRendaVariavel.QryBuscaOperInvestPend.Open;
               //AL_20 - 23/11/2004
               fQtdeOperacao := fQtdeOperacao + DMRendaVariavel.QryBuscaOperInvestPend.FieldByName('QTDEOPERACAO').AsFloat;

               FazQuery(DMRendaVariavel.qryLocalAux,
                        ' SELECT  INV.IDINVESTIMENTO, INV.IDMOEDACONTAB, INV.IDEMISSOR, INV.IDTIPOINVEST, '+
                        '         INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AXB.QTDELOTE '+
                        ' FROM INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB  '+
                        ' WHERE (INV.IDINVESTIMENTO = '+QuotedStr(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
                        '       (INV.IDINVESTIMENTO = ACA.IDACAO) AND '+
                        '       (INV.IDINVESTIMENTO = AXB.IDACAO) ');

               fVlrOperacao  := OperComum.DivValorZero(fQtdeOperacao,
                                                       DMRendaVariavel.QryLocalAux.FieldByName('QTDELOTE').AsInteger)*
                                                       DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('PRECOUNITOPERACAO').AsFloat;

               //AL_28 - 06/12/2004
               if fVlrOperacao <> 0 then
                  fVlrOperacao := fVlrOperacao - 0.0049;
               //AL_28 - FIM

               DMRendaVariavel.qryLocalAux.Close;
               DMRendaVariavel.QryBuscaOperPendentes.Close;
               DMRendaVariavel.QryBuscaOperInvestPend.Close;
            end;

            // Refaz o HISTCARTINV
            // Se for Venda, Gera o registro de Lucro
            // AL_30
            if (DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('NATUREZAOPERACAO').AsString = 'D') and
               (not ((DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDTIPOOPERACAO').AsInteger = -110) or
                     (DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDTIPOOPERACAO').AsInteger = -111) or
                     (DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDTIPOOPERACAO').AsInteger = -112) or
                     (DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDTIPOOPERACAO').AsInteger = -113) or
                     //AL_140 - Liq. Contr.Acoes com Venda de Ações não gera Lucro
                     (DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDTIPOOPERACAO').AsInteger = -164) or
                     (DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDTIPOOPERACAO').AsInteger = -10164) or
                     //AL_157
                     (DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDTIPOOPERACAO').AsInteger = -35) or
                     (DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDTIPOOPERACAO').AsInteger = -118) ) ) then
            begin
               // AL_30 - Fim
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                 DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDINVESTIMENTO').AsInteger, 2,
                                                 DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDOPERACAOINVEST').AsInteger, -1,
                                                 DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                 DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                 DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 dDataProc,
                                                 // AL_123
                                                 0,
                                                 fQtdeOperacao,
                                                 pRPI.VLRCOTAINICART,
                                                 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                 'L' ,DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('NATUREZAOPERACAO').AsString,
                                                 DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDLOTE').AsString,
                                                 'LUCRO/PREJUIZO NA VENDA'+' - '+
                                                 Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'LUC', '', '', True,
                                                 DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDCORRETVALORES').AsInteger,
                                                 DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + DateToStr(dDataProc) + #13 +
                                         'Operação: LUCRO/PREJUIZO NA VENDA' + #13 +
                                         'Investimento: ' + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
            end;

            if DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDCARTEIRAGERENC').AsInteger <> 0 then
               sFlgCustodia := ''
            else
               sFlgCustodia := '1';

            if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                              DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDINVESTIMENTO').AsInteger, 2,
                                              DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDOPERACAOINVEST').AsInteger, -1,
                                              DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDTIPOOPERACAO').AsInteger,
                                              DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                              DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                              -1, -1, -1, -1, -1,
                                              dDataProc,
                                              fVlrOperacao, fQtdeOperacao,
                                              pRPI.VLRCOTAINICART,
                                              0, 0, 0, DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('VLRIR').AsInteger,
                                              0, 0, 0, 0, 0,
                                              DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('NATUREZAOPERACAO').AsString,
                                              DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('NATUREZAOPERACAO').AsString,
                                              DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDLOTE').AsString,
                                              Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                              Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('DESCINVESTIMENTO').AsString),'OPE',
                                              sFlgCustodia,'', True,
                                              DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDCORRETVALORES').AsInteger,
                                              DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                              iIdHistCartInv) then
               Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                      'Dia: ' + DateToStr(dDataProc) + #13 +
                                      'Operação: ' + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
               Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                      'Dia ' + DateToStr(dDataProc) + #13 +
                                      'Investimento ' + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            // Atualizar Custodia
            iIdOperCust := -1;
            if DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('TIPOCUSTODIA').AsString  <> 'N' then
            begin
               iIdOperCust := DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDOPERACAOINVEST').AsInteger;

               if DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDCARTEIRAGERENC').AsInteger = 0 then
               begin
                  if not OperacaoInvest.CadastraCustodia(iIdOperCust) then
                     Raise Exception.Create('Não foi possível Alimentar a Custódia' + #13 +
                                            'Dia: ' + DateToStr(dDataProc) + #13 +
                                            'Operação: ' + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');
                  if iIdOperCust <> -1 then
                     ExecutarQuery(DMRendaVariavel.qryLocalAux,'Update HistCartInv Set HistCartInv.FlgCustodia = NULL '+
                                                               ' Where HistCartInv.IdHistCartInv = '+IntToStr(iIdHistCartInv));
               end;
            end;

            // Despesas da Operação
            // AL_5 - Retirado o With dentro do With de outra query
            OperComum.LimpaParametros(DMRendaVariavel.QryDespesasOperacao);
            DMRendaVariavel.QryDespesasOperacao.ParamByName('IDOPERACAOINVEST').AsInteger := DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDOPERACAOINVEST').AsInteger;
            DMRendaVariavel.QryDespesasOperacao.Open;
            // Faz Todas as Despesas
            while not DMRendaVariavel.QryDespesasOperacao.EOF Do
            begin
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                 DMRendaVariavel.QryDespesasOperacao.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 DMRendaVariavel.QryDespesasOperacao.FieldByName('IDTIPOINVEST').AsInteger,
                                                 DMRendaVariavel.QryDespesasOperacao.FieldByName('IDOPERACAOINVEST').AsInteger, -1,
                                                 DMRendaVariavel.QryDespesasOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                 DMRendaVariavel.QryDespesasOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                 DMRendaVariavel.QryDespesasOperacao.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                 DMRendaVariavel.QryDespesasOperacao.FieldByName('IDDESPOPERINVEST').AsInteger, -1,
                                                 -1, -1,-1,
                                                 DMRendaVariavel.QryDespesasOperacao.FieldByName('DATAOPERACAO').AsDateTime,
                                                 DMRendaVariavel.QryDespesasOperacao.FieldByName('VLRDESPOPER').AsFloat,
                                                 fQtdeOperacao,
                                                 pRPI.VLRCOTAINICART,
                                                 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                 DMRendaVariavel.QryDespesasOperacao.FieldByName('NATOPERDESP').AsString,
                                                 DMRendaVariavel.QryDespesasOperacao.FieldByName('NATUREZAOPERACAO').AsString,
                                                 DMRendaVariavel.QryDespesasOperacao.FieldByName('IDLOTE').AsString,
                                                 Trim(DMRendaVariavel.QryDespesasOperacao.FieldByName('DESCTIPODESPINV').AsString)+' / '+
                                                 Trim(DMRendaVariavel.QryDespesasOperacao.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'DOP','', '', True,
                                                 DMRendaVariavel.QryDespesasOperacao.FieldByName('IDCORRETVALORES').AsInteger,
                                                 DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + DMRendaVariavel.QryDespesasOperacao.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Despesa: ' + Trim(DMRendaVariavel.QryDespesasOperacao.FieldByName('DESCTIPODESPINV').AsString) + #13 +
                                         'Investimento: ' + Trim(DMRendaVariavel.QryDespesasOperacao.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
               DMRendaVariavel.QryDespesasOperacao.Next;
            end;

            DMRendaVariavel.QryDespesasOperacao.Close;

            // Caso Operacao de Venda (NATURMOV = 'D') MArca o Regsitro de Lucro Com Flag (2)
            // Para ser Recalculado
            ExecutaQuery(DMRendaVariavel.qryLocalAux,
                         'UPDATE HISTCARTINV SET HISTCARTINV.FLGCALCSALDO = ''2'' '+
                         'WHERE (HISTCARTINV.TIPMOVCARTINV    = ''LUC'') AND '+
                         '      (HISTCARTINV.IDOPERACAOINVEST = '+ QuotedStr(DMRendaVariavel.qryBuscaBoletaOPE.FieldByName('IDOPERACAOINVEST').AsString)+')');
            DMRendaVariavel.qryLocalAux.Close;
                                     
            // Alimenta os Saldos da Carteira
            OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1);
         end;

         // Proximo Registro
         DMRendaVariavel.qryBuscaBoletaOPE.Next;
      end;
      Result := True;
   finally
      DMRendaVariavel.qryBuscaBoletaOPE.Close;
      DMRendaVariavel.QryBuscaOperPendentes.Close;
      DMRendaVariavel.QryBuscaOperInvestPend.Close;
      DMRendaVariavel.QryDespesasOperacao.Close;
      DMRendaVariavel.qryLocalAux.Close;
   end;
end;
// AL_30 - Fim

// TRC - Tranferência entre Carteiras
function TRendaVariavel.LancaBoletaTRC(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var iTipoOperacao, iIdHistCartInv, iIdHistCartInvOrig, iIdHistCartInvDest, iIdHistCustodiaOrig, iIdHistCustodiaDest,
    //Ricardo
    iSEQBOLETA,
    //AL_150
    iMercadoDest, iMercadoOrig: Integer;
    sTipoOperacao, sBoleta: String;
    fPU, fSaldoAquiPro, fSaldoVariacaoPro, fSaldoIrApuPro, fValorOper: Double;
    CtrlRV: TCtrlRendaVariavel;
    // Variaveis de Contabilização
    iPlano, iPlanilha, iDocumento: Integer;
    wTipoRecDesBol, wMensErro: String;
    bCriaLancto: Boolean;

begin
   try
      //AL_150
      iIdHistCartInvTRC := -1; // Inicializa a variavel global
      Result := False;
      CtrlRV := TCtrlRendaVariavel.Create;
      CtrlRV.InitializeAs(Padroes);
      with DMRendaVariavel, OperComum, OperacaoInvest do
      begin
         sBoleta := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         //AL_120 - Inicio - Novo reprocessamento linear
         LimpaParametros(qryBuscaBoletaTRC);
         qryBuscaBoletaTRC.ParamByName('IDBOLETA').AsString := sBoleta;
         if (iPlanPrev > 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            qryBuscaBoletaTRC.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaTRC.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         //Ricardo Cristiano - 08/12/2011 - N. Sol 170047 -  N. Kintana 1512695        
         //Ricardo Cristiano - 13/07/2009 - N. Sol 121086 -  N. Kintana 578807
//         qryBuscaBoletaTRC.ParamByName('IDCARTEIRAORIG').AsInteger := iCarteiraInvest;
         qryBuscaBoletaTRC.Open;

         //Ricardo Cristiano - 25/07/2011 - N. Sol 156970 -  N. Kintana 1360831
         if (not qryBuscaBoletaTRC.IsEmpty) then
         begin
            iSEQBOLETA := DMRendaVariavel.qryBuscaBoletas.FieldByName('SEQBOLETA').AsInteger;;

            if not RendaVariavel.IncluiRegistros(iInvestimento,
                                                 qryBuscaBoletaTRC.FieldByName('IDCARTEIRADEST').AsInteger,
                                                 iPlanPrev,
                                                 dDataProc, False) then
               raise Exception.Create('Lançamento de operações e atualização de saldo.');

            OperComum.LimpaParametros(DMRendaVariavel.qryBuscaBoletas);
            DMRendaVariavel.qryBuscaBoletas.ParamByName('dDataRef').AsString           := DateToStr(dDataProc);
            DMRendaVariavel.qryBuscaBoletas.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
            DMRendaVariavel.qryBuscaBoletas.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
            DMRendaVariavel.qryBuscaBoletas.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
            DMRendaVariavel.qryBuscaBoletas.Open;
            //RePosiciona no registro original
            DMRendaVariavel.qryBuscaBoletas.Locate('SEQBOLETA',iSEQBOLETA,[]);
         end;

         // Refaz a TRC somente do Investimento que está sendo Relançado e
         //    somente na primeira passagem (São duas Carteiras)
         //    para não duplicar o lançamento
         if (not qryBuscaBoletaTRC.IsEmpty) then
         begin
            if iPlanPrev = 0 then
               iPlanPrev := iPlanPrevCtbPatro;

            //AL_136
            CtrlRV.BuscaSaldoRV.Executa(qryBuscaBoletaTRC.FieldByName('DATAMOVCUSTOD').AsDateTime,
                                        qryBuscaBoletaTRC.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                        qryBuscaBoletaTRC.FieldByName('IDINVESTIMENTO').AsInteger,
                                        qryBuscaBoletaTRC.FieldByName('IDCARTEIRAORIG').AsInteger, -1, High(Integer),
                                        qryBuscaBoletaTRC.FieldByName('IDCUSTODIANTEORIG').AsInteger,
                                        qryBuscaBoletaTRC.FieldByName('IDLOTE').AsString);

            fPU               := OperComum.Round(OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoCusto, CtrlRV.BuscaSaldoRV.SaldoQtdTotal),9);

            fSaldoAquiPro     := OperComum.Round(fPU * qryBuscaBoletaTRC.FieldByName('QUANTIDADE').AsFloat,2);

            fPU               := OperComum.Round(OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoVariacao,CtrlRV.BuscaSaldoRV.SaldoQtdTotal),9);

            fSaldoVariacaoPro := OperComum.Round(fPU * qryBuscaBoletaTRC.FieldByName('QUANTIDADE').AsFloat,2);

            fPU               := OperComum.Round(OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoIRApurado,CtrlRV.BuscaSaldoRV.SaldoQtdTotal),9);

            fSaldoIrApuPro    := OperComum.Round(fPU * qryBuscaBoletaTRC.FieldByName('QUANTIDADE').AsFloat,2);

            fValorOper        := OperComum.Round(OperComum.DivValorZero((qryBuscaBoletaTRC.FieldByName('QUANTIDADE').AsFloat * CtrlRV.BuscaSaldoRV.SaldoVlrTotal),CtrlRV.BuscaSaldoRV.SaldoQtdTotal),2);

            iDocumento := -1;
            if qryBoleta.FieldByName('PLNCODIGO').AsInteger = 0 then
            begin
               iPlano     := -1;
               iPlanilha  := -1;
            end
            else
            begin
               iPlanilha  := qryBoleta.FieldByName('PLNCODIGO').AsInteger;
               iPlano     := qryBoleta.FieldByName('PLANO').AsInteger;
            end;

            //Al_76 - 21/06/2005
            //Caso não seja preenchido trata normal
            //Caso seja preenchido mantem o codigo da operação - CCI
            if qryBuscaBoletaTRC.FieldByName('IDTIPOOPERDEST').IsNull then
            begin
               //Credito na Carteira
               if ((qryBuscaBoletaTRC.FieldByName('IDCARTEIRAORIG').AsInteger = pRPI.IDCARTOPCIND) or
                   (qryBuscaBoletaTRC.FieldByName('IDCARTEIRADEST').AsInteger = pRPI.IDCARTOPCIND)) then
                  iTipoOperacao := -68
               else if ((qryBuscaBoletaTRC.FieldByName('IDCARTEIRAORIG').AsInteger = pRPI.IDCARTEMPACOES) or
                        (qryBuscaBoletaTRC.FieldByName('IDCARTEIRADEST').AsInteger = pRPI.IDCARTEMPACOES)) then
                  iTipoOperacao := -63
               else
                  iTipoOperacao := -4;
            end
            else
               iTipoOperacao := qryBuscaBoletaTRC.FieldByName('IDTIPOOPERDEST').AsInteger;
            //Al_76 - Fim

            dtmOperComum.QryLocal.Close;
            dtmOperComum.QryLocal.Sql.Clear;
            dtmOperComum.QryLocal.Sql.Add('SELECT TP.DESCTIPOOPERACAO FROM TIPOOPERACAO TP ');
            dtmOperComum.QryLocal.Sql.Add('WHERE (TP.IDTIPOINVEST   = 2) AND');
            dtmOperComum.QryLocal.Sql.Add('      (TP.IDTIPOOPERACAO = '+ IntToStr(iTipoOperacao)+')');
            dtmOperComum.QryLocal.Open;
            sTipoOperacao := dtmOperComum.QryLocal.FieldByName('DESCTIPOOPERACAO').AsString;
            dtmOperComum.QryLocal.Close;

            If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                              qryBuscaBoletaTRC.FieldByName('IDINVESTIMENTO').AsInteger,
                                              2, -1, -1, iTipoOperacao,
                                              qryBuscaBoletaTRC.FieldByName('IDCARTEIRADEST').AsInteger,
                                              0, -1, -1,
                                              //AL_148
                                              -1, -1, -1,
                                              qryBuscaBoletaTRC.FieldByName('DATAMOVCUSTOD').AsDateTime,
                                              fValorOper, qryBuscaBoletaTRC.FieldByName('QUANTIDADE').AsFloat,
                                              pRPI.VLRCOTAINICART,
                                              0,0,0,0,0,0,0,0,0,
                                              'A','A', qryBuscaBoletaTRC.FieldByName('IDLOTE').AsString,
                                              Trim(sTipoOperacao)+ ' / '+
                                                   Trim(qryBuscaBoletaTRC.FieldByName('DESCINVESTIMENTO').AsString),
                                              'TRC', '', '', True, -1,
                                              iPlanPrev, iIdHistCartInv) Then
               Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                      'Dia: ' + qryBuscaBoletaTRC.FieldByName('DATAMOVCUSTOD').AsString + #13 +
                                      'Operação: ' + Trim(sTipoOperacao) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaTRC.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaTRC.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRC.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            iIdHistCartInvDest := iIdHistCartInv;

            ExecutaQuery(QryAux,'UPDATE HISTCARTINV SET HISTCARTINV.MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(fSaldoAquiPro))+','+
                                ' HISTCARTINV.VLRVARIACAO = '+TrocaVirgulaPonto(FloatToStr(fSaldoVariacaoPro))+','+
                                ' HISTCARTINV.VLRIRAPU    = '+TrocaVirgulaPonto(FloatToStr(fSaldoIrApuPro))+' '+
                                ' WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv));

            If Not OperComum.AtualizaSaldos(1,-1) Then
               Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                      'Dia ' + qryBuscaBoletaTRC.FieldByName('DATAMOVCUSTOD').AsString + #13 +
                                      'Investimento ' + Trim(qryBuscaBoletaTRC.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaTRC.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRC.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            // AL_5 - 16/06/2004 - Passa a refazer os históricos de Custódia também
            //AL_125
            //AL_132
            OperComum.InsereHistCustodiaDestino(qryBuscaBoletaTRC.FieldByName('IDOPERCUSTODIA').AsInteger,
                                                qryBuscaBoletaTRC.FieldByName('IDMOTIVOBLOQDEST').Asinteger,
                                                qryBuscaBoletaTRC.FieldByName('IDCARTEIRADEST').AsInteger,
                                                qryBuscaBoletaTRC.FieldByName('IDINVESTIMENTO').AsInteger,
                                                qryBuscaBoletaTRC.FieldByName('IDCUSTODIANTEDEST').AsInteger,
                                                ''{sLote},
                                                qryBuscaBoletaTRC.FieldByName('DATAMOVCUSTOD').AsDateTime,
                                                qryBuscaBoletaTRC.FieldByName('QUANTIDADE').AsFloat,
                                                iIdHistCustodiaDest,
                                                iPlanPrev,
                                                qryBuscaBoletaTRC.FieldByName('FLGCONTAINVEST').AsInteger);

            OperacaoInvest.AtualizaSaldosCustodia;
            // AL_5 - 16/06/2004 - Fim

            // AL_120 - Atualiza o Históricos na OperCustodia
            if not OperacaoInvest.AtualizaOperCustodia(qryBuscaBoletaTRC.FieldByName('IDOPERCUSTODIA').AsInteger,
                                                       -1, iIdHistCustodiaDest,
                                                       -1, iIdHistCartInvDest) then
               Raise Exception.Create('Não foi possível atualizar os históricos de destino na operação de custódia' + #13 +
                                      'Dia: ' + qryBuscaBoletaTRC.FieldByName('DATAMOVCUSTOD').AsString + #13 +
                                      'Operação: ' + Trim(sTipoOperacao) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaTRC.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaTRC.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRC.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');


            // AL_120 Capta o Mercado das Carteiras Origem e Destino
            dtmOperComum.QryLocal.Close;
            dtmOperComum.QryLocal.Sql.Clear;
            dtmOperComum.QryLocal.Sql.Add('SELECT CI.IDMERCADO FROM CARTEIRAINVEST CI ');
            dtmOperComum.QryLocal.Sql.Add('WHERE CI.IDCARTEIRAINVEST = '+ qryBuscaBoletaTRC.FieldByName('IDCARTEIRADEST').AsString);
            dtmOperComum.QryLocal.Open;
            iMercadoDest := dtmOperComum.QryLocal.FieldByName('IDMERCADO').AsInteger;
            dtmOperComum.QryLocal.Close;
            dtmOperComum.QryLocal.Sql.Clear;
            dtmOperComum.QryLocal.Sql.Add('SELECT CI.IDMERCADO FROM CARTEIRAINVEST CI ');
            dtmOperComum.QryLocal.Sql.Add('WHERE CI.IDCARTEIRAINVEST = '+ qryBuscaBoletaTRC.FieldByName('IDCARTEIRAORIG').AsString);
            dtmOperComum.QryLocal.Open;
            iMercadoOrig := dtmOperComum.QryLocal.FieldByName('IDMERCADO').AsInteger;
            dtmOperComum.QryLocal.Close;

            // AL_120 - Só contabiliza se as carteiras forem de mercados diferentes e não for Opção de Índice
            if (not ((iTipoOperacao = -68) and (Copy(sBoleta,1,2) = 'OI'))) and
               (iMercadoOrig <> iMercadoDest) then
            begin
               // Limpa a Planilha antiga
               if iPlanilha > 0 then
               begin
                  // Exclui Lançamentos Contábeis da Planilha sem excluir a Planilha
                  //AL_139 - Passa a valer a exclusão em 3 camadas
                  //AL_147
                  if not CtrlInvContab.InvExcluiLanc(iPlanilha, 0, Sistema.UsaPlanoPatro, False) then
                     Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' + IntToStr(iPlanilha));
               end;

               // Contabiliza Acréscimo de Custo e Variação do Acréscimo de Transferência
               OperComum.BuscaFlgContab(iTipoOperacao);

               // AL_120 - Custo e variação - Faz pelas despesas da operação
               wTipoRecDesBol := '';
               //AL_135 - Contabiliza por Plano/Patro
               OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                       qryBuscaBoletaTRC.FieldByName('IDINVESTIMENTO').AsInteger,
                                       iTipoOperacao,
                                       qryBuscaBoletaTRC.FieldByName('IDOPERCUSTODIA').AsInteger {-1},
                                       qryBuscaBoletaTRC.FieldByName('IDEMISSOR').AsInteger,
                                       qryBuscaBoletaTRC.FieldByName('IDCARTEIRADEST').AsInteger,
                                       pRPI.MOECODIGO, '','','','','',
                                       wTipoRecDesBol,
                                       bCriaLancto,
                                       0, fValorOper,
                                       qryBuscaBoletaTRC.FieldByName('DATAMOVCUSTOD').AsDateTime,
                                       qryBuscaBoletaTRC.FieldByName('DATAMOVCUSTOD').AsDateTime,
                                       iPlano,iPlanilha,iDocumento,
                                       wMensErro,'N',False,False, 0, True, iPlanPrev);

               if Trim(wMensErro) <> '' then
                  Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                         'Dia: ' + qryBuscaBoletaTRC.FieldByName('DATAMOVCUSTOD').AsString + #13 +
                                         'Operação: ' + Trim(sTipoOperacao) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaTRC.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaTRC.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRC.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
               // AL_120 - Fim

               //AL_148
               CtrlRV.UpdateBoleta(sBoleta,
                                   ['STATUS', 'PLANO', 'PLNCODIGO'],
                                   ['F', IntToStr(iPlano), IntToStr(iPlanilha)]);
            end;

            //Al_76 - 21/06/2005
            //Baixa da Carteira
            if qryBuscaBoletaTRC.FieldByName('IDTIPOOPERORIG').IsNull then
            begin
               if ((qryBuscaBoletaTRC.FieldByName('IDCARTEIRAORIG').AsInteger = pRPI.IDCARTOPCIND) or
                   (qryBuscaBoletaTRC.FieldByName('IDCARTEIRADEST').AsInteger = pRPI.IDCARTOPCIND)) then
               begin
                  if Abs(iTipoOperacao) > 10000 then
                     iTipoOperacao := -10067
                  else
                     iTipoOperacao := -67
               end
               else
               if ((qryBuscaBoletaTRC.FieldByName('IDCARTEIRAORIG').AsInteger = pRPI.IDCARTEMPACOES) or
                   (qryBuscaBoletaTRC.FieldByName('IDCARTEIRADEST').AsInteger = pRPI.IDCARTEMPACOES)) then
               begin
                  if Abs(iTipoOperacao) > 10000 then
                     iTipoOperacao := -10064
                  else
                     iTipoOperacao := -64
               end
               else
               begin
                  if Abs(iTipoOperacao) > 10000 then
                     iTipoOperacao := -10006
                  else
                     iTipoOperacao := -6;
               end;
            end
            else
               iTipoOperacao := qryBuscaBoletaTRC.FieldByName('IDTIPOOPERORIG').AsInteger;
            //Al_76 - Fim

            With dtmOperComum.QryLocal Do
            begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT TP.DESCTIPOOPERACAO FROM TIPOOPERACAO TP ');
                  Sql.Add('WHERE (TP.IDTIPOINVEST   = 2) AND ');
                  Sql.Add('      (TP.IDTIPOOPERACAO = '+ IntToStr(iTipoOperacao)+')');
              Open;
              sTipoOperacao := FieldByName('DESCTIPOOPERACAO').AsString;
              Close;
            end;

            If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                              qryBuscaBoletaTRC.FieldByName('IDINVESTIMENTO').AsInteger,
                                              2, -1, -1, iTipoOperacao,
                                              qryBuscaBoletaTRC.FieldByName('IDCARTEIRAORIG').AsInteger,
                                              0, -1, -1,
                                              //AL_148
                                              -1, -1, -1, //iPlanilha, iDocumento, iPlano,
                                              qryBuscaBoletaTRC.FieldByName('DATAMOVCUSTOD').AsDateTime,
                                              fValorOper,
                                              qryBuscaBoletaTRC.FieldByName('QUANTIDADE').AsFloat,
                                              pRPI.VLRCOTAINICART, fSaldoVariacaoPro, 0, fSaldoIrApuPro, 0,0,0,0,0,0,
                                              'D','D', qryBuscaBoletaTRC.FieldByName('IDLOTE').AsString,
                                              Trim(sTipoOperacao)+' / '+
                                                   Trim(qryBuscaBoletaTRC.FieldByName('DESCINVESTIMENTO').AsString),
                                              'TRC', '', '', True, -1,
                                              iPlanPrev, iIdHistCartInv) Then
               Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                      'Dia: ' + qryBuscaBoletaTRC.FieldByName('DATAMOVCUSTOD').AsString + #13 +
                                      'Operação: ' + Trim(sTipoOperacao) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaTRC.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaTRC.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRC.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            iIdHistCartInvOrig := iIdHistCartInv;
            // AL_112
            iIdHistCartInvTRC := iIdHistCartInv;

            if not OperComum.AtualizaSaldos(1,-1) then
               //---Renan Cristiano KT 550029 SOL 116866 início.
               //Inclusão das seguintes informaçoes na messagem do sistema: Motivo, Saldo Atual, Qtd. Solicitada.
               Raise Exception.Create('Não foi possível Atualizar o Saldo do dia !' + #13 + #13 +
                                      'Motivo: Saldo Insuficiente' + #13 +
                                      'Data: ' + qryBuscaBoletaTRC.FieldByName('DATAMOVCUSTOD').AsString + #13 +
                                      'Plano/Patro: ' + Trim(qryBuscaBoletaTRC.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'Investimento ' + Trim(qryBuscaBoletaTRC.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaTRC.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Saldo Atual: ' + FormatFloat('##.###,####',(OperComum.GetSaldoEmAtualizaSaldo
                                                                    + qryBuscaBoletaTRC.FieldByName('QUANTIDADE').AsFloat)) + #13 +
                                      'Qtd. Solicitada: ' + FormatFloat('##.###,####',(qryBuscaBoletaTRC.FieldByName('QUANTIDADE').AsFloat)) + #13 + #13 +
                                      'O Reprocessamento será cancelado...');
               //---Renan Cristiano KT 550029 SOL 116866 Fim.

            // AL_5 - 16/06/2004 - Passa a refazer os históricos de Custódia também
            //AL_125
            OperComum.AlteraHistCustodiaOrigem(qryBuscaBoletaTRC.FieldByName('IDOPERCUSTODIA').AsInteger,
                                               qryBuscaBoletaTRC.FieldByName('IDMOTIVOBLOQORIG').Asinteger,
                                               qryBuscaBoletaTRC.FieldByName('IDCARTEIRAORIG').AsInteger,
                                               qryBuscaBoletaTRC.FieldByName('IDINVESTIMENTO').AsInteger,
                                               qryBuscaBoletaTRC.FieldByName('IDCUSTODIANTEORIG').AsInteger,
                                               ''{sLote},
                                               qryBuscaBoletaTRC.FieldByName('DATAMOVCUSTOD').AsDateTime,
                                               qryBuscaBoletaTRC.FieldByName('QUANTIDADE').AsFloat,
                                               iIdHistCustodiaOrig,
                                               iPlanPrev,
                                               qryBuscaBoletaTRC.FieldByName('FLGCONTAINVEST').AsInteger);

            OperacaoInvest.AtualizaSaldosCustodia;


            // AL_120 - Atualiza o Históricos na OperCustodia
            if not OperacaoInvest.AtualizaOperCustodia(qryBuscaBoletaTRC.FieldByName('IDOPERCUSTODIA').AsInteger,
                                                       iIdHistCustodiaOrig, iIdHistCustodiaDest,
                                                       iIdHistCartInvOrig, iIdHistCartInvDest) then
               Raise Exception.Create('Não foi possível atualizar os históricos na operação de custódia' + #13 +
                                      'Dia: ' + qryBuscaBoletaTRC.FieldByName('DATAMOVCUSTOD').AsString + #13 +
                                      'Operação: ' + Trim(sTipoOperacao) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaTRC.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaTRC.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRC.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            // AL_5 - 16/06/2004 - Fim

            // Faz a Contabilização de Toda a Boleta de Transferência da Cesta
            if (((iTipoOperacao = -67)  or
                 (iTipoOperacao = -68)) and (Copy(sBoleta,1,2) = 'OI')) then
               OpcaoIndice.ContabilizaTranfCesta(sBoleta);

         end;
         //AL_120 - Fim
         Result := True;
      end;
   finally
      FreeAndNil(CtrlRV);
   end;
end;

// AL_49 - 17/03/2005
// TCU - Tranferência entre Custodiantes
function TRendaVariavel.LancaBoletaTCU(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var iIdHistCustodiaOrig, iIdHistCustodiaDest: Integer;
    //AL_138
    CtrlRV: TCtrlRendaVariavel;
    fQtdCust: Double;
begin
   with DMRendaVariavel do
   begin
      try
         Result := False;
         OperComum.LimpaParametros(qryBuscaBoletaTCU);
         qryBuscaBoletaTCU.ParamByName('IDBOLETA').AsString := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         qryBuscaBoletaTCU.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            qryBuscaBoletaTCU.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaTCU.Open;
         if (not qryBuscaBoletaTCU.IsEmpty) then
         begin
            //AL_138 - Ini
            CtrlRV := TCtrlRendaVariavel.Create;
            CtrlRV.InitializeAs(Padroes);
            CtrlRV.BuscaSaldoRV.Executa(dDataProc,
                                        qryBuscaBoletaTCU.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                        qryBuscaBoletaTCU.FieldByName('IDINVESTIMENTO').AsInteger,
                                        qryBuscaBoletaTCU.FieldByName('IDCARTEIRAORIG').AsInteger,
                                        0, High(Integer),
                                        qryBuscaBoletaTCU.FieldByName('IDCUSTODIANTEORIG').AsInteger, '',
                                        qryBuscaBoletaTCU.FieldByName('IDMOTIVOBLOQORIG').AsInteger);
            if qryBuscaBoletaTCU.FieldByName('IDMOTIVOBLOQORIG').AsInteger > 0 then
               fQtdCust := CtrlRV.BuscaSaldoRV.SldQtdBloqCustodia
            else
               fQtdCust := CtrlRV.BuscaSaldoRV.SldQtdLibCustodia;

            if fQtdCust < qryBuscaBoletaTCU.FieldByName('QUANTIDADE').AsFloat then
               Raise Exception.Create('Impossível transferir ' + FormatFloat('###,###,###,###,##0', qryBuscaBoletaTCU.FieldByName('QUANTIDADE').AsFloat) + ' ações. Saldo insuficiente' + #13 +
                                      'Dia: ' + qryBuscaBoletaTCU.FieldByName('DATAMOVCUSTOD').AsString + #13 +
                                      'Operação: ' + Trim(qryBuscaBoletaTCU.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaTCU.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaTCU.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTCU.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');
            //AL_138 - Fim
            //AL_125
            OperComum.AlteraHistCustodiaOrigem(qryBuscaBoletaTCU.FieldByName('IDOPERCUSTODIA').AsInteger,
                                               qryBuscaBoletaTCU.FieldByName('IDMOTIVOBLOQORIG').AsInteger,
                                               qryBuscaBoletaTCU.FieldByName('IDCARTEIRAORIG').AsInteger,
                                               qryBuscaBoletaTCU.FieldByName('IDINVESTIMENTO').AsInteger,
                                               qryBuscaBoletaTCU.FieldByName('IDCUSTODIANTEORIG').AsInteger,
                                               ''{sLote},
                                               qryBuscaBoletaTCU.FieldByName('DATAMOVCUSTOD').AsDateTime,
                                               qryBuscaBoletaTCU.FieldByName('QUANTIDADE').AsFloat,
                                               iIdHistCustodiaOrig,
                                               qryBuscaBoletaTCU.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               //AL_138
                                               qryBuscaBoletaTCU.FieldByName('FLGTIPOCONTAORIG').AsInteger);

            OperacaoInvest.AtualizaSaldosCustodia;

            //AL_125
            OperComum.InsereHistCustodiaDestino(qryBuscaBoletaTCU.FieldByName('IDOPERCUSTODIA').AsInteger,
                                                qryBuscaBoletaTCU.FieldByName('IDMOTIVOBLOQDEST').Asinteger,
                                                qryBuscaBoletaTCU.FieldByName('IDCARTEIRADEST').AsInteger,
                                                qryBuscaBoletaTCU.FieldByName('IDINVESTIMENTO').AsInteger,
                                                qryBuscaBoletaTCU.FieldByName('IDCUSTODIANTEDEST').AsInteger,
                                                ''{sLote},
                                                qryBuscaBoletaTCU.FieldByName('DATAMOVCUSTOD').AsDateTime,
                                                qryBuscaBoletaTCU.FieldByName('QUANTIDADE').AsFloat,
                                                iIdHistCustodiaDest,
                                                qryBuscaBoletaTCU.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                //AL_138
                                                qryBuscaBoletaTCU.FieldByName('FLGTIPOCONTADEST').AsInteger);

            OperacaoInvest.AtualizaSaldosCustodia;

            // Altera OperCustodia, gravando os Id's
            if not OperacaoInvest.AtualizaOperCustodia(qryBuscaBoletaTCU.FieldByName('IDOPERCUSTODIA').AsInteger,
                                                       iIdHistCustodiaOrig,iIdHistCustodiaDest, -1,-1) then
               Raise Exception.Create('Não foi possível atualizar os históricos na operação de custódia' + #13 +
                                      'Dia: ' + qryBuscaBoletaTCU.FieldByName('DATAMOVCUSTOD').AsString + #13 +
                                      'Operação: ' + Trim(qryBuscaBoletaTCU.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaTCU.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaTCU.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTCU.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');
         end;
         Result := True;
      finally
         qryBuscaBoletaTCU.Close;
         //AL_138
         FreeAndNil(CtrlRV)
      end;
   end;
end;
// AL_49 - Fim

function TRendaVariavel.LancaBoletaTCG(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var iPlano, iPlanilha, iDocumento, iIdCarteiraXEvento: Integer;
    fCotacao, fValorOper, fValorOperAnt: Double;
begin
   with DMRendaVariavel  do
   begin
      try
         Result := False;
         OperComum.LimpaParametros(qryBuscaBoletaTCG);
         qryBuscaBoletaTCG.ParamByName('NUMDOCUMENTO').AsString := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         qryBuscaBoletaTCG.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            qryBuscaBoletaTCG.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaTCG.Open;
         While Not qryBuscaBoletaTCG.Eof Do
         begin
            if iPlanPrev <= 0 then
               iPlanPrev := qryBuscaBoletaTCG.FieldByName('IDPLANPREVCTBPATR').AsInteger;

            //AL_27 - 06/12/2004
            fCotacao   := OperComum.BuscaCotacaoAcao(qryBuscaBoletaTCG.FieldByName('IDINVESTIMENTO').AsInteger,
                                                     qryBuscaBoletaTCG.FieldByName('DATAOPERACAO').AsDateTime,True);

            fValorOper := qryBuscaBoletaTCG.FieldByName('QTDEOPERACAO').AsFloat * fCotacao;

            //AL_28 - 06/12/2004
            if fValorOper <> 0 then
               fValorOper := fValorOper - 0.0049;
            //AL_28 - Fim

            // Alimenta Carteira
            If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                              qryBuscaBoletaTCG.FieldByName('IDINVESTIMENTO').AsInteger,
                                              2,
                                              qryBuscaBoletaTCG.FieldByName('IDOPERACAOINVEST').AsInteger,
                                              -1,
                                              qryBuscaBoletaTCG.FieldByName('IDTIPOOPERACAO').AsInteger,
                                              qryBuscaBoletaTCG.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                              qryBuscaBoletaTCG.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                              -1, -1, -1{iPlanilha}, -1{iDocumento}, -1{iPlano},
                                              qryBuscaBoletaTCG.FieldByName('DATAOPERACAO').AsDateTime,
                                              fValorOper,
                                              qryBuscaBoletaTCG.FieldByName('QTDEOPERACAO').AsFloat,
                                              pRPI.VLRCOTAINICART,
                                              0, 0, 0, 0, 0, 0, 0, 0, 0,
                                              qryBuscaBoletaTCG.FieldByName('NATUREZAOPERACAO').AsString,
                                              qryBuscaBoletaTCG.FieldByName('NATUREZAOPERACAO').AsString,
                                              qryBuscaBoletaTCG.FieldByName('IDLOTE').AsString,
                                              Trim(qryBuscaBoletaTCG.FieldByName('DESCTIPOOPERACAO').AsString)+ ' / ' +
                                                   Trim(qryBuscaBoletaTCG.FieldByName('DESCINVESTIMENTO').AsString),
                                             'TCG', '', '', True,
                                             -1, iPlanPrev, iIdHistCartInv) Then
               Raise Exception.Create('Não foi possível alimentar a Carteira Gerencial, '#13+
                                      'Dia: ' + qryBuscaBoletaTCG.FieldByName('DATAOPERACAO').AsString + #13 +
                                      'Operação: ' + Trim(qryBuscaBoletaTCG.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaTCG.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaTCG.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTCG.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');
            //AL_27 - FIM

            if Not OperComum.AtualizaSaldos(1,-1) then
               Raise Exception.Create('Não foi possível Atualizar o Saldo' + #13+
                                      'Dia: ' + qryBuscaBoletaTCG.FieldByName('DATAOPERACAO').AsString + #13 +
                                      'Operação: ' + Trim(qryBuscaBoletaTCG.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaTCG.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaTCG.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTCG.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            fValorOperAnt := qryBuscaBoletaTCG.FieldByName('QTDEOPERACAO').AsFloat * fCotacao;

            //AL_28 - 06/12/2004
            if fValorOperAnt <> 0 then
               fValorOperAnt := fValorOperAnt - 0.0049;
            //AL_28 - Fim

            iIdCarteiraXEvento  := CotaComum.BuscaEventoPorTpOper(
                                             qryBuscaBoletaTCG.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             qryBuscaBoletaTCG.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                             qryBuscaBoletaTCG.FieldByName('IDTIPOOPERACAO').AsInteger);

            If iIdCarteiraXEvento = 0 Then
               Raise Exception.Create('Não foi encontrado o evento de Caixa/Cota para a Carteira Gerencial' + #13+
                                      'Dia: ' + qryBuscaBoletaTCG.FieldByName('DATAOPERACAO').AsString + #13 +
                                      'Operação: ' + Trim(qryBuscaBoletaTCG.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaTCG.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaTCG.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTCG.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            If Not ProvisaoComum.GravaProvisao(qryBuscaBoletaTCG.FieldByName('DATAVENCOPER').AsDateTime,
                                               qryBuscaBoletaTCG.FieldByName('DATAVENCOPER').AsDateTime,
                                               qryBuscaBoletaTCG.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                               qryBuscaBoletaTCG.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                               iIdCarteiraXEvento,
                                               qryBuscaBoletaTCG.FieldByName('IDOPERACAOINVEST').AsInteger,
                                               0, 0,
                                               fValorOperAnt) Then
               Raise Exception.Create('Não foi possível gravar o evento de Caixa' + #13+
                                      'Dia: ' + qryBuscaBoletaTCG.FieldByName('DATAVENCOPER').AsString + #13 +
                                      'Operação: ' + Trim(qryBuscaBoletaTCG.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaTCG.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaTCG.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTCG.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            qryBuscaBoletaTCG.Next;
         end;
         Result := True;
      finally
         qryBuscaBoletaTCG.Close;
      end;
   end;
end;

// Al_24 - 01/12/2004
function TRendaVariavel.LancaBoletaDTA(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var fPU: Double;
    iIdHistCartInv, wIdForCli, iPlano, iPlanilha, iDocumento, iIdCarteiraXEvento: Integer;
    wTipoRecDesBol, wMensErro: String;
    bCriaLancto: Boolean;
begin
   with DMRendaVariavel do
   begin
      try
         Result := False;
         OperComum.LimpaParametros(qryBuscaBoletaDTA);
         qryBuscaBoletaDTA.ParamByName('IDBOLETA').AsString           := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         qryBuscaBoletaDTA.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
         qryBuscaBoletaDTA.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataProc);
         qryBuscaBoletaDTA.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            qryBuscaBoletaDTA.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaDTA.Open;

         fPU  := 0;
         // AL_98

         while not qryBuscaBoletaDTA.Eof do
         begin
            // Refaz o HISTCARTINV
            if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                              qryBuscaBoletaDTA.FieldByName('IDINVESTIMENTO').AsInteger, 2,
                                              qryBuscaBoletaDTA.FieldByName('IDOPERACAOINVEST').AsInteger, -1,
                                              qryBuscaBoletaDTA.FieldByName('IDTIPOOPERACAO').AsInteger,
                                              qryBuscaBoletaDTA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                              qryBuscaBoletaDTA.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                              -1, -1, -1, -1, -1,
                                              qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsDateTime,
                                              qryBuscaBoletaDTA.FieldByName('VLROPERACAO').AsFloat,
                                              qryBuscaBoletaDTA.FieldByName('QTDEOPERACAO').AsFloat,
                                              pRPI.VLRCOTAINICART, 0, 0, 0,
                                              qryBuscaBoletaDTA.FieldByName('VLRIR').AsFloat,
                                              0, 0, 0, 0, 0,
                                              qryBuscaBoletaDTA.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                                              qryBuscaBoletaDTA.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                              qryBuscaBoletaDTA.FieldByName('IDLOTE').AsString,
                                              'ANUNCIO DE PROVENTOS / '+
                                              Trim(qryBuscaBoletaDTA.FieldByName('DESCTIPOOPERACAO').AsString)+ ' - ' +
                                                   Trim(qryBuscaBoletaDTA.FieldByName('DESCINVESTIMENTO').AsString),
                                              'OPE', '1', '', True, -1,
                                              qryBuscaBoletaDTA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                              iIdHistCartInv) then
               Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                      'Dia: ' + qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsString + #13 +
                                      'Operação: ' + 'ANUNCIO DE ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaDTA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
               Raise Exception.Create('Não foi possível Atualizar o Saldo' + #13 +
                                      'Dia: ' + qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsString + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaDTA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            //Al_47 - 09/03/2005
            If (qryBuscaBoletaDTA.FieldByName('IDCARTEIRAGERENC').IsNull) Then
            begin
               // AL_121 - Ini - Não compila Anúncio de Multa
               if qryBuscaBoletaDTA.FieldByName('IDTIPOOPERACAOAGE').AsInteger <> pRPI.IDTIPOOPERDIRMUL then
               begin
                  //AL_14 - 09/09/2004 Implementação da contabilização
                  FazQuery(qryLocalAux,
                           ' SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, INV.IDTIPOINVEST, '+
                           '         INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AXB.QTDELOTE '+
                           ' FROM INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB  '+
                           ' WHERE (INV.IDINVESTIMENTO = '+QuotedStr(qryBuscaBoletaDTA.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
                           '       (INV.IDINVESTIMENTO = ACA.IDACAO) AND '+
                           '       (INV.IDINVESTIMENTO = AXB.IDACAO) ');

                  // Parametro para Contabilidade e CAP/CAR
                  wTipoRecDesBol := '';
                  bCriaLancto    := True;
                  wIdForCli      := -1;
                  wMensErro      := '';

                  // AL_71
                  iPlano     := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger);
                  iPlanilha  := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger);
                  iDocumento := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger);

                  //AL_25 - 01/12/2004
                  //AL_135 - Contabiliza por Plano/Patro
                  OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                          qryBuscaBoletaDTA.FieldByName('IDINVESTIMENTO').AsInteger,
                                          qryBuscaBoletaDTA.FieldByname('IDTIPOOPERACAO').AsInteger,
                                          qryBuscaBoletaDTA.FieldByname('IDOPERACAOINVEST').AsInteger,
                                          wIdForCli,
                                          qryBuscaBoletaDTA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                          'ANUNCIO DE PROVENTOS / '+
                                          qryBuscaBoletaDTA.FieldByName('DESCTIPOOPERACAO').AsString + ' - ' +
                                             qryBuscaBoletaDTA.FieldByName('DESCINVESTIMENTO').AsString,
                                          '', '',
                                          qryBuscaBoletaDTA.FieldByName('NUMDOCUMENTO').AsString,
                                          qryBuscaBoletaDTA.FieldByName('RECPAG').AsString,
                                          wTipoRecDesBol, bCriaLancto,
                                          qryBuscaBoletaDTA.FieldByName('VLROPERACAO').AsFloat,
                                          qryBuscaBoletaDTA.FieldByName('VLROPERACAO').AsFloat,
                                       //Ricardo Cristiano - 11/07/2011 - N. Sol 161307 -  N. Kintana 1358862
                                          qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsDateTime,
//Ricardo Cristiano - 24/06/2011 - N. Sol 158095/5342 -  N. Kintana 1331759
                                       //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
//                                          OperComum.RetornaDtContabDivBonif(qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsDateTime,
//                                                                            qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsDateTime,
//                                                                            qryBuscaBoletaDTA.FieldByName('DATAAGE').AsDateTime),
                                          qryBuscaBoletaDTA.FieldByName('DATAVENCOPER').AsDateTime,
                                          iPlano, iPlanilha, iDocumento, wMensErro, 'N', False, False, 0, True,
                                          qryBuscaBoletaDTA.FieldByName('IDPLANPREVCTBPATR').AsInteger);

                  if Trim(wMensErro) <> '' then
                     Raise Exception.Create('Não foi possível Contabilizar' + #13 +
                                            'Dia: ' + qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + 'ANUNCIO DE ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDTA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  //Al_52 - 29/03/2005
                  // Atualiza a Boleta com a Planilha
                  dtmOperComum.qryLocal.Close;
                  dtmOperComum.qryLocal.SQL.Clear;
                  dtmOperComum.qryLocal.SQL.Add(' UPDATE BOLETA SET ');
                  if iPlano    > 0 then
                     dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ')
                  else
                     dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = NULL,');
                  if iPlanilha > 0 then
                     dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilha)) + ' ')
                  else
                     dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = NULL ');
                  dtmOperComum.qryLocal.SQL.Add('WHERE BOLETA.IDBOLETA = ' + QuotedStr(DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString) + ' ');
                  dtmOperComum.qryLocal.ExecSQL;
                  //Al_52 - Fim
               end;
               //AL_121 - Fim
            end
            //AL_98
            //Al_95 - 26/09/2005
            Else If (Not qryBuscaBoletaDTA.FieldByName('IDCARTEIRAGERENC').IsNull) Then
            begin
               iIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(
                                                qryBuscaBoletaDTA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                qryBuscaBoletaDTA.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                qryBuscaBoletaDTA.FieldByname('IDTIPOOPERACAO').AsInteger);

               //AL_58 - 13/04/2005
               If abs(iIdCarteiraXEvento) > 0 Then
               begin
                  // AL_71
                  If Not ProvisaoComum.GravaProvisao(qryBuscaBoletaDTA.FieldByName('DATAVENCOPER').AsDateTime,
                                                     qryBuscaBoletaDTA.FieldByName('DATAVENCOPER').AsDateTime,
                                                     qryBuscaBoletaDTA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                     qryBuscaBoletaDTA.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                     iIdCarteiraXEvento,
                                                     qryBuscaBoletaDTA.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                     qryBuscaBoletaDTA.FieldByName('IDOPERACAODIREITO').AsInteger,
                                                     qryBuscaBoletaDTA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                     qryBuscaBoletaDTA.FieldByName('VLROPERACAO').AsFloat) Then
                     Raise Exception.Create('Não foi possível gravar os eventos de provisão' + #13 +
                                            'Dia: ' + qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + 'ANUNCIO DE ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDTA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');
               end;
               //AL_58 - Fim
            end;
            //Al_47 - Fim
            //Percorre query Origem - Para Dividendo pode ser mais de 1
            // Proximo Registro
            qryBuscaBoletaDTA.Next;
         end;
         Result := True;
      finally
         qryBuscaBoletaDTA.Close;
      end;
   end;
end;
// Al_24 - Fim

function TRendaVariavel.LancaBoletaDTO(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var wTipoRecDesBol, wMensErro: String;
    bCriaLancto: Boolean;
    wIdForCli, iPlano, iPlanilha, iDocumento, iTipoOperacao, wIdCarteiraXEvento: Integer;
    fVlrContabilizar: Double;
    fSaldoCaixa: Currency;
begin
   with DMRendaVariavel do
   begin
      try
         Result := False;
         //AL_23 - 01/12/2004
         OperComum.LimpaParametros(qryBuscaBoletaDTO);
         qryBuscaBoletaDTO.ParamByName('IDBOLETA').AsString  := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         qryBuscaBoletaDTO.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
         qryBuscaBoletaDTO.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataProc);
         qryBuscaBoletaDTO.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            qryBuscaBoletaDTO.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaDTO.Open;

         while not qryBuscaBoletaDTO.Eof do
         begin
            // Refaz o HISTCARTINV
            if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                              qryBuscaBoletaDTO.FieldByName('IDINVESTIMENTO').AsInteger, 2,
                                              qryBuscaBoletaDTO.FieldByName('IDOPERACAOINVEST').AsInteger, -1,
                                              qryBuscaBoletaDTO.FieldByName('IDTIPOOPERACAO').AsInteger,
                                              qryBuscaBoletaDTO.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                              qryBuscaBoletaDTO.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                              -1, -1, -1, -1, -1,
                                              qryBuscaBoletaDTO.FieldByName('DATAOPERACAO').AsDateTime,
                                              qryBuscaBoletaDTO.FieldByName('VLROPERACAO').AsFloat,
                                              qryBuscaBoletaDTO.FieldByName('QTDEOPERACAO').AsFloat,
                                              pRPI.VLRCOTAINICART, 0, 0, 0,
                                              qryBuscaBoletaDTO.FieldByName('VLRIR').AsFloat,
                                              0, 0, 0, 0, 0,
                                              qryBuscaBoletaDTO.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                                              qryBuscaBoletaDTO.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                              qryBuscaBoletaDTO.FieldByName('IDLOTE').AsString,
                                              Trim(qryBuscaBoletaDTO.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                                   Trim(qryBuscaBoletaDTO.FieldByName('DESCINVESTIMENTO').AsString),
                                              'OPE', '1', '', True, -1,
                                              qryBuscaBoletaDTO.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                              iIdHistCartInv) then
               Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                      'Dia: ' + qryBuscaBoletaDTO.FieldByName('DATAOPERACAO').AsString + #13 +
                                      'Operação: ' + Trim(qryBuscaBoletaDTO.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaDTO.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaDTO.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTO.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
               Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                      'Dia: ' + qryBuscaBoletaDTO.FieldByName('DATAOPERACAO').AsString + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaDTO.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaDTO.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTO.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            //AL_14 - 09/09/2004 Implementação da contabilização
            FazQuery(qryLocalAux,
                     ' SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, INV.IDTIPOINVEST, '+
                     '         INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AXB.QTDELOTE '+
                     ' FROM INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB  '+
                     ' WHERE (INV.IDINVESTIMENTO = '+QuotedStr(qryBuscaBoletaDTO.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
                     '       (INV.IDINVESTIMENTO = ACA.IDACAO) AND '+
                     '       (INV.IDINVESTIMENTO = AXB.IDACAO) ');

            // Parametro para Contabilidade e CAP/CAR
            wTipoRecDesBol := '';
            bCriaLancto    := True;
            wIdForCli      := -1;
            wMensErro      := '';

            // AL_71
            iPlano     := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger);
            iPlanilha  := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger);
            iDocumento := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger);

            //AL_21
            If qryBuscaBoletaDTO.FieldByName('IDCARTEIRAGERENC').IsNull Then
            begin
               //AL_117 - Ini
               //AL_121 - Inicio - Não contabiliza o anúncio de Multa mas contabiliza a Multa em si
               if (qryBuscaBoletaDTO.FieldByName('IDTIPOOPERACAO').AsInteger = pRPI.IDTIPOOPERDIRDIV) or
                  (qryBuscaBoletaDTO.FieldByName('IDTIPOOPERACAO').AsInteger = pRPI.IDTIPOOPERDIRDIV + 10000)  or
                  (qryBuscaBoletaDTO.FieldByName('IDTIPOOPERACAO').AsInteger = pRPI.IDTIPOOPERDIRJUR) or
                  (qryBuscaBoletaDTO.FieldByName('IDTIPOOPERACAO').AsInteger = pRPI.IDTIPOOPERDIRJUR + 10000)  then
               begin
                  fVlrContabilizar := qryBuscaBoletaDTO.FieldByName('VLROPERACAOOM').AsFloat;
                  iTipoOperacao := OperComum.IIF(qryBuscaBoletaDTO.FieldByName('VLROPERACAOOM').AsFloat >= 0, -148, -147);
               end
               else
               if (qryBuscaBoletaDTO.FieldByName('IDTIPOOPERACAO').AsInteger = pRPI.IDTIPOOPERDIRMUL) or
                  (qryBuscaBoletaDTO.FieldByName('IDTIPOOPERACAO').AsInteger = pRPI.IDTIPOOPERDIRMUL + 10000)  then
               begin
                  fVlrContabilizar := qryBuscaBoletaDTO.FieldByName('VLROPERACAO').AsFloat;
                  iTipoOperacao := qryBuscaBoletaDTO.FieldByName('IDTIPOOPERACAO').AsInteger;
               end
               else
               begin
                  if (qryBuscaBoletaDTO.FieldByName('IDTIPOOPERACAOAGE').AsInteger = pRPI.IDTIPOOPERDIRMUL) or
                     (qryBuscaBoletaDTO.FieldByName('IDTIPOOPERACAOAGE').AsInteger = pRPI.IDTIPOOPERDIRMUL + 10000)  then
                     fVlrContabilizar := 0
                  else
                     fVlrContabilizar := qryBuscaBoletaDTO.FieldByName('VLROPERACAO').AsFloat;
                  iTipoOperacao := qryBuscaBoletaDTO.FieldByName('IDTIPOOPERACAO').AsInteger;
               end;
               // AL_121 - Fim

               //AL_25 - 01/12/2004
               //AL_135 - Contabiliza por Plano/Patro
               OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                       qryBuscaBoletaDTO.FieldByName('IDINVESTIMENTO').AsInteger,
                                       iTipoOperacao,
                                       qryBuscaBoletaDTO.FieldByname('IDOPERACAOINVEST').AsInteger,
                                       wIdForCli,
                                       qryBuscaBoletaDTO.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                       qryBuscaBoletaDTO.FieldByName('DESCTIPOOPERACAO').AsString + ' / ' +
                                          qryBuscaBoletaDTO.FieldByName('DESCINVESTIMENTO').AsString,
                                       '', '',
                                       qryBuscaBoletaDTO.FieldByName('NUMDOCUMENTO').AsString,
                                       qryBuscaBoletaDTO.FieldByName('RECPAG').AsString,
                                       wTipoRecDesBol, bCriaLancto,
                                       0,  // Não refaz o financeiro nunca, só o contábil
                                       fVlrContabilizar,
                                       //Ricardo Cristiano - 11/07/2011 - N. Sol 161307 -  N. Kintana 1358862
                                       qryBuscaBoletaDTO.FieldByName('DATAOPERACAO').AsDateTime,
//Ricardo Cristiano - 24/06/2011 - N. Sol 158095/5342 -  N. Kintana 1331759
                                       //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
//                                       OperComum.RetornaDtContabDivBonif(qryBuscaBoletaDTO.FieldByName('DATAOPERACAO').AsDateTime,
//                                                                         qryBuscaBoletaDTO.FieldByName('DATAOPERACAO').AsDateTime,
//                                                                         qryBuscaBoletaDTO.FieldByName('DATAAGE').AsDateTime),
                                       qryBuscaBoletaDTO.FieldByName('DATAVENCOPER').AsDateTime,
                                       iPlano, iPlanilha, iDocumento, wMensErro, 'N', False, False, 0, True,
                                       qryBuscaBoletaDTO.FieldByName('IDPLANPREVCTBPATR').AsInteger);

               if Trim(wMensErro) <> '' then
                  Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                         'Dia: ' + qryBuscaBoletaDTO.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaDTO.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDTO.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDTO.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTO.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
               //AL_117 - Fim

               //AL_130 - Ini - Contabilização da Remuneração
               if qryBuscaBoletaDTO.FieldByName('VLRREMUNERACAO').AsFloat > 0 then
               begin
                  //AL_135 - Contabiliza por Plano/Patro
                  OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                          qryBuscaBoletaDTO.FieldByName('IDINVESTIMENTO').AsInteger,
                                          -148, // Sempre Ganho de Capital
                                          qryBuscaBoletaDTO.FieldByname('IDOPERACAOINVEST').AsInteger,
                                          wIdForCli,
                                          qryBuscaBoletaDTO.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                          '', '',
                                          qryBuscaBoletaDTO.FieldByName('DESCTIPOOPERACAO').AsString + ' - Remuneração - ' +
                                             qryBuscaBoletaDTO.FieldByName('DESCINVESTIMENTO').AsString,
                                          qryBuscaBoletaDTO.FieldByName('NUMDOCUMENTO').AsString,
                                          qryBuscaBoletaDTO.FieldByName('RECPAG').AsString,
                                          wTipoRecDesBol, bCriaLancto,
                                          0,  // Não refaz o financeiro nunca, só o contábil
                                          qryBuscaBoletaDTO.FieldByName('VLRREMUNERACAO').AsFloat,
                                          qryBuscaBoletaDTO.FieldByName('DATAOPERACAO').AsDateTime,
                                          qryBuscaBoletaDTO.FieldByName('DATAVENCOPER').AsDateTime,
                                          iPlano, iPlanilha, iDocumento, wMensErro, 'N', False, False, 0, True,
                                          qryBuscaBoletaDTO.FieldByName('IDPLANPREVCTBPATR').AsInteger);

                  if Trim(wMensErro) <> '' then
                  Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                         'Dia: ' + qryBuscaBoletaDTO.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Operação: Remuneração' + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDTO.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDTO.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTO.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
               end;
               // AL_130 - Fim

               //Al_52 - 29/03/2005
               // Atualiza a Boleta com a Planilha
               dtmOperComum.qryLocal.Close;
               dtmOperComum.qryLocal.SQL.Clear;
               dtmOperComum.qryLocal.SQL.Add(' UPDATE BOLETA SET ');
               if iPlano    > 0 then
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ')
               else
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = NULL,');
               if iPlanilha > 0 then
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilha)) + ' ')
               else
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = NULL ');
               dtmOperComum.qryLocal.SQL.Add('WHERE BOLETA.IDBOLETA = ' + QuotedStr(DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString) + ' ');
               dtmOperComum.qryLocal.ExecSQL;
               //AL_14 - FIM
               //Al_52 - Fim
            end;

            //Al_58 - 13/04/2005
            //AL_7 - 24/06/2004
            If (not qryBuscaBoletaDTO.FieldByName('IDCARTEIRAGERENC').IsNull) Then
            begin
               wIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(qryBuscaBoletaDTO.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                    qryBuscaBoletaDTO.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                                    qryBuscaBoletaDTO.FieldByName('IDTIPOOPERACAO').AsInteger);

               if abs(wIdCarteiraXEvento) > 0 then
               begin
                  fSaldoCaixa := CaixaComum.BuscaSaldoCaixa(qryBuscaBoletaDTO.FieldByName('DATAOPERACAO').AsDateTime,
                                                            qryBuscaBoletaDTO.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                            qryBuscaBoletaDTO.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                            iPlanPrev, 'OPE');

                  if not CaixaComum.GravaEventosCaixa(qryBuscaBoletaDTO.FieldByName('DATAOPERACAO').AsDateTime, iPlanPrev,
                                                      qryBuscaBoletaDTO.FieldByName('IDTIPOOPERACAO').AsInteger, 0,
                                                      qryBuscaBoletaDTO.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                      qryBuscaBoletaDTO.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                      qryBuscaBoletaDTO.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                      qryBuscaBoletaDTO.FieldByName('IDOPERACAODIREITO').AsInteger,
                                                      qryBuscaBoletaDTO.FieldByName('DESCINVESTIMENTO').AsString,
                                                      qryBuscaBoletaDTO.FieldByName('VLROPERACAO').AsFloat,
                                                      fSaldoCaixa) Then
                     Raise Exception.Create('Não foi possível gravar os Eventos de Caixa' + #13 +
                                            'Dia: ' + qryBuscaBoletaDTO.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Evento: ' + Trim(qryBuscaBoletaDTO.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDTO.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDTO.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTO.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');
               end;
            end;
            //Al_58 - fim

            // Proximo Registro
            qryBuscaBoletaDTO.Next;
         end;
         Result := True;
      finally
         qryBuscaBoletaDTO.Close;
      end;
   end;
end;

// Al_98 - Cancelamento de Dividendo
function TRendaVariavel.LancaBoletaDTC(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var fPU: Double;
    iIdHistCartInv, wIdForCli, iPlano, iPlanilha, iDocumento, iIdCarteiraXEvento: Integer;
    wTipoRecDesBol, wMensErro: String;
    bCriaLancto:Boolean;
begin
   with DMRendaVariavel do
   begin
      try
         Result := False;
         OperComum.LimpaParametros(qryBuscaBoletaDTA);
         qryBuscaBoletaDTA.ParamByName('IDBOLETA').AsString           := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         qryBuscaBoletaDTA.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
         qryBuscaBoletaDTA.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataProc);
         qryBuscaBoletaDTA.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            qryBuscaBoletaDTA.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaDTA.Open;

         fPU  := 0;

         while not qryBuscaBoletaDTA.Eof do
         begin
            // Refaz o HISTCARTINV
            if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                              qryBuscaBoletaDTA.FieldByName('IDINVESTIMENTO').AsInteger, 2,
                                              qryBuscaBoletaDTA.FieldByName('IDOPERACAOINVEST').AsInteger, -1,
                                              qryBuscaBoletaDTA.FieldByName('IDTIPOOPERACAO').AsInteger,
                                              qryBuscaBoletaDTA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                              qryBuscaBoletaDTA.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                              -1, -1, -1, -1, -1,
                                              qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsDateTime,
                                              qryBuscaBoletaDTA.FieldByName('VLROPERACAO').AsFloat,
                                              qryBuscaBoletaDTA.FieldByName('QTDEOPERACAO').AsFloat,
                                              pRPI.VLRCOTAINICART, 0, 0, 0,
                                              qryBuscaBoletaDTA.FieldByName('VLRIR').AsFloat,
                                              0, 0, 0, 0, 0,
                                              qryBuscaBoletaDTA.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                                              qryBuscaBoletaDTA.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                              qryBuscaBoletaDTA.FieldByName('IDLOTE').AsString,
                                              Trim(qryBuscaBoletaDTA.FieldByName('DESCTIPOOPERACAO').AsString)+ ' / ' +
                                                   Trim(qryBuscaBoletaDTA.FieldByName('DESCINVESTIMENTO').AsString),
                                              'OPE', '1', '', True, -1,
                                              qryBuscaBoletaDTA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                              iIdHistCartInv) then
               Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                      'Dia: ' + qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsString + #13 +
                                      'Operação: ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaDTA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
               Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                      'Dia: ' + qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsString + #13 +
                                      'Operação: ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaDTA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            If (qryBuscaBoletaDTA.FieldByName('IDCARTEIRAGERENC').IsNull) Then
            begin
               FazQuery(qryLocalAux,
                        ' SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, INV.IDTIPOINVEST, '+
                        '         INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AXB.QTDELOTE '+
                        ' FROM INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB  '+
                        ' WHERE (INV.IDINVESTIMENTO = '+QuotedStr(qryBuscaBoletaDTA.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
                        '       (INV.IDINVESTIMENTO = ACA.IDACAO) AND '+
                        '       (INV.IDINVESTIMENTO = AXB.IDACAO) ');

               // Parametro para Contabilidade e CAP/CAR
               wTipoRecDesBol := '';
               bCriaLancto    := True;
               wIdForCli      := -1;
               wMensErro      := '';

               // AL_71
               iPlano     := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger);
               iPlanilha  := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger);
               iDocumento := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger);

               //AL_25 - 01/12/2004
               //AL_135 - Contabiliza por Plano/Patro
               OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                       qryBuscaBoletaDTA.FieldByName('IDINVESTIMENTO').AsInteger,
                                       qryBuscaBoletaDTA.FieldByname('IDTIPOOPERACAO').AsInteger,
                                       qryBuscaBoletaDTA.FieldByname('IDOPERACAOINVEST').AsInteger,
                                       wIdForCli,
                                       qryBuscaBoletaDTA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                       qryBuscaBoletaDTA.FieldByName('DESCTIPOOPERACAO').AsString + ' - ' +
                                          qryBuscaBoletaDTA.FieldByName('DESCINVESTIMENTO').AsString,
                                       '', '',
                                       qryBuscaBoletaDTA.FieldByName('NUMDOCUMENTO').AsString,
                                       qryBuscaBoletaDTA.FieldByName('RECPAG').AsString,
                                       wTipoRecDesBol, bCriaLancto,
                                       qryBuscaBoletaDTA.FieldByName('VLROPERACAO').AsFloat,
                                       qryBuscaBoletaDTA.FieldByName('VLROPERACAO').AsFloat,
                                       //Ricardo Cristiano - 11/07/2011 - N. Sol 161307 -  N. Kintana 1358862
                                       qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsDateTime,
//Ricardo Cristiano - 24/06/2011 - N. Sol 158095/5342 -  N. Kintana 1331759
                                       //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
//                                       OperComum.RetornaDtContabDivBonif(qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsDateTime,
//                                                                         qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsDateTime,
//                                                                         qryBuscaBoletaDTA.FieldByName('DATAAGE').AsDateTime),
                                       qryBuscaBoletaDTA.FieldByName('DATAVENCOPER').AsDateTime,
                                       iPlano, iPlanilha, iDocumento, wMensErro, 'N', False, False, 0, True,
                                       qryBuscaBoletaDTA.FieldByName('IDPLANPREVCTBPATR').AsInteger);

               if Trim(wMensErro) <> '' then
                  Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                         'Dia: ' + qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDTA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               // Atualiza a Boleta com a Planilha
               dtmOperComum.qryLocal.Close;
               dtmOperComum.qryLocal.SQL.Clear;
               dtmOperComum.qryLocal.SQL.Add(' UPDATE BOLETA SET ');
               if iPlano    > 0 then
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ')
               else
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = NULL,');
               if iPlanilha > 0 then
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilha)) + ' ')
               else
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = NULL ');
               dtmOperComum.qryLocal.SQL.Add('WHERE BOLETA.IDBOLETA = ' + QuotedStr(DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString) + ' ');
               dtmOperComum.qryLocal.ExecSQL;
            end
            Else If (Not qryBuscaBoletaDTA.FieldByName('IDCARTEIRAGERENC').IsNull) Then
            begin
               iIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(
                                                qryBuscaBoletaDTA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                qryBuscaBoletaDTA.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                qryBuscaBoletaDTA.FieldByname('IDTIPOOPERACAO').AsInteger);

               If abs(iIdCarteiraXEvento) > 0 Then
               begin
                  If Not ProvisaoComum.GravaProvisao(qryBuscaBoletaDTA.FieldByName('DATAVENCOPER').AsDateTime,
                                                     qryBuscaBoletaDTA.FieldByName('DATAVENCOPER').AsDateTime,
                                                     qryBuscaBoletaDTA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                     qryBuscaBoletaDTA.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                     iIdCarteiraXEvento,
                                                     qryBuscaBoletaDTA.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                     qryBuscaBoletaDTA.FieldByName('IDOPERACAODIREITO').AsInteger,
                                                     qryBuscaBoletaDTA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                     qryBuscaBoletaDTA.FieldByName('VLROPERACAO').AsFloat) Then
                     Raise Exception.Create('Não foi possível gravar os eventos de provisão' + #13 +
                                            'Dia: ' + qryBuscaBoletaDTA.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Evento: ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDTA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDTA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');
               end;
            end;
            qryBuscaBoletaDTA.Next;
         end;
         Result := True;
      finally
         qryBuscaBoletaDTA.Close;
      end;
   end;

end;
// Al_98 - Fim

// DTG - Grupamento
function TRendaVariavel.LancaBoletaDTG(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var iIdHistCartInv, iIdOperCust, iIdHistCustodiaOrig: Integer;
    TipoB: String;
begin
   with DMRendaVariavel do
   begin
      try
         Result := False;
         OperComum.LimpaParametros(qryBuscaBoletaDTG);
         qryBuscaBoletaDTG.ParamByName('IDBOLETA').AsString := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         qryBuscaBoletaDTG.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         qryBuscaBoletaDTG.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteiraInvest;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            qryBuscaBoletaDTG.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaDTG.Open;

         while not qryBuscaBoletaDTG.Eof do
         begin
            //Al_80 - 12/07/2005
            if qryBuscaBoletaDTG.FieldByName('ORIGDEST').AsString = 'D' then
            begin
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                                 qryBuscaBoletaDTG.FieldByname('IDMODULO').AsInteger,
                                                 qryBuscaBoletaDTG.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                                 qryBuscaBoletaDTG.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                                 qryBuscaBoletaDTG.FieldByname('IDTIPOOPERACAO').AsInteger,
                                                 qryBuscaBoletaDTG.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                                 qryBuscaBoletaDTG.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryBuscaBoletaDTG.FieldByname('DATAOPERACAO').AsDateTime,
                                                 qryBuscaBoletaDTG.FieldByname('VLROPERACAO').AsFloat,
                                                 qryBuscaBoletaDTG.FieldByname('QTDEOPERACAO').AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                 qryBuscaBoletaDTG.FieldByName('NATUREZAOPERACAO').AsString{Movimento},
                                                 'N'{Operacao},
                                                 qryBuscaBoletaDTG.FieldByname('IDLOTE').AsString,
                                                 Trim(qryBuscaBoletaDTG.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                                      Trim(qryBuscaBoletaDTG.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'OPE', '1', '', True, -1,
                                                 qryBuscaBoletaDTG.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaDTG.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaDTG.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDTG.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDTG.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTG.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                         'Dia: ' + qryBuscaBoletaDTG.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDTG.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDTG.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTG.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               //Al_100 - 05/10/2005
               //Al_86 - 21/07/2005
               //AL_33  - 20/12/2004
               OperComum.LimpaParametros(DMRendaVariavel.QryBuscaHistCPMF);
               QryBuscaHistCPMF.ParamByName('IDHISTCARTINV').AsInteger := iIdHistCartInv;
               QryBuscaHistCPMF.Open;
               If Not QryBuscaHistCPMF.IsEmpty Then
               begin
                  //AL_155

                  OperComum.LimpaParametros(DMRendaVariavel.QryUpdHistCPMF);
                  //AL_97 Ini
                  //AL_155
                  if qryBuscaBoletaDTG.FieldByName('FLGCONTAINVEST').AsInteger = 1 then
                      QryUpdHistCPMF.ParamByName('SALDOQTDECPMF').AsFloat := QryBuscaHistCPMF.FieldByName('SALDOQTDECPMF').AsFloat
                  else
                      QryUpdHistCPMF.ParamByName('SALDOQTDECPMF').AsFloat := qryBuscaBoletaDTG.FieldByname('QTDEOPERACAO').AsFloat;
                  //AL_97 Fim
                  QryUpdHistCPMF.ParamByName('IDHISTCARTINV').AsInteger   := iIdHistCartInv;
                  QryUpdHistCPMF.ExecSql;
                  OperComum.LimpaParametros(DMRendaVariavel.QryUpdHistCPMF);
               end;
               OperComum.LimpaParametros(DMRendaVariavel.QryBuscaHistCPMF);
               //AL_33  - Fim

               //Al_86 - 21/07/2005
               //AL_96 - 27/09/2005
               If (qryBuscaBoletaDTG.FieldByName('IDCARTEIRAGERENC').IsNull) Then
               begin
                  //AL_143 - Ini
                  //Al_79 - 04/07/2005

                  // Tipo de Movimentação de Inicialização de saldo
                  TipoB := 'I';
                  //AL_125
                  // Atualiza Custodia Origem.
                  if not OperacaoInvest.InsereCustodia(qryBuscaBoletaDTG.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                       qryBuscaBoletaDTG.FieldByName('IDINVESTIMENTO').AsInteger,
                                                       qryBuscaBoletaDTG.FieldByName('IDCUSTODIANTE').AsInteger,
                                                       OperComum.IIF(qryBuscaBoletaDTG.FieldByName('IDMOTIVOBLOQDEST').IsNull,-1,qryBuscaBoletaDTG.FieldByName('IDMOTIVOBLOQDEST').AsInteger),
                                                       qryBuscaBoletaDTG.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                       qryBuscaBoletaDTG.FieldByName('IDOPERCUSTODIA').AsInteger, //iIdOperCust,
                                                       qryBuscaBoletaDTG.FieldByName('IDLOTE').AsString,
                                                       TipoB,
                                                       qryBuscaBoletaDTG.FieldByName('DATAOPERACAO').AsDateTime,
                                                       qryBuscaBoletaDTG.FieldByName('QTDEOPERACAO').AsFloat,
                                                       iIdHistCustodiaOrig,
                                                       qryBuscaBoletaDTG.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                       qryBuscaBoletaDTG.FieldByName('FLGCONTAINVEST').AsInteger) then
                     Raise Exception.Create('Não foi possível Alimentar o Histórico da Custódia' + #13 +
                                            'Dia: ' + qryBuscaBoletaDTG.FieldByname('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaDTG.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDTG.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDTG.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTG.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');
                  //AL_143 - Fim

                  OperacaoInvest.AtualizaSaldosCustodia;

                  ExecutarQuery(qryAux,'Update HistCartInv Set HistCartInv.FlgCustodia = NULL '+
                                       ' Where HistCartInv.IdHistCartInv = '+IntToStr(iIdHistCartInv));
               end;
            end;
            qryBuscaBoletaDTG.Next;
         end;
      finally
         qryBuscaBoletaDTG.Close;
         QryOperacaoDireito.Close;
         QryBuscaHistCPMF.Close;
      end;
   end;

end;

//AL_11
//DTS - Direitos que afetam a Quantidade(SUBSCRIÇÃO ...)
function TRendaVariavel.LancaBoletaDTS(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var iIdHistCartInv, iIdOperCust, iIdHistCustodia, wIdForCli, iPlano, iPlanilha, iDocumento, wIdCarteiraXEvento: Integer;
    sTipoCustodia, wTipoRecDesBol, wMensErro: String;
    bCriaLancto: Boolean;
    fSaldoCaixa: Currency;
begin
   try
      Result := False;
      OperComum.LimpaParametros(DMRendaVariavel.qryBuscaBoletaDTS);
      DMRendaVariavel.qryBuscaBoletaDTS.ParamByName('IDBOLETA').AsString  := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
      DMRendaVariavel.qryBuscaBoletaDTS.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
      DMRendaVariavel.qryBuscaBoletaDTS.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteiraInvest;
      if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
         DMRendaVariavel.qryBuscaBoletaDTS.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
      DMRendaVariavel.qryBuscaBoletaDTS.Open;

      while not DMRendaVariavel.qryBuscaBoletaDTS.Eof do
      begin
         //Al_80 - 12/07/2005
         if DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('ORIGDEST').AsString = 'D' then
         begin
            if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                              DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('IDMODULO').AsInteger,
                                              DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                              DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                              DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('IDTIPOOPERACAO').AsInteger,
                                              DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                              DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                              -1, -1, -1, -1, -1,
                                              DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('DATAOPERACAO').AsDateTime,
                                              DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('VLROPERACAO').AsFloat,
                                              DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('QTDEOPERACAO').AsFloat,
                                              pRPI.VLRCOTAINICART,
                                              0, 0, 0, 0, 0, 0, 0, 0, 0,
                                              DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                                              DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                              DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('IDLOTE').AsString,
                                              Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                                   Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCINVESTIMENTO').AsString),
                                              'OPE', '1', '', True, -1,
                                              DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                              iIdHistCartInv) then
               Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                      'Dia: ' + DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('DATAOPERACAO').AsString + #13 +
                                      'Operação: ' + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
               Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                      'Dia: ' + DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('DATAOPERACAO').AsString + #13 +
                                      'Operação: ' + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            //Al_43 - 28/02/2005
            If  DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDCARTEIRAGERENC').IsNull Then
            begin
               //Al_81 - 13/07/2005
               // Relança a Custódia

               //AL_142 - Não pode relançar a operação, relança somente os históricos
               //         Não Lança nenhuma OPERCUSTODIA, somente OPERACAOINVEST (ISMOTIVOBLOQDEST é nulo)
               if (DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDMOTIVOBLOQDEST').IsNull) or
                  (DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDMOTIVOBLOQDEST').AsInteger = -1) then
                  sTipoCustodia := 'C'   //AUMENTA SALDO LIBERADO
               else
                  sTipoCustodia := 'Y';  //AUMENTA SALDO BLOQUEADO
               //AL_142 - Fim

               //AL_125
                if not OperacaoInvest.InsereCustodia(
                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDINVESTIMENTO').AsInteger,
                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDCUSTODIANTE').AsInteger,
                                      //Al_83 - 14/07/2005
                                      OperComum.IIF(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDMOTIVOBLOQDEST').IsNull,-1,
                                                    DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDMOTIVOBLOQDEST').AsInteger),
                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDOPERACAOINVEST').AsInteger,
                                      //AL_142
                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('IDOPERCUSTODIA').AsInteger,
                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDLOTE').AsString,
                                      sTipoCustodia,
                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DATAOPERACAO').AsDateTime,
                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('QTDEOPERACAO').AsFloat,
                                      iIdHistCustodia,
                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDPLANPREVCTBPATR').AsInteger
                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('FLGCONTAINVEST').AsInteger) then
                  Raise Exception.Create('Não foi possível Alimentar o Histórico da Custódia' + #13 +
                                         'Dia: ' + DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
               //Al_81 - Fim
               // Atualizar Custodia
               if not OperacaoInvest.AtualizaSaldosCustodia then
                  Raise Exception.Create('Não foi possível Atualizar o Saldo da Custódia' + #13 +
                                         'Dia: ' + DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               //AL_142 - Passa a utilizar o MOECODIGO  do PRPI (Mais rápido)
               // Parametro para Contabilidade e CAP/CAR
               wTipoRecDesBol := '';
               bCriaLancto    := True;
               wIdForCli      := -1;
               //AL_109 - 28/10/2005
               iPlano         := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger);
               iPlanilha      := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger);
               iDocumento     := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger);
               wMensErro      := '';

               //AL_25 - 01/12/2004
               //AL_135 - Contabiliza por Plano/Patro
               OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                       DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDINVESTIMENTO').AsInteger,
                                       DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('IDTIPOOPERACAO').AsInteger,
                                       DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('IDOPERACAOINVEST').AsInteger,
                                       wIdForCli,
                                       DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       //AL_142 - Passa a utilizar o MOECODIGO  do PRPI (Mais rápido)
                                       pRPI.MOECODIGO, // qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                       '', '', '',
                                       DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('NUMDOCUMENTO').AsString,
                                       DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('RECPAG').AsString,
                                       wTipoRecDesBol, bCriaLancto,
                                       DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('VLROPERACAO').AsFloat,
                                       DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('VLROPERACAO').AsFloat,
                                       DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DATAOPERACAO').AsDateTime,
                                       DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DATAVENCOPER').AsDateTime,
                                       iPlano, iPlanilha, iDocumento, wMensErro, 'N', False, False, 0, True,
                                       DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDPLANPREVCTBPATR').AsInteger);

               if Trim(wMensErro) <> '' then
                  Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                         'Dia: ' + DMRendaVariavel.qryBuscaBoletaDTS.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               //Al_52 - 29/03/2005
               // Atualiza a Boleta com a Planilha
               dtmOperComum.qryLocal.Close;
               dtmOperComum.qryLocal.SQL.Clear;
               dtmOperComum.qryLocal.SQL.Add(' UPDATE BOLETA SET ');
               if iPlano    > 0 then
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ')
               else
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = NULL,');
               if iPlanilha > 0 then
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilha)) + ' ')
               else
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = NULL ');
               dtmOperComum.qryLocal.SQL.Add('WHERE BOLETA.IDBOLETA = ' + QuotedStr(DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString) + ' ');
               dtmOperComum.qryLocal.ExecSQL;
               //AL_14 - FIM
               //Al_52 - Fim

               ExecutarQuery(DMRendaVariavel.QryAux,'Update HistCartInv Set HistCartInv.FlgCustodia = NULL '+
                                                    'Where  HistCartInv.IdHistCartInv = '+IntToStr(iIdHistCartInv));
            end
            //Al_73 - 16/05/2005
            else
            begin
               wIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                    DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                                    DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDTIPOOPERACAO').AsInteger);

               if abs(wIdCarteiraXEvento) > 0 then
               begin
                  fSaldoCaixa := CaixaComum.BuscaSaldoCaixa(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DATAOPERACAO').AsDateTime,
                                                            DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                            DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                            DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDPLANPREVCTBPATR').AsInteger, 'OPE');

                  if not CaixaComum.GravaEventosCaixa(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DATAOPERACAO').AsDateTime,
                                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                      0,
                                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('IDOPERACAODIREITO').AsInteger,
                                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCINVESTIMENTO').AsString,
                                                      DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('VLROPERACAO').AsFloat,
                                                      fSaldoCaixa) Then
                     Raise Exception.Create('Não foi possível gravar os Eventos de Caixa' + #13 +
                                            'Dia: ' + DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Evento: ' + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(DMRendaVariavel.qryBuscaBoletaDTS.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');
               end;
            end;
            //Al_73 - Fim
         end;
         DMRendaVariavel.qryBuscaBoletaDTS.Next;
      end;
      Result := True;
   finally
      DMRendaVariavel.qryBuscaBoletaDTS.Close;
   end;
end;
//AL_11 - Fim


//--------Alterações anteriores na rotina
//AL_12
//AL_14 - 09/09/2004 Implementação da contabilização
//AL_25 - 01/12/2004
//AL_44 - 28/02/2005
//Al_52 - 29/03/2005
//AL_70
//Al_77 - 21/06/2005
//Al_83 - 14/07/2005
//Al_90 - 23/08/2005
//AL_93 - 21/09/2005
//Al_94 - 21/09/2005
//Al_103 - 13/10/2005
//AL_111
//AL_115
//AL_125
//AL_127
// Incorporação / Alteração de Tipo  ---------------------------------------------------------------------------
function TRendaVariavel.LancaBoletaDTI(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var sHistorico, sHistoricoOrig, sHistoricoDest, wTipoRecDesBol, wMensErro, TipoB: String;
    fVlrOperacao, fQtdOperacao: Double;
    //Ricardo Cristiano - 11/08/2011 SOL 163042 - KINTANA 1388966
    iSEQBOLETA,
    iIdHistCartInv, iIdHistCustodia, wIdForCli, iPlano, iPlanilha, iDocumento, iTipoOperacao: Integer;
    bCriaLancto: Boolean;
    //SOL 179205 KTN 1653012 - Otacilio Aquino
    CtrlRV : TCtrlRendaVariavel;

begin
   with DMRendaVariavel do
   begin
      try
         //SOL 179205 KTN 1653012 - Otacilio Aquino
         CtrlRV := TCtrlRendaVariavel.Create;
         CtrlRV.InitializeAs(Padroes);

         Result := False;
         OperComum.LimpaParametros(qryBuscaBoletaDTI);
         //Ricardo Cristiano - 28/09/2009 - N. Sol 124246 -  N. Kintana 630481
         qryBuscaBoletaDTI.ParamByName('DATAOPERACAO').AsString  := DateToStr(dDataProc);
         qryBuscaBoletaDTI.Open;
         while not qryBuscaBoletaDTI.Eof do
         begin
            //Ricardo Cristiano - 11/08/2011 SOL 163042 - KINTANA 1388966
            //Tratamento para fazer antes a carteira empréstimo de ações e o investimento da parte de destino ou origem 
            if FazQuery(QryAux, ' SELECT OE.IDOPEREMPACOESIMPORTA FROM OPEREMPACOESIMPORTA OE '+
                                '  WHERE OE.TIPOMOVIMENTO IN (''2'',''3'')' +
                                '    AND OE.FLGSITUACAOIMPORT = ''2''' +
                                '    AND OE.IDINVESTIMENTO = '+
                                         qryBuscaBoletaDTI.FieldByName('IDINVESTIMENTO').AsString +
                                '    AND OE.IDPLANPREVCTBPATR = '+
                                         qryBuscaBoletaDTI.FieldByName('IDPLANPREVCTBPATR').AsString +
                                '    AND OE.DATAOPERACAO  = TO_DATE('+QuotedStr(DateToStr(dDataProc))+','+QuotedStr('DD/MM/YYYY')+')') then
            begin
               iSEQBOLETA := DMRendaVariavel.qryBuscaBoletas.FieldByName('SEQBOLETA').AsInteger;;

               if not RendaVariavel.IncluiRegistros(qryBuscaBoletaDTI.FieldByName('IDINVESTIMENTO').AsInteger,
                                                    pRPI.IDCARTEMPACOES,
                                                    qryBuscaBoletaDTI.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                    dDataProc, True, False) then
                  raise Exception.Create('Lançamento de operações e atualização de saldo.');

               if ((iInvestimento <> qryBuscaBoletaDTI.FieldByName('IDINVESTIMENTO').AsInteger) and
                   (pRPI.IDCARTEMPACOES <> qryBuscaBoletaDTI.FieldByname('IDCARTEIRAINVEST').AsInteger)) then
               begin
                  if not RendaVariavel.IncluiRegistros(qryBuscaBoletaDTI.FieldByName('IDINVESTIMENTO').AsInteger,
                                                       qryBuscaBoletaDTI.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                                       qryBuscaBoletaDTI.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                       dDataProc, True, False) then
                     raise Exception.Create('Lançamento de operações e atualização de saldo.');
               end;

               OperComum.LimpaParametros(DMRendaVariavel.qryBuscaBoletas);
               DMRendaVariavel.qryBuscaBoletas.ParamByName('dDataRef').AsString           := DateToStr(dDataProc);
               DMRendaVariavel.qryBuscaBoletas.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
               DMRendaVariavel.qryBuscaBoletas.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
               DMRendaVariavel.qryBuscaBoletas.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
               DMRendaVariavel.qryBuscaBoletas.Open;
               //RePosiciona no registro original
               DMRendaVariavel.qryBuscaBoletas.Locate('SEQBOLETA',iSEQBOLETA,[]);
            end;

            sHistorico     := '';
            sHistoricoOrig := '';
            sHistoricoDest := '';

            FazQuery(qryAuxiliar,' SELECT DISTINCT IV.DESCINVESTIMENTO, OP.ORIGDEST '+
                                 ' FROM OPERACAOINVEST OP, INVESTIMENTO IV '+
                                 ' WHERE OP.IDINVESTIMENTO = IV.IDINVESTIMENTO '+
                                 ' AND OP.IDOPERACAODIREITO = '+ qryBuscaBoletaDTI.FieldByName('IDOPERACAODIREITO').AsString +
                                 ' ORDER BY OP.ORIGDEST DESC ');
            if not qryAuxiliar.IsEmpty then
            begin
               qryAuxiliar.First;
               while not qryAuxiliar.EOF do
               begin
                  if qryAuxiliar.FieldByName('ORIGDEST').AsString = 'O' then
                     sHistoricoOrig := qryAuxiliar.FieldByName('DESCINVESTIMENTO').AsString;
                  if qryAuxiliar.FieldByName('ORIGDEST').AsString = 'D' then
                     sHistoricoDest := qryAuxiliar.FieldByName('DESCINVESTIMENTO').AsString;
                  qryAuxiliar.Next;
               end;
            end;
            sHistorico := ' de ' + sHistoricoOrig + ' para ' + sHistoricoDest;

            FazQuery(qryAuxiliar,' SELECT OI.IDINVESTIMENTO FROM OPERACAOINVEST OI WHERE OI.ORIGDEST = ''O'' AND '+
                                 ' OI.IDOPERACAODIREITO = ' + qryBuscaBoletaDTI.FieldByName('IDOPERACAODIREITO').AsString);
            // Quantidade é a informada na Operação
            fQtdOperacao := qryBuscaBoletaDTI.FieldByname('QTDEOPERACAO').AsFloat;

            //Ricardo Cristiano - 17/12/2009 - N. Sol 128205 -  N. Kintana 684349
            if ((pRPI.IDTIPOOPERDIRINC = qryBuscaBoletaDTI.FieldByname('IDTIPOOPERACAO').AsInteger) or
                (pRPI.IDTIPOOPERDIRINC + 10000 = qryBuscaBoletaDTI.FieldByname('IDTIPOOPERACAO').AsInteger)) then
            begin
               //Renan Cristiano - 16/07/2010 - N. Sol 139731 -  N. Kintana 865507 INI.
               // Custo + Variação proporcional (Normal e CCI)
               fVlrOperacao := (qryBuscaBoletaDTI.FieldByname('VLRCUSTOATUAL').AsFloat);// + qryBuscaBoletaDTI.FieldByname('VLRVARIACAOATUAL').AsFloat);

               if fVlrOperacao = 0 then
               //Busca Cotacao do Investimento
               fVlrOperacao  :=  OperComum.Trunca(fQtdOperacao*
                                    OperComum.BuscaCotacaoInvest(qryBuscaBoletaDTI.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                 qryBuscaBoletaDTI.FieldByname('DATAOPERACAO').AsDateTime, True),2);
               //Renan Cristiano - 16/07/2010 - N. Sol 139731 -  N. Kintana 865507 FIM.
            end
            else
              // Custo + Variação proporcional (Normal e CCI)
              fVlrOperacao := (qryBuscaBoletaDTI.FieldByname('VLRCUSTOATUAL').AsFloat + qryBuscaBoletaDTI.FieldByname('VLRVARIACAOATUAL').AsFloat);

            If (qryBuscaBoletaDTI.FieldByName('ORIGDEST').AsString = 'O') Then
            begin
               //SOL 179205 KTN 1653012 - Otacilio Aquino ** INICIO **
               if DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'DTI' Then
               begin
                  //Verifica saldo
                  CtrlRV.BuscaSaldoRV.Executa(qryBuscaBoletaDTI.FieldByname('DATAOPERACAO').AsDateTime,
                                              qryBuscaBoletaDTI.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                              qryBuscaBoletaDTI.FieldByname('IDINVESTIMENTO').AsInteger,
                                              qryBuscaBoletaDTI.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                              qryBuscaBoletaDTI.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                              high(integer), -1, '');

                  if CtrlRV.BuscaSaldoRV.SaldoQtdTotal > 0 then
                  begin
                     if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                                       qryBuscaBoletaDTI.FieldByname('IDMODULO').AsInteger,
                                                       qryBuscaBoletaDTI.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                                       qryBuscaBoletaDTI.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                                       qryBuscaBoletaDTI.FieldByname('IDTIPOOPERACAO').AsInteger,
                                                       qryBuscaBoletaDTI.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                                       qryBuscaBoletaDTI.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                                       -1, -1, -1, -1, -1,
                                                       qryBuscaBoletaDTI.FieldByname('DATAOPERACAO').AsDateTime,
                                                       fVlrOperacao, fQtdOperacao,
                                                       pRPI.VLRCOTAINICART,
                                                        0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                       'D'{Movimento}, 'D'{Operacao},
                                                       qryBuscaBoletaDTI.FieldByname('IDLOTE').AsString,
                                                       Trim(qryBuscaBoletaDTI.FieldByName('DESCTIPOOPERACAO').AsString)+ ' - Origem / '+
                                                            Trim(qryBuscaBoletaDTI.FieldByName('DESCINVESTIMENTO').AsString),
                                                       'OPE', '1', '', True, -1,
                                                       qryBuscaBoletaDTI.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                       iIdHistCartInv) then
                        Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                               'Dia: ' + qryBuscaBoletaDTI.FieldByName('DATAOPERACAO').AsString + #13 +
                                               'Operação: ' + Trim(qryBuscaBoletaDTI.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                               'Investimento: ' + Trim(qryBuscaBoletaDTI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                               'Carteira: '  + Trim(qryBuscaBoletaDTI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                               'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                               'O Processo será Cancelado');

                  end;
               end
               else
               begin
                 //SOL 179205 KTN 1653012 - Otacilio Aquino ** FIM **
                 if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                                   qryBuscaBoletaDTI.FieldByname('IDMODULO').AsInteger,
                                                   qryBuscaBoletaDTI.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                                   qryBuscaBoletaDTI.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                                   qryBuscaBoletaDTI.FieldByname('IDTIPOOPERACAO').AsInteger,
                                                   qryBuscaBoletaDTI.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                                   qryBuscaBoletaDTI.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                                   -1, -1, -1, -1, -1,
                                                   qryBuscaBoletaDTI.FieldByname('DATAOPERACAO').AsDateTime,
                                                   fVlrOperacao, fQtdOperacao,
                                                   pRPI.VLRCOTAINICART,
                                                    0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                   'D'{Movimento}, 'D'{Operacao},
                                                   qryBuscaBoletaDTI.FieldByname('IDLOTE').AsString,
                                                   Trim(qryBuscaBoletaDTI.FieldByName('DESCTIPOOPERACAO').AsString)+ ' - Origem / '+
                                                   Trim(qryBuscaBoletaDTI.FieldByName('DESCINVESTIMENTO').AsString),
                                                   'OPE', '1', '', True, -1,
                                                   qryBuscaBoletaDTI.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                   iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaDTI.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaDTI.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDTI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDTI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
               end;                          
            end
            else
            begin
               //Ricardo Cristiano - 22/10/2009 - N. Sol 125777 -  N. Kintana 652392
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                                 qryBuscaBoletaDTI.FieldByname('IDMODULO').AsInteger,
                                                 qryBuscaBoletaDTI.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                                 qryBuscaBoletaDTI.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                                 qryBuscaBoletaDTI.FieldByname('IDTIPOOPERACAO').AsInteger,
                                                 qryBuscaBoletaDTI.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                                 qryBuscaBoletaDTI.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryBuscaBoletaDTI.FieldByname('DATAOPERACAO').AsDateTime,
                                                 //AL_111
                                                 //Ricardo Cristiano - 22/10/2009 - N. Sol 125777 -  N. Kintana 652392
                                                 //Ricardo Cristiano - 17/12/2009 - N. Sol 128205 -  N. Kintana 684349
                                                 fVlrOperacao, fQtdOperacao,
                                                 pRPI.VLRCOTAINICART,
                                                 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                 'A'{Movimento}, 'A'{Operacao},
                                                 qryBuscaBoletaDTI.FieldByname('IDLOTE').AsString,
                                                 Trim(qryBuscaBoletaDTI.FieldByName('DESCTIPOOPERACAO').AsString)+ ' - Destino / '+
                                                      Trim(qryBuscaBoletaDTI.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'OPE', '1', '', True, -1,
                                                 qryBuscaBoletaDTI.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaDTI.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaDTI.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDTI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDTI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
              
            end;

            //Ricardo Cristiano - 22/10/2009 - N. Sol 125777 -  N. Kintana 652392
            if ((pRPI.IDTIPOOPERDIRALT = qryBuscaBoletaDTI.FieldByname('IDTIPOOPERACAO').AsInteger) or
                (pRPI.IDTIPOOPERDIRALT + 10000 = qryBuscaBoletaDTI.FieldByname('IDTIPOOPERACAO').AsInteger))
              //Ricardo Cristiano - 15/04/2010 - N. Sol 119978/1381 -  N. Kintana 785521
                or
              (((pRPI.IDTIPOOPERDIRINC = qryBuscaBoletaDTI.FieldByname('IDTIPOOPERACAO').AsInteger) or
                (pRPI.IDTIPOOPERDIRINC + 10000 = qryBuscaBoletaDTI.FieldByname('IDTIPOOPERACAO').AsInteger)) and
                (qryBuscaBoletaDTI.FieldByName('ORIGDEST').AsString = 'D')) then
            begin
               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                         'Dia: ' + qryBuscaBoletaDTI.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDTI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDTI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
            end;

            if ((pRPI.IDTIPOOPERDIRINC = qryBuscaBoletaDTI.FieldByname('IDTIPOOPERACAO').AsInteger) or
                (pRPI.IDTIPOOPERDIRINC + 10000 = qryBuscaBoletaDTI.FieldByname('IDTIPOOPERACAO').AsInteger)) then
            begin
               if (qryBuscaBoletaDTI.FieldByName('ORIGDEST').AsString = 'O') Then
               //SOL 179205 KTN 1653012 - Otacilio Aquino ** INICIO **
               begin
                  if CtrlRV.BuscaSaldoRV.SaldoQtdTotal > 0 then
                  begin
                    //SOL 179205 KTN 1653012 - Otacilio Aquino ** FIM **
                    ExecutaQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET HISTCARTINV.MOVIMAQUI = '+ TrocaVirgulaPonto(qryBuscaBoletaDTI.FieldByname('VLRCUSTOATUAL').AsString)+','+
                                                       ' HISTCARTINV.VLRVARIACAO = '+TrocaVirgulaPonto(qryBuscaBoletaDTI.FieldByname('VLRVARIACAOATUAL').AsString)+
                                                       ' WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv));
                    //Renan Cristiano - 16/07/2010 - N. Sol 139731 -  N. Kintana 865507
{                   else if (qryBuscaBoletaDTI.FieldByName('ORIGDEST').AsString = 'D') Then
                    ExecutaQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET HISTCARTINV.MOVIMAQUI = '+ TrocaVirgulaPonto(qryBuscaBoletaDTI.FieldByname('VLRCUSTOATUAL').AsString)+','+
                                                     //Ricardo Cristiano - 17/12/2009 - N. Sol 128205 -  N. Kintana 684349
                                                     ' HISTCARTINV.SALDOAQUI  = '+TrocaVirgulaPonto(qryBuscaBoletaDTI.FieldByname('VLRCUSTOATUAL').AsString)+','+
                                                     //Ricardo Cristiano - 15/04/2010 - N. Sol 119978/1381 -  N. Kintana 785521
//                                                     ' SALDOQTDEINVCART = '+FloatToStr(fQtdOperacao)+','+
                                                     ' HISTCARTINV.VLRVARIACAO = 0 '+
                                                     ' WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv));}
                    //SOL 179205 KTN 1653012 - Otacilio Aquino
                  end;
               end;
            end;

            // Faz Contábil e Custódia
            if qryBuscaBoletaDTI.FieldByName('IDCARTEIRAGERENC').IsNull then
            begin
               FazQuery(qryLocalAux,
                     ' SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, INV.IDTIPOINVEST, '+
                     '         INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AXB.QTDELOTE '+
                     ' FROM INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB  '+
                     ' WHERE (INV.IDINVESTIMENTO = '+QuotedStr(qryBuscaBoletaDTI.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
                     '       (INV.IDINVESTIMENTO = ACA.IDACAO) AND '+
                     '       (INV.IDINVESTIMENTO = AXB.IDACAO) ');

               //Ricardo Cristiano - 22/10/2009 - N. Sol 125777 -  N. Kintana 652392
               if qryBuscaBoletaDTI.FieldByName('ORIGDEST').AsString = 'O' Then
               begin
                  // Parametro para Contabilidade e CAP/CAR
                  wTipoRecDesBol := '';
                  bCriaLancto    := True;
                  wIdForCli      := -1;
                  iPlano         := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger);
                  iPlanilha      := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger);
                  iDocumento     := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger);
                  wMensErro      := '';

                  //AL_135 - Contabiliza por Plano/Patro
                  OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                          qryBuscaBoletaDTI.FieldByName('IDINVESTIMENTO').AsInteger,
                                          qryBuscaBoletaDTI.FieldByname('IDTIPOOPERACAO').AsInteger,
                                          qryBuscaBoletaDTI.FieldByname('IDOPERACAOINVEST').AsInteger,
                                          wIdForCli,
                                          qryBuscaBoletaDTI.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                          '',
                                          '',
                                          sHistorico,
                                          qryBuscaBoletaDTI.FieldByName('NUMDOCUMENTO').AsString,
                                          //qryBuscaBoletaDTI.FieldByName('RECPAG').AsString,
                                          'R',
                                          wTipoRecDesBol, bCriaLancto,
                                          qryBuscaBoletaDTI.FieldByName('VLROPERACAO').AsFloat,
                                          qryBuscaBoletaDTI.FieldByName('VLROPERACAO').AsFloat,
                                          qryBuscaBoletaDTI.FieldByName('DATAOPERACAO').AsDateTime,
                                          qryBuscaBoletaDTI.FieldByName('DATAVENCOPER').AsDateTime,
                                          iPlano, iPlanilha, iDocumento, wMensErro, ' ', False, False, 0, True,
                                          qryBuscaBoletaDTI.FieldByName('IDPLANPREVCTBPATR').AsInteger);

                  if Trim(wMensErro) <> '' then
                     Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                            'Dia: ' + qryBuscaBoletaDTI.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaDTI.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDTI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDTI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  // Atualiza a Boleta com Planilha
                  if iPlanilha > 0 then
                  begin
                     OperComum.LimpaParametros(DMRendaVariavel.qryUpdBoleta);
                     if iPlano  > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('PLANO').AsInteger := iPlano;
                     if iPlanilha  > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('PLNCODIGO').AsInteger := iPlanilha;
                     if iDocumento > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('CODDOCUMENTO').AsInteger := iDocumento;
                     DMRendaVariavel.qryUpdBoleta.ParamByName('IDBOLETA').AsString := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
                     DMRendaVariavel.qryUpdBoleta.ExecSQL;
                  end;
               end;

               //Ricardo Cristiano - 22/10/2009 - N. Sol 125777 -  N. Kintana 652392

               if qryBuscaBoletaDTI.FieldByName('ORIGDEST').AsString = 'D' Then
               begin
                  if qryBuscaBoletaDTI.FieldByName('IDMOTIVOBLOQDEST').AsInteger = -1 then
                     TipoB := 'C'
                  else
                     TipoB := 'Y';  //AUMENTA SALDO BLOQUEADO
               end
               else if qryBuscaBoletaDTI.FieldByName('ORIGDEST').AsString = 'O' Then
               begin
                  if qryBuscaBoletaDTI.FieldByName('IDMOTIVOBLOQDEST').AsInteger = -1 then
                     TipoB := 'V'
                  else
                     TipoB := 'Z';  //DIMINUI SALDO BLOQUEADO
               end;

               //SOL 179205 KTN 1653012 - Otacilio Aquino
               if CtrlRV.BuscaSaldoRV.SaldoQtdTotal > 0 then
               begin
                 if not OperacaoInvest.InsereCustodia(qryBuscaBoletaDTI.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                      qryBuscaBoletaDTI.FieldByName('IDINVESTIMENTO').AsInteger,
                                                      qryBuscaBoletaDTI.FieldByName('IDCUSTODIANTE').AsInteger,
                                                      OperComum.IIF(qryBuscaBoletaDTI.FieldByName('IDMOTIVOBLOQDEST').IsNull,-1,
                                                      qryBuscaBoletaDTI.FieldByName('IDMOTIVOBLOQDEST').AsInteger),
                                                      qryBuscaBoletaDTI.FieldByname('IDOPERACAOINVEST').AsInteger,
                                                      -1,
                                                      qryBuscaBoletaDTI.FieldByName('IDLOTE').AsString,
                                                      TipoB,
                                                      qryBuscaBoletaDTI.FieldByname('DATAOPERACAO').AsDateTime,
                                                      qryBuscaBoletaDTI.FieldByName('QTDEOPERACAO').AsFloat,
                                                      iIdHistCustodia,
                                                      qryBuscaBoletaDTI.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                      qryBuscaBoletaDTI.FieldByName('FLGCONTAINVEST').AsInteger) then
                  Raise Exception.Create('Não foi possível Alimentar o Histórico da Custódia' + #13 +
                                         'Dia: ' + qryBuscaBoletaDTI.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaDTI.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDTI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDTI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

                 OperacaoInvest.AtualizaSaldosCustodia;

                 ExecutarQuery(QryAux,'Update HistCartInv Set HistCartInv.FlgCustodia = NULL '+
                                      ' Where HistCartInv.IdHistCartInv = '+IntToStr(iIdHistCartInv));
               end;
            end;
            qryBuscaBoletaDTI.Next;
         end;

         Result := True;
      finally
         qryBuscaBoletaDTI.Close;
         //SOL 179205 KTN 1653012 - Otacilio Aquino
         FreeAndNil(CtrlRV);
      end;
   end;

end;

//--------Alterações anteriores na rotina
//AL_8 - 28/06/2004
//AL_14 - 09/09/2004 Implementação da contabilização
//AL_25 - 01/12/2004
//Al_52 - 29/03/2005
//Al_65 - 26/04/2005
//Al_66 - 26/04/2005
//Al_69 - 27/04/2005
//Al_77 - 21/06/2005
//Al_80 - 12/07/2005
//Al_104 - 17/10/2005
//Al_105 - 17/10/2005
//AL_109 - 28/10/2005
function TRendaVariavel.LancaBoletaDTB(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var iIdHistCartInv, wIdForCli, iPlano, iPlanilha, iDocumento: Integer;
    wTipoRecDesBol, wMensErro: String;
    bCriaLancto: Boolean;
begin
   with DMRendaVariavel do
   begin
      try
         Result := False;
         OperComum.LimpaParametros(qryBuscaBoletaDTB);
         qryBuscaBoletaDTB.ParamByName('IDBOLETA').AsString  := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         qryBuscaBoletaDTB.ParamByName('IDINVESTIMENTO').AsInteger :=  iInvestimento;
         qryBuscaBoletaDTB.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteiraInvest;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            qryBuscaBoletaDTB.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaDTB.Open;

         while not qryBuscaBoletaDTB.Eof do         
         begin
            if qryBuscaBoletaDTB.FieldByName('ORIGDEST').AsString = 'D' then
            begin
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                                 qryBuscaBoletaDTB.FieldByname('IDMODULO').AsInteger,
                                                 qryBuscaBoletaDTB.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                                 qryBuscaBoletaDTB.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                                 qryBuscaBoletaDTB.FieldByname('IDTIPOOPERACAO').AsInteger,
                                                 qryBuscaBoletaDTB.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                                 qryBuscaBoletaDTB.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 //Ricardo Cristiano - 23/09/2010 - N. Sol 144546 -  N. Kintana 952682
                                                 qryBuscaBoletaDTB.FieldByName('DATAOPERACAO').AsDateTime,
                                                 0,
                                                 qryBuscaBoletaDTB.FieldByname('QTDEOPERACAO').AsFloat,
                                                 pRPI.VLRCOTAINICART, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                 qryBuscaBoletaDTB.FieldByName('NATUREZAOPERACAO').AsString,
                                                 qryBuscaBoletaDTB.FieldByName('NATUREZAOPERACAO').AsString,
                                                 qryBuscaBoletaDTB.FieldByname('IDLOTE').AsString,
                                                 Trim(qryBuscaBoletaDTB.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                                      Trim(qryBuscaBoletaDTB.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'OPE', '1', '', True, -1,
                                                 qryBuscaBoletaDTB.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaDTB.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaDTB.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDTB.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDTB.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTB.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                         'Dia: ' + qryBuscaBoletaDTB.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDTB.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDTB.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTB.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               If (qryBuscaBoletaDTB.FieldByName('IDCARTEIRAGERENC').IsNull) Then
               begin
                  FazQuery(qryLocalAux,
                        ' SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, INV.IDTIPOINVEST, '+
                        '         INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AXB.QTDELOTE '+
                        ' FROM INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB  '+
                        ' WHERE (INV.IDINVESTIMENTO = '+QuotedStr(qryBuscaBoletaDTB.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
                        '       (INV.IDINVESTIMENTO = ACA.IDACAO) AND '+
                        '       (INV.IDINVESTIMENTO = AXB.IDACAO) ');

                  //Parametro para Contabilidade e CAP/CAR
                  wTipoRecDesBol := '';
                  bCriaLancto    := True;
                  wIdForCli      := -1;
                  iPlano         := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger);
                  iPlanilha      := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger);
                  iDocumento     := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger);
                  wMensErro      := '';

                  //AL_135 - Contabiliza por Plano/Patro
                  OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                          qryBuscaBoletaDTB.FieldByName('IDINVESTIMENTO').AsInteger,
                                          qryBuscaBoletaDTB.FieldByname('IDTIPOOPERACAO').AsInteger,
                                          qryBuscaBoletaDTB.FieldByname('IDOPERACAOINVEST').AsInteger,
                                          wIdForCli,
                                          qryBuscaBoletaDTB.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                          '', '', '',
                                          qryBuscaBoletaDTB.FieldByName('NUMDOCUMENTO').AsString,
                                          qryBuscaBoletaDTB.FieldByName('RECPAG').AsString,
                                          wTipoRecDesBol, bCriaLancto,
                                          qryBuscaBoletaDTB.FieldByName('VLROPERACAO').AsFloat,
                                          qryBuscaBoletaDTB.FieldByName('VLROPERACAO').AsFloat,
                                       //Ricardo Cristiano - 11/07/2011 - N. Sol 161307 -  N. Kintana 1358862
                                          qryBuscaBoletaDTB.FieldByName('DATAOPERACAO').AsDateTime,
//Ricardo Cristiano - 24/06/2011 - N. Sol 158095/5342 -  N. Kintana 1331759
                                          //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
//                                          OperComum.RetornaDtContabDivBonif(qryBuscaBoletaDTB.FieldByName('DATAOPERACAO').AsDateTime,
//                                                                            qryBuscaBoletaDTB.FieldByName('DATAOPERACAO').AsDateTime,
//                                                                            qryBuscaBoletaDTB.FieldByName('DATAAGE').AsDateTime),
                                          qryBuscaBoletaDTB.FieldByName('DATAVENCOPER').AsDateTime,
                                          iPlano, iPlanilha, iDocumento, wMensErro, 'N', False, False, 0, True,
                                          qryBuscaBoletaDTB.FieldByName('IDPLANPREVCTBPATR').AsInteger);

                  if Trim(wMensErro) <> '' then
                     Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                            'Dia: ' + qryBuscaBoletaDTB.FieldByname('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaDTB.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDTB.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDTB.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTB.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  // Atualiza a Boleta com a Planilha
                  if ((iPlano > 0) And (iPlanilha > 0)) then
                  begin
                     dtmOperComum.qryLocal.Close;
                     dtmOperComum.qryLocal.SQL.Clear;
                     dtmOperComum.qryLocal.SQL.Add(' UPDATE BOLETA SET ');
                     dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ');
                     dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilha)) + ' ');
                     dtmOperComum.qryLocal.SQL.Add('WHERE BOLETA.IDBOLETA = ' + QuotedStr(DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString) + ' ');
                     dtmOperComum.qryLocal.ExecSQL;
                  end;

                  if not OperacaoInvest.CadastraCustodia(qryBuscaBoletaDTB.FieldByname('IDOPERACAOINVEST').AsInteger) then
                     Raise Exception.Create('Não foi possível Alimentar a Custódia' + #13 +
                                            'Dia: ' + qryBuscaBoletaDTB.FieldByname('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaDTB.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDTB.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDTB.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTB.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  OperacaoInvest.AtualizaSaldosCustodia;

                  ExecutarQuery(QryAux,'Update HistCartInv Set HistCartInv.FlgCustodia = NULL '+
                                       ' Where HistCartInv.IdHistCartInv = '+IntToStr(iIdHistCartInv));
               end;
            end;
            qryBuscaBoletaDTB.Next;
         end;
         Result := True;
      finally
         qryBuscaBoletaDTB.Close;
      end;
   end;

end;

//--------Alterações anteriores na rotina
//AL_13 - 19/08/2004
//AL_34 - 17/12/2004
//Al_77 - 21/06/2005
//Al_83 - 14/07/2005
//Al_84 - 15/07/2005
//Al_110 - 28/11/2005
//AL_125
function TRendaVariavel.LancaBoletaDTD(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var iIdHistCartInv, iIdOperCust, iIdHistCustodiaOrig: Integer;
    TipoB: String;
begin
   with DMRendaVariavel do
   begin
      try
         Result := False;
         OperComum.LimpaParametros(qryBuscaBoletaDTD);
         qryBuscaBoletaDTD.ParamByName('IDBOLETA').AsString  := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         qryBuscaBoletaDTD.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         qryBuscaBoletaDTD.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteiraInvest;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            qryBuscaBoletaDTD.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaDTD.Open;

         while not qryBuscaBoletaDTD.Eof do
         begin
            If (qryBuscaBoletaDTD.FieldByName('ORIGDEST').AsString = 'D')  Then
            begin
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                                 qryBuscaBoletaDTD.FieldByname('IDMODULO').AsInteger,
                                                 qryBuscaBoletaDTD.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                                 qryBuscaBoletaDTD.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                                 qryBuscaBoletaDTD.FieldByname('IDTIPOOPERACAO').AsInteger,
                                                 qryBuscaBoletaDTD.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                                 qryBuscaBoletaDTD.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryBuscaBoletaDTD.FieldByname('DATAOPERACAO').AsDateTime,
                                                 0,
                                                 qryBuscaBoletaDTD.FieldByname('QTDEOPERACAO').AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                  0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                 qryBuscaBoletaDTD.FieldByName('NATUREZAOPERACAO').AsString{Movimento},
                                                 'N'{Operacao},
                                                 qryBuscaBoletaDTD.FieldByname('IDLOTE').AsString,
                                                 Trim(qryBuscaBoletaDTD.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                                      Trim(qryBuscaBoletaDTD.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'OPE', '1', '', True, -1,
                                                 qryBuscaBoletaDTD.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaDTD.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaDTD.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDTD.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDTD.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTD.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                         'Dia: ' + qryBuscaBoletaDTD.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaDTD.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDTD.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDTD.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTD.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               If (qryBuscaBoletaDTD.FieldByName('IDCARTEIRAGERENC').IsNull) Then
               begin
                  iIdOperCust := LeUltRegistro(Nil,'OPERCUSTODIA');
                  //AL_143
                  OperacaoInvest.AlimentaOperCustodia(iIdOperCust, -1, -1,
                                                      -1 {iIdHistCartInv}, -1 {iIdHistCartInv},
                                                      qryBuscaBoletaDTD.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                      qryBuscaBoletaDTD.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                      qryBuscaBoletaDTD.FieldByName('IDINVESTIMENTO').AsInteger,
                                                      qryBuscaBoletaDTD.FieldByName('IDCUSTODIANTE').AsInteger,
                                                      qryBuscaBoletaDTD.FieldByName('IDCUSTODIANTE').AsInteger,
                                                      qryBuscaBoletaDTD.FieldByName('IDMOTIVOBLOQORIG').AsInteger,
                                                      qryBuscaBoletaDTD.FieldByName('IDMOTIVOBLOQDEST').AsInteger,
                                                      qryBuscaBoletaDTD.FieldByName('QTDEOPERACAO').AsFloat,
                                                      qryBuscaBoletaDTD.FieldByName('DATAOPERACAO').AsDateTime,
                                                      qryBuscaBoletaDTD.FieldByName('IDLOTE').AsString,
                                                      DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString,
                                                      qryBuscaBoletaDTD.FieldByName('IDPLANPREVCTBPATR').AsInteger);

                  //Ricardo Cristiano - 07/12/2010 - N. Sol 148852 -  N. Kintana 1054334
                  ExecutarQuery(qryAuxiliar,'UPDATE OPERACAOINVEST ' +
                                            'SET OPERACAOINVEST.IDOPERCUSTODIA = ' + IntToStr(iIdOperCust) + ' ' +
                                            'WHERE OPERACAOINVEST.IDOPERACAOINVEST = ' + qryBuscaBoletaDTD.FieldByname('IDOPERACAOINVEST').AsString);

                  //Ricardo Cristiano - 21/07/2009 - N. Sol 122235 -  N. Kintana 597042
                  TipoB := 'I';

                  // Atualiza Custodia Origem.
                  if not OperacaoInvest.InsereCustodia(qryBuscaBoletaDTD.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                       qryBuscaBoletaDTD.FieldByName('IDINVESTIMENTO').AsInteger,
                                                       qryBuscaBoletaDTD.FieldByName('IDCUSTODIANTE').AsInteger,
                                                       OperComum.IIF(qryBuscaBoletaDTD.FieldByName('IDMOTIVOBLOQDEST').IsNull,-1,
                                                                     qryBuscaBoletaDTD.FieldByName('IDMOTIVOBLOQDEST').AsInteger),
                                                       qryBuscaBoletaDTD.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                       iIdOperCust,
                                                       qryBuscaBoletaDTD.FieldByName('IDLOTE').AsString,
                                                       TipoB,
                                                       qryBuscaBoletaDTD.FieldByName('DATAOPERACAO').AsDateTime,
                                                       qryBuscaBoletaDTD.FieldByName('QTDEOPERACAO').AsFloat,
                                                       iIdHistCustodiaOrig,
                                                       qryBuscaBoletaDTD.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                       qryBuscaBoletaDTD.FieldByName('FLGCONTAINVEST').AsInteger) then
                     Raise Exception.Create('Não foi possível Alimentar o Histórico da Custódia' + #13 +
                                            'Dia: ' + qryBuscaBoletaDTD.FieldByname('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaDTD.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDTD.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDTD.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDTD.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');


                  OperacaoInvest.AtualizaSaldosCustodia;

                  ExecutarQuery(QryAux,'Update HistCartInv Set HistCartInv.FlgCustodia         = NULL '+
                                       ' Where HistCartInv.IdHistCartInv = '+IntToStr(iIdHistCartInv));
               end;
            end;
            qryBuscaBoletaDTD.Next;
         end;
         Result := True;
      finally
         qryBuscaBoletaDTD.Close;
      end;
   end;

end;

//--------Alterações anteriores na rotina
//AL_14 - 09/09/2004 Implementação da contabilização
//AL_16
//AL_25 - 01/12/2004
//Al_52 - 29/03/2005
//Al_62 - 25/04/2005
//AL_64 - 25/04/2005
//Al_77 - 21/06/2005
//AL_109 - 28/10/2005
function TRendaVariavel.LancaBoletaDRS(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
    //AL_153
var iIdInvestOrig, iIdHistCartInv, wIdForCli, iPlano, iPlanilha, iDocumento, iIdCarteiraXEvento: Integer;
    wNaturezaOper, wTipoRecDesBol, wMensErro: String;
    bCriaLancto: Boolean;
    fSaldoCaixa: Currency;
begin
   with DMRendaVariavel do
   begin
      try
         Result := False;
         OperComum.LimpaParametros(qryBuscaBoletaDRS);
         qryBuscaBoletaDRS.ParamByName('IDBOLETA').AsString  := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         qryBuscaBoletaDRS.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         qryBuscaBoletaDRS.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteiraInvest;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            qryBuscaBoletaDRS.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaDRS.Open;

         //AL_153
         iIdInvestOrig := 0;
         if not qryBuscaBoletaDRS.IsEmpty then
         begin
            if FazQuery(qryAux1,'SELECT OXI.IDINVESTIMENTO FROM OPERDIREITOXINV OXI WHERE OXI.ORIGDEST = ''O'' AND '+
                                'OXI.IDOPERACAODIREITO = '+qryBuscaBoletaDRS.FieldByName('IDOPERACAODIREITO').AsString) then
               iIdInvestOrig := qryAux1.FieldByName('IDINVESTIMENTO').AsInteger;

            qryAux1.Close;
         end;

         qryBuscaBoletaDRS.First;

         while not qryBuscaBoletaDRS.Eof do
         begin
            //AL_153
            if qryBuscaBoletaDRS.FieldByname('ORIGDEST').AsString = 'D' then
            begin
               //AL_153
               //AL_159
               wNaturezaOper := 'R';
               if (qryBuscaBoletaDRS.FieldByName('IDINVESTIMENTO').AsInteger = iIdInvestOrig) then
                   wNaturezaOper := qryBuscaBoletaDRS.FieldByName('NATUREZAOPERACAO').AsString;

               //AL_153
               //AL_158
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                                 qryBuscaBoletaDRS.FieldByname('IDMODULO').AsInteger,
                                                 qryBuscaBoletaDRS.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                                 qryBuscaBoletaDRS.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                                 qryBuscaBoletaDRS.FieldByname('IDTIPOOPERACAO').AsInteger,
                                                 qryBuscaBoletaDRS.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                                 qryBuscaBoletaDRS.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryBuscaBoletaDRS.FieldByname('DATAOPERACAO').AsDateTime,
                                                 qryBuscaBoletaDRS.FieldByname('VLROPERACAO').AsFloat,
                                                 0,
                                                 pRPI.VLRCOTAINICART,
                                                 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                 wNaturezaOper{Movimento},
                                                 wNaturezaOper{Operacao},
                                                 qryBuscaBoletaDRS.FieldByname('IDLOTE').AsString,
                                                 Trim(qryBuscaBoletaDRS.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                                      Trim(qryBuscaBoletaDRS.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'OPE', '1', '', True, -1,
                                                 qryBuscaBoletaDRS.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaDRS.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaDRS.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDRS.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDRS.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDRS.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                         'Dia: ' + qryBuscaBoletaDRS.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDRS.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDRS.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDRS.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               If (qryBuscaBoletaDRS.FieldByName('IDCARTEIRAGERENC').IsNull) Then
               begin
                  FazQuery(qryLocalAux,
                           ' SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, INV.IDTIPOINVEST, '+
                           '         INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AXB.QTDELOTE '+
                           ' FROM INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB  '+
                           ' WHERE (INV.IDINVESTIMENTO = '+QuotedStr(qryBuscaBoletaDRS.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
                           '       (INV.IDINVESTIMENTO = ACA.IDACAO) AND '+
                           '       (INV.IDINVESTIMENTO = AXB.IDACAO) ');

                  // Parametro para Contabilidade e CAP/CAR
                  wTipoRecDesBol := '';
                  bCriaLancto    := True;
                  wIdForCli      := -1;
                  iPlano         := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger);
                  iPlanilha      := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger);
                  iDocumento     := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger);
                  wMensErro      := '';

                  //AL_135 - Contabiliza por Plano/Patro
                  OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                          qryBuscaBoletaDRS.FieldByName('IDINVESTIMENTO').AsInteger,
                                          qryBuscaBoletaDRS.FieldByname('IDTIPOOPERACAO').AsInteger,
                                          qryBuscaBoletaDRS.FieldByname('IDOPERACAOINVEST').AsInteger,
                                          wIdForCli,
                                          qryBuscaBoletaDRS.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                          '', '', '',
                                          qryBuscaBoletaDRS.FieldByName('NUMDOCUMENTO').AsString,
                                          qryBuscaBoletaDRS.FieldByName('RECPAG').AsString,
                                          wTipoRecDesBol, bCriaLancto,
                                          qryBuscaBoletaDRS.FieldByName('VLROPERACAO').AsFloat,
                                          qryBuscaBoletaDRS.FieldByName('VLROPERACAO').AsFloat,
                                          qryBuscaBoletaDRS.FieldByName('DATAOPERACAO').AsDateTime,
                                          qryBuscaBoletaDRS.FieldByName('DATAVENCOPER').AsDateTime,
                                          iPlano, iPlanilha, iDocumento, wMensErro, 'N', False, False, 0, True,
                                          qryBuscaBoletaDRS.FieldByName('IDPLANPREVCTBPATR').AsInteger);

                  if Trim(wMensErro) <> '' then
                     Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                            'Dia: ' + qryBuscaBoletaDRS.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaDRS.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDRS.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDRS.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDRS.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  // Atualiza a Boleta com a Planilha
                  dtmOperComum.qryLocal.Close;
                  dtmOperComum.qryLocal.SQL.Clear;
                  dtmOperComum.qryLocal.SQL.Add(' UPDATE BOLETA SET ');
                  if iPlano    > 0 then
                     dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ')
                  else
                     dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = NULL,');
                  if iPlanilha > 0 then
                     dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilha)) + ' ')
                  else
                     dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = NULL ');
                  dtmOperComum.qryLocal.SQL.Add('WHERE BOLETA.IDBOLETA = ' + QuotedStr(DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString) + ' ');
                  dtmOperComum.qryLocal.ExecSQL;
               end;

               if (not qryBuscaBoletaDRS.FieldByName('IDCARTEIRAGERENC').IsNull) Then
               begin
                  iIdCarteiraXEvento  := CotaComum.BuscaEventoPorTpOper(qryBuscaBoletaDRS.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                        qryBuscaBoletaDRS.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                                        qryBuscaBoletaDRS.FieldByname('IDTIPOOPERACAO').AsInteger);

                  If abs(iIdCarteiraXEvento) > 0 Then
                  begin
                     fSaldoCaixa      := CaixaComum.BuscaSaldoCaixa(qryBuscaBoletaDRS.FieldByName('DATAOPERACAO').AsDateTime,
                                                                    qryBuscaBoletaDRS.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                    qryBuscaBoletaDRS.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                                    qryBuscaBoletaDRS.FieldByName('IDPLANPREVCTBPATR').AsInteger, 'OPE');

                     if not CaixaComum.GravaEventosCaixa(qryBuscaBoletaDRS.FieldByName('DATAOPERACAO').AsDateTime,
                                                         qryBuscaBoletaDRS.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                         qryBuscaBoletaDRS.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                         0,
                                                         qryBuscaBoletaDRS.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                         qryBuscaBoletaDRS.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                         qryBuscaBoletaDRS.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                         qryBuscaBoletaDRS.FieldByName('IDOPERACAODIREITO').AsInteger,
                                                         qryBuscaBoletaDRS.FieldByName('DESCINVESTIMENTO').AsString,
                                                         qryBuscaBoletaDRS.FieldByName('VLROPERACAO').AsFloat,
                                                         fSaldoCaixa) Then
                        Raise Exception.Create('Não foi possível gravar os Eventos de Caixa' + #13 +
                                               'Dia: ' + qryBuscaBoletaDRS.FieldByName('DATAOPERACAO').AsString + #13 +
                                               'Evento: ' + Trim(qryBuscaBoletaDRS.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                               'Investimento: ' + Trim(qryBuscaBoletaDRS.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                               'Carteira: '  + Trim(qryBuscaBoletaDRS.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                               'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDRS.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                               'O Processo será Cancelado');
                  end;
               end;
            end;
            qryBuscaBoletaDRS.Next;
         end;
         Result := False;
      finally
         qryBuscaBoletaDRS.Close;
      end;
   end;

end;

//--------Alterações anteriores na rotina
//AL_17 - 15/10/2004
//Al_77 - 21/06/2005
//Al_107 - 18/10/2005
//AL_109 - 28/10/2005
//AL_113
//AL_125
//DCI - CISÃO - Direito que afetam a Quantidade
function TRendaVariavel.LancaBoletaDCI(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var iIdHistCartInv, iIdOperCust, iIdHistCustodiaOrig, wIdForCli, iPlano, iPlanilha, iDocumento: Integer;
    wTipoRecDesBol, wMensErro, TipoB: String;
    bCriaLancto: Boolean;

begin
   with DMRendaVariavel do
   begin
      try
         Result := False;
         OperComum.LimpaParametros(qryBuscaBoletaDCI);
         qryBuscaBoletaDCI.ParamByName('IDBOLETA').AsString  := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         qryBuscaBoletaDCI.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         qryBuscaBoletaDCI.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteiraInvest;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            qryBuscaBoletaDCI.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaDCI.Open;

         while not qryBuscaBoletaDCI.Eof do
         begin
            if (qryBuscaBoletaDCI.FieldByName('ORIGDEST').AsString = 'D') then
            begin
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                                 qryBuscaBoletaDCI.FieldByname('IDMODULO').AsInteger,
                                                 qryBuscaBoletaDCI.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                                 qryBuscaBoletaDCI.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                                 qryBuscaBoletaDCI.FieldByname('IDTIPOOPERACAO').AsInteger,
                                                 qryBuscaBoletaDCI.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                                 qryBuscaBoletaDCI.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryBuscaBoletaDCI.FieldByname('DATAOPERACAO').AsDateTime,
                                                 qryBuscaBoletaDCI.FieldByname('VLROPERACAO').AsFloat,
                                                 qryBuscaBoletaDCI.FieldByname('QTDEOPERACAO').AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                 qryBuscaBoletaDCI.FieldByNAme('NATUREZAOPERACAO').AsString {Movimento},
                                                 qryBuscaBoletaDCI.FieldByNAme('NATUREZAOPERACAO').AsString{Operacao},
                                                 qryBuscaBoletaDCI.FieldByname('IDLOTE').AsString,
                                                 Trim(qryBuscaBoletaDCI.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                                      Trim(qryBuscaBoletaDCI.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'OPE', '', '', True, -1,
                                                 qryBuscaBoletaDCI.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaDCI.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaDCI.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDCI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDCI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDCI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               if (Not (qryBuscaBoletaDCI.FieldByName('IDTIPOOPERACAO').AsInteger IN [pRPI.IDTIPOOPERDIRCIS,pRPI.IDTIPOOPERDIRCIS+10000])) then
               begin
                  if not ExecutaQuery(qryAuxiliar,
                                      'UPDATE HISTCARTINV SET ' +
                                      ' HISTCARTINV.MOVIMAQUI = ' + TrocaVirgulaPonto(FloatToStr(qryBuscaBoletaDCI.FieldByName('VLRCUSTOATUAL').AsFloat))+',' +
                                      ' HISTCARTINV.VLRVARIACAO = ' + TrocaVirgulaPonto(FloatToStr(qryBuscaBoletaDCI.FieldByName('VLRVARIACAOATUAL').AsFloat))+ ' ' +
                                      'WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv)) then
                     Raise Exception.Create('Não foi possível Gravar na Carteira' + #13 +
                                            'Dia: ' + qryBuscaBoletaDCI.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Campos: Saldos de Custo e Variação do Destino' + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDCI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDCI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDCI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

               end;

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                         'Dia: ' + qryBuscaBoletaDCI.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDCI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDCI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDCI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               if (qryBuscaBoletaDCI.FieldByName('IDCARTEIRAGERENC').IsNull) then
               begin
                  FazQuery(qryLocalAux,
                           ' SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, INV.IDTIPOINVEST, '+
                           '         INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AXB.QTDELOTE '+
                           ' FROM INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB  '+
                           ' WHERE (INV.IDINVESTIMENTO = '+QuotedStr(qryBuscaBoletaDCI.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
                           '       (INV.IDINVESTIMENTO = ACA.IDACAO) AND '+
                           '       (INV.IDINVESTIMENTO = AXB.IDACAO) ');

                  // Parametro para Contabilidade e CAP/CAR
                  wTipoRecDesBol := '';
                  bCriaLancto    := True;
                  wIdForCli      := -1;
                  //AL_109 - 28/10/2005
                  iPlano         := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger);
                  iPlanilha      := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger);
                  iDocumento     := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger);
                  wMensErro      := '';

                  iIdOperCust := LeUltRegistro(Nil,'OPERCUSTODIA');

                  if Not OperacaoInvest.AlimentaOperCustodia(iIdOperCust, -1,  -1,
                                                             iIdHistCartInv, iIdHistCartInv,
                                                             qryBuscaBoletaDCI.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                             qryBuscaBoletaDCI.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                             qryBuscaBoletaDCI.FieldByName('IDINVESTIMENTO').AsInteger,
                                                             qryBuscaBoletaDCI.FieldByName('IDCUSTODIANTE').AsInteger,
                                                             qryBuscaBoletaDCI.FieldByName('IDCUSTODIANTE').AsInteger,
                                                             OperComum.IIF(qryBuscaBoletaDCI.FieldByName('IDMOTIVOBLOQORIG').IsNull,-1,
                                                                           qryBuscaBoletaDCI.FieldByName('IDMOTIVOBLOQORIG').AsInteger),
                                                             OperComum.IIF(qryBuscaBoletaDCI.FieldByName('IDMOTIVOBLOQDEST').IsNull,-1,
                                                                           qryBuscaBoletaDCI.FieldByName('IDMOTIVOBLOQDEST').AsInteger),
                                                             qryBuscaBoletaDCI.FieldByName('QTDEOPERACAO').AsFloat,
                                                             qryBuscaBoletaDCI.FieldByName('DATAOPERACAO').AsDateTime,
                                                             qryBuscaBoletaDCI.FieldByName('IDLOTE').AsString,
                                                             DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString,
                                                             qryBuscaBoletaDCI.FieldByName('IDPLANPREVCTBPATR').AsInteger) then
                     Raise Exception.Create('Não foi possível Alimentar a Custódia' + #13 +
                                            'Dia: ' + qryBuscaBoletaDCI.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaDCI.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDCI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDCI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDCI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');


                  ExecutarQuery(QryAux,'UPDATE OPERACAOINVEST SET OPERACAOINVEST.IDOPERCUSTODIA = ' + IntToStr(iIdOperCust) + ' ' +
                                       'WHERE OPERACAOINVEST.IDOPERACAOINVEST = ' + qryBuscaBoletaDCI.FieldByName('IDOPERACAOINVEST').AsString);

                  if (qryBuscaBoletaDCI.FieldByName('IDTIPOOPERACAO').AsInteger IN [pRPI.IDTIPOOPERDIRREE,pRPI.IDTIPOOPERDIRREE+10000]) then
                  begin
                     if qryBuscaBoletaDCI.FieldByName('IDMOTIVOBLOQDEST').AsInteger = -1 then
                        TipoB := 'V'
                     else
                        TipoB := 'Z';  //DIMINUI SALDO BLOQUEADO
                  end
                  else
                  begin
                     if qryBuscaBoletaDCI.FieldByName('IDMOTIVOBLOQDEST').AsInteger = -1 then
                        TipoB := 'C'
                     else
                        TipoB := 'Y';  //AMUMENTA SALDO BLOQUEADO
                  end;

                  if not OperacaoInvest.InsereCustodia(qryBuscaBoletaDCI.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                       qryBuscaBoletaDCI.FieldByName('IDINVESTIMENTO').AsInteger,
                                                       qryBuscaBoletaDCI.FieldByName('IDCUSTODIANTE').AsInteger,
                                                       OperComum.IIF(qryBuscaBoletaDCI.FieldByName('IDMOTIVOBLOQDEST').IsNull,-1,
                                                                     qryBuscaBoletaDCI.FieldByName('IDMOTIVOBLOQDEST').AsInteger),
                                                       qryBuscaBoletaDCI.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                       iIdOperCust,
                                                       qryBuscaBoletaDCI.FieldByName('IDLOTE').AsString,
                                                       TipoB,
                                                       qryBuscaBoletaDCI.FieldByName('DATAOPERACAO').AsDateTime,
                                                       qryBuscaBoletaDCI.FieldByName('QTDEOPERACAO').AsFloat,
                                                       iIdHistCustodiaOrig,
                                                       qryBuscaBoletaDCI.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                       qryBuscaBoletaDCI.FieldByName('FLGCONTAINVEST').AsInteger) then
                     Raise Exception.Create('Não foi possível Alimentar o Histórico da Custódia' + #13 +
                                            'Dia: ' + qryBuscaBoletaDCI.FieldByname('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaDCI.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDCI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDCI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDCI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');


                  OperacaoInvest.AtualizaSaldosCustodia;

                  ExecutarQuery(QryAux,'Update HistCartInv Set HistCartInv.FlgCustodia         = NULL '+
                                       ' Where HistCartInv.IdHistCartInv = '+IntToStr(iIdHistCartInv));

                  //AL_135 - Contabiliza por Plano/Patro
                  if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                             qryBuscaBoletaDCI.FieldByName('IDINVESTIMENTO').AsInteger,
                                             qryBuscaBoletaDCI.FieldByname('IDTIPOOPERACAO').AsInteger,
                                             qryBuscaBoletaDCI.FieldByname('IDOPERACAOINVEST').AsInteger,
                                             wIdForCli,
                                             qryBuscaBoletaDCI.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                             '', '', '', '',
                                             qryBuscaBoletaDCI.FieldByName('NUMDOCUMENTO').AsString,
                                             wTipoRecDesBol, bCriaLancto,
                                             qryBuscaBoletaDCI.FieldByName('VLROPERACAO').AsFloat,
                                             qryBuscaBoletaDCI.FieldByName('VLROPERACAO').AsFloat,
                                             qryBuscaBoletaDCI.FieldByName('DATAOPERACAO').AsDateTime,
                                             qryBuscaBoletaDCI.FieldByName('DATAVENCOPER').AsDateTime,
                                             iPlano, iPlanilha, iDocumento, wMensErro, 'N', False, False, 0, True,
                                             qryBuscaBoletaDCI.FieldByName('IDPLANPREVCTBPATR').AsInteger) <> 0 then
                     Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                            'Dia: ' + qryBuscaBoletaDCI.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaDCI.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDCI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDCI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDCI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  if (iPlanilha > 0) or (iDocumento > 0) then
                  begin
                     dtmOperComum.qryLocal.Close;
                     dtmOperComum.qryLocal.SQL.Clear;
                     //AL_141 - Ini
                     dtmOperComum.qryLocal.SQL.Add(' UPDATE BOLETA SET ');
                     if iPlano    > 0 then
                        dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ')
                     else
                        dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = NULL,');
                     if iPlanilha > 0 then
                        dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilha)) + ', ')
                     else
                        dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = NULL, ');
                     if iDocumento > 0 then
                        dtmOperComum.qryLocal.SQL.Add(' BOLETA.CODDOCUMENTO = ' + QuotedStr(IntToStr(iDocumento)) + ' ')
                     else
                        dtmOperComum.qryLocal.SQL.Add(' BOLETA.CODDOCUMENTO = NULL ');
                     dtmOperComum.qryLocal.SQL.Add('WHERE BOLETA.IDBOLETA = ' + QuotedStr(DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString) + ' ');
                     //AL_141 - Fim
                     dtmOperComum.qryLocal.ExecSQL;
                  end;
               end;
            end;
            qryBuscaBoletaDCI.Next;
         end;
         Result := True;
      finally
         qryBuscaBoletaDCI.Close;
      end;
   end;
end;


//--------Alterações anteriores na rotina
//AL_22 - 25/11/2004
//AL_32 -
//AL_36 -
//Al_77 - 21/06/2005
//Al_83 - 14/07/2005
//AL_100
//AL_101
//AL_116
//AL_125

function TRendaVariavel.LancaBoletaAJQ(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var TipoB, TipoBD: String;
    iIdHistCustodiaOrig, iIdHistCustodiaDest: Integer;
    fPU, fSaldoAquiPro, fSaldoVariacaoPro, fSaldoIrApuPro, fValorOper: Double;
    CtrlRV: TCtrlRendaVariavel;
begin
   with DMRendaVariavel do
   begin
      try
         Result := False;
         CtrlRV := TCtrlRendaVariavel.Create;
         CtrlRV.InitializeAs(Padroes);
         OperComum.LimpaParametros(qryBuscaBoletaAJQ);
         qryBuscaBoletaAJQ.ParamByName('IDBOLETA').AsString           := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         qryBuscaBoletaAJQ.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
         qryBuscaBoletaAJQ.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            qryBuscaBoletaAJQ.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaAJQ.Open;

         while not qryBuscaBoletaAJQ.Eof do
         begin
            TipoB  := '';
            TipoBD := '';
            fPU := 0;
            fSaldoAquiPro := 0;
            fSaldoVariacaoPro := 0;
            fSaldoIrApuPro := 0;
            if qryBuscaBoletaAJQ.FieldByName('TIPREG').AsString = 'C' then
            begin
               if not qryBuscaBoletaAJQ.FieldByName('IDCUSTODIADEST').IsNull then
               begin
                  // Existe Operação Destino
                  if (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -94) or
                     (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -116) or
                     (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -125) then
                  begin
                     // Bloqueia Saldo Liberado
                     TipoB  := 'V';
                     TipoBD := 'Y';
                  end
                  else if (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -93) or
                          (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -115) or
                          (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -124) then
                  begin
                     // Desbloqueia Saldo Liberado
                     TipoB  := 'Z';
                     TipoBD := 'C';
                  end;
               end
               else
               begin
                  if ((qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -94) or
                      (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -116) or
                      (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -125)) and
                     (qryBuscaBoletaAJQ.FieldByName('IDMOTIVOBLOQORIG').AsInteger = -1) then
                     // Diminui Saldo Liberado
                     TipoB := 'V'
                  else
                  if ((qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -94) or
                      (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -116) or
                      (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -125)) and
                          (qryBuscaBoletaAJQ.FieldByName('IDMOTIVOBLOQORIG').AsInteger <> -1) then
                     // Diminui Saldo Bloqueado
                     TipoB := 'Z'
                  else
                  if ((qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -93) or
                      (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -115) or
                      (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -124)) and
                          (qryBuscaBoletaAJQ.FieldByName('IDMOTIVOBLOQORIG').AsInteger = -1) then
                     // Aumenta Saldo Liberado
                     TipoB := 'C'
                  else
                  if ((qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -93) or
                      (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -115) or
                      (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -124)) and
                          (qryBuscaBoletaAJQ.FieldByName('IDMOTIVOBLOQORIG').AsInteger <> -1) then
                     // Aumenta Saldo Bloqueado
                     TipoB := 'Y';
               end;

               // Exclui sempre as custódias por causa das operações de custódia sem carteira
               ExecutaQuery(QryAux,'DECLARE BEGIN '+
                                   'UPDATE OPERCUSTODIA ' +
                                   'SET OPERCUSTODIA.IDCUSTODIADEST = NULL, OPERCUSTODIA.IDCUSTODIAORIG = NULL ' +
                                   'WHERE OPERCUSTODIA.IDBOLETA = ' + QuotedStr(DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString)+'; '+
                                   'DELETE FROM HISTCUSTODIA  ' +
                                   'WHERE IDOPERACAOINVEST IN '+
                                   '         (SELECT OI.IDOPERACAOINVEST' +
                                   '          FROM  OPERACAOINVEST OI ' +
                                   '          WHERE OI.NUMDOCUMENTO = ' + QuotedStr(DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString) + '); '+
                                   'END;');

               // Atualiza Custodia Origem.
               if not OperacaoInvest.InsereCustodia(qryBuscaBoletaAJQ.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                    qryBuscaBoletaAJQ.FieldByName('IDINVESTIMENTO').AsInteger,
                                                    qryBuscaBoletaAJQ.FieldByName('IDCUSTODIANTE').AsInteger,
                                                    OperComum.IIF(qryBuscaBoletaAJQ.FieldByName('IDMOTIVOBLOQORIG').IsNull,-1,
                                                                  qryBuscaBoletaAJQ.FieldByName('IDMOTIVOBLOQORIG').AsInteger),
                                                    qryBuscaBoletaAJQ.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                    -1,
                                                    qryBuscaBoletaAJQ.FieldByName('IDLOTE').AsString,
                                                    TipoB,
                                                    qryBuscaBoletaAJQ.FieldByName('DATAOPERACAO').AsDateTime,
                                                    qryBuscaBoletaAJQ.FieldByName('QUANTIDADE').AsFloat,
                                                    iIdHistCustodiaOrig,
                                                    qryBuscaBoletaAJQ.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                    qryBuscaBoletaAJQ.FieldByName('FLGCONTAINVEST').AsInteger) then
                  Raise Exception.Create('Não foi possível Alimentar a Custódia' + #13 +
                                         'Dia: ' + qryBuscaBoletaAJQ.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Operação: Ajuste de Quantidade na Custódia' + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaAJQ.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaAJQ.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaAJQ.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
               if TipoBD <> '' then
               begin
                  // Atualiza Custodia Origem.
                  if not OperacaoInvest.InsereCustodia(qryBuscaBoletaAJQ.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                       qryBuscaBoletaAJQ.FieldByName('IDINVESTIMENTO').AsInteger,
                                                       qryBuscaBoletaAJQ.FieldByName('IDCUSTODIANTE').AsInteger,
                                                       OperComum.IIF(qryBuscaBoletaAJQ.FieldByName('IDMOTIVOBLOQDEST').IsNull,-1,
                                                                     qryBuscaBoletaAJQ.FieldByName('IDMOTIVOBLOQDEST').AsInteger),
                                                       qryBuscaBoletaAJQ.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                       -1,
                                                       qryBuscaBoletaAJQ.FieldByName('IDLOTE').AsString,
                                                       TipoBD,
                                                       qryBuscaBoletaAJQ.FieldByName('DATAOPERACAO').AsDateTime,
                                                       qryBuscaBoletaAJQ.FieldByName('QUANTIDADE').AsFloat,
                                                       iIdHistCustodiaDest,
                                                       qryBuscaBoletaAJQ.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                       qryBuscaBoletaAJQ.FieldByName('FLGCONTAINVEST').AsInteger) then
                     Raise Exception.Create('Não foi possível Alimentar a Custódia' + #13 +
                                            'Dia: ' + qryBuscaBoletaAJQ.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: Ajuste de Quantidade na Custódia' + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaAJQ.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaAJQ.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaAJQ.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

               end;
               qryAux.SQL.Clear;
               qryAux.SQL.Add('UPDATE OPERCUSTODIA ');
               qryAux.SQL.Add('SET OPERCUSTODIA.IDCUSTODIAORIG    = ' + IntToStr(iIdHistCustodiaOrig));
               if TipoBD <> '' then
                  qryAux.SQL.Add('   ,OPERCUSTODIA.IDCUSTODIADEST = ' + IntToStr(iIdHistCustodiaDest));
               qryAux.SQL.Add('WHERE OPERCUSTODIA.IDOPERCUSTODIA  = ' + qryBuscaBoletaAJQ.FieldByName('IDOPERACAO').AsString);
               qryAux.ExecSQL;

               OperacaoInvest.AtualizaSaldosCustodia;

               ExecutarQuery(QryAux,'Update HistCartInv Set HistCartInv.FlgCustodia         = NULL '+
                                    ' Where HistCartInv.IdHistCartInv = '+IntToStr(iIdHistCartInv));

            end
            else if qryBuscaBoletaAJQTIPREG.AsString = 'H' then
            begin
               CtrlRV.BuscaSaldoRV.Executa(qryBuscaBoletaAJQ.FieldByName('DATAOPERACAO').AsDateTime,
                                           qryBuscaBoletaAJQ.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                           qryBuscaBoletaAJQ.FieldByName('IDINVESTIMENTO').AsInteger,
                                           qryBuscaBoletaAJQ.FieldByName('IDCARTEIRAINVEST').AsInteger, -1, High(Integer),
                                           qryBuscaBoletaAJQ.FieldByName('IDCUSTODIANTEORIG').AsInteger,
                                           qryBuscaBoletaAJQ.FieldByName('IDLOTE').AsString);

               if ((qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -124) or
                   (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger = -125)) then // Ajuste de Qtd sem Ajuste nos Saldos
               begin
                  fSaldoAquiPro     := OperComum.Round(CtrlRV.BuscaSaldoRV.SaldoCusto,2);

                  fSaldoVariacaoPro := OperComum.Round(CtrlRV.BuscaSaldoRV.SaldoVariacao,2);

                  fSaldoIrApuPro    := OperComum.Round(CtrlRV.BuscaSaldoRV.SaldoIRApurado,2);

                  fValorOper :=  0;
               end
               else
               begin
                  fPU               := OperComum.Round(OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoCusto,     CtrlRV.BuscaSaldoRV.SaldoQtdTotal),9);
                  fSaldoAquiPro     := OperComum.Round(fPU * qryBuscaBoletaAJQ.FieldByName('QUANTIDADE').AsFloat,2);

                  fPU               := OperComum.Round(OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoVariacao,  CtrlRV.BuscaSaldoRV.SaldoQtdTotal),9);
                  fSaldoVariacaoPro := OperComum.Round(fPU * qryBuscaBoletaAJQ.FieldByName('QUANTIDADE').AsFloat,2);

                  fPU               := OperComum.Round(OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoIRApurado, CtrlRV.BuscaSaldoRV.SaldoQtdTotal),9);
                  fSaldoIrApuPro    := OperComum.Round(fPU * qryBuscaBoletaAJQ.FieldByName('QUANTIDADE').AsFloat,2);
               end;

               if ((qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger <> -115) or
                   (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger <> -116) or
                   (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger <> -124) or
                   (qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger <> -125)) then
               begin
                  // Refaz o HISTCARTINV
                  if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                                    qryBuscaBoletaAJQ.FieldByName('IDMODULO').AsInteger,
                                                    qryBuscaBoletaAJQ.FieldByName('IDINVESTIMENTO').AsInteger, 2,
                                                    qryBuscaBoletaAJQ.FieldByName('IDOPERACAO').AsInteger, -1,
                                                    qryBuscaBoletaAJQ.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                    qryBuscaBoletaAJQ.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                    qryBuscaBoletaAJQ.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                    -1, -1, -1, -1, -1,
                                                    qryBuscaBoletaAJQ.FieldByName('DATAOPERACAO').AsDateTime,
                                                    qryBuscaBoletaAJQ.FieldByName('VLROPERACAO').AsFloat,
                                                    qryBuscaBoletaAJQ.FieldByName('QUANTIDADE').AsFloat,
                                                    pRPI.VLRCOTAINICART,
                                                    0, 0, CtrlRV.BuscaSaldoRV.SaldoIRProv,
                                                    qryBuscaBoletaAJQ.FieldByName('VLRIR').AsFloat,
                                                    0, 0, 0, 0, 0,
                                                    qryBuscaBoletaAJQ.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                                                    qryBuscaBoletaAJQ.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                                    qryBuscaBoletaAJQ.FieldByName('IDLOTE').AsString,
                                                    Trim(qryBuscaBoletaAJQ.FieldByName('DESCTIPOOPERACAO').AsString) + ' / ' +
                                                         Trim(qryBuscaBoletaAJQ.FieldByName('DESCINVESTIMENTO').AsString),
                                                    'OPE', '1', '', True, -1,
                                                    qryBuscaBoletaAJQ.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                    iIdHistCartInv) then
                     Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                            'Dia: ' + qryBuscaBoletaAJQ.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaAJQ.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaAJQ.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaAJQ.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaAJQ.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  if not ExecutaQuery(dtmOperComum.QryLocal,
                                             'UPDATE HISTCARTINV SET HISTCARTINV.MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(fSaldoAquiPro))+','+
                                             ' HISTCARTINV.VLRVARIACAO = '+TrocaVirgulaPonto(FloatToStr(fSaldoVariacaoPro))+','+
                                             ' HISTCARTINV.VLRIRAPU = '+TrocaVirgulaPonto(FloatToStr(fSaldoIrApuPro))+' '+
                                             ' WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv)) then
                     Raise Exception.Create('Não foi possível Gravar na Carteira' + #13 +
                                            'Dia: ' + qryBuscaBoletaDCI.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Campos: Saldos de Custo e Variação do Destino' + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDCI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDCI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDCI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  // Atualiza o IDHistCartInv na OperCustodia
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add('UPDATE OPERCUSTODIA ');
                  qryAux.SQL.Add('SET OPERCUSTODIA.IDHISTCARTINVORIG = ' + IntToStr(iIdHistCartInv));
                  qryAux.SQL.Add('WHERE IDOPERCUSTODIA IN ');
                  qryAux.SQL.Add('         (SELECT OI.IDOPERCUSTODIA ');
                  qryAux.SQL.Add('          FROM OPERACAOINVEST OI');
                  qryAux.SQL.Add('          WHERE OI.IDOPERACAOINVEST = ' + qryBuscaBoletaAJQ.FieldByName('IDOPERACAO').AsString + ')');
                  qryAux.ExecSQL;

                  if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                     Raise Exception.Create('Não foi possível Atualizar o Saldo' + #13 +
                                            'Dia: ' + qryBuscaBoletaDCI.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDCI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDCI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDCI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');
               end;
            end;
            qryBuscaBoletaAJQ.Next;
         end;
         Result := True;
      finally
         qryBuscaBoletaAJQ.Close;
         FreeAndNil(CtrlRV);
      end;
   end;
end;

//--------Alterações anteriores na rotina
//AL_14 - 09/09/2004 Implementação da contabilização
//AL_42 - 25/02/2005
//Al_52 - 29/03/2005
//Al_77 - 21/06/2005
//Al_82 - 13/07/2005
//Al_83 - 14/07/2005
//Al_87 - 27/07/2005
//AL_91 - Ajuste geral na rotina
//AL_125
function TRendaVariavel.LancaBoletaVSU(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var iIdHistCartInv, iIdHistCustodia, wIdForCli, iPlano, iPlanilha, iDocumento: Integer;
    wTipoRecDesBol, wMensErro: String;
    bCriaLancto: Boolean;
    //Ricardo Cristiano - 27/07/2011 - N. Sol 162070 -  N. Kintana 1373935
    fQtdeInicialInvest : double;
    fValorOperacao: currency;
    CtrlRV: TCtrlRendaVariavel;
begin
   with DMRendaVariavel do
   begin
      try
         //Ricardo Cristiano - 27/07/2011 - N. Sol 162070 -  N. Kintana 1373935
         CtrlRV := TCtrlRendaVariavel.Create;
         CtrlRV.InitializeAs(Padroes);

         Result := False;
         OperComum.LimpaParametros(QryBuscaBoletaVSU);
         QryBuscaBoletaVSU.ParamByName('IDBOLETA').AsString           := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         QryBuscaBoletaVSU.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
         QryBuscaBoletaVSU.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            QryBuscaBoletaVSU.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         QryBuscaBoletaVSU.Open;

         while not QryBuscaBoletaVSU.Eof do
         begin
             //Ricardo Cristiano - 27/07/2011 - N. Sol 162070 -  N. Kintana 1373935
             fQtdeInicialInvest := 0;
             fValorOperacao     := 0;        

             //Ricardo Cristiano - 27/07/2011 - N. Sol 162070 -  N. Kintana 1373935
             CtrlRV.BuscaSaldoRV.Executa(QryBuscaBoletaVSU.FieldByname('DATAOPERACAO').AsDateTime,
                                         QryBuscaBoletaVSU.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                         QryBuscaBoletaVSU.FieldByname('IDINVESTIMENTO').AsInteger,
                                         QryBuscaBoletaVSU.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                         QryBuscaBoletaVSU.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                         high(integer), -1, '');   
             //Ricardo Cristiano - 27/07/2011 - N. Sol 162070 -  N. Kintana 1373935
             fQtdeInicialInvest := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;
             fValorOperacao     := RoundCM(CtrlRV.BuscaSaldoRV.SaldoQtdTotal*
                                (QryBuscaBoletaVSU.FieldByname('VLROPERACAO').AsFloat/QryBuscaBoletaVSU.FieldByname('QTDEOPERACAO').AsFloat),2);

            // Refaz o HISTCARTINV
            if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                              QryBuscaBoletaVSU.FieldByname('IDMODULO').AsInteger,
                                              QryBuscaBoletaVSU.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                              QryBuscaBoletaVSU.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                              QryBuscaBoletaVSU.FieldByname('IDTIPOOPERACAO').AsInteger,
                                              QryBuscaBoletaVSU.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                              QryBuscaBoletaVSU.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                              -1, -1, -1, -1, -1,
                                              QryBuscaBoletaVSU.FieldByname('DATAOPERACAO').AsDateTime,
                                              //Ricardo Cristiano - 27/07/2011 - N. Sol 162070 -  N. Kintana 1373935
                                              fValorOperacao,
                                              fQtdeInicialInvest,
                                              pRPI.VLRCOTAINICART,
                                              0, 0, 0, 0, 0, 0, 0, 0, 0,
                                              'D'{Movimento}, 'D'{Operacao},
                                              QryBuscaBoletaVSU.FieldByname('IDLOTE').AsString,
                                              Trim(QryBuscaBoletaVSU.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                                   Trim(QryBuscaBoletaVSU.FieldByName('DESCINVESTIMENTO').AsString),
                                              'OPE', '', '', True, -1,
                                              QryBuscaBoletaVSU.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                              iIdHistCartInv) then
               Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                      'Dia: ' + QryBuscaBoletaVSU.FieldByname('DATAOPERACAO').AsString + #13 +
                                      'Operação: ' + Trim(QryBuscaBoletaVSU.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(QryBuscaBoletaVSU.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(QryBuscaBoletaVSU.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(QryBuscaBoletaVSU.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
               Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                      'Dia: ' + QryBuscaBoletaVSU.FieldByname('DATAOPERACAO').AsString + #13 +
                                      'Investimento: ' + Trim(QryBuscaBoletaVSU.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(QryBuscaBoletaVSU.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(QryBuscaBoletaVSU.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            if (QryBuscaBoletaVSU.FieldByName('IDCARTEIRAGERENC').IsNull) then
            begin
               if not OperacaoInvest.InsereCustodia(
                                     QryBuscaBoletaVSU.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                     QryBuscaBoletaVSU.FieldByName('IDINVESTIMENTO').AsInteger,
                                     QryBuscaBoletaVSU.FieldByName('IDCUSTODIANTE').AsInteger,
                                     -1,
                                     QryBuscaBoletaVSU.FieldByName('IDOPERACAOINVEST').AsInteger,
                                     -1, //iIdOperCust,
                                     QryBuscaBoletaVSU.FieldByName('IDLOTE').AsString,
                                     'V',
                                     QryBuscaBoletaVSU.FieldByName('DATAOPERACAO').AsDateTime,
                                     //Ricardo Cristiano - 27/07/2011 - N. Sol 162070 -  N. Kintana 1373935
                                     fQtdeInicialInvest,
                                     iIdHistCustodia,
                                     QryBuscaBoletaVSU.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                     QryBuscaBoletaVSU.FieldByName('FLGCONTAINVEST').AsInteger) then
                  Raise Exception.Create('Não foi possível Alimentar o Histórico da Custódia' + #13 +
                                         'Dia: ' + QryBuscaBoletaVSU.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(QryBuscaBoletaVSU.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(QryBuscaBoletaVSU.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(QryBuscaBoletaVSU.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(QryBuscaBoletaVSU.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               // Atualiza Custodia
               OperacaoInvest.AtualizaSaldosCustodia;

               FazQuery(qryLocalAux,
                     ' SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, INV.IDTIPOINVEST, '+
                     '         INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AXB.QTDELOTE '+
                     ' FROM INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB  '+
                     ' WHERE (INV.IDINVESTIMENTO = '+QuotedStr(QryBuscaBoletaVSU.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
                     '       (INV.IDINVESTIMENTO = ACA.IDACAO) AND '+
                     '       (INV.IDINVESTIMENTO = AXB.IDACAO) ');

               // Parametro para Contabilidade e CAP/CAR
               wTipoRecDesBol := '';
               bCriaLancto    := True;
               wIdForCli      := -1;
               iPlano         := -1;
               iPlanilha      := -1;
               iDocumento     := -1;
               wMensErro      := '';
               //AL_135 - Contabiliza por Plano/Patro
               OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                       QryBuscaBoletaVSU.FieldByName('IDINVESTIMENTO').AsInteger,
                                       QryBuscaBoletaVSU.FieldByname('IDTIPOOPERACAO').AsInteger,
                                       QryBuscaBoletaVSU.FieldByname('IDOPERACAOINVEST').AsInteger,
                                       wIdForCli,
                                       QryBuscaBoletaVSU.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                       '', '', '', '',
                                       QryBuscaBoletaVSU.FieldByName('NUMDOCUMENTO').AsString,
                                       wTipoRecDesBol, bCriaLancto,
                                       //Ricardo Cristiano - 27/07/2011 - N. Sol 162070 -  N. Kintana 1373935
                                       fValorOperacao,
                                       fValorOperacao,
                                       QryBuscaBoletaVSU.FieldByName('DATAOPERACAO').AsDateTime,
                                       QryBuscaBoletaVSU.FieldByName('DATAVENCOPER').AsDateTime,
                                       iPlano, iPlanilha, iDocumento, wMensErro, 'N', False, False, 0, True,
                                       QryBuscaBoletaVSU.FieldByName('IDPLANPREVCTBPATR').AsInteger);

               if Trim(wMensErro) <> '' then
                  Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                         'Dia: ' + QryBuscaBoletaVSU.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(QryBuscaBoletaVSU.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(QryBuscaBoletaVSU.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(QryBuscaBoletaVSU.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(QryBuscaBoletaVSU.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               wTipoRecDesBol := '';
               bCriaLancto    := True;
               wIdForCli      := -1;
               wMensErro      := '';

               FazQuery(QryAux,'SELECT HISTCARTINV.VLRVARIACAO FROM HISTCARTINV '+
                               'WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv));
               //AL_135 - Contabiliza por Plano/Patro
               OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                       QryBuscaBoletaVSU.FieldByName('IDINVESTIMENTO').AsInteger,
                                       QryBuscaBoletaVSU.FieldByname('IDTIPOOPERACAO').AsInteger,
                                       QryBuscaBoletaVSU.FieldByname('IDOPERACAOINVEST').AsInteger,
                                       wIdForCli,
                                       QryBuscaBoletaVSU.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                       '', '', '', '',
                                       QryBuscaBoletaVSU.FieldByName('NUMDOCUMENTO').AsString,
                                       wTipoRecDesBol, bCriaLancto,
                                       QryAux.FieldByName('VLRVARIACAO').AsFloat,
                                       QryAux.FieldByName('VLRVARIACAO').AsFloat,
                                       QryBuscaBoletaVSU.FieldByName('DATAOPERACAO').AsDateTime,
                                       QryBuscaBoletaVSU.FieldByName('DATAVENCOPER').AsDateTime,
                                       iPlano, iPlanilha, iDocumento, wMensErro, 'N', False, False, 0, True,
                                       QryBuscaBoletaVSU.FieldByName('IDPLANPREVCTBPATR').AsInteger);

               if Trim(wMensErro) <> '' then
                  Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                         'Dia: ' + QryBuscaBoletaVSU.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(QryBuscaBoletaVSU.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(QryBuscaBoletaVSU.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(QryBuscaBoletaVSU.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(QryBuscaBoletaVSU.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               // Atualiza a Boleta com a Planilha
               dtmOperComum.qryLocal.Close;
               dtmOperComum.qryLocal.SQL.Clear;
               dtmOperComum.qryLocal.SQL.Add(' UPDATE BOLETA SET ');
               if iPlano    > 0 then
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ')
               else
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = NULL,');
               if iPlanilha > 0 then
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilha)) + ' ')
               else
                  dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = NULL ');
               dtmOperComum.qryLocal.SQL.Add('WHERE BOLETA.IDBOLETA = ' + QuotedStr(DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString) + ' ');
               dtmOperComum.qryLocal.ExecSQL;

               ExecutarQuery(QryAux,'UPDATE HISTCARTINV SET HISTCARTINV.FLGCUSTODIA         = NULL '+
                                    ' WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv));
            end;
            QryBuscaBoletaVSU.Next;
         end;
         Result := True;
      finally
         QryBuscaBoletaVSU.Close;
         //Ricardo Cristiano - 27/07/2011 - N. Sol 162070 -  N. Kintana 1373935
         FreeAndNil(CtrlRV);         
      end;
   end;
end;

//--------Alterações anteriores na rotina
//AL_102 - 10/10/2005
//AL_125
function TRendaVariavel.LancaBoletaDRE(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var iIdHistCartInv, iIdOperCust, iIdHistCustodiaOrig, wIdForCli, iPlano, iPlanilha, iDocumento: Integer;
    wTipoRecDesBol, wMensErro, TipoB: String;
    bCriaLancto: Boolean;
begin
   with DMRendaVariavel do
   begin
      try
         Result := False;
         OperComum.LimpaParametros(QryBuscaBoletaDRE);
         QryBuscaBoletaDRE.ParamByName('IDBOLETA').AsString := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         QryBuscaBoletaDRE.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
         QryBuscaBoletaDRE.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            QryBuscaBoletaDRE.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         QryBuscaBoletaDRE.Open;

         while not QryBuscaBoletaDRE.EOF do
         begin
            if (QryBuscaBoletaDRE.FieldByName('ORIGDEST').AsString = 'D') then
            begin
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                                 QryBuscaBoletaDRE.FieldByname('IDMODULO').AsInteger,
                                                 QryBuscaBoletaDRE.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                                 QryBuscaBoletaDRE.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                                 QryBuscaBoletaDRE.FieldByname('IDTIPOOPERACAO').AsInteger,
                                                 QryBuscaBoletaDRE.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                                 QryBuscaBoletaDRE.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 QryBuscaBoletaDRE.FieldByname('DATAOPERACAO').AsDateTime,
                                                 QryBuscaBoletaDRE.FieldByname('VLROPERACAO').AsFloat,
                                                 QryBuscaBoletaDRE.FieldByname('QTDEOPERACAO').AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                 QryBuscaBoletaDRE.FieldByNAme('NATUREZAOPERACAO').AsString {Movimento},
                                                 QryBuscaBoletaDRE.FieldByNAme('NATUREZAOPERACAO').AsString{Operacao},
                                                 QryBuscaBoletaDRE.FieldByname('IDLOTE').AsString,
                                                 Trim(QryBuscaBoletaDRE.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                                      Trim(QryBuscaBoletaDRE.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'OPE', '', '', True, -1,
                                                 QryBuscaBoletaDRE.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + QryBuscaBoletaDRE.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(QryBuscaBoletaDRE.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(QryBuscaBoletaDRE.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(QryBuscaBoletaDRE.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(QryBuscaBoletaDRE.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                         'Dia: ' + QryBuscaBoletaDRE.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Investimento: ' + Trim(QryBuscaBoletaDRE.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(QryBuscaBoletaDRE.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(QryBuscaBoletaDRE.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               if (QryBuscaBoletaDRE.FieldByName('IDCARTEIRAGERENC').IsNull) then
               begin
                  FazQuery(qryLocalAux,
                           ' SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, INV.IDTIPOINVEST, '+
                           '         INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AXB.QTDELOTE '+
                           ' FROM INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB  '+
                           ' WHERE (INV.IDINVESTIMENTO = '+QuotedStr(QryBuscaBoletaDRE.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
                           '       (INV.IDINVESTIMENTO = ACA.IDACAO) AND '+
                           '       (INV.IDINVESTIMENTO = AXB.IDACAO) ');

                  // Parametro para Contabilidade e CAP/CAR
                  wTipoRecDesBol := '';
                  bCriaLancto    := True;
                  wIdForCli      := -1;
                  iPlano         := -1;
                  iPlanilha      := -1;
                  iDocumento     := -1;
                  wMensErro      := '';

                  iIdOperCust := LeUltRegistro(Nil,'OPERCUSTODIA');

                  if Not OperacaoInvest.AlimentaOperCustodia(iIdOperCust, -1,  -1,
                                                             iIdHistCartInv, iIdHistCartInv,
                                                             QryBuscaBoletaDRE.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                             QryBuscaBoletaDRE.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                             QryBuscaBoletaDRE.FieldByName('IDINVESTIMENTO').AsInteger,
                                                             QryBuscaBoletaDRE.FieldByName('IDCUSTODIANTE').AsInteger,
                                                             QryBuscaBoletaDRE.FieldByName('IDCUSTODIANTE').AsInteger,
                                                             OperComum.IIF(QryBuscaBoletaDRE.FieldByName('IDMOTIVOBLOQORIG').IsNull,-1,
                                                                           QryBuscaBoletaDRE.FieldByName('IDMOTIVOBLOQORIG').AsInteger),
                                                             OperComum.IIF(QryBuscaBoletaDRE.FieldByName('IDMOTIVOBLOQDEST').IsNull,-1,
                                                                           QryBuscaBoletaDRE.FieldByName('IDMOTIVOBLOQDEST').AsInteger),
                                                             QryBuscaBoletaDRE.FieldByName('QTDEOPERACAO').AsFloat,
                                                             QryBuscaBoletaDRE.FieldByName('DATAOPERACAO').AsDateTime,
                                                             QryBuscaBoletaDRE.FieldByName('IDLOTE').AsString,
                                                             DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString,
                                                             QryBuscaBoletaDRE.FieldByName('IDPLANPREVCTBPATR').AsInteger) then
                     Raise Exception.Create('Não foi possível Gravar a Operação de Custódia' + #13 +
                                            'Dia: ' + QryBuscaBoletaDRE.FieldByname('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(QryBuscaBoletaDRE.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(QryBuscaBoletaDRE.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(QryBuscaBoletaDRE.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(QryBuscaBoletaDRE.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  ExecutarQuery(QryAux,'UPDATE OPERACAOINVEST ' +
                                       'SET OPERACAOINVEST.IDOPERCUSTODIA = ' + IntToStr(iIdOperCust) + ' ' +
                                       'WHERE OPERACAOINVEST.IDOPERACAOINVEST = ' + QryBuscaBoletaDRE.FieldByName('IDOPERACAOINVEST').AsString);

                  if (QryBuscaBoletaDRE.FieldByName('IDTIPOOPERACAO').AsInteger IN [pRPI.IDTIPOOPERDIRREE,pRPI.IDTIPOOPERDIRREE+10000]) then
                  begin
                     if QryBuscaBoletaDRE.FieldByName('IDMOTIVOBLOQDEST').AsInteger = -1 then
                        TipoB := 'V'
                     else
                        TipoB := 'Z';  //DIMINUI SALDO BLOQUEADO
                  end
                  else
                  begin
                     if QryBuscaBoletaDRE.FieldByName('IDMOTIVOBLOQDEST').AsInteger = -1 then
                        TipoB := 'C'
                     else
                        TipoB := 'Y';  //AMUMENTA SALDO BLO,QUEADO
                  end;
                  if not OperacaoInvest.InsereCustodia(QryBuscaBoletaDRE.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                       QryBuscaBoletaDRE.FieldByName('IDINVESTIMENTO').AsInteger,
                                                       QryBuscaBoletaDRE.FieldByName('IDCUSTODIANTE').AsInteger,
                                                       OperComum.IIF(QryBuscaBoletaDRE.FieldByName('IDMOTIVOBLOQDEST').IsNull,-1,
                                                                     QryBuscaBoletaDRE.FieldByName('IDMOTIVOBLOQDEST').AsInteger),
                                                       QryBuscaBoletaDRE.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                       iIdOperCust,
                                                       QryBuscaBoletaDRE.FieldByName('IDLOTE').AsString,
                                                       TipoB,
                                                       QryBuscaBoletaDRE.FieldByName('DATAOPERACAO').AsDateTime,
                                                       QryBuscaBoletaDRE.FieldByName('QTDEOPERACAO').AsFloat,
                                                       iIdHistCustodiaOrig,
                                                       QryBuscaBoletaDRE.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                       QryBuscaBoletaDRE.FieldByName('FLGCONTAINVEST').AsInteger) then
                     Raise Exception.Create('Não foi possível Alimentar a Custódia' + #13 +
                                            'Dia: ' + QryBuscaBoletaDRE.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(QryBuscaBoletaDRE.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(QryBuscaBoletaDRE.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(QryBuscaBoletaDRE.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(QryBuscaBoletaDRE.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  OperacaoInvest.AtualizaSaldosCustodia;

                  ExecutarQuery(QryAux,'Update HistCartInv Set HistCartInv.FlgCustodia = NULL '+
                                       ' Where HistCartInv.IdHistCartInv = '+IntToStr(iIdHistCartInv));

                  //AL_135 - Contabiliza por Plano/Patro
                  if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                             QryBuscaBoletaDRE.FieldByName('IDINVESTIMENTO').AsInteger,
                                             QryBuscaBoletaDRE.FieldByname('IDTIPOOPERACAO').AsInteger,
                                             QryBuscaBoletaDRE.FieldByname('IDOPERACAOINVEST').AsInteger,
                                             wIdForCli,
                                             QryBuscaBoletaDRE.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                             '', '', '', '',
                                             QryBuscaBoletaDRE.FieldByName('NUMDOCUMENTO').AsString,
                                             wTipoRecDesBol, bCriaLancto,
                                             QryBuscaBoletaDRE.FieldByName('VLROPERACAO').AsFloat,
                                             QryBuscaBoletaDRE.FieldByName('VLROPERACAO').AsFloat,
                                             QryBuscaBoletaDRE.FieldByName('DATAOPERACAO').AsDateTime,
                                             QryBuscaBoletaDRE.FieldByName('DATAVENCOPER').AsDateTime,
                                             iPlano, iPlanilha, iDocumento, wMensErro, 'N', False, False, 0, True,
                                             QryBuscaBoletaDRE.FieldByName('IDPLANPREVCTBPATR').AsInteger) <> 0 then
                     Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                            'Dia: ' + QryBuscaBoletaDRE.FieldByname('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(QryBuscaBoletaDRE.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(QryBuscaBoletaDRE.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(QryBuscaBoletaDRE.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(QryBuscaBoletaDRE.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  if (iPlanilha > 0) or (iDocumento > 0) then
                  begin
                     dtmOperComum.qryLocal.Close;
                     dtmOperComum.qryLocal.SQL.Clear;
                     dtmOperComum.qryLocal.SQL.Add(' UPDATE BOLETA SET ');
                     if iPlano    > 0 then
                        dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ')
                     else
                        dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLANO     = NULL,');
                     if iPlanilha > 0 then
                        dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilha)) + ' ')
                     else
                        dtmOperComum.qryLocal.SQL.Add(' BOLETA.PLNCODIGO = NULL ');
                     dtmOperComum.qryLocal.SQL.Add('WHERE BOLETA.IDBOLETA = ' + QuotedStr(DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString) + ' ');
                     dtmOperComum.qryLocal.ExecSQL;
                  end;
               end;
            end;
            qryBuscaBoletaDRE.Next;
         end;
         Result := True;
      finally
         qryBuscaBoletaDRE.Close;
      end;
   end;
end;


//--------Alterações anteriores na rotina
//Al_83 - 14/07/2005
//AL_108 - 27/10/2005
//AL_125
function TRendaVariavel.LancaBoletaDSA(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var iIdHistCartInv, iIdHistCustodia, wIdForCli, iPlano, iPlanilha, iDocumento, wIdCarteiraXEvento: Integer;
    wTipoRecDesBol, wMensErro, TipoB: String;
    bCriaLancto: Boolean;
    fSaldoCaixa: Currency;
begin
   with DMRendaVariavel do
   begin
      try
         Result := False;
         OperComum.LimpaParametros(qryBuscaBoletaDSA);
         qryBuscaBoletaDSA.ParamByName('IDBOLETA').AsString  := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         qryBuscaBoletaDSA.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
         qryBuscaBoletaDSA.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            qryBuscaBoletaDSA.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaDSA.Open;
         qryBuscaBoletaDSA.First;
         while not qryBuscaBoletaDSA.Eof do
         begin
            If (qryBuscaBoletaDSA.FieldByName('ORIGDEST').AsString = 'O') Then
            begin
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                                 qryBuscaBoletaDSA.FieldByname('IDMODULO').AsInteger,
                                                 qryBuscaBoletaDSA.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                                 qryBuscaBoletaDSA.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                                 qryBuscaBoletaDSA.FieldByname('IDTIPOOPERACAO').AsInteger,
                                                 qryBuscaBoletaDSA.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                                 qryBuscaBoletaDSA.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryBuscaBoletaDSA.FieldByname('DATAOPERACAO').AsDateTime,
                                                 qryBuscaBoletaDSA.FieldByname('VLROPERACAO').AsFloat,
                                                 qryBuscaBoletaDSA.FieldByname('QTDEOPERACAO').AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                  0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                 'D'{Movimento}, 'D'{Operacao},
                                                 qryBuscaBoletaDSA.FieldByname('IDLOTE').AsString,
                                                 Trim(qryBuscaBoletaDSA.FieldByName('DESCTIPOOPERACAO').AsString)+ ' - Origem / '+
                                                      Trim(qryBuscaBoletaDSA.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'OPE', '1', '', True, -1,
                                                 qryBuscaBoletaDSA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaDSA.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
            end
            else
            begin
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                                 qryBuscaBoletaDSA.FieldByname('IDMODULO').AsInteger,
                                                 qryBuscaBoletaDSA.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                                 qryBuscaBoletaDSA.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                                 qryBuscaBoletaDSA.FieldByname('IDTIPOOPERACAO').AsInteger,
                                                 qryBuscaBoletaDSA.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                                 qryBuscaBoletaDSA.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryBuscaBoletaDSA.FieldByname('DATAOPERACAO').AsDateTime,
                                                 qryBuscaBoletaDSA.FieldByname('VLROPERACAO').AsFloat,
                                                 qryBuscaBoletaDSA.FieldByname('QTDEOPERACAO').AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                 'A'{Movimento}, 'A'{Operacao},
                                                 qryBuscaBoletaDSA.FieldByname('IDLOTE').AsString,
                                                 Trim(qryBuscaBoletaDSA.FieldByName('DESCTIPOOPERACAO').AsString)+ ' - Destino / '+
                                                      Trim(qryBuscaBoletaDSA.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'OPE', '1', '', True, -1,
                                                 qryBuscaBoletaDSA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaDSA.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
            end;

            if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
               Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                      'Dia: ' + qryBuscaBoletaDSA.FieldByname('DATAOPERACAO').AsString + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaDSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            If (qryBuscaBoletaDSA.FieldByName('ORIGDEST').AsString = 'O') Then
            begin
               if not ExecutaQuery(qryAuxiliar,
                                     'UPDATE HISTCARTINV SET ' +
                                     ' MOVIMAQUI = ' + TrocaVirgulaPonto(FloatToStr(qryBuscaBoletaDSA.FieldByName('VLRCUSTOATUAL').AsFloat * -1))+', '+
                                     ' VLRVARIACAO = '+ TrocaVirgulaPonto(FloatToStr(qryBuscaBoletaDSA.FieldByName('VLRVARIACAOATUAL').AsFloat * -1))+ ' ' +
                                     'WHERE IDHISTCARTINV = '+IntToStr(iIdHistCartInv)) then
                  Raise Exception.Create('Não foi possível Gravar na Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaDSA.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Campos: Saldos de Custo e Variação' + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaDSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
            end;

            // Faz Contábil e Custódia
            if qryBuscaBoletaDSA.FieldByName('IDCARTEIRAGERENC').IsNull then
            begin
               FazQuery(qryLocalAux,
                     ' SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, INV.IDTIPOINVEST, '+
                     '         INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AXB.QTDELOTE '+
                     ' FROM INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB  '+
                     ' WHERE (INV.IDINVESTIMENTO = '+QuotedStr(qryBuscaBoletaDSA.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
                     '       (INV.IDINVESTIMENTO = ACA.IDACAO) AND '+
                     '       (INV.IDINVESTIMENTO = AXB.IDACAO) ');

               If qryBuscaBoletaDSA.FieldByName('ORIGDEST').AsString = 'D' Then
               begin
                  // Parametro para Contabilidade e CAP/CAR
                  wTipoRecDesBol := '';
                  bCriaLancto    := True;
                  wIdForCli      := -1;
                  iPlano         := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger);
                  iPlanilha      := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger);
                  iDocumento     := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger);
                  wMensErro      := '';

                  //AL_135 - Contabiliza por Plano/Patro
                  OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                          qryBuscaBoletaDSA.FieldByName('IDINVESTIMENTO').AsInteger,
                                          qryBuscaBoletaDSA.FieldByname('IDTIPOOPERACAO').AsInteger,
                                          qryBuscaBoletaDSA.FieldByname('IDOPERACAOINVEST').AsInteger,
                                          wIdForCli,
                                          qryBuscaBoletaDSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                          '', '', '',
                                          qryBuscaBoletaDSA.FieldByName('NUMDOCUMENTO').AsString,
                                          qryBuscaBoletaDSA.FieldByName('RECPAG').AsString,
                                          wTipoRecDesBol, bCriaLancto,
                                          qryBuscaBoletaDSA.FieldByName('VLROPERACAO').AsFloat,
                                          qryBuscaBoletaDSA.FieldByName('VLROPERACAO').AsFloat,
                                          qryBuscaBoletaDSA.FieldByName('DATAOPERACAO').AsDateTime,
                                          qryBuscaBoletaDSA.FieldByName('DATAVENCOPER').AsDateTime,
                                          iPlano, iPlanilha, iDocumento, wMensErro, 'N', False, False, 0, False,
                                          qryBuscaBoletaDSA.FieldByName('IDPLANPREVCTBPATR').AsInteger);

                  if Trim(wMensErro) <> '' then
                     Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                            'Dia: ' + qryBuscaBoletaDSA.FieldByname('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  // Atualiza a Boleta com a Planilha
                  if iPlanilha > 0 then
                  begin
                     OperComum.LimpaParametros(DMRendaVariavel.qryUpdBoleta);
                     if iPlano  > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('PLANO').AsInteger := iPlano;
                     if iPlanilha  > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('PLNCODIGO').AsInteger := iPlanilha;
                     if iDocumento > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('CODDOCUMENTO').AsInteger := iDocumento;
                     DMRendaVariavel.qryUpdBoleta.ParamByName('IDBOLETA').AsString := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
                     DMRendaVariavel.qryUpdBoleta.ExecSQL;
                  end;

                  if qryBuscaBoletaDSA.FieldByName('IDMOTIVOBLOQDEST').AsInteger = -1 then
                     TipoB := 'C'
                  else
                     TipoB := 'Y';  //AUMENTA SALDO BLOQUEADO

                  //AL_125
                  if not OperacaoInvest.InsereCustodia(qryBuscaBoletaDSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                       qryBuscaBoletaDSA.FieldByName('IDINVESTIMENTO').AsInteger,
                                                       qryBuscaBoletaDSA.FieldByName('IDCUSTODIANTE').AsInteger,
                                                       OperComum.IIF(qryBuscaBoletaDSA.FieldByName('IDMOTIVOBLOQDEST').IsNull,-1,
                                                                     qryBuscaBoletaDSA.FieldByName('IDMOTIVOBLOQDEST').AsInteger),
                                                       qryBuscaBoletaDSA.FieldByname('IDOPERACAOINVEST').AsInteger,
                                                       -1,
                                                       qryBuscaBoletaDSA.FieldByName('IDLOTE').AsString,
                                                       TipoB,
                                                       qryBuscaBoletaDSA.FieldByname('DATAOPERACAO').AsDateTime,
                                                       qryBuscaBoletaDSA.FieldByName('QTDEOPERACAO').AsFloat,
                                                       iIdHistCustodia,
                                                       qryBuscaBoletaDSA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                       qryBuscaBoletaDSA.FieldByName('FLGCONTAINVEST').AsInteger) then
                     Raise Exception.Create('Não foi possível Alimentar a Custódia' + #13 +
                                            'Dia: ' + qryBuscaBoletaDSA.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  OperacaoInvest.AtualizaSaldosCustodia;

                  ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                                       ' FlgCustodia         = NULL '+
                                       ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));
               end
               Else If qryBuscaBoletaDSA.FieldByName('ORIGDEST').AsString = 'O' Then
               begin
                  // Parametro para Contabilidade e CAP/CAR
                  wTipoRecDesBol := '';
                  bCriaLancto    := True;
                  wIdForCli      := -1;
                  iPlano         := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger);
                  iPlanilha      := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger);
                  iDocumento     := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger);
                  wMensErro      := '';

                  //AL_135 - Contabiliza por Plano/Patro
                  OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                          qryBuscaBoletaDSA.FieldByName('IDINVESTIMENTO').AsInteger,
                                          qryBuscaBoletaDSA.FieldByname('IDTIPOOPERACAO').AsInteger,
                                          qryBuscaBoletaDSA.FieldByname('IDOPERACAOINVEST').AsInteger,
                                          wIdForCli {Verificar quem é},
                                          qryBuscaBoletaDSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                          qryBuscaBoletaDSA.FieldByName('DESCTIPOOPERACAO').AsString + ' - ' +
                                                      qryBuscaBoletaDSA.FieldByName('DESCINVESTIMENTO').AsString, '',
                                          ''{IDLote},
                                          qryBuscaBoletaDSA.FieldByName('NUMDOCUMENTO').AsString,
                                          qryBuscaBoletaDSA.FieldByName('RECPAG').AsString,
                                          wTipoRecDesBol, bCriaLancto,
                                          qryBuscaBoletaDSA.FieldByName('VLROPERACAO').AsFloat,
                                          qryBuscaBoletaDSA.FieldByName('VLROPERACAO').AsFloat,
                                          qryBuscaBoletaDSA.FieldByName('DATAOPERACAO').AsDateTime,
                                          qryBuscaBoletaDSA.FieldByName('DATAVENCOPER').AsDateTime,
                                          iPlano, iPlanilha, iDocumento, wMensErro, ' ', False, False, 0, True,
                                          qryBuscaBoletaDSA.FieldByName('IDPLANPREVCTBPATR').AsInteger);

                  if Trim(wMensErro) <> '' then
                     Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                            'Dia: ' + qryBuscaBoletaDSA.FieldByname('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  // Atualiza a Boleta com Planilha
                  if iPlanilha > 0 then
                  begin
                     OperComum.LimpaParametros(DMRendaVariavel.qryUpdBoleta);
                     if iPlano  > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('PLANO').AsInteger := iPlano;
                     if iPlanilha  > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('PLNCODIGO').AsInteger := iPlanilha;
                     if iDocumento > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('CODDOCUMENTO').AsInteger := iDocumento;
                     DMRendaVariavel.qryUpdBoleta.ParamByName('IDBOLETA').AsString := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
                     DMRendaVariavel.qryUpdBoleta.ExecSQL;
                  end;

                  if qryBuscaBoletaDSA.FieldByName('IDMOTIVOBLOQDEST').AsInteger = -1 then
                     TipoB := 'V'
                  else
                     TipoB := 'Z';  //DIMINUI SALDO BLOQUEADO

                  if not OperacaoInvest.InsereCustodia(qryBuscaBoletaDSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                       qryBuscaBoletaDSA.FieldByName('IDINVESTIMENTO').AsInteger,
                                                       qryBuscaBoletaDSA.FieldByName('IDCUSTODIANTE').AsInteger,
                                                       OperComum.IIF(qryBuscaBoletaDSA.FieldByName('IDMOTIVOBLOQDEST').IsNull,-1,
                                                                     qryBuscaBoletaDSA.FieldByName('IDMOTIVOBLOQDEST').AsInteger),
                                                       qryBuscaBoletaDSA.FieldByname('IDOPERACAOINVEST').AsInteger,
                                                       -1,
                                                       qryBuscaBoletaDSA.FieldByName('IDLOTE').AsString,
                                                       TipoB,
                                                       qryBuscaBoletaDSA.FieldByname('DATAOPERACAO').AsDateTime,
                                                       qryBuscaBoletaDSA.FieldByName('QTDEOPERACAO').AsFloat,
                                                       iIdHistCustodia,
                                                       qryBuscaBoletaDSA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                       qryBuscaBoletaDSA.FieldByName('FLGCONTAINVEST').AsInteger) then
                     Raise Exception.Create('Não foi possível Alimentar a Custódia' + #13 +
                                            'Dia: ' + qryBuscaBoletaDSA.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  OperacaoInvest.AtualizaSaldosCustodia;

                  ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                                       ' FlgCustodia         = NULL '+
                                       ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));
               end;
            end
            else If (qryBuscaBoletaDSA.FieldByName('ORIGDEST').AsString = 'D') Then
            begin
               wIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(qryBuscaBoletaDSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                    qryBuscaBoletaDSA.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                                    qryBuscaBoletaDSA.FieldByName('IDTIPOOPERACAO').AsInteger);

               if abs(wIdCarteiraXEvento) > 0 then
               begin
                  fSaldoCaixa := CaixaComum.BuscaSaldoCaixa(qryBuscaBoletaDSA.FieldByName('DATAOPERACAO').AsDateTime,
                                                            qryBuscaBoletaDSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                            qryBuscaBoletaDSA.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                            qryBuscaBoletaDSA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                            'OPE');

                  if not CaixaComum.GravaEventosCaixa(qryBuscaBoletaDSA.FieldByName('DATAOPERACAO').AsDateTime,
                                                      qryBuscaBoletaDSA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                      qryBuscaBoletaDSA.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                      0,
                                                      qryBuscaBoletaDSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                      qryBuscaBoletaDSA.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                      qryBuscaBoletaDSA.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                      qryBuscaBoletaDSA.FieldByName('IDOPERACAODIREITO').AsInteger,
                                                      qryBuscaBoletaDSA.FieldByName('DESCINVESTIMENTO').AsString,
                                                      qryBuscaBoletaDSA.FieldByName('VLROPERACAO').AsFloat,
                                                      fSaldoCaixa) Then
                     Raise Exception.Create('Não foi possível gravar os Eventos de Caixa' + #13 +
                                            'Dia: ' + qryBuscaBoletaDSA.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Evento: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaDSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaDSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaDSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');
               end;
            end;
            qryBuscaBoletaDSA.Next;
         end;
         Result := True;
      finally
         qryBuscaBoletaDSA.Close;
      end;
   end;
end;

//--------Alterações anteriores na rotina
//Al_83 - 14/07/2005
//AL_114
//AL_125
//AL_131
//AL_132

function TRendaVariavel.LancaBoletaCSA(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var CtrlRV: TCtrlRendaVariavel;
    iIdHistCartInv, iOperDireito, iIdHistCustodia, wIdCarteiraXEvento, wIdForCli, iPlano, iPlanilha, iDocumento: Integer;
    wMovimAqui, wSaldoAqui, wMovimVar, wSaldoVar: Double;
    wTipoRecDesBol, wMensErro, TipoB: String;
    bCriaLancto: Boolean;
    fSaldoCaixa: Currency;
begin
   with DMRendaVariavel do
   begin
      try
         Result := False;
         CtrlRV := TCtrlRendaVariavel.Create;
         CtrlRV.InitializeAs(Padroes);
         OperComum.LimpaParametros(qryBuscaBoletaDSA);
         qryBuscaBoletaCSA.ParamByName('IDBOLETA').AsString  := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         qryBuscaBoletaCSA.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
         qryBuscaBoletaCSA.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
         if (iPlanPrev <> 0) and (pRPI.FLGPLANPREVCTBPAT = 'S') then
            qryBuscaBoletaCSA.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaCSA.Open;
         qryBuscaBoletaCSA.First;
         while not qryBuscaBoletaCSA.Eof do
         begin
            If (qryBuscaBoletaCSA.FieldByName('ORIGDEST').AsString = 'O') Then
            begin
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                                 qryBuscaBoletaCSA.FieldByname('IDMODULO').AsInteger,
                                                 qryBuscaBoletaCSA.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                                 qryBuscaBoletaCSA.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                                 qryBuscaBoletaCSA.FieldByname('IDTIPOOPERACAO').AsInteger,
                                                 qryBuscaBoletaCSA.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                                 qryBuscaBoletaCSA.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryBuscaBoletaCSA.FieldByname('DATAOPERACAO').AsDateTime,
                                                 qryBuscaBoletaCSA.FieldByname('VLROPERACAO').AsFloat,
                                                 qryBuscaBoletaCSA.FieldByname('QTDEOPERACAO').AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                  0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                 'A'{Movimento}, 'D'{Operacao},
                                                 qryBuscaBoletaCSA.FieldByname('IDLOTE').AsString,
                                                 Trim(qryBuscaBoletaCSA.FieldByName('DESCTIPOOPERACAO').AsString)+ ' - Origem / '+
                                                      Trim(qryBuscaBoletaCSA.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'OPE', '1', '', True, -1,
                                                 qryBuscaBoletaCSA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaCSA.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaCSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaCSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
            end
            else
            begin
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                                 qryBuscaBoletaCSA.FieldByname('IDMODULO').AsInteger,
                                                 qryBuscaBoletaCSA.FieldByname('IDINVESTIMENTO').AsInteger,2,
                                                 qryBuscaBoletaCSA.FieldByname('IDOPERACAOINVEST').AsInteger,-1,
                                                 qryBuscaBoletaCSA.FieldByname('IDTIPOOPERACAO').AsInteger,
                                                 qryBuscaBoletaCSA.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                                 qryBuscaBoletaCSA.FieldByname('IDCARTEIRAGERENC').AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryBuscaBoletaCSA.FieldByname('DATAOPERACAO').AsDateTime,
                                                 qryBuscaBoletaCSA.FieldByname('VLROPERACAO').AsFloat,
                                                 qryBuscaBoletaCSA.FieldByname('QTDEOPERACAO').AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                                 'D'{Movimento}, 'A'{Operacao},
                                                 qryBuscaBoletaCSA.FieldByname('IDLOTE').AsString,
                                                 Trim(qryBuscaBoletaCSA.FieldByName('DESCTIPOOPERACAO').AsString)+ ' - Destino / '+
                                                      Trim(qryBuscaBoletaCSA.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'OPE', '1', '', True, -1,
                                                 qryBuscaBoletaCSA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaCSA.FieldByname('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaCSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaCSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');
            end;

            if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
               Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                      'Dia: ' + qryBuscaBoletaCSA.FieldByname('DATAOPERACAO').AsString + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Carteira: '  + Trim(qryBuscaBoletaCSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaCSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

            qryAuxiliar.SQL.Clear;
            qryAuxiliar.SQL.Add('SELECT HISTCARTINV.MOVIMAQUI, HISTCARTINV.SALDOAQUI, HISTCARTINV.VLRVARIACAO, HISTCARTINV.SALDOVARIACAO ');
            qryAuxiliar.SQL.Add('FROM HISTCARTINV ');
            qryAuxiliar.SQL.Add('WHERE HISTCARTINV.IDOPERACAOINVEST = ' + qryBuscaBoletaCSA.FieldByName('IDOPERACAOINVEST').AsString);
            qryAuxiliar.Open;


            If (qryBuscaBoletaCSA.FieldByName('ORIGDEST').AsString = 'O') Then
            begin
               wMovimAqui := qryAuxiliar.FieldByName('MOVIMAQUI').AsFloat * -1;
               wSaldoAqui := qryAuxiliar.FieldByName('SALDOAQUI').AsFloat + wMovimAqui;
               wMovimVar  := qryAuxiliar.FieldByName('VLRVARIACAO').AsFloat * -1;
               wSaldoVar  := qryAuxiliar.FieldByName('SALDOVARIACAO').AsFloat + wMovimVar;
            end
            else If (qryBuscaBoletaCSA.FieldByName('ORIGDEST').AsString = 'D') Then
            begin
               wSaldoAqui  := 0;
               wSaldoVar   := 0;

               CtrlRV.BuscaSaldoRV.Executa(qryBuscaBoletaCSA.FieldByName('DATAOPERACAO').AsDateTime,
                                           qryBuscaBoletaCSA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                           qryBuscaBoletaCSA.FieldByName('IDINVESTIMENTO').AsInteger,
                                           qryBuscaBoletaCSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           qryBuscaBoletaCSA.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                           iIdHistCartInv,
                                           qryBuscaBoletaCSA.FieldByName('IDCUSTODIANTE').AsInteger,
                                           qryBuscaBoletaCSA.FieldByName('IDLOTE').AsString);

               wSaldoAqui := CtrlRV.BuscaSaldoRV.SaldoCusto;
               wSaldoVar  := CtrlRV.BuscaSaldoRV.SaldoVariacao;

               wMovimAqui := qryAuxiliar.FieldByName('MOVIMAQUI').AsFloat * -1;
               wSaldoAqui := wSaldoAqui + wMovimAqui;
               wMovimVar  := qryAuxiliar.FieldByName('VLRVARIACAO').AsFloat * -1;
               wSaldoVar  := wSaldoVar + wMovimVar;
            end;

            qryAuxiliar.Close;

            if not ExecutaQuery(qryAuxiliar,' UPDATE HISTCARTINV SET HISTCARTINV.MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(wMovimAqui))+','+
                                            ' HISTCARTINV.SALDOAQUI     = '+ TrocaVirgulaPonto(FloatToStr(wSaldoAqui))+','+
                                            ' HISTCARTINV.VLRVARIACAO   = '+ TrocaVirgulaPonto(FloatToStr(wMovimVar))+','+
                                            ' HISTCARTINV.SALDOVARIACAO = '+ TrocaVirgulaPonto(FloatToStr(wSaldoVar))+
                                            ' WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv)) then
                  Raise Exception.Create('Não foi possível Gravar na Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaCSA.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Campos: Valores e Saldos de Custo e Variação' + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaCSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaCSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

            // Faz Contábil e Custódia
            if qryBuscaBoletaCSA.FieldByName('IDCARTEIRAGERENC').IsNull then
            begin
               FazQuery(qryLocalAux,
                        'SELECT INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, INV.IDTIPOINVEST, '+
                        '       INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AXB.QTDELOTE '+
                        'FROM INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB  '+
                        'WHERE (INV.IDINVESTIMENTO = '+QuotedStr(qryBuscaBoletaCSA.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
                        '      (INV.IDINVESTIMENTO = ACA.IDACAO) AND '+
                        '      (INV.IDINVESTIMENTO = AXB.IDACAO) ');

               If qryBuscaBoletaCSA.FieldByName('ORIGDEST').AsString = 'D' Then
               begin
                  // Parametro para Contabilidade e CAP/CAR
                  wTipoRecDesBol := '';
                  bCriaLancto    := True;
                  wIdForCli      := -1;
                  iPlano         := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger);
                  iPlanilha      := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger);
                  iDocumento     := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger);
                  wMensErro      := '';

                  //AL_135 - Contabiliza por Plano/Patro
                  OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                          qryBuscaBoletaCSA.FieldByName('IDINVESTIMENTO').AsInteger,
                                          qryBuscaBoletaCSA.FieldByname('IDTIPOOPERACAO').AsInteger,
                                          qryBuscaBoletaCSA.FieldByname('IDOPERACAOINVEST').AsInteger,
                                          wIdForCli,
                                          qryBuscaBoletaCSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                          '', '', '',
                                          qryBuscaBoletaCSA.FieldByName('NUMDOCUMENTO').AsString,
                                          qryBuscaBoletaCSA.FieldByName('RECPAG').AsString,
                                          wTipoRecDesBol, bCriaLancto,
                                          qryBuscaBoletaCSA.FieldByName('VLROPERACAO').AsFloat,
                                          qryBuscaBoletaCSA.FieldByName('VLROPERACAO').AsFloat,
                                          qryBuscaBoletaCSA.FieldByName('DATAOPERACAO').AsDateTime,
                                          qryBuscaBoletaCSA.FieldByName('DATAVENCOPER').AsDateTime,
                                          iPlano, iPlanilha, iDocumento, wMensErro, 'N', False, False, 0, False,
                                          qryBuscaBoletaCSA.FieldByName('IDPLANPREVCTBPATR').AsInteger);

                  if Trim(wMensErro) <> '' then
                     Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                            'Dia: ' + qryBuscaBoletaCSA.FieldByname('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaCSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaCSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  // Atualiza a Boleta com a Planilha
                  if iPlanilha > 0 then
                  begin
                     OperComum.LimpaParametros(DMRendaVariavel.qryUpdBoleta);
                     if iPlano  > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('PLANO').AsInteger := iPlano;
                     if iPlanilha  > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('PLNCODIGO').AsInteger := iPlanilha;
                     if iDocumento > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('CODDOCUMENTO').AsInteger := iDocumento;
                     DMRendaVariavel.qryUpdBoleta.ParamByName('IDBOLETA').AsString := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
                     DMRendaVariavel.qryUpdBoleta.ExecSQL;
                  end;

                  if qryBuscaBoletaCSA.FieldByName('IDMOTIVOBLOQDEST').AsInteger = -1 then
                     TipoB := 'V'
                  else
                     TipoB := 'Z';  //AUMENTA SALDO BLOQUEADO

                  if not OperacaoInvest.InsereCustodia(qryBuscaBoletaCSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                       qryBuscaBoletaCSA.FieldByName('IDINVESTIMENTO').AsInteger,
                                                       qryBuscaBoletaCSA.FieldByName('IDCUSTODIANTE').AsInteger,
                                                       OperComum.IIF(qryBuscaBoletaCSA.FieldByName('IDMOTIVOBLOQDEST').IsNull,-1,
                                                                     qryBuscaBoletaCSA.FieldByName('IDMOTIVOBLOQDEST').AsInteger),
                                                       qryBuscaBoletaCSA.FieldByname('IDOPERACAOINVEST').AsInteger,
                                                       -1,
                                                       qryBuscaBoletaCSA.FieldByName('IDLOTE').AsString,
                                                       TipoB,
                                                       qryBuscaBoletaCSA.FieldByname('DATAOPERACAO').AsDateTime,
                                                       qryBuscaBoletaCSA.FieldByName('QTDEOPERACAO').AsFloat,
                                                       iIdHistCustodia,
                                                       qryBuscaBoletaCSA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                       qryBuscaBoletaCSA.FieldByName('FLGCONTAINVEST').AsInteger) then
                     Raise Exception.Create('Não foi possível Alimentar a Custódia' + #13 +
                                            'Dia: ' + qryBuscaBoletaCSA.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaCSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaCSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  OperacaoInvest.AtualizaSaldosCustodia;

                  ExecutarQuery(QryAux,'Update HistCartInv Set HistCartInv.FlgCustodia         = NULL '+
                                       ' Where HistCartInv.IdHistCartInv = '+IntToStr(iIdHistCartInv));
               end
               Else If qryBuscaBoletaCSA.FieldByName('ORIGDEST').AsString = 'O' Then
               begin
                  // Parametro para Contabilidade e CAP/CAR
                  wTipoRecDesBol := '';
                  bCriaLancto    := True;
                  wIdForCli      := -1;
                  iPlano         := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLANO.AsInteger);
                  iPlanilha      := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasPLNCODIGO.AsInteger);
                  iDocumento     := OperComum.IIF(DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger = 0, -1, DMRendaVariavel.qryBuscaBoletasCODDOCUMENTO.AsInteger);
                  wMensErro      := '';

                  //AL_135 - Contabiliza por Plano/Patro
                  OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                          qryBuscaBoletaCSA.FieldByName('IDINVESTIMENTO').AsInteger,
                                          qryBuscaBoletaCSA.FieldByname('IDTIPOOPERACAO').AsInteger,
                                          qryBuscaBoletaCSA.FieldByname('IDOPERACAOINVEST').AsInteger,
                                          wIdForCli {Verificar quem é},
                                          qryBuscaBoletaCSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          qryLocalAux.FieldByName('MOECODIGO').AsInteger,
                                          qryBuscaBoletaCSA.FieldByName('DESCTIPOOPERACAO').AsString + ' - ' +
                                                      qryBuscaBoletaCSA.FieldByName('DESCINVESTIMENTO').AsString, '',
                                          ''{IDLote},
                                          qryBuscaBoletaCSA.FieldByName('NUMDOCUMENTO').AsString,
                                          qryBuscaBoletaCSA.FieldByName('RECPAG').AsString,
                                          wTipoRecDesBol, bCriaLancto,
                                          qryBuscaBoletaCSA.FieldByName('VLROPERACAO').AsFloat,
                                          qryBuscaBoletaCSA.FieldByName('VLROPERACAO').AsFloat,
                                          qryBuscaBoletaCSA.FieldByName('DATAOPERACAO').AsDateTime,
                                          qryBuscaBoletaCSA.FieldByName('DATAVENCOPER').AsDateTime,
                                          iPlano, iPlanilha, iDocumento, wMensErro, ' ', False, False, 0, True,
                                          qryBuscaBoletaCSA.FieldByName('IDPLANPREVCTBPATR').AsInteger);

                  if Trim(wMensErro) <> '' then
                     Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                            'Dia: ' + qryBuscaBoletaCSA.FieldByname('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaCSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaCSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  // Atualiza a Boleta com Planilha
                  if iPlanilha > 0 then
                  begin
                     OperComum.LimpaParametros(DMRendaVariavel.qryUpdBoleta);
                     if iPlano  > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('PLANO').AsInteger := iPlano;
                     if iPlanilha  > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('PLNCODIGO').AsInteger := iPlanilha;
                     if iDocumento > 0 then
                        DMRendaVariavel.qryUpdBoleta.ParamByName('CODDOCUMENTO').AsInteger := iDocumento;
                     DMRendaVariavel.qryUpdBoleta.ParamByName('IDBOLETA').AsString := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
                     DMRendaVariavel.qryUpdBoleta.ExecSQL;
                  end;

                  if qryBuscaBoletaCSA.FieldByName('IDMOTIVOBLOQDEST').AsInteger = -1 then
                     TipoB := 'C'
                  else
                     TipoB := 'Y';  //DIMINUI SALDO BLOQUEADO

                  if not OperacaoInvest.InsereCustodia(qryBuscaBoletaCSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                       qryBuscaBoletaCSA.FieldByName('IDINVESTIMENTO').AsInteger,
                                                       qryBuscaBoletaCSA.FieldByName('IDCUSTODIANTE').AsInteger,
                                                       OperComum.IIF(qryBuscaBoletaCSA.FieldByName('IDMOTIVOBLOQDEST').IsNull,-1,
                                                                     qryBuscaBoletaCSA.FieldByName('IDMOTIVOBLOQDEST').AsInteger),
                                                       qryBuscaBoletaCSA.FieldByname('IDOPERACAOINVEST').AsInteger,
                                                       -1,
                                                       qryBuscaBoletaCSA.FieldByName('IDLOTE').AsString,
                                                       TipoB,
                                                       qryBuscaBoletaCSA.FieldByname('DATAOPERACAO').AsDateTime,
                                                       qryBuscaBoletaCSA.FieldByName('QTDEOPERACAO').AsFloat,
                                                       iIdHistCustodia,
                                                       qryBuscaBoletaCSA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                       qryBuscaBoletaCSA.FieldByName('FLGCONTAINVEST').AsInteger) then
                     Raise Exception.Create('Não foi possível Alimentar a Custódia' + #13 +
                                            'Dia: ' + qryBuscaBoletaCSA.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaCSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaCSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');


                  OperacaoInvest.AtualizaSaldosCustodia;

                  ExecutarQuery(QryAux,'Update HistCartInv Set HistCartInv.FlgCustodia         = NULL '+
                                       ' Where HistCartInv.IdHistCartInv = '+IntToStr(iIdHistCartInv));
               end;
            end
            else If (qryBuscaBoletaCSA.FieldByName('ORIGDEST').AsString = 'D') Then
            begin
               wIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(qryBuscaBoletaCSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                    qryBuscaBoletaCSA.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                                    qryBuscaBoletaCSA.FieldByName('IDTIPOOPERACAO').AsInteger);

               if abs(wIdCarteiraXEvento) > 0 then
               begin
                  fSaldoCaixa := CaixaComum.BuscaSaldoCaixa(qryBuscaBoletaCSA.FieldByName('DATAOPERACAO').AsDateTime,
                                                            qryBuscaBoletaCSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                            qryBuscaBoletaCSA.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                            qryBuscaBoletaCSA.FieldByName('PLANPRVCONTABPATRO').AsInteger, 'OPE');

                  if not CaixaComum.GravaEventosCaixa(qryBuscaBoletaCSA.FieldByName('DATAOPERACAO').AsDateTime,
                                                      qryBuscaBoletaCSA.FieldByName('PLANPRVCONTABPATRO').AsInteger,
                                                      qryBuscaBoletaCSA.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                      0,
                                                      qryBuscaBoletaCSA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                      qryBuscaBoletaCSA.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                      qryBuscaBoletaCSA.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                      qryBuscaBoletaCSA.FieldByName('IDOPERACAODIREITO').AsInteger,
                                                      qryBuscaBoletaCSA.FieldByName('DESCINVESTIMENTO').AsString,
                                                      qryBuscaBoletaCSA.FieldByName('VLROPERACAO').AsFloat,
                                                      fSaldoCaixa) Then
                     Raise Exception.Create('Não foi possível gravar os Eventos de Caixa' + #13 +
                                            'Dia: ' + qryBuscaBoletaCSA.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Evento: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaCSA.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Carteira: '  + Trim(qryBuscaBoletaCSA.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaCSA.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');
               end;
            end;
            qryBuscaBoletaCSA.Next;
         end;
         Result := True;
      finally
         qryBuscaBoletaCSA.Close;
         FreeAndNil(CtrlRV);
      end;
   end;
end;

//AL_134
// TRP - Tranferência entre Planos
function TRendaVariavel.LancaBoletaTRP(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var
    iIdHistCartInv, iIdHistCartInvOrig, iIdHistCartInvDest, iIdHistCustodiaOrig, iIdHistCustodiaDest,
    iIdHistCartInvTRC, iMercadoDest, iMercadoOrig: Integer;
    sBoleta: String;
    fPU, fSaldoAquiPro, fSaldoVariacaoPro, fSaldoIrApuPro, fValorOper: Double;
    CtrlRV: TCtrlRendaVariavel;
    // Variaveis de Contabilização
    iPlano, iPlanilha, iDocumento: Integer;
    wTipoRecDesBol, wMensErro: String;
    bCriaLancto: Boolean;
begin
   try
      Result := False;
      CtrlRV := TCtrlRendaVariavel.Create;
      CtrlRV.InitializeAs(Padroes);
      with DMRendaVariavel, OperComum, OperacaoInvest do
      begin
         sBoleta := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         //Inicio - Novo reprocessamento linear
         LimpaParametros(qryBuscaBoletaTRP);
         qryBuscaBoletaTRP.ParamByName('IDBOLETA').AsString := sBoleta;
         //AL_145
         qryBuscaBoletaTRP.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         qryBuscaBoletaTRP.Open;
         qryBuscaBoletaTRP.First;
         // Refaz a TRP somente do Investimento que está sendo Relançado e
         //    somente na primeira passagem (São duas Carteiras)
         //    para não duplicar o lançamento
         while not qryBuscaBoletaTRP.Eof do
         begin
            if iPlanPrev = 0 then
               iPlanPrev := iPlanPrevCtbPatro;
            CtrlRV.BuscaSaldoRV.Executa(qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsDateTime-1,
                                        qryBuscaBoletaTRP.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                        qryBuscaBoletaTRP.FieldByName('IDINVESTIMENTO').AsInteger,
                                        qryBuscaBoletaTRP.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        -1, High(Integer),
                                        qryBuscaBoletaTRP.FieldByName('IDCUSTODIANTE').AsInteger,
                                        qryBuscaBoletaTRP.FieldByName('IDLOTE').AsString);

            fPU               := OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoCusto, CtrlRV.BuscaSaldoRV.SaldoQtdTotal);
            fSaldoAquiPro     := OperComum.Round(fPU * qryBuscaBoletaTRP.FieldByName('QTDEOPERACAO').AsFloat,2);
            fPU               := OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoVariacao,CtrlRV.BuscaSaldoRV.SaldoQtdTotal);
            fSaldoVariacaoPro := OperComum.Round(fPU * qryBuscaBoletaTRP.FieldByName('QTDEOPERACAO').AsFloat,2);
            fPU               := OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoIRApurado,CtrlRV.BuscaSaldoRV.SaldoQtdTotal);
            fSaldoIrApuPro    := OperComum.Round(fPU * qryBuscaBoletaTRP.FieldByName('QTDEOPERACAO').AsFloat,2);
            fValorOper        := OperComum.Round(OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoVlrTotal, CtrlRV.BuscaSaldoRV.SaldoQtdTotal) * qryBuscaBoletaTRP.FieldByName('QTDEOPERACAO').AsFloat, 2);

            iDocumento := -1;

            //AL_141
            // Busca as baixas da operação de origem
            iPlano    := OperComum.IIF(qryBuscaBoletaTRP.FieldByName('PLNCODIGO').IsNull, -1, qryBuscaBoletaTRP.FieldByName('PLANO').AsInteger);
            iPlanilha := OperComum.IIF(qryBuscaBoletaTRP.FieldByName('PLNCODIGO').IsNull, -1, qryBuscaBoletaTRP.FieldByName('PLNCODIGO').AsInteger);
            iIdHistCartInvOrig := -1;
            iIdHistCustodiaOrig := -1;
            iIdHistCartInvDest := -1;
            iIdHistCustodiaDest := -1;

            //Gera Baixa da Origem
            if qryBuscaBoletaTRP.FieldByName('ORIGDEST').AsString = 'O' then
            begin
               If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                 qryBuscaBoletaTRP.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 2,
                                                 qryBuscaBoletaTRP.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                 -1,
                                                 qryBuscaBoletaTRP.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                 qryBuscaBoletaTRP.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                 qryBuscaBoletaTRP.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                 //AL_147 - Não grava Planilha e documento mais na Histcartinv
                                                 -1, -1, -1, -1, -1,
                                                 qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsDateTime,
                                                 fValorOper, qryBuscaBoletaTRP.FieldByName('QTDEOPERACAO').AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                 0,0,0,0,0,0,0,0,0,
                                                 'D','D', qryBuscaBoletaTRP.FieldByName('IDLOTE').AsString,
                                                 Trim(qryBuscaBoletaTRP.FieldByName('DESCTIPOOPERACAO').AsString)+ ' / '+
                                                      Trim(qryBuscaBoletaTRP.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'TRP', '', '', True, -1,
                                                 qryBuscaBoletaTRP.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) Then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRP.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               iIdHistCartInvOrig := iIdHistCartInv;

               ExecutaQuery(QryAux,'UPDATE HISTCARTINV SET HISTCARTINV.MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(fSaldoAquiPro))+','+
                                   ' HISTCARTINV.VLRVARIACAO = '+TrocaVirgulaPonto(FloatToStr(fSaldoVariacaoPro))+','+
                                   ' HISTCARTINV.VLRIRAPU    = '+TrocaVirgulaPonto(FloatToStr(fSaldoIrApuPro))+' '+
                                   ' WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv));

               //AL_135 - Grava a Variação e o Custo transferido para utilizar no destino
               ExecutaQuery(QryAux,'UPDATE OPERACAOINVEST SET ' +
                                   ' OPERACAOINVEST.VLRCUSTOATUAL = '+ TrocaVirgulaPonto(FloatToStr(fSaldoAquiPro))+','+
                                   ' OPERACAOINVEST.VLRVARIACAOATUAL = '+TrocaVirgulaPonto(FloatToStr(fSaldoVariacaoPro))+' '+
                                   ' WHERE OPERACAOINVEST.IDOPERACAOINVEST = ' + qryBuscaBoletaTRP.FieldByName('IDOPERACAOINVEST').AsString);

               If Not OperComum.AtualizaSaldos(1,-1) Then
                  Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                         'Dia ' + qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Investimento ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaTRP.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRP.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               if not qryBuscaBoletaTRP.FieldByName('IDOPERCUSTODIA').IsNull then
               begin
                  OperComum.AlteraHistCustodiaOrigem(qryBuscaBoletaTRP.FieldByName('IDOPERCUSTODIA').AsInteger,
                                                     qryBuscaBoletaTRP.FieldByName('IDMOTIVOBLOQUEIO').Asinteger,
                                                     qryBuscaBoletaTRP.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                     qryBuscaBoletaTRP.FieldByName('IDINVESTIMENTO').AsInteger,
                                                     qryBuscaBoletaTRP.FieldByName('IDCUSTODIANTE').AsInteger,
                                                     '',
                                                     qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsDateTime,
                                                     qryBuscaBoletaTRP.FieldByName('QTDEOPERACAO').AsFloat,
                                                     iIdHistCustodiaOrig,
                                                     qryBuscaBoletaTRP.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                     0);

                  if not OperacaoInvest.AtualizaSaldosCustodia then
                     Raise Exception.Create('Não foi possível Atualizar os Saldos da Custódia' + #13 +
                                            'Dia: ' + qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRP.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  if not ExecutaQuery(QryAux, 'UPDATE OPERCUSTODIA SET '+
                                              'OPERCUSTODIA.IDCUSTODIAORIG    = ' + IntToStr(iIdHistCustodiaOrig) + ', ' +
                                              'OPERCUSTODIA.IDHISTCARTINVORIG = ' + IntToStr(iIdHistCartInvOrig) + ' ' +
                                              'WHERE OPERCUSTODIA.IDOPERCUSTODIA = ' + qryBuscaBoletaTRP.FieldByName('IDOPERCUSTODIA').AsString) then
                     Raise Exception.Create('Não foi possível atualizar os históricos de custódia' + #13 +
                                            'Dia: ' + qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRP.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');
               end;

               if qryBuscaBoletaTRP.FieldByName('IDCARTEIRAGERENC').IsNull then
               begin
                  // Contabiliza Acréscimo de Custo e Variação do Acréscimo de Transferência
                  OperComum.BuscaFlgContab(qryBuscaBoletaTRP.FieldByName('IDTIPOOPERACAO').AsInteger);

                  wTipoRecDesBol := '';
                  //AL_135 - Contabiliza por Plano/Patro
                  OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                          qryBuscaBoletaTRP.FieldByName('IDINVESTIMENTO').AsInteger,
                                          qryBuscaBoletaTRP.FieldByName('IDTIPOOPERACAO').AsInteger,
                                          qryBuscaBoletaTRP.FieldByName('IDOPERACAOINVEST').AsInteger,
                                          qryBuscaBoletaTRP.FieldByName('IDEMISSOR').AsInteger,
                                          qryBuscaBoletaTRP.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          pRPI.MOECODIGO, '','','','','',
                                          wTipoRecDesBol,
                                          bCriaLancto,
                                          0, fValorOper,
                                          qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsDateTime,
                                          qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsDateTime,
                                          iPlano,iPlanilha,iDocumento,
                                          wMensErro,'N',False,False, 0, True,
                                          qryBuscaBoletaTRP.FieldByName('IDPLANPREVCTBPATR').AsInteger);
                  if Trim(wMensErro) <> '' then
                     Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                            'Dia: ' + qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRP.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');
               end;
            end
            else if qryBuscaBoletaTRP.FieldByName('ORIGDEST').AsString = 'D' then
            begin

               // Busca as baixas da operação de origem
               With dtmOperComum.qryLocal Do
               begin
                  Close;
                  Sql.Clear;
                  Sql.Add('SELECT  HISTCARTINV.VLRMOVCARTINV, HISTCARTINV.MOVIMAQUI, HISTCARTINV.VLRVARIACAO, HISTCARTINV.VLRIRPROV, ');
                  Sql.Add('        HISTCARTINV.VLRIRAPU, HISTCARTINV.VLRIOFPROV, HISTCARTINV.VLRIOFAPU ');
                  Sql.Add('FROM HISTCARTINV                      ');
                  Sql.Add('WHERE (HISTCARTINV.TIPMOVCARTINV    = ''TRP'') AND ');
                  Sql.Add('      (HISTCARTINV.NATURMOVCARTINV  = ''D'')   AND ');
                  Sql.Add('      (HISTCARTINV.IDOPERACAOINVEST = ');
                  Sql.Add('            (SELECT O1.IDOPERACAOINVEST ');
                  Sql.Add('             FROM  OPERACAOINVEST O1 ');
                  Sql.Add('             WHERE O1.NUMDOCUMENTO = ' + QuotedStr(sBoleta));
                  Sql.Add('               AND O1.ORIGDEST = ''O''');
                  Sql.Add('               AND O1.IDINVESTIMENTO = ' + qryBuscaBoletaTRP.FieldByName('IDINVESTIMENTO').AsString);
                  Sql.Add('               AND O1.IDCARTEIRAINVEST =' + qryBuscaBoletaTRP.FieldByName('IDCARTEIRAINVEST').AsString);
                  Sql.Add('               AND NVL(O1.IDCUSTODIANTE,0) =' + IntToStr(qryBuscaBoletaTRP.FieldByName('IDCUSTODIANTE').AsInteger));
                  Sql.Add('               AND NVL(O1.IDCARTEIRAGERENC,0) = ' + IntToStr(qryBuscaBoletaTRP.FieldByName('IDCARTEIRAGERENC').AsInteger));
                  Sql.Add('               AND IDPLANPREVCTBPATR <> ' + qryBuscaBoletaTRP.FieldByName('IDPLANPREVCTBPATR').AsString);
                  Sql.Add('               AND O1.IDTIPOOPERACAO = ' + IntToStr(qryBuscaBoletaTRP.FieldByName('IDTIPOOPERACAO').AsInteger + 1) + '))');
                  Open;
               end;

               fSaldoAquiPro     := dtmOperComum.qryLocal.FieldByName('MOVIMAQUI').AsFloat*-1;
               fSaldoVariacaoPro := dtmOperComum.qryLocal.FieldByName('VLRVARIACAO').AsFloat*-1;
               fSaldoIrApuPro    := dtmOperComum.qryLocal.FieldByName('VLRIRAPU').AsFloat*-1;
               fValorOper        := dtmOperComum.qryLocal.FieldByName('VLRMOVCARTINV').AsFloat*-1;


               //Aumenta da Carteira
               If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                 qryBuscaBoletaTRP.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 2,
                                                 qryBuscaBoletaTRP.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                 -1,
                                                 qryBuscaBoletaTRP.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                 qryBuscaBoletaTRP.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                 qryBuscaBoletaTRP.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                 //AL_147 - Não grava Planilha e documento mais na Histcartinv
                                                 -1, -1, -1, -1, -1,
                                                 qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsDateTime,
                                                 fValorOper,
                                                 qryBuscaBoletaTRP.FieldByName('QTDEOPERACAO').AsFloat,
                                                 pRPI.VLRCOTAINICART, fSaldoVariacaoPro, 0, fSaldoIrApuPro, 0,0,0,0,0,0,
                                                 'A','A', qryBuscaBoletaTRP.FieldByName('IDLOTE').AsString,
                                                 Trim(qryBuscaBoletaTRP.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                                      Trim(qryBuscaBoletaTRP.FieldByName('DESCINVESTIMENTO').AsString),
                                                 'TRP', '', '', True, -1,
                                                 qryBuscaBoletaTRP.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) Then
                  Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                         'Dia: ' + qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRP.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               iIdHistCartInvDest := iIdHistCartInv;

               ExecutaQuery(QryAux,'UPDATE HISTCARTINV SET ' +
                                   ' HISTCARTINV.MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(fSaldoAquiPro))+','+
                                   ' HISTCARTINV.VLRVARIACAO = '+TrocaVirgulaPonto(FloatToStr(fSaldoVariacaoPro))+','+
                                   ' HISTCARTINV.VLRIRAPU    = '+TrocaVirgulaPonto(FloatToStr(fSaldoIrApuPro))+' '+
                                   ' WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv));

               if not OperComum.AtualizaSaldos(1,-1) then
                  Raise Exception.Create('Não foi possível Atualizar o Saldo do Dia' + #13 +
                                         'Dia: ' + qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Operação: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                         'Investimento: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRP.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               if not qryBuscaBoletaTRP.FieldByName('IDOPERCUSTODIA').IsNull then
               begin
                  OperComum.InsereHistCustodiaDestino(qryBuscaBoletaTRP.FieldByName('IDOPERCUSTODIA').AsInteger,
                                                      qryBuscaBoletaTRP.FieldByName('IDMOTIVOBLOQUEIO').Asinteger,
                                                      qryBuscaBoletaTRP.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                      qryBuscaBoletaTRP.FieldByName('IDINVESTIMENTO').AsInteger,
                                                      qryBuscaBoletaTRP.FieldByName('IDCUSTODIANTE').AsInteger,
                                                      '',
                                                      qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsDateTime,
                                                      qryBuscaBoletaTRP.FieldByName('QTDEOPERACAO').AsFloat,
                                                      iIdHistCustodiaDest,
                                                      qryBuscaBoletaTRP.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                      0);

                  if not OperacaoInvest.AtualizaSaldosCustodia then
                     Raise Exception.Create('Não foi possível Atualizar os Saldos da Custódia' + #13 +
                                            'Dia: ' + qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRP.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

                  if not ExecutaQuery(QryAux, 'UPDATE OPERCUSTODIA SET '+
                                              'OPERCUSTODIA.IDCUSTODIADEST    = ' + IntToStr(iIdHistCustodiaDest) + ', ' +
                                              'OPERCUSTODIA.IDHISTCARTINVDEST = ' + IntToStr(iIdHistCartInvDest) + ' ' +
                                              'WHERE  OPERCUSTODIA.IDOPERCUSTODIA = ' + qryBuscaBoletaTRP.FieldByName('IDOPERCUSTODIA').AsString) then
                     Raise Exception.Create('Não foi possível atualizar os históricos de custódia' + #13 +
                                            'Dia: ' + qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRP.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');

               end;

               if qryBuscaBoletaTRP.FieldByName('IDCARTEIRAGERENC').IsNull then
               begin
                  wTipoRecDesBol := '';
                  //AL_135 - Contabiliza por Plano/Patro
                  OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                          qryBuscaBoletaTRP.FieldByName('IDINVESTIMENTO').AsInteger,
                                          qryBuscaBoletaTRP.FieldByName('IDTIPOOPERACAO').AsInteger,
                                          qryBuscaBoletaTRP.FieldByName('IDOPERACAOINVEST').AsInteger,
                                          qryBuscaBoletaTRP.FieldByName('IDEMISSOR').AsInteger,
                                          qryBuscaBoletaTRP.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          pRPI.MOECODIGO, '','','','','',
                                          wTipoRecDesBol,
                                          bCriaLancto,
                                          0, fValorOper,
                                          qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsDateTime,
                                          qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsDateTime,
                                          iPlano,iPlanilha,iDocumento,
                                          wMensErro,'N',False,False, 0, True,
                                          qryBuscaBoletaTRP.FieldByName('IDPLANPREVCTBPATR').AsInteger);
                  if Trim(wMensErro) <> '' then
                     Raise Exception.Create('Não foi possível Contabilizar:' + #13 +
                                            'Dia: ' + qryBuscaBoletaTRP.FieldByName('DATAOPERACAO').AsString + #13 +
                                            'Operação: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                            'Investimento: ' + Trim(qryBuscaBoletaTRP.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                            'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRP.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                            'O Processo será Cancelado');
               end;
            end;

            // Atualiza a Boleta com a Planilha
            with dtmOperComum.qryLocal do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' UPDATE BOLETA SET ');
               if iPlano    > 0 then
                  SQL.Add(' BOLETA.PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ')
               else
                  SQL.Add(' BOLETA.PLANO     = NULL,');
               if iPlanilha > 0 then
                  SQL.Add(' BOLETA.PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilha)) + ' ')
               else
                  SQL.Add(' BOLETA.PLNCODIGO = NULL ');
               SQL.Add('WHERE BOLETA.IDBOLETA = ' + QuotedStr(sBoleta) + ' ');
               ExecSQL;
            end;

            qryBuscaBoletaTRP.Next;

         end;
         //AL_120 - Fim
         Result := True;
      end;
   finally
      FreeAndNil(CtrlRV);
   end;
end;

//AL_137
function TRendaVariavel.LancaBoletaTRI(dDataProc: TDateTime; iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var
    iIdHistCartInv : Integer;
    sBoleta: String;
    CtrlRV: TCtrlRendaVariavel;
    fSaldoCPMF : Double;
begin
   try
      Result := False;
      CtrlRV := TCtrlRendaVariavel.Create;
      CtrlRV.InitializeAs(Padroes);
      with DMRendaVariavel, OperComum, OperacaoInvest do
      begin
         sBoleta := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         //Inicio - Novo reprocessamento linear
         LimpaParametros(qryBuscaBoletaTRI);
         qryBuscaBoletaTRI.ParamByName('IDBOLETA').AsString := sBoleta;
         qryBuscaBoletaTRI.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         qryBuscaBoletaTRI.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         qryBuscaBoletaTRI.Open;
         qryBuscaBoletaTRI.First;
         while not qryBuscaBoletaTRI.Eof do
         begin
            if iPlanPrev = 0 then
               iPlanPrev := iPlanPrevCtbPatro;
            CtrlRV.BuscaSaldoRV.Executa(qryBuscaBoletaTRI.FieldByName('DATAOPERACAO').AsDateTime,
                                        qryBuscaBoletaTRI.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                        qryBuscaBoletaTRI.FieldByName('IDINVESTIMENTO').AsInteger,
                                        qryBuscaBoletaTRI.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        qryBuscaBoletaTRI.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                        High(Integer));

            If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                              qryBuscaBoletaTRI.FieldByName('IDINVESTIMENTO').AsInteger,
                                              2,
                                              qryBuscaBoletaTRI.FieldByName('IDOPERACAOINVEST').AsInteger,
                                              -1,
                                              qryBuscaBoletaTRI.FieldByName('IDTIPOOPERACAO').AsInteger,
                                              qryBuscaBoletaTRI.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                              qryBuscaBoletaTRI.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                              -1, -1, -1, -1, -1,
                                              qryBuscaBoletaTRI.FieldByName('DATAOPERACAO').AsDateTime,
                                              CtrlRV.BuscaSaldoRV.SaldoVlrTotal,
                                              CtrlRV.BuscaSaldoRV.SaldoQtdTotal,
                                              pRPI.VLRCOTAINICART,
                                              0,0,0,0,0,0,0,0,0,
                                              'X','X',
                                              qryBuscaBoletaTRI.FieldByName('IDLOTE').AsString,
                                              Trim(qryBuscaBoletaTRI.FieldByName('DESCTIPOOPERACAO').AsString)+ ' / '+
                                                   Trim(qryBuscaBoletaTRI.FieldByName('DESCINVESTIMENTO').AsString),
                                              'TRI', '', '', True, -1,
                                              qryBuscaBoletaTRI.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                              iIdHistCartInv) Then
               Raise Exception.Create('Não foi possível Alimentar a Carteira' + #13 +
                                      'Dia: ' + qryBuscaBoletaTRI.FieldByName('DATAOPERACAO').AsString + #13 +
                                      'Operação: ' + Trim(qryBuscaBoletaTRI.FieldByName('DESCTIPOOPERACAO').AsString) + #13 +
                                      'Investimento: ' + Trim(qryBuscaBoletaTRI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                      'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                      'O Processo será Cancelado');

               If Not OperComum.AtualizaSaldos(1,-1) Then
                  Raise Exception.Create('Não foi possível Atualizar o Saldo ' + #13 +
                                         'Dia ' + qryBuscaBoletaTRI.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Investimento ' + Trim(qryBuscaBoletaTRI.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                         'Carteira: '  + Trim(qryBuscaBoletaTRI.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                         'Plano/Patrocinadora: '  + Trim(qryBuscaBoletaTRI.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                         'O Processo será Cancelado');

               if qryBuscaBoletaTRI.FieldByName('IDTIPOOPERACAO').AsInteger = -162 then // TRC de CC para CCI
                  fSaldoCPMF := CtrlRV.BuscaSaldoRV.SaldoQtdCC - qryBuscaBoletaTRI.FieldByName('QTDEOPERACAO').AsFloat
               else if qryBuscaBoletaTRI.FieldByName('IDTIPOOPERACAO').AsInteger = -163 then // TRC de CCI para CC
                  fSaldoCPMF := CtrlRV.BuscaSaldoRV.SaldoQtdCC + qryBuscaBoletaTRI.FieldByName('QTDEOPERACAO').AsFloat;

               ExecutaQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET HISTCARTINV.SALDOQTDECPMF = '+TrocaVirgulaPonto(FloatToStr(fSaldoCPMF))+','+
                                                  ' HISTCARTINV.FLGCUSTODIA = NULL '+
                                                  ' WHERE HISTCARTINV.IDHISTCARTINV = '+IntToStr(iIdHistCartInv));
            qryBuscaBoletaTRI.Next;

         end;
         Result := True;
      end;
   finally
      FreeAndNil(CtrlRV);
   end;
end;

//Al_137
function TRendaVariavel.TransfEntreCCeCCI(CdsSldTRCCCeCCISintetico : TClientDataSet;
                                          iTipoOperacao : Integer;
                                          sBoleta, sObs : String;
                                          iCustEx: Integer = -1): boolean;
Var
   fQtdTransf, fSaldoAquiPro, fSaldoVariacaoPro, fSaldoIrApuPro, fValorOper, fSaldoCPMF : Double;
   sTipoOperacao, sMens1, sMens2 : String;
   CdsSldTRCCCeCCIAnalitico  : TClientDataSet;
   CdsOperacaoInvest : TClientDataSet;
   CtrlRendaVariavel : TCtrlRendaVariavel;
begin
   Result := True;
   Try
      CtrlRendaVariavel := TCtrlRendaVariavel.Create;
      CtrlRendaVariavel.InitializeAs(Padroes);

      CdsSldTRCCCeCCIAnalitico := TClientDataSet.Create(nil);
      CdsOperacaoInvest       := TClientDataSet.Create(nil);

      CtrlRendaVariavel.CdsOperacaoInvest := CdsOperacaoInvest;
      CdsOperacaoInvest.Data := CtrlRendaVariavel.ListOperacaoInvest(0);

      // Inicia o Processo
      Try
         // Busca os Saldos na Carteira
         CdsSldTRCCCeCCISintetico.First;

         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('', CdsSldTRCCCeCCISintetico.RecordCount);

         while not CdsSldTRCCCeCCISintetico.EOF do
         begin
            sMens1 := 'Transferindo ' + CdsSldTRCCCeCCISintetico.FieldByName('DESCINVESTIMENTO').AsString;

            if Assigned(AtualizaProcFech) then
               AtualizaProcFech(sMens1, 0);

            //Busca os Saldos Aberto por Carteiras Gerenciais
            CdsSldTRCCCeCCIAnalitico.Data := CtrlRendaVariavel.BuscaSldTRCCCeCCIAnalitico(CdsSldTRCCCeCCISintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                                                          CdsSldTRCCCeCCISintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                                          CdsSldTRCCCeCCISintetico.FieldByName('IDPLANPREVCTBORIG').AsInteger,
                                                                                          CdsSldTRCCCeCCISintetico.FieldByName('IDCARTEIRAINVEST').AsInteger);
            CdsSldTRCCCeCCIAnalitico.First;
            while not CdsSldTRCCCeCCIAnalitico.EOF do
            begin
               if not CtrlRendaVariavel.BuscaSaldoRV.Executa(CdsSldTRCCCeCCISintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                             CdsSldTRCCCeCCISintetico.FieldByName('IDPLANPREVCTBORIG').AsInteger,
                                                             CdsSldTRCCCeCCISintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                             CdsSldTRCCCeCCISintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                             CdsSldTRCCCeCCIAnalitico.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                             9999999) then
                  Raise Exception.Create('Não foi encontrado Saldo para o Investimento.');

               fValorOper := 0;

               sMens2 := sMens2 + FormatFloat('###,###,###,##0', fQtdTransf);
               if Assigned(AtualizaProcFech) then
                  AtualizaProcFech(sMens1 + #13 + sMens2, 0);

               // Verifica se possui saldo para transferir.
               if iTipoOperacao = -162 then // TRC de CC para CCI
               begin
                  fQtdTransf := CdsSldTRCCCeCCISintetico.FieldByName('QTDTRANSFERIDOCC').AsFloat;
                  if not CdsSldTRCCCeCCIAnalitico.FieldByName('IDCARTEIRAGERENC').IsNull then
                     fQtdTransf := (CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCC * CdsSldTRCCCeCCISintetico.FieldByName('PERCTRANSFERIDO').AsFloat) / 100;
                  if CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCC < fQtdTransf then
                     Raise Exception.Create('A Quantidade é superior ao saldo para transferência.');
               end
               else if iTipoOperacao = -163 then // TRC de CCI para CC
               begin
                  fQtdTransf := CdsSldTRCCCeCCISintetico.FieldByName('QTDTRANSFERIDOCCI').AsFloat;
                  if not CdsSldTRCCCeCCIAnalitico.FieldByName('IDCARTEIRAGERENC').IsNull then
                     fQtdTransf := (CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCCI * CdsSldTRCCCeCCISintetico.FieldByName('PERCTRANSFERIDO').AsFloat) / 100;
                  if CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCCI < fQtdTransf then
                     Raise Exception.Create('A Quantidade é superior ao saldo para transferência.');
               end;

               // Pesquisa se Boleta ja tem Registro na Tabela de Boletas
               OperComum.LimpaParametros(dtmOperComum.QryBoleta);
               dtmOperComum.QryBoleta.ParamByName('IDBOLETA').AsString := sBoleta;
               dtmOperComum.QryBoleta.Open;

               // Caso não tenha, cria um registro
               If dtmOperComum.QryBoleta.IsEmpty Then
               begin
                  sBoleta :=  'RV-'+Copy(DateToStr(CdsSldTRCCCeCCISintetico.FieldByName('DATAOPERACAO').AsDateTime),9,2)+'/'+FormatFloat('0000',
                               LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(DateToStr(CdsSldTRCCCeCCISintetico.FieldByName('DATAOPERACAO').AsDateTime),9,2)));

                  // Não leva o IDFORCLI em função do LOTE da Boleta
                  ExecutaQuery(dtmOperComum.QryAuxiliar,'INSERT INTO BOLETA (IDBOLETA, DATABOLETA, STATUS, TIPMOVBOLETA) VALUES ('+
                                         QuotedStr(sBoleta)+', TO_DATE('+
                                         QuotedStr(DateToStr(CdsSldTRCCCeCCISintetico.FieldByName('DATAOPERACAO').AsDateTime))+',''DD/MM/YYYY''), '+
                                         ' ''F'''+',''TRI'')');
               end;

               // Capta a descrição do Tipo de Operação no cadastro
               dtmOperComum.QryLocal.Close;
               dtmOperComum.QryLocal.Sql.Clear;
               dtmOperComum.QryLocal.Sql.Add('SELECT DESCTIPOOPERACAO FROM TIPOOPERACAO ');
               dtmOperComum.QryLocal.Sql.Add('WHERE (IDTIPOOPERACAO = '+ IntToStr(iTipoOperacao)+')');
               dtmOperComum.QryLocal.Open;
               sTipoOperacao   := dtmOperComum.QryLocal.FieldByName('DESCTIPOOPERACAO').AsString;
               if dtmOperComum.QryLocal.eof then
               begin
                  dtmOperComum.QryLocal.Close;
                  Raise Exception.Create('Não foi encontrado o Tipo de Operação = '+IntToStr(iTipoOperacao)+'!'+#13+
                                         'Verifique o cadastro de Tipos de Operação.');
               end;

               //Grava OperacaoInvest
               if not CtrlRendaVariavel.AplicaAtualOperacaoInvest(CdsSldTRCCCeCCISintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                                  0, 0, 0, 0, 0, 0,
                                                                  iTipoOperacao,
                                                                  2,
                                                                  CdsSldTRCCCeCCISintetico.FieldByName('IDPLANPREVCTBORIG').AsInteger,
                                                                  -1, -1,
                                                                  Sistema.IdModulo,
                                                                  CdsSldTRCCCeCCISintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                  CdsSldTRCCCeCCISintetico.FieldByName('IDEMISSOR').AsInteger,
                                                                  -1, -1,
                                                                  CdsSldTRCCCeCCISintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                  CdsSldTRCCCeCCIAnalitico.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                                  -1, -1, -1, -1, -1, -1, -1,
                                                                  Sistema.IdEmpresa,
                                                                  -1,
                                                                  fValorOper, 0, fQtdTransf,
                                                                  CdsSldTRCCCeCCISintetico.FieldByName('PERCTRANSFERIDO').AsFloat,
                                                                   0, 0, 0, 0, 0, 0,
                                                                   'O', sObs, sBoleta) then
                  Raise Exception.Create('Não foi possível gravar a operação.');

               // Baixa no Plano Origem
               If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                                 CdsSldTRCCCeCCISintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 2,
                                                 CtrlRendaVariavel.IdOperacaoInvest,
                                                 -1,iTipoOperacao,
                                                 CdsSldTRCCCeCCISintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                 CdsSldTRCCCeCCIAnalitico.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                 -1,-1,-1,-1,-1,
                                                 CdsSldTRCCCeCCISintetico.FieldByName('DATAOPERACAO').AsDateTime,
                                                 CtrlRendaVariavel.BuscaSaldoRV.SaldoVlrTotal,
                                                 CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal,
                                                 1,0,0,0,0,0,0,0,0,0,
                                                 'X','X','',
                                                 sTipoOperacao + ' : ' + CdsSldTRCCCeCCISintetico.FieldByName('DESCINVESTIMENTO').AsString,
                                                 'TRI', '', '', True, -1,
                                                 CdsSldTRCCCeCCISintetico.FieldByName('IDPLANPREVCTBORIG').AsInteger,
                                                 iIdHistCartInv) Then
                  Raise Exception.Create('Não foi possível alimentar a carteira com essa operação!');

               if iTipoOperacao = -162 then // TRC de CC para CCI
                  fSaldoCPMF := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCC - fQtdTransf
               else if iTipoOperacao = -163 then // TRC de CCI para CC
                  fSaldoCPMF := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCC + fQtdTransf;

               if not OperComum.AtualizaSaldos(1,-1) Then
                  Raise Exception.Create('Não foi possível atualizar o saldo ' + #13 +
                                         'Data ' + DateToStr(CdsSldTRCCCeCCISintetico.FieldByName('DATAOPERACAO').AsDateTime) + #13 +
                                         'Operação' + sTipoOperacao + #13 +
                                         'Investimento ' + CdsSldTRCCCeCCISintetico.FieldByName('DESCINVESTIMENTO').AsString);

               ExecutaQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET SALDOQTDECPMF = '+TrocaVirgulaPonto(FloatToStr(fSaldoCPMF))+','+
                                                  ' FLGCUSTODIA = NULL '+
                                                  ' WHERE IDHISTCARTINV = '+IntToStr(iIdHistCartInv));

               if CdsSldTRCCCeCCISintetico.FieldByName('DATAOPERACAO').AsDateTime < pRPI.DATAULTFECH then
               begin

                  if Assigned(AtualizaProcFech) then
                     AtualizaProcFech(sMens1 + #13 + 'Marcando para Reprocessamento', 0);

                  // Carteira Origem
                  if not RendaVariavel.MarcarFlagReproc(CdsSldTRCCCeCCISintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                        CdsSldTRCCCeCCISintetico.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                        CdsSldTRCCCeCCISintetico.FieldByName('IDPLANPREVCTBORIG').AsInteger,
                                                        CdsSldTRCCCeCCISintetico.FieldByName('DATAOPERACAO').AsDateTime) then
                     Raise Exception.Create('Não foi possível marcar ' + CdsSldTRCCCeCCISintetico.FieldByName('DESCINVESTIMENTO').AsString + 'para Reprocessamento no Plano de Origem.');

               end;
               CdsSldTRCCCeCCIAnalitico.Next;
               if Assigned(AtualizaProcFech) then
                  AtualizaProcFech('');
            end;

            CdsSldTRCCCeCCISintetico.Next
         end;
      Except
         On E:Exception Do
         Begin
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         End;
      End;
  Finally
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('', -2);
      FreeAndNil(CtrlRendaVariavel);
      FreeAndNil(CdsSldTRCCCeCCIAnalitico);
      FreeAndNil(CdsOperacaoInvest);
  end;
end;

//AL_149
function TRendaVariavel.PermiteUtilizarCarteiraGerenc(DataOperacao: TDateTime; Var sMens: String): Boolean;
begin
  Result := True;
  If (((prpi.FLGCARTGERENC = 'N')or (pRPI.FLGCARTGERENC = '')) and (DataOperacao > prpi.DATAMOVCDBLIB)) then //Significa que parou de usar apos a data
      begin
        sMens:= 'O Sistema não utiliza Cateira Gerencial desde '+ datetostr(prpi.DATAMOVCDBLIB);
        Result := False;
      end;

  If (((prpi.FLGCARTGERENC = 'N')or (pRPI.FLGCARTGERENC = '')) and (prpi.DATAMOVCDBLIB = 0)) then // Significa que nunca utilizou Carteira Gerencial
     begin
        sMens:= 'O Sistema não utiliza Cateira Gerencial.';
        Result := False;
      end;

end;

//Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
function TRendaVariavel.MontaAtuSldInvRV(dDataRef: TDateTime;
                                         iIdInvestimento, iIdCarteiraInvest, iIdPlanoPrev: Integer): Boolean;
var sSql : String;
begin
   try
     sSql := '';
     sSql := sSql + ' SELECT HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO, '+ #13 +
                    '        HC.IDLOTE, IV.DESCINVESTIMENTO,IV.IDTIPOINVEST, CI.FLGCALCDIARIO, '+ #13 +
                    '        AC.FLGPROVISIONAIR AS FLGIRRVA, IV.IDEMISSOR, HC.IDPLANPREVCTBPATR, '+ #13 +
                    '        PP.PLANPRVCONTABPATRO, CA.DESCCARTINVEST '+ #13 +
                    ' FROM HISTCARTINV HC, INVESTIMENTO IV, CARTEIRAINVEST CI, ACAO AC, '+ #13 +
                    '      VWPLANPREVCTBPATR PP, VWCARTEIRASRV CA '+ #13 +
                    ' WHERE (HC.IDTIPOINVEST      = 2 ) '+ #13;
     if iIdPlanoPrev > 0 then
        sSql := sSql +'   AND (HC.IDPLANPREVCTBPATR = '+IntToStr(iIdPlanoPrev)+') '+ #13;
     if iIdCarteiraInvest > 0 then
        sSql := sSql +'   AND (HC.IDCARTEIRAINVEST  = '+IntToStr(iIdCarteiraInvest)+') '+ #13;
     if iIdInvestimento > 0 then
        sSql := sSql +'   AND (HC.IDINVESTIMENTO    = '+IntToStr(iIdInvestimento)+') '+ #13;
     if dDataRef > 0 then
        sSql := sSql +'   AND (HC.DATAMOVCARTINV   <= TO_DATE('+QuotedStr(DateToStr(dDataRef))+','+QuotedStr('DD/MM/YYYY')+')) '+ #13;

     sSql := sSql +'   AND (((HC.IDCARTEIRAGERENC IS NULL) AND (CA.IDCARTEIRAGERENC IS NULL)) OR (HC.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC)) '+ #13 +
                   '   AND (HC.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) '+ #13 +
                   '   AND (HC.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST) '+ #13 +
                   '   AND (IV.FLGATIVO         = ''S'') '+ #13 +
                   '   AND (HC.IDTIPOINVEST     = IV.IDTIPOINVEST) '+ #13 +
                   '   AND (HC.IDINVESTIMENTO   = IV.IDINVESTIMENTO) '+ #13 +
                   '   AND (HC.IDINVESTIMENTO   = AC.IDACAO(+)) '+ #13 +
                   '   AND (HC.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR) '+ #13 +
                   '   GROUP BY  HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO, '+ #13 +
                   '             HC.IDLOTE, IV.DESCINVESTIMENTO,IV.IDTIPOINVEST, CI.FLGCALCDIARIO, '+ #13 +
                   '             AC.FLGPROVISIONAIR, IV.IDEMISSOR, HC.IDPLANPREVCTBPATR, '+ #13 +
                   '             PP.PLANPRVCONTABPATRO, CA.DESCCARTINVEST '+ #13 +
                   '   ORDER BY IV.DESCINVESTIMENTO, PP.PLANPRVCONTABPATRO, HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC NULLS FIRST '+ #13;

     DMRendaVariavel.qryAtuSldInvRV.SQL.Clear;
     DMRendaVariavel.qryAtuSldInvRV.SQL.Add(sSql);
     DMRendaVariavel.qryAtuSldInvRV.Open;

     Result := True;
   Except
     Result := False;
   end;
end;

//Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
function TRendaVariavel.BuscaDataAntBloqContab(dDataRef: TDateTime): TDateTime;
var
    iAno, iMes : Integer;
begin

   Result := CtrlInvContab.BuscaDataBloqContab(dDataRef);

   if Result = 0 then
      Result := dDataRef;

   iAno   := DiasUteisInv.ExtraiAno(Result);

   iMes   := DiasUteisInv.ExtraiMes(Result);

   if iMes = 1 then
   begin
      iAno := iAno - 1;
      iMes := 12;
   end
   else
      iMes := iMes - 1;

   Result  := DiasUteisInv.PrimeiroDiaUtilPosterior(StrToDate('01/'+IntToStr(iMes)+'/'+IntToStr(iAno)),-1,1,'',True,False,False);
end;

//SOL 122382 Kintana 605342 Thiago Passos - 21/08/2009
function TRendaVariavel.SincronizacaCotacaoAcaoXCotacaoInvest(
  iInvestimento: integer; dDataCotacao: TDateTime): Boolean;
  var
  sPLSQL:string;
  QrySincroniza:TwwQuery;
  iInv:integer;
  sData:String;
begin
   Result := True;
   QrySincroniza := TwwQuery.Create(Application);
   QrySincroniza.DatabaseName := 'BaseDados';
   iInv:=iInvestimento;
   sData := DateToStr(dDataCotacao);
   sPLSQL:='';
   sPLSQL := ' DECLARE  ' ;
   sPLSQL:= sPLSQL + ' vAcaoidacao           NUMBER;     ';
   sPLSQL:= sPLSQL + ' vAaodatacotaacao      DATE;       ';
   sPLSQL:= sPLSQL + ' vAcaovlrmedia         NUMBER;     ';
   sPLSQL:= sPLSQL + ' vAcaoqtdelote         NUMBER;     ';
   sPLSQL:= sPLSQL + ' vAcaotrgdtinclusao    DATE;       ';
   sPLSQL:= sPLSQL + ' vAcaotrguserinclusao  VARCHAR2(100);       ';
   sPLSQL:= sPLSQL + ' vInvdatacotacao       DATE;        ';
   sPLSQL:= sPLSQL + ' vInvidinvestimento    NUMBER;     ';
   sPLSQL:= sPLSQL + ' vInvvlrcontabil       NUMBER;     ';
   sPLSQL:= sPLSQL + ' vInvvlrgerencial      NUMBER;     ';
   sPLSQL:= sPLSQL + ' vInvqtdtitlote        NUMBER;     ';
   sPLSQL:= sPLSQL + ' vInvtrgdtinclusao     DATE;       ';
   sPLSQL:= sPLSQL + ' vInvtrguserinclusao   VARCHAR2(100);       ';
   sPLSQL:= sPLSQL + '  BEGIN                            ';

   sPLSQL:= sPLSQL + '    SELECT acao.idacao,acao.datacotaacao,acao.vlrmedia,acao.qtdelote,acao.trgdtinclusao ,acao.trguserinclusao  ';
   sPLSQL:= sPLSQL + '                       ,inv.datacotacao,inv.idinvestimento,inv.vlrcontabil,inv.vlrgerencial,inv.qtdtitlote,inv.trgdtinclusao,inv.trguserinclusao ';
   sPLSQL:= sPLSQL + '        INTO                                                                                                      ';
   sPLSQL:= sPLSQL + '          vAcaoidacao,vAaodatacotaacao,vAcaovlrmedia,vAcaoqtdelote,vAcaotrgdtinclusao,vAcaotrguserinclusao,vInvdatacotacao ';
   sPLSQL:= sPLSQL + '                       ,vInvidinvestimento,vInvvlrcontabil,vInvvlrgerencial,vInvqtdtitlote,vInvtrgdtinclusao,vInvtrguserinclusao        ';

   sPLSQL:= sPLSQL + '                 FROM cotacaoacao acao, cotacaoinvest inv ';
   sPLSQL:= sPLSQL + '                 WHERE acao.idacao = ' + IntToStr(iInv);
   sPLSQL:= sPLSQL + '                 AND   acao.datacotaacao = TO_DATE('+ QuotedStr(sData) +',''dd/mm/yyyy'') ';
   sPLSQL:= sPLSQL + '                 AND   inv.idinvestimento(+) = acao.idacao ' ;
   sPLSQL:= sPLSQL + '                 AND   inv.datacotacao(+) = acao.datacotaacao;' ;
   sPLSQL:= sPLSQL + '        BEGIN ' ;

   sPLSQL:= sPLSQL + '           IF vInvdatacotacao IS NULL THEN  ' ;
   sPLSQL:= sPLSQL + '              INSERT INTO COTACAOINVEST (datacotacao,idinvestimento,vlrcontabil,vlrgerencial,qtdtitlote,trgdtinclusao,trguserinclusao) ' ;
   sPLSQL:= sPLSQL + '                                 VALUES (vAaodatacotaacao,vAcaoidacao,vAcaovlrmedia,vAcaovlrmedia,vAcaoqtdelote,vAcaotrgdtinclusao,vAcaotrguserinclusao); ';

   sPLSQL:= sPLSQL + '           END IF; ' ;
   sPLSQL:= sPLSQL + '           IF vInvdatacotacao IS NOT NULL THEN ';
   sPLSQL:= sPLSQL + '              UPDATE COTACAOINVEST SET vlrcontabil  = vAcaovlrmedia ' ;
   sPLSQL:= sPLSQL + '                                    , vlrgerencial = vAcaovlrmedia ' ;
   sPLSQL:= sPLSQL + '                                    , qtdtitlote   = vAcaoqtdelote ' ;
   sPLSQL:= sPLSQL + '              WHERE idinvestimento = vAcaoidacao ' ;
   sPLSQL:= sPLSQL + '              AND   datacotacao    = vAaodatacotaacao; ' ;

   sPLSQL:= sPLSQL + '           END IF; ' ;

   sPLSQL:= sPLSQL + '          IF vAcaoidacao IS NULL THEN '  ;
   sPLSQL:= sPLSQL + '            DELETE FROM COTACAOINVEST ' ;
   sPLSQL:= sPLSQL + '             WHERE idinvestimento = '+ IntToStr(iInv) ;
   sPLSQL:= sPLSQL + '             AND   datacotacao    = TO_DATE(' +QuotedStr(sData)+',''dd/mm/yyyy''); '  ;
   sPLSQL:= sPLSQL + '          END IF; ';
   sPLSQL:= sPLSQL + '        END; '  ;
   sPLSQL:= sPLSQL + '  END; '  ;
   Try
     QrySincroniza.Close;
     QrySincroniza.SQL.Clear;
     QrySincroniza.SQL.Add(sPLSQL);
     QrySincroniza.ExecSQL;
     QrySincroniza.Close;     
     FreeAndNil(QrySincroniza);
   except on E: Exception do
      begin
        FreeAndNil(QrySincroniza);
        showmessage(e.Message);
        Result:=False;
      end;  
   end;
end;

function TRendaVariavel.GravaREP(iPlanPrev, iInvestimento, iCarteira : Integer; dDataRef : TDateTime; var sMessage : String) : Boolean;
var qryGravaREP : TwwQuery;
begin
   Try
      Try
         // Se nâo existir, Inclui um REP saldo = 0 para o Reprocessamento
         qryGravaREP := TwwQuery.Create(Application);
         qryGravaREP.DatabaseName := 'BaseDados';

         // Marca se o Plano não foi passado ou se é o plano passado
         qryGravaREP.Close;
         qryGravaREP.SQL.Clear;
         qryGravaREP.SQL.Add('INSERT INTO HISTCARTINV (IDHISTCARTINV,IDTIPOINVEST, IDMODULO, IDEMPRESAPROP,IDINVESTIMENTO, ');
         qryGravaREP.SQL.Add('                         IDCARTEIRAINVEST, DATAMOVCARTINV, VLRMOVCARTINV, SALDOVLRINVCART, SALDOQTDEINVCART, ');
         qryGravaREP.SQL.Add('                         HISTMOVCARTINV, NATURMOVCARTINV, TIPMOVCARTINV, FLGCALCSALDO, SALDOAQUI, SALDOVARIACAO, ');
         qryGravaREP.SQL.Add('                         IDPLANPREVCTBPATR, SALDOQTDECPMF) VALUES (');
         qryGravaREP.SQL.Add(' '+ IntToStr(LeUltRegistro(Nil,'HISTCARTINV')) + ',');
         qryGravaREP.SQL.Add(' 2, ' + IntToStr(Sistema.IdModulo) + ',');
         qryGravaREP.SQL.Add(' ' + IntToStr(Sistema.IdEmpresa) + ',');
         qryGravaREP.SQL.Add(' ' + IntToStr(iInvestimento) + ',');
         qryGravaREP.SQL.Add(' ' + IntToStr(iCarteira)  + ',');
         qryGravaREP.SQL.Add('    TO_DATE(' + QuotedStr(DateToStr(dDataRef - 1)) + ',' + QuotedStr('DD/MM/YYYY') + '), ');
         qryGravaREP.SQL.Add(' 0,0,0,');
         qryGravaREP.SQL.Add(' ' + QuotedStr('Saldo Temporário para Reprocessamento') + ', ');
         qryGravaREP.SQL.Add(' ' + QuotedStr('X') + ', ');
         qryGravaREP.SQL.Add(' ' + QuotedStr('REP') + ', ');
         qryGravaREP.SQL.Add(' ' + QuotedStr('5') + ', ');
         qryGravaREP.SQL.Add(' 0,0,');
         qryGravaREP.SQL.Add(' ' + IntToStr(iPlanPrev) + ', 0)');
         qryGravaREP.ExecSql;

         Result := True;
      except
         on E: Exception do
         begin
            Result := False;
            sMessage := E.Message;
         end;
      end;
   finally
      FreeAndNil(qryGravaREP);
   end;
end;

function TRendaVariavel.AtualizaTotLiqBoleta(sBoleta : String; dDataOper : TDateTime; var sMessage : String) : Boolean;
var qryAuxLocal   : TwwQuery;
    fTotalLiquido : Double;
begin
   Try
      Try
         fTotalLiquido := 0;

         RendaVariavel.BuscaVlrLiqBoleta(sBoleta, fTotalLiquido);

         qryAuxLocal := TwwQuery.Create(Application);
         qryAuxLocal.DataBaseName := 'BASEDADOS';

         qryAuxLocal.sql.Add(' UPDATE HISTCARTINV SET HISTCARTINV.VLRTOTLIQUIDAR  = '+TrocaVirgulaPonto(FloatToStr(Abs(fTotalLiquido)))+' '+
                             ' WHERE HISTCARTINV.IDOPERACAOINVEST IN (SELECT OPERACAOINVEST.IDOPERACAOINVEST ' +
                             '                                        FROM OPERACAOINVEST ' +
                             '                                        WHERE OPERACAOINVEST.NUMDOCUMENTO = ' + QuotedStr(sBoleta) + ') ' +
                             '   AND HISTCARTINV.DATAMOVCARTINV = TO_DATE('''+DateToStr(dDataOper)+''',''DD/MM/YYYY'') ');
         qryAuxLocal.ExecSQL;
         qryAuxLocal.Close;         

         Result := True;
      except
         on E: Exception do
         begin
            Result := False;
            sMessage := E.Message;
         end;
      end;
   finally
      if qryAuxLocal <> nil then
         FreeAndNil(qryAuxLocal);
   end;
end;

function TRendaVariavel.LancaCancelamentoDireitos(
  dDataOper: TDateTime): Boolean;
var  fVlrCancelado, fQtdCancelado, fVlrRec, fIRRec, fRemuneracaoRec, fIRRemuneracaoRec, fQtdExerc, fVlrExerc: Double;
     iIdOperDirAnt, iTipoOperAnt, iIdPlanPrevAnt, iIdForCliAnt, iIdForCli, iOper, iRec, iCount :Integer;
     sNumDoc, sDataOperAnt : String;
begin
   try
      try
         with DMRendaVariavel do
         begin
            OperComum.LimpaParametros(DMRendaVariavel.qryTipoOperCan);
            qryTipoOperCan.Open;

            OperComum.LimpaParametros(DMRendaVariavel.QryBuscaVendasDia);
            QryBuscaVendasDia.ParamByName('DATAOPERACAO').AsString := DateToStr(dDataOper);
            QryBuscaVendasDia.Open;
            while not QryBuscaVendasDia.eof do
            begin
               OperComum.LimpaParametros(DMRendaVariavel.QryVerDireitosCancelar);
               QryVerDireitosCancelar.ParamByName('DATAOPERACAO').AsString := DateToStr(dDataOper);
               QryVerDireitosCancelar.ParamByName('IDINVESTIMENTO').AsInteger :=
                                      QryBuscaVendasDia.FieldByName('IDINVESTIMENTO').AsInteger;
               QryVerDireitosCancelar.ParamByName('IDCARTEIRAINVEST').AsInteger :=
                                      QryBuscaVendasDia.FieldByName('IDCARTEIRAINVEST').AsInteger;
               QryVerDireitosCancelar.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                      QryBuscaVendasDia.FieldByName('IDPLANPREVCTBPATR').AsInteger;
               QryVerDireitosCancelar.Open;
               while not QryVerDireitosCancelar.eof do
               begin

                  OperComum.LimpaParametros(DMRendaVariavel.QryInvestimentoAcao);
                  QryInvestimentoAcao.ParamByName('IDEMISSOR').AsInteger       := QryVerDireitosCancelar.FieldByName('IDEMISSOR').AsInteger;
                  QryInvestimentoAcao.ParamByName('IDINVESTIMENTO').AsInteger  := QryVerDireitosCancelar.FieldByName('IDINVESTIMENTO').AsInteger;
                  QryInvestimentoAcao.ParamByName('DATACOTACAO').AsString      := DateToStr(dDataOper);
                  QryInvestimentoAcao.Open;

                  OperComum.LimpaParametros(DMRendaVariavel.qryCancelamento);
                  qryCancelamento.ParamByName('DATACOM').AsString             := DateToStr(dDataOper);
                  qryCancelamento.ParamByName('IDCARTEIRAINVEST').AsInteger   := QryVerDireitosCancelar.FieldByName('IDCARTEIRAINVEST').AsInteger;
                  qryCancelamento.ParamByName('IDPLANPREVCTBPATR').AsInteger  := QryVerDireitosCancelar.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                  qryCancelamento.ParamByName('IDCUSTODIANTE').AsInteger      := QryVerDireitosCancelar.FieldByName('IDCUSTODIANTE').AsInteger;
                  if not QryVerDireitosCancelar.FieldByName('IDMOTIVOBLOQUEIO').IsNull then
                     qryCancelamento.ParamByName('IDMOTIVOBLOQUEIO').AsInteger:= QryVerDireitosCancelar.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
                  qryCancelamento.ParamByName('IDOPERACAODIREITO').AsInteger  := QryVerDireitosCancelar.FieldByName('IDOPERACAODIREITO').AsInteger;
                  qryCancelamento.ParamByName('FLGSTATUSFECHBOL').AsString    := 'F';                  
                  qryCancelamento.Open;

                  OperComum.LimpaParametros(DMRendaVariavel.qryRecebimento);
                  qryRecebimento.ParamByName('DATACOM').AsString             := QryVerDireitosCancelar.FieldByName('DATACOM').AsString;
                  qryRecebimento.ParamByName('IDCARTEIRAINVEST').AsInteger   := QryVerDireitosCancelar.FieldByName('IDCARTEIRAINVEST').AsInteger;
                  qryRecebimento.ParamByName('IDPLANPREVCTBPATR').AsInteger  := QryVerDireitosCancelar.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                  qryRecebimento.ParamByName('IDCUSTODIANTE').AsInteger      := QryVerDireitosCancelar.FieldByName('IDCUSTODIANTE').AsInteger;
                  if not QryVerDireitosCancelar.FieldByName('IDMOTIVOBLOQUEIO').IsNull then
                     qryRecebimento.ParamByName('IDMOTIVOBLOQUEIO').AsInteger:= QryVerDireitosCancelar.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
                  qryRecebimento.ParamByName('IDOPERACAODIREITO').AsInteger  := QryVerDireitosCancelar.FieldByName('IDOPERACAODIREITO').AsInteger;
                  qryRecebimento.Open;

                  OperComum.LimpaParametros(DMRendaVariavel.qryProvisao);
                  qryProvisao.ParamByName('DATAEX').AsString              := QryVerDireitosCancelar.FieldByName('DATAEX').AsString;
                  qryProvisao.ParamByName('IDCARTEIRAINVEST').AsInteger   := QryVerDireitosCancelar.FieldByName('IDCARTEIRAINVEST').AsInteger;
                  qryProvisao.ParamByName('IDPLANPREVCTBPATR').AsInteger  := QryVerDireitosCancelar.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                  qryProvisao.ParamByName('IDCUSTODIANTE').AsInteger      := QryVerDireitosCancelar.FieldByName('IDCUSTODIANTE').AsInteger;
                  if not QryVerDireitosCancelar.FieldByName('IDMOTIVOBLOQUEIO').IsNull then
                     qryProvisao.ParamByName('IDMOTIVOBLOQUEIO').AsInteger:= QryVerDireitosCancelar.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
                  qryProvisao.ParamByName('IDOPERACAODIREITO').AsInteger  := QryVerDireitosCancelar.FieldByName('IDOPERACAODIREITO').AsInteger;
                  qryProvisao.Open;

                  while not qryProvisao.Eof do
                  begin
                     qryTipoOperCan.first;
                     if not qryTipoOperCan.Locate('IDTIPOOPERACAO', (qryProvisaoIDTIPOOPERACAO.AsInteger - 100), []) then
                        Raise Exception.Create('Tipo de Operação não encontrado.');

                     if (((pRPI.FLGCARTGERENC = 'N') or (pRPI.FLGCARTGERENC = '')) and
                          (QryVerDireitosCancelar.FieldByName('DATACOM').AsDateTime > pRPI.DATAMOVCDBLIB)) and
                          (not qryProvisaoIDCARTEIRAGERENC.IsNull) then
                     begin
                        qryProvisao.Next;
                        Continue;
                     end;

                     fQtdExerc := 0;
                     qryRecebimento.First;
                     while not qryRecebimento.Eof do
                     begin
                        if ((((qryProvisaoIDTIPOOPERACAO.AsInteger > -10000) and (qryRecebimentoIDTIPOOPERACAO.AsInteger < 10000)) or
                             ((qryProvisaoIDTIPOOPERACAO.AsInteger < -10000) and (qryRecebimentoIDTIPOOPERACAO.AsInteger > 10000))) and
                              (qryRecebimentoIDPLANPREVCTBPATR.AsInteger = qryProvisaoIDPLANPREVCTBPATR.AsInteger) and
                              (qryRecebimentoIDCARTEIRAINVEST.AsInteger  = qryProvisaoIDCARTEIRAINVEST.AsInteger) and
                              (qryRecebimentoIDCARTEIRAGERENC.AsInteger  = qryProvisaoIDCARTEIRAGERENC.AsInteger) and
                              (qryRecebimentoIDCUSTODIANTE.AsInteger     = qryProvisaoIDCUSTODIANTE.AsInteger) and
                              (qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger  = qryProvisaoIDMOTIVOBLOQUEIO.AsInteger)) or
                              (qryRecebimentoIDOPERACAOORIGEM.AsInteger  = qryProvisaoIDOPERACAOINVEST.AsInteger) then
                           fQtdExerc := fQtdExerc + qryRecebimentoVLROPERACAO.AsFloat;

                        qryRecebimento.Next;
                     end;

                     if qryCancelamento.Locate('IDOPERACAOORIGEM', qryProvisaoIDOPERACAOINVEST.AsInteger, []) then
                        fQtdExerc := fQtdExerc + qryCancelamentoVLROPERACAO.AsFloat;

                     if Opercomum.ComparaValores(qryProvisaoVLROPERACAO.AsFloat, fQtdExerc, '=', 2) then
                     begin
                        qryProvisao.Next;
                        Continue;
                     end;

                     fVlrCancelado := 0;
                     fQtdCancelado := 0;

                     qryCancelamento.First;
                     while not qryCancelamento.eof do
                     begin
                        if ((qryCancelamento.FieldByName('IDCARTEIRAINVEST').AsInteger  = qryProvisao.FieldByName('IDCARTEIRAINVEST').AsInteger) and
                            (qryCancelamento.FieldByName('IDPLANPREVCTBPATR').AsInteger = qryProvisao.FieldByName('IDPLANPREVCTBPATR').AsInteger) and
                            (qryCancelamento.FieldByName('IDCUSTODIANTE').AsInteger     = qryProvisao.FieldByName('IDCUSTODIANTE').AsInteger) and
                            (qryCancelamento.FieldByName('IDMOTIVOBLOQUEIO').AsInteger  = qryProvisao.FieldByName('IDMOTIVOBLOQUEIO').AsInteger) and
                            (qryCancelamento.FieldByName('FLGSTATUSORDMOV').AsString    = 'V') and
                            (qryCancelamento.FieldByName('DATAOPERACAO').AsString       = DateToStr(dDataOper)) and
                            (qryCancelamento.FieldByName('QTDEOPERACAO').AsFloat        = QryBuscaVendasDia.FieldByName('QTDEOPERACAO').AsFloat)) Then
                        begin
                           fQtdCancelado := qryProvisaoQTDEOPERACAO.AsFloat;
                           qryCancelamento.Next;
                           Continue;
                        end;

                        if ((qryCancelamento.FieldByName('IDCARTEIRAINVEST').AsInteger  = qryProvisao.FieldByName('IDCARTEIRAINVEST').AsInteger) and
                            (qryCancelamento.FieldByName('IDPLANPREVCTBPATR').AsInteger = qryProvisao.FieldByName('IDPLANPREVCTBPATR').AsInteger) and
                            (qryCancelamento.FieldByName('IDCUSTODIANTE').AsInteger     = qryProvisao.FieldByName('IDCUSTODIANTE').AsInteger) and
                            (qryCancelamento.FieldByName('IDMOTIVOBLOQUEIO').AsInteger  = qryProvisao.FieldByName('IDMOTIVOBLOQUEIO').AsInteger)) Then
                        begin
                           fVlrCancelado := fVlrCancelado + qryCancelamento.FieldByName('VLROPERACAO').AsFloat;
                           fQtdCancelado := fQtdCancelado + qryCancelamento.FieldByName('QTDEOPERACAO').AsFloat;
                        end;
                        qryCancelamento.Next;
                     end;

                     if (qryProvisaoQTDEOPERACAO.AsFloat - fQtdCancelado) <= 0 then
                     begin
                        qryProvisao.Next;
                        Continue;
                     end;

                     fVlrRec           := 0;
                     fIRRec            := 0;
                     fRemuneracaoRec   := 0;
                     fIRRemuneracaoRec := 0;
                     fQtdExerc         := 0;

                     //Verifica a quantidade exercida
                     if (qryProvisaoQTDEOPERACAO.AsFloat - fQtdCancelado - QryBuscaVendasDia.FieldByName('QTDEOPERACAO').AsFloat) > 0 then
                        fQtdExerc := QryBuscaVendasDia.FieldByName('QTDEOPERACAO').AsFloat
                     else if (qryProvisaoQTDEOPERACAO.AsFloat - fQtdCancelado - QryBuscaVendasDia.FieldByName('QTDEOPERACAO').AsFloat) < 0 then
                     begin
                        fQtdExerc := (qryProvisaoQTDEOPERACAO.AsFloat - fQtdCancelado - QryBuscaVendasDia.FieldByName('QTDEOPERACAO').AsFloat);
                        fQtdExerc :=  fQtdExerc + QryBuscaVendasDia.FieldByName('QTDEOPERACAO').AsFloat;
                     end
                     else
                        fQtdExerc := QryBuscaVendasDia.FieldByName('QTDEOPERACAO').AsFloat;

                     if fQtdExerc <= 0 then
                     begin
                        qryProvisao.Next;
                        Continue;
                     end;

                     qryRecebimento.First;
                     while not qryRecebimento.Eof do
                     begin
                        //Verifica a quantidade exercida em cada recebimento
                        if ((qryRecebimento.FieldByName('IDCARTEIRAINVEST').AsInteger  = qryProvisao.FieldByName('IDCARTEIRAINVEST').AsInteger) and
                            (qryRecebimento.FieldByName('IDPLANPREVCTBPATR').AsInteger = qryProvisao.FieldByName('IDPLANPREVCTBPATR').AsInteger) and
                            (qryRecebimento.FieldByName('IDCUSTODIANTE').AsInteger     = qryProvisao.FieldByName('IDCUSTODIANTE').AsInteger) and
                            (qryRecebimento.FieldByName('IDMOTIVOBLOQUEIO').AsInteger  = qryProvisao.FieldByName('IDMOTIVOBLOQUEIO').AsInteger)) Then
                           fVlrRec := fVlrRec + qryRecebimentoVLROPERACAO.AsFloat;

                        qryRecebimento.Next;
                     end;        

                     fVlrExerc := RoundCM(fQtdExerc * (qryProvisaoPRECOUNITOPERACAO.AsFloat / qryInvestimentoAcaoQTDTITLOTE.AsFloat) , 2);

                     fVlrExerc :=  fVlrExerc - fVlrRec;

                     // Grava o Cancelamento
                     ExecutaQuery(qryAuxiliar, 'INSERT INTO OPERACAOINVEST '+
                                  ' (IDOPERACAOINVEST, QTDEOPERACAO, VLROPERACAO, VLRIRREMUNER, '+
                                  '  VLRIR, MOECODIGO, IDMODULO, EMPRESAPROP, ORIGDEST, '+
                                  '  IDINVESTIMENTO, IDCARTEIRAINVEST, IDTIPOINVEST, '+
                                  '  IDTIPOOPERACAO, DATAOPERACAO, DATAVENCOPER, PRECOUNITOPERACAO, '+
                                  '  IDLOTE, IDCUSTODIANTE, FLGSTATUSFECHBOL, FLGSTATUSORDMOV, '+
                                  '  IDMOTIVOBLOQUEIO, IDOPERACAODIREITO, VLRREMUNERACAO, PERCENTUAL, '+
                                  '  IDCARTEIRAGERENC, IDPLANPREVCTBPATR, IDOPERACAOORIGEM) VALUES ('+
                                  IntToStr(LeUltRegistro(Nil,'OPERACAOINVEST'))+', '+
                                  TrocaVirgulaPonto(FloatToStr(fQtdExerc))+', '+
                                  TrocaVirgulaPonto(FloatToStr((fVlrExerc)))+', '+
                                  TrocaVirgulaPonto(FloatToStr((0)))+', '+
                                  TrocaVirgulaPonto(FloatToStr((0)))+', '+
                                  IntToStr(pRPI.MOECODIGO)+', '+IntToStr(Sistema.IdModulo)+', '+IntToStr(Sistema.IdEmpresa)+', '+
                                  QuotedStr('D')+', '+
                                  qryProvisaoIDINVESTIMENTO.AsString+', '+ qryProvisaoIDCARTEIRAINVEST.AsString+', 2, '+
                                  qryTipoOperCan.FieldByName('IDTIPOOPERACAO').AsString+', '+
                                  'TO_DATE('+QuotedStr(DateToStr(dDataOper))+','+QuotedStr('DD/MM/YYYY')+'), '+
                                  'TO_DATE('+QuotedStr(DateToStr(dDataOper))+','+QuotedStr('DD/MM/YYYY')+'), '+
                                  TrocaVirgulaPonto(FloatToStr(qryProvisaoPRECOUNITOPERACAO.AsFloat))+', '+
                                  OperComum.IIF(not qryProvisaoIDLOTE.IsNull, qryProvisaoIDLOTE.AsString, 'NULL')+', '+
                                  OperComum.IIF(not qryProvisaoIDCUSTODIANTE.IsNull, qryProvisaoIDCUSTODIANTE.AsString, 'NULL')+', '+
                                  QuotedStr('C')+', '+QuotedStr('V')+', '+
                                  OperComum.IIF(not qryProvisaoIDMOTIVOBLOQUEIO.IsNull, qryProvisaoIDMOTIVOBLOQUEIO.AsString, 'NULL')+', '+
                                  QryVerDireitosCancelar.FieldByName('IDOPERACAODIREITO').AsString+', '+
                                  TrocaVirgulaPonto(FloatToStr((qryProvisaoVLRREMUNERACAO.AsFloat - fRemuneracaoRec)))+', '+
                                  '0, '+
                                  OperComum.IIF(not qryProvisaoIDCARTEIRAGERENC.IsNull, qryProvisaoIDCARTEIRAGERENC.AsString, 'NULL')+', '+
                                  qryProvisaoIDPLANPREVCTBPATR.AsString+', '+qryProvisaoIDOPERACAOINVEST.AsString+')');

                     //Verifica a quantidade
                     qryProvisao.Edit;
                     qryProvisaoQTDEEXERCIDA.AsFloat := fQtdExerc;
                     qryProvisao.Post;

                     qryProvisao.Next;
                  end;
                  QryVerDireitosCancelar.Next;
               end;
               QryBuscaVendasDia.Next;
            end;

            OperComum.LimpaParametros(DMRendaVariavel.qryCancelamento);
            qryCancelamento.ParamByName('DATACOM').AsString  := DateToStr(dDataOper);
            qryCancelamento.ParamByName('FLGSTATUSFECHBOL').AsString  := 'C';
            qryCancelamento.Open;

            iCount := 0;

            //Carrega CDS Boleta
            repeat

               dspSelBoleta.DataSet := qryCancelamento;
               iRec := qryCancelamento.RecordCount;
               if iCount = 0 then
                  iOper := qryCancelamentoIDOPERACAOINVEST.AsInteger;

               Inc(iCount);

               cdsSelBoleta.Data := dspSelBoleta.Data;

            until (cdsSelBoleta.RecordCount = iRec) or (iCount > 3);

            cdsSelBoleta.IndexFieldNames := '';
            cdsSelBoleta.First;

            //Gerando Boletas de Cancelamento Buscando Fornecedor / Cliente
            while not cdsSelBoleta.Eof do
            begin
               RendaVariavel.FornecedorCli(cdsSelBoleta.FieldByName('IDCUSTODIANTE').AsInteger,
                                           cdsSelBoleta.FieldByName('IDINVESTIMENTO').AsInteger,
                                           qryTipoOperCan, QryInvestimentoAcao, iIdForCli);
               cdsSelBoleta.Edit;
               cdsSelBoleta.FieldByName('IDFORCLI').AsInteger := iIdForCli;
               qryTipoOperCan.First;
               qryTipoOperCan.Locate('IDTIPOOPERACAO',cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger,[]);
               cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger := qryTipoOperCan.FieldByName('IDTIPOOPERACAO').AsInteger;
               cdsSelBoleta.Post;
               cdsSelBoleta.Next;
            end;

            // Ordena pela quebra de boletas
            cdsSelBoleta.IndexFieldNames := 'DATAOPERACAO;IDFORCLI;IDPLANPREVCTBPATR;IDTIPOOPERACAO;IDOPERACAODIREITO';
            cdsSelBoleta.First;

            iIdForCliAnt  := 0;
            iIdPlanPrevAnt:= 0;
            sDataOperAnt  := '';
            iTipoOperAnt  := 0;
            iIdOperDirAnt := 0;

            while not cdsSelBoleta.Eof do
            begin
               // Localiza o Cancelamento correspondente
               qryCancelamento.First;
               if not qryCancelamento.Locate('IDOPERACAOINVEST', cdsSelBoleta.FieldByName('IDOPERACAOINVEST').AsInteger, []) then
                  Raise Exception.Create('Não foi possível localizar o cancelamento original ao gerar boletas');

               // Se for parcial, o documento da operação anterior já esta preenchido
               if qryCancelamentoNUMDOCUMENTO.IsNull then
               begin
                  if (iIdForCliAnt   <> cdsSelBoleta.FieldByName('IDFORCLI').AsInteger) or
                     (iIdPlanPrevAnt <> cdsSelBoleta.FieldByName('IDPLANPREVCTBPATR').AsInteger) or
                     (sDataOperAnt   <> cdsSelBoleta.FieldByName('DATAOPERACAO').AsString) or
                     (iTipoOperAnt   <> cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger) or
                     (iIdOperDirAnt  <> cdsSelBoleta.FieldByName('IDOPERACAODIREITO').AsInteger) then
                  begin
                     // Gera numero de Boleta
                     sNumDoc := 'RV-' + Copy(qryCancelamentoDATAOPERACAO.AsString,9,2) + '/' +
                                             FormatFloat('00000', LeUltRegistro(Nil,'CONTDOCRENVAR' + Copy(DateToStr(dDataOper),9,2)));
                     // Capta o ForCli
                     iIdForCli := cdsSelBoleta.FieldByName('IDFORCLI').AsInteger;
 
                     ExecutaQuery(qryAuxiliar, 'INSERT INTO BOLETA '+
                                  '(IDBOLETA, STATUS, DATABOLETA, TIPMOVBOLETA, IDFORCLI) VALUES ('+
                                  QuotedStr(sNumDoc)+', '+QuotedStr('F')+', TO_DATE('+QuotedStr(DateToStr(dDataOper))+','+QuotedStr('DD/MM/YYYY')+'), '+
                                  QuotedStr('DTC')+', '+IntToStr(iIdForCli)+')');

                     // Atualiza as variáveis de trabalho
                     iIdForCliAnt   := cdsSelBoleta.FieldByName('IDFORCLI').AsInteger;
                     iIdPlanPrevAnt := cdsSelBoleta.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                     sDataOperAnt   := cdsSelBoleta.FieldByName('DATAOPERACAO').AsString;
                     iTipoOperAnt   := cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger;
                     iIdOperDirAnt  := cdsSelBoleta.FieldByName('IDOPERACAODIREITO').AsInteger;
                  end;

                  // Atualiza o Cancelamento
                  ExecutaQuery(qryAuxiliar, 'UPDATE OPERACAOINVEST SET '+
                               ' NUMDOCUMENTO = '+QuotedStr(sNumDoc)+', '+
                               ' IDFORCLI     = '+IntToStr(iIdForCli)+' '+
                               ' WHERE IDOPERACAOINVEST = '+qryCancelamentoIDOPERACAOINVEST.AsString);
               end;

               cdsSelBoleta.Next;
            end;

            OperComum.LimpaParametros(DMRendaVariavel.qryCancelamento);
            qryCancelamento.ParamByName('DATACOM').AsString  := DateToStr(dDataOper);
            qryCancelamento.ParamByName('FLGSTATUSFECHBOL').AsString  := 'C';
            qryCancelamento.Open;            

            qryCancelamento.First;
            while not qryCancelamento.Eof do
            begin
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                 qryCancelamentoIDINVESTIMENTO.AsInteger, 2,
                                                 qryCancelamentoIDOPERACAOINVEST.AsInteger, -1,
                                                 qryCancelamentoIDTIPOOPERACAO.AsInteger,
                                                 qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                 qryCancelamentoIDCARTEIRAGERENC.AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryCancelamentoDATAOPERACAO.AsDateTime,
                                                 qryCancelamentoVLROPERACAO.AsFloat,
                                                 qryCancelamentoQTDEOPERACAO.AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                 0 {Variacao}, 0{Juros},
                                                 0 {wVlrIRProv} {Verificar se vai calcular o saldo},
                                                 qryCancelamentoVLRIR.AsFloat, 0, 0, 0, 0, 0,
                                                 qryCancelamentoNATUREZAOPERACAO.AsString {Movimento},
                                                 qryCancelamentoNATUREZAOPERACAO.AsString {Operacao},
                                                 qryCancelamentoIDLOTE.AsString,
                                                 qryCancelamentoDESCTIPOOPERACAO.AsString +' - POR VENDA / ' +
                                                      qryCancelamentoDESCINVESTIMENTO.AsString,
                                                 'OPE', '1', '', True, -1,
                                                 qryCancelamentoIDPLANPREVCTBPATR.AsInteger, iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível inserir os Históricos das Operações.');

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possivel atualizar os saldos desta Carteira/Investimento');


               // Se for Carteira Gerencial
               if not qryCancelamentoIDCARTEIRAGERENC.IsNull then
               begin
                  if (CotaComum.BuscaEventoPorTpOper(qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                     qryCancelamentoIDCARTEIRAGERENC.AsInteger,
                                                     qryCancelamentoIDTIPOOPERACAO.AsInteger) = 0) then
                     Raise Exception.Create('Não foi encontrado o evento de Caixa/Cota para a Carteira Gerencial.');

                  // AL_5 - Lança na provisão no vencimento da operação
                  if not ProvisaoComum.GravaProvisao(qryCancelamentoDATAOPERACAO.AsDateTime,
                                                     qryCancelamentoDATAVENCOPER.AsDateTime,
                                                     qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                     qryCancelamentoIDCARTEIRAGERENC.AsInteger,
                                                     CotaComum.BuscaEventoPorTpOper(qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                                                    qryCancelamentoIDCARTEIRAGERENC.AsInteger,
                                                                                    qryCancelamentoIDTIPOOPERACAO.AsInteger),
                                                     qryCancelamentoIDOPERACAOINVEST.AsInteger,
                                                     qryCancelamentoIDOPERACAODIREITO.AsInteger,
                                                     qryCancelamentoIDPLANPREVCTBPATR.AsInteger,
                                                     qryCancelamentoVLRLIQUIDO.AsFloat) Then
                     Raise Exception.Create('Erro ao gravar o evento de Caixa.');

                  // Se Lançou uma HistProvisao, exclui a HistCota
                  ExecutaQuery(qryAuxiliar, 'DELETE FROM HISTCOTA WHERE '+
                                            ' DATAHISTCOTA >= TO_DATE(''' +
                                            OperComum.IIF(qryCancelamentoDATAOPERACAO.AsDateTime < (pRPI.DATAULTFECH-30),
                                                          DateToStr(pRPI.DATAULTFECH-30),
                                                          DateToStr(qryCancelamentoDATAOPERACAO.AsDateTime)) + ''',''DD/MM/YYYY'') ');
               end;

               // Parametro para Contabilidade e CAP/CAR
               bCriaLancto    := True;
               wTipoRecDesBol := '';
               wMensErro      := '';

               // Contabiliza
               wPlano     := 0;
               wPlanilha  := 0;
               wDocumento := 0;

               //AL_34 - Contabiliza por Plano / Patrocinadora
               if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                          qryCancelamentoIDINVESTIMENTO.AsInteger,
                                          qryCancelamentoIDTIPOOPERACAO.AsInteger,
                                          qryCancelamentoIDOPERACAOINVEST.AsInteger,
                                          qryCancelamentoIDFORCLI.AsInteger,
                                          qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                          QryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                          qryCancelamentoDESCTIPOOPERACAO.AsString+' - POR VENDA - ' +
                                             qryCancelamentoDESCINVESTIMENTO.AsString,
                                          qryCancelamentoIDLOTE.AsString,
                                          '', qryCancelamentoNUMDOCUMENTO.AsString,
                                          qryTipoOperCan.Lookup('IDTIPOOPERACAO', qryCancelamentoIDTIPOOPERACAO.AsInteger, 'RECPAG'),
                                          wTipoRecDesBol, bCriaLancto,
                                          qryCancelamentoVLROPERACAO.AsFloat,
                                          qryCancelamentoVLRLIQUIDO.AsFloat,
                                       //Ricardo Cristiano - 11/07/2011 - N. Sol 161307 -  N. Kintana 1358862
                                          qryCancelamentoDATAOPERACAO.AsDateTime,
//                                          OperComum.RetornaDtContabDivBonif(qryCancelamentoDATAOPERACAO.AsDateTime,
//                                                                            qryCancelamentoDATAOPERACAO.AsDateTime,
//                                                                            qryCancelamentoDATAAGE.AsDateTime),
                                          qryCancelamentoDATAVENCOPER.AsDateTime,
                                          wPlano, wPlanilha, wDocumento, wMensErro,
                                          'N'{sCapCar}, False, True, 0, True,
                                          qryCancelamentoIDPLANPREVCTBPATR.AsInteger) <> 0 then
                  Raise Exception.Create('Não foi possível contabilizar o Anúncio');

               // Atualiza o Cancelamento
               ExecutaQuery(qryAuxiliar, 'UPDATE OPERACAOINVEST SET FLGSTATUSFECHBOL = '+QuotedStr('F')+
                                         ' WHERE IDOPERACAOINVEST = '+qryCancelamentoIDOPERACAOINVEST.AsString);                  

               // Atualiza a Boleta com Planilha
               if wPlanilha > 0 then
                  ExecutaQuery(qryAuxiliar, 'UPDATE BOLETA SET '+
                                            ' PLANO = '+IntToStr(wPlano)+', '+
                                            ' PLNCODIGO = '+IntToStr(wPlanilha)+' '+
                                            ' WHERE IDBOLETA = '+QuotedStr(qryCancelamentoNUMDOCUMENTO.AsString));
               qryCancelamento.Next;
            end;
         end;

         Result := True;
      Except
         On E:Exception Do
         Begin
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         End;
      End;
   Finally
      OperComum.LimpaParametros(DMRendaVariavel.QryVerDireitosCancelar);
      OperComum.LimpaParametros(DMRendaVariavel.qryProvisao);
      OperComum.LimpaParametros(DMRendaVariavel.qryCancelamento);
      OperComum.LimpaParametros(DMRendaVariavel.qryRecebimento);
      OperComum.LimpaParametros(DMRendaVariavel.QryBuscaVendasDia);
      OperComum.LimpaParametros(DMRendaVariavel.QryInvestimentoAcao);
      OperComum.LimpaParametros(DMRendaVariavel.qryTipoOperCan);
      OperComum.LimpaParametros(DMRendaVariavel.qryAuxiliar);
   end;
end;

procedure TRendaVariavel.FornecedorCli(iIdCustodiante,
  iInvestimento: Integer; var qryTipoOperacao, qryForCli: TwwQuery;
  var iIdForCli: Integer);
begin
   // Se Tipo de Credor for CUSTODIANTE
   if (qryTipoOperacao.FieldByName('TIPCREDOR').AsString = 'CT') then
   begin
      // Transforma Custodiante em Fornecedor - Cliente
      try
         if qryTipoOperacao.FieldByName('RECPAG').AsString = 'R' then
            Documento.ForCli.Inserir(iIdCustodiante, Sistema.IdEmpresa, -1, 0,
                                     pRPI.IDTIPOCLIENTECOR, Sistema.IdEmpresa,
                                     '', '', '', '', 'C', False) // Cliente
         else if qryTipoOperacao.FieldByName('RECPAG').AsString = 'P' then
            Documento.ForCli.Inserir(iIdCustodiante, Sistema.IdEmpresa, -1, 0,
                                     pRPI.IDRAMOFORCOR, Sistema.IdEmpresa,
                                     '', '', '', '', 'F', False); // Fornecedor
      Except  // Função gerava um Abort quando o Fornecedor
      End;    // já estava cadastrado

      iIdForCli := iIdCustodiante;

   // Se Tipo de Credor for EMISSOR
   end
   else
   begin
      // Transforma Emissor em Fornecedor - Cliente
      try
         if qryTipoOperacao.FieldByName('RECPAG').AsString = 'R' then
            Documento.ForCli.Inserir(qryForCli.FieldByName('IDEMISSOR').AsInteger, Sistema.IdEmpresa,
                                     -1, 0, 12, Sistema.IdEmpresa,
                                     '','','','','C',False) // Cliente
         else if qryTipoOperacao.FieldByName('RECPAG').AsString = 'P' then
            Documento.ForCli.Inserir(qryForCli.FieldByName('IDEMISSOR').AsInteger, Sistema.IdEmpresa,
                                     0, 0, 12, Sistema.IdEmpresa,
                                     '','','','','F',False); // Fornecedor
      Except  // Função gerava um Abort quando o Fornecedor
      End;    // já estava cadastrado

      iIdForCli := qryForCli.FieldByName('IDEMISSOR').AsInteger;
   end;
end;

//Ricardo Cristiano - 17/04/2011 - N. Sol 157990.4821 -  N. Kintana 1273974
function TRendaVariavel.AtualizaCarteiraDestino(iInvestimento, iCarteiraInvest, iPlanoPrev: Integer;
                                                dDataProc: TDateTime): Boolean;
var sBoleta : String;
    //Ricardo Cristiano - 26/01/2012 - N. Sol 172801 -  N. Kintana - Inicio
    iCarteiraDest : Integer;
begin
   try
      try
         //Ricardo Cristiano - 26/01/2012 - N. Sol 172801 -  N. Kintana - Inicio
         iCarteiraDest := 0;
         OperComum.LimpaParametros(DMRendaVariavel.qryBuscaBoletas);
         DMRendaVariavel.qryBuscaBoletas.ParamByName('dDataRef').AsString           := DateToStr(dDataProc);
         DMRendaVariavel.qryBuscaBoletas.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
         DMRendaVariavel.qryBuscaBoletas.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteiraInvest;
         DMRendaVariavel.qryBuscaBoletas.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanoPrev;
         DMRendaVariavel.qryBuscaBoletas.Open;
         while not DMRendaVariavel.qryBuscaBoletas.EOF do
         begin
            sBoleta := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
            while not (DMRendaVariavel.qryBuscaBoletas.EOF) and (sBoleta = DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString) do
            begin
               //TRC - Tranferência entre Carteiras
               if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'TRC') then
               begin
                   OperComum.LimpaParametros(DMRendaVariavel.qryBuscaBoletaTRCAtu);
                   DMRendaVariavel.qryBuscaBoletaTRCAtu.ParamByName('IDBOLETA').AsString := sBoleta;
                   DMRendaVariavel.qryBuscaBoletaTRCAtu.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanoPrev;
                   DMRendaVariavel.qryBuscaBoletaTRCAtu.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
                   DMRendaVariavel.qryBuscaBoletaTRCAtu.ParamByName('IDCARTEIRAORIG').AsInteger := iCarteiraInvest;
                   DMRendaVariavel.qryBuscaBoletaTRCAtu.Open;

                   //Ricardo Cristiano - 26/01/2012 - N. Sol 172801 -  N. Kintana - Inicio
                   if ((not DMRendaVariavel.qryBuscaBoletaTRCAtu.IsEmpty) and
                       (iCarteiraDest <> DMRendaVariavel.qryBuscaBoletaTRCAtu.FieldByName('IDCARTEIRADEST').AsInteger)) then
                   begin
                     // Atualização do dia (ATU)
                     if not RendaVariavel.AtualizaSaldoInvestRV(iInvestimento,
                                                                DMRendaVariavel.qryBuscaBoletaTRCAtu.FieldByName('IDCARTEIRADEST').AsInteger,
                                                                iPlanoPrev,
                                                                dDataProc) then
                         Raise Exception.Create('Não foi possível atualizar Saldo.' + #13 +
                                                'Dia: ' + DMRendaVariavel.qryBuscaBoletaTRCAtu.FieldByName('DATAMOVCUSTOD').AsString + #13 +
                                                'Investimento: ' + Trim(DMRendaVariavel.qryBuscaBoletaTRCAtu.FieldByName('DESCINVESTIMENTO').AsString) + #13 +
                                                'Carteira: '  + Trim(DMRendaVariavel.qryBuscaBoletaTRCAtu.FieldByName('DESCCARTINVEST').AsString) + #13 +
                                                'Plano/Patrocinadora: '  + Trim(DMRendaVariavel.qryBuscaBoletaTRCAtu.FieldByName('PLANPRVCONTABPATRO').AsString) + #13 +
                                                'O Processo será Cancelado');
                   end;
                   //Ricardo Cristiano - 26/01/2012 - N. Sol 172801 -  N. Kintana - Inicio
                   iCarteiraDest := DMRendaVariavel.qryBuscaBoletaTRCAtu.FieldByName('IDCARTEIRADEST').AsInteger;
               end;
               // Proximo Registro
               DMRendaVariavel.qryBuscaBoletas.Next;
            end;
         end;

         Result  := True;
      except
         On E:Exception Do
         Begin
            Result := False;
         end;
      end;
   finally
      DMRendaVariavel.qryBuscaBoletas.Close;
      DMRendaVariavel.qryBuscaBoletaTRCAtu.Close;
   end;

end;

{ TCustodia }

procedure TCustodia.ArrumaCustodia(iPlanoPatro, iCarteira, iCarteiraGerenc,
  iInvestimento, iCustodiante: Integer; sLote: String; dData: TDateTime;
  FSLiberado, FSBloqueado: Double);
var
  sSql: string;
  id: integer;
  Qry: TwwQuery;
  SldLiberadoAtu, SldBloqueadoAtu: Double;
begin
  QryCustodia := TwwQuery.Create(nil);
  QryCustodia.DatabaseName := 'BaseDados';

  Qry := TwwQuery.Create(nil);
  Qry.DatabaseName := 'BaseDados';

  try

    OperComum.LimpaParametros(QryCustodia);
    BuscaSaldoCustodia(iPlanoPatro, iCarteira, iCarteiraGerenc,
                       iInvestimento, iCustodiante, sLote, dData);
    //Ricardo Cristiano - 14/07/2011 SOL 161488 - KINTANA 1361915 - Implementação para diferenciar a carteira de empréstimo                       
    FazQuery(Qry,'SELECT C.IDMERCADO FROM CARTEIRAINVEST C WHERE C.IDCARTEIRAINVEST = '+IntToStr(iCarteira));
    if (Qry.FieldByName('IDMERCADO').AsInteger = 5) then
       QryCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger := 2
    else
       QryCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger := -1;
    QryCustodia.Open;

    SldLiberadoAtu  := (QryCustodia.FieldByName('SALDOLIBERADO').AsFloat  + (FSLiberado) );
    SldBloqueadoAtu := (QryCustodia.FieldByName('SALDOBLOQUEADO').AsFloat + (FSBloqueado));

    //Ricardo Cristiano - 19/11/2010 - N. Sol 147934/3022  -  N. Kintana 1031783
    id := LeUltRegistro(Nil,'HISTCUSTODIA');
    sSql :=
     'INSERT INTO HISTCUSTODIA '                                           +
     '(IDCUSTODIA, IDCARTEIRAINVEST, '                                     +
     ' IDINVESTIMENTO, IDCUSTODIANTE, DATAMOVCUSTOD,'                      +
     ' QTDEMOVCUSTOD, SALDOLIBERADO, SALDOBLOQUEADO, FLGCALCSALDO, IDLOTE,'+
     ' TIPOCUSTODIA, IDMOTIVOBLOQUEIO, IDPLANPREVCTBPATR,'                 +
     ' SALDOQTDECPMF, FLGCONTAINVEST) '                                    +
     ' VALUES '                                                            +
     '(' + IntToStr(id)                                                    +
     ',' + IntToStr(iCarteira)                                             +
     ',' + IntToStr(iInvestimento)                                         +
     ',' + IntToStr(iCustodiante)                                          +
     ',' + QuotedStr(DateToStr(dData))                                     +
     ',' + OperComum.IIF(QryCustodia.FieldByName('QTDEMOVCUSTOD').AsString = '', '0', QryCustodia.FieldByName('QTDEMOVCUSTOD').AsString) +
     ',' + TrocaVirgulaPonto(FloatToStr(SldLiberadoAtu))                   +
     ',' + TrocaVirgulaPonto(FloatToStr(SldBloqueadoAtu))                  +
     ',' + OperComum.IIF(QryCustodia.FieldByName('FLGCALCSALDO').AsString = '', 'Null', QuotedStr(QryCustodia.FieldByName('FLGCALCSALDO').AsString)) +
     ',' + OperComum.IIF(QryCustodia.FieldByName('IDLOTE').AsString = '', 'Null', QuotedStr(QryCustodia.FieldByName('IDLOTE').AsString)) +
     ',' + OperComum.IIF(QryCustodia.FieldByName('TIPOCUSTODIA').AsString = '', QuotedStr('C'), QuotedStr(QryCustodia.FieldByName('TIPOCUSTODIA').AsString)) +
     ',' + OperComum.IIF(QryCustodia.FieldByName('IDMOTIVOBLOQUEIO').AsString = '', '-1', QuotedStr(QryCustodia.FieldByName('IDMOTIVOBLOQUEIO').AsString)) +
     ',' + IntToStr(iPlanoPatro)                                           +
     ',' + OperComum.IIF(QryCustodia.FieldByName('SALDOQTDECPMF').AsString = '', '0', QryCustodia.FieldByName('SALDOQTDECPMF').AsString) +
     ',' + OperComum.IIF(QryCustodia.FieldByName('FLGCONTAINVEST').AsString = '', 'Null', QryCustodia.FieldByName('FLGCONTAINVEST').AsString) + ')' ;

    //Ricardo Cristiano - 19/11/2010 - N. Sol 147934/3022  -  N. Kintana 1031783
    try
       ExecutarQuery(Qry,sSql);
    except on E: Exception do
       begin
          MsgDlg(E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
       end;
    end;

  finally
    FreeAndNil(Qry);
    FreeAndNil(QryCustodia);
  end;
end;

procedure TCustodia.BuscaSaldoCustodia(iPlanoPatro, iCarteira,
  iCarteiraGerenc, iInvestimento, iCustodiante: Integer; sLote: String;
  dData: TDateTime);
var
 sSql: String;
begin
   sSql :=

      'SELECT                                                                                         ' + #13 +
      '   H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, H1.IDLOTE, H1.TIPOCUSTODIA, H1.QTDEMOVCUSTOD,       ' + #13 +
      '   H1.IDMOTIVOBLOQUEIO, H1.IDPLANPREVCTBPATR, H1.FLGCONTAINVEST, H1.DATAMOVCUSTOD, H1.IDCUSTODIANTE, ' + #13 +
      '   H1.FLGCALCSALDO, H1.SALDOLIBERADO, H1.SALDOBLOQUEADO, H1.SALDOQTDECPMF                      ' + #13 +
      'FROM                                                                                           ' + #13 +
      '   HISTCUSTODIA H1                                                                             ' + #13 +
      'WHERE                                                                                          ' + #13 +
      '   (H1.IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR) AND                                              ' + #13 +
      '   (H1.IDCARTEIRAINVEST =:IDCARTEIRA) AND                                                      ' + #13 +
      '   (H1.IDINVESTIMENTO =:IDINVESTIMENTO) AND                                                    ' + #13 +
      '   (((:IDLOTE IS NOT NULL) AND (H1.IDLOTE =:IDLOTE)) OR ((:IDLOTE IS NULL) AND (H1.IDLOTE IS NULL))) AND ' + #13 +
//Ricardo Cristiano - 14/07/2011 SOL 161488 - KINTANA 1361915 - Implementação para bsucar independente do custodiante      
      '    ((:IDCUSTODIANTE IS NULL) OR (H1.IDCUSTODIANTE = :IDCUSTODIANTE))                      AND ' + #13 +
      '   (H1.IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO) AND                                               ' + #13 +
      '   (H1.DATAMOVCUSTOD =                                                                         ' + #13 +
      '         (SELECT MAX(H2.DATAMOVCUSTOD)                                                         ' + #13 +
      '          FROM   HISTCUSTODIA H2                                                               ' + #13 +
      '          WHERE (H2.IDPLANPREVCTBPATR= H1.IDPLANPREVCTBPATR) AND                               ' + #13 +
      '                (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND                                ' + #13 +
      '                (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND                                  ' + #13 +
      '               ((H2.IDLOTE = H1.IDLOTE) OR (H1.IDLOTE IS NULL)) AND                            ' + #13 +
      '              (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND ' + #13 +
      '                (H2.IDCUSTODIANTE    = H1.IDCUSTODIANTE) AND                                   ' + #13 +
      '                (H2.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND                                ' + #13 +
      '               ((H2.DATAMOVCUSTOD   <  :DATAMOV) OR                                            ' + #13 +
      '               ((H2.DATAMOVCUSTOD    = :DATAMOV) AND                                           ' + #13 +
      '                (H2.IDCUSTODIA      <  :IDCUSTODIA))))) AND                                    ' + #13 +
      '   (H1.IDCUSTODIA   =                                                                          ' + #13 +
      '         (SELECT MAX(H3.IDCUSTODIA)                                                            ' + #13 +
      '          FROM   HISTCUSTODIA H3                                                               ' + #13 +
      '          WHERE (H3.IDPLANPREVCTBPATR= H1.IDPLANPREVCTBPATR) AND                               ' + #13 +
      '                (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND                                ' + #13 +
      '                (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND                                  ' + #13 +
      '              (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND ' + #13 +
      '                (H3.IDCUSTODIANTE    = H1.IDCUSTODIANTE) AND                                   ' + #13 +
      '                (H3.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND                                ' + #13 +
      '                (H3.DATAMOVCUSTOD    = H1.DATAMOVCUSTOD) AND                                   ' + #13 +
      '               ((H3.DATAMOVCUSTOD   < :DATAMOV) OR                                             ' + #13 +
      '                (H3.IDCUSTODIA      < :IDCUSTODIA))))                                          ' + #13 +
      'ORDER BY H1.DATAMOVCUSTOD DESC                                                                 ' + #13 ;

   with QryCustodia do begin
     Close;
     sql.Clear;
     sql.Add(sSql);

     ParamByName('IDPLANPREVCTBPATR').DataType := ftInteger;
     ParamByName('IdInvestimento').DataType := ftInteger;
     ParamByName('IdCarteira').DataType := ftInteger;
     ParamByName('IdLote').DataType := ftInteger;
     ParamByName('DataMov').DataType := ftString;
     ParamByName('IDCUSTODIANTE').DataType := ftInteger;
     ParamByName('IdCustodia').DataType := ftInteger;

     ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanoPatro;
     ParamByName('IdInvestimento').AsInteger := iInvestimento;
     ParamByName('IdCarteira').AsInteger := iCarteira;
   if Trim(sLote) = '' then
      ParamByName('IdLote').Clear
   else
      ParamByName('IdLote').AsString := sLote;
     ParamByName('DataMov').AsDateTime := dData;

   if iCustodiante <= 0 then
      ParamByName('IDCUSTODIANTE').Clear
   else
      ParamByName('IDCUSTODIANTE').AsInteger := iCustodiante;
     ParamByName('IdCustodia').AsInteger := 9999999;
   end;
end;

procedure TCustodia.ConciliaCustodia(iPlanoPatro, iCarteira,
  iCarteiraGerenc, iInvestimento, iCustodiante: Integer; sLote: String;
  dData: TDateTime);
var
  QryLocal :TwwQuery;
  fSaldoQtd, fSaldoCPMF, fSaldoInutil : Double;
  CtrlRV: TCtrlRendaVariavel;
begin

   CtrlRV := TCtrlRendaVariavel.Create;
   CtrlRV.InitializeAs(Padroes);

   FSaldoQtdCustodia := 0;
   FSldLibCustodia   := 0;
   FSaldoBloqueado   := 0;

   if (iPlanoPatro > 0) and (iCarteira > 0) and
      (iInvestimento > 0) and (dData > 0) Then
   begin

       CtrlRV.BuscaSaldoRV.Executa(dData,
                                   iPlanoPatro,
                                   iInvestimento,
                                   iCarteira, iCarteiraGerenc,
                                   High(Integer),
                                   iCustodiante, sLote);

       FSaldoQtdCustodia := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;

      //AL_21

      If iCarteiraGerenc = 0 Then
      begin
          // Busca Saldo Liberado do Custodiante
          QryCustodia := TwwQuery.Create(nil);
          QryCustodia.DatabaseName := 'BaseDados';

          OperComum.LimpaParametros(QryCustodia);
          BuscaSaldoCustodia(iPlanoPatro, iCarteira, iCarteiraGerenc,
                                iInvestimento, iCustodiante, sLote, dData);

          QryCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger := -1;
          QryCustodia.Open;

          if not qryCustodia.IsEmpty then
          begin
             FSldLibCustodia := QryCustodia.FieldByName('SALDOLIBERADO').AsFloat;
             SLiberado :=    QryCustodia.FieldByName('SALDOLIBERADO').AsFloat;
             SLiberadoCC :=  QryCustodia.FieldByName('SALDOQTDECPMF').AsFloat;
          end
          else
          begin
             FSldLibCustodia := 0;
             SLiberado :=    0;
             SLiberadoCC :=  0;
          end;

          // Busca Mostra Total do Saldo Bloqueado

          try
             QryLocal              := TwwQuery.Create(Application);
             QryLocal.DatabaseName := 'BaseDados';

             SBloqueado := 0;

             FazQuery(QryLocal,'SELECT IDMOTIVOBLOQUEIO '+
                               'FROM MOTIVOBLOQUEIO '+
                               'WHERE  IDMOTIVOBLOQUEIO <> -1');

             While Not QryLocal.Eof Do
             Begin
                OperComum.LimpaParametros(qryCustodia);
                BuscaSaldoCustodia(iPlanoPatro, iCarteira, iCarteiraGerenc,
                                    iInvestimento, iCustodiante, sLote, dData);
                qryCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger :=
                   QryLocal.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
                qryCustodia.Open;

                SBloqueado    := SBloqueado    + qryCustodia.FieldByName('SALDOBLOQUEADO').AsFloat;
                SBloqueadoCC  := SBloqueadoCC  + qryCustodia.FieldByName('SALDOQTDECPMF').AsFloat;
                QryLocal.Next;
             End;

             if SBloqueado <> 0 then
             begin
                FSaldoBloqueado := SBloqueado;
             end
             else
             begin
                FSaldoBloqueado := 0;
             end;

             //Ricardo Cristiano - 14/07/2011 SOL 161488 - KINTANA 1361915 - Implementação para quando Empréstimo acatar a quantidade bloqueada             
             FazQuery(QryLocal,'SELECT C.IDMERCADO FROM CARTEIRAINVEST C WHERE C.IDCARTEIRAINVEST = '+IntToStr(iCarteira));
             if ((QryLocal.FieldByName('IDMERCADO').AsInteger = 5) and (FSaldoBloqueado <> 0)) then
                FSaldoQtdCustodia := FSaldoBloqueado;

          finally
             QryLocal.Close;
             QryCustodia.Close;
             FreeAndNil(QryCustodia);
             FreeAndNil(QryLocal);
             FreeAndNil(CtrlRV);
          end;
      End;
   end;
end;

procedure TCustodia.GravaLogCartXCust(iPlanoPatro, iCarteira,
  iCarteiraGerenc, iInvestimento, iCustodiante: Integer; sLote: String;
  dData: TDateTime; FSaldoQtd, FSLiberado, FSBloqueado: Double);
var
  sSql: string;
  id: integer;
  Qry: TwwQuery;
begin

  Qry := TwwQuery.Create(nil);
  Qry.DatabaseName := 'BaseDados';

  try

    id := LeUltRegistro(Nil,'CARTEIRAXCUSTODIA');
    sSql := 'INSERT INTO CARTEIRAXCUSTODIA '                 +
            '(IDCARTCUST, IDINVESTIMENTO, '                  +
            ' DATA, IDCARTEIRAINVEST, IDPLANPREVCTBPATR, '   +
            ' VLRCARTEIRA, VLRCUSTODIA) '      +
            ' VALUES '                                       +
            '('+IntToStr(id)                                 +
            ','+IntToStr(iInvestimento)                      +
            ','+QuotedStr(DateToStr(dData))                  +
            ','+IntToStr(iCarteira)                          +
            ','+IntToStr(iPlanoPatro)                        +
            ',' + TrocaVirgulaPonto(FloatToStr(FSaldoQtd))   +
            ',' + TrocaVirgulaPonto(FloatToStr(FSLiberado+FSBloqueado))  +')' ;

    ExecutarQuery(Qry,sSql);

  finally
    FreeAndNil(Qry);
  end;
end;

//Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
function TRendaVariavel.TransfEntrePlanosDir(CdsDirTRCPlano : TClientDataSet;
                                             iPlanPatroO, iPlanPatroD : Integer;
                                             sObs, sBoleta, sTipoDir : String): boolean;
Var
   QryLocalTpd, QryLocalAux  : TwwQuery;

   iIdHistCustodia, iIdOperCust, iIdHistCartInv, i, iTipoOperacao, iDocumento, iPlano, iPlanilha  : Integer;

   sTipoCustodia, sNatureza, sTipoOperacao, sMens1 : String;

   CdsOperacaoInvest : TClientDataSet;

   CdsOperDirTransf  : TClientDataSet;

   CtrlRendaVariavel : TCtrlRendaVariavel;

begin
   Result := True;
   Try
      CtrlRendaVariavel := TCtrlRendaVariavel.Create;
      CtrlRendaVariavel.InitializeAs(Padroes);

      CdsOperacaoInvest      := TClientDataSet.Create(nil);

      CtrlRendaVariavel.CdsOperacaoInvest := CdsOperacaoInvest;
      CdsOperacaoInvest.Data := CtrlRendaVariavel.ListOperacaoInvest(0);

      CdsOperDirTransf       := TClientDataSet.Create(nil);

      CtrlRendaVariavel.CdsOperDirTransf := CdsOperDirTransf;
      CdsOperDirTransf.Data  := CtrlRendaVariavel.ListOperDirTransf(0);

      QryLocalTpd := TwwQuery.Create(Application);
      QryLocalTpd.DatabaseName := 'BaseDados';

      QryLocalAux := TwwQuery.Create(Application);
      QryLocalAux.DatabaseName := 'BaseDados';

      // Inicia o Processo
      Try
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('', CdsDirTRCPlano.RecordCount);

         CdsDirTRCPlano.First;
         while not CdsDirTRCPlano.EOF do
         begin
            sMens1 := 'Transferindo ' + CdsDirTRCPlano.FieldByName('DESCINVESTIMENTO').AsString;
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech(sMens1, 0);

            If not CtrlRendaVariavel.AplicaAtualOperDirTransf(CdsDirTRCPlano.FieldByName('DATAPREV').AsDateTime,
                                                              CdsDirTRCPlano.FieldByName('DATAOPERACAO').AsDateTime,
                                                              CdsDirTRCPlano.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                              iTipoInvestUsu,
                                                              iPlanPatroO, iPlanPatroD,
                                                              CdsDirTRCPlano.FieldByName('IDOPERACAODIREITO').AsInteger,
                                                              CdsDirTRCPlano.FieldByName('IDINVESTIMENTO').AsInteger,
                                                              0,0,
                                                              CdsDirTRCPlano.FieldByName('IDMOTIVOBLOQUEIO').AsInteger,
                                                              CdsDirTRCPlano.FieldByName('IDFORCLI').AsInteger,
                                                              CdsDirTRCPlano.FieldByName('IDCUSTODIANTE').AsInteger,
                                                              CdsDirTRCPlano.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                              -1{idoperacaoinvest de BAIXA},
                                                              -1{idoperacaoinvest de ACRÉSCIMO},
                                                              CdsDirTRCPlano.FieldByName('VLRTRANSFERIDO').AsFloat,
                                                              CdsDirTRCPlano.FieldByName('QTDTRANSFERIDO').AsFloat,
                                                              CdsDirTRCPlano.FieldByName('PU').AsFloat,
                                                              CdsDirTRCPlano.FieldByName('PERCTRANSFERIDO').AsFloat,
                                                              '', sObs) then
               Raise Exception.Create('Não foi possível gravar a operação de Transferência.'#13+CtrlRendaVariavel.DbOperDirTransf.MessageInfo);

//---------- ORIGEM --------------------------------------------------
            FazQuery(QryLocalAux, 'SELECT OI.QTDEOPERACAO FROM OPERACAOINVEST OI, '+#13+
                                  '(SELECT MAX(O.IDOPERACAOINVEST) AS IDOPERACAOINVEST FROM OPERACAOINVEST O '+#13+
                                  ' WHERE O.IDOPERACAODIREITO = '+CdsDirTRCPlano.FieldByName('IDOPERACAODIREITO').AsString+#13+
                                  ' AND   O.IDPLANPREVCTBPATR = '+IntToStr(iPlanPatroO)+#13+
                                  ' AND   O.IDCARTEIRAINVEST  = '+CdsDirTRCPlano.FieldByName('IDCARTEIRAINVEST').AsString+#13+
                                  ' AND   O.IDMOTIVOBLOQUEIO  = '+CdsDirTRCPlano.FieldByName('IDMOTIVOBLOQUEIO').AsString+#13+
                                  ' AND   O.IDCUSTODIANTE     = '+CdsDirTRCPlano.FieldByName('IDCUSTODIANTE').AsString+') OMAX '+#13+
                                  ' WHERE OI.IDOPERACAOINVEST = OMAX.IDOPERACAOINVEST ');

            if (QryLocalAux.FieldByName('QTDEOPERACAO').AsFloat - CdsDirTRCPlano.FieldByName('QTDTRANSFERIDO').AsFloat) < 0 then
               Raise Exception.Create('Não foi possível gravar a operação de Origem da Transferência, quantidade de origem negativa.');

            //Grava OperacaoInvest Origem
            if not CtrlRendaVariavel.AplicaAtualOperacaoInvest(CdsDirTRCPlano.FieldByName('DATAOPERACAO').AsDateTime,
                                                               0,
                                                               CdsDirTRCPlano.FieldByName('DATAPREV').AsDateTime,
                                                               0, 0, 0, 0,
                                                               CdsDirTRCPlano.FieldByName('IDTIPOOPERACAO').AsInteger{Direito propriamente},
                                                               2, iPlanPatroO, -1, -1, Sistema.IdModulo,
                                                               CdsDirTRCPlano.FieldByName('IDINVESTIMENTO').AsInteger,
                                                               CdsDirTRCPlano.FieldByName('IDFORCLI').AsInteger,
                                                               CdsDirTRCPlano.FieldByName('IDCUSTODIANTE').AsInteger,
                                                               -1,
                                                               CdsDirTRCPlano.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                               CdsDirTRCPlano.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                               -1, -1,
                                                               CdsDirTRCPlano.FieldByName('IDOPERACAODIREITO').AsInteger,
                                                               pRPI.MOECODIGO,
                                                               -1, -1, -1,
                                                               Sistema.IdEmpresa,
                                                               -1,
                                                               RoundCM( ( (QryLocalAux.FieldByName('QTDEOPERACAO').AsFloat -
                                                                                CdsDirTRCPlano.FieldByName('QTDTRANSFERIDO').AsFloat)*
                                                                                          CdsDirTRCPlano.FieldByName('PU').AsFloat),2),
                                                               CdsDirTRCPlano.FieldByName('PU').AsFloat,
                                                              ((QryLocalAux.FieldByName('QTDEOPERACAO').AsFloat -
                                                                        CdsDirTRCPlano.FieldByName('QTDTRANSFERIDO').AsFloat)),
                                                               CdsDirTRCPlano.FieldByName('PERCTRANSFERIDO').AsFloat,
                                                               0, 0, 0, 0, 0, 0,
                                                              'O', sObs, sBoleta, '', 'L','F') then
               Raise Exception.Create('Não foi possível gravar a operação de Origem da Transferência.'#13+
                                      CtrlRendaVariavel.DbOperacaoInvest.MessageInfo);

            QryLocalAux.Close;

            CtrlRendaVariavel.DbOperDirTransf.Idoperinvestorig.AsInteger := CtrlRendaVariavel.DbOperacaoInvest.Idoperacaoinvest.AsInteger;
            CtrlRendaVariavel.DbOperDirTransf.Idboleta.AsString := sBoleta;
            CtrlRendaVariavel.DbOperDirTransf.Update;

            if sTipoDir = 'S' then
            begin
               CtrlRendaVariavel.DbOperacaoInvest.Origdest.AsString := 'D';
               CtrlRendaVariavel.DbOperacaoInvest.Datavencoper.AsDateTime := CdsDirTRCPlano.FieldByName('DATAOPERACAO').AsDateTime;
               CtrlRendaVariavel.DbOperacaoInvest.Idoperacaoorigem.AsInteger := CdsDirTRCPlano.FieldByName('IDOPERACAOORIGEM').AsInteger;
               CtrlRendaVariavel.DbOperacaoInvest.Update;
            end;

//---------- DESTINO --------------------------------------------------
            //Grava OperacaoInvest Destino
            FazQuery(QryLocalAux, 'SELECT OI.QTDEOPERACAO FROM OPERACAOINVEST OI, '+#13+
                                  '(SELECT MAX(O.IDOPERACAOINVEST) AS IDOPERACAOINVEST FROM OPERACAOINVEST O '+#13+
                                  ' WHERE O.IDOPERACAODIREITO = '+CdsDirTRCPlano.FieldByName('IDOPERACAODIREITO').AsString+#13+
                                  ' AND   O.IDPLANPREVCTBPATR = '+IntToStr(iPlanPatroD)+#13+
                                  ' AND   O.IDCARTEIRAINVEST  = '+CdsDirTRCPlano.FieldByName('IDCARTEIRAINVEST').AsString+#13+
                                  ' AND   O.IDMOTIVOBLOQUEIO  = '+CdsDirTRCPlano.FieldByName('IDMOTIVOBLOQUEIO').AsString+#13+
                                  ' AND   O.IDCUSTODIANTE     = '+CdsDirTRCPlano.FieldByName('IDCUSTODIANTE').AsString+') OMAX '+#13+
                                  ' WHERE OI.IDOPERACAOINVEST = OMAX.IDOPERACAOINVEST ');

            if not CtrlRendaVariavel.AplicaAtualOperacaoInvest(CdsDirTRCPlano.FieldByName('DATAOPERACAO').AsDateTime,
                                                               0,
                                                               CdsDirTRCPlano.FieldByName('DATAPREV').AsDateTime,
                                                               0, 0, 0, 0,
                                                               CdsDirTRCPlano.FieldByName('IDTIPOOPERACAO').AsInteger{Direito propriamente},
                                                               2, iPlanPatroD, -1, -1, Sistema.IdModulo,
                                                               CdsDirTRCPlano.FieldByName('IDINVESTIMENTO').AsInteger,
                                                               CdsDirTRCPlano.FieldByName('IDFORCLI').AsInteger,
                                                               CdsDirTRCPlano.FieldByName('IDCUSTODIANTE').AsInteger,
                                                               -1,
                                                               CdsDirTRCPlano.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                               CdsDirTRCPlano.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                               -1, -1,
                                                               CdsDirTRCPlano.FieldByName('IDOPERACAODIREITO').AsInteger,
                                                               pRPI.MOECODIGO,
                                                               -1, -1, -1,
                                                               Sistema.IdEmpresa,
                                                               -1,
                                                               RoundCM( ( (QryLocalAux.FieldByName('QTDEOPERACAO').AsFloat +
                                                                                CdsDirTRCPlano.FieldByName('QTDTRANSFERIDO').AsFloat)*
                                                                                          CdsDirTRCPlano.FieldByName('PU').AsFloat),2),
                                                               CdsDirTRCPlano.FieldByName('PU').AsFloat,
                                                               (QryLocalAux.FieldByName('QTDEOPERACAO').AsFloat +
                                                                                CdsDirTRCPlano.FieldByName('QTDTRANSFERIDO').AsFloat),
                                                               CdsDirTRCPlano.FieldByName('PERCTRANSFERIDO').AsFloat,
                                                               0, 0, 0, 0, 0, 0,
                                                              'O', sObs, sBoleta, '', 'L','F') then
               Raise Exception.Create('Não foi possível gravar a operação de Destino da Transferência.'#13+
                                      CtrlRendaVariavel.DbOperacaoInvest.MessageInfo);

            QryLocalAux.Close;

            CtrlRendaVariavel.DbOperDirTransf.Idoperinvestdest.AsInteger := CtrlRendaVariavel.DbOperacaoInvest.Idoperacaoinvest.AsInteger;
            CtrlRendaVariavel.DbOperDirTransf.Update;

            if sTipoDir = 'S' then
            begin
               CtrlRendaVariavel.DbOperacaoInvest.Origdest.AsString := 'D';
               CtrlRendaVariavel.DbOperacaoInvest.Datavencoper.AsDateTime := CdsDirTRCPlano.FieldByName('DATAOPERACAO').AsDateTime;
               CtrlRendaVariavel.DbOperacaoInvest.Idoperacaoorigem.AsInteger := CdsDirTRCPlano.FieldByName('IDOPERACAOORIGEM').AsInteger;
               CtrlRendaVariavel.DbOperacaoInvest.Update;
            end;

            for i := 1 to 2 do
            begin
               if i = 1 then
               begin
                  if ABS(CdsDirTRCPlano.FieldByName('IDTIPOOPERACAO').AsInteger) > 10000 then //BAIXA
                     iTipoOperacao  := -10198
                  else
                     iTipoOperacao  := -198
               end
               else
               begin
                  if ABS(CdsDirTRCPlano.FieldByName('IDTIPOOPERACAO').AsInteger) > 10000 then //ACRÉSCIMO
                     iTipoOperacao  := -10199
                  else
                     iTipoOperacao  := -199;
               end;
               // Capta a descrição do Tipo de Operação no cadastro
               QryLocalTpd.Close;
               QryLocalTpd.Sql.Clear;
               QryLocalTpd.Sql.Add('SELECT TIPOOPERACAO.DESCTIPOOPERACAO, TIPOOPERACAO.TIPCREDOR, ');
               QryLocalTpd.Sql.Add('       TIPOOPERACAO.IDTIPOOPERACAO, TIPOOPERACAO.RECPAG, ');
               QryLocalTpd.Sql.Add('       TIPOOPERACAO.NATUREZAOPERACAO ');
               QryLocalTpd.Sql.Add('FROM TIPOOPERACAO ');
               QryLocalTpd.Sql.Add('WHERE (TIPOOPERACAO.IDTIPOINVEST   = '+ IntToStr(iTipoInvestUsu)+')');
               QryLocalTpd.Sql.Add('  AND (TIPOOPERACAO.IDTIPOOPERACAO = '+ IntToStr(iTipoOperacao)+')');
               QryLocalTpd.Open;
               sNatureza     := QryLocalTpd.FieldByName('NATUREZAOPERACAO').AsString;
               sTipoOperacao := QryLocalTpd.FieldByName('DESCTIPOOPERACAO').AsString;
               iTipoOperacao := QryLocalTpd.FieldByName('IDTIPOOPERACAO').AsInteger;
               QryLocalTpd.Close;

               if iTipoOperacao = 0 then
                  Raise Exception.Create('Não foi encontrado o Tipo de Operação = '+IntToStr(iTipoOperacao)+'!'+#13+
                                         'Verifique o cadastro de Tipos de Operação.');
               if i = 1 then
                  CtrlRendaVariavel.DbOperDirTransf.Idtipooperorig.AsInteger  := iTipoOperacao{Origem}
               else
                  CtrlRendaVariavel.DbOperDirTransf.Idtipooperdest.AsInteger  := iTipoOperacao{Destino};

               CtrlRendaVariavel.DbOperDirTransf.Update;

               if Assigned(AtualizaProcFech) then
                  AtualizaProcFech(sMens1 + #13 + 'Atualizando Histórico.', 0);

               if (sTipoDir = 'S') then
               begin
                  if not LancaTransfDirSubs(iTipoOperacao,
                                            CdsDirTRCPlano.FieldByName('IDINVESTIMENTO').AsInteger,
                                            OperComum.IIF(i = 1, CtrlRendaVariavel.DbOperDirTransf.Idoperinvestorig.AsInteger,
                                                                 CtrlRendaVariavel.DbOperDirTransf.Idoperinvestdest.AsInteger),
                                            CdsDirTRCPlano.FieldByName('IDCARTEIRAINVEST').AsInteger,                                                                 
                                            CdsDirTRCPlano.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                            OperComum.IIF(i = 1, iPlanPatroO, iPlanPatroD),
                                            CdsDirTRCPlano.FieldByName('IDCUSTODIANTE').AsInteger,
                                            OperComum.IIF(CdsDirTRCPlano.FieldByName('IDMOTIVOBLOQUEIO').IsNull, -1,
                                                                         CdsDirTRCPlano.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                                            -1,
                                            CdsDirTRCPlano.FieldByName('DATAOPERACAO').AsDateTime,
                                            CdsDirTRCPlano.FieldByName('VLRTRANSFERIDO').AsFloat,
                                            CdsDirTRCPlano.FieldByName('QTDTRANSFERIDO').AsFloat,
                                            CdsDirTRCPlano.FieldByName('DESCINVESTIMENTO').AsString, sBoleta, sTipoOperacao, sNatureza) then
                     Raise Exception.Create('A operação de transferência de direitos será cancelada.');
               end;
            end;

            CdsDirTRCPlano.Next;
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('');
         end;

         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('', CdsDirTRCPlano.RecordCount);         

         if (sTipoDir = 'S') then
         begin
            sMens1 := 'Transferência de Susbcrição - Atualização de saldo de carteira ';
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech(sMens1, 0);

            if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
               Raise Exception.Create('Não foi possivel atualizar os saldos da carteira.');

            sMens1 := 'Transferência de Susbcrição - Atualização de saldo de custódia';
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech(sMens1, 0);

            if not OperacaoInvest.AtualizaSaldosCustodia then
               Raise Exception.Create('Não foi possivel atualizar os saldos da custódia.');
         end;

         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('', CdsDirTRCPlano.RecordCount);

         iDocumento:= -1;
         iPlano    := -1;
         iPlanilha := -1;

         CdsDirTRCPlano.First;
         while not CdsDirTRCPlano.EOF do
         begin

            sMens1 := 'Transferência de Direitos - Integração Contábil ';

            if Assigned(AtualizaProcFech) then
               AtualizaProcFech(sMens1, 0);

            // Variáveis para Contabilização
            bCriaLancto := False;
            wTipoRecDesBol := '';

            if ABS(CdsDirTRCPlano.FieldByName('IDTIPOOPERACAO').AsInteger) > 10000 then //BAIXA
               iTipoOperacao  := -10198
            else
               iTipoOperacao  := -198;

            //Contabiliza por Plano/Patro
            OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                    CdsDirTRCPlano.FieldByName('IDINVESTIMENTO').AsInteger,
                                    iTipoOperacao,
                                    -1,
                                    CdsDirTRCPlano.FieldByName('IDFORCLI').AsInteger,
                                    CdsDirTRCPlano.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    pRPI.MOECODIGO, '','','','','',
                                    wTipoRecDesBol,
                                    bCriaLancto,
                                    CdsDirTRCPlano.FieldByName('VLRTRANSFERIDO').AsFloat,
                                    CdsDirTRCPlano.FieldByName('VLRTRANSFERIDO').AsFloat,
                                    CdsDirTRCPlano.FieldByName('DATAOPERACAO').AsDateTime,
                                    CdsDirTRCPlano.FieldByName('DATAOPERACAO').AsDateTime,
                                    iPlano, iPlanilha, iDocumento, wMensErro,'N',False,False, 0, True,
                                    iPlanPatroO);
            if Trim(wMensErro) <> '' then
               Raise Exception.Create('Ocorreu um problema na contabilização da operação :' + wMensErro);

            wTipoRecDesBol := '';

            if ABS(CdsDirTRCPlano.FieldByName('IDTIPOOPERACAO').AsInteger) > 10000 then //ACRÉSCIMO
               iTipoOperacao  := -10199
            else
               iTipoOperacao  := -199;

            //Contabiliza por Plano/Patro
            OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                    CdsDirTRCPlano.FieldByName('IDINVESTIMENTO').AsInteger,
                                    iTipoOperacao,
                                    -1,
                                    CdsDirTRCPlano.FieldByName('IDFORCLI').AsInteger,
                                    CdsDirTRCPlano.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    pRPI.MOECODIGO, '','','','','',
                                    wTipoRecDesBol,
                                    bCriaLancto,
                                    CdsDirTRCPlano.FieldByName('VLRTRANSFERIDO').AsFloat,
                                    CdsDirTRCPlano.FieldByName('VLRTRANSFERIDO').AsFloat,
                                    CdsDirTRCPlano.FieldByName('DATAOPERACAO').AsDateTime,
                                    CdsDirTRCPlano.FieldByName('DATAOPERACAO').AsDateTime,
                                    iPlano, iPlanilha, iDocumento, wMensErro,'N',False,False, 0, True,
                                    iPlanPatroD);
            if Trim(wMensErro) <> '' then
               Raise Exception.Create('Ocorreu um problema na contabilização da operação :' + wMensErro);

            CdsDirTRCPlano.Next;
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('');               
         end;

         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('', CdsDirTRCPlano.RecordCount);         

         // Atualiza a Boleta com a Planilha
         if iPlanilha > 0 then
         begin
            QryLocalTpd.Close;
            QryLocalTpd.SQL.Clear;
            QryLocalTpd.SQL.Add(' UPDATE BOLETA SET ');
            if iPlano <> -1 then
               QryLocalTpd.SQL.Add(' BOLETA.PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ')
            else
               QryLocalTpd.SQL.Add(' BOLETA.PLANO     = '''' ,');
            if iPlanilha <> -1 then
               QryLocalTpd.SQL.Add(' BOLETA.PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilha)) + ' ')
            else
               QryLocalTpd.SQL.Add(' BOLETA.PLNCODIGO = '''' ');
            QryLocalTpd.SQL.Add('WHERE BOLETA.IDBOLETA = ' + QuotedStr(sBoleta) + ' ');
            QryLocalTpd.ExecSQL;
         end;

         CdsDirTRCPlano.First;
         while not CdsDirTRCPlano.EOF do
         begin
            if (CdsDirTRCPlano.FieldByName('DATAOPERACAO').AsDateTime <= pRPI.DATAULTFECH) then
            begin
               sMens1 := 'Marcando Investimento para Reprocessamento ' + CdsDirTRCPlano.FieldByName('DESCINVESTIMENTO').AsString;
               if Assigned(AtualizaProcFech) then
                  AtualizaProcFech(sMens1, 0);

               // Carteira Origem
               if not RendaVariavel.MarcarFlagReproc(CdsDirTRCPlano.FieldByName('IDINVESTIMENTO').AsInteger,
                                                     CdsDirTRCPlano.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                     iPlanPatroO,
                                                     CdsDirTRCPlano.FieldByName('DATAOPERACAO').AsDateTime,
                                                     False, True, True, False, 'TPD') then
                  Raise Exception.Create('Não foi possível marcar ' + CdsDirTRCPlano.FieldByName('DESCINVESTIMENTO').AsString + 'para Reprocessamento no Plano de Origem.');

               // Carteira Destino
               if not RendaVariavel.MarcarFlagReproc(CdsDirTRCPlano.FieldByName('IDINVESTIMENTO').AsInteger,
                                                     CdsDirTRCPlano.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                      iPlanPatroD,
                                                     CdsDirTRCPlano.FieldByName('DATAOPERACAO').AsDateTime,
                                                     False, True, True, False, 'TPD') then
                  Raise Exception.Create('Não foi possível marcar ' + CdsDirTRCPlano.FieldByName('DESCINVESTIMENTO').AsString + 'para Reprocessamento no Plano de Destino.');
            end;

            CdsDirTRCPlano.Next;
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('');
         end;

      Except
         On E:Exception Do
         Begin
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         End;
      End;
  Finally
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('', -2);
      FreeAndNil(CdsOperacaoInvest);
      FreeAndNil(CdsOperDirTransf);
      FreeAndNil(CtrlRendaVariavel);
      FreeAndNil(QryLocalTpd);
      FreeAndNil(QryLocalAux);
  end;
end;

//Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
function TRendaVariavel.LancaBoletaTRD(dDataProc: TDateTime;
                                       iInvestimento, iCarteiraInvest, iPlanPrev: Integer): Boolean;
var j : Integer;
    qryLocalTRD : TwwQuery;
begin
   try
      qryLocalTRD := TwwQuery.Create(Application);
      qryLocalTRD.DatabaseName := 'BaseDados';
      try
         OperComum.LimpaParametros(DMRendaVariavel.qryBuscaBoletaTRD);
         DMRendaVariavel.qryBuscaBoletaTRD.ParamByName('IDBOLETA').AsString  := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
         DMRendaVariavel.qryBuscaBoletaTRD.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         DMRendaVariavel.qryBuscaBoletaTRD.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteiraInvest;
         DMRendaVariavel.qryBuscaBoletaTRD.ParamByName('DATAOPERACAO').AsString := DateToStr(dDataProc);
         DMRendaVariavel.qryBuscaBoletaTRD.Open;

         while not DMRendaVariavel.qryBuscaBoletaTRD.Eof do
         begin
            for j := 1 to 2 do
            begin
               FazQuery(qryLocalTRD, 'SELECT OI.IDOPERCUSTODIA FROM OPERACAOINVEST OI WHERE IDOPERACAOINVEST = '+
                                        OperComum.IIF(j = 1, DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDOPERINVESTORIG').AsString,
                                                             DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDOPERINVESTDEST').AsString));

               if not LancaTransfDirSubs(OperComum.IIF(j = 1, DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDTIPOOPERORIG').AsInteger,
                                                              DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDTIPOOPERDEST').AsInteger),
                                         DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDINVESTORIG').AsInteger,
                                         OperComum.IIF(j = 1, DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDOPERINVESTORIG').AsInteger,
                                                              DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDOPERINVESTDEST').AsInteger),
                                         DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDCARTINVESTORIG').AsInteger,
                                         DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                         OperComum.IIF(j = 1, DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDPLANPREVCTBPATRORIG').AsInteger,
                                                              DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDPLANPREVCTBPATRDEST').AsInteger),
                                         DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDCUSTODIAORIG').AsInteger,
                                         OperComum.IIF(DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDMOTIVOBLOQORIG').IsNull, -1,
                                                         DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDMOTIVOBLOQORIG').AsInteger),
                                         qryLocalTRD.FieldByName('IDOPERCUSTODIA').AsInteger,
                                         DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('DATAOPERACAO').AsDateTime,
                                         DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('VLROPERACAO').AsFloat,
                                         DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('QTDEOPERACAO').AsFloat,
                                         DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('DESCINVESTIMENTO').AsString,
                                         DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('IDBOLETA').AsString,
                                         OperComum.IIF(j = 1, DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('DESCTIPOOPERB').AsString,
                                                              DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('DESCTIPOOPERA').AsString),
                                         OperComum.IIF(j = 1, DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('NATUREZAOPERB').AsString,
                                                              DMRendaVariavel.qryBuscaBoletaTRD.FieldByName('NATUREZAOPERA').AsString)) then
                  Raise Exception.Create('A operação de transferência de direitos será cancelada.');
            end;
            DMRendaVariavel.qryBuscaBoletaTRD.NEXT;
         end;

         if (DMRendaVariavel.qryBuscaBoletaTRD.RecordCount > 0)  then
         begin
            if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
               Raise Exception.Create('Não foi possivel atualizar os saldos da carteira.');

            if not OperacaoInvest.AtualizaSaldosCustodia then
               Raise Exception.Create('Não foi possivel atualizar os saldos da custódia.');
         end;         

         result := True;
      except
         on E:Exception do
         begin
            MsgDlg('Ocorreu um problema ao lançar as transferências das Subscrições.' + #13 +
                   E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            result := False;
         end;
      end;
   finally
     qryLocalTRD.Close;
     FreeAndNil(qryLocalTRD);
     DMRendaVariavel.qryBuscaBoletaTRD.Close;
   end;
end;

//Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
function TRendaVariavel.LancaTransfDirSubs(iTipoOperacao, iInvestimento, iOperInvest, iCarteiraInvest, iCarteiraGerenc,
                                           iPlanoPrevCtbPatrL, iCustodiante, iMotivoBloq, iOperCust : Integer;
                                           dDataOper : TDateTime;
                                           fValorTransf : Currency;
                                           fQtdTransf : Double;
                                           sDescInvest, sBoleta, sDescTipoOper, sNatureza : String) : Boolean;
var
   iIdHistCustodia, iIdHistCartInv : Integer;
   QryLocal  : TwwQuery;
   sTipoCustodia : String;   
begin
   try
      QryLocal := TwwQuery.Create(Application);
      QryLocal.DatabaseName := 'BaseDados';
      try
         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                           iInvestimento, 2,
                                           iOperInvest, -1,
                                           iTipoOperacao,
                                           iCarteiraInvest,
                                           iCarteiraGerenc,
                                           -1, -1, -1, -1, -1,
                                           dDataOper,
                                           fValorTransf,
                                           fQtdTransf,
                                           pRPI.VLRCOTAINICART,
                                           0, 0, 0 , 0, 0, 0, 0, 0, 0,
                                           sNatureza {Movimento},
                                           sNatureza {Operacao},
                                           '',
                                           Trim(sDescTipoOper) + ' / ' +Trim(sDescInvest),
                                           'OPE', '1', '', True, -1,
                                           iPlanoPrevCtbPatrL, iIdHistCartInv) then
            Raise Exception.Create('Não foi possível inserir os Históricos das Operações de Baixa.');

         if iOperCust <= 0 then
         begin
            // Relança a Custódia
            iOperCust := LeUltRegistro(Nil,'OPERCUSTODIA');

            if not OperacaoInvest.AlimentaOperCustodia(iOperCust, -1, -1, -1, -1,
                                                       iCarteiraInvest, iCarteiraInvest,
                                                       iInvestimento,
                                                       iCustodiante, iCustodiante,
                                                       iMotivoBloq, iMotivoBloq,
                                                       fQtdTransf,
                                                       dDataOper,
                                                       '', sBoleta,
                                                       iPlanoPrevCtbPatrL, iTipoOperacao, iPlanoPrevCtbPatrL) Then
               Raise Exception.Create('Não foi possível lançar a Custódia da boleta ' + sBoleta);

            ExecutarQuery(QryLocal,'UPDATE OPERACAOINVEST ' +
                                   'SET OPERACAOINVEST.IDOPERCUSTODIA = ' + IntToStr(iOperCust) + ' ' +
                                   'WHERE OPERACAOINVEST.IDOPERACAOINVEST = '+IntToStr(iOperInvest));

            QryLocal.Close;
         end;

         if ((iTipoOperacao = -199) or (iTipoOperacao = -10199)) then
         begin
            if iMotivoBloq = -1 then
               sTipoCustodia := 'C'
            else
               sTipoCustodia := 'Y';  //AUMENTA SALDO BLOQUEADO
         end      
         else if ((iTipoOperacao = -198) or (iTipoOperacao = -10198)) then
         begin
            if iMotivoBloq = -1 then
               sTipoCustodia := 'V'
            else
               sTipoCustodia := 'Z';  //DIMINUI BLOQUEADA
         end;

         if not OperacaoInvest.InsereCustodia(iCarteiraInvest,
                                              iInvestimento,
                                              iCustodiante,
                                              iMotivoBloq,
                                              iOperInvest,
                                              iOperCust, '',
                                              sTipoCustodia,
                                              dDataOper,
                                              fQtdTransf,
                                              iIdHistCustodia,
                                              iPlanoPrevCtbPatrL) then
            Raise Exception.Create('Não foi possível atualizar um histórico de custodia da boleta '+ sBoleta);
         result := true;
      except
         on E:Exception do
         begin
            MsgDlg('Não foi possível efetuar a Transferência entre planos de Subscrição' + #13 +
                   E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            result := false;
         end;
      end;
   finally
      FreeAndNil(QryLocal); 
   end;
end;

end.
