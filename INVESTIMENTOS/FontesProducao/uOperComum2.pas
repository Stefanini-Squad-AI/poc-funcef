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

unit UOperComum;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, USistema, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls,UOperacaoInvest,UBibliotecaInvest,
  wwdblook, DBTables, mxtables, mxstore, mxDB, Wwdatsrc, faMensagem, uCMMath, ComCtrls,
                                                    //AL_93
  uCtrlInvContab, uCtrlRendaVariavel, uCtrlPadroes, uCtrlParamInvest,
  //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
  uCtrlParamCotacaoRV;

type

   TOperComum = Class(TObject)

   private

// =================================================================================================
//    Uso interno (por outras funções)
// =================================================================================================
      procedure MensagemErroContab(iResultado: integer);
      procedure MensagemErroPeriodo(iErroPeriodo: integer);

      // Função que testa a consistência dos parâmetros passados para AlimentaCarteira
      function VerificaParametros(var iInvestimento, iTipoInvest, iOperacao, iTipoOperacao,
      iCarteira, iDespesaOperacao, iDespesaCarteira: integer; fValorPrimeiraCota: currency;
      sNaturezaMovimento: string): boolean;

      procedure MostraErroAtualiza(sCarteira, sInvestimento, sTipoMov, sLancamento, sDataLanc, sMsg: string);
      procedure MostraErroAtualizaInvest(sCarteira, sInvestimento, sLote, sData, sMsg: string);

   public

// =================================================================================================
//    Integração Financeira / Contábil
// =================================================================================================

      // Retorna a máscara do Plano de Contas
      function GetMascaraPlano(iPlano: integer): string;

      // Gera um nº de documento único
      function GeraNoDocumento(c: char): extended;

      // Abre a qryPadrLanc de acordo com os parâmetros passados
      procedure AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento,
      iCarteira: integer; sTipoTitulo, sTipoMov: string);

      // Função que busca na tabela PadrLancContInv o conjunto de parâmetros de integração mais
      // apropriado, dadas as condições passadas. Mesma função p/ Operação quanto p/ Despesa de Operação
      function BuscaPadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento,
      iCarteira: integer; fValor: double; sTipoTitulo, sTipoMov: string; var iPlano, iSubContaDeb,
      iSubContaCred, iUnidNegoc: integer; var sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
      sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper, sRecPagNao: string): integer;

      // Função que efetua o par de lançamentos Contábeis e o lançamento de CAPCAR (se aplicáveis)
      // associados a uma Operação de Investimento (de acordo com a tabela PadrLancContInv)
      function LancaOperRFRV(iEmpresaProp, iModuloOrigem, iTipoInvest, iInvestimento,
      iTipoOperacao, iOperacao, iForCli, iCarteira, iMoeda: integer; sTipoTitulo, sLote, sHistContab, sHistCapCar, sRecPagBol: string;
      var sTipoRecDesBol: string; var bCriaLancto: boolean; fTotalLiquido, fVlrOper: currency; dDataOper, dDataVenc: TDateTime;
      var iPlano, iPlanilhaOper, iDocumentoOper : integer; var sMensErro: string;
      sIntegraCapCar : String = ''; bGravaDoc : Boolean = True; bLancaFin : Boolean = True;
      iCodTipDoc : Integer = 0;
      bDireitoOrig : Boolean = True;
      iPlanPrevPatr: Integer = -1): shortint;

      // Função que efetua cada par de lançamentos contábeis
      function LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaD, iSubContaC,
      iUnidNegoc, iForCli, iPlanoPrev, iPatro: integer; sContaD, sContaC, sCentroCustoD, sCentroCustoC, sHistorico, sTipoPer,
      sRecPag: string; dDataLanc: TDateTime; fValorLanc: currency; bMostraMsg: boolean; var iPlanilha: integer;
      var sMensContab: string; iUsuarioOrigem: Integer = -1): boolean;

// =================================================================================================
//    Movimentação / Atualização
// =================================================================================================

      // Função que alimenta Carteira
      function AlimentaCarteira(iEmpresaProp, iModuloOrigem, iInvestimento, iTipoInvest, iOperacao,
      iLancImovel, iTipoOperacao, iCarteira, iCarteiraGerenc, iDespesaOperacao, iDespesaCarteira, iPlanilha, iDocumento,
      iPlano: integer; dDataOper: TDateTime; fValorOperacao :currency; fQtdInvestOperacao :Double;fValorPrimeiraCota,
      fValorVariacao, fValorJuros, fValorIRProv, fValorIRApu, fValorIOFProv, fValorIOFApu,
      fValorAgio,fVlrCPMFProv,fVlrCMPFApu: currency; sNaturMov, sNaturOper, sLote, sHistorico, sTipoMov, sFlgCustodia,
      sRecPag: string; bMostraMsg: boolean;iIdCorretValores,iIdPlanPrevCtbPatr : integer;
      var iIdHistCartInv:Integer): boolean;

      // Função que Atualiza Saldos de Carteira/Investimento/Lote no HistCartInv
      function AtualizaSaldos(fValorPrimeiraCota: currency; dDataFinal: TDateTime) : boolean;

      // Marca registros quando excluindo da HistCartInv
      Procedure MarcaFlgHistCartInv(TipoMovCart:String; IdLancamento:Integer);

      function  ProcEstorna(iDocumento, iPlanilha, iPlano : longint; dDataEstorno: TDateTime;
                            bMostraMsg : boolean) : Boolean;

      // AL_13
      function  ProcExclui(iDocumento, iPlanilha, iPlano, iTipoInvest : longint;
                           dDataExclusao: TDateTime;
                           bMostraMsg: boolean = True; bComita: Boolean = True) : Boolean;

      //AL_28 - 23/03/2005

      //AL_94
      function  EstornaOper(sBoleta                      : String;
                            iTipoInvest, iOperacaoInvest, iInvestimento : Integer;
                            dDataEstorno                 : TDateTime;
                            fValorPrimeiraCota           : currency;
                            sEstExc                      : string;
                            bMostraMsg                   : boolean;
                            iIdTipoOperacao : Integer = 0) : boolean;

      // Função que Retorna Valor a Contabilizar
      function BuscaValorAContabilizar(iIdHistcartinv, iIdTipoDespInvest,iTipoInvest: longint; bOperVenda: boolean;
                                       var fValorAContabilizar: Double): boolean;

// =================================================================================================
//    Saldos
// =================================================================================================

      //necessária p/ AlimentaCarteira
      //AL_2
      //AL_5 - 05/10/2004 - Alteração na Ordem dos parâmetros e criação de novo parâmetro
      //AL_71
      //AL_75
      //AL_78
      function BuscaTodosSaldosInvestLote(iCarteira, iCarteiraGerenc, iInvestimento, iHistCartInv,iCustodiante: integer;
      sLote, dDataRef: string; iMotivoBloqueio: Integer;
      var fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu, fSdoCar, fSdoAqui, fSdoRend,
      fSdoMercado, fSdoVar, fSdoJur, fSdoPre, fSdoIRProv, fSdoIRApu, fSdoIOFProv, fSdoIOFApu,
      fSdoAgio,fSdoQtdLibCustodia, fSdoQtdBloqCustodia, fSdoQtdCPMF, fSdoProvPerda: double): boolean;

      // Função que Calcula Saldo de Combinações de Carteira/Investimento/Lote no dia
      function CalculaSaldo(iInvestimento, iCarteira: integer; sLote: string; dDataOper: TDateTime;
      var fSaldoQtdeInvCart, fSaldoVlrInvCart, fSaldoCotasCartInv, fSaldoVlrCartInv, fSaldoAtu, fSaldoCar,
      fSaldoAqui, fSaldoRend, fSaldoMercado, fSaldoVar, fSaldoJur, fSaldoPre, fSaldoIRProv, fSaldoIRApu,
      fSaldoIOFProv, fSaldoIOFApu, fSaldoAgio: double): boolean;

      // Função que Soma Saldos dos  Investimentos na Carteira para uma determinada data
      function SaldosInvCart(iCarteira: integer; dDataRef: TDateTime; var fSaldoQtdeInvCart,
      fSaldoVlrInvCart, fSaldoAtu, fSaldoCar, fSaldoAqui, fSaldoRend, fSaldoMercado: double) : boolean;

      //Al_29 - 29/03/2005
      // Totalizador Carteira, Investimento e Plano ou um a um
      procedure TotalSaldosInvCart(iiCarteira, iiCartGerenc,
                                   iiInvestimento, iiPlanPrevCtbPatr : integer;
                                   dDataRef: TDateTime;
                               var fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu,
                                   fSdoCar, fSdoAqui, fSdoRend : double);

      // Função que Busca Cotação de um Investimento numa determinada data.
      function BuscaCotacaoInvest(iInvestimento: integer; dDataRef: TDateTime; bUsaLote: boolean): double;

      function BuscaVlrCotaCarteira(iCarteira: integer; dDataRef: TDateTime): double;
      function BuscaSaldoCarteira(iCarteira: integer; dDataRef: TDateTime): double;

// =================================================================================================
//    Moedas / Índices
// =================================================================================================

      // Função que Busca Cotação de uma Moeda numa determinada data, segundo um Operador de
      // Procura : (=, <, <=, >, >=)
      function BuscaCotacaoMoeda(iMoeda: integer; dDataRef: TDateTime; sOperador: string;
      var fCotacao: double; var dDataCotacao: TDateTime): boolean;

      // Função que Busca Cotação de uma Moeda numa determinada data.
      function LeMoeda(iMoeCodigo: integer; dCotData: TDateTime; sFlgProRata, sFlgInterpola: string): double;

      // Função que Calcula Juros Diários a partir de um Valor e o Tipo de Juros.
      function CalculaJurosDia(fValorJuros: double; iTipoJuros: integer): double;

      // Função que retorna o Saldo das contas contábeis de variação Positiva e Negativa para contabilização
      //function BuscaTipoOperVarRV(var RecBuscaTipoOperVarRV : TRecBuscaTipoOperVarRV):Integer;
      procedure BuscaTipoOperVarRV;

      function DivValorZero(Valor1, Valor2: Extended): Extended;

      function Trunca(rValor: Double;iQtdDec: Integer):Double;

      function Round(rValor: Double;iQtdDec: Integer): Double;

      function ConvertePonto(sConverter : string):string;

      function StripChar(S : String; C : Char) : String;

      function BuscaSaldoContabil(iPlano,iPlanoPrev,iPatro,iPerExercicio,iPerNumero,iPessoa:integer;
                                  dPlnDatDia:TDateTime;sPlaConta:string ):Double;

      function VerificaData(sData : String) : Boolean;

      function BuscaForCli(iTipoInvest,iCorretEmissor,iTipoOperacao,iTipoCliente:integer):integer;

      function BuscaCotacaoAcao(iInvestimento: integer; dDataRef: TDateTime; bUsaLote: boolean): double;

      function VerificaFechamento(edDataRef : TDateTime) : Boolean;

      function EstornaFinanPendencia(iDocumento: Integer;
                                     dDataEstorno: TDateTime): boolean;

      //AL_99
      function LancaOperPendRV(iIdCorretValores, iOperacaoOrigem,iEmpresaProp, iModuloOrigem,
                               iTipoInvest, iInvestimento, iTipoOperacao, iOperacao, iForCli,
                               iCarteira, iMoeda, iiPlanPrev : integer;
                               sTipoTitulo, sLote, sHistCapCar, sRecPagBol: string;
                               var sTipoRecDesBol      : string;
                               var bCriaLancto         : boolean;
                               fTotalLiquido, fVlrOper : currency;
                               dDataOper, dDataVenc    : TDateTime;
                               var iPlano, iPlanilhaOper, iDocumentoOper : Integer;
                               var sMensErro : string): shortint;

      function  DataPrazo(dData : TDateTime; iPrazo : Integer):TDateTime;

      function  AlteraDataFechRV(dData: TDateTime): Boolean;

      procedure ChamaRegra(sRegraSel : string; TpCons : Integer);

      function LimpaParametros(const qry: TQuery; Prepara: Boolean = False): Boolean; OverLoad;

      function LimpaParametros(const qry: TwwQuery; Prepara: Boolean = False): Boolean; OverLoad;

      function LimpaParametros(const qry: TDecisionQuery; Prepara: Boolean = False): Boolean; OverLoad;

      procedure VerificaVencimentoBMF(dDataNow:TDateTime);

      procedure VerificaVencimentoCartaFianca(dDataNow:TDateTime);

      procedure BuscaFlgContab(iTipoOper:Integer);

      function PosicionaWWLookUpQry(dbLookUp: TwwDBLookupCombo; Query: TwwQuery): Boolean;

      //Al_39
      function TransfEntreCarteiras(iForCli, iCarteiraOrig,iCarteiraDest,
                                    iInvestimento,
                                    iCustodianteOrig,
                                    iCustodianteDest,
                                    iIdMotBloqOrig,
                                    iIdMotBloqDest,iMercadoOrig,
                                    iMercadoDest,
                                    iIdForCli :Integer;
                                    fSaldo, fQuantidade : Double;
                                    dDataRef : TDateTime;
                                    bEmpAcoes : boolean;
                                    sLote, sBoleta : String;
                                    var iIdHistCartInvDest: Integer;
                                    iPlanPrev: Integer = -1;
                                    iPlnCodigo: Integer = -1;
                                    iTipoConta: Integer = 0): boolean;

      //AL_71
      procedure InsereHistCustodiaDestino(idOperCustodia,iMotivoBloqueio,iCarteira,
                                          iInvestimento,iCustodiante:integer;
                                          sLote:String;
                                          dDataRef:TDateTime;fQuantidade:Double;
                                      var iIdHistCustodiaDest:integer;
                                          iPlanPrev: Integer = -1;
                                          iTipoConta : Integer = 0);

      //AL_71
      procedure AlteraHistCustodiaOrigem( idOperCustodia,iMotivoBloqueio,iCarteira,
                                          iInvestimento,iCustodiante:integer;sLote:String;
                                          dDataRef:TDateTime;
                                          fQuantidade:Double;
                                      var iIdHistCustodiaOrig:integer;
                                          iPlanPrev: Integer = -1;
                                          iTipoConta : Integer = 0);

      function ProcExcluiCustodia(iIdOperCustodia, iIdHistCartInvOrig,
                                   iIdHistCartInvDest : Integer;
                                   dDataMovCustod     : TDateTime) : Boolean;

      function ComparaValores(fValor1, fValor2: Double; sComparador: String;
                              fPrecisao: Integer = 0): Boolean;

      function BuscaCotacaoOpcao(iInvestimento,iCarteira: integer;
                                 dDataRef: TDateTime;
                                 sLote : String;
                                 fCotacao:Double): double;

      function FormatSecsToHMS(Secs: Integer): string;

      // AL_66 - Inicio
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Extended): Extended; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime; overload;
      // AL_66 - Fim

      function AScan(aArray: array of Integer; iElemento: Integer): Integer; overload;
      function AScan(aArray: array of String;  sElemento: String): Integer; overload;
      function AScan(aArray: array of Double;  dElemento: Double): Integer; overload;
      function AScan(aArray: array of Variant; vElemento: Variant): Integer; overload;

      // AL_6 - 30/09/2004
      function AtualizaSequences(fraFrame: TfraMensagem = nil; prgTabProg: TProgressBar = nil): Boolean;

      // AL_12 - 10/01/2005
      function InvMsgBox( Msg : string;
                          DlgType: TMsgDlgType;
                          sCaption: string = '';
                          Buttons: TMsgDlgButtons = [mbOk];
                          ButtonsCaptions: String = '') : Word;

      // AL_38
      function OraNumero( sNumero: String ): String; overload;
      // AL_41
      function OraNumero( fNumero: Double ): String; overload;

      //AL_48
      function VerificaGrupamentoAnterior(iInvestimento,iCarteira,iCarteiraGerenc, iHistorico,
                                          iTipoOper, iTipoOperNovo : Integer;
                                          dDataOper : string;
                                          iPlanPrev: Integer = -1) : boolean;

      //AL_77
      function BuscaPercProvPerda(dDataAtual: TDateTime; iInvestimento: Integer;
                                  iCarteiraInvest: Integer = -1;
                                  iCarteiraGerenc: Integer = -1): Double;

      //Al_103
      procedure GravaLogTotalPrev(sDescOperacao: String);

      //AL_109
      function DataOracle(dData: TDateTime): String; OverLoad;
      function DataOracle(sData: String): String; OverLoad;

      //--Emerson--//
      function GetSaldoEmAtualizaSaldo : Double;

      //Ricardo Cristiano - 21/07/2009 - N. Sol 122235 -  N. Kintana 597042
      function VerificaDesdobramentoAnterior(iInvestimento,iCarteira,iCarteiraGerenc, iHistorico,
                                             iTipoOper, iTipoOperNovo : Integer;
                                             dDataOper : string;
                                             iPlanPrev: Integer = -1) : boolean;
   end;

var
  OperComum : TOperComum;
  //AL_83 - Evento para atualizar o progress bar do form
  AtualizaProcesso: procedure(sMsg: String; iMaximo: Integer = -1);

  //--Emerson--//
  fQtdeFinalInvest : Double;

implementation

uses
  uLancContab, uDocumento, uIntegraBack, uMensErro, uFuncaoGeral, uDataBase, uDiasUteis,
  dBaseDados, dOperacaoInvest, UImpostos, fAguarde, fAguardeInv, dRendaVariavel,
  Math, dOperComum, UDiasUteisInv, UString, UCotaComum, FConsultaRegra,
  uEmprestAcoes, uRendaVariavel;

// =================================================================================================
//    Uso interno (por outras funções)
// =================================================================================================

procedure TOperComum.MensagemErroContab(iResultado: integer);
begin
   case iResultado of
      -1: MsgDlg('A Conta Contábil de débito está bloqueada ou inativa', 'Erro', mtError, [mbOk], 0);
      -2: MsgDlg('A Conta Contábil de crédito está bloqueada ou inativa', 'Erro', mtError, [mbOk], 0);
      -3: MsgDlg('', 'Erro', mtError, [mbOk], 0);
      -4: MsgDlg('A Conta Contábil de débito não existe', 'Erro', mtError, [mbOk], 0);
      -5: MsgDlg('A Conta Contábil de crédito não existe', 'Erro', mtError, [mbOk], 0);
      -6: MsgDlg('Não exite cotação cadastrada para a Moeda escolhida', 'Erro', mtError, [mbOk], 0);
      -7: MsgDlg('Não existe a Planilha escolhida', 'Erro', mtError, [mbOk], 0);
      -8: MsgDlg('Os parâmetros contábeis não estão corretamente cadastrados', 'Erro', mtError, [mbOk], 0);
   end;
end;

procedure TOperComum.MensagemErroPeriodo(iErroPeriodo: integer);
begin
   case iErroPeriodo of
      1: MsgDlg('O Período escolhido não Existe', 'Erro', mtError, [mbOk], 0);
      2: MsgDlg('O Período escolhido existe mas não é único', 'Erro', mtError, [mbOk], 0);
      3: MsgDlg('O Período escolhido está bloqueado', 'Erro', mtError, [mbOk], 0);
      4: MsgDlg('O Período escolhido está bloqueado', 'Erro', mtError, [mbOk], 0);
   end;
end;

// -------------------------------------------------------------------------------------------------
// Função que testa a consistência dos parâmetros passados para Alimenta Carteira
// -------------------------------------------------------------------------------------------------
function TOperComum.VerificaParametros(var iInvestimento, iTipoInvest, iOperacao, iTipoOperacao,
iCarteira, iDespesaOperacao, iDespesaCarteira: integer; fValorPrimeiraCota: currency;
sNaturezaMovimento:string): boolean;
begin
   Result := False;

   // o valor da 1ª cota deve ser informado e positivo
   if fValorPrimeiraCota <= 0 then Exit;
   // Natureza da Operacao deve ser Informada
   if sNaturezaMovimento = '' then Exit;

   // se não foi informada a carteira, a operacao
   if iCarteira <= 0 then Exit;

   // se não for uma despesa
   if iDespesaCarteira > -1 then begin

      // 'zera' todos os outros parâmetros
      iInvestimento     := -1;
      iOperacao         := -1;
      iDespesaOperacao  := -1;
      iTipoInvest       := -1;
      iTipoOperacao     := -1;

   end else begin

      // verifica os outros parâmetros obrigatórios
      if iInvestimento <= 0 then Exit;
      if iTipoInvest <= 0 then Exit;

      iDespesaCarteira := -1;

   end;

   Result := True;
end;

procedure TOperComum.MostraErroAtualiza(sCarteira, sInvestimento, sTipoMov, sLancamento, sDataLanc, sMsg: string);
var
   sMensagem : string;
begin
   sMensagem :=
   'Houve ERRO na tentativa de atualização dos saldos. ' + chr(13) +
   'Carteira           : ' + sCarteira + chr(13) +
   'Investimento       : ' + sInvestimento + chr(13) +
   'Tipo de Movimento  : "' + sTipoMov + '"' + chr(13) +
   'Lançamento         : ' + sLancamento + chr(13) +
   'Data do Lançamento : ' + sDataLanc + chr(13) + chr(10) +
   'Mensagem: ' + sMsg;

   MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
end;





procedure TOperComum.MostraErroAtualizaInvest(sCarteira, sInvestimento, sLote, sData, sMsg: string);
var
   sMensagem : string;
begin
   sMensagem :=
   'Houve ERRO na tentativa de atualização dos saldos. ' + chr(13) +
   'Carteira     : ' + sCarteira + chr(13) +
   'Investimento : ' + sInvestimento + chr(13) +
   'Lote         : ' + sLote + chr(13) +
   'Data         : ' + sData + chr(13) + chr(10) +
   'Mensagem: ' + sMsg;

   MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
end;





// =================================================================================================
//    Integração Financeira / Contábil
// =================================================================================================

// Retorna a máscara do Plano de Contas
function TOperComum.GetMascaraPlano(iPlano: integer): string;
var
   qryContab : TwwQuery;
begin
   qryContab := dtmOperComum.qryIntegraContab;

   with qryContab do begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('PLANO').AsInteger := iPlano;
      Open;
   end;

   if not(qryContab.isEmpty) then Result := trim(qryContab.FieldbyName('MASCARA').AsString);
   qryContab.Close;
end;





// Gera um nº de documento único
function TOperComum.GeraNoDocumento(c: char): extended;
var
   //ano, mes, dia, hora, min, seg, mseg: word;
   //s, sNoDoc, sAleatorio: string;
   sNoDoc : string;
begin
   Result := 0;
   while Result = 0 do
   begin
      with dtmOperComum.qryAuxiliar do begin
         sNoDoc := IntToStr(LeUltRegistro(nil,'DOCINVEST'));
         Close;
         SQL.Clear;
         SQL.Text := 'SELECT NODOCUMENTO FROM DOCUMENTO '+
                     'WHERE NODOCUMENTO = '+ sNoDoc +' '+
                     'AND COMPLDOCUMENTO = ''79''';
         ExecSQL;
         if not IsEmpty then
            Result := 0
         else
            Result := StrToInt(sNoDoc);
         Close;
      end;
   end;

end;

// -------------------------------------------------------------------------------------------------
// Abre a qryPadrLanc de acordo com os parâmetros passados
//--------------------------------------------------------------------------------------------------
procedure TOperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
iInvestimento, iCarteira: integer; sTipoTitulo, sTipoMov: string);
begin
   with  dtmOperComum.qryPadrLanc do begin
      // AL_18 - 03/02/2005
      LimpaParametros(dtmOperComum.qryPadrLanc);

      if not(Prepared) then Prepare;

      ParamByName('EMPRESAPROP').AsInteger   := iEmpresaProp;
      ParamByName('TIPOINVEST').AsInteger    := iTipoInvest;
      ParamByName('TIPOMOV').AsString        := sTipoMov;

      ParamByName('TIPOOPERACAO').AsInteger  := iTipoOperacao;
      if iTipoOperacao = 0 then                 ParamByName('TIPOOPERACAO').Clear;

      ParamByName('TIPOLANC').AsString       := 'N';
      if sTipoMov = 'ATU' then                  ParamByName('TIPOLANC').Clear;

      ParamByName('TIPODESPESA').AsInteger   := iTipoDespesa;
      if iTipoDespesa = 0 then                  ParamByName('TIPODESPESA').Clear;

      ParamByName('TIPOTITULO').AsString     := sTipoTitulo;
      if length(trim(sTipoTitulo)) = 0 then     ParamByName('TIPOTITULO').Clear;

      ParamByName('CARTEIRA').AsInteger      := iCarteira;
      if iCarteira = -1 then                    ParamByName('CARTEIRA').Clear;

      ParamByName('INVESTIMENTO').AsInteger  := iInvestimento;
      if iInvestimento = -1 then                ParamByName('INVESTIMENTO').Clear;

      Open;
   end;
end;





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
function TOperComum.BuscaPadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento,
iCarteira: integer; fValor: double; sTipoTitulo, sTipoMov: string; var iPlano, iSubContaDeb,
iSubContaCred, iUnidNegoc: integer; var sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper, sRecPagNao: string): integer;
begin
   // nenhum padrão encontrado, a princípio
    Result := 0;

   try

      // 1º Passo: TipoOperacao + Carteira + TipoTitulo + Investimento (caso mais detalhado)
      if ( (iCarteira > 0) and (sTipoTitulo <> '') and (iInvestimento > 0) ) then begin

         OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
         iInvestimento, iCarteira, sTipoTitulo, sTipoMov);

         // Erro: ambigüidade no Padrão de Lançamento
         if dtmOperComum.qryPadrLanc.RecordCount > 1 then Result := -4;
      end;

      // 2º Passo: TipoOperacao + TipoTitulo + Investimento
      if ( (Result = 0) and (sTipoTitulo <> '') and (iInvestimento > 0) ) then begin
         if ( not(dtmOperComum.qryPadrLanc.Active) or (dtmOperComum.qryPadrLanc.isEmpty) ) then begin

            OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
            iInvestimento, -1{iCarteira}, sTipoTitulo, sTipoMov);

            if dtmOperComum.qryPadrLanc.RecordCount > 1 then Result := -4; // Erro: ambigüidade no Padrão de Lançamento
         end;
      end;

      // 3º Passo: TipoOperacao + TipoTitulo + Carteira
      if ( (Result = 0) and (sTipoTitulo <> '') and (iCarteira > 0) ) then begin
         if ( not(dtmOperComum.qryPadrLanc.Active) or (dtmOperComum.qryPadrLanc.isEmpty) ) then begin

            OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
            -1{iInvestimento}, iCarteira, sTipoTitulo, sTipoMov);

            // Erro: ambigüidade no Padrão de Lançamento
            if dtmOperComum.qryPadrLanc.RecordCount > 1 then Result := -4;
         end;
      end;

      // 4º Passo: TipoOperacao + TipoTitulo
      if ( (Result = 0) and (sTipoTitulo <> '') ) then begin
         if ( not(dtmOperComum.qryPadrLanc.Active) or (dtmOperComum.qryPadrLanc.isEmpty) ) then begin

            OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
            -1{iInvestimento}, -1{iCarteira}, sTipoTitulo, sTipoMov);

            // Erro: ambigüidade no Padrão de Lançamento
            if dtmOperComum.qryPadrLanc.RecordCount > 1 then Result := -4;
         end;
      end;

      // 5º Passo: TipoOperacao + Carteira
      if ( (Result = 0) and (iCarteira > 0) ) then begin
         if ( not(dtmOperComum.qryPadrLanc.Active) or (dtmOperComum.qryPadrLanc.isEmpty) ) then begin

            OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
            -1{iInvestimento}, iCarteira, ''{sTipoTitulo}, sTipoMov);

            // Erro: ambigüidade no Padrão de Lançamento
            if dtmOperComum.qryPadrLanc.RecordCount > 1 then Result := -4;
         end;
      end;

      // AL_62 - Ini
      // 5/1/2º Passo: TipoOperacao + Carteira
      if ( (Result = 0) and (iInvestimento > 0) ) then begin
         if ( not(dtmOperComum.qryPadrLanc.Active) or (dtmOperComum.qryPadrLanc.isEmpty) ) then begin

            OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
            iInvestimento, -1{iCarteira}, ''{sTipoTitulo}, sTipoMov);

            // Erro: ambigüidade no Padrão de Lançamento
            if dtmOperComum.qryPadrLanc.RecordCount > 1 then Result := -4;
         end;
      end;
      // AL_62 - Ini

      // 6º Passo: só TipoOperacao
      if ( (Result = 0) ) then begin
         if ( not(dtmOperComum.qryPadrLanc.Active) or (dtmOperComum.qryPadrLanc.isEmpty) ) then begin

            OperComum.AbrePadrLanc(iEmpresaProp, iTipoInvest, iTipoOperacao, iTipoDespesa,
            -1{iInvestimento}, -1{iCarteira}, ''{sTipoTitulo}, sTipoMov);

            // Erro: ambigüidade no Padrão de Lançamento
            if dtmOperComum.qryPadrLanc.RecordCount > 1 then Result := -4;
         end;
      end;

      // Finalmentes: resultado da Busca
      if Result = 0 then begin
         // verifica se agora foi encontrado algum Padrão de Lançamento
         if ( (dtmOperComum.qryPadrLanc.Active) and not(dtmOperComum.qryPadrLanc.isEmpty) ) then begin

            iPlano         := dtmOperComum.qryPadrLancPLANO.AsInteger;
            sContaDeb      := dtmOperComum.qryPadrLancCONTADOPERFIN.AsString;
            sContaCred     := dtmOperComum.qryPadrLancCONTACOPERFIN.AsString;

            // AL_64 - 18/01/2006
            // AL_54 - 27/10/2005
            // Al_46 - 20/09/2005
            // se o valor da Operação for negativo, inverte as contas
            //AL_109
            If ((iTipoOperacao = - 63) or (iTipoOperacao = -67) or
                ((CtrlPInv.IdTipoOperDirPer = iTipoOperacao) or
                 (CtrlPInv.IdTipoOperDirPer+10000 = iTipoOperacao)) or
                ((CtrlPInv.IdTipoOperDirDSA = iTipoOperacao) or
                 (CtrlPInv.IdTipoOperDirDSA+10000 = iTipoOperacao))) Then //Transf. de Carteira//Permuta//Subscrição em Ações
            begin
               //AL_85 - Ini
               sContaDeb      := OperComum.IIF(fValor >= 0, dtmOperComum.qryPadrLancCONTADOPERFIN.AsString,
                                                            dtmOperComum.qryPadrLancCONTACOPERFIN.AsString);
               sContaCred     := OperComum.IIF(fValor >= 0, dtmOperComum.qryPadrLancCONTACOPERFIN.AsString,
                                                            dtmOperComum.qryPadrLancCONTADOPERFIN.AsString);
               //AL_85 - Fim
            end;
            // Centro de Custo
            //AL_85 - Centro de Custo Único para contabil e financeiro
            sCentroCustoCred := OperComum.IIF(dtmOperComum.qryPadrLancCENCUSTCINVEST.IsNull, '', dtmOperComum.qryPadrLancCENCUSTCINVEST.AsString);
            sCentroCustoDeb   := sCentroCustoCred;

            // Sub-Conta
            iSubContaDeb  := OperComum.IIF(dtmOperComum.qryPadrLancCODSUBCONTAD.IsNull, -1, dtmOperComum.qryPadrLancCODSUBCONTAD.AsInteger);
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

         end else begin
            // Erro: nenhum Padrão de Lançamento que atenda os parâmetros passados
            Result := -5;
         end;
      end;
   finally
      dtmOperComum.qryPadrLanc.Close;
   end;
end;

// Função que retorna o Saldo das contas contábeis de variação Positiva e Negativa para contabilização
//function TOperComum.BuscaTipoOperVarRV(var RecBuscaTipoOperVarRV : TRecBuscaTipoOperVarRV):Integer;
procedure TOperComum.BuscaTipoOperVarRV;
var
wSldVarPositiva,wSldVarNegativa,wVlrOperacao : double;
begin
   wVlrOperacao := RecBuscaTipoOperVarRV.VLROPERACAO;

   dtmOperComum.QrySaldoVariacao.Close;

   dtmOperComum.QrySaldoVariacao.ParamByName('IDPLANOPREV').Clear;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPATRO').Clear;
   dtmOperComum.QrySaldoVariacao.ParamByName('EXERCICIO').AsInteger    := RecBuscaTipoOperVarRV.EXERCICIO;
   dtmOperComum.QrySaldoVariacao.ParamByName('DATAINI').AsString       := RecBuscaTipoOperVarRV.DATAINI;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPESSOA').AsInteger     := RecBuscaTipoOperVarRV.IDPESSOA;
   dtmOperComum.QrySaldoVariacao.ParamByName('CONTAINI').AsString      := RecBuscaTipoOperVarRV.CONTAINIPOS;//Espaco(RecBuscaTipoOperVarRV.CONTAINIPOS,18);
   dtmOperComum.QrySaldoVariacao.ParamByName('CONTAFIM').AsString      := RecBuscaTipoOperVarRV.CONTAFIMPOS;
   dtmOperComum.QrySaldoVariacao.Open;
   wSldVarPositiva := ABS(dtmOperComum.QrySaldoVariacao.FieldByName('SALDO').AsFloat);

   dtmOperComum.QrySaldoVariacao.Close;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPLANOPREV').Clear;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPATRO').Clear;
   dtmOperComum.QrySaldoVariacao.ParamByName('EXERCICIO').AsInteger    := RecBuscaTipoOperVarRV.EXERCICIO;
   dtmOperComum.QrySaldoVariacao.ParamByName('DATAINI').AsString       := RecBuscaTipoOperVarRV.DATAINI;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPESSOA').AsInteger     := RecBuscaTipoOperVarRV.IDPESSOA;
   dtmOperComum.QrySaldoVariacao.ParamByName('CONTAINI').AsString      := RecBuscaTipoOperVarRV.CONTAININEG;
   dtmOperComum.QrySaldoVariacao.ParamByName('CONTAFIM').AsString      := RecBuscaTipoOperVarRV.CONTAFIMNEG;
   dtmOperComum.QrySaldoVariacao.Open;
   wSldVarNegativa := ABS(dtmOperComum.QrySaldoVariacao.FieldByName('SALDO').AsFloat);

   if (wSldVarPositiva > 0) and (wSldVarNegativa > 0) then // Ocorreu erro
   begin
      RecBuscaTipoOperVarRV.RESULT := -1; // Erro
   end
   else
   begin
      RecBuscaTipoOperVarRV.RESULT := 0;
      // TipoOperacao : -1   : Atualização RV - Var. Positiva
      //                -9   : Atualização RV - Var. Negativa
      //                -14  : Atualização RV - Var. Positiva (Bx. Var. Negativa)
      //                -15  : Atualização RV - Var. Negativa (Bx. Var. Positiva)

      if RecBuscaTipoOperVarRV.TIPOOPERACAO = -1 then  // Vlr de Variação Positiva
      begin
         // Saldo na conta de Variação Positiva //ou Configurados para mesma conta de variação POS e NEG (Empréstimo)
         if (wSldVarPositiva > 0) then
         begin
            RecBuscaTipoOperVarRV.VLROPERACAO   := wVlrOperacao;
            RecBuscaTipoOperVarRV.VLRSALDO      := 0;
            RecBuscaTipoOperVarRV.TIPOOPERSALDO := 0;
         end
         else if wSldVarNegativa > 0 then // Saldo na conta de Variação Negativa
         begin
            // Baixo a Variação Positiva no valor da operacao
            if wSldVarNegativa >= wVlrOperacao then
            begin
               RecBuscaTipoOperVarRV.VLROPERACAO   := wVlrOperacao;
               RecBuscaTipoOperVarRV.VLRSALDO      := 0;
               RecBuscaTipoOperVarRV.TIPOOPERSALDO := 0;
               RecBuscaTipoOperVarRV.TIPOOPERACAO := -14;
            end
            // Baixo a Variacao Positiva no valor do Saldo  e armazeno a diferença para contabilizar na var.negativa
            else if wSldVarNegativa < wVlrOperacao then
            begin
               RecBuscaTipoOperVarRV.VLROPERACAO   := wSldVarNegativa;
               RecBuscaTipoOperVarRV.VLRSALDO      := ABS(wSldVarNegativa - wVlrOperacao);
               RecBuscaTipoOperVarRV.TIPOOPERSALDO := -1;
               RecBuscaTipoOperVarRV.TIPOOPERACAO := -14;
            end;
         end;
      end
      else if RecBuscaTipoOperVarRV.TIPOOPERACAO = -9 then // Vlr de Variação Negativa
      begin
         // Saldo na conta de Variação Negativa //ou Configurados para mesma conta de variação POS e NEG (Empréstimo)
         if (wSldVarNegativa > 0) then
         begin
            RecBuscaTipoOperVarRV.VLROPERACAO   := wVlrOperacao;
            RecBuscaTipoOperVarRV.VLRSALDO      := 0;
            RecBuscaTipoOperVarRV.TIPOOPERSALDO := 0;
            RecBuscaTipoOperVarRV.TIPOOPERACAO := -9;
         end
         else if wSldVarPositiva > 0 then // Saldo na conta de Variação Positiva
         begin
            // Baixo a Variação Positiva no valor da operacao
            if wSldVarPositiva >= wVlrOperacao then
            begin
               RecBuscaTipoOperVarRV.VLROPERACAO   := wVlrOperacao;
               RecBuscaTipoOperVarRV.VLRSALDO      := 0;
               RecBuscaTipoOperVarRV.TIPOOPERSALDO := 0;
               RecBuscaTipoOperVarRV.TIPOOPERACAO := -15;
            end
            // Baixo a Variacao Positiva no valor do Saldo  e armazeno a diferença para contabilizar na var.negativa
            else if wSldVarPositiva < wVlrOperacao then
            begin
               RecBuscaTipoOperVarRV.VLROPERACAO   := wSldVarPositiva;
               RecBuscaTipoOperVarRV.VLRSALDO      := ABS(wSldVarPositiva - wVlrOperacao);
               RecBuscaTipoOperVarRV.TIPOOPERSALDO := -9;
               RecBuscaTipoOperVarRV.TIPOOPERACAO := -15;
            end;
         end;
      end;

      dtmOperComum.QrySaldoVariacao.Close;
   end;
end;

// Função que retorna o Saldo de uma Conta Contábil em um determinado dia
function TOperComum.BuscaSaldoContabil(iPlano,iPlanoPrev,iPatro,iPerExercicio,iPerNumero,iPessoa:integer;
                                       dPlnDatDia:TDateTime;sPlaConta:string ):Double;
begin
   Result := 0;

   dtmOperComum.QrySaldoVariacao.Close;
   dtmOperComum.QrySaldoVariacao.ParamByName('PLANO').AsInteger        := iPlano;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPLANOPREV').AsInteger  := iPlanoPrev;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPATRO').AsInteger      := iPatro;
   dtmOperComum.QrySaldoVariacao.ParamByName('PEREXERCICIO').AsInteger := iPerExercicio;
   dtmOperComum.QrySaldoVariacao.ParamByName('PERNUMERO').AsInteger    := iPerNumero;
   dtmOperComum.QrySaldoVariacao.ParamByName('PLNDATDIA').AsDateTime   := dPlnDatDia;
   dtmOperComum.QrySaldoVariacao.ParamByName('IDPESSOA').AsInteger     := iPessoa;
   dtmOperComum.QrySaldoVariacao.ParamByName('PLACONTA').AsString      := Espaco(sPlaConta,18);
   dtmOperComum.QrySaldoVariacao.Open;
   Result := dtmOperComum.QrySaldoVariacao.FieldByName('SALDO').AsFloat;
end;

// Função que efetua o par de lançamentos Contábeis e o lançamento de CAPCAR (se aplicáveis)
// associados a uma Operação de Investimento de Renda Fixa e Raviável (de acordo com a tabela
// PadrLancContInv), já contabilizando inclusive as despesas da Operação.
function TOperComum.LancaOperRFRV(iEmpresaProp, iModuloOrigem, iTipoInvest, iInvestimento,iTipoOperacao, iOperacao,
                                  iForCli, iCarteira, iMoeda: integer; sTipoTitulo, sLote, sHistContab,sHistCapCar,
                                  sRecPagBol: string;var sTipoRecDesBol: string; var bCriaLancto: boolean;
                                  fTotalLiquido, fVlrOper: currency; dDataOper, dDataVenc: TDateTime;
                                  var iPlano, iPlanilhaOper, iDocumentoOper : integer; var sMensErro: string;
                                  sIntegraCapCar : String = '';
                                  bGravaDoc : Boolean = True; bLancaFin : Boolean = True;
                                  iCodTipDoc : Integer = 0;
                                  bDireitoOrig : Boolean = True;
                                  iPlanPrevPatr: Integer = -1): shortint;
var
   iFlgContaInvest, iTipoDespesa, iNumFatura, iPlanoDs, iPlanoPrev, iPatro : integer;
   iSubContaDebOp, iSubContaCredOp, iUnidNegocOp, iTipoDocOp : integer;
   iSubContaDebDs, iSubContaCredDs, iUnidNegocDs, iTipoDocDs : integer;
   sContaCredOp, sContaDebOp, sCentroCustoCredOp, sCentroCustoDebOp, sCentroResponOp,
   sRecPagNaoOp, sTipoPerOp, sRecPagOp, sTipoRecDesOp, sComplementoOp, sTipoParcelaOp,
   sHistoricoOp,
   sContaCredDs, sContaDebDs, sCentroCustoCredDs, sCentroCustoDebDs, sCentroResponDs,
   sRecPagNaoDs, sTipoPerDs, sRecPagDs, sTipoRecDesDs, sComplementoDs, sTipoParcelaDs,
   //AL_83
   sHistoricoDs, sContaDoc, sPlanPrevHist: string;
   //Al   _10
   sContaTemp: string;

   bTransacao, bContabOper, bLancaCAPCAROper, bContabDesp, bLancaCAPCARDesp, bAchouOperacao,
   bAchouDespesa, bMostraMsg, bVenda : boolean;
   iPortador, iAchouPadrao, iIdHistCartInv, iIdHistCartInvLucro : integer;
   sPlano, sOperacao, sStatus, sDebCre, sContaAux, sContabiliza, sSQL : string;

   qryDespOper : TwwQuery;
   fVlrOperAbs, fVlrDesp, fVlrDespAbs, fVlrLiquido, fVlrLancto : double;
   fNoDocumento: extended;
   iAno,iMes, iDia : word;
   //AL_10
   fVlrRecPag : Double;
   //AL_100
   iTipoOperCPVD : Integer;
begin
    Result := 0;

   //AL_91 - Não executa nada, para melhorar a performance
   if not CtrlInvContab.IntegraCtbFinModulo then
      Exit;

   If Copy(sTipoRecDesBol,1,1) = 'N' Then
   begin
      sContabiliza   := Copy(sTipoRecDesBol,1,1);
      sTipoRecDesBol := '';
   End
   Else
      sContabiliza := '';

   Screen.Cursor  := crHourGlass;
   bTransacao     := False;
   bMostraMsg     := True;
   iNumFatura     := 0;
   sOperacao      := '2';
   sStatus        := '';
   sComplementoOp := '79';
   sComplementoDs := '';
   fVlrLiquido    := 0;
   iPlanoDs       := -1;

   If iDocumentoOper  = 0 Then
      iDocumentoOper := -1;

   If iPlano  = 0 Then
      iPlano := -1;

   If iPlanilhaOper  = 0 Then
      iPlanilhaOper := -1;

   try // Finally
      //AL_85
      try  //Except (Re-Raised)
         iIdHistCartInv      := 0;
         iIdHistCartInvLucro := 0;
         // Busca registro de HistCartInv correspondente à Movimentação
         With dtmOperComum.QryLocal Do
         begin
           Close;
           Sql.Clear;
           Sql.Add('SELECT IDHISTCARTINV            ');
           Sql.Add('FROM HISTCARTINV                ');
           Sql.Add('WHERE (TIPMOVCARTINV    = ''OPE'') AND ');
           Sql.Add('      (IDOPERACAOINVEST = '+ QuotedStr(IntToStr(iOperacao))+')');
           Open;
           iIdHistCartInv := FieldByName('IDHISTCARTINV').AsInteger;
           Close;
         end;
         if iTipoOperacao > 0 then
         begin
            With dtmOperComum.QryLocal Do
            begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT IDHISTCARTINV            ');
              Sql.Add('FROM HISTCARTINV                ');
              Sql.Add('WHERE (TIPMOVCARTINV    = ''LUC'') AND ');
              Sql.Add('      (IDOPERACAOINVEST = '+QuotedStr(IntToStr(iOperacao))+')');
              Open;
              iIdHistCartInvLucro := FieldByName('IDHISTCARTINV').AsInteger;
              Close;
            end;
         end
         // AL_21 - 21/02/2005
         else if (iTipoOperacao = -34) or (iTipoOperacao = -35) or (iTipoOperacao = -118) then
         begin
            With dtmOperComum.QryLocal Do
            begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT IDHISTCARTINV            ');
              Sql.Add('FROM HISTCARTINV                ');
              Sql.Add('WHERE (TIPMOVCARTINV    = ''OPE'') AND ');
              Sql.Add('      (IDOPERACAOINVEST = '+ QuotedStr(IntToStr(iOperacao))+')');
              Open;
              iIdHistCartInv := FieldByName('IDHISTCARTINV').AsInteger;
              Close;
            end;
            With dtmOperComum.QryLocal Do
            begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT IDHISTCARTINV            ');
              Sql.Add('FROM HISTCARTINV                ');
              Sql.Add('WHERE (TIPMOVCARTINV    = ''LUC'') AND ');
              Sql.Add('      (IDOPERACAOINVEST = '+QuotedStr(IntToStr(iOperacao))+')');
              Open;
              iIdHistCartInvLucro := FieldByName('IDHISTCARTINV').AsInteger;
              Close;
            end;
         end
         else // Operações Internas
         begin
            case iTipoOperacao of
               -1, -2, -9:  // Atualização de Renda Fixa e Variável
               begin
                  sSQL :=
                     'SELECT MAX(IDHISTCARTINV) AS IDHISTCARTINV '+
                     'FROM HISTCARTINV '+
                     'WHERE (IDCARTEIRAINVEST = '+QuotedStr(IntToStr(iCarteira))+') AND '+
                     '      (IDINVESTIMENTO   = '+QuotedStr(IntToStr(iInvestimento))+') AND ';

                  if Slote <> '' then
                     sSQL := sSQL + '      (IDLOTE           = '+QuotedStr(sLote)+') AND '
                  else
                     sSQL := sSQL + '      (IDLOTE IS NULL) AND ';

                  sSQL := sSQL +
                   '      (TIPMOVCARTINV    = ''ATU'') AND '+
                   '      (DATAMOVCARTINV   = TO_DATE('+QuotedStr(DateToStr(dDataOper))+',''DD/MM/YYYY'')) ';
                   With dtmOperComum.QryLocal Do
                   begin
                       Close;
                       Sql.Clear;
                       Sql.Text := sSQL;
                       Open;
                       iIdHistCartInv := FieldByName('IDHISTCARTINV').AsInteger;
                       bVenda := false;
                       Close;
                   end;
               end;
               //Al_104
               -6, -10006:  // Baixa por Transferência de Renda Variável
               begin
                   With dtmOperComum.QryLocal Do
                   begin
                       Close;
                       Sql.Clear;
                       Sql.Add('SELECT IDHISTCARTINV ');
                       Sql.Add('FROM HISTCARTINV     ');
                       Sql.Add('WHERE (TIPMOVCARTINV    = ''TRF'') AND ');
                       Sql.Add('      (NATURMOVCARTINV  = ''D'')   AND ');
                       Sql.Add('      (IDOPERACAOINVEST = '+QuotedStr(IntToStr(iOperacao))+')');
                       Open;
                       iIdHistCartInv := FieldByName('IDHISTCARTINV').AsInteger;
                       bVenda := false;
                       Close;
                   end;
               end;
               //Al_104
               -4, -10004:  // Acréscimo por Transferência de Renda Variável
               begin
                   With dtmOperComum.QryLocal Do
                   begin
                       Close;
                       Sql.Clear;
                       Sql.Add('SELECT IDHISTCARTINV ');
                       Sql.Add('FROM HISTCARTINV     ');
                       Sql.Add('WHERE (TIPMOVCARTINV    = ''TRF'') AND ');
                       Sql.Add('      (NATURMOVCARTINV  = ''A'')   AND ');
                       Sql.Add('      (IDOPERACAOINVEST = '+QuotedStr(IntToStr(iOperacao))+')');
                       Open;
                       iIdHistCartInv := FieldByName('IDHISTCARTINV').AsInteger;
                       bVenda := false;
                       Close;
                   end;
               end;
               -17,-18,-19:  // Incorporacao de Juros,Pagamento de Juros e Amort.Principal
               begin
                  sSQL :=
                     'SELECT MAX(IDHISTCARTINV) AS IDHISTCARTINV '+
                     'FROM HISTCARTINV '+
                     'WHERE (IDCARTEIRAINVEST = '+QuotedStr(IntToStr(iCarteira))+') AND '+
                     '      (IDINVESTIMENTO   = '+QuotedStr(IntToStr(iInvestimento))+') AND ';
                  if Slote <> '' then
                     sSQL := sSQL + '      (IDLOTE           = '+QuotedStr(sLote)+') AND '
                  else
                     sSQL := sSQL + '      (IDLOTE IS NULL) AND ';
                  sSQL := sSQL +
                   '      (TIPMOVCARTINV    = ''OPE'') AND '+
                   '      (IDTIPOOPERACAO   = '+IntToStr(iTipoOperacao)+') AND '+
                   '      (DATAMOVCARTINV   = TO_DATE('+QuotedStr(DateToStr(dDataOper))+',''DD/MM/YYYY'')) ';
                   With dtmOperComum.QryLocal Do
                   begin
                       Close;
                       Sql.Clear;
                       Sql.Text := sSQL;
                       Open;
                       iIdHistCartInv := FieldByName('IDHISTCARTINV').AsInteger;
                       bVenda := false;
                       Close;
                   end;
               end;
               //Al_104
               -63,-67,-10063,-10067:  // Acréscimo por Transferência de Carteira de Renda Variável
               begin
                  // AL_65 - Novo reprocessamento linear e nova TRC
                  dtmOperComum.QryLocal.Close;
                  dtmOperComum.QryLocal.Sql.Clear;
                  dtmOperComum.QryLocal.SQL.Add('SELECT IDHISTCARTINVDEST ');
                  dtmOperComum.QryLocal.SQL.Add('FROM OPERCUSTODIA ');
                  dtmOperComum.QryLocal.SQL.Add('WHERE IDOPERCUSTODIA = ' + IntToStr(iOperacao));
                  dtmOperComum.QryLocal.SQL.Add('  AND IDCARTEIRADEST = ' + IntToStr(iCarteira));
                  dtmOperComum.QryLocal.SQL.Add('  AND IDINVESTIMENTO = ' + IntToStr(iInvestimento));
                  dtmOperComum.QryLocal.SQL.Add('  AND IDTIPOOPERDEST = ' + IntToStr(iTipoOperacao));
                  dtmOperComum.QryLocal.SQL.Add('  AND DATAMOVCUSTOD =  TO_DATE('+QuotedStr(DateToStr(dDataOper))+',''DD/MM/YYYY'')');
                  dtmOperComum.QryLocal.Open;
                  if dtmOperComum.QryLocal.IsEmpty then
                  begin
                     dtmOperComum.QryLocal.Close;
                     dtmOperComum.QryLocal.Sql.Clear;
                     dtmOperComum.QryLocal.SQL.Add('SELECT MAX(IDHISTCARTINV) AS IDHISTCARTINV ');
                     dtmOperComum.QryLocal.SQL.Add('FROM HISTCARTINV ');
                     dtmOperComum.QryLocal.SQL.Add('WHERE IDTIPOINVEST = 2 ');
                     dtmOperComum.QryLocal.SQL.Add('  AND IDCARTEIRAINVEST = '+IntToStr(iCarteira));
                     dtmOperComum.QryLocal.SQL.Add('  AND IDCARTEIRAGERENC IS NULL ');
                     dtmOperComum.QryLocal.SQL.Add('  AND IDINVESTIMENTO = ' + IntToStr(iInvestimento));
                     dtmOperComum.QryLocal.SQL.Add('  AND IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao));
                     dtmOperComum.QryLocal.SQL.Add('  AND DATAMOVCARTINV =  TO_DATE('+QuotedStr(DateToStr(dDataOper))+',''DD/MM/YYYY'')');
                     dtmOperComum.QryLocal.SQL.Add('  AND TIPMOVCARTINV  = ' + QuotedStr('TRC'));
                     dtmOperComum.QryLocal.Open;
                     iIdHistCartInv := dtmOperComum.QryLocal.FieldByName('IDHISTCARTINV').AsInteger;
                  end
                  else
                     iIdHistCartInv := dtmOperComum.QryLocal.FieldByName('IDHISTCARTINVDEST').AsInteger;

                  dtmOperComum.QryLocal.Close;
                  dtmOperComum.QryLocal.Sql.Clear;
                  bVenda := false;
               end;
               //AL_82
               -158,-159,-10158,-10159:  // Transferência de Plano de Renda Variável
               begin
                  With dtmOperComum.QryLocal Do
                  begin
                    Close;
                    Sql.Clear;
                    Sql.Add('SELECT IDHISTCARTINV            ');
                    Sql.Add('FROM HISTCARTINV                ');
                    Sql.Add('WHERE (TIPMOVCARTINV    = ''TRP'') AND ');
                    Sql.Add('      (IDOPERACAOINVEST = '+ QuotedStr(IntToStr(iOperacao))+')');
                    Open;
                    iIdHistCartInv := FieldByName('IDHISTCARTINV').AsInteger;
                    Close;
                  end;
               end;
            end;
         end;

         //AL_86
         with dtmOperComum.qryInvestimento do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('INVESTIMENTO').AsInteger    := iInvestimento;
            Open;
         end;

         with dtmOperComum.qryCarteira do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('CARTEIRA').AsInteger    := iCarteira;
            Open;
            iPlanoPrev := iPlanoPrevContab;
            iPatro     := iPatrocinadora;
         end;

         //AL_83 - Busca o PlanoPrev e o Patro
         With dtmOperComum.qryLocal Do
         begin
            if iPlanPrevPatr = -1 then
               iPlanPrevPatr := iPlanPrevCtbPatro;
            Close;
            Sql.Clear;
            Sql.Add('SELECT PLANPRVCONTABPATRO AS NOME, IDPATRO, IDPLANOPREV ');
            Sql.Add('FROM VWPLANPREVCTBPATR ');
            Sql.Add('WHERE IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevPatr));
            Open;
            iPlanoPrev := FieldByName('IDPLANOPREV').AsInteger;
            iPatro     := FieldByName('IDPATRO').AsInteger;
            sPlanPrevHist := FieldByName('NOME').AsString;
         end;

         // Verifica o padrão para Contabilização da Var.Positiva/Negativa com compensação
         //AL_109
         if (CtrlPInv.FlgCompVarRV = 'S') and ((iTipoOperacao = -1) or (iTipoOperacao = -9)) then // Faz compensaçao entre contas de Var. Positiva e Negativa de RV
         begin
            if (RecBuscaTipoOperVarRV.VLRSALDO = 0) then // Primeira Passagem
            begin
               RecBuscaTipoOperVarRV.IDPLANOPREV      := iPlanoPrev;
               RecBuscaTipoOperVarRV.IDPATRO          := iPatro;
               DecodeDate(dDataOper, iAno, iMes,iDia);
               RecBuscaTipoOperVarRV.EXERCICIO        := iAno;
               RecBuscaTipoOperVarRV.DATAINI          := DateToStr(dDataOper);
               RecBuscaTipoOperVarRV.DATAFIM          := DateToStr(dDataOper);
               RecBuscaTipoOperVarRV.IDPESSOA         := iEmpresaProp;
               RecBuscaTipoOperVarRV.TIPOOPERACAO     := iTipoOperacao;
               RecBuscaTipoOperVarRV.VLROPERACAO      := ABS(fVlrOper);

               fVlrOper := ABS(fVlrOper);

               //AL_86 - Ini
               // Variação Positiva
               // AL_107
               iAchouPadrao := CtrlInvContab.BuscaPadrLanc.Executa(iTipoInvest, -1, 0, iInvestimento, iCarteira,
                                                                   iPlanPrevPatr,
                                                                   fVlrOper, sTipoTitulo, 'OPE');
               RecBuscaTipoOperVarRV.CONTAINIPOS     := CtrlInvContab.BuscaPadrLanc.ContaCre;
               RecBuscaTipoOperVarRV.CONTAFIMPOS     := CtrlInvContab.BuscaPadrLanc.ContaCre;

               // Variação Negativa
               // AL_107
               iAchouPadrao := CtrlInvContab.BuscaPadrLanc.Executa(iTipoInvest, -9, 0, iInvestimento, iCarteira,
                                                                   iPlanPrevPatr,
                                                                   fVlrOper, sTipoTitulo, 'OPE');

               RecBuscaTipoOperVarRV.CONTAININEG     := CtrlInvContab.BuscaPadrLanc.ContaDeb;
               RecBuscaTipoOperVarRV.CONTAFIMNEG     := CtrlInvContab.BuscaPadrLanc.ContaDeb;
               //AL_86 - Fim

               BuscaTipoOperVarRV;

               iTipoOperacao := RecBuscaTipoOperVarRV.TIPOOPERACAO;

               //AL_107
               if RecBuscaTipoOperVarRV.Result = -1 then // Erro
               begin
                  Result := -1;
                  Raise Exception.Create('Existe saldo na conta de Variação Positiva e Negativa');
               end;
               fVlrOper := RecBuscaTipoOperVarRV.VLROPERACAO;
            end
            else  // Segunda Passagem se houver saldo de variaçào a compensar.
            begin
               iTipoOperacao := RecBuscaTipoOperVarRV.TIPOOPERSALDO;
               fVlrOper      := RecBuscaTipoOperVarRV.VLRSALDO;
            end;
         end;
//-------------------------------------------------------------------------------------------------------------

         // Verifica o Padrão de Lançamento mais adequado
         //AL_86 - Ini
         //AL_107
         iAchouPadrao := CtrlInvContab.BuscaPadrLanc.Executa(iTipoInvest, iTipoOperacao, 0, iInvestimento, iCarteira,
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
         sTipoPerOp := CtrlInvContab.BuscaPadrLanc. TipoPer;
         sHistoricoOp := CtrlInvContab.BuscaPadrLanc.Historico;
         sRecPagNaoOp := CtrlInvContab.BuscaPadrLanc.RecPagNao;
         //AL_86 - Fim

         bAchouOperacao := (iAchouPadrao = 0);
         //Al_10
         if (bAchouOperacao) and (iTipoOperacao = -109) then // Acerto Rec/Pag RV
         begin
            if fVlrOper < 0 then // Boleta a Pagar, zera a conta de à Receber
            begin
               sContaTemp   := sContaDebOp;
               sContaDebOp  := sContaCredOp;
               sContaCredOp := sContaTemp;
            end;
         end;
         // Busca a SubConta
         if iTipoInvest = 8 then // BM&F
         begin
            with dtmOperComum.qryBuscaSubConta do
            begin
               Close;
               ParamByName('IdCorretValores').AsInteger   := iForCli;
               Open;
               iSubContaDebOp  := FieldByName('SUBCONTAD').AsInteger;
               iSubContaCredOp := FieldByName('SUBCONTAC').AsInteger;
            end;
         end;
         // Verificação dos parâmetros do Tipo de Operação -----------------------------------------------
         with dtmOperComum.qryTipoOperacao do
         begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('TIPOINVEST').AsInteger    := iTipoInvest;
            ParamByName('TIPOOERACAO').AsInteger   := iTipoOperacao;
            Open;
            iFlgContaInvest := FieldByName('FLGCONTAINVEST').AsInteger;
            iTipoDocOp      := FieldByName('CODTIPDOC').AsInteger;

            //AL_100
            if not FieldByName('IDTIPOOPERCPVD').IsNull then
            begin
               iTipoOperCPVD := FieldByName('IDTIPOOPERCPVD').AsInteger;
               With dtmOperComum.qryLocal Do
               begin
                  Close;
                  Sql.Clear;
                  Sql.Add('SELECT CONTACOPERFIN, CONTADOPERFIN FROM PADRLANCCONTINV WHERE IDTIPOOPERACAO = ' + IntToStr(iTipoOperCPVD) + '');
                  Open;
                  if not dtmOperComum.qryLocal.IsEmpty then
                      sContaDoc := OperComum.IIF(sRecPagBol[1] = 'P', dtmOperComum.qryLocal.FieldByName('CONTADOPERFIN').AsString,
                                                                      dtmOperComum.qryLocal.FieldByName('CONTACOPERFIN').AsString);
               end;
            end
            else
               iTipoOperCPVD := -1;

            //AL_91 - Ini - Ajuste nos testes
            // Integra Contabil
            if (sContabiliza = 'N') then
               bContabOper  := False
            else
               bContabOper  := FieldByName('FLGGERACONTAB').AsInteger = 1;
            //Integra Cap/Car
            if (sIntegraCapCar = 'N') then
               bLancaCAPCAROper := False
            else
            bLancaCAPCAROper := FieldByName('FLGGERACAPCAR').AsInteger = 1;
            //AL_91 - Fim
            sRecPagOp        := FieldByName('RECPAG').AsString;
            bVenda           := (FieldByName('NATUREZAOPERACAO').AsString = 'D');
         end;

         // Início do processamento ----------------------------------------------------------------------
         //AL_54 - 27/10/2005
         //AL_46 - 20/09/2005
         //AL_8  - 25/10/2004
         if (fVlrOper <> 0) Or
            //AL_84 - Provisão de Perda - Precisa contabilizar a provisão inicial, independente de haver variação
            // Inverte os sinais dos Tipos de Operacao para poder comparar com o array []
            //AL_109
            ((fVlrOper  = 0) and ((iTipoOperacao*-1) in [9,1])) or
            ((fVlrOper  = 0) And
             (iTipoOperacao  In [CtrlPInv.IdTipoOperDirDiv, CtrlPInv.IdTipoOperDirPer,
                                 CtrlPInv.IdTipoOperDirDSA, CtrlPInv.IdTipoOperDirJur,
                                 CtrlPInv.IdTipoOperDirMul,
                                 //AL_80
                                 CtrlPInv.IdTipoOperDirInc]) or
            ((ABS(iTipoOperacao)-10000)  In [ABS(CtrlPInv.IdTipoOperDirDiv), ABS(CtrlPInv.IdTipoOperDirPer),
                                             ABS(CtrlPInv.IdTipoOperDirDSA), ABS(CtrlPInv.IdTipoOperDirJur),
                                             ABS(CtrlPInv.IdTipoOperDirMul),
                                             //AL_80
                                             ABS(CtrlPInv.IdTipoOperDirInc)])) then
         begin
            // verifica se já existe transação em andamento; se não houver, inicia uma
            if not(dtmBaseDados.dbBaseDados.InTransaction) then
            begin
               bTransacao := True;
               StartTransacao;
            end;

            // Modula o valor da operação
            fVlrOperAbs := abs(fVlrOper);

            // Chamada às funções de integração Contábil e Financeira ---------------------------------------
            if ( (bContabOper) and (bAchouOperacao) ) then
            begin
               if iPlanilhaOper  = -1 then
                  iPlanilhaOper := 0;

               sHistoricoOp := trim(sHistoricoOp) + ' / ' +
                               trim(dtmOperComum.QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString);

               if iTipoInvest = 1 then  // pega Lote da aplicação
                  sHistoricoOp := trim(sHistoricoOp) + '  ' + trim(sLote)
               else if iTipoInvest = 8 then
                  sHistoricoOp := trim(sHistoricoOp) + '  ' + trim(sHistContab)
               else                     // pega Lote da operação
                  sHistoricoOp := trim(sHistoricoOp) + '  ' + trim(sHistCapCar);

               // Baixa da Operação de Anuncio de Proventos (Contabiliza a diferença caso exista)
               //AL_8 - 25/10/2004
               //AL_109
               if (iTipoOperacao  In [CtrlPInv.IdTipoOperDirDiv,
                                      CtrlPInv.IdTipoOperDirJur, CtrlPInv.IdTipoOperDirMul]) or
                  ((ABS(iTipoOperacao)-10000)  In [ABS(CtrlPInv.IdTipoOperDirDiv),
                                  ABS(CtrlPInv.IdTipoOperDirJur), ABS(CtrlPInv.IdTipoOperDirMul)]) then
               begin
                  //if fTotalLiquido <> 0 then
                  if fVlrOper <> 0 Then
                  begin
                     fVlrOperAbs := abs(fVlrOper);
                     //AL_83
                     if not(LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaDebOp, iSubContaCredOp,
                                               iUnidNegocOp, iForCli, iPlanoPrev, iPatro,
                                               sContaDebOp, sContaCredOp, sCentroCustoDebOp, sCentroCustoCredOp,
                                               sHistoricoOp+' - '+TRIM(sPlanPrevHist), sTipoPerOp, sRecPagOp,
                                               dDataOper, fVlrOperAbs, bMostraMsg, iPlanilhaOper, sMensErro) ) then
                     begin
                        Result := -6; // não foi possível efetuar o lançamento contábil
                        //AL_107
                        Raise Exception.Create(sMensErro);
                     end;
                  end;
                  fVlrOper    := fTotalLiquido;
                  fVlrOperAbs := abs(fVlrOper);
               end
               else
               begin
                  //Recebimento de Anúncio, o valor(fVlrOper) e tratado dentro do contábil
                  //AL_8 - 25/10/2004
                  if (iTipoOperacao = -70) Or ((10000-ABS(iTipoOperacao)) = -70) Then
                  begin
                     //AL_83
                     if not(LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaDebOp, iSubContaCredOp,
                                               iUnidNegocOp, iForCli, iPlanoPrev, iPatro,
                                               sContaDebOp, sContaCredOp, sCentroCustoDebOp, sCentroCustoCredOp,
                                               sHistoricoOp+' - '+TRIM(sPlanPrevHist), sTipoPerOp, sRecPagOp,
                                               dDataOper, fVlrOper, bMostraMsg, iPlanilhaOper, sMensErro) ) then
                     begin
                        Result := -6; // não foi possível efetuar o lançamento contábil
                        //AL_107
                        Raise Exception.Create(sMensErro);
                     end;
                  end
                  //AL_84
                  else if fVlrOperAbs > 0 then
                  begin
                     //AL_83
                     if not(LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaDebOp, iSubContaCredOp,
                                               iUnidNegocOp, iForCli, iPlanoPrev, iPatro,
                                               sContaDebOp, sContaCredOp, sCentroCustoDebOp, sCentroCustoCredOp,
                                               sHistoricoOp+' - '+TRIM(sPlanPrevHist), sTipoPerOp, sRecPagOp,
                                               dDataOper, fVlrOperAbs, bMostraMsg, iPlanilhaOper, sMensErro) ) then
                     begin
                        Result := -6; // não foi possível efetuar o lançamento contábil
                        //AL_107
                        Raise Exception.Create(sMensErro);
                     end;
                  end;
               end;
            end
            Else if ( (bContabOper) and (Not bAchouOperacao) ) then
            begin
               // AL_62 - Ini
               //AL_107 - Ini
               if iAchouPadrao = -4 then
                  sMensErro :=  'Foi encontrado mais de um Roteiro Contábil para essa Operação.'
               else
                  sMensErro :=  'Não foi encontrado o Roteiro Contábil para essa Operação.';

               Result := -1;
               Raise Exception.Create(sMensErro);
               //AL_107 - Fim
               //AL_62 - Fim
            end;

            If (sRecPagBol  = 'Y') Then
                sRecPagBol := 'R';

            // se é para ser feita contabilização e esta tiver sido efetuada com sucesso,
            // ou se não é necessário contabilizar
            if ( ((bContabOper) and (bAchouOperacao)) or (not(bContabOper)) ) then
            begin
               // Se a Operação Integra CAPCAR, alimenta sRecPagBol
               if (bLancaCAPCAROper) then
               begin
                  if Trim(sRecPagBol) = '' then
                  begin
                     sRecPagBol := sRecPagNaoOp;
                     if Trim(sRecPagNaoOp) = '' then
                     begin
                        sMensErro := 'Tipo de Recebimento/Desembolso não especificado.';
                        Result := -1;
                        //AL_107
                        Raise Exception.Create(sMensErro);
                     end;
                  end;
                  if Trim(sTipoRecDesBol) = '' then
                  begin
                     sTipoRecDesBol := sTipoRecDesOp;
                     if Trim(sTipoRecDesOp) = '' then
                     begin
                        sMensErro := 'Tipo de Recebimento/Desembolso não especificado.';
                        //AL_107
                        Raise Exception.Create(sMensErro);
                     end;
                  end;
               end
               Else If ((bLancaCAPCAROper) and (bAchouOperacao)) then
               begin
                  //AL_107
                  sMensErro := 'Parametrização da Integração com CAP/CAR não cadastrada';
                  Raise Exception.Create(sMensErro);
                  Exit;
               end;

               // Se a Operação Integra CAPCAR, Cria Documento
               if (bLancaCAPCAROper)  and (iDocumentoOper = -1) and (bLancaFin) then
               begin
                  // AL_86 - Ini
                  // gera o identificador incremental da tabela DOCUMENTO
                  if CtrlInvContab.Documento.GetDocSequence then
                     iDocumentoOper := CtrlInvContab.Documento.CodDocumento;
                  // Prepara um novo documento
                  CtrlInvContab.Documento.Prepare;
                  iPortador      := -1;
                  CtrlInvContab.Documento.GetNoDocumento;
                  fNoDocumento := CtrlInvContab.Documento.NoDocumento;

                  //AL_100
                  if iTipoOperCPVD = -1 then
                  sContaDoc := OperComum.IIF(sRecPagBol[1] = 'P', sContaCredOp, sContaDebOp);

                  sPlano := IntToStr(iPlano);
                  //AL_20
                  if iCodTipDoc <> 0 then
                     iTipoDocOp := iCodTipDoc;
                  // Parametros para a Segregação
                  CtrlInvContab.Plano := iPlano;
                  CtrlInvContab.Patro := iPatro;
                  CtrlInvContab.PlanPrev := iPlanoPrev;
                  // Cria Documento
                  if not CtrlInvContab.Documento.SetValues(iDocumentoOper,
                                                           fNoDocumento,
                                                           sComplementoOp, sStatus, sRecPagBol[1], sOperacao,
                                                           '' {sNumslip}, ''{sNumleitcodbarras}, sContaDoc, sCentroCustoCredOp,
                                                           ''{sNossonumero}, ''{sNumdigcodbarras}, ''{sGrupodoc}, ''{sFlgemitelancbaix},
                                                           ''{sFlgconfirmarecpag}, ''{sEmisbloq}, ''{sReferencia}, ''{sObs},
                                                           dDataVenc {dDatavencto}, dDataOper {dDataemissao},
                                                           dDataVenc {dDataprogramada}, 0{dDataremessa}, 0{dDatalimite}, 0{dDatacorrecao},
                                                           0{rVlrmulta}, 0{rValorjuros}, 0{rValordesconto}, 0{rPercjurossimples}, 0{rPercjurosatuarial},
                                                           iTipoDocOp, Sistema.idEmpresa, iModuloOrigem, iForCli, iNumFatura,
                                                           0{liIdcbancaria}, iUnidNegocOp, iPlano, 0{liNumcpbaixa}, 0{liNumapgr},
                                                           iMoeda, 0{liLotetransmissao}, -1{liIndicecorrecao},
                                                           Sistema.idUsuario, Sistema.idEmpresa, 1{liFlgnaoconciliado}, 0{liControleremessa},
                                                           iSubContaCredOp, iPortador,
                                                           0{liCodgrupocnab}, 0{liCodgeradorinss}, -1{liCodforma},
                                                           dDataVenc {dDataDisp},
                                                           CtrlInvContab.CriterioSegregacao {iIdSegregaCriter: integer = -1}) then
                     //AL_87 - Precisa captar a mensagem do Objeto Documento
                     Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

                  //AL_90
                  CtrlInvContab.Documento.ContaInvest := iFlgContaInvest
                  // AL_86 - Fim
               end;

               if ( (bAchouOperacao) and (bLancaCAPCAROper) and (sRecPagNaoOp <> 'N') and
                    (bLancaFin) ) then
               begin

                  if sRecPagBol <> sRecPagNaoOp then
                     fVlrOper := - fVlrOper;

                  //AL_22 Ini
                  if iCodTipDoc <> 0 then // Vem da Boleta
                  begin
                     fVlrOper := Abs(fVlrOper);
                     if sRecPagBol = 'P' then   // Vem do Boleta
                     begin
                        if sRecPagOp = 'P' then  // Vem do TipoOperacao
                        begin
                           if sRecPagNaoOp = 'R' then   // Vem da PadrLancContInv
                              fVlrOper := fVlrOper * -1;
                        end
                        else
                        if sRecPagOp = 'R' then
                        begin
                           if sRecPagNaoOp = 'R' then
                              fVlrOper := fVlrOper * -1;
                        end;
                     end
                     else if sRecPagBol = 'R' then
                     begin
                        if sRecPagOp = 'P' then
                        begin
                           if sRecPagNaoOp = 'P' then
                              fVlrOper := fVlrOper * -1;
                        end
                        else
                        if sRecPagOp = 'R' then
                        begin
                           if sRecPagNaoOp = 'P' then
                              fVlrOper := fVlrOper * -1;
                        end;
                     end;
                  end;
                  //AL_22 Fim

                  //MUDANCA PARA O RATEIO DE ANUNCIO DE PROVENTOS
                  if sIntegraCapCar = 'S' Then
                     fVlrOper := OperComum.IIF(sRecPagBol <> sRecPagNaoOp, (fTotalLiquido*-1), fTotalLiquido);

                  if ((iTipoOperacao = -10) or (iTipoOperacao = -11)) Then // Ajuste de BM&F
                     fVlrOper := fTotalLiquido;

                  // Cria Rateio
                  //AL_109
                  if not CtrlInvContab.Documento.RateioDocumSetValues(
                                       fVlrOper, 0{rValorOM}, 0{rVlrresorcamen},
                                       0{liIdrateiodocum}, Sistema.idEmpresa {liIdpessoa},
                                       iDocumentoOper, iUnidNegocOp, 0{liMoecodigo}, Sistema.idUsuario,
                                       0{liIdreservaorcamen},
                                       iPlano, iPlanoPrev, iPatro,
                                       CtrlPInv.IdPrograma, // dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger,
                                       0{liIdprocesso}, Sistema.idEmpresa,
                                       sTipoRecDesBol, sRecPagBol[1], sCentroResponOp,
                                       sCentroCustoCredOp, ''{sNumimovel}) then
                     //AL_87
                     Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

                  fVlrLiquido := fVlrLiquido + fVlrOper;
               end;

               // Trata Despesas Internas
               if iTipoInvest <> 8 then
               begin
                  qryDespOper := dtmOperComum.qryDespNegXTipoOper;
                  if (iTipoOperacao = -7) or (iTipoOperacao = -8) then // Atualização IR Litigio
                  begin
                     qryDespOper.Close;
                     qryDespOper.SQL.Clear;
                     qryDespOper.SQL.Add('SELECT DISTINCT IDTIPODESPINVEST, FLGGERACONTAB, ');
                     qryDespOper.SQL.Add('       FLGGERACAPCAR,CODTIPDOC, RECPAG           ');
                     qryDespOper.SQL.Add('FROM DESPESASXTIPOOPER                           ');
                     qryDespOper.SQL.Add('WHERE IDTIPOINVEST = '+IntToStr(iTipoInvest)      );
                     qryDespOper.SQL.Add('AND   IDTIPODESPINVEST = '+IntToStr(iOperacao) );
                     qryDespOper.Open;
                  end
                  else
                  begin
                     qryDespOper.Close;
                     if not(qryDespOper.Prepared) then qryDespOper.Prepare;
                     qryDespOper.ParamByName('TIPOINVEST').AsInteger    := iTipoInvest;
                     qryDespOper.ParamByName('TIPOOERACAO').AsInteger   := iTipoOperacao;
                     qryDespOper.Open;
                     //AL_54 - 27/10/2005
                     //AL_45 - 15/09/2005
                     //Ingressão de Permulta - variação, despreza
                     //AL_109
                     If ((((CtrlPInv.IdTipoOperDirPer = iTipoOperacao) Or
                           (CtrlPInv.IdTipoOperDirPer+10000 = iTipoOperacao)) Or
                          ((CtrlPInv.IdTipoOperDirDSA = iTipoOperacao) Or
                           (CtrlPInv.IdTipoOperDirDSA+10000 = iTipoOperacao))) And
                          (Not bDireitoOrig)) then
                     begin
                        //AL_47 - 20/09/2005
                        //LUCRO e PREJUIZO
                        qryDespOper.Filter   := 'IDTIPODESPINVEST <> -4 AND IDTIPODESPINVEST <> -5 ';

                        //AL_54 - 27/10/2005 - o destino não faz variação, só custo
                        //AL_109
                        If ((CtrlPInv.IdTipoOperDirDSA = iTipoOperacao) Or
                            (CtrlPInv.IdTipoOperDirDSA+10000 = iTipoOperacao)) then
                           qryDespOper.Filter := qryDespOper.Filter+' AND IDTIPODESPINVEST <> -2 AND IDTIPODESPINVEST <> -19 ';

                        qryDespOper.Filtered := True;
                     end
                     else
                     begin
                        qryDespOper.Filter   := '';
                        qryDespOper.Filtered := False;
                     end;
                  end;

                  While Not qryDespOper.Eof Do
                  begin
                     iTipoDespesa     := qryDespOper.FieldByName('IDTIPODESPINVEST').AsInteger;
                     iTipoDocDs       := qryDespOper.FieldByName('CODTIPDOC').AsInteger;
                     If sContabiliza  = 'N' Then
                        bContabDesp  := False
                     Else
                        bContabDesp  := qryDespOper.FieldByName('FLGGERACONTAB').AsInteger = 1;
                     bLancaCAPCARDesp:= qryDespOper.FieldByName('FLGGERACAPCAR').AsInteger = 1;
                     sRecPagDs       := qryDespOper.FieldByName('RECPAG').AsString;
                     if (iTipoOperacao <> -7) and (iTipoOperacao <> -8) then // Não busca valor p/ Atualização IR Litigio
                     begin
                        If ((iTipoDespesa = -4) or (iTipoDespesa = -5)) and
                           ( iIdHistCartInvLucro <> 0 ) then
                           BuscaValorAContabilizar(iIdHistCartInvLucro, iTipoDespesa,iTipoInvest, bVenda, fVlrDesp)
                        else if (iIdHistCartInv <> 0) then
                           BuscaValorAContabilizar(iIdHistCartInv, iTipoDespesa,iTipoInvest, bVenda, fVlrDesp);
                     end
                     else
                        fVlrDesp := fVlrOper; // Valor a contab. da Atualiz. IR Litigio

                     // Despreza Lucro na Venda quando valor Lucro é negativo, e Prejuizo na Venda quando
                     // Lucro é positivo.
                     // só vai adiante se for necessário fazer algum tipo de lançamento (Contábil ou CAP/CAR)...
                     if ( (bContabDesp) or (bLancaCAPCARDesp) ) then
                     begin
                        if fVlrDesp <> 0 then
                        begin
                           // verifica se já existe transação em andamento; se não houver, inicia uma
                           if not(dtmBaseDados.dbBaseDados.InTransaction) then
                           begin
                              bTransacao := True;
                              StartTransacao;
                           end;

                           // Busca da PadrLancContInv p/ fazer os lançamentos ---------------------------------------------

                           // AL_55 - 02/11/2005
                           // Al_46 - 20/09/2005
                           // Usa valor absoluto do prejuizo para buscar contabilizaçao
                           //AL_109
                           If  ((iTipoDespesa = -5) or
                              (((CtrlPInv.IdTipoOperDirPer = iTipoOperacao) or
                                (CtrlPInv.IdTipoOperDirPer+10000 = iTipoOperacao)) or
                               ((CtrlPInv.IdTipoOperDirDSA = iTipoOperacao) or
                                (CtrlPInv.IdTipoOperDirDSA+10000 = iTipoOperacao)) and (Not bDireitoOrig))) then
                              fVlrDesp := - fVlrDesp;

                           // Verifica o Padrão de Lançamento mais adequado
                           //AL_86
                           //AL_107
                           iAchouPadrao := CtrlInvContab.BuscaPadrLanc.Executa(iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento, iCarteira,
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
                           sTipoPerDs := CtrlInvContab.BuscaPadrLanc. TipoPer;
                           sHistoricoDs := CtrlInvContab.BuscaPadrLanc.Historico;
                           sRecPagNaoDs := CtrlInvContab.BuscaPadrLanc.RecPagNao;

                           bAchouDespesa := (iAchouPadrao = 0);

                           // Volta valor do prejuizo
                           //AL_77 - Ini
                           If (iTipoDespesa = -5) then
                              fVlrDesp := - fVlrDesp
                           else if (iTipoDespesa = -34) then
                           begin
                              // Caso seja provisão de perda e o valor da provisão for inverso da variação
                              //   (Primeiro provisionamento)
                              if ((fVlrDesp > 0) and (fVlrOper < 0)) or
                                 ((fVlrDesp < 0) and (fVlrOper > 0)) then
                              begin
                                 sContaTemp   := sContaDebDs;
                                 sContaDebDs  := sContaCredDs;
                                 sContaCredDs := sContaTemp;
                              end;
                           end;
                           //AL_77 - Fim

                           // Modula o valor da despesa
                           fVlrDespAbs := abs(fVlrDesp);

                           // @X Chamada às funções de integração Contábil e Financeira ---------------------------------------

                           if (bContabDesp) and (bAchouDespesa) then
                           begin
                              if iPlanilhaOper = -1 then iPlanilhaOper := 0;

                              //AL_72
                              //AL_109
                              if ((CtrlPInv.IdTipoOperDirInc = iTipoOperacao) or
                                  (CtrlPInv.IdTipoOperDirInc + 10000 = iTipoOperacao) or
                                  (iTipoOperacao = -149)) then //Incorporação de Ações
                                 sHistoricoDs :=  sHistoricoDs + sHistContab
                              else
                              begin
                                 sHistoricoDs := trim(sHistoricoDs) + '  ' +
                                                 trim(dtmOperComum.QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString);
                                 if iTipoInvest = 1 then  // pega Lote da aplicação
                                    sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sLote)
                                 else if iTipoInvest = 8 then
                                    sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sHistContab)
                                 else                     // pega Lote da operação
                                    sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sHistCapCar);
                              end;

                              //AL_83
                              if not(LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlanoDs, iSubContaDebDs, iSubContaCredDs,
                                                        iUnidNegocDs, iForCli, iPlanoPrev, iPatro,
                                                        sContaDebDs, sContaCredDs, sCentroCustoDebDs, sCentroCustoCredDs,
                                                        sHistoricoDs+' - '+TRIM(sPlanPrevHist), sTipoPerDs, sRecPagDs,
                                                        dDataOper, fVlrDespAbs, bMostraMsg, iPlanilhaOper, sMensErro) ) then
                              begin
                                 Result := -6; // não foi possível efetuar o lançamento contábil
                                 //AL_107
                                 Raise Exception.Create(sMensErro);
                              end;

                           end;

                           // se é para ser feita contabilização e esta tiver sido efetuada com sucesso,
                           // ou se não é necessário contabilizar
                           if ( (bLancaCAPCARDesp) and (sRecPagNaoDs <> 'N') and
                                (bLancaFin) ) then
                           begin
                              if ( ((bContabDesp) and (Result = 0)) or (not(bContabDesp)) ) then
                              begin
                                 // AL_23
                                 if (sRecPagBol = '') and ((iTipoOperacao = -35) or (iTipoOperacao = -118)) then
                                     sRecPagBol := sRecPagNaoDs;
                                 if iDocumentoOper = -1 then
                                 begin
                                    //AL_86
                                    if sRecPagBol = '' then
                                       sRecPagBol := sRecPagNaoDs;
                                    if Trim(sTipoRecDesBol) = '' then
                                       sTipoRecDesBol := sTipoRecDesDs;


                                    // AL_86 - Verificar por que gera outro CodDocumento aqui.
                                    if iDocumentoOper = -1 then
                                    begin
                                       // gera o identificador incremental da tabela DOCUMENTO
                                       if CtrlInvContab.Documento.GetDocSequence then
                                          iDocumentoOper := CtrlInvContab.Documento.CodDocumento;
                                       CtrlInvContab.Documento.Prepare;
                                    end
                                    else
                                       MsgDlg('Não é possível preparar outro documento', 'Mensagem do Sistem', mtWarning, [mbOk], 0);

                                    iPortador      := -1;

                                    //AL_86 - Ini
                                    if CtrlInvContab.Documento.GetNoDocumento then
                                       fNoDocumento := CtrlInvContab.Documento.NoDocumento
                                    else
                                       fNoDocumento := 0;

                                    if sContaCredOp = '' then
                                    begin
                                       sContaCredOp := sContaCredDs;
                                       sContaDebOp  := sContaDebDs;
                                    end;

                                    //Al_102
                                    if sRecPagBol[1] = 'P' then
                                    begin
                                       //AL_100
                                       if iTipoOperCPVD = -1 then
                                          sContaDoc := sContaCredOp;
                                    end
                                    else
                                    begin
                                       //AL_100
                                       if iTipoOperCPVD = -1 then
                                          sContaDoc := sContaDebOp;
                                    end;
                                    
                                    sPlano := IntToStr(iPlanoDs);

                                    //AL_20 
                                    if iCodTipDoc <> 0 then
                                       iTipoDocDs := iCodTipDoc;

                                    // Parametros para a Segregação
                                    CtrlInvContab.Plano := iPlanoDs;
                                    CtrlInvContab.Patro := iPatro;
                                    CtrlInvContab.PlanPrev := iPlanoPrev;
                                    // Cria o Documento
                                    if not CtrlInvContab.Documento.SetValues(
                                                         iDocumentoOper, fNoDocumento,
                                                         sComplementoDs, sStatus, sRecPagBol[1], sOperacao,
                                                         '' {sNumslip}, ''{sNumleitcodbarras}, sContaDoc, sCentroCustoCredDs,
                                                         ''{sNossonumero}, ''{sNumdigcodbarras}, ''{sGrupodoc}, ''{sFlgemitelancbaix},
                                                         ''{sFlgconfirmarecpag}, ''{sEmisbloq}, ''{sReferencia}, ''{sObs},
                                                         dDataVenc {dDatavencto}, dDataOper {dDataemissao},
                                                         dDataVenc {dDataprogramada}, 0{dDataremessa}, 0{dDatalimite}, 0{dDatacorrecao},
                                                         0{rVlrmulta}, 0{rValorjuros}, 0{rValordesconto}, 0{rPercjurossimples}, 0{rPercjurosatuarial},
                                                         iTipoDocDs, Sistema.idEmpresa, iModuloOrigem, iForCli, iNumFatura,
                                                         0{liIdcbancaria}, iUnidNegocDs, iPlanoDs, 0{liNumcpbaixa}, 0{liNumapgr},
                                                         iMoeda, 0{liLotetransmissao}, -1{liIndicecorrecao},
                                                         Sistema.idUsuario, Sistema.idEmpresa, 1{liFlgnaoconciliado}, 0{liControleremessa},
                                                         iSubContaCredDs, iPortador,
                                                         0{liCodgrupocnab}, 0{liCodgeradorinss}, -1{liCodforma},
                                                         dDataVenc {dDataDisp},
                                                         CtrlInvContab.CriterioSegregacao {iIdSegregaCriter: integer = -1}) then
                                       //AL_87
                                       Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

                                    //AL_8
                                    //AL_90
                                    CtrlInvContab.Documento.ContaInvest := iFlgContaInvest;

                                    //AL_86 - Fim
                                 end;

                                 if sRecPagBol <> sRecPagNaoDs then
                                    fVlrDesp := - fVlrDesp;

                                 //AL_22 Ini
                                 if iCodTipDoc <> 0 then  // Vem da Boleta
                                 begin
                                    fVlrDesp    := Abs(fVlrDesp);
                                    if sRecPagBol = 'P' then // Vem da Boleta
                                    begin
                                       if sRecPagOp = 'P' then  // Vem do TipoOperacao
                                       begin
                                          if sRecPagNaoDs = 'R' then  // Vem da PadrlancContinv
                                             fVlrDesp := fVlrDesp * -1;
                                       end
                                       else if sRecPagOp = 'R' then
                                       begin
                                          if sRecPagNaoDs = 'R' then
                                             fVlrDesp := fVlrDesp * -1;
                                       end;
                                    end
                                    else if sRecPagBol = 'R' then
                                    begin
                                       if sRecPagOp = 'P' then
                                       begin
                                          if sRecPagNaoDs = 'P' then
                                             fVlrDesp := fVlrDesp * -1;
                                       end
                                       else if sRecPagOp = 'R' then
                                       begin
                                          if sRecPagNaoDs = 'P' then
                                             fVlrDesp := fVlrDesp * -1;
                                       end;
                                    end;
                                 end;
                                 //AL_22 Fim

                                 if Trim(sTipoRecDesBol) = '' then
                                    sTipoRecDesBol := sTipoRecDesDs;

                                 // AL_86 - Cria Rateio 3 camadas
                                 //AL_109
                                 if not CtrlInvContab.Documento.RateioDocumSetValues(
                                                      fVlrDesp, 0{rValorOM}, 0{rVlrresorcamen},
                                                      0{liIdrateiodocum}, Sistema.idEmpresa {liIdpessoa},
                                                      0{liCoddocumento  ???  Verificar ??? Segundo Alex, não precisa passar},
                                                      iUnidNegocDs, 0{liMoecodigo}, Sistema.idUsuario, 0{liIdreservaorcamen},
                                                      iPlanoDs{liPlano - ?? Não existia na versão anterior},
                                                      iPlanoPrev, iPatro,
                                                      CtrlPInv.IdPrograma, // dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger,
                                                      0{liIdprocesso}, Sistema.idEmpresa,
                                                      sTipoRecDesBol, sRecPagBol[1], sCentroResponDs,
                                                      sCentroCustoCredDs,
                                                      ''{sNumimovel}) then
                                    //AL_87
                                    Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

                                 fVlrLiquido := fVlrLiquido + fVlrDesp;
                              end;
                           end;
                        end;
                     end;
                     qryDespOper.Next;
                  end;

                  // Despesas cadastradas pelo Usuário
                  qryDespOper := dtmOperComum.qryDespesasOPeracao;
                  qryDespOper.Close;
                  if not(qryDespOper.Prepared) then qryDespOper.Prepare;
                  qryDespOper.ParamByName('IDOPERACAOINVEST').AsInteger := iOperacao;
                  qryDespOper.Open;

                  While Not qryDespOper.Eof Do
                  begin
                     iTipoDespesa := qryDespOper.FieldByName('IDTIPODESPINVEST').AsInteger;
                     fVlrDesp     := qryDespOper.FieldByName('VLRDESPOPER').AsFloat;

                     dtmOperComum.qryDespXTipoOper.Close;
                     if not(dtmOperComum.qryDespXTipoOper.Prepared) then dtmOperComum.qryDespXTipoOper.Prepare;
                     dtmOperComum.qryDespXTipoOper.ParamByName('TIPOINVEST').AsInteger    := iTipoInvest;
                     dtmOperComum.qryDespXTipoOper.ParamByName('TIPOOERACAO').AsInteger   := iTipoOperacao;
                     dtmOperComum.qryDespXTipoOper.ParamByName('TIPODESPESA').AsInteger   := iTipoDespesa;
                     dtmOperComum.qryDespXTipoOper.Open;
                     iTipoDocDs       := dtmOperComum.qryDespXTipoOper.FieldByName('CODTIPDOC').AsInteger;
                     If sContabiliza  = 'N' Then
                        bContabDesp   := False
                     Else
                        bContabDesp   := dtmOperComum.qryDespXTipoOper.FieldByName('FLGGERACONTAB').AsInteger = 1;
                     bLancaCAPCARDesp := dtmOperComum.qryDespXTipoOper.FieldByName('FLGGERACAPCAR').AsInteger = 1;
                     sRecPagDs        := dtmOperComum.qryDespXTipoOper.FieldByName('RECPAG').AsString;

                     // só vai adiante se for necessário fazer algum tipo de lançamento (Contábil ou CAP/CAR)...

                     if ( (bContabDesp) or (bLancaCAPCARDesp) ) then
                     begin
                        if fVlrDesp <> 0 then
                        begin
                           // verifica se já existe transação em andamento; se não houver, inicia uma
                           if not(dtmBaseDados.dbBaseDados.InTransaction) then
                           begin
                              bTransacao := True;
                              StartTransacao;
                           end;

                           // @X Busca da PadrLancContInv p/ fazer os lançamentos ---------------------------------------------

                           // Verifica o Padrão de Lançamento mais adequado
                           //AL_86 - Ini
                           //AL_107
                           iAchouPadrao := CtrlInvContab.BuscaPadrLanc.Executa(iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento, iCarteira,
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
                           sTipoPerDs := CtrlInvContab.BuscaPadrLanc. TipoPer;
                           sHistoricoDs := CtrlInvContab.BuscaPadrLanc.Historico;
                           sRecPagNaoDs := CtrlInvContab.BuscaPadrLanc.RecPagNao;
                           //AL_86 - Fim

                           bAchouDespesa := (iAchouPadrao = 0);

                           if not bAchouDespesa then
                           begin
                             iSubContaDebDs     := iSubContaDebOp;
                             iSubContaCredDs    := iSubContaCredOp;
                             iUnidNegocDs       := iUnidNegocOp;
                             //AL_20 Ini
                             if iCodTipDoc <> 0 then
                                iTipoDocDs      := iCodTipDoc
                             else
                                iTipoDocDs      := iTipoDocOp;
                             //AL_20 Fim
                             sContaCredDs       := sContaCredOp;
                             sContaDebDs        := sContaDebOp;
                             sCentroCustoCredDs := sCentroCustoCredOp;
                             sCentroCustoDebDs  := sCentroCustoDebOp;
                             sCentroResponDs    := sCentroResponOp;
                             sRecPagNaoDs       := sRecPagNaoOp;
                             sTipoPerDs         := sTipoPerOp;
                             sRecPagDs          := sRecPagOp;
                             sTipoRecDesDs      := sTipoRecDesOp;
                             sComplementoDs     := sComplementoOp;
                             sTipoParcelaDs     := sTipoParcelaOp;
                             sHistoricoDs       := 'Despesa de '+sHistoricoOp;
                             // se o valor da Despesa for negativo, inverte as contas
                             if fVlrDesp < 0 then
                             begin
                                sContaAux    := sContaDebDs;
                                sContaDebDs  := sContaCredDs;
                                sContaCredDs := sContaAux;
                             end;

                           end;

                           // Modula o valor da despesa
                           fVlrDespAbs := abs(fVlrDesp);


                           // @X Chamada às funções de integração Contábil e Financeira ---------------------------------------

                           if bContabDesp then
                           begin
                              if iPlanilhaOper = -1 then iPlanilhaOper := 0;

                              sHistoricoDs := trim(sHistoricoDs) + '  ' +
                                              trim(dtmOperComum.QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString);
                              if iTipoInvest = 1 then  // pega Lote da aplicação
                                 sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sLote)
                              else if iTipoInvest = 8 then
                                 sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sHistContab)
                              else                     // pega Lote da operação
                                 sHistoricoDs := trim(sHistoricoDs) + '  ' + trim(sHistCapCar);

                              //AL_83
                              if not(LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlanoDs, iSubContaDebDs, iSubContaCredDs,
                                                        iUnidNegocDs, iForCli, iPlanoPrev, iPatro,
                                                        sContaDebDs, sContaCredDs, sCentroCustoDebDs, sCentroCustoCredDs,
                                                        sHistoricoDs+' - '+TRIM(sPlanPrevHist), sTipoPerDs, sRecPagDs,
                                                        dDataOper, fVlrDespAbs, bMostraMsg, iPlanilhaOper, sMensErro) ) then
                              begin
                                 Result := -6; // não foi possível efetuar o lançamento contábil
                                 //AL_107
                                 Raise Exception.Create(sMensErro);
                              end;
                           end;

                           // se é para ser feita contabilização e esta tiver sido efetuada com sucesso,
                           // ou se não é necessário contabilizar
                           if ( (bLancaCAPCARDesp) and (sRecPagNaoDs <> 'N') and
                                (bLancaFin) ) then
                           begin
                              if ( ((bContabDesp) and (Result = 0)) or (not(bContabDesp)) ) then
                              begin
                                 if iDocumentoOper = -1 then
                                 begin
                                    if sRecPagBol = '' then
                                       sRecPagBol := sRecPagNaoDs;

                                    if Trim(sTipoRecDesBol) = '' then
                                       sTipoRecDesBol := sTipoRecDesDs;

                                    //AL_86 - Ini
                                    if iDocumentoOper = -1 then
                                    begin
                                       if CtrlInvContab.Documento.GetDocSequence then
                                          iDocumentoOper := CtrlInvContab.Documento.CodDocumento;

                                       CtrlInvContab.Documento.Prepare;
                                    end
                                    else
                                       //AL_107
                                       Raise Exception.Create('Não é possível preparar outro documento');

                                    iPortador      := -1;

                                    if CtrlInvContab.Documento.GetNoDocumento then
                                       fNoDocumento := CtrlInvContab.Documento.NoDocumento
                                    else
                                       fNoDocumento := 0;

                                    if sContaCredOp = '' then
                                    begin
                                       sContaCredOp := sContaCredDs;
                                       sContaDebOp  := sContaDebDs;
                                    end;

                                    //Al_102
                                    if sRecPagBol[1] = 'P' then
                                    begin
                                       //AL_100
                                       if iTipoOperCPVD = -1 then
                                          sContaDoc := sContaCredOp;
                                    end
                                    else
                                    begin
                                       //AL_100
                                       if iTipoOperCPVD = -1 then
                                          sContaDoc := sContaDebOp;
                                    end;
                                    
                                    sPlano := IntToStr(iPlanoDs);

                                    //AL_20 Ini
                                    if iCodTipDoc <> 0 then
                                       iTipoDocDs := iCodTipDoc;
                                    //AL_20 Fim

                                    // Parametros para a Segregação
                                    CtrlInvContab.Plano := iPlanoDs;
                                    CtrlInvContab.Patro := iPatro;
                                    CtrlInvContab.PlanPrev := iPlanoPrev;

                                    // Cria o Documento em 3 camadas
                                    if not CtrlInvContab.Documento.SetValues(
                                                         iDocumentoOper, fNoDocumento,
                                                         sComplementoDs, sStatus, sRecPagBol[1], sOperacao,
                                                         '' {sNumslip}, ''{sNumleitcodbarras}, sContaDoc, sCentroCustoCredDs,
                                                         ''{sNossonumero}, ''{sNumdigcodbarras}, ''{sGrupodoc}, ''{sFlgemitelancbaix},
                                                         ''{sFlgconfirmarecpag}, ''{sEmisbloq}, ''{sReferencia}, ''{sObs},
                                                         dDataVenc {dDatavencto}, dDataOper {dDataemissao},
                                                         dDataVenc {dDataprogramada}, 0{dDataremessa}, 0{dDatalimite}, 0{dDatacorrecao},
                                                         0{rVlrmulta}, 0{rValorjuros}, 0{rValordesconto}, 0{rPercjurossimples}, 0{rPercjurosatuarial},
                                                         iTipoDocDs, Sistema.idEmpresa, iModuloOrigem, iForCli, iNumFatura,
                                                         0{liIdcbancaria}, iUnidNegocDs, iPlanoDs, 0{liNumcpbaixa}, 0{liNumapgr},
                                                         iMoeda, 0{liLotetransmissao}, -1{liIndicecorrecao},
                                                         Sistema.idUsuario, Sistema.idEmpresa, 1{liFlgnaoconciliado}, 0{liControleremessa},
                                                         iSubContaCredDs, iPortador,
                                                         0{liCodgrupocnab}, 0{liCodgeradorinss}, -1{liCodforma},
                                                         dDataVenc {dDataDisp},
                                                         CtrlInvContab.CriterioSegregacao {iIdSegregaCriter: integer = -1}) then
                                       //AL_87
                                       Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
                                    //AL_86 - Ini
                                 end;

                                 // AL_19 - 11/02/2005
                                 fVlrDesp    := Abs(fVlrDesp);
                                 // Fim

                                 if sRecPagBol <> sRecPagNaoDs then
                                    fVlrDesp := - fVlrDesp;

                                 //AL_22 Ini
                                 if iCodTipDoc <> 0 then  // Vem da Boleta
                                 begin
                                    fVlrDesp    := Abs(fVlrDesp);
                                    if sRecPagBol = 'P' then  // Vem da Boleta
                                    begin
                                       if sRecPagOp = 'P' then   // Vem da TipoOperacao
                                       begin
                                          if sRecPagNaoDs = 'R' then    // Vem da PadrLancContInv
                                             fVlrDesp := fVlrDesp * -1;
                                       end
                                       else if sRecPagOp = 'R' then
                                       begin
                                          if sRecPagNaoDs = 'R' then
                                             fVlrDesp := fVlrDesp * -1;
                                       end;
                                    end
                                    else if sRecPagBol = 'R' then
                                    begin
                                       if sRecPagOp = 'P' then
                                       begin
                                          if sRecPagNaoDs = 'P' then
                                             fVlrDesp := fVlrDesp * -1;
                                       end
                                       else if sRecPagOp = 'R' then
                                       begin
                                          if sRecPagNaoDs = 'P' then
                                             fVlrDesp := fVlrDesp * -1;
                                       end;
                                    end;
                                 end;
                                 //AL_22 Fim

                                 // AL_86 - Cria Rateio 3 camadas
                                 //AL_109
                                 if not CtrlInvContab.Documento.RateioDocumSetValues(
                                                      fVlrDesp, 0{rValorOM}, 0{rVlrresorcamen},
                                                      0{liIdrateiodocum}, Sistema.idEmpresa {liIdpessoa},
                                                      0{liCoddocumento  ???  Verificar ??? Segundo Alex, não precisa passar},
                                                      iUnidNegocDs, 0{liMoecodigo}, Sistema.idUsuario, 0{liIdreservaorcamen},
                                                      iPlanoDs{liPlano - ?? Não existia na versão anterior},
                                                      iPlanoPrev, iPatro,
                                                      CtrlPInv.IdPrograma, //dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger,
                                                      0{liIdprocesso}, Sistema.idEmpresa,
                                                      sTipoRecDesBol, sRecPagBol[1], sCentroResponDs,
                                                      sCentroCustoCredDs,
                                                      ''{sNumimovel}) then
                                    //AL_87
                                    Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

                                 fVlrLiquido := fVlrLiquido + fVlrDesp;
                              end;
                           end;
                        end;
                     end;
                     qryDespOper.Next;
                  end;
               end;
            end;

            if ((iDocumentoOper <> -1) and ((fVlrLiquido <> 0) or (fTotalLiquido <> 0))) then
            begin
               sDebCre := OperComum.IIF(sRecPagBol[1] = 'P', 'C', 'D');
               if bCriaLancto then
               begin
                  if fTotalLiquido <> 0 then
                     fVlrLancto := fTotalLiquido
                  else
                     fVlrLancto := fVlrLiquido;
                  //AL_86 - Ini
                  if bLancaFin then
                  begin
                     if iTipoInvest = 2 then // Renda Variável
                     Begin
                        // AL_14 - 20/01/2005
                        // Cria LanctoDocum em 3 camadas
                        if not CtrlInvContab.Documento.LancoDocumSetValues(
                                             dDataOper, iDocumentoOper, 0 {iNumLancamento},
                                             fVlrLancto, 0{rValorOM}, fVlrLancto,
                                             iUnidNegocOp, CtrlInvContab.Planilha, 0{liNumlotemanual},
                                             Sistema.idUsuario, Sistema.idEmpresa,
                                             0{liIdnflivro}, 0{liEstorno}, iTipoDocOp, 0{liCoddocinss}, 0{liCodalterador},
                                             sOperacao,  ''{sNumrecibo}, ''{sNumnf}, ''{sNumfatura},
                                             //AL_107 - Inclui a descrição contabil
                                             sHistCapCar + ' / ' + sHistoricoOp, ''{sFlgtipofatura}, ''{sFlgrecebeunf}, ''{sFlgfatemitida},
                                             sDebcre, Sistema.IdModulo, iPlano,
                                             Sistema.UsaPlanoPatro) then
                           //AL_87
                           Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
                     End
                     else
                     Begin
                        if (iTipoOperacao = -10) or (iTipoOperacao = -11) Then // Ajuste de BM&F
                            fVlrOper := fTotalLiquido;
                           // Cria LanctoDocum em 3 camadas
                           if not CtrlInvContab.Documento.LancoDocumSetValues(
                                                dDataOper, iDocumentoOper, 0 {iNumLancamento},
                                                fVlrOper, 0{rValorOM}, fVlrOper,
                                                iUnidNegocDs, CtrlInvContab.Planilha, 0{liNumlotemanual},
                                                Sistema.idUsuario, Sistema.idEmpresa,
                                                0{liIdnflivro}, 0{liEstorno}, iTipoDocDs, 0{liCoddocinss}, 0{liCodalterador},
                                                sOperacao,  ''{sNumrecibo}, ''{sNumnf}, ''{sNumfatura},
                                               //AL_107 - Inclui a descrição contabil
                                                sHistCapCar + ' / ' + sHistoricoOp, ''{sFlgtipofatura}, ''{sFlgrecebeunf}, ''{sFlgfatemitida},
                                                sDebcre, Sistema.IdModulo, iPlanoDs,
                                                Sistema.UsaPlanoPatro) then
                           //AL_87
                           Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
                     End;
                     //Ricardo Cristiano - 01/10/2008 - N. Sol 97195 -  N. Kintana 421956
                     //Ricardo Cristiano - 26/09/2008 - N. Sol 96981 -  N. Kintana 420918
                     // Finaliza o Documento e gera o CodDocumento
                     if not CtrlInvContab.Documento.Insert then
                     begin
                        //AL_87
                        Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
                     end
                     else
                     begin
                        iDocumentoOper := CtrlInvContab.Documento.CodDocumento;
                        bCriaLancto := false;
                     end;
                     //AL_86 - Fim
                  end;
               end;
            end;
            //AL_97
            iPlano := CtrlInvContab.BuscaPadrLanc.Plano;

            if ((iTipoOperacao = -7) or (iTipoOperacao = -8)) and
               (Result = 0) and (iPlanilhaOper <> -1) then // Atualização IR Litigio
               if iPlano = -1 then
                  iPlano := iPlanoDs;

            // Atualiza Plano, Planilha e Documento no HistCartInv
            if ((iIdHistCartInv <> 0) and (Result = 0) and
               ((iPlanilhaOper <> -1) or (iDocumentoOper <> -1))) and
               (iTipoInvest <> 8) then
            begin

               if iPlano = -1 then
                  iPlano := iPlanoDs;

               // No novo Renda Variável o Documento e a Planilha das Operações ficam na Boleta
               if bGravaDoc then
               begin
                  dtmOperComum.qryLocal.Close;
                  dtmOperComum.qryLocal.SQL.Clear;
                  dtmOperComum.qryLocal.SQL.Add(' UPDATE HISTCARTINV SET ');

                  If ((iPlanilhaOper <> -1) and (iPlanilhaOper <> 0)) then
                  begin
                     dtmOperComum.qryLocal.SQL.Add(' PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ');
                     dtmOperComum.qryLocal.SQL.Add(' PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilhaOper)) + ', ');
                  end
                  else
                  begin
                     dtmOperComum.qryLocal.SQL.Add(' PLANO     = '''' ,');
                     dtmOperComum.qryLocal.SQL.Add(' PLNCODIGO = '''' ,');
                  end;

                  If iDocumentoOper <> -1 then
                     dtmOperComum.qryLocal.SQL.Add(' CODDOCUMENTO = ' + QuotedStr(IntToStr(iDocumentoOper)))
                  else
                     dtmOperComum.qryLocal.SQL.Add(' CODDOCUMENTO = '''' ');

                  If (iOperacao <> -1) And (iOperacao <> 0) Then //Atualiza por tipo de operação
                      dtmOperComum.qryLocal.SQL.Add(' WHERE (IDOPERACAOINVEST = '+ QuotedStr(IntToStr(iOperacao))+')')
                  Else
                      dtmOperComum.qryLocal.SQL.Add(' WHERE (IDHISTCARTINV = '+ QuotedStr(IntToStr(iIdHistCartInv))+')');
                  dtmOperComum.qryLocal.Prepare;
                  dtmOperComum.qryLocal.ExecSQL;
                  dtmOperComum.qryLocal.UnPrepare;
                  dtmOperComum.qryLocal.Close;
               end;
            end;

            // Tudo havendo corrido bem...
            if Result = 0 then
            begin
               if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then
                  CommitTransacao;
            end;

         end;

         if (Result = 0) and (bLancaCAPCAROper) and (fVlrLiquido = 0) and (bLancaFin) then
         begin
            Result := -7;// Não foi possível efetuar o lançamento de CAP/CAR.
            //AL_107
            Raise Exception.Create('Não foi efetuado nenhum lançamento financeiro');
         end;

      except
         if bTransacao then
            RollBackTransacao;
         Screen.Cursor := crDefault;
         Result := -3;
         if bMostraMsg then
            Raise;
      end;

   finally
      Screen.Cursor := crDefault;
      //AL_86
      dtmOperComum.qryInvestimento.Close;
      dtmOperComum.qryCarteira.Close;
      dtmOperComum.qryTipoOperacao.Close;
      dtmOperComum.qryDespNegXTipoOper.Close;
      dtmOperComum.qryDespesasOPeracao.Close;
      dtmOperComum.qryDespXTipoOper.Close;
   end;
end;

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
function TOperComum.LancamentoContabil(iEmpresaProp, iModuloOrigem, iPlano, iSubContaD, iSubContaC,
iUnidNegoc, iForCli, iPlanoPrev, iPatro: integer; sContaD, sContaC, sCentroCustoD, sCentroCustoC, sHistorico, sTipoPer,
sRecPag: string; dDataLanc: TDateTime; fValorLanc: currency; bMostraMsg: boolean; var iPlanilha: integer;
var sMensContab: string; iUsuarioOrigem: Integer = -1): boolean;
var
   sHist1, sHist2, sHist3, sHist4, sHist5, sMascaraPlano: string;
   sModulo, sUnidNegoc, sObrigaCC, sNome, sSubContaD, sSubContaC, sDataLanc, sNoDoc : string;
   // A_36
   bPermiteSubConta: boolean;
   liExercicio, liPeriodo        : integer;

begin
   // Lança com o usuario que Originou a operação - Renda Fixa - 13/12/2002
   if iUsuarioOrigem = -1 then
      iUsuarioOrigem := Sistema.IdUsuario;

   Result := False;
   Screen.Cursor := crHourGlass;

   // AL_86
   sDataLanc     := DateToStr(dDataLanc);
   sModulo       := IntToStr(iModuloOrigem);

   // AL_36
   // testa o período junto à Contabilidade
   //AL_79
   if CtrlInvContab.TestaPeriodo(sDataLanc, iTipoInvestUsu) then
   begin
      sMascaraPlano := GetMascaraPlano(iPlano);

      sNoDoc := ''; // não há previsão...

      // divide o histórico em sub-históricos se exceder a quantidade de caracteres
      FuncaoGeral.ArrumaHistorico(sHistorico, sHist1, sHist2, sHist3, sHist4, sHist5);

      //Al_37 - 31/05/2005
      try
         // verifica se é obrigatório o preenchimento dos centros de custo; se não for, os passa em branco
         FuncaoGeral.TestaContaCC(False, iPlano, sContaD, sObrigaCC, sNome, sSubContaD);
         if sObrigaCC <> 'S' then sCentroCustoD := '';
         FuncaoGeral.TestaContaCC(False, iPlano, sContaC, sObrigaCC, sNome, sSubContaC);
         if sObrigaCC <> 'S' then sCentroCustoC := '';
      except
         on E: Exception Do
         begin
            sMensContab := E.Message;
            Result      := False;
            Exit;
         end;
      end;
      //Al_37 - Fim

      // verifica se deve passar a SubConta e decide qual
      with dtmOperComum.qryVerificaConta do begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('PLANO').AsInteger  := iPlano;
         ParamByName('CONTA').AsString   := Espaco(sContaD,18);
         Open;
         bPermiteSubConta := FieldByName('PLASUBCONTA').AsString = 'S';
         Close;
      end;

      if bPermiteSubConta then begin
         if iSubContaD > 0 then begin
            sSubContaD   := IntToStr(iSubContaD);
         end else begin
            case sRecPag[1] of
               'P':
               with dtmOperComum.qryBuscaForn do begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('EMPRESAFORN').AsInteger   := iEmpresaProp;
                  ParamByName('FORCLI').AsInteger        := iForCli;
                  ParamByName('PLANO').AsInteger         := iPlano;
                  Open;
                  if not(FieldByName('CODSUBCONTA').isNULL) then
                     sSubContaD := IntToStr(FieldByName('CODSUBCONTA').AsInteger);
                  Close;
               end;
               'R':
               with dtmOperComum.qryBuscaCli do begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('EMPRESAFORN').AsInteger   := iEmpresaProp;
                  ParamByName('FORCLI').AsInteger        := iForCli;
                  ParamByName('PLANO').AsInteger         := iPlano;
                  Open;
                  if not(FieldByName('CODSUBCONTA').isNULL) then
                     sSubContaD := IntToStr(FieldByName('CODSUBCONTA').AsInteger);
                  Close;
               end;
            end;
         end;
      end else begin
         sSubContaD  := '';
      end;

      with dtmOperComum.qryVerificaConta do begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('PLANO').AsInteger  := iPlano;
         ParamByName('CONTA').AsString   := sContaC;
         Open;
         bPermiteSubConta := FieldByName('PLASUBCONTA').AsString = 'S';
         Close;
      end;

      if bPermiteSubConta then begin
         if iSubContaC > 0 then begin
            sSubContaC   := IntToStr(iSubContaC);
         end else begin
            case sRecPag[1] of
               'P':
               with dtmOperComum.qryBuscaForn do begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('EMPRESAFORN').AsInteger   := iEmpresaProp;
                  ParamByName('FORCLI').AsInteger        := iForCli;
                  ParamByName('PLANO').AsInteger         := iPlano;
                  Open;
                  if not(FieldByName('CODSUBCONTA').isNULL) then sSubContaC := IntToStr(FieldByName('CODSUBCONTA').AsInteger);
                  Close;
               end;
               'R':
               with dtmOperComum.qryBuscaCli do begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('EMPRESAFORN').AsInteger   := iEmpresaProp;
                  ParamByName('FORCLI').AsInteger        := iForCli;
                  ParamByName('PLANO').AsInteger         := iPlano;
                  Open;
                  if not(FieldByName('CODSUBCONTA').isNULL) then sSubContaC := IntToStr(FieldByName('CODSUBCONTA').AsInteger);
                  Close;
               end;
            end;
         end;
      end else begin
         sSubContaC  := '';
      end;

      Screen.Cursor  := crHourGlass;

   {@A Verificar as variáveis de referência - liExercicio, liPeriodo}

      // AL_36 - Carrega as variaveis de periodo e exercicio
      CtrlInvContab.BuscaPeriodo(sDataLanc, liPeriodo, liExercicio);

      if sSubContaD = '' then
         iSubContaD := 0
      else
         iSubContaD := StrToInt(sSubContaC);
      if sSubContaC = '' then
         iSubContaC := 0
      else
         iSubContaC := StrToInt(sSubContaC);

      // AL_85 - O Centro de custo lançado a Débito e a Crédito são o mesmo, agora parametrizados no financeiro
      if not CtrlInvContab.InvLancaContabil(iPlano, iUnidNegoc,
                                            iSubContaD, iSubContaC,
                                            iPlanoPrev, iPatro, iPlanilha,
                                            0, sDataLanc, sNoDoc, sHist1, sHist2, sHist3, sHist4, sHist5, sTipoPer,
                                            sCentroCustoD, sContaD, sCentroCustoC, sContaC, '', fValorLanc,
                                            False, Sistema.UsaPlanoPatro, iModuloOrigem, iUsuarioOrigem, iEmpresaProp,
                                            sRecPag, CtrlInvContab.CriterioSegregacao, CtrlInvContab.DataCriterioSegrega) then
         Raise Exception.Create(CtrlInvContab.MessageInfo);
      iPlanilha := CtrlInvContab.Planilha;

      if iPlanilha <= 0 then begin
         Screen.Cursor := crDefault;
         if bMostraMsg then MensagemErroContab(iPlanilha);

      end else begin
         Result := True;
      end;

   end else begin
      Screen.Cursor := crDefault;
      // AL_36
      if bMostraMsg then
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtInformation, [mbOk], 0);
   end;

   Screen.Cursor := crDefault;
end;

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
function TOperComum.ProcEstorna(iDocumento, iPlanilha, iPlano : longint; dDataEstorno: TDateTime;
                                bMostraMsg : boolean) : Boolean;
var bTransacao: boolean;
begin
   //AL_86 - Ini
   Result := True;
   Try
      Try
         // verifica se já existe transação em andamento; se não houver, inicia uma
         if not(dtmBaseDados.dbBaseDados.inTransaction) then
         begin
            bTransacao := True;
            StartTransacao;
         end
         else
         begin
            bTransacao := False;
         end;

         // existindo documento, estorna tudo por aí...
         if iDocumento <> -1 then
         begin
            // Faz o Estorno no CAP/CAR e Contab
            CtrlInvContab.Documento.Estornar(dDataEstorno, Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                             iDocumento, 0, iPlano, Sistema.UsaPlanoPatro);
         end
         else
         begin
            // senão, estorna só na contabilidade
            if iPlanilha <> -1 then
            begin
               // AL_36
               // verifica se o estorno pode ser realizado
               //AL_79
               if CtrlInvContab.TestaPeriodo(DateToStr(dDataEstorno),iTipoInvestUsu) then
               begin
                  // Faz o estorno contábil em 3 camadas
                  if not CtrlInvContab.InvEstornaLanc(iPlanilha, dDataEstorno) then
                     Result := False;
               end
               else
               begin
                  MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtError, [mbOk], 0);
                  Result := False;
               end;
            end;
         end;
      except
         Screen.Cursor := crDefault;
         Result := False;
         if bMostraMsg then Raise;
      end;
   finally
      if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then
      begin
         if Result then
            CommitTransacao
         else
            RollBackTransacao;
      end;
   end;
   //AL_86 - Fim
end;

//--------------------------------------------------------------------------------------------------
//    Função com o processo de exclui os lançamentos de uma determinada Operação (Finceiro/Tesoura-
//          ria/Contabilidade)
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//
//--------------------------------------------------------------------------------------------------
// AL_13
function TOperComum.ProcExclui(iDocumento, iPlanilha, iPlano,iTipoInvest : longint;
                               dDataExclusao: TDateTime;
                               bMostraMsg : Boolean = True; bComita: Boolean = True) : Boolean;
Var
   sDataEstorno, sMensErro, sMascara   : string;
   // AL_36                  //AL_91
   bTransacao, bErroInterno, bIntegra: boolean;

begin
   Result       := True;
   bTransacao   := False;  // Indica se foi aberta uma transação local
   bErroInterno := True;  // Indica se o erro aconteceu nas exclusões dos históricos ou nos lançamentos

   //AL_91
   if iTipoInvestUsu = 8 then
      //AL_109
      bIntegra := CtrlPInv.IntFinContabBMF = 'S'
   else if iTipoInvestUsu = 2 then
      bIntegra := CtrlPInv.IntFinContabRV = 'S';

   Try
      //AL_34
      if (iDocumento <= 0) and (iPlanilha <= 0) then
         Exit;
      sDataEstorno   := FormatDateTime('dd/mm/yyyy', dDataExclusao);

      // verifica se o estorno pode ser realizado
      //AL_36
      //AL_79
      if not CtrlInvContab.TestaPeriodo(sDataEstorno, iTipoInvestUsu) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtInformation, [mbOk], 0);
         Result := False;
         Exit;
      end
      else
      begin
         // Se não passar o parametro, o valor é True
         if bComita then
         begin
            if not(dtmBaseDados.dbBaseDados.InTransaction) then
            begin
               DtmBaseDados.dbBaseDados.StartTransaction;
               bTransacao := True;
            end;
         end;

         with dtmOperComum, DMRendaVariavel do begin
            // HistCartinv - Limpa Planilha e Documento
            if iPlanilha > 0 then
            begin
               LimpaParametros(QryHistCartInv);
               QryHistCartInv.ParamByName('PLNCODIGO').AsInteger    := iPlanilha;
               QryHistCartInv.ExecSQL;
            end;

            //AL_91
            if bIntegra then
            begin
               LimpaParametros(qryUpdFinContBoleta);
               // AL_64
               if iDocumento > 0 then
                  qryUpdFinContBoleta.ParamByName('CODDOCUMENTO').AsInteger := iDocumento;
               if iPlanilha > 0 then
                  qryUpdFinContBoleta.ParamByName('PLNCODIGO').AsInteger    := iPlanilha;
               qryUpdFinContBoleta.ExecSQL;
            end;

            // IRLITIGIO - Limpa Planilha e Documento
            LimpaParametros(QryIrLitigio);
            QryIrLitigio.ParamByName('PLNCODIGO').AsInteger    := iPlanilha;
            QryIrLitigio.ExecSQL;
         end;

         // AL_86 - A partir daqui é erro na exclusão da Planiha ou do Documento
         bErroInterno := False;

         //AL_86 - Ini
         //AL_91
         // Exclui Documento da Tesouraria
         if (iDocumento > 0) and (bIntegra) then
         begin
            if not CtrlInvContab.Documento.Delete(iDocumento) then
               //AL_87
               Raise Exception.Create('Não foi possível excluir o Documento Financeiro' + #13 +
                                      'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);
         end;

         // Exclui Planilha da Contabilidade
         //AL_91
         if (iPlanilha > 0) and (bIntegra) then
         begin
            if not CtrlInvContab.InvExcluiLanc(iPlanilha, 0, Sistema.UsaPlanoPatro, False) then
               Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' + IntToStr(iPlanilha) + #13 +
                                      'Mensagem: ' + CtrlInvContab.MessageInfo);
         end;

         if bTransacao then
            DtmBaseDados.dbBaseDados.Commit;

      end;
   except on E: Exception do
      begin
         Screen.Cursor := crDefault;
         Result := False;
         // AL_13
         if bMostraMsg then
            // AL_68
            MsgDlg(IIF(bErroInterno,'Não foi possível o lançamento financeiro/contábil' + #13, '') +
                   E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
         if bTransacao then
            DtmBaseDados.dbBaseDados.Rollback;
      end;
   end;
end;

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
function TOperComum.EstornaOper(sBoleta            : String;
                                iTipoInvest, iOperacaoInvest, iInvestimento : Integer;
                                dDataEstorno       : TDateTime;
                                fValorPrimeiraCota : currency;
                                sEstExc            : string;
                                bMostraMsg         : boolean;
                                iIdTipoOperacao    : Integer = 0) : boolean;
Var
   qryAux         : TwwQuery;
   iPlanilha, iPlano, iDocumento, iIdHistCartInv : longint;
   fQtdRecDirParc : Double;
   dDataMov       : TDateTime;
begin
   Result       := True;
   try
      qryAux                    := TwwQuery.Create(Application);
      qryAux.DatabaseName       := 'BaseDados';

      // Exclui Transferências de Carteira da Boleta

      OperComum.LimpaParametros(dtmOperComum.qryBuscaBoletaTRC);
      with dtmOperComum.qryBuscaBoletaTRC do
      begin
         ParamByName('IDBOLETA').AsString  := sBoleta;
         Open;
         if not IsEmpty then
            OperComum.ProcExcluiCustodia(FieldByName('IDOPERCUSTODIA').AsInteger,
                                         FieldByName('IDHISTCARTINVORIG').AsInteger,
                                         FieldByName('IDHISTCARTINVDEST').AsInteger,
                                         FieldByName('DATAMOVCUSTOD').AsDateTime)
         else
            Close;
      end;
            
      OperComum.LimpaParametros(dtmOperComum.qryHistorico);
      with dtmOperComum.qryHistorico do
      begin
         ParamByName('dDataRef').AsString             := DateToStr(dDataEstorno);
         if iOperacaoInvest <> -1 then
            ParamByName('IDOPERACAOINVEST').AsInteger := iOperacaoInvest;
         ParamByName('IDTIPOINVEST').AsInteger        := iTipoInvest;
         if Trim(sBoleta) <> '' then
            ParamByName('NUMDOCUMENTO').AsString      := sBoleta;
         //AL_94
         ParamByName('IDINVESTIMENTO').AsInteger      := iInvestimento;            
         Open;

         if not dtmOperComum.qryHistorico.isEmpty then
         begin
            OperComum.LimpaParametros(dtmOperComum.qryOperacao);
            with dtmOperComum.qryOperacao do
            begin
               ParamByName('dDataRef').AsString        := DateToStr(dDataEstorno);
               if Trim(sBoleta) <> '' then
                  ParamByName('NUMDOCUMENTO').AsString := sBoleta;
               //AL_94
               ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;                  
               Open;

               frmAguarde.Pos := 0;
               frmAguarde.Max := dtmOperComum.qryHistorico.RecordCount+(dtmOperComum.qryOperacao.RecordCount*4);
               if Trim(sBoleta) <> '' then
                  frmAguarde.Mostra('Aguarde, Excluindo Boleta ' + sBoleta)
               else
                  frmAguarde.Mostra('Aguarde, Processando Exclusão de Operações...');
            end;

            dtmOperComum.qryHistorico.First;
            while not dtmOperComum.qryHistorico.EOF do
            begin
               if not(dtmOperComum.qryHistorico.FieldByName('CODDOCUMENTO').isNULL) then
                  iDocumento := dtmOperComum.qryHistorico.FieldByName('CODDOCUMENTO').asInteger
               else
                  iDocumento := -1;
               if not(dtmOperComum.qryHistorico.FieldByName('PLNCODIGO').isNULL) then
               begin
                  iPlanilha := dtmOperComum.qryHistorico.FieldByName('PLNCODIGO').asInteger;
                  iPlano    := dtmOperComum.qryHistorico.FieldByName('PLANO').asInteger;
               end
               else
               begin
                  iPlanilha := -1;
                  iPlano    := -1;
               end;

               if (iDocumento = 0) then
                  iDocumento := -1;

               if (iPlanilha  = 0) then
                  iPlanilha  := -1;

               if not ((iDocumento = -1) and (iPlanilha = -1)) then
               begin
                  if sEstExc = 'S' then
                  begin  // estorna lançamentos
                     if not ProcEstorna(iDocumento, iPlanilha,iPlano, dDataEstorno, bMostraMsg) then
                     begin
                        Result := false;
                        frmAguarde.Apaga;
                        Exit;
                     end;
                  end
                  else
                  begin  // exclui lançamentos  (comitando)
                     If not ProcExclui(iDocumento, iPlanilha, iPlano,-1,dDataEstorno, bMostraMsg) Then
                     begin
                        Result := false;
                        frmAguarde.Apaga;
                        Exit;
                     end;
                  end;
               end;
               dtmOperComum.qryHistorico.Next;
               frmAguarde.Pos := frmAguarde.Pos + 1;
            end;
         end;
      end;

      // Inicia exclusões
      If not dtmOperComum.qryHistorico.isEmpty then
      Begin
         dtmOperComum.qryOperacao.First;
         While Not dtmOperComum.qryOperacao.Eof Do
         Begin
            // levando em conta os registros que vão ser excluídos, marca as flags de recálculo
            MarcaFlgHistCustodia (-1,dtmOperComum.qryOperacao.FieldByName('IDOPERACAOINVEST').AsInteger,-1);
            dtmOperComum.qryOperacao.Next;
            frmAguarde.Pos := frmAguarde.Pos + 1;
         End;
         //AL_94
      End;
     // atualiza os saldos da carteira após o estorno
      AtualizaSaldos(fValorPrimeiraCota, -1);

   except on E: Exception do
      begin
         frmAguarde.Apaga;
         Result := false;
         MsgDlg('Ocorreu um problema no estorno da operação'+
                 E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         Screen.Cursor := crDefault;

      end;
   end;
   qryAux.Close;
   qryAux.Free;
   dtmOperComum.qryAuxiliar.Close;
   frmAguarde.Apaga;
end;

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

function TOperComum.AlimentaCarteira(iEmpresaProp, iModuloOrigem, iInvestimento, iTipoInvest,
                                     iOperacao, iLancImovel, iTipoOperacao, iCarteira,
                                     iCarteiraGerenc, iDespesaOperacao, iDespesaCarteira,
                                     iPlanilha, iDocumento,  iPlano : integer;
                                     dDataOper                      : TDateTime;
                                     fValorOperacao                 : currency;
                                     fQtdInvestOperacao             : Double;
                                     fValorPrimeiraCota, fValorVariacao, fValorJuros,
                                     fValorIRProv, fValorIRApu, fValorIOFProv, fValorIOFApu,
                                     fValorAgio,fVlrCPMFProv,fVlrCMPFApu  : currency;
                                     sNaturMov, sNaturOper, sLote, sHistorico, sTipoMov,
                                     sFlgCustodia, sRecPag          : string;
                                     bMostraMsg                     : boolean;
                                     iIdCorretValores, iIdPlanPrevCtbPatr : integer;
  var iIdHistCartInv:Integer): boolean;
var
   fValorCota, fSaldoInicialCotas, fValorPremio : double;
   fSaldoInicialValor, fQtdeInicialInvest       : double;
   //AL_17 - 02/02/2005
   fSaldoFinalCotas, fNulo                      : double;
   fQtdeInicialCPMF, fQtdeFinalCPMF             : double;
   sTipoAtualizacao, sMensagem                  : string;
   //AL_43
   qryTipoOper : TwwQuery;
   //AL_51
   iIdHistCartIni : Integer;
   dDataOperIni : TDateTime;
   // AL_83
   CtrlRV: TCtrlRendaVariavel;
   //Ricardo Cristiano - 24/09/2008 - N. Sol 96592 -  N. Kintana 418922
   sSql : String;
begin
   Result             := True;
   fNulo              := 0;
   fSaldoInicialCotas := 0;
   fSaldoFinalCotas   := 0;
   fValorCota         := 0;

   // para evitar qq Access Violation que pudesse ocorrer
   if length(trim(sNaturMov))  = 0 then sNaturMov  := ' ';
   if length(trim(sNaturOper)) = 0 then sNaturOper := ' ';

   try {...Finally}

      CtrlRV :=  TCtrlRendaVariavel.Create;
      CtrlRV.InitializeAs(Padroes);

      //AL_5 - Capta FLGCONTAINVEST do Tipo de Operação
      qryTipoOper := TwwQuery.Create(Application);
      qryTipoOper.DataBaseName := 'BASEDADOS';
      qryTipoOper.SQL.Add('SELECT FLGCONTAINVEST ');
      qryTipoOper.SQL.Add('FROM   TIPOOPERACAO ');
      qryTipoOper.SQL.Add('WHERE  IDTIPOINVEST = 2 ');
      qryTipoOper.SQL.Add('  AND  IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao));
      qryTipoOper.Open;

      try {...Except}

         // Testa a consistência dos parâmetros passados;
         // se estiverem OK, define as outras variáveis necessárias a partir dos mesmos
         if not(VerificaParametros(iInvestimento, iTipoInvest, iOperacao,
                iTipoOperacao, iCarteira, iDespesaOperacao, iDespesaCarteira,
                fValorPrimeiraCota, sNaturMov)) then
         begin
            if bMostraMsg then MsgDlg('Parâmetros inconsistentes (Movimentação da Carteira)!', 'Erro', mtError, [mbOk], 0);
            Result := False;
            Exit;
         end;

         // Se a natureza indicar que não há alimentação da carteira, sai (com Result = True)
         if sNaturMov[1] = 'N' then Exit;

         // AL_7 - Replica saldos diariamente
         // Se (Valor = 0 _e_ Qtde = 0), sai (com Result = True)
         if (fValorOperacao = 0) and (fQtdInvestOperacao = 0) and (sNaturMov <> 'X') then
             Exit;
         //AL_43

         // Verificação do saldo do INVESTIMENTO
         fQtdeInicialInvest   := 0;
         //AL_5
         fQtdeInicialCPMF     := 0;

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
         case sNaturMov[1] of

            'A': // Aumenta quantidade de cotas (Compra)
            begin
               //AL_5
               if qryTipoOper.FieldByName('FLGCONTAINVEST').AsInteger = 1 then
                  fQtdeFinalCPMF := fQtdeInicialCPMF
               else
                  fQtdeFinalCPMF := fQtdeInicialCPMF + fQtdInvestOperacao;
            end;

            'C': // Mantém saldos e atualiza SaldoVlrInvCart
            begin
               //AL_5
               fQtdeFinalCPMF := fQtdeInicialCPMF
            end;

            'D': // Diminui quantidade de cotas (Venda)
            begin
               if iTipoInvest <> 8 then // BM&F
               begin
                  fValorOperacao    := (fValorOperacao * -1);
                  //AL_5
                  if qryTipoOper.FieldByName('FLGCONTAINVEST').AsInteger = 1 then
                     fQtdeFinalCPMF := fQtdeInicialCPMF
                  else
                     fQtdeFinalCPMF := fQtdeInicialCPMF - fQtdInvestOperacao;
               end;
            end;

            'E': // Despesa
            case sNaturOper[1] of
               'A', 'D':
               // Operacao = Compra('C') ou Venda('V'), aumenta qtde Cotas mas NÃO altera qtde Investimento
               begin
                  //AL_5
                  fQtdeFinalCPMF       := fQtdeInicialCPMF
               end;

               'O', 'U':
               // Operacao = Venda(O) ou Compra(U) de Opção(O), NÃO altera qtde, diminui valores
               begin
                  //AL_5
                  fQtdeFinalCPMF       := fQtdeInicialCPMF;
                  fValorOperacao       := (fValorOperacao * -1);
                  fQtdInvestOperacao   := 0;
               end;

            else
               // O primeiro movimento DEVE aumentar o nº de cotas
               if bMostraMsg then begin
                  sMensagem := 'Natureza de Operação não Prevista. ';
                  MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
               end;
               // Sai, (com Result = False)
               Result := False;
               Exit;
            end;

            'G': // Aumento da Cotacao do Investimento (Ganho)
            begin
               fQtdInvestOperacao   := 0;
               //AL_5
               fQtdeFinalCPMF       := fQtdeInicialCPMF
            end;

            'I': // Diminui valor da cota (Baixa Parcial - Imobiliário(?))
            begin
               fValorOperacao       := fValorOperacao * (-1);
               //AL_5
               fQtdeFinalCPMF       := fQtdeInicialCPMF
            end;

               //'L','O','R': // Aumenta valor da cota (Venda de Opção / Lucro / Rendimento)
            'L','R': // Aumenta valor da cota (Venda de Opção / Lucro / Rendimento)
            begin
               fQtdInvestOperacao   := 0;
               //AL_5
               fQtdeFinalCPMF       := fQtdeInicialCPMF
            end;

            'P': // Diminuição da Cotacao do Investimento (Perda)
            begin
               fValorOperacao       := fValorOperacao * (-1);
               fQtdInvestOperacao   := 0;
               //AL_5
               fQtdeFinalCPMF       := fQtdeInicialCPMF
            end;

            'O': // Aumenta valor da cota (Venda de Opção / Lucro / Rendimento)
            begin
               fQtdInvestOperacao       := fQtdInvestOperacao;
               //AL_5
               if qryTipoOper.FieldByName('FLGCONTAINVEST').AsInteger = 1 then
                  fQtdeFinalCPMF := fQtdeInicialCPMF
               else
                  fQtdeFinalCPMF := fQtdeInicialCPMF + fQtdInvestOperacao;
            end;

            'U': // Diminui valor da cota (Compra de Opção)
            begin
               //AL_5
               if qryTipoOper.FieldByName('FLGCONTAINVEST').AsInteger = 1 then
                  fQtdeFinalCPMF := fQtdeInicialCPMF
               else
                  fQtdeFinalCPMF := fQtdeInicialCPMF + fQtdInvestOperacao;
            end;

            'F': // Mantém o valor da cota conforme o lancamento (Grupamento)
            begin
               //AL_104
               //AL_5
               if qryTipoOper.FieldByName('FLGCONTAINVEST').AsInteger = 1 then
                  fQtdeFinalCPMF := fQtdeInicialCPMF
               else
                  fQtdeFinalCPMF := fQtdInvestOperacao;

            end

         else
            fValorOperacao    := 0;
            //AL_5
            fQtdeFinalCPMF    := fQtdeInicialCPMF
         end;
         //AL_17 - Fim

         // FIM do Cálculo dos saldos finais ----------------------------------------------------------------

         // Por default, é inclusão
         sTipoAtualizacao := 'I';

         // DOP - Despesa da Operação, LUC - Lucro
         if (sTipoMov = 'DOP') or (sTipoMov = 'LUC') then begin

            with dtmOperComum.qryBuscaHistDesp do begin
               Close;
               if not(Prepared) then Prepare;
               ParamByName('DESPESA').AsInteger := iDespesaOperacao;
               Open;

               if not(isEmpty) then sTipoAtualizacao := 'A';

               Close;
            end;

         end else begin

            // OPE - Operação
            if sTipoMov = 'OPE' then begin

               with dtmOperComum.qryBuscaHistOper do begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('OPERACAO').AsInteger := iOperacao;
                  Open;

                  if not(isEmpty) then sTipoAtualizacao := 'A';

                  Close;
               end;
            end;

         end;

// FIM da Decisão do tipo de atualização -----------------------------------------------------------

// @X Inclusão de Registro na HistCartInv ----------------------------------------------------------

         if sTipoAtualizacao = 'I' then begin

            // Ajusta Flag de Custódia
            if sFlgCustodia <> '' then begin
               with dtmOperComum.qryBuscaCustodia do begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('TIPOINVEST').AsInteger := iTipoInvest;
                  ParamByName('TIPOOPER').AsInteger   := iTipoOperacao;
                  Open;

                  if ( not(isEmpty) and (FieldByName('TIPOCUSTODIA').AsString = 'N') ) then sFlgCustodia := '';
                  Close;
               end;
            end;

            with dtmOperComum.qryInsertHistCartInv do begin
//Ricardo Cristiano - 24/09/2008 - N. Sol 96592 -  N. Kintana 418922
//               Close;
//               OperComum.LimpaParametros(dtmOperComum.qryInsertHistCartInv);
//               if not(Prepared) then Prepare;

               iIdHistCartInv := LeUltRegistro(nil, 'HISTCARTINV');

               // Passa como NULL os parâmetros, quando necessário
               // não há preocupação aqui em verificar quais parâmetros _podem_ ser nulos...
//Ricardo Cristiano - 24/09/2008 - N. Sol 96592 -  N. Kintana 418922
{               ParamByName('CARTEIRA').AsInteger      := iCarteira;         if iCarteira = -1        then ParamByName('CARTEIRA').Clear;
               ParamByName('IDCARTEIRAGERENC').AsInteger:= iCarteiraGerenc;   if iCarteiraGerenc = 0   then ParamByName('IDCARTEIRAGERENC').Clear;
               ParamByName('INVESTIMENTO').AsInteger  := iInvestimento;     if iInvestimento = -1    then ParamByName('INVESTIMENTO').Clear;
               ParamByName('DESPESAINVEST').AsInteger := iDespesaOperacao;  if iDespesaOperacao = -1 then ParamByName('DESPESAINVEST').Clear;
               ParamByName('DESPESACART').AsInteger   := iDespesaCarteira;  if iDespesaCarteira = -1 then ParamByName('DESPESACART').Clear;
               ParamByName('OPERACAO').AsInteger      := iOperacao;         if iOperacao = -1        then ParamByName('OPERACAO').Clear;
               ParamByName('TIPOINVEST').AsInteger    := iTipoInvest;       if iTipoInvest = -1      then ParamByName('TIPOINVEST').Clear;
               //AL_16
               ParamByName('TIPOOPER').AsInteger      := iTipoOperacao;
               ParamByName('PLANILHA').AsInteger      := iPlanilha;         if iPlanilha <= 0        then ParamByName('PLANILHA').Clear;
               ParamByName('DOCUMENTO').AsInteger     := iDocumento;        if iDocumento = -1       then ParamByName('DOCUMENTO').Clear;
               ParamByName('PLANO').AsInteger         := iPlano;            if iPlano = -1           then ParamByName('PLANO').Clear;
               ParamByName('LANCAMENTO').AsInteger    := iLancImovel;       if iLancImovel = -1      then ParamByName('LANCAMENTO').Clear;

               // Preenche os outros parametros ..
               ParamByName('EMPRESAPROP').AsInteger   := iEmpresaProp;
               ParamByName('MODULO').AsInteger        := iModuloOrigem;
               ParamByName('HISTMOVCARTINV').AsString := copy(sHistorico, 1, 59);
               ParamByName('NATURMOVCARTINV').AsString:= sNaturMov;
               ParamByName('NATURMOVOPER').AsString   := sNaturOper;
               ParamByName('LOTE').AsString           := sLote;
               ParamByName('TIPMOVCARTINV').AsString  := sTipoMov;
               ParamByName('RECPAG').AsString         := sRecPag;
               ParamByName('DATA').AsDateTime         := dDataOper;
               ParamByName('MOVIMENTO').AsFloat       := fValorOperacao;
               ParamByName('QUANTIDADE').AsFloat      := fQtdInvestOperacao;
               ParamByName('COTAS').AsFloat           := 0;
               ParamByName('FLGCALCSALDO').AsString   := '2';
               ParamByName('FLGCUSTODIA').AsString    := sFlgCustodia;
               ParamByName('VLRVARIACAO').AsFloat     := fValorVariacao;
               ParamByName('VLRJUROS').AsFloat        := fValorJuros;
               ParamByName('VLRIRPROV').AsFloat       := fValorIRProv;
               ParamByName('VLRIRAPU').AsFloat        := fValorIRApu;
               ParamByName('VLRIOFPROV').AsFloat      := fValorIOFProv;
               ParamByName('VLRIOFAPU').AsFloat       := fValorIOFApu;
               ParamByName('VLRAGIO').AsFloat         := fValorAgio;
               ParamByName('VLRCPMFPROV').AsFloat     := fVlrCPMFProv;
               ParamByName('VLRCPMFAPU').AsFloat      := fVlrCMPFApu;
               //AL_11
               ParamByName('IDCORRETVALORES').AsInteger   := iIdCorretValores;
               if iIdCorretValores   <= 0 then
                  ParamByName('IDCORRETVALORES').Clear;
               ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanPrevCtbPatr;
               if iIdPlanPrevCtbPatr <= 0 then
                  ParamByName('IDPLANPREVCTBPATR').Clear;
               //AL_11 - Fim
               //AL_5
               ParamByName('SALDOQTDECPMF').AsFloat   := fQtdeFinalCPMF;}
//Ricardo Cristiano - 24/09/2008 - N. Sol 96592 -  N. Kintana 418922
               sSql := '';
               sSql := sSql +'INSERT INTO HISTCARTINV '+
                             '(IDHISTCARTINV, IDCARTEIRAINVEST, IDCARTEIRAGERENC, '+
                             ' IDINVESTIMENTO, IDDESPOPERINVEST, IDDESPCARTINVEST, '+
                             ' IDOPERACAOINVEST, IDTIPOINVEST, IDTIPOOPERACAO, '+
                             ' PLNCODIGO, CODDOCUMENTO, PLANO, IDLANCIMOVEL, '+
                             ' IDEMPRESAPROP, IDMODULO, HISTMOVCARTINV, '+
                             ' NATURMOVCARTINV, NATURMOVOPER, IDLOTE, '+
                             ' TIPMOVCARTINV, RECPAG, DATAMOVCARTINV, '+
                             ' VLRMOVCARTINV, QTDEMOVINVCART, COTASMOVCARTINV, '+
                             ' FLGCALCSALDO, FLGCUSTODIA, '+
                             ' VLRVARIACAO, VLRJUROS, VLRIRPROV, '+
                             ' VLRIRAPU, VLRIOFPROV, VLRIOFAPU, '+
                             ' VLRAGIO, VLRCPMFPROV, VLRCPMFAPU, '+
                             ' IDCORRETVALORES, IDPLANPREVCTBPATR, SALDOQTDECPMF) '+
                             ' VALUES ';

               sSql := sSql +'(';

               sSql := sSql+IntToStr(iIdHistCartInv)+',';
               if iCarteira > 0 then
                  sSql := sSql+IntToStr(iCarteira)+','
               else
                  sSql := sSql+'NULL,';
               if iCarteiraGerenc > 0 then
                  sSql := sSql+IntToStr(iCarteiraGerenc)+','
               else
                  sSql := sSql+'NULL,';
               if iInvestimento > 0 then
                  sSql := sSql+IntToStr(iInvestimento)+','
               else
                  sSql := sSql+'NULL,';
               if iDespesaOperacao > 0 then
                  sSql := sSql+IntToStr(iDespesaOperacao)+','
               else
                  sSql := sSql+'NULL,';
               if iDespesaCarteira > 0 then
                  sSql := sSql+IntToStr(iDespesaCarteira)+','
               else
                  sSql := sSql+'NULL,';
               if iOperacao > 0 then
                  sSql := sSql+IntToStr(iOperacao)+','
               else
                  sSql := sSql+'NULL,';
               if iTipoInvest > 0 then
                  sSql := sSql+IntToStr(iTipoInvest)+','
               else
                  sSql := sSql+'NULL,';

               sSql := sSql+IntToStr(iTipoOperacao)+',';

               if iPlanilha > 0 then
                  sSql := sSql+IntToStr(iPlanilha)+','
               else
                  sSql := sSql+'NULL,';
               if iDocumento > 0 then
                  sSql := sSql+IntToStr(iDocumento)+','
               else
                  sSql := sSql+'NULL,';

               if iPlano > 0 then
                  sSql := sSql+IntToStr(iPlano)+','
               else
                  sSql := sSql+'NULL,';

               if iLancImovel > 0 then
                  sSql := sSql+IntToStr(iLancImovel)+','
               else
                  sSql := sSql+'NULL,';

               sSql := sSql+IntToStr(iEmpresaProp)+',';
               sSql := sSql+IntToStr(iModuloOrigem)+',';
               sSql := sSql+QuotedStr(copy(sHistorico, 1, 59))+',';
               sSql := sSql+QuotedStr(sNaturMov)+',';
               sSql := sSql+QuotedStr(sNaturOper)+',';

               sSql := sSql+QuotedStr(sLote)+',';
               sSql := sSql+QuotedStr(sTipoMov)+',';
               sSql := sSql+QuotedStr(sRecPag)+',';

               sSql := sSql+'TO_DATE('+QuotedStr(DateToStr(dDataOper))+','+QuotedStr('DD/MM/YYYY')+'),';

               sSql := sSql+ TrocaVirgulaPonto(FloatToStr(fValorOperacao))+',';
               sSql := sSql+ TrocaVirgulaPonto(FloatToStr(fQtdInvestOperacao))+',';
               sSql := sSql+ '0,';
               sSql := sSql+ QuotedStr('2')+',';
               sSql := sSql+QuotedStr(sFlgCustodia)+',';

               sSql := sSql+ TrocaVirgulaPonto(FloatToStr(fValorVariacao))+',';
               sSql := sSql+ TrocaVirgulaPonto(FloatToStr(fValorJuros))+',';
               sSql := sSql+ TrocaVirgulaPonto(FloatToStr(fValorIRProv))+',';
               sSql := sSql+ TrocaVirgulaPonto(FloatToStr(fValorIRApu))+',';
               sSql := sSql+ TrocaVirgulaPonto(FloatToStr(fValorIOFProv))+',';
               sSql := sSql+ TrocaVirgulaPonto(FloatToStr(fValorIOFApu))+',';
               sSql := sSql+ TrocaVirgulaPonto(FloatToStr(fValorAgio))+',';
               sSql := sSql+ TrocaVirgulaPonto(FloatToStr(fVlrCPMFProv))+',';
               sSql := sSql+ TrocaVirgulaPonto(FloatToStr(fVlrCMPFApu))+',';
               if iIdCorretValores > 0 then
                  sSql := sSql+IntToStr(iIdCorretValores)+','
               else
                  sSql := sSql+'NULL,';

               if iIdPlanPrevCtbPatr > 0 then
                  sSql := sSql+IntToStr(iIdPlanPrevCtbPatr)+','
               else
                  sSql := sSql+'NULL,';

               sSql := sSql+ TrocaVirgulaPonto(FloatToStr(fQtdeFinalCPMF));

               sSql := sSql +')';

               OperComum.LimpaParametros(dtmOperComum.qryInsertHistCartInv);
               dtmOperComum.qryInsertHistCartInv.sql.clear;
               dtmOperComum.qryInsertHistCartInv.sql.Add(sSql);
               dtmOperComum.qryInsertHistCartInv.ExecSQL;
//Ricardo Cristiano - 24/09/2008 - N. Sol 96592 -  N. Kintana 418922
            end;
            // FIM de Inclusão de Registro na HistCartInv ------------------------------------------------------
         end
         else
         begin
            // @X Update de Registro na HistCartInv ------------------------------------------------------------

            // Despesa ou Lucro
            if ( (sTipoMov = 'DOP') or (sTipoMov = 'LUC') ) then begin

               with dtmOperComum.qryUpdateHistPorDesp do begin
                  Close;
                  if not(Prepared) then Prepare;

                  ParamByName('DESPESA').AsInteger    := iDespesaOperacao;
                  ParamByName('DATA').AsDateTime      := dDataOper;
                  ParamByName('MOVIMENTO').AsFloat    := fValorOperacao;
                  ParamByName('QUANTIDADE').AsFloat   := fQtdInvestOperacao;
                  ParamByName('VLRVARIACAO').AsFloat  := fValorVariacao;
                  ParamByName('VLRJUROS').AsFloat     := fValorJuros;
                  ParamByName('VLRIRPROV').AsFloat    := fValorIRProv;
                  ParamByName('VLRIRAPU').AsFloat     := fValorIRApu;
                  ParamByName('VLRIOFPROV').AsFloat   := fValorIOFProv;
                  ParamByName('VLRIOFAPU').AsFloat    := fValorIOFApu;
                  ParamByName('VLRAGIO').AsFloat      := fValorAgio;
                  //AL_5
                  ParamByName('SALDOQTDECPMF').AsFloat := fQtdeFinalCPMF;
                  ExecSQL;
               end;

            // Operação
            end else if sTipoMov = 'OPE' then begin

               with dtmOperComum.qryUpdateHistPorOper do begin
                  Close;
                  if not(Prepared) then Prepare;

                  ParamByName('OPERACAO').AsInteger := iOperacao;
                  ParamByName('DATA').AsDateTime      := dDataOper;
                  ParamByName('MOVIMENTO').AsFloat    := fValorOperacao;
                  ParamByName('QUANTIDADE').AsFloat   := fQtdInvestOperacao;
                  ParamByName('VLRVARIACAO').AsFloat  := fValorVariacao;
                  ParamByName('VLRJUROS').AsFloat     := fValorJuros;
                  ParamByName('VLRIRPROV').AsFloat    := fValorIRProv;
                  ParamByName('VLRIRAPU').AsFloat     := fValorIRApu;
                  ParamByName('VLRIOFPROV').AsFloat   := fValorIOFProv;
                  ParamByName('VLRIOFAPU').AsFloat    := fValorIOFApu;
                  ParamByName('VLRAGIO').AsFloat      := fValorAgio;
                  //AL_5
                  ParamByName('SALDOQTDECPMF').AsFloat := fQtdeFinalCPMF;
                  ExecSQL;
               end;

            end;

         end;

// FIM ---------------------------------------------------------------------------------------------

      except
         Result := False;
         // AL_95
      end;


   finally
      dtmOperComum.qrySaldoCarteira.Close;
      dtmOperComum.qryBuscaHistDesp.Close;
      dtmOperComum.qryBuscaHistOper.Close;
      dtmOperComum.qryBuscaCustodia.Close;
      dtmOperComum.qryInsertHistCartInv.Close;
      dtmOperComum.qryUpdateHistPorDesp.Close;
      dtmOperComum.qryUpdateHistPorOper.Close;
      //AL_83
      FreeAndNil(qryTipoOper);
      FreeAndNil(CtrlRV);
   end;
end;

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
function TOperComum.AtualizaSaldos(fValorPrimeiraCota: currency; dDataFinal: TDateTime): boolean;
Var
  //AL_49  
  fValorCota, fSaldoInicialCotas, fSaldoInicialValor, fQtdeInicialInvest, fValorVariacao,
  fValorInicialInvest, fSaldoFinalCotas, fSaldoFinalValor, //fQtdeFinalInvest,
  wSaldoQtdCPMF, fQtdeInicialCPMF, fQtdeFinalCPMF,
  fValorFinalInvest, fValorOperacao, fValorCotasOperacao, fQtdInvestOperacao, wSaldoInutil,
  wSaldoQtdInvest, wSaldoVlrInvest, wVlrMovimento, wCotMovimento, fValorAgio : Double;
  wSaldoAtuAnt, wSaldoAtu, wSaldoAquiAnt, wSaldoAqui, wSaldoRendAnt, wTotDespOper, wVlrMovOperacao,
  wSaldoMercadoAnt, wSaldoRend, wMovimCar, wVlrTotVendido, wQtdMovOperacao : Double;
  wSaldoCarAnt, wSaldoCar, wQtdInvestAnt, wMovimAtu, wMovimAqui, wCotaMoeda,
  wMovimJur, wSaldoJur, wSaldoJurant, wMovimPre, wSaldoPre, wSaldoPreAnt,
  wMovimVar, wSaldoVar, wSaldoVarant, fValorMovimAqui,
  wMovimIRProv,  wSaldoIRProv,  wSaldoIRProvant,  wMovimIRApu,  wSaldoIRApu,  wSaldoIRApuAnt,
  wMovimIOFProv, wSaldoIOFProv, wSaldoIOFProvant, wMovimIOFApu, wSaldoIOFApu, wSaldoIOFApuAnt,
  wMovimAgio,    wSaldoAgio   , wSaldoAgioant : Double;
  QrySaldoCarteira, qrySaldoInvest, qryAtualizaSaldoC, qryAtualizaSaldoI,
  qryFlgAtualSaldo: TwwQuery;
  wFlgCalcSaldo, wTipoMov , Mensagem, sLote, wTipoAtualizacao: String;
  wFlgSair, cNaturezaMovimento,  cNaturezaOPDesp, wDec: Char;
  cNaturezaOPeracao : String;
  iInvestimento, iCarteira, iCarteiraGerenc, iHistorico, iMoeda : LongInt;
  dDataOper, dDataMov, dDataCotacao,DataCotacao,dDataOperProx: TDateTime;
  QryLocal, QryLocal1 :TwwQuery;
  iIdTipoOperacao, wIdCarteira, wIdInvestimento, wIdLancamento :Integer;
  bCriaqryAtualizaSaldoI : Boolean;
  iTipoInvest,iIdTipoDespInvest: longint;
  PERCENTUAL, MOVIMAQUI,  QTDEMOVINVCART : Double;
  fSaldoQtd,fSaldoVlr,fSaldoAqui,fSaldoRend,fSaldoVariacao,fSaldoIrApu,fSaldoInutil,fSdoAtu,fSdoCar : Double;
  //AL_42
  fVlrDifCusto : Double;
  //AL_77
  wSaldoProvPerda, wSaldoProvPerdaAnt, wMovimProvPerda, fSaldoProvPerda, fPercProvPerda, fSaldoPP: Double;
  // AL_83
  CtrlRendaVariavel: TCtrlRendaVariavel;
  iPlanoPatro: Integer;
begin
   //--Emerson--//
   fQtdeFinalInvest := 0;

   bCriaqryAtualizaSaldoI := False;

   wCotMovimento          := 0;
   // Busca Moeda Atuarial
   //AL_109
   iMoeda := CtrlPInv.MoedaAtu;
   // Caso a Moeda Atuarial não tenha sido cadastrada, Sai .
   if iMoeda = 0 then
   begin
      MsgDlg('Saldos não Atualizados... Cadastre Moeda Atuarial nos Parâmetros do Sistema','Erro',mtError,[mbOK],0);
      Exit;
   end;
   // Inicia Variaveis
   Result := True;

   try
      //AL_83 - Estes objetos devem ser criados dentro do bloco try/finally
      // Cria Objetos Locais
      QryLocal               := TwwQuery.Create(Application);
      QryLocal.DatabaseName  := 'BaseDados';

      QryLocal1              := TwwQuery.Create(Application);
      QryLocal1.DatabaseName := 'BaseDados';

      CtrlRendaVariavel := TCtrlRendaVariavel.Create;
      CtrlRendaVariavel.InitializeAs(Padroes);

      // PROCESSA REGISTROS COM O FLAG 1 / 3 / 4 ENQUANTO EXISTIREM
      while True Do
      begin
         Try
            // Abre a query que Busca os Registros
            QryFlgAtualSaldo := TwwQuery(dtmOperacaoInvest.qryFlgAtualSaldo13);
            with QryFlgAtualSaldo do
            begin
               Close;
               Open;
               First;
            end;
            // Caso não existam mais, sai da Rotina e atualiza Invesimentos
            if QryFlgAtualSaldo.IsEmpty then
               Break
            else
            begin
               // Testa se So Existem Registros com Flg 4.
               wFlgSair := 'S';
               while not QryFlgAtualSaldo.Eof do
               begin
                  if QryFlgAtualSaldo.FieldByName('FLGCALCSALDO').AsInteger <> 4 then
                  begin
                     wFlgSair := 'N';
                     Break;
                  end;
                  QryFlgAtualSaldo.Next;
               end;
               if wFlgSair = 'S' Then
                  Break;
               // Caso existam guarda dados
               iCarteira      := qryFlgAtualSaldo.FieldByName('IDCARTEIRAINVEST').AsInteger;
               iCarteiraGerenc:= qryFlgAtualSaldo.FieldByName('IDCARTEIRAGERENC').AsInteger;
               dDataOper      := qryFlgAtualSaldo.FieldByName('DATAMOVCARTINV').AsDateTime;
               iHistorico     := qryFlgAtualSaldo.FieldByName('IDHISTCARTINV').AsInteger;
               iInvestimento  := qryFlgAtualSaldo.FieldByName('IDINVESTIMENTO').AsInteger;
               iTipoInvest    := qryFlgAtualSaldo.FieldByName('IDTIPOINVEST').AsInteger;
               cNaturezaMovimento := qryFlgAtualSaldo.FieldByName('NATURMOVCARTINV').AsString[1];
            end;
            // Busca registros de HistCartInv que devem ter saldos atualizados
            If iCarteiraGerenc <> 0 Then
               qryAtualizaSaldoC:= TwwQuery(dtmOperacaoInvest.qryAtualizaSaldoC)
            Else
               qryAtualizaSaldoC:= TwwQuery(dtmOperacaoInvest.qryAtualizaSaldoCNull);

            with qryAtualizaSaldoC do
            begin
               Close;
               ParamByName('IDCARTEIRA').asInteger  := iCarteira;
               If iCarteiraGerenc <> 0 Then
                  ParamByName('IDCARTEIRAGERENC').asInteger  := iCarteiraGerenc;
               ParamByName('DATAMOV').asDateTime    := dDataOper;
               ParamByName('IDHISTORICO').asInteger := iHistorico;
               Open;
               First;
            end;
            fSaldoInicialCotas:=0;
            //******************************************************************************
            // ATUALIZA SALDOS DOS REGISTROS DAS CARTEIRAS
            while (not QryAtualizaSaldoC.EOF) do
            begin
               // Caso Data Final passada e data Maior que Final sai
               if (dDataFinal <> -1) And (dDataFinal > QryAtualizaSaldoC.FieldByName('DATAMOVCARTINV').AsDateTime) then
               begin
                 Break;
               end;
               // Guarda Dados
               fValorCotasOperacao:= 0;
               fValorOperacao     := QryAtualizaSaldoC.FieldByName('VLRMOVCARTINV').AsFloat;
               cNaturezaMovimento := QryAtualizaSaldoC.FieldByName('NATURMOVCARTINV').AsString[1];
               iTipoInvest        := QryAtualizaSaldoC.FieldByName('IDTIPOINVEST').AsInteger;
               iIdTipoDespInvest  := QryAtualizaSaldoC.FieldByName('IDTIPODESPINVEST').AsInteger;
               fValorMovimAqui    := QryAtualizaSaldoC.FieldByName('MOVIMAQUI').AsFloat;
               iIdTipoOperacao    := QryAtualizaSaldoC.FieldByName('IDTIPOOPERHIST').AsInteger;
               cNaturezaOPeracao  := dtmOperComum.qryAtualizaSaldoCNATURMOVOPER.AsString;
               wTipoMov           := QryAtualizaSaldoC.FieldByName('TIPMOVCARTINV').AsString;

               // Guarda Dados nas Variaveis de DeBug
               wIdCarteira     := QryAtualizaSaldoC.FieldByName('IDCARTEIRAINVEST').AsInteger;
               wIdInvestimento := QryAtualizaSaldoC.FieldByName('IDINVESTIMENTO').AsInteger;
               wIdLancamento   := QryAtualizaSaldoC.FieldByName('IDHISTCARTINV').AsInteger;

               // Guarda os Valores da Operacao e de Cotas
               wVlrMovimento:=fValorOperacao;

               //******************************************************************************
               // CASO SEJA TRANSFERENCIA (NA CARTEIRA)
               If (wTipoMov = 'TRF') Then
               begin
                  // Caso Diminua (D)
                  If (cNaturezaMovimento = 'D') Then
                  begin
                     // Busca ultimo Saldo deste Investimento
                     //AL_2
                     //AL_5
                     //AL_71
                     //AL_75
                     //AL_78
                     //AL_83 - BuscaSaldos em 3 camadas
                     CtrlRendaVariavel.BuscaSaldoRV.Executa(QryAtualizaSaldoC.FieldByName('DATAMOVCARTINV').AsDateTime,
                                                            QryAtualizaSaldoC.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                            QryAtualizaSaldoC.FieldByName('IDINVESTIMENTO').AsInteger,
                                                            QryAtualizaSaldoC.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                            QryAtualizaSaldoC.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                            9999999, QryAtualizaSaldoC.FieldByName('IDCUSTODIANTE').AsInteger,
                                                            QryAtualizaSaldoC.FieldByName('IDLOTE').AsString);
                     wSaldoQtdInvest := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal;
                     wSaldoVlrInvest := CtrlRendaVariavel.BuscaSaldoRV.SaldoVlrTotal;
                     wSaldoQtdCPMF := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCC;


                     // Calcula Valor da Movimentacao e Altera Variavel de Calculo Interno (fValorOperacao)
                     wVlrMovimento:=( (QryAtualizaSaldoC.FieldByName('QTDEMOVINVCART').AsFloat*
                                      (wSaldoVlrInvest/wSaldoQtdInvest)) *-1);
                     fValorOperacao:=wVlrMovimento;
                  end;
                  // Caso Aumente (A)
                  If (cNaturezaMovimento = 'A') Then
                  begin
                     // Busca Ultimo Lancamento que Diminui de Transferencia
                     FazQuery(QryLocal,
                       'SELECT  VLRMOVCARTINV                    '+
                       'FROM HISTCARTINV                      '+
                       'WHERE 	(TIPMOVCARTINV    = ''TRF'') AND '+
                       '        (NATURMOVCARTINV  = ''D'')   AND '+
                       '      	(IDOPERACAOINVEST = '+
                       QuotedStr(QryAtualizaSaldoC.FieldByName('IDOPERACAOINVEST').AsString)+')');
                     // Calcula Valor da Movimentacao
                     wVlrMovimento:=((QryLocal.FieldByName('VLRMOVCARTINV').AsFloat)*-1);
                     QryLocal.Close;
                  end;
               end;
               //------------------------------------------------------------------------------
               // DEFINIÇÃO DOS SALDOS FINAIS DE ACORDO COM A NATUREZA DA OPERACAO
               Case cNaturezaMovimento of
                  // Aumenta Valor e Quantidade de cotas (COMPRA)
                  'A':
                  begin
                     fSaldoFinalValor := fSaldoInicialValor  + fValorOperacao;
                  end;
                  // Diminui valor quantidade de cotas (VENDA)  ** FVALOROPERAÇÃO JÁ FOI GRAVADO NEGATIVO **
                  'D':
                  begin
                     fSaldoFinalValor := fSaldoInicialValor + fValorOperacao;
                  end;
                  // Aumenta Valor (Atualizacao de Saldos - GANHO/RENDIMENTO/OPCOES/LUCRO/PERDA)
                  'G','L','P':
                  begin
                     fSaldoFinalValor := fSaldoInicialValor + fValorOperacao;
                  end;
                  // Acrescimo de valor, baixa parcial
                  'M','I':
                  begin
                     // Nao Altera Qtd de Investimento
                     fSaldoFinalValor := fSaldoInicialValor  + fValorOperacao;
                  end;
                  // DESPESAS
                  'E':
                  begin
                     // Guarda a Natureza da Operacao
                     cNaturezaOPeracao := QryAtualizaSaldoC.FieldByName('NATURMOVOPER').AsString[1];
                     // Caso Operacao de Compra(C) ou Venda(V), Aumenta Qtd de Cotas e
                     // Nao Altera Qtd de Investimento
                     If (cNaturezaOPeracao = 'A') Or (cNaturezaOPeracao = 'D') Then
                     begin
                        fSaldoFinalValor := fSaldoInicialValor  + fValorOperacao;
                        // Caso Operacao de Venda(O) ou Compra(U) de Opcao(O), Nao Altera Qtds, Diminui Valores
                     end
                     else If (cNaturezaOPeracao = 'O') Or (cNaturezaOPeracao = 'U') Then
                     begin

                     End
                     Else
                     begin
                        // O primeiro movimento DEVE aumentar o nº de cotas
                        MsgDlg('Atualiza Saldo, Natureza de Operação não Prevista. ', 'Erro', mtError, [mbOk], 0);
                        Result := False;
                        Exit;
                     end;
                  end;
                  // Caso Diferente de Todos, Não altera Nada
                  Else
                  begin
                     fSaldoFinalValor  := fSaldoInicialValor;
                  end;
               end;

               //------------------------------------------------------------------------------
               // ATUALIZAÇÃO DOS SALDOS DE CARTEIRA
               // Acerta Flag de Calculo de Saldo ( 1 -> 2 ou 3-> '' ou 4-> 4)
               wTipoAtualizacao := '';
               If Trim(qryAtualizaSaldoC.FieldByName('FLGCALCSALDO').asString) = '1' Then
               begin
                 wTipoAtualizacao := '2';
               End
               Else If Trim(qryAtualizaSaldoC.FieldByName('FLGCALCSALDO').asString) = '3' Then
               begin
                 wTipoAtualizacao := '';
               End
               Else If Trim(qryAtualizaSaldoC.FieldByName('FLGCALCSALDO').asString) = '4' Then
               begin
                 wTipoAtualizacao := '4';
               end;
               // Muda o Separador Decimal
               wDec:=DecimalSeparator;
               DecimalSeparator :='.';
               // Tenta atualizar o Arquivo
               if not ExecutaQuery(QryLocal,
                      'UPDATE HISTCARTINV SET '+
                      'SALDOVLRCARTINV   = '+FloatToStr(fSaldoFinalValor)+', '+
                      'VLRMOVCARTINV     = '+FloatToStr(wVlrMovimento)   +', '+
                      'COTASMOVCARTINV   = '+FloatToStr(wCotMovimento)   +', '+
                      'SALDOCOTASCARTINV = '+FloatToStr(fSaldoFinalCotas)+', '+
                      'FLGCALCSALDO      = '+QuotedStr(wTipoAtualizacao) +'  '+
                      'WHERE (IDHISTCARTINV = '+
                             QuotedStr(QryAtualizaSaldoC.FieldByName('IDHISTCARTINV').AsString)+')') Then
               begin
                  MsgDlg('Saldos não Atualizados, Erro ao atualizar Histórico das Carteiras. ',
                         'Mensagem do Sistema',mtError,[mbOK],0);
                  // Volta Decimal Separator
                  DecimalSeparator :=wDec;
                  Exit;
               end;
               DecimalSeparator :=wDec;
               QryLocal.Close;

               // Calcula Saldos
               fSaldoInicialValor   := fSaldoFinalValor;

               If fValorCota  = 0 Then
                  fValorCota := 1;

               qryAtualizaSaldoC.Next;
            end;
            If not Result then
            begin
               mensagem := 'Foram encontradas Inconsistências no Cálculo dos Saldos de Carteira!';
               MsgDlg(mensagem, 'Erro', mtError, [mbOk], 0);
            end;
         Except
            On E:Exception Do
            begin
               MsgDlg('Erro na tentativa de Atualização dos Saldos da Carteira '+
                  QryAtualizaSaldoC.FieldByName('IDCARTEIRAINVEST').AsString+#13+
                  'Investimento '+QryAtualizaSaldoC.FieldByName('IDINVESTIMENTO').AsString+', '+#13+
                  'Tipo de Movimento "'+wTipoMov+'", '+#13+
                  'Lançamento '+QryAtualizaSaldoC.FieldByName('IDHISTCARTINV').AsString+', '+#13+
                  'Data de lançamento '+DateToStr(dDataoper)+#13+#13+
                  'Com a Mensagem :'+#13+
                  E.Message,
                  'Erro',mtError,[mbOK],0);
               Result := false;
               Exit;
            end;
         end; // try
      end;  // while true
      //******************************************************************************
      // PROCESSA REGISTROS COM FLAG 2 / 4 (SALDOS DOS INVESTIMENTOS)
      //******************************************************************************
      While True do
      begin
         Try
            // Busca registros de HistCartInv com flag para atualizacao de Saldo em Investimento (2)
            qryFlgAtualSaldo := TwwQuery(dtmOperacaoInvest.qryFlgAtualSaldo2);
            with qryFlgAtualSaldo do
            begin
               Close;
               Open;
               First;
            end;
            if qryFlgAtualSaldo.isEmpty then
            begin
               break
            end
            else
            begin
               icarteira     := qryFlgAtualSaldo.FieldByName('IDCARTEIRAINVEST').asInteger;
               icarteiragerenc := qryFlgAtualSaldo.FieldByName('IDCARTEIRAGERENC').asInteger;
               iInvestimento := qryFlgAtualSaldo.FieldByName('IDINVESTIMENTO').asInteger;
               //AL_83
               iPlanoPatro   := qryFlgAtualSaldo.FieldByName('IDPLANPREVCTBPATR').asInteger;
               sLote         := qryFlgAtualSaldo.FieldByName('IDLOTE').asString;
               dDataOper     := qryFlgAtualSaldo.FieldByName('DATAMOVCARTINV').asDateTime;
               iHistorico    := qryFlgAtualSaldo.FieldByName('IDHISTCARTINV').asInteger;
            end;
            // Busca Movimentos do Investimento, para verificar o Saldo Anterior
            fQtdeInicialInvest   := 0;
            fValorInicialInvest  := 0;
            wQtdInvestAnt        := 0;
            wSaldoAtuAnt         := 0;
            wSaldoCarAnt         := 0;
            wSaldoAquiAnt        := 0;
            wSaldoRendAnt        := 0;
            wSaldoVarAnt         := 0;
            wSaldoJurAnt         := 0;
            wSaldoVarAnt         := 0;
            wSaldoPreAnt         := 0;
            wSaldoMercadoAnt     := 0;
            wSaldoIRProvAnt      := 0;
            wSaldoIRApuAnt       := 0;
            wSaldoIOFProvAnt     := 0;
            wSaldoIOFApuAnt      := 0;
            wSaldoAgioAnt        := 0;
            //AL_77
            wSaldoProvPerdaAnt      := 0;
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

            wQtdInvestAnt := fQtdeInicialInvest;
            //AL_77
            fValorInicialInvest := fValorInicialInvest + wSaldoProvPerdaAnt;

            dDataOperProx := dDataOper+1;
            While not DiasUteisInv.DiaUtil(dDataOperProx,-1,1,'',True,False,False) Do
               dDataOperProx  := dDataOperProx+1;   // Achar o próximo dia útil

            // Busca registros de HistCartInv que devem ter saldos atualizados
            bCriaqryAtualizaSaldoI := True;
            If iCarteiraGerenc <> 0 Then
               QryAtualizaSaldoI := TwwQuery(dtmOperacaoInvest.qryAtualizaSaldoIL)
            Else
               QryAtualizaSaldoI := TwwQuery(dtmOperacaoInvest.qryAtualizaSaldoILNull);

            //AL_83 - Ini
            qryAtualizaSaldoI.Close;
            if iPlanoPatro > 0 then
               qryAtualizaSaldoI.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanoPatro;
            qryAtualizaSaldoI.ParamByName('IDCARTEIRA').asInteger     := iCarteira;
            //AL_83
            If iCarteiraGerenc <> 0 Then
               qryAtualizaSaldoI.ParamByName('IDCARTEIRAGERENC').asInteger := iCarteiraGerenc;
            qryAtualizaSaldoI.ParamByName('IDINVESTIMENTO').asInteger := iInvestimento;
            qryAtualizaSaldoI.ParamByName('IDLOTE').asString          := sLote;
            qryAtualizaSaldoI.ParamByName('DATAMOV').asDateTime       := dDataOper;
            qryAtualizaSaldoI.ParamByName('DATAMOVPROX').asDateTime   := dDataOperProx;
            qryAtualizaSaldoI.ParamByName('IDHISTORICO').asInteger    := iHistorico;
            qryAtualizaSaldoI.Open;
            qryAtualizaSaldoI.First;
            //AL_83 - Fim

            // Faz enquanto Existem Saldos a Atualizar
            While Not QryAtualizaSaldoI.EOF Do
            begin
               //------------------------------------------------------------------------------
               // Caso Tipo de Movimento = INI -> Inicialização Pula sem fazer nada.
               If (QryAtualizaSaldoI.FieldByName('TIPMOVCARTINV').AsString = 'INI') Then
               begin
                  // Desmarca o Flg do Registro de INI
                  //AL_83
                  dtmOperComum.qryLocal.Close;
                  dtmOperComum.qryLocal.Sql.Clear;
                  dtmOperComum.qryLocal.Sql.Add('UPDATE HISTCARTINV SET ');
                  dtmOperComum.qryLocal.Sql.Add('FLGCALCSALDO     = ''''');
                  dtmOperComum.qryLocal.Sql.Add('WHERE (IDHISTCARTINV = '+
                         QuotedStr(QryAtualizaSaldoI.FieldByName('IDHISTCARTINV').AsString)+')');
                  dtmOperComum.qryLocal.ExecSql;
                  dtmOperComum.qryLocal.Close;

                  // Pula para o Proximo Registro
                  QryAtualizaSaldoI.Next;
                  // Guarda Dados do Proximo Registro
                  //AL_83
                  iPlanoPatro   := QryAtualizaSaldoI.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                  icarteira     := QryAtualizaSaldoI.FieldByName('IDCARTEIRAINVEST').asInteger;
                  icarteiragerenc := QryAtualizaSaldoI.FieldByName('IDCARTEIRAGERENC').asInteger;
                  iInvestimento := QryAtualizaSaldoI.FieldByName('IDINVESTIMENTO').asInteger;
                  sLote         := QryAtualizaSaldoI.FieldByName('IDLOTE').asString;
                  dDataOper     := QryAtualizaSaldoI.FieldByName('DATAMOVCARTINV').asDateTime;
                  iHistorico    := QryAtualizaSaldoI.FieldByName('IDHISTCARTINV').asInteger;
                  // Busca Saldos Anteriores deste Registro (do INI)
                  //AL_2
                  //AL_5
                  //AL_71
                  //AL_75
                  //AL_77
                  //AL_78
                  //AL_83 - BuscaSaldos em 3 camadas
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

                  wQtdInvestAnt := fQtdeInicialInvest;
                  //AL_77
                  fValorInicialInvest := fValorInicialInvest + wSaldoProvPerdaAnt;

                  // Loop
                  Continue;
               end;
               // Caso Data Final passada e data Maior que Final sai
               If (dDataFinal <> -1) And (dDataFinal > QryAtualizaSaldoI.FieldByName('DATAMOVCARTINV').AsDateTime) Then
               begin
                  Break;
               end;
               // Guarda dados
               //Al_49 - 30/09/2005
               fValorVariacao     := qryAtualizaSaldoI.FieldByName('VLRVARIACAO').asFloat;
               fValorOperacao     := qryAtualizaSaldoI.FieldByName('VLRMOVCARTINV').asFloat;
               fQtdInvestOperacao := qryAtualizaSaldoI.FieldByName('QTDEMOVINVCART').asFloat;
               wTipoMov           := QryAtualizaSaldoI.FieldByName('TIPMOVCARTINV').AsString;
               dDataMov           := QryAtualizaSaldoI.FieldByName('DATAMOVCARTINV').AsDateTime;
               cNaturezaMovimento := QryAtualizaSaldoI.FieldByName('NATURMOVCARTINV').asString[1];
               wFlgCalcSaldo      := QryAtualizaSaldoI.FieldByName('FLGCALCSALDO').AsString;
               fValorAgio         := QryAtualizaSaldoI.FieldByName('VLRAGIO').AsFloat;
               iTipoInvest        := QryAtualizaSaldoI.FieldByName('IDTIPOINVEST').asInteger;
               iIdTipoDespInvest  := QryAtualizaSaldoI.FieldByName('IDTIPODESPINVEST').asInteger;
               fValorMovimAqui    := QryAtualizaSaldoI.FieldByName('MOVIMAQUI').AsFloat;
               iIdTipoOperacao    := QryAtualizaSaldoI.FieldByName('IDTIPOOPERHIST').AsInteger;
               // Guarda os Valores da Operacao e de Cotas
               wVlrMovimento:=fValorOperacao;

               //------------------------------------------------------------------------------
               // CASO LUCRO OU PREJUIZO (NO INVESTIMENTO)
               If (wTipoMov = 'LUC') Then
               begin
                  // Busca Valor da Operacao
                  dtmOperComum.QryLucroPrejuizo.Close;
                  dtmOperComum.QryLucroPrejuizo.ParamByName('IDOPERACAOINVEST').AsInteger :=
                                   QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsInteger;
                  dtmOperComum.QryLucroPrejuizo.Open;
                  // Guarda Valor e Quantidade da Operacao Deste Movimento
                  wVlrMovOperacao:=dtmOperComum.QryLucroPrejuizo.FieldByName('VLRMOVCARTINV').AsFloat;
                  wQtdMovOperacao:=dtmOperComum.QryLucroPrejuizo.FieldByName('QTDEMOVINVCART').AsFloat;
                  // Zera MovimAtu
                  wMovimAtu:=0;
                  wSaldoInutil:=wMovimAtu;
                  dtmOperComum.QryLucroPrejuizo.Close;
                  // Busca Total de Despesas desta Operacao
                  dtmOperComum.QryBuscaTotDespOper.Close;
                  dtmOperComum.QryBuscaTotDespOper.ParamByName('IDOPERACAOINVEST').AsInteger :=
                                      QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsInteger;
                  dtmOperComum.QryBuscaTotDespOper.Open;
                  // Guarda Total de Despesas Da Operacao deste Movimento
                  wTotDespOper:=dtmOperComum.QryBuscaTotDespOper.FieldByName('TOTVLRDESPOPER').AsFloat;
                  dtmOperComum.QryBuscaTotDespOper.Close;
                  // Calcula Valor total vendido desse Investimento
                  DataCotacao := dDataOper -1;
                  While not DiasUteisInv.DiaUtil(DataCotacao,-1,1,'',True,False,False) Do
                     DataCotacao  := DataCotacao -1;   // Achar o dia útil anterior
                  if iTipoInvest = 2 then // RV
                     wVlrTotVendido :=Round(wQtdMovOperacao*BuscaCotacaoInvest(iInvestimento,DataCotacao,True),2)
                  else
                     wVlrTotVendido :=Trunca((wQtdMovOperacao*(Trunca(DivValorZero(fValorInicialInvest,fQtdeInicialInvest),9))),2);

                  wVlrMovimento:=(ABS(wVlrMovOperacao)-wVlrTotVendido);

                  //AL_67 Ini
                  //AL_76 Ini
                  wVlrMovimento:=((ABS(wVlrMovOperacao) - wVlrTotVendido));
                  //AL_76 Fim
                  //AL_67 Fim

                  //AL_76
                  if Sistema.TipoCliente = 19971 then  //REFER
                  begin
                     if (fQtdeInicialInvest - wQtdMovOperacao) = 0 then //Venda Total
                        wVlrMovimento := (ABS(wVlrMovOperacao) - fValorInicialInvest - wTotDespOper);
                  end;

                  // Altera Valores das Variveis
                  fValorOperacao    := wVlrMovimento;

                  If ((Trim(qryAtualizaSaldoI.FieldByName('FLGCALCSALDO').asString) <> '4') And
                     (((iTipoInvest = 2) and (fValorOperacao <> 0)) or
                      ((iTipoInvest = 1) and (Abs(fValorOperacao) > 0.02)))) Then
                  begin
                     // Muda o Separador Decimal
                     wDec:=DecimalSeparator;
                     DecimalSeparator :='.';
                     // Tenta atualizar o Arquivo
                     dtmOperComum.QryUpdHistCartInv.Close;
                     dtmOperComum.QryUpdHistCartInv.ParamByName('VLRMOVCARTINV').AsFloat   := fValorOperacao;
                     dtmOperComum.QryUpdHistCartInv.ParamByName('IDHISTCARTINV').AsInteger :=
                                       QryAtualizaSaldoI.FieldByName('IDHISTCARTINV').AsInteger;
                     dtmOperComum.QryUpdHistCartInv.ExecSQL;
                     DecimalSeparator:=wDec;
                     dtmOperComum.QryUpdHistCartInv.Close;
                     // Rechama a Rotina de Atualizar os Saldos
                     AtualizaSaldos(fValorPrimeiraCota,-1);
                     // Sai da Rotina
                     Exit;
                  end
                  else
                  begin
                     wTipoAtualizacao := '';
                  end;
               end;
               //------------------------------------------------------------------------------
               // Definição dos Saldos Finais
               Case cNaturezaMovimento of
                  'A': // Aumenta quantidade
                  begin
                     //AL_11 Ini
                     if ((iIdTipoOperacao = -110) or (iIdTipoOperacao = -111) or
                         (iIdTipoOperacao = -112) or (iIdTipoOperacao = -113)) then // Operações de Acerto de Custo
                     begin
                        fQtdeFinalInvest  := fQtdeInicialInvest;
                        fValorFinalInvest := fValorInicialInvest;
                        fQtdeFinalCPMF    := fQtdeInicialCPMF;
                     end
                     else
                     begin
                        fQtdeFinalInvest  := fQtdeInicialInvest  + fQtdInvestOperacao;
                        //AL_5
                        if QryAtualizaSaldoI.FieldByName('FLGCONTAINVEST').AsInteger = 1 then
                           fQtdeFinalCPMF := fQtdeInicialCPMF
                        else
                           fQtdeFinalCPMF := fQtdeInicialCPMF + fQtdInvestOperacao;

                        fValorFinalInvest := fValorInicialInvest + fValorOperacao;
                     end;
                     //AL_11 Fim
                  end;
                  'C': // Diminui o valor
                  begin
                     //AL_5
                     if (qryAtualizaSaldoI.FieldByName('TIPOOPERACAO').AsInteger = -17) or     // Pagamento de Juros
                        (qryAtualizaSaldoI.FieldByName('TIPOOPERACAO').AsInteger = -18) then   // Amortizacao de Principal
                     begin
                        fQtdeFinalInvest  := fQtdeInicialInvest;
                        fValorFinalInvest := fValorInicialInvest - fValorOperacao;
                     end
                     else if qryAtualizaSaldoI.FieldByName('TIPOOPERACAO').AsInteger = -19 then   // Incorporacao de Juros
                     begin
                        fQtdeFinalInvest  := fQtdeInicialInvest;
                        fValorFinalInvest := fValorInicialInvest;
                     end;
                     fQtdeFinalCPMF := fQtdeInicialCPMF;
                  end;
                  'D': // Diminui quantidade  (venda)  ** fValorOPeração já foi gravado negativo
                  begin
                     //AL_11 Ini
                     if ((iIdTipoOperacao = -110) or (iIdTipoOperacao = -111) or
                         (iIdTipoOperacao = -112) or (iIdTipoOperacao = -113)) then // Operações de Acerto de Custo
                     begin
                        fQtdeFinalInvest  := fQtdeInicialInvest;
                        fValorFinalInvest := fValorInicialInvest;
                        fQtdeFinalCPMF    := fQtdeInicialCPMF;
                     end
                     else
                     begin
                        fQtdeFinalInvest := fQtdeInicialInvest - fQtdInvestOperacao;
                        //AL_5
                        if QryAtualizaSaldoI.FieldByName('FLGCONTAINVEST').AsInteger = 1 then
                           fQtdeFinalCPMF := fQtdeInicialCPMF
                        else
                           fQtdeFinalCPMF := fQtdeInicialCPMF - fQtdInvestOperacao;

                        if iTipoInvest = 8 then
                           fQtdeFinalInvest := fQtdeInicialInvest + fQtdInvestOperacao;

                        fValorFinalInvest   := fValorInicialInvest + fValorOperacao;
                     end;
                     //AL_11 Fim
                  end;
                  'G','P': // Aumento da Cotacao do Investimento (GANHO/PERDA)
                  begin
                     fQtdeFinalInvest  := fQtdeInicialInvest;
                     //AL_5
                     fQtdeFinalCPMF    := fQtdeInicialCPMF;
                     fValorFinalInvest := fValorInicialInvest + fValorOperacao;
                  end;
                  'L': // LUCRO Nao Altera saldos
                  begin
                     fQtdeFinalInvest  := fQtdeInicialInvest;
                     //AL_5
                     fQtdeFinalCPMF    := fQtdeInicialCPMF;
                     // AL_31 - 25/04/2005
                     fValorFinalInvest := fValorInicialInvest + fValorOperacao;
                  end;
                  // ACRESCIMO DE VALOR, BAIXA PARCIAL
                  'M','I':
                  begin
                     // Nao Altera Qtd de Investimento
                     fQtdeFinalInvest  := fQtdeInicialInvest;
                     //AL_5
                     fQtdeFinalCPMF    := fQtdeInicialCPMF;
                     fValorFinalInvest := fValorInicialInvest + fValorOperacao;
                  end;
                  // Despesas
                  'E':
                  begin
                     // Guarda a Natureza da Operacao
                     cNaturezaOPeracao := QryAtualizaSaldoI.FieldByName('NATURMOVOPER').AsString[1];
                     // AL_31 - 25/04/2005
                     // AL_69
                     if (cNaturezaOPeracao = 'D') and (Sistema.TipoCliente = 19991) then  //FUNCEF)
                        fValorFinalInvest := fValorInicialInvest
                     else
                        fValorFinalInvest := fValorInicialInvest + fValorOperacao;

                     fQtdeFinalInvest  := fQtdeInicialInvest;
                     fQtdeFinalCPMF := fQtdeInicialCPMF;
                     //AL_5
                     // AL_31 - Fim
                  end;
                  'U': // Aumenta quantidade para Opções
                  begin
                     fQtdeFinalInvest  := fQtdeInicialInvest  + fQtdInvestOperacao;
                     //AL_5
                     if QryAtualizaSaldoI.FieldByName('FLGCONTAINVEST').AsInteger = 1 then
                        fQtdeFinalCPMF := fQtdeInicialCPMF
                     else
                        fQtdeFinalCPMF := fQtdeInicialCPMF + fQtdInvestOperacao;

                     fValorFinalInvest := fValorInicialInvest + fValorOperacao
                  end;
                  'O': // Diminui quantidade para Opções
                  begin
                     fQtdeFinalInvest  := fQtdeInicialInvest  - fQtdInvestOperacao;
                     //AL_5
                     if QryAtualizaSaldoI.FieldByName('FLGCONTAINVEST').AsInteger = 1 then
                        fQtdeFinalCPMF := fQtdeInicialCPMF
                     else
                        fQtdeFinalCPMF := fQtdeInicialCPMF - fQtdInvestOperacao;

                     fValorFinalInvest := fValorInicialInvest - fValorOperacao
                  end;
                  'F': // MANTEM a quantidade da OPERACAO(GRUPAMENTO/DESDOBRAMENTO)
                  begin
                     //Ricardo Cristiano - 21/07/2009 - N. Sol 122235 -  N. Kintana 597042
                     //AL_109
                     //AL_48 Ini
                     if ((Not ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirDes) or (iIdTipoOperacao = CtrlPInv.IdTipoOperDirDes+10000))) And
                         (VerificaGrupamentoAnterior(iInvestimento,iCarteira,iCarteiraGerenc, iHistorico,
                                                     CtrlPInv.IdTipoOperDirGru, CtrlPInv.IdTipoOperDirGru+10000,
                                                     DateToStr(dDataOper), iPlanoPatro))) then
                        fQtdeFinalInvest  := fQtdInvestOperacao + fQtdeInicialInvest
                     else if ((Not ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirGru) or (iIdTipoOperacao = CtrlPInv.IdTipoOperDirGru+10000))) And
                              (VerificaDesdobramentoAnterior(iInvestimento,iCarteira,iCarteiraGerenc, iHistorico,
                                                             CtrlPInv.IdTipoOperDirDes, CtrlPInv.IdTipoOperDirDes+10000,
                                                             DateToStr(dDataOper), iPlanoPatro))) then
                        fQtdeFinalInvest  := fQtdInvestOperacao + fQtdeInicialInvest                                                             
                     else
                        fQtdeFinalInvest  := fQtdInvestOperacao;

                     //AL_48 Fim
                     //AL_5
                     fQtdeFinalCPMF    := fQtdeInicialCPMF;
                     fValorFinalInvest := fQtdInvestOperacao*(fValorInicialInvest/fQtdInvestOperacao);
                     If fValorFinalInvest = 0 Then
                        fValorFinalInvest := fQtdInvestOperacao*(fValorOperacao/fQtdInvestOperacao);
                  end
                  else
                  begin
                     fQtdeFinalInvest  := fQtdeInicialInvest;
                     //AL_5
                     fQtdeFinalCPMF    := fQtdeInicialCPMF;
                     fValorFinalInvest := fValorInicialInvest;
                     //AL_92
                     //Verifica se e uma opercao de Restituição de Capital
                     //AL_109
                     If ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirRes) Or
                         (iIdTipoOperacao = CtrlPInv.IdTipoOperDirRes+10000)) Then
                       fValorFinalInvest := fValorInicialInvest - fValorOperacao;

                  end;

               end; // Fim do Case

               wCotaMoeda:=1;
               // Caso Seja uma Atualizacao Nao mexe nos Saldos Atuariais, Carregamento e
               // Aquisicao
               if (wTipoMov <> 'ATU') then
               begin
                  wMovimAtu  :=0;
                  //AL_33 - 25/04/2005
                  // Caso Movimento R(RECEBIMENTO), A(COMPRA),D(VENDA) ou despesas de A/D, Calcula Movimento e Saldo Atuarial
                  If (cNaturezaMovimento = 'R') Or  (cNaturezaMovimento = 'A')  Or
                     (cNaturezaMovimento = 'D') Or
                   ( (cNaturezaMovimento = 'E') And ( (cNaturezaOperacao = 'A') Or
                                                      (cNaturezaOperacao = 'D') ) ) Then
                   begin
                     wMovimAtu  := (fValorOperacao / wCotaMoeda);
                   end;

                  wMovimAgio    := 0;

                  //AL_11 - Carrega as variáveis antes do tratamento
                  // Inicia Custo de Carregamento e Custo de Aquisicao, Variação, Juros e Prêmio
                  wMovimCar     := 0;
                  wMovimAqui    := 0;
                  wMovimVar     := 0;
                  wMovimJur     := 0;
                  wMovimPre     := 0;
                  wMovimIRProv  := 0;
                  wMovimIRApu   := 0;
                  wMovimIOFProv := 0;
                  wMovimIOFApu  := 0;
                  //AL_11 - Fim

                  // Caso Movimento A(COMPRA), Atualiza Saldo de Agio
                  If (cNaturezaMovimento = 'A') Or (cNaturezaMovimento = 'D') Or
                     ( (cNaturezaMovimento = 'E') And ( (cNaturezaOperacao = 'A') Or
                                                        (cNaturezaOperacao = 'D') ) ) Then
                  begin
                     wMovimAgio  := fValorAgio;
                     //AL_11
                     if ((iIdTipoOperacao = -110) or (iIdTipoOperacao = -111) or
                         (iIdTipoOperacao = -112) or (iIdTipoOperacao = -113)) then // Operações de Acerto de Custo
                     begin
                        if cNaturezaMovimento = 'A' then
                           // Se aumenta o Custo, a variação diminui
                           wMovimVar  := Abs(fValorOperacao) * -1
                        else if cNaturezaMovimento = 'D' then
                           wMovimVar  := Abs(fValorOperacao);
                     end;
                     //AL_11 - Fim
                  end;
                  //Al_32 - 25/04/2005
                  // Caso Movimento O/U(OPCOES) ou despesas de O/U,
                  // Calcula Movimento e Saldo Atuarial
                  If (cNaturezaMovimento = 'O') Or  (cNaturezaMovimento = 'U')  Or
                   ( (cNaturezaMovimento = 'E') And ( (cNaturezaOperacao = 'O') Or
                                                      (cNaturezaOperacao = 'U') ) ) then
                  begin
                     wMovimAtu  := ((fValorOperacao / wCotaMoeda)*-1);
                  end;

                  if (cNaturezaMovimento = 'C')  then
                  begin
                     if (qryAtualizaSaldoI.FieldByName('TIPOOPERACAO').AsInteger = -17) or     // Pagamento de Juros
                        (qryAtualizaSaldoI.FieldByName('TIPOOPERACAO').AsInteger = -19) then   // Incorporação de Juros
                        wMovimJur := QryAtualizaSaldoI.FieldByName('VLRJUROS').asFloat
                     else
                        wMovimJur  := ((fQtdInvestOperacao * (wSaldoJurAnt  / wQtdInvestAnt))*-1);
                  end
                  // Caso seja uma DIMINUIÇÃO (D)
                  else If (cNaturezaMovimento = 'D')  Then
                  begin
                     // Carregamento é igual a Negativo de (QUANTIDADE DA OPERACAO * CUSTO DE CARREGAMENTO MEDIO ANTERIOR)
                     wMovimCar  := ((fQtdInvestOperacao * DivValorZero(wSaldoCarAnt,wQtdInvestAnt))*-1);
                     // Variacao, Juros e Premio (Baixa pela Media)
                     //AL_11
                     if ((iIdTipoOperacao = -110) or (iIdTipoOperacao = -111) or
                         (iIdTipoOperacao = -112) or (iIdTipoOperacao = -113)) or // Operações de Acerto de Custo
                         //AL_50
                         (iIdTipoOperacao = -125) then
                     begin
                        if cNaturezaMovimento = 'A' then
                        begin
                           // Se aumenta o Custo, a variação diminui
                           wMovimVar  := Abs(fValorOperacao) * -1;
                           wMovimAqui := Abs(fValorOperacao);
                        end
                        else if cNaturezaMovimento = 'D' then
                        begin
                           wMovimVar  := Abs(fValorOperacao);
                           wMovimAqui := Abs(fValorOperacao) * -1;
                        end;
                     end
                     else
                     begin
                        // Custo de Aquisicao é igual a Negativo de (QUANTIDADE DA OPERACAO * CUSTO DE AQUISICAO MEDIO ANTERIOR)
                        wMovimVar  := ((fQtdInvestOperacao * DivValorZero(wSaldoVarAnt,wQtdInvestAnt))*-1);

                        // VERIFICAR PERDA DE PRECISAO POR CAUSA DO CAMPO NA HISTCARTINV COM SOMENTE DUAS CASAS DECIMAIS
                        //    SOBRA SEMPRE ALGUNS CENTAVOS E O SALDO DE CUSTO DIMINUI NA VENDA
                        //AL_42 (Retirar o comentário acima depois dos teste)
                        wMovimAqui := RoundCM(((fQtdInvestOperacao * DivValorZero(wSaldoAquiAnt,wQtdInvestAnt))*-1),2);
                     end;

                     //AL_11 Fim
                     wMovimJur  := ((fQtdInvestOperacao * DivValorZero(wSaldoJurAnt,wQtdInvestAnt))*-1);
                     wMovimPre  := ((fQtdInvestOperacao * DivValorZero(wSaldoPreAnt,wQtdInvestAnt))*-1);
                     wMovimIRProv  := QryAtualizaSaldoI.FieldByName('VLRIRPROV').asFloat;
                     wMovimIRApu   := QryAtualizaSaldoI.FieldByName('VLRIRAPU').asFloat;
                     wMovimIOFProv := QryAtualizaSaldoI.FieldByName('VLRIOFPROV').asFloat;
                     wMovimIOFApu  := QryAtualizaSaldoI.FieldByName('VLRIOFAPU').asFloat;
                     // BM&F Venda e e Ajuste Positivo ou Negatis
                     if (iTipoInvest = 8)  then // BM&F Venda
                        wMovimAqui := fValorOperacao;

                  end
                  // Caso Compra(A) Ou despesa de Compra
                  else If ( (cNaturezaMovimento = 'A')  Or
                            ( (cNaturezaMovimento = 'E') And (cNaturezaOperacao = 'A') and (iTipoInvest <> 8)) or
                            ( (cNaturezaMovimento = 'E') and (iTipoInvest = 8) and ((iIdTipoDespInvest = -20) or (iIdTipoDespInvest = -21)) )) Then
                  begin
                     // Juros é igual ao Carregamento
                     wMovimCar  := DivValorZero(fValorOperacao,wCotaMoeda);
                     //AL_32 - 25/04/2005
                     // AL_35
                     // AL_56
                     //AL_109
                     if ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirAlt) or
                         (iIdTipoOperacao = (CtrlPInv.IdTipoOperDirAlt + 10000))) or
                        ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirInc) or
                         (iIdTipoOperacao = (CtrlPInv.IdTipoOperDirInc + 10000))) then
                     begin
                        // O Custo de aquisição é o mesmo que saíu na origem
                        // AL_57 - Capta a variação tb - INI
                        QryLocal.SQL.Clear;
                        // AL_58
                        QryLocal.SQL.Add('SELECT MOVIMAQUI, VLRVARIACAO ');
                        QryLocal.SQL.Add('FROM HISTCARTINV ');
                        QryLocal.SQL.Add('WHERE IDOPERACAOINVEST IN ');
                        QryLocal.SQL.Add('          (SELECT IDOPERACAOINVEST ');
                        QryLocal.SQL.Add('           FROM OPERACAOINVEST ');
                        QryLocal.SQL.Add('           WHERE (IDOPERACAODIREITO || IDTIPOOPERACAO) = ');
                        QryLocal.SQL.Add('                    (SELECT IDOPERACAODIREITO || IDTIPOOPERACAO ');
                        QryLocal.SQL.Add('                     FROM OPERACAOINVEST ');
                        QryLocal.SQL.Add('                     WHERE IDOPERACAOINVEST = ' + QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsString + ') ');
                        QryLocal.SQL.Add('             AND ORIGDEST NOT IN ');
                        QryLocal.SQL.Add('                    (SELECT ORIGDEST ');
                        QryLocal.SQL.Add('                     FROM OPERACAOINVEST ');
                        QryLocal.SQL.Add('                     WHERE IDOPERACAOINVEST = ' + QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsString + ') ');
                        // AL_74 - Buscar o mesmo custodiante e o motivo de bloqueio da operacão destino
                        QryLocal.SQL.Add('             AND NVL(IDCUSTODIANTE,0) = ');
                        QryLocal.SQL.Add('                    (SELECT NVL(IDCUSTODIANTE,0) ');
                        QryLocal.SQL.Add('                     FROM OPERACAOINVEST ');
                        QryLocal.SQL.Add('                     WHERE IDOPERACAOINVEST = ' + QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsString + ') ');
                        QryLocal.SQL.Add('             AND NVL(IDMOTIVOBLOQUEIO,0) = ');
                        QryLocal.SQL.Add('                    (SELECT NVL(IDMOTIVOBLOQUEIO,0) ');
                        QryLocal.SQL.Add('                     FROM OPERACAOINVEST ');
                        QryLocal.SQL.Add('                     WHERE IDOPERACAOINVEST = ' + QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsString + ') ');
                        //AL_83
                        QryLocal.SQL.Add('             AND IDPLANPREVCTBPATR = ');
                        QryLocal.SQL.Add('                    (SELECT IDPLANPREVCTBPATR ');
                        QryLocal.SQL.Add('                     FROM OPERACAOINVEST ');
                        QryLocal.SQL.Add('                     WHERE IDOPERACAOINVEST = ' + QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsString + ') ');
                        QryLocal.SQL.Add('             AND IDCARTEIRAINVEST = ');
                        QryLocal.SQL.Add('                    (SELECT IDCARTEIRAINVEST ');
                        QryLocal.SQL.Add('                     FROM OPERACAOINVEST ');
                        QryLocal.SQL.Add('                     WHERE IDOPERACAOINVEST = ' + QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsString + ') ');
                        QryLocal.SQL.Add('             AND NVL(IDCARTEIRAGERENC,0) = ');
                        QryLocal.SQL.Add('                    (SELECT NVL(IDCARTEIRAGERENC,0) ');
                        QryLocal.SQL.Add('                     FROM OPERACAOINVEST ');
                        QryLocal.SQL.Add('                     WHERE IDOPERACAOINVEST = ' + QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsString + ')) ');
                        QryLocal.Open;
                        wMovimAqui := QryLocal.FieldByName('MOVIMAQUI').AsFloat * -1;
                        //AL_72
                        //AL_109
                        //Ricardo Cristiano - 22/10/2009 - N. Sol 125777 -  N. Kintana 652392                        
                        if ((Sistema.TipoCliente = 19991) and (cNaturezaMovimento = 'A') and
                           ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirInc) or
                            (iIdTipoOperacao = (CtrlPInv.IdTipoOperDirInc + 10000)))) then
                           wMovimVar := 0
                        else
                           wMovimVar := QryLocal.FieldByName('VLRVARIACAO').AsFloat * -1;
                        // AL_57 - Capta a variação tb - FIM
                        QryLocal.Close;
                        QryLocal.SQL.Clear;
                     end
                     // AL_60 - Ini
                     else
                     //AL_109
                     if (iIdTipoOperacao = CtrlPInv.IdTipoOperDirCis) or
                        (iIdTipoOperacao = (CtrlPInv.IdTipoOperDirCis + 10000)) or
                        (iIdTipoOperacao = -127) or
                        (iIdTipoOperacao = -10127) then
                     begin
                        QryLocal.SQL.Clear;
                        // AL_58
                        // Operações de Cisão
                        QryLocal.SQL.Add('SELECT MOVIMAQUI, VLRVARIACAO ');
                        QryLocal.SQL.Add('FROM HISTCARTINV ');
                        QryLocal.SQL.Add('WHERE IDOPERACAOINVEST = ' + QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsString);
                        QryLocal.Open;
                        wMovimAqui := QryLocal.FieldByName('MOVIMAQUI').AsFloat;
                        wMovimVar := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
                     end
                     // AL_60 - Fim
                     // Al_49 - 30/09/2005
                     else
                     if ((iIdTipoOperacao = -93) And (fValorMovimAqui <> 0)) then // Operações de Acerto de Custo
                        wMovimAqui := fValorMovimAqui
                     else
                        wMovimAqui := fValorOperacao;
                     // AL_35 - Fim
                     if (iTipoInvest = 8)  then // BM&F
                        wMovimIRApu   := QryAtualizaSaldoI.FieldByName('VLRIRAPU').asFloat;

                     //AL_52 Ini
                     //Al_49 - 30/09/2005
                     if iIdTipoOperacao = -93 then
                     begin
                        if fValorVariacao <> 0 then // Operações de Acerto de Custo
                           wMovimVar  := fValorVariacao
                        else
                           wMovimVar  := ((fQtdInvestOperacao * DivValorZero(wSaldoVarAnt,wQtdInvestAnt)));
                     end
                     //AL_50
                     else if (iIdTipoOperacao = -124) then
                        wMovimVar := fValorOperacao;
                     //AL_52 Fim
                  end
                  // Caso despesa de Venda e Compra de BMF
                  else If ( (cNaturezaMovimento = 'E') and (iTipoInvest = 8) and ((iIdTipoDespInvest = -20) or (iIdTipoDespInvest = -21)) ) Then
                  begin
                     wMovimAqui := fValorOperacao;
                  end
                  // AL_31 - 22/04/2005 - Afeta o Custo só na compra
                  else if (cNaturezaMovimento = 'E') and (cNaturezaOperacao = 'A') then
                       wMovimAqui := fValorOperacao
                  // AL_76 - 20/06/2006 - Se Refer, Afeta o Custo na Venda
                  else if (cNaturezaMovimento = 'E') and (cNaturezaOperacao = 'D') and  (Sistema.TipoCliente <> 19991) then //<> FUNCEF //(Sistema.NomeEmpresa = 'FUNDAÇÃO REFER') then // REFER
                       wMovimAqui := fValorOperacao
                  //AL_33 - 25/04/2005
                  else if (cNaturezaMovimento = 'R') then
                  begin
                     //Verifica se e uma opercao de Restituição de Capital
                     //AL_109
                     If ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirRes) Or
                         (iIdTipoOperacao = CtrlPInv.IdTipoOperDirRes+10000)) Then
                       wMovimAqui :=  ABS(fValorOperacao)*-1;
                  end;
                  // AL_31 - Fim
                  // Caso Movimento O/U(OPCOES) ou despesas de O/U,
                  // Calcula Premio
                  If (cNaturezaMovimento = 'O') Or (cNaturezaMovimento = 'U') Then
                  begin
                     // Premio (Valor da Operacao)
                     if iIdTipoOperacao = -69 then // Baixa de Opções
                     begin
                        if cNaturezaMovimento = 'O' then
                        begin
                           wMovimPre  := wSaldoPreAnt;
                           wMovimAqui := wSaldoAquiAnt;
                        end
                        else
                        begin
                           wMovimPre  := wSaldoPreAnt * -1;
                           wMovimAqui := wSaldoAquiAnt * -1;
                        end;
                     end
                     else
                     begin
                        if cNaturezaMovimento = 'U' then // Compra Opção
                        begin
                           wMovimPre  := fValorOperacao;
                           wMovimAqui := fValorOperacao;
                        end
                        else
                        If cNaturezaMovimento = 'O' then // Venda Opção
                        begin
                           wMovimPre  := fValorOperacao * -1;
                           wMovimAqui := fValorOperacao * -1;
                        end;
                     end;
                  end;
               End
               Else
               begin
                  // Caso Atualização, Apaga os Movimentos e Repete os Saldos
                  wMovimAtu     :=0;
                  wMovimAqui    :=0;
                  wMovimCar     :=0;
                  wMovimVar     := QryAtualizaSaldoI.FieldByName('VLRVARIACAO').asFloat;
                  wMovimJur     := QryAtualizaSaldoI.FieldByName('VLRJUROS').asFloat;
                  wMovimIRProv  := QryAtualizaSaldoI.FieldByName('VLRIRPROV').asFloat;
                  wMovimIRApu   := QryAtualizaSaldoI.FieldByName('VLRIRAPU').asFloat;
                  wMovimIOFProv := QryAtualizaSaldoI.FieldByName('VLRIOFPROV').asFloat;
                  wMovimIOFApu  := QryAtualizaSaldoI.FieldByName('VLRIOFAPU').asFloat;
                  wMovimAgio    := QryAtualizaSaldoI.FieldByName('VLRAGIO').asFloat;
                  wSaldoAtu     :=wSaldoAtuAnt;
               end;

               //------------------------------------------------------------------------------
               // CASO SEJA TRANSFERENCIA (NO INVESTIMENTO)
               If (wTipoMov = 'TRF') Then
               begin
                  // Caso Diminua (D)
                  If (cNaturezaMovimento = 'D') Then
                  begin
                     // Atuarial, Custo de Carregamento e Aquisicao com o Anterior *-1)
                     wMovimAtu :=((fQtdInvestOperacao*DivValorZero(wSaldoAtuAnt,wQtdInvestAnt)) *-1);
                     wMovimCar :=((fQtdInvestOperacao*DivValorZero(wSaldoCarAnt,wQtdInvestAnt)) *-1);
                     //AL_42 Ini
                     wMovimAqui:= RoundCM(((fQtdInvestOperacao*DivValorZero(wSaldoAquiAnt,wQtdInvestAnt))*-1),2);
                     wMovimVar := RoundCM(((fQtdInvestOperacao*DivValorZero(wSaldoVarAnt,wQtdInvestAnt))*-1),2);
                     //AL_42 Fim
                     wMovimJur :=((fQtdInvestOperacao*DivValorZero(wSaldoJurAnt,wQtdInvestAnt))*-1);
                     wMovimPre :=((fQtdInvestOperacao*DivValorZero(wSaldoPreAnt,wQtdInvestAnt))*-1);
                     wMovimIRProv  := ((fQtdInvestOperacao * DivValorZero(wSaldoIRProvAnt,wQtdInvestAnt))*-1);
                     wMovimIRApu   := ((fQtdInvestOperacao * DivValorZero(wSaldoIRApuAnt,wQtdInvestAnt))*-1);
                     wMovimIOFProv := ((fQtdInvestOperacao * DivValorZero(wSaldoIOFProvAnt,wQtdInvestAnt))*-1);
                     wMovimIOFApu  := ((fQtdInvestOperacao * DivValorZero(wSaldoIOFApuAnt,wQtdInvestAnt))*-1);
                     wMovimAgio    := ((fQtdInvestOperacao * DivValorZero(wSaldoAgioAnt,wQtdInvestAnt))*-1);
                  end;
                  // Caso Diminua (A)
                  If (cNaturezaMovimento = 'A') Then
                  begin
                     With dtmOperComum.qryLocal Do
                     begin
                        Close;
                        Sql.Clear;
                        Sql.Add('SELECT  MOVIMAQUI, MOVIMCAR, MOVIMATU, VLRVARIACAO, VLRJUROS, VLRPREMIO, ');
                        Sql.Add('        VLRIRPROV, VLRIRAPU, VLRIOFPROV, VLRIOFAPU, VLRAGIO, QTDEMOVINVCART ');
                        Sql.Add('FROM HISTCARTINV                      ');
                        Sql.Add('WHERE 	(TIPMOVCARTINV    = ''TRF'') AND ');
                        Sql.Add('        (NATURMOVCARTINV  = ''D'')   AND ');
                        Sql.Add('      	(IDOPERACAOINVEST = ');
                        Sql.Add('      	   (SELECT MIN(O1.IDOPERACAOINVEST) ');
                        Sql.Add('      	    FROM  OPERACAOINVEST O1 ');
                        Sql.Add('      	    WHERE (O1.IDOPERACAODIREITO = ');
                        Sql.Add('      	       (SELECT O2.IDOPERACAODIREITO ');
                        Sql.Add('      	        FROM OPERACAOINVEST O2 ');
                        Sql.Add('      	        WHERE (O2.IDOPERACAOINVEST = '+
                                      QuotedStr(QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsString)+')))))');
                        Open;
                     end;
                     // Percentual informado em OperacaoInvest para Rateio de Custo no caso de Cisão.
                     //AL_109
                     if QryAtualizaSaldoI.FieldByName('TIPOOPERACAO').asInteger = CtrlPInv.IdTipoOperDirCis then
                     begin
                        With dtmOperComum.qryLocal1 Do
                        begin
                           Close;
                           Sql.Clear;
                           Sql.Add('SELECT  PERCENTUAL      ');
                           Sql.Add('FROM OPERACAOINVEST  ');
                           Sql.Add('WHERE 	(IDOPERACAOINVEST = '+
                                           QuotedStr(QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsString)+') ');
                           Open;
                        end;
                        //AL_42
                        wMovimAqui := RoundCM((dtmOperComum.QryLocal1.FieldByName('PERCENTUAL').AsFloat /100 *
                                            (fQtdInvestOperacao*
                                             DivValorZero(dtmOperComum.QryLocal.FieldByName('MOVIMAQUI').AsFloat,
                                             dtmOperComum.QryLocal.FieldByName('QTDEMOVINVCART').AsFloat))*-1),2);
                     end
                     else
                        wMovimAqui := (dtmOperComum.QryLocal.FieldByName('MOVIMAQUI').AsFloat*-1);
                     dtmOperComum.QryLocal1.Close;
                     // Atuarial, Custo de Carregamento e Aquisicao com o Anterior *-1)
                     wMovimAtu      := (dtmOperComum.QryLocal.FieldByName('MOVIMATU').AsFloat *-1);
                     wMovimCar      := (dtmOperComum.QryLocal.FieldByName('MOVIMCAR').AsFloat *-1);
                     wMovimVar      := (dtmOperComum.QryLocal.FieldByName('VLRVARIACAO').AsFloat*-1);
                     wMovimJur      := (dtmOperComum.QryLocal.FieldByName('VLRJUROS').AsFloat*-1);
                     wMovimPre      := (dtmOperComum.QryLocal.FieldByName('VLRPREMIO').AsFloat*-1);
                     wMovimIRProv   := (dtmOperComum.QryLocal.FieldByName('VLRIRPROV').AsFloat*-1);
                     wMovimIRApu    := (dtmOperComum.QryLocal.FieldByName('VLRIRAPU').AsFloat*-1);
                     wMovimIOFProv  := (dtmOperComum.QryLocal.FieldByName('VLRIOFPROV').AsFloat*-1);
                     wMovimIOFApu   := (dtmOperComum.QryLocal.FieldByName('VLRIOFAPU').AsFloat*-1);
                     wMovimAgio     := (dtmOperComum.QryLocal.FieldByName('VLRAGIO').AsFloat*-1);
                     dtmOperComum.QryLocal.Close;
                  end;
               end;

               //------------------------------------------------------------------------------
               // CASO SEJA TRANSFERENCIA DE CARTEIRAS (NO INVESTIMENTO)
               //AL_82
               If ((wTipoMov = 'TRC') or (wTipoMov = 'TRP'))Then
               begin
                  //AL_82
                  if wTipoMov = 'TRC' then
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
                                                         iHistorico, -1, sLote);
                  fSaldoQtd      := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal;
                  fSaldoVlr      := CtrlRendaVariavel.BuscaSaldoRV.SaldoVlrTotal;
                  fSdoAtu        := 0;
                  fSdoCar        := 0;
                  fSaldoAqui     := CtrlRendaVariavel.BuscaSaldoRV.SaldoCusto;
                  fSaldoRend     := 0;
                  fSaldoVariacao := CtrlRendaVariavel.BuscaSaldoRV.SaldoVariacao;
                  fSaldoIrApu    := CtrlRendaVariavel.BuscaSaldoRV.SaldoIRApurado;
                  fSaldoPP       := CtrlRendaVariavel.BuscaSaldoRV.SaldoProvPerda;
                  //AL_83 - Fim

                  //AL_77
                  fSaldoVlr := fSaldoVlr + fSaldoPP;

                  // Diminue
                  If (cNaturezaMovimento = 'D') Then
                  begin
                     wMovimAqui      := Round(DivValorZero((fQtdInvestOperacao * fSaldoAqui),fSaldoQtd),2)*-1;
                     wMovimAtu       := Round(DivValorZero((fQtdInvestOperacao * fSdoAtu),fSaldoQtd),2)*-1;
                     wMovimCar       := Round(DivValorZero((fQtdInvestOperacao * fSdoCar),fSaldoQtd),2)*-1;
                     wMovimVar       := Round(DivValorZero((fQtdInvestOperacao * fSaldoVariacao),fSaldoQtd),2)*-1;
                     wMovimIRApu     := Round(DivValorZero((fQtdInvestOperacao * fSaldoIrApu),fSaldoQtd),2)*-1;
                     wSaldoRend      := Round(DivValorZero(((fSaldoQtd-fQtdInvestOperacao) * fSaldoRend),fSaldoQtd),2);
                  end;
                  // Aumenta
                  If (cNaturezaMovimento = 'A') Then
                  begin
                     wMovimAqui     := qryAtualizaSaldoI.FieldByName('MOVIMAQUI').asFloat;
                     wMovimVar      := qryAtualizaSaldoI.FieldByName('VLRVARIACAO').asFloat;
                     wMovimIRApu    := qryAtualizaSaldoI.FieldByName('VLRIRAPU').asFloat;
                     wMovimAtu       := 0;
                     wMovimCar       := 0;
                     wSaldoRend      := 0;
                  end;
               end;

               // Caso Movimento seja de Rendimento Zera o Movimento de Aquisicao e Acumula Rendimento
               if (wTipoMov <> 'TRC') Then
               begin
                  If (cNaturezaMovimento = 'R') Then
                  begin
                     wSaldoRend:= wSaldoRendAnt + fValorOperacao;
                     //AL_33 - 25/04/2005
                     //AL_109
                     If Not ((iIdTipoOperacao = CtrlPInv.IdTipoOperDirRes) Or
                             (iIdTipoOperacao = CtrlPInv.IdTipoOperDirRes+10000)) Then
                     begin
                        wMovimAqui:=0;
                        wMovimCar :=0;
                     end;
                  end
                  else
                     wSaldoRend := wSaldoRendAnt;
               end;

               // Calcula Sados de Carregamento, Aquisicao, Variação, Juros e Premio
               wSaldoCar     := (wSaldoCarAnt  + wMovimCar);
               wSaldoAqui    := (wSaldoAquiAnt + wMovimAqui);
               wSaldoAtu     := (wSaldoAtuAnt  + wMovimAtu);
               wSaldoVar     := (wSaldoVarAnt  + wMovimVar);
               wSaldoJur     := (wSaldoJurAnt  + wMovimJur);
               wSaldoPre     := (wSaldoPreAnt  + wMovimPre);
               wSaldoIRProv  := (wSaldoIRProvAnt  + wMovimIRProv);
               wSaldoIRApu   := (wSaldoIRApuAnt   + wMovimIRApu);
               wSaldoIOFProv := (wSaldoIOFProvAnt + wMovimIOFProv);
               wSaldoIOFApu  := (wSaldoIOFApuAnt  + wMovimIOFApu);
               wSaldoAgio    := (wSaldoAgioAnt    + wMovimAgio);

               //AL_77 - Ini
               fPercProvPerda := BuscaPercProvPerda(dDataOper, iInvestimento);
               if fPercProvPerda > 0 then
               begin
                  wSaldoProvPerda := RoundCM(fValorFinalInvest * (fPercProvPerda / 100),2);
                  wMovimProvPerda := wSaldoProvPerda - wSaldoProvPerdaAnt;
               end
               else
               begin
                  wMovimProvPerda := wSaldoProvPerdaAnt;
                  wSaldoProvPerda := 0;
               end;
               //AL_77 - Fim

               // Se Atualização de Opções, descarrega no prêmio e nâo na variação
               if (iCarteira = pRPI.IDCARTOPC) and (iIdTipoOperacao = 0) then  // na atualizaçào de RV o tipooperacao é = a Zéro
               begin
                  wMovimPre := wMovimVar;
                  wSaldoPre := (wSaldoPreAnt  + wMovimPre);
                  wSaldoVar := 0;
                  wMovimVar := 0;
               end;

               // Acerta Flag de Calculo de Saldo ( 1 -> 2 ou 3-> '')
               If Trim(QryAtualizaSaldoI.FieldByName('FLGCALCSALDO').asString) = '2' Then
                  wTipoAtualizacao := '';

               // Caso a o Saldo em quantidade da Carteira Zere, Zera os saldos de
               // Rendimento e Atarial
               If fQtdeFinalInvest = 0 Then
               begin
                 wSaldoRend := 0;
                 wSaldoAtu  := 0;
               end;
               // Muda o Separador Decimal
               wDec:=DecimalSeparator;
               DecimalSeparator :='.';
               //------------------------------------------------------------------------------
               // Tenta atualizar o Arquivo
               Try
                  With dtmOperComum.qryLocal Do
                  begin
                     //AL_42 Ini
                     // AL_69 Ini
                     if Sistema.TipoCliente = 19991 then  //FUNCEF
                     begin
                        if (wTipoMov = 'LUC') then
                           fVlrDifCusto := RoundCM((fValorFinalInvest - (wSaldoAqui + wSaldoVar + fValorOperacao)),2)
                        else
                           fVlrDifCusto := RoundCM((fValorFinalInvest - (wSaldoAqui + wSaldoVar)),2);
                     end
                     //AL_76
                     else if Sistema.TipoCliente = 19971 then  //REFER
                     begin
                        if (wTipoMov = 'LUC') then
                        begin
                           wMovimVar := fValorOperacao;
                           wSaldoVar := wSaldoVar + wMovimVar;
                           //AL_76 Testa se é venda total
                           dtmOperComum.QryLucroPrejuizo.Close;
                           dtmOperComum.QryLucroPrejuizo.ParamByName('IDOPERACAOINVEST').AsInteger :=
                                            QryAtualizaSaldoI.FieldByName('IDOPERACAOINVEST').AsInteger;
                           dtmOperComum.QryLucroPrejuizo.Open;
                           wVlrMovOperacao:=dtmOperComum.QryLucroPrejuizo.FieldByName('VLRMOVCARTINV').AsFloat;
                           wQtdMovOperacao:=dtmOperComum.QryLucroPrejuizo.FieldByName('QTDEMOVINVCART').AsFloat;
                           dtmOperComum.QryLucroPrejuizo.Close;
                           if (fQtdeFinalInvest - wQtdMovOperacao) = 0 then //Venda Total
                           begin
                              wMovimVar := (ABS(wVlrMovOperacao) - fValorInicialInvest - wTotDespOper);
                              wSaldoVar   := wSaldoVarAnt + wMovimVar;
                              wMovimAqui  := wTotDespOper;
                              wSaldoAqui  := wMovimAqui + wSaldoAqui;
                           end;

                        end
                        //AL_76
                        else if (wTipoMov = 'OPE') and (cNaturezaMovimento = 'D') then
                        begin
                           wSaldoVar := RoundCM((fValorFinalInvest - wSaldoAqui),2); // Volta o Lucro para variacao
                           wMovimVar := wSaldoVar - wSaldoVarAnt;
                           if fQtdeFinalInvest = 0 then // Venda Total = -> Tem que zerar os saldos
                           begin
                              wMovimVar         := -wSaldoVarAnt;
                              wSaldoVar         :=  wSaldoVarAnt + wMovimVar;
                              fValorFinalInvest := -wTotDespOper;
                           end;
                        end
                        //AL_76
                        else if (wTipoMov = 'DOP') and (fQtdeFinalInvest = 0) then //Venda Total
                           wSaldoAqui := 0;
                     end
                     else
                        fVlrDifCusto := RoundCM((fValorFinalInvest - (wSaldoAqui + wSaldoVar)),2);

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
                     if (fQtdeFinalInvest < 0) and (iTipoInvest <> 8) then
                        Raise Exception.Create('Saldo insuficiente para atualizar histórico em ' +
                                               QryAtualizaSaldoI.FieldByName('DATAMOVCARTINV').AsString);

                     Close;
                     Sql.Clear;
                     Sql.Add('UPDATE HISTCARTINV SET ');
                     Sql.Add('SALDOQTDEINVCART   = '+FloatToStr(fQtdeFinalInvest) +', ');
                     Sql.Add('SALDOQTDECPMF      = '+FloatToStr(fQtdeFinalCPMF) + ', ');
                     Sql.Add('SALDOVLRINVCART    = '+FloatToStr(fValorFinalInvest-wSaldoProvPerda)+', ');
                     Sql.Add('MOVIMATU       = '+FloatToStr(wMovimAtu) +', ');
                     Sql.Add('SALDOATU       = '+FloatToStr(wSaldoAtu) +', ');
                     Sql.Add('MOVIMCAR       = '+FloatToStr(wMovimCar) +', ');
                     Sql.Add('SALDOCAR       = '+FloatToStr(wSaldoCar) +', ');
                     Sql.Add('MOVIMAQUI      = '+FloatToStr(wMovimAqui)+', ');
                     //AL_42
                     Sql.Add('SALDOAQUI      = '+FloatToStr(RoundCM(wSaldoAqui,2))+', ');
                     Sql.Add('SALDOREND      = '+FloatToStr(wSaldoRend)+', ');
                     //AL_42
                     Sql.Add('SALDOVARIACAO  = '+FloatToStr(RoundCM(wSaldoVar,2)) +', ');
                     Sql.Add('SALDOJUROS     = '+FloatToStr(wSaldoJur) +', ');
                     Sql.Add('VLRVARIACAO    = '+FloatToStr(wMovimVar) +', ');
                     Sql.Add('VLRJUROS       = '+FloatToStr(wMovimJur) +', ');
                     Sql.Add('VLRPREMIO      = '+FloatToStr(wMovimPre) +', ');
                     Sql.Add('SALDOPREMIO    = '+FloatToStr(wSaldoPre) +', ');
                     Sql.Add('VLRIRPROV      = '+FloatToStr(wMovimIRProv) +', ');
                     Sql.Add('SALDOIRPROV    = '+FloatToStr(wSaldoIRProv) +', ');
                     Sql.Add('VLRIRAPU       = '+FloatToStr(wMovimIRApu) +', ');
                     Sql.Add('SALDOIRAPU     = '+FloatToStr(wSaldoIRApu) +', ');
                     Sql.Add('VLRIOFPROV     = '+FloatToStr(wMovimIOFProv) +', ');
                     Sql.Add('SALDOIOFPROV   = '+FloatToStr(wSaldoIOFProv) +', ');
                     Sql.Add('VLRIOFAPU      = '+FloatToStr(wMovimIOFApu) +', ');
                     Sql.Add('SALDOIOFAPU    = '+FloatToStr(wSaldoIOFApu) +', ');
                     Sql.Add('VLRAGIO        = '+FloatToStr(wMovimAgio) +', ');
                     Sql.Add('SALDOAGIO      = '+FloatToStr(wSaldoAgio) +', ');
                     Sql.Add('FLGCALCSALDO   = '+QuotedStr(wTipoAtualizacao) + ', ');
                     //AL_77
                     Sql.Add('VLRPROVPERDA   = '+FloatToStr(wMovimProvPerda) + ', ');
                     Sql.Add('SALDOPROVPERDA = '+FloatToStr(wSaldoProvPerda) + ' ');
                     Sql.Add('WHERE (IDHISTCARTINV = '+
                                QuotedStr(QryAtualizaSaldoI.FieldByName('IDHISTCARTINV').AsString)+')');
                     ExecSql;
                     Close;
                  end;
               except
                  on E: Exception do
                  begin
                     //AL_89
                     MsgDlg('Houve um problema ao atualizar os saldos' + #13 +
                            'Mensagem: ' + E.Message, 'Mensagem do Sistema', mtWarning, [mbOK], 0);
                     // Libera Objetos Locais
                     DecimalSeparator :=wDec;
                     dtmOperComum.QryLocal.Close;
                     Result := False;
                     Exit;
                  end;
               end;
               DecimalSeparator :=wDec;
               dtmOperComum.QryLocal.Close;
               fQtdeInicialInvest   := fQtdeFinalInvest;
               fQtdeInicialCPMF     := fQtdeFinalCPMF;
               fValorInicialInvest  := fValorFinalInvest;
               wQtdInvestAnt        := fQtdeFinalInvest;
               wSaldoAtuAnt         := wSaldoAtu;
               wSaldoCarAnt         := wSaldoCar;
               wSaldoAquiAnt        := wSaldoAqui;
               wSaldoRendAnt        := wSaldoRend;
               wSaldoVarAnt         := wSaldoVar;
               wSaldoJurAnt         := wSaldoJur;
               wSaldoPreAnt         := wSaldoPre;
               wSaldoIRProvAnt      := wSaldoIRProv;
               wSaldoIRApuAnt       := wSaldoIRApu;
               wSaldoIOFProvAnt     := wSaldoIOFProv;
               wSaldoIOFApuAnt      := wSaldoIOFApu;
               wSaldoAgioAnt        := wSaldoAgio;
               //AL_77
               wSaldoProvPerdaAnt   := wSaldoProvPerda;
               qryAtualizaSaldoI.Next;
            end; // While
            if not Result then
            begin
               mensagem := 'Foram encontradas Inconsistências no Cálculo dos Saldos de Investimentos!';
               //AL_89
               MsgDlg(mensagem, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            end;
         Except
            //AL_89
            MsgDlg('Houve um problema na Atualização dos Saldos','Erro', mtWarning, [mbOK], 0);
            Result := false;
            Exit;
         end;
      end;
      // Final do Processo \\
   Finally
      dtmOperacaoInvest.qrySaldoCarteira.Close;
      dtmOperacaoInvest.qryFlgAtualSaldo13.Close;
      dtmOperacaoInvest.qryFlgAtualSaldo2.Close;
      dtmOperacaoInvest.qryAtualizaSaldoC.Close;
      dtmOperacaoInvest.qryAtualizaSaldoIL.Close;
      If bCriaqryAtualizaSaldoI Then
         qryAtualizaSaldoI.Close;
      dtmOperComum.QryLocal.Close;
      //AL_83
      FreeAndNil(QryLocal);
      FreeAndNil(QryLocal1);
      FreeAndNil(CtrlRendaVariavel);
   end;
end;

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
function TOperComum.CalculaSaldo(iInvestimento, iCarteira: integer; sLote: string; dDataOper: TDateTime;
                var fSaldoQtdeInvCart, fSaldoVlrInvCart, fSaldoCotasCartInv,
                    fSaldoVlrCartInv, fSaldoAtu, fSaldoCar, fSaldoAqui, fSaldoRend, fSaldoMercado,
                    fSaldoVar, fSaldoJur, fSaldoPre, fSaldoIRProv, fSaldoIRApu, fSaldoIOFProv,
                    fSaldoIOFApu, fSaldoAgio: double)
                    : boolean;

var
   qrySaldoCarteira, qrySaldoInvest, QryLocal : TwwQuery;
   bRetorno : boolean;
   fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcAqui,
   fSdoParcRend, fSdoParcCar, fSdoParcMercado, fSdoParcVar, fSdoParcJur,
   fSdoParcPre, fSdoParcInutil, fSdoParcIRProv, fSdoParcIRApu, fSdoParcIOFProv,
   fSdoParcIOFApu, fSdoParcAgio, fSdoQtdLibCustod, fSaldoQtdCPMF : double;
   //AL_71
   fSaldoInutil : double;
begin
   try
      fSaldoCotasCartInv  := 0;
      fSaldoVlrCartInv    := 0;
      fSaldoQtdeInvCart   := 0;
      fSaldoVlrInvCart    := 0;
      fSaldoAtu           := 0;
      fSaldoAqui          := 0;
      fSaldoRend          := 0;
      fSaldoCar           := 0;
      fSaldoMercado       := 0;
      fSaldoVar           := 0;
      fSaldoJur           := 0;
      fSaldoPre           := 0;
      fSaldoIRProv        := 0;
      fSaldoIRApu         := 0;
      fSaldoIOFProv       := 0;
      fSaldoIOFApu        := 0;
      fSaldoAgio          := 0;
      fSdoQtdLibCustod    := 0;
      fSdoParcInutil      := 0;
      //AL_71
      fSaldoInutil        := 0;

      if (iInvestimento = -1) and (sLote = '-1') and (ICarteira <> -1) then begin
         // Busca Saldo da Carteira
         qrySaldoCarteira := TwwQuery(dtmOperComum.qrySaldoCarteira);
         with qrySaldoCarteira do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('IDCARTEIRA').AsInteger     := iCarteira;
            ParamByName('DATAMOV').AsDateTime       := dDataOper;
            ParamByName('IDHISTORICO').AsInteger    := high(integer);
            Open;
            First;
         end;
         if not qrySaldoCarteira.isEmpty then
            fSaldoCotasCartInv := qrySaldoCarteira.FieldByName('SALDOCOTASCARTINV').AsFloat;
            fSaldoVlrCartInv   := qrySaldoCarteira.FieldByName('SALDOVLRCARTINV').AsFloat;
      end;

      if (iInvestimento <> -1) and (sLote <> '-1') and (ICarteira <> -1) then
         // Busca Saldo do Lote do Investimento em questão na Carteira
         //AL_2
         //AL_5
         //AL_71
         //AL_75
         //AL_78
         BuscaTodosSaldosInvestLote (
                 iCarteira, 0{IDCARTEIRAGERENC}, iInvestimento, 99999999,-1, sLote,
                 DateToStr(dDataOper), -1,
                 fSaldoQtdeInvCart, fSaldoVlrInvCart, fSaldoAtu,     fSaldoCar,
                 fSaldoAqui,        fSaldoRend,       fSaldoMercado, fSaldoVar,
                 fSaldoJur,         fSaldoPre,        fSaldoIRProv,  fSaldoIRApu,
                 fSaldoIOFProv,     fSaldoIOFApu,     fSaldoAgio,    fSdoQtdLibCustod,
                 fSdoParcInutil,    fSaldoQtdCPMF,    fSaldoInutil);

      if (iInvestimento <> -1) and (sLote = '-1') and (ICarteira = -1) then begin
         // Busca Saldo do Investimento em todas as Carteira em que ele existir

         // Cria Objetos Locais
         QryLocal              := TwwQuery.Create(Application);
         QryLocal.DatabaseName := 'BaseDados';

         // Busca Carteiras que possuem o Investimento
         with QryLocal do
           begin
               Close;
               Sql.Clear;
               Sql.add(' SELECT DISTINCT IDCARTEIRAINVEST, IDLOTE              ');
               Sql.add(' FROM HISTCARTINV                                   ');
               Sql.add(' WHERE (IDINVESTIMENTO = '+InttoStr(iInvestimento)+')  ');
               Sql.add(' ORDER BY IDCARTEIRAINVEST, IDLOTE                  ');
               Open;
           end;

         while not QryLocal.EOF do begin
         // Acumula Saldo do Investimento em questão nessa Carteira

            fSdoParcQtdeInvCart  := 0;
            fSdoParcVlrInvCart   := 0;
            fSdoParcAtu          := 0;
            fSdoParcAqui         := 0;
            fSdoParcRend         := 0;
            fSdoParcCar          := 0;
            fSdoParcMercado      := 0;
            fSdoParcVar          := 0;
            fSdoParcJur          := 0;
            fSdoParcPre          := 0;
            fSdoParcIRProv       := 0;
            fSdoParcIRApu        := 0;
            fSdoParcIOFProv      := 0;
            fSdoParcIRApu        := 0;
            fSdoParcAgio         := 0;
            //AL_2
            //AL_5
            //AL_71
            //AL_75
            //AL_78
            if BuscaTodosSaldosInvestLote (
                    QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                    0{IDCARTEIRAGERENC},
                    iInvestimento, 99999999,-1,
                    QryLocal.FieldByName('IDLOTE').AsString, DateToStr(dDataOper), -1,
                    fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcCar,
                    fSdoParcAqui       , fSdoParcRend      , fSdoParcMercado,
                    fSdoParcVar        , fSdoParcJur       , fSdoParcPre,
                    fSdoParcIRProv     , fSdoParcIRApu     , fSdoParcIOFProv,
                    fSdoParcIRApu      , fSdoParcAgio      , fSdoQtdLibCustod,
                    fSdoParcInutil     , fSdoParcInutil    , fSaldoInutil) then
            begin

               fSaldoQtdeInvCart   := fSaldoQtdeInvCart + fSdoParcQtdeInvCart;
               fSaldoVlrInvCart    := fSaldoVlrInvCart  + fSdoParcVlrInvCart;
               fSaldoAtu           := fSaldoAtu         + fSdoParcAtu;
               fSaldoAqui          := fSaldoAqui        + fSdoParcAqui;
               fSaldoRend          := fSaldoRend        + fSdoParcRend;
               fSaldoCar           := fSaldoCar         + fSdoParcCar;
               fSaldoMercado       := fSaldoMercado     + fSdoParcMercado;
               fSaldoVar           := fSaldoVar         + fSdoParcVar;
               fSaldoJur           := fSaldoJur         + fSdoParcJur;
               fSaldoPre           := fSaldoPre         + fSdoParcPre;
               fSaldoIRProv        := fSaldoIRProv      + fSdoParcIRProv;
               fSaldoIRApu         := fSaldoIRApu       + fSdoParcIRApu;
               fSaldoIOFProv       := fSaldoIOFProv     + fSdoParcIOFProv;
               fSaldoIOFApu        := fSaldoIOFApu      + fSdoParcIOFApu;
               fSaldoAgio          := fSaldoAgio        + fSdoParcAgio;
            end;
            // Pula para o Proximo Registro
            QryLocal.Next;
         end;
         // Libera Objetos Locais
         QryLocal.Free;
      end;

      if (iInvestimento <> -1) and (sLote = '-1') and (ICarteira <> -1) then begin
         // Busca Saldo do Investimento na Carteira (percorre todos os lotes)

         // Cria Objetos Locais
         QryLocal              := TwwQuery.Create(Application);
         QryLocal.DatabaseName := 'BaseDados';

         // Busca Carteiras que possuem o Investimento
         with QryLocal do
           begin
               Close;
               Sql.Clear;
               Sql.add(' SELECT DISTINCT IDLOTE              ');
               Sql.add(' FROM HISTCARTINV                                   ');
               Sql.add(' WHERE (IDCARTEIRAINVEST = '+InttoStr(iCarteira)+')  ');
               Sql.add('   and (IDINVESTIMENTO   = '+InttoStr(iInvestimento)+')  ');
               Sql.add(' ORDER BY IDLOTE                  ');
               Open;
           end;

         while not QryLocal.EOF do begin
            // Acumula Saldo do Investimento em questão nessa Carteira

            fSdoParcQtdeInvCart  := 0;
            fSdoParcVlrInvCart   := 0;
            fSdoParcAtu          := 0;
            fSdoParcAqui         := 0;
            fSdoParcRend         := 0;
            fSdoParcCar          := 0;
            fSdoParcMercado      := 0;
            fSdoParcVar          := 0;
            fSdoParcJur          := 0;
            fSdoParcPre          := 0;
            fSdoParcIRProv       := 0;
            fSdoParcIRApu        := 0;
            fSdoParcIOFProv      := 0;
            fSdoParcIRApu        := 0;
            fSdoParcAgio         := 0;
            fSdoQtdLibCustod     := 0;
            //AL_2
            //AL_5
            //AL_71
            //AL_75
            //AL_78
            if BuscaTodosSaldosInvestLote (
                    iCarteira, 0{IDCARTEIRAGERENC}, iInvestimento, 99999999,-1,
                    QryLocal.FieldByName('IDLOTE').AsString, DateToStr(dDataOper), -1,
                    fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcCar,
                    fSdoParcAqui       , fSdoParcRend      , fSdoParcMercado,
                    fSdoParcVar        , fSdoParcJur       , fSdoParcPre,
                    fSdoParcIRProv     , fSdoParcIRApu     , fSdoParcIOFProv,
                    fSdoParcIRApu      , fSdoParcAgio      , fSdoQtdLibCustod,
                    fSdoParcInutil     , fSdoParcInutil    , fSaldoInutil ) then
            begin
               fSaldoQtdeInvCart   := fSaldoQtdeInvCart + fSdoParcQtdeInvCart;
               fSaldoVlrInvCart    := fSaldoVlrInvCart  + fSdoParcVlrInvCart;
               fSaldoAtu           := fSaldoAtu         + fSdoParcAtu;
               fSaldoAqui          := fSaldoAqui        + fSdoParcAqui;
               fSaldoRend          := fSaldoRend        + fSdoParcRend;
               fSaldoCar           := fSaldoCar         + fSdoParcCar;
               fSaldoMercado       := fSaldoMercado     + fSdoParcMercado;
               fSaldoVar           := fSaldoVar         + fSdoParcVar;
               fSaldoJur           := fSaldoJur         + fSdoParcJur;
               fSaldoPre           := fSaldoPre         + fSdoParcPre;
               fSaldoIRProv        := fSaldoIRProv      + fSdoParcIRProv;
               fSaldoIRApu         := fSaldoIRApu       + fSdoParcIRApu;
               fSaldoIOFProv       := fSaldoIOFProv     + fSdoParcIOFProv;
               fSaldoIOFApu        := fSaldoIOFApu      + fSdoParcIOFApu;
               fSaldoAgio          := fSaldoAgio        + fSdoParcAgio;
            end;
            // Pula para o Proximo Registro
            QryLocal.Next;
         end;
         // Libera Objetos Locais
         QryLocal.Free;
      end;

   finally
      dtmOperComum.qrySaldoCarteira.Close;       {qrySaldoCarteira.Close}
   end;
end;

// Função que Soma Saldos dos  Investimentos na Carteira para uma determinada data
function TOperComum.SaldosInvCart(iCarteira: integer; dDataRef: TDateTime;
                var fSaldoQtdeInvCart, fSaldoVlrInvCart,
                    fSaldoAtu, fSaldoCar, fSaldoAqui, fSaldoRend, fSaldoMercado: double)
                    : boolean;
var
   QryLocal  :TwwQuery;
   bRetorno : boolean;
   fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcAqui, fSdoParcRend,
   fSdoParcCar, fSdoParcMercado, fSaldoInutil : double;
begin
    fSaldoQtdeInvCart  := 0;
    fSaldoVlrInvCart   := 0;
    fSaldoAtu          := 0;
    fSaldoAqui         := 0;
    fSaldoRend         := 0;
    fSaldoCar          := 0;
    fSaldoMercado      := 0;

    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    with QryLocal do
      begin
          Close;
          Sql.Clear;
          Sql.add(' SELECT DISTINCT IDINVESTIMENTO, IDLOTE            ');
          Sql.add(' FROM HISTCARTINV                               ');
          Sql.add(' WHERE (IDCARTEIRAINVEST = '+InttoStr(iCarteira)+')  ');
          Sql.add('   and (IDINVESTIMENTO IS not NULL)                ');
          Sql.add(' ORDER BY IDINVESTIMENTO, IDLOTE                ');
          Open;
      end;
      while not QryLocal.EOF do begin
      // Acumula Saldo do Investimento em questão nessa Carteira
         fSdoParcQtdeInvCart  := 0;
         fSdoParcVlrInvCart   := 0;
         fSdoParcAtu          := 0;
         fSdoParcAqui         := 0;
         fSdoParcRend         := 0;
         fSdoParcCar          := 0;
         //AL_2
         //AL_5
         //AL_71
         //AL_75
         //AL_78
         if BuscaTodosSaldosInvestLote (iCarteira, 0{IDCARTEIRAGERENC},
                 QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                 99999999,-1,
                 QryLocal.FieldByName('IDLOTE').AsString, DateToStr(dDataRef), -1,
                 fSdoParcQtdeInvCart, fSdoParcVlrInvCart, fSdoParcAtu, fSdoParcCar,
                 fSdoParcAqui       , fSdoParcRend      , fSdoParcMercado,
                 fSaldoInutil       , fSaldoInutil      , fSaldoInutil,
                 fSaldoInutil       , fSaldoInutil      , fSaldoInutil,
                 fSaldoInutil       , fSaldoInutil      , fSaldoInutil,
                 fSaldoInutil       , fSaldoInutil      , fSaldoInutil) then
         begin
            fSaldoQtdeInvCart   := fSaldoQtdeInvCart + fSdoParcQtdeInvCart;
            fSaldoVlrInvCart    := fSaldoVlrInvCart  + fSdoParcVlrInvCart;
            fSaldoAtu           := fSaldoAtu         + fSdoParcAtu;
            fSaldoAqui          := fSaldoAqui        + fSdoParcAqui;
            fSaldoRend          := fSaldoRend        + fSdoParcRend;
            fSaldoCar           := fSaldoCar         + fSdoParcCar;
            fSaldoMercado       := fSaldoMercado     + fSdoParcMercado;
         end;
         // Pula para o Proximo Registro
         QryLocal.Next;
      end;

  QryLocal.Free;

end;

//Al_29 - 29/03/2005
// Totalizador Carteira, Investimento e Plano ou um a um
procedure TOperComum.TotalSaldosInvCart(iiCarteira, iiCartGerenc,
                                        iiInvestimento, iiPlanPrevCtbPatr : integer;
                                        dDataRef: TDateTime;
                                    var fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu,
                                        fSdoCar, fSdoAqui, fSdoRend : double);
var
   fSaldoInutil : double;
begin
    If dDataRef <= 0 Then
       Exit;
       
    OperComum.LimpaParametros(dtmOperComum.qrySaldoInvNullTotal);
    with dtmOperComum.qrySaldoInvNullTotal do
    begin
       if iiCarteira > 0 then
          ParamByName('IDCARTEIRAINVEST').AsInteger  := iiCarteira;
       if iiInvestimento > 0 then
          ParamByName('IDINVESTIMENTO').AsInteger    := iiInvestimento;
       if iiPlanPrevCtbPatr > 0 then
          ParamByName('IDPLANPREVCTBPATR').AsInteger := iiPlanPrevCtbPatr;
       ParamByName('HISTORICO').AsInteger         := high(integer);
       ParamByName('DATAMOV').AsString            := DateToStr(dDataRef);
       Open;

       if not(isEmpty) then
       begin
          fSdoQtdeInvCart   := FieldByName('SALDOQTDEINVCART').AsFloat;
          fSdoVlrInvCart    := FieldByName('SALDOVLRINVCART').AsFloat;
          fSdoAtu           := FieldByName('SALDOATU').AsFloat;
          fSdoAqui          := FieldByName('SALDOAQUI').AsFloat;
          fSdoRend          := FieldByName('SALDOREND').AsFloat;
          fSdoCar           := FieldByName('SALDOCAR').AsFloat;
       end;
    end;
end;

// Função que Busca Cotação de um Investimento numa determinada data
function TOperComum.BuscaCotacaoInvest(iInvestimento: integer; dDataRef: TDateTime; bUsaLote: boolean): double;
begin
    Result := 0;
    dtmOperComum.QryBuscaCotacaoInvest.Close;
    dtmOperComum.QryBuscaCotacaoInvest.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
    dtmOperComum.QryBuscaCotacaoInvest.ParamByName('DATACOTACAO').AsDateTime   := dDataRef;
    dtmOperComum.QryBuscaCotacaoInvest.Open;

// Caso Utilize Lote Faz Calculo
    if bUsaLote then begin
      if dtmOperComum.QryBuscaCotacaoInvest.FieldByName('QTDTITLOTE').AsFloat <> 0 then
         Result := (dtmOperComum.QryBuscaCotacaoInvest.FieldByName('VLRCONTABIL').AsFloat /
                    dtmOperComum.QryBuscaCotacaoInvest.FieldByName('QTDTITLOTE').AsFloat)
      else
         Result :=  dtmOperComum.QryBuscaCotacaoInvest.FieldByName('VLRCONTABIL').AsFloat;
    end else begin
// Caso Não Utilize Lote. Guarda
      Result    :=  dtmOperComum.QryBuscaCotacaoInvest.FieldByName('VLRCONTABIL').AsFloat;
    end;
    dtmOperComum.QryBuscaCotacaoInvest.Close;
end;

// Função que Busca Cotação de um Investimento na COTACAOACAO numa determinada data
function TOperComum.BuscaCotacaoAcao(iInvestimento: integer; dDataRef: TDateTime; bUsaLote: boolean): double;
var
   QryLocal  :TwwQuery;
   //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
   CtrlParamCotacaoRV : TCtrlParamCotacaoRV;
   sCampo, sTipo      : String;
begin
    Result := 0;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
    CtrlParamCotacaoRV := TCtrlParamCotacaoRV.Create;
    CtrlParamCotacaoRV.InitializeAs(Padroes);
    sCampo := CtrlParamCotacaoRV.RetornaCotacaoVigente(dDataRef,sTipo);

    FazQuery(QryLocal,
      //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
      ' SELECT CT.DATACOTAACAO, CT.'+sCampo+' AS VLRMEDIA, CT.QTDELOTE '+
      ' FROM COTACAOACAO CT, '+
      '      (SELECT MAX(DATACOTAACAO) AS DATA '+
      '       FROM   COTACAOACAO '+
      '       WHERE (DATACOTAACAO <= TO_DATE( '''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) AND'+
      '             (IDACAO = '''+ InttoStr(iInvestimento)+''') AND'+
      '             (VLRMEDIA > 0)) CT1     '+
      '  WHERE (CT.DATACOTAACAO = DATA) AND '+
      '        (IDACAO = '''+ InttoStr(iInvestimento)+''') ');
// Caso Utilize Lote Faz Calculo
    if bUsaLote then begin
      if QryLocal.FieldByName('QTDELOTE').AsFloat <> 0 then
         Result := (QryLocal.FieldByName('VLRMEDIA').AsFloat /
                    QryLocal.FieldByName('QTDELOTE').AsFloat)
      else
         Result := QryLocal.FieldByName('VLRMEDIA').AsFloat;
    end else begin
// Caso Não Utilize Lote. Guarda
      Result := QryLocal.FieldByName('VLRMEDIA').AsFloat;
    end;
    QryLocal.Free;
    //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
    FreeAndNil(CtrlParamCotacaoRV);
end;

// Função que Busca Cotação de uma Moeda numa determinada data.
function TOperComum.LeMoeda(iMoeCodigo: integer; dCotData: TDateTime; sFlgProRata, sFlgInterpola: string): double;
var
   QryMoeda  :TwwQuery;
   fCotacao1, fCotacao2, fCotacao3 : double;
   dDataCotacao1, dDataCotacao2, dDataCotacao3 : TDateTime;
   iIntervalo1, iIntervalo2: integer;
   sMsgErro: string;
begin
   Result := 0;
   sMsgErro := 'Erro, Cadastro de Cotação de Moeda tem dados insuficientes para Cálculo Pró-Rata, Verifique !!!';
   try
      // testa valores de sFlgProRata
      if (sFlgProRata <> 'N') and (sFlgProRata <> 'L') and (sFlgProRata <> 'C') then begin
         MsgDlg('Parâmetro para Tipo de Cálculo informado incorretamente!', 'Erro', mtError, [mbOk], 0);
         Result := 0;
         Exit;
      end;
      // testa valores de sFlgInterpola
      if (sFlgProRata <> 'N') and ((sFlgInterpola <> 'I') and (sFlgInterpola <> 'E')) then begin
         MsgDlg('Parâmetro para Cálculo Pró-Rata informado incorretamente!', 'Erro', mtError, [mbOk], 0);
         Result := 0;
         Exit;
      end;

      qryMoeda := TwwQuery(dtmOperComum.qryMoeda);

      with qryMoeda do begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('MOEDA').AsInteger    := iMoeCodigo;
         Open;
         First;
      end;
      if qryMoeda.isEmpty then begin
         MsgDlg('Moeda não encontrada : '+QryMoeda.FieldByName('MOESIGLA').AsString,'Mensagem do Sistema',MtError,[MbOk],0);
         Result := 0;
         Exit;
      end;
//    Se não calcula Pró-Rata
      if sFlgProRata = 'N' then begin
         BuscaCotacaoMoeda(iMoeCodigo, dCotData, '', fCotacao1, dDataCotacao1);
         Result := fCotacao1;
      end else begin
         if QryMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'D' then begin
            BuscaCotacaoMoeda(iMoeCodigo, dCotData, '', fCotacao1, dDataCotacao1);
            Result := fCotacao1;
         end else begin
            if QryMoeda.FieldByName('FLGPERCVALOR').AsString = 'V' then begin
//             Se existir cotação na data de referência
               if BuscaCotacaoMoeda(iMoeCodigo, dCotData, '=', fCotacao1, dDataCotacao1) then begin
                  Result := fCotacao1;
               end else begin
//                Alimenta Parâmetros de Calculo Pró-Rata por Interpolação
                  if sFlgInterpola = 'I' then begin
                     if not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '<', fCotacao1, dDataCotacao1) then begin
                        MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                        Result := 0;
                        Exit;
                     end;
                     fCotacao3     := fCotacao1;
                     dDataCotacao3 := dDataCotacao1;
                     if not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '>', fCotacao2, dDataCotacao2) then begin
                        MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                        Result := 0;
                        Exit;
                     end;
                     iIntervalo1   := DiasUteis.IntervaloDias(dDataCotacao1, dDataCotacao2);
                     iIntervalo2   := DiasUteis.IntervaloDias(dDataCotacao1, dCotData);
                  end else begin
//                   Alimenta Parâmetros de Calculo Pró-Rata por Extrapolação
                     if not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '<', fCotacao2, dDataCotacao2) then begin
                        MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                        Result := 0;
                        Exit;
                     end;
                     fCotacao3     := fCotacao2;
                     dDataCotacao3 := dDataCotacao2;
                     if not BuscaCotacaoMoeda(iMoeCodigo, dDataCotacao2, '<', fCotacao1, dDataCotacao1) then begin
                        MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                        Result := 0;
                        Exit;
                     end;
                     iIntervalo1   := DiasUteis.IntervaloDias(dDataCotacao1, dDataCotacao2);
                     iIntervalo2   := DiasUteis.IntervaloDias(dDataCotacao2, dCotData);
                  end;
//                Executa Cáculo Pró-Rata Linear
                  if sFlgProRata = 'L' then
                     Result := fCotacao3 * ((((fCotacao2/fCotacao1) - 1)
                                         * (iIntervalo2/iIntervalo1)) + 1)
                  else
//                Executa Cáculo Pró-Rata Exponencial
                     Result := fCotacao3 * Power((fCotacao2/fCotacao1),
                                                 (iIntervalo2/iIntervalo1));
               end;
            end else if QryMoeda.FieldByName('FLGPERCVALOR').AsString = 'P' then begin
//             Se existir cotação na data de referência
               if BuscaCotacaoMoeda(iMoeCodigo, dCotData, '=', fCotacao1, dDataCotacao1) then begin
                  Result := 0;
               end else begin
//                Alimenta Parâmetros de Calculo Pró-Rata por Interpolação
                  if sFlgInterpola = 'I' then begin
                     if not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '>', fCotacao2, dDataCotacao2) then begin
                        MsgDlg('Erro, Cadastro de Cotação de Moeda tem dados insuficientes para Cálculo Pró-Rata, Verifique !!!', 'Erro', mtError, [mbOk], 0);
                        Result := 0;
                        Exit;
                     end;            
                     iIntervalo1 := DiasUteis.ExtraiDia(
                                      DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataCotacao2),
                                                          DiasUteis.ExtraiMes(dDataCotacao2)));
                     iIntervalo2 := DiasUteis.IntervaloDias(
                                      EncodeDate(DiasUteis.ExtraiAno(dDataCotacao2),
                                              DiasUteis.ExtraiMes(dDataCotacao2), 1),
                                      dCotData + 1);
                  end else begin
//                   Alimenta Parâmetros de Calculo Pró-Rata por Extrapolação
                     if not BuscaCotacaoMoeda(iMoeCodigo, dCotData, '<', fCotacao2, dDataCotacao2) then begin
                        MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0);
                        Result := 0;
                        Exit;
                     end;
                     iIntervalo1 := DiasUteis.ExtraiDia(
                                      DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataCotacao2),
                                                          DiasUteis.ExtraiMes(dDataCotacao2)));
                     iIntervalo2 := DiasUteis.IntervaloDias(
                                      DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataCotacao2),
                                                          DiasUteis.ExtraiMes(dDataCotacao2)),
                                      dCotData);
                  end;
//                Executa Cáculo Pró-Rata Linear
                  if sFlgProRata = 'L' then
                     Result := fCotacao2 * (iIntervalo2/iIntervalo1)
                  else
//                Executa Cáculo Pró-Rata Exponencial
                     Result := Power((1 + fCotacao2), (iIntervalo2/iIntervalo1)) - 1;
               end;
            end;
         end;
      end;
   except
      Raise;
      Result := 0;
   end;
end;


// Função que Busca Cotação de uma Moeda numa determinada data.
function TOperComum.BuscaCotacaoMoeda(iMoeda: integer; dDataRef: TDateTime; sOperador: string;
var fCotacao: double; var dDataCotacao: TDateTime): boolean;
var
   sOrdenacao : string;
begin
   if sOperador = '' then sOperador := '<=';

   if sOperador[1] = '<' then begin
      sOrdenacao := 'DESC';
   end else begin
      sOrdenacao := '';
   end;

   try

      with dtmOperComum.qryAuxiliar do begin
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

         Result := not(dtmOperComum.qryAuxiliar).isEmpty;

         fCotacao       := dtmOperComum.qryAuxiliar.FieldByName('COTVALOR').AsFloat;
         dDataCotacao   := dtmOperComum.qryAuxiliar.FieldByName('COTDATA').AsDateTime;
      end;

   finally
      dtmOperComum.qryAuxiliar.Close;
   end;
end;


// Função que Calcula Juros Diários a partir de um Valor e o Tipo de Juros.
function TOperComum.CalculaJurosDia(fValorJuros: double; iTipoJuros: integer): double;
var
   QryLocal  :TwwQuery;
   wParam1, wParam2: double;
begin
    Result := 0;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    FazQuery(QryLocal,
      'SELECT TAMPERJUROS, EFETNOMI '+
      'FROM TIPOJUROS '+
      'WHERE 	(CODTIPTXJUROS = '''+ InttoStr(iTipoJuros)+''')');

    if qryLocal.isEmpty then begin
      MsgDlg('Faltam dados para calcular Juros Diários!', 'Erro', mtError, [mbOk], 0);
    end else begin
      if QryLocal.FieldByName('EFETNOMI').AsString = 'E' then begin
         wParam1 := 1 + (fValorJuros / 100);
         wParam2 := 1 / QryLocal.FieldByName('TAMPERJUROS').AsFloat;
         Result := Power(wParam1, wParam2) - 1
      end else
         Result := fValorJuros / QryLocal.FieldByName('TAMPERJUROS').AsFloat;
    end;
    Result := Result * 100;

    QryLocal.Free;
end;





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
Procedure TOperComum.MarcaFlgHistCartInv(TipoMovCart:String; IdLancamento:Integer);
Var
  QryLocalAux1, QryLocalAux2:TwwQuery;
  wIdCarteira, wIdInvestimento, wIdHistCartInv:Integer;
  wIdLote: String;
  wDataMov:TDate;
begin
// Critica Parametros
  If (TipoMovCart <> 'OPE') And (TipoMovCart <> 'HST') Then begin
    MsgDlg('Tipo de Movimento, "'+TipoMovCart+'" Inválido.','Mensagem do Sistema',
           MtError, [MbOk],0);
    Exit;
  end;

// Cria/Inicia Objetos e Variaveis Locais
  QryLocalAux1:= TwwQuery.Create(Application);
  QryLocalAux1.DatabaseName:='BaseDados';
  QryLocalAux2:= TwwQuery.Create(Application);
  QryLocalAux2.DatabaseName:='BaseDados';


// Busca Registro a Excluir de Acordo com o Tipo de Lancamento

//-- Lancamento de Operacao --\\
  If (TipoMovCart = 'OPE') Or (TipoMovCart = 'HST') Then begin
    If (TipoMovCart = 'OPE') Then begin
      If FazQuery(QryLocalAux1,
        'SELECT IDHISTCARTINV, FLGCALCSALDO, IDCARTEIRAINVEST, IDINVESTIMENTO, IDLOTE, DATAMOVCARTINV '+
        'FROM HISTCARTINV WHERE IDOPERACAOINVEST = '+IntToStr(IdLancamento)+' '+
        'ORDER BY IDHISTCARTINV DESC ') Then begin
// Guarda Variaveis
        wIdCarteira    :=QryLocalAux1.FieldByname('IDCARTEIRAINVEST').AsInteger;
        wIdInvestimento:=QryLocalAux1.FieldByname('IDINVESTIMENTO').AsInteger;
        wIdLote        :=QryLocalAux1.FieldByname('IDLOTE').AsString;
        wIdHistCartInv :=QryLocalAux1.FieldByname('IDHISTCARTINV').AsInteger;
        wDataMov       :=QryLocalAux1.FieldByname('DATAMOVCARTINV').AsDateTime;
      end;
    End Else If (TipoMovCart = 'HST') Then begin
      If FazQuery(QryLocalAux1,
        'SELECT IDHISTCARTINV, FLGCALCSALDO, IDCARTEIRAINVEST, IDINVESTIMENTO, IDLOTE, DATAMOVCARTINV '+
        'FROM HISTCARTINV WHERE IDHISTCARTINV = '+IntToStr(IdLancamento)) Then begin
// Guarda Variaveis
        wIdCarteira    :=QryLocalAux1.FieldByname('IDCARTEIRAINVEST').AsInteger;
        wIdInvestimento:=QryLocalAux1.FieldByname('IDINVESTIMENTO').AsInteger;
        wIdLote        :=QryLocalAux1.FieldByname('IDLOTE').AsString;
        wIdHistCartInv :=QryLocalAux1.FieldByname('IDHISTCARTINV').AsInteger;
        wDataMov       :=QryLocalAux1.FieldByname('DATAMOVCARTINV').AsDateTime;
      end;
    end;
// Busca Proximo Lancamento da Mesma Carteira, Caso Não encontre Sai Fora
    If Not FazQuery(QryLocalAux1,
      'SELECT  IDHISTCARTINV, IDCARTEIRAINVEST, IDINVESTIMENTO, IDLOTE FROM HISTCARTINV  '+
      'WHERE (IDCARTEIRAINVEST  = '+IntToStr(wIdCarteira)   +') AND '+
      '      ((DATAMOVCARTINV   > TO_DATE('''+DateToStr(wDataMov)+''',''DD/MM/YYYY'')) OR  '+
      '        ((DATAMOVCARTINV = TO_DATE('''+DateToStr(wDataMov)+''',''DD/MM/YYYY'')) AND '+
      '         (IDHISTCARTINV  > '+IntToStr(wIdHistCartInv)+')) )    '+
      'ORDER BY DATAMOVCARTINV, IDHISTCARTINV ') Then begin

// Libera Objetos Locais
      QryLocalAux1.Free;
      QryLocalAux2.Free;
      Exit;
    end;

// Se o Investimento é o Mesmo do Anterior Marca com Flg "1" (Cart/Inv),
// caso não seja Marca com Flg "3" (Cart),
    If (QryLocalAux1.FieldByname('IDINVESTIMENTO').AsInteger = wIdInvestimento) and
       ( ((QryLocalAux1.FieldByname('IDLOTE').isNull) and (wIdLote = '')) or
         ((not QryLocalAux1.FieldByname('IDLOTE').isNull) and
                   (wIdLote = QryLocalAux1.FieldByname('IDLOTE').asString)) ) Then begin
// Monta e Executa a Atualizacao
      QryLocalAux2.SQL.Clear;
      QryLocalAux2.SQL.Add(
        'UPDATE HISTCARTINV SET FLGCALCSALDO = ''1'' WHERE IDHISTCARTINV = '+
        QryLocalAux1.FieldByname('IDHISTCARTINV').AsString);
        QryLocalAux2.ExecSQL;
    End Else begin
// Monta e Executa a Atualizacao
      QryLocalAux2.SQL.Clear;
      QryLocalAux2.SQL.Add(
        'UPDATE HISTCARTINV SET FLGCALCSALDO = ''3'' WHERE IDHISTCARTINV = '+
        QryLocalAux1.FieldByname('IDHISTCARTINV').AsString);
        Try
          QryLocalAux2.ExecSQL;
        Except
          Raise;
        end;
// Busca Proximo Lancamento do Mesmo Investimento
      If FazQuery(QryLocalAux1,
        'SELECT  IDHISTCARTINV, IDINVESTIMENTO FROM HISTCARTINV  '+
        'WHERE (IDCARTEIRAINVEST = '+IntToStr(wIdCarteira)    +') AND '+
        '      (IDINVESTIMENTO   = '+IntToStr(wIdInvestimento)+') AND '+
        '      ((('''+wIdLote+''' IS NOT NULL) AND (IDLOTE ='''+wIdLote+''')) OR (('''+wIdLote+''' IS NULL) AND (IDLOTE IS NULL))) AND '+
        '      ( (DATAMOVCARTINV  > TO_DATE('''+DateToStr(wDataMov)+''',''DD/MM/YYYY'')) OR '+
        '        ((DATAMOVCARTINV  = TO_DATE('''+DateToStr(wDataMov)+''',''DD/MM/YYYY'')) AND '+
        '         (IDHISTCARTINV   > '+IntToStr(wIdHistCartInv)+')) )    '+
        'ORDER BY DATAMOVCARTINV, IDHISTCARTINV ') Then begin
// Monta e Executa a Atualizacao
        QryLocalAux2.SQL.Clear;
        QryLocalAux2.SQL.Add(
          'UPDATE HISTCARTINV SET FLGCALCSALDO = ''2'' WHERE IDHISTCARTINV = '+
          QryLocalAux1.FieldByname('IDHISTCARTINV').AsString);
        Try
          QryLocalAux2.ExecSQL;
        Except
          Raise;
        end;
      end;
    end;
  end;
// Libera Objetos Locais
  QryLocalAux1.Free;
  QryLocalAux2.Free;
end;

// Calcula o valor da cota de uma Carteira na data informada
function TOperComum.BuscaVlrCotaCarteira(iCarteira: integer; dDataRef: TDateTime): double;
var
   fSaldoInicialCotas   : double;
   fSaldoInicialValor   : double;
begin
   Result := 0;

   // Verifica a HistCartInv para saber se já foi movimentada
   with dtmOperComum.qrySaldoCarteira do begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('CARTEIRA').AsInteger   := iCarteira;
      ParamByName('DATAMOV').AsDateTime   := dDataRef;
      ParamByName('HISTORICO').AsInteger  := high(integer);
      Open;
      First;
   end;

   // LEITURA DOS SALDOS INICIAIS
   // Verifica se esta será a primeira movimentação da carteira
   if not(dtmOperComum.qrySaldoCarteira.IsEmpty) then begin

      fSaldoInicialCotas   := dtmOperComum.qrySaldoCarteiraSALDOCOTASCARTINV.AsFloat;
      fSaldoInicialValor   := dtmOperComum.qrySaldoCarteiraSALDOVLRCARTINV.AsFloat;

      // Verifica se o Saldo em cotas é ZERO
      if fSaldoInicialCotas <> 0 then begin
         Result := fSaldoInicialValor / fSaldoInicialCotas;
      end else begin

         // Avança até achar saldo OK
         while not(dtmOperComum.qrySaldoCarteira.EOF) do begin
            fSaldoInicialCotas   := dtmOperComum.qrySaldoCarteiraSALDOCOTASCARTINV.AsFloat;
            fSaldoInicialValor   := dtmOperComum.qrySaldoCarteiraSALDOVLRCARTINV.AsFloat;

            if fSaldoInicialCotas <> 0 then begin
               Result := fSaldoInicialValor / fSaldoInicialCotas;
               Break;
            end;

            dtmOperComum.qrySaldoCarteira.Next;
         end;

      end;
   end;
end;           

// Calcula o Saldo de uma Carteira na Data Informada
function TOperComum.BuscaSaldoCarteira(iCarteira: integer; dDataRef: TDateTime): double;
begin
   Result := 0;

   // Verifica o Histórico da Carteira para saber se já foi movimentada
   with dtmOperComum.qrySaldoCarteira do begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('CARTEIRA').AsInteger   := iCarteira;
      ParamByName('DATAMOV').AsDateTime   := dDataRef;
      ParamByName('HISTORICO').AsInteger  := high(integer);
      Open;
      First;

      // Se não for a primeira movimentação da carteira
      if not(IsEmpty) then Result := dtmOperComum.qrySaldoCarteiraSALDOVLRCARTINV.AsFloat;
   end;
end;

// Busca Todos os Saldos de um Investimento/Carteira em um Lote na Data Informada
// AL_2
// AL_5 - 05/10/2004 - Alteração na Ordem dos parâmetros e criação de novo parâmetro
// AL_75 - Provisao de Perda
function TOperComum.BuscaTodosSaldosInvestLote(iCarteira, iCarteiraGerenc, iInvestimento, iHistCartInv,iCustodiante: integer;
         sLote,dDataRef: string; iMotivoBloqueio: Integer;
     var fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu, fSdoCar, fSdoAqui, fSdoRend, fSdoMercado,
         fSdoVar, fSdoJur, fSdoPre, fSdoIRProv, fSdoIRApu, fSdoIOFProv, fSdoIOFApu, fSdoAgio,
         fSdoQtdLibCustodia ,fSdoQtdBloqCustodia, fSdoQtdCPMF, fSdoProvPerda : double): boolean;
var
   fCotacao  : double;
begin
   fSdoQtdeInvCart   := 0;
   fSdoVlrInvCart    := 0;
   fSdoAtu           := 0;
   fSdoCar           := 0;
   fSdoAqui          := 0;
   fSdoRend          := 0;
   fSdoMercado       := 0;
   fSdoVar           := 0;
   fSdoJur           := 0;
   fSdoPre           := 0;
   fSdoIRProv        := 0;
   fSdoIRApu         := 0;
   fSdoIOFProv       := 0;
   fSdoIOFApu        := 0;
   fSdoAgio          := 0;
   fSdoQtdLibCustodia := 0;
   // AL_2
   fSdoQtdBloqCustodia := 0;
   // AL_5 - 05/10/2004
   fSdoQtdCPMF         := 0;
   //AL_71
   //AL_78
   // AL_75
   fSdoProvPerda     := 0;

   // Chama query que calcula o saldo mencionado
   fCotacao  := OperComum.BuscaCotacaoInvest(iInvestimento, StrToDate(dDataRef), True);

   try
      // Busca o Saldo na HISTCARTINV
      // AL_53
      If iCarteiraGerenc > 0 Then //Valor nulo
      begin
         OperComum.LimpaParametros(dtmOperComum.qrySaldoInvestimentoCartGer);
         with dtmOperComum.qrySaldoInvestimentoCartGer do
         begin
            ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteira;
            ParamByName('IDCARTEIRAGERENC').AsInteger  := iCarteiraGerenc;
            ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
            ParamByName('HISTORICO').AsInteger         := iHistCartInv;
            ParamByName('DATAMOV').AsString            := dDataRef;
            Open;

            if not(isEmpty) then
            begin
               fSdoQtdeInvCart   := FieldByName('SALDOQTDEINVCART').AsFloat;
               fSdoVlrInvCart    := FieldByName('SALDOVLRINVCART').AsFloat;
               fSdoAtu           := FieldByName('SALDOATU').AsFloat;
               fSdoAqui          := FieldByName('SALDOAQUI').AsFloat;
               fSdoRend          := FieldByName('SALDOREND').AsFloat;
               fSdoCar           := FieldByName('SALDOCAR').AsFloat;
               fSdoJur           := FieldByName('SALDOJUROS').AsFloat;
               fSdoVar           := FieldByName('SALDOVARIACAO').AsFloat;
               fSdoPre           := FieldByName('SALDOPREMIO').AsFloat;
               fSdoMercado       := FieldByName('SALDOQTDEINVCART').AsFloat * fCotacao;
               fSdoIRProv        := FieldByName('SALDOIRPROV').AsFloat;
               fSdoIRApu         := FieldByName('SALDOIRAPU').AsFloat;
               fSdoIOFProv       := FieldByName('SALDOIOFPROV').AsFloat;
               fSdoIOFApu        := FieldByName('SALDOIOFAPU').AsFloat;
               fSdoAgio          := FieldByName('SALDOAGIO').AsFloat;
               // AL_5 - 05/10/2004
               fSdoQtdCPMF       := FieldByName('SALDOQTDECPMF').AsFloat;
               // AL_75
               fSdoProvPerda     := FieldByName('SALDOPROVPERDA').AsFloat;

               if iIdHistCartInvTRC = -1 then
                  iIdHistCartInvTRC := FieldByName('IDHISTCARTINV').AsInteger + 1;

               Result := True;
            end
            else
               Result := False;
         end;
      end
      else
      begin
         OperComum.LimpaParametros(dtmOperComum.qrySaldoInvestimentoTNull);
         with dtmOperComum.qrySaldoInvestimentoTNull do
         begin
            ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteira;
            ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
            ParamByName('HISTORICO').AsInteger         := iHistCartInv;
            ParamByName('DATAMOV').AsString            := dDataRef;
            ParamByName('IDLOTE').AsString             := sLote;
            Open;

            if not(isEmpty) then
            begin
               fSdoQtdeInvCart   := FieldByName('SALDOQTDEINVCART').AsFloat;
               fSdoVlrInvCart    := FieldByName('SALDOVLRINVCART').AsFloat;
               fSdoAtu           := FieldByName('SALDOATU').AsFloat;
               fSdoAqui          := FieldByName('SALDOAQUI').AsFloat;
               fSdoRend          := FieldByName('SALDOREND').AsFloat;
               fSdoCar           := FieldByName('SALDOCAR').AsFloat;
               fSdoJur           := FieldByName('SALDOJUROS').AsFloat;
               fSdoVar           := FieldByName('SALDOVARIACAO').AsFloat;
               fSdoPre           := FieldByName('SALDOPREMIO').AsFloat;
               fSdoMercado       := FieldByName('SALDOQTDEINVCART').AsFloat * fCotacao;
               fSdoIRProv        := FieldByName('SALDOIRPROV').AsFloat;
               fSdoIRApu         := FieldByName('SALDOIRAPU').AsFloat;
               fSdoIOFProv       := FieldByName('SALDOIOFPROV').AsFloat;
               fSdoIOFApu        := FieldByName('SALDOIOFAPU').AsFloat;
               fSdoAgio          := FieldByName('SALDOAGIO').AsFloat;
               // AL_5 - 05/10/2004
               fSdoQtdCPMF       := FieldByName('SALDOQTDECPMF').AsFloat;
               // AL_75
               fSdoProvPerda     := FieldByName('SALDOPROVPERDA').AsFloat;

               if iIdHistCartInvTRC = -1 then
                  iIdHistCartInvTRC := FieldByName('IDHISTCARTINV').AsInteger + 1;

               Result := True;
            end
            else
               Result := False;
         end;
      end;
      //Al_61 - 11/01/2006
      // Busca o Saldo na HISTCUSTODIA
      if iCustodiante <> -1 then
      begin
         fSdoQtdLibCustodia := 0;
         OperComum.LimpaParametros(dtmOperComum.qrySaldoInvestCustodia);
         with dtmOperComum.qrySaldoInvestCustodia do
         begin
            ParamByName('IDCARTEIRAINVEST').AsInteger  := iCarteira;
            ParamByName('IDMOTIVOBLOQUEIO').AsInteger  := iMotivoBloqueio;
            If iCarteira = 0 Then
               ParamByName('IDCARTEIRAINVEST').Clear;
            ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
               ParamByName('IDCUSTODIANTE').AsInteger     := iCustodiante;
            ParamByName('DATAMOV').AsString            := dDataRef;
            Open;

            if not(isEmpty) then
            begin
               fSdoQtdLibCustodia:= dtmOperComum.qrySaldoInvestCustodia.FieldByName('SALDOLIBERADO').AsFloat;
               // AL_2
               fSdoQtdBloqCustodia := dtmOperComum.qrySaldoInvestCustodia.FieldByName('SALDOBLOQUEADO').AsFloat;
               //AL_71
               //AL_78
               Result := True;
            end
            else
               Result := False;
         end;
      end;
   finally
      dtmOperComum.qrySaldoInvestCustodia.Close;
      dtmOperComum.qrySaldoInvestimentoCartGer.Close;
      dtmOperComum.qrySaldoInvestimentoTNull.Close;
   End;
end;

// Função que Retorna Valor a Contabilizar
function TOperComum.BuscaValorAContabilizar(iIdHistcartinv, iIdTipoDespInvest,iTipoInvest: longint; bOperVenda: boolean;
                                 var fValorAContabilizar: Double): boolean;
var
  QryLocal, QryLocal1    : TwwQuery;
  DataCotacao : TDateTime;
begin
// Cria Objetos Locais
  QryLocal              := TwwQuery.Create(Application);
  QryLocal.DatabaseName := 'BaseDados';
  QryLocal1              := TwwQuery.Create(Application);
  QryLocal1.DatabaseName := 'BaseDados';

  Result := true;
  fValorAContabilizar := 0;

  if FazQuery(QryLocal,
       //AL_77
       'SELECT VLRJUROS, VLRPREMIO, VLRVARIACAO, MOVIMAQUI,  VLRMOVCARTINV, NATURMOVCARTINV, '+
       '       VLRIRAPU, VLRIRPROV, VLRIOFAPU,   VLRIOFPROV, VLRAGIO,       VLRPROVPERDA, '+
       '       QTDEMOVINVCART, IDINVESTIMENTO, IDOPERACAOINVEST '+
       'FROM HISTCARTINV '+
       'WHERE (IDHISTCARTINV = '+QuotedStr(IntToStr(iIdHistCartInv))+') ') then begin

     Case iIdTipoDespInvest Of

        -1: // Custo de Aquisição Registrado
        begin
           fValorAContabilizar := QryLocal.FieldByName('MOVIMAQUI').AsFloat;
           if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then
              fValorAContabilizar := - fValorAContabilizar;

           // AL_30 Ini
           // Al_27 Ini
           //AL_3
           // Soma as despesas no Custo
           if Sistema.NomeEmpresa = 'REFER' then
           begin
              // Busca Total de Despesas desta Operacao
              FazQuery(QryLocal1,
                'SELECT SUM(VLRDESPOPER) AS VLRDESPOPER FROM DESPOPERINVEST WHERE IDOPERACAOINVEST = '+
                 IntToStr(QryLocal.FieldByName('IDOPERACAOINVEST').AsInteger));
              // Calcula Valor da Movimentacao
              fValorAContabilizar := fValorAContabilizar + QryLocal1.FieldByName('VLRDESPOPER').AsFloat;
           end;
           // Al_27 Fim
           // AL_30 Fim
        end;
        -2: // Variação Positiva Registrada
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
           if iTipoInvest = 1 then         // RF
           begin
              if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then // OPE de Venda
              begin
                 if fValorAContabilizar > 0 then
                    fValorAContabilizar := 0                     // é Variação Negativa RF
                 else
                    fValorAContabilizar := - fValorAContabilizar;// é Variação Positiva
              end
              else if (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'G') or
                      (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'P') then  // ATU
              begin
                 if fValorAContabilizar < 0 then
                    fValorAContabilizar := 0;   // Variação Negativa RF
              end;
           end
           else if iTipoInvest = 2 then      // RV
           begin
              if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then // OPE de Venda
              begin
                 if fValorAContabilizar > 0 then
                    fValorAContabilizar := 0                     // é Variação Positiva  
                 else
                    fValorAContabilizar := - fValorAContabilizar;// é Variação Negativa RV
              end
              //AL_82
              else if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'A' then // Tranf. Plano (Aumento)
              begin
                 if fValorAContabilizar < 0 then
                    fValorAContabilizar := 0                     //  é Variação Negativa RV
                 else
                    fValorAContabilizar := - fValorAContabilizar;//  é Variação Positiva
              end
              else if (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'G') or
                      (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'P') then  // ATU
              begin
                 if fValorAContabilizar < 0 then
                    fValorAContabilizar := 0;   // Variação Negativa RV
              end;
           end;
        end;
        -3: // Prêmio Registrado
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRPREMIO').AsFloat;
           if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then
              fValorAContabilizar := - fValorAContabilizar;
        end;
        -4: // Lucro na Venda
        begin
           if not bOperVenda then begin
              MsgDlg('Parametrização Incorreta. Lucro/Prejuizo sem Operação de Venda associada. ',
                     'Mensagem do Sistema ', MtWarning,[MbOk],0);
              Result := false;
           end;
           fValorAContabilizar := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
           if fValorAContabilizar < 0 then
              fValorAContabilizar := 0;   // Prejuízo
        end;
        -5: // Prejuízo na Venda
        begin
           if not bOperVenda then begin
              MsgDlg('Parametrização Incorreta. Lucro/Prejuizo sem Operação de Venda associada. ',
                     'Mensagem do Sistema ', MtWarning,[MbOk],0);
              Result := false;
           end;
           fValorAContabilizar := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
           if fValorAContabilizar > 0 then
              fValorAContabilizar := 0;   // Lucro
        end;
        -6: // Juros Registrados
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRJUROS').AsFloat;
           if (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'C') or
              (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D') then
              fValorAContabilizar := - fValorAContabilizar;
        end;
        -7: // IR Apurado
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRIRAPU').AsFloat;
        end;
        -8: // IR Provisionado
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRIRPROV').AsFloat;
        end;
        -9: // IOF Apurado
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRIOFAPU').AsFloat;
        end;
        -10: // IOF Provisionado
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRIOFPROV').AsFloat;
        end;
        -11: // Ágio
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRAGIO').AsFloat;
           if fValorAContabilizar < 0 then
              fValorAContabilizar := 0;   // Desagio
        end;
        -12: // Provisão de Perda (Juros)
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRJUROS').AsFloat;
           if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then
              fValorAContabilizar := - fValorAContabilizar;
        end;
        -13: // Provisão de Perda (C.Monetária)
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
           if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then
              fValorAContabilizar := - fValorAContabilizar;
        end;
        -14: // Taxa Operacional Basica Normal
        begin
           //
        end;
        -15: // Taxa Operacional  Basica Day-Trade
        begin
           //
        end;
        -16: // Taxa da Bolsa (BM&F)
        begin
           //
        end;
        -17: // Taxa de Registro (BM&F)
        begin
           //
        end;
        -18: // Taxa de Liquidacao (BM&F)
        begin
           //
        end;
        -19: // Variação Negativa Registrada
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
           if iTipoInvest = 1 then           // RF
           begin
              if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then // OPE de Venda
              begin
                 if fValorAContabilizar < 0 then
                    fValorAContabilizar := 0                     // é Variação Positiva RF
                 else
                    fValorAContabilizar := - fValorAContabilizar;// é Variação Negativa RF
              end
              else if (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'G') or
                      (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'P') then  // ATU
              begin
                 if fValorAContabilizar > 0 then
                    fValorAContabilizar := 0;   // é Variação Positiva RF
              end;
           end
           else if iTipoInvest = 2 then      // RF
           begin
              if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'D' then // OPE de Venda
              begin
                 if fValorAContabilizar < 0 then
                    fValorAContabilizar := 0                     // é Variação Positiva RV
                 else
                    fValorAContabilizar := - fValorAContabilizar;// é Variação Negativa RV
              end
              //AL_82
              else if QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'A' then // Tranf. Plano (Aumento)
              begin
                 if fValorAContabilizar > 0 then
                    fValorAContabilizar := 0                     // é Variação Negativa RV
                 else
                    fValorAContabilizar := - fValorAContabilizar;// é Variação Positiva RV
              end
              else if (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'G') or
                      (QryLocal.FieldByName('NATURMOVCARTINV').AsString[1] = 'P') then  // ATU
              begin
                 if fValorAContabilizar > 0 then
                    fValorAContabilizar := 0;   // é Variação Positiva RV
              end;
           end;
        end;
        -20: // Ajuste Normal Positivo BM&F
        begin
            //
        end;
        -21: // Ajuste Normal Negativo BM&F
        begin
            //
        end;
        -22: // IR Litigio Positivo
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRIRAPU').AsFloat;
           if fValorAContabilizar < 0 then
              fValorAContabilizar := 0;   // IR Litigio Negativo
        end;
        -23: // IR Litigio Negativo
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRIRAPU').AsFloat;
           if fValorAContabilizar > 0 then
              fValorAContabilizar := 0;   // IR Litigio Positivo
        end;
        -24: // Desagio
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRAGIO').AsFloat;
           if fValorAContabilizar > 0 then
              fValorAContabilizar := 0;   // Agio
        end;
        //AL_72 Ini
        -32: // Incorporação de Variação Positiva
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
           if fValorAContabilizar > 0 then
              fValorAContabilizar := 0                     // é Variação Negativa RV
        end;
        //AL_72 Fim
        //AL_73 Ini
        -33: // Incorporação de Variação Negativa
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
           if fValorAContabilizar < 0 then
              fValorAContabilizar := 0                     // é Variação Positiva RV
        end;
        //AL_73 Fim
        //AL_77
        -34: // Provisão de perda
        begin
           fValorAContabilizar := QryLocal.FieldByName('VLRPROVPERDA').AsFloat;
        end;
        Else
        begin
           // Melhora no texto da mensagem - 26/07/2006
           MsgDlg('Impossível Contabilizar. Tipo de Despesa Interna não prevista. ' + #13 +
                  'Código do Tipo de Despesa encontrado: ' + IntToStr(iIdTipoDespInvest),
                  'Mensagem do Sistema ', MtWarning,[MbOk],0);
           Result := false;
        end;
     end;
  end else begin
     MsgDlg('Impossível Contabilizar. Valores não encontrados. ',
            'Mensagem do Sistema ', MtWarning,[MbOk],0);
     Result := false;
  end;
  QryLocal.Close;
  QryLocal.Free;
  QryLocal1.Close;
  QryLocal1.Free;
end;

function TOperComum.DivValorZero(Valor1, Valor2: Extended): Extended;
begin
   If Valor2 <> 0 Then
      Result :=Valor1/Valor2
   Else
      Result := 0;
end;

Function TOperComum.Trunca(rValor: Double;iQtdDec: Integer):Double;
Var
   i : Integer;
   sValor, sValor1 : String;
begin
   sValor := FloatToStr(rValor);
   For i := 1 To Length(sValor) Do
   begin
       If Copy(sValor,i,1)= ',' Then
       begin
          sValor1 := sValor1+Copy(sValor,i,1+iQtdDec);
          Break;
       End
       Else
          sValor1 := sValor1+Copy(sValor,i,1);
   end;
   Result := StrToFloat(sValor1);
end;

Function TOperComum.Round(rValor: Double;iQtdDec: Integer): Double;
Var
   i : Integer;
   sValor, sValor1 : String;
begin
   If iQtdDec<0 Then
      iQtdDec:=2;
   sValor := FloatToStrF(rValor, ffNumber, 22,iQtdDec);
   For i := 1 To Length(sValor) Do
   begin
      If (Copy(sValor,i,1)<>'.') Then
      begin
         sValor1 := sValor1+Copy(sValor,i,1);
      end;
   end;
   Result := StrToFloat(sValor1);
end;

function TOperComum.ConvertePonto(sConverter : string):string;
var
 iPosPonto : Integer;
begin

  iPosPonto := Pos('.', sConverter); // Tira o Ponto
  if iPosPonto <> 0 then
    sConverter:= Copy(sConverter,1,iPosPonto-1)+Copy(sConverter,iPosPonto+1,Length(sConverter));

  iPosPonto := Pos(',', sConverter);
  if iPosPonto <> 0 then
    sConverter:= Copy(sConverter,1,iPosPonto-1)+'.'+Copy(sConverter,iPosPonto+1,Length(sConverter));
  Result:= sConverter;
end;

Function TOperComum.StripChar(S : String; C : Char) : String;
Var
  I : Integer;
begin
  Result := '';
  For I := 1 To Length(S) Do
    If S[I] <> C Then
       result := result + S[I];
end;

function TOperComum.VerificaData(sData : String) : Boolean;
var   j,i : Integer;
begin
   j:=0;
   For i := 1 To Length(sData) Do
   begin
      If j < 2 Then
      begin
         If Copy(sData,i+2,1) = '/' Then
            j := j + 1;                                               
      end;
   end;
   If j < 2 Then
      Result := False
   Else
      Result := True;
end;

function TOperComum.BuscaForCli(iTipoInvest,iCorretEmissor,iTipoOperacao,iTipoCliente:integer):integer;
begin
   Result := -1;
   with dtmOperComum.QryBuscaTipoOperacao do
   begin
      Close;
      ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvest;
      ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOperacao;
      Open;
      if FieldByName('RECPAG').AsString <> 'N' then
      begin
         // Busca Credor da Despesa caso Tipo de Credor
         if FieldByName('TIPCREDOR').AsString <> '' then
         begin
            // Atualiza de acordo Emissor/Corretor
            if FieldByName('TIPCREDOR').AsString = 'CO' then
            begin
               try
                  Documento.ForCli.Inserir(iCorretEmissor,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                           '','','','','C',False); // Cliente
                  Documento.ForCli.Inserir(iCorretEmissor,
                                           Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False); // Fornecedor
               except  // Função gerava um Abort quando o Fornecedor
               end;    // já estava cadastrado
               Result := iCorretEmissor;
            end
            else
            begin
               // Transforma Emissor em Fornecedor
               try
                  if FieldByName('RECPAG').AsString = 'R'then
                  begin
                     Documento.ForCli.Inserir(iCorretEmissor,
                                              Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTEEMI,Sistema.IdEmpresa,
                                              '','','','','C',False); // Cliente
                  end
                  else If FieldByName('RECPAG').AsString = 'P' then
                  begin
                     Documento.ForCli.Inserir(iCorretEmissor,
                                              Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFOREMI,Sistema.IdEmpresa,
                                              '','','','','F',False); // Fornecedor
                  end;
               except  // Função gerava um Abort quando o Fornecedor
               end;    // já estava cadastrado
               Result := iCorretEmissor;
            end;
         end  // Caso Tipo Credor não Informado
         else
         begin
            // Busca o Credor no Sub........
            with dtmOperComum.qryAuxiliar do
            begin
               SQL.Clear;
               SQL.Add('SELECT IDFORCLI FROM FORCLIXTIPOPER ');
               SQL.Add('WHERE (IDTIPOINVEST  = '+IntToStr(iTipoInvest)+') AND'   );
               SQL.Add('      (IDTIPOOPERACAO= '+IntToStr(iTipoOperacao)+') AND' );
               SQL.Add('      (EMPRESAPROP   = '+IntToStr(Sistema.IdEmpresa)+')' );
               Open;
               Result := FieldByName('IDFORCLI').AsInteger;
               // Caso não encontre o Fornecedor
               if Result = 0 then
               begin
                 MsgDlg('O Credor deste Tipo de Operação não foi Informado, '+#13+
                        'A operação não será efetuada!','Mensagem do Sistema',MtError,[MbOk],0);
                 Exit;
               end;
            end;
         end;
      end;
   end;
end;

function  TOperComum.VerificaFechamento(edDataRef : TDateTime) : Boolean;
Var dDataAnterior : TDateTime;
begin
   dDataAnterior := edDataRef - 1;
   While not DiasUteisInv.DiaUtil(dDataAnterior,-1,1,'',True,False,False) Do
       dDataAnterior := dDataAnterior - 1;   // Achar o dia útil anterior

   dtmOperComum.QryVerFechamento.Close;
   dtmOperComum.QryVerFechamento.Open;
   Result    := true;
   If dtmOperComum.QryVerFechamento.FieldByName('DATAULTFECH').AsDateTime < dDataAnterior Then
   begin
      MsgDlg('Não foi feito o Fechamento do Dia Anterior.','Mensagem do Sistema',
            mtInformation, [MbOk],0);
      Result := False;
   end;
   dtmOperComum.QryVerFechamento.Close;
end;

//AL_99
// Função que efetua o par de lançamentos Contábeis e o lançamento de CAPCAR (se aplicáveis)
// associados a uma Operação de Investimento de Renda Fixa e Raviável (de acordo com a tabela
// PadrLancContInv), já contabilizando inclusive as despesas da Operação.
function TOperComum.LancaOperPendRV(iIdCorretValores, iOperacaoOrigem, iEmpresaProp,
                                    iModuloOrigem, iTipoInvest, iInvestimento, iTipoOperacao,
                                    iOperacao, iForCli, iCarteira, iMoeda, iiPlanPrev: integer;
                                    sTipoTitulo, sLote, sHistCapCar, sRecPagBol: string;
                                    var sTipoRecDesBol: string;
                                    var bCriaLancto : boolean;
                                    fTotalLiquido, fVlrOper: currency;
                                    dDataOper, dDataVenc: TDateTime;
                                    var iPlano, iPlanilhaOper, iDocumentoOper : integer;
                                    var sMensErro : string): shortint;
var
   bTransacao, bMostraMsg, bAchouOperacao, bLancaCAPCAROper, bVenda : boolean;
   iNumFatura, iPlanoDs, iAchouPadrao, iSubContaDebOp, iSubContaCredOp,
   iUnidNegocOp, iTipoDocOp, iPortador, iNumLancamento : integer;

   sOperacao, sStatus, sComplementoOp, sComplementoDs, sContaDebOp, sContaCredOp,
   sCentroCustoDebOp, sCentroCustoCredOp, sCentroResponOp, sTipoRecDesOp,
   sTipoPerOp, sHistoricoOp, sRecPagNaoOp, sRecPagOp, sModulo, sDataLanc,
   sDataVenc, sContaDoc, sPlano, sDebCre : string;

   fVlrLiquido, fVlrLancto         : double;

   iPlanoPrev, iPatro: Integer;
   fNoDocumento: extended;

   //AL_99
   qryAuxAmbiente, qryAuxLocal, qryLancaDocumento  : TwwQuery;

begin
   Result := 0;

   //AL_96 - Não faz o Contábil nem financeiro quando o Flag de cada nódulo estiver marcado
   if ((iTipoInvestUsu = 2) and (pRPI.FLGINTCONTABRV = 'N')) then
      Exit;

   Screen.Cursor  := crHourGlass;
   bTransacao     := False; // a priori, não é necessário que se inicie uma transação
   bMostraMsg     := True;
   iNumFatura     := 0;
   sOperacao      := '2';
   sStatus        := '';
   sComplementoOp := '79';
   //AL_93
   sModulo        := '79';
   sComplementoDs := '';
   fVlrLiquido    := 0;
   iPlanoDs       := -1;
   if iPlanilhaOper <= 0 then
      iPlanilhaOper  := -1;
   sPlano         := IntToStr(iPlano);

   try
      qryAuxAmbiente              := TwwQuery.Create(Application);
      qryAuxAmbiente.DatabaseName := 'BaseDados';
      try

         //AL_99

         with dtmOperComum.qryParamInvest do
         begin
            Close;
            if not(Prepared) then Prepare;
            Open;
         end;

         with dtmOperComum.qryInvestimento do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('INVESTIMENTO').AsInteger     := iInvestimento;
            Open;
         end;

         with dtmOperComum.qryCarteira do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('CARTEIRA').AsInteger         := iCarteira;
            Open;
         end;

         //AL_99
         qryAuxAmbiente.Close;
         qryAuxAmbiente.Sql.Clear;
         qryAuxAmbiente.Sql.Add('SELECT PLANPRVCONTABPATRO AS NOME, IDPATRO, IDPLANOPREV ');
         qryAuxAmbiente.Sql.Add('FROM VWPLANPREVCTBPATR ');
         qryAuxAmbiente.Sql.Add('WHERE IDPLANPREVCTBPATR = ' + IntToStr(iiPlanPrev));
         qryAuxAmbiente.Open;
         iPlanoPrev    := qryAuxAmbiente.FieldByName('IDPLANOPREV').AsInteger;
         iPatro        := qryAuxAmbiente.FieldByName('IDPATRO').AsInteger;
         qryAuxAmbiente.Close;

         // Verifica o Padrão de Lançamento mais adequado
         //AL_86
         //AL_107
         iAchouPadrao := CtrlInvContab.BuscaPadrLanc.Executa(iTipoInvest, iTipoOperacao, 0, iInvestimento, iCarteira,
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
         sTipoPerOp := CtrlInvContab.BuscaPadrLanc. TipoPer;
         sHistoricoOp := CtrlInvContab.BuscaPadrLanc.Historico;
         sRecPagNaoOp := CtrlInvContab.BuscaPadrLanc.RecPagNao;

         bAchouOperacao := (iAchouPadrao = 0);

         // Verificação dos parâmetros do Tipo de Operação -----------------------------------------------
         with dtmOperComum.qryTipoOperacao do
         begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('TIPOINVEST').AsInteger    := iTipoInvest;
            ParamByName('TIPOOERACAO').AsInteger   := iTipoOperacao;
            Open;
            bLancaCAPCAROper := FieldByName('FLGGERACAPCAR').AsInteger = 1;
            sRecPagOp        := FieldByName('RECPAG').AsString;
            bVenda           := (FieldByName('NATUREZAOPERACAO').AsString = 'D');
         end;

         with dtmOperComum.qryAuxiliar do
         begin
            close;
            sql.clear;
            sql.Add('SELECT CODTIPDOC FROM TIPODOCRECPAG WHERE CODTIPDOC IN (86,89) AND');
            sql.Add(' RECPAG = '''+sTipoRecDesBol+'''');
            Open;
            iTipoDocOp := FieldByName('CODTIPDOC').AsInteger;
            Close;
         end;

         with dtmOperComum.QryBuscaTpOpOperInvest do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('IDOPERACAOINVEST').AsInteger := iOperacao;
            Open;
         end;

         // Início do processamento ----------------------------------------------------------------------

         //AL_99
         if (fVlrOper <> 0) then
         begin
            // verifica se já existe transação em andamento; se não houver, inicia uma
            if not(dtmBaseDados.dbBaseDados.InTransaction) then
            begin
               bTransacao := True;
               StartTransacao;
            end;

            //AL_9
            // Chamada às funções de integração Contábil e Financeira ---------------------------------------
            if (bAchouOperacao) then
            begin
               // Se a Operação Integra CAPCAR, Cria Documento
               if (bLancaCAPCAROper)  and (iDocumentoOper = -1) then
               begin
                  //AL_99
                  //AL_86
                  qryLancaDocumento := dtmOperComum.qryLancaDocumento;
                  qryAuxLocal       := dtmOperComum.qryAuxiliar;

                  // Gera o identificador incremental da tabela DOCUMENTO
                  if CtrlInvContab.Documento.GetDocSequence then
                     iDocumentoOper := CtrlInvContab.Documento.CodDocumento;
                  // Prepara um novo documento
                  CtrlInvContab.Documento.Prepare;
                  iPortador      := -1;
                  CtrlInvContab.Documento.GetNoDocumento;
                  //AL_93
                  fNoDocumento := CtrlInvContab.Documento.NoDocumento;
                  sContaDoc := OperComum.IIF(sRecPagBol[1] = 'P', sContaCredOp, sContaDebOp);

                  dtmOperComum.qryAuxiliar.Close;
                  dtmOperComum.qryAuxiliar.sql.clear;
                  dtmOperComum.qryAuxiliar.sql.Add('SELECT CONTACOPERFIN, PLANO ');
                  dtmOperComum.qryAuxiliar.sql.Add('FROM PADRLANCCONTINV ');
                  dtmOperComum.qryAuxiliar.sql.Add('WHERE IDTIPOOPERACAO = '''+IntToStr(iTipoOperacao)+'''');
                  dtmOperComum.qryAuxiliar.Open;
                  sContaDoc := dtmOperComum.qryAuxiliar.FieldByName('CONTACOPERFIN').AsString;
                  if sPlano = '' then
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
                                    -1{iUnidNegocOp}, Sistema.idEmpresa, iForCli, iTipoDocOp, iPortador, sRecPagBol[1], fNoDocumento,
                                    //AL_93
//                                    sComplementoOp, sDataLanc, sDataVenc, sDataVenc{DataProgramada=DataVencimento}, sStatus,
                                    sComplementoOp, DateToStr(dDataOper), DateToStr(dDataVenc), DateToStr(dDataVenc){DataProgramada=DataVencimento}, sStatus,
                                    iNumFatura, sOperacao, Sistema.idUsuario, iSubContaCredOp, -1, '', '', False,
                                    -1, -1, -1);

                  //AL_8 -
                  With dtmOperComum.QryBuscaTpOpOperInvest Do
                  begin
                     If FieldByName('FLGCONTAINVEST').AsInteger > 0 Then
                     begin
                        //AL_86
                        If iDocumentoOper > 0 Then
//                           CtrlInvContab.Documento.ContaInvest := iFlgContaInvest;
                           ExecutaQuery(qryAuxAmbiente,
                           ' UPDATE DOCUMENTO SET FLGCONTAINVEST = '+FieldByName('FLGCONTAINVEST').AsString+
                           ' WHERE  CODDOCUMENTO = '+IntToStr(iDocumentoOper));
                     end;
                  end;

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
                  Documento.Rateio.Inserir(
                            iDocumentoOper, sTipoRecDesOp, sRecPagBol[1], sCentroResponOp,
                            Sistema.idEmpresa, fVlrOper, 0, Sistema.idUsuario, iUnidNegocOp, -1,
                            //AL_101
                            sCentroCustoCredOp,//sCentroResponOp,
                            iPatro,
                            dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger,
                            iPlanoPrev);
               end;

               fVlrLiquido := fVlrLiquido + fVlrOper;

               if ((iDocumentoOper <> -1) and ((fVlrLiquido <> 0) or (fTotalLiquido <> 0))) then begin

                  if sRecPagBol[1] = 'P' then
                     sDebCre := 'C'
                  else
                     sDebCre := 'D';

                  if bCriaLancto then 
                  begin
                     if fTotalLiquido <> 0 then
                        fVlrLancto := fTotalLiquido
                     else
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
                     Documento.CriarLanctoDoc(qryLancaDocumento, iDocumentoOper, iNumLancamento, -1{CodAlterador},
//AL_93
//                                              iPlanilhaOper, sDataLanc, fVlrLancto, 0, -1{Estorno}, sDebCre,
                                              iPlanilhaOper, DateToStr(dDataOper), fVlrLancto, 0, -1{Estorno}, sDebCre,
                                              sOperacao, sHistCapCar, Sistema.idUsuario, False{bContabiliza}, -1, '');
                     bCriaLancto := false;
                  end;
               end;

               if ((iTipoOperacao = -7) or (iTipoOperacao = -8)) and
                  (Result = 0) and (iPlanilhaOper <> -1)then // Atualização IR Litigio
                  if iPlano = -1 then
                     iPlano := iPlanoDs;

               // Tudo havendo corrido bem...
               if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then
                  CommitTransacao;
            end
            Else
            begin
               if bTransacao then RollBackTransacao;
               Result    := -1;
               sMensErro :=  'Não foi encontrado o Roteiro Contábil para essa Operação.';
               Exit;
            end;

         end;

         if (Result = 0) and (bLancaCAPCAROper) and (fVlrLiquido = 0) then
            Result := -7;// Não foi possível efetuar o lançamento de CAP/CAR.

      except
         if bTransacao then RollBackTransacao;
         Screen.Cursor := crDefault;

         Result := -3; // Erro de gravação
         if bMostraMsg then Raise;
      end;

   finally
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
   end;
end;

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
function TOperComum.EstornaFinanPendencia(iDocumento: Integer;
                                          dDataEstorno: TDateTime): Boolean;
var
   sDataEstorno, sMensErro, sMascara   : string;
   // AL_36
begin
   Result      := True;
   Try
      sDataEstorno   := FormatDateTime('dd/mm/yyyy', dDataEstorno);
      // AL_36
      // Verifica se o estorno pode ser realizado
      //AL_79
      if not CtrlInvContab.TestaPeriodo(sDataEstorno, iTipoInvestUsu) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtInformation, [mbOk], 0);
         Result := False;
         Exit;
      end;

      // Exclui Documento da Tesouraria
      if iDocumento <> -1 then
      begin
         if not(dtmBaseDados.dbBaseDados.InTransaction) then
            DtmBaseDados.dbBaseDados.StartTransaction;

         // Boleta - Limpa Documento
         with DMRendaVariavel do
         begin
            LimpaParametros(qryAux);
            // AL_1 - Exclui a constraint da pendencia em todos os lugares
            ExecutarQuery(qryAux, 'UPDATE OPERACAOINVEST SET CODDOCUMENTO = NULL WHERE CODDOCUMENTO = ' + IntToStr(iDocumento));
            ExecutarQuery(qryAux, 'UPDATE BOLETA SET CODDOCUMENTO = NULL WHERE CODDOCUMENTO = ' + IntToStr(iDocumento));
         end;

         //AL_86
         if not CtrlInvContab.Documento.Delete(iDocumento) then
            Raise Exception.Create('Não foi possível excluir o Documento Financeiro' + #13 +
                                   'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);

      end;
   except on E: Exception do
      begin
         Screen.Cursor := crDefault;
         Result := False;
         //AL_86
         MsgDlg('Ocorreu um problema de exclusão no financeiro/contábil'+
                E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
end;

//--------------------------------------------------------------------------------------------------
//    Executa um Clear para cada parâmero da query passada
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :  wQuery - Objeto tipo TwwQuery
//
//--------------------------------------------------------------------------------------------------
// Fecha, prepara uma TwwQuery e atribui todos os parâmetros como NULL, inicialmente
function TOperComum.LimpaParametros(const qry: TwwQuery; Prepara: Boolean = False): Boolean;
var
   i: integer;
begin
   try
      // fecha a query p/ evitar problemas
      qry.Close;

      // prepara a query se já não estiver preparada
      if Prepara then
      begin
         if not(qry.Prepared) then qry.Prepare;
      end;

      // zera os parâmetros
      for i := 0 to (qry.ParamCount - 1) do begin
         qry.Params[i].Bound := False;
         qry.Params[i].Clear;
         qry.Params[i].Bound := True;
      end;
      Result := True;
   except
      Result := False;
   end;
end;

function TOperComum.LimpaParametros(const qry: TDecisionQuery; Prepara: Boolean = False): Boolean;
var
   i: integer;
begin
   try
      // fecha a query p/ evitar problemas 
      qry.Close;

      // prepara a query se já não estiver preparada
      if Prepara then
      begin
         if not(qry.Prepared) then qry.Prepare;
      end;

      // zera os parâmetros
      for i := 0 to (qry.ParamCount - 1) do begin
         qry.Params[i].Bound := False;
         qry.Params[i].Clear;
         qry.Params[i].Bound := True;
      end;
         Result := True;
   except
      Result := False;
   end;
end;

function TOperComum.LimpaParametros(const qry: TQuery; Prepara: Boolean = False): Boolean;
var
   i: integer;
begin
   try
      // fecha a query p/ evitar problemas
      qry.Close;

      // prepara a query se já não estiver preparada
      if Prepara then
      begin
         if not(qry.Prepared) then
            qry.Prepare;
      end;

      // zera os parâmetros
      for i := 0 to (qry.ParamCount - 1) do begin
         qry.Params[i].Bound := False;
         qry.Params[i].Clear;
         qry.Params[i].Bound := True;
      end;
      Result := True;
   except
      Result := False;
   end;
end;

Function TOperComum.DataPrazo(dData : TDateTime; iPrazo : Integer):TDateTime;
Var
   iPz     : Integer;
   dDtaPz  : TDateTime;
Begin
   If iPrazo > 0 Then
   Begin
      iPz     := 1;
      dDtaPz    := dData;
      While iPz <= iPrazo Do
      Begin
         dDtaPz := dDtaPz + 1;
         While not DiasUteisInv.DiaUtil(dDtaPz,-1,1,'',True,False,False) Do
           dDtaPz := dDtaPz + 1;   // Achar o dia útil anterior

         iPz := iPz + 1;
      End;
   End
   Else
   Begin
      dDtaPz  := dData;
      While not DiasUteisInv.DiaUtil(dDtaPz,-1,1,'',True,False,False) Do
         dDtaPz := dDtaPz + 1;   // Achar o dia útil anterior
   End;

   Result := dDtaPz;
End;

procedure TOperComum.VerificaVencimentoBMF(dDataNow:TDateTime);
var
   dDataLimite : TDateTime;
begin
   dDataLimite := dDataNow + pRPI.PRZVENCBMF;

   with dtmOperComum.qryAuxiliar do
   begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT '+
                  '   SE.DATAVENCIMENTO, IV.DESCINVESTIMENTO, CT.DESCTIPOCTINVEST '+
                  'FROM '+
                  '   SERIESBMF SE, INVESTIMENTO IV, TIPOCONTRINVEST CT '+
                  'WHERE '+
                  '   (SE.DATAVENCIMENTO BETWEEN '+
                  '       TO_DATE(' + QuotedStr(DateToStr(dDataNow)) + ',''DD/MM/YYYY'') AND '+
                  '       TO_DATE(' + QuotedStr(DateToStr(dDataLimite)) + ',''DD/MM/YYYY'')) AND '+
                  '   (SE.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND '+
                  '   (SE.IDTIPOCONTRINVEST = CT.IDTIPOCONTRINVEST)';
      Open;
      if not IsEmpty then
      begin
         while not EOF do
         begin
            if FieldByName('DATAVENCIMENTO').AsDateTime = dDataNow then
               MsgDlg('O série : '+
                       FieldByName('DESCINVESTIMENTO').AsString +' - '+
                       FieldByName('DESCTIPOCTINVEST').AsString +'. Está vencendo hoje : '+
                       DateToStr(FieldByName('DATAVENCIMENTO').AsDateTime)+'', 'Mensagem do Sistema', mtWarning, [mbOk], 0)
            else
               MsgDlg('A série : '+
                       FieldByName('DESCINVESTIMENTO').AsString +' - '+
                       FieldByName('DESCTIPOCTINVEST').AsString +'. Estará vencendo em : '+
                       DateToStr(FieldByName('DATAVENCIMENTO').AsDateTime)+'', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            Next;
         end;
      end;
      Close;
   end;
end;

procedure TOperComum.VerificaVencimentoCartaFianca(dDataNow:TDateTime);
var
   dDataLimite : TDateTime;
begin
   dDataLimite := dDataNow + pRPI.PRZVENCCFIANCA;

   with dtmOperComum.qryAuxiliar do
   begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT '+
                  '   CA.DATAVENCTO, CA.DESCCARTAFIANCA '+
                  'FROM '+
                  '   CARTAFIANCA CA '+
                  'WHERE '+
                  '   (CA.DATAVENCTO BETWEEN '+
                  '       TO_DATE(' + QuotedStr(DateToStr(dDataNow)) + ',''DD/MM/YYYY'') AND '+
                  '       TO_DATE(' + QuotedStr(DateToStr(dDataLimite)) + ',''DD/MM/YYYY'')) ';
      Open;
      if not IsEmpty then
      begin
         while not EOF do
         begin
            if FieldByName('DATAVENCTO').AsDateTime = dDataNow then
               MsgDlg('A Carta de Fiança : '+
                       FieldByName('DESCCARTAFIANCA').AsString +'. Está vencendo hoje : '+
                       DateToStr(FieldByName('DATAVENCTO').AsDateTime)+'', 'Mensagem do Sistema', mtWarning, [mbOk], 0)
            else
               MsgDlg('A série : '+
                       FieldByName('DESCCARTAFIANCA').AsString +'. Estará vencendo em : '+
                       DateToStr(FieldByName('DATAVENCTO').AsDateTime)+'', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            Next;
         end;
      end;
      Close;
   end;
end;

function TOperComum.AlteraDataFechRV(dData: TDateTime): Boolean;
begin
   result := True;
   try
      with dtmOperComum.qryUpdDataUltFechRV do
      begin
         Close;
         ParamByName('DATAULTFECH').AsDateTime       := dData;
         If pRPI.DATAULTFECHEMP > dData Then
            ParamByName('DATAULTFECHEMP').AsDateTime := dData
         ELse
            ParamByName('DATAULTFECHEMP').AsDateTime := pRPI.DATAULTFECHEMP;
         ExecSql;
         Close;
         //AL_93 - Aqui ele já faz a operação RetParamInvest1
         CtrlPInv.GetParamsInvest(Sistema.IdEmpresa);
//         OperacaoInvest.RetParamInvest1(pRPI, 'BaseDados');
      end;
   except
      Result := False;
   end;
end;

procedure TOperComum.ChamaRegra(sRegraSel : string; tpcons:integer);
begin
   Application.CreateForm(TfrmConsultaRegra, frmConsultaRegra);
   with frmConsultaRegra do
   begin
      wwqueryRegra.Close;
      wwqueryRegra.Open;
      if tpcons = 0 then
         wwqueryRegra.locate('IDREGRA', sRegraSel ,[])
      else
         wwqueryRegra.locate('NOMEREGRA', sRegraSel ,[]);
   end;
   frmConsultaRegra.ShowModal;
   frmConsultaRegra.Release;
end;

procedure TOperComum.BuscaFlgContab(iTipoOper:Integer);
begin
   OperComum.LimpaParametros(dtmOperComum.qryFlgContabil);
   with dtmOperComum.qryFlgContabil do
   begin
      ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOper;
      Open;
   end;
end;

function TOperComum.PosicionaWWLookUpQry(dbLookUp: TwwDBLookupCombo; Query: TwwQuery): Boolean;
begin
   Query.Locate(dbLookUp.LookupField, dbLookUp.LookupValue, []);
end;
//Al_39
function TOperComum.TransfEntreCarteiras(iForCli, iCarteiraOrig,
                                         iCarteiraDest,
                                         iInvestimento,
                                         iCustodianteOrig,
                                         iCustodianteDest,
                                         iIdMotBloqOrig,
                                         iIdMotBloqDest,
                                         iMercadoOrig,iMercadoDest,
                                         iIdForCli :Integer;
                                         fSaldo, fQuantidade : Double;
                                         dDataRef : TDateTime;
                                         bEmpAcoes : boolean;
                                         sLote, sBoleta : String;
                                         var iIdHistCartInvDest:Integer;
                                         iPlanPrev: Integer = -1;
                                         iPlnCodigo: Integer = -1;
                                         iTipoConta: Integer = 0): boolean;
Var
   idOperCustodia,iIdHistCustodiaOrig,iIdHistCustodiaDest, iIdHistCartInvOrig : Integer;
   fPU, fSaldoAquiPro, fSaldoVariacaoPro, fSaldoIrApuPro,
   //AL_83
   fSaldoQtd, fSaldoQtdCCi, fSaldoQtdCC, fSaldoVlr, fSaldoInutil, fSaldoAqui, fSaldoRend,
   fSaldoVariacao, fSaldoIrApu, fValorOper, fSaldoQtdCust, fSldQtdCustL, fSldQtdCustB: Double;
   bCriaLancto : Boolean;
   sTipoOperacao, sInvestimento, wMensErro: String;
   iPlanoDest, iPlano, iPlanilha, iDocumento, iTipoOperacao : Integer;
   // AL_83
   CtrlRV: TCtrlRendaVariavel;
begin
   Result := True;
   if iPlanPrev = -1 then
      iPlanPrev := iPlanPrevCtbPatro;
   // Validação dos Dados
   if iCarteiraOrig = iCarteiraDest then
   begin
      // AL_39
      MsgDlg('A Transferência não pode ser para a mesma Carteira de Investimento.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;

   if fQuantidade <= 0 Then
   begin
      // AL_39
      MsgDlg('Quantidade inválida', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;
   // Verifica se possui saldo para transferir.
   if fSaldo < fQuantidade then
   begin
      // AL_39
      MsgDlg('A Quantidade é superior ao saldo para transferência', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;

   // Se for Carteira Origem for de Empréstimo de Acoes -> Verifica se pode transferir
   if bEmpAcoes then
   begin
      if iCustodianteOrig = -1 then
      begin
         // AL_39
         MsgDlg('Não foi informado o Custodiante', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Result := False;
         Exit;
      end
      else
      begin
         //AL_106 - Plano/Patro
         if not EmprestAcoes.VerificaTransfEmptmoAcoes(iPlanPrev, iCarteiraOrig,
                iCustodianteOrig, iInvestimento, fQuantidade, DateToStr(dDataRef)) then
         begin
            Result := False;
            Exit;
         end;
      end;
   end;

   // Inicia o Processo
   //AL_83
   try // Finally
      //AL_83
      CtrlRV :=  TCtrlRendaVariavel.Create;
      CtrlRV.InitializeAs(Padroes);
      Try // Except
         iIdHistCartInvTRC := -1; // Inicializa a variavel global

         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Buscando Saldos a Transferir', -1);

         //AL_83
         CtrlRV.BuscaSaldoRV.Executa(dDataRef, iPlanPrev, iInvestimento, iCarteiraOrig, -1, High(Integer),
                                     iCustodianteOrig, sLote,iIdMotBloqOrig);

         fSaldoQtd := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;
         fSaldoVlr := CtrlRV.BuscaSaldoRV.SaldoVlrTotal;
         fSaldoAqui := CtrlRV.BuscaSaldoRV.SaldoCusto;
         fSaldoRend := 0;
         fSaldoVariacao := CtrlRV.BuscaSaldoRV.SaldoVariacao;
         fSaldoIrApu := CtrlRV.BuscaSaldoRV.SaldoIRApurado;
         fSldQtdCustL := CtrlRV.BuscaSaldoRV.SldQtdLibCustodia;
         fSldQtdCustB := CtrlRV.BuscaSaldoRV.SldQtdBloqCustodia;
         fSaldoQtdCCi := CtrlRV.BuscaSaldoRV.SaldoQtdCCI;
         fSaldoQtdCC  := CtrlRV.BuscaSaldoRV.SaldoQtdCC;

         if iIdMotBloqOrig = -1 then
            fSaldoQtdCust := fSldQtdCustL
         else
            fSaldoQtdCust := fSldQtdCustB;

         //AL_65 - Ini
         // Verifica qtd na custódia (Saldo Liberado)
         if fQuantidade > fSaldoQtdCust then
            Raise Exception.Create('Não é possível transferir esta quantidade, Saldo Insuficiente na Custódia' + #13 +
                                   'Quantidade a Transferir: ' + FormatFloat('###,###,###,##0', fQuantidade) + #13 +
                                   'Quantidade na Custódia : ' + FormatFloat('###,###,###,##0', fSaldoQtdCust));

         if iTipoConta = 1 then
         begin
            //AL_83 - Se for Conta CCI, só vale a qtd nova
            if fQuantidade > fSaldoQtdCCi then
               Raise Exception.Create('Não é possível transferir esta quantidade, Saldo Novo Insuficiente.' + #13 +
                                      'Quantidade a transferir: ' + FormatFloat('###,###,###,##0', fQuantidade) + #13 +
                                      'Saldo na Conta CCI     : ' + FormatFloat('###,###,###,##0', fSaldoQtdCCi));
         end
         else if iTipoConta = 0 then
         begin
            //AL_83 - Se for Conta Normal só vale qtd antiga
            if fQuantidade > fSaldoQtdCC then
               Raise Exception.Create('Não é possível transferir esta quantidade, Saldo Antigo Insuficiente.' + #13 +
                                      'Quantidade a transferir: ' + FormatFloat('###,###,###,##0', fQuantidade) + #13 +
                                      'Saldo na Conta CC      : ' + FormatFloat('###,###,###,##0', fSaldoQtdCC));
         end
         else Raise Exception.Create('Não existe o Tipo de Conta informado');
         //AL_39 - Fim

         fPU               := OperComum.Round(OperComum.DivValorZero(fSaldoAqui,fSaldoQtd),9);
         fSaldoAquiPro     := OperComum.Round(fPU * fQuantidade,2);

         fPU               := OperComum.Round(OperComum.DivValorZero(fSaldoVariacao,fSaldoQtd),9);
         fSaldoVariacaoPro := OperComum.Round(fPU * fQuantidade,2);

         fPU               := OperComum.Round(OperComum.DivValorZero(fSaldoIrApu,fSaldoQtd),9);
         fSaldoIrApuPro    := OperComum.Round(fPU * fQuantidade,2);

         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Criando Boleta de Transferência', -1);

         // Pesquisa se Boleta ja tem Registro na Tabela de Boletas
         OperComum.LimpaParametros(dtmOperComum.QryBoleta);
         dtmOperComum.QryBoleta.ParamByName('IDBOLETA').AsString := sBoleta;
         dtmOperComum.QryBoleta.Open;

         // Caso não tenha, cria um registro
         If dtmOperComum.QryBoleta.IsEmpty Then
         begin
            sBoleta :=  'RV-'+Copy(DateToStr(dDataRef),9,2)+'/'+FormatFloat('0000',
                         LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(DateToStr(dDataRef),9,2)));

            ExecutaQuery(dtmOperComum.QryAuxiliar,'INSERT INTO BOLETA (IDBOLETA, DATABOLETA, STATUS, IDFORCLI,TIPMOVBOLETA) VALUES ('+
                                   QuotedStr(sBoleta)+', TO_DATE('+
                                   QuotedStr(DateToStr(dDataRef))+',''DD/MM/YYYY''), '+
                                   ' ''F'''+','+
                                   QuotedStr(IntToStr(iIdForCli))+',''TRC'')');
         end;

         // Grava OperCustodia
         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Gravando Operação de Custódia', -1);

         idOperCustodia := LeUltRegistro(Nil,'OPERCUSTODIA');

         if not OperacaoInvest.AlimentaOperCustodia(idOperCustodia,-1,-1,-1,-1,
                                                    iCarteiraOrig,
                                                    iCarteiraDest,
                                                    iInvestimento,
                                                    iCustodianteOrig,
                                                    iCustodianteDest,
                                                    iIdMotBloqOrig,
                                                    iIdMotBloqDest,
                                                    fQuantidade,
                                                    dDataRef,
                                                    ''{sLote},
                                                    sBoleta,
                                                    iPlanPrev,
                                                    -1,
                                                    iPlanPrev) then
            //Al_40 - 21/06/2005
            Raise Exception.Create('Não é possível alimentar a custódia com essa operação!');

         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Gravando Histórico de Custódia - Origem', -3);

         OperComum.AlteraHistCustodiaOrigem(idOperCustodia,iIdMotBloqOrig,iCarteiraOrig,
                                            iInvestimento,iCustodianteOrig,''{sLote},dDataRef,
                                            fQuantidade,iIdHistCustodiaOrig,iPlanPrev);

         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Atualizando Históricos de Custódia', -3);

         OperacaoInvest.AtualizaSaldosCustodia;

         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Gravando Histórico de Custódia - Destino', -3);

         //AL_71
         InsereHistCustodiaDestino(idOperCustodia, iIdMotBloqDest, iCarteiraDest, iInvestimento,
                                   iCustodianteDest, ''{sLote}, dDataRef, fQuantidade,
                                   iIdHistCustodiaDest, iPlanPrev,
                                   iTipoConta);

         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Atualizando Históricos de Custódia', -3);

         OperacaoInvest.AtualizaSaldosCustodia;


         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Gravando Histórico de Carteira - Destino', -1);

         fValorOper :=  OperComum.Round(OperComum.DivValorZero((fQuantidade * fSaldoVlr), fSaldoQtd),2);

         //AL_23 - Pega a operação de Destino correta
         //AL_39 - Trata a Conta CCI
         if ((iCarteiraOrig = pRPI.IDCARTOPCIND) or
             (iCarteiraDest = pRPI.IDCARTOPCIND)) then           // Opção de Indice
            iTipoOperacao  := IIF(iTipoConta = 0, -67, -10067)
         else if ((iCarteiraOrig = pRPI.IDCARTEMPACOES) or
                  (iCarteiraDest = pRPI.IDCARTEMPACOES)) then    // Empréstimo
            iTipoOperacao  := IIF(iTipoConta = 0, -63, -10063)
         else
            iTipoOperacao  := IIF(iTipoConta = 0, -4, -10004);   // A Vista
         //AL_39 - Fim
         //AL_23 - Fim

         // Capta a descrição do Tipo de Operação no cadastro
         dtmOperComum.QryLocal.Close;
         dtmOperComum.QryLocal.Sql.Clear;
         dtmOperComum.QryLocal.Sql.Add('SELECT DESCTIPOOPERACAO FROM TIPOOPERACAO ');
         dtmOperComum.QryLocal.Sql.Add('WHERE (IDTIPOOPERACAO = '+ IntToStr(iTipoOperacao)+')');
         dtmOperComum.QryLocal.Open;
         sTipoOperacao   := dtmOperComum.QryLocal.FieldByName('DESCTIPOOPERACAO').AsString;
         //Al_40 - 21/06/2005
         if dtmOperComum.QryLocal.eof then
         begin
            dtmOperComum.QryLocal.Close;
            Raise Exception.Create('Não foi encontrado o Tipo de Operação = '+IntToStr(iTipoOperacao)+'!'+#13+
                                   'Verifique o cadastro de Tipos de Operação.');
         end;

         // Capta a descrição do investimento no cadastro
         dtmOperComum.QryLocal.Close;
         dtmOperComum.QryLocal.Sql.Clear;
         dtmOperComum.QryLocal.Sql.Add('SELECT DESCINVESTIMENTO FROM INVESTIMENTO ');
         dtmOperComum.QryLocal.Sql.Add('WHERE (IDINVESTIMENTO = '+ IntToStr(iInvestimento)+')');
         dtmOperComum.QryLocal.Open;
         sInvestimento := dtmOperComum.QryLocal.FieldByName('DESCINVESTIMENTO').AsString;
         dtmOperComum.QryLocal.Close;
         dtmOperComum.QryLocal.Sql.Clear;

         // Atualiza o Tipo de operação destino utilizada
         ExecutarQuery(dtmOperComum.QryLocal,'UPDATE OPERCUSTODIA SET IDTIPOOPERDEST = ' + IntToStr(iTipoOperacao) + ' ' +
                                             'WHERE IDOPERCUSTODIA = ' + IntToStr(idOperCustodia));

         // Variáveis para Contabilização
         bCriaLancto := False;

         iDocumento:= -1;
         iPlano    := -1;
         if iPlnCodigo = -1 then
            iPlanilha := -1
         else
            iPlanilha := iPlnCodigo;

         //Credito na Carteira
         If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79, iInvestimento,
                                           2,-1,-1,iTipoOperacao, iCarteiraDest,
                                           0,-1,-1,-1{iPlanilha},-1{iDocumento},-1{iPlano}, dDataRef,
                                           fValorOper, fQuantidade,1,0,0,0,0,0,0,0,0,0,
                                           'A','A',''{slote}, sTipoOperacao +' : '+ sInvestimento,
                                           'TRC', '', '', True,-1, iPlanPrev, iIdHistCartInv) Then
            //Al_40 - 21/06/2005
            Raise Exception.Create('Não foi possível alimentar a carteira com essa operação!');

         iIdHistCartInvDest := iIdHistCartInv;
         // AL_59
         iIdHistCartInvTRC := iIdHistCartInv;

         ExecutaQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(fSaldoAquiPro))+','+
                              ' VLRVARIACAO = '+TrocaVirgulaPonto(FloatToStr(fSaldoVariacaoPro))+','+
                              ' VLRIRAPU = '+TrocaVirgulaPonto(FloatToStr(fSaldoIrApuPro))+' '+
                              ' WHERE IDHISTCARTINV = '+IntToStr(iIdHistCartInv));

         //Al_40 - 21/06/2005
         If Not OperComum.AtualizaSaldos(1,-1) Then
            Raise Exception.Create('Não foi possível atualizar o saldo ' + #13 +
                                   'Data ' + DateToStr(dDataRef) + #13 +
                                   'Operação' + sTipoOperacao + #13 +
                                   'Investimento ' + sInvestimento);

         // Atualiza o IDHistCartInvDest na OperCustodia
         if not OperacaoInvest.AtualizaOperCustodia(idOperCustodia,-1,-1, -1,iIdHistCartInvDest) then
            Raise Exception.Create('Não foi possível atualizar a operação de custódia' + #13 +
                                   'Data ' + DateToStr(dDataRef) + #13 +
                                   'Operação' + sTipoOperacao + #13 +
                                   'Investimento ' + sInvestimento);

         OperComum.BuscaFlgContab(iTipoOperacao);

         if iMercadoOrig <> iMercadoDest then
         begin

            //AL_83 - Atualizando o progresso do método no form original
            if Assigned(AtualizaProcesso) then
               AtualizaProcesso('Contabilizando a Operação', -1);

            // Custo e variação - Faz pelas despesas cadastradas
            wTipoRecDesBol := '';
            //AL_83 - Contabiliza por Plano/Patro
            OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                    iInvestimento,iTipoOperacao, idOperCustodia {Passar a OperCustodia e tratar dentro},
                                    iForCli,iCarteiraDest,pRPI.MOECODIGO, '','','','','',
                                    wTipoRecDesBol,
                                    bCriaLancto,
                                    0, fValorOper,
                                    dDataRef,dDataRef,
                                    iPlano, iPlanilha, iDocumento, wMensErro,'N',False,False, 0, True, iPlanPrev);
            if Trim(wMensErro) <> '' then
            begin
               MsgDlg('Atenção: Ocorreu um problema na contabilização da operação :'#13+
                      wMensErro,'Mensagem do Sistema', MtWarning, [MbOk], 0);
               Result := False;
               Exit;
            end;

            //AL_98
            CtrlRV.UpdateBoleta(sBoleta,
                                ['STATUS', 'PLANO', 'PLNCODIGO'],
                                ['F', IntToStr(iPlano), IntToStr(iPlanilha)]);
         end
         else
         begin
            //AL_83 - Atualizando o progresso do método no form original
            if Assigned(AtualizaProcesso) then
               AtualizaProcesso('', -1);
         end;

         // Guarda o Plano para gravar na Alimenta Carteira da Baixa
         iPlanoDest := iPlano;

         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Gravando Histórico de Carteira - Origem', -1);

         //AL_23 - Pega a operação de Destino correta
         //AL_39 - Trata a conta CCI
         if ((iCarteiraOrig = pRPI.IDCARTOPCIND) or
             (iCarteiraDest = pRPI.IDCARTOPCIND)) then           // Opção de Indice
            iTipoOperacao := IIF(iTipoConta = 0, -68, -10068)
         else if ((iCarteiraOrig = pRPI.IDCARTEMPACOES) or
                  (iCarteiraDest = pRPI.IDCARTEMPACOES)) then    // Empréstimo
            iTipoOperacao := IIF(iTipoConta = 0, -64, -10064)
         else
            iTipoOperacao := IIF(iTipoConta = 0, -6, -10006);    // A Vista
         //AL_39 - Fim
         //AL_23 - Fim

         ExecutarQuery(dtmOperComum.QryLocal,'Update HistCartInv Set      '+
                                             'FlgCustodia         = NULL '+
                                             'Where IdHistCartInv = '+IntToStr(iIdHistCartInv));

         // Capta a descrição do Tipo de Operação no cadastro
         dtmOperComum.QryLocal.Close;
         dtmOperComum.QryLocal.Sql.Clear;
         dtmOperComum.QryLocal.Sql.Add('SELECT DESCTIPOOPERACAO FROM TIPOOPERACAO ');
         dtmOperComum.QryLocal.Sql.Add('WHERE (IDTIPOOPERACAO = '+ IntToStr(iTipoOperacao)+')');
         dtmOperComum.QryLocal.Open;
         sTipoOperacao := dtmOperComum.QryLocal.FieldByName('DESCTIPOOPERACAO').AsString;
         //Al_40 - 21/06/2005
         if dtmOperComum.QryLocal.eof then
         begin
            dtmOperComum.QryLocal.Close;
            Raise Exception.Create('Não foi encontrado o Tipo de Operação = '+IntToStr(iTipoOperacao)+'!'+#13+
                                   'Verifique o cadastro de Tipos de Operação.');
         end;

         // Capta a descrição do investimento no cadastro
         dtmOperComum.QryLocal.Close;
         dtmOperComum.QryLocal.Sql.Clear;
         dtmOperComum.QryLocal.Sql.Add('SELECT DESCINVESTIMENTO FROM INVESTIMENTO ');
         dtmOperComum.QryLocal.Sql.Add('WHERE (IDINVESTIMENTO = '+ IntToStr(iInvestimento)+')');
         dtmOperComum.QryLocal.Open;
         sInvestimento := dtmOperComum.QryLocal.FieldByName('DESCINVESTIMENTO').AsString;
         dtmOperComum.QryLocal.Close;
         dtmOperComum.QryLocal.Sql.Clear;

         // Atualiza o Tipo de operação Origem utilizada
         ExecutarQuery(dtmOperComum.QryLocal,'UPDATE OPERCUSTODIA SET IDTIPOOPERORIG = ' + IntToStr(iTipoOperacao) + ' ' +
                                             'WHERE IDOPERCUSTODIA = ' + IntToStr(idOperCustodia));
         // AL_65 - Fim

         //Baixa da Carteira
         //Al_40 - 21/06/2005
         If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           iInvestimento,
                                           2,-1,-1,iTipoOperacao, iCarteiraOrig,
                                           0,-1,-1,-1{iPlanilha},-1{iDocumento},-1{iPlano}, dDataRef,
                                           fValorOper, fQuantidade,
                                           1, fSaldoVariacaoPro,0, fSaldoIrApuPro,0,0,0,0,0,0,
                                           'D','D', ''{sLote}, sTipoOperacao +' : '+sInvestimento,
                                           'TRC', '', '', True,-1, iPlanPrev, iIdHistCartInv) Then
            Raise Exception.Create('Não foi possível alimentar a carteira com essa operação!');

         iIdHistCartInvOrig := iIdHistCartInv;

         //Al_40 - 21/06/2005
         if not OperacaoInvest.AtualizaOperCustodia(idOperCustodia,iIdHistCustodiaOrig,iIdHistCustodiaDest,
                                                    iIdHistCartInvOrig,iIdHistCartInvDest) then
            Raise Exception.Create('Não foi possível atualizar a operação de custódia ' + #13 +
                                   'Data ' + DateToStr(dDataRef) + #13 +
                                   'Operação' + sTipoOperacao + #13 +
                                   'Investimento ' + sInvestimento);

         //Al_40 - 21/06/2005
         If Not OperComum.AtualizaSaldos(1,-1) Then
            Raise Exception.Create('Não foi possível atualizar o saldo ' + #13 +
                                   'Data ' + DateToStr(dDataRef) + #13 +
                                   'Operação' + sTipoOperacao + #13 +
                                   'Investimento ' + sInvestimento);

         ExecutarQuery(dtmOperComum.QryLocal,'Update HistCartInv Set      '+
                                             'FlgCustodia         = NULL '+
                                             'Where IdHistCartInv = '+IntToStr(iIdHistCartInv));

         // AL_39
         if ((((iTipoOperacao = -67) or (iTipoOperacao = -68) or
               (iTipoOperacao = -10067) or (iTipoOperacao = -10068)) and (dDataRef < pRPI.DATAULTFECH)) or
             (((iTipoOperacao <> -67) and (iTipoOperacao <> -68) and
               (iTipoOperacao <> -10067) and (iTipoOperacao <> -10068)) and (dDataRef <= pRPI.DATAULTFECH))) then
         begin
            // Carteira Origem
            //AL_83 - Atualizando o progresso do método no form original
            if Assigned(AtualizaProcesso) then
               AtualizaProcesso('Marcando os Investimentos para Reprocessamento - Origem', -1);
            //Al_40 - 21/06/2005
            
            if not RendaVariavel.MarcarFlagReproc(iInvestimento,
                                                  iCarteiraOrig,
                                                  iPlanPrev,
                                                  dDataRef,
                                                  False,
                                                  True,
                                                  True,
                                                  False,
                                                  'TRC') then
               Raise Exception.Create('Não foi possível marcar ' + sInvestimento + 'para Reprocessamento na Carteira Origem.');

            // Carteira Destino
            //AL_83 - Atualizando o progresso do método no form original
            if Assigned(AtualizaProcesso) then
               AtualizaProcesso('Marcando os Investimentos para Reprocessamento - Destino', -3);
            //Al_40 - 21/06/2005
            //Renan Cristiano - 19/02/2009 - N Sol 107630 - N. Kintana 484313
            if not RendaVariavel.MarcarFlagReproc(iInvestimento,
                                                  iCarteiraDest,
                                                  iPlanPrev,
                                                  dDataRef,
                                                  False,
                                                  True,
                                                  True,
                                                  False,
                                                  'TRC') then
               Raise Exception.Create('Não foi possível marcar ' + sInvestimento + 'para Reprocessamento na Carteira Destino.');

         end
         else
         begin
            //AL_83 - Atualizando o progresso do método no form original
            if Assigned(AtualizaProcesso) then
               AtualizaProcesso('', -1);
         end;

      Except
         //Al_40 - 21/06/2005
         On E:Exception Do
         Begin
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         Result := False;
         End;
      End;
   finally
      //AL_83 - Atualizando o progresso do método no form original
      if Assigned(AtualizaProcesso) then
         AtualizaProcesso('', -2);
      FreeAndNil(CtrlRV);
   end;
end;

//AL_71
procedure TOperComum.AlteraHistCustodiaOrigem(
                     idOperCustodia,iMotivoBloqueio,iCarteira,iInvestimento,
                     iCustodiante:integer;sLote:String;dDataRef:TDateTime;
                     fQuantidade: Double; var iIdHistCustodiaOrig: integer;
                     iPlanPrev: Integer = -1;
                     iTipoConta : Integer = 0);
var
   sTipoCustodia : string;
   iIdHistCustodia : Integer;
begin
      If iMotivoBloqueio = -1 Then
         sTipoCustodia := 'V'
      Else
         sTipoCustodia := 'Z';  //BLOQUEADA
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
end;

//AL_71
procedure TOperComum.InsereHistCustodiaDestino(
                     idOperCustodia,iMotivoBloqueio,iCarteira,iInvestimento,
                     iCustodiante:integer;
                     sLote:String;
                     dDataRef:TDateTime;fQuantidade:Double;
                     var iIdHistCustodiaDest:integer;
                     iPlanPrev: Integer = -1;
                     iTipoConta : Integer = 0);
var
   sTipoCustodia : string;
   iIdHistCustodia : integer;
begin
   If iMotivoBloqueio = -1 Then
      sTipoCustodia := 'C'
   Else
      sTipoCustodia := 'Y';  //BLOQUEADA

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
end;

function TOperComum.ProcExcluiCustodia(iIdOperCustodia, iIdHistCartInvOrig,
                                       iIdHistCartInvDest : Integer;
                                       dDataMovCustod     : TDateTime) : Boolean;
var
   dDataAnt : TDateTime;
begin
   Try
      MarcaFlgHistCustodia(-1,-1,iIdOperCustodia);

      With dtmOperComum Do
      begin
         // Excluir da Contabilidade

         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Excluindo Contabilizações', -1 );

         OperComum.LimpaParametros(QryBuscaPlnCodigo);
         QryBuscaPlnCodigo.ParamByName('IDHISTCARTINV').AsInteger := iIdHistCartInvOrig;
         QryBuscaPlnCodigo.Open;
         while not QryBuscaPlnCodigo.EOF do
         begin
            if not OperComum.ProcExclui(-1,QryBuscaPlnCodigo.FieldByName('PLNCODIGO').AsInteger,
                                        -1,2,
                                        dDataMovCustod,True) then
            begin
               Result := False;
               Exit;
            end;
            QryBuscaPlnCodigo.Next;
         end;

         //AL_82
         //Capta a descrição do Tipo de Operação no cadastro
         dtmOperComum.QryLocal.Close;
         dtmOperComum.QryLocal.Sql.Clear;
         dtmOperComum.QryLocal.Sql.Add('SELECT PLNCODIGO FROM BOLETA WHERE IDBOLETA IN ');
         dtmOperComum.QryLocal.Sql.Add('(SELECT IDBOLETA FROM OPERCUSTODIA WHERE IDOPERCUSTODIA ='+ IntToStr(iIdOperCustodia)+')');
         dtmOperComum.QryLocal.Open;
         if not dtmOperComum.QryLocal.IsEmpty then
         begin
            if not OperComum.ProcExclui(-1, dtmOperComum.QryLocal.FieldByName('PLNCODIGO').AsInteger,
                                        -1,2,
                                        dDataMovCustod, True) then
            begin
               Result := False;
               Exit;
            end;
         end;

         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Preparando Operação de Custódia para Exclusão', -1);
         OperComum.LimpaParametros(qryUpdOperCustodia);
         qryUpdOperCustodia.ParamByName('IDOPERCUSTODIA').AsInteger := iIdOperCustodia;
         qryUpdOperCustodia.ExecSQL;

         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Excluindo Históricos de Custódia', -1);
         OperComum.LimpaParametros(qryDelHistCustodia);
         qryDelHistCustodia.ParamByName('IDOPERCUSTODIA').AsInteger := iIdOperCustodia;
         qryDelHistCustodia.ExecSQL;

         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Excluindo Históricos da Carteira (Origem)', -1);
         OperComum.LimpaParametros(qryDelHistCartInv);
         qryDelHistCartInv.ParamByName('IDHISTCARTINV').AsInteger   := iIdHistCartInvOrig;
         qryDelHistCartInv.ExecSQL;

         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Excluindo Históricos da Carteira (Destino)', -1);
         OperComum.LimpaParametros(qryDelHistCartInv);
         qryDelHistCartInv.ParamByName('IDHISTCARTINV').AsInteger   := iIdHistCartInvDest;
         qryDelHistCartInv.ExecSQL;

         //AL_82 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Excluindo Operação de Custódia', -1);
         OperComum.LimpaParametros(qryDelOperacaoInvest);
         qryDelOperacaoInvest.ParamByName('IDOPERCUSTODIA').AsInteger := iIdOperCustodia;
         qryDelOperacaoInvest.ExecSQL;

         //AL_83 - Atualizando o progresso do método no form original
         if Assigned(AtualizaProcesso) then
            AtualizaProcesso('Excluindo Operação de Custódia', -1);
         OperComum.LimpaParametros(qryDelOperCustodia);
         qryDelOperCustodia.ParamByName('IDOPERCUSTODIA').AsInteger := iIdOperCustodia;
         qryDelOperCustodia.ExecSQL;         
      end;
      // Atualiza Saldos da Custodia
      //AL_83 - Atualizando o progresso do método no form original
      if Assigned(AtualizaProcesso) then
         AtualizaProcesso('Atualizando Saldos de Custódia', -1);
      OperacaoInvest.AtualizaSaldosCustodia;

      Result := True;

   Except
      MsgDlg('Não foi possível excluir a Operação.',
             'Mensagem do Sistema',mtWarning,[mbOK],0);
      Result := False;
   end;
end;

function TOperComum.ComparaValores(fValor1, fValor2: Double; sComparador: String;
                                   fPrecisao: Integer = 0): Boolean;
var i, iDec1, iDec2: Integer;
    sValor1, sValor2, sFormato1, sFormato2, sResultado: String;
    fValForm1, fValForm2, fResultado: Double;
begin
   // AL_4 - 04/08/2004 - Ajustes em toda a rotina

   // Zera valores
   fValForm1 := 0;
   fValForm2 := 0;
   sValor1   := '';
   sValor2   := '';
   sFormato1 := '';
   sFormato2 := '';

   //AL_26 Ini
   // Prepara Primeiro Valor
   sFormato1 := '#0.';
   sValor1 := FloatToStr(fValor1);
   iDec1 := Length(sValor1) - Pos(DecimalSeparator,sValor1);

   // Prepara Segundo Valor
   sFormato2 := '#0.';
   sValor2 := FloatToStr(fValor2);
   iDec2 := Length(sValor2) - Pos(DecimalSeparator,sValor2);

   // Caso passe Zero, utiliza a menor precisão
   if (fPrecisao = 0) then
   begin
      if iDec1 < iDec2 then
         fPrecisao := iDec1
      else
         fPrecisao := iDec2;
   end;

   fResultado := RoundCM((fValor1 - fValor2),fPrecisao);
   //AL_26 Fim

   // Testa o tipo de comparação passada
   if sComparador = '=' then
      Result := (fResultado = 0)
   else if sComparador = '>' then
      Result := (fResultado > 0)
   else if sComparador = '<' then
      Result := (fResultado < 0)
   else if sComparador = '<>' then
      Result := (fResultado <> 0);

end;

// Busca o Preco de Exercicio para as Açoes 'a Vista na Carteira de Opçâo
function TOperComum.BuscaCotacaoOpcao(iInvestimento,iCarteira: integer;
                                      dDataRef: TDateTime;
                                      sLote : String;
                                      fCotacao:Double): double;
begin
   Result := fCotacao;
   if fCotacao = 0 then
      Exit;
   // O Investimento deve estar na Carteira de Opções e ter Lote
   if (iCarteira = pRPI.IDCARTOPC) and
      (Trim(sLote) <> '') then
   begin
      OperComum.LimpaParametros(dtmOperComum.qryBuscaOrdemOpc);
      with dtmOperComum.qryBuscaOrdemOpc do
      begin
         ParamByName('IDLOTE').AsString := sLote;
         Open;
         if not IsEmpty then
         begin
            OperComum.LimpaParametros(dtmOperComum.qryInvestBase);
            with dtmOperComum.qryInvestBase do
            begin
               ParamByName('IDINVESTIMENTO').AsInteger :=
                  dtmOperComum.qryBuscaOrdemOpc.FieldByName('IDINVESTIMENTO').AsInteger;
               Open;
               if not IsEmpty then
               begin
                   if (dDataRef <= FieldByName('DTAVENCTO').AsDateTime) and
                      (fCotacao > FieldByName('PRECOPORLOTE').AsFloat) then
                      Result := FieldByName('PRECOPORLOTE').AsFloat;
               end;
            end;
         end;
      end;
   end;
end;

function TOperComum.FormatSecsToHMS(Secs: LongInt): string;
var Hrs, Min: Word;
begin
   Hrs := Secs div 3600;
   Secs := Secs mod 3600;
   Min := Secs div 60;
   Secs := Secs mod 60;

   if Hrs > 0 then
      Result := FormatFloat('#0',(Hrs/1)) + ':' + FormatFloat('00',(Min/1)) + ':' + FormatFloat('00',(Secs/1))
   else if Min > 0 then
      Result := FormatFloat('#0',(Min/1)) + ':' + FormatFloat('00',(Secs/1))
   else if Secs > 0 then
      Result := '0:' + FormatFloat('00',(Secs/1))
   else
      Result := '0';

end;

// AL_66 - Inicio
function TOperComum.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

function TOperComum.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

function TOperComum.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Extended): Extended;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

function TOperComum.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;
// AL_66 - Fim

function TOperComum.AScan(aArray: array of Integer; iElemento: Integer): Integer;
var i: Integer;
begin
  Result := -1;
  for i := 0 to Length(aArray) -1 do
  begin
     if aArray[i] = iElemento then
     begin
        Result := i;
        Break;
     end;
  end;
end;

function TOperComum.AScan(aArray: array of String; sElemento: String): Integer;
var i: Integer;
begin
  Result := 0;
  for i := 0 to Length(aArray) -1 do
  begin
     if aArray[i] = sElemento then
     begin
        Result := i;
        Break;
     end;
  end;
end;

function TOperComum.AScan(aArray: array of Double; dElemento: Double): Integer;
var i: Integer;
begin
  Result := 0;
  for i := 0 to Length(aArray) -1 do
  begin
     if aArray[i] = dElemento then
     begin
        Result := i;
        Break;
     end;
  end;
end;

function TOperComum.AScan(aArray: array of Variant; vElemento: Variant): Integer;
var i: Integer;
begin
  Result := 0;
  for i := 0 to Length(aArray) -1 do
  begin
     if aArray[i] = vElemento then
     begin
        Result := i;
        Break;
     end;
  end;
end;

// AL_6 - 30/09/2004
{ Atualiza as sequences do banco.
  O Programa Sequences.exe não funciona. A tabela BOLETA agora tem uma sequence que
    não é chave da tabela, causando um erro neste programa que não funciona mais.
  Esta rotina efetua tratamento diferenciado para esta tabela.  }
function TOperComum.AtualizaSequences(fraFrame: TfraMensagem = nil; prgTabProg: TProgressBar = nil): Boolean;
var qrySeqs, qryAtu, qryMaxID: TwwQuery;
    sTabela: String;
    iNRec: Integer;
begin
   try
      try
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
         while not qrySeqs.Eof do
         begin
            iNRec := iNRec + 1;
            qrySeqs.Next;
         end;
         qrySeqs.First;

         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         if fraFrame <> nil then
         begin
            fraFrame.Visible := True;
            fraFrame.Max := iNRec;
            fraFrame.Pos := 1;
         end
         else
         begin
            frmAguardeInv.Max := iNRec;
            frmAguardeInv.Min := 0;
            frmAguardeInv.Pos := 1;
         end;

         // Faz Loop em todas as Sequences
         sTabela := qrySeqs.FieldByName('TABELA').AsString;
         while not qrySeqs.Eof do
         begin
            qryMaxID.Close;
            qryMaxID.SQL.Clear;
            if qrySeqs.FieldByName('TABELA').AsString = 'BOLETA' then
            begin
               qryMaxID.SQL.Add('SELECT MAX(SEQBOLETA) AS MAXID FROM BOLETA');
            end
            else
            begin
               qryMaxID.SQL.Add('SELECT MAX(' + qrySeqs.FieldByName('COLUNA').AsString + ') AS MAXID FROM ' + qrySeqs.FieldByName('TABELA').AsString);
            end;
            qryMaxID.Open;

            qryAtu.Close;
            qryAtu.SQL.Clear;
            qryAtu.SQL.Add(' SELECT ' + qrySeqs.FieldByName('SEQUENCE').AsString + '.NEXTVAL AS VALOR FROM DUAL');

            if prgTabProg <> nil then
            begin
               qryAtu.Open;
               prgTabProg.Max := qryAtu.FieldByName('VALOR').AsInteger;
               prgTabProg.Position := 1;
            end;

            repeat
               // Adianta a Sequence
               qryAtu.Close;
               qryAtu.Open;
               if fraFrame <> nil then
               begin
                  fraFrame.Mes := 'Processando Tabela ' + qrySeqs.FieldByName('TABELA').AsString + #13 +
                                  'Sequence:' + qryAtu.FieldByName('VALOR').AsString;
                  fraFrame.Invalidate;
                  fraFrame.Update;
               end
               else
               begin
                  frmAguardeInv.Mostra('Processando Tabela ' + qrySeqs.FieldByName('TABELA').AsString + #13 +
                                       'Sequence:' + qryAtu.FieldByName('VALOR').AsString);
                  frmAguardeInv.Invalidate;
               end;
               if prgTabProg <> nil then
                  prgTabProg.StepIt;

               Application.ProcessMessages;
            until qryMaxID.FieldByName('MAXID').AsInteger <= qryAtu.FieldByName('VALOR').AsInteger;

            // Move até a próxima tabela
            while sTabela = qrySeqs.FieldByName('TABELA').AsString do
            begin
               qrySeqs.Next;
               if fraFrame <> nil then
                  fraFrame.Incrementa
               else
                  frmAguardeInv.Incrementa;
               Application.ProcessMessages;
            end;
            sTabela := qrySeqs.FieldByName('TABELA').AsString;
         end;

         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;
      except
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;
      end;
   finally
      // AL_44
      if (fraFrame <> nil) and (fraFrame.Parent <> nil) then
      begin
         fraFrame.Pos := 0;
         fraFrame.Mes := '';
         fraFrame.Visible := False;
      end
      else
         frmAguardeInv.Apaga;
      qryAtu.Free;
      qrySeqs.Free;
      qryMaxID.Free;
      Application.ProcessMessages;
   end;
end;

// AL_12 - 10/01/2005
function TOperComum.InvMsgBox( Msg : string;
                               DlgType: TMsgDlgType;
                               sCaption: string = '';
                               Buttons: TMsgDlgButtons = [mbOk];
                               ButtonsCaptions: String = '') : Word;
const
  Sounds: array [TMsgDlgType] of integer = ( MB_ICONEXCLAMATION,
                                             MB_ICONHAND,
                                             MB_OK,
                                             MB_ICONQUESTION,
                                             MB_ICONASTERISK );
var
  ComponentNO: TComponent;
  BotaoNO: TButton;
  sButtonName : string;
  I, iTam: Integer;
  aButCaption: Array of String;
begin
  I := 1;
  iTam := 0;
  while I <> 0 do
  begin
     I := Pos(';', ButtonsCaptions);
     if I > 0 then
     begin
        SetLength(aButCaption,iTam+1);
        aButCaption[iTam] := Copy(ButtonsCaptions,1,I-1);
        Inc(iTam);
        Delete(ButtonsCaptions,1,I);
     end
     else
     begin
        SetLength(aButCaption,iTam+1);
        aButCaption[iTam] := ButtonsCaptions;
     end;
  end;

  with CreateMessageDialog( Msg, DlgType, Buttons ) do
  begin
    try
      if sCaption = '' then
      begin
         if DlgType = mtWarning           then Caption := Caption + ' Atenção'
         else if DlgType = mtError        then Caption := Caption + ' Erro'
         else if DlgType = mtInformation  then Caption := Caption + ' Informação'
         else if DlgType = mtConfirmation then Caption := Caption + ' Confirmação'
         else                                  Caption := ' ' + Application.Title;
      end
      else
         Caption := ' ' + sCaption;

      Position := poScreenCenter;

      iTam := 0;
      for I := 0 to ComponentCount -1 do
      begin
         if Components[I] is TButton then
         begin
            if Length(aButCaption) >= iTam + 1 then
               TButton(Components[I]).Caption := aButCaption[iTam];
            Inc(iTam);
         end;
      end;

      Result := ShowModal;

    finally
      Free;
    end;
  end;
end; {MessageBox}

// AL_38
function TOperComum.OraNumero( sNumero : String ): String;
var i : integer;
    sOra : string;
    bPrimPonto : boolean;
begin
   Result := '';
   if Trim(sNumero) <> '' then
   begin
      sOra := '';
      bPrimPonto := True;
      for i := length(Trim(sNumero)) downto 1 do
      begin
        if sNumero[i] = ',' then
        begin
           if bPrimPonto then
           begin
              sOra := sOra + '.';
              bPrimPonto := False;
           end;
        end
        else
        begin
           if sNumero[i] <> '.' then
              sOra := sOra + sNumero[i]
           else
           begin
              if bPrimPonto then
              begin
                 sOra := sOra + '.';
                 bPrimPonto := False;
              end;
           end;
        end;
      end;
      for i := length(sOra) downto 1 do
         Result := Result + sOra[i];
   end
   else
      Result := '0';
end;

// AL_41
function TOperComum.OraNumero(fNumero: Double): String;
var i : integer;
    sNumero, sOra : string;
    bPrimPonto : boolean;
begin
   sNumero := FloatToStr(fNumero);
   Result := '';
   if Trim(sNumero) <> '' then
   begin
      sOra := '';
      bPrimPonto := True;
      for i := length(Trim(sNumero)) downto 1 do
      begin
        if sNumero[i] = ',' then
        begin
           if bPrimPonto then
           begin
              sOra := sOra + '.';
              bPrimPonto := False;
           end;
        end
        else
        begin
           if sNumero[i] <> '.' then
              sOra := sOra + sNumero[i]
           else
           begin
              if bPrimPonto then
              begin
                 sOra := sOra + '.';
                 bPrimPonto := False;
              end;
           end;
        end;
      end;
      for i := length(sOra) downto 1 do
         Result := Result + sOra[i];
   end
   else
      Result := '0';
end;
// AL_41 - fim

//AL_48
function TOperComum.VerificaGrupamentoAnterior(iInvestimento,iCarteira,iCarteiraGerenc, iHistorico,
                                               iTipoOper, iTipoOperNovo : Integer;
                                               dDataOper : string;
                                               iPlanPrev: Integer = -1) : boolean;
begin
   //AL_83
   try
      Result := False;
      if iCarteiraGerenc <> 0 then
      begin
         with dtmOperComum.qryHistGrupamentoGer do
         begin
            OperComum.LimpaParametros(dtmOperComum.qryHistGrupamentoGer);
            ParamByName('IDINVESTIMENTO').AsInteger      := iInvestimento;
            ParamByName('IDCARTEIRAINVEST').AsInteger    := iCarteira;
            ParamByName('IDCARTEIRAGERENC').AsInteger    := iCarteiraGerenc;
            ParamByName('DATAMOV').AsString              := dDataOper;
            ParamByName('HISTORICO').AsInteger           := iHistorico;
            ParamByName('iTIPOOPER').AsInteger           := iTipoOper;
            ParamByName('iTIPOOPERNOVO').AsInteger       := iTipoOperNovo;
            //AL_83
            if iPlanPrev > 0 then
            ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanPrev;
            Open;
            if not IsEmpty then
               Result := True;
         end;
      end
      else
      begin
         with dtmOperComum.qryHistGrupamento do
         begin
            OperComum.LimpaParametros(dtmOperComum.qryHistGrupamento);
            ParamByName('IDINVESTIMENTO').AsInteger      := iInvestimento;
            ParamByName('IDCARTEIRAINVEST').AsInteger    := iCarteira;
            ParamByName('DATAMOV').AsString              := dDataOper;
            ParamByName('HISTORICO').AsInteger           := iHistorico;
            ParamByName('iTIPOOPER').AsInteger           := iTipoOper;
            ParamByName('iTIPOOPERNOVO').AsInteger       := iTipoOperNovo;
            //AL_83
            if iPlanPrev > 0 then
            ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanPrev;
            Open;
            if not IsEmpty then
               Result := True;
         end;
      end;
   finally
      dtmOperComum.qryHistGrupamento.Close;
      dtmOperComum.qryHistGrupamentoGer.Close;
   end;
end;

function TOperComum.BuscaPercProvPerda(dDataAtual: TDateTime; iInvestimento: Integer;
                                       iCarteiraInvest: Integer = -1;
                                       iCarteiraGerenc: Integer = -1): Double;
var qry: TwwQuery;
begin
   try
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
      qry.SQL.Add('           AND P2.DATAVIGENCIA <= TO_DATE(' + QuotedStr(DateToStr(dDataAtual))+',' + QuotedStr('DD/MM/YYYY') + '))');
      qry.Open;
      if not qry.IsEmpty then
         Result := qry.FieldByName('PERCENTUAL').AsFloat;
   finally
      FreeAndNil(qry);
   end;
end;

//AL_103
procedure TOperComum.GravaLogTotalPrev(sDescOperacao: String);
begin
   Try
      Opercomum.LimpaParametros(dmrendavariavel.QryGravaLogTotalPrev);
      dmrendavariavel.QryGravaLogTotalPrev.Close;
      dmrendavariavel.QryGravaLogTotalPrev.ParamByname('IDLOGTOTALPREV').AsInteger := LeUltRegistro(Nil,'LOGTOTALPREV');
      dmrendavariavel.QryGravaLogTotalPrev.ParamByname('IDUSUARIO').AsInteger := Sistema.IdUsuario;
      dmrendavariavel.QryGravaLogTotalPrev.ParamByname('IDMODULO').AsInteger := Sistema.IdModulo;
      dmrendavariavel.QryGravaLogTotalPrev.ParamByname('VERSAO').AsString := Sistema.Versao;
      dmrendavariavel.QryGravaLogTotalPrev.ParamByname('DESCOPERACAO').AsString := sDescOperacao;
      dmrendavariavel.QryGravaLogTotalPrev.ExecSQL;
      dmrendavariavel.QryGravaLogTotalPrev.Close;
   Except
   End;
end;

//AL_109
function TOperComum.DataOracle(dData: TDateTime): String;
begin
   try
      Result := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dData)) + ',' + QuotedStr('dd/mm/yyyy') + ')';
   except
      if dData = 0 then
      begin
         Result := '';
         Exit;
      end;
      Result := DataOracle(0);
   end;
end;

function TOperComum.DataOracle(sData: String): String;
begin
   try
      Result := 'TO_DATE(' + QuotedStr(sData) + ',' + QuotedStr('dd/mm/yyyy') + ')';
   except
      if sData = '' then
      begin
         Result := '';
         Exit;
      end;
      Result := DataOracle('');
   end;
end;

function TOperComum.GetSaldoEmAtualizaSaldo: Double;
begin
    Result := fQtdeFinalInvest;
end;

//Ricardo Cristiano - 21/07/2009 - N. Sol 122235 -  N. Kintana 597042
function TOperComum.VerificaDesdobramentoAnterior(iInvestimento,iCarteira,iCarteiraGerenc, iHistorico,
                                                  iTipoOper, iTipoOperNovo : Integer;
                                                  dDataOper : string;
                                                  iPlanPrev: Integer = -1) : boolean;
begin
   //AL_83
   try
      Result := False;
      with dtmOperComum.qryHistDesdobramento do
      begin
         OperComum.LimpaParametros(dtmOperComum.qryHistDesdobramento);
         ParamByName('IDINVESTIMENTO').AsInteger      := iInvestimento;
         ParamByName('IDCARTEIRAINVEST').AsInteger    := iCarteira;
         ParamByName('DATAMOV').AsString              := dDataOper;
         ParamByName('HISTORICO').AsInteger           := iHistorico;
         ParamByName('iTIPOOPER').AsInteger           := iTipoOper;
         ParamByName('iTIPOOPERNOVO').AsInteger       := iTipoOperNovo;
         //AL_83
         if iPlanPrev > 0 then
            ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         Open;
         if not IsEmpty then
            Result := True;
      end;
   finally
      dtmOperComum.qryHistDesdobramento.Close;
   end;
end;

end.

