// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Augusto
// Rotina      : Varias
// Data        : 24/10/2007
// Pendência   : 24359
// Alteração   : Incluir rotina para abater da reserva os valores utilizados para
//               calcular o beneficio.
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Rotina      : Varias
// Data        : 09/10/2007
// Pendência   : 26462
// Alteração   : Passar beneficios selecionados para rotina de calculo de contribuição 
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Rotina      : Varias
// Data        : 08/10/2007
// Pendência   : 24359
// Alteração   : Inclusão do campo DTINICIOINSC na query da regra de calculo de reservas
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Rotina      : Varias
// Data        : 21/08/2007
// Pendência   : 25062
// Alteração   : Ajustes na alteração de tipo de beneficio
// -----------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 09/08/2007
// Rotina      : Varias
// Pendência   : 26054
// Descricao   : Tratamento de revisão para Mantido Parcial  
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 20/07/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 10/07/2007 - 12/07/2007 
// Pendência   : 25762
// Rotina      : ProcessaRevisaoBeneficio - AbreConsultaContribuicao
// Descricao   : Tratamento da DATAFINAL das contribuições
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 06/07/2007
// Pendência   : 25769
// Rotina      : CalculaAlteradores
// Descricao   : No caso de revisão de beneficios, Buscar calendário de assistido.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 14/06/2007
// Pendência   : 25610
// Rotina      : Tela
// Descricao   : 1) Incluir opção para filtrar somente os planos ativos quando processo for
//                  por arquivo.
//               2) Não marcar automáticamente os itens da tela, pois algus não são vistos
//                  pelo usuário mas são testados dentro do programa
// Pendência   : 25608
// Rotina      : ProcessaoRevisaoSalarioContribuicao
// Descricao   : Passar para a regra de reajuste do salário o valor do mês anterior ao processado
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 13/06/2007
// Pendência   : 25597
// Rotina      : ProcessaoRevisaoSalarioContribuicao
// Descricao   : Não filtrar pesquisa de contribuições recebidas pelo SITRECEBIMENTO
// Data        : 12/06/2007
// Pendência   : 25562
// Rotina      : ProcessaoRevisaoSalarioContribuicao
// Descricao   : Fazer tratamento para processar revisão de arquivo por Numero de Inscricao
// Pendência   : 25595
// Rotina      : ProcessaoRevisaoSalarioContribuicao
// Descricao   : Respeitar periodos de calculo e acerto
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 11/06/2007
// Pendência   : 25562
// Rotina      : PreparaRetroativo
// Descricao   : Fazer tratamento para processar revisão de arquivo por Numero de Inscricao
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 08/06/2007
// Pendência   : 25525
// Rotina      : PreparaRetroativo
// Descricao   : Quando for revisão de contribuição, não pesquisar beneficios. 
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 22/05/2007
// Pendência   : 25414
// Rotina      : ProcessaRevisaoBeneficio
// Descricao   : Atualizar o ULTMESPREPARO somente se existir valor a acertar
//               no mês.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 07/05/2007
// Pendência   : 25269
// Rotina      : ProcessaRevisaoBeneficio
// Descricao   : Atualizar o VALORTOTAL do beneficio quando digitado e não reajustar   
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 28/03/2007
// Pendência   : 21460
// Rotina      : ProcessaRevisaoBeneficio
// Descricao   : Tratamento para responder não para todos ao questão sobre
//               refazer as revisões
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 06/03/2007
// Pendência   : 24653
// Rotina      : PreparaRetroativo
// Descricao   : Tratamento para verificar o Plano Previdenciário do titular
//               quando for processo em lote
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 05/02/2007
// Pendência   : 24350
// Rotina      : PreparaRetroativo
// Descricao   : Retirada de filtro da consulta de pessoas a serem tratadas.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 30/01/2007
// Pendência   : 24350
// Rotina      : PreparaRetroativo
// Descricao   : Inclusão de filtro na query.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 19/01/2007
// Rotina      : ProcessaRevisaoBeneficio
// Descricao   : 1) 24255 - Permitir revisar abonos no mês 12.
//               2) Acerto no demonstrativo das colunas do SRB
// Data        : 22/01/2007
//               1) 24259 - Incluir NUMEROPROCESSO na query que atualiza os dados da BENEFBFCIARIO
//               3) 24261 - Acertar controle de data do Abono para mesmo quem tenha valor negativo
// Data        : 24/01/2007
//               1) 24290 - Utlizar filtros de plano e patro mesmo no processo de matriculas
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 11/01/2007
// Pendência   : 24202
// Rotina      : PreparaRetroativo
// Descricao   : Permitir Revisão de beneficios em planos cancelados.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 27/12/2006
// Pendência   : 23783
// Rotina      : ProcessaoRevisaoSalarioContribuicao
// Descricao   : Filtrar o plano escolhido na pesquisa de contribuições para revisar
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 06/12/2006
// Rotina      : ProcessaRevisaoBeneficio
// Descricao   : Filtrar somente as contribuições com sitrecebimento = 0 
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 20/11/2006
// Pendência   : 23780
// Rotina      : rbnLoteClick, rbtnIndividualClick
// Descricao   : Inicialização das variáveis individuais.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 17/11/2006
// Rotina      : AvancaPageControl
// Descricao   : Verificar sincronismo no mês anterior ao do Lote
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 01/11/2006
// Pendência   : 23679
// Rotina      : ProcessaoRevisaoSalarioContribuicao
// Descricao   : Alteração na forma que se faz o Acerto com as contribuições existentes (explicado no contexto).
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 31/10/2006
// Pendência   :
// Rotina      : ProcessaoRevisaoSalarioContribuicao
// Descricao   : Alteração do PLANOPREV e PESSJUR para usar os selecionados na tela
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 23/10/2006
// Pendência   : 23563
// Rotina      : qryReservaPart
// Descricao   : Criação do campo IDPARTICIPANTE na ReservaPart
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 23/10/2006
// Alteração   : Retirar filtro FLGDESATIVADO para revisão de contribuição  
// Data        : 10/10/2006
// Pendencia   : 22380
// Alteração   : A revisão só pode eliminar registros da HSTBENEFBFCIARIO com flgenviado <> 1 e
//               registros da HSTCONTRIBPREV não recebidos.
// Data        : 09/10/2006
// Pendencia   : 23504
// Alteração   : Acertar consulta de pessoas a processar para respeitar o parametro de Beneficios Encerrados
// Data        : 03/10/2006
// Pendencia   : 22896
// Alteração   : Verificar se existe preparo no mês do LOTE
// Data        : 28/09/2006
// Pendencia   : 22233
// Alteração   : Quando em lote verificar fechamento da folha no mes anterior ao lote selecionado 
// Data        : 26/09/2006
// Alteração   : CheckBox Gerar novo processo, agora é checado como default.
// Data        : 21/09/2006
// Rotina      : ProcessaoRevisaoSalarioContribuicao
// Alteração   : Caso seja assistido, verificar opção da tela para calcular alteradores
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 05/09/2006
// Pendencia   : 23243
// Rotina      : InsereContabil, BuscaDadosContabeis
// Alteração   : Atribuição do valor default para Unidades de Negócios (UNIDNEGOC)
//               que possuiam antes o valor -1.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 23/08/2006
// Pendencia   : 22838
// Rotina      : ProcessaoRevisaoSalarioContribuicao
// Alteração   : Correção na geração de cálculos retroativos referentes a 13º.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 14/08/2006
// Pendencia   : 22838
// Alteração   : 1) Alteração para cancelar a transação somente quando retornar
//                  até a etapa de escolhas de alteração.
//               2) Alteração para omitir a visualização do lote da folha para
//                  revisão de contribuição.
//               3) Alteração para colocar a marcação default nas operações de
//                  escolha de alteração.
//               4) Alteração para colocar o CODPORTFORMA que estiver cadastrado
//                  na CONTRIBPREVPARTP, caso exista.
//               5) Alteração para rodar a rotina de reajuste salarial para
//                  Mantidos Parciais (MP).
//               6) Alteração para, após a modificação das contribuições do
//                  participante, rodar novamente a consulta de contribuições a
//                  serem revisadas.
//               7) Criação de rotina para excluir o caracter " ' " de valores
//                  selecionadas para não causar erro em operações de Insert e Update.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 09/08/2006
// Pendencia   : 23002
// Alteração   : Acerto no demonstrativo para visualizar corretamente o valor SRB
//               original e corrigido.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 08/08/2006
// Pendencia   : 23022
// Alteração   : Acerto para verificar se existe uma transação em andamento no
//               momento do clique do botão para acessar cadastro de evolução
//               funcional.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 08/08/2006
// Pendencia   : 22694
// Alteração   : Acerto para não revisar contribuições que tenham sido tratadas
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 25/07/2006
// Pendencia   : 22731
// Alteração   : 1) Acerto na visualização dos ícones da segunda etapa.
//               2) Inclusão de uma opção para alterar a situação do participante na fundação.
//               3) Criação de um botão para abrir a tela de contribuições do participante.
//               4) Criação de opção para executar regra de reajuste no início do processo.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 12/07/2006
// Pendencia   : 22837
// Alteração   : Acerto para atualizar o salário de participação para a situação
//               de assistido.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 04/07/2006 e 11/07/2006
// Pendencia   : 22730
// Alteração   : 1) Totalizador no demonstrativo de revisão de contribuição
//               2) Acerto no demonstrativo de alterador
//               3) Esconder opções de beneficio quando for chamado por menu de contribuição
//               4) Antes de excluir a HSTCONTRIBPREV verificar se existem registros a excluir
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 26/06/2006
// Pendencia   : 22685
// Alteração   : 1) Acerto o parametro de origem para o calculo de contribuição
//               2) Caso não exista RESPONSAVEL usar o IDPESSOA (NVL)
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 16/06/2006
// Pendencia   : 22560
//               1) Acertar filtros pela DIB
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 13/06/2006
// Pendencia   : 22590
// Alteração   : 1) Caso seja revisão de salário de contribuição buscar apenas os participantes
//                  (IDTITULAR = IDPESSOA na DEPENTIT).
//               2) Sempre montar os SQL das matriculas caso seja selecionado arquivo externo.
//               3) 16/06/2006 - Caso seja revisão de beneficios, sempre trazer pessoas que tenham beneficio
// Data        : 09/06/2006 - 12/06/2006
// Alteração   : 1) Opção para não revisar beenficios processados em outros lotes
//               2) Alteração na lógica da impressão do cabeçalho da revisão de beneifcios
//                  por lote. Somente imprimir caso exista beneficio a revisar 
// Data        : 29/05/2006
// Rotina      : Prepararetroativo
// Alteração   : 1) Processar no LOOP das pessoas selecionadas para revisão (IDRESPONSAVEL),
//                  somente um IDRESPONSAVEL. Pois na rotina de revisão de beneficios,
//                  já é retornado todos os beneficios de um Responsavel.
//               2) Como sempre se faz a revisão do Grupo Familiar, tbm iremos
//                  sempre apagar os dados de todos os membros gerados nas revisões
//                  passadas. Caso seja revisão em grupo.
// Pendencia   : 22276
// Rotina      : ProcessaRevisaoBeneficio
// Alteração   : Incluir opção para não processar beneficios encerrados.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 16/05/2006
// Pendencia   : 22337
// Rotina      : ProcessaRevisaoBeneficio
// Alteração   : Caso ocorra algum erro no parcelamento exibir mensagem
// Data        : 12/05/2006
// Pendencia   : 22246
// Rotina      : ProcessaRevisaoBeneficio
// Alteração   : Passa o FOLHAORIGEM para a inclusão da HSTCOTRIBPREV
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 06/04/2006
// Pendencia   : 22029
// Rotina      : ProcessaRevisaoBeneficio
// Alteração   : No ano corrente, se o mês atual for anterior ao MESPGABONO da
//               PlanPrev, não efetuar revisão de abono.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 28/03/2006 - 19/04/2006
// Pendencia   : 21912
// Rotina      : CalculaProximoMes
// Alteração   : Novo controle de Abono
// Pendencia   : 21934
// Rotina      : ProcessaRevisaoBeneficio
// Alteração   : Novos parametros na exclusão da RUBRICAINDIV
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 13/03/2006
// Pendencia   : 21585
// Rotina      : ProcessaRevisaoBeneficio
// Alteração   : 1) Gravar IDMOVBENEF na RUBRICAINDIV  
//               2) Excluir a RUBRICAINDIV baseando-se no IDMOVBENEF registrado
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 03/03/2006
// Pendencia   :
// Rotina      : ProcessaRevisaoBeneficio
// Alteração   : 1) Passar o TipoMov para rotina de reajuste
// Autor(a)    : Augusto
// Data        : 23/02/2006
// Pendencia   : 21635
// Rotina      : ProcessaRevisaoBeneficio
// Alteração   : 1) Caso beneficio tenha sido migrado, utilizar os dois beneficios
//                  somente até da DIP do novo beneficio.
// Data        : 20/02/2006
// Pendencia   : 21600
// Rotina      : Varias
// Alteração   : 1) Retirada dos RULE
//               2) Novo controle de atualização do VALORATUAL, sempre atualiza caso esteja no
//                  mês final do processamento
// Data        : 16/02/2006
// Pendencia   : 19533
// Rotina      : Varias
// Alteração   : 1) Incluir CtrlBenefBfciario
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 14/02/2006
// Pendencia   : 21533
// Rotina      : CalculaProximoMes, ProcessaRevisaoBeneficio
// Alteração   : Alteração para apresentar os meses 13 de benefícios e contribuições
//               que não estavam aparecendo no demonstrativo caso o período de acerto
//               não passasse por dezembro do ano....
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 10/02/2006
// Pendencia   : 19533
// Rotina      : ProcessaRevisaoBeneficio
// Alteração   : Buscar quantidade de beneficiarios ativos de acordo como mês de referencia 
// Data        : 08/02/2006
// Pendencia   : 21461
// Rotina      : PreparaRetroativo
// Alteração   : Buscar registros já processados de acordo com arquivo de mátriculas.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 03/02/2006
// Pendencia   : 19531
// Rotina      : Varias
// Alteração   : Novas implementação para revisão de desconveniados. 
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 31/01/2006
// Pendencia   : 21249
// Rotina      : ProcessaRevisaoBeneficio
// Alteração   : Acerto no controle do ANOMES final de processamento - correção da alteração anterior para considerar
//               o FLGDATAPREVISTA
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 13/01/2006
// Pendencia   : 21249
// Rotina      : ProcessaRevisaoBeneficio
// Alteração   : Acerto no controle do ANOMES final de processamento
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Rotina      : ProcessaRateioPorBeneficiario
// Data        : 11/01/2006
// Pendência   : 19538                               
// Alteração   : Inclusão de dois novos parâmetros (sPlaContaDProvis e sPlaContaCProvis)
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 09/12/2005
// Pendencia   : 20678
// Rotina      : ProcessaoRevisaoSalarioContribuicao
// Alteração   : Escolher data previsão de recebimento das contribuições da tela
//               ou do calendario
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 05/12/2005
// Pendencia   : 20646
// Rotina      : ProcessaoRevisaoSalarioContribuicao
// Alteração   : Pesquisar rubrica de Assistido tbm
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 21/11/2005
// Pendencia   : 20771
// Rotina      : ProcessaRevisaoBeneficio
// Alteração   : retirei o DELETE MOVBENEF. Embora o delete dos históricos de benefício e
//               contribuição sejam necessários, a MOVBENEF deve continuar para manter um histórico de movimentações.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 07/11/2005
// Pendencia   : 20770
// Rotina      : chamadas da função CriticaDataCobrancaSit criadas em 13/06.
// Alteração   : buscar data de cobrança do lote e não do mês atual do loop.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 07/11/2005
// Pendencia   : 20384
// Rotina      : ReajustaBenefConc
// Alteração   : 1) Reajustar sempre que for beneficio temporario o Salario Virtual
//               2) Exibir Demonstrativo mesmo sendo diferenca zero
//               3) Limitar o processamento da revisão ao mês de encerramento do
//                  beneficio
//               4) Calcular e exibir acertos de contribuição na alteração de tipo
//                  de beneficio
//------------------------------------------------------------------------------
//  Autor(a)   : Leo
//  Rotina     : ProcessaRevisaoBeneficio, PreparaRetroativo
//  Data       : 27102005 - 28102005 - 31102005
//  Pendencia  : 20625
//  Alteração  : alteração para acertar o cálculo de contribuições de pensionistas que
//               era refeito para cada beneficiário do núcleo e resultava em um valor maior.
//------------------------------------------------------------------------------
//  Autor(a)   : Leo
//  Rotina     : ProcessaRevisaoBeneficio
//  Data       : 04/10/2005
//  Pendencia  : 20402
//  Alteração  : caso a consulta seja de um beneficiário, o FLGINTERNO da situação não pode ser a
//               do participante, será sempre "AS"
//------------------------------------------------------------------------------
//  Autor(a)   : Gleyber
//  Rotina     : ProcessaRateioPorBeneficiario
//  Data       : 12/09/2005
//  Pendencia  : 20169
//  Alteração  : Inclusão de novo parâmetro (sNaturezaDocumento) na chamada da rotina
//               dtmAPrevIntegraBack.BuscaInfIntegra
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 25/08/2005
// Rotina      : EfetuaParcelamento
// Alteração   : Acetos no parcelamento de contribuição
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 27/07/2005
// Pendencia   : 19835
// Rotina      : chama da PreparaBeneficioConcedido em ProcessaAlteracaoTipoBeneficio
// Alteração   : passar itpomov como 13, retroativo, e não como 7, concessão, caso contrário,
//               caso a rotina de reajuste já ache um registro naquele mês, sai do processo
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 27/07/2005
// Pendencia   : 19835
// Rotina      : PreparaRetroativo
// Alteração   : alteração da consulta para demnonstrativo da revisão de alteração do tipo de benefício
//               que não estava pegando os valores de pagamentos sem diferença, anterior x novo
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 27/07/2005
// Pendencia   : 19827
// Rotina      : dbgrdDadosBeneficioFieldChanged
// Alteração   : caso o valor alterado fosse o mesmo já existisse, sair
//               o códigho que alterava o valor dentro do próprio change cria um loop infinito, deve haver um mecanismo de saída...
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 26/07/2005
// Pendencia   : 19815 - acerto da resolução da pendência 19492
// Rotina      : PreparaRetroativo
// Alteração   : faltava preencchimento de novos parâmetros da qrydemonstrativo
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 07/07/2005
// Pendencia   : 19536
// Rotina      : MontaSelect
// Alteração   : Permitur pesquisa pela matricula do beneficiário
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 29/06/2005
// Pendencia   : 19587
// Rotina      : ProcessaRevisaoBeneficio
// Alteração   : comentei a linha If dValorDevido = 0 Then dValorDevido := dValorCobrado
//               no cálculo de contribuições.
//               a linha acima colocava, caso o novo cálculo de contribuição fosse zero, o valor
//               da nova contribuição com o valor da antiga, quando deveria acontecer uma devolução.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 01/07/2005
// Pendencia   : 19492
// Alteração   : Incluir no Demonstrativo o VALORATUAL da BENEFBFCIARIO 
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 21/06/2005
// Pendencia   : 19494
// Alteração   : coloquei o NVL em dois campos da qrydadosbeneficio
//               NVL(PF.FLGMOLESTIAGRAVE,0) FLGMOLESTIAGRAVE, NVL(PF.FLGISENTOIRRF,0) FLGISENTOIRRF
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 17/06/2005
// Pendencia   : 19516
// Alteração   : InsereContabil
//                 Desativação da rotina de contabilização para testes da FUNCEF
//               EfetuaParcelamento
//                 Novo tratamento para incluir somente uma RUBRICAINDIV no parcelamento para
//                 INSS e suplementação
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 13/06/2005
// Pendencia   : 18852
// Rotina      : ProcessaoRevisaoSalarioContribuicao
// Alteração   : Alteração para inserir na HSTONTRIBPREV para na DATAPREVISAORECEB
//               a data do calendário referente ao mês que está sendo trabalhado.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 07/06/2005
// Pendencia   : 19417
// Alteração   : Novos campos para qry de calculo dos alteradores
// Data        : 30/05/2005
// Alteração   : Novo tratamento para Revisão de contribuições de pensionistas
// Pendencia   : 19356
//               Erro nos calculos de acertos quando de devolução de beneficios
// Pendencia   : 19353
//               Não buscar os eventos fechados antes do periodo de processamento
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 19/05/2005
// Pendencia   : 18267
// Alteração   : Novo tratamento para verificar existencia de revisão na RETROATIVOPREV
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 17/05/2005
// Pendencia   : 19203
// Alteração   : Contabilizar a devolução de benefícios calculada na revisão
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 12/05/2005
// Pendencia   : 19216
// Alteração   : Permitir selecionar contribuição a processar no caso de Alteração
//               de Opção de Contribuição.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 06/05/2005
// Pendencia   : 18979
// Rotina      : ProcessaoRevisaoSalarioContribuicao
// Alteração   : Passar para as rotinas que inserem na HSTCONTRIBPREV a Situação atual do
//               participante para ele selecionar corretamente o FOLHAORIGEM
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 28/04/2005
// Rotina      : chamadas da função dtmAPrevIntegraBack.BuscaInfIntegra
// Alteração   : passagem do parâmetro sMsgErro para a função dtmAPrevIntegraBack.BuscaInfIntegra, para que esta retorne
//               uma possível mensagem de erro, já que ela não aciona mais um MSGDLG diretamente
//------------------------------------------------------------------------------
//  Rotina     : EfetuaParcelamento
//  Autor(a)   : Leo
//  Data       : 20/04/2005
//  Descrição  : verifica que registros dar como pago
//               caso o usuário tenha feito uma revisão de INSS separada da suplementação
//               e esteja parcelaendo apenas uma delas, o sistema não pode dar como pagos
//               rodos os registros
//------------------------------------------------------------------------------
//  Rotina     : CalculaAlteradores
//  Autor(a)   : Augusto
//  Data       : 21/03/2005 - 22/03/2005 - 06/04/2005
//  Descrição  : Tratamento de Artasos e Devoluções e novas implementações para
//               calculo de alteradores
//               Incluir MESCOBRANCA na pesquisa do HST de ALTERADOR
//------------------------------------------------------------------------------
//  Rotina     : AvançaPageControl e PreparaRetroativo
//  Autor(a)   : Bruno Bastos
//  Data       : 15/03/2005
//  Descrição  : Foi colocado uma condição para não executar queries referente a
//               benefícios quando for uma revisão de contribuição.
//------------------------------------------------------------------------------
//  Rotina     : PreparaRetroativo
//  Autor(a)   : Augusto
//  Data       : 07/03/2005
//  Descrição  : Acerto no controle da QryContribuicao
//------------------------------------------------------------------------------
//  Rotina     : EfetuaParcelamento
//  Autor(a)   : Leo
//  Data       : 01/03/2005
//  Descrição  : modificação na inserção na RUBRICAINDIV para tratar sequenciais maior que 1
//------------------------------------------------------------------------------
//  Rotina     : EfetuaParcelamento
//  Autor(a)   : Leo
//  Data       : 18/02/2005
//  Descrição  : retirei a cláusula que fazia com que só o histórico de devoluções fosse atualizado como recebido
//------------------------------------------------------------------------------
//  Rotina     : PreparaRetroativo
//  Autor(a)   : Leo
//  Data       : 03/02/2005
//  Descrição  : acrescentei a benefbfciario na query qryPessoasATratar para que o plano venha de uma vez por todas corretamente
//------------------------------------------------------------------------------
//  Rotina     : PreparaRetroativo
//  Autor(a)   : Leo
//  Data       : 03/02/2005
//  Descrição  : retirei a cláusula FLGCONCESSÃO = 1  das verificações dos lotes de pessoas que não devem ser
//               reprocessadas, para não pegar registros que foram preparados pela Folha
//------------------------------------------------------------------------------
//  Rotina     : PreparaRetroativo
//  Autor(a)   : Leo
//  Data       : 03/02/2005
//  Descrição  : substituição da verificação de existência de outro processo de benefício para o mesmo pagamento
//               retirei a busca pela MOVBENEF e coloquei pela HSTBENEFBFCIARIO. Embora mais lenta, é mais correta.
//------------------------------------------------------------------------------
//  Rotina     : PreparaRetroativo
//  Autor(a)   : Leo
//  Data       : 03/02/2005
//  Descrição  : acertos na atribuição do idplanoprev
//------------------------------------------------------------------------------
//  Rotina     : ProcessaRevisaoBeneficio
//  Autor(a)   : Leo
//  Data       : 02/02/2005
//  Descrição  : erro na deleção da RUBRICAINDIV
//               REVER VALIDADE DO CÓDIGO
//------------------------------------------------------------------------------
//  Rotina     : geral
//  Autor(a)   : Leo
//  Data       : 02/02/2005
//  Descrição  : a modifiquei a tribuição do IIDTITULAR que atribuia sempre o idpessoa da query QRYPESSOASATRATAR
//               o idpessoa e idtitular eram sempre iguais.
//------------------------------------------------------------------------------
//  Rotina     : PreparaRetroativo
//  Autor(a)   : Leo
//  Data       : 02/02/2005
//  Descrição  : coloquei a busca de pessoas por DEPENTIT e não por ELEGPATRO.MATRICULA
//               a modifiquei a tribuição do IIDTITULAR que atribuia sempre o idpessoa
//------------------------------------------------------------------------------
//  Rotina     : PreparaRetroativo
//  Autor(a)   : Leo
//  Data       : 02/02/2005
//  Descrição  : retirei join entre HSTBENEFBFCIARIO.IDPLANOPREV e PARTPREVPLAN.IDPLANOPREV
//               na busca de pessoas pois o plano não pode ser "fechado" conforme o plano do titular
//------------------------------------------------------------------------------
//  Rotina     : FormClose
//  Autor(a)   : Leo
//  Data       : 26/01/2005
//  Descrição  : adicionei o try para não ocorrer o erro na saída da tela
//------------------------------------------------------------------------------
//  Rotina     : geral
//  Autor(a)   : Leo
//  Data       : 26/01/2005
//  Descrição  : modifiquei passagem do parâmetro de dataref na função ExecutaRegraCalculoBeneficioBfciario
//               que estava como a data do evento de conceção do benefício
//------------------------------------------------------------------------------
//  Rotina     : PreparaRetroativo
//  Autor(a)   : Leo
//  Data       : 25/01/2005
//  Descrição  : modifiquei a checagem para abranger não só revisões para o mesmo lote, e sim
//               concessões, migrações e outros processos que geram pagamento de benefício
//------------------------------------------------------------------------------
//  Rotina     : ProcessaRevisaoBeneficio
//  Autor(a)   : Leo
//  Data       : 21/01/2005
//  Descrição  : alteração na montagem do demonstrativo de contribuições do beneficiário
//------------------------------------------------------------------------------
//  Rotina     : ProcessaRevisaoBeneficio
//  Data       : 27/01/2005
//  Descrição  : 1) Acerto na visualização das opções
//  Rotina     : ProcessaRevisaoBeneficio
//  Data       : 26/01/2005
//  Descrição  : 1) Mostrar nas listas de beneficios e contribuições a processar (caso em LOTE)
//                  somente os itens relacionados as Plano/Patros selecionados 
//  Data       : 25/01/2005
//  Descrição  : 1) Erro ao buscar o SRB no caso de processo em lote
//               2) Não atualizar BENEFBFCIARIO quando for mes 13, pois dados não
//                  não os corretos como ULTMESPREPARO, VALORATUAL e etc...
//  Data       : 21/01/2005
//  Descrição  : 1) Excluir registros no historico que não foram pagos
//  Rotina     : ProcessaRevisaoBeneficio
//  Data       : 20/01/2005
//  Descrição  : 1) TratAcerto no tratamento de beneficios retidos
//  Rotina     : ProcessaRevisaoBeneficio
//  Data       : 18/01/2005
//  Descrição  : 1) Continuação do novo tratamento dos alteradores
//               2) Acumular valores das contribuições (FCRT possui mais de uma contribuição)
//               3) Tratamento para variais contribuições 
//  Autor(a)   : Augusto
//  Data       : 14/01/2005 - 17/01/2005
//  Descrição  : 1) Novo Tratamento dos alteradores
//               2) Caso escolhida a opção de não recalcular o SRB, não reenquadra
//               3) Posicionar no beneficio que esta sendo processado
//------------------------------------------------------------------------------
//  Rotina     : ProcessaRevisaoBeneficio
//  Autor(a)   : Leo
//  Data       : 12/01/2005
//  Descrição  : voltei alteração do Augusto de 20/12/2004 "Acerto na atualização do ULTMESPREPARO (para o mes do LOTE)"
//               voltei o sanomestaual anterior
//               caso o mês do lote seja maior que o último mês para acerto,selecionado na revisão,
//               a Folha não processa amnutenção por que o ULTMESPREPARO ficou posterior ao último
//               mês que foi tratado pela revisão
//------------------------------------------------------------------------------
//  Autor(a)   : Augusto
//  Rotina     : ProcessaRevisaoBeneficio
//  Data       : 07/01/2005
//  Descrição  : 1) Passar IDMODULO para regra de calculo do INDICE 
//  Rotina     : ProcessaRevisaoBeneficio
//  Data       : 05/01/2005
//  Descrição  : 1) Buscar NUMRECEBIMENTO para inserir na HSTATRASOCONTRIB
//               2) Passar Origem 6 para rotinas de calculo de contribuição de Pensionistas
//  Autor(a)   : Augusto
//  Data       : 28/12/2004
//  Descrição  : 1) Retirada de subselect redundante na Query
//  Data       : 27/12/2004
//  Descrição  : 1) Acertos na Rotita de inclusão da correção monetária para beneficios
//               2) Implementação de rotina para isnlcuir correção monetária para CONTRIBUICAO
//  Data       : 21/12/2004
//  Descrição  : 1) Opção para não gravar demonstrativo em disco
//  Data       : 20/12/2004
//  Descrição  : 1) Acerto na atualização do ULTMESPREPARO (para o mes do LOTE)
//               2) Acerto para excluir revisão no IDPLANOPREV do revisado. Estava pesquisando com o do
//                  participante titular
//------------------------------------------------------------------------------
//  Rotina     : ProcessaoRevisaoSalarioContribuicao
//  Autor(a)   : Leo
//  Data       : 08/12/2004
//  Descrição  : alteração para pegar eventos sem IDSITPARTATUAL
//------------------------------------------------------------------------------
//  Rotina     : ProcessaRevisaoBeneficio
//  Autor(a)   : Leo
//  Data       : 05/12/2004
//  Descrição  : acerto no cálculo do abono
//------------------------------------------------------------------------------
//  Rotina     : EfetuaParcelamento
//  Autor(a)   : Augusto
//  Data       : 03/12/2004
//  Descrição  : Passar valor integral certo para gravação
//------------------------------------------------------------------------------
//  Rotina     : ProcessaRevisaoBeneficio
//  Autor(a)   : Leo
//  Data       : 01/12/2004
//  Descrição  : caso seja individual, acrescentei a matrícula no nome do atrquivo de demonstrativo
//------------------------------------------------------------------------------
//  Rotina     : ProcessaRevisaoBeneficio
//  Autor(a)   : Leo
//  Data       : 26/11/2004
//  Descrição  : se for individual chama a if VerificaPERCLimiteBeneficio que
// tem a permissão por usuário
//------------------------------------------------------------------------------
//  Rotina     : ProcessaRevisaoBeneficio
//  Autor(a)   : Leo
//  Data       : 24/11/2004
//  Descrição  : complemento à modificação feita em 23/11
//------------------------------------------------------------------------------
//  Rotina     : ProcessaRevisaoBeneficio
//  Autor(a)   : Leo
//  Data       : 23/11/2004
//  Descrição  : esta se o retroativo é de INSS migrado
//               caso seja e a data do retroativo seja menor que a DIP bo benefício no plano novo,
//               o sistema não deve sair na crítica de DIP, pois neste caso a DIP foi modificada pela migração
//               e o cálculo deve ser feito mesmo antes disso
//------------------------------------------------------------------------------
//  Rotina     : EfetuaParcelamento
//  Autor(a)   : Augusto
//  Data       : 23/11/2004
//  Descrição  : Caso a rubrica esteja bloqueada cancela
//------------------------------------------------------------------------------
//  Rotina     : ProcessaoRevisaoSalarioContribuicao
//  Autor(a)   : Camille
//  Data       : 05.11.2004
//  Pendência  : -----
//  Descrição  : Acertos no calculo do alterador
//------------------------------------------------------------------------------
//  Rotina     : PreparaRetroativo
//  Autor(a)   : Leo
//  Data       : 04.11.2004
//  Pendência  : -----
//  Descrição  : Alteracoes no demonstrativo de alteração de tipo de benefício para mostrar devoluções
//------------------------------------------------------------------------------
//  Rotina     : Diversas
//  Autor(a)   : Camille
//  Data       : 28.10.2004
//  Pendência  : -----
//  Descrição  : Alteracoes no demonstrativo
//------------------------------------------------------------------------------
//  Rotina     : Diversas
//  Autor(a)   : Camille
//  Data       : 27.10.2004
//  Pendência  : -----
//  Descrição  : Acerto na revisao de salarios e contribuicoes
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : ProcessaRevisaoBeneficio
//  Data       : 26.10.2004
//  Descrição  : Se o beneficio ainda não foi pago no mes, atualizar benefbfciario
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : ProcessaAlteracaoTipoBeneficio
//  Data       : 26.10.2004
//  Descrição  : apaga registros de devolução feitos pelo encerramento
//               estes acertos serão feitos pela própria PreparaBeneficioConcedido do benefício novo
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : ProcessaRevisaoBeneficio
//  Data       : 26.10.2004
//  Descrição  : tratamento de valores de devolução
//------------------------------------------------------------------------------
// Rotina      : PreparaRetroativo                   
// Autor(a)    : Augusto
// Data        : 18/10/2004
// Descricao   : Acertos para rodar processo em lote
// Rotina      : ProcessaRevisaoBeneficio
// Autor(a)    : Augusto
// Data        : 15/10/2004
// Descricao   : Novos campos para regra de abono
// Rotina      : Pesquisa de pessoa - MontaSelect (CAMPOCHAVES)
// Autor(a)    : Augusto
// Data        : 05/10/2004
// Pendência   : 17650
// Descricao   : Acerto na pesquisa de Pessoa sem beneficio
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : geral
//  Data       : 05.10.2004
//  Descrição  : correções no processo de troca de tipo de benefício
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : BtnProximoClick
//  Data       : 31.08.2004
//  Descrição  : exige a seleção do alterador para correção caso a correção esteja marcada
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 17/08/2004
//  Descrição  : Implementações na rotina de troca de tipo de beneficio
//  Descrição  : Gravar IDLOTE na RUBRICAINDIV (IDLOTEREVISAO)
//  Data       : 04/08/2004
//  Descrição  : Novo tratamento para correcao monetária
//  Data       : 26/07/2004
//  Descrição  : Acerto na montagem do SQL
//  Data       : 19/07/2004 / 20/07/2004
//  Descrição  : Tratamento de Correção Monetaria
//  Data       : 16/07/2004
//  Descrição  : Nova rotina InsereCorrecaoMonetaria
//  Data       : 15/07/2004
//  Descrição  : Acertos no parcelamento
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : ReajustaSalPATRO
//  Data       : 08.07.2004
//  Pendência  : 17171
//  Descrição  : Se for retroativo não verificar ultmesreaj
//------------------------------------------------------------------------------
// Rotina      : VerificaVALORLimiteBeneficio
// Autor(a)    : Camille
// Pendência   : 16644
// Data        : 06.07.2004
// Descricao   : Nova rotina para tratamento de valor limite de beneficio
//------------------------------------------------------------------------------
// Rotina      : Varias
// Autor(a)    : Augusto
// Data        : 07/07/2004
// Descricao   : Revisão da Rotina de Retroativo de Tipo de Beneficios
//------------------------------------------------------------------------------
// Rotina      : QryDadosBeneficio
// Autor(a)    : Augusto
// Data        : 04/05/2004
// Descricao   : retirad0 - AND  ((TO_CHAR(BF.DATAFINAL,'YYYY/MM') >= :ANOMESFIM) OR (BF.DATAFINAL IS NULL) )
// Rotina      : Varias
// Data        : 05/05/2004
// Descricao   : Varias viabilizando processo de revião apenas para o pensionista escolhido
// Data        : 12/05/2004
// Descricao   : Tratamento de correção por regra
// Data        : 18/05/2004
// Descricao   : Novos campos para Regra
// Data        : 20/05/2004
// Descricao   : Apagar Revisões apenas no mesmo periodo
// Data        : 24/05/2004
// Descricao   : Excluir somente revisões dos beneficios selecionados
// Data        : 25/05/2004
// Descricao   : Tratar contribuições pelo Responsável e não pelo IDPESSOA
//               Passar novos campos para regra de Parcelamento
//               Tratamento para beneficiarios migrados
// Data        : 26/05/2004
// Descricao   : Acertos no tratamento de PlanoOrigem
//               Revisar beneficios sem histórico algum
//               Revisar beneficios encerrados
// Data        : 27/05/2004
// Descricao   : Acertos para beneficios migrados
// Data        : 31/05/2004
// Descricao   : Acerto na pesquisa do indice de atualização da cota
// Data        : 07/06/2004
// Descricao   : Passar novos campos para regra de Parcelamento
// Data        : 16/06/2004
// Descricao   : Novo filtro para tirar beneficios migrados do somatorio de histórico
// Data        : 23/06/2004
// Descricao   : implementação no Tratamento de Atualização
//               Preencher campos de ANOMES com ANOMES atual
// Data        : 25/06/2004
// Descricao   : Incluir dados do beneficio Anterior para calculo do beneficio
// Data        : 01/07/2004
// Descricao   : Retirar data de filtro na DATACANCELAMENTO
// Data        : 07/07/2004
// Descricao   : Retirar do campo IDREGRA no insert da RUBRICAINDIV
//------------------------------------------------------------------------------
// Rotina      : EfetuaParcelamento
// Autor(a)    : Leo
// Data        : 04.05.2004
// Descricao   : alteração geral da função
//------------------------------------------------------------------------------
// Rotina      : Varias
// Autor(a)    : Augusto
// Data        : 22/04/2004 - 23/04/2004
// Descricao   : Calcular opções de beneficio
// Data        : 23/04/2004
// Descricao   : Calcular tbm beneficios encerrados
// Data        : 27/04/2004
// Descricao   : Retirado filtro de data de inscricao povisoriamente até definir
//               data de incrição na migração de plano
// Data        : 28/04/2004
// Descricao   : Inclusao do DISTINCT, pois no caso de ter dois beneficios no mes duplicava o valor
//               Recalcular contribuições no caso de mais de um beneficio
// Data        : 30/04/2004
// Descricao   : Retirar registro de acerto no calculo do valor devido 
//------------------------------------------------------------------------------
// Rotina      : ExecutaRegraCalculoBeneficio
// Autor(a)    : Camille
// Pendência   : 16286
// Data        : 19.04.2004
// Descricao   : Passar percentual de concessao de beneficio provisorio para
//               query da regra de cálculo
//------------------------------------------------------------------------------
// Rotina    : Diversas
// Autor(a)  : André Gomes
// Data      : 14.04.2004
// Alteração : Acertos na chamada da MONTASQLCONTRIBNOVA para passar numero
//             do processo e nao passar lote, pois não estava encontrando
//             o valor do beneficio para passar na query de contribuicao
// -----------------------------------------------------------------------------
// Rotina    : PreparaRetroativo
// Autor(a)  : Augusto
// Data      : 30/03/2004
// Alteração : Não impedir revisão caso não tenha histórico no periodo
//             Não calcular abono na Rotina de Revisão pois a de calculo já faz isso
// Data      : 31/03/2004
// Alteração : Executar regra de 1º pgto, no beneficio digitado
//             Igualar datas de recalculo e acerto.
//             erro ao reajustar o INSS
// -----------------------------------------------------------------------------
// Rotina    : PreparaRetroativo
// Autor(a)  : Gleyber
// Data      : 25/03/2004
// Pendência : 16213
// Alteração : Na gravação do LogTotalPREV passa a gravar a matrícula do participante
//             para revisão individual.
// -----------------------------------------------------------------------------
// Rotina    : EfetuaParcelamento
// Autor(a)  : Gleyber
// Data      : 25/03/2004
// Pendência : 16284
// Alteração : Alterado a variável sNumParcelas e o alias de uma query.
// -----------------------------------------------------------------------------
// Rotina    : PreparaRetroativo, ProcessaoRevisaoBeneficio
// Autor(a)  : Augusto
// Data      : 25/03/2004
// Pendência : FUNCEF
// Alteração : Alteração em várias queries mudando o IDPLANOPREV para IDPLANOORIGEM
//             para tratar benefícios migrados
// -----------------------------------------------------------------------------
// Rotina    : FormClose
// Autor(a)  : Gleyber
// Data      : 17/03/2004
// Pendência : 16238
// Alteração : Incluído um CLOSE no arquivo aberto para cessar erro de I/O
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 28/01/2004 /
// Alteração   : Retirado o filtro AND TO_CHAR(BF.DATAINICIOFUND,'YYYY/MM') <= :ANOMESINI
//               da qryDadosBeneficio
// Data        : 02/02/2004
// Alteração   : No caso de usar valores da tela, buscar beneficio processado.
// Alteração   : Exibir nome dos beneficiarios no demonstrativo
// Data        : 04/02/2004
// Alteração   : Buscar os valores do INSS no historico para calculo do beneficio
// Data        : 07/02/2004
// Alteração   : Na consulta de participante troquei PLANOPREV por PLANOORIGEM
// Data        : 08/02/2004
// Alteração   : Acertar apenas meses desejados
// Data        : 05/03/2004
// Alteração   : Não calculava contribuições para todos os beneficiarios
//               Mostrar responsavel da contribuição
// Data        : 06/03/2004
// Alteração   : Buscar contribuições mesmo que não tenha HST
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 22.01.2004
// Alteração   : Permitir processamento para algumas matriculas
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 15/12/2003
// Alteração   : Permitir processamento para algumas matriculas
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 10/12/2003
// Alteração   : Varias por tratar contribuicoes para NucleoFamiliar
//------------------------------------------------------------------------------
// Autor(a)    : Augusto 09/12/2003
// Data        : 23.10.2003
// Alteração   : Calcular proximo AnoMeses de processamento
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 23.10.2003
// Alteração   : Alterações para atender a FUNCEF (diversas)
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 14.07.2003
// Alteração   : Alterações para atender a FUNCEF e implementacao dos outros
//               tipos de retroativo
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina    : ValidaCamposObrigatorios / ExibeDif
// Autor(a)  : Augusto
// Data      : 10/04/2003
// Alteração : Só utiliza dados do Ti
// -----------------------------------------------------------------------------
// Rotina    : PreparaRetroativo
// Autor(a)  : Gleyber
// Data      : 11/12/2002
// Alteração : Alteração na query para se adaptar quando for tratamento individual.
// -----------------------------------------------------------------------------
// Rotina    : CriaLogOcorrencia
// Autor(a)  : Camille
// Data      : 13.08.2002
// Alteração : Gravação do Lote da Movimentacao de Beneficio
// -----------------------------------------------------------------------------
unit FRetroativoPREV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls, StdCtrls,
  wwdblook, Mask, MskEdDlg, wwdbdatetimepicker, CMDateTimePicker, TreeWzd,
  MontaSelect, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Menus, DBCtrls, wwdbedit,
  CMDBLookupCombo, uCtrlLancamento, uIntegraBack, uCtrlParamIntegra,
  Wwdotdot, Wwdbcomb, uCtrlBenefBfciario, DBClient, Provider, uSincronismo,
  DBGrids;

type
  //Bruno Bastos - Pend. 19203 - Início
  RecDadosContabeis = Record
                        RetornouValor : Boolean;
                        ContaContabilCredito,
                        ContaContabilDebito,
                        CodCentroCustoD,
                        CodCentroCustoC,
                        CodSubContaCre,
                        CodSubContaDeb,
                        UnidNegoc : String
                      End;
  //Bruno Bastos - Pend. 19203 - Fim

  TfrmRetroativoPREV = class(TfrmSairAjuda)
    qryVirtualBenef: TwwQuery;
    updVirtualBenef: TUpdateSQL;
    dsVirtualBenef: TwwDataSource;
    dsVirtualContrib: TwwDataSource;
    updVirtualContrib: TUpdateSQL;
    qryVirtualContrib: TwwQuery;
    qryHstContrib: TwwQuery;
    qryAlterador: TwwQuery;
    qryCorrecaoBeneficio: TwwQuery;
    qryBeneficio: TwwQuery;
    updBenefAUX: TUpdateSQL;
    qryMotivo: TwwQuery;
    qryAtualiza: TwwQuery;
    qrySituacao: TwwQuery;
    qry: TwwQuery;
    qryBenefAUX: TwwQuery;
    QryContrib1: TwwQuery;
    qryPassagem: TwwQuery;
    qryPlano: TwwQuery;
    qryPatro: TwwQuery;
    pnlEtapas: TPanel;
    TwCons: TTreeWzd;
    BtnAnterior: TBitBtn;
    BtnProximo: TBitBtn;
    BtnEncerra: TBitBtn;
    BtnCancela: TBitBtn;
    pnlFundoRetro: TPanel;
    pnlTitulo: TPanel;
    pgctrlEtapa: TPageControl;
    tbsEtapa2: TTabSheet;
    tbsEtapa1: TTabSheet;
    Image7: TImage;
    Image8: TImage;
    rbtnIndividual: TRadioButton;
    rbnLote: TRadioButton;
    tbsEtapa5OLD: TTabSheet;
    DBGBenef: TwwDBGrid;
    DBGContrib: TwwDBGrid;
    savedlg: TSaveDialog;
    printdlg: TPrintDialog;
    qryPessoasATratar: TwwQuery;
    qryContribNoMes: TwwQuery;
    qryContribuicao: TwwQuery;
    updContribuicao: TUpdateSQL;
    dsContribuicao: TwwDataSource;
    pMnu: TPopupMenu;
    DesmarcarTodas1: TMenuItem;
    MarcarTodas1: TMenuItem;
    qryRateio: TwwQuery;
    qryFormaAcerto: TwwQuery;
    qryIncluiAlterador: TwwQuery;
    qryFormaBanco: TwwQuery;
    pgctrlEtapa1: TPageControl;
    tbsEtapa1Indiv: TTabSheet;
    tbsEtapa1Lote: TTabSheet;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    bbtnProcurar: TBitBtn;
    lblParticipante: TStaticText;
    lblPatro: TStaticText;
    lblPlano: TStaticText;
    lblNUmProc: TStaticText;
    lblDIB: TStaticText;
    lblBeneficio: TStaticText;
    lblBeneficiario: TStaticText;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label15: TLabel;
    Label18: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    dblkpcmbPlano: TwwDBLookupCombo;
    qryBeneficioEscolher: TwwQuery;
    dsBeneficioEscolher: TwwDataSource;
    updBeneficioEscolher: TUpdateSQL;
    qryLote: TwwQuery;
    qryBenefbfciario: TwwQuery;
    pMnuBenef: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    qryContribuicoes: TwwQuery;
    qryDemonstrativo: TwwQuery;
    updDemonstrativo: TUpdateSQL;
    dsLote: TwwDataSource;
    qryListaBeneficio: TwwQuery;
    qryBeneficiosTrocar: TwwQuery;
    dsBeneficiosTrocar: TwwDataSource;
    updBeneficiosTrocar: TUpdateSQL;
    updReservaPart: TUpdateSQL;
    qryReservaPart: TwwQuery;
    dtDIBInicioLote: TCMDateTimePicker;
    dtDIBFinalLote: TCMDateTimePicker;
    Label45: TLabel;
    Label47: TLabel;
    pnlSubTitulo: TPanel;
    tbsEtapa4: TTabSheet;
    pgctrlEtapa4: TPageControl;
    tbsEtapa4Indiv2: TTabSheet;
    tbsEtapa4Indiv3: TTabSheet;
    tbsEtapa4Indiv4: TTabSheet;
    Label57: TLabel;
    tbsEtapa4Indiv1: TTabSheet;
    tbsEtapa5: TTabSheet;
    tbsEtapa6: TTabSheet;
    chkCommitIndiv: TCheckBox;
    Label52: TLabel;
    chkGravaDemons: TCheckBox;
    Label53: TLabel;
    Label51: TLabel;
    GroupBox7: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    GroupBox10: TGroupBox;
    Label32: TLabel;
    dtDataNovoBenef: TCMDateTimePicker;
    tbsEtapa4Indiv5: TTabSheet;
    tbsEtapa3: TTabSheet;
    Image6: TImage;
    rbRecalcBenef: TRadioButton;
    Image9: TImage;
    rbRevisaoContribuicao: TRadioButton;
    chkTipoIndivCadastral: TCheckBox;
    chkTipoIndivFuncional: TCheckBox;
    chkTipoIndivOpcaoContrib: TCheckBox;
    chkTipoIndivTipoBeneficio: TCheckBox;
    chkTipoIndivRevisaoBeneficio: TCheckBox;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image16: TImage;
    mmResult: TRichEdit;
    Label29: TLabel;
    lblProgresso: TLabel;
    rgrpEtapa3Filtra: TRadioGroup;
    grpEtapa3FiltraContrib: TGroupBox;
    dbgrdContribuicoes: TwwDBGrid;
    grpDataNasc: TGroupBox;
    Label58: TLabel;
    Label60: TLabel;
    dtDataNasc: TCMDateTimePicker;
    dtDataMorte: TCMDateTimePicker;
    Label46: TLabel;
    cmbEstCiv: TComboBox;
    GroupBox6: TGroupBox;
    Label59: TLabel;
    dtDataAdmissao: TCMDateTimePicker;
    lblDataDemissao: TLabel;
    dtDataDemissao: TCMDateTimePicker;
    Label61: TLabel;
    dtDataReadmissao: TCMDateTimePicker;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    dtDataInscricao: TCMDateTimePicker;
    lblTituloGrauParentesco: TLabel;
    dblkpcmbTipoDependencia: TCMDBLookupCombo;
    grpSexo: TRadioGroup;
    grpInvalido: TRadioGroup;
    grpMolestiaGrave: TRadioGroup;
    grpIsentoIR: TRadioGroup;
    edTempoServAnt: TEdit;
    grpCargoDiretoria: TRadioGroup;
    qryDadosPESSOA: TwwQuery;
    qryDependencia: TwwQuery;
    updOpcaoContribuicao: TUpdateSQL;
    qryOpcaoContribuicao: TwwQuery;
    dbgrdOpcaoContrib: TwwDBGrid;
    dsOpcaoContribuicao: TwwDataSource;
    GroupBox1: TGroupBox;
    DBText4: TDBText;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    Label19: TLabel;
    Label39: TLabel;
    edAnoMesIni: TMaskEdit;
    edAnoMesIniAcerto: TMaskEdit;
    Label20: TLabel;
    Label40: TLabel;
    edAnoMesFim: TMaskEdit;
    edAnoMesFimAcerto: TMaskEdit;
    Label42: TLabel;
    Label41: TLabel;
    edRubFolhaExtra: TEdit;
    grpEtapa3FiltraBenef: TGroupBox;
    dbgrdBeneficios: TwwDBGrid;
    qryDadosBeneficio: TwwQuery;
    updDadosBeneficoi: TUpdateSQL;
    dsDadosBeneficio: TwwDataSource;
    dbgrdDadosBeneficio: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    Label6: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lblMatricula: TStaticText;
    Label16: TLabel;
    lblSituacaoAtual: TStaticText;
    qryVinculaFunc: TwwQuery;
    Label17: TLabel;
    dblkpcmbVinculaFunc: TwwDBLookupCombo;
    bbtnCadEvolFuncional: TBitBtn;
    DBText9: TDBText;
    DBText10: TDBText;
    qryIndiceReaj: TwwQuery;
    grpParamAcertoFolhaBen: TGroupBox;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    dblkpcmbLoteAcerto: TwwDBLookupCombo;
    dbedMesLote: TDBEdit;
    dbdtDataPagamentoLote: TCMDateTimePicker;
    GroupBox5: TGroupBox;
    Label25: TLabel;
    Label33: TLabel;
    dblkpcmbMotivo: TwwDBLookupCombo;
    grpParamAcertoOutros: TGroupBox;
    Label21: TLabel;
    Label34: TLabel;
    Label28: TLabel;
    Label37: TLabel;
    edMesAcerto: TMaskEdit;
    dtDataDeveriaTerPago: TCMDateTimePicker;
    dtDataAcerto: TCMDateTimePicker;
    GroupBox9: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    dblkpFormaAtivos: TwwDBLookupCombo;
    dblkpFormaMantidos: TwwDBLookupCombo;
    dblkpALTAtivos: TwwDBLookupCombo;
    dblkpALTMantidos: TwwDBLookupCombo;
    rgrpTipoSituacao: TRadioGroup;
    qryAux: TwwQuery;
    QryContrib2: TwwQuery;
    OpenDlg: TOpenDialog;
    chkListaPessoas: TCheckBox;
    grpListaPessoas: TGroupBox;
    lblListaPessoas: TLabel;
    sbtnListaPessoas: TSpeedButton;
    edListaPessoas: TEdit;
    qryAcerto: TwwQuery;
    qryRegraParcela: TwwQuery;
    ToolbarSep971: TToolbarSep97;
    bbtnImprimir: TBitBtn;
    rgrpRecalculaBeneficio: TRadioGroup;
    grpInsereMesNaoEncontrado: TRadioGroup;
    EdValorBase1: TcmMaskEditDlg;
    EdValorBase2: TcmMaskEditDlg;
    EdValorBase3: TcmMaskEditDlg;
    DbLkEscolheBeneficio: TwwDBLookupCombo;
    QryAlteradorCorrecao: TwwQuery;
    CkbxGravaDemo: TCheckBox;
    Label38: TLabel;
    Panel3: TPanel;
    Label36: TLabel;
    dblkpcmbIndiceReaj: TwwDBLookupCombo;
    Label24: TLabel;
    dblkpcmbRegraParcela: TwwDBLookupCombo;
    Label35: TLabel;
    DbLkcAlterador: TwwDBLookupCombo;
    Label43: TLabel;
    edObservacao: TMemo;
    Label44: TLabel;
    DbLkcIncluiAlterador: TwwDBLookupCombo;
    MontaSelect: TMontaSelect;
    ChBxMantenHst: TCheckBox;
    ChBxGeraNovoProcesso: TCheckBox;
    Bevel3: TBevel;
    ChBxAcertaContrib: TCheckBox;
    ChBxUtilizaCalendario: TCheckBox;
    PnlPagaINSS: TPanel;
    Label54: TLabel;
    DbCbxPagaINSS: TwwDBComboBox;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    PnlBeneficiosRevisar: TPanel;
    chkConsideraResgate: TCheckBox;
    Label56: TLabel;
    ChBxProcessaRetidos: TCheckBox;
    ChBxProcessaEncerrados: TCheckBox;
    ChBxProcessaEmOutrosLote: TCheckBox;
    dblkpcmbSituacaoFundacao: TwwDBLookupCombo;
    Label55: TLabel;
    qrySitPart: TwwQuery;
    btnCadContribParticipante: TBitBtn;
    chkReajustaSalPartInicio: TCheckBox;
    Label65: TLabel;
    RdBtnMatricula: TRadioButton;
    RdBtnInscricao: TRadioButton;
    ChBxSomentePlanoAtivo: TCheckBox;
    DsAux: TDataSource;
    Label66: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure reValorInfINSSKeyPress(Sender: TObject; var Key: Char);
    procedure edDataFinalBenefCloseUp(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure reValorCalcINSSBtnClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure DBGBenefCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure edDataInicioBenefExit(Sender: TObject);
    procedure rbAtrasoClick(Sender: TObject);
    procedure lkcmbAlteradorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBGContribCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DesmarcarTodas1Click(Sender: TObject);
    procedure MarcarTodas1Click(Sender: TObject);
    procedure rbtnIndividualClick(Sender: TObject);
    procedure rbnLoteClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure dblkpcmbListaBeneficioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure rgrpEtapa3FiltraClick(Sender: TObject);
    procedure edAnoMesIniExit(Sender: TObject);
    procedure edAnoMesFimExit(Sender: TObject);
    procedure grpMolestiaGraveClick(Sender: TObject);
    procedure bbtnCadEvolFuncionalClick(Sender: TObject);
    procedure dblkpcmbLoteAcertoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbgrdDadosBeneficioFieldChanged(Sender: TObject;
      Field: TField);
    procedure dblkpcmbMotivoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnListaPessoasClick(Sender: TObject);
    procedure chkListaPessoasClick(Sender: TObject);
    procedure rbRecalcBenefClick(Sender: TObject);
    procedure rbRevisaoContribuicaoClick(Sender: TObject);
    procedure qryDadosBeneficioAfterScroll(DataSet: TDataSet);
    procedure EdValorBase1BtnClick(Sender: TObject);
    procedure EdValorBase2BtnClick(Sender: TObject);
    procedure EdValorBase3BtnClick(Sender: TObject);
    procedure EdValorBase1Change(Sender: TObject);
    procedure EdValorBase2Change(Sender: TObject);
    procedure EdValorBase3Change(Sender: TObject);
    procedure DbLkEscolheBeneficioChange(Sender: TObject);
    procedure dtDataDeveriaTerPagoChange(Sender: TObject);
    procedure btnCadContribParticipanteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    CtrlLancamento : TCtrlLancamento;

    bRefazExistentes : boolean; // CAMILLE - 28.10.2004
    bJaSaiuConvenio, bAcertaINSS      : Boolean; { Augusto 03/02/2006 }
    bExcedeuLimite   : boolean ; // CAMILLE - 27.10.2004
    iIdUsuarioAutorizaVALOR  : longint; // CAMILLE - 06.07.2004
    iIdUsuarioAutorizaPERC   : longint; // CAMILLE - 06.07.2004
    iIdRetroativo     : longint;
    bAlterouRMI       : boolean;
    cOperacao : char; // A - Avancando, R - Retornando
    iIdCalculo,
    iNumeroProcesso,
    iIdTitular,
    iIdPessoa,
    iIdPessJur,
    iIdPlanoPrev, iIdPlanoOrigem,
    iSeqProposta,
    iIdBeneficio  : longInt;
    iIdEvento : integer;
    iIdLoteRetroativo : longint;

    rOpcao,
    rOpcao1,
    rOpcao2,
    rOpcao3,

    rVlrTotal,
    rVlrAtual        : real;

    { Augusto 31/03/2004 }
    dTotalBenefPessoa, dTotalBenef       : double;
    dTotalContribPessoa, dTotalContrib   : double;
    dTotalINSSPessoa, dTotalINSS         : double;

    iIdMovBenef           : LongInt;


    sNomeParticipante,
    sNomePlano,
    sNomePatro,
    sNomeBeneficio,
    sDataEvento,
    sDataIncioFund,

    sIdSitPart,
    sIdSitFunc,
    sIdSitPlanoPrev,
    sSQLBenefAssoc       : String;
    F, X                 : TextFile;

    // Dados do INSS para preencher caso ja tenha sido requerido
    sValorInfINSS,
    sValorBase1INSS,
    sValorBase2INSS,
    sValorBase3INSS,
    sFlgPossuiAcompINSS,
    sAnoMesPagamento,
    sIdSitPartAntes  ,
    sIdSitPlanAntes  ,
    sIdSitFuncAntes     : string;

    iLoteSelecionado,
    iflgIncluiMesConc,
    iIdRegraAbono       : Integer;

    bGrupo,
    bHouveDif,
    bUsaAlterador        : boolean;

    sContribuicoes, sBeneficios : string;
    sSQL : String;

    bDesfazTodosRetroativos,
    bNaoDesfazTodosRetroativos : boolean;
    bParcelamento           : boolean;

    CtrlBenefBfciario       : TCtrlBenefBfciario;

    //Bruno Bastos - Pend. 19203 - Início
    Function BuscaDadosContabeis(pcBenefContrib : Char; piIdPatro, piIdPlanoPrev, piIdBeneficio: Integer): RecDadosContabeis;
    function InsereContabil(pcBenefContrib: Char; piIdPessoa, piIdTitular, piIdPatro, piIdPlanoPrev, piIdBeneficio : Integer; pdVlrLanc: Double): Boolean;
    //Bruno Bastos - Pend. 19203 - Fim

    function VerificaPERCLimiteBeneficioRETROATIVO  ( qry              : TwwQuery;
                                        psTituloRotina   : string;
                                        piNumeroProcesso : longint;
                                        piIdPessJur      : longint;
                                        piIdPlanoPrev    : longint;
                                        piIdTitular      : longint;
                                        piIdPessoa       : longint;
                                        piIdBeneficio    : longint;
                                        pdValorAnterior  : double;
                                        pdValorNovo      : double;
                                        pbPedeAutoriza   : boolean;
                                        psMsgAux         : string = ''    ) : longint;

    function  PreparaRetroativo                  : boolean;
    function  ProcessaAlteracaoCadastral         : boolean;
    function  ProcessaAlteracaoDadosBeneficio    : boolean;
    function  ProcessaAlteracaoOpcaoContribuicao : boolean;
    function  ProcessaAlteracaoTipoBeneficio(psAnoMesIni      : string;
                                             psAnoMesFim      : string;
                                             piIdPessJur      : longint;
                                             piIdPlanoPrev    : longint;
                                             piIdPessoa       : longint;
                                             piSeqProposta    : longint;
                                             Var piNumeroProcesso : Integer) : boolean;

    function  ProcessaoRevisaoSalarioContribuicao (psAnoMesIni      : string;
                                                   psAnoMesFim      : string;
                                                   piIdPessJur      : longint;
                                                   piIdPlanoPrev    : longint;
                                                   piIdPessoa       : longint;
                                                   piSeqProposta    : longint;
                                                   psContribuicoes  : string) : integer; // -1 : erro
                                                                                         //  0 : ok
                                                                                         //  1 : nada encontrado
                                                                                         //  2 : cancelado -> avisar

    function  ProcessaRevisaoBeneficio ( psAnoMesIni      : string;
                                    psAnoMesFim      : string;
                                    piIdPessJur      : longint;
                                    piIdPlanoPrev    : longint;
                                    piIdTitular      : longint; { Augusto 05/05/2004 }
                                    piIdPessoa       : longint;
                                    piSeqProposta    : longint;
                                    psContribuicoes  : string ) : Integer;

    function ProcessaRateioPorBeneficiario(
                                            piIdPessJur        : longint;
                                            piIdPlanoPrev      : longint;
                                            piIdTitular        : longint;
                                            piSeqProposta      : longint;
                                            piIdMotivo         : longint;
                                            piIdLote           : longint;
                                            piIdItem           : longint; //idbeneficio ou idcontribuicao
                                            pcTipoItem         : char;    // C = Contribuicao, B = Beneficio
                                            pcAtrasoDevol      : char;    // A = Atraso,       D = Devolucao
                                            psAnoMesCobranca   : string;
                                            psAnoMesReferencia : string;
                                            psDataCobranca     : string;
                                            pdValorARatear     : double;
                                            pbInsereAcertoTit  : boolean
                                                                           ) : boolean;

    function  GravaLogDadosAlterados( psTabela      : string;
                                      psCampo       : string;
                                      psValorAntes  : string;
                                      psValorDepois : string;
                                      psDescricao   : string ) : boolean;

    function ValidaAlteracao        ( psTabela      : string;
                                      psCampo       : string;
                                      psValorAntes  : string;
                                      psValorDepois : string ) : boolean;


    procedure AbreQryBeneficio     ( bConsideraGrupo      : boolean;
                                     piIdEventoGerador,
                                     piIdPlanoPrev        : longint );
    procedure SelecionaProcesso    ( piNumeroProcesso,
                                     piIdTitular,
                                     piIdPessoa           : longint );
    function  AvancaPageControl : boolean;
    function  ValidaCampos(piEtapa : word) : boolean;
    Function  AtualizaCaption: Boolean;
    Function  ExibeDif: Boolean;
    Procedure AlimentaQryVirtualBenef(pdValorNovo, pdValorTotal: double; psAnoMes: String);

    Procedure AlimentaQryVirtualContrib(pdValorNovo, pdValorTotal: double;
                                psAnoMes: String;
                                piIdContribuicao: Integer;
                                psContribuicao: String);

    Function  GravaHstBenef: Boolean;
    Function  AtualizaBenef: Boolean;
    Function  BeneficioRetido: Boolean;
    function  CalculaAlterador(psMesReferencia, psDataRequerimento, psDataEfetPagto : string; pdValor : Double;
                               piCodalterador, piIdregracalculo : integer;
                               var pdValorCorrecao : Double) : boolean;
    Function  CalculaAbono (psAnoMesRef: String;  var pdValorAbono: Double; pdValor: Double):Boolean;



    function CalculaContribuicaoRetro(piIdPessJur,     piIdPlanoPrev,
                             piIdMotivo,      piSitRecebimento   : integer;
                             qryContrib,      qryAux             : TwwQuery;
                             sSQL,            sSQLRegra,
                             sWhereSQLRegra,  sAliasSQLRegra,
                             sSitFundacao,    sDescPreparo,
                             sAtrasoDevol,    sFlgVeioDoEvento   : string;
                             bValorQry,       bParaCobranca      : boolean;
                             var sMsgErro                        : string;
                             var iIdLote                         : integer;
                             sSalarioPart,    sIdSitPart,
                             sFlgIntEvento                       : string;
                             bAbreQueryContrib,
                             bAtualizaTotalLote                  : boolean;
                             psAnoMesReferencia                  : string;
                             pbPrepararSoMes13                   : boolean;
                             piIdEventoGerador                   : longint;
                             psDataInicioBenef, psDataFinalBenef : string;
                             piOrigem, piFlgDtFinalPrevista      : word;   // 0 - Outros ,
                                                                           // 1 - Suspensao de contribuicao
                                                                           // 2 - Concessao de Beneficio
                                                                           // 3 - Renova
                             psDataInicioOriginal                : string; // apenas para Renovacao
                             piNumProcesso                       : longint //leocbs - 29052002
                            ) : boolean;

    procedure CriaLogOcorrenciaRetroativo( sIdPlanoprev,
                                           sIdPessjur,
                                           sIdTitular,
                                           sIdBeneficio,
                                           sNumProcesso,
                                           sIdPessoa,
                                           sSeqProposta,
                                           sTipoMov,
                                           sDataMov,
                                           sValorAtual,
                                           sValorTotal,
                                           sValorCotas,
                                           sDataInicio,
                                           sDataFinal,
                                           sValorAtualAnt,
                                           sDataInicioAnt,
                                           sDataFinalAnt,
                                           sIdSitBenefAnt  : string;
                                           iFlgDataPrevAnt : integer;
                                           qryAux          : TwwQuery;
                                           sMotivo         : String;
                                           piIdLote        : longint;
                                           psValorSRB,
                                           psValorSRBAnt      : string;
                                           piIdUsuarioAutoriza,
                                           piIdRetroativo : longint;     { Augusto 19/05/2005 }
                                           piIdMovBenef   : longint = -1 { Augusto 10/03/2006 }
                                           ); // CAMILLE - 06.07.2004

    function ValidaOpcoesRetroativo(iTipoRetroativo : integer) : boolean;

    function CalculaReservaParaBeneficio ( piIdRegraReserva  : longint;
                                           var pdValorReservaCota : double;
                                           psAnoMesRef : String ): double;

    procedure LimpaDadosPESSOA;
    procedure PreencheDadosPESSOA;
    procedure MontaDadosBeneficioAnterior;
    function  MontaStringMatriculas : string; // CAMILLE - 15.12.2003
    function  EfetuaParcelamento : boolean;
    procedure ExibeDemonstrativoRevisaoBeneficio;

    function CalculaOpcao(piIdRegraCalculo : longint;
                          sCampo, sTitulo : string) : double;

    Procedure AbreConsultaContribuicao(pcTipo : Char);

    procedure GravaLinhaTxt(Linha : String);

    Function JaSaiuConvenio(QryDadosBeneficio : TwwQuery): Boolean;

    Function JaPossuiRevisaoEmOutroLote:Boolean;

    Function TiraPlic(psCampo : String) : String;  // Gleyber - 14/08/2006 - Pendência 22838

  public
    { Public declarations }
    Function CalculaProximoMes(
      sAnoMesAtual,
      sAnoMesFim,
//P.RAMOS-06/04/2006-PEND.22029-PARÂMETROS NOVOS PARA VERIFICAR SE DEVE PROCESSAR
// A REVISÃO DO ABONO NO ANO CORRENTE CONSIDERANDO O MÊS QUE SE PAGA ABONO.
      sAnoMesLote,
      sMesPagaAbono: String
//P.RAMOS-06/04/2006-PEND.22029-FIM
      ) : String;
    Function CalculaAlteradores(pcTipo : Char;
                                psAnoMesRef : String;
                                pdValorCalculo : Double;
                                Var dValorTotalAlteradores : Currency;
                                piIdContribuicao : Integer = -1;
                                piNumLancamento  : LongInt = -1): Boolean;

    procedure InsereCorrecaoMonetaria(pcTipoCorracao : Char; { B - Beneficio C - Contribuição }
                                      QryDados       : TwwQuery;
                                      psAnoMesRef    : String;
                                      pdValor        : Double;
                                      piNumLancamento : LongInt = -1 );

    procedure ImprimeCabecalhoPessoa;

  end;

var
  frmRetroativoPREV: TfrmRetroativoPREV;
  iIdTitularBeneficioEmProcesso : Integer;

implementation

uses UMensErro, FCadOpcoesBenef, FSelecionaLote, UFuncoesUteis, fAguarde, uBeneficio,
     uAdmPrev, DAPrev, DBaseDados, UParticipante, uDataBase, uFuncaoGeral, uContribuicaoPrev,
     DAPrevIntegraBack, USistema, UMovReserva, FCadEvolFuncPrev,
     FParcelamentoRevisao, FCadContribParticipante;


{$R *.DFM}

function TfrmRetroativoPrev.MontaStringMatriculas : string;
var sMatriculas : string;
    sLinha      : string;
begin
   sMatriculas := '';
   while not Eof(X) do
   begin
      Readln(X, sLinha);
      if Trim(sMatriculas) = ''
      then sMatriculas := ''''+Trim(sLinha)+''''
      else sMatriculas := sMatriculas+','+''''+Trim(sLinha)+'''';
   end;

   Result := sMatriculas;
end; // MontaStringMatriculas

function TfrmRetroativoPrev.ValidaOpcoesRetroativo(iTipoRetroativo : integer) : boolean;
begin
   Result := False;

   if chkTipoIndivTipoBeneficio.Checked
   then begin
      // Verificar se todos os campos estão preenchidos
      if dtDataNovoBenef.Text = ''          then Exit;
      // Verificar se a pessoa associou todos os novos benefícios
      if dblkpcmbLoteAcerto.Text = ''           then Exit;
      // Verificar se o novo codigo de beneficio foi informado
      qryBeneficiosTrocar.First;
      while not qryBeneficiosTrocar.Eof do
      begin
         if qryBeneficiosTrocar.FieldbyName('NOVOIDBENEFICIO').AsInteger <= 0
         then begin
            MsgDlg('Novo Código de Benefício deve ser informado para TODOS os benefícios.'+#13+
                   'Se algum dos benefícios não tiver alteração, informar o mesmo código do atual.','Informação',mtInformation,[mbOk],0);
            Exit;
         end;
         qryBeneficiosTrocar.Next;
      end;
   end;

   Result := True;
end;

function  TfrmRetroativoPrev.ValidaCampos(piEtapa : word) : boolean;
var
  i: Integer;
begin
  Result := False;

  case piEtapa of
    1 : begin
          if rbtnIndividual.Checked
          then begin           
             if lblParticipante.Caption = ''
             then begin
                MsgDlg('Selecione o Participante ou Beneficiário Desejado.','Erro',mtError,[mbOk],0);
                Exit;
             end;
          end
          else begin // Lote
             if (
                  ( Trim(dtDIBInicioLote.Text) <> '' ) and ( Trim(dtDIBFinalLote.Text)  = '' ) or
                  ( Trim(dtDIBInicioLote.Text) =  '' ) and ( Trim(dtDIBFinalLote.Text) <> '' ) 
                )
             then begin
                MsgDlg('Informe a data inicial e final.','Erro',mtError,[mbOk],0);
                Exit;
             end;
             if chkListaPessoas.Checked
             then begin
                if Trim(edListaPessoas.Text) = ''
                then begin
                   MsgDlg('Indique o Arquivo com a Lista.','Erro',mtError,[mbOk],0);
                   Exit;
                end;
             end;
          end;
        end;
    2 : begin
           if not (chkTipoIndivCadastral.Checked)     and
              not (chkTipoIndivFuncional.Checked)     and
              not (chkTipoIndivOpcaoContrib.Checked)  and
              not (chkTipoIndivTipoBeneficio.Checked) and
              not (chkTipoIndivRevisaoBeneficio.Checked)
           then begin
              if MsgDlg('Nenhum tipo de alteração foi selecionado. '+#13+
                        'Deseja efetuar a revisão sem alterar nenhum dado do beneficiário ou participante ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
              then Exit;
           end;
        end;
    3 : begin
           if (not rbRecalcBenef.Checked) and (not rbRevisaoContribuicao.Checked)
           then begin
              MsgDlg('Selecione o Tipo de Revisão desejado.','Erro',mtError,[mbOk],0);
              Exit;
           end;

           if (Trim(edAnoMesIni.Text) = '/') or (Trim(edAnoMesFim.Text) = '/') or
              (Trim(edAnoMesIni.Text) = '')  or (Trim(edAnoMesFim.Text) = '')
           then begin
              MsgDlg('Informe o Período Desejado para os Acertos.','Erro',mtError,[mbOk],0);
              Exit;
           end;
        end;
    5 : begin
          if Trim(dblkpcmbMotivo.Text) = ''
          then begin
             MsgDlg('Indique o Motivo para possíveis acertos.','Erro',mtError,[mbOk],0);
             Exit;
          end;

          if rbRecalcBenef.Checked
          then begin // Revisão de Beneficios
             if (Trim(dblkpcmbLoteAcerto.Text) = '')
             then begin
                 MsgDlg('Indique o Lote da Folha de Benefícios para possíveis acertos.'+#13+
                        'Para a operação de Revisão de Benefícios em Lote este campo é obrigatório.' ,'Erro',mtError,[mbOk],0);
                 Exit;
             end;
          end
          else begin // Revisao de Contribuicao
             if (Trim(dblkpcmbLoteAcerto.Text) = '')  and  (rbnLote.Checked)
             then begin
                 if MsgDlg('AVISO : O Lote da Folha de Benefícios não foi informado.'+#13+
                           '        Caso existam participantes assistidos/pensionistas no lote, a revisão não será concluída.'+#13+
                           '        Deseja Continuar ? ','Confirmação',mtConfirmation, [mbYes,mbNo],0) = mrNo
                 then Exit;
             end;

             if Trim(edMesAcerto.Text) = ''
             then begin
                 MsgDlg('Indique o Mês para possíveis acertos.','Erro',mtError,[mbOk],0);
                 Exit;
             end;
             if Trim(dtDataAcerto.Text) = ''
             then begin
                 MsgDlg('Indique a Data de Cobrança/Pagamento para possíveis acertos.','Erro',mtError,[mbOk],0);
                 Exit;
             end;
             if (Trim(dtDataDeveriaTerPago.Text) = '') And (ChBxUtilizaCalendario.Checked = False)
             then begin
                 MsgDlg('Indique a Data Prevista para cobrança/Pagamento para possíveis acertos.','Erro',mtError,[mbOk],0);
                 Exit;
             end;

             if Trim(dblkpFormaAtivos.Text) = ''
             then begin
                 MsgDlg('Indique a Forma de Cobrança/Pagamento de Ativos para possíveis acertos.','Erro',mtError,[mbOk],0);
                 Exit;
             end;
             if Trim(dblkpFormaMantidos.Text) = ''
             then begin
                 MsgDlg('Indique a Forma de Cobrança/Pagamento de Mantidos para possíveis acertos.','Erro',mtError,[mbOk],0);
                 Exit;
             end;
          end;
        end;
  end;
  Result := True;
end; // ValidaCampos

{function  TfrmRetroativoPrev.ValidaCamposObrigatorios : boolean;
var
  i: Integer;
begin
  Result := True;

  case TwCons.Etapa.Pos of
    1 : begin
          For i := 0 To ComponentCount -1 do
            If (Components[i] Is TRadioButton)  Then
              if (TRadioButton(Components[i]).Checked) And
                 (TRadioButton(Components[i]).tag = 999) Then
              Begin
                Result := True;
                Break;
              End Else Result := False;
        end;
   3 : begin
          Result := True;
        end;

    4 : begin
          bHouveDif := False;
        end;
    5 : begin
          Result := True;
        end;
    6 : begin
          Result := True;
        end;
  end;

end;
}

function TfrmRetroativoPrev.AvancaPageControl : boolean;
var
  bContinuaEtapa6 : boolean; sArq : String;
  cTipoEnvio : Char;
begin
  Result               := False;
  bAcertaINSS          := True; { 03/02/2006 }
  bContinuaEtapa6      := False;
  bbtnImprimir.Visible := False;
  grpEtapa3FiltraContrib.Visible   := False;
  grpEtapa3FiltraBenef.Visible     := False;

  if bParcelamento
  then begin
     bContinuaEtapa6  := True;
     TwCons.Etapa.Pos := 6;
  end;

  bParcelamento := False;
  if rbtnIndividual.Checked
  then begin
     if Trim(lblParticipante.Caption) <> '' Then
       //pnlTitulo.Caption := 'Cálculo Retroativo Individual - Matrícula : '+MontaSelect.ValoresChave[15]+' - Data : '+DateToStr(date)                    // ClaudioR - 19962 - 16/08/2007
       pnlTitulo.Caption := 'Cálculo Retroativo Individual - Matrícula : '+MontaSelect.ValoresChave[15]+' - Data : ' + FormatDateTime('dd/mm/yyyy', date) // ClaudioR - 19962 - 16/08/2007
     else
       //pnlTitulo.Caption := 'Cálculo Retroativo Individual - Matrícula : <a escolher> - Data : '+DateToStr(date)                    // ClaudioR - 19962 - 16/08/2007
       pnlTitulo.Caption := 'Cálculo Retroativo Individual - Matrícula : <a escolher> - Data : ' + FormatDateTime('dd/mm/yyyy', date) // ClaudioR - 19962 - 16/08/2007
  end
  else begin
     if chkListaPessoas.Checked Then
       //pnlTitulo.Caption := 'Cálculo Retroativo Em Lote - Indicadas em Arquivo - Data : '+DateToStr(date)                    // ClaudioR - 19962 - 16/08/2007
       pnlTitulo.Caption := 'Cálculo Retroativo Em Lote - Indicadas em Arquivo - Data : ' + FormatDateTime('dd/mm/yyyy', date) // ClaudioR - 19962 - 16/08/2007
     else
       //pnlTitulo.Caption := 'Cálculo Retroativo Em Lote - Data : '+DateToStr(date);                    // ClaudioR - 19962 - 16/08/2007
       pnlTitulo.Caption := 'Cálculo Retroativo Em Lote - Data : ' + FormatDateTime('dd/mm/yyyy', date); // ClaudioR - 19962 - 16/08/2007
  end;

  case TwCons.Etapa.Pos of
       1 : begin
              if cOperacao = 'R'
              then pgctrlEtapa.ActivePage    := tbsEtapa1
              else begin
                 if not ValidaCampos(1) then Exit;

                 { Inicio Augusto 26/01/2005 }
                 if rbtnIndividual.Checked then
                   pgctrlEtapa.ActivePage    := tbsEtapa2
                 else begin
                   TwCons.Etapa.Avancar;
                   pnlSubTitulo.Caption        := TwCons.Etapa.Caption[TwCons.Etapa.Pos-1];
                   pgctrlEtapa.ActivePage      := tbsEtapa3;

                   { Augusto 30/05/2005 }
                   if rbtnIndividual.Checked = True
                   Then rgrpEtapa3Filtra.Visible := False
                   Else rgrpEtapa3Filtra.Visible := True;

                   { Filtrar BENEFICIOS por Plano/Patro escolhidos }
                   QryBeneficioEscolher.Close;
                   QryBeneficioEscolher.ParamByName('IDPLANOPREV').Clear;
                   QryBeneficioEscolher.ParamByName('IDPATRO').Clear;
                   QryBeneficioEscolher.ParamByName('IDFUNDACAO').AsInteger  := iIdFundacao;
                   { Patro }
                   if dblkpcmbPatro.Text <> '' then
                     QryBeneficioEscolher.ParamByName('IDPATRO').AsInteger :=
                       qryPatro.FieldByName('IDPESSOA').AsInteger;
                   { Plano }
                   if dblkpcmbPlano.Text <> '' then
                     QryBeneficioEscolher.ParamByName('IDPLANOPREV').AsInteger :=
                       qryPlano.FieldByName('IDPLANOPREV').AsInteger;
                   QryBeneficioEscolher.Open;

                   { Filtrar CONTRIBUIÇÕES por Plano/Patro escolhidos }
                   QryContribuicao.Close;
                   QryContribuicao.ParamByName('IDPATRO').Clear;
                   QryContribuicao.ParamByName('IDPLANOPREV').Clear;
                   QryContribuicao.ParamByName('IDFUNDACAO').AsInteger  := iIdFundacao;
                   { Patro }
                   if dblkpcmbPatro.Text <> '' then
                     QryContribuicao.ParamByName('IDPATRO').AsInteger :=
                       qryPatro.FieldByName('IDPESSOA').AsInteger;
                   { Plano }
                   if dblkpcmbPlano.Text <> '' then
                     QryContribuicao.ParamByName('IDPLANOPREV').AsInteger :=
                       qryPlano.FieldByName('IDPLANOPREV').AsInteger;
                   QryContribuicao.Open;
                 end;
                 { Fim Augusto 26/01/2005 }
              end;
           end;
       2 : begin
              if cOperacao = 'R'
              then pgctrlEtapa.ActivePage       := tbsEtapa1
              else begin
                 if not ValidaCampos(2) then Exit;
                 { Augusto 12/05/2005 }
                 if rbtnIndividual.Checked = True
                 Then rgrpEtapa3Filtra.Visible := False
                 Else rgrpEtapa3Filtra.Visible := True;

                 pgctrlEtapa.ActivePage       := tbsEtapa3;

                 if prmMenuChamadorRetroativo = 'C'
                 then rbRevisaoContribuicao.Checked := True
                 else rbRecalcBenef.Checked         := True;

                 if Trim(lblDIB.Caption) <> '' Then
                 Begin
                   // ClaudioR - 19962 - 16/08/2007 - Inicio
                   // Augusto 24/06/2004
                   //edAnoMesIni.Text := Copy(DateToStr(date), 7,4)+'/'+Copy(DateToStr(date),4,2); //'2003/09';
                   //edAnoMesFim.Text := Copy(DateToStr(date), 7,4)+'/'+Copy(DateToStr(date),4,2);
                   edAnoMesIni.Text := Copy(FormatDateTime('dd/mm/yyyy', date), 7,4) + '/' + Copy(FormatDateTime('dd/mm/yyyy', date),4,2);
                   edAnoMesFim.Text := Copy(FormatDateTime('dd/mm/yyyy', date), 7,4) + '/' + Copy(FormatDateTime('dd/mm/yyyy', date),4,2);
                   // ClaudioR - 19962 - 16/08/2007 - Fim
                   edAnoMesIniAcerto.Text := edAnoMesIni.Text;
                   edAnoMesFimAcerto.Text := edAnoMesFim.Text;
                 end;
              end
           end;
       3 : begin
              if cOperacao = 'R'
              then begin
                 if rbtnIndividual.Checked
                 then pgctrlEtapa.ActivePage    := tbsEtapa2
                 else begin
                    pgctrlEtapa.ActivePage    := tbsEtapa1;
                    TwCons.Etapa.Retornar;
                    pnlSubTitulo.Caption        := TwCons.Etapa.Caption[TwCons.Etapa.Pos-1];
                 end;
              end
              else begin
                 if not ValidaCampos(3) then Exit;
                 if rbtnIndividual.Checked
                 then begin
                    if chkTipoIndivCadastral.Checked or
                       chkTipoIndivFuncional.Checked  or
                       chkTipoIndivOpcaoContrib.Checked or
                       chkTipoIndivTipoBeneficio.Checked or
                       chkTipoIndivRevisaoBeneficio.Checked
                    then begin
                       pgctrlEtapa.ActivePage       := tbsEtapa4;
                       tbsEtapa4Indiv1.TabVisible := False;
                       tbsEtapa4Indiv2.TabVisible := False;
                       tbsEtapa4Indiv3.TabVisible := False;
                       tbsEtapa4Indiv4.TabVisible := False;
                       tbsEtapa4Indiv5.TabVisible := False;

                       // Deixar visiveis os tabsheets referentes as opcoes marcadas na etapa 2
                       if chkTipoIndivCadastral.Checked            then tbsEtapa4Indiv1.TabVisible := True;
                       if chkTipoIndivFuncional.Checked            then tbsEtapa4Indiv2.TabVisible := True;
                       if chkTipoIndivOpcaoContrib.Checked         then tbsEtapa4Indiv3.TabVisible := True;
                       if chkTipoIndivTipoBeneficio.Checked        then tbsEtapa4Indiv4.TabVisible := True;
                       if chkTipoIndivRevisaoBeneficio.Checked     then tbsEtapa4Indiv5.TabVisible := True;


                       // Colocar como ativa a primeira pagina que tiver visivel
                            if tbsEtapa4Indiv1.TabVisible          then pgctrlEtapa4.ActivePage := tbsEtapa4Indiv1
                       else if tbsEtapa4Indiv2.TabVisible          then pgctrlEtapa4.ActivePage := tbsEtapa4Indiv2
                       else if tbsEtapa4Indiv3.TabVisible          then pgctrlEtapa4.ActivePage := tbsEtapa4Indiv3
                       else if tbsEtapa4Indiv4.TabVisible          then pgctrlEtapa4.ActivePage := tbsEtapa4Indiv4
                       else if tbsEtapa4Indiv5.TabVisible          then pgctrlEtapa4.ActivePage := tbsEtapa4Indiv5;

                       // Abrir querys

                       { Inicio Augusto 30/01/2005 - Consulta para Titular e Pensionista }
                       If iIdTitular = iIdPessoa Then Begin
                         AbreConsultaContribuicao('T');   { TITULAR }
                         qryOpcaoContribuicao.ParamByName('IDPESSOA').AsInteger := iIdTitular;
                       End Else Begin
                         AbreConsultaContribuicao('P');   { PENSIONISTA }
                         qryOpcaoContribuicao.ParamByName('IDTITULAR').AsInteger   := iIdTitular;
                         qryOpcaoContribuicao.ParamByName('IDPESSOA').AsInteger    := iIdPessoa;
                         qryOpcaoContribuicao.ParamByName('IDBENEFICIO').AsInteger := iIdBeneficio;

                       End;
                       qryOpcaoContribuicao.ParamByName('IDPESSJUR').AsInteger   := iIdPessJur;
                       qryOpcaoContribuicao.ParamByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
                       qryOpcaoContribuicao.ParamByName('SEQPROPOSTA').AsInteger := 1;
                       qryOpcaoContribuicao.ParamByName('ANOMESINI').AsString    := edAnoMesIni.Text;
                       qryOpcaoContribuicao.ParamByName('ANOMESFIM').AsString    := edAnoMesFIM.Text;
                       qryOpcaoContribuicao.Open;
                       { Fim Augusto 30/05/2005 }

                       qryDadosBeneficio.Close;
                       qryDadosBeneficio.ParamByName('IDPESSJUR').AsInteger         := iIdPessJur;
                       qryDadosBeneficio.ParamByName('IDPLANOPREV').AsInteger       := iIdPlanoPrev;
                       qryDadosBeneficio.ParamByName('IDTITULAR').AsInteger         := iIdTitular;
                       qryDadosBeneficio.ParamByName('IDPESSOA').AsInteger          := iIdPessoa;
                       qryDadosBeneficio.ParamByName('SEQPROPOSTA').AsInteger       := 1;
                       { Augusto 28/01/2004 }
                       //qryDadosBeneficio.ParamByName('ANOMESINI').AsString          := edAnoMesIni.Text;
                       { Augusto 04/05/2004 }
                       //qryDadosBeneficio.ParamByName('ANOMESFIM').AsString          := edAnoMesFIM.Text;
                       qryDadosBeneficio.Open;
                       { Inicio Augusto 07/07/2004 - Transferido para cá }
                       if rbRecalcBenef.Checked then begin
                          // Verifica se processo contém benefício retido
                          //If BeneficioRetido Then Begin
                          //  MsgDlg('Este participante contém um benefício RETIDO'+#13+
                          //         'e não poderá ser revisado nesta condição','Atenção ',mtWarning,[mbOk],0);
                          //  iNumeroProcesso := 0;
                          //  Exit;
                          //End;

                          SelecionaProcesso(iNumeroProcesso,iIdTitular, iIdPessoa);
                          With qrySituacao Do Begin
                            Close;
                            Params[0].AsInteger := iIdTitular;
                            Open;
                          End;
                          { Augusto 17/08/2004 }
                          qryListaBeneficio.Close;
                          qryListaBeneficio.ParambyName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
                          qryListaBeneficio.Open;

                          qryBeneficiosTrocar.Close;
                          qryBeneficiosTrocar.ParamByName('IDPESSJUR').AsInteger      := iIdPessJur;
                          qryBeneficiosTrocar.ParamByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
                          qryBeneficiosTrocar.ParamByName('IDTITULAR').AsInteger      := iIdTitular;
                          qryBeneficiosTrocar.ParamByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
                          qryBeneficiosTrocar.Open;
                       end;
                       { Fim Augusto 07/07/2004 - Transferido para cá }

                       MontaDadosBeneficioAnterior;

                    end
                    else begin
                       TwCons.Etapa.Avancar;
                       pnlSubTitulo.Caption         := TwCons.Etapa.Caption[TwCons.Etapa.Pos-1];
                       pgctrlEtapa.ActivePage       := tbsEtapa5;
                    end;
                 end
                 else begin // Em Lote
                   TwCons.Etapa.Avancar;
                   pnlSubTitulo.Caption         := TwCons.Etapa.Caption[TwCons.Etapa.Pos-1];
                   pgctrlEtapa.ActivePage       := tbsEtapa5;

                   { Augusto 03/02/2006 }
                   bJaSaiuConvenio     := False;
                   PnlPagaINSS.Visible := True;
                   
                 end;
              end;
              CkbxGravaDemo.Checked := Not (rbtnIndividual.Checked = True);
           end;
       4 : begin
              { Augusto 03/02/2006 }
              PnlPagaINSS.Visible := False;

              if cOperacao = 'R'
              then pgctrlEtapa.ActivePage       := tbsEtapa3
              else begin
                 if not ValidaCampos(4) then Exit;
                 pgctrlEtapa.ActivePage       := tbsEtapa5;

                 dblkpFormaAtivos.Text     := 'Folha';
                 dblkpFormaMantidos.Text   := 'Banco';
                 dblkpALTAtivos.Text       := 'Não';
                 dblkpALTMantidos.Text     := 'Não';
                 DbLkcIncluiAlterador.Text := 'Sim';

                 { Bruno Bastos - Pend. 18811 - 15/03/2005
                   Foi colocado este if para entrar nesse código, somente quando
                   for revisão de benefícios                }
                 If rbRevisaoContribuicao.Checked = False Then
                 Begin

                   { Inicio Augusto 04/08/2004 }

                   { Guarda lista de beneficio utilizados }
                   sBeneficios := '';
                   qryDadosBeneficio.First;
                   while not qryDadosBeneficio.Eof do begin
                      if qryDadosBeneficio.FieldbyName('PROCESSA').AsInteger = 1 then begin

                        if Trim(sBeneficios) = '' then
                          sBeneficios := qryDadosBeneficio.FieldbyName('IDBENEFICIO').AsString
                        else
                          sBeneficios := sBeneficios +','+ qryDadosBeneficio.FieldbyName('IDBENEFICIO').AsString;

                        { Augusto 03/02/2006 - Caso possua INSS pago, verifica se saiu }
                        { do convênio alguma vez.                                      }
                        If (qryDadosBeneficio.FieldbyName('FLGREFERENCIA').AsInteger = 1) And
                           (qryDadosBeneficio.FieldbyName('PLANOPAGAINSS').AsInteger = 1)
                        Then Begin

                          If JaSaiuConvenio( QryDadosBeneficio ) Then Begin
                            bJaSaiuConvenio     := True;
                            PnlPagaINSS.Visible := True;
                          End;

                        End;

                      end;
                      qryDadosBeneficio.Next;
                   end;

                   { Busca possiveis alteradores }
                   QryAlteradorCorrecao.Close;
                   QryAlteradorCorrecao.SQL.Clear;
                   QryAlteradorCorrecao.SQL.Add('SELECT DISTINCT '+
                                                '  T.CODALTERADOR, T.DESCRICAO '+
                                                'FROM   '+
                                                '  TIPOALTERADOR T, ALTERADORXBENEF AT '+
                                                'WHERE '+
                                                '  (T.RECPAG = ''P'')  AND '+
                                                '  (T.ACRESDECRES = ''C'') AND '+
                                                '  (T.CODALTERADOR = AT.CODALTERADOR) AND '+
                                                '  (AT.IDBENEFICIO IN ('+sBeneficios+')) AND '+
                                                '  (AT.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+') '+
                                                'ORDER BY '+
                                                '  T.DESCRICAO ');
                   QryAlteradorCorrecao.Open;
                   { Fim Augusto 04/08/2004 }
                 End Else Begin
                   { Guarda lista de beneficio utilizados }
                   sContribuicoes := '';
                   qryOpcaoContribuicao.First;
                   while not qryOpcaoContribuicao.Eof do begin
                      if qryOpcaoContribuicao.FieldbyName('PROCESSA').AsInteger = 1 then begin
                        if Trim(sContribuicoes) = '' then
                          sContribuicoes := qryOpcaoContribuicao.FieldbyName('IDCONTRIBUICAO').AsString
                        else
                          sContribuicoes := sContribuicoes +','+ qryOpcaoContribuicao.FieldbyName('IDCONTRIBUICAO').AsString;
                      end;
                      qryOpcaoContribuicao.Next;
                   end;

                   If ( Not rbRevisaoContribuicao.Checked ) Then PnlPagaINSS.Visible := True; { Augusto 03/02/2006 }

                 End;
              end;
              CkbxGravaDemo.Checked := Not (rbtnIndividual.Checked = True);
           end;
       5 : begin
              if cOperacao = 'R'
              then begin
                if rbtnIndividual.Checked and
                   (chkTipoIndivCadastral.Checked     or
                    chkTipoIndivFuncional.Checked     or
                    chkTipoIndivOpcaoContrib.Checked  or
                    chkTipoIndivTipoBeneficio.Checked or
                    chkTipoIndivRevisaoBeneficio.Checked)
                then pgctrlEtapa.ActivePage       := tbsEtapa4
                else begin
                   pgctrlEtapa.ActivePage       := tbsEtapa3;
                   TwCons.Etapa.Retornar;
                   pnlSubTitulo.Caption        := TwCons.Etapa.Caption[TwCons.Etapa.Pos-1];
                end
              end
              else begin

                 { Inicio Augusto 28/09/2006 - Verificar Recebimento de contribuições }
                 If ( Not rbtnIndividual.Checked ) Then Begin

                   If ( Not VerificaFechamento( QryPatro.FieldByName('IDPESSOA').AsInteger,
                                                cteIdModuloAdmPREV,
                                                SAnoMesAnterior( QryLote.FieldByName('MESREFERENCIA').AsString ), { Augusto 17/11/2006 }
                                                'R', cTipoEnvio ) )
                   Then Begin
                     MsgDlg('As contribuições de MESCOBRANCA descontadas na folha de beneficios ainda nao foram recebidas. '+#13+
                            'Fazer recebimento antes de processar a revisao ',
                            'Erro',mtInformation,[mbOk],0);
                     Exit;
                   End;

                 End;
                 { Fim Augusto 28/09/2006                                             }

                 if not ValidaCampos(5) then Exit;
                 if not dtmBaseDados.dbBaseDados.InTransaction
                 then dtmBaseDados.dbBaseDados.StartTransaction;

                 //leofuncef - 01122004
               if  rbtnIndividual.Checked then
                 sArq := 'C:\AdmPREV_Retroativo_'+MontaSelect.ValoresChave[15]+'.txt'
                 else sArq := 'C:\AdmPREV_Retroativo.TXT';

                 If CkbxGravaDemo.Checked Then Begin { Agusto 21/12/2004 }
                   try
                     CloseFile(F);
                   except
                     //ShowMessage(' Erro ao fechar arquivo texto!');
                   end;
                   AssignFile(F, sArq);
                   try
                     CloseFile(F);
                   except
                     //ShowMessage(' Erro ao fechar arquivo texto!');
                   end;
                   Rewrite(F);
                 End;

                 mmResult.Lines.Clear;
                 mmResult.Lines.Add('Início do Processamento : '+DateTimeToStr(now));
                 GravaLinhaTXT('Início do Processamento : '+DateTimeToStr(now));

                 if rbRecalcBenef.Checked
                 then begin
                    mmResult.Lines.Add('Revisão de Benefícios - Lote : '+qryLote.FieldByName('IDLOTE').AsString+' - Motivo : '+dblkpcmbMotivo.Text);
                    GravaLinhaTXT('Revisão de Benefícios - Lote : '+qryLote.FieldByName('IDLOTE').AsString+' - Motivo : '+dblkpcmbMotivo.Text);
                 end
                 else begin
                    mmResult.Lines.Add('Revisão de Salários e Contribuições - Lote : '+qryLote.FieldByName('IDLOTE').AsString+' - Motivo : '+dblkpcmbMotivo.Text);
                    GravaLinhaTXT('Revisão de Salários e Contribuições - Lote : '+qryLote.FieldByName('IDLOTE').AsString+' - Motivo : '+dblkpcmbMotivo.Text);
                 end;

                 PreparaRetroativo;

                 // CAMILLE - 28.10.2004
                 // Se não for dar a opcao de parcelamento na proxima etapa, o procedimento já pode ser considerado como
                 // terminado nesse momento
                 if not ( (rbtnIndividual.Checked) and (rbRecalcBenef.Checked)  and (not bContinuaEtapa6) ) and (not bParcelamento)
                 then begin
                    mmResult.Lines.Add(' ');
                    mmResult.Lines.Add('Término do Processamento : '+DateTimeToStr(now));
                    mmResult.Lines.Add(' ');


                    If CkbxGravaDemo.Checked Then Begin  { Augusto 21/12/2004 }
                      mmResult.Lines.Add('Observação : ');
                      mmResult.Lines.Add('   O resultado total do processamento está gravado no arquivo C:\AdmPREV_Retroativo.TXT');

                      GravaLinhaTXT(' ');
                      GravaLinhaTXT('Término do Processamento : '+DateTimeToStr(now));
                      GravaLinhaTXT(' ');
                      GravaLinhaTXT('Observação : ');
                      GravaLinhaTXT('   O resultado total do processamento está gravado no arquivo C:\AdmPREV_Retroativo.TXT');
                    End;
                 end;


                 pgctrlEtapa.ActivePage       := tbsEtapa6;
                 bbtnImprimir.Visible         := True;


              end
           end;
       6 : begin
              if cOperacao = 'R'
              then pgctrlEtapa.ActivePage       := tbsEtapa5
              else begin
                if (rbtnIndividual.Checked) and
                   (rbRecalcBenef.Checked)  and
                   (not bContinuaEtapa6)
                then begin
                   { Inicio Augusto 16/05/2006 - Exibir mensagem de erro caso ocorra }
                   If Not EfetuaParcelamento Then Begin
                     dtmBaseDados.dbBaseDados.RollBack;
                     MsgDlg('Erro ao fazer parcelamento.','Erro',mtInformation,[mbOk],0);
                     Exit;
                   End;
                   { Fim Augusto 16/05/2006                                          }
                end;

                // CAMILLE - 28.10.2004
                if not bParcelamento
                then begin
                  try
                     {mmResult.Lines.Add(' ');
                     mmResult.Lines.Add('Término do Processamento : '+DateTimeToStr(now));
                     mmResult.Lines.Add(' ');
                     mmResult.Lines.Add('Observação : ');
                     mmResult.Lines.Add('   O resultado total do processamento está gravado no arquivo C:\AdmPREV_Retroativo.TXT');


                     GravaLinhaTXT(' ');
                     GravaLinhaTXT('Término do Processamento : '+DateTimeToStr(now));
                     GravaLinhaTXT(' ');
                     GravaLinhaTXT('Observação : ');
                     GravaLinhaTXT('   O resultado total do processamento está gravado no arquivo C:\AdmPREV_Retroativo.TXT');
                     }
                     try
                        CloseFile(F);
                     except
                     end;

                     frmAguarde.Apaga;

                     if MsgDlg('Deseja GRAVAR as alterações efetuadas pela Revisão ? '+#13+
                               'ATENÇÃO : Algumas alterações desta operação não poderão ser desfeitas.' ,'Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrYes
                     then begin
                        if dtmBaseDados.dbBaseDados.InTransaction
                        then dtmBaseDados.dbBaseDados.Commit;
                        if not rbtnIndividual.Checked
                        then begin
                           MsgDlg('Revisão Efetivada. ','Informação',mtInformation,[mbOK],0);
                        end
                        else begin
                           if MsgDlg('Revisão Efetivada. Deseja começar uma nova revisão ? ','Informação',mtInformation,[mbYes, mbNo],0) = mrYes
                           then begin
                              TwCons.Etapa.Pos          := 1;
                              //pnlTitulo.Caption       := 'Cálculo Retroativo Individual - Matrícula : <a escolher> - Data : '+DateToStr(date);                      // ClaudioR - 19962 - 16/08/2007
                              pnlTitulo.Caption         := 'Cálculo Retroativo Individual - Matrícula : <a escolher> - Data : ' + FormatDateTime('dd/mm/yyyy', date); // ClaudioR - 19962 - 16/08/2007
                              pnlSubTitulo.Caption      := TwCons.Etapa.Caption[TwCons.Etapa.Pos-1];
                              pgctrlEtapa.ActivePage    := tbsEtapa1;
                              rbtnIndividual.Checked    := True;
                              pgctrlEtapa1.ActivePage   := tbsEtapa1Indiv;
                              tbsEtapa1Indiv.TabVisible := True;
                              tbsEtapa1Lote.TabVisible  := False;
                              grpEtapa3FiltraContrib.Visible   := False;
                              grpEtapa3FiltraBenef.Visible     := False;

                              LimpaDadosPESSOA;
                              Exit; // Sair com Result = False para o BtnProximoClick não dar um avancar no TwCons.Etapa
                           end;
                        end
                     end
                     else begin
                        if dtmBaseDados.dbBaseDados.InTransaction
                        then dtmBaseDados.dbBaseDados.RollBack;
                        MsgDlg('Revisão Cancelada.','Informação',mtInformation,[mbOk],0);
                        Exit;
                     end
                   except
                        dtmBaseDados.dbBaseDados.RollBack;
                        MsgDlg('Erro ao efetivar Revisão.','Erro',mtInformation,[mbOk],0);
                        Exit;
                   end;
                end; // if not bParcelamento
                bbtnImprimir.Visible         := True;
              end;
           end; // case 6
  end;

  frmAguarde.Apaga;

  Result := True;
end;


procedure TfrmRetroativoPREV.FormShow(Sender: TObject);
begin
  inherited;
  TwCons.Etapa.Pos          := 1;
  //pnlTitulo.Caption         := 'Cálculo Retroativo Individual - Matrícula : <a escolher> - Data : '+DateToStr(date);                    // ClaudioR - 19962 - 16/08/2007 
  pnlTitulo.Caption         := 'Cálculo Retroativo Individual - Matrícula : <a escolher> - Data : ' + FormatDateTime('dd/mm/yyyy', date); // ClaudioR - 19962 - 16/08/2007
  pnlSubTitulo.Caption      := TwCons.Etapa.Caption[TwCons.Etapa.Pos-1];
  tbsEtapa1.TabVisible      := False;
  tbsEtapa2.TabVisible      := False;
  tbsEtapa3.TabVisible      := False;
  tbsEtapa4.TabVisible      := False;
  tbsEtapa5.TabVisible      := False;
  tbsEtapa6.TabVisible      := False;
  bbtnImprimir.Visible      := False;

  tbsEtapa5OLD.tabvisible  := false;
  pgctrlEtapa.ActivePage    := tbsEtapa1;
  rbtnIndividual.Checked    := True;
  pgctrlEtapa1.ActivePage   := tbsEtapa1Indiv;
  tbsEtapa1Indiv.TabVisible := True;
  tbsEtapa1Lote.TabVisible  := False;
  grpEtapa3FiltraContrib.Visible   := False;
  grpEtapa3FiltraBenef.Visible     := False;
  grpListaPessoas.Visible          := False; // CAMILLE - 15.12.2003

  qryDependencia.Close;
  qryDependencia.Open;

  qryVinculaFunc.Close;
  qryVinculaFunc.Open;

  qrySitPart.Close; // Gleyber - 25/07/2006 - Pendência 22731
  qrySitPart.Open;  // Gleyber - 25/07/2006 - Pendência 22731

  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 23.06.2003
end;

procedure TfrmRetroativoPREV.BtnProximoClick(Sender: TObject);
begin
  inherited;
  cOperacao := 'A';

  //leofuncef - 31082004
  //caso esteja marcado para proceder a correção, o alterador deve estar selecionado
  if (trim(dblkpcmbIndiceReaj.text) + trim(dblkpcmbRegraParcela.text ) <> '') and
     (pgctrlEtapa.activepage = tbsEtapa5)  and
     (trim(DbLkcAlterador.text) = '') then
  begin
     MsgDlg('Como a aplicação de correção foi marcada, o alterador de correção deve ser selecionado.','Informação',mtInformation,[mbOk],0);

     DbLkcAlterador.setfocus;
     exit;
  end;
  //leofuncef - 31082004

  if not AvancaPageControl   then Exit;
  TwCons.Etapa.Avancar;
  pnlSubTitulo.Caption       := TwCons.Etapa.Caption[TwCons.Etapa.Pos-1];
end;

procedure TfrmRetroativoPREV.BtnAnteriorClick(Sender: TObject);
begin
  inherited;
  cOperacao := 'R';
  if not AvancaPageControl then Exit;
  TwCons.Etapa.Retornar;
  pnlSubTitulo.Caption       := TwCons.Etapa.Caption[TwCons.Etapa.Pos-1];

  // caso usuário click no btanterior deve-se dar rollback na transação,
  // pois, ao avançar da etapa 2 para 3 é feito algumas operações Insert ou UpDate

  // Gleyber - 14/08/2006 - Pendência 22838 - Início
  If (pgctrlEtapa.ActivePage = tbsEtapa2) Or (pgctrlEtapa.ActivePage = tbsEtapa5)
   Then Begin
     If dtmBaseDados.dbBaseDados.InTransaction
      Then dtmBaseDados.dbBaseDados.Rollback;
   End;
  // Gleyber - 14/08/2006 - Pendência 22838 - Fim
end;

procedure TfrmRetroativoPREV.BtnCancelaClick(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.RollBack;
  TwCons.Etapa.Pos := 0;
end;

procedure TfrmRetroativoPREV.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if MontaSelect.RetornouValor
  then begin
    iIdTitular      := StrToInt(MontaSelect.ValoresChave[0]);
    if Trim(MontaSelect.ValoresChave[21]) = ''
    then iIdPessoa       := StrToInt(MontaSelect.ValoresChave[0])
    else iIdPessoa       := StrToInt(MontaSelect.ValoresChave[21]);

    iSeqProposta    := StrToInt(MontaSelect.ValoresChave[2]);
    iIdPessJur      := StrToInt(MontaSelect.ValoresChave[3]);
    iIdPlanoPrev    := StrToInt(MontaSelect.ValoresChave[4]);
    lblNumProc.Caption       := MontaSelect.ValoresChave[23];
    lblParticipante.Caption  := MontaSelect.ValoresChave[5];
    lblBeneficiario.Caption  := MontaSelect.ValoresChave[22];
    sNomeParticipante        := MontaSelect.ValoresChave[5];
    sNomeBeneficio           := MontaSelect.ValoresChave[6];
    iIdBeneficio             := StrToInt(ClienteNumero(MontaSelect.ValoresChave[19]));
    sIdSitPart               := MontaSelect.ValoresChave[7];
    sIdSitFunc               := MontaSelect.ValoresChave[8];
    sIdSitPlanoPrev          := MontaSelect.ValoresChave[9];
    sFlgPossuiAcompINSS      := MontaSelect.ValoresChave[10];
    lblDIB.Caption           := MontaSelect.ValoresChave[11];
    sDataIncioFund           := MontaSelect.ValoresChave[11];
    lblPatro.Caption         := MontaSelect.ValoresChave[12];
    sNomePatro               := MontaSelect.ValoresChave[12];
    lblBeneficio.Caption     := MontaSelect.ValoresChave[6];
    lblPlano.Caption         := MontaSelect.ValoresChave[13];
    sNomePlano               := MontaSelect.ValoresChave[13];
    sDataEvento              := MontaSelect.ValoresChave[14];
    //edDtInicio.Text          := '01/'+Copy(MontaSelect.ValoresChave[11],4,7);
    iNumeroProcesso          := StrToInt(ClienteNumero(MontaSelect.ValoresChave[23]));
    //pnlTitulo.Caption := 'Cálculo Retroativo Individual - Matrícula : '+MontaSelect.ValoresChave[15]+' - Data : '+DateToStr(date);                    // ClaudioR - 19962 - 16/08/2007
    pnlTitulo.Caption := 'Cálculo Retroativo Individual - Matrícula : '+MontaSelect.ValoresChave[15]+' - Data : ' + FormatDateTime('dd/mm/yyyy', date); // ClaudioR - 19962 - 16/08/2007

    lblMatricula.Caption     := MontaSelect.ValoresChave[15];

         if MontaSelect.ValoresChave[24] = 'AT' then lblSituacaoAtual.Caption := 'Ativo'
    else if MontaSelect.ValoresChave[24] = 'MA' then lblSituacaoAtual.Caption := 'Mantido'
    else if MontaSelect.ValoresChave[24] = 'MP' then lblSituacaoAtual.Caption := 'Mantido Parcial'
    else if MontaSelect.ValoresChave[24] = 'AS' then lblSituacaoAtual.Caption := 'Assistido'
    else if MontaSelect.ValoresChave[24] = 'MS' then lblSituacaoAtual.Caption := 'Manutenção de Saldo de Conta'
    else if MontaSelect.ValoresChave[24] = 'CA' then lblSituacaoAtual.Caption := 'Cancelado'
    else if MontaSelect.ValoresChave[24] = 'AE' then lblSituacaoAtual.Caption := 'Ativo Especial'
    else if MontaSelect.ValoresChave[24] = 'PN' then lblSituacaoAtual.Caption := 'Pendente';

    iIdPlanoOrigem := StrToInt(MontaSelect.ValoresChave[25]); { Augusto 25/05/2004 }

    PreencheDadosPESSOA;

    (* Augusto 07/07/2004 - Retirado daqui, não tem oprque estar aqui
    if rbRecalcBenef.Checked
    then begin
       // Verifica se processo contém benefício retido
       If BeneficioRetido Then
       Begin
         MsgDlg('Este participante contém um benefício RETIDO'+#13+
                'e não poderá ser revisado nesta condição','Atenção ',mtWarning,[mbOk],0);
         iNumeroProcesso := 0;
         Exit;
       End;

       SelecionaProcesso(iNumeroProcesso,iIdTitular, iIdPessoa);
       With qrySituacao Do
       Begin
         Close;
         Params[0].AsInteger := iIdTitular;
         Open;
       End;
       qryListaBeneficio.Close;
       qryListaBeneficio.Open;
       qryBeneficiosTrocar.Close;
       qryBeneficiosTrocar.ParamByName('IDPESSJUR').AsInteger      := iIdPessJur;
       qryBeneficiosTrocar.ParamByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
       qryBeneficiosTrocar.ParamByName('IDTITULAR').AsInteger      := iIdTitular;
       qryBeneficiosTrocar.ParamByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
       qryBeneficiosTrocar.Open;
    end
    *)
  end
  else begin
    iIdTitular := -1;
    lblParticipante.Caption := '';
  end;

end;

procedure TfrmRetroativoPREV.FormCreate(Sender: TObject);
begin
  inherited;
  //Bruno Bastos - Help - Início
  If prmMenuChamadorRetroativo = 'C' Then
    HelpContext := 160066
  else
    HelpContext := 160098;
  //Bruno Bastos - Help - Fim

  { Inicio Augusto 11/07/2006 - Mostrar apenas as opções referentes ao Menu que chama }
  chkTipoIndivTipoBeneficio.Visible     := True;
  chkTipoIndivRevisaoBeneficio.Visible  := True;
  Image14.Visible                       := True;  // Gleyber - 25/07/2006 - Pendência 22731
  Image16.Visible                       := True;  // Gleyber - 25/07/2006 - Pendência 22731

  If prmMenuChamadorRetroativo = 'C' Then Begin

    chkTipoIndivTipoBeneficio.Visible    := False;
    chkTipoIndivRevisaoBeneficio.Visible := False;
    Image14.Visible                      := False;  // Gleyber - 25/07/2006 - Pendência 22731
    Image16.Visible                      := False;  // Gleyber - 25/07/2006 - Pendência 22731
    grpParamAcertoFolhaBen.Visible       := False;  // Gleyber - 14/08/2006 - Pendência 22838

    // Gleyber - 14/08/2006 - Pendência 22838 - Início
    If chkTipoIndivCadastral.Visible        Then chkTipoIndivCadastral.Checked        := True;
    If chkTipoIndivFuncional.Visible        Then chkTipoIndivFuncional.Checked        := True;
    If chkTipoIndivOpcaoContrib.Visible     Then chkTipoIndivOpcaoContrib.Checked     := True;
    If chkTipoIndivTipoBeneficio.Visible    Then chkTipoIndivTipoBeneficio.Checked    := True;
    If chkTipoIndivRevisaoBeneficio.Visible Then chkTipoIndivRevisaoBeneficio.Checked := True;
    // Gleyber - 14/08/2006 - Pendência 22838 - Fim

  End Else Begin

    Image11.Visible        := False;
    Image12.Visible        := False;
    Image13.Visible        := False;

    chkTipoIndivCadastral.Visible        := False;
    chkTipoIndivFuncional.Visible        := False;
    chkTipoIndivOpcaoContrib.Visible     := False;

    chkTipoIndivCadastral.Checked        := False;
    chkTipoIndivFuncional.Checked        := False;
    chkTipoIndivOpcaoContrib.Checked     := False;

    chkTipoIndivTipoBeneficio.Visible    := True;
    chkTipoIndivRevisaoBeneficio.Visible := True;

    chkTipoIndivTipoBeneficio.Checked    := False;
    chkTipoIndivRevisaoBeneficio.Checked := True;

  End;
  { Fim Augusto 11/07/2006                                                            }

  iIdTitular := -1;
  sSQLBenefAssoc := '';
  qryMotivo.Open;
  qryIndiceReaj.Open;
  qryRegraParcela.Open;

  { Auugsto 04/08/2004 }
  QryAlteradorCorrecao.Close;
  //QryAlteradorCorrecao.ParamByName('recpag').AsString := 'P';
  QryAlteradorCorrecao.Open;



  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; // CAMILLE - 25.06.2003
  qryPatro.Open;

  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; // CAMILLE - 25.06.2003
  qryPlano.Open;

  { Inicio Augusto 26/01/2005 - Retirado para ter parametro por plano escolhido }
  //qryContribuicao.Close;
  //qryContribuicao.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; // CAMILLE - 25.06.2003
  //qryContribuicao.Open;

  //qryBeneficioEscolher.Close;
  //qryBeneficioEscolher.ParamByName('IDFUNDACAO').AsInteger  := iIdFundacao; // CAMILLE - 25.06.2003
  //qryBeneficioEscolher.ParamByName('IDPLANOPREV').AsInteger := iIdPlanoprev; // CAMILLE - 25.06.2003
  //qryBeneficioEscolher.Open;
  { Fim Augusto 26/01/2005 }

  qryIncluiAlterador.Open;
  qryFormaAcerto.Open;
  qryFormaBanco.Open;
  qryLote.Open;

  { Augusto 17/08/2004 }
  qryListaBeneficio.Close;
  qryListaBeneficio.ParambyName('IDPLANOPREV').AsInteger := -1;
  qryListaBeneficio.Open;
  
  rbAtrasoClick(Self);

  dblkpFormaAtivos.Text     := 'Folha';
  dblkpFormaMantidos.Text   := 'Banco';
  dblkpALTAtivos.Text       := 'Não';
  dblkpALTMantidos.Text     := 'Não';
  DbLkcIncluiAlterador.Text := 'Sim';

  { Inicio Augusto 16/02/2006 }
  CtrlBenefBfciario := TCtrlBenefBfciario.Create;

  CtrlBenefBfciario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer,
                               True, Nil );
  { Fim Augusto 16/02/2006    }

end;

function TfrmRetroativoPrev.AtualizaCaption: Boolean;
begin
{  tbEtapa3Sub1.TabVisible := False;
  tbEtapa3Sub2.TabVisible := False;
  tbEtapa3Sub3.TabVisible := False;
  tbEtapa3Sub4.TabVisible := False;

  // Verifica ítem preenchido na etapa 1.
  If rbAltCadastral.Checked Then
    //
  Else If rbAltFuncional.Checked Then
    //
  Else If rbAltOpContrib.Checked Then
    //
  Else If rbAltTipoBenef.Checked Then
    //
  Else If rbAltBenefOrdJud.Checked Then
    //
  Else If rbRecalcBenef.Checked Then
  Begin
    pcEtapa3.ActivePage := tbEtapa3Sub1;
    tbEtapa3Sub1.TabVisible := True;
  End;
}  
end;


procedure TfrmRetroativoPREV.reValorInfINSSKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmRetroativoPREV.edDataFinalBenefCloseUp(Sender: TObject);
begin
  inherited;
  // verifica se data inicio é maior do que data final
{  If edDtInicio.date > edDtFim.Date Then
  Begin
    MsgDlg('A data inícial não pode ser maior do que a data final.','Atenção ',mtWarning,[mbOk],0);
    edDtInicio.SetFocus
  End;
}
end;

procedure TfrmRetroativoPREV.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
begin
  // Verificar se participante já fez opções
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM BENEFPLANOPART ' +
                 ' WHERE IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND ' +
                 '       IDPESSOA    = ' + IntToStr(iIdTitular)   + ' AND ' +
                 '       IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
                 '       SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND ' +
                 '       IDBENEFICIO = ' + qry.FieldByName('IDBENEFICIO').AsString);
  qryAux.Open;

  if qryAux.IsEmpty then
  begin
     rOpcao1 := 0;
     rOpcao2 := 0;
     rOpcao3 := 0;
  end else
  begin
     if qryAux.FieldByName('VALORBASE1').AsString <> ''
     then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
     else rOpcao1 := 0;

     if qryAux.FieldByName('VALORBASE2').AsString <> ''
     then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
     else rOpcao2 := 0;

     if qryAux.FieldByName('VALORBASE3').AsString <> ''
     then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
     else rOpcao3 := 0;
  end;

  bPodeAlterarOpcoes := False;

{  if not qryAux.IsEmpty then
  begin // Opcoes já cadastradas
     bOpcoesExistem := True;
     frmCadOpcoesBenef := TfrmCadOpcoesBenef.Create(Application);
     frmCadOpcoesBenef.LerOpcoes(MontaSelect.ValoresChave[5], sNomePlano, sNomePatro,
                                 sNomeBeneficio,
                                 qryBeneficio.FieldByName('NOMEVALORBASE1').AsString,
                                 qryBeneficio.FieldByName('NOMEVALORBASE2').AsString,
                                 qryBeneficio.FieldByName('NOMEVALORBASE3').AsString,
                                 qryBeneficio.FieldByName('NUMOPCOES').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3, bPodeAlterarOpcoes,
                                 qryBeneficio.FieldByName('FLGEDITAOP1').AsInteger,
                                 qryBeneficio.FieldByName('FLGEDITAOP2').AsInteger,
                                 qryBeneficio.FieldByName('FLGEDITAOP3').AsInteger,
                                 iIdPessJur,
                                 iIdPlanoPrev,
                                 iIdTitular,
                                 iSeqProposta,
                                 qryBeneficio.FieldbyName('IdBeneficio').AsInteger,
                                 iNumeroProcesso,
                                 Qry.fieldbyname('dtevento').asstring,
                                 edDataInicioBenef.Text,
                                 dtInicioINSS.Text,
                                 Qry.fieldbyname('datarequerimento').asstring,
                                 reValorInfINSS.Text,
                                 reValorCalcINSS.text,
                                 sValorBase1INSS, sValorBase2INSS, sValorBase3INSS,
                                 sFlgInterno,
                                 sFlgInterno,
                                 sIdSitPart,
                                 sIdSitPlanoPrev,
                                 sIdSitFunc,
                                 sIdSitPart,
                                 sIdSitPlanoPrev,
                                 sIdSitFunc );
     frmCadOpcoesBenef.Free;
  end;
}  
end;


procedure TfrmRetroativoPrev.SelecionaProcesso(piNumeroProcesso, piIdTitular,
                piIdPessoa: Integer);
Begin
  Qry.Close;
  Qry.ParamByName('NUMEROPROCESSO').AsInteger := piNumeroProcesso;
  Qry.ParamByName('IDTITULAR').AsInteger := piIdTitular;
  Qry.ParamByName('IDPESSOA').AsInteger := piIdPessoa;
  Qry.Open;

  /// VERIFICAR DEPOIS...*******************************
  if (piNumeroProcesso = -1) or
     (Qry.IsEmpty)
  then AbreQryBeneficio(True, iIdEvento, Qry.FieldByName('IdPlanoPrev').AsInteger)
  else AbreQryBeneficio(True, Qry.FieldByName('IdEventoGerador').AsInteger, Qry.FieldByName('IdPlanoPrev').AsInteger);

  if (not Qry.IsEmpty) and (not qryBeneficio.IsEmpty)
  then qryBeneficio.Locate('IdBeneficio',Qry.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive]);

  qryBenefAux.Close;
  qryBenefAux.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
  qryBenefAux.Open;

  iIdEvento := Qry.FieldByName('IdEventoGerador').AsInteger;

end; // SelecionaProcesso

procedure TfrmRetroativoPrev.AbreQryBeneficio(bConsideraGrupo: boolean;
  piIdEventoGerador, piIdPlanoPrev: Integer);
Begin
    qryBeneficio.Close;
    qryBeneficio.SQL.Clear;
    if bConsideraGrupo
    { Lise - 17/10/2001
      Retirada do MINUS da QryBeneficio e inserção no WHERE da condição
      ((1 = BG.FLGPRINCIPAL) OR (BG.FLGPRINCIPAL IS NULL )) para DB2 }
    then begin
       qryBeneficio.SQL.Add(
       ' SELECT  B.IDBENEFICIO, B.TIPOBENEFICIO,                                          '+
       '         DECODE(BG.IDBENEFICIO, NULL, B.NOME, ''Grupo ''||G.DESCRICAO) AS NOME ,  '+
       '         B.NOME AS NOMEBENEFICIO,                                                 '+
       '         DECODE(BG.IDGRUPOBENEF, NULL, -1, BG.IDGRUPOBENEF) AS IDGRUPOBENEF,      '+
       '         B.FLGDESTBENEF, B.IDEVENTOGERADOR,                                       '+
       '         B.FLGRESGATE, B.FLGBENEFOBRIGATO, B.NUMORDEMEVENTO,                      '+
       '         B.IDTPPAGTOBENEFIC, B.PRAZOPROVISORIO,               '+
       '         BP.IDREGRACALCULO,  BP.IDREGRASIMULA,                                    '+
       '         BP.IDREGRAPAGAMENTO, BP.IDREGRAELEGIBILI, BP.FLGACEITAOPCAO,             '+
       '         BP.NOMEVALORBASE1, BP.NOMEVALORBASE2, BP.NOMEVALORBASE3,                 '+
       '         BP.NUMOPCOES,BP.FLGEDITAOP1, BP.FLGEDITAOP2, BP.FLGEDITAOP3,             '+
       '         BP.IDREGRAINICIO, BP.IDREGRAFIM, BP.IDREGRACALCINSS, BP.IDBENEFREF,      '+
       '         BP.FLGQUITAPREVIDEN, BP.FLGQUITAEMPRESTI, BP.FLGQUITAASSISTEN,           '+
       '         BP.INDICEREAJBENEF, BP.FLGCALCTODOMES,                  '+
       '         BP.IDREGRAPRIMPAGTO, BP.IDREGRAULTPAGTO,            '+
       '         BP.CODPORTFORMA,    BP.FLGOBRIGANPROC, B.FLGUSADTPREVISAO,               '+
       '         BP.FLGREFERENCIA,  BP.FLGOBRIGAOP1, BP.FLGOBRIGAOP2, BP.FLGOBRIGAOP3,    '+
       '         BP.IDREGRABENEFMIN, BP.IDREGRASRB, BP.FLGBENEFINF                                        '+
       ' FROM   BENEFICIO B, BENEFPLANPREV BP, BENEFXGRUPO BG, GRUPOBENEF G                               '+
       ' WHERE  B.IDEVENTOGERADOR = ' +IntToStr(piIdEventoGerador)+
       ' AND    BP.IDPLANOPREV    = ' +IntToStr(piIdPlanoPrev)+
       ' AND    ((BP.FLGREFERENCIA = 0) OR ((BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) ) '+
       ' AND    BP.IDBENEFICIO   = B.IDBENEFICIO '+
       ' AND    BP.IDPLANOPREV   = BG.IDPLANOPREV(+) '+
       ' AND    BP.IDBENEFICIO   = BG.IDBENEFICIO(+) '+
       ' AND    BG.IDGRUPOBENEF  =  G.IDGRUPOBENEF(+) '+
       ' AND    ((1 = BG.FLGPRINCIPAL)  OR (BG.FLGPRINCIPAL IS NULL )) ');
    end
    else begin
       qryBeneficio.SQL.Add(
          ' SELECT B.IDBENEFICIO, B.TIPOBENEFICIO, B.NOME, B.NOME AS NOMEBENEFICIO,    '+
          '        -1 as IDGRUPOBENEF,                                                 '+
          '        B.FLGDESTBENEF, B.IDEVENTOGERADOR,                                  '+
          '        B.FLGRESGATE, B.FLGBENEFOBRIGATO, B.NUMORDEMEVENTO,                 '+
          '        B.IDTPPAGTOBENEFIC, B.PRAZOPROVISORIO,          '+
          '        BP.IDREGRACALCULO,  BP.IDREGRASIMULA,                               '+
          '        BP.IDREGRAPAGAMENTO, BP.IDREGRAELEGIBILI, BP.FLGACEITAOPCAO,        '+
          '        BP.NOMEVALORBASE1, BP.NOMEVALORBASE2, BP.NOMEVALORBASE3,            '+
          '        BP.NUMOPCOES,BP.FLGEDITAOP1, BP.FLGEDITAOP2, BP.FLGEDITAOP3,        '+
          '        BP.IDREGRAINICIO, BP.IDREGRAFIM, BP.IDREGRACALCINSS, BP.IDBENEFREF, '+
          '        BP.FLGQUITAPREVIDEN, BP.FLGQUITAEMPRESTI, BP.FLGQUITAASSISTEN,      '+
          '        BP.MESREAJBENEF, BP.INDICEREAJBENEF, BP.FLGCALCTODOMES,             '+
          '        BP.IDREGRAREAJBENEF, BP.IDREGRAPRIMPAGTO, BP.IDREGRAULTPAGTO,       '+
          '        BP.CODPORTFORMA, BP.FLGOBRIGAOP1, BP.FLGOBRIGAOP2, BP.FLGOBRIGAOP3, '+
          '        BP.FLGOBRIGANPROC, BP.FLGREFERENCIA,                                '+
          '        BP.IDREGRABENEFMIN, BP.IDREGRASRB, BP.FLGBENEFINF                                   '+
          ' FROM   BENEFICIO B, BENEFPLANPREV BP                                       '+
          ' WHERE  B.IDEVENTOGERADOR = '+IntToStr(piIdEventoGerador)+
          ' AND    BP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
          ' AND    ((BP.FLGREFERENCIA = 0) OR ((BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) ) '+
          ' AND    BP.IDBENEFICIO   = B.IDBENEFICIO                                    ');
    end;
    qryBeneficio.Open;
end; // AbreQryBeneficio

Function TfrmRetroativoPrev.ExibeDif: Boolean;
{ Motivo: Exibir diferenças num memo e prepara qry para grvação (Benefício/Contribuição)
 Início - Efetuar loop para informar novos cálculos;
 1 - Processar dados benefício
  1.1 - Pegar dados do histórico com mesmo período usado no loop;
  1.2 - Escrever no memo o valor vindo do banco;
  1.3 - Rodar a função e jogar o novo valor, ainda na mesma linha ;
  1.4 - Analisar diferença e marcar a linha, caso exista;
  1.5 - Executar UPDATE no valor do histórico;
 2 - Processar dados contribuição
}
    {-->}
    Function IncrementaAnoMes (pbAbono:Boolean; pPrimeiro: Boolean;
        Var sAno,sMes,sAnoMesRef:String): String;
    // result no formato YYYY/MM
    Begin
      // se for abono incrementa só sAnoMesRef com YYYY/13
      If pbAbono Then
      Begin
        sAnoMesRef := sAno+'/13';
        Result := sAnoMesRef;
        Exit;
      End;

      if pPrimeiro Then
      Begin // Primeira passagem. Apenas alimenta
//        sMes := Copy(edDtInicio.Text,4,2);
//        sAno := Copy(edDtInicio.Text,7,7);
        sMes := Copy(edAnoMesIni.Text,6,2);
        sAno := Copy(edAnoMesIni.TEXT,1,4);
      End Else
      Begin// Incrementa AnoMes
        if StrToInt(sMes) < 12 Then
        Begin
          sMes := IntToStr((StrToInt(sMes) + 1));
          If Length(sMes) = 1 Then sMes := '0' + sMes;
        End Else
        Begin // sMes = 12
          sMes := '01';
          sAno := IntToStr((StrToInt(sAno) + 1));
        End;
      End;
      // passado por referência
      sAnoMesRef := sAno+'/'+sMes;
      Result := sAno+'/'+sMes;
    End;
    {<--}

    {-->}
    Procedure Cabecalho;
    // Preenche dados básicos do participante e coloca título nas colunas.
    Begin
      mmResult.Lines.Clear;
{
         1         2         3         4         5         6         7         8
12345678901234567890123456789012345678901234567890123456789012345678901234567890
Diferença no valor dos benefícios
Ref.    Benefício                    Vlr. Pago  Vlr. Devido. Dif.
}
      mmResult.Lines.Add('                  Cálculo de Revisão para Benefício  ');
      mmResult.Lines.Add(#13+#10);
      // Dados Participante
      mmResult.Lines.Add('----------------------------------------------------------------------------');
      mmResult.Lines.Add('Participante..:'+sNomeParticipante);
      mmResult.Lines.Add('Matrícula.....:'+MontaSelect.ValoresChave[15]);
      mmResult.Lines.Add('Inscrição.....:'+MontaSelect.ValoresChave[16]);
      mmResult.Lines.Add('Plano.........:'+sNomePlano);
      mmResult.Lines.Add('Patrocinadora.:'+sNomePatro);
      mmResult.Lines.Add('Nº Processo...:'+MontaSelect.ValoresChave[23]);

      mmResult.Lines.Add('DIB...........:'+sDataIncioFund);
      mmResult.Lines.Add('Benefício.....:'+qry.FieldByName('NOME').AsString);
      mmResult.Lines.Add('Beneficiário..:'+qry.FieldByName('BENEFICIARIO').AsString+' - '+
        qry.FieldByName('DESCRICAO').AsString);

      mmResult.Lines.Add('----------------------------------------------------------------------------');

      // Título
      mmResult.Lines.Add(' ');
      mmResult.Lines.Add('Ref.    Benefício               Vlr.Pago   Vlr.Devido    Vlr.Dif.   Vlr.Alt.');
      mmResult.Lines.Add('----------------------------------------------------------------------------');

    End;
    {<--}
Var
   sAnoMesRef,         // sAnoMesRef := sAno / sMes (Apenas para clareza/facilidade do código)
   sAno,
   sMes,
   sAnoMesFinal,
   sLinha,
   sMsgErro,
   sUltMesReajuste,
   sValorDiferenca  : String;

   bPrimeiro,
   bErro,
   bReajustou,
   bPossuiAbono,
   bPagaAbono,
   bAbonoCalculado,
   bMesCheio         : Boolean;

   dValorBeneficioIntegral,
   dValorBeneficioIntegralAposMinimo, // Não utilizado. Apenas pra preenche função.
   dValorPrevAntesMinimo,
   dNovoValor,
   dNovoValorTotal,
   dValorBeneficioNoMes,
//   dValorCorrigido,
   dValorTotalBeneficio,
   dValorBeneficioProRata,
//   rValorBeneficio,
   rValorCorrecao,
   rValorBenefTitular, // passado por referencia para a função VerificaSePagaAbonoBfciario.
   rValorAbono             : Double;

   // Armazena o benefício corrente para calcular o valor atual
   iNumBenef               : Integer;

   cTipoAbono       : Char;

   dValorBenefRateado, { Augusto 23/01/2003 }
   dValorSRB                   : double;
begin
{  Result := True;
  frmAguarde.Mostra('Aguarde...Lendo informações...'); frmAguarde.Repaint;
  iLoteSelecionado := -1;

  // coloca data final no formato adequado.
//  sAnoMesFinal := Copy(edDtFim.Text,7,7)+'/'+Copy(edDtFim.Text,4,2);

  // a primeira passagem apenas alimenta com a data inicio,
  // da segunda em diante incrementa a data
  bPrimeiro := True;

  // Monta cabeçalho com dados básicos do participante e colunas.
  // Augusto 08/04/2003 - Só mostra dados se não for em Lote
  If pgctrlEtapa1.ActivePage <> tbsEtapa1Lote Then Begin
     Cabecalho;
  End;

  qryVirtualBenef.Close;
  qryVirtualBenef.Open;
  qryVirtualContrib.Close;
  qryVirtualContrib.Open;

  dValorTotalBeneficio := -1;
  bPagaAbono := False;

  // Loop que varia da DATAINICIAL até DATAFINAL selecionada como período.
  Try
  While (IncrementaAnoMes(bPagaAbono, bPrimeiro,sAno,sMes, sAnoMesRef) <= sAnoMesFinal) do
  Begin
    frmAguarde.Mostra('Calculando: '+sAnoMesRef); frmAguarde.Repaint;
    bUsaAlterador := False;

    // Verifica se a faixa de datas do benefício está contida na faixa de datas
    // do processamento. Se não estiver incrementa a data e continua.
    If (sAnoMesRef < (Copy(edDataInicioBenef.Text,7,4)+Copy(edDataInicioBenef.Text,3,3))) Then
    Begin
      bPrimeiro := False;
      Continue;
    End;

    // INÍCIO - Verificar se paga abono Obs.:Crítica no final da UNIT
    If bPossuiAbono Then
    Begin
      If Trim(edDataFinalBenef.Text) = '' Then
        bPagaAbono :=  sMes = '12'
      Else If qry.FieldByName('FLGDATAPREVISTA').AsInteger = 1 Then
      Begin
        If (sMes < Copy(edDataFinalBenef.Text,4,2)) And
           (sMes = '12') Then
           bPagaAbono := True
        Else
          bPagaAbono :=  ((edDataFinalBenef.Text) >= ('31/12/'+sAno)) And (sMes = '12');
      End Else
      Begin
        If (sAno < Copy(edDataFinalBenef.Text,7,4)) And (sMes = '12') Then
          bPagaAbono := True
        Else
        Begin
          If (Copy(edDataFinalBenef.Text,7,4) < sAno) And (sMes = '12') Then
            bPagaAbono := True
          Else
          Begin
            If (cTipoAbono = 'B') And (sAnoMesRef = Copy(edDataFinalBenef.Text,7,4)+'/'+
              Copy(edDataFinalBenef.Text,4,2)) Then
              bPagaAbono := True
            Else bPagaAbono := sMes = '12';
          End;
        End;
      End;
    End;
    // FIM - Verificar se o benefício tem abono


    // INÍCIO - BUSCA Nº DE BENEFICIÁRIOS //////////////
    // Se o parametro do beneficio por plano (flgbenefinf) definir que
    //    o no. de beneficiarios elegiveis
    // Entao iNumBenef := qryBeneficiario.RecordCount, pois a qryBeneficiario
    //       está com os elegiveis
    // Senao, abrir uma query auxiliar com todos os beneficiarios do beneficios
    //       iNumBenef := numero total de beneficiarios

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BENEFBFCIARIO BF '+
                   ' WHERE  (BF.IDTITULAR   = '+IntToStr(iIdTitular)  +') '+
                   ' AND    (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)  +') '+
                   ' AND    (BF.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+') '+
                   ' AND    (BF.SEQPROPOSTA = '+IntToStr(iSeqProposta)+') '+
                   ' AND    (BF.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+')'+
                   ' AND    (BF.IDBENEFICIO = '+qryBeneficio.FieldByName('IdBeneficio').AsString+') ');
    qryAux.Open;
    iNumBenef := qryAux.RecordCount;
    if not qryBeneficio.Active then
      if (qryBeneficio.FieldByName('FLGBENEFINF').AsInteger = 0) and
         (qryBeneficio.FieldByName('IDBENEFICIO').AsString <> '') then
      begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BFCIARIOTITPLAN BF '+
                       ' WHERE  (BF.IDTITULAR   = '+IntToStr(iIdTitular)  +') '+
                       ' AND    (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)  +') '+
                       ' AND    (BF.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+') '+
                       ' AND    (BF.SEQPROPOSTA = '+IntToStr(iSeqProposta)+') '+
                       ' AND    (BF.IDBENEFICIO = '+qryBeneficio.FieldByName('IdBeneficio').AsString+') ');
        qryAux.Open;
        iNumBenef := qryAux.RecordCount;
      end;
    // FIM - BUSCA Nº DE BENEFICIÁRIOS //////////////

    qryAux.Close;
    qryAux.sql.Clear;
    qryAux.sql.Add(
      ' SELECT B.NOME, H.IDPESSOA, H.MESREFERENCIA, H.FLGENVIADO, '+
      ' BF.IDSITBENEFICIO,  BF.DATAFINAL, BFTP.PERCENTUAL, '+
      ' SUM(DECODE(FLGDEVOLUCAO,0,H.VALORPREV,-H.VALORPREV)) VALORPREV, DEP.NUMSEQUENCIA, '+
      ' DATA.DTEFETPGTO '+
      ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H, BENEFBFCIARIO BF, BFCIARIOTITPLAN BFTP, '+
      '	 DEPENTIT DEP, (SELECT MAX(DTEFETPGTO) DTEFETPGTO FROM HSTBENEFBFCIARIO '+
      '                 WHERE NUMEROPROCESSO = '+qry.FieldByName('NUMEROPROCESSO').AsString+') DATA'+
      ' WHERE  H.NUMEROPROCESSO   = '+qry.FieldByName('NUMEROPROCESSO').AsString+
      ' AND    H.MESREFERENCIA    = '''+sAnoMesRef+''''+
      ' AND    H.IDPESSOA         = '+qry.FieldByName('IDPESSOA').AsString+
      ' AND    H.IDTITULAR        = '+qry.FieldByName('IDTITULAR').AsString+
      ' AND    H.IDBENEFICIO      = '+IntTostr(iIdBeneficio)+
      ' AND    H.SEQPROPOSTA      = 1 '+
      ' AND    BF.NUMEROPROCESSO  = H.NUMEROPROCESSO '+
      ' AND    BF.IDPESSOA	  = H.IDPESSOA '+
      ' AND    DEP.IDPESSOA       = H.IDPESSOA '+
      ' AND    BF.IDBENEFICIO     = H.IDBENEFICIO '+
      ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
      ' AND    BFTP.IDTITULAR     = BF.IDTITULAR '+
      ' AND    BFTP.IDPESSJUR     = BF.IDPESSJUR '+
      ' AND    BFTP.IDPLANOPREV   = BF.IDPLANOPREV '+
      ' AND    BFTP.IDPESSOA      = BF.IDPESSOA '+
      ' AND    BFTP.IDBENEFICIO   = BF.IDBENEFICIO '+
      ' GROUP BY B.NOME, H.IDPESSOA, H.MESREFERENCIA, H.FLGENVIADO,  '+
      '          BF.IDSITBENEFICIO,  BF.DATAFINAL, BFTP.PERCENTUAL, DEP.NUMSEQUENCIA, '+
      '          DATA.DTEFETPGTO '+
      ' ORDER BY B.NOME, H.IDPESSOA, H.MESREFERENCIA ');
    qryAux.Open;

    // se contiver algum registro continua, caso contrário passa pro próximo registro
    If qryAux.IsEmpty Then
    Begin
      //SE NÃO TIVER BENEFICIO NA HST É PQ A DATAINICIO FOI RETROAGIDA

      // Se o benefício estiver encerrado e a data final for < que a corrente ou
      // data final em branco (erro!) pula.
    End Else If (qryAux.FieldByName('IDSITBENEFICIO').AsInteger = 3) Then
      If (((Copy(qryAux.FieldByName('DATAFINAL').AsString,7,4)+'/'+
          Copy(qryAux.FieldByName('DATAFINAL').AsString,4,2)) < sAnoMesRef) Or
             qryAux.FieldByName('DATAFINAL').IsNull)  Then
      Begin
        bPrimeiro := False;
        Continue;
      End;

      if (qry.FieldByName('IDPESSOA').AsInteger <> qry.FieldByName('IDTITULAR').AsInteger)
        And (Not bPagaAbono) Then
      Begin
        // Controla a passagem pela função. Uma vez calculado não passa mais!
        If Not bAbonoCalculado Then
        Begin
          bPossuiAbono := VerificaSePagaAbonoBfciario(
                            qryPassagem,
                            iIdPessJur,
                            iidPlanoPrev,
                            iIdTitular,
                            iSeqProposta,
                            iIdPessoa,
                            iIdPessoa,
                            edDataInicioBenef.Text,
                            edDataFinalBenef.Text,
                            iIdRegraAbono,
                            rValorBenefTitular,
                            cTipoAbono,
                            bErro,
                            sMsgErro);
          bAbonoCalculado := True;
        End;

        // INCÍCIO - CÁLCULO PARA BENEFICIÁRIO //////////////////
        // Pega valor total do benefício
        dValorTotalBeneficio := ExecutaRegraValorTotal(qryPassagem,
                                  Qry.FieldByName('IDRGVALORTOTAL').AsInteger,
                                  iIdPessJur, iIdPlanoPrev, iIdTitular,
                                  iSeqProposta,
                                  Qry.FieldByName('NUMEROPROCESSO').AsInteger,
                                  Qry.FieldByName('IDBENEFICIO').AsInteger,
                                  iNumBenef,//iNumBenef,
                                  rOpcao1, rOpcao2, rOpcao3,
                                  sSQLBenefAssoc,
                                  dtInicioINSS.Text,//Qry.FieldByName('DATAINICIOINSS').AsString, // DATAEVENTO = PROCESSOSBENEF.DTEVENTO
                                  edDataInicioBenef.text, // DATAINICIO
                                  dtInicioINSS.Text,
                                  reValorCalcInss.Text,
                                  reValorInfINSS.Text,
                                  edDataFinalBenef.Text,
                                  '0',//'sValorReserva',
                                  Qry.FieldByName('VALORBINSSANT1').AsString,
                                  Qry.FieldByName('VALORBINSSANT2').AsString,
                                  Qry.FieldByName('VALORBINSSANT3').AsString,
                                  bErro,
                                  sMsgErro,
                                  iIdCalculo,
                                  1,
                                  Qry.FieldByName('DIBBENEFANT').AsString,
                                  Qry.FieldByName('VALORBENEFANT').AsString,
                                  StrToFloat(ClienteNumero(reValorSRB.Text)));
        // Pega o valor pro-rata em função da qtd. de beneficiários
        dValorBeneficioProRata := ExecutaRegraCalculoBeneficioBfciario(
                                    qryPassagem,
                                    qryBeneficio.FieldByName('IDREGRACALCULO').AsInteger,
                                    -1, // REGRA RESERVA
                                    qry.FieldByName('IDPESSJUR').AsInteger,
                                    qry.FieldByName('IDPLANOPREV').AsInteger,
                                    qry.FieldByName('IDTITULAR').AsInteger,
                                    qry.FieldByName('SEQPROPOSTA').AsInteger,
                                    qry.FieldByName('IDBENEFICIO').AsInteger,
                                    qry.FieldByName('NUMEROPROCESSO').AsInteger,
                                    iNumBenef,
                                    rOpcao1, rOpcao2, rOpcao3,
                                    sSQLBenefAssoc,
                                    dtInicioINSS.Text,//qry.FieldByName('DATAINICIOINSS').AsString,//DATAEVENTO
                                    edDataInicioBenef.Text,
                                    dtInicioINSS.Text,
                                    FloatToStr(dValorTotalBeneficio),
                                    reValorInfInss.Text,
                                    reValorCalcINSS.Text,
                                    '0',// valor reserva
                                    bErro,
                                    sMsgErro,
                                    iIdCalculo,
                                    qry.FieldByName('IDPESSOA').AsInteger,
                                    qry.FieldByName('IDDEPENDENCIA').AsString,
                                    qry.FieldByName('PERCENTUAL').AsString,
                                    1,
                                    qry.FieldByName('DIBBENEFANT').AsString,
                                    qry.FieldByName('VALORBENEFANT').AsString);
        rVlrAtual := dValorBeneficioProRata;
        // FIM - CÁLCULO PARA BENEFICIÁRIO //////////////////
      End Else
      Begin
        // Controla a passagem pela função. Uma vez calculado não passa mais!
        If Not bAbonoCalculado Then
        Begin
          // Verificar se o benefício tem abono
          bPossuiAbono := VerificaSePagaAbonoParticip(
                            qryPassagem,
                            iIdPlanoPrev,
                            qryBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                            edDataInicioBenef.Text,
                            edDataFinalBenef.Text,
                            iIdRegraAbono,
                            cTipoAbono, // A - final do Ano e B - final do Beneficio
                            bErro,
                            sMsgErro);
          bAbonoCalculado := True;
        End;

        // INCÍCIO - CÁLCULO PARA PARTICIPANTE //////////////////
        // Pega o valor do benefícios
        dValorTotalBeneficio := ExecutaRegraCalculoBeneficio(qryPassagem,
                             qryBeneficio.FieldByName('IDREGRACALCULO').AsInteger,
                             qryBeneficio.FieldByName('IDREGRAPAGAMENTO').AsInteger,
                             qry.FieldByName('IDPESSJUR').AsInteger,
                             qry.FieldByName('IDPLANOPREV').AsInteger,
                             qry.FieldByName('IDTITULAR').AsInteger,
                             qry.FieldByName('SEQPROPOSTA').AsInteger,
                             qry.FieldByName('IDBENEFICIO').AsInteger,
                             qry.FieldByName('NUMEROPROCESSO').AsInteger,
                             rOpcao1, rOpcao2, rOpcao3,
                             sSQLBenefAssoc,
                             dtInicioINSS.Text,//DATAEVENTO
                             edDataInicioBenef.Text,
                             dtInicioINSS.Text,
                             edDataInicioBenef.text,//dtDataInicio.Text,
                             qry.FieldByName('DataRequerimento').AsString,
                             reValorInfINSS.Text,
                             reValorCalcINSS.Text,
                             '0',//FloatToStr(rValorReserva),
                             bGrupo,
                             0,
                             qry.FieldByName('DIBBENEFANT').AsString,
                             qry.FieldByName('ValorBenefAnt').AsString,
                             qry.FieldByName('VALORBINSSANT1').AsString,
                             qry.FieldByName('VALORBINSSANT2').AsString,
                             qry.FieldByName('VALORBINSSANT3').AsString,
                             bErro,
                             sMsgErro,
                             iIdCalculo,
                             0,//piFlgPossuiAcomp, *** VERIFICAR POSTERIORMENTE
                             StrToFloat(ClienteNumero(reValorSRB.Text)),
                             sIdSitPartAntes,
                             sIdSitPlanAntes,
                             sIdSitFuncAntes,
                             sIdSitPart,
                             sIdSitPlanoPrev,
                             sIdSitFunc);
        dValorBeneficioProRata := dValorTotalBeneficio;
        // FIM - CÁLCULO PARA PARTICIPANTE //////////////////
      End;

      If bPagaAbono And (Copy(sAnoMesRef,6,2)= '13') Then
      Begin
        // INCÍCIO - CALCULA ABONO //////////////////
        // Passar o valor do beneficio cheio e não o 13º calculado na HST
        CalculaAbono(sAnoMesRef,rValorAbono, dValorTotalBeneficio);
        dValorBeneficioNoMes := rValorAbono;
        bPagaAbono := False;
        // FIM - CALCULA ABONO //////////////////
      End Else
      Begin
        // Demais pagtos. diferentes de Abono.

        rVlrTotal := dValorTotalBeneficio;
        dValorBeneficioNoMes := CalculaBeneficioAPagarNoMes(
                            qryPassagem,
                            sAnoMesRef,
                            Qry.FieldByName('IDTITULAR').AsInteger,
                            Qry.FieldByName('IDPESSOA').AsInteger,
                            Qry.FieldByName('SEQPROPOSTA').AsInteger,
                            Qry.FieldByName('IDPESSJUR').AsInteger,
                            Qry.FieldByName('IDPLANOPREV').AsInteger,
                            Qry.FieldByName('NUMEROPROCESSO').AsInteger,
                            Qry.FieldByName('IDBENEFICIO').AsInteger,
                            iNumBenef, //piTotBeneficiarios
                            Qry.FieldByName('IDREGRAPRIMPAGTO').AsInteger,
                            Qry.FieldByName('IDREGRAULTPAGTO').AsInteger,
                            Qry.FieldByName('IDTPPAGTOBENEFIC').AsInteger,
                            edDataInicioBenef.Text,// DIB
                            edDataFinalBenef.text,// datafinal
                            sAnoMesRef,
                            Qry.FieldByName('FLGCALCTODOMES').AsString,
                            dValorTotalBeneficio,// dValorEmReal
                            dValorBeneficioProRata,//rValorBeneficio,//dNovoValorTotal, // dValorTotal
                            Qry.FieldByName('VALORCOTAS').AsFloat,
                            True, // confirmar!!!
                            edDataInicioBenef.text,
                            99, // piTipoMov verificar posteriormente
                            Qry.FieldByName('FLGDATAPREVISTA').AsInteger,
                            bErro,
                            bReajustou,
                            sUltMesReajuste,
                            dValorBeneficioIntegral,
                            dValorBeneficioIntegralAposMinimo,
                            dValorPrevAntesMinimo,
                            dValorBenefRateado, // Augusto 23/01/2003
                            dValorSRB, // CAMILLE - 23.08.2002 - NOVO PARAMETRO
                            '       ');
      End;

      // Preenche linha com os dois valores.
      sLinha := PreparaStr(sAnoMesRef,7)+' '+
              PreparaStr(qry.FieldByName('NOME').AsString,25)+
              PreparaStr(AlinhaDireita(FormatFloat('##0.00',(qryAux.FieldByName('VALORPREV').AsFloat)),9),12)+
              PreparaStr(AlinhaDireita(FormatFloat('##0.00',dValorBeneficioNoMes),9),12);

      // insere a diferença
      sValorDiferenca := PreparaStr(AlinhaDireita(FormatFloat('##0.00',(Arredonda(dValorBeneficioNoMes -
                                                                        qryAux.FieldByName('VALORPREV').AsFloat,2))),9),12);
      sLinha := sLinha + sValorDiferenca;

      // INICIO - Calcula Alterador
      If (lkcmbAlterador.Text <> '') And (Not qryCorrecaoBeneficio.IsEmpty) Then
      Begin
        bUsaAlterador :=  CalculaAlterador(sAnoMesRef,qry.FieldByName('DATAREQUERIMENTO').AsString,
                            qryAux.FieldByName('DTEFETPGTO').AsString, StrToFloat(sValorDiferenca), qryAlterador.FieldByName('CODALTERADOR').AsInteger,
                            qryCorrecaoBeneficio.FieldByName('IDREGRACALCULO').AsInteger,rValorCorrecao);
        If Not bUsaAlterador Then
        Begin
          If MsgDlg('Valor do calculo do alterador igual a zero!'+#13+
                'Continua o processamento ignorando o alterador?','Erro ',mtError,[mbYes,mbNo],0) = mrYes Then
            lkcmbAlterador.Text := ''
          Else
          Begin
            Result := False;
            frmAguarde.Apaga;
            Exit;
          End;
        End;
      End;
      // FIM - Calcula Alterador

      // Insere alterador, caso exista
      If bUsaAlterador Then
        sLinha := sLinha +PreparaStr(AlinhaDireita(FormatFloat('##0.00',rValorCorrecao),9),12);

      mmResult.Lines.Add(sLinha);

      AlimentaQryVirtualBenef(dValorBeneficioNoMes, dValorTotalBeneficio, sAnoMesRef);

      /////// * FIM - BENEFÍCIO * /////////


      /////// * CONTRIBUIÇÃO * /////////

      // verifica as contribuições no Histórico
      With qryHstContrib Do
      Begin // percorre todas as contribuições do participante.
        Close;
        ParamByName('MESREFERENCIA').AsString := ''+sAnoMesRef+'';
        ParamByName('IDPESSOA').AsInteger :=  qry.FieldByName('IDPESSOA').AsInteger;
        ParamByName('IDEVENTOGERADOR').AsInteger := iIdEvento;
        Open;
        First;
        While Not Eof Do
        Begin
          // 1º passo: Saber se é mês cheio ou  prim./últ. pagto.
           AlimentaQryVirtualContrib(FieldByName('VALORESPERADO').AsFloat,
                                     FieldByName('VALORESPERADO').AsFloat,
                                     sAnoMesRef,
                                     FieldByName('IDCONTRIBUICAO').AsInteger,
                                     FieldByName('CONTRIBUICAO').AsString);

        //
//        CalculaContribuicaoRetro(iIdPessJur,iIdPlanoPrev,qryMotivo.FieldByName('IDMOTIVO').AsInteger,
//                -1,qryPassagem,qryPassagem,'?','?','?','?','?','?','?','?')
          // 3º passo:


          Next;
        End; // While Not Eof Do
      End; // With qryHstContrib Do


      /////// * FIM - CONTRIBUIÇÃO * /////////

      bPrimeiro := False;
//      dNovoValor           := 0;
//      dNovoValorTotal      := 0;

  End;// While IncrementaAnoMes(bPrimeiro,sAno,sMes, sAnoMesRef) <= sAnoMesFinal do
  Except
    Result := False;
  End;
  frmAguarde.Apaga;
}  
end;

procedure TfrmRetroativoPREV.reValorCalcINSSBtnClick(Sender: TObject);
var rValorINSS       : double;
    bErro            : boolean;
    sMsgErro         : string;
begin
  inherited;
{// Executar regra de calculo do valor do inss
  if (Trim(qryBeneficio.FieldByName('IDREGRACALCINSS').AsString) <> '') AND
     (qryBeneficio.FieldByName('IDREGRACALCINSS').AsInteger > 0) then
  begin
     frmAguarde.Mostra('Regra de Cálculo do INSS - Nº '+qryBeneficio.FieldByName('IdRegraCALCINSS').AsString);

     rValorINSS :=  ExecutaRegraCalculoINSS (qryPassagem,
                                  qryBeneficio.FieldByName('IdRegraCALCINSS').AsInteger,
                                  iIdPessJur, iIdPlanoPrev, iIdTitular,
                                  iSeqProposta,
                                  qryBeneficio.FieldbyName('IdBeneficio').AsInteger,
                                  iNumeroProcesso,
                                  qrySituacao.FieldByname('IdSitFunc').AsInteger,
                                  qrySituacao.FieldByname('IdSitPart').AsInteger,
                                  qrySituacao.FieldByname('IdSitPlanoPrev').AsInteger,
                                  rOpcao1, rOpcao2, rOpcao3,
                                  sDataEvento,
                                  edDataInicioBenef.Text,
                                  dtInicioINSS.Text,
                                  Qry.FieldByName('DataRequerimento').AsString,
                                  0,
                                  bErro,
                                  sMsgErro,iIdCalculo,
                                  Qry.FieldByName('DibBenefAnt').AsString,
                                  Qry.FieldByName('ValorBenefAnt').AsString,
                                  Qry.FieldByName('VALORBINSSANT1').AsString,
                                  Qry.FieldByName('VALORBINSSANT2').AsString,
                                  Qry.FieldByName('VALORBINSSANT3').AsString,
                                  Qry.FieldByName('FLGPOSSUIACOMPINSS').AsInteger);

     frmAguarde.Apaga;
     if bErro
     then begin
       MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
       reValorCalcINSS.Text := '0';
       Exit;
     end
     else
     Begin
       reValorCalcINSS.Text  := FloatToStr(rValorINSS);
       reValorInfINSS.Text := reValorCalcINSS.Text;
     End;
  end // if idregra <> ''
  else begin
//     rValorINSS := 0;
     reValorCalcINSS.Text := '0';
  end;

// VERIFICAR  bReajustouINSS := False;
}
end;

procedure TfrmRetroativoPREV.bbtnImprimirClick(Sender: TObject);
var iSize : integer;
begin
  if printdlg.Execute then
  Begin
    iSize              := mmResult.Font.Size;
    mmResult.Font.Size := 7;
    mmResult.Print('Revisão de Benefícios ...');
    mmResult.Font.Size := iSize;
  End;
end;

procedure TfrmRetroativoPREV.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then
    mmResult.Lines.SaveToFile(savedlg.filename);

end;

procedure TfrmRetroativoPrev.AlimentaQryVirtualBenef(pdValorNovo, pdValorTotal: double; psAnoMes: String);
begin
  // Preenche a qryVirtualBenef com os registro prontos para o insert ou update na
  // HSTBenef. Na próxima etapa o qry será varrida na implentação do SQL.
  // lote preenchido na confirmação.
  With qryVirtualBenef Do
  Begin
    Insert;
    FieldByName('MESREFERENCIA').AsString   := psAnoMes;
    FieldByName('NUMEROPROCESSO').AsInteger := qry.FieldByName('NUMEROPROCESSO').AsInteger;
    FieldByName('IDTITULAR').AsInteger      := qry.FieldByName('IDTITULAR').AsInteger;
    If qryAux.FieldByName('IDPESSOA').AsInteger = 0 Then
      FieldByName('IDPESSOA').AsInteger       := qry.FieldByName('IDTITULAR').AsInteger
    Else
      FieldByName('IDPESSOA').AsInteger       := qryAux.FieldByName('IDPESSOA').AsInteger;
      
    FieldByName('IDBENEFICIO').AsInteger    := qry.FieldByName('IDBENEFICIO').AsInteger;
    FieldByName('IDPESSJUR').AsInteger      := qry.FieldByName('IDPESSJUR').AsInteger;
    FieldByName('IDPLANOPREV').AsInteger    := qry.FieldByName('IDPLANOPREV').AsInteger;
    FieldByName('IDMOTIVO').AsInteger       := qryMotivo.FieldByName('IDMOTIVO').AsInteger;
    FieldByName('SEQPROPOSTA').AsInteger    := qry.FieldByName('SEQPROPOSTA').AsInteger;
    FieldByName('FLGENVIADO').AsInteger     := qryAux.FieldByName('FLGENVIADO').AsInteger;// vai controlar a operação (insert/update)
    FieldByName('SEQBENEFICIO').AsInteger   := 0;//qryAux.FieldByName('SEQBENEFICIO').AsInteger;
    FieldByName('BENEFICIO').AsString       := qry.FieldByName('NOME').AsString;
    FieldByName('VALORANTIGO').AsFloat      := Arredonda(qryAux.FieldByName('VALORPREV').AsFloat,2);
    FieldByName('VALORNOVO').AsFloat        := Arredonda(pdValorNovo,2);
    FieldByName('VALORDIF').AsFloat         := Arredonda(pdValorNovo - qryAux.FieldByName('VALORPREV').AsFloat,2);
    FieldByName('VALORTOTAL').AsFloat       := Arredonda(pdValorTotal,2);
    If FieldByName('VALORDIF').AsFloat > 0 Then
      FieldByName('FLGDEVOLUCAO').AsInteger   := 0
    Else FieldByName('FLGDEVOLUCAO').AsInteger   := 1;
    Post;
  End;
end;

procedure TfrmRetroativoPREV.DBGBenefCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if qryVirtualBenef.FieldByName('VALORDIF').AsFloat <> 0 Then
  Begin
    AFont.Color := clRed;
    AFont.Style := AFont.Style + [fsBold];
    bHouveDif := True;
  End;

end;

procedure TfrmRetroativoPREV.edDataInicioBenefExit(Sender: TObject);
begin
  inherited;
{  if (Trim(edDataInicioBenef.Text) <> '') and
     (Trim(dtInicioINSS.Text) <> '') and
     (StrToDate(edDataInicioBenef.Text) < StrToDate(dtInicioINSS.Text))
  then begin
     MsgDlg('A DIB (Data de Início na Fundação) não pode ser inferior a Data de Início no INSS. ',
            'Informação',mtInformation,[mbOk,mbHelp],0);
     edDataInicioBenef.SetFocus;
     Exit;
  end;
}
end;

function TfrmRetroativoPrev.GravaHstBenef: Boolean;
    {-->}
    Function AtualizaHst(pIdLote: Integer; pAnoMesPagto: String): Boolean;
    // executa update dos benefício com divergência na HstBenefbfciario
    // preencher sFlgDevolucao baseado na diferença (+ ou -)
    Begin
      Result := True;
      With qryAtualiza Do
      Begin
        Sql.Clear;
        Sql.Add(
         ' UPDATE HSTBENEFBFCIARIO  '+
         ' SET VALORPREV = '+OraNumero(FloatToStr(Abs(qryVirtualBenef.FieldByName('VALORNOVO').AsFloat)))+
         ' ,  VALORTOTAL = '+OraNumero(qryVirtualBenef.FieldByName('VALORTOTAL').AsString)+
         ' ,  FLGENVIADO = 0 '+
         ' ,  IDLOTE     = '+IntToStr(pIdLote)+
         ' ,  FLGDEVOLUCAO = '+qryVirtualBenef.FieldByName('FLGDEVOLUCAO').AsString+
         ' ,  IDMOTIVO     = '+qryMotivo.FieldByName('IDMOTIVO').AsString+
         ' ,  MES        = '+QuotedStr(pAnoMesPagto)+
         ' WHERE  NUMEROPROCESSO   = '+qryVirtualBenef.FieldByName('NUMEROPROCESSO').AsString+
         ' AND    MESREFERENCIA	   = '''+qryVirtualBenef.FieldByName('MESREFERENCIA').AsString+''''+
         ' AND    IDBENEFICIO      = '+qryVirtualBenef.FieldByName('IDBENEFICIO').AsString+
         ' AND    IDPESSOA         = '+qryVirtualBenef.FieldByName('IDPESSOA').AsString+
         ' AND    SEQPROPOSTA      = 1 ');
        Try
          ExecSql;
        Except
          Result := False;
        End; // try
      End;// with qryatualiza
    End;
    {<--}


    {-->}
    Function InseriHst(pIdLote: Integer; pAnoMesPagto: String): Boolean;
    Var
      sFlgDevolucao: String;
    Begin
      Result := True;
      // Verifica se é pagamento ou devolução
      If qryVirtualBenef.FieldByName('VALORDIF').AsFloat > 0 Then
        sFlgDevolucao := '0'
      Else sFlgDevolucao := '1';

      With qryAtualiza Do
      Begin
        Sql.Clear;
        Sql.Add(
         ' INSERT INTO HSTBENEFBFCIARIO  '+
         ' (NUMEROPROCESSO, MESREFERENCIA, IDBENEFICIO, IDPESSOA,IDTITULAR,IDPESSJUR,IDPLANOPREV, '+
         ' SEQPROPOSTA, FLGDEVOLUCAO, VALORPREV, IDMOTIVO, SEQBENEFICIO,   MES, IDLOTE, FLGENVIADO, '+
         ' VALORTOTAL ) '+
         '  VALUES '+
         '  ('+qryVirtualBenef.FieldByName('NUMEROPROCESSO').AsString+
         '   ,'+''''+qryVirtualBenef.FieldByName('MESREFERENCIA').AsString+''''+
         '   ,'+qryVirtualBenef.FieldByName('IDBENEFICIO').AsString+
         '   ,'+qryVirtualBenef.FieldByName('IDPESSOA').AsString+
         '   ,'+qryVirtualBenef.FieldByName('IDTITULAR').AsString+
         '   ,'+qryVirtualBenef.FieldByName('IDPESSJUR').AsString+
         '   ,'+qryVirtualBenef.FieldByName('IDPLANOPREV').AsString+
         '   , '+ qryVirtualBenef.FieldByName('SEQPROPOSTA').AsString+
         '   , '+sFlgDevolucao+
         '   ,'+OraNumero(FloattoStr(Abs(qryVirtualBenef.FieldByName('VALORDIF').AsFloat)))+
         '   ,'+qryMotivo.FieldByName('IDMOTIVO').AsString+
         '   ,1'+
         '   ,'+''''+pAnoMesPagto+''''+
         '   ,'+IntToStr(pidLote)+
         '   ,0 '+
         '   , '+OraNumero(FloattoStr(qryVirtualBenef.FieldByName('VALORTOTAL').AsFloat))+')');
        Try
          ExecSql;
        Except
          Result := False;
        End; // try
      End;// with qryAtualiza Do
    End;
    {<--}

Var
  iLoteSelecionado: Integer;
begin
  // Pega o lote.
  iLoteSelecionado := SelecionaLoteBeneficioAberto(
                        sAnoMesPagamento,
                        iflgIncluiMesConc);
  If iLoteSelecionado < 0 Then
  Begin
    Result := False;
    TwCons.Etapa.Pos := TwCons.Etapa.Pos - 1;
    MsgDlg('É necessário selecionar um Lote','Atenção ',mtWarning,[mbOk],0);
    Exit;
  End;

  With qryVirtualBenef Do
  Begin
    First;
    While Not Eof Do
    Begin
      // Só processa se tiver diferença.
      If FieldByName('VALORDIF').AsFloat <> 0 Then
      Begin
        If FieldbyName('FlgEnviado').AsInteger = 0 Then
          Result := InseriHst(iLoteSelecionado,sAnoMesPagamento)
        Else Result :=  AtualizaHst(iLoteSelecionado,sAnoMesPagamento);
      End;
      Next;
    End;  // While
  End;  // With

  // Atualiza BENEFBFCIARIO
  AtualizaBenef;
end;

function TfrmRetroativoPrev.BeneficioRetido: Boolean;
Var
  q: TwwQuery;
begin
  Try
    q := TwwQuery.Create(Nil);
    q.DatabaseName := 'BASEDADOS';
    q.sql.Text :=
      ' SELECT NUMEROPROCESSO FROM HSTBENEFBFCIARIO '+#13+
      ' WHERE NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+#13+
      '   AND FLGENVIADO = 9 ';
    q.Open;
    Result := Not q.IsEmpty;
  Finally
    q.Free;
  End;
end;

function TfrmRetroativoPrev.AtualizaBenef: Boolean;
Var
  q: TwwQuery;
begin
  // Atualiza BENEFBFCIARIO de acordo com valores resvistos com as opções da tela
{  q := TwwQuery.Create(Nil);
  q.DataBaseName := 'BASEDADOS';
  q.sql.Text :=
    ' UPDATE BENEFBFCIARIO '+
    ' SET DATAINICIO = TO_DATE('''+edDataInicioBenef.Text+''',''DD/MM/YYYY''), '+
    '     DATAFINAL   = TO_DATE('''+edDataFinalBenef.Text+''',''DD/MM/YYYY''), '+
    '     DATAINICIOFUND = TO_DATE('''+edDataInicioBenef.Text+''',''DD/MM/YYYY''), '+

    FuncaoGeral.decode(dtInicioINSS.Text,'','',
      ' DATAINICIOINSS = TO_DATE('''+dtInicioINSS.Text+''',''DD/MM/YYYY''),')  +

    FuncaoGeral.decode(reValorInfINSS.Text,'','',
     ' VLRINFINSS = '+OraNumero(reValorInfINSS.Text))+',' +

    FuncaoGeral.decode(reValorCalcINSS.Text,'','',
     ' VLRCALCINSS = '+OraNumero(reValorCalcINSS.Text)) +',' +
    '     VALORTOTAL            = '+OraNumero(FloatToStr(rVlrTotal))+',' +
    '     VALORATUAL            = '+OraNumero(FloatToStr(rVlrTotal))+ // SÓ PARTICIPANTE APENAS!!!
    ' WHERE NUMEROPROCESSO      = '+IntToStr(iNumeroProcesso)+
    '  AND IDTITULAR            = '+IntToStr(iIdTitular)+
    '  AND IDPESSOA             = '+IntToStr(iIdPessoa)+
    '  AND IDBENEFICIO          = '+IntToStr(iIdBeneficio)+
    '  AND IDPLANOPREV          = '+IntToStr(iIdPlanoPrev)+
    '  AND IDPESSJUR            = '+IntToStr(iIdPessjur);
  Try
    q.ExecSql;
  Except
    Result := false;
    q.Free;
    Exit;
  End;
  Result := True;
  q.Free;

  //  Cria log de ocorrência
  CriaLogOcorrencia(qry.FieldByName('IdPlanoPrev').AsString,
                   qry.FieldByName('IdPessJur').AsString,
                   qry.FieldByName('IdTitular').AsString,
                   qry.FieldByName('IdBeneficio').AsString,
                   qry.FieldByName('NumeroProcesso').AsString,
                   qry.FieldByName('IdPessoa').AsString,
                   qry.FieldByName('SeqProposta').AsString,
                   '13',// Revisão de Benefícios
                   DateToStr(date),
                   qry.FieldByName('ValorAtual').AsString,
                   qry.FieldByName('ValorTotal').AsString,
                   '0',// vlr cotas
                   edDataInicioBenef.text,
                   edDataFinalBenef.text,
                   qry.FieldByName('ValorAtual').AsString,
                   qry.FieldByName('DataInicio').AsString,
                   qry.FieldByName('DataFinal').AsString,
                   qry.FieldByName('IDSITBENEFICIO').AsString,// Situação do Benefício
                   qry.FieldByName('FlgDataPrevista').AsInteger,
                   qryAux,'',-1)
}                   
end;

procedure TfrmRetroativoPREV.rbAtrasoClick(Sender: TObject);
begin
  inherited;
  //

end;

function TfrmRetroativoPrev.CalculaAlterador(psMesReferencia, psDataRequerimento,
                                             psDataEfetPagto : string;
                                             pdValor : Double;
                                             piCodalterador, piIdregracalculo : integer;
                                             var pdValorCorrecao : Double) : boolean;
var
  lssql, lsvalorcorrecao, lsValor : string;
  liidcalculo : integer;
  lbErro : boolean;
begin
  pdValorCorrecao:=0;
  lsvalor:=oranumero(formatfloat('#0.00', pdValor));

  // query de correcao igual a do AdmPrev

  lssql:='SELECT '+
           inttostr(piCodalterador)+' CODALTERADORCORR,' +
           lsValor+' VALORPREV,' +
           QuotedStr(formatdatetime('dd/mm/yyyy',Date))+' DATAREF, '+
           QuotedStr(psMesReferencia)+' MESREFERENCIA,'+
           QuotedStr(psDataEfetPagto)+' DATAPREVISAORECE,'+
           QuotedStr(psDataRequerimento)+' DATAREQUERIMENTO, '+
           QuotedStr(formatdatetime('dd/mm/yyyy',Date))+' DATARECEBIMENTO'+
           ' FROM DUAL ';
  try
    lsvalorcorrecao:=RegraNumerica(inttostr(piIdregracalculo), lssql, lbErro,
      liidcalculo);
    if not lbErro then
    begin
      lsvalorcorrecao:=clientenumero(trim(lsvalorcorrecao));
      try
        pdValorCorrecao := strtofloat(lsvalorcorrecao);
      except
        lberro:=true;
      end;
    end;
  except
    lberro:=true;
    FrmAguarde.Apaga;
  end;
  result:=(not lberro) and (pdValorCorrecao<>0);
end;


procedure TfrmRetroativoPREV.lkcmbAlteradorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryCorrecaoBeneficio.Close;
  qryCorrecaoBeneficio.ParamByName('IDPLANOPREV').AsInteger:= iidplanoprev;
  qryCorrecaoBeneficio.ParamByName('IDBENEFICIO').AsInteger:= iidbeneficio;

{  if rbAtraso.Checked then
  begin
    qryCorrecaoBeneficio.ParamByName('PFLGATRASO').AsInteger:=1;
    qryCorrecaoBeneficio.ParamByName('PFLGDEVOL').AsInteger:=0;
  end else If rbDevolucao.Checked Then
  begin
    qryCorrecaoBeneficio.ParamByName('PFLGATRASO').AsInteger:=0;
    qryCorrecaoBeneficio.ParamByName('PFLGDEVOL').AsInteger:=1;
  end;
}  
  qryCorrecaoBeneficio.Open;

  // se não exitir regra associado exibir mensagem.
{  If (qryCorrecaoBeneficio.IsEmpty) And
       (lkcmbAlterador.Text <> '') Then
  Begin
    MsgDlg('O Alterador selecionado não poosui regra associada.',
        'Atenção ',mtWarning,[mbOk],0);
  End;
}
end;

function TfrmRetroativoPrev.CalculaAbono (psAnoMesRef: String;  var pdValorAbono: Double; pdValor: Double):Boolean;
var
  bErro: Boolean;
  sMsgErro: String;
begin
{  pdValorAbono :=  ExecutaRegraValorAbono(
                       qryPassagem,
                       iIdRegraAbono,
                       iIdPessJur,
                       iIdPlanoPrev,
                       iIdTitular,
                       iSeqProposta,
                       iIdPessoa,
                       iIdBeneficio,
                       edDataInicioBenef.Text,
                       edDataFinalBenef.Text,
                       psAnoMesRef,
                       pdValor,
                       qry.FieldByName('FLGPROVISORIO').AsString,  // Gleyber - 16/12/2002
                       bErro,
                       sMsgErro,7, 1 );
}                       
end;

Procedure TfrmRetroativoPrev.AlimentaQryVirtualContrib(pdValorNovo, pdValorTotal: double;
            psAnoMes: String; piIdContribuicao: Integer; psContribuicao: String);
begin
  with qryVirtualContrib do
  Begin
    Insert;
    FieldByName('MESREFERENCIA').AsString       := psAnoMes;
    FieldByName('MESCOBRANCA').AsString         := ''; // mês do lote??? se sim então não é aqui!
    FieldByName('IDEVENTOGERADOR').AsInteger    := iIdEvento;
    FieldByName('IDPESSOA').AsInteger           := qry.FieldByName('IDPESSOA').AsInteger;
    FieldByName('IDCONTRIBUICAO').AsInteger     := qryHstContrib.FieldByname('IDCONTRIBUICAO').AsInteger;
    FieldByName('IDPESSJUR').AsInteger          := qry.FieldByName('IDPESSJUR').AsInteger;
    FieldByName('IDPLANOPREV').AsInteger        := qry.FieldByName('IDPLANOPREV').AsInteger;
    FieldByName('IDMOTIVO').AsInteger           := qryMotivo.FieldByName('IDMOTIVO').AsInteger;
    FieldByName('SEQPROPOSTA').AsInteger        := 1;
    FieldByName('FLGDEVOLUCAO').AsInteger       := -1;// verificar....
    FieldByName('FLGENVIADO').AsInteger         := -1;// verificar....
    FieldByName('CONTRIBUICAO').AsString        := psContribuicao; // nome da contrib.
    Post;
  End;
end;

procedure TfrmRetroativoPREV.DBGContribCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if qryVirtualContrib.FieldByName('VALORDIF').AsFloat <> 0 Then
  Begin
    AFont.Color := clRed;
    AFont.Style := AFont.Style + [fsBold];
    bHouveDif := True;
  End;
end;

///////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// ROTINA DE TESTE PARA CONTRIBUIÇÃO ////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
function TfrmRetroativoPrev.CalculaContribuicaoRetro(piIdPessJur,     piIdPlanoPrev,
                             piIdMotivo,      piSitRecebimento   : integer;
                             qryContrib,      qryAux             : TwwQuery;
                             sSQL,            sSQLRegra,
                             sWhereSQLRegra,  sAliasSQLRegra,
                             sSitFundacao,    sDescPreparo,
                             sAtrasoDevol,    sFlgVeioDoEvento   : string;
                             bValorQry,       bParaCobranca      : boolean;
                             var sMsgErro                        : string;
                             var iIdLote                         : integer;
                             sSalarioPart,    sIdSitPart,
                             sFlgIntEvento                       : string;
                             bAbreQueryContrib,
                             bAtualizaTotalLote                  : boolean;
                             psAnoMesReferencia                  : string;
                             pbPrepararSoMes13                   : boolean;
                             piIdEventoGerador                   : longint;
                             psDataInicioBenef, psDataFinalBenef : string;
                             piOrigem, piFlgDtFinalPrevista      : word;   // 0 - Outros ,
                                                                           // 1 - Suspensao de contribuicao
                                                                           // 2 - Concessao de Beneficio
                                                                           // 3 - Renova
                             psDataInicioOriginal                : string;  // apenas para Renovacao

                             piNumProcesso       : longint //leocbs - 29052002
                               ) : boolean;
var
   iMes,                 iAno,                iIdContribuicao,
   iNumRecebimento,      iSitRecebimentoAux,  iOrdem,
   iParcela,             iNumReg,             iUltDiaMes              : integer;
   sNumRecebimento,      sMesHoje,            sAnoHoje,
   sAnoMesLote,
   sAnoMesDtRefFinal,    sAnoMesHoje,         sAnoMesAtual,
   sAnoMesInicio,        sAnoMesFinal,
   sAnoMesBuscaSalario,  sUltAnoMesPreparo,   sDataPrevisaoRece,
   sDataCobranca,        sDataAux,            sDataRef,
   sDataDeveriaTerPago,  sValorRegra,         sValorFinal,
   sSQLRegraAUX,         sCamposObrig,        sCamposNObrig,
   sAno,                 sMes,                sSQLValues,
   sAnoMesCalc13Aux,     sIdRegraCalculo,     sTpPagto,
   sMsgRegra,            sIdRegra,            sSalarioAux,
   sSalarioEncontrado,   sDataFinalRegra                              : string;
   bJaCalculouDezembro, // cbs - 16.01.2002
   bControleSalario13,  bEnvioEncerrado,      bJaPerguntouContribZERO,
   bErro,               bErroRegra,           bCalcula13Agora,
   bCalc13DtFim                                                       : boolean;
   liExercicio,         liPeriodo,            liEmpresa               : longInt;
   rTotalLote                                                         : real;
   cTipoEnvPrev                                                       : char;
   iFlgIncluiMesConc                                                  : integer;
   dDiferenca                                                         : double;
   sFlgDevolucao                                                      : string;
   sDataInicioAux                                                     : string;
   bInsereHst                                                         : boolean; // cbs - 28.02.2002
begin
   Result       := False;
   bErro        := False;
   bCalc13DtFim := False;
   bControleSalario13 := False;
   iIdCalculoGeral    := -1;
   sMsgErro := '';

   iIdCalculoGeral := 0;

   // Parametro sSql
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

   if Trim(psDataInicioBenef) = ''
   then begin
      sMsgErro := 'Parâmetros para o preparo incompletos : data de início.';
      Result   := True;
      Exit;
   end;

   iNumReg    := 0;
   rTotalLote := 0;

   // Abrir a query e verificar se tem alguma coisa a preparar
   if bAbreQueryContrib
   then begin
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
   end; // if bAbreQueryContrib

   if not qryContrib.Active
   then begin
      sMsgErro := ' Nenhuma contribuição encontrada para preparar. ';
      Result   := True;
      qryContrib.Close;
      Exit;
   end;

   if qryContrib.IsEmpty
   then begin
      sMsgErro := ' Nenhuma contribuição encontrada para preparar. ';
      Result   := False;
      qryContrib.Close;
      Exit;
   end;

   // Preencher datas
   if StrToDate(psDataInicioBenef) <= date
   then begin
          //sAnoMesHoje := Copy(DateToStr(date), 7,4)+'/'+Copy(DateToStr(date),4,2);                                         // ClaudioR - 19962 - 16/08/2007
          sAnoMesHoje := Copy(FormatDateTime('dd/mm/yyyy', date), 7,4) + '/' + Copy(FormatDateTime('dd/mm/yyyy', date),4,2); // ClaudioR - 19962 - 16/08/2007
          sMesHoje    := Copy(sAnoMesHoje,6,2);
          sAnoHoje    := Copy(sAnoMesHoje,1,4);
        end
   else
        begin
          sAnoMesHoje := Copy(psDataInicioBenef, 7,4)+'/'+Copy(psDataInicioBenef,4,2);
          sMesHoje    := Copy(sAnoMesHoje,6,2);
          sAnoHoje    := Copy(sAnoMesHoje,1,4);
        end;

   sAnoMesInicio   := Copy(psDataInicioBenef, 7,4) + '/' + Copy(psDataInicioBenef, 4,2);

   if Trim(psAnoMesReferencia) = '' then psAnoMesReferencia := sAnoMesHoje;

   // Preencher data da cobranca da contribuicao
   if sSitFundacao = 'AS'
   then begin
      sDataCobranca   := CriticaDataCobrancaSit(dtmAPrev.qry,
                                             IntToStr(iIdFundacao),
                                             IntToStr(piIdPlanoPrev),
                                             sSitFundacao, 'N',
                                             Copy(psAnoMesReferencia,6,2),
                                             Copy(psAnoMesReferencia,1,4),
                                             true); //P.RAMOS-07.04.2006-PEND.22044

      //if Trim(sDataCobranca) = '' then sDataCobranca := DateToStr(date);                  // ClaudioR - 19962 - 16/08/2007
      if Trim(sDataCobranca) = '' then sDataCobranca := FormatDateTime('dd/mm/yyyy', date); // ClaudioR - 19962 - 16/08/2007

   end
   else begin
      sDataCobranca   := CriticaDataCobrancaSit(dtmAPrev.qry,IntToStr(piIdPessJur),
                                                IntToStr(piIdPlanoPrev),
                                                sSitFundacao, 'N',
                                                sMesHoje, sAnoHoje,
                                                true); //P.RAMOS-07.04.2006-PEND.22044


      //if Trim(sDataCobranca) = '' then sDataCobranca := DateToStr(date);                  // ClaudioR - 19962 - 16/08/2007
      if Trim(sDataCobranca) = '' then sDataCobranca := FormatDateTime('dd/mm/yyyy', date); // ClaudioR - 19962 - 16/08/2007
   end;

   sAnoMesLote := BuscaMesCobrancaLote( iIdLote, Copy(Trim(sDataCobranca),7,4)+'/'+Copy(sDataCobranca,4,2));

   sMsgErro := '';

   // não assistido
   // Se nao tiver data final -> gerar até hoje
   // Se tiver e for menor que hoje -> gerar até a data
   // Se tiver e for maior que hoje -> gerar até hoje
   // Se data hoje < data inicio -> gerar até inicio

   if sAnoMesFinal < sAnoMesInicio then sAnoMesFinal  := sAnoMesInicio;

   { *** ASSISTIDO ***
     Se situação = AS Então
       Se não tiver DataFinal Então
         AnoMesFinal := Lote
       Senão Se DataFinal < Lote Então
         AnoMesFinal := MesDataFinal
       Senão AnomesFinal := Lote.
   }

   If (sSitFundacao = 'AS') Then
   Begin
     If Trim(psDataFinalBenef) = ''
     Then // Sem DataFinal
       sAnoMesFinal  := sAnoMesLote // Atribui o Lote
     Else If Copy(psDataFinalBenef,7,4)+'/'+Copy(psDataFinalBenef, 4,2) < sAnoMesLote
          Then sAnoMesFinal  :=  Copy(psDataFinalBenef,7,4)+'/'+Copy(psDataFinalBenef, 4,2)
          Else sAnoMesFinal  := sAnoMesLote
   End;

   // Se for EVENTO e a contribuicao for EXCLUSIVA da patrocinadora
   // Preparar contribuição até o mês - 1
   if (sFlgVeioDoEvento = '1') and (sSitFundacao = 'PT') and
      ( (psDataFinalBenef = '') or (StrToDate(psDataFinalBenef) > date) )
   then sAnoMesFinal := SAnoMesAnterior(sAnoMesFinal);

   // CAMILLE - REFER - 16.03.2001
   // Verificar o parametro que indica se é para conceder até o mes corrente ou
   // até o mes anterior
     //P.RAMOS - REFER - 04.07.2001
     //      (prmFlgIncluiMesConc = 0) and
   if (piOrigem = 2) or (piOrigem = 3) // Concessao de beneficio
   then begin
     if iIdLote >= 0
     then iFlgIncluiMesConc := PegaFlgIncluiMesConc(iIdLote)
     else iFlgIncluiMesConc := 1;

     // ClaudioR - 19962 - 16/08/2007 - Inicio
     //if (iFlgIncluiMesConc = 0) and
     //   ((Copy(psDataFinalBenef,7,4)+'/'+Copy(psDataFinalBenef,4,2) >=
     //     Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2)) or
     //    (Trim(psDataFinalBenef) = ''))
     //then sAnoMesFinal:=SAnoMesAnterior(sAnoMesFinal);

     if (iFlgIncluiMesConc = 0) and
        ((Copy(psDataFinalBenef,7,4)+'/'+Copy(psDataFinalBenef,4,2) >=
          Copy(FormatDateTime('dd/mm/yyyy', date),7,4) + '/' +
          Copy(FormatDateTime('dd/mm/yyyy', date),4,2)) or
         (Trim(psDataFinalBenef) = '')) Then
       sAnoMesFinal := SAnoMesAnterior(sAnoMesFinal);
     // ClaudioR - 19962 - 16/08/2007 - Fim
   end;

   if sAnoMesInicio > sAnoMesFinal then Exit;

   sAnoMesAtual       := sAnoMesInicio;
   iMes               := StrToInt(Copy(sAnoMesAtual,6,2));

   sDataFinalRegra   := psDataFinalBenef;
   sAnoMesDtRefFinal :=  Copy(psDataFinalBenef,7,4)+'/'+Copy(psDataFinalBenef,4,2);

   sSalarioAux := sSalarioPart;
   iSitRecebimentoAux := piSitRecebimento;

   // A qry está com as contribuicoes da CONTRIBPREVPARTP que devem
   // ser preparadas
   qryContrib.First;
   while not qryContrib.eof do
   begin
      // Preencher qryAux com dados da contribuicao
      with dtmAprev.qryAuxContrib do
      begin
         // Só precisa  abrir uma vez por plano
         if (not dtmAPrev.qryAuxContrib.Active) or (dtmAPrev.qryAuxContrib.FieldByName('IDPLANOPREV').AsInteger <> piIdPlanoPrev)
         then begin
           Close;
           ParamByName('IdPlanoPrev').AsInteger := piIdPlanoPrev;
           Open;
           if IsEmpty
           then begin
              sMsgErro := 'Parâmetros para o preparo incompletos  : dados da contribuição não encontrados. ';
              bErro    := True;
              break;
           end;
         end;
         if not Locate('IdContribuicao',qryContrib.FieldByName('IdContribuicao').AsInteger,[])
         then begin
            sMsgErro := 'Parâmetros para o preparo incompletos  : dados da contribuição não encontrados. ';
            bErro    := True;
            break;
         end;
      end;

      // Preencher variavel mes atual com o mes que esta sendo preparado no loop
      if (dtmAPrev.qryAuxContrib.FieldByName('QtdeParcelas').AsString  <> '') and
         (dtmAPrev.qryAuxContrib.FieldByName('QtdeParcelas').AsInteger <= 1)
      then begin
         sAnoMesAtual := sAnoMesInicio;
         sAnoMesFinal := sAnoMesInicio;
      end
      else sAnoMesAtual := sAnoMesInicio;

      bCalcula13Agora      := pbPrepararSoMes13;
      if pbPrepararSoMes13 then bCalc13DtFim := True;
      bJaPerguntouContribZERO := False;

      if pbPrepararSoMes13
      then sAnoMesFinal := sAnoMesAtual;

      while (sAnoMesAtual <= sAnoMesFinal) do
      begin
         iIdContribuicao   := qryContrib.fieldbyname('IdContribuicao').AsInteger;
         sSalarioPart      := sSalarioAux;

         // Verificar se a data de inicio da contribuicao é igual ou anterior ao anomesatual
         if Copy(qryContrib.FieldByName('DATAINICIO').AsString,7,4)+'/'+Copy(qryContrib.FieldByName('DATAINICIO').AsString,4,2) > sAnoMesAtual
         then begin
            sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
            continue;
         end;

         sDataPrevisaoRece := CriticaDataCobrancaSit(dtmAPrev.qry,
                                                IntToStr(iIdFundacao),
                                                IntToStr(piIdPlanoPrev),
                                                sSitFundacao, 'N',
                                                Copy(sAnoMesAtual,6,2),
                                                Copy(sAnoMesAtual,1,4),
                                                true); //P.RAMOS-07.04.2006-PEND.22044

         if Trim(sDataPrevisaoRece) = '' then sDataPrevisaoRece := sDataCobranca;

         //=================================
         //=== Tratamento de décimo terceiro
         //=================================
         if ( (copy(sAnoMesAtual,6,2) = '12') or (bCalc13DtFim)) and  ( pbPrepararSoMes13 or bCalcula13Agora )
         then begin
             if pbPrepararSoMes13 and
                ((dtmAPrev.qryAuxContrib.FieldByName('FLGCOBRADECTERC').AsInteger = 0) or
                 (dtmAPrev.qryAuxContrib.FieldbyName('FLGCOBRA13DTFIM').AsInteger = 0))
             then begin
                sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
                continue;
             end
             else begin
                  sAnoMesCalc13Aux   := copy(sAnoMesAtual,1,5)+'13';
                  bControleSalario13 := bCalc13DtFim;
                  bCalc13DtFim       := False;
             end
         end
         else sAnoMesCalc13Aux := sAnoMesAtual;

         // Verificar se é para usar a regra de calculo ou se é para usar um valor
         // fixo passado na qry
         if not bValorQry
         then begin
            // Verificar se é o primeiro ou ultimo pagamento. Se for,
            // e nao tiver regra de primeiro/ultimo pagamento,
            // e nao for INSCRICAO, REINSCRICAO, MANUT., MANUT. PARC
            // ou AFASTAMENTO COM MANUTENCAO
            // calcular um pro-rata do salario para passar para a regra
            // normal de calculo da contribuicao
            if (sAnoMesAtual    = sAnoMesInicio) and
               (sAnoMesInicio   < sAnoMesFinal) and
               (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString = '') and
               (Trim(sSalarioPart) <> '') and
               (sFlgIntEvento <> 'IP') and (sFlgIntEvento <> 'RM') and
               (sFlgIntEvento <> 'MP') and (sFlgIntEvento <> 'DM') and
               (sFlgIntEvento <> 'AF') and (sFlgIntEvento <> 'PD')
            then begin
               // Caso esteja calculando para o evento retorno de mantido p/ ativo
               // a data inicio será = a dt atual, mas o pro-rata a ser usado é o
               // último pagto, já que está cálculando as contrib. de Mantido.
               if sFlgVeioDoEvento <> 'RA'
               then sSalarioPart := OraNumero(FloatToStr(ValorProRataPrimeiro(sSalarioPart,psDataInicioBenef)))
               else sSalarioPart := OraNumero(FloatToStr(ValorProRataUltimo(sSalarioPart,psDataFinalBenef)));
            end
            else begin
               if (sAnoMesAtual = sAnoMesFinal) and
                  (psDataFinalBenef <> '')         and
                  (Copy(sAnoMesCalc13Aux,6,2) <> '13') and
                  (sAnoMesDtRefFinal <= sAnoMesLote) and
                  (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString = '') and
                  (Trim(sSalarioPart) <> '') and
                  (sFlgIntEvento <> 'IP') and (sFlgIntEvento <> 'RM') and
                  (sFlgIntEvento <> 'MP') and (sFlgIntEvento <> 'DM') and
                  (sFlgIntEvento <> 'AF') and (sFlgIntEvento <> 'PD')
               then begin
                  sSalarioPart  := OraNumero(FloatToStr(ValorProRataUltimo(sSalarioPart,psDataFinalBenef)));
               end;
            end;

            // Se for INSCRICAO, REINSCRICAO, MANUT., MANUT. PARC
            // ou AFASTAMENTO COM MANUTENCAO
            // buscar salario da HistRubSal, pois já estará reajustado
            // pro-rateado e com teto se for o caso
            if  (sFlgIntEvento = 'IP') or (sFlgIntEvento = 'RM') or
                (sFlgIntEvento = 'MP') or (sFlgIntEvento = 'DM') or
                (sFlgIntEvento = 'AF') or (sFlgIntEvento = 'PD')
            then begin
               // Camille - refer - 16.10.2000
               // Neste momento o 13o. salario está calculado e gravado na HISTRUBSAL,
               // logo o programa deve usar o seu valor para calcular a contribuicao sobre
               // o 13o.
               // Se for ultimo mes da cobranca da contribuicao (evento que ja acabou)
               // e for 13o. entao buscar salario do mes anterior, pois nao é para
               // pegar salario pro-rata
               // Senao, buscar salario do mes que estiver na variavel MesAtual
               if (bControleSalario13)                and
                  (Copy(sAnoMesCalc13Aux,6,2) = '13') and
                  (psDataFinalBenef <> '')               and
                  (sAnoMesAtual   = sAnoMesFinal)     and
                  (sAnoMesFinal  <= sAnoMesLote)
               then begin
                  if (sSitFundacao = 'MA') or (sSitFundacao = 'MP')
                  then sSalarioEncontrado  :=  BuscaSalarioSituacao( piIdPessJur, piIdPlanoPrev,
                                                                     qryContrib.FieldByName('IdPessoa').AsInteger,
                                                                     dtmAPrev.qry,
                                                                     'SALMANTIDO')
                  else sSalarioEncontrado  :=  BuscaSalarioSituacao( piIdPessJur, piIdPlanoPrev,
                                                                     qryContrib.FieldByName('IdPessoa').AsInteger,
                                                                     dtmAPrev.qry,
                                                                     'SALPARTICIPACAO');
               end
               else begin
                  if (Copy(sAnoMesCalc13Aux,6,2) = '13')
                  then sAnoMesBuscaSalario := Copy(sAnoMesCalc13Aux,1,4)+'/12'
                  else sAnoMesBuscaSalario := sAnoMesCalc13Aux;

                  sSalarioEncontrado := BuscaSalario( piIdPessJur, piIdPlanoPrev, qryContrib.FieldByName('IdPessoa').AsInteger,
                                                      sAnoMesBuscaSalario, sSitFundacao,
                                                      sSalarioPart,sMsgErro,
                                                      dtmAPrev.qry);

               end;

               if Trim(sSalarioEncontrado) = ''
               then begin
                  sSalarioEncontrado := '0';
               end;

               // FUNCEF  - 30.07.2001 - Alterado para nao utilizar o FLGSALPRORATA1PG
               sSalarioPart := sSalarioEncontrado;
            end;

            // Montar SQL para regra de calculo
            // Se a SQLRegra passada como parametro estiver em branco, utilizar a
            // funcao MontaSQLContribNOVA
            // Senao, montar sql baseada nos parametros passados
            if Trim(sSQLRegra) = ''
            then begin
                if (StrToInt(copy(psDataInicioBenef,1,2)) >= 29) and
                   (StrToInt(copy(sAnoMesAtual,6,2)) = 2)
                then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                else sDataRef := copy(psDataInicioBenef,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);

                if Copy(sAnoMesCalc13Aux,6,2) = '13'
                then sDataInicioAux := psDataInicioOriginal
                else sDataInicioAux := psDataInicioBenef;

                // Testar se está no mes de 1o. ou ultimo pagamento, e tem regra de primeiro ou ultimo.
                // Se for este o caso, obrigar a usar salario integral, passando como tipo de calculo a letra I
               if // teste de primeiro pagamento
                   ( (sAnoMesAtual = sAnoMesInicio) and
                     (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString <> '') and
                     (Copy(psDataInicioBenef,1,2) <> '01' ) and
                     (
                       (Trim(psDataFinalBenef) = '') or
                       ((Trim(psDataFinalBenef) <> '') and (Copy(psDataInicioBenef,4,7) <> Copy(psDataFinalBenef,4,7)) )
                     )
                   )
               then begin
                  sSQLRegraAux := MontaSQLContribNOVA( piIdPessJur,  piIdPlanoPrev,
                                                       qryContrib.FieldByName('IdPessoa').AsInteger,
                                                       qryContrib.FieldByName('SeqProposta').AsInteger,
                                                       qryContrib.FieldByName('IdContribuicao').AsInteger,
                                                       piIdMotivo,
                                                       sSitFundacao,
                                                       sAnoMesCalc13Aux,
                                                       sDataRef, '0',
                                                       qryContrib.FieldByName('InscricaoData').AsString,
                                                       qryContrib.FieldByName('DataNasc').AsString,
                                                       'P',
                                                       'HSTCONTRIBPREV','VALORESPERADO',
                                                       sSalarioPart, sIdSitPart,
                                                       sDataInicioAux,
                                                       sDataFinalRegra, piOrigem,
                                                       piNumProcesso,sAnoMesCalc13Aux,iIdLoteRetroativo) //leocbs - 29052002 - inumprocesso
               end
               else if ( (sAnoMesAtual = sAnoMesFinal) and // teste de ultimo pagamento
                         (psDataFinalBenef <> '')         and
                         (sAnoMesDtRefFinal <= sAnoMesLote) and
                         (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString <> '')
                        )
                    then sSQLRegraAux := MontaSQLContribNOVA( piIdPessJur,  piIdPlanoPrev,
                                                              qryContrib.FieldByName('IdPessoa').AsInteger,
                                                              qryContrib.FieldByName('SeqProposta').AsInteger,
                                                              qryContrib.FieldByName('IdContribuicao').AsInteger,
                                                              piIdMotivo,
                                                              sSitFundacao,
                                                              sAnoMesCalc13Aux,
                                                              sDataRef, '0',
                                                              qryContrib.FieldByName('InscricaoData').AsString,
                                                              qryContrib.FieldByName('DataNasc').AsString,
                                                              'U',
                                                              'HSTCONTRIBPREV','VALORESPERADO',
                                                              sSalarioPart, sIdSitPart,
                                                              sDataInicioAux,
                                                              sDataFinalRegra, piOrigem,
                                                              piNumprocesso,sAnoMesCalc13Aux,iIdLoteRetroativo) //leocbs - 29052002 - inumprocesso
                    else begin
                       if (Copy(sAnoMesCalc13Aux,6,2) = '13') and (dtmAPrev.qryAuxContrib.FieldbyName('IdRegraCalculo13').AsString <> '')
                       then sSQLRegraAux := MontaSQLContribNOVA( piIdPessJur,  piIdPlanoPrev,
                                      qryContrib.FieldByName('IdPessoa').AsInteger,
                                      qryContrib.FieldByName('SeqProposta').AsInteger,
                                      qryContrib.FieldByName('IdContribuicao').AsInteger,
                                      piIdMotivo,
                                      sSitFundacao,
                                      sAnoMesCalc13Aux,
                                      sDataRef, '0',
                                      qryContrib.FieldByName('InscricaoData').AsString,
                                      qryContrib.FieldByName('DataNasc').AsString,
                                      'N',
                                      'HSTCONTRIBPREV','VALORESPERADO',
                                      sSalarioPart, sIdSitPart,
                                      psDataInicioOriginal,
                                      sDataFinalRegra, piOrigem,piNumProcesso,sAnoMesCalc13Aux,iIdLoteRetroativo) //leocbs - 29052002 - inumprocesso
                       else sSQLRegraAux := MontaSQLContribNOVA( piIdPessJur,  piIdPlanoPrev,
                                                              qryContrib.FieldByName('IdPessoa').AsInteger,
                                                              qryContrib.FieldByName('SeqProposta').AsInteger,
                                                              qryContrib.FieldByName('IdContribuicao').AsInteger,
                                                              piIdMotivo,
                                                              sSitFundacao,
                                                              sAnoMesCalc13Aux,
                                                              sDataRef, '0',
                                                              qryContrib.FieldByName('InscricaoData').AsString,
                                                              qryContrib.FieldByName('DataNasc').AsString,
                                                              'N',
                                                              'HSTCONTRIBPREV','VALORESPERADO',
                                                              sSalarioPart, sIdSitPart,
                                                              sDataInicioAux,
                                                              sDataFinalRegra, piOrigem,
                                                              pinumprocesso,sAnoMesCalc13Aux,iIdLoteRetroativo); //leocbs - 29052002 - inumprocesso
                    end;
            end
            else begin
               sSQLRegraAux := sSQLRegra  +' WHERE '+
                            sAliasSQLRegra+'.IDPESSOA       = '+qryContrib.FieldByName('IdPessoa').AsString+' AND '+
                            sAliasSQLRegra+'.IDPESSJUR      = '+IntToStr(piIdPessJur)  +' AND '+
                            sAliasSQLRegra+'.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+' AND '+
                            sAliasSQLRegra+'.IDCONTRIBUICAO = '+qryContrib.FieldByName('IdContribuicao').AsString+' AND ';
               if sWhereSQLRegra <> ''
               then sSQLRegraAux := sSQLRegraAux + sWhereSQLRegra
               else sSQLRegraAux := Copy(sSQLRegraAux, 1, Length(sSQLRegraAux)-5);
            end;
            //=================================
            //=== Tratamento de décimo terceiro
            //=================================
            if (Copy(sAnoMesCalc13Aux,6,2) = '13') and (dtmAPrev.qryAuxContrib.FieldbyName('IdRegraCalculo13').AsString <> '')
            then sIdRegraCalculo := dtmAPrev.qryAuxContrib.FieldbyName('IdRegraCalculo13').AsString
            else sIdRegraCalculo := dtmAPrev.qryAuxContrib.FieldbyName('IdRegraCalculo').AsString;

            if sIdRegraCalculo   = ''
            then begin
               if Copy(sAnoMesCalc13Aux,6,2) = '13'
               then sMsgErro := 'A regra de cálculo da contribuição sobre 13º não foi associada - '+#13
               else sMsgErro := 'A regra de cálculo da contribuição não foi associada - '+#13;

               sMsgErro := sMsgErro + dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString;
               bErro    := True;
               break;
            end;

            //=== Chamar regra
            //cguedes : valor a ser retornado como parametro pela função CalculaContribuicaoRetro
            // para alimentar qryvirtual de contribuição.
            sValorRegra := RegraNumerica(sIdRegraCalculo,
                                         sSQLRegraAux, bErroRegra, iIdCalculoGeral);
            if bErroRegra
            then begin
               sMsgErro := 'Erro na Execução da Regra de Cálculo de  '+
                            dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+
                            dtmAPrev.qryAuxContrib.FieldbyName('IdRegraCalculo').AsString;
               bErro    := True;
               break;
            end;

            if sValorRegra = ''
            then begin
               sMsgErro := 'A Regra de Cálculo de  '+
                           dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+
                           dtmAPrev.qryAuxContrib.FieldbyName('IdRegraCalculo').AsString+' retornou um valor em branco.';
               bErro    := True;
               break;
            end;

            // Se o valor da contribuicao e o participante nao for assistido -> erro
            // se o participante for assistido nao considerar zero como um erro
            if (sValorRegra = '0') or (sValorRegra = '0.00')
            then begin
               if (sSitFundacao <> 'AS')
               then begin
                  sMsgErro := 'A Regra de Cálculo de  '+
                              dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+
                              dtmAPrev.qryAuxContrib.FieldbyName('IdRegraCalculo').AsString+ ' retornou Zero.';
                  bJaPerguntouContribZERO := True;
                  if (dtmAPrev.qryAuxContrib.FieldbyName('FLGOBRIGATORIA').AsString = 'O') and
                     (not bJaPerguntouContribZERO) and
                     (MsgDlg(sMsgErro+' Confirma que participante não pagará esta contribuição ? ',
                                      'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo)
                  then begin
                     bErro:= True;
                     break;
                  end;
               end
               else begin
                  if ((Copy(sAnoMesAtual,6,2) = '12') and (Copy(sAnoMesCalc13Aux,6,2) <> '13')) or bCalc13DtFim  //  (bCalc13)) or (bCalc13DtFim)
                  then bCalcula13Agora := True // bCalc13 := False
                  else begin
                     sAnoMesAtual    := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
                     bCalcula13Agora := False;
                  end;
                  continue;
               end;
            end;
            sValorFinal := OraNumero(sValorRegra);

            //=================================
            //=== Tratamento de décimo terceiro
            //=================================
            // Verificar se é o primeiro ou ultimo pagamento,
            // para as contribuições sobre 13 (décimo terceiro), se está no mesmo ano
            // Se for Renovacao de beneficio, não chamar regra de pro-rata de 13o.
            // pois a mesma já pode ter sido cobrada. Neste caso o sistema deve calcular
            // o 13o. integral e cobrar a diferença
            if Copy(sAnoMesCalc13Aux,6,2) = '13'
            then begin
               sTpPagto := '';
               if (Copy(sAnoMesAtual,1,4) = Copy(sAnoMesInicio,1,4)) and
                  (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPGTO13').AsString <> '') 
               then begin
                  sTpPagto := 'P';
                  sMsgRegra:= 'Primeiro';
                  sIdRegra := dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPGTO13').AsString;

                  if (StrToInt(copy(psDataInicioBenef,1,2)) >= 29) and
                     (StrToInt(copy(sAnoMesAtual,6,2)) = 2)
                  then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                  else sDataRef := copy(psDataInicioBenef,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);
               end;

               if (Copy(sAnoMesAtual,1,4) = Copy(sAnoMesFinal,1,4)) and
                  (psDataFinalBenef <> '')          and
                  (sAnoMesDtRefFinal  <= sAnoMesLote) and
                  (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPGTO13').AsString <> '')
               then begin
                  sTpPagto := 'U';
                  sMsgRegra:= 'Último';
                  sIdRegra := dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPGTO13').AsString;

                  if (StrToInt(copy(psDataFinalBenef,1,2)) >= 29) and
                     (StrToInt(copy(sAnoMesAtual,6,2))   = 2)
                  then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                  else sDataRef := copy(psDataFinalBenef,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);
               end;

               if sTpPagto <> ''
               then begin
                    sSQLRegraAux  := MontaSQLContribNOVA(piIdPessJur,  piIdPlanoPrev,
                                     qryContrib.FieldByName('IdPessoa').AsInteger,
                                     qryContrib.FieldByName('SeqProposta').AsInteger,
                                     qryContrib.FieldByName('IdContribuicao').AsInteger,
                                     piIdMotivo,
                                     sSitFundacao,
                                     sAnoMesCalc13Aux,
                                     sDataRef,  sValorFinal,
                                     qryContrib.FieldByName('InscricaoData').AsString,
                                     qryContrib.FieldByName('DataNasc').AsString,
                                     sTpPagto,'HSTCONTRIBPREV','VALORESPERADO',
                                     sSalarioPart,sIdSitPart,
                                     // psDataInicioBenef,
                                     psDataInicioOriginal,
                                     sDataFinalRegra, piOrigem,
                                     pinumprocesso,sAnoMesCalc13Aux,iIdLoteRetroativo);//leocbs - 29052002

                    sValorRegra := RegraNumerica(sIdRegra,
                                                 sSQLRegraAux,bErroRegra,iIdCalculoGeral);
                    if bErroRegra
                    then begin
                       sMsgErro := 'Erro na Execução da Regra de Cálculo do '+sMsgRegra+' Pagamento sobre 13º'+
                                   'de  '+dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+sIdRegra;
                       bErro    := True;
                       break;
                    end
                    else if sValorRegra = ''
                         then begin
                            sMsgErro := 'A Regra de Cálculo do '+sMsgRegra+' Pagamento sobre 13º '+
                                        'de '+dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+sIdRegra+
                                        ' retornou um valor em branco';
                            bErro    := True;
                            break;
                         end;

                    if StrToFloat(ClienteNumero(sValorRegra)) >= 0
                    then sValorFinal := sValorRegra;
               end;
            end;

            // Verificar se é o primeiro ou ultimo pagamento, apenas
            // para contribuições fora <> do mês 13 (décimo terceiro)
            if Copy(sAnoMesCalc13Aux,6,2) <> '13'
            then begin
               if (sAnoMesAtual = sAnoMesInicio) and
                  (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString <> '') and
                  (Copy(psDataInicioBenef,1,2) <> '01' ) and
                  (
                    (Trim(psDataFinalBenef) = '') or
                    ((Trim(psDataFinalBenef) <> '') and (Copy(psDataInicioBenef,4,7) <> Copy(psDataFinalBenef,4,7)) )
                  )
               then begin
                  // Se a regra de primeiro pagamento estiver em branco, supor
                  // que o valor do primeiro pagamento é igual ao valor total
                  if (StrToInt(copy(psDataInicioBenef,1,2)) >= 29) and
                     (StrToInt(copy(sAnoMesAtual,6,2)) = 2)
                  then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                  else sDataRef := copy(psDataInicioBenef,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);

                  sSQLRegraAux  := MontaSQLContribNOVA(piIdPessJur,  piIdPlanoPrev,
                                   qryContrib.FieldByName('IdPessoa').AsInteger,
                                   qryContrib.FieldByName('SeqProposta').AsInteger,
                                   qryContrib.FieldByName('IdContribuicao').AsInteger,
                                   piIdMotivo,
                                   sSitFundacao,
                                   sAnoMesCalc13Aux,
                                   sDataRef, sValorFinal,
                                   qryContrib.FieldByName('InscricaoData').AsString,
                                   qryContrib.FieldByName('DataNasc').AsString,
                                   'P','HSTCONTRIBPREV','VALORESPERADO',
                                   sSalarioPart,
                                   sIdSitPart,
                                   psDataInicioBenef,
                                   sDataFinalRegra, piOrigem,
                                   pinumprocesso,sAnoMesCalc13Aux,iIdLoteRetroativo); //leocbs - 29052002 - inumprocesso

                  sValorRegra := RegraNumerica(dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString,
                                               sSQLRegraAux,bErroRegra,iIdCalculoGeral);

                  if bErroRegra
                  then begin
                     sMsgErro := 'Erro na Execução da Regra de Cálculo do Primeiro Pagamento '+
                                 'de  '+dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+
                                 dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString;
                     bErro    := True;
                     break;
                  end
                  else if sValorRegra = ''
                       then begin
                          sMsgErro := 'A Regra de Cálculo do Primeiro Pagamento '+
                                      'de  '+dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+
                                      dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString+
                                      ' retornou um valor em branco';
                          bErro    := True;
                          break;
                       end;

                  if StrToFloat(ClienteNumero(sValorRegra)) >= 0
                  then sValorFinal := sValorRegra;
               end;  // if MesAtual = MesInicio

               if (sAnoMesAtual = sAnoMesFinal) and
                  (psDataFinalBenef <> '')         and
                  (sAnoMesDtRefFinal <= sAnoMesLote) and
                  (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString <> '')
               then begin
                     if (StrToInt(copy(psDataFinalBenef,1,2)) >= 29) and
                        (StrToInt(copy(sAnoMesAtual,6,2))   = 2)
                     then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                     else sDataRef := copy(psDataFinalBenef,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);

                     sSQLRegraAux  := MontaSQLContribNOVA(piIdPessJur,  piIdPlanoPrev,
                                      qryContrib.FieldByName('IdPessoa').AsInteger,
                                      qryContrib.FieldByName('SeqProposta').AsInteger,
                                      qryContrib.FieldByName('IdContribuicao').AsInteger,
                                      piIdMotivo,
                                      sSitFundacao,
                                      sAnoMesCalc13Aux,
                                      sDataRef, sValorFinal,
                                      qryContrib.FieldByName('InscricaoData').AsString,
                                      qryContrib.FieldByName('DataNasc').AsString,
                                      'U','HSTCONTRIBPREV','VALORESPERADO',
                                      sSalarioPart,
                                      sIdSitPart,
                                      psDataInicioBenef,
                                      sDataFinalRegra, piOrigem,
                                      pinumprocesso,sAnoMesCalc13Aux,iIdLoteRetroativo); //leocbs - 29052002 - inumprocesso

                     sValorRegra := RegraNumerica(dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString,
                                                  sSQLRegraAux,bErroRegra,iIdCalculoGeral);
                     if bErroRegra
                     then begin
                        sMsgErro := 'Erro na Execução da Regra de Cálculo do Último Pagamento '+
                                    'de  '+dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+
                                    dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString;
                        bErro    := True;
                        break;
                     end
                     else if sValorRegra = ''
                          then begin
                             sMsgErro := 'A Regra de Cálculo do Último Pagamento '+
                                         'de  '+dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+
                                         dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString+
                                         ' retornou um valor em branco.';
                             bErro    := True;
                             break;
                          end;
                     if StrToFloat(ClienteNumero(sValorRegra)) >= 0
                     then sValorFinal := sValorRegra;
              end; // if MesAtual = MesInicio

              //=================================
              //=== Tratamento de décimo terceiro
              //=================================
              //== Verifica se é o último pagamento, independente de ter ou não
              //==  regra de cálculo preenchida, e se deve calcular contrib. 13, no final da contribuição.
              // CGUEDES - 18/10/2001 - CBS
              if (piOrigem <> 2) and (piOrigem <> 3) then
              begin
                if psDataFinalBenef <> ''
                then begin
                   sAnoMesDtRefFinal :=  Copy(psDataFinalBenef,7,4)+'/'+Copy(psDataFinalBenef,4,2);
                   if (sAnoMesAtual   =  sAnoMesDtRefFinal) and
                      (sAnoMesFinal  <= sAnoMesLote)        and
                      (dtmAPrev.qryAuxContrib.FieldbyName('FlgCobra13DtFim').AsInteger = 1)
                   then bCalc13DtFim := True;
                end;
              end
              else begin
                if psDataFinalBenef <> ''
                then begin
                   sAnoMesDtRefFinal :=  Copy(psDataFinalBenef,7,4)+'/'+Copy(psDataFinalBenef,4,2);
                   if (sAnoMesAtual   =  sAnoMesDtRefFinal) and
                      (sAnoMesFinal  <= sAnoMesLote)        and
                      (piFlgDtFinalPrevista = 0 )           and
                      (dtmAPrev.qryAuxContrib.FieldbyName('FlgCobra13DtFim').AsInteger = 1)
                   then bCalc13DtFim := True;
                end;
              End;
            end; // fim contribuicao <> 13
         end  // if not bValorQry
         else sValorFinal := qryContrib.FieldByName('Valor').AsString;

         if StrToFloat(ClienteNumero(sValorFinal) ) <= 0
         then begin
            if ((Copy(sAnoMesAtual,6,2) = '12') and (Copy(sAnoMesCalc13Aux,6,2) <> '13')) or bCalc13DtFim  //  (bCalc13)) or (bCalc13DtFim)
            then bCalcula13Agora := True // bCalc13 := False
            else begin
               sAnoMesAtual    := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
               bCalcula13Agora := False;
            end;

            // continuar loop
            continue;
         end;


         //leocbs - 28052002 - inicio
         //verifica se o último último mês já havia sido tratado pela devolução
         dtmAPrev.qry.Close;
         dtmAPrev.qry.Sql.Clear;
         dtmAPrev.qry.Sql.Add(' SELECT /*+ INDEX (HSTCONTRIBPREV XAK1HSTCONTRIBPREV) */ '+ // UTILIZACAO OBRIGATORIA DE INDICE
                           '        1 FROM HSTCONTRIBPREV '+
                           ' WHERE  MESREFERENCIA  = '''+sAnoMesCalc13Aux+''' '+
                           ' AND    MESCOBRANCA    = '''+sAnoMesLote+''' '+
                           ' AND    IDPESSOA       = '+qryContrib.FieldByName('IdPessoa').AsString+
                           ' AND    SEQPROPOSTA    = '+qryContrib.FieldByName('SeqProposta').AsString+
                           ' AND    IDCONTRIBUICAO = '+qryContrib.FieldByName('IdContribuicao').AsString+
                           ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                           ' AND    IDPESSJUR      = '+IntToSTr(piIdPessJur)+
                           ' AND    IDMOTIVO       = '+IntToStr(piIdMotivo));
         dtmAPrev.qry.Open;

         if not dtmAPrev.qry.isempty then
         begin
            bInsereHst := false;
         end
         else
         begin
            // Verifica se já a contribuicao já foi calculada para o mes informado
            // com excessao do caso da contribuicao ser exclusiva da patrocinadora,
            // pois neste caso, mesmo que a contribuicao
            // já tenha sido calculada, ela deverá ser calculada novamente, apenas para
            // um participante.
            if (sSitFundacao <> 'PT')
            then begin
               dtmAPrev.qry.Close;
               dtmAPrev.qry.Sql.Clear;
               dtmAPrev.qry.Sql.Add(' SELECT /*+ INDEX (HSTCONTRIBPREV XAK1HSTCONTRIBPREV) */ '+ // UTILIZACAO OBRIGATORIA DE INDICE
                              '        SUM(VALORESPERADO) AS VALORESPERADO, SUM(VALORRECEBIDO) AS VALORRECEBIDO FROM HSTCONTRIBPREV '+
                              ' WHERE  MESREFERENCIA  = '+''''+sAnoMesCalc13Aux+''''+
                              ' AND    IDPESSOA       = '+qryContrib.FieldByName('IdPessoa').AsString+
                              ' AND    SEQPROPOSTA    = '+qryContrib.FieldByName('SeqProposta').AsString+
                              ' AND    IDCONTRIBUICAO = '+qryContrib.FieldByName('IdContribuicao').AsString+
                              ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                              ' AND    IDPESSJUR      = '+IntToSTr(piIdPessJur));
               dtmAPrev.qry.Open;
            end;

            bInsereHst    := True;
            sFlgDevolucao := '0';

            // Se já existir valor no histórico, inserir valor com a diferença
            if (sSitFundacao = 'PT') or (dtmAPrev.qry.IsEmpty)  or
               ((piOrigem = 3) and (Copy(sAnoMesCalc13Aux,6,2) <> '13')  )
            then begin
               sValorFinal := sValorFinal;
            end
            else begin
               dDiferenca := StrToFloat(ClienteNumero(sValorFinal)) - dtmAPrev.qry.FieldByName('VALORESPERADO').AsFloat;

               if Abs(dDiferenca) < 0.01
               then begin
                  dDiferenca := 0;
                  bInsereHst := False;
               end
               else begin
                  bInsereHst := True;
                  if dDiferenca > 0
                  then sFlgDevolucao := '0'
                  else begin
                     sFlgDevolucao := '1';
                     dDiferenca    := -dDiferenca;
                  end
               end;
               sValorFinal := FormatFloat('#0.00',dDiferenca);
            end;
         end;
         //leocbs - 28052002 - fim

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
         //=================================
         //=== Tratamento de décimo terceiro
         //=================================
         if (dtmAPrev.qryAuxContrib.FieldByName('FLGCOBRADECTERC').AsInteger = 1) and
            ((copy(sAnoMesAtual,6,2) = '12')  or (bCalc13DtFim)                 ) and
            ((Copy(sAnoMesCalc13Aux,6,2) <> '13'))
         then begin
            bCalcula13Agora := True;
            if pbPrepararSoMes13
            then sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
         end
         else begin
            sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
            bCalcula13Agora := False;
         end;
      end;// while mesatual < mesfinal

      if bErro then break;

      if sSitFundacao <> 'PT'
      then begin
         if not AtualizaUltMesPREPARO( sUltAnoMesPreparo, // sAnoMesFinal,
                                       piIdPessJur,
                                       piIdPlanoPrev,
                                       qryContrib.FieldbyName('IdPessoa').AsInteger,
                                       qryContrib.FieldbyName('SeqProposta').AsInteger,
                                       qryContrib.FieldByName('IdContribuicao').AsInteger)
         then begin
            sMsgErro := ' Erro na gravação do Último Mês de Preparo. ';
            bErro    := True;
            break;
         end;
      end;

      qryContrib.next;
   end; //while
   qryContrib.Close;
   Result    := bErro;
end;

function  TfrmRetroativoPrev.PreparaRetroativo : boolean;
var sFiltro            : string;
    iTipoRetroativo    : longint;
    bResultado         : Boolean;
    iResultado         : Integer;
    iTotalPessoas      : longint;
    iTotalPessoasProc  : longint;
    iTotalGeralPessoas : longint;
    sAnoMesLoop, sIdContribuicaoLoop, sMatriculas        : string;

begin
   Result      := False;
   sFiltro     := '';
   sMatriculas := '';
             
   sSql := ' ';

   // Tipos de Retroativo
   // 1 = Revisao de Beneficios
   // 2 = Revisao de Salarios e Contribuicoes
   if rbRecalcBenef.Checked
   then iTipoRetroativo := 1
   else iTipoRetroativo := 2;

{   if rbAltCadastral.Checked
   then iTipoRetroativo := 1
   else if rbAltFuncional.Checked
   then iTipoRetroativo := 2
   else if rbAltOpContrib.Checked
   then iTipoRetroativo := 3
   else if rbAltTipoBenef.Checked
   then iTipoRetroativo := 4
   else if rbAltBenefOrdJud.Checked
   then iTipoRetroativo := 5
   else if rbRecalcBenef.Checked
   then iTipoRetroativo := 6
   else if rbRevisaoContribuicao.Checked
   then iTipoRetroativo := 7
   else if rbReajusteBeneficio.Checked
   then iTipoRetroativo := 8;
}
   If rbnLote.Checked
   then GravaLogTOTALPREV ('Cálculo Retroativo - Opção : '+IntToStr(iTipoRetroativo)+' - Tipo : Em Lote')
   else GravaLogTOTALPREV ('Cálculo Retroativo - Opção : '+IntToStr(iTipoRetroativo)+' - Tipo : Individual Matrícula : '+MontaSelect.ValoresChave[15]); // Gleyber - 25/03/2004 - Pendência 16213

   { Inicio Augusto 07/03/2005 - Somente caso em Lote }
   if Not rbtnIndividual.Checked and (rbRecalcBenef.Checked Or rbRevisaoContribuicao.Checked)
   then begin
     sContribuicoes := '';
     qryContribuicao.First;
     while not qryContribuicao.Eof do begin
        if qryContribuicao.FieldbyName('PROCESSA').AsInteger = 1
        then begin
           if Trim(sContribuicoes) = ''
           then sContribuicoes := qryContribuicao.FieldbyName('IDCONTRIBUICAO').AsString
           else sContribuicoes := sContribuicoes +','+ qryContribuicao.FieldbyName('IDCONTRIBUICAO').AsString;
        end;
        qryContribuicao.Next;
     end;
   End;
   { Fim Augusto 07/03/2005 }

   { Bruno Bastos - Pend. 18811 - 15/03/2005
     Foi colocado este if para entrar nesse código, somente quando
     for revisão de benefícios                }
   If rbRevisaoContribuicao.Checked = False Then
   Begin
     if rbtnIndividual.Checked and rbRecalcBenef.Checked
     then begin
        sBeneficios := '';
        qryDadosBeneficio.First;
        while not qryDadosBeneficio.Eof do
        begin
           if qryDadosBeneficio.FieldbyName('PROCESSA').AsInteger = 1
           then begin
              if Trim(sBeneficios) = ''
              then sBeneficios := qryDadosBeneficio.FieldbyName('IDBENEFICIO').AsString
              else sBeneficios := sBeneficios +','+ qryDadosBeneficio.FieldbyName('IDBENEFICIO').AsString;
           end;
           qryDadosBeneficio.Next;
        end;
     end
     else begin
        sBeneficios := '';
        qryBeneficioEscolher.First;
        while not qryBeneficioEscolher.Eof do
        begin
           if qryBeneficioEscolher.FieldbyName('PROCESSA').AsInteger = 1
           then begin
              if Trim(sBeneficios) = ''
              then sBeneficios := qryBeneficioEscolher.FieldbyName('IDBENEFICIO').AsString
              else sBeneficios := sBeneficios +','+ qryBeneficioEscolher.FieldbyName('IDBENEFICIO').AsString;
           end;
           qryBeneficioEscolher.Next;
        end;


        if sBeneficios = ''
        then begin
           qryBeneficioEscolher.First;
           while not qryBeneficioEscolher.Eof do
           begin
              if Trim(sBeneficios) = ''
              then sBeneficios := qryBeneficioEscolher.FieldbyName('IDBENEFICIO').AsString
              else sBeneficios := sBeneficios +','+ qryBeneficioEscolher.FieldbyName('IDBENEFICIO').AsString;
              qryBeneficioEscolher.Next;
           end;
        end;
     end;
   End;


   // VERIFICAR RETROATIVOS JÁ PROCESSADOS - CAMILLE - 28.10.2004
   bRefazExistentes   := False;

   { Inicio Augusto 13/06/2006 - Sempre montar os SQL das matriculas caso seja }
   { selecionado arquivo externo.                                              }
   if chkListaPessoas.Checked then begin
     try
        AssignFile(X, edListaPessoas.Text);
        Reset(X);
     except
        frmAguarde.Apaga;
        MsgDlg('Erro ao abrir arquivo. Verifique.','Erro',mtError,[mbOK],0);
        Result := False;
        Exit;
     end;

     sMatriculas := MontaStringMatriculas;
   end;
   { Fim Augusto 13/06/2006                                                    }

   if ( rbRecalcBenef.Checked )and ( rbnLote.Checked )
   then begin
      with qryAux do
      begin
         Close;
         SQL.Clear;


         //leofuncef - 03022005 - refiz o código abaixo para verificar a HSTBENEFBFCIARIO ao invés
         //da MOVBENEF
         SQL.Add(' SELECT  COUNT(DISTINCT HB.IDPESSOA) AS TOTAL '+
                 ' FROM   HSTBENEFBFCIARIO HB, DEPENTIT DP, PARTPREVPLAN PPP  '+ { Augusto 08/02/2006 }
                 ' WHERE  HB.IDBENEFICIO IN ('+sBeneficios+')     ');

         SQL.Add(' AND    HB.IDLOTE IN (SELECT IDLOTE FROM CTRLINTERFACE '+
                 '                       WHERE TO_CHAR(DATAPAGAMENTO,''YYYY/MM'') = (SELECT TO_CHAR(DATAPAGAMENTO,''YYYY/MM'') '+
                 '				FROM CTRLINTERFACE '+
                 '				WHERE IDLOTE = '+OraNumero(qryLote.FieldbyName('IDLOTE').AsString)+' ) )  ');

         if dblkpcmbPatro.Text <> ''
         then SQL.Add(' AND HB.IDPESSJUR = '+qryPatro.FieldByName('IDPESSOA').AsString );

         if dblkpcmbPlano.Text <> ''
         then SQL.Add(' AND HB.IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString );

         { Inicio Augusto 08/02/2006  }
         SQL.Add('  AND HB.IDTITULAR = DP.IDTITULAR ' +
                 '  AND HB.IDPESSOA  = DP.IDPESSOA  ' );

         SQL.Add('  AND HB.IDTITULAR   = PPP.IDPESSOA     '+
                 '  AND HB.IDPESSJUR   = PPP.IDPESSJUR    '+
                 '  AND HB.IDPLANOPREV = PPP.IDPLANOPREV  '+
                 '  AND HB.SEQPROPOSTA = PPP.SEQPROPOSTA  ');


         if chkListaPessoas.Checked then begin
           If ( RdBtnMatricula.Checked = True )
           Then SQL.Add(' AND DP.MATRICULA IN ('+sMatriculas+')')
           Else SQL.Add(' AND PPP.INSCRICAONUMERO IN ('+sMatriculas+')');
         end;
         { Fim Augusto 08/02/2006     }

         Open;
         if (not IsEmpty) and (FieldByName('TOTAL').AsInteger > 0)
         then begin
            if MsgDlg('Existem '+FieldByName('TOTAL').AsString+' processos de revisão, migração de plano ou concessão '+#13+
                      'para lotes com mesmo pagamento do lote selecionado. '+#13+
                      'Deseja revisar estes casos ? ','Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrYes
            then bRefazExistentes   := True;
         end;

      end;

   end;
   // CAMILLE - 28.10.2004 - VERIFICAR RETROATIVOS JÁ PROCESSADOS - FIM

   with qryPessoasATratar do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT PP.IDPESSOA AS IDTITULAR,   DP.MATRICULA,   PP.INSCRICAONUMERO, PP.IDPESSJUR,         '+
              '        DP.IDPESSOA, PP.SEQPROPOSTA,       '+
              '        DECODE(SP.FLGINTERNO, ''AT'', ''Ativo'',                  '+
              '                              ''MA'', ''Mantido'',                '+
              '                              ''MP'', ''Mantido Parcial'',        '+ //PR-09/08/2007
              '                              ''MS'', ''Saldo de Conta'',         '+ //PR-09/08/2007
              '                              ''CA'', ''Cancelado'',              '+
              '                              DECODE(PF.DATAMORTE,NULL,''Assistido'',''Falecido'' '+
              '                              ) ) AS SITUACAOHOJE,   '+
              '        P.NOME ');

      If ( Not rbRevisaoContribuicao.Checked )
      Then SQL.Add( '      ,NVL(B.IDPLANOPREV, PP.IDPLANOPREV) AS IDPLANOPREV, '+
                    '       NVL(B.IDRESPONSAVEL, DP.IDPESSOA) AS IDRESPONSAVEL        ' )
      Else SQL.Add( '      ,PP.IDPLANOPREV AS IDPLANOPREV, '+
                    '       DP.IDPESSOA AS IDRESPONSAVEL        ' );



      SQL.Add( ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP, '+
               '        SITPART SP , DEPENTIT DP ');

      {------------------------------------------------------------------------}
      { Augusto 08/06/2007                                                     }

      If ( Not rbRevisaoContribuicao.Checked ) Then
      Begin
        SQL.Add(', ( SELECT    DISTINCT B.IDPESSOA, B.IDPLANOPREV, B.IDPLANOORIGEM, BT.IDRESPONSAVEL '+
                '     FROM      BENEFBFCIARIO B, BFCIARIOTITPLAN BT '+
                '     WHERE ');

      If ( ( Trim( dtDIBInicioLote.Text ) <> '') And ( Trim( dtDIBFinalLote.Text ) <> '') ) Then Begin

          SQL.Add(' ( B.DATAINICIOFUND BETWEEN TO_DATE(' +QuotedStr(dtDIBInicioLote.Text)+ ',' + '''DD/MM/YYYY'') AND ' +
                  '                            TO_DATE(' +QuotedStr(dtDIBFinalLote.Text) + ',' + '''DD/MM/YYYY'')  ) AND ');

      End;

      if ( rbtnIndividual.Checked = True )
      Then SQL.Add(' B.IDPLANOORIGEM = '+IntToStr(iIdPlanoOrigem)+ ' AND ' );
                                         

      if dblkpcmbPatro.Text <> ''
      then begin
         SQL.Add(' B.IDPESSJUR = '+qryPatro.FieldByName('IDPESSOA').AsString+ ' AND ' );
      end;

      if dblkpcmbPlano.Text <> ''
      then begin
         SQL.Add(' B.IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString+ ' AND ' );
      end;

      SQL.Add('              BT.IDPESSJUR      = B.IDPESSJUR '+
              '       AND    BT.SEQPROPOSTA    = B.SEQPROPOSTA '+
              '       AND    BT.IDPLANOPREV    = B.IDPLANOPREV '+
              '       AND    BT.IDTITULAR      = B.IDTITULAR '+
              '       AND    BT.IDPESSOA       = B.IDPESSOA '+
              '       AND    BT.IDBENEFICIO    = B.IDBENEFICIO '+
              '       AND    BT.IDPLANOORIGEM  = B.IDPLANOORIGEM ');

      If ( Trim( sBeneficios ) <> '' ) And
         ( rbRecalcBenef.Checked ) and ( rbnLote.Checked )
      Then Begin
        SQL.Add(' AND    B.IDBENEFICIO IN ('+sBeneficios+')     ' );
      End;

      If ( Not ChBxProcessaEncerrados.Checked )
      Then SQL.Add(' AND IDSITBENEFICIO IN (1, 2) ) B ')
      Else SQL.Add(' AND IDSITBENEFICIO IN (1, 2, 3) ) B ');

      End;
      { Augusto 08/06/20076                                                    }
      {------------------------------------------------------------------------}

      if rbtnIndividual.Checked
      then begin
         SQL.Add(' WHERE PP.IDPESSJUR   = '+IntToStr(iIdPessJur)+
                 ' AND   PP.IDPLANOPREV = '+IntToStr(iIdPlanoOrigem)+ { Augusto 25/05/2004 - Era iIdPlanoPrev }
                 ' AND   PP.IDPESSOA    = '+IntToStr(iIdTitular)+
                 ' AND   PP.SEQPROPOSTA = '+IntToStr(iSeqProposta)+
                 ' AND   DP.IDPESSOA    = '+IntToStr(iIdPessoa));
      end
      else begin

        { Inicio 24/01/2007 - No tratamento de lista de matriculas tbm utilizar }
        { os filtros da tela.                                                   }

        if dblkpcmbPatro.Text <> ''
        then begin
           if Trim(sFiltro) = ''
           then sFiltro := 'WHERE PP.IDPESSJUR = '+qryPatro.FieldByName('IDPESSOA').AsString
           else sFiltro := sFiltro + 'AND PP.IDPESSJUR = '+qryPatro.FieldByName('IDPESSOA').AsString;
        end;

        if not rbRecalcBenef.Checked then //leofuncef - 03022005 - caso recalcule benefícios, não fixar o plano na partprevplan,
        begin                             //caso seja em lote e o usuário selecionar plano, faço isso no beneficiário, logo abaixo
           if dblkpcmbPlano.Text <> ''
           then begin
              if Trim(sFiltro) = ''
              then sFiltro := 'WHERE PP.IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString
              else sFiltro := sFiltro + 'AND PP.IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString;
           end;

        end;
        //leofuncef - 03022005 - fim

        If ( Not rbRevisaoContribuicao.Checked )
        Then Begin

        if Trim(sFiltro) <> ''
          then sFiltro := sFiltro + ' AND PP.IDPLANOPREV = B.IDPLANOORIGEM '
          else sFiltro := 'WHERE PP.IDPLANOPREV = B.IDPLANOORIGEM '; { Augusto 06/03/2007 }

        End;

        if chkListaPessoas.Checked
        then begin
           If ( RdBtnMatricula.Checked = True ) Then
           Begin
            if Trim(sFiltro) <> ''
            then SQL.Add(sFiltro + ' AND DP.MATRICULA IN ('+sMatriculas+')')
            else SQL.Add('WHERE DP.MATRICULA IN ('+sMatriculas+')');
           End
           Else
           Begin
             if Trim(sFiltro) <> ''
             then SQL.Add(sFiltro + ' AND PP.INSCRICAONUMERO IN ('+sMatriculas+')')
             else SQL.Add('WHERE PP.INSCRICAONUMERO IN ('+sMatriculas+')');
           End;

        End Else Begin

          SQL.Add( sFiltro );

        end;

        { Fim 24/01/2007                                                        }

      end;

      // Gleyber - 11/12/2002 - Início
      { Augusto 26/07/2004 - Retirei o sSQL + }



      { Augusto 08/06/20076 }
      If ( rbRecalcBenef.Checked )
      Then sSql := ' AND   B.IDPESSOA    = DP.IDPESSOA ';

      sSQL := sSQL +
              ' AND   DP.IDTITULAR     = PP.IDPESSOA '+
              ' AND   P.IDPESSOA       = DP.IDPESSOA '+
              //leofuncef - 02022005 - fim

              ' AND   EL.IDPESSJUR     = PP.IDPESSJUR      '+
              ' AND   EL.IDPESSOA      = PP.IDPESSOA       ';

      { Inicio Augusto - 11/01/2007 - Permitir revisar planos desativados            }

      { Inicio Augusto - 23/10/2006 - Caso seja revisão de salário de contribuição   }
      { não filtrar plano ativo, por causa dos migrados que revisarão o plano antigo }
      //If ( rbRevisaoContribuicao.Checked = False )
      //Then sSQL := sSQL + ' AND   PP.FLGDESATIVADO = 0                 ';

      { Fim Augusto - 11/01/2007                                                     }

      { Augusto - 14/06/2007 - Testar opção por filtrar planos ativos }
      If ( ChBxSomentePlanoAtivo.Checked = True )
      Then sSQL := sSQL + ' AND   PP.FLGDESATIVADO = 0                 ';

      sSQL := sSQL +
              ' AND   PF.IDPESSOA      = PP.IDPESSOA       '+
              ' AND   SP.IDSITPART     = PP.IDSITPART      ';

      { Inicio Augusto - 13/06/2006 - Caso seja revisão de salário de contribuição }
      { busca somente os participantes.                                            }
      If ( rbRevisaoContribuicao.Checked = True ) Then Begin

        sSql := sSql + ' AND DP.IDTITULAR = DP.IDPESSOA ';

      End;
      { Fim Augusto - 13/06/2006                                                   }


      If rbnLote.Checked
      Then Begin
         { Augusto 27/04/2004 - Povisorio até definir data de incrição na migração de plano }
         //sSql := sSql + ' AND   ((TO_CHAR(PP.INSCRICAODATA, ''YYYY/MM'') <= '''+edAnoMesIni.Text+''') OR (PP.INSCRICAODATA IS NULL))';

         { Augusto 01/07/2004 }
         //sSql := sSql + ' AND   ((PP.DATACANCELAMENTO IS NULL) OR (TO_CHAR(PP.DATACANCELAMENTO, ''YYYY/MM'') >= '''+edAnoMesIni.Text+''') )';
      end
      Else Begin
         { Augusto 27/04/2004 - Povisorio até definir data de incrição na migração de plano }

         { Augusto 01/07/2004 }
         //sSql := sSql + ' AND   ((TO_CHAR(PP.INSCRICAODATA, ''YYYY/MM'') <= '''+edAnoMesIni.Text+''') OR (PP.INSCRICAODATA IS NULL))';
         //sSql := sSql + ' AND   ((PP.DATACANCELAMENTO IS NULL) OR (TO_CHAR(PP.DATACANCELAMENTO, ''YYYY/MM'') >= '''+edAnoMesIni.Text+''') )';
      end;

      if rbRecalcBenef.Checked
      then if rbnLote.Checked
           then begin
              sSql := sSql + ' AND   EXISTS ( SELECT HB.IDTITULAR        '+
                             '                FROM   HSTBENEFBFCIARIO HB, BENEFBFCIARIO BB       '+
                             '                WHERE  HB.MESREFERENCIA >= '''+edAnoMesIni.Text+''''+
                             '                AND    HB.MESREFERENCIA <= '''+edAnoMesFim.Text+''''+
                             { Augusto 12/12/2003 - Melhorar performance }
                             '                AND    ( (BB.DATAFINAL IS NULL) OR (TO_CHAR(BB.DATAFINAL, ''YYYY/MM'') >= '''+edAnoMesIni.Text+''') )';
              sSQL := sSQL + '                AND    HB.IDBENEFICIO IN ('+sBeneficios+')          '+
                             '                AND    HB.IDPESSJUR     = PP.IDPESSJUR              '+
                             '                AND    HB.IDTITULAR     = PP.IDPESSOA               '+
                             '                AND    HB.IDPESSOA = DP.IDPESSOA                    ';//leofuncef - 03022005


                             //'    AND    HB.IDPLANOPREV   = PP.IDPLANOPREV            '+ //leofuncef - 02022005 - não pode "fechar" o plano, o beneficiário pode estar em plano diferente do titular
                             if (not rbtnIndividual.Checked) and (dblkpcmbPlano.Text <> '') then
                             begin
                                sSQL := sSQL + 'AND BB.IDPLANOPREV = '''+qryPlano.FieldByName('IDPLANOPREV').AsString+''' ';
                             end;
                             //leofuncef - 02022005 - fim


              sSQL := sSQL + '   AND BB.IDSITBENEFICIO = 1 '; //leofuncef - 030202005 - PROVISORIO



              sSQL := sSQL + '                AND    HB.SEQPROPOSTA   = PP.SEQPROPOSTA            '+
                             { Augusto 12/12/2003 - Melhorar performance }
                             '                AND    HB.IDPESSJUR   = BB.IDPESSJUR            '+
                             '                AND    HB.IDPLANOPREV = BB.IDPLANOPREV          '+
                             '                AND    HB.IDTITULAR   = BB.IDTITULAR            '+
                             '                AND    HB.IDPESSOA    = BB.IDPESSOA             '+
                             '                AND    HB.IDBENEFICIO = BB.IDBENEFICIO          '+
                             '                AND    HB.IDPLANOORIGEM  = BB.IDPLANOORIGEM     '+
                             '                AND    HB.NUMEROPROCESSO = BB.NUMEROPROCESSO    '+
                             '                AND    HB.SEQPROPOSTA    = BB.SEQPROPOSTA)      ';
           end
           else Begin

                (* Augusto 26/05/2004 - Retirado pois existem beneficios que não estão no HST e precisam
                                        ser revisados
                sSql := sSql + ' AND   EXISTS ( SELECT HB.IDTITULAR        '+
                               '                FROM   HSTBENEFBFCIARIO HB ';

                { Augusto 30/03/2004 - Não pesquisar mais no historico }
                //sSQL := sSQL + '                WHERE  HB.MESREFERENCIA >= '''+edAnoMesIni.Text+''''+
                //               '                AND    HB.MESREFERENCIA <= '''+edAnoMesFim.Text+'''';
                sSQL := sSQL + '                WHERE  HB.IDBENEFICIO IN ('+sBeneficios+')          '+
                               '                AND    HB.IDPESSJUR     = PP.IDPESSJUR              '+
                               '                AND    HB.IDTITULAR     = PP.IDPESSOA               '+
                               '                AND    HB.IDPLANOORIGEM = PP.IDPLANOPREV ' +  // Augusto - 26/05/2004 volta do IDPLANOORIGEM
                               '                AND    HB.SEQPROPOSTA   = PP.SEQPROPOSTA )          ';
                *)
           End;

      if not rbRecalcBenef.Checked
      then begin
         case rgrpTipoSituacao.ItemIndex of
              1 : sSQL := sSQL + ' AND SP.FLGINTERNO IN (''AT'',''MP'') ';
              2 : sSQL := sSQL + ' AND SP.FLGINTERNO = ''MA''           ';
              3 : sSQL := sSQL + ' AND SP.FLGINTERNO = ''AS''           ';
              4 : sSQL := sSQL + ' AND SP.FLGINTERNO = ''CA''           ';
         end;
      end;

      //sSQL := sSQL + '       AND    PP.IDPLANOPREV    = NVL(B.IDPLANOPREV, PP.IDPLANOPREV) ';    // Gleyber - 30/01/2007 - Pendência 24350

      // CAMILLE - 28.10.2004
      // VERIFICAR RETROATIVOS JÁ PROCESSADOS
      if rbRecalcBenef.Checked and rbnLote.Checked and (not bRefazExistentes)
      then begin

         //leofuncef - 03022005 - substitui o bloco abaixo
         sSQL := sSQL + ' AND   NOT EXISTS ( SELECT HB.IDTITULAR '+
                        '                    FROM HSTBENEFBFCIARIO HB '+
                        '                    WHERE  HB.IDPESSJUR     = PP.IDPESSJUR    '+
                        '                    AND    HB.IDTITULAR     = PP.IDPESSOA     '+
                        '                    AND    HB.SEQPROPOSTA   = PP.SEQPROPOSTA   '+
                        '                    AND    HB.IDPESSOA      = DP.IDPESSOA   '+
                        '                    AND    HB.IDBENEFICIO IN ('+sBeneficios+')     '+
                        '                    AND    HB.IDLOTE IN (SELECT IDLOTE FROM CTRLINTERFACE '+
                        '                                         WHERE TO_CHAR(DATAPAGAMENTO,''YYYY/MM'') = (SELECT TO_CHAR(DATAPAGAMENTO,''YYYY/MM'') '+
                        '           				                                              FROM CTRLINTERFACE '+
                        '  	  				                                              WHERE IDLOTE = '+OraNumero(qryLote.FieldbyName('IDLOTE').AsString)+' ) ) ) ';


         {sSQL := sSQL +   ' AND NOT EXISTS ( SELECT 1                                     '+
                        '                  FROM   MOVBENEF                              '+

                        //leofuncef - 25012005
                        //modifiquei a checagem para abranger não só revisões para o mesmo lote, e sim
                        //concessões, migrações e outros processos que geram pagamento de benefício
                        //' WHERE  TIPOMOV   = 13   AND                 '+
                        ' WHERE    IDLOTEMOV IN (SELECT IDLOTE FROM CTRLINTERFACE '+
                        '                       WHERE FLGCONCESSAO = 1 AND '+
                        '                       TO_CHAR(DATAPAGAMENTO,''YYYY/MM'') = (SELECT TO_CHAR(DATAPAGAMENTO,''YYYY/MM'') '+
                        '				FROM CTRLINTERFACE '+
                        '				WHERE IDLOTE = '+OraNumero(qryLote.FieldbyName('IDLOTE').AsString)+' ) ) '+
                        //leofuncef - 25012005 - fim

                        '                  AND    IDPESSJUR = PP.IDPESSJUR              '+
                        '                  AND    IDTITULAR = PP.IDPESSOA  )           ';}
      end;

      sSql := sSql + ' ORDER BY PP.IDPESSJUR, PP.IDPLANOPREV, EL.MATRICULA  ';
      SQL.Add(sSql);
      // qryPessoasATratar.SQL.SAVETOFILE('C:\PESSOAS_A_TRATAR.TXT');
      Open;
   end; { with qryPessoasATratar do }


   if qryPessoasATratar.IsEmpty
   then begin
      // Gleyber - 27/01/2003 - Início
      Result := False;
      If (iTipoRetroativo = 1)
      Then mmResult.Lines.Add('Não foi encontrado benefício(s) para o(s) participante(s) no período.');
      // Gleyber - 27/01/2003 - Fim
      Exit;
   end;

   if not ValidaOpcoesRetroativo(iTipoRetroativo)
   then begin
      MsgDlg('Preencha todos os parâmetros.','Informação',mtInformation,[mbOK],0);
      Exit;
   end;

   iIdLoteRetroativo := -1;
   iTotalPessoas     := qryPessoasATratar.RecordCount;
   iTotalPessoasProc := 0;
   qryPessoasATratar.First;
   { Augusto 14/12/2003 }
   bDesfazTodosRetroativos := False;
   bNaoDesfazTodosRetroativos := False;

   {---------------------------------------------------------------------------}
   { Loop principal de todas as pessoas                                        }

   { Loop somente irá processar um IDRESPONSAVEL pois dentro da rotina de revisão, }
   { já se busca todos os beneficiários e beneficios do titular.                   }
   iIdTitularBeneficioEmProcesso := 0;
   while not qryPessoasATratar.Eof do begin

      { Inicio Augusto 29/05/2006 - Testar se esse IDRESPONSAVEL já foi processado }
      If ( Not rbtnIndividual.Checked ) And ( chkTipoIndivTipoBeneficio.Checked ) Then Begin

        If ( iIdTitularBeneficioEmProcesso = qryPessoasATratar.FieldByName('IDRESPONSAVEL').AsInteger ) Then Begin

          qryPessoasATratar.Next;
          Continue;

        End;

      End; { If ( Not rbtnIndividual.Checked ) }

      iIdTitularBeneficioEmProcesso := qryPessoasATratar.FieldByName('IDRESPONSAVEL').AsInteger;
      { Fim Augusto 29/05/2006                                                 }

      bParcelamento := False;
      frmAguarde.Mostra('Processando '+IntToStr(iTotalPessoasProc)+' de '+ IntToStr(iTotalPessoas));

      lblProgresso.Caption := IntToStr(iTotalPessoas)    +' pessoas verificadas.';
      lblProgresso.Caption := IntToStr(iTotalPessoasProc)+' pessoas processadas.';

      qryDemonstrativo.Close;
      qryDemonstrativo.Open;
      if qryDemonstrativo.UpdatesPending then qryDemonstrativo.CancelUpdates;
      Application.ProcessMessages;
      { Augusto 05/05/2004 }
      iIdPessoa    := qryPessoasATratar.FieldByName('IDPESSOA').AsInteger;  // leofuncef - 02022005 - descomemntei atribuição
      iIdTitular   := qryPessoasATratar.FieldByName('IDTITULAR').AsInteger; // leofuncef - 02022005 - troquei por idtitular
      iIdPessJur   := qryPessoasATratar.FieldByName('IDPESSJUR').AsInteger;
      { Augusto 07/05/2004 }
      //iIdPlanoPrev := qryPessoasATratar.FieldByName('IDPLANOPREV').AsInteger;
      iSeqProposta := qryPessoasATratar.FieldByName('SEQPROPOSTA').AsInteger;


      { Inicio Augusto 18/10/2004 - Tratamento para processo em lote }
      If Not rbtnIndividual.Checked Then Begin
        iIdPessoa    := qryPessoasATratar.FieldByName('IDPESSOA').AsInteger;
        iIdPlanoPrev := qryPessoasATratar.FieldByName('IDPLANOPREV').AsInteger;

        qryDadosBeneficio.Close;
        qryDadosBeneficio.ParamByName('IDPESSJUR').AsInteger      := iIdPessJur;
        qryDadosBeneficio.ParamByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
        qryDadosBeneficio.ParamByName('IDTITULAR').AsInteger      := iIdTitular;
        qryDadosBeneficio.ParamByName('IDPESSOA').AsInteger       := iIdPessoa;
        qryDadosBeneficio.ParamByName('SEQPROPOSTA').AsInteger    := 1;
        qryDadosBeneficio.Open;
      End;
      { Fim Augusto 18/10/2004 }

      { Imprimir cabeçalho da pessoa, somente caso seja individual ou não seja revião de beneficios }
      If ( rbtnIndividual.Checked ) or ( ( rbnLote.Checked ) and ( Not rbRecalcBenef.Checked ) )
      Then Begin
        ImprimeCabecalhoPessoa;
      End;

      if chkTipoIndivOpcaoContrib.Checked
      then begin
         if not ProcessaAlteracaoOpcaoContribuicao
         then begin
            if not chkGravaDemons.Checked
            then mmResult.Lines.Add('      [ERRO ] Alteração de Opção de Contribuição');
            GravaLinhaTXT('      [ERRO ] Alteração de Opção de Contribuição');
         end
         else begin
            if not chkGravaDemons.Checked
            then mmResult.Lines.Add('      [ OK  ] Alteração de Opção de Contribuição');
            GravaLinhaTXT('      [ OK  ] Alteração de Opção de Contribuição');
         end;
      end;

      if chkTipoIndivTipoBeneficio.Checked
      then begin
         if not ProcessaAlteracaoTipoBeneficio(edAnoMesIni.Text,
                                               edAnoMesFim.Text,
                                               qryPessoasATratar.FieldByName('IDPESSJUR').AsInteger,
                                               qryPessoasATratar.FieldByName('IDPLANOPREV').AsInteger,
                                               qryPessoasATratar.FieldByName('IDPESSOA').AsInteger,
                                               qryPessoasATratar.FieldByName('SEQPROPOSTA').AsInteger,
                                               iNumeroProcesso) { Augusto 18/11/2005 }
         then begin
            if not chkGravaDemons.Checked
            then mmResult.Lines.Add('      [ERRO ] Alteração de Tipo de Benefício');
            GravaLinhaTXT('      [ERRO ] Alteração de Tipo de Benefício');
         end
         else begin
            if not chkGravaDemons.Checked
            then mmResult.Lines.Add('      [ OK  ] Alteração de Tipo de Benefício');
            GravaLinhaTXT('      [ OK  ] Alteração de Tipo de Benefício');
         end;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT  P.NOME BENEFICIARIO, H.MESREFERENCIA, '+
                        ' H.VALORPREV ,  H.VALORTOTAL, '+
                        ' B.VALORATUAL, H.VALORSRB  ,BP.FLGREFERENCIA , BE.NOME BENEF, '+
                        ' NVL(ANT.VLBENEFPGTO,0) VALORANT ,'+
                        ' H.FLGDEVOLUCAO '+ //leofuncef - 04112004
                        ' FROM  BENEFBFCIARIO B, HSTBENEFBFCIARIO H, PESSOA P, BENEFPLANPREV BP, BENEFICIO BE ,'+
                        ' (SELECT VLBENEFPGTO , MESREFERENCIA , MES '+
                        '  FROM HSTBENEFBFCIARIO '+
                        '  WHERE IDTITULAR      = '+qryBeneficiosTrocar.FieldByName('IDTITULAR').AsString      +
                        '  AND   IDPESSOA       = '+qryBeneficiosTrocar.FieldByName('IDPESSOA').AsString       +
                        '  AND   SEQPROPOSTA    = '+qryBeneficiosTrocar.FieldByName('SEQPROPOSTA').AsString    +
                        '  AND   IDPESSJUR      = '+qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsString      +
                        '  AND   IDPLANOPREV    = '+qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString    +

                        { Augusto 18/11/2005 }
                        //'  AND   NUMEROPROCESSO = '+qryBeneficiosTrocar.FieldByName('NUMEROPROCESSO').AsString +
                        '  AND   NUMEROPROCESSO = '+IntToStr( iNumeroProcesso ) +

                        '  AND   IDBENEFICIO    = '+qryBeneficiosTrocar.FieldByName('NOVOIDBENEFICIO').AsString +
                        '  AND   MESREFERENCIA >= '''+edAnoMesIni.Text+''' '+
                        '  AND   FLGDEVOLUCAO = 0 '+
                        '  AND   VLBENEFPGTO  IS NOT NULL ) ANT '+
                        ' WHERE  H.IDTITULAR      = '+qryBeneficiosTrocar.FieldByName('IDTITULAR').AsString      +
                        ' AND    H.IDPESSOA       = '+qryBeneficiosTrocar.FieldByName('IDPESSOA').AsString       +
                        ' AND    H.SEQPROPOSTA    = '+qryBeneficiosTrocar.FieldByName('SEQPROPOSTA').AsString    +
                        ' AND    H.IDPESSJUR      = '+qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsString      +
                        ' AND    H.IDPLANOPREV    = '+qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString    +
                        { Augusto 18/11/2005 }
                        //' AND   NUMEROPROCESSO = '+qryBeneficiosTrocar.FieldByName('NUMEROPROCESSO').AsString +
                        ' AND    H.NUMEROPROCESSO    = '+IntToStr( iNumeroProcesso ) +
                        ' AND    H.IDBENEFICIO    = '+qryBeneficiosTrocar.FieldByName('NOVOIDBENEFICIO').AsString +
                        ' AND    H.MESREFERENCIA >= '''+edAnoMesIni.Text+''' '+
                        ' AND    P.IDPESSOA = H.IDPESSOA '+
                        ' AND    B.IDPLANOPREV    = H.IDPLANOPREV '+
                        ' AND    B.IDBENEFICIO    = H.IDBENEFICIO '+
                        ' AND    B.NUMEROPROCESSO = H.NUMEROPROCESSO '+
                        ' AND    B.IDPESSJUR      = H.IDPESSJUR '+
                        ' AND    B.IDTITULAR      = H.IDTITULAR '+
                        ' AND    B.IDPLANOORIGEM  = H.IDPLANOORIGEM '+
                        ' AND    H.VLBENEFPGTO  IS NULL '+
                        ' AND    BP.IDPLANOPREV = H.IDPLANOPREV '+
                        ' AND    BP.IDBENEFICIO = H.IDBENEFICIO '+
                        ' AND    BE.IDBENEFICIO = BP.IDBENEFICIO '+
                        ' AND    H.MESREFERENCIA = ANT.MESREFERENCIA(+) '+


                        //leofuncef - 27072005 - incio
                        ' UNION ALL '+

                        //registros pagos que não geraram diferença (H.VLBENEFPGTO  IS NOT NULL)
                        ' SELECT  P.NOME BENEFICIARIO, H.MESREFERENCIA, '+
                        ' 0 AS VALORPREV ,  H.VALORTOTAL, '+
                        ' B.VALORATUAL, H.VALORSRB  ,BP.FLGREFERENCIA , BE.NOME BENEF, '+
                        ' H.VLBENEFPGTO AS VALORANT , H.FLGDEVOLUCAO '+
                        ' FROM  BENEFBFCIARIO B, HSTBENEFBFCIARIO H, PESSOA P, BENEFPLANPREV BP, BENEFICIO BE  '+
                        ' WHERE  H.IDTITULAR      = '+qryBeneficiosTrocar.FieldByName('IDTITULAR').AsString      +
                        ' AND    H.IDPESSOA       = '+qryBeneficiosTrocar.FieldByName('IDPESSOA').AsString       +
                        ' AND    H.SEQPROPOSTA    = '+qryBeneficiosTrocar.FieldByName('SEQPROPOSTA').AsString    +
                        ' AND    H.IDPESSJUR      = '+qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsString      +
                        ' AND    H.IDPLANOPREV    = '+qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString    +
                        ' AND    H.NUMEROPROCESSO = '+qryBeneficiosTrocar.FieldByName('NUMEROPROCESSO').AsString +
                        ' AND    H.IDBENEFICIO    = '+qryBeneficiosTrocar.FieldByName('NOVOIDBENEFICIO').AsString +
                        ' AND    H.MESREFERENCIA >= '''+edAnoMesIni.Text+''' '+
                        ' AND    P.IDPESSOA = H.IDPESSOA '+
                        ' AND    B.IDPLANOPREV    = H.IDPLANOPREV '+
                        ' AND    B.IDBENEFICIO    = H.IDBENEFICIO '+
                        ' AND    B.NUMEROPROCESSO = H.NUMEROPROCESSO '+
                        ' AND    B.IDPESSJUR      = H.IDPESSJUR '+
                        ' AND    B.IDTITULAR      = H.IDTITULAR '+
                        ' AND    B.IDPLANOORIGEM  = H.IDPLANOORIGEM '+
                        ' AND    H.VLBENEFPGTO  IS NOT NULL '+
                        ' AND    BP.IDPLANOPREV = H.IDPLANOPREV '+
                        ' AND    BP.IDBENEFICIO = H.IDBENEFICIO '+
                        ' AND    BE.IDBENEFICIO = BP.IDBENEFICIO '+
                        ' AND    NOT EXISTS (SELECT 1 '+
                        '       FROM HSTBENEFBFCIARIO '+
                        '       WHERE  IDTITULAR      = H.IDTITULAR     '+
                        '       AND    IDPESSOA       = H.IDPESSOA      '+
                        '       AND    SEQPROPOSTA    = H.SEQPROPOSTA   '+
                        '       AND    IDPESSJUR      = H.IDPESSJUR     '+
                        '       AND    IDPLANOPREV    = H.IDPLANOPREV   '+
                        '       AND    NUMEROPROCESSO = H.NUMEROPROCESSO '+
                        '       AND    IDBENEFICIO    = H.IDBENEFICIO    '+
                        '       AND    MESREFERENCIA  = H.MESREFERENCIA '+
                        '       AND    VLBENEFPGTO  IS NULL ) '+
                        //leofuncef - 27072005 - fim

                        ' ORDER BY MESREFERENCIA DESC ');
         qryAux.Open;

         while not qryaux.eof do begin

            qryDemonstrativo.Insert;
            qryDemonstrativo.FieldbyName('ANOMES').AsString := qryaux.FieldByName('MESREFERENCIA').AsString;

            //leofuncef - 04112004 - tratamento de devolução para o demonstrativo
            if qryaux.FieldByName('FLGDEVOLUCAO').AsInteger = 1 then
            begin
               qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat    := qryaux.FieldByName('VALORPREV').AsFloat * -1;
               qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat    := qryaux.FieldByName('VALORPREV').AsFloat * -1;
            end
            else
            begin
               qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat    := qryaux.FieldByName('VALORPREV').AsFloat;
               qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat    := qryaux.FieldByName('VALORPREV').AsFloat;
            end;

            qryDemonstrativo.FieldbyName('INDICE').AsFloat            := 1;
            qryDemonstrativo.FieldbyName('VALORANTES').AsFloat        := qryaux.FieldByName('VALORANT').AsFloat ;


            //leofuncef - 27072005
            //qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat       := qryaux.FieldByName('VALORATUAL').AsFloat ;
            qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat       := qryaux.FieldByName('VALORTOTAL').AsFloat ;
            //leofuncef - 27072005 - fim


            qryDemonstrativo.FieldbyName('SRBANTES').AsFloat          := qryaux.FieldByName('VALORSRB').AsFloat;
            qryDemonstrativo.FieldbyName('SRBDEPOIS').AsFloat         := qryaux.FieldByName('VALORSRB').AsFloat;
            qryDemonstrativo.FieldbyName('RESERVADEPOIS').AsFloat     := 0;
            qryDemonstrativo.FieldbyName('SALVIRTUALANTES').AsFloat   := 0;
            qryDemonstrativo.FieldbyName('SALVIRTUALDEPOIS').AsFloat  := 0;
            qryDemonstrativo.FieldbyName('DESCRICAO').AsString        := copy(qryaux.FieldByName('BENEF').AsString,1,30) ;

            if qryaux.FieldByName('FLGREFERENCIA').AsInteger = 1
            then qryDemonstrativo.FieldbyName('TIPO').AsString        := 'I'  // inss
            else qryDemonstrativo.FieldbyName('TIPO').AsString        := 'B'; // beneficio de suplementacao

            qryDemonstrativo.FieldbyName('NOMEBENEF').AsString          := qryaux.FieldByName('BENEFICIARIO').AsString;


            //leofuncef - 26072005 - acerto da resolução da pendência 19492
            qryDemonstrativo.FieldbyName('IDTITULAR').AsString         := qryBeneficiosTrocar.FieldByName('IDTITULAR').AsString;
            qryDemonstrativo.FieldbyName('IDPLANOPREV').AsString       := qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString;
            qryDemonstrativo.FieldbyName('IDPESSOA').AsString          := qryBeneficiosTrocar.FieldByName('IDPESSOA').AsString;
            qryDemonstrativo.FieldbyName('IDENTIFICADOR').AsString     := qryBeneficiosTrocar.FieldByName('IDBENEFICIO').AsString;
            //leofuncef - 26072005


            qryDemonstrativo.Post;

            qryaux.next;
         end;


         { Inicio Augusto 18/11/2005 - Demonstrar contribuições }
         If ChBxAcertaContrib.Checked = True Then Begin
         
           sSQL :='SELECT '+
                   '  CON.IDCONTRIBUICAO, CON.NOME, HCP.IDMOTIVO, HCP.IDPESSOA,  ' +
                   '  SUM(HCP.VALORESPERADO) AS VALORESPERADO, HCP.FLGDEVOLUCAO, ' +
                   '  HCP.MESREFERENCIA,                                         ' +
                   '  P.NOME AS NOMERESPCONT, TRUNC(HCP.TRGDTINCLUSAO)           ' +
                   'FROM   '+
                   '  HSTCONTRIBPREV HCP, CONTRIBUICAO CON, PESSOA P '+
                   'WHERE  ';
           If qryBeneficiosTrocar.FieldByName('IDTITULAR').AsInteger <>
              qryBeneficiosTrocar.FieldByName('IDPESSOA').AsInteger
           Then Begin
             sSQL := sSQL +
                     '  HCP.IDPESSOA = (SELECT NF.IDRESPNUCLEO '+
                     '                  FROM BFCIARIOTITPLAN BF, NUCLEOFAMILIAR NF '+
                     '                  WHERE '+
                     '                   BF.IDPESSJUR   = '+ qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsString   +' AND '+
                     '                   BF.IDPLANOPREV = '+ qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString +' AND '+
                     '                   BF.IDTITULAR   = '+ qryBeneficiosTrocar.FieldByName('IDTITULAR').AsString   +' AND '+
                     '                   BF.IDPESSOA    = '+ qryBeneficiosTrocar.FieldByName('IDPESSOA').AsString    +' AND '+
                     '                   BF.IDBENEFICIO = '+ qryBeneficiosTrocar.FieldByName('IDBENEFICIO').AsString +' AND '+
                     '                   BF.IDNUCLEOFAMILIAR = NF.IDNUCLEOFAMILIAR) AND ';
           End Else Begin
             sSQL := sSQL +
                     '  HCP.IDPESSOA = '+ qryBeneficiosTrocar.FieldByName('IDPESSOA').AsString +' AND ';
           End;

           sSQL := sSQL +
                   '  HCP.MESREFERENCIA >= '''+edAnoMesIni.Text+''' AND '+
                   '  HCP.IDCONTRIBUICAO = CON.IDCONTRIBUICAO AND '+
                   '  HCP.IDPESSOA       = P.IDPESSOA         AND '+
                   '  TRUNC(HCP.TRGDTINCLUSAO)= TRUNC(SYSDATE) '+

                   //' AND HCP.MESREFERENCIA = '''+'2004/09'+''' '+

                   'GROUP BY '+
                   '  CON.IDCONTRIBUICAO, CON.NOME, HCP.MESREFERENCIA, HCP.FLGDEVOLUCAO, HCP.IDMOTIVO, P.NOME, HCP.IDLOTE, TRUNC(HCP.TRGDTINCLUSAO), HCP.IDPESSOA  '+
                   'ORDER BY '+
                   '  HCP.MESREFERENCIA, CON.IDCONTRIBUICAO, CON.NOME, HCP.FLGDEVOLUCAO, HCP.IDMOTIVO';

           If FazQuery(QryAux,sSQL) Then Begin

             While Not QryAux.Eof Do Begin

                sAnoMesLoop         := Qryaux.FieldByName('MESREFERENCIA').AsString;
                sIdContribuicaoLoop := QryAux.FieldByName('IDCONTRIBUICAO').AsString;

                qryDemonstrativo.Insert;

                While ( Qryaux.FieldByName('MESREFERENCIA').AsString = sAnoMesLoop ) And
                      ( QryAux.FieldByName('IDCONTRIBUICAO').AsString = sIdContribuicaoLoop ) And
                      ( Not QryAux.Eof )
                Do Begin

                  qryDemonstrativo.FieldbyName('ANOMES').AsString := qryaux.FieldByName('MESREFERENCIA').AsString;

                  If QryAux.FieldbyName('FLGDEVOLUCAO').AsInteger= 0 Then Begin
                    qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat := QryAux.FieldbyName('VALORESPERADO').AsFloat;
                  End Else Begin
                    { Devolução tem que ser relativa ao pagamento, por isso utilizar este registro como anterior }
                    qryDemonstrativo.FieldbyName('VALORANTES').AsFloat  := QryAux.FieldbyName('VALORESPERADO').AsFloat;
                  End;

                  qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat  := (qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat -
                                                                         qryDemonstrativo.FieldbyName('VALORANTES').AsFloat);

                  qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat    := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat;
                  qryDemonstrativo.FieldbyName('TIPO').AsString          := 'C'; // contribuicao
                  { Inicio Augusto 17/01/2005 }
                  qryDemonstrativo.FieldbyName('IDTITULAR').AsString     := qryBeneficiosTrocar.FieldByName('IDTITULAR').AsString;
                  qryDemonstrativo.FieldbyName('IDPLANOPREV').AsString   := qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString;
                  qryDemonstrativo.FieldbyName('IDPESSOA').AsString      := QryAux.FieldByName('IDPESSOA').AsString;
                  qryDemonstrativo.FieldbyName('IDENTIFICADOR').AsString := QryAux.FieldByName('IDCONTRIBUICAO').AsString; { Augusto 17/01/2005 }
                  { Fim Augusto 17/01/2005 }
                  qryDemonstrativo.FieldbyName('DESCRICAO').AsString     := Copy(QryAux.FieldByName('NOME').AsString,1,30);

                  QryAux.Next;

                End; { While ( Qryaux.FieldByName('MESREFERENCIA').AsString = sAnoMesLoop ) And }

                qryDemonstrativo.Post;

             End; { While Qryaux.Eof }

           End;

         End; { If ChBxAcertaContrib.Checked = True Then Begin }
         { Fim Augusto }


         ExibeDemonstrativoRevisaoBeneficio;
         //leofuncef - 05102004 - fim
      end;

      if chkTipoIndivRevisaoBeneficio.Checked
      then begin
         if not ProcessaAlteracaoDadosBeneficio
         then begin
            if not chkGravaDemons.Checked
            then mmResult.Lines.Add('      [ERRO ] Alteração de Dados de Benefício');
            GravaLinhaTXT('      [ERRO ] Alteração de Dados de Benefício');
         end
         else begin
            if not chkGravaDemons.Checked
            then mmResult.Lines.Add('      [ OK  ] Alteração de Dados de Benefício');
            GravaLinhaTXT('      [ OK  ] Alteração de Dados de Benefício');
         end;
      end;


      // Augusto
      // EFETUAR RECALCULOS DE ACORDO COM O TIPO DE REVISAO
      // ***********************************************************************
      if iTipoRetroativo = 2
      then begin // REVISAO DE SALARIOS E CONTRIBUICOES
          if rbtnIndividual.Checked then begin
           iResultado := ProcessaoRevisaoSalarioContribuicao( edAnoMesIni.Text,
                                                 edAnoMesFim.Text,
                                                 qryPessoasATratar.FieldByName('IDPESSJUR').AsInteger,
                                                 qryPessoasATratar.FieldByName('IDPLANOPREV').AsInteger,
                                                 qryPessoasATratar.FieldByName('IDPESSOA').AsInteger,
                                                 qryPessoasATratar.FieldByName('SEQPROPOSTA').AsInteger,
                                                 sContribuicoes);
          end
          else begin
              iResultado := ProcessaoRevisaoSalarioContribuicao( edAnoMesIni.Text,
                                                 edAnoMesFim.Text,
                                                 qryPessoasATratar.FieldByName('IDPESSJUR').AsInteger,
                                                 qryPessoasATratar.FieldByName('IDPLANOPREV').AsInteger,
                                                 qryPessoasATratar.FieldByName('IDPESSOA').AsInteger,
                                                 qryPessoasATratar.FieldByName('SEQPROPOSTA').AsInteger,
                                                 sContribuicoes);

         end;

         case iResultado of
              -1 : begin
                      if not chkGravaDemons.Checked
                      then mmResult.Lines.Add('      [ERRO ] Revisão de Salários e Contribuições');
                      GravaLinhaTXT('      [ERRO ] Revisão de Salários e Contribuições');
                      inc(iTotalPessoasProc);
                   end;
               0 : begin
                      if not chkGravaDemons.Checked
                      then mmResult.Lines.Add('      [ OK  ] Revisão de Salários e Contribuições');
                      GravaLinhaTXT('      [ OK  ] Revisão de Salários e Contribuições');
                      inc(iTotalPessoasProc);
                      ExibeDemonstrativoRevisaoBeneficio; { Augusto 31/05/2005 }
                   end;
               1 : begin
                   end;
               2 : begin
                      if not chkGravaDemons.Checked
                      then mmResult.Lines.Add('      [CANC ] Revisão de Salários e Contribuições');
                      GravaLinhaTXT('      [CANC ] Revisão de Salários e Contribuições');
                      inc(iTotalPessoasProc);
                   end;
         end;
      end
      else if (not chkTipoIndivTipoBeneficio.Checked){leofuncef - 05102004} then begin // REVISAO DE BENEFICIOS
         { Augusto 14/12/2003 }
          bExcedeuLimite := False ; // CAMILLE - 27.10.2004
          if rbtnIndividual.Checked
          then iResultado := ProcessaRevisaoBeneficio(edAnoMesIni.Text,
                                                  edAnoMesFim.Text,
                                                  qryPessoasATratar.FieldByName('IDPESSJUR').AsInteger,
                                                  iIdPlanoPrev, // { Augusto 27/05/2004 } qryPessoasATratar.FieldByName('IDPLANOPREV').AsInteger,
                                                  { Augusto 05/05/2004 }

                                                  //qryPessoasATratar.FieldByName('IDPESSOA').AsInteger,
                                                  iidTitular, //leofuncef - 02022005

                                                  iIdPessoa,
                                                  {*}
                                                  qryPessoasATratar.FieldByName('SEQPROPOSTA').AsInteger,
                                                  sContribuicoes)
               
          else iResultado := ProcessaRevisaoBeneficio( edAnoMesIni.Text,
                                                  edAnoMesFim.Text,
                                                  qryPessoasATratar.FieldByName('IDPESSJUR').AsInteger,
                                                  iIdPlanoPrev, // { Augusto 27/05/2004 } qryPessoasATratar.FieldByName('IDPLANOPREV').AsInteger,

                                                  //qryPessoasATratar.FieldByName('IDTITULAR').AsInteger,
                                                  iIdTitular, //leofuncef - 02022005

                                                  iIdPessoa,
                                                  {*}
                                                  qryPessoasATratar.FieldByName('SEQPROPOSTA').AsInteger,
                                                  sContribuicoes);
          if iResultado = -1
          then begin
            if not chkGravaDemons.Checked
            then mmResult.Lines.Add('      [ERRO ] Revisão de Benefício');
            GravaLinhaTXT('      [ERRO ] Revisão de Benefício');
          end else if iResultado = 0 then begin
            ExibeDemonstrativoRevisaoBeneficio;
            bExcedeuLimite := False ; // CAMILLE - 27.10.2004
          end;

          inc(iTotalPessoasProc);
      end;

      // CAMILLE - 28.10.2004
      // Mudei essa rotina de lugar para que a revisão de contribuições também efetuasse o commit de um em um
      if chkCommitIndiv.Checked
      then begin
         dtmBaseDados.dbBaseDados.Commit;
         dtmBaseDados.dbBaseDados.StartTransaction;
      end;

      qryPessoasATratar.Next;

   end; { qryPessoasATratar.Next }
   { Final do loop principal de todas as pessoas                               }
   {---------------------------------------------------------------------------}

   frmAguarde.Apaga;

   lblProgresso.Caption := IntToStr(iTotalPessoas)    +' pessoas verificadas.';
   lblProgresso.Caption := IntToStr(iTotalPessoasProc)+' pessoas processadas.';
   Application.ProcessMessages;
   Result := True;
end;

// *****************************************************************************
// ALTERAÇÃO CADASTRAL
// *****************************************************************************
function  TfrmRetroativoPREV.ProcessaAlteracaoCadastral : boolean;
var sEstCiv : string;
begin
   Result := False;

   if trim(cmbEstCiv.text) = ''                                then sEstCiv := ' NULL'
   else if trim(cmbEstCiv.text) = 'Solteiro(a)'                then sEstCiv := ' ''S'''
   else if trim(cmbEstCiv.text) = 'Casado(a) ou Equiparado(a)' then sEstCiv := ' ''C'''
   else if trim(cmbEstCiv.text) = 'Divorciado(a)'              then sEstCiv := ' ''D'''
   else if trim(cmbEstCiv.text) = 'Desquitado(a)'              then sEstCiv := ' ''E'''
   else if trim(cmbEstCiv.text) = 'Separado(a) Judicial'       then sEstCiv := ' ''J'''
   else if trim(cmbEstCiv.text) = 'Viúvo(a)'                   then sEstCiv := ' ''V'''
   else if trim(cmbEstCiv.text) = 'Marital'                    then sEstCiv := ' ''M'''
   else if trim(cmbEstCiv.text) = 'Separado(a)'                then sEstCiv := ' ''P'''
   else if trim(cmbEstCiv.text) = 'Outros'                     then sEstCiv := ' ''O''';

   with qryAux do
   begin
      Close;
      SQL.Clear;
      if grpInvalido.ItemIndex = 0
      then begin
         SQL.Add('UPDATE PESSOA SET FLGINVALIDO = 1 WHERE IDPESSOA = '+IntToStr(iIdPessoa));
         if not GravaLogDadosAlterados( 'PESSOA', 'FLGINVALIDO', OraNumero(qryDadosPessoa.FieldbyName('FLGINVALIDO').AsString), '1', 'Inválido (1 = Sim, 0 = Não) ') then Exit;
      end
      else begin
         SQL.Add('UPDATE PESSOA SET FLGINVALIDO = 0 WHERE IDPESSOA = '+IntToStr(iIdPessoa));
         if not GravaLogDadosAlterados( 'PESSOA', 'FLGINVALIDO', OraNumero(qryDadosPessoa.FieldbyName('FLGINVALIDO').AsString), '0', 'Inválido (1 = Sim, 0 = Não) ') then Exit;
      end;

      try
         ExecSQL;
      except
         Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add('UPDATE PESSOAFISICA SET DATANASC = TO_DATE('''+dtDataNasc.Text+''',''DD/MM/YYYY'') ');
      SQL.Add(', ESTCIVIL = '+sEstCiv);

      if Trim(dtDataMorte.Text) = ''
      then SQL.Add(', DATAMORTE = NULL ')
      else SQL.Add(', DATAMORTE = TO_DATE('''+dtDataMorte.Text+''',''DD/MM/YYYY'') ');

      if grpSexo.ItemIndex = 0
      then SQL.Add(', SEXO = ''M'' ')
      else SQL.Add(', SEXO = ''F'' ');

      if grpMolestiaGrave.ItemIndex = 0
      then SQL.Add(', FLGMOLESTIAGRAVE = 1 ')
      else SQL.Add(', FLGMOLESTIAGRAVE = 0 ');

      if grpIsentoIR.ItemIndex = 0
      then SQL.Add(', FLGISENTOIRRF = 1 ')
      else SQL.Add(', FLGISENTOIRRF = 0 ');
      SQL.Add(' WHERE IDPESSOA = '+IntToStr(iIdPessoa));
      try
         ExecSQL;
         if not GravaLogDadosAlterados( 'PESSOAFISICA', 'DATANASC', qryDadosPessoa.FieldbyName('DATANASC').AsString, dtDataNasc.Text, 'Data de Nascimento') then Exit;
         if not GravaLogDadosAlterados( 'PESSOAFISICA', 'ESTCIVIL', qryDadosPessoa.FieldbyName('ESTCIVIL').AsString, TiraPlic(sEstCiv), 'Estado Civil')  then Exit;
         if not GravaLogDadosAlterados( 'PESSOAFISICA', 'DATAMORTE',qryDadosPessoa.FieldbyName('DATAMORTE').AsString, dtDataMorte.Text, 'Data do Falecimento')  then Exit;
         if grpSexo.ItemIndex = 0
         then begin
            if not GravaLogDadosAlterados( 'PESSOAFISICA', 'SEXO',qryDadosPessoa.FieldbyName('SEXO').AsString, 'M', 'Sexo')  then Exit;
         end
         else if not GravaLogDadosAlterados( 'PESSOAFISICA', 'SEXO',qryDadosPessoa.FieldbyName('SEXO').AsString, 'F', 'Sexo')  then Exit;

         if grpMolestiaGrave.ItemIndex = 0
         then begin
            if not GravaLogDadosAlterados( 'PESSOAFISICA', 'FLGMOLESTIAGRAVE',qryDadosPessoa.FieldbyName('FLGMOLESTIAGRAVE').AsString, '1','Possui Moléstia Grave (1 = Sim, 0 = Não)') then Exit;
         end
         else if not GravaLogDadosAlterados( 'PESSOAFISICA', 'FLGMOLESTIAGRAVE',qryDadosPessoa.FieldbyName('FLGMOLESTIAGRAVE').AsString, '0', 'Possui Moléstia Grave (1 = Sim, 0 = Não)') then Exit;

         if grpIsentoIR.ItemIndex = 0
         then begin
            if not GravaLogDadosAlterados( 'PESSOAFISICA', 'FLGISENTOIRRF',qryDadosPessoa.FieldbyName('FLGISENTOIRRF').AsString, '1', 'Isento de IRRF (1 = Sim, 0 = Não) ') then Exit;
         end
         else if not GravaLogDadosAlterados( 'PESSOAFISICA', 'FLGISENTOIRRF',qryDadosPessoa.FieldbyName('FLGISENTOIRRF').AsString, '0', 'Isento de IRRF (1 = Sim, 0 = Não) ') then Exit;
      except
         Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add(' UPDATE ELEGPATRO SET DATAADMISSAO      = TO_DATE('''+dtDataAdmissao.Text+''', ''DD/MM/YYYY'') ,' +
              '                      TEMPOSERVANTERIOR = '+OraNumero(edTempoServAnt.Text) );
      if Trim(dtDataDemissao.Text) <> ''
      then SQL.Add(', DATADEMISSAO = TO_DATE('''+dtDataDemissao.Text+''', ''DD/MM/YYYY'') ')
      else SQL.Add(', DATADEMISSAO = NULL ');

      if Trim(dtDataReadmissao.Text) <> ''
      then SQL.Add(', DATAREADMISSAO = TO_DATE('''+dtDataReadmissao.Text+''', ''DD/MM/YYYY'') ')
      else SQL.Add(', DATAREADMISSAO = NULL ');

      if grpCargoDiretoria.ItemIndex = 0
      then SQL.Add(', FLGDIRETOR = 0 ')
      else SQL.Add(', FLGDIRETOR = 1 ');

      if Trim(dblkpcmbVinculaFunc.Text) <> ''
      then SQL.Add(', CODVINCULAFUNC = '''+qryVinculaFunc.FieldbyName('CODVINCULAFUNC').AsString+'''')
      else SQL.Add(', CODVINCULAFUNC = NULL ');

      SQL.Add(' WHERE IDPESSJUR = '+IntToStr(iIdPessJur)+
              ' AND   IDPESSOA  = '+IntToStr(iIdTitular) );
      try
         ExecSQL;
         if not GravaLogDadosAlterados( 'ELEGPATRO', 'DATAADMISSAO',qryDadosPessoa.FieldbyName('DATAADMISSAO').AsString,dtDataAdmissao.Text, 'Data de Admissão') then Exit;
         if not GravaLogDadosAlterados( 'ELEGPATRO', 'TEMPOSERVANTERIOR',qryDadosPessoa.FieldbyName('TEMPOSERVANTERIOR').AsString,edTempoServAnt.Text, 'Tempo de Serviço Anterior') then Exit;
         if not GravaLogDadosAlterados( 'ELEGPATRO', 'DATADEMISSAO',qryDadosPessoa.FieldbyName('DATADEMISSAO').AsString,dtDataDemissao.Text, 'Data de Demissão') then Exit;
         if not GravaLogDadosAlterados( 'ELEGPATRO', 'DATAREADMISSAO',qryDadosPessoa.FieldbyName('DATAREADMISSAO').AsString,dtDataReadmissao.Text, 'Data de Readmissão') then Exit;
         if not GravaLogDadosAlterados( 'ELEGPATRO', 'FLGDIRETOR',qryDadosPessoa.FieldbyName('FLGDIRETOR').AsString,IntToStr(grpCargoDiretoria.ItemIndex),'Exerceu Cargo Diretoria (1 = Sim, 0 = Não') then Exit;
         if Trim(dblkpcmbVinculaFunc.Text) <> ''
         then begin
            if not GravaLogDadosAlterados( 'ELEGPATRO', 'CODVINCULAFUNC',qryDadosPessoa.FieldbyName('CODVINCULAFUNC').AsString,qryVinculaFunc.FieldbyName('CODVINCULAFUNC').AsString, 'Vinculação Funcional') then Exit;
         end
         else if not GravaLogDadosAlterados( 'ELEGPATRO', 'CODVINCULAFUNC',qryDadosPessoa.FieldbyName('CODVINCULAFUNC').AsString,'', 'Vinculação Funcional') then Exit;
      except
         Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add(' UPDATE PARTPREVPLAN SET INSCRICAODATA = TO_DATE('''+dtDataInscricao.Text+''', ''DD/MM/YYYY'') ');

      If Trim(dblkpcmbSituacaoFundacao.Text) <> ''                                     // Gleyber - 25/07/2006 - Pendência 22731
       Then SQL.Add(', IDSITPART = '+QuotedStr(dblkpcmbSituacaoFundacao.LookupValue)); // Gleyber - 25/07/2006 - Pendência 22731

      SQL.Add(' WHERE IDPESSJUR   = '+IntToStr(iIdPessJur)+
              ' AND   IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+
              ' AND   IDPESSOA    = '+IntToStr(iIdTitular)  );
      try
         ExecSQL;
         if not GravaLogDadosAlterados( 'PARTPREVPLAN', 'INSCRICAODATA',qryDadosPessoa.FieldbyName('INSCRICAODATA').AsString,dtDataInscricao.Text, 'Data de Inscrição') then Exit;
         if not GravaLogDadosAlterados( 'PARTPREVPLAN', 'IDSITPART',qryDadosPessoa.FieldbyName('IDSITPART').AsString,dtDataInscricao.Text, 'Situação do Participante') then Exit; // Gleyber - 25/07/2006 - Pendência 22731
      except
         Exit;
      end;
   end;
   Result := True;
end; // ProcessaAlteracaoCadastral

// *****************************************************************************
// ALTERAÇÃO DE DADOS DO BENEFICIO
// *****************************************************************************
function  TfrmRetroativoPREV.ProcessaAlteracaoDadosBeneficio    : boolean;
begin
   Result := False;
   qryDadosBeneficio.First;
   while not qryDadosBeneficio.Eof do
   begin

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE PESSOAFISICA SET VLRENQUADRAMENTO = '+OraNumero(qryDadosBeneficio.FieldByName('VLRENQUADRAMENTO').AsString)+
                     ' WHERE  IDPESSOA       = '+qryDadosBeneficio.FieldByName('IDPESSOA').AsString);
      try
         qryAux.ExecSQL;
         if not GravaLogDadosAlterados( 'PESSOAFISICA', 'VLRENQUADRAMENTO', qryDadosBeneficio.FieldByName('VLRENQUADRAMENTO_ANT').AsString, qryDadosBeneficio.FieldByName('VLRENQUADRAMENTO').AsString, 'Enquadramento') then Exit;
      except
         Exit;
      end;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE BENEFPLANOPART '+
                     ' SET    VALORBASE1     = '+OraNumero(qryDadosBeneficio.FieldByName('VALORBASE1').AsString)+','+
                     '        VALORBASE2     = '+OraNumero(qryDadosBeneficio.FieldByName('VALORBASE2').AsString)+','+
                     '        VALORBASE3     = '+OraNumero(qryDadosBeneficio.FieldByName('VALORBASE3').AsString)+
                     ' WHERE  IDPESSJUR      = '+qryDadosBeneficio.FieldByName('IDPESSJUR').AsString+
                     ' AND    IDPLANOPREV    = '+qryDadosBeneficio.FieldByName('IDPLANOPREV').AsString+
                     ' AND    IDPESSOA       = '+qryDadosBeneficio.FieldByName('IDTITULAR').AsString+
                     ' AND    SEQPROPOSTA    = '+qryDadosBeneficio.FieldByName('SEQPROPOSTA').AsString+
                     ' AND    IDBENEFICIO    = '+qryDadosBeneficio.FieldByName('IDBENEFICIO').AsString);
      try
         qryAux.ExecSQL;
         if not GravaLogDadosAlterados( 'BENEFPLANOPART', 'VALORBASE1', qryDadosBeneficio.FieldByName('VALORBASE1_ANT').AsString, qryDadosBeneficio.FieldByName('VALORBASE1').AsString, 'Opção 1 de Benefício') then Exit;
         if not GravaLogDadosAlterados( 'BENEFPLANOPART', 'VALORBASE2', qryDadosBeneficio.FieldByName('VALORBASE2_ANT').AsString, qryDadosBeneficio.FieldByName('VALORBASE2').AsString, 'Opção 2 de Benefício') then Exit;
         if not GravaLogDadosAlterados( 'BENEFPLANOPART', 'VALORBASE3', qryDadosBeneficio.FieldByName('VALORBASE3_ANT').AsString, qryDadosBeneficio.FieldByName('VALORBASE3').AsString, 'Opção 3 de Benefício') then Exit;
      except
         Exit;
      end;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET DATAINICIOFUND = TO_DATE('''+qryDadosBeneficio.FieldByName('DATAINICIOFUND').AsString+''',''DD/MM/YYYY''), '+
                     '                      DATAINICIO         = TO_DATE('''+qryDadosBeneficio.FieldByName('DATAINICIO').AsString+''',''DD/MM/YYYY''), '+
                     '                      VALORSRB           = '+OraNumero(qryDadosBeneficio.FieldByName('VALORSRB').AsString)     +','+
                     '                      VLRINFINSS         = '+OraNumero(qryDadosBeneficio.FieldByName('VLRINFINSS').AsString)   +','+
                     '                      VLRCALCINSS        = '+OraNumero(qryDadosBeneficio.FieldByName('VLRCALCINSS').AsString)  +','+
                     '                      VALORBENEFANT      = VALORATUAL,                                                            '+
                     '                      DATAULTREVISAO     = SYSDATE,                                                               ');

                     { Augusto 05/07/2004 - Atualizar os valorbase }
      qryAux.SQL.Add('        VALORBASE1     = '+OraNumero(qryDadosBeneficio.FieldByName('VALORBASE1').AsString)+','+
                     '        VALORBASE2     = '+OraNumero(qryDadosBeneficio.FieldByName('VALORBASE2').AsString)+','+
                     '        VALORBASE3     = '+OraNumero(qryDadosBeneficio.FieldByName('VALORBASE3').AsString)+',');

      if qryDadosBeneficio.FieldByName('DATAFINAL').AsString <> ''
      then qryAux.SQL.Add(' DATAFINAL = TO_DATE('''+qryDadosBeneficio.FieldByName('DATAFINAL').AsString+''',''DD/MM/YYYY''), ')
      else qryAux.SQL.Add(' DATAFINAL = NULL , ');

      if qryDadosBeneficio.FieldByName('DIBBENEFANT').AsString <> ''
      then qryAux.SQL.Add(' DIBBENEFANT = TO_DATE('''+qryDadosBeneficio.FieldByName('DIBBENEFANT').AsString+''',''DD/MM/YYYY'') ')
      else qryAux.SQL.Add(' DIBBENEFANT = NULL  ');

      if (rgrpRecalculaBeneficio.ItemIndex = 1) or
         (rgrpRecalculaBeneficio.ItemIndex = 2) or
         (rgrpRecalculaBeneficio.ItemIndex = 3)
      then begin
         qryAux.SQL.Add(', VALORATUAL = '+OraNumero(qryDadosBeneficio.FieldByName('VALORATUAL').AsString));

         if qryDadosBeneficio.FieldByName('IDTITULAR').AsString = qryDadosBeneficio.FieldByName('IDPESSOA').AsString
         then qryAux.SQL.Add(', VALORTOTAL = '+OraNumero(qryDadosBeneficio.FieldByName('VALORATUAL').AsString));
      end;

      qryAux.SQL.Add(' WHERE  IDPESSJUR      = '+qryDadosBeneficio.FieldByName('IDPESSJUR').AsString+
                     ' AND    IDPLANOPREV    = '+qryDadosBeneficio.FieldByName('IDPLANOPREV').AsString+
                     ' AND    NUMEROPROCESSO = '+qryDadosBeneficio.FieldByName('NUMEROPROCESSO').AsString+ { Augusto 22/01/2007 }
                     ' AND    IDTITULAR      = '+qryDadosBeneficio.FieldByName('IDTITULAR').AsString+
                     ' AND    IDPESSOA       = '+qryDadosBeneficio.FieldByName('IDPESSOA').AsString+
                     ' AND    SEQPROPOSTA    = '+qryDadosBeneficio.FieldByName('SEQPROPOSTA').AsString+
                     ' AND    IDBENEFICIO    = '+qryDadosBeneficio.FieldByName('IDBENEFICIO').AsString);
      try
         qryAux.ExecSQL;
         if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'DATAINICIOFUND', qryDadosBeneficio.FieldByName('DATAINICIOFUND_ANT').AsString, qryDadosBeneficio.FieldByName('DATAINICIOFUND').AsString, 'DIB')           then Exit;
         if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'DATAINICIO',     qryDadosBeneficio.FieldByName('DATAINICIO_ANT').AsString, qryDadosBeneficio.FieldByName('DATAINICIO').AsString, 'Data de Início')        then Exit;
         if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'VALORSRB',       qryDadosBeneficio.FieldByName('VALORSRB_ANT').AsString, qryDadosBeneficio.FieldByName('VALORSRB').AsString, 'SRB')                       then Exit;
         if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'DATAFINAL',      qryDadosBeneficio.FieldByName('DATAFINAL_ANT').AsString, qryDadosBeneficio.FieldByName('DATAFINAL').AsString, 'Data Final')              then Exit;
         if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'DIBBENEFANT',    qryDadosBeneficio.FieldByName('DIBBENEFANT_ANT').AsString, qryDadosBeneficio.FieldByName('DIBBENEFANT').AsString, 'DIB Anterior')        then Exit;
         if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'VALORATUAL',     qryDadosBeneficio.FieldByName('VALORATUAL_ANT').AsString, qryDadosBeneficio.FieldByName('VALORATUAL').AsString, 'Valor Atual')           then Exit;
         if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'VALORTOTAL',     qryDadosBeneficio.FieldByName('VALORTOTAL_ANT').AsString, qryDadosBeneficio.FieldByName('VALORTOTAL').AsString, 'Valor Total')           then Exit;
         if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'VLRINFINSS',     qryDadosBeneficio.FieldByName('VLRINFINSS_ANT').AsString, qryDadosBeneficio.FieldByName('VLRINFINSS').AsString, 'RMI Informado INSS')    then Exit;
         if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'VLRCALCINSS',    qryDadosBeneficio.FieldByName('VLRCALCINSS_ANT').AsString, qryDadosBeneficio.FieldByName('VLRCALCINSS').AsString, 'RMI Calculado INSS')  then Exit;
      except
         Exit;
      end;

      qryDadosBeneficio.Next;
   end;
   Result := True;
end; // ProcessaAlteracaoDadosBeneficio

// *****************************************************************************
// ALTERAÇÃO DE OPÇÃO DE CONTRIBUIÇÃO
// *****************************************************************************
function  TfrmRetroativoPREV.ProcessaAlteracaoOpcaoContribuicao : boolean;
begin
   Result := False;
   qryOpcaoContribuicao.First;
   while not qryOpcaoContribuicao.Eof do
   begin
      { ALTERAR }

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE CONTRIBPREVPARTP '+
                     ' SET    VALORBASE1     = '+OraNumero(qryOpcaoContribuicao.FieldByName('VALORBASE1').AsString)+','+
                     '        VALORBASE2     = '+OraNumero(qryOpcaoContribuicao.FieldByName('VALORBASE2').AsString)+','+
                     '        VALORBASE3     = '+OraNumero(qryOpcaoContribuicao.FieldByName('VALORBASE3').AsString)+
                     ' WHERE  IDPESSJUR      = '+qryOpcaoContribuicao.FieldByName('IDPESSJUR').AsString+
                     ' AND    IDPLANOPREV    = '+qryOpcaoContribuicao.FieldByName('IDPLANOPREV').AsString+
                     ' AND    IDPESSOA       = '+qryOpcaoContribuicao.FieldByName('IDPESSOA').AsString+
                     ' AND    SEQPROPOSTA    = '+qryOpcaoContribuicao.FieldByName('SEQPROPOSTA').AsString+
                     ' AND    IDCONTRIBUICAO = '+qryOpcaoContribuicao.FieldByName('IDCONTRIBUICAO').AsString);
      try
         qryAux.ExecSQL;
      except
         Exit;
      end;
      qryOpcaoContribuicao.Next;
   end;
   Result := True;
end; // ProcessaAlteracaoOpcaoContribuicao

// *****************************************************************************
// ALTERAÇÃO DE TIPO DE BENEFICIO
// *****************************************************************************
function  TfrmRetroativoPREV.ProcessaAlteracaoTipoBeneficio ( psAnoMesIni      : string;
                                                   psAnoMesFim      : string;
                                                   piIdPessJur      : longint;
                                                   piIdPlanoPrev    : longint;
                                                   piIdPessoa       : longint;
                                                   piSeqProposta    : longint;
                                                   Var piNumeroProcesso : Integer) : boolean;
var
   bOK                      : boolean;
   sSQL, sMsgErro           : string;
   rValorAtualizadoRateado  : double;
   rValorAtualizadoTotal    : double;
   sAnoMesPagamento, sMesReferencia, sSalPart, sDescPreparo, sUltMesReajuste,
   sDataPagamento, sSalarioIntegral : string;
   bErro                    : boolean;
   bPreparaContrib13        : boolean;
   iIdLote                  : longint;
   dNovoSRB                 : double;
   iIdUsuarioAutoriza : longint;
begin
   Result := False;

   iIdCalculo := -1;
   iIdCalculoGeral := 0;

   qryBeneficiosTrocar.First;
   while not qryBeneficiosTrocar.Eof do
   begin

      if qryBeneficiosTrocar.FieldbyName('IDBENEFICIO').AsInteger = qryBeneficiosTrocar.FieldbyName('NOVOIDBENEFICIO').AsInteger
      then begin
         qryBeneficiosTrocar.Next;
         continue;
      end;

      mmResult.Lines.Add(' ');
      mmResult.Lines.Add('Processando Benefício '+qryBeneficiosTrocar.FieldByName('NOME').AsString+'...');

      // **************************************************************************
      // 1. TRATAMENTOS DO BENEFICIO ANTIGO
      // **************************************************************************
      // Atualizar data final do beneficio anterior como um dia antes da data indicada
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE BENEFBFCIARIO                                     '+
                     ' SET    IDSITBENEFICIO = 3,                               '+
                     '        DATAFINAL      = TO_DATE('''+dtDataNovoBenef.Text+''',''DD/MM/YYYY'')-1 '+
                     ' WHERE  IDPLANOPREV    = '+qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString+
                     ' AND    IDBENEFICIO    = '+qryBeneficiosTrocar.FieldByName('IDBENEFICIO').AsString+
                     ' AND    NUMEROPROCESSO = '+qryBeneficiosTrocar.FieldByName('NUMEROPROCESSO').AsString+
                     ' AND    IDPESSJUR      = '+qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsString+
                     ' AND    IDTITULAR      = '+qryBeneficiosTrocar.FieldByName('IDTITULAR').AsString+
                     ' AND    IDPLANOORIGEM  = '+qryBeneficiosTrocar.FieldByName('IDPLANOORIGEM').AsString+
                     ' AND    IDPESSOA       = '+qryBeneficiosTrocar.FieldByName('IDPESSOA').AsString+
                     ' AND    SEQPROPOSTA    = '+qryBeneficiosTrocar.FieldByName('SEQPROPOSTA').AsString);

      try
         qryAux.ExecSQL;
      except
         mmResult.Lines.Add('Erro ao encerrar beneficio anterior[ERRO].');
         Exit;
      end;

      { Inicio Augusto 17/11/2005 - Gerar salários virtuais }
      iIdLote          := qryLote.FieldbyName('IDLOTE').AsInteger;
      sAnoMesPagamento := qryLote.FieldByName('MESREFERENCIA').AsString;

      sDataPagamento   := CriticaDataCobrancaSit(qryAux, IntToStr(iIdFundacao), '', 'AS', 'P',
                                                 Copy(sAnoMesPagamento,6,2),
                                                 Copy(sAnoMesPagamento,1,4),
                                                 true); //P.RAMOS-07.04.2006-PEND.22044

      if (qryBeneficiosTrocar.FieldbyName('FLGBENEFTEMP').AsInteger = 1) and
         (qryBeneficiosTrocar.FieldbyName('FLGSALVIRTBENEF').AsInteger = 1)
         // and ((Copy(dtDataNovoBenef.Text,7,4)+Copy(dtDataNovoBenef.Text,3,3) >= sAnoMesPagamento))
      then begin
         sSalarioIntegral  := BuscaSalarioPESSOAINTEGRAL ( qryAux,
                                                           qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsInteger,
                                                           qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsInteger,
                                                           qryBeneficiosTrocar.FieldByName('IDPESSOA').AsInteger,
                                                           qryBeneficiosTrocar.FieldByName('SEQPROPOSTA').AsInteger,
                                                           'AS',
                                                           sAnoMesPagamento);

         if not GeraSalarioRetroativo( qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsInteger,
                                       qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsInteger,
                                       qryBeneficiosTrocar.FieldByName('IDPESSOA').AsInteger,
                                       'AS',
                                       qryBeneficiosTrocar.FieldByName('DATAINICIO').AsString,
                                       sDataPagamento,
                                       sSalarioIntegral,
                                       sSalarioIntegral,
                                       sSalarioIntegral,
                                       qryAux,
                                       sMsgErro,
                                       qryBeneficiosTrocar.FieldByName('FLGINTEVENTO').AsString,
                                       True, { Acertar salários }
                                       6     { Revisão de Benefícios })
         then begin
            frmAguarde.Apaga;
            MsgDlg(' Ocorreram problmas na Geração dos Salários no Histórico.'+#13+
                      '[Erro : '+sMsgErro+']. Verifique.','Erro', mtError, [mbOk],0);
            Exit;
         end;
      end;
      { Fim Augusto 17/11/2005 }



      bOK := ProcessaAcertosRetemEncerra( qryAtualiza,
                                          qryAux,
                                          qryBeneficiosTrocar,
                                          'E',
                                          MontaSelect.ValoresChave[16], // INSCRICAONUMERO
                                          MontaSelect.ValoresChave[15], // MATRICULA
                                          qryBeneficiosTrocar.FieldByName('FLGCALCTODOMES').AsString,
                                          qryBeneficiosTrocar.FieldByName('DATAINICIO').AsString,
                                          //DateToStr(StrToDate(dtDataNovoBenef.Text)-1), // DATAFINAL                  // ClaudioR - 19962 - 16/08/2007
                                          FormatDateTime('dd/mm/yyyy', StrToDate(dtDataNovoBenef.Text)-1), // DATAFINAL // ClaudioR - 19962 - 16/08/2007
                                          qryBeneficiosTrocar.FieldByName('ULTMESREAJUSTE').AsString,
                                          qryBeneficiosTrocar.FieldByName('NUMEROPROCESSO').AsInteger,
                                          qryBeneficiosTrocar.FieldByName('IDBENEFICIO').AsInteger,
                                          qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsInteger,
                                          qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsInteger,
                                          qryBeneficiosTrocar.FieldByName('IDTITULAR').AsInteger,
                                          qryBeneficiosTrocar.FieldByName('IDPESSOA').AsInteger,
                                          qryBeneficiosTrocar.FieldByName('SEQPROPOSTA').AsInteger,
                                          qryBeneficiosTrocar.FieldByName('IDREGRAULTPAGTO').AsInteger,
                                          qryBeneficiosTrocar.FieldByName('IDREGRACALCULO').AsInteger,
                                          qryBeneficiosTrocar.FieldByName('VALORATUAL').AsFloat,
                                          (qryBeneficiosTrocar.FieldByName('FLGREFERENCIA').AsInteger=1),
                                          qryBeneficiosTrocar.FieldByName('IDEVENTOGERADOR').AsInteger,
                                          qryBeneficiosTrocar.FieldByName('FLGINTEVENTO').AsString,
                                          False,
                                          qryLote.FieldByName('IDLOTE').AsInteger,
                                          False,
                                          sMsgErro,
                                          '');
      if not bOK then begin
         mmResult.Lines.Add('Erro ao encerrar beneficio anterior[ERRO].');
         Exit;
      end;


      //leofuncef - 26102004
      //apaga registros de devolução feitos pelo encerramento
      //estes acertos serão feitos pela própria PreparaBeneficioConcedido do benefício novo
      qryAux.Close;
      qryAux.SQL.Clear;

      { Inicio Augusto 10/11/2005 - Opção de manter históricos }
      If Not ChBxMantenHst.Checked = True Then Begin
        qryAux.SQL.Add(' DELETE HSTBENEFBFCIARIO   ');
        //qryAux.SQL.Add(' SET VLBENEFPGTO = VALORPREV, DTEFETPGTO = DATAPAGAMENTO, FLGENVIADO = 1 ');
        qryAux.SQL.Add(' WHERE  IDPLANOPREV    = '+qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString+
                       ' AND    IDBENEFICIO    = '+qryBeneficiosTrocar.FieldByName('IDBENEFICIO').AsString+
                       ' AND    NUMEROPROCESSO = '+qryBeneficiosTrocar.FieldByName('NUMEROPROCESSO').AsString+
                       ' AND    IDPESSJUR      = '+qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsString+
                       ' AND    IDTITULAR      = '+qryBeneficiosTrocar.FieldByName('IDTITULAR').AsString+
                       ' AND    IDPLANOORIGEM  = '+qryBeneficiosTrocar.FieldByName('IDPLANOORIGEM').AsString+
                       ' AND    IDPESSOA       = '+qryBeneficiosTrocar.FieldByName('IDPESSOA').AsString+
                       ' AND    SEQPROPOSTA    = '+qryBeneficiosTrocar.FieldByName('SEQPROPOSTA').AsString+
                       ' AND    MESREFERENCIA  >= '''+Copy(dtDataNovoBenef.Text,7,4)+'/'+Copy(dtDataNovoBenef.Text,4,2)+''' '+
                       ' AND    FLGDEVOLUCAO = 1 '+
                       ' AND    TRUNC(TRGDTINCLUSAO) = TRUNC(SYSDATE) ');
        try
           qryAux.ExecSQL;
        except
        end;
        //leofuncef - 26102004 - fim

      End;
      { Fim Augusto 10/11/2005 }

      //mmResult.Lines.Add('Beneficio Anterior encerrado em '+DateToStr(StrToDate(dtDataNovoBenef.Text)-1)+' com sucesso [OK].');                      // ClaudioR - 19962 - 16/08/2007
      mmResult.Lines.Add('Beneficio Anterior encerrado em ' + FormatDateTime('dd/mm/yyyy', StrToDate(dtDataNovoBenef.Text)-1) + ' com sucesso [OK].'); // ClaudioR - 19962 - 16/08/2007

      if iIdUsuarioAutorizaVALOR > 0 Then
        iIdUsuarioAutoriza := iIdUsuarioAutorizaVALOR
      else
        iIdUsuarioAutoriza := iIdUsuarioAutorizaPERC;

      CriaLogOcorrenciaRetroativo( qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString,
                                   qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsString,
                                   qryBeneficiosTrocar.FieldByName('IDTITULAR').AsString,
                                   qryBeneficiosTrocar.FieldByName('IDBENEFICIO').AsString,
                                   qryBeneficiosTrocar.FieldByName('NUMEROPROCESSO').AsString,
                                   qryBeneficiosTrocar.FieldByName('IDPESSOA').AsString,
                                   qryBeneficiosTrocar.FieldByName('SEQPROPOSTA').AsString,
                                   '14', // sTipoMov,
                                   //DateToStr(date),
                                   FormatDateTime('dd/mm/yyyy', Date), // ClaudioR - 19962 - 16/08/2007
                                   qryBeneficiosTrocar.FieldByName('VALORATUAL').AsString,
                                   qryBeneficiosTrocar.FieldByName('VALORTOTAL').AsString,
                                   qryBeneficiosTrocar.FieldByName('VALORCOTAS').AsString,
                                   qryBeneficiosTrocar.FieldByName('DATAINICIO').AsString,
                                   qryBeneficiosTrocar.FieldByName('DATAFINAL').AsString,
                                   qryBeneficiosTrocar.FieldByName('VALORATUAL').AsString,
                                   qryBeneficiosTrocar.FieldByName('DATAINICIO').AsString,
                                   qryBeneficiosTrocar.FieldByName('DATAFINAL').AsString,
                                   qryBeneficiosTrocar.FieldByName('IDSITBENEFICIO').AsString,
                                   qryBeneficiosTrocar.FieldByName('FLGDATAPREVISTA').AsInteger,
                                   qryAux,
                                   '0',
                                   qryLote.FieldByName('IDLOTE').AsInteger,
                                   qryBeneficiosTrocar.FieldByName('VALORSRB').AsString,
                                   qryBeneficiosTrocar.FieldByName('VALORATUAL').AsString,
                                   iIdUsuarioAutoriza,
                                   iIdRetroativo ); { Augusto 19/05/2005 }


      // **************************************************************************
      // 2. TRATAMENTOS DO BENEFICIO NOVO
      // **************************************************************************

      { Inicio Augusto 11/11/2005 - Inserir novo processo caso desejado }

      If ChBxGeraNovoProcesso.Checked = True Then Begin

        piNumeroProcesso := LeUltRegistro(qryAux,'PROCESSOBENEF');

        sSQL := 'INSERT INTO PROCESSOBENEF '+
                 '  (NUMEROPROCESSO,   IDEVENTOGERADOR,  FLGACIDENTAL,     DTEVENTO,       '+
                 '   DTDIREITO,        DTREGISTRO,       VLBENEFDTDIREITO, VLBENEFDTPAGTO, '+
                 '   IDSITPROCESSO,    TRGDTINCLUSAO,    TRGUSERINCLUSAO)                  '+
                 'SELECT '+
                 '  '+ IntToStr( piNumeroProcesso )+', '+
                 '  PRO.IDEVENTOGERADOR,  PRO.FLGACIDENTAL,     PRO.DTEVENTO, '+
                 '  PRO.DTDIREITO,        PRO.DTREGISTRO,       PRO.VLBENEFDTDIREITO, PRO.VLBENEFDTPAGTO, '+
                 '  PRO.IDSITPROCESSO,    PRO.TRGDTINCLUSAO,    PRO.TRGUSERINCLUSAO                       '+
                 'FROM   '+
                 '  PROCESSOBENEF PRO '+
                 'WHERE  '+
                 '  PRO.NUMEROPROCESSO = '+qryBeneficiosTrocar.FieldByName('NUMEROPROCESSO').AsString;

        Try
           qryAux.SQL.Clear;
           qryAux.SQL.Add( sSQL );
           qryAux.ExecSQL;
        Except
           mmResult.Lines.Add('Erro na inserção do novo processo[ERRO].');
           Exit;
        End;

        mmResult.Lines.Add('Inserção do novo Processo processada com sucesso [OK].');

      End Else Begin

        piNumeroProcesso := qryBeneficiosTrocar.FieldByName('NUMEROPROCESSO').AsInteger;

      End;
      { Fim Augusto 11/11/2005 }



      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' INSERT INTO BFCIARIOTITPLAN ( IDRESPONNAOREC,            '+
                     ' IDPLANOORIGEM,     IDTITULAR,        IDPESSJUR,          '+
                     ' IDPLANOPREV,       IDPESSOA,         IDRESPONSAVEL,      '+
                     ' IDBENEFICIO,       SEQPROPOSTA,      CODTIPORECEBEDOR,   '+
                     ' IDNUCLEOFAMILIAR,  IDDEPENRESPON,    PRIORIDADE,         '+
                     ' PERCENTUAL,        DATAFIMRECEB )                        '+
                     ' SELECT IDRESPONNAOREC,            '+
                     ' IDPLANOORIGEM,     IDTITULAR,        IDPESSJUR,          '+
                     ' IDPLANOPREV,       IDPESSOA,         IDRESPONSAVEL,      '+
                     qryBeneficiosTrocar.FieldByName('NOVOIDBENEFICIO').AsString+','+ // IDBENEFICIO
                     ' SEQPROPOSTA,      CODTIPORECEBEDOR,                      '+
                     ' IDNUCLEOFAMILIAR,  IDDEPENRESPON,    PRIORIDADE,         '+
                     ' PERCENTUAL,        DATAFIMRECEB                          '+
                     ' FROM BFCIARIOTITPLAN                                     '+
                     ' WHERE  IDPLANOPREV    = '+qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString    +
                     ' AND    IDBENEFICIO    = '+qryBeneficiosTrocar.FieldByName('IDBENEFICIO').AsString    +
                     ' AND    IDPESSJUR      = '+qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsString      +
                     ' AND    IDTITULAR      = '+qryBeneficiosTrocar.FieldByName('IDTITULAR').AsString      +
                     ' AND    IDPLANOORIGEM  = '+qryBeneficiosTrocar.FieldByName('IDPLANOORIGEM').AsString  +
                     ' AND    IDPESSOA       = '+qryBeneficiosTrocar.FieldByName('IDPESSOA').AsString       +
                     ' AND    SEQPROPOSTA    = '+qryBeneficiosTrocar.FieldByName('SEQPROPOSTA').AsString    );

      try
         qryAux.ExecSQL;
      except
         mmResult.Lines.Add('Erro na inserção do novo benefício[ERRO].');
         Exit;
      end;


      mmResult.Lines.Add('Inserção do novo Benefício processada com sucesso [OK].');

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' INSERT INTO BENEFBFCIARIO (NUMEROPROCESSO, '+
                     ' IDPESSJUR,         IDPLANOPREV,      IDPLANOORIGEM,      '+
                     ' IDTITULAR,         IDPESSOA,         SEQPROPOSTA,        '+
                     ' IDBENEFICIO,       IDBENEFREFEREN,   CODPORTFORMA,       '+
                     ' IDSITBENEFICIO,    IDDEPENDENCIA,    IDTPPAGTOBENEFIC,   '+
                     ' VALORATUAL,        DATAREQUERIMENTO, DATAINICIO,         '+
                     ' DATAFINAL,         FLGFORMAPAGTO,    VALORCALCULADO,     '+
                     ' DATAULTREAJUSTE,   VLRCALCINSS,      VLRINFINSS,         '+
                     ' DATAINICIOINSS,    NUMPROCINSS,      DATAINICIOFUND,     '+
                     ' VALORCOTAS,        DATACONCESSAO,    FLGPROVISORIO,      '+
                     ' PERCPROVISORIO,    PRAZOPROVISORIO,  ULTMESREAJUSTE,     '+
                     ' ULTVALORATUALREAJ, IDAGENCIARESGATE, DATAFINALPREVISTA,  '+
                     ' FLGDATAPREVISTA,   FLGTIPOINSS,      DIBBENEFANT,        '+
                     ' VALORBENEFANT,     VALORBINSSANT1,   VALORBINSSANT2,     '+
                     ' VALORBINSSANT3,    VALORTOTAL,       FLGPOSSUIACOMPINSS, '+
                     ' FLGBENEFMIN,       VALORSRB)                             '+
                     ' SELECT '+
                     ' '+ IntToStr( piNumeroProcesso ) +', '+ { Augusto 16/11/2005 }
                     ' IDPESSJUR,         IDPLANOPREV,      IDPLANOORIGEM,      '+
                     ' IDTITULAR,         IDPESSOA,         SEQPROPOSTA,        '+
                     qryBeneficiosTrocar.FieldByName('NOVOIDBENEFICIO').AsString+','+ // IDBENEFICIO
                     ' IDBENEFREFEREN,    CODPORTFORMA,       '+
                     ' 1,    IDDEPENDENCIA,    IDTPPAGTOBENEFIC,   '+  //leofuncef - 05102004 - idsitbeneficio
                     ' '+oranumero(qryBeneficiosTrocar.FieldByName('NOVOVALORATUAL').AsString)+',        DATAREQUERIMENTO,                     '+ //leofuncef - 05102004
                     ' TO_DATE('''+dtDataNovoBenef.Text+''',''DD/MM/YYYY'') ,   '+ // DATAINICIO
                     ' NULL,              FLGFORMAPAGTO,   '+oranumero(qryBeneficiosTrocar.FieldByName('NOVOVALORATUAL').AsString)+' ,     '+ //leofuncef - 05102004
                     ' DATAULTREAJUSTE,   VLRCALCINSS,      VLRINFINSS,         '+
                     ' DATAINICIOINSS,    NUMPROCINSS,      DATAINICIOFUND,     '+
                     ' VALORCOTAS,        DATACONCESSAO,    FLGPROVISORIO,      '+
                     ' PERCPROVISORIO,    PRAZOPROVISORIO,  ULTMESREAJUSTE,     '+
                     ' ULTVALORATUALREAJ, IDAGENCIARESGATE, DATAFINALPREVISTA,  '+
                     ' FLGDATAPREVISTA,   FLGTIPOINSS,      DIBBENEFANT,        '+
                     ' VALORBENEFANT,     VALORBINSSANT1,   VALORBINSSANT2,     '+
                     ' VALORBINSSANT3,    '+oranumero(qryBeneficiosTrocar.FieldByName('NOVOVALORATUAL').AsString)+',       FLGPOSSUIACOMPINSS, '+ //leofuncef - 05102004
                     ' FLGBENEFMIN,       VALORSRB                              '+
                     ' FROM BENEFBFCIARIO                                        '+
                     ' WHERE  IDPLANOPREV    = '+qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString    +
                     ' AND    IDBENEFICIO    = '+qryBeneficiosTrocar.FieldByName('IDBENEFICIO').AsString    +
                     ' AND    NUMEROPROCESSO = '+qryBeneficiosTrocar.FieldByName('NUMEROPROCESSO').AsString +
                     ' AND    IDPESSJUR      = '+qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsString      +
                     ' AND    IDTITULAR      = '+qryBeneficiosTrocar.FieldByName('IDTITULAR').AsString      +
                     ' AND    IDPLANOORIGEM  = '+qryBeneficiosTrocar.FieldByName('IDPLANOORIGEM').AsString  +
                     ' AND    IDPESSOA       = '+qryBeneficiosTrocar.FieldByName('IDPESSOA').AsString       +
                     ' AND    SEQPROPOSTA    = '+qryBeneficiosTrocar.FieldByName('SEQPROPOSTA').AsString    );
      try
         qryAux.ExecSQL;
      except
         mmResult.Lines.Add('Erro na concessão do novo benefício[ERRO].');
         Exit;
      end;

      mmResult.Lines.Add('Concessão do novo Benefício processada com sucesso [OK].');

      { Inicio Augusto 10/11/2005 - Opção de manter históricos }
      If Not ChBxMantenHst.Checked = True Then Begin

        // Atualizar historico de beneficio passando beneficio antigo para novo
        // para os meses iguais ou posteriores a data indicada
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE HSTBENEFBFCIARIO   '+
                       ' SET    IDBENEFICIO    = '+qryBeneficiosTrocar.FieldByName('NOVOIDBENEFICIO').AsString);

        If ChBxGeraNovoProcesso.Checked = True Then
          qryAux.SQL.Add(' ,NUMEROPROCESSO = '+IntToStr( piNumeroProcesso )); { Augusto 16/11/2005 }

        qryAux.SQL.Add(' WHERE  IDPLANOPREV    = '+qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString+
                       ' AND    IDBENEFICIO    = '+qryBeneficiosTrocar.FieldByName('IDBENEFICIO').AsString+
                       ' AND    NUMEROPROCESSO = '+qryBeneficiosTrocar.FieldByName('NUMEROPROCESSO').AsString+
                       ' AND    IDPESSJUR      = '+qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsString+
                       ' AND    IDTITULAR      = '+qryBeneficiosTrocar.FieldByName('IDTITULAR').AsString+
                       ' AND    IDPLANOORIGEM  = '+qryBeneficiosTrocar.FieldByName('IDPLANOORIGEM').AsString+
                       ' AND    IDPESSOA       = '+qryBeneficiosTrocar.FieldByName('IDPESSOA').AsString+
                       ' AND    SEQPROPOSTA    = '+qryBeneficiosTrocar.FieldByName('SEQPROPOSTA').AsString+
                       ' AND    MESREFERENCIA  >= '''+Copy(dtDataNovoBenef.Text,7,4)+'/'+Copy(dtDataNovoBenef.Text,4,2)+'''');

        try
           qryAux.ExecSQL;
        except
        end;

      End;
      { Fim Augusto 10/11/2005 }

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT BP.IDREGRACALCULO, BP.IDREGRAPRIMPAGTO, BP.IDREGRAULTPAGTO, '+
                     '        BP.FLGCALCTODOMES, B.IDTPPAGTOBENEFIC '+
                     ' FROM   BENEFPLANPREV BP, BENEFICIO B                                                    '+
                     ' WHERE  BP.IDPLANOPREV = '+qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString+
                     ' AND    BP.IDBENEFICIO = '+qryBeneficiosTrocar.FieldByName('NOVOIDBENEFICIO').AsString+
                     ' AND    B.IDBENEFICIO  = BP.IDBENEFICIO ');
      qryAux.Open;

      rValorAtualizadoRateado  := 0;
      rValorAtualizadoTotal    := 0;
      sUltMesReajuste          := qryBeneficiosTrocar.FieldByName('ULTMESREAJUSTE').AsString;
      bErro                    := False;
      bPreparaContrib13        := False;
      dNovoSRB                 := qryBeneficiosTrocar.FieldByName('NOVOSRB').AsFloat;

      bOK := PreparaBeneficioConcedido( qryAux,
                                        qryBeneficiosTrocar.FieldByName('IDTITULAR').AsInteger,
                                        qryBeneficiosTrocar.FieldByName('IDPESSOA').AsInteger,
                                        qryBeneficiosTrocar.FieldByName('SEQPROPOSTA').AsInteger,
                                        qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsInteger,
                                        qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsInteger,
                                        piNumeroProcesso, { Augusto 16/11/2005                    - era qryBeneficiosTrocar.FieldByName('NUMEROPROCESSO').AsInteger, }
                                        qryBeneficiosTrocar.FieldByName('NOVOIDBENEFICIO').AsInteger,
                                        prmIDMOTIVOFOLHABEN,
                                        1, // piTotBeneficiarios
                                        qryAux.FieldbyName('IDREGRACALCULO').AsInteger,
                                        -1,
                                        qryAux.FieldbyName('IDREGRAPRIMPAGTO').AsInteger,
                                        qryAux.FieldbyName('IDREGRAULTPAGTO').AsInteger,
                                        qryAux.FieldbyName('IDTPPAGTOBENEFIC').AsInteger,
                                        qryBeneficiosTrocar.FieldbyName('CODPORTFORMA').AsInteger,
                                        '',
                                        '',
                                        '',
                                        MontaSelect.ValoresChave[15], // MATRICULA
                                        dtDataNovoBenef.Text,
                                        '',
                                        qryAux.FieldByName('FLGCALCTODOMES').AsString,
                                        qryBeneficiosTrocar.FieldByName('NOVOVALORATUAL').AsFloat,
                                        0,
                                        qryBeneficiosTrocar.FieldByName('NOVOVALORTOTAL').AsFloat,
                                        True,
                                        rValorAtualizadoRateado,
                                        rValorAtualizadoTotal,
                                        sUltMesReajuste,
                                        bErro,
                                        bPreparaContrib13,
                                        sMsgErro,
                                        iIdLote,
                                        dtDataNovoBenef.Text,
                                        //7,
                                        13,//leofuncef - 27072005 - tipomov de revisão
                                        0,
                                        dNovoSRB,
                                        iIdCalculo
                                        );
      if not bOK
      then begin
         mmResult.Lines.Add('Erro no preparo do novo benefício[ERRO].');
         Exit;
      end;


      {------------------------------------------------------------------------}
      { Calculo das novas contribuições e acerto.                              }
      If ChBxAcertaContrib.Checked = True Then Begin

        sDescPreparo := 'Contribuição de Assistido - Matrícula: ' +
                        MontaSelect.ValoresChave[15] +
                        ' - Processo n°: ' + IntToStr(piNumeroProcesso);


        // Prepara query para passar as contribuicoes a cobrar para o Preparo
        sSQL := ' SELECT CP.IDCONTRIBUICAO, CP.SEQPROPOSTA, CP.IDCONTRIBUICAO, CP.IDPESSOA,    ' +
                '        CP.CODPORTFORMA, CP.FLGDESCFOLHA, CP.VALORBASE1, CP.VALORBASE2,       ' +
                '        CP.VALORBASE3, CP.DATAINICIO, CP.DATAFINAL, C.NOME, PP.INSCRICAODATA, ' +
                '        PF.DATANASC, CT.ORDEMCALCULO                                          ' +
                ' FROM  CONTRIBUICAO C, CONTPREV CT,  PARTPREVPLAN PP, CONTRIBPREVPARTP CP,    ' +
                '       PESSOAFISICA PF                                                        ' +
                ' WHERE CP.IDPESSJUR      = ' + qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsString   + ' AND ' +
                '       CP.IDPLANOPREV    = ' + qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString + ' AND ' +
                '       CP.IDPESSOA       = ' + qryBeneficiosTrocar.FieldByName('IDTITULAR').AsString   + ' AND ' +
                '       CP.SEQPROPOSTA    = ' + qryBeneficiosTrocar.FieldByName('SEQPROPOSTA').AsString + ' AND ' +
                '       CP.FLGRETROATIVO  = 1 AND ' +
                '       CP.FLGCOBRA = 1 AND '+  //leocm - 16102002 - apenas as contribuições ativas
                '       CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND '+
                '       PP.IDPESSJUR      = CP.IDPESSJUR AND '+
                '       PP.IDPLANOPREV    = CP.IDPLANOPREV AND '+
                '       PP.IDPESSOA       = CP.IDPESSOA AND '+
                '       PP.SEQPROPOSTA    = CP.SEQPROPOSTA AND '+
                '       PF.IDPESSOA       = CP.IDPESSOA AND '+
                '       CT.IDPLANOPREV    = CP.IDPLANOPREV AND '+
                '       CT.IDCONTRIBUICAO = CP.IDCONTRIBUICAO '+
                ' ORDER BY CT.ORDEMCALCULO ';

        qryContrib1.Close;
        qryContrib1.SQL.Clear;
        qryContrib1.SQL.Add(sSQL);
        try
           qryContrib1.Open;
        except
           mmResult.Lines.Add( ' Erro na consulta de contribuições a preparar. ');
           exit;
        end;

        // Se, no evento (principalmente os temporarios), o usuario optou
        // por usar salario virtual, passar o salario virtual como salario
        // senao, calcular salario
        sMesReferencia   := Copy(dtDataNovoBenef.Text,7,4)+'/'+Copy(dtDataNovoBenef.Text,4,2);

        if (qryBeneficiosTrocar.FieldbyName('FLGINTEVENTO').AsString = 'IN') or
           (qryBeneficiosTrocar.FieldbyName('FLGINTEVENTO').AsString = 'DO') or
           (qryBeneficiosTrocar.FieldbyName('FLGINTEVENTO').AsString = 'AC') or
           (qryBeneficiosTrocar.FieldbyName('FLGINTEVENTO').AsString = 'OE')
        then begin
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(' SELECT SALAUXDOENCA, FLGSALVIRTBENEF '+
                          ' FROM   PARTPREVPLAN '+
                          ' WHERE  IDPESSOA    = '+qryBeneficiosTrocar.FieldByName('IDPESSOA').AsString    +
                          ' AND    IDPESSJUR   = '+qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsString   +
                          ' AND    IDPLANOPREV = '+qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsString +
                          ' AND    SEQPROPOSTA = '+qryBeneficiosTrocar.FieldByName('SEQPROPOSTA').AsString );
           qryAux.Open;

           // Se nao encontrou o salario virtual, pegar o salario default
           if (qryAux.IsEmpty) or
              (qryAux.FieldByName('SALAUXDOENCA').AsString = '') or
              (qryAux.FieldByName('SALAUXDOENCA').AsString = '0') or
              (qryAux.FieldByName('FLGSALVIRTBENEF').AsInteger <> 1)
           then sSalPart := ORANUMERO(CalcSalPart(qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsInteger,
                                                  qryBeneficiosTrocar.FieldByName('IDPESSOA').AsInteger,
                                                  sAnoMesAnterior(sMesReferencia),
                                                  qryAux))
           else sSalPart := ORANUMERO(qryAux.FieldbyName('SALAUXDOENCA').AsString);
        end
        else sSalPart := ORANUMERO(CalcSalPart(qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsInteger,
                                               qryBeneficiosTrocar.FieldByName('IDPESSOA').AsInteger,
                                             sAnoMesAnterior(sMesReferencia),
                                         qryAux));


        bOK := PreparaContribuicaoASSISTIDO( qryBeneficiosTrocar.FieldByName('IDPESSJUR').AsInteger,
                                             qryBeneficiosTrocar.FieldByName('IDPLANOPREV').AsInteger,
                                             prmIdMotivoContrib, 0,
                                             qryContrib1, qryAux, sSQL,
                                             '', // sSQLRegra,
                                             '', // sWhereSQLRegra,
                                             '', // sAliasSQLRegra,
                                             'AS',
                                             sDescPreparo,
                                             'R','1',
                                             False, False, sMsgErro,
                                             iIdLote,
                                             sSalPart,'',
                                             qryBeneficiosTrocar.FieldByName('FLGINTEVENTO').AsString,                                           True,False,'',False,
                                             qryBeneficiosTrocar.FieldByName('IDEVENTOGERADOR').AsInteger,
                                             dtDataNovoBenef.Text,
                                             qryBeneficiosTrocar.FieldByName('DATAFINAL').AsString,
                                             6, { Origem 6, Revisão de Benenficio }
                                             qryBeneficiosTrocar.FieldByName('FLGDATAPREVISTA').AsInteger,
                                             dtDataNovoBenef.Text,
                                             piNumeroProcesso );
        if not bOK then begin
           mmResult.Lines.Add('Erro no preparo das novas contribuições[ERRO].');
           Exit;
        end;

      End; { If ChBxAcertaContrib.Checked = True Then Begin }

      {------------------------------------------------------------------------}

      mmResult.Lines.Add('Preparo do Novo Benefício processado com sucesso [OK].');

      qryBeneficiosTrocar.Next;
   end;

   mmResult.Lines.Add(' ');
   frmAguarde.Apaga;

   Result := True;
end; // ProcessaAlteracaoTipoBeneficio

// *****************************************************************************
// CÁLCULO RETROATIVO DE CONTRIBUIÇÃO
// *****************************************************************************
function  TfrmRetroativoPrev.ProcessaoRevisaoSalarioContribuicao( psAnoMesIni      : string;
                                                  psAnoMesFim      : string;
                                                  piIdPessJur      : longint;
                                                  piIdPlanoPrev    : longint;
                                                  piIdPessoa       : longint;
                                                  piSeqProposta    : longint;
                                                  psContribuicoes  : string    ) : integer;
var sFiltro               : string;
    sMsgErro              : string;
    sAnoMesAtual          : string;
    sAnoMesDataInicio     : string;
    sAnoMesDataFinal      : string;
    sAnoMesLote           : string;
    sSalarioIntegral      : string;
    sSalarioNoMes         : string;
    sIdSitPartNoMes       : string;
    sFlgSitPartNoMes      : string; // CAMILLE - 27.10.2004
    sDataRef              : string;
    sSQLRegra             : string;
    sValorRegra           : string;
    sValorIntegral        : string;
    sSituacaoHoje         : string;
    sDataDeveriaTerPago   : string;
    bReajustaSalarioNoInicio, bErro, bExcluiPrevia : boolean;
    bGravaAlterador       : boolean;
    dDiferenca            : double;
    iFlgDescFolha         : integer;
    iFlgIncluiMesConc     : integer;
    iNumRecebimento       : longint;
    iIdLoteiNsere         : longint;
    sSalarioAntesReajuste : string;
    iNumProcesso          : longint; // ANDRE GOMES 14042004
    bPrimCont, bBeneficioTemporario  : boolean; // CAMILLE - 08.07.2004 - PENDENCIA 17171
    iIdContribuicao, iFlgDevolucao : integer; // CAMILLE - 27.10.2004
    dTotalAlterador : double;  // CAMILLE - 28.10.2004
    dValorAcerto          : double;  // CAMILLE - 28.10.2004
    iCodAlterador         : longint; // CAMILLE - 05.11.2004
    sAnoMesInicioAcerto   : string;
    sAnoMesFimAcerto      : string;
    dCorrecaoMonetaria    : Currency;
    sDataPrevisaoReceb    : String;  // Gleyber - 13/06/2005 - Pendência 18852
    iCodPortForma         : Integer; // Gleyber - 14/08/2006 - Pendência 22838
    dTotalDiferenca, dTotalAcerto : Double;
    sMes                  : String;  // Gleyber - 23/08/2006 - Pendência 22838
begin
   Result        := -1;
   sAnoMesAtual  := psAnoMesIni;

   iIdCalculoGeral := -1;
   
//   If Trim(sContribuicoes) = '' Then Exit;

   if not chkGravaDemons.Checked
   then begin
      mmResult.Lines.Add('             '+PreparaStr('Mês',7)  +' '+PreparaStr('Salário'  ,10)+' '+PreparaStr('Novo   '  ,10)+' '+PreparaStr('Contrib.',12)+' '+PreparaStr('Valor'  ,10)+' '+PreparaStr('Novo' ,10)+' '+PreparaStr('Diferença',10)+' '+PreparaStr('Alterador',10)+' '+PreparaStr('Total' ,10));
      mmResult.Lines.Add('             '+PreparaStr(' '  ,7)  +' '+PreparaStr('Anterior' ,10)+' '+PreparaStr('Salário'  ,10)+' '+PreparaStr(' '       ,12)+' '+PreparaStr('Cobrado',10)+' '+PreparaStr('Valor',10)+' '+PreparaStr('         ',10)+' '+PreparaStr('         ',10)+' '+PreparaStr('Acerto',10));
   end;

   If CkbxGravaDemo.Checked Then Begin { Agusto 21/12/2004 }
     GravaLinhaTXT('             '+PreparaStr('Mês',7)  +' '+PreparaStr('Salário'  ,10)+' '+PreparaStr('Novo   '  ,10)+' '+PreparaStr('Contrib.',12)+' '+PreparaStr('Valor'  ,10)+' '+PreparaStr('Novo' ,10)+' '+PreparaStr('Diferença',10)+' '+PreparaStr('Alterador',10)+' '+PreparaStr('Total' ,10));
     GravaLinhaTXT('             '+PreparaStr(' '  ,7)  +' '+PreparaStr('Anterior' ,10)+' '+PreparaStr('Salário'  ,10)+' '+PreparaStr(' '       ,12)+' '+PreparaStr('Cobrado',10)+' '+PreparaStr('Valor',10)+' '+PreparaStr('         ',10)+' '+PreparaStr('         ',10)+' '+PreparaStr('Acerto',10));
   End;

   sSalarioIntegral := '0';

   if Trim(DbLkcAlterador.Text) = ''
   then iCodAlterador := -1
   else iCodAlterador := QryAlteradorCorrecao.FieldByname('CODALTERADOR').AsInteger;

   if rbtnIndividual.Checked
   then sAnoMesInicioAcerto := edAnoMesIniAcerto.Text
   else sAnoMesInicioAcerto := edAnoMesIniAcerto.Text;
   if rbtnIndividual.Checked
   then sAnoMesFimAcerto := edAnoMesFimAcerto.Text
   else sAnoMesFimAcerto := edAnoMesFimAcerto.Text;

   { Inicio Augusto 04/07/2006 - Totalizar diferença }
   dTotalDiferenca := 0;
   dTotalAcerto    := 0;

   { Fim Augusto 04/07/2006                          }

   bReajustaSalarioNoInicio := chkReajustaSalPartInicio.Checked;
   bExcluiPrevia            := True;

   While sAnoMesAtual <= psAnoMesFim do begin

     // Buscar situacao do participante no mes
     with qry do begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT EV.IDEVENTOSPREV,  EV.IDSITPLANOATUAL, EV.IDSITPLANONOVO, '+
                '        EV.IDSITPARTATUAL, EV.IDSITPARTNOVO,   EV.IDSITFUNCATUAL, '+
                '        EV.IDSITFUNCNOVO,                                         '+
                '        ST.FLGINTERNO,     STA.FLGINTERNO AS FLGINTERNOANT        '+
                ' FROM   EVENTOSPREV EV,    SITPART ST,  SITPART STA               '+
                ' WHERE  EV.IDSITPARTATUAL = STA.IDSITPART(+)                      '+ //leofuncef - 08122004
                ' AND    EV.IDSITPARTNOVO  = ST.IDSITPART                          '+
                ' AND    EV.IDEVENTOSPREV IN ( SELECT MAX(IDEVENTOSPREV) FROM EVENTOSPREV    '+
                '                              WHERE  IDPESSOA    = '+ IntToStr(piIdPessoa)   +
                '                              AND    DATAEVENTO = ( SELECT MAX(DATAEVENTO) FROM EVENTOSPREV '+
                '                                                    WHERE  IDPESSOA     = '+IntToStr(piIdPessoa)+
                '                                                    AND    TO_CHAR(DATAEVENTO,''YYYY/MM'')  <= '''+sAnoMesAtual+''''+
                '                                                    AND    TO_CHAR(NVL(DATAVOLTA,SYSDATE),''YYYY/MM'') >= '''+sAnoMesAtual+''') )'); { Augusto 02/06/2005 }
        Open;
        if not IsEmpty
        then begin
           sIdSitPartNoMes  := FieldByName('IDSITPARTNOVO').AsString;
           sFlgSitPartNoMes := FieldByName('FLGINTERNO').AsString; // CAMILLE - 27.10.2004
        end
        else begin
           sIdSitPartNoMes  := '-1';
           sFlgSitPartNoMes := '  '; // CAMILLE - 27.10.2004
        end;
     end;

     // ANDRE GOMES - 14.04.2004
     qryAux.close;
     qryAux.sql.Clear;
     qryAux.sql.add(' SELECT BF.NUMEROPROCESSO, BF.IDBENEFICIO, B.FLGBENEFTEMP '+ // CAMILLE - 08.07.2004 - PENDENCIA 17171
                    ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP, BENEFICIO B     '+ // CAMILLE - 08.07.2004 - PENDENCIA 17171
                    ' WHERE  BF.IDPESSJUR    = '+inttostr(qryPessoasATratar.FieldByName('IDPESSJUR').AsInteger)+
                    ' AND    BF.IDPESSOA     = '+inttostr(qryPessoasATratar.FieldByName('IDPESSOA').AsInteger)+
                    ' AND    BF.IDPLANOPREV  = '+inttostr(qryPessoasATratar.FieldByName('IDPLANOPREV').AsInteger)+
                    ' AND    BF.IDTITULAR    = '+inttostr(qryPessoasATratar.FieldByName('IDTITULAR').AsInteger)+ //leofuncef - 02022005 - troquei por IDTITULAR
                    ' AND    BF.SEQPROPOSTA  = '+inttostr(qryPessoasATratar.FieldByName('SEQPROPOSTA').AsInteger)+
                    ' AND    BP.FLGREFERENCIA = 0 '+
                    ' AND    TO_CHAR(BF.DATAINICIOFUND,''YYYY/MM'') <= '''+sAnoMesAtual+''''+
                    ' AND    ((BF.DATAFINAL IS NULL) OR (TO_CHAR(BF.DATAFINAL,''YYYY/MM'') >= '''+sAnoMesAtual+'''))'+
                    ' AND    B.IDBENEFICIO   = BF.IDBENEFICIO '+// CAMILLE - 08.07.2004 - PENDENCIA 17171
                    ' AND    BP.IDPLANOPREV   = BF.IDPLANOPREV(+) '+
                    ' AND    BP.IDBENEFICIO   = BF.IDBENEFICIO(+) '+
                    ' ORDER BY BF.NUMEROPROCESSO ');
     qryAux.open;

     if (qryAux.IsEmpty) then begin
       iNumProcesso := -1;
       bBeneficioTemporario := False;// CAMILLE - 08.07.2004 - PENDENCIA 17171
     end else begin
       iNumProcesso := qryAux.FieldByName('NUMEROPROCESSO').AsInteger;
       bBeneficioTemporario := (qryAux.FieldByName('FLGBENEFTEMP').AsInteger = 1); // CAMILLE - 08.07.2004 - PENDENCIA 17171
       iIdBeneficio := qryAux.FieldByName('IDBENEFICIO').AsInteger;
     end;
     qryAux.Close;
     // ANDRE GOMES - FIM - 14.04.2004


     {** INICIO CONTRIUIÇÃO PARA PENSIONISTA **********************************}
     If qryPessoasATratar.FieldByName('IDTITULAR').AsInteger <> qryPessoasATratar.FieldByName('IDPESSOA').AsInteger
     Then Begin

       If (not bExcedeuLimite) then begin

         { Augusto 29/01/2004 - Calcular somente contribuições dos meses acertados }
         If (sAnoMesAtual >= sAnoMesInicioAcerto) And
            (sAnoMesAtual <= sAnoMesFimAcerto)
         Then Begin
           { Augusto 30/03/2004 - Abono já é calculado na Rotina de Contribuição  }
           If (Copy(sAnoMesAtual,6,2) <> '13') Then Begin

             { Inicio Augusto 10/12/2003 - Gerar contribuicoes por nucleo }
             if not GeraContribBenef(QryContrib1, QryContrib2, QryAux,
                                     IntToStr(piIdPessoa)+',', // StrConcedidos
                                     iNumProcesso,
                                     -1,      { Somar todos os Lotes }
                                     sAnoMesAtual,
                                     sDataEvento,
                                     sAnoMesAtual,
                                     qryMotivo.FieldByName('IDMOTIVO').AsString,
                                     qryLote.FieldByName('IDLOTE').AsInteger, { Lote Revisão      }
                                     '',      { Data Encerramento }
                                     6,       { Origem 6, Revisão de Benenficio }
                                     sContribuicoes) { Contribuições, passada com virgula no final }
             then begin
                dtmBaseDados.dbBaseDados.RollBack;
                MsgDlg('Erro no preparo das contribuições do núcleo familiar. Verifique. ','Erro',mtError,[mbOk,mbHelp],0);
                TiraSQL(qryAux);
                Exit;
             End;
           End;

           { Preencher Demonstrativo }
           sSQL :='SELECT '+
                   '  CON.IDCONTRIBUICAO, CON.NOME, HCP.IDMOTIVO, HCP.IDPESSOA, ' +
                   '  SUM(HCP.VALORESPERADO) AS VALORESPERADO, HCP.FLGDEVOLUCAO, HCP.MESREFERENCIA, '+
                   '  P.NOME AS NOMERESPCONT, TRUNC(HCP.TRGDTINCLUSAO) '+
                   'FROM   '+
                   '  HSTCONTRIBPREV HCP, CONTRIBUICAO CON, PESSOA P '+
                   'WHERE  '+
                   '  HCP.IDPESSOA = (SELECT NF.IDRESPNUCLEO '+
                   '                  FROM BFCIARIOTITPLAN BF, NUCLEOFAMILIAR NF '+
                   '                  WHERE BF.IDPESSJUR = '+IntToStr(piIdPessJur)+'  AND '+
                   '                  BF.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)  +'  AND '+
                   '                  BF.IDTITULAR   = '+qryPessoasATratar.FieldByName('IDTITULAR').AsString+' AND '+
                   '                  BF.IDPESSOA    = '+IntToStr(piIdPessoa)     +' AND '+
                   '                  BF.IDBENEFICIO = '+IntToStr(iIdBeneficio)   +' AND '+
                   '                  BF.IDNUCLEOFAMILIAR = NF.IDNUCLEOFAMILIAR) AND '+
                   '  HCP.MESREFERENCIA  = '+QuotedStr(sAnoMesAtual) +' AND '+
                   '  HCP.IDCONTRIBUICAO = CON.IDCONTRIBUICAO AND  '+
                   '  HCP.IDPESSOA       = P.IDPESSOA  '+
                   'GROUP BY '+
                   '  CON.IDCONTRIBUICAO, CON.NOME, HCP.MESREFERENCIA, HCP.FLGDEVOLUCAO, HCP.IDMOTIVO, P.NOME, HCP.IDLOTE, TRUNC(HCP.TRGDTINCLUSAO), HCP.IDPESSOA  ';

           If FazQuery(QryAux,sSQL) Then Begin
             qryDemonstrativo.Insert;
             While Not QryAux.Eof Do Begin
                qryDemonstrativo.FieldbyName('ANOMES').AsString := sAnoMesAtual;

                //If (QryAux.FieldbyName('TRUNC(HCP.TRGDTINCLUSAO)').AsString <> DateToStr(Date)) then                  // ClaudioR - 19962 - 16/08/2007
                If (QryAux.FieldbyName('TRUNC(HCP.TRGDTINCLUSAO)').AsString <> FormatDateTime('dd/mm/yyyy', Date)) then // ClaudioR - 19962 - 16/08/2007
                begin
                  If QryAux.FieldbyName('FLGDEVOLUCAO').AsInteger= 0 Then Begin
                    qryDemonstrativo.FieldbyName('VALORANTES').AsFloat := qryDemonstrativo.FieldbyName('VALORANTES').AsFloat+
                                                                          QryAux.FieldbyName('VALORESPERADO').AsFloat;
                  End Else Begin
                    qryDemonstrativo.FieldbyName('VALORANTES').AsFloat := qryDemonstrativo.FieldbyName('VALORANTES').AsFloat-
                                                                          QryAux.FieldbyName('VALORESPERADO').AsFloat;
                  End;
                End Else Begin
                   if QryAux.FieldbyName('FLGDEVOLUCAO').AsInteger = 0 then //leofuncef - 21012005
                   qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat  := QryAux.FieldbyName('VALORESPERADO').AsFloat *-1
                   else qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat  := QryAux.FieldbyName('VALORESPERADO').AsFloat;
                End;

                If QryAux.FieldbyName('FLGDEVOLUCAO').AsInteger= 0 Then Begin
                  qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat    :=
                    qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat +
                    QryAux.FieldbyName('VALORESPERADO').AsFloat;
                End Else Begin
                  qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat    :=
                    qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat -
                    QryAux.FieldbyName('VALORESPERADO').AsFloat;
                End;
                qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat    := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat;
                qryDemonstrativo.FieldbyName('TIPO').AsString          := 'C'; // contribuicao
                { Inicio Augusto 17/01/2005 }
                qryDemonstrativo.FieldbyName('IDTITULAR').AsString     := qryPessoasATratar.FieldByName('IDTITULAR').AsString;
                qryDemonstrativo.FieldbyName('IDPLANOPREV').AsString   := qryPessoasATratar.FieldByName('IDPLANOPREV').AsString;
                qryDemonstrativo.FieldbyName('IDPESSOA').AsString      := QryAux.FieldByName('IDPESSOA').AsString;
                qryDemonstrativo.FieldbyName('IDENTIFICADOR').AsString := QryAux.FieldByName('IDCONTRIBUICAO').AsString; { Augusto 17/01/2005 }
                { Fim Augusto 17/01/2005 }
                qryDemonstrativo.FieldbyName('DESCRICAO').AsString     := Copy(QryAux.FieldByName('NOME').AsString,1,30);

                QryAux.Next;
             End; { While }

             { Augusto 05/03/2004 }
             qryDemonstrativo.FieldbyName('NOMEBENEF').AsString := QryAux.FieldByName('NOMERESPCONT').AsString;
             qryDemonstrativo.Post;
             bPrimCont := False;

             { Augusto 05/01/2005 - Buscar NUMRECEBIMENTO para inserir na HSTATRASOCONTRIB }
             sSQL := 'SELECT H.IDCONTRIBUICAO, H.NUMRECEBIMENTO FROM '+
                     'HSTCONTRIBPREV H WHERE H.NUMRECEBIMENTO =      '+
                     '(SELECT MAX(NUMRECEBIMENTO) AS NUMRECEBIMENTO  '+
                     ' FROM HSTCONTRIBPREV HCP '+
                     ' WHERE                   '+
                     '  HCP.IDPESSOA = '+ QryAux.FieldByName('IDPESSOA').AsString      +' AND '+
                     '  HCP.IDMOTIVO = '+ qryMotivo.FieldByName('IDMOTIVO').AsString   +' AND '+
                     '  HCP.IDLOTE   = '+ IntToStr(qryLote.FieldByName('IDLOTE').AsInteger)                                      +' AND '+
                     '  HCP.MESREFERENCIA  = '+ QuotedStr(sAnoMesAtual)                          +')    ';

             If FazQuery(QryAux, sSQL) Then Begin

               iNumRecebimento := qryAux.FieldByName('NUMRECEBIMENTO').AsInteger;
               iIdContribuicao := qryAux.FieldByName('IDCONTRIBUICAO').AsInteger;

               If iNumRecebimento > 0 Then Begin
                 { Calcular Alterados }
                 If Trim(DbLkcAlterador.Text) = '' Then Begin
                   If Not CalculaAlteradores('C', sAnoMesAtual,
                                             qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat,
                                             dCorrecaoMonetaria,
                                             iIdContribuicao, iNumRecebimento)
                   Then Begin
                     dtmBaseDados.dbBaseDados.RollBack;
                     MsgDlg('Erro no calculo dos alteradores.', 'Erro', mtError, [mbOk,mbHelp], 0);
                     TiraSQL(qryAux);
                     Exit;
                   End;
                   qryDemonstrativo.Edit;
                   qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat :=
                     qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat + dCorrecaoMonetaria;
                   qryDemonstrativo.Post;
                 End; { If Trim(DbLkcAlterador.Text) = '' }

               End; { If iNumRecebimento > 0}

             End; { If FazQuery(QryAux, sSQL) }

           End; { If FazQuery(QryAux,sSQL) Then Begin }

         End; { If (sAnoMesAtual >= sAnoMesInicioAcerto) And }

       End; { If (not bExcedeuLimite) }

       Result := 0;
       sAnoMesAtual  := ProximoAnoMes13(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4))); // Gleyber - 23/08/2006 - Pendência 22838
       Continue;
     End;
     {** FINAL CONTRIUIÇÃO PARA PENSIONISTA ***********************************}

      // Verificar contribuicoes que a pessoa deveria estar pagando no mês
      with qryContribNoMes do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT PP.IDPESSJUR AS IDPESSJURHOJE, PP.IDPLANOPREV AS IDPLANOPREVHOJE, '+
                 '        SP.FLGINTERNO AS FLGINTERNOATUAL,  '+ { Augusto 06/05/2005 }
                 '        PP.IDPESSOA, PP.SEQPROPOSTA,                                      '+
                 '        CPP.IDPESSJUR,    CPP.IDPLANOPREV,                                '+
                 '        CPP.IDCONTRIBUICAO, CPP.DATAINICIO, CPP.DATAFINAL,                '+
                 '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3,                   '+
                 '        CP.IDREGRACALCULO, CP.IDREGRAPRIMPAGTO, CP.IDREGRAULTPAGTO,       '+

                 '        CP.FLGINTERNO AS FLGINTERNOCONT, '+ { Augusto 21/09/2001 }

                 ''''+sFlgSitPartNoMes+''' AS FLGINTERNO, PP.INSCRICAODATA, PF.DATANASC,    '+ // CAMILLE - 27.10.2004
                 '        DECODE(PF.DATAMORTE, NULL, SP.FLGINTERNO, ''FL'') AS SITUACAOHOJE,'+

                 '        DECODE('''+sFlgSitPartNoMes+''',''MA'', PT.IDRUBSALMANUT, ''AS'', PT.IDRUBSALAUXDOENCA, PT.IDRUBSALPARTICIP) AS IDRUBRICA, '+
                 '        DECODE('''+sFlgSitPartNoMes+''',''MA'', RMANTIDO.CODPROVDESC, ''AS'', RASSISTIDO.CODPROVDESC, RATIVO.CODPROVDESC) AS CODPROVDESC, '+
                 '        C.NOMERESUM, CPP.ULTMESPREPARO,                                                                   '+ //  CAMILLE - 05.11.2004
                 '        CPP.CODPORTFORMA                                                                                  '+ // Gleyber - 14/08/2006 - Pendência 22838
                 ' FROM   PESSOAFISICA PF, PARTPREVPLAN PP, CONTRIBPREVPARTP CPP,           '+
                 '        SITPART SP,  CONTPREV CP, PATRO PT, RUBRICAXPESS RATIVO,          '+
                 '        RUBRICAXPESS RMANTIDO, RUBRICAXPESS RASSISTIDO, CONTRIBUICAO C    '+
                 ' WHERE  CPP.IDPESSOA                         = '+IntToStr(piIdPessoa)      +
                 ' AND    CPP.IDPLANOPREV                      = '+IntToStr(piIdPlanoPrev)   + { Augusto 27/12/2006 }
                 ' AND    TO_CHAR(CPP.DATAINICIO,''YYYY/MM'')  <= '''+sAnoMesAtual+''''      +
                 ' AND    ((TO_CHAR(CPP.DATAFINAL,''YYYY/MM'') >= '''+sAnoMesAtual+''') OR (CPP.DATAFINAL IS NULL) )'+
                 ' AND    CP.IDPLANOPREV                       = CPP.IDPLANOPREV            '+
                 ' AND    CP.IDCONTRIBUICAO                    = CPP.IDCONTRIBUICAO         '+
                 ' AND    PP.IDPESSOA                          = CPP.IDPESSOA               '+
                 ' AND    PP.FLGDESATIVADO                     = 0                          '+
                 ' AND    PF.IDPESSOA                          = CPP.IDPESSOA               '+
                 ' AND    SP.IDSITPART                         = PP.IDSITPART               '+
                 ' AND    PT.IDPESSOA                          = CPP.IDPESSJUR              '+
                 ' AND    C.IDCONTRIBUICAO                     = CPP.IDCONTRIBUICAO         '+
                 ' AND    RATIVO.IDPESSOA(+)                   = PT.IDPESSOA                '+
                 ' AND    RATIVO.IDRUBRICA(+)                  = PT.IDRUBSALPARTICIP        '+
                 ' AND    RASSISTIDO.IDPESSOA(+)               = PT.IDPESSOA                '+
                 ' AND    RASSISTIDO.IDRUBRICA(+)              = PT.IDRUBSALAUXDOENCA       '+
                 ' AND    RMANTIDO.IDPESSOA(+)                 = PT.IDPESSOA                '+
                 ' AND    RMANTIDO.IDRUBRICA(+)                = PT.IDRUBSALMANUT           ');

         if psContribuicoes <> ''
         then SQL.Add('AND CPP.IDCONTRIBUICAO IN ('+psContribuicoes+')                      ');
         SQL.Add(' ORDER BY CP.ORDEMCALCULO                                                 ');

         Open;

         if IsEmpty
         then begin
            Result := 1;
            sAnoMesAtual  := ProximoAnoMes13(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));  // Gleyber - 23/08/2006 - Pendência 22838
            continue;
         end;
         First;

         if (FieldByName('SITUACAOHOJE').AsString = 'AS') or (FieldByName('SITUACAOHOJE').AsString = 'FL')
         then begin
            if iIdLoteRetroativo <= 0
            then begin
               sAnoMesLote       := edMesAcerto.Text;
               // andre gomes 14042004 ==> na linha abaixo aparentemente buscaria o idlote retroativo
               // esta inibido e passa o lote atual. no momento de buscar o beneficio
               // para o calculo da contrib de assist a SQL volta nula
               //  Function CalcBeneficioDoMovimento

//               iIdLoteRetroativo := SelecionaLoteBeneficioAberto(sAnoMesLote, iFlgIncluiMesConc );
               iIdLoteRetroativo := qryLote.FieldByName('IDLOTE').AsInteger;

               if iIdLoteRetroativo <= 0
               then begin
                  bErro := True;
                  MsgDlg('Nenhum lote selecinado para efetuar os acertos do retroativo. Verifique. ','Erro',mtError,[mbOk, mbHelp],0);
                  Exit;
               end;
            end;
         end;

         // Preencher forma de acerto

         sSituacaoHoje := FieldByName('SITUACAOHOJE').AsString;
         if FieldByName('SITUACAOHOJE').AsString = 'AT'
         then begin
            if dblkpFormaAtivos.Text = 'Folha'
            then iFlgDescFolha  := 1
            else iFlgDescFolha  := 0;
            bGravaAlterador     := (dblkpALTAtivos.Text = 'Sim');
            iIdLoteInsere       := -1;
         end
         else if ( FieldByName('SITUACAOHOJE').AsString = 'MA' ) or ( FieldByName('SITUACAOHOJE').AsString = 'MP' ) { Augusto 11/07/2006 }
                 or ( FieldByName('SITUACAOHOJE').AsString = 'MS' ) //PR-09/08/2007
         then begin
            if dblkpFormaMantidos.Text = 'Folha'
            then iFlgDescFolha  := 1
            else iFlgDescFolha  := 0;
            bGravaAlterador     := (dblkpALTMantidos.Text = 'Sim');
            iIdLoteInsere       := -1;
         end
         else if ( FieldByName('SITUACAOHOJE').AsString = 'AS' )
         then begin  // assistido
            iFlgDescFolha       := 1;
            bGravaAlterador     := (DbLkcIncluiAlterador.Text = 'Sim'); // False; // a Folha que grava { Augusto 21/09/2006 }
            iIdLoteInsere       := iIdLoteRetroativo;
         end
         else if FieldbyName('SITUACAOHOJE').AsString = 'FL'
         then begin // Pensionista
            iFlgDescFolha       := 1;
            bGravaAlterador     := False;// a Folha que grava
            iIdLoteInsere       := iIdLoteRetroativo;
         end
         else begin
            Result := 2;
            Exit;
         end;

         // Preencher a data em que o participante deveria ter pago, considerando
         // a situacao em que ele estava naquele mês
         if (Trim(dtDataDeveriaTerPago.Text) <> '') And (ChBxUtilizaCalendario.Checked = False) { Augusto 09/12/2005 }
         then sDataDeveriaTerPago := dtDataDeveriaTerPago.Text
         else begin
            if FieldByName('FLGINTERNO').AsString = 'AT'
            then begin
               sDataDeveriaTerPago := CriticaDataCobrancaSit( dtmAPrev.qry,
                                                              FieldByName('IDPESSJUR').AsString,
                                                              FieldByName('IDPLANOPREV').AsString,
                                                              'AT',
                                                              'N',
                                                              Copy(sAnoMesAtual,6,2),
                                                              Copy(sAnoMesAtual,1,4),
                                                              true); //P.RAMOS-07.04.2006-PEND.22044
            end
            else if FieldByName('FLGINTERNO').AsString = 'MA'
            then begin
               sDataDeveriaTerPago := CriticaDataCobrancaSit( dtmAPrev.qry,
                                                              FieldByName('IDPESSJUR').AsString,
                                                              FieldByName('IDPLANOPREV').AsString,
                                                              'MA',
                                                              'N',
                                                              Copy(sAnoMesAtual,6,2),
                                                              Copy(sAnoMesAtual,1,4),
                                                              true); //P.RAMOS-07.04.2006-PEND.22044
            end
            else begin
               sDataDeveriaTerPago := CriticaDataCobrancaSit( dtmAPrev.qry,
                                                              IntToStr(iIdFundacao),
                                                              FieldByName('IDPLANOPREV').AsString,
                                                              'MA',
                                                              'N',
                                                              Copy(sAnoMesAtual,6,2),
                                                              Copy(sAnoMesAtual,1,4),
                                                              true); //P.RAMOS-07.04.2006-PEND.22044
            end;
         end;

         // CAMILLE - 27.10.204 - INICIO
         sSalarioAntesReajuste :=  BuscaSalarioPESSOAINTEGRAL( dtmAPrev.qry,
                                                         FieldByName('IDPESSJUR').AsInteger,
                                                         FieldByName('IDPLANOPREV').AsInteger,
                                                         FieldByName('IDPESSOA').AsInteger,
                                                         FieldByName('SEQPROPOSTA').AsInteger,
                                                         FieldByName('FLGINTERNO').AsString,
                                                         sAnoMesAnterior( sAnoMesAtual ) { Augusto 14/06/2007 - Alterado para oesquisar no ano anterior  }
                                                         );

         // Busca o salario da pessoa no mês
         if StrToFloat(ClienteNumero(sSalarioIntegral)) <= 0
         then sSalarioIntegral := sSalarioAntesReajuste;

         // ********************************************************************
         // VERIFICAR SE A PESSOA ERA ATIVA OU MANTIDA. SE FOR, REAJUSTAR SALARIO
         // ********************************************************************
         if (FieldByName('FLGINTERNO').AsString = 'AT') or (FieldByName('FLGINTERNO').AsString = 'MA')
             or (FieldByName('FLGINTERNO').AsString = 'MP')    // Gleyber - 14/08/2006 - Pendência 22838
            or bBeneficioTemporario
         then begin
            // Gleyber - 23/08/2006 - Pendência 22838 - Início
            If Copy(sAnoMesAtual,6,2) = '13'
             Then sMes := '12'
             Else sMes := Copy(sAnoMesAtual,6,2);
            // Gleyber - 23/08/2006 - Pendência 22838 - Fim
            if not ReajustaSalPatro( qryAux,
                                     sAnoMesAtual,
                                     FieldByName('IDPESSJUR').AsString,
                                     FieldByName('IDPLANOPREV').AsString,
                                     FieldByName('IDPESSOA').AsString,
                                     //'01/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4),
                                     '01/'+sMes+'/'+Copy(sAnoMesAtual,1,4),  // Gleyber - 23/08/2006 - Pendência 22838
                                     FieldByName('DATAINICIO').AsString,
                                     sSalarioIntegral,
                                     sFlgSitPartNoMes,
                                     True,
                                     bReajustaSalarioNoInicio)  // Gleyber - 25/07/2006 - Pendência 22731
            then Exit;

            bReajustaSalarioNoInicio := False;

            if StrToFloat(ClienteNumero(sSalarioIntegral)) -
               StrToFloat(ClienteNumero(sSalarioAntesReajuste)) > 0.01
            then begin
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(' UPDATE HISTRUBSAL SET VLRANTRETROATIVO = VALORPROVENTO, '+
                              '                       VALORINTEGRAL    = '+OraNumero(sSalarioIntegral)+','+
                              '                       VALORPROVENTO    = '+OraNumero(sSalarioIntegral)+
                              ' WHERE  IDPESSOA       = '+FieldByName('IDPESSOA').AsString    +
                              ' AND    IDPESSJUR      = '+FieldByName('IDPESSJUR').AsString   +
                              ' AND    IDRUBRICA      = '+FieldByName('IDRUBRICA').AsString   +
                              ' AND    MES            >= '''+sAnoMesAtual +''''); { Augusto 12/07/2007 0 - Incluido o >= para atualizar todos os valores futuros com o novo salário }
               qryAux.ExecSQL;

               if qryAux.RowsAffected = 0
               then begin
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.Sql.Add(' INSERT INTO HISTRUBSAL                                                             '+
                                 '  (IDPESSOA,      IDPESSJUR,        IDPLANOPREV,       IDMOTIVO,    MES,            '+
                                 '   MESCOBRANCA,   REFERENCIA,       IDRUBRICA,         CODPROVDESC, VALORPROVENTO,  '+
                                 '   VALORINTEGRAL, FLGCOMPOESALPART, FLGCOMPOESALBENEF, FLGIRRF,     SEQRUBRICA,     '+
                                 '   FLGSRB,        IDMODULO )                                                        '+
                                 '   VALUES( '+ FieldByName('IDPESSOA').AsString                                   +','+
                                                FieldByName('IDPESSJUR').AsString                                  +','+
                                                FieldByName('IDPLANOPREV').AsString                                +','+
                                                qryMotivo.FieldByName('IDMOTIVO').AsString                         +','+
                                                ''''+sAnoMesAtual+''''                                             +','+
                                                ''''+edMesAcerto.Text+''''                                         +','+
                                                ''''+'***'+''''                                                    +','+
                                                FieldByName('IDRUBRICA').AsString                                  +','+
                                                ''''+FieldByName('CODPROVDESC').AsString+''''                      +','+
                                                OraNumero(sSalarioIntegral)                                        +','+
                                                OraNumero(sSalarioIntegral)                                        +','+
                                                '0, 0, 0, 1, 0, '+IntToStr(Sistema.IdModulo)                       +')');
                  qryAux.ExecSQL;
               end;

               qryAux.Close;
               qryAux.SQL.Clear;
               if ( FieldByName('SITUACAOHOJE').AsString = 'MA' ) or ( FieldByName('SITUACAOHOJE').AsString = 'MP' ) { Augusto 11/07/2006 }
                  or ( FieldByName('SITUACAOHOJE').AsString = 'MS' ) //PR-09/08/2007
               then qryAux.SQL.Add(' UPDATE PARTPREVPLAN SET SALMANTIDO = '+OraNumero(sSalarioIntegral)+
                                   ' WHERE  IDPESSJUR      = '+FieldByName('IDPESSJUR').AsString   +
                                   ' AND    IDPLANOPREV    = '+FieldByName('IDPLANOPREV').AsString +
                                   ' AND    IDPESSOA       = '+FieldByName('IDPESSOA').AsString    +
                                   ' AND    SEQPROPOSTA    = 1 ')
               // Gleyber - 12/07/2006 - Pendência 22837 - Início
               else if (FieldByName('FLGINTERNO').AsString = 'AS')
               Then qryAux.SQL.Add(' UPDATE PARTPREVPLAN SET SALAUXDOENCA = '+OraNumero(sSalarioIntegral)+
                                   ' WHERE  IDPESSJUR      = '+FieldByName('IDPESSJUR').AsString   +
                                   ' AND    IDPLANOPREV    = '+FieldByName('IDPLANOPREV').AsString +
                                   ' AND    IDPESSOA       = '+FieldByName('IDPESSOA').AsString    +
                                   ' AND    SEQPROPOSTA    = 1 ')
               // Gleyber - 12/07/2006 - Pendência 22837 - Fim
               else qryAux.SQL.Add(' UPDATE PARTPREVPLAN SET SALPARTICIPACAO = '+OraNumero(sSalarioIntegral)+
                                   ' WHERE  IDPESSJUR      = '+FieldByName('IDPESSJUR').AsString   +
                                   ' AND    IDPLANOPREV    = '+FieldByName('IDPLANOPREV').AsString +
                                   ' AND    IDPESSOA       = '+FieldByName('IDPESSOA').AsString    +
                                   ' AND    SEQPROPOSTA    = 1 ');
               qryAux.ExecSQL;

            end;
         end;

         while not Eof do
         begin
            // Gleyber - 14/08/2006 - Pendência 22838 - Início
            If FieldByName('CODPORTFORMA').AsInteger > 0
             Then iCodPortForma := FieldByName('CODPORTFORMA').AsInteger
             Else iCodPortForma := -1;
            // Gleyber - 14/08/2006 - Pendência 22838 - Fim


            // Calcular salario do mes
            sAnoMesDataInicio := Copy(FieldbyName('DATAINICIO').AsString,7,4)+'/'+Copy(FieldbyName('DATAINICIO').AsString,4,2);
            if Trim(FieldbyName('DATAFINAL').AsString) <> ''
            then sAnoMesDataFinal  := Copy(FieldbyName('DATAFINAL').AsString,7,4)+'/'+Copy(FieldbyName('DATAFINAL').AsString,4,2)
            else sAnoMesDataFinal  := '';

            if (StrToInt(Copy(FieldByName('DATAINICIO').AsString,1,2)) >= 29) and
               (StrToInt(Copy(sAnoMesAtual,6,2)) = 2)
            then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/'+ copy(sAnoMesAtual,1,4)
            else sDataRef := copy(FieldByName('DATAINICIO').AsString,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);

            // Se for 1o. ou ultimo pagamento e nao tiver regra de pro-rata,
            // Entao o salario no mes será prorateado
            // Senao o salario no mes será o salario integral
            if (sAnoMesAtual    = sAnoMesDataInicio) and
               (sAnoMesDataInicio   < sAnoMesDataFinal)  and
               (FieldbyName('IDREGRAPRIMPAGTO').AsString = '')
            then sSalarioNoMes := OraNumero(FloatToStr(ValorProRataPrimeiro(sSalarioIntegral,FieldByName('DATAINICIO').AsString)))
            else if (sAnoMesDataFinal <> '' )  and
                    (sAnoMesAtual     = sAnoMesDataFinal) and
                    (FieldbyName('IDREGRAULTPAGTO').AsString = '')
                 then sSalarioNoMes := OraNumero(FloatToStr(ValorProRataPrimeiro(sSalarioIntegral,FieldByName('DATAFINAL').AsString)))
                 else sSalarioNoMes := sSalarioIntegral;

            {--------------------------------------------------------------------------------}
            { Respeitar periodos de calculo e acerto 12/06/2007                              }
            If ((sAnoMesAtual >= sAnoMesInicioAcerto) and (sAnoMesAtual <= sAnoMesFimAcerto) ) Then
            Begin

            dValorAcerto := 0;
            // Calcular contribuicao do mes
            sSQLRegra := MontaSQLContribNOVA( FieldByName('IDPESSJUR').AsInteger,
                                              FieldByName('IDPLANOPREV').AsInteger,
                                              FieldByName('IDPESSOA').AsInteger,
                                              FieldByName('SEQPROPOSTA').AsInteger,
                                              FieldByName('IDCONTRIBUICAO').AsInteger,
                                              qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                              FieldByName('FLGINTERNO').AsString,
                                              sAnoMesAtual,
                                              sDataRef,
                                              '0',
                                              FieldByName('INSCRICAODATA').AsString,
                                              FieldByName('DATANASC').AsString,
                                              'I',
                                              'HSTCONTRIBPREV','VALORESPERADO',
                                              '0',
                                              sIdSitPartNoMes,
                                              FieldByName('DATAINICIO').AsString,
                                              FieldByName('DATAFINAL').AsString,
                                              6, { Origem revisão }
                                              iNumProcesso,
                                              edMesAcerto.Text,
                                              -1,
                                              False);
            sValorRegra    := RegraNumerica(FieldByName('IDREGRACALCULO').AsString, sSQLRegra, bErro, iIdCalculoGeral);
            sValorIntegral := sValorRegra;

            if (sAnoMesAtual    = sAnoMesDataInicio) and
               (FieldbyName('IDREGRAPRIMPAGTO').AsString <> '')
            then begin
               sSQLRegra := MontaSQLContribNOVA( FieldByName('IDPESSJUR').AsInteger,
                                                 FieldByName('IDPLANOPREV').AsInteger,
                                                 FieldByName('IDPESSOA').AsInteger,
                                                 FieldByName('SEQPROPOSTA').AsInteger,
                                                 FieldByName('IDCONTRIBUICAO').AsInteger,
                                                 qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                                 FieldByName('FLGINTERNO').AsString,
                                                 sAnoMesAtual,
                                                 sDataRef,
                                                 sValorRegra,
                                                 FieldByName('INSCRICAODATA').AsString,
                                                 FieldByName('DATANASC').AsString,
                                                 'P',
                                                 'HSTCONTRIBPREV','VALORESPERADO',
                                                 '0',
                                                 sIdSitPartNoMes,
                                                 FieldByName('DATAINICIO').AsString,
                                                 FieldByName('DATAFINAL').AsString,
                                                 6, { Origem revisão }
                                                 iNumProcesso,
                                                 edMesAcerto.Text,
                                                 -1,
                                                 False);
               sValorRegra    := RegraNumerica(FieldByName('IDREGRAPRIMPAGTO').AsString, sSQLRegra, bErro, iIdCalculoGeral);
            end;

            if (sAnoMesDataFinal <> '') and
               (sAnoMesAtual    = sAnoMesDataFinal) and
               (FieldbyName('IDREGRAULTPAGTO').AsString <> '')
            then begin
               sSQLRegra := MontaSQLContribNOVA( FieldByName('IDPESSJUR').AsInteger,
                                                 FieldByName('IDPLANOPREV').AsInteger,
                                                 FieldByName('IDPESSOA').AsInteger,
                                                 FieldByName('SEQPROPOSTA').AsInteger,
                                                 FieldByName('IDCONTRIBUICAO').AsInteger,
                                                 qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                                 FieldByName('FLGINTERNO').AsString,
                                                 sAnoMesAtual,
                                                 sDataRef,
                                                 sValorRegra,
                                                 FieldByName('INSCRICAODATA').AsString,
                                                 FieldByName('DATANASC').AsString,
                                                 'U',
                                                 'HSTCONTRIBPREV','VALORESPERADO',
                                                 '0',
                                                 sIdSitPartNoMes,
                                                 FieldByName('DATAINICIO').AsString,
                                                 FieldByName('DATAFINAL').AsString,
                                                 6, { Origem revisão }
                                                 iNumProcesso,
                                                 edMesAcerto.Text,
                                                 -1,
                                                 False);
               sValorRegra    := RegraNumerica(FieldByName('IDREGRAULTPAGTO').AsString, sSQLRegra, bErro, iIdCalculoGeral);
            end;

            // Verificar contribuicoes que a pessoa pagou
            with qry do
            begin
               Close;
               SQL.Clear;

               { Inicio Augusto 13/06/2007 - Tratamento de historicos financeiros do AdmPrev é; }
               { Apurador o valor efetivamente pago (no caso VALORRECEBIDO)                     }
               { Apurar diferença para o valor calculado no processo                            }
               { Excluir registros em aberto (no caso VALORRECEBIDO nulo ou zero) do historico  }
               { Incluir novo registro com os valores apurados no processo                      }
               SQL.Add(' SELECT   SUM( DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VALORRECEBIDO) ) AS VALORCOBRADO   '+
                       ' FROM   HSTCONTRIBPREV HST '+
                       ' WHERE  HST.MESREFERENCIA  = '''+sAnoMesAtual+''''+
                       ' AND    HST.IDPESSOA       = '+IntToStr(piIdPessoa)+
                       ' AND    HST.IDCONTRIBUICAO = '+qryContribNoMes.FieldByName('IDCONTRIBUICAO').AsString
                       );
               Open;
            end;

            if (qry.IsEmpty) or (qry.FieldByName('VALORCOBRADO').AsString = '') or (qry.FieldByName('VALORCOBRADO').AsFloat <= 0)
            then begin // calcular contribuicao
               // Verificar se pessoa está falecida
               if FieldByName('FLGINTERNO').AsString = 'FL'
               then begin
                  // Chamar rotina de rateio por beneficiarios
                  if not ProcessaRateioPorBeneficiario( FieldByName('IDPESSJUR').AsInteger,
                                                        FieldByName('IDPLANOPREV').AsInteger,
                                                        FieldByName('IDPESSOA').AsInteger,
                                                        FieldByName('SEQPROPOSTA').AsInteger,
                                                        qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                                        iIdLoteRetroativo,
                                                        FieldByName('IDCONTRIBUICAO').AsInteger,
                                                        'C',
                                                        'A',
                                                        edMesAcerto.Text,
                                                        sAnoMesAtual,
                                                        dtDataAcerto.Text,
                                                        StrToFloat(ClienteNumero(sValorRegra)),
                                                        True )
                  then Exit;
                  if not chkGravaDemons.Checked
                  then mmResult.Lines.Add('             '+PreparaStr(sAnoMesAtual,7)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioAntesReajuste))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioIntegral))),10)+' '+PreparaStr(FieldByName('NOMERESUM').AsString,12)+' '+PreparaStr(FormatFloat('#0.00',qry.FieldByName('VALORCOBRADO').AsFloat),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))-qry.FieldByName('VALORCOBRADO').AsFloat),10) );
                  GravaLinhaTXT('             '+PreparaStr(sAnoMesAtual,7)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioAntesReajuste))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioIntegral))),10)+' '+PreparaStr(FieldByName('NOMERESUM').AsString,12)+' '+PreparaStr(FormatFloat('#0.00',qry.FieldByName('VALORCOBRADO').AsFloat),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))-qry.FieldByName('VALORCOBRADO').AsFloat),10) );
               end
               else begin
                  if qry.FieldByName('VALORCOBRADO').AsFloat > 0
                  then begin
                     if qry.FieldByName('VALORCOBRADO').AsFloat > StrToFloat(ClienteNumero(sValorRegra))
                     then begin
                        dDiferenca    := qry.FieldByName('VALORCOBRADO').AsFloat - StrToFloat(ClienteNumero(sValorRegra));
                        iFlgDevolucao := 1;
                     end
                     else begin
                        dDiferenca    := StrToFloat(ClienteNumero(sValorRegra)) - qry.FieldByName('VALORCOBRADO').AsFloat;
                        iFlgDevolucao := 0;
                     end;
                  end
                  else begin
                     dDiferenca    := StrToFloat(ClienteNumero(sValorRegra));
                     iFlgDevolucao := 0;
                  end;

                  { Inicio Augusto 01/11/2006 - Verificar antes de excluir }
                  sSQL := 'SELECT 1 FROM  HSTCONTRIBPREV '+
                          ' WHERE  IDPESSJUR    = '+ FieldByName('IDPESSJUR').AsString+
                          ' AND    IDPLANOPREV  = '+ FieldByName('IDPLANOPREV').AsString+
                          ' AND    IDPESSOA     = '+ FieldByName('IDPESSOA').AsString+
                          ' AND    SEQPROPOSTA  = '+ FieldByName('SEQPROPOSTA').AsString+
                          ' AND    IDMOTIVO     <> '+qryMotivo.FieldByName('IDMOTIVO').AsString+
                          ' AND    MESREFERENCIA  = '''+sAnoMesAtual+''''+
                          ' AND    MESCOBRANCA    = '''+edMesAcerto.Text+''''+
                          ' AND    IDCONTRIBUICAO = '+FieldByName('IDCONTRIBUICAO').AsString+' '+
                          ' AND    NVL(VALORRECEBIDO,0) = 0';

                  If FazQuery ( QryAux, sSQL ) Then Begin

                      If ( bExcluiPrevia = True ) Then
                      Begin

                        sSQL := 'DELETE PREVIA '+
                                'WHERE IDPESSJUR     = '+ FieldByName('IDPESSJUR').AsString    +'  '+
                                ' AND  IDPLANOPREV  = '+ FieldByName('IDPLANOPREV').AsString  +
                                ' AND  IDTITULAR    = '+ FieldByName('IDPESSOA').AsString     +
                                ' AND  IDPESSOA     = '+ FieldByName('IDPESSOA').AsString     +
                                ' AND  SEQPROPOSTA  = '+ FieldByName('SEQPROPOSTA').AsString  +
                                ' AND  MESCOBRANCA  = '''+edMesAcerto.Text+'''';

                        ExecutarQuery(QryAux,sSQL);

                        bExcluiPrevia := False;

                      End;

                    sSQL := ' DELETE HSTCONTRIBPREV '+
                            ' WHERE  IDPESSJUR    = '+FieldByName('IDPESSJUR').AsString+
                            ' AND    IDPLANOPREV  = '+FieldByName('IDPLANOPREV').AsString+
                            ' AND    IDPESSOA     = '+FieldByName('IDPESSOA').AsString+
                            ' AND    SEQPROPOSTA  = '+FieldByName('SEQPROPOSTA').AsString+
                            ' AND    IDMOTIVO     <> '+qryMotivo.FieldByName('IDMOTIVO').AsString+
                            ' AND    MESREFERENCIA  = '''+sAnoMesAtual+''''+
                            ' AND    MESCOBRANCA    = '''+edMesAcerto.Text+''''+
                            ' AND    IDCONTRIBUICAO = '+FieldByName('IDCONTRIBUICAO').AsString+' '+
                            ' AND    NVL(VALORRECEBIDO,0) = 0';

                    ExecutarQuery(QryAux,sSQL);

                  End;
                  { Fim Augusto 01/11/2006                                 }

                  iNumRecebimento := InsereHstContribPREV( dtmAPrev.qry,
                                                  FieldByName('IDPESSOA').AsInteger,
                                                  FieldByName('SEQPROPOSTA').AsInteger,

                                                  FieldByName('IDPESSJUR').AsInteger,     { Augusto 31/10/2006 era IDPESSJURHOJE }
                                                  FieldByName('IDPLANOPREV').AsInteger,   { Augusto 31/10/2006 era IDPLANOPREVHOJE }

                                                  FieldByName('IDCONTRIBUICAO').AsInteger,
                                                  qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                                  sAnoMesAtual,
                                                  edMesAcerto.Text,
                                                  iCodPortForma, // Gleyber - 14/08/2006 - Pendência 22838
                                                  //dtDataDeveriaTerPago.Text,  // Gleyber - 13/06/2005 - Pendência 18852
                                                  sDataDeveriaTerPago, // Augusto 09/12/2005 sDataPrevisaoReceb,           // Gleyber - 13/06/2005 - Pendência 18852
                                                  '',
                                                  dDiferenca,
                                                  dDiferenca,
                                                  0,
                                                  FieldByName('IDREGRACALCULO').AsInteger,
                                                  iFlgDescFolha,
                                                  FieldByName('VALORBASE1').AsFloat,
                                                  FieldByName('VALORBASE2').AsFloat,
                                                  FieldByName('VALORBASE3').AsFloat,
                                                  FieldByName('DATAINICIO').AsString,
                                                  FieldByName('DATAFINAL').AsString,
                                                  FieldByName('FLGINTERNOATUAL').AsString,
                                                  0,
                                                  0,
                                                  iIdLoteInsere,
                                                  'F',
                                                  iFlgDevolucao,
                                                  0,
                                                  0,
                                                  1);

                  if iNumRecebimento < 0 then Exit;

                  if sAnoMesAtual > FieldByName('ULTMESPREPARO').AsString
                  then begin
                     dtmAPrev.qry.Close;
                     dtmAPrev.qry.SQL.Clear;
                     dtmAPrev.qry.SQL.Add(' UPDATE CONTRIBPREVPARTP SET ULTMESPREPARO = '''+sAnoMesAtual       +''''+
                                          ' WHERE  IDPESSJUR      = '+FieldByName('IDPESSJUR').AsString    + { Augusto 31/10/2006 era IDPESSJURHOJE }
                                          ' AND    IDPLANOPREV    = '+FieldByName('IDPLANOPREV').AsString  + { Augusto 31/10/2006 era IDPLANOPREVHOJE }
                                          ' AND    IDPESSOA       = '+FieldByName('IDPESSOA').AsString         +
                                          ' AND    IDCONTRIBUICAO = '+FieldByName('IDCONTRIBUICAO').AsString   );
                     try
                        dtmAPrev.qry.ExecSQl;
                     except
                        bErro    := True;
                        Exit;
                     end;
                  end;

                  dValorAcerto    := dDiferenca;
                  dTotalAlterador := 0;

                  if bGravaAlterador
                  then begin
                     if not GravaAlterador('A',
                                           sAnoMesAtual,
                                           edMesAcerto.Text,
                                           '1',
                                           iNumRecebimento,
                                           qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                           FieldByName('IDPLANOPREV').AsInteger, { Augusto 31/10/2006 era IDPLANOPREVHOJE }
                                           FieldByName('IDCONTRIBUICAO').AsInteger,
                                           FieldByName('IDPESSJUR').AsInteger,   { Augusto 31/10/2006 era IDPESSJUROJE }
                                           FieldByName('DATAINICIO').AsString,
                                           sDataDeveriaTerPago,
                                           dtDataAcerto.Text,
                                           FloatToStr(dDiferenca),
                                           sMsgErro,
                                           0,
                                           6,
                                           iCodAlterador )
                     then begin
                        bErro    := True;
                        Exit;
                     end;
                     dTotalAlterador := StrToFloat(ClienteNumero(sMsgErro));
                     dValorAcerto    := dValorAcerto + dTotalAlterador;
                  end; // if bGravaAlterador

                  if not chkGravaDemons.Checked
                  then mmResult.Lines.Add('             '+PreparaStr(sAnoMesAtual,7)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioAntesReajuste))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioIntegral))),10)+' '+PreparaStr(FieldByName('NOMERESUM').AsString,12)+' '+PreparaStr(FormatFloat('#0.00',qry.FieldByName('VALORCOBRADO').AsFloat),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))),10)+' '+PreparaStr(FormatFloat('#0.00',dDiferenca),10)+' '+PreparaStr(FormatFloat('#0.00',dTotalAlterador),10)+' '+PreparaStr(FormatFloat('#0.00',dValorAcerto),10) );
                  GravaLinhaTXT('             '+PreparaStr(sAnoMesAtual,7)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioAntesReajuste))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioIntegral))),10)+' '+PreparaStr(FieldByName('NOMERESUM').AsString,12)+' '+PreparaStr(FormatFloat('#0.00',qry.FieldByName('VALORCOBRADO').AsFloat),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))),10)+' '+PreparaStr(FormatFloat('#0.00',dDiferenca),10)+' '+PreparaStr(FormatFloat('#0.00',dTotalAlterador),10)+' '+PreparaStr(FormatFloat('#0.00',dValorAcerto),10) );


               end;
            end
            else begin
               dDiferenca      := StrToFloat(FormatFloat('#0.00',Abs(StrToFloat(ClienteNumero(sValorRegra))) - Abs(qry.FieldByName('VALORCOBRADO').AsFloat)));
               dValorAcerto    := dDiferenca;
               dTotalAlterador := 0;

               // CAMILLE - 15.04.2004 - Acrescentei o abs
               if Abs(dDiferenca) < 0.01
               then begin
                  if not chkGravaDemons.Checked
                  then mmResult.Lines.Add('             '+PreparaStr(sAnoMesAtual,7)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioAntesReajuste))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioIntegral))),10)+' '+PreparaStr(FieldByName('NOMERESUM').AsString,12)+' '+PreparaStr(FormatFloat('#0.00',qry.FieldByName('VALORCOBRADO').AsFloat),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))),10)+' '+PreparaStr(FormatFloat('#0.00',dDiferenca),10)+' '+PreparaStr(FormatFloat('#0.00',dTotalAlterador),10)+' '+PreparaStr(FormatFloat('#0.00',dValorAcerto),10) );
                  GravaLinhaTXT('             '+PreparaStr(sAnoMesAtual,7)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioAntesReajuste))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioIntegral))),10)+' '+PreparaStr(FieldByName('NOMERESUM').AsString,12)+' '+PreparaStr(FormatFloat('#0.00',qry.FieldByName('VALORCOBRADO').AsFloat),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))),10)+' '+PreparaStr(FormatFloat('#0.00',dDiferenca),10)+' '+PreparaStr(FormatFloat('#0.00',dTotalAlterador),10)+' '+PreparaStr(FormatFloat('#0.00',dValorAcerto),10) );
                  Next;
                  continue;
               end;

               if StrToFloat(ClienteNumero(sValorRegra)) > qry.FieldByName('VALORCOBRADO').AsFloat
               then begin // Cobrar diferenca
                  // Verificar se pessoa está falecida
                  if FieldByName('FLGINTERNO').AsString = 'FL'
                  then begin
                     // Chamar rotina de rateio por beneficiarios
                     if not ProcessaRateioPorBeneficiario( FieldByName('IDPESSJUR').AsInteger,
                                                           FieldByName('IDPLANOPREV').AsInteger,
                                                           FieldByName('IDPESSOA').AsInteger,
                                                           FieldByName('SEQPROPOSTA').AsInteger,
                                                           qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                                           iIdLoteRetroativo,
                                                           FieldByName('IDCONTRIBUICAO').AsInteger,
                                                           'C',
                                                           'A',
                                                           edMesAcerto.Text,
                                                           sAnoMesAtual,
                                                           dtDataAcerto.Text,
                                                           dDiferenca,
                                                           True )
                     then Exit;
                  if not chkGravaDemons.Checked
                  then mmResult.Lines.Add('             '+PreparaStr(sAnoMesAtual,7)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioAntesReajuste))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioIntegral))),10)+' '+PreparaStr(FieldByName('NOMERESUM').AsString,12)+' '+PreparaStr(FormatFloat('#0.00',qry.FieldByName('VALORCOBRADO').AsFloat),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))),10)+' '+PreparaStr(FormatFloat('#0.00',dDiferenca),10)+' '+PreparaStr(FormatFloat('#0.00',dTotalAlterador),10)+' '+PreparaStr(FormatFloat('#0.00',dValorAcerto),10) );
                  GravaLinhaTXT('             '+PreparaStr(sAnoMesAtual,7)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioAntesReajuste))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioIntegral))),10)+' '+PreparaStr(FieldByName('NOMERESUM').AsString,12)+' '+PreparaStr(FormatFloat('#0.00',qry.FieldByName('VALORCOBRADO').AsFloat),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))),10)+' '+PreparaStr(FormatFloat('#0.00',dDiferenca),10)+' '+PreparaStr(FormatFloat('#0.00',dTotalAlterador),10)+' '+PreparaStr(FormatFloat('#0.00',dValorAcerto),10) );
                  end
                  else begin

                     iNumRecebimento := InsereHstContribPREV( dtmAPrev.qry,
                                                      FieldByName('IDPESSOA').AsInteger,
                                                      FieldByName('SEQPROPOSTA').AsInteger,
                                                      FieldByName('IDPESSJUR').AsInteger,   { Augusto 31/10/2006 era IDPESSJURHOJE }
                                                      FieldByName('IDPLANOPREV').AsInteger, { Augusto 31/10/2006 era IDPLANOPREVHOJE }
                                                      FieldByName('IDCONTRIBUICAO').AsInteger,
                                                      qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                                      sAnoMesAtual,
                                                      edMesAcerto.Text,
                                                      iCodPortForma, // Gleyber - 14/08/2006 - Pendência 22838
                                                      //dtDataDeveriaTerPago.Text,  // Gleyber - 13/06/2005 - Pendência 18852
                                                      sDataDeveriaTerPago, // Augusto 09/12/2005 sDataPrevisaoReceb,           // Gleyber - 13/06/2005 - Pendência 18852
                                                      '',
                                                      dDiferenca,
                                                      dDiferenca,
                                                      0,
                                                      FieldByName('IDREGRACALCULO').AsInteger,
                                                      iFlgDescFolha,
                                                      FieldByName('VALORBASE1').AsFloat,
                                                      FieldByName('VALORBASE2').AsFloat,
                                                      FieldByName('VALORBASE3').AsFloat,
                                                      FieldByName('DATAINICIO').AsString,
                                                      FieldByName('DATAFINAL').AsString,
                                                      FieldByName('FLGINTERNOATUAL').AsString, { Augusto 06/05/2005 era FLGINTERNO }
                                                      0,
                                                      0,
                                                      iIdLoteInsere,
                                                      'F',
                                                      0,
                                                      0,
                                                      0,
                                                      1);
                     if iNumRecebimento <= 0 then Exit;

                     // CAMILLE - 05.11.2004
                     if sAnoMesAtual > FieldByName('ULTMESPREPARO').AsString
                     then begin
                        dtmAPrev.qry.Close;
                        dtmAPrev.qry.SQL.Clear;
                        dtmAPrev.qry.SQL.Add(' UPDATE CONTRIBPREVPARTP SET ULTMESPREPARO = '''+sAnoMesAtual       +''''+
                                             ' WHERE  IDPESSJUR      = '+FieldByName('IDPESSJUR').AsString    + { Augusto 31/10/2006 era IDPESSJURHOJE }
                                             ' AND    IDPLANOPREV    = '+FieldByName('IDPLANOPREV').AsString  + { Augusto 31/10/2006 era IDPLANOPREVHOJE }
                                             ' AND    IDPESSOA       = '+FieldByName('IDPESSOA').AsString         +
                                             ' AND    IDCONTRIBUICAO = '+FieldByName('IDCONTRIBUICAO').AsString   );
                        try
                           dtmAPrev.qry.ExecSQl;
                        except
                           bErro    := True;
                           Exit;
                        end;
                     end;


                     if bGravaAlterador
                     then begin
                        if not GravaAlterador('A',
                                              sAnoMesAtual,
                                              edMesAcerto.Text,
                                              '1',
                                              iNumRecebimento,
                                              qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                              FieldByName('IDPLANOPREV').AsInteger,     { Augusto 31/10/2006 era IDPLANOPREVHOJE }
                                              FieldByName('IDCONTRIBUICAO').AsInteger,
                                              FieldByName('IDPESSJURHOJE').AsInteger,   { Augusto 31/10/2006 era IDPESSJURHOJE }
                                              FieldByName('DATAINICIO').AsString,
                                              sDataDeveriaTerPago,
                                              dtDataAcerto.Text,
                                              FloatToStr(dDiferenca),
                                              sMsgErro,0,
                                              6, { Augusto 21/01/2005 - piOrigem estava 10 mudou para 6 }
                                              iCodAlterador )
                        then begin
                           bErro    := True;
                           Exit;
                        end;
                        dTotalAlterador := StrToFloat(ClienteNumero(sMsgErro));
                        dValorAcerto    := dValorAcerto + dTotalAlterador;
                     end; // if bGravaAlterador

                     if not chkGravaDemons.Checked
                     then mmResult.Lines.Add('             '+PreparaStr(sAnoMesAtual,7)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioAntesReajuste))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioIntegral))),10)+' '+PreparaStr(FieldByName('NOMERESUM').AsString,12)+' '+PreparaStr(FormatFloat('#0.00',qry.FieldByName('VALORCOBRADO').AsFloat),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))),10)+' '+PreparaStr(FormatFloat('#0.00',dDiferenca),10)+' '+PreparaStr(FormatFloat('#0.00',dTotalAlterador),10)+' '+PreparaStr(FormatFloat('#0.00',dValorAcerto),10) );
                     GravaLinhaTXT('             '+PreparaStr(sAnoMesAtual,7)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioAntesReajuste))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioIntegral))),10)+' '+PreparaStr(FieldByName('NOMERESUM').AsString,12)+' '+PreparaStr(FormatFloat('#0.00',qry.FieldByName('VALORCOBRADO').AsFloat),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))),10)+' '+PreparaStr(FormatFloat('#0.00',dDiferenca),10)+' '+PreparaStr(FormatFloat('#0.00',dTotalAlterador),10)+' '+PreparaStr(FormatFloat('#0.00',dValorAcerto),10) );

                  end;
               end
               else begin // Devolver diferenca
                  // Verificar se pessoa está falecida
                  if FieldByName('FLGINTERNO').AsString = 'FL'
                  then begin
                     // Chamar rotina de rateio por beneficiarios
                     if not ProcessaRateioPorBeneficiario( FieldByName('IDPESSJUR').AsInteger,
                                                           FieldByName('IDPLANOPREV').AsInteger,
                                                           FieldByName('IDPESSOA').AsInteger,
                                                           FieldByName('SEQPROPOSTA').AsInteger,
                                                           qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                                           iIdLoteRetroativo,
                                                           FieldByName('IDCONTRIBUICAO').AsInteger,
                                                           'C',
                                                           'D',
                                                           edMesAcerto.Text,
                                                           sAnoMesAtual,
                                                           dtDataAcerto.Text,
                                                           dDiferenca, True )
                     then Exit;
                  end
                  else begin

                     iNumRecebimento := InsereHstContribPREV( dtmAPrev.qry,
                                                      FieldByName('IDPESSOA').AsInteger,
                                                      FieldByName('SEQPROPOSTA').AsInteger,
                                                      FieldByName('IDPESSJUR').AsInteger,   { Augusto 31/10/2006 era IDPESSJURHOJE }
                                                      FieldByName('IDPLANOPREV').AsInteger, { Augusto 31/10/2006 era IDPLANOPREVHOJE }
                                                      FieldByName('IDCONTRIBUICAO').AsInteger,
                                                      qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                                      sAnoMesAtual,
                                                      edMesAcerto.Text,
                                                      iCodPortForma, // Gleyber - 14/08/2006 - Pendência 22838
                                                      //dtDataDeveriaTerPago.Text,  // Gleyber - 13/06/2005 - Pendência 18852
                                                      sDataDeveriaTerPago, // Augusto 09/12/2005 sDataPrevisaoReceb,           // Gleyber - 13/06/2005 - Pendência 18852
                                                      '',
                                                      Abs(dDiferenca),
                                                      Abs(dDiferenca),
                                                      0,
                                                      FieldByName('IDREGRACALCULO').AsInteger,
                                                      iFlgDescFolha,
                                                      FieldByName('VALORBASE1').AsFloat,
                                                      FieldByName('VALORBASE2').AsFloat,
                                                      FieldByName('VALORBASE3').AsFloat,
                                                      FieldByName('DATAINICIO').AsString,
                                                      FieldByName('DATAFINAL').AsString,
                                                      FieldByName('FLGINTERNO').AsString,
                                                      0,
                                                      0,
                                                      iIdLoteInsere,
                                                      'F',
                                                      0,
                                                      1,
                                                      0,
                                                      1);
                     if iNumRecebimento <= 0 then Exit;

                     // CAMILLE - 05.11.2004
                     if sAnoMesAtual > FieldByName('ULTMESPREPARO').AsString
                     then begin
                        dtmAPrev.qry.Close;
                        dtmAPrev.qry.SQL.Clear;
                        dtmAPrev.qry.SQL.Add(' UPDATE CONTRIBPREVPARTP SET ULTMESPREPARO = '''+sAnoMesAtual       +''''+
                                             ' WHERE  IDPESSJUR      = '+FieldByName('IDPESSJUR').AsString    + { Augusto 31/10/2006 era IDPESSJURHOJE }
                                             ' AND    IDPLANOPREV    = '+FieldByName('IDPLANOPREV').AsString  + { Augusto 31/10/2006 era IDPLANOPREVHOJE }
                                             ' AND    IDPESSOA       = '+FieldByName('IDPESSOA').AsString         +
                                             ' AND    IDCONTRIBUICAO = '+FieldByName('IDCONTRIBUICAO').AsString   );
                        try
                           dtmAPrev.qry.ExecSQl;
                        except
                           bErro    := True;
                           Exit;
                        end;
                     end;

                     if bGravaAlterador
                     then begin
                        if not GravaAlterador('D',
                                              sAnoMesAtual,
                                              edMesAcerto.Text,
                                              '1',
                                              iNumRecebimento,
                                              qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                              FieldByName('IDPLANOPREV').AsInteger, { Augusto 31/10/2006 era IDPLANOPREVHOJE }
                                              FieldByName('IDCONTRIBUICAO').AsInteger,
                                              FieldByName('IDPESSJUR').AsInteger,   { Augusto 31/10/2006 era IDPESSJURHOJE }
                                              FieldByName('DATAINICIO').AsString,
                                              sDataDeveriaTerPago,
                                              dtDataAcerto.Text,
                                              FloatToStr(dDiferenca),
                                              sMsgErro,0,
                                              6, { Augusto 21/01/2005 - piOrigem estava 10 mudou para 6 }
                                              iCodAlterador )
                        then begin
                           bErro    := True;
                           Exit;
                        end;
                     end; // if bGravaAlterador
                     dTotalAlterador := StrToFloat(ClienteNumero(sMsgErro));
                     dValorAcerto    := dValorAcerto + dTotalAlterador;

                     if not chkGravaDemons.Checked
                     then mmResult.Lines.Add('             '+PreparaStr(sAnoMesAtual,7)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioAntesReajuste))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioIntegral))),10)+' '+PreparaStr(FieldByName('NOMERESUM').AsString,12)+' '+PreparaStr(FormatFloat('#0.00',qry.FieldByName('VALORCOBRADO').AsFloat),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))),10)+' '+PreparaStr(FormatFloat('#0.00',dDiferenca),10)+' '+PreparaStr(FormatFloat('#0.00',dTotalAlterador),10)+' '+PreparaStr(FormatFloat('#0.00',dValorAcerto),10) );
                     GravaLinhaTXT('             '+PreparaStr(sAnoMesAtual,7)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioAntesReajuste))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioIntegral))),10)+' '+PreparaStr(FieldByName('NOMERESUM').AsString,12)+' '+PreparaStr(FormatFloat('#0.00',qry.FieldByName('VALORCOBRADO').AsFloat),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))),10)+' '+PreparaStr(FormatFloat('#0.00',dDiferenca),10)+' '+PreparaStr(FormatFloat('#0.00',dTotalAlterador),10)+' '+PreparaStr(FormatFloat('#0.00',dValorAcerto),10) );

                  end;
               end
            end;


            { Inicio Augusto 04/07/2006 - Totalizar diferença }
            dTotalDiferenca := ( dTotalDiferenca + dDiferenca );
            dTotalAcerto    := ( dTotalAcerto    + dValorAcerto );
            { Fim Augusto 04/07/2006                          }

            End; { If ((sAnoMesAtual >= sAnoMesInicioAcerto) and (sAnoMesAtual <= sAnoMesFimAcerto) ) }
            {--------------------------------------------------------------------------------}

            Next;

         end; // contribuicoes no mes

         { Inicio Augusto 04/07/2006 - Totalizar diferença }
         If ( Not chkGravaDemons.Checked )
         Then mmResult.Lines.Add('             ----------------------------------------------------------------------------------------------');
         If CkbxGravaDemo.Checked
         Then GravaLinhaTXT('             ----------------------------------------------------------------------------------------------');
         { Fim Augusto 04/07/2006                          }

         Next;

      end; // mes

      sAnoMesAtual  := ProximoAnoMes13(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4))); // Gleyber - 23/08/2006 - Pendência 22838

      if (sSituacaoHoje = 'AT') or
         (sSituacaoHoje = 'MA') or
         (sSituacaoHoje = 'MP') or //PR-09/08/2007
         (sSituacaoHoje = 'MS') or //PR-09/08/2007
         (sSituacaoHoje = 'AS')
      then Result        := 0
      else Result        := 2;

   End;
   { Inicio Augusto 04/07/2006 - Totalizar diferença }
   If ( Not chkGravaDemons.Checked )
   Then mmResult.Lines.Add(PreparaStr( ' ', 78 ) + 'TOTAL DOS ACERTOS =>  ' + PreparaStr( FormatFloat( '#0.00',dTotalAcerto), 10 ) );
   //If CkbxGravaDemo.Checked
   //Then GravaLinhaTXT('             '+PreparaStr(sAnoMesAtual,7)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioAntesReajuste))),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalarioIntegral))),10)+' '+PreparaStr(FieldByName('NOMERESUM').AsString,12)+' '+PreparaStr(FormatFloat('#0.00',qry.FieldByName('VALORCOBRADO').AsFloat),10)+' '+PreparaStr(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorRegra))),10)+' '+PreparaStr(FormatFloat('#0.00',dDiferenca),10));
   { Fim Augusto 04/07/2006                          }



end;

// 1. Para os meses posteriores a morte, pedir todos os beneficios de volta
//    (inclusive 13o.)
// 2. Para o mes da morte fazer :
//    2.1. pedir de volta os dias apos a morte (de um dia depois em diante)
//    2.2. pagar abono proporicional, do inicio do beneficio ate a data da morte
function TfrmRetroativoPREV.ProcessaRateioPorBeneficiario( piIdPessJur        : longint;
                                                           piIdPlanoPrev      : longint;
                                                           piIdTitular        : longint;
                                                           piSeqProposta      : longint;
                                                           piIdMotivo         : longint;
                                                           piIdLote           : longint;
                                                           piIdItem           : longint; //idbeneficio ou idcontribuicao
                                                           pcTipoItem         : char;    // C = Contribuicao, B = Beneficio
                                                           pcAtrasoDevol      : char;    // A = Atraso,       D = Devolucao
                                                           psAnoMesCobranca   : string;
                                                           psAnoMesReferencia : string;
                                                           psDataCobranca     : string;
                                                           pdValorARatear     : double;
                                                           pbInsereAcertoTit  : boolean
                                                                                          ) : boolean;
var dValorRateado,
    dValorRateadoOrig,
    dValorAcertado       : double;
    sCodProvDesc,
    sIdRubrica,
    sFlgDesconto,
    sFlgAtrasoDevol      : string;
    cRecPag              : char;

    sTipCodigo,
    sCodTipRecDes,
    sRecPag,
    sCodTipDoc,
    sCodPortForma,
    sCodCentroRespon,
    sCodSubConta,
    sCodCentroCustoD,
    sIdEmpresa,
    sCodCentroCustoC,
    sPlaContaD,
    sPlano,
    sPlaContaC,
    sUnidNegoc,
    sIdEmpresaProp,
    sSelectCaso       : string;
    bFazAcerto,
    bTemOutroRecebedor ,
    bFaltaPercentual   : boolean;
    iIdRecebedor       : longint;
    iFlgDevolucao      : integer;

    sPlaContaDProvis,    // Gleyber - 11/01/2006 - Pendência 19538
    sPlaContaCProvis,    // Gleyber - 11/01/2006 - Pendência 19538
    sMsgErro : String; //leocm - 28042005
begin
   Result     := False;
   bFazAcerto := True;

   // *******************************************************************************************
   // Abrir query com todos os beneficiários que estão recebendo benefício agora
   // *******************************************************************************************
   with dtmAPrev.qryBenef do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DISTINCT '+
              ' NVL(BTIT.IDRESPONSAVEL,BTIT.IDPESSOA) IDRESPONSAVEL , BTIT.IDPESSOA, '+
              ' NVL(BTIT.PERCENTUAL,0) PERCENTUAL  '+
              ' FROM   BENEFBFCIARIO BF, BFCIARIOTITPLAN BTIT, BENEFPLANPREV BP, BENEFICIO B, TPPAGTOBENEFICIO TP '+
              ' WHERE  BF.IDTITULAR        = '+IntToStr(piIdTitular)+
              ' AND    BF.IDPESSOA         <> BF.IDTITULAR                        '+
              ' AND    BF.IDSITBENEFICIO   IN (1,2)                               '+
              ' AND    BP.IDPLANOPREV      = BF.IDPLANOPREV                       '+
              ' AND    BP.IDBENEFICIO      = BF.IDBENEFICIO                       '+
              ' AND    BP.FLGACEITAACERTO  = 1                                    '+
              ' AND    BTIT.IDPESSJUR      = BF.IDPESSJUR                         '+
              ' AND    BTIT.IDPLANOPREV    = BF.IDPLANOPREV                       '+
              ' AND    BTIT.IDTITULAR      = BF.IDTITULAR                         '+
              ' AND    BTIT.IDPESSOA       = BF.IDPESSOA                          '+
              ' AND    BTIT.SEQPROPOSTA    = BF.SEQPROPOSTA                       '+
              ' AND    BTIT.IDBENEFICIO    = BF.IDBENEFICIO                       '+
              ' AND    B.IDBENEFICIO       = BF.IDBENEFICIO                       '+
              ' AND    B.IDTPPAGTOBENEFIC  = TP.IDTPPAGTOBENEFIC ');
      Open;
   end;

   dtmAPrev.qryBenef.First;
   bTemOutroRecebedor := False;
   bFaltaPercentual   := False;
   while not dtmAPrev.qryBenef.Eof do
   begin

      //leocm -04102002
      //testo se o recebedor é o próprio beneficiário
      //caso haja algum recebdor diferente do próprio, NÃO usar percentual e ratear pelos recebedores
      //caso todos os recebedores sejam os próprios e todos os percentuais estejam preenchidos, usar percentual
      //caso todos os recebedores seja or próprios, retear pelos beneficiários
      if dtmAPrev.qryBenef.FieldByName('IDRESPONSAVEL').AsString <>
         dtmAPrev.qryBenef.FieldByName('IDPESSOA').AsString
      then begin
         bTemOutroRecebedor := true;
      end;

      if dtmAPrev.qryBenef.FieldByName('PERCENTUAL').AsFloat <= 0
      then begin
         bFaltaPercentual := True;
      end;
      dtmAPrev.qryBenef.Next;
   end;

   //leocm - 04102002 - inicio
   //agora que eu sei o critério de rateio, eu monto a qryBenef

   sSelectCaso := '';

   // divide pelo número de recebedores
   if  bTemOutroRecebedor
   then begin
      sSelectCaso := ' DECODE(BTIT.IDRESPONSAVEL,NULL,BTIT.IDPESSOA,BTIT.IDRESPONSAVEL) IDPESSOA, '+
                     ' 0 PERCENTUAL ';
   end
   //dividir pelos beneficiários
   else if (not bTemOutroRecebedor) and (bFaltaPercentual) then
   begin
      sSelectCaso := ' BTIT.IDPESSOA,  0 PERCENTUAL ';
   end
   //dividir pelos beneficiários usando o percentual
   else if (not bTemOutroRecebedor) and (not  bFaltaPercentual) then
   begin
      sSelectCaso := ' BTIT.IDPESSOA,  NVL(BTIT.PERCENTUAL,0) PERCENTUAL ';
   end;

   with dtmAPrev.qryBenef do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DISTINCT '+ sSelectCaso +
              ' FROM   BENEFBFCIARIO BF, BFCIARIOTITPLAN BTIT, BENEFPLANPREV BP, BENEFICIO B, TPPAGTOBENEFICIO TP '+
              ' WHERE  BF.IDTITULAR        = '+IntToStr(piIdTitular)+
              ' AND    BF.IDPESSOA         <> BF.IDTITULAR                        '+
              ' AND    BF.IDSITBENEFICIO   IN (1,2)                               '+
              ' AND    BP.IDPLANOPREV      = BF.IDPLANOPREV                       '+
              ' AND    BP.IDBENEFICIO      = BF.IDBENEFICIO                       '+
              ' AND    BP.FLGACEITAACERTO  = 1                                    '+
              ' AND    BTIT.IDPESSJUR      = BF.IDPESSJUR                         '+
              ' AND    BTIT.IDPLANOPREV    = BF.IDPLANOPREV                       '+
              ' AND    BTIT.IDTITULAR      = BF.IDTITULAR                         '+
              ' AND    BTIT.IDPESSOA       = BF.IDPESSOA                          '+
              ' AND    BTIT.SEQPROPOSTA    = BF.SEQPROPOSTA                       '+
              ' AND    BTIT.IDBENEFICIO    = BF.IDBENEFICIO                       '+
              ' AND    B.IDBENEFICIO       = BF.IDBENEFICIO                       '+
              ' AND    B.IDTPPAGTOBENEFIC  = TP.IDTPPAGTOBENEFIC ');
      Open;
   end;
   //leocm - 04102002 - fim

   if pcTipoItem = 'B'
   then begin
      // Buscar codigo da rubrica
      dtmAPrev.qryAux.Close;
      dtmAPrev.qryAux.SQL.Clear;
      dtmAPrev.qryAux.SQL.Add(' SELECT BP.IDRUBABONO, BP.IDRUBDESCANTECAB, BP.IDRUBRICAATRASO, BP.IDRUBDEVOLUCAO, BP.IDRUBDEVOLABONO '+
                              ' FROM   BENEFPLANPREV BP '+
                              ' WHERE  BP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                              ' AND    BP.IDBENEFICIO = '+IntToStr(piIdItem));
      dtmAPrev.qryAux.Open;

      if pcAtrasoDevol = 'A'
      then sIdRubrica   := dtmAPrev.qryAux.FieldByName('IDRUBRICAATRASO').AsString
      else sIdRubrica   := dtmAPrev.qryAux.FieldByName('IDRUBDEVOLUCAO').AsString;

      // Se for um pagamento atrasado, entao usar a rubrica de atraso
      cRecPag := 'P';
      if pcAtrasoDevol = 'A'
      then begin
         sFlgDesconto    := '0';
         sFlgAtrasoDevol := 'A';
         iFlgDevolucao   := 0;
      end
      else begin
         sFlgDesconto    := '1';
         sFlgAtrasoDevol := 'D';
         iFlgDevolucao   := 1;
      end;

   end
   else begin
      // Buscar codigo da rubrica
      dtmAPrev.qryAux.Close;
      dtmAPrev.qryAux.SQL.Clear;
      dtmAPrev.qryAux.SQL.Add(' SELECT CP.IDRUBRICAATRASO, CP.IDRUBRICADEVOLUC, CP.IDRUBDECTERCATRA, CP.IDRUBDECTERCDEVOL '+
                              ' FROM   CONTPREV  CP '+
                              ' WHERE  CP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                              ' AND    CP.IDCONTRIBUICAO = '+IntToStr(piIdItem));
      dtmAPrev.qryAux.Open;

      // Se for um pagamento atrasado, entao usar a rubrica de atraso
      cRecPag      := 'P';
      if pcAtrasoDevol = 'A'
      then begin
         sIdRubrica      := dtmAPrev.qryAux.FieldByName('IDRUBRICAATRASO').AsString;
         sFlgDesconto    := '1';
         sFlgAtrasoDevol := 'A';
         iFlgDevolucao   := 0;
      end
      else begin
         sIdRubrica      := dtmAPrev.qryAux.FieldByName('IDRUBRICADEVOLUC').AsString;
         sFlgDesconto    := '0';
         sFlgAtrasoDevol := 'D';
         iFlgDevolucao   := 1;
      end;
   end;


   dtmAPrev.qryAux.Close;
   dtmAPrev.qryAux.SQL.Clear;
   dtmAPrev.qryAux.SQL.Add(' SELECT CODPROVDESC FROM PROVDESC WHERE IDPROVENTO = '+sIdRubrica);
   dtmAPrev.qryAux.Open;

   if not dtmAPrev.qryAux.IsEmpty
   then sCodProvDesc := dtmAPrev.qryAux.FieldByName('CODPROVDESC').AsString;

   // O valor na HSTBENEFBFCIARIO já está pro-rateado de acordo com o número de dias
   dValorAcertado    := 0;
   dValorRateadoOrig := pdValorARatear;

   dtmAPrev.qryBenef.First;
   while not dtmAPrev.qryBenef.Eof do
   begin
      if  (not bTemOutroRecebedor) and (not  bFaltaPercentual)
      then  dValorRateado := dValorRateadoOrig * dtmAPrev.qryBenef.FieldByName('PERCENTUAL').AsFloat / 100
      else  dValorRateado := dValorRateadoOrig / dtmAPrev.qryBenef.recordcount;

      // ******************************************************************************
      // Preencher Informacoes de Integracao com Financeiro e Contabilidade
      // ******************************************************************************
      if pcTipoItem = 'B'
      then begin
         if not dtmAPrevIntegraBack.BuscaInfIntegra( piIdPessJur,
                                                     piIdPlanoPrev,
                                                     piIdTitular,
                                                     dtmAPrev.qryBenef.FieldByName('IDPESSOA').AsInteger,
                                                     piIdItem,
                                                     'B',
                                                     'B',
                                                     iFlgDevolucao,
                                                     psAnoMesCobranca,
                                                     psAnoMesReferencia,
                                                     sTipCodigo,
                                                     sCodTipRecDes,
                                                     sRecPag,
                                                     sCodTipDoc,
                                                     sCodPortForma,
                                                     sCodCentroRespon,
                                                     sCodSubConta,
                                                     sCodCentroCustoD,
                                                     sIdEmpresa,
                                                     sCodCentroCustoC,
                                                     sPlaContaD,
                                                     sPlano,
                                                     sPlaContaC,
                                                     sPlaContaDProvis,    // Gleyber - 11/01/2006 - Pendência 19538
                                                     sPlaContaCProvis,    // Gleyber - 11/01/2006 - Pendência 19538
                                                     sUnidNegoc,
                                                     sIdEmpresaProp,
                                                     'R',   // Gleyber - 12/09/2005 - Pendência 20169
                                                     True,
                                                     sMsgErro ) //leocm - 28042005
         then begin
            MsgDlg('Acerto de Benefício : Erro ao buscar parametrização financeira. Verifique.','Erro',mtError,[mbOk],0);
            Exit;
         end;
      end
      else begin
         if not dtmAPrevIntegraBack.BuscaInfIntegra( piIdPessJur,
                                                     piIdPlanoPrev,
                                                     piIdTitular,
                                                     dtmAPrev.qryBenef.FieldByName('IDPESSOA').AsInteger,
                                                     piIdItem,
                                                     'C',
                                                     'B',
                                                     iFlgDevolucao,
                                                     psAnoMesCobranca,
                                                     psAnoMesReferencia,
                                                     sTipCodigo,
                                                     sCodTipRecDes,
                                                     sRecPag,
                                                     sCodTipDoc,
                                                     sCodPortForma,
                                                     sCodCentroRespon,
                                                     sCodSubConta,
                                                     sCodCentroCustoD,
                                                     sIdEmpresa,
                                                     sCodCentroCustoC,
                                                     sPlaContaD,
                                                     sPlano,
                                                     sPlaContaC,
                                                     sPlaContaDProvis,    // Gleyber - 11/01/2006 - Pendência 19538
                                                     sPlaContaCProvis,    // Gleyber - 11/01/2006 - Pendência 19538
                                                     sUnidNegoc,
                                                     sIdEmpresaProp,
                                                     'R',   // Gleyber - 12/09/2005 - Pendência 20169
                                                     True,
                                                     sMsgErro ) //leocm - 28042005
         then begin
            MsgDlg('Acerto de Contribuição : Erro ao buscar parametrização financeira. Verifique.','Erro',mtError,[mbOk],0);
            Exit;
         end;

      end;

      iIdRecebedor := dtmAPrev.qryBenef.FieldByName('IDPESSOA').AsInteger;

      if not InsereTMPDESC ( dtmAPrev.qryAux,
                             '', sCodCentroCustoC, sCodCentroCustoD,
                             sCodCentroRespon, '', '',
                             sCodPortForma, sCodProvDesc, sCodSubConta,
                             sCodTipDoc, sCodTipRecDes, '',
                             psDATACOBRANCA, '', psDATACOBRANCA,
                             'Devolução de Benefício Pós-Morte', '', '',
                             sFlgAtrasoDevol, 'B' , sFlgDesconto,
                             '0',
                             '', 'P', dtmAPrev.qry.FieldByName('IDBENEFICIO').AsString,
                             sIdEmpresaProp,sIdEmpresaProp,sIdEmpresaProp,
                             dtmAPrev.qryBenef.FieldByName('IDPESSOA').AsString,
                             IntToStr(iIdFundacao), IntToStr(piIdLote),
                             IntToStr(Sistema.IdModulo), IntToStr(piIdMotivo),
                             IntToStr(piIdPessJur),
                             IntToStr(iidrecebedor), // CGUEDES - 22/08/2002
                             IntToStr(piIDPLANOPREV), IntToStr(piIDPLANOPREV),
                             sIdRubrica, IntToStr(piIDTITULAR), '',
                             '', Copy(psDataCobranca,7,4)+'/'+Copy(psDatacobranca,4,2),
                             dtmAPrev.qry.FieldByName('MESREFERENCIA').AsString,
                             '', '', sPlaContaC,
                             sPlaContaD, sPlano, cRecPag,
                             '***', '1', IntToStr(Sistema.IdModulo),
                             '0',  prmTpOperFolhaBen,  sUnidNegoc, FloatToStr(dValorRateado),
                             '', '', '', '', '')
      then begin
         MsgDlg('Erro ao inserir Devolução de Benefício Pós-Morte.','Erro',mtError,[mbOk],0);
         Exit;
      end;

      dValorAcertado    := dValorAcertado + dValorRateado;
      dtmAPrev.qryBenef.Next;
   end;

   if pbInsereAcertoTit
   then begin
      if pcTipoItem = 'C'
      then InsereHstContribPREV( dtmAPrev.qry,
                                 piIdTitular,
                                 piSeqProposta,
                                 piIdPessJur,
                                 piIdPlanoPrev,
                                 piIdItem,
                                 piIdMotivo,
                                 psAnoMesReferencia,
                                 psAnoMesCobranca,
                                 -1,
                                 dtDataDeveriaTerPago.Text,
                                 dtDataAcerto.Text,
                                 pdValorARatear,
                                 pdValorARatear,
                                 pdValorARatear,
                                 -1,
                                 1,
                                 0,
                                 0,
                                 0,
                                 '',
                                 '',
                                 'AS',
                                 2,// sitrecebimento = ok
                                 0,
                                 -1,
                                 'F',
                                 1,
                                 iFlgDevolucao,
                                 1,
                                 1,
                                 'B') { Augusto 12/05/2006 }
      else begin
      end;

   end;


   Result := True;
end; // ProcessaRateioPorBeneficiario



procedure TfrmRetroativoPREV.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  frmAguarde.Apaga;

  QryAlteradorCorrecao.Close; { Augusto 19/07/2004 }

  if dtmBaseDados.dbBaseDados.InTransaction
  then begin
     if MsgDlg('Existe uma operação em aberto. Deseja sair da tela ? ','Confirmação',mtConfirmation,[mbYes, mbNO],0) = mrNo
     then Abort;

     //leofuncef - 26012005 - adicionei o try
     try CloseFile(F); except end; // Gleyber - Pendência 16188 - 17/03/2004


     dtmBaseDados.dbBaseDados.RollBack;
  end;

  FreeAndNil( CtrlBenefBfciario );   { Augusto 14/02/2006 }

  inherited;

end;

// *****************************************************************************
// REAJUSTE DE BENEFICIO RETROATIVO
// *****************************************************************************
function  TfrmRetroativoPREV.ProcessaRevisaoBeneficio ( psAnoMesIni      : string;
                                psAnoMesFim      : string;
                                piIdPessJur      : longint;
                                piIdPlanoPrev    : longint;
                                piIdTitular      : longint; { Augusto 05/05/2004 }
                                piIdPessoa       : longint;
                                piSeqProposta    : longint;
                                psContribuicoes  : string ) : Integer; // -1 : erro
                                                                       //  0 : ok
                                                                       //  1 : nada encontrado
                                                                       //  2 : cancelado -> avisar

var
   sAnoMesAnt, sAnoMesAtual, sAnoMesAtualReal  : string;
   sUltMesCalculo                      : string;
   dValorDevido                        : double;
   iTotBeneficiarios                   : longint;
   iIncluiMesConc                      : word;
   sAnoMesLote                         : string;
   sDataPagamento                      : string;
   sUltMesReajuste                     : string;
   dValorBeneficioIntegralOriginal     : double;
   dValorBeneficioIntegralAposMinimo   : double;
   dValorPrevAntesMinimo               : double;
   dValorSRBRetorno                    : double;
   dValorEmReal                        : double;
   dValorTotal                         : double;
   dValorEmCotas                       : double;
   bErro                               : boolean;
   bReajustou                          : boolean;
   sFlgDevolucao                       : string;
   dDiferenca, dValorCalculo           : double;
   iIdLote                             : longint;
   sMsgErro                            : string;
   bCalculouContribuicoes              : boolean;
   dValorCobrado, dValorAntes          : double;
   dValorBenefRateado                  : double;
   iTipoMov                            : word;
   iIdRegraCalculo                     : longint;
   iIdRegraCalcReserva                 : longint;
   dValorReserva                       : double;
   dValorReservaCota                   : double;
   varfields                           : variant;
   sAnoMesFim                          : string;
   mResult                             : integer;
   sSalarioVirtualNoMesAntesReajuste   : string;
   sSalarioVirtualNoMes                : string;
   bRefazendoRetroativo                : boolean;
   sAnoMesInicioAcerto                 : string;
   sAnoMesFimAcerto                    : string;
   sValorReajustado                    : string;
   sEnquadramentoNoMesAntesReajuste    : string;
   sEnquadramentoNoMes                 : string;
   StrConcedidos                       : string;
   dEnquadramento  : double;
   dIndice                             : double;
   iFlgEnviado                         : integer;
   bCalculaTudo, bBeneficioParaTitular   : boolean;
   iNumRecebimento, iIdRespContribuicao, iIdContribuicao  : longint;
   sSQLBenefAssoc                      : string; // CAMILLE - 16.12.2003
   sDataRefInd, sDataRefSRB            : string; // CAMILLE - 16.12.2003
   sDataInicioAnt                      : string; // CAMILLE - 16.12.2003
   sValorAnt                           : string; // CAMILLE - 16.12.2003
   sNomeBenefAnt                       : string; // CAMILLE - 16.12.2003
   sIdTpPagtoAnt                       : string; // CAMILLE - 16.12.2003
   sUltMesReajAnt                      : string; // CAMILLE - 16.12.2003
   sFlgBenefMinAnt                     : string; // CAMILLE - 16.12.2003
   sDataEventoAnt                      : string; // CAMILLE - 16.12.2003
   sCodBeneficioAnt                    : string; // CAMILLE - 16.12.2003
   sValorBase1Ant                      : string; // CAMILLE - 16.12.2003
   sValorBase2Ant                      : string; // CAMILLE - 16.12.2003
   sValorBase3Ant                      : string; // CAMILLE - 16.12.2003
   sNumProcINSS                        : string; // CAMILLE - 16.12.2003
   sFlgBenefMinimo, sBeneficiosAux, sVlrCalcInss, sVlrInfInss : string; // CAMILLE - 22.01.2004
   bPrimCont : Boolean;
   sTextoAux, sIdMotivo, sIndiceCorrecao, sAnoMesInicio, sSQLRegraCorrecao,
   sAnoMesAcertoRetroativo : String;
   SavePlace: TBookmark;
   iIdMovBenefExcluir, iIdRetroativoExcluir, iIdUsuarioAutoriza : longint;
   dCorrecaoMonetaria : Currency;
   bHstDiferente, bExisteRevisao, bInssMigrado, bImprimeCabecalhoPessoa : Boolean;
begin
   Result               := -1; { Erro }
   sAnoMesAtual         := psAnoMesIni;
   bRefazendoRetroativo := False;

   prmCalculaSRBNoRetroativo := True;
   if rgrpRecalculaBeneficio.ItemIndex = 4  then
     prmCalculaSRBNoRetroativo := False;

   if rbRecalcBenef.Checked
   then iTipoMov := 13
   else iTipoMov := 6;

   iIncluiMesConc  := qryLote.FieldByName('FLGINCLUIMESCONC').Asinteger;
   iIdCalculo      := -1;
   iIdCalculoGeral := -1;
   sAnoMesLote     := qryLote.FieldByName('MESREFERENCIA').AsString;

   sDataPagamento  := CriticaDataCobrancaSit(qryAux,
                                             IntToStr(iIdFundacao),
                                             '',
                                             'AS',
                                             'P',
                                             Copy(sAnoMesLote,6,2),
                                             Copy(sAnoMesLote,1,4),
                                             true); //P.RAMOS-07.04.2006-PEND.22044
   bCalculouContribuicoes := False;

   if rbtnIndividual.Checked
   then sAnoMesInicioAcerto := edAnoMesIniAcerto.Text
   else sAnoMesInicioAcerto := edAnoMesIniAcerto.Text;

   if rbtnIndividual.Checked
   then sAnoMesFimAcerto := edAnoMesFimAcerto.Text
   else sAnoMesFimAcerto := edAnoMesFimAcerto.Text;

   if (rgrpRecalculaBeneficio.ItemIndex <> 3) and (bRefazExistentes or rbtnIndividual.checked)
   then begin
      bExisteRevisao := False;
      bHstDiferente  := False;

      // VERIFICAR SE JÁ TEVE RETROATIVO PARA A PESSOA
      with qryAux do
      begin
        (*
        Close;
        SQL.Clear;
        SQL.Add(' SELECT BF.IDTITULAR, BF.IDPESSOA, '+
                '        DECODE(NF.IDRESPNUCLEO, NULL, BF.IDPESSOA, NF.IDRESPNUCLEO) AS IDRESPCONTRIBUICAO '+
                ' FROM   HSTBENEFBFCIARIO HST, BENEFBFCIARIO BF, BFCIARIOTITPLAN BTIT, NUCLEOFAMILIAR NF  '+
                ' WHERE  HST.IDPESSJUR    = '+qryPessoasxxATratar.FieldByName('IDPESSJUR').AsString+
                ' AND    HST.IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+ { Augusto 20/12/2004 - era qryPessoasxxATratar.FieldByName('IDPLANOPREV').AsString + }
                ' AND    HST.IDTITULAR    = '+qryPessoasxxATratar.FieldByName('IDTITULAR').AsString ); //leofuncef - 02022005 - troquei por IDTITULAR
        // CAMILLE - 28.10.2004
        if rbtnIndividual.Checked
        then SQL.Add(' AND    HST.IDPESSOA     = '+ IntToStr(iIdPessoa) );  { Augusto 05/05/2004 }

        SQL.Add( ' AND    HST.SEQPROPOSTA  = '+qryPessoasxxATratar.FieldByName('SEQPROPOSTA').AsString+
                 ' AND    HST.IDMOTIVO     = '+qryMotivo.FieldByName('IDMOTIVO').AsString+
                 ' AND    HST.MES          = '''+sAnoMesLote+''''+
                 ' AND    HST.IDBENEFICIO    IN ('+sBeneficios+') '+ { Augusto 24/05/2004 }
                 { Augusto 20/05/2004 - Apenas no mesmo periodo }
                 ' AND    HST.MESREFERENCIA >= '''+psAnoMesIni+''''+

                 ' AND    BF.IDPESSJUR     = HST.IDPESSJUR     '+
                 ' AND    BF.IDPLANOPREV   = HST.IDPLANOPREV   '+
                 ' AND    BF.IDTITULAR     = HST.IDTITULAR     '+
                 ' AND    BF.IDPESSOA      = HST.IDPESSOA      '+
                 ' AND    BF.SEQPROPOSTA   = HST.SEQPROPOSTA   '+
                 ' AND    BF.IDBENEFICIO   = HST.IDBENEFICIO   '+
                 ' AND    BF.DATAULTREVISAO IS NOT NULL        '+

                 ' AND    BTIT.IDPESSJUR      = BF.IDPESSJUR   '+
                 ' AND    BTIT.IDTITULAR      = BF.IDTITULAR   '+
                 ' AND    BTIT.IDPESSOA       = BF.IDPESSOA      '+
                 ' AND    BTIT.IDPLANOPREV    = BF.IDPLANOPREV   '+
                 ' AND    BTIT.IDBENEFICIO    = BF.IDBENEFICIO   '+
                 ' AND    BTIT.IDPLANOORIGEM  = BF.IDPLANOORIGEM '+
                 ' AND    BTIT.SEQPROPOSTA    = BF.SEQPROPOSTA   '+

                 ' AND    NF.IDNUCLEOFAMILIAR(+) = BTIT.IDNUCLEOFAMILIAR '+
                 ' AND    NF.IDTITULAR(+)        = BTIT.IDTITULAR        ');
         Open;

         { Inicio Augusto 19/05/2005 - Verificar se houve revisão no periodo }
         if not IsEmpty Then bExisteRevisao := True;
         sTextoAux      := 'Existe uma revisão já gravada para este participante.'+#13+#13+
                           'Deseja refazer a revisão ? ';
         *)


         { Inicio Augusto 03/10/2006 - Verificar se existe preparo no mês }
         sSQL := 'SELECT 1 '+
                 'FROM HSTBENEFBFCIARIO HST '+
                 'WHERE  HST.MES         = '+ QuotedStr( qryLote.FieldByName('MESREFERENCIA').AsString ) +' '+
                 'AND    HST.IDTITULAR   = '+ qryPessoasATratar.FieldByName('IDTITULAR').AsString        +' '+
                 'AND    HST.IDPESSOA    = '+ IntToStr( iIdPessoa )                                      +' '+
                 'AND    HST.SEQPROPOSTA = '+ qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString      +' '+
                 'AND    HST.IDPESSJUR   = '+ qryPessoasATratar.FieldByName('IDPESSJUR').AsString        +' '+
                 'AND    HST.IDBENEFICIO IN ('+sBeneficios+') '+' '+
                 'AND    NVL(HST.VLBENEFPGTO, 0) = 0 '+' '+
                 'AND    HST.FLGCONCESSAO        = 0 ';

         If ( FazQuery( QryAux, SSQL ) ) Then Begin

           MsgDlg('O Benefício já está preparado para o mês "'+ qryLote.FieldByName('MESREFERENCIA').AsString + '" ' + #13 +
                  'Deve ser desfeito o preparo antes. ',
                  'Erro',mtInformation,[mbOk],0);
           Exit;

         End;
         { Fim Augusto 03/10/2006                                         }

         If Not bExisteRevisao Then Begin

           sSQL := 'SELECT '+
                   '  R.IDRETROATIVO,    R.IDPESSJUR,       R.IDPLANOPREV, R.IDTITULAR, '+
                   '  R.IDPESSOA,        R.SEQPROPOSTA,     R.IDMOTIVO,    R.ANOMESACERTO, '+
                   '  R.ANOMESINIACERTO, R.ANOMESFIMACERTO, '+
                   '  M.IDBENEFICIO,     M.DATAMOV,         NVL(M.IDMOVBENEF,0) AS IDMOVBENEF, '+
                   '  DECODE(NF.IDRESPNUCLEO, NULL, R.IDPESSOA, NF.IDRESPNUCLEO) AS IDRESPCONTRIBUICAO, '+
                   '  MOT.DESCRICAO '+
                   'FROM '+
                   '  RETROATIVOPREV R, MOVBENEF M, BFCIARIOTITPLAN BTIT, NUCLEOFAMILIAR NF,  '+
                   '  MOTIVO MOT '+
                   'WHERE '+
                   '     R.IDPESSJUR   = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                   ' AND R.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                   ' AND R.IDTITULAR   = '+qryPessoasATratar.FieldByName('IDTITULAR').AsString+
                   ' AND R.IDPESSOA    = '+IntToStr(iIdPessoa)+
                   ' AND (R.ANOMESFIMACERTO >= '+QuotedStr(sAnoMesInicioAcerto)+' AND R.ANOMESINIACERTO <= '+QuotedStr(sAnoMesFimAcerto)+') '+
                   ' AND R.FLGDESCFOLHAAS = 1 '+
                   ' AND M.IDBENEFICIO IN ('+sBeneficios+') '+

                   ' AND (R.IDRETROATIVO      = M.IDRETROATIVO) '+
                   ' AND (BTIT.IDPESSJUR      = R.IDPESSJUR)     '+
                   ' AND (BTIT.IDTITULAR      = R.IDTITULAR)     '+
                   ' AND (BTIT.IDPESSOA       = R.IDPESSOA)      '+
                   ' AND (BTIT.IDPLANOPREV    = R.IDPLANOPREV)   '+
                   ' AND (BTIT.IDBENEFICIO    = M.IDBENEFICIO)   '+
                   ' AND (BTIT.SEQPROPOSTA    = R.SEQPROPOSTA)   '+

                   ' AND (R.IDMOTIVO          = MOT.IDMOTIVO)    '+

                   ' AND (NF.IDNUCLEOFAMILIAR(+) = BTIT.IDNUCLEOFAMILIAR) '+
                   ' AND (NF.IDTITULAR(+)        = BTIT.IDTITULAR)        ';
           { Inicio Augusto 09/06/2006 }
           If ( ChBxProcessaEmOutrosLote.Checked = False ) Then Begin
             sSQL := sSQL + ' AND M.IDLOTEMOV = '+ qryLote.FieldByName('IDLOTE').AsString;
           End;
           { Fim Augusto 09/06/2006    }

           sSQL := sSQL +
                   'ORDER BY M.IDMOVBENEF DESC ';

           If FazQuery(QryAux, sSQL ) Then Begin
             iIdRetroativoExcluir    := QryAux.FieldByName('IDRETROATIVO').AsInteger;
             iIdMovBenefExcluir      := QryAux.FieldByName('IDMOVBENEF').AsInteger;
             sAnoMesAcertoRetroativo := QryAux.FieldByName('ANOMESACERTO').AsString;
             bExisteRevisao := True;
             bHstDiferente  := True;
             sTextoAux      := 'Existe uma revisão já gravada para a matricula: '+
                               qryPessoasATratar.FieldByName('MATRICULA').AsString+'.'+#13+
                               'Com o motivo '+QryAux.FieldByName('DESCRICAO').AsString+','+#13+
                               'no periodo de '+QryAux.FieldByName('ANOMESINIACERTO').AsString+' a '+
                               QryAux.FieldByName('ANOMESFIMACERTO').AsString+'.'+#13+#13+
                               'Deseja refazer a revisão ? ';

           End;
         End;
         { Fim Augusto 19/05/2005 }

         if bExisteRevisao then begin
            if not bDesfazTodosRetroativos
            then begin

              { Inicio Augusto 28/03/2007 }
              If ( not bNaoDesfazTodosRetroativos )
              Then mResult := MsgDlg(sTextoAux, 'Confirmação', mtConfirmation,
                                     [mbYes, mbYesToAll, mbNo, mbNoToAll], 0)
              Else
                mResult := mrNo;

               if mResult = mrNo
               then Exit
               else if ( mResult = mrYesToAll )
                    then bDesfazTodosRetroativos := True
               else if ( mResult = mrNoToAll )
                    then Begin
                      bNaoDesfazTodosRetroativos := True;
                      Exit;
                    End;
              { Fim Augusto 28/03/2007    }
            end;

            if FieldByName('IDTITULAR').AsInteger = FieldByName('IDPESSOA').AsInteger
            then bBeneficioParaTitular := True
            else bBeneficioParaTitular := False;
            iIdRespContribuicao        := FieldByName('IDRESPCONTRIBUICAO').AsInteger;

            bRefazendoRetroativo := True;

            { Augusto 20/05/2005 - Caso IDMOTIVO diferente, usar o do historico original }
            If bHstDiferente = True Then begin
              sIdMotivo := QryAux.FieldByName('IDMOTIVO').AsString;
            End Else Begin
              sIdMotivo := QryMotivo.FieldByName('IDMOTIVO').AsString;
            End;

            // Apagar retroativos existentes
            Close;
            SQL.Clear;
            SQL.Add(' DELETE PREVIA '+
                    ' WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                    ' AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+ { Augusto 20/12/2004 - era qryPessoasATratar.FieldByName('IDPLANOPREV').AsString + }
                    ' AND    IDTITULAR    = '+qryPessoasATratar.FieldByName('IDTITULAR').AsString ); //leofuncef - 02022005 - troquei por IDTITULAR

            { Augusto 29/05/2006 }
            if rbtnIndividual.Checked then SQL.Add(' AND IDPESSOA = '+ IntToStr(iIdPessoa) );

            SQL.Add(' AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                    ' AND    IDMOTIVO     = '+sIdMotivo+  { Augusto 20/05/2005 - Era QryMotivo.Field.... }
                    ' AND    IDBENEFICIO IN ('+sBeneficios+') '+ { Augusto 24/05/2004 }
                    ' AND    MESCOBRANCA  = '''+edMesAcerto.Text+'''');
            try
               ExecSQL;
            except
               Exit;
            end;

            { Inicio Augusto 12/08/2004 }
            Close;
            SQL.Clear;
            SQL.Add(' DELETE HSTATRASOBENEF '+
                    ' WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                    ' AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+ { Augusto 20/12/2004 - era qryPessoasATratar.FieldByName('IDPLANOPREV').AsString + }
                    ' AND    IDTITULAR    = '+qryPessoasATratar.FieldByName('IDTITULAR').AsString ); //leofuncef - 02022005 - troquei por IDTITULAR

            { Augusto 29/05/2006 }
            if rbtnIndividual.Checked then SQL.Add(' AND IDPESSOA = '+ IntToStr(iIdPessoa) );

            SQL.Add(' AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                    ' AND    IDMOTIVO     = '+sIdMotivo+  { Augusto 20/05/2005 - Era QryMotivo.Field.... }
                    ' AND    IDBENEFICIO IN ('+sBeneficios+') '+ { Augusto 24/05/2004 }
                    ' AND    MES          = '''+edMesAcerto.Text+'''');

            SQL.Add(' AND EXISTS ( SELECT 1                                       '+
                    '              FROM HSTBENEFBFCIARIO  HIN                     '+
                    '              WHERE  HIN.IDPESSJUR     = HSTATRASOBENEF.IDPESSJUR     AND '+
                    '                     HIN.IDPLANOPREV   = HSTATRASOBENEF.IDPLANOPREV   AND '+
                    '                     HIN.IDTITULAR     = HSTATRASOBENEF.IDTITULAR     AND '+
                    '                     HIN.IDPESSOA      = HSTATRASOBENEF.IDPESSOA      AND '+
                    '                     HIN.SEQPROPOSTA   = HSTATRASOBENEF.SEQPROPOSTA   AND '+
                    '                     HIN.IDMOTIVO      = HSTATRASOBENEF.IDMOTIVO      AND '+
                    '                     HIN.IDBENEFICIO   = HSTATRASOBENEF.IDBENEFICIO   AND '+
                    '                     HIN.MESREFERENCIA = HSTATRASOBENEF.MESREFERENCIA AND '+
                    '                     HIN.MES           = HSTATRASOBENEF.MES           AND '+
                    '                     HIN.FLGENVIADO    = 0)                ');



            try
               ExecSQL;
            except
               Exit;
            end;
            { Fim Augusto 12/08/2004 }

            Close;
            SQL.Clear;
            SQL.Add(' DELETE HSTBENEFBFCIARIO '+
                    ' WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                    ' AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+ { Augusto 20/12/2004 - era qryPessoasATratar.FieldByName('IDPLANOPREV').AsString + }
                    ' AND    IDTITULAR    = '+qryPessoasATratar.FieldByName('IDTITULAR').AsString ); //leofuncef - 02022005 - troquei por IDTITULAR

            { Augusto 29/05/2006 }
            if rbtnIndividual.Checked then SQL.Add(' AND IDPESSOA = '+ IntToStr(iIdPessoa) );

            SQL.Add(' AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                    ' AND    IDMOTIVO     = '+sIdMotivo+  { Augusto 20/05/2005 - Era QryMotivo.Field.... }
                    ' AND    IDBENEFICIO IN ('+sBeneficios+') '+ { Augusto 24/05/2004 }
                    ' AND    MES          = '''+edMesAcerto.Text+''''+
                    ' AND    FLGENVIADO   = 0 ' { Augusto 10/10/2006 - Apagar somente registros não enviados }
                    );

            try
               ExecSQL;
            except
               Exit;
            end;

            { Inicio Augusto 27/12/2004 - Excluir  HSTATRASOCONTRIB }
            Close;
            SQL.Clear;

            { Inicio Augusto 11/07/2006 - Verificar antes de excluir }
            if bBeneficioParaTitular then begin
              sSQL := 'SELECT 1 FROM HSTATRASOCONTRIB WHERE NUMRECEBIMENTO IN '+
                      ' (SELECT NUMRECEBIMENTO FROM HSTCONTRIBPREV '+
                      '  WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                      '  AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                      '  AND    IDPESSOA     = '+qryPessoasATratar.FieldByName('IDPESSOA').AsString+
                      '  AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                      '  AND    IDMOTIVO     = '+sIdMotivo+  { Augusto 20/05/2005 - Era QryMotivo.Field.... }
                      '  AND    SITRECEBIMENTO = 0 '+ { Augusto 10/10/2006 - Apagar somente registros não recebidos }
                      '  AND    MESCOBRANCA  = '''+edMesAcerto.Text+''')';

              If FazQuery ( QryAux, sSQL ) Then Begin

                Close;
                SQL.Clear;

                SQL.Add(' DELETE HSTATRASOCONTRIB WHERE NUMRECEBIMENTO IN '+
                        ' (SELECT NUMRECEBIMENTO FROM HSTCONTRIBPREV '+
                        '  WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                        '  AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                        '  AND    IDPESSOA     = '+qryPessoasATratar.FieldByName('IDPESSOA').AsString+
                        '  AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                        '  AND    IDMOTIVO     = '+sIdMotivo+  { Augusto 20/05/2005 - Era QryMotivo.Field.... }
                        '  AND    SITRECEBIMENTO = 0 '+ { Augusto 10/10/2006 - Apagar somente registros não recebidos }
                        '  AND    MESCOBRANCA  = '''+edMesAcerto.Text+''')');

               try
                  ExecSQL;
                except
                   Exit;
                end;
              end;

            end else begin
              SQL.Add(' DELETE HSTATRASOCONTRIB WHERE NUMRECEBIMENTO IN '+
                      ' (SELECT NUMRECEBIMENTO FROM HSTCONTRIBPREV '+
                      '  WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                      '  AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                      '  AND    IDPESSOA     = '+IntToStr(iIdRespContribuicao)+
                      '  AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                      '  AND    IDMOTIVO     = '+sIdMotivo+  { Augusto 20/05/2005 - Era QryMotivo.Field.... }
                      '  AND    SITRECEBIMENTO = 0 '+ { Augusto 10/10/2006 - Apagar somente registros não recebidos }
                      '  AND    MESCOBRANCA  = '''+edMesAcerto.Text+''')');
              try
                 ExecSQL;
              except
                 Exit;
              end;

            end;
            { Fim Augusto 11/07/2006                                 }

            { Fim Augusto 27/12/2004 }

            Close;
            SQL.Clear;

            { Inicio Augusto 11/07/2006 - Verificar antes de excluir }
            if bBeneficioParaTitular Then Begin

              sSQL := 'SELECT 1 FROM  HSTCONTRIBPREV '+
                      ' WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                      ' AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                      ' AND    IDPESSOA     = '+qryPessoasATratar.FieldByName('IDPESSOA').AsString+
                      ' AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                      ' AND    IDMOTIVO     = '+sIdMotivo+
                      ' AND    SITRECEBIMENTO = 0 '+ { Augusto 06/12/2006 - Apagar somente registros não recebidos }
                      ' AND    MESCOBRANCA  = '''+edMesAcerto.Text+'''';

              If FazQuery ( QryAux, sSQL ) Then Begin

                Close;
                SQL.Clear;

                SQL.Add(' DELETE HSTCONTRIBPREV '+
                        ' WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                        ' AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                        ' AND    IDPESSOA     = '+qryPessoasATratar.FieldByName('IDPESSOA').AsString+
                        ' AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                        ' AND    IDMOTIVO     = '+sIdMotivo+
                        ' AND    SITRECEBIMENTO = 0 '+ { Augusto 06/12/2006 - Apagar somente registros não recebidos }
                        ' AND    MESCOBRANCA  = '''+edMesAcerto.Text+'''');

                try
                   ExecSQL;
                except
                   Exit;
                end;

              End;

            End Else Begin

              SQL.Add(' DELETE HSTCONTRIBPREV H '+
                    ' WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                    ' AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                    ' AND    IDPESSOA     = '+IntToStr(iIdRespContribuicao)+
                    ' AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                    ' AND    IDMOTIVO     = '+sIdMotivo+
                    ' AND    SITRECEBIMENTO = 0 '+ { Augusto 06/12/2006 - Apagar somente registros não recebidos }
                    ' AND    MESCOBRANCA  = '''+edMesAcerto.Text+'''');
              try
                 ExecSQL;
              except
                 Exit;
              end;

            end;
            { Fim Augusto 11/07/2006                                 }


            Close;
            SQL.Clear;
            SQL.Add(' DELETE TMPDESC '+
                    ' WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                    ' AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+ { Augusto 20/12/2004 - era qryPessoasATratar.FieldByName('IDPLANOPREV').AsString + }
                    ' AND    IDTITULAR    = '+qryPessoasATratar.FieldByName('IDTITULAR').AsString ); //leofuncef - 02022005 - troquei por IDTITULAR

            { Augusto 29/05/2006 }
            if rbtnIndividual.Checked then SQL.Add(' AND IDPESSOA = '+ IntToStr(iIdPessoa) );

            SQL.Add(' AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                    ' AND    IDMOTIVO     = '+sIdMotivo+  { Augusto 20/05/2005 - Era QryMotivo.Field.... }
                    ' AND    MESCOBRANCA  = '''+edMesAcerto.Text+'''');
            try
               ExecSQL;
            except
               Exit;
            end;

            // Apagar PARCELAMENTOS
            Close;
            SQL.Clear;


            //leofuncef - 02022005 - inicio
            //o código abaixo estava acusando erro quando não tinham ribricas parametrizadas
            //inclusive por que as queries não estavam com três plics, como agora
            //rever validade do código
            If (trim(qryDadosBeneficio.FieldByName('IDRUBRICAREVISAO').AsString) <> '') And
               (trim(qryDadosBeneficio.FieldByName('IDRUBDEVOLUCAO').AsString) <> '')
            Then Begin

              { Inicio Augusto 19/04/2006 - Excluir pelo IDMOVBENEF caso exista }
              if bBeneficioParaTitular then
                SQL.Add(' DELETE RUBRICAINDIV '+
                        ' WHERE  IDPESSOA     = '+ qryPessoasATratar.FieldByName('IDPESSOA').AsString )
              else
                SQL.Add(' DELETE RUBRICAINDIV  '+
                        ' WHERE  IDPESSOA     = '+ IntToStr( iIdRespContribuicao ));

              SQL.Add(' AND  FLGTPRUBMANUT = 1 AND NUMOCORRENCIAS = 0 ' );

              If ( iIdMovBenefExcluir > 0 ) Then Begin
                SQL.Add(' AND  IDMOVBENEF = '+ IntToStr( iIdMovBenefExcluir ) + ' ');
                SQL.Add(' AND  ANOMESREF  = ' + QuotedStr( sAnoMesAcertoRetroativo ) + ' ');
              End Else
                SQL.Add(' AND (IDRUBRICA = '+qryDadosBeneficio.FieldByName('IDRUBRICAREVISAO').AsString +' OR '+
                        '      IDRUBRICA = '+qryDadosBeneficio.FieldByName('IDRUBDEVOLUCAO').AsString  +') ');
              { Fim Augusto 19/04/2006                                          }


              try
                 ExecSQL;
              except
                 Exit;
              end;

            End;

            Close;
            SQL.Clear;
            SQL.Add(' UPDATE BENEFBFCIARIO SET VALORATUAL = VALORBENEFANT, '+
                    '                      VALORTOTAL     = VALORBENEFANT, '+
                    '                      DATAULTREVISAO = NULL,      '+
                    '                      VALORBENEFANT  = NULL        '+
                    ' WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                    ' AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+ { Augusto 20/12/2004 - era qryPessoasATratar.FieldByName('IDPLANOPREV').AsString + }
                    ' AND    IDTITULAR    = '+qryPessoasATratar.FieldByName('IDTITULAR').AsString ); //leofuncef - 02022005 - troquei por IDTITULAR

            { Augusto 29/05/2006 }
            if rbtnIndividual.Checked then SQL.Add(' AND IDPESSOA = '+ IntToStr(iIdPessoa) );

            SQL.Add(' AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                    ' AND    IDBENEFICIO IN ('+sBeneficios+') '+ { Augusto 24/05/2004 }
                    ' AND    DATAULTREVISAO IS NOT NULL ');
            try
               ExecSQL;
            except
               Exit;
            end;

            { Augusto 20/05/2005 - Excluir MOVBENEF }
            //If bHstDiferente = True Then begin
            //  sSQL := 'DELETE MOVBENEF WHERE IDRETROATIVO = '+IntToStr(iIdRetroativoExcluir);
            //  If Not ExecutarQuery(QryAux,sSQL) Then Exit;
            //End;

         end { If Not bExisteRevisao }

      end;
   end;
{
   // Abrir query com benefícios da pessoa
   with qryBenefBfciario do
   begin
      Close;
      SQL.Clear;
      // CAMILLE - 15.12.2003
      // NÃO REVISAR BENEFICIO COM CONCESSAO EM ABERTO
      SQL.Add(' SELECT 1                                           '+
              ' FROM   HSTBENEFBFCIARIO H                          '+
              ' WHERE  H.IDPESSJUR      = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString                           +
              ' AND    H.IDPLANOPREV    = '+qryPessoasATratar.FieldByName('IDPLANOPREV').AsString                         +
              ' AND    H.IDTITULAR      = '+qryPessoasATratar.FieldByName('IDPESSOA').AsString                            +
              ' AND    H.SEQPROPOSTA    = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString                         +
              ' AND    H.IDBENEFICIO    IN ('+sBeneficios+')                                                             '+ // CAMILLE - 12.12.2003
              ' AND    H.MESREFERENCIA  >= '''+psAnoMesIni+'''    '+
              ' AND    H.MESREFERENCIA  <= '''+psAnoMesFim+'''    '+
              ' AND    H.FLGCONCESSAO   = 1                       '+
              ' AND    H.VLBENEFPGTO    IS NULL                   '+
              ' AND    H.FLGENVIADO     <> 9                      ');
      Open;
      if (not IsEmpty)
      then begin
         if not chkGravaDemons.Checked
         then mmResult.Lines.Add('      [AVISO] Matrícula possui concessão ou acertos em aberto. Revisão não Processada. Verifique. ');
         GravaLinhaTXT('      [AVISO] Matrícula possui concessão ou acertos em aberto. Revisão não Processada. Verifique. ');
         Exit;
      end;
   end;
}

   qryReservaPart.Close;
   qryReservaPart.ParamByName('IDPESSJUR').AsInteger   := qryPessoasATratar.FieldByName('IDPESSJUR').AsInteger;
   qryReservaPart.ParamByName('IDPLANOPREV').AsInteger := qryPessoasATratar.FieldByName('IDPLANOPREV').AsInteger;
   qryReservaPart.ParamByName('IDTITULAR').AsInteger   := qryPessoasATratar.FieldByName('IDTITULAR').AsInteger; //leofuncef - 02022005 - troquei por IDTITULAR
   qryReservaPart.ParamByName('SEQPROPOSTA').AsInteger := qryPessoasATratar.FieldByName('SEQPROPOSTA').AsInteger;
   qryReservaPart.Open;


   // Abrir query com benefícios da pessoa
   with qryBenefBfciario do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DISTINCT BF.NUMEROPROCESSO,             BF.IDPESSJUR,   BF.IDPLANOPREV, BF.IDPESSOA,               '+
              '        BF.IDTITULAR,      BF.SEQPROPOSTA,      BF.IDBENEFICIO, BP.IDREGRAPRIMPAGTO,                       '+
              '        NVL(BF.DATAINICIO, NVL(BF.DATAINICIOFUND, TO_DATE(''01/01/1900'',''DD/MM/YYYY''))) AS DATAINICIO,  '+ // CAMILLE(3) - 28.10.2004
              '        BF.VALORATUAL,                                                                                     '+
              '        DECODE(BF.FLGDATAPREVISTA,1,BF.DATAFINALPREVISTA,BF.DATAFINAL) AS DATAFINAL,                       '+
              '        BF.VALORBENEFANT,                                                                                  '+
              '        PL.MESPGABONO, '+ //P.RAMOS-06/04/2006-PEND.22029
              '        BF.VALORTOTAL,     BF.VALORCOTAS,       BF.FLGDATAPREVISTA,                                        '+
              '        BF.FLGPROVISORIO,  BF.PRAZOPROVISORIO,  BF.PERCPROVISORIO,                                         '+ // CAMILLE - 19.04.2004
              '        BF.IDSITBENEFICIO, BF.VALORSRB,         BP.IDREGRACALCABONO,                                       '+
              '        BP.FLGCALCTODOMES, BP.IDREGRAULTPAGTO,  BF.IDTPPAGTOBENEFIC,                                       '+
              '        BF.ULTMESREAJUSTE, BP.IDREGRACALCULO,   BF.CODPORTFORMA,                                           '+
              '        BF.ULTMESPREPARO,                                                                                  '+ // CAMILLE - 26.10.2004
              { Augusto 05/05/2004 }
              '        DECODE(BF.VALORBASE1,NULL,BPP.VALORBASE1, BF.VALORBASE1) VALORBASE1, '+
              '        DECODE(BF.VALORBASE2,NULL,BPP.VALORBASE2, BF.VALORBASE2) VALORBASE2, '+
              '        DECODE(BF.VALORBASE3,NULL,BPP.VALORBASE3, BF.VALORBASE3) VALORBASE3, '+
              //'        BPP.VALORBASE1,    BPP.VALORBASE2,      BPP.VALORBASE3,                                            '+

              '        P.DTEVENTO,        BF.DATAINICIOFUND,   BF.DATAINICIOINSS,                                         '+
              '        BF.DATAINICIO,     BF.DATAREQUERIMENTO, BF.VLRINFINSS,                                             '+
              '        BF.VLRCALCINSS,    BF.VALORSRB,                                                                    '+
              '        EL.IDSITFUNC,      PP.IDSITPART,        PP.IDSITPLANOPREV,                                         '+
              '        PP.INSCRICAODATA,  PP.DTINICIOINSC,     PP.DATACANCELAMENTO,                                                            '+
              '        B.FLGRESGATE,      B.NUMORDEMEVENTO,    BP.FLGREFERENCIA,                                          '+
              '        EG.FLGINTERNO AS FLGINTEVENTO, EL.MATRICULA, PP.INSCRICAONUMERO, '+
              '        DECODE(BF.IDTITULAR, BF.IDPESSOA, SP.FLGINTERNO,''AS'') AS FLGINTERNO,   '+ //leofuncef - 04102005
              '        B.FLGBENEFTEMP,    PP.FLGSALVIRTBENEF, B.NOME, PF.VLRENQUADRAMENTO,                                '+
              '        PLP.IDRGENQUADRAMENTO, BP.IDREGRASRB,                                                              '+
              { Augusto 03/02/2006 }
              '        BF.FLGPAGAINSS AS BENEFICIOPAGAINSS, BP.FLGPAGAINSS AS PLANOPAGAINSS, '+
              { Augusto 02/02/2004 }
              '        PBENEF.NOME AS NOMEBENEF, '+
              { Augusto 21/05/2004 }
              '        BF.DIBBENEFANT, BTIT.PERCENTUAL, DP.IDDEPENDENCIA, BP.FLGPAGAINSS, '+
              '        BTIT.IDRESPONSAVEL, BTIT.IDNUCLEOFAMILIAR '+
              ' FROM   PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP, PROCESSOBENEF P, BENEFBFCIARIO BF,                 '+
              '        EVENTOGERADOR EG, BENEFPLANPREV BP, SITPART SP, BENEFICIO B, BENEFPLANOPART BPP,                   '+
              '        PLANPREVPATRO PLP,                                                                                 '+
              '        PLANPREV PL, '+ //P.RAMOS-06/04/2006-PEND.22029
              { Augusto 02/02/2004 - Busca nome do beneficiario }
              '        PESSOA PBENEF,                                                                                      '+
              { Augusto 21/05/2004 - Percentual }
              '        BFCIARIOTITPLAN BTIT, DEPENTIT DP                                                                  '+
              ' WHERE  '+

              ' BTIT.IDRESPONSAVEL = '''+qryPessoasATratar.FieldByName('IDRESPONSAVEL').AsString+''' '+ //leofuncef - 28102005
              //' ((DP.MATRICULA      = '''+qryPessoasATratar.FieldByName('MATRICULA').AsString+''') OR (DP.MATRICULA IS NULL)) '+ //leofuncef - 27102005

              ' AND    BF.IDPESSJUR      = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString                           +
              ' AND    BF.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+  // Augusto 27/2004 qryPessoasATratar.FieldByName('IDLANOPREV').AsString
              ' AND    BF.IDTITULAR      = '+qryPessoasATratar.FieldByName('IDTITULAR').AsString                            ); //leofuncef - 02022005 - troquei por idtitular

      // CAMILLE - 28.10.2004
      if rbtnIndividual.Checked
      then SQL.Add(' AND    BF.IDPESSOA     = '+ IntToStr(iIdPessoa) );  { Augusto 05/05/2004 }

      //' AND    BF.IDPESSOA       = '+ IntToStr(iIdPessoa)+ { Augusto 05/05/2004 }
      SQL.Add(' AND    BF.SEQPROPOSTA    = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString                         +
              ' AND    BF.IDBENEFICIO    IN ('+sBeneficios+')                                                             '+ // CAMILLE - 12.12.2003
              ' AND    PLP.IDPESSJUR     = BF.IDPESSJUR                                                                   '+
              ' AND    PLP.IDPLANOPREV   = BF.IDPLANOPREV                                                                 '+
              ' AND    PL.IDPLANOPREV    = PLP.IDPLANOPREV '+ //P.RAMOS-06/04/2006-PEND.22029
              ' AND    TO_CHAR(BF.DATAINICIOFUND,''YYYY/MM'') <= '''+psAnoMesIni+'''                                      '+
              // CAMILLE - 28.10.2004
              // COMENTANDO A DATA FINAL BENEFICIOS DE 2000 SERÃO REVISADOS MESMO QUE A REVISAÕ SEJA SÓ EM
              // NO PERIODO DE 2004/1 A 2004/09 POR EXEMPLO
              // VOLTEI O JOIN PELA DATA FINAL
              { Augusto 26/05/2004 - Revisar beneficios encerrados }
              //' AND    ((TO_CHAR(BF.DATAFINAL,''YYYY/MM'')    >= '''+psAnoMesFim+'''  ) OR (BF.DATAFINAL IS NULL) )       '+
              ' AND    ((TO_CHAR(BF.DATAFINAL,''YYYY/MM'')    >= '''+psAnoMesIni+'''  ) OR (BF.DATAFINAL IS NULL) )       ');
              // CAMILLE - 28.10.2004 - fim

      {---------------------------------------------------------------------------------------------}
      { Augusto 28/12/2004 - Retirado pois este subselect acabou ficando redundante                 }
      //        ' AND    EXISTS (SELECT 1 FROM BENEFBFCIARIO BFPROC                                                         '+
      //        '                WHERE  BFPROC.IDPESSJUR      = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString        +
      //        '                AND    BFPROC.IDPLANOORIGEM  = '+qryPessoasATratar.FieldByName('IDPLANOPREV').AsString      + // Augusto 26/05/2004
      //        '                AND    BFPROC.IDTITULAR      = '+qryPessoasATratar.FieldByName('IDPESSOA').AsString         );
      //// CAMILLE - 28.10.2004
      //if rbtnIndividual.Checked
      //then SQL.Add('           AND    BFPROC.IDPESSOA     = '+ IntToStr(iIdPessoa) )   { Augusto 05/05/2004 }
      //else SQL.Add('           AND    BFPROC.IDPESSOA     = BF.IDPESSOA '          );
      //      '                AND    BFPROC.IDPESSOA       = '+ IntToStr(iIdPessoa)+ { Augusto 05/05/2004 }
      //SQL.Add('                AND    BFPROC.SEQPROPOSTA    = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString      +
      //        '                AND    BFPROC.IDBENEFICIO    IN ('+sBeneficios+') )                                        ');
      {---------------------------------------------------------------------------------------------}

      // CAMILLE - 29.10.2004
      if not chkConsideraResgate.Checked
      then SQL.Add(' AND B.FLGRESGATE = 0 ');

      SQL.Add(' AND    BP.IDPLANOPREV     = BF.IDPLANOPREV                                                                '+
              ' AND    BP.IDBENEFICIO     = BF.IDBENEFICIO                                                                '+
              ' AND    B.IDBENEFICIO      = BP.IDBENEFICIO                                                                '+
              ' AND    BPP.IDPESSJUR(+)   = BF.IDPESSJUR                                                                  '+
              ' AND    BPP.IDPLANOPREV(+) = BF.IDPLANOPREV                                                                '+
              ' AND    BPP.IDPESSOA(+)    = BF.IDTITULAR                                                                  '+
              ' AND    BPP.SEQPROPOSTA(+) = BF.SEQPROPOSTA                                                                '+
              ' AND    BPP.IDBENEFICIO(+) = BF.IDBENEFICIO                                                                '+
              ' AND    P.NUMEROPROCESSO   = BF.NUMEROPROCESSO                                                             '+
              ' AND    EL.IDPESSJUR       = BF.IDPESSJUR                                                                  '+
              ' AND    EL.IDPESSOA        = BF.IDTITULAR                                                                  '+
              ' AND    PP.IDPESSJUR       = BF.IDPESSJUR                                                                  '+
              ' AND    PP.IDPLANOPREV     = BF.IDPLANOORIGEM                                                              '+ // Augusto 25/03/2004
              ' AND    PP.IDPESSOA        = BF.IDTITULAR                                                                  '+
              ' AND    PP.SEQPROPOSTA     = BF.SEQPROPOSTA                                                                '+
              ' AND    EG.IDEVENTOGERADOR = B.IDEVENTOGERADOR                                                             '+
              ' AND    SP.IDSITPART       = PP.IDSITPART                                                                  '+
              ' AND    PF.IDPESSOA        = BF.IDPESSOA                                                                   '+
              { Augusto 02/02/2004 }
              ' AND    BF.IDPESSOA        = PBENEF.IDPESSOA                                                               '+
              { Augusto 21/05/2004 BFCIARIOTITPLAN }
              ' AND    BTIT.IDPESSJUR      = BF.IDPESSJUR                         '+
              ' AND    BTIT.IDPLANOPREV    = BF.IDPLANOPREV                       '+
              ' AND    BTIT.IDTITULAR      = BF.IDTITULAR                         '+
              ' AND    BTIT.IDPESSOA       = BF.IDPESSOA                          '+
              ' AND    BTIT.SEQPROPOSTA    = BF.SEQPROPOSTA                       '+
              ' AND    BTIT.IDBENEFICIO    = BF.IDBENEFICIO                       '+
              ' AND    BTIT.IDPLANOORIGEM  = BF.IDPLANOORIGEM                     '+ { Augusto 28/12/2004 }
              ' AND    BF.IDTITULAR        = DP.IDTITULAR                         '+
              ' AND    BF.IDPESSOA         = DP.IDPESSOA                          '+
              ' AND    BF.IDSITBENEFICIO   <> 4                                   ' // CAMILLE(3) - 28.10.2004
              { Augusto 23/04/2004 }
              //' AND    BF.IDSITBENEFICIO <> 3 '
              );
      { Augusto 21/01/2005 - Retirar beneficios retidos }
      if (Not ChBxProcessaRetidos.Checked) then SQL.Add(' AND BF.IDSITBENEFICIO <> 2 ');
      { Augusto 29/05/2006 - Retirar beneficios encerrados }
      if (Not ChBxProcessaEncerrados.Checked) then SQL.Add(' AND BF.IDSITBENEFICIO <> 3 ');

      if rbtnIndividual.Checked then
        SQL.Add(' AND ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )                 ');

      SQL.ADD(' ORDER BY BP.FLGREFERENCIA DESC, PBENEF.NOME '); { Augusto 20/02/2004 era B.NUMORDEMEVENTO antes do PBENEF.NOME }

      Open;
      //QRYBENEFBFCIARIO.SQL.SAVETOFILE('C:\TEMP\SQL_RETROATIVO.TXT');
   end;
   StrConcedidos := '';
   // Para cada beneficio x mês do período fazer
   // 1. Reajustar o SRB ou Benefico
   // 2. Recalcular beneficio
   // 3. Apurar diferenca
   // 4. Pagar diferenca
   // 5. Recalcular contribuicao
   // 6. Apurar diferencia
   // 7. Pagar diferenca
   // CAMILLE - 22.01.2004
   sBeneficiosAux := '';
   qryBenefBfciario.First;
   while not qryBenefBfciario.Eof do
   begin

      if Trim(sBeneficiosAux) = ''
      then sBeneficiosAux := qryBenefBfciario.FieldByname('IDBENEFICIO').AsString
      else sBeneficiosAux := sBeneficiosAux+','+qryBenefBfciario.FieldByname('IDBENEFICIO').AsString;
      qryBenefBfciario.Next;

   end;

   qryBenefBfciario.First;
   bImprimeCabecalhoPessoa := True;
   Result := 1; { Nada encontrado }
   while not qryBenefBfciario.Eof do
   begin

     { Inicio Augusto 09/06/2006 }
     If ( ChBxProcessaEmOutrosLote.Checked = False ) Then Begin

       If JaPossuiRevisaoEmOutroLote Then Begin

         qryBenefBfciario.Next;
         Continue;

       End;

     End;
     { Fim Augusto 09/06/2006    }

     { Augusto 12/06/2006 - Imprimir cabeçalho da pessoa, somente caso seja individual }
     If ( rbnLote.Checked ) And ( bImprimeCabecalhoPessoa = True ) Then Begin
       ImprimeCabecalhoPessoa;

       bImprimeCabecalhoPessoa := False;
     End;

     Result := 0; { Ok }

     { Augusto 10/03/2006 - Guardar o IDMOVBEENF }
     iIdMovBenef := LeUltRegistro(nil, 'MOVBENEF') ;

     { Inicio Augusto 03/02/2006 - Verifica se acerta ou não o INSS, somente caso }
     { INSS e Fundação pagar o INSS.                                              }

     bAcertaINSS     := True;
     bJaSaiuConvenio := False;

     If ( qryBenefBfciario.FieldbyName('FLGREFERENCIA').AsInteger     = 1 ) And
        ( qryBenefBfciario.FieldbyName('PLANOPAGAINSS').AsInteger     = 1 )
     Then Begin

       If JaSaiuConvenio( qryBenefBfciario ) Then bJaSaiuConvenio := True;

       { Caso individual. E nunca tenha sido desconveniado sempre fazer o acerto }
       { fazer acerto de INSS.                                                   }
       If ( bJaSaiuConvenio = False ) Then Begin

         bAcertaINSS := True;

       End Else
       { Caso beneficio esteja retido e o Plano pagar INSS e o beneficio não pagar }
       { INSS, então foi desconveniado, portanto não fazer acerto de INSS.         }
       If ( qryBenefBfciario.FieldByName('IDSITBENEFICIO').AsInteger    = 2 ) And
          ( qryBenefBfciario.FieldbyName('BENEFICIOPAGAINSS').AsInteger = 0 ) And
          ( bJaSaiuConvenio = True )
       Then Begin

         bAcertaINSS := False;

       End Else

       { Caso beneficio esteja ativo e o Plano pagar INSS e o beneficio pagar  }
       { INSS, e o participante já foi desconveniado, Verificar opção da tela  }
       If ( qryBenefBfciario.FieldbyName('BENEFICIOPAGAINSS').AsInteger = 1 ) And
          ( bJaSaiuConvenio = True )
       Then Begin

         bAcertaINSS := (DbCbxPagaINSS.Value = 'S');

       End;

     End; { If ( qryBenefBfciario.FieldbyName('FLGREFERENCIA').AsInteger = 1 ) And }

     { Fim Augusto 03/02/2006 }

     bPrimCont := True;
     { Augusto 28/04/2004 - Recalcular contribuições no caso de mais de um beneficio }
     bCalculouContribuicoes := False;

     // CAMILLE - 28.10.2004
     if not rbtnIndividual.Checked
     then iIdPessoa := qryBenefBfciario.FieldByName('IDPESSOA').AsInteger;


     // CAMILLE - 15.12.2003
     // Os beneficios retidos devem ir com lote = nulo e flgenviado = 9
     if qryBenefBfciario.FieldByName('IDSITBENEFICIO').AsInteger = 2
     then begin
        //iIdLote     := -1; { Augusto 20/01/2005 - Retirado }
        iFlgEnviado :=  9;
     end
     else begin
        iIdLote     := qryLote.FieldByName('IDLOTE').AsInteger;
        iFlgEnviado := 0;
     end;

     { Augusto 03/02/2006 - Caso bAcertaINSS = False (Desconveniado com INSS) }
     { sempre usar FLGENVIADO = 8.                                            }
     If ( bJaSaiuConvenio = True ) And ( bAcertaINSS = False ) Then iFlgEnviado := 8;

     StrConcedidos := StrConcedidos + qryBenefBfciario.FieldByName('IDPESSOA').AsString+',';

     { Augusto 10/02/2006 - Contagem do numero de beneficiários ativos passou }
     { para dentro do loop do periodo, assim se torna temporal.               }
     {
     // Contar total de beneficiarios
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT COUNT(DISTINCT BF.IDPESSOA) AS TOTBENEFICIARIOS '+
                    ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP                                '+
                    ' WHERE  BF.NUMEROPROCESSO = '+qryBenefBfciario.FieldbyName('NUMEROPROCESSO').AsString+
                    ' AND    BF.IDBENEFICIO    = '+qryBenefBfciario.FieldbyName('IDBENEFICIO').AsString+
                    ' AND    TO_CHAR(BF.DATAINICIO,''YYYY/MM'') <= '''+psAnoMesIni+'''         '+
                    ' AND    BP.IDPLANOPREV = BF.IDPLANOPREV                                   '+
                    ' AND    BP.IDBENEFICIO = BF.IDBENEFICIO                                   ');
     if Trim(psAnoMesFim) <> ''
     then begin
        qryAux.SQL.Add('AND  ((TO_CHAR(BF.DATAFINAL,''YYYY/MM'') >= '''+psAnoMesFim+''') OR (BF.DATAFINAL IS NULL) ) ');
     end;
     qryAux.Open;
     if not qryAux.IsEmpty
     then iTotBeneficiarios := qryAux.FieldByName('TOTBENEFICIARIOS').AsInteger
     else iTotBeneficiarios := 0;
     }
     { Fim Augusto 10/02/2006 }


     dValorBeneficioIntegralAposMinimo := 0;
     dValorBeneficioIntegralOriginal   := 0;
     sAnoMesAtual  := psAnoMesIni;

     if BeneficioDePagamentoUnico ( qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger )
     then sAnoMesFim := sAnoMesAtual
     else sAnoMesFim := psAnoMesFim;

     { Inicio Augusto 09/11/2005 - Data final do processo não pode ser maior }
     { que data final do beneficio.                                          }
     If (qryBenefBfciario.FieldByName('DATAFINAL').AsString <> '' ) And { Augusto 13/01/2006 }
        (sAnoMesFim > Copy(qryBenefBfciario.FieldByName('DATAFINAL').AsString,7,4)+'/'+
                      Copy(qryBenefBfciario.FieldByName('DATAFINAL').AsString,4,2)) and
        (qryBenefBfciario.FieldByName('FLGDATAPREVISTA').AsInteger = 0 ) //leofuncef - 31012006
     Then Begin
       sAnoMesFim := Copy(qryBenefBfciario.FieldByName('DATAFINAL').AsString,7,4)+'/'+
                     Copy(qryBenefBfciario.FieldByName('DATAFINAL').AsString,4,2)
     End;
     { Fim Augusto 09/11/2005 }


     { Augusto 14/01/2004 - Posicionar no beneficio que esta sendo processado }
     qryDadosBeneficio.Locate('IDBENEFICIO',qryBenefBfciario.FieldbyName('IDBENEFICIO').AsString, []);

     if (rgrpRecalculaBeneficio.ItemIndex <> 1) and (rgrpRecalculaBeneficio.ItemIndex <> 2)
     then begin
        // Buscar valor no 1o. mes a ser calculado
        dValorEmReal := PegaValorIntegral( qryAux,
                                           qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                           qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                           qryBenefBfciario.FieldByName('IDPESSOA').AsInteger,
                                           '01/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4) );
        dValorBenefRateado := dValorEmReal;

        dValorTotal  := PegaValorTOTAL   ( qryAux,
                                           qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                           qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                           qryBenefBfciario.FieldByName('IDPESSOA').AsInteger,
                                           '01/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4) );

        dValorEmCotas   := qryBenefBfciario.FieldByName('VALORCOTAS').AsFloat;
     end
     else begin
        { Augusto 02/02/2004 - Buscar o beneficio que esta sendo processado }
        //qryDadosBeneficio.Locate('IDBENEFICIO',qryBenefBfciario.FieldbyName('IDBENEFICIO').AsString, []);
        dValorEmReal       := qryDadosBeneficio.FieldByName('VALORATUAL').AsFloat;
        dValorBenefRateado := qryDadosBeneficio.FieldByName('VALORATUAL').AsFloat;
        dValorTotal        := qryDadosBeneficio.FieldByName('VALORTOTAL').AsFloat;
        dValorEmCotas      := qryDadosBeneficio.FieldByName('VALORCOTAS').AsFloat;
     end;
     { Augusto 25/01/2005 - buscar o SRB da qryBenefBfciario em lote e da tela individual }
     If rbtnIndividual.Checked Then Begin
       { Augusto 24/02/2004 - buscava o SRB da qryBenefBfciario e não utilizava o da tela }
       dValorSRBRetorno := qryDadosBeneficio.FieldByName('VALORSRB').AsFloat;
     End Else Begin
       dValorSRBRetorno := qryBenefBfciario.FieldByName('VALORSRB').AsFloat;
     End;


     // CAMILLE - 27.11.2003
     // CONTROLE DO ULTIMO MES DE REAJUSTE POIS NA FUNCEF, O 1o. REAJUSTE TEM QUE ESTAR COM 0000/00
     // CASO CONTRÁRIO A REGRA CALCULA O REAJUSTE ERRADO
     sUltMesReajuste := qryBenefBfciario.FieldByName('ULTMESREAJUSTE').AsString;
     if psAnoMesIni < sUltMesReajuste
     then begin
        if psAnoMesIni <= Copy(qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString,7,4)+'/'+Copy(qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString,4,2)
        then sUltMesReajuste := '0000/00';
        { Augusto - Retirado pois não entendemos e estava prejudicando a rotina }
        //else sUltMesReajuste := SAnoMesAnterior(psAnoMesIni);
     end;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' UPDATE BENEFBFCIARIO  SET DATAULTREVISAO = SYSDATE, VALORBENEFANT = VALORATUAL '+
                    ' WHERE  IDPESSJUR      = '+qryBenefBfciario.FieldByName('IDPESSJUR').AsString   +
                    ' AND    IDPESSOA       = '+qryBenefBfciario.FieldByName('IDPESSOA').AsString    +
                    ' AND    IDPLANOPREV    = '+qryBenefBfciario.FieldByName('IDPLANOPREV').AsString   +
                    ' AND    SEQPROPOSTA    = 1 '+
                    ' AND    IDBENEFICIO    = '+qryBenefBfciario.FieldByName('IDBENEFICIO').AsString   );
     qryAux.ExecSQL;

     { Inicio Augusto 14/01/2005 - Caso não recalcula o SRB }
     bCalculaTudo := False;
     If rgrpRecalculaBeneficio.ItemIndex <> 4 Then
       bCalculaTudo := True; { Augusto 20/02/2004 }
     { Fim Augusto 14/01/2005 }

     {-------------------------------------------------------------------------}
     sAnoMesAnt       := sAnoMesAtual; { Augusto 23/06/2004 }
     sAnoMesAtualReal := sAnoMesAtual;
     while ( sAnoMesAtual <= sAnoMesFim )
           or ( (Copy(sAnoMesFim,6,2) <= '12') and (copy(sAnoMesAtual,6,2) = '13') ) do //leocm - 14022006 { Augusto 19/01/2007 de < para <= }
     begin

         { Augusto 10/02/2006 - Contagem do numero de beneficiários ativos passou }
         { para dentro do loop do periodo, assim se torna temporal.               }
         iTotBeneficiarios := CtrlBenefBfciario.BuscaQtdBeneficiariosAtivos( qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                                                             qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                                                             sAnoMesAtual, sAnoMesFim );
         { Fim Augusto 10/02/2006                                                 }

         //leofuncef - 26012005
         if (StrToInt(Copy(qryBenefBfciario.FieldByName('DATAINICIO').AsString,1,2)) >= 29) and
            (StrToInt(Copy(sAnoMesAtual,6,2)) = 2)
         then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/'+ copy(sAnoMesAtual,1,4)
         else sDataRef := copy(qryBenefBfciario.FieldByName('DATAINICIO').AsString,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);

         If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0) Then Begin
            sDataRef := '30'+Copy(sDataRef,3,9)
         End;
         //leofuncef - 16012005 - fim


         dIndice        := 1;

         {---------------------------------------------------------------------}
         { Inicio Augusto 14/01/2005                                           }

         { Retirado para dar lugar ao novo tratamento de alteradores           }

         if Trim(dblkpcmbIndiceReaj.Text) <> ''
         then begin
            dIndice := VoltaValorCotacao(qryAux,
                                         qryIndiceReaj.FieldByName('MOECODIGO').AsString,
                                         '-1', '-1', '01/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4) );
            if dIndice <= 0 then dIndice := 1;
         end;

         { Inicio Augusto 12/05/2004 }
         if Trim(dblkpcmbRegraParcela.Text) <> '' then begin
           sDataRefInd  := '01/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4);
           sSQLRegraCorrecao := 'SELECT '+OraNumero(FloatToStr(dIndice))+ ' AS INDICE, '+
                                          QuotedStr(sDataRefInd)        + ' AS DATAREF, '+
                                          QuotedStr('0')                + ' AS FLGMIGRACAO, '+
                                          QuotedStr(sAnoMesAnt)         + ' AS ANOMESREFANT, '+ { Augusto 23/06/2004 }
                                          QuotedStr(sAnoMesAtual)       + ' AS ANOMESREF, '+
                                          QuotedStr(sAnoMesInicioAcerto)+ ' AS ANOMESACERTOINI, '+
                                          IntToStr (Sistema.IdModulo)   + ' AS IDMODULO, '+     { Augusto 08/01/2005 }
                                          QuotedStr(sAnoMesFimAcerto)   + ' AS ANOMESACERTOFIM  '+
                                'FROM DUAL ';

            sIndiceCorrecao := RegraNumerica(dblkpcmbRegraParcela.LookupValue,
                                             sSQLRegraCorrecao, bErro, iIdCalculo);
            dIndice := StrToFloat(ClienteNumero(sIndiceCorrecao));
            if dIndice <= 0 then dIndice := 1;
         end;

         { Fim Augusto 14/01/2005                                              }
         {---------------------------------------------------------------------}

         dValorEmReal := dValorBenefRateado;

         // CAMILLE - 16.12.2003 - PERMITIR CALCULAR APENAS O SRB
         if rgrpRecalculaBeneficio.ItemIndex = 3 // CALCULAR APENAS O SRB
         then begin
            if qryBenefBfciario.FieldByName('FLGREFERENCIA').AsInteger = 1
            then begin
              sAnoMesAnt   := sAnoMesAtual; { Augusto 23/06/2004 }
              sAnoMesAtual := CalculaProximoMes(sAnoMesAtual,'',
                //P.RAMOS-06/04/2006-PEND.22029-PARÂMETROS NOVOS PARA VERIFICAR SE DEVE PROCESSAR ABONO
                sAnoMesLote,
                qryBenefBfciario.FieldByName('MESPGABONO').AsString
                //P.RAMOS-06/04/2006-PEND.22029-FIM
              );
              continue;
            end;

            // Verifica se existe reajuste da patrocinadora, existindo recalcula o
            //  enquadramento.
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' SELECT IDRGREAJ, PERCENTUAL FROM  REAJSALPATRO         '+
                           ' WHERE  MESREAJ     = '+QuotedStr(sAnoMesAtual)  +' AND '+
                           '        IDPESSJUR   = '+qryBenefBfciario.FieldByName('IDPESSJUR').AsString  +' AND '+
                           '        IDPLANOPREV = '+qryBenefBfciario.FieldByName('IDPLANOPREV').AsString);
            qryAux.Open;
            if qryAux.IsEmpty
            then begin
              qryDemonstrativo.Insert;
              qryDemonstrativo.FieldbyName('ANOMES').AsString            := sAnoMesAtual;
              qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat          := 0;
              qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat := 0;
              qryDemonstrativo.FieldbyName('INDICE').AsFloat             := dIndice;
              qryDemonstrativo.FieldbyName('VALORANTES').AsFloat         := 0;
              qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat        := 0;
              qryDemonstrativo.FieldbyName('SRBANTES').AsFloat           := qryBenefBfciario.FieldByName('VALORSRB').AsFloat;
              qryDemonstrativo.FieldbyName('SRBDEPOIS').AsFloat          := qryBenefBfciario.FieldByName('VALORSRB').AsFloat;
              qryDemonstrativo.FieldbyName('RESERVADEPOIS').AsFloat      := dValorReserva;
              qryDemonstrativo.FieldbyName('SALVIRTUALANTES').AsFloat    := 0;
              qryDemonstrativo.FieldbyName('SALVIRTUALDEPOIS').AsFloat   := 0;

              { Inicio Augusto 17/01/2005 }
              qryDemonstrativo.FieldbyName('IDTITULAR').AsString         := qryBenefBfciario.FieldByName('IDTITULAR').AsString;
              qryDemonstrativo.FieldbyName('IDPLANOPREV').AsString       := qryBenefBfciario.FieldByName('IDPLANOPREV').AsString;
              qryDemonstrativo.FieldbyName('IDPESSOA').AsString          := qryBenefBfciario.FieldByName('IDPESSOA').AsString;
              qryDemonstrativo.FieldbyName('IDENTIFICADOR').AsString     := qryBenefBfciario.FieldByName('IDBENEFICIO').AsString;
              { Fim Augusto 17/01/2005 }

              qryDemonstrativo.FieldbyName('DESCRICAO').AsString         := Copy(qryBenefBfciario.FieldByName('NOME').AsString,1,30);
              qryDemonstrativo.FieldbyName('TIPO').AsString              := 'B'; // beneficio de suplementacao

              { Augusto 02/02/2004 }
              qryDemonstrativo.FieldbyName('NOMEBENEF').AsString          := qryBenefBfciario.FieldByName('NOMEBENEF').AsString;

              qryDemonstrativo.Post;
              sAnoMesAnt   := sAnoMesAtual; { Augusto 23/06/2004 }
              sAnoMesAtual := CalculaProximoMes(sAnoMesAtual,'',
                //P.RAMOS-06/04/2006-PEND.22029-PARÂMETROS NOVOS PARA VERIFICAR SE DEVE PROCESSAR ABONO
                sAnoMesLote,
                qryBenefBfciario.FieldByName('MESPGABONO').AsString
                //P.RAMOS-06/04/2006-PEND.22029-FIM
              );
              continue;
            end;



            BuscaDadosBeneficioAnterior ( qryAux,
                                          qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                          qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                          qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                          qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                          0,
                                          qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString,
                                          sDataInicioAnt,
                                          sValorAnt,
                                          sNomeBenefAnt,
                                          sIdTpPagtoAnt,
                                          sUltMesReajAnt,
                                          sFlgBenefMinAnt,
                                          sDataEventoAnt,
                                          sCodBeneficioAnt,
                                          sValorBase1Ant,
                                          sValorBase2Ant,
                                          sValorBase3Ant,
                                          sNumProcINSS,
                                          True);

            sSQLBenefAssoc   := MontaSQLBenefAssoc(qryAux, qryBenefBfciario.FieldByName('NUMORDEMEVENTO').AsInteger);
            sDataRefSRB      := '01/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4);
            dValorSRBRetorno := ExecutaRegraCalculoSRB( qryAux,
                                                        qryBenefBfciario.FieldByName('IDREGRASRB').AsInteger,
                                                        qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                        qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                        qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                                        1,
                                                        qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                                        qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                                        qryBenefBfciario.FieldByName('IDSITFUNC').AsInteger,
                                                        qryBenefBfciario.FieldByName('IDSITPART').AsInteger,
                                                        qryBenefBfciario.FieldByName('IDSITPLANOPREV').AsInteger,
                                                        qryBenefBfciario.FieldByName('VALORBASE1').AsFloat,
                                                        qryBenefBfciario.FieldByName('VALORBASE2').AsFloat,
                                                        qryBenefBfciario.FieldByName('VALORBASE3').AsFloat,
                                                        sSQLBenefAssoc,
                                                        sDataRefSRB,
                                                        qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString,
                                                        qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString,
                                                        qryBenefBfciario.FieldByName('DATAINICIO').AsString,
                                                        qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString,
                                                        '', //sValorInfINSS,
                                                        '', //reValorCalcINSS.Text,
                                                        '0',
                                                        False,
                                                        0,
                                                        sDataInicioAnt,
                                                        sValorAnt,
                                                        sValorBase1Ant,
                                                        sValorBase2Ant,
                                                        sValorBase3Ant,
                                                        bErro,
                                                        sMsgErro,
                                                        iIdCalculo,
                                                        0);

            qryDemonstrativo.Insert;
            qryDemonstrativo.FieldbyName('ANOMES').AsString            := sAnoMesAtual;
            qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat          := 0;
            qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat := 0;
            qryDemonstrativo.FieldbyName('INDICE').AsFloat             := dIndice;
            qryDemonstrativo.FieldbyName('VALORANTES').AsFloat         := 0;
            qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat        := 0;
            qryDemonstrativo.FieldbyName('SRBANTES').AsFloat           := qryBenefBfciario.FieldByName('VALORSRB').AsFloat;
            qryDemonstrativo.FieldbyName('SRBDEPOIS').AsFloat          := dValorSRBRetorno;
            qryDemonstrativo.FieldbyName('RESERVADEPOIS').AsFloat      := dValorReserva;
            qryDemonstrativo.FieldbyName('SALVIRTUALANTES').AsFloat    := 0;
            qryDemonstrativo.FieldbyName('SALVIRTUALDEPOIS').AsFloat   := 0;
            { Inicio Augusto 17/01/2005 }
            qryDemonstrativo.FieldbyName('IDTITULAR').AsString         := qryBenefBfciario.FieldByName('IDTITULAR').AsString;
            qryDemonstrativo.FieldbyName('IDPLANOPREV').AsString       := qryBenefBfciario.FieldByName('IDPLANOPREV').AsString;
            qryDemonstrativo.FieldbyName('IDPESSOA').AsString          := qryBenefBfciario.FieldByName('IDPESSOA').AsString;
            qryDemonstrativo.FieldbyName('IDENTIFICADOR').AsString     := qryBenefBfciario.FieldByName('IDBENEFICIO').AsString;
            { Fim Augusto 17/01/2005 }
            qryDemonstrativo.FieldbyName('DESCRICAO').AsString         := Copy(qryBenefBfciario.FieldByName('NOME').AsString,1,30);
            qryDemonstrativo.FieldbyName('TIPO').AsString              := 'B'; // beneficio de suplementacao
            { Augusto 02/02/2004 }
            qryDemonstrativo.FieldbyName('NOMEBENEF').AsString          := qryBenefBfciario.FieldByName('NOMEBENEF').AsString;
            qryDemonstrativo.Post;

            sAnoMesAnt   := sAnoMesAtual; { Augusto 23/06/2004 }
            sAnoMesAtual := CalculaProximoMes(sAnoMesAtual,'',
              //P.RAMOS-06/04/2006-PEND.22029-PARÂMETROS NOVOS PARA VERIFICAR SE DEVE PROCESSAR ABONO
              sAnoMesLote,
              qryBenefBfciario.FieldByName('MESPGABONO').AsString
              //P.RAMOS-06/04/2006-PEND.22029-FIM
            );
            continue;
         end;



         // ************************************************************************
         // VERIFICAR SE O BENEFICIO É TEMPORARIO. SE FOR, REAJUSTAR SALARIO VIRTUAL
         // ************************************************************************
         if (qryBenefBfciario.FieldByName('FLGBENEFTEMP').AsInteger    = 1) and
            (qryBenefBfciario.FieldByName('FLGSALVIRTBENEF').AsInteger = 1) and
            (not bRefazendoRetroativo)
         then begin
            if bRefazendoRetroativo
            then begin
               // Desfazer Reajuste do Salario Virtual
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(' UPDATE PARTPREVPLAN SET SALAUXDOENCA = ULTSALAUXREAJ, MESULTREAJSAL = NULL '+
                              ' WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                              ' AND    IDPLANOPREV  = '+qryPessoasATratar.FieldByName('IDPLANOPREV').AsString+
                              ' AND    IDPESSOA     = '+qryPessoasATratar.FieldByName('IDPESSOA').AsString+
                              ' AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                              ' AND    MESULTREAJSAL >= '''+sAnoMesAtual+'''');
               try
                  qryAux.ExecSQL;
               except
                  Exit;
               end;

               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(' UPDATE HISTRUBSAL SET VALORPROVENTO    = VLRANTRETROATIVO, '+
                              '                       VALORINTEGRAL    = VLRANTRETROATIVO  '+
                              ' WHERE  IDPESSOA       = '+qryBenefBfciario.FieldByName('IDPESSOA').AsString    +
                              ' AND    IDPATRO        = '+qryBenefBfciario.FieldByName('IDPESSJUR').AsString   +
                              ' AND    IDRUBRICA      = ( SELECT IDRUBSALAUXDOENCA FROM PATRO WHERE IDPESSOA = '+qryBenefBfciario.FieldByName('IDPESSJUR').AsString+') '+
                              ' AND    MES            = '''+sAnoMesAtual +'''');
               qryAux.ExecSQL;
            end;


            // BUSCAR SALARIO VIRTUAL NO MES
            sSalarioVirtualNoMesAntesReajuste := CalcSalVIRTUAL( qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                                 qryBenefBfciario.FieldByName('IDPESSOA').AsInteger,
                                                                 sAnoMesAtual,
                                                                 qryAux );

            sSalarioVirtualNoMes              := sSalarioVirtualNoMesAntesReajuste;

            { Inicio Augusto 07/11/2005 - Sempre reajustar o salário virtual em }
            { beneficios temporarios.                                           }

            //if prmCalculaSRBNoRetroativo then begin
            if not ReajustaSalPatro( qryAux,
                                  sAnoMesAtual,
                                  qryBenefBfciario.FieldByName('IDPESSJUR').AsString,
                                  qryBenefBfciario.FieldByName('IDPLANOPREV').AsString,
                                  qryBenefBfciario.FieldByName('IDPESSOA').AsString,
                                  '01/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4),
                                  qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString,
                                  sSalarioVirtualNoMes,
                                  'AS')
            then Exit;
            //end;

            { Fim Augusto 11/07/2005  }
            if StrToFloat(ClienteNumero(sSalarioVirtualNoMes)) -
               StrToFloat(ClienteNumero(sSalarioVirtualNoMesAntesReajuste)) > 0.01
            then begin
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(' UPDATE HISTRUBSAL SET VLRANTRETROATIVO = VALORPROVENTO, '+
                              '                       VALORINTEGRAL    = '+OraNumero(sSalarioVirtualNoMes)+','+
                              '                       VALORPROVENTO    = '+OraNumero(sSalarioVirtualNoMes)+
                              ' WHERE  IDPESSOA       = '+qryBenefBfciario.FieldByName('IDPESSOA').AsString    +
                              ' AND    IDPATRO        = '+qryBenefBfciario.FieldByName('IDPESSJUR').AsString   +
                              ' AND    IDRUBRICA      = ( SELECT IDRUBSALAUXDOENCA FROM PATRO WHERE IDPESSOA = '+qryBenefBfciario.FieldByName('IDPESSJUR').AsString+') '+
                              ' AND    MES           >= '''+sAnoMesAtual +''''); { Augusto 12/07/2007 0 - Incluido o >= para atualizar todos os valores futuros com o novo salário }
               qryAux.ExecSQL;

               if qryAux.RowsAffected <= 0
               then begin
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add(' INSERT INTO HISTRUBSAL (                                             '+
                                 ' CODPROVDESC, FLGCOMPOEREMTOTAL, FLGCOMPOESALBENEF, FLGCOMPOESALPART, '+
                                 ' FLGIRRF, FLGPREVIA, FLGSRB, IDMOTIVO, IDPATRO, IDPESSJUR, IDPESSOA,  '+
                                 ' IDRUBRICA, MES, MESCOBRANCA, REFERENCIA, SEQRUBRICA, VALORPROVENTO,  '+
                                 ' IDMODULO, VALORINTEGRAL, FLGCONCESSAO)                               '+
                                 ' SELECT RP.CODPROVDESC, P.FLGCOMPOEREMTOTAL, P.FLGCOMPOESALBENEF, P.FLGCOMPOESALPART, '+
                                 ' P.FLGIRRF, 0 AS FLGPREVIA, 4 AS FLGSRB, '+qryMotivo.FieldByName('IDMOTIVO').AsString+' AS IDMOTIVO, PT.IDPESSOA, PT.IDPESSOA, '+qryBenefBfciario.FieldByName('IDPESSOA').AsString+','+
                                 ' PT.IDRUBSALAUXDOENCA, '''+sAnoMesAtual+''','''+sAnoMesLote+''',''***'',1,'+OraNumero(sSalarioVirtualNoMes)+','+
                                 IntToStr(Sistema.IdModulo)+','+OraNumero(sSalarioVirtualNoMes)+',1                                             '+
                                 ' FROM PATRO PT, RUBRICAXPESS RP, PROVDESC P '+
                                 ' WHERE PT.IDPESSOA     = '+qryBenefBfciario.FieldByName('IDPESSJUR').AsString+
                                 ' AND   RP.IDPESSOA(+)  = PT.IDPESSOA '+
                                 ' AND   RP.IDRUBRICA(+) = PT.IDRUBSALAUXDOENCA '+
                                 ' AND   P.IDPROVENTO    = PT.IDRUBSALAUXDOENCA ');
                  try
                     qryAux.ExecSQL;
                  except
                     Exit;
                  end;
               end;

               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(' UPDATE PARTPREVPLAN SET ULTSALAUXREAJ = SALAUXDOENCA, SALAUXDOENCA = '+OraNumero(sSalarioVirtualNoMes)+
                              ' WHERE  IDPESSJUR      = '+qryBenefBfciario.FieldByName('IDPESSJUR').AsString   +
                              ' AND    IDPESSOA       = '+qryBenefBfciario.FieldByName('IDPESSOA').AsString    +
                              ' AND    IDPLANOPREV    = '+qryBenefBfciario.FieldByName('IDPLANOPREV').AsString   +
                              ' AND    SEQPROPOSTA    = 1 ');
               qryAux.ExecSQL;

            end;
         end;

         // ********************************************************************
         // VERIFICAR O VALOR REALMENTE DEVIDO NO MÊS ATUAL
         // ********************************************************************
         // Se a DATA DE INICIO DE PAGAMENTO foi alterada, pode acontecer de ter que
         // pedir de volta o beneficio do mês inteiro


         //leofuncef - 23112004 - testa se o retroativo é de INSS migrado
         //caso seja e a data do retroativo seja menor que a DIP bo benefício no plano novo,
         //o sistema não deve sair na crítica de DIP, pois neste caso a DIP foi modificada pela migração
         //e o cálculo deve ser feito mesmo antes disso
         if (Copy(qryBenefBfciario.FieldByName('DATAINICIO').AsString,7,4)+'/'+Copy(qryBenefBfciario.FieldByName('DATAINICIO').AsString,4,2)
             > sAnoMesAtual) then
         begin
            qryaux.close;
            qryaux.sql.text := ' SELECT DISTINCT BF.IDPLANOPREV'+
                               ' FROM BENEFBFCIARIO BF, BENEFPLANPREV B '+
                               ' WHERE BF.IDPESSOA = '+qryBenefBfciario.FieldByName('IDPESSOA').AsString+' '+
                               ' AND BF.IDBENEFICIO = '+qryBenefBfciario.FieldByName('IDBENEFICIO').AsString+' '+
                               ' AND B.IDBENEFICIO = BF.IDBENEFICIO '+
                               ' AND B.IDPLANOPREV = BF.IDPLANOPREV '+
                               ' AND B.FLGREFERENCIA = 1 ';
            qryaux.open;

            bInssMigrado := false;

            if not qryaux.isempty then bInssMigrado := (qryaux.recordcount >= 2);

         { Augusto 23/02/2006 - Caso esteja na DIP do novo beneficio, usar apenas ele }
         end else begin
            bInssMigrado := False;

         end;
         //leofuncef - 23112004


         if ((Copy(qryBenefBfciario.FieldByName('DATAINICIO').AsString,7,4)+'/'+Copy(qryBenefBfciario.FieldByName('DATAINICIO').AsString,4,2) > sAnoMesAtual)
            and (not bInssMigrado)) //leofuncef - 23112004
         then begin
           // Augusto 09/12/2003 - Caso DIP > AnoMes processo, não calcular
           dValorDevido := 0;
           sAnoMesAnt   := sAnoMesAtual; { Augusto 23/06/2004 }
           // Augusto 09/12/2003
           sAnoMesAtual := CalculaProximoMes(sAnoMesAtual,'',
             //P.RAMOS-06/04/2006-PEND.22029-PARÂMETROS NOVOS PARA VERIFICAR SE DEVE PROCESSAR ABONO
             sAnoMesLote,
             qryBenefBfciario.FieldByName('MESPGABONO').AsString
             //P.RAMOS-06/04/2006-PEND.22029-FIM
           );
           Continue;
         end else begin
            if (rgrpRecalculaBeneficio.ItemIndex <> 1) and (rgrpRecalculaBeneficio.ItemIndex <> 2)
            then begin
               // Augusto 10/11/2003
               //if dValorBeneficioIntegralAposMinimo <= 0 then dValorBeneficioIntegralAposMinimo := qryBenefBfciario.FieldByName('VALORTOTAL').AsFloat;
               if dValorBeneficioIntegralAposMinimo <= 0 then dValorBeneficioIntegralAposMinimo := qryBenefBfciario.FieldByName('VALORATUAL').AsFloat;
               if dValorBeneficioIntegralOriginal   <= 0 then dValorBeneficioIntegralOriginal   := qryBenefBfciario.FieldByName('VALORATUAL').AsFloat;
            end
            else begin
               if dValorBeneficioIntegralAposMinimo <= 0 then dValorBeneficioIntegralAposMinimo := dValorEmReal;
               if dValorBeneficioIntegralOriginal   <= 0 then dValorBeneficioIntegralAposMinimo := dValorEmReal;
            end;

            if Copy(sAnoMesAtual,6,2) <> '13'
            then begin
               if ( (rgrpRecalculaBeneficio.ItemIndex = 0) or
                    (rgrpRecalculaBeneficio.ItemIndex = 4) ) and
                  ( sAnoMesAtual = Copy(qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString,7,4)+'/'+Copy(qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString,4,2))
               then begin
                  // Verificar se o beneficio é para pagar integral no último mês de data prevista
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add(' SELECT BP.IDREGRACALCULO, BP.FLGPAGAINTEG, BP.IDREGRAPAGAMENTO '+
                                 ' FROM   BENEFPLANPREV BP                              '+
                                 ' WHERE  BP.IDPLANOPREV   = '+qryBenefBfciario.FieldByName('IDPLANOPREV').AsString+
                                 ' AND    BP.IDBENEFICIO   = '+qryBenefBfciario.FieldByName('IDBENEFICIO').AsString );

                  qryAux.Open;
                  if not (qryAux.IsEmpty)
                  then begin
                     iIdRegraCalculo     := qryAux.FieldByName('IDREGRACALCULO').AsInteger;
                     iIdRegraCalcReserva := qryAux.FieldByName('IDREGRAPAGAMENTO').AsInteger;
                  end
                  else begin
                     iIdRegraCalculo     := -1;
                     iIdRegraCalcReserva := -1;
                  end;

                  dValorReserva:= CalculaReservaParaBeneficio( iIdRegraCalcReserva,
                                                               dValorReservaCota,
                                                               sAnoMesLote );

                  if qryBenefBfciario.FieldByName('IDTITULAR').AsInteger = qryBenefBfciario.FieldByName('IDPESSOA').AsInteger
                  then begin
                     { Inicio Augusto 04/02/2004 - Buscar o valor do INSS no historico }
                     sFlgBenefMinimo := '0';
                     sVlrInfINSS := CalcBeneficioINSSAtual(qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                           qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                           qryBenefBfciario.FieldByName('IDTITULAR').AsInteger, { Augusto 05/12/2006 }
                                                           qryBenefBfciario.FieldByName('IDPESSOA').AsInteger,
                                                           sAnoMesAtual,sAnoMesAtual,
                                                           sIdTpPagtoAnt,
                                                           sFlgBenefMinimo,
                                                           QryAux,
                                                           qryBenefBfciario.FieldbyName('NUMEROPROCESSO').AsInteger);
                     sVlrCalcInss := CalcBeneficioINSSAtual( qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                           qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                           qryBenefBfciario.FieldByName('IDTITULAR').AsInteger, { Augusto 05/12/2006 }
                                                           qryBenefBfciario.FieldByName('IDPESSOA').AsInteger,
                                                           sAnoMesAtual,sAnoMesAtual,
                                                           sIdTpPagtoAnt,
                                                           sFlgBenefMinimo,
                                                           QryAux,
                                                           qryBenefBfciario.FieldbyName('NUMEROPROCESSO').AsInteger,
                                                           'C');
                     If sVlrInfINSS = '0' Then
                       sVlrInfINSS := qryBenefBfciario.FieldByName('VLRINFINSS').AsString;
                     If sVlrCalcInss = '0' Then
                       sVlrCalcInss := qryBenefBfciario.FieldByName('VLRCALCINSS').AsString;
                     { Fim Augusto 04/02/2004 }

                     { Inicio Augusto 25/06/2004 }

                     { Augusto 25/10/2007 - Passar para rotina que busca dados do beneficio o tipo de }
                     { pagamento para tratamento de revisão de resgates.                              }
                     sIdTpPagtoAnt := qryBenefBfciario.FieldByName('IDTPPAGTOBENEFIC').AsString;

                     BuscaDadosBeneficioAnterior (qryAux,
                                                  qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                  qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                  qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                                  qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                                  0,
                                                  qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString,
                                                  sDataInicioAnt,
                                                  sValorAnt,
                                                  sNomeBenefAnt,
                                                  sIdTpPagtoAnt,
                                                  sUltMesReajAnt,
                                                  sFlgBenefMinAnt,
                                                  sDataEventoAnt,
                                                  sCodBeneficioAnt,
                                                  sValorBase1Ant,
                                                  sValorBase2Ant,
                                                  sValorBase3Ant,
                                                  sNumProcINSS,
                                                  True,
                                                  -1,
                                                  6       { Origem 6, Revisão de Benenficio }
                                                  );
                     { Fim Augusto 25/06/2004 }

                     dValorEmReal := ExecutaRegraCalculoBeneficio( qryAux,
                                                                  iIdRegraCalculo,
                                                                  iIdRegraCalcReserva,
                                                                  qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                                  qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                                  qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                                                  qryBenefBfciario.FieldByName('SEQPROPOSTA').AsInteger,
                                                                  qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                                                  qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                                                  qryBenefBfciario.FieldByName('VALORBASE1').AsFloat,
                                                                  qryBenefBfciario.FieldByName('VALORBASE2').AsFloat,
                                                                  qryBenefBfciario.FieldByName('VALORBASE3').AsFloat,
                                                                  '',
                                                                  qryBenefBfciario.FieldByName('DTEVENTO').AsString,
                                                                  qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString,
                                                                  qryBenefBfciario.FieldByName('DATAINICIOINSS').AsString,
                                                                  qryBenefBfciario.FieldByName('DATAINICIO').AsString,
                                                                  qryBenefBfciario.FieldByName('DATAREQUERIMENTO').AsString,
                                                                  { Augusto 04/02/2004 }
                                                                  sVlrInfINSS, sVlrCalcInss,
                                                                  //qryBenefBfciario.FieldByName('VLRINFINSS').AsString,
                                                                  //qryBenefBfciario.FieldByName('VLRCALCINSS').AsString,
                                                                  {-}
                                                                  FloatToStr(dValorReserva), // VALORRESERVA
                                                                  False,
                                                                  0,
                                                                  { Inicio Augusto 25/06/2004 }
                                                                  sDataInicioAnt, //'',
                                                                  sValorAnt,      //'0',
                                                                  sValorBase1Ant, //'0',
                                                                  sValorBase2Ant, //'0',
                                                                  sValorBase3Ant, //'0',
                                                                  { Fim Augusto 25/06/2004 }
                                                                  bErro,
                                                                  sMsgErro,
                                                                  iIdCalculo,
                                                                  0,
                                                                  qryBenefBfciario.FieldByName('VALORSRB').AsFloat,
                                                                  qryBenefBfciario.FieldByName('IDSITPART').AsString,
                                                                  qryBenefBfciario.FieldByName('IDSITPLANOPREV').AsString,
                                                                  qryBenefBfciario.FieldByName('IDSITFUNC').AsString,
                                                                  qryBenefBfciario.FieldByName('IDSITPART').AsString,
                                                                  qryBenefBfciario.FieldByName('IDSITPLANOPREV').AsString,
                                                                  qryBenefBfciario.FieldByName('IDSITFUNC').AsString,
                                                                  '',
                                                                  qryBenefBfciario.FieldByName('FLGPROVISORIO').AsInteger,   // CAMILLE - 19.04.2004
                                                                  qryBenefBfciario.FieldByName('PRAZOPROVISORIO').AsInteger, // CAMILLE - 19.04.2004
                                                                  qryBenefBfciario.FieldByName('PERCPROVISORIO').AsFloat,     // CAMILLE - 19.04.2004
                                                                  6       { Origem 6, Revisão de Benenficio }
                                                                );
                     if iIdTitular = iIdPessoa then dValorTotal := dValorEmReal;
                  end;
               end;

               if (rgrpRecalculaBeneficio.ItemIndex = 1) or
                  (rgrpRecalculaBeneficio.ItemIndex = 2) or
                  (rgrpRecalculaBeneficio.ItemIndex = 3)
               then begin
                  dValorDevido     := dValorEmReal;
                  if rgrpRecalculaBeneficio.ItemIndex = 1
                  then begin
                     bReajustou       := False;
                     bErro            := False;

                     sValorReajustado := ReajustaBenefConc( qryAux,
                                                            sAnoMesAtual,
                                                            qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString,
                                                            iIdPessJur,
                                                            iIdPlanoPrev,
                                                            iIdTitular,
                                                            iIdPessoa,
                                                            qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                                            qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                                            iTotBeneficiarios,
                                                            dValorTotal, // dValorEmReal, { Augusto 21/05/2004 }
                                                            qryBenefBfciario.FieldByName('VALORBASE1').AsFloat,
                                                            qryBenefBfciario.FieldByName('VALORBASE2').AsFloat,
                                                            qryBenefBfciario.FieldByName('VALORBASE3').AsFloat,
                                                            bReajustou,
                                                            bErro,
                                                            (qryBenefBfciario.FieldByName('FLGREFERENCIA').AsInteger = 1),
                                                            sMsgErro,
                                                            dValorTotal,
                                                            dValorSRBRetorno,
                                                            iIdCalculo,
                                                            True,
                                                            6,             { Origem 6, Revisão de Benenficio }
                                                            sUltMesReajuste,
                                                            False,
                                                            False,
                                                            '',
                                                            iTipoMov); { Augusto 03/03/2006 }


                     { Inicio Augusto 21/05/2004 - Ratear caso necessário }
                     if iIdTitular <> iIdPessoa then Begin
                       dValorDevido  := ExecutaRegraCalculoBeneficioBfciario( qryAux,
                                              qryBenefBfciario.FieldByName('IDREGRACALCULO').AsInteger,
                                              -1,
                                              iIdPessJur, iIdPlanoPrev, iIdTitular,
                                              1,
                                              iIdBeneficio,       iNumeroProcesso,
                                              iTotBeneficiarios,
                                              qryBenefBfciario.FieldByName('VALORBASE1').AsFloat,
                                              qryBenefBfciario.FieldByName('VALORBASE2').AsFloat,
                                              qryBenefBfciario.FieldByName('VALORBASE3').AsFloat,
                                              '',

                                              //leofuncef - 26012005
                                              //qryBenefBfciario.FieldByName('DTEVENTO').AsString,
                                              sDataRef,

                                              qryBenefBfciario.FieldByName('DATAINICIO').AsString,
                                              qryBenefBfciario.FieldByName('DATAINICIOINSS').AsString,
                                              OraNumero(sValorReajustado),
                                              sVlrInfINSS, sVlrInfINSS,
                                              '0', bErro, sMsgErro,
                                              iIdCalculo, iIdPessoa,
                                              qryBenefBfciario.FieldByName('IDDEPENDENCIA').AsString,
                                              qryBenefBfciario.FieldByName('PERCENTUAL').AsString,
                                              0,
                                              qryBenefBfciario.FieldByName('DIBBENEFANT').AsString,
                                              qryBenefBfciario.FieldByName('VALORBENEFANT').AsString,
                                              sAnoMesAtual,
                                              iIdPessoa,
                                              qryBenefBfciario.FieldByName('FLGPROVISORIO').AsInteger,
                                              qryBenefBfciario.FieldByName('PRAZOPROVISORIO').AsInteger,
                                              qryBenefBfciario.FieldByName('PERCPROVISORIO').AsFloat,
                                              0,
                                              qryBenefBfciario.FieldByName('DATAREQUERIMENTO').AsString,
                                              6       { Origem 6, Revisão de Benenficio }
                                              );
                       sValorReajustado := FloatToStr(dValorDevido);
                     End;
                     { Fim Augusto 21/05/2004 }

                     if bReajustou
                     then begin
                        dValorDevido    := StrToFloat(ClienteNumero(sValorReajustado));
                        dValorEmReal    := dValorDevido;
                        { Augusto 31/03/2004 - Não persistiam as alterações no dValorReal }
                        dValorBenefRateado := dValorDevido;

                        sUltMesReajuste := sAnoMesAtual;
//                        if iIdTitular   = iIdPessoa then dValorTotal := dValorEmReal;
                     end;
                  end;
                  { Inicio Augusto 31/03/2004 - Executar regra de 1º pgto. }
                  sAnoMesInicio := Copy(qryBenefBfciario.FieldByName('DATAINICIO').AsString,7,4) + '/' +
                                 Copy(qryBenefBfciario.FieldByName('DATAINICIO').AsString,4,2);
                  if (sAnoMesAtual = sAnoMesInicio) and
                     (not BeneficioDePagamentoUnico ( qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger ) ) // CAMILLE - 01.09.2004
                  then begin
                     dValorDevido := ExecutaRegraPrimUltPagtoBenef(
                                       qryAux,
                                       qryBenefBfciario.FieldByName('IDREGRAPRIMPAGTO').AsInteger,
                                       qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                       qryBenefBfciario.FieldByName('IDPESSOA').AsInteger,
                                       qryBenefBfciario.FieldByName('SEQPROPOSTA').AsInteger,
                                       qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                       qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                       qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                       iTotBeneficiarios,
                                       qryBenefBfciario.FieldByName('DATAINICIO').AsString,
                                       qryBenefBfciario.FieldByName('DATAFINAL').AsString,
                                       OraNumero(FloatToStr(dValorEmReal)),
                                       ' Primeiro ', bErro, sMsgErro, iIdCalculo );
                     if bErro then Exit;
                     dValorEmReal    := dValorDevido;
                  end;
                  { Fim Augusto 31/03/2004 }


               end
               else begin
                  //{ Augusto 20/02/2004 }
                  // If (bCalculaTudo = False) And (rgrpRecalculaBeneficio.ItemIndex = 0)
                  //   And (sAnoMesAtual = sAnoMes)
                  //Then
                  dValorDevido    := CalculaBeneficioAPagarNoMes( qryAux ,
                                                                  sAnoMesAtual,
                                                                  qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                                                  qryBenefBfciario.FieldByName('IDPESSOA').AsInteger,
                                                                  qryBenefBfciario.FieldByName('SEQPROPOSTA').AsInteger,
                                                                  qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                                  qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                                  qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                                                  qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                                                  iTotBeneficiarios,
                                                                  qryBenefBfciario.FieldByName('IDREGRAPRIMPAGTO').AsInteger,
                                                                  qryBenefBfciario.FieldByName('IDREGRAULTPAGTO').AsInteger,
                                                                  qryBenefBfciario.FieldByName('IDTPPAGTOBENEFIC').AsInteger,
                                                                  qryBenefBfciario.FieldByName('DATAINICIO').AsString,
                                                                  qryBenefBfciario.FieldByName('DATAFINAL').AsString,
                                                                  sAnoMesFim, { Augusto 09/11/2005 - psAnoMesFim, }
                                                                  qryBenefBfciario.FieldByName('FLGCALCTODOMES').AsString,
                                                                  dValorEmReal,
                                                                  dValorTotal,
                                                                  dValorEmCotas,
                                                                  True, // pbCalculaPrimUltPgto
                                                                  qryBenefBfciario.FieldByName('DATAINICIO').AsString,
                                                                  iTipoMov, // piTipoMov
                                                                  qryBenefBfciario.FieldByName('FLGDATAPREVISTA').AsInteger,
                                                                  bErro,
                                                                  bReajustou,
                                                                  sUltMesReajuste,
                                                                  dValorBeneficioIntegralOriginal,
                                                                  dValorBeneficioIntegralAposMinimo,
                                                                  dValorPrevAntesMinimo,
                                                                  dValorBenefRateado, // Augusto 23/01/2003
                                                                  dValorSRBRetorno,
                                                                  iIdCalculo,
                                                                  sDataPagamento,
                                                                  bCalculaTudo);
                  bCalculaTudo := False;

                  dValorEmReal := dValorDevido;
                  dValorTotal  := dValorBeneficioIntegralAposMinimo;
               end;
            end
            else begin
               dValorDevido :=  ExecutaRegraValorAbono       ( qryAux,
                                                               qryBenefBfciario.FieldByName('IDREGRACALCABONO').AsInteger,
                                                               qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                               qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                               qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                                               qryBenefBfciario.FieldByName('SEQPROPOSTA').AsInteger,
                                                               qryBenefBfciario.FieldByName('IDPESSOA').AsInteger,
                                                               qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                                               qryBenefBfciario.FieldByName('DATAINICIO').AsString,
                                                               qryBenefBfciario.FieldByName('DATAFINAL').AsString,
                                                               Copy(sAnoMesAtual,1,5)+'12',
                                                               dValorBenefRateado, //dValorBeneficioIntegralAposMinimo, //leofuncef - 05122004
                                                               '0',
                                                               bErro,
                                                               sMsgErro,
                                                               iIdCalculo,
                                                               iTipoMov, // REVISAO
                                                               // 7,
                                                               iTotBeneficiarios,
                                                               qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString,
                                                               dValorTotal);
               dValorEmReal    := dValorDevido;

            end;
         end;
         // ********************************************************************
         // FIM-VERIFICAR O VALOR REALMENTE DEVIDO NO MÊS ATUAL
         // ********************************************************************
         // CAMILLE - 06.07.2004
         iIdUsuarioAutorizaVALOR := VerificaVALORLimiteBeneficio ( qryAux,
                                                                   frmRetroativoPrev.Caption,
                                                                   qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                                                   qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                                   qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                                   qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                                                   qryBenefBfciario.FieldByName('IDPESSOA').AsInteger,
                                                                   qryBenefBfciario.FieldByName('IdBeneficio').AsInteger,
                                                                   dValorDevido,
                                                                   True,
                                                                   'Matricula : '+qryBenefBfciario.FieldByName('MATRICULA').AsString+' - Mês : '+sAnoMesAtual); // Requerimento = False, Outras = True
         if iIdUsuarioAutorizaVALOR < 0
         then begin
            MsgDlg('Revisão de Benefício não permitida por exceder valor limite e não ter autorização. Verifique. ','Informação',mtInformation,[mbOk],0);
            Abort;
         end;



         //leofuncef - 16112004 - se for individual chama a if VerificaPERCLimiteBeneficio que
         // tem a permissão por usuário
         if rbtnIndividual.Checked  then
         begin
            iIdUsuarioAutorizaPERC := VerificaPERCLimiteBeneficio( qryAux,
                                                                  frmRetroativoPrev.Caption+' - Matricula : '+qryBenefBfciario.FieldByName('MATRICULA').AsString+' - Mês : '+sAnoMesAtual,
                                                                  qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                                                  qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                                  qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                                  qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                                                  qryBenefBfciario.FieldByName('IDPESSOA').AsInteger,
                                                                  qryBenefBfciario.FieldByName('IdBeneficio').AsInteger,
                                                                  qryBenefBfciario.FieldByName('VALORATUAL').AsFloat,
                                                                  dValorDevido,
                                                                  True,
                                                                  'Matricula : '+qryBenefBfciario.FieldByName('MATRICULA').AsString+' - Mês : '+sAnoMesAtual); // Requerimento = False, Outras = True
            if iIdUsuarioAutorizaPERC < 0
            then begin
               bExcedeuLimite := True ; // CAMILLE - 27.10.2004
            end;
         end
         else
         begin

            iIdUsuarioAutorizaPERC := VerificaPERCLimiteBeneficioRETROATIVO  ( qryAux,
                                                                     frmRetroativoPrev.Caption+' - Matricula : '+qryBenefBfciario.FieldByName('MATRICULA').AsString+' - Mês : '+sAnoMesAtual,
                                                                     qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                                                     qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                                     qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                                     qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                                                     qryBenefBfciario.FieldByName('IDPESSOA').AsInteger,
                                                                     qryBenefBfciario.FieldByName('IdBeneficio').AsInteger,
                                                                     qryBenefBfciario.FieldByName('VALORATUAL').AsFloat,
                                                                     dValorDevido,
                                                                     True,
                                                                     'Matricula : '+qryBenefBfciario.FieldByName('MATRICULA').AsString+' - Mês : '+sAnoMesAtual); // Requerimento = False, Outras = True
            if iIdUsuarioAutorizaPERC < 0
            then begin
               bExcedeuLimite := True ; // CAMILLE - 27.10.2004
            end;
         end;
         //leofuncef - 26112004 - fim

         // ********************************************************************
         // VERIFICAR O VALOR REALMENTE PAGO NO MÊS ATUAL
         // ********************************************************************
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT SUM(DECODE(HST.FLGDEVOLUCAO,1,-HST.VLBENEFPGTO,HST.VLBENEFPGTO)) AS VALORPAGO '+
                        ' FROM   HSTBENEFBFCIARIO HST                                                          '+
                        ' WHERE  HST.MESREFERENCIA  = '''+sAnoMesAtual+'''                                     '+
                        ' AND    HST.IDTITULAR      = '+qryBenefBfciario.FieldByName('IDTITULAR').AsString      +
                        ' AND    HST.IDPESSOA       = '+qryBenefBfciario.FieldByName('IDPESSOA').AsString       +
                        ' AND    HST.SEQPROPOSTA    = '+qryBenefBfciario.FieldByName('SEQPROPOSTA').AsString    +
                        ' AND    HST.IDPESSJUR      = '+qryBenefBfciario.FieldByName('IDPESSJUR').AsString      +
                        ' AND    HST.IDBENEFICIO    = '+qryBenefBfciario.FieldByName('IDBENEFICIO').AsString    +
                        { Augusto 30/04/2004 / 16/06/2004 - Caso de revisões já pagas   }
                        //' AND    ( (HST.VALORACERTO IS NULL) OR '+
                        //'        ( (HST.VALORACERTO IS NOT NULL) AND (HST.VLBENEFPGTO IS NOT NULL))) ');
                        ' AND    HST.IDMOTIVO <> '+IntToStr(prmIdMotivoAcertoMigracaoPlano) );

         //leofuncef- 24112004 - caso seja um caso de benefício do Inss anterior em outro plano
         //não filtrar por plano ou numeroprocesso
         if not bInssMigrado then
         qryAux.SQL.Add(' AND    HST.IDPLANOPREV    = '+qryBenefBfciario.FieldByName('IDPLANOPREV').AsString    +
                        ' AND    HST.NUMEROPROCESSO = '+qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsString );

         qryAux.Open;

         if (not qryAux.IsEmpty) and (Abs(qryAux.FieldbyName('VALORPAGO').AsFloat) > 0) // leofuncef - 26102004
         then begin
            if qryAux.FieldbyName('VALORPAGO').AsFloat > dValorDevido
            then begin
               dDiferenca    := qryAux.FieldbyName('VALORPAGO').AsFloat - dValorDevido;
               sFlgDevolucao := '1';
            end
            else begin
               dDiferenca    := dValorDevido - ABS(qryAux.FieldbyName('VALORPAGO').AsFloat); //leofuncef - 26102004
               sFlgDevolucao := '0';
            end;

            dDiferenca := StrToFloat(FormatFloat('#0.00',Abs(dDiferenca))); { Augusto 01/05/2005 Inclui o ABS }

            { Inicio Augusto 21/01/2005 }
            dValorAntes := qryAux.FieldbyName('VALORPAGO').AsFloat;
            { Excluir historico existente no mes que não foi pago }
            sSQL := ' DELETE HSTBENEFBFCIARIO  '+
                    ' WHERE  IDPESSJUR   = '+qryBenefBfciario.FieldByName('IDPESSJUR').AsString+
                    ' AND    IDPLANOPREV = '+qryBenefBfciario.FieldByName('IDPLANOPREV').AsString+
                    ' AND    IDTITULAR   = '+qryBenefBfciario.FieldByName('IDTITULAR').AsString+
                    ' AND    IDPESSOA    = '+qryBenefBfciario.FieldByName('IDTITULAR').AsString+
                    ' AND    IDBENEFICIO = '+qryBenefBfciario.FieldByName('IDBENEFICIO').AsString+
                    ' AND    SEQPROPOSTA = '+qryBenefBfciario.FieldByName('SEQPROPOSTA').AsString+
                    ' AND    MESREFERENCIA = '+QuotedStr(sAnoMesAtual)+
                    //' AND    IDMOTIVO    = '+qryMotivo.FieldByName('IDMOTIVO').AsString+
                    ' AND    FLGENVIADO  <> 1'+ { Augusto 20/02/2006 }
                    ' AND    NVL(VLBENEFPGTO,0) = 0';
            ExecutarQuery(QryAux, sSQL);
            { Fim Augusto 21/01/2005 }

            // CAMILLE - 01.07.2003
            // Se a diferenca for zero, inserir no demonstrativo apenas para usuario ver,
            // mas nao inserir na hst
            if ((sAnoMesAtual >= sAnoMesInicioAcerto) and (sAnoMesAtual <= sAnoMesFimAcerto) )
            then begin
               qryDemonstrativo.Insert;
               qryDemonstrativo.FieldbyName('ANOMES').AsString := sAnoMesAtual;
               if sFlgDevolucao = '0'
               then qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat    := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat + dDiferenca
               else qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat    := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat - dDiferenca;

               qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat    := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat * dIndice;
               qryDemonstrativo.FieldbyName('INDICE').AsFloat                := dIndice;

               qryDemonstrativo.FieldbyName('VALORANTES').AsFloat        := dValorAntes;
               qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat       := dValorDevido;
               // Gleyber - 09/08/2006 - Pendência 23002 - Início
               //qryDemonstrativo.FieldbyName('SRBANTES').AsFloat          := qryBenefBfciario.FieldByName('VALORSRB').AsFloat;
               //qryDemonstrativo.FieldbyName('SRBDEPOIS').AsFloat         := dValorSRBRetorno;

               { Inicio Augusto 19/01/2007 - Voltar a situação original, pois verificamos  }
               { que é a correta. Caso tenha problema no demonstrativo da FUNCEF verificar }
               { melhor o caso.                                                            }
               //qryDemonstrativo.FieldbyName('SRBANTES').AsFloat          := dValorSRBRetorno;
               //qryDemonstrativo.FieldbyName('SRBDEPOIS').AsFloat         := qryBenefBfciario.FieldByName('VALORSRB').AsFloat;
               qryDemonstrativo.FieldbyName('SRBANTES').AsFloat          := qryBenefBfciario.FieldByName('VALORSRB').AsFloat;
               qryDemonstrativo.FieldbyName('SRBDEPOIS').AsFloat         := dValorSRBRetorno;
               { Fim 19/01/2007                                                            }

               // Gleyber - 09/08/2006 - Pendência 23002 - Fim
               qryDemonstrativo.FieldbyName('RESERVADEPOIS').AsFloat     := dValorReserva;
               qryDemonstrativo.FieldbyName('SALVIRTUALANTES').AsFloat   := StrToFloat(ClienteNumero(sSalarioVirtualNoMesAntesReajuste));
               qryDemonstrativo.FieldbyName('SALVIRTUALDEPOIS').AsFloat  := StrToFloat(ClienteNumero(sSalarioVirtualNoMes));
               { Inicio Augusto 17/01/2005 }
               qryDemonstrativo.FieldbyName('IDTITULAR').AsString         := qryBenefBfciario.FieldByName('IDTITULAR').AsString;
               qryDemonstrativo.FieldbyName('IDPLANOPREV').AsString       := qryBenefBfciario.FieldByName('IDPLANOPREV').AsString;
               qryDemonstrativo.FieldbyName('IDPESSOA').AsString          := qryBenefBfciario.FieldByName('IDPESSOA').AsString;
               qryDemonstrativo.FieldbyName('IDENTIFICADOR').AsString     := qryBenefBfciario.FieldByName('IDBENEFICIO').AsString;
               { Fim Augusto 17/01/2005 }
               qryDemonstrativo.FieldbyName('DESCRICAO').AsString        := Copy(qryBenefBfciario.FieldByName('NOME').AsString,1,30);
               if qryBenefBfciario.FieldByName('FLGREFERENCIA').AsInteger = 1
               then qryDemonstrativo.FieldbyName('TIPO').AsString        := 'I'  // inss
               else qryDemonstrativo.FieldbyName('TIPO').AsString        := 'B'; // beneficio de suplementacao
               { Augusto 02/02/2004 }
               qryDemonstrativo.FieldbyName('NOMEBENEF').AsString          := qryBenefBfciario.FieldByName('NOMEBENEF').AsString;
               qryDemonstrativo.Post;
               if (dDiferenca > 0) and (not bExcedeuLimite )  // CAMILLE - 27.10.2004
               then begin
                  if not InsereHstBenefBfciario ( qryAux,
                                                  9, // iSeqBeneficio,
                                                  qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                                  qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                                  qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                  qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                  qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                                  qryBenefBfciario.FieldByName('SEQPROPOSTA').AsInteger,
                                                  qryBenefBfciario.FieldByName('IDPESSOA').AsInteger,
                                                  qryBenefBfciario.FieldByName('IDREGRACALCULO').AsInteger,
                                                  qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                                  qryBenefBfciario.fieldbyname('CODPORTFORMA').asinteger,
                                                  sAnoMesAtual,
                                                  sAnoMesLote,
                                                  qryBenefBfciario.FieldByName('MATRICULA').AsString,
                                                  qryBenefBfciario.FieldByName('INSCRICAONUMERO').AsString,
                                                  Copy('Cálculo Retroativo - Matric.'+qryBenefBfciario.FieldByName('MATRICULA').AsString+' - Mês : '+sAnoMesAtual,1,200),
                                                  dDiferenca,
                                                  dValorDevido, //dDiferenca, { Augusto 29/04/2004  }
                                                  dValorBenefRateado, //dValorBeneficioIntegralAposMinimo, // Augusto 10/12/2003
                                                  0, // ValorPago
                                                  iFlgEnviado,
                                                  1,
                                                  StrToInt(sFlgDevolucao),
                                                  iIdLote,
                                                  sMsgErro,
                                                  sDataPagamento,
                                                  dValorTotal,       { Augusto 19/12/2003 }
                                                  dValorSRBRetorno,  { Augusto 29/12/2003 }

                                                  { Inicio Augusto 24/03/2006 }
                                                  0,
                                                  dValorPrevAntesMinimo,
                                                  qryBenefBfciario.FieldByName('VALORBASE1').AsFloat,
                                                  qryBenefBfciario.FieldByName('VALORBASE2').AsFloat,
                                                  qryBenefBfciario.FieldByName('VALORBASE3').AsFloat,
                                                  -1,
                                                  sAnoMesAtualReal,
                                                  iTipoMov )
                                                  { Fim Augusto 24/03/2006    }

                  then Exit;

                  if (not bExcedeuLimite ) then begin  // CAMILLE - 27.10.2004

                    { Inicio Augusto 17/01/2005 - Novo calculo do Alterador }
                    If Trim(DbLkcAlterador.Text) = '' Then Begin
                      If Not CalculaAlteradores('B', sAnoMesAtual,
                                                qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat,
                                                dCorrecaoMonetaria,
                                                -1,-1  )
                      Then Begin
                        dtmBaseDados.dbBaseDados.RollBack;
                        MsgDlg('Erro no calculo dos alteradores.', 'Erro', mtError, [mbOk,mbHelp], 0);
                        TiraSQL(qryAux);
                        Exit;
                      End;
                      qryDemonstrativo.Edit;
                      qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat :=
                        qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat + dCorrecaoMonetaria;
                      qryDemonstrativo.Post;
                    End Else Begin
                      dCorrecaoMonetaria := ( (qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat * dIndice) -
                                             qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat);
                      InsereCorrecaoMonetaria('B',qryBenefBfciario, sAnoMesAtual, dCorrecaoMonetaria);
                    End;
                    { Fim Augusto 17/01/2005 }

                 end;
                 // CAMILLE - 05.11.2004
                 // SE O MES PROCESSADO NUNCA TIVER SIDO PAGO PELA FOLHA E FOR MAIOR QUE O ULTIMO MES PREPARADO
                 // ENTAO ATUALIZAR A BENEFBFCIARIO
                 if (sAnoMesAtual >= qryBenefBfciario.FieldByName('ULTMESPREPARO').AsString) and
                    ( not bExcedeuLimite )  // CAMILLE - 27.10.2004
                    And (Copy(sAnoMesAtual,6,2) <> '13') { Augusto 24/01/2004 - Somente se não for abono... }
                 Then Begin
                    qryAux.Close;
                    qryAux.SQL.Clear;
                    qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET VALORSRB = '+OraNumero(FloatToStr(dValorSRBRetorno) )    );
                    qryAux.SQL.Add(', VALORATUAL    = '+OraNumero(FloatToStr(dValorDevido)));

                    { Augusto 22/05/2007 - Somente atualizar o ULTMESPREPARO se houve realmente }
                    { lançamento no histórico do mês em processamento.                          }
                    If ( dDiferenca > 0 )
                    Then qryAux.SQL.Add(', ULTMESPREPARO = '''+sAnoMesAtual+''''); // leofuncef - 12012005 - voltei o sanomestaual anterior
                                                                                   // caso o mês do lote seja maior que o último mês para acerto,selecionado na revisão,
                                                                                   // a Folha não processa amnutenção por que o ULTMESPREPARO ficou posterior ao último
                                                                                   // mês que foi tratado pela revisão

                    if ( qryBenefBfciario.FieldByName('IDTITULAR').AsString =
                         qryBenefBfciario.FieldByName('IDPESSOA').AsString ) Or
                       ( rgrpRecalculaBeneficio.ItemIndex = 2 ) { Augusto 07/05/2007 - Digitado e não reajustar }
                    then qryAux.SQL.Add(', VALORTOTAL = '+OraNumero(FloatToStr(dValorTotal)));

                    qryAux.SQL.Add(' WHERE  IDPESSJUR      = '+qryBenefBfciario.FieldByName('IDPESSJUR').AsString+
                                   ' AND    IDPLANOPREV    = '+qryBenefBfciario.FieldByName('IDPLANOPREV').AsString+
                                   ' AND    IDTITULAR      = '+qryBenefBfciario.FieldByName('IDTITULAR').AsString+
                                   ' AND    IDPESSOA       = '+qryBenefBfciario.FieldByName('IDPESSOA').AsString+
                                   ' AND    SEQPROPOSTA    = '+qryBenefBfciario.FieldByName('SEQPROPOSTA').AsString+
                                   ' AND    IDBENEFICIO    = '+qryBenefBfciario.FieldByName('IDBENEFICIO').AsString);
                    try
                       qryAux.ExecSQL;
                       if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'VALORSRB',       qryBenefBfciario.FieldByName('VALORSRB').AsString,   OraNumero(FloatToStr(dValorSRBRetorno) ), 'SRB')         then Exit;
                       if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'VALORATUAL',     qryBenefBfciario.FieldByName('VALORATUAL').AsString, OraNumero(FloatToStr(dValorDevido) ), 'Valor Atual') then Exit;

                       if qryBenefBfciario.FieldByName('IDTITULAR').AsString <> qryBenefBfciario.FieldByName('IDPESSOA').AsString
                       then begin
                          if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'VALORTOTAL',     qryBenefBfciario.FieldByName('VALORTOTAL').AsString, OraNumero(FloatToStr(dValorTotal) ), 'Valor Total') then Exit;
                       end;

                    except
                       Exit;
                    end;
                 end;


               end;
            end;

         end
         else begin
            if grpInsereMesNaoEncontrado.ItemIndex = 0
            then begin
               { Augusto 27/12/2003 - Somente acertar os meses para acerto }
               if ((sAnoMesAtual >= sAnoMesInicioAcerto) and (sAnoMesAtual <= sAnoMesFimAcerto) )
                  or ((copy(sAnoMesFimAcerto,6,2) < '12') and (copy(sAnoMesAtual,6,2) = '13')) //leocm - 14022006

               Then Begin
                 if (not bExcedeuLimite )  // CAMILLE - 27.10.2004
                 then begin
                    { Inicio Augusto 27/12/2003 }
                    { Excluir historico existente no mes que não foi pago }
                    sSQL := ' DELETE HSTBENEFBFCIARIO  '+
                            ' WHERE  IDPESSJUR   = '+qryBenefBfciario.FieldByName('IDPESSJUR').AsString+
                            ' AND    IDPLANOPREV = '+qryBenefBfciario.FieldByName('IDPLANOPREV').AsString+
                            ' AND    IDTITULAR   = '+qryBenefBfciario.FieldByName('IDTITULAR').AsString+
                            ' AND    IDPESSOA    = '+qryBenefBfciario.FieldByName('IDTITULAR').AsString+
                            ' AND    IDBENEFICIO = '+qryBenefBfciario.FieldByName('IDBENEFICIO').AsString+
                            ' AND    SEQPROPOSTA = '+qryBenefBfciario.FieldByName('SEQPROPOSTA').AsString+
                            ' AND    MESREFERENCIA = '+QuotedStr(sAnoMesAtual)+
                            //' AND    IDMOTIVO    = '+qryMotivo.FieldByName('IDMOTIVO').AsString+
                            ' AND    FLGENVIADO  <> 1'+ { Augusto 20/02/2006 }
                            ' AND    NVL(VLBENEFPGTO,0) = 0';
                    ExecutarQuery(QryAux, sSQL);
                    { Fim Augusto 27/12/2003 }
                 end;

                 dDiferenca    := dValorEmReal;
                 dValorDevido  := dValorEmReal;
                 sFlgDevolucao := '0';

                 qryDemonstrativo.Insert;
                 qryDemonstrativo.FieldbyName('ANOMES').AsString := sAnoMesAtual;
                 if sFlgDevolucao = '0'
                 then qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat + dDiferenca
                 else qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat - dDiferenca;

                 qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat    := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat * dIndice;
                 qryDemonstrativo.FieldbyName('INDICE').AsFloat                := dIndice;

                 qryDemonstrativo.FieldbyName('VALORANTES').AsFloat     := 0;
                 qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat   := dValorDevido;
                 qryDemonstrativo.FieldbyName('SRBANTES').AsFloat          := qryBenefBfciario.FieldByName('VALORSRB').AsFloat;
                 qryDemonstrativo.FieldbyName('SRBDEPOIS').AsFloat         := dValorSRBRetorno;
                 qryDemonstrativo.FieldbyName('RESERVADEPOIS').AsFloat     := dValorReserva;
                 qryDemonstrativo.FieldbyName('SALVIRTUALANTES').AsFloat   := StrToFloat(ClienteNumero(sSalarioVirtualNoMesAntesReajuste));
                 qryDemonstrativo.FieldbyName('SALVIRTUALDEPOIS').AsFloat  := StrToFloat(ClienteNumero(sSalarioVirtualNoMes));
                 { Inicio Augusto 17/01/2005 }
                 qryDemonstrativo.FieldbyName('IDTITULAR').AsString         := qryBenefBfciario.FieldByName('IDTITULAR').AsString;
                 qryDemonstrativo.FieldbyName('IDPLANOPREV').AsString       := qryBenefBfciario.FieldByName('IDPLANOPREV').AsString;
                 qryDemonstrativo.FieldbyName('IDPESSOA').AsString          := qryBenefBfciario.FieldByName('IDPESSOA').AsString;
                 qryDemonstrativo.FieldbyName('IDENTIFICADOR').AsString     := qryBenefBfciario.FieldByName('IDBENEFICIO').AsString;
                 { Fim Augusto 17/01/2005 }
                 qryDemonstrativo.FieldbyName('DESCRICAO').AsString        := Copy(qryBenefBfciario.FieldByName('NOME').AsString,1,30);
                 if qryBenefBfciario.FieldByName('FLGREFERENCIA').AsInteger = 1
                 then qryDemonstrativo.FieldbyName('TIPO').AsString        := 'I'  // inss
                 else qryDemonstrativo.FieldbyName('TIPO').AsString        := 'B'; // beneficio de suplementacao
                 { Augusto 02/02/2004 }
                 qryDemonstrativo.FieldbyName('NOMEBENEF').AsString          := qryBenefBfciario.FieldByName('NOMEBENEF').AsString;
                 qryDemonstrativo.Post;

                 if (not bExcedeuLimite )  // CAMILLE - 27.10.2004
                 then begin
                    if not InsereHstBenefBfciario ( qryAux,
                                                    9, // iSeqBeneficio,
                                                    qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                                    qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                                    qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                    qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                    qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                                    qryBenefBfciario.FieldByName('SEQPROPOSTA').AsInteger,
                                                    qryBenefBfciario.FieldByName('IDPESSOA').AsInteger,
                                                    qryBenefBfciario.FieldByName('IDREGRACALCULO').AsInteger,
                                                    qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                                    qryBenefBfciario.fieldbyname('CODPORTFORMA').asinteger,
                                                    sAnoMesAtual,
                                                    sAnoMesLote,
                                                    qryBenefBfciario.FieldByName('MATRICULA').AsString,
                                                    qryBenefBfciario.FieldByName('INSCRICAONUMERO').AsString,
                                                    Copy('Cálculo Retroativo - Matric.'+qryBenefBfciario.FieldByName('MATRICULA').AsString+' - Mês : '+sAnoMesAtual,1,200),
                                                    dDiferenca,
                                                    dDiferenca,
                                                    dValorBenefRateado, //dValorBeneficioIntegralAposMinimo, // Augusto 03/12/2004
                                                    0, // ValorPago
                                                    iFlgEnviado,
                                                    1,
                                                    StrToInt(sFlgDevolucao),
                                                    iIdLote,
                                                    sMsgErro,
                                                    sDataPagamento,
                                                    dValorTotal,       { Augusto 19/12/2003 }
                                                    dValorSRBRetorno,  { Augusto 29/12/2003 }

                                                    { Inicio Augusto 24/03/2006 }
                                                    0,
                                                    dValorPrevAntesMinimo,
                                                    qryBenefBfciario.FieldByName('VALORBASE1').AsFloat,
                                                    qryBenefBfciario.FieldByName('VALORBASE2').AsFloat,
                                                    qryBenefBfciario.FieldByName('VALORBASE3').AsFloat,
                                                    -1,
                                                    sAnoMesAtualReal,
                                                    iTipoMov)
                                                    { Fim Augusto 24/03/2006    }
                    then Exit;

                    { Inicio Augusto 17/01/2005 - Novo calculo do Alterador }
                    If Trim(DbLkcAlterador.Text) = '' Then Begin
                      If Not CalculaAlteradores('B', sAnoMesAtual,
                                                qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat,
                                                dCorrecaoMonetaria,
                                                -1,-1)
                      Then Begin
                        dtmBaseDados.dbBaseDados.RollBack;
                        MsgDlg('Erro no calculo dos alteradores.', 'Erro', mtError, [mbOk,mbHelp], 0);
                        TiraSQL(qryAux);
                        Exit;
                      End;
                      qryDemonstrativo.Edit;
                      qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat :=
                        qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat + dCorrecaoMonetaria;
                      qryDemonstrativo.Post;
                    End Else Begin
                      dCorrecaoMonetaria := ( (qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat * dIndice) -
                                              qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat);
                      InsereCorrecaoMonetaria('B',qryBenefBfciario, sAnoMesAtual, dCorrecaoMonetaria);
                    End;
                    { Fim Augusto 17/01/2005 }
                 end;

                 // CAMILLE - 26.10.2004
                 // SE O MES PROCESSADO NUNCA TIVER SIDO PAGO PELA FOLHA E FOR MAIOR QUE O ULTIMO MES PREPARADO
                 // ENTAO ATUALIZAR A BENEFBFCIARIO
                 if (sAnoMesAtual >= qryBenefBfciario.FieldByName('ULTMESPREPARO').AsString) and
                    (not bExcedeuLimite )  // CAMILLE - 27.10.2004

                    And (Copy(sAnoMesAtual,6,2) <> '13') { Augusto 20/02/2006 - Somente se não for abono... }

                 then begin
                    qryAux.Close;
                    qryAux.SQL.Clear;
                    qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET VALORSRB = '+OraNumero(FloatToStr(dValorSRBRetorno) )    );
                    qryAux.SQL.Add(', VALORATUAL    = '+OraNumero(FloatToStr(dValorDevido)));

                    { Augusto 22/05/2007 - Somente atualizar o ULTMESPREPARO se houve realmente }
                    { lançamento no histórico do mês em processamento.                          }
                    If ( dDiferenca > 0 )
                    Then qryAux.SQL.Add(', ULTMESPREPARO = '''+sAnoMesAtual+''''); // leofuncef - 12012005 - voltei o sanomestaual anterior
                                                                                   // caso o mês do lote seja maior que o último mês para acerto,selecionado na revisão,
                                                                                   // a Folha não processa amnutenção por que o ULTMESPREPARO ficou posterior ao último
                                                                                   // mês que foi tratado pela revisão

                    if qryBenefBfciario.FieldByName('IDTITULAR').AsString = qryBenefBfciario.FieldByName('IDPESSOA').AsString
                    then qryAux.SQL.Add(', VALORTOTAL = '+OraNumero(FloatToStr(dValorTotal)));

                    qryAux.SQL.Add(' WHERE  IDPESSJUR      = '+qryBenefBfciario.FieldByName('IDPESSJUR').AsString+
                                   ' AND    IDPLANOPREV    = '+qryBenefBfciario.FieldByName('IDPLANOPREV').AsString+
                                   ' AND    IDTITULAR      = '+qryBenefBfciario.FieldByName('IDTITULAR').AsString+
                                   ' AND    IDPESSOA       = '+qryBenefBfciario.FieldByName('IDPESSOA').AsString+
                                   ' AND    SEQPROPOSTA    = '+qryBenefBfciario.FieldByName('SEQPROPOSTA').AsString+
                                   ' AND    IDBENEFICIO    = '+qryBenefBfciario.FieldByName('IDBENEFICIO').AsString);
                    try
                       qryAux.ExecSQL;
                       if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'VALORSRB',       qryBenefBfciario.FieldByName('VALORSRB').AsString,   OraNumero(FloatToStr(dValorSRBRetorno) ), 'SRB')         then Exit;
                       if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'VALORATUAL',     qryBenefBfciario.FieldByName('VALORATUAL').AsString, OraNumero(FloatToStr(dValorDevido) ),     'Valor Atual') then Exit;
                       if qryBenefBfciario.FieldByName('IDTITULAR').AsString <> qryBenefBfciario.FieldByName('IDPESSOA').AsString
                       then begin
                          if not GravaLogDadosAlterados( 'BENEFBFCIARIO', 'VALORTOTAL',     qryBenefBfciario.FieldByName('VALORTOTAL').AsString, OraNumero(FloatToStr(dValorTotal) ),      'Valor Total') then Exit;
                       end;
                    except
                       Exit;
                    end;
                 end;

               End; { ((sAnoMesAtual >= sAnoMesInicioAcerto) and (sAnoMesAtual <= sAnoMesFimAcerto) ) }

            end;
         end;
         // ********************************************************************
         // FIM-VERIFICAR O VALOR REALMENTE PAGO NO MÊS ATUAL
         // ********************************************************************


         // ********************************************************************
         // RECALCULAR E ACERTAR CONTRIBUICOES
         // ********************************************************************
         If (not bCalculouContribuicoes) And (qryBenefBfciario.FieldByName('FLGREFERENCIA').AsInteger = 0)
         Then Begin
            If qryBenefBfciario.FieldByName('IDTITULAR').AsInteger = qryBenefBfciario.FieldByName('IDPESSOA').AsInteger
            Then Begin
              { CONTRIBUIÇÃO SOBRE TITULAR }
              with qryContribuicoes do
              begin
                 Close;
                 SQL.Clear;
                 { Augusto 06/03/2004 - Buscar contribuições mesmo que não tenha HST }
                 SQL.Add(' SELECT DISTINCT C.IDCONTRIBUICAO, CPP.DATAINICIO, CPP.DATAFINAL, CPP.CODPORTFORMA,         '+
                         '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, CP.IDREGRACALCULO, BF.NUMEROPROCESSO, '+
                         '        C.NOME,                                                                               '+
                         { Augusto 28/04/2004 - inclusao do DISTINCT, pois no caso de ter dois beneficios no mes duplicava }
                         '        SUM(DISTINCT  DECODE(HST.FLGDEVOLUCAO,1,-HST.VALORRECEBIDO,HST.VALORRECEBIDO)) AS VALORRECEBIDO,'+
                         '        SUM(DISTINCT  DECODE(HST.FLGDEVOLUCAO,1,-HST.VALORESPERADO,HST.VALORESPERADO)) AS VALORESPERADO '+
                         ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, CONTRIBPREVPARTP CPP, HSTCONTRIBPREV HST, CONTPREV CP, '+
                         '        BENEFPLANPREV BP, BENEFBFCIARIO BF, CONTPREVEVENTO CPE, BENEFICIO B, CONTRIBUICAO C   '+
                         ' WHERE  EL.IDPESSJUR     = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString              +
                         ' AND    EL.IDPESSOA      = '+qryPessoasATratar.FieldByName('IDPESSOA').AsString               +
                         ' AND    PP.IDPLANOPREV   = '+qryPessoasATratar.FieldByName('IDPLANOPREV').AsString            +
                         ' AND    PP.SEQPROPOSTA   = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString            +
                         ' AND    HST.MESREFERENCIA(+) = '''+sAnoMesAtual+'''                                          '+

                         { Augusto 10/07/2007 - Respeitar DATAINICIO E DATAFINAL da contribuição }
                         ' AND    TO_CHAR(CPP.DATAINICIO,''YYYY/MM'') <= '+QuotedStr( sAnoMesAtual ) +
                         ' AND    ( TO_CHAR(CPP.DATAFINAL, ''YYYY/MM'') >= '+QuotedStr( sAnoMesAtual ) +
                         '       OR CPP.DATAFINAL IS NULL ) ' +

                         ' AND    CPP.FLGCOBRA     = 1 '+  { Augusto 19/01/2005 }
                         //' AND    HST.MESREFERENCIA = HST.MESCOBRANCA '+ { Augusto 30/04/2004 }
                         ' AND    EL.IDPESSJUR     = PP.IDPESSJUR                                                     '+
                         ' AND    EL.IDPESSOA      = PP.IDPESSOA                                                      '+

                         ' AND    PP.IDPESSJUR     = CPP.IDPESSJUR                                                     '+
                         ' AND    PP.IDPLANOPREV   = CPP.IDPLANOPREV                                                   '+
                         ' AND    PP.IDPESSOA      = CPP.IDPESSOA                                                      '+
                         ' AND    PP.SEQPROPOSTA   = CPP.SEQPROPOSTA                                                   '+

                         ' AND    CPP.IDPLANOPREV    = CP.IDPLANOPREV                                                   '+
                         ' AND    CPP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO                                                '+

                         ' AND    CPP.IDPESSJUR      = HST.IDPESSJUR(+)                                                     '+
                         ' AND    CPP.IDPLANOPREV    = HST.IDPLANOPREV(+)                                                   '+
                         ' AND    CPP.IDPESSOA       = HST.IDPESSOA(+)                                                      '+
                         ' AND    CPP.SEQPROPOSTA    = HST.SEQPROPOSTA(+)                                                   '+
                         ' AND    CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO(+)                                               '+

                         ' AND    BF.IDPESSJUR(+)   = CPP.IDPESSJUR                                                     '+
                         ' AND    BF.IDPLANOPREV(+) = CPP.IDPLANOPREV                                                   '+
                         ' AND    BF.IDPESSOA(+)    = CPP.IDPESSOA                                                      '+
                         ' AND    BF.DATAINICIO(+)  >= CPP.DATAINICIO                                                    '+
                         ' AND    BP.IDPLANOPREV(+) = BF.IDPLANOPREV                                                    '+
                         ' AND    BP.IDBENEFICIO(+) = BF.IDBENEFICIO                                                    '+
                         ' AND    BF.IDBENEFICIO    IN ('+sBeneficiosAUX+')                                             '+ // camille - 22.01.2004
                         ' AND    ((BP.FLGREFERENCIA = 0) OR (BP.FLGREFERENCIA IS NULL) )                               '+
                         ' AND    B.IDBENEFICIO       = BP.IDBENEFICIO                                                  '+
                         ' AND    CPE.IDEVENTOGERADOR = B.IDEVENTOGERADOR                                               '+

                         ' AND    CPP.IDPLANOPREV     = CPE.IDPLANOPREV                                                 '+
                         ' AND    CPP.IDCONTRIBUICAO  = CPE.IDCONTRIBUICAO                                              '+

                         ' AND    C.IDCONTRIBUICAO    = CPE.IDCONTRIBUICAO                                              '+

                         ' GROUP BY C.IDCONTRIBUICAO, CPP.DATAINICIO, CPP.DATAFINAL, CPP.CODPORTFORMA,                '+
                         '          CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, CP.IDREGRACALCULO,                  '+
                         '          BF.NUMEROPROCESSO, C.NOME                                                                   ');
                 Open;
              end;
              while not qryContribuicoes.Eof do
              begin
                 dValorDevido := CalculaContribuicaoACobrarNoMes ( qryAux,
                                                                   qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                                   qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                                   qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                                                   qryBenefBfciario.FieldByName('SEQPROPOSTA').AsInteger,
                                                                   qryContribuicoes.FieldByName('IDCONTRIBUICAO').AsInteger,
                                                                   sAnoMesAtual,
                                                                   qryBenefBfciario.FieldByName('FLGINTEVENTO').AsString,
                                                                   qryContribuicoes.FieldByName('DATAINICIO').AsString,
                                                                   qryContribuicoes.FieldByName('DATAFINAL').AsString,
                                                                   qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                                                   6,
                                                                   qryBenefBfciario.FieldByName('FLGDATAPREVISTA').AsInteger,
                                                                   qryContribuicoes.FieldByName('NUMEROPROCESSO').AsInteger,
                                                                   sMsgErro,
                                                                   iIdLote );

                 if qryContribuicoes.FieldbyName('VALORRECEBIDO').AsFloat > 0
                 then dValorCobrado := qryContribuicoes.FieldbyName('VALORRECEBIDO').AsFloat
                 else dValorCobrado := qryContribuicoes.FieldbyName('VALORESPERADO').AsFloat;

                 { Augusto 03/05/2004 }
                 //If dValorDevido = 0 Then dValorDevido := dValorCobrado; //leofuncef - 29062005

                 // Verificar se existem rubricas pagas por folha extra que precisam
                 // ser consideradas
                 if edRubFolhaExtra.Text <> ''
                 then begin
                    qryAux.Close;
                    qryAux.SQL.Clear;
                    qryAux.SQL.Add(' SELECT DECODE(P.FLGDESCONTO, 0, -H.VALORPROVENTO, H.VALORPROVENTO) AS VALOREXTRA '+
                                   ' FROM   HISTRUBSAL H, PROVDESC P              '+
                                   ' WHERE  H.IDPESSOA   = '+qryBenefBfciario.FieldByName('IDPESSOA').AsString+
                                   ' AND    H.MES        = '''+sAnoMesAtual+'''');

                    qryAux.SQL.Add(' AND    H.IDRUBRICA IN ('+edRubFolhaExtra.Text+') ');
                    qryAux.SQL.Add(' AND    P.IDPROVENTO = H.IDRUBRICA ');
                    qryAux.Open;

                    if not qryAux.IsEmpty
                    then dValorCobrado := dValorCobrado + qryAux.FieldByName('VALOREXTRA').AsFloat;
                 end;

                 // Calcular acertos
                 if dValorCobrado > dValorDevido
                 then begin
                    dDiferenca    := dValorCobrado - dValorDevido;
                    sFlgDevolucao := '1';
                 end
                 else begin
                    dDiferenca    := dValorDevido - dValorCobrado;
                    sFlgDevolucao := '0';
                 end;

                 dDiferenca := StrToFloat(FormatFloat('#0.00',dDiferenca));

                 if //(dDiferenca > 0) and { Augusto 07/11/2005 }
                    ((sAnoMesAtual >= sAnoMesInicioAcerto) and (sAnoMesAtual <= sAnoMesFimAcerto) )
                 then begin
                    { Inicio Augusto 28/04/2004 }
                    varFields := VarArrayCreate([0,2],varVariant);
                    varFields[0] := 'C';
                    varFields[1] := sAnoMesAtual;
                    varFields[2] := qryContribuicoes.FieldByName('IDCONTRIBUICAO').AsString; { Augusto 19/01/2005 }
                    SavePlace := qryDemonstrativo.GetBookmark;
                    If Not qryDemonstrativo.Locate('TIPO;ANOMES;IDENTIFICADOR',varFields,[]) Then Begin
                      qryDemonstrativo.Insert;
                      qryDemonstrativo.FieldbyName('ANOMES').AsString := sAnoMesAtual;
                      { Augusto 18/01/2005 - Acumular valores  }
                      if sFlgDevolucao = '0'
                      then qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat - dDiferenca
                      else qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat + dDiferenca;
                      qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat    := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat * dIndice;

                      qryDemonstrativo.FieldbyName('INDICE').AsFloat                := dIndice;

                      qryDemonstrativo.FieldbyName('VALORANTES').AsFloat     := qryDemonstrativo.FieldbyName('VALORANTES').AsFloat  + dValorCobrado;
                      qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat    := qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat + dValorDevido;
                      qryDemonstrativo.FieldbyName('TIPO').AsString          := 'C'; // contribuicao
                      { Inicio Augusto 17/01/2005 }
                      qryDemonstrativo.FieldbyName('IDTITULAR').AsString     := qryBenefBfciario.FieldByName('IDTITULAR').AsString;
                      qryDemonstrativo.FieldbyName('IDPLANOPREV').AsString   := qryBenefBfciario.FieldByName('IDPLANOPREV').AsString;
                      qryDemonstrativo.FieldbyName('IDPESSOA').AsString      := qryBenefBfciario.FieldByName('IDPESSOA').AsString;
                      qryDemonstrativo.FieldbyName('IDENTIFICADOR').AsString := qryContribuicoes.FieldByName('IDCONTRIBUICAO').AsString; { Augusto 17/01/2005 }
                      { Fim Augusto 17/01/2005 }
                      qryDemonstrativo.FieldbyName('DESCRICAO').AsString     := Copy(qryContribuicoes.FieldByName('NOME').AsString,1,30);
                      qryDemonstrativo.FieldbyName('NOMEBENEF').AsString     := qryBenefBfciario.FieldByName('NOMEBENEF').AsString;
                      qryDemonstrativo.Post;

                      dDiferenca := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat; { Augusto 18/01/2005 }

                      qryDemonstrativo.FreeBookmark(SavePlace);
                    End Else Begin
                      qryDemonstrativo.Edit;

                      if sFlgDevolucao = '0'
                      then qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat - dDiferenca
                      else qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat + dDiferenca;

                      qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat    := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat * dIndice;

                      qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat    := dValorDevido;
                      //dDiferenca := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat;
                      qryDemonstrativo.Post;
                      dDiferenca := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat; { Augusto 18/01/2005 }
                      qryDemonstrativo.GotoBookmark(SavePlace);

                      if (not bExcedeuLimite )  // CAMILLE - 27.10.2004
                      then begin
                         sSQL := ' DELETE HSTCONTRIBPREV '+
                                 ' WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                                 ' AND    IDPLANOPREV  = '+qryPessoasATratar.FieldByName('IDPLANOPREV').AsString+
                                 ' AND    IDPESSOA     = '+qryPessoasATratar.FieldByName('IDPESSOA').AsString+
                                 ' AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                                 ' AND    IDMOTIVO     = '+qryMotivo.FieldByName('IDMOTIVO').AsString+
                                 ' AND    MESREFERENCIA = '''+sAnoMesAtual+''''+
                                 ' AND    MESCOBRANCA   = '''+edMesAcerto.Text+'''';
                         ExecutarQuery(QryAux,sSQL);
                      end;
                    End;

                    { Inicio Augusto 21/01/2005 }

                    { Excluir historico existente no mes que não foi pago }
                    if (not bExcedeuLimite ) then begin

                       { Inicio Augusto 11/07/2006 - Verificar antes de excluir }
                       sSQL := 'SELECT 1 FROM  HSTCONTRIBPREV '+
                               ' WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                               ' AND    IDPLANOPREV  = '+qryPessoasATratar.FieldByName('IDPLANOPREV').AsString+
                               ' AND    IDPESSOA     = '+qryPessoasATratar.FieldByName('IDPESSOA').AsString+
                               ' AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                               ' AND    IDMOTIVO     <> '+qryMotivo.FieldByName('IDMOTIVO').AsString+
                               ' AND    MESCOBRANCA  = '''+edMesAcerto.Text+''''+
                               ' AND    MESREFERENCIA  = '''+sAnoMesAtual+''''+
                               ' AND    MESCOBRANCA    = '''+edMesAcerto.Text+''''+
                               ' AND    IDCONTRIBUICAO = '+qryContribuicoes.FieldByName('IDCONTRIBUICAO').AsString+' '+
                               ' AND    NVL(VALORRECEBIDO,0) = 0';

                       If FazQuery ( QryAux, sSQL ) Then Begin

                         sSQL := ' DELETE HSTCONTRIBPREV '+
                                 ' WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString+
                                 ' AND    IDPLANOPREV  = '+qryPessoasATratar.FieldByName('IDPLANOPREV').AsString+
                                 ' AND    IDPESSOA     = '+qryPessoasATratar.FieldByName('IDPESSOA').AsString+
                                 ' AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString+
                                 ' AND    IDMOTIVO     <> '+qryMotivo.FieldByName('IDMOTIVO').AsString+
                                 ' AND    MESREFERENCIA  = '''+sAnoMesAtual+''''+
                                 ' AND    MESCOBRANCA    = '''+edMesAcerto.Text+''''+
                                 ' AND    IDCONTRIBUICAO = '+qryContribuicoes.FieldByName('IDCONTRIBUICAO').AsString+' '+
                                 ' AND    NVL(VALORRECEBIDO,0) = 0';
                         ExecutarQuery(QryAux,sSQL);

                       End;
                       { Fim Augusto 11/07/2006                                 }

                    end;
                    { Fim Augusto 21/01/2005 }


                    if (not bExcedeuLimite )  // CAMILLE - 27.10.2004
                    then begin
                       { Fim Augusto 28/04/2004 }

                       { Inicio Augusto 27/12/2004 }
                       iNumRecebimento := InsereHstContribPREV( qryAux,
                                                qryBenefBfciario.FieldByName('IDPESSOA').AsInteger,
                                                qryBenefBfciario.FieldByName('SEQPROPOSTA').AsInteger,
                                                qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                qryContribuicoes.FieldByName('IDCONTRIBUICAO').AsInteger,
                                                qryMotivo.FieldByName('IDMOTIVO').AsInteger,
                                                sAnoMesAtual,
                                                sAnoMesLote,
                                                qryContribuicoes.FieldByName('CODPORTFORMA').AsInteger,
                                                sDataPagamento,
                                                '',
                                                { Augusto 18/01/2005 - Incluir no histórico o valor acumulado }
                                                Abs(dDiferenca),
                                                Abs(dDiferenca),
                                                0,
                                                qryContribuicoes.FieldByName('IDREGRACALCULO').AsInteger,
                                                1,
                                                qryContribuicoes.FieldByName('VALORBASE1').AsFloat,
                                                qryContribuicoes.FieldByName('VALORBASE2').AsFloat,
                                                qryContribuicoes.FieldByName('VALORBASE3').AsFloat,
                                                qryContribuicoes.FieldByName('DATAINICIO').AsString,
                                                qryContribuicoes.FieldByName('DATAFINAL').AsString,
                                                qryBenefBfciario.FieldByName('FLGINTERNO').AsString,
                                                0,
                                                0,
                                                iIdLote,
                                                'F',
                                                0,
                                                StrtoInt(sFlgDevolucao),
                                                1,
                                                1,
                                                'B'); { Augusto 12/05/2006 }
                       If iNumRecebimento < 0 then Exit;
                       {  Fim Augusto 27/12/2004 }

                       { Inicio Augusto 17/01/2005 - Novo calculo do Alterador }
                       If Trim(DbLkcAlterador.Text) = '' Then Begin
                         If Not CalculaAlteradores('C', sAnoMesAtual, dDiferenca,
                                                   dCorrecaoMonetaria,
                                                   qryContribuicoes.FieldByName('IDCONTRIBUICAO').AsInteger,
                                                   iNumRecebimento
                                                   ) Then Begin
                           dtmBaseDados.dbBaseDados.RollBack;
                           MsgDlg('Erro no calculo dos alteradores.', 'Erro', mtError, [mbOk,mbHelp], 0);
                          TiraSQL(qryAux);
                          Exit;
                         End;
                         qryDemonstrativo.Edit;
                         qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat :=
                           qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat + dCorrecaoMonetaria;
                         qryDemonstrativo.Post;
                       End Else Begin
                         If Trim(DbLkcAlterador.Text) <> '' Then Begin
                           dCorrecaoMonetaria := ( (qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat) -
                                                    qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat);
                           dCorrecaoMonetaria := StrToFloat(FormatFloat('#0.00',dCorrecaoMonetaria));
                           InsereCorrecaoMonetaria('C',qryBenefBfciario, sAnoMesAtual, dCorrecaoMonetaria,
                                                   iNumRecebimento);
                         End;
                       End;
                       { Fim Augusto 17/01/2005 }

                    end;
                 end;
                 qryContribuicoes.Next;
              end;

            End Else Begin { CONTRIBUIÇÃO SOBRE BENEFICIARIO }

              if (not bExcedeuLimite)  // CAMILLE - 27.10.2004
              then begin
                { Augusto 29/01/2004 - Calcular somente contribuições dos meses acertados }

                   //leofuncef - 28102005
                If (qryBenefBfciario.FieldByName('IDRESPONSAVEL').AsString =
                   qryBenefBfciario.FieldByName('IDPESSOA').AsString )
                   and (
                       ((sAnoMesAtual >= sAnoMesInicioAcerto) And
                       (sAnoMesAtual <= sAnoMesFimAcerto))
                       or ((copy(sAnoMesFimAcerto,6,2) <= '12') and (copy(sAnoMesAtual,6,2) = '13'))) //leocm - 14022006 { Augusto 19/01/2007 de < para <= }
                Then Begin
                  { Augusto 30/03/2004 - Abono já é calculado na Rotina de Contribuição  }
                  If (Copy(sAnoMesAtual,6,2) <> '13') Then Begin
                    { Inicio Augusto 10/12/2003 - Gerar contribuicoes por nucleo }
                    if not GeraContribBenef(QryContrib1, QryContrib2, QryAux,
                                            StrConcedidos,
                                            qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                            -1, { Somar todos os Lotes }
                                            sAnoMesAtual,
                                            sDataEvento,
                                            sAnoMesAtual,
                                            qryMotivo.FieldByName('IDMOTIVO').AsString,
                                            iIdLote, { Lote Revisão      }
                                            '',      { Data Encerramento }
                                            6,       { Origem 6, Revisão de Benenficio }
                                            '',
                                            sBeneficios { Augusto 09/10/2007 - Beneficios selecionados }
                                            )
                    then begin
                       dtmBaseDados.dbBaseDados.RollBack;
                       MsgDlg('Erro no preparo das contribuições do núcleo familiar. Verifique. ','Erro',mtError,[mbOk,mbHelp],0);
                       TiraSQL(qryAux);
                       Exit;
                    End;
                  End;

                  sSQL :='SELECT '+
                          '  CON.IDCONTRIBUICAO, CON.NOME, HCP.IDMOTIVO, ' +
                          '  SUM(HCP.VALORESPERADO) AS VALORESPERADO, HCP.FLGDEVOLUCAO, HCP.MESREFERENCIA, '+
                          '  P.NOME AS NOMERESPCONT, TRUNC(HCP.TRGDTINCLUSAO) '+
                          'FROM   '+
                          '  HSTCONTRIBPREV HCP, CONTRIBUICAO CON, CONTRIBPREVNUCLEO CN, PESSOA P '+
                          'WHERE  '+

                          '  HCP.IDPESSOA = '+ qryBenefBfciario.FieldByName('IDRESPONSAVEL').AsString +' AND '+

                          '  HCP.MESREFERENCIA  = '+ QuotedStr( sAnoMesAtual )                   +' AND '+
                          '  HCP.IDCONTRIBUICAO = CON.IDCONTRIBUICAO AND  '+
                          '  HCP.IDPESSOA       = P.IDPESSOA  '+
                          { Augusto 16/10/2007 - Novos filtros para pegar contribuição ativa no periodo }
                          '  AND HCP.IDCONTRIBUICAO  = CN.IDCONTRIBUICAO  '+
                          '  AND CN.IDNUCLEOFAMILIAR = '+ qryBenefBfciario.FieldByName('IDNUCLEOFAMILIAR').AsString +

                          '  AND TO_CHAR( CN.DATAINICIO, ''YYYY/MM'' ) <= ' + QuotedStr( sAnoMesAtual )+ ' ' +
                          '  AND ( ( CN.DATAFINAL IS NULL ) OR ( TO_CHAR( CN.DATAFINAL, ''YYYY/MM'' ) >= ' + QuotedStr( sAnoMesAtual )+ ') )  ' +

                          'GROUP BY '+
                          '  CON.IDCONTRIBUICAO, CON.NOME, HCP.MESREFERENCIA, HCP.FLGDEVOLUCAO, HCP.IDMOTIVO, '+


                          '  P.NOME, HCP.IDLOTE, TRUNC(HCP.TRGDTINCLUSAO) '+
                          'ORDER BY '+
                          '  TRUNC(HCP.TRGDTINCLUSAO)' ;


                  If FazQuery(QryAux,sSQL) Then Begin
                    qryDemonstrativo.Insert;
                    While Not QryAux.Eof Do Begin
                       qryDemonstrativo.FieldbyName('ANOMES').AsString := sAnoMesAtual;

                       //if (QryAux.FieldbyName('TRUNC(HCP.TRGDTINCLUSAO)').AsString <> datetostr(date)) then                  // ClaudioR - 19962 - 16/08/2007
                       if (QryAux.FieldbyName('TRUNC(HCP.TRGDTINCLUSAO)').AsString <> FormatDateTime('dd/mm/yyyy', date)) then // ClaudioR - 19962 - 16/08/2007
                       begin
                         { Augusto 09/03/2004 }
                         If QryAux.FieldbyName('FLGDEVOLUCAO').AsInteger= 0 Then Begin
                           qryDemonstrativo.FieldbyName('VALORANTES').AsFloat := qryDemonstrativo.FieldbyName('VALORANTES').AsFloat+
                                                                                 QryAux.FieldbyName('VALORESPERADO').AsFloat;
                         End Else Begin
                           qryDemonstrativo.FieldbyName('VALORANTES').AsFloat := qryDemonstrativo.FieldbyName('VALORANTES').AsFloat-
                                                                                 QryAux.FieldbyName('VALORESPERADO').AsFloat;
                         End;

                       End Else Begin

                          if QryAux.FieldbyName('FLGDEVOLUCAO').AsInteger = 0 then //leofuncef - 21012005
                          qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat  := QryAux.FieldbyName('VALORESPERADO').AsFloat *-1
                          else qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat  := QryAux.FieldbyName('VALORESPERADO').AsFloat;

                       end;

                       If QryAux.FieldbyName('FLGDEVOLUCAO').AsInteger= 0 Then Begin
                         qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat    :=
                           qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat +
                           QryAux.FieldbyName('VALORESPERADO').AsFloat;
                       End Else Begin
                         qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat    :=
                           qryDemonstrativo.FieldbyName('VALORDEPOIS').AsFloat -
                           QryAux.FieldbyName('VALORESPERADO').AsFloat;
                       End;
                       qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat    := qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat * dIndice;
                       qryDemonstrativo.FieldbyName('INDICE').AsFloat                := dIndice;

                       qryDemonstrativo.FieldbyName('TIPO').AsString          := 'C'; // contribuicao
                       { Inicio Augusto 17/01/2005 }
                       qryDemonstrativo.FieldbyName('IDTITULAR').AsString     := qryBenefBfciario.FieldByName('IDTITULAR').AsString;
                       qryDemonstrativo.FieldbyName('IDPLANOPREV').AsString   := qryBenefBfciario.FieldByName('IDPLANOPREV').AsString;
                       qryDemonstrativo.FieldbyName('IDPESSOA').AsString      := qryBenefBfciario.FieldByName('IDRESPONSAVEL').AsString;
                       qryDemonstrativo.FieldbyName('IDENTIFICADOR').AsString := QryAux.FieldByName('IDCONTRIBUICAO').AsString; { Augusto 17/01/2005 }
                       { Fim Augusto 17/01/2005 }
                       qryDemonstrativo.FieldbyName('DESCRICAO').AsString     := Copy(QryAux.FieldByName('NOME').AsString,1,30);

                       QryAux.Next;
                    End; { While }

                    { Augusto 05/03/2004 }
                    qryDemonstrativo.FieldbyName('NOMEBENEF').AsString := QryAux.FieldByName('NOMERESPCONT').AsString;
                    qryDemonstrativo.Post;
                    bPrimCont := False;

                     { Inicio Augusto 17/01/2005 - Novo calculo do Alterador }
                     //{ Augusto 27/12/2004 - Inserir diferença na HSTATRASOCONTRIB }
                     //If Trim(DbLkcAlterador.Text) <> '' Then Begin
                     { Augusto 05/01/2005 - Buscar NUMRECEBIMENTO para inserir na HSTATRASOCONTRIB }

                     sSQL := 'SELECT H.IDCONTRIBUICAO, H.NUMRECEBIMENTO FROM '+
                             'HSTCONTRIBPREV H WHERE H.NUMRECEBIMENTO =      '+
                             '(SELECT MAX(NUMRECEBIMENTO) AS NUMRECEBIMENTO  '+
                             ' FROM HSTCONTRIBPREV HCP '+
                             ' WHERE                   '+
                             '  HCP.IDPESSOA = '+ qryBenefBfciario.FieldByName('IDRESPONSAVEL').AsString +' AND '+
                             '  HCP.IDMOTIVO = '+ qryMotivo.FieldByName('IDMOTIVO').AsString             +' AND '+
                             '  HCP.IDLOTE   = '+ IntToStr(iIdLote)                                      +' AND '+
                             '  HCP.MESREFERENCIA  = '+ QuotedStr(sAnoMesAtual)                          +')    ';

                    If FazQuery(QryAux, sSQL) Then Begin
                      iNumRecebimento := qryAux.FieldByName('NUMRECEBIMENTO').AsInteger;
                      iIdContribuicao := qryAux.FieldByName('IDCONTRIBUICAO').AsInteger;

                      If iNumRecebimento > 0 Then Begin
                        If Trim(DbLkcAlterador.Text) = '' Then Begin
                          If Not CalculaAlteradores('C', sAnoMesAtual,
                                                    qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat,
                                                    dCorrecaoMonetaria,
                                                    iIdContribuicao, iNumRecebimento)
                          Then Begin
                            dtmBaseDados.dbBaseDados.RollBack;
                            MsgDlg('Erro no calculo dos alteradores.', 'Erro', mtError, [mbOk,mbHelp], 0);
                            TiraSQL(qryAux);
                            Exit;
                          End;
                          qryDemonstrativo.Edit;
                          qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat :=
                            qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat + dCorrecaoMonetaria;
                          qryDemonstrativo.Post;
                        End Else Begin
                          dCorrecaoMonetaria := ( (qryDemonstrativo.FieldbyName('DIFERENCACORRIGIDA').AsFloat) -
                                                   qryDemonstrativo.FieldbyName('DIFERENCA').AsFloat);
                          dCorrecaoMonetaria := StrToFloat(FormatFloat('#0.00',dCorrecaoMonetaria));
                          InsereCorrecaoMonetaria('C',qryBenefBfciario, sAnoMesAtual, dCorrecaoMonetaria,
                                                  iNumRecebimento);
                        End;
                      End;
                    End;
                    { Fim Augusto 17/01/2005 }

                  End;
                  // Fim Augusto 10/12/2003
                End;
              End;

            End; { Contribuições por Pencionista }

         End;

         sAnoMesAnt   := sAnoMesAtual; { Augusto 23/06/2004 }
         // Augusto 09/12/2003
         sAnoMesAtual := CalculaProximoMes(sAnoMesAtual, sAnoMesFim,
           //P.RAMOS-06/04/2006-PEND.22029-PARÂMETROS NOVOS PARA VERIFICAR SE DEVE PROCESSAR ABONO
           sAnoMesLote,
           qryBenefBfciario.FieldByName('MESPGABONO').AsString
           //P.RAMOS-06/04/2006-PEND.22029-FIM
         );

         { Augusto 24/03/2006 - Controlar o mes real de processamento }
         If ( Pos( '/13', sAnoMesAtual ) <= 0 ) Then Begin
           sAnoMesAtualReal := ProximoAnoMes( StrToInt( Copy( sAnoMesAtualReal, 6, 2 ) ),
                                              StrToInt( Copy( sAnoMesAtualReal, 1, 4 ) ) );
         End;

     End; // while mes <= mesfinal


     // INSERIR LINK COM A MEMORIA DE CALCULO
     if (iIdCalculo > 0) and (not bExcedeuLimite)  // CAMILLE - 27.10.2004
     then begin
        with qryAux do
        begin
           Close;
           SQL.Clear;
           SQL.Add(' INSERT INTO RELBENEFPART (IDPLANOPREV,    IDPESSJUR,    IDTITULAR,    NUMEROPROCESSO,  '+
                   '                            IDBENEFICIO,    IDPESSOA,     IDCALCULO,    SEQPROPOSTA,    '+
                   '                            IDTIPOCALCULO,  DATACALCULO,  FLGRECALCULO)                 '+
                   ' VALUES ('+qryBenefBfciario.FieldByName('IDPLANOPREV').AsString                      +','+
                               qryBenefBfciario.FieldByName('IDPESSJUR').AsString                        +','+
                               qryBenefBfciario.FieldByName('IDTITULAR').AsString                        +','+
                               qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsString                   +','+
                               qryBenefBfciario.FieldByName('IDBENEFICIO').AsString                      +','+
                               qryBenefBfciario.FieldByName('IDPESSOA').AsString                         +','+
                               IntToStr(iIdCalculo)                                                      +','+
                               qryBenefBfciario.FieldByName('SEQPROPOSTA').AsString                      +','+
                               'NULL,                                                                       '+
                               'SYSDATE,                                                                    '+
                               '0)                                                                          ');
           try
              ExecSQL;
           except
           end;
        end;

     end;

     if iIdUsuarioAutorizaVALOR > 0
     then iIdUsuarioAutoriza := iIdUsuarioAutorizaVALOR
     else iIdUsuarioAutoriza := iIdUsuarioAutorizaPERC;

     if  (not bExcedeuLimite )  // CAMILLE - 27.10.2004
     then begin
        CriaLogOcorrenciaRetroativo( qryBenefBfciario.FieldByName('IDPLANOPREV').AsString,
                                     qryBenefBfciario.FieldByName('IDPESSJUR').AsString,
                                     qryBenefBfciario.FieldByName('IDTITULAR').AsString,
                                     qryBenefBfciario.FieldByName('IDBENEFICIO').AsString,
                                     qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsString,
                                     qryBenefBfciario.FieldByName('IDPESSOA').AsString,
                                     qryBenefBfciario.FieldByName('SEQPROPOSTA').AsString,
                                     InttoStr(iTipoMov),
                                     //DateToStr(date),                  // ClaudioR - 19962 - 16/08/2007
                                     FormatDateTime('dd/mm/yyyy', Date), // ClaudioR - 19962 - 16/08/2007
                                     FloatToStr(dValorDevido),
                                     // Gleyber - 30/03/2004 - Pendência 16234 - Início
                                     qryBenefBfciario.FieldByName('VALORTOTAL').AsString,
                                     // Gleyber - 30/03/2004 - Pendência 16234 - Fim
                                     qryBenefBfciario.FieldByName('VALORCOTAS').AsString,
                                     qryBenefBfciario.FieldByName('DATAINICIO').AsString,
                                     qryBenefBfciario.FieldByName('DATAFINAL').AsString,
                                     qryBenefBfciario.FieldByName('VALORATUAL').AsString,
                                     qryBenefBfciario.FieldByName('DATAINICIO').AsString,
                                     qryBenefBfciario.FieldByName('DATAFINAL').AsString,
                                     qryBenefBfciario.FieldByName('IDSITBENEFICIO').AsString,
                                     qryBenefBfciario.FieldByName('FLGDATAPREVISTA').AsInteger,
                                     qryAux,
                                     '0',
                                     iIdLote,
                                     FloatToStr(dValorSRBRetorno),
                                     qryBenefBfciario.FieldByName('VALORSRB').AsString,
                                     iIdUsuarioAutoriza,
                                     iIdRetroativo, { Augusto 19/05/2005 }
                                     iIdMovBenef ); { Augusto 10/03/2006 }
     end;

     { Augusto 05/03/2004 - Somente se forem Aposentadorias }
     If qryBenefBfciario.FieldByName('IDTITULAR').AsInteger =
        qryBenefBfciario.FieldByName('IDPESSOA').AsInteger Then Begin
       if (qryBenefBfciario.FieldByName('FLGREFERENCIA').AsInteger = 0)
       then bCalculouContribuicoes := True;
     End;

     { Inicio Augusto 21/05/2004 }
     //If qryBenefBfciario.FieldByName('FLGPAGAINSS').AsString = '1' Then Begin
     //  rgrpRecalculaBeneficio.ItemIndex := 0;
     //End;
     { Fim Augusto 21/05/2004    }


     qryBenefBfciario.Next;
   end; // while not qryBenefBfciario.Eof do

   if qryReservaPart.Active and qryReservaPart.UpdatesPending then qryReservaPart.CancelUpdates;

   frmAguarde.Apaga;

end;

procedure TfrmRetroativoPREV.DesmarcarTodas1Click(Sender: TObject);
begin
  inherited;
  qryContribuicao.First;
  while not qryContribuicao.Eof do
  begin
     qryContribuicao.Edit;
     qryContribuicao.FieldbyName('PROCESSA').AsInteger := 0;
     qryContribuicao.Post;
     qryContribuicao.Next;
  end;
end;

procedure TfrmRetroativoPREV.MarcarTodas1Click(Sender: TObject);
begin
  inherited;
  qryContribuicao.First;
  while not qryContribuicao.Eof do
  begin
     qryContribuicao.Edit;
     qryContribuicao.FieldbyName('PROCESSA').AsInteger := 1;
     qryContribuicao.Post;
     qryContribuicao.Next;
  end;

end;

procedure TfrmRetroativoPREV.rbtnIndividualClick(Sender: TObject);
begin
  inherited;
  pgctrlEtapa1.Visible      := True;
  tbsEtapa1Lote.TabVisible  := False;
  tbsEtapa1Indiv.TabVisible := True;
  pgctrlEtapa1.ActivePage   := tbsEtapa1Indiv;

  if Trim(lblParticipante.caption) = '' Then
    //pnlTitulo.Caption := 'Cálculo Retroativo Individual - Matrícula : <a escolher> - Data : ' + DateToStr(date)                                         // ClaudioR - 19962 - 16/08/2007
    pnlTitulo.Caption := 'Cálculo Retroativo Individual - Matrícula : <a escolher> - Data : ' + FormatDateTime('dd/mm/yyyy', Date)                        // ClaudioR - 19962 - 16/08/2007
  else
    //pnlTitulo.Caption := 'Cálculo Retroativo Individual - Matrícula : '+MontaSelect.ValoresChave[15] + ' - Data : ' + DateToStr(date);                  // ClaudioR - 19962 - 16/08/2007
    pnlTitulo.Caption := 'Cálculo Retroativo Individual - Matrícula : '+MontaSelect.ValoresChave[15] + ' - Data : ' + FormatDateTime('dd/mm/yyyy', Date); // ClaudioR - 19962 - 16/08/2007

  { Augusto 14/06/2007 - Esses objetos não podem ser ativados  pois o usuário }
  { é quem deve definir o tipo de operação que ele deseja executar.           }

  // Gleyber - 20/11/2006 - Pendência 23780 - Início
  //chkTipoIndivCadastral.Checked        := True;
  //chkTipoIndivFuncional.Checked        := True;
  //chkTipoIndivOpcaoContrib.Checked     := True;
  //chkTipoIndivTipoBeneficio.Checked    := True;
  //chkTipoIndivRevisaoBeneficio.Checked := True;
  // Gleyber - 20/11/2006 - Pendência 23780 - Fim

  ChBxSomentePlanoAtivo.Checked        := False; { Augusto 14/06/2007 }

end;

procedure TfrmRetroativoPREV.rbnLoteClick(Sender: TObject);
begin
  inherited;
  pgctrlEtapa1.Visible      := True;
  tbsEtapa1Lote.TabVisible  := True;
  tbsEtapa1Indiv.TabVisible := False;
  pgctrlEtapa1.ActivePage   := tbsEtapa1Lote;
  //pnlTitulo.Caption := 'Cálculo Retroativo Em Lote - Data : '+DateToStr(date);                    // ClaudioR - 19962 - 16/08/2007
  pnlTitulo.Caption := 'Cálculo Retroativo Em Lote - Data : ' + FormatDateTime('dd/mm/yyyy', date); // ClaudioR - 19962 - 16/08/2007

  // Gleyber - 20/11/2006 - Pendência 23780 - Início
  chkTipoIndivCadastral.Checked        := False;
  chkTipoIndivFuncional.Checked        := False;
  chkTipoIndivOpcaoContrib.Checked     := False;
  chkTipoIndivTipoBeneficio.Checked    := False;
  chkTipoIndivRevisaoBeneficio.Checked := False;
  // Gleyber - 20/11/2006 - Pendência 23780 - Fim
end;

procedure TfrmRetroativoPREV.MenuItem1Click(Sender: TObject);
begin
  inherited;
  qryBeneficioEscolher.First;
  while not qryBeneficioEscolher.Eof do
  begin
     qryBeneficioEscolher.Edit;
     qryBeneficioEscolher.FieldbyName('PROCESSA').AsInteger := 0;
     qryBeneficioEscolher.Post;
     qryBeneficioEscolher.Next;
  end;

end;

procedure TfrmRetroativoPREV.MenuItem2Click(Sender: TObject);
begin
  inherited;
  qryBeneficioEscolher.First;
  while not qryBeneficioEscolher.Eof do
  begin
     qryBeneficioEscolher.Edit;
     qryBeneficioEscolher.FieldbyName('PROCESSA').AsInteger := 1;
     qryBeneficioEscolher.Post;
     qryBeneficioEscolher.Next;
  end;

end;

procedure TfrmRetroativoPREV.CriaLogOcorrenciaRetroativo( sIdPlanoprev,
                             sIdPessjur,
                             sIdTitular,
                             sIdBeneficio,
                             sNumProcesso,
                             sIdPessoa,
                             sSeqProposta,
                             sTipoMov,
                             sDataMov,
                             sValorAtual,
                             sValorTotal,
                             sValorCotas,
                             sDataInicio,
                             sDataFinal,
                             sValorAtualAnt,
                             sDataInicioAnt,
                             sDataFinalAnt,
                             sIdSitBenefAnt  : string;
                             iFlgDataPrevAnt : integer;
                             qryAux          : TwwQuery;
                             sMotivo         : String;
                             piIdLote        : longint;
                             psValorSRB,
                             psValorSRBAnt      : string;
                             piIdUsuarioAutoriza,
                             piIdRetroativo : longint;      { Augusto 19/05/2005 }
                             piIdMovBenef   : longint = -1  { Augusto 10/03/2006 }
                             ); // CAMILLE - 06.07.2004
var
  sql,sIdMovBenef : string;
begin

  { Inicio Augusto 10/03/2006 - Utilizar o parametro passado caso exista }
  If piIdMovBenef = -1 Then Begin
    sIdMovBenef   := IntToStr( LeUltRegistro(nil, 'MOVBENEF') );
  End Else Begin
    sIdMovBenef   := IntToStr( piIdMovBenef );
  End;
  { Fim Augusto 10/03/2006 }

  if Trim(sDataMov) = ''
  then sDataMov := ' NULL '
  else sDataMov := ' TO_DATE('''+sDataMov+''', ''DD/MM/YYYY'')';

  if Trim(sDataInicio) = ''
  then sDataInicio  := ' NULL '
  else sDataInicio  := ' TO_DATE('''+sDataInicio+''', ''DD/MM/YYYY'')';

  if Trim(sDataFinal) = ''
  then sDataFinal    := ' NULL '
  else sDataFinal    := ' TO_DATE('''+sDataFinal+''', ''DD/MM/YYYY'')';

  if Trim(sDataInicioAnt) = ''
  then sDataInicioAnt := ' NULL '
  else sDataInicioAnt := ' TO_DATE('''+sDataInicioAnt+''', ''DD/MM/YYYY'')';

  if Trim(sDataFinalAnt) = ''
  then sDataFinalAnt  := ' NULL '
  else sDataFinalAnt  := ' TO_DATE('''+sDataFinalAnt+''', ''DD/MM/YYYY'')';

  if Trim(sIdSitBenefAnt) = ''
  then sIdSitBenefAnt := ' NULL ';

  if Trim(sMotivo) = ''
  then sMotivo    := ' NULL ';
  

  // CGUEDES - 20/06/2002
  sql := 'INSERT INTO MOVBENEF (IDMOVBENEF,   IDPLANOPREV, IDPLANOORIGEM,    IDPESSJUR,  IDTITULAR,     '+
               '                IDBENEFICIO,  NUMEROPROCESSO, IDPESSOA,   SEQPROPOSTA,                  '+
               '                TIPOMOV,      DATAMOV,        VALORATUAL, VALORTOTAL,                   '+
               '                VALORCOTAS,   DATAINICIO,     DATAFINAL,  DATAINICIOANT,                '+
               '                DATAFINALANT, VALORATUALANT,  IDSITANTERIOR, FLGDATAPREVANT, MOTRETENC, '+
               '                IDLOTEMOV,VALORSRB,VALORSRBANT, USUARIOALT, IDRETROATIVO )              '; // CAMILLE - 06.07.2004
  sql := sql + ' VALUES ('+sIdMovBenef+','+sIdPlanoprev+','+sIdPlanoprev+','+sIdPessjur+','+sIdTitular+',';
  sql := sql              +sIdBeneficio+','+sNumProcesso+','+sIdPessoa+','+sSeqProposta+',';

  sql := sql              +sTipoMov                  +','+
                           sDataMov                  +','+
                           OraNumero(sValorAtual)    +','+
                           OraNumero(sValorTotal)    +','+
                           OraNumero(sValorCotas)    +','+
                           sDataInicio               +','+
                           sDataFinal                +','+
                           sDataInicioAnt            +','+
                           sDataFinalAnt             +','+
                           OraNumero(sValorAtualAnt) +','+
                           sIdSitBenefAnt            +','+
                           IntToStr(iFLgDataPrevAnt) +','+
                           sMotivo                   +',';

  if piIdLote > 0
  then SQL := SQL + IntToStr(piIdLote)
  else SQL := SQL + 'NULL';

  SQL := SQL + ','+OraNumero(psValorSRB);
  SQL := SQL + ','+OraNumero(psValorSRBAnt);

  if piIdUsuarioAutoriza > 0
  then SQL := SQL + ','+IntToStr(piIdUsuarioAutoriza)
  else SQL := SQL + ', NULL ';

  if piIdRetroativo > 0
  then SQL := SQL + ','+IntToStr(piIdRetroativo)
  else SQL := SQL + ', NULL ';

  SQL := SQL + ')';

  qryaux.close;
  qryaux.SQL.clear;
  qryaux.sql.Add(sql);
  qryaux.ExecSQL;
end;

procedure TfrmRetroativoPREV.dblkpcmbListaBeneficioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (qryBeneficiosTrocar.State = dsEdit) or (qryBeneficiosTrocar.State = dsInsert)
  then begin
     qryBeneficiosTrocar.FieldByName('NOVONOME').AsString := qryListaBeneficio.FieldByName('NOME').AsString;
  end;
end;

function TfrmRetroativoPREV.CalculaReservaParaBeneficio (piIdRegraReserva  : longint;
                                                         var pdValorReservaCota : double;
                                                         psAnoMesRef : String): double;
var dTotReservaReal,
    dTotReservaCota,
    dValorReservaCota,
    dValorDaCota    : double;
    sDataRef,
    sDataInicio,
    sValorProvento,
    sValorAtualReserva,
    sValorReservaCota,
    sValorTotReservaReal,
    sSaldoFinalReserva,
    sSQLReserva     : string;
    bErro           : boolean;
    iNumReg,
    iTotReserva,
    iIdPessoaHst,
    iFlgUltimo      : integer;
begin
   Result := 0;

   if qryReservaPart.IsEmpty
   then Exit;

   sDataRef    := '01/'+
                  Copy( psAnoMesRef, 6, 2 ) + '/' +
                  Copy( psAnoMesRef, 1, 4 );

   sDataInicio := qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString;

   // Se tiver regra de calculo de reserva para pagamento
   // Entao utilizar a regra
   // Senao converter as reservas para real e somá-las
   if piIdRegraReserva > 0
   then begin
     sValorProvento := CalcSALPART( qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                    qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                    Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2),
                                    qryAux);
     sSQLReserva := '';
     iNumReg     := 0;
     iFlgUltimo  := 0;
     iTotReserva := qryReservaPart.RecordCount;
     qryReservaPart.First;

     // Executar a regra de reserva para beneficio para cada reserva.
     // A regra retornará o valor em cotas que será usado da reserva para calcular o
     // valor do benefício. Este valor deve ser guardado na MOVRESERVATEMP
     // Quando acabar de executar a regra para todas as reservas, executá-la mais
     // uma vez para a regra retornar o valor total em real da reserva para benefício
     while (not qryReservaPart.Eof) or (iNumReg <= iTotReserva) do
     begin
        inc(iNumReg);

        // Quando a variavel iNumReg for > que a variavel iTotReserva significa que
        // já rodei a regra para todas as reservas e estou rodando a ultima vez para
        // pegar o total em real das reservas
        if iNumReg > iTotReserva
        then iFlgUltimo := 1;

        //se for o valor atual deve ser passado como o somatório
        //dos valorres abatidos
        if iFlgUltimo = 1
        then sValorAtualReserva := OraNumero(FloatToStr(dTotReservaReal))
        else sValorAtualReserva := OraNumero(qryReservaPart.FieldByName('VALORRESERVA').AsString);



        sSQLReserva := ' SELECT '+IntToStr(iNumReg)                                                           +'    AS CONTRESERVA,    '+
                                IntToStr(iFlgUltimo)                                                          +'    AS ULTRESERVA,     '+
                                qryReservaPart.FieldByName('IdTipoReserva').AsString                          + '   AS IDTIPORESERVA,  '+
                                qryReservaPart.FieldByName('IdPessJur').AsString                              + '   AS IDPESSJUR,      '+
                                qryReservaPart.FieldByName('IdPlanoPrev').AsString                            + '   AS IDPLANOPREV,    '+
                                qryReservaPart.FieldByName('IdPessoa').AsString                               + '   AS IDPESSOA,       '+
                                qryReservaPart.FieldByName('SeqProposta').AsString                            + '   AS SEQPROPOSTA,    '+
                                ''''+qryReservaPart.FieldByName('FLGDESCIRRF').AsString                       + ''' AS FLGDESCIRRF,    '+
                                qryBenefBfciario.FieldByName('IDBENEFICIO').AsString                          + '   AS IDBENEFICIO,    '+
                                OraNumero(sValorProvento)                                                     + '   AS VALORPROVENTO,  '+
                                sValorAtualReserva                                                            + '   AS VALORRESERVA,   '+
                                ''''+qryReservaPart.FieldByName('MoeSigla').AsString                          + ''' AS MOESIGLA,       '+
                                ''''+PreparaStrRegra(sDataInicio)                                             + ''' AS DATAINICIO,     '+
                                ''''+PreparaStrRegra(sDataRef)                                                + ''' AS DATAREF,        '+
                                ''''+PreparaStrRegra(qryReservaPart.FieldByName('DATAREFERENCIASA').AsString) + ''' AS DATAREFERENCIASA, '+
                                ''''+PreparaStrRegra(qryReservaPart.FieldByName('DATANASC').AsString)         +'''  AS DATANASC,         '+
                                ''''+PreparaStrRegra(qryBenefBfciario.FieldByName('INSCRICAODATA').AsString)  +'''  AS INSCRICAODATA,    '+
                                ''''+PreparaStrRegra(qryBenefBfciario.FieldByName('DTINICIOINSC').AsString)   +'''  AS DTINICIOINSC,    '+
                                ''''+PreparaStrRegra(qryBenefBfciario.FieldByName('DATACANCELAMENTO').AsString)+''' AS DATACANCELAMENTO, '+
                                ''''+qryReservaPart.FieldByName('DATAADMISSAO').AsString                      +'''    AS DATAADMISSAO,   '+
                                ''''+qryReservaPart.FieldByName('CODHIERARQUIA').AsString                     +'''    AS CODHIERARQUIA,  '+
                                ''''+qryReservaPart.FieldByName('INDICEREAJUSTE').AsString                    +'''    AS INDICEREAJUSTE, '+
                                ''''+qryReservaPart.FieldByName('FLGCONTROLE').AsString                       +'''    AS FLGCONTROLE,    '+
                                ''''+PreparaStrRegra(Trim(qryBenefBfciario.FieldByName('DATAREQUERIMENTO').AsString) )        +'''    AS DATAREQUERIMENTO,              '+
                                ''''+PreparaStrRegra(Trim(qryBenefBfciario.FieldByName('DATAINICIO').AsString)) +'''    AS DATAINICIOPAGTO, '+
                                ''''+PreparaStrRegra(qryBenefBfciario.FieldByName('FLGINTERNO').AsString)     +''' AS FLGINTERNOANT, '+
                                ''''+PreparaStrRegra(qryBenefBfciario.FieldByName('FLGINTERNO').AsString)     +''' AS FLGINTERNO, '+
                                ''''+PreparaStrRegra(qryBenefBfciario.FieldByName('IDSITPART').AsString)      +''' AS IDSITPARTATUAL, '+
                                ''''+PreparaStrRegra(qryBenefBfciario.FieldByName('IDSITPLANOPREV').AsString) +''' AS IDSITPLANOATUAL, '+
                                ''''+PreparaStrRegra(qryBenefBfciario.FieldByName('IDSITFUNC').AsString)      +''' AS IDSITFUNCATUAL, '+
                                ''''+PreparaStrRegra(qryBenefBfciario.FieldByName('IDSITPART').AsString)      +''' AS IDSITPARTNOVO, '+
                                ''''+PreparaStrRegra(qryBenefBfciario.FieldByName('IDSITPLANOPREV').AsString) +''' AS IDSITPLANONOVO, '+
                                ''''+PreparaStrRegra(qryBenefBfciario.FieldByName('IDSITFUNC').AsString)      +''' AS IDSITFUNCNOVO, '+
                                ''''+OraNumero(qryReservaPart.FieldByName('PERCENTUALSAQUE').AsString)        +''' AS PERCENTUALSAQUE, '+
                                OraNumero(qryBenefBfciario.FieldByName('VALORBASE1').AsString)                + ' AS VALORBASE1, '+
                                OraNumero(qryBenefBfciario.FieldByName('VALORBASE2').AsString)                + ' AS VALORBASE2, '+
                                OraNumero(qryBenefBfciario.FieldByName('VALORBASE3').AsString)                + ' AS VALORBASE3  '+
                    ' FROM DUAL ';

        // Quando a variavel iNumReg for > que a variavel iTotReserva significa que
        // já rodei a regra para todas as reservas e estou rodando a ultima vez para
        // pegar o total em real das reservas
        if iNumReg <= iTotReserva
        then begin
           sValorReservaCota    := RegraNumerica( IntToStr(piIdRegraReserva), sSQLReserva, bErro, iIdCalculo );

           if bErro
           then begin
              MsgDlg('Erro na Regra de Cálculo de Reserva para Benefício Nº '+IntToStr(piIdRegraReserva)+'.',
                     'Erro',mtError,[mbOk, mbHelp],0);
              dValorReservaCota := 0;
              break;
           end
           else

           { Inicio Augusto 24/10/2007 - Executar abatimento das reservas utilizadas para }
           { calculo do beneficio.                                                        }
           Begin

             dValorReservaCota := StrToFloat( ClienteNumero( sValorReservaCota ) );

             If ( dValorReservaCota > 0 ) Then
             Begin

               iIdPessoaHst := QryBenefBfciario.FieldByName('IDPESSOA').AsInteger;

               sSaldoFinalReserva := FloatToStr( StrToFloat( ClienteNumero( sValorAtualReserva ) ) - dValorReservaCota );

               If ( Not AlimentaHistorico( QryAux,

                                           QryReservaPart.FieldByName('IDPESSJUR').AsString,
                                           QryReservaPart.FieldByName('IDPLANOPREV').AsString,
                                           QryReservaPart.FieldByName('IDTIPORESERVA').AsString,
                                           QryReservaPart.FieldByName('IDPESSOA').AsString,
                                           QryReservaPart.FieldByName('SEQPROPOSTA').AsString,

                                           ClienteNumero( sValorReservaCota ),
                                           ClienteNumero( sSaldoFinalReserva ),

                                           QryBenefBfciario.FieldByName('IDBENEFICIO').AsString,

                                           '',                            // IDCONTRIBUICAO
                                           '',                            // IDEVENTOGERADOR
                                           IntToStr( piIdRegraReserva ),  // SIDREGRA,
                                           psAnoMesRef,                   // MESREFERENCIA
                                           0,                             // iFLGENTRADA = SAIDA
                                           Date,                          // DATA
                                           False,                         // bEXCEDENTE

                                           StrToDate( sDataRef ),         // DATAREFINDICE

                                           qryBenefBfciario.FieldByName('IDTITULAR').AsString,           // IDPARTICIPANTE

                                           iIdPessoaHst ) )               // IDPESSOAHST
               Then Begin

                 MsgDlg( 'Erro na alimentação do histórico de reserva.', 'Erro', mtError, [mbOk, mbHelp], 0 );
                 Result := 0;

                 Break;

               End;

               sSQL := ' UPDATE RESERVAPART SET VALORRESERVA = VALORRESERVA - '+ OraNumero( sValorReservaCota )+' '+
                       ' WHERE  IDPESSOA       = '+QryReservaPart.FieldByName('IDPESSOA').AsString+
                       ' AND    IDPESSJUR      = '+QryReservaPart.FieldByName('IDPESSJUR').AsString+
                       ' AND    IDPLANOPREV    = '+QryReservaPart.FieldByName('IDPLANOPREV').AsString+
                       ' AND    SEQPROPOSTA    = '+QryReservaPart.FieldByName('SEQPROPOSTA').AsString+
                       ' AND    IDTIPORESERVA  = '+QryReservaPart.FieldByName('IDTIPORESERVA').AsString;

               If Not ExecutarQuery( QryAux, sSQL ) Then
               Begin

                 MsgDlg( 'Erro ao atualizar saldo da reserva.', 'Erro', mtError, [mbOk, mbHelp], 0 );
                 Result := 0;


                 Break;
               End;


             End; { If ( dValorReservaCota > 0 ) Then }

           End; { If bErro }

           { Fim Augusto 24/10/2007                                                       }


           //leorefer - 2711 - inicio
           //acumula valor a ser usado na regra de benefício
           //que é o valor a ser abatido
           dValorDaCota    := VoltaValorCotacao(qryaux,
                                                qryReservaPart.FieldByName('INDICEREAJUSTE').AsString,'','',
                                                sDataRef);

           dTotReservaReal := dTotReservaReal + ( dValorReservaCota * dValorDaCota );
           dTotReservaCota := dTotReservaCota + dValorReservaCota;

           if qryBenefBfciario.FieldByName('FLGRESGATE').AsInteger = 1
           then begin
                 qryReservaPart.Edit;
                 qryReservaPart.FieldByName('VALORRESERVA').AsFloat         := qryReservaPart.FieldByName('ValorReserva').AsFloat - dValorReservaCota;
                 qryReservaPart.Post;
//                 MSGDLG('TESTE 2 - CODIGO : '+qryMovReservaTemp.fieldByname('idtiporeserva').AsString+'- valor '+
//                                             qryMovReservaTemp.fieldByname('VLRABATIDO').asstring,'TESTE 3',MTINFORMATION,[MBOK],0);
           end;
           qryReservaPart.Next;
        end
        else begin
           sValorTotReservaReal := RegraNumerica( IntToStr(piIdRegraReserva), sSQLReserva, bErro, iIdCalculo );

           if bErro
           then begin
              MsgDlg('Erro na Regra de Cálculo de Reserva para Benefício Nº '+IntToStr(piIdRegraReserva)+'.',
                     'Erro',mtError,[mbOk, mbHelp],0);
              dTotReservaReal := 0;
              break;
           end
           else dTotReservaReal := StrToFloat(ClienteNumero(sValorTotReservaReal));
        end;

     end; // while
   end
   else begin
       dTotReservaReal := 0;
       qryReservaPart.First;
       while not qryReservaPart.Eof do
       begin
           if qryReservaPart.FieldByName('ValorReserva').AsString <> ''
           then begin
              dValorDaCota  := VoltaValorCotacao(qryaux,
                                                 qryReservaPart.FieldByName('INDICEREAJUSTE').AsString,'','',
                                                 sDataRef);

              dTotReservaReal := dTotReservaReal + (  qryReservaPart.FieldByName('ValorReserva').AsFloat
                                                    * dValorDaCota );
              dTotReservaCota := dTotReservaCota + qryReservaPart.FieldByName('ValorReserva').AsFloat;

              // Atualizar/inserir reserva na qryMovReservaTemp
              if qryBenefBfciario.FieldByName('FLGRESGATE').AsInteger = 1
              then begin
                 qryReservaPart.Edit;
                 qryReservaPart.FieldByName('VALORRESERVA').AsFloat         := 0;
                 qryReservaPart.Post;
              end;
           end;
           qryReservaPart.Next;
       end;
   end;


   try
     OraNumero(FloatToStr(dTotReservaReal));
   except
     MsgDlg('O valor calculado para a reserva é inválido. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
   end;

   pdValorReservaCota := dTotReservaCota;
   Result := dTotReservaReal;
end;

procedure TfrmRetroativoPREV.rgrpEtapa3FiltraClick(Sender: TObject);
begin
  inherited;
  if rgrpEtapa3Filtra.ItemIndex = 0
  then begin
     grpEtapa3FiltraContrib.Visible   := False;
     grpEtapa3FiltraBenef.Visible     := False;
  end
  else begin
     grpEtapa3FiltraContrib.Visible   := True;
     grpEtapa3FiltraBenef.Visible     := True;
  end;
end;

procedure TfrmRetroativoPREV.LimpaDadosPESSOA;
begin
   lblParticipante.Caption  := '';
   lblPatro.Caption         := '';
   lblPlano.Caption         := '';
   lblNUmProc.Caption       := '';
   lblDIB.Caption           := '';
   lblBeneficio.Caption     := '';
   lblBeneficiario.Caption  := '';
   iIdTitular               := -1;
   iIdPessoa                := -1;
   iSeqProposta             := -1;
   iIdPessJur               := -1;
   iIdPlanoPrev             := -1;
   lblSituacaoAtual.Caption := '';
   lblMatricula.Caption     := '';
   dblkpcmbVinculaFunc.Text := '';

   qryOpcaoContribuicao.CancelUpdates;
   qryOpcaoContribuicao.Close;
   qryOpcaoContribuicao.ParamByName('IDPESSJUR').AsInteger      := iIdPessJur;
   qryOpcaoContribuicao.ParamByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
   qryOpcaoContribuicao.ParamByName('IDPESSOA').AsInteger       := iIdTitular;
   qryOpcaoContribuicao.ParamByName('SEQPROPOSTA').AsInteger    := 1;
   qryOpcaoContribuicao.ParamByName('ANOMESINI').AsString       := '0000/00';
   qryOpcaoContribuicao.ParamByName('ANOMESFIM').AsString       := '0000/00';
   qryOpcaoContribuicao.Open;

   qryDadosBeneficio.CancelUpdates;
   qryDadosBeneficio.Close;
   qryDadosBeneficio.ParamByName('IDPESSJUR').AsInteger      := iIdPessJur;
   qryDadosBeneficio.ParamByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
   qryDadosBeneficio.ParamByName('IDTITULAR').AsInteger      := iIdTitular;
   qryDadosBeneficio.ParamByName('IDPESSOA').AsInteger       := iIdPessoa;
   qryDadosBeneficio.ParamByName('SEQPROPOSTA').AsInteger    := 1;
   { Augusto 28/01/2004}
   //qryDadosBeneficio.ParamByName('ANOMESINI').AsString       := '0000/00';
   { Augusto 04/05/2004 }
   //qryDadosBeneficio.ParamByName('ANOMESFIM').AsString       := '0000/00';
   qryDadosBeneficio.Open;

end;


procedure TfrmRetroativoPREV.PreencheDadosPESSOA;
begin
   qryDadosPessoa.Close;
   qryDadosPessoa.ParamByName('IDPESSJUR').AsInteger      := iIdPessJur;
   qryDadosPessoa.ParamByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
   qryDadosPessoa.ParamByName('IDTITULAR').AsInteger      := iIdTitular;
   qryDadosPessoa.ParamByName('IDPESSOA').AsInteger       := iIdPessoa;
   qryDadosPessoa.Open;
   with qryDadosPessoa do
   begin
      dtDataNasc.Text  := FieldbyName('DATANASC').AsString;
      dtDataMorte.Text := FieldbyName('DATAMORTE').AsString;

      if iIdTitular <> iIdPessoa
      then begin
         dblkpcmbTipoDependencia.Visible := True;
         lblTituloGrauParentesco.Visible := True;
         if FieldbyName('IDDEPENDENCIA').AsString <> ''
         then begin
            qryDependencia.Locate('IDDEPENDENCIA',FieldbyName('IDDEPENDENCIA').AsString,[]);
            dblkpcmbTipoDependencia.Text := qryDependencia.FieldByName('DESCRICAO').AsString;
         end
         else dblkpcmbTipoDependencia.Text := '';
      end
      else begin
         lblTituloGrauParentesco.Visible := False;
         dblkpcmbTipoDependencia.Visible := False;
      end;

      if FieldbyName('CODVINCULAFUNC').AsString <> ''
      then begin
         qryVinculaFunc.Locate('CODVINCULAFUNC',FieldbyName('CODVINCULAFUNC').AsString,[]);
         dblkpcmbVinculaFunc.Text := qryVinculaFunc.FieldByName('DESCRICAO').AsString;
      end
      else dblkpcmbVinculaFunc.Text := '';

      // Gleyber - 25/07/2006 - Pendência 22731 - Início
      if FieldbyName('DESCRICAO').AsString <> ''
      then begin
         qrySitPart.Locate('DESCRICAO',FieldbyName('DESCRICAO').AsString,[]);
         dblkpcmbSituacaoFundacao.Text := qrySitPart.FieldByName('DESCRICAO').AsString;
         dblkpcmbSituacaoFundacao.LookupValue := qrySitPart.FieldByName('IDSITPART').AsString;
      end
      else dblkpcmbVinculaFunc.Text := '';
      // Gleyber - 25/07/2006 - Pendência 22731 - Fim

      if fieldbyname('ESTCIVIL').AsString = '' then
      begin
         cmbEstCiv.itemindex := -1;
         cmbEstCiv.text := '';
      end
      else if fieldbyname('ESTCIVIL').AsString = 'S' then
      begin
         cmbEstCiv.itemindex := 0;
         cmbEstCiv.text := 'Solteiro(a)';
      end
      else if fieldbyname('ESTCIVIL').AsString = 'C' then
      begin
         cmbEstCiv.itemindex := 1;
         cmbEstCiv.text := 'Casado(a) ou Equiparado(a)';
      end
      else if fieldbyname('ESTCIVIL').AsString = 'D' then
      begin
         cmbEstCiv.itemindex := 2;
         cmbEstCiv.text := 'Divorciado(a)';
      end
      else if fieldbyname('ESTCIVIL').AsString = 'E' then
      begin
         cmbEstCiv.itemindex := 3;
         cmbEstCiv.text := 'Desquitado(a)';
      end
      else if fieldbyname('ESTCIVIL').AsString = 'J' then
      begin
         cmbEstCiv.itemindex := 4;
         cmbEstCiv.text :=  'Separado(a) Judicial';
      end
      else if fieldbyname('ESTCIVIL').AsString = 'V' then
      begin
         cmbEstCiv.itemindex := 5;
         cmbEstCiv.text :=  'Viúvo(a)';
      end
      else if fieldbyname('ESTCIVIL').AsString = 'M' then
      begin
         cmbEstCiv.itemindex := 6;
         cmbEstCiv.text := 'Marital';
      end
      else if fieldbyname('ESTCIVIL').AsString = 'P' then
      begin
         cmbEstCiv.itemindex := 7;
         cmbEstCiv.text := 'Separado(a)';
      end
      else if fieldbyname('ESTCIVIL').AsString = 'O' then
      begin
         cmbEstCiv.itemindex := 8;
         cmbEstCiv.text := 'Outros';
      end;

      if FieldByName('SEXO').AsString = 'M'
      then grpSexo.ItemIndex := 0
      else grpSexo.ItemIndex := 1;

      if FieldByName('FLGMOLESTIAGRAVE').AsInteger = 1
      then grpMolestiaGrave.ItemIndex := 0
      else grpMolestiaGrave.ItemIndex := 1;

      if FieldByName('FLGINVALIDO').AsInteger = 1
      then grpInvalido.ItemIndex := 0
      else grpInvalido.ItemIndex := 1;

      if FieldByName('FLGISENTOIRRF').AsInteger = 1
      then grpIsentoIR.ItemIndex := 0
      else grpIsentoIR.ItemIndex := 1;

      if FieldByName('FLGDIRETOR').AsInteger = 0
      then grpCargoDiretoria.ItemIndex := 0
      else grpCargoDiretoria.ItemIndex := 1;

      dtDataAdmissao.Text   := FieldByName('DATAADMISSAO').AsString;
      dtDataInscricao.Text  := FieldByName('INSCRICAODATA').AsString;
      dtDataDemissao.Text   := FieldByName('DATADEMISSAO').AsString;
      dtDataReadmissao.Text := FieldByName('DATAREADMISSAO').AsString;
      edTempoServAnt.Text   := FieldByName('TEMPOSERVANTERIOR').AsString;
   end;
end;

procedure TfrmRetroativoPREV.edAnoMesIniExit(Sender: TObject);
begin
  inherited;
  { Augusto 31/03/2004 }
  //if (Trim(edAnoMesIniAcerto.Text) = '') or (Trim(edAnoMesIniAcerto.Text) = '/') then
  edAnoMesIniAcerto.Text := edAnoMesIni.Text;
end;

procedure TfrmRetroativoPREV.edAnoMesFimExit(Sender: TObject);
begin
  inherited;
  { Augusto 31/03/2004 }
  //if (Trim(edAnoMesFimAcerto.Text) = '') or (Trim(edAnoMesFimAcerto.Text) = '/') then
  edAnoMesFimAcerto.Text := edAnoMesFim.Text;
end;

procedure TfrmRetroativoPREV.grpMolestiaGraveClick(Sender: TObject);
begin
  inherited;
  // FlgMolestiaGrave . Caso Afirmativo, insere Data Moléstia Grave - Lise
  if  grpMolestiaGrave.ItemIndex = 0
  then grpIsentoIR.ItemIndex := 0;
end;

function TfrmRetroativoPrev.GravaLogDadosAlterados( psTabela      : string;
                                                    psCampo       : string;
                                                    psValorAntes  : string;
                                                    psValorDepois : string;
                                                    psDescricao   : string ) : boolean;
var iIdAlteracao : longint;
begin
   Result := False;

   // Só gravar se o dado mudou
   if Trim(psValorAntes) = Trim(psValorDepois)
   then begin
      Result := True;
      Exit;
   end;

   if not ValidaAlteracao( psTabela, psCampo, psValorAntes, psValorDepois)
   then Exit;

   // Verificar se o identificador do retroativo já foi gerado
   if iIdRetroativo <= 0 then Exit;



   // Gravar alteração
   iIdAlteracao := LeUltRegistro(nil,'RETROATIVOXALT');
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' INSERT INTO RETROATIVOXALT (                           '+
                  '        IDRETROATIVO,   IDALTERACAO, TABELA,     CAMPO, '+
                  '        VALORANTERIOR,  NOVOVALOR,   DESCRICAO )        '+
                  ' VALUES                     (                           '+
                  IntToStr(iIdRetroativo)                               +','+
                  IntToStr(iIdAlteracao)                                +','+
                  ''''+psTabela+'''                                       ,'+
                  ''''+psCampo+'''                                        ,'+
                  ''''+psValorAntes+'''                                   ,'+
                  ''''+psValorDepois+'''                                  ,'+
                  ''''+psDescricao+'''                                    )');
   try
      qryAux.ExecSQL;
   except
      Exit;
   end;
   Result := True;

end;

function TfrmRetroativoPrev.ValidaAlteracao( psTabela      : string;
                                             psCampo       : string;
                                             psValorAntes  : string;
                                             psValorDepois : string ) : boolean;
begin
   Result := False;
   // Verificar dados que não podem ser alterados
   // 1. Dados Cadastrais
   if (UpperCase(psCampo) = 'DATAMORTE') and (psValorAntes = '') and (psValorDepois <> '')
   then begin
      if not chkGravaDemons.Checked
      then mmResult.Lines.Add('      [ERRO ] Data do Falecimento não alterada. Registre o Evento de Falecimento. ');
      If CkbxGravaDemo.Checked Then { Agusto 21/12/2004 }
        GravaLinhaTXT('      [ERRO ] Data do Falecimento não alterada. Registre o Evento de Falecimento. ');
   end;

   if (UpperCase(psCampo) = 'DATAMORTE') and (psValorAntes <> '') and (psValorDepois = '')
   then begin
      if not chkGravaDemons.Checked
      then mmResult.Lines.Add('      [ERRO ] Data do Falecimento não alterada. Data nula não permitida. ');
      If CkbxGravaDemo.Checked Then { Agusto 21/12/2004 }
        GravaLinhaTXT('      [ERRO ] Data do Falecimento não alterada. Data nula não permitida. ');
   end;

   if (UpperCase(psCampo) = 'DATANASC') and (psValorDepois = '')
   then begin
      if not chkGravaDemons.Checked
      then mmResult.Lines.Add('      [ERRO ] Data de Nascimento não alterada. Data nula não permitida. ');
      If CkbxGravaDemo.Checked Then { Agusto 21/12/2004 }
        GravaLinhaTXT('      [ERRO ] Data de Nascimento não alterada. Data nula não permitida. ');
   end;

   if (UpperCase(psCampo) = 'DATAADMISSAO') and (psValorDepois = '')
   then begin
      if not chkGravaDemons.Checked
      then mmResult.Lines.Add('      [ERRO ] Data de Admissão não alterada. Data nula não permitida. ');
      If CkbxGravaDemo.Checked Then { Agusto 21/12/2004 }
        GravaLinhaTXT('      [ERRO ] Data de Admissão não alterada. Data nula não permitida. ');
   end;

   if (UpperCase(psCampo) = 'DATADEMISSAO') and (psValorAntes <> '')and (psValorDepois = '')
   then begin
      if not chkGravaDemons.Checked
      then mmResult.Lines.Add('      [ERRO ] Data de Demissão não alterada. Data nula não permitida. ');
      If CkbxGravaDemo.Checked Then { Agusto 21/12/2004 }
        GravaLinhaTXT('      [ERRO ] Data de Demissão não alterada. Data nula não permitida. ');
   end;

   if (UpperCase(psCampo) = 'DATADEMISSAO') and (psValorAntes = '')and (psValorDepois <> '')
   then begin
      if not chkGravaDemons.Checked
      then mmResult.Lines.Add('      [ERRO ] Data de Demissão não alterada. Registre um Evento de Demissão.');
      If CkbxGravaDemo.Checked Then { Agusto 21/12/2004 }
        GravaLinhaTXT('      [ERRO ] Data de Demissão não alterada. Registre um Evento de Demissão.');
   end;

   if (UpperCase(psCampo) = 'INSCRICAODATA') and (psValorDepois = '')
   then begin
      if not chkGravaDemons.Checked
      then mmResult.Lines.Add('      [ERRO ] Data de Inscrição não alterada. Data nula não permitida. ');
      If CkbxGravaDemo.Checked Then { Agusto 21/12/2004 }
        GravaLinhaTXT('      [ERRO ] Data de Inscrição não alterada. Data nula não permitida. ');
   end;

   
   // 2. Dados Funcionais
   // 3. Dados de Opcao de Contribuicao
   // 4. Dados de Tipo de Beneficio
   // 5. Dados de Beneficio

   Result := True;
end;

procedure TfrmRetroativoPREV.bbtnCadEvolFuncionalClick(Sender: TObject);
begin
  inherited;

  // Gleyber - 08/08/2006 - Pendência 23022 - Início
  If not dtmBaseDados.dbBaseDados.InTransaction
   Then dtmBaseDados.dbBaseDados.StartTransaction;
  // Gleyber - 08/08/2006 - Pendência 23022 - Fim

  try
     frmCadEvolFuncPrev := TfrmCadEvolFuncPrev.Create(Application);

     with frmCadEvolFuncPrev do
     begin
        qry.Close;
        qry.ParamByName('IdPessJur').Value      := iIdPessJur;
        qry.ParamByName('IdPessoa').Value       := iIdPessoa;
        qry.Open;

        //leocm - 15052002 - inicio
        if qry.fieldbyname('TITULAR').AsInteger = 1 then
        begin
           lblnome.Caption := 'Nome do Participante';
           lblmat.caption  := 'Matrícula Participante';
           DBText6.Visible := True;
        end else begin
           lblnome.caption := 'Nome Depen./Benef.';
           lblmat.caption  := 'Matrícula Depen./Benef.';
           DBText6.Visible := False;
        end;
        //leocm - 15052002 - fim

        qryEventos.Close;
        qryEventos.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryEventos.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryEventos.Open;

        qryDet.Close;
        qryDet.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryDet.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryDet.Open;

        qryFuncao.Close;
        qryFuncao.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryFuncao.ParamByName('IdPessoa').Value    := iIdPessoa;
        // CGUEDES - 15/10/2001: ADICIONANDO IDPLANOPREV NO FILTRO POR ESTAR USANDO PARTPREVPLAN
        // NO CASO DE MUDANÇA DE PLANO.
        qryFuncao.ParamByName('IDPLANOPREV').Value := iIdPlanoPrev;
        qryFuncao.Open;

        qryAdicCompens.Close;
        qryAdicCompens.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryAdicCompens.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryAdicCompens.Open;

        qryAdicInsalub.Close;
        qryAdicInsalub.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryAdicInsalub.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryAdicInsalub.Open;

        qryAdicPericul.Close;
        qryAdicPericul.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryAdicPericul.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryAdicPericul.Open;

        qryAdicNoturno.Close;
        qryAdicNoturno.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryAdicNoturno.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryAdicNoturno.Open;

        qryATS.Close;
        qryATS.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryATS.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryATS.Open;

        qryRubSalarial.Close;
        qryRubSalarial.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryRubSalarial.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryRubSalarial.Open;

        qryFuncoes.Close;
        qryFuncoes.ParamByName('IdPessJur').Value  := iIdPessJur;
        qryFuncoes.Open;

        qryCargoxNivel.Close;
        qryCargoxNivel.ParamByName('IdPessJur').Value  := iIdPessJur;
        qryCargoxNivel.Open;

        qryProvDesc.Close;
        qryProvDesc.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryProvDesc.Open;

        bInseriuDetalhe := False;

        bEmTransacaoExterna := True; { Augusto 11/07/2006 }
        
        ShowModal;
     end;
  except
     raise;
  end;
end;

procedure TfrmRetroativoPREV.dblkpcmbLoteAcertoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  edMesAcerto.Text          := dbedMesLote.Text;
  dtDataAcerto.Text         := dbdtDataPagamentoLote.Text;
  dtDataDeveriaTerPago.Text := dbdtDataPagamentoLote.Text;
end;

procedure TfrmRetroativoPREV.dbgrdDadosBeneficioFieldChanged(
  Sender: TObject; Field: TField);
var dRMI : double;
begin
  inherited;
  if qryDadosBeneficio.FieldByName('IDPESSOA').AsInteger = qryDadosBeneficio.FieldByName('IDTITULAR').AsInteger
  then begin
     if (UpperCase(Field.FieldName) = 'VALORTOTAL')
        and (qryDadosBeneficio.FieldByName('VALORATUAL').AsFloat <> qryDadosBeneficio.FieldByName('VALORTOTAL').AsFloat) //leofuncef - 27072005
     then begin
        qryDadosBeneficio.Edit;
        qryDadosBeneficio.FieldByName('VALORATUAL').AsFloat := qryDadosBeneficio.FieldByName('VALORTOTAL').AsFloat;
        qryDadosBeneficio.Post;
     end;
  end;
end;

procedure TfrmRetroativoPrev.MontaDadosBeneficioAnterior;
var sDataInicioAnt,
    sValorAnt,
    sNomeBenefAnt,
    sIdTpPagtoAnt,
    sFlgBenefMinAnt,
    sUltMesReajAnt,
    sDataEventoAnt,
    sNumProcINSS, 
    sCodBeneficioAnt     : string;

   sValorBase1Ant,
   sValorBase2Ant,
   sValorBase3Ant        : string;

   iTotalBenef           : longint;
begin

  { Augusto 20/01/2005 - Testa dados }
  If (Not qryDadosBeneficio.IsEmpty) And (qryDadosBeneficio.FieldByName('DataInicioFund').AsString = '') Then Begin
    MsgDlg('Atenção, existem beneficios com a DIB vazia. Verificar!',
           'Erro', mtError, [mbOK],0);
    Exit;
  End;



  // Somar o total de beneficiarios do titular
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT COUNT(IDPESSOA) AS TOTALDEPENDENTES '+
             ' FROM   DEPENTIT                            '+
             ' WHERE  IDTITULAR = '+IntToStr(iIdTitular) );
     Open;
     if IsEmpty
     then iTotalBenef := 0
     else iTotalBenef := FieldByName('TOTALDEPENDENTES').AsInteger;
  end;

  qryDadosBeneficio.First;
  while not qryDadosBeneficio.Eof do
  begin
     BuscaDadosBeneficioAnterior ( qryAux,
                                   iIdPessJur, iIdPlanoPrev, iIdTitular,
                                   qryDadosBeneficio.FieldByName('IdBeneficio').AsInteger,
                                   qryDadosBeneficio.FieldByName('FlgReferencia').AsInteger,
                                   qryDadosBeneficio.FieldByName('DataInicioFund').AsString,
                                   sDataInicioAnt,
                                   sValorAnt,
                                   sNomeBenefAnt,
                                   sIdTpPagtoAnt,
                                   sUltMesReajAnt,
                                   sFlgBenefMinAnt,
                                   sDataEventoAnt,
                                   sCodBeneficioAnt,
                                   sValorBase1Ant,
                                   sValorBase2Ant,
                                   sValorBase3Ant,
                                   sNumProcINSS,
                                   True );
     if sDataInicioAnt = ''
     then begin
        sDataInicioAnt := qryDadosBeneficio.FieldByName('DIBBENEFANT').AsString;
        sValorAnt      := ClienteNumero(qryDadosBeneficio.FieldByName('VALORBENEFANT').AsString);
     end;

     qryDadosBeneficio.Edit;

     if Trim(sDataInicioAnt) = ''
     then begin
        qryDadosBeneficio.FieldByName('NOMEBENEFANT').AsString := 'Benefício Anterior não Encontrado no Banco de Dados da Fundação';
        qryDadosBeneficio.FieldByName('TITULOBENEFANT').AsString := 'Salário de Benefício';
     end
     else begin
        qryDadosBeneficio.FieldByName('NOMEBENEFANT').AsString := sNomeBenefAnt;
        qryDadosBeneficio.FieldByName('TITULOBENEFANT').AsString := 'Renda Mensal Inicial';
     end;

     if Trim(sDataInicioAnt) <>  ''
     then qryDadosBeneficio.FieldByName('DIBBENEFANT').AsString := sDataInicioAnt;
     qryDadosBeneficio.FieldByName('VALORBENEFANT').AsString := ClienteNumero(sValorAnt);

     qryDadosBeneficio.Next;
  end;
end;

procedure TfrmRetroativoPREV.dblkpcmbMotivoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (dblkpcmbMotivo.Text <> '') and
     (qryMotivo.FieldByName('IDMOTIVO').AsInteger = prmIDMOTIVOFOLHABEN)
  then begin
     dblkpcmbMotivo.Text := '';
     MsgDlg('O motivo para a inclusão dos acertos deve ser diferente do motivo padrão da folha de benefícios. ','Erro',mtError,[mbOK],0);
     dblkpcmbMotivo.SetFocus;
  end;

  // CAMILLE - 10.11.2004 - PENDENCIA 17996
  if (dblkpcmbMotivo.Text <> '') and
     (prmIdMotivoContrib > 0  ) and
     (qryMotivo.FieldByName('IDMOTIVO').AsInteger = prmIdMotivoContrib)
  then begin
     dblkpcmbMotivo.Text := '';
     MsgDlg('O motivo para a inclusão dos acertos deve ser diferente do Motivo para Cobrança de Contribuições Previdenciárias [padrão].','Erro',mtError,[mbOK],0);
     dblkpcmbMotivo.SetFocus;
  end;

  if (dblkpcmbMotivo.Text <> '') and
     (prmIDMOTIVODIVERG > 0  ) and
     (qryMotivo.FieldByName('IDMOTIVO').AsInteger = prmIDMOTIVODIVERG)
  then begin
     dblkpcmbMotivo.Text := '';
     MsgDlg('O motivo para a inclusão dos acertos deve ser diferente do Motivo para Tratamento de Divergência [padrão].','Erro',mtError,[mbOK],0);
     dblkpcmbMotivo.SetFocus;
  end;

  if (dblkpcmbMotivo.Text <> '') and
     (prmIdMotivoContribAtraso > 0  ) and
     (qryMotivo.FieldByName('IDMOTIVO').AsInteger = prmIdMotivoContribAtraso)
  then begin
     dblkpcmbMotivo.Text := '';
     MsgDlg('O motivo para a inclusão dos acertos deve ser diferente do Motivo para Recebimento de Contribuições em Atraso.','Erro',mtError,[mbOK],0);
     dblkpcmbMotivo.SetFocus;
  end;

  if (dblkpcmbMotivo.Text <> '') and
     (prmIdMotivoContribDevoluc > 0  ) and
     (qryMotivo.FieldByName('IDMOTIVO').AsInteger = prmIdMotivoContribDevoluc)
  then begin
     dblkpcmbMotivo.Text := '';
     MsgDlg('O motivo para a inclusão dos acertos deve ser diferente do Motivo para Devolução de Contribuições.','Erro',mtError,[mbOK],0);
     dblkpcmbMotivo.SetFocus;
  end;

  if (dblkpcmbMotivo.Text <> '') and
     (prmIDMOTIVODEVOLBEN > 0  ) and
     (qryMotivo.FieldByName('IDMOTIVO').AsInteger = prmIDMOTIVODEVOLBEN)
  then begin
     dblkpcmbMotivo.Text := '';
     MsgDlg('O motivo para a inclusão dos acertos deve ser diferente do Motivo para Cobrança de Devolução de Benefício [padrão].','Erro',mtError,[mbOK],0);
     dblkpcmbMotivo.SetFocus;
  end;

  if (dblkpcmbMotivo.Text <> '') and
     (prmIDMOTDEVOLNAOIDEN > 0  ) and
     (qryMotivo.FieldByName('IDMOTIVO').AsInteger = prmIDMOTDEVOLNAOIDEN)
  then begin
     dblkpcmbMotivo.Text := '';
     MsgDlg('O motivo para a inclusão dos acertos deve ser diferente do Motivo para Acerto com Beneficiário não Identificado [padrão].','Erro',mtError,[mbOK],0);
     dblkpcmbMotivo.SetFocus;
  end;

  if (dblkpcmbMotivo.Text <> '') and
     (prmIDMOTIVOACERTOFL > 0  ) and
     (qryMotivo.FieldByName('IDMOTIVO').AsInteger = prmIDMOTIVOACERTOFL)
  then begin
     dblkpcmbMotivo.Text := '';
     MsgDlg('O motivo para a inclusão dos acertos deve ser diferente do Motivo para Acerto de Benefício Pós-Morte na Conta do Próprio Participante [padrão].','Erro',mtError,[mbOK],0);
     dblkpcmbMotivo.SetFocus;
  end;

  if (dblkpcmbMotivo.Text <> '') and
     (prmIdMotivoAcertoMigracaoPlano > 0  ) and
     (qryMotivo.FieldByName('IDMOTIVO').AsInteger = prmIdMotivoAcertoMigracaoPlano)
  then begin
     dblkpcmbMotivo.Text := '';
     MsgDlg('O motivo para a inclusão dos acertos deve ser diferente do Motivo para Acertos gerados na transferência de planos.','Erro',mtError,[mbOK],0);
     dblkpcmbMotivo.SetFocus;
  end;

  if (dblkpcmbMotivo.Text <> '') and
     (prmIDMOTIVOSALMANUT > 0  ) and
     (qryMotivo.FieldByName('IDMOTIVO').AsInteger = prmIDMOTIVOSALMANUT)
  then begin
     dblkpcmbMotivo.Text := '';
     MsgDlg('O motivo para a inclusão dos acertos deve ser diferente do Motivo para as rubricas de salário de manutenção (em caso de desmembramento).','Erro',mtError,[mbOK],0);
     dblkpcmbMotivo.SetFocus;
  end;

  if (dblkpcmbMotivo.Text <> '') and
     (prmIDMOTIVOPARCELA > 0  ) and
     (qryMotivo.FieldByName('IDMOTIVO').AsInteger = prmIDMOTIVOPARCELA)
  then begin
     dblkpcmbMotivo.Text := '';
     MsgDlg('O motivo para a inclusão dos acertos deve ser diferente do Motivo para Parcelamento.','Erro',mtError,[mbOK],0);
     dblkpcmbMotivo.SetFocus;
  end;

  if (dblkpcmbMotivo.Text <> '') and
     (prmIDMOTIVOQUITACAO > 0  ) and
     (qryMotivo.FieldByName('IDMOTIVO').AsInteger = prmIDMOTIVOQUITACAO)
  then begin
     dblkpcmbMotivo.Text := '';
     MsgDlg('O motivo para a inclusão dos acertos deve ser diferente do Motivo para Quitação de Parcelamento.','Erro',mtError,[mbOK],0);
     dblkpcmbMotivo.SetFocus;
  end;

  if (dblkpcmbMotivo.Text <> '') and
     (prmIDMOTIVOAMORTIZA > 0  ) and
     (qryMotivo.FieldByName('IDMOTIVO').AsInteger = prmIDMOTIVOAMORTIZA)
  then begin
     dblkpcmbMotivo.Text := '';
     MsgDlg('O motivo para a inclusão dos acertos deve ser diferente do Motivo para Amortização de Parcelamento.','Erro',mtError,[mbOK],0);
     dblkpcmbMotivo.SetFocus;
  end;

  if (dblkpcmbMotivo.Text <> '') and
     (prmIDMOTIVOCARENCIA > 0  ) and
     (qryMotivo.FieldByName('IDMOTIVO').AsInteger = prmIDMOTIVOCARENCIA)
  then begin
     dblkpcmbMotivo.Text := '';
     MsgDlg('O motivo para a inclusão dos acertos deve ser diferente do Motivo para Compra de Carência.','Erro',mtError,[mbOK],0);
     dblkpcmbMotivo.SetFocus;
  end;



end;

// ********************************************************************
// CALCULAR PRÓXIMO ANO/MÊS
// ********************************************************************
function TfrmRetroativoPREV.CalculaProximoMes(
  sAnoMesAtual,
  sAnoMesFim,
//P.RAMOS-06/04/2006-PEND.22029-PARÂMETROS NOVOS PARA VERIFICAR SE DEVE PROCESSAR
// A REVISÃO DO ABONO NO ANO CORRENTE CONSIDERANDO O MÊS QUE SE PAGA ABONO.
  sAnoMesLote,
  sMesPagaAbono : String
  ) : String;
var bRevisaAbono: boolean;
//P.RAMOS-06/04/2006-PEND.22029-FIM
begin

  if (Copy(sAnoMesAtual,6,2) = '12') or
     ( (sAnoMesAtual = sAnoMesFim) and (Copy(sAnoMesFim,6,2) < '12') ) //leocm - 14022006
  then begin
//P.RAMOS-06/04/2006-PEND.22029-PARÂMETROS NOVOS PARA VERIFICAR SE DEVE PROCESSAR
// A REVISÃO DO ABONO NO ANO CORRENTE CONSIDERANDO O MÊS QUE SE PAGA ABONO.
     bRevisaAbono:=false;
     if (copy(sAnoMesAtual,1,4) = copy(sAnoMesLote,1,4)) then
     {estou no ano corrente e se deve verificar se o mês atual é maior ou igual
      ao mês que se paga o abono}
     begin
       try
         {o mês atual é posterior ao mês de pagamento de abono => então revisa abono}
         if (strtoint(Copy(sAnoMesAtual,6,2)) >= strtoint(sMesPagaAbono)) then
         begin
           bRevisaAbono:=true;
         end;
       except
       end;
     end
     else
     begin
       {ano anterior => então revisa abono}
       bRevisaAbono:=true;
     end;

     if bRevisaAbono then
     begin
//P.RAMOS-06/04/2006-PEND.22029-FIM

       // Verificar se a pessoa possui 13o.
       qryAux.Close;
       qryAux.SQL.Clear;

       //leocm - 14022006 - inicio
       //qryAux.SQL.Add(' SELECT SUM(DECODE(HST.FLGDEVOLUCAO,1,-HST.VLBENEFPGTO,HST.VLBENEFPGTO)) AS VALORPAGO '+
       qryAux.SQL.Add(' SELECT SUM(DECODE(HST.FLGDEVOLUCAO,1,-HST.VALORPREV,HST.VALORPREV)) AS VALORPAGO '+
       //leocm - 14022006 - fim
                      ' FROM   HSTBENEFBFCIARIO HST                                                          '+
                      ' WHERE  HST.MESREFERENCIA  = '''+Copy(sAnoMesAtual,1,5)+'13'+'''                      '+
                      ' AND    HST.IDTITULAR      = '+qryBenefBfciario.FieldByName('IDTITULAR').AsString      +
                      ' AND    HST.IDPESSOA       = '+qryBenefBfciario.FieldByName('IDPESSOA').AsString       +
                      ' AND    HST.SEQPROPOSTA    = '+qryBenefBfciario.FieldByName('SEQPROPOSTA').AsString    +
                      ' AND    HST.IDPESSJUR      = '+qryBenefBfciario.FieldByName('IDPESSJUR').AsString      +
                      ' AND    HST.IDPLANOPREV    = '+qryBenefBfciario.FieldByName('IDPLANOPREV').AsString    +
                      ' AND    HST.NUMEROPROCESSO = '+qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsString +
                      ' AND    HST.IDBENEFICIO    = '+qryBenefBfciario.FieldByName('IDBENEFICIO').AsString    );
       qryAux.Open;

       { Inicio Augusto 28/03/2006 - Novo controle para os casos em que os calculos }
       { são feitos na própria rotina de revisão.                                   }
       if qryaux.fieldbyname('VALORPAGO').AsFloat <> 0 then begin { Augusto 22/01/2007 de > para <> }
         sAnoMesAtual  := Copy(sAnoMesAtual,1,5)+'13';
       end else begin
         if ( rgrpRecalculaBeneficio.ItemIndex in [1,2] ) and
            (
              ( (qryBenefBfciario.FieldByName('FLGREFERENCIA').AsInteger = 1) And (sAnoMesAtual <> sAnoMesFim) )
              or
              (qryBenefBfciario.FieldByName('FLGREFERENCIA').AsInteger = 0)
            )
         Then
           sAnoMesAtual  := Copy(sAnoMesAtual,1,5)+'13'
         Else
           sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
       end;

//P.RAMOS-06/04/2006-PEND.22029
     end
     else
       sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
//P.RAMOS-06/04/2006-PEND.22029-FIM

     {
     //leocm - 20022006 - inicio
     //if not qryAux.IsEmpty
     if qryaux.fieldbyname('VALORPAGO').AsFloat > 0
     //leocm - 20022006
     then sAnoMesAtual  := Copy(sAnoMesAtual,1,5)+'13'
     else sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
     }

     { Fim Augusto 28/03/2006    }
  end
  else if Copy(sAnoMesAtual,6,2) = '13'
       then sAnoMesAtual  := IntToStr(StrToInt(Copy(sAnoMesAtual,1,4))+1)+'/01'
       else sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));

  Result := sAnoMesAtual;
end;

procedure TfrmRetroativoPREV.sbtnListaPessoasClick(Sender: TObject);
begin
  inherited;
  if not OpenDlg.Execute then Exit;

  edListaPessoas.Text := OpenDlg.FileName;
end;

procedure TfrmRetroativoPREV.chkListaPessoasClick(Sender: TObject);
begin
  inherited;
  
  grpListaPessoas.Visible          := chkListaPessoas.Checked; // CAMILLE - 15.12.2003

end;




function TfrmRetroativoPREV.EfetuaParcelamento : boolean;
var sNumParcelas    : string;
    iNumParcelas    : integer;
    dTotalAcerto    : double;
    sDataInicio     : string;
    sDataFinal      : string;
    sAnoMes         : string;
    i               : integer;
    iDiaFinal       : integer;
    iIdRubrica      : longint;
    bBenefProprio   : boolean;
    mrResult        : TModalResult;
    dTotalBenefLiq, dTotalAParcelar : double;

    sValorRegra : String;
    bINSSok, bSUPLok, bErroRegra : Boolean;
    nAux : Double;
    sVlrUltContrib, sValorSupl, sValorInss : String;
    sNumParcInss , sNumParcBenef, sNumParcContrib, sFontePagadora : String;
begin
   Result := False;

   //Positivo = Participante recebe
   //Negativo = Participante paga
   //tano para benef quanto para contrib.
   dTotalAcerto := dTotalINSS + dTotalBenef + dTotalContrib;

   // Se for a pagar, não há parcelamento. O parcelamento só é permitido para descontos
   // do beneficiário
   if dTotalAcerto > 0
   then begin
      Result := True;
      Exit;
   end;

   if MsgDlg('Deseja parcelar os acertos resultantes da revisão ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
   then begin
      Result := True;
      Exit;
   end;



   sNumParcInss :=  '0';
   sNumParcBenef := '0';
   sNumParcContrib :=  '0';


   try
      frmParcelamentoRevisao := TfrmParcelamentoRevisao.Create(Application);
      with frmParcelamentoRevisao do
      begin

         redINSS.Value           := dTotalINSS;
         redBeneficio.Value      := dTotalBenef;
         redContribuicao.Value   := dTotalContrib;

         redINSSParc.Value           := 0;
         redBeneficioParc.Value      := 0;
         redContribuicaoParc.Value   := 0;

         { Inicio Augusto 25/08/2005 }

{
         inss =  -1202,63  => PAGAR
         supl =    963,85  => RECEBER
         cont =    -48,19  => PAGAR
}
         { Participante possui INSS a pagar e suplementação a pagar, utiliza para }
         { calculo o valor total do INSS.                                         }
         if (dTotalINSS < 0) and (dTotalBenef <= 0) then begin
           redINSSParc.Value       := redINSS.Value;
         end;

         { Participante possui INSS a pagar e suplementação a pagar, utiliza para }
         { calculo o valor total da SUPLEMENAÇÃO.                                 }
         if (dTotalINSS <= 0) and (dTotalBenef < 0) then begin
             redBeneficioParc.Value  := redBeneficio.Value;
         end;

         { Participante possui INSS a Receber e suplementação a pagar, utiliza para }
         { calculo da SUPLEMENTAÇÃO valor liquido entre INSS e SUPLEMENTAÇÃO        }
         if (dTotalINSS > 0) and (dTotalBenef < 0)  then begin
           redBeneficioParc.Value  := redINSS.Value + redBeneficio.Value;
           dTotalBenefLiq          := redBeneficioParc.Value; { Guarda valor liquido }
         end;

         { Participante possui INSS a pagar e suplementação a receber, utiliza para  }
         { calculo do INSS o valor liquido entre INSS e SUPLEMENTAÇÃO               }
         if (dTotalINSS < 0) and (dTotalBenef > 0)  then begin
           redINSSParc.Value := redINSS.Value + redBeneficio.Value;
           dTotalBenefLiq    := redINSSParc.Value; { Guarda valor liquido }
         end;

         { Participante possui Contriuição a pagar e suplementação a pagar, utiliza }
         { no calculo da contribuição o valor total da CONTRIBUIÇÃO.                }
         if (dTotalContrib < 0) and (dTotalBenefLiq < 0)  then begin
           redContribuicaoParc.Value   := redContribuicao.Value

         { Participante possui Contriuição a pagar e suplementação a receber, utiliza }
         { no calculo da contribuição o valor total da CONTRIBUIÇÃO.                }
         end else if (dTotalContrib < 0) and (dTotalBenefLiq > 0)  then begin
            redContribuicaoParc.Value   := redContribuicao.Value + redBeneficio.Value

         { Participante possui Contriuição a receber e suplementação a pagar, utiliza }
         { no calculo da contribuição o valor total da CONTRIBUIÇÃO.                  }
         end else if (dTotalContrib > 0) and (dTotalBenefLiq < 0) then begin
           redBeneficioParc.Value   := redContribuicao.Value + redBeneficio.Value;
         end;
         { Fim Augusto 25/08/2005 }



         sedNumParcInss.MinValue := 1;
         sedNumParcBenef.MinValue := 1;
         sedNumParcContrib.MinValue := 1;

         //regra de margem
         if prmIdRgMargemConsig >0 then
         begin
            dtmaprev.qryAux.Close;
            dtmaprev.qryAux.sql.text := ' SELECT IDREGRA, NOMEREGRA FROM REGRA WHERE IDREGRA = '+IntToStr(prmIDRGMARGEMCONSIG)+'';
            dtmaprev.qryAux.open;

            edRegraMargem.text :=  dtmaprev.qryAux.fieldbyname('IDREGRA').AsString+' - '+
                                   dtmaprev.qryAux.fieldbyname('NOMEREGRA').AsString;


            sValorSupl := '0';
            qryaux.close;
            qryaux.sql.text := ' SELECT NVL(VALORATUAL,0) VALOR  FROM BENEFBFCIARIO '+
                               ' WHERE  IDPESSJUR    = '+qrydadosbeneficio.fieldbyname('IDPESSJUR').AsString+
                               ' AND    IDPLANOPREV  = '+qrydadosbeneficio.fieldbyname('IDPLANOPREV').AsString+
                               ' AND    IDPESSOA    = '+qrydadosbeneficio.fieldbyname('IDPESSOA').AsString+
                               ' AND    IDTITULAR    = '+qrydadosbeneficio.fieldbyname('IDTITULAR').AsString+
                               ' AND    IDSITBENEFICIO IN (1,3) '+
                               ' AND    IDBENEFICIO IN (SELECT IDBENEFICIO FROM BENEFPLANPREV WHERE FLGREFERENCIA = 0 ) ';
            qryaux.open;
            if not qryaux.isempty then sValorSupl := qryaux.fieldbyname('VALOR').AsString;



            sValorInss := '0';
            qryaux.close;
            qryaux.sql.text := ' SELECT NVL(VALORATUAL,0) VALOR  FROM BENEFBFCIARIO '+
                               ' WHERE  IDPESSJUR    = '+qrydadosbeneficio.fieldbyname('IDPESSJUR').AsString+
                               ' AND    IDPLANOPREV  = '+qrydadosbeneficio.fieldbyname('IDPLANOPREV').AsString+
                               ' AND    IDPESSOA    = '+qrydadosbeneficio.fieldbyname('IDPESSOA').AsString+
                               ' AND    IDTITULAR    = '+qrydadosbeneficio.fieldbyname('IDTITULAR').AsString+
                               ' AND    IDSITBENEFICIO IN (1,3) '+
                               ' AND    IDBENEFICIO IN  (SELECT IDBENEFICIO FROM BENEFPLANPREV WHERE FLGREFERENCIA = 1 ) ';
            qryaux.open;
            if not qryaux.isempty then sValorInss := qryaux.fieldbyname('VALOR').AsString;

            { Inicio Augusto 25/05/2004 - Pegar o valor da ultima contribuição }
            sVlrUltContrib := '0';
            sSQL := 'SELECT '+
                    '  H.MESREFERENCIA, '+
                    '  SUM(DECODE(FLGDEVOLUCAO,1,-VALORESPERADO,VALORESPERADO)) AS VALORESPERADO '+
                    'FROM   '+
                    '  HSTCONTRIBPREV H '+
                    'WHERE  '+
                    '  H.IDPESSJUR = '+QryDadosBeneficio.fieldbyname('IDPESSJUR').AsString    +' AND '+
                    '  H.IDPESSOA  = '+QryDadosBeneficio.fieldbyname('IDRESPONSAVEL').AsString+' AND '+
                    '  SUBSTR(H.MESREFERENCIA,6,2) <> '+QuotedStr('13')+' AND '+
                    '  H.MESREFERENCIA = (SELECT MAX(H2.MESREFERENCIA) '+
                    '                     FROM HSTCONTRIBPREV H2 '+
                    '                     WHERE H2.IDPESSJUR = H.IDPESSJUR AND '+
                    '                           H2.IDPESSOA  = H.IDPESSOA  AND '+
                    '                           SUBSTR(H2.MESREFERENCIA,6,2) <> '+QuotedStr('13')+') '+
                    'GROUP BY '+
                    '  H.MESREFERENCIA ';
            FazQuery(QryAux,sSQL);
            sVlrUltContrib := Qryaux.FieldByName('VALORESPERADO').AsString;
            { Fim Augusto 25/05/2004 }

            sSQL := ' SELECT '+
                    { Augusto 18/05/2004 - Novos Campos }
                    qrydadosbeneficio.fieldbyname('IDPESSJUR').AsString   + ' AS IDPESSJUR,   '+
                    qrydadosbeneficio.FieldByName('IDPLANOPREV').AsString + ' AS IDPLANOPREV, '+
                    qrydadosbeneficio.FieldByName('IDPESSOA').AsString    + ' AS IDPESSOA,    '+
                    qrydadosbeneficio.FieldByName('SEQPROPOSTA').AsString + ' AS SEQPROPOSTA, '+
                    qrydadosbeneficio.FieldByName('IDSITPART').AsString   + ' AS IDSITPART,   '+
                    OraNumero(sVlrUltContrib)                             + ' AS VLRCONTRMES, '+ { Augusto 25/05/2004 }
                    OraNumero(FloatToStr(qrydadosbeneficio.FieldByName('VLRINFINSS').AsFloat))       + ' AS VLRINFINSS,  '+
                    OraNumero(FloatToStr(qrydadosbeneficio.FieldByName('SALPARTICIPACAO').AsFloat))  + ' AS SALPARTICIPACAO,  '+
                    QuotedStr(FormatDateTime('DD/MM/YYYY',Date))            +' AS DATAREF, '+
                    //QuotedStr(Copy(DateToStr(Date), 7,4)+'/'+Copy(DateToStr(Date),4,2))+   ' AS HSTMESREF,  '+                                     // ClaudioR - 19962 - 16/08/2007
                    QuotedStr(Copy(FormatDateTime('dd/mm/yyyy', Date), 7,4)+'/'+Copy(FormatDateTime('dd/mm/yyyy', Date),4,2))+   ' AS HSTMESREF,  '+ // ClaudioR - 19962 - 16/08/2007
                    QuotedStr(qrydadosbeneficio.FieldByName('DATANASC').AsString)   +      ' AS DATANASC,   '+
                    QuotedStr(qrydadosbeneficio.FieldByName('NUMDEPIRRF').AsString)+       ' AS NUMDEPIRRF, '+
                    { Augusto 07/06/2004 - Novos Campos }
                    QuotedStr(qrydadosbeneficio.FieldByName('FLGMOLESTIAGRAVE').AsString)+ ' AS FLGMOLESTIAGRAVE, '+
                    QuotedStr(qrydadosbeneficio.FieldByName('FLGISENTOIRRF').AsString)+    ' AS FLGISENTOIRRF,    '+



                    ' '+ORANUMERO(FloatToStr(dTotalAcerto))+       ' AS VALORTOTAL ,  '+
                    ' '+ORANUMERO(FloatToStr(dTotalINSS))+         ' AS TOTALINSS ,   '+
                    ' '+ORANUMERO(FloatToStr(dTotalBenef))+        ' AS TOTALBENEF ,  '+
                    ' '+ORANUMERO(FloatToStr(dTotalContrib))+      ' AS TOTALCONTRIB, '+
                    ' '+ORANUMERO(sValorSupl)+                     ' AS VALORATUAL,   '+
                    ' '+ORANUMERO(sValorInss)+                     ' AS VALORINSS,    '+
                    ' '+ORANUMERO(sValorSupl)+' + '+ORANUMERO(sValorInss)+' VALORBENEF '+
                    ' FROM DUAL';


            sValorRegra := RegraNumerica(IntToStr(prmIDRGMARGEMCONSIG),
                                         sSQL,bErroRegra, iIdCalculo);


            redMargem.value :=   StrToFloat(clientenumero(sValorRegra));

            if bErroRegra
            then begin
               Result   := False;
               Exit;
            end;


            //em vista do valor da mergam, ver qual o percentual referente de cada dívida
            if frmParcelamentoRevisao.redINSSParc.Value < 0 then
            begin
               frmParcelamentoRevisao.redVlrParcINSS.value :=  strtofloat(truncaround(floattostr(frmParcelamentoRevisao.redMargem.value * (((frmParcelamentoRevisao.redINSSParc.Value*100)/dTotalAcerto)/100)),2))  ;
               nAux := (1 - abs(frac(frmParcelamentoRevisao.redInssParc.Value /  frmParcelamentoRevisao.redVlrParcInss.value) ) + abs(frmParcelamentoRevisao.redInssParc.Value /  frmParcelamentoRevisao.redVlrParcInss.value)) ;
               frmParcelamentoRevisao.sedNumParcInss.text :=  FloatToStr(int(nAux));
               frmParcelamentoRevisao.redVlrParcINSS.value :=  strtofloat(truncaround(floattostr(abs(frmParcelamentoRevisao.redINSSParc.Value / sedNumParcInss.value)),2));
            end;



            if frmParcelamentoRevisao.redBeneficioParc.Value < 0 then
            begin
               frmParcelamentoRevisao.redVlrParcBenef.value :=  strtofloat(truncaround(floattostr(frmParcelamentoRevisao.redMargem.value * (((frmParcelamentoRevisao.redBeneficioParc.Value*100)/dTotalAcerto)/100)),2));
               nAux := (1 - abs(frac(frmParcelamentoRevisao.redBeneficioParc.Value /  frmParcelamentoRevisao.redVlrParcBenef.value) ) + abs(frmParcelamentoRevisao.redBeneficioParc.Value /  frmParcelamentoRevisao.redVlrParcBenef.value))  ;
               frmParcelamentoRevisao.sedNumParcBenef.text :=  FloatToStr(int(nAux));
               frmParcelamentoRevisao.redVlrParcBenef.value :=  strtofloat(truncaround(floattostr(abs(frmParcelamentoRevisao.redBeneficioParc.Value / frmParcelamentoRevisao.sedNumParcBenef.value)),2));
            end;


            if frmParcelamentoRevisao.redContribuicaoParc.Value < 0 then
            begin
               frmParcelamentoRevisao.redVlrParcContrib.value :=  strtofloat(truncaround(floattostr(frmParcelamentoRevisao.redMargem.value * (((frmParcelamentoRevisao.redContribuicaoParc.Value*100)/dTotalAcerto)/100)),2)) ;
               nAux := (1 - abs(frac(frmParcelamentoRevisao.redContribuicaoParc.Value /  frmParcelamentoRevisao.redVlrParcContrib.value))  + abs(frmParcelamentoRevisao.redContribuicaoParc.Value /  frmParcelamentoRevisao.redVlrParcContrib.value))  ;
               frmParcelamentoRevisao.sedNumParcContrib.text :=  FloatToStr(int(nAux));
               frmParcelamentoRevisao.redVlrParcContrib.value :=  strtofloat(truncaround(floattostr(abs(frmParcelamentoRevisao.redContribuicaoParc.Value / frmParcelamentoRevisao.sedNumParcContrib.value)),2));
            end;


         end
         else
         begin
            edRegraMargem.text := 'Regra de margem não associada';
            sedNumParcInss.Value := 1;
            sedNumParcBenef.value := 1;
            sedNumParcContrib.value := 1;

            sedNumParcInss.enabled := true;
            sedNumParcBenef.enabled := true;
            sedNumParcContrib.enabled := true;

            redVlrParcINSS.value :=  dTotalINSS;
            redVlrParcBenef.value :=  dTotalBenef;
            redVlrParcContrib.value := dTotalContrib;


            redMargem.value := 0;
         end;


         { Augusto 15/07/2004 - Retirar o ABS }
         //dTotalINSS    := abs(redINSSParc.Value) ;
         //dTotalBenef   := abs(redBeneficioParc.Value);
         //dTotalContrib := abs(redContribuicaoParc.Value);

         dTotalINSS    := redINSSParc.Value;
         dTotalBenef   := redBeneficioParc.Value;
         dTotalContrib := redContribuicaoParc.Value;

         sNumParcInss    :=  floattostr(sedNumParcInss.Value);
         sNumParcBenef   :=  floattostr(sedNumParcBenef.Value);
         sNumParcContrib :=  floattostr(sedNumParcContrib.Value);

         mrResult := ShowModal;

         dTotalINSS    := redINSSParc.Value;
         dTotalBenef   := redBeneficioParc.Value;
         dTotalContrib := redContribuicaoParc.Value;

         sNumParcInss    :=  floattostr(sedNumParcInss.Value);
         sNumParcBenef   :=  floattostr(sedNumParcBenef.Value);
         sNumParcContrib :=  floattostr(sedNumParcContrib.Value);

         if mrResult <> mrOK
         then begin
            Result := True;
            Exit;
         end;
      end;
   finally
      frmParcelamentoRevisao.Free;
   end;

   bParcelamento := True;

   if not chkGravaDemons.Checked
   then mmResult.Lines.Add('      ---------------------------------------------------------------------------------------------------------------------------------------------------------');
   If CkbxGravaDemo.Checked Then { Agusto 21/12/2004 }
     GravaLinhaTXT('      ---------------------------------------------------------------------------------------------------------------------------------------------------------');

   if not chkGravaDemons.Checked
   then mmResult.Lines.Add('      '+PreparaStr('PARCELAMENTO : ',30));
   If CkbxGravaDemo.Checked Then { Agusto 21/12/2004 }
     GravaLinhaTXT('      '+PreparaStr('PARCELAMENTO : ',30));



   sDataInicio  := '01/'+Copy(qryLote.FieldByName('MESREFERENCIA').AsString,6,2)+'/'+Copy(qryLote.FieldByName('MESREFERENCIA').AsString,1,4);
   sAnoMes      := Copy(qryLote.FieldByName('MESREFERENCIA').AsString,1,4)+'/'+Copy(qryLote.FieldByName('MESREFERENCIA').AsString,6,2);



   // **************************************************************************
   // INSERIR PARCELA DE BENEFICIOS NA RUBRICAINDIV
   // **************************************************************************
   bINSSok := False; bSUPLok := False;
   qryDadosBeneficio.first;
   while not qryDadosBeneficio.eof do
   begin

      { Inicio Augusto - Caso não marcado para processamento pular }
      if qryDadosBeneficio.FieldbyName('PROCESSA').AsInteger = 0 Then Begin
        qryDadosBeneficio.next;
        continue;
      End;
      { Fim Augusto }

      if  qryDadosBeneficio.fieldbyname('FLGREFERENCIA').AsInteger = 0 then begin
         { Augusto 31/05/2004 }
         iNumParcelas := StrToInt(sNumParcBenef);


         if (dTotalBenef = 0) or (bSUPLok = True)then begin { Augusto (15/07/2004 - Retirado <) (17/06/2005 - Incluido bSUPLok ) }
            qryDadosBeneficio.next;
            continue;
         end;

         bSUPLok := True; { Augusto 17/06/2005 }

         dTotalAcerto := dTotalBenef / StrToInt(sNumParcBenef)
      end else begin
         { Augusto 31/05/2004 }
         iNumParcelas := StrToInt(sNumParcInss);


         if (dTotalINSS = 0) or (bINSSok = True) Then begin { Augusto (15/07/2004 - Retirado <)  (17/06/2005 - Incluido bINSSok ) }
            qryDadosBeneficio.next;
            continue;
         end;

         bINSSok := True; { Augusto 17/06/2005 }

         dTotalAcerto := dTotalINSS / StrToInt(sNumParcInss);
      end;
      { Inicio Augusto 31/05/2004 }
      for i := 1 to iNumParcelas - 1 do
          sAnoMes := ProximoAnoMes(StrToInt(Copy(sAnoMes,6,2)),StrToInt(Copy(sAnoMes,1,4)) );

      iDiaFinal   := TrazUltDiaMes(StrToInt(Copy(sAnoMes,6,2)),StrToInt(Copy(sAnoMes,1,4)) );
      sDataFinal  := IntToStr(iDiaFinal)+'/'+Copy(sAnoMes,6,2)+'/'+Copy(sAnoMes,1,4);
      { Fim Augusto 31/05/2004 }

      if dTotalAcerto > 0
      then begin
         iIdRubrica := qryDadosBeneficio.FieldByName('IDRUBRICAREVISAO').AsInteger { Augusto 15/07/2004 - IDRUBRICAATRASO }
      end
      else begin
         dTotalAcerto := -dTotalAcerto;
         iIdRubrica   := qryDadosBeneficio.FieldByName('IDRUBDEVOLUCAO').AsInteger;
      end;

      if iIdRubrica <= 0
      then begin
         if not chkGravaDemons.Checked
         then mmResult.Lines.Add('      [AVISO] Rubrica para Parcelamento de Acertos não cadastrada. Parcelamento não Processado. Verifique. ');
         If CkbxGravaDemo.Checked Then { Agusto 21/12/2004 }
           GravaLinhaTXT('      [AVISO] Rubrica para Parcelamento de Acertos não cadastrada. Parcelamento não Processado. Verifique. ');
         Exit;
      end;

      { Inicio Augusto 23/11/2004 - Verifica se a rubrica esta Bloqueada }
      If FParcelamentoRevisao.RubricaBloqueada(QryAux, iIdRubrica) = True Then Begin
         if not chkGravaDemons.Checked
         then mmResult.Lines.Add('      [AVISO] Rubrica para Parcelamento de Acertos bloqueada. Parcelamento não Processado. Verifique. ');
         If CkbxGravaDemo.Checked Then { Agusto 21/12/2004 }
           GravaLinhaTXT('      [AVISO] Rubrica para Parcelamento de Acertos bloqueada. Parcelamento não Processado. Verifique. ');
         Exit;
      End;
      { Fim Augusto 23/11/2004 }

      if qryDadosBeneficio.FieldByName('IDTITULAR').AsInteger = qryDadosBeneficio.FieldByName('IDPESSOA').AsInteger
      then bBenefProprio := True
      else bBenefProprio := False;

      sSQL := ' INSERT INTO RUBRICAINDIV ( '+
              ' ANOMESREF,      DATAINICIO,        DATAFINAL,                       '+
              ' FLGPENSAOALIM,  FLGPERMANENTE,     FLGTPRUBMANUT,   FLGUSAABONO,    '+
              ' IDEMPRESA,      IDPESSOA,          IDRUBRICA,       IDTITULAR,      '+
              ' NUMOCORRENCIAS, PARCELAS,          SEQRUBRICAINDIV, ULTMESPREPARO,  '+
              { Augusto 07/07/2004 }
              ' VALORANTERIOR,  VALORRUBRICA, '+

              ' IDLOTEREVISAO, '+ { Augusto 17/08/2004 - IDLOTEREVISAO }
              ' IDMOVBENEF )   '+ { Augusto 10/03/2006 - IDMOVBENEF    }

              //' VALORANTERIOR,  VALORRUBRICA,      IDREGRACALCULO )               '+
              ' VALUES (                                                            '+
              ''''+qryLote.FieldByName('MESREFERENCIA').AsString+''',               '+
              ' TO_DATE('''+sDataInicio+''',''DD/MM/YYYY'') ,                       '+
              ' TO_DATE('''+sDataFinal +''',''DD/MM/YYYY'') ,                       '+
              ' 0,                                                                  '+// FLGPENSAOALIM {0}
              ' 0,                                                                  '+// FLGPERMANENTE {0}
              ' ''1'',                                                              '+// FLGTPRUBMANUT {"1"}
              ' 0,                                                                  '+// FLGUSAABONO   {0}
              IntToStr(Sistema.IdEmpresa)+',                                        '+
              qryDadosBeneficio.FieldByName('IDPESSOA').AsString+',                 '+
              IntToStr(iIdRubrica)+',                                               '+
              qryPessoasATratar.FieldByName('IDTITULAR').AsString+',                '+//leofuncef - 02022005 -  troquei por IDTITULAR
              ' 0,                                                                  '+// NUMOCORRENCIAS {0}
              IntToStr(iNumParcelas)+',                                             '+

              //leofuncef - 01032005
              //' 1,                                                                  '+// SEQRUBRICAINDIV,
              '(SELECT (NVL(MAX(SEQRUBRICAINDIV),0)+1) FROM RUBRICAINDIV WHERE '+
              ' IDPESSOA = '+qryDadosBeneficio.FieldByName('IDPESSOA').AsString+
              ' AND IDRUBRICA = '+IntToStr(iIdRubrica)+'), '+ // SEQRUBRICAINDIV,
              //leofuncef - 01032005 - fim

              ' ''0000/00'',                                                        '+
              ' 0,                                                                  '+ // VALORANTERIOR {0}
              { Augusto 23/03/2005 - Arredondamento }
              //OraNumero(FloatToStr(Abs(dTotalAcerto)))+', '+                         // VALORRUBRICA
              OraNumero(FormatFloat('#0.00',Abs(dTotalAcerto)))+', '+                  // VALORRUBRICA

              { Augusto 17/08/2004 }
              qryLote.FieldByName('IDLOTE').AsString+', '+                             // IDLOTEREVISAO
              IntToStr( iIdMovBenef )+') ';                                            // IDMOVBENNF

      //if Trim(dblkpcmbRegraParcela.Text) <> ''
      //then sSQL := sSQL + ','+qryRegraParcela.FieldByName('IDREGRA').AsString+')'
      //else sSQL := sSQL + ',NULL)';

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSQL);
      try
         qryAux.ExecSQL;
      except
         if not chkGravaDemons.Checked
         then mmResult.Lines.Add('      [AVISO] Erro ao inserir parcelamento. Parcelamento não Processado. Verifique. ');
         If CkbxGravaDemo.Checked Then { Agusto 21/12/2004 }
           GravaLinhaTXT('      [AVISO] Erro ao inserir parcelamento. Parcelamento não Processado. Verifique. ');
         Exit;
      end;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT DESCRICAO FROM PROVDESC WHERE IDPROVENTO = '+IntToStr(iIdRubrica));
      qryAux.Open;

      if not chkGravaDemons.Checked
      then mmResult.Lines.Add('      '+PreparaStr(' '                                    ,36)+
                                       PreparaStr(' '                                    ,10)+
                                       PreparaStr('- RUBRICA '+IntToStr(iIdRubrica)+':'  ,25)+
                                       PreparaStr(IntToStr(iNumParcelas)+' parcelas de ' ,18)+
                                       PreparaStr(FormatFloat('#0.00',dTotalAcerto)      ,15)+
                                       PreparaStr('['+qryAux.FieldByName('DESCRICAO').AsString+']',40));

      GravaLinhaTXT('      '+PreparaStr(' '                                    ,36)+
                                       PreparaStr(' '                                    ,10)+
                                       PreparaStr('- RUBRICA '+IntToStr(iIdRubrica)+':'  ,25)+
                                       PreparaStr(IntToStr(iNumParcelas)+' parcelas de ' ,18)+
                                       PreparaStr(FormatFloat('#0.00',dTotalAcerto)      ,15)+
                                       PreparaStr('['+qryAux.FieldByName('DESCRICAO').AsString+']',40));

      //Bruno Bastos - Pend. 19203 - Início
      Try
        Try
          CtrlLancamento := TCtrlLancamento.Create;
          CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                                     True,
                                     Sistema.ConnectionType,
                                     Sistema.ConnectionSide,
                                     Sistema.AppRemoteServer,
                                     True
                                   );
        Except
          MsgDlg('Erro ao criar Controle de Lançamento Contábil.','Erro',mtError,[mbOK],0);
          Abort;
          Exit;
        End;

        If (prmIntegraContab = True) Then Begin
          If Not InsereContabil('B', qryDadosBeneficio.FieldByName('IDPESSOA').AsInteger,
                                     qryDadosBeneficio.FieldByName('IDTITULAR').AsInteger,
                                     qryDadosBeneficio.FieldByName('IDPESSJUR').AsInteger,
                                     qryDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger,
                                     qryDadosBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                                     dTotalBenef) Then
            Exit;
        End;
      Finally
        FreeAndNil( CtrlLancamento );
      End;
      //Bruno Bastos - Pend. 19203 - Fim

      qryDadosBeneficio.Next;
   end;

   // **************************************************************************
   // INSERIR PARCELA DE CONTRIBUICAO NA RUBRICAINDIV
   // **************************************************************************
   iNumParcelas := StrToInt(sNumParcContrib);
   for i := 1 to iNumParcelas - 1 do
       sAnoMes := ProximoAnoMes(StrToInt(Copy(sAnoMes,6,2)),StrToInt(Copy(sAnoMes,1,4)) );

   iDiaFinal   := TrazUltDiaMes(StrToInt(Copy(sAnoMes,6,2)),StrToInt(Copy(sAnoMes,1,4)) );
   sDataFinal  := IntToStr(iDiaFinal)+'/'+Copy(sAnoMes,6,2)+'/'+Copy(sAnoMes,1,4);


   if dTotalContrib < 0 then { Se for negativo faz parcelamento de contribuição }
   begin
      if bBenefProprio
      then sSQL := ' SELECT H.IDPESSOA, CP.IDRUBRICAATRASO, CP.IDRUBRICADEVOLUC,                            '+
                   '        SUM(DECODE(H.FLGDEVOLUCAO, 1, -H.VALORESPERADO,H.VALORESPERADO)) AS TOTALACERTO '+
                   ' FROM   HSTCONTRIBPREV H, CONTPREV CP                                                   '+
                   ' WHERE  H.IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString        +
                   ' AND    H.IDPLANOPREV  = '+qryPessoasATratar.FieldByName('IDPLANOPREV').AsString      +
                   ' AND    H.IDPESSOA     = '+qryPessoasATratar.FieldByName('IDPESSOA').AsString         +
                   ' AND    H.SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString      +
                   ' AND    H.IDMOTIVO          = '+qryMotivo.FieldByName('IDMOTIVO').AsString               +
                   ' AND    H.IDLOTE            = '+qryLote.FieldByName('IDLOTE').AsString                   +
                   ' AND    CP.IDPLANOPREV      = H.IDPLANOPREV                                             '+
                   ' AND    CP.IDCONTRIBUICAO   = H.IDCONTRIBUICAO                                          '+
                   ' GROUP BY H.IDPESSOA, CP.IDRUBRICAATRASO, CP.IDRUBRICADEVOLUC                           '

   //   else sSQL := ' SELECT H.IDPESSOA, CP.IDRUBRICAATRASO, BP.IDRUBRICADEVOLUC,                            '+
      else sSQL := ' SELECT H.IDPESSOA, CP.IDRUBRICAATRASO, CP.IDRUBRICADEVOLUC,                            '+  // Gleyber - 25/03/2004 - Pendência 16284
                   '        SUM(DECODE(H.FLGDEVOLUCAO, 1, -H.VALORESPERADO,H.VALORESPERADO)) AS TOTALACERTO '+
                   ' FROM   HSTCONTRIBPREV H, BFCIARIOTITPLAN BTIT, NUCLEOFAMILIAR NF, CONTPREV CP          '+
                   ' WHERE  BTIT.IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString        +
                   ' AND    BTIT.IDPLANOPREV  = '+qryPessoasATratar.FieldByName('IDPLANOPREV').AsString      +
                   ' AND    BTIT.IDTITULAR    = '+qryPessoasATratar.FieldByName('IDTITULAR').AsString         + //leofuncef - 02022005 - troquei por idtitular
                   ' AND    BTIT.SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString      +
                   ' AND    NF.IDNUCLEOFAMILIAR = BTIT.IDNUCLEOFAMILIAR                                     '+
                   ' AND    H.IDPESSJUR         = BTIT.IDPESSJUR                                            '+
                   ' AND    H.IDPLANOPREV       = BTIT.IDPLANOPREV                                          '+
                   ' AND    H.IDPESSOA          = NF.IDRESPNUCLEO                                           '+
                   ' AND    H.IDMOTIVO          = '+qryMotivo.FieldByName('IDMOTIVO').AsString               +
                   ' AND    H.IDLOTE            = '+qryLote.FieldByName('IDLOTE').AsString                   +
                   ' AND    CP.IDPLANOPREV      = H.IDPLANOPREV                                             '+
                   ' AND    CP.IDCONTRIBUICAO   = H.IDCONTRIBUICAO                                          '+
                   ' GROUP BY H.IDPESSOA, CP.IDRUBRICAATRASO, CP.IDRUBRICADEVOLUC                           ';
      qryAcerto.Close;
      qryAcerto.SQL.Clear;
      qryAcerto.SQL.Add(sSQL);
      qryAcerto.Open;
      while not qryAcerto.Eof    do
      begin

         //dTotalAcerto := qryAcerto.FieldByName('TOTALACERTO').AsFloat / StrToInt(sNumParcelas);
         dTotalAcerto :=  dTotalContrib / StrToInt(sNumParcContrib);

         if dTotalAcerto > 0
         then begin
            iIdRubrica := qryAcerto.FieldByName('IDRUBRICAATRASO').AsInteger
         end
         else begin
            dTotalAcerto := -dTotalAcerto;
            iIdRubrica   := qryAcerto.FieldByName('IDRUBRICADEVOLUC').AsInteger;
         end;

         if iIdRubrica <= 0
         then begin
            if not chkGravaDemons.Checked
            then mmResult.Lines.Add('      [AVISO] Rubrica para Parcelamento de Acertos não cadastrada. Parcelamento não Processado. Verifique. ');
            GravaLinhaTXT('      [AVISO] Rubrica para Parcelamento de Acertos não cadastrada. Parcelamento não Processado. Verifique. ');
            Exit;
         end;

         sSQL := ' INSERT INTO RUBRICAINDIV ( '+
                 ' ANOMESREF,      DATAINICIO,      DATAFINAL,                         '+
                 ' FLGPENSAOALIM,  FLGPERMANENTE,     FLGTPRUBMANUT,   FLGUSAABONO,    '+
                 ' IDEMPRESA,      IDPESSOA,          IDRUBRICA,       IDTITULAR,      '+
                 ' NUMOCORRENCIAS, PARCELAS,          SEQRUBRICAINDIV, ULTMESPREPARO,  '+

                 ' VALORANTERIOR,  VALORRUBRICA,      IDREGRACALCULO,                  '+
                                  ' IDLOTEREVISAO, '+ { Augusto 17/08/2004 - IDLOTEREVISAO }
                 ' IDMOVBENEF )   '+ { Augusto 10/03/2006 - IDMOVBENEF    }

                 ' VALUES (                                                            '+
                 ''''+qryLote.FieldByName('MESREFERENCIA').AsString+''',               '+
                 ' TO_DATE('''+sDataInicio+''',''DD/MM/YYYY'') ,                       '+
                 ' TO_DATE('''+sDataFinal +''',''DD/MM/YYYY'') ,                       '+
                 ' 0,                                                                  '+// FLGPENSAOALIM {0}
                 ' 0,                                                                  '+// FLGPERMANENTE {0}
                 ' ''1'',                                                              '+// FLGTPRUBMANUT {"1"}
                 ' 0,                                                                  '+// FLGUSAABONO   {0}
                 IntToStr(Sistema.IdEmpresa)+',                                        '+
                 qryAcerto.FieldByName('IDPESSOA').AsString+',                         '+
                 IntToStr(iIdRubrica)+',                                               '+
                 qryPessoasATratar.FieldByName('IDTITULAR').AsString+',                 '+ //leofuncef - 02022005 - troquei por IDTITULAR
                 ' 0,                                                                  '+// NUMOCORRENCIAS {0}
                 IntToStr(iNumParcelas)+',                                             '+

                 //leofuncef - 01032005
                 //' 1,                                                                  '+// SEQRUBRICAINDIV,
                 '(SELECT (NVL(MAX(SEQRUBRICAINDIV),0)+1) FROM RUBRICAINDIV WHERE '+
                 ' IDPESSOA = '+qryAcerto.FieldByName('IDPESSOA').AsString+
                 ' AND IDRUBRICA = '+IntToStr(iIdRubrica)+'), '+ // SEQRUBRICAINDIV,
                 //leofuncef - 01032005 - fim

                 ' ''0000/00'',                                                       '+
                 ' 0,                                                                 '+ // VALORANTERIOR {0}
                 OraNumero(FormatFloat('#0.00',Abs(dTotalAcerto)))+' ';                  // VALORRUBRICA

         if Trim(dblkpcmbRegraParcela.Text) <> ''
         then sSQL := sSQL + ','+qryRegraParcela.FieldByName('IDREGRA').AsString+', '
         else sSQL := sSQL + ',NULL, ';

         { Augusto 10/03/2006 }
         sSQL := sSQL + qryLote.FieldByName('IDLOTE').AsString+', '+          // IDLOTEREVISAO
                        IntToStr( iIdMovBenef )+') ';                         // IDMOVBENNF



         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(sSQL);
         try
            qryAux.ExecSQL;
         except
            if not chkGravaDemons.Checked
            then mmResult.Lines.Add('      [AVISO] Erro ao inserir parcelamento. Parcelamento não Processado. Verifique. ');
            GravaLinhaTXT('      [AVISO] Erro ao inserir parcelamento. Parcelamento não Processado. Verifique. ');
            Exit;
         end;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT DESCRICAO FROM PROVDESC WHERE IDPROVENTO = '+IntToStr(iIdRubrica));
         qryAux.Open;

         if not chkGravaDemons.Checked
         then mmResult.Lines.Add('      '+PreparaStr(' '                                    ,36)+
                                          PreparaStr(' '                                    ,10)+
                                          PreparaStr('- RUBRICA '+IntToStr(iIdRubrica)+':'  ,25)+
                                          PreparaStr(IntToStr(iNumParcelas)+' parcelas de ' ,18)+
                                          PreparaStr(FormatFloat('#0.00',dTotalAcerto)      ,15)+
                                          PreparaStr('['+qryAux.FieldByName('DESCRICAO').AsString+']',40));
         GravaLinhaTXT('      '+PreparaStr(' '                                    ,36)+
                                          PreparaStr(' '                                    ,10)+
                                          PreparaStr('- RUBRICA '+IntToStr(iIdRubrica)+':'  ,25)+
                                          PreparaStr(IntToStr(iNumParcelas)+' parcelas de ' ,18)+
                                          PreparaStr(FormatFloat('#0.00',dTotalAcerto)      ,15)+
                                          PreparaStr('['+qryAux.FieldByName('DESCRICAO').AsString+']',40));

         qryAcerto.Next;
      end;

   end;


   //se está neste ponto, quer dizer que o parcelamento foi efetuado,
   //então, "receber e pagar" todas as comntribuições e benefícios gerados
   //"recebe" contribuições enviadas ara
   qryaux.close;
   qryaux.SQL.text :=
                   ' UPDATE HSTCONTRIBPREV  SET  '+  //' MESCOBRANCA = MESREFERENCIA, '+ { Augusto 31/05/2004 - Retirado }
                   ' DATARECEBIMENTO = LAST_DAY(TO_DATE(SUBSTR(MESREFERENCIA,1,4)||DECODE(SUBSTR(MESREFERENCIA,5,3),''/13'',''/12'',SUBSTR(MESREFERENCIA,5,3)),''YYYY/MM''))  , '+
                   ' SITRECEBIMENTO = 2,  VALORRECEBIDO  = VALORESPERADO '+
                   ' WHERE  IDPESSJUR    = '+qryPessoasATratar.FieldByName('IDPESSJUR').AsString        +
                   ' AND    IDPLANOPREV  = '+qryPessoasATratar.FieldByName('IDPLANOPREV').AsString      +
                   ' AND    IDPESSOA     = '+qrydadosbeneficio.fieldbyname('IDPESSOA').AsString         +
                   ' AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString      +
                   ' AND    IDLOTE       = '+qryLote.FieldByName('IDLOTE').AsString                     +
                   ' AND    IDMOTIVO     = '+qryMotivo.FieldByName('IDMOTIVO').AsString  ;
   try
      qryAux.ExecSQL;
   except
      if not chkGravaDemons.Checked
      then mmResult.Lines.Add('      [AVISO] Erro ao acertar contribuições parceladas. Parcelamento não Processado. Verifique. ');
      GravaLinhaTXT('      [AVISO] Erro ao acertar contribuições parceladas. Parcelamento não Processado. Verifique. ');
      Exit;
   end;


   //leofuncef - 20042005
   //verifica que registros dar como pago
   //caso o usuário tenha feito uma revisão de INSS separada da suplementação
   //e esteja parcelaendo apenas uma delas, o sistema não pode dar como pagos
   //rodos os registros
   sFontePagadora := '';
   if (abs(dTotalINSS) > 0) and (abs(dTotalBenef) >0) then  sFontePagadora := '1,2'
   else if (abs(dTotalINSS) > 0) and (abs(dTotalBenef) <=0) then  sFontePagadora := '2'
   else if (abs(dTotalINSS) <= 0) and (abs(dTotalBenef) >0) then  sFontePagadora := '1';
   //leofuncef - 20042005 - fim

   qryaux.close;
   qryaux.SQL.text := ' UPDATE HSTBENEFBFCIARIO  SET  '+ //'MES = MESREFERENCIA, '+ { Augusto 31/05/2004 - Retirado }
                      ' DTEFETPGTO = LAST_DAY(TO_DATE(SUBSTR(MESREFERENCIA,1,4)||DECODE(SUBSTR(MESREFERENCIA,5,3),''/13'',''/12'',SUBSTR(MESREFERENCIA,5,3)),''YYYY/MM'')) ,'+
                      ' FLGENVIADO = 1,  VLBENEFPGTO  = VALORPREV '+
                      ' WHERE  IDPESSJUR    = '+qrydadosbeneficio.fieldbyname('IDPESSJUR').AsString+
                      ' AND    IDPLANOPREV  = '+qrydadosbeneficio.fieldbyname('IDPLANOPREV').AsString+
                      ' AND    IDPESSOA     = '+qrydadosbeneficio.fieldbyname('IDPESSOA').AsString+
                      ' AND    IDTITULAR    = '+qrydadosbeneficio.fieldbyname('IDTITULAR').AsString+
                      ' AND    SEQPROPOSTA  = '+qryPessoasATratar.FieldByName('SEQPROPOSTA').AsString +
                      ' AND    IDLOTE       = '+qryLote.FieldByName('IDLOTE').AsString                +
                      ' AND    IDMOTIVO     = '+qryMotivo.FieldByName('IDMOTIVO').AsString+
                      ' AND    FONTEPAGADORA IN ('+sFontePagadora+') ';
                      //' AND    FLGDEVOLUCAO = 1 '; { Augusto 31/05/2004 - Retirado }     //leofuncef - 18022005 - se o cara tiver dívida com fundação, não pode verificar o flgdevolucao
   try
      qryAux.ExecSQL;
   except
      if not chkGravaDemons.Checked
      then mmResult.Lines.Add('      [AVISO] Erro ao acertar benefícios parcelados. Parcelamento não Processado. Verifique. ');
      GravaLinhaTXT('      [AVISO] Erro ao acertar benefícios parcelados. Parcelamento não Processado. Verifique. ');
      Exit;
   end;

   Result := True;
end;

procedure TfrmRetroativoPREV.ExibeDemonstrativoRevisaoBeneficio
;
var i                  : integer;
    iLoop              : integer;
    sNomePessoa ,sSQL : String;
    dValorAtual : Double;
begin

   if not chkGravaDemons.Checked
   then mmResult.Lines.Add('      [ OK  ] Revisão de Benefício');
   GravaLinhaTXT('      [ OK  ] Revisão de Benefício');

    if not chkGravaDemons.Checked
    then begin
       mmResult.Lines.Add('      '+PreparaStr('Mês',7)+'  '+PreparaStr('SRB'  ,8)+PreparaStr('SRB'   ,8)+PreparaStr('Sal.Virt.'  ,10)+PreparaStr('Sal.Virt.'   ,10)+PreparaStr('Reserva'   ,10)+PreparaStr('Valor do Item'    ,17)+PreparaStr('Novo Valor ',15)+PreparaStr('Diferença ',15)+
                          { Augusto 21/03/2005 - Alterado para novo controle de alteradores }
                          //PreparaStr('Índice '   ,15)+
                          PreparaStr('Diferença ',15)+PreparaStr(' Descrição',20));
       mmResult.Lines.Add(                '               '+PreparaStr('Antes',8)+PreparaStr('Depois',8)+PreparaStr('Antes',10)      +PreparaStr('Depois',10)      +PreparaStr('Utiliz.'   ,10)+PreparaStr('Antes do Recalc.' ,17)+PreparaStr('do Item'    ,15)+PreparaStr(' '         ,15)+
                          { Augusto 21/03/2005 - Alterado para novo controle de alteradores }
                          //PreparaStr('Correção  ',15)+
                          PreparaStr('Corrigida ',15));
    end;

    GravaLinhaTXT('      '+PreparaStr('Mês',7)+'  '+PreparaStr('SRB'  ,8)+PreparaStr('SRB'   ,8)+PreparaStr('Sal.Virt.'  ,10)+PreparaStr('Sal.Virt.'   ,10)+PreparaStr('Reserva'   ,10)+PreparaStr('Valor do Item'    ,17)+PreparaStr('Novo Valor ',15)+PreparaStr('Diferença ',15)+
                  { Augusto 21/03/2005 - Alterado para novo controle de alteradores }
                  //PreparaStr('Índice '   ,15)+
                  PreparaStr('Diferença ',15)+PreparaStr(' Descrição',20));
    GravaLinhaTXT('               '+PreparaStr('Antes',8)+PreparaStr('Depois',8)+PreparaStr('Antes'      ,10)+PreparaStr('Depois'      ,10)+PreparaStr('Utiliz.'   ,10)+PreparaStr('Antes do Recalc.' ,17)+PreparaStr('do Item'    ,15)+PreparaStr(' '         ,15)+
                  { Augusto 21/03/2005 - Alterado para novo controle de alteradores }
                  //PreparaStr('Correção  ',15)+
                  PreparaStr('Corrigida ',15));
    { Inicio Augusto 31/03/2004 }
    dTotalBenef   := 0; dTotalBenefPessoa   := 0;
    dTotalContrib := 0; dTotalContribPessoa := 0;
    dTotalINSS    := 0; dTotalINSSPessoa    := 0;
    { Fim Augusto 31/03/2004 }

    // ************************************************************************************
    // GRAVAR DEMONSTRATIVO NA SEGUINTE ORDEM
    // 1o. INSS
    // 2o. SUPLEMENTACAO
    // 3o. CONTRIBUICAO
    // ************************************************************************************
    qryDemonstrativo.First;
    { Augusto 02/02/2004 }
    sNomePessoa := '*';
    while not qryDemonstrativo.Eof do
    begin
       if qryDemonstrativo.FieldbyName('TIPO').AsString <> 'I' // inss
       then begin
          qryDemonstrativo.Next;
          continue;
       end;
       { Augusto 02/02/2004 }
       If sNomePessoa <> qryDemonstrativo.FieldbyName('NOMEBENEF').AsString Then Begin

         { Inicio Augusto 01/07/2005 - Buscar valor atual do beneficio }
         sSQL := 'SELECT B.VALORATUAL '+
                 'FROM BENEFBFCIARIO B '+
                 'WHERE     B.IDTITULAR     = '+qryDemonstrativo.FieldByName('IDTITULAR').AsString     +' '+
                 '      AND B.IDPLANOPREV   = '+qryDemonstrativo.FieldByName('IDPLANOPREV').AsString   +' '+
                 '      AND B.IDPESSOA      = '+qryDemonstrativo.FieldByName('IDPESSOA').AsString      +' '+
                 '      AND B.IDBENEFICIO   = '+qryDemonstrativo.FieldByName('IDENTIFICADOR').AsString +' '+
                 '      AND B.IDSITBENEFICIO = 1 ';
         If FazQuery(QryAux,sSQL) Then Begin
           dValorAtual  := QryAux.FieldByName('VALORATUAL').AsFloat;
         End;
         if not chkGravaDemons.Checked then
           mmResult.Lines.Add('      '+PreparaStr(qryDemonstrativo.FieldbyName('NOMEBENEF').AsString,50)+
                              ' Valor atual do benefício R$ '+PreparaStr(AlinhaDireita(FormatFloat('##0.00',(dValorAtual)),9),12)
                              );
         GravaLinhaTXT('      '+PreparaStr(qryDemonstrativo.FieldbyName('NOMEBENEF').AsString,50)+
                       ' Valor atual do benefício R$ '+PreparaStr(AlinhaDireita(FormatFloat('##0.00',(dValorAtual)),9),12)
                      );
         { Fim Augusto 01/07/2005 }
         sNomePessoa := qryDemonstrativo.FieldbyName('NOMEBENEF').AsString;
       End;
       if qryDemonstrativo.FieldbyName('ANOMES').AsString <> '0000/00'
       then begin
          if not chkGravaDemons.Checked
          then begin
             mmResult.Lines.Add('      '+PreparaStr(qryDemonstrativo.FieldByName('ANOMES').AsString,7)+'  '+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SRBANTES').AsFloat),         8)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SRBDEPOIS').AsFloat),        8)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SALVIRTUALANTES').AsFloat), 10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SALVIRTUALDEPOIS').AsFloat),10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('RESERVADEPOIS').AsFloat),   10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('VALORANTES').AsFloat),      17)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('VALORDEPOIS').AsFloat),     17)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('DIFERENCA').AsFloat),       15)+

                                         { Augusto 21/03/2005 - Alterado para novo controle de alteradores }
                                         //PreparaStr(FormatFloat('#0.0000',qryDemonstrativo.FieldByName('INDICE').AsFloat),        13)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('DIFERENCACORRIGIDA').AsFloat),13)+

                                         PreparaStr(qryDemonstrativo.FieldByName('DESCRICAO').AsString,                           30));
          end;
          GravaLinhaTXT('      '+PreparaStr(qryDemonstrativo.FieldByName('ANOMES').AsString,7)+'  '+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SRBANTES').AsFloat),         8)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SRBDEPOIS').AsFloat),        8)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SALVIRTUALANTES').AsFloat), 10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SALVIRTUALDEPOIS').AsFloat),10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('RESERVADEPOIS').AsFloat),   10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('VALORANTES').AsFloat),      17)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('VALORDEPOIS').AsFloat),     17)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('DIFERENCA').AsFloat),       15)+
                                         { Augusto 21/03/2005 - Alterado para novo controle de alteradores }
                                         //PreparaStr(FormatFloat('#0.0000',qryDemonstrativo.FieldByName('INDICE').AsFloat),        13)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('DIFERENCACORRIGIDA').AsFloat),13)+

                                         PreparaStr(qryDemonstrativo.FieldByName('DESCRICAO').AsString,                           30));

          { Inicio Augusto 18/01/2005 - Imprime os Alteradores }
          sSQL := 'SELECT H.CODALTERADOR, H.VALOR, T.DESCRICAO '+
                  'FROM HSTATRASOBENEF H, TIPOALTERADOR T      '+
                  'WHERE H.CODALTERADOR = T.CODALTERADOR       '+
                  '      AND H.IDTITULAR     = '+qryDemonstrativo.FieldByName('IDTITULAR').AsString     +' '+
                  '      AND H.IDPLANOPREV   = '+qryDemonstrativo.FieldByName('IDPLANOPREV').AsString   +' '+
                  '      AND H.IDPESSOA      = '+qryDemonstrativo.FieldByName('IDPESSOA').AsString      +' '+
                  '      AND H.IDBENEFICIO   = '+qryDemonstrativo.FieldByName('IDENTIFICADOR').AsString +' '+
                  '      AND H.IDMOTIVO      = '+QryMotivo.FieldByName('IDMOTIVO').AsString             +' '+
                  '      AND H.MES           = '''+edMesAcerto.Text+''''+
                  '      AND H.MESREFERENCIA = '+QuotedStr(qryDemonstrativo.FieldByName('ANOMES').AsString)+'  ';
          If FazQuery(QryAux,sSQL) Then Begin
            While Not QryAux.EOF Do Begin
              mmResult.Lines.Add(PreparaStr(' ',62)+PreparaStr(QryAux.FieldByName('DESCRICAO').AsString+' :',30)+' R$ '+
                                 PreparaStr(AlinhaDireita(FormatFloat('##0.00',(QryAux.FieldByName('VALOR').AsFloat)),9),12));
              GravaLinhaTXT(     PreparaStr(' ',62)+PreparaStr(QryAux.FieldByName('DESCRICAO').AsString+' :',30)+' R$ '+
                                 PreparaStr(AlinhaDireita(FormatFloat('##0.00',(QryAux.FieldByName('VALOR').AsFloat)),9),12));
              QryAux.Next;
            End; { While }
          End;
          { Fim Augusto 18/01/2005 }

          dTotalINSS   := dTotalINSS  + qryDemonstrativo.FieldByName('DIFERENCACORRIGIDA').AsFloat;
          { Augusto 31/03/2004 }
          dTotalINSSPessoa := dTotalINSSPessoa + qryDemonstrativo.FieldByName('DIFERENCACORRIGIDA').AsFloat
       end;

       qryDemonstrativo.Next;
       { Inicio Augusto 31/03/2004 }
       If (sNomePessoa <> qryDemonstrativo.FieldbyName('NOMEBENEF').AsString) And
           (qryDemonstrativo.FieldbyName('NOMEBENEF').AsString = 'B') Then Begin
         if not chkGravaDemons.Checked then begin
           mmResult.Lines.Add('      ');
           mmResult.Lines.Add('      '+PreparaStr('                             '   ,46)+
                                       PreparaStr('  INSS :       '                 ,30)+
                                       PreparaStr(' '                               ,13)+
                                       PreparaStr(FormatFloat('#0.00',dTotalINSSPessoa)   ,15));
         end;
         GravaLinhaTXT(         '      '+PreparaStr('                             '   ,46)+
                                     PreparaStr('  INSS :       '                 ,43)+
                                     PreparaStr(FormatFloat('#0.00',dTotalINSS)   ,15));
         dTotalINSSPessoa := 0;
       End;
       { Fim Augusto 31/03/2004 }
    end;


    if not chkGravaDemons.Checked
    then mmResult.Lines.Add('      ---------------------------------------------------------------------------------------------------------------------------------------------------------');
    GravaLinhaTXT(              '      ---------------------------------------------------------------------------------------------------------------------------------------------------------');

    qryDemonstrativo.First;
    { Augusto 02/02/2004 }
    sNomePessoa := '*';
    while not qryDemonstrativo.Eof do
    begin
       if qryDemonstrativo.FieldbyName('TIPO').AsString <> 'B' // beneficio
       then begin
          qryDemonstrativo.Next;
          continue;
       end;

       { Augusto 02/02/2004 }
       If sNomePessoa <> qryDemonstrativo.FieldbyName('NOMEBENEF').AsString Then Begin
         { Inicio Augusto 01/07/2005 - Buscar valor atual do beneficio }
         sSQL := 'SELECT B.VALORATUAL '+
                 'FROM BENEFBFCIARIO B '+
                 'WHERE     B.IDTITULAR     = '+qryDemonstrativo.FieldByName('IDTITULAR').AsString     +' '+
                 '      AND B.IDPLANOPREV   = '+qryDemonstrativo.FieldByName('IDPLANOPREV').AsString   +' '+
                 '      AND B.IDPESSOA      = '+qryDemonstrativo.FieldByName('IDPESSOA').AsString      +' '+
                 '      AND B.IDBENEFICIO   = '+qryDemonstrativo.FieldByName('IDENTIFICADOR').AsString +' '+
                 '      AND B.IDSITBENEFICIO = 1 ';
         If FazQuery(QryAux,sSQL) Then Begin
           dValorAtual  := QryAux.FieldByName('VALORATUAL').AsFloat;
         End;
         if not chkGravaDemons.Checked then
           mmResult.Lines.Add('      '+PreparaStr(qryDemonstrativo.FieldbyName('NOMEBENEF').AsString,50)+
                              ' Valor atual do benefício R$ '+PreparaStr(AlinhaDireita(FormatFloat('##0.00',(dValorAtual)),9),12)
                              );
         GravaLinhaTXT('      '+PreparaStr(qryDemonstrativo.FieldbyName('NOMEBENEF').AsString,50)+
                       ' Valor atual do benefício R$ '+PreparaStr(AlinhaDireita(FormatFloat('##0.00',(dValorAtual)),9),12)
                      );
         { Fim Augusto 01/07/2005 }
         sNomePessoa := qryDemonstrativo.FieldbyName('NOMEBENEF').AsString;
       End;

       if qryDemonstrativo.FieldbyName('ANOMES').AsString <> '0000/00'
       then begin
          if not chkGravaDemons.Checked
          then begin
             mmResult.Lines.Add('      '+PreparaStr(qryDemonstrativo.FieldByName('ANOMES').AsString,7)+'  '+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SRBANTES').AsFloat),         8)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SRBDEPOIS').AsFloat),        8)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SALVIRTUALANTES').AsFloat), 10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SALVIRTUALDEPOIS').AsFloat),10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('RESERVADEPOIS').AsFloat),   10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('VALORANTES').AsFloat),      17)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('VALORDEPOIS').AsFloat),     17)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('DIFERENCA').AsFloat),       15)+
                                         { Augusto 21/03/2005 - Alterado para novo controle de alteradores }
                                         //PreparaStr(FormatFloat('#0.0000',qryDemonstrativo.FieldByName('INDICE').AsFloat),        13)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('DIFERENCACORRIGIDA').AsFloat),13)+

                                         PreparaStr(qryDemonstrativo.FieldByName('DESCRICAO').AsString,                           20));
          end;


          GravaLinhaTXT(         '      '+PreparaStr(qryDemonstrativo.FieldByName('ANOMES').AsString,7)+'  '+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SRBANTES').AsFloat),         8)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SRBDEPOIS').AsFloat),        8)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SALVIRTUALANTES').AsFloat), 10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SALVIRTUALDEPOIS').AsFloat),10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('RESERVADEPOIS').AsFloat),   10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('VALORANTES').AsFloat),      17)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('VALORDEPOIS').AsFloat),     17)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('DIFERENCA').AsFloat),       15)+

                                         { Augusto 21/03/2005 - Alterado para novo controle de alteradores }
                                         //PreparaStr(FormatFloat('#0.0000',qryDemonstrativo.FieldByName('INDICE').AsFloat),        15)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('DIFERENCACORRIGIDA').AsFloat),13)+

                                         PreparaStr(qryDemonstrativo.FieldByName('DESCRICAO').AsString,                           20));

          { Inicio Augusto 18/01/2005 - Imprime os Alteradores }
          sSQL := 'SELECT H.CODALTERADOR, H.VALOR, T.DESCRICAO '+
                  'FROM HSTATRASOBENEF H, TIPOALTERADOR T      '+
                  'WHERE H.CODALTERADOR = T.CODALTERADOR       '+
                  '      AND H.IDTITULAR     = '+qryDemonstrativo.FieldByName('IDTITULAR').AsString     +' '+
                  '      AND H.IDPLANOPREV   = '+qryDemonstrativo.FieldByName('IDPLANOPREV').AsString   +' '+
                  '      AND H.IDPESSOA      = '+qryDemonstrativo.FieldByName('IDPESSOA').AsString      +' '+
                  '      AND H.IDBENEFICIO   = '+qryDemonstrativo.FieldByName('IDENTIFICADOR').AsString +' '+
                  '      AND H.IDMOTIVO      = '+QryMotivo.FieldByName('IDMOTIVO').AsString             +' '+
                  '      AND H.MES           = '''+edMesAcerto.Text+''''+
                  '      AND H.MESREFERENCIA = '+QuotedStr(qryDemonstrativo.FieldByName('ANOMES').AsString)+'  ';
          If FazQuery(QryAux,sSQL) Then Begin
            While Not QryAux.EOF Do Begin
              mmResult.Lines.Add(PreparaStr(' ',62)+PreparaStr(QryAux.FieldByName('DESCRICAO').AsString+' :',30)+' R$ '+
                                 PreparaStr(AlinhaDireita(FormatFloat('##0.00',(QryAux.FieldByName('VALOR').AsFloat)),9),12));
              GravaLinhaTXT(     PreparaStr(' ',62)+PreparaStr(QryAux.FieldByName('DESCRICAO').AsString+' :',30)+' R$ '+
                                 PreparaStr(AlinhaDireita(FormatFloat('##0.00',(QryAux.FieldByName('VALOR').AsFloat)),9),12));
              QryAux.Next;
            End; { While }
          End;
          { Fim Augusto 18/01/2005 }

          dTotalBenef   := dTotalBenef  + qryDemonstrativo.FieldByName('DIFERENCACORRIGIDA').AsFloat;
          { Augusto 31/03/2004 }
          dTotalBenefPessoa   := dTotalBenefPessoa  + qryDemonstrativo.FieldByName('DIFERENCACORRIGIDA').AsFloat
       end;
       qryDemonstrativo.Next;

       { Inicio Augusto 31/03/2004 }
       If (sNomePessoa <> qryDemonstrativo.FieldbyName('NOMEBENEF').AsString) And
           (qryDemonstrativo.FieldbyName('NOMEBENEF').AsString = 'B') Then Begin
         if not chkGravaDemons.Checked then begin
           mmResult.Lines.Add('      ');
           mmResult.Lines.Add('      '+PreparaStr(' '                               ,46)+
                                       PreparaStr('  BENEFÍCIOS : '                 ,43)+
                                       PreparaStr(FormatFloat('#0.00',dTotalBenefPessoa)  ,15));
         end;
         GravaLinhaTXT(         '      '+PreparaStr(' '                               ,46)+
                                     PreparaStr('  BENEFÍCIOS : '                 ,43)+
                                     PreparaStr(FormatFloat('#0.00',dTotalBenef)  ,15));
         dTotalBenefPessoa := 0;
       End;
       { Fim Augusto 31/03/2004 }
    end;

    if bExcedeuLimite
    then begin
       if not chkGravaDemons.Checked
       then begin
          mmResult.Lines.Add('       ');
          mmResult.Lines.Add('      ******************************************** ');
          mmResult.Lines.Add('      [ ATENÇÃO ] LIMITE DE BENEFÍCIO ULTRAPASSADO ');
          mmResult.Lines.Add('      ******************************************** ');
          mmResult.Lines.Add('       ');
       end;
       GravaLinhaTXT(              '       ');
       GravaLinhaTXT(              '      ******************************************** ');
       GravaLinhaTXT(              '      [ ATENÇÃO ] LIMITE DE BENEFÍCIO ULTRAPASSADO ');
       GravaLinhaTXT(              '      ******************************************** ');
       GravaLinhaTXT(              '       ');
    end;

    if not chkGravaDemons.Checked
    then mmResult.Lines.Add('      ---------------------------------------------------------------------------------------------------------------------------------------------------------');
    GravaLinhaTXT(
            '      ---------------------------------------------------------------------------------------------------------------------------------------------------------');

    { CONTRIBUIÇÕES }
    qryDemonstrativo.First;
    sNomePessoa := '*'; { Augusto 05/03/2004 }
    while not qryDemonstrativo.Eof do
    begin
       if qryDemonstrativo.FieldbyName('TIPO').AsString <> 'C' // CONTRIBUICAO
       then begin
          qryDemonstrativo.Next;
          { Inicio Augusto 31/03/2004 }
          If (sNomePessoa <> qryDemonstrativo.FieldbyName('NOMEBENEF').AsString) And
             (dTotalContribPessoa <> 0)
          Then Begin
            if not chkGravaDemons.Checked then begin
              mmResult.Lines.Add('      ');
              mmResult.Lines.Add('      '+PreparaStr(' '                               ,46)+
                                          PreparaStr('- CONTRIBUIÇÕES : '              ,43)+
                                          PreparaStr(FormatFloat('#0.00',dTotalContribPessoa),15));
            end;
            GravaLinhaTXT(         '      '+PreparaStr(' '                               ,46)+
                                            PreparaStr('- CONTRIBUIÇÕES : '              ,43)+
                                            PreparaStr(FormatFloat('#0.00',dTotalContrib),15));
            dTotalContribPessoa := 0;
          End;
          { Fim Augusto 31/03/2004 }
          continue;
       end;

       if qryDemonstrativo.FieldbyName('ANOMES').AsString <> '0000/00'
       then begin
          { Augusto 05/03/2004 }
          If sNomePessoa <> qryDemonstrativo.FieldbyName('NOMEBENEF').AsString Then Begin
            if not chkGravaDemons.Checked then
              mmResult.Lines.Add('      '+PreparaStr(qryDemonstrativo.FieldbyName('NOMEBENEF').AsString,50));
            GravaLinhaTXT('      '+PreparaStr(qryDemonstrativo.FieldbyName('NOMEBENEF').AsString,50));
            sNomePessoa := qryDemonstrativo.FieldbyName('NOMEBENEF').AsString;
          End;

          if not chkGravaDemons.Checked
          then begin
             mmResult.Lines.Add('      '+PreparaStr(qryDemonstrativo.FieldByName('ANOMES').AsString,7)+'  '+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SRBANTES').AsFloat),         8)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SRBDEPOIS').AsFloat),        8)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SALVIRTUALANTES').AsFloat), 10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SALVIRTUALDEPOIS').AsFloat),10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('RESERVADEPOIS').AsFloat),   10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('VALORANTES').AsFloat),      17)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('VALORDEPOIS').AsFloat),     17)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('DIFERENCA').AsFloat),       15)+
                                         { Augusto 21/03/2005 - Alterado para novo controle de alteradores }
                                         //PreparaStr(FormatFloat('#0.0000',qryDemonstrativo.FieldByName('INDICE').AsFloat),        13)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('DIFERENCACORRIGIDA').AsFloat),13)+

                                         PreparaStr(qryDemonstrativo.FieldByName('DESCRICAO').AsString,                           30));
          end;


          GravaLinhaTXT(         '      '+PreparaStr(qryDemonstrativo.FieldByName('ANOMES').AsString,7)+'  '+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SRBANTES').AsFloat),         8)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SRBDEPOIS').AsFloat),        8)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SALVIRTUALANTES').AsFloat), 10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('SALVIRTUALDEPOIS').AsFloat),10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('RESERVADEPOIS').AsFloat),   10)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('VALORANTES').AsFloat),      17)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('VALORDEPOIS').AsFloat),     17)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('DIFERENCA').AsFloat),       15)+
                                         { Augusto 21/03/2005 - Alterado para novo controle de alteradores }
                                         //PreparaStr(FormatFloat('#0.0000',qryDemonstrativo.FieldByName('INDICE').AsFloat),        13)+
                                         PreparaStr(FormatFloat('#0.00',qryDemonstrativo.FieldByName('DIFERENCACORRIGIDA').AsFloat),13)+

                                         PreparaStr(qryDemonstrativo.FieldByName('DESCRICAO').AsString,                           30));

          { Inicio Augusto 18/01/2005 - Imprime os Alteradores - 0024124}
          sSQL := 'SELECT HA.CODALTERADOR, HA.VALOR, T.DESCRICAO '+
                  'FROM HSTCONTRIBPREV H, HSTATRASOCONTRIB HA, TIPOALTERADOR T      '+
                  'WHERE     H.IDPLANOPREV    = '+qryDemonstrativo.FieldByName('IDPLANOPREV').AsString      +' '+
                  '      AND H.IDPESSOA       = '+qryDemonstrativo.FieldByName('IDPESSOA').AsString         +' '+
                  '      AND H.IDCONTRIBUICAO = '+qryDemonstrativo.FieldByName('IDENTIFICADOR').AsString    +' '+
                  '      AND H.MESCOBRANCA    = '''+edMesAcerto.Text+''''+
                  '      AND H.MESREFERENCIA  = '+QuotedStr(qryDemonstrativo.FieldByName('ANOMES').AsString)+'  '+
                  '      AND H.IDMOTIVO       = '+qryMotivo.FieldByName('IDMOTIVO').AsString               +
                  '      AND H.IDLOTE         = '+qryLote.FieldByName('IDLOTE').AsString                   +
                  '      AND H.NUMRECEBIMENTO = HA.NUMRECEBIMENTO '+
                  '      AND HA.CODALTERADOR  = T.CODALTERADOR ' ;
          If FazQuery(QryAux,sSQL) Then Begin
            While Not QryAux.EOF Do Begin
              mmResult.Lines.Add(PreparaStr(' ',62)+PreparaStr(QryAux.FieldByName('DESCRICAO').AsString+' :',30)+' R$ '+
                                 PreparaStr(AlinhaDireita(FormatFloat('##0.00',(QryAux.FieldByName('VALOR').AsFloat)),9),12));
              GravaLinhaTXT(     PreparaStr(' ',62)+PreparaStr(QryAux.FieldByName('DESCRICAO').AsString+' :',30)+' R$ '+
                                 PreparaStr(AlinhaDireita(FormatFloat('##0.00',(QryAux.FieldByName('VALOR').AsFloat)),9),12));
              QryAux.Next;
            End; { While }
          End;
          { Fim Augusto 18/01/2005 }


          dTotalContrib := dTotalContrib + qryDemonstrativo.FieldByName('DIFERENCACORRIGIDA').AsFloat;
          { Augusto 31/03/2004 }
          dTotalContribPessoa := dTotalContribPessoa + qryDemonstrativo.FieldByName('DIFERENCACORRIGIDA').AsFloat
       end;
       qryDemonstrativo.Next;

       { Inicio Augusto 31/03/2004 }
       If (sNomePessoa <> qryDemonstrativo.FieldbyName('NOMEBENEF').AsString) And
           (qryDemonstrativo.FieldbyName('NOMEBENEF').AsString = 'C')  Then Begin
         if not chkGravaDemons.Checked then begin
           mmResult.Lines.Add('      ');
           mmResult.Lines.Add('      '+PreparaStr(' '                               ,46)+
                                       PreparaStr('  CONTRIBUIÇÕES : '              ,43)+
                                       PreparaStr(FormatFloat('#0.00',dTotalContribPessoa),15));
         end;
         GravaLinhaTXT(         '      '+PreparaStr(' '                               ,46)+
                                     PreparaStr('  CONTRIBUIÇÕES : '              ,43)+
                                     PreparaStr(FormatFloat('#0.00',dTotalContrib),15));
         dTotalContribPessoa := 0;
       End;
       { Fim Augusto 31/03/2004 }
    end;

    if not chkGravaDemons.Checked
    then mmResult.Lines.Add('      ---------------------------------------------------------------------------------------------------------------------------------------------------------');
    GravaLinhaTXT(              '      ---------------------------------------------------------------------------------------------------------------------------------------------------------');

    if not chkGravaDemons.Checked
    then begin
       mmResult.Lines.Add('      '+PreparaStr('TOTAL DE ACERTOS (CORRIGIDOS)'   ,36)+
                                   PreparaStr(' '                               ,10)+
                                   PreparaStr('- INSS :       '                 ,15)+
                                   PreparaStr(' '                               ,15)+
                                   PreparaStr(' '                               ,13)+
                                   PreparaStr(FormatFloat('#0.00',dTotalINSS)   ,15));

       mmResult.Lines.Add('      '+PreparaStr(' '                               ,36)+
                                   PreparaStr(' '                               ,10)+
                                   PreparaStr('- BENEFÍCIOS : '                 ,15)+
                                   PreparaStr(' '                               ,15)+
                                   PreparaStr(' '                               ,13)+
                                   PreparaStr(FormatFloat('#0.00',dTotalBenef)  ,15));
       mmResult.Lines.Add('      '+PreparaStr(' '                               ,36)+
                                   PreparaStr(' '                               ,10)+
                                   PreparaStr('- CONTRIBUIÇÕES : '              ,20)+
                                   PreparaStr(' '                               ,10)+
                                   PreparaStr(' '                               ,13)+
                                   PreparaStr(FormatFloat('#0.00',dTotalContrib),15));
    end;

    GravaLinhaTXT(         '      '+PreparaStr('TOTAL DE ACERTOS (CORRIGIDOS)'   ,36)+
                                PreparaStr(' '                               ,10)+
                                PreparaStr('- INSS :       '                 ,15)+
                                PreparaStr(' '                               ,15)+
                                PreparaStr(' '                               ,13)+
                                PreparaStr(FormatFloat('#0.00',dTotalINSS)   ,15));

    GravaLinhaTXT(         '      '+PreparaStr(' '                               ,36)+
                                PreparaStr(' '                               ,10)+
                                PreparaStr('- BENEFÍCIOS : '                 ,15)+
                                PreparaStr(' '                               ,15)+
                                PreparaStr(' '                               ,13)+
                                PreparaStr(FormatFloat('#0.00',dTotalBenef)  ,15));
    GravaLinhaTXT(         '      '+PreparaStr(' '                               ,36)+
                                PreparaStr(' '                               ,10)+
                                PreparaStr('- CONTRIBUIÇÕES : '              ,20)+
                                PreparaStr(' '                               ,10)+
                                PreparaStr(' '                               ,13)+
                                PreparaStr(FormatFloat('#0.00',dTotalContrib),15));

    // CAMILLE - 05.11.2004
    if (chkCommitIndiv.Checked) and (bExcedeuLimite)
    then begin
         if dtmBaseDados.dbBaseDados.InTransaction
         then begin
            dtmBaseDados.dbBaseDados.Rollback;
            dtmBaseDados.dbBaseDados.StartTransaction;
         end;
    end;

end; // ExibeDemonstrativoRevisaoBeneficio

procedure TfrmRetroativoPREV.rbRecalcBenefClick(Sender: TObject);
begin
  inherited;
  rgrpRecalculaBeneficio.Visible    := True;
  grpInsereMesNaoEncontrado.Visible := True;
  PnlBeneficiosRevisar.Visible      := True;
  chkReajustaSalPartInicio.Visible  := False; // Gleyber - 25/07/2006 - Pendência 22731
  Label65.Visible                   := False; // Gleyber - 25/07/2006 - Pendência 22731
end;

procedure TfrmRetroativoPREV.rbRevisaoContribuicaoClick(Sender: TObject);
begin
  inherited;
  rgrpRecalculaBeneficio.Visible    := False;
  grpInsereMesNaoEncontrado.Visible := False;
  PnlBeneficiosRevisar.Visible      := False;
  chkReajustaSalPartInicio.Visible  := True; // Gleyber - 25/07/2006 - Pendência 22731
  Label65.Visible                   := True; // Gleyber - 25/07/2006 - Pendência 22731
end;

procedure TfrmRetroativoPREV.qryDadosBeneficioAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  { Inicio Augusto 23/04/2003 }
  EdValorBase1.Text := QryDadosBeneficio.FieldByName('VALORBASE1').AsString;
  EdValorBase2.Text := QryDadosBeneficio.FieldByName('VALORBASE2').AsString;
  EdValorBase3.Text := QryDadosBeneficio.FieldByName('VALORBASE3').AsString;

  EdValorBase1.Visible := True;EdValorBase2.Visible := True;EdValorBase2.Visible := True;
  { Inicio Augusto 27/01/2005 }
  If (QryDadosBeneficio.FieldByName('IDREGRACALCOP1').AsInteger = 0) And
     (Trim(EdValorBase1.Text) = '' )
  Then Begin
    Label6.Visible := False;
    EdValorBase1.Visible := False;
  End;
  If (QryDadosBeneficio.FieldByName('IDREGRACALCOP2').AsInteger = 0) And
     (Trim(EdValorBase2.Text) = '' )
  Then Begin
    Label7.Visible := False;
    EdValorBase2.Visible := False;
  End;
  If (QryDadosBeneficio.FieldByName('IDREGRACALCOP3').AsInteger = 0) And
     (Trim(EdValorBase3.Text) = '' )
  Then Begin
    Label13.Visible := False;
    EdValorBase3.Visible := False;
  End;
  { Fim Augusto 27/01/2005 }
  
  { Fim Augusto 23/04/2003 }

end;

procedure TfrmRetroativoPREV.EdValorBase1BtnClick(Sender: TObject);
begin
  inherited;
  { Augusto 22/04/2004 Executar regra de calculo da opcao }
  if (QryDadosBeneficio.IsEmpty) or(Trim(QryDadosBeneficio.FieldByName('IDREGRACALCOP1').AsString) = '')
  then Exit;
  rOpcao := CalculaOpcao(QryDadosBeneficio.FieldByName('IDREGRACALCOP1').AsInteger,
                         'VALORBASE1',
                         QryDadosBeneficio.FieldByName('NOMEVALORBASE1').AsString);
  EdValorBase1.Text  := FloatToStr(rOpcao);
end;

procedure TfrmRetroativoPREV.EdValorBase2BtnClick(Sender: TObject);
begin
  inherited;
  { Augusto 23/04/2004 Executar regra de calculo da opcao }
  if (QryDadosBeneficio.IsEmpty) or(Trim(QryDadosBeneficio.FieldByName('IDREGRACALCOP2').AsString) = '')
  then Exit;
  rOpcao := CalculaOpcao(QryDadosBeneficio.FieldByName('IDREGRACALCOP2').AsInteger,
                         'VALORBASE2',
                         QryDadosBeneficio.FieldByName('NOMEVALORBASE2').AsString);
  EdValorBase2.Text  := FloatToStr(rOpcao);
end;

procedure TfrmRetroativoPREV.EdValorBase3BtnClick(Sender: TObject);
begin
  inherited;
  { Augusto 23/04/2004 Executar regra de calculo da opcao }
  if (QryDadosBeneficio.IsEmpty) or(Trim(QryDadosBeneficio.FieldByName('IDREGRACALCOP3').AsString) = '')
  then Exit;
  rOpcao := CalculaOpcao(QryDadosBeneficio.FieldByName('IDREGRACALCOP3').AsInteger,
                         'VALORBASE3',
                         QryDadosBeneficio.FieldByName('NOMEVALORBASE3').AsString);
  EdValorBase3.Text  := FloatToStr(rOpcao);
end;

function TfrmRetroativoPREV.CalculaOpcao(piIdRegraCalculo: Integer;
                                         sCampo, sTitulo: string): double;
var
  rOpcao, rOpcao1, rOpcao2, rOpcao3 : double;
  bErro  : boolean;
  sMsgErro : string;
begin
  inherited;

  rOpcao := 0;
  Result := 0;

  If piIdRegraCalculo <= 0 Then Exit;


  // Executar regra de calculo da opcao
  if Trim(EdValorBase1.Text) = '' then
    rOpcao1 := 0
  else
    rOpcao1 := StrToFloat(EdValorBase1.Text);

  if Trim(EdValorBase2.Text) = ''  then
    rOpcao2 := 0
  else
    rOpcao2 := StrToFloat(EdValorBase2.Text);

  if Trim(EdValorBase3.Text) = '' then
    rOpcao3 := 0
  else
    rOpcao3 := StrToFloat(EdValorBase3.Text);


  frmAguarde.Mostra('Regra de Cálculo da '+sTitulo+' do Benefício - Nº '+IntToStr(piIdRegraCalculo));

  try
     rOpcao := ExecutaRegraCalculoOpcaoBenef(qryAux,
                         piIdRegraCalculo,
                         piIdRegraCalculo,
                         QryDadosBeneficio.FieldByName('IDPESSJUR').AsInteger,
                         QryDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger,
                         QryDadosBeneficio.FieldByName('IDPESSOA').AsInteger,
                         QryDadosBeneficio.FieldByName('SEQPROPOSTA').AsInteger,
                         QryDadosBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                         QryDadosBeneficio.FieldByName('NUMEROPROCESSO').AsInteger,
                         StrToInt(sIdSitPart),      //StrToInt(sIdSitFuncDepois),
                         StrToInt(sIdSitFunc),      //StrToInt(sIdSitPartDepois),
                         StrToInt(sIdSitPlanoPrev), //StrToInt(sIdSitPlanAntes),
                         rOpcao1, rOpcao2, rOpcao3,
                         //DateToStr(Date),//dtEvento.Text,  // ClaudioR - 19962 - 16/08/2007
                         FormatDateTime('dd/mm/yyyy', Date), // ClaudioR - 19962 - 16/08/2007
                         QryDadosBeneficio.FieldByName('DATAINICIO').AsString,
                         QryDadosBeneficio.FieldByName('DATAINICIOINSS').AsString,
                         QryDadosBeneficio.FieldByName('VLRINFINSS').AsString,
                         QryDadosBeneficio.FieldByName('DATAREQUERIMENTO').AsString,
                         QryDadosBeneficio.FieldByName('VLRCALCINSS').AsString,
                         '0',//slValorBase1INSS,
                         '0',//slValorBase2INSS,
                         '0',//slValorBase3INSS,
                         bErro,
                         sMsgErro,
                         iIdCalculo,
                         '1',//sFlgInternoAntes,     // slFlgInternoAntes ,
                         '1',//sFlgInternoDepois,    // slFlgInternoAtual ,
                         sIdSitPartAntes,            // slIdSitPartAntes  ,
                         sIdSitPlanAntes,            // slIdSitPlanAntes  ,
                         sIdSitFuncAntes,            // slIdSitFuncAntes  ,

                         sIdSitPart,      //sIdSitPartDepois),
                         sIdSitFunc,      //sIdSitFuncDepois),
                         sIdSitPlanoPrev, //sIdSitPlanDepois),
                         QryDadosBeneficio.FieldByName('VALORSRB').AsString);
  except
    frmAguarde.Apaga;
    Raise;
  end;

  qryAux.Close;
  frmAguarde.Apaga;

  if bErro then begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
    TiraSQL(qryAux);
    Exit;
  end else
    Result := rOpcao;
end;

procedure TfrmRetroativoPREV.EdValorBase1Change(Sender: TObject);
begin
  inherited;
  QryDadosBeneficio.Edit;
  QryDadosBeneficio.FieldByName('VALORBASE1').AsString := EdValorBase1.Text; { Augusto 26/05/2004 }
end;

procedure TfrmRetroativoPREV.EdValorBase2Change(Sender: TObject);
begin
  inherited;
  QryDadosBeneficio.Edit;
  QryDadosBeneficio.FieldByName('VALORBASE2').AsString := EdValorBase2.Text; { Augusto 26/05/2004 }
end;

procedure TfrmRetroativoPREV.EdValorBase3Change(Sender: TObject);
begin
  inherited;
  QryDadosBeneficio.Edit;
  QryDadosBeneficio.FieldByName('VALORBASE3').AsString := EdValorBase3.Text; { Augusto 26/05/2004 }
end;

procedure TfrmRetroativoPREV.DbLkEscolheBeneficioChange(Sender: TObject);
begin
  inherited;
  If qryBeneficiosTrocar.State in [dsEdit] Then Begin
    qryBeneficiosTrocar.FieldbyName('NOVOIDBENEFICIO').AsInteger :=
      qryListaBeneficio.FieldbyName('IDBENEFICIO').AsInteger //leofuncef - 05102004
  End;
end;

procedure TfrmRetroativoPREV.InsereCorrecaoMonetaria(pcTipoCorracao : Char; { B - Beneficio C - Contribuição }
                                                     QryDados       : TwwQuery;
                                                     psAnoMesRef    : String;
                                                     pdValor        : Double;
                                                     piNumLancamento : LongInt = -1 );
Var
  iIdRubrica : Integer;
  bBenefProprio : Boolean;
  sFlgTipo, sDataInicio, sDataFinal : String;
begin
  // ************************************************************************ //
  // INSERIR CORREÇÃO DE BENEFICIOS NA HSTATRASOBENEF OU NA HSTATRASOCONTRIB  //
  // ************************************************************************ //

  { Inicio Augusto 03/08/2004 }
  if StrToFloat(FormatFloat('#0.00',pdValor)) = 0 then  Exit;

  If pcTipoCorracao = 'B' Then Begin

    { BENEFICIO }

    sFlgTipo := 'A'; { Atraso, pagar para o associado }
    if pdValor < 0 then begin
      sFlgTipo := 'D'; { Devolução, cobrar do associado }
    end;
    pdValor := Abs(pdValor);
    { Fim Augusto 03/08/2004 }

    { Obs.}

    sSQL :='INSERT INTO HSTATRASOBENEF '+
           ' (IDPESSJUR, IDTITULAR, IDPLANOPREV, MES, IDMOTIVO, NUMEROPROCESSO,  '+
           '  IDBENEFICIO, IDPESSOA, MESREFERENCIA, SEQPROPOSTA, SEQBENEFICIO,   '+
           '  CODALTERADOR, VALOR, FLGTIPO, FLGRETROATIVO)                       '+
           'VALUES ( '+
             QryDados.FieldByName('IDPESSJUR').AsString               +', '+
             QryDados.FieldByName('IDTITULAR').AsString               +', '+
             QryDados.FieldByName('IDPLANOPREV').AsString             +', '+
             QuotedStr(qryLote.FieldByName('MESREFERENCIA').AsString) +', '+
             QryMotivo.FieldByName('IDMOTIVO').AsString               +', '+
             QryDados.FieldByName('NUMEROPROCESSO').AsString          +', '+
             QryDados.FieldByName('IDBENEFICIO').AsString             +', '+
             QryDados.FieldByName('IDPESSOA').AsString                +', '+
             QuotedStr(psAnoMesRef)                                   +', '+
             QryDados.FieldByName('SEQPROPOSTA').AsString             +', '+
             '9'                                                      +', '+ { 9 pq para HSTBENEFBFCIARIO esta 9 cravado }
             QryAlteradorCorrecao.FieldByName('CODALTERADOR').AsString        +', '+
             OraNumero(FloattoStr(Abs(pdValor)))                      +', '+
             QuotedStr(sFlgTipo)                                      +', '+
             '1'                                                      +') ';

  End Else If pcTipoCorracao = 'C' Then Begin

    { CONTRIBUIÇÃO }

    sFlgTipo := 'A'; { Atraso, pagar para o associado }
    if pdValor < 0 then begin
      sFlgTipo := 'D'; { Devolução, cobrar do associado }
    end;
    pdValor := Abs(pdValor);

    sSQL :='INSERT INTO HSTATRASOCONTRIB '+
           '  (NUMRECEBIMENTO, MESREFERENCIA, MESCOBRANCA, IDMOTIVO, FLGTIPO, '+
           '   VALOR, CODALTERADOR, FLGEVENTO)                                '+
           'VALUES( '+
           IntToStr(piNumLancamento)                                    +', '+
           QuotedStr(psAnoMesRef)                                       +', '+
           QuotedStr(qryLote.FieldByName('MESREFERENCIA').AsString)     +', '+
           QryMotivo.FieldByName('IDMOTIVO').AsString                   +', '+
           QuotedStr(sFlgTipo)                                          +', '+
           OraNumero(FloattoStr(Abs(pdValor)))                          +', '+
           QryAlteradorCorrecao.FieldByName('CODALTERADOR').AsString    +', '+
           QuotedStr('0')                                               +') ';

  End; { If }



  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);
  try
     qryAux.ExecSQL;
  except
     if not chkGravaDemons.Checked
     then mmResult.Lines.Add('      [AVISO] Erro ao inserir Correção monetária. Verifique. ');
     GravaLinhaTXT('      [AVISO] Erro ao inserir Correção monetária. Verifique. ');
     Exit;
  end;

end;

function TfrmRetroativoPrev.VerificaPERCLimiteBeneficioRETROATIVO  ( qry              : TwwQuery;
                                        psTituloRotina   : string;
                                        piNumeroProcesso : longint;
                                        piIdPessJur      : longint;
                                        piIdPlanoPrev    : longint;
                                        piIdTitular      : longint;
                                        piIdPessoa       : longint;
                                        piIdBeneficio    : longint;
                                        pdValorAnterior  : double;
                                        pdValorNovo      : double;
                                        pbPedeAutoriza   : boolean;
                                        psMsgAux         : string = ''    ) : longint;
var sUsuario     : string;
    sSenha       : string;
    iIdUsuario   : integer;
    iIdEspAcesso : integer;
    dPercLimite  : double;
    dValorLimite : double;
begin
   Result := 0;

   if pdValorNovo <= 0
   then begin
      Result := 0;
      Exit;
   end;

   if Trim(psTituloRotina) = '' then psTituloRotina := 'Recálculo do Valor do Benefício';

   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT BP.LIMITEALT, BP.PERCENTUALALT, BP.USUARIOALT, B.NOME,   '+
              '        U.NOMEUSUARIO, U.IDESPACESSO                             '+
              ' FROM   BENEFPLANPREV BP, BENEFICIO B, USUARIOSISTEMA U          '+
              ' WHERE  BP.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)              +
              ' AND    BP.IDBENEFICIO   = '+IntToStr(piIdBeneficio )             +
              ' AND    B.IDBENEFICIO    = BP.IDBENEFICIO                        '+
              ' AND    BP.USUARIOALT    = U.IDUSUARIO(+)                        ');
      Open;
   end;

   // verificar PERCENTUAL limite
   if qry.FieldByName('PERCENTUALALT').AsFloat > 0
   then begin
      dPercLimite  := qry.FieldByName('PERCENTUALALT').AsFloat;
      dValorLimite := (qry.FieldByName('PERCENTUALALT').AsFloat * pdValorAnterior) / 100;
      if (pdValorNovo - pdValorAnterior) > dValorLimite
      then begin
            qry.Close;
            Result := -1;
            Exit;
      end;
   end;
end; // VerificaPERCLimiteBeneficio

{ Augusto 21/12/2004 - Gravar linha no banco }
procedure TfrmRetroativoPREV.GravaLinhaTxt(Linha : String);
begin
  If CkbxGravaDemo.Checked Then WriteLn(F,Linha);
end;

Function TfrmRetroativoPREV.CalculaAlteradores(pcTipo : Char;
                                               psAnoMesRef : String;
                                               pdValorCalculo : Double;
                                               Var dValorTotalAlteradores : Currency;
                                               piIdContribuicao : Integer = -1;
                                               piNumLancamento  : LongInt = -1): Boolean;
Var
  sDataRefInd, sAnoMesAnt, sSQL, sValorAlterador, sDataPrevisaoRecebimento,
  sComplementoSQL, sFlgInterno : String;
  dValorAlterador : Double;
  bErro : Boolean;
Begin
  Result := True;
  dValorTotalAlteradores := 0;

  if StrToFloat(FormatFloat('#0.00',pdValorCalculo)) = 0 then Exit;
  if DbLkcIncluiAlterador.Text <> 'Sim' then Exit;

  If pdValorCalculo > 0 Then Begin
    sComplementoSQL := '(FLGATRASO = 1) AND ';
  End Else Begin
    sComplementoSQL := '(FLGDEVOL  = 1) AND ';
  End;

  If pcTipo = 'B' Then Begin { ALTERADORES BENEFICIOS }

    sFlgInterno := 'AS';

    sSQL := 'SELECT '+
            '  AT.IDREGRACALCULO, T.CODALTERADOR, T.DESCRICAO '+
            'FROM   '+
            '  TIPOALTERADOR T, ALTERADORXBENEF AT '+
            'WHERE  '+
            //'  (T.RECPAG = ''P'')  AND '+
            //'  (T.ACRESDECRES = ''C'') AND '+
            '  (AT.FLGCOBRA = 1) AND '+
            sComplementoSQL+
            '  (AT.IDBENEFICIO = '+qryDadosBeneficio.FieldByName('IDBENEFICIO').AsString+') AND '+
            '  (AT.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+') AND '+
            '  (T.CODALTERADOR = AT.CODALTERADOR) '+
            'ORDER BY '+
            '  AT.NUMORDEM ';

  End Else Begin            { ALTERADORES CONTRIBUIÇÃO }

    sFlgInterno := qryBenefBfciario.FieldByName('FLGINTERNO').AsString;

    sSQL := 'SELECT '+
            '  AT.IDREGRACALCULO, T.CODALTERADOR, T.DESCRICAO '+
            'FROM   '+
            '  TIPOALTERADOR T, ALTERADORXCONTRIB AT '+
            'WHERE '+
            //'  (T.RECPAG = ''P'')  AND '+
            //'  (T.ACRESDECRES = ''C'') AND '+
            '  (AT.FLGCOBRA = 1) AND '+
             sComplementoSQL +
            '  (AT.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+') AND '+
            '  (AT.IDPLANOPREV    = '+IntToStr(iIdPlanoPrev)+') AND '+
            '  (T.CODALTERADOR = AT.CODALTERADOR) '+
            'ORDER BY '+
            '  AT.NUMORDEM ';


  End;

  FazQuery(QryAlteradorCorrecao,sSQL);
  If QryAlteradorCorrecao.IsEmpty Then Begin
    QryAlteradorCorrecao.Close;
    Exit;
  End;

  { Loop para calcular os alteradores }
  sAnoMesAnt := sAnoMesAnterior(psAnoMesRef);
  While Not QryAlteradorCorrecao.EOF Do Begin
    { Augusto 07/06/2005 - Buscar Data de previsao de recebimento }
    sDataPrevisaoRecebimento := CriticaDataCobrancaSit(dtmAPrev.qry,
                                           IntToStr(iIdFundacao),
                                           qryDadosBeneficio.FieldByName('IDPLANOPREV').AsString,
                                           sFlgInterno,
                                           'N',
                                           Copy(psAnoMesRef,6,2),Copy(psAnoMesRef,1,4),
                                           true); //P.RAMOS-07.04.2006-PEND.22044

    //if Trim(sDataPrevisaoRecebimento) = '' then sDataPrevisaoRecebimento := DateToStr(date);                  // ClaudioR - 19962 - 16/08/2007
    if Trim(sDataPrevisaoRecebimento) = '' then sDataPrevisaoRecebimento := FormatDateTime('dd/mm/yyyy', date); // ClaudioR - 19962 - 16/08/2007

    sDataRefInd  := '01/'+Copy(psAnoMesRef,6,2)+'/'+Copy(psAnoMesRef,1,4);
    sSQL := 'SELECT '+OraNumero(FloatToStr(pdValorCalculo)) + ' AS VALOR, '+
                      QuotedStr(QryAlteradorCorrecao.FieldByName('CODALTERADOR').AsString) + ' AS CODALTERADOR, '+
                      QuotedStr(QryAlteradorCorrecao.FieldByName('DESCRICAO').AsString)    + ' AS NOMEALTERADOR, '+
                      QuotedStr(sDataRefInd)                + ' AS DATAREF, '+
                      QuotedStr('0')                        + ' AS FLGMIGRACAO, '+
                      QuotedStr(sAnoMesAnt)                 + ' AS ANOMESREFANT, '+
                      QuotedStr(psAnoMesRef)                + ' AS ANOMESREF, '+
                      { Augusto 07/06/2005 - Novos campos }
                      QuotedStr(psAnoMesRef)                + ' AS MESREFERENCIA,    '+
                      QuotedStr(dbdtDataPagamentoLote.Text) + ' AS DATARECEBIMENTO,  '+
                      QuotedStr(sDataPrevisaoRecebimento)   + ' AS DATAPREVISAORECE, '+

                      QuotedStr(edAnoMesIniAcerto.Text)     + ' AS ANOMESACERTOINI, '+
                      IntToStr (Sistema.IdModulo)           + ' AS IDMODULO, '+
                      QuotedStr(edAnoMesFimAcerto.Text)     + ' AS ANOMESACERTOFIM  '+
            'FROM DUAL ';

    sValorAlterador := RegraNumerica(QryAlteradorCorrecao.FieldByName('IDREGRACALCULO').AsString,
                                     sSQL, bErro, iIdCalculo);

    dValorAlterador        := StrToFloat(ClienteNumero(sValorAlterador));
    dValorAlterador        := StrToFloat(FormatFloat('#0.00',dValorAlterador));

    dValorTotalAlteradores := dValorTotalAlteradores + dValorAlterador;

    { Caso tenha ocorrido erro na Regra, sai com erro }
    If bErro Then Begin
      Result := False;
      Exit;
    End;

    { Insere o valor do alterador }
    InsereCorrecaoMonetaria(pcTipo,qryBenefBfciario, psAnoMesRef,
                            dValorAlterador,
                            piNumLancamento);
    QryAlteradorCorrecao.Next;
  End;

  dValorTotalAlteradores := StrToFloat(FormatFloat('#0.00',dValorTotalAlteradores))

End; { CalculaAlteradores }


function TfrmRetroativoPREV.InsereContabil(pcBenefContrib: Char; piIdPessoa, piIdTitular, piIdPatro, piIdPlanoPrev, piIdBeneficio : Integer; pdVlrLanc: Double): Boolean;
Var
  iPlnCodigo : Integer;

  sDebCre : Char;

  sCodCentroCustoC, sCodCentroCustoD, sdtEmissao,
  sUnidNegoc, sSubConta, sSubContaCre : String;

  sHST1, sHST2, sHST3, sHST4, sHST5 : String;
  rDadosContabeis : RecDadosContabeis;
  sSql : String;

begin
  { Inicio Augusto 17/06/2005 - Temporariamente desativada }
  Result := True;
  Exit;
  { Fim Augusto 17/06/2005 }

  Result := False;

  sUnidNegoc       := IntToStr(prmUnidNegoc); // Gleyber - 05/09/2006 - Pendência 23243
  sSubConta        := '-1';
  sSubContaCre     := '-1';
  sCodCentroCustoC := '-1';
  sCodCentroCustoD := '-1';
  iPlnCodigo := 0;



  sHST1 := 'APROPRIAÇÃO DE DEVOLUÇÃO CALCULADA NA';
  sHST2 := ' REVISÃO DE BENEFÍCIOS PARA A MATRÍCULA ';
  sHST3 := qryPessoasATratar.FieldByName('MATRICULA').AsString;
  sHST4 := ' ';
  sHST5 := ' ';

  rDadosContabeis := BuscaDadosContabeis(pcBenefContrib, piIdPatro, piIdPlanoPrev, piIdBeneficio);

  { Insere valores }
  Try
    If Not CtrlLancamento.InsereLancaContab ( '2',                               // LACTIPO
                                              Sistema.IdEmpresa,                        // IDEMPRESA
                                              Sistema.IdModulo,                         // IMODULOORIGEM
                                              Sistema.IdUsuario,                        // IDUSUARIOINCLUSAO
                                              IntegraBack.Plano,                        // PLANO

                                              StrToInt(rDadosContabeis.UnidNegoc),      // UNIDNEGOC
                               {sempre zero}  StrToInt(rDadosContabeis.CodSubContaDeb), // LISUBCONTADEB
                               {sempre zero}  StrToInt(rDadosContabeis.CodSubContaCre), // LISUBCONTACRE
                                              piIdPlanoPrev,                            // IPLANOPREV

                                              //ParamIntegra.PatroGlobal,               // IPATRO
                                              piIdPatro,                                // IPATRO
                                              iPlnCodigo,                               // LIPLNCODIGO
                                              0,                                        // INUMLAN

                                              //DatetoStr(Date),                        // SDATALANC
                                              FormatDateTime('dd/mm/yyyy', Date),       // SDATALANC  // ClaudioR - 19962 - 16/08/2007
                                              '',                                       // SNUMDOC

                                              sHST1,                                    // LACHIST1
                                              sHST2,                                    // LACHIST2
                                              sHST3,                                    // LACHIST3
                                              sHST4,                                    // LACHIST4
                                              sHST5,                                    // LACHIST5

                                              prmTpOperCobranca,                        // STIPOOPER
                                              rDadosContabeis.CodCentroCustoD,          // SCCUSTOD

                                              rDadosContabeis.ContaContabilDebito,      // SCONTAD
                                              rDadosContabeis.CodCentroCustoC,          // SCCUSTOC
                                              rDadosContabeis.ContaContabilCredito,     // SCONTAC
                                              '',                                       // SCODHIST
                                              (pdVlrLanc * -1),                         // RVALLANC
                                              False,                                    // BJUNTA
                                              Sistema.UsaPlanoPatro,                    // BUSAPLANOPATRO
                                              -1,                                       // IIDSEGREGACRITER
                                              -1                                        // DDATASEGREGACRITER
                                            ) Then
    Begin
      MsgDlg(CtrlLancamento.MessageInfo, 'Erro',mtError,[mbOk],0);
      Exit;
    End;

    iPlnCodigo := Trunc(CtrlLancamento.RetornoPlnCodigo);

    sSql := ' UPDATE MOVBENEF SET PLNCODIGO = '+IntToStr(iPlnCodigo)+
            ' WHERE IDMOVBENEF = (SELECT MAX(IDMOVBENEF) FROM MOVBENEF '+
                                ' WHERE IDPESSOA    = '+IntToStr(piIdPessoa)+
                                  ' AND IDBENEFICIO = '+IntToStr(piIdBeneficio)+
                                  ' AND IDTITULAR   = '+IntToStr(piIdTitular)+
                                  ' AND IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                                  ' AND IDPESSJUR   = '+IntToStr(piIdPatro)+')';

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(sSql);
    qryAux.ExecSql;
    (*
    If iPlnCodigo <= 0 Then Begin
      MsgDlg(CtrlDocumento.MessageInfo,'Erro', mtError,[mbOk],0);
      Exit;
    End Else Begin
      sMsgErro:='';
    End;
    *)

  Except
    Raise;
    (*
    On E:Exception Do Begin
      MsgDlg(CtrlDocumento.MessageInfo+#13+
             'ERRO : '+E.Message,'Erro', mtError,[mbOk],0);
      Exit;
    End;
    *)
  End;

  Result := True;
end;

Function TfrmRetroativoPREV.BuscaDadosContabeis(pcBenefContrib : Char; piIdPatro, piIdPlanoPrev, piIdBeneficio: Integer): RecDadosContabeis;
Var
  sSQL : String;
  sCodTipRecDes, sCodCentroCusto : String;

begin
  Result.RetornouValor := False;

  If pcBenefContrib = 'B' Then  {  BENEFÍCIO  }
  Begin
    qryAux.Close;
    qryAux.sql.Clear;
    qryAux.Sql.Add('SELECT CODCENTROCUSTOC, CODCENTROCUSTOD, PLACONTADEVOL AS PLACONTAC, '+
                   ' PLACONTAD, UNIDNEGOC, CODSUBCONTA '+
                   ' FROM '+
                   '  BENEFPLANPATRO '+
                   ' WHERE IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                   '   AND IDBENEFICIO = '+IntToStr(piIdBeneficio)+
                   '   AND IDPESSJUR   = '+IntToStr(piIdPatro));
    qryAux.Open;

    If Not qryAux.IsEmpty Then
      Result.RetornouValor := True;
    
    Result.CodCentroCustoC      := qryAux.FieldByName('CODCENTROCUSTOD').AsString;
    Result.CodCentroCustoD      := qryAux.FieldByName('CODCENTROCUSTOC').AsString;
    Result.ContaContabilCredito := qryAux.FieldByName('PLACONTAD').AsString;
    Result.ContaContabilDebito  := qryAux.FieldByName('PLACONTAC').AsString;
    Result.UnidNegoc            := qryAux.FieldByName('UNIDNEGOC').AsString;
    Result.CodSubContaCre       := '0';
    Result.CodSubContaDeb       := '0';

    qryAux.Close;
    qryAux.sql.Clear;
    qryAux.Sql.Add('SELECT CODCENTROCUSTOC, CODCENTROCUSTOD, PLACONTADEVOL AS PLACONTAC, '+
                   ' PLACONTAD, UNIDNEGOC, CODSUBCONTA '+
                   ' FROM '+
                   '  BENEFPLANPREV '+
                   ' WHERE IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                   '   AND IDBENEFICIO = '+IntToStr(piIdBeneficio));
    qryAux.Open;

    If Not qryAux.IsEmpty Then
      Result.RetornouValor := True;

    If (Trim(Result.CodCentroCustoC)      = '')  Then
      Result.CodCentroCustoC      := qryAux.FieldByName('CODCENTROCUSTOD').AsString;

    If (Trim(Result.CodCentroCustoD)      = '')  Then
      Result.CodCentroCustoD      := qryAux.FieldByName('CODCENTROCUSTOC').AsString;

    If (Trim(Result.ContaContabilCredito) = '')  Then
      Result.ContaContabilCredito := qryAux.FieldByName('PLACONTAD').AsString;

    If (Trim(Result.ContaContabilDebito)  = '')  Then
      Result.ContaContabilDebito  := qryAux.FieldByName('PLACONTAC').AsString;

    If (Trim(Result.UnidNegoc)            = '')  Then
      Result.UnidNegoc            := qryAux.FieldByName('UNIDNEGOC').AsString;

    If Result.UnidNegoc = '' Then
      Result.UnidNegoc := IntToStr(prmUnidNegoc); // Gleyber - 05/09/2006 - Pendência 23243

  End
  Else
  { CONTRIBUICAO }
  Begin
  End;


(*
  If pcTipo = 'R' Then Begin { RECEBER }
    sCodCentroCusto  := DbLkcCentroCustoCR.LookupValue;
    If Trim(QryValores.FieldByName('CODTIPREC').AsString) <> '' Then
      sCodTipRecDes := QryValores.FieldByName('CODTIPREC').AsString
    Else
      sCodTipRecDes := QryTpReceb.FieldByName('CODTIPRECDES').AsString
  End Else Begin             { PAGAR   }
    sCodCentroCusto  := DbLkcCentroCustoCP.LookupValue;
    If Trim(QryValores.FieldByName('CODTIPDES').AsString) <> '' Then
      sCodTipRecDes := QryValores.FieldByName('CODTIPDES').AsString
    Else
      sCodTipRecDes := QryTpPaga.FieldByName('CODTIPRECDES').AsString
  End;

  { Buscar na Tabela Aranha }
  sSQL := 'SELECT * FROM TIPORDXCCXCONTA '+
          'WHERE CODCENTROCUSTO =  '+ QuotedStr(sCodCentroCusto)+ ' AND '+
          '      IDPROGRAMA     = 1'+                             ' AND '+
          '      CODTIPRECDES   =  '+QuotedStr(sCodTipRecDes)+    ' AND '+
          '      RECPAG         =  '+QuotedStr(pcTipo);

  If FazQuery(QryAux, sSQL) Then Begin
    Result.RetornouValor := True;
    Result.ContaContabilCredito := QryAux.FieldByName('PLACONTA').AsString;
    Exit;
  End;

  { Buscar na TIPORECEBDESEMB }
  sSQL := 'SELECT * FROM TIPORECEBDESEMB  '+
          'WHERE CODTIPRECDES   =  '+QuotedStr(sCodTipRecDes)+ ' AND ' +
          '      RECPAG         =  '+QuotedStr(pcTipo);
  If FazQuery(QryAux, sSQL) Then Begin
    Result.RetornouValor := True;
    Result.ContaContabilCredito := QryAux.FieldByName('PLACONTACREDITO').AsString;
    Result.ContaContabilDebito  := QryAux.FieldByName('PLACONTA').AsString;
    Exit;
  End;
*)
end;

procedure TfrmRetroativoPREV.AbreConsultaContribuicao(pcTipo: Char);
begin
  qryOpcaoContribuicao.SQL.Clear;
  If pcTipo = 'T' Then Begin
    sSQL := 'SELECT 1 AS PROCESSA, '+
            '       CPP.IDPESSJUR,      CPP.IDPLANOPREV, CPP.IDPESSOA,  CPP.SEQPROPOSTA, '+
            '       CPP.IDCONTRIBUICAO, CPP.DATAINICIO,  CPP.DATAFINAL, CPP.VALORBASE1,  '+
            '       CPP.VALORBASE2,     CPP.VALORBASE3,  C.NOME,        CP.NOMEVALORBASE1, '+
            '       CP.NOMEVALORBASE2,  CP.NOMEVALORBASE3 '+
            'FROM  CONTRIBPREVPARTP CPP, CONTPREV CP, CONTRIBUICAO C '+
            'WHERE  CPP.IDPESSJUR     = :IDPESSJUR '+
            ' AND   CPP.IDPLANOPREV   = :IDPLANOPREV '+
            ' AND   CPP.IDPESSOA      = :IDPESSOA '+
            ' AND   CPP.SEQPROPOSTA   = :SEQPROPOSTA '+
            { Augusto 10/07/2007 - Alteração da ordem das datas para pegar registro }
            { com "pernas" no periodo                                               }
            ' AND   TO_CHAR(CPP.DATAINICIO,''YYYY/MM'') <= :ANOMESFIM '+
            ' AND   ((TO_CHAR(CPP.DATAFINAL,''YYYY/MM'') >= :ANOMESINI) OR (CPP.DATAFINAL IS NULL) ) '+

            ' AND   CP.IDPLANOPREV    = CPP.IDPLANOPREV '+
            ' AND   CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO '+
            ' AND   C.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO '+
            'ORDER BY CPP.DATAINICIO, C.NOME ';
  End Else Begin
    sSQL := 'SELECT 1 AS PROCESSA, '+
            '  BTIT.IDPESSJUR, BTIT.IDPLANOPREV, BTIT.IDPESSOA, BTIT.SEQPROPOSTA, '+
            '  CN.IDCONTRIBUICAO, CN.IDNUCLEOFAMILIAR,  CN.DATAINICIO,       CN.DATAFINAL, '+
            '  CN.ULTMESPREPARO,  CN.FLGCOBRA,          CTP.IDREGRACALCULO,  CTP.IDPLANOPREV, '+
            '  CON.NOME, '+
            '  0 AS VALORBASE1, 0 AS VALORBASE2, 0 AS VALORBASE3,  '+
            '  CTP.NOMEVALORBASE1, CTP.NOMEVALORBASE2,   CTP.NOMEVALORBASE3, '+
            '  CTP.IDRUBRICA,      CTP.IDREGRAPRIMPAGTO, CTP.IDREGRAULTPAGTO, CTP.CODPORTFORMA, '+
            '  CTP.FLGDESCFOLHA,   CTP.FLGNAOEXIGEREC,   NF.IDRESPNUCLEO '+
            'FROM  '+
            '  BFCIARIOTITPLAN BTIT, CONTRIBPREVNUCLEO CN, CM.CONTPREV CTP, CM.CONTRIBUICAO CON, CM.NUCLEOFAMILIAR NF '+
            'WHERE  BTIT.IDPESSJUR   = :IDPESSJUR '+
            ' AND   BTIT.IDPLANOPREV = :IDPLANOPREV '+
            ' AND   BTIT.IDTITULAR   = :IDTITULAR '+
            ' AND   BTIT.IDPESSOA    = :IDPESSOA '+
            ' AND   BTIT.SEQPROPOSTA = :SEQPROPOSTA '+
            ' AND   BTIT.IDBENEFICIO = :IDBENEFICIO '+
            ' AND   CN.IDNUCLEOFAMILIAR = BTIT.IDNUCLEOFAMILIAR '+
            ' AND   NF.IDNUCLEOFAMILIAR = CN.IDNUCLEOFAMILIAR '+
            ' AND   TO_CHAR(CN.DATAINICIO,''YYYY/MM'') <= :ANOMESINI '+
            ' AND   ((TO_CHAR(CN.DATAFINAL,''YYYY/MM'') >= :ANOMESFIM) OR (CN.DATAFINAL IS NULL) ) '+
            ' AND   CTP.IDCONTRIBUICAO  = CN.IDCONTRIBUICAO '+
            ' AND   CON.IDCONTRIBUICAO  = CN.IDCONTRIBUICAO '+
            'ORDER BY CN.DATAINICIO, CON.NOME ';
  End;
  qryOpcaoContribuicao.SQL.Add(sSQL);
  qryOpcaoContribuicao.Prepare;
end;

procedure TfrmRetroativoPREV.dtDataDeveriaTerPagoChange(Sender: TObject);
begin
  inherited;

  If (dtDataDeveriaTerPago.Text = '') Then ChBxUtilizaCalendario.Checked := True;

end;

Function TfrmRetroativoPREV.JaSaiuConvenio(QryDadosBeneficio : TwwQuery) : Boolean;
Begin
  Result :=  FazQuery( QryAux, 'SELECT 1 FROM '+
                               'MOVBENEF MOV '+
                               'WHERE '+
                               '  MOV.IDPLANOPREV = '+ qryDadosBeneficio.FieldbyName('IDPLANOPREV').AsString + ' AND '+
                               '  MOV.IDBENEFICIO = '+ qryDadosBeneficio.FieldbyName('IDBENEFICIO').AsString + ' AND '+
                               '  MOV.IDPESSOA    = '+ qryDadosBeneficio.FieldbyName('IDPESSOA').AsString    + ' AND '+
                               '  MOV.TIPOMOV     = 3 AND '+
                               '  MOV.MOTRETENC   = 11' );
End;

function TfrmRetroativoPREV.JaPossuiRevisaoEmOutroLote: Boolean;
Var
  sSQL : String;
begin

  Result := False;

  sSQL := 'SELECT '+
          '  IDMOVBENEF   '+
          'FROM   '+
          '  MOVBENEF MOV '+
          'WHERE '+
          '  MOV.IDPESSOA    = '+ QryBenefBfciario.FieldByName('IDPESSOA').AsString    + ' AND '+
          '  MOV.IDBENEFICIO = '+ QryBenefBfciario.FieldByName('IDBENEFICIO').AsString + ' AND '+
          '  MOV.TIPOMOV     = 13 AND '+
          '  MOV.IDLOTEMOV IN (SELECT CTRL.IDLOTE      '+
          '                    FROM CTRLINTERFACE CTRL '+
          '                    WHERE CTRL.IDLOTE <> '+ qryLote.FieldByName('IDLOTE').AsString +' AND '+
          '                          CTRL.MESREFERENCIA = '+ QuotedStr( qryLote.FieldByName('MESREFERENCIA').AsString ) +') ';

  If FazQuery( QryAux, sSQL ) Then Begin

    Result := True;

  End;

end;

procedure TfrmRetroativoPREV.ImprimeCabecalhoPessoa;
begin

  if not chkGravaDemons.Checked
  then mmResult.Lines.Add('---------------------------------------------------------------------------------------------------------------------------------------------------------------');
  GravaLinhaTXT('---------------------------------------------------------------------------------------------------------------------------------------------------------------');

  if not chkGravaDemons.Checked
  then mmResult.Lines.Add('Matrícula    : '+PreparaStr(qryPessoasATratar.FieldByName('MATRICULA').AsString,15)+'  Inscrição No. : '+PreparaStr(qryPessoasATratar.FieldByName('INSCRICAONUMERO').AsString,15)+' Situação na Fundação Hoje : '+qryPessoasATratar.FieldByName('SITUACAOHOJE').AsString);
  GravaLinhaTXT('Matrícula    : '+PreparaStr(qryPessoasATratar.FieldByName('MATRICULA').AsString,15)+'  Inscrição No. : '+PreparaStr(qryPessoasATratar.FieldByName('INSCRICAONUMERO').AsString,15)+' Situação na Fundação Hoje : '+qryPessoasATratar.FieldByName('SITUACAOHOJE').AsString);

  if not chkGravaDemons.Checked
  then mmResult.Lines.Add('Participante : '+qryPessoasATratar.FieldByName('NOME').AsString);
  GravaLinhaTXT('Participante : '+qryPessoasATratar.FieldByName('NOME').AsString);

  if not chkGravaDemons.Checked
  then mmResult.Lines.Add(' ');
  GravaLinhaTXT(' ');

  // ***********************************************************************
  // INSERIR RETROATIVO NA TABELA DE CONTROLE DE RETROATIVOS
  // ***********************************************************************
  iIdRetroativo := LeUltRegistro(nil,'RETROATIVOPREV');
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('INSERT INTO RETROATIVOPREV (                                                                  '+
                 '       IDRETROATIVO,    IDLOTE,          IDMOTIVO,        IDPESSOA,         IDTITULAR,        '+
                 '       IDPESSJUR,       IDPLANOPREV,     SEQPROPOSTA,     FLGTIPRETROATIVO, ANOMESACERTO,     '+
                 '       ANOMESINI,       ANOMESFIM,       ANOMESINIACERTO, ANOMESFIMACERTO,  RUBFOLHAEXTRA,    '+
                 '       FLGALTCADASTRAL, FLGALTFUNCIONAL, FLGALTOPCONTRIB, FLGALTTIPOBENEF,  FLGALTINFBENEF,   '+
                 '       DATAACERTO,      DATAPREVISTA,    FLGDESCFOLHAAT,  FLGDESCFOLHAMA,   FLGDESCFOLHAAS,   '+
                 '       FLGDESCFOLHAFL,  FLGINCALTAT,     FLGINCALTMA,     OBS )                               '+
                 ' VALUES                    (                                                                  '+
                 IntToStr(iIdRetroativo)                               +',');
  if Trim(dblkpcmbLoteAcerto.Text) <> ''
  then qryAux.SQL.Add(OraNumero(qryLote.FieldByName('IDLOTE').AsString)     +',')
  else qryAux.SQL.Add('NULL'                                                +',');


  qryAux.SQL.Add(OraNumero(qryMotivo.FieldByName('IDMOTIVO').AsString) +','+
                 IntToStr(iIdPessoa)                                   +','+
                 IntToStr(iIdTitular)                                  +','+
                 IntToStr(iIdPessJur)                                  +','+
                 IntToStr(iIdPlanoPrev)                                +','+
                 IntToStr(iSeqProposta)                                +',');

  if rbRecalcBenef.Checked then qryAux.SQL.Add('1, ') else qryAux.SQL.Add('2, ');
  qryAux.SQl.Add(''''+edMesAcerto.Text+''',');
  qryAux.SQl.Add(''''+edAnoMesIni.Text+''',');
  qryAux.SQl.Add(''''+edAnoMesFim.Text+''',');
  qryAux.SQl.Add(''''+edAnoMesIniAcerto.Text+''',');
  qryAux.SQl.Add(''''+edAnoMesFimAcerto.Text+''',');
  qryAux.SQl.Add(''''+edRubFolhaExtra.Text+''',');

  if chkTipoIndivCadastral.Checked        then qryAux.SQL.Add('1, ') else qryAux.SQL.Add('0, ');
  if chkTipoIndivFuncional.Checked        then qryAux.SQL.Add('1, ') else qryAux.SQL.Add('0, ');
  if chkTipoIndivOpcaoContrib.Checked     then qryAux.SQL.Add('1, ') else qryAux.SQL.Add('0, ');
  if chkTipoIndivTipoBeneficio.Checked    then qryAux.SQL.Add('1, ') else qryAux.SQL.Add('0, ');
  if chkTipoIndivRevisaoBeneficio.Checked then qryAux.SQL.Add('1, ') else qryAux.SQL.Add('0, ');

  qryAux.SQl.Add('TO_DATE('''+dtDataAcerto.Text+''',''DD/MM/YYYY''), ');
  qryAux.SQl.Add('TO_DATE('''+dtDataDeveriaTerPago.Text+''',''DD/MM/YYYY''), ');

  if UpperCase(dblkpFormaAtivos.Text)     = 'BANCO' then qryAux.SQL.Add('0, ') else qryAux.SQL.Add('1, ');
  if UpperCase(dblkpFormaMantidos.Text)   = 'BANCO' then qryAux.SQL.Add('0, ') else qryAux.SQL.Add('1, ');
  qryAux.SQL.Add('1, '); // Assistidos = FOLHA
  qryAux.SQL.Add('1, '); // Falecidos = FOLHA

  if UpperCase(dblkpALTAtivos.Text)       = 'SIM'   then qryAux.SQL.Add('1, ') else qryAux.SQL.Add('0, ');
  if UpperCase(dblkpALTMantidos.Text)     = 'SIM'   then qryAux.SQL.Add('1, ') else qryAux.SQL.Add('0, ');

  if Trim(edObservacao.Text)          <> ''     then qryAux.SQL.Add(''''+edObservacao.Text+'''') else qryAux.SQL.Add('NULL ');

  qryAux.SQL.Add(')');
  try
     qryAux.ExecSQL;
     if not chkGravaDemons.Checked
     then mmResult.Lines.Add('      [ OK  ] Gravação de Parâmetros Selecionados ');
     GravaLinhaTXT('      [ OK  ] Gravação de Parâmetros Selecionados ');
  except
     if not chkGravaDemons.Checked
     then mmResult.Lines.Add('      [ERRO ] Gravação de Parâmetros Selecionados ');
     GravaLinhaTXT('      [ERRO ] Gravação de Parâmetros Selecionados ');
  end;

  // ***********************************************************************
  // EFETUAR GRAVAÇÃO DOS DADOS DE ALTERAÇÃO (CADASTRAL,BENEFICIO,ETC)
  // ***********************************************************************
  if (chkTipoIndivCadastral.Checked)
     And (qryDadosPESSOA.Active)
  then begin

     if not ProcessaAlteracaoCadastral
     then begin
        if not chkGravaDemons.Checked
        then mmResult.Lines.Add('      [ERRO ] Alteração Cadastral');
        GravaLinhaTXT('      [ERRO ] Alteração Cadastral');
     end
     else begin
        if not chkGravaDemons.Checked
        then mmResult.Lines.Add('      [ OK  ] Alteração Cadastral');
        GravaLinhaTXT('      [ OK  ] Alteração Cadastral');
     end;
  end;

end;

// Gleyber - 25/07/2006 - Pendência 22731 - Início
procedure TfrmRetroativoPREV.btnCadContribParticipanteClick(
  Sender: TObject);
begin
  inherited;

  If not dtmBaseDados.dbBaseDados.InTransaction
   Then dtmBaseDados.dbBaseDados.StartTransaction;

  frmCadContribParticipante := TfrmCadContribParticipante.Create(Application);
  frmCadContribParticipante.AssociaContrib(sNomeParticipante,
                                           sNomePatro,
                                           sNomePlano,
                                           //datetostr(date),                  // ClaudioR - 19962 - 16/08/2007
                                           FormatDateTime('dd/mm/yyyy', Date), // ClaudioR - 19962 - 16/08/2007
                                           iIdPessoa,
                                           iIdPessjur,
                                           iIdPlanoPrev,
                                           iSeqProposta,
                                           False);
  frmCadContribParticipante.Free;

  // Gleyber - 14/08/2006 - Pendência 22838 - Início
  qryOpcaoContribuicao.Close;
  If iIdTitular = iIdPessoa
   Then Begin
    AbreConsultaContribuicao('T');   // TITULAR
    qryOpcaoContribuicao.ParamByName('IDPESSOA').AsInteger := iIdTitular;
   End
   Else Begin
    AbreConsultaContribuicao('P');   // PENSIONISTA
    qryOpcaoContribuicao.ParamByName('IDTITULAR').AsInteger   := iIdTitular;
    qryOpcaoContribuicao.ParamByName('IDPESSOA').AsInteger    := iIdPessoa;
    qryOpcaoContribuicao.ParamByName('IDBENEFICIO').AsInteger := iIdBeneficio;
  End;
  qryOpcaoContribuicao.ParamByName('IDPESSJUR').AsInteger   := iIdPessJur;
  qryOpcaoContribuicao.ParamByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
  qryOpcaoContribuicao.ParamByName('SEQPROPOSTA').AsInteger := 1;
  qryOpcaoContribuicao.ParamByName('ANOMESINI').AsString    := edAnoMesIni.Text;
  qryOpcaoContribuicao.ParamByName('ANOMESFIM').AsString    := edAnoMesFIM.Text;
  qryOpcaoContribuicao.Open;
end;

function TfrmRetroativoPREV.TiraPlic(psCampo: String): String;
var
  ipos : Integer;
begin
  iPos:=Pos('''',psCampo);
  If iPos>0
   Then Begin
    delete(psCampo,iPos,1);
    iPos:=Pos('''',psCampo);
    If iPos>0
     Then delete(psCampo,iPos,1);
   end;
  Result := psCampo;
end;
  // Gleyber - 14/08/2006 - Pendência 22838 - Fim

procedure TfrmRetroativoPREV.Button1Click(Sender: TObject);
begin
  inherited;
  QryAux.Close;

  QryAux.SQL.Clear;
  QryAux.SQL.Add('SELECT IDTIPORESERVA, MESREFERENCIA, VLRCOTAS, SALDOCOTAS, VLRREAL, SALDOREAL, VALORINDICE, TRGDTINCLUSAO '+
                 'FROM HISTMOVRESERVA WHERE IDPESSOA = '+QryBenefBfciario.FieldByName('IDPESSOA').AsString+ '  ' +
                 'ORDER BY TRGDTINCLUSAO DESC '
                );

  QryAux.Open;

end;

procedure TfrmRetroativoPREV.Button2Click(Sender: TObject);
begin
  inherited;
  QryAux.Close;

  QryAux.SQL.Clear;
  QryAux.SQL.Add('SELECT IDTIPORESERVA, VALORRESERVA '+
                 'FROM RESERVAPART WHERE IDPESSOA = '+QryBenefBfciario.FieldByName('IDPESSOA').AsString+ '  ' +
                 'ORDER BY IDTIPORESERVA  '
                );

  QryAux.Open;
  
end;

end.














