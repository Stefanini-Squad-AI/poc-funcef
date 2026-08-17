//******************************************************************************
//Data	      : 10/10/2011
//Responsável : Otacilio Aquino
//Kintana     : 1445208
//SOL         : 166117
//Motivo(S)   : Alteração nos valores dos relatórios após alteração de vigencia da data de contabilização.
//******************************************************************************
// Rotina     : LancaOperRFRV();
// SOL        : 139979
// Kintana    : 879638
// Data       : 12/08/2010
// Responsável: Adilson Filho
// Descrição  : Correção Unidade de Negocio a receber -1.
//******************************************************************************
// Rotina     : LancaOperPendRV();
// SOL        : 130989
// Kintana    : 739640
// Data       : 12/02/2010
// Responsável: William M. - Renan Cristiano
// Descrição  : Incluído filtro no select para trazer a conta contábil baseado na vigência atual.
//******************************************************************************
// Rotina     : LancaOperPendRV();
// SOL        : 130989
// Kintana    : 739640
// Data       : 12/02/2010
// Responsável: William M. - Renan Cristiano
// Descrição  : Incluído filtro no select para trazer a conta contábil baseado na vigência atual.
//******************************************************************************
// Rotina     : MarcarFlagReproc
// SOL        : 107630
// Kintana    : 484313
// Data       : 19/02/2009
// Responsável: Renan Cristiano
// Descrição  : Implementação na operação de MarcarFlagReproc, parametro adicionado
//              para saber qual o tipo de transferencia esta sendo executada(TRC/TRP).
//******************************************************************************
// Rotina     : LancaOperRFRV(
// SOL        : 97195
// Kintana    : 421956
// Data       : 01/10/2008
// Responsável: Ricardo Cristiano
// Descrição  : A funcionalidade volta a apresentar a mensagem de divergência no
//               rateio e não efetuará a integração com o Financeiro. A crítica
//               indica a necessidade de verificar a parametrização da operação e
//               suas devidas integrações. E o estoque da ação não será atualizado.
//******************************************************************************
// Rotina     : LancaOperRFRV(
// SOL        : 96981
// Kintana    : 420918
// Data       : 26/09/2008
// Responsável: Ricardo Cristiano
// Descrição  : Implementação de contorno, pelo fato do fechamento de uma boleta
//               não efetivar a integração financeira. Ocorrendo a mensagem "Não
//                foi possível fechar esta boleta. O valor do lançamento é
//                diferente do valor do rateio. Verifique!"
//******************************************************************************
// Rotina     : AlimentaCarteira(
// SOL        : 96592
// Kintana    : 418922
// Data       : 24/09/2008
// Responsável: Ricardo Cristiano
// Descrição  : Implementação na query "qryInsertHistCartInv", para ser criado o
//               SQL dinamicamente
//******************************************************************************
// Rotina     : BuscaCotacaoAcao
// SOL        : 92822
// Kintana    : 389089
// Data       : 11/08/2008
// Responsável: Ricardo Cristiano
// Descrição  : Instrução CGPC 025 que altera a precificação dos ativos de mercado a vista.
//******************************************************************************
// Data	     : 28/05/2008
// Codigo    : AL_109
// Pendência : 24716
// SOL       : 55534
// Função    : Out of Memory
//******************************************************************************
// Data      : 12/11/2007
// Código    : AL_108
// Pendencia : 26852
// Desc      : Acerto no processamento de BM&*F
//******************************************************************************
// Data      : 02/10/2007
// Código    : AL_107
// Pendencia : 26386
// SOL       :
// Desc      : Atulizando a chamada CtrlInvContab.BuscaPadrLanc.Executa
//             incluindo o Plano/Patro
//             Ajuste no controle de mensagens
//******************************************************************************
// Data      : 21/09/2007
// Código    : AL_106
// Pendencia : 26357
// SOL       : 69119
// Desc      : Ajuste para: Empréstimo de Ações
//*****************************************************************************
// Data	     : 13/09/2007
// Código    : Al_105
// Pendencia : 26349
// SOL       : 69001
// Motivo(S) : Acerto na contabilização de Transferência Entre Carteiras com tipo
//             de Conta CCI
//******************************************************************************
// Data      : 04/09/2007
// Código    : AL_104
// Pendencia : 26269
// SOL       : 68079
// Desc      : Na rotina AlimentaCarteira( para a natureza "F", referente a operação
//             de Grupamento foi implementando o tratamento de conta CC e CCI,
//             para montar o histórico corretamente
//*****************************************************************************
// Data	     : 19/07/2007
// Código    : Al_103
// Pendencia : 25813
// SOL       :
// Motivo(S) : Implementação da rotina para gravação na tabela LogtotalPrev
//*****************************************************************************
// Data	     : 10/07/2007
// Código    : Al_102
// Pendencia : 25829
// SOL       :
// Motivo(S) : Acerto no tratamento do AL_100 que estava apresentando erro quando
//             não for parametrizado o TipoOperacao -109
//********************************************************************************************************
// Data	     : 19/06/2007
// Codigo    : AL_101
// Pendência :
// SOL       :
// Função    : Acerto no parametro de Centro de Custo que estava com o Centro de Responsabilidade
//*****************************************************************************
// Data	     : 31/05/2007
// Código    : Al_100
// Pendencia : 25509
// SOL       :
// Motivo(S) : Implementaçâo de tratamento para identificar o Tipo de Operação
//              que traz as contas transitórias de liquidação para operações de
//              Renda Variável;
//******************************************************************************
// Data      : 21/05/2007
// Código    : AL_99
// Pendencia : 25354
// SOL       : 60201
// Motivo    : Implementação do plano/patrocinadora na rotina de LancaOperPendRV(
//******************************************************************************
// Data      : 19/04/2007
// Código    : AL_98
// Pendencia : 24388
// SOL       : 53035
// Desc      : Acerto no Update de Boleta
//******************************************************************************
// Data      : 03/04/2007
// Código    : AL_97
// Pendencia : 24774
// SOL       : 55877
// Desc      : Acerto na LancaOperRfRv que estava deixando o iPlano com Zero
//******************************************************************************
// Data      : 02/04/2007
// Código    : AL_96
// Pendencia : 24774
// SOL       : 55877
// Desc      : Implementação da critica de tratamento de Liga/Desliga a integração
//             contabil financeira por módulo, na rotina de pendência de liquidação de bolsa.
//             Por apenas afetar o financeiro para esse tipo de operação.
//******************************************************************************
// Data      : 28/03/2007
// Código    : AL_95
// Pendencia :
// SOL       :
// Desc      : Acerto nas mensagens
//******************************************************************************
// Data      : 27/03/2007
// Código    : AL_94
// Pendencia : 24774
// SOL       : 55877
// Desc      : Implementação de ajuste na rotina de EstornaOper( que so é usada
//             para a operação de Resgate de Fundos de Investimento com Compra de Ações
//******************************************************************************
// Data      : 26/03/2007
// Código    : AL_93
// Pendencia : 24774
// SOL       : 55877
// Desc      : Implementação de ajuste na rotina de integração financeira da
//             operação de Pendência liquidação de bolsa.
//******************************************************************************
// Data      : 22/03/2006
// Código    : AL_92
// Pendencia : 24841
// SOL       : 56265
// Desc      : Tratamento para Restituicao de Capital
//******************************************************************************
// Data      : 20/03/2007
// Código    : AL_91
// Pendencia : 24774
// SOL       : 55877
// Desc      : Liga/Desliga a integração contabil financeira por módulo
//******************************************************************************
// Data      : 08/03/2007
// Código    : AL_90
// Pendencia : 24689
// SOL       : 55325
// Desc      : Acerto na passagem de parâmetro de CC e CCI
//******************************************************************************
// Data      : 12/02/2007
// Código    : AL_89
// Pendencia :
// SOL       :
// Desc      : Ajuste na AtualizaSaldos para gerar exceção quando o saldo final
//               de quantidade for menor que zero
//             Ajuste nas mensagens de erro
//******************************************************************************
// Data      : 25/01/2007
// Código    : AL_88
// Pendencia : 23674
// SOL       :
// Desc      : Ajuste na gravação da boleta
//******************************************************************************
// Data      : 04/01/2007
// Código    : AL_87
// Pendencia : 24122
// SOL       :
// Desc      : Acerto nas mensagens de erro em 3 camadas
//******************************************************************************
// Data      : 05/12/2006
// Código    : AL_86
// Pendencia : 23674
// SOL       : 47946
// Desc      : Segregação de Recursos
//******************************************************************************
// Data      : 05/12/2006
// Código    : AL_85
// Pendencia : 23213
// SOL       : 45954
// Desc      : Centro de Custo Único para Contábil e Financeiro
//******************************************************************************
// Data      : 17/10/2006
// Código    : AL_84
// Pendencia :
// SOL       :
// Desc      : Ajuste na provisão de perda
//               Contabilização da partida independente de haver variação
//******************************************************************************
// Data      : 25/09/2006
// Código    : AL_83
// Pendencia : 22965
// SOL       :
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 28/08/2006
// Código    : AL_82
// Pendencia : 22957
// SOL       :
// Desc      : Exclusão da OperacaoInvest pela  ProcExcluiCustodia
//             Implemetação de Transf. de Planos na AtualizaSaldos
//******************************************************************************
// Data      : 28/07/2006
// Código    : AL_81
// Pendencia :
// SOL       :
// Desc      : Acerto na BuscaForCli para não validar o tipodeoperacao com o
//               acesso do usuário
//******************************************************************************
// Data      : 24/07/2006
// Código    : AL_80
// Pendencia : 22895
// SOL       : 44950
// Desc      : Implementação para permitir contabilização de Incorporação qdo o
//             valor da operação for Zero.
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_79
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_78
// Pendencia:
// SOL      :
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 06/07/2006
// Código   : AL_77
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda para RV
//******************************************************************************
// Data     : 21/06/2006
// Código   : AL_76
// Pendencia:
// SOL      :
// Desc     : Implementação de Contabilização de Renda Variavel para a Refer onde
//            as despesas são lançadas para Custo e o Lucro para Variação
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_75
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 23/05/2006
// Código   : AL_74
// Pendencia: 22424
// SOL      : 43459
// Desc     : Ajuste na AtualizaSaldos para buscar o saldo de Custo e Variação
//              quando existires mais de um custodiante ou motivo de bloqueio
//              na custódia
//******************************************************************************
// Data     : 25/04/2006
// Código   : AL_73
// Pendencia: 22047
// SOL      : 42021
// Desc     : Implementação de Contabilização de Incorporação de Variação quando
//            o saldo de variação é negativo
//******************************************************************************
// Data     : 17/04/2006
// Código   : AL_72
// Pendencia: 22047
// SOL      : 42021
// Desc     : Implementação de Histórico Contábil de Incorporacao e alteração para
//            na carregar a variação para a Ação de Destino
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_71
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//******************************************************************************
// Data     : 27/03/2006
// Código   : AL_70
// Pendencia:
// SOL      :
// Desc     : Ajuste na exclusão da planilha (Se o plano NÃO for nulo)
//******************************************************************************
// Data     : 18/03/2006
// Código   : AL_69
// Pendencia: 21714
// SOL      : 41065
// Desc     : Ajuste no calculo do lucro e das despesas para a solicitação
//               do Ribas
//******************************************************************************
// Data     : 17/03/2006
// Código   : AL_68
// Pendencia:
// SOL      :
// Desc     : Melhora na performance da exclusão de boleta e reprocessamento
//******************************************************************************
// Data     : 09/03/2006
// Código   : AL_67
// Pendencia: 21714
// SOL      : 41065
// Desc     : A Funcef voltou a solicitar que não diminuisse as Despesas do Lucro
//******************************************************************************
// Data     : 07/03/2006
// Código   : AL_66
// Pendencia:
// SOL      :
// Desc     : Ajuste nas rotinas IIF Overloaded
//******************************************************************************
// Data     : 06/03/2006
// Código   : AL_65
// Pendencia:
// SOL      :
// Desc     : Reengenharia do reprocessamento de transferencia
//          : Reprocessamento linear
//********************************************************************************************************
//Data	    :  16/01/2006
//Código    :  AL_64
//Função    :  Ajuste para não apagar o Documento da boleta, quando este não for passado
//             Exclusão da AL_63, a nova forma de Marcar o FLG substitui este INI pelo REP temporário
//********************************************************************************************************
//Data	    :  16/01/2006
//Código    :  AL_63
//Função    :  Melhoria no reprocessamento de Transf entre Carteira
//********************************************************************************************************
//Data	    :  11/01/2006
//Código    :  AL_62
//Pendencia :
//Sol       :
//Função    :  Implementação de contabilitação diferenciada por investimento
//********************************************************************************************************
//Data	    :  11/01/2006
//Código    :  AL_61
//Pendencia :
//Sol       :
//Função    :  Ajuste na identação
//********************************************************************************************************
//Data	    :  26/12/2005
//Código    :  AL_60
//Pendencia :
//Sol       :
//Função    :  Ajuste no reprocessamento de Cisão
//********************************************************************************************************
//Data	    :  20/12/2005
//Código    :  AL_59
//Pendencia :
//Sol       :
//Função    :  Ajuste no calculo da transferencia de Custo e Variação na operação
//               de transferencia entre carteiras
//********************************************************************************************************
//Data	    :  13/12/2005
//Código    :  AL_58
//Pendencia :  21025
//Sol       :  39102
//Função    :  Deve levar em consideração o saldo negativo de variação
//********************************************************************************************************
//Data	    :  22/11/2005
//Código    :  AL_57
//Função    :  Acerto na Variação (Destino) de operações de Incorporação e Alteração de Tipo
//********************************************************************************************************
//Data	    :  09/11/2005
//Código    :  AL_56
//Função    :  Acerto no Custo (Destino) de operações de Incorporação e Alteração de Tipo
//********************************************************************************************************
//Data	    :  03/11/2005
//Código    :  AL_55
//Função    :  Implementação o tratamento contabil para inverter as contas do destino da operação de Subscrição com Ações
//********************************************************************************************************
//Data	    :  27/10/2005
//Código    :  AL_54
//Função    :  Implementação o tratamento contabil da operação de Susbcrição com Ações
//********************************************************************************************************
//Data	    :  26/10/2005
//Código    :  AL_53
//Função    :  Implementado o motivo de bloqueio do saldo origem para a TransfEntreCarteiras
//********************************************************************************************************
//Data	    :  26/10/2005
//          :  AL_52
//Função    :  Acerto na gravação da wMovimVar da AtualizaSaldos para somente calcular se for TipoOperacao=-93
//             pois a mesma estava sendo calculada e com isso gerando valor de atualização nas demais operações
//             Verificar depois se o calculo feito na AL_49 vai dar problema qdo retirado por esta AL_
//********************************************************************************************************
//Data	    :  25/10/2005
//          :  AL_51
//Função    :  Gravação de Registro INI (Zerado) na AlimentaCarteira para resolver o problema do reprocessa
//             mento qdo não existe registro anterior;
//********************************************************************************************************
//Data	    :  05/10/2005
//Código    :  AL_50
//Função    :  Implementação do TipoOperacao -124 e -125 para Ajuste de Aumento e Baixa de Quantidade sem
//             ajuste dos Saldos
//********************************************************************************************************
//Data	    : 30/09/2005
//Código    : Al_49
//Motivo(S) : Implementação do custo e da variação com tratamento para ajuste de saldo
//********************************************************************************************************
//Data	    : 28/09/2005
//Código    : Al_48
//Motivo(S) : Acerto na busca de saldos para Grupamento e implementação da função VerificaGrupamentoAnterior
//********************************************************************************************************
//Data	    : 20/09/2005
//Código    : Al_47
//Motivo(S) : Alteração no filtro do tipo de despesa
//********************************************************************************************************
//Data	    : 20/09/2005
//Código    : Al_46
//Motivo(S) : Implementação da o item de permuta
//********************************************************************************************************
//Data	    : 15/09/2005
//Código    : Al_45
//Motivo(S) : Implementação da contabilização da Permulta por tipo de despesa.
//********************************************************************************************************
//Data	    : 06/09/2005
//Código    : Al_44
//Motivo(S) : Ajuste para não dar erro ao fechar o form de Atualização de Sequences no
//            meio do processo
//********************************************************************************************************
//Data	    : 31/08/2005
//Código    : Al_43
//Motivo(S) : Retirada o bloco que abre a QrySaldoCarteira pq nâo ser para nada
//********************************************************************************************************
//Data	    : 31/08/2005
//Código    : Al_42
//Motivo(S) : Round(2) no MOVIMAQUI para evitar que o campo tenha mais de 2 decimais
//********************************************************************************************************
//Data	    : 29/08/2005
//Código    : Al_41
//Motivo(S) : Overloaded do metodo OraNumero( [fNumero, sNumero] : [Double,String] ): String;
//********************************************************************************************************
//Data	    : 21/06/2005
//Código    : Al_40
//Motivo(S) : Implementação e ajuste de mensagens na rotina de TransfEntreCarteiras
//********************************************************************************************************
//Data	    : 17/06/2005
//Código    : Al_39
//Motivo(S) : Adaptação da rotina TransfEntreCarteiras para CCI
//********************************************************************************************************
//Data	    : 01/06/2005
//Código    : Al_38
//Motivo(S) : Nova Rotina OraNumero( sNumero : String ): String;
//********************************************************************************************************
//Data	    : 31/05/2005
//Código    : Al_37
//Motivo(S) : Implementação do tratamento para contas contábeis cadastradas erradas no Sistema. A rotina que faz o
//            teste e uma procedure e não devolve nenhuma mensagem.
//********************************************************************************************************
//Data	    : 23/05/2005
//Código    : Al_36
//Motivo(S) : Implementação do teste de período contabil em 3 camadas
//********************************************************************************************************
//Data	    : 03/05/2005
//Código    : Al_35
//Motivo(S) : Calculo do custo transferido na operação de Alteração de Tipo
//********************************************************************************************************
//Data	    : 27/04/2005
//Código    : Al_34
//Motivo(S) : Não precisa testar o período contábil se não for excluir nenhuma planilha
//            nem nenhum documento
//********************************************************************************************************
//Data	    : 25/04/2005
//Código    : Al_33
//Motivo(S) : Implementação do tratamento de natureza "R" para recebimento e
//            para considerar a diminuição do custo qdo "Restituição de Capital"
//********************************************************************************************************
//Data	    : 25/04/2005
//Código    : Al_32
//Motivo(S) : Retirado, devido ao novo conceito de Restitução de Capital
//********************************************************************************************************
//Data	    : 25/04/2005
//Código    : Al_31
//Motivo(S) : Todas as Despesas afetam o saldo do Investimento na carteira, inclusive o Lucro
//            As despesas só alteram o Custo na compra, na venda é a qtd vendida * (PU médio do custo)
//********************************************************************************************************
//Data	    : 18/04/2005
//Código    : Al_30
//Motivo(S) : Retirada da AL_27 pois não é para considerar na Funcef
//********************************************************************************************************
//Data	    : 29/03/2005
//Código    : Al_29
//Motivo(S) : Criada a rotina TotalSaldosInvCart
//********************************************************************************************************
//Data	    : 23/03/2005
//Código    : Al_28
//Motivo(S) : Retirado a rotina "DeleteRegAtuProximos" por não estar sendo utilizado no sistema
//********************************************************************************************************
//Data	    : 22/03/2005
//Código    : Al_27
//Motivo(S) : Retirada do AL_3 para fazer em qq Fundação
//********************************************************************************************************
//Data	    : 16/03/2005
//Código    : Al_26
//Motivo(S) : Acerto na rotina de ComparaValores
//********************************************************************************************************
//Data	    : 08/03/2005
//Código    : Al_25
//Motivo(S) : Melhora na mensagem de Perfil Contabil não encontrado -
//                Agora diz qual é o Tipo de Operação
//********************************************************************************************************
//Data	    : 02/03/2005
//Código    : Al_24
//Motivo(S) : Alterada o prazo limite para 60 dias para zerar a cota do Cart. Gerencial
//********************************************************************************************************
// Data     : 01/03/2005
// Código   : AL_23
// Motivo   : Ajuste para Contabilizar a nova operação de Venda de Ações CCI para aplicação em fundos
//********************************************************************************************************
// Data     : 22/02/2005
// Código   : AL_22
// Motivo   : Acerto na inversão de valores de RECPAG para tratar conforme a Boleta qdo é à Pagar ou a Receber
//********************************************************************************************************
// Data     : 21/02/2005
// Código   : AL_21
// Motivo   : Ajuste para a nova operação de Venda de Ações CCI para aplicação em fundos
//********************************************************************************************************
// Data     : 17/02/2005
// Código   : AL_20
// Motivo   : Implementação do parâmentro CodTipDoc na LancaOperRFRV, para
//            lançar na Documento.Inserir pelo resultado (à Pagar ou à Receber)
//            da Boleta e não pelo TipoOperacao ou TipoDespInvest
//********************************************************************************************************
// Data     : 11/02/2005
// Código   : AL_19
// Motivo   : Ajuste no sinal do valor a ser invertido para a devolução de corretagem
//             bater no rateio das despesas
//********************************************************************************************************
// Data     : 03/02/2005
// Código   : AL_18
// Motivo   : Inclusão da rotina LimpaParametros antes de alimentar a query.
//********************************************************************************************************
// Data     : 02/02/2005
// Código   : AL_17
// Motivo   : Retirada a variável fQtdeFinalInvest da rotina AlimentaCarteira por falta de uso
//********************************************************************************************************
// Data     : 31/01/2005
// Código   : AL_16
// Motivo   : Acerto na AlimentaCarteira para gravar o idtipooperacao de ATU de RV
//********************************************************************************************************
// Data     : 25/01/2005
// Código   : AL_15
// Motivo   : Implementado na rotina de deleção de cotas(cart. gerencial), a exclusao apenas de 30 dias
//            para atraz antes do ultimo fechamento.
//********************************************************************************************************
// Data     : 20/01/2005
// Código   : AL_14
// Motivo   : Captando valor para a qryLancaDocumento para mais de um lançamento
//            no mesmo documento
//********************************************************************************************************
// Data     : 10/01/2005
// Código   : AL_13
// Motivo   : Implementado o parâmetro bMostraMsg, que já existia na rotina ProcExclui mas
//                         não estava desenvolvido.
//********************************************************************************************************
// Data     : 10/01/2005
// Código   : AL_12
// Motivo   : Nova Rotina - InvMsgBox: Exibe Jnanela de dialogo com botões contendo
//                          a propriedade Caption customizada
//********************************************************************************************************
// Data     : 02/12/2004
// Código   : AL_11
// Motivo   : Implementação na AtualizaSaldo para as operações de
//            ACERTO DE CUSTO (-110,-111,-112,-113)
//********************************************************************************************************
// Data     : 29/11/2004
// Código   : AL_10
// Motivo   : Acert Rec/Pag de Renda Variavel
//********************************************************************************************************
// Data     : 17/11/2004
// Código   : AL_9
// Motivo   : Tratamento para achar a integração contabil
//********************************************************************************************************
// Data     : 25/10/2004
// Código   : AL_8
// Motivo   : Implementação do tratamento da CCI referente flgcontainvest
//********************************************************************************************************
// Data     : 20/10/2004
// Código   : AL_7
// Motivo   : Replica saldos diariamente
//********************************************************************************************************
// Data     : 30/09/2004
// Código   : AL_6
// Motivo   : Nova Rotina AtualizaSequences
//********************************************************************************************************
// Data     : 05/10/2004
// Código   : AL_5
// Motivo   : Alteração Legislação CPMF
//********************************************************************************************************
// Data     : 05/08/2004
// Código   : AL_4
// Motivo   : Ajuste na rotina ComparaValores
//********************************************************************************************************
// Data     : 13/07/2004
// Código   : AL_3
// Motivo   : Soma das Despesas no Lucro s/ Venda
//********************************************************************************************************
// Data     : 16/06/2004
// Origem   : Funcef
// Código   : AL_2
// Motivo   : Inclusao da variavel fSdoQtdBloqCustodia na função BuscaTodosSaldosInvestLote
//********************************************************************************************************
// Data     : 27/05/2004
// Origem   : Funcef
// Código   : AL_1
// Motivo   : Pendencia de Bolsa
//********************************************************************************************************
// Data     : 15/04/2004
// Origem   : Refer
// Função   : TransfEntreCarteiras
// Linha(s) : 7739
// Motivo   : Acerto no tipo de operação quando for Transf. de Carteira de Opções de Ações
//******************************************************************************
// Data	    : 27/04/2004
// Origem   : FUNCEF
// Função   : AScan
// LINHA(S) :
// Motivo(S): Criação das rotinas AScan - Overloaded para utilização de todo tipo de array
//            Esta rotina verifica a existencia de um valor dentro de um array.
//            Retorna -1 se o valor não for encontrado, ou a posição da 1ª ocorrencia do valor
//******************************************************************************

Unit UOperComum;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, USistema, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls, UOperacaoInvest, UBibliotecaInvest,
   wwdblook, DBTables, mxtables, mxstore, mxDB, Wwdatsrc, faMensagem, uCMMath, ComCtrls,
   //AL_93
   uCtrlInvContab, uCtrlRendaVariavel, uCtrlPadroes, uCtrlParamInvest,
   //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
   uCtrlParamCotacaoRV;

Type

   TOperComum = Class(TObject)

   Private

      // =================================================================================================
      //    Uso interno (por outras funções)
      // =================================================================================================
      Procedure MensagemErroContab(iResultado: integer);
      Procedure MensagemErroPeriodo(iErroPeriodo: integer);

      // Função que testa a consistência dos parâmetros passados para AlimentaCarteira
      Function VerificaParametros(Var iInvestimento, iTipoInvest, iOperacao, iTipoOperacao,
         iCarteira, iDespesaOperacao, iDespesaCarteira: integer; fValorPrimeiraCota: currency;
         sNaturezaMovimento: String): boolean;

      Procedure MostraErroAtualiza(sCarteira, sInvestimento, sTipoMov, sLancamento, sDataLanc, sMsg: String);
      Procedure MostraErroAtualizaInvest(sCarteira, sInvestimento, sLote, sData, sMsg: String);

   Public

      // =================================================================================================
      //    Integração Financeira / Contábil
      // =================================================================================================

            // Retorna a máscara do Plano de Contas
      Function GetMascaraPlano(iPlano: integer): String;

      // Gera um nº de documento único
      Function GeraNoDocumento(c: char): extended;

      // Abre a qryPadrLanc de acordo com os parâmetros passados
      Procedure AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento,
         iCarteira: integer; sTipoTitulo, sTipoMov: String);

      // Função que busca na tabela PadrLancContInv o conjunto de parâmetros de integração mais
      // apropriado, dadas as condições passadas. Mesma função p/ Operação quanto p/ Despesa de Operação
      Function BuscaPadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento,
         iCarteira: integer; fValor: double; sTipoTitulo, sTipoMov: String; Var iPlano, iSubContaDeb,
         iSubContaCred, iUnidNegoc: integer; Var sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
         sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper, sRecPagNao: String): integer;

      // Função que efetua o par de lançamentos Contábeis e o lançamento de CAPCAR (se aplicáveis)
      // associados a uma Operação de Investimento (de acordo com a tabela PadrLancContInv)
      Function LancaOperRFRV(iEmpresaProp, iModuloOrigem, iTipoInvest, iInvestimento, iTipoOperacao, iOperacao, iForCli, iCarteira, iMoeda: integer;
                             sTipoTitulo, sLote, sHistContab, sHistCapCar, sRecPagBol: String;
                             Var sTipoRecDesBol: String;
                             Var bCriaLancto: boolean;
                             fTotalLiquido, fVlrOper: currency;
                             dDataOper, dDataVenc: TDateTime;
                             Var iPlano, iPlanilhaOper, iDocumentoOper: integer;
                             Var sMensErro: String;
                             sIntegraCapCar: String = '';
                             bGravaDoc: Boolean = True;
                             bLancaFin: Boolean = True;
                             iCodTipDoc: Integer = 0;
                             bDireitoOrig: Boolean = True;
                             iPlanPrevPatr: Integer = -1): shortint;

      // Função que efetua cada par de lançamentos contábeis
      Function LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaD, iSubContaC,
         iUnidNegoc, iForCli, iPlanoPrev, iPatro: integer; sContaD, sContaC, sCentroCustoD, sCentroCustoC, sHistorico, sTipoPer,
         sRecPag: String; dDataLanc: TDateTime; fValorLanc: currency; bMostraMsg: boolean; Var iPlanilha: integer;
         Var sMensContab: String; iUsuarioOrigem: Integer = -1): boolean;

      // =================================================================================================
      //    Movimentação / Atualização
      // =================================================================================================

            // Função que alimenta Carteira
      Function AlimentaCarteira(iEmpresaProp, iModuloOrigem, iInvestimento, iTipoInvest, iOperacao,
                                iLancImovel, iTipoOperacao, iCarteira, iCarteiraGerenc, iDespesaOperacao, iDespesaCarteira,
                                iPlanilha, iDocumento, iPlano: integer;
                                dDataOper: TDateTime; fValorOperacao: currency; fQtdInvestOperacao: Double;
                                fValorPrimeiraCota, fValorVariacao, fValorJuros, fValorIRProv, fValorIRApu, fValorIOFProv, fValorIOFApu,
                                fValorAgio, fVlrCPMFProv, fVlrCMPFApu: currency;
                                sNaturMov, sNaturOper, sLote, sHistorico, sTipoMov, sFlgCustodia, sRecPag: String;
                                bMostraMsg: boolean;
                                iIdCorretValores, iIdPlanPrevCtbPatr: integer;
                                Var iIdHistCartInv: Integer): boolean;

      // Função que Atualiza Saldos de Carteira/Investimento/Lote no HistCartInv
      Function AtualizaSaldos(fValorPrimeiraCota: currency; dDataFinal: TDateTime): boolean;

      // Marca registros quando excluindo da HistCartInv
      Procedure MarcaFlgHistCartInv(TipoMovCart: String; IdLancamento: Integer);

      Function ProcEstorna(iDocumento, iPlanilha, iPlano: longint; dDataEstorno: TDateTime;
         bMostraMsg: boolean): Boolean;

      // AL_13
      Function ProcExclui(iDocumento, iPlanilha, iPlano, iTipoInvest: longint;
         dDataExclusao: TDateTime;
         bMostraMsg: boolean = True; bComita: Boolean = True): Boolean;

      //AL_28 - 23/03/2005

      //AL_94
      Function EstornaOper(sBoleta: String;
         iTipoInvest, iOperacaoInvest, iInvestimento: Integer;
         dDataEstorno: TDateTime;
         fValorPrimeiraCota: currency;
         sEstExc: String;
         bMostraMsg: boolean;
         iIdTipoOperacao: Integer = 0): boolean;

      // Função que Retorna Valor a Contabilizar
      Function BuscaValorAContabilizar(iIdHistcartinv, iIdTipoDespInvest, iTipoInvest: longint; bOperVenda: boolean;
         Var fValorAContabilizar: Double): boolean;

      // =================================================================================================
      //    Saldos
      // =================================================================================================

            //necessária p/ AlimentaCarteira
            //AL_2
            //AL_5 - 05/10/2004 - Alteração na Ordem dos parâmetros e criação de novo parâmetro
            //AL_71
            //AL_75
            //AL_78
      Function BuscaTodosSaldosInvestLote(iCarteira, iCarteiraGerenc, iInvestimento, iHistCartInv, iCustodiante: integer;
         sLote, dDataRef: String; iMotivoBloqueio: Integer;
         Var fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu, fSdoCar, fSdoAqui, fSdoRend,
         fSdoMercado, fSdoVar, fSdoJur, fSdoPre, fSdoIRProv, fSdoIRApu, fSdoIOFProv, fSdoIOFApu,
         fSdoAgio, fSdoQtdLibCustodia, fSdoQtdBloqCustodia, fSdoQtdCPMF, fSdoProvPerda: double): boolean;

      // Função que Calcula Saldo de Combinações de Carteira/Investimento/Lote no dia
      Function CalculaSaldo(iInvestimento, iCarteira: integer; sLote: String; dDataOper: TDateTime;
         Var fSaldoQtdeInvCart, fSaldoVlrInvCart, fSaldoCotasCartInv, fSaldoVlrCartInv, fSaldoAtu, fSaldoCar,
         fSaldoAqui, fSaldoRend, fSaldoMercado, fSaldoVar, fSaldoJur, fSaldoPre, fSaldoIRProv, fSaldoIRApu,
         fSaldoIOFProv, fSaldoIOFApu, fSaldoAgio: double): boolean;

      // Função que Soma Saldos dos  Investimentos na Carteira para uma determinada data
      Function SaldosInvCart(iCarteira: integer; dDataRef: TDateTime; Var fSaldoQtdeInvCart,
         fSaldoVlrInvCart, fSaldoAtu, fSaldoCar, fSaldoAqui, fSaldoRend, fSaldoMercado: double): boolean;

      //Al_29 - 29/03/2005
      // Totalizador Carteira, Investimento e Plano ou um a um
      Procedure TotalSaldosInvCart(iiCarteira, iiCartGerenc,
         iiInvestimento, iiPlanPrevCtbPatr: integer;
         dDataRef: TDateTime;
         Var fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu,
         fSdoCar, fSdoAqui, fSdoRend: double);

      // Função que Busca Cotação de um Investimento numa determinada data.
      Function BuscaCotacaoInvest(iInvestimento: integer; dDataRef: TDateTime; bUsaLote: boolean): double;

      Function BuscaVlrCotaCarteira(iCarteira: integer; dDataRef: TDateTime): double;
      Function BuscaSaldoCarteira(iCarteira: integer; dDataRef: TDateTime): double;

      // =================================================================================================
      //    Moedas / Índices
      // =================================================================================================

            // Função que Busca Cotação de uma Moeda numa determinada data, segundo um Operador de
            // Procura : (=, <, <=, >, >=)
      Function BuscaCotacaoMoeda(iMoeda: integer; dDataRef: TDateTime; sOperador: String;
         Var fCotacao: double; Var dDataCotacao: TDateTime): boolean;

      // Função que Busca Cotação de uma Moeda numa determinada data.
      Function LeMoeda(iMoeCodigo: integer; dCotData: TDateTime; sFlgProRata, sFlgInterpola: String): double;

      // Função que Calcula Juros Diários a partir de um Valor e o Tipo de Juros.
      Function CalculaJurosDia(fValorJuros: double; iTipoJuros: integer): double;

      // Função que retorna o Saldo das contas contábeis de variação Positiva e Negativa para contabilização
      //function BuscaTipoOperVarRV(var RecBuscaTipoOperVarRV : TRecBuscaTipoOperVarRV):Integer;
      Procedure BuscaTipoOperVarRV;

      Function DivValorZero(Valor1, Valor2: Extended): Extended;

      Function Trunca(rValor: Double; iQtdDec: Integer): Double;

      Function Round(rValor: Double; iQtdDec: Integer): Double;

      Function ConvertePonto(sConverter: String): String;

      Function StripChar(S: String; C: Char): String;

      Function BuscaSaldoContabil(iPlano, iPlanoPrev, iPatro, iPerExercicio, iPerNumero, iPessoa: integer;
         dPlnDatDia: TDateTime; sPlaConta: String): Double;

      Function VerificaData(sData: String): Boolean;

      Function BuscaForCli(iTipoInvest, iCorretEmissor, iTipoOperacao, iTipoCliente: integer): integer;

      Function BuscaCotacaoAcao(iInvestimento: integer; dDataRef: TDateTime; bUsaLote: boolean): double;

      Function VerificaFechamento(edDataRef: TDateTime): Boolean;

      Function EstornaFinanPendencia(iDocumento: Integer;
         dDataEstorno: TDateTime): boolean;

      //AL_99
      Function LancaOperPendRV(iIdCorretValores, iOperacaoOrigem, iEmpresaProp, iModuloOrigem,
                               iTipoInvest, iInvestimento, iTipoOperacao, iOperacao, iForCli,
                               iCarteira, iMoeda, iiPlanPrev: integer;
                               sTipoTitulo, sLote, sHistCapCar, sRecPagBol: String;
                               Var sTipoRecDesBol: String;
                               Var bCriaLancto: boolean;
                               fTotalLiquido, fVlrOper: currency;
                               dDataOper, dDataVenc: TDateTime;
                               Var iPlano, iPlanilhaOper, iDocumentoOper: Integer;
                               Var sMensErro: String): shortint;

      Function DataPrazo(dData: TDateTime; iPrazo: Integer): TDateTime;

      Function AlteraDataFechRV(dData: TDateTime): Boolean;

      Procedure ChamaRegra(sRegraSel: String; TpCons: Integer);

      Function LimpaParametros(Const qry: TQuery; Prepara: Boolean = False): Boolean; Overload;

      Function LimpaParametros(Const qry: TwwQuery; Prepara: Boolean = False): Boolean; Overload;

      Function LimpaParametros(Const qry: TDecisionQuery; Prepara: Boolean = False): Boolean; Overload;

      Procedure VerificaVencimentoBMF(dDataNow: TDateTime);

      Procedure VerificaVencimentoCartaFianca(dDataNow: TDateTime);

      Procedure BuscaFlgContab(iTipoOper: Integer);

      Function PosicionaWWLookUpQry(dbLookUp: TwwDBLookupCombo; Query: TwwQuery): Boolean;

      //Al_39
      Function TransfEntreCarteiras(iForCli, iCarteiraOrig, iCarteiraDest,
                                    iInvestimento,
                                    iCustodianteOrig,
                                    iCustodianteDest,
                                    iIdMotBloqOrig,
                                    iIdMotBloqDest, iMercadoOrig,
                                    iMercadoDest,
                                    iIdForCli: Integer;
                                    fSaldo, fQuantidade: Double;
                                    dDataRef: TDateTime;
                                    bEmpAcoes: boolean;
                                    sLote, sBoleta: String;
                                    Var iIdHistCartInvDest: Integer;
                                    iPlanPrev: Integer = -1;
                                    iPlnCodigo: Integer = -1;
                                    iTipoConta: Integer = 0): boolean;

      //AL_71
      Procedure InsereHistCustodiaDestino(idOperCustodia, iMotivoBloqueio, iCarteira,
         iInvestimento, iCustodiante: integer;
         sLote: String;
         dDataRef: TDateTime; fQuantidade: Double;
         Var iIdHistCustodiaDest: integer;
         iPlanPrev: Integer = -1;
         iTipoConta: Integer = 0);

      //AL_71
      Procedure AlteraHistCustodiaOrigem(idOperCustodia, iMotivoBloqueio, iCarteira,
         iInvestimento, iCustodiante: integer; sLote: String;
         dDataRef: TDateTime;
         fQuantidade: Double;
         Var iIdHistCustodiaOrig: integer;
         iPlanPrev: Integer = -1;
         iTipoConta: Integer = 0);

      Function ProcExcluiCustodia(iIdOperCustodia, iIdHistCartInvOrig,
         iIdHistCartInvDest: Integer;
         dDataMovCustod: TDateTime): Boolean;

      Function ComparaValores(fValor1, fValor2: Double; sComparador: String;
         fPrecisao: Integer = 0): Boolean;

      Function BuscaCotacaoOpcao(iInvestimento, iCarteira: integer;
         dDataRef: TDateTime;
         sLote: String;
         fCotacao: Double): double;

      Function FormatSecsToHMS(Secs: Integer): String;

      // AL_66 - Inicio
      Function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String; Overload;
      Function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer; Overload;
      Function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Extended): Extended; Overload;
      Function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime; Overload;
      // AL_66 - Fim

      Function AScan(aArray: Array Of Integer; iElemento: Integer): Integer; Overload;
      Function AScan(aArray: Array Of String; sElemento: String): Integer; Overload;
      Function AScan(aArray: Array Of Double; dElemento: Double): Integer; Overload;
      Function AScan(aArray: Array Of Variant; vElemento: Variant): Integer; Overload;

      // AL_6 - 30/09/2004
      Function AtualizaSequences(fraFrame: TfraMensagem = Nil; prgTabProg: TProgressBar = Nil): Boolean;

      // AL_12 - 10/01/2005
      Function InvMsgBox(Msg: String;
         DlgType: TMsgDlgType;
         sCaption: String = '';
         Buttons: TMsgDlgButtons = [mbOk];
         ButtonsCaptions: String = ''): Word;

      // AL_38
      Function OraNumero(sNumero: String): String; Overload;
      // AL_41
      Function OraNumero(fNumero: Double): String; Overload;

      //AL_48
      Function VerificaGrupamentoAnterior(iInvestimento, iCarteira, iCarteiraGerenc, iHistorico,
         iTipoOper, iTipoOperNovo: Integer;
         dDataOper: String;
         iPlanPrev: Integer = -1): boolean;

      //AL_77
      Function BuscaPercProvPerda(dDataAtual: TDateTime; iInvestimento: Integer;
         iCarteiraInvest: Integer = -1;
         iCarteiraGerenc: Integer = -1): Double;

      //Al_103
      Procedure GravaLogTotalPrev(sDescOperacao: String);

      //AL_109
      Function DataOracle(dData: TDateTime): String; Overload;
      Function DataOracle(sData: String): String; Overload;

      //--Emerson--//
      Function GetSaldoEmAtualizaSaldo: Double;

      //Ricardo Cristiano - 21/07/2009 - N. Sol 122235 -  N. Kintana 597042
      Function VerificaDesdobramentoAnterior(iInvestimento, iCarteira, iCarteiraGerenc, iHistorico,
                                             iTipoOper, iTipoOperNovo: Integer;
                                             dDataOper: String;
                                             iPlanPrev: Integer = -1): boolean;

      Function RetornaSegmentacaoRV(iInvestimento: integer): integer; //Renan Cristiano CGPC28
      Function RetornaSegmentacaoFdos(iTipoFundoInvest, iFundoInvest :Integer): Integer; //Renan Cristiano CGPC28

      //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
      Function RetornaDtContabDivBonif(dDataOper, dDataEx, dDataAge : TDateTime) : TDateTime;

      Function RetornaDataDivConsulta(dDataOper : TDateTime) : Integer;

      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
      Function ProcessaTransfCarteira(iCarteiraOrig, iCarteiraDest, iIdForCli, iInvestimento,
                                      iCustodianteOrig, iCustodianteDest, iIdMotBloqOrig, iIdMotBloqDest,
                                      iMercadoOrig, iMercadoDest, iPlanPrev, iTipoConta : Integer;
                                      sDescInvestimento: String;
                                      fQuantidade: Double;
                                      dDataOper: TDateTime): boolean;

   End;

Var
   OperComum: TOperComum;
   //AL_83 - Evento para atualizar o progress bar do form
   AtualizaProcesso: Procedure(sMsg: String; iMaximo: Integer = -1);

   //--Emerson--//
   fQtdeFinalInvest: Double;

Implementation

Uses
   uLancContab, uDocumento, uIntegraBack, uMensErro, uFuncaoGeral, uDataBase, uDiasUteis,
   dBaseDados, dOperacaoInvest, UImpostos, fAguarde, fAguardeInv, dRendaVariavel,
   Math, dOperComum, UDiasUteisInv, UString, UCotaComum, FConsultaRegra,
   uEmprestAcoes, uRendaVariavel;

// =================================================================================================
//    Uso interno (por outras funções)
// =================================================================================================

Procedure TOperComum.MensagemErroContab(iResultado: integer);
Begin
   Case iResultado Of
      -1: MsgDlg('A Conta Contábil de débito está bloqueada ou inativa', 'Erro', mtError, [mbOk], 0);
      -2: MsgDlg('A Conta Contábil de crédito está bloqueada ou inativa', 'Erro', mtError, [mbOk], 0);
      -3: MsgDlg('', 'Erro', mtError, [mbOk], 0);
      -4: MsgDlg('A Conta Contábil de débito não existe', 'Erro', mtError, [mbOk], 0);
      -5: MsgDlg('A Conta Contábil de crédito não existe', 'Erro', mtError, [mbOk], 0);
      -6: MsgDlg('Não exite cotação cadastrada para a Moeda escolhida', 'Erro', mtError, [mbOk], 0);
      -7: MsgDlg('Não existe a Planilha escolhida', 'Erro', mtError, [mbOk], 0);
      -8: MsgDlg('Os parâmetros contábeis não estão corretamente cadastrados', 'Erro', mtError, [mbOk], 0);
   End;
End;

Procedure TOperComum.MensagemErroPeriodo(iErroPeriodo: integer);
Begin
   Case iErroPeriodo Of
      1: MsgDlg('O Período escolhido não Existe', 'Erro', mtError, [mbOk], 0);
      2: MsgDlg('O Período escolhido existe mas não é único', 'Erro', mtError, [mbOk], 0);
      3: MsgDlg('O Período escolhido está bloqueado', 'Erro', mtError, [mbOk], 0);
      4: MsgDlg('O Período escolhido está bloqueado', 'Erro', mtError, [mbOk], 0);
   End;
End;

// -------------------------------------------------------------------------------------------------
// Função que testa a consistência dos parâmetros passados para Alimenta Carteira
// -------------------------------------------------------------------------------------------------

Function TOperComum.VerificaParametros(Var iInvestimento, iTipoInvest, iOperacao, iTipoOperacao,
   iCarteira, iDespesaOperacao, iDespesaCarteira: integer; fValorPrimeiraCota: currency;
   sNaturezaMovimento: String): boolean;
Begin
   Result := False;

   // o valor da 1ª cota deve ser informado e positivo
   If fValorPrimeiraCota <= 0 Then Exit;
   // Natureza da Operacao deve ser Informada
   If sNaturezaMovimento = '' Then Exit;

   // se não foi informada a carteira, a operacao
   If iCarteira <= 0 Then Exit;

   // se não for uma despesa
   If iDespesaCarteira > -1 Then Begin

         // 'zera' todos os outros parâmetros
         iInvestimento := -1;
         iOperacao := -1;
         iDespesaOperacao := -1;
         iTipoInvest := -1;
         iTipoOperacao := -1;

      End Else Begin

         // verifica os outros parâmetros obrigatórios
         If iInvestimento <= 0 Then Exit;
         If iTipoInvest <= 0 Then Exit;

         iDespesaCarteira := -1;

      End;

   Result := True;
End;

Procedure TOperComum.MostraErroAtualiza(sCarteira, sInvestimento, sTipoMov, sLancamento, sDataLanc, sMsg: String);
Var
   sMensagem: String;
Begin
   sMensagem :=
      'Houve ERRO na tentativa de atualização dos saldos. ' + chr(13) +
      'Carteira           : ' + sCarteira + chr(13) +
      'Investimento       : ' + sInvestimento + chr(13) +
      'Tipo de Movimento  : "' + sTipoMov + '"' + chr(13) +
      'Lançamento         : ' + sLancamento + chr(13) +
      'Data do Lançamento : ' + sDataLanc + chr(13) + chr(10) +
      'Mensagem: ' + sMsg;

   MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
End;





Procedure TOperComum.MostraErroAtualizaInvest(sCarteira, sInvestimento, sLote, sData, sMsg: String);
Var
   sMensagem: String;
Begin
   sMensagem :=
      'Houve ERRO na tentativa de atualização dos saldos. ' + chr(13) +
      'Carteira     : ' + sCarteira + chr(13) +
      'Investimento : ' + sInvestimento + chr(13) +
      'Lote         : ' + sLote + chr(13) +
      'Data         : ' + sData + chr(13) + chr(10) +
      'Mensagem: ' + sMsg;

   MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
End;





// =================================================================================================
//    Integração Financeira / Contábil
// =================================================================================================

// Retorna a máscara do Plano de Contas

Function TOperComum.GetMascaraPlano(iPlano: integer): String;
Var
   qryContab: TwwQuery;
Begin
   qryContab := dtmOperComum.qryIntegraContab;

   With qryContab Do Begin
         Close;
         If Not (Prepared) Then Prepare;
         ParamByName('PLANO').AsInteger := iPlano;
         Open;
      End;

   If Not (qryContab.isEmpty) Then Result := trim(qryContab.FieldbyName('MASCARA').AsString);
   qryContab.Close;
End;





// Gera um nº de documento único

Function TOperComum.GeraNoDocumento(c: char): extended;
Var
   //ano, mes, dia, hora, min, seg, mseg: word;
   //s, sNoDoc, sAleatorio: string;
   sNoDoc: String;
Begin
   Result := 0;
   While Result = 0 Do
      Begin
         With dtmOperComum.qryAuxiliar Do Begin
               sNoDoc := IntToStr(LeUltRegistro(Nil, 'DOCINVEST'));
               Close;
               SQL.Clear;
               SQL.Text := 'SELECT NODOCUMENTO FROM DOCUMENTO ' +
                  'WHERE NODOCUMENTO = ' + sNoDoc + ' ' +
                  'AND COMPLDOCUMENTO = ''79''';
               ExecSQL;
               If Not IsEmpty Then
                  Result := 0
               Else
                  Result := StrToInt(sNoDoc);
               Close;
            End;
      End;

End;

// -------------------------------------------------------------------------------------------------
// Abre a qryPadrLanc de acordo com os parâmetros passados
//--------------------------------------------------------------------------------------------------

Procedure TOperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
   iInvestimento, iCarteira: integer; sTipoTitulo, sTipoMov: String);
Begin
   With dtmOperComum.qryPadrLanc Do Begin
         // AL_18 - 03/02/2005
         LimpaParametros(dtmOperComum.qryPadrLanc);

         If Not (Prepared) Then Prepare;

         ParamByName('EMPRESAPROP').AsInteger := iEmpresaProp;
         ParamByName('TIPOINVEST').AsInteger := iTipoInvest;
         ParamByName('TIPOMOV').AsString := sTipoMov;

         ParamByName('TIPOOPERACAO').AsInteger := iTipoOperacao;
         If iTipoOperacao = 0 Then ParamByName('TIPOOPERACAO').Clear;

         ParamByName('TIPOLANC').AsString := 'N';
         If sTipoMov = 'ATU' Then ParamByName('TIPOLANC').Clear;

         ParamByName('TIPODESPESA').AsInteger := iTipoDespesa;
         If iTipoDespesa = 0 Then ParamByName('TIPODESPESA').Clear;

         ParamByName('TIPOTITULO').AsString := sTipoTitulo;
         If length(trim(sTipoTitulo)) = 0 Then ParamByName('TIPOTITULO').Clear;

         ParamByName('CARTEIRA').AsInteger := iCarteira;
         If iCarteira = -1 Then ParamByName('CARTEIRA').Clear;

         ParamByName('INVESTIMENTO').AsInteger := iInvestimento;
         If iInvestimento = -1 Then ParamByName('INVESTIMENTO').Clear;

         Open;
      End;
End;





// -------------------------------------------------------------------------------------------------
// Função que busca na tabela PadrLancContInv o conjunto de parâmetros de integração mais
// apropriado, dadas as condições passadas. Mesma função p/ Operação quanto p/ Despesa de Operação
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iEmpresaProp      :  id da Empresa Proprietária                      (Sistema.idEmpresa)
//       iTipoInvest       :  id do Tipo de Investimento, tabela TipoInvest   (idTipoInvest)
//       iTipoOperacao     :  id do Tipo de Operacao, tabela TipoOperacao     (idTipoOperacao)
//       iTipoDespesa      :
//       iInvestimento     :
//       iCarteira         :  id da Carteira
//       sTipoTitulo       :  código do Tipo de Título, tabela CodTipoTitulo  (CodTipTitulo)
//
//       sTipoMov          :  OPE -> Operação
//                            DOP -> Despesa de Operação
//                            ATU -> Atualização
//
//    A função retorna também os parâmetros de integração:
//       iPlano            :  plano de contas usado para os lançamentos contábeis
//       sContaDeb
//       sContaCred
//       sCentroCustoDeb
//       sCentroCustoCred
//       iSubContaDeb
//       iSubContaCred
//       sTipoPer
//       sCentroRespon
//       iUnidNegoc
//       sTipoRecDes
//       sHistoricoOper    :  histórico da Operação, segundo PadrLancContInv
//       sRecPagNao
//
//    Códigos de retorno (controle de erro):
//        0 : Situação normal
//       -4 : Erro: ambigüidade no Padrão de Lançamento
//       -5 : Erro: nenhum Padrão de Lançamento que atenda os parâmetros passados
//
//--------------------------------------------------------------------------------------------------

Function TOperComum.BuscaPadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento,
   iCarteira: integer; fValor: double; sTipoTitulo, sTipoMov: String; Var iPlano, iSubContaDeb,
   iSubContaCred, iUnidNegoc: integer; Var sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
   sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper, sRecPagNao: String): integer;
Begin
   // nenhum padrão encontrado, a princípio
   Result := 0;

   Try

      // 1º Passo: TipoOperacao + Carteira + TipoTitulo + Investimento (caso mais detalhado)
      If ((iCarteira > 0) And (sTipoTitulo <> '') And (iInvestimento > 0)) Then Begin

            OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
               iInvestimento, iCarteira, sTipoTitulo, sTipoMov);

            // Erro: ambigüidade no Padrão de Lançamento
            If dtmOperComum.qryPadrLanc.RecordCount > 1 Then Result := -4;
         End;

      // 2º Passo: TipoOperacao + TipoTitulo + Investimento
      If ((Result = 0) And (sTipoTitulo <> '') And (iInvestimento > 0)) Then Begin
            If (Not (dtmOperComum.qryPadrLanc.Active) Or (dtmOperComum.qryPadrLanc.isEmpty)) Then Begin

                  OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
                     iInvestimento, -1 {iCarteira}, sTipoTitulo, sTipoMov);

                  If dtmOperComum.qryPadrLanc.RecordCount > 1 Then Result := -4; // Erro: ambigüidade no Padrão de Lançamento
               End;
         End;

      // 3º Passo: TipoOperacao + TipoTitulo + Carteira
      If ((Result = 0) And (sTipoTitulo <> '') And (iCarteira > 0)) Then Begin
            If (Not (dtmOperComum.qryPadrLanc.Active) Or (dtmOperComum.qryPadrLanc.isEmpty)) Then Begin

                  OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
                     -1 {iInvestimento}, iCarteira, sTipoTitulo, sTipoMov);

                  // Erro: ambigüidade no Padrão de Lançamento
                  If dtmOperComum.qryPadrLanc.RecordCount > 1 Then Result := -4;
               End;
         End;

      // 4º Passo: TipoOperacao + TipoTitulo
      If ((Result = 0) And (sTipoTitulo <> '')) Then Begin
            If (Not (dtmOperComum.qryPadrLanc.Active) Or (dtmOperComum.qryPadrLanc.isEmpty)) Then Begin

                  OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
                     -1 {iInvestimento}, -1 {iCarteira}, sTipoTitulo, sTipoMov);

                  // Erro: ambigüidade no Padrão de Lançamento
                  If dtmOperComum.qryPadrLanc.RecordCount > 1 Then Result := -4;
               End;
         End;

      // 5º Passo: TipoOperacao + Carteira
      If ((Result = 0) And (iCarteira > 0)) Then Begin
            If (Not (dtmOperComum.qryPadrLanc.Active) Or (dtmOperComum.qryPadrLanc.isEmpty)) Then Begin

                  OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
                     -1 {iInvestimento}, iCarteira, '' {sTipoTitulo}, sTipoMov);

                  // Erro: ambigüidade no Padrão de Lançamento
                  If dtmOperComum.qryPadrLanc.RecordCount > 1 Then Result := -4;
               End;
         End;

      // AL_62 - Ini
      // 5/1/2º Passo: TipoOperacao + Carteira
      If ((Result = 0) And (iInvestimento > 0)) Then Begin
            If (Not (dtmOperComum.qryPadrLanc.Active) Or (dtmOperComum.qryPadrLanc.isEmpty)) Then Begin

                  OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
                     iInvestimento, -1 {iCarteira}, '' {sTipoTitulo}, sTipoMov);

                  // Erro: ambigüidade no Padrão de Lançamento
                  If dtmOperComum.qryPadrLanc.RecordCount > 1 Then Result := -4;
               End;
         End;
      // AL_62 - Ini

      // 6º Passo: só TipoOperacao
      If ((Result = 0)) Then Begin
            If (Not (dtmOperComum.qryPadrLanc.Active) Or (dtmOperComum.qryPadrLanc.isEmpty)) Then Begin

                  OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
                     -1 {iInvestimento}, -1 {iCarteira}, '' {sTipoTitulo}, sTipoMov);

                  // Erro: ambigüidade no Padrão de Lançamento
                  If dtmOperComum.qryPadrLanc.RecordCount > 1 Then Result := -4;
               End;
         End;

      // Finalmentes: resultado da Busca
      If Result = 0 Then Begin
            // verifica se agora foi encontrado algum Padrão de Lançamento
            If ((dtmOperComum.qryPadrLanc.Active) And Not (dtmOperComum.qryPadrLanc.isEmpty)) Then Begin

                  iPlano := dtmOperComum.qryPadrLancPLANO.AsInteger;
                  sContaDeb := dtmOperComum.qryPadrLancCONTADOPERFIN.AsString;
                  sContaCred := dtmOperComum.qryPadrLancCONTACOPERFIN.AsString;

                  // AL_64 - 18/01/2006
                  // AL_54 - 27/10/2005
                  // Al_46 - 20/09/2005
                  // se o valor da Operação for negativo, inverte as contas
                  //AL_109
                  If ((iTipoOperacao = -63) Or (iTipoOperacao = -67) Or
                     ((CtrlPInv.IdTipoOperDirPer = iTipoOperacao) Or
                     (CtrlPInv.IdTipoOperDirPer + 10000 = iTipoOperacao)) Or
                     ((CtrlPInv.IdTipoOperDirDSA = iTipoOperacao) Or
                     (CtrlPInv.IdTipoOperDirDSA + 10000 = iTipoOperacao))) Then //Transf. de Carteira//Permuta//Subscrição em Ações
                     Begin
                        //AL_85 - Ini
                        sContaDeb := OperComum.IIF(fValor >= 0, dtmOperComum.qryPadrLancCONTADOPERFIN.AsString,
                           dtmOperComum.qryPadrLancCONTACOPERFIN.AsString);
                        sContaCred := OperComum.IIF(fValor >= 0, dtmOperComum.qryPadrLancCONTACOPERFIN.AsString,
                           dtmOperComum.qryPadrLancCONTADOPERFIN.AsString);
                        //AL_85 - Fim
                     End;
                  // Centro de Custo
                  //AL_85 - Centro de Custo Único para contabil e financeiro
                  sCentroCustoCred := OperComum.IIF(dtmOperComum.qryPadrLancCENCUSTCINVEST.IsNull, '', dtmOperComum.qryPadrLancCENCUSTCINVEST.AsString);
                  sCentroCustoDeb := sCentroCustoCred;

                  // Sub-Conta
                  iSubContaDeb := OperComum.IIF(dtmOperComum.qryPadrLancCODSUBCONTAD.IsNull, -1, dtmOperComum.qryPadrLancCODSUBCONTAD.AsInteger);
                  iSubContaCred := OperComum.IIF(dtmOperComum.qryPadrLancCODSUBCONTAC.IsNull, -1, dtmOperComum.qryPadrLancCODSUBCONTAC.AsInteger);

                  // Unidade de Negócio ou "Atividade/Projeto"
                  iUnidNegoc := OperComum.IIF(dtmOperComum.qryPadrLancUNIDNEGOC.IsNull, -1, dtmOperComum.qryPadrLancUNIDNEGOC.AsInteger);

                  // Centro de Responsabilidade
                  sCentroRespon := OperComum.IIF(dtmOperComum.qryPadrLancCODCENTRORESPON.IsNull, '', dtmOperComum.qryPadrLancCODCENTRORESPON.AsString);

                  // Tipo de Recebimento/Desembolso
                  sTipoRecDes := OperComum.IIF(dtmOperComum.qryPadrLancCODTIPRECDES.IsNull, '', dtmOperComum.qryPadrLancCODTIPRECDES.AsString);

                  // Tipo de Operacao
                  sTipoPer := OperComum.IIF(dtmOperComum.qryPadrLancTIPCODIGO.IsNull, '', dtmOperComum.qryPadrLancTIPCODIGO.AsString);

                  sHistoricoOper := dtmOperComum.qryPadrLancHISTLANCINVEST.AsString;
                  sRecPagNao := dtmOperComum.qryPadrLancFLGPAGRECNAO.AsString;
                  //AL_85 - Fim

               End Else Begin
                  // Erro: nenhum Padrão de Lançamento que atenda os parâmetros passados
                  Result := -5;
               End;
         End;
   Finally
      dtmOperComum.qryPadrLanc.Close;
   End;
End;

// Função que retorna o Saldo das contas contábeis de variação Positiva e Negativa para contabilização
//function TOperComum.BuscaTipoOperVarRV(var RecBuscaTipoOperVarRV : TRecBuscaTipoOperVarRV):Integer;

Procedure TOperComum.BuscaTipoOperVarRV;
Var
   wSldVarPositiva, wSldVarNegativa, wVlrOperacao: double;
Begin
   wVlrOperacao := RecBuscaTipoOperVarRV.VLROPERACAO;

   dtmOperComum.QrySaldoVariacao.Close;

   dtmOperComum.QrySaldoVariacao.ParamByName('IDPLANOPREV').Clear;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPATRO').Clear;
   dtmOperComum.QrySaldoVariacao.ParamByName('EXERCICIO').AsInteger := RecBuscaTipoOperVarRV.EXERCICIO;
   dtmOperComum.QrySaldoVariacao.ParamByName('DATAINI').AsString := RecBuscaTipoOperVarRV.DATAINI;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPESSOA').AsInteger := RecBuscaTipoOperVarRV.IDPESSOA;
   dtmOperComum.QrySaldoVariacao.ParamByName('CONTAINI').AsString := RecBuscaTipoOperVarRV.CONTAINIPOS; //Espaco(RecBuscaTipoOperVarRV.CONTAINIPOS,18);
   dtmOperComum.QrySaldoVariacao.ParamByName('CONTAFIM').AsString := RecBuscaTipoOperVarRV.CONTAFIMPOS;
   dtmOperComum.QrySaldoVariacao.Open;
   wSldVarPositiva := ABS(dtmOperComum.QrySaldoVariacao.FieldByName('SALDO').AsFloat);

   dtmOperComum.QrySaldoVariacao.Close;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPLANOPREV').Clear;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPATRO').Clear;
   dtmOperComum.QrySaldoVariacao.ParamByName('EXERCICIO').AsInteger := RecBuscaTipoOperVarRV.EXERCICIO;
   dtmOperComum.QrySaldoVariacao.ParamByName('DATAINI').AsString := RecBuscaTipoOperVarRV.DATAINI;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPESSOA').AsInteger := RecBuscaTipoOperVarRV.IDPESSOA;
   dtmOperComum.QrySaldoVariacao.ParamByName('CONTAINI').AsString := RecBuscaTipoOperVarRV.CONTAININEG;
   dtmOperComum.QrySaldoVariacao.ParamByName('CONTAFIM').AsString := RecBuscaTipoOperVarRV.CONTAFIMNEG;
   dtmOperComum.QrySaldoVariacao.Open;
   wSldVarNegativa := ABS(dtmOperComum.QrySaldoVariacao.FieldByName('SALDO').AsFloat);

   If (wSldVarPositiva > 0) And (wSldVarNegativa > 0) Then // Ocorreu erro
      Begin
         RecBuscaTipoOperVarRV.RESULT := -1; // Erro
      End
   Else
      Begin
         RecBuscaTipoOperVarRV.RESULT := 0;
         // TipoOperacao : -1   : Atualização RV - Var. Positiva
         //                -9   : Atualização RV - Var. Negativa
         //                -14  : Atualização RV - Var. Positiva (Bx. Var. Negativa)
         //                -15  : Atualização RV - Var. Negativa (Bx. Var. Positiva)

         If RecBuscaTipoOperVarRV.TIPOOPERACAO = -1 Then // Vlr de Variação Positiva
            Begin
               // Saldo na conta de Variação Positiva //ou Configurados para mesma conta de variação POS e NEG (Empréstimo)
               If (wSldVarPositiva > 0) Then
                  Begin
                     RecBuscaTipoOperVarRV.VLROPERACAO := wVlrOperacao;
                     RecBuscaTipoOperVarRV.VLRSALDO := 0;
                     RecBuscaTipoOperVarRV.TIPOOPERSALDO := 0;
                  End
               Else If wSldVarNegativa > 0 Then // Saldo na conta de Variação Negativa
                  Begin
                     // Baixo a Variação Positiva no valor da operacao
                     If wSldVarNegativa >= wVlrOperacao Then
                        Begin
                           RecBuscaTipoOperVarRV.VLROPERACAO := wVlrOperacao;
                           RecBuscaTipoOperVarRV.VLRSALDO := 0;
                           RecBuscaTipoOperVarRV.TIPOOPERSALDO := 0;
                           RecBuscaTipoOperVarRV.TIPOOPERACAO := -14;
                        End
                           // Baixo a Variacao Positiva no valor do Saldo  e armazeno a diferença para contabilizar na var.negativa
                     Else If wSldVarNegativa < wVlrOperacao Then
                        Begin
                           RecBuscaTipoOperVarRV.VLROPERACAO := wSldVarNegativa;
                           RecBuscaTipoOperVarRV.VLRSALDO := ABS(wSldVarNegativa - wVlrOperacao);
                           RecBuscaTipoOperVarRV.TIPOOPERSALDO := -1;
                           RecBuscaTipoOperVarRV.TIPOOPERACAO := -14;
                        End;
                  End;
            End
         Else If RecBuscaTipoOperVarRV.TIPOOPERACAO = -9 Then // Vlr de Variação Negativa
            Begin
               // Saldo na conta de Variação Negativa //ou Configurados para mesma conta de variação POS e NEG (Empréstimo)
               If (wSldVarNegativa > 0) Then
                  Begin
                     RecBuscaTipoOperVarRV.VLROPERACAO := wVlrOperacao;
                     RecBuscaTipoOperVarRV.VLRSALDO := 0;
                     RecBuscaTipoOperVarRV.TIPOOPERSALDO := 0;
                     RecBuscaTipoOperVarRV.TIPOOPERACAO := -9;
                  End
               Else If wSldVarPositiva > 0 Then // Saldo na conta de Variação Positiva
                  Begin
                     // Baixo a Variação Positiva no valor da operacao
                     If wSldVarPositiva >= wVlrOperacao Then
                        Begin
                           RecBuscaTipoOperVarRV.VLROPERACAO := wVlrOperacao;
                           RecBuscaTipoOperVarRV.VLRSALDO := 0;
                           RecBuscaTipoOperVarRV.TIPOOPERSALDO := 0;
                           RecBuscaTipoOperVarRV.TIPOOPERACAO := -15;
                        End
                           // Baixo a Variacao Positiva no valor do Saldo  e armazeno a diferença para contabilizar na var.negativa
                     Else If wSldVarPositiva < wVlrOperacao Then
                        Begin
                           RecBuscaTipoOperVarRV.VLROPERACAO := wSldVarPositiva;
                           RecBuscaTipoOperVarRV.VLRSALDO := ABS(wSldVarPositiva - wVlrOperacao);
                           RecBuscaTipoOperVarRV.TIPOOPERSALDO := -9;
                           RecBuscaTipoOperVarRV.TIPOOPERACAO := -15;
                        End;
                  End;
            End;

         dtmOperComum.QrySaldoVariacao.Close;
      End;
End;

// Função que retorna o Saldo de uma Conta Contábil em um determinado dia

Function TOperComum.BuscaSaldoContabil(iPlano, iPlanoPrev, iPatro, iPerExercicio, iPerNumero, iPessoa: integer;
   dPlnDatDia: TDateTime; sPlaConta: String): Double;
Begin
   Result := 0;

   dtmOperComum.QrySaldoVariacao.Close;
   dtmOperComum.QrySaldoVariacao.ParamByName('PLANO').AsInteger := iPlano;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPLANOPREV').AsInteger := iPlanoPrev;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPATRO').AsInteger := iPatro;
   dtmOperComum.QrySaldoVariacao.ParamByName('PEREXERCICIO').AsInteger := iPerExercicio;
   dtmOperComum.QrySaldoVariacao.ParamByName('PERNUMERO').AsInteger := iPerNumero;
   dtmOperComum.QrySaldoVariacao.ParamByName('PLNDATDIA').AsDateTime := dPlnDatDia;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPESSOA').AsInteger := iPessoa;
   dtmOperComum.QrySaldoVariacao.ParamByName('PLACONTA').AsString := Espaco(sPlaConta, 18);
   dtmOperComum.QrySaldoVariacao.Open;
   Result := dtmOperComum.QrySaldoVariacao.FieldByName('SALDO').AsFloat;
End;

// Função que efetua o par de lançamentos Contábeis e o lançamento de CAPCAR (se aplicáveis)
// associados a uma Operação de Investimento de Renda Fixa e Raviável (de acordo com a tabela
// PadrLancContInv), já contabilizando inclusive as despesas da Operação.

Function TOperComum.LancaOperRFRV(iEmpresaProp, iModuloOrigem, iTipoInvest, iInvestimento, iTipoOperacao, iOperacao, iForCli, iCarteira, iMoeda: integer;
                                  sTipoTitulo, sLote, sHistContab, sHistCapCar, sRecPagBol: String;
                                  Var sTipoRecDesBol: String;
                                  Var bCriaLancto: boolean;
                                  fTotalLiquido, fVlrOper: currency;
                                  dDataOper, dDataVenc: TDateTime;
                                  Var iPlano, iPlanilhaOper, iDocumentoOper: integer;
                                  Var sMensErro: String;
                                  sIntegraCapCar: String = '';
                                  bGravaDoc: Boolean = True;
                                  bLancaFin: Boolean = True;
                                  iCodTipDoc: Integer = 0;
                                  bDireitoOrig: Boolean = True;
                                  iPlanPrevPatr: Integer = -1): shortint;
Var
   iFlgContaInvest, iTipoDespesa, iNumFatura, iPlanoDs, iPlanoPrev, iPatro: integer;
   iSubContaDebOp, iSubContaCredOp, iUnidNegocOp, iTipoDocOp: integer;
   iSubContaDebDs, iSubContaCredDs, iUnidNegocDs, iTipoDocDs: integer;
   sContaCredOp, sContaDebOp, sCentroCustoCredOp, sCentroCustoDebOp, sCentroResponOp,
      sRecPagNaoOp, sTipoPerOp, sRecPagOp, sTipoRecDesOp, sComplementoOp, sTipoParcelaOp,
      sHistoricoOp,
      sContaCredDs, sContaDebDs, sCentroCustoCredDs, sCentroCustoDebDs, sCentroResponDs,
      sRecPagNaoDs, sTipoPerDs, sRecPagDs, sTipoRecDesDs, sComplementoDs, sTipoParcelaDs,
      //AL_83
   sHistoricoDs, sContaDoc, sPlanPrevHist: String;
   //Al   _10
   sContaTemp: String;

   bTransacao, bContabOper, bLancaCAPCAROper, bContabDesp, bLancaCAPCARDesp, bAchouOperacao,
      bAchouDespesa, bMostraMsg, bVenda: boolean;
   iPortador, iAchouPadrao, iIdHistCartInv, iIdHistCartInvLucro: integer;
   sPlano, sOperacao, sStatus, sDebCre, sContaAux, sContabiliza, sSQL: String;

   qryDespOper: TwwQuery;
   fVlrOperAbs, fVlrDesp, fVlrDespAbs, fVlrLiquido, fVlrLancto: double;
   fNoDocumento: extended;
   iAno, iMes, iDia: word;
   //AL_10
   fVlrRecPag: Double;
   //AL_100
   iTipoOperCPVD: Integer;
Begin
   Result := 0;

   //AL_91 - Não executa nada, para melhorar a performance
   If Not CtrlInvContab.IntegraCtbFinModulo Then
      Exit;

   If Copy(sTipoRecDesBol, 1, 1) = 'N' Then
   Begin
      sContabiliza := Copy(sTipoRecDesBol, 1, 1);
      sTipoRecDesBol := '';
   End
   Else
      sContabiliza := '';

   Screen.Cursor := crHourGlass;
   bTransacao := False;
   bMostraMsg := True;
   iNumFatura := 0;
   sOperacao := '2';
   sStatus := '';
   sComplementoOp := '79';
   sComplementoDs := '';
   fVlrLiquido := 0;
   iPlanoDs := -1;

   If iDocumentoOper = 0 Then
      iDocumentoOper := -1;

   If iPlano = 0 Then
      iPlano := -1;

   If iPlanilhaOper = 0 Then
      iPlanilhaOper := -1;

   Try // Finally
      //AL_85
      Try //Except (Re-Raised)
         iIdHistCartInv := 0;
         iIdHistCartInvLucro := 0;
         // Busca registro de HistCartInv correspondente à Movimentação
         dtmOperComum.QryLocal.Close;
         dtmOperComum.QryLocal.Sql.Clear;
         dtmOperComum.QryLocal.Sql.Add('SELECT HISTCARTINV.IDHISTCARTINV            ');
         dtmOperComum.QryLocal.Sql.Add('FROM HISTCARTINV                ');
         dtmOperComum.QryLocal.Sql.Add('WHERE (HISTCARTINV.IDOPERACAOINVEST = ' + QuotedStr(IntToStr(iOperacao)) + ')');
         dtmOperComum.QryLocal.Sql.Add('  AND (HISTCARTINV.TIPMOVCARTINV    = ''OPE'') ');
         dtmOperComum.QryLocal.Open;
         iIdHistCartInv := dtmOperComum.QryLocal.FieldByName('IDHISTCARTINV').AsInteger;
         dtmOperComum.QryLocal.Close;

         If iTipoOperacao > 0 Then
         Begin
            dtmOperComum.QryLocal.Close;
            dtmOperComum.QryLocal.Sql.Clear;
            dtmOperComum.QryLocal.Sql.Add('SELECT HISTCARTINV.IDHISTCARTINV            ');
            dtmOperComum.QryLocal.Sql.Add('FROM HISTCARTINV                ');
            dtmOperComum.QryLocal.Sql.Add('WHERE (HISTCARTINV.IDOPERACAOINVEST = ' + QuotedStr(IntToStr(iOperacao)) + ')');
            dtmOperComum.QryLocal.Sql.Add('  AND (HISTCARTINV.TIPMOVCARTINV    = ''LUC'') ');
            dtmOperComum.QryLocal.Open;
            iIdHistCartInvLucro := dtmOperComum.QryLocal.FieldByName('IDHISTCARTINV').AsInteger;
            dtmOperComum.QryLocal.Close;
         End
         // AL_21 - 21/02/2005
         Else If (iTipoOperacao = -34) Or (iTipoOperacao = -35) Or (iTipoOperacao = -118) Then
         Begin
            dtmOperComum.QryLocal.Close;
            dtmOperComum.QryLocal.Sql.Clear;
            dtmOperComum.QryLocal.Sql.Add('SELECT HISTCARTINV.IDHISTCARTINV            ');
            dtmOperComum.QryLocal.Sql.Add('FROM HISTCARTINV                ');
            dtmOperComum.QryLocal.Sql.Add('WHERE (HISTCARTINV.IDOPERACAOINVEST = ' + QuotedStr(IntToStr(iOperacao)) + ')');
            dtmOperComum.QryLocal.Sql.Add('  AND (HISTCARTINV.TIPMOVCARTINV    = ''OPE'') ');
            dtmOperComum.QryLocal.Open;
            iIdHistCartInv := dtmOperComum.QryLocal.FieldByName('IDHISTCARTINV').AsInteger;

            dtmOperComum.QryLocal.Close;
            dtmOperComum.QryLocal.Sql.Clear;
            dtmOperComum.QryLocal.Sql.Add('SELECT HISTCARTINV.IDHISTCARTINV            ');
            dtmOperComum.QryLocal.Sql.Add('FROM HISTCARTINV                ');
            dtmOperComum.QryLocal.Sql.Add('WHERE (HISTCARTINV.IDOPERACAOINVEST = ' + QuotedStr(IntToStr(iOperacao)) + ')');
            dtmOperComum.QryLocal.Sql.Add('  AND (HISTCARTINV.TIPMOVCARTINV    = ''LUC'') ');
            dtmOperComum.QryLocal.Open;
            iIdHistCartInvLucro := dtmOperComum.QryLocal.FieldByName('IDHISTCARTINV').AsInteger;
            dtmOperComum.QryLocal.Close;
         End
         Else // Operações Internas
         Begin
            Case iTipoOperacao Of
               -1, -2, -9: // Atualização de Renda Fixa e Variável
                  Begin
                     sSQL :=
                        'SELECT MAX(HISTCARTINV.IDHISTCARTINV) AS IDHISTCARTINV ' +
                        'FROM HISTCARTINV ' +
                        'WHERE (HISTCARTINV.IDCARTEIRAINVEST = ' + QuotedStr(IntToStr(iCarteira)) + ') AND ' +
                        '      (HISTCARTINV.IDINVESTIMENTO   = ' + QuotedStr(IntToStr(iInvestimento)) + ') AND '+
                        '      (HISTCARTINV.DATAMOVCARTINV   = TO_DATE(' + QuotedStr(DateToStr(dDataOper)) + ',''DD/MM/YYYY'')) AND '+
                        '      (HISTCARTINV.TIPMOVCARTINV    = ''ATU'') AND ';

                     If Slote <> '' Then
                        sSQL := sSQL + '      (HISTCARTINV.IDLOTE           = ' + QuotedStr(sLote) + ') '
                     Else
                        sSQL := sSQL + '      (HISTCARTINV.IDLOTE IS NULL) ';

                     dtmOperComum.QryLocal.Close;
                     dtmOperComum.QryLocal.Sql.Clear;
                     dtmOperComum.QryLocal.Sql.Text := sSQL;
                     dtmOperComum.QryLocal.Open;
                     iIdHistCartInv := dtmOperComum.QryLocal.FieldByName('IDHISTCARTINV').AsInteger;
                     bVenda := false;
                     dtmOperComum.QryLocal.Close;
                  End;
               //Al_104
               -6, -10006: // Baixa por Transferência de Renda Variável
                  Begin
                     dtmOperComum.QryLocal.Close;
                     dtmOperComum.QryLocal.Sql.Clear;
                     dtmOperComum.QryLocal.Sql.Add('SELECT HISTCARTINV.IDHISTCARTINV ');
                     dtmOperComum.QryLocal.Sql.Add('FROM HISTCARTINV ');
                     dtmOperComum.QryLocal.Sql.Add('WHERE (HISTCARTINV.IDOPERACAOINVEST = ' + QuotedStr(IntToStr(iOperacao)) + ') AND ');
                     dtmOperComum.QryLocal.Sql.Add('      (HISTCARTINV.TIPMOVCARTINV    = ''TRF'') AND ');
                     dtmOperComum.QryLocal.Sql.Add('      (HISTCARTINV.NATURMOVCARTINV  = ''D'')   ');
                     dtmOperComum.QryLocal.Open;
                     iIdHistCartInv := dtmOperComum.QryLocal.FieldByName('IDHISTCARTINV').AsInteger;
                     bVenda := false;
                     dtmOperComum.QryLocal.Close;
                  End;
               //Al_104
               -4, -10004: // Acréscimo por Transferência de Renda Variável
                  Begin
                     dtmOperComum.QryLocal.Close;
                     dtmOperComum.QryLocal.Sql.Clear;
                     dtmOperComum.QryLocal.Sql.Add('SELECT HISTCARTINV.IDHISTCARTINV ');
                     dtmOperComum.QryLocal.Sql.Add('FROM HISTCARTINV ');
                     dtmOperComum.QryLocal.Sql.Add('WHERE (HISTCARTINV.IDOPERACAOINVEST = ' + QuotedStr(IntToStr(iOperacao)) + ') AND ');
                     dtmOperComum.QryLocal.Sql.Add('      (HISTCARTINV.TIPMOVCARTINV    = ''TRF'') AND ');
                     dtmOperComum.QryLocal.Sql.Add('      (HISTCARTINV.NATURMOVCARTINV  = ''A'') ');
                     dtmOperComum.QryLocal.Open;
                     iIdHistCartInv := dtmOperComum.QryLocal.FieldByName('IDHISTCARTINV').AsInteger;
                     bVenda := false;
                     dtmOperComum.QryLocal.Close;
                  End;
               -17, -18, -19: // Incorporacao de Juros,Pagamento de Juros e Amort.Principal
                  Begin
                     sSQL :=
                        'SELECT MAX(HISTCARTINV.IDHISTCARTINV) AS IDHISTCARTINV ' +
                        'FROM HISTCARTINV ' +
                        'WHERE (HISTCARTINV.IDCARTEIRAINVEST = ' + QuotedStr(IntToStr(iCarteira)) + ') AND ' +
                        '      (HISTCARTINV.IDINVESTIMENTO   = ' + QuotedStr(IntToStr(iInvestimento)) + ') AND '+
                        '      (HISTCARTINV.DATAMOVCARTINV   = TO_DATE(' + QuotedStr(DateToStr(dDataOper)) + ',''DD/MM/YYYY'')) AND '+
                        '      (HISTCARTINV.TIPMOVCARTINV    = ''OPE'') AND ' +
                        '      (HISTCARTINV.IDTIPOOPERACAO   = ' + IntToStr(iTipoOperacao) + ') AND ';

                     If Slote <> '' Then
                        sSQL := sSQL + '      (HISTCARTINV.IDLOTE           = ' + QuotedStr(sLote) + ') '
                     Else
                        sSQL := sSQL + '      (HISTCARTINV.IDLOTE IS NULL) ';

                     dtmOperComum.QryLocal.Close;
                     dtmOperComum.QryLocal.Sql.Clear;
                     dtmOperComum.QryLocal.Sql.Text := sSQL;
                     dtmOperComum.QryLocal.Open;
                     iIdHistCartInv := dtmOperComum.QryLocal.FieldByName('IDHISTCARTINV').AsInteger;
                     bVenda := false;
                     dtmOperComum.QryLocal.Close;
                  End;
               //Al_104
               -63, -67, -10063, -10067: // Acréscimo por Transferência de Carteira de Renda Variável
                  Begin
                     // AL_65 - Novo reprocessamento linear e nova TRC
                     dtmOperComum.QryLocal.Close;
                     dtmOperComum.QryLocal.Sql.Clear;
                     dtmOperComum.QryLocal.SQL.Add('SELECT OPERCUSTODIA.IDHISTCARTINVDEST ');
                     dtmOperComum.QryLocal.SQL.Add('FROM OPERCUSTODIA ');
                     dtmOperComum.QryLocal.SQL.Add('WHERE OPERCUSTODIA.IDOPERCUSTODIA = ' + IntToStr(iOperacao));
                     dtmOperComum.QryLocal.SQL.Add('  AND OPERCUSTODIA.IDCARTEIRADEST = ' + IntToStr(iCarteira));
                     dtmOperComum.QryLocal.SQL.Add('  AND OPERCUSTODIA.IDINVESTIMENTO = ' + IntToStr(iInvestimento));
                     dtmOperComum.QryLocal.SQL.Add('  AND OPERCUSTODIA.IDTIPOOPERDEST = ' + IntToStr(iTipoOperacao));
                     dtmOperComum.QryLocal.SQL.Add('  AND OPERCUSTODIA.DATAMOVCUSTOD =  TO_DATE(' + QuotedStr(DateToStr(dDataOper)) + ',''DD/MM/YYYY'')');
                     dtmOperComum.QryLocal.Open;
                     If dtmOperComum.QryLocal.IsEmpty Then
                        Begin
                           dtmOperComum.QryLocal.Close;
                           dtmOperComum.QryLocal.Sql.Clear;
                           dtmOperComum.QryLocal.SQL.Add('SELECT MAX(HISTCARTINV.IDHISTCARTINV) AS IDHISTCARTINV ');
                           dtmOperComum.QryLocal.SQL.Add('FROM HISTCARTINV ');
                           dtmOperComum.QryLocal.SQL.Add('WHERE HISTCARTINV.IDTIPOINVEST = 2 ');
                           dtmOperComum.QryLocal.SQL.Add('  AND HISTCARTINV.IDCARTEIRAGERENC IS NULL ');
                           dtmOperComum.QryLocal.SQL.Add('  AND HISTCARTINV.IDCARTEIRAINVEST = ' + IntToStr(iCarteira));
                           dtmOperComum.QryLocal.SQL.Add('  AND HISTCARTINV.IDINVESTIMENTO = ' + IntToStr(iInvestimento));
                           dtmOperComum.QryLocal.SQL.Add('  AND HISTCARTINV.DATAMOVCARTINV =  TO_DATE(' + QuotedStr(DateToStr(dDataOper)) + ',''DD/MM/YYYY'')');
                           dtmOperComum.QryLocal.SQL.Add('  AND HISTCARTINV.IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao));
                           dtmOperComum.QryLocal.SQL.Add('  AND HISTCARTINV.TIPMOVCARTINV  = ' + QuotedStr('TRC'));
                           dtmOperComum.QryLocal.Open;

                           iIdHistCartInv := dtmOperComum.QryLocal.FieldByName('IDHISTCARTINV').AsInteger;
                        End
                     Else
                        iIdHistCartInv := dtmOperComum.QryLocal.FieldByName('IDHISTCARTINVDEST').AsInteger;

                     dtmOperComum.QryLocal.Close;
                     dtmOperComum.QryLocal.Sql.Clear;
                     bVenda := false;
                  End;
               //AL_82
               -158, -159, -10158, -10159: // Transferência de Plano de Renda Variável
                  Begin
                     dtmOperComum.QryLocal.Close;
                     dtmOperComum.QryLocal.Sql.Clear;
                     dtmOperComum.QryLocal.Sql.Add('SELECT HISTCARTINV.IDHISTCARTINV            ');
                     dtmOperComum.QryLocal.Sql.Add('FROM HISTCARTINV                ');
                     dtmOperComum.QryLocal.Sql.Add('WHERE (HISTCARTINV.IDOPERACAOINVEST = ' + QuotedStr(IntToStr(iOperacao)) + ') AND ');
                     dtmOperComum.QryLocal.Sql.Add('      (HISTCARTINV.TIPMOVCARTINV    = ''TRP'') ');
                     dtmOperComum.QryLocal.Open;
                     iIdHistCartInv := dtmOperComum.QryLocal.FieldByName('IDHISTCARTINV').AsInteger;
                     dtmOperComum.QryLocal.Close;
                  End;
            End;
         End;

         //AL_86
         dtmOperComum.qryInvestimento.Close;
         If Not (dtmOperComum.qryInvestimento.Prepared) Then dtmOperComum.qryInvestimento.Prepare;
         dtmOperComum.qryInvestimento.ParamByName('INVESTIMENTO').AsInteger := iInvestimento;
         dtmOperComum.qryInvestimento.Open;
         
         iPlanoPrev := iPlanoPrevContab;
         iPatro     := iPatrocinadora;

         //AL_83 - Busca o PlanoPrev e o Patro
         If iPlanPrevPatr = -1 Then
            iPlanPrevPatr := iPlanPrevCtbPatro;
         dtmOperComum.qryLocal.Close;
         dtmOperComum.qryLocal.Sql.Clear;
         dtmOperComum.qryLocal.Sql.Add('SELECT VWPLANPREVCTBPATR.PLANPRVCONTABPATRO AS NOME, VWPLANPREVCTBPATR.IDPATRO, VWPLANPREVCTBPATR.IDPLANOPREV ');
         dtmOperComum.qryLocal.Sql.Add('FROM VWPLANPREVCTBPATR ');
         dtmOperComum.qryLocal.Sql.Add('WHERE VWPLANPREVCTBPATR.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevPatr));
         dtmOperComum.qryLocal.Open;

         iPlanoPrev := dtmOperComum.qryLocal.FieldByName('IDPLANOPREV').AsInteger;
         iPatro     := dtmOperComum.qryLocal.FieldByName('IDPATRO').AsInteger;
         
         sPlanPrevHist := dtmOperComum.qryLocal.FieldByName('NOME').AsString;
         
         dtmOperComum.qryLocal.Close;

         // Verifica o padrão para Contabilização da Var.Positiva/Negativa com compensação
         //AL_109
         If (CtrlPInv.FlgCompVarRV = 'S') And ((iTipoOperacao = -1) Or (iTipoOperacao = -9)) Then // Faz compensaçao entre contas de Var. Positiva e Negativa de RV
            Begin
               If (RecBuscaTipoOperVarRV.VLRSALDO = 0) Then // Primeira Passagem
               Begin
                  RecBuscaTipoOperVarRV.IDPLANOPREV := iPlanoPrev;
                  RecBuscaTipoOperVarRV.IDPATRO := iPatro;
                  DecodeDate(dDataOper, iAno, iMes, iDia);
                  RecBuscaTipoOperVarRV.EXERCICIO := iAno;
                  RecBuscaTipoOperVarRV.DATAINI := DateToStr(dDataOper);
                  RecBuscaTipoOperVarRV.DATAFIM := DateToStr(dDataOper);
                  RecBuscaTipoOperVarRV.IDPESSOA := iEmpresaProp;
                  RecBuscaTipoOperVarRV.TIPOOPERACAO := iTipoOperacao;
                  RecBuscaTipoOperVarRV.VLROPERACAO := ABS(fVlrOper);

                  fVlrOper := ABS(fVlrOper);

                  //AL_86 - Ini
                  // Variação Positiva
                  // AL_107
                  iAchouPadrao := CtrlInvContab.BuscaPadrLanc.Executa(RetornaSegmentacaoRV(iInvestimento), //Renan CGPC
                                                                      dDataOper, iTipoInvest, -1, 0, iInvestimento, iCarteira,
                                                                      iPlanPrevPatr,
                                                                      fVlrOper, sTipoTitulo, 'OPE');
                                                                      
                  RecBuscaTipoOperVarRV.CONTAINIPOS := CtrlInvContab.BuscaPadrLanc.ContaCre;
                  RecBuscaTipoOperVarRV.CONTAFIMPOS := CtrlInvContab.BuscaPadrLanc.ContaCre;

                  // Variação Negativa
                  // AL_107
                  iAchouPadrao := CtrlInvContab.BuscaPadrLanc.Executa(RetornaSegmentacaoRV(iInvestimento), //Renan CGPC
                                                                      dDataOper, iTipoInvest, -9, 0, iInvestimento, iCarteira,
                                                                      iPlanPrevPatr,
                                                                      fVlrOper, sTipoTitulo, 'OPE');

                  RecBuscaTipoOperVarRV.CONTAININEG := CtrlInvContab.BuscaPadrLanc.ContaDeb;
                  RecBuscaTipoOperVarRV.CONTAFIMNEG := CtrlInvContab.BuscaPadrLanc.ContaDeb;
                  //AL_86 - Fim

                  BuscaTipoOperVarRV;

                  iTipoOperacao := RecBuscaTipoOperVarRV.TIPOOPERACAO;

                  //AL_107
                  If RecBuscaTipoOperVarRV.Result = -1 Then // Erro
                  Begin
                     Result := -1;
                     Raise Exception.Create('Existe saldo na conta de Variação Positiva e Negativa');
                  End;
                  fVlrOper := RecBuscaTipoOperVarRV.VLROPERACAO;
               End
               Else // Segunda Passagem se houver saldo de variaçào a compensar.
               Begin
                  iTipoOperacao := RecBuscaTipoOperVarRV.TIPOOPERSALDO;
                  fVlrOper      := RecBuscaTipoOperVarRV.VLRSALDO;
               End;
            End;
         //-------------------------------------------------------------------------------------------------------------

                  // Verifica o Padrão de Lançamento mais adequado
                  //AL_86 - Ini
                  //AL_107
         iAchouPadrao := CtrlInvContab.BuscaPadrLanc.Executa(RetornaSegmentacaoRV(iInvestimento), //Renan CGPC
                                                             dDataOper, iTipoInvest, iTipoOperacao, 0, iInvestimento, iCarteira,
                                                             iPlanPrevPatr,
                                                             fVlrOper, sTipoTitulo, 'OPE');

         iPlano := CtrlInvContab.BuscaPadrLanc.Plano;
         iSubContaDebOp := CtrlInvContab.BuscaPadrLanc.SubContaDeb;
         iSubContaCredOp := CtrlInvContab.BuscaPadrLanc.SubContaCre;
         iUnidNegocOp := CtrlInvContab.BuscaPadrLanc.UnidNegoc;
         sContaDebOp := CtrlInvContab.BuscaPadrLanc.ContaDeb;
         sContaCredOp := CtrlInvContab.BuscaPadrLanc.ContaCre;
         sCentroCustoDebOp := CtrlInvContab.BuscaPadrLanc.CentroCustoDeb;
         sCentroCustoCredOp := CtrlInvContab.BuscaPadrLanc.CentroCustoCred;
         sCentroResponOp := CtrlInvContab.BuscaPadrLanc.CentroRespon;
         sTipoRecDesOp := CtrlInvContab.BuscaPadrLanc.TipoRecDes;
         sTipoPerOp := CtrlInvContab.BuscaPadrLanc.TipoPer;
         sHistoricoOp := CtrlInvContab.BuscaPadrLanc.Historico;
         sRecPagNaoOp := CtrlInvContab.BuscaPadrLanc.RecPagNao;
         //AL_86 - Fim

         bAchouOperacao := (iAchouPadrao = 0);
         //Al_10
         If (bAchouOperacao) And (iTipoOperacao = -109) Then // Acerto Rec/Pag RV
         Begin
            If fVlrOper < 0 Then // Boleta a Pagar, zera a conta de à Receber
            Begin
               sContaTemp := sContaDebOp;
               sContaDebOp := sContaCredOp;
               sContaCredOp := sContaTemp;
            End;
         End;
         
         // Busca a SubConta
         If iTipoInvest = 8 Then // BM&F
         Begin
             dtmOperComum.qryBuscaSubConta.Close;
             dtmOperComum.qryBuscaSubConta.ParamByName('IdCorretValores').AsInteger := iForCli;
             dtmOperComum.qryBuscaSubConta.Open;
             iSubContaDebOp  := dtmOperComum.qryBuscaSubConta.FieldByName('SUBCONTAD').AsInteger;
             iSubContaCredOp := dtmOperComum.qryBuscaSubConta.FieldByName('SUBCONTAC').AsInteger;
             dtmOperComum.qryBuscaSubConta.Close;
         End;

         // Verificação dos parâmetros do Tipo de Operação -----------------------------------------------
         dtmOperComum.qryTipoOperacao.Close;
         If Not (dtmOperComum.qryTipoOperacao.Prepared) Then dtmOperComum.qryTipoOperacao.Prepare;
         dtmOperComum.qryTipoOperacao.ParamByName('TIPOINVEST').AsInteger := iTipoInvest;
         dtmOperComum.qryTipoOperacao.ParamByName('TIPOOERACAO').AsInteger := iTipoOperacao;
         dtmOperComum.qryTipoOperacao.Open;
         iFlgContaInvest := dtmOperComum.qryTipoOperacao.FieldByName('FLGCONTAINVEST').AsInteger;
         iTipoDocOp := dtmOperComum.qryTipoOperacao.FieldByName('CODTIPDOC').AsInteger;

         //AL_100
         If Not dtmOperComum.qryTipoOperacao.FieldByName('IDTIPOOPERCPVD').IsNull Then
         Begin
            iTipoOperCPVD := dtmOperComum.qryTipoOperacao.FieldByName('IDTIPOOPERCPVD').AsInteger;
            dtmOperComum.qryLocal.Close;
            dtmOperComum.qryLocal.Sql.Clear;
            dtmOperComum.qryLocal.Sql.Add('SELECT P.CONTACOPERFIN, P.CONTADOPERFIN FROM PADRLANCCONTINV P WHERE P.IDTIPOOPERACAO = ' + IntToStr(iTipoOperCPVD) + '');
            //   CGPC28
            dtmOperComum.qryLocal.Sql.Add('AND P.DATAVIGENCIA = (SELECT MAX(P1.DATAVIGENCIA) FROM PADRLANCCONTINV P1 WHERE P1.IDTIPOOPERACAO = -109 ');
            dtmOperComum.qryLocal.Sql.Add('                    AND P1.DATAVIGENCIA <= TO_DATE('+QuotedStr(dateToStr(dDataOper))+','+QuotedStr('dd/mm/yyyy')+'))');
            //   CGPC28
            dtmOperComum.qryLocal.Open;
            If Not dtmOperComum.qryLocal.IsEmpty Then
               sContaDoc := OperComum.IIF(sRecPagBol[1] = 'P', dtmOperComum.qryLocal.FieldByName('CONTADOPERFIN').AsString,
                                                               dtmOperComum.qryLocal.FieldByName('CONTACOPERFIN').AsString);
            dtmOperComum.qryLocal.Close;                                                               
         End
         Else
            iTipoOperCPVD := -1;

         //AL_91 - Ini - Ajuste nos testes
         // Integra Contabil
         If (sContabiliza = 'N') Then
            bContabOper := False
         Else
            bContabOper := dtmOperComum.qryTipoOperacao.FieldByName('FLGGERACONTAB').AsInteger = 1;
         //Integra Cap/Car
         If (sIntegraCapCar = 'N') Then
            bLancaCAPCAROper := False
         Else
            bLancaCAPCAROper := dtmOperComum.qryTipoOperacao.FieldByName('FLGGERACAPCAR').AsInteger = 1;
         //AL_91 - Fim
         sRecPagOp := dtmOperComum.qryTipoOperacao.FieldByName('RECPAG').AsString;
         bVenda    := (dtmOperComum.qryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D');
         dtmOperComum.qryTipoOperacao.Close;

         // Início do processamento ----------------------------------------------------------------------
         //AL_54 - 27/10/2005
         //AL_46 - 20/09/2005
         //AL_8  - 25/10/2004
         If (fVlrOper <> 0) Or
            //AL_84 - Provisão de Perda - Precisa contabilizar a provisão inicial, independente de haver variação
         // Inverte os sinais dos Tipos de Operacao para poder comparar com o array []
         //AL_109
           ((fVlrOper = 0) And ((iTipoOperacao * -1) In [9, 1])) Or
           ((fVlrOper = 0) And
            (iTipoOperacao In [CtrlPInv.IdTipoOperDirDiv, CtrlPInv.IdTipoOperDirPer,
                               CtrlPInv.IdTipoOperDirDSA, CtrlPInv.IdTipoOperDirJur,
                               CtrlPInv.IdTipoOperDirMul,
                               //AL_80
                               CtrlPInv.IdTipoOperDirInc]) Or
           ((ABS(iTipoOperacao) - 10000) In [ABS(CtrlPInv.IdTipoOperDirDiv), ABS(CtrlPInv.IdTipoOperDirPer),
                                             ABS(CtrlPInv.IdTipoOperDirDSA), ABS(CtrlPInv.IdTipoOperDirJur),
                                             ABS(CtrlPInv.IdTipoOperDirMul),
                                             //AL_80
                                             ABS(CtrlPInv.IdTipoOperDirInc)])) Then
            Begin
               // verifica se já existe transação em andamento; se não houver, inicia uma
               If Not (dtmBaseDados.dbBaseDados.InTransaction) Then
               Begin
                  bTransacao := True;
                  StartTransacao;
               End;

               // Modula o valor da operação
               fVlrOperAbs := abs(fVlrOper);

               // Chamada às funções de integração Contábil e Financeira ---------------------------------------
               If ((bContabOper) And (bAchouOperacao)) Then
               Begin
                  If iPlanilhaOper = -1 Then
                     iPlanilhaOper := 0;

                  sHistoricoOp := trim(sHistoricoOp)+ ' / '+trim(dtmOperComum.QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString);

                  If iTipoInvest = 1 Then // pega Lote da aplicação
                     sHistoricoOp := trim(sHistoricoOp) + '  ' + trim(sLote)
                  Else If iTipoInvest = 8 Then
                     sHistoricoOp := trim(sHistoricoOp) + '  ' + trim(sHistContab)
                  Else // pega Lote da operação
                     sHistoricoOp := trim(sHistoricoOp) + '  ' + trim(sHistCapCar);

                  // Baixa da Operação de Anuncio de Proventos (Contabiliza a diferença caso exista)
                  //AL_8 - 25/10/2004
                  //AL_109
                  If (iTipoOperacao In [CtrlPInv.IdTipoOperDirDiv,
                                        CtrlPInv.IdTipoOperDirJur, CtrlPInv.IdTipoOperDirMul]) Or
                    ((ABS(iTipoOperacao) - 10000) In [ABS(CtrlPInv.IdTipoOperDirDiv),
                                                      ABS(CtrlPInv.IdTipoOperDirJur), ABS(CtrlPInv.IdTipoOperDirMul)]) Then
                  Begin
                     //if fTotalLiquido <> 0 then
                     If fVlrOper <> 0 Then
                     Begin
                        fVlrOperAbs := abs(fVlrOper);
                        //AL_83
                        If Not (LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaDebOp, iSubContaCredOp,
                                                   iUnidNegocOp, iForCli, iPlanoPrev, iPatro,
                                                   sContaDebOp, sContaCredOp, sCentroCustoDebOp, sCentroCustoCredOp,
                                                   sHistoricoOp + ' - ' + TRIM(sPlanPrevHist), sTipoPerOp, sRecPagOp,
                                                   dDataOper, fVlrOperAbs, bMostraMsg, iPlanilhaOper, sMensErro)) Then
                        Begin
                           Result := -6; // não foi possível efetuar o lançamento contábil
                           //AL_107
                           Raise Exception.Create(sMensErro);
                        End;
                     End;
                     fVlrOper := fTotalLiquido;
                     fVlrOperAbs := abs(fVlrOper);
                  End
                  Else
                  Begin
                     //Recebimento de Anúncio, o valor(fVlrOper) e tratado dentro do contábil
                     //AL_8 - 25/10/2004
                     If (iTipoOperacao = -70) Or ((10000 - ABS(iTipoOperacao)) = -70) Then
                     Begin
                        //AL_83
                        If Not (LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaDebOp, iSubContaCredOp,
                                                   iUnidNegocOp, iForCli, iPlanoPrev, iPatro,
                                                   sContaDebOp, sContaCredOp, sCentroCustoDebOp, sCentroCustoCredOp,
                                                   sHistoricoOp + ' - ' + TRIM(sPlanPrevHist), sTipoPerOp, sRecPagOp,
                                                   dDataOper, fVlrOper, bMostraMsg, iPlanilhaOper, sMensErro)) Then
                        Begin
                           Result := -6; // não foi possível efetuar o lançamento contábil
                           //AL_107
                           Raise Exception.Create(sMensErro);
                        End;
                     End
                     //AL_84
                     Else If fVlrOperAbs > 0 Then
                     Begin
                        //AL_83
                        If Not (LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaDebOp, iSubContaCredOp,
                                                   iUnidNegocOp, iForCli, iPlanoPrev, iPatro,
                                                   sContaDebOp, sContaCredOp, sCentroCustoDebOp, sCentroCustoCredOp,
                                                   sHistoricoOp + ' - ' + TRIM(sPlanPrevHist), sTipoPerOp, sRecPagOp,
                                                   dDataOper, fVlrOperAbs, bMostraMsg, iPlanilhaOper, sMensErro)) Then
                        Begin
                           Result := -6; // não foi possível efetuar o lançamento contábil
                           //AL_107
                           Raise Exception.Create(sMensErro);
                        End;
                     End;
                  End;
               End
               Else If ((bContabOper) And (Not bAchouOperacao)) Then
               Begin
                  // AL_62 - Ini
                  //AL_107 - Ini
                  If iAchouPadrao = -4 Then
                     sMensErro := 'Foi encontrado mais de um Roteiro Contábil para essa Operação.'
                  Else
                     sMensErro := 'Não foi encontrado o Roteiro Contábil para essa Operação.';

                  Result := -1;
                  Raise Exception.Create(sMensErro);
                  //AL_107 - Fim
                  //AL_62 - Fim
               End;

               If (sRecPagBol = 'Y') Then
                  sRecPagBol := 'R';

               // se é para ser feita contabilização e esta tiver sido efetuada com sucesso,
               // ou se não é necessário contabilizar
               If (((bContabOper) And (bAchouOperacao)) Or (Not (bContabOper))) Then
               Begin
                  // Se a Operação Integra CAPCAR, alimenta sRecPagBol
                  If (bLancaCAPCAROper) Then
                  Begin
                     If Trim(sRecPagBol) = '' Then
                     Begin
                        sRecPagBol := sRecPagNaoOp;
                        If Trim(sRecPagNaoOp) = '' Then
                        Begin
                           sMensErro := 'Tipo de Recebimento/Desembolso não especificado.';
                           Result := -1;
                           //AL_107
                           Raise Exception.Create(sMensErro);
                        End;
                     End;
                     If Trim(sTipoRecDesBol) = '' Then
                     Begin
                        sTipoRecDesBol := sTipoRecDesOp;
                        If Trim(sTipoRecDesOp) = '' Then
                        Begin
                           sMensErro := 'Tipo de Recebimento/Desembolso não especificado.';
                           //AL_107
                           Raise Exception.Create(sMensErro);
                        End;
                     End;
                  End
                  Else If ((bLancaCAPCAROper) And (bAchouOperacao)) Then
                  Begin
                     //AL_107
                     sMensErro := 'Parametrização da Integração com CAP/CAR não cadastrada';
                     Raise Exception.Create(sMensErro);
                     Exit;
                  End;

                  // Se a Operação Integra CAPCAR, Cria Documento
                  If (bLancaCAPCAROper) And (iDocumentoOper = -1) And (bLancaFin) Then
                  Begin
                     // AL_86 - Ini
                     // gera o identificador incremental da tabela DOCUMENTO
                     If CtrlInvContab.Documento.GetDocSequence Then
                        iDocumentoOper := CtrlInvContab.Documento.CodDocumento;
                     // Prepara um novo documento
                     CtrlInvContab.Documento.Prepare;

                     iPortador := -1;

                     CtrlInvContab.Documento.GetNoDocumento;
                     
                     fNoDocumento := CtrlInvContab.Documento.NoDocumento;

                     //AL_100
                     If iTipoOperCPVD = -1 Then
                        sContaDoc := OperComum.IIF(sRecPagBol[1] = 'P', sContaCredOp, sContaDebOp);

                     sPlano := IntToStr(iPlano);
                     //AL_20
                     If iCodTipDoc <> 0 Then
                        iTipoDocOp := iCodTipDoc;
                     // Parametros para a Segregação
                     CtrlInvContab.Plano := iPlano;
                     CtrlInvContab.Patro := iPatro;
                     CtrlInvContab.PlanPrev := iPlanoPrev;
                     // Cria Documento
                     If Not CtrlInvContab.Documento.SetValues(iDocumentoOper,
                                                              fNoDocumento,
                                                              sComplementoOp, sStatus, sRecPagBol[1], sOperacao,
                                                              '' {sNumslip}, '' {sNumleitcodbarras}, sContaDoc, sCentroCustoCredOp,
                                                              '' {sNossonumero}, '' {sNumdigcodbarras}, '' {sGrupodoc}, '' {sFlgemitelancbaix},
                                                              '' {sFlgconfirmarecpag}, '' {sEmisbloq}, '' {sReferencia}, '' {sObs},
                                                              dDataVenc {dDatavencto}, dDataOper {dDataemissao},
                                                              dDataVenc {dDataprogramada}, 0 {dDataremessa}, 0 {dDatalimite}, 0 {dDatacorrecao},
                                                              0 {rVlrmulta}, 0 {rValorjuros}, 0 {rValordesconto}, 0 {rPercjurossimples}, 0 {rPercjurosatuarial},
                                                              iTipoDocOp, Sistema.idEmpresa, iModuloOrigem, iForCli, iNumFatura,
                                                              0 {liIdcbancaria}, iUnidNegocOp, iPlano, 0 {liNumcpbaixa}, 0 {liNumapgr},
                                                              iMoeda, 0 {liLotetransmissao}, -1 {liIndicecorrecao},
                                                              Sistema.idUsuario, Sistema.idEmpresa, 1 {liFlgnaoconciliado}, 0 {liControleremessa},
                                                              iSubContaCredOp, iPortador,
                                                              0 {liCodgrupocnab}, 0 {liCodgeradorinss}, -1 {liCodforma},
                                                              dDataVenc {dDataDisp},
                                                              CtrlInvContab.CriterioSegregacao {iIdSegregaCriter: integer = -1}) Then
                        //AL_87 - Precisa captar a mensagem do Objeto Documento
                        Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

                     //AL_90
                     CtrlInvContab.Documento.ContaInvest := iFlgContaInvest
                        // AL_86 - Fim
                  End;

                  If ((bAchouOperacao) And (bLancaCAPCAROper) And (sRecPagNaoOp <> 'N') And
                     (bLancaFin)) Then
                  Begin
                     If sRecPagBol <> sRecPagNaoOp Then
                        fVlrOper := -fVlrOper;

                     //AL_22 Ini
                     If iCodTipDoc <> 0 Then // Vem da Boleta
                     Begin
                        fVlrOper := Abs(fVlrOper);
                        If sRecPagBol = 'P' Then // Vem do Boleta
                        Begin
                           If sRecPagOp = 'P' Then // Vem do TipoOperacao
                           Begin
                              If sRecPagNaoOp = 'R' Then // Vem da PadrLancContInv
                                 fVlrOper := fVlrOper * -1;
                           End
                           Else
                              If sRecPagOp = 'R' Then
                              Begin
                                 If sRecPagNaoOp = 'R' Then
                                    fVlrOper := fVlrOper * -1;
                              End;
                        End
                        Else If sRecPagBol = 'R' Then
                        Begin
                           If sRecPagOp = 'P' Then
                           Begin
                              If sRecPagNaoOp = 'P' Then
                                 fVlrOper := fVlrOper * -1;
                           End
                           Else
                              If sRecPagOp = 'R' Then
                              Begin
                                 If sRecPagNaoOp = 'P' Then
                                    fVlrOper := fVlrOper * -1;
                              End;
                        End;
                     End;
                     //AL_22 Fim

                     //MUDANCA PARA O RATEIO DE ANUNCIO DE PROVENTOS
                     If sIntegraCapCar = 'S' Then
                        fVlrOper := OperComum.IIF(sRecPagBol <> sRecPagNaoOp, (fTotalLiquido * -1), fTotalLiquido);

                     If ((iTipoOperacao = -10) Or (iTipoOperacao = -11)) Then // Ajuste de BM&F
                        fVlrOper := fTotalLiquido;

                     // Cria Rateio
                     //AL_109
                     If Not CtrlInvContab.Documento.RateioDocumSetValues(fVlrOper, 0 {rValorOM}, 0 {rVlrresorcamen},
                                                                         0 {liIdrateiodocum}, Sistema.idEmpresa {liIdpessoa},
                                                                         iDocumentoOper, iUnidNegocOp, 0 {liMoecodigo}, Sistema.idUsuario,
                                                                         0 {liIdreservaorcamen},
                                                                         iPlano, iPlanoPrev, iPatro,
                                                                         CtrlPInv.IdPrograma, // dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger,
                                                                         0 {liIdprocesso}, Sistema.idEmpresa,
                                                                         sTipoRecDesBol, sRecPagBol[1], sCentroResponOp,
                                                                         sCentroCustoCredOp, '' {sNumimovel}) Then
                        //AL_87
                        Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

                     fVlrLiquido := fVlrLiquido + fVlrOper;
                  End;

                  // Trata Despesas Internas
                  If iTipoInvest <> 8 Then
                  Begin
                     qryDespOper := dtmOperComum.qryDespNegXTipoOper;
                     If (iTipoOperacao = -7) Or (iTipoOperacao = -8) Then // Atualização IR Litigio
                     Begin
                        qryDespOper.Close;
                        qryDespOper.SQL.Clear;
                        qryDespOper.SQL.Add('SELECT DISTINCT DESPESASXTIPOOPER.IDTIPODESPINVEST, DESPESASXTIPOOPER.FLGGERACONTAB, ');
                        qryDespOper.SQL.Add('       DESPESASXTIPOOPER.FLGGERACAPCAR, DESPESASXTIPOOPER.CODTIPDOC, DESPESASXTIPOOPER.RECPAG ');
                        qryDespOper.SQL.Add('FROM DESPESASXTIPOOPER                           ');
                        qryDespOper.SQL.Add('WHERE DESPESASXTIPOOPER.IDTIPOINVEST = ' + IntToStr(iTipoInvest));
                        qryDespOper.SQL.Add('AND   DESPESASXTIPOOPER.IDTIPODESPINVEST = ' + IntToStr(iOperacao));
                        qryDespOper.Open;
                     End
                     Else
                     Begin
                        qryDespOper.Close;
                        If Not (qryDespOper.Prepared) Then qryDespOper.Prepare;
                        qryDespOper.ParamByName('TIPOINVEST').AsInteger  := iTipoInvest;
                        qryDespOper.ParamByName('TIPOOERACAO').AsInteger := iTipoOperacao;
                        qryDespOper.Open;
                        //AL_54 - 27/10/2005
                        //AL_45 - 15/09/2005
                        //Ingressão de Permulta - variação, despreza
                        //AL_109
                        If ((((CtrlPInv.IdTipoOperDirPer = iTipoOperacao) Or
                              (CtrlPInv.IdTipoOperDirPer + 10000 = iTipoOperacao)) Or
                             ((CtrlPInv.IdTipoOperDirDSA = iTipoOperacao) Or
                              (CtrlPInv.IdTipoOperDirDSA + 10000 = iTipoOperacao))) And
                              (Not bDireitoOrig)) Then
                        Begin
                           //AL_47 - 20/09/2005
                           //LUCRO e PREJUIZO
                           qryDespOper.Filter := 'IDTIPODESPINVEST <> -4 AND IDTIPODESPINVEST <> -5 ';

                           //AL_54 - 27/10/2005 - o destino não faz variação, só custo
                           //AL_109
                           If ((CtrlPInv.IdTipoOperDirDSA = iTipoOperacao) Or
                               (CtrlPInv.IdTipoOperDirDSA + 10000 = iTipoOperacao)) Then
                              qryDespOper.Filter := qryDespOper.Filter + ' AND IDTIPODESPINVEST <> -2 AND IDTIPODESPINVEST <> -19 ';

                           qryDespOper.Filtered := True;
                        End
                        Else
                        Begin
                           qryDespOper.Filter := '';
                           qryDespOper.Filtered := False;
                        End;
                     End;

                     While Not qryDespOper.Eof Do
                     Begin
                        iTipoDespesa := qryDespOper.FieldByName('IDTIPODESPINVEST').AsInteger;
                        iTipoDocDs   := qryDespOper.FieldByName('CODTIPDOC').AsInteger;

                        If sContabiliza = 'N' Then
                           bContabDesp := False
                        Else
                           bContabDesp := qryDespOper.FieldByName('FLGGERACONTAB').AsInteger = 1;

                        bLancaCAPCARDesp := qryDespOper.FieldByName('FLGGERACAPCAR').AsInteger = 1;

                        sRecPagDs := qryDespOper.FieldByName('RECPAG').AsString;

                        If (iTipoOperacao <> -7) And (iTipoOperacao <> -8) Then // Não busca valor p/ Atualização IR Litigio
                        Begin
                           If ((iTipoDespesa = -4) Or (iTipoDespesa = -5)) And
                              (iIdHistCartInvLucro <> 0) Then
                              BuscaValorAContabilizar(iIdHistCartInvLucro, iTipoDespesa, iTipoInvest, bVenda, fVlrDesp)
                           Else If (iIdHistCartInv <> 0) Then
                              BuscaValorAContabilizar(iIdHistCartInv, iTipoDespesa, iTipoInvest, bVenda, fVlrDesp);

                           //Ricardo Cristiano - 15/01/2010 - N. Sol 115288 / 682 -  N. Kintana 712646
                           //Caso não encontre variação negativa no registro da operação, busca no lucro/prejuizo a variação a compensar.
                           If ((fVlrDesp = 0) and (iTipoDespesa = -19)) And
                              (iIdHistCartInvLucro <> 0) Then
                              BuscaValorAContabilizar(iIdHistCartInvLucro, iTipoDespesa, iTipoInvest, bVenda, fVlrDesp)
                        End
                        Else
                           fVlrDesp := fVlrOper; // Valor a contab. da Atualiz. IR Litigio

                        // Despreza Lucro na Venda quando valor Lucro é negativo, e Prejuizo na Venda quando
                        // Lucro é positivo.
                        // só vai adiante se for necessário fazer algum tipo de lançamento (Contábil ou CAP/CAR)...
                        If ((bContabDesp) Or (bLancaCAPCARDesp)) Then
                        Begin
                           If fVlrDesp <> 0 Then
                           Begin
                              // verifica se já existe transação em andamento; se não houver, inicia uma
                              If Not (dtmBaseDados.dbBaseDados.InTransaction) Then
                              Begin
                                 bTransacao := True;
                                 StartTransacao;
                              End;

                              // Busca da PadrLancContInv p/ fazer os lançamentos ---------------------------------------------

                              // AL_55 - 02/11/2005
                              // Al_46 - 20/09/2005
                              // Usa valor absoluto do prejuizo para buscar contabilizaçao
                              //AL_109
                              If  ((iTipoDespesa = -5) Or
                                 (((CtrlPInv.IdTipoOperDirPer = iTipoOperacao) Or
                                   (CtrlPInv.IdTipoOperDirPer + 10000 = iTipoOperacao)) Or
                                  ((CtrlPInv.IdTipoOperDirDSA = iTipoOperacao) Or
                                   (CtrlPInv.IdTipoOperDirDSA + 10000 = iTipoOperacao)) And (Not bDireitoOrig))) Then
                                 fVlrDesp := -fVlrDesp;

                              // Verifica o Padrão de Lançamento mais adequado
                              //AL_86
                              //AL_107
                              iAchouPadrao := CtrlInvContab.BuscaPadrLanc.Executa(RetornaSegmentacaoRV(iInvestimento), //Renan CGPC
                                                                                  dDataOper, iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento, iCarteira,
                                                                                  iPlanPrevPatr,
                                                                                  fVlrOper, sTipoTitulo, 'DOP');
                              iPlanoDs := CtrlInvContab.BuscaPadrLanc.Plano;
                              iSubContaDebDs := CtrlInvContab.BuscaPadrLanc.SubContaDeb;
                              iSubContaCredDs := CtrlInvContab.BuscaPadrLanc.SubContaCre;
                              iUnidNegocDs := CtrlInvContab.BuscaPadrLanc.UnidNegoc;
                              sContaDebDs := CtrlInvContab.BuscaPadrLanc.ContaDeb;
                              sContaCredDs := CtrlInvContab.BuscaPadrLanc.ContaCre;
                              sCentroCustoDebDs := CtrlInvContab.BuscaPadrLanc.CentroCustoDeb;
                              sCentroCustoCredDs := CtrlInvContab.BuscaPadrLanc.CentroCustoCred;
                              sCentroResponDs := CtrlInvContab.BuscaPadrLanc.CentroRespon;
                              sTipoRecDesDs := CtrlInvContab.BuscaPadrLanc.TipoRecDes;
                              sTipoPerDs := CtrlInvContab.BuscaPadrLanc.TipoPer;
                              sHistoricoDs := CtrlInvContab.BuscaPadrLanc.Historico;
                              sRecPagNaoDs := CtrlInvContab.BuscaPadrLanc.RecPagNao;

                              bAchouDespesa := (iAchouPadrao = 0);

                              // Volta valor do prejuizo
                              //AL_77 - Ini
                              If (iTipoDespesa = -5) Then
                                 fVlrDesp := -fVlrDesp
                              Else If (iTipoDespesa = -34) Then
                              Begin
                                 // Caso seja provisão de perda e o valor da provisão for inverso da variação
                                 //   (Primeiro provisionamento)
                                 If ((fVlrDesp > 0) And (fVlrOper < 0)) Or ((fVlrDesp < 0) And (fVlrOper > 0)) Then
                                 Begin
                                    sContaTemp := sContaDebDs;
                                    sContaDebDs := sContaCredDs;
                                    sContaCredDs := sContaTemp;
                                 End;
                              End;
                              //AL_77 - Fim

                              // Modula o valor da despesa
                              fVlrDespAbs := abs(fVlrDesp);

                              // @X Chamada às funções de integração Contábil e Financeira ---------------------------------------

                              If (bContabDesp) And (bAchouDespesa) Then
                              Begin
                                 If iPlanilhaOper = -1 Then
                                    iPlanilhaOper := 0;

                                 //AL_72
                                 //AL_109
                                 If ((CtrlPInv.IdTipoOperDirInc = iTipoOperacao) Or
                                    (CtrlPInv.IdTipoOperDirInc + 10000 = iTipoOperacao) Or
                                    (iTipoOperacao = -149)) Then //Incorporação de Ações
                                    sHistoricoDs := sHistoricoDs + sHistContab
                                 Else
                                 Begin
                                    sHistoricoDs := trim(sHistoricoDs) + '  ' +
                                       trim(dtmOperComum.QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString);
                                    If iTipoInvest = 1 Then // pega Lote da aplicação
                                       sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sLote)
                                    Else If iTipoInvest = 8 Then
                                       sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sHistContab)
                                    Else // pega Lote da operação
                                       sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sHistCapCar);
                                 End;

                                 //AL_83
                                 If Not (LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlanoDs, iSubContaDebDs, iSubContaCredDs,
                                                            iUnidNegocDs, iForCli, iPlanoPrev, iPatro,
                                                            sContaDebDs, sContaCredDs, sCentroCustoDebDs, sCentroCustoCredDs,
                                                            sHistoricoDs + ' - ' + TRIM(sPlanPrevHist), sTipoPerDs, sRecPagDs,
                                                            dDataOper, fVlrDespAbs, bMostraMsg, iPlanilhaOper, sMensErro)) Then
                                 Begin
                                    Result := -6; // não foi possível efetuar o lançamento contábil
                                    //AL_107
                                    Raise Exception.Create(sMensErro);
                                 End;
                              End;

                              // se é para ser feita contabilização e esta tiver sido efetuada com sucesso,
                              // ou se não é necessário contabilizar
                              If ((bLancaCAPCARDesp) And (sRecPagNaoDs <> 'N') And
                                 (bLancaFin)) Then
                              Begin
                                 If (((bContabDesp) And (Result = 0)) Or (Not (bContabDesp))) Then
                                 Begin
                                    // AL_23
                                    If (sRecPagBol = '') And ((iTipoOperacao = -35) Or (iTipoOperacao = -118)) Then
                                       sRecPagBol := sRecPagNaoDs;

                                    If iDocumentoOper = -1 Then
                                    Begin
                                       //AL_86
                                       If sRecPagBol = '' Then
                                          sRecPagBol := sRecPagNaoDs;
                                       If Trim(sTipoRecDesBol) = '' Then
                                          sTipoRecDesBol := sTipoRecDesDs;

                                       // AL_86 - Verificar por que gera outro CodDocumento aqui.
                                       If iDocumentoOper = -1 Then
                                       Begin
                                          // gera o identificador incremental da tabela DOCUMENTO
                                          If CtrlInvContab.Documento.GetDocSequence Then
                                             iDocumentoOper := CtrlInvContab.Documento.CodDocumento;
                                          CtrlInvContab.Documento.Prepare;
                                       End
                                       Else
                                          MsgDlg('Não é possível preparar outro documento', 'Mensagem do Sistem', mtWarning, [mbOk], 0);

                                       iPortador := -1;

                                       //AL_86 - Ini
                                       If CtrlInvContab.Documento.GetNoDocumento Then
                                          fNoDocumento := CtrlInvContab.Documento.NoDocumento
                                       Else
                                          fNoDocumento := 0;

                                       If sContaCredOp = '' Then
                                       Begin
                                          sContaCredOp := sContaCredDs;
                                          sContaDebOp := sContaDebDs;
                                       End;

                                       //Al_102
                                       If sRecPagBol[1] = 'P' Then
                                       Begin
                                          //AL_100
                                          If iTipoOperCPVD = -1 Then
                                             sContaDoc := sContaCredOp;
                                       End
                                       Else
                                       Begin
                                          //AL_100
                                          If iTipoOperCPVD = -1 Then
                                             sContaDoc := sContaDebOp;
                                       End;

                                       sPlano := IntToStr(iPlanoDs);

                                       //AL_20
                                       If iCodTipDoc <> 0 Then
                                          iTipoDocDs := iCodTipDoc;

                                       // Parametros para a Segregação
                                       CtrlInvContab.Plano := iPlanoDs;
                                       CtrlInvContab.Patro := iPatro;
                                       CtrlInvContab.PlanPrev := iPlanoPrev;
                                       // Cria o Documento
                                       If Not CtrlInvContab.Documento.SetValues(iDocumentoOper, fNoDocumento,
                                                                                sComplementoDs, sStatus, sRecPagBol[1], sOperacao,
                                                                                '' {sNumslip}, '' {sNumleitcodbarras}, sContaDoc, sCentroCustoCredDs,
                                                                                '' {sNossonumero}, '' {sNumdigcodbarras}, '' {sGrupodoc}, '' {sFlgemitelancbaix},
                                                                                '' {sFlgconfirmarecpag}, '' {sEmisbloq}, '' {sReferencia}, '' {sObs},
                                                                                dDataVenc {dDatavencto}, dDataOper {dDataemissao},
                                                                                dDataVenc {dDataprogramada}, 0 {dDataremessa}, 0 {dDatalimite}, 0 {dDatacorrecao},
                                                                                0 {rVlrmulta}, 0 {rValorjuros}, 0 {rValordesconto}, 0 {rPercjurossimples}, 0 {rPercjurosatuarial},
                                                                                iTipoDocDs, Sistema.idEmpresa, iModuloOrigem, iForCli, iNumFatura,
                                                                                0 {liIdcbancaria}, iUnidNegocDs, iPlanoDs, 0 {liNumcpbaixa}, 0 {liNumapgr},
                                                                                iMoeda, 0 {liLotetransmissao}, -1 {liIndicecorrecao},
                                                                                Sistema.idUsuario, Sistema.idEmpresa, 1 {liFlgnaoconciliado}, 0 {liControleremessa},
                                                                                iSubContaCredDs, iPortador,
                                                                                0 {liCodgrupocnab}, 0 {liCodgeradorinss}, -1 {liCodforma},
                                                                                dDataVenc {dDataDisp},
                                                                                CtrlInvContab.CriterioSegregacao {iIdSegregaCriter: integer = -1}) Then
                                          //AL_87
                                          Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

                                       //AL_8
                                       //AL_90
                                       CtrlInvContab.Documento.ContaInvest := iFlgContaInvest;

                                       //AL_86 - Fim
                                    End;

                                    If sRecPagBol <> sRecPagNaoDs Then
                                       fVlrDesp := -fVlrDesp;

                                    //AL_22 Ini
                                    If iCodTipDoc <> 0 Then // Vem da Boleta
                                    Begin
                                       fVlrDesp := Abs(fVlrDesp);
                                       If sRecPagBol = 'P' Then // Vem da Boleta
                                       Begin
                                          If sRecPagOp = 'P' Then // Vem do TipoOperacao
                                          Begin
                                             If sRecPagNaoDs = 'R' Then // Vem da PadrlancContinv
                                                fVlrDesp := fVlrDesp * -1;
                                          End
                                          Else If sRecPagOp = 'R' Then
                                          Begin
                                             If sRecPagNaoDs = 'R' Then
                                                fVlrDesp := fVlrDesp * -1;
                                          End;
                                       End
                                       Else If sRecPagBol = 'R' Then
                                       Begin
                                          If sRecPagOp = 'P' Then
                                          Begin
                                             If sRecPagNaoDs = 'P' Then
                                                fVlrDesp := fVlrDesp * -1;
                                          End
                                          Else If sRecPagOp = 'R' Then
                                          Begin
                                             If sRecPagNaoDs = 'P' Then
                                                fVlrDesp := fVlrDesp * -1;
                                          End;
                                       End;
                                    End;
                                    //AL_22 Fim

                                    If Trim(sTipoRecDesBol) = '' Then
                                       sTipoRecDesBol := sTipoRecDesDs;

                                    // AL_86 - Cria Rateio 3 camadas
                                    //AL_109
                                    If Not CtrlInvContab.Documento.RateioDocumSetValues(fVlrDesp, 0 {rValorOM}, 0 {rVlrresorcamen},
                                                                                        0 {liIdrateiodocum}, Sistema.idEmpresa {liIdpessoa},
                                                                                        0 {liCoddocumento  ???  Verificar ??? Segundo Alex, não precisa passar},
                                                                                        iUnidNegocDs, 0 {liMoecodigo}, Sistema.idUsuario, 0 {liIdreservaorcamen},
                                                                                        iPlanoDs {liPlano - ?? Não existia na versão anterior},
                                                                                        iPlanoPrev, iPatro,
                                                                                        CtrlPInv.IdPrograma, // dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger,
                                                                                        0 {liIdprocesso}, Sistema.idEmpresa,
                                                                                        sTipoRecDesBol, sRecPagBol[1], sCentroResponDs,
                                                                                        sCentroCustoCredDs, '' {sNumimovel}) Then
                                       //AL_87
                                       Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

                                    fVlrLiquido := fVlrLiquido + fVlrDesp;
                                 End;
                              End;
                           End;
                        End;
                        qryDespOper.Next;
                     End;

                     // Despesas cadastradas pelo Usuário
                     qryDespOper := dtmOperComum.qryDespesasOPeracao;
                     qryDespOper.Close;
                     If Not (qryDespOper.Prepared) Then qryDespOper.Prepare;
                     qryDespOper.ParamByName('IDOPERACAOINVEST').AsInteger := iOperacao;
                     qryDespOper.Open;

                     While Not qryDespOper.Eof Do
                     Begin
                        iTipoDespesa := qryDespOper.FieldByName('IDTIPODESPINVEST').AsInteger;
                        fVlrDesp := qryDespOper.FieldByName('VLRDESPOPER').AsFloat;

                        dtmOperComum.qryDespXTipoOper.Close;
                        If Not (dtmOperComum.qryDespXTipoOper.Prepared) Then dtmOperComum.qryDespXTipoOper.Prepare;
                        dtmOperComum.qryDespXTipoOper.ParamByName('TIPOINVEST').AsInteger := iTipoInvest;
                        dtmOperComum.qryDespXTipoOper.ParamByName('TIPOOERACAO').AsInteger := iTipoOperacao;
                        dtmOperComum.qryDespXTipoOper.ParamByName('TIPODESPESA').AsInteger := iTipoDespesa;
                        dtmOperComum.qryDespXTipoOper.Open;
                        iTipoDocDs := dtmOperComum.qryDespXTipoOper.FieldByName('CODTIPDOC').AsInteger;
                        If sContabiliza = 'N' Then
                           bContabDesp := False
                        Else
                           bContabDesp := dtmOperComum.qryDespXTipoOper.FieldByName('FLGGERACONTAB').AsInteger = 1;
                        bLancaCAPCARDesp := dtmOperComum.qryDespXTipoOper.FieldByName('FLGGERACAPCAR').AsInteger = 1;
                        sRecPagDs := dtmOperComum.qryDespXTipoOper.FieldByName('RECPAG').AsString;
                        dtmOperComum.qryDespXTipoOper.Close;

                        // só vai adiante se for necessário fazer algum tipo de lançamento (Contábil ou CAP/CAR)...

                        If ((bContabDesp) Or (bLancaCAPCARDesp)) Then
                        Begin
                           If fVlrDesp <> 0 Then
                           Begin
                              // verifica se já existe transação em andamento; se não houver, inicia uma
                              If Not (dtmBaseDados.dbBaseDados.InTransaction) Then
                              Begin
                                 bTransacao := True;
                                 StartTransacao;
                              End;

                              // @X Busca da PadrLancContInv p/ fazer os lançamentos ---------------------------------------------

                              // Verifica o Padrão de Lançamento mais adequado
                              //AL_86 - Ini
                              //AL_107
                              iAchouPadrao := CtrlInvContab.BuscaPadrLanc.Executa(RetornaSegmentacaoRV(iInvestimento), //Renan CGPC
                                                                                  dDataOper, iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento, iCarteira,
                                                                                  iPlanPrevPatr,
                                                                                  fVlrOper, sTipoTitulo, 'DOP');
                              iPlanoDs := CtrlInvContab.BuscaPadrLanc.Plano;
                              iSubContaDebDs := CtrlInvContab.BuscaPadrLanc.SubContaDeb;
                              iSubContaCredDs := CtrlInvContab.BuscaPadrLanc.SubContaCre;
                              iUnidNegocDs := CtrlInvContab.BuscaPadrLanc.UnidNegoc;
                              sContaDebDs := CtrlInvContab.BuscaPadrLanc.ContaDeb;
                              sContaCredDs := CtrlInvContab.BuscaPadrLanc.ContaCre;
                              sCentroCustoDebDs := CtrlInvContab.BuscaPadrLanc.CentroCustoDeb;
                              sCentroCustoCredDs := CtrlInvContab.BuscaPadrLanc.CentroCustoCred;
                              sCentroResponDs := CtrlInvContab.BuscaPadrLanc.CentroRespon;
                              sTipoRecDesDs := CtrlInvContab.BuscaPadrLanc.TipoRecDes;
                              sTipoPerDs := CtrlInvContab.BuscaPadrLanc.TipoPer;
                              sHistoricoDs := CtrlInvContab.BuscaPadrLanc.Historico;
                              sRecPagNaoDs := CtrlInvContab.BuscaPadrLanc.RecPagNao;
                              //AL_86 - Fim

                              bAchouDespesa := (iAchouPadrao = 0);

                              If Not bAchouDespesa Then
                              Begin
                                 iSubContaDebDs := iSubContaDebOp;
                                 iSubContaCredDs := iSubContaCredOp;
                                 iUnidNegocDs := iUnidNegocOp;
                                 //AL_20 Ini
                                 If iCodTipDoc <> 0 Then
                                    iTipoDocDs := iCodTipDoc
                                 Else
                                    iTipoDocDs := iTipoDocOp;
                                 //AL_20 Fim
                                 sContaCredDs := sContaCredOp;
                                 sContaDebDs := sContaDebOp;
                                 sCentroCustoCredDs := sCentroCustoCredOp;
                                 sCentroCustoDebDs := sCentroCustoDebOp;
                                 sCentroResponDs := sCentroResponOp;
                                 sRecPagNaoDs := sRecPagNaoOp;
                                 sTipoPerDs := sTipoPerOp;
                                 sRecPagDs := sRecPagOp;
                                 sTipoRecDesDs := sTipoRecDesOp;
                                 sComplementoDs := sComplementoOp;
                                 sTipoParcelaDs := sTipoParcelaOp;
                                 sHistoricoDs := 'Despesa de ' + sHistoricoOp;
                                 // se o valor da Despesa for negativo, inverte as contas
                                 If fVlrDesp < 0 Then
                                 Begin
                                    sContaAux := sContaDebDs;
                                    sContaDebDs := sContaCredDs;
                                    sContaCredDs := sContaAux;
                                 End;
                              End;

                              // Modula o valor da despesa
                              fVlrDespAbs := abs(fVlrDesp);

                              // @X Chamada às funções de integração Contábil e Financeira ---------------------------------------

                              If bContabDesp Then
                              Begin
                                 If iPlanilhaOper = -1 Then iPlanilhaOper := 0;

                                 sHistoricoDs := trim(sHistoricoDs) + '  ' +
                                    trim(dtmOperComum.QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString);
                                 If iTipoInvest = 1 Then // pega Lote da aplicação
                                    sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sLote)
                                 Else If iTipoInvest = 8 Then
                                    sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sHistContab)
                                 Else // pega Lote da operação
                                    sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sHistCapCar);

                                 //AL_83
                                 If Not (LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlanoDs, iSubContaDebDs, iSubContaCredDs,
                                                            iUnidNegocDs, iForCli, iPlanoPrev, iPatro,
                                                            sContaDebDs, sContaCredDs, sCentroCustoDebDs, sCentroCustoCredDs,
                                                            sHistoricoDs + ' - ' + TRIM(sPlanPrevHist), sTipoPerDs, sRecPagDs,
                                                            dDataOper, fVlrDespAbs, bMostraMsg, iPlanilhaOper, sMensErro)) Then
                                 Begin
                                    Result := -6; // não foi possível efetuar o lançamento contábil
                                    //AL_107
                                    Raise Exception.Create(sMensErro);
                                 End;
                              End;

                              // se é para ser feita contabilização e esta tiver sido efetuada com sucesso,
                              // ou se não é necessário contabilizar
                              If ((bLancaCAPCARDesp) And (sRecPagNaoDs <> 'N') And
                                 (bLancaFin)) Then
                              Begin
                                 If (((bContabDesp) And (Result = 0)) Or (Not (bContabDesp))) Then
                                 Begin
                                    If iDocumentoOper = -1 Then
                                    Begin
                                       If sRecPagBol = '' Then
                                          sRecPagBol := sRecPagNaoDs;

                                       If Trim(sTipoRecDesBol) = '' Then
                                          sTipoRecDesBol := sTipoRecDesDs;

                                       //AL_86 - Ini
                                       If iDocumentoOper = -1 Then
                                       Begin
                                          If CtrlInvContab.Documento.GetDocSequence Then
                                             iDocumentoOper := CtrlInvContab.Documento.CodDocumento;

                                          CtrlInvContab.Documento.Prepare;
                                       End
                                       Else
                                          //AL_107
                                          Raise Exception.Create('Não é possível preparar outro documento');

                                       iPortador := -1;

                                       If CtrlInvContab.Documento.GetNoDocumento Then
                                          fNoDocumento := CtrlInvContab.Documento.NoDocumento
                                       Else
                                          fNoDocumento := 0;

                                       If sContaCredOp = '' Then
                                       Begin
                                          sContaCredOp := sContaCredDs;
                                          sContaDebOp := sContaDebDs;
                                       End;

                                       //Al_102
                                       If sRecPagBol[1] = 'P' Then
                                       Begin
                                          //AL_100
                                          If iTipoOperCPVD = -1 Then
                                             sContaDoc := sContaCredOp;
                                       End
                                       Else
                                       Begin
                                          //AL_100
                                          If iTipoOperCPVD = -1 Then
                                             sContaDoc := sContaDebOp;
                                       End;

                                       sPlano := IntToStr(iPlanoDs);

                                       //AL_20 Ini
                                       If iCodTipDoc <> 0 Then
                                          iTipoDocDs := iCodTipDoc;
                                       //AL_20 Fim

                                       // Parametros para a Segregação
                                       CtrlInvContab.Plano := iPlanoDs;
                                       CtrlInvContab.Patro := iPatro;
                                       CtrlInvContab.PlanPrev := iPlanoPrev;

                                       // Cria o Documento em 3 camadas
                                       If Not CtrlInvContab.Documento.SetValues(iDocumentoOper, fNoDocumento,
                                                                                sComplementoDs, sStatus, sRecPagBol[1], sOperacao,
                                                                                '' {sNumslip}, '' {sNumleitcodbarras}, sContaDoc, sCentroCustoCredDs,
                                                                                '' {sNossonumero}, '' {sNumdigcodbarras}, '' {sGrupodoc}, '' {sFlgemitelancbaix},
                                                                                '' {sFlgconfirmarecpag}, '' {sEmisbloq}, '' {sReferencia}, '' {sObs},
                                                                                dDataVenc {dDatavencto}, dDataOper {dDataemissao},
                                                                                dDataVenc {dDataprogramada}, 0 {dDataremessa}, 0 {dDatalimite}, 0 {dDatacorrecao},
                                                                                0 {rVlrmulta}, 0 {rValorjuros}, 0 {rValordesconto}, 0 {rPercjurossimples}, 0 {rPercjurosatuarial},
                                                                                iTipoDocDs, Sistema.idEmpresa, iModuloOrigem, iForCli, iNumFatura,
                                                                                0 {liIdcbancaria}, iUnidNegocDs, iPlanoDs, 0 {liNumcpbaixa}, 0 {liNumapgr},
                                                                                iMoeda, 0 {liLotetransmissao}, -1 {liIndicecorrecao},
                                                                                Sistema.idUsuario, Sistema.idEmpresa, 1 {liFlgnaoconciliado}, 0 {liControleremessa},
                                                                                iSubContaCredDs, iPortador,
                                                                                0 {liCodgrupocnab}, 0 {liCodgeradorinss}, -1 {liCodforma},
                                                                                dDataVenc {dDataDisp},
                                                                                CtrlInvContab.CriterioSegregacao {iIdSegregaCriter: integer = -1}) Then
                                          //AL_87
                                          Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
                                       //AL_86 - Ini
                                    End;

                                    // AL_19 - 11/02/2005
                                    fVlrDesp := Abs(fVlrDesp);
                                    // Fim

                                    If sRecPagBol <> sRecPagNaoDs Then
                                       fVlrDesp := -fVlrDesp;

                                    //AL_22 Ini
                                    If iCodTipDoc <> 0 Then // Vem da Boleta
                                    Begin
                                       fVlrDesp := Abs(fVlrDesp);
                                       If sRecPagBol = 'P' Then // Vem da Boleta
                                       Begin
                                          If sRecPagOp = 'P' Then // Vem da TipoOperacao
                                          Begin
                                             If sRecPagNaoDs = 'R' Then // Vem da PadrLancContInv
                                                fVlrDesp := fVlrDesp * -1;
                                          End
                                          Else If sRecPagOp = 'R' Then
                                          Begin
                                             If sRecPagNaoDs = 'R' Then
                                                fVlrDesp := fVlrDesp * -1;
                                          End;
                                       End
                                       Else If sRecPagBol = 'R' Then
                                       Begin
                                          If sRecPagOp = 'P' Then
                                          Begin
                                             If sRecPagNaoDs = 'P' Then
                                                fVlrDesp := fVlrDesp * -1;
                                          End
                                          Else If sRecPagOp = 'R' Then
                                          Begin
                                             If sRecPagNaoDs = 'P' Then
                                                fVlrDesp := fVlrDesp * -1;
                                          End;
                                       End;
                                    End;
                                    //AL_22 Fim

                                    // AL_86 - Cria Rateio 3 camadas
                                    //AL_109
                                    If Not CtrlInvContab.Documento.RateioDocumSetValues(fVlrDesp, 0 {rValorOM}, 0 {rVlrresorcamen},
                                                                                        0 {liIdrateiodocum}, Sistema.idEmpresa {liIdpessoa},
                                                                                        0 {liCoddocumento  ???  Verificar ??? Segundo Alex, não precisa passar},
                                                                                        iUnidNegocDs, 0 {liMoecodigo}, Sistema.idUsuario, 0 {liIdreservaorcamen},
                                                                                        iPlanoDs {liPlano - ?? Não existia na versão anterior},
                                                                                        iPlanoPrev, iPatro,
                                                                                        CtrlPInv.IdPrograma, //dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger,
                                                                                        0 {liIdprocesso}, Sistema.idEmpresa,
                                                                                        sTipoRecDesBol, sRecPagBol[1], sCentroResponDs,
                                                                                        sCentroCustoCredDs, '' {sNumimovel}) Then
                                       //AL_87
                                       Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

                                    fVlrLiquido := fVlrLiquido + fVlrDesp;
                                 End;
                              End;
                           End;
                        End;
                        qryDespOper.Next;
                     End;
                     qryDespOper.Close;
                  End;
               End;

               //Ricardo Cristiano - 15/01/2010 - N. Sol 115288 / 682 -  N. Kintana 712646
               If ((Result = 0) And (fVlrLiquido <> 0) And (bLancaFin) And (iDocumentoOper <> 0)) Then
               begin
                  //Paulo Nobre - 09/04/2010 - N. Sol 115288 / 682 -  N. Kintana 712646
                  If sRecPagOp = 'P' Then // Vem da TipoOperacao
                  Begin
                     // Buscando Operaçao principal do PAGAR
                     iAchouPadrao := CtrlInvContab.BuscaPadrLanc.Executa(RetornaSegmentacaoRV(iInvestimento),
                                                                         dDataOper, iTipoInvest, iTipoOperacao, 0, iInvestimento, 0, iPlanPrevPatr, fVlrOper, sTipoTitulo, 'OPE');

                     sContaDoc := CtrlInvContab.BuscaPadrLanc.ContaCre;
                  End
                  Else
                  Begin
                     // Buscando Operaçao principal do RECEBER                        
                     iAchouPadrao := CtrlInvContab.BuscaPadrLanc.Executa(RetornaSegmentacaoRV(iInvestimento),
                                                                         dDataOper, iTipoInvest, iTipoOperacao, -1, iInvestimento, iCarteira, iPlanPrevPatr, fVlrOper, sTipoTitulo, 'DOP');

                     sContaDoc := CtrlInvContab.BuscaPadrLanc.ContaDeb;
                  End;
                  // Paulo

                  //Ricardo Cristiano - 08/04/2010 - N. Sol 115288 / 682 -  N. Kintana 712646
                  if iPlano <= 0 Then
                     iPlano := iPlanoDs;

                  iUnidNegocOp := CtrlInvContab.BuscaPadrLanc.UnidNegoc; //Adilson Filho SOL: 139979 Kintana: 879638

                  //Ricardo Cristiano - 17/08/2010 - N. Sol 142141 -  N. Kintana 903471
                  if ((iPlanoDs > 0) and (iPlano <> iPlanoDs)) then
                     iPlano := iPlanoDs;

                  if (not (QueryCCBaixa = nil)) then
                  begin
                     if QueryCCBaixa.Locate('PLANO;IDPATRO;IDPLANOPREV;PLACONTA;CODDOCUMENTO;IDSEGREGACRITER',
                              VarArrayOf([iPlano, iPatro, iPlanoPrev, sContaDoc, iDocumentoOper, CtrlInvContab.CriterioSegregacao]), [loPartialKey]) then
                     begin
                        QueryCCBaixa.Edit;
                        QueryCCBaixa.FieldByName('VALOR').AsFloat := QueryCCBaixa.FieldByName('VALOR').AsFloat + fVlrLiquido;
                        QueryCCBaixa.Post;
                     end
                     else
                     begin
                        QueryCCBaixa.Insert;
                        QueryCCBaixa.FieldByName('PLANO').AsInteger := iPlano;
                        QueryCCBaixa.FieldByName('IDPATRO').AsInteger := iPatro;
                        QueryCCBaixa.FieldByName('IDPLANOPREV').AsInteger := iPlanoPrev;
                        QueryCCBaixa.FieldByName('PLACONTA').AsString := sContaDoc;
                        QueryCCBaixa.FieldByName('CODDOCUMENTO').AsInteger := iDocumentoOper;
                        QueryCCBaixa.FieldByName('IDSEGREGACRITER').AsInteger := CtrlInvContab.CriterioSegregacao;
                        QueryCCBaixa.FieldByName('UNIDNEGOC').AsInteger := iUnidNegocOp;
                        QueryCCBaixa.FieldByName('VALOR').AsFloat := fVlrLiquido;
                        QueryCCBaixa.Post;
                     end;

                     if ((bCriaLancto) and (not QueryCCBaixa.IsEmpty)) then
                     begin
                        QueryCCBaixa.First;
                        while not QueryCCBaixa.eof do
                        begin
                           If Not CtrlInvContab.Documento.CCBAIXASXDOCUMSetValues(QueryCCBaixa.FieldByName('VALOR').AsFloat, 0,
                                                                                  Sistema.idEmpresa,
                                                                                  QueryCCBaixa.FieldByName('CODDOCUMENTO').AsInteger,
                                                                                  QueryCCBaixa.FieldByName('UNIDNEGOC').AsInteger,
                                                                                  QueryCCBaixa.FieldByName('PLANO').AsInteger,
                                                                                  QueryCCBaixa.FieldByName('IDPLANOPREV').AsInteger,
                                                                                  QueryCCBaixa.FieldByName('IDPATRO').AsInteger,
                                                                                  QueryCCBaixa.FieldByName('IDSEGREGACRITER').AsInteger,
                                                                                  QueryCCBaixa.FieldByName('PLACONTA').AsString) then
                              Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
                           QueryCCBaixa.next;
                        end;
                     end;
                  end;
               end;

               If ((iDocumentoOper <> -1) And ((fVlrLiquido <> 0) Or (fTotalLiquido <> 0))) Then
               Begin
                  sDebCre := OperComum.IIF(sRecPagBol[1] = 'P', 'C', 'D');
                  If bCriaLancto Then
                  Begin
                     If fTotalLiquido <> 0 Then
                        fVlrLancto := fTotalLiquido
                     Else
                        fVlrLancto := fVlrLiquido;
                     //AL_86 - Ini
                     If bLancaFin Then
                     Begin
                        If iTipoInvest = 2 Then // Renda Variável
                        Begin
                           // AL_14 - 20/01/2005
                           // Cria LanctoDocum em 3 camadas
                           If Not CtrlInvContab.Documento.LancoDocumSetValues(dDataOper, iDocumentoOper, 0 {iNumLancamento},
                                                                              fVlrLancto, 0 {rValorOM}, fVlrLancto,
                                                                              iUnidNegocOp, CtrlInvContab.Planilha, 0 {liNumlotemanual},
                                                                              Sistema.idUsuario, Sistema.idEmpresa,
                                                                              0 {liIdnflivro}, 0 {liEstorno}, iTipoDocOp, 0 {liCoddocinss}, 0 {liCodalterador},
                                                                              sOperacao, '' {sNumrecibo}, '' {sNumnf}, '' {sNumfatura},
                                                                              //AL_107 - Inclui a descrição contabil
                                                                              sHistCapCar + ' / ' + sHistoricoOp, '' {sFlgtipofatura}, '' {sFlgrecebeunf}, '' {sFlgfatemitida},
                                                                              sDebcre, Sistema.IdModulo, iPlano,
                                                                              Sistema.UsaPlanoPatro) Then
                              //AL_87
                              Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
                        End
                        Else
                        Begin
                           If (iTipoOperacao = -10) Or (iTipoOperacao = -11) Then // Ajuste de BM&F
                              fVlrOper := fTotalLiquido;
                           // Cria LanctoDocum em 3 camadas
                           If Not CtrlInvContab.Documento.LancoDocumSetValues(dDataOper, iDocumentoOper, 0 {iNumLancamento},
                                                                              fVlrOper, 0 {rValorOM}, fVlrOper,
                                                                              iUnidNegocDs, CtrlInvContab.Planilha, 0 {liNumlotemanual},
                                                                              Sistema.idUsuario, Sistema.idEmpresa,
                                                                              0 {liIdnflivro}, 0 {liEstorno}, iTipoDocDs, 0 {liCoddocinss}, 0 {liCodalterador},
                                                                              sOperacao, '' {sNumrecibo}, '' {sNumnf}, '' {sNumfatura},
                                                                              //AL_107 - Inclui a descrição contabil
                                                                              sHistCapCar + ' / ' + sHistoricoOp, '' {sFlgtipofatura}, '' {sFlgrecebeunf}, '' {sFlgfatemitida},
                                                                              sDebcre, Sistema.IdModulo, iPlanoDs,
                                                                              Sistema.UsaPlanoPatro) Then
                              //AL_87
                              Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
                        End;
                        //Ricardo Cristiano - 01/10/2008 - N. Sol 97195 -  N. Kintana 421956
                        //Ricardo Cristiano - 26/09/2008 - N. Sol 96981 -  N. Kintana 420918
                        // Finaliza o Documento e gera o CodDocumento
                        If Not CtrlInvContab.Documento.Insert Then
                           //AL_87
                           Raise Exception.Create(CtrlInvContab.Documento.MessageInfo)
                        Else
                        Begin
                           iDocumentoOper := CtrlInvContab.Documento.CodDocumento;
                           bCriaLancto := false;
                        End;
                        //AL_86 - Fim
                     End;
                  End;
               End;
               //AL_97
               iPlano := CtrlInvContab.BuscaPadrLanc.Plano;

               If ((iTipoOperacao = -7) Or (iTipoOperacao = -8)) And
                   (Result = 0) And (iPlanilhaOper <> -1) Then // Atualização IR Litigio
                  If iPlano = -1 Then
                     iPlano := iPlanoDs;

               // Atualiza Plano, Planilha e Documento no HistCartInv
               If ((iIdHistCartInv <> 0) And (Result = 0) And
                  ((iPlanilhaOper <> -1) Or (iDocumentoOper <> -1))) And
                  (iTipoInvest <> 8) Then
               Begin
                  If iPlano = -1 Then
                     iPlano := iPlanoDs;
                  // No novo Renda Variável o Documento e a Planilha das Operações ficam na Boleta
                  If bGravaDoc Then
                  Begin
                     dtmOperComum.qryLocal.Close;
                     dtmOperComum.qryLocal.SQL.Clear;
                     dtmOperComum.qryLocal.SQL.Add(' UPDATE HISTCARTINV SET ');

                     If ((iPlanilhaOper <> -1) And (iPlanilhaOper <> 0)) Then
                     Begin
                        dtmOperComum.qryLocal.SQL.Add(' HISTCARTINV.PLANO     = ' + QuotedStr(IntToStr(iPlano)) + ', ');
                        dtmOperComum.qryLocal.SQL.Add(' HISTCARTINV.PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilhaOper)) + ', ');
                     End
                     Else
                     Begin
                        dtmOperComum.qryLocal.SQL.Add(' HISTCARTINV.PLANO     = '''' ,');
                        dtmOperComum.qryLocal.SQL.Add(' HISTCARTINV.PLNCODIGO = '''' ,');
                     End;

                     If iDocumentoOper <> -1 Then
                        dtmOperComum.qryLocal.SQL.Add(' HISTCARTINV.CODDOCUMENTO = ' + QuotedStr(IntToStr(iDocumentoOper)))
                     Else
                        dtmOperComum.qryLocal.SQL.Add(' HISTCARTINV.CODDOCUMENTO = '''' ');

                     If (iOperacao <> -1) And (iOperacao <> 0) Then //Atualiza por tipo de operação
                        dtmOperComum.qryLocal.SQL.Add(' WHERE (HISTCARTINV.IDOPERACAOINVEST = ' + QuotedStr(IntToStr(iOperacao)) + ')')
                     Else
                        dtmOperComum.qryLocal.SQL.Add(' WHERE (HISTCARTINV.IDHISTCARTINV = ' + QuotedStr(IntToStr(iIdHistCartInv)) + ')');
                     dtmOperComum.qryLocal.Prepare;
                     dtmOperComum.qryLocal.ExecSQL;
                     dtmOperComum.qryLocal.UnPrepare;
                     dtmOperComum.qryLocal.Close;
                  End;
               End;

               // Tudo havendo corrido bem...
               If Result = 0 Then
               Begin
                  If ((bTransacao) And (dtmBaseDados.dbBaseDados.InTransaction)) Then
                     CommitTransacao;
               End;
            End;

         If (Result = 0) And (bLancaCAPCAROper) And (fVlrLiquido = 0) And (bLancaFin) Then
         Begin
            Result := -7; // Não foi possível efetuar o lançamento de CAP/CAR.
            //AL_107
            Raise Exception.Create('Não foi efetuado nenhum lançamento financeiro');
         End;
      Except
         If bTransacao Then
            RollBackTransacao;
         Screen.Cursor := crDefault;
         Result := -3;
         If bMostraMsg Then
            Raise;
      End;
   Finally
      Screen.Cursor := crDefault;
      //AL_86
      dtmOperComum.qryInvestimento.Close;
      dtmOperComum.qryCarteira.Close;
      dtmOperComum.qryTipoOperacao.Close;
      dtmOperComum.qryDespNegXTipoOper.Close;
      dtmOperComum.qryDespesasOPeracao.Close;
      dtmOperComum.qryDespXTipoOper.Close;
      if qryDespOper <> nil then
         qryDespOper.Close;
   End;
End;

//--------------------------------------------------------------------------------------------------
//    LancamentoContabil:  Função que efetua cada par de lançamentos contábeis
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iEmpresaProp      :  id da Empresa Proprietária                      (Sistema.idEmpresa)
//       iModuloOrigem     :  id do Módulo que vai gerar o lançamento         (Sistema.idModulo)
//       iPlano            :  plano de contas da empresa em questão           (IntegraBack.Plano)
//       iSubContaD        :  sub-conta para débito
//       iSubContaC        :  sub-conta para crédito
//       iUnidNegoc        :  atividade/projeto (unidade de negócio) para crédito
//       iForCli           :  id do Fornecedor ou Cliente (para buscar SubConta)
//       sContaContabilD   :  conta contábil para débito
//       sContaContabilC   :  conta contábil para crédito
//       sCentroCustoD     :  centro de custo para débito
//       sCentroCustoC     :  centro de custo para crédito
//       sTipoPer          :  Tipo de Operação (TIPCODIGO, tabela TIPOPER)
//       sRecPag           :  indica se é a Operação/Despesa é a Pagar (Fornecedor) ou Receber (Cliente)
//       dDataLanc         :  data do lançamento
//       fValorLanc        :  valor do lançamento
//       bMostraMsg        :  True  - mostra mensagens
//                            False - não mostra mensagens
//
//    A função retorna também
//       iPlanilha         :  planilha onde foram efetuados os lançamentos contábeis
//       sMensContab       :  mensagem de erro devolvida pela LancaContab
//
//--------------------------------------------------------------------------------------------------

Function TOperComum.LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaD, iSubContaC,
   iUnidNegoc, iForCli, iPlanoPrev, iPatro: integer; sContaD, sContaC, sCentroCustoD, sCentroCustoC, sHistorico, sTipoPer,
   sRecPag: String; dDataLanc: TDateTime; fValorLanc: currency; bMostraMsg: boolean; Var iPlanilha: integer;
   Var sMensContab: String; iUsuarioOrigem: Integer = -1): boolean;
Var
   sHist1, sHist2, sHist3, sHist4, sHist5, sMascaraPlano: String;
   sModulo, sUnidNegoc, sObrigaCC, sNome, sSubContaD, sSubContaC, sDataLanc, sNoDoc: String;
   // A_36
   bPermiteSubConta: boolean;
   liExercicio, liPeriodo: integer;
   sParametros: String;

Begin
  { sParametros := 'iPlano = ' + IntToStr(iPlano) + chr(13) +
      'sContaD = ' + sContaD + chr(13) +
      'sContaC = ' + sContaC + chr(13) +
      'sHistorico = ' + sHistorico + chr(13) +
      'dDataLanc  = ' + DateToStr(dDataLanc) + chr(13) +
      'fValorLanc = ' + FloatToStr(fValorLanc) + chr(13) +
      'sTipoPer   = ' + sTipoPer;

   showmessage(sParametros);
   }
   // Lança com o usuario que Originou a operação - Renda Fixa - 13/12/2002
   If iUsuarioOrigem = -1 Then
      iUsuarioOrigem := Sistema.IdUsuario;

   Result := False;
   Screen.Cursor := crHourGlass;

   // AL_86
   sDataLanc := DateToStr(dDataLanc);
   sModulo := IntToStr(iModuloOrigem);

   // AL_36
   // testa o período junto à Contabilidade
   //AL_79
   If CtrlInvContab.TestaPeriodo(sDataLanc, iTipoInvestUsu) Then
   Begin
      sMascaraPlano := GetMascaraPlano(iPlano);

      sNoDoc := ''; // não há previsão...

      // divide o histórico em sub-históricos se exceder a quantidade de caracteres
      FuncaoGeral.ArrumaHistorico(sHistorico, sHist1, sHist2, sHist3, sHist4, sHist5);

      //Al_37 - 31/05/2005
      Try
         // verifica se é obrigatório o preenchimento dos centros de custo; se não for, os passa em branco
         FuncaoGeral.TestaContaCC(False, iPlano, sContaD, sObrigaCC, sNome, sSubContaD);
         If sObrigaCC <> 'S' Then sCentroCustoD := '';
         FuncaoGeral.TestaContaCC(False, iPlano, sContaC, sObrigaCC, sNome, sSubContaC);
         If sObrigaCC <> 'S' Then sCentroCustoC := '';
      Except
         On E: Exception Do
         Begin
            sMensContab := E.Message;
            Result := False;
            Exit;
         End;
      End;
      //Al_37 - Fim

      // verifica se deve passar a SubConta e decide qual
      dtmOperComum.qryVerificaConta.Close;
      If Not (dtmOperComum.qryVerificaConta.Prepared) Then dtmOperComum.qryVerificaConta.Prepare;
      dtmOperComum.qryVerificaConta.ParamByName('PLANO').AsInteger := iPlano;
      dtmOperComum.qryVerificaConta.ParamByName('CONTA').AsString := Espaco(sContaD, 18);
      dtmOperComum.qryVerificaConta.Open;
      bPermiteSubConta := dtmOperComum.qryVerificaConta.FieldByName('PLASUBCONTA').AsString = 'S';
      dtmOperComum.qryVerificaConta.Close;

      If bPermiteSubConta Then
      Begin
         If iSubContaD > 0 Then
         Begin
            sSubContaD := IntToStr(iSubContaD);
         End
         Else
         Begin
            Case sRecPag[1] Of
               'P':
                  begin
                    dtmOperComum.qryBuscaForn.Close;
                    If Not (dtmOperComum.qryBuscaForn.Prepared) Then dtmOperComum.qryBuscaForn.Prepare;
                    dtmOperComum.qryBuscaForn.ParamByName('EMPRESAFORN').AsInteger := iEmpresaProp;
                    dtmOperComum.qryBuscaForn.ParamByName('FORCLI').AsInteger := iForCli;
                    dtmOperComum.qryBuscaForn.ParamByName('PLANO').AsInteger := iPlano;
                    dtmOperComum.qryBuscaForn.Open;
                    If Not (dtmOperComum.qryBuscaForn.FieldByName('CODSUBCONTA').isNULL) Then
                       sSubContaD := IntToStr(dtmOperComum.qryBuscaForn.FieldByName('CODSUBCONTA').AsInteger);
                    dtmOperComum.qryBuscaForn.Close;
                  end;
               'R':
                  begin
                     dtmOperComum.qryBuscaCli.Close;
                     If Not (dtmOperComum.qryBuscaCli.Prepared) Then dtmOperComum.qryBuscaCli.Prepare;
                     dtmOperComum.qryBuscaCli.ParamByName('EMPRESAFORN').AsInteger := iEmpresaProp;
                     dtmOperComum.qryBuscaCli.ParamByName('FORCLI').AsInteger := iForCli;
                     dtmOperComum.qryBuscaCli.ParamByName('PLANO').AsInteger := iPlano;
                     dtmOperComum.qryBuscaCli.Open;
                     If Not (dtmOperComum.qryBuscaCli.FieldByName('CODSUBCONTA').isNULL) Then
                        sSubContaD := IntToStr(dtmOperComum.qryBuscaCli.FieldByName('CODSUBCONTA').AsInteger);
                     dtmOperComum.qryBuscaCli.Close;
                  end;
            End;
         End;
      End
      Else
      Begin
         sSubContaD := '';
      End;

      dtmOperComum.qryVerificaConta.Close;
      If Not (dtmOperComum.qryVerificaConta.Prepared) Then dtmOperComum.qryVerificaConta.Prepare;
      dtmOperComum.qryVerificaConta.ParamByName('PLANO').AsInteger := iPlano;
      dtmOperComum.qryVerificaConta.ParamByName('CONTA').AsString := sContaC;
      dtmOperComum.qryVerificaConta.Open;
      bPermiteSubConta := dtmOperComum.qryVerificaConta.FieldByName('PLASUBCONTA').AsString = 'S';
      dtmOperComum.qryVerificaConta.Close;

      If bPermiteSubConta Then
      Begin
         If iSubContaC > 0 Then
         Begin
            sSubContaC := IntToStr(iSubContaC);
         End
         Else
         Begin
            Case sRecPag[1] Of
               'P':
                  begin
                     dtmOperComum.qryBuscaForn.Close;
                     If Not (dtmOperComum.qryBuscaForn.Prepared) Then dtmOperComum.qryBuscaForn.Prepare;
                     dtmOperComum.qryBuscaForn.ParamByName('EMPRESAFORN').AsInteger := iEmpresaProp;
                     dtmOperComum.qryBuscaForn.ParamByName('FORCLI').AsInteger := iForCli;
                     dtmOperComum.qryBuscaForn.ParamByName('PLANO').AsInteger := iPlano;
                     dtmOperComum.qryBuscaForn.Open;
                     If Not (dtmOperComum.qryBuscaForn.FieldByName('CODSUBCONTA').isNULL) Then
                        sSubContaC := IntToStr(dtmOperComum.qryBuscaForn.FieldByName('CODSUBCONTA').AsInteger);
                     dtmOperComum.qryBuscaForn.Close;
                  end;
               'R':
                  begin
                     dtmOperComum.qryBuscaCli.Close;
                     If Not (dtmOperComum.qryBuscaCli.Prepared) Then dtmOperComum.qryBuscaCli.Prepare;
                     dtmOperComum.qryBuscaCli.ParamByName('EMPRESAFORN').AsInteger := iEmpresaProp;
                     dtmOperComum.qryBuscaCli.ParamByName('FORCLI').AsInteger := iForCli;
                     dtmOperComum.qryBuscaCli.ParamByName('PLANO').AsInteger := iPlano;
                     dtmOperComum.qryBuscaCli.Open;
                     If Not (dtmOperComum.qryBuscaCli.FieldByName('CODSUBCONTA').isNULL) Then
                        sSubContaC := IntToStr(dtmOperComum.qryBuscaCli.FieldByName('CODSUBCONTA').AsInteger);
                     dtmOperComum.qryBuscaCli.Close;
                  end;
            End;
         End;
      End
      Else
      Begin
         sSubContaC := '';
      End;

      Screen.Cursor := crHourGlass;

      {@A Verificar as variáveis de referência - liExercicio, liPeriodo}

         // AL_36 - Carrega as variaveis de periodo e exercicio
      CtrlInvContab.BuscaPeriodo(sDataLanc, liPeriodo, liExercicio);

      If sSubContaD = '' Then
         iSubContaD := 0
      Else
         iSubContaD := StrToInt(sSubContaC);
      If sSubContaC = '' Then
         iSubContaC := 0
      Else
         iSubContaC := StrToInt(sSubContaC);

      // AL_85 - O Centro de custo lançado a Débito e a Crédito são o mesmo, agora parametrizados no financeiro
      If Not CtrlInvContab.InvLancaContabil(iPlano, iUnidNegoc, iSubContaD, iSubContaC, iPlanoPrev, iPatro, iPlanilha,
                                            0, sDataLanc, sNoDoc, sHist1, sHist2, sHist3, sHist4, sHist5, sTipoPer,
                                            sCentroCustoD, sContaD, sCentroCustoC, sContaC, '', fValorLanc,
                                            False, Sistema.UsaPlanoPatro, iModuloOrigem, iUsuarioOrigem, iEmpresaProp,
                                            sRecPag, CtrlInvContab.CriterioSegregacao, CtrlInvContab.DataCriterioSegrega) Then
         Raise Exception.Create(CtrlInvContab.MessageInfo);
      iPlanilha := CtrlInvContab.Planilha;

      If iPlanilha <= 0 Then
      Begin
         Screen.Cursor := crDefault;
         If bMostraMsg Then
            MensagemErroContab(iPlanilha);
      End
      Else
      Begin
         Result := True;
      End;
   End
   Else
   Begin
      Screen.Cursor := crDefault;
      // AL_36
      If bMostraMsg Then
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtInformation, [mbOk], 0);
   End;

   Screen.Cursor := crDefault;
End;

//--------------------------------------------------------------------------------------------------
//    Função com o processo de estorno de uma determinada Operação(Finceiro/Tesouraria/Contabilidade)
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//
//       iOperacao      :  id da Operação de Investimento   (idOperacaoInvest)
//       dDataEstorno   :  data do estorno
//
//--------------------------------------------------------------------------------------------------

Function TOperComum.ProcEstorna(iDocumento, iPlanilha, iPlano: longint; dDataEstorno: TDateTime;
   bMostraMsg: boolean): Boolean;
Var bTransacao: boolean;
Begin
   //AL_86 - Ini
   Result := True;
   Try
      Try
         // verifica se já existe transação em andamento; se não houver, inicia uma
         If Not (dtmBaseDados.dbBaseDados.inTransaction) Then
            Begin
               bTransacao := True;
               StartTransacao;
            End
         Else
            Begin
               bTransacao := False;
            End;

         // existindo documento, estorna tudo por aí...
         If iDocumento <> -1 Then
            Begin
               // Faz o Estorno no CAP/CAR e Contab
               CtrlInvContab.Documento.Estornar(dDataEstorno, Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                  iDocumento, 0, iPlano, Sistema.UsaPlanoPatro);
            End
         Else
            Begin
               // senão, estorna só na contabilidade
               If iPlanilha <> -1 Then
                  Begin
                     // AL_36
                     // verifica se o estorno pode ser realizado
                     //AL_79
                     If CtrlInvContab.TestaPeriodo(DateToStr(dDataEstorno), iTipoInvestUsu) Then
                        Begin
                           // Faz o estorno contábil em 3 camadas
                           If Not CtrlInvContab.InvEstornaLanc(iPlanilha, dDataEstorno) Then
                              Result := False;
                        End
                     Else
                        Begin
                           MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtError, [mbOk], 0);
                           Result := False;
                        End;
                  End;
            End;
      Except
         Screen.Cursor := crDefault;
         Result := False;
         If bMostraMsg Then Raise;
      End;
   Finally
      If ((bTransacao) And (dtmBaseDados.dbBaseDados.InTransaction)) Then
         Begin
            If Result Then
               CommitTransacao
            Else
               RollBackTransacao;
         End;
   End;
   //AL_86 - Fim
End;

//--------------------------------------------------------------------------------------------------
//    Função com o processo de exclui os lançamentos de uma determinada Operação (Finceiro/Tesoura-
//          ria/Contabilidade)
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//
//--------------------------------------------------------------------------------------------------
// AL_13

Function TOperComum.ProcExclui(iDocumento, iPlanilha, iPlano, iTipoInvest: longint;
   dDataExclusao: TDateTime;
   bMostraMsg: Boolean = True; bComita: Boolean = True): Boolean;
Var
   sDataEstorno, sMensErro, sMascara: String;
   // AL_36                  //AL_91
   bTransacao, bErroInterno, bIntegra: boolean;

Begin
   Result := True;
   bTransacao := False; // Indica se foi aberta uma transação local
   bErroInterno := True; // Indica se o erro aconteceu nas exclusões dos históricos ou nos lançamentos

   //AL_91
   If iTipoInvestUsu = 8 Then
      //AL_109
      bIntegra := CtrlPInv.IntFinContabBMF = 'S'
   Else If iTipoInvestUsu = 2 Then
      bIntegra := CtrlPInv.IntFinContabRV = 'S';

   Try
      //AL_34
      If (iDocumento <= 0) And (iPlanilha <= 0) Then
         Exit;
      sDataEstorno := FormatDateTime('dd/mm/yyyy', dDataExclusao);

      // verifica se o estorno pode ser realizado
      //AL_36
      //AL_79
      If Not CtrlInvContab.TestaPeriodo(sDataEstorno, iTipoInvestUsu) Then
         Begin
            MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtInformation, [mbOk], 0);
            Result := False;
            Exit;
         End
      Else
         Begin
            // Se não passar o parametro, o valor é True
            If bComita Then
               Begin
                  If Not (dtmBaseDados.dbBaseDados.InTransaction) Then
                     Begin
                        DtmBaseDados.dbBaseDados.StartTransaction;
                        bTransacao := True;
                     End;
               End;

            With dtmOperComum, DMRendaVariavel Do Begin
                  // HistCartinv - Limpa Planilha e Documento
                  If iPlanilha > 0 Then
                     Begin
                        LimpaParametros(QryHistCartInv);
                        QryHistCartInv.ParamByName('PLNCODIGO').AsInteger := iPlanilha;
                        QryHistCartInv.ExecSQL;
                     End;

                  //AL_91
                  If bIntegra Then
                     Begin
                        LimpaParametros(qryUpdFinContBoleta);
                        // AL_64
                        If iDocumento > 0 Then
                           qryUpdFinContBoleta.ParamByName('CODDOCUMENTO').AsInteger := iDocumento;
                        If iPlanilha > 0 Then
                           qryUpdFinContBoleta.ParamByName('PLNCODIGO').AsInteger := iPlanilha;
                        qryUpdFinContBoleta.ExecSQL;
                     End;

                  // IRLITIGIO - Limpa Planilha e Documento
                  LimpaParametros(QryIrLitigio);
                  QryIrLitigio.ParamByName('PLNCODIGO').AsInteger := iPlanilha;
                  QryIrLitigio.ExecSQL;
               End;

            // AL_86 - A partir daqui é erro na exclusão da Planiha ou do Documento
            bErroInterno := False;

            //AL_86 - Ini
            //AL_91
            // Exclui Documento da Tesouraria
            If (iDocumento > 0) And (bIntegra) Then
               Begin
                  If Not CtrlInvContab.Documento.Delete(iDocumento) Then
                     //AL_87
                     Raise Exception.Create('Não foi possível excluir o Documento Financeiro' + #13 +
                        'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);
               End;

            // Exclui Planilha da Contabilidade
            //AL_91
            If (iPlanilha > 0) And (bIntegra) Then
               Begin
                  If Not CtrlInvContab.InvExcluiLanc(iPlanilha, 0, Sistema.UsaPlanoPatro, False) Then
                     Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' + IntToStr(iPlanilha) + #13 +
                        'Mensagem: ' + CtrlInvContab.MessageInfo);
               End;

            If bTransacao Then
               DtmBaseDados.dbBaseDados.Commit;

         End;
   Except On E: Exception Do
         Begin
            Screen.Cursor := crDefault;
            Result := False;
            // AL_13
            If bMostraMsg Then
               // AL_68
               MsgDlg(IIF(bErroInterno, 'Não foi possível o lançamento financeiro/contábil' + #13, '') +
                  E.Message, 'Mensagem do Sistema ', mtWarning, [mbOK], 0);
            If bTransacao Then
               DtmBaseDados.dbBaseDados.Rollback;
         End;
   End;
End;

//AL_28 - 23/03/2005

//--------------------------------------------------------------------------------------------------
//    Função que estorna uma determinada Operação de Investimento
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//
//       iOperacao      :  id da Operação de Investimento   (idOperacaoInvest)
//       iEmpresaProp   :  id da Empresa proprietária       (Sistema.idEmpresa)
//       iModuloOrigem  :  id do Módulo de Origem           (Sistema.idModulo)
//
//       dDataEstorno   :  data do estorno
//
//--------------------------------------------------------------------------------------------------

//AL_94

Function TOperComum.EstornaOper(sBoleta: String;
   iTipoInvest, iOperacaoInvest, iInvestimento: Integer;
   dDataEstorno: TDateTime;
   fValorPrimeiraCota: currency;
   sEstExc: String;
   bMostraMsg: boolean;
   iIdTipoOperacao: Integer = 0): boolean;
Var
   qryAux: TwwQuery;
   iPlanilha, iPlano, iDocumento, iIdHistCartInv: longint;
   fQtdRecDirParc: Double;
   dDataMov: TDateTime;
Begin
   Result := True;
   Try
      qryAux := TwwQuery.Create(Application);
      qryAux.DatabaseName := 'BaseDados';

      // Exclui Transferências de Carteira da Boleta

      OperComum.LimpaParametros(dtmOperComum.qryBuscaBoletaTRC);
      With dtmOperComum.qryBuscaBoletaTRC Do
         Begin
            ParamByName('IDBOLETA').AsString := sBoleta;
            Open;
            If Not IsEmpty Then
               OperComum.ProcExcluiCustodia(FieldByName('IDOPERCUSTODIA').AsInteger,
                  FieldByName('IDHISTCARTINVORIG').AsInteger,
                  FieldByName('IDHISTCARTINVDEST').AsInteger,
                  FieldByName('DATAMOVCUSTOD').AsDateTime)
            Else
               Close;
         End;

      OperComum.LimpaParametros(dtmOperComum.qryHistorico);
      With dtmOperComum.qryHistorico Do
         Begin
            ParamByName('dDataRef').AsString := DateToStr(dDataEstorno);
            If iOperacaoInvest <> -1 Then
               ParamByName('IDOPERACAOINVEST').AsInteger := iOperacaoInvest;
            ParamByName('IDTIPOINVEST').AsInteger := iTipoInvest;
            If Trim(sBoleta) <> '' Then
               ParamByName('NUMDOCUMENTO').AsString := sBoleta;
            //AL_94
            ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
            Open;

            If Not dtmOperComum.qryHistorico.isEmpty Then
               Begin
                  OperComum.LimpaParametros(dtmOperComum.qryOperacao);
                  With dtmOperComum.qryOperacao Do
                     Begin
                        ParamByName('dDataRef').AsString := DateToStr(dDataEstorno);
                        If Trim(sBoleta) <> '' Then
                           ParamByName('NUMDOCUMENTO').AsString := sBoleta;
                        //AL_94
                        ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
                        Open;

                        frmAguarde.Pos := 0;
                        frmAguarde.Max := dtmOperComum.qryHistorico.RecordCount + (dtmOperComum.qryOperacao.RecordCount * 4);
                        If Trim(sBoleta) <> '' Then
                           frmAguarde.Mostra('Aguarde, Excluindo Boleta ' + sBoleta)
                        Else
                           frmAguarde.Mostra('Aguarde, Processando Exclusão de Operações...');
                     End;

                  dtmOperComum.qryHistorico.First;
                  While Not dtmOperComum.qryHistorico.EOF Do
                     Begin
                        If Not (dtmOperComum.qryHistorico.FieldByName('CODDOCUMENTO').isNULL) Then
                           iDocumento := dtmOperComum.qryHistorico.FieldByName('CODDOCUMENTO').asInteger
                        Else
                           iDocumento := -1;
                        If Not (dtmOperComum.qryHistorico.FieldByName('PLNCODIGO').isNULL) Then
                           Begin
                              iPlanilha := dtmOperComum.qryHistorico.FieldByName('PLNCODIGO').asInteger;
                              iPlano := dtmOperComum.qryHistorico.FieldByName('PLANO').asInteger;
                           End
                        Else
                           Begin
                              iPlanilha := -1;
                              iPlano := -1;
                           End;

                        If (iDocumento = 0) Then
                           iDocumento := -1;

                        If (iPlanilha = 0) Then
                           iPlanilha := -1;

                        If Not ((iDocumento = -1) And (iPlanilha = -1)) Then
                           Begin
                              If sEstExc = 'S' Then
                                 Begin // estorna lançamentos
                                    If Not ProcEstorna(iDocumento, iPlanilha, iPlano, dDataEstorno, bMostraMsg) Then
                                       Begin
                                          Result := false;
                                          frmAguarde.Apaga;
                                          Exit;
                                       End;
                                 End
                              Else
                                 Begin // exclui lançamentos  (comitando)
                                    If Not ProcExclui(iDocumento, iPlanilha, iPlano, -1, dDataEstorno, bMostraMsg) Then
                                       Begin
                                          Result := false;
                                          frmAguarde.Apaga;
                                          Exit;
                                       End;
                                 End;
                           End;
                        dtmOperComum.qryHistorico.Next;
                        frmAguarde.Pos := frmAguarde.Pos + 1;
                     End;
               End;
         End;

      // Inicia exclusões
      If Not dtmOperComum.qryHistorico.isEmpty Then
         Begin
            dtmOperComum.qryOperacao.First;
            While Not dtmOperComum.qryOperacao.Eof Do
               Begin
                  // levando em conta os registros que vão ser excluídos, marca as flags de recálculo
                  MarcaFlgHistCustodia(-1, dtmOperComum.qryOperacao.FieldByName('IDOPERACAOINVEST').AsInteger, -1);
                  dtmOperComum.qryOperacao.Next;
                  frmAguarde.Pos := frmAguarde.Pos + 1;
               End;
            //AL_94
         End;
      // atualiza os saldos da carteira após o estorno
      AtualizaSaldos(fValorPrimeiraCota, -1);

   Except On E: Exception Do
         Begin
            frmAguarde.Apaga;
            Result := false;
            MsgDlg('Ocorreu um problema no estorno da operação' +
               E.Message, 'Mensagem do Sistema ', mtError, [mbOK], 0);
            Screen.Cursor := crDefault;

         End;
   End;
   qryAux.Close;
   qryAux.Free;
   dtmOperComum.qryAuxiliar.Close;
   frmAguarde.Apaga;
End;

//-------------------------------------------------------------------------------------------------------
//    Função que Alimenta Carteira
//-------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//    Parâmetros :
//       sNaturMov         :  Tipo de movimentacao a ser efetuada na carteira:
//                               A - Aumenta quantidade de cotas (compra)
//                               D - Diminui quantidade de cotas (venda)
//                               O - Aumenta valor da cota (receita)
//                               U - Diminui valor da cota (despesa)
//                               G - Aumento da Cotacao do Investimento
//                               P - Diminuição da Cotacao do Investimento
//                               N - Não altera
//                               M - Aumenta valor cota, aumenta quant. cotas, não altera quant. investimento
//                               I - Diminui valor cota, diminui quant. cotas, não altera quant. investimento
//                               R - Aumenta valor da cota (rendimento)
//                               E - Aumenta/Diminui (despesa ligada à Operação)
//                               L - Lucro
//                               C - Mantém saldos e atualiza SaldoVlrInvCart
//
//       sTipoMov          :  Gerador da movimentação
//                               OPE - Operação
//                               DOP - Despesa da Operação
//                               MVI - Receita / Despesa de Imóvel
//                               ATU - Atualização
//                               DES - Despesa da Carteira
//                               DEP - Depreciação
//                               RVL - Reavaliação
//                               TRN - Transferencia (Imobiliário)
//                               TRF - Transferencia (Investimento)
//                               TRC - Transferencia (Carteiras)
//                               LUC - Lucro
//
//       iInvestimento     :  id do Investimento                        (idInvestimento)
//       iTipoInvest       :  id do Tipo de Investimento                (idTipoInvest)
//       iOperacao         :  id da Operação de Investimento            (idOperacaoInvest)
//       iLancImovel       :  id do Lançamento                          (tabela LancamentosImovel)
//       iTipoOperacao     :  id do Tipo de Operação de Investimento    (idTipoOperacao)
//       iCarteira         :  id da Carteira de Investimentos           (idCarteiraInvest)
//       iDespesaOperacao  :  id da Despesa ligada a uma Operação       (idDesOperInvest)
//       iImposto          :  id do Imposto ligado a um Investimento    (idImpostoInvest)
//       iDespesaCarteira  :  id da Despesa ligada a uma Carteira       (idDespCartInvest)
//       iPlanilha         :  id da Planilha onde foram registrados os lançamentos referentes à atualização
//       iDocumento        :  id do Documento (CaP/CaR) referente ao(s) lançamentos
//       sFlgCustodia      :  Flag de tratamento de Custódia.
//       iPlano            :
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros não sejam necessários
//       -------------------------------------------------------------------------------------------
//          iDespesaCarteira e os outros parâmetros acima são auto-excludentes
//       -------------------------------------------------------------------------------------------
//          as quantidade de cotas e de investimento não podem ficar negativas
//       -------------------------------------------------------------------------------------------
//
//       dDataOper         :  Data e Hora da Operação
//       fValorOperacao    :  Valor da Operação
//       fQtdInvestOperacao:  Quantidade de 'papéis' movimentada
//       fValorPrimeiraCota:  Valor da 1ª cota da Carteira
//       sHistorico        :  Historico do Lançamento
//       sRecPag           :  'P' ou 'R' - indica o sinal do caixa (Contas a Pagar/Receber)
//       bMostraMsg        :  True  - mostra mensagens
//                            False - não mostra mensagens
//--------------------------------------------------------------------------------------------------

Function TOperComum.AlimentaCarteira(iEmpresaProp, iModuloOrigem, iInvestimento, iTipoInvest,
   iOperacao, iLancImovel, iTipoOperacao, iCarteira,
   iCarteiraGerenc, iDespesaOperacao, iDespesaCarteira,
   iPlanilha, iDocumento, iPlano: integer;
   dDataOper: TDateTime;
   fValorOperacao: currency;
   fQtdInvestOperacao: Double;
   fValorPrimeiraCota, fValorVariacao, fValorJuros,
   fValorIRProv, fValorIRApu, fValorIOFProv, fValorIOFApu,
   fValorAgio, fVlrCPMFProv, fVlrCMPFApu: currency;
   sNaturMov, sNaturOper, sLote, sHistorico, sTipoMov,
   sFlgCustodia, sRecPag: String;
   bMostraMsg: boolean;
   iIdCorretValores, iIdPlanPrevCtbPatr: integer;
   Var iIdHistCartInv: Integer): boolean;
Var
   fValorCota, fSaldoInicialCotas, fValorPremio: double;
   fSaldoInicialValor, fQtdeInicialInvest: double;
   //AL_17 - 02/02/2005
   fSaldoFinalCotas, fNulo: double;
   fQtdeInicialCPMF, fQtdeFinalCPMF: double;
   sTipoAtualizacao, sMensagem: String;
   //AL_43
   qryTipoOper, qryAuxLocal : TwwQuery;
   //AL_51
   iIdHistCartIni: Integer;
   dDataOperIni: TDateTime;
   // AL_83
   CtrlRV: TCtrlRendaVariavel;
   //Ricardo Cristiano - 24/09/2008 - N. Sol 96592 -  N. Kintana 418922
   sSql: String;
Begin
   Result := True;
   fNulo := 0;
   fSaldoInicialCotas := 0;
   fSaldoFinalCotas := 0;
   fValorCota := 0;

   // para evitar qq Access Violation que pudesse ocorrer
   If length(trim(sNaturMov)) = 0 Then sNaturMov := ' ';
   If length(trim(sNaturOper)) = 0 Then sNaturOper := ' ';

   Try {...Finally}

      CtrlRV := TCtrlRendaVariavel.Create;
      CtrlRV.InitializeAs(Padroes);

      //AL_5 - Capta FLGCONTAINVEST do Tipo de Operação
      qryTipoOper := TwwQuery.Create(Application);
      qryTipoOper.DataBaseName := 'BASEDADOS';
      qryTipoOper.SQL.Add('SELECT TIPOOPERACAO.FLGCONTAINVEST ');
      qryTipoOper.SQL.Add('FROM   TIPOOPERACAO ');
      qryTipoOper.SQL.Add('WHERE  TIPOOPERACAO.IDTIPOINVEST = 2 ');
      qryTipoOper.SQL.Add('  AND  TIPOOPERACAO.IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao));
      qryTipoOper.Open;

      Try {...Except}

         // Testa a consistência dos parâmetros passados;
         // se estiverem OK, define as outras variáveis necessárias a partir dos mesmos
         If Not (VerificaParametros(iInvestimento, iTipoInvest, iOperacao, iTipoOperacao,
                                    iCarteira, iDespesaOperacao, iDespesaCarteira, fValorPrimeiraCota, sNaturMov)) Then
         Begin
            If bMostraMsg Then
               MsgDlg('Parâmetros inconsistentes (Movimentação da Carteira)!', 'Erro', mtError, [mbOk], 0);
            Result := False;
            Exit;
         End;

         // Se a natureza indicar que não há alimentação da carteira, sai (com Result = True)
         If sNaturMov[1] = 'N' Then Exit;

         // AL_7 - Replica saldos diariamente
         // Se (Valor = 0 _e_ Qtde = 0), sai (com Result = True)
         If (fValorOperacao = 0) And (fQtdInvestOperacao = 0) And (sNaturMov <> 'X') Then
            Exit;
         //AL_43

         // Verificação do saldo do INVESTIMENTO
         fQtdeInicialInvest := 0;
         //AL_5
         fQtdeInicialCPMF := 0;

         //AL_2
         //AL_5
         //AL_71
         //AL_75
         //AL_78
         //AL_83 - BuscaSaldos em 3 camadas
         CtrlRV.BuscaSaldoRV.Executa(dDataOper, iIdPlanPrevCtbPatr, iInvestimento, iCarteira, iCarteiraGerenc,
                                     high(integer), -1, sLote);

         fQtdeInicialInvest := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;
         fQtdeInicialCPMF   := CtrlRV.BuscaSaldoRV.SaldoQtdCC;
         // AL_83 - Fim

// FIM da Verificação dos saldos iniciais e cálculo do Valor da Cota -------------------------------


// Cálculo dos saldos finais --------------------------------------------------------------------

         //AL_17 - 02/02/2005
         Case sNaturMov[1] Of

            'A': // Aumenta quantidade de cotas (Compra)
               Begin
                  //AL_5
                  If qryTipoOper.FieldByName('FLGCONTAINVEST').AsInteger = 1 Then
                     fQtdeFinalCPMF := fQtdeInicialCPMF
                  Else
                     fQtdeFinalCPMF := fQtdeInicialCPMF + fQtdInvestOperacao;
               End;

            'C': // Mantém saldos e atualiza SaldoVlrInvCart
               Begin
                  //AL_5
                  fQtdeFinalCPMF := fQtdeInicialCPMF
               End;

            'D': // Diminui quantidade de cotas (Venda)
               Begin
                  If iTipoInvest <> 8 Then // BM&F
                     Begin
                        fValorOperacao := (fValorOperacao * -1);
                        //AL_5
                        If qryTipoOper.FieldByName('FLGCONTAINVEST').AsInteger = 1 Then
                           fQtdeFinalCPMF := fQtdeInicialCPMF
                        Else
                           fQtdeFinalCPMF := fQtdeInicialCPMF - fQtdInvestOperacao;
                     End;
               End;

            'E': // Despesa
               Case sNaturOper[1] Of
                  'A', 'D':
                     // Operacao = Compra('C') ou Venda('V'), aumenta qtde Cotas mas NÃO altera qtde Investimento
                     Begin
                        //AL_5
                        fQtdeFinalCPMF := fQtdeInicialCPMF
                     End;

                  'O', 'U':
                     // Operacao = Venda(O) ou Compra(U) de Opção(O), NÃO altera qtde, diminui valores
                     Begin
                        //AL_5
                        fQtdeFinalCPMF := fQtdeInicialCPMF;
                        fValorOperacao := (fValorOperacao * -1);
                        fQtdInvestOperacao := 0;
                     End;

               Else
                  // O primeiro movimento DEVE aumentar o nº de cotas
                  If bMostraMsg Then Begin
                        sMensagem := 'Natureza de Operação não Prevista. ';
                        MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
                     End;
                  // Sai, (com Result = False)
                  Result := False;
                  Exit;
               End;

            'G': // Aumento da Cotacao do Investimento (Ganho)
               Begin
                  fQtdInvestOperacao := 0;
                  //AL_5
                  fQtdeFinalCPMF := fQtdeInicialCPMF
               End;

            'I': // Diminui valor da cota (Baixa Parcial - Imobiliário(?))
               Begin
                  fValorOperacao := fValorOperacao * (-1);
                  //AL_5
                  fQtdeFinalCPMF := fQtdeInicialCPMF
               End;

            //'L','O','R': // Aumenta valor da cota (Venda de Opção / Lucro / Rendimento)
            'L', 'R': // Aumenta valor da cota (Venda de Opção / Lucro / Rendimento)
               Begin
                  fQtdInvestOperacao := 0;
                  //AL_5
                  fQtdeFinalCPMF := fQtdeInicialCPMF
               End;

            'P': // Diminuição da Cotacao do Investimento (Perda)
               Begin
                  fValorOperacao := fValorOperacao * (-1);
                  fQtdInvestOperacao := 0;
                  //AL_5
                  fQtdeFinalCPMF := fQtdeInicialCPMF
               End;

            'O': // Aumenta valor da cota (Venda de Opção / Lucro / Rendimento)
               Begin
                  fQtdInvestOperacao := fQtdInvestOperacao;
                  //AL_5
                  If qryTipoOper.FieldByName('FLGCONTAINVEST').AsInteger = 1 Then
                     fQtdeFinalCPMF := fQtdeInicialCPMF
                  Else
                     fQtdeFinalCPMF := fQtdeInicialCPMF + fQtdInvestOperacao;
               End;

            'U': // Diminui valor da cota (Compra de Opção)
               Begin
                  //AL_5
                  If qryTipoOper.FieldByName('FLGCONTAINVEST').AsInteger = 1 Then
                     fQtdeFinalCPMF := fQtdeInicialCPMF
                  Else
                     fQtdeFinalCPMF := fQtdeInicialCPMF + fQtdInvestOperacao;
               End;

            'F': // Mantém o valor da cota conforme o lancamento (Grupamento)
               Begin
                  //AL_104
                  //AL_5
                  If qryTipoOper.FieldByName('FLGCONTAINVEST').AsInteger = 1 Then
                     fQtdeFinalCPMF := fQtdeInicialCPMF
                  Else
                     fQtdeFinalCPMF := fQtdInvestOperacao;

               End

         Else
            fValorOperacao := 0;
            //AL_5
            fQtdeFinalCPMF := fQtdeInicialCPMF
         End;
         //AL_17 - Fim

         // FIM do Cálculo dos saldos finais ----------------------------------------------------------------

         // Por default, é inclusão
         sTipoAtualizacao := 'I';

         // DOP - Despesa da Operação, LUC - Lucro
         If (sTipoMov = 'DOP') Or (sTipoMov = 'LUC') Then
         Begin
             OperComum.LimpaParametros(dtmOperComum.qryBuscaHistDesp,True);
             dtmOperComum.qryBuscaHistDesp.ParamByName('DESPESA').AsInteger := iDespesaOperacao;
             dtmOperComum.qryBuscaHistDesp.Open;
             If Not (dtmOperComum.qryBuscaHistDesp.isEmpty) Then
                sTipoAtualizacao := 'A';
             OperComum.LimpaParametros(dtmOperComum.qryBuscaHistDesp);
         End
         Else
         Begin
            // OPE - Operação
            If sTipoMov = 'OPE' Then
            Begin
               OperComum.LimpaParametros(dtmOperComum.qryBuscaHistOper,True);
               dtmOperComum.qryBuscaHistOper.ParamByName('OPERACAO').AsInteger := iOperacao;
               dtmOperComum.qryBuscaHistOper.Open;
               If Not (dtmOperComum.qryBuscaHistOper.isEmpty) Then
                  sTipoAtualizacao := 'A';
               OperComum.LimpaParametros(dtmOperComum.qryBuscaHistOper);
            End;
         End;

         // FIM da Decisão do tipo de atualização -----------------------------------------------------------

         // @X Inclusão de Registro na HistCartInv ----------------------------------------------------------

         If sTipoAtualizacao = 'I' Then
         Begin
             // Ajusta Flag de Custódia
             If sFlgCustodia <> '' Then
             Begin
                OperComum.LimpaParametros(dtmOperComum.qryBuscaCustodia, True);
                dtmOperComum.qryBuscaCustodia.ParamByName('TIPOINVEST').AsInteger := iTipoInvest;
                dtmOperComum.qryBuscaCustodia.ParamByName('TIPOOPER').AsInteger := iTipoOperacao;
                dtmOperComum.qryBuscaCustodia.Open;
                If (Not (dtmOperComum.qryBuscaCustodia.isEmpty) And
                        (dtmOperComum.qryBuscaCustodia.FieldByName('TIPOCUSTODIA').AsString = 'N')) Then
                   sFlgCustodia := '';
                OperComum.LimpaParametros(dtmOperComum.qryBuscaCustodia);
             End;

             //Ricardo Cristiano - 24/09/2008 - N. Sol 96592 -  N. Kintana 418922
             //               Close;
             //               OperComum.LimpaParametros(dtmOperComum.qryInsertHistCartInv);
             //               if not(Prepared) then Prepare;

             iIdHistCartInv := LeUltRegistro(Nil, 'HISTCARTINV');

             // Passa como NULL os parâmetros, quando necessário
             // não há preocupação aqui em verificar quais parâmetros _podem_ ser nulos...
      //Ricardo Cristiano - 24/09/2008 - N. Sol 96592 -  N. Kintana 418922

      //Ricardo Cristiano - 24/09/2008 - N. Sol 96592 -  N. Kintana 418922
             sSql := '';
             sSql := sSql + 'INSERT INTO HISTCARTINV ' +
                            '(IDHISTCARTINV, IDCARTEIRAINVEST, IDCARTEIRAGERENC, ' +
                            ' IDINVESTIMENTO, IDDESPOPERINVEST, IDDESPCARTINVEST, ' +
                            ' IDOPERACAOINVEST, IDTIPOINVEST, IDTIPOOPERACAO, ' +
                            ' PLNCODIGO, CODDOCUMENTO, PLANO, IDLANCIMOVEL, ' +
                            ' IDEMPRESAPROP, IDMODULO, HISTMOVCARTINV, ' +
                            ' NATURMOVCARTINV, NATURMOVOPER, IDLOTE, ' +
                            ' TIPMOVCARTINV, RECPAG, DATAMOVCARTINV, ' +
                            ' VLRMOVCARTINV, QTDEMOVINVCART, COTASMOVCARTINV, ' +
                            ' FLGCALCSALDO, FLGCUSTODIA, ' +
                            ' VLRVARIACAO, VLRJUROS, VLRIRPROV, ' +
                            ' VLRIRAPU, VLRIOFPROV, VLRIOFAPU, ' +
                            ' VLRAGIO, VLRCPMFPROV, VLRCPMFAPU, ' +
                            ' IDCORRETVALORES, IDPLANPREVCTBPATR, SALDOQTDECPMF) ' +
                            ' VALUES ';

             sSql := sSql + '(';

             sSql := sSql + IntToStr(iIdHistCartInv) + ',';
             If iCarteira > 0 Then
                sSql := sSql + IntToStr(iCarteira) + ','
             Else
                sSql := sSql + 'NULL,';
             If iCarteiraGerenc > 0 Then
                sSql := sSql + IntToStr(iCarteiraGerenc) + ','
             Else
                sSql := sSql + 'NULL,';
             If iInvestimento > 0 Then
                sSql := sSql + IntToStr(iInvestimento) + ','
             Else
                sSql := sSql + 'NULL,';
             If iDespesaOperacao > 0 Then
                sSql := sSql + IntToStr(iDespesaOperacao) + ','
             Else
                sSql := sSql + 'NULL,';
             If iDespesaCarteira > 0 Then
                sSql := sSql + IntToStr(iDespesaCarteira) + ','
             Else
                sSql := sSql + 'NULL,';
             If iOperacao > 0 Then
                sSql := sSql + IntToStr(iOperacao) + ','
             Else
                sSql := sSql + 'NULL,';
             If iTipoInvest > 0 Then
                sSql := sSql + IntToStr(iTipoInvest) + ','
             Else
                sSql := sSql + 'NULL,';

             sSql := sSql + IntToStr(iTipoOperacao) + ',';

             If iPlanilha > 0 Then
                sSql := sSql + IntToStr(iPlanilha) + ','
             Else
                sSql := sSql + 'NULL,';
             If iDocumento > 0 Then
                sSql := sSql + IntToStr(iDocumento) + ','
             Else
                sSql := sSql + 'NULL,';

             If iPlano > 0 Then
                sSql := sSql + IntToStr(iPlano) + ','
             Else
                sSql := sSql + 'NULL,';

             If iLancImovel > 0 Then
                sSql := sSql + IntToStr(iLancImovel) + ','
             Else
                sSql := sSql + 'NULL,';

             sSql := sSql + IntToStr(iEmpresaProp) + ',';
             sSql := sSql + IntToStr(iModuloOrigem) + ',';
             sSql := sSql + QuotedStr(copy(sHistorico, 1, 59)) + ',';
             sSql := sSql + QuotedStr(sNaturMov) + ',';
             sSql := sSql + QuotedStr(sNaturOper) + ',';

             sSql := sSql + QuotedStr(sLote) + ',';
             sSql := sSql + QuotedStr(sTipoMov) + ',';
             sSql := sSql + QuotedStr(sRecPag) + ',';

             sSql := sSql + 'TO_DATE(' + QuotedStr(DateToStr(dDataOper)) + ',' + QuotedStr('DD/MM/YYYY') + '),';

             sSql := sSql + TrocaVirgulaPonto(FloatToStr(fValorOperacao)) + ',';
             sSql := sSql + TrocaVirgulaPonto(FloatToStr(fQtdInvestOperacao)) + ',';
             sSql := sSql + '0,';

             //Ricardo Cristiano - 15/04/2010 - N. Sol 119978/1381 -  N. Kintana 785521
             //Ricardo Cristiano - 17/12/2009 - N. Sol 128205 -  N. Kintana 684349
{             if (Not ((iTipoOperacao =  pRPI.IDTIPOOPERDIRINC) or
                      (iTipoOperacao = (pRPI.IDTIPOOPERDIRINC + 10000)))) then}
                sSql := sSql+ QuotedStr('2')+',';
{             else
                sSql := sSql+ 'NULL,';}

             sSql := sSql + QuotedStr(sFlgCustodia) + ',';

             sSql := sSql + TrocaVirgulaPonto(FloatToStr(fValorVariacao)) + ',';
             sSql := sSql + TrocaVirgulaPonto(FloatToStr(fValorJuros)) + ',';
             sSql := sSql + TrocaVirgulaPonto(FloatToStr(fValorIRProv)) + ',';
             sSql := sSql + TrocaVirgulaPonto(FloatToStr(fValorIRApu)) + ',';
             sSql := sSql + TrocaVirgulaPonto(FloatToStr(fValorIOFProv)) + ',';
             sSql := sSql + TrocaVirgulaPonto(FloatToStr(fValorIOFApu)) + ',';
             sSql := sSql + TrocaVirgulaPonto(FloatToStr(fValorAgio)) + ',';
             sSql := sSql + TrocaVirgulaPonto(FloatToStr(fVlrCPMFProv)) + ',';
             sSql := sSql + TrocaVirgulaPonto(FloatToStr(fVlrCMPFApu)) + ',';
             If iIdCorretValores > 0 Then
                sSql := sSql + IntToStr(iIdCorretValores) + ','
             Else
                sSql := sSql + 'NULL,';

             If iIdPlanPrevCtbPatr > 0 Then
                sSql := sSql + IntToStr(iIdPlanPrevCtbPatr) + ','
             Else
                sSql := sSql + 'NULL,';

             sSql := sSql + TrocaVirgulaPonto(FloatToStr(fQtdeFinalCPMF));

             sSql := sSql + ')';

             qryAuxLocal := TwwQuery.Create(Application);
             qryAuxLocal.DataBaseName := 'BASEDADOS';
             qryAuxLocal.sql.Add(sSql);
             qryAuxLocal.ExecSQL;
             FreeAndNil(qryAuxLocal);

             //Ricardo Cristiano - 24/09/2008 - N. Sol 96592 -  N. Kintana 418922

             // FIM de Inclusão de Registro na HistCartInv ------------------------------------------------------
         End
         Else
         Begin
            // @X Update de Registro na HistCartInv ------------------------------------------------------------

            // Despesa ou Lucro
            If ((sTipoMov = 'DOP') Or (sTipoMov = 'LUC')) Then
            Begin
               OperComum.LimpaParametros(dtmOperComum.qryUpdateHistPorDesp, True);
               dtmOperComum.qryUpdateHistPorDesp.ParamByName('DESPESA').AsInteger := iDespesaOperacao;
               dtmOperComum.qryUpdateHistPorDesp.ParamByName('DATA').AsDateTime := dDataOper;
               dtmOperComum.qryUpdateHistPorDesp.ParamByName('MOVIMENTO').AsFloat := fValorOperacao;
               dtmOperComum.qryUpdateHistPorDesp.ParamByName('QUANTIDADE').AsFloat := fQtdInvestOperacao;
               dtmOperComum.qryUpdateHistPorDesp.ParamByName('VLRVARIACAO').AsFloat := fValorVariacao;
               dtmOperComum.qryUpdateHistPorDesp.ParamByName('VLRJUROS').AsFloat := fValorJuros;
               dtmOperComum.qryUpdateHistPorDesp.ParamByName('VLRIRPROV').AsFloat := fValorIRProv;
               dtmOperComum.qryUpdateHistPorDesp.ParamByName('VLRIRAPU').AsFloat := fValorIRApu;
               dtmOperComum.qryUpdateHistPorDesp.ParamByName('VLRIOFPROV').AsFloat := fValorIOFProv;
               dtmOperComum.qryUpdateHistPorDesp.ParamByName('VLRIOFAPU').AsFloat := fValorIOFApu;
               dtmOperComum.qryUpdateHistPorDesp.ParamByName('VLRAGIO').AsFloat := fValorAgio;
               //AL_5
               dtmOperComum.qryUpdateHistPorDesp.ParamByName('SALDOQTDECPMF').AsFloat := fQtdeFinalCPMF;
               dtmOperComum.qryUpdateHistPorDesp.ExecSQL;
               OperComum.LimpaParametros(dtmOperComum.qryUpdateHistPorDesp);
            End // Operação
            Else If sTipoMov = 'OPE' Then
            Begin
               OperComum.LimpaParametros(dtmOperComum.qryUpdateHistPorOper, True);
               dtmOperComum.qryUpdateHistPorOper.ParamByName('OPERACAO').AsInteger := iOperacao;
               dtmOperComum.qryUpdateHistPorOper.ParamByName('DATA').AsDateTime := dDataOper;
               dtmOperComum.qryUpdateHistPorOper.ParamByName('MOVIMENTO').AsFloat := fValorOperacao;
               dtmOperComum.qryUpdateHistPorOper.ParamByName('QUANTIDADE').AsFloat := fQtdInvestOperacao;
               dtmOperComum.qryUpdateHistPorOper.ParamByName('VLRVARIACAO').AsFloat := fValorVariacao;
               dtmOperComum.qryUpdateHistPorOper.ParamByName('VLRJUROS').AsFloat := fValorJuros;
               dtmOperComum.qryUpdateHistPorOper.ParamByName('VLRIRPROV').AsFloat := fValorIRProv;
               dtmOperComum.qryUpdateHistPorOper.ParamByName('VLRIRAPU').AsFloat := fValorIRApu;
               dtmOperComum.qryUpdateHistPorOper.ParamByName('VLRIOFPROV').AsFloat := fValorIOFProv;
               dtmOperComum.qryUpdateHistPorOper.ParamByName('VLRIOFAPU').AsFloat := fValorIOFApu;
               dtmOperComum.qryUpdateHistPorOper.ParamByName('VLRAGIO').AsFloat := fValorAgio;
                        //AL_5
               dtmOperComum.qryUpdateHistPorOper.ParamByName('SALDOQTDECPMF').AsFloat := fQtdeFinalCPMF;
               dtmOperComum.qryUpdateHistPorOper.ExecSQL;
               OperComum.LimpaParametros(dtmOperComum.qryUpdateHistPorOper);               
            End;
         End;

         // FIM ---------------------------------------------------------------------------------------------

      Except
         Result := False;
         // AL_95
      End;   

   Finally
      OperComum.LimpaParametros(dtmOperComum.qrySaldoCarteira);
      OperComum.LimpaParametros(dtmOperComum.qryBuscaHistDesp);
      OperComum.LimpaParametros(dtmOperComum.qryBuscaHistOper);
      OperComum.LimpaParametros(dtmOperComum.qryBuscaCustodia);
      OperComum.LimpaParametros(dtmOperComum.qryInsertHistCartInv);
      OperComum.LimpaParametros(dtmOperComum.qryUpdateHistPorDesp);
      OperComum.LimpaParametros(dtmOperComum.qryUpdateHistPorOper);
      //AL_83
      if qryTipoOper <> nil then
         FreeAndNil(qryTipoOper);
      if qryAuxLocal <> nil then
         FreeAndNil(qryAuxLocal);
      FreeAndNil(CtrlRV);
   End;
End;

//--------------------------------------------------------------------------------------------------
//    Função que Atualiza Saldos de Carteira e Investimento
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//       fValorPrimeiraCota   : valor da 1ª cota da Carteira
//       dDataFinal           : Data até quando devem ser atualizados os saldos
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//       FlgCalcSaldo         :  1 - Atualiza Saldo Carteira e Investimento
//                               2 - Atualiza Saldo Investimento
//                               3 - Atualiza Saldo Carteira
//                               4 - Lucro
//--------------------------------------------------------------------------------------------------

Function TOperComum.AtualizaSaldos(fValorPrimeiraCota: currency; dDataFinal: TDateTime): boolean;
Var
   //AL_49
   fValorCota, fSaldoInicialCotas, fSaldoInicialValor, fQtdeInicialInvest, fValorVariacao,
      fValorInicialInvest, fSaldoFinalCotas, fSaldoFinalValor, wSaldoQtdCPMF, fQtdeInicialCPMF, fQtdeFinalCPMF,
      fValorFinalInvest, fValorOperacao, fValorCotasOperacao,  fQtdInvestOperacao, wSaldoInutil, wSaldoQtdInvest,
      wSaldoVlrInvest, wVlrMovimento, wCotMovimento, fValorAgio, wSaldoAtuAnt, wSaldoAtu, wSaldoAquiAnt, wSaldoAqui,
      wSaldoRendAnt, wTotDespOper, wVlrMovOperacao,  wSaldoMercadoAnt, wSaldoRend, wMovimCar, wVlrTotVendido,
      wQtdMovOperacao, wSaldoCarAnt, wSaldoCar, wQtdInvestAnt, wMovimAtu, wMovimAqui, wCotaMoeda, wMovimJur,
      wSaldoJur, wSaldoJurant, wMovimPre, wSaldoPre, wSaldoPreAnt, wMovimVar, wSaldoVar, wSaldoVarant, fValorMovimAqui,
      wMovimIRProv, wSaldoIRProv, wSaldoIRProvant, wMovimIRApu, wSaldoIRApu, wSaldoIRApuAnt, wMovimIOFProv,
      wSaldoIOFProv, wSaldoIOFProvant, wMovimIOFApu, wSaldoIOFApu, wSaldoIOFApuAnt, wMovimAgio, wSaldoAgio,
      wSaldoAgioant, wSaldoProvPerda, wSaldoProvPerdaAnt, wMovimProvPerda, fSaldoProvPerda, fPercProvPerda,
      fSaldoPP, fSaldoQtd, fSaldoVlr, fSaldoAqui, fSaldoRend, fSaldoVariacao, fSaldoIrApu, fSaldoInutil, fSdoAtu,
      fSdoCar, fVlrDifCusto: Double;

   wFlgCalcSaldo, wTipoMov, sLote, wTipoAtualizacao, cNaturezaOPeracao : String;

   wFlgSair, cNaturezaMovimento, wDec : Char;

   iTipoInvest, iIdTipoDespInvest, iInvestimento, iCarteira, iCarteiraGerenc, iHistorico, iMoeda: LongInt;

   dDataOper, dDataMov, DataCotacao, dDataOperProx: TDateTime;

   iPlanoPatro, iIdTipoOperacao, wIdCarteira, wIdInvestimento, wIdLancamento: Integer;

   // AL_83
   CtrlRendaVariavel: TCtrlRendaVariavel;

Begin
   //--Emerson--//
   fQtdeFinalInvest := 0;

   wCotMovimento := 0;
   // Busca Moeda Atuarial
   //AL_109
   iMoeda := CtrlPInv.MoedaAtu;
   // Caso a Moeda Atuarial não tenha sido cadastrada, Sai .
   If iMoeda = 0 Then
   Begin
      MsgDlg('Saldos não Atualizados... Cadastre Moeda Atuarial nos Parâmetros do Sistema', 'Erro', mtError, [mbOK], 0);
      Exit;
   End;
   // Inicia Variaveis
   Result := True;

   Try
      //AL_83 - Estes objetos devem ser criados dentro do bloco try/finally
      // Cria Objetos Locais
      CtrlRendaVariavel := TCtrlRendaVariavel.Create;
      CtrlRendaVariavel.InitializeAs(Padroes);

      // PROCESSA REGISTROS COM O FLAG 1 / 3 / 4 ENQUANTO EXISTIREM
      While True Do
      Begin
         Try
            Application.ProcessMessages;         
            // Abre a query que Busca os Registros
//            QryFlgAtualSaldo := TwwQuery(dtmOperacaoInvest.qryFlgAtualSaldo13);
            dtmOperacaoInvest.qryFlgAtualSaldo13.Close;
            dtmOperacaoInvest.qryFlgAtualSaldo13.Open;
            dtmOperacaoInvest.qryFlgAtualSaldo13.First;

            // Caso não existam mais, sai da Rotina e atualiza Invesimentos
            If dtmOperacaoInvest.qryFlgAtualSaldo13.IsEmpty Then
            begin
               dtmOperacaoInvest.qryFlgAtualSaldo13.Close;
               Break;
            end
            Else
            Begin
               // Testa se So Existem Registros com Flg 4.
               wFlgSair := 'S';
               While Not dtmOperacaoInvest.qryFlgAtualSaldo13.Eof Do
               Begin
                  If dtmOperacaoInvest.qryFlgAtualSaldo13.FieldByName('FLGCALCSALDO').AsInteger <> 4 Then
                  Begin
                     dtmOperacaoInvest.qryFlgAtualSaldo13.Close;                  
                     wFlgSair := 'N';
                     Break;
                  End;
                  dtmOperacaoInvest.qryFlgAtualSaldo13.Next;
               End;

               If wFlgSair = 'S' Then
               begin
                  dtmOperacaoInvest.qryFlgAtualSaldo13.Close;
                  Break;
               end; 

               // Caso existam guarda dados
               iCarteira          := dtmOperacaoInvest.qryFlgAtualSaldo13.FieldByName('IDCARTEIRAINVEST').AsInteger;
               iCarteiraGerenc    := dtmOperacaoInvest.qryFlgAtualSaldo13.FieldByName('IDCARTEIRAGERENC').AsInteger;
               dDataOper          := dtmOperacaoInvest.qryFlgAtualSaldo13.FieldByName('DATAMOVCARTINV').AsDateTime;
               iHistorico         := dtmOperacaoInvest.qryFlgAtualSaldo13.FieldByName('IDHISTCARTINV').AsInteger;
               iInvestimento      := dtmOperacaoInvest.qryFlgAtualSaldo13.FieldByName('IDINVESTIMENTO').AsInteger;
               iTipoInvest        := dtmOperacaoInvest.qryFlgAtualSaldo13.FieldByName('IDTIPOINVEST').AsInteger;
               //Ricardo Cristiano - 04/11/2010 - N. Sol 144087.2861 -  N. Kintana 1011203
               if (trim(dtmOperacaoInvest.qryFlgAtualSaldo13.FieldByName('NATURMOVCARTINV').AsString) <> '') then
                  cNaturezaMovimento := dtmOperacaoInvest.qryFlgAtualSaldo13.FieldByName('NATURMOVCARTINV').AsString[1];
               dtmOperacaoInvest.qryFlgAtualSaldo13.Close;               
               if ((iCarteira = 0) and (iCarteiraGerenc = 0) and (dDataOper = 0) and (iHistorico = 0) and (iTipoInvest = 0)) then
                  Break;

            End;

            Application.ProcessMessages;               

            OperComum.LimpaParametros(dtmOperacaoInvest.qryAtualizaSaldoCNull);
            dtmOperacaoInvest.qryAtualizaSaldoCNull.ParamByName('IDCARTEIRA').asInteger := iCarteira;
            If iCarteiraGerenc <> 0 Then
               dtmOperacaoInvest.qryAtualizaSaldoCNull.ParamByName('IDCARTEIRAGERENC').asInteger := iCarteiraGerenc;
            dtmOperacaoInvest.qryAtualizaSaldoCNull.ParamByName('DATAMOV').asDateTime := dDataOper;
            dtmOperacaoInvest.qryAtualizaSaldoCNull.ParamByName('IDHISTORICO').asInteger := iHistorico;
            dtmOperacaoInvest.qryAtualizaSaldoCNull.Open;
            dtmOperacaoInvest.qryAtualizaSaldoCNull.First;

            fSaldoInicialCotas := 0;
            //******************************************************************************
            // ATUALIZA SALDOS DOS REGISTROS DAS CARTEIRAS
            While (Not dtmOperacaoInvest.qryAtualizaSaldoCNull.EOF) Do
            Begin
               // Caso Data Final passada e data Maior que Final sai
               If ((dDataFinal <> -1) And (dDataFinal > dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('DATAMOVCARTINV').AsDateTime)) Then
               begin
                  dtmOperacaoInvest.qryAtualizaSaldoCNull.Close;
                  Break;
               end;

               // Guarda Dados
               fValorCotasOperacao:= 0;
               fValorOperacao     := dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('VLRMOVCARTINV').AsFloat;
               cNaturezaMovimento := dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('NATURMOVCARTINV').AsString[1];
               iTipoInvest        := dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDTIPOINVEST').AsInteger;
               iIdTipoDespInvest  := dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDTIPODESPINVEST').AsInteger;
               fValorMovimAqui    := dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('MOVIMAQUI').AsFloat;
               iIdTipoOperacao    := dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDTIPOOPERHIST').AsInteger;
               //Ricardo ATENÇÃO 11/08/2010
               cNaturezaOPeracao  := dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('NATURMOVOPER').AsString[1];
               wTipoMov           := dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('TIPMOVCARTINV').AsString;

               // Guarda Dados nas Variaveis de DeBug
               wIdCarteira        := dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDCARTEIRAINVEST').AsInteger;
               wIdInvestimento    := dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDINVESTIMENTO').AsInteger;
               wIdLancamento      := dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDHISTCARTINV').AsInteger;

               // Guarda os Valores da Operacao e de Cotas
               wVlrMovimento      := fValorOperacao;

               //******************************************************************************
               // CASO SEJA TRANSFERENCIA (NA CARTEIRA)
               If (wTipoMov = 'TRF') Then
               Begin
                  // Caso Diminua (D)
                  If (cNaturezaMovimento = 'D') Then
                  Begin
                     // Busca ultimo Saldo deste Investimento
                     //AL_2
                     //AL_5
                     //AL_71
                     //AL_75
                     //AL_78
                     //AL_83 - BuscaSaldos em 3 camadas
                     CtrlRendaVariavel.BuscaSaldoRV.Executa(dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('DATAMOVCARTINV').AsDateTime,
                                                            dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                            dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDINVESTIMENTO').AsInteger,
                                                            dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                            dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                            9999999, dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDCUSTODIANTE').AsInteger,
                                                            dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDLOTE').AsString);
                     wSaldoQtdInvest := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal;
                     wSaldoVlrInvest := CtrlRendaVariavel.BuscaSaldoRV.SaldoVlrTotal;
                     wSaldoQtdCPMF   := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCC;

                     // Calcula Valor da Movimentacao e Altera Variavel de Calculo Interno (fValorOperacao)
                     wVlrMovimento := ((dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('QTDEMOVINVCART').AsFloat *
                                                         (wSaldoVlrInvest / wSaldoQtdInvest)) * -1);
                        
                     fValorOperacao := wVlrMovimento;
                  End;
                  // Caso Aumente (A)
                  If (cNaturezaMovimento = 'A') Then
                  Begin
                     // Busca Ultimo Lancamento que Diminui de Transferencia
                     FazQuery(dtmOperComum.QryLocal, 'SELECT  HISTCARTINV.VLRMOVCARTINV                  ' +
                                                     'FROM HISTCARTINV                       ' +
                                                     'WHERE (HISTCARTINV.TIPMOVCARTINV    = ''TRF'') AND ' +
                                                     '      (HISTCARTINV.NATURMOVCARTINV  = ''D'')   AND ' +
                                                     '      (HISTCARTINV.IDOPERACAOINVEST = ' +
                                                     QuotedStr(dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDOPERACAOINVEST').AsString) + ')');
                     // Calcula Valor da Movimentacao
                     wVlrMovimento := ((dtmOperComum.QryLocal.FieldByName('VLRMOVCARTINV').AsFloat) * -1);
                     OperComum.LimpaParametros(dtmOperComum.QryLocal);
                  End;
               End;
               //------------------------------------------------------------------------------
               // DEFINIÇÃO DOS SALDOS FINAIS DE ACORDO COM A NATUREZA DA OPERACAO
               Case cNaturezaMovimento Of
                  // Aumenta Valor e Quantidade de cotas (COMPRA)
                  'A':
                     Begin
                        fSaldoFinalValor := fSaldoInicialValor + fValorOperacao;
                     End;
                  // Diminui valor quantidade de cotas (VENDA)  ** FVALOROPERAÇÃO JÁ FOI GRAVADO NEGATIVO **
                  'D':
                     Begin
                        fSaldoFinalValor := fSaldoInicialValor + fValorOperacao;
                     End;
                  // Aumenta Valor (Atualizacao de Saldos - GANHO/RENDIMENTO/OPCOES/LUCRO/PERDA)
                  'G', 'L', 'P':
                     Begin
                        fSaldoFinalValor := fSaldoInicialValor + fValorOperacao;
                     End;
                  // Acrescimo de valor, baixa parcial
                  'M', 'I':
                     Begin
                        // Nao Altera Qtd de Investimento
                        fSaldoFinalValor := fSaldoInicialValor + fValorOperacao;
                     End;
                  // DESPESAS
                  'E':
                     Begin
                        // Guarda a Natureza da Operacao
                        cNaturezaOPeracao := dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('NATURMOVOPER').AsString[1];
                        // Caso Operacao de Compra(C) ou Venda(V), Aumenta Qtd de Cotas e
                        // Nao Altera Qtd de Investimento
                        If (cNaturezaOPeracao = 'A') Or (cNaturezaOPeracao = 'D') Then
                        Begin
                           fSaldoFinalValor := fSaldoInicialValor + fValorOperacao;
                           // Caso Operacao de Venda(O) ou Compra(U) de Opcao(O), Nao Altera Qtds, Diminui Valores
                        End
                        Else If (cNaturezaOPeracao = 'O') Or (cNaturezaOPeracao = 'U') Then
                        Begin

                        End
                        Else
                        Begin
                           // O primeiro movimento DEVE aumentar o nº de cotas
                           Raise Exception.Create('Atualiza Saldo, Natureza de Operação não Prevista. ');
                        End;
                     End;
                  // Caso Diferente de Todos, Não altera Nada
                  Else
                  Begin
                     fSaldoFinalValor := fSaldoInicialValor;
                  End;
               End;

               //------------------------------------------------------------------------------
               // ATUALIZAÇÃO DOS SALDOS DE CARTEIRA
               // Acerta Flag de Calculo de Saldo ( 1 -> 2 ou 3-> '' ou 4-> 4)
               wTipoAtualizacao := '';
               If Trim(dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('FLGCALCSALDO').asString) = '1' Then
                  wTipoAtualizacao := '2'
               Else If Trim(dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('FLGCALCSALDO').asString) = '3' Then
                  wTipoAtualizacao := ''
               Else If Trim(dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('FLGCALCSALDO').asString) = '4' Then
                  wTipoAtualizacao := '4';

               // Muda o Separador Decimal
               wDec := DecimalSeparator;
               DecimalSeparator := '.';
               // Tenta atualizar o Arquivo
               If Not ExecutaQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET ' +
                                                         'HISTCARTINV.SALDOVLRCARTINV   = ' + FloatToStr(fSaldoFinalValor) + ', ' +
                                                         'HISTCARTINV.VLRMOVCARTINV     = ' + FloatToStr(wVlrMovimento) + ', ' +
                                                         'HISTCARTINV.COTASMOVCARTINV   = ' + FloatToStr(wCotMovimento) + ', ' +
                                                         'HISTCARTINV.SALDOCOTASCARTINV = ' + FloatToStr(fSaldoFinalCotas) + ', ' +
                                                         'HISTCARTINV.FLGCALCSALDO      = ' + QuotedStr(wTipoAtualizacao) + '  ' +
                                                         'WHERE (HISTCARTINV.IDHISTCARTINV = ' +
                                                QuotedStr(dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDHISTCARTINV').AsString) + ')') Then
                  Raise Exception.Create('Saldos não Atualizados, Erro ao atualizar Histórico das Carteiras.');

               DecimalSeparator := wDec;
               OperComum.LimpaParametros(dtmOperComum.QryLocal);

               // Calcula Saldos
               fSaldoInicialValor := fSaldoFinalValor;

               If fValorCota = 0 Then
                  fValorCota := 1;

               dtmOperacaoInvest.qryAtualizaSaldoCNull.Next;
            End;

         Except
            On E: Exception Do
            Begin
               MsgDlg('Erro na tentativa de Atualização dos Saldos da Carteira ' +
                  dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDCARTEIRAINVEST').AsString + #13 +
                  'Investimento ' + dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDINVESTIMENTO').AsString + ', ' + #13 +
                  'Tipo de Movimento "' + wTipoMov + '", ' + #13 +
                  'Lançamento ' + dtmOperacaoInvest.qryAtualizaSaldoCNull.FieldByName('IDHISTCARTINV').AsString + ', ' + #13 +
                  'Data de lançamento ' + DateToStr(dDataoper) + #13 + #13 +
                  'Com a Mensagem :' + #13 +
                  E.Message,
                  'Erro', mtError, [mbOK], 0);

               dtmOperacaoInvest.qryFlgAtualSaldo13.Close;
               dtmOperacaoInvest.qryFlgAtualSaldo2.Close;
               dtmOperacaoInvest.qryAtualizaSaldoC.Close;
               dtmOperacaoInvest.qryAtualizaSaldoIL.Close;

               dtmOperComum.QryLocal.Close;

               //AL_83
               FreeAndNil(CtrlRendaVariavel);

               DecimalSeparator := wDec;
               Result := false;
               Exit;
            End;
         End; // try
      End; // while true

      //******************************************************************************
      // PROCESSA REGISTROS COM FLAG 2 / 4 (SALDOS DOS INVESTIMENTOS)
      //******************************************************************************

      While True Do
      Begin
         Try
            Application.ProcessMessages;         
            // Busca registros de HistCartInv com flag para atualizacao de Saldo em Investimento (2)
//            qryFlgAtualSaldo := TwwQuery(dtmOperacaoInvest.qryFlgAtualSaldo2);
            dtmOperacaoInvest.qryFlgAtualSaldo2.Close;
            dtmOperacaoInvest.qryFlgAtualSaldo2.Open;
            dtmOperacaoInvest.qryFlgAtualSaldo2.First;
            If dtmOperacaoInvest.qryFlgAtualSaldo2.isEmpty Then
            begin
               dtmOperacaoInvest.qryFlgAtualSaldo2.Close;
               break;
            end
            Else
            Begin
               icarteira       := dtmOperacaoInvest.qryFlgAtualSaldo2.FieldByName('IDCARTEIRAINVEST').asInteger;
               icarteiragerenc := dtmOperacaoInvest.qryFlgAtualSaldo2.FieldByName('IDCARTEIRAGERENC').asInteger;
               iInvestimento   := dtmOperacaoInvest.qryFlgAtualSaldo2.FieldByName('IDINVESTIMENTO').asInteger;
               //AL_83
               iPlanoPatro     := dtmOperacaoInvest.qryFlgAtualSaldo2.FieldByName('IDPLANPREVCTBPATR').asInteger;
               sLote           := dtmOperacaoInvest.qryFlgAtualSaldo2.FieldByName('IDLOTE').asString;
               dDataOper       := dtmOperacaoInvest.qryFlgAtualSaldo2.FieldByName('DATAMOVCARTINV').asDateTime;
               iHistorico      := dtmOperacaoInvest.qryFlgAtualSaldo2.FieldByName('IDHISTCARTINV').asInteger;
               dtmOperacaoInvest.qryAtualizaSaldoILNull.Close;
            End;
            // Busca Movimentos do Investimento, para verificar o Saldo Anterior
            fQtdeInicialInvest  := 0;          
            fValorInicialInvest := 0;
            wQtdInvestAnt       := 0;
            wSaldoAtuAnt        := 0;
            wSaldoCarAnt        := 0;
            wSaldoAquiAnt       := 0;
            wSaldoRendAnt       := 0;
            wSaldoVarAnt        := 0;
            wSaldoJurAnt        := 0;
            wSaldoVarAnt        := 0;
            wSaldoPreAnt        := 0;
            wSaldoMercadoAnt    := 0;
            wSaldoIRProvAnt     := 0;
            wSaldoIRApuAnt      := 0;
            wSaldoIOFProvAnt    := 0;
            wSaldoIOFApuAnt     := 0;
            wSaldoAgioAnt       := 0;
            //AL_77
            wSaldoProvPerdaAnt  := 0;
            //AL_2
            //AL_5
            //AL_71
            //AL_75
            //AL_78
            //AL_77
            //AL_83 - BuscaSaldos em 3 camadas
            CtrlRendaVariavel.BuscaSaldoRV.Executa(dDataOper, iPlanoPatro, iInvestimento, iCarteira, iCarteiraGerenc,
                                                   iHistorico, -1, sLote);

            fQtdeInicialInvest  := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal;
            fValorInicialInvest := CtrlRendaVariavel.BuscaSaldoRV.SaldoVlrTotal;
            wSaldoAtuAnt        := 0;
            wSaldoCarAnt        := 0;
            wSaldoAquiAnt       := CtrlRendaVariavel.BuscaSaldoRV.SaldoCusto;
            wSaldoRendAnt       := 0;
            wSaldoMercadoAnt    := 0;
            wSaldoVarAnt        := CtrlRendaVariavel.BuscaSaldoRV.SaldoVariacao;
            wSaldoJurAnt        := 0;
            wSaldoPreAnt        := 0;
            wSaldoIRProvAnt     := CtrlRendaVariavel.BuscaSaldoRV.SaldoIRProv;
            wSaldoIRApuAnt      := CtrlRendaVariavel.BuscaSaldoRV.SaldoIRApurado;
            wSaldoIOFProvAnt    := CtrlRendaVariavel.BuscaSaldoRV.SaldoIOFProv;
            wSaldoIOFApuAnt     := CtrlRendaVariavel.BuscaSaldoRV.SaldoIOFApurado;
            wSaldoAgioAnt       := 0;
            fQtdeInicialCPMF    := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCC;
            wSaldoProvPerdaAnt  := CtrlRendaVariavel.BuscaSaldoRV.SaldoProvPerda;
            //AL_83 - Fim

            wQtdInvestAnt       := fQtdeInicialInvest;
            //AL_77
            fValorInicialInvest := fValorInicialInvest + wSaldoProvPerdaAnt;

            dDataOperProx := dDataOper + 1;
            While Not DiasUteisInv.DiaUtil(dDataOperProx, -1, 1, '', True, False, False) Do
               dDataOperProx := dDataOperProx + 1; // Achar o próximo dia útil

            // Busca registros de HistCartInv que devem ter saldos atualizados
{            If iCarteiraGerenc <> 0 Then
               QryAtualizaSaldoI := TwwQuery(dtmOperacaoInvest.qryAtualizaSaldoIL)
            Else
               QryAtualizaSaldoI := TwwQuery(dtmOperacaoInvest.qryAtualizaSaldoILNull);}

            Application.ProcessMessages;   

            //AL_83 - Ini
            OperComum.LimpaParametros(dtmOperacaoInvest.qryAtualizaSaldoILNull);
            If iPlanoPatro > 0 Then
               dtmOperacaoInvest.qryAtualizaSaldoILNull.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanoPatro;
            dtmOperacaoInvest.qryAtualizaSaldoILNull.ParamByName('IDCARTEIRA').asInteger := iCarteira;
            //AL_83
{            If iCarteiraGerenc <> 0 Then
               dtmOperacaoInvest.qryAtualizaSaldoILNull.ParamByName('IDCARTEIRAGERENC').asInteger := iCarteiraGerenc;}
            dtmOperacaoInvest.qryAtualizaSaldoILNull.ParamByName('IDINVESTIMENTO').asInteger := iInvestimento;
            dtmOperacaoInvest.qryAtualizaSaldoILNull.ParamByName('DATAMOV').asString := DateToStr(dDataOper);
            dtmOperacaoInvest.qryAtualizaSaldoILNull.ParamByName('DATAMOVPROX').asString := DateToStr(dDataOperProx);
            dtmOperacaoInvest.qryAtualizaSaldoILNull.ParamByName('IDHISTORICO').asInteger := iHistorico;
            dtmOperacaoInvest.qryAtualizaSaldoILNull.Open;
            dtmOperacaoInvest.qryAtualizaSaldoILNull.First;
            //AL_83 - Fim

            // Faz enquanto Existem Saldos a Atualizar
            While Not dtmOperacaoInvest.qryAtualizaSaldoILNull.EOF Do
            Begin
               //------------------------------------------------------------------------------
               // Caso Tipo de Movimento = INI -> Inicialização Pula sem fazer nada.
               If (dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('TIPMOVCARTINV').AsString = 'INI') Then
               Begin
                  // Desmarca o Flg do Registro de INI
                  //AL_83
                  dtmOperComum.qryLocal.Close;
                  dtmOperComum.qryLocal.Sql.Clear;
                  dtmOperComum.qryLocal.Sql.Add('UPDATE HISTCARTINV SET ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.FLGCALCSALDO     = ''''');
                  dtmOperComum.qryLocal.Sql.Add('WHERE (HISTCARTINV.IDHISTCARTINV = ' +
                                                QuotedStr(dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDHISTCARTINV').AsString) + ')');
                  dtmOperComum.qryLocal.ExecSql;
                  dtmOperComum.qryLocal.Close;

                  // Pula para o Proximo Registro
                  dtmOperacaoInvest.qryAtualizaSaldoILNull.Next;
                  // Guarda Dados do Proximo Registro
                  //AL_83
                  iPlanoPatro     := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                  icarteira       := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDCARTEIRAINVEST').asInteger;
                  icarteiragerenc := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDCARTEIRAGERENC').asInteger;
                  iInvestimento   := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDINVESTIMENTO').asInteger;
                  sLote           := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDLOTE').asString;
                  dDataOper       := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('DATAMOVCARTINV').asDateTime;
                  iHistorico      := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDHISTCARTINV').asInteger;
                  // Busca Saldos Anteriores deste Registro (do INI)
                  //AL_2
                  //AL_5
                  //AL_71
                  //AL_75
                  //AL_77
                  //AL_78
                  //AL_83 - BuscaSaldos em 3 camadas                      //TESTE CGPC
                  CtrlRendaVariavel.BuscaSaldoRV.Executa(dDataOper, iPlanoPatro, iInvestimento, iCarteira, iCarteiraGerenc,
                                                         iHistorico, -1, sLote);

                  fQtdeInicialInvest  := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal;
                  fValorInicialInvest := CtrlRendaVariavel.BuscaSaldoRV.SaldoVlrTotal;
                  wSaldoAtuAnt        := wSaldoAtuAnt;
                  wSaldoCarAnt        := wSaldoCarAnt;
                  wSaldoAquiAnt       := CtrlRendaVariavel.BuscaSaldoRV.SaldoCusto;
                  wSaldoRendAnt       := wSaldoRendAnt;
                  wSaldoMercadoAnt    := wSaldoMercadoAnt;
                  wSaldoVarAnt        := CtrlRendaVariavel.BuscaSaldoRV.SaldoVariacao;
                  wSaldoJurAnt        := wSaldoJurAnt;
                  wSaldoPreAnt        := wSaldoPreAnt;
                  wSaldoIRProvAnt     := CtrlRendaVariavel.BuscaSaldoRV.SaldoIRProv;
                  wSaldoIRApuAnt      := CtrlRendaVariavel.BuscaSaldoRV.SaldoIRApurado;
                  wSaldoIOFProvAnt    := CtrlRendaVariavel.BuscaSaldoRV.SaldoIOFProv;
                  wSaldoIOFApuAnt     := CtrlRendaVariavel.BuscaSaldoRV.SaldoIOFApurado;
                  wSaldoAgioAnt       := wSaldoAgioAnt;
                  fQtdeInicialCPMF    := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCC;
                  wSaldoProvPerdaAnt  := CtrlRendaVariavel.BuscaSaldoRV.SaldoProvPerda;
                  //AL_83 - Fim

                  wQtdInvestAnt       := fQtdeInicialInvest;
                  //AL_77
                  fValorInicialInvest := fValorInicialInvest + wSaldoProvPerdaAnt;

                  // Loop
                  Continue;
               End;
               
               // Caso Data Final passada e data Maior que Final sai
               If (dDataFinal <> -1) And (dDataFinal > dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('DATAMOVCARTINV').AsDateTime) Then
               begin
                  dtmOperacaoInvest.qryAtualizaSaldoILNull.close;
                  Break;
               end;   

               // Guarda dados
               //Al_49 - 30/09/2005
               fValorVariacao     := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRVARIACAO').asFloat;
               fValorOperacao     := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRMOVCARTINV').asFloat;
               fQtdInvestOperacao := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('QTDEMOVINVCART').asFloat;
               wTipoMov           := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('TIPMOVCARTINV').AsString;
               dDataMov           := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('DATAMOVCARTINV').AsDateTime;
               cNaturezaMovimento := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('NATURMOVCARTINV').asString[1];
               wFlgCalcSaldo      := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('FLGCALCSALDO').AsString;
               fValorAgio         := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRAGIO').AsFloat;
               iTipoInvest        := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDTIPOINVEST').asInteger;
               iIdTipoDespInvest  := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDTIPODESPINVEST').asInteger;
               fValorMovimAqui    := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('MOVIMAQUI').AsFloat;
               iIdTipoOperacao    := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDTIPOOPERHIST').AsInteger;
               
               // Guarda os Valores da Operacao e de Cotas
               wVlrMovimento      := fValorOperacao;

               //------------------------------------------------------------------------------
               // CASO LUCRO OU PREJUIZO (NO INVESTIMENTO)
               If (wTipoMov = 'LUC') Then
               Begin
                  // Busca Valor da Operacao
                  OperComum.LimpaParametros(dtmOperComum.QryLucroPrejuizo);
                  dtmOperComum.QryLucroPrejuizo.ParamByName('IDOPERACAOINVEST').AsInteger :=
                                                dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDOPERACAOINVEST').AsInteger;
                  dtmOperComum.QryLucroPrejuizo.Open;

                  // Guarda Valor e Quantidade da Operacao Deste Movimento
                  wVlrMovOperacao := dtmOperComum.QryLucroPrejuizo.FieldByName('VLRMOVCARTINV').AsFloat;
                  wQtdMovOperacao := dtmOperComum.QryLucroPrejuizo.FieldByName('QTDEMOVINVCART').AsFloat;
                  
                  dtmOperComum.QryLucroPrejuizo.Close;
                                    
                  // Zera MovimAtu
                  wMovimAtu := 0;
                  wSaldoInutil := wMovimAtu;

                  // Busca Total de Despesas desta Operacao
                  OperComum.LimpaParametros(dtmOperComum.QryBuscaTotDespOper);
                  dtmOperComum.QryBuscaTotDespOper.ParamByName('IDOPERACAOINVEST').AsInteger :=
                                                   dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDOPERACAOINVEST').AsInteger;
                  dtmOperComum.QryBuscaTotDespOper.Open;

                  // Guarda Total de Despesas Da Operacao deste Movimento
                  wTotDespOper := dtmOperComum.QryBuscaTotDespOper.FieldByName('TOTVLRDESPOPER').AsFloat;

                  dtmOperComum.QryBuscaTotDespOper.Close;
                  
                  // Calcula Valor total vendido desse Investimento
                  DataCotacao := dDataOper - 1;
                  While Not DiasUteisInv.DiaUtil(DataCotacao, -1, 1, '', True, False, False) Do
                     DataCotacao := DataCotacao - 1; // Achar o dia útil anterior
                     
                  If iTipoInvest = 2 Then // RV
                     wVlrTotVendido := Round(wQtdMovOperacao * BuscaCotacaoInvest(iInvestimento, DataCotacao, True), 2)
                  Else
                     wVlrTotVendido := Trunca((wQtdMovOperacao * (Trunca(DivValorZero(fValorInicialInvest, fQtdeInicialInvest), 9))), 2);

                  wVlrMovimento := (ABS(wVlrMovOperacao) - wVlrTotVendido);

                  //AL_67 Ini
                  //AL_76 Ini
                  wVlrMovimento := ((ABS(wVlrMovOperacao) - wVlrTotVendido));
                  //AL_76 Fim
                  //AL_67 Fim

                  //AL_76
                  If Sistema.TipoCliente = 19971 Then //REFER
                  Begin
                     If (fQtdeInicialInvest - wQtdMovOperacao) = 0 Then //Venda Total
                        wVlrMovimento := (ABS(wVlrMovOperacao) - fValorInicialInvest - wTotDespOper);
                  End;

                  // Altera Valores das Variveis
                  fValorOperacao := wVlrMovimento;

                  If ((Trim(dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('FLGCALCSALDO').asString) <> '4') And
                     (((iTipoInvest = 2) And (fValorOperacao <> 0)) Or
                     ((iTipoInvest = 1) And (Abs(fValorOperacao) > 0.02)))) Then
                  Begin
                     // Muda o Separador Decimal
                     wDec := DecimalSeparator;
                     DecimalSeparator := '.';

                     // Tenta atualizar o Arquivo
                     OperComum.LimpaParametros(dtmOperComum.QryUpdHistCartInv);
                     dtmOperComum.QryUpdHistCartInv.ParamByName('VLRMOVCARTINV').AsFloat := fValorOperacao;
                     dtmOperComum.QryUpdHistCartInv.ParamByName('IDHISTCARTINV').AsInteger :=
                                                    dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDHISTCARTINV').AsInteger;
                     dtmOperComum.QryUpdHistCartInv.ExecSQL;
                     OperComum.LimpaParametros(dtmOperComum.QryUpdHistCartInv);                     

                     DecimalSeparator := wDec;

                     // Rechama a Rotina de Atualizar os Saldos
                     AtualizaSaldos(fValorPrimeiraCota, -1);

                     OperComum.LimpaParametros(dtmOperacaoInvest.qryAtualizaSaldoILNull);

                     FreeAndNil(CtrlRendaVariavel);
                     // Sai da Rotina
                     Exit;
                  End
                  Else
                     wTipoAtualizacao := '';
               End;
               //------------------------------------------------------------------------------
               // Definição dos Saldos Finais
               Case cNaturezaMovimento Of
                  'A': // Aumenta quantidade
                     Begin
                        //AL_11 Ini
                        If ((iIdTipoOperacao = -110) Or (iIdTipoOperacao = -111) Or
                           (iIdTipoOperacao = -112) Or (iIdTipoOperacao = -113)) Then // Operações de Acerto de Custo
                        Begin
                           fQtdeFinalInvest  := fQtdeInicialInvest;
                           fValorFinalInvest := fValorInicialInvest;
                           fQtdeFinalCPMF    := fQtdeInicialCPMF;
                        End
                        Else
                        Begin
                           fQtdeFinalInvest  := fQtdeInicialInvest + fQtdInvestOperacao;
                           //AL_5
                           If dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('FLGCONTAINVEST').AsInteger = 1 Then
                              fQtdeFinalCPMF := fQtdeInicialCPMF
                           Else
                              fQtdeFinalCPMF := fQtdeInicialCPMF + fQtdInvestOperacao;

                           fValorFinalInvest := fValorInicialInvest + fValorOperacao;
                        End;
                        //AL_11 Fim
                     End;
                  'C': // Diminui o valor
                     Begin
                        //AL_5
                        If (dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('TIPOOPERACAO').AsInteger = -17) Or // Pagamento de Juros
                           (dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('TIPOOPERACAO').AsInteger = -18) Then // Amortizacao de Principal
                        Begin
                           fQtdeFinalInvest := fQtdeInicialInvest;
                           fValorFinalInvest := fValorInicialInvest - fValorOperacao;
                        End
                        Else If dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('TIPOOPERACAO').AsInteger = -19 Then // Incorporacao de Juros
                        Begin
                           fQtdeFinalInvest := fQtdeInicialInvest;
                           fValorFinalInvest := fValorInicialInvest;
                        End;
                        fQtdeFinalCPMF := fQtdeInicialCPMF;
                     End;
                  'D': // Diminui quantidade  (venda)  ** fValorOPeração já foi gravado negativo
                     Begin
                        //AL_11 Ini
                        If ((iIdTipoOperacao = -110) Or (iIdTipoOperacao = -111) Or
                           (iIdTipoOperacao = -112) Or (iIdTipoOperacao = -113)) Then // Operações de Acerto de Custo
                        Begin
                           fQtdeFinalInvest := fQtdeInicialInvest;
                           fValorFinalInvest := fValorInicialInvest;
                           fQtdeFinalCPMF := fQtdeInicialCPMF;
                        End
                        Else
                        Begin
                           fQtdeFinalInvest := fQtdeInicialInvest - fQtdInvestOperacao;
                           //AL_5
                           If dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('FLGCONTAINVEST').AsInteger = 1 Then
                              fQtdeFinalCPMF := fQtdeInicialCPMF
                           Else
                              fQtdeFinalCPMF := fQtdeInicialCPMF - fQtdInvestOperacao;

                           If iTipoInvest = 8 Then
                              fQtdeFinalInvest := fQtdeInicialInvest + fQtdInvestOperacao;

                           fValorFinalInvest := fValorInicialInvest + fValorOperacao;
                        End;
                        //AL_11 Fim
                     End;
                  'G', 'P': // Aumento da Cotacao do Investimento (GANHO/PERDA)
                     Begin
                        fQtdeFinalInvest := fQtdeInicialInvest;
                        //AL_5
                        fQtdeFinalCPMF := fQtdeInicialCPMF;
                        fValorFinalInvest := fValorInicialInvest + fValorOperacao;
                     End;
                  'L': // LUCRO Nao Altera saldos
                     Begin
                        fQtdeFinalInvest := fQtdeInicialInvest;
                        //AL_5
                        fQtdeFinalCPMF := fQtdeInicialCPMF;
                        // AL_31 - 25/04/2005
                        fValorFinalInvest := fValorInicialInvest + fValorOperacao;
                     End;
                  // ACRESCIMO DE VALOR, BAIXA PARCIAL
                  'M', 'I':
                     Begin
                        // Nao Altera Qtd de Investimento
                        fQtdeFinalInvest := fQtdeInicialInvest;
                        //AL_5
                        fQtdeFinalCPMF := fQtdeInicialCPMF;
                        fValorFinalInvest := fValorInicialInvest + fValorOperacao;
                     End;
                  // Despesas
                  'E':
                     Begin
                        // Guarda a Natureza da Operacao
                        cNaturezaOPeracao := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('NATURMOVOPER').AsString[1];
                        // AL_31 - 25/04/2005
                        // AL_69
                        If (cNaturezaOPeracao = 'D') And (Sistema.TipoCliente = 19991) Then //FUNCEF)
                           fValorFinalInvest := fValorInicialInvest
                        Else
                           fValorFinalInvest := fValorInicialInvest + fValorOperacao;

                        fQtdeFinalInvest := fQtdeInicialInvest;
                        fQtdeFinalCPMF := fQtdeInicialCPMF;
                        //AL_5
                        // AL_31 - Fim
                     End;
                  'U': // Aumenta quantidade para Opções
                     Begin
                        fQtdeFinalInvest := fQtdeInicialInvest + fQtdInvestOperacao;
                        //AL_5
                        If dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('FLGCONTAINVEST').AsInteger = 1 Then
                           fQtdeFinalCPMF := fQtdeInicialCPMF
                        Else
                           fQtdeFinalCPMF := fQtdeInicialCPMF + fQtdInvestOperacao;

                        fValorFinalInvest := fValorInicialInvest + fValorOperacao
                     End;
                  'O': // Diminui quantidade para Opções
                     Begin
                        fQtdeFinalInvest := fQtdeInicialInvest - fQtdInvestOperacao;
                        //AL_5
                        If dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('FLGCONTAINVEST').AsInteger = 1 Then
                           fQtdeFinalCPMF := fQtdeInicialCPMF
                        Else
                           fQtdeFinalCPMF := fQtdeInicialCPMF - fQtdInvestOperacao;

                        fValorFinalInvest := fValorInicialInvest - fValorOperacao
                     End;
                  'F': // MANTEM a quantidade da OPERACAO(GRUPAMENTO/DESDOBRAMENTO)
                     Begin
                        //Ricardo Cristiano - 21/07/2009 - N. Sol 122235 -  N. Kintana 597042
                        //AL_109
                        //AL_48 Ini
                        If ((Not ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirDes) Or (iIdTipoOperacao = CtrlPInv.IdTipoOperDirDes + 10000))) And
                                  (VerificaGrupamentoAnterior(iInvestimento, iCarteira, iCarteiraGerenc, iHistorico,
                                                              CtrlPInv.IdTipoOperDirGru, CtrlPInv.IdTipoOperDirGru + 10000,
                                                              DateToStr(dDataOper), iPlanoPatro))) Then
                           fQtdeFinalInvest := fQtdInvestOperacao + fQtdeInicialInvest
                        Else If ((Not ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirGru) Or (iIdTipoOperacao = CtrlPInv.IdTipoOperDirGru + 10000))) And
                                       (VerificaDesdobramentoAnterior(iInvestimento, iCarteira, iCarteiraGerenc, iHistorico,
                                                                      CtrlPInv.IdTipoOperDirDes, CtrlPInv.IdTipoOperDirDes + 10000,
                                                                      DateToStr(dDataOper), iPlanoPatro))) Then
                           fQtdeFinalInvest := fQtdInvestOperacao + fQtdeInicialInvest
                        Else
                           fQtdeFinalInvest := fQtdInvestOperacao;

                        //AL_48 Fim
                        //AL_5
                        fQtdeFinalCPMF := fQtdeInicialCPMF;
                        fValorFinalInvest := fQtdInvestOperacao * (fValorInicialInvest / fQtdInvestOperacao);
                        If fValorFinalInvest = 0 Then
                           fValorFinalInvest := fQtdInvestOperacao * (fValorOperacao / fQtdInvestOperacao);
                     End
                  Else
                  Begin
                     fQtdeFinalInvest  := fQtdeInicialInvest;
                     //AL_5
                     fQtdeFinalCPMF    := fQtdeInicialCPMF;
                     fValorFinalInvest := fValorInicialInvest;
                     //AL_92
                     //Verifica se e uma opercao de Restituição de Capital
                     //AL_109
                     If ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirRes) Or (iIdTipoOperacao = CtrlPInv.IdTipoOperDirRes + 10000)) Then
                        fValorFinalInvest := fValorInicialInvest - fValorOperacao;
                  End;
               End; // Fim do Case

               wCotaMoeda := 1;
               // Caso Seja uma Atualizacao Nao mexe nos Saldos Atuariais, Carregamento e
               // Aquisicao
               If (wTipoMov <> 'ATU') Then
               Begin
                  wMovimAtu := 0;
                  //AL_33 - 25/04/2005
                  // Caso Movimento R(RECEBIMENTO), A(COMPRA),D(VENDA) ou despesas de A/D, Calcula Movimento e Saldo Atuarial
                  If (cNaturezaMovimento = 'R') Or (cNaturezaMovimento = 'A') Or (cNaturezaMovimento = 'D') Or
                     ((cNaturezaMovimento = 'E') And ((cNaturezaOperacao = 'A') Or (cNaturezaOperacao = 'D'))) Then
                     wMovimAtu := (fValorOperacao / wCotaMoeda);

                  wMovimAgio := 0;

                  //AL_11 - Carrega as variáveis antes do tratamento
                  // Inicia Custo de Carregamento e Custo de Aquisicao, Variação, Juros e Prêmio
                  wMovimCar := 0;
                  wMovimAqui := 0;
                  wMovimVar := 0;
                  wMovimJur := 0;
                  wMovimPre := 0;
                  wMovimIRProv := 0;
                  wMovimIRApu := 0;
                  wMovimIOFProv := 0;
                  wMovimIOFApu := 0;
                  //AL_11 - Fim

                  // Caso Movimento A(COMPRA), Atualiza Saldo de Agio
                  If (cNaturezaMovimento = 'A') Or (cNaturezaMovimento = 'D') Or
                    ((cNaturezaMovimento = 'E') And ((cNaturezaOperacao = 'A') Or(cNaturezaOperacao = 'D'))) Then
                  Begin
                     wMovimAgio := fValorAgio;
                     //AL_11
                     // Operações de Acerto de Custo
                     If ((iIdTipoOperacao = -110) Or (iIdTipoOperacao = -111) Or (iIdTipoOperacao = -112) Or (iIdTipoOperacao = -113)) Then
                     Begin
                        If cNaturezaMovimento = 'A' Then
                           // Se aumenta o Custo, a variação diminui
                           wMovimVar := Abs(fValorOperacao) * -1
                        Else If cNaturezaMovimento = 'D' Then
                           wMovimVar := Abs(fValorOperacao);
                     End;
                     //AL_11 - Fim
                  End;
                  //Al_32 - 25/04/2005
                  // Caso Movimento O/U(OPCOES) ou despesas de O/U,
                  // Calcula Movimento e Saldo Atuarial
                  If (cNaturezaMovimento = 'O') Or (cNaturezaMovimento = 'U') Or
                     ((cNaturezaMovimento = 'E') And ((cNaturezaOperacao = 'O') Or (cNaturezaOperacao = 'U'))) Then
                     wMovimAtu := ((fValorOperacao / wCotaMoeda) * -1);

                  If (cNaturezaMovimento = 'C') Then
                  Begin
                     If (dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('TIPOOPERACAO').AsInteger = -17) Or // Pagamento de Juros
                        (dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('TIPOOPERACAO').AsInteger = -19) Then // Incorporação de Juros
                        wMovimJur := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRJUROS').asFloat
                     Else
                        wMovimJur := ((fQtdInvestOperacao * (wSaldoJurAnt / wQtdInvestAnt)) * -1);
                  End
                  Else If (cNaturezaMovimento = 'D') Then // Caso seja uma DIMINUIÇÃO (D)
                  Begin
                     // Carregamento é igual a Negativo de (QUANTIDADE DA OPERACAO * CUSTO DE CARREGAMENTO MEDIO ANTERIOR)
                     wMovimCar := ((fQtdInvestOperacao * DivValorZero(wSaldoCarAnt, wQtdInvestAnt)) * -1);
                     // Variacao, Juros e Premio (Baixa pela Media)
                     //AL_11
                     If ((iIdTipoOperacao = -110) Or (iIdTipoOperacao = -111) Or
                        (iIdTipoOperacao = -112)  Or (iIdTipoOperacao = -113)) Or // Operações de Acerto de Custo
                        (iIdTipoOperacao = -125) Then  //AL_50
                     Begin
                        If cNaturezaMovimento = 'A' Then
                        Begin
                           // Se aumenta o Custo, a variação diminui
                           wMovimVar := Abs(fValorOperacao) * -1;
                           wMovimAqui := Abs(fValorOperacao);
                        End
                        Else If cNaturezaMovimento = 'D' Then
                        Begin
                           wMovimVar := Abs(fValorOperacao);
                           wMovimAqui := Abs(fValorOperacao) * -1;
                        End;
                     End
                     Else
                     Begin
                        // Custo de Aquisicao é igual a Negativo de (QUANTIDADE DA OPERACAO * CUSTO DE AQUISICAO MEDIO ANTERIOR)
                        wMovimVar := ((fQtdInvestOperacao * DivValorZero(wSaldoVarAnt, wQtdInvestAnt)) * -1);

                        // VERIFICAR PERDA DE PRECISAO POR CAUSA DO CAMPO NA HISTCARTINV COM SOMENTE DUAS CASAS DECIMAIS
                        //    SOBRA SEMPRE ALGUNS CENTAVOS E O SALDO DE CUSTO DIMINUI NA VENDA
                        //AL_42 (Retirar o comentário acima depois dos teste)
                        wMovimAqui := RoundCM(((fQtdInvestOperacao * DivValorZero(wSaldoAquiAnt, wQtdInvestAnt)) * -1), 2);
                     End;

                     //AL_11 Fim
                     wMovimJur := ((fQtdInvestOperacao * DivValorZero(wSaldoJurAnt, wQtdInvestAnt)) * -1);
                     wMovimPre := ((fQtdInvestOperacao * DivValorZero(wSaldoPreAnt, wQtdInvestAnt)) * -1);
                     wMovimIRProv := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRIRPROV').asFloat;
                     wMovimIRApu := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRIRAPU').asFloat;
                     wMovimIOFProv := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRIOFPROV').asFloat;
                     wMovimIOFApu := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRIOFAPU').asFloat;
                     // BM&F Venda e e Ajuste Positivo ou Negatis
                     If (iTipoInvest = 8) Then // BM&F Venda
                        wMovimAqui := fValorOperacao;

                  End
                  Else If ((cNaturezaMovimento = 'A') Or // Caso Compra(A) Ou despesa de Compra
                          ((cNaturezaMovimento = 'E') And (cNaturezaOperacao = 'A') And (iTipoInvest <> 8)) Or
                          ((cNaturezaMovimento = 'E') And (iTipoInvest = 8) And ((iIdTipoDespInvest = -20) Or (iIdTipoDespInvest = -21)))) Then
                  Begin
                     // Juros é igual ao Carregamento
                     wMovimCar := DivValorZero(fValorOperacao, wCotaMoeda);
                     //AL_32 - 25/04/2005
                     // AL_35
                     // AL_56
                     //AL_109
                     If ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirAlt) Or (iIdTipoOperacao = (CtrlPInv.IdTipoOperDirAlt + 10000))) Or
                        ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirInc) Or (iIdTipoOperacao = (CtrlPInv.IdTipoOperDirInc + 10000))) Then
                     Begin
                        Application.ProcessMessages;
                        // O Custo de aquisição é o mesmo que saíu na origem
                        // AL_57 - Capta a variação tb - INI
                        dtmOperComum.QryLocal.Close;
                        dtmOperComum.QryLocal.SQL.Clear;
                        // AL_58
                        dtmOperComum.QryLocal.SQL.Add('SELECT HISTCARTINV.MOVIMAQUI, HISTCARTINV.VLRVARIACAO ');
                        dtmOperComum.QryLocal.SQL.Add('FROM HISTCARTINV ');
                        dtmOperComum.QryLocal.SQL.Add('WHERE HISTCARTINV.IDOPERACAOINVEST IN ');
                        dtmOperComum.QryLocal.SQL.Add('          (SELECT OPERACAOINVEST.IDOPERACAOINVEST ');
                        dtmOperComum.QryLocal.SQL.Add('           FROM OPERACAOINVEST ');
                        dtmOperComum.QryLocal.SQL.Add('           WHERE (OPERACAOINVEST.IDOPERACAODIREITO || OPERACAOINVEST.IDTIPOOPERACAO) = ');
                        dtmOperComum.QryLocal.SQL.Add('                    (SELECT   OI.IDOPERACAODIREITO || OI.IDTIPOOPERACAO ');
                        dtmOperComum.QryLocal.SQL.Add('                     FROM OPERACAOINVEST OI');
                        dtmOperComum.QryLocal.SQL.Add('                     WHERE OI.IDOPERACAOINVEST = ' + dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDOPERACAOINVEST').AsString + ') ');
                        dtmOperComum.QryLocal.SQL.Add('             AND OPERACAOINVEST.ORIGDEST NOT IN ');
                        dtmOperComum.QryLocal.SQL.Add('                    (SELECT OD.ORIGDEST ');
                        dtmOperComum.QryLocal.SQL.Add('                     FROM OPERACAOINVEST OD');
                        dtmOperComum.QryLocal.SQL.Add('                     WHERE OD.IDOPERACAOINVEST = ' + dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDOPERACAOINVEST').AsString + ') ');
                        // AL_74 - Buscar o mesmo custodiante e o motivo de bloqueio da operacão destino
                        dtmOperComum.QryLocal.SQL.Add('             AND NVL(OPERACAOINVEST.IDCUSTODIANTE,0) = ');
                        dtmOperComum.QryLocal.SQL.Add('                    (SELECT NVL(OC.IDCUSTODIANTE,0) ');
                        dtmOperComum.QryLocal.SQL.Add('                     FROM OPERACAOINVEST OC');
                        dtmOperComum.QryLocal.SQL.Add('                     WHERE OC.IDOPERACAOINVEST = ' + dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDOPERACAOINVEST').AsString + ') ');
                        dtmOperComum.QryLocal.SQL.Add('             AND NVL(OPERACAOINVEST.IDMOTIVOBLOQUEIO,0) = ');
                        dtmOperComum.QryLocal.SQL.Add('                    (SELECT NVL(OM.IDMOTIVOBLOQUEIO,0) ');
                        dtmOperComum.QryLocal.SQL.Add('                     FROM OPERACAOINVEST OM');
                        dtmOperComum.QryLocal.SQL.Add('                     WHERE OM.IDOPERACAOINVEST = ' + dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDOPERACAOINVEST').AsString + ') ');
                        //AL_83
                        dtmOperComum.QryLocal.SQL.Add('             AND OPERACAOINVEST.IDPLANPREVCTBPATR = ');
                        dtmOperComum.QryLocal.SQL.Add('                    (SELECT OP.IDPLANPREVCTBPATR ');
                        dtmOperComum.QryLocal.SQL.Add('                     FROM OPERACAOINVEST OP');
                        dtmOperComum.QryLocal.SQL.Add('                     WHERE OP.IDOPERACAOINVEST = ' + dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDOPERACAOINVEST').AsString + ') ');
                        dtmOperComum.QryLocal.SQL.Add('             AND OPERACAOINVEST.IDCARTEIRAINVEST = ');
                        dtmOperComum.QryLocal.SQL.Add('                    (SELECT OCI.IDCARTEIRAINVEST ');
                        dtmOperComum.QryLocal.SQL.Add('                     FROM OPERACAOINVEST OCI');
                        dtmOperComum.QryLocal.SQL.Add('                     WHERE OCI.IDOPERACAOINVEST = ' + dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDOPERACAOINVEST').AsString + ') ');
                        dtmOperComum.QryLocal.SQL.Add('             AND NVL(OPERACAOINVEST.IDCARTEIRAGERENC,0) = ');
                        dtmOperComum.QryLocal.SQL.Add('                    (SELECT NVL(OCG.IDCARTEIRAGERENC,0) ');
                        dtmOperComum.QryLocal.SQL.Add('                     FROM OPERACAOINVEST OCG');
                        dtmOperComum.QryLocal.SQL.Add('                     WHERE OCG.IDOPERACAOINVEST = ' + dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDOPERACAOINVEST').AsString + ')) ');
                        dtmOperComum.QryLocal.Open;
                        wMovimAqui := dtmOperComum.QryLocal.FieldByName('MOVIMAQUI').AsFloat * -1;
                        //AL_72
                        //AL_109
                        //Ricardo Cristiano - 22/10/2009 - N. Sol 125777 -  N. Kintana 652392
                        if ((Sistema.TipoCliente = 19991) and (cNaturezaMovimento = 'A') and
                           ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirInc) or
                            (iIdTipoOperacao = (CtrlPInv.IdTipoOperDirInc + 10000)))) then
                           wMovimVar := 0
                        Else
                           wMovimVar := dtmOperComum.QryLocal.FieldByName('VLRVARIACAO').AsFloat * -1;
                        // AL_57 - Capta a variação tb - FIM
                        dtmOperComum.QryLocal.Close;
                        dtmOperComum.QryLocal.SQL.Clear;
                     End
                     Else // AL_60 - Ini
                        //AL_109
                        If (iIdTipoOperacao = CtrlPInv.IdTipoOperDirCis) Or (iIdTipoOperacao = (CtrlPInv.IdTipoOperDirCis + 10000)) Or
                           (iIdTipoOperacao = -127) Or (iIdTipoOperacao = -10127) Then
                        Begin
                           dtmOperComum.QryLocal.Close;
                           dtmOperComum.QryLocal.SQL.Clear;
                           // AL_58
                           // Operações de Cisão
                           dtmOperComum.QryLocal.SQL.Add('SELECT HISTCARTINV.MOVIMAQUI, HISTCARTINV.VLRVARIACAO ');
                           dtmOperComum.QryLocal.SQL.Add('FROM HISTCARTINV ');
                           dtmOperComum.QryLocal.SQL.Add('WHERE HISTCARTINV.IDOPERACAOINVEST = ' + dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDOPERACAOINVEST').AsString);
                           dtmOperComum.QryLocal.Open;
                           wMovimAqui := dtmOperComum.QryLocal.FieldByName('MOVIMAQUI').AsFloat;
                           wMovimVar  := dtmOperComum.QryLocal.FieldByName('VLRVARIACAO').AsFloat;
                           OperComum.LimpaParametros(dtmOperComum.qryLocal);                           
                        End
                        // AL_60 - Fim
                        // Al_49 - 30/09/2005
                     Else
                        If ((iIdTipoOperacao = -93) And (fValorMovimAqui <> 0)) Then // Operações de Acerto de Custo
                           wMovimAqui := fValorMovimAqui
                        Else
                           wMovimAqui := fValorOperacao;

                     // AL_35 - Fim
                     If (iTipoInvest = 8) Then // BM&F
                        wMovimIRApu := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRIRAPU').asFloat;

                     //AL_52 Ini
                     //Al_49 - 30/09/2005
                     If iIdTipoOperacao = -93 Then
                     Begin
                        If fValorVariacao <> 0 Then // Operações de Acerto de Custo
                           wMovimVar := fValorVariacao
                        Else
                           wMovimVar := ((fQtdInvestOperacao * DivValorZero(wSaldoVarAnt, wQtdInvestAnt)));
                     End
                        //AL_50
                     Else If (iIdTipoOperacao = -124) Then
                        wMovimVar := fValorOperacao;
                     //AL_52 Fim
                  End
                     // Caso despesa de Venda e Compra de BMF
                  Else If ((cNaturezaMovimento = 'E') And (iTipoInvest = 8) And ((iIdTipoDespInvest = -20) Or (iIdTipoDespInvest = -21))) Then
                      wMovimAqui := fValorOperacao
                     // AL_31 - 22/04/2005 - Afeta o Custo só na compra
                  Else If (cNaturezaMovimento = 'E') And (cNaturezaOperacao = 'A') Then
                     wMovimAqui := fValorOperacao
                     // AL_76 - 20/06/2006 - Se Refer, Afeta o Custo na Venda
                  Else If (cNaturezaMovimento = 'E') And (cNaturezaOperacao = 'D') And (Sistema.TipoCliente <> 19991) Then //<> FUNCEF //(Sistema.NomeEmpresa = 'FUNDAÇÃO REFER') then // REFER
                     wMovimAqui := fValorOperacao
                     //AL_33 - 25/04/2005
                  Else If (cNaturezaMovimento = 'R') Then
                  Begin
                     //Verifica se e uma opercao de Restituição de Capital
                     //AL_109
                     If ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirRes) Or (iIdTipoOperacao = CtrlPInv.IdTipoOperDirRes + 10000)) Then
                        wMovimAqui := ABS(fValorOperacao) * -1;
                  End;
                  // AL_31 - Fim
                  // Caso Movimento O/U(OPCOES) ou despesas de O/U,
                  // Calcula Premio
                  If (cNaturezaMovimento = 'O') Or (cNaturezaMovimento = 'U') Then
                  Begin
                     // Premio (Valor da Operacao)
                     If iIdTipoOperacao = -69 Then // Baixa de Opções
                     Begin
                        If cNaturezaMovimento = 'O' Then
                        Begin
                           wMovimPre := wSaldoPreAnt;
                           wMovimAqui := wSaldoAquiAnt;
                        End
                        Else
                        Begin
                           wMovimPre := wSaldoPreAnt * -1;
                           wMovimAqui := wSaldoAquiAnt * -1;
                        End;
                     End
                     Else
                     Begin
                        If cNaturezaMovimento = 'U' Then // Compra Opção
                        Begin
                           wMovimPre := fValorOperacao;
                           wMovimAqui := fValorOperacao;
                        End
                        Else If cNaturezaMovimento = 'O' Then // Venda Opção
                        Begin
                           wMovimPre := fValorOperacao * -1;
                           wMovimAqui := fValorOperacao * -1;
                        End;
                     End;
                  End;
               End
               Else
               Begin
                  // Caso Atualização, Apaga os Movimentos e Repete os Saldos
                  wMovimAtu     := 0;
                  wMovimAqui    := 0;
                  wMovimCar     := 0;
                  wMovimVar     := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRVARIACAO').asFloat;
                  wMovimJur     := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRJUROS').asFloat;
                  wMovimIRProv  := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRIRPROV').asFloat;
                  wMovimIRApu   := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRIRAPU').asFloat;
                  wMovimIOFProv := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRIOFPROV').asFloat;
                  wMovimIOFApu  := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRIOFAPU').asFloat;
                  wMovimAgio    := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRAGIO').asFloat;
                  wSaldoAtu     := wSaldoAtuAnt;
               End;

               //------------------------------------------------------------------------------
               // CASO SEJA TRANSFERENCIA (NO INVESTIMENTO)
               If (wTipoMov = 'TRF') Then
               Begin
                  // Caso Diminua (D)
                  If (cNaturezaMovimento = 'D') Then
                  Begin
                     // Atuarial, Custo de Carregamento e Aquisicao com o Anterior *-1)
                     wMovimAtu := ((fQtdInvestOperacao * DivValorZero(wSaldoAtuAnt, wQtdInvestAnt)) * -1);
                     wMovimCar := ((fQtdInvestOperacao * DivValorZero(wSaldoCarAnt, wQtdInvestAnt)) * -1);
                     //AL_42 Ini
                     wMovimAqui := RoundCM(((fQtdInvestOperacao * DivValorZero(wSaldoAquiAnt, wQtdInvestAnt)) * -1), 2);
                     wMovimVar := RoundCM(((fQtdInvestOperacao * DivValorZero(wSaldoVarAnt, wQtdInvestAnt)) * -1), 2);
                     //AL_42 Fim
                     wMovimJur := ((fQtdInvestOperacao * DivValorZero(wSaldoJurAnt, wQtdInvestAnt)) * -1);
                     wMovimPre := ((fQtdInvestOperacao * DivValorZero(wSaldoPreAnt, wQtdInvestAnt)) * -1);
                     wMovimIRProv := ((fQtdInvestOperacao * DivValorZero(wSaldoIRProvAnt, wQtdInvestAnt)) * -1);
                     wMovimIRApu := ((fQtdInvestOperacao * DivValorZero(wSaldoIRApuAnt, wQtdInvestAnt)) * -1);
                     wMovimIOFProv := ((fQtdInvestOperacao * DivValorZero(wSaldoIOFProvAnt, wQtdInvestAnt)) * -1);
                     wMovimIOFApu := ((fQtdInvestOperacao * DivValorZero(wSaldoIOFApuAnt, wQtdInvestAnt)) * -1);
                     wMovimAgio := ((fQtdInvestOperacao * DivValorZero(wSaldoAgioAnt, wQtdInvestAnt)) * -1);
                  End;
                  // Caso Diminua (A)
                  If (cNaturezaMovimento = 'A') Then
                  Begin
                     Application.ProcessMessages;
                     dtmOperComum.qryLocal.Close;
                     dtmOperComum.qryLocal.Sql.Clear;
                     dtmOperComum.qryLocal.Sql.Add('SELECT  H1.MOVIMAQUI, H1.MOVIMCAR, H1.MOVIMATU, H1.VLRVARIACAO, H1.VLRJUROS, H1.VLRPREMIO, ');
                     dtmOperComum.qryLocal.Sql.Add('        H1.VLRIRPROV, H1.VLRIRAPU, H1.VLRIOFPROV, H1.VLRIOFAPU, H1.VLRAGIO, H1.QTDEMOVINVCART ');
                     dtmOperComum.qryLocal.Sql.Add('FROM HISTCARTINV H1 ');
                     dtmOperComum.qryLocal.Sql.Add('WHERE   (H1.TIPMOVCARTINV    = ''TRF'') AND ');
                     dtmOperComum.qryLocal.Sql.Add('        (H1.NATURMOVCARTINV  = ''D'')   AND ');
                     dtmOperComum.qryLocal.Sql.Add('        (H1.IDOPERACAOINVEST = ');
                     dtmOperComum.qryLocal.Sql.Add('        (SELECT MIN(O1.IDOPERACAOINVEST) ');
                     dtmOperComum.qryLocal.Sql.Add('         FROM  OPERACAOINVEST O1 ');
                     dtmOperComum.qryLocal.Sql.Add('         WHERE (O1.IDOPERACAODIREITO = ');
                     dtmOperComum.qryLocal.Sql.Add('               (SELECT O2.IDOPERACAODIREITO ');
                     dtmOperComum.qryLocal.Sql.Add('                FROM OPERACAOINVEST O2 ');
                     dtmOperComum.qryLocal.Sql.Add('                WHERE (O2.IDOPERACAOINVEST = ' +
                                             QuotedStr(dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDOPERACAOINVEST').AsString) + ')))))');
                     dtmOperComum.qryLocal.Open;

                     // Percentual informado em OperacaoInvest para Rateio de Custo no caso de Cisão.
                     //AL_109
                     If dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('TIPOOPERACAO').asInteger = CtrlPInv.IdTipoOperDirCis Then
                     Begin
                        dtmOperComum.qryLocal1.Close;
                        dtmOperComum.qryLocal1.Sql.Clear;
                        dtmOperComum.qryLocal1.Sql.Add('SELECT OPERACAOINVEST.PERCENTUAL      ');
                        dtmOperComum.qryLocal1.Sql.Add('FROM OPERACAOINVEST  ');
                        dtmOperComum.qryLocal1.Sql.Add('WHERE (OPERACAOINVEST.IDOPERACAOINVEST = ' +
                                 QuotedStr(dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDOPERACAOINVEST').AsString) + ') ');
                        dtmOperComum.qryLocal1.Open;

                        //AL_42
                        wMovimAqui := RoundCM((dtmOperComum.QryLocal1.FieldByName('PERCENTUAL').AsFloat / 100 *
                                              (fQtdInvestOperacao *  DivValorZero(dtmOperComum.QryLocal.FieldByName('MOVIMAQUI').AsFloat,
                                                                                  dtmOperComum.QryLocal.FieldByName('QTDEMOVINVCART').AsFloat)) * -1), 2);
                        dtmOperComum.QryLocal1.Close;                                                                                  
                     End
                     Else
                        wMovimAqui := (dtmOperComum.QryLocal.FieldByName('MOVIMAQUI').AsFloat * -1);

                     // Atuarial, Custo de Carregamento e Aquisicao com o Anterior *-1)
                     wMovimAtu     := (dtmOperComum.QryLocal.FieldByName('MOVIMATU').AsFloat * -1);
                     wMovimCar     := (dtmOperComum.QryLocal.FieldByName('MOVIMCAR').AsFloat * -1);
                     wMovimVar     := (dtmOperComum.QryLocal.FieldByName('VLRVARIACAO').AsFloat * -1);
                     wMovimJur     := (dtmOperComum.QryLocal.FieldByName('VLRJUROS').AsFloat * -1);
                     wMovimPre     := (dtmOperComum.QryLocal.FieldByName('VLRPREMIO').AsFloat * -1);
                     wMovimIRProv  := (dtmOperComum.QryLocal.FieldByName('VLRIRPROV').AsFloat * -1);
                     wMovimIRApu   := (dtmOperComum.QryLocal.FieldByName('VLRIRAPU').AsFloat * -1);
                     wMovimIOFProv := (dtmOperComum.QryLocal.FieldByName('VLRIOFPROV').AsFloat * -1);
                     wMovimIOFApu  := (dtmOperComum.QryLocal.FieldByName('VLRIOFAPU').AsFloat * -1);
                     wMovimAgio    := (dtmOperComum.QryLocal.FieldByName('VLRAGIO').AsFloat * -1);
                     dtmOperComum.QryLocal.Close;;
                     dtmOperComum.QryLocal1.Close;
                  End;
               End;

               //------------------------------------------------------------------------------
               // CASO SEJA TRANSFERENCIA DE CARTEIRAS (NO INVESTIMENTO)
               //AL_82
               If ((wTipoMov = 'TRC') Or (wTipoMov = 'TRP')) Then
               Begin
                  //AL_82
                  If wTipoMov = 'TRC' Then
                     iHistorico := iIdHistCartInvTRC;

                  //AL_2
                  //AL_5
                  //AL_71
                  //AL_75
                  //AL_78
                  //AL_77
                  //AL_82
                  //AL_83 - BuscaSaldos em 3 camadas
                  CtrlRendaVariavel.BuscaSaldoRV.Executa(dDataOper, iPlanoPatro, iInvestimento, iCarteira, iCarteiraGerenc,
                                                         iHistorico , -1, sLote);
                  fSaldoQtd  := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal;
                  fSaldoVlr  := CtrlRendaVariavel.BuscaSaldoRV.SaldoVlrTotal;
                  fSdoAtu    := 0;
                  fSdoCar    := 0;
                  fSaldoAqui := CtrlRendaVariavel.BuscaSaldoRV.SaldoCusto;
                  fSaldoRend := 0;
                  fSaldoVariacao := CtrlRendaVariavel.BuscaSaldoRV.SaldoVariacao;
                  fSaldoIrApu    := CtrlRendaVariavel.BuscaSaldoRV.SaldoIRApurado;
                  fSaldoPP       := CtrlRendaVariavel.BuscaSaldoRV.SaldoProvPerda;
                  //AL_83 - Fim

                  //AL_77
                  fSaldoVlr := fSaldoVlr + fSaldoPP;

                  // Diminue
                  If (cNaturezaMovimento = 'D') Then
                  Begin
                     wMovimAqui  := Round(DivValorZero((fQtdInvestOperacao * fSaldoAqui), fSaldoQtd), 2) * -1;
                     wMovimAtu   := Round(DivValorZero((fQtdInvestOperacao * fSdoAtu), fSaldoQtd), 2) * -1;
                     wMovimCar   := Round(DivValorZero((fQtdInvestOperacao * fSdoCar), fSaldoQtd), 2) * -1;
                     wMovimVar   := Round(DivValorZero((fQtdInvestOperacao * fSaldoVariacao), fSaldoQtd), 2) * -1;
                     wMovimIRApu := Round(DivValorZero((fQtdInvestOperacao * fSaldoIrApu), fSaldoQtd), 2) * -1;
                     wSaldoRend  := Round(DivValorZero(((fSaldoQtd - fQtdInvestOperacao) * fSaldoRend), fSaldoQtd), 2);
                  End;
                  // Aumenta
                  If (cNaturezaMovimento = 'A') Then
                  Begin
                     wMovimAqui  := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('MOVIMAQUI').asFloat;
                     wMovimVar   := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRVARIACAO').asFloat;
                     wMovimIRApu := dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('VLRIRAPU').asFloat;
                     wMovimAtu   := 0;
                     wMovimCar   := 0;
                     wSaldoRend  := 0;
                  End;
               End;

               // Caso Movimento seja de Rendimento Zera o Movimento de Aquisicao e Acumula Rendimento
               If (wTipoMov <> 'TRC') Then
               Begin
                  If (cNaturezaMovimento = 'R') Then
                  Begin
                     wSaldoRend := wSaldoRendAnt + fValorOperacao;
                     //AL_33 - 25/04/2005
                     //AL_109
                     If Not ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirRes) Or
                             (iIdTipoOperacao = CtrlPInv.IdTipoOperDirRes + 10000)) Then
                     Begin
                        wMovimAqui := 0;
                        wMovimCar := 0;
                     End;
                  End
                  Else
                     wSaldoRend := wSaldoRendAnt;
               End;

               // Calcula Sados de Carregamento, Aquisicao, Variação, Juros e Premio
               wSaldoCar     := (wSaldoCarAnt + wMovimCar);
               wSaldoAqui    := (wSaldoAquiAnt + wMovimAqui);
               wSaldoAtu     := (wSaldoAtuAnt + wMovimAtu);
               wSaldoVar     := (wSaldoVarAnt + wMovimVar);
               wSaldoJur     := (wSaldoJurAnt + wMovimJur);
               wSaldoPre     := (wSaldoPreAnt + wMovimPre);
               wSaldoIRProv  := (wSaldoIRProvAnt + wMovimIRProv);
               wSaldoIRApu   := (wSaldoIRApuAnt + wMovimIRApu);
               wSaldoIOFProv := (wSaldoIOFProvAnt + wMovimIOFProv);
               wSaldoIOFApu  := (wSaldoIOFApuAnt + wMovimIOFApu);
               wSaldoAgio    := (wSaldoAgioAnt + wMovimAgio);

               //AL_77 - Ini
               fPercProvPerda := BuscaPercProvPerda(dDataOper, iInvestimento);
               If fPercProvPerda > 0 Then
               Begin
                  wSaldoProvPerda := RoundCM(fValorFinalInvest * (fPercProvPerda / 100), 2);
                  wMovimProvPerda := wSaldoProvPerda - wSaldoProvPerdaAnt;
               End
               Else
               Begin
                  wMovimProvPerda := wSaldoProvPerdaAnt;
                  wSaldoProvPerda := 0;
               End;
               //AL_77 - Fim

               // Se Atualização de Opções, descarrega no prêmio e nâo na variação
               If (iCarteira = pRPI.IDCARTOPC) And (iIdTipoOperacao = 0) Then // na atualizaçào de RV o tipooperacao é = a Zéro
               Begin
                  wMovimPre := wMovimVar;
                  wSaldoPre := (wSaldoPreAnt + wMovimPre);
                  wSaldoVar := 0;
                  wMovimVar := 0;
               End;

               // Acerta Flag de Calculo de Saldo ( 1 -> 2 ou 3-> '')
               If Trim(dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('FLGCALCSALDO').asString) = '2' Then
                  wTipoAtualizacao := '';

               // Caso a o Saldo em quantidade da Carteira Zere, Zera os saldos de
               // Rendimento e Atarial
               If fQtdeFinalInvest = 0 Then
               Begin
                  wSaldoRend := 0;
                  wSaldoAtu := 0;
               End;
               // Muda o Separador Decimal
               wDec := DecimalSeparator;
               DecimalSeparator := '.';
               //------------------------------------------------------------------------------
               // Tenta atualizar o Arquivo
               Try
                  If (wTipoMov = 'LUC') Then
                     fVlrDifCusto := RoundCM((fValorFinalInvest - (wSaldoAqui + wSaldoVar + fValorOperacao)), 2)
                  Else
                     fVlrDifCusto := RoundCM((fValorFinalInvest - (wSaldoAqui + wSaldoVar)), 2);

                  fVlrDifCusto := RoundCM((fValorFinalInvest - (wSaldoAqui + wSaldoVar)), 2);

                  // AL_69 Fim
                  //AL_76
                  //Ricardo Cristiano - 22/10/2009 - N. Sol 125777 -  N. Kintana 652392
                  if ((Sistema.TipoCliente = 19991) and (cNaturezaMovimento = 'A') and
                     ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirInc) or
                      (iIdTipoOperacao = (CtrlPInv.IdTipoOperDirInc + 10000)))) then
                     wMovimVar := 0
                  else
                     wMovimVar := wMovimVar + fVlrDifCusto;

                  //AL_42 Fim

                  //AL_89
                  //AL_108
                  If (fQtdeFinalInvest < 0) And (iTipoInvest <> 8) Then
                     Raise Exception.Create('Saldo insuficiente para atualizar histórico em ' +
                                            dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('DATAMOVCARTINV').AsString + ', '#13+
                                            'Investimento : '+dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('DESCINVESTIMENTO').AsString);

                  Application.ProcessMessages;
                  dtmOperComum.qryLocal.Close;
                  dtmOperComum.qryLocal.Sql.Clear;
                  dtmOperComum.qryLocal.Sql.Add('UPDATE HISTCARTINV SET ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOQTDEINVCART   = ' + FloatToStr(fQtdeFinalInvest) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOQTDECPMF      = ' + FloatToStr(fQtdeFinalCPMF) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOVLRINVCART    = ' + FloatToStr(fValorFinalInvest - wSaldoProvPerda) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.MOVIMATU       = ' + FloatToStr(wMovimAtu) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOATU       = ' + FloatToStr(wSaldoAtu) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.MOVIMCAR       = ' + FloatToStr(wMovimCar) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOCAR       = ' + FloatToStr(wSaldoCar) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.MOVIMAQUI      = ' + FloatToStr(wMovimAqui) + ', ');
                  //AL_42
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOAQUI      = ' + FloatToStr(RoundCM(wSaldoAqui, 2)) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOREND      = ' + FloatToStr(wSaldoRend) + ', ');
                  //AL_42
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOVARIACAO  = ' + FloatToStr(RoundCM(wSaldoVar, 2)) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOJUROS     = ' + FloatToStr(wSaldoJur) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.VLRVARIACAO    = ' + FloatToStr(wMovimVar) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.VLRJUROS       = ' + FloatToStr(wMovimJur) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.VLRPREMIO      = ' + FloatToStr(wMovimPre) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOPREMIO    = ' + FloatToStr(wSaldoPre) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.VLRIRPROV      = ' + FloatToStr(wMovimIRProv) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOIRPROV    = ' + FloatToStr(wSaldoIRProv) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.VLRIRAPU       = ' + FloatToStr(wMovimIRApu) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOIRAPU     = ' + FloatToStr(wSaldoIRApu) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.VLRIOFPROV     = ' + FloatToStr(wMovimIOFProv) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOIOFPROV   = ' + FloatToStr(wSaldoIOFProv) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.VLRIOFAPU      = ' + FloatToStr(wMovimIOFApu) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOIOFAPU    = ' + FloatToStr(wSaldoIOFApu) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.VLRAGIO        = ' + FloatToStr(wMovimAgio) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOAGIO      = ' + FloatToStr(wSaldoAgio) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.FLGCALCSALDO   = ' + QuotedStr(wTipoAtualizacao) + ', ');
                  //AL_77
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.VLRPROVPERDA   = ' + FloatToStr(wMovimProvPerda) + ', ');
                  dtmOperComum.qryLocal.Sql.Add('HISTCARTINV.SALDOPROVPERDA = ' + FloatToStr(wSaldoProvPerda) + ' ');
                  dtmOperComum.qryLocal.Sql.Add('WHERE (HISTCARTINV.IDHISTCARTINV = ' +
                                                QuotedStr(dtmOperacaoInvest.qryAtualizaSaldoILNull.FieldByName('IDHISTCARTINV').AsString) + ')');
                  dtmOperComum.qryLocal.ExecSql;
                  dtmOperComum.qryLocal.Close;

               Except
                  On E: Exception Do
                  Begin
                     //AL_89
                     MsgDlg('Houve um problema ao atualizar os saldos' + #13 +
                        'Mensagem: ' + E.Message, 'Mensagem do Sistema', mtWarning, [mbOK], 0);

                     dtmOperComum.QryLocal.Close;
                     
                     dtmOperComum.QryLocal1.Close;

                     dtmOperacaoInvest.qryAtualizaSaldoILNull.Close;                                             

                     // Libera Objetos Locais
                     FreeAndNil(CtrlRendaVariavel);

                     DecimalSeparator := wDec;
                     Result := False;
                     Exit;
                  End;
               End;

               DecimalSeparator := wDec;
               
               fQtdeInicialInvest  := fQtdeFinalInvest;
               fQtdeInicialCPMF    := fQtdeFinalCPMF;
               fValorInicialInvest := fValorFinalInvest;
               wQtdInvestAnt       := fQtdeFinalInvest;
               wSaldoAtuAnt        := wSaldoAtu;
               wSaldoCarAnt        := wSaldoCar;
               wSaldoAquiAnt       := wSaldoAqui;
               wSaldoRendAnt       := wSaldoRend;
               wSaldoVarAnt        := wSaldoVar;
               wSaldoJurAnt        := wSaldoJur;
               wSaldoPreAnt        := wSaldoPre;
               wSaldoIRProvAnt     := wSaldoIRProv;
               wSaldoIRApuAnt      := wSaldoIRApu;
               wSaldoIOFProvAnt    := wSaldoIOFProv;
               wSaldoIOFApuAnt     := wSaldoIOFApu;
               wSaldoAgioAnt       := wSaldoAgio;
               //AL_77
               wSaldoProvPerdaAnt  := wSaldoProvPerda;

               dtmOperacaoInvest.qryAtualizaSaldoILNull.Next;
            End; // While

         Except
            //AL_89
           MsgDlg('Houve um problema na Atualização dos Saldos', 'Erro', mtWarning, [mbOK], 0);
            Result := false;
         End;
      End;
      // Final do Processo \\
   Finally
{      if qryAtualizaSaldoC <> nil then
         qryAtualizaSaldoC.Close;}

{      if qryAtualizaSaldoI <> nil then
         qryAtualizaSaldoI.Close;}

{      if qryFlgAtualSaldo <> nil then
         qryFlgAtualSaldo.Close;}

      dtmOperacaoInvest.qryFlgAtualSaldo13.Close;
      dtmOperacaoInvest.qryFlgAtualSaldo2.Close;
      dtmOperacaoInvest.qryAtualizaSaldoC.Close;
      dtmOperacaoInvest.qryAtualizaSaldoCNull.Close;
      dtmOperacaoInvest.qryAtualizaSaldoIL.Close;
      dtmOperacaoInvest.qryAtualizaSaldoILNull.Close;

      dtmOperComum.QryLocal.Close;
      dtmOperComum.QryLocal1.Close;      

      //AL_83
      FreeAndNil(CtrlRendaVariavel);

      Application.ProcessMessages;      
   End;
End;

//--------------------------------------------------------------------------------------------------
//    Função que Calcula Saldo de Carteira, Investimento ou Carteira/Investimento no dia
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//       iInvestimento   :  id do Investimento                     (idInvestimento)
//       iCarteira       :  id da Carteira de Investimentos        (idCarteiraInvest)
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros não sejam necessários
//       -------------------------------------------------------------------------------------------
//       dDataOper  :  Data do Saldo desejado
//--------------------------------------------------------------------------------------------------
// Função que Calcula Saldos de Carteira, Investimento ou Carteira/Investimento no dia

Function TOperComum.CalculaSaldo(iInvestimento, iCarteira: integer; sLote: String; dDataOper: TDateTime;
   Var fSaldoQtdeInvCart, fSaldoVlrInvCart, fSaldoCotasCartInv,
   fSaldoVlrCartInv, fSaldoAtu, fSaldoCar, fSaldoAqui, fSaldoRend, fSaldoMercado,
   fSaldoVar, fSaldoJur, fSaldoPre, fSaldoIRProv, fSaldoIRApu, fSaldoIOFProv,
   fSaldoIOFApu, fSaldoAgio: double)
   : boolean;

Var
   qrySaldoCarteira, qrySaldoInvest, QryLocal: TwwQuery;
   bRetorno: boolean;
   fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcAqui,
      fSdoParcRend, fSdoParcCar, fSdoParcMercado, fSdoParcVar, fSdoParcJur,
      fSdoParcPre, fSdoParcInutil, fSdoParcIRProv, fSdoParcIRApu, fSdoParcIOFProv,
      fSdoParcIOFApu, fSdoParcAgio, fSdoQtdLibCustod, fSaldoQtdCPMF: double;
   //AL_71
   fSaldoInutil: double;
Begin
   Try
      fSaldoCotasCartInv := 0;
      fSaldoVlrCartInv := 0;
      fSaldoQtdeInvCart := 0;
      fSaldoVlrInvCart := 0;
      fSaldoAtu := 0;
      fSaldoAqui := 0;
      fSaldoRend := 0;
      fSaldoCar := 0;
      fSaldoMercado := 0;
      fSaldoVar := 0;
      fSaldoJur := 0;
      fSaldoPre := 0;
      fSaldoIRProv := 0;
      fSaldoIRApu := 0;
      fSaldoIOFProv := 0;
      fSaldoIOFApu := 0;
      fSaldoAgio := 0;
      fSdoQtdLibCustod := 0;
      fSdoParcInutil := 0;
      //AL_71
      fSaldoInutil := 0;

      If (iInvestimento = -1) And (sLote = '-1') And (ICarteira <> -1) Then
      Begin
            // Busca Saldo da Carteira
            qrySaldoCarteira := TwwQuery(dtmOperComum.qrySaldoCarteira);
            With qrySaldoCarteira Do Begin
                  Close;
                  If Not (Prepared) Then Prepare;
                  ParamByName('IDCARTEIRA').AsInteger := iCarteira;
                  ParamByName('DATAMOV').AsDateTime := dDataOper;
                  ParamByName('IDHISTORICO').AsInteger := high(integer);
                  Open;
                  First;
               End;
            If Not qrySaldoCarteira.isEmpty Then
               fSaldoCotasCartInv := qrySaldoCarteira.FieldByName('SALDOCOTASCARTINV').AsFloat;
            fSaldoVlrCartInv := qrySaldoCarteira.FieldByName('SALDOVLRCARTINV').AsFloat;
         End;

      If (iInvestimento <> -1) And (sLote <> '-1') And (ICarteira <> -1) Then
         // Busca Saldo do Lote do Investimento em questão na Carteira
         //AL_2
         //AL_5
         //AL_71
         //AL_75
         //AL_78
         BuscaTodosSaldosInvestLote(
            iCarteira, 0 {IDCARTEIRAGERENC}, iInvestimento, 99999999, -1, sLote,
            DateToStr(dDataOper), -1,
            fSaldoQtdeInvCart, fSaldoVlrInvCart, fSaldoAtu, fSaldoCar,
            fSaldoAqui, fSaldoRend, fSaldoMercado, fSaldoVar,
            fSaldoJur, fSaldoPre, fSaldoIRProv, fSaldoIRApu,
            fSaldoIOFProv, fSaldoIOFApu, fSaldoAgio, fSdoQtdLibCustod,
            fSdoParcInutil, fSaldoQtdCPMF, fSaldoInutil);

      If (iInvestimento <> -1) And (sLote = '-1') And (ICarteira = -1) Then Begin
            // Busca Saldo do Investimento em todas as Carteira em que ele existir

            // Cria Objetos Locais
            QryLocal := TwwQuery.Create(Application);
            QryLocal.DatabaseName := 'BaseDados';

            // Busca Carteiras que possuem o Investimento
            With QryLocal Do
               Begin
                  Close;
                  Sql.Clear;
                  Sql.add(' SELECT DISTINCT IDCARTEIRAINVEST, IDLOTE              ');
                  Sql.add(' FROM HISTCARTINV                                   ');
                  Sql.add(' WHERE (IDINVESTIMENTO = ' + InttoStr(iInvestimento) + ')  ');
                  Sql.add(' ORDER BY IDCARTEIRAINVEST, IDLOTE                  ');
                  Open;
               End;

            While Not QryLocal.EOF Do Begin
                  // Acumula Saldo do Investimento em questão nessa Carteira

                  fSdoParcQtdeInvCart := 0;
                  fSdoParcVlrInvCart := 0;
                  fSdoParcAtu := 0;
                  fSdoParcAqui := 0;
                  fSdoParcRend := 0;
                  fSdoParcCar := 0;
                  fSdoParcMercado := 0;
                  fSdoParcVar := 0;
                  fSdoParcJur := 0;
                  fSdoParcPre := 0;
                  fSdoParcIRProv := 0;
                  fSdoParcIRApu := 0;
                  fSdoParcIOFProv := 0;
                  fSdoParcIRApu := 0;
                  fSdoParcAgio := 0;
                  //AL_2
                  //AL_5
                  //AL_71
                  //AL_75
                  //AL_78
                  If BuscaTodosSaldosInvestLote(
                     QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                     0 {IDCARTEIRAGERENC},
                     iInvestimento, 99999999, -1,
                     QryLocal.FieldByName('IDLOTE').AsString, DateToStr(dDataOper), -1,
                     fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcCar,
                     fSdoParcAqui, fSdoParcRend, fSdoParcMercado,
                     fSdoParcVar, fSdoParcJur, fSdoParcPre,
                     fSdoParcIRProv, fSdoParcIRApu, fSdoParcIOFProv,
                     fSdoParcIRApu, fSdoParcAgio, fSdoQtdLibCustod,
                     fSdoParcInutil, fSdoParcInutil, fSaldoInutil) Then
                     Begin

                        fSaldoQtdeInvCart := fSaldoQtdeInvCart + fSdoParcQtdeInvCart;
                        fSaldoVlrInvCart := fSaldoVlrInvCart + fSdoParcVlrInvCart;
                        fSaldoAtu := fSaldoAtu + fSdoParcAtu;
                        fSaldoAqui := fSaldoAqui + fSdoParcAqui;
                        fSaldoRend := fSaldoRend + fSdoParcRend;
                        fSaldoCar := fSaldoCar + fSdoParcCar;
                        fSaldoMercado := fSaldoMercado + fSdoParcMercado;
                        fSaldoVar := fSaldoVar + fSdoParcVar;
                        fSaldoJur := fSaldoJur + fSdoParcJur;
                        fSaldoPre := fSaldoPre + fSdoParcPre;
                        fSaldoIRProv := fSaldoIRProv + fSdoParcIRProv;
                        fSaldoIRApu := fSaldoIRApu + fSdoParcIRApu;
                        fSaldoIOFProv := fSaldoIOFProv + fSdoParcIOFProv;
                        fSaldoIOFApu := fSaldoIOFApu + fSdoParcIOFApu;
                        fSaldoAgio := fSaldoAgio + fSdoParcAgio;
                     End;
                  // Pula para o Proximo Registro
                  QryLocal.Next;
               End;
            // Libera Objetos Locais
            QryLocal.Free;
         End;

      If (iInvestimento <> -1) And (sLote = '-1') And (ICarteira <> -1) Then Begin
            // Busca Saldo do Investimento na Carteira (percorre todos os lotes)

            // Cria Objetos Locais
            QryLocal := TwwQuery.Create(Application);
            QryLocal.DatabaseName := 'BaseDados';

            // Busca Carteiras que possuem o Investimento
            With QryLocal Do
               Begin
                  Close;
                  Sql.Clear;
                  Sql.add(' SELECT DISTINCT IDLOTE              ');
                  Sql.add(' FROM HISTCARTINV                                   ');
                  Sql.add(' WHERE (IDCARTEIRAINVEST = ' + InttoStr(iCarteira) + ')  ');
                  Sql.add('   and (IDINVESTIMENTO   = ' + InttoStr(iInvestimento) + ')  ');
                  Sql.add(' ORDER BY IDLOTE                  ');
                  Open;
               End;

            While Not QryLocal.EOF Do Begin
                  // Acumula Saldo do Investimento em questão nessa Carteira

                  fSdoParcQtdeInvCart := 0;
                  fSdoParcVlrInvCart := 0;
                  fSdoParcAtu := 0;
                  fSdoParcAqui := 0;
                  fSdoParcRend := 0;
                  fSdoParcCar := 0;
                  fSdoParcMercado := 0;
                  fSdoParcVar := 0;
                  fSdoParcJur := 0;
                  fSdoParcPre := 0;
                  fSdoParcIRProv := 0;
                  fSdoParcIRApu := 0;
                  fSdoParcIOFProv := 0;
                  fSdoParcIRApu := 0;
                  fSdoParcAgio := 0;
                  fSdoQtdLibCustod := 0;
                  //AL_2
                  //AL_5
                  //AL_71
                  //AL_75
                  //AL_78
                  If BuscaTodosSaldosInvestLote(
                     iCarteira, 0 {IDCARTEIRAGERENC}, iInvestimento, 99999999, -1,
                     QryLocal.FieldByName('IDLOTE').AsString, DateToStr(dDataOper), -1,
                     fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcCar,
                     fSdoParcAqui, fSdoParcRend, fSdoParcMercado,
                     fSdoParcVar, fSdoParcJur, fSdoParcPre,
                     fSdoParcIRProv, fSdoParcIRApu, fSdoParcIOFProv,
                     fSdoParcIRApu, fSdoParcAgio, fSdoQtdLibCustod,
                     fSdoParcInutil, fSdoParcInutil, fSaldoInutil) Then
                     Begin
                        fSaldoQtdeInvCart := fSaldoQtdeInvCart + fSdoParcQtdeInvCart;
                        fSaldoVlrInvCart := fSaldoVlrInvCart + fSdoParcVlrInvCart;
                        fSaldoAtu := fSaldoAtu + fSdoParcAtu;
                        fSaldoAqui := fSaldoAqui + fSdoParcAqui;
                        fSaldoRend := fSaldoRend + fSdoParcRend;
                        fSaldoCar := fSaldoCar + fSdoParcCar;
                        fSaldoMercado := fSaldoMercado + fSdoParcMercado;
                        fSaldoVar := fSaldoVar + fSdoParcVar;
                        fSaldoJur := fSaldoJur + fSdoParcJur;
                        fSaldoPre := fSaldoPre + fSdoParcPre;
                        fSaldoIRProv := fSaldoIRProv + fSdoParcIRProv;
                        fSaldoIRApu := fSaldoIRApu + fSdoParcIRApu;
                        fSaldoIOFProv := fSaldoIOFProv + fSdoParcIOFProv;
                        fSaldoIOFApu := fSaldoIOFApu + fSdoParcIOFApu;
                        fSaldoAgio := fSaldoAgio + fSdoParcAgio;
                     End;
                  // Pula para o Proximo Registro
                  QryLocal.Next;
               End;
            // Libera Objetos Locais
            QryLocal.Free;
         End;

   Finally
      dtmOperComum.qrySaldoCarteira.Close; {qrySaldoCarteira.Close}
   End;
End;

// Função que Soma Saldos dos  Investimentos na Carteira para uma determinada data

Function TOperComum.SaldosInvCart(iCarteira: integer; dDataRef: TDateTime;
   Var fSaldoQtdeInvCart, fSaldoVlrInvCart,
   fSaldoAtu, fSaldoCar, fSaldoAqui, fSaldoRend, fSaldoMercado: double)
   : boolean;
Var
   QryLocal: TwwQuery;
   bRetorno: boolean;
   fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcAqui, fSdoParcRend,
      fSdoParcCar, fSdoParcMercado, fSaldoInutil: double;
Begin
   fSaldoQtdeInvCart := 0;
   fSaldoVlrInvCart := 0;
   fSaldoAtu := 0;
   fSaldoAqui := 0;
   fSaldoRend := 0;
   fSaldoCar := 0;
   fSaldoMercado := 0;

   QryLocal := TwwQuery.Create(Application);
   QryLocal.DatabaseName := 'BaseDados';

   With QryLocal Do
      Begin
         Close;
         Sql.Clear;
         Sql.add(' SELECT DISTINCT IDINVESTIMENTO, IDLOTE            ');
         Sql.add(' FROM HISTCARTINV                               ');
         Sql.add(' WHERE (IDCARTEIRAINVEST = ' + InttoStr(iCarteira) + ')  ');
         Sql.add('   and (IDINVESTIMENTO IS not NULL)                ');
         Sql.add(' ORDER BY IDINVESTIMENTO, IDLOTE                ');
         Open;
      End;
   While Not QryLocal.EOF Do Begin
         // Acumula Saldo do Investimento em questão nessa Carteira
         fSdoParcQtdeInvCart := 0;
         fSdoParcVlrInvCart := 0;
         fSdoParcAtu := 0;
         fSdoParcAqui := 0;
         fSdoParcRend := 0;
         fSdoParcCar := 0;
         //AL_2
         //AL_5
         //AL_71
         //AL_75
         //AL_78
         If BuscaTodosSaldosInvestLote(iCarteira, 0 {IDCARTEIRAGERENC},
            QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
            99999999, -1,
            QryLocal.FieldByName('IDLOTE').AsString, DateToStr(dDataRef), -1,
            fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcCar,
            fSdoParcAqui, fSdoParcRend, fSdoParcMercado,
            fSaldoInutil, fSaldoInutil, fSaldoInutil,
            fSaldoInutil, fSaldoInutil, fSaldoInutil,
            fSaldoInutil, fSaldoInutil, fSaldoInutil,
            fSaldoInutil, fSaldoInutil, fSaldoInutil) Then
            Begin
               fSaldoQtdeInvCart := fSaldoQtdeInvCart + fSdoParcQtdeInvCart;
               fSaldoVlrInvCart := fSaldoVlrInvCart + fSdoParcVlrInvCart;
               fSaldoAtu := fSaldoAtu + fSdoParcAtu;
               fSaldoAqui := fSaldoAqui + fSdoParcAqui;
               fSaldoRend := fSaldoRend + fSdoParcRend;
               fSaldoCar := fSaldoCar + fSdoParcCar;
               fSaldoMercado := fSaldoMercado + fSdoParcMercado;
            End;
         // Pula para o Proximo Registro
         QryLocal.Next;
      End;

   QryLocal.Free;

End;

//Al_29 - 29/03/2005
// Totalizador Carteira, Investimento e Plano ou um a um

Procedure TOperComum.TotalSaldosInvCart(iiCarteira, iiCartGerenc,
   iiInvestimento, iiPlanPrevCtbPatr: integer;
   dDataRef: TDateTime;
   Var fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu,
   fSdoCar, fSdoAqui, fSdoRend: double);
Var
   fSaldoInutil: double;
Begin
   If dDataRef <= 0 Then
      Exit;

   OperComum.LimpaParametros(dtmOperComum.qrySaldoInvNullTotal);
   With dtmOperComum.qrySaldoInvNullTotal Do
      Begin
         If iiCarteira > 0 Then
            ParamByName('IDCARTEIRAINVEST').AsInteger := iiCarteira;
         If iiInvestimento > 0 Then
            ParamByName('IDINVESTIMENTO').AsInteger := iiInvestimento;
         If iiPlanPrevCtbPatr > 0 Then
            ParamByName('IDPLANPREVCTBPATR').AsInteger := iiPlanPrevCtbPatr;
         ParamByName('HISTORICO').AsInteger := high(integer);
         ParamByName('DATAMOV').AsString := DateToStr(dDataRef);
         Open;

         If Not (isEmpty) Then
            Begin
               fSdoQtdeInvCart := FieldByName('SALDOQTDEINVCART').AsFloat;
               fSdoVlrInvCart := FieldByName('SALDOVLRINVCART').AsFloat;
               fSdoAtu := FieldByName('SALDOATU').AsFloat;
               fSdoAqui := FieldByName('SALDOAQUI').AsFloat;
               fSdoRend := FieldByName('SALDOREND').AsFloat;
               fSdoCar := FieldByName('SALDOCAR').AsFloat;
            End;
      End;
End;

// Função que Busca Cotação de um Investimento numa determinada data

Function TOperComum.BuscaCotacaoInvest(iInvestimento: integer; dDataRef: TDateTime; bUsaLote: boolean): double;
Begin
   Result := 0;
   dtmOperComum.QryBuscaCotacaoInvest.Close;
   dtmOperComum.QryBuscaCotacaoInvest.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
   dtmOperComum.QryBuscaCotacaoInvest.ParamByName('DATACOTACAO').AsDateTime := dDataRef;
   dtmOperComum.QryBuscaCotacaoInvest.Open;

   // Caso Utilize Lote Faz Calculo
   If bUsaLote Then Begin
         If dtmOperComum.QryBuscaCotacaoInvest.FieldByName('QTDTITLOTE').AsFloat <> 0 Then
            Result := (dtmOperComum.QryBuscaCotacaoInvest.FieldByName('VLRCONTABIL').AsFloat /
               dtmOperComum.QryBuscaCotacaoInvest.FieldByName('QTDTITLOTE').AsFloat)
         Else
            Result := dtmOperComum.QryBuscaCotacaoInvest.FieldByName('VLRCONTABIL').AsFloat;
      End Else Begin
         // Caso Não Utilize Lote. Guarda
         Result := dtmOperComum.QryBuscaCotacaoInvest.FieldByName('VLRCONTABIL').AsFloat;
      End;
   dtmOperComum.QryBuscaCotacaoInvest.Close;
End;

// Função que Busca Cotação de um Investimento na COTACAOACAO numa determinada data

Function TOperComum.BuscaCotacaoAcao(iInvestimento: integer; dDataRef: TDateTime; bUsaLote: boolean): double;
Var
   QryLocal: TwwQuery;
   //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
   CtrlParamCotacaoRV: TCtrlParamCotacaoRV;
   sCampo, sTipo: String;
Begin
   Result := 0;
   QryLocal := TwwQuery.Create(Application);
   QryLocal.DatabaseName := 'BaseDados';

   //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
   CtrlParamCotacaoRV := TCtrlParamCotacaoRV.Create;
   CtrlParamCotacaoRV.InitializeAs(Padroes);
   sCampo := CtrlParamCotacaoRV.RetornaCotacaoVigente(dDataRef, sTipo);

   FazQuery(QryLocal,
      //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
      ' SELECT CT.DATACOTAACAO, CT.' + sCampo + ' AS VLRMEDIA, CT.QTDELOTE ' +
      ' FROM COTACAOACAO CT, ' +
      '      (SELECT MAX(DATACOTAACAO) AS DATA ' +
      '       FROM   COTACAOACAO ' +
      '       WHERE (DATACOTAACAO <= TO_DATE( ''' + DateToStr(dDataRef) + ''',''DD/MM/YYYY'')) AND' +
      '             (IDACAO = ''' + InttoStr(iInvestimento) + ''') AND' +
      '             (VLRMEDIA > 0)) CT1     ' +
      '  WHERE (CT.DATACOTAACAO = DATA) AND ' +
      '        (IDACAO = ''' + InttoStr(iInvestimento) + ''') ');
   // Caso Utilize Lote Faz Calculo
   If bUsaLote Then Begin
         If QryLocal.FieldByName('QTDELOTE').AsFloat <> 0 Then
            Result := (QryLocal.FieldByName('VLRMEDIA').AsFloat /
               QryLocal.FieldByName('QTDELOTE').AsFloat)
         Else
            Result := QryLocal.FieldByName('VLRMEDIA').AsFloat;
      End Else Begin
         // Caso Não Utilize Lote. Guarda
         Result := QryLocal.FieldByName('VLRMEDIA').AsFloat;
      End;
   QryLocal.Free;
   //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
   FreeAndNil(CtrlParamCotacaoRV);
End;

// Função que Busca Cotação de uma Moeda numa determinada data.

Function TOperComum.LeMoeda(iMoeCodigo: integer; dCotData: TDateTime; sFlgProRata, sFlgInterpola: String): double;
Var
   QryMoeda: TwwQuery;
   fCotacao1, fCotacao2, fCotacao3: double;
   dDataCotacao1, dDataCotacao2, dDataCotacao3: TDateTime;
   iIntervalo1, iIntervalo2: integer;
   sMsgErro: String;
Begin
   Result := 0;
   sMsgErro := 'Erro, Cadastro de Cotação de Moeda tem dados insuficientes para Cálculo Pró-Rata, Verifique !!!';
   Try
      // testa valores de sFlgProRata
      If (sFlgProRata <> 'N') And (sFlgProRata <> 'L') And (sFlgProRata <> 'C') Then Begin
            MsgDlg('Parâmetro para Tipo de Cálculo informado incorretamente!', 'Erro', mtError, [mbOk], 0);
            Result := 0;
            Exit;
         End;
      // testa valores de sFlgInterpola
      If (sFlgProRata <> 'N') And ((sFlgInterpola <> 'I') And (sFlgInterpola <> 'E')) Then Begin
            MsgDlg('Parâmetro para Cálculo Pró-Rata informado incorretamente!', 'Erro', mtError, [mbOk], 0);
            Result := 0;
            Exit;
         End;

      qryMoeda := TwwQuery(dtmOperComum.qryMoeda);

      With qryMoeda Do Begin
            Close;
            If Not (Prepared) Then Prepare;
            ParamByName('MOEDA').AsInteger := iMoeCodigo;
            Open;
            First;
         End;
      If qryMoeda.isEmpty Then Begin
            MsgDlg('Moeda não encontrada : ' + QryMoeda.FieldByName('MOESIGLA').AsString, 'Mensagem do Sistema', MtError, [MbOk], 0);
            Result := 0;
            Exit;
         End;
      //    Se não calcula Pró-Rata
      If sFlgProRata = 'N' Then Begin
            BuscaCotacaoMoeda(iMoeCodigo, dCotData, '', fCotacao1, dDataCotacao1);
            Result := fCotacao1;
         End Else Begin
            If QryMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'D' Then Begin
                  BuscaCotacaoMoeda(iMoeCodigo, dCotData, '', fCotacao1, dDataCotacao1);
                  Result := fCotacao1;
               End Else Begin
                  If QryMoeda.FieldByName('FLGPERCVALOR').AsString = 'V' Then Begin
                        //             Se existir cotação na data de referência
                        If BuscaCotacaoMoeda(iMoeCodigo, dCotData, '=', fCotacao1, dDataCotacao1) Then Begin
                              Result := fCotacao1;
                           End Else Begin
                              //                Alimenta Parâmetros de Calculo Pró-Rata por Interpolação
                              If sFlgInterpola = 'I' Then Begin
                                    If Not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '<', fCotacao1, dDataCotacao1) Then Begin
                                          MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                                          Result := 0;
                                          Exit;
                                       End;
                                    fCotacao3 := fCotacao1;
                                    dDataCotacao3 := dDataCotacao1;
                                    If Not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '>', fCotacao2, dDataCotacao2) Then Begin
                                          MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                                          Result := 0;
                                          Exit;
                                       End;
                                    iIntervalo1 := DiasUteis.IntervaloDias(dDataCotacao1, dDataCotacao2);
                                    iIntervalo2 := DiasUteis.IntervaloDias(dDataCotacao1, dCotData);
                                 End Else Begin
                                    //                   Alimenta Parâmetros de Calculo Pró-Rata por Extrapolação
                                    If Not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '<', fCotacao2, dDataCotacao2) Then Begin
                                          MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                                          Result := 0;
                                          Exit;
                                       End;
                                    fCotacao3 := fCotacao2;
                                    dDataCotacao3 := dDataCotacao2;
                                    If Not BuscaCotacaoMoeda(iMoeCodigo, dDataCotacao2, '<', fCotacao1, dDataCotacao1) Then Begin
                                          MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                                          Result := 0;
                                          Exit;
                                       End;
                                    iIntervalo1 := DiasUteis.IntervaloDias(dDataCotacao1, dDataCotacao2);
                                    iIntervalo2 := DiasUteis.IntervaloDias(dDataCotacao2, dCotData);
                                 End;
                              //                Executa Cáculo Pró-Rata Linear
                              If sFlgProRata = 'L' Then
                                 Result := fCotacao3 * ((((fCotacao2 / fCotacao1) - 1)
                                    * (iIntervalo2 / iIntervalo1)) + 1)
                              Else
                                 //                Executa Cáculo Pró-Rata Exponencial
                                 Result := fCotacao3 * Power((fCotacao2 / fCotacao1),
                                    (iIntervalo2 / iIntervalo1));
                           End;
                     End Else If QryMoeda.FieldByName('FLGPERCVALOR').AsString = 'P' Then Begin
                        //             Se existir cotação na data de referência
                        If BuscaCotacaoMoeda(iMoeCodigo, dCotData, '=', fCotacao1, dDataCotacao1) Then Begin
                              Result := 0;
                           End Else Begin
                              //                Alimenta Parâmetros de Calculo Pró-Rata por Interpolação
                              If sFlgInterpola = 'I' Then Begin
                                    If Not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '>', fCotacao2, dDataCotacao2) Then Begin
                                          MsgDlg('Erro, Cadastro de Cotação de Moeda tem dados insuficientes para Cálculo Pró-Rata, Verifique !!!', 'Erro', mtError, [mbOk], 0);
                                          Result := 0;
                                          Exit;
                                       End;
                                    iIntervalo1 := DiasUteis.ExtraiDia(
                                       DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataCotacao2),
                                       DiasUteis.ExtraiMes(dDataCotacao2)));
                                    iIntervalo2 := DiasUteis.IntervaloDias(
                                       EncodeDate(DiasUteis.ExtraiAno(dDataCotacao2),
                                       DiasUteis.ExtraiMes(dDataCotacao2), 1),
                                       dCotData + 1);
                                 End Else Begin
                                    //                   Alimenta Parâmetros de Calculo Pró-Rata por Extrapolação
                                    If Not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '<', fCotacao2, dDataCotacao2) Then Begin
                                          MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                                          Result := 0;
                                          Exit;
                                       End;
                                    iIntervalo1 := DiasUteis.ExtraiDia(
                                       DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataCotacao2),
                                       DiasUteis.ExtraiMes(dDataCotacao2)));
                                    iIntervalo2 := DiasUteis.IntervaloDias(
                                       DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataCotacao2),
                                       DiasUteis.ExtraiMes(dDataCotacao2)),
                                       dCotData);
                                 End;
                              //                Executa Cáculo Pró-Rata Linear
                              If sFlgProRata = 'L' Then
                                 Result := fCotacao2 * (iIntervalo2 / iIntervalo1)
                              Else
                                 //                Executa Cáculo Pró-Rata Exponencial
                                 Result := Power((1 + fCotacao2), (iIntervalo2 / iIntervalo1)) - 1;
                           End;
                     End;
               End;
         End;
   Except
      Raise;
      Result := 0;
   End;
End;


// Função que Busca Cotação de uma Moeda numa determinada data.

Function TOperComum.BuscaCotacaoMoeda(iMoeda: integer; dDataRef: TDateTime; sOperador: String;
   Var fCotacao: double; Var dDataCotacao: TDateTime): boolean;
Var
   sOrdenacao: String;
Begin
   If sOperador = '' Then sOperador := '<=';

   If sOperador[1] = '<' Then Begin
         sOrdenacao := 'DESC';
      End Else Begin
         sOrdenacao := '';
      End;

   Try

      With dtmOperComum.qryAuxiliar Do Begin
            Close;
            SQL.Text :=
               'SELECT ' + chr(13) +
               '   M.MOECODIGO, M.COTDATA, M.COTVALOR ' + chr(13) +
               'FROM ' + chr(13) +
               '   COTACAOMOEDA M ' + chr(13) +
               'WHERE ' + chr(13) +
               '   ( M.MOECODIGO = ' + InttoStr(iMoeda) + ' ) ' + chr(13) +
               '   AND ( M.COTDATA ' + sOPerador + ' TO_DATE(''' + DateToStr(dDataRef) + ''',''DD/MM/YYYY'') ) ' + chr(13) +
               'ORDER BY ' + chr(13) +
               '   M.COTDATA ' + sOrdenacao;
            Open;

            Result := Not (dtmOperComum.qryAuxiliar).isEmpty;

            fCotacao := dtmOperComum.qryAuxiliar.FieldByName('COTVALOR').AsFloat;
            dDataCotacao := dtmOperComum.qryAuxiliar.FieldByName('COTDATA').AsDateTime;
         End;

   Finally
      dtmOperComum.qryAuxiliar.Close;
   End;
End;


// Função que Calcula Juros Diários a partir de um Valor e o Tipo de Juros.

Function TOperComum.CalculaJurosDia(fValorJuros: double; iTipoJuros: integer): double;
Var
   QryLocal: TwwQuery;
   wParam1, wParam2: double;
Begin
   Result := 0;
   QryLocal := TwwQuery.Create(Application);
   QryLocal.DatabaseName := 'BaseDados';

   FazQuery(QryLocal,
      'SELECT TAMPERJUROS, EFETNOMI ' +
      'FROM TIPOJUROS ' +
      'WHERE 	(CODTIPTXJUROS = ''' + InttoStr(iTipoJuros) + ''')');

   If qryLocal.isEmpty Then Begin
         MsgDlg('Faltam dados para calcular Juros Diários!', 'Erro', mtError, [mbOk], 0);
      End Else Begin
         If QryLocal.FieldByName('EFETNOMI').AsString = 'E' Then Begin
               wParam1 := 1 + (fValorJuros / 100);
               wParam2 := 1 / QryLocal.FieldByName('TAMPERJUROS').AsFloat;
               Result := Power(wParam1, wParam2) - 1
            End Else
            Result := fValorJuros / QryLocal.FieldByName('TAMPERJUROS').AsFloat;
      End;
   Result := Result * 100;

   QryLocal.Free;
End;





//--------------------------------------------------------------------------------------------------
//    MarcaFlgHistCartInv:  Exclui Lancamento na Carteira, e marca proximos registros do Investimento
//                          e Carteira com Flags
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       sTipoMovCart   :  'OPE' = Operação
//                         'DES' = Despesa
//       iHistCartInv   :  id do registro da HistCartInv
//
//--------------------------------------------------------------------------------------------------

Procedure TOperComum.MarcaFlgHistCartInv(TipoMovCart: String; IdLancamento: Integer);
Var
   QryLocalAux1, QryLocalAux2: TwwQuery;
   wIdCarteira, wIdInvestimento, wIdHistCartInv: Integer;
   wIdLote: String;
   wDataMov: TDate;
Begin
   // Critica Parametros
   If (TipoMovCart <> 'OPE') And (TipoMovCart <> 'HST') Then Begin
         MsgDlg('Tipo de Movimento, "' + TipoMovCart + '" Inválido.', 'Mensagem do Sistema',
            MtError, [MbOk], 0);
         Exit;
      End;

   // Cria/Inicia Objetos e Variaveis Locais
   QryLocalAux1 := TwwQuery.Create(Application);
   QryLocalAux1.DatabaseName := 'BaseDados';
   QryLocalAux2 := TwwQuery.Create(Application);
   QryLocalAux2.DatabaseName := 'BaseDados';


   // Busca Registro a Excluir de Acordo com o Tipo de Lancamento

   //-- Lancamento de Operacao --\\
   If (TipoMovCart = 'OPE') Or (TipoMovCart = 'HST') Then Begin
         If (TipoMovCart = 'OPE') Then Begin
               If FazQuery(QryLocalAux1,
                  'SELECT IDHISTCARTINV, FLGCALCSALDO, IDCARTEIRAINVEST, IDINVESTIMENTO, IDLOTE, DATAMOVCARTINV ' +
                  'FROM HISTCARTINV WHERE IDOPERACAOINVEST = ' + IntToStr(IdLancamento) + ' ' +
                  'ORDER BY IDHISTCARTINV DESC ') Then Begin
                     // Guarda Variaveis
                     wIdCarteira := QryLocalAux1.FieldByname('IDCARTEIRAINVEST').AsInteger;
                     wIdInvestimento := QryLocalAux1.FieldByname('IDINVESTIMENTO').AsInteger;
                     wIdLote := QryLocalAux1.FieldByname('IDLOTE').AsString;
                     wIdHistCartInv := QryLocalAux1.FieldByname('IDHISTCARTINV').AsInteger;
                     wDataMov := QryLocalAux1.FieldByname('DATAMOVCARTINV').AsDateTime;
                  End;
            End Else If (TipoMovCart = 'HST') Then Begin
               If FazQuery(QryLocalAux1,
                  'SELECT IDHISTCARTINV, FLGCALCSALDO, IDCARTEIRAINVEST, IDINVESTIMENTO, IDLOTE, DATAMOVCARTINV ' +
                  'FROM HISTCARTINV WHERE IDHISTCARTINV = ' + IntToStr(IdLancamento)) Then Begin
                     // Guarda Variaveis
                     wIdCarteira := QryLocalAux1.FieldByname('IDCARTEIRAINVEST').AsInteger;
                     wIdInvestimento := QryLocalAux1.FieldByname('IDINVESTIMENTO').AsInteger;
                     wIdLote := QryLocalAux1.FieldByname('IDLOTE').AsString;
                     wIdHistCartInv := QryLocalAux1.FieldByname('IDHISTCARTINV').AsInteger;
                     wDataMov := QryLocalAux1.FieldByname('DATAMOVCARTINV').AsDateTime;
                  End;
            End;
         // Busca Proximo Lancamento da Mesma Carteira, Caso Não encontre Sai Fora
         If Not FazQuery(QryLocalAux1,
            'SELECT  IDHISTCARTINV, IDCARTEIRAINVEST, IDINVESTIMENTO, IDLOTE FROM HISTCARTINV  ' +
            'WHERE (IDCARTEIRAINVEST  = ' + IntToStr(wIdCarteira) + ') AND ' +
            '      ((DATAMOVCARTINV   > TO_DATE(''' + DateToStr(wDataMov) + ''',''DD/MM/YYYY'')) OR  ' +
            '        ((DATAMOVCARTINV = TO_DATE(''' + DateToStr(wDataMov) + ''',''DD/MM/YYYY'')) AND ' +
            '         (IDHISTCARTINV  > ' + IntToStr(wIdHistCartInv) + ')) )    ' +
            'ORDER BY DATAMOVCARTINV, IDHISTCARTINV ') Then Begin

               // Libera Objetos Locais
               QryLocalAux1.Free;
               QryLocalAux2.Free;
               Exit;                                   
            End;

          //Ricardo
          if not CtrlInvContab.TestaPeriodo(DateToStr(wDataMov), 2) then
          begin
             // Libera Objetos Locais
             QryLocalAux1.Free;
             QryLocalAux2.Free;
             Exit;
          end;

         // Se o Investimento é o Mesmo do Anterior Marca com Flg "1" (Cart/Inv),
         // caso não seja Marca com Flg "3" (Cart),
         If (QryLocalAux1.FieldByname('IDINVESTIMENTO').AsInteger = wIdInvestimento) And
            (((QryLocalAux1.FieldByname('IDLOTE').isNull) And (wIdLote = '')) Or
            ((Not QryLocalAux1.FieldByname('IDLOTE').isNull) And
            (wIdLote = QryLocalAux1.FieldByname('IDLOTE').asString))) Then Begin
               // Monta e Executa a Atualizacao
               QryLocalAux2.SQL.Clear;
               QryLocalAux2.SQL.Add(
                  'UPDATE HISTCARTINV SET FLGCALCSALDO = ''1'' WHERE IDHISTCARTINV = ' +
                  QryLocalAux1.FieldByname('IDHISTCARTINV').AsString);
               QryLocalAux2.ExecSQL;
            End Else Begin
               // Monta e Executa a Atualizacao
               QryLocalAux2.SQL.Clear;
               //Ricardo Cristiano - 25/07/2011 - N. Sol 156970 -  N. Kintana 1360831               
               QryLocalAux2.SQL.Add(
                  'UPDATE HISTCARTINV SET FLGCALCSALDO = ''2'' WHERE IDHISTCARTINV = ' +
                  QryLocalAux1.FieldByname('IDHISTCARTINV').AsString);
               Try
                  QryLocalAux2.ExecSQL;
               Except
                  Raise;
               End;
               // Busca Proximo Lancamento do Mesmo Investimento
               If FazQuery(QryLocalAux1,
                  'SELECT  IDHISTCARTINV, IDINVESTIMENTO FROM HISTCARTINV  ' +
                  'WHERE (IDCARTEIRAINVEST = ' + IntToStr(wIdCarteira) + ') AND ' +
                  '      (IDINVESTIMENTO   = ' + IntToStr(wIdInvestimento) + ') AND ' +
                  '      (((''' + wIdLote + ''' IS NOT NULL) AND (IDLOTE =''' + wIdLote + ''')) OR ((''' + wIdLote + ''' IS NULL) AND (IDLOTE IS NULL))) AND ' +
                  '      ( (DATAMOVCARTINV  > TO_DATE(''' + DateToStr(wDataMov) + ''',''DD/MM/YYYY'')) OR ' +
                  '        ((DATAMOVCARTINV  = TO_DATE(''' + DateToStr(wDataMov) + ''',''DD/MM/YYYY'')) AND ' +
                  '         (IDHISTCARTINV   > ' + IntToStr(wIdHistCartInv) + ')) )    ' +
                  'ORDER BY DATAMOVCARTINV, IDHISTCARTINV ') Then Begin
                     // Monta e Executa a Atualizacao
                     QryLocalAux2.SQL.Clear;
                     QryLocalAux2.SQL.Add(
                        'UPDATE HISTCARTINV SET FLGCALCSALDO = ''2'' WHERE IDHISTCARTINV = ' +
                        QryLocalAux1.FieldByname('IDHISTCARTINV').AsString);
                     Try
                        QryLocalAux2.ExecSQL;
                     Except
                        Raise;
                     End;
                  End;
            End;
      End;
   // Libera Objetos Locais
   QryLocalAux1.Free;
   QryLocalAux2.Free;
End;

// Calcula o valor da cota de uma Carteira na data informada

Function TOperComum.BuscaVlrCotaCarteira(iCarteira: integer; dDataRef: TDateTime): double;
Var
   fSaldoInicialCotas: double;
   fSaldoInicialValor: double;
Begin
   Result := 0;

   // Verifica a HistCartInv para saber se já foi movimentada
   With dtmOperComum.qrySaldoCarteira Do Begin
         Close;
         If Not (Prepared) Then Prepare;
         ParamByName('CARTEIRA').AsInteger := iCarteira;
         ParamByName('DATAMOV').AsDateTime := dDataRef;
         ParamByName('HISTORICO').AsInteger := high(integer);
         Open;
         First;
      End;

   // LEITURA DOS SALDOS INICIAIS
   // Verifica se esta será a primeira movimentação da carteira
   If Not (dtmOperComum.qrySaldoCarteira.IsEmpty) Then Begin

         fSaldoInicialCotas := dtmOperComum.qrySaldoCarteiraSALDOCOTASCARTINV.AsFloat;
         fSaldoInicialValor := dtmOperComum.qrySaldoCarteiraSALDOVLRCARTINV.AsFloat;

         // Verifica se o Saldo em cotas é ZERO
         If fSaldoInicialCotas <> 0 Then Begin
               Result := fSaldoInicialValor / fSaldoInicialCotas;
            End Else Begin

               // Avança até achar saldo OK
               While Not (dtmOperComum.qrySaldoCarteira.EOF) Do Begin
                     fSaldoInicialCotas := dtmOperComum.qrySaldoCarteiraSALDOCOTASCARTINV.AsFloat;
                     fSaldoInicialValor := dtmOperComum.qrySaldoCarteiraSALDOVLRCARTINV.AsFloat;

                     If fSaldoInicialCotas <> 0 Then Begin
                           Result := fSaldoInicialValor / fSaldoInicialCotas;
                           Break;
                        End;

                     dtmOperComum.qrySaldoCarteira.Next;
                  End;

            End;
      End;
End;

// Calcula o Saldo de uma Carteira na Data Informada

Function TOperComum.BuscaSaldoCarteira(iCarteira: integer; dDataRef: TDateTime): double;
Begin
   Result := 0;

   // Verifica o Histórico da Carteira para saber se já foi movimentada
   With dtmOperComum.qrySaldoCarteira Do Begin
         Close;
         If Not (Prepared) Then Prepare;
         ParamByName('CARTEIRA').AsInteger := iCarteira;
         ParamByName('DATAMOV').AsDateTime := dDataRef;
         ParamByName('HISTORICO').AsInteger := high(integer);
         Open;
         First;

         // Se não for a primeira movimentação da carteira
         If Not (IsEmpty) Then Result := dtmOperComum.qrySaldoCarteiraSALDOVLRCARTINV.AsFloat;
      End;
End;

// Busca Todos os Saldos de um Investimento/Carteira em um Lote na Data Informada
// AL_2
// AL_5 - 05/10/2004 - Alteração na Ordem dos parâmetros e criação de novo parâmetro
// AL_75 - Provisao de Perda

Function TOperComum.BuscaTodosSaldosInvestLote(iCarteira, iCarteiraGerenc, iInvestimento, iHistCartInv, iCustodiante: integer;
   sLote, dDataRef: String; iMotivoBloqueio: Integer;
   Var fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu, fSdoCar, fSdoAqui, fSdoRend, fSdoMercado,
   fSdoVar, fSdoJur, fSdoPre, fSdoIRProv, fSdoIRApu, fSdoIOFProv, fSdoIOFApu, fSdoAgio,
   fSdoQtdLibCustodia, fSdoQtdBloqCustodia, fSdoQtdCPMF, fSdoProvPerda: double): boolean;
Var
   fCotacao: double;
Begin
   fSdoQtdeInvCart := 0;
   fSdoVlrInvCart := 0;
   fSdoAtu := 0;
   fSdoCar := 0;
   fSdoAqui := 0;
   fSdoRend := 0;
   fSdoMercado := 0;
   fSdoVar := 0;
   fSdoJur := 0;
   fSdoPre := 0;
   fSdoIRProv := 0;
   fSdoIRApu := 0;
   fSdoIOFProv := 0;
   fSdoIOFApu := 0;
   fSdoAgio := 0;
   fSdoQtdLibCustodia := 0;
   // AL_2
   fSdoQtdBloqCustodia := 0;
   // AL_5 - 05/10/2004
   fSdoQtdCPMF := 0;
   //AL_71
   //AL_78
   // AL_75
   fSdoProvPerda := 0;

   // Chama query que calcula o saldo mencionado
   fCotacao := OperComum.BuscaCotacaoInvest(iInvestimento, StrToDate(dDataRef), True);

   Try
      // Busca o Saldo na HISTCARTINV
      // AL_53
      If iCarteiraGerenc > 0 Then //Valor nulo
         Begin
            OperComum.LimpaParametros(dtmOperComum.qrySaldoInvestimentoCartGer);
            With dtmOperComum.qrySaldoInvestimentoCartGer Do
               Begin
                  ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteira;
                  ParamByName('IDCARTEIRAGERENC').AsInteger := iCarteiraGerenc;
                  ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
                  ParamByName('HISTORICO').AsInteger := iHistCartInv;
                  ParamByName('DATAMOV').AsString := dDataRef;
                  Open;

                  If Not (isEmpty) Then
                     Begin
                        fSdoQtdeInvCart := FieldByName('SALDOQTDEINVCART').AsFloat;
                        fSdoVlrInvCart := FieldByName('SALDOVLRINVCART').AsFloat;
                        fSdoAtu := FieldByName('SALDOATU').AsFloat;
                        fSdoAqui := FieldByName('SALDOAQUI').AsFloat;
                        fSdoRend := FieldByName('SALDOREND').AsFloat;
                        fSdoCar := FieldByName('SALDOCAR').AsFloat;
                        fSdoJur := FieldByName('SALDOJUROS').AsFloat;
                        fSdoVar := FieldByName('SALDOVARIACAO').AsFloat;
                        fSdoPre := FieldByName('SALDOPREMIO').AsFloat;
                        fSdoMercado := FieldByName('SALDOQTDEINVCART').AsFloat * fCotacao;
                        fSdoIRProv := FieldByName('SALDOIRPROV').AsFloat;
                        fSdoIRApu := FieldByName('SALDOIRAPU').AsFloat;
                        fSdoIOFProv := FieldByName('SALDOIOFPROV').AsFloat;
                        fSdoIOFApu := FieldByName('SALDOIOFAPU').AsFloat;
                        fSdoAgio := FieldByName('SALDOAGIO').AsFloat;
                        // AL_5 - 05/10/2004
                        fSdoQtdCPMF := FieldByName('SALDOQTDECPMF').AsFloat;
                        // AL_75
                        fSdoProvPerda := FieldByName('SALDOPROVPERDA').AsFloat;

                        If iIdHistCartInvTRC = -1 Then
                           iIdHistCartInvTRC := FieldByName('IDHISTCARTINV').AsInteger + 1;

                        Result := True;
                     End
                  Else
                     Result := False;
               End;
         End
      Else
         Begin
            OperComum.LimpaParametros(dtmOperComum.qrySaldoInvestimentoTNull);
            With dtmOperComum.qrySaldoInvestimentoTNull Do
               Begin
                  ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteira;
                  ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
                  ParamByName('HISTORICO').AsInteger := iHistCartInv;
                  ParamByName('DATAMOV').AsString := dDataRef;
                  ParamByName('IDLOTE').AsString := sLote;
                  Open;

                  If Not (isEmpty) Then
                     Begin
                        fSdoQtdeInvCart := FieldByName('SALDOQTDEINVCART').AsFloat;
                        fSdoVlrInvCart := FieldByName('SALDOVLRINVCART').AsFloat;
                        fSdoAtu := FieldByName('SALDOATU').AsFloat;
                        fSdoAqui := FieldByName('SALDOAQUI').AsFloat;
                        fSdoRend := FieldByName('SALDOREND').AsFloat;
                        fSdoCar := FieldByName('SALDOCAR').AsFloat;
                        fSdoJur := FieldByName('SALDOJUROS').AsFloat;
                        fSdoVar := FieldByName('SALDOVARIACAO').AsFloat;
                        fSdoPre := FieldByName('SALDOPREMIO').AsFloat;
                        fSdoMercado := FieldByName('SALDOQTDEINVCART').AsFloat * fCotacao;
                        fSdoIRProv := FieldByName('SALDOIRPROV').AsFloat;
                        fSdoIRApu := FieldByName('SALDOIRAPU').AsFloat;
                        fSdoIOFProv := FieldByName('SALDOIOFPROV').AsFloat;
                        fSdoIOFApu := FieldByName('SALDOIOFAPU').AsFloat;
                        fSdoAgio := FieldByName('SALDOAGIO').AsFloat;
                        // AL_5 - 05/10/2004
                        fSdoQtdCPMF := FieldByName('SALDOQTDECPMF').AsFloat;
                        // AL_75
                        fSdoProvPerda := FieldByName('SALDOPROVPERDA').AsFloat;

                        If iIdHistCartInvTRC = -1 Then
                           iIdHistCartInvTRC := FieldByName('IDHISTCARTINV').AsInteger + 1;

                        Result := True;
                     End
                  Else
                     Result := False;
               End;
         End;
      //Al_61 - 11/01/2006
      // Busca o Saldo na HISTCUSTODIA
      If iCustodiante <> -1 Then
         Begin
            fSdoQtdLibCustodia := 0;
            OperComum.LimpaParametros(dtmOperComum.qrySaldoInvestCustodia);
            With dtmOperComum.qrySaldoInvestCustodia Do
               Begin
                  ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteira;
                  ParamByName('IDMOTIVOBLOQUEIO').AsInteger := iMotivoBloqueio;
                  If iCarteira = 0 Then
                     ParamByName('IDCARTEIRAINVEST').Clear;
                  ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
                  ParamByName('IDCUSTODIANTE').AsInteger := iCustodiante;
                  ParamByName('DATAMOV').AsString := dDataRef;
                  Open;

                  If Not (isEmpty) Then
                     Begin
                        fSdoQtdLibCustodia := dtmOperComum.qrySaldoInvestCustodia.FieldByName('SALDOLIBERADO').AsFloat;
                        // AL_2
                        fSdoQtdBloqCustodia := dtmOperComum.qrySaldoInvestCustodia.FieldByName('SALDOBLOQUEADO').AsFloat;
                        //AL_71
                        //AL_78
                        Result := True;
                     End
                  Else
                     Result := False;
               End;
         End;
   Finally
      dtmOperComum.qrySaldoInvestCustodia.Close;
      dtmOperComum.qrySaldoInvestimentoCartGer.Close;
      dtmOperComum.qrySaldoInvestimentoTNull.Close;
   End;
End;

// Função que Retorna Valor a Contabilizar

Function TOperComum.BuscaValorAContabilizar(iIdHistcartinv, iIdTipoDespInvest, iTipoInvest: longint; bOperVenda: boolean;
   Var fValorAContabilizar: Double): boolean;
Var
   QryLocal, QryLocal1: TwwQuery;
   DataCotacao: TDateTime;
Begin
   // Cria Objetos Locais
   QryLocal := TwwQuery.Create(Application);
   QryLocal.DatabaseName := 'BaseDados';
   QryLocal1 := TwwQuery.Create(Application);
   QryLocal1.DatabaseName := 'BaseDados';

   Result := true;
   fValorAContabilizar := 0;

   If FazQuery(QryLocal,
      //AL_77
      'SELECT VLRJUROS, VLRPREMIO, VLRVARIACAO, MOVIMAQUI,  VLRMOVCARTINV, NATURMOVCARTINV, ' +
      '       VLRIRAPU, VLRIRPROV, VLRIOFAPU,   VLRIOFPROV, VLRAGIO,       VLRPROVPERDA, ' +
      '       QTDEMOVINVCART, IDINVESTIMENTO, IDOPERACAOINVEST ' +
      'FROM HISTCARTINV ' +
      'WHERE (IDHISTCARTINV = ' + QuotedStr(IntToStr(iIdHistCartInv)) + ') ') Then Begin

         Case iIdTipoDespInvest Of

            -1: // Custo de Aquisição Registrado
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('MOVIMAQUI').AsFloat;
                  If QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' Then
                     fValorAContabilizar := -fValorAContabilizar;

                  // AL_30 Ini
                  // Al_27 Ini
                  //AL_3
                  // Soma as despesas no Custo
                  If Sistema.NomeEmpresa = 'REFER' Then
                     Begin
                        // Busca Total de Despesas desta Operacao
                        FazQuery(QryLocal1,
                           'SELECT SUM(VLRDESPOPER) AS VLRDESPOPER FROM DESPOPERINVEST WHERE IDOPERACAOINVEST = ' +
                           IntToStr(QryLocal.FieldByName('IDOPERACAOINVEST').AsInteger));
                        // Calcula Valor da Movimentacao
                        fValorAContabilizar := fValorAContabilizar + QryLocal1.FieldByName('VLRDESPOPER').AsFloat;
                     End;
                  // Al_27 Fim
                  // AL_30 Fim
               End;
            -2: // Variação Positiva Registrada
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
                  If iTipoInvest = 1 Then // RF
                     Begin
                        If QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' Then // OPE de Venda
                           Begin
                              If fValorAContabilizar > 0 Then
                                 fValorAContabilizar := 0 // é Variação Negativa RF
                              Else
                                 fValorAContabilizar := -fValorAContabilizar; // é Variação Positiva
                           End
                        Else If (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'G') Or
                           (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'P') Then // ATU
                           Begin
                              If fValorAContabilizar < 0 Then
                                 fValorAContabilizar := 0; // Variação Negativa RF
                           End;
                     End
                  Else If iTipoInvest = 2 Then // RV
                     Begin
                        If QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' Then // OPE de Venda
                           Begin
                              If fValorAContabilizar > 0 Then
                                 fValorAContabilizar := 0 // é Variação Positiva
                              Else
                                 fValorAContabilizar := -fValorAContabilizar; // é Variação Negativa RV
                           End
                              //AL_82
                        Else If QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'A' Then // Tranf. Plano (Aumento)
                           Begin
                              If fValorAContabilizar < 0 Then
                                 fValorAContabilizar := 0 //  é Variação Negativa RV
                              Else
                                 fValorAContabilizar := -fValorAContabilizar; //  é Variação Positiva
                           End
                        Else If (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'G') Or
                           (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'P') Then // ATU
                           Begin
                              If fValorAContabilizar < 0 Then
                                 fValorAContabilizar := 0; // Variação Negativa RV
                           End;
                     End;
               End;
            -3: // Prêmio Registrado
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRPREMIO').AsFloat;
                  If QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' Then
                     fValorAContabilizar := -fValorAContabilizar;
               End;
            -4: // Lucro na Venda
               Begin
                  If Not bOperVenda Then Begin
                        MsgDlg('Parametrização Incorreta. Lucro/Prejuizo sem Operação de Venda associada. ',
                           'Mensagem do Sistema ', MtWarning, [MbOk], 0);
                        Result := false;
                     End;
                  fValorAContabilizar := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
                  If fValorAContabilizar < 0 Then
                     fValorAContabilizar := 0; // Prejuízo
               End;
            -5: // Prejuízo na Venda
               Begin
                  If Not bOperVenda Then Begin
                        MsgDlg('Parametrização Incorreta. Lucro/Prejuizo sem Operação de Venda associada. ',
                           'Mensagem do Sistema ', MtWarning, [MbOk], 0);
                        Result := false;
                     End;
                  fValorAContabilizar := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
                  If fValorAContabilizar > 0 Then
                     fValorAContabilizar := 0; // Lucro
               End;
            -6: // Juros Registrados
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRJUROS').AsFloat;
                  If (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'C') Or
                     (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D') Then
                     fValorAContabilizar := -fValorAContabilizar;
               End;
            -7: // IR Apurado
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRIRAPU').AsFloat;
               End;
            -8: // IR Provisionado
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRIRPROV').AsFloat;
               End;
            -9: // IOF Apurado
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRIOFAPU').AsFloat;
               End;
            -10: // IOF Provisionado
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRIOFPROV').AsFloat;
               End;
            -11: // Ágio
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRAGIO').AsFloat;
                  If fValorAContabilizar < 0 Then
                     fValorAContabilizar := 0; // Desagio
               End;
            -12: // Provisão de Perda (Juros)
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRJUROS').AsFloat;
                  If QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' Then
                     fValorAContabilizar := -fValorAContabilizar;
               End;
            -13: // Provisão de Perda (C.Monetária)
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
                  If QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' Then
                     fValorAContabilizar := -fValorAContabilizar;
               End;
            -14: // Taxa Operacional Basica Normal
               Begin
                  //
               End;
            -15: // Taxa Operacional  Basica Day-Trade
               Begin
                  //
               End;
            -16: // Taxa da Bolsa (BM&F)
               Begin
                  //
               End;
            -17: // Taxa de Registro (BM&F)
               Begin
                  //
               End;
            -18: // Taxa de Liquidacao (BM&F)
               Begin
                  //
               End;
            -19: // Variação Negativa Registrada
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
                  If iTipoInvest = 1 Then // RF
                     Begin
                        If QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' Then // OPE de Venda
                           Begin
                              If fValorAContabilizar < 0 Then
                                 fValorAContabilizar := 0 // é Variação Positiva RF
                              Else
                                 fValorAContabilizar := -fValorAContabilizar; // é Variação Negativa RF
                           End
                        Else If (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'G') Or
                           (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'P') Then // ATU
                           Begin
                              If fValorAContabilizar > 0 Then
                                 fValorAContabilizar := 0; // é Variação Positiva RF
                           End;
                     End
                  Else If iTipoInvest = 2 Then // RF
                     Begin
                        If QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' Then // OPE de Venda
                           Begin
                              If fValorAContabilizar < 0 Then
                                 fValorAContabilizar := 0 // é Variação Positiva RV
                              Else
                                 fValorAContabilizar := -fValorAContabilizar; // é Variação Negativa RV
                           End
                              //AL_82
                        Else If QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'A' Then // Tranf. Plano (Aumento)
                           Begin
                              If fValorAContabilizar > 0 Then
                                 fValorAContabilizar := 0 // é Variação Negativa RV
                              Else
                                 fValorAContabilizar := -fValorAContabilizar; // é Variação Positiva RV
                           End
                        Else If (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'G') Or
                           (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'P') Then // ATU
                           Begin
                              If fValorAContabilizar > 0 Then
                                 fValorAContabilizar := 0; // é Variação Positiva RV
                           End
                        //Ricardo Cristiano - 28/07/2011 - N. Sol 150667 -  N. Kintana 1376593
                        Else If QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'L' Then // LUC
                           Begin
                              fValorAContabilizar := 0 // não há Variação Negativa
                           End;  
                     End;

               End;                                               
            -20: // Ajuste Normal Positivo BM&F
               Begin
                  //
               End;
            -21: // Ajuste Normal Negativo BM&F
               Begin
                  //
               End;
            -22: // IR Litigio Positivo
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRIRAPU').AsFloat;
                  If fValorAContabilizar < 0 Then
                     fValorAContabilizar := 0; // IR Litigio Negativo
               End;
            -23: // IR Litigio Negativo
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRIRAPU').AsFloat;
                  If fValorAContabilizar > 0 Then
                     fValorAContabilizar := 0; // IR Litigio Positivo
               End;
            -24: // Desagio
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRAGIO').AsFloat;
                  If fValorAContabilizar > 0 Then
                     fValorAContabilizar := 0; // Agio
               End;
            //AL_72 Ini
            -32: // Incorporação de Variação Positiva
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
                  If fValorAContabilizar > 0 Then
                     fValorAContabilizar := 0 // é Variação Negativa RV
               End;
            //AL_72 Fim
            //AL_73 Ini
            -33: // Incorporação de Variação Negativa
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
                  If fValorAContabilizar < 0 Then
                     fValorAContabilizar := 0 // é Variação Positiva RV
               End;
            //AL_73 Fim
            //AL_77
            -34: // Provisão de perda
               Begin
                  fValorAContabilizar := QryLocal.FieldByName('VLRPROVPERDA').AsFloat;
               End;
         Else
            Begin
               // Melhora no texto da mensagem - 26/07/2006
               MsgDlg('Impossível Contabilizar. Tipo de Despesa Interna não prevista. ' + #13 +
                  'Código do Tipo de Despesa encontrado: ' + IntToStr(iIdTipoDespInvest),
                  'Mensagem do Sistema ', MtWarning, [MbOk], 0);
               Result := false;
            End;
         End;
      End Else Begin
         MsgDlg('Impossível Contabilizar. Valores não encontrados. ',
            'Mensagem do Sistema ', MtWarning, [MbOk], 0);
         Result := false;
      End;
   QryLocal.Close;
   QryLocal.Free;
   QryLocal1.Close;
   QryLocal1.Free;
End;

Function TOperComum.DivValorZero(Valor1, Valor2: Extended): Extended;
Begin
   If Valor2 <> 0 Then
      Result := Valor1 / Valor2
   Else
      Result := 0;
End;

Function TOperComum.Trunca(rValor: Double; iQtdDec: Integer): Double;
Var
   i: Integer;
   sValor, sValor1: String;
Begin
   sValor := FloatToStr(rValor);
   For i := 1 To Length(sValor) Do
      Begin
         If Copy(sValor, i, 1) = ',' Then
            Begin
               sValor1 := sValor1 + Copy(sValor, i, 1 + iQtdDec);
               Break;
            End
         Else
            sValor1 := sValor1 + Copy(sValor, i, 1);
      End;
   Result := StrToFloat(sValor1);
End;

Function TOperComum.Round(rValor: Double; iQtdDec: Integer): Double;
Var
   i: Integer;
   sValor, sValor1: String;
Begin
   If iQtdDec < 0 Then
      iQtdDec := 2;
   sValor := FloatToStrF(rValor, ffNumber, 22, iQtdDec);
   For i := 1 To Length(sValor) Do
      Begin
         If (Copy(sValor, i, 1) <> '.') Then
            Begin
               sValor1 := sValor1 + Copy(sValor, i, 1);
            End;
      End;
   Result := StrToFloat(sValor1);
End;

Function TOperComum.ConvertePonto(sConverter: String): String;
Var
   iPosPonto: Integer;
Begin

   iPosPonto := Pos('.', sConverter); // Tira o Ponto
   If iPosPonto <> 0 Then
      sConverter := Copy(sConverter, 1, iPosPonto - 1) + Copy(sConverter, iPosPonto + 1, Length(sConverter));

   iPosPonto := Pos(',', sConverter);
   If iPosPonto <> 0 Then
      sConverter := Copy(sConverter, 1, iPosPonto - 1) + '.' + Copy(sConverter, iPosPonto + 1, Length(sConverter));
   Result := sConverter;
End;

Function TOperComum.StripChar(S: String; C: Char): String;
Var
   I: Integer;
Begin
   Result := '';
   For I := 1 To Length(S) Do
      If S[I] <> C Then
         result := result + S[I];
End;

Function TOperComum.VerificaData(sData: String): Boolean;
Var j, i: Integer;
Begin
   j := 0;
   For i := 1 To Length(sData) Do
      Begin
         If j < 2 Then
            Begin
               If Copy(sData, i + 2, 1) = '/' Then
                  j := j + 1;
            End;
      End;
   If j < 2 Then
      Result := False
   Else
      Result := True;
End;

Function TOperComum.BuscaForCli(iTipoInvest, iCorretEmissor, iTipoOperacao, iTipoCliente: integer): integer;
Begin
   Result := -1;
   With dtmOperComum.QryBuscaTipoOperacao Do
      Begin
         Close;
         ParamByName('IDTIPOINVEST').AsInteger := iTipoInvest;
         ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOperacao;
         Open;
         If FieldByName('RECPAG').AsString <> 'N' Then
            Begin
               // Busca Credor da Despesa caso Tipo de Credor
               If FieldByName('TIPCREDOR').AsString <> '' Then
                  Begin
                     // Atualiza de acordo Emissor/Corretor
                     If FieldByName('TIPCREDOR').AsString = 'CO' Then
                        Begin
                           Try
                              Documento.ForCli.Inserir(iCorretEmissor,
                                 Sistema.IdEmpresa, -1, 0, pRPI.IDTIPOCLIENTECOR, Sistema.IdEmpresa,
                                 '', '', '', '', 'C', False); // Cliente
                              Documento.ForCli.Inserir(iCorretEmissor,
                                 Sistema.IdEmpresa, -1, 0, pRPI.IDRAMOFORCOR, Sistema.IdEmpresa,
                                 '', '', '', '', 'F', False); // Fornecedor
                           Except // Função gerava um Abort quando o Fornecedor
                           End; // já estava cadastrado
                           Result := iCorretEmissor;
                        End
                     Else
                        Begin
                           // Transforma Emissor em Fornecedor
                           Try
                              If FieldByName('RECPAG').AsString = 'R' Then
                                 Begin
                                    Documento.ForCli.Inserir(iCorretEmissor,
                                       Sistema.IdEmpresa, -1, 0, pRPI.IDTIPOCLIENTEEMI, Sistema.IdEmpresa,
                                       '', '', '', '', 'C', False); // Cliente
                                 End
                              Else If FieldByName('RECPAG').AsString = 'P' Then
                                 Begin
                                    Documento.ForCli.Inserir(iCorretEmissor,
                                       Sistema.IdEmpresa, -1, 0, pRPI.IDRAMOFOREMI, Sistema.IdEmpresa,
                                       '', '', '', '', 'F', False); // Fornecedor
                                 End;
                           Except // Função gerava um Abort quando o Fornecedor
                           End; // já estava cadastrado
                           Result := iCorretEmissor;
                        End;
                  End // Caso Tipo Credor não Informado
               Else
                  Begin
                     // Busca o Credor no Sub........
                     With dtmOperComum.qryAuxiliar Do
                        Begin
                           SQL.Clear;
                           SQL.Add('SELECT IDFORCLI FROM FORCLIXTIPOPER ');
                           SQL.Add('WHERE (IDTIPOINVEST  = ' + IntToStr(iTipoInvest) + ') AND');
                           SQL.Add('      (IDTIPOOPERACAO= ' + IntToStr(iTipoOperacao) + ') AND');
                           SQL.Add('      (EMPRESAPROP   = ' + IntToStr(Sistema.IdEmpresa) + ')');
                           Open;
                           Result := FieldByName('IDFORCLI').AsInteger;
                           // Caso não encontre o Fornecedor
                           If Result = 0 Then
                              Begin
                                 MsgDlg('O Credor deste Tipo de Operação não foi Informado, ' + #13 +
                                    'A operação não será efetuada!', 'Mensagem do Sistema', MtError, [MbOk], 0);
                                 Exit;
                              End;
                        End;
                  End;
            End;
      End;
End;

Function TOperComum.VerificaFechamento(edDataRef: TDateTime): Boolean;
Var dDataAnterior: TDateTime;
Begin
   dDataAnterior := edDataRef - 1;
   While Not DiasUteisInv.DiaUtil(dDataAnterior, -1, 1, '', True, False, False) Do
      dDataAnterior := dDataAnterior - 1; // Achar o dia útil anterior

   dtmOperComum.QryVerFechamento.Close;
   dtmOperComum.QryVerFechamento.Open;
   Result := true;
   If dtmOperComum.QryVerFechamento.FieldByName('DATAULTFECH').AsDateTime < dDataAnterior Then
      Begin
         MsgDlg('Não foi feito o Fechamento do Dia Anterior.', 'Mensagem do Sistema',
            mtInformation, [MbOk], 0);
         Result := False;
      End;
   dtmOperComum.QryVerFechamento.Close;
End;

//AL_99
// Função que efetua o par de lançamentos Contábeis e o lançamento de CAPCAR (se aplicáveis)
// associados a uma Operação de Investimento de Renda Fixa e Raviável (de acordo com a tabela
// PadrLancContInv), já contabilizando inclusive as despesas da Operação.

Function TOperComum.LancaOperPendRV(iIdCorretValores, iOperacaoOrigem, iEmpresaProp,
   iModuloOrigem, iTipoInvest, iInvestimento, iTipoOperacao,
   iOperacao, iForCli, iCarteira, iMoeda, iiPlanPrev: integer;
   sTipoTitulo, sLote, sHistCapCar, sRecPagBol: String;
   Var sTipoRecDesBol: String;
   Var bCriaLancto: boolean;
   fTotalLiquido, fVlrOper: currency;
   dDataOper, dDataVenc: TDateTime;
   Var iPlano, iPlanilhaOper, iDocumentoOper: integer;
   Var sMensErro: String): shortint;
Var
   bTransacao, bMostraMsg, bAchouOperacao, bLancaCAPCAROper, bVenda: boolean;
   iNumFatura, iPlanoDs, iAchouPadrao, iSubContaDebOp, iSubContaCredOp,
      iUnidNegocOp, iTipoDocOp, iPortador, iNumLancamento: integer;

   sOperacao, sStatus, sComplementoOp, sComplementoDs, sContaDebOp, sContaCredOp,
      sCentroCustoDebOp, sCentroCustoCredOp, sCentroResponOp, sTipoRecDesOp,
      sTipoPerOp, sHistoricoOp, sRecPagNaoOp, sRecPagOp, sModulo, sDataLanc,
      sDataVenc, sContaDoc, sPlano, sDebCre: String;

   fVlrLiquido, fVlrLancto: double;

   iPlanoPrev, iPatro: Integer;
   fNoDocumento: extended;

   //AL_99
   qryAuxAmbiente, qryAuxLocal, qryLancaDocumento: TwwQuery;

Begin
   Result := 0;

   //AL_96 - Não faz o Contábil nem financeiro quando o Flag de cada nódulo estiver marcado
   If ((iTipoInvestUsu = 2) And (pRPI.FLGINTCONTABRV = 'N')) Then
      Exit;

   Screen.Cursor := crHourGlass;
   bTransacao := False; // a priori, não é necessário que se inicie uma transação
   bMostraMsg := True;
   iNumFatura := 0;
   sOperacao := '2';
   sStatus := '';
   sComplementoOp := '79';
   //AL_93
   sModulo := '79';
   sComplementoDs := '';
   fVlrLiquido := 0;
   iPlanoDs := -1;
   If iPlanilhaOper <= 0 Then
      iPlanilhaOper := -1;
   sPlano := IntToStr(iPlano);

   Try
      qryAuxAmbiente := TwwQuery.Create(Application);
      qryAuxAmbiente.DatabaseName := 'BaseDados';
      Try

         //AL_99

         With dtmOperComum.qryParamInvest Do
            Begin
               Close;
               If Not (Prepared) Then Prepare;
               Open;
            End;

         With dtmOperComum.qryInvestimento Do Begin
               Close;
               If Not (Prepared) Then Prepare;
               ParamByName('INVESTIMENTO').AsInteger := iInvestimento;
               Open;
            End;

         With dtmOperComum.qryCarteira Do Begin
               Close;
               If Not (Prepared) Then Prepare;
               ParamByName('CARTEIRA').AsInteger := iCarteira;
               Open;
            End;

         //AL_99
         qryAuxAmbiente.Close;
         qryAuxAmbiente.Sql.Clear;
         qryAuxAmbiente.Sql.Add('SELECT PLANPRVCONTABPATRO AS NOME, IDPATRO, IDPLANOPREV ');
         qryAuxAmbiente.Sql.Add('FROM VWPLANPREVCTBPATR ');
         qryAuxAmbiente.Sql.Add('WHERE IDPLANPREVCTBPATR = ' + IntToStr(iiPlanPrev));
         qryAuxAmbiente.Open;
         iPlanoPrev := qryAuxAmbiente.FieldByName('IDPLANOPREV').AsInteger;
         iPatro := qryAuxAmbiente.FieldByName('IDPATRO').AsInteger;
         qryAuxAmbiente.Close;

         // Verifica o Padrão de Lançamento mais adequado
         //AL_86
         //AL_107
         iAchouPadrao := CtrlInvContab.BuscaPadrLanc.Executa(RetornaSegmentacaoRV(iInvestimento), //Renan CGPC
            dDataOper, iTipoInvest, iTipoOperacao, 0, iInvestimento, iCarteira,
            iiPlanPrev,
            fVlrOper, sTipoTitulo, 'OPE');
         iPlano := CtrlInvContab.BuscaPadrLanc.Plano;
         iSubContaDebOp := CtrlInvContab.BuscaPadrLanc.SubContaDeb;
         iSubContaCredOp := CtrlInvContab.BuscaPadrLanc.SubContaCre;
         iUnidNegocOp := CtrlInvContab.BuscaPadrLanc.UnidNegoc;
         sContaDebOp := CtrlInvContab.BuscaPadrLanc.ContaDeb;
         sContaCredOp := CtrlInvContab.BuscaPadrLanc.ContaCre;
         sCentroCustoDebOp := CtrlInvContab.BuscaPadrLanc.CentroCustoDeb;
         sCentroCustoCredOp := CtrlInvContab.BuscaPadrLanc.CentroCustoCred;
         sCentroResponOp := CtrlInvContab.BuscaPadrLanc.CentroRespon;
         sTipoRecDesOp := CtrlInvContab.BuscaPadrLanc.TipoRecDes;
         sTipoPerOp := CtrlInvContab.BuscaPadrLanc.TipoPer;
         sHistoricoOp := CtrlInvContab.BuscaPadrLanc.Historico;
         sRecPagNaoOp := CtrlInvContab.BuscaPadrLanc.RecPagNao;

         bAchouOperacao := (iAchouPadrao = 0);

         // Verificação dos parâmetros do Tipo de Operação -----------------------------------------------
         With dtmOperComum.qryTipoOperacao Do
            Begin
               Close;
               If Not (Prepared) Then Prepare;
               ParamByName('TIPOINVEST').AsInteger := iTipoInvest;
               ParamByName('TIPOOERACAO').AsInteger := iTipoOperacao;
               Open;
               bLancaCAPCAROper := FieldByName('FLGGERACAPCAR').AsInteger = 1;
               sRecPagOp := FieldByName('RECPAG').AsString;
               bVenda := (FieldByName('NATUREZAOPERACAO').AsString = 'D');
            End;

         With dtmOperComum.qryAuxiliar Do
            Begin
               close;
               sql.clear;
               sql.Add('SELECT CODTIPDOC FROM TIPODOCRECPAG WHERE CODTIPDOC IN (86,89) AND');
               sql.Add(' RECPAG = ''' + sTipoRecDesBol + '''');
               Open;
               iTipoDocOp := FieldByName('CODTIPDOC').AsInteger;
               Close;
            End;

         With dtmOperComum.QryBuscaTpOpOperInvest Do Begin
               Close;
               If Not (Prepared) Then Prepare;
               ParamByName('IDOPERACAOINVEST').AsInteger := iOperacao;
               Open;
            End;

         // Início do processamento ----------------------------------------------------------------------

         //AL_99
         If (fVlrOper <> 0) Then
            Begin
               // verifica se já existe transação em andamento; se não houver, inicia uma
               If Not (dtmBaseDados.dbBaseDados.InTransaction) Then
                  Begin
                     bTransacao := True;
                     StartTransacao;
                  End;

               //AL_9
               // Chamada às funções de integração Contábil e Financeira ---------------------------------------
               If (bAchouOperacao) Then
                  Begin
                     // Se a Operação Integra CAPCAR, Cria Documento
                     If (bLancaCAPCAROper) And (iDocumentoOper = -1) Then
                        Begin
                           //AL_99
                           //AL_86
                           qryLancaDocumento := dtmOperComum.qryLancaDocumento;
                           qryAuxLocal := dtmOperComum.qryAuxiliar;

                           // Gera o identificador incremental da tabela DOCUMENTO
                           If CtrlInvContab.Documento.GetDocSequence Then
                              iDocumentoOper := CtrlInvContab.Documento.CodDocumento;
                           // Prepara um novo documento
                           CtrlInvContab.Documento.Prepare;
                           iPortador := -1;
                           CtrlInvContab.Documento.GetNoDocumento;
                           //AL_93
                           fNoDocumento := CtrlInvContab.Documento.NoDocumento;
                           sContaDoc := OperComum.IIF(sRecPagBol[1] = 'P', sContaCredOp, sContaDebOp);

                           dtmOperComum.qryAuxiliar.Close;
                           dtmOperComum.qryAuxiliar.sql.clear;
                           dtmOperComum.qryAuxiliar.sql.Add('SELECT CONTACOPERFIN, PLANO ');
                           dtmOperComum.qryAuxiliar.sql.Add('FROM PADRLANCCONTINV ');
                           dtmOperComum.qryAuxiliar.sql.Add('WHERE IDTIPOOPERACAO = ''' + IntToStr(iTipoOperacao) + '''');
                           //William M. Santos - Renan Cristiano - 12/02/2010 - SOL 130989 - KTN 739640 - INI
                           dtmOperComum.qryAuxiliar.Sql.Add('AND DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA) FROM PADRLANCCONTINV WHERE IDTIPOOPERACAO = ''' + IntToStr(iTipoOperacao) + '''');
                           dtmOperComum.qryAuxiliar.Sql.Add('                    AND DATAVIGENCIA <= TO_DATE('+QuotedStr(dateToStr(dDataOper))+','+QuotedStr('dd/mm/yyyy')+'))');
                           dtmOperComum.qryAuxiliar.Sql.Add('GROUP BY CONTACOPERFIN, PLANO');
                           //William M. Santos - Renan Cristiano - 12/02/2010 - SOL 130989 - KTN 739640 - INI
                           dtmOperComum.qryAuxiliar.Open;
                           sContaDoc := dtmOperComum.qryAuxiliar.FieldByName('CONTACOPERFIN').AsString;
                           If sPlano = '' Then
                              sPlano := dtmOperComum.qryAuxiliar.FieldByName('PLANO').AsString;
                           dtmOperComum.qryAuxiliar.Close;

                           // Parametros para a Segregação
         //                  CtrlInvContab.Plano := iPlano;
         //                  CtrlInvContab.Patro := iPatro;
         //                  CtrlInvContab.PlanPrev := iPlanoPrev;
                           // Cria Documento
         //                  if not CtrlInvContab.Documento.SetValues(iDocumentoOper, CtrlInvContab.Documento.NoDocumento,
         //                                                           sComplementoOp, sStatus, sRecPagBol[1], sOperacao,
         //                                                           '' {sNumslip}, ''{sNumleitcodbarras}, sContaDoc, sCentroCustoCredOp,
         //                                                           ''{sNossonumero}, ''{sNumdigcodbarras}, ''{sGrupodoc}, ''{sFlgemitelancbaix},
         //                                                           ''{sFlgconfirmarecpag}, ''{sEmisbloq}, ''{sReferencia}, ''{sObs},
         //                                                           dDataVenc {dDatavencto}, dDataOper {dDataemissao},
         //                                                           dDataVenc {dDataprogramada}, 0{dDataremessa}, 0{dDatalimite}, 0{dDatacorrecao},
         //                                                           0{rVlrmulta}, 0{rValorjuros}, 0{rValordesconto}, 0{rPercjurossimples}, 0{rPercjurosatuarial},
         //                                                           iTipoDocOp, Sistema.idEmpresa, iModuloOrigem, iForCli, iNumFatura,
         //                                                           0{liIdcbancaria}, -1{iUnidNegocOp}, iPlano, 0{liNumcpbaixa}, 0{liNumapgr},
         //                                                           iMoeda, 0{liLotetransmissao}, -1{liIndicecorrecao},
         //                                                           Sistema.idUsuario, Sistema.idEmpresa, 1{liFlgnaoconciliado}, 0{liControleremessa},
         //                                                           iSubContaCredOp, iPortador,
         //                                                           0{liCodgrupocnab}, 0{liCodgeradorinss}, -1{liCodforma},
         //                                                           dDataVenc {dDataDisp},
         //                                                           CtrlInvContab.CriterioSegregacao {iIdSegregaCriter: integer = -1}) then
         //                     Raise Exception.Create(CtrlInvContab.MessageInfo);
         //AL_93
         //                  Documento.DataDisponibilidade := StrToDate(sDataVenc);
                           Documento.DataDisponibilidade := dDataVenc;
                           Documento.Inserir(qryLancaDocumento, iDocumentoOper, sModulo, IntToStr(iPlano),
                                             sContaDoc, sCentroCustoCredOp, iMoeda,
                                             -1 {iUnidNegocOp}, Sistema.idEmpresa, iForCli, iTipoDocOp, iPortador, sRecPagBol[1], fNoDocumento,
                           //AL_93
//                                    sComplementoOp, sDataLanc, sDataVenc, sDataVenc{DataProgramada=DataVencimento}, sStatus,
                                             sComplementoOp, DateToStr(dDataOper), DateToStr(dDataVenc), DateToStr(dDataVenc) {DataProgramada=DataVencimento}, sStatus,
                                             iNumFatura, sOperacao, Sistema.idUsuario, iSubContaCredOp, -1, '', '', False,
                                             -1, -1, -1);

                           //AL_8 -
                           With dtmOperComum.QryBuscaTpOpOperInvest Do
                           Begin
                              If FieldByName('FLGCONTAINVEST').AsInteger > 0 Then
                              Begin
                                 //AL_86
                                 If iDocumentoOper > 0 Then
                                    //                           CtrlInvContab.Documento.ContaInvest := iFlgContaInvest;
                                    ExecutaQuery(qryAuxAmbiente,
                                       ' UPDATE DOCUMENTO SET DOCUMENTO.FLGCONTAINVEST = ' + FieldByName('FLGCONTAINVEST').AsString +
                                       ' WHERE  DOCUMENTO.CODDOCUMENTO = ' + IntToStr(iDocumentoOper));
                              End;
                           End;

                           // Cria Rateio
         //                  if not CtrlInvContab.Documento.RateioDocumSetValues(
         //                                       fVlrOper, 0{rValorOM}, 0{rVlrresorcamen},
         //                                       0{liIdrateiodocum}, Sistema.idEmpresa {liIdpessoa},
         //                                       iDocumentoOper, iUnidNegocOp, 0{liMoecodigo}, Sistema.idUsuario,
         //                                       0{liIdreservaorcamen},
         //                                       iPlano, iPlanoPrev, iPatro,
         //                                       pRPI.IDPROGRAMA, // dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger,
         //                                       0{liIdprocesso}, Sistema.idEmpresa,
         //                                       sTipoRecDesBol, sRecPagBol[1], sCentroResponOp,
         //                                       sCentroCustoCredOp, ''{sNumimovel}) then
         //                     Raise Exception.Create(CtrlInvContab.MessageInfo);
                           //AL_99
                           Documento.Rateio.Inserir(iDocumentoOper, sTipoRecDesOp, sRecPagBol[1], sCentroResponOp,
                                                    Sistema.idEmpresa, fVlrOper, 0, Sistema.idUsuario, iUnidNegocOp, -1,
                                                    //AL_101
                                                    sCentroCustoCredOp, //sCentroResponOp,
                                                    iPatro,
                                                    dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger,
                                                    iPlanoPrev);
                        End;

                     fVlrLiquido := fVlrLiquido + fVlrOper;

                     If ((iDocumentoOper <> -1) And ((fVlrLiquido <> 0) Or (fTotalLiquido <> 0))) Then Begin

                           If sRecPagBol[1] = 'P' Then
                              sDebCre := 'C'
                           Else
                              sDebCre := 'D';

                           If bCriaLancto Then
                              Begin
                                 If fTotalLiquido <> 0 Then
                                    fVlrLancto := fTotalLiquido
                                 Else
                                    fVlrLancto := fVlrLiquido;

                                 // gera o identificador incremental da tabela LANCAMENTO
                                 //AL_99
                                 iNumLancamento := Documento.GerarNumLancto(qryAuxLocal, iDocumentoOper);
                                 //                     if not CtrlInvContab.Documento.LancoDocumSetValues(
                                 //                                          dDataLanc, iDocumentoOper, 0 {iNumLancamento},
                                 //                                          fVlrLancto, 0{rValorOM}, fVlrLancto,
                                 //                                          iUnidNegocOp, CtrlInvContab.Planilha, 0{liNumlotemanual},
                                 //                                          Sistema.idUsuario, Sistema.idEmpresa,
                                 //                                          0{liIdnflivro}, 0{liEstorno}, iTipoDocOp, 0{liCoddocinss}, 0{liCodalterador},
                                 //                                          sOperacao,  ''{sNumrecibo}, ''{sNumnf}, ''{sNumfatura},
                                 //                                          sHistCapCar, ''{sFlgtipofatura}, ''{sFlgrecebeunf}, ''{sFlgfatemitida},
                                 //                                          sDebCre, Sistema.IdModulo, iPlano,
                                 //                                          Sistema.UsaPlanoPatro) then
                                 //                        Raise Exception.Create(CtrlInvContab.MessageInfo);
                                 Documento.CriarLanctoDoc(qryLancaDocumento, iDocumentoOper, iNumLancamento, -1 {CodAlterador},
                                    //AL_93
                                    //                                              iPlanilhaOper, sDataLanc, fVlrLancto, 0, -1{Estorno}, sDebCre,
                                    iPlanilhaOper, DateToStr(dDataOper), fVlrLancto, 0, -1 {Estorno}, sDebCre,
                                    sOperacao, sHistCapCar, Sistema.idUsuario, False {bContabiliza}, -1, '');
                                 bCriaLancto := false;
                              End;
                        End;

                     If ((iTipoOperacao = -7) Or (iTipoOperacao = -8)) And
                        (Result = 0) And (iPlanilhaOper <> -1) Then // Atualização IR Litigio
                        If iPlano = -1 Then
                           iPlano := iPlanoDs;

                     // Tudo havendo corrido bem...
                     If ((bTransacao) And (dtmBaseDados.dbBaseDados.InTransaction)) Then
                        CommitTransacao;
                  End
               Else
                  Begin
                     If bTransacao Then RollBackTransacao;
                     Result := -1;
                     sMensErro := 'Não foi encontrado o Roteiro Contábil para essa Operação.';
                     Exit;
                  End;

            End;

         If (Result = 0) And (bLancaCAPCAROper) And (fVlrLiquido = 0) Then
            Result := -7; // Não foi possível efetuar o lançamento de CAP/CAR.

      Except
         If bTransacao Then RollBackTransacao;
         Screen.Cursor := crDefault;

         Result := -3; // Erro de gravação
         If bMostraMsg Then Raise;
      End;

   Finally
      Screen.Cursor := crDefault;
      dtmOperComum.qryLocal.Close;
      dtmOperComum.qryLocal1.Close;
      dtmOperComum.qryParamInvest.Close;
      dtmOperComum.qryInvestimento.Close;
      dtmOperComum.qryCarteira.Close;
      dtmOperComum.qryTipoOperacao.Close;
      dtmOperComum.qryDespNegXTipoOper.Close;
      dtmOperComum.qryDespesasOPeracao.Close;
      dtmOperComum.qryDespXTipoOper.Close;
      //AL_99
      dtmOperComum.qryAuxiliar.Close;
      dtmOperComum.qryTipoOperacao.Close;
      dtmOperComum.qryCarteira.Close;
      dtmOperComum.qryInvestimento.Close;
      dtmOperComum.qryParamInvest.Close;
      qryLancaDocumento.Close;
      qryAuxAmbiente.Close;
      qryAuxAmbiente.Free;
      qryAuxLocal.Close;
   End;
End;

//--------------------------------------------------------------------------------------------------
//    Função que estorna uma determinada Operação de Investimento
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//
//       iOperacao      :  id da Operação de Investimento   (idOperacaoInvest)
//       iEmpresaProp   :  id da Empresa proprietária       (Sistema.idEmpresa)
//       iModuloOrigem  :  id do Módulo de Origem           (Sistema.idModulo)
//
//       dDataEstorno   :  data do estorno
//
//--------------------------------------------------------------------------------------------------

Function TOperComum.EstornaFinanPendencia(iDocumento: Integer;
   dDataEstorno: TDateTime): Boolean;
Var
   sDataEstorno, sMensErro, sMascara: String;
   // AL_36
Begin
   Result := True;
   Try
      sDataEstorno := FormatDateTime('dd/mm/yyyy', dDataEstorno);
      // AL_36
      // Verifica se o estorno pode ser realizado
      //AL_79
      If Not CtrlInvContab.TestaPeriodo(sDataEstorno, iTipoInvestUsu) Then
         Begin
            MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtInformation, [mbOk], 0);
            Result := False;
            Exit;
         End;

      // Exclui Documento da Tesouraria
      If iDocumento <> -1 Then
         Begin
            If Not (dtmBaseDados.dbBaseDados.InTransaction) Then
               DtmBaseDados.dbBaseDados.StartTransaction;

            // Boleta - Limpa Documento
            With DMRendaVariavel Do
               Begin
                  LimpaParametros(qryAux);
                  // AL_1 - Exclui a constraint da pendencia em todos os lugares
                  ExecutarQuery(qryAux, 'UPDATE OPERACAOINVEST SET CODDOCUMENTO = NULL WHERE CODDOCUMENTO = ' + IntToStr(iDocumento));
                  ExecutarQuery(qryAux, 'UPDATE BOLETA SET CODDOCUMENTO = NULL WHERE CODDOCUMENTO = ' + IntToStr(iDocumento));
               End;

            //AL_86
            If Not CtrlInvContab.Documento.Delete(iDocumento) Then
               Raise Exception.Create('Não foi possível excluir o Documento Financeiro' + #13 +
                  'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);

         End;
   Except On E: Exception Do
         Begin
            Screen.Cursor := crDefault;
            Result := False;
            //AL_86
            MsgDlg('Ocorreu um problema de exclusão no financeiro/contábil' +
               E.Message, 'Mensagem do Sistema ', mtWarning, [mbOK], 0);
         End;
   End;
End;

//--------------------------------------------------------------------------------------------------
//    Executa um Clear para cada parâmero da query passada
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :  wQuery - Objeto tipo TwwQuery
//
//--------------------------------------------------------------------------------------------------
// Fecha, prepara uma TwwQuery e atribui todos os parâmetros como NULL, inicialmente

Function TOperComum.LimpaParametros(Const qry: TwwQuery; Prepara: Boolean = False): Boolean;
Var
   i: integer;
Begin
   Try
      // fecha a query p/ evitar problemas
      qry.Close;

      // prepara a query se já não estiver preparada
      If Prepara Then
         Begin
            If Not (qry.Prepared) Then qry.Prepare;
         End;

      // zera os parâmetros
      For i := 0 To (qry.ParamCount - 1) Do Begin
            qry.Params[i].Bound := False;
            qry.Params[i].Clear;
            qry.Params[i].Bound := True;
         End;
      Result := True;
   Except
      Result := False;
   End;
End;

Function TOperComum.LimpaParametros(Const qry: TDecisionQuery; Prepara: Boolean = False): Boolean;
Var
   i: integer;
Begin
   Try
      // fecha a query p/ evitar problemas
      qry.Close;

      // prepara a query se já não estiver preparada
      If Prepara Then
         Begin
            If Not (qry.Prepared) Then qry.Prepare;
         End;

      // zera os parâmetros
      For i := 0 To (qry.ParamCount - 1) Do Begin
            qry.Params[i].Bound := False;
            qry.Params[i].Clear;
            qry.Params[i].Bound := True;
         End;
      Result := True;
   Except
      Result := False;
   End;
End;

Function TOperComum.LimpaParametros(Const qry: TQuery; Prepara: Boolean = False): Boolean;
Var
   i: integer;
Begin
   Try
      // fecha a query p/ evitar problemas
      qry.Close;

      // prepara a query se já não estiver preparada
      If Prepara Then
         Begin
            If Not (qry.Prepared) Then
               qry.Prepare;
         End;

      // zera os parâmetros
      For i := 0 To (qry.ParamCount - 1) Do Begin
            qry.Params[i].Bound := False;
            qry.Params[i].Clear;
            qry.Params[i].Bound := True;
         End;
      Result := True;
   Except
      Result := False;
   End;
End;

Function TOperComum.DataPrazo(dData: TDateTime; iPrazo: Integer): TDateTime;
Var
   iPz: Integer;
   dDtaPz: TDateTime;
Begin
   If iPrazo > 0 Then
      Begin
         iPz := 1;
         dDtaPz := dData;
         While iPz <= iPrazo Do
            Begin
               dDtaPz := dDtaPz + 1;
               While Not DiasUteisInv.DiaUtil(dDtaPz, -1, 1, '', True, False, False) Do
                  dDtaPz := dDtaPz + 1; // Achar o dia útil anterior

               iPz := iPz + 1;
            End;
      End
   Else
      Begin
         dDtaPz := dData;
         While Not DiasUteisInv.DiaUtil(dDtaPz, -1, 1, '', True, False, False) Do
            dDtaPz := dDtaPz + 1; // Achar o dia útil anterior
      End;

   Result := dDtaPz;
End;

Procedure TOperComum.VerificaVencimentoBMF(dDataNow: TDateTime);
Var
   dDataLimite: TDateTime;
Begin
   dDataLimite := dDataNow + pRPI.PRZVENCBMF;

   With dtmOperComum.qryAuxiliar Do
      Begin
         Close;
         SQL.Clear;
         SQL.Text := 'SELECT ' +
            '   SE.DATAVENCIMENTO, IV.DESCINVESTIMENTO, CT.DESCTIPOCTINVEST ' +
            'FROM ' +
            '   SERIESBMF SE, INVESTIMENTO IV, TIPOCONTRINVEST CT ' +
            'WHERE ' +
            '   (SE.DATAVENCIMENTO BETWEEN ' +
            '       TO_DATE(' + QuotedStr(DateToStr(dDataNow)) + ',''DD/MM/YYYY'') AND ' +
            '       TO_DATE(' + QuotedStr(DateToStr(dDataLimite)) + ',''DD/MM/YYYY'')) AND ' +
            '   (SE.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND ' +
            '   (SE.IDTIPOCONTRINVEST = CT.IDTIPOCONTRINVEST)';
         Open;
         If Not IsEmpty Then
            Begin
               While Not EOF Do
                  Begin
                     If FieldByName('DATAVENCIMENTO').AsDateTime = dDataNow Then
                        MsgDlg('O série : ' +
                           FieldByName('DESCINVESTIMENTO').AsString + ' - ' +
                           FieldByName('DESCTIPOCTINVEST').AsString + '. Está vencendo hoje : ' +
                           DateToStr(FieldByName('DATAVENCIMENTO').AsDateTime) + '', 'Mensagem do Sistema', mtWarning, [mbOk], 0)
                     Else
                        MsgDlg('A série : ' +
                           FieldByName('DESCINVESTIMENTO').AsString + ' - ' +
                           FieldByName('DESCTIPOCTINVEST').AsString + '. Estará vencendo em : ' +
                           DateToStr(FieldByName('DATAVENCIMENTO').AsDateTime) + '', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
                     Next;
                  End;
            End;
         Close;
      End;
End;

Procedure TOperComum.VerificaVencimentoCartaFianca(dDataNow: TDateTime);
Var
   dDataLimite: TDateTime;
Begin
   dDataLimite := dDataNow + pRPI.PRZVENCCFIANCA;

   With dtmOperComum.qryAuxiliar Do
      Begin
         Close;
         SQL.Clear;
         SQL.Text := 'SELECT ' +
            '   CA.DATAVENCTO, CA.DESCCARTAFIANCA ' +
            'FROM ' +
            '   CARTAFIANCA CA ' +
            'WHERE ' +
            '   (CA.DATAVENCTO BETWEEN ' +
            '       TO_DATE(' + QuotedStr(DateToStr(dDataNow)) + ',''DD/MM/YYYY'') AND ' +
            '       TO_DATE(' + QuotedStr(DateToStr(dDataLimite)) + ',''DD/MM/YYYY'')) ';
         Open;
         If Not IsEmpty Then
            Begin
               While Not EOF Do
                  Begin
                     If FieldByName('DATAVENCTO').AsDateTime = dDataNow Then
                        MsgDlg('A Carta de Fiança : ' +
                           FieldByName('DESCCARTAFIANCA').AsString + '. Está vencendo hoje : ' +
                           DateToStr(FieldByName('DATAVENCTO').AsDateTime) + '', 'Mensagem do Sistema', mtWarning, [mbOk], 0)
                     Else
                        MsgDlg('A série : ' +
                           FieldByName('DESCCARTAFIANCA').AsString + '. Estará vencendo em : ' +
                           DateToStr(FieldByName('DATAVENCTO').AsDateTime) + '', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
                     Next;
                  End;
            End;
         Close;
      End;
End;

Function TOperComum.AlteraDataFechRV(dData: TDateTime): Boolean;
Begin
   result := True;
   Try
      With dtmOperComum.qryUpdDataUltFechRV Do
         Begin
            Close;
            ParamByName('DATAULTFECH').AsDateTime := dData;
            If pRPI.DATAULTFECHEMP > dData Then
               ParamByName('DATAULTFECHEMP').AsDateTime := dData
            Else
               ParamByName('DATAULTFECHEMP').AsDateTime := pRPI.DATAULTFECHEMP;
            ExecSql;
            Close;
            //AL_93 - Aqui ele já faz a operação RetParamInvest1
            CtrlPInv.GetParamsInvest(Sistema.IdEmpresa);
            //         OperacaoInvest.RetParamInvest1(pRPI, 'BaseDados');
         End;
   Except
      Result := False;
   End;
End;

Procedure TOperComum.ChamaRegra(sRegraSel: String; tpcons: integer);
Begin
   Application.CreateForm(TfrmConsultaRegra, frmConsultaRegra);
   With frmConsultaRegra Do
      Begin
         wwqueryRegra.Close;
         wwqueryRegra.Open;
         If tpcons = 0 Then
            wwqueryRegra.locate('IDREGRA', sRegraSel, [])
         Else
            wwqueryRegra.locate('NOMEREGRA', sRegraSel, []);
      End;
   frmConsultaRegra.ShowModal;
   frmConsultaRegra.Release;
End;

Procedure TOperComum.BuscaFlgContab(iTipoOper: Integer);
Begin
   OperComum.LimpaParametros(dtmOperComum.qryFlgContabil);
   With dtmOperComum.qryFlgContabil Do
      Begin
         ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOper;
         Open;
      End;
End;

Function TOperComum.PosicionaWWLookUpQry(dbLookUp: TwwDBLookupCombo; Query: TwwQuery): Boolean;
Begin
   Query.Locate(dbLookUp.LookupField, dbLookUp.LookupValue, []);
End;
//Al_39

Function TOperComum.TransfEntreCarteiras(iForCli, iCarteiraOrig,
                                         iCarteiraDest,
                                         iInvestimento,
                                         iCustodianteOrig,
                                         iCustodianteDest,
                                         iIdMotBloqOrig,
                                         iIdMotBloqDest,
                                         iMercadoOrig, iMercadoDest,
                                         iIdForCli: Integer;
                                         fSaldo, fQuantidade: Double;
                                         dDataRef: TDateTime;
                                         bEmpAcoes: boolean;
                                         sLote, sBoleta: String;
                                         Var iIdHistCartInvDest: Integer;
                                         iPlanPrev: Integer = -1;
                                         iPlnCodigo: Integer = -1;
                                         iTipoConta: Integer = 0): boolean;
Var
   idOperCustodia, iIdHistCustodiaOrig, iIdHistCustodiaDest, iIdHistCartInvOrig: Integer;
   fPU, fSaldoAquiPro, fSaldoVariacaoPro, fSaldoIrApuPro,
      //AL_83
   fSaldoQtd, fSaldoQtdCCi, fSaldoQtdCC, fSaldoVlr, fSaldoInutil, fSaldoAqui, fSaldoRend,
      fSaldoVariacao, fSaldoIrApu, fValorOper, fSaldoQtdCust, fSldQtdCustL, fSldQtdCustB: Double;
   bCriaLancto: Boolean;
   sTipoOperacao, sInvestimento, wMensErro: String;
   iPlanoDest, iPlano, iPlanilha, iDocumento, iTipoOperacao: Integer;
   // AL_83
   CtrlRV: TCtrlRendaVariavel;
Begin
   Result := True;
   If iPlanPrev = -1 Then
      iPlanPrev := iPlanPrevCtbPatro;
   // Validação dos Dados
   If iCarteiraOrig = iCarteiraDest Then
   Begin
      // AL_39
      MsgDlg('A Transferência não pode ser para a mesma Carteira de Investimento.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   End;

   If fQuantidade <= 0 Then
   Begin
      // AL_39
      MsgDlg('Quantidade inválida', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   End;
   // Verifica se possui saldo para transferir.
   If fSaldo < fQuantidade Then
   Begin
      // AL_39
      MsgDlg('A Quantidade é superior ao saldo para transferência', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   End;

   // Se for Carteira Origem for de Empréstimo de Acoes -> Verifica se pode transferir
   If bEmpAcoes Then
   Begin
      If iCustodianteOrig = -1 Then
      Begin
         // AL_39
         MsgDlg('Não foi informado o Custodiante', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Result := False;
         Exit;
      End
      Else
      Begin
         //AL_106 - Plano/Patro
         //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
         If Not EmprestAcoes.VerificaTransfEmptmoAcoes(iPlanPrev, iCarteiraOrig, iCustodianteOrig,
                                                       iInvestimento, fQuantidade, DateToStr(dDataRef)) Then
         Begin
            Result := False;
            Exit;
         End;
      End;
   End;

   // Inicia o Processo
   //AL_83
   Try // Finally
      //AL_83
      CtrlRV := TCtrlRendaVariavel.Create;
      CtrlRV.InitializeAs(Padroes);
      Try // Except
         iIdHistCartInvTRC := -1; // Inicializa a variavel global

         //AL_83 - Atualizando o progresso do método no form original
         If Assigned(AtualizaProcesso) Then
            AtualizaProcesso('Buscando Saldos a Transferir', -1);

         //AL_83
         CtrlRV.BuscaSaldoRV.Executa(dDataRef, iPlanPrev, iInvestimento, iCarteiraOrig, -1, High(Integer),
                                     iCustodianteOrig, sLote, iIdMotBloqOrig);

         fSaldoQtd := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;
         fSaldoVlr := CtrlRV.BuscaSaldoRV.SaldoVlrTotal;
         fSaldoAqui := CtrlRV.BuscaSaldoRV.SaldoCusto;
         fSaldoRend := 0;
         fSaldoVariacao := CtrlRV.BuscaSaldoRV.SaldoVariacao;
         fSaldoIrApu := CtrlRV.BuscaSaldoRV.SaldoIRApurado;
         fSldQtdCustL := CtrlRV.BuscaSaldoRV.SldQtdLibCustodia;
         fSldQtdCustB := CtrlRV.BuscaSaldoRV.SldQtdBloqCustodia;
         fSaldoQtdCCi := CtrlRV.BuscaSaldoRV.SaldoQtdCCI;
         fSaldoQtdCC := CtrlRV.BuscaSaldoRV.SaldoQtdCC;

         If iIdMotBloqOrig = -1 Then
            fSaldoQtdCust := fSldQtdCustL
         Else
            fSaldoQtdCust := fSldQtdCustB;

         //AL_65 - Ini
         // Verifica qtd na custódia (Saldo Liberado)
         If fQuantidade > fSaldoQtdCust Then
            Raise Exception.Create('Não é possível transferir esta quantidade, Saldo Insuficiente na Custódia' + #13 +
                                   'Quantidade a Transferir: ' + FormatFloat('###,###,###,##0', fQuantidade) + #13 +
                                   'Quantidade na Custódia : ' + FormatFloat('###,###,###,##0', fSaldoQtdCust));

         If iTipoConta = 1 Then
         Begin
            //AL_83 - Se for Conta CCI, só vale a qtd nova
            If fQuantidade > fSaldoQtdCCi Then
               Raise Exception.Create('Não é possível transferir esta quantidade, Saldo Novo Insuficiente.' + #13 +
                                      'Quantidade a transferir: ' + FormatFloat('###,###,###,##0', fQuantidade) + #13 +
                                      'Saldo na Conta CCI     : ' + FormatFloat('###,###,###,##0', fSaldoQtdCCi));
         End
         Else If iTipoConta = 0 Then
         Begin
            //AL_83 - Se for Conta Normal só vale qtd antiga
            If fQuantidade > fSaldoQtdCC Then
               Raise Exception.Create('Não é possível transferir esta quantidade, Saldo Antigo Insuficiente.' + #13 +
                                      'Quantidade a transferir: ' + FormatFloat('###,###,###,##0', fQuantidade) + #13 +
                                      'Saldo na Conta CC      : ' + FormatFloat('###,###,###,##0', fSaldoQtdCC));
         End
         Else Raise Exception.Create('Não existe o Tipo de Conta informado');
         //AL_39 - Fim

         fPU := OperComum.Round(OperComum.DivValorZero(fSaldoAqui, fSaldoQtd), 9);
         fSaldoAquiPro := OperComum.Round(fPU * fQuantidade, 2);

         fPU := OperComum.Round(OperComum.DivValorZero(fSaldoVariacao, fSaldoQtd), 9);
         fSaldoVariacaoPro := OperComum.Round(fPU * fQuantidade, 2);

         fPU := OperComum.Round(OperComum.DivValorZero(fSaldoIrApu, fSaldoQtd), 9);
         fSaldoIrApuPro := OperComum.Round(fPU * fQuantidade, 2);

         //AL_83 - Atualizando o progresso do método no form original
         If Assigned(AtualizaProcesso) Then
            AtualizaProcesso('Criando Boleta de Transferência', -1);

         // Pesquisa se Boleta ja tem Registro na Tabela de Boletas
         OperComum.LimpaParametros(dtmOperComum.QryBoleta);
         dtmOperComum.QryBoleta.ParamByName('IDBOLETA').AsString := sBoleta;
         dtmOperComum.QryBoleta.Open;

         // Caso não tenha, cria um registro
         If dtmOperComum.QryBoleta.IsEmpty Then
         Begin
            sBoleta := 'RV-' + Copy(DateToStr(dDataRef), 9, 2) + '/' + FormatFloat('00000', //Renan Cristiano SOL 134065 Kintana 786102.
               LeUltRegistro(Nil, 'CONTDOCRENVAR' + Copy(DateToStr(dDataRef), 9, 2)));

            ExecutaQuery(dtmOperComum.QryAuxiliar, 'INSERT INTO BOLETA (IDBOLETA, DATABOLETA, STATUS, IDFORCLI,TIPMOVBOLETA) VALUES (' +
                                                   QuotedStr(sBoleta) + ', TO_DATE(' +
                                                   QuotedStr(DateToStr(dDataRef)) + ',''DD/MM/YYYY''), ' +
                                                   ' ''F''' + ',' +
                                                   QuotedStr(IntToStr(iIdForCli)) + ',''TRC'')');
            //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
            dtmOperComum.QryAuxiliar.Close;
         End;
         //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
         dtmOperComum.QryBoleta.Close;

         // Grava OperCustodia
         //AL_83 - Atualizando o progresso do método no form original
         If Assigned(AtualizaProcesso) Then
            AtualizaProcesso('Gravando Operação de Custódia', -1);

         idOperCustodia := LeUltRegistro(Nil, 'OPERCUSTODIA');

         If Not OperacaoInvest.AlimentaOperCustodia(idOperCustodia, -1, -1, -1, -1,
                                                    iCarteiraOrig,
                                                    iCarteiraDest,
                                                    iInvestimento,
                                                    iCustodianteOrig,
                                                    iCustodianteDest,
                                                    iIdMotBloqOrig,
                                                    iIdMotBloqDest,
                                                    fQuantidade,
                                                    dDataRef,
                                                    '' {sLote},
                                                    sBoleta,
                                                    iPlanPrev,
                                                    -1,
                                                    iPlanPrev) Then
            //Al_40 - 21/06/2005
            Raise Exception.Create('Não é possível alimentar a custódia com essa operação!');

         //AL_83 - Atualizando o progresso do método no form original
         If Assigned(AtualizaProcesso) Then
            AtualizaProcesso('Gravando Histórico de Custódia - Origem', -3);

         OperComum.AlteraHistCustodiaOrigem(idOperCustodia, iIdMotBloqOrig, iCarteiraOrig,
                                            iInvestimento, iCustodianteOrig, '' {sLote}, dDataRef,
                                            fQuantidade, iIdHistCustodiaOrig, iPlanPrev);

         //AL_83 - Atualizando o progresso do método no form original
         If Assigned(AtualizaProcesso) Then
            AtualizaProcesso('Atualizando Históricos de Custódia', -3);

         OperacaoInvest.AtualizaSaldosCustodia;

         //AL_83 - Atualizando o progresso do método no form original
         If Assigned(AtualizaProcesso) Then
            AtualizaProcesso('Gravando Histórico de Custódia - Destino', -3);

         //AL_71
         InsereHistCustodiaDestino(idOperCustodia, iIdMotBloqDest, iCarteiraDest, iInvestimento,
                                   iCustodianteDest, '' {sLote}, dDataRef, fQuantidade,
                                   iIdHistCustodiaDest, iPlanPrev,
                                   iTipoConta);

         //AL_83 - Atualizando o progresso do método no form original
         If Assigned(AtualizaProcesso) Then
            AtualizaProcesso('Atualizando Históricos de Custódia', -3);

         OperacaoInvest.AtualizaSaldosCustodia;

         //AL_83 - Atualizando o progresso do método no form original
         If Assigned(AtualizaProcesso) Then
            AtualizaProcesso('Gravando Histórico de Carteira - Destino', -1);

         fValorOper := OperComum.Round(OperComum.DivValorZero((fQuantidade * fSaldoVlr), fSaldoQtd), 2);

         //AL_23 - Pega a operação de Destino correta
         //AL_39 - Trata a Conta CCI
         If ((iCarteiraOrig = pRPI.IDCARTOPCIND) Or
            (iCarteiraDest = pRPI.IDCARTOPCIND)) Then // Opção de Indice
            iTipoOperacao := IIF(iTipoConta = 0, -67, -10067)
         Else If ((iCarteiraOrig = pRPI.IDCARTEMPACOES) Or
            (iCarteiraDest = pRPI.IDCARTEMPACOES)) Then // Empréstimo
            iTipoOperacao := IIF(iTipoConta = 0, -63, -10063)
         Else
            iTipoOperacao := IIF(iTipoConta = 0, -4, -10004); // A Vista
         //AL_39 - Fim
         //AL_23 - Fim

         // Capta a descrição do Tipo de Operação no cadastro
         dtmOperComum.QryLocal.Close;
         dtmOperComum.QryLocal.Sql.Clear;
         //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
         dtmOperComum.QryLocal.Sql.Add('SELECT TIPOOPERACAO.DESCTIPOOPERACAO FROM TIPOOPERACAO ');
         dtmOperComum.QryLocal.Sql.Add('WHERE (TIPOOPERACAO.IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao) + ')');
         dtmOperComum.QryLocal.Open;
         sTipoOperacao := dtmOperComum.QryLocal.FieldByName('DESCTIPOOPERACAO').AsString;
         //Al_40 - 21/06/2005
         If dtmOperComum.QryLocal.eof Then
         Begin
            dtmOperComum.QryLocal.Close;
            Raise Exception.Create('Não foi encontrado o Tipo de Operação = ' + IntToStr(iTipoOperacao) + '!' + #13 +
               'Verifique o cadastro de Tipos de Operação.');
         End;

         // Capta a descrição do investimento no cadastro
         dtmOperComum.QryLocal.Close;
         dtmOperComum.QryLocal.Sql.Clear;
         //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
         dtmOperComum.QryLocal.Sql.Add('SELECT INVESTIMENTO.DESCINVESTIMENTO FROM INVESTIMENTO ');
         dtmOperComum.QryLocal.Sql.Add('WHERE (INVESTIMENTO.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ')');
         dtmOperComum.QryLocal.Open;
         sInvestimento := dtmOperComum.QryLocal.FieldByName('DESCINVESTIMENTO').AsString;
         dtmOperComum.QryLocal.Close;
         dtmOperComum.QryLocal.Sql.Clear;

         // Atualiza o Tipo de operação destino utilizada
         ExecutarQuery(dtmOperComum.QryLocal, 'UPDATE OPERCUSTODIA SET OPERCUSTODIA.IDTIPOOPERDEST = ' + IntToStr(iTipoOperacao) + ' ' +
                                              'WHERE OPERCUSTODIA.IDOPERCUSTODIA = ' + IntToStr(idOperCustodia));

         dtmOperComum.QryLocal.Close;                                              

         // Variáveis para Contabilização
         bCriaLancto := False;

         iDocumento := -1;
         iPlano := -1;
         If iPlnCodigo = -1 Then
            iPlanilha := -1
         Else
            iPlanilha := iPlnCodigo;

         //Credito na Carteira
         If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo, iInvestimento,
                                           2, -1, -1, iTipoOperacao, iCarteiraDest,
                                           0, -1, -1, -1 {iPlanilha}, -1 {iDocumento}, -1 {iPlano}, dDataRef,
                                           fValorOper, fQuantidade, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                           'A', 'A', '' {slote}, sTipoOperacao + ' : ' + sInvestimento,
                                           'TRC', '', '', True, -1, iPlanPrev, iIdHistCartInv) Then
            //Al_40 - 21/06/2005
            Raise Exception.Create('Não foi possível alimentar a carteira com essa operação!');

         iIdHistCartInvDest := iIdHistCartInv;
         // AL_59
         iIdHistCartInvTRC := iIdHistCartInv;

         ExecutaQuery(dtmOperComum.QryLocal, 'UPDATE HISTCARTINV SET HISTCARTINV.MOVIMAQUI = ' + TrocaVirgulaPonto(FloatToStr(fSaldoAquiPro)) + ',' +
                                             ' HISTCARTINV.VLRVARIACAO = ' + TrocaVirgulaPonto(FloatToStr(fSaldoVariacaoPro)) + ',' +
                                             ' HISTCARTINV.VLRIRAPU = ' + TrocaVirgulaPonto(FloatToStr(fSaldoIrApuPro)) + ' ' +
                                             ' WHERE HISTCARTINV.IDHISTCARTINV = ' + IntToStr(iIdHistCartInv));
         dtmOperComum.QryLocal.Close;                                             

         //Al_40 - 21/06/2005
         If Not OperComum.AtualizaSaldos(1, -1) Then
            Raise Exception.Create('Não foi possível atualizar o saldo ' + #13 +
               'Data ' + DateToStr(dDataRef) + #13 +
               'Operação' + sTipoOperacao + #13 +
               'Investimento ' + sInvestimento);

         // Atualiza o IDHistCartInvDest na OperCustodia
         If Not OperacaoInvest.AtualizaOperCustodia(idOperCustodia, -1, -1, -1, iIdHistCartInvDest) Then
            Raise Exception.Create('Não foi possível atualizar a operação de custódia' + #13 +
                                   'Data ' + DateToStr(dDataRef) + #13 +
                                   'Operação' + sTipoOperacao + #13 +
                                   'Investimento ' + sInvestimento);

         OperComum.BuscaFlgContab(iTipoOperacao);

         If iMercadoOrig <> iMercadoDest Then
         Begin
            //AL_83 - Atualizando o progresso do método no form original
            If Assigned(AtualizaProcesso) Then
               AtualizaProcesso('Contabilizando a Operação', -1);

            // Custo e variação - Faz pelas despesas cadastradas
            wTipoRecDesBol := '';
            //AL_83 - Contabiliza por Plano/Patro
            OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                    iInvestimento, iTipoOperacao, idOperCustodia {Passar a OperCustodia e tratar dentro},
                                    iForCli, iCarteiraDest, pRPI.MOECODIGO, '', '', '', '', '',
                                    wTipoRecDesBol,
                                    bCriaLancto,
                                    0, fValorOper,
                                    dDataRef, dDataRef,
                                    iPlano, iPlanilha, iDocumento, wMensErro, 'N', False, False, 0, True, iPlanPrev);
            If Trim(wMensErro) <> '' Then
               Begin
                  MsgDlg('Atenção: Ocorreu um problema na contabilização da operação :'#13 +
                     wMensErro, 'Mensagem do Sistema', MtWarning, [MbOk], 0);
                  Result := False;
                  Exit;
               End;
//Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
            //AL_98
{            CtrlRV.UpdateBoleta(sBoleta,['STATUS', 'PLANO', 'PLNCODIGO'],
                                        ['F', IntToStr(iPlano), IntToStr(iPlanilha)]);}

             //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822                           
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
                dtmOperComum.qryLocal.Close;                
             end;

         End
         Else
         Begin
            //AL_83 - Atualizando o progresso do método no form original
            If Assigned(AtualizaProcesso) Then
               AtualizaProcesso('', -1);
         End;

         // Guarda o Plano para gravar na Alimenta Carteira da Baixa
         iPlanoDest := iPlano;

         //AL_83 - Atualizando o progresso do método no form original
         If Assigned(AtualizaProcesso) Then
            AtualizaProcesso('Gravando Histórico de Carteira - Origem', -1);

         //AL_23 - Pega a operação de Destino correta
         //AL_39 - Trata a conta CCI
         If ((iCarteiraOrig = pRPI.IDCARTOPCIND) Or
            (iCarteiraDest = pRPI.IDCARTOPCIND)) Then // Opção de Indice
            iTipoOperacao := IIF(iTipoConta = 0, -68, -10068)
         Else If ((iCarteiraOrig = pRPI.IDCARTEMPACOES) Or
            (iCarteiraDest = pRPI.IDCARTEMPACOES)) Then // Empréstimo
            iTipoOperacao := IIF(iTipoConta = 0, -64, -10064)
         Else
            iTipoOperacao := IIF(iTipoConta = 0, -6, -10006); // A Vista
         //AL_39 - Fim
         //AL_23 - Fim

         ExecutarQuery(dtmOperComum.QryLocal, 'Update HistCartInv Set      ' +
                                              'HistCartInv.FlgCustodia         = NULL ' +
                                              'Where HistCartInv.IdHistCartInv = ' + IntToStr(iIdHistCartInv));

         // Capta a descrição do Tipo de Operação no cadastro
         dtmOperComum.QryLocal.Close;
         dtmOperComum.QryLocal.Sql.Clear;
         dtmOperComum.QryLocal.Sql.Add('SELECT TIPOOPERACAO.DESCTIPOOPERACAO FROM TIPOOPERACAO ');
         dtmOperComum.QryLocal.Sql.Add('WHERE (TIPOOPERACAO.IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao) + ')');
         dtmOperComum.QryLocal.Open;
         sTipoOperacao := dtmOperComum.QryLocal.FieldByName('DESCTIPOOPERACAO').AsString;
         //Al_40 - 21/06/2005
         If dtmOperComum.QryLocal.eof Then
         Begin
            dtmOperComum.QryLocal.Close;
            Raise Exception.Create('Não foi encontrado o Tipo de Operação = ' + IntToStr(iTipoOperacao) + '!' + #13 +
                                   'Verifique o cadastro de Tipos de Operação.');
         End;

         // Capta a descrição do investimento no cadastro
         dtmOperComum.QryLocal.Close;
         dtmOperComum.QryLocal.Sql.Clear;
         dtmOperComum.QryLocal.Sql.Add('SELECT INVESTIMENTO.DESCINVESTIMENTO FROM INVESTIMENTO ');
         dtmOperComum.QryLocal.Sql.Add('WHERE (INVESTIMENTO.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ')');
         dtmOperComum.QryLocal.Open;
         sInvestimento := dtmOperComum.QryLocal.FieldByName('DESCINVESTIMENTO').AsString;
         dtmOperComum.QryLocal.Close;
         dtmOperComum.QryLocal.Sql.Clear;

         // Atualiza o Tipo de operação Origem utilizada
         ExecutarQuery(dtmOperComum.QryLocal, 'UPDATE OPERCUSTODIA SET OPERCUSTODIA.IDTIPOOPERORIG = ' + IntToStr(iTipoOperacao) + ' ' +
                                              'WHERE OPERCUSTODIA.IDOPERCUSTODIA = ' + IntToStr(idOperCustodia));
         dtmOperComum.QryLocal.Close;                                              
         // AL_65 - Fim

         //Baixa da Carteira
         //Al_40 - 21/06/2005
         If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo, iInvestimento,
                                           2, -1, -1, iTipoOperacao, iCarteiraOrig,
                                           0, -1, -1, -1 {iPlanilha}, -1 {iDocumento}, -1 {iPlano}, dDataRef,
                                           fValorOper, fQuantidade,
                                           1, fSaldoVariacaoPro, 0, fSaldoIrApuPro, 0, 0, 0, 0, 0, 0,
                                           'D', 'D', '' {sLote}, sTipoOperacao + ' : ' + sInvestimento,
                                           'TRC', '', '', True, -1, iPlanPrev, iIdHistCartInv) Then
            Raise Exception.Create('Não foi possível alimentar a carteira com essa operação!');

         iIdHistCartInvOrig := iIdHistCartInv;

         //Al_40 - 21/06/2005
         If Not OperacaoInvest.AtualizaOperCustodia(idOperCustodia, iIdHistCustodiaOrig, iIdHistCustodiaDest,
                                                    iIdHistCartInvOrig, iIdHistCartInvDest) Then
            Raise Exception.Create('Não foi possível atualizar a operação de custódia ' + #13 +
               'Data ' + DateToStr(dDataRef) + #13 +
               'Operação' + sTipoOperacao + #13 +
               'Investimento ' + sInvestimento);

         //Al_40 - 21/06/2005
         If Not OperComum.AtualizaSaldos(1, -1) Then
            Raise Exception.Create('Não foi possível atualizar o saldo ' + #13 +
               'Data ' + DateToStr(dDataRef) + #13 +
               'Operação' + sTipoOperacao + #13 +
               'Investimento ' + sInvestimento);

         ExecutarQuery(dtmOperComum.QryLocal, 'Update HistCartInv Set ' +
                                              'HistCartInv.FlgCustodia = NULL ' +
                                              'Where HistCartInv.IdHistCartInv = ' + IntToStr(iIdHistCartInv));
         dtmOperComum.QryLocal.Close;                                              

         // AL_39
         If ((((iTipoOperacao = -67) Or (iTipoOperacao = -68) Or
            (iTipoOperacao = -10067) Or (iTipoOperacao = -10068)) And (dDataRef < pRPI.DATAULTFECH)) Or
            (((iTipoOperacao <> -67) And (iTipoOperacao <> -68) And
            (iTipoOperacao <> -10067) And (iTipoOperacao <> -10068)) And (dDataRef <= pRPI.DATAULTFECH))) Then
         Begin
            // Carteira Origem
            //AL_83 - Atualizando o progresso do método no form original
            If Assigned(AtualizaProcesso) Then
               AtualizaProcesso('Marcando os Investimentos para Reprocessamento - Origem', -1);
            //Al_40 - 21/06/2005
            If Not RendaVariavel.MarcarFlagReproc(iInvestimento,
                                                  iCarteiraOrig,
                                                  iPlanPrev,
                                                  dDataRef,
                                                  False,True,True,False,'TRC') Then
               Raise Exception.Create('Não foi possível marcar ' + sInvestimento + 'para Reprocessamento na Carteira Origem.');

            // Carteira Destino
            //AL_83 - Atualizando o progresso do método no form original
            If Assigned(AtualizaProcesso) Then
               AtualizaProcesso('Marcando os Investimentos para Reprocessamento - Destino', -3);
            //Al_40 - 21/06/2005
            //Renan Cristiano - 19/02/2009 - N Sol 107630 - N. Kintana 484313
            If Not RendaVariavel.MarcarFlagReproc(iInvestimento,
                                                  iCarteiraDest,
                                                  iPlanPrev,
                                                  dDataRef,
                                                  False,True,True,False,'TRC') Then
               Raise Exception.Create('Não foi possível marcar ' + sInvestimento + 'para Reprocessamento na Carteira Destino.');

         End
         Else
         Begin
            //AL_83 - Atualizando o progresso do método no form original
            If Assigned(AtualizaProcesso) Then
               AtualizaProcesso('', -1);
         End;

         Result := True;
      Except
         //Al_40 - 21/06/2005
         On E: Exception Do
         Begin
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            Result := False;
         End;
      End;
   Finally
      //AL_83 - Atualizando o progresso do método no form original
      If Assigned(AtualizaProcesso) Then
         AtualizaProcesso('', -2);
      FreeAndNil(CtrlRV);
   End;
End;

//AL_71

Procedure TOperComum.AlteraHistCustodiaOrigem(
   idOperCustodia, iMotivoBloqueio, iCarteira, iInvestimento,
   iCustodiante: integer; sLote: String; dDataRef: TDateTime;
   fQuantidade: Double; Var iIdHistCustodiaOrig: integer;
   iPlanPrev: Integer = -1;
   iTipoConta: Integer = 0);
Var
   sTipoCustodia: String;
   iIdHistCustodia: Integer;
Begin
   If iMotivoBloqueio = -1 Then
      sTipoCustodia := 'V'
   Else
      sTipoCustodia := 'Z'; //BLOQUEADA
   //AL_71
   OperacaoInvest.InsereCustodia(iCarteira,
      iInvestimento,
      iCustodiante,
      iMotivoBloqueio, -1,
      idOperCustodia,
      sLote, sTipoCustodia[1],
      dDataRef, fQuantidade,
      iIdHistCustodia,
      iPlanPrev,
      iTipoConta);

   iIdHistCustodiaOrig := iIdHistCustodia;
End;

//AL_71

Procedure TOperComum.InsereHistCustodiaDestino(
   idOperCustodia, iMotivoBloqueio, iCarteira, iInvestimento,
   iCustodiante: integer;
   sLote: String;
   dDataRef: TDateTime; fQuantidade: Double;
   Var iIdHistCustodiaDest: integer;
   iPlanPrev: Integer = -1;
   iTipoConta: Integer = 0);
Var
   sTipoCustodia: String;
   iIdHistCustodia: integer;
Begin
   If iMotivoBloqueio = -1 Then
      sTipoCustodia := 'C'
   Else
      sTipoCustodia := 'Y'; //BLOQUEADA

   //AL_71
   OperacaoInvest.InsereCustodia(iCarteira,
      iInvestimento,
      iCustodiante,
      iMotivoBloqueio, -1,
      idOperCustodia,
      sLote, sTipoCustodia[1],
      dDataRef, fQuantidade,
      iIdHistCustodia,
      iPlanPrev,
      iTipoConta);

   iIdHistCustodiaDest := iIdHistCustodia;
End;

Function TOperComum.ProcExcluiCustodia(iIdOperCustodia, iIdHistCartInvOrig,
   iIdHistCartInvDest: Integer;
   dDataMovCustod: TDateTime): Boolean;
Var
   dDataAnt: TDateTime;
Begin
   Try
      MarcaFlgHistCustodia(-1, -1, iIdOperCustodia);

      With dtmOperComum Do
         Begin
            // Excluir da Contabilidade

            //AL_83 - Atualizando o progresso do método no form original
            If Assigned(AtualizaProcesso) Then
               AtualizaProcesso('Excluindo Contabilizações', -1);

            OperComum.LimpaParametros(QryBuscaPlnCodigo);
            QryBuscaPlnCodigo.ParamByName('IDHISTCARTINV').AsInteger := iIdHistCartInvOrig;
            QryBuscaPlnCodigo.Open;
            While Not QryBuscaPlnCodigo.EOF Do
               Begin
                  If Not OperComum.ProcExclui(-1, QryBuscaPlnCodigo.FieldByName('PLNCODIGO').AsInteger,
                     -1, 2,
                     dDataMovCustod, True) Then
                     Begin
                        Result := False;
                        Exit;
                     End;
                  QryBuscaPlnCodigo.Next;
               End;

            //AL_82
            //Capta a descrição do Tipo de Operação no cadastro
            dtmOperComum.QryLocal.Close;
            dtmOperComum.QryLocal.Sql.Clear;
            dtmOperComum.QryLocal.Sql.Add('SELECT PLNCODIGO FROM BOLETA WHERE IDBOLETA IN ');
            dtmOperComum.QryLocal.Sql.Add('(SELECT IDBOLETA FROM OPERCUSTODIA WHERE IDOPERCUSTODIA =' + IntToStr(iIdOperCustodia) + ')');
            dtmOperComum.QryLocal.Open;
            If Not dtmOperComum.QryLocal.IsEmpty Then
               Begin
                  If Not OperComum.ProcExclui(-1, dtmOperComum.QryLocal.FieldByName('PLNCODIGO').AsInteger,
                     -1, 2,
                     dDataMovCustod, True) Then
                     Begin
                        Result := False;
                        Exit;
                     End;
               End;

            //AL_83 - Atualizando o progresso do método no form original
            If Assigned(AtualizaProcesso) Then
               AtualizaProcesso('Preparando Operação de Custódia para Exclusão', -1);
            OperComum.LimpaParametros(qryUpdOperCustodia);
            qryUpdOperCustodia.ParamByName('IDOPERCUSTODIA').AsInteger := iIdOperCustodia;
            qryUpdOperCustodia.ExecSQL;

            //AL_83 - Atualizando o progresso do método no form original
            If Assigned(AtualizaProcesso) Then
               AtualizaProcesso('Excluindo Históricos de Custódia', -1);
            OperComum.LimpaParametros(qryDelHistCustodia);
            qryDelHistCustodia.ParamByName('IDOPERCUSTODIA').AsInteger := iIdOperCustodia;
            qryDelHistCustodia.ExecSQL;

            //AL_83 - Atualizando o progresso do método no form original
            If Assigned(AtualizaProcesso) Then
               AtualizaProcesso('Excluindo Históricos da Carteira (Origem)', -1);
            OperComum.LimpaParametros(qryDelHistCartInv);
            qryDelHistCartInv.ParamByName('IDHISTCARTINV').AsInteger := iIdHistCartInvOrig;
            qryDelHistCartInv.ExecSQL;

            //AL_83 - Atualizando o progresso do método no form original
            If Assigned(AtualizaProcesso) Then
               AtualizaProcesso('Excluindo Históricos da Carteira (Destino)', -1);
            OperComum.LimpaParametros(qryDelHistCartInv);
            qryDelHistCartInv.ParamByName('IDHISTCARTINV').AsInteger := iIdHistCartInvDest;
            qryDelHistCartInv.ExecSQL;

            //AL_82 - Atualizando o progresso do método no form original
            If Assigned(AtualizaProcesso) Then
               AtualizaProcesso('Excluindo Operação de Custódia', -1);
            OperComum.LimpaParametros(qryDelOperacaoInvest);
            qryDelOperacaoInvest.ParamByName('IDOPERCUSTODIA').AsInteger := iIdOperCustodia;
            qryDelOperacaoInvest.ExecSQL;

            //AL_83 - Atualizando o progresso do método no form original
            If Assigned(AtualizaProcesso) Then
               AtualizaProcesso('Excluindo Operação de Custódia', -1);
            OperComum.LimpaParametros(qryDelOperCustodia);
            qryDelOperCustodia.ParamByName('IDOPERCUSTODIA').AsInteger := iIdOperCustodia;
            qryDelOperCustodia.ExecSQL;
         End;
      // Atualiza Saldos da Custodia
      //AL_83 - Atualizando o progresso do método no form original
      If Assigned(AtualizaProcesso) Then
         AtualizaProcesso('Atualizando Saldos de Custódia', -1);
      OperacaoInvest.AtualizaSaldosCustodia;

      Result := True;

   Except
      MsgDlg('Não foi possível excluir a Operação.',
         'Mensagem do Sistema', mtWarning, [mbOK], 0);
      Result := False;
   End;
End;

Function TOperComum.ComparaValores(fValor1, fValor2: Double; sComparador: String;
   fPrecisao: Integer = 0): Boolean;
Var i, iDec1, iDec2: Integer;
   sValor1, sValor2, sFormato1, sFormato2, sResultado: String;
   fValForm1, fValForm2, fResultado: Double;
Begin
   // AL_4 - 04/08/2004 - Ajustes em toda a rotina

   // Zera valores
   fValForm1 := 0;
   fValForm2 := 0;
   sValor1 := '';
   sValor2 := '';
   sFormato1 := '';
   sFormato2 := '';

   //AL_26 Ini
   // Prepara Primeiro Valor
   sFormato1 := '#0.';
   sValor1 := FloatToStr(fValor1);
   iDec1 := Length(sValor1) - Pos(DecimalSeparator, sValor1);

   // Prepara Segundo Valor
   sFormato2 := '#0.';
   sValor2 := FloatToStr(fValor2);
   iDec2 := Length(sValor2) - Pos(DecimalSeparator, sValor2);

   // Caso passe Zero, utiliza a menor precisão
   If (fPrecisao = 0) Then
      Begin
         If iDec1 < iDec2 Then
            fPrecisao := iDec1
         Else
            fPrecisao := iDec2;
      End;

   fResultado := RoundCM((fValor1 - fValor2), fPrecisao);
   //AL_26 Fim

   // Testa o tipo de comparação passada
   If sComparador = '=' Then
      Result := (fResultado = 0)
   Else If sComparador = '>' Then
      Result := (fResultado > 0)
   Else If sComparador = '<' Then
      Result := (fResultado < 0)
   Else If sComparador = '<>' Then
      Result := (fResultado <> 0);

End;

// Busca o Preco de Exercicio para as Açoes 'a Vista na Carteira de Opçâo

Function TOperComum.BuscaCotacaoOpcao(iInvestimento, iCarteira: integer;
   dDataRef: TDateTime;
   sLote: String;
   fCotacao: Double): double;
Begin
   Result := fCotacao;
   If fCotacao = 0 Then
      Exit;
   // O Investimento deve estar na Carteira de Opções e ter Lote
   If (iCarteira = pRPI.IDCARTOPC) And
      (Trim(sLote) <> '') Then
      Begin
         OperComum.LimpaParametros(dtmOperComum.qryBuscaOrdemOpc);
         With dtmOperComum.qryBuscaOrdemOpc Do
            Begin
               ParamByName('IDLOTE').AsString := sLote;
               Open;
               If Not IsEmpty Then
                  Begin
                     OperComum.LimpaParametros(dtmOperComum.qryInvestBase);
                     With dtmOperComum.qryInvestBase Do
                        Begin
                           ParamByName('IDINVESTIMENTO').AsInteger :=
                              dtmOperComum.qryBuscaOrdemOpc.FieldByName('IDINVESTIMENTO').AsInteger;
                           Open;
                           If Not IsEmpty Then
                              Begin
                                 If (dDataRef <= FieldByName('DTAVENCTO').AsDateTime) And
                                    (fCotacao > FieldByName('PRECOPORLOTE').AsFloat) Then
                                    Result := FieldByName('PRECOPORLOTE').AsFloat;
                              End;
                        End;
                  End;
            End;
      End;
End;

Function TOperComum.FormatSecsToHMS(Secs: LongInt): String;
Var Hrs, Min: Word;
Begin
   Hrs := Secs Div 3600;
   Secs := Secs Mod 3600;
   Min := Secs Div 60;
   Secs := Secs Mod 60;

   If Hrs > 0 Then
      Result := FormatFloat('#0', (Hrs / 1)) + ':' + FormatFloat('00', (Min / 1)) + ':' + FormatFloat('00', (Secs / 1))
   Else If Min > 0 Then
      Result := FormatFloat('#0', (Min / 1)) + ':' + FormatFloat('00', (Secs / 1))
   Else If Secs > 0 Then
      Result := '0:' + FormatFloat('00', (Secs / 1))
   Else
      Result := '0';

End;

// AL_66 - Inicio

Function TOperComum.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String;
Begin
   If BooleanExpr Then Result := IfTrue Else Result := IfFalse;
End;

Function TOperComum.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer;
Begin
   If BooleanExpr Then Result := IfTrue Else Result := IfFalse;
End;

Function TOperComum.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Extended): Extended;
Begin
   If BooleanExpr Then Result := IfTrue Else Result := IfFalse;
End;

Function TOperComum.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime;
Begin
   If BooleanExpr Then Result := IfTrue Else Result := IfFalse;
End;
// AL_66 - Fim

Function TOperComum.AScan(aArray: Array Of Integer; iElemento: Integer): Integer;
Var i: Integer;
Begin
   Result := -1;
   For i := 0 To Length(aArray) - 1 Do
      Begin
         If aArray[i] = iElemento Then
            Begin
               Result := i;
               Break;
            End;
      End;
End;

Function TOperComum.AScan(aArray: Array Of String; sElemento: String): Integer;
Var i: Integer;
Begin
   Result := 0;
   For i := 0 To Length(aArray) - 1 Do
      Begin
         If aArray[i] = sElemento Then
            Begin
               Result := i;
               Break;
            End;
      End;
End;

Function TOperComum.AScan(aArray: Array Of Double; dElemento: Double): Integer;
Var i: Integer;
Begin
   Result := 0;
   For i := 0 To Length(aArray) - 1 Do
      Begin
         If aArray[i] = dElemento Then
            Begin
               Result := i;
               Break;
            End;
      End;
End;

Function TOperComum.AScan(aArray: Array Of Variant; vElemento: Variant): Integer;
Var i: Integer;
Begin
   Result := 0;
   For i := 0 To Length(aArray) - 1 Do
      Begin
         If aArray[i] = vElemento Then
            Begin
               Result := i;
               Break;
            End;
      End;
End;

// AL_6 - 30/09/2004
{ Atualiza as sequences do banco.
  O Programa Sequences.exe não funciona. A tabela BOLETA agora tem uma sequence que
    não é chave da tabela, causando um erro neste programa que não funciona mais.
  Esta rotina efetua tratamento diferenciado para esta tabela.  }

Function TOperComum.AtualizaSequences(fraFrame: TfraMensagem = Nil; prgTabProg: TProgressBar = Nil): Boolean;
Var qrySeqs, qryAtu, qryMaxID: TwwQuery;
   sTabela: String;
   iNRec: Integer;
Begin
   Try
      Try
         qryAtu := TwwQuery.Create(Application);
         qryAtu.DatabaseName := 'BaseDados';
         qrySeqs := TwwQuery.Create(Application);
         qrySeqs.DatabaseName := 'BaseDados';
         qryMaxID := TwwQuery.Create(Application);
         qryMaxID.DatabaseName := 'BaseDados';

         qrySeqs.SQL.Add('SELECT DISTINCT ');
         qrySeqs.SQL.Add('       TRIM(SUBSTR(S.SEQUENCE_NAME, 4, 90)) AS TABELA, S.SEQUENCE_NAME AS SEQUENCE, ');
         qrySeqs.SQL.Add('       C.CONSTRAINT_NAME, I.COLUMN_NAME AS COLUNA');
         qrySeqs.SQL.Add('FROM ALL_SEQUENCES S, ALL_CONSTRAINTS C, ALL_IND_COLUMNS I ');
         qrySeqs.SQL.Add('WHERE S.SEQUENCE_NAME LIKE ' + QuotedStr('SEQ%'));
         qrySeqs.SQL.Add('  AND TRIM(SUBSTR(S.SEQUENCE_NAME, 4, 90)) <> ' + QuotedStr(' ') + ' ');
         qrySeqs.SQL.Add('  AND C.CONSTRAINT_TYPE = ' + QuotedStr('P') + ' ');
         qrySeqs.SQL.Add('  AND TRIM(SUBSTR(S.SEQUENCE_NAME, 4, 90)) = C.TABLE_NAME(+) ');
         qrySeqs.SQL.Add('  AND C.CONSTRAINT_NAME = I.INDEX_NAME(+) ');
         qrySeqs.SQL.Add('  AND I.COLUMN_NAME = TRIM(' + QuotedStr('ID') + ' || SUBSTR(S.SEQUENCE_NAME, 4, 90)) ');
         qrySeqs.SQL.Add('ORDER BY TABELA, SEQUENCE ');
         qrySeqs.Open;

         // A propriedade RecordCount não funciona aqui (Blob Field)
         iNRec := 0;
         While Not qrySeqs.Eof Do
            Begin
               iNRec := iNRec + 1;
               qrySeqs.Next;
            End;
         qrySeqs.First;

         If Not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         If fraFrame <> Nil Then
            Begin
               fraFrame.Visible := True;
               fraFrame.Max := iNRec;
               fraFrame.Pos := 1;
            End
         Else
            Begin
               frmAguardeInv.Max := iNRec;
               frmAguardeInv.Min := 0;
               frmAguardeInv.Pos := 1;
            End;

         // Faz Loop em todas as Sequences
         sTabela := qrySeqs.FieldByName('TABELA').AsString;
         While Not qrySeqs.Eof Do
            Begin
               qryMaxID.Close;
               qryMaxID.SQL.Clear;
               If qrySeqs.FieldByName('TABELA').AsString = 'BOLETA' Then
                  Begin
                     qryMaxID.SQL.Add('SELECT MAX(SEQBOLETA) AS MAXID FROM BOLETA');
                  End
               Else
                  Begin
                     qryMaxID.SQL.Add('SELECT MAX(' + qrySeqs.FieldByName('COLUNA').AsString + ') AS MAXID FROM ' + qrySeqs.FieldByName('TABELA').AsString);
                  End;
               qryMaxID.Open;

               qryAtu.Close;
               qryAtu.SQL.Clear;
               qryAtu.SQL.Add(' SELECT ' + qrySeqs.FieldByName('SEQUENCE').AsString + '.NEXTVAL AS VALOR FROM DUAL');

               If prgTabProg <> Nil Then
                  Begin
                     qryAtu.Open;
                     prgTabProg.Max := qryAtu.FieldByName('VALOR').AsInteger;
                     prgTabProg.Position := 1;
                  End;

               Repeat
                  // Adianta a Sequence
                  qryAtu.Close;
                  qryAtu.Open;
                  If fraFrame <> Nil Then
                     Begin
                        fraFrame.Mes := 'Processando Tabela ' + qrySeqs.FieldByName('TABELA').AsString + #13 +
                           'Sequence:' + qryAtu.FieldByName('VALOR').AsString;
                        fraFrame.Invalidate;
                        fraFrame.Update;
                     End
                  Else
                     Begin
                        frmAguardeInv.Mostra('Processando Tabela ' + qrySeqs.FieldByName('TABELA').AsString + #13 +
                           'Sequence:' + qryAtu.FieldByName('VALOR').AsString);
                        frmAguardeInv.Invalidate;
                     End;
                  If prgTabProg <> Nil Then
                     prgTabProg.StepIt;

                  Application.ProcessMessages;
               Until qryMaxID.FieldByName('MAXID').AsInteger <= qryAtu.FieldByName('VALOR').AsInteger;

               // Move até a próxima tabela
               While sTabela = qrySeqs.FieldByName('TABELA').AsString Do
                  Begin
                     qrySeqs.Next;
                     If fraFrame <> Nil Then
                        fraFrame.Incrementa
                     Else
                        frmAguardeInv.Incrementa;
                     Application.ProcessMessages;
                  End;
               sTabela := qrySeqs.FieldByName('TABELA').AsString;
            End;

         If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Commit;
      Except
         If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Rollback;
      End;
   Finally
      // AL_44
      If (fraFrame <> Nil) And (fraFrame.Parent <> Nil) Then
         Begin
            fraFrame.Pos := 0;
            fraFrame.Mes := '';
            fraFrame.Visible := False;
         End
      Else
         frmAguardeInv.Apaga;
      qryAtu.Free;
      qrySeqs.Free;
      qryMaxID.Free;
      Application.ProcessMessages;
   End;
End;

// AL_12 - 10/01/2005

Function TOperComum.InvMsgBox(Msg: String;
   DlgType: TMsgDlgType;
   sCaption: String = '';
   Buttons: TMsgDlgButtons = [mbOk];
   ButtonsCaptions: String = ''): Word;
Const
   Sounds: Array[TMsgDlgType] Of integer = (MB_ICONEXCLAMATION,
      MB_ICONHAND,
      MB_OK,
      MB_ICONQUESTION,
      MB_ICONASTERISK);
Var
   ComponentNO: TComponent;
   BotaoNO: TButton;
   sButtonName: String;
   I, iTam: Integer;
   aButCaption: Array Of String;
Begin
   I := 1;
   iTam := 0;
   While I <> 0 Do
      Begin
         I := Pos(';', ButtonsCaptions);
         If I > 0 Then
            Begin
               SetLength(aButCaption, iTam + 1);
               aButCaption[iTam] := Copy(ButtonsCaptions, 1, I - 1);
               Inc(iTam);
               Delete(ButtonsCaptions, 1, I);
            End
         Else
            Begin
               SetLength(aButCaption, iTam + 1);
               aButCaption[iTam] := ButtonsCaptions;
            End;
      End;

   With CreateMessageDialog(Msg, DlgType, Buttons) Do
      Begin
         Try
            If sCaption = '' Then
               Begin
                  If DlgType = mtWarning Then Caption := Caption + ' Atenção'
                  Else If DlgType = mtError Then Caption := Caption + ' Erro'
                  Else If DlgType = mtInformation Then Caption := Caption + ' Informação'
                  Else If DlgType = mtConfirmation Then Caption := Caption + ' Confirmação'
                  Else Caption := ' ' + Application.Title;
               End
            Else
               Caption := ' ' + sCaption;

            Position := poScreenCenter;

            iTam := 0;
            For I := 0 To ComponentCount - 1 Do
               Begin
                  If Components[I] Is TButton Then
                     Begin
                        If Length(aButCaption) >= iTam + 1 Then
                           TButton(Components[I]).Caption := aButCaption[iTam];
                        Inc(iTam);
                     End;
               End;

            Result := ShowModal;

         Finally
            Free;
         End;
      End;
End; {MessageBox}

// AL_38

Function TOperComum.OraNumero(sNumero: String): String;
Var i: integer;
   sOra: String;
   bPrimPonto: boolean;
Begin
   Result := '';
   If Trim(sNumero) <> '' Then
      Begin
         sOra := '';
         bPrimPonto := True;
         For i := length(Trim(sNumero)) Downto 1 Do
            Begin
               If sNumero[i] = ',' Then
                  Begin
                     If bPrimPonto Then
                        Begin
                           sOra := sOra + '.';
                           bPrimPonto := False;
                        End;
                  End
               Else
                  Begin
                     If sNumero[i] <> '.' Then
                        sOra := sOra + sNumero[i]
                     Else
                        Begin
                           If bPrimPonto Then
                              Begin
                                 sOra := sOra + '.';
                                 bPrimPonto := False;
                              End;
                        End;
                  End;
            End;
         For i := length(sOra) Downto 1 Do
            Result := Result + sOra[i];
      End
   Else
      Result := '0';
End;

// AL_41

Function TOperComum.OraNumero(fNumero: Double): String;
Var i: integer;
   sNumero, sOra: String;
   bPrimPonto: boolean;
Begin
   sNumero := FloatToStr(fNumero);
   Result := '';
   If Trim(sNumero) <> '' Then
      Begin
         sOra := '';
         bPrimPonto := True;
         For i := length(Trim(sNumero)) Downto 1 Do
            Begin
               If sNumero[i] = ',' Then
                  Begin
                     If bPrimPonto Then
                        Begin
                           sOra := sOra + '.';
                           bPrimPonto := False;
                        End;
                  End
               Else
                  Begin
                     If sNumero[i] <> '.' Then
                        sOra := sOra + sNumero[i]
                     Else
                        Begin
                           If bPrimPonto Then
                              Begin
                                 sOra := sOra + '.';
                                 bPrimPonto := False;
                              End;
                        End;
                  End;
            End;
         For i := length(sOra) Downto 1 Do
            Result := Result + sOra[i];
      End
   Else
      Result := '0';
End;
// AL_41 - fim

//AL_48

Function TOperComum.VerificaGrupamentoAnterior(iInvestimento, iCarteira, iCarteiraGerenc, iHistorico,
   iTipoOper, iTipoOperNovo: Integer;
   dDataOper: String;
   iPlanPrev: Integer = -1): boolean;
Begin
   //AL_83
   Try
      Result := False;
      If iCarteiraGerenc <> 0 Then
      Begin
         OperComum.LimpaParametros(dtmOperComum.qryHistGrupamentoGer);
         dtmOperComum.qryHistGrupamentoGer.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         dtmOperComum.qryHistGrupamentoGer.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteira;
         dtmOperComum.qryHistGrupamentoGer.ParamByName('IDCARTEIRAGERENC').AsInteger := iCarteiraGerenc;
         dtmOperComum.qryHistGrupamentoGer.ParamByName('DATAMOV').AsString := dDataOper;
         dtmOperComum.qryHistGrupamentoGer.ParamByName('HISTORICO').AsInteger := iHistorico;
         dtmOperComum.qryHistGrupamentoGer.ParamByName('iTIPOOPER').AsInteger := iTipoOper;
         dtmOperComum.qryHistGrupamentoGer.ParamByName('iTIPOOPERNOVO').AsInteger := iTipoOperNovo;
         //AL_83
         If iPlanPrev > 0 Then
            dtmOperComum.qryHistGrupamentoGer.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         dtmOperComum.qryHistGrupamentoGer.Open;
         If Not dtmOperComum.qryHistGrupamentoGer.IsEmpty Then
            Result := True;
      End
      Else
      Begin
         OperComum.LimpaParametros(dtmOperComum.qryHistGrupamento);
         dtmOperComum.qryHistGrupamento.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         dtmOperComum.qryHistGrupamento.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteira;
         dtmOperComum.qryHistGrupamento.ParamByName('DATAMOV').AsString := dDataOper;
         dtmOperComum.qryHistGrupamento.ParamByName('HISTORICO').AsInteger := iHistorico;
         dtmOperComum.qryHistGrupamento.ParamByName('iTIPOOPER').AsInteger := iTipoOper;
         dtmOperComum.qryHistGrupamento.ParamByName('iTIPOOPERNOVO').AsInteger := iTipoOperNovo;
         //AL_83
         If iPlanPrev > 0 Then
            dtmOperComum.qryHistGrupamento.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         dtmOperComum.qryHistGrupamento.Open;
         If Not dtmOperComum.qryHistGrupamento.IsEmpty Then
            Result := True;
      End;
   Finally
      dtmOperComum.qryHistGrupamento.Close;
      dtmOperComum.qryHistGrupamentoGer.Close;
   End;
End;

Function TOperComum.BuscaPercProvPerda(dDataAtual: TDateTime; iInvestimento: Integer;
   iCarteiraInvest: Integer = -1;
   iCarteiraGerenc: Integer = -1): Double;
Var qry: TwwQuery;
Begin
   Try
      Result := 0;
      qry := TwwQuery.Create(Application);
      qry.DatabaseName := 'BaseDados';
      qry.SQL.Add('SELECT DATAVIGENCIA, PERCENTUAL, IDINVESTIMENTO ');
      qry.SQL.Add('FROM PROVPERDARV ');
      qry.SQL.Add('WHERE IDINVESTIMENTO = ' + IntToStr(iInvestimento));
      qry.SQL.Add('  AND DATAVIGENCIA = ');
      qry.SQL.Add('        (SELECT MAX(P2.DATAVIGENCIA) ');
      qry.SQL.Add('         FROM PROVPERDARV P2 ');
      qry.SQL.Add('         WHERE P2.IDINVESTIMENTO = ' + IntToStr(iInvestimento));
      qry.SQL.Add('           AND P2.DATAVIGENCIA <= TO_DATE(' + QuotedStr(DateToStr(dDataAtual)) + ',' + QuotedStr('DD/MM/YYYY') + '))');
      qry.Open;
      If Not qry.IsEmpty Then
         Result := qry.FieldByName('PERCENTUAL').AsFloat;
   Finally
      FreeAndNil(qry);
   End;
End;

//AL_103

Procedure TOperComum.GravaLogTotalPrev(sDescOperacao: String);
Begin
   Try
      Opercomum.LimpaParametros(dmrendavariavel.QryGravaLogTotalPrev);
      dmrendavariavel.QryGravaLogTotalPrev.Close;
      dmrendavariavel.QryGravaLogTotalPrev.ParamByname('IDLOGTOTALPREV').AsInteger := LeUltRegistro(Nil, 'LOGTOTALPREV');
      dmrendavariavel.QryGravaLogTotalPrev.ParamByname('IDUSUARIO').AsInteger := Sistema.IdUsuario;
      dmrendavariavel.QryGravaLogTotalPrev.ParamByname('IDMODULO').AsInteger := Sistema.IdModulo;
      dmrendavariavel.QryGravaLogTotalPrev.ParamByname('VERSAO').AsString := Sistema.Versao;
      dmrendavariavel.QryGravaLogTotalPrev.ParamByname('DESCOPERACAO').AsString := sDescOperacao;
      dmrendavariavel.QryGravaLogTotalPrev.ExecSQL;
      dmrendavariavel.QryGravaLogTotalPrev.Close;
   Except
   End;
End;

//AL_109

Function TOperComum.DataOracle(dData: TDateTime): String;
Begin
   Try
      Result := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dData)) + ',' + QuotedStr('dd/mm/yyyy') + ')';
   Except
      If dData = 0 Then
         Begin
            Result := '';
            Exit;
         End;
      Result := DataOracle(0);
   End;
End;

Function TOperComum.DataOracle(sData: String): String;
Begin
   Try
      Result := 'TO_DATE(' + QuotedStr(sData) + ',' + QuotedStr('dd/mm/yyyy') + ')';
   Except
      If sData = '' Then
         Begin
            Result := '';
            Exit;
         End;
      Result := DataOracle('');
   End;
End;

Function TOperComum.GetSaldoEmAtualizaSaldo: Double;
Begin
   Result := fQtdeFinalInvest;
End;

//Ricardo Cristiano - 21/07/2009 - N. Sol 122235 -  N. Kintana 597042

Function TOperComum.VerificaDesdobramentoAnterior(iInvestimento, iCarteira, iCarteiraGerenc, iHistorico,
   iTipoOper, iTipoOperNovo: Integer;
   dDataOper: String;
   iPlanPrev: Integer = -1): boolean;
Begin
   //AL_83
   Try
      Result := False;
      OperComum.LimpaParametros(dtmOperComum.qryHistDesdobramento);
      dtmOperComum.qryHistDesdobramento.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
      dtmOperComum.qryHistDesdobramento.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteira;
      dtmOperComum.qryHistDesdobramento.ParamByName('DATAMOV').AsString := dDataOper;
      dtmOperComum.qryHistDesdobramento.ParamByName('HISTORICO').AsInteger := iHistorico;
      dtmOperComum.qryHistDesdobramento.ParamByName('iTIPOOPER').AsInteger := iTipoOper;
      dtmOperComum.qryHistDesdobramento.ParamByName('iTIPOOPERNOVO').AsInteger := iTipoOperNovo;
      //AL_83
      If iPlanPrev > 0 Then
         dtmOperComum.qryHistDesdobramento.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
      dtmOperComum.qryHistDesdobramento.Open;
      If Not dtmOperComum.qryHistDesdobramento.IsEmpty Then
         Result := True;
   Finally
      dtmOperComum.qryHistDesdobramento.Close;
   End;
End;

Function TOperComum.RetornaSegmentacaoRV(iInvestimento: integer): integer;
Var
   QryAux: TwwQuery;
   sSql: String;
Begin
   QryAux := TwwQuery.Create(Nil);
   QryAux.DataBaseName := 'BaseDados';

   sSql := 'SELECT E.IDSEGMENTACAO FROM INVESTIMENTO I, EMISSOR E ' + #13 +
           'WHERE I.IDINVESTIMENTO = ' + intToStr(iInvestimento) + #13 +
           'AND I.IDEMISSOR = E.IDEMISSOR ' + #13;

   QryAux.Close;
   QryAux.sql.Clear;
   QryAux.sql.Add(sSql);
   QryAux.Open;

   If QryAux.RecordCount > 0 Then
      Result := QryAux.FieldByName('IDSEGMENTACAO').AsInteger
   Else
      Result := 0;
   QryAux.Close;

   FreeAndNil(QryAux);
End;

Function TOperComum.RetornaSegmentacaoFdos(iTipoFundoInvest, iFundoInvest :Integer): Integer;
var
  QryAux: TwwQuery;
  sSql: String;
begin

  QryAux := TwwQuery.Create(Nil);
  QryAux.DataBaseName := 'BaseDados';

  {sSql := 'SELECT TF.IDSEGMENTACAO ' + #13 +
          'FROM TIPOTITULO TT, TIPOACAO TA, TIPOTITRENFIXA TR, ' + #13 +
          '(SELECT IDTIPOINVEST, UPPER(DESCTIPOFUNDOINV) AS DESCTIPOFUNDOINV, IDTIPOFUNDOINVEST, IDSEGMENTACAO' + #13 +
          '      FROM TIPOFUNDOINVEST ' + #13 +
          '      WHERE IDTIPOINVEST = :IDTIPOINVEST) TF ' + #13 +
          'WHERE (TT.IDTIPOINVEST  = :IDTIPOINVEST) ' + #13 +
          '  AND (TT.CODTIPTITULO  = TA.CODTIPOACAO(+) ) ' + #13 +
          '  AND (TT.CODTIPTITULO  = TR.CODTIPRENFIXA(+) ) ' + #13 +
          '  AND (TT.IDTIPOINVEST  = TF.IDTIPOINVEST(+) ) ' + #13 +
          '  AND ( (:IDTIPOINVEST <> 10) OR ' + #13 +
          '        ((:IDTIPOINVEST = 10) AND ' + #13 +
          '((TF.DESCTIPOFUNDOINV LIKE ' + QuotedStr('FUNDO DE PARTICIPA%') +') AND (TT.CODTIPTITULO=' + QuotedStr('FRFPA') +')) OR ' + #13 +
          '((NOT (TF.DESCTIPOFUNDOINV LIKE ' + QuotedStr('FUNDO DE PARTICIPA%') +')) AND (TT.CODTIPTITULO=' + QuotedStr('FMIEE') +')) ) ) ' + #13 +
          '  AND ( ( ( (5  = :IDTIPOINVEST) OR ' + #13 +
          '            (6  = :IDTIPOINVEST) OR ' + #13 +
          '            (7  = :IDTIPOINVEST) OR ' + #13 +
          '            (9  = :IDTIPOINVEST) OR ' + #13 +
          '            (10 = :IDTIPOINVEST) ) AND ' + #13 +
          '( ((TF.DESCTIPOFUNDOINV = ' + QuotedStr('FIDC') + ') AND (TT.CODTIPTITULO = ' + QuotedStr('FFIDC') +')) OR ' + #13 +
          '  ((TF.DESCTIPOFUNDOINV = ' + QuotedStr('FIC DE FIDC') + ') AND (TT.CODTIPTITULO = ' + QuotedStr('FICDC') + ')) OR ' + #13 +
          '  ((TF.DESCTIPOFUNDOINV <> ' + QuotedStr('FIDC') + ') AND (TF.DESCTIPOFUNDOINV <> ' + QuotedStr('FIC DE FIDC') +') AND (TT.CODTIPTITULO = ' + QuotedStr('FFIDC') +')) ) ) OR ' + #13 +
          '( (((5 = :IDTIPOINVEST) AND (TT.CODTIPTITULO = ' + QuotedStr('FR') +'|| TF.DESCTIPOFUNDOINV)) OR ' + #13 +
          '  ((6 = :IDTIPOINVEST) AND ((TF.DESCTIPOFUNDOINV = ' + QuotedStr('FUNDO DE ACOES') +') OR (TF.DESCTIPOFUNDOINV = ' + QuotedStr('FUNDO DE AÇOES') + ')) AND (TT.CODTIPTITULO=' + QuotedStr('FRVAR') +')) OR ' + #13 +
          '  ((6 = :IDTIPOINVEST) AND (TF.DESCTIPOFUNDOINV LIKE ' + QuotedStr('FUNDO DE INV. EM PARTICIP%') +') AND (TT.CODTIPTITULO=' + QuotedStr('FRFIP') + '))) OR ' + #13 +
          '  ((TT.IDTIPOINVEST <> 5) AND (TT.IDTIPOINVEST <> 6) AND (TT.IDTIPOINVEST <> 9)) ) ) ' + #13 +
          'AND ((TT.CODTIPTITULO||TA.DESCTIPOACAO||TR. DESCTIPRENFIXA||TF.DESCTIPOFUNDOINV) IS NOT NULL) ' + #13 +
          'AND TT.CODTIPTITULO = :CODTIPTITULO';     }

    sSql := 'SELECT TF.IDSEGMENTACAO FROM FUNDOINVEST FI, TIPOFUNDOINVEST TF                   ' + #13 +
            'WHERE FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST                                 ' + #13 +
            'AND ((:IDFUNDOINVEST IS NULL) OR (FI.IDFUNDOINVEST = :IDFUNDOINVEST))             ' + #13 +
            'AND ((:IDTIPOFUNDOINVEST IS NULL) OR (TF.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) ' + #13;

    with QryAux do begin
      Close;
      Sql.Add(sSql);
      ParamByName('IDTIPOFUNDOINVEST').DataType := ftInteger;
      ParamByName('IDFUNDOINVEST').DataType     := ftInteger;
      if iTipoFundoInvest > 0 then
        ParamByName('IDTIPOFUNDOINVEST').AsInteger := iTipoFundoInvest;
      if iFundoInvest > 0 then
        ParamByName('IDFUNDOINVEST').AsInteger := iFundoInvest;
      Open;
    end;

    If QryAux.RecordCount > 0 Then
      Result := QryAux.FieldByName('IDSEGMENTACAO').AsInteger
   Else
      Result := 0;

   FreeAndNil(QryAux);

end;

//Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
function TOperComum.RetornaDtContabDivBonif(dDataOper, dDataEx, dDataAge: TDateTime): TDateTime;
var dDataContab : TDateTime;
    Year, Month, Day : Word;
begin
   if ((pRPI.DATAVIGDIR <= 0) or (dDataOper < pRPI.DATAVIGDIR)) then
      dDataContab := dDataEx
   else
   begin
      if pRPI.TPDATAVIGDIR = '1' then
         dDataContab := dDataAge
      else
         dDataContab := dDataEx;
   end;
//Ricardo Cristiano - 24/06/2011 - N. Sol 158095/5342 -  N. Kintana 1331759
{
   while not CtrlInvContab.TestaPeriodo(DateToStr(dDataContab), 2) do
   begin
      DecodeDate(dDataContab, Year, Month, Day);

      dDataContab := DiasUteisInv.UltDiaMes(Year, Month);

      dDataContab := DiasUteisInv.PrimeiroDiaUtilPosterior(dDataContab, -1, 1, '', True, False, False);

   end;}
   Result := dDataContab;
end;

function TOperComum.RetornaDataDivConsulta(dDataOper: TDateTime): Integer;
var qryAux: TwwQuery;
begin
  // Kintana Nº1445208 SOL Nº166117  Otacilio ** Inicio **
  QryAux := TwwQuery.Create(Nil);
  QryAux.DataBaseName := 'BaseDados';
  if (pRPI.DATAVIGDIR <= 0) {or (dDataOper < pRPI.DATAVIGDIR)} then
     result := 0
  else
  begin
     {if pRPI.TPDATAVIGDIR = '1' then
       result := 1
    else
       result := 0;}
    try
      qryAux := TwwQuery.Create(Nil);
      qryAux.DataBaseName := 'BaseDados';
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := 'SELECT MAX(PD.DATAVIGENTE) AS DATAVIGENTE, NVL(PD.TPDATAVIGDIR, 0) AS TPDATAVIGDIR FROM CM.PARAMDATADIRETOS PD ' +
                         'WHERE PD.DATAVIGENTE <= TO_DATE( ' + QuotedStr(DateToStr(dDataOper)) + ', ''DD/MM/YYYY'') GROUP BY PD.TPDATAVIGDIR';
      qryAux.Open;

      if qryAux.RecordCount = 0 then
        Result := 0
      else
        Result := qryAux.FieldByName('TPDATAVIGDIR').AsInteger;
    finally
      FreeAndNil(qryAux);
    end;
  end;
  // Kintana Nº1445208 SOL Nº166117  Otacilio ** Fim **
end;

//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
function TOperComum.ProcessaTransfCarteira(iCarteiraOrig, iCarteiraDest,
                                           iIdForCli, iInvestimento,
                                           iCustodianteOrig, iCustodianteDest,
                                           iIdMotBloqOrig, iIdMotBloqDest,
                                           iMercadoOrig, iMercadoDest,
                                           iPlanPrev, iTipoConta : Integer;
                                           sDescInvestimento : String;
                                           fQuantidade : Double;
                                           dDataOper : TDateTime) : boolean;

var  iIdHistCartInvDest : Integer;
begin
   Try //Except
 
      if not OperComum.TransfEntreCarteiras(iIdForCli,
                                            iCarteiraOrig,
                                            iCarteiraDest,
                                            iInvestimento,
                                            iCustodianteOrig,
                                            iCustodianteDest,
                                            iIdMotBloqOrig,
                                            iIdMotBloqDest,
                                            iMercadoOrig,
                                            iMercadoDest,
                                            iIdForCli,
                                            fQuantidade,
                                            fQuantidade,
                                            dDataOper,
                                            False,
                                            '','',
                                            iIdHistCartInvDest,
                                            iPlanPrev, -1,
                                            iTipoConta) then
         Raise Exception.Create('Ocorreu um problema na transferência de carteiras para o Investimento ' + Trim(sDescInvestimento));
      Result := True;
   Except
      on E:Exception do
      begin
         MsgDlg('Não foi possível efetuar esta operação.' + #13 +
                E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         Result := False;
      end;
   end;
end;

End.

