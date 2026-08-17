//********************************************************************************************************
// Data	     : 11/08/2009
// Autor     : Thiago Passos Kintana 609813 SOL 122886
// Kintana   : 609813
// SOL       : 122886
// Função    : Implementação do filtro de Emissor no Reprocessamento
//             Ajustando mensagens de critica para não permitir que apenas um emissor seja
//             PROCESSADO em um dia novo
//******************************************************************************
// SOL        : 123412
// Kintana    : 628716
// Data       : 11/09/2009
// Responsável: Thiago Passos
// Descrição  : Correção da rotina que gera o Documento no Financeiro
//******************************************************************************
// SOL        : 39918
// Kintana    : 523459
// Data       : 10/08/2009
// Responsável: Thiago Passos
// Descrição  : Correção de Indices em dias Uteis
//******************************************************************************
// Rotina     : IntegraCapCarRendaFixa
// SOL        : 123324
// Kintana    : 615338
// Data       : 19/08/2009
// Responsável: Thiago Passos
// Descrição  : Correção da inserção de dados no Contábil.
//******************************************************************************
// Rotina     : MarcaInvRep
// SOL        : 100396
// Kintana    : 443929
// Data       : 05/11/2008
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para verificar os registros mesmo que não sejam
//              encontrados(Retirada a crítica).
//******************************************************************************
// Rotina     : IncluiTransferencia
// SOL        : 98617
// Kintana    : 430072
// Data       : 29/10/2008              
// Responsável: Ricardo Cristiano
// Descrição  : Implementação de alteração na captação do id de origem da aplicação,
//               para ter um alinhamento corrento entre origem e destino.
//******************************************************************************
// Rotina     : MarcaInvRep
// SOL        : 99825
// Kintana    : 439935
// Data       : 30/10/2008               
// Responsável: Ricardo Cristiano
// Descrição  : Otimização no SQL da query que faz a marcação dos títulos
//               para reprocessamento.
//******************************************************************************
// Rotina     : IncluiTransferencia
// SOL        : 96116
// Kintana    : 415550 
// Data       : 03/10/2008               
// Responsável: Andre Luiz Santos     
// Descrição  : Implementação na operação de transferência entre planos para
//              Corrigir o erro ao reprocessar investimentos da da classe
//               DEBENTURES NÃO CONVERSÍVEIS.
//******************************************************************************
// Data	     : 11/08/2008
// Codigo    : AL_104
// Kintana   : 390437
// SOL       : 91917
// Função    : Erro de VLCDB50.BPL ao reprocessar Poupança bloqueada foi alterada
//             a CalculaItensAtuPoup
//*******************************************************************************
// Data	     : 28/05/2008
// Codigo    : AL_103 
// Pendência : 24716
// SOL       : 55534
// Função    : Out of Memory
//******************************************************************************
// Data	     : 05/05/2007
// Codigo    : AL_102
// Pendência : 27863
// SOL       : 84230
// Função    : Ajuste no sql de entrada para valores decimais nos fluxos
//******************************************************************************
// Data	     : 24/08/2007
// Codigo    : AL_101
// Pendência : 26084
// SOL       :
// Função    : Ajuste para funcionamento de Swap
//******************************************************************************
// Data	     : 10/10/2007
// Codigo    : AL_100
// Pendência : 26496
// SOL       :
// Função    : Ajuste na contabilização em 3 camadas (Lançamento Financeiro)
//             Ajuste nos processos de lançamento de operação (Mensagens de erro)
//             Utilização do Objeto CtrlPInv nas rotinas contabeis
//             Organização dos métodos em ordem de funcionalidade
//******************************************************************************
// Data	     : 03/09/2007 - Ajuste no Padrão 16
// Codigo    : AL_99
// Pendência : 23283
// SOL       :   
// Função    : Ajuste na contabilização - AtualizaRecalculo - Localiza o item correto
//             Inicio da utilização da CtrlPInv em substituição ao pRPI
//******************************************************************************
// Data	     : 27/08/2007
// Codigo    : AL_98
// Pendência : 26213
// SOL       : 67596
// Função    : Ajuste nas rotinas contábeis para levar o histórico cadastrado no
//               parâmetro contábil.
//******************************************************************************
// Data	     : 06/08/2007
// Codigo    : AL_97
// Pendência : 26016
// SOL       : 65711
// Função    : Criar novos itens incluídos no perfil com a operação decorrida na
//               operação de TRC para que possam ser relançados no reprocessamento
//******************************************************************************
// Data	     : 26/07/2007
// Codigo    : AL_96
// Pendência : 25964
// SOL       :
// Função    : Utilizar a regra do perfil quendo o histórico não tiver nenhuma
//******************************************************************************
// Data	     : 11/07/2007
// Codigo    : AL_95
// Pendência : 25866
// SOL       :
// Função    : Implementação de Lançamento Financeiro em 3 camadas
//              (Segregação de Recursos)
//******************************************************************************
// Data	     : 10/07/2007
// Codigo    : AL_94
// Pendência : 25880
// SOL       :
// Função    : Tratamento do novo tipo de item "N" - Valor para Cálculo
//******************************************************************************
//Data	     : 04/07/2007
//Codigo     : AL_93
//Pendência  : 24717
//SOL        : 55534
//Desc       :  -- Out of Memory --
//             Melhora na abertura da query BuscaSaldos
//             Melhora na utilização dos arrays de campos e valores do sql de entrada do regra
//********************************************************************************************************
// Data	     : 05/07/2007
// Codigo    : AL_92
// Pendência : 25765
// SOL       : 63337
// Função    : Acerto no gravação do Item Taxa de Juros (Tipo T) na OperRenfixXCurvas nas TRC Planos
//********************************************************************************************************
// Data	     : 19/06/2007
// Codigo    : AL_91
// Pendência :
// SOL       :
// Função    : Acerto no parametro de Centro de Custo que estava com o Centro de Responsabilidade
//********************************************************************************************************
// Data	     : 04/06/2007
// Codigo    : AL_90
// Pendência : 25309
// SOL       : 58642
// Função    : Implementação de Flag para atualizar o Título no dia da Emissão.
//******************************************************************************
// Data      : 16/05/2007
// Código    : AL_89
// Pendencia : 25336
// SOL       : 60074
// Desc      : Acerto na Busca de Saldos de Operações de Renda Fixa para trazer
//              os diversos Planos / Patrocinadoras
//******************************************************************************
// Data      : 25/04/2007
// Código    : AL_88
// Pendencia : 25157
// SOL       : 50778
// Desc      : Acerto na Marcação para Reprocessamento para não marcar em todos
//              os Planos
//******************************************************************************
// Data      : 27/03/2007
// Código    : AL_87
// Pendencia : 24773
// SOL       : 55877
// Desc      : Acerto para testar a FazContabilizacao no Reprocessamento independente
//             da Trava contábil
//******************************************************************************
// Data      : 20/03/2007
// Código    : AL_86
// Pendencia : 24773/24774
// SOL       : 55877
// Desc      : Liga/Desliga a integração contabil financeira por módulo
//******************************************************************************
// Data      : 16/03/2007
// Código    : AL_85
// Pendencia : 24773
// SOL       : 55877
// Desc      : Troca do FLGCONTABILIZA para o Especifico de Renda Fixa FLGINTCONTABRF
//******************************************************************************
// Data      : 15/03/2007
// Código    : AL_84
// Pendencia :
// SOL       :
// Desc      : Acerto na crítica de exclusão na ExcluiContabilidadeRenFix quando
//             o FLGCONTABILIZA for 'N'
//******************************************************************************
// Data      : 16/02/2007
// Código    : AL_83
// Pendencia : 22779
// SOL       : 43633
// Desc      : Implementação de mais de um TRC entre Planos
//             Conforme o Alano, retirar a critica de trc lancadas no dia e utili
//             zar sempre o saldo do dia anterior
//******************************************************************************
// Data      : 23/01/2007
// Código    : AL_82
// Pendencia : 23705
// SOL       : 40671
// Desc      : Acerto na rotina de VerificaSeAtuDiaria qdo o dia é 29,30,31 e o
//             mês for Fevereiro
//             Implementada da Integração com o Sistema Jurídico para operações
//              de Penhora, Bloqueio e Desbloqueio de Penhora para Renda Fixa
//              e Fundos de Investimentos.
//******************************************************************************
// Data      : 19/01/2007
// Código    : AL_81
// Pendencia : 23705
// SOL       : 40671
// Desc      : Acerto na ExcluiContabilidadeRenFix quando a planilha = 0
//******************************************************************************
// Data      : 11/01/2007
// Código    : AL_80
// Pendencia : 22492
// SOL       :
// Desc      : Acerto na Contabilização em dia não util
//******************************************************************************
// Data      : 12/01/2007
// Código    : AL_79
// Pendencia : 23674
// SOL       : 47946
// Desc      : Segregação de Recursos
//******************************************************************************
// Data      : 27/11/2006
// Código    : AL_78
// Pendencia : 23861
// SOL       : 43516
// Desc      :Inclusão do Campo FLGUSAQTD na CLASSETITRENFIX para tratamento
//            no Calculo de Valores e arredondamentos para titulos que não
//            usam a quantidade
//******************************************************************************
// Data      : 27/11/2006
// Código    : AL_77
// Pendencia : 23778
// SOL       :
// Desc      : Inclusão da descrição do Investimento no históruico contábil de
//             transferencia entre planos
//******************************************************************************
// Data      : 06/11/2006
// Código    : AL_76
// Pendencia : 22492
// SOL       :
// Desc      : Implementação de Contabilização em dias úteis para ativos de
//             Renda Fixa que geram registros em dias não uteis
//******************************************************************************
// Data      : 02/10/2006
// Código    : AL_75
// Pendencia : 23413
// SOL       :
// Desc      : Acerto na passagem de paramentro para contabilização de Poupança quando
//             em fechamento normal que estava ficando sempre zerado.
//******************************************************************************
// Data      : 27/09/2006
// Código    : AL_74
// Pendencia : 23344
// SOL       :
// Desc      : A partir de 01/10/2006 todas as operações devem cair na Conta de
//             Investimento (CCI) devendo o flgContaInvest ser sempre = 1
//******************************************************************************
// Data      : 14/09/2006
// Código    : AL_73
// Pendencia :
// SOL       :
// Desc      : Ajuste na BuscaTotResgPoup para buscar os totais de TRC
//             Acerto no relançamento das operações para não calcular Lucro/Prej.
//               para Transferência entre Planos
//             Ajustes no lançamento e reprocessamento das TRC
//******************************************************************************
// Data      : 07/08/2006
// Código    : AL_72
// Pendencia : 23008
// SOL       :
// Desc      : Acerto na IncluiTransferencia que não estava excluido corretamente
//             Implementações do processamento de TRC
//******************************************************************************
// Data      : 18/07/2006
// Código    : AL_71
// Pendencia : 22779
// SOL       :
// Desc      : Criadas as rotinas de Lançamento e Exclusão de Transferência de Títulos
//             IncluiTransferencia
//             ExcluiTransferencia
//******************************************************************************
// Data      : 03/07/2006
// Código    : AL_70
// Pendencia : 22658
// SOL       : 44185
// Desc      : Função para verificar a falta do Histórico quando do lançamento
//             de operações de Baixa.
//             Acerto na função MarcadoReproc  que não estava passando a data de ult fechto
//******************************************************************************
// Data      : 03/07/2006
// Código    : AL_69
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//********************************************************************************************************
//Data	     : 26/05/2006
//Codigo     : AL_68
//Pendência  : 22480
//SOL        : 43633
//Função     : Melhorias na Funcionalidade de Transferencia entre planos
//********************************************************************************************************
// Data     : 04/05/2006
// Código   : AL_67
// Pendencia:
// Sol      :
// Motivo   : Nao integrar com o financeiro qdo o RecPag <> de R e P
//********************************************************************************************************
//Data	     : 15/03/2006
//Codigo     : AL_66
//Pendência  : 21650
//SOL        : 40682
//Função     : Implementação do Campo Data de Liquidação na LancaHistResgateRenFix, LancaItensHistResgTot e
//             LancaItensHistResgParcial
//********************************************************************************************************
// Data     : 13/03/2006
// Código   : AL_65
// Pendencia:
// Sol      :
// Motivo   : As rotinas de fechamento passam a utilizar metodo de Notificação de Evento para mover barras
//               de progresso
//********************************************************************************************************
// Data     : 20/02/2006
// Código   : AL_64
// Pendencia:
// Sol      :
// Motivo   : Ajuste na rotina de gravaçao do parâmetro de sistema em abertura
//********************************************************************************************************
// Data     : 07/02/2006
// Código   : AL_63
// Pendencia:
// Sol      :
// Motivo   : Ajusta a rotina que verifica se a atualização da poupança é diário ou não 
//********************************************************************************************************
// Data     : 21/12/2005
// Código   : AL_62
// Pendencia:
// Sol      :
// Motivo   : Acerta o fechamento da qyrAux inserida no AL_60 - Erro no lançamento financeiro
//********************************************************************************************************
// Data     : 06/12/2005
// Código   : AL_61
// Pendencia: 20901
// Sol      : 38821
// Motivo   : Verifica parâmetro de regime de Caixa ou Competência nas Operações de Renda Fixa
//********************************************************************************************************
//Data	 :  05/12/2005
//Codigo :  AL_60
//Função :  Acerta a gravação do Plano/Patro da IntegraContabCapCar
//********************************************************************************************************
//Data	 :  28/11/2005
//Codigo :  AL_59
//Função :  Verifica se existe duas atualizações em um mesmo dia sem
//            operação (Aplicação ou Resgate), exclui as duas atualizações
//********************************************************************************************************
//Data	 :  09/11/2005
//Codigo :  AL_58
//Função :  Inclusão do Parametro IOPER na BuscaSaldos para, no caso de buscar saldos
//            para relançar um resgate, buscar o último saldo do dia, mesmo sendo um fluxo
//********************************************************************************************************
//Data	 :  08/11/2005
//Codigo :  AL_57
//Função :  Inclusão do Campo CARENCIA na CalculaItensAtuPoup
//********************************************************************************************************
//Data	 :  11/10/2005
//Codigo :  AL_56
//Função :  Ajuste nas rotinas de IOF
//          Ajuste na rotina ContabilizaAtu na captação da provisão de perda
//********************************************************************************************************
//Data	 :  30/09/2005
//Codigo :  AL_55
//Função :  Ajuste para inversão de contas para valores negativos
//********************************************************************************************************
//Data	 :  09/09/2005
//Codigo :  AL_54
//Função :  Ajuste na rotina de inclusão de Primeira Vigencia de repactuação, só
//            verifica operações que ainda não tenham vigencia nenhuma
//          Ajuste na rotina de verificação de repactuação para aceitar uma data limite
//********************************************************************************************************
//Data	 :  02/09/2005
//Codigo :  AL_53
//Função :  Criação do método para verificar se o título já foi repactuado
//          Criação do método para buscar a maior data de vigência até uma data limite x
//          Criação de novo Item no vetor da CalculaItens para a Data de Vigencia
//********************************************************************************************************
//Data	 :  25/08/2005
//Codigo :  AL_52
//Função :  Implementação de filtro IDINVESTIMENTO na função BuscaOperacao
//********************************************************************************************************
//Data	 :  17/08/2005
//Codigo :  AL_51
//Função :  Criação da rotina para preencher o primeiro histórico de prorrogação de vencimento
//          Exclusão do histórico junto com a operação
//********************************************************************************************************
//Data	 :  17/08/2005
//Codigo :  AL_50
//Função :  Acerto na rotina de Resgate Total qdo Poupança
//********************************************************************************************************
//Data	 :  29/07/2005
//Codigo :  AL_49
//Função :  Acerto na rotina de Apropriação de Juros e Correçao no Resgate de Poupança
//********************************************************************************************************
//Data	 :  01/08/2005
//Codigo :  AL_48
//Função :  Acerto na passagem de TO_DATE para não ocorrer erro de conversao
//********************************************************************************************************
//Data	 :  19/07/2005
//Codigo :  AL_47
//Função :  Acerto na rotina de Apropriação de Juros e Correçao no Aniversário (Mensal) onde a verificação do
//          OR não estava fechada para o teste do ItemRenfix
//********************************************************************************************************
//Data	 :  29/06/2005
//Codigo :  AL_46
//Função :  Acerto na rotina de VerificaSeAtuDiaria
//********************************************************************************************************
//Data	 :  28/06/2005
//Codigo :  AL_45
//Função :  Somente testa Período contábil na Marcação para Reprocessamento e não na Desmarcação
//********************************************************************************************************
//Data	 :  23/06/2005
//Codigo :  AL_44
//Função :  Implementação de função para verificar se a Poupança deverá ser Mensal ou Diária conforme a
//          data de aniversário e o período inicial (Funcef em Fev/2005)
//********************************************************************************************************
//Data	 :  23/06/2005
//Codigo :  AL_43
//Função :  Implementação de Provisão de IOF para contabilização pela diferença diária
//********************************************************************************************************
//Data	 :  15/06/2005
//Codigo :  AL_42
//Função :  Ajuste na rotina de contabilização para Provisão de Perda da Refer
//********************************************************************************************************
//Data	 :  15/06/2005
//Codigo :  AL_41
//Função :  Acerto na Inicializacao de variáveis fVlrCtb e fVlrAcu
//********************************************************************************************************
//Data	 :  08/06/2005
//Codigo :  AL_40
//Função :  Inclusão do campo VLROPERACAO na qruBuscaPUFluxo
//********************************************************************************************************
//Data	 :  08/06/2005
//Codigo :  AL_39
//Função :  Inclusão Round para não causar erro
//********************************************************************************************************
//Data	 :  20/05/2005
//Codigo :  AL_38
//Função :  Implementação do teste de período contabil em 3 camadas
//********************************************************************************************************
//Data	 :  23/05/2005
//Codigo :  AL_37
//Função :  Busca a qtd resgatada desde o último aniversário para abater no saldo de qtd
//          Inclusão do parametro dDataAniv na função LancaHistResgateRenFix
//********************************************************************************************************
//Data	 :  16/05/2005
//Codigo :  AL_36
//Função :  Acerto na passagem de parâmetros para achar corretamente o dia do Aniv. de Poupança (D + 1)
//********************************************************************************************************
//Data	 :  03/05/2005
//Codigo :  AL_35
//Função :  Retirado a AL_12 pois o retorno de regra para titulo de cotação é a própria variação, não podendo
//          ser comparado se a variação anterior é igual a atual.
//********************************************************************************************************
//Data	 :  28/04/2005
//Codigo :  AL_34
//Função :  Crítica para cálculo de atualização de poupança qdo a atu é mensal.
//********************************************************************************************************
//Data	 :  28/04/2005
//Codigo :  AL_33
//Função :  Acerto na passagem de parâmetro da função BuscaUltimoAnivPoupanca que estava passando
//          qrySelOperRenFixDATAOPERACAO.AsDateTime(data da operacao na dataproc)
//          ao invés de qryBuscaSaldosOperDATAOPERACAO.AsDateTime (aplic original)
//********************************************************************************************************
//Data	 :  27/04/2005
//Codigo :  AL_32
//Função :  Esta sendo retira o bloco pois está atrapalhando o cálculo e ningém lembra o porque do bloco
//********************************************************************************************************
//Data	 :  27/04/2005
//Codigo :  AL_31
//Função :  Critica para não permitir a execução da ContabilizaRendaFixa se o Valor a contabilizar for
//          menor ou igual a Zéro e implementacao da variavel bGerouContab pois se não houver lancamentos
//          contábeis, deverá ser apagado a Planilha da HISTRENFIX
//********************************************************************************************************
//Data	 :  26/04/2005
//Codigo :  AL_30
//Função :  Acerto na rotina de ExcluiHistRenFix para refazer o Contábil das Operações
//          e retinado a rotina de Exclusão de Financeiro uma vez que istó NUNCA poderá ocorrer.
//********************************************************************************************************
//Data	 :  26/04/2005
//Codigo :  AL_29
//Função :  Acerto na identação da função RefazOperacoes com a inclusao do  try / finally
//********************************************************************************************************
//Data	 :  22/04/2005
//Codigo :  AL_28
//Função :  Retirada da função: Não chegou a ser testada nem utilizada
//********************************************************************************************************
//Data	 :  18/04/2005
//Codigo :  AL_27
//Função :  Acerto na passagem de parametros para a função BuscaUltimoAnivPoupanca que esta
//          passando +1 na data de aplic e não na de processamento
//********************************************************************************************************
//Data	 :  18/04/2005
//Codigo :  AL_26
//Função :  Acerto na rotina de Resgate Para buscar o saldo correto do item -5 e -6
//********************************************************************************************************
//Data	 :  09/04/2005
//Codigo :  AL_25
//Função :  Retirada do frm Aguarde para tentar melhorar o consumo de memória
//             Passa a não mostrar progresso algum quando nenhum progress for passado
//********************************************************************************************************
//Data	 :  07/04/2005
//Codigo :  AL_24
//Função :  Ajuste e Reorganização na parte de gravação dos itens na rotina CalculaItensAtu
//          Novo parametro para as rotinas CalculaItensAtu e CalculaItensAtuPoup
//          Agilização na localização do Item da Operação (Locate)
//********************************************************************************************************
//Data	 :  05/04/2005
//Codigo :  AL_23
//Função :  Reengenharia na rotina VerificaDataPgJuros
//********************************************************************************************************
//Data	 :  31/03/2005
//Codigo :  AL_22
//Função :  Criação de qry em tempo de execução
//********************************************************************************************************
//Data	 :  28/03/2005
//Codigo :  AL_21
//Função :  Fechamento de qry's
//********************************************************************************************************
//Data	 :  28/03/2005
//Codigo :  AL_18
//Função :  Ajustes na rotina de gravação dos itens calculados para gravação do valor
//           Ajuste na rotina de conversão de PU para Valor do Acumulado
//           Criação de Try/Finally para destruir componetes criados
//          Nova Rotina de Contabilização de Titulos
//********************************************************************************************************
//Data	 :  23/03/2005
//Codigo :  AL_17
//Função :  Alterações para Calcular e Gravar o Vlr do Item e o Valor Acumulado do
//           Item na HISTRENFIXXITENS
//********************************************************************************************************
//Data	  :  04/03/2005
//Codigo  :  AL_16
//Função  :  Implementado rotina para buscar a data correta de Pagto de Juros
//********************************************************************************************************
//Data	  :  04/03/2005
//Codigo  :  AL_15
//Função  :  Colocado parametro IDITEMRENFIX na qryBuscaUltPUPagtoJur
//********************************************************************************************************
//Data	  :  23/02/2005
//Codigo  :  AL_14
//Função  :  Colocado parametro sOper na qryBuscaTotalResgPoup para acertar o somatório de resgates
//           conforme o momento do processamento (Atualização (<) ou Operação (<=)
//********************************************************************************************************
// Data	  :  22/12/2004
// Codigo :  AL_13
// Motivo :  Passa a Buscar os PUs de Pg Juros e Amort Princ na OPERRENFIX
//********************************************************************************************************
// Data	  :  15/12/2004
// Codigo :  AL_12
// Motivo :  Acertado as qtd de decimais na comparação de valores que causava Resultado = 0 e não contabilizava
//            a atualização
//********************************************************************************************************
// Data	   :  14/12/2004
// Codigo :  AL_11
// Motivo :  Acertado o Tratamento para Operações de Fluxo pois a NATUREZA DA OPERACAO deve ser "D"
//********************************************************************************************************
//Data	 :  08/12/2004
// Codigo :  AL_10
//Motivo  :  incluído o parâmetro IDITEMRENFIX na qryBuscaPUPGJuros
//******************************************************************************
// Data   :  24/09/2004
// Codigo :  AL_9
// Função :  IntegraContabCapCar,LancaItensHistResgTot, LancaItensHistResgParcial,
//           IntegraCapCarRendaFixa, LancaHistResgateRenFix, RefazOperacoes
// Motivo :  Implementacao do paramentro FlgContaInvest (CPMF)
//******************************************************************************
// Data   :  21/09/2004
// Codigo :  AL_8
// Função :  GravaEmAbertura
// Motivo :  Ajuste na gravação do parâmetro
//******************************************************************************
// Data   :  14/09/2004
// Codigo :  AL_7
// Função :
// Motivo :  O campo qryBuscaSaldosItemsIDREGRA vai trazer sempre a regra que está
//           cadastrada no perfil e nunca a do histórico, a que foi utilizada antes
//********************************************************************************************************
// Data   :  04/08/2004
// Codigo :  AL_6
// Função :  VerEmAbertura e GravaEmAbertura
// Motivo :  Novas rotinas para controle do processo de abertura
//********************************************************************************************************
// Data   :  09/07/2004
// Codigo :  AL_5
// Função :  CalculaItensAtu
// Motivo :  Passa a buscar PU de Amortização de Principal no dia seguinte ao fluxo
//           Nome de query errado na LimpaParametros
//********************************************************************************************************
// Data   :  06/07/2004
// Codigo :  AL_4
// Função :  RefazOperacoes
// Motivo :  Passa o parametro TipoProc = 3 para buscar saldo já com fluxos lançados
//********************************************************************************************************
// Data   :  06/07/2004
// Codigo :  AL_3
// Função :  RecalculaTransf
// Motivo :  Passa a selecionar somente as operações de transferencia
//********************************************************************************************************
//Data	 	 :  01/06/2004
//Linha   :  AL_2
//Função	 :  Desmarca Investimentos no Reprocessamento de Titulos Zerados
//*******************************************************************************
//Data	 	 :  27/05/2004
//Linha   :  AL_1
//Função	 :  Não Volta a data do sistema no reprocessamento
//********************************************************************************************************
// Data   :  17/05/2004
// Origem :  REFER
// Função :  LancaHistResgateRenFix, IntegraCapCarRendaFixa
// Motivo :  Tratamento para Integraçao Financeira Valor Liquido no Resgate
//********************************************************************************************************
// Data   :  06/05/2004
// Origem :  CM
// Função :  LancaItensHistResgTot, LancaItensHistResgParcial,IntegraCapCarRendaFixa
// Motivo :  Tratamento para Integraçao Financeira em Itens <> - 5 (Valor Liquido)
//********************************************************************************************************
// Data	 	:  04/05/2004
// Função	:  O Reprocessamento não volta a data do sistema.
//           Criação do controle de títulos calculados e a calcular,
//               para que em caso de interrupção do processamento, este recomeçe
//               no mesmo ponto que foi interrompido.
//*******************************************************************************
// Data	 	:  20/04/2004
// Função	:  Ajuste nos cálculos de Papeis com cotação de renda fixa com
//                  pagamento de juros na data
//*******************************************************************************
// Data	 	:  28/04/2004
// Função	:  Criação das rotinas:
//              MarcadoReproc - Verifica se uma aplicação está marcada para
//                              reprocessamento, ou se existe alguma aplicação
//                              marcada
//              MarcaInvRep   - Marca uma aplicação para reprocessamento
// Motivo :  Novo método de reprocessamento automático de renda fixa
//*******************************************************************************
unit URendaFixa;

interface

Uses
  //AL_38
  //AL_61
  //AL_100
  //AL_102
  //AL_103
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls, ComCtrls, faMensagem,
  DBClient, uCMClientDataSet, 
  uCMMath,
  uCtrlInvContab,
  uCtrlParamInvest,
  uCtrlRendaFixa;

Type
   // Registro com as Cotacoes
   TRegBuscaPUAtualizadoAnt = Record
                                PUAtualizado :Double;
                                PUInformado  :Double;
                                PercAmort    :Double;
                                DataIni      :TDateTime;
                              End;

   TRendaFixa = Class(TObject)
   private

   public
      //AL_103
      procedure FechaBuscaOperacao;
      procedure FechaBuscaSaldos;
      procedure FechaBuscaSaldosPoup;
      procedure FechaBuscaSaldosAux;

      function IncorporaJurosPrincipal(dDataAtu:TDateTime;iInvestimento:Integer;
                                       fPuCorrigido,fPUAtualizado,wSaldoQtd:Double): Double;

      function BuscaPUAtualizadoAnt(dDataAtu : TDateTime;iInvestimento : Integer):TRegBuscaPUAtualizadoAnt;

      function PagamentoJuros(dDataAtu:TDateTime;iInvestimento,iCarteira:Integer;
                              iCotaIni,fPuCorrigido,fPuJuros,wSaldoQtd:Double;sLote:string;
                              sTipoTitulo: String = ''):Double;

      function AmortizacaoPrincipal(dDataAtu:TDateTime;iInvestimento,iCarteira:Integer;
                                    iCotaIni,PuCorrigido,wSaldoQtd:Double;sLote:string):Double;

      function AtualizaFluxoTitulo(iTipoOperacao,iInvestimento:Integer;dDataAtu:TDateTime;
                                   fPuAtualizado:Double):Boolean;

      function ExcluiAtuFluxoTitulo(dDataAtu:TDateTime;iInvestimento,iCarteira:Integer) : Boolean;

      //AL_68
      function GravaOperacaoRendaFixa(iIdOperRenFix,iIdInvestimento,iIdTipoOperacao,iIdCarteiraInvest,
                                      iIdCustodiante,iIdForCli,iIdMoeda,iIdPlanPrevCtbPatro,
                                      iIdUsuario,iIdOperRenFixAplic,iIdClasRisco,iCodDocumento,iPlnCodigo : integer;
                                      dDataOperacao,dDataVencOper,dDataEmissao,dDataLeilao, dDataLiquidacao : TDateTime;
                                      fPuOperacao,fPuEmissao,fVlrOperacao,fQtdOperacao,
                                      fTxBolsa,fTxOperacional,fPuMercado,fQtdCartHipo,fPercTransf : Double;
                                      sObservacao,sFlgOperImplant,sFlgCartHipo,sFlgRecalc,sFlgNegociacao,
                                      sBoleta : string;
                                      iIdOperRenFixOrig : Integer = -1): Boolean;

      function GravaOperRenFixXCurvas(iIdOperRenFix,iIdCurvaRenFix,iIdItemRenFix,iIdMoeda : integer;
                                      fVlrCurva,fPercCurva : Double): Boolean;

      //AL_68
      function GravaHistRenfix(iIdHistRenFix,iIdInvestimento,iIdOperRenFix,iIdOperRenFixAplic,iIdCarteiraInvest,
                               iIdTipoOperacao,iIdPlanPrevCtbPatro,iPlnCodigo,iCodDocumento : integer;
                               dDataHistRenFix : TDateTime;
                               fQtdHistRenFix,fSaldoQtdHistRenFix,fVlrHistRenFix,fSaldoVlrHistRenFix : Double;
                               sTipMov, sNaturMov, sHistorico : string;
                               bReprocessa: Boolean = False; iForCli: Integer = -1; iClasseTit: Integer = -1;
                               sFlgRecalc : String = '';
                               iIdOperRenFixOrig : Integer = -1): Boolean;

      //AL_17
      function GravaHistRenFixXItens(iIdHistRenFix,iIdCurvaRenFix,iIdItemRenFix,iIdRegraCalculo : integer;
                                     fPUItem,fPUAcuItem,fVlrItem,fVlrAcuItem : Double ): Boolean;

      function GravaPLNCODIGOHISTRENFIX(iIdHistRenFix: integer; var iPlanilha, iDocumento: integer):boolean;

      function GravaPlanDoc(sTipo: String;
                            iOper: integer;
                            iHist: integer;
                            var iPlanilha, iDocumento: integer;
                            var sMens: String;
                            bMensagem: Boolean = False):boolean;

      //AL_69
      function ContabilizaRendaFixa(fPUItem:Double;
                                   iPlano, iForCli,iUnidNegoc,iSubContaDeb, iSubContaCred,iPlanoPatro :integer;
                                   sHistorico, sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,sTipoPer,sRecPagNao : string;
                                   dDataProc : TDateTime;
                                   var iPlanilha : integer;
                                   iUsuarioOrigem: Integer = -1;
                                   iClasseTit : Integer = -1):boolean;

      procedure SelItemXOpeXInv(iInvestimento: Integer);

      procedure SelItemDaOperacao(iIdOperRenFix,iIdCurvaRenFix,iIdItemRenFix: Integer);

      //AL_83
      function BuscaSaldos(dDataSaldo: TDateTime;
                           iIdHistRenfix : integer;
                           iInvestimento: Integer = -1;
                           iOperacao: Integer = -1; iClasseTit: Integer = -1;
                           iTipoProc: Integer = 1; iOper: Boolean = False;iEmissor:integer=-1): Boolean;

      function BuscaSaldosAux(dDataSaldo: TDateTime;
                              iInvestimento: Integer = -1;
                              iOperacao: Integer = -1;
                              iTipoProc: Integer = 1;
                              iHistRenFix: Integer = 9999999): Boolean;

      //AL_89
      function BuscaSaldosPoup(dDataSaldo: TDateTime; iInvestimento: Integer = -1;
                               iOperacao: Integer = -1; iClassePoup: Integer = -1;
                               iClassePoupBloq: Integer = -1;
                               iTipoProc: Integer = 1;
                               bResg : Boolean = False): Boolean;

      //AL_14
      //AL_73
      function BuscaTotResgPoup(dDataini, dDatafim: TDateTime;
                                var fTotVlr, fTotQtd, fTotVlrTRC, fTotQtdTRC: double;
                                iInvestimento: Integer; sOper : string; iOperacao: Integer = -1): Boolean;

      function ExcluiIrLitigioRenFix(iOperRenFix:integer):boolean;

      function ExcluiContabilidadeRenFix(iPlanilha: Integer;
                                         bExclui: Boolean = True): Boolean;

      function ExcluiFinanceiroRenFix(iDocumento : integer) :boolean;

      function TestaFinanceiro(dDataProc : TDateTime;iOperacao: integer = -1): boolean;

      //AL_83
      //AL_103
      function ExcluiHistRenFix(dDataProc : TDateTime; bExcluiDiaAtual: Boolean;
                                iIDHistRenfix: Integer = -1;
                                iOperacaoAplic: Integer = -1;
                                iOperacao: Integer = -1;
                                iInvestimento: Integer = -1;
                                bExcluiOper: Boolean = True;
                                bResgate : Boolean = False;
                                fraFrame: TfraMensagem = nil;
                                bAlteraDataFech: Boolean = True;
                                bExcluiPlanilha: Boolean = True): Boolean;

      //AL_52
      function BuscaOperacao(iOperacao: Integer; iInvestimento : Integer = -1): Boolean;

// AL_28

      //AL_93
      //AL_103
      function CalculaItensAtu(iIdHistRenFix, iFlgGeraContab, iFlgGeraCapCar,iForCli, iTipoDoc:integer;
                               dDataProc, dDataVenc, dDataAniv: TDateTime; sNatOper,sDescOperacao,sHistorico: string;
                               var iPlanilha,iDocumento: Integer;
                               bReprocessa: Boolean = False;bPassoPasso : boolean = False): Boolean;

      //AL_93
      //AL_103
      function CalculaItensAtuPoup(iIdHistRenFix, iFlgGeraContab, iFlgGeraCapCar,iForCli, iTipoDoc : integer;
                                   fVlrUltAniv:Double;
                                   dDataProc, dDataVenc,dDataUltAniv,dDataTR: TDateTime;
                                   sNatOper,sDescOperacao,sHistorico: string;
                                   var iPlanilha,iDocumento: Integer;
                                   bReprocessa: Boolean = False;bPassoPasso : boolean = False): boolean;

      function AtuFinanceiroHist(iIdHistRenFix: Integer; fValor, fSaldo: Double): boolean;

      //AL_103 - Usa o objeto 3 CtrlInvContab
      function AbrePadrLancRF(iSegmentacao: integer; dDataProc: TDateTime; iEmpresaProp, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira,
                              iClasseTit, iItemRenFix: integer):integer;

      function BuscaPadrLancRF(iSegmentacao: Integer; dDataProc: TDateTime; iEmpresaProp, iTipoInvest, iTipoOperacao, iInvestimento,iCarteira, iClasseTit,
                        iItemRenFix : integer; fValor: double; var iPlano, iSubContaDeb,iSubContaCred,
                        iUnidNegoc: integer; var sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
                        sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper, sRecPagNao: string;
                        sTipoItem: String = ''): boolean;

      //AL_9
      //AL_66
      function IntegraContabCapCar(iIdHistRenFix,iInvestimento,iTipoOperacao,iCarteiraInvest,iClasseTit,iItemRenFix,
                                   iFlgGeraContab,iFlgGeraCapCar,iForCli,iTipoDoc,iPlanoPatro :integer;
                                   sCurvaContabil,sDescInvestimento, sHistorico : string;
                                   fValor,fEmolumentos,fCorretagem : Double;
                                   dDataProc,dDataVenc, dDataLiq : TDateTime;
                                   var iPlanilha,iDocumento:integer;
                                   iUsuarioOrigem: Integer = -1; sOper : string = ''; iCurvaRenfix : Integer = -1;
                                   flgContaInvest : Integer = 0;
                                   bFinalizaDoc: Boolean = False):boolean;

      //AL_9
      //AL_69
      function IntegraCapCarRendaFixa(fPUItem, fVlrOperacao : Double;
                  iForCli, iPlano, iTipoDoc,iUnidNegoc,iSubContaCred, iPlanilha,
                  //AL_60
                  iPlanoPatro : integer;
                  sRecPagNao,sTipoRecDes,sContaDeb, sContaCred,sCentroCustoCred,sDataLanc,sDataVenc,sCentroRespon,sHistorico : string;
                  var iDocumento : integer; iUsuarioOrigem: Integer = -1;
                  flgContaInvest : integer = 0;
                  iClasseTit : Integer = -1;
                  bFinalizaDoc: Boolean = False): boolean;

      //AL_9
      function LancaHistResgateRenFix(iOperacao,iFlgGeraContab,iFlgGeraCapCar,iTipoDoc,
                                      iIdHistRenFix, iIdForCli : integer;
                                      sDescOperacao, sHistorico : string;
                                      dDataProc, dDataAniv, dDataLiq:TDateTime;
                                      fEmolumentos,fCorretagem, fVlrOperacao : Double;
                                      var iPlanilha,iDocumento: Integer;
                                      fPUAtu: Double = 0;
                                      fLucPre: Double = 0;
                                      iUsuarioOrigem: Integer = -1;
                                      fraFrame: TfraMensagem = nil;
                                      sFlgRecalc : String = '';
                                      flgContaInvest : Integer = 0): Boolean;

      //AL_9
      //AL_66
      function LancaItensHistResgTot(iIdHistRenFix,iTipoOperacao,iFlgGeraContab,iFlgGeraCapCar, iForCli, iTipoDoc: Integer;
                                     dDataProc, dDataVenc, dDataLiq: TDateTime; sHistorico: String;
                                     fEmolumentos,fCorretagem, fVlrOperacao : Double;
                                     var iPlanilha, iDocumento: Integer;
                                     fPUAtu: Double = 0; fLucPre: Double = 0;
                                     iUsuarioOrigem: Integer = -1;
                                     fraFrame: TfraMensagem = nil;
                                     flgContaInvest : integer = 0): boolean;

      //AL_9
      //AL_66
      function LancaItensHistResgParcial(iIdHistRenFix,iTipoOperacao,iFlgGeraContab,
                                         iFlgGeraCapCar, iForCli, iTipoDoc: Integer;
                                         dDataProc, dDataVenc, dDataLiq: TDateTime; sHistorico: String;
                                         fEmolumentos,fCorretagem, fVlrOperacao : Double;
                                         var iPlanilha, iDocumento: Integer;
                                         fPUAtu: Double = 0; fLucPre: Double = 0;
                                         iUsuarioOrigem: Integer = -1;
                                         fraFrame: TfraMensagem = nil;
                                         flgContaInvest : integer = 0): boolean;

      //AL_100
      function FinalizaCapCar: Integer;

      function AlteraDataFechRF(dData: TDateTime): Boolean;

      function MontaHistorico(sNatOper, sSiglaOper, sDescOper, sDescInv: String): String;

      //AL_9
      function RefazOperacoes(iFlgGeraContab, iOper: Integer;dDataAniv:TDateTime;
                              fEmolumentos,fCorretagem : Double;
                              var iPlanilha, iDocumento : integer;
                              flgContaInvest : integer = 0): String;

      //AL_103
      function AtualizaRecalculo(dDataProc: TDateTime;
                                 Var iPlanilha, iDocumento, iIdHistRenFix: Integer): String;

      function BuscaUltimoAnivPoupanca(dDataAplic: TDateTime; iCarencia: Integer;
                                       dDataAtual: TDateTime; bResg: Boolean = False): TDateTime;

      function BuscaUltimoAniv(dDataAplic,dDataAtual, dDataLeilao: TDateTime): TDateTime;

      function BuscaFluxoPagtoJuros(iIdCurvaRenFix,iIdInvestimento,iIdItemRenfix:integer;dDataRef, dDataOper:TDateTime):boolean;

      function BuscaFluxoIncorpJuros(iIdCurvaRenFix,iIdInvestimento,iIdItemRenfix:integer;dDataRef, dDataOper:TDateTime):boolean;

      function BuscaFluxoAmortPrinc(iIdCurvaRenFix,iIdInvestimento,iIdItemRenfix:integer;dDataRef, dDataOper:TDateTime):boolean;

      function BuscaFluxoProvPerda(iIdCurvaRenFix, iIdInvestimento: Integer; dDataProc: TDateTime):Double;

      function VerificaFluxo(iIdInvestimento, iIdCurvaRenFix: Integer; dDataProc: TDateTime): Boolean;

      function BuscaUltimoTRPoupanca(dDataAplic: TDateTime; iCarencia: Integer;
                                     dDataAtual: TDateTime): TDateTime;

      function CurvaContabil(iInvestimento, iCurva: Integer): String;

      function CotaRenfix(iInvestimento, iCurva: Integer): Boolean;

      function FazContabilizacao(iFlgGeraContab, iInvestimento, iCurvaRenfix : Integer; sOper : string; fPuItem: Double = 1): Boolean;

      function ExisteCotacaoRF(iInvestimento: Integer; dDataCotacao, dDataVencimento: TDateTime;
                               var fCotRenFix:double): Boolean;

      function DiminuiValores(fValor1, fValor2: Double): Double;

      function FazIrLitigioTrimestral(dDataProc:TDateTime;
                                bDiaUtil,bOper:boolean;
                                sHistorico:String;
                                iIdPlanPrevCtbPatr,
                                iIdInvestimento,
                                iIdOperRenFix,
                                iIdHistRenFix : Integer;
                                fIR,fRend:Double):boolean;

      function ConvertePUValor(fPu, fPUAcu, fQtd, fPuEmi: Double;
                               sTipoItem: String; iClasseTit: Integer): Double;

      //AL_17
      function ConvertePUAcuValor(fPUAcu, fQtd, fPuEmi: Double;
                                  sTipoItem: String; iClasseTit: Integer): Double;

      //AL_103
      function ExcluiOpeAntecipada(dDataProc: TDateTime;
                                   iOperAplic, iInvestimento, iIdHistRenFix: Integer): Boolean;

      function GeraNumBoleta(dDataOper: TDateTime; iOperAplic: Integer;
                             sBoleta: String = ''): String;

      function RecalculaTransf(iOperacao: Integer): Boolean;

      function BuscaFluxosNoDia(iIdInvestimento,iIdOperAplic:Integer;dDataRef:String):Double;

      //AL_103
      function ExcluiATUeOPECotRenFix(dDataProc: String;
                                      iInvestimento: Integer = -1;
                                      iOperacaoAplic: Integer = -1): String;

      function BuscaVlrCotRenfix(dDataProc,dDataVenc:String;
                                 iInvestimento,iOperAplic : Integer;
                                 var fSldAntCotRenFix: Double):Double;

      function MarcadoReproc(iInvestimento, iOperAplic: Integer): Boolean;

      function MarcaInvRep(dDataRef: TDateTime;
                           iInvestimento: Integer = -1;
                           iOperAplic: Integer = -1;
                           iPlanPrev: Integer = -1;
                           iCarteira: Integer = -1;
                           fStatusFlag: String = 'S'): Integer;

      // AL_6 - Controle do processo de abertura
      function VerEmAbertura: Boolean;

      function GravaEmAbertura(sFlag: String = 'S'): Boolean;

      function VerificaDataPgJuros(dDataProc, dDataPagJur  : TDateTime;
                                   iTipoOper, iInvestimento, iOperAplic : Integer;
                                   bCotacao: Boolean): TDateTime;

      //AL_103
      function ContabilizaAtu(dDataProc: TdateTime;
                              sHistorico: String;
                              iIdHistRenFix,iFlgGeraContab,iFlgGeraCapCar, iForCli: Integer;
                              var iPlanilha, iDocumento: Integer): Boolean;

      //AL_43
      function BuscaValorIOF(dDataProc : TDateTime;
                             iIdOperAplic, iIdCurvaRenFix : Integer):Double;

      //AL_44
      function VerificaSeAtuDiaria(dDataProc, dDataAniv : TDateTime):boolean;

      // AL_51
      //AL_68
      function IncPriHistVenc(iOper:Integer = -1; dDataOper : TDateTime = 0; fraProg: TfraMensagem = nil): Boolean;

      // AL_53
      // AL_54
      function Repactuou(iOperAplic: Integer; dDataLimite: TDateTime = 0): Boolean;
      function BuscaVigencia(iOperAplic: Integer; dDataLimite: TDateTime = 0): TDateTime;
      //AL_68
      function SomaResgatesFuturos(dDataBase: TDateTime;
                                   iInvestimento, iOperacao, iOperAplic: Integer; fQtdLimite: Double): Boolean; OverLoad;
      function SomaResgatesFuturos(dDataBase: TDateTime;
                                   iInvestimento, iOperacao, iOperAplic: Integer): Double; Overload;

      //AL_70
      function BuscaHistOperNoDia(dDataBase: TDateTime;
                                  iInvestimento, iOperAplic: Integer) : boolean;

      //AL_71 - Ini
      function IncluiTransferencia(iPlanoOrigem, iPlanoDestino: Integer;
                                   fPercentual, fQtdDest, fVlrDest, fPUOper: Double;
                                   sObs: String; dDataOper : TDateTime;
                                   sBoleta: String = ''): Boolean;

      function ExcluiTransferencia(sBoleta: String; iOperAplic: Integer = -1): Boolean;
      //AL_71 - Fim

      //AL_72
      function ExisteTRCnoDia(iInvestimento, iOperAplic : Integer;
                              sDataRef : String):boolean;

      //AL_83
      function BuscaMaxIdHistTRCnoDia(sDataRef : String;
                                      iInvestimento, iOperAplic  : Integer): Integer;

      //AL_83
      function SomaQtdTRCnoDia(sDataRef : String;
                               iInvestimento, iOperAplic  : Integer): Double;

      //AL_83
      procedure BuscaDadosTRCnoDIa(sDataRef : String;
                                   iInvestimento, iOperAplic  : Integer;
                                   var iIdHistTrc : Integer;
                                   var SldVlr, SldQtd : Double);
      //AL_90
      function AtuEmiss(iInvestimento, iCurva: Integer): Boolean;

      //AL_103
      function ExecutaRegra(qryEntrada: TwwQuery; sItem: String; IdRegra: Integer = -1; bPassoaPasso: Boolean = False): Double;

      Function RetornaSegmentacaoRF(iInvestimento: integer; iIdHistRenFix:integer): integer; //Thiago Passos CGPC

   end;

var
  RendaFixa : TRendaFixa;
  // AL_65
  AtualizaProcFech: procedure(sMsg: String; iMaximo: Integer = -1);


implementation

uses
   DBaseDados, UDatabase, UAutorizacao, UMensErro, uOperacaoInvest, dFuncoesInvest,
   UOperComum, dRendaFixa, USistema, UBibliotecaInvest, UImpostos, dOperComum, uDocumento,
   FAguardeInv, UDiasUteisInv, uDiasUteis, uLancContab, Math;

function TRendaFixa.BuscaPUAtualizadoAnt(dDataAtu : TDateTime;iInvestimento: Integer):TRegBuscaPUAtualizadoAnt;
begin
   Result.PUAtualizado := 1;
   Result.PUInformado  := 1;
   //AL_103
   try
      OperComum.LimpaParametros(dtmFuncoesInvest.QryBuscaPUAtualizadoAnt);
      dtmFuncoesInvest.QryBuscaPUAtualizadoAnt.ParamByName('dDATAREF').AsString := DateToStr(dDataAtu);
      dtmFuncoesInvest.QryBuscaPUAtualizadoAnt.ParamByName('pIDINVESTIMENTO').AsInteger := iInvestimento;
      dtmFuncoesInvest.QryBuscaPUAtualizadoAnt.Open;
      if not dtmFuncoesInvest.QryBuscaPUAtualizadoAnt.IsEmpty then
      begin
         Result.PUAtualizado := dtmFuncoesInvest.QryBuscaPUAtualizadoAnt.FieldByName('PUATUALIZADO').AsFloat;
         Result.PUInformado  := dtmFuncoesInvest.QryBuscaPUAtualizadoAnt.FieldByName('PUINFORMADO').AsFloat;
         Result.PercAmort    := dtmFuncoesInvest.QryBuscaPUAtualizadoAnt.FieldByName('PERCAMORT').AsFloat;
         Result.DataIni      := dtmFuncoesInvest.QryBuscaPUAtualizadoAnt.FieldByName('DATA').AsDateTime;
      end;
   finally
      dtmFuncoesInvest.QryBuscaPUAtualizadoAnt.Close;
   end;
end;

function TRendaFixa.IncorporaJurosPrincipal(dDataAtu:TDateTime;iInvestimento:Integer;
                                            fPuCorrigido,fPUAtualizado,wSaldoQtd:Double):Double;
begin
   //AL_103
   Result := 0;
   try
      OperComum.LimpaParametros(dtmFuncoesInvest.QryBuscaPUIncJuros);
      dtmFuncoesInvest.QryBuscaPUIncJuros.ParamByName('dDATAREF').AsString := DateToStr(dDataAtu);
      dtmFuncoesInvest.QryBuscaPUIncJuros.ParamByName('pIDINVESTIMENTO').AsInteger := iInvestimento;
      dtmFuncoesInvest.QryBuscaPUIncJuros.Open;
      if not dtmFuncoesInvest.QryBuscaPUIncJuros.IsEmpty then
      begin
         fPUAtualizado := fPuCorrigido + ((fPUAtualizado - fPuCorrigido) *
                                         (OperComum.DivValorZero(dtmFuncoesInvest.QryBuscaPUIncJuros.FieldByName('PERCINCJUROS').AsFloat,100)));
         fPuAtualizado := StrToFloat(FormatFloat('#0.00',fPuAtualizado-0.0049));

         Result := (wSaldoQtd * fPuAtualizado) - (wSaldoQtd * fPuCorrigido);
         if Result <> 0 then // Atualiza FLUXOTITULO
         begin
            if not AtualizaFluxoTitulo(-19,iInvestimento,dDataAtu,fPuAtualizado) then
               Exit;
         end
      end;
   finally
      dtmFuncoesInvest.QryBuscaPUIncJuros.Close;
   end;
end;

function TRendaFixa.PagamentoJuros(dDataAtu:TDateTime;iInvestimento,iCarteira:Integer;
                                   iCotaIni,fPuCorrigido,fPuJuros,wSaldoQtd:Double;sLote:string;
                                   sTipoTitulo: String = ''):Double;
var
   fPuAtualizado : Double;
   sResult: String;
   iPos: Integer;
begin
   //AL_103
   Result := 0;
   try
      OperComum.LimpaParametros(dtmFuncoesInvest.QryBuscaPUPgJuros);
      dtmFuncoesInvest.QryBuscaPUPgJuros.ParamByName('dDATAREF').AsString := DateToStr(dDataAtu);
      dtmFuncoesInvest.QryBuscaPUPgJuros.ParamByName('pIDINVESTIMENTO').AsInteger := iInvestimento;
      dtmFuncoesInvest.QryBuscaPUPgJuros.Open;
      if not dtmFuncoesInvest.QryBuscaPUPgJuros.IsEmpty then
      begin
         if sTipoTitulo = 'NTN-C' then
         begin
            sResult := FormatFloat('#0.000000000',fPuCorrigido *
                             (1 + ((fPuJuros - 1 ) * OperComum.DivValorZero(dtmFuncoesInvest.QryBuscaPUPgJuros.FieldByName('PERCPGJUROS').AsFloat,100)))-0.00000000049);
            iPos := Pos(',',sResult);
            sResult := Copy(sResult,1,iPos + 6);
            fPuAtualizado := StrToFloat(sResult);
            Result := (wSaldoQtd * fPuAtualizado) - (wSaldoQtd * fPuCorrigido);
         end
         else if sTipoTitulo = 'REDE' then
         begin
            sResult := FormatFloat('#0.000000000',fPuCorrigido *
                             (1 + ((fPuJuros - 1 ) * OperComum.DivValorZero(dtmFuncoesInvest.QryBuscaPUPgJuros.FieldByName('PERCPGJUROS').AsFloat,100)))-0.00000000049);
            iPos := Pos(',',sResult);
            sResult := Copy(sResult,1,iPos + 2);
            fPuAtualizado := StrToFloat(sResult);
            Result := (wSaldoQtd * fPuAtualizado) - (wSaldoQtd * fPuCorrigido);
         end
         else
         begin
            fPuAtualizado := fPuCorrigido *
                             (1 + ((fPuJuros - 1 ) * OperComum.DivValorZero(dtmFuncoesInvest.QryBuscaPUPgJuros.FieldByName('PERCPGJUROS').AsFloat,100)));
            fPuAtualizado := StrToFloat(FormatFloat('#0.00000000',fPuAtualizado-0.0000000049));
            fPuAtualizado := StrToFloat(FormatFloat('#0.00000000',fPuAtualizado));
            Result := (wSaldoQtd * fPuAtualizado) - (wSaldoQtd * fPuCorrigido);
            Result := OperComum.Round(Result, 8);
         end;
      end;
   finally
      dtmFuncoesInvest.QryBuscaPUPgJuros.Close;
   end;
end;

function TRendaFixa.AmortizacaoPrincipal(dDataAtu:TDateTime;iInvestimento,iCarteira:Integer;
                                         iCotaIni,PuCorrigido,wSaldoQtd:Double;sLote:string):Double;
var
   fPUAtualizado,fPuAmortizacao: Double;
begin
   Result := 0;
   //AL_103
   try
      OperComum.LimpaParametros(dtmFuncoesInvest.QryBuscaPUAmort);
      dtmFuncoesInvest.QryBuscaPUAmort.ParamByName('dDATAREF').AsString := DateToStr(dDataAtu);
      dtmFuncoesInvest.QryBuscaPUAmort.ParamByName('pIDINVESTIMENTO').AsInteger := iInvestimento;
      dtmFuncoesInvest.QryBuscaPUAmort.Open;
      if not dtmFuncoesInvest.QryBuscaPUAmort.IsEmpty then
      begin
         fPUAtualizado := OperComum.DivValorZero(PUCorrigido,(1 - OperComum.DivValorZero(dtmFuncoesInvest.QryBuscaPUAmort.FieldByName('SUMPERCAMORT').AsFloat,100)));
         fPUAtualizado := StrToFloat(FormatFloat('#0.00',fPUAtualizado-0.0049));
         Result := wSaldoQtd *
                   StrToFloat(FormatFloat('#0.00',(fPUAtualizado * OperComum.DivValorZero(dtmFuncoesInvest.QryBuscaPUAmort.FieldByName('PERCAMORT').AsFloat,100)-0.0049)));
         fPuAmortizacao := fPUAtualizado * OperComum.DivValorZero(dtmFuncoesInvest.QryBuscaPUAmort.FieldByName('PERCAMORT').AsFloat,100);
         fPuAmortizacao := StrToFloat(FormatFloat('#0.00',fPuAmortizacao-0.0049));
         fPUAtualizado := PUCorrigido - fPuAmortizacao;
         fPUAtualizado := StrToFloat(FormatFloat('#0.00',fPUAtualizado));
         if Result <> 0 then
         begin
            if not AtualizaFluxoTitulo(-19,iInvestimento,dDataAtu,fPuAtualizado) then
            Exit;
         end
      end;
   finally
      dtmFuncoesInvest.QryBuscaPUAmort.Close;
   end;
end;

function TRendaFixa.AtualizaFluxoTitulo(iTipoOperacao,iInvestimento:Integer;dDataAtu:TDateTime;
                                        fPuAtualizado:Double):Boolean;
begin
   //AL_103
   Result := False;
   dtmFuncoesInvest.UpdFluxoTitulo.Close;
   dtmFuncoesInvest.UpdFluxoTitulo.ParamByName('dDataAtu').AsString := DateToStr(dDataAtu);
   dtmFuncoesInvest.UpdFluxoTitulo.ParamByName('pIDINVESTIMENTO').AsInteger := iInvestimento;
   dtmFuncoesInvest.UpdFluxoTitulo.ParamByName('pPUATUALIZADO').AsFloat := fPUAtualizado;
   dtmFuncoesInvest.UpdFluxoTitulo.ExecSQL;
   Result := True;
end;

function TRendaFixa.ExcluiAtuFluxoTitulo(dDataAtu:TDateTime;iInvestimento,iCarteira:Integer) : Boolean;
begin
   //AL_103
   try
      Result := False;
      // Exclui Registro se já houver lançamento
      OperComum.LimpaParametros(dtmFuncoesInvest.QrySelAtuFluxoTitulo);
      dtmFuncoesInvest.QrySelAtuFluxoTitulo.ParamByName('iCarteira').AsInteger     := iCarteira;
      dtmFuncoesInvest.QrySelAtuFluxoTitulo.ParamByName('iInvestimento').AsInteger := iInvestimento;
      dtmFuncoesInvest.QrySelAtuFluxoTitulo.ParamByName('DataProc').AsString       := DateToStr(dDataAtu);
      dtmFuncoesInvest.QrySelAtuFluxoTitulo.Open;
      if not dtmFuncoesInvest.QrySelAtuFluxoTitulo.IsEmpty then
         OperComum.ProcExclui(dtmFuncoesInvest.QrySelAtuFluxoTitulo.FieldByName('CODDOCUMENTO').AsInteger,
                              dtmFuncoesInvest.QrySelAtuFluxoTitulo.FieldByName('PLNCODIGO').AsInteger,
                              dtmFuncoesInvest.QrySelAtuFluxoTitulo.FieldByName('PLANO').AsInteger,
                              -1,dDataAtu,True, False);
      // HistCartinv - Limpa
      dtmFuncoesInvest.QryDelAtuFluxoTitulo.Close;
      dtmFuncoesInvest.QryDelAtuFluxoTitulo.ParamByName('iCarteira').AsInteger     := iCarteira;
      dtmFuncoesInvest.QryDelAtuFluxoTitulo.ParamByName('iInvestimento').AsInteger := iInvestimento;
      dtmFuncoesInvest.QryDelAtuFluxoTitulo.ParamByName('DataProc').AsString       := DateToStr(dDataAtu);
      dtmFuncoesInvest.QryDelAtuFluxoTitulo.ExecSQL;
      Result := True;
   finally
      dtmFuncoesInvest.QrySelAtuFluxoTitulo.Close;
   end;
end;

//AL_68
function TRendaFixa.GravaOperacaoRendaFixa(iIdOperRenFix,iIdInvestimento,iIdTipoOperacao,iIdCarteiraInvest,
                                           iIdCustodiante,iIdForCli,iIdMoeda,iIdPlanPrevCtbPatro,
                                           iIdUsuario,iIdOperRenFixAplic,iIdClasRisco,iCodDocumento,iPlnCodigo : integer;
                                           dDataOperacao,dDataVencOper,dDataEmissao,dDataLeilao, dDataLiquidacao : TDateTime;
                                           fPuOperacao,fPuEmissao,fVlrOperacao,fQtdOperacao,
                                           fTxBolsa,fTxOperacional,fPuMercado,fQtdCartHipo,fPercTransf : Double;
                                           sObservacao,sFlgOperImplant,sFlgCartHipo,sFlgRecalc,sFlgNegociacao,
                                           sBoleta : string;
                                           iIdOperRenFixOrig : Integer = -1): Boolean;
begin
   //AL_103
   Result := False;
   OperComum.LimpaParametros(DMRendaFixa.qryInsOperRenFix);

   DMRendaFixa.qryInsOperRenFix.ParamByName('IDOPERRENFIX').AsInteger      := iIdOperRenFix;
   DMRendaFixa.qryInsOperRenFix.ParamByName('IDINVESTIMENTO').AsInteger    := iIdInvestimento;
   DMRendaFixa.qryInsOperRenFix.ParamByName('IDTIPOOPERACAO').AsInteger    := iIdTipoOperacao;
   DMRendaFixa.qryInsOperRenFix.ParamByName('IDCARTEIRAINVEST').AsInteger  := iIdCarteiraInvest;
   DMRendaFixa.qryInsOperRenFix.ParamByName('IDCUSTODIANTE').AsInteger     := iIdCustodiante;
   DMRendaFixa.qryInsOperRenFix.ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanPrevCtbPatro;
   if dDataOperacao <> 0 then
      DMRendaFixa.qryInsOperRenFix.ParamByName('DATAOPERACAO').AsDateTime  := dDataOperacao;
   //AL_72
   if dDataVencOper <> 0 then
      DMRendaFixa.qryInsOperRenFix.ParamByName('VENCOPERACAO').AsDateTime  := dDataVencOper;
   DMRendaFixa.qryInsOperRenFix.ParamByName('PUOPERACAO').AsFloat          := fPuOperacao;
   DMRendaFixa.qryInsOperRenFix.ParamByName('PUEMISSAO').AsFloat           := fPuEmissao;
   DMRendaFixa.qryInsOperRenFix.ParamByName('VLROPERACAO').AsFloat         := fVlrOperacao;
   DMRendaFixa.qryInsOperRenFix.ParamByName('QTDEOPERACAO').AsFloat        := fQtdOperacao;
   DMRendaFixa.qryInsOperRenFix.ParamByName('OBSERVACAO').AsString         := sObservacao;
   DMRendaFixa.qryInsOperRenFix.ParamByName('IDTIPOINVEST').AsInteger      := 1;
   if dDataEmissao <> 0 then
      DMRendaFixa.qryInsOperRenFix.ParamByName('DATAEMISSAO').AsDateTime      := dDataEmissao;
   DMRendaFixa.qryInsOperRenFix.ParamByName('IDUSUARIO').AsInteger         := iIdUsuario;
   DMRendaFixa.qryInsOperRenFix.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iIdOperRenFixAplic;
   DMRendaFixa.qryInsOperRenFix.ParamByName('TXBOLSA').AsFloat             := fTxBolsa;
   DMRendaFixa.qryInsOperRenFix.ParamByName('TXOPERACIONAL').AsFloat       := fTxOperacional;
   DMRendaFixa.qryInsOperRenFix.ParamByName('FLGOPERIMPLANT').AsString     := sFlgOperImplant;
   if fPuMercado <> 0 then
      DMRendaFixa.qryInsOperRenFix.ParamByName('PUMERCADO').AsFloat           := fPuMercado;
   if dDataLeilao <> 0 then
      DMRendaFixa.qryInsOperRenFix.ParamByName('DATALEILAO').AsDateTime       := dDataLeilao;
   //AL_68
   if dDataLiquidacao <> 0 then
      DMRendaFixa.qryInsOperRenFix.ParamByName('DATALIQUIDACAO').AsDateTime       := dDataLiquidacao;

   DMRendaFixa.qryInsOperRenFix.ParamByName('FLGNEGOCIACAO').AsString      := sFlgNegociacao;
   DMRendaFixa.qryInsOperRenFix.ParamByName('BOLETA').AsString             := sBoleta;
   if iIdClasRisco <> 0 then
      DMRendaFixa.qryInsOperRenFix.ParamByName('IDCLASSRISCORENFIX').AsInteger:= iIdClasRisco;
   DMRendaFixa.qryInsOperRenFix.ParamByName('FLGCARTHIPO').AsString        := sFlgCartHipo;
   DMRendaFixa.qryInsOperRenFix.ParamByName('QTDCARTHIPO').AsFloat         := fQtdCartHipo;
   DMRendaFixa.qryInsOperRenFix.ParamByName('FLGRECALC').AsString          := sFlgRecalc;
   DMRendaFixa.qryInsOperRenFix.ParamByName('PERCTRANSF').AsFloat          := fPercTransf;
   if iCodDocumento <> -1 then
      DMRendaFixa.qryInsOperRenFix.ParamByName('CODDOCUMENTO').AsInteger   := iCodDocumento;
   if iPlnCodigo <> -1 then
      DMRendaFixa.qryInsOperRenFix.ParamByName('PLNCODIGO').AsInteger      := iPlnCodigo;
   if iIdForCli <> -1 then
      DMRendaFixa.qryInsOperRenFix.ParamByName('IDFORCLI').AsInteger       := iIdForCli;
   if iIdMoeda <> -1 then
      DMRendaFixa.qryInsOperRenFix.ParamByName('MOECODIGO').AsInteger      := iIdMoeda;
   //AL_68
   if iIdOperRenFixOrig <> -1 then
      DMRendaFixa.qryInsOperRenFix.ParamByName('IDOPERRENFIXORIG').AsInteger := iIdOperRenFixOrig;
   DMRendaFixa.qryInsOperRenFix.ExecSql;
   Result := True;
end;

function TRendaFixa.GravaOperRenFixXCurvas(iIdOperRenFix,iIdCurvaRenFix,iIdItemRenFix,iIdMoeda : integer;
                                           fVlrCurva,fPercCurva : Double): Boolean;
begin
   //AL_103
   Result := False;
   OperComum.LimpaParametros(DMRendaFixa.qryInsOperRenFixXCurvas, True);
   DMRendaFixa.qryInsOperRenFixXCurvas.ParamByName('IDOPERRENFIX').AsInteger   := iIdOperRenFix;
   DMRendaFixa.qryInsOperRenFixXCurvas.ParamByName('IDCURVARENFIX').AsInteger  := iIdCurvaRenFix;
   DMRendaFixa.qryInsOperRenFixXCurvas.ParamByName('IDITEMRENFIX').AsInteger   := iIdItemRenFix;
   DMRendaFixa.qryInsOperRenFixXCurvas.ParamByName('MOECODIGO').AsInteger      := iIdMoeda;
   if (iIdMoeda = -1) or (iIdMoeda = 0) then
      DMRendaFixa.qryInsOperRenFixXCurvas.ParamByName('MOECODIGO').Clear;
   DMRendaFixa.qryInsOperRenFixXCurvas.ParamByName('VLRCURVA').AsFloat         := fVlrCurva;
   DMRendaFixa.qryInsOperRenFixXCurvas.ParamByName('PERCCURVA').AsFloat        := fPercCurva;
   if not(DMRendaFixa.qryInsOperRenFixXCurvas.Prepared) then DMRendaFixa.qryInsOperRenFixXCurvas.Prepare;
   DMRendaFixa.qryInsOperRenFixXCurvas.ExecSql;
   Result := True;
end;

//AL_68
function TRendaFixa.GravaHistRenfix(iIdHistRenFix,iIdInvestimento,iIdOperRenFix,iIdOperRenFixAplic,iIdCarteiraInvest,
                                    iIdTipoOperacao,iIdPlanPrevCtbPatro,iPlnCodigo,iCodDocumento : integer;
                                    dDataHistRenFix : TDateTime;
                                    fQtdHistRenFix,fSaldoQtdHistRenFix,fVlrHistRenFix,fSaldoVlrHistRenFix : Double;
                                    sTipMov, sNaturMov, sHistorico : string;
                                    bReprocessa: Boolean = False; iForCli: Integer = -1; iClasseTit: Integer = -1;
                                    sFlgRecalc : String = '';
                                    iIdOperRenFixOrig : Integer = -1): Boolean;
begin
   //AL_103
   Result := False;
   if not bReprocessa then
   begin
      OperComum.LimpaParametros(DMRendaFixa.qryInsHistRenFix, True);
      DMRendaFixa.qryInsHistRenFix.ParamByName('IDHISTRENFIX').AsInteger       := iIdHistRenFix;
      DMRendaFixa.qryInsHistRenFix.ParamByName('IDINVESTIMENTO').AsInteger     := iIdInvestimento;
      DMRendaFixa.qryInsHistRenFix.ParamByName('IDOPERRENFIX').AsInteger       := iIdOperRenFix;
      DMRendaFixa.qryInsHistRenFix.ParamByName('IDOPERRENFIXAPLIC').AsInteger  := iIdOperRenFixAplic;
      DMRendaFixa.qryInsHistRenFix.ParamByName('IDCARTEIRAINVEST').AsInteger   := iIdCarteiraInvest;
      DMRendaFixa.qryInsHistRenFix.ParamByName('IDTIPOOPERACAO').AsInteger     := iIdTipoOperacao;
      DMRendaFixa.qryInsHistRenFix.ParamByName('IDPLANPREVCTBPATR').AsInteger  := iIdPlanPrevCtbPatro;
      if iPlnCodigo <> -1 then
         DMRendaFixa.qryInsHistRenFix.ParamByName('PLNCODIGO').AsInteger          := iPlnCodigo;
      if iCodDocumento <> -1 then
         DMRendaFixa.qryInsHistRenFix.ParamByName('CODDOCUMENTO').AsInteger       := iCodDocumento;
      DMRendaFixa.qryInsHistRenFix.ParamByName('IDMODULO').AsInteger           := Sistema.IdModulo;
      DMRendaFixa.qryInsHistRenFix.ParamByName('IDEMPRESAPROP').AsInteger      := Sistema.IdEmpresa;
      DMRendaFixa.qryInsHistRenFix.ParamByName('DATAHISTRENFIX').AsDateTime    := dDataHistRenFix;
      DMRendaFixa.qryInsHistRenFix.ParamByName('QTDHISTRENFIX').AsFloat        := fQtdHistRenFix;
      DMRendaFixa.qryInsHistRenFix.ParamByName('VLRHISTRENFIX').AsFloat        := fVlrHistRenFix;      //Criar
      DMRendaFixa.qryInsHistRenFix.ParamByName('SALDOVLRHISTRENFI').AsFloat    := fSaldoVlrHistRenFix; //Criar
      DMRendaFixa.qryInsHistRenFix.ParamByName('SALDOQTDHISTRENFI').AsFloat    := fSaldoQtdHistRenFix;
      DMRendaFixa.qryInsHistRenFix.ParamByName('TIPMOVHISTRENFIX').AsString    := sTipMov;
      DMRendaFixa.qryInsHistRenFix.ParamByName('NATURMOVHISTRENFI').AsString   := sNaturMov;
      DMRendaFixa.qryInsHistRenFix.ParamByName('HISTMOVRENFIX').AsString       := sHistorico;
      if sFlgRecalc <> '' then
         DMRendaFixa.qryInsHistRenFix.ParamByName('FLGRECALC').AsString        := sFlgRecalc;
      //AL_68
      if iIdOperRenFixOrig > 0 then
         DMRendaFixa.qryInsHistRenFix.ParamByName('IDOPERRENFIXORIG').AsInteger := iIdOperRenFixOrig;
      DMRendaFixa.qryInsHistRenFix.ExecSql;
      //OperComum.LimpaParametros(DMRendaFixa.qryInsHistRenFix);
   end
   else
   begin
      DMRendaFixa.qryTempHistCalc.Insert;

      DMRendaFixa.qryTempHistCalc.FieldByName('IDHISTRENFIX').AsInteger       := iIdHistRenFix;
      DMRendaFixa.qryTempHistCalc.FieldByName('IDINVESTIMENTO').AsInteger     := iIdInvestimento;
      DMRendaFixa.qryTempHistCalc.FieldByName('IDOPERRENFIX').AsInteger       := iIdOperRenFix;
      DMRendaFixa.qryTempHistCalc.FieldByName('IDOPERRENFIXAPLIC').AsInteger  := iIdOperRenFixAplic;
      DMRendaFixa.qryTempHistCalc.FieldByName('IDCARTEIRAINVEST').AsInteger   := iIdCarteiraInvest;
      DMRendaFixa.qryTempHistCalc.FieldByName('IDTIPOOPERACAO').AsInteger     := iIdTipoOperacao;
      DMRendaFixa.qryTempHistCalc.FieldByName('IDPLANPREVCTBPATR').AsInteger  := iIdPlanPrevCtbPatro;
      DMRendaFixa.qryTempHistCalc.FieldByName('PLNCODIGO').AsInteger          := iPlnCodigo;
      DMRendaFixa.qryTempHistCalc.FieldByName('CODDOCUMENTO').AsInteger       := iCodDocumento;
      DMRendaFixa.qryTempHistCalc.FieldByName('QTDHISTRENFIX').AsFloat        := fQtdHistRenFix;
      DMRendaFixa.qryTempHistCalc.FieldByName('VLRHISTRENFIX').AsFloat        := fVlrHistRenFix;
      DMRendaFixa.qryTempHistCalc.FieldByName('SALDOVLRHISTRENFI').AsFloat    := fSaldoVlrHistRenFix;
      DMRendaFixa.qryTempHistCalc.FieldByName('SALDOQTDHISTRENFI').AsFloat    := fSaldoQtdHistRenFix;
      DMRendaFixa.qryTempHistCalc.FieldByName('NATURMOVHISTRENFI').AsString   := sNaturMov;
      DMRendaFixa.qryTempHistCalc.FieldByName('HISTMOVRENFIX').AsString       := sHistorico;
      DMRendaFixa.qryTempHistCalc.FieldByName('IFORCLI').AsInteger            := iForCli;
      DMRendaFixa.qryTempHistCalc.FieldByName('IDCLASSETIT').AsInteger        := iClasseTit;
      //AL_68
      DMRendaFixa.qryTempHistCalc.FieldByName('IDOPERRENFIXORIG').AsInteger   := iIdOperRenFixOrig;

      DMRendaFixa.qryTempHistCalc.Post;
   end;
   Result := True;
end;

//AL_17
function TRendaFixa.GravaHistRenFixXItens(iIdHistRenFix,iIdCurvaRenFix,iIdItemRenFix,iIdRegraCalculo : integer;
                                          fPUItem,fPUAcuItem,fVlrItem,fVlrAcuItem : Double ): Boolean;
begin
   //AL_103
   Result := False;
   // AL_18 - 28/03/2005
   OperComum.LimpaParametros(DMRendaFixa.qryInsHistRenFixXItens);
   DMRendaFixa.qryInsHistRenFixXItens.ParamByName('IDHISTRENFIX').AsInteger       := iIdHistRenFix;
   DMRendaFixa.qryInsHistRenFixXItens.ParamByName('IDCURVARENFIX').AsInteger      := iIdCurvaRenFix;
   DMRendaFixa.qryInsHistRenFixXItens.ParamByName('IDITEMRENFIX').AsInteger       := iIdItemRenFix;
   DMRendaFixa.qryInsHistRenFixXItens.ParamByName('PUITEM').AsFloat               := fPUItem;
   DMRendaFixa.qryInsHistRenFixXItens.ParamByName('PUACUITEM').AsFloat            := fPUAcuItem;
   if iIdRegraCalculo <> 0   then
   begin
      DMRendaFixa.qryInsHistRenFixXItens.ParamByName('VLRITEM').AsFloat           := fVlrItem;
      DMRendaFixa.qryInsHistRenFixXItens.ParamByName('VLRACUITEM').AsFloat        := fVlrAcuItem;
      DMRendaFixa.qryInsHistRenFixXItens.ParamByName('IDREGRACALCULO').AsInteger  := iIdRegraCalculo;
   end;
   DMRendaFixa.qryInsHistRenFixXItens.ExecSql;
   Result := True;
end;

function TRendaFixa.GravaPLNCODIGOHISTRENFIX(iIdHistRenFix:integer; var iPlanilha,iDocumento:integer):boolean;
begin
   //AL_103
   Result := False;
   OperComum.LimpaParametros(DMRendaFixa.qryUpdHistRenFix, True);
   DMRendaFixa.qryUpdHistRenFix.ParamByName('IDHISTRENFIX').AsInteger  := iIdHistRenFix;
   if iPlanilha <> -1 then
      DMRendaFixa.qryUpdHistRenFix.ParamByName('PLNCODIGO').AsInteger     := iPlanilha;
   if iDocumento <> -1 then
      DMRendaFixa.qryUpdHistRenFix.ParamByName('CODDOCUMENTO').AsInteger  := iDocumento
   else
      DMRendaFixa.qryUpdHistRenFix.ParamByName('CODDOCUMENTO').Clear;
   DMRendaFixa.qryUpdHistRenFix.ExecSql;
   Result := True;
end;

{ --------------------------------------------------------
  Grava o PLNCODIGO e o CODDOCUMENTO nas tabelas destino
  iTipo:      'ATU' -> Tabela de Histórico HISTRENFIX
              'OPE' -> Tabela de Operações OPERRENFIX
  iChave:     ID da tabela que será atualizada
  iPlanilha:  ID da Planilha
  iDocumento: ID do Documento
----------------------------------------------------------}
function TRendaFixa.GravaPlanDoc(sTipo: String;
                                 iOper: integer;
                                 iHist: integer;
                                 var iPlanilha, iDocumento: integer;
                                 var sMens: String;
                                 bMensagem: Boolean = False):boolean;
var bErro: Boolean;
begin
   Result := True;
   bErro  := False;
   //AL_103
   Try         //SOL 123412 Kintana 628716 Thiago Passos
      if CtrlInvContab.Documento.DocumentoPendente then
         iDocumento:=FinalizaCapCar;
      if sTipo = 'ATU' then
      begin
         // Grava PLANILHA e DOCUMENTO na HistRenFix
         sMens := 'no Histórico ' + IntToStr(iHist) + ' ' ;
         OperComum.LimpaParametros(DMRendaFixa.qryUpdHistRenFix, True);
         DMRendaFixa.qryUpdHistRenFix.ParamByName('IDHISTRENFIX').AsInteger  := iHist;
         if iPlanilha <> -1 then
            DMRendaFixa.qryUpdHistRenFix.ParamByName('PLNCODIGO').AsInteger     := iPlanilha;
         if iDocumento <> -1 then
            DMRendaFixa.qryUpdHistRenFix.ParamByName('CODDOCUMENTO').AsInteger  := iDocumento;
         DMRendaFixa.qryUpdHistRenFix.ExecSql;
      end
      else
      if (sTipo = 'OPE') or (sTipo = 'TRC')  then
      begin
        // Grava PLANILHA e DOCUMENTO na OperRenFix
         sMens := 'na Operação ' + IntToStr(iOper) + ' ' ;
         OperComum.LimpaParametros(DMRendaFixa.qryUpdOperRenFix, True);
         DMRendaFixa.qryUpdOperRenFix.ParamByName('IDOPERRENFIX').AsInteger  := iOper;
         if iPlanilha <> -1 then
            DMRendaFixa.qryUpdOperRenFix.ParamByName('PLNCODIGO').AsInteger     := iPlanilha;
         if iDocumento <> -1 then
            DMRendaFixa.qryUpdOperRenFix.ParamByName('CODDOCUMENTO').AsInteger  := iDocumento;
         DMRendaFixa.qryUpdOperRenFix.ExecSql;
      end
      else
         Raise Exception.Create(#13 + 'O Tipo de Operação Não Foi Determinado: ' + sTipo);
   except
      on E: Exception do
      begin
         Result := False;
         if bMensagem then
         begin
            MsgDlg('Não foi Possível Atualizar a Planilha ou o Documento ' + sMens + #13 +
                   E.Message + #13 +
                   'Planilha : ' + IntToStr(iPlanilha) + #13 +
                   'Documento: ' + IntToStr(iDocumento),
                   'Mensagem do Sistema ',mtError,[mbOK],0);
         end;
      end;
   end;
end;

//AL_69
function TRendaFixa.ContabilizaRendaFixa(fPUItem:Double;
                                         iPlano, iForCli,iUnidNegoc,iSubContaDeb, iSubContaCred,iPlanoPatro :integer;
                                         sHistorico, sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,sTipoPer,
                                         sRecPagNao : string;
                                         dDataProc : TDateTime;
                                         var iPlanilha : integer;
                                         iUsuarioOrigem: Integer = -1;
                                         iClasseTit : Integer = -1):boolean;
var
   sMensErro : string;
   bMostraMsg : boolean;
   //AL_22
   //AL_80
   wQryAux, WQryAux1 : TwwQuery;
begin
   Result := True;
   bMostraMsg := False;

   //AL_85
   //AL_103
   if CtrlPInv.IntFinContabRF = 'N' then Exit;

   if iPlanilha < 0 then
      iPlanilha := 0;

   // AL_21
   try // finally

      //AL_22
      wQryAux := TwwQuery.Create(Application);
      wQryAux.DatabaseName := 'BaseDados';
      //AL_80
      wQryAux1 := TwwQuery.Create(Application);
      wQryAux1.DatabaseName := 'BaseDados';

      // AL_38 - Inicio
      Result := False;
      //AL_69
      if not CtrlInvContab.TestaPeriodo(DateToStr(dDataProc), 1, -1, iClasseTit) then
         Raise Exception.Create(CtrlInvContab.MessageInfo);

      // Monta o Histórico contábil com o plano e patrocinadora
      //AL_22
      wQryAux.Close;
      wQryAux.SQL.Clear;
      wQryAux.SQL.Add('SELECT PL.NOME AS PLANO,PE.NOME AS PATRO, PA.IDPATRO, PA.IDPLANOPREV ');
      wQryAux.SQL.Add('FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL ');
      wQryAux.SQL.Add('WHERE (PA.IDPLANPREVCTBPATR = '''+IntToStr(iPlanoPatro)+''') ');
      wQryAux.SQL.Add('  AND (PA.IDPATRO = PE.IDPESSOA) ');
      wQryAux.SQL.Add('  AND (PA.IDPLANOPREV = PL.IDPLANOPREV)');
      wQryAux.Open;

      sHistorico := sHistorico + ' - ' + wQryAux.FieldByName('PLANO').AsString+' - ' + wQryAux.FieldByName('PATRO').AsString;

      //AL_76
      //AL_103
      if CtrlPInv.FlgContabDiaUtil = 'S' then
      begin
         if DiasUteisInv.DiaUtil(dDataProc,-1,1,'',True,False,False) = False then
            dDataProc := DiasUteisInv.PrimeiroDiaUtilPosterior(dDataProc,-1,1,'',True,False,False);
      end;

      //AL_80
      if iPlanilha <> -1 then
      begin
         FazQuery(wQryAux1,'SELECT PLANILHA.PLNDATDIA FROM PLANILHA WHERE PLANILHA.PLNCODIGO = ' + IntToStr(iPlanilha) +'');
         if wQryAux1.FieldByName('PLNDATDIA').AsDateTime <> dDataProc then
            iPlanilha := 0;
      end;

      if not(OperComum.LancamentoContabil(Sistema.IdEmpresa, Sistema.IdModulo, iPlano, iSubContaDeb,
             iSubContaCred, iUnidNegoc, iForCli,
             wQryAux.FieldByName('IDPLANOPREV').AsInteger,
             wQryAux.FieldByName('IDPATRO').AsInteger,
             sContaDeb, sContaCred, sCentroCustoDeb,
             sCentroCustoCred, sHistorico, sTipoPer, sRecPagNao, dDataProc, ABS(fPUItem),
             bMostraMsg, iPlanilha, sMensErro, iUsuarioOrigem) ) then
         Raise Exception.Create(sMensErro);

      Result := True;

      // AL_38 - Fim
   finally
      //AL_22
      //AL_80
      //AL_103
      wQryAux.Close;
      wQryAux1.Close;
      FreeAndNil(wQryAux);
      FreeAndNil(wQryAux1);
      //AL_103 - Fim
   end;
end;

procedure TRendaFixa.SelItemXOpeXInv(iInvestimento: Integer);
begin
   DMRendaFixa.qrySelItemXOpeXInv.Close;
   DMRendaFixa.qrySelItemXOpeXInv.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
   DMRendaFixa.qrySelItemXOpeXInv.Open;
end;

procedure TRendaFixa.SelItemDaOperacao(iIdOperRenFix, iIdCurvaRenFix, iIdItemRenFix: Integer);
begin
   DMRendaFixa.qrySelOperRenFixXCurvas.Close;
   DMRendaFixa.qrySelOperRenFixXCurvas.ParamByName('IDOPERRENFIX').AsInteger := iIdOperRenFix;
   DMRendaFixa.qrySelOperRenFixXCurvas.ParamByName('IDCURVARENFIX').AsInteger := iIdCurvaRenFix;
   DMRendaFixa.qrySelOperRenFixXCurvas.ParamByName('IDITEMRENFIX').AsInteger := iIdItemRenFix;
   DMRendaFixa.qrySelOperRenFixXCurvas.Open;
end;

//AL_83
function TRendaFixa.BuscaSaldos(dDataSaldo: TDateTime;
                                iIdHistRenfix : integer;
                                iInvestimento: Integer = -1;
                                iOperacao: Integer = -1; iClasseTit: Integer = -1;
                                iTipoProc: Integer = 1; iOper: Boolean = False;iEmissor:integer=-1): Boolean;
begin
   //AL_103
   Result := False;
   //AL_93 - Ini
   OperComum.LimpaParametros(DMRendaFixa.qryBuscaSaldosHist);
   DMRendaFixa.qryBuscaSaldosHist.SQL.Clear;
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('SELECT ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   HR.IDHISTRENFIX,HR.IDEMPRESAPROP,HR.IDMODULO,HR.IDPLANPREVCTBPATR,HR.PLNCODIGO, ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   HR.CODDOCUMENTO,HR.IDTIPOINVEST,HR.IDTIPOOPERACAO,HR.IDCARTEIRAINVEST, ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   HR.IDOPERRENFIXAPLIC,HR.IDOPERRENFIX,HR.IDINVESTIMENTO,HR.DATAHISTRENFIX,HR.VLRHISTRENFIX, ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   HR.QTDHISTRENFIX,HR.SALDOVLRHISTRENFI,HR.SALDOQTDHISTRENFI,HR.TIPMOVHISRENFIX, ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   HR.NATURMOVHISTRENFI,HR.HISTMOVRENFIX,IV.DESCINVESTIMENTO, IV.IDCLASSETIT, IV.CARENCIA, ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   EM.SIGLAEMISSOR, CL.DESCCLASSETIT, HR.IDOPERRENFIXORIG, CL.FLGUSAQTD  ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('FROM  HISTRENFIX HR, INVESTIMENTO IV, EMISSOR EM, CLASSETITRENFIX CL ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('WHERE (HR.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('  AND IV.IDEMISSOR '+ OperComum.IIF(iEmissor > 0, ' = '+ IntToStr(iEmissor), 'IS NOT NULL'));
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('  AND HR.IDINVESTIMENTO ' + OperComum.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NOT NULL'));
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('  AND HR.IDOPERRENFIXAPLIC ' + OperComum.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NOT NULL'));
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('  AND (HR.IDHISTRENFIX IN ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('          (SELECT MAX(H1.IDHISTRENFIX) ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('           FROM HISTRENFIX H1 ');

   DMRendaFixa.qryBuscaSaldosHist.SQL.Add(   OperComum.IIF( (iEmissor + iClasseTit) > 0, ', INVESTIMENTO IV1', ' ') ); //Thiago Passos Kintana 609813 SOL 122886

   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('           WHERE (H1.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('             AND H1.IDINVESTIMENTO ' + OperComum.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NOT NULL'));
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add(   OperComum.IIF( (iEmissor + iClasseTit) > 0, ' AND H1.IDINVESTIMENTO = IV1.IDINVESTIMENTO', ' '));//Thiago Passos Kintana 609813 SOL 122886
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add(   OperComum.IIF(iEmissor > 0,'  AND IV1.IDEMISSOR ='+ IntToStr(iEmissor)+'', ' ') );//Thiago Passos Kintana 609813 SOL 122886
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add(   OperComum.IIF(iClasseTit > 0,'  AND IV1.IDCLASSETIT ='+ IntToStr(iClasseTit)+'', ' ') );//Thiago Passos Kintana 609813 SOL 122886

   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('             AND H1.IDOPERRENFIXAPLIC ' + OperComum.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NOT NULL'));
   if iIdHistRenfix > 0 then
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('             AND (H1.IDHISTRENFIX <= ' + IntToStr(iIdHistRenfix) + ') ');
   if iTipoProc in [0,2] then
   begin
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('             AND (H1.TIPMOVHISRENFIX = ''OPE'') ');
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('             AND (H1.IDTIPOOPERACAO NOT IN (-166,-167)) ');
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('             AND (H1.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   end
   else if iTipoProc = 3 then
   begin
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('             AND (H1.TIPMOVHISRENFIX = ''TRC'') ');
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('             AND (H1.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   end;
   if not iOper then
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('              AND (H1.IDTIPOOPERACAO NOT IN (-17,-18,-19)) ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('              AND ((H1.DATAHISTRENFIX || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('                       (SELECT MAX(H2.DATAHISTRENFIX) || H2.IDINVESTIMENTO || H2.IDOPERRENFIXAPLIC ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('                        FROM HISTRENFIX H2 ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add(   OperComum.IIF( (iEmissor + iClasseTit) > 0, ', INVESTIMENTO IV2', ' ') );//Thiago Passos Kintana 609813 SOL 122886
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('                        WHERE (H2.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('                          AND H2.IDINVESTIMENTO ' + OperComum.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NOT NULL'));

   DMRendaFixa.qryBuscaSaldosHist.SQL.Add(   OperComum.IIF( (iEmissor + iClasseTit) > 0, ' AND H2.IDINVESTIMENTO = IV2.IDINVESTIMENTO', ' '));//Thiago Passos Kintana 609813 SOL 122886

   DMRendaFixa.qryBuscaSaldosHist.SQL.Add(   OperComum.IIF(iEmissor > 0,'  AND IV2.IDEMISSOR ='+ IntToStr(iEmissor)+'', ' ') );//Thiago Passos Kintana 609813 SOL 122886
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add(   OperComum.IIF(iClasseTit > 0,'  AND IV2.IDCLASSETIT ='+ IntToStr(iClasseTit)+'', ' ') );//Thiago Passos Kintana 609813 SOL 122886

   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('                          AND H2.IDOPERRENFIXAPLIC ' + OperComum.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NOT NULL'));

   if iTipoProc in [0,2] then
   begin
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('                          AND (H2.TIPMOVHISRENFIX = ''OPE'') ');
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('                          AND (H2.IDTIPOOPERACAO NOT IN (-166,-167)) ');
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('                          AND (H2.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   end
   else if iTipoProc = 3 then
   begin
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('                          AND (H2.TIPMOVHISRENFIX = ''TRC'') ');
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('                          AND (H2.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   end;
   if not iOper then
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('                          AND (H2.IDTIPOOPERACAO NOT IN (-17,-18,-19)) ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('                        GROUP BY H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC)) ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('            GROUP BY H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC)) ');

   if iClasseTit > 0 then
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('  AND IV.IDCLASSETIT  = '+ IntToStr(iClasseTit));

   if iTipoProc in [0,2] then
   begin
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   AND (HR.TIPMOVHISRENFIX = ''OPE'') ');
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   AND (HR.IDTIPOOPERACAO NOT IN (-166,-167)) ');
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   AND (HR.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   end
   else if iTipoProc = 3 then
   begin
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   AND (HR.TIPMOVHISRENFIX = ''TRC'') ');
      DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   AND (HR.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   end;
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   AND (HR.SALDOQTDHISTRENFI > 0) ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   AND (IV.IDTIPOINVEST = 1)  ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO) ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   AND (IV.IDEMISSOR = EM.IDEMISSOR) ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add('   AND (IV.IDCLASSETIT = CL.IDCLASSETIT) ');
   DMRendaFixa.qryBuscaSaldosHist.SQL.Add(' ORDER BY DESCCLASSETIT, DESCINVESTIMENTO');
   DMRendaFixa.qryBuscaSaldosHist.Open;
   //AL_93 - Fim

   DMRendaFixa.qryBuscaSaldosItems.Close;
   DMRendaFixa.qryBuscaSaldosItems.ParamByName('IDHISTRENFIX').AsInteger :=
                   DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDHISTRENFIX').AsInteger;
   DMRendaFixa.qryBuscaSaldosItems.Open;

   DMRendaFixa.qryBuscaSaldosOper.Close;
   DMRendaFixa.qryBuscaSaldosOper.ParamByName('IDOPERRENFIX').AsInteger :=
                      DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
   DMRendaFixa.qryBuscaSaldosOper.Open;

   DMRendaFixa.qryBuscaSaldosItemsOper.Close;
   DMRendaFixa.qryBuscaSaldosItemsOper.ParamByName('IDOPERRENFIX').AsInteger :=
                           DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
   DMRendaFixa.qryBuscaSaldosItemsOper.Open;
   Result := True;
end;

function TRendaFixa.ExcluiIrLitigioRenFix(iOperRenFix:integer):boolean;
begin
   //AL_103
   Result := False;
   OperComum.LimpaParametros(DMRendaFixa.QryIrLitigio, True);
   DMRendaFixa.QryIrLitigio.ParamByName('IDOPERRENFIX').AsInteger := iOperRenFix;
   DMRendaFixa.QryIrLitigio.ExecSQL;
   Result := True;
end;

function TRendaFixa.ExcluiContabilidadeRenFix(iPlanilha: Integer;
                                              bExclui: Boolean = True): Boolean;
begin
   //AL_103 - Ini
   Result := False;
   // Não Exclui caso o sistema esteja em implantação
   //Não Exclui caso o sistema não Integre com o Contábil
   //AL_84
   //AL_85
   if (CtrlPInv.FlgImplantaRF = 'S') or
      (CtrlPInv.IntFinContabRF = 'N') then
   begin
      Result := True;
      Exit;
   end;

   bExclui := False;

   //AL_21
   //AL_22
   //AL_79
   //AL_86
   if not CtrlInvContab.InvExcluiLanc(iPlanilha, 0, Sistema.UsaPlanoPatro, bExclui) then
      Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' + IntToStr(iPlanilha) + #13 +
                             'Mensagem: ' + CtrlInvContab.MessageInfo);
   Result := True;
   //AL_103 - Fim
end;

function TRendaFixa.ExcluiFinanceiroRenFix(iDocumento : integer) :boolean;
begin
   //AL_103 - Ini
   Result := False;

   //AL_84
   // Não Exclui caso o sistema não Integre com o Contábil
   if CtrlPInv.FlgIntCapCar = 'N' then
   begin
      Result := True;
      Exit;
   end;

   if not CtrlInvContab.Documento.Delete(iDocumento) then
      Raise Exception.Create('Ocorreu um problema na exclusão dos lançamentos Financeiros' + #13 +
                             'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);
   Result := True;
   //AL_103 - Fim
end;

function TRendaFixa.TestaFinanceiro(dDataProc : TDateTime; iOperacao : integer = -1):boolean;
begin
   //AL_103 - Ini
   try
      Result := False;
      OperComum.LimpaParametros(DMRendaFixa.qryProcuraResgatesNoDia);
      DMRendaFixa.qryProcuraResgatesNoDia.ParamByName('dDataProc').AsString := DateToStr(dDataProc);
      if iOperacao > 0 then
         DMRendaFixa.qryProcuraResgatesNoDia.ParamByName('IDOPERRENFIX').AsInteger := iOperacao;
      DMRendaFixa.qryProcuraResgatesNoDia.Open;
      while not DMRendaFixa.qryProcuraResgatesNoDia.Eof do
      begin
         // Verifica se pode excluir do financeiro
         if DMRendaFixa.qryProcuraResgatesNoDia.FieldByName('STATUS').AsString = '5' then  // Documento baixado
            Raise Exception.Create('Existem operações baixadas pelo Financeiro que precisam ser excluidas primeiro' + #13 +
                                   'Data :' + DateToStr(dDataProc));
         DMRendaFixa.qryProcuraResgatesNoDia.Next;
      end;
      Result := True;
   finally
      DMRendaFixa.qryProcuraResgatesNoDia.Close;
   end;
   //AL_103 - Fim
end;

{--------------------------------------------------------------------------------------------
 Ação: Exclui Movimentação - Histórico, Itens de Histórico e Operações
 Parametros: dDataProc - Seleciona movimentação desta data para frente
             bExcluiDiaAtual   - Se exclui o próprio dia dDataProc
             iIDHistRenfix(-1) - Seleciona somente este registro de Histórico
             iOperaçãoAplic(-1)- Seleciona Registros desta Operação de Aplicação
             iOperação(-1)     - Seleciona somente esta Operação
             iInvestimento(-1) - Seleciona somente este Investimento
             bExcluiOper(True) - Se exclui a operação IDOPERRENFIX caso seja um registro OPE
             bResgate(False)   - Se é exclusão de Resgate
             prbProgresso      - Barra de Progresso opcional
             lblMensagem       - Label de Mensagem opcional
             fraFrame          - Frame de Mensagem e progresso opcional
             bAlteraDataFech   - Altera a Data de fechamento do Sistema
             bExcluiPlanilha   - Exclui a planilha contabil
 Retorna: True - exclusão efetuada com sucesso
          False - Ocorreu um erro na exclusão
---------------------------------------------------------------------------------------------}
//AL_83
//AL_103
function TRendaFixa.ExcluiHistRenFix(dDataProc: TDateTime;
                                     bExcluiDiaAtual: Boolean;
                                     iIDHistRenfix: Integer = -1;
                                     iOperacaoAplic: Integer = -1;
                                     iOperacao: Integer = -1;
                                     iInvestimento: Integer = -1;
                                     bExcluiOper: Boolean = True;
                                     bResgate : Boolean = False;
                                     fraFrame: TfraMensagem = nil;
                                     bAlteraDataFech: Boolean = True;
                                     bExcluiPlanilha: Boolean = True): Boolean;
var bComita: Boolean;
   //AL_22
   wQryAux : TwwQuery;
   //AL_72
   wQryAux2 : TwwQuery;
begin
   try
      //AL_22
      wQryAux := TwwQuery.Create(Application);
      wQryAux.DatabaseName := 'BaseDados';
      //AL_72
      wQryAux2 := TwwQuery.Create(Application);
      wQryAux2.DatabaseName := 'BaseDados';

      Result := True;
      bComita := False;
      // Seleciona conforme opção, atualizações, aplicações e resgates
      //AL_103
      OperComum.LimpaParametros(DMRendaFixa.qryBuscaHistRenFix);
      DMRendaFixa.qryBuscaHistRenFix.ParamByName('dDataProc').AsString := DateToStr(dDataProc);
      if iIDHistRenfix <> -1 then
         DMRendaFixa.qryBuscaHistRenFix.ParamByName('IDHISTRENFIX').AsInteger := iIDHistRenfix;

      if iOperacaoAplic <> -1 then
         DMRendaFixa.qryBuscaHistRenFix.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperacaoAplic;

      if iInvestimento <> -1 then
         DMRendaFixa.qryBuscaHistRenFix.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
      DMRendaFixa.qryBuscaHistRenFix.Open;

      if not DMRendaFixa.qryBuscaHistRenFix.IsEmpty then
      begin
         //AL_103
         if fraFrame <> nil then
         begin
            fraFrame.Visible := True;
            fraFrame.Max := DMRendaFixa.qryBuscaHistRenFix.RecordCount;
            fraFrame.Pos := 0;
         end;

         // Exclui de traz para frente (Datas e Investimentos)
         while not DMRendaFixa.qryBuscaHistRenFix.EOF do
         begin
            //AL_103
            if fraFrame <> nil then
            begin
               fraFrame.Mes := 'Aguarde, Excluindo Movimentação...' +
                               DMRendaFixa.qryBuscaHistRenFix.FieldByName('DATAHISTRENFIX').AsString;
               fraFrame.Invalidate;
               fraFrame.Update;
            end;

            // Se Não Exclui o Dia Atual
            if (DMRendaFixa.qryBuscaHistRenFix.FieldByName('DATAHISTRENFIX').AsDateTime = dDataProc) and
               (bExcluiDiaAtual = False) then
            begin
               // Em papeis de cotação de renda fixa existe mais de uma atualização
               //    no mesmo dia, uma no início do dia e outra após as operações,
               //    só deixo de excluir a primeira atualização do dia.
               //AL_22
               //AL_103
               wQryAux.Close;
               wQryAux.SQL.Clear;
               //AL_48
               wQryAux.SQL.Text := 'SELECT MIN(HISTRENFIX.IDHISTRENFIX) AS IDHISTRENFIX ' +
                                   'FROM HISTRENFIX ' +
                                    'WHERE HISTRENFIX.IDOPERRENFIXAPLIC = ' + DMRendaFixa.qryBuscaHistRenFix.FieldByName('IDOPERRENFIXAPLIC').AsString + ' ' +
                                    '  AND HISTRENFIX.DATAHISTRENFIX = TO_DATE(''' + DMRendaFixa.qryBuscaHistRenFix.FieldByName('DATAHISTRENFIX').AsString + ''',''DD/MM/YYYY'') ' +
                                    '  AND HISTRENFIX.TIPMOVHISRENFIX = ''ATU'' ';
               wQryAux.Open;
               // Não exclui a primeira atualização do dia
               if wQryAux.FieldByName('IDHISTRENFIX').AsInteger = DMRendaFixa.qryBuscaHistRenFix.FieldByName('IDHISTRENFIX').AsInteger then
               begin
                  DMRendaFixa.qryBuscaHistRenFix.Next;
                  //AL_103
                  if fraFrame <> nil then
                     fraFrame.Incrementa;
                  wQryAux.Close;
                  Continue;
               end;
               wQryAux.Close;
            end;
            // Se é Exclusao de Resgate, não exclui o registro de ATU no dia da operaçao de resgate
            if (DMRendaFixa.qryBuscaHistRenFix.FieldByName('DATAHISTRENFIX').AsDateTime = dDataProc) and
               (bExcluiDiaAtual = True) and
               (bResgate = True) and
               (DMRendaFixa.qryBuscaHistRenFix.FieldByName('TIPMOVHISRENFIX').AsString = 'ATU') then
            begin
               // Em papeis de cotação de renda fixa existe mais de uma atualização
               //    no mesmo dia, uma no início do dia e outra após as operações,
               //    só deixo de excluir a primeira atualização do dia.
               //AL_22
               wQryAux.Close;
               wQryAux.SQL.Clear;
               //AL_103
               wQryAux.SQL.Text := 'SELECT MIN(HISTRENFIX.IDHISTRENFIX) AS IDHISTRENFIX ' +
                                   'FROM HISTRENFIX ' +
                                   'WHERE HISTRENFIX.IDOPERRENFIXAPLIC = ' + DMRendaFixa.qryBuscaHistRenFix.FieldByName('IDOPERRENFIXAPLIC').AsString + ' ' +
                                   '  AND HISTRENFIX.DATAHISTRENFIX = ' + OperComum.DataOracle(DMRendaFixa.qryBuscaHistRenFix.FieldByName('DATAHISTRENFIX').AsDateTime) +
                                   '  AND HISTRENFIX.TIPMOVHISRENFIX = ''ATU'' ';
               wQryAux.Open;

               //AL_72  - Verifica se o ATU é após uma TRC e deve ser excluido
               wQryAux2.Close;
               wQryAux2.SQL.Clear;
               wQryAux2.SQL.Text := 'SELECT OPERRENFIX.IDTIPOOPERACAO FROM OPERRENFIX '+
                                    'WHERE  OPERRENFIX.IDOPERRENFIX = ' + DMRendaFixa.qryBuscaHistRenFix.FieldByName('IDOPERRENFIX').AsString + ' ' +
                                    '  AND  OPERRENFIX.IDTIPOOPERACAO IN (-97,-98)';
               wQryAux2.Open;

               if (wQryAux.FieldByName('IDHISTRENFIX').AsInteger = DMRendaFixa.qryBuscaHistRenFix.FieldByName('IDHISTRENFIX').AsInteger) and
                  (wQryAux2.IsEmpty) then
               begin
                  DMRendaFixa.qryBuscaHistRenFix.Next;
                  //AL_103
                  if fraFrame <> nil then
                     fraFrame.Incrementa;
                  wQryAux.Close;
                  wQryAux2.Close;
                  Continue;
               end;
               wQryAux.Close;
               wQryAux2.Close;
            end;

            if not DtmBaseDados.dbBaseDados.InTransaction Then
            begin
               DtmBaseDados.dbBaseDados.StartTransaction;
               bComita := True;
            end;

            // Exclui os Históricos do Dia
            //AL_103 - Ini - Retirada de With dentro de With
            //AL_22
            wQryAux.Close;
            wQryAux.SQL.Clear;
            wQryAux.SQL.Text := 'DELETE FROM HISTRENFIXXITENS WHERE IDHISTRENFIX = ' +
                            DMRendaFixa.qryBuscaHistRenFix.FieldByName('IDHISTRENFIX').AsString;
            wQryAux.ExecSQL;
            //AL_22
            wQryAux.Close;
            wQryAux.SQL.Clear;
            wQryAux.SQL.Text := 'DELETE FROM IRLITIGIO WHERE IDHISTRENFIX = ' +
                            DMRendaFixa.qryBuscaHistRenFix.FieldByName('IDHISTRENFIX').AsString;
            wQryAux.ExecSQL;
            //AL_22
            wQryAux.Close;
            wQryAux.SQL.Clear;
            wQryAux.SQL.Text := 'DELETE FROM HISTRENFIX WHERE IDHISTRENFIX = ' +
                            DMRendaFixa.qryBuscaHistRenFix.FieldByName('IDHISTRENFIX').AsString;
            wQryAux.ExecSQL;
            wQryAux.Close;
            //AL_103 - Fim

            // Exclui a Operação se for o caso
            //AL_83
            if ((DMRendaFixa.qryBuscaHistRenFix.FieldByName('TIPMOVHISRENFIX').AsString = 'OPE') or
                (DMRendaFixa.qryBuscaHistRenFix.FieldByName('TIPMOVHISRENFIX').AsString = 'TRC')) and
               ((DMRendaFixa.qryBuscaHistRenFix.FieldByName('TIPMOVHISRENFIX').AsString = 'TRC') and
                ((DMRendaFixa.qryBuscaHistRenFix.FieldByName('IDOPERRENFIX').AsInteger >= iOperacao) or
                 (iOperacao = -1))) and
               (bExcluiOper) then
            begin
               //AL_103 - Ini - Retirada de With dentro de With
               //AL_51 - Ini
               // Exclui Histórico de repactuações
               wQryAux.SQL.Clear;
               wQryAux.SQL.Text := 'DELETE FROM HISTOPERRENFIX WHERE IDOPERRENFIX = ' +
                                           DMRendaFixa.qryBuscaHistRenFix.FieldByName('IDOPERRENFIX').AsString;
               wQryAux.ExecSQL;
               //AL_22
               // Exclui Itens da Operação
               wQryAux.SQL.Clear;
               wQryAux.SQL.Text := 'DELETE FROM OPERRENFIXXCURVAS WHERE IDOPERRENFIX = ' +
                                           DMRendaFixa.qryBuscaHistRenFix.FieldByName('IDOPERRENFIX').AsString;
               wQryAux.ExecSQL;
               //AL_22
               // Exclui IRLitigio
               wQryAux.SQL.Clear;
               wQryAux.SQL.Text := 'DELETE FROM IRLITIGIO WHERE IDOPERRENFIX = ' +
                                           DMRendaFixa.qryBuscaHistRenFix.FieldByName('IDOPERRENFIX').AsString;
               wQryAux.ExecSQL;
               //AL_22
               // Exclui a Operação
               wQryAux.SQL.Clear;
               wQryAux.SQL.Text := 'DELETE FROM OPERRENFIX WHERE IDOPERRENFIX = ' +
                                           DMRendaFixa.qryBuscaHistRenFix.FieldByName('IDOPERRENFIX').AsString;
               wQryAux.ExecSQL;
               //AL_103 - Fim
               // AL_51 - Fim
               // Excluir o Contábil
               if DMRendaFixa.qryBuscaHistRenFix.FieldByName('PLNOPER').AsInteger <> 0 then
               begin
                  if not RendaFixa.ExcluiContabilidadeRenFix(DMRendaFixa.qryBuscaHistRenFix.FieldByName('PLNOPER').AsInteger) then
                     Raise Exception.Create('Não foi Possível a Excluir os Lançamentos Contábeis ');
               end;

               // Excluir o Financeiro
               if DMRendaFixa.qryBuscaHistRenFix.FieldByName('DOCOPER').AsInteger <> 0 then
               begin
                  if not RendaFixa.ExcluiFinanceiroRenFix(DMRendaFixa.qryBuscaHistRenFix.FieldByName('DOCOPER').AsInteger) then
                     Raise Exception.Create('Não foi Possível a Excluir os Lançamentos Financeiros ');
               end;
            end;

            //AL_103 - Reorganização
            if not RendaFixa.ExcluiIrLitigioRenFix(DMRendaFixa.qryBuscaHistRenFix.FieldByName('IDOPERRENFIX').AsInteger) then
               Raise Exception.Create('Ocorreu um problema de Exclusão do IR Litigio');

            if DMRendaFixa.qryBuscaHistRenFix.FieldByName('PLNCODIGO').AsInteger <> 0 then
            begin
               if not RendaFixa.ExcluiContabilidadeRenFix(DMRendaFixa.qryBuscaHistRenFix.FieldByName('PLNCODIGO').AsInteger,
                                                          bExcluiPlanilha) then
                  Raise Exception.Create('Ocorreu um problema de Exclusão dos Lançamentos Contábeis');
            end;
            //AL_30

            //AL_103
            if (DMRendaFixa.qryBuscaHistRenFix.FieldByName('DATAHISTRENFIX').AsDateTime < CtrlPInv.DataUltFechRF) and
               (bAlteraDataFech) then
            begin
               if not AlteraDataFechRF(DMRendaFixa.qryBuscaHistRenFix.FieldByName('DATAHISTRENFIX').AsDateTime) then
               begin
                  //AL_103 - Não interrompe o processo, somente gera um aviso
                  MsgDlg('Não foi atualizar a data de fechamento para ' + DMRendaFixa.qryBuscaHistRenFix.FieldByName('DATAHISTRENFIX').AsString,
                         'Mensagem do Sistema ', mtWarning,[mbOK],0);
               end;
            end;

            DMRendaFixa.qryBuscaHistRenFix.Next;
            //AL_103
            if fraFrame <> nil then
               fraFrame.Incrementa;
         end;

         if bComita then
            DtmBaseDados.dbBaseDados.Commit;
      end;
   finally
      //AL_103
      //AL_22
      if fraFrame <> nil then
      begin
         fraFrame.Pos := 0;
         fraFrame.Mes := '';
         fraFrame.Visible := False;
      end;
      //AL_21 Ini
      //AL_103
      DMRendaFixa.qryBuscaHistRenFix.Close;
      //AL_22
      //AL_103
      wQryAux.Close;
      FreeAndNil(wQryAux);
      //AL_72
      //AL_103
      wQryAux2.Close;
      FreeAndNil(wQryAux2);
      //AL_21 Fim
   end;
end;

//AL_9
//AL_66
function TRendaFixa.LancaItensHistResgTot(iIdHistRenFix,iTipoOperacao,iFlgGeraContab,
         iFlgGeraCapCar, iForCli, iTipoDoc: Integer;
         dDataProc, dDataVenc, dDataLiq: TDateTime; sHistorico: String;
         fEmolumentos,fCorretagem, fVlrOperacao : Double;
         var iPlanilha, iDocumento: Integer;
         fPUAtu: Double = 0; fLucPre: Double = 0;
         iUsuarioOrigem: Integer = -1;
         fraFrame: TfraMensagem = nil;
         flgContaInvest : integer = 0): boolean;
var
    fPUItem, fPUAcuItem, fVlrCtb, fCorrProp, fJurosProp: Double;
    dDataAniv: TDateTime;
    iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc,iIdPlnCodigo: integer;
    sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred, sCentroRespon, sTipoRecDes,
       sTipoPer, sHistoricoOper, sRecPagNao: string;
    iPlan, iDoc: Integer;
    fRend, fIR : double;
    //AL_17
    fVlrAcu : Double;
    //AL_34
    fVlrResg : Double;
    //AL_??
    fVlrCtbBruLiq : Double;
begin

   // Esta rotina utiliza as querys já carregadas pela BuscaSaldos,
   //      se a idéia for calcular somente uma aplicação utilizar
   //      a BuscaSaldos passando o parametro iInvestimento

   //AL_100 - Ajuste no processo
   Result := False;

   fVlrCtbBruLiq := 0;
   fRend := 0;
   fIR := 0;

   iPlan  := -1;
   iDoc   := -1;
   if iPlanilha > 0 then
      iPlan := iPlanilha;
   if iDocumento > 0 then
      iDoc := iDocumento;

   //AL_100 - Ajuste as mensagems e no processo
   DMRendaFixa.qryBuscaSaldosItems.First;
   //AL_103
   if fraFrame <> nil then
      fraFrame.Max := DMRendaFixa.BuscaSaldosItensRecNo;
//      fraFrame.Max := DMRendaFixa.qryBuscaSaldosItems.RecordCount;

   while not DMRendaFixa.qryBuscaSaldosItems.Eof do
   begin
      if fraFrame <> nil then
         fraFrame.Mes := 'Gravando ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString;

      // Se for Poupança
      //AL_100 - Utilização do Objeto CtrlPInv
      if (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
         (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq) then
      begin
         // Equaliza a BuscaSaldosPoup com o mesmo item da BuscaSaldos
         //AL_103 
         DMRendaFixa.qryBuscaSaldosItemsPoup.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                    VarArrayOf([DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                                                DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger]), []);
      end;

      // Calcula Valor Atual do Item
      //AL_82
      //AL_103
      if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger * -1) in [1,2,5,6,7,8,14,17,22,23] then
//      if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -1) or
//         (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -2) or
//         (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) or
//         (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6) or
//         (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -7) or
//         (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -8) or
//         (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -14) or
//         (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -17) or
//         (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -22) or     // Vlr Penhorado
//         (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -23) then   // Qtd Penhorada
      begin
         // Saldos Zerados pelos Valores Atuais
         fPUAcuItem := 0;
         fPUItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;

         // No Caso de Poupança, o saldo de Valor Bruto e Líquido tem que ser
         //    o do dia anterior na BuscaSaldosPoup menos o Juro e Correção do período
         //AL_100 - Utilização do Objeto CtrlPInv
         if ((DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
             (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq)) and
            ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) or
             (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6)) then
         //AL_26 Ini
         begin
            // Busca a data do Último Aniversário desta Aplicação em Poupança
            // Obs passo a data da operação + 1 para voltar o aniversário atual no caso de operação na data do aniversário
            //AL_33
            dDataAniv := RendaFixa.BuscaUltimoAnivPoupanca(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime,
                                                           DMRendaFixa.qryBuscaSaldosHist.FieldByName('CARENCIA').AsInteger,
                                                           dDataProc + 1);

            // Verifica se é Resgate no dia do Aniversário
            //AL_34 Ini
            //AL_44
            //AL_100 - Utilização do Objeto CtrlPInv
            if ((CtrlPInv.FlgPoupaPropDia = 'N') and
                (not VerificaSeAtuDiaria(dDataProc, dDataAniv))) then //Atualização Mensal
            begin
               if (dDataAniv = dDataProc) then
                  fPUItem := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('PUACUITEM').AsFloat
               else
               begin
                  //AL_103
                  try
                     DMRendaFixa.qryAux.SQL.Clear;
                     DMRendaFixa.qryAux.SQL.Text := 'SELECT SUM(HISTRENFIX.QTDHISTRENFIX) AS QTDHISTRENFIX, '+
                                                    'SUM(HISTRENFIX.VLRHISTRENFIX) AS VLRHISTRENFIX '+
                                                    'FROM HISTRENFIX ' +
                                                    'WHERE HISTRENFIX.TIPMOVHISRENFIX = ''OPE'' ' +
                                                    '   AND HISTRENFIX.IDINVESTIMENTO = ' + DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsString +
                                                    '   AND HISTRENFIX.IDOPERRENFIXAPLIC = ' + DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsString +
                                                    '   AND HISTRENFIX.DATAHISTRENFIX >= TO_DATE('''+ DateToStr(dDataAniv) +''',''DD/MM/YYYY'') '+
                                                    '   AND HISTRENFIX.DATAHISTRENFIX <= TO_DATE('''+ DateToStr(DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime) +''',''DD/MM/YYYY'')' +
                                                    '   AND HISTRENFIX.NATURMOVHISTRENFI = ''D'' ';
                     DMRendaFixa.qryAux.Open;
                     fVlrResg := DMRendaFixa.qryAux.FieldByName('VLRHISTRENFIX').AsFloat;
                  finally
                     DMRendaFixa.qryAux.Close;
                  end;

                  fPUItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;// - fVlrResg;
               end;
            end
            else //Atualização diária
            begin
               if (dDataAniv = dDataProc)  then
                  fPUItem := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('PUACUITEM').AsFloat
               else
                  fPUItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;
            end;
            //Al_34 Fim
            //AL_49 Ini
            fVlrCtbBruLiq := 0;
            if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) then //Vlr Liquido
               fVlrCtbBruLiq := DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat;
            //AL_49 Fim
         end;
         //AL_26 Fim

         // IR
         if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -7 then
            fIR := fPUItem;
         // Rendimento
         if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -17 then
            fRend := fPUItem;
      end
      // Calcula Lucro na Operação
      else if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -9 then
      begin
         fPUAcuItem := 0;
         fPUItem := DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat -
                    (fPUAtu * DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat);
         if fPUItem <= 0 then // Prejuízo
            fPUItem := 0;
      end
      // Calcula Prejuizo na Operação
      else if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -10 then
      begin
         fPUAcuItem := 0;
         fPUItem := DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat -
                    (fPUAtu * DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat);
         if fPUItem >= 0 then // Lucro
            fPUItem := 0;
      end
      // Taxa da Bolsa (Emolumentos)
      else if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -12 then
      begin
         fPUAcuItem := 0;
         fPUItem := fEmolumentos;
      end
      // Taxa Operacional (Corretagem)
      else if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -13 then
      begin
         fPUAcuItem := 0;
         fPUItem := fCorretagem;
      end
      else
      begin
         //AL_103
         if (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
            (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq) then
         begin
            // Equaliza a BuscaSaldosPoup com o mesmo item da BuscaSaldos
            //AL_103 
            DMRendaFixa.qryBuscaSaldosItemsPoup.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                       VarArrayOf([DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                                                   DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger]),
                                                       []);

            if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'PUCORRECAO') or
               (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'PUJUROS') then
            begin
               // Valores Proporcionais para Juros e Correção
               fPUItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat *
                         (DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat /
                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat);

               fPUAcuItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat - fPUItem;
            end
            else if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'DEPJUDPREV') or
                    (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'DEPJUDASSIST') or
                    (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'DEPJUDINVEST') or
                    (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'ACOJUDPREV') or
                    (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'ACOJUDASSIST') or
                    (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'ACOJUDINVEST') then
            begin
               // Os Depósitos e Ações Judiciais são baixados no primeiro resgate
               fPUItem := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('PUACUITEM').AsFloat;
               fPUAcuItem := 0;
            end
            else
            begin
               // Valores da última atualização
               fPUItem := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('PUITEM').AsFloat;
               fPUAcuItem := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('PUACUITEM').AsFloat;
            end;
         end
         else
         begin
            // Mesmos Valores
            fPUAcuItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;
            fPUItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUITEM').AsFloat;
         end;
      end;

      //AL_17_Ini
      // Converte o PU para Valor
      fVlrCtb := ConvertePUValor(fPUItem,
                                 fPUAcuItem,
                                 DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat,
                                 DMRendaFixa.qryBuscaSaldosOper.FieldByName('PUEMISSAO').AsFloat,
                                 DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString,
                                 DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger);


      // Converte o PUAcu para Valor
      fVlrAcu := ConvertePUAcuValor(fPUAcuItem,
                                    DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat,
                                    DMRendaFixa.qryBuscaSaldosOper.FieldByName('PUEMISSAO').AsFloat,
                                    DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString,
                                    DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger);

      //Gravar o Item de Histórico
      //AL_100 - Ajuste na mensagem
      if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                             DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                             DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                             DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDREGRA').AsInteger,
                                             fPUItem,
                                             fPUAcuItem,
                                             fVlrCtb,
                                             fVlrAcu) then
         Raise Exception.Create('Erro na gravação do Item de Histórico de Renda Fixa' + #13 +
                                'Item: ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString);
      //AL_17_Fim

      // Contabiliza Item
      //AL_68
      if (FazContabilizacao(iFlgGeraContab,-1,-1,'', fVlrCtb)) and
         ((iTipoOperacao <> -97) and (iTipoOperacao <> -98)) then
      begin
         //AL_50
         //AL_100 - Utilização do Objeto CtrlPInv
         if ((DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
             (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq)) and
            ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) or
             (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6)) then
            fVlrCtb := fVlrCtbBruLiq
         else
         // Se for Valor Bruto ou Valor Liquido, soma o Lucro/Prejuizo
         //AL_7
         if ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) or
             (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6)) then
            fVlrCtb := fVlrCtb + fLucPre;

         if RendaFixa.BuscaPadrLancRF(RetornaSegmentacaoRF(-1,iIdHistRenFix),  //Renan CGPC28
                                      dDataProc ,Sistema.IdEmpresa,
                                      1,
                                      iTipoOperacao,
                                      DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                      DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                      DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger,
                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                      fVlrCtb,
                                      iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc,
                                      sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
                                      sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper,sRecPagNao) then
         begin
            if fraFrame <> nil then
               fraFrame.Mes := 'Contabilizando ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString;

            // Verifica se o Investimento é de Poupança e o Item é Juros ou Correção
            //AL_100 - Utilização do Objeto CtrlPInv
            if ((DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
                (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq)) and
               ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'PUCORRECAO') or
                (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'PUJUROS')) then
            begin
               // Busca a data do Último Aniversário desta Aplicação em Poupança
               // Obs passo a data da operação + 1 para voltar o aniversário atual no caso de operação na data do aniversário
               //AL_27
               dDataAniv := RendaFixa.BuscaUltimoAnivPoupanca(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime,
                                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('CARENCIA').AsInteger,
                                                              dDataProc + 1);
               // Verifica se é Resgate antes do Aniversário
               if dDataAniv < dDataProc then
               begin
                  // Faz a Baixa de Juros e Correção
                  //AL_100 - Ajuste na mensagem
                  if not RendaFixa.ContabilizaRendaFixa(fVlrCtb, iPlano, iForCli,iUnidNegoc,iSubContaDeb, iSubContaCred,
                                   DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                   sHistorico + ' ' + sHistoricoOper, sContaDeb, sContaCred,
                                   sCentroCustoDeb, sCentroCustoCred,sTipoPer,
                                   sRecPagNao,dDataProc, iPlanilha, iUsuarioOrigem,
                                   //AL_69
                                   DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger)  then
                     Raise Exception.Create('Não foi possível efetuar a contabilização do item ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString);
               end;
            end
            else
            begin
               //AL_100 - Ajuste na mensagem
               if not RendaFixa.ContabilizaRendaFixa(fVlrCtb, iPlano, iForCli,iUnidNegoc,iSubContaDeb, iSubContaCred,
                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                sHistorico + ' ' + sHistoricoOper, sContaDeb, sContaCred,
                                sCentroCustoDeb, sCentroCustoCred,sTipoPer,
                                sRecPagNao,dDataProc, iPlanilha, iUsuarioOrigem,
                                //AL_69
                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger)  then
                  Raise Exception.Create('Não foi possível efetuar a contabilização do item ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString);
            end;

            // Capta Planilha para que um Item centralizado não jogue o valor para -2
            if iPlanilha > 0 then
               iPlan := iPlanilha;

            // Integra Financeiro -> Somente o Valor Líquido da Operação + Lucro / Prejuizo
            //AL_100 - Ajuste na lógica e utilização do Objeto CtrlPInv
            if ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) and (CtrlPInv.FlgIntFinLiq = 'S')) or
               (CtrlPInv.FlgIntFinLiq <> 'S') then
            begin
               //AL_100 - Utilização do Objeto CtrlPInv
               if (iFlgGeraCapCar = 1) and (CtrlPInv.FlgIntCapCar = 'S') then
               begin

                  fVlrCtb := fVlrCtb - fEmolumentos - fCorretagem;

                  if fraFrame <> nil then
                     fraFrame.Mes := 'Lançando ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString + ' no financeiro';

                  //AL_9
                  //AL_66
                  //AL_69
                  //AL_100 - Ajuste na mensagem
                  if not IntegraCapCarRendaFixa(fVlrCtb,fVlrOperacao,iForCli, iPlano, iTipoDoc,iUnidNegoc,iSubContaCred,iPlanilha,
                                                //AL_60
                                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                sRecPagNao,sTipoRecDes,sContaDeb, sContaCred,sCentroCustoCred,
                                                DateToStr(dDataProc),DateToStr(dDataLiq),sCentroRespon,sHistorico,
                                                iDocumento, iUsuarioOrigem,flgContaInvest,
                                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger,true) then //Thiago Passos SOL 123324 Kintana 615338 19/08/2009
                     Raise Exception.Create('Não foi possível efetuar a integração financeira do item ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString);
                  if iDocumento > 0 then
                     iDoc := iDocumento;
               end;
            end;
         end;
      end
      else
      begin
         if iPlan > 0 then
            iPlanilha := iPlan
         else
            iPlanilha := -2; // Para não causar erro de contabilização
      end;
      if fraFrame <> nil then
         fraFrame.Incrementa;
      DMRendaFixa.qryBuscaSaldosItems.Next;
   end;
   if iPlan > 0 then
      iPlanilha := iPlan;
   if iDoc > 0 then
      iDocumento := iDoc;

   if fraFrame <> nil then
      fraFrame.Mes := 'Lançando IR Trimestral';

   FazIrLitigioTrimestral(dDataProc,False,True,sHistorico,
                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                          DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIX').AsInteger,
                          -1,fIR,fRend);

   // Procura e exclui eventuais Segundas atualizações na data do resgate total
   try
      DMRendaFixa.qryAux2.Close;
      DMRendaFixa.qryAux2.SQL.Clear;
      DMRendaFixa.qryAux2.SQL.Text := 'SELECT H.IDHISTRENFIX ' +
                                      'FROM HISTRENFIX H ' +
                                      'WHERE (H.DATAHISTRENFIX = TO_DATE(''' + DateToStr(dDataProc) + ''',''DD/MM/YYYY'')) AND ' +
                                      '      (H.IDOPERRENFIXAPLIC = ' + DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsString + ') AND ' +
                                      '      (H.IDINVESTIMENTO  = ' + DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsString + ') AND ' +
                                      '      (H.TIPMOVHISRENFIX = ''ATU'') AND ' +
                                      '      (H.IDHISTRENFIX > (SELECT MIN(HISTRENFIX.IDHISTRENFIX) AS IDHISTRENFIX ' +
                                      '                         FROM HISTRENFIX ' +
                                      '                         WHERE HISTRENFIX.IDOPERRENFIXAPLIC = ' + DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsString +
                                      '                           AND HISTRENFIX.DATAHISTRENFIX = TO_DATE(''' + DateToStr(dDataProc) + ''',''DD/MM/YYYY'') ' +
                                      '                           AND HISTRENFIX.TIPMOVHISRENFIX = ''ATU'' )) ' +
                                      'ORDER BY H.IDHISTRENFIX DESC ';
      DMRendaFixa.qryAux2.Open;
      while not DMRendaFixa.qryAux2.Eof do
      begin
         //AL_1 - 27/05/2004 - Parametro para não voltar mais a data de abertura
         //AL_83
         //AL_100 - Ajuste na mensagem
         //AL_103
         if not RendaFixa.ExcluiHistRenFix(dDataProc, True,
                                           DMRendaFixa.qryAux2.FieldByName('IDHISTRENFIX').AsInteger,
                                           -1,-1, -1, True, False, fraFrame, False) then
            Raise Exception.Create('Não foi possível Excluir a Segunda Atualização deste Investimento.');
         DMRendaFixa.qryAux2.Next;
      end;
   finally
      DMRendaFixa.qryAux2.Close;
      DMRendaFixa.qryAux2.SQL.Clear;
   end;

   // Exclui eventuais Atualizações e operações posteriores a data do resgate total
   //        desta aplicação
   // 27/05/2004 - Parametro para não voltar mais a data de abertura
   //AL_83
   //AL_100 - Ajuste na mensagem
   //AL_103
   if not RendaFixa.ExcluiHistRenFix(dDataProc + 1, True, -1,
                                     DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger, -1,
                                     DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                     True, False, fraFrame, False) then
      Raise Exception.Create('Não foi possível Excluir Registros Posteriores.');

   Result := True;
   //AL_100 - Fim
end;

//AL_9
//AL_66
function TRendaFixa.LancaItensHistResgParcial(iIdHistRenFix,iTipoOperacao,iFlgGeraContab,
                                              iFlgGeraCapCar, iForCli, iTipoDoc: Integer;
                                              dDataProc, dDataVenc, dDataLiq: TDateTime; sHistorico: String;
                                              fEmolumentos,fCorretagem,fVlrOperacao : Double;
                                              var iPlanilha, iDocumento: Integer;
                                              fPUAtu: Double = 0; fLucPre: Double = 0;
                                              iUsuarioOrigem: Integer = -1;
                                              fraFrame: TfraMensagem = nil;
                                              flgContaInvest : integer = 0): boolean;
var
    fPUItem, fPUAcuItem, fVlrCtb, fCorrProp, fJurosProp: Double;
    iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc,iIdPlnCodigo: integer;
    sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred, sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper,
    sRecPagNao: string;
    iPlan, iDoc: Integer;
    fRend, fIR : Double;
    dDataAniv: TDateTime;
    //AL_17
    fVlrAcu : Double;
    //AL_37
    fVlrResg : Double;
    //AL_49
    fVlrCtbBruLiq : Double;
begin
// Esta rotina utiliza as querys já carregadas pela BuscaSaldos,
//      se a idéia for calcular somente uma aplicação utilizar
//      a BuscaSaldos passando o parametro iInvestimento

   //AL_100 - Inicia com false, se parar no meio sai como False
   Result := False;

   // Retirada de warnings
   fVlrCtbBruLiq := 0;
   fRend := 0;
   fIR := 0;

   iPlan := -1;
   iDoc  := -1;
   if iPlanilha > 0 then
      iPlan := iPlanilha;
   if iDocumento > 0 then
      iDoc := iDocumento;

   //AL_100 - Não tratar o erro, deixar a exceção explodir até a chamada original
   DMRendaFixa.qryBuscaSaldosItems.First;

   //AL_103
   if fraFrame <> nil then
      fraFrame.Max := DMRendaFixa.BuscaSaldosItensRecNo;
//      fraFrame.Max := DMRendaFixa.qryBuscaSaldosItems.RecordCount;

   while not DMRendaFixa.qryBuscaSaldosItems.Eof do
   begin
      if fraFrame <> nil then
         fraFrame.Mes := 'Gravando ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString;
      // Calcula Valor Atual do Item
      //AL_82
      if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger * -1) in [1,2,5,6,7,8,14,17,22,23] then
//      if (DMRendaFixa.qryBuscaSaldosItemsIDITEMRENFIX.AsInteger = -1) or
//         (DMRendaFixa.qryBuscaSaldosItemsIDITEMRENFIX.AsInteger = -2) or
//         (DMRendaFixa.qryBuscaSaldosItemsIDITEMRENFIX.AsInteger = -5) or
//         (DMRendaFixa.qryBuscaSaldosItemsIDITEMRENFIX.AsInteger = -6) or
//         (DMRendaFixa.qryBuscaSaldosItemsIDITEMRENFIX.AsInteger = -7) or
//         (DMRendaFixa.qryBuscaSaldosItemsIDITEMRENFIX.AsInteger = -8) or
//         (DMRendaFixa.qryBuscaSaldosItemsIDITEMRENFIX.AsInteger = -14) or
//         (DMRendaFixa.qryBuscaSaldosItemsIDITEMRENFIX.AsInteger = -17) or
//         //AL_82
//         (DMRendaFixa.qryBuscaSaldosItemsIDITEMRENFIX.AsInteger = -22) or     // Vlr Penhorado
//         (DMRendaFixa.qryBuscaSaldosItemsIDITEMRENFIX.AsInteger = -23) then   // Qtd Penhorada
      begin
         // Saldos Zerados pelos Valores Atuais
         // Recalcula os valores pela quantidade relativa
         fPUItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat *
                    (DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat /
                     DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat);
         //AL_82
         if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -22 then
            fPUItem := DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat;
         if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -23 then
            fPUItem := DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat;

         //AL_82
         if (iTipoOperacao <> -167)  then
            fPUAcuItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat - fPUItem
         else
            fPUAcuItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;

         if (iTipoOperacao = -167) and // Baixa de Penhora
            ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -22) or
             (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -23)) then // Baixa de Penhora
            fPUAcuItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat - fPUItem;

         if (iTipoOperacao = -167) and // Baixa de Penhora
            ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -1) or
            (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) or
            (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6)) then // Baixa de Penhora
            fPUItem := 0;

         // No Caso de Poupança, o saldo de Valor Bruto e Líquido tem que ter
         //    o Juro e Correção proporcional incorporado.
         //AL_100 - Utilização do Objeto CtrlPInv
         if ((DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
             (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq)) and
            ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) or
             (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6)) then
         begin
            //AL_26 Ini
            // Busca a data do Último Aniversário desta Aplicação em Poupança
            // Obs passo a data da operação + 1 para voltar o aniversário atual no caso de operação na data do aniversário
            dDataAniv := RendaFixa.BuscaUltimoAnivPoupanca(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime,
                                                           DMRendaFixa.qryBuscaSaldosHist.FieldByName('CARENCIA').AsInteger,
                                                           dDataProc + 1);

            // Verifica se é Resgate no dia do Aniversário
            //AL_34 Ini
            //AL_44
            //AL_100 - Utilização do Objeto CtrlPInv
            if ((CtrlPInv.FlgPoupaPropDia = 'N') and
                (not VerificaSeAtuDiaria(dDataProc, dDataAniv))) then // Atualização Mensal
            begin
               if (dDataAniv = dDataProc) then
                  fPUAcuItem := fPUAcuItem
               else
                  //AL_37 Ini
                  fPUAcuItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat - DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat
            end
            else // Atualização diária
            begin
               if (dDataAniv = dDataProc) then
                  fPUAcuItem := fPUAcuItem
               else
                  //AL_49
                  fPUAcuItem := fPUAcuItem;
               //AL_26 Fim
            end;

            //AL_49 Ini
            fVlrCtbBruLiq := 0;
            if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) then //Vlr Liquido
               fVlrCtbBruLiq := DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat;
            //AL_49 Fim

            // Se for Valor Bruto ou Valor Bruto Provisionado para Perda
            //    Atualiza o Saldo do Investimento na Histrenfix
            if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6) or
               (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -14) then
            begin
               if not AtuFinanceiroHist(iIdHistRenFix,
                                        DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat,
                                        fPUAcuItem) then
                  Raise Exception.Create('Não foi Possível Atualizar o Financeiro Atualizado no Histórico');
            end;
         end;

         // IR
         if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -7 then
            fIR := fPUItem;
         // Rendimento
         if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -17 then
            fRend := fPUItem;

      end

      // Calcula Lucro na Operação
      else if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -9 then
      begin
         fPUItem := DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat -
                    (fPUAtu * DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat);
         if fPUItem <= 0 then
            fPUItem := 0;
         fPUAcuItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat + fPUItem;
      end
      // Calcula Prejuizo na Operação
      else if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -10 then
      begin
         fPUItem := DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat -
                    (fPUAtu * DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat);
         if fPUItem >= 0 then
            fPUItem := 0;
         fPUAcuItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat - fPUItem;
      end
      // Taxa da Bolsa (Emolumentos)
      else if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -12 then
      begin
         fPUAcuItem := 0;
         fPUItem := fEmolumentos;
      end
      // Taxa Operacional (Corretagem)
      else if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -13 then
      begin
         fPUAcuItem := 0;
         fPUItem := fCorretagem;
      end
      else
      // Demais Valores
      begin
         //AL_100 - Utilização do Objeto CtrlPInv
         if (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
            (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq) then
         begin
            // Equaliza a BuscaSaldosPoup com o mesmo item da BuscaSaldos
            //AL_103
            DMRendaFixa.qryBuscaSaldosItemsPoup.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                       VarArrayOf([DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                                                   DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger]),
                                                       []);

            if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'PUCORRECAO') or
               (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'PUJUROS') then
            begin
               // Valores Proporcionais para Juros e Correção
               //AL_49 Ini
               fPUItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat *
                         (DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat /
                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat);

               fPUAcuItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat - fPUItem;
              //AL_49 Fim
            end
            else if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'DEPJUDPREV') or
                    (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'DEPJUDASSIST') or
                    (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'DEPJUDINVEST') or
                    (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'ACOJUDPREV') or
                    (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'ACOJUDASSIST') or
                    (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'ACOJUDINVEST') then
            begin
               // Os Depósitos e Ações Judiciais são baixados no primeiro resgate
               fPUItem := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('PUACUITEM').AsFloat;
               fPUAcuItem := 0;
            end
            else
            begin
               // Valores da última atualização
               fPUAcuItem := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('PUACUITEM').AsFloat;
               fPUItem := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('PUITEM').AsFloat;
            end;
         end
         else
         begin
            // Mesmos Valores
            fPUAcuItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;
            fPUItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUITEM').AsFloat;
            //AL_82
            if (iTipoOperacao = -167)  then
               fPUItem := 0;

         end;
      end;

      //AL_17 Ini
      // Converte o PU para Valor
      //AL_82
      if (iTipoOperacao = -167)  then
      begin
         fVlrCtb := 0;
         fVlrAcu := 0;
      end
      else
      begin
         fVlrCtb := ConvertePUValor(fPUItem,
                                    fPUAcuItem,
                                    DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat,
                                    DMRendaFixa.qryBuscaSaldosOper.FieldByName('PUEMISSAO').AsFloat,
                                    DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString,
                                    DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger);

         fVlrAcu := ConvertePUAcuValor(fPUAcuItem,
                                       DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('PUEMISSAO').AsFloat,
                                       DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString,
                                       DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger);
      end;

      //Gravar o Item de Histórico
      //AL_100 - Ajuste na mensagem
      if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                             DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                             DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                             DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDREGRA').AsInteger,
                                             fPUItem,
                                             fPUAcuItem,
                                             fVlrCtb,
                                             fVlrAcu) then
         Raise Exception.Create('Não foi possível gravar um Item de Histórico do resgate parcial' + #13 +
                                'Item: ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString);

      // Contabiliza Item
      //AL_68
      if (FazContabilizacao(iFlgGeraContab,-1,-1,'', fVlrCtb)) and
         ((iTipoOperacao <> -97) and (iTipoOperacao <> -98)) then
      begin
      //AL_17 Fim

         //AL_50
         //AL_100 - Utilização do Objeto CtrlPInv
         if ((DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
             (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq)) and
            ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) or
             (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6)) then
            fVlrCtb := fVlrCtbBruLiq
         else
         // Se for Valor Bruto ou Valor Liquido, soma o Lucro/Prejuizo
         //AL_7
         if ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) or
             (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6)) then
            fVlrCtb := fVlrCtb + fLucPre;

         if RendaFixa.BuscaPadrLancRF(RetornaSegmentacaoRF(-1,iIdHistRenFix),  //Renan CGPC28
                                      dDataProc, Sistema.IdEmpresa,
                                      1,
                                      iTipoOperacao,
                                      DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                      DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                      DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger,
                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                      fVlrCtb,
                                      iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc,
                                      sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
                                      sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper,sRecPagNao) then
         begin
            if fraFrame <> nil then
               fraFrame.Mes := 'Contabilizando ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString;

            // Verifica se o Investimento é de Poupança e o Item é Juros ou Correção
            //AL_100 - Utilização do Objeto CtrlPInv
            if ((DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPinv.IdClassePoup) or
                (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq)) and
               ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'PUCORRECAO') or
                (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'PUJUROS')) then
            begin
               // Busca a data do Último Aniversário desta Aplicação em Poupança
               // Obs passo a data da operação + 1 para voltar o aniversário atual no caso de operação na data do aniversário
               dDataAniv := RendaFixa.BuscaUltimoAnivPoupanca(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime + 1,
                                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('CARENCIA').AsInteger,
                                                              dDataProc);
               // Verifica se é Resgate antes do Aniversário
               if dDataAniv < dDataProc then
               begin
                  // Faz a Baixa de Juros e Correção
                  //AL_100 - Ajuste na mensagem
                  if not RendaFixa.ContabilizaRendaFixa(fVlrCtb, iPlano, iForCli,iUnidNegoc,iSubContaDeb, iSubContaCred,
                                   DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                   sHistorico + ' ' + sHistoricoOper,
                                   sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,sTipoPer,
                                   sRecPagNao,dDataProc, iPlanilha, iUsuarioOrigem,
                                   //AL_69
                                   DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger)  then
                     Raise Exception.Create ('Atenção : Não foi possível efetuar a contabilização do item ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString);
               end;
            end
            else
            begin
               //AL_100 - Ajuste na mensagem
               if not RendaFixa.ContabilizaRendaFixa(fVlrCtb, iPlano, iForCli,iUnidNegoc,iSubContaDeb, iSubContaCred,
                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                sHistorico + ' ' + sHistoricoOper,
                                sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,sTipoPer,
                                sRecPagNao,dDataProc, iPlanilha, iUsuarioOrigem,
                                //AL_69
                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger)  then
                  Raise Exception.Create ('Atenção : Não foi possível efetuar a contabilização do item ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString);
            end;

            // Capta Planilha para que um Item centralizado não jogue o valor para -2
            if iPlanilha > 0 then
               iPlan := iPlanilha;

            // Integra Financeiro -> Somente o Valor Líquido da Operação
            //AL_100 - Ajuste na lógica e utilização do Objeto CtrlPInv
            if ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) and (CtrlPInv.FlgIntFinLiq = 'S')) or
               (CtrlPInv.FlgIntFinLiq <> 'S') then
            begin
               //AL_100 - Utilização do Objeto CtrlPInv
               if (iFlgGeraCapCar = 1) and (CtrlPInv.FlgIntCapCar = 'S') then
               begin

                  fVlrCtb := fVlrCtb - fEmolumentos - fCorretagem;

                  if fraFrame <> nil then
                     fraFrame.Mes := 'Lançando ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString + ' no financeiro';

                  //AL_9
                  //AL_66
                  //AL_69
                  //AL_100 - Ajuste na mensagem
                  if not IntegraCapCarRendaFixa(fVlrCtb, fVlrOperacao,iForCli, iPlano, iTipoDoc,iUnidNegoc,iSubContaCred,iPlanilha,
                                                //AL_60
                                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                sRecPagNao,sTipoRecDes,sContaDeb, sContaCred,sCentroCustoCred,
                                                DateToStr(dDataProc),DateToStr(dDataLiq),sCentroRespon,sHistorico,
                                                iDocumento, iUsuarioOrigem,
                                                flgContaInvest,
                                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger,true) then  //Thiago Passos SOL 123324 Kintana 615338 19/08/2009
                     Raise Exception.Create ('Atenção : Não foi possível fazer a integração financeira do item ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString);

                  if iDocumento > 0 then
                     iDoc := iDocumento;
               end;
            end;
         end;
      end
      else
      begin
         if iPlan > 0 then
            iPlanilha := iPlan
         else
            iPlanilha := -2; // Para não causar erro de contabilização
      end;
      if fraFrame <> nil then
         fraFrame.Incrementa;
      DMRendaFixa.qryBuscaSaldosItems.Next;
   end;

   if iPlan > 0 then
      iPlanilha := iPlan;
   if iDoc > 0 then
      iDocumento := iDoc;

   if fraFrame <> nil then
      fraFrame.Mes := 'Lançando IR Trimestral';

   FazIrLitigioTrimestral(dDataProc,False,True,sHistorico,
                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                          DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIX').AsInteger,
                          -1,fIR,fRend);

   // AL_100
   Result := True;
end;


//AL_93
//AL_103
function TRendaFixa.CalculaItensAtu(iIdHistRenFix, iFlgGeraContab, iFlgGeraCapCar,iForCli, iTipoDoc : integer;
                                    dDataProc, dDataVenc, dDataAniv : TDateTime;
                                    sNatOper,sDescOperacao, sHistorico: string;
                                    var iPlanilha,iDocumento: Integer;
                                    bReprocessa: Boolean = False;bPassoPasso : boolean = False):Boolean;
var
    //AL_103 - Ini
    dDataPgJur, dDataFluxo : TDateTime;

    I, iCurva, iPlan, iDoc,
    iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc,iIdPlnCodigo,
       iPosSApo, iPosSLas: Integer;

    fPUItem, fPUAcuItem, fVlrCtb, fSldAntCotRenFix, fVlrPUFluxo, fPUCotRenFix,
       fPUAcuAnt, fPUItemAnt, RegraResult,
       fIR, fRend, fIOF, fVlrAcu, fVlrItem,
       fSldAposta, fSldLastro : Double;

    sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred, sCentroRespon, sSql, 
       sTipoRecDes, sTipoPer, sHistoricoOper, sRecPagNao, sMens, sItemVlrAtu: string;

    cdsItens: TCMClientDataSet;
    wQryCurvasAux, wQryAux : TwwQuery;
    //AL_103 - Fim
begin
   // Esta rotina utiliza as querys já carregadas pela BuscaSaldos,
   //      se a idéia for calcular somente uma aplicação utilizar
   //      a BuscaSaldos passando o parametro iInvestimento

   // AL_18
   try // Finally

      //AL_103
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('Preparando Itens Para Cálculo', 0);

       // AL_65
      Result := False;
      wQryCurvasAux := TwwQuery.Create(Application);
      wQryCurvasAux.DatabaseName := 'BaseDados';

      //AL_22
      wQryAux := TwwQuery.Create(Application);
      wQryAux.DatabaseName := 'BaseDados';

      //AL_103
      cdsItens := TCMClientDataSet.Create(Application);
      cdsItens.Data := CtrlInvContab.GetDataPacket('SELECT ''CAMPO UTILIZADO NO SQL DE ENTRADA'' AS CAMPO, ''VALOR INFORMADO NO SQL DE ENTRADA'' AS VALOR FROM DUAL WHERE 1 = 2');

      //Regra                 := TRegra.Create(Application);
//      DMRendaFixa.Regra.DatabaseName    := 'BaseDados';
//      DMRendaFixa.Regra.TipoCliente     := tcFundacao;

      // Prepara o Cds a ser utilizado para montar a query de entrada da regra

      //AL_101
      fSldAposta := 0;
      fSldLastro := 0;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'DATAATUAL';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',dDataProc));
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'DATAEMISSAO';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAEMISSAO').AsDateTime));
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'VENCIMENTO';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',DMRendaFixa.qryBuscaSaldosOper.FieldByName('VENCOPERACAO').AsDateTime));
      cdsItens.Post;

      //AL_93
      //AL_72
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'DATAOPERACAO';
      if DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').IsNull then
         cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime))
      else
         cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAOORIG').AsDateTime));
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'DATALEILAO';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATALEILAO').AsDateTime));
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'DATAULTANIV';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',dDataAniv));
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'NATUREZAOPER';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(sNatOper);
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'FLGOPERIMPLANT';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(DMRendaFixa.qryBuscaSaldosOper.FieldByName('FLGOPERIMPLANT').AsString);
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'IDPAIS';
      cdsItens.FieldByName('VALOR').AsString := '1';
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'IDCIDADES';
      cdsItens.FieldByName('VALOR').AsString := '-1';
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'CODESTADO';
      cdsItens.FieldByName('VALOR').AsString := '-1';
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'PERCENTUAL';
      cdsItens.FieldByName('VALOR').AsString := '100';
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'ALIQUOTA';
      cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('0.##',Impostos.BuscaAliquotaIR(1,-1,-1,dDataProc)));
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'TAXA';
      cdsItens.FieldByName('VALOR').AsString := '0';
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'DTPAGTOJUROS';
      cdsItens.FieldByName('VALOR').AsString := '0';
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'DTAMORTPRINC';
      cdsItens.FieldByName('VALOR').AsString := '0';
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'DTINCJUROS';
      cdsItens.FieldByName('VALOR').AsString := '0';
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'PPAGTOJUROS';
      cdsItens.FieldByName('VALOR').AsString := '0';
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'PAMORTPRINC';
      cdsItens.FieldByName('VALOR').AsString := '0';
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'PINCJUROS';
      cdsItens.FieldByName('VALOR').AsString := '0';
      cdsItens.Post;

      // AL_5 - 09/07/2004 - Nome errado da query
      // Busca o Último PU de Pagamento de Juros
      OperComum.LimpaParametros(DMRendaFixa.qryBuscaUltPUPagtoJur);
      DMRendaFixa.qryBuscaUltPUPagtoJur.ParamByName('IDINVESTIMENTO').AsInteger   := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger;
      DMRendaFixa.qryBuscaUltPUPagtoJur.ParamByName('IDOPERRENFIXAPLIC').AsString := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsString;
      DMRendaFixa.qryBuscaUltPUPagtoJur.ParamByName('DATAOPERACAO').AsString      := DateToStr(dDataProc);
      //AL_15
      //AL_103
      DMRendaFixa.qryBuscaUltPUPagtoJur.ParamByName('IDITEMRENFIX').AsInteger     := CtrlPInv.IdOperPagtoJuros;
      DMRendaFixa.qryBuscaUltPUPagtoJur.Open;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'PUPAGTOJUROS';
      cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('0.#########',DMRendaFixa.qryBuscaUltPUPagtoJur.FieldByName('PUACUITEM').AsFloat));
      cdsItens.Post;

      //AL_103
      if CtrlPInv.STARET = 'S' then
      begin
         //AL_93
         //AL_103
         cdsItens.Insert;
         cdsItens.FieldByName('CAMPO').AsString := 'STARET';
         cdsItens.FieldByName('VALOR').AsString := QuotedStr('S');
         cdsItens.Post;

         // Busca a Data do Último RET
         OperComum.LimpaParametros(DMRendaFixa.qryBuscaRendRET);
         DMRendaFixa.qryBuscaRendRET.ParamByName('IDINVESTIMENTO').AsInteger    := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger;
         DMRendaFixa.qryBuscaRendRET.ParamByName('IDOPERRENFIXAPLIC').AsInteger := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
         DMRendaFixa.qryBuscaRendRET.ParamByName('DATAHISTRENFIX').AsString     := DateToStr(Impostos.BuscaDataUltRET(dDataProc));
         DMRendaFixa.qryBuscaRendRET.Open;

         //AL_93
         //AL_103
         cdsItens.Insert;
         cdsItens.FieldByName('CAMPO').AsString := 'PURENDTORET';
         cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('#0.00',DMRendaFixa.qryBuscaRendRET.FieldByName('PUACUITEM').AsFloat));
         cdsItens.Post;
      end;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'CARENCIA';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(DMRendaFixa.qryBuscaSaldosHist.FieldByName('CARENCIA').AsString);
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'INVESTIMENTO';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsString);
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'TPCURVASWAP';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(' ');
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'PUCORRANIV';
      cdsItens.FieldByName('VALOR').AsString := '0';
      cdsItens.Post;

      // AL_53
         //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'DATAVIGENCIA';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',BuscaVigencia(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger, dDataProc )));
      cdsItens.Post;

      // Faz um loop nas curvas do investimento para calcular uma de cada vez
      FazQuery(wQryCurvasAux,'SELECT INVESTXCURVARENFIX.IDCURVARENFIX, INVESTXCURVARENFIX.FLGCURVACONTABIL, '+
                             '       INVESTXCURVARENFIX.FLGTPCURVASWAP, INVESTXCURVARENFIX.FLGCOTRENFIX ' +
                             'FROM  INVESTXCURVARENFIX ' +
                             'WHERE (INVESTXCURVARENFIX.IDINVESTIMENTO = ' + DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsString + ') ' +
                             'ORDER BY INVESTXCURVARENFIX.FLGCURVACONTABIL, INVESTXCURVARENFIX.IDCURVARENFIX ');

      while not wQryCurvasAux.Eof do
      begin
         // Pega a Curva Atual
         iCurva := wQryCurvasAux.FieldByName('IDCURVARENFIX').AsInteger;
         //AL_103
         if cdsItens.Locate('CAMPO', 'TPCURVASWAP', []) then
            cdsItens.Edit
         else
            cdsItens.Insert;
         cdsItens.FieldByName('CAMPO').AsString := 'DATAVIGENCIA';
         cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',BuscaVigencia(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger, dDataProc )));
         cdsItens.Post;

         // Carrega Valores no Vetor
         DMRendaFixa.qryBuscaSaldosItems.First;
         while (not DMRendaFixa.qryBuscaSaldosItems.Eof) do
         begin
            // Se não for a Curva Atual pula o registro
            if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger <> iCurva then
            begin
               DMRendaFixa.qryBuscaSaldosItems.Next;
               Continue;
            end;

            //AL_93
            //AL_103
            cdsItens.Insert;
            cdsItens.FieldByName('CAMPO').AsString := DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString;
            cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('########0.###########', DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat));
            cdsItens.Post;

            //AL_103
            // Pega a Posição do Valor Atualizado no Vetor
            if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -11 then
               sItemVlrAtu := DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString;

            // Busca Fluxo de Pagamento de Juros
            //AL_103
            if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = CtrlPInv.IdOperPagtoJuros then
            begin
               // Busco a data anterior pois no dia do pagto de juros devo calcular o juros ate este dia e no
               // dia posterior ao pagto de juros, esta se torna a data inicial
               if RendaFixa.BuscaFluxoPagtoJuros(DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                                 DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                                 dDataProc,
                                                 DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime) then
               begin
                  dDataPgJur          := DMRendaFixa.qryBuscaFluxoPagtoJuros.FieldByName('DATAFLUXO').AsDateTime;
                  //AL_103
                  if cdsItens.Locate('CAMPO', 'DTPAGTOJUROS', []) then
                  begin
                     cdsItens.Edit;
                     cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',DMRendaFixa.qryBuscaFluxoPagtoJuros.FieldByName('DATAFLUXO').AsDateTime));
                     cdsItens.Post;
                  end
                  else
                     Raise Exception.Create('Não foi possível localizar o item DTPAGTOJUROS no SQL de entrada');

                  if cdsItens.Locate('CAMPO', 'PPAGTOJUROS', []) then
                  begin
                     cdsItens.Edit;
                     //AL_102
                     cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('########0.###########', DMRendaFixa.qryBuscaFluxoPagtoJuros.FieldByName('PERCFLUXO').AsFloat));
                     cdsItens.Post;
                  end
                  else
                     Raise Exception.Create('Não foi possível localizar o item PPAGTOJUROS no SQL de entrada');

                  //AL_103
                  DMRendaFixa.qryBuscaFluxoPagtoJuros.Close;
               end;
            end;

            // Busca Fluxo de Amortizaçao de Principal
            //AL_103
            if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = CtrlPInv.IdOperAmortPrinc then
            begin
               if RendaFixa.BuscaFluxoAmortPrinc(DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                                 DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                                 dDataProc,
                                                 DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime) then
               begin
                  //AL_103
                  if cdsItens.Locate('CAMPO', 'DTAMORTPRINC', []) then
                  begin
                     cdsItens.Edit;
                     cdsItens.FieldByName('CAMPO').AsString := 'DTAMORTPRINC';
                     cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',DMRendaFixa.qryBuscaFluxoAmortPrinc.FieldByName('DATAFLUXO').AsDateTime));
                     cdsItens.Post;
                  end
                  else
                     Raise Exception.Create('Não foi possível localizar o item DTAMORTPRINC no SQL de entrada');

                  if cdsItens.Locate('CAMPO', 'PAMORTPRINC', []) then
                  begin
                     cdsItens.Edit;
                     //AL_102
                     cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('########0.###########', DMRendaFixa.qryBuscaFluxoAmortPrinc.FieldByName('PERCFLUXO').AsFloat));
                     cdsItens.Post;
                  end
                  else
                     Raise Exception.Create('Não foi possível localizar o item PAMORTPRINC no SQL de entrada');
                  //AL_103
                  DMRendaFixa.qryBuscaFluxoAmortPrinc.Close;
               end;
            end;

            // Busca Fluxo de Incorporacao de Juros
            //AL_103
            if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = CtrlPInv.IdOperIncJuros then
            begin
               if RendaFixa.BuscaFluxoIncorpJuros(DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                                  DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                  DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                                  dDataProc,
                                                  DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime) then
               begin
                  //AL_103
                  if cdsItens.Locate('CAMPO', 'DTINCJUROS', []) then
                  begin
                     cdsItens.Edit;
                     cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',DMRendaFixa.qryBuscaFluxoIncorpJuros.FieldByName('DATAFLUXO').AsDateTime));
                     cdsItens.Post;
                  end
                  else
                     Raise Exception.Create('Não foi possível localizar o item DTINCJUROS no SQL de entrada');

                  if cdsItens.Locate('CAMPO', 'PINCJUROS', []) then
                  begin
                     cdsItens.Edit;
                     //AL_102
                     cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('########0.###########', DMRendaFixa.qryBuscaFluxoIncorpJuros.FieldByName('PERCFLUXO').AsFloat));
                     cdsItens.Post;
                  end
                  else
                     Raise Exception.Create('Não foi possível localizar o item PINCJUROS no SQL de entrada');
                  //AL_103
                  DMRendaFixa.qryBuscaFluxoIncorpJuros.Close;
               end;
            end;
            DMRendaFixa.qryBuscaSaldosItems.Next;
         end;

         iPlan := -1;
         iDoc := -1;

         // AL_65 - Escreve Mensagem e seta o progressbar
         //AL_103
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Calculando ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString, DMRendaFixa.BuscaSaldosItensRecNo);
//            AtualizaProcFech('Calculando ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString, DMRendaFixa.qryBuscaSaldosItems.RecordCount);

         // Calcula os Itens
         DMRendaFixa.qryBuscaSaldosItems.First;
         while not DMRendaFixa.qryBuscaSaldosItems.Eof do
         begin
            // Se não for a Curva Atual pula o registro
            if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger <> iCurva then
            begin
               DMRendaFixa.qryBuscaSaldosItems.Next;
               Continue;
            end;

            // AL_65 - Escreve a mensagem e não adianta o progressbar
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('Calculando ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString, 0);

            // Busca o Item da Operação ORIGINAL
            // AL_24
            // Verificar o Funcionamento, é mais rápido que o loop
            DMRendaFixa.qryBuscaSaldosItemsOper.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                   VarArrayOf([DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                                                   DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger]), []);

            // Pega o valor do Percentual na posição fixa iPosPer
            //AL_103
            if cdsItens.Locate('CAMPO', 'PERCENTUAL', []) then
            begin
               cdsItens.Edit;
               if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -15 then
                  cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('########0.###########',
                                                                              BuscaFluxoProvPerda(DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                                                                                  DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                            dDataProc)))
               else
                  cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('########0.###########',DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('PERCCURVA').AsFloat));
               cdsItens.Post;
            end
            else
               Raise Exception.Create('Não foi possível localizar o item PERCENTUAL no SQL de entrada');

               // Pega o Valor da Taxa de Juros na posição fixa iPosTX
               // A cada passagem joga o valor do Item atual nesta posição do vetor,
               // quando a regra de juros for executar o vetor conterá o valor do Item Juros
               // Busca a Taxa de Juros da Operação Original de título transferido
               //AL_73
            //AL_103
            if cdsItens.Locate('CAMPO', 'TAXA', []) then
            begin
               cdsItens.Edit;
               if not DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXORIG').IsNull then
               begin
                  FazQuery(wQryAux,'SELECT OPERRENFIXXCURVAS.VLRCURVA ' +
                                   'FROM OPERRENFIXXCURVAS ' +
                                   'WHERE OPERRENFIXXCURVAS.IDOPERRENFIX = ' + DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXORIG').AsString +
                                   '  AND OPERRENFIXXCURVAS.IDITEMRENFIX = ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsString);

                  cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FloatToStr(wQryAux.FieldByName('VLRCURVA').AsFloat));
                  //AL_103
                  wQryAux.Close;
               end
               else
                  cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('########0.###########',DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('VLRCURVA').AsFloat));
               cdsItens.Post;
            end
            else
               Raise Exception.Create('Não foi possível localizar o item TAXA no SQL de entrada');

            // Do mesmo modo que a Taxa de Juros, capta também o PU na data do último aniversário
            // e bota no vetor, na posição fixa respectiva, no momento do cálculo da Correção, será o PU de
            // correção que estará no vetor
            //AL_22
            wQryAux.SQL.Clear;
            wQryAux.SQL.Add('SELECT HI.PUITEM, HI.PUACUITEM ' +
                                    'FROM HISTRENFIX HS, HISTRENFIXXITENS HI, ITEMRENFIX IT ' +
                                    'WHERE HS.DATAHISTRENFIX = TO_DATE(''' + DateToStr(dDataAniv) + ''',''dd/mm/yyyy'')' +
                                    '  AND HS.IDINVESTIMENTO = ' + DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsString +
                                    '  AND IT.IDITEMRENFIX = ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsString +
                                    '  AND HS.IDHISTRENFIX = HI.IDHISTRENFIX ' +
                                    '  AND HI.IDITEMRENFIX = IT.IDITEMRENFIX');
            wQryAux.Open;
            //AL_103
            if cdsItens.Locate('CAMPO', 'PUCORRANIV', []) then
            begin
               cdsItens.Edit;
               cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('########0.###########',wQryAux.FieldByName('PUACUITEM').AsFloat));
               cdsItens.Post;
            end
            else
               Raise Exception.Create('Não foi possível localizar o item PUCORRANIV no SQL de entrada');
            wQryAux.Close;

            //AL_103

            // Zera variáveis de trabalho
            fPUAcuItem := 0;
            fPUItem := 0;
            fPUAcuAnt := 0;
            fPUItemAnt := 0;
            RegraResult := 0;
            fPUCotRenFix := 0;
            fIR := 0;
            fRend := 0;

            // Calcula o novo Saldo se tiver regra e não estiver vencido
            if not (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDREGRA').IsNull)  and
                   (dDataProc <= dDataVenc) then
            begin
               //AL_22
               //AL_103
               // ---------  Chama regra de cálculo do Item
               // ---------  Se for reprocesso utiliza a regra do Histórico, senão, a do cadastro
               //AL_7 - 14/09/2004
               //AL_96 - Se não houver regra no histórico, utiliza a do perfil
               if (bReprocessa) and (not DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDREGRACALCULO').IsNull) then
                     DMRendaFixa.Regra.RuleName := DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDREGRACALCULO').AsString
               else
                     DMRendaFixa.Regra.RuleName := DMRendaFixa.qryBuscaSaldosItemsXCurvas.FieldByName('IDREGRA').AsString;

               // Montar SQL de entrada
               //AL_22
               //AL_103
               wQryAux.SQL.Clear;
               wQryAux.SQL.Add('SELECT ');
               cdsItens.First;
               while not cdsItens.eof do
               begin
                  wQryAux.SQL.Add(cdsItens.FieldByName('VALOR').AsString + ' AS ' + cdsItens.FieldByName('CAMPO').AsString + ', ');
                  cdsItens.Next;
               end;
               wQryAux.SQL.Strings[wQryAux.SQL.Count-1] := cdsItens.FieldByName('VALOR').AsString + ' AS ' + cdsItens.FieldByName('CAMPO').AsString;
               wQryAux.SQL.Add('FROM DUAL');

               sSql := wQryAux.SQL.GetText;

               //Faz a chamada da regra e volta o resultado
               RegraResult := ExecutaRegra(wQryAux, DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString,
                                           StrToInt(DMRendaFixa.Regra.RuleName), bPassoPasso);

               // Calcula Valor Atual do Item
               fPUAcuAnt := FormataValor(DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat);
               fPUItemAnt := FormataValor(DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUITEM').AsFloat);
               fPUItem := 0;
               fPUAcuItem := 0;

               // Se Ágio/Deságio/Prêmio (itens positivos e TipoIntem = V)
               if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'V') and
                  (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger > 0) then
                  //AL_103
                  fPUAcuItem := fPUAcuAnt - RegraResult
               else
                  // PU Acumulado recebe o Resultado da Regra
                  //AL_103
                  fPUAcuItem := RegraResult;

               // PU recebe, se houver saldo (Acumulado - Saldo) senão o próprio Acumulado
               if DMRendaFixa.qryBuscaSaldosItems.Eof then
                  fPUItem := fPUAcuItem
               else
               begin
                  // AL_56
                  // Se IR/IOF -> O PU é a diferença entre os acumulados anterior e o atual
                  if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'I') then
                     fPUItem := DiminuiValores(fPUAcuItem,fPUAcuAnt)
                  //AL_94 - Se Valor para Calculo (N) -> é a diferença entre os acumulados anterior e o atual
                  else if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'N') then
                     fPUItem := DiminuiValores(fPUAcuItem,fPUAcuAnt)
                  // Se Lucro/Prejuízo -> é o próprip PU Acumulado
                  else if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'L') then
                     fPUItem := fPUAcuItem
                  // Se Ágio/Deságio/Prêmio (itens positivos e TipoIntem = V)
                  else if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'V') and
                          (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger > 0) then
                     //AL_103
                     fPUItem := RegraResult
                  // Se for Cotação de Renda Fixa e Item de Correção (M - Moeda)
                  else if (CotaRenfix(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger)) and
                          (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'M') then
                  begin
                     //AL_35
                     fPUItem := fPUAcuItem;
                  end
                  else
                  begin
                     // Busca o PU de Pagamento de Juros no dia anterior, se houver
                     // AL_13 - Busca PU pela Operação de Fluxo
                     OperComum.LimpaParametros(DMRendaFixa.qruBuscaPUFluxo);
                     DMRendaFixa.qruBuscaPUFluxo.ParamByName('IDINVESTIMENTO').AsInteger := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger;
                     DMRendaFixa.qruBuscaPUFluxo.ParamByName('IDOPERRENFIXAPLIC').AsInteger := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
                     // Não está preparada para Incorporação de Juros (Deve diminuir o valor)
                     if DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'T' then
                        DMRendaFixa.qruBuscaPUFluxo.ParamByName('IDTIPOOPERACAO').AsInteger := -17
                     else if DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'M' then
                        DMRendaFixa.qruBuscaPUFluxo.ParamByName('IDTIPOOPERACAO').AsInteger := -18;
                     DMRendaFixa.qruBuscaPUFluxo.ParamByName('DATAOPERACAO').AsString := DateToStr(dDataProc - 1); // Dia anterior
                     DMRendaFixa.qruBuscaPUFluxo.Open;
                     fVlrPUFluxo := DMRendaFixa.qruBuscaPUFluxo.FieldByName('PUOPERACAO').AsFloat;

                     if ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'T') or
                         (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'M')) then
                        // Para o Item Pagamento de Juros, Tipo T (Taxa), (Saldo Anterior - PU de Pagamento de Juros)
                        fPUItem := DiminuiValores(fPUAcuItem, DiminuiValores(fPUAcuAnt, DMRendaFixa.qruBuscaPUFluxo.FieldByName('PUOPERACAO').AsFloat))
                     else
                     begin
                        // Para o Item Amortização de Principal, Tipo M (Moeda), (Saldo Anterior - PU de Amortização de Principal)
                        fPUItem := DiminuiValores(fPUAcuItem,fPUAcuAnt);
                        //AL_82
                        if (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDTIPOOPERACAO').AsInteger = -166) and
                           (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) then // Vlr. Liquido
                           fPUItem := 0;
                     end;
                     DMRendaFixa.qruBuscaPUFluxo.Close;

                     // AL_5 - Fim
                     // AL_13 - Fim

                     if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6 then // Valor Bruto
                     begin
                        //AL_16_Ini
                        // Verifica se a Data Anterior teve pagamento de Juros
                        // Só acha se for a data do dia do pagto juros, se não, não é para achar mesmo.
                        dDataFluxo :=  VerificaDataPgJuros(dDataProc, dDataPgJur, -17,
                                             DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                           DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                           CotaRenfix(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger));
                        //AL_82
                        fPUItem := DiminuiValores(fPUAcuItem,fPUAcuAnt) +
                                   RendaFixa.BuscaFluxosNoDia(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                              DateToStr(dDataProc - 1));
                        //AL_16 Fim
                     end;
                  end;
               end;
            end
            else
            begin
               // Taxa da Bolsa e Operacional não são calculado na atualização
               if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -12) or
                  (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -13) then
               begin
                  fPUAcuItem := 0;
                  fPUItem    := 0;
               end
               else
               begin
                  // Itens Não Calculados Recebem o Valor Original
                  //AL_103
                  // Procura o Item Atual
                  if cdsItens.Locate('CAMPO', DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString, []) then
                     fPUAcuItem := StrToFloat(TrocaPontoVirgula(cdsItens.FieldByName('VALOR').AsString))
                  else
                     Raise Exception.Create('Não foi possível encontrar o valor original do item ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString + ' no SQL de entrada');
                  fPUItem := fPUItemAnt;
               end;
            end;

            //AL_103 - Atualiza o Cds de Valores e Campos com o Valor Calculado do Item
            if cdsItens.Locate('CAMPO', DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString, []) then
            begin
               cdsItens.Edit;
               cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('0.###########',fPUAcuItem));
               cdsItens.Post;
            end
            else
               Raise Exception.Create('Não foi possível atualizar o valor do item ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString + ' no SQL de entrada');

            // Guarda o valor do IR e do Rendimento
            if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -7 then // IR
               fIR := fPUAcuItem;
            if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -17 then // Rendimento
               fRend := fPUAcuItem;

            //AL_56
            //AL_43
            if bReprocessa then
            begin
               // Contabiliza Item
               fVlrCtb := fPUItem;

               if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'P') or
                  (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'M') or
                  (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'T') then
                  fVlrCtb := fPUItem * DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat;

               //AL_56
               //AL_43
               //AL_87
               if FazContabilizacao(iFlgGeraContab,-1,-1,'Atualizacao', fVlrCtb) then
               begin
                  if (CotaRenfix(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                 DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger)) and
                     (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'M') and
                     (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger > 0) then
                  begin
                     if RendaFixa.VerificaFluxo(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                dDataProc) then
                     begin
                        fPUItem := BuscaVlrCotRenfix(DateToStr(dDataProc),DateToStr(dDataVenc),
                                                     DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                     DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                     fSldAntCotRenFix);
                        fVlrCtb := fPUItem * DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat;
                     end;
                  end;
               end
               else
                  fVlrCtb := 0;

               DMRendaFixa.qryTempItensCalc.Insert;

               DMRendaFixa.qryTempItensCalc.FieldByName('IDCURVARENFIX').AsInteger := DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger;
               DMRendaFixa.qryTempItensCalc.FieldByName('IDITEMRENFIX').AsInteger := DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger;
               DMRendaFixa.qryTempItensCalc.FieldByName('DESCITEMRENFIX').AsString := DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString;
               DMRendaFixa.qryTempItensCalc.FieldByName('PUITEM').AsFloat := fPUItem;
               DMRendaFixa.qryTempItensCalc.FieldByName('PUACUITEM').AsFloat := fPUAcuItem;
               DMRendaFixa.qryTempItensCalc.FieldByName('IDREGRACALCULO').AsInteger := DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDREGRA').AsInteger;
               DMRendaFixa.qryTempItensCalc.FieldByName('VLRCONTABIL').AsFloat := fVlrCtb;
               DMRendaFixa.qryTempItensCalc.FieldByName('TIPOITEM').AsString := DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString;

               DMRendaFixa.qryTempItensCalc.Post;

               // Atualiza o Valor Bruto ou o Valor Bruto Provisionado para Perda
               //   como o Saldo Atual do Investimento
               if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6) or
                  (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -14) then
               begin
                  DMRendaFixa.qryTempHistCalc.Edit;
                  DMRendaFixa.qryTempHistCalc.FieldByName('SALDOVLRHISTRENFI').AsFloat := fPUAcuItem;
                  DMRendaFixa.qryTempHistCalc.FieldByName('VLRHISTRENFIX').AsFloat := fPUItem;
                  DMRendaFixa.qryTempHistCalc.Post;
                  //AL_101
                  if wQryCurvasAux.FieldByName('FLGTPCURVASWAP').AsString = 'A' then
                     fSldAposta := fPUAcuItem
                  else if wQryCurvasAux.FieldByName('FLGTPCURVASWAP').AsString = 'L' then
                     fSldLastro := fPUAcuItem;
               end;
            end
            else
            // Processamento normal
            begin
               // AL_24 - 07/04/2005
               // Converte o PU para Valor

               //AL_41
               fVlrCtb := fPUItem;
               fVlrAcu := fPUAcuItem;

               if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'P') or
                  (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'M') or
                  (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'T') then
                  fVlrCtb := fPUItem * DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat;

               // AL_17
               // Converte o PUAcu para Valor
               if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'P') or
                  (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'M') or
                  (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'T') then
                  fVlrAcu := fPUAcuItem * DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat;

               //AL_56
               //AL_43
               //AL_87
               if FazContabilizacao(iFlgGeraContab,-1,-1,'Atualizacao', fVlrCtb) then
               begin
                  if (CotaRenfix(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                 DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger)) and
                                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'M') and
                                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger > 0) then
                  begin
                     if RendaFixa.VerificaFluxo(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                dDataProc) then
                     begin
                        fPUItem := BuscaVlrCotRenfix(DateToStr(dDataProc),DateToStr(dDataVenc),
                                                           DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                           DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                           fSldAntCotRenFix);
                              fVlrCtb := fPUItem * DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat;
                     end;
                  end;
                  // Busca o Padrão Contábil, Se não existir o Valor é Zero
                  if not RendaFixa.BuscaPadrLancRF(RetornaSegmentacaoRF(-1,iIdHistRenFix), //Renan CGPC28
                                                   dDataProc, Sistema.IdEmpresa, 1, -2,
                                                   DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                   DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                   DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger,
                                                   DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                                   fPUItem,
                                                   iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc,
                                                   sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
                                                   sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper,sRecPagNao,
                                                   DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString) then
                     fVlrCtb := 0;
               end
               else
                  fVlrCtb := 0;

               // Gravar o Item de Histórico
               if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDREGRA').AsInteger,
                                                      fPUItem,
                                                      fPUAcuItem,
                                                      fVlrCtb,
                                                      fVlrAcu) then
                  Raise Exception.Create('Erro na gravação do Item de Histórico de Renda Fixa');

               // Se for Valor Bruto ou Valor Bruto Provisionado para Perda
               //    Atualiza Saldos na HistRenFix
               if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6) or
                  (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -14) then
               begin
                  if not AtuFinanceiroHist(iIdHistRenFix, fPUItem, fPUAcuItem) then
                     Raise Exception.Create('Não foi Possível Atualizar o Financeiro no Histórico');
                  //AL_101
                  if wQryCurvasAux.FieldByName('FLGTPCURVASWAP').AsString = 'A' then
                     fSldAposta := fPUAcuItem
                  else if wQryCurvasAux.FieldByName('FLGTPCURVASWAP').AsString = 'L' then
                     fSldLastro := fPUAcuItem;
               end;
               // AL_24 - Fim
            end;

            DMRendaFixa.qryBuscaSaldosItems.Next;

            // AL_65 - Adianta o progressbar
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('');

         end;

         // AL_65 - Apaga a label e o progressbar
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('', -2);

         if iPlan > 0 then
            iPlanilha := iPlan;
         if iDoc > 0 then
            iDocumento := iDoc;

         // Atualiza o HistRenFix com a planilha
         if (iPlanilha > 0) or (iDocumento > 0) then
         begin
            //AL_103
            sMens := '';
            if not RendaFixa.GravaPlanDoc('ATU',
                                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIX').AsInteger,
                                          iIdHistRenFix,
                                          iPlanilha, iDocumento, sMens, False) then
               Raise Exception.Create(sMens);
         end;

         // Grava IR Trimestral (RET)
         if iIdHistRenFix <> 0 then
         begin
            FazIrLitigioTrimestral(dDataProc,False,False,'IR TRIMESTRAL R.FIXA : '+sHistorico,
                                   DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                   DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                   -1,iIdHistRenFix,fIR,fRend);
         end;

         // Faz o próximo perfil, se houver
         wQryCurvasAux.Next;
      end;
      Result := True;
   finally
      //AL_103 - Ini
      //Refaz o ambiente do componente regra do DataModule
      DMRendaFixa.Regra.LimpaVariaveis;
      DMRendaFixa.Regra.RefazAmbiente;
      //AL_22
      // Destroi os componentes criados em run-time
      DMRendaFixa.qryBuscaUltPUPagtoJur.Close;
      DMRendaFixa.qryBuscaRendRET.Close;
      DMRendaFixa.qryBuscaFluxoPagtoJuros.Close;
      DMRendaFixa.qryBuscaFluxoAmortPrinc.Close;
      DMRendaFixa.qryBuscaFluxoIncorpJuros.Close;
      DMRendaFixa.qryBuscaPUPGJuros.Close;
      DMRendaFixa.qruBuscaPUFluxo.Close;
      wQryCurvasAux.Close;
      wQryAux.Close;
      cdsItens.Close;
      FreeAndNil(wQryCurvasAux);
      FreeAndNil(wQryAux);
      FreeAndNil(cdsItens);
      //AL_93
      //AL_65
      //AL_103 - Fim
   end;
end;

//AL_9
//AL_37
function TRendaFixa.LancaHistResgateRenFix(iOperacao,iFlgGeraContab,iFlgGeraCapCar,iTipoDoc,
                                           iIdHistRenFix, iIdForCli : integer;
                                           sDescOperacao, sHistorico : string;
                                           dDataProc, dDataAniv, dDataLiq :TDateTime;
                                           fEmolumentos,fCorretagem,fVlrOperacao : Double;
                                           var iPlanilha,iDocumento: Integer;
                                           fPUAtu: Double = 0;
                                           fLucPre: Double = 0;
                                           iUsuarioOrigem: Integer = -1;
                                           fraFrame: TfraMensagem = nil;
                                           sFlgRecalc : String = '';
                                           flgContaInvest : Integer = 0): Boolean;
var
    fQtdOpe, fQtdFinal, fVlrOpe, fVlrFinal: Double;
    sMens: String;
    //AL_37
    fQtdResg, fVlrResg : Double;
begin
   Result := False;

   //O Saldo deve estar posicionado com antecedencia
   //-----------------------------------------------

   //AL_103
   try
      //Busca Operacao e Itens
      BuscaOperacao(iOperacao);

      // Calcula Saldos Finais de Qtd e Valor
      //AL_100 - Utilização do Objeto CtrlPInv
      if ((DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
          (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq)) then
      begin
         //AL_27 Ini
         //AL_103
         try
            DMRendaFixa.qryAux.SQL.Clear;
            DMRendaFixa.qryAux.SQL.Text := 'SELECT SUM(HISTRENFIX.QTDHISTRENFIX) AS QTDHISTRENFIX, '+
                                           '       SUM(HISTRENFIX.VLRHISTRENFIX) AS VLRHISTRENFIX '+
                                           'FROM HISTRENFIX ' +
                                           'WHERE  HISTRENFIX.TIPMOVHISRENFIX = ''OPE'' ' +
                                           '   AND HISTRENFIX.IDINVESTIMENTO = ' + DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsString +
                                           '   AND HISTRENFIX.IDOPERRENFIXAPLIC = ' + DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsString +
                                           '   AND HISTRENFIX.DATAHISTRENFIX > TO_DATE('''+ DateToStr(dDataAniv) +''',''DD/MM/YYYY'') '+
                                           '   AND HISTRENFIX.DATAHISTRENFIX <= TO_DATE('''+ DateToStr(DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime) +''',''DD/MM/YYYY'')' +
                                           '   AND HISTRENFIX.NATURMOVHISTRENFI = ''D'' ';
            DMRendaFixa.qryAux.Open;
            fQtdResg := DMRendaFixa.qryAux.FieldByName('QTDHISTRENFIX').AsFloat;
            fVlrResg := DMRendaFixa.qryAux.FieldByName('VLRHISTRENFIX').AsFloat;
         finally
            DMRendaFixa.qryAux.Close;
         end;

         fQtdFinal := (DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('SALDOQTDHISTRENFI').AsFloat - fQtdResg -
                       DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat);
         fQtdFinal := OperComum.Round(fQtdFinal,5);
         fVlrFinal := DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('SALDOVLRHISTRENFI').AsFloat - fVlrResg -
                      DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat + fLucPre;
         //AL_37 Fim
      end
      else
      begin
         fQtdFinal := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat -
                      DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat;
         fVlrFinal := (DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOVLRHISTRENFI').AsFloat -
                       DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat) + fLucPre;
      end;

      // AL_68
      // Verifica se existem resgates futuros nesta aplicação
      // O Método já gera uma Exceção caso o saldo passado seja insuficiente
         //AL_103
      SomaResgatesFuturos(DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                          DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                          iOperacao,
                          DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                          fQtdFinal);

      //AL_100 - Ajuste no processo
      if fraFrame <> nil then
      begin
         fraFrame.Pos := 0;
         fraFrame.Mes := 'Gravando Histórico';
      end;
      // Grava o Histórico
      if not RendaFixa.GravaHistRenfix(iIdHistRenFix,
                       DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                       iOperacao,
                       DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                       DMRendaFixa.qrySelOperRenFix.FieldByName('IDCARTEIRAINVEST').AsInteger,
                       DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger,
                       DMRendaFixa.qrySelOperRenFix.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                       -1,
                       -1,
                       DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                       DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat,
                       fQtdFinal,
                       DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat,
                       fVlrFinal,
                       'OPE',
                       DMRendaFixa.qrySelOperRenFix.FieldByName('NATUREZAOPERACAO').AsString,
                       sHistorico,
                       False,-1,-1,sFlgRecalc,
                       //AL_68
                       DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXORIG').AsInteger) then
         Raise Exception.Create('Não foi Possível Incluir um Histórico para esta Operação');


      if fQtdFinal = 0 then
      begin
         // Resgate TOTAL
         //AL_9
         if not LancaItensHistResgTot(iIdHistRenFix,DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger,
                                      iFlgGeraContab,iFlgGeraCapCar,
                                      iIdForCli ,
                                      iTipoDoc,
                                      DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                                      DMRendaFixa.qrySelOperRenFix.FieldByName('VENCOPERACAO').AsDateTime,
                                      //AL_66
                                      dDataLiq,
                                      sHistorico,
                                      fEmolumentos,fCorretagem, fVlrOperacao,
                                      iPlanilha,iDocumento,
                                      fPUAtu,
                                      fLucPre,
                                      iUsuarioOrigem,
                                      fraFrame,
                                      flgContaInvest) then
            Raise Exception.Create('Não foi possível calcular os Itens desta Operação')
         else
         begin
            // Verifica se foi gerado contabilização e Atualiza a OperRenFix
            //AL_85
            //AL_100 - Utilização do Objeto CtrlPInv
            //AL_103
            if CtrlPInv.IntFinContabRF = 'S' then
            begin
               if iPlanilha > 0 then
               begin
                  //AL_100 - Ini - Ajuste no processo
                  if (iFlgGeraCapCar = 1) and (iDocumento <= 0) then
                     Raise Exception.Create('Não foi lançado o financeiro desta operação');

                  if not RendaFixa.GravaPlanDoc('OPE', iOperacao, iIdHistRenFix,
                                                iPlanilha, iDocumento, sMens, False) then
                     Raise Exception.Create(sMens);
                  //AL_100 - Fim - Ajuste no processo
               end
               else if iPlanilha = -1 then
                  Raise Exception.Create('A operação não foi contabilizada');
            end;
         end;
      end
      else
      begin
         // Resgate PARCIAL
         //AL_9
         if not LancaItensHistResgParcial(iIdHistRenFix,DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger,
                                          iFlgGeraContab,iFlgGeraCapCar,
                                          iIdForCli,
                                          iTipoDoc,
                                          DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                                          DMRendaFixa.qrySelOperRenFix.FieldByName('VENCOPERACAO').AsDateTime,
                                          //AL_66
                                          dDataLiq,
                                          sHistorico,
                                          fEmolumentos,fCorretagem, fVlrOperacao,
                                          iPlanilha,iDocumento,
                                          fPUAtu, fLucPre, -1, fraFrame,
                                          flgContaInvest) then
            Raise Exception.Create('Não foi possível calcular os Itens desta Operação')
         else
         begin
            // Verifica se foi gerado contabilização e Atualiza a OperRenFix
            //AL_85
            //AL_100 - Utilização do Objeto CtrlPInv
            //AL_103
            if CtrlPInv.IntFinContabRF = 'S' then
            begin
               if iPlanilha > 0 then
               begin
                  //AL_100 - Ini - Ajuste no processo
                  if (iFlgGeraCapCar = 1) and (iDocumento <= 0) then
                     Raise Exception.Create('Não foi lançado o financeiro desta operação');

                  if not RendaFixa.GravaPlanDoc('OPE', iOperacao, iIdHistRenFix,
                                                iPlanilha, iDocumento, sMens, False) then
                     Raise Exception.Create(sMens);
                  //AL_100 - Fim
               end
               else if iPlanilha = -1 then
                  Raise Exception.Create('A operação não foi contabilizada');
            end;
         end;
      end;
      //AL_100 - Fim
      Result := True;
   finally
      FechaBuscaOperacao;
   end;
end;

//-------------------------------------------------------------------------------------------
//AL_52
// Pontera a query qrySelOperRenFix que por sua vez busca seus items na qrySelOperRenFixItens
function TRendaFixa.BuscaOperacao(iOperacao: Integer; iInvestimento : Integer = -1): Boolean;
begin
   //AL_103
   OperComum.LimpaParametros(DMRendaFixa.qrySelOperRenFix);
   //AL_52 Ini
   if iOperacao <> -1 then
      DMRendaFixa.qrySelOperRenFix.ParamByName('IDOPERRENFIX').AsInteger := iOperacao;
   if iInvestimento <> -1 then
      DMRendaFixa.qrySelOperRenFix.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
   //AL_52 Fim
   DMRendaFixa.qrySelOperRenFix.Open;
end;


function TRendaFixa.AtuFinanceiroHist(iIdHistRenFix: Integer; fValor, fSaldo: Double): boolean;
begin
   //AL_103
   Result := False;
   OperComum.LimpaParametros(DMRendaFixa.qryUpdFinanceiroHist, True);
   DMRendaFixa.qryUpdFinanceiroHist.ParamByName('IDHISTRENFIX').AsInteger := iIdHistRenFix;
   DMRendaFixa.qryUpdFinanceiroHist.ParamByName('VLRHISTRENFIX').AsFloat := fValor;
   DMRendaFixa.qryUpdFinanceiroHist.ParamByName('SALDOVLRHISTRENFI').AsFloat := fSaldo;
   DMRendaFixa.qryUpdFinanceiroHist.ExecSQL;
   Result := True;
end;

function TRendaFixa.AbrePadrLancRF(iSegmentacao: integer; dDataProc: TDateTime; iEmpresaProp, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira,
                                    iClasseTit, iItemRenFix: integer):integer;
begin
   Result := 0;
   OperComum.LimpaParametros(DMRendaFixa.qryPadrLancRF);
   DMRendaFixa.qryPadrLancRF.ParamByName('EMPRESAPROP').AsInteger   := iEmpresaProp;
   DMRendaFixa.qryPadrLancRF.ParamByName('TIPOINVEST').AsInteger    := iTipoInvest;
   DMRendaFixa.qryPadrLancRF.ParamByName('SEGMENTACAO').AsInteger    := iSegmentacao;
   DMRendaFixa.qryPadrLancRF.ParamByName('DATAVIGENCIA').AsString   := DateToStr(dDataProc);

   if iTipoOperacao <> 0 then
      DMRendaFixa.qryPadrLancRF.ParamByName('TIPOOERACAO').AsInteger   := iTipoOperacao;
   if iCarteira <> -1 then
      DMRendaFixa.qryPadrLancRF.ParamByName('CARTEIRA').AsInteger      := iCarteira;
   if iInvestimento <> -1 then
      DMRendaFixa.qryPadrLancRF.ParamByName('INVESTIMENTO').AsInteger  := iInvestimento;
   if iClasseTit <> -1 then
      DMRendaFixa.qryPadrLancRF.ParamByName('IDCLASSETIT').AsInteger   := iClasseTit;
   //AL_68
   if iItemRenFix <> 0 then
      DMRendaFixa.qryPadrLancRF.ParamByName('IDITEMRENFIX').AsInteger  := iItemRenFix;
   DMRendaFixa.qryPadrLancRF.Open;
   if not DMRendaFixa.qryPadrLancRF.IsEmpty then
      Result := 1;
end;

function TRendaFixa.BuscaPadrLancRF(iSegmentacao: Integer; dDataProc: TDateTime; iEmpresaProp, iTipoInvest, iTipoOperacao, iInvestimento,
                                    iCarteira, iClasseTit, iItemRenFix : integer;
                                    fValor: double; var iPlano, iSubContaDeb, iSubContaCred,
                                    iUnidNegoc: integer; var sContaDeb, sContaCred,
                                    sCentroCustoDeb, sCentroCustoCred, sCentroRespon,
                                    sTipoRecDes, sTipoPer, sHistoricoOper, sRecPagNao: string;
                                    sTipoItem: String = ''): boolean;
begin
    Result := False;

    // Correção Negativa
    if (iItemRenFix > 0) and (sTipoItem = 'M') and (fValor < 0)then
       iItemRenFix := -16;

    // Prejuízo não inverte as contas
    if iItemRenFix = -10 then
       fValor := Abs(fValor);

    try
      //AL_103 - Ini - Utilização da propriedade com o nº de registros da query aberta
      // 1º Passo: Todos os parâmetros
      // TipoInvest + TipoOperacao + Carteira + Investimento + ClasseTit + ItemRenFix(caso mais detalhado)
      if ( (iCarteira > 0) and (iInvestimento > 0) and (iClasseTit > 0 )) then
      begin
         RendaFixa.AbrePadrLancRF(iSegmentacao, dDataProc, iEmpresaProp, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira,
                                iClasseTit, iItemRenFix);
         // Erro: ambigüidade no Padrão de Lançamento
         if DMRendaFixa.PadrLancRFRecNo > 1 then
//         if DMRendaFixa.qryPadrLancRF.RecordCount > 1 then
         begin
            MsgDlg('Atenção : Foi encontrado ambigüidade no '#13+
                   'padrão de lançamento contábil da operação!','Mensagem do Sistema ',mtWarning,[mbOK],0);
            Exit;
         end
         else if DMRendaFixa.PadrLancRFRecNo = 1 then
//         else if DMRendaFixa.qryPadrLancRF.RecordCount = 1 then
            Result := True;
      end;

      // 2º Passo: Todos os parâmetros menos Carteira
      // TipoInvest + TipoOperacao + Investimento + ClasseTit + ItemRenFix
      if ( (Result = False) and (iInvestimento > 0) and (iClasseTit > 0 )) then
      begin

         RendaFixa.AbrePadrLancRF(iSegmentacao, dDataProc, iEmpresaProp, iTipoInvest, iTipoOperacao, iInvestimento, -1,
                                iClasseTit, iItemRenFix);
         // Erro: ambigüidade no Padrão de Lançamento
         if DMRendaFixa.PadrLancRFRecNo > 1 then
//         if DMRendaFixa.qryPadrLancRF.RecordCount > 1 then
         begin
            MsgDlg('Atenção : Foi encontrado ambigüidade no '#13+
                   'padrão de lançamento contábil da operação!','Mensagem do Sistema ',mtWarning,[mbOK],0);
            Exit;
         end
         else if DMRendaFixa.PadrLancRFRecNo = 1 then
//         else if DMRendaFixa.qryPadrLancRF.RecordCount = 1 then
            Result := True;
      end;

      // 3º Passo: Todos os parâmetros menos Investimento
      // TipoInvest + TipoOperacao + Carteira  + ClasseTit + ItemRenFix
      if ( (Result = False) and (iCarteira > 0) and (iClasseTit > 0 )) then
      begin

         RendaFixa.AbrePadrLancRF(iSegmentacao, dDataProc, iEmpresaProp, iTipoInvest, iTipoOperacao, -1, iCarteira,
                                iClasseTit, iItemRenFix);
         // Erro: ambigüidade no Padrão de Lançamento
         if DMRendaFixa.PadrLancRFRecNo > 1 then
//         if DMRendaFixa.qryPadrLancRF.RecordCount > 1 then
         begin
            MsgDlg('Atenção : Foi encontrado ambigüidade no '#13+
                   'padrão de lançamento contábil da operação!','Mensagem do Sistema ',mtWarning,[mbOK],0);
            Exit;
         end
         else if DMRendaFixa.PadrLancRFRecNo = 1 then
//         else if DMRendaFixa.qryPadrLancRF.RecordCount = 1 then
            Result := True;
      end;

      // 4º Passo: Todos os parâmetros menos ClasseTit
      // TipoInvest + TipoOperacao + Carteira + Investimento + ItemRenFix
      if ( (Result = False) and (iCarteira > 0) and (iInvestimento > 0)) then
      begin
         RendaFixa.AbrePadrLancRF(iSegmentacao, dDataProc, iEmpresaProp, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira,
                                -1, iItemRenFix);
         // Erro: ambigüidade no Padrão de Lançamento
         if DMRendaFixa.PadrLancRFRecNo > 1 then
//         if DMRendaFixa.qryPadrLancRF.RecordCount > 1 then
         begin
            MsgDlg('Atenção : Foi encontrado ambigüidade no '#13+
                   'padrão de lançamento contábil da operação!','Mensagem do Sistema ',mtWarning,[mbOK],0);
            Exit;
         end
         else if DMRendaFixa.PadrLancRFRecNo = 1 then
//         else if DMRendaFixa.qryPadrLancRF.RecordCount = 1 then
            Result := True;
      end;

      // 5º Passo: Todos os parâmetros menos Carteira e Investimento
      // TipoInvest + TipoOperacao + ClasseTit + ItemRenFix
      if ( (Result = False) and (iClasseTit > 0 ) ) then
      begin

         RendaFixa.AbrePadrLancRF(iSegmentacao, dDataProc, iEmpresaProp, iTipoInvest, iTipoOperacao, -1, -1,
                                iClasseTit, iItemRenFix);
         // Erro: ambigüidade no Padrão de Lançamento
         if DMRendaFixa.PadrLancRFRecNo > 1 then
//         if DMRendaFixa.qryPadrLancRF.RecordCount > 1 then
         begin
            MsgDlg('Atenção : Foi encontrado ambigüidade no '#13+
                   'padrão de lançamento contábil da operação!','Mensagem do Sistema ',mtWarning,[mbOK],0);
            Exit;
         end
         else if DMRendaFixa.PadrLancRFRecNo = 1 then
//         else if DMRendaFixa.qryPadrLancRF.RecordCount = 1 then
            Result := True;
      end;

      // 6º Passo: Todos os parâmetros menos Carteira e ClasseTit
      // TipoInvest + TipoOperacao + Investimento + ItemRenFix
      if ( (Result = False) and (iInvestimento > 0) ) then
      begin

         RendaFixa.AbrePadrLancRF(iSegmentacao, dDataProc, iEmpresaProp, iTipoInvest, iTipoOperacao, iInvestimento, -1,
                                -1, iItemRenFix);
         // Erro: ambigüidade no Padrão de Lançamento
         if DMRendaFixa.PadrLancRFRecNo > 1 then
//         if DMRendaFixa.qryPadrLancRF.RecordCount > 1 then
         begin
            MsgDlg('Atenção : Foi encontrado ambigüidade no '#13+
                   'padrão de lançamento contábil da operação!','Mensagem do Sistema ',mtWarning,[mbOK],0);
            Exit;
         end
         else if DMRendaFixa.PadrLancRFRecNo = 1 then
//         else if DMRendaFixa.qryPadrLancRF.RecordCount = 1 then
            Result := True;
      end;

      // Resultado da Busca
      if Result = True then  // Encontrou algum padrao
      begin
         // verifica se agora foi encontrado algum Padrão de Lançamento
         if ( (DMRendaFixa.qryPadrLancRF.Active) and not(DMRendaFixa.qryPadrLancRF.isEmpty) ) then
         begin
            iPlano            := DMRendaFixa.qryPadrLancRF.FieldByName('PLANO').AsInteger;
            // se o valor da Operação for negativo, inverte as contas
            //      somente se não for o item Correção Negativa (-16)
            if (fValor > 0) or ((fValor < 0) and (iItemRenFix = -16)) then begin
               sContaDeb      := DMRendaFixa.qryPadrLancRF.FieldByName('CONTADOPERFIN').AsString;
               sContaCred     := DMRendaFixa.qryPadrLancRF.FieldByName('CONTACOPERFIN').AsString;
            end else begin
               sContaDeb      := DMRendaFixa.qryPadrLancRF.FieldByName('CONTACOPERFIN').AsString;
               sContaCred     := DMRendaFixa.qryPadrLancRF.FieldByName('CONTADOPERFIN').AsString;
            end;

            // Centro de Custo
            if DMRendaFixa.qryPadrLancRF.FieldByName('CENCUSTDINVEST').IsNull then begin
               sCentroCustoDeb   := '';
            end else begin
               sCentroCustoDeb   := DMRendaFixa.qryPadrLancRF.FieldByName('CENCUSTDINVEST').AsString;
            end;
            if DMRendaFixa.qryPadrLancRF.FieldByName('CENCUSTCINVEST').IsNull then begin
               sCentroCustoCred  := '';
            end else begin
               sCentroCustoCred  := DMRendaFixa.qryPadrLancRF.FieldByName('CENCUSTCINVEST').AsString;
            end;

            // Sub-Conta
            if DMRendaFixa.qryPadrLancRF.FieldByName('CODSUBCONTAD').IsNull then begin
               iSubContaDeb      := -1;
            end else begin
               iSubContaDeb      := DMRendaFixa.qryPadrLancRF.FieldByName('CODSUBCONTAD').AsInteger;
            end;
            if DMRendaFixa.qryPadrLancRF.FieldByName('CODSUBCONTAC').IsNull then begin
               iSubContaCred     := -1;
            end else begin
               iSubContaCred     := DMRendaFixa.qryPadrLancRF.FieldByName('CODSUBCONTAC').AsInteger;
            end;

            // Unidade de Negócio ou "Atividade/Projeto"
            if DMRendaFixa.qryPadrLancRF.FieldByName('UNIDNEGOC').IsNull then begin
               iUnidNegoc        := -1;
            end else begin
               iUnidNegoc        := DMRendaFixa.qryPadrLancRF.FieldByName('UNIDNEGOC').AsInteger;
            end;

            // Centro de Responsabilidade
            if DMRendaFixa.qryPadrLancRF.FieldByName('CODCENTRORESPON').IsNull then begin
               sCentroRespon     := '';
            end else begin
               sCentroRespon     := DMRendaFixa.qryPadrLancRF.FieldByName('CODCENTRORESPON').AsString;
            end;

            // Tipo de Recebimento/Desembolso
            if DMRendaFixa.qryPadrLancRF.FieldByName('CODTIPRECDES').IsNull then begin
               sTipoRecDes       := '';
            end else begin
               sTipoRecDes       := DMRendaFixa.qryPadrLancRF.FieldByName('CODTIPRECDES').AsString;
            end;

            // Tipo de Operacao
            if DMRendaFixa.qryPadrLancRF.FieldByName('TIPCODIGO').IsNull then begin
               sTipoPer          := '';
            end else begin
               sTipoPer          := DMRendaFixa.qryPadrLancRF.FieldByName('TIPCODIGO').AsString;
            end;

            sHistoricoOper       := DMRendaFixa.qryPadrLancRF.FieldByName('HISTLANCINVEST').AsString;
            sRecPagNao           := DMRendaFixa.qryPadrLancRF.FieldByName('FLGPAGRECNAO').AsString;

         end
         else
         begin
            MsgDlg('Atenção : Não foi encontrado o padrão de lançamento '#13+
                   'contábil da operação ','Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   finally
      DMRendaFixa.qryPadrLancRF.Close;
   end;
end;

//AL_9
//AL_69
function TRendaFixa.IntegraCapCarRendaFixa(fPUItem,fVlrOperacao:Double;iForCli, iPlano, iTipoDoc,iUnidNegoc,iSubContaCred,iPlanilha,
                                           //AL_60
                                           iPlanoPatro : integer;
                                           sRecPagNao,sTipoRecDes,sContaDeb, sContaCred,sCentroCustoCred,
                                           sDataLanc,sDataVenc,sCentroRespon,sHistorico : string;
                                           var iDocumento : integer; iUsuarioOrigem: Integer = -1;
                                           flgContaInvest : integer = 0;
                                           iClasseTit : Integer = -1;
                                           bFinalizaDoc: Boolean = False): boolean;
var
   sMensErro,sModulo,sPlano,sComplemento,sStatus,sOperacao,sContaDoc,sIdEmpresa,sDebCre : string;
   iPortador,iNumFatura,iNumLancamento : integer;
   fNoDocumento : Double;
   //AL_60
   wQryAux : TwwQuery;
begin

  bFinalizaDoc:=False;
   // AL_38 - Reformulando a rotina

   if iUsuarioOrigem = -1 then
      iUsuarioOrigem := Sistema.IdUsuario;

   Result := False;

   fPUItem := abs(fPUItem);

   if Trim(sRecPagNao) = '' then
      Raise Exception.Create('Tipo de Recebimento/Desembolso não especificado.');

   // O Item não tem lançamento Financeiro - Alteração para poupança bloqueada 29/05/2003
   if Trim(sRecPagNao) = 'N' then
      Exit;

   if Trim(sTipoRecDes) = '' then
      Raise Exception.Create('Tipo de Recebimento/Desembolso não especificado.');

   sOperacao      := '2';

   //AL_60
   Try
      // Novo método em 3 camadas
      //AL_69
      if not CtrlInvContab.TestaPeriodo(sDataLanc, iTipoInvestUsu) then
         Raise Exception.Create(CtrlInvContab.MessageInfo);

      //AL_95 - Ini
      if iDocumento = -1 then
      begin
         // Gera o identificador incremental da tabela DOCUMENTO
         if CtrlInvContab.Documento.GetDocSequence then
            iDocumento := CtrlInvContab.Documento.CodDocumento;

         // Prepara um novo documento
         CtrlInvContab.Documento.Prepare;

         iPortador         := -1;
         CtrlInvContab.Documento.GetNoDocumento;
         fNoDocumento := CtrlInvContab.Documento.NoDocumento;

         sPlano            := IntToStr(iPlano);
         sComplemento      := '79';
         sStatus           := '';
         iNumFatura        := 0;

         if sRecPagNao[1] = 'P' then
            sContaDoc := sContaCred
         else
            sContaDoc := sContaDeb;

         //AL_60_Ini
         wQryAux := TwwQuery.Create(Application);
         wQryAux.DatabaseName := 'BaseDados';
         wQryAux.Close;
         wQryAux.SQL.Clear;
         wQryAux.SQL.Add('SELECT PL.NOME AS PLANO,PE.NOME AS PATRO, PA.IDPATRO, PA.IDPLANOPREV ');
         wQryAux.SQL.Add('FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL ');
         wQryAux.SQL.Add('WHERE (PA.IDPLANPREVCTBPATR = '''+IntToStr(iPlanoPatro)+''') ');
         wQryAux.SQL.Add('  AND (PA.IDPATRO = PE.IDPESSOA) ');
         wQryAux.SQL.Add('  AND (PA.IDPLANOPREV = PL.IDPLANOPREV)');
         wQryAux.Open;

         // Parametros para a Segregação
         CtrlInvContab.Plano := iPlano;
         CtrlInvContab.Patro := wQryAux.FieldByName('IDPATRO').AsInteger;
         CtrlInvContab.PlanPrev := wQryAux.FieldByName('IDPLANOPREV').AsInteger;

         // Cria Documento
         //AL_100 - Utilização do Objeto CtrlPInv
         if not CtrlInvContab.Documento.SetValues(iDocumento,
                                                  fNoDocumento,
                                                  sComplemento, sStatus, sRecPagNao[1], sOperacao,
                                                  '' {sNumslip}, ''{sNumleitcodbarras}, sContaDoc, sCentroCustoCred,
                                                  ''{sNossonumero}, ''{sNumdigcodbarras}, ''{sGrupodoc}, ''{sFlgemitelancbaix},
                                                  ''{sFlgconfirmarecpag}, ''{sEmisbloq}, ''{sReferencia}, ''{sObs},
                                                  StrToDate(sDataVenc) {dDatavencto}, StrToDate(sDataLanc) {dDataemissao},
                                                  StrToDate(sDataVenc) {dDataprogramada}, 0{dDataremessa}, 0{dDatalimite}, 0{dDatacorrecao},
                                                  0{rVlrmulta}, 0{rValorjuros}, 0{rValordesconto}, 0{rPercjurossimples}, 0{rPercjurosatuarial},
                                                  iTipoDoc, Sistema.idEmpresa, 79 {iModuloOrigem}, iForCli, iNumFatura,
                                                  0{liIdcbancaria}, iUnidNegoc, iPlano, 0{liNumcpbaixa}, 0{liNumapgr},
                                                  CtrlPInv.MoeCodigo, 0{liLotetransmissao}, -1{liIndicecorrecao},
                                                  Sistema.idUsuario, Sistema.idEmpresa, 1{liFlgnaoconciliado}, 0{liControleremessa},
                                                  iSubContaCred, iPortador,
                                                  0{liCodgrupocnab}, 0{liCodgeradorinss}, -1{liCodforma},
                                                  StrToDate(sDataVenc) {dDataDisp},
                                                  CtrlInvContab.CriterioSegregacao {iIdSegregaCriter: integer = -1}) then
            Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

         CtrlInvContab.Documento.ContaInvest := flgContaInvest;

         if sRecPagNao <> 'N' then
         begin
            // Cria Rateio
            //AL_100 - Utilização do Objeto CtrlPInv
            if not CtrlInvContab.Documento.RateioDocumSetValues(
                                 fPUItem, 0{rValorOM}, 0{rVlrresorcamen}, 0{liIdrateiodocum},
                                 Sistema.idEmpresa {liIdpessoa},
                                 iDocumento, iUnidNegoc, 0{liMoecodigo}, iUsuarioOrigem,
                                 0{liIdreservaorcamen}, iPlano,
                                 wQryAux.FieldByName('IDPLANOPREV').AsInteger,
                                 wQryAux.FieldByName('IDPATRO').AsInteger,
                                 CtrlPInv.IdPrograma, 0{liIdprocesso}, Sistema.idEmpresa,
                                 sTipoRecDes, sRecPagNao[1], sCentroRespon,
                                 sCentroCustoCred, ''{sNumimovel}) then
               Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

            // AL_62
         end;
         //AL_60_Fim

         //AL_100
         if ((CtrlInvContab.Documento.DocumentoPendente) and (fPUItem <> 0)) then
         begin
            if sRecPagNao[1] = 'P' then
               sDebCre := 'C'
            else
               sDebCre := 'D';

            if fVlrOperacao <> 0 then // Valor da Operação quando Resgate
               fPUItem := fVlrOperacao;

            // Cria LanctoDocum em 3 camadas
            if not CtrlInvContab.Documento.LancoDocumSetValues(
                                 StrToDate(sDataLanc), iDocumento, 0 {iNumLancamento},
                                 fPUItem, 0{rValorOM}, fPUItem,
                                 iUnidNegoc, CtrlInvContab.Planilha, 0{liNumlotemanual},
                                 Sistema.idUsuario, Sistema.idEmpresa,
                                 0{liIdnflivro}, 0{liEstorno}, iTipoDoc, 0{liCoddocinss}, 0{liCodalterador},
                                 sOperacao,  ''{sNumrecibo}, ''{sNumnf}, ''{sNumfatura},
                                 sHistorico, ''{sFlgtipofatura}, ''{sFlgrecebeunf}, ''{sFlgfatemitida},
                                 sDebCre, Sistema.IdModulo, iPlano,
                                 Sistema.UsaPlanoPatro) then
               Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

            //AL_100 - O Documento é finalizado em método próprio
            //if bFinalizaDoc then
//               iDocumento := FinalizaCapCar;
         end;
      end
      else if iDocumento > 0 then
      begin
         if sRecPagNao <> 'N' then
         begin
            // Cria Rateio
            //AL_100 - Utilização do Objeto CtrlPInv
            if not CtrlInvContab.Documento.RateioDocumSetValues(
                                 fPUItem, 0{rValorOM}, 0{rVlrresorcamen}, 0{liIdrateiodocum},
                                 Sistema.idEmpresa {liIdpessoa},
                                 iDocumento, iUnidNegoc, 0{liMoecodigo}, iUsuarioOrigem,
                                 0{liIdreservaorcamen}, iPlano,
                                 CtrlInvContab.PlanPrev, //wQryAux.FieldByName('IDPLANOPREV').AsInteger,
                                 CtrlInvContab.Patro, // wQryAux.FieldByName('IDPATRO').AsInteger,
                                 CtrlPInv.IdPrograma, 0{liIdprocesso}, Sistema.idEmpresa,
                                 sTipoRecDes, sRecPagNao[1], sCentroRespon,
                                 sCentroCustoCred, ''{sNumimovel}) then
               Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
         end;
      end;

      //AL_95 - Fim
      Result := True;   //Thiago Passos SOL 123324 Kintana 615338 19/08/2009
      //CtrlInvContab.Documento.Insert; // SOL119592 KINTANA 569491 THIAGO PASSOS
      //AL_38 - Fim
   //AL_60
   Finally
      // AL_62
      if wQryAux <> nil then
      begin
         //AL_103
         wQryAux.Close;
         FreeAndNil(wQryAux);
      end;
   end;
end;

// AL_38 - Remodelagem da rotina utilizando o teste de período contábil em 3 camadas
//AL_9
//AL_66
function TRendaFixa.IntegraContabCapCar(iIdHistRenFix,iInvestimento,iTipoOperacao,iCarteiraInvest,iClasseTit,iItemRenFix,
                                        iFlgGeraContab,iFlgGeraCapCar,iForCli,iTipoDoc,iPlanoPatro:integer;
                                        sCurvaContabil,sDescInvestimento, sHistorico : string;
                                        fValor,fEmolumentos,fCorretagem : Double;
                                        dDataProc,dDataVenc, dDataLiq : TDateTime;
                                        var iPlanilha,iDocumento :integer;
                                        iUsuarioOrigem: Integer = -1; sOper : string = '';iCurvaRenfix : Integer = -1;
                                        flgContaInvest : Integer = 0;
                                        bFinalizaDoc: Boolean = False):boolean;
var
    iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc,iIdPlano: integer;
    sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred, sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper,
    sRecPagNao: string;
   //AL_69
   wQryAux : TwwQuery;
begin
   //AL_69
   Try // Finally
      //AL_69
      wQryAux := TwwQuery.Create(Application);
      wQryAux.DatabaseName := 'BaseDados';
      if FazContabilizacao(iFlgGeraContab,iInvestimento,iCurvaRenfix,sOper) then
      begin
         Result := False;

         //AL_61
         //AL_100 - Usa o Obj CtrlPInv
         if CtrlPInv.FlgRegimeCxComp = 'S' then //Se utiliza Regime de Caixa e nâo de Competência
            dDataProc := dDataVenc;

         if RendaFixa.BuscaPadrLancRF(RetornaSegmentacaoRF(iInvestimento,iIdHistRenFix),  //Renan CGPC28
                                      dDataProc, Sistema.IdEmpresa,
                                      1,
                                      iTipoOperacao,
                                      iInvestimento,
                                      iCarteiraInvest,
                                      iClasseTit,
                                      iItemRenFix,
                                      fValor,
                                      iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc,
                                      sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
                                      sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper,sRecPagNao) then
         begin
            // Achou um padrão contábil -> recebe -2 para não derrubar o processamento
            if iPlanilha < 0 then
               iPlanilha := -2;

            if fValor <> 0 then
            begin
               // Passa a testar o período antes de lançar (3 camadas)
               //AL_69
               wQryAux.SQL.Clear;
               wQryAux.SQL.Add('SELECT INVESTIMENTO.IDCLASSETIT ');
               wQryAux.SQL.Add('FROM INVESTIMENTO ');
               wQryAux.SQL.Add('WHERE INVESTIMENTO.IDINVESTIMENTO = ' + IntToStr(iInvestimento));
               wQryAux.Open;

               if not CtrlInvContab.TestaPeriodo(DateToStr(dDataProc),
                                                 //AL_69
                                                 1, -1, wQryAux.FieldByName('IDCLASSETIT').AsInteger) then
                  Raise Exception.Create(CtrlInvContab.MessageInfo);
               //AL_68
               //AL_77
               //AL_98
               if (iTipoOperacao = -97) or (iTipoOperacao = -98) then // Transferência entre Planos
                  sHistorico := sHistoricoOper + ' - ' + sDescInvestimento
               else
                  sHistorico := sHistoricoOper + ' - ' + sHistorico;

               if not RendaFixa.ContabilizaRendaFixa(fValor, iPlano, iForCli,iUnidNegoc,iSubContaDeb, iSubContaCred,
                                                     iPlanoPatro,
                                                     sHistorico, sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
                                                     sTipoPer,sRecPagNao,dDataProc, iPlanilha, iUsuarioOrigem,
                                                     //AL_69
                                                     wQryAux.FieldByName('IDCLASSETIT').AsInteger)  then
                  Raise Exception.Create('Não foi possível efetuar a contabilização do item.');

               // Integra Financeiro ( Testar pelo tipo de operacao = OPE)
               //AL_67
               //AL_100 - Utilização do Objeto
               if (iFlgGeraCapCar = 1) and (CtrlPInv.FlgIntCapCar = 'S') and
                  ((Trim(sRecPagNao) = 'R') or (Trim(sRecPagNao) = 'P'))then
               begin
                  if iItemRenFix = -1 then // Valor Principal
                     fValor := fValor - fEmolumentos - fCorretagem;
                  //AL_9
                  //AL_69
                  //AL_100
                  if not RendaFixa.IntegraCapCarRendaFixa(fValor,0,iForCli, iPlano, iTipoDoc,iUnidNegoc,iSubContaCred,iPlanilha,
                                                          //AL_60
                                                          iPlanoPatro,
                                                          sRecPagNao,sTipoRecDes,sContaDeb, sContaCred,sCentroCustoCred,
                                                          DateToStr(dDataProc),
                                                          //AL_66
                                                          DateToStr(dDataLiq),sCentroRespon,sHistorico,
                                                          iDocumento, iUsuarioOrigem,
                                                          flgContaInvest,
                                                          //AL_69
                                                          wQryAux.FieldByName('IDCLASSETIT').AsInteger,
                                                          bFinalizaDoc) then
                     Raise Exception.Create('Não foi possível fazer a integração financeira do item.');
               end;

               // Terminando corretamente;
               Result := True;
            end;
         end;
      end
      else
         Result := True;
   //AL_69
   Finally
      wQryAux.Close;
      FreeAndNil(wQryAux);
   end;
end;
// AL_38 - Fim

function TRendaFixa.AlteraDataFechRF(dData: TDateTime): Boolean;
begin
   //AL_103
   Result := False;
   OperComum.LimpaParametros(DMRendaFixa.qryUpdParamInvest);
   DMRendaFixa.qryUpdParamInvest.ParamByName('DATAULTFECHRF').AsDateTime := dData;
   DMRendaFixa.qryUpdParamInvest.ExecSql;
   CtrlPInv.GetParamsInvest(CtrlPInv.IDEmpresa);
   Result := True;
end;

function TRendaFixa.MontaHistorico(sNatOper,sSiglaOper,sDescOper,sDescInv: String): String;
begin
   if sNatOper = 'N' then  // Atualização
      Result := Copy('ATUALIZAÇÃO - ' + Trim(sDescInv),1,60)
   else                    // Operação
      Result := Copy(Trim(sDescOper) + ' / ' + Trim(sDescInv),1,60);

end;

//AL_9
function TRendaFixa.RefazOperacoes(iFlgGeraContab, iOper: Integer; dDataAniv:TDateTime;
                                   fEmolumentos,fCorretagem : Double;
                                   var iPlanilha, iDocumento : integer;
                                   flgContaInvest : integer = 0): String;
var iIdHistRenFix, iFazContabil: Integer;
    fQtdFinal, fVlrFinal, fPUAtu, fPuItem, fLucPrej: Double;
    sHistorico, sMens: String;
    iClasseTitAtu, iUsuarioOrigem: Integer;
    sInvestimento, sUsuarioOrigem: String;
    //AL_22
    wQryAux : TwwQuery;
    //AL_37
    fQtdResg, fVlrResg : Double;
    wQryAux1 : TwwQuery;
    //AL_68
    iIdOperRenFixOrig : Integer;
    //AL_72
    dDataSaldo : TDateTime;
    //AL_82
    fVlrOper : Double;
    //AL_83
    iIdHisRenfix : Integer;
    SldVlrTrcDia, SldQtdTrcDia : Double;
begin
   iIdHistRenFix  := LeUltRegistro(nil, 'HISTRENFIX');
   iPlanilha := -1;
   iDocumento := -1;
   iFazContabil := 0;
   fLucPrej := 0;

   BuscaOperacao(iOper);
   Result := '';

   //AL_29
   try // finally
      //AL_103
      //AL_22
      wQryAux := TwwQuery.Create(Application);
      wQryAux.DatabaseName := 'BaseDados';
      //AL_37
      wQryAux1 := TwwQuery.Create(Application);
      wQryAux1.DatabaseName := 'BaseDados';

      //AL_22
      wQryAux.SQL.Clear;
      wQryAux.SQL.Add('SELECT INVESTIMENTO.DESCINVESTIMENTO, INVESTIMENTO.IDCLASSETIT FROM INVESTIMENTO ' +
                      'WHERE  INVESTIMENTO.IDINVESTIMENTO = ' + DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsString);
      wQryAux.Open;
      sInvestimento := wQryAux.FieldByName('DESCINVESTIMENTO').AsString;
      iClasseTitAtu := wQryAux.FieldByName('IDCLASSETIT').AsInteger;
      wQryAux.Close;

      wQryAux.SQL.Clear;
      wQryAux.SQL.Add('SELECT OPERRENFIX.TRGUSERINCLUSAO FROM OPERRENFIX ' +
                      'WHERE OPERRENFIX.IDOPERRENFIX = ' + DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIX').AsString);
      wQryAux.Open;
      sUsuarioOrigem := wQryAux.FieldByName('TRGUSERINCLUSAO').AsString;
      sUsuarioOrigem := Copy(sUsuarioOrigem,3,Length(sUsuarioOrigem));
      iUsuarioOrigem := StrToInt(sUsuarioOrigem);
      wQryAux.Close;

      try
         sHistorico := MontaHistorico(DMRendaFixa.qrySelOperRenFix.FieldByName('NATUREZAOPERACAO').AsString,
                                      DMRendaFixa.qrySelOperRenFix.FieldByName('SIGLATIPOOPER').AsString,
                                      DMRendaFixa.qrySelOperRenFix.FieldByName('DESCTIPOOPERACAO').AsString,
                                      sInvestimento);

         // Se for operação de Transferência, Refaz os cálculos da própria Operação
         // pelo percentual, recalculando a quantidade e o valor da transferência
         //AL_68
         // AL_11
         // Aplicação
         if  ((DMRendaFixa.qrySelOperRenFix.FieldByName('NATUREZAOPERACAO').AsString = 'A')  or  // Aplicacao ou
              ((DMRendaFixa.qrySelOperRenFix.FieldByName('NATUREZAOPERACAO').AsString = 'D')  and  // Pagamento de Juros ,Amortização de Principal e Incorporação de Juros
               ((DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger  = -17)  or
                (DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger  = -18)  or
                (DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger  = -19)))) then
         begin
            fVlrFinal := DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat;
            //AL_82
            fQtdFinal := DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat;
            fVlrOper  := DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat;

            case DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger of
               -17, -18: // Pagamento de Juros e Amortização de Principal
               begin
                  // AL_4 - 06/07/2004 - TipoProc = 3
                  BuscaSaldosAux(DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                                 DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                                 DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger, 3);

                  fVlrFinal := DMRendaFixa.qryBuscaSaldosHistAux.FieldByName('SALDOVLRHISTRENFI').AsFloat - DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat;
               end;
               -19: // Incorporação de Juros
               begin
                  // AL_4 - 06/07/2004 - TipoProc = 3
                  BuscaSaldosAux(DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                                 DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                                 DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger, 3);

                  fVlrFinal := DMRendaFixa.qryBuscaSaldosHistAux.FieldByName('SALDOVLRHISTRENFI').AsFloat + DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat;
               end;
               //AL_82
               -166: // Penhora Juridico
               begin
                  BuscaSaldosAux(DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                                 DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                                 DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger, 3);
                  // Repete os Saldos
                  fVlrFinal := DMRendaFixa.qryBuscaSaldosHistAux.FieldByName('SALDOVLRHISTRENFI').AsFloat;
                  fQtdFinal := DMRendaFixa.qryBuscaSaldosHistAux.FieldByName('SALDOQTDHISTRENFI').AsFloat;
               end;
            end;

            //AL_68
            if DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXORIG').AsInteger = 0 then
               iIdOperRenFixOrig := DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger
            else
               iIdOperRenFixOrig := DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXORIG').AsInteger;

            //AL_68
            //AL_82
            if not GravaHistRenfix(iIdHistRenFix,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIX').AsInteger,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('IDPLANPREVCTBPATR').AsInteger {iPlanPrevCtbPatro},
                                   -1,-1,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat,
                                   fQtdFinal, //qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat,
                                   fVlrOper,  //qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat,
                                   fVlrFinal,
                                   OperComum.IIF(DMRendaFixa.qrySelOperRenFix.FieldByName('TIPOMOVTO').IsNull,'OPE', DMRendaFixa.qrySelOperRenFix.FieldByName('TIPOMOVTO').AsString),
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('NATUREZAOPERACAO').AsString,
                                   sHistorico,
                                   False, -1, -1, '',
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXORIG').AsInteger) then
                  Raise Exception.Create('Não foi Possível Incluir um Histórico para esta Operação');

            DMRendaFixa.qrySelOperRenFixItens.First;
            while not DMRendaFixa.qrySelOperRenFixItens.Eof do
            begin
               if DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger > 0 then
               begin    //Grava Items Positivos
                  fPuItem := 0;
                  case DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger of
                     -17, -18, -98: // Pagamento de Juros, Amortização de Principal ou Transferência
                     begin
                        //AL_17
                        if not GravaHistRenFixXItens(iIdHistRenFix,
                                                     DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDCURVARENFIX').AsInteger,
                                                     DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger,
                                                     DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDREGRA').AsInteger,
                                                     DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat {PUItem},
                                                     DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat {PUAcuItem},
                                                     DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat,
                                                     DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat) then
                           Raise Exception.Create('Erro ao Atualizar um Item de Histórico da Operação');
                     end
                     else
                     begin
                        //AL_82
                        if DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger <> -166 then
                        begin
                           if DMRendaFixa.qrySelOperRenFixItens.FieldByName('TIPOITEM').AsString = 'V' then
                           begin
                           //AL_17
                              if not GravaHistRenFixXItens(iIdHistRenFix,
                                                           DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDCURVARENFIX').AsInteger,
                                                           DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger,
                                                           DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDREGRA').AsInteger,
                                                           DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat {PUItem},
                                                           DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat {PUAcuItem},
                                                           DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat,
                                                           DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat) then
                                 Raise Exception.Create('Erro ao Atualizar um Item de Histórico da Operação');
                           end
                           else
                           begin
                              //AL_17
                              if not GravaHistRenFixXItens(iIdHistRenFix,
                                                           DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDCURVARENFIX').AsInteger,
                                                           DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger,
                                                           DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDREGRA').AsInteger,
                                                           0 {PUItem},
                                                           0 {PUAcuItem},
                                                           0,
                                                           0) then
                                 Raise Exception.Create('Erro ao Atualizar um Item de Histórico da Operação');
                           end;
                        end
                        else
                        begin
                           DMRendaFixa.qryBuscaSaldosItemsAux.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                                     VarArrayOf([DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDCURVARENFIX').AsInteger,
                                                                                 DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger]),
                                                                     []);
 
                           if not GravaHistRenFixXItens(iIdHistRenFix,
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDCURVARENFIX').AsInteger,
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger,
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDREGRA').AsInteger,
                                                        0 {PUItem},
                                                        DMRendaFixa.qryBuscaSaldosItemsAux.FieldByName('PUACUITEM').AsFloat {PUAcuItem},
                                                        0,
                                                        0) then
                              Raise Exception.Create('Erro ao Atualizar um Item de Histórico da Operação');
                        end;
                     end;
                  end;
               end
               else
               begin
                  fPuItem := DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat;
                  //AL_16 Ini
                  if ((CotaRenfix(DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                                  DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDCURVARENFIX').AsInteger)) and
                      ((DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger = -6) or
                       (DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger = -5)) and
                       //AL_82
                      (DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger <> -166) and
                      (DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger  = -17)) then  // Vlr Bruto da Oper de Pagto Juros de Título com Cotação
                  begin
                     fPUItem := DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat - DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat;

                     //AL_17
                     if not GravaHistRenFixXItens(iIdHistRenFix,
                                                  DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDCURVARENFIX').AsInteger,
                                                  DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger,
                                                  DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDREGRA').AsInteger,
                                                  fPUItem {PUItem},
                                                  fPUItem {PUAcuItem},
                                                  fPUItem,
                                                  fPUItem) then
                        Raise Exception.Create('Erro ao Atualizar um Item de Histórico da Operação');
                  end
                  else
                  begin
                     //AL_82
                     if DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger <> -166 then
                     begin
                        //AL_17
                        if not GravaHistRenFixXItens(iIdHistRenFix,
                                                     DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDCURVARENFIX').AsInteger,
                                                     DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger,
                                                     DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDREGRA').AsInteger,
                                                     DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat {PUItem},
                                                     DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat {PUAcuItem},
                                                     DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat,
                                                     DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat) then
                           Raise Exception.Create('Erro ao Atualizar um Item de Histórico da Operação');
                     end
                     else
                     begin
                        if ((DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger = -5) or
                            (DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger = -6) or
                            (DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger = -11) or
                            (DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger > 0)) then
                        begin
                           DMRendaFixa.qryBuscaSaldosItemsAux.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                                     VarArrayOf([DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDCURVARENFIX').AsInteger,
                                                                                 DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger]),
                                                                     []);
                           if not GravaHistRenFixXItens(iIdHistRenFix,
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDCURVARENFIX').AsInteger,
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger,
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDREGRA').AsInteger,
                                                        0 {PUItem},
                                                        DMRendaFixa.qryBuscaSaldosItemsAux.FieldByName('PUACUITEM').AsFloat {PUAcuItem},
                                                        0,
                                                        0) then
                              Raise Exception.Create('Erro ao Atualizar um Item de Histórico da Operação');
                        end
                        else if ((DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger = -22) or
                                 (DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger = -23)) then
                        begin
                           if not GravaHistRenFixXItens(iIdHistRenFix,
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDCURVARENFIX').AsInteger,
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger,
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDREGRA').AsInteger,
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat {PUItem},
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat {PUAcuItem},
                                                        0,
                                                        0) then
                              Raise Exception.Create('Erro ao Atualizar um Item de Histórico da Operação');
                        end
                        else
                        begin
                           if not GravaHistRenFixXItens(iIdHistRenFix,
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDCURVARENFIX').AsInteger,
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDITEMRENFIX').AsInteger,
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDREGRA').AsInteger,
                                                        0 {PUItem},
                                                        DMRendaFixa.qrySelOperRenFixItens.FieldByName('VLRCURVA').AsFloat {PUAcuItem},
                                                        0,
                                                        0) then
                              Raise Exception.Create('Erro ao Atualizar um Item de Histórico da Operação');
                        end;
                     end;
                  end;
                  //AL_16 Fim
               end;
               DMRendaFixa.qrySelOperRenFixItens.Next;
            end;

            // AL_2 - 01/06/2004 - Marca a Operação para Reprocessamento
            //AL_68
            {if DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger  = -98 then
               MarcaInvRep(DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                           DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                           DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
            //AL_88
            else
               MarcaInvRep(qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                           qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                           qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
            }
         end
         else
         begin
            // Resgate
            //AL_72
            if DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger = -97 then
            begin
               //AL_83
               if RendaFixa.ExisteTRCnoDia(DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                                           DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                           DateToStr(DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime)) then
               begin
                  RendaFixa.BuscaDadosTRCnoDIa(DateToStr(DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime),
                                               DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                                               DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                               iIdHisRenfix, SldVlrTrcDia, SldQtdTrcDia);

                  BuscaSaldos(DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                              iIdHisRenfix,
                              DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                              DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger, -1, 1, True);
               end;
            end
            else
               //AL_83
               BuscaSaldos(DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                           -1,
                           DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                           DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger, -1, 1, True);

            //AL_103
            if (DMRendaFixa.qrySelOperRenFix.FieldByName('IDCLASSETIT').AsInteger in [CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq]) then
            begin
               // Busca o Saldo do Último Aniversário desta Aplicação em Poupança
               //AL_33
               //AL_36
               // Obs passo a data da operação + 1 para voltar o aniversário atual no caso de operação na data do aniversário
               dDataAniv := BuscaUltimoAnivPoupanca(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime,
                                                    DMRendaFixa.qryBuscaSaldosHist.FieldByName('CARENCIA').AsInteger,
                                                    DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime + 1);

               // Busca Saldos da Poupança na data do último Aniversário
               //AL_89 - A data de aniv tem que ser buscada após o reposicionamento da BuscaSaldos
               //Se a dDataAniv for anterior a data da TRC, traz a data da TRC
               if (not DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').IsNull) and
                  (dDataAniv < DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime) then
               begin
                  //AL_103
                  BuscaSaldosPoup(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime,
                                  DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                  DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                  CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq);
               end
               else
               begin
                  //AL_103
                  BuscaSaldosPoup(dDataAniv, DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                  DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                  CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq);
               end;

               fPUAtu    := DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('SALDOVLRHISTRENFI').AsFloat /
                            DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('SALDOQTDHISTRENFI').AsFloat;

            end
            else
            begin
               fPUAtu    := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOVLRHISTRENFI').AsFloat /
                            DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat;
            end;

            // Se for papel de Cotação de Renda Fixa
            // AL_73 - Não calcula Lucro/Prej para transferências
            //AL_82
            //AL_103
            if ((CotaRenfix(DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                            DMRendaFixa.qrySelOperRenFixItens.FieldByName('IDCURVARENFIX').AsInteger)) and
                ((DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger <> -97) and
                 (DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger <> -98) and
                 (DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger <> -167)) ) then
            begin
               // Zera Lucro/Prejuizo da Operação
               OperComum.LimpaParametros(DMRendaFixa.qryUpdLucroPrej);
               DMRendaFixa.qryUpdLucroPrej.ParamByName('VLRCURVA').AsFloat := 0;
               DMRendaFixa.qryUpdLucroPrej.ParamByName('IDOPERRENFIX').AsInteger := iOper;
               DMRendaFixa.qryUpdLucroPrej.ParamByName('IDITEMRENFIX').AsInteger := 0;
               DMRendaFixa.qryUpdLucroPrej.ExecSQL;
               // Recalcula lucro/prejuizo das operações inseridas antes da abertura do dia (sem atualização)
               fLucPrej := DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat -
                           (fPUAtu * DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat);
               // Atualiza o item da operação
               OperComum.LimpaParametros(DMRendaFixa.qryUpdLucroPrej);
               DMRendaFixa.qryUpdLucroPrej.ParamByName('VLRCURVA').AsFloat := fLucPrej;
               DMRendaFixa.qryUpdLucroPrej.ParamByName('IDOPERRENFIX').AsInteger := iOper;
               if fLucPrej = 0 then
                  DMRendaFixa.qryUpdLucroPrej.ParamByName('IDITEMRENFIX').AsInteger := 0
               else if fLucPrej > 0 then
                  DMRendaFixa.qryUpdLucroPrej.ParamByName('IDITEMRENFIX').AsInteger := -9
               else if fLucPrej < 0 then
                  DMRendaFixa.qryUpdLucroPrej.ParamByName('IDITEMRENFIX').AsInteger := -10;
               DMRendaFixa.qryUpdLucroPrej.ExecSQL;
            end;

            //AL_30
            // Exclui Lançamentos Contábeis da Planilha sem excluir a Planilha
            //AL_68
            //AL_81
            //AL_103 
            if ((DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger <> -97) and     //TRC Planos -> nâo refaz o Contabil
                (DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger <> -98) and
                (DMRendaFixa.qrySelOperRenFix.FieldByName('PLNCODIGO').AsInteger <> 0)) then
            begin
               //AL_89
               if not DMRendaFixa.qrySelOperRenFix.FieldByName('PLNCODIGO').IsNull then
                  if not RendaFixa.ExcluiContabilidadeRenFix(DMRendaFixa.qrySelOperRenFix.FieldByName('PLNCODIGO').AsInteger,
                                                             False) then
                     Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' + DMRendaFixa.qrySelOperRenFix.FieldByName('PLNCODIGO').AsString);
            end;

            iFazContabil := 1;
            //AL_103
            iPlanilha := DMRendaFixa.qrySelOperRenFix.FieldByName('PLNCODIGO').AsInteger;
            iDocumento := DMRendaFixa.qrySelOperRenFix.FieldByName('CODDOCUMENTO').AsInteger;

            //AL_103 
            OperComum.LimpaParametros(DMRendaFixa.qryBuscaLucroPrejOper);
            DMRendaFixa.qryBuscaLucroPrejOper.ParamByName('IDOPERRENFIX').AsInteger := iOper;
            DMRendaFixa.qryBuscaLucroPrejOper.Open;
            //AL_82
            //AL_103
            if DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger <> -167 then // Desbloqueio de Penhora
               fLucPrej := DMRendaFixa.qryBuscaLucroPrejOper.FieldByName('LUCROPREJ').AsFloat;
            DMRendaFixa.qryBuscaLucroPrejOper.Close;

            //AL_103
            if (DMRendaFixa.qrySelOperRenFix.FieldByName('IDCLASSETIT').AsInteger in [CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq]) then
            begin
               //AL_37 Ini
               //AL_103
               try
                  wQryAux1.SQL.Clear;
                  //AL_83
                  wQryAux1.SQL.Text := 'SELECT SUM(HISTRENFIX.QTDHISTRENFIX) AS QTDHISTRENFIX, '+
                                       '       SUM(HISTRENFIX.VLRHISTRENFIX) AS VLRHISTRENFIX '+
                                       'FROM HISTRENFIX ' +
                                       'WHERE  HISTRENFIX.TIPMOVHISRENFIX IN (''OPE'',''TRC'') ' +
                                       '   AND HISTRENFIX.IDINVESTIMENTO = ' + DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsString +
                                       '   AND HISTRENFIX.IDOPERRENFIXAPLIC = ' + DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsString +
                                       '   AND HISTRENFIX.DATAHISTRENFIX > TO_DATE('''+ DateToStr(dDataAniv) +''',''DD/MM/YYYY'') '+
                                       '   AND HISTRENFIX.DATAHISTRENFIX <= TO_DATE('''+ DateToStr(DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime) +''',''DD/MM/YYYY'')' +
                                       '   AND HISTRENFIX.NATURMOVHISTRENFI = ''D'' ';
                  wQryAux1.Open;
                  fQtdResg := wQryAux1.FieldByName('QTDHISTRENFIX').AsFloat;
                  fVlrResg := wQryAux1.FieldByName('VLRHISTRENFIX').AsFloat;
               finally
                  wQryAux1.Close;
               end;
               //AL_82
               //AL_103
               if (DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger = -167) then  // Desbloqueio de Penhora
               begin
                  fQtdFinal := DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('SALDOQTDHISTRENFI').AsFloat - fQtdResg;
                  fVlrFinal := DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('SALDOVLRHISTRENFI').AsFloat;
               end
               else
               begin
                  fQtdFinal := (DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('SALDOQTDHISTRENFI').AsFloat - fQtdResg - DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat);
                  fQtdFinal := OperComum.Round(fQtdFinal,5);
                  fVlrFinal := DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('SALDOVLRHISTRENFI').AsFloat - fVlrResg -
                               DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat + fLucPrej;

               end;
               fQtdFinal := OperComum.Round(fQtdFinal,5);
               //AL_37 Fim
            end
            else
            begin
               //AL_82
               //AL_103
               if (DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger = -167) then  // Desbloqueio de Penhora
               begin
                  fQtdFinal := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat;
                  fVlrFinal := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOVLRHISTRENFI').AsFloat;
               end
               else
               begin
                  fQtdFinal := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat -
                               DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat;
                  fVlrFinal := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOVLRHISTRENFI').AsFloat -
                               DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat + fLucPrej;
               end;
            end;

            // Quando o sistema for recalculado, pode acontecer de mudar o saldo anterior
            //   do Investimento e então num resgate total eu posso não ter Qtd e ter Valor
            //  OS VALORES DA OPERAÇÃO E DO SALDO FINAL FICARÃO INCONSISTENTES, A PEDIDO DA FUNCEF
            if fQtdFinal = 0 then fVlrFinal := 0;
            // -----------------------------------------------------------------------------

            //AL_103
            if (fQtdFinal < 0) or (fVlrFinal < 0) then
               if Not DMRendaFixa.qryBuscaSaldosHist.IsEmpty then
                  Raise Exception.Create('Saldo Insuficiente para Incluir esta Operação ' + #13 +
                                         'Data: ' + DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Investimento: ' + DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                                         'Operação: ' + DMRendaFixa.qrySelOperRenFix.FieldByName('DESCTIPOOPERACAO').AsString)
               else
                  Raise Exception.Create('Saldo Insuficiente para Incluir esta Operação ' + #13 +
                                         'Data: ' + DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsString + #13 +
                                         'Investimento: ' + sInvestimento + #13 +
                                         'Operação: ' + DMRendaFixa.qrySelOperRenFix.FieldByName('DESCTIPOOPERACAO').AsString);

            //AL_89
            //AL_103
            if DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXORIG').AsInteger = 0 then
               iIdOperRenFixOrig := DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger
            else
               iIdOperRenFixOrig := DMRendaFixa.qrySelOperRenFix.FieldByName('IDOPERRENFIXORIG').AsInteger;

            //AL_68
            //AL_103
            if not GravaHistRenfix(iIdHistRenFix,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                                   iOper,
                                   DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                   -1,
                                   -1,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('QTDEOPERACAO').AsFloat,
                                   fQtdFinal,
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat,
                                   fVlrFinal,
                                   OperComum.IIF(DMRendaFixa.qrySelOperRenFix.FieldByName('TIPOMOVTO').IsNull,'OPE', DMRendaFixa.qrySelOperRenFix.FieldByName('TIPOMOVTO').AsString),
                                   DMRendaFixa.qrySelOperRenFix.FieldByName('NATUREZAOPERACAO').AsString,
                                   sHistorico,
                                   False, -1, -1, '',
                                   iIdOperRenFixOrig) then
               Raise Exception.Create('Não foi Possível Incluir um Histórico para esta Operação');

            if fQtdFinal = 0 then
            begin
               // Resgate TOTAL
               //AL_9
               //AL_66
               //AL_103
               if not LancaItensHistResgTot(iIdHistRenFix,
                                            DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger,
                                            iFazContabil {qrySelOperRenFix.FieldByName('FLGGERACONTAB').AsInteger},
                                            0 {qrySelOperRenFix.FieldByName('FLGGERACAPCAR').AsInteger},
                                            DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsInteger,
                                            DMRendaFixa.qrySelOperRenFix.FieldByName('CODTIPDOC').AsInteger,
                                            DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                                            DMRendaFixa.qrySelOperRenFix.FieldByName('VENCOPERACAO').AsDateTime,
                                            DMRendaFixa.qrySelOperRenFix.FieldByName('DATALIQUIDACAO').AsDateTime,
                                            sHistorico,
                                            fEmolumentos,fCorretagem,
                                            DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat,
                                            iPlanilha,iDocumento,
                                            fPUAtu, fLucPrej,
                                            iUsuarioOrigem,nil,
                                            flgContaInvest) then
                  Raise Exception.Create('Erro no Calculo dos Itens para esta Operação');

               // AL_2 - 01/06/2004 - Desmarca para Reprocessamento
               //AL_103
               MarcaInvRep(DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                           DMRendaFixa.qrySelOperRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                           DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                              -1,-1,'N');
            end
            else
            begin
               // Resgate PARCIAL
               // Esta é a mesma rotina chamada na tela de lançamento de operações
               //AL_66
               //AL_103
               if not LancaItensHistResgParcial(iIdHistRenFix,
                                                DMRendaFixa.qrySelOperRenFix.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                iFazContabil {qrySelOperRenFix.FieldByName('FLGGERACONTAB').AsInteger},
                                                0 {qrySelOperRenFix.FieldByName('FLGGERACAPCAR').AsInteger},
                                                DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsInteger,
                                                DMRendaFixa.qrySelOperRenFix.FieldByName('CODTIPDOC').AsInteger,
                                                DMRendaFixa.qrySelOperRenFix.FieldByName('DATAOPERACAO').AsDateTime,
                                                DMRendaFixa.qrySelOperRenFix.FieldByName('VENCOPERACAO').AsDateTime,
                                                DMRendaFixa.qrySelOperRenFix.FieldByName('DATALIQUIDACAO').AsDateTime,
                                                sHistorico,
                                                DMRendaFixa.qrySelOperRenFix.FieldByName('TXBOLSA').AsFloat,
                                                DMRendaFixa.qrySelOperRenFix.FieldByName('TXOPERACIONAL').AsFloat ,
                                                DMRendaFixa.qrySelOperRenFix.FieldByName('VLROPERACAO').AsFloat,
                                                iPlanilha,iDocumento,
                                                fPUAtu, fLucPrej,
                                                iUsuarioOrigem,nil,
                                                flgContaInvest) then
                  Raise Exception.Create('Erro no Calculo dos Itens para esta Operação');
            end;
         end;
      except
         //AL_103 - Identação
         on E: Exception do
         begin
            Result := E.Message;
            Exit;
         end;
      end;
   finally
      //AL_103
      //AL_22
      //AL_37
      wQryAux.Close;
      wQryAux1.Close;
      FreeAndNil(wQryAux);
      FreeAndNil(wQryAux1);
      DMRendaFixa.qryBuscaSaldosHistAux.Close;
      DMRendaFixa.qryBuscaLucroPrejOper.Close;
      FechaBuscaSaldos;
      FechaBuscaSaldosPoup;
   end;
end;

//AL_103
function TRendaFixa.AtualizaRecalculo(dDataProc: TDateTime;
                                      Var iPlanilha, iDocumento, iIdHistRenFix: Integer): String;
var
    iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc: Integer;
    sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred, sCentroRespon,
               sTipoRecDes, sTipoPer, sHistoricoOper, sRecPagNao, sHistorico: string;
    bGrava: Boolean;
    iPlan, iDoc: Integer;
    qry: TwwQuery;
    sMens: String;
    fIR,fRend : Double;
    //AL_17
    fVlrAcu, fVlrItem : Double;
begin
   Result := '';
   iPlan  := -1;
   iDoc   := -1;
   sMens  := '';

   try
      //AL_103
      qry := TwwQuery.Create(Application);
      qry.DatabaseName := 'BaseDados';

      try
         DMRendaFixa.qryTempHistCalc.First;

         bGrava := True;
         // Se não vai gravar, sai...
         if (not bGrava) then
         begin
            // Para não dar erro
            iPlanilha := -2;
            Exit;
         end;

         // AL_65 - Escreve a mensagem e não adianta o progressbar
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Atualizando Cálculos - Verificando Atualizações existentes', 0);

         // AL_59 - Ini
         // Verifica se existem duas atualizações sem operação no dia
         qry.SQL.Clear;
         qry.SQL.Add('SELECT H.IDHISTRENFIX, H.PLNCODIGO');
         qry.SQL.Add('FROM HISTRENFIX H, OPERRENFIX O');
         qry.SQL.Add('WHERE H.DATAHISTRENFIX = TO_DATE(' + QuotedStr(DateToStr(dDataProc)) + ', ' + QuotedStr('dd/mm/yyyy') + ')');
         qry.SQL.Add('  AND H.IDINVESTIMENTO = ' + DMRendaFixa.qryTempHistCalc.FieldByName('IDINVESTIMENTO').AsString);
         qry.SQL.Add('  AND H.IDOPERRENFIXAPLIC = ' + DMRendaFixa.qryTempHistCalc.FieldByName('IDOPERRENFIXAPLIC').AsString);
         qry.SQL.Add('  AND H.IDOPERRENFIXAPLIC = O.IDOPERRENFIXAPLIC(+)');
         qry.SQL.Add('  AND H.DATAHISTRENFIX = O.DATAOPERACAO(+)');
         qry.SQL.Add('  AND H.TIPMOVHISRENFIX = ''ATU''');
         qry.SQL.Add('  AND ((O.IDOPERRENFIX IS NULL) OR (O.IDTIPOOPERACAO IN (-17,-18,-19)))');
         qry.Open;
         // Se existem mais de uma atualização no dia sem haver operação
         if (qry.IsEmpty) or (qry.RecordCount = 1) then
         begin
            // Exclui o Saldo atual e registros contabeis
            //AL_83
            //AL_103
            if not RendaFixa.ExcluiHistRenFix(dDataProc,True,
                                              DMRendaFixa.qryBuscaSaldosHistAux.FieldByName('IDHISTRENFIX').AsInteger,
                                              -1,-1,-1,False, False, nil,False,
                                              (DMRendaFixa.qryTempHistCalc.FieldByName('PLNCODIGO').IsNull)) then
            begin
               Result := 'Não foi possível Excluir Movimentação do Dia ' + DateToStr(dDataProc) + #13 +
                         'Investimento: ' + DMRendaFixa.qryBuscaSaldosHistAux.FieldByName('DESCINVESTIMENTO').AsString;
               exit;
            end;
         end
         else
         begin
            // Exclui todos os ATUs do dia
            while not qry.Eof do
            begin
               // Exclui o Saldo atual e registros contabeis
               //AL_83
               //AL_103
               if not RendaFixa.ExcluiHistRenFix(dDataProc,True,
                                                 qry.FieldByName('IDHISTRENFIX').AsInteger,
                                                 -1,-1,-1,False, False, nil,False,
                                                 (qry.FieldByName('PLNCODIGO').IsNull)) then
               begin
                  Result := 'Não foi possível Excluir Movimentação do Dia ' + DateToStr(dDataProc) + #13 +
                            'Investimento: ' + DMRendaFixa.qryBuscaSaldosHistAux.FieldByName('DESCINVESTIMENTO').AsString;
                  exit;
               end;
               qry.Next;
            end;
         end;
         // AL_59 - Fim

         // AL_65 - Escreve a mensagem e não adianta o progressbar
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Atualizando Cálculos - Gravando histórico', 0);

         // Monta o histórico para os lançamentos contábeis
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add('SELECT TIPOOPERACAO.SIGLATIPOOPER, TIPOOPERACAO.DESCTIPOOPERACAO FROM TIPOOPERACAO ' +
                     'WHERE TIPOOPERACAO.IDTIPOOPERACAO = ' + DMRendaFixa.qryTempHistCalc.FieldByName('IDTIPOOPERACAO').AsString);
         qry.Open;

         iIdHistRenFix  := LeUltRegistro(nil, 'HISTRENFIX');

         if not DMRendaFixa.qryTempHistCalc.FieldByName('PLNCODIGO').IsNull then
         begin
            // Reutiliza a planilha que foi zerada
            iPlanilha := DMRendaFixa.qryTempHistCalc.FieldByName('PLNCODIGO').AsInteger;
            iPlan := iPlanilha;
         end;

         sHistorico := RendaFixa.MontaHistorico(DMRendaFixa.qryTempHistCalc.FieldByName('NATURMOVHISTRENFI').AsString,
                                                qry.FieldByName('SIGLATIPOOPER').AsString,
                                                qry.FieldByName('DESCTIPOOPERACAO').AsString,
                                                DMRendaFixa.qryBuscaSaldosHistAux.FieldByName('DESCINVESTIMENTO').AsString);
         //AL_103
         qry.Close;

         // Regrava Historico
         //AL_68
         if not RendaFixa.GravaHistRenfix(iIdHistRenFix,
                                          DMRendaFixa.qryTempHistCalc.FieldByName('IDINVESTIMENTO').AsInteger,
                                          DMRendaFixa.qryTempHistCalc.FieldByName('IDOPERRENFIX').AsInteger,
                                          DMRendaFixa.qryTempHistCalc.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                          DMRendaFixa.qryTempHistCalc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          DMRendaFixa.qryTempHistCalc.FieldByName('IDTIPOOPERACAO').AsInteger,
                                          DMRendaFixa.qryTempHistCalc.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                          -1,
                                          -1,
                                          dDataProc,
                                          DMRendaFixa.qryTempHistCalc.FieldByName('QTDHISTRENFIX').AsFloat,
                                          DMRendaFixa.qryTempHistCalc.FieldByName('SALDOQTDHISTRENFI').AsFloat,
                                          DMRendaFixa.qryTempHistCalc.FieldByName('VLRHISTRENFIX').AsFloat,
                                          DMRendaFixa.qryTempHistCalc.FieldByName('SALDOVLRHISTRENFI').AsFloat,
                                          'ATU',
                                          DMRendaFixa.qryTempHistCalc.FieldByName('NATURMOVHISTRENFI').AsString,
                                          DMRendaFixa.qryTempHistCalc.FieldByName('HISTMOVRENFIX').AsString {sHistorico},
                                          False,
                                          -1,-1, '',
                                          DMRendaFixa.qryTempHistCalc.FieldByName('IDOPERRENFIXORIG').AsInteger) then
         begin
            Result := 'Erro na gravação da Histórico' + #13 +
                       DMRendaFixa.qryTempHistCalc.FieldByName('HISTMOVRENFIX').AsString + #13 +
                       DMRendaFixa.qryTempItensCalc.FieldByName('DESCITEMRENFIX').AsString;
            Exit
         end;

         // Desmarca o dia anterior e marca o dia atual para Reprocessamento
         MarcaInvRep(DMRendaFixa.qryBuscaSaldosHist.FieldByName('DATAHISTRENFIX').AsDateTime,
                     DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                     DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                     -1,-1,'N');
         MarcaInvRep(dDataProc,
                     DMRendaFixa.qryTempHistCalc.FieldByName('IDINVESTIMENTO').AsInteger,
                     DMRendaFixa.qryTempHistCalc.FieldByName('IDOPERRENFIXAPLIC').AsInteger);

         //AL_103
         // AL_65 - Não Escreve a mensagem e prepara o progressbar
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('', DMRendaFixa.qryTempItensCalc.RecordCount);

         // Regrava Itens, contabilizando.
         DMRendaFixa.qryTempItensCalc.First;
         while not DMRendaFixa.qryTempItensCalc.Eof do
         begin
            // AL_65 - Escreve a mensagem e não adianta o progressbar
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('Atualizando Cálculos - Gravando ' + DMRendaFixa.qryTempItensCalc.FieldByName('DESCITEMRENFIX').AsString, 0);

            //AL_99 - Localiza a Curva e o Item Corretos
            DMRendaFixa.qryBuscaSaldosItems.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                   VarArrayOf([DMRendaFixa.qryTempItensCalc.FieldByName('IDCURVARENFIX').AsInteger,
                                                               DMRendaFixa.qryTempItensCalc.FieldByName('IDITEMRENFIX').AsInteger]),
                                                   []);
            //AL_17
            // Guarda o valor do IR e do Rendimento
            if DMRendaFixa.qryTempItensCalc.FieldByName('IDITEMRENFIX').AsInteger = -7 then // IR
               fIR := DMRendaFixa.qryTempItensCalc.FieldByName('PUACUITEM').AsFloat;
            if DMRendaFixa.qryTempItensCalc.FieldByName('IDITEMRENFIX').AsInteger = -17 then // Rendimento
               fRend := DMRendaFixa.qryTempItensCalc.FieldByName('PUACUITEM').AsFloat;

            //AL_17
            fVlrItem := 0;
            fVlrAcu := 0;

            // Contabiliza Item
            //AL_87
            if FazContabilizacao(DMRendaFixa.qryBuscaSaldosOper.FieldByName('FLGGERACONTAB').AsInteger,-1,-1,'Atualizacao',
                                 DMRendaFixa.qryTempItensCalc.FieldByName('VLRCONTABIL').AsFloat) and
                                (DMRendaFixa.qryTempItensCalc.FieldByName('VLRCONTABIL').AsFloat <> 0) then
            begin
               if RendaFixa.BuscaPadrLancRF(RetornaSegmentacaoRF(-1,iIdHistRenFix), //Renan CGPC28
                                            dDataProc,Sistema.IdEmpresa,
                                            1,
                                            -2,
                                            DMRendaFixa.qryTempHistCalc.FieldByName('IDINVESTIMENTO').AsInteger,
                                            DMRendaFixa.qryTempHistCalc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            DMRendaFixa.qryTempHistCalc.FieldByName('IDCLASSETIT').AsInteger,
                                            DMRendaFixa.qryTempItensCalc.FieldByName('IDITEMRENFIX').AsInteger,
                                            DMRendaFixa.qryTempItensCalc.FieldByName('VLRCONTABIL').AsFloat,
                                            iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc,
                                            sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
                                            sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper, sRecPagNao,
                                            DMRendaFixa.qryTempItensCalc.FieldByName('TIPOITEM').AsString) then
               begin
                  fVlrItem := DMRendaFixa.qryTempItensCalc.FieldByName('VLRCONTABIL').AsFloat;
                  //AL_18 - 28/03/2005
                  //AL_99
                  fVlrAcu := ConvertePUAcuValor(DMRendaFixa.qryTempItensCalc.FieldByName('PUACUITEM').AsFloat,
                                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat,
                                                DMRendaFixa.qryBuscaSaldosOper.FieldByName('PUEMISSAO').AsFloat,
                                                DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString,
                                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger);

               end;
            end;

            // Gravar o Item de Histórico
            if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                                   DMRendaFixa.qryTempItensCalc.FieldByName('IDCURVARENFIX').AsInteger,
                                                   DMRendaFixa.qryTempItensCalc.FieldByName('IDITEMRENFIX').AsInteger,
                                                   DMRendaFixa.qryTempItensCalc.FieldByName('IDREGRACALCULO').AsInteger,
                                                   DMRendaFixa.qryTempItensCalc.FieldByName('PUITEM').AsFloat,
                                                   DMRendaFixa.qryTempItensCalc.FieldByName('PUACUITEM').AsFloat,
                                                   fVlrItem, fVlrAcu) then
               Result := 'Erro na gravação de um Item: ' + #13 +
                          DMRendaFixa.qryTempHistCalc.FieldByName('HISTMOVRENFIX').AsString + #13 +
                          DMRendaFixa.qryTempItensCalc.FieldByName('DESCITEMRENFIX').AsString;

            //AL_103

            DMRendaFixa.qryTempItensCalc.Next;

            // AL_65 - Adianta o progressbar
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('');
         end;

         // Grava IR Trimestral (RET)
         if iIdHistRenFix <> 0 then  // Se iIdHistRenFix=0 então está em reprocessamento -> Será gravado pela função AtualizaRecalculo
         begin
            FazIrLitigioTrimestral(dDataProc,False,False,'IR TRIMESTRAL R.FIXA : '+sHistorico,
                                          DMRendaFixa.qryTempHistCalc.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                          DMRendaFixa.qryTempHistCalc.FieldByName('IDINVESTIMENTO').AsInteger,
                                          -1,iIdHistRenFix,fIR,fRend);
         end;

         //AL_103

         // AL_65 - Escreve a mensagem e não adianta o progressbar
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Atualizando Cálculos - Excluindo operações antecipadas', 0);

         // Havendo Operações (posteriores ao ATU), estas devem ser excluídas para serem
         //   relançadas com os novos valores corretos
         //AL_103
         ExcluiOpeAntecipada(dDataProc, DMRendaFixa.qryTempHistCalc.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                             DMRendaFixa.qryTempHistCalc.FieldByName('IDINVESTIMENTO').AsInteger,
                             DMRendaFixa.qryBuscaSaldosHistAux.FieldByName('IDHISTRENFIX').AsInteger); //, prbProgresso);

         // AL_65 - Apaga a label e o progress
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('', -2);

      except on E: Exception do
         begin
            Result := E.Message;
            Exit;
         end;
      end;
   finally
      //AL_103
      //O Evento Close já faz uma chamada ao CancelUpdates automaticamente
      DMRendaFixa.qryTempItensCalc.Close;
      DMRendaFixa.qryTempHistCalc.Close;
      qry.Close;
      FreeAndNil(qry);
   end;
end;

function TRendaFixa.BuscaSaldosAux(dDataSaldo: TDateTime;
                                   iInvestimento: Integer = -1;
                                   iOperacao: Integer = -1;
                                   iTipoProc: Integer = 1;
                                   iHistRenFix: Integer = 9999999): Boolean;
begin
   //AL_103 - Ini
   Result := False;
   OperComum.LimpaParametros(DMRendaFixa.qryBuscaSaldosHistAux);
   DMRendaFixa.qryBuscaSaldosHistAux.SQL.Clear;
   DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('SELECT HR.IDHISTRENFIX, HR.SALDOVLRHISTRENFI, HR.SALDOQTDHISTRENFI, IV.DESCINVESTIMENTO, ');
   DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('       IV.CARENCIA, HR.IDPLANPREVCTBPATR, HR.PLNCODIGO ');
   DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('FROM   HISTRENFIX HR, INVESTIMENTO IV ');
   DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('WHERE HR.IDHISTRENFIX IN (SELECT MAX(HISTRENFIX.IDHISTRENFIX) ');
   DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('                          FROM HISTRENFIX ');
   DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('                          WHERE (HISTRENFIX.DATAHISTRENFIX = ' + OperComum.DataOracle(dDataSaldo) + ') ');
   if iInvestimento > 0 then
      DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('                            AND (HISTRENFIX.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ')');
   if iOperacao > 0 then
      DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('                            AND (HISTRENFIX.IDOPERRENFIXAPLIC = ' + IntToStr(iOperacao) + ')');

   if iTipoProc = 0 then
   begin
      DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('                            AND (HISTRENFIX.TIPMOVHISRENFIX = ''ATU'')');
      DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('                            AND (HISTRENFIX.IDHISTRENFIX > ' + IntToStr(iHistRenFix) + ')');
      DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('                            AND (HISTRENFIX.IDTIPOOPERACAO NOT IN (-17,-18,-19))');
   end
   else if iTipoProc < 3 then
   begin
      DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('                            AND (HISTRENFIX.TIPMOVHISRENFIX = ''ATU'')');
      DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('                            AND (HISTRENFIX.IDHISTRENFIX < ' + IntToStr(High(Integer)) + ')');
      DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('                            AND (HISTRENFIX.IDTIPOOPERACAO NOT IN (-17,-18,-19))');
   end;


   DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('                          GROUP BY HISTRENFIX.IDOPERRENFIXAPLIC)');
   DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('  AND (HR.SALDOQTDHISTRENFI > 0)');
   DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('  AND (IV.IDTIPOINVEST = 1)');
   DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('  AND (HR.DATAHISTRENFIX = ' + OperComum.DataOracle(dDataSaldo) + ') ');
   if iInvestimento > 0 then
      DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('  AND (HR.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ')');
   if iOperacao > 0 then
      DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('  AND (HR.IDOPERRENFIXAPLIC = ' + IntToStr(iOperacao) + ')');
   if iTipoProc = 0 then
   begin
      DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('  AND (HR.TIPMOVHISRENFIX = ''ATU'')');
      DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('  AND (HR.IDHISTRENFIX > ' + IntToStr(iHistRenFix) + ')');
   end
   else if iTipoProc < 3 then
   begin
      DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('  AND (HR.TIPMOVHISRENFIX = ''ATU'')');
      DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('  AND (HR.IDHISTRENFIX < ' + IntToStr(High(Integer)) + ')');
   end;
   DMRendaFixa.qryBuscaSaldosHistAux.SQL.Add('  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)');

   DMRendaFixa.qryBuscaSaldosHistAux.Open;

   if DMRendaFixa.qryBuscaSaldosHistAux.IsEmpty then
      Result := False
   else
     Result := True;

   //AL_103 - Fim
end;

function TRendaFixa.BuscaUltimoAnivPoupanca(dDataAplic: TDateTime; iCarencia: Integer;
                                            dDataAtual: TDateTime; bResg: Boolean = False): TDateTime;
var dDataUltAni: TDateTime;
    iAno, iMes, iDia, iDiaAplic: Word;
begin
   //AL_72
   // O Título foi Transferido de Plano - Deve pegar a aplicação da Origem
   if not DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').IsNull then
      dDataUltAni := DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAOORIG').AsDateTime
   else
      dDataUltAni := dDataAplic;

   DecodeDate(dDataAplic, iAno, iMes, iDiaAplic);
   repeat
      Result := dDataUltAni;
      dDataUltAni := DiasUteisInv.SomaMeses(dDataUltAni,iCarencia);
      DecodeDate(Result, iAno, iMes, iDia);
      if ((iDia = 28) or (iDia = 29)) and (iMes = 2) and (iDiaAplic <> iDia) then
         dDataUltAni := EncodeDate(iAno, 3, iDiaAplic);

   until dDataUltAni >= dDataAtual;
   // Se for resgate o dia atual conta como Aniversário pois já foi calculado.
   if (bResg) and (dDataUltAni = dDataAtual) then
      Result := dDataUltAni;

end;

function TRendaFixa.BuscaUltimoTRPoupanca(dDataAplic: TDateTime; iCarencia: Integer;
                                            dDataAtual: TDateTime): TDateTime;
var dDataUltTR: TDateTime;
    iAno, iMes, iDia, iDiaAniv: Word;
begin
   //AL_72
   // O Título foi Transferido de Plano - Deve pegar a aplicação da Origem
   if not DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').IsNull then
      dDataUltTR := DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAOORIG').AsDateTime
   else
   dDataUltTR := dDataAplic;
      
   DecodeDate(dDataAplic, iAno, iMes, iDiaAniv);
   repeat
      Result := dDataUltTR;
      dDataUltTR := DiasUteisInv.SomaMeses(dDataUltTR,iCarencia);
      DecodeDate(Result, iAno, iMes, iDia);
      if ((iDia = 28) or (iDia = 29)) and (iMes = 2) and (iDiaAniv <> iDia) then
         dDataUltTR := EncodeDate(iAno, 3, iDiaAniv);

   until dDataUltTR >= dDataAtual;

   DecodeDate(Result, iAno, iMes, iDia);
   // Caso Data da aplicação = 29/30/31
   if (iDiaAniv = 29) or (iDiaAniv = 30) or (iDiaAniv = 31) then
   begin
      DecodeDate(dDataUltTR, iAno, iMes, iDia);
      Result := StrToDate('01/'+ IntToStr(iMes) +'/' + IntToStr(iAno));
   end;

end;

function TRendaFixa.BuscaUltimoAniv(dDataAplic,dDataAtual, dDataLeilao: TDateTime): TDateTime;
var
    dDataUltAni: TDateTime;
begin
   //AL_72
   // O Título foi Transferido de Plano - Deve pegar a aplicação da Origem
   if not DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').IsNull then
      dDataUltAni := DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAOORIG').AsDateTime
   else
      dDataUltAni := dDataAplic;

   if dDataLeilao <> 0 then
      dDataUltAni := dDataLeilao;

   repeat
      Result := dDataUltAni;
      dDataUltAni := DiasUteisInv.SomaMeses(dDataUltAni,1);
   until dDataUltAni >= dDataAtual;
end;

//AL_93
//AL_103
function TRendaFixa.CalculaItensAtuPoup(iIdHistRenFix, iFlgGeraContab, iFlgGeraCapCar,
                                        iForCli, iTipoDoc : integer;
                                        fVlrUltAniv:Double;
                                        dDataProc, dDataVenc,dDataUltAniv,dDataTR: TDateTime;
                                        sNatOper, sDescOperacao,sHistorico: string;
                                        var iPlanilha, iDocumento: Integer;
                                        bReprocessa: Boolean = False;bPassoPasso : boolean = False): boolean;
var
    //AL_103 - Ini
    dDataAniv : TDateTime;

    I, iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc,iIdPlnCodigo,
       iPlan, iDoc: Integer;

    fPUItem, fPUAcuItem, RegraResult, fValorTemp, fValorContab: Double;

    sTipoRecDes, sTipoPer, sHistoricoOper, sRecPagNao, sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred, sCentroRespon,
       sSql, sValor, sMens, sItemVlrAtu: String;

    cdsItens: TCMClientDataSet;
//    Regra: TRegra ;
    wQryAux : TwwQuery;
    //AL_103 - Fim
begin
// Esta rotina utiliza as querys já carregadas pela BuscaSaldos,
//      se a idéia for calcular somente uma aplicação utilizar
//      a BuscaSaldos passando o parametro iInvestimento

   // AL_18
   try // Finally
      Result := False;

      // AL_24
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('Preparando Itens Para Cálculo', 0);

      //AL_103
//      Regra                 := TRegra.Create(Application);
//André L. Santos - 11/08/2008 - N. Sol 91917 -  N. Kintana 390437
 //     DMRendaFixa.Regra.DatabaseName    := 'BaseDados';
//      DMRendaFixa.Regra.TipoCliente     := tcFundacao;

      //AL_103
      cdsItens := TCMClientDataSet.Create(Application);
      cdsItens.Data := CtrlInvContab.GetDataPacket('SELECT ''CAMPO UTILIZADO NO SQL DE ENTRADA'' AS CAMPO, ''VALOR INFORMADO NO SQL DE ENTRADA'' AS VALOR FROM DUAL WHERE 1 = 2');

      //AL_22
      wQryAux := TwwQuery.Create(Application);
      wQryAux.DatabaseName := 'BaseDados';

      //AL_103 - Retirada do try - except

      // Prepara o Cds que montará a query de entrada do regra
      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'DATAATUAL';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',dDataProc));
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'DATAEMISSAO';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAEMISSAO').AsDateTime));
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'DATAULTANIV';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',dDataUltAniv));
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'DATAULTTR';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',dDataTR));
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'NATUREZAOPER';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(sNatOper);
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'IDPAIS';
      cdsItens.FieldByName('VALOR').AsString := '1';
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'IDCIDADES';
      cdsItens.FieldByName('VALOR').AsString := '-1';
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'CODESTADO';
      cdsItens.FieldByName('VALOR').AsString := '-1';
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'PERCENTUAL';
      cdsItens.FieldByName('VALOR').AsString := '100';
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'VLRULTANIV';
      cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('0.##',fVlrUltAniv));
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'ALIQUOTA';
      cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('0.##',Impostos.BuscaAliquotaIR(1,-1,-1,dDataProc)));
      cdsItens.Post;

      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'TAXA';
      cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('0.##',CtrlPInv.JurosPoupanca));
      cdsItens.Post;

      //AL_57
      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'CARENCIA';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('CARENCIA').AsString);
      cdsItens.Post;

      //AL_53
      //AL_93
      //AL_103
      cdsItens.Insert;
      cdsItens.FieldByName('CAMPO').AsString := 'DATAVIGENCIA';
      cdsItens.FieldByName('VALOR').AsString := QuotedStr(FormatDateTime('dd/mm/yyyy',BuscaVigencia(DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('IDOPERRENFIXAPLIC').AsInteger, dDataProc )));
      cdsItens.Post;

      // Carrega Valores no Cds
      DMRendaFixa.qryBuscaSaldosItemsPoup.First;
      while not DMRendaFixa.qryBuscaSaldosItemsPoup.Eof do
      begin
         //AL_93
         //AL_103
         cdsItens.Insert;
         cdsItens.FieldByName('CAMPO').AsString := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('CODITEMRENFIX').AsString;

         // Para os Campos de Depósitos e Ações Judiciais Pega Valores Atuais
         if (DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('CODITEMRENFIX').AsString = 'DEPJUDPREV') or
            (DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('CODITEMRENFIX').AsString = 'DEPJUDASSIST') or
            (DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('CODITEMRENFIX').AsString = 'DEPJUDINVEST') or
            (DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('CODITEMRENFIX').AsString = 'ACOJUDPREV') or
            (DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('CODITEMRENFIX').AsString = 'ACOJUDASSIST') or
            (DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('CODITEMRENFIX').AsString = 'ACOJUDINVEST') then
         begin
            // Equaliza a BuscaSaldos com o mesmo item da BuscaSaldosPoup
            // AL_24
            DMRendaFixa.qryBuscaSaldosItems.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                   VarArrayOf([DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDCURVARENFIX').AsInteger,
                                                               DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDITEMRENFIX').AsInteger]),
                                                              []);
            //AL_103
            if DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').IsNull then
               cdsItens.FieldByName('VALOR').AsString := '0'
            else
               cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('########0.###########', DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').asfloat));
         end
         else
         begin
            //AL_103
            if DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('PUACUITEM').IsNull then
               cdsItens.FieldByName('VALOR').AsString := '0'
            else
               cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('########0.###########', DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('PUACUITEM').asfloat));
         end;
         //AL_103
         cdsItens.Post;
         DMRendaFixa.qryBuscaSaldosItemsPoup.Next;
      end;

      iPlan := -1;
      iDoc  := -1;

      // AL_24
      // AL_65 - Escreve Mensagem e seta o progressbar
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('Calculando ' + DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('DESCITEMRENFIX').AsString, DMRendaFixa.qryBuscaSaldosItemsPoup.RecordCount);

      // Calcula os Itens
      DMRendaFixa.qryBuscaSaldosItemsPoup.First;
      while not DMRendaFixa.qryBuscaSaldosItemsPoup.Eof do
      begin
         // AL_24
         // AL_65 - Escreve a mensagem e não adianta o progressbar
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Calculando ' + DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('DESCITEMRENFIX').AsString, 0);

         // Busca o Item da Operação ORIGINAL
         // AL_24
         DMRendaFixa.qryBuscaSaldosItemsOperPoup.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                 VarArrayOf([DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDCURVARENFIX').AsInteger,
                                                             DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDITEMRENFIX').AsInteger]),
                                                 []);

         DMRendaFixa.qryBuscaSaldosItems.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                         VarArrayOf([DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDCURVARENFIX').AsInteger,
                                                     DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDITEMRENFIX').AsInteger]),
                                         []);

         // Pega o valor do Percentual na posição fixa iPosPer
         //AL_103
         if cdsItens.Locate('CAMPO', 'PERCENTUAL', []) then
         begin
            cdsItens.Edit;
            cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('########0.###########',DMRendaFixa.qryBuscaSaldosItemsOperPoup.FieldByName('PERCCURVA').AsFloat));
            cdsItens.Post;
         end
         else
            Raise Exception.Create('Não foi possível localizar o item PERCENTUAL no SQL de entrada');

         // Pega o Valor da Taxa de Juros na posição fixa iPosTX
         // A cada passagem joga o valor do Item atual nesta posição do vetor,
         // quando a regra de juros for executar o vetor conterá o valor do Item Juros
         //AL_103
         if cdsItens.Locate('CAMPO', 'TAXA', []) then
         begin
            cdsItens.Edit;
            cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('########0.###########',DMRendaFixa.qryBuscaSaldosItemsOperPoup.FieldByName('VLRCURVA').AsFloat));
            cdsItens.Post;
         end
         else
            Raise Exception.Create('Não foi possível localizar o item TAXA no SQL de entrada');

         // Calcula o novo Saldo
         if not DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDREGRA').IsNull then
         begin
            //AL_103
            //AL_22
            //AL_96 - Se não houver regra no histórico, utiliza a do perfil
            if (bReprocessa) and (not DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDREGRACALCULO').IsNull) then
               DMRendaFixa.Regra.RuleName := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDREGRACALCULO').AsString
            else
               DMRendaFixa.Regra.RuleName := DMRendaFixa.qryBuscaSaldosItemsXCurvasPoup.FieldByName('IDREGRA').AsString;

            // Montar SQL de entrada
            //AL_22
            //AL_103
            wQryAux.SQL.Clear;
            wQryAux.SQL.Add('SELECT ');
            cdsItens.First;
            while not cdsItens.eof do
            begin
               wQryAux.SQL.Add(cdsItens.FieldByName('VALOR').AsString + ' AS ' + cdsItens.FieldByName('CAMPO').AsString + ', ');
               cdsItens.Next;
            end;
            wQryAux.SQL.Strings[wQryAux.SQL.Count-1] := cdsItens.FieldByName('VALOR').AsString + ' AS ' + cdsItens.FieldByName('CAMPO').AsString;
            wQryAux.SQL.Add('FROM DUAL');

            sSql := wQryAux.SQL.GetText;

            RegraResult := ExecutaRegra(wQryAux, DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('DESCITEMRENFIX').AsString,
                                        StrToInt(DMRendaFixa.Regra.RuleName), bPassoPasso);

            // Calcula Valor Atual do Item
            // PU Acumulado recebe o Resultado da Regra
            //AL_34 Ini
            dDataAniv := RendaFixa.BuscaUltimoAnivPoupanca(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime,
                                                           DMRendaFixa.qryBuscaSaldosHist.FieldByName('CARENCIA').AsInteger,
                                                           dDataProc + 1);

            // Apropriação de Juros e Correçao no Aniversário (Mensal)
            //AL_44
            //AL_47
            //AL_103
            if ((CtrlPInv.FlgPoupaPropDia = 'N') and
                (not VerificaSeAtuDiaria(dDataProc, dDataAniv)) and
                ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'PUCORRECAO') or
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'PUJUROS') ) ) then
            begin
               // Verifica se é no dia do Aniversário e
               //AL_103
               if dDataAniv = dDataProc then
                  fPUAcuItem := RegraResult
               else
                  fPUAcuItem := 0;
            end
            else
               //AL_103
               fPUAcuItem := RegraResult;

            // PU recebe, se houver saldo (Acumulado - Saldo) senão o próprio Acumulado
            if DMRendaFixa.qryBuscaSaldosItemsPoup.Eof then
               fPUItem := fPUAcuItem
            else
            begin
               //AL_44
               //AL_103
               if ((CtrlPInv.FlgPoupaPropDia = 'N') and
                   (not VerificaSeAtuDiaria(dDataProc, dDataAniv))) then //Atualizacao Mensal
               begin
                  // Verifica se é no dia do Aniversário e
                  if dDataAniv = dDataProc then
                  begin
                     fPUItem := DiminuiValores(fPUAcuItem,DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat);
                     //Não deveria ser o item de poupança abaixo???
                     //fPUItem := DiminuiValores(fPUAcuItem,DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('PUACUITEM').AsFloat);

                     //AL_34 - Qdo for Mensal, deverá ter a correção mesmo se não for dia útil
                     //AL_32
                  end
                  else
                     fPUItem := 0;
               end
               else
               begin
                  fPUItem := DiminuiValores(fPUAcuItem,DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat);
                  //Não deveria ser o item de poupança abaixo???
                  //fPUItem := DiminuiValores(fPUAcuItem,DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('PUACUITEM').AsFloat);
                  //AL_44
                  //AL_103
                  if ((CtrlPInv.FlgPoupaPropDia = 'S') or (CtrlPInv.FlgPoupaPropDia = Null)) then
                  begin
                     // Para os Itens de Moeda, se não for dia útil, não tem variação
                     if (not DiasUteisInv.DiaUtil(dDataProc, -1, 1, '', True, False, False)) and
                        (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'M') then
                        fPUItem := 0;
                  end;
               end;
               //AL_34 Fim
            end;
         end
         else
         begin
            // Itens Não Calculados Recebem o Valor Original
            //AL_103
            if cdsItens.Locate('CAMPO', DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('CODITEMRENFIX').AsString, []) then
               fPUAcuItem := StrToFloat(TrocaPontoVirgula(cdsItens.FieldByName('VALOR').AsString))
            else
               Raise Exception.Create('Não foi possível encontrar o valor original do item ' + DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('CODITEMRENFIX').AsString + ' no SQL de entrada');


            fPUItem := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('PUITEM').AsFloat;
         end;

         //AL_103 - Atualiza o Cds de Valores com o Valor Calculado do Item
         if cdsItens.Locate('CAMPO', DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('CODITEMRENFIX').AsString, []) then
         begin
            cdsItens.Edit;
            cdsItens.FieldByName('VALOR').AsString := TrocaVirgulaPonto(FormatFloat('0.###########',fPUAcuItem));
            cdsItens.Post;
         end
         else
            Raise Exception.Create('Não foi possível atualizar o valor do item ' + DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('CODITEMRENFIX').AsString + ' no SQL de entrada');

         if bReprocessa then
         begin
            // Reprocessamento
            DMRendaFixa.qryTempItensCalc.Insert;

            DMRendaFixa.qryTempItensCalc.FieldByName('IDCURVARENFIX').AsInteger := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDCURVARENFIX').AsInteger;
            DMRendaFixa.qryTempItensCalc.FieldByName('IDITEMRENFIX').AsInteger := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDITEMRENFIX').AsInteger;
            DMRendaFixa.qryTempItensCalc.FieldByName('DESCITEMRENFIX').AsString := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('DESCITEMRENFIX').AsString;
            DMRendaFixa.qryTempItensCalc.FieldByName('PUITEM').AsFloat := fPUItem;
            DMRendaFixa.qryTempItensCalc.FieldByName('PUACUITEM').AsFloat := fPUAcuItem;
            DMRendaFixa.qryTempItensCalc.FieldByName('IDREGRACALCULO').AsInteger := DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDREGRA').AsInteger;
            DMRendaFixa.qryTempItensCalc.FieldByName('VLRCONTABIL').AsFloat := fPUItem;
            DMRendaFixa.qryTempItensCalc.FieldByName('TIPOITEM').AsString := DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString;
            DMRendaFixa.qryTempItensCalc.Post;

            // Se for Valor Bruto ou Valor Bruto Provisionado para Perda
            //    Atualiza o Saldo do Investimento na Histrenfix
            if (DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDITEMRENFIX').AsInteger = -6) or
               (DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDITEMRENFIX').AsInteger = -14) then
            begin
               DMRendaFixa.qryTempHistCalc.Edit;
               DMRendaFixa.qryTempHistCalc.FieldByName('SALDOVLRHISTRENFI').AsFloat := fPUAcuItem;
               DMRendaFixa.qryTempHistCalc.FieldByName('VLRHISTRENFIX').AsFloat := fPUItem;
               DMRendaFixa.qryTempHistCalc.Post;
            end;
         end
         else
         begin
            // AL_24 - 07/04/2005
            // Processamento normal

            // Se for Valor Bruto ou Valor Bruto Provisionado para Perda
            //    Atualiza o Saldo do Investimento na Histrenfix
            if (DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDITEMRENFIX').AsInteger = -6) or
               (DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDITEMRENFIX').AsInteger = -14) then
            begin
               if not AtuFinanceiroHist(iIdHistRenFix, fPUItem, fPUAcuItem) then
                  Raise Exception.Create('Não foi Possível Atualizar o Financeiro no Histórico');
            end;

            fValorContab := 0;

            // Contabiliza Item
            //AL_75
            //AL_87
            if FazContabilizacao(iFlgGeraContab,-1,-1,'Atualizacao', OperComum.Trunca(fPuItem, 2)) then
            begin
               if RendaFixa.BuscaPadrLancRF(RetornaSegmentacaoRF(-1,iIdHistRenFix), //Renan CGPC28
                                            dDataProc, Sistema.IdEmpresa,
                                            1,
                                            -2,
                                            DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('IDINVESTIMENTO').AsInteger,
                                            DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('IDCLASSETIT').AsInteger,
                                            DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDITEMRENFIX').AsInteger,
                                            fValorContab,
                                            iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc,
                                            sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
                                            sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper,sRecPagNao) then
               begin
                  // Achou um padrão contábil -> recebe -2 para não derrubar o processamento
                  if iPlanilha < 0 then
                     iPlanilha := -2;

                  fValorContab := OperComum.Trunca(fPuItem, 2);

                  if iPlanilha > 0 then
                     iPlan := iPlanilha;

                  // Verificar a possibilidade de tirar este código daqui:
                  //   - Atualização não faz financeiro
                  // Integra Financeiro
                  if iFlgGeraCapCar = 1 then
                  begin
                     if iDocumento > 0 then
                        iDoc := iDocumento;
                  end;
               end;
            end
            else
            begin
               // Manter a planilha anterior ou -2 para não causar erro de contabilização
               if iPlan > 0 then
                  iPlanilha := iPlan
               else
               iPlanilha := -2;
            end;

            // Gravar o Item de Histórico
            if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                                   DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDCURVARENFIX').AsInteger,
                                                   DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDITEMRENFIX').AsInteger,
                                                   DMRendaFixa.qryBuscaSaldosItemsPoup.FieldByName('IDREGRA').AsInteger,
                                                   fPUItem,
                                                   fPUAcuItem,
                                                   fValorContab,
                                                   fPUAcuItem) then
               Raise Exception.Create('Erro na gravação do Item de Histórico de Renda Fixa');
            // AL_24 - Fim
         end;

         DMRendaFixa.qryBuscaSaldosItemsPoup.Next;

         // AL_24
         // AL_65 - Adianta o progressbar
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('');

      end;

      // AL_65 - Apaga a label e o progress
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('', -2);

      if iPlan > 0 then
         iPlanilha := iPlan;
      if iDoc > 0 then
         iDocumento := iDoc;

      // Atualiza o HistRenFix
      if (iPlanilha > 0) or (iDocumento > 0) then
      begin
         if not RendaFixa.GravaPlanDoc('ATU', -1, iIdHistRenFix,
                                       iPlanilha, iDocumento, sMens, True) then
            Raise Exception.Create(sMens);
      end;
      //AL_103
      Result := True;
   finally
      //AL_103 - ini
      //Refaz o ambiente do Regra no DataModule
      DMRendaFixa.Regra.LimpaVariaveis;
      DMRendaFixa.Regra.RefazAmbiente;
      // Destroi os componentes criados em run-time
      //AL_22
      wQryAux.Close;
      cdsItens.Close;
      FreeAndNil(wQryAux);
      FreeAndNil(cdsItens);
      //AL_93
      //AL_24
      //AL_103 - Fim
   end;
end;

//AL_8
function TRendaFixa.BuscaSaldosPoup(dDataSaldo: TDateTime; iInvestimento: Integer = -1;
                               iOperacao: Integer = -1; iClassePoup: Integer = -1;
                               iClassePoupBloq: Integer = -1;
                               iTipoProc: Integer = 1;
                               bResg : Boolean = False): Boolean;
begin
   //AL_103 - Ini - A query passa a ser montada em Run-Time
   Result := False;
   OperComum.LimpaParametros(DMRendaFixa.qryBuscaSaldosHistPoup);
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Clear;
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('SELECT ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   HR.IDHISTRENFIX,HR.IDEMPRESAPROP,HR.IDMODULO,HR.IDPLANPREVCTBPATR,HR.PLNCODIGO, ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   HR.CODDOCUMENTO,HR.IDTIPOINVEST,HR.IDTIPOOPERACAO,HR.IDCARTEIRAINVEST,HR.IDOPERRENFIXAPLIC, ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   HR.IDOPERRENFIX,HR.IDINVESTIMENTO,HR.DATAHISTRENFIX,HR.VLRHISTRENFIX,HR.QTDHISTRENFIX, ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   HR.SALDOVLRHISTRENFI,HR.SALDOQTDHISTRENFI,HR.TIPMOVHISRENFIX,HR.NATURMOVHISTRENFI,HR.HISTMOVRENFIX, ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   IV.DESCINVESTIMENTO, IV.IDCLASSETIT, IV.CARENCIA, EM.SIGLAEMISSOR, CL.DESCCLASSETIT, ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   HR.IDOPERRENFIXORIG, CL.FLGUSAQTD  ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('FROM  HISTRENFIX HR, INVESTIMENTO IV, EMISSOR EM, CLASSETITRENFIX CL ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('WHERE (HR.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('  AND HR.IDINVESTIMENTO ' + OperComum.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NOT NULL'));
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('  AND HR.IDOPERRENFIXAPLIC ' + OperComum.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NOT NULL'));
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('  AND (HR.IDHISTRENFIX IN ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('          (SELECT MAX(H1.IDHISTRENFIX) ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('           FROM HISTRENFIX H1 ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('           WHERE (H1.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('             AND H1.IDINVESTIMENTO ' + OperComum.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NOT NULL'));
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('             AND H1.IDOPERRENFIXAPLIC ' + OperComum.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NOT NULL'));
   if iTipoProc in [0,2] then
   begin
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('             AND (H1.TIPMOVHISRENFIX = ''OPE'') ');
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('             AND (H1.IDTIPOOPERACAO NOT IN (-166,-167)) ');
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('             AND (H1.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   end
   else if iTipoProc = 3 then
   begin
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('             AND (H1.TIPMOVHISRENFIX = ''TRC'') ');
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('             AND (H1.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   end;
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('              AND ((H1.DATAHISTRENFIX || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('                       (SELECT MAX(H2.DATAHISTRENFIX) || H2.IDINVESTIMENTO || H2.IDOPERRENFIXAPLIC ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('                        FROM HISTRENFIX H2 ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('                        WHERE (H2.DATAHISTRENFIX <= TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('                          AND H2.IDINVESTIMENTO ' + OperComum.IIF(iInvestimento > 0, ' = '+ IntToStr(iInvestimento), 'IS NOT NULL'));
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('                          AND H2.IDOPERRENFIXAPLIC ' + OperComum.IIF(iOperacao > 0, ' = '+ IntToStr(iOperacao), 'IS NOT NULL'));
   if iTipoProc in [0,2] then
   begin
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('                          AND (H2.TIPMOVHISRENFIX = ''OPE'') ');
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('                          AND (H2.IDTIPOOPERACAO NOT IN (-166,-167)) ');
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('                          AND (H2.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   end
   else if iTipoProc = 3 then
   begin
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('                          AND (H2.TIPMOVHISRENFIX = ''TRC'') ');
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('                          AND (H2.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   end;
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('                        GROUP BY H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC)) ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('            GROUP BY H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC)) ');

   if (iClassePoup > 0) and (iClassePoupBloq > 0) then
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('  AND ((IV.IDCLASSETIT  = ' + IntToStr(iClassePoup) + ') OR (IV.IDCLASSETIT  = ' + IntToStr(iClassePoupBloq) + '))')
   else if iClassePoup > 0 then
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('  AND (IV.IDCLASSETIT  = ' + IntToStr(iClassePoup) + ')')
   else if iClassePoupBloq > 0 then
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('  AND (IV.IDCLASSETIT  = ' + IntToStr(iClassePoupBloq) + ')');

   if iTipoProc in [0,2] then
   begin
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   AND (HR.TIPMOVHISRENFIX = ''OPE'') ');
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   AND (HR.IDTIPOOPERACAO NOT IN (-166,-167)) ');
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   AND (HR.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   end
   else if iTipoProc = 3 then
   begin
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   AND (HR.TIPMOVHISRENFIX = ''TRC'') ');
      DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   AND (HR.DATAHISTRENFIX = TO_DATE('+ QuotedStr(DateToStr(dDataSaldo)) +',''DD/MM/YYYY'')) ');
   end;
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   AND (HR.SALDOQTDHISTRENFI > 0) ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   AND (IV.IDTIPOINVEST = 1)  ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO) ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   AND (IV.IDEMISSOR = EM.IDEMISSOR) ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add('   AND (IV.IDCLASSETIT = CL.IDCLASSETIT) ');
   DMRendaFixa.qryBuscaSaldosHistPoup.SQL.Add(' ORDER BY DESCCLASSETIT, DESCINVESTIMENTO');

   DMRendaFixa.qryBuscaSaldosHistPoup.Open;
   if DMRendaFixa.qryBuscaSaldosHistPoup.IsEmpty then Result := False;

   DMRendaFixa.qryBuscaSaldosItemsPoup.Close;
   DMRendaFixa.qryBuscaSaldosItemsPoup.ParamByName('IDHISTRENFIX').AsInteger :=
                   DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('IDHISTRENFIX').AsInteger;
   DMRendaFixa.qryBuscaSaldosItemsPoup.Open;

   DMRendaFixa.qryBuscaSaldosOperPoup.Close;
   DMRendaFixa.qryBuscaSaldosOperPoup.ParamByName('IDOPERRENFIX').AsInteger :=
                      DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
   DMRendaFixa.qryBuscaSaldosOperPoup.Open;

   DMRendaFixa.qryBuscaSaldosItemsOperPoup.Close;
   DMRendaFixa.qryBuscaSaldosItemsOperPoup.ParamByName('IDOPERRENFIX').AsInteger :=
                           DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
   DMRendaFixa.qryBuscaSaldosItemsOperPoup.Open;

   Result := True;
   //AL_103 - Fim - A query passa a ser montada em Run-Time
end;

//AL_14
//AL_73
function TRendaFixa.BuscaTotResgPoup(dDataini, dDatafim: TDateTime;
                                     var fTotVlr, fTotQtd, fTotVlrTRC, fTotQtdTRC: double;
                                     iInvestimento: Integer; sOper : string; iOperacao: Integer = -1): Boolean;
begin
   //AL_103 - Ini
   Result  := False;
   fTotVlr := 0;
   fTotQtd := 0;
   try
      OperComum.LimpaParametros(DMRendaFixa.qryBuscaTotalResgPoup);
      DMRendaFixa.qryBuscaTotalResgPoup.ParamByName('DATAINI').AsString := DateToStr(dDataini);
      DMRendaFixa.qryBuscaTotalResgPoup.ParamByName('DATAFIM').AsString := DateToStr(dDatafim);
      DMRendaFixa.qryBuscaTotalResgPoup.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
      DMRendaFixa.qryBuscaTotalResgPoup.ParamByName('sOPER').AsString   := sOper;
      if iOperacao <> -1 then
         DMRendaFixa.qryBuscaTotalResgPoup.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperacao;
      DMRendaFixa.qryBuscaTotalResgPoup.Open;
      if not DMRendaFixa.qryBuscaTotalResgPoup.IsEmpty then
      begin
         fTotVlr := DMRendaFixa.qryBuscaTotalResgPoup.FieldByName('VALOR').AsFloat;
         fTotQtd := DMRendaFixa.qryBuscaTotalResgPoup.FieldByName('QUANTIDADE').AsFloat;
         //AL_73
         fTotVlrTRC := DMRendaFixa.qryBuscaTotalResgPoup.FieldByName('VALORTRC').AsFloat;
         fTotQtdTRC := DMRendaFixa.qryBuscaTotalResgPoup.FieldByName('QTDTRC').AsFloat;
      end;
      Result := True;
   finally
      DMRendaFixa.qryBuscaTotalResgPoup.Close;
   end;
   //AL_103 - Fim
end;

function TRendaFixa.BuscaFluxoPagtoJuros(iIdCurvaRenFix,iIdInvestimento,iIdItemRenfix:integer;dDataRef, dDataOper:TDateTime):boolean;
begin
   //AL_103 - Deixa a query aberta para uso
   Result := False;
   OperComum.LimpaParametros(DMRendaFixa.qryBuscaFluxoPagtoJuros);
   DMRendaFixa.qryBuscaFluxoPagtoJuros.ParamByName('IDCURVARENFIX').AsInteger  := iIdCurvaRenFix;
   DMRendaFixa.qryBuscaFluxoPagtoJuros.ParamByName('IDINVESTIMENTO').AsInteger := iIdInvestimento;
   DMRendaFixa.qryBuscaFluxoPagtoJuros.ParamByName('IDITEMRENFIX').AsInteger   := iIdItemRenfix;
   DMRendaFixa.qryBuscaFluxoPagtoJuros.ParamByName('dDataRef').AsString        :=  DateToStr(dDataRef);
   DMRendaFixa.qryBuscaFluxoPagtoJuros.ParamByName('dDataOper').AsString       :=  DateToStr(dDataOper);
   DMRendaFixa.qryBuscaFluxoPagtoJuros.Open;
   if not DMRendaFixa.qryBuscaFluxoPagtoJuros.IsEmpty then
      Result := True;
end;

function TRendaFixa.BuscaFluxoIncorpJuros(iIdCurvaRenFix,iIdInvestimento,iIdItemRenfix:integer;dDataRef, dDataOper:TDateTime):boolean;
begin
   //AL_103 - Deixa a query aberta para uso
   Result := False;
   OperComum.LimpaParametros(DMRendaFixa.qryBuscaFluxoIncorpJuros);
   DMRendaFixa.qryBuscaFluxoIncorpJuros.ParamByName('IDCURVARENFIX').AsInteger  := iIdCurvaRenFix;
   DMRendaFixa.qryBuscaFluxoIncorpJuros.ParamByName('IDINVESTIMENTO').AsInteger := iIdInvestimento;
   DMRendaFixa.qryBuscaFluxoIncorpJuros.ParamByName('IDITEMRENFIX').AsInteger   := iIdItemRenfix;
   DMRendaFixa.qryBuscaFluxoIncorpJuros.ParamByName('dDataRef').AsString        :=  DateToStr(dDataRef);
   DMRendaFixa.qryBuscaFluxoIncorpJuros.ParamByName('dDataOper').AsString       :=  DateToStr(dDataOper);
   DMRendaFixa.qryBuscaFluxoIncorpJuros.Open;
   if not DMRendaFixa.qryBuscaFluxoIncorpJuros.IsEmpty then
      Result := True;
end;

function TRendaFixa.BuscaFluxoAmortPrinc(iIdCurvaRenFix,iIdInvestimento,iIdItemRenfix:integer;dDataRef, dDataOper:TDateTime):boolean;
begin
   //AL_103 - Deixa a query aberta para uso
   Result := False;
   OperComum.LimpaParametros(DMRendaFixa.qryBuscaFluxoAmortPrinc);
   DMRendaFixa.qryBuscaFluxoAmortPrinc.ParamByName('IDCURVARENFIX').AsInteger  := iIdCurvaRenFix;
   DMRendaFixa.qryBuscaFluxoAmortPrinc.ParamByName('IDINVESTIMENTO').AsInteger := iIdInvestimento;
   DMRendaFixa.qryBuscaFluxoAmortPrinc.ParamByName('IDITEMRENFIX').AsInteger   := iIdItemRenfix;
   DMRendaFixa.qryBuscaFluxoAmortPrinc.ParamByName('dDataRef').AsString        :=  DateToStr(dDataRef);
   DMRendaFixa.qryBuscaFluxoAmortPrinc.ParamByName('dDataOper').AsString       :=  DateToStr(dDataOper);
   DMRendaFixa.qryBuscaFluxoAmortPrinc.Open;
   if not DMRendaFixa.qryBuscaFluxoAmortPrinc.IsEmpty then
      Result := True;
end;

function TRendaFixa.BuscaFluxoProvPerda(iIdCurvaRenFix, iIdInvestimento: Integer; dDataProc: TDateTime): Double;
begin
   //AL_103
   try
      Result := 0;
      OperComum.LimpaParametros(DMRendaFixa.qryBuscaFluxoProvPerda);
      DMRendaFixa.qryBuscaFluxoProvPerda.ParamByName('IDCURVARENFIX').AsInteger  := iIdCurvaRenFix;
      DMRendaFixa.qryBuscaFluxoProvPerda.ParamByName('IDINVESTIMENTO').AsInteger := iIdInvestimento;
      DMRendaFixa.qryBuscaFluxoProvPerda.ParamByName('DATAFLUXO').AsString       := DateToStr(dDataProc);
      DMRendaFixa.qryBuscaFluxoProvPerda.Open;
      DMRendaFixa.qryBuscaFluxoProvPerda.First;
      if not DMRendaFixa.qryBuscaFluxoProvPerda.IsEmpty then
         Result := DMRendaFixa.qryBuscaFluxoProvPerda.FieldByName('PERCFLUXO').AsFloat
   finally
      DMRendaFixa.qryBuscaFluxoProvPerda.Close;
   end;
end;

function TRendaFixa.VerificaFluxo(iIdInvestimento, iIdCurvaRenFix: Integer;
                                  dDataProc: TDateTime): Boolean;
begin
   //AL_103
   try
      Result := False;
      OperComum.LimpaParametros(DMRendaFixa.qryBuscaFluxo);
      DMRendaFixa.qryBuscaFluxo.ParamByName('DATAFLUXO').AsString       := DateToStr(dDataProc);
      DMRendaFixa.qryBuscaFluxo.ParamByName('IDINVESTIMENTO').AsInteger := iIdInvestimento;
      DMRendaFixa.qryBuscaFluxo.ParamByName('IDCURVARENFIX').AsInteger  := iIdCurvaRenFix;
      DMRendaFixa.qryBuscaFluxo.Open;
      if not DMRendaFixa.qryBuscaFluxo.IsEmpty then
         Result := True;
   finally
      DMRendaFixa.qryBuscaFluxo.Close;
   end;
end;

function TRendaFixa.CurvaContabil(iInvestimento, iCurva: Integer): String;
begin
   //AL_103
   Result := 'N';
   try
      OperComum.LimpaParametros(DMRendaFixa.qryCurvaContabil);
      DMRendaFixa.qryCurvaContabil.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
      DMRendaFixa.qryCurvaContabil.ParamByName('IDCURVARENFIX').AsInteger := iCurva;
      DMRendaFixa.qryCurvaContabil.Open;
      if DMRendaFixa.qryCurvaContabil.FieldByName('FLGCURVACONTABIL').IsNull then
      begin
         MsgDlg('Perfil Não Definido se Contábil ou Não:' + #13 +
                DMRendaFixa.qryCurvaContabil.FieldByName('DESCCURVARENFIX').AsString,
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := 'N';
      end
      else
         Result := DMRendaFixa.qryCurvaContabil.FieldByName('FLGCURVACONTABIL').AsString;
   Finally
      DMRendaFixa.qryCurvaContabil.Close;
   end;
end;

function TRendaFixa.FazContabilizacao(iFlgGeraContab, iInvestimento, iCurvaRenfix : Integer;
                                      sOper : string; fPuItem: Double = 1): Boolean;
var bCurvaContabil: Boolean;
begin
   //AL_103 - Ini
   Result := False;

   //AL_85
   if sOper <> 'Atualizacao' then
   begin
      //AL_103
      if not ((iFlgGeraContab = 1) and (CtrlPInv.IntFinContabRF = 'S') and (CtrlPInv.FlgImplantaRF = 'N')) then
         Exit;
   end;

   // O Valor for diferente de zero
   if OperComum.Round(Abs(fPuItem),2) = 0 then
      Exit;

   if sOper = 'Aplicacao' then
      bCurvaContabil := (CurvaContabil(iInvestimento, iCurvaRenfix) = 'Y')
   else
      bCurvaContabil := (CurvaContabil(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                       DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger) = 'Y');

   if (((bCurvaContabil) and (DMRendaFixa.qryBuscaSaldosItems.FieldByName('FLGDESTACADO').AsString <> 'N')) or
       (DMRendaFixa.qryBuscaSaldosItems.FieldByName('FLGDESTACADO').AsString = 'Y')) then
      //Se (o Perfil for Contabil e o Item for Destacado <> N) ou (o Item for Destacado = Y) (Contabilizado)
      Result := True
   else
      // O Perfil Não é Contabil ou o Item Não é Contabilizado (Destacado = 'N')
      Result := False;
   //AL_103 - Fim
end;

function TRendaFixa.CotaRenfix(iInvestimento, iCurva: Integer): Boolean;
begin
   //AL_103
   Result := False;
   try
      OperComum.LimpaParametros(DMRendaFixa.qryCurvaContabil);
      DMRendaFixa.qryCurvaContabil.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
      DMRendaFixa.qryCurvaContabil.ParamByName('IDCURVARENFIX').AsInteger := iCurva;
      DMRendaFixa.qryCurvaContabil.Open;
      Result := (DMRendaFixa.qryCurvaContabil.FieldByName('FLGCOTRENFIX').AsString = 'Y');
   Finally
      DMRendaFixa.qryCurvaContabil.Close;
   end;
end;

function TRendaFixa.ExisteCotacaoRF(iInvestimento: Integer; dDataCotacao, dDataVencimento: TDateTime;
                                    var fCotRenFix:double): Boolean;
begin
   //AL_103
   Result := False;
   fCotRenFix := 0;
   try
      OperComum.LimpaParametros(DMRendaFixa.qryBuscaCotRenFix);
      DMRendaFixa.qryBuscaCotRenFix.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
      DMRendaFixa.qryBuscaCotRenFix.ParamByName('DATACOTACAO').AsString := DateToStr(dDataCotacao);
      DMRendaFixa.qryBuscaCotRenFix.ParamByName('DATAVENCTO').AsString := DateToStr(dDataVencimento);
      DMRendaFixa.qryBuscaCotRenFix.Open;
      if not DMRendaFixa.qryBuscaCotRenFix.IsEmpty then
      begin
         fCotRenFix := DMRendaFixa.qryBuscaCotRenFix.FieldByName('VLRCOTACAO').AsFloat;
         Result := True;
      end;
   finally
      DMRendaFixa.qryBuscaCotRenFix.Close;
   end;
end;


function TRendaFixa.DiminuiValores(fValor1, fValor2: Double): Double;
var i, iDec: Integer;
    sValor, sFormato: String;
    fValForm1, fValForm2: Double;
begin
   // Prepara Primeiro Valor
   sFormato := '#0.';
   sValor := FloatToStr(fValor1);
   iDec := Length(sValor) - Pos(DecimalSeparator,sValor);
   for i := 1 to iDec do
      sFormato := sFormato + '#';

   sValor := FormatFloat(sFormato,OperComum.Trunca(fValor1,iDec));
   sValor := TrocaPontoVirgula(sValor);
   fValForm1 := StrToFloat(sValor);

   // Prepara Segundo Valor
   sFormato := '#0.';
   sValor := FloatToStr(fValor2);
   iDec := Length(sValor) - Pos(DecimalSeparator,sValor);
   for i := 1 to iDec do
      sFormato := sFormato + '#';

   sValor := FormatFloat(sFormato,OperComum.Trunca(fValor2,iDec));
   sValor := TrocaPontoVirgula(sValor);
   fValForm2 := StrToFloat(sValor);

   Result := fValForm1 - fValForm2;

end;

function TRendaFixa.FazIrLitigioTrimestral(dDataProc:TDateTime;
                                           bDiaUtil,bOper:boolean;
                                           sHistorico:String;
                                           iIdPlanPrevCtbPatr,
                                           iIdInvestimento,
                                           iIdOperRenFix,
                                           iIdHistRenFix : Integer;
                                           fIR,fRend:Double):boolean;
var
   //AL_22
   wQryAux : TwwQuery;
begin
   //AL_103 - ini
   Result := False;

   try // finally
      //AL_22
      wQryAux := TwwQuery.Create(Application);
      wQryAux.DatabaseName := 'BaseDados';

      // Grava IR Trimestral (RET)
      if not bOper then  // Atualização
      begin
         if not Impostos.VerificaRetTrimestral(dDataProc,True,bOper) then
            Exit;
      end
      else
      begin
         // Se o Resgate for no dia do RET(Trimestre), não gravo pois já foi gravado pela Atualização
         if not Impostos.VerificaRetTrimestral(dDataProc,True,bOper) then
            Exit;

         // Deleta o IRLITIGIO da Operação em caso de Reprocesso
         //AL_22
         wQryAux.SQL.Clear;
         wQryAux.SQL.Text := 'DELETE FROM IRLITIGIO WHERE IDOPERRENFIX = ' + IntToStr(iIdOperRenfix);
         wQryAux.ExecSQL;
      end;
      // Monta o plano e patrocinadora
      OperComum.LimpaParametros(dtmOperComum.qryBuscaPlanPatro);
      dtmOperComum.qryBuscaPlanPatro.ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanPrevCtbPatr;
      dtmOperComum.qryBuscaPlanPatro.Open;
      if not Impostos.GravaIrLitigio(1,dDataProc,-1,sHistorico,
                                     iIdInvestimento,
                                     dtmOperComum.qryBuscaPlanPatro.FieldByName('IDPLANOPREV').AsInteger,
                                     dtmOperComum.qryBuscaPlanPatro.FieldByName('IDPATRO').AsInteger,
                                     fIR,fRend,iIdOperRenfix,-1,-1,iIdHistRenFix,-1 ) then
         Exit;

      Result := True;
   Finally
      //AL_22
      dtmOperComum.qryBuscaPlanPatro.Close;
      FreeAndNil(wQryAux);
   end;
   //AL_103 - Fim
end;


function TRendaFixa.ConvertePUValor(fPu, fPUAcu, fQtd, fPuEmi: Double;
                                    sTipoItem: String; iClasseTit: Integer): Double;
begin
   //AL_103
   if (iClasseTit in [CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq]) then
   begin
      // Poupança os items T e M são os próprios valores
      if sTipoItem = 'P' then
         Result := fPU * fQtd
      else if sTipoItem[1] in ['T','M'] then
         Result := fPU
      else
         Result := fPU;
   end else
   begin
      if sTipoItem = 'P' then
         Result := fPU * fQtd
      else if sTipoItem = 'T' then
         Result := fPUAcu * fQtd
      else if sTipoItem = 'M' then
         Result := (fPUAcu - fPuEmi ) * fQtd
      else
         Result := fPU;
   end;
end;

//AL_17
function TRendaFixa.ConvertePUAcuValor(fPUAcu, fQtd, fPuEmi: Double;
                                       sTipoItem: String; iClasseTit: Integer): Double;
begin
   //AL_103
   if (iClasseTit in [CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq]) then
   begin
      // Poupança os items T e M são os próprios valores
      if sTipoItem = 'P' then
         Result := fPUAcu * fQtd
      // AL_18 - 28/03/2005
      else
         Result := fPUAcu;
   end else
   begin
      // AL_18 - 28/03/2005
      if sTipoItem[1] in ['P','T','M'] then
         Result := fPUAcu * fQtd
      else
         Result := fPUAcu;
   end;
end;


{ Rotina de Exclusão de Histórico de Operações
  Exclui Operações Posteriores ao ATU ou Operações Marcadas com FLGREPROC = 'S'
  Precisa ter rodado a BuscaSaldos e a BuscaSaldosAux}
//AL_103
function TRendaFixa.ExcluiOpeAntecipada(dDataProc: TDateTime;
                                        iOperAplic, iInvestimento, iIdHistRenFix: Integer): Boolean;
begin
   //AL_103
   Result := False;
   try
      // Havendo Operações (posteriores ao ATU), estas devem ser excluídas para serem
      //   relançadas com os novos valores corretos
      OperComum.LimpaParametros(DMRendaFixa.qryBuscaHistOper);
      DMRendaFixa.qryBuscaHistOper.ParamByName('DATAOPER').AsString := DateToStr(dDataProc);
      if iOperAplic <> -1 then
         DMRendaFixa.qryBuscaHistOper.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperAplic;
      if iInvestimento <> -1 then
         DMRendaFixa.qryBuscaHistOper.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
      if iIdHistRenFix <> -1 then
         DMRendaFixa.qryBuscaHistOper.ParamByName('IDHISTRENFIX').AsInteger := iIdHistRenFix
      else
         DMRendaFixa.qryBuscaHistOper.ParamByName('IDHISTRENFIX').AsInteger := 9999999;

      DMRendaFixa.qryBuscaHistOper.Open;
      DMRendaFixa.qryBuscaHistOper.First;
      while not DMRendaFixa.qryBuscaHistOper.Eof do
      begin
         //27/05/2004 - Parametro para não voltar mais a data de abertura
         //AL_83
         //AL_103
         //Exclui o Histórico de cada Operação
         if not ExcluiHistRenFix(dDataProc, True,
                                 DMRendaFixa.qryBuscaHistOper.FieldByName('IDHISTRENFIX').AsInteger,
                                 -1,-1, -1, False, True, nil, False) then
            Raise Exception.Create('Não foi possível Excluir ' + #13 +
                                   DMRendaFixa.qryBuscaHistOper.FieldByName('HISTMOVRENFIX').AsString + #13 +
                                   'em ' + DateToStr(dDataProc));
         DMRendaFixa.qryBuscaHistOper.Next;
      end;
      Result := True;
   finally
      DMRendaFixa.qryBuscaHistOper.Close;
   end;
end;

function TRendaFixa.GeraNumBoleta(dDataOper: TDateTime; iOperAplic: Integer;
                                  sBoleta: String = ''): String;
begin
   Result := '';
   //AL_68
   //AL_103
   if (dDataoper > 0) then //and (iOperAplic > 0) then
   begin
      try
         OperComum.LimpaParametros(DMRendaFixa.qryNumBoleta);
         DMRendaFixa.qryNumBoleta.ParamByName('DATAOPERACAO').AsString := DateToStr(dDataOper);
         DMRendaFixa.qryNumBoleta.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperAplic;
         DMRendaFixa.qryNumBoleta.Open;
         if not DMRendaFixa.qryNumBoleta.IsEmpty then
            Result := DMRendaFixa.qryNumBoleta.FieldByName('BOLETA').AsString
         else
         begin
            if sBoleta = '' then
               Result := 'RF-' + Copy(DateToStr(dDataoper),9,2) + '/' +
                         FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR'))
            else
               Result := sBoleta;
         end;
      finally
         DMRendaFixa.qryNumBoleta.Close;
      end;
   end;
end;

{------------------------------------------------------------------
 Objetivo: Recalcular  Quantidade, Valor e PU de acordo com o novo
                       Saldo Recalculado pelo Reprocessamento e
                       Atualizar a operação com estes valores
------------------------------------------------------------------}
function TRendaFixa.RecalculaTransf(iOperacao: Integer): Boolean;
var fPerc, fQtd, fVal, fPUOpe: Double;
   //AL_22
   wQryAux : TwwQuery;
begin
   Result := False;
   //AL_22
   //AL_103 - Ini
   try

      wQryAux := TwwQuery.Create(Application);
      wQryAux.DatabaseName := 'BaseDados';

      // Busca a operação
      // AL_3 - 06/07/2004 - Busca somente Transferencias
      wQryAux.SQL.Clear;
      wQryAux.SQL.Add('SELECT OPERRENFIX.PERCTRANSF, OPERRENFIX.QTDEOPERACAO, OPERRENFIX.VLROPERACAO, ');
      wQryAux.SQL.Add('       OPERRENFIX.DATAOPERACAO, OPERRENFIX.IDINVESTIMENTO, OPERRENFIX.IDOPERRENFIXAPLIC, ');
      wQryAux.SQL.Add('       OPERRENFIX.BOLETA, OPERRENFIX.IDTIPOOPERACAO ');
      wQryAux.SQL.Add('FROM OPERRENFIX ');
      wQryAux.SQL.Add('WHERE OPERRENFIX.IDOPERRENFIX = ' + IntToStr(iOperacao) + ' ');
      wQryAux.SQL.Add('  AND OPERRENFIX.IDTIPOOPERACAO IN (-98,-97)');
      wQryAux.Open;

      // Se Não achar a operação ou Não for Transferência (Boleta gravada), Sai
      // Tratar o percentual de transferencia e não se a boleta está gravada. Ou o Tipo de Operação
      if ((wQryAux.IsEmpty) or
          (wQryAux.FieldByName('BOLETA').IsNull) or
          (wQryAux.FieldByName('PERCTRANSF').IsNull)) then
      begin
          Result := True;
          Exit;
      end;
      // AL_3 - Fim
      // Busca o Saldo atual do Investimento
      // Busca Saldo da Operaço Origem
      DMRendaFixa.qryAux2.SQL.Clear;
      DMRendaFixa.qryAux2.SQL.Add('SELECT O.IDOPERRENFIXAPLIC, MAX(H.IDHISTRENFIX) AS IDHISTRENFIX ');
      DMRendaFixa.qryAux2.SQL.Add('FROM OPERRENFIX O, HISTRENFIX H ');
      DMRendaFixa.qryAux2.SQL.Add('WHERE O.BOLETA = (SELECT DISTINCT BOLETA FROM OPERRENFIX WHERE IDOPERRENFIX = ' + IntToStr(iOperacao) + ') ');
      DMRendaFixa.qryAux2.SQL.Add('  AND O.IDTIPOOPERACAO = -97 ');
      DMRendaFixa.qryAux2.SQL.Add('  AND H.IDINVESTIMENTO = O.IDINVESTIMENTO ');
      DMRendaFixa.qryAux2.SQL.Add('  AND H.DATAHISTRENFIX = O.DATAOPERACAO ');
      DMRendaFixa.qryAux2.SQL.Add('  AND H.IDOPERRENFIXAPLIC = O.IDOPERRENFIXAPLIC ');
      DMRendaFixa.qryAux2.SQL.Add('GROUP BY O.IDOPERRENFIXAPLIC');
      DMRendaFixa.qryAux2.Open;

      //AL_68
      BuscaSaldosAux(wQryAux.FieldByName('DATAOPERACAO').AsDateTime,
                     wQryAux.FieldByName('IDINVESTIMENTO').AsInteger,
                     DMRendaFixa.qryAux2.FieldByName('IDOPERRENFIXAPLIC').AsInteger, 3,
                     DMRendaFixa.qryAux2.FieldByName('IDHISTRENFIX').AsInteger);

      // Capta Valores Anteriores
      fPerc := wQryAux.FieldByName('PERCTRANSF').AsFloat;
      fQtd  := DMRendaFixa.qryBuscaSaldosHistAux.FieldByName('SALDOQTDHISTRENFI').AsFloat;
      fVal  := DMRendaFixa.qryBuscaSaldosHistAux.FieldByName('SALDOVLRHISTRENFI').AsFloat;

      // Calcula Novos Valores
      fQtd := OperComum.Round(OperComum.DivValorZero((fPerc * fQtd),100),9);
      fVal := OperComum.Round(OperComum.DivValorZero((fPerc * fVal),100),2);

      // Localiza o Item Correção (Único do tipo 'M' - Moeda)
      DMRendaFixa.qryBuscaSaldosItemsAux.Locate('TIPOITEM', 'M',[loPartialKey]);
      fPUOpe := DMRendaFixa.qryBuscaSaldosItemsAux.FieldByName('PUACUITEM').AsFloat;

       // Faz Update nos valores da Operação
      wQryAux.SQL.Clear;
      wQryAux.SQL.Add('UPDATE OPERRENFIX ');
      wQryAux.SQL.Add('SET QTDEOPERACAO = ' + TrocaVirgulaPonto(FloatToStr(fQtd)) + ', ');
      wQryAux.SQL.Add('    VLROPERACAO = ' + TrocaVirgulaPonto(FloatToStr(fVal))  + ', ');
      wQryAux.SQL.Add('    PUOPERACAO = ' + TrocaVirgulaPonto(FloatToStr(fPUOpe)) + ' ');
      wQryAux.SQL.Add('WHERE IDOPERRENFIX = ' + IntToStr(iOperacao));
      wQryAux.ExecSQL;

       // Gravar também os valores dos items
       // Quantidade
      wQryAux.SQL.Clear;
      wQryAux.SQL.Add('UPDATE OPERRENFIXXCURVAS ');
      wQryAux.SQL.Add('SET VLRCURVA = ' + TrocaVirgulaPonto(FloatToStr(fQtd)) + ' ');
      wQryAux.SQL.Add('WHERE IDOPERRENFIX = ' + IntToStr(iOperacao) + ' ' );
      wQryAux.SQL.Add('  AND IDITEMRENFIX = -2');
      wQryAux.ExecSQL;

       // Valor Liquido e Bruto
      wQryAux.SQL.Clear;
      wQryAux.SQL.Add('UPDATE OPERRENFIXXCURVAS ');
      wQryAux.SQL.Add('SET VLRCURVA = ' + TrocaVirgulaPonto(FloatToStr(fVal)) + ' ');
      wQryAux.SQL.Add('WHERE IDOPERRENFIX = ' + IntToStr(iOperacao) + ' ' );
      wQryAux.SQL.Add('  AND IDITEMRENFIX IN (-5,-6)');
      wQryAux.ExecSQL;

       // PU da Operação
      wQryAux.SQL.Clear;
      wQryAux.SQL.Add('UPDATE OPERRENFIXXCURVAS ');
      wQryAux.SQL.Add('SET VLRCURVA = ' + TrocaVirgulaPonto(FloatToStr(fPUOpe)) + ' ');
      wQryAux.SQL.Add('WHERE IDOPERRENFIX = ' + IntToStr(iOperacao));
      wQryAux.SQL.Add('  AND IDITEMRENFIX = -4');
      wQryAux.ExecSQL;

      Result := True;

   finally
     //AL_22
     //AL_103
     wQryAux.Close;
     FreeAndNil(wQryAux);
     DMRendaFixa.qryAux2.Close;
     DMRendaFixa.qryAux2.SQL.Clear;
     DMRendaFixa.qryBuscaSaldosHistAux.Close;
   end;
   //AL_103 - Fim
end;

function TRendaFixa.BuscaFluxosNoDia(iIdInvestimento,iIdOperAplic:Integer;dDataRef:String):Double;
begin
   //AL_103
   try
      Result := 0;
      OperComum.LimpaParametros(DMRendaFixa.qryBuscaFluxosNoDia);
      DMRendaFixa.qryBuscaFluxosNoDia.ParamByName('IDINVESTIMENTO').AsInteger    := iIdInvestimento;
      DMRendaFixa.qryBuscaFluxosNoDia.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iIdOperAplic;
      DMRendaFixa.qryBuscaFluxosNoDia.ParamByName('DATAOPERACAO').AsString           := dDataRef;
      DMRendaFixa.qryBuscaFluxosNoDia.Open;
      if not DMRendaFixa.qryBuscaFluxosNoDia.IsEmpty then
         Result := DMRendaFixa.qryBuscaFluxosNoDia.FieldByName('VLROPERACAO').AsFloat;
   finally
      DMRendaFixa.qryBuscaFluxosNoDia.Close;
   end;
end;

//AL_103
function TRendaFixa.ExcluiATUeOPECotRenFix(dDataProc: String;
                                           iInvestimento: Integer = -1;
                                           iOperacaoAplic: Integer = -1): String;
begin
   // Busca o Resgate e a 2ª Atualização - Se houver Resgate, Exclui estes registro
   // para reprocessamento
   //AL_103
   Result := '';
   try
      OperComum.LimpaParametros(DMRendaFixa.qryBuscaOPECotRenFix);
      DMRendaFixa.qryBuscaOPECotRenFix.ParamByName('DATAHISTRENFIX').AsString     := dDataProc;
      if iOperacaoAplic <> -1 then
         DMRendaFixa.qryBuscaOPECotRenFix.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperacaoAplic;
      if iInvestimento <> -1 then
         DMRendaFixa.qryBuscaOPECotRenFix.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
      DMRendaFixa.qryBuscaOPECotRenFix.Open;
      if not DMRendaFixa.qryBuscaOPECotRenFix.IsEmpty then
      begin
         // Verifica se houve OPE para excluir
         while not DMRendaFixa.qryBuscaOPECotRenFix.EOF do
         begin
            Try
               // Exclui a Operação
               // 27/05/2004 - Parametro para não voltar mais a data de abertura
               //AL_83
               //AL_103
               if not RendaFixa.ExcluiHistRenFix(StrToDate(dDataProc),True,
                                                 DMRendaFixa.qryBuscaOPECotRenFix.FieldByName('IDHISTRENFIX').AsInteger,
                                                 DMRendaFixa.qryBuscaOPECotRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger, -1,
                                                 DMRendaFixa.qryBuscaOPECotRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 False, False,
                                                 nil,False) then
                  Raise Exception.Create('Não foi possível Excluir Movimentação do Dia ' + dDataProc + #13 +
                                         'Investimento: ' + DMRendaFixa.qryBuscaOPECotRenFix.FieldByName('IDINVESTIMENTO').AsString);

               // Exclui a 2ª Atualização
               OperComum.LimpaParametros(DMRendaFixa.qryBuscaATUCotRenFix);
               DMRendaFixa.qryBuscaATUCotRenFix.ParamByName('DATAHISTRENFIX').AsString     := dDataProc;
               DMRendaFixa.qryBuscaATUCotRenFix.ParamByName('IDOPERRENFIXAPLIC').AsInteger := DMRendaFixa.qryBuscaOPECotRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
               DMRendaFixa.qryBuscaATUCotRenFix.ParamByName('IDINVESTIMENTO').AsInteger    := DMRendaFixa.qryBuscaOPECotRenFix.FieldByName('IDINVESTIMENTO').AsInteger;
               DMRendaFixa.qryBuscaATUCotRenFix.ParamByName('IDHISTRENFIX').AsInteger      := DMRendaFixa.qryBuscaOPECotRenFix.FieldByName('IDHISTRENFIX').AsInteger;
               DMRendaFixa.qryBuscaATUCotRenFix.Open;
               if not DMRendaFixa.qryBuscaATUCotRenFix.IsEmpty then
               begin
                  //AL_83
                  //AL_103
                  if not RendaFixa.ExcluiHistRenFix(StrToDate(dDataProc),
                                                    True,
                                                    DMRendaFixa.qryBuscaATUCotRenFix.FieldByName('IDHISTRENFIX').AsInteger,
                                                    DMRendaFixa.qryBuscaATUCotRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger, -1,
                                                    DMRendaFixa.qryBuscaATUCotRenFix.FieldByName('IDINVESTIMENTO').AsInteger,
                                                    False,
                                                    False,
                                                    nil,
                                                    False,
                                                    True) then
                     Raise Exception.Create('Não foi possível Excluir Movimentação do Dia ' + dDataProc + #13 +
                                            'Investimento: ' + DMRendaFixa.qryBuscaSaldosHistAux.FieldByName('DESCINVESTIMENTO').AsString);
               end;
            except
               on E: Exception do
               begin
                  Result := E.Message;
                  Exit;
               end;
            end;
            DMRendaFixa.qryBuscaOPECotRenFix.Next;
         end;
      end;
   finally
      //AL_103
      DMRendaFixa.qryBuscaOPECotRenFix.Close;
      DMRendaFixa.qryBuscaATUCotRenFix.Close;
   end;
end;

function TRendaFixa.BuscaVlrCotRenfix(dDataProc,dDataVenc:String;
                                      iInvestimento,iOperAplic : Integer;
                                      var fSldAntCotRenFix : Double):Double;
var
   fCotaAtu,fCotaAnt,fPUItem : Double;
   dDataAnt : TDateTime;
begin
   Result := 0;
   fSldAntCotRenFix := 0;

   if not ExisteCotacaoRF(iInvestimento,
                          StrToDate(dDataProc),
                          StrToDate(dDataVenc),
                          fCotaAtu) then
      Exit;

   dDataAnt := DiasUteisInv.UltDiaUtilAnterior(StrToDate(dDataProc),-1,1,'',True,False,False);

   if not ExisteCotacaoRF(iInvestimento,
                          dDataAnt,
                          StrToDate(dDataVenc),
                          fCotaAnt) then
      Exit;

   // Melhorar para verificar se houve diferença na cotação do dia
   fPUItem := fCotaAtu - fCotaAnt;

   try
      // Verifica se houve resgate no dia para pegar a 1ª Atu
      //AL_103
      OperComum.LimpaParametros(DMRendaFixa.qryBuscaOPECotRenFix);
      DMRendaFixa.qryBuscaOPECotRenFix.ParamByName('DATAHISTRENFIX').AsString     := dDataProc;
      DMRendaFixa.qryBuscaOPECotRenFix.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperAplic;
      DMRendaFixa.qryBuscaOPECotRenFix.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
      DMRendaFixa.qryBuscaOPECotRenFix.Open;
      if not DMRendaFixa.qryBuscaOPECotRenFix.IsEmpty then
      begin
         OperComum.LimpaParametros(DMRendaFixa.qryBuscasSldQtdHist);
         DMRendaFixa.qryBuscasSldQtdHist.ParamByName('DATAHISTRENFIX').AsString     := dDataProc;
         DMRendaFixa.qryBuscasSldQtdHist.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
         DMRendaFixa.qryBuscasSldQtdHist.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperAplic;
         DMRendaFixa.qryBuscasSldQtdHist.ParamByName('IDHISTRENFIX').AsInteger      := DMRendaFixa.qryBuscaOPECotRenFix.FieldByName('IDHISTRENFIX').AsInteger;
         DMRendaFixa.qryBuscasSldQtdHist.Open;
         if not DMRendaFixa.qryBuscasSldQtdHist.IsEmpty then
         begin
            if DMRendaFixa.qryBuscasSldQtdHist.FieldByName('PLNCODIGO').IsNull then // Existe um ATU não Contabilizado
            begin
               // Não foi contabilizado na 1ª Atualização e existe resgate após a atualização
               // Contabiliza pela qtd antes do resgate
               fSldAntCotRenFix := DMRendaFixa.qryBuscasSldQtdHist.FieldByName('SALDOQTDHISTRENFI').AsFloat;
               Result := fPUItem;
            end;
         end;
      end
      else
      begin
         OperComum.LimpaParametros(DMRendaFixa.qryBuscasSldQtdHist);
         DMRendaFixa.qryBuscasSldQtdHist.ParamByName('DATAHISTRENFIX').AsString     := dDataProc;
         DMRendaFixa.qryBuscasSldQtdHist.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
         DMRendaFixa.qryBuscasSldQtdHist.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperAplic;
         DMRendaFixa.qryBuscasSldQtdHist.ParamByName('IDHISTRENFIX').AsInteger      := 9999999;
         DMRendaFixa.qryBuscasSldQtdHist.Open;
         if not DMRendaFixa.qryBuscasSldQtdHist.IsEmpty then
         begin
            fSldAntCotRenFix := DMRendaFixa.qryBuscasSldQtdHist.FieldByName('SALDOQTDHISTRENFI').AsFloat;
            Result := fPUItem;
         end;
      end;
   finally
      DMRendaFixa.qryBuscaOPECotRenFix.Close;
      DMRendaFixa.qryBuscasSldQtdHist.Close;
   end;
end;

function TRendaFixa.MarcadoReproc(iInvestimento, iOperAplic: Integer): Boolean;
begin
   //AL_103 - Ini
   try
      Result := False;
      OperComum.LimpaParametros(DMRendaFixa.qryMarcadoReproc);
      if iInvestimento > 0 then
         DMRendaFixa.qryMarcadoReproc.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
      if iOperAplic > 0 then
         DMRendaFixa.qryMarcadoReproc.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperAplic;
      //AL_70
      DMRendaFixa.qryMarcadoReproc.ParamByName('DATAULTFECHRF').AsString         := DateToStr(CtrlPInv.DataUltFechRF);
      DMRendaFixa.qryMarcadoReproc.Open;
      Result := (not DMRendaFixa.qryMarcadoReproc.IsEmpty);
   finally
      DMRendaFixa.qryMarcadoReproc.Close;
   end;
   //AL_103 - Fim
end;

function TRendaFixa.MarcaInvRep(dDataRef: TDateTime;
                                iInvestimento: Integer = -1;
                                iOperAplic: Integer = -1;
                                iPlanPrev: Integer = -1;
                                iCarteira: Integer = -1;
                                fStatusFlag: String = 'S'): Integer;
var
   //Ricardo Cristiano - 30/10/2008 - N. Sol 99825 -  N. Kintana 439935
   //AL_69
   wQryAuxLocal : TwwQuery;
   sSql : String;
begin
   // AL_38 - Ini - Passa a testar o periodo contábil
   //AL_103 - Ini
   try
      Result := -1;

     //Ricardo Cristiano - 30/10/2008 - N. Sol 99825 -  N. Kintana 439935
      //AL_69
      wQryAuxLocal := TwwQuery.Create(Application);
      wQryAuxLocal.DatabaseName := 'BaseDados';
      //AL_45
      //AL_69
      if fStatusFlag <> 'N' then
      begin
        //Ricardo Cristiano - 30/10/2008 - N. Sol 99825 -  N. Kintana 439935
         wQryAuxLocal.SQL.Add('SELECT IDCLASSETIT ');
         wQryAuxLocal.SQL.Add('FROM INVESTIMENTO');
         wQryAuxLocal.SQL.Add('WHERE IDINVESTIMENTO = ' + IntToStr(iInvestimento));
         wQryAuxLocal.Open;

         if not CtrlInvContab.TestaPeriodo(DateToStr(dDataRef), 1, -1, wQryAuxLocal.FieldByName('IDCLASSETIT').AsInteger) then
            Raise Exception.Create(CtrlInvContab.MessageInfo);
      end;
//Ricardo Cristiano - 30/10/2008 - N. Sol 99825 -  N. Kintana 439935
{      OperComum.LimpaParametros(DMRendaFixa.qryMarcaInvRep);
      DMRendaFixa.qryMarcaInvRep.ParamByName('FLAG').AsString := fStatusFlag;
      if iCarteira > 0 then
         DMRendaFixa.qryMarcaInvRep.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteira;
      if iPlanPrev > 0 then
         DMRendaFixa.qryMarcaInvRep.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
      if iInvestimento > 0 then
         DMRendaFixa.qryMarcaInvRep.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
      if iOperAplic > 0 then
         DMRendaFixa.qryMarcaInvRep.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperAplic;
      DMRendaFixa.qryMarcaInvRep.ParamByName('DATAHISTRENFIX').AsString := DateToStr(dDataRef);
      DMRendaFixa.qryMarcaInvRep.ExecSql;}
//Ricardo Cristiano - 30/10/2008 - N. Sol 99825 -  N. Kintana 439935
      OperComum.LimpaParametros(DMRendaFixa.qryMarcaInvRep);
      DMRendaFixa.qryMarcaInvRep.SQL.Clear;
      sSql:='';
      sSql:= sSql + ('');
      sSql:= sSql + (' SELECT HISTRENFIX.IDHISTRENFIX FROM HISTRENFIX ');
      sSql:= sSql + (' WHERE (HISTRENFIX.IDHISTRENFIX  IN ( ');
      sSql:= sSql + ('        SELECT MIN(H2.IDHISTRENFIX) ');
      sSql:= sSql + ('        FROM HISTRENFIX H2, ');
      sSql:= sSql + ('            (SELECT MAX(H3.DATAHISTRENFIX) AS DATAHISTRENFIX, ');
      sSql:= sSql + ('                    H3.IDINVESTIMENTO, ');
      sSql:= sSql + ('                    H3.IDOPERRENFIXAPLIC, ');
      sSql:= sSql + ('                    H3.IDPLANPREVCTBPATR, ');
      sSql:= sSql + ('                    H3.IDCARTEIRAINVEST ');
      sSql:= sSql + ('             FROM HISTRENFIX H3 ');
      sSql:= sSql + ('             WHERE ');
       if fStatusFlag = 'N' then
             sSql:= sSql + ('                 (H3.DATAHISTRENFIX <= TO_DATE('+QuotedStr(DateToStr(dDataRef))+','+QuotedStr('DD/MM/YYYY')+')) ')
       else
             sSql:= sSql + ('                 (H3.DATAHISTRENFIX = TO_DATE('+QuotedStr(DateToStr(dDataRef))+','+QuotedStr('DD/MM/YYYY')+')) ');
      if iInvestimento > 0 then
         sSql:= sSql + ('             AND (H3.IDINVESTIMENTO = '+IntToStr(iInvestimento)+')');
      if iOperAplic > 0 then
         sSql:= sSql + ('             AND (H3.IDOPERRENFIXAPLIC = '+IntToStr(iOperAplic)+')');
      if iPlanPrev > 0 then
         sSql:= sSql + ('             AND (H3.IDPLANPREVCTBPATR = '+IntToStr(iPlanPrev)+')');
      if iCarteira > 0 then
         sSql:= sSql + ('             AND (H3.IDCARTEIRAINVEST  = '+IntToStr(iCarteira)+')');
      sSql:= sSql + ('             GROUP BY H3.IDINVESTIMENTO, H3.IDOPERRENFIXAPLIC, H3.IDPLANPREVCTBPATR, H3.IDCARTEIRAINVEST) HMAX ');
      sSql:= sSql + ('        WHERE ');
      sSql:= sSql + ('            (H2.DATAHISTRENFIX    = HMAX.DATAHISTRENFIX) ');
      sSql:= sSql + ('        AND (H2.IDINVESTIMENTO    = HMAX.IDINVESTIMENTO) ');
      sSql:= sSql + ('        AND (H2.IDOPERRENFIXAPLIC = HMAX.IDOPERRENFIXAPLIC) ');
      sSql:= sSql + ('        AND (H2.IDPLANPREVCTBPATR = HMAX.IDPLANPREVCTBPATR) ');
      sSql:= sSql + ('        AND (H2.IDCARTEIRAINVEST  = HMAX.IDCARTEIRAINVEST) ');
      sSql:= sSql + ('        AND (NOT EXISTS (SELECT H4.IDOPERRENFIX ');
      sSql:= sSql + ('                         FROM HISTRENFIX H4 ');
      sSql:= sSql + ('                         WHERE ');
      sSql:= sSql + ('                              (H4.DATAHISTRENFIX = H2.DATAHISTRENFIX) ');
      sSql:= sSql + ('                         AND  (H4.IDINVESTIMENTO = H2.IDINVESTIMENTO) ');
      sSql:= sSql + ('                         AND  (H4.IDOPERRENFIXAPLIC = H2.IDOPERRENFIXAPLIC) ');
      sSql:= sSql + ('                         AND  (H4.SALDOQTDHISTRENFI = 0) ');
      sSql:= sSql + ('                         AND  (H4.FLGRECALC = ''S'') ) ) ');
      sSql:= sSql + ('        GROUP BY H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC, H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST ) ) ');
      sSql:= sSql + (' AND (HISTRENFIX.SALDOQTDHISTRENFI > 0) ');
      sSql:= sSql + (' ORDER BY HISTRENFIX.IDHISTRENFIX ');
      DMRendaFixa.qryMarcaInvRep.SQL.Add(sSql);
      DMRendaFixa.qryMarcaInvRep.Open;

      //Ricardo Cristiano - 05/11/2008 - N. Sol 100396 -  N. Kintana 443929
      //Thiago Passos SOL 39918 - Kintana 523459
     Result := 1;
     if DMRendaFixa.qryMarcaInvRep.RecordCount > 0 then
      begin

      while not DMRendaFixa.qryMarcaInvRep.Eof do
      begin
         if fStatusFlag = 'N' then         //Thiago Passos SOL 39918 - Kintana 523459
           begin
              wQryAuxLocal.SQL.Clear;
              wQryAuxLocal.SQL.Add(' UPDATE HISTRENFIX SET FLGRECALC = NULL ');
              wQryAuxLocal.SQL.Add(' WHERE IDHISTRENFIX IN  (SELECT IDHISTRENFIX FROM HISTRENFIX ');
              wQryAuxLocal.SQL.Add('                          WHERE IDOPERRENFIXAPLIC IN ( ');
              wQryAuxLocal.SQL.Add('                                                       select IDOPERRENFIXAPLIC from histrenfix  ');
              wQryAuxLocal.SQL.Add('                                                       where IDHISTRENFIX = '+ DMRendaFixa.qryMarcaInvRep.FieldByName('IDHISTRENFIX').AsString+')');
              wQryAuxLocal.SQL.Add('                          AND   DATAHISTRENFIX <= TO_DATE('+QuotedStr(DateToStr(dDataRef))+','+QuotedStr('DD/MM/YYYY')+') ');
              wQryAuxLocal.SQL.Add('                          AND   FLGRECALC IS NOT NULL )');
              wQryAuxLocal.ExecSQL;
           end;
         if fStatusFlag = 'S' then
          Begin
            wQryAuxLocal.SQL.Clear;
            wQryAuxLocal.SQL.Add(' UPDATE HISTRENFIX ');
            wQryAuxLocal.SQL.Add(' SET FLGRECALC = ''S'' ');
            wQryAuxLocal.SQL.Add(' WHERE (HISTRENFIX.IDHISTRENFIX = '+ DMRendaFixa.qryMarcaInvRep.FieldByName('IDHISTRENFIX').AsString+')');
            wQryAuxLocal.ExecSQL;
          end;

         Result := Result + 1;
         DMRendaFixa.qryMarcaInvRep.Next;
      end;
     end;      //Thiago Passos SOL 39918 - Kintana 523459
   finally
      //Ricardo Cristiano - 30/10/2008 - N. Sol 99825 -  N. Kintana 439935
      OperComum.LimpaParametros(DMRendaFixa.qryMarcaInvRep);   
      wQryAuxLocal.Close;
      FreeAndNil(wQryAuxLocal);
   end;
   //AL_38 - Fim
   //AL_69
   //AL_103 - Fim
end;

// AL_6 - Controle do processo de abertura
function TRendaFixa.VerEmAbertura: Boolean;
var qry: TwwQuery;
begin
   try
      try
         qry := TwwQuery.Create(Application);
         qry.DatabaseName := 'BaseDados';
         qry.SQL.Add('SELECT PA.FLGRFEMABERTURA, PE.NOME ');
         qry.SQL.Add('FROM PARAMINVEST PA, PESSOA PE ');
         qry.SQL.Add('WHERE PA.IDUSUARIOPROCRF = PE.IDPESSOA(+)');
         qry.Open;
         Result := (qry.FieldByName('FLGRFEMABERTURA').AsString = 'S');
         if Result then
            MsgDlg('O Sistema está sendo processado por ' + #13 +
                   qry.FieldByName('NOME').AsString + #13 +
                   'Nenhuma outra ação pode ser executada.',
                   'Mensagem do Sistema', mtWarning, [mbOK], 0);
      except
         Result := True;
         MsgDlg('Não foi possível verificar se o sistema está em Abertura, Nenhuma outra ação pode ser executada.',
                'Mensagem do Sistema', mtWarning, [mbOK], 0);
      end;
   finally
      qry.Close;
      FreeAndNil(qry);
   end;
end;

// AL_6 - Controle do processo de abertura
function TRendaFixa.GravaEmAbertura(sFlag: String = 'S'): Boolean;
var qryEmAbt: TwwQuery;
    i: Byte;
    bComita: Boolean;
begin
   // AL_8 - 21/09/2004 - Ajuste na gravação do parâmetro
   Result := False;
   bComita := False;
   // AL_64 - Ini
   try
      try
         if not DtmBaseDados.dbBaseDados.InTransaction Then
         begin
            DtmBaseDados.dbBaseDados.StartTransaction;
            bComita := True;
         end;

         qryEmAbt := TwwQuery.Create(Application);
         qryEmAbt.DatabaseName := 'BaseDados';

         // Tenta gravar o parametro no máximo 10 vezes até conseguir
         //AL_103
         for i := 1 to 10 do
         begin
            qryEmAbt.SQL.Clear;
            qryEmAbt.SQL.Add('UPDATE PARAMINVEST SET FLGRFEMABERTURA = ' + QuotedStr(sFlag) + ', ');
            qryEmAbt.SQL.Add('IDUSUARIOPROCRF = ' + OperComum.IIF(sFlag = 'S',QuotedStr(IntToStr(Sistema.IdUsuario)),'NULL'));
            qryEmAbt.ExecSQL;
            if qryEmAbt.RowsAffected >= 1 then
            begin
               Result := True;
               Break;
            end;
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
   //AL_64 - Fim
end;

//AL_16
function TRendaFixa.VerificaDataPgJuros(dDataProc, dDataPagJur  : TDateTime;
                                        iTipoOper, iInvestimento, iOperAplic : Integer;
                                        bCotacao: Boolean): TDateTime;
var dDataResult : TDateTime;
    bAchou, bTesta : boolean;
begin
   // AL_23 - 05/04/2005
   Result := dDataProc -1;

   if bCotacao then
   begin
      bAchou := False;
      dDataResult := DiasUteisInv.PrimeiroDiaUtilPosterior(dDataPagJur, -1, 1, '', True, False, False);
      if dDataResult = dDataProc then
         Result := dDataPagJur;
   end;
   // AL_23 - Fim
end;

//AL_103
function TRendaFixa.ContabilizaAtu(dDataProc: TdateTime;
                                   sHistorico: String;
                                   iIdHistRenFix,iFlgGeraContab,iFlgGeraCapCar, iForCli: Integer;
                                   var iPlanilha, iDocumento: Integer): Boolean;
//AL_31
//AL_42
//AL_43
//AL_103 - Ini
var iPlano, iSubContaDeb, iSubContaCred, iUnidNegoc, iPlan : Integer;
    // iIdPlnCodigo, iTipoOper, iSubConta

    sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred, sCentroRespon,
       sTipoRecDes, sTipoPer, sHistoricoOper, sRecPagNao,
       sMens: string;
    //sConta, sCentroCusto,

    fTotVariacao, fValVariacao, fDifVariacao, fValor, fVlrFluxo,
       fVlrProv, fVlrItem : Double;
    //fVlrIOF, fIOFAcuAtu, fIOFAcuAnt,

    bPrimeiro, bGerouContab: Boolean;
    dDataPgJur, dDataFluxo: TDateTime;
    wQry, qryItens: TwwQuery;
//AL_103 - Fim
begin
   //AL_103 - Ini
   try // Finally
      Result := False;
      bGerouContab := False;
      fValVariacao := 0;

      wQry := TwwQuery.Create(Application);
      wQry.DatabaseName := 'BaseDados';

      qryItens := TwwQuery.Create(Application);
      qryItens.DatabaseName := 'BaseDados';

      qryItens.SQL.Clear;
      qryItens.SQL.Add('SELECT CR.DESCCURVARENFIX, IT.DESCITEMRENFIX, HI.PUITEM,HI.PUACUITEM,');
      qryItens.SQL.Add('       HI.VLRITEM, HI.VLRACUITEM, HR.SALDOVLRHISTRENFI, RG.NOMEREGRA,');
      qryItens.SQL.Add('       CI.SEQCALCULO, IT.TIPOITEM, HI.IDHISTRENFIX,HI.IDCURVARENFIX,');
      qryItens.SQL.Add('       HI.IDREGRACALCULO, HI.IDITEMRENFIX');
      qryItens.SQL.Add('FROM HISTRENFIX HR, HISTRENFIXXITENS HI, REGRA RG, ITEMRENFIX IT, CURVASRENFIX CR,');
      qryItens.SQL.Add('     CURVASXITEMRENFIX CI');
      qryItens.SQL.Add('WHERE HR.IDHISTRENFIX = ' + IntToStr(iIdHistRenFix));
      qryItens.SQL.Add('  AND HI.IDHISTRENFIX = ' + IntToStr(iIdHistRenFix));
      qryItens.SQL.Add('  AND HI.IDCURVARENFIX = CR.IDCURVARENFIX');
      qryItens.SQL.Add('  AND HI.IDITEMRENFIX = IT.IDITEMRENFIX');
      qryItens.SQL.Add('  AND HI.IDREGRACALCULO = RG.IDREGRA(+)');
      qryItens.SQL.Add('  AND HI.IDCURVARENFIX = CI.IDCURVARENFIX');
      qryItens.SQL.Add('  AND HI.IDITEMRENFIX = CI.IDITEMRENFIX');
      qryItens.SQL.Add('ORDER BY SEQCALCULO');
      qryItens.Open;
      qryItens.First;

      // AL_65 - Escreve Mensagem e seta o progressbar
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('Preparando contabilização', qryItens.RecordCount);

      while not qryItens.Eof do
      begin
         //AL_103
         if qryItens.FieldByName('IDITEMRENFIX').AsInteger = CtrlPInv.IdOperPagtoJuros then
         begin
            // Só serve para pagamento de juros, se houver outro fluxo, verificar
            // Vedrificar Agio e Deságio
            if RendaFixa.BuscaFluxoPagtoJuros(qryItens.FieldByName('IDCURVARENFIX').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                              qryItens.FieldByName('IDITEMRENFIX').AsInteger,
                                              dDataProc,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime) then
               dDataPgJur := DMRendaFixa.qryBuscaFluxoPagtoJuros.FieldByName('DATAFLUXO').AsDateTime;

            dDataFluxo := VerificaDataPgJuros(dDataProc, dDataPgJur, -17,
                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                              CotaRenfix(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                         qryItens.FieldByName('IDCURVARENFIX').AsInteger));

            OperComum.LimpaParametros(DMRendaFixa.qruBuscaPUFluxo);
            DMRendaFixa.qruBuscaPUFluxo.ParamByName('IDINVESTIMENTO').AsInteger := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger;
            DMRendaFixa.qruBuscaPUFluxo.ParamByName('IDOPERRENFIXAPLIC').AsInteger := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
            DMRendaFixa.qruBuscaPUFluxo.ParamByName('IDTIPOOPERACAO').AsInteger := -17;
            DMRendaFixa.qruBuscaPUFluxo.ParamByName('DATAOPERACAO').AsString := DateToStr(dDataFluxo); // Dia anterior
            DMRendaFixa.qruBuscaPUFluxo.Open;
            //AL_40 Ini
            fVlrFluxo := fVlrFluxo + DMRendaFixa.qruBuscaPUFluxo.FieldByName('VLROPERACAO').AsFloat;
         end;
         // AL_42
         // AL_43
         // AL_56
         if qryItens.FieldByName('IDITEMRENFIX').AsInteger = -15 then
            // Provisão de Perda
            fVlrProv := fVlrProv + qryItens.FieldByName('PUITEM').AsFloat
         else
            // Variação sem Provisão de Perda
            if qryItens.FieldByName('IDITEMRENFIX').AsInteger <> -8 then
               fValVariacao := fValVariacao + qryItens.FieldByName('VLRITEM').AsFloat;

         qryItens.Next;

         // AL_65 - Adianta o progressbar
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('');

      end;

      // AL_42 - Ini
      // Se FUNCEF, deduz a Provisão de Perda do Saldo de Variação
      if Sistema.TipoCliente = 19991 then
         fValVariacao := DiminuiValores(fValVariacao, fVlrProv);
      // Verifica a Variação entre os saldos
      fTotVariacao := DiminuiValores(qryItens.FieldByName('SALDOVLRHISTRENFI').AsFloat,  DiminuiValores(DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOVLRHISTRENFI').AsFloat, fVlrFluxo));
      // Verifica a diferença entre a Variação dos saldos e a Variação calculada
      fDifVariacao := OperComum.Round(DiminuiValores(fTotVariacao, fValVariacao),2);
      // AL_42 - Fim

      bPrimeiro := True;
      qryItens.First;

      // AL_65 - Escreve Mensagem e seta o progressbar
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('Contabilizando' + qryItens.FieldByName('DESCITEMRENFIX').AsString, qryItens.RecordCount);

      while not qryItens.Eof do
      begin
         // AL_65 - Escreve Mensagem e não adianta o progressbar
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Contabilizando ' + qryItens.FieldByName('DESCITEMRENFIX').AsString, 0);

         //AL_43 Ini
         fVlrItem := qryItens.FieldByName('VLRITEM').AsFloat;
         //AL_56
         //AL_99 - Localiza a Curva e o Item Corretos
         DMRendaFixa.qryBuscaSaldosItems.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                VarArrayOf([qryItens.FieldByName('IDCURVARENFIX').AsInteger,
                                                            qryItens.FieldByName('IDITEMRENFIX').AsInteger]),
                                                []);
         //AL_87
         if FazContabilizacao(iFlgGeraContab,-1,-1,'Atualizacao', fVlrItem) then
         //AL_43 Fim
         begin
            // Busca o Padrão Contábil
            if RendaFixa.BuscaPadrLancRF(RetornaSegmentacaoRF(-1,iIdHistRenFix), //Renan CGPC28
                                         dDataProc, Sistema.IdEmpresa,
                                         1,
                                         -2,
                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger,
                                         qryItens.FieldByName('IDITEMRENFIX').AsInteger,
                                         //AL_43
                                         fVlrItem,
                                         iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc,
                                         sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
                                         sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper,sRecPagNao,
                                         qryItens.FieldByName('TIPOITEM').AsString) then
            begin
               // AL_56
               fValor := qryItens.FieldByName('VLRITEM').AsFloat;

               if bPrimeiro then
               begin
                  //AL_43 Ini
                  if qryItens.FieldByName('IDITEMRENFIX').AsInteger <> -8 then // IOF
                  begin
                     // AL_56
                     bPrimeiro := False;
                     // AL_42
                     fValor := StrToFloat(FormatFloat('#0.00',qryItens.FieldByName('VLRITEM').AsFloat + fDifVariacao));
                     //AL_101 - Ajuste na gravação para curvas de swap - Precisa do ID da curva
                     ExecutaQuery(wQry, 'UPDATE HISTRENFIXXITENS ' + #13 +
                                        'SET VLRITEM = ' + TrocaVirgulaPonto(FormatFloat('#0.0#', fValor)) + #13 +
                                        'WHERE IDHISTRENFIX = ' + qryItens.FieldByName('IDHISTRENFIX').AsString + #13 +
                                        '  AND IDCURVARENFIX = ' + qryItens.FieldByName('IDCURVARENFIX').AsString + #13 +
                                        '  AND IDITEMRENFIX = ' + qryItens.FieldByName('IDITEMRENFIX').AsString);
                  end;
                  //AL_43 Fim
               end;
               // AL_56
               // Achou um padrão contábil -> recebe -2 para não derrubar o processamento
               if iPlanilha < 0 then
                  iPlanilha := -2;

               // AL_55
               RendaFixa.BuscaPadrLancRF(RetornaSegmentacaoRF(-1,iIdHistRenFix), //Renan CGPC28
                                         dDataProc, Sistema.IdEmpresa,
                                         1,
                                         -2,
                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger,
                                         qryItens.FieldByName('IDITEMRENFIX').AsInteger,
                                         fValor,
                                         iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc,
                                         sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
                                         sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper,sRecPagNao,
                                         qryItens.FieldByName('TIPOITEM').AsString);

               //AL_31 - Ini
               //AL_39
               fValor := OperComum.Round(fValor,2);
               if fValor <> 0 then
               begin
                  //AL_87
                  if FazContabilizacao(iFlgGeraContab,-1,-1,'', fVlrItem) then
                  begin
                     //AL_69
                     if not RendaFixa.ContabilizaRendaFixa(fValor, iPlano, iForCli, iUnidNegoc, iSubContaDeb,
                                                           iSubContaCred, DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                           sHistorico + ' ' + qryItens.FieldByName('DESCITEMRENFIX').AsString,
                                                           sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
                                                           sTipoPer, sRecPagNao,dDataProc, iPlanilha, -1,
                                                           DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger) then
                        Raise Exception.Create('Atenção : Não foi possível efetuar a contabilização do item.');
                     bGerouContab := True;
                  end;
               end;
               //AL_31 - Fim
            end;
         end
         else
         begin
            // Manter a planilha anterior ou -2 para não causar erro de contabilização
            if iPlanilha < 0 then
               iPlanilha := -2;
         end;

         qryItens.Next;

         // AL_65 - Adianta o progressbar
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('');

      end;

      // AL_65 - Apaga a label e o progress
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('', -2);

      // Atualiza o HistRenFix com a planilha
      if (iPlanilha > 0) or (iDocumento > 0) then
      begin
         //AL_31 Ini
         if not bGerouContab then
            iPlan := -1
         else
            iPlan := iPlanilha;
         if not RendaFixa.GravaPlanDoc('ATU',
                                       DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIX').AsInteger,
                                       iIdHistRenFix,
                                       iPlan, iDocumento, sMens, False) then
            Raise Exception.Create(sMens);
         //AL_31 Fim
      end;

      Result := True;

   finally
      qryItens.Close;
      FreeAndNil(qryItens);
      FreeAndNil(wQry);
      //AL_40
      DMRendaFixa.qruBuscaPUFluxo.Close;
   end;
//AL_103 - Fim
end;

//AL_43
function TRendaFixa.BuscaValorIOF(dDataProc : TDateTime;
                                  iIdOperAplic, iIdCurvaRenFix : Integer):Double;

begin
   //AL_103
   try
   Result := 0;
      OperComum.LimpaParametros(DMRendaFixa.QryBuscaValorIOF);
      DMRendaFixa.QryBuscaValorIOF.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iIdOperAplic;
      DMRendaFixa.QryBuscaValorIOF.ParamByName('IDCURVARENFIX').AsInteger     := iIdCurvaRenfix;
      DMRendaFixa.QryBuscaValorIOF.ParamByName('DATAPROC').AsString           := DateToStr(dDataProc);
      DMRendaFixa.QryBuscaValorIOF.Open;
      if not DMRendaFixa.QryBuscaValorIOF.IsEmpty then
         Result := DMRendaFixa.QryBuscaValorIOF.FieldByName('VLRACUIOF').AsFloat;
   finally
      DMRendaFixa.QryBuscaValorIOF.Close;
   end;
end; 

//AL_44
function TRendaFixa.VerificaSeAtuDiaria(dDataProc, dDataAniv : TDateTime):boolean;
var iAno, iMes, iDia, iAnoP, iMesP, iDiaP : Word;
    dDataLimite: TDateTime;
begin
   if Sistema.TipoCliente = 19991 then  // Funcef
   begin
      // AL_63 - ini
      DecodeDate(dDataAniv, iAno, iMes, iDia);
      // Monta data limite a no primeiro aniversário de fevereiro de 2005

      //al_82
      if (((iDia = 30) or (iDia = 31)) and  DiasUteisInv.AnoBissexto(iAno)) then
         iDia := 29
      else if ((iDia = 29) or (iDia = 30) or (iDia = 31)) then
         iDia := 28;

      dDataLimite := EncodeDate(2005, 2, iDia);
      // Se o processamento e em data maior ou igual que o limite, Não é diário
      if dDataProc >= dDataLimite then
         Result := False
      else
         Result := True;
      // AL_63 - Fim
   end
   else
      Result := True;
end;

// AL_51
//AL_68
function TRendaFixa.IncPriHistVenc(iOper: Integer = -1; dDataOper : TDateTime = 0; fraProg: TfraMensagem = nil): Boolean;
var qryOperRenFixAplic, qryUpdate, qryBuscaHistOrig: TwwQuery;
    sOper: String;
    bComita: Boolean;
begin
   try
      try
         if not DtmBaseDados.dbBaseDados.InTransaction Then
         begin
            DtmBaseDados.dbBaseDados.StartTransaction;
            bComita := True;
         end
         else bComita := False;

         sOper := IntToStr(iOper);

         qryOperRenFixAplic := TwwQuery.Create(Application);
         qryOperRenFixAplic.DatabaseName := 'BaseDados';

         qryUpdate := TwwQuery.Create(Application);
         qryUpdate.DatabaseName := 'BaseDados';

         qryBuscaHistOrig := TwwQuery.Create(Application);
         qryBuscaHistOrig.DatabaseName := 'BaseDados';

         // AL_54 - Ini
         qryOperRenFixAplic.SQL.Add('SELECT O.IDOPERRENFIX, O.DATAOPERACAO, O.VENCOPERACAO');
         qryOperRenFixAplic.SQL.Add('FROM OPERRENFIX O, HISTOPERRENFIX H');
         qryOperRenFixAplic.SQL.Add('WHERE O.IDOPERRENFIX = O.IDOPERRENFIXAPLIC ');
         qryOperRenFixAplic.SQL.Add('  AND ((' + sOper + ' = -1) OR (O.IDOPERRENFIX = '+ sOper + ')) ');
         qryOperRenFixAplic.SQL.Add('  AND O.IDOPERRENFIX = H.IDOPERRENFIX(+)');
         qryOperRenFixAplic.SQL.Add('  AND H.IDOPERRENFIX IS NULL');
         // AL_54 - Fim
         qryOperRenFixAplic.Open;

         if fraProg <> nil then
         begin
            fraProg.Mostra;
            fraProg.Max := qryOperRenFixAplic.RecordCount;
            fraProg.Pos := 0;
            fraProg.Mes := 'Processando Aplicações';
         end
         else
         begin
            frmAguardeInv.Pos := 0;
            frmAguardeInv.Max := qryOperRenFixAplic.RecordCount;
            frmAguardeInv.Mostra('Processando Aplicações');
         end;

         while not qryOperRenFixAplic.Eof do
         begin
            qryBuscaHistOrig.SQL.Clear;
            qryBuscaHistOrig.SQL.Add('SELECT IDOPERRENFIX, DATAVIGENCIA ');
            qryBuscaHistOrig.SQL.Add('FROM HISTOPERRENFIX ');
            qryBuscaHistOrig.SQL.Add('WHERE IDOPERRENFIX  = ' + qryOperRenFixAplic.FieldByName('IDOPERRENFIX').AsString);
            qryBuscaHistOrig.SQL.Add('  AND DATAVIGENCIA  = TO_DATE(' + QuotedStr(qryOperRenFixAplic.FieldByName('DATAOPERACAO').AsString) + ', ' + QuotedStr('dd/mm/yyyy') + ') ');
            qryBuscaHistOrig.Open;
            if qryBuscaHistOrig.IsEmpty then
            begin
               qryUpdate.SQL.Clear;
               qryUpdate.SQL.Add('INSERT INTO HISTOPERRENFIX ');
               qryUpdate.SQL.Add('  (IDOPERRENFIX, DATAVIGENCIA, DATAVENCTOANT, DATAVENCTOATU) ');
               qryUpdate.SQL.Add('VALUES ');
               qryUpdate.SQL.Add('  (' + qryOperRenFixAplic.FieldByName('IDOPERRENFIX').AsString + ', ');
               //AL_68
               if dDataOper <> 0 then
                  qryUpdate.SQL.Add('   TO_DATE(' + QuotedStr(DateToStr(dDataOper)) + ', ' + QuotedStr('dd/mm/yyyy') + '), ')
               else
                  qryUpdate.SQL.Add('   TO_DATE(' + QuotedStr(qryOperRenFixAplic.FieldByName('DATAOPERACAO').AsString) + ', ' + QuotedStr('dd/mm/yyyy') + '), ');
               qryUpdate.SQL.Add('   TO_DATE(' + QuotedStr(qryOperRenFixAplic.FieldByName('VENCOPERACAO').AsString) + ', ' + QuotedStr('dd/mm/yyyy') + '), ');
               qryUpdate.SQL.Add('   TO_DATE(' + QuotedStr(qryOperRenFixAplic.FieldByName('VENCOPERACAO').AsString) + ', ' + QuotedStr('dd/mm/yyyy') + ')) ');
               qryUpdate.ExecSQL;
            end;
            qryBuscaHistOrig.Close;
            qryOperRenFixAplic.Next;
            if fraProg <> nil then
               fraProg.Incrementa
            else
               frmAguardeInv.Incrementa;
         end;
         if (DtmBaseDados.dbBaseDados.InTransaction) and (bComita) Then
            DtmBaseDados.dbBaseDados.Commit;
      except
         on E: Exception do
         begin
            if DtmBaseDados.dbBaseDados.InTransaction Then
               DtmBaseDados.dbBaseDados.Rollback;
         end;
      end;
   finally
      //AL_103
      qryOperRenFixAplic.Close;
      FreeAndNil(qryOperRenFixAplic);
      FreeAndNil(qryUpdate);
      FreeAndNil(qryBuscaHistOrig);
      if fraProg <> nil then
         fraProg.Apaga
      else
         frmAguardeInv.Apaga;
   end;
end;

// AL_53
// AL_54
function TRendaFixa.Repactuou(iOperAplic: Integer; dDataLimite: TDateTime = 0): Boolean;
var qryBuscaHistOrig: TwwQuery;
begin
   try
      Result := False;
      qryBuscaHistOrig := TwwQuery.Create(Application);
      qryBuscaHistOrig.DatabaseName := 'BaseDados';
      qryBuscaHistOrig.SQL.Clear;
      qryBuscaHistOrig.SQL.Add('SELECT H.IDOPERRENFIX, H.DATAVIGENCIA');
      qryBuscaHistOrig.SQL.Add('FROM OPERRENFIX O, HISTOPERRENFIX H');
      qryBuscaHistOrig.SQL.Add('WHERE O.IDOPERRENFIX = O.IDOPERRENFIXAPLIC');
      qryBuscaHistOrig.SQL.Add('  AND O.IDOPERRENFIX  = ' + IntToStr(iOperAplic));
      // AL_54
      if dDataLimite > 0 then
         qryBuscaHistOrig.SQL.Add('  AND TRUNC(H.DATAVIGENCIA) > TO_DATE(' + QuotedStr(DateToStr(dDataLimite)) + ',' + QuotedStr('DD/MM/YYYY') + ')');
      qryBuscaHistOrig.SQL.Add('  AND O.IDOPERRENFIX = H.IDOPERRENFIX');
      qryBuscaHistOrig.SQL.Add('  AND O.DATAOPERACAO <> H.DATAVIGENCIA');
      qryBuscaHistOrig.Open;
      if not qryBuscaHistOrig.IsEmpty then
         Result := True;
   finally
      //AL_103
      qryBuscaHistOrig.Close;
      FreeAndNil(qryBuscaHistOrig);
   end;
end;

// AL_53
function TRendaFixa.BuscaVigencia(iOperAplic: Integer;
                                  dDataLimite: TDateTime = 0): TDateTime;
var qryBuscaVigencia: TwwQuery;
begin
   try
      //AL_103
      qryBuscaVigencia := TwwQuery.Create(Application);
      qryBuscaVigencia.DataBaseName := 'BaseDados';
      qryBuscaVigencia.SQL.Add('SELECT MAX(DATAVIGENCIA) AS DTVIG');
      qryBuscaVigencia.SQL.Add('FROM HISTOPERRENFIX');
      qryBuscaVigencia.SQL.Add('WHERE IDOPERRENFIX = ' + IntToStr(iOperAplic));
       if dDataLimite <> 0 then
         qryBuscaVigencia.SQL.Add('  AND TRUNC(DATAVIGENCIA) <= TO_DATE(' + QuotedStr(DateToStr(dDataLimite)) + ',' +
                                                               QuotedStr('DD/MM/YYYY') + ')');
      qryBuscaVigencia.Open;
      if qryBuscaVigencia.IsEmpty then
          Result := 0
       else
         Result := qryBuscaVigencia.FieldByName('DTVIG').AsDateTime;
   finally
      qryBuscaVigencia.Close;
      FreeAndNil(qryBuscaVigencia);
   end;
end;

//AL_68
function TRendaFixa.SomaResgatesFuturos(dDataBase: TDateTime;
                                        iInvestimento, iOperacao, iOperAplic: Integer; fQtdLimite: Double): Boolean;
begin
   // Verifica se existem resgates futuros nesta aplicação
   try
      //AL_100 - Ini - Ajuste no processo
      Result := False;
      OperComum.LimpaParametros(DMRendaFixa.qryBuscaSaldosResgF);
      DMRendaFixa.qryBuscaSaldosResgF.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataBase);
      DMRendaFixa.qryBuscaSaldosResgF.ParamByName('IDOPERRENFIX').AsInteger      := iOperacao;
      DMRendaFixa.qryBuscaSaldosResgF.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperAplic;
      DMRendaFixa.qryBuscaSaldosResgF.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
      DMRendaFixa.qryBuscaSaldosResgF.Open;

      if (not DMRendaFixa.qryBuscaSaldosResgF.IsEmpty) and
         (DMRendaFixa.qryBuscaSaldosResgF.FieldByName('SLDQTD').AsFloat > 0) then
      begin
         // Se o Saldo final for menor que a soma das operações futuras aborta o resgate
         if DMRendaFixa.qryBuscaSaldosResgF.FieldByName('SLDQTD').AsFloat > fQtdLimite then
            Raise Exception.Create('Existem Resgates em datas Posteriores a esta Operação num total de: ' + #13 +
                                   'Quantidade: ' + DMRendaFixa.qryBuscaSaldosResgF.FieldByName('SLDQTD').AsString + #13 +
                                   'Valor     : ' + DMRendaFixa.qryBuscaSaldosResgF.FieldByName('SLDVLR').AsString);
      end;
      Result := True
      //AL_100 - Fim
   finally
      //AL_103
      DMRendaFixa.qryBuscaSaldosResgF.Close;
   end;
end;

// AL_68
function TRendaFixa.SomaResgatesFuturos(dDataBase: TDateTime;
                                        iInvestimento, iOperacao, iOperAplic: Integer): Double;
begin
   // Verifica se existem resgates futuros nesta aplicação
   try
      Result := 0;
      OperComum.LimpaParametros(DMRendaFixa.qryBuscaSaldosResgF);
      DMRendaFixa.qryBuscaSaldosResgF.ParamByName('DATAOPERACAO').AsString       := DateToStr(dDataBase);
      DMRendaFixa.qryBuscaSaldosResgF.ParamByName('IDOPERRENFIX').AsInteger      := iOperacao;
      DMRendaFixa.qryBuscaSaldosResgF.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperAplic;
      DMRendaFixa.qryBuscaSaldosResgF.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
      DMRendaFixa.qryBuscaSaldosResgF.Open;
      Result := DMRendaFixa.qryBuscaSaldosResgF.FieldByName('SLDQTD').AsFloat;
   finally
      //AL_103
      DMRendaFixa.qryBuscaSaldosResgF.Close;
   end;
end;

//AL_70
function TRendaFixa.BuscaHistOperNoDia(dDataBase: TDateTime;
                                       iInvestimento, iOperAplic: Integer) : boolean;
begin
   //AL_103
   Result := True;
   Try
      OperComum.LimpaParametros(DMRendaFixa.qryExisteOperacoes);
      DMRendaFixa.qryExisteOperacoes.ParamByName('DDATAPROC').AsString          := DateToStr(dDataBase);
      DMRendaFixa.qryExisteOperacoes.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
      DMRendaFixa.qryExisteOperacoes.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperAplic;
      DMRendaFixa.qryExisteOperacoes.Open;
      if not DMRendaFixa.qryExisteOperacoes.IsEmpty then  // Marca para Reprocessamento
      begin
         Result := False;
         MarcaInvRep(dDataBase,iInvestimento,iOperAplic);
      end;
   Finally
      DMRendaFixa.qryExisteOperacoes.Close;
   end;
end;

//AL_71
{ ----------------------------------------------------------------------------------
    Esta rotina utiliza dados das queries BuscaSaldos.
    É necessário que a BuscaSaldos tenha sido rodada antes e esteja apontando para
      o saldo do título origem
  ---------------------------------------------------------------------------------- }
//AL_72
function TRendaFixa.IncluiTransferencia(iPlanoOrigem, iPlanoDestino: Integer;
                                        fPercentual, fQtdDest, fVlrDest, fPUOper: Double;
                                        sObs: String; dDataOper : TDateTime;
                                        sBoleta: String = ''): Boolean;
var sMens: String;
    qryTipoOperTrc: TwwQuery;
    iIdOperRenFix, iIdHistRenfix, iPlanilha, iDocumento, iIdOperRenFixOrig: Integer;
    fVlrItem, fPUItem, fPUAcuItem, fVlrAcuItem, fVlrOrig, fQtdOrig, fVlrDif: Double;
begin
   try
      Result := False;
      qryTipoOperTrc := TwwQuery.Create(Application);
      qryTipoOperTrc.DatabaseName := 'BaseDados';

      // Testa se Periodo Contabil esta Fechado para exclusao
      //AL_85
      //AL_103
      if CtrlPInv.IntFinContabRF <> 'N' then
      begin
         //AL_69
         //AL_72
         if not CtrlInvContab.TestaPeriodo(DateToStr(dDataOper), 1, -1,
                                           DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger) then
            Raise Exception.Create(CtrlInvContab.MessageInfo);
      end;

      // Gera Boleta única para todo o Lote
      //AL_72
      if sBoleta = '' then
         sBoleta := RendaFixa.GeraNumBoleta(dDataOper,-1);

      // Atualiza o componente de processo
      //AL_103
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('Excluindo movimentações posteriores.',
                          (DMRendaFixa.qryBuscaSaldosItemsOper.RecordCount +
//                           DMRendaFixa.qryBuscaSaldosItems.RecordCount + 2) * 2);
                           DMRendaFixa.BuscaSaldosItensRecNo + 2) * 2);

      // Baixa de Transferência - Plano Origem
      // ------------------------------------------------------------------------------------------------------------

      // Deletar Históricos e Cadastro de Operações  -----------------------
      //AL_72
      //AL_83
      //AL_103
      if not RendaFixa.ExcluiHistRenFix(DMRendaFixa.qryBuscaSaldosHist.FieldByName('DATAHISTRENFIX').AsDateTime,// + 1,
                                        False, -1,
                                        DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger, -1,
                                        DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                        False,False, nil,False) then
         Raise Exception.Create('Não foi possível excluir Movimentação Posterior');

      // Capta informações do Tipo de Operação de Baixa por transferência
      qryTipoOperTrc.SQL.Add('SELECT IDTIPOOPERACAO, FLGGERACONTAB,FLGGERACAPCAR,CODTIPDOC, DESCTIPOOPERACAO ');
      qryTipoOperTrc.SQL.Add('FROM TIPOOPERACAO ');
      qryTipoOperTrc.SQL.Add('WHERE IDTIPOOPERACAO = -97');
      qryTipoOperTrc.Open;

      iIdOperRenFix := LeUltRegistro(nil, 'OPERRENFIX');
      iIdHistRenfix := LeUltRegistro(nil, 'HISTRENFIX');

      // Grava OperRenfix  -------------------------------------------------
      // Atualiza o componente de processo
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('Gravando Operação de Origem', -3);

      //AL_73
      fVlrOrig := fVlrDest;
      fQtdOrig := fQtdDest;

      //AL_72
      if not RendaFixa.GravaOperacaoRendaFixa(iIdOperRenFix,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDINVESTIMENTO').AsInteger,
                                              qryTipoOperTrc.FieldByName('IDTIPOOPERACAO').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDCUSTODIANTE').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('MOECODIGO').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDUSUARIO').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDCLASSRISCORENFIX').AsInteger,
                                              -1,-1,
                                              dDataOper,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('VENCOPERACAO').AsDateTime,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAEMISSAO').AsDateTime,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATALEILAO').AsDateTime,
                                              dDataOper,
                                              fPUOper,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('PUEMISSAO').AsFloat,
                                              fVlrOrig,
                                              fQtdOrig,
                                              0,
                                              0,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('PUMERCADO').AsFloat,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('QTDCARTHIPO').AsFloat -
                                                 RoundCM(DMRendaFixa.qryBuscaSaldosOper.FieldByName('QTDCARTHIPO').AsFloat * (fPercentual/100),0),
                                              fPercentual, sObs,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('FLGOPERIMPLANT').AsString,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('FLGCARTHIPO').AsString,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('FLGRECALC').AsString,
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('FLGNEGOCIACAO').AsString,
                                              sBoleta) then
         Raise Exception.Create('Não foi Possível Incluir a Operação de Baixa na Origem.');

      // Atualiza o componente de processo
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('', -1);

      // Grava OperRenfixXCurvas -------------------------------------------
      //AL_97 - Força posicionamento no Primeiro Item
      DMRendaFixa.qryBuscaSaldosItemsOper.First;
      while not DMRendaFixa.qryBuscaSaldosItemsOper.EOF do
      begin
         // Atualiza o componente de processo
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Gravando Operação de Origem' + #13 +
                             'Item ' + DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('DESCITEMRENFIX').AsString, -3);

         // Não posso trabalhar com os itens originais, pois a operação já
         //   está decorrida, preciso pegar os itens acumulados no histórico do título
         //   para que o relançamento da operação no reprocessamento fique correto
         // A query DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger não se reposiciona
         //   é preciso posicioná-la na mão para utilizar seus valores.

         // Localiza o mesmo item da mesma curva no histórico
         DMRendaFixa.qryBuscaSaldosItems.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                VarArrayOf([DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDCURVARENFIX').AsVariant,
                                                            DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsVariant]), []);

         //AL_73 - Os Items tipo T e M e o PU de Emissão também precisam ter o saldo transferido proporcionalmente
         if ((DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('TIPOITEM').AsString = 'V') or        // Itens Tipo Valor
             ((DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -1 ) or  // Principal
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -2 ) or  // Quantidade
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -5 ) or  // Valor Líquido
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -6 ) or  // Valor Bruto
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -7 ) or  // Imposto de Renda
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -8 ) or  // IOF
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -9 ) or  // Lucro
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -10) or  // Prejuízo
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -11) or  // PU Atualizado
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -14) or  // Valor Bruto Provisionado
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -15) or  // Provisão para Perda
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -17))) then // Rendimento
         begin
            //AL_73 - Ini
            if DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -2 then   // Quantidade
            begin
               //Poupança não pode arredondar a quantidade
               //AL_78
               //AL_103 
               if (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
                  (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq) or
                  (DMRendaFixa.qryBuscaSaldosHist.FieldByName('FLGUSAQTD').AsString = 'N') then
                  fVlrItem := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100
               else
                  fVlrItem := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100, 0);
            end
            else if (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -5) or   // Saldo Liquido
                    (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -6) then // Saldo Bruto
               fVlrItem := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat - fVlrOrig),2)
            else
               fVlrItem := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100;
            //AL_73 - Fim
         end
         //AL_92
         else if (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('TIPOITEM').AsString = 'T') then  // Itens Tipo Taxa
             fVlrItem := DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('VLRCURVA').AsFloat        // Tem que pegar da Operaçao
         else if DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -4 then   //PU da Operação
            fVlrItem := fPUOper
         else
            fVlrItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;

         if not RendaFixa.GravaOperRenFixXCurvas(iIdOperRenFix,
                                          DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDCURVARENFIX').AsInteger,
                                          DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger,
                                          DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('MOECODIGO').AsInteger,
                                          fVlrItem,
                                          DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('PERCCURVA').AsFloat) then
            Raise Exception.Create('Não foi Possível Incluir o Item: ' + #13 +
                                   DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('DESCITEMRENFIX').AsString + #13 +
                                   'na Operação de Origem.');

         DMRendaFixa.qryBuscaSaldosItemsOper.Next;

         // Atualiza o componente de processo
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('', -1);
      end;

      //AL_97 - Grava novos itens que não estejam na operação original ------
      DMRendaFixa.qryBuscaSaldosItems.First;
      while not DMRendaFixa.qryBuscaSaldosItems.EOF do
      begin
         // Se não localizar o Item na curva da operação original, lança na operação de TRC
         if not DMRendaFixa.qryBuscaSaldosItemsOper.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                VarArrayOf([DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsVariant,
                                                            DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsVariant]), []) then
         begin
            // Atualiza o componente de processo
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('Gravando Operação de Origem' + #13 +
                                'Item ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString, -3);

            if ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'V') or           // Itens Tipo Valor
                ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -1 ) or     // Principal
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -2 ) or     // Quantidade
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5 ) or     // Valor Líquido
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6 ) or     // Valor Bruto
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -7 ) or     // Imposto de Renda
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -8 ) or     // IOF
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -9 ) or     // Lucro
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -10) or     // Prejuízo
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -11) or     // PU Atualizado
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -14) or     // Valor Bruto Provisionado
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -15) or     // Provisão para Perda
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -17))) then // Rendimento
            begin
               if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -2 then // Quantidade
               begin
                  //Poupança não pode arredondar a quantidade
                  //AL_103
                  if (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
                     (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq) or
                     (DMRendaFixa.qryBuscaSaldosHist.FieldByName('FLGUSAQTD').AsString = 'N') then
                     fVlrItem := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100
                  else
                     fVlrItem := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100, 0);
               end
               else if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) or   // Saldo Liquido
                       (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6) then // Saldo Bruto
                  fVlrItem := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat - fVlrOrig),2)
               else
                  fVlrItem := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100;
            end
            else if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'T') then       // Itens Tipo Taxa
                fVlrItem := DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('VLRCURVA').AsFloat         // Tem que pegar da Operaçao
            else if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -4 then //PU da Operação
               fVlrItem := fPUOper
            else
               fVlrItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;

            if not RendaFixa.GravaOperRenFixXCurvas(iIdOperRenFix,
                                             DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                             DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                             -1,
                                             fVlrItem,
                                             100) then
               Raise Exception.Create('Não foi Possível Incluir o Item: ' + #13 +
                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString + #13 +
                                      'na Operação de Origem.');


            // Atualiza o componente de processo
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('', -1);
         end; // Fim do Locate

         DMRendaFixa.qryBuscaSaldosItems.Next;

      end; // Fim do Loop


      // Grava HistRenFix  -------------------------------------------------
      // Atualiza o componente de processo
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('Gravando Histórico de Origem', -3);

      //AL_72
      if not RendaFixa.GravaHistRenfix(iIdHistRenFix,
                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                iIdOperRenFix,
                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                qryTipoOperTrc.FieldByName('IDTIPOOPERACAO').AsInteger,
                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                -1,-1,
                                dDataOper,
                                fQtdOrig,
                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat - fQtdOrig,
                                fVlrOrig,
                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOVLRHISTRENFI').AsFloat - fVlrOrig,
                                'TRC','D','Transferência Entre Planos (Baixa)') then
         Raise Exception.Create('Não foi Possível Incluir o Histórico da Operação de Origem.');

      // Contabiliza a Transferência ---------------------------------------
      // Atualiza o componente de processo
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('Gravando a Contabilização da Origem', -1);

      iPlanilha  := -1;
      iDocumento := -1;
      //AL_100
      //AL_72
      RendaFixa.IntegraContabCapCar(iIdHistRenFix, -1,
                                    qryTipoOperTrc.FieldByName('IDTIPOOPERACAO').AsInteger,
                                    DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger,
                                    0,
                                    qryTipoOperTrc.FieldByName('FLGGERACONTAB').AsInteger,
                                    qryTipoOperTrc.FieldByName('FLGGERACAPCAR').AsInteger,
                                    DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsInteger,
                                    qryTipoOperTrc.FieldByName('CODTIPDOC').AsInteger,
                                    iPlanoOrigem, 'Y',
                                    DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString,
                                    qryTipoOperTrc.FieldByName('DESCTIPOOPERACAO').AsString,
                                    fVlrOrig,0,0,
                                    dDataOper,
                                    dDataOper,
                                    dDataOper,
                                    iPlanilha,iDocumento,-1,
                                    'Transferência',
                                    DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDCURVARENFIX').AsInteger, 0, True);

      // Grava HistRenfixXItens --------------------------------------------
      DMRendaFixa.qryBuscaSaldosItems.First;
      while not DMRendaFixa.qryBuscaSaldosItems.EOF do
      begin
         // Atualiza o componente de processo
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Gravando Histórico de Origem' + #13 +
                             'Item ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString, -3);

         //AL_73 - Os Items tipo T e M também e o PU de emissão precisam ter o saldo transferido proporcionalmente
         if ((DMRendaFixa.qryBuscaSaldosItemsXCurvas.FieldByName('TIPOITEM').AsString = 'V') or // Itens Tipo Valor
             ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -1 ) or  // Principal
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -2 ) or  // Quantidade
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5 ) or  // Valor Líquido
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6 ) or  // Valor Bruto
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -7 ) or  // Imposto de Renda
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -8 ) or  // IOF
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -9 ) or  // Lucro
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -10) or  // Prejuízo
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -11) or  // PU Atualizado
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -14) or  // Valor Bruto Provisionado
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -15) or  // Provisão para Perda
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -17))) then // Rendimento
         begin
            //AL_73 - Ini
            if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -2 then  // Quantidade
            begin
               //Poupança não pode arredondar a quantidade
               //AL_78
               //AL_103
               if (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
                  (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq) or
                  (DMRendaFixa.qryBuscaSaldosHist.FieldByName('FLGUSAQTD').AsString = 'N') then
               begin
                  fPUItem     := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUITEM').AsFloat * fPercentual) / 100;
                  fPUAcuItem  := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100;
                  fVlrItem    := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRITEM').AsFloat * fPercentual) / 100;
                  fVlrAcuItem := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRACUITEM').AsFloat * fPercentual) / 100;
               end
               else
               begin
                  fPUItem     := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUITEM').AsFloat * fPercentual) / 100, 0);
                  fPUAcuItem  := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100, 0);
                  fVlrItem    := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRITEM').AsFloat * fPercentual) / 100, 0);
                  fVlrAcuItem := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRACUITEM').AsFloat * fPercentual) / 100, 0);
               end;
            end
            else if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) or   // Saldo Liquido
                    (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6) then // Saldo Bruto
            begin
               fPUItem     := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUITEM').AsFloat - fVlrOrig),2);
               fPUAcuItem  := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat - fVlrOrig),2);
               fVlrItem    := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRITEM').AsFloat - fVlrOrig),2);
               fVlrAcuItem := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRACUITEM').AsFloat - fVlrOrig),2);
            end
            else
            begin
               fPUItem     := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUITEM').AsFloat * fPercentual) / 100;
               fPUAcuItem  := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100;
            //AL_2
               fVlrItem    := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRITEM').AsFloat * fPercentual) / 100;
               fVlrAcuItem := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRACUITEM').AsFloat * fPercentual) / 100;
            end;
            //AL_73 - Fim
         end
         else
         begin
            fPUItem     := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUITEM').AsFloat;
            fPUAcuItem  := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;
            //AL_2
            fVlrItem    := DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRITEM').AsFloat;
            fVlrAcuItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRACUITEM').AsFloat;
         end;

         if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                         DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                         DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                         DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDREGRACALCULO').AsInteger,
                                         fPUItem,fPUAcuItem,
                                         fVlrItem,fVlrAcuItem) then
            Raise Exception.Create('Não foi Possível Incluir o Item do Histórico da Operação de Origem.');

         DMRendaFixa.qryBuscaSaldosItems.Next;

         // Atualiza o componente de processo
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('', -1);
      end;

      // Update na OperRenfix com o PLNCODIGO ------------------------------
      if (iPlanilha > 0) then
      begin
          iDocumento := -1;
          if not RendaFixa.GravaPlanDoc('TRC',
                                        iIdOperRenFix,iIdHistRenFix,
                                        iPlanilha, iDocumento, sMens, True) then
            Raise Exception.Create('Não foi Possível Atualizar a Planilha Contábil da Operação.');
      end;

      // Acréscimo de Transferência - Plano Destino
      // ------------------------------------------------------------------------------------------------------------

      // Capta informações do Tipo de Operação de Baixa por transferência --
      qryTipoOperTrc.Close;
      qryTipoOperTrc.SQL.Clear;
      qryTipoOperTrc.SQL.Add('SELECT IDTIPOOPERACAO, FLGGERACONTAB,FLGGERACAPCAR,CODTIPDOC, DESCTIPOOPERACAO ');
      qryTipoOperTrc.SQL.Add('FROM TIPOOPERACAO ');
      qryTipoOperTrc.SQL.Add('WHERE IDTIPOOPERACAO = -98');
      qryTipoOperTrc.Open;

      // Capta IDs
      iIdOperRenFix := LeUltRegistro(nil, 'OPERRENFIX');
      iIdHistRenfix := LeUltRegistro(nil, 'HISTRENFIX');

      //Ricardo Cristiano - 31/10/2008 - N. Sol 98617 -  N. Kintana 430072
      // Capta o ID da Operação de Origem
{      if DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').AsInteger = 0 then
         iIdOperRenFixOrig := DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXAPLIC').AsInteger
      else
         iIdOperRenFixOrig := DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').AsInteger;
}
      if DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXAPLIC').AsInteger = 0 then
         iIdOperRenFixOrig := DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').AsInteger
      else
         iIdOperRenFixOrig := DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXAPLIC').AsInteger;

      // Grava OperRenfix  -------------------------------------------------
      // Atualiza o componente de processo
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('Gravando Operação de Destino', -3);

      //AL_72
      if not RendaFixa.GravaOperacaoRendaFixa(iIdOperRenFix,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDINVESTIMENTO').AsInteger,
                                       qryTipoOperTrc.FieldByName('IDTIPOOPERACAO').AsInteger,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDCUSTODIANTE').AsInteger,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsInteger,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('MOECODIGO').AsInteger,
                                       iPlanoDestino,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDUSUARIO').AsInteger,
                                       iIdOperRenFix,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDCLASSRISCORENFIX').AsInteger,
                                       -1,-1,
                                       dDataOper,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('VENCOPERACAO').AsDateTime,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAEMISSAO').AsDateTime,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATALEILAO').AsDateTime,
                                       dDataOper,
                                       fPUOper ,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('PUEMISSAO').AsFloat,
                                       fVlrDest, fQtdDest, 0,0,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('PUMERCADO').AsFloat,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('QTDCARTHIPO').AsFloat * (fPercentual / 100),
                                       fPercentual, sObs,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('FLGOPERIMPLANT').AsString,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('FLGCARTHIPO').AsString,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('FLGRECALC').AsString,
                                       DMRendaFixa.qryBuscaSaldosOper.FieldByName('FLGNEGOCIACAO').AsString,
                                       sBoleta, iIdOperRenFixOrig) then
         Raise Exception.Create('Não foi Possível Incluir a Operação de Destino.');

      // Atualiza o componente de processo
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('', -1);

      // Grava OperRenfixXCurvas -------------------------------------------
      DMRendaFixa.qryBuscaSaldosItemsOper.First;
      while not DMRendaFixa.qryBuscaSaldosItemsOper.EOF do
      begin

         // Atualiza o componente de processo
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Gravando Operação de Destino' + #13 +
                             'Item ' + DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('DESCITEMRENFIX').AsString, -3);

         // Não posso trabalhar com os itens originais, pois a operação já
         //   está decorrida, preciso pegar os itens acumulados no histórico do título
         //   para qie o relançamento da operação no reprocessamento fique correto
         // A query DMRendaFixa.qryBuscaSaldosItemsIDITEMRENFIX.AsInteger não se reposiciona
         //   é preciso posicioná-la na mão para utilizar seus valores.

         // Localiza o mesmo item da mesma curva no histórico
         DMRendaFixa.qryBuscaSaldosItems.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                VarArrayOf([DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDCURVARENFIX').AsVariant,
                                                            DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsVariant]), []);

         //AL_73 - Os Items tipo T e M também e o PU de emissão precisam ter o saldo transferido proporcionalmente
         if ((DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('TIPOITEM').AsString = 'V') or        // Valor
             ((DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -1 ) or  // Principal
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -2 ) or  // Quantidade
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -5 ) or  // Valor Líquido
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -6 ) or  // Valor Bruto
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -7 ) or  // Imposto de Renda
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -8 ) or  // IOF
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -9 ) or  // Lucro
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -10) or  // Prejuízo
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -11) or  // PU Atualizado
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -14) or  // Valor Bruto Provisionado
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -15) or  // Provisão para Perda
              (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -17))) then // Rendimento
         begin
            //AL_73 - Ini
            if DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -2 then   // Quantidade
            begin
               //Poupança não pode arredondar a quantidade
               //AL_78
               //AL_103
               if (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
                  (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq) or
                  (DMRendaFixa.qryBuscaSaldosHist.FieldByName('FLGUSAQTD').AsString = 'N') then
                  fVlrItem := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100
               else
                  fVlrItem := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100, 0)
            end
            else if (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -5) or   // Saldo Liquido
                    (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -6) then // Saldo Bruto
               fVlrItem := fVlrDest
            else
               fVlrItem := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100;
            //AL_73 - Fim
         end
         else if (DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('TIPOITEM').AsString = 'T') then  // Itens Tipo Taxa
             fVlrItem := DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('VLRCURVA').AsFloat        // Tem que pegar da Operaçao
         else if DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger = -4 then
            fVlrItem := fPUOper
         else
            fVlrItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;

         if not RendaFixa.GravaOperRenFixXCurvas(iIdOperRenFix,
                                          DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDCURVARENFIX').AsInteger,
                                          DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDITEMRENFIX').AsInteger,
                                          DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('MOECODIGO').AsInteger,
                                          fVlrItem,
                                          DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('PERCCURVA').AsFloat) then
            Raise Exception.Create('Não foi Possível Incluir o Item da Operação de Destino.');

         DMRendaFixa.qryBuscaSaldosItemsOper.Next;

         // Atualiza o componente de processo
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('', -1);
      end;

      //AL_97 - Grava novos itens que não estejam na operação original ------
      DMRendaFixa.qryBuscaSaldosItems.First;
      while not DMRendaFixa.qryBuscaSaldosItems.EOF do
      begin
         // Se não localizar o Item na curva da operação original, lança na operação de TRC
         if not DMRendaFixa.qryBuscaSaldosItemsOper.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                VarArrayOf([DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsVariant,
                                                            DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsVariant]), []) then
         begin
            // Atualiza o componente de processo
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('Gravando Operação de Destino' + #13 +
                                'Item ' + DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString, -3);

            if ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'V') or           // Itens Tipo Valor
                ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -1 ) or     // Principal
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -2 ) or     // Quantidade
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5 ) or     // Valor Líquido
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6 ) or     // Valor Bruto
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -7 ) or     // Imposto de Renda
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -8 ) or     // IOF
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -9 ) or     // Lucro
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -10) or     // Prejuízo
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -11) or     // PU Atualizado
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -14) or     // Valor Bruto Provisionado
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -15) or     // Provisão para Perda
                 (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -17))) then // Rendimento
            begin
               if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -2 then // Quantidade
               begin
                  //Poupança não pode arredondar a quantidade
                  //AL_103
                  if (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
                     (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq) or
                     (DMRendaFixa.qryBuscaSaldosHist.FieldByName('FLGUSAQTD').AsString = 'N') then
                     fVlrItem := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100
                  else
                     fVlrItem := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100, 0);
               end
               else if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) or   // Saldo Liquido
                       (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6) then // Saldo Bruto
                  fVlrItem := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat - fVlrOrig),2)
               else
                  fVlrItem := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100;
            end   // ANDRE SANTOS Sol : 96116 Kintana: 415550 
            else if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('TIPOITEM').AsString = 'T') then       // Itens Tipo Taxa
                fVlrItem := DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('VLRCURVA').AsFloat         // Tem que pegar da Operaçao
            else if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -4 then //PU da Operação
               fVlrItem := fPUOper
            else
               fVlrItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;

            if not RendaFixa.GravaOperRenFixXCurvas(iIdOperRenFix,
                                             DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                             DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                              -1, fVlrItem, 100) then
               Raise Exception.Create('Não foi Possível Incluir o Item: ' + #13 +
                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('DESCITEMRENFIX').AsString + #13 +
                                      'na Operação de Destino.');


            // Atualiza o componente de processo
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('', -1);
         end; // Fim do Locate

         DMRendaFixa.qryBuscaSaldosItems.Next;

      end; // Fim do Loop

      // Grava Histrenfix --------------------------------------------------
      // Atualiza o componente de processo
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('Gravando Histórico de Destino', -3);

      //AL_72
      if not RendaFixa.GravaHistRenfix(iIdHistRenFix,
                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                iIdOperRenFix,
                                iIdOperRenFix,
                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                qryTipoOperTrc.FieldByName('IDTIPOOPERACAO').AsInteger,
                                iPlanoDestino, -1,-1,
                                dDataOper,
                                fQtdDest, fQtdDest, fVlrDest, fVlrDest,
                                'TRC','A','Transferência Entre Planos (Acréscimo)',
                                False, -1, -1, '',
                                iIdOperRenFixOrig) then
         Raise Exception.Create('Não foi Possível Incluir o Histórico da Operação de Destino.');

      // Atualiza o componente de processo
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('', -1);

      // Grava HistRenfixXItens --------------------------------------------
      DMRendaFixa.qryBuscaSaldosItems.First;
      while not DMRendaFixa.qryBuscaSaldosItems.EOF do
      begin
         // Atualiza o componente de processo
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Gravando Histórico de Destino' + #13 +
                             'Item ' + DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('DESCITEMRENFIX').AsString, -3);

         //AL_73 - Os Items tipo T e M também e o PU de emissão precisam ter o saldo transferido proporcionalmente
         if ((DMRendaFixa.qryBuscaSaldosItemsXCurvas.FieldByName('TIPOITEM').AsString = 'V') or // Itens do Tipo Valor
             ((DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -1 ) or  // Principal
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -2 ) or  // Quantidade
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5 ) or  // Valor Líquido
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6 ) or  // Valor Bruto
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -7 ) or  // Imposto de Renda
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -8 ) or  // IOF
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -9 ) or  // Lucro
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -10) or  // Prejuízo
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -11) or  // PU Atualizado
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -14) or  // Valor Bruto Provisionado
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -15) or  // Provisão para Perda
              (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -17))) then // Rendimento
         begin
            //AL_73 - Ini
            if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -2 then  // Quantidade
            begin
               //Poupança não pode arredondar a quantidade
               //AL_78
               //AL_103
               if (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassePoup) or
                  (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IdClassPoupBloq) or
                  (DMRendaFixa.qryBuscaSaldosHist.FieldByName('FLGUSAQTD').AsString = 'N') then
               begin
                  fPUItem     := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUITEM').AsFloat * fPercentual) / 100;
                  fPUAcuItem  := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100;
                  fVlrItem    := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRITEM').AsFloat * fPercentual) / 100;
                  fVlrAcuItem := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRACUITEM').AsFloat * fPercentual) / 100;
               end
               else
               begin
                  fPUItem     := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUITEM').AsFloat * fPercentual) / 100, 0);
                  fPUAcuItem  := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100, 0);
                  fVlrItem    := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRITEM').AsFloat * fPercentual) / 100, 0);
                  fVlrAcuItem := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRACUITEM').AsFloat * fPercentual) / 100, 0);
               end;
            end
            else if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) or   // Saldo Liquido
                    (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6) then // Saldo Bruto
            begin
               fPUItem     := fVlrDest;
               fPUAcuItem  := fVlrDest;
               fVlrItem    := fVlrDest;
               fVlrAcuItem := fVlrDest;
            end
            else
            begin
               fPUItem     := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUITEM').AsFloat * fPercentual) / 100;
               fPUAcuItem  := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat * fPercentual) / 100;
               fVlrItem    := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRITEM').AsFloat * fPercentual) / 100;
               fVlrAcuItem := (DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRACUITEM').AsFloat * fPercentual) / 100;
            end;
            //AL_73 - Fim
         end
         else
         begin
            fPUItem    := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUITEM').AsFloat;
            fPUAcuItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;
            fVlrItem    := DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRITEM').AsFloat;
            fVlrAcuItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('VLRACUITEM').AsFloat;
         end;

         if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                         DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                         DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                         DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDREGRACALCULO').AsInteger,
                                         fPUItem,fPUAcuItem,
                                         fVlrItem,fVlrAcuItem) then
            Raise Exception.Create('Não foi Possível Incluir o Item do Histórico da Operação de Destino.');

         DMRendaFixa.qryBuscaSaldosItems.Next;
         // Atualiza o componente de processo
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('', -1);
      end;

      // Contabiliza a Transferência ---------------------------------------
      // Atualiza o componente de processo
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('Gravando a Contabilização do Destino', -1);

      //AL_100
      //AL_72
      RendaFixa.IntegraContabCapCar(iIdHistRenFix, -1,
                                    qryTipoOperTrc.FieldByName('IDTIPOOPERACAO').AsInteger,
                                    DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger,
                                    0,
                                    qryTipoOperTrc.FieldByName('FLGGERACONTAB').AsInteger,
                                    qryTipoOperTrc.FieldByName('FLGGERACAPCAR').AsInteger,
                                    DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsInteger,
                                    qryTipoOperTrc.FieldByName('CODTIPDOC').AsInteger,
                                    iPlanoDestino, 'Y',
                                    DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString,
                                    qryTipoOperTrc.FieldByName('DESCTIPOOPERACAO').AsString,
                                    fVlrDest,0,0,
                                    dDataOper,
                                    dDataOper,
                                    dDataOper,
                                    iPlanilha,iDocumento,-1,
                                    'Transferência',
                                    DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDCURVARENFIX').AsInteger, 0, True);

      // Update na OperRenfix com o PLNCODIFO
      if (iPlanilha > 0) then
      begin
          iDocumento := -1;
          if not RendaFixa.GravaPlanDoc('TRC',
                                        iIdOperRenFix,iIdHistRenFix,
                                        iPlanilha, iDocumento, sMens, True) then
          begin
             DtmBaseDados.dbBaseDados.Rollback;
             Exit;
          end;
      end;

      // Inclui o Primeiro Histórico de Vencimento da Aplicação ------------
      RendaFixa.IncPriHistVenc(iIdOperRenFix, DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime);

      // Marca o Investimento para reprocessamento -------------------------
      //AL_103
      if DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime < CtrlPInv.DataUltFechRF then
      begin
         // Marca a Origem
         //AL_72
         if RendaFixa.MarcaInvRep(dDataOper,
                                  DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                  DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                  DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDPLANPREVCTBPATR').AsInteger) = -1 then
            Raise Exception.Create('Não foi Possível Marcar a Aplicação de Origem para Reprocessamento.');
         // Marca o Destino
         //AL_72
         if RendaFixa.MarcaInvRep(dDataOper,
                                  DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                  iIdOperRenFix, iPlanoDestino) = -1 then
            Raise Exception.Create('Não foi Possível Marcar a Aplicação de Destino para Reprocessamento.');
      end;

      Result := True;

   finally
      // Destroi componentes temporários
      qryTipoOperTrc.Close;
      FreeAndNil(qryTipoOperTrc);
      // Atualiza o componente de processo
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('', -2);
   end;
end;

//AL_71
//AL_103
function TRendaFixa.ExcluiTransferencia(sBoleta: String; iOperAplic: Integer = -1): Boolean;
   //AL_83
var iIdHistRenfix : Integer;
    qryAux: TwwQuery;
begin
   try
      //AL_103
      qryAux := TwwQuery.Create(Application);
      qryAux.DatabaseName := 'BaseDados';

      Result := False;
      //Busca as Operações da transferência
      OperComum.LimpaParametros(DMRendaFixa.qryBuscaOPETRC);
      DMRendaFixa.qryBuscaOPETRC.ParamByName('BOLETA').AsString := sBoleta;
      if iOperAplic > 0 then
         DMRendaFixa.qryBuscaOPETRC.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperAplic;
      DMRendaFixa.qryBuscaOPETRC.Open;

      //Testa o Período contábil
      //AL_85
      //AL_103
      if CtrlPInv.IntFinContabRF <> 'N' then
      begin
         if not CtrlInvContab.TestaPeriodo(DMRendaFixa.qryBuscaOPETRC.FieldByName('DATAOPERACAO').AsString, 1, -1,
                                           DMRendaFixa.qryBuscaOPETRC.FieldByName('IDCLASSETIT').AsInteger) then
            Raise Exception.Create(CtrlInvContab.MessageInfo);
      end;

      // Atualiza o componente de processo
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('', DMRendaFixa.qryBuscaOPETRC.RecordCount);

      while not DMRendaFixa.qryBuscaOPETRC.Eof do
      begin
         // Exclui os históricos
         // Atualiza o componente de processo
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Excluindo históricos ' +
                             OperComum.IIF(DMRendaFixa.qryBuscaOPETRC.FieldByName('IDTIPOOPERACAO').AsInteger = -97, 'da Origem', 'do Destino') + #13 +
                             'do Plano ' + DMRendaFixa.qryBuscaOPETRC.FieldByName('DESCPLANOPREV').AsString, 0);
         //AL_83
         //AL_72
         //AL_103
         if not RendaFixa.ExcluiHistRenFix(DMRendaFixa.qryBuscaOPETRC.FieldByName('DATAOPERACAO').AsDateTime,
                                           True,
                                           -1,
                                           DMRendaFixa.qryBuscaOPETRC.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                           DMRendaFixa.qryBuscaOPETRC.FieldByName('IDOPERRENFIX').AsInteger,
                                           DMRendaFixa.qryBuscaOPETRC.FieldByName('IDINVESTIMENTO').AsInteger,
                                           True,
                                           (DMRendaFixa.qryBuscaOPETRC.FieldByName('IDTIPOOPERACAO').AsInteger = -97),
                                           nil , False) then
            Raise Exception.Create('Não foi possível Excluir os históricos desta Operação.');

         // Exclui as Operações
         // Atualiza o componente de processo
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Excluindo IR ' +
                             OperComum.IIF(DMRendaFixa.qryBuscaOPETRC.FieldByName('IDTIPOOPERACAO').AsInteger = -97, 'da Origem', 'do Destino') + #13 +
                             'do Plano ' + DMRendaFixa.qryBuscaOPETRC.FieldByName('DESCPLANOPREV').AsString, 0);

         //AL_103
         qryAux.SQL.Clear;
         qryAux.SQL.Text := 'DELETE FROM IRLITIGIO WHERE IDOPERRENFIX = ' +
                                    DMRendaFixa.qryBuscaOPETRC.FieldByName('IDOPERRENFIX').AsString;
         qryAux.ExecSQL;

         // Atualiza o componente de processo
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Excluindo Items da Operação ' +
                             OperComum.IIF(DMRendaFixa.qryBuscaOPETRC.FieldByName('IDTIPOOPERACAO').AsInteger = -97, 'de Origem', 'de Destino') + #13 +
                             'do Plano ' + DMRendaFixa.qryBuscaOPETRC.FieldByName('DESCPLANOPREV').AsString, 0);

         //AL_103
         qryAux.SQL.Clear;
         qryAux.SQL.Text := 'DELETE FROM OPERRENFIXXCURVAS WHERE IDOPERRENFIX = ' +
                                    DMRendaFixa.qryBuscaOPETRC.FieldByName('IDOPERRENFIX').AsString;
         qryAux.ExecSQL;


         if DMRendaFixa.qryBuscaOPETRC.FieldByName('IDTIPOOPERACAO').AsInteger = -98 then
         begin
            // Atualiza o componente de processo
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('Excluindo Repactuações da Operação ' +
                                OperComum.IIF(DMRendaFixa.qryBuscaOPETRC.FieldByName('IDTIPOOPERACAO').AsInteger = -97, 'de Origem', 'de Destino') + #13 +
                                'do Plano ' + DMRendaFixa.qryBuscaOPETRC.FieldByName('DESCPLANOPREV').AsString, 0);

            //AL_103
            qryAux.SQL.Clear;
            qryAux.SQL.Text := 'DELETE FROM HISTOPERRENFIX WHERE IDOPERRENFIX = ' +
                                       DMRendaFixa.qryBuscaOPETRC.FieldByName('IDOPERRENFIX').AsString;
            qryAux.ExecSQL;
         end;

         // Atualiza o componente de processo
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('Excluindo Operação ' +
                             OperComum.IIF(DMRendaFixa.qryBuscaOPETRC.FieldByName('IDTIPOOPERACAO').AsInteger = -97, 'de Origem', 'de Destino') + #13 +
                             'do Plano ' + DMRendaFixa.qryBuscaOPETRC.FieldByName('DESCPLANOPREV').AsString, 0);

         //AL_103
         qryAux.SQL.Clear;
         qryAux.SQL.Text := 'DELETE FROM OPERRENFIX WHERE IDOPERRENFIX = ' +
                                    DMRendaFixa.qryBuscaOPETRC.FieldByName('IDOPERRENFIX').AsString;
         qryAux.ExecSQL;

         // Exclusão dos lançamentos Contábeis e Financeiros que agora ficam na tabela
         //   de Operações.
         if DMRendaFixa.qryBuscaOPETRC.FieldByName('PLNCODIGO').AsInteger <> 0 then
         begin
            // Atualiza o componente de processo
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('Excluindo Lançamentos Contábeis ' +
                                OperComum.IIF(DMRendaFixa.qryBuscaOPETRC.FieldByName('IDTIPOOPERACAO').AsInteger = -97, 'da Origem', 'do Destino'), 0);

            if not RendaFixa.ExcluiContabilidadeRenFix(DMRendaFixa.qryBuscaOPETRC.FieldByName('PLNCODIGO').AsInteger) then
               Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis ');
         end;

         if DMRendaFixa.qryBuscaOPETRC.FieldByName('CODDOCUMENTO').AsInteger <> 0 then
         begin
            // Atualiza o componente de processo
            if Assigned(AtualizaProcFech) then
               AtualizaProcFech('Excluindo Lançamentos Financeiros ' +
                                OperComum.IIF(DMRendaFixa.qryBuscaOPETRC.FieldByName('IDTIPOOPERACAO').AsInteger = -97, 'da Origem', 'do Destino'), 0);

            if not RendaFixa.ExcluiFinanceiroRenFix(DMRendaFixa.qryBuscaOPETRC.FieldByName('CODDOCUMENTO').AsInteger) then
               Raise Exception.Create('Não foi Possível Excluir os Lançamentos Financeiros ');
         end;

         //AL_103
         if DMRendaFixa.qryBuscaOPETRC.FieldByName('DATAOPERACAO').AsDateTime <= CtrlPInv.DataUltFechRF then
         begin
            if RendaFixa.MarcaInvRep(DMRendaFixa.qryBuscaOPETRC.FieldByName('DATAOPERACAO').AsDateTime,
                                     DMRendaFixa.qryBuscaOPETRC.FieldByName('IDINVESTIMENTO').AsInteger,
                                     DMRendaFixa.qryBuscaOPETRC.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                     -1) = -1 then
               Raise Exception.Create('Não foi Possível Marcar um dos Título para Reprocessamento.');
         end;

         // Atualiza o componente de processo
         if Assigned(AtualizaProcFech) then
            AtualizaProcFech('', -1);

         // Próxima Operação
         DMRendaFixa.qryBuscaOPETRC.Next;
      end;

      Result := True;

   finally
      //AL_103
      FreeAndNil(qryAux);
      DMRendaFixa.qryBuscaOPETRC.Close;
      // Atualiza o componente de processo
      if Assigned(AtualizaProcFech) then
         AtualizaProcFech('', -2);
   end;
end;

//AL_72
function TRendaFixa.ExisteTRCnoDia(iInvestimento, iOperAplic  : Integer;
                                   sDataRef : String):boolean;
begin
   Result := False;
   Try
      OperComum.LimpaParametros(DMRendaFixa.qryOperTRCDia);
      DMRendaFixa.qryOperTRCDia.ParamByName('DATAREF').AsString            := sDataRef;
      DMRendaFixa.qryOperTRCDia.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
      DMRendaFixa.qryOperTRCDia.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperAplic;
      DMRendaFixa.qryOperTRCDia.Open;

      if not DMRendaFixa.qryOperTRCDia.IsEmpty then
         Result := True;
   Finally
      DMRendaFixa.qryOperTRCDia.Close;
   end;
end;

//AL_83
function TRendaFixa.BuscaMaxIdHistTRCnoDia(sDataRef : String;
                                           iInvestimento, iOperAplic  : Integer): Integer;
begin
   Result := -1;
   Try
      OperComum.LimpaParametros(DMRendaFixa.qryAux);
      DMRendaFixa.qryAux.SQL.Add('SELECT MAX(IDHISTRENFIX) AS IDHISTRENFIX FROM HISTRENFIX H');
      DMRendaFixa.qryAux.SQL.Add('WHERE TIPMOVHISRENFIX = ''TRC'' AND H.IDINVESTIMENTO = ' + IntToStr(iInvestimento));
      DMRendaFixa.qryAux.SQL.Add(' AND H.IDOPERRENFIXAPLIC = ' + IntToStr(iOperAplic));
      DMRendaFixa.qryAux.SQL.Add(' AND H.DATAHISTRENFIX  = TO_DATE('''+ sDataRef +''',''DD/MM/YYYY'')');
      DMRendaFixa.qryAux.Open;
      if not DMRendaFixa.qryAux.IsEmpty then
         Result := DMRendaFixa.qryAux.FieldByName('IDHISTRENFIX').AsInteger;
   Finally
      DMRendaFixa.qryAux.Close;
   end;
end;

//AL_83
function TRendaFixa.SomaQtdTRCnoDia(sDataRef : String;
                                    iInvestimento, iOperAplic  : Integer): Double;
begin
   Result := 0;
   Try
      //AL_103
      OperComum.LimpaParametros(DMRendaFixa.qryAux);
      DMRendaFixa.qryAux.SQL.Add('SELECT SUM(H.QTDHISTRENFIX) AS QTDTRCDIA FROM HISTRENFIX H');
      DMRendaFixa.qryAux.SQL.Add('WHERE TIPMOVHISRENFIX = ''TRC''');
      DMRendaFixa.qryAux.SQL.Add(' AND H.IDINVESTIMENTO = ' + IntToStr(iInvestimento));
      DMRendaFixa.qryAux.SQL.Add(' AND H.IDOPERRENFIXAPLIC = ' + IntToStr(iOperAplic));
      DMRendaFixa.qryAux.SQL.Add(' AND H.DATAHISTRENFIX  = ' + OperComum.DataOracle(sDataRef));
      DMRendaFixa.qryAux.Open;
      if not DMRendaFixa.qryAux.IsEmpty then
         Result := DMRendaFixa.qryAux.FieldByName('QTDTRCDIA').AsInteger;
   Finally
      DMRendaFixa.qryAux.Close;
   end;
end;

procedure TRendaFixa.BuscaDadosTRCnoDIa(sDataRef : String;
                                        iInvestimento, iOperAplic  : Integer;
                                        var iIdHistTrc : Integer;
                                        var SldVlr, SldQtd : Double);
begin
   iIdHistTrc := -1;
   SldVlr := 0;
   SldQtd := 0;

   Try
      //AL_103
      DMRendaFixa.qryAux.Close;
      DMRendaFixa.qryAux.SQL.Clear;
      DMRendaFixa.qryAux.SQL.Add(' SELECT H.IDHISTRENFIX, H.SALDOVLRHISTRENFI, H. SALDOQTDHISTRENFI ');
      DMRendaFixa.qryAux.SQL.Add(' FROM HISTRENFIX H, ');
      DMRendaFixa.qryAux.SQL.Add(' (SELECT MAX(IDHISTRENFIX) AS IDHISTRENFIX ');
      DMRendaFixa.qryAux.SQL.Add('  FROM  HISTRENFIX H ');
      DMRendaFixa.qryAux.SQL.Add('  WHERE H.TIPMOVHISRENFIX = ''TRC'' ');
      DMRendaFixa.qryAux.SQL.Add('    AND  H.IDINVESTIMENTO = ' + IntToStr(iInvestimento));
      DMRendaFixa.qryAux.SQL.Add('    AND H.IDOPERRENFIXAPLIC = ' + IntToStr(iOperAplic));
      DMRendaFixa.qryAux.SQL.Add('    AND H.DATAHISTRENFIX = ' + OperComum.DataOracle(sDataRef) + ') H1');
      DMRendaFixa.qryAux.SQL.Add(' WHERE H.IDHISTRENFIX = H1.IDHISTRENFIX ');
      DMRendaFixa.qryAux.Open;
      if not DMRendaFixa.qryAux.IsEmpty then
      begin
         iIdHistTrc := DMRendaFixa.qryAux.FieldByName('IDHISTRENFIX').AsInteger;
         SldVlr     := DMRendaFixa.qryAux.FieldByName('SALDOVLRHISTRENFI').AsFloat;
         SldQtd     := DMRendaFixa.qryAux.FieldByName('SALDOQTDHISTRENFI').AsFloat;
      end;
   Finally
      DMRendaFixa.qryAux.Close;
   end;
end;

//AL_90
function TRendaFixa.AtuEmiss(iInvestimento, iCurva: Integer): Boolean;
begin
   Result := False;
   try
      OperComum.LimpaParametros(DMRendaFixa.qryCurvaContabil);
      DMRendaFixa.qryCurvaContabil.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
      DMRendaFixa.qryCurvaContabil.ParamByName('IDCURVARENFIX').AsInteger := iCurva;
      DMRendaFixa.qryCurvaContabil.Open;
      Result := (DMRendaFixa.qryCurvaContabil.FieldByName('FLGCORREMISS').AsString = 'S');
   Finally
      //AL_103
      DMRendaFixa.qryCurvaContabil.Close;
   end;

end;

function TRendaFixa.FinalizaCapCar: Integer;
begin
   Result := 0;
   if CtrlInvContab.Documento.DocumentoPendente then
   begin
      // Finaliza o Documento e gera o CodDocumento
      if not CtrlInvContab.Documento.Insert then
         Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

      Result := CtrlInvContab.Documento.CodDocumento;
   end
   else
      Raise Exception.Create('Não existe documento financeiro para ser finalizado');

end;

//AL_103
function TRendaFixa.ExecutaRegra(qryEntrada: TwwQuery; sItem: String; IdRegra: Integer = -1; bPassoaPasso: Boolean = False): Double;
var sDecSep: Char;
begin
   try
      sDecSep := DecimalSeparator;
      try
         qryEntrada.Open;
         DMRendaFixa.Regra.QueryIn  := qryEntrada;

         if IdRegra <= 0 then
            Raise Exception.Create('Não existe regra definida para este item');

         DMRendaFixa.Regra.RuleName := IntToStr(IdRegra);

         if bPassoaPasso then
            DMRendaFixa.Regra.PassoaPasso
         else
            DMRendaFixa.Regra.Execute;

         // Testa se o retorno da regra foi um Float
         Result := StrToFloat(TrocaPontoVirgula(DMRendaFixa.Regra.Result));

         if DMRendaFixa.Regra.Error then
            Raise Exception.Create(DMRendaFixa.Regra.MessageInfo);
      except
         on E:Exception do
            Raise Exception.Create('Erro ao calcular o Item : ' + sItem + #13 +
                                   'Regra: '+ IntToStr(IdRegra) + #13 +
                                   'Mensagem: ' + E.Message);
      end;
   finally
      DecimalSeparator := sDecSep;
   end;
end;

procedure TRendaFixa.FechaBuscaOperacao;
begin
   DMRendaFixa.qrySelOperRenFixItens.Close;
   DMRendaFixa.qrySelOperRenFix.Close;
end;

procedure TRendaFixa.FechaBuscaSaldos;
begin
   DMRendaFixa.qryBuscaSaldosItemsXCurvas.Close;
   DMRendaFixa.qryBuscaSaldosItemsOper.Close;
   DMRendaFixa.qryBuscaSaldosOper.Close;
   DMRendaFixa.qryBuscaSaldosItems.Close;
   DMRendaFixa.qryBuscaSaldosHist.Close;
end;

procedure TRendaFixa.FechaBuscaSaldosPoup;
begin
   DMRendaFixa.qryBuscaSaldosItemsXCurvasPoup.Close;
   DMRendaFixa.qryBuscaSaldosItemsOperPoup.Close;
   DMRendaFixa.qryBuscaSaldosOperPoup.Close;
   DMRendaFixa.qryBuscaSaldosItemsPoup.Close;
   DMRendaFixa.qryBuscaSaldosHistPoup.Close;
end;

procedure TRendaFixa.FechaBuscaSaldosAux;
begin
   DMRendaFixa.qryBuscaSaldosHistAux.Close;
   DMRendaFixa.qryBuscaSaldosItemsAux.Close;
end;

function TRendaFixa.RetornaSegmentacaoRF(iInvestimento, iIdHistRenFix:integer  ): integer;
  var
  QryAux:TwwQuery;
  sSQL:string;
begin
  QryAux := TwwQuery.Create(nil);
  QryAux.DataBaseName :='BaseDados';

    if iInvestimento > 0 then
       begin
         sSQL:= 'SELECT em.IdSegmentacao,em.siglaemissor FROM INVESTIMENTO INV,EMISSOR EM ';
         sSQL:= sSQL + ' WHERE inv.idinvestimento = ' + IntToStr(iInvestimento);
         sSQL:= sSQL + ' AND   inv.idemissor = em.idemissor ';
       end else
    if iIdHistRenFix > 0 then
       begin
         sSQL:= 'SELECT EM.IDSEGMENTACAO,em.siglaemissor FROM INVESTIMENTO INV,EMISSOR EM,HISTRENFIX HRF ';
         sSQL:= sSQL + ' WHERE HRF.idhistrenfix = ' + IntToStr(iIdHistRenFix);
         sSQL:= sSQL + ' AND   INV.idinvestimento = HRF.idinvestimento ';
         sSQL:= sSQL + ' AND   EM.idemissor = INV.idEmissor ';
       end

       else
         begin
            sSQL:= ' select 0 IDSEGMENTACAO from dual '; //Se não for passado nenhum parametro valido, o resultado retornará 0(zero)
         end;

   QryAux.Close;
   QryAux.SQL.Clear;
   QryAux.SQL.Add(sSQL);
   QryAux.Open;

   if QryAux.RecordCount > 0 then
      begin
         if  QryAux.FieldByName('IDSEGMENTACAO').AsString = '' then //Se não tiver segmentacao cadastrada, aborta todo o processo
             begin
                Raise Exception.Create('O Emissor ' + QryAux.FieldByName('SiglaEmissor').AsString + ' não possui Segmentação de Mercado cadastrada.' + chr(13) + ' O Processo será cancelado ');
                Abort;
             end
          else
         result := QryAux.FieldByName('IDSEGMENTACAO').Asinteger;
      end

   else
     result :=0;


    QryAux.Close;

    FreeAndNil(QryAux);
end;

end.
