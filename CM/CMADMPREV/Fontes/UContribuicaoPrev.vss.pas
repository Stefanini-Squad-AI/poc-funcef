// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Hugo Luna
// Data        : 23/10/2007
// Pendência   : 25133
// Rotina      : Varias
// Descricao   : Correção nas querys da Tabela "PortadorForma", acrescentando a
//               condição: AND NVL(PORTADORFORMA.FLGATIVO, 'S') = 'S'
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 10/09/2007
// Pendência   : 26180
// Rotina      : DescarregaDocumentos
// Descricao   : Correção na query para gravar corretamente o campo CODDOCUMENTOPREV
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 14/08/2007
// Pendência   : 17578
// Alteração   : Permitir somente planos contabies ativos.
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 31/07/2007
// Pendência   : 25564
// Rotina      : Preparacontribuição assistido
// Descricao   : Não cobrar abono quando beneficio estiver marcado para cobrar
//               abono no fim do ano e não estiver no fim do ano
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 03/07/2007
// Pendência   : 25272
// Rotina      : MontaSQLContribNOVA
// Descricao   : Quando for revisão, não zerar o valor pasado da regra de calculo para a
//               de primeiro pagamento
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 12/06/2007
// Pendência   : 25590
// Rotina      : ReajustaSalPatro
// Descricao   : Respeitar o parametro de recalculo memso quando já houve recalculo no mês
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 08/05/2007
// Pendência   : 25145
// Rotina      : LerContribAEnviar
// Descricao   : Alteração na query para quando efetuar o envio de contribuições
//               parametrizadas como ENVIA BASE (FLGTPVLR='B') considerar também
//               o envio de contribuições em atraso com valor.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 02/04/2007
// Pendência   : 24975
// Descricao   : Melhoria na mensagem de erro.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 28/02/2007
// Pendência   : 24516
// Rotina      : Relatório
// Descricao   : Correção que irá identificar se o plano contábil previdenciário
//               é o mesmo previdenciário. Caso não seja é questionado ao usuário
//               se deseja alterar.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 14/02/2007
// Pendência   : 24401
// Rotina      : EnviaContribuicaoBANCO
// Descricao   : Correção para buscar corretamente o paramêtros financeiros.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 31/01/2007
// Pendência   : 24007
// Rotina      : EnviaContribuicaoBANCO
// Descricao   : Correção para pergar corretamente o CODCENTRORESPON.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 05/12/2006
// Pendência   : 23930
// Descricao   : Novo parametro para Identificação do titular
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 26/10/2006
// Pendência   : 23687
// Rotina      : EstornaContribuicaoBANCO
// Descricao   : Correção da query.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 26/10/2006
// Pendência   : 23602
// Rotina      : EstornaContribuicaoBANCO
// Descricao   : Correção da query.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 24/10/2006
// Pendência   : 23602
// Rotina      : EstornaContribuicaoBANCO
// Descricao   : Correção da query - inclusão de virgula
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 10/10/2006
// Pendência   : 23450
// Rotina      : EstornaContribuicaoBANCO
// Descricao   : Alteração da rotina para não excluir mais a planilha com todos
//               os lançamentos, apenas fazer um outro lançamento a fim de
//               anular o que está sendo estornado.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 05/10/2006
// Pendência   : 23457
// Rotina      : GeraSalarioRetroativo
// Descricao   : Alteração da rotina para gravar corretamente o valor do campo
//               SALAUXDOENCA para requerimentos de auxílio doença
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 21/09/2006
// Pendência   : 23307
// Rotina      : PreparaContribuicao
// Descricao   : Retirada da atualização da DATAINICIO e DATAFINAL pois o processo tem
//               que ser sempre no periodo todo. Apenas a Data de Recebimento/Previsão vai
//               para o outro mês.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 14/09/2006
// Pendência   : 23307
// Rotina      : PreparaContribuicao
// Descricao   : Acerto para buscar corretamente o primeiro mês de cobrança para
//               mantidos se a data inicial for menor que a data atual.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto 
// Data        : 12/09/2006
// Pendencia   : 17632  (Parcial)
// Rotina      : InsereHstContribPREV
// Alteração   : Alteração da função InsereHstContribPREV para gravar o IDMOVBENEF.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 05/09/2006
// Pendencia   : 23243
// Rotina      : GeraAlteradorBANCO, BuscaContabContrib, BuscaContabPatro,
//               DescarregaDocumentos, BaixaDocumentoNAOPAGO
// Alteração   : Atribuição do valor default para Unidades de Negócios (UNIDNEGOC)
//               que possuiam antes o valor -1.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 17/08/2006
// Pendência   : 23028
// Rotina      : PreparaContribuicaoASSISTIDO
// Descricao   : Acerto no tratamento de acerto de contribuições.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 03/08/2006
// Pendência   : 22920
// Rotina      : BaixaContribCar
// Descricao   : Novo acerto na consideração do TIPOALTERADOR para atender a FUNCEF.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 26/07/2006
// Pendência   :
// Rotina      : PreparaContribuicao
// Descricao   : Caso Lote tenha sido criado na rotina, buscar o ANOMESCOBRANCA novamente.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 27/07/2006
// Pendência   : 22920
// Rotina      : BaixaContribCar
// Descricao   : Acerto na consideração do TIPOALTERADOR
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 20/07/2006
// Pendência   : 22859
// Rotina      : ReajustaSalPatro
// Descricao   : Inclusão de parâmetro para executar o reajuste imediatamente.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 20/07/2006
// Pendência   : 22859
// Rotina      : DescarregaDocumentos
// Descricao   : Acerto no rotina para atualizar o valor do campo CODDOCUMENTOPREV.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 17/07/2006
// Pendência   : 22844
// Rotina      : PreparaContribuicaoASSISTIDO
// Descricao   : Acerto no tratamento de abono para verificar quem usa a PARAMANTECIPABONO.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 11/07/2006
// Pendência   :
// Rotina      : GravaAlterador
// Descricao   :   1) Zerar mensagem de erro no inicio da rotina
//                 2) 22866 - Sempre gravar no BD o alterador com sinal positivo
//                 3) Limpeza dos comentários desnecessários na rotina
//               EnviaContribuicaoBANCO
//                 4) 22770 - Acerto na apuração da data do lancamento na contabilidade.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 07/07/2006
// Pendência   : 22720
// Rotina      : AgrupaBoletasBANCO
// Descricao   : Acerto na rotina para dar UPDATE no CODGRUPOCNAB nos registros
//               que ainda não tenham sido enviados e não recebidos.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 22/06/2006
// Pendência   : 22663
// Rotina      : PreparaContribuicao
// Descricao   : Acerto para processar periodo mesmo sendo o valor da contribuição <= a zero 
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 21/06/2006
// Pendência   : 22211
// Rotina      : PreparaContribuicao
// Descricao   : Correção para criticar data de cobrança para mantidos se é menor
//               que a data atual.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 09/06/2006
// Pendência   : 22224
// Rotina      : AgrupaBoletasBANCO e GeraAlteradorBANCO
// Descricao   : Acerto na baixa de contribuições levando em consideração os
//               alteradores cadastrados na TipoAlterador.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 17/05/2006
// Pendência   : 22372
// Rotina      : AgrupaBoletasBANCO
// Descricao   : Correção na rotina de impressao no verso da boleta para considerar
//               devoluções
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 16/05/2006
// Pendência   : 22329
// Rotina      : GeraSalarioRetroativo e ReajustaSalPatro
// Descricao   : Correção na rotina de reajuste de salário da patrocinadora para
//               assistidos e mantidos
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 12/05/2006
// Pendência   : 22145
// Rotina      : DescarregaDocumentos
// Descricao   : Alteração para compatiblizar com devoluções para patrocinadora.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 05/05/2006
// Pendencia   : 22241
// Rotina      : PreparaContribuicaoASSISTIDO
// Alteração   : Novo tratamento para a antecipação de abono.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 12/04/2006
// Pendência   : 21570
// Rotina      : LerContribAEnviar
// Descricao   : Alteração na Consulta para considerar o campo FLGTPVLR como nulo também.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 07/04/2006
// Pendência   : 22045
// Rotina      : BaixaContribCAR
// Descricao   : Obter o total de lançamentos de baixa do CAR. Só pegava um
//               registro de baixa, o que gerava erro quando existia mais de
//               um lançamento de baixa.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 21/03/2006
// Pendência   : 21570
// Rotina      : LerContribAEnviar
// Descricao   : Correção para considerar parametrização de só enviar base.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 15/03/2006
// Pendência   : 21613
// Rotina      : PreparaContribuicaoASSISTIDO
// Descricao   : Buscar DATAINICIO da contribuicao pela data original qual Liberação  
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 24/02/2006
// Pendência   : 21570
// Rotina      : LerContribAEnviar
// Descricao   : Correção para não enviar contribuições com valores zerados
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : DescarregaDocumentos
//  Pendência  : 21599 - 20596 (reabertura)
//  Data       : 21/02/2006
//  Descricao  : coloquei a crítica de data de lançamento também na descarrega.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 17/02/2006
// Pendência   : 21598
// Rotina      : EnviaContribuicaoBANCO
// Descricao   : em casos de envio para mantido, não inverter as contas no caso de devolução, pois, neste caso,
//               o envio normal já é uma inversão
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 17/02/2006
// Pendência   : 21276
// Rotina      : PreparaContribuicao
// Descricao   : Preparar a contribuição de 13 caso o início dos cálculos sejam feitos após o
//               último mês cadastrado para pagamento de salário de 13, caso exista este cadastro.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 15/02/2006
// Pendência   : 21572
// Rotina      : DescarregaDocumentos
// Descricao   : gravação forçada do LACNUMDOC já que os lançamentos contáberis estão acontecendo antes
//               do financeiro, então, a gravação do LACNUMDOC como o número do documento só pode ser
//               feito após o descarregadocumentos.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 20/01/2006
// Pendência   : 20769 - 20788 - 20940
// Rotina      : DescarregaDocumentos
// Descricao   : acerto do valor no CCBAIXASXDOCUM para casos de documentos à pagar ou à receber
//               caso a receber, diminuir devoluções e o contrário caso a pagar.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 20/01/2006
// Pendência   : 20769 - 20788 - 20940
// Rotina      : EnviaContribuicaoBANCO
// Descricao   : garante preenchimento da conta de baixa caso PLACONTADEVOL não esteja paramatrizada
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 18/01/2006
// Pendência   : 20769 - 20788 - 20940
// Rotina      : EnviaContribuicaoBANCO
// Descricao   : crítica do codcentrocusto informado nos rateios para lançamentos financeiros de cpmf
//               embora seja uma parametrização contábil, é obrigatório para o envio financeiro
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 16/01/2006
// Pendência   : 24249
// Rotina      : MontaSQLContribNOVA
// Descricao   : Buscar campo VALORATUAL da regra, no somatório do campo VALORPREV independente de LOTE  
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Rotina      : EnviaContribuicao e CalculaUltimaContrib13
// Data        : 11/01/2006
// Pendência   : 19538
// Alteração   : Inclusão de dois novos parâmetros (sPlaContaDProvis e sPlaContaCProvis)
// -----------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 11/01/2006
// Pendência   : 20769
// Rotina      : EnviaContribuicaoBANCO
// Descricao   : Inclusão de rotinas para gravar os campos LACNUMDOC e DATAEMISSCOB.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 09/01/2006
// Pendência   : 21182
// Rotina      : MontaSQLContribNOVA
// Descricao   : Buscar valores de beneficio sem filtrar lote quando for Retenção.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : DescarregaDocumentos
//  Pendência  : 20783
//  Data       : 05/01/2006 - 06/01/2006
//  Descricao  : (1)criação de parâmetro de RECPAG
//               (2)acerto do lançamento de rateio
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : DescarregaDocumentos
//  Pendência  : 20828
//  Data       : 05/01/2006
//  Descricao  : mudança do parâmetro UNIDNEGOC da função CCBaixasXDocum de -1 para qryDocumentos.FieldByName('UNIDNEGOC').AsInteger
//               igual ao rateio
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : GeraAlteradorBANCO
//  Pendência  : 20769 - 20788 - 20940
//  Data       : 03/01/2006
//  Descricao  : acrescentei mensagem explicativa no erro do cálculo de alterador
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : LerContribAEnviar
//  Pendência  : 20769 - 20788 - 20940
//  Data       : 03/01/2006
//  Descricao  : coloquei MESREFERENCIA na ordenação da query
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : EnviaAlteradorBANCO
//  Pendência  : 20769 - 20788 - 20940
//  Data       : 03/01/2006
//  Descricao  : troquei o parâmetro  pinumrecebimento para psnumrecebimento, para passagem de vários
//               registros que fazem parte do mesmo documento
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 28/12/2005
// Pendência   : 21081
// Rotina      : PreparaContribuicaoASSISTIDO
// Descricao   : Buscar registros da base com a DATAINICIO certa no encerramento
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : MontaSqlContribNova
//  Pendência  : 19233
//  Data       : 20/12/2005
//  Descricao  : Passando novos parãmetros para a BuscaSalario, para indicar se
//               é abono e o seu motivo.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : DescarregaDocumentos
//  Pendência  : 20769 - 20788
//  Data       : 12122005 - 13122005
//  Descricao  : Modificaçao da função para atualizar apenas o CODOCUMENTO de uma pessoa ou conjunto NUMRECEBIMENTO.
//               Isso torna a função capaz de centralizar o envio de documentos de forma centralizada, já que agora é chamada
//               pelas funções de Recebimento, Envio, Controle individual e Tratamento de divergências.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : LerContribAEnviar
//  Pendência  : 20769 - 20788
//  Data       : 12122005
//  Descricao  : Acrescentei as críticas NVL(CPP.IDPLANPREVCONTAB,CPP.IDPLANOPREV) IDPLANPREVCONTAB
//                                       NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR ) IDPESSJURCEDIDO
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : GeraSalarioRetroativo
//  Pendência  : 20836
//  Data       : 02122005
//  Descricao  : Permitir reajuste de salário no evento de Reinscrição do Participante
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : EnviaContribuicaoBANCO
//  Pendência  : 20769 - 20788
//  Data       : 16112005 - 01122005 - 02122005 - 08122005
//  Descricao  : Mudança do envio para nbanco para não colocar RATEIOS com RECPAG diferente do documento. Ao invés
//               de lançar RECPAG diferente, lançar com valor negativo caso contrário ao documento.
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : GeraAlteradorBANCO e EnviaAlteradorBANCO
//  Pendência  : 20738
//  Data       : 30/11/2005
//  Descricao  : Alterações para contabilizar alteradores.
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : EnviaContribuicao e InsereTMPDESC
//  Pendência  : 20518
//  Data       : 18/11/2005
//  Descricao  : Acerto na passagem de parâmetros para o campo NUMRECEBIMENTO.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 18/11/2005
//  Rotina     : GeraSalarioRetroativo
//  Descricao  : Passar origem para poder atualizar os salários
//  Rotina     : PreparaContribuicaoAssistido
//  Pendência  : 20384
//  Data       : 16/11/2005
//  Descricao  : Não fazer calculo de diferença no acerto revisão, sim calcular sempre tudo
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : BaixaContribCAR
//  Pendência  : 20360
//  Data       : 08/11/2005
//  Descricao  : Alteração para considerar alteradores de devolução.
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : Várias
//  Pendência  : 20596
//  Data       : 27/10/2005
//  Descricao  : Não lançar a data de vencimento menor que a data de lançamento
//               para evitar assim, problemas na baixa do documento.
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : Várias
//  Pendência  : 20518
//  Data       : 25/10/2005
//  Descricao  : Gravar o número do recebimento (NumRecebimento) na TmpDesc.
//------------------------------------------------------------------------------
//  Autor      : Paulo Ramos
//  Rotina     : VerificaContrib
//  Pendência  : 20440
//  Data       : 18/10/2005
//  Descricao  : Rotina foi inibida, pois não deve ser mais usada.
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : AlimentaQryDocumentos
//  Pendência  : 20169
//  Data       : 27/09/2005
//  Descricao  : Acerto na comparação de valores para considerar o FLGDEVOLUÇÃO.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : EnviaContribuicaoBANCO
//  Pendência  : 20294
//  Data       : 22/09/2005
//  Descricao  : comentei bloco que separava documentos por conta de baixa. Como a função descarregadocumentos já
//               insere na tabela CCBAIXASXDOCUM, não precisa mais.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : EnviaContribuicaoBANCO, GeraAlteradorBANCO
//  Pendência  : 20275
//  Data       : 21/09/2005
//  Descricao  : passagem do primeiro parâmetro, data do lançamento, como a data de vencimento.
//               Caso a data de vancimento fosse anterior a data atual do lançamento, ocorria erro na baixa.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Rotina      : FazerInsertContab
// Data        : 20/09/2005
// Pendencia   : 20169
// Alteração   : Modificada a função para fazer uma busca nos dados já inseridos e
//               buscar a mesma conta e somar valores.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Rotina      : CalculaUltimaContrib13
// Data        : 12/09/2005
// Pendencia   : 20169
// Alteração   : Inclusão de novo parâmetro (sNaturezaDocumento) na chamada da rotina
//               dtmAPrevIntegraBack.BuscaInfIntegra
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : LerContribAEnviar
//  Pendência  : 19317
//  Data       : 01/09/2005
//  Descricao  : Incluída condição para só ler contribuições do histórico que
//               NÃO TENHAM valor recebido ou NÃO TENHAM CodDocumentoPrev preenchido. 
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : ReajustaSalPatro
//  Pendência  : 19938
//  Data       : 10/08/2005
//  Descricao  : Alterei a condição de lugar e adicionei mais uma condição
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : BaixaContribCAR
//  Pendência  : 19784
//  Data       : 20/07/2005
//  Descricao  : Alterar referencia da consulta para QryAux2
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : LerContribAEnviar e AtualizaSitContrib
//  Pendência  : 19723
//  Data       : 18/07/2005
//  Descricao  : Volta da opção 0 (zero) no controle do sinal 
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : LerContribAEnviar e AtualizaSitContrib
//  Pendência  : 19504
//  Data       : 08/07/2005
//  Descricao  : Acerto nas queries de envio de contribuicao e acerto no update da
//               situação
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : PreparaContribuicaoASSISTIDO
//  Pendência  : 19630
//  Data       : 06/07/2005
//  Descricao  : devido a modificação feita em 09/06/2005, para sempre entrar no acerto, e
//a outra modificação feita no mesmo dia, só pegando registros não recebidos (valorrecebifo <= 0)
//o valor a ser testado para avaliar a diferença não pode ser o valorrecebido e simo valorespardo
//a nova lógica força que o acerto chegue neste ponto com o campo valorrecebido sempre zero
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : EnviaContribuicaoBANCO
//  Pendência  : 19465
//  Data       : 21/06/2005
//  Descricao  : Gravar IdContaBancaria no Documento 
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : ReajustaSalPatro
//  Pendência  : 19451
//  Data       : 10/06/2005
//  Descrição  : Atualizar o campo SalAuxDoenca na PartPrevPlan.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : PreparaContribuicaoASSISTIDO
//  Pendência  : 19302
//  Data       : 09/06/2005
//  Descrição  : Caso exista registro esperado no historico, avisar o usuário
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : DescarregaDocumentos
//  Pendência  : 19403
//  Data       : 08/06/2005
//  Descrição  : Só realiza a comparação com IDPESSJURCEDIDO se o campo estiver
//               preenchido.
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : BuscaInfFinancContrib, EnviaContribuicaoBANCO, GeraSalarioRetroativo
//  Pendência  : 18536
//  Data       : 06/06/2005
//  Descricao  : - Alterar a rotina para buscar o CODPORTFORMA na seguinte ordem
//               a) CONTPLANPATRO
//               b) CONTPREV
//               c) CONTRIPREVPARTP
//               - Na EnviaContribuicaoBANCO se a pesquisa do CODPORTFORMA não
//               trouxer resultado algum, avisa ao usuário a necessidade de
//               parametrizar o campo.
//               - Caso o FrmAguarde estiver ativo, cancela a visualização na
//               abertura do form.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : ReajustaSalPatro
//  Pendência  : 19291
//  Data       : 06/06/2005
//  Descrição  : Atualizar o campo SALMANTIDO após o reajuste caso seja mantido
//------------------------------------------------------------------------------
//  Autor      : Paulo Ramos
//  Rotina     : DescarregaDocumentos
//  Pendência  : 19401
//  Data       : 03/06/2005
//  Descricao  : Procurar pelo número da pendência no código.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : DescarregaDocumentos
//  Pendência  : 19154
//  Data       : 27/05/2005
//  Descrição  : alteração no lançamento do rateiodocum para conciliar lançamentos com mesmo
//               UNIDNEGOC/CENTRORESPON/CODTIPRECDES/PLANPREVCONTAB
//               Acertei lançamento na CCBAIXASXDOCUM.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : geral
//  Pendência  : 19316
//  Data       : 23/05/2005
//  Descrição  : modifiquei todas as atribuições de sDataRef como concatenação de dia de uma data anterior e
//               mês atual em um loop. Estava acontecendo a atribuição de dia/mês inválido
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : DescarregaDocumentos
//  Pendência  : 19154
//  Data       : 18/05/2005 e 19/05/2005
//  Descrição  : alteração para gravar ou não CCBAIXASXDOCUM caso tenham várias contas de baixa ou não,
//               lançando apenas valores líquidos por contaxpatroxplano em caso positivo
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : chamadas da função FazerInsertContab em EnviaContribuicaoBANCO
//  Pendência  : 19255
//  Data       : 18/05/2005 
//  Descrição  : passagem da data para contabilização dos envios para banco como a data de vencimento
//               da contribuição. Como estava, indo a data corrente, o lançamento contábil era feito na data
//               de hoje mesmo em lançamentos retroativos
//------------------------------------------------------------------------------
//  Autor      : Paulo Ramos
//  Rotina     : PreparaContribuicaoASSISTIDO
//  Data       : 17/05/2005
//  Pendência  : 18502 (reabertura)
//  Descrição  : A pendência teve que ser reaberta pois a alteração original
//               afetou o cálculo da devolução de contribuição sobre o abono
//               anual na renovação de benefício. No caso de renovação a consulta
//               que obtém as contribuições sobre o abono anual anteriores deve ser
//               feita com a data início original do benefício e não a data da renova.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : DescarregaDocumentos, AlimentaQryDocumentos (e chamadas)
//  Data       : 16/05/2005
//  Descrição  : tratamento do IDPESSJURCEDIDO
//------------------------------------------------------------------------------
// Rotina      : DescarregaDocumentos
// Autor(a)    : Leo
// Data        : 16/05/2005
// Descricao   : no caso de participantes cedidos, passar a entidade para quem está cedido
// como favorecido/cliente no setvalues da ctrldocumento
//------------------------------------------------------------------------------
// Rotina      : TrazDadosParcela
// Autor(a)    : Leo
// Data        : 12/05/2005
// Pendência   : 19180
// Descricao   : passagem do último parâmetro, salário atual
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 05/05/2005
// Pendencia   : 19080
// Rotina      : GeraSalarioRetroativo
// Alteração   : Caso processo seja retroativo sempre reajustar os salarios
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 03/05/2005
// Pendencia   : 19139
// Rotina      : BaixaContribCAR
// Alteração   : na baixa de documentos, testa a provável baixa, via operação 4, feita pelo admprev
//               no caso de documentos não pagos
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 25 a 28/04/2005
// Pendencia   : 18773, 18980, 19078, 19154
// Rotina      : DescarregaDocumentos
// Alteração   : reescrevi a rotina para:
//               1. gerar apenas um documento, criando CCBAIXASDOCUM para as baixas;
//               2. corrigir a atualização dodocumento na HSTCONTRIBPREV;
//               3. sempre gerar retios a receber, RECPAG =  'R'
//               OBS: deixei a cópia da versão anterior comentada abaixo da atual
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 28/04/2005
// Pendencia   : 19154
// Rotina      : chamadas da função dtmAPrevIntegraBack.BuscaInfIntegra
// Alteração   : passagem do parâmetro sMsgErro para a função dtmAPrevIntegraBack.BuscaInfIntegra, para que esta retorne
//               uma possível mensagem de erro, já que ela não aciona mais um MSGDLG diretamente
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : IncluiContabilidade
//  Data       : 18/04/2005
//  Descrição  : em lançamentos em partida dobrada, quando o primeiro lançamento era de crédito,
//               a ordem da atribuição de contas estava invertida
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : DescarregaDocumentos, AlimentaQryDocumentos
//  Data       : 18/04/2005
//  Descrição  : tratamento do IDPLANPREVCONTAB
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : FazerInsertContab
//  Data       : 15/04/2005
//  Descrição  : retirei o acúmulo de valores de entradas feitas como lançamentos contábeis.
//               ficava quase impossível o caminho reverso para saber que documentos deram origem aos lançamentos.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : GeraAlteradorBANCO
//  Data       : 13/04/2005
//  Descrição  : modifiquei a geração de alteradores para utilizar o DEBCRE = C nos documentos de devoluções,
//               caso contrário eles são enviandos com o DEBCRE = D, como cadastro, estando contrários
//               ao do lançamento
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : BaixaDocumentoNAOPAGO
//  Data       : 13/04/2005
//  Descrição  : modifiquei a beixa de documentos para verificar a existência de alteradores.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : geral
//  Data       : 11/04/2005
//  Descrição  : inclusão do parâmetro do sistema prmIntegraFundacao na verificação de geração de
//               integração contábil/finenceira
//               esta parâmetro indica se deve haver integração no recebimento de contribuições
//               da fundação
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : DescarregaDocumentos
//  Data       : 07/04/2005
//  Descrição  : neste ponto, a qrydocumwentos está com todos os regsitros que deve gerar documentos no financeiro
//              caso os registros com mesmos PLACONTA,UNIDNEGOC,CODCENTRORESPON, CODTIPRECDES deêm um líquido positivo, entre cobranças e devoluções,
//              irão para o contas a receber, recpag R, caso contrário, irão para o recpag P, contas a pagar
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : AgrupaBoletasBANCO
//  Data       : 30/03/2005
//  Pendência  : 18861
//  Descrição  : Quando as boletas forem agrupadas pega o maior MÊSREFERENCIA
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : DescarregaDocumentos
//  Data       : 29/03/2005   - 30/03/2005
//  Descrição  : alteração geral na função
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : BaixaContribCAR
//  Data       : 10/03/2005
//  Pendência  : 18418 / 18740
//  Descrição  : Refeita a funcionalidade para fazer tratamento para pagamentos
//               efetuados a menor.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : PreparaConrtibuicaoAssistido / MontaSQLContribNOVA
//  Data       : 09/03/2005
//  Descrição  : Inclusão do piOrigem = 7 para Migração de Planos
//------------------------------------------------------------------------------
//  Autor      : Léo (FUNCEF)
//  Rotina     : MontaSQLContribNOVA
//  Data       : 04/03/2005
//  Descrição  : retirei um dos dois campos VALORATUAL que estava sendo passado na query
//               para cálculo de contribuição
//------------------------------------------------------------------------------
//  Autor      : Léo (FUNCEF)
//  Rotina     : MontaSQLContribNOVA
//  Data       : 04/03/2005
//  Descrição  : troquei parâmetro da função CalcBeneficioNoMes, para pegar o VALORPREV e passar como VALORATUAL nas
//               queries para cálculo de contribuição, como está em todos os outros
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : DescarregaDocumentos
//  Data       : 02/02/2005
//  Pendência  : 18076
//  Descrição  : Retirado o comentário de uma linha filtrando as contribuições
//               por DATAINICIO da HSTCONTRIBPREV
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : BaixaDocumentoNAOPAGO
//  Data       : 31/01/2005
//  Pendência  : 18589
//  Descrição  : Alterado o parâmetro da CtrlDocumento.Prepare para OpLanctoDocum
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : PreparaContribuicaoASSISTIDO / MontaSQLContribNov
//  Data       : 31/01/2005
//  Descrição  : Parametro com a data de inicio original do beneficios para regras
//  Rotina     : Varias
//  Data       : 21/01/2005
//  Descrição  : Alteração do piOrigem de 10 para 6 (Revisão)
//  Rotina     : MontaSQLContribNov
//  Data       : 20/01/2005
//  Descrição  : Novo campo VALORINSSINTEGRAL para regra
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : PreparaContribuicaoASSISTIDO
//  Data       : 19/01/2005
//  Pendência  : 18502
//  Descrição  : Retirado o comentário de uma linha filtrando as contribuições
//               por DATAINICIO da HSTCONTRIBPREV
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : EnviaContribuicaoBANCO
//  Data       : 18/01/2005
//  Descrição  : Atualizar o CODPORTFORMA na HSTCONTRIBPREV
//  Rotina     : MostraDetalhesContribuicao
//  Data       : 14/01/2005
//  Descrição  : LeftJoin no IDCARGOEXT
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : BaixaDocumentoNAOPAGO
//  Data       : 13/01/2005
//  Pendência  : 18454
//  Descrição  : Ajuste na rotina de baixa de documento no método de 3 camadas.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : MostraDetalhesContribuicao
//  Data       : 05/01/2005
//  Descrição  : Novas informações no Relatório
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : EnviaContribuicaoBANCO
//  Data       : 05/01/2005
//  Descrição  : tratamento para abatimento/decréscimo de valores de lançamentos em um mesmo documento.
//               casos em que existem rateios de pagamento de recebimento em um mesmo documento, o lançamento na
//               LANCTODOCUM deve apresentar o líquido.
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : BaixaDocumentoNAOPAGO
//  Data       : 28/12/2004
//  Pendência  : 18380
//  Descrição  : Realizar um update no campo EMISBLOQ na tabela DOCUMENTO para
//               o valor 'N' a fim de permitir o método CtrlDocumento.LanctoDocum.SetValues
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : CalculaContribuicaoACobrarNoMes
//  Data       : 17/12/2004
//  Pendência  : 18313
//  Descrição  : Caso psDataFinalContrib estivesse vazio dava erro
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : CalculaContribuicaoACobrarNoMes
//  Data       : 10/12/2004
//  Pendência  : 18264
//  Descrição  : Para contribuições de 13º verifica se o ano da data final é a
//               é maior que o atual, se for então coloca a data como 31/12 do
//               ano atual (APENAS PARA PRÓ-RATA).
//------------------------------------------------------------------------------
// Rotina      : várias
// Autor(a)    : Leo
// Data        : 07.12.2004
// Pendência   : -----
// Descricao   : acrescentei o IDMODULO nas queries para cálculo de alteradores
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : DescarregaDocumentos
//  Data       : 11/11/2004
//  Pendência  : 18076
//  Descrição  : Atualizar campo IDPLANOPREV da RATEIODOCUM
//------------------------------------------------------------------------------
//  Rotina     : AgrupaBoletasBanco
//  Autor(a)   : Camille
//  Data       : 08.11.2004
//  Pendência  : 17990
//  Descrição  : Não gravar codgrupocnab para contas a pagar
//------------------------------------------------------------------------------
//  Rotina     : ANTES das chamadas da função EstornaLancaContab
//  Autor(a)   : Leo
//  Data       : 05.11.2004
//  Pendência  : -----
//  Descrição  : verificar se o código da planilha está preenchido, caso não, não chama o estorno,
//               pois existem casos em que a integração contábil só é feita na volta
//------------------------------------------------------------------------------
//  Rotina     : MontaSQLContribNova
//  Autor(a)   : Camille
//  Data       : 04.11.2004
//  Pendência  : -----
//  Descrição  : Passar origem para a funcao BUSCASALARIO
//------------------------------------------------------------------------------
//  Rotina     : GeraSalarioRetroativo
//  Autor(a)   : Leo
//  Data       : 04.11.2004
//  Pendência  : -----
//  Descrição  : acrescentei o IDSITPART na regra de cálculo do sal. de 13
//------------------------------------------------------------------------------
//  Rotina     : EnviaContribuicaoBANCO e GeraAlteradorBANCO
//  Autor(a)   : Camille
//  Data       : 28.10.2004
//  Pendência  : -----
//  Descrição  : Acerto na chamada as rotinas de integração com back 3 camadas
//------------------------------------------------------------------------------
//  Rotina     : GravaAlterador
//  Autor(a)   : Camille
//  Data       : 28.10.2004
//  Pendência  : -----
//  Descrição  : Retornar valor dos alteradores gravados
//------------------------------------------------------------------------------
//  Rotina     : MontaSQLContribNOVA
//  Autor(a)   : Camille
//  Data       : 27.10.2004
//  Pendência  : -----
//  Descrição  : Alteracao na busca do valor da contribuicao associada para os
//               casos de calculo retroativo de contribuicoes ( origem = 10 )
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : MostraDetalhesContribuicao
//  Data       : 21/10/2004
//  Descrição  : pequeno acerto de posicionamento do salário de manutenção
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : MontaSQLContribNOVA
//  Data       : 21/10/2004
//  Descrição  : inclusão do campo DATAADMISSAO
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : BaixaContribCAR
//  Data       : 21/10/2004
//  Descrição  : impede que baixas com valor zero coloquem os alteradores com valores recebidos
//------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Data        : 08.10.2004
// Pendência   : 17551
// Descricao   : Substituicao das units do back pelas de 3 camadas :
//                        U D o c u m e n t o    -> U C t r l D o c u m e n t o
//                        U L a n c C o n t a b  -> U C t r l L a n c a m e nt o
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : GravaAlterador
//  Data       : 21/09/2004
//  Descrição  : passagem da DATAEVENTO e DATAREQUERIMENTO para calculos de alteradores, no caso de eventos
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : BaixaContribCAR
//  Data       : 17/09/2004
//  Descrição  : modificação da alteração do histórico de atrasos
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : MontaSQLContribNOVA
//  Data       : 15/09/2004
//  Descrição  : mudança de crítica para sitfundacao, que estava sendo trocado para casos de concessão
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : MontaSQLContribNOVA
//  Data       : 15/09/2004
//  Descrição  : crítica para pegar data do calendário apenas quando não para cálculos de assistidos.
//               acusando críticas para casos de cancelados em benefícios com origem no falecimento.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : MontaSQLContribNOVA
//  Data       : 15/09/2004
//  Descrição  : Passar campos que faltam para regra de calculo
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : MontaSQLContribNOVA
//  Data       : 14/09/2004
//  Descrição  : colocação de campos adicionais nas regras para suprir necessidade
//               de cálculo aturariais de contribuição
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : MostraDetalhesContribuicao
//  Data       : 30/08/2004
//  Pendência  : 17447
//  Descrição  : Acerto na impressão da data de registro
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : BaixaContribCAR
//  Data       : 12.08.2004
//  Pendência  : 17363
//  Descrição  : Acerto na baixa de alteradores
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : BuscaInfFinancContrib
//  Data       : 11.08.2004
//  Descrição  : busca do IDPLANPREVCONTAB no nível individual, obedecendo parametrização(FLGINFCONTABINDIV)
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : MontaSQLContribNOVA
//  Data       : 05.08.2004 / 06.08.2004
//  Descrição  : inclusão do campo CODREFERENCIA na consulta do valor da contribuição associada
//               pois na Funcef são calculadas 2 parcelas de décimo terceiro
//               e a consulta estava sempre buscando o mesmo valor, no caso a parcela de fevereiro
//               causando erro no cálculo das contribuições
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : GravaAlterador
//  Data       : 05.08.2004
//  Descrição  : inclusão do campo FLGEVENTO, indicando se um evento está sendo processado
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : GravaAlterador
//  Data       : 05.08.2004
//  Descrição  : acerto da passagem do campo MESREFERENCIA que estava sempre com o mesmo valor
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : BaixaDocumentoNAOPAGO
//  Data       : 20.07.2004
//  Pendência  : 16635
//  Descrição  : Criação da rotina BaixaDocumentoNAOPAGO
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : BaixaContribCAR
//  Data       : 14.07.2004
//  Pendência  : 17201
//  Descrição  : Alterações na Baixa de Contribuicoes do Contas a Receber
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : MostraDetalhesContribuicao
//  Data       : 13.07.2004
//  Pendência  : 16274
//  Descrição  : Alterações no demonstrativo
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : InsereHstContribPrev
//  Data       : 13.07.2004
//  Pendência  : 16240
//  Descrição  : Permitir que o folhaorigem seja passado pela rotina chamadora
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Rotina      : EstornaContribuicaoBanco
// Data        : 08.07.2004
// Pendência   : 17176
// Alteração   : Criacao do parametro opcional FOLHAORIGEM
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : -----
//  Data       : 07.07.2004
//  Pendência  : 17155
//  Descrição  : Gerar RAD na inclusao de documentos
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : EnviaContribuicaoBANCO
//  Data       : 30.06.2004
//  Pendência  : ----
//  Descrição  : Exibir mensagem de erro para o caso de dar erro na GetCodigo
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : AgrupaBoletasBANCO
//  Data       : 30.06.2004
//  Pendência  : ----
//  Descrição  : Estava colocando o mesmo codgrupocnab para todos os documentos
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : BaixaContribCAR
//  Data       : 30.06.2004
//  Pendência  : 17112
//  Descrição  : Não impedir que continue se der erro em uma matricula
//               ATENÇÃO :  ALTEREI A ROTINA PARA NÃO FAZER MAIS O LOOP NA
//                          QRYCONTRIB. O LOOP  DEVE  SER  FEITO NA ROTINA
//                          CHAMADORA.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : MostraDetalhesContribuicao
//  Data       : 24.06.2004
//  Descrição  : acertos para geração do décimo terceiro em mais de um mês no mesmo ano
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : PreparaContribuicao
//  Data       : 24.06.2004
//  Descrição  : acertos para geração do décimo terceiro em mais de um mês no ano
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : AgrupaBoletasBANCO
//  Data       : 22.06.2004
//  Pendência  : 17024
//  Descrição  : Pemitir gravar no verso da boleta
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : AgrupaBoletasBANCO
//  Data       : 16.06.2004
//  Pendência  : 17024
//  Descrição  : Pemitir agrupar documentos de meses diferentes em uma mesma boleta
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : EnviaContribuicaoBanco
//  Data       : 16.06.2004
//  Pendência  : 16956
//  Descrição  : Atualizar valor liquido do documento
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : MontaSQLContribNOVA
//  Data       : 19/05/2005
//  Pendência  : 16811
//  Descrição  : Para a query de assistido passar o salário de participação correto.
//               (sTipoCalculo = N)
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Descrição  : Inclusao do campo IDSITFUNC E DATADEMISSAO
//  Data       : 14/04/2004
//  Descrição  : GeraSalarioRetroativo - erro na geração do Abono
//  Data       : 28/04/2004
//  Descrição  : MontaSQLContribNOVA - No retroativo buscar o VALORINTEGRAL para Regra
//  Data       : 11/05/2004
//  Descrição  : GravaAlterador - Inclusao do campo FLGMIGRADO na query da Regra 
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : PreparaContribuicao
//  Data       : 13.04.2004
//  Pendencia  : 16409
//  Descrição  : Tratamento de contribuicoes já existentes no historico
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Descrição  : campo MESCOBRANCA no SQL de entrada
//  Rotina     : PreparaContribuicao
//  Data       : 02/04/2004
//  Descrição  : Acerto no Loop de meses
//  Data       : 05/04/2004
//  Descrição  : Acerto no mes de fevereiro na DataRef
//  Data       : 06/04/2004
//  Descrição  : Acerto no calculo do Abono
//  Data       : 12/04/2004
//  Descrição  : Inclusao do campo IDSITFUNC
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : VefificaContabMantido
//  Data       : 31.03.2004
//  Descrição  : - Alteração do nome da rotina para VerificaContabMantidoNoEnvio
//               - Alteracao do nome da variavel bContabiliza para bContabilizaNOEnvio
//               - Padronizacao do critério de teste da variavel bContabiliza,
//                 que em algumas rotinas testava se contabilizava no envio e em
//                 outras no recebimento
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : GravaAlterador
//  Data       : 30/03/2004
//  Descrição  : campo MESCOBRANCA no SQL de entrada
//------------------------------------------------------------------------------
//  Autor      : Leo / Augusto
//  Rotina     : PreparaContribuicao
//  Data       : 23/03/2004
//  Descrição  : Alteração de controle da cobrança de 13 no meio do ano
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : MontaSQLContribNOVA
//  Data       : 23/03/2004
//  Descrição  : Acerto na pesquisa de valores para Abono 
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : EnviaContribuicaoBanco
//  Data       : 22.03.2004
//  Pendencia  : 16303
//  Descrição  : Passar centro de custo e programa do centro de custo
//------------------------------------------------------------------------------
// Rotina      : EnviaContribuicaoBanco
// Autor(a)    : Camille
// Pendencia   : 16301
// Data        : 22.03.2004
// Alteração   : Avisar que conta contabil nao foi parametrizada
//------------------------------------------------------------------------------
// Rotina      : PreparaContribuicaoAssistido
// Autor(a)    : Augusto
// Data        : 16/03/2004
// Alteração   : Alterações para cobrar contribuição sobre adiantamento de abono
//------------------------------------------------------------------------------
// Rotina      : MontaSQLContribNova
// Autor(a)    : Camille
// Pendência   : ----
// Data        : 11.03.2004
// Alteração   : Passar campos de parcelamento nas querys
//------------------------------------------------------------------------------
// Rotina      : EnviaContribuicaoBANCO
// Autor(a)    : Camille
// Pendência   : ----
// Data        : 10.03.2004
// Alteração   : Passar a gravar FORMA DE COBRANCA/PAGAMENTO, alem do PORTADOR
//               FORMA, para permitir geração da AP da FUNCEF, que exige este
//               campo
//------------------------------------------------------------------------------
// Rotina      : AlimentaQryDocumentos
// Autor(a)    : Ricardo Vigorito
// Pendência   : 16178
// Data        : 04/03/2004
// Alteração   : Alteração na query que inclui o Número do Documento Financeiro
// no hstContribPrev
//------------------------------------------------------------------------------
// Rotina      : BuscaRamoForCli
// Autor(a)    : Augusto
// Data        : 02/03/2004
// Alteração   : Tratamento de MS igual ao MA 
// -----------------------------------------------------------------------------
// Rotina      : MontaSQLContribNOVA
// Autor(a)    : Leo
// Data        : 19/02/2004
// Alteração   : tratamento para salário de mantido parcial
// -----------------------------------------------------------------------------
// Rotina      : AgrupaBolatesBANCO
// Autor(a)    : Leo
// Data        : 19/02/2004
// Alteração   : destrói a qrytst, que é criada em tempo de execução no loop
// -----------------------------------------------------------------------------
// Rotina      : MontaSQLContribNova
// Autor(a)    : Augusto
// Data        : 29/01/2004
// Alteração   : Oranumero() nos novos parametros
// -----------------------------------------------------------------------------
// Rotina      : MontaSQLContribNova
// Autor(a)    : Camille
// Data        : 26.01.2004
// Pendencia   : ----
// Alteração   : Passagem de Novos parametros do parcelamento
// -----------------------------------------------------------------------------
// Rotina      : GeraSalarioRetroativo
// Autor(a)    : Camille
// Data        : 19.01.2004
// Pendencia   : ----
// Alteração   : Alteracao para calcular salário do mantido parcial através
//               de regra, se assim estiver parametrizado
// -----------------------------------------------------------------------------
// Rotina      : TestaPeriodicidade
// Autor(a)    : Camille
// Data        : 19.01.2004
// Pendencia   : ----
// Alteração   : Alteracao para tratar 13o. como ULTMESPREPARO pois estava
//               dando erro de data inválida
// -----------------------------------------------------------------------------
// Rotina      : MontaSQLContribNova
// Autor(a)    : Augusto
// Data        : 16/01/2004
// Pendencia   : ----
// Alteração   : Inclusao do FlgDiretor nas querys para regra
// -----------------------------------------------------------------------------
// Rotina      : GeraSalarioRetroativo
// Autor(a)    : Camille
// Data        : 14.01.2004
// Pendencia   : ----
// Alteração   : Tratamento para geração de salário 13o. para eventos
//               que ocorrem depois do ultimo mes de pagamento do 13o.
// -----------------------------------------------------------------------------
// Rotina      : PreparaContribuicao
// Autor(a)    : Camille
// Data        : 14.01.2004
// Pendencia   : ----
// Alteração   : Tratamento para geração de salário 13o. para eventos
//               que ocorrem depois do ultimo mes de pagamento do 13o.
// -----------------------------------------------------------------------------
// Rotina      : GeraSalarioRetroativo
// Autor(a)    : Camille
// Data        : 07.01.2004
// Pendencia   : 15880
// Alteração   : Gravação do IDPATRO na Histrubsal
// -----------------------------------------------------------------------------
// Rotina      : PreparaContribuicaoASSISTIDO
// Autor(a)    : Camille
// Data        : 07.01.2004
// Pendencia   : 15864
// Alteração   : Retirada da clausula pela Data de Inicio
// -----------------------------------------------------------------------------
// Rotina      : PreparaContribuicao
// Autor(a)    : Camille
// Data        : 17.12.2003
// Alteração   : Acerto no tratamento de 13o. no meio do ano
// -----------------------------------------------------------------------------
// Rotina      : PreparaContribuicaoASSISTIDO
// Autor(a)    : Gleyber
// Data        : 15/12/2003
// Alteração   : Acerto na query que verifica se a contribuicao já foi calculada
//               para o mes informado no campo DATAINICIO.
// -----------------------------------------------------------------------------
// Rotina      : LerContribAEnviar
// Autor(a)    : Camille
// Data        : 03.12.2003
// Alteração   : Alteração na query para enviar 13o.Salário.
// -----------------------------------------------------------------------------
// Rotina      : ReajustaSalPatro
// Autor(a)    : Camille
// Data        : 26.11.2003
// Alteração   : Tratamento para diferenciar reajuste sobre cargo de reajuste sobre
//               salário
// -----------------------------------------------------------------------------
// Rotina      : MontaSQLContribNOVA
// Autor(a)    : Augusto
// Data        : 25/10/2003 - 26/10/2003 - 28/10/2003
// Alteração   : VALORREFERENCIA passava sValorFinal que vindo da PreparaContribuicaoAssistido
//               estava zerado, agora passo o VALORINTEGRAL - inclusão do campo FLGDIRETOR no
//               SQL do calcula da contribuicao 
// -----------------------------------------------------------------------------
// Rotina      : MostraDetalhesContribuicao
// Autor(a)    : Camille
// Data        : 01.10.2003
// Alteração   : Alteração no demonstrativo de contribuições
// -----------------------------------------------------------------------------
// Rotina      : EnviaContribuicaoBanco
// Autor(a)    : Camille
// Data        : 29.07.2003
// Alteração   : Alteração na atualização da lanctodocum pois da forma que estava
//               atualizava todos os lancamentos do documento e não apenas o principal,
//               ou seja, se houvessem alteradores, seus valores também eram atualizados 
// -----------------------------------------------------------------------------
// Rotina      : LerContribAEnviar
// Autor(a)    : Augusto
// Data        : 14/07/2003
// Alteração   : Acerto na implementação do controle de MESCOBRANCA (CBS)
// -----------------------------------------------------------------------------
// Rotina      : LerContribAEnviar
// Autor(a)    : Gleyber
// Data        : 07/07/2003
// Alteração   : Inclusão de um parâmetro para trabalhar o mês cobrança (CBS)
// -----------------------------------------------------------------------------
// Rotina      : PreparaContribuicaoAssistido
// Autor(a)    : Camille
// Data        : 26.06.2003
// Alteração   : Alteracao da condicao para preparar ate o mes anterior. Erro na CBS
// -----------------------------------------------------------------------------
// Rotina      : ReajustaSalPatro
// Autor(a)    : Camille
// Data        : 24.06.2003
// Alteração   : Gravar ultimo mes de reajuste mesmo que o participante não seja
//               ativo ou mantido
// -----------------------------------------------------------------------------
// Rotina      : MontaSQLContribNOVA
// Autor(a)    : Augusto
// Data        : 20/02/2003
// Alteração   : Alteração do Valor passado no campo VALORATUAL para o mesmo passado no
//               VALORNOLOTE
// -----------------------------------------------------------------------------
// Rotina      : DesfazRetencaoEncerramento
// Autor(a)    : Gleyber
// Data        : 23/01/2003
// Alteração   : Acréscimo de varíaveis 
// -----------------------------------------------------------------------------
// Rotina      : MontaSQLContribNova
// Autor(a)    : Camille
// Data        : 23.01.2003
// Alteração   : Acréscimo do parametro MESCOBRANCA
// -----------------------------------------------------------------------------
// Rotina      : PreparaContribuicaoAssistido
// Autor(a)    : Camille
// Data        : 23.01.2003
// Alteração   : Em todos os testes de 1o. pagamento foi retirada a condição de
//               dia diferente de 01 pois na FCRT esta regra deve ser executada
//               mesmo que o dia da DIB seja dia 1o.
// -----------------------------------------------------------------------------
// Rotina      : CalculaContribuicaoACobrarNoMes
// Autor(a)    : Camille
// Data        : 21.01.2003
// Alteração   : Rotina para calcular valor de uma contribuicao em um determinado
//               mês
// -----------------------------------------------------------------------------
// Rotina      : EnviaContribuicaoBANCO
// Autor(a)    : Leo
// Data        : 16/01/2003
// Alteração   : comentei a cláusula ' AND PLNCODIGO = '+inttostr(iPlnCodigo)+' ';
//               pois no caso de contabilização apenas
//               no recebimento, as planilhas não são criadas
//               o que causava erro no update acima, não atualizando nada
// -----------------------------------------------------------------------------
// Rotina      : MontaSQLContribNOVA
// Autor(a)    : Gleyber
// Data        : 15/01/2003
// Alteração   : Inserido o campo DEBCRED para a query da regra de MANTIDOS
// -----------------------------------------------------------------------------
// Rotina      : PreparaContribuicaoASSISTIDO
// Autor(a)    : Gleyber
// Data        : 20/12/2002
// Alteração   : Comentado o IDMOTIVO na query, pois não achava 13º
// -----------------------------------------------------------------------------
// Rotina      : MontaSqlContribNova
// Autor(a)    : Leo
// Data        : 04.12.2002
// Alteração   : tratamento de contribuições de parcelamento
// -----------------------------------------------------------------------------
// Rotina      : PreparaContribuicaoASSISTIDO
// Autor(a)    : Camille
// Data        : 06.11.2002
// Alteração   : Alteração no tratamento de ultimo pagamento
//------------------------------------------------------------------------------
// Rotina      : BaixaContribCAR
// Autor(a)    : Leo
// Data        : 21/11/2002
// Alteração   : função que pega o parâmetro que diz se as cobranças  bancárias de
//               mantidos devem ser contabilizadas no envio ou recebimento.
//               caso a contabilização seja no recebimento, efetuá-la.
//------------------------------------------------------------------------------
// Rotina      : MostraDetalhesContribuicao
// Autor(a)    : Augusto
// Data        : 19/11/2002
// Alteração   : Inclusão de parametro para data final de um evento
//------------------------------------------------------------------------------
// Rotina      : VerificaContabMantidoNoEnvio
// Autor(a)    : Leo
// Data        : 14/11/2002
// Alteração   : função que pega o parâmetro que diz se as cobranças  bancárias de
//               mantidos devem ser contabilizadas no envio ou recebimento
//------------------------------------------------------------------------------
// Rotina      : EnviaContribuicaoBANCO
// Autor(a)    : Leo
// Data        : 14/11/2002
// Alteração   : modificação para não contabilizar no envio
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : inclusão dos campos VALORBASE4 , VALORBASE5 , VALORBASE6
//------------------------------------------------------------------------------
// Rotina      : GeraSalarioRetroativo
// Autor(a)    : Gleyber
// Data        : 05/10/2002
// Alteração   : Alteração para colocar NULL na query
//------------------------------------------------------------------------------
// Rotina      : InsereHstContribPREV
// Autor(a)    : Leo
// Data        : 31/10/2002
// Alteração   : no preparo de contribuições para flgdescfolha = 0(banco) estava
//               enviando folhaorigem = 'p', quando deveria enviar folhaorigem = 'c'
//------------------------------------------------------------------------------
// Rotina      : PreparaContribuicao
// Autor(a)    : Leo
// Data        : 31/10/2002
// Alteração   : no preparo de contribuições para flgdescfolha = 0(banco) estava
//               enviando folhaorigem = 'p', quando deveria enviar folhaorigem = 'c'
//------------------------------------------------------------------------------
// Rotina      : PreparaContribuicao
// Autor(a)    : Leo
// Data        : 31/10/2002
// Alteração   : comentário na cláucula por situação. teste de duplicação na HSTCONTRIBPREV.
//------------------------------------------------------------------------------
// Rotina      : EnviaContribuicao
// Autor(a)    : Leo
// Data        : 29/10/2002
// Alteração   : acerto na escolha da rubrica de décimo terceiro. Estava pegando arubrica de atraso...
//------------------------------------------------------------------------------
// Rotina      : EstornaContribuicaoBANCO
// Autor(a)    : Leo
// Data        : 28/10/2002
// Alteração   : teste se o documento já foi deletado, ara casos de vários registros para um mesmo documento
//------------------------------------------------------------------------------
// Rotina      : EstornaContribuicaoBANCO
// Autor(a)    : Leo
// Data        : 28/10/2002
// Alteração   : inclusão de mais plics
//------------------------------------------------------------------------------
// Rotina      : EstornaContribuicaoBANCO
// Autor(a)    : Leo
// Data        : 24/10/2002
// Alteração   : mudança do lugar da exclusão dos documentos
//               para só após todos os estornor de lançamento
//               , senão acusava constraint com a lanctodocum
//------------------------------------------------------------------------------
// Rotina      : AgrupaBoletasBANCO
// Autor(a)    : Leo
// Data        : 24/10/2002
// Alteração   : incluína a clausula (AND    HST.FLGDESCFOLHA  = 0 ) na query principal
//               forçando regsistros enviados apenas para banco
//------------------------------------------------------------------------------
// Rotina      : GeraSalarioRetroativo
// Autor(a)    : Leo
// Data        : 23/10/2002
// Alteração   : inclusão do idplanoprev na histrubsal na
//               parte de desmembrament de rubricas de mantido
//------------------------------------------------------------------------------
// Rotina      : MostraDetalhesContribuicao
// Autor(a)    : Gleyber
// Data        : 18/10/2002
// Alteração   : Acerto na query
//------------------------------------------------------------------------------
// Rotina      : GeraSalarioRetroativo
// Autor(a)    : Leo
// Data        : 17/10/2002
// Alteração   : ajustes no controle das rubricas desmembradas de mantidos
//------------------------------------------------------------------------------
// Rotina      : GeraSalarioRetroativo
// Autor(a)    : Leo
// Data        : 17/10/2002
// Alteração   : força a destruição da tela de cadastro manual de rubricas
//------------------------------------------------------------------------------
// Rotina      : AgrupaBoletasBANCO
// Autor(a)    : Gleyber
// Data        : 16/10/2002
// Alteração   : Inclusao da funcao BUSCASALARIO
//------------------------------------------------------------------------------
// Rotina      : MontaSQLContribNova
// Autor(a)    : Leo
// Data        : 08/10/2002
// Alteração   : acrescentei o valorsrb nas queries passadas para a regra
//------------------------------------------------------------------------------
// Rotina      : EnviaContribuicaoBANCO
// Autor(a)    : Flávio Dias
// Data        : 26/09/2002
// Alteração   : mudança na montagem da descrição
//------------------------------------------------------------------------------
// Rotina      : PreparaContribuicao
// Autor(a)    : Leo
// Data        : 26/09/2002
// Alteração   : troquei as condições if feitas com sAnoMesfinal por
//               copy(sDataRefFinal,7,4)+copy(sDataRefFinal,3,3)
//               pois caso o prepara seja apenas de um mês, mesmo que este não seja o final
//               o mesmo mês é atribuído ao sAnoMesFinal
//               forçando o cálculo da regra de último pagamento como se o fosse
//------------------------------------------------------------------------------
// Rotina      : MostraDetalhesContribuicao
// Autor(a)    : Leo
// Data        : 26/09/2002
// Alteração   : acrescentei a cláusula AND    FLGSITFUNDACAO = '''+sSitFundacao+'''
//               para casos em que a manutanção é feita após o preparo de ativo
//               e as contribuições de mantido são as mesmas que as de ativo
//               para casos em que o participante não está desligado, como: afastamento
//------------------------------------------------------------------------------
// Rotina      : Preparacontribuição
// Autor(a)    : Leo
// Data        : 26/09/2002
// Alteração   : acrescentei a cláusula AND    FLGSITFUNDACAO = '''+sSitFundacao+'''
//               para casos em que a manutanção é feita após o preparo de ativo
//               e as contribuições de mantido são as mesmas que as de ativo
//               para casos em que o participante não está desligado, como: afastamento
//------------------------------------------------------------------------------
// Rotina      : LerContribAEnviar
// Autor(a)    : Leo
// Data        : 25/09/2002
// Alteração   : acrescentei campos para o desfazer d recebimento
//               na questão da volta dos salários reajustados
//------------------------------------------------------------------------------
// Rotina      : MontaSQLContribNova
// Autor(a)    : Carlos Guedes
// Data        : 18/09/2002
// Alteração   : Acertanto a busca do salário de ATIVO.
//------------------------------------------------------------------------------
// Rotina      : AgrupaboletasBanco
// Autor(a)    : Leo
// Data        : 16/09/2002
// Alteração   : Acrescentei críticas para ditrecebimento
//------------------------------------------------------------------------------
// Rotina      : EnviaContribuicaoBANCO
// Autor(a)    : Leo
// Data        : 12/09/2002
// Alteração   : testa se a conta do documento é diferente mesmo para um mesmo
//               participante. Caso sim, criar outro documento.
//------------------------------------------------------------------------------
// Rotina      : MontaSQLContribNova / CalcSALPART
// Autor(a)    : Carlos Guedes
// Data        : 09/09/2002
// Alteração   : Esta função estava retornando valor incorreto no caso de mantido. (CalcSALPART)
//------------------------------------------------------------------------------
// Rotina      : PreparaContribuicaoAssistido
// Autor(a)    : Camille
// Data        : 12.08.2002
// Alteração   : Permitir, para os eventos de falecimento, que o lote seja nulo
//------------------------------------------------------------------------------
// Rotina      : PreparaContribuicao
// Autor(a)    : Camille
// Data        : 09.08.2002
// Alteração   : Se a situacao do participante for assistido e a origem for
//               concessao ou renova, passar como data final a data final do
//               beneficio
//------------------------------------------------------------------------------
// Rotina      : PreparaContribuicaoAssistido
// Autor(a)    : Camille
// Data        : 09.08.2002
// Alteração   : Se o benficio tiver abono apenas no final do ano, so cobrar
//               a contribuicao sobre 13o. no final do ano.
//------------------------------------------------------------------------------
// Rotina      : MontaSQLContribNova
// Autor(a)    : Camille
// Data        : 07.08.2002
// Alteração   : Passar valor integral do beneficio para egra de calculo
//------------------------------------------------------------------------------
// Rotina      : CobraContribContingencia
// Autor(a)    : Carlos Guedes
// Data        : 06/08/2002
// Alteração   : trocando qryContrib.FieldByName('DATAINICIO'). AsDateTime por AsString
//------------------------------------------------------------------------------
// Rotina      : MontaSQLContribNOVA
// Autor(a)    : Carlos Guedes
// Data        : 15/07/2002
// Alteração   : Acrescentando NUMEROPROCESSO na query de entrada a regra.
//------------------------------------------------------------------------------
// Rotina      : ReajustaSalPatro
// Autor(a)    : Camille
// Data        : 12/07/2002
// Alteração   : acréscimo do parâmetro flgIntSitPart para saber se o participante
//               é ativo ou assistido
//------------------------------------------------------------------------------
// Rotina      : GeraSalarioRetroativo
// Autor(a)    : Camille
// Data        : 12/07/2002
// Alteração   : acertei query pois estava com PP.IDPESSJUR ao inves de IDPESSJUR
//------------------------------------------------------------------------------
// Rotina      : EstornaContribuicaoBANCO
// Autor(a)    : Leo
// Data        : 09/07/2002
// Alteração   : troquei a data de entrada da EstornaLncto de datalancto para a data atual
//               pois o estorno da contabilidade deve ser feito na data atual e não no período anterior
//------------------------------------------------------------------------------
// Rotina      : MontaSQLContribNOVA
// Autor(a)    : Carlos Guedes
// Data        : 09/07/2002
// Alteração   : Adicionei campos VALORATUAL e VLRINFINSS em todas as queries.
//------------------------------------------------------------------------------
// Rotina      : EnviaContribuicao
// Autor(a)    : Leo
// Data        : 28/06/2002
// Alteração   : zerara variável sSQLValuesAlterador := sSQLValuesAlteradorIni
//------------------------------------------------------------------------------
// Rotina      : GeraSalarioRetroativo
// Autor(a)    : Leo
// Data        : 24/06/2002
// Alteração   : criação da qryloophist fora do if
//------------------------------------------------------------------------------
// Rotina      : PreparaContribuicaoASSISTIDO
// Autor(a)    : Leo
// Data        : 24/06/2002
// Alteração   : tratamento de devoluções no acerto
//------------------------------------------------------------------------------
// Rotina      : MontaSQLContribNOVA
// Autor(a)    : Leo
// Data        : 21/06/2002
// Alteração   : parte de mantidos: sValorSalPart  := OraNumero(sValorRubParcial)
//------------------------------------------------------------------------------
// Rotina      : MontaSQLContribNOVA
// Autor(a)    : Leo
// Data        : 21/06/2002
// Alteração   : troquei 'mp' por sSitFundacao na chamada de busca de salário
//------------------------------------------------------------------------------
// Rotina      : ReajustaSalPatro
// Autor(a)    : Leo
// Data        : 18/06/2002
// Alteração   : pasar sempre SALMANUTTOTAL na query para reajuste, no caso de desmembramento
//               da rubrica de manutenção este valor eve ser passado para que o índice de
//               reajuste que pode ser por faixa seja o mesmo do total ara todas as
//               rubricas desmembradas
//------------------------------------------------------------------------------
// Rotina      : GeraSalarioRetroativo
// Autor(a)    : Leo
// Data        : 13/06/2002
// Alteração   : incluí sNomeRubrica := 'IDRUBSALPARTICIP', pois e alguns casos estava zerado ao chegar na query
//               urgência CBS
//------------------------------------------------------------------------------
// Rotina      : GeraSalarioRetroativo
// Autor(a)    : Leo
// Data        : 12/06/2002
// Alteração   : loop para reajuste de cada rubrica dos manutenidos
//------------------------------------------------------------------------------
// Rotina      : MontaSqlContribNova
// Autor(a)    : Leo
// Data        : 12/06/2002
// Alteração   : modifiquei busca de salário de mantido acrescentando  --> or (sSitFundacao  = 'MA')
//------------------------------------------------------------------------------
// Rotina      : AlimentaQryDocumentos
// Autor(a)    : Leo
// Data        : 06/06/2002
// Alteração   : incusão e tramento do parâmetro flgdevolucao
//------------------------------------------------------------------------------
// Rotina      : DescarregaDocumentos
// Autor(a)    : Leo
// Data        : 06/06/2002
// Alteração   : alteração deneralizada na função, incluindo também tratamento para devoluções
//------------------------------------------------------------------------------
// Rotina      : GeraSalarioRetroativo
// Autor(a)    : Leo
// Data        : 05/06/2002
// Alteração   : Tratamento para desmembrar rubricas de manutenidos, caso o flgtodasrubmanut esteja
//               marcado
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 29.05.2002
// Alteração   : Inclusão do campo FOLHAORIGEM, nos inserts na tabela HSTCONTRIBPREV
//------------------------------------------------------------------------------
// Rotina      : PreparaContribuicaoASSISTIDO
// Autor(a)    : Leo
// Data        : 29.05.2002
// Alteração   : Inclusão do parâmetro inumprocesso, para uso da função MontaSQLContribNOVA
//------------------------------------------------------------------------------
// Rotina      : EnviaContribuicao
// Autor(a)    : Leo
// Data        : 09.05.2002
// Alteração   : Alteração completa da função DescarregaDocumentos
//------------------------------------------------------------------------------
// Rotina      : EnviaContribuicao
// Autor(a)    : Camille
// Data        : 01.04.2002
// Alteração 1 : Reestruturação da rotina para buscar paramtrização contábil
//               utilizando a nova estrutura DAPrevIntegraBack.BuscaInfIntegra
//               e reorganização do tratamento de alterador, utilizando a rubrica
//               correspondente na tabela de Alteradores x Contribuicao
// -----------------------------------------------------------------------------
// Rotina      : EstornaPlanilhaContabil
// Autor(a)    : Camille
// Data        : 05.04.2002
// Alteração   : Rotina para estornar ou excluir uma planilha da contabilidade
// -----------------------------------------------------------------------------
// Rotina      : MostraDetalhesContribuicao
// Autor(a)    : Gleyber
// Data        : 26/08/2002
// Alteração   : Acerto do layout do demonstrativo - Pendência 8515
//------------------------------------------------------------------------------

unit UContribuicaoPrev;
{ Unit com as rotinas relativas às Contribuições Previdenciárias }

interface


uses SysUtils,wwQuery, Messages, Dialogs, Windows, Classes, Graphics, Controls, Forms, ComCtrls, StdCtrls,
     Grids, DBCtrls, Db, wwdblook, UCtrlDocumento, UCtrlLancamento;


type
  RecDadosRateio = Record
                       UnidNegoc,
                       PlanprevContab,
                       CodTipRecDes,
                       CodCentroRespon : String
                   End;

  RecCcBaixas = Record
                       PlanprevContab,
                       PlaConta : String
                   End;


var
   { Variáveis Globais }
   sDataRenova   : string; // PROVISORIO - CAMILLE - 18.12.2002  

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
                               pIdPessJur,pIdPlanoPrev,pIdContrib, piIdContribAnt : integer; pIdPessoa : integer = 0 ) : boolean;


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
//               sDATAVOLTAINTERFA = data que o lote voltou do banco ou interface para ccp (nao obrigatorio)
// Retorno    : -1     = houve algum erro
//              número = número do lote gerado
// *****************************************************************************
function GeraLOTE(idPatro : integer; bGravaLote : boolean; sMesReferencia,sTipo,sDescricao,sAtrasoDevol,
                  sFlgPreparado,sFlgIdaTmp, sFlgVoltaTmp, sFlgIdaInterface,sFlgVoltaInterface,
                  sDataPreparo,sDataIdaTmp,sDataVoltaTmp,sDataIdaInterface,sDATAVOLTAINTERFA : string ) : integer;

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
//               psAnoMesCobranca = mes de competencia do lote a ser lido
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
//               piCobEnviar     = Indica a cobrança a ser enviada a saber
//                                 0 - Todas
//                                 1 - Apenas do Mês
//                                 2 - Apenas Atrasadas
//                                 3 - Apenas Devoluções
// Retorno    : True   = operacao efetuada com sucesso
//              False  = erros na operacao
// *****************************************************************************
function LerContribAEnviar(piIdLote, piSitRecebimento : integer;
                           psAnoMesCobranca : string;
                           var qry : TwwQuery;
                           piCobEnviar : Integer) : boolean;

// *****************************************************************************
// Função LERALTERADORCONTRIB -  Dado um número de recebimento, verifica se o mesmo
//                               possui correcao monetaria ou juros na tabela de alteradores
// Parâmetros :  qry              : query que retornara com os alteradores do recebimento
//               psMesReferencia  : mes de referencia do historico de contribuicao
//               psMesCobranca    : mes de cobranca do historico de contribuicao
//               piNumRecebimento : número de recebimento do historico de contribuicao
//               piIdMotivo       : motivo do historico de contribuicao
// Retorno    : True   = operacao efetuada com sucesso
//              False  = erros na operacao
// *****************************************************************************
function LerAlteradorContrib(var qry : TwwQuery;
                             psMesReferencia, psMesCobranca : string;
                             piNumRecebimento, piIdMotivo : longint) : boolean;

// *****************************************************************************
// Função ENVIACONTRIBUICAO - Grava na TMPDESC o envio de um registro de contribuicao
// Parâmetros :  qry             = qry com o registro a ser enviado
//               piOrdem         = ordem do registro que está sendo enviado no lote
//               piIdLote        = identificador do lote a ser enviado
//               liPeriodo       = periodo contabil do envio
//               liExercicio     = exercicio contabil do envio
//               sSitFundacao    = situacao do participante na fundacao(flgINTERNO da SITPART)
//               sCamposObrig    = string que será preenchida pela função com os nomes
//                                 dos campos de integracao financeira, OBRIGATORIOS,
//                                 que nao estao preenchidos.
//               sCamposNObrig    = string que será preenchida pela função com os nomes
//                                 dos campos de integracao financeira, NAO obrigatorios,
//                                 que nao estao preenchidos.
// Retorno    : -1     = erro no envio
//              valor  = valor enviado
// *****************************************************************************
function EnviaContribuicao(qry                 : TwwQuery;
                           piOrdem,
                           piIdLote,
                           liPeriodo,
                           liExercicio         : longInt;
                           sSitFundacao,
                           psFlgIntEvento      : string;
                           piUltimaContrib     : integer;
                           var bExigeFinanc    : boolean) : real;

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
//                                      8 - Cancelada (pode ser reenviada)
//                                      9 - Contrib. Atrasada a cobrar na Folha de Benefício
//                                      T - Temporario : contribuicao patronal, com valor recalculado pelo trat. diverg.
//                                          ainda nao acertada no CAR
//                                      F - CONTRIBUICAO DE FALECIDO A ACERTAR NO RECEBIMENTO DA FOLHA
//                                          DE BENEFICIO // CAMILLE - 29.04.2002  
// Retorno    : True    = atualizacao ok
//              False   = atualizacao com erro
// *****************************************************************************
function AtualizaSitContrib(qry : TwwQuery; piIdLote,piSitRecebimento,
                            piTipoCobranca : Integer) : boolean;  // Gleyber - 08/07/2005 - Pendência 19504

// *****************************************************************************
// Função CALCULAALTERADOR - Dado o valor de uma contribuicao, calcula o valor de
//                           correcao monetária ou juros para esta contribuicao
//                          qryAux            - query auxiliar
//                          piIdPessJur       - código da patrocinadora
//                          piIdPlanoPrev     - código do plano
//                          piCodAlterador    - código do alterador
//                          piIdRegraCalculo  - identificador da regra de calculo do alterador
//                          psAnoMesCalculo   - ano/mes (yyyy/mm) no qual se irá cobrar o alterador
//                          psDataRef         - data de referencia para passar na regra
//                          psDataCobranca    - data em que foi/será cobrada a contribuicao
//                          psFlgIntSitPart   - situacao do participante na fundacao (flginterno)
//                          prValorContrib    - valor da contribuicao sobre a qual incidirá o alterador
//                          var sMsgErro      - variavel de controle de erro
// Retorno    : NÚMERO com o valor do alterador
// *****************************************************************************
function CalculaAlterador ( qryAux           : TwwQuery;
                            piIdPessJur,
                            piIdPlanoPrev,
                            piCodAlterador,
                            piIdRegraCalculo : longint;
                            psAnoMesCalculo,
                            psDataRef,
                            psDataCobranca,
                            psFlgIntSitPart  : string;
                            prValorContrib   : double;
                            var sMsgErro     : string  ) : double;

// *****************************************************************************
// Função GRAVAALTERADOR -  Dado o valor de uma contribuicao, calcula o valor de
//                          correcao monetária ou juros para esta contribuicao
//                          e o grava na tabela HSTATRASOCONTRIB
// Parâmetros :  sTipo            = indica o tipo de alterador (C - Correcao, J - Juros)
//               sMesReferencia   = mes de referencia da contribuicao
//               sMesCobranca     = mes de cobranca do alterador da contribuicao
//               sFlgEvento       = indica se a contribuicao está sendo preparada por
//                                  evento (1) ou nao (0) ou (FlgInterno do Evento)
//               piNumRecebimento = numero do recebimento do qual está se cobrando o atraso
//               piIdMotivo       = motivo de contribuicao
//               pIdPlanoPrev     = Plano
//               pIdContribuicao  = Contribuição
//               sDataRef         = data de referencia para o calculo do alterador
//               sValor           = Valor total da contribuicao sobre a qual se calculará o alterador
// Retorno    : True   = operacao efetuada com sucesso
//              False  = erros na operacao
// *****************************************************************************
function GravaAlterador( sTipo                : string;
                         sMesReferencia       : string;
                         sMesCobranca         : string;
                         sFlgEvento           : string;
                         piNumRecebimento     : integer;
                         piIdMotivo           : integer;
                         pIdPlanoPrev         : integer;
                         pIdContribuicao      : integer;
                         pIdPessJur           : integer;
                         sDataRef             : string;
                         sDataPrevisao        : string;
                         sDataRecebido        : string;
                         sValor               : string;
                     var sMsgErro             : string;
                         piIdPessoa           : integer = 0;
                         piOrigem             : integer = 0;              // CAMILLE - 28.10.2004
                         piCodAlterador       : integer = -1 ) : boolean; // CAMILLE - 05.11.2004

// *****************************************************************************
// Função CALCULAEINSEREALTERADORCONTRIB -
//              Calcula e insere na tabela HstAtrasoContrib todos os alteradores
//              cadastrados para uma determinada contribuicao
//              qryAux            - query auxiliar
//              psFlgAtrasoDevol  - indica se é um atraso(A) ou uma devolucao(D)
//              piIdPessJur       - código da patrocinadora
//              piIdPlanoPrev     - código do plano
//              piIdPessoa        - código da pessoa (participante)
//              piIdContribuicao  - código da contribuicao
//              piIdMotivo        - motivo que está gravado na Hstcontribprev
//              piNumRecebimento  - número do recebimento na Hstcontribprev
//              psMesCobranca     - mes de cobranca na Hstcontribprev
//              psMesReferencia   - mes de referencia na Hstcontribprev
// Retorno    : True/False (operacao com sucesso/erros)
// *****************************************************************************
function  CalculaEInsereAlteradorContrib( qryAuxAlterador  : TwwQuery;
                                   psFlgAtrasoDevol        : char; // A = Atraso, D = devolucao
                                   piIdPessJur,   piIdPlanoPrev,
                                   piIdPessoa,    piIdContribuicao,
                                   piIdMotivo,    piNumRecebimento  : longint;
                                   psMesCobranca, psMesReferencia   : string ) : boolean;

// *****************************************************************************
// Função INSEREHSTCONTRIBPREV-  insere um registro na Hstcontribprev com os dados
//                               passados como parâmetro
// Retorno    : NumRecebimento se nao houve erro ou -1, caso tenha ocorrido erro
// *****************************************************************************
function InsereHstContribPREV( qryAux                              : TwwQuery;
                               piIdPessoa,       piSeqProposta,
                               piIdPessJur,      piIdPlanoPrev,
                               piIdContribuicao, piIdMotivo        : longint;
                               psMesReferencia,  psMesCobranca     : string;
                               piCodPortForma                      : longint;
                               psDataCobranca,   psDataRecebimento : string;
                               pdValorEsperado,  pdValorCalculado,
                               pdValorRecebido                     : double;
                               piIdRegraCalculo                    : longint;
                               piFlgDescFolha                      : integer;
                               pdValorBase1,     pdValorBase2,
                               pdValorBase3                        : double;
                               psDataInicio,     psDataFinal,
                               psFlgIntSitPart                     : string;
                               piSitRecebimento,
                               piParcela,
                               piIdLote                            : longint;
                               pcTipoPrevidencia                   : char;
                               piFlgCalcReserva,
                               piFlgDevolucao,   piFlgConcessao,
                               piFlgEvento                         : integer;
                               psFolhaOrigem                       : string = '';
                               piIdMovBenef : Integer = -1 ) : longint; // CAMILLE - 13.07.2004

// *****************************************************************************
// Função INSERETMPDESC   insere um registro na TMPDESC  com os dados
//                               passados como parâmetro
// Retorno    : NumRecebimento se nao houve erro ou -1, caso tenha ocorrido erro
// *****************************************************************************
function InsereTMPDESC ( qryAux                              : TwwQuery;
                         psCODALTERADOR, psCODCENTROCUSTOC, psCODCENTROCUSTOD,
                         psCODCENTRORESPON, psCODDOCUMENTOEFET, psCODDOCUMENTOPREV,
                         psCODPORTFORMA, psCODPROVDESC, psCODSUBCONTA,
                         psCODTIPDOC, psCODTIPRECDES, psCOMPLDOCUMENTO,
                         psDATACOBRANCA, psDATARECEBIMENTO, psDATAREFERENCIA,
                         psDESCRICAO, psEXERCICIO, psFLGALTERADOR,
                         psFLGATRASODEVOL, psFLGDESCFOLHA, psFLGDESCONTO,
                         psFLGEXISTEHST,
                         psFLGINTEVENTO, psFLGTIPODESC, psIDDESCONTO,
                         psIDEMPCOBRANCA, psIDEMPRESA, psIDEMPRESAPROP,
                         psIDFAVORECIDO, psIDFUNDACAO, psIDLOTE,
                         psIDMODULO, psIDMOTIVO, psIDPESSJUR,
                         psIDPESSOA, psIDPLANOPREV, psIDPLANPREVCONTAB,
                         psIDPROVENTO, psIDTITULAR, psINSCRICAONUMERO,
                         psMATRICULA, psMESCOBRANCA, psMESREFERENCIA,
                         psNODOCUMENTO, psPERIODO, psPLACONTAC,
                         psPLACONTAD, psPLANO, psRECPAG,
                         psREFERENCIA, psSEQPROPOSTA, psSISTORIGEM,
                         psSITENVIO,  psTIPCODIGO, psUNIDNEGOC, psVALOR,
                         psVALORBASE1, psVALORBASE2, psVALORBASE3, psVALORINFO,
                         psVALORRECEBIDO : string; iNumRec : LongInt = -1
                       ) : boolean;

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
                             sDescPreparo,sAtrasoDevol,
                             sFlgVeioDoEvento : string;
                             bValorQry,
                             bParaCobranca : boolean;
                             var sMsgErro  : string;
                             var iIdLote   : integer;
                             sSalarioPart,
                             sIdSitPart,
                             sFlgIntEvento    : string;
                             bAbreQueryContrib,
                             bAtualizaTotalLote : boolean;
                             psAnoMesReferencia : string;
                             pbPrepararSoMes13  : boolean;
                             piIdEventoGerador                   : longint;
                             psDataInicioBenef, psDataFinalBenef : string;
                             piOrigem, piFglDtFinalPrevista      : word    // 0 - Outros ,
                                                                           // 1 - Suspensao de contribuicao

                              ) : boolean;

function PreparaContribuicaoASSISTIDO(piIdPessJur, piIdPlanoPrev,
                             piIdMotivo, piSitRecebimento : integer;
                             qryContrib,
                             qryAux     : TwwQuery;
                             sSQL,
                             sSQLRegra,
                             sWhereSQLRegra,
                             sAliasSQLRegra,
                             sSitFundacao,
                             sDescPreparo,sAtrasoDevol,
                             sFlgVeioDoEvento : string;
                             bValorQry,
                             bParaCobranca : boolean;
                             var sMsgErro  : string;
                             var iIdLote   : integer;
                             sSalarioPart,
                             sIdSitPart,
                             sFlgIntEvento    : string;
                             bAbreQueryContrib,
                             bAtualizaTotalLote : boolean;
                             psAnoMesReferencia : string;
                             pbPrepararSoMes13  : boolean;
                             piIdEventoGerador                   : longint;
                             psDataInicioBenef, psDataFinalBenef : string;
                             piOrigem, piFlgDtFinalPrevista      : word;   // piOrigem
                                                                           // 0 - Outros ,
                                                                           // 1 - Suspensao de contribuicao
                                                                           // 2 - Concessao de Beneficio
                                                                           // 3 - Renova
                                                                           // 4 - Encerramento
                                                                           // 5 - Desdobramento
                                                                           // 6 - Revisão
                                                                           // 7 - Migração de Planos

                             psDataInicioOriginal                : string; // apenas para Renovacao

                             piNumProcesso       : longint //leocbs - 29052002

                            ) : boolean;

function MontaSQLContribNOVA(piIdPessJur,       piIdPlanoPrev,     piIdPessoa,
                             piSeqProposta,     piIdContribuicao,  piIdMotivoContrib : integer;
                             sSitFundacao,      sMesReferencia,    sDataRef,
                             sValorFinal,       sInscricaoData,    sDataNasc,
                             sTipoCalculo,      sTabelaValor,      sCampoValor,
                             sSalarioPart,      sIdSitPart,
                             sDataInicioEvento, sDataFinalEvento         : string;
                             piOrigem                               : word;    // 0 - Outros ,
                                                                               // 1 - Suspensao de contribuicao
                                                                               // 2 - Concessao de Beneficio
                                                                               // 3 - Renova
                                                                               // 4 - Encerramento
                                                                               // 6 - Retroativo
                                                                               // 7 - Migração de Planos 
                             piNumProcesso : longint;   // leocbs  - 29052202
                             psAnoMesCobranca : string; // CAMILLE - 23.01.2003
                             piIdLote         : longint; // CAMILLE - 11.02.2003
                             pbUtilizaSalarioParametro : boolean = False; // CAMILLE - 26.11.2003
                             psDataInicioOriginal : String = '' { Augusto 31/01/2005 }
                              ) : string;

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
//              pMesCobranca   = mês que a contrib. está sendo cobrada
// Retorno    : True   = Pode cobrar contribuição (Periodicidade OK)
//              False  = Não pode cobrar contribuição
// *****************************************************************************
function TestaPeriodicidade(pQtdeMeses, pUltMesPreparo, pMesCobranca // CAMILLE - SERPROS - 24.09.1999 (Acerto Meses)
                            : string): boolean;


// Roina para preencher as opcoes das contribuicoes associadas de uma contribuicao
procedure  PreencheContribAssociada( iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta,
                                     iIdContribuicao : integer;
                                     var sAssoc1Op1, sAssoc2Op1, sAssoc3Op1,
                                         sAssoc1Op2, sAssoc2Op2, sAssoc3Op2,
                                         sAssoc1Op3, sAssoc2Op3, sAssoc3Op3 : string;
                                     qryAux : TwwQuery);
function MostraDetalhesContribuicao( iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : longInt;
                                     psTitulo,
                                     psNomeEvento,
                                     psFlgIntEvento,
                                     psBeneficioPretendido    : string;
                                     psDataRef, psDataFim     : string;
                                     qryAux                   : TwwQuery) : boolean;

function UsaRubricaSalMantido(qryAux : TwwQuery; iIdPessJur, iIdPlanoPrev : Integer):Boolean;


function VerificaExisteContribMesEvento(qryAux : TwwQuery; sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta, sdtEvento:string):Boolean;



function GravaTotalPatro(pIdLote, liExercicio, liPeriodo : integer;
                         sAnoMesReferencia, sAnoMesCobranca : string;
                         qryAux,  qryTotalPatro : TwwQuery): Boolean;

// *****************************************************************************
// Rotina     : GeraSalarioRetroativo
// Descricao  : Esta rotina insere na histrubsal, rubricas para uma determinada
//              situacao de uma data inicio até uma data final
// Parâmetros : piIdPessJur     : identificador da patrocinadora
//              piIdPlanoPrev   : identificado do plano
//              piIdPessoa      : identificador da pessoa
//              psFlgSitPart    : situação do participante na fundação
//                                (é utilizada para determinar qual rubrica
//                                será gerada)
//              psDataInicio    : data início para geração
//                                (no caso de evento pode ser a data inicio do evento)
//              psDataFinal     : data final para a geração
//                                (no caso de evento pode ser a data final do evento,
//                                se houver)
//              psValorProvento : valor do salario a gerar
//              qryAux          : query auxiliar
// *****************************************************************************
function GeraSalarioRetroativo( piIdPessJur, piIdPlanoPrev,
                                piIdPessoa : longint;
                                psFlgSitPart,
                                psDataInicio, psDataFinal,
                                psValorProvento  : string;
                                var sNovoSalario,
                                    sNovoSalarioAtivoMP : string;
                                var qryAux : TwwQuery;
                                var sMsgErro : string;
                                psFlgIntEvento : string;
                                pbAcertaSalario : boolean;
                                piOrigem  : Integer = -1  //  0 - Outros ,   { Augusto 18/11/2005 }
                                                          //  1 - Suspensao de contribuicao
                                                          //  2 - Concessao de Beneficio
                                                          //  3 - Renova
                                                          //  4 - Encerramento
                                                          //  5 - Desdobramento
                                                          //  6 - Revisão de beneficios
                                                          //  7 - Migração de Planos
                                                          //  9 - Requerimento      // Gleyber - 05/10/2006 - Pendência 23457
                                )  : boolean;

// *****************************************************************************
// Rotinas para Integração com o Financeira - BANCO

function PedeDadosEnvioBanco( var psDataCobranca : string;
                              var piCodPortForma : longint;
                                  cRecPag        : string ) : boolean;

function EnviaContribuicaoBANCO (qryContabil           : TwwQuery;
                                 qryDocumentos         : TwwQuery;
                                 qryEnvio              : TwwQuery;
                                 qryAux                : TwwQuery;
                                 sMes                  : string;
                                 sAnoMesReferencia     : string;
                                 sHistDeb              : string;
                                 sHistCre              : string;
                                 sDataBoleta           : string;
                                 piIdPessJur           : longint;
                                 piIdPlanoPrev         : longint;
                                 piIdPessoa            : longint;
                                 piIdContribuicao      : longint;
                                 piUltimaContrib       : longint;
                                 CtrlDocumento         : TCtrlDocumento; // CAMILLE - 08.10.2004
                                 psFlgPagador          : string;
                                 psFlgSitPart          : string;
                                 piCodPortForma        : longint;
                                 cRecPag               : char;
                                 dValorEnviar          : double;
                             var sMsgErro              : string;
                             var iCodLancCAPCAR        : longint;
                             var iPlnCodigo            : longint;
                                 psObservacao          : string = '' ) : real;


function GeraAlteradorBANCO ( CtrlDocumento                      : TCtrlDocumento; // CAMILLE - 08.10.2004
                              qryAux                             : TwwQuery;
                              qryContabil                        : TwwQuery;           // Gleyber - 30/11/2005 - Pendência 20738
                              qryDocumentos                      : TwwQuery;           // Gleyber - 30/11/2005 - Pendência 20738
                              piCodDocumento                     : longint;
                              piCodAlterador                     : longint;
                              rValor                             : double;
                              psDataVencimento                   : string;
                              sTipOper                           : string;
                              piIdPessJur                        : longint;
                              piIdPlanoPrev                      : longint;
                              piIdPessoa                         : longint;
                              piIdContribuicao                   : longint;
                              piUltimaContrib                    : longint;
                              var sMsgErro                       : string;
                              psFlgSitPart                       : string;             // Gleyber - 30/11/2005 - Pendência 20738
                              piNumRecebimento                   : longint;             // Gleyber - 30/11/2005 - Pendência 20738
                              psAnoMesReferencia                 : string) : boolean;  // Gleyber - 30/11/2005 - Pendência 20738


function EnviaAlteradorBANCO( CtrlDocumento                      : TCtrlDocumento; // CAMILLE - 08.10.2004
                              qryAlterador,qryAux,
                              qryContabil                        : TwwQuery;           // Gleyber - 30/11/2005 - Pendência 20738
                              qryDocumentos                      : TwwQuery;           // Gleyber - 30/11/2005 - Pendência 20738
                              psAnoMesReferencia                 : string;
                              psNumRecebimento                   : String;
                              piCodDocumento                     : longint; // CAMILLE - 08.10.2004
                              psDataHistorico                    : string;
                              psDataEspecifica                   : string;
                              psTipOper                          : string;
                              piIdPessJur                        : longint;
                              piIdPlanoPrev                      : longint;
                              piIdPessoa                         : longint;
                              piIdContribuicao                   : longint;
                              piUltimaContrib                    : longint;
                              psFlgPagador                       : string;
                              var sMsgErro                       : string;
                              psFlgSitPart                       : string) : boolean; // Gleyber - 30/11/2005 - Pendência 20738


function  BaixaContribCAR (   qryAux             : TwwQuery;
                              psAnoMesCobranca   : string;
                              psAnoMesReferencia : string;
                              piNumRecebimento   : longint;
                              piSitRecebimento   : integer;
                              piCodDocumentoPrev : longint;
                              piIdMotivo         : longint;
                              pdValorEsperado    : double;
                              var sMsgErro       : string;
                              psNomeContrib      : string = '') : boolean;

procedure FazerInsertContab( qryContabil           : TwwQuery;
                             sContaContabil,
                             sCentroCusto,
                             sDebCre, sTipoDC,
                             sNumDoc, sHist1,
                             sHist2,  sHist3,
                             sHist4,  sHist5       : string;
                             iUnidNegoc, iSubConta :integer;
                             rValorCorrente,
                             rValorMoeda           : real;
                             dDataDia              : TDateTime;
                             sTipCodigo            : string;
                             piIdPessJur,
                             piIdPlanoPrev         : longint);

procedure IncluiContabilidade( CtrlLancamento : TCtrlLancamento; // CAMILLE - 14.10.2004
                               qryContabil     : TWWQuery;
                           var iPlnCodigo      : Integer;
                           var sMsgErro        : string);

Procedure AlimentaQryDocumentos(QryDocumentos      : TWWQuery;
                             Coddocumento,
                             NumLancto,
                             plano,
                             unidnegoc             : Integer;
                             placonta,
                             codcentrorespon,
                             codtiprecdes          : String;
                             valor                 : real;
                             piIdPessJur,
                             piIdPlanoPrev         : longint;
                             pidcontribuicao       : Integer;
                             pFlgDevolucao         : longint;
                             piIdPlanPrevContab     : Integer;
                             piIdPessjurcedido      : longint);

Procedure BuscaContabContrib(iIdPatroAtu,idPlanoPrev,idDesconto,iParticipante:Integer;
           var    sContaD,sContaC,sCodCCustoC,sCodCCustoD,sCodTipRecDes,sCodCRespon : String;
           var    iUnidNegoc : Integer);

Procedure BuscaContabPatro(iIdPatroAtu: Integer; var icodPortFormaPatro: Integer;
             var sTipCodPatro,sCodCResponPatro : String; var iUnidNegocPatro : Integer);

function  DescarregaDocumentos(CtrlDocumento         : TCtrlDocumento; // CAMILLE - 08.10.2004
                               qryDocumentos         : TwwQuery;
                               iIdPatroAtu,
                               PlnCodigo             : integer;
                               sCodTipDoc,
                               sCodPortForma,
                               sMes,
                               sAno                  : string;
                               valor                 : real;
                               dtRecebimento         : TdateTime;
                               sFlgPagador           : String;
                               pcTipoFolha           : char;
                               const sIdPessoa       : String = '';
                               const sNumRecebimento : String = '';
                               const cRecPag         : string = 'R';
                               const psObservacao    : string = '' ;
                               const sCodCentroCusto : String = '';
                               const bUpdateDoc      : Boolean = True   // André Pontes - 04/10/2007 - pendência 25044
                              ): longint; // P = Patro, B = Beneficios

function  BuscaRamoForCli(psSitFundacao : string; cRecPag : char ) : longint ;

//função que é alimentada com o mês de fererência
//que então lê da table reajsalpatro
//para voltar o valor passado reajustado pela regra
//cadastrada, se for o caso
function ReajustaSalPatro( qryAux           : TwwQuery ;
                           sMesAReajustar,
                           sIdPessjur,
                           sIdPlanoprev,
                           sIdPessoa,
                           sDataRef,
                           sDataEvento      : string ;
                          var sValorSal     : string;
                           psFlgIntSitPart  : string;
                           pbRetroativo     : boolean = False;  // CAMILLE - 08.07.2004
                           pbExecutaInicio  : Boolean = False ) : Boolean; // Gleyber - 25/07/2006 - Pendência 22731


function AgrupaBoletasBANCO( CtrlDocumento       : TCtrlDocumento; // CAMILLE - 08.10.2004
                             qry                 : TwwQuery;
                             qryAux              : TwwQuery;
                             lstLotesEnviados    : string;
                             lstNumRecebEnviados : string) : boolean;

// CAMILLE - 22.06.2004
function InsereMensagemCnabVerso( qry            : TwwQuery;
                                  var piIdMsgCnab: longint;
                                  piCodDocumento : longint;
                                  piCodGrupoCnab : longint;
                                  psMensagem1    : string = '';
                                  psMensagem2    : string = '';
                                  psMensagem3    : string = '';
                                  psMensagem4    : string = '';
                                  psMensagem5    : string = '';
                                  psMensagem6    : string = '';
                                  psMensagem7    : string = '';
                                  psMensagem8    : string = '';
                                  psMensagem9    : string = '';
                                  psMensagem10   : string = '';
                                  psMensagem11   : string = '';
                                  psMensagem12   : string = '';
                                  psMensagem13   : string = '';
                                  psMensagem14   : string = '';
                                  psMensagem15   : string = '';
                                  psMensagem16   : string = '';
                                  psMensagem17   : string = '';
                                  psMensagem18   : string = '';
                                  psMensagem19   : string = '';
                                  psMensagem20   : string = '' ) : boolean;

function EstornaContribuicaoBANCO (CtrlDocumento      : TCtrlDocumento; // CAMILLE - 08.10.2004
                                   CtrlLancamento     : TCtrlLancamento; // CAMILLE - 14.10.2004
                                   iCodDocumento      : longInt;
                                   qry                : TwwQuery;
                                   qryAux             : TwwQuery;
                                   psAnoMesReferencia : string;
                               var sMsgErro           : string) : boolean;

function EstornaPlanilhaContabil ( CtrlLancamento     : TCtrlLancamento;
                                   iPlnCodigo         : longInt;
                                   qryAux             : TwwQuery;
                               var sMsgErro           : string) : boolean;

function BuscaDescCobranca(piIdContribuicao, piIdPlanoPrev:Integer; qryAux:Twwquery):string;  // rosana - serpros - 02/09/99

function VerificaContribuicoesPendentes ( qryAux           : TwwQuery;
                                          piIdPessJur      : longint;
                                          piFlgDescFolha   : integer;
                                          pcOperacao,
                                          pcFlgPagador     : char; // P - Preparo, E - Envio
                                          psAnoMesCobranca,
                                          psListaSituacoes : string ) : longint;


//P.RAMOS-18.10.2005-PEND.20440-INIBIDO POIS ESTA ROTINA NÃO SERÁ MAIS USADA
// Verifica se a contribuicao foi totalmente acertada
//function VerificaContrib(sIdPlanoprev,sIdPessoa,sIdPessjur,sSeqProposta,sMesReferencia : string;
//                            qryAux : TwwQuery; var sValAcumRec : extended) : boolean;
//P.RAMOS-18.10.2005-PEND.20440-INIBIDO POIS ESTA ROTINA NÃO SERÁ MAIS USADA-FIM


function VerificaLimiteContribPATRO(piIdPessJur : longint;
                                    psAnoMesCobranca,
                                    psAnoMesCobranca13 : string;
                                    bReduzContrib      : boolean;
                                    psTipoContrib      : string;
                                    var sMsgErro : string) : boolean;

function CalculaRedutorContribPatro( pdTotalDaFolha,
                                     pdPercentual,
                                     pdTotalEsperado,
                                     pdTotalEsperadoNaoRisco : double
                                    ) : double;

function ReduzContribuicaoPatro    ( qryAux                  : TwwQuery;
                                     piIdPessJur,
                                     piIdPlanoPrev           : longint;
                                     psAnoMesCobranca,
                                     psAnoMesReferencia      : string;
                                     pdFatorRedutor          : double
                                    ) : boolean;

function CobraContribContingencia  ( qryContrib, qryAux      : TwwQuery;
                                     piIdPessJur,
                                     piIdPlanoPrev           : longint;
                                     psAnoMesCobranca,
                                     psAnoMesReferencia      : string;
                                     pdTotalDaFolha,
                                     pdTotalEsperado         : double;
                                     psTipoContrib           : string;
                                     var sMsgErro            : string
                                    ) : boolean;
// CAMILLE - REFER - 10.03.2001                                    
function CalculaUltimaContrib13 (piIdPessJur, piIdPlanoPrev, piIdPessoa,
                                 piSeqProposta,   piNumeroProcesso, piIdEvento,
                                 piIdMotivo,      piFlgDescFolha,
                                 piFlgConcessao,  piFlgEvento,
                                 piIdLote       : longint;
                                 psAnoMesTransicao,
                                 psAnoMesCobranca,
                                 psFlgIntSitPartAnterior,
                                 psFlgIntSitPartPosterior,
                                 psIdSitPartAnterior,
                                 psIdSitPartPosterior,
                                 psInscricaoData,
                                 psDataNasc                      : string;
                                 pbEnviaContribuicao : boolean ) : boolean;

// CGUEDES - 11/09/2002
Function BuscaFlgProvisorio(qry: TwwQuery; piNumProcesso:Integer): String;
procedure VerificaContabMantidoNoEnvio(qryaux : TwwQuery ;var bContabilizaNoEnvio : boolean ;piIdPlanoPrev : Integer);
function CalculaContribuicaoACobrarNoMes ( qryAux               : TwwQuery;
                                           piIdPessJur          : longint;
                                           piIdPlanoPrev        : longint;
                                           piIdPessoa           : longint;
                                           piSeqProposta        : longint;
                                           piIdContribuicao     : longint;
                                           psAnoMesCalculo      : string;
                                           psFlgIntEvento       : string;
                                           psDataInicioContrib  : string;
                                           psDataFinalContrib   : string;
                                           piIdMotivo           : longint;
                                           piOrigem             : word;   // 0 - Outros ,
                                                                          // 1 - Suspensao de contribuicao
                                                                          // 2 - Concessao de Beneficio
                                                                          // 3 - Renova
                                           piFlgDtFinalPrevista : word;
                                           piNumProcesso        : longint;
                                           var sMsgErro         : string;
                                           var iIdLote          : integer
                            ) : double;

// CAMILLE - 02.07.2004
function VerificaDocumentoAgrupado ( qry : TwwQuery;
                                     piCodDocumento : longint ) : boolean;

// CAMILLE - 20.07.2004                                     
function BaixaDocumentoNAOPAGO ( CtrlDocumento      : TCtrlDocumento;
                                 qryAux             : TwwQuery;
                                 psAnoMesReferencia : string;
                                 piCodDocumentoPrev : longint;
                                 piIdPlanoPrev      : longint;
                                 psNomeContrib      : string;
                                 var sMsgErro       : string           ) : boolean;

// CAMILLE - 08.10.2004
// ROTINA TEMPORARIA PARA SUBSTITUICAO DOS METODOS DA UDOCUMENTO PARA
// UCTRLDOCUMENTO. A UCtrlDocumento não tem o metodo Informa_planilha
// assim resolvemos fazer um update pelo AdmPREV para, futuramente, substituir
// a rotina
function AdmPREV_Informa_Planilha( qry            : TwwQuery;
                                   piPlnCodigo    : longint;
                                   piCodDocumento : longint;
                                   piNumLancto    : longint ) : boolean;

implementation

uses DAprev,UDataBase,USistema,UAdmPREV, UParticipante, DBaseDados, UFuncoesUteis,
     FMostraAux, UMensErro , UIntegraBack, UMovReserva,
     FInformaSalRetroEv, FVlrDtDiverg, USincronismo, FAguarde, DAPrevIntegraBack,
     FCadRubricaManut, UBeneficio, FParcelamento;

// CGUEDES - 11/09/2002
Function BuscaFlgProvisorio(qry: TwwQuery; piNumProcesso:Integer): String;
Begin
  qry.Sql.Clear;
  qry.Sql.Add(' SELECT NVL(BF.FLGPROVISORIO,0) FLGPROVISORIO ' +
              ' FROM BENEFBFCIARIO BF, BENEFPLANPREV BPP '+
              ' WHERE BF.NUMEROPROCESSO =   ' + IntToStr(piNumProcesso) +
              '   AND BPP.FLGREFERENCIA = 0 ' +
              '   AND BPP.IDBENEFICIO = BF.IDBENEFICIO ' +
              '   AND BPP.IDPLANOPREV = BF.IDPLANOPREV ');
  qry.Open;
  Result := IntToStr(qry.FieldByName('FLGPROVISORIO').AsInteger);
  qry.Close;
End;

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
                               pIdPessJur,pIdPlanoPrev,pIdContrib, piIdContribAnt : integer; pIdPessoa : Integer = 0 ) : boolean;
var
   sValorAchado : string;
   varfields, varcontprev : variant;
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


       //leofuncef - 11082004
       //caso o parâmetro para busca individual esteja marcadom e
       //o campo para procura seja o IDPLANPREVCONTAB, procurar
       //em CONTRIBPREVPARTP
       if (Trim(sNomeCampo) = 'IDPLANPREVCONTAB')
          and (prmFLGINFCONTABINDIV )
          and (pIdPessoa > 0 ) then
       begin

          qryContribPrevPartp.Close;
          qryContribPrevPartp.parambyname('IDPESSJUR').AsInteger := pIdPessjur;
          qryContribPrevPartp.parambyname('IDPLANOPREV').AsInteger := pIdPlanoprev;
          qryContribPrevPartp.parambyname('IDCONTRIBUICAO').AsInteger := pIdContrib;
          qryContribPrevPartp.parambyname('IDPESSOA').AsInteger := pIdPessoa;
          qryContribPrevPartp.Open;


          if not qryContribPrevPartp.isempty then
             if qryContribPrevPartp.FieldByName(sNomeCampo).AsString <> ''
             then sValorAchado := qryContribPrevPartp.FieldByName(sNomeCampo).AsString;


          if sValorAchado <> ''
          then begin
             if cTipo = 'S'
             then sSQL := sSQL +', '''+sValorAchado+''''
             else sSQL := sSQL +', '+sValorAchado;
             sValorEncontrado := sValorAchado;
             Exit;
          end;
       end;
       //leofuncef  - 11082004 - fim



       //procurar em CONTPLANPATRO
       try

          //leocbs - 3101 - inicio
          if qryContPlanPatro.IsEmpty then
          begin
             qryContPlanPatro.Close;

             qryContPlanPatro.Open;
          end;

          if (qryContPlanPatro.FieldByName('IDPESSJUR').AsInteger <> pIdPessJur ) or
             (qryContPlanPatro.FieldByName('IDPLANOPREV').AsInteger <> pIdPlanoPrev ) or
             (qryContPlanPatro.FieldByName('IDCONTRIBUICAO').AsInteger <> pIdContrib )
          then begin
             varFields := VarArrayCreate([0,2],varVariant);
             varFields[0] := IntToStr(pIdPessjur);
             varFields[1] := IntToStr(pIdPlanoPrev);
             varFields[2] := IntToStr(pIdContrib);

            {Para posicinar no registro que estava}
             qryContPlanPatro.Locate('IDPESSJUR;IDPLANOPREV;IDCONTRIBUICAO',varFields,[loCaseInsensitive, loPartialKey]);
          end;
          //leocbs - 3101 - fim

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

          //leocbs - 3101 - inicio
          if qryContPREV.IsEmpty then
          begin
             qryContPREV.Close;
             qryContPREV.Open;
          end;

          if  (qryContPREV.FieldByName('IDPLANOPREV').AsInteger <> pIdPlanoPrev ) or
             (qryContPREV.FieldByName('IDCONTRIBUICAO').AsInteger <> pIdContrib )
          then begin
             varcontprev := VarArrayCreate([0,1],varVariant);
             varcontprev[0] := IntToStr(pIdPlanoPrev);
             varcontprev[1] := IntToStr(pIdContrib);

            {Para posicinar no registro que estava}
             qryContPREV.Locate('IDPLANOPREV;IDCONTRIBUICAO',varcontprev,[loCaseInsensitive, loPartialKey]);
          end;
          //leocbs - 3101 - fim

          if qryContPREV.FieldByName(sNomeCampo).AsString <> ''
          then sValorAchado := qryContPREV.FieldByName(sNomeCampo).AsString;

       except
       end;

       // Gleyber - 06/05/2005 - Pendência 18536 - Início
       If (sValorAchado = '') And (Trim(sNomeCampo) = 'CODPORTFORMA')
        Then Begin
          qryContribPrevPartp.Close;
          qryContribPrevPartp.parambyname('IDPESSJUR').AsInteger := pIdPessjur;
          qryContribPrevPartp.parambyname('IDPLANOPREV').AsInteger := pIdPlanoprev;
          qryContribPrevPartp.parambyname('IDCONTRIBUICAO').AsInteger := pIdContrib;
          qryContribPrevPartp.parambyname('IDPESSOA').AsInteger := pIdPessoa;
          qryContribPrevPartp.Open;


          If (Not qryContribPrevPartp.IsEmpty) And
             (Trim(qryContribPrevPartp.FieldByName('CODPORTFORMA').AsString) <> '')
           Then sValorAchado := qryContribPrevPartp.FieldByName('CODPORTFORMA').AsString
           Else sValorAchado := '';
        End;
       // Gleyber - 06/05/2005 - Pendência 18536 - Fim

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
    sSQL     := sSQL+', NULL ';
    sBrancos := sBrancos + sNomeCampo+',';
    sValorEncontrado := sValorAchado;
    Result   := False;
  end;
end; //BuscaInfFinancContab

function GeraLOTE(idPatro : integer; bGravaLote : boolean; sMesReferencia,sTipo,sDescricao,sAtrasoDevol,
                  sFlgPreparado,sFlgIdaTmp, sFlgVoltaTmp, sFlgIdaInterface,sFlgVoltaInterface,
                  sDataPreparo,sDataIdaTmp,sDataVoltaTmp,sDataIdaInterface,sDATAVOLTAINTERFA : string ) : integer;
var iIdLote    : integer;
    sSQLValues : string;
begin
   Result := -1;
   iIdLote := LeUltRegistro(dtmAPrev.qry,'CTRLINTERFACE');
   if not bGravaLote
   then begin
      Result := iIdLote;
      Exit;
   end;

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

   if sDATAVOLTAINTERFA = ''
   then sDATAVOLTAINTERFA := ' NULL'
   else sDATAVOLTAINTERFA := ' TO_DATE('''+sDATAVOLTAINTERFA+''',''dd/mm/yyyy'') ';


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
   sSQLValues := sSQLValues+', '+sDATAVOLTAINTERFA;

   //leocm - 27052002 - inicio
   //caso o lote seja para folha de benefício
   //marcar como flgconcessão
   if uppercase(sTipo) = 'B'  then
      sSQLValues := sSQLValues+', 1 '
   else
      sSQLValues := sSQLValues+', 0 ';
   //leocm - 27052002 - fim

   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' INSERT INTO CTRLINTERFACE (IDLOTE,IDPESSOA,MESREFERENCIA,TIPO,DESCRICAO, FLGATRASODEVOL,'+
              '                            FLGPREPARADO,FLGIDATMP,FLGVOLTATMP, '+
              '                            FLGIDAINTERFACE,FLGVOLTAINTERFACE,  '+
              '                            DATAPREPARO,DATAIDATMP,DATAVOLTATMP, '+
              '                            DATAIDAINTERFACE,DATAVOLTAINTERFA, FLGCONCESSAO) '+
              ' VALUES('+sSQLValues+')');

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
var  sUltMesPreparo,
     sAno13,
     sSQL : string;
begin
   Result := False;

   if Copy(psMesReferencia,6,2) = '13'
   then begin
      Result := True;
      Exit;
   end
   else begin
      sUltMesPreparo := psMesReferencia;
      sAno13         := ' ULTANO13 ';
   end;

   if piIdPessJur = piIdPessoa // contribuicao da patrocinadora
   then begin
      sSQL :=  ' UPDATE CONTRIBPREVPATRO SET ULTMESPREPARO = '''+sUltMesPreparo+''', '+
               '                             ULTANO13      = '''+sAno13+''', '+  // Gleyber - 17/12/2002
               ' WHERE  IDPESSOA       = '+IntToStr(piIdPessJur)+'  AND '+
               '        IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
               '        IDPLANOPREV    = '+IntToStr(piIdPlanoPrev);
   end
   else begin
     sSQL := ' UPDATE CONTRIBPREVPARTP SET ULTMESPREPARO = '''+sUltMesPreparo+''', '+
             '                             ULTANO13      = '+sAno13+
             ' WHERE  (IDPESSJUR      = '+IntToStr(piIdPessJur)+') AND '+
             '        (IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+') AND '+
             '        (IDPESSOA       = '+IntToStr(piIdPessoa)+') AND '+
             '        (SEQPROPOSTA    = '+IntToStr(piSeqProposta)+') AND '+
             '        (IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+')';
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

function LerContribAEnviar(piIdLote, piSitRecebimento : integer;
                           psAnoMesCobranca           : string;
                           var qry                    : TwwQuery;
                           piCobEnviar                : Integer) : boolean; // Gleyber - 07/07/2003
var
   sSitRecebimento,
   sMes,
   sSQL1,sSQL2,
   sSQL, sFiltro,
   sSinal   : string;
begin
   Result := False;
{
   // Gleyber - 07/07/2003 - Início
   Case piCobEnviar Of
    0 : sSinal := '<='; // Todas
    1 : sSinal := '=';  // do Mês
    2 : sSinal := '<';  // Apenas Atrasadas
    3 : sSinal := '<='; // Apenas Devoluções
   End;
   // Gleyber - 07/07/2003 - Fim
}
   { Inicio Augusto 14/07/2003 }
   sFiltro := '';
   // Gleyber - Pendência 19504 - 27/06/2005 - Início
   Case piCobEnviar Of

    { Inicio Gleyber 18/07/2005 - Pendencia 19723 }
    0 : Begin                  { Todas (MESCOBRANCA = parametro e MESREFERENCIA <= MESCOBRANCA}
          sSinal := '=';
          //sFiltro := ' HST.MESREFERENCIA <= HST.MESCOBRANCA AND '
        End;
    { Fim Gleyber 18/07/2005 }
    1 : Begin                  { Apenas do Mes (MESCOBRANCA = parametro  e MESREFERENCIA = MESCOBRANCA}
          sSinal := '=';
          sFiltro := ' HST.MESREFERENCIA = HST.MESCOBRANCA AND '
        End;
    2 : Begin                  { Apenas Atrasadas (MESCOBRANCA = parametro  e MESREFERENCIA <> MESCOBRANCA}
          sSinal := '=';
          sFiltro := ' HST.MESREFERENCIA <> HST.MESCOBRANCA AND HST.FLGDEVOLUCAO = 0 AND '
        End;
    3 : Begin                  { Apenas Devoluções (MESCOBRANCA = parametro  e MESREFERENCIA <= MESCOBRANCA}
          sSinal := '=';
          sFiltro := ' HST.MESREFERENCIA <> HST.MESCOBRANCA AND HST.FLGDEVOLUCAO = 1 AND '
        End;
   End;
   // Gleyber - 07/07/2003 - Fim
   // Gleyber - Pendência 19504 - 27/06/2005 - Fim 
   sMes := Copy(psAnoMesCobranca,6,2);
   // Preencher sSitRecebimento
   if piSitRecebimento < 0
   // ANDRE DB2 SITRECEBIMENTO STRING
   then sSitRecebimento := '''0'','+' ''8''' // contribuicao nao enviada
   else sSitRecebimento := IntToStr(piSitRecebimento);
   // Ler do Histórico de contribuicoes todas as contribuicoes
   // relativas ao mes de cobranca informados que nao tenham sido enviadas
   // (sitrecebimento = 0 ou parametrizado)
   sSQL1 := '';
   sSQL2 := '';
   sSQL  := '';
   sSQL1 := ' SELECT HST.MESREFERENCIA, HST.NUMRECEBIMENTO,    HST.MESCOBRANCA,           '+#13+
           '        HST.IDMOTIVO,       HST.VALORESPERADO,      HST.IDREGRAALIMRESER,     '+#13+
           '        HST.IDREGRACALCULO, HST.DATARECEBIMENTO,    HST.VALORRECEBIDO,        '+#13+
           '        HST.QUANTCOTAS,     HST.DATAPREVISAORECE,                             '+#13+   // CAMILLE - 02.10.2003
           '        HST.CODDOCUMENTOPREV,                                                 '+#13+
           '        HST.FLGCALCRESERVA, HST.VALORCALCULADO,     HST.VALOROP1,             '+#13+
           '        HST.VALOROP2,       HST.VALOROP3,           HST.FLGDESCFOLHA,         '+#13+
           '        HST.FATOR,              HST.IDCONTRIBUICAO,                           '+#13+
           '        HST.IDPESSJUR,      HST.IDPLANOPREV,        HST.IDPESSOA,             '+#13+
           '        HST.SEQPROPOSTA,    HST.DATAINICIO,         HST.DATAFINAL,            '+#13+
           '        HST.FLGSITFUNDACAO,     EL.MATRICULA,                                 '+#13+
           '        CP.IDREGRACOBRANCA, CP.FLGPAGADOR,                                    '+#13+
           '        PP.INSCRICAONUMERO,     PT.IDFUNDACAO,                                '+#13+
           '        CPP.FLGDESCFOLHA,   C.NOME AS NOMECONTRIB,  CPP.DIAVENCIMENTO,        '+#13+
           '        CPP.PLANO,          CPP.PLACONTAC,          CPP.PLACONTAD,            '+#13+
           '        CPP.PLACONTADBANCO, CPP.PLACONTADBANCO13,                             '+#13+
           '        CPP.CODCENTROCUSTOC,  CPP.CODCENTROCUSTOD,    CPP.IDEMPRESA,          '+#13+
           '        CPP.UNIDNEGOC,        CPP.IDEMPRESAPROP,      CPP.CODCENTRORESPON,    '+#13+
           '        CPP.CODSUBCONTA,      CPP.RECPAG,             CPP.CODTIPRECDES,       '+#13+
           '        CPP.RECPAGDEVOL,      CPP.CODTIPDESEMBDEVOL,                          '+#13+
           '        CPP.TIPCODIGO,        CPP.CODTIPDOC,                                  '+#13+
           '        DECODE(SUBSTR(HST.MESREFERENCIA,6,2), ''13'', CPP.CODPORTFORMA13, CPP.CODPORTFORMA) AS CODPORTFORMA, '+#13+
           '        CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONTAD13,        '+#13+
           '        CPP.CODCENTROCUSTOC13, CPP.IDEMPRESA13,       CPP.CODCENTROCUSTOD13,  '+#13+
           '        CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,  '+#13+
           '        CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPRECDES13,     '+#13+
           '        CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORTFORMA13,     '+#13+
           '        CPP.CODTIPDESEMBCAR,  '+
           '        NVL(CPP.IDPLANPREVCONTAB,CPP.IDPLANOPREV) IDPLANPREVCONTAB,           '+#13+ //leofuncef - 12122005
           '        PP.SALMANTIDO,        HST.FLGDEVOLUCAO,       CPP.DATAINICIO,         '+#13+
           '        HST.FLGINTEVENTO  , PLP.FLGRECECONTPATRO                              '+#13+ //LEOCBS - 0604 - ACRECENTEI - FLGRECECONTPATRO
           //LEOCBS - 2509 - NOVOS CAMPOS PARA O DESFAZER
           '        , PP.MESULTREAJSAL, NVL(PP.ULTSALMANTREAJ,0) AS ULTSALMANTREAJ,       '+#13+
           '        NVL(PP.ULTSALAUXREAJ,0) AS ULTSALAUXREAJ, NVL(PP.ULTSALREAJUSTE,0) AS ULTSALREAJUSTE '+#13+
           //LEOCM - 2509 - FIM
           '        , NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR ) IDPESSJURCEDIDO              '+#13+ //LEOFUNCEF - 12122005
           ' FROM   CONTRIBUICAO C,     CONTPREV CP,      PATRO PT,                       '+#13+
           '        ELEGPATRO EL,       PARTPREVPLAN PP,  CONTRIBPREVPARTP CPP,           '+#13+
           '        HSTCONTRIBPREV HST, CTRLINTERFACE INT,                                '+#13+
           '        PLANPREVPATRO PLP,  CONTPLANPATRO  CPT                                '+#13+ // Gleyber - Pendência 21570 - 21/03/2006
           ' WHERE  HST.IDLOTE         = '+IntToStr(piIdLote)+' AND                       '+#13+
           '        HST.IDPESSOA       =  HST.IDPESSOA AND                                '+#13+ //leocbs - 3001 - performance
           '        HST.SITRECEBIMENTO IN ('+sSitRecebimento+') AND                       '+#13+
           '        HST.MESCOBRANCA    '+sSinal+'  '''+psAnoMesCobranca+''' AND           '+#13+ // Gleyber - 07/07/2003
           '        NVL(HST.VALORRECEBIDO,0) = 0 AND                                      '+#13+ // Gleyber - Pendência 19317 - 01/09/2005
           '        NVL(HST.CODDOCUMENTOPREV,0) = 0 AND                                   '+#13+ // Gleyber - Pendência 19317 - 01/09/2005
           '        CPT.IDPLANOPREV    = HST.IDPLANOPREV AND                              '+#13+ // Gleyber - Pendência 19317 - 01/09/2005
           '        CPT.IDPESSJUR      = HST.IDPESSJUR AND                                '+#13+ // Gleyber - Pendência 19317 - 01/09/2005
           '        CPT.IDCONTRIBUICAO = HST.IDCONTRIBUICAO AND                           '+#13+ // Gleyber - Pendência 19317 - 01/09/2005
           // Gleyber - Pendência 25145 - 08/05/2007
           //'        ((NVL(CPT.FLGTPVLR,''V'') <> ''B'' AND NVL(HST.VALORESPERADO,0) > 0)  '+#13+ // Gleyber - Pendência 21570 - 12/03/2006
           //' OR (CPT.FLGTPVLR = ''B'' AND NVL(HST.VALORESPERADO,0) = 0 )) AND             '+#13; // Gleyber - Pendência 21570 - 21/03/2006
           '         (                                                                        '+#13+
           '          (NVL(CPT.FLGTPVLR,''V'') <> ''B'' AND NVL(HST.VALORESPERADO,0) > 0) OR  '+#13+
           '          (                                                                       '+#13+
           '           CPT.FLGTPVLR = ''B'' AND                                               '+#13+
           '                                 (                                                '+#13+
           '                                  (HST.MESCOBRANCA =  HST.MESREFERENCIA AND NVL(HST.VALORESPERADO,0) = 0 ) OR '+#13+
           '                                  (HST.MESCOBRANCA <> HST.MESREFERENCIA AND NVL(HST.VALORESPERADO,0) > 0 )    '+#13+
           '                                 )                                                '+#13+
           '          )                                                                       '+#13+
           '         )  AND                                                                   '+#13;
           // Gleyber - Pendência 25145 - 08/05/2007
           // Gleyber - Pendência 19504 - 27/06/2005 - Início
           sSQL1 := sSQL1 + sFiltro+#13 ;
           // Gleyber - Pendência 19504 - 27/06/2005 - Fim

// CAMILLE - 03.12.2003
// FILTRAR APENAS PELO LOTE POIS O TRATAMENTO DO QUE DEVE SER ENVIADO JÁ FOI FEITO
// PARA FILTRAR OS LOTES.
//           sSQL1 := sSQL1 + sFiltro + { Augusto 14/07/2003 }
    sSQL1 := sSQL1 +
           '        INT.IDLOTE         = HST.IDLOTE      AND    '+#13+
           '        CPP.IDPESSJUR      = HST.IDPESSJUR   AND    '+#13+
           '        CPP.IDPLANOPREV    = HST.IDPLANOPREV AND    '+#13+
           '        CPP.IDPESSOA       = HST.IDPESSOA AND       '+#13+
           '        CPP.SEQPROPOSTA    = HST.SEQPROPOSTA AND    '+#13+
           '        CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO AND '+#13+
           '        PP.IDPESSJUR       = CPP.IDPESSJUR AND      '+#13+
           '        PP.IDPLANOPREV     = CPP.IDPLANOPREV AND    '+#13+
           '        PP.IDPESSOA        = CPP.IDPESSOA AND       '+#13+
           '        PP.SEQPROPOSTA     = CPP.SEQPROPOSTA AND    '+#13+
           '        PT.IDPESSOA        = PP.IDPESSJUR AND       '+#13+
           '        EL.IDPESSJUR       = PP.IDPESSJUR AND       '+#13+
           '        EL.IDPESSOA        = PP.IDPESSOA AND        '+#13+
           '        CP.IDPLANOPREV     = CPP.IDPLANOPREV AND    '+#13+
           '        CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO AND '+#13+
           '        C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO  AND '+#13+
           '        PLP.IDPESSJUR      = HST.IDPESSJUR AND      '+#13+
           '        PLP.IDPLANOPREV    = HST.IDPLANOPREV        '+#13;

   sSQL2 := ' SELECT HST.MESREFERENCIA,    HST.NUMRECEBIMENTO,     HST.MESCOBRANCA,        '+#13+
           '         HST.IDMOTIVO,         HST.VALORESPERADO,      HST.IDREGRAALIMRESER,   '+#13+
           '         HST.IDREGRACALCULO,   HST.DATARECEBIMENTO,    HST.VALORRECEBIDO,      '+#13+
           '         HST.QUANTCOTAS,       HST.DATAPREVISAORECE,                           '+#13+ // CAMILLE - 02.10.2003
           '         HST.CODDOCUMENTOPREV,                                                 '+#13+
           '         HST.FLGCALCRESERVA,   HST.VALORCALCULADO,     HST.VALOROP1,           '+#13+
           '         HST.VALOROP2,         HST.VALOROP3,           HST.FLGDESCFOLHA,       '+#13+
           '         HST.FATOR,              HST.IDCONTRIBUICAO,                           '+#13+
           '         HST.IDPESSJUR,        HST.IDPLANOPREV,        HST.IDPESSOA,           '+#13+
           '         HST.SEQPROPOSTA,                                                      '+#13+
           '         HST.DATAINICIO,       HST.DATAFINAL,                                  '+#13+
           '         HST.FLGSITFUNDACAO,   ''0'' AS MATRICULA,                             '+#13+
           '         CP.IDREGRACOBRANCA,   CP.FLGPAGADOR,                                  '+#13+
           '         0 AS  INSCRICAONUMERO,  PT.IDFUNDACAO,                                '+#13+
           '         0 AS FLGDESCFOLHA,    C.NOME AS NOMECONTRIB,  CPP.DIAVENCIMENTO,      '+#13+
           '         CPL.PLANO,            CPL.PLACONTAC,          CPL.PLACONTAD,          '+#13+
           '         CPL.PLACONTADBANCO, CPL.PLACONTADBANCO13,                             '+#13+
           '         CPL.CODCENTROCUSTOC,  CPL.CODCENTROCUSTOD,    CPL.IDEMPRESA,          '+#13+
           '         CPL.UNIDNEGOC,        CPL.IDEMPRESAPROP,      CPL.CODCENTRORESPON,    '+#13+
           '         CPL.CODSUBCONTA,      CPL.RECPAG,             CPL.CODTIPRECDES,       '+#13+
           '         ''P'' as RECPAGDEVOL, ''0'' AS CODTIPDESEMBDEVOL,                     '+#13+
           '         CPL.TIPCODIGO,        CPL.CODTIPDOC,                                  '+#13+
           '        DECODE(SUBSTR(HST.MESREFERENCIA,6,2), ''13'', CPL.CODPORTFORMA13, CPL.CODPORTFORMA) AS CODPORTFORMA, '+#13+ // CAMILLE - 02.10.2003
           '         CPL.PLANO13,          CPL.PLACONTAC13,        CPL.PLACONTAD13,        '+#13+
           '         CPL.CODCENTROCUSTOC13, CPL.IDEMPRESA13,       CPL.CODCENTROCUSTOD13,  '+#13+
           '         CPL.UNIDNEGOC13,      CPL.IDEMPRESAPROP13,    CPL.CODCENTRORESPON13,  '+#13+
           '         CPL.CODSUBCONTA13,    CPL.RECPAG13,           CPL.CODTIPRECDES13,     '+#13+
           '         CPL.TIPCODIGO13,      CPL.CODTIPDOC13,        CPL.CODPORTFORMA13,     '+#13+
           '         ''0'' AS CODTIPDESEMBCAR,  CPP.IDPLANPREVCONTAB,                      '+#13+
           '         0 AS SALMANTIDO,      HST.FLGDEVOLUCAO,       CPP.DATAINICIO,         '+#13+
           '         HST.FLGINTEVENTO ,  PLP.FLGRECECONTPATRO                              '+#13+  //leocbs - 06042002
           ' FROM    CONTRIBUICAO C,  CONTPREV CP,   PATRO PT, CONTPLANPATRO CPL,          '+#13+
           '         CONTRIBPREVPATRO CPP,  HSTCONTRIBPREV HST, PLANPREVPATRO PLP          '+#13+
           ' WHERE   HST.IDLOTE = '+IntToStr(piIdLote)+'      AND                          '+#13+
           '         HST.IDPESSOA = HST.IDPESSOA AND                                       '+#13+ //leocbs  - 3001 - peformance
           '         HST.MESCOBRANCA    '+sSinal+'  '''+psAnoMesCobranca+''' AND           '+#13+  // Gleyber - 07/07/2003
           '         HST.SITRECEBIMENTO = '+sSitRecebimento+' AND                          '+#13;
     sSQL2 := sSQL2 + sFiltro                                                               +#13+ { Augusto 14/07/2003 }
           '         CPP.IDPLANOPREV    = HST.IDPLANOPREV AND                              '+#13+
           '         CPP.IDPESSOA       = HST.IDPESSOA  AND                                '+#13+
           '         CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO AND                           '+#13+
           '         PT.IDPESSOA        = CPP.IDPESSOA AND                                 '+#13+
           '         CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO AND                           '+#13+
           '         CP.IDPLANOPREV     = CPP.IDPLANOPREV AND                              '+#13+
           '         CPL.IDPESSJUR      = CPP.IDPESSOA AND                                 '+#13+
           '         CPL.IDPLANOPREV    = CPP.IDPLANOPREV AND                              '+#13+
           '         CPL.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO AND                           '+#13+
           '         C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO AND                            '+#13+
           '         PLP.IDPESSJUR = HST.IDPESSJUR AND                                     '+#13+
           '         PLP.IDPLANOPREV = HST.IDPLANOPREV                                     '+#13;
//   sSQL := sSQL1+' UNION '+sSQL2+' ORDER BY IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO,IDPESSOA ';
   sSQL := sSQL1 + 'ORDER BY IDPESSJUR,IDPLANOPREV, IDPESSOA, MESREFERENCIA, DATAPREVISAORECE, IDCONTRIBUICAO '+#13; //LEOCBS - 3101 - MUDEI ORDEM PARA A INTEGRAÇÃO COM O FINANCEIRO NÃO DAR ERRO
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

function LerAlteradorContrib(var qry : TwwQuery;
                             psMesReferencia, psMesCobranca : string;
                             piNumRecebimento, piIdMotivo : longint) : boolean;
var sSQL : string;
begin
   Result := False;
   //  Filtrar do historico de alteradores os alteradores das contribuicoes em questao
   sSQL := ' SELECT HST.MESREFERENCIA, HST.NUMRECEBIMENTO, HST.MESCOBRANCA, HST.IDMOTIVO,       '+
           '        HST.VALOR,         HST.CODALTERADOR,   HST.FLGTIPO,     HST.FLGRETROATIVO,  '+
           '        HST.FLGEVENTO,     TA.DESCRICAO                                             '+
           ' FROM   HSTATRASOCONTRIB HST, TIPOALTERADOR TA                '+
           ' WHERE  (HST.NUMRECEBIMENTO  = '+IntToStr(piNumRecebimento)+')'+
           ' AND    (HST.MESREFERENCIA   = '''+psMesReferencia+''') '+
           ' AND    (HST.MESCOBRANCA     = '''+psMesCobranca+''') '+
           ' AND    (HST.IDMOTIVO        = '+IntToStr(piIdMotivo)+')'+
           ' AND    (HST.CODALTERADOR    = TA.CODALTERADOR) ';

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

function EnviaContribuicao(qry             : TwwQuery;
                           piOrdem,
                           piIdLote,
                           liPeriodo,
                           liExercicio     : longInt;
                           sSitFundacao,
                           psFlgIntEvento  : string;
                           piUltimaContrib : integer;
                       var bExigeFinanc    : boolean) : real;
var
    sSQLFields,
    sSQLValues,
    sSQLValuesAlterador,
    sMsgErro,
    sCodProvDesc,
    sIdRubrica,
    sDataCobranca        : string;

    bEnvioEncerrado      : boolean;
    rValorEnviado        : double;
    cTipoFolha,
    cTipoEnvPrev         : char;

    // Campos de Integracao com financeiro
    sPlano,
    sPlaContaC,
    sPlaContaD,
    sCodCentroCustoC,
    sCodCentroCustoD,
    sIdEmpresa,
    sUnidNegoc,
    sIdEmpresaProp,
    sCodCentroRespon,
    sCodSubConta,
    sRecPag,
    sCodTipRecDes,
    sTipCodigo,
    sCodTipDoc,
    sPlaContaDProvis,    // Gleyber - 11/01/2006 - Pendência 19538
    sPlaContaCProvis,    // Gleyber - 11/01/2006 - Pendência 19538
    sCodPortForma , sSQLValuesAlteradorIni       : string;
begin
   Result        := -1;
   rValorEnviado := 0;

   // *************************************************************************
   //                       VERIFICAR O SINCRONISMO
   // *************************************************************************
   // Sincronismo : Se for preparo de Ativo ou Mantido parcial
   //               Entao Se a patrocinadora for a Fundacao
   //                     Entao verificar se a Folha CM já foi encerrada
   //                     Senao verificar se o envio do CCP já foi encerrado
   //               Senao Se for preparo de Assistido
   //                     Entao verificar se a Folha de Beneficio já foi encerrada
   bEnvioEncerrado := False;

   if (sSitFundacao = 'AT') or (sSitFundacao = 'MP')
   then begin
      if qry.FieldByName('IdPessJur').AsInteger = iIdFundacao
      then bEnvioEncerrado := VerificaFechamento( qry.FieldByName('IdPessJur').AsInteger,
                                                  cteIdModuloFolhaCM,
                                                  qry.FieldByName('MesCobranca').AsString,
                                                  'E' ,cTipoEnvPrev)
      else bEnvioEncerrado := VerificaFechamento( qry.FieldByName('IdPessJur').AsInteger,
                                                  cteIdModuloCCP,
                                                  qry.FieldByName('MesCobranca').AsString,
                                                  'E',cTipoEnvPrev );
      sMsgErro := 'O Envio de Contribuições para a Patrocinadora  para o mês '+
                   qry.FieldByName('MesCobranca').AsString+' já foi encerrado.';
   end
   else if (sSitFundacao = 'AS')
        then begin
           bEnvioEncerrado := VerificaFechamento( qry.FieldByName('IdPessJur').AsInteger,
                                                  cteIdModuloFolhaBen,
                                                  qry.FieldByName('MesCobranca').AsString,
                                                   'E' ,cTipoEnvPrev);
           sMsgErro := 'A Folha de Benefícios para o mês '+qry.FieldByName('MesCobranca').AsString+' já '+
                       'foi efetivada.';
        end;

   if bEnvioEncerrado
   then begin
      MsgDlg(sMsgErro+ ' Logo, para executar o envio para este mês será necessário desfazer o envio encerrado. ',
            'Erro',mtError, [mbOk, mbHelp],0);
      Exit;
   end;

   // *************************************************************************
   //               BUSCAR PARAMETRIZACAO CONTABIL/FINANCEIRA
   // *************************************************************************
   if sSitFundacao = 'AS'
   then cTipoFolha := 'B'
   else cTipoFolha := 'P';


   //leocm - 21052002 - início
   if ((qry.FieldByName('IdPessJur').AsInteger <> iIdFundacao)
       or ((qry.FieldByName('IdPessJur').AsInteger = iIdFundacao) and  prmIntegraFundacao)) //leofuncef - 11042005
   then   begin
   //leocm - 21052002 - fim
      if not dtmAPrevIntegraBack.BuscaInfIntegra ( qry.FieldbyName('IDPESSJUR').AsInteger,
                                                qry.FieldbyName('IDPLANOPREV').AsInteger,
                                                qry.FieldbyName('IDPESSOA').AsInteger,
                                                qry.FieldbyName('IDPESSOA').AsInteger,
                                                qry.FieldbyName('IDCONTRIBUICAO').AsInteger,
                                                'C', // pcTipoItem  : C - Contribuicao, B - Beneficio
                                                cTipoFolha, // pcTipoEnvio : B - Folha de Beneficio, P - Folha da Patro, C - Banco
                                                qry.FieldbyName('FlgDevolucao').AsInteger,
                                                qry.FieldByName('MesCobranca').AsString,
                                                qry.FieldByName('MesReferencia').AsString,
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
                                                'R',  // Gleyber - 12/09/2005 - Pendência 20169
                                                bExigeFinanc,
                                                sMsgErro ) //leocm - 28042005
      then begin
         MsgDlg('Erro na parametrização Contábil/Financeira da contribuição [código :'+qry.FieldbyName('IDCONTRIBUICAO').AsString+']. Verifique.',
            'Erro',mtError, [mbOk, mbHelp],0);
         Exit;
      end;
   end;

//    sRecPagDevol          := 'RECPAGDEVOL';
//    sCodTipRecDesembDevol := 'CODTIPDESEMBDEVOL';
//    sCodTipDesembCAR      := 'CODTIPDESEMBCAR';

   // *************************************************************************
   //               BUSCAR RUBRICA A SER UTILIZADA
   // *************************************************************************
   // Buscar IdRubrica e CodProvDesc correspondentes à contribuicao que esta sendo enviada
   if (not dtmAPrev.qryAuxContrib.Active) or
      (dtmAPrev.qryAuxContrib.FieldByName('IdPlanoPrev').AsInteger <> qry.FieldByName('IdPlanoPrev').AsInteger)
   then begin
      dtmAPrev.qryAuxContrib.Close;
      dtmAPrev.qryAuxContrib.ParamByName('IdPlanoPrev').AsInteger := qry.FieldByName('IdPlanoPrev').AsInteger;
      dtmAPrev.qryAuxContrib.Open;
      if dtmAPrev.qryAuxContrib.IsEmpty
      then Exit;
   end;

   sIdRubrica   := '';
   sCodProvDesc := '';
   with dtmAPrev.qryAuxContrib do
   begin
      if Locate('IdContribuicao',qry.FieldByName('IdContribuicao').AsInteger,[loCaseInsensitive])
      then begin
         if Copy(qry.FieldByName('MesReferencia').AsString,6,2) = '13'
         then begin // é rubrica de contribuicao sobre 13o.
            //leocbs - 29102002 - inicio
            if qry.FieldbyName('IdMotivo').AsInteger <> prmIdMotivoDiverg
            //if qry.FieldByName('MesCobranca').AsString = qry.FieldByName('MesReferencia').AsString
            //leocbs - 29102002 - fim
            then sIdRubrica := FieldByName('IDRUBDECTERC').AsString           // rubrica normal
            else if qry.FieldbyName('FlgDevolucao').AsInteger = 1
                 then sIdRubrica := FieldByName('IDRUBDECTERCDEVOL').AsString // rubrica de devolucao
                 else sIdRubrica := FieldByName('IDRUBDECTERCATRA').AsString; // rubrica de atraso
         end
         else begin // é rubrica sem ser sobre 13o.
            //leocbs - 30042002 - inicio
            //if qry.FieldbyName('IdMotivo').AsInteger = prmIdMotivoContrib
            if qry.FieldByName('MesCobranca').AsString = qry.FieldByName('MesReferencia').AsString
            //leocbs - 30042002 - fim
            then sIdRubrica := FieldByName('IDRUBRICA').AsString              // rubrica normal
            else if qry.FieldByName('FlgDevolucao').AsInteger = 1
                 then sIdRubrica := FieldByName('IDRUBRICADEVOLUC').AsString  // rubrica de devolucao
                 else sIdRubrica := FieldByName('IDRUBRICAATRASO').AsString;  // rubrica de atraso
         end;
      end;
   end; // with

   if Trim(sIdRubrica) <> ''
   then begin
      with dtmAPrev.qryRubricaXPess do
      begin
         Close;
         if sSitFundacao = 'AS'
         then ParamByName('IdPessJur').AsInteger := iIdFundacao
         else ParamByName('IdPessJur').AsInteger := qry.FieldByName('IdPessJur').AsInteger;
         ParamByName('IdRubrica').AsInteger := StrToInt(sIdRubrica);
         Open;
         if not IsEmpty
         then sCodProvDesc := FieldByName('CodProvDesc').AsString;
      end;
   end;

   // Data Cobranca é a mesma do Historico de Contribuicao
   //sDataCobranca := DateToStr(qry.FieldByName('DATAPREVISAORECE').AsDateTime);                  //ClaudioR - 19962 - 16/08/2007 
   sDataCobranca := FormatDateTime('dd/mm/yyyy', qry.FieldByName('DATAPREVISAORECE').AsDateTime); //ClaudioR - 19962 - 16/08/2007

   // Gravar contribuicao na tabela tmpDesc
   sSQLFields := ' FLGATRASODEVOL,  '+
                 ' FLGDESCFOLHA,    FLGDESCONTO,    FLGTIPODESC,     SEQPROPOSTA,     '+
                 ' IDDESCONTO,      IDFUNDACAO,     IDMOTIVO,        IDPESSJUR,       '+
                 ' IDPESSOA,        IDPLANOPREV,    IDTITULAR,       '+
                 ' INSCRICAONUMERO, MATRICULA,      MESCOBRANCA,     MESREFERENCIA,   '+
                 ' NUMPRIORIDADE,   ORDEM,          SISTORIGEM,                 '+
                 ' PLACONTAC,       PLACONTAD,      PLANO,           UNIDNEGOC,       '+
                 ' CODPORTFORMA,    CODTIPDOC,      CODTIPRECDES,    RECPAG,          '+
                 ' VALORBASE1,      VALORBASE2,     VALORBASE3,      DATAREFERENCIA,  '+
                 ' CODCENTROCUSTOC, CODCENTROCUSTOD, '+
                 ' CODCENTRORESPON, CODSUBCONTA,    IDEMPRESA,       IDEMPRESAPROP,   '+
                 ' DATACOBRANCA,    NODOCUMENTO,    COMPLDOCUMENTO,  IDLOTE,          '+
                 ' IDEMPCOBRANCA,   PERIODO,        EXERCICIO,       TIPCODIGO,       '+
                 ' FLGEXISTEHST,    SITENVIO,       IDPROVENTO,      CODPROVDESC,     VALOR,                            '+
                 ' DESCRICAO,       REFERENCIA,     CODALTERADOR,    FLGALTERADOR,    '+
                 ' FLGINTEVENTO,    IDMODULO,       IDPLANPREVCONTAB,  ' +
                 ' NUMRECEBIMENTO '; //Bruno Bastos - Pend. 20518 - 25/10/2005

   // ** Preenchendo FLGATRASODEVOL
   if (qry.FieldByName('MesReferencia').AsString = qry.FieldByName('MesCobranca').AsString) or
      ( (Copy(qry.FieldByName('MesReferencia').AsString,6,2) = '13') and
        (Copy(qry.FieldByName('MesCobranca').AsString,6,2)   = '12') )
   then sSQLValues          := '''N'''
   else if qry.FieldByName('FlgDevolucao').AsInteger = 1
        then sSQLValues          := '''D'''
        else sSQLValues          := '''A''';

   // ** Preenchendo FLGDESCFOLHA
   // Se o participante é assistido, o desconto vai para B - Folha de Beneficio
   //                         senao, o desconto vai paara P - Folha de Pagamento
   if sSitFundacao = 'AS'
   then sSQLValues          := sSQLValues          +', ''B'''
   else if qry.FieldByName('flgDescFolha').AsInteger = 1
        then sSQLValues          := sSQLValues          +', ''P'''
        else sSQLValues          := sSQLValues          +', ''O''';

   // ** Preenchendo FLGDESCONTO
   if qry.FieldByName('FlgDevolucao').AsInteger = 1 // FLGDESCONTO
   then sSQLValues          := sSQLValues          +', 0'
   else sSQLValues          := sSQLValues          +', 1';

   // ** Preenchendo FLGTIPODESC
   sSQLValues             := sSQLValues +', ''P'' ';

   // ** Preenchendo chaves
   sSQLValues := sSQLValues +', '+qry.FieldByName('SeqProposta').AsString;   // SEQPROPOSTA
   sSQLValues := sSQLValues +', '+qry.FieldByName('IdContribuicao').AsString;// IDDESCONTO
   sSQLValues := sSQLValues +', '+qry.FieldByName('IdFundacao').AsString;    // IDFUNDACAO
   sSQLValues := sSQLValues +', '+qry.FieldByName('IdMotivo').AsString;      // IDMOTIVO
   sSQLValues := sSQLValues +', '+qry.FieldByName('IdPessJur').AsString;     // IDPESSJUR
   sSQLValues := sSQLValues +', '+qry.FieldByName('IdPessoa').AsString;      // IDPESSOA
   sSQLValues := sSQLValues +', '+qry.FieldByName('IdPlanoPrev').AsString;   // IDPLANOPREV

   // ** Preenchendo IDTITULAR
   sSQLValues          := sSQLValues +', '+qry.FieldByName('IdPessoa').AsString;

   // ** Preenchendo INSCRICAONUMERO E MATRICULA
   if sSitFundacao <> 'AS'
   then begin
      sSQLValues := sSQLValues +', '+qry.FieldByName('InscricaoNumero').AsString; // INSCRICAONUMERO
      sSQLValues := sSQLValues +', '''+qry.FieldByName('Matricula').AsString+'''';       //MATRICULA
   end
   else begin
      sSQLValues := sSQLValues +', NULL';
      sSQLValues := sSQLValues +', NULL';
   end;

   // ** Preenchendo MESCOBRANCA E MESREFERENCIA
   sSQLValues := sSQLValues +', '''+qry.FieldByName('MesCobranca').AsString+'''';
   sSQLValues := sSQLValues +', '''+qry.FieldByName('MESREFERENCIA').AsString+'''';

   // ** Preenchendo NUMPRIORIDADE, ORDEM e SISTORIGEM
   sSQLValues          := sSQLValues+', NULL ';

   sSQLValues             := sSQLValues +', '+IntToStr(piOrdem);

   // Colocação QuotedStr para o Campo SISTORIGEM tipo String.
   sSQLValues             := sSQLValues +', '+QuotedStr(IntToStr(Sistema.IdModulo));

   if Trim(sPlaContaC) <> ''
   then sSQLValues             := sSQLValues +', '+ QuotedStr(sPlaContaC)
   else sSQLValues             := sSQLValues +', NULL ';

   if Trim(sPlaContaD) <> ''
   then sSQLValues             := sSQLValues +', '+ QuotedStr(sPlaContaD)
   else sSQLValues             := sSQLValues +', NULL ';

   // ** Preenchendo PLANO DE CONTAS
   if Trim(sPlano) <> ''
   then sSQLValues             := sSQLValues +', '+ sPlano
   else sSQLValues             := sSQLValues +', '+IntToStr(IntegraBack.Plano);

   // ** Preenchendo UNIDNEGOC
   if Trim(sUnidNegoc) <> ''
   then sSQLValues             := sSQLValues +', '+ sUnidNegoc
   else sSQLValues             := sSQLValues +', NULL ';

   // ** Preenchendo CODPORTFORMA
   if Trim(sCodPortForma) <> ''
   then sSQLValues             := sSQLValues +', '+ sCodPortForma
   else sSQLValues             := sSQLValues +', NULL ';

   // ** Preenchendo CODTIPDOC
   if Trim(sCodTipDoc) <> ''
   then sSQLValues             := sSQLValues +', '+ sCodTipDoc
   else sSQLValues             := sSQLValues +', NULL ';

   // ** Preenchendo CODTIPRECDES
   if Trim(sCodTipRecDes) <> ''
   then sSQLValues             := sSQLValues +', '+QuotedStr(sCodTipRecDes)
   else sSQLValues             := sSQLValues +', NULL ';

   // ** Preenchendo RECPAG
   if Trim(sRecPag) <> ''
   then sSQLValues             := sSQLValues +', '+QuotedStr(sRecPag)
   else sSQLValues             := sSQLValues +', NULL ';

   if qry.FieldByName('ValorOP1').AsString <> ''                           //VALORBASE1
   then sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorOP1').AsString)
   else sSQLValues := sSQLValues+', NULL ';

   if qry.FieldByName('ValorOP2').AsString <> ''                           //VALORBASE2
   then sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorOP2').AsString)
   else sSQLValues := sSQLValues+', NULL ';

   if qry.FieldByName('ValorOP3').AsString <> ''                           //VALORBASE3
   then sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorOP3').AsString)
   else sSQLValues := sSQLValues+', NULL ';

   // ** Preenchendo DATAREFERENCIA
   sSQLValues          := sSQLValues+', TO_DATE('''+sDataCobranca+''',''dd/mm/yyyy'') ';

   // ** Preenchendo CODCENTROCUSTOC
   if Trim(sCODCENTROCUSTOC) <> ''
   then sSQLValues             := sSQLValues +', '+QuotedStr(sCODCENTROCUSTOC)
   else sSQLValues             := sSQLValues +', NULL ';

   // ** Preenchendo CODCENTROCUSTOD
   if Trim(sCODCENTROCUSTOD) <> ''
   then sSQLValues             := sSQLValues +', '+QuotedStr(sCODCENTROCUSTOD)
   else sSQLValues             := sSQLValues +', NULL ';

   // ** Preenchendo CODCENTRORESPON
   if Trim(sCODCENTRORESPON) <> ''
   then sSQLValues             := sSQLValues +', '+QuotedStr(sCODCENTRORESPON)
   else sSQLValues             := sSQLValues +', NULL ';

   // ** Preenchendo CODSUBCONTA
   if Trim(sCODSUBCONTA) <> ''
   then sSQLValues             := sSQLValues +', '+sCODSUBCONTA
   else sSQLValues             := sSQLValues +', NULL ';

   // ** Preenchendo IDEMPRESA
   if Trim(sIDEMPRESA) <> ''
   then sSQLValues             := sSQLValues +', '+sIDEMPRESA
   else sSQLValues             := sSQLValues +', NULL ';

   // ** Preenchendo IDEMPRESAPROP
   sSQLValues          := sSQLValues+', '+IntToStr(Sistema.IdEmpresa);

   // ** Preenchendo DATACOBRANCA
   sSQLValues := sSQLValues +', To_Date('''+sDataCobranca+''', ''dd/mm/yyyy'') ';

   // ** Preenchendo DATACOBRANCA
   sSQLValues := sSQLValues +', '+qry.FieldByName('NumRecebimento').AsString;

   // ** Preenchendo COMPLDOCUMENTO
   sSQLValues := sSQLValues +', '''+Copy(qry.FieldByName('MesReferencia').AsString,6,2)+'''';

   // ** Preenchendo IDLOTE
   sSQLValues := sSQLValues +', '+IntToStr(piIdLote);

   // ** Preenchendo IDEMPCOBRANCA
   sSQLValues := sSQLValues +', '+qry.FieldByName('IdPessJur').AsString;

   // ** Preenchendo PERIODO
   sSQLValues := sSQLValues +', '+IntToStr(liPeriodo);

   // ** Preenchendo EXERCICIO
   sSQLValues := sSQLValues +', '+IntToStr(liExercicio);

   // ** Preenchendo TIPCODIGO
   if Trim(sTIPCODIGO) <> ''
   then sSQLValues             := sSQLValues +', '+QuotedStr(sTIPCODIGO)
   else sSQLValues             := sSQLValues +', NULL ';

   // ** Preenchendo FLGEXISTEHST
   sSQLValues := sSQLValues +', 1 ';

   // ** Preenchendo SITENVIO
   sSQLValues := sSQLValues +', ''0'' ';

   // **************************************************************************
   // Igualar sSQLValues ao sSQLValuesAlterador, pois até este ponto as duas
   // são idênticas
   // **************************************************************************
   sSQLValuesAlteradorIni := sSQLValues;
   // **************************************************************************

   // ** Preenchendo código da rubrica ( IDPROVENTO )
   if Trim(sIdRubrica) <> ''
   then sSQLValues          := sSQLValues +', '+sIdRubrica
   else sSQLValues          := sSQLValues +', NULL';

   // ** Preenchendo CODPROVDESC
   if Trim(sCodProvDesc) <>  ''
   then sSQLValues               := sSQLValues +','''+sCodProvDesc+''''
   else sSQLValues               := sSQLValues +', NULL ';
   
   // ** Preenchendo VALOR
   sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorEsperado').AsString); //VALOR

   // ** Preenchendo DESCRICAO
   if sSitFundacao <> 'AS'
   then sSQLValues          := sSQLValues+', '''+Copy('Inscrição : '+qry.FieldByName('InscricaoNumero').AsString+
                             ' - '+qry.FieldByName('NOMECONTRIB').AsString,1,40)+''''
   else sSQLValues          := sSQLValues+', '''+'Contribuição de Assistido'+'''' ;

   // ** Preenchendo REFERENCIA
   sSQLValues := sSQLValues+', ''*** ''';

   // ** Preenchendo CODALTERADOR
   sSQLValues := sSQLValues +', NULL ';

   // ** Preenchendo FLGALTERADOR
   sSQLValues := sSQLValues +', NULL ';

   // ** Preenchendo FLGINTEVENTO
   if Trim(psFlgIntEvento) <> ''
   then sSQLValues := sSQLValues +', '''+psFlgIntEvento+''''
   else sSQLValues := sSQLValues +', NULL ';

   // ** Preenchendo IDMODULO
   sSQLValues             := sSQLValues +', '+IntToStr(Sistema.IdModulo);

   // ** Preenchendo IDPLANPREVCONTAB
   sSQLValues             := sSQLValues +', '+qry.FieldByName('IDPLANOPREV').AsString;

   // ** Preenchendo NUMRECEBIMENTO
   sSqlValues             := sSqlValues + ', ' + qry.FieldByName('NUMRECEBIMENTO').AsString; //Bruno Bastos - Pend. 20518 - 25/10/2005

   dtmAPrev.qry.Close;
   dtmAPrev.qry.SQL.Clear;
   dtmAPrev.qry.SQL.Add('INSERT INTO TMPDESC ('+sSQLFields+ ') VALUES ('+sSQLValues+')');
   try
      dtmAPrev.qry.ExecSQL;
      rValorEnviado := qry.FieldByName('ValorEsperado').AsFloat;
   except
      Exit;
   end;

   // **************************************************************************
   //                            TRATAR ALTERADORES
   // Se o mês de referÊncia for diferente do mês de cobranca
   // Entao buscar alteradores de devolucao ou atraso
   // **************************************************************************
   if qry.FieldbyName('MESREFERENCIA').AsString <> qry.FieldbyName('MESCOBRANCA').AsString
   then begin
      with dtmAPrev.qryAlteradorContrib do
      begin
         Close;
         SQL.Clear;
         SQl.Add(' SELECT HST.MESREFERENCIA, HST.NUMRECEBIMENTO, HST.MESCOBRANCA, HST.IDMOTIVO,       '+
                 '        HST.VALOR,         HST.CODALTERADOR,   HST.FLGTIPO,     HST.FLGRETROATIVO,  '+
                 '        HST.FLGEVENTO,     TA.DESCRICAO,       AC.IDRUBNORMAL                       '+
                 ' FROM   HSTATRASOCONTRIB HST, ALTERADORXCONTRIB AC, TIPOALTERADOR TA                '+
                 ' WHERE  (HST.NUMRECEBIMENTO  = '+qry.FieldByName('NumRecebimento').AsString         +')'+
                 ' AND    (HST.MESREFERENCIA   = '''+qry.FieldByName('MesReferencia').AsString        +''') '+
                 ' AND    (HST.MESCOBRANCA     = '''+qry.FieldByName('MesCobranca').AsString          +''') '+
                 ' AND    (HST.IDMOTIVO        = '+qry.FieldByName('IdMotivo').AsString               +')'+
                 ' AND    (HST.CODALTERADOR    = TA.CODALTERADOR )                                    '+
                 ' AND    (AC.IDPLANOPREV      = '+qry.FieldByName('IDPLANOPREV').AsString            +')'+
                 ' AND    (AC.IDCONTRIBUICAO   = '+qry.FieldByName('IDCONTRIBUICAO').AsString         +')'+
                 ' AND    (AC.CODALTERADOR     = HST.CODALTERADOR )                                   ');
         Open;

         First;
         while not EOF do
         begin

            sSQLValuesAlterador := sSQLValuesAlteradorIni; //leocm - 28062002 - não estava zerando, gerava erro para mais de um alterador

            // ** Preenchendo código da rubrica ( IDPROVENTO )
            sIdRubrica := FieldByName('IDRUBNORMAL').AsString;

            if Trim(sIdRubrica) = ''
            then begin
               MsgDlg('Rubrica Normal do Alterador '+FieldByName('DESCRICAO').AsString+' não cadastrada. Verifique.',
                      'Erro',mtError,[mbOk],0);
               Exit;
            end;
            sSQLValuesAlterador          := sSQLValuesAlterador +', '+sIdRubrica;

            // ** Preenchendo CODPROVDESC
            sCodProvDesc := '';
            with dtmAPrev.qryRubricaXPess do
            begin
               Close;
               if sSitFundacao = 'AS'
               then ParamByName('IdPessJur').AsInteger := iIdFundacao
               else ParamByName('IdPessJur').AsInteger := qry.FieldByName('IdPessJur').AsInteger;
               ParamByName('IdRubrica').AsInteger := StrToInt(sIdRubrica);
               Open;
               if not IsEmpty
               then sCodProvDesc := FieldByName('CodProvDesc').AsString;
            end;

            if Trim(sCodProvDesc) <> ''
            then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sCodProvDesc+''''
            else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';

            // ** Preenchendo VALOR
            sSQLValuesAlterador := sSQLValuesAlterador +', '+OraNumero(FieldByName('Valor').AsString);

            // ** Preenchendo DESCRICAO
            if sSitFundacao <> 'AS'
            then sSQLValuesAlterador := sSQLValuesAlterador+', '''+Copy('Inscrição : '+qry.FieldByName('InscricaoNumero').AsString+
                                      ' - '+qry.FieldByName('NOMECONTRIB').AsString,1,40)+''''
            else sSQLValuesAlterador := sSQLValuesAlterador+', '''+'Contribuição de Assistido'+'''';

            // ** Preenchendo REFERENCIA
            sSQLValuesAlterador := sSQLValuesAlterador +', '''+Copy(Trim(FieldByName('Descricao').AsString),1,10)+'''';

            // ** Preenchendo CODALTERADOR
            sSQLValuesAlterador := sSQLValuesAlterador +', '''+FieldByName('CodAlterador').AsString+'''';

            // ** Preenchendo FLGALTERADOR
            sSQLValuesAlterador := sSQLValuesAlterador +', '''+FieldByName('FlgTipo').AsString+'''';

           // ** Preenchendo FLGINTEVENTO
           if Trim(psFlgIntEvento) <> ''
           then sSQLValuesAlterador := sSQLValuesAlterador +', '''+psFlgIntEvento+''''
           else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';

           sSQLValuesAlterador     := sSQLValuesAlterador +', '+IntToStr(Sistema.IdModulo);

           sSQLValuesAlterador     := sSQLValuesAlterador +', '+qry.FieldbyName('IDPLANOPREV').AsString;

           // ** Preenchendo NUMRECEBIMENTO
           sSQLValuesAlterador := sSQLValuesAlterador +', NULL '; // Gleyber - Pend. 20518 - 18/11/2005

           dtmAPrev.qry.Close;
           dtmAPrev.qry.SQL.Clear;
           dtmAPrev.qry.SQL.Add('INSERT INTO TMPDESC ('+sSQLFields+ ') VALUES ('+sSQLValuesAlterador+')');
           try
               dtmAPrev.qry.ExecSQL;
           except
               Exit;
           end;

           Next;
         end; // while not qryAux.Eof
      end;
   end;
   Result := rValorEnviado;
end;//EnviaContribuicao

{
// CAMILLE - 01.04.2002 - Alteracao 1
function EnviaContribuicao(qry             : TwwQuery;
                           piOrdem,
                           piIdLote,
                           liPeriodo,
                           liExercicio     : longInt;
                           sSitFundacao,
                           psFlgIntEvento      : string;
                       var sCamposObrig,
                           sCamposNObrig   : string;
                           piUltimaContrib : integer;
                       var bExigeFinanc    : boolean) : real;
var
    sSQLFields,          sSQLValues,       sSQLValuesAlterador,
    sSQLAlteradorFinal,  sCodPortForma,    sCodProvDesc,
    sIdRubrica,
    sIdRubricaAlterador, // CAMILLE - 01.04.2002 - Alteracao 1
    sValorEncontrado, sDataCobranca        : string;

    bEnvioEncerrado,
    bCCustoCObrig,       bCCustoDObrig,    bCResponObrig,
    bUnidNegocObrig,     bPossuiAlterador                       : boolean;

    rValorEnviado                                               : real;

    // Campos de Integracao com financeiro
    sRecPagDevol,      sCodTipRecDesembDevol,
    sCodTipDesembCAR,  sMsgErro,
    sPlano,            sPlaContaC,        sPlaContaD,
    sCodCentroCustoC,  sCodCentroCustoD,  sIdEmpresa,
    sUnidNegoc,        sIdEmpresaProp,    sCodCentroRespon,
    sCodSubConta,      sRecPag,           sCodTipRecDes,
    sTipCodigo,        sCodTipDoc,        sCodPortadorForma : string;
    cTipoEnvPrev                                            : char;
    sIdPlanPrevContab                                       : string;
begin
    Result        := -1;
    rValorEnviado := 0;

    // Sincronismo : Se for preparo de Ativo ou Mantido parcial
    //               Entao Se a patrocinadora for a Fundacao
    //                     Entao verificar se a Folha CM já foi encerrada
    //                     Senao verificar se o envio do CCP já foi encerrado
    //               Senao Se for preparo de Assistido
    //                     Entao verificar se a Folha de Beneficio já foi encerrada
    bEnvioEncerrado := False;

    if (sSitFundacao = 'AT') or (sSitFundacao = 'MP')
    then begin
       if qry.FieldByName('IdPessJur').AsInteger = iIdFundacao
       then bEnvioEncerrado := VerificaFechamento( qry.FieldByName('IdPessJur').AsInteger,
                                                   cteIdModuloFolhaCM,
                                                   qry.FieldByName('MesCobranca').AsString,
                                                   'E' ,cTipoEnvPrev)
       else bEnvioEncerrado := VerificaFechamento( qry.FieldByName('IdPessJur').AsInteger,
                                                   cteIdModuloCCP,
                                                   qry.FieldByName('MesCobranca').AsString,
                                                   'E',cTipoEnvPrev );
       sMsgErro := 'O Envio de Contribuições para a Patrocinadora  para o mês '+
                    qry.FieldByName('MesCobranca').AsString+' já foi encerrado.';
    end
    else if (sSitFundacao = 'AS')
         then begin
            bEnvioEncerrado := VerificaFechamento( qry.FieldByName('IdPessJur').AsInteger,
                                                   cteIdModuloFolhaBen,
                                                   qry.FieldByName('MesCobranca').AsString,
                                                    'E' ,cTipoEnvPrev);
            sMsgErro := 'A Folha de Benefícios para o mês '+qry.FieldByName('MesCobranca').AsString+' já '+
                        'foi efetivada.';
         end;

    if bEnvioEncerrado
    then begin
       MsgDlg(sMsgErro+ ' Logo, para executar o envio para este mês será necessário desfazer o envio encerrado. ',
             'Erro',mtError, [mbOk, mbHelp],0);
       Exit;
    end;


    // Preencher nomes dos campos de acordo com o mes
    if Copy(qry.FieldByName('MesReferencia').AsString,6,2)  <> '13'
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

    sRecPagDevol          := 'RECPAGDEVOL';
    sCodTipRecDesembDevol := 'CODTIPDESEMBDEVOL';
    sCodTipDesembCAR      := 'CODTIPDESEMBCAR';

    // Verificar se a contribuicao que está sendo enviada no momento  possui alteradores
    // Para também serem enviados
    // Esta verificação só é necessária se for atraso ou devolucao
    if not LerAlteradorContrib(dtmAPrev.qryAlteradorContrib,
                               qry.FieldByName('MesReferencia').AsString,
                               qry.FieldByName('MesCobranca').AsString,
                               qry.FieldByName('NumRecebimento').AsInteger,
                               qry.FieldByName('IdMotivo').AsInteger)
    then begin
       Exit;
    end;

    if dtmAPrev.qryAlteradorContrib.IsEmpty
    then bPossuiAlterador := False
    else bPossuiAlterador := True;

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

    // Buscar IdRubrica e CodProvDesc correspondentes à contribuicao que esta sendo enviada
    if (not dtmAPrev.qryAuxContrib.Active) or
       (dtmAPrev.qryAuxContrib.FieldByName('IdPlanoPrev').AsInteger <> qry.FieldByName('IdPlanoPrev').AsInteger)
    then begin
       dtmAPrev.qryAuxContrib.Close;
       dtmAPrev.qryAuxContrib.ParamByName('IdPlanoPrev').AsInteger := qry.FieldByName('IdPlanoPrev').AsInteger;
       dtmAPrev.qryAuxContrib.Open;
       if dtmAPrev.qryAuxContrib.IsEmpty
       then Exit;
    end;

    sIdRubrica   := '';
    sCodProvDesc := '';
    with dtmAPrev.qryAuxContrib do
    begin
       if Locate('IdContribuicao',qry.FieldByName('IdContribuicao').AsInteger,[loCaseInsensitive])
       then begin
          if Copy(qry.FieldByName('MesReferencia').AsString,6,2) = '13'
          then begin // é rubrica de contribuicao sobre 13o.
             if qry.FieldbyName('IdMotivo').AsInteger = prmIdMotivoContrib
             then sIdRubrica := FieldByName('IDRUBDECTERC').AsString           // rubrica normal
             else if qry.FieldbyName('FlgDevolucao').AsInteger = 1
                  then sIdRubrica := FieldByName('IDRUBDECTERCDEVOL').AsString // rubrica de devolucao
                  else sIdRubrica := FieldByName('IDRUBDECTERCATRA').AsString; // rubrica de atraso
          end
          else begin // é rubrica sem ser sobre 13o.
             if qry.FieldbyName('IdMotivo').AsInteger = prmIdMotivoContrib
             then sIdRubrica := FieldByName('IDRUBRICA').AsString              // rubrica normal
             else if qry.FieldByName('FlgDevolucao').AsInteger = 1
                  then sIdRubrica := FieldByName('IDRUBRICADEVOLUC').AsString  // rubrica de devolucao
                  else sIdRubrica := FieldByName('IDRUBRICAATRASO').AsString;  // rubrica de atraso
          end;
       end;
    end; // with

    if Trim(sIdRubrica) <> ''
    then begin
       with dtmAPrev.qryRubricaXPess do
       begin
          Close;
          if sSitFundacao = 'AS'
          then ParamByName('IdPessJur').AsInteger := iIdFundacao
          else ParamByName('IdPessJur').AsInteger := qry.FieldByName('IdPessJur').AsInteger;
          ParamByName('IdRubrica').AsInteger := StrToInt(sIdRubrica);
          Open;
          if not IsEmpty
          then sCodProvDesc := FieldByName('CodProvDesc').AsString;
       end;
    end;

    // CAMILLE - 01.04.2002 - Alteracao 2
    // Buscar rubrica para alterador
    
    // CAMILLE - 01.04.2002 - Fim Alteracao 2

    // Data Cobranca é a mesma do Historico de Contribuicao
    sDataCobranca := DateToStr(qry.FieldByName('DATAPREVISAORECE').AsDateTime);

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
    sSQLFields := ' CODPROVDESC,     FLGATRASODEVOL,  '+
                  ' FLGDESCFOLHA,    FLGDESCONTO,    FLGTIPODESC,     SEQPROPOSTA,     '+
                  ' IDDESCONTO,      IDFUNDACAO,     IDMOTIVO,        IDPESSJUR,       '+
                  ' IDPESSOA,        IDPLANOPREV,    IDPROVENTO,      IDTITULAR,       '+
                  ' INSCRICAONUMERO, MATRICULA,      MESCOBRANCA,     MESREFERENCIA,   '+
                  ' NUMPRIORIDADE,   ORDEM,          SISTORIGEM,                 '+
                  ' PLACONTAC,       PLACONTAD,      PLANO,           UNIDNEGOC,       '+
                  ' CODPORTFORMA,    CODTIPDOC,      CODTIPRECDES,    RECPAG,          '+
                  ' VALORBASE1,      VALORBASE2,     VALORBASE3,      DATAREFERENCIA,  '+
                  ' CODCENTROCUSTOC, CODCENTROCUSTOD, '+
                  ' CODCENTRORESPON, CODSUBCONTA,    IDEMPRESA,       IDEMPRESAPROP,   '+
                  ' DATACOBRANCA,    NODOCUMENTO,    COMPLDOCUMENTO,  IDLOTE,          '+
                  ' IDEMPCOBRANCA,   PERIODO,        EXERCICIO,       TIPCODIGO,       '+
                  ' FLGEXISTEHST,    SITENVIO,       VALOR,                            '+
                  ' DESCRICAO,       REFERENCIA,     CODALTERADOR,    FLGALTERADOR,    '+
                  ' FLGINTEVENTO,    IDMODULO,       IDPLANPREVCONTAB  ' ;

    // ** Preenchendo CODPROVDESC
    sSQLValues          := ''''+sCodProvDesc+'''';
    sSQLValuesAlterador := ''''+sCodProvDesc+'''';

    // ** Preenchendo FLGATRASODEVOL
    if (qry.FieldByName('MesReferencia').AsString = qry.FieldByName('MesCobranca').AsString) or
       ( (Copy(qry.FieldByName('MesReferencia').AsString,6,2) = '13') and
         (Copy(qry.FieldByName('MesCobranca').AsString,6,2)   = '12') )
    then begin
       sSQLValues          := sSQLValues          +',''N''';
       sSQLValuesAlterador := sSQLValuesAlterador +',''N''';
    end
    else begin
       if qry.FieldByName('FlgDevolucao').AsInteger = 1
       then begin
          sSQLValues          := sSQLValues          +',''D''';
          sSQLValuesAlterador := sSQLValuesAlterador +',''D''';
       end
       else begin
          sSQLValues          := sSQLValues          +',''A''';
          sSQLValuesAlterador := sSQLValuesAlterador +',''A''';
       end;
    end;


    // ** Preenchendo FLGDESCFOLHA
    // Se o participante é assistido, o desconto vai para B - Folha de Beneficio
    //                         senao, o desconto vai paara P - Folha de Pagamento
    if sSitFundacao = 'AS'
    then begin
       sSQLValues          := sSQLValues          +', ''B''';
       sSQLValuesAlterador := sSQLValuesAlterador +', ''B''';
    end
    else begin
       if qry.FieldByName('flgDescFolha').AsInteger = 1
       then begin
          sSQLValues          := sSQLValues          +', ''P''';
          sSQLValuesAlterador := sSQLValuesAlterador +', ''P''';
       end
       else begin
          sSQLValues          := sSQLValues          +', ''O''';
          sSQLValuesAlterador := sSQLValuesAlterador +', ''O''';
       end;
    end;


    // ** Preenchendo FLGDESCONTO
    if qry.FieldByName('FlgDevolucao').AsInteger = 1 // FLGDESCONTO
    then begin
       sSQLValues          := sSQLValues          +', 0';
       sSQLValuesAlterador := sSQLValuesAlterador +', 0';
    end
    else begin
       sSQLValues          := sSQLValues          +', 1';
       sSQLValuesAlterador := sSQLValuesAlterador +', 1';
    end;

    // ** Preenchendo FLGTIPODESC
    sSQLValues             := sSQLValues +', ''P'' ';
    sSQLValuesAlterador    := sSQLValuesAlterador +', ''P'' ';

    // ** Preenchendo chaves
    sSQLValues := sSQLValues +', '+qry.FieldByName('SeqProposta').AsString;   // SEQPROPOSTA
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdContribuicao').AsString;// IDDESCONTO
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdFundacao').AsString;    // IDFUNDACAO
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdMotivo').AsString;      // IDMOTIVO
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdPessJur').AsString;     // IDPESSJUR
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdPessoa').AsString;      // IDPESSOA
    sSQLValues := sSQLValues +', '+qry.FieldByName('IdPlanoPrev').AsString;   // IDPLANOPREV

    sSQLValuesAlterador := sSQLValuesAlterador +', '+qry.FieldByName('SeqProposta').AsString;   // SEQPROPOSTA
    sSQLValuesAlterador := sSQLValuesAlterador +', '+qry.FieldByName('IdContribuicao').AsString;// IDDESCONTO
    sSQLValuesAlterador := sSQLValuesAlterador +', '+qry.FieldByName('IdFundacao').AsString;    // IDFUNDACAO
    sSQLValuesAlterador := sSQLValuesAlterador +', '+qry.FieldByName('IdMotivo').AsString;      // IDMOTIVO
    sSQLValuesAlterador := sSQLValuesAlterador +', '+qry.FieldByName('IdPessJur').AsString;     // IDPESSJUR
    sSQLValuesAlterador := sSQLValuesAlterador +', '+qry.FieldByName('IdPessoa').AsString;      // IDPESSOA
    sSQLValuesAlterador := sSQLValuesAlterador +', '+qry.FieldByName('IdPlanoPrev').AsString;   // IDPLANOPREV

    // ** Preenchendo código da rubrica ( IDPROVENTO )
    if Trim(sIdRubrica) <> ''
    then begin
       sSQLValues          := sSQLValues +', '+sIdRubrica;
       sSQLValuesAlterador := sSQLValuesAlterador +', '+sIdRubrica;
    end
    else begin
       sSQLValues          := sSQLValues +', NULL';
       sSQLValuesAlterador := sSQLValuesAlterador +', NULL';
    end;

    // ** Preenchendo IDTITULAR
    sSQLValues          := sSQLValues +', '+qry.FieldByName('IdPessoa').AsString;
    sSQLValuesAlterador := sSQLValuesAlterador +', '+qry.FieldByName('IdPessoa').AsString;

    // ** Preenchendo INSCRICAONUMERO E MATRICULA
    if sSitFundacao <> 'AS'
    then begin
       sSQLValues := sSQLValues +', '+qry.FieldByName('InscricaoNumero').AsString; // INSCRICAONUMERO
       sSQLValues := sSQLValues +', '''+qry.FieldByName('Matricula').AsString+'''';       //MATRICULA
       sSQLValuesAlterador := sSQLValuesAlterador +', '+qry.FieldByName('InscricaoNumero').AsString; // INSCRICAONUMERO
       sSQLValuesAlterador := sSQLValuesAlterador +', '''+qry.FieldByName('Matricula').AsString+'''';       //MATRICULA
    end
    else begin
       sSQLValues := sSQLValues +', NULL';
       sSQLValues := sSQLValues +', NULL';
       sSQLValuesAlterador := sSQLValuesAlterador +', NULL';
       sSQLValuesAlterador := sSQLValuesAlterador +', NULL';
    end;

    // ** Preenchendo MESCOBRANCA E MESREFERENCIA
    sSQLValues := sSQLValues +', '''+qry.FieldByName('MesCobranca').AsString+'''';
    sSQLValues := sSQLValues +', '''+qry.FieldByName('MESREFERENCIA').AsString+'''';

    sSQLValuesAlterador := sSQLValuesAlterador +', '''+qry.FieldByName('MesCobranca').AsString+'''';
    sSQLValuesAlterador := sSQLValuesAlterador +', '''+qry.FieldByName('MESREFERENCIA').AsString+'''';


    // ** Preenchendo NUMPRIORIDADE, ORDEM e SISTORIGEM
    if qry.FieldByName('NumPrioridade').AsString <> ''
    then begin
       sSQLValues          := sSQLValues +', '+qry.FieldByName('NumPrioridade').AsString;
       sSQLValuesAlterador := sSQLValuesAlterador +', '+qry.FieldByName('NumPrioridade').AsString;
    end
    else begin
       sSQLValues          := sSQLValues+', NULL ';
       sSQLValuesAlterador := sSQLValuesAlterador+', NULL ';
    end;

    sSQLValues             := sSQLValues +', '+IntToStr(piOrdem);
    sSQLValuesAlterador    := sSQLValuesAlterador +', '+IntToStr(piOrdem);

    // Lise - 21/11/2001
    // Colocação QuotedStr para o Campo SISTORIGEM tipo String.
    sSQLValues             := sSQLValues +', '+QuotedStr(IntToStr(Sistema.IdModulo));
    sSQLValuesAlterador    := sSQLValuesAlterador +', '+QuotedStr(IntToStr(Sistema.IdModulo));

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
      sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+'''';
   end
   else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';

   BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,sPlaContaD,
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
      sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+'''';
   end
   else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';

   // ** Preenchendo PLANO DE CONTAS
   sSQLValues := sSQLValues + ',' +IntToStr(IntegraBack.Plano);
   sSQLValuesAlterador := sSQLValuesAlterador + ',' +IntToStr(IntegraBack.Plano);

   // ** Preenchendo UNIDNEGOC
   if bUnidNegocObrig
   then begin
      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                      sUNIDNEGOC,qry.FieldByName(sUNIDNEGOC).AsString,
                      'N',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib );
      if Trim(sValorEncontrado) <> ''
      then sSQLValuesAlterador := sSQLValuesAlterador +', '+sValorEncontrado
      else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';
   end
   else begin
      BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,
                      sUNIDNEGOC,qry.FieldByName(sUNIDNEGOC).AsString,
                      'N',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);
      if Trim(sValorEncontrado) <> ''
      then sSQLValuesAlterador := sSQLValuesAlterador +', '+sValorEncontrado
      else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';
   end;

   // ** Preenchendo CODPORTFORMA
   // Se nao for desconto em folha, o portador forma é obrigatório
   if Trim(qry.FieldByName(sCodPortadorForma).AsString) <> '' //CODPORTFORMA
   then begin
      sSQLValues := sSQLValues +', '+qry.FieldByName(sCodPortadorForma).AsString;
      sSQLValuesAlterador := sSQLValuesAlterador +', '+qry.FieldByName(sCodPortadorForma).AsString;
   end
   else begin
      sSQLValues := sSQLValues+', '+sCodPortForma;
      sSQLValuesAlterador := sSQLValuesAlterador +', '+sCodPortForma;
   end;

   // ** Preenchendo CODTIPDOC
   BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,
                    sCODTIPDOC,qry.FieldByName(sCodTipDoc).AsString,
                    'N',
                     qry.FieldbyName('IdPessJur').AsInteger,
                     qry.FieldbyName('IdPlanoPrev').AsInteger,
                     qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib );
   if Trim(sValorEncontrado) <> ''
   then sSQLValuesAlterador := sSQLValuesAlterador +', '+sValorEncontrado
   else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';


   // Se for uma devolucao filtrar para (Contas a Pagar)
   if qry.FieldByName('FlgDevolucao').AsInteger = 1
   then begin
      // ** Preenchendo CODTIPRECDES
      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                         sCodTipRecDesembDevol,qry.FieldByName(sCodTipRecDesembDevol).AsString,
                         'S',
                         qry.FieldbyName('IdPessJur').AsInteger,
                         qry.FieldbyName('IdPlanoPrev').AsInteger,
                         qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib );

      if Trim(sValorEncontrado) <> ''
      then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
      else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';

      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                         sRecPagDevol,qry.FieldByName(sRecPagDevol).AsString,
                         'S',
                         qry.FieldbyName('IdPessJur').AsInteger,
                         qry.FieldbyName('IdPlanoPrev').AsInteger,
                         qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib); //RECPAG
      if Trim(sValorEncontrado) <> ''
      then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
      else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';
   end
   else begin
      // Se for para folha de benefício usar codtipdesembcar e recpag = P
      if sSitFundacao = 'AS'
      then begin
         BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                            sCodTipDesembCAR,
                            qry.FieldByName(sCodTipDesembCAR).AsString,
                            'S',
                            qry.FieldbyName('IdPessJur').AsInteger,
                            qry.FieldbyName('IdPlanoPrev').AsInteger,
                            qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //CODTIPRECDES

         if Trim(sValorEncontrado) <> ''
         then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
         else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';

         BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                            sRecPagDevol,qry.FieldByName(sRecPagDevol).AsString,
                            'S',
                            qry.FieldbyName('IdPessJur').AsInteger,
                            qry.FieldbyName('IdPlanoPrev').AsInteger,
                            qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib); //RECPAG
         if Trim(sValorEncontrado) <> ''
         then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
         else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';
      end
      else begin
         BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                            sCODTIPRECDES,qry.FieldByName(sCodTipRecDes).AsString,
                            'S',
                            qry.FieldbyName('IdPessJur').AsInteger,
                            qry.FieldbyName('IdPlanoPrev').AsInteger,
                            qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //CODTIPRECDES
         if Trim(sValorEncontrado) <> ''
         then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
         else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';

         BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                            sRECPAG,qry.FieldByName(sRecPag).AsString,
                            'S',
                            qry.FieldbyName('IdPessJur').AsInteger,
                            qry.FieldbyName('IdPlanoPrev').AsInteger,
                            qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib); //RECPAG

         if Trim(sValorEncontrado) <> ''
         then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
         else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';
      end;
   end;

   if qry.FieldByName('ValorOP1').AsString <> ''                           //VALORBASE1
   then sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorOP1').AsString)
   else sSQLValues := sSQLValues+', NULL ';
   sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';

   if qry.FieldByName('ValorOP2').AsString <> ''                           //VALORBASE2
   then sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorOP2').AsString)
   else sSQLValues := sSQLValues+', NULL ';
   sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';

   if qry.FieldByName('ValorOP3').AsString <> ''                           //VALORBASE3
   then sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorOP3').AsString)
   else sSQLValues := sSQLValues+', NULL ';
   sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';

   // ** Preenchendo DATAREFERENCIA
   sSQLValues          := sSQLValues+', TO_DATE('''+sDataCobranca+''',''dd/mm/yyyy'') ';
   sSQLValuesAlterador := sSQLValuesAlterador+', TO_DATE('''+sDataCobranca+''',''dd/mm/yyyy'') ';

   if bCCustoCObrig  //CODCENTROCUSTOC
   then begin
      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sCODCENTROCUSTOC,
                      qry.FieldByName(sCodCentroCustoC).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib );
      if Trim(sValorEncontrado) <> ''
      then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
      else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';
   end
   else begin
      BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,
                      sCODCENTROCUSTOC,qry.FieldByName(sCodCentroCustoC).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib );

      if Trim(sValorEncontrado) <> ''
      then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
      else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';
   end;

   if bCCustoDObrig //CODCENTROCUSTOD
   then begin
      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sCODCENTROCUSTOD,
                     qry.FieldByName(sCodCentroCustoD).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);
      if Trim(sValorEncontrado) <> ''
      then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
      else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';

   end
   else begin
      BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,sCODCENTROCUSTOD,
                     qry.FieldByName(sCodCentroCustoD).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);
      if Trim(sValorEncontrado) <> ''
      then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
      else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';

   end;


   if bCResponObrig //CODCENTRORESPON
   then begin
      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sCODCENTRORESPON,
                      qry.FieldByName(sCodCentroRespon).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);
      if Trim(sValorEncontrado) <> ''
      then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
      else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';
   end
   else begin
      BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,sCODCENTRORESPON,
                      qry.FieldByName(sCodCentroRespon).AsString,
                      'S',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib );
      if Trim(sValorEncontrado) <> ''
      then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
      else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';
   end;


   BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,sCODSUBCONTA,
                      qry.FieldByName(sCodSUBCONTA).AsString,
                      'N',
                      qry.FieldbyName('IdPessJur').AsInteger,
                      qry.FieldbyName('IdPlanoPrev').AsInteger,
                      qry.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //CODSUBCONTA

   if Trim(sValorEncontrado) <> ''
   then sSQLValuesAlterador := sSQLValuesAlterador +', '+sValorEncontrado
   else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';

   // ** Preenchendo IDEMPRESA
   if (bCCustoCObrig) or (bCCustoDObrig)
   then begin
      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sIDEMPRESA,
                       qry.FieldByName(sIDEMPRESA).AsString,
                       'N',
                       qry.FieldbyName('IdPessJur').AsInteger,
                       qry.FieldbyName('IdPlanoPrev').AsInteger,
                       qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);

      if Trim(sValorEncontrado) <> ''
      then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
      else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';
   end
   else begin
      BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,sIDEMPRESA,
                       qry.FieldByName(sIDEMPRESA).AsString,
                       'N',
                       qry.FieldbyName('IdPessJur').AsInteger,
                       qry.FieldbyName('IdPlanoPrev').AsInteger,
                       qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);

      if Trim(sValorEncontrado) <> ''
      then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
      else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';
   end;

   // ** Preenchendo IDEMPRESAPROP
   sSQLValues          := sSQLValues+', '+IntToStr(Sistema.IdEmpresa);
   sSQLValuesAlterador := sSQLValuesAlterador+', '+IntToStr(Sistema.IdEmpresa);

   // ** Preenchendo DATACOBRANCA
   sSQLValues := sSQLValues +', To_Date('''+sDataCobranca+''', ''dd/mm/yyyy'') ';
   sSQLValuesAlterador := sSQLValuesAlterador +', To_Date('''+sDataCobranca+''', ''dd/mm/yyyy'') ';

   // ** Preenchendo DATACOBRANCA
   sSQLValues := sSQLValues +', '+qry.FieldByName('NumRecebimento').AsString;
   sSQLValuesAlterador := sSQLValuesAlterador +', '+qry.FieldByName('NumRecebimento').AsString;

   // ** Preenchendo COMPLDOCUMENTO
   sSQLValues := sSQLValues +', '''+Copy(qry.FieldByName('MesReferencia').AsString,6,2)+'''';
   sSQLValuesAlterador := sSQLValuesAlterador +', '''+Copy(qry.FieldByName('MesReferencia').AsString,6,2)+'''';

   // ** Preenchendo IDLOTE
   sSQLValues := sSQLValues +', '+IntToStr(piIdLote);
   sSQLValuesAlterador := sSQLValuesAlterador +', '+IntToStr(piIdLote);

   // ** Preenchendo IDEMPCOBRANCA
   sSQLValues := sSQLValues +', '+qry.FieldByName('IdPessJur').AsString;
   sSQLValuesAlterador := sSQLValuesAlterador +', '+qry.FieldByName('IdPessJur').AsString;

   // ** Preenchendo PERIODO
   sSQLValues := sSQLValues +', '+IntToStr(liPeriodo);
   sSQLValuesAlterador := sSQLValuesAlterador +', '+IntToStr(liPeriodo);

   // ** Preenchendo EXERCICIO
   sSQLValues := sSQLValues +', '+IntToStr(liExercicio);
   sSQLValuesAlterador := sSQLValuesAlterador +', '+IntToStr(liExercicio);

   // ** Preenchendo TIPCODIGO
   BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sValorEncontrado,
                    sTIPCODIGO,'',
                    'S',
                     qry.FieldbyName('IdPessJur').AsInteger,
                     qry.FieldbyName('IdPlanoPrev').AsInteger,
                     qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);
   if Trim(sValorEncontrado) <> ''
   then sSQLValuesAlterador := sSQLValuesAlterador +', '''+sValorEncontrado+''''
   else sSQLValuesAlterador := sSQLValuesAlterador +', NULL ';

   // ** Preenchendo FLGEXISTEHST
   sSQLValues := sSQLValues +', 1 ';
   sSQLValuesAlterador := sSQLValuesAlterador +', 1 ';

   // ** Preenchendo SITENVIO
   sSQLValues := sSQLValues +', ''0'' ';
   sSQLValuesAlterador := sSQLValuesAlterador +', ''0'' ';

    // ** Preenchendo VALOR
    sSQLValues := sSQLValues +', '+OraNumero(qry.FieldByName('ValorEsperado').AsString); //VALOR

   // ** Preenchendo DESCRICAO
   if sSitFundacao <> 'AS'
   then sSQLValues          := sSQLValues+', '''+Copy('Inscrição : '+qry.FieldByName('InscricaoNumero').AsString+
                             ' - '+qry.FieldByName('NOMECONTRIB').AsString,1,40)+''''
   else sSQLValues          := sSQLValues+', '''+'Contribuição de Assistido'+'''' ;

   // ** Preenchendo REFERENCIA
   sSQLValues := sSQLValues+', ''*** ''';

   // ** Preenchendo CODALTERADOR
   sSQLValues := sSQLValues +', NULL ';

   // ** Preenchendo FLGALTERADOR
   sSQLValues := sSQLValues +', NULL ';

   // ** Preenchendo FLGINTEVENTO
   if Trim(psFlgIntEvento) <> ''
   then sSQLValues := sSQLValues +', '''+psFlgIntEvento+''''
   else sSQLValues := sSQLValues +', NULL ';

   sSQLValues             := sSQLValues +', '+IntToStr(Sistema.IdModulo);

   BuscaInfFinancContrib(sSQLValues,sCamposNObrig,sIdPlanPrevContab,
                    'IDPLANPREVCONTAB','',
                    'N',
                     qry.FieldbyName('IdPessJur').AsInteger,
                     qry.FieldbyName('IdPlanoPrev').AsInteger,
                     qry.FieldByName('IdContribuicao').AsInteger , piultimacontrib);

   if Trim(sIdPlanPrevContab) = '' then sIdPlanPrevContab := '-1';

   // Se alguns dos campos estavam em branco -> Avisar e NAO GRAVAR na TMPDESC
   if (Trim(sCamposObrig) <> '') and (bExigeFinanc )
   then begin
      if MsgDlg('Existem informações necessárias à Integração com o Sistema Financeiro '+
                ' não associadas a algumas contribuições. Deseja continuar ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
      then Exit
      else bExigeFinanc := False;
   end;

   dtmAPrev.qry.Close;
   dtmAPrev.qry.SQL.Clear;
   dtmAPrev.qry.SQL.Add('INSERT INTO TMPDESC ('+sSQLFields+ ') VALUES ('+sSQLValues+')');
   try
      dtmAPrev.qry.ExecSQL;
      rValorEnviado := qry.FieldByName('ValorEsperado').AsFloat;
   except
      Exit;
   end;

   // CAMILLE - REFER - 04.10.1999
   // Se a contribuicao possui alterador
   // Entao, para cada alterador da query de alteradores (que já está aberta)
   //        Terminar de preencher a string de alteradores com
   //        VALOR, DESCRICAO, REFERENCIA, CODALTERADOR E FLGALTERADOR

   // Gravar alteradores na TmpDesc
   with dtmAPrev.qryAlteradorContrib do
   begin
      First;
      while not EOF do
      begin
         sSQLAlteradorFinal := sSQLValuesAlterador;

         // ** Preenchendo VALOR
         sSQLAlteradorFinal := sSQLAlteradorFinal +', '+OraNumero(FieldByName('Valor').AsString);

         // ** Preenchendo DESCRICAO
         if sSitFundacao <> 'AS'
         then sSQLAlteradorFinal := sSQLAlteradorFinal+', '''+Copy('Inscrição : '+qry.FieldByName('InscricaoNumero').AsString+
                                   ' - '+qry.FieldByName('NOMECONTRIB').AsString,1,40)+''''
         else sSQLAlteradorFinal := sSQLAlteradorFinal+', '''+'Contribuição de Assistido'+'''';

         // ** Preenchendo REFERENCIA
         sSQLAlteradorFinal := sSQLAlteradorFinal +', '''+Copy(Trim(FieldByName('Descricao').AsString),1,10)+'''';

         // ** Preenchendo CODALTERADOR
         sSQLAlteradorFinal := sSQLAlteradorFinal +', '''+FieldByName('CodAlterador').AsString+'''';

         // ** Preenchendo FLGALTERADOR
         sSQLAlteradorFinal := sSQLAlteradorFinal +', '''+FieldByName('FlgTipo').AsString+'''';

        // ** Preenchendo FLGINTEVENTO
        if Trim(psFlgIntEvento) <> ''
        then sSQLAlteradorFinal := sSQLAlteradorFinal +', '''+psFlgIntEvento+''''
        else sSQLAlteradorFinal := sSQLAlteradorFinal +', NULL ';

        sSQLAlteradorFinal     := sSQLAlteradorFinal +', '+IntToStr(Sistema.IdModulo);

        sSQLAlteradorFinal     := sSQLAlteradorFinal +', '+sIdPlanPrevContab;

        dtmAPrev.qry.Close;
        dtmAPrev.qry.SQL.Clear;
        dtmAPrev.qry.SQL.Add('INSERT INTO TMPDESC ('+sSQLFields+ ') VALUES ('+sSQLAlteradorFinal+')');
        try
            dtmAPrev.qry.ExecSQL;
        except
            Exit;
        end;

        Next;
      end; // while not qryAux.Eof
   end;
   Result := rValorEnviado;
end;//EnviaContribuicao
}


function EnviaContribuicaoBANCO (qryContabil           : TwwQuery;
                                 qryDocumentos         : TwwQuery;
                                 qryEnvio              : TwwQuery;
                                 qryAux                : TwwQuery;
                                 sMes                  : string;
                                 sAnoMesReferencia     : string;
                                 sHistDeb              : string;
                                 sHistCre              : string;
                                 sDataBoleta           : string;
                                 piIdPessJur           : longint;
                                 piIdPlanoPrev         : longint;
                                 piIdPessoa            : longint;
                                 piIdContribuicao      : longint;
                                 piUltimaContrib       : longint;
                                 CtrlDocumento         : TCtrlDocumento; // CAMILLE - 08.10.2004
                                 psFlgPagador          : string;
                                 psFlgSitPart          : string;
                                 piCodPortForma        : longint;
                                 cRecPag               : char;
                                 dValorEnviar          : double;
                             var sMsgErro              : string;
                             var iCodLancCAPCAR        : longint;
                             var iPlnCodigo            : longint;
                                 psObservacao          : string = '' ) : real;
var iCodSubConta,
    iNumLancto, iIdCBancaria,
    iIdRamoForCli                        : longint;

    sAux1, sAux2,
    sCodCentroCusto,
    sPlaConta,        sPlaContaD,
    sCodTipDoc,
    sCodTipRecDes,    sCodCentroRespon,
    sCodUnidNegoc,    sCodSubconta,
    sDebCre,          sCodPortForma,
    sNoDocumento,     sTipCodigo,
    sComplDocumento,  sDescCobranca,
    sDataVencimento,  sTipoReceita,
    sTipoDebCre    ,  sTP01Rec,   sTP01Deb,
    sIdPlanPrevContab,
    sAnoMesCobranca                      : string;
    bEmisBloq,
    bAchouMesCobranca , bInsereDoc                             : boolean;
    bContabilizaNoEnvio : Boolean; // CAMILLE - 31.03.2004
    sPlaContaAGravarNoDocumento : string; // CAMILLE - 31.03.2004
    sEmisBloq : string; // CAMILLE - 08.10.2004
    dTotalDocumento : double; // CAMILLE - 11.08.2004
    sDataLancto : String; //Bruno Bastos - Pend. 20596 - 27/10/2005

    sPlaContaAux : String;

begin
   if dValorEnviar <= 0 then
   begin
      Result := 0;
      exit;
   end;

   if UpperCase(Sistema.NomeUsuario) = 'SUPER'
   then begin
      sMsgErro := 'Não é permitido fazer operações financeirias com o usuário SUPER.';
      Result   := -1;
      Exit;
   end;

   // Inicializar variaveis
   Result       := -1;
   sMsgErro     := '';
   iCodSubConta := -1;

   //if sMes = '13' then sMes := Copy(DateToStr(date),4,2);                  //ClaudioR - 19962 - 16/08/2007
   if sMes = '13' then sMes := Copy(FormatDateTime('dd/mm/yyyy', date),4,2); //ClaudioR - 19962 - 16/08/2007

   if psFlgPagador <> 'C'
   then begin
      piIdPessoa := piIdPessJur;
      bEmisBloq  := False; // para nao emitir boleto
   end
   else bEmisBloq := True;

   // CAMILLE - 28.10.2004
   // GRAVAR EMISBLOQ SEMPRE COMO NÃO
   bEmisBloq  := False; // para nao emitir boleto
   sEmisBloq  := 'N';


   //leocm - 14112002 - inicio
   VerificaContabMantidoNoEnvio(qryaux,bContabilizaNoEnvio,piIdPlanoPrev);
   //leocm - 14112002 - fim


   // Gleyber - 11/01/2006 - Pendência 20769 - Início
   // Buscar informacoes necessárias nas diversas tabelas da hierarquia
   {sNoDocumento    := qryEnvio.FieldByName('NumRecebimento').AsString;
   sComplDocumento := sMes;}
   // Gleyber - 11/01/2006 - Pendência 20769 - Fim

   BuscaInfFinancContrib(sAux1, sAux2, sCodCentroCusto,'CODCENTROCUSTOD', // CAMILLE - 22.03.2004
                       //qryEnvio.FieldByName('CODCENTROCUSTOD').AsString,  // Gleyber - 14/02/2007 - Pendência 24401
                       '',                                                  // Gleyber - 14/02/2007 - Pendência 24401
                       'S',
                       piIdPessJur, piIdPlanoPrev,  piIdContribuicao,
                       piUltimaContrib, piIdPessoa );


   //leocm - 18012006 - critica codcentrocusto
   if Trim(sCodCentroCusto) = ''
   then begin
      sMsgErro := 'Centro de custo não parametrizado.';
      Exit;
   end;
   //leocm - 18012006 - fim


   BuscaInfFinancContrib(sAux1, sAux2, sPlaConta,'PLACONTAC',
                       //qryEnvio.FieldByName('PLACONTAC').AsString,  // Gleyber - 14/02/2007 - Pendência 24401
                       '',                                            // Gleyber - 14/02/2007 - Pendência 24401
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib, piIdPessoa );

   BuscaInfFinancContrib(sAux1, sAux2, sPlaContaD,'PLACONTADBANCO',
                       //qryEnvio.FieldByName('PLACONTADBANCO').AsString,  // Gleyber - 14/02/2007 - Pendência 24401
                       '',                                                 // Gleyber - 14/02/2007 - Pendência 24401
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib, piIdPessoa );


   //leocbs - 2011 - inicio
   //se for devolução então credita na conta de devolução e
   //debita da conta de crédito normal
   try
      if (qryEnvio.fieldbyname('FLGDEVOLUCAO').AsInteger = 1) and
         (cRecPag = 'R') //leocm - 17022006
      then begin

         //leocm - 20012006 - garante preenchimento da conta de baixa caso PLACONTADEVOL
         //não esteja paramatrizada
         sPlaContaAux := sPlaContaD;
         sPlaContaD := sPlaConta;
         BuscaInfFinancContrib(sAux1, sAux2, sPlaConta,'PLACONTADEVOL',
                       //qryEnvio.FieldByName('PLACONTADEVOL').AsString, // Gleyber - 14/02/2007 - Pendência 24401
                       '',                                               // Gleyber - 14/02/2007 - Pendência 24401
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib, piIdPessoa );

         sPlaConta := sPlaContaAux;
         //leocm - 20012006 - fim


      end;
   except    end;
   //o try except é apenas para não parar com erro processos que não fazem
   //devolução portanto não precisam passar o flgdevolucao
   //leocbs - fim - 2011

   BuscaInfFinancContrib(sAux1, sAux2,sCODSUBCONTA,'CODSUBCONTA',
                        //qryEnvio.FieldByName('CODSUBCONTA').AsString,  // Gleyber - 14/02/2007 - Pendência 24401
                        '',                                              // Gleyber - 14/02/2007 - Pendência 24401
                        'S',
                        piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                        piUltimaContrib, piIdPessoa );

   if sCodSubConta <> '' Then
      iCodSubConta := strToInt(sCodSubConta);

   sTipCodigo := prmTpOperCobranca;

   if cRecPag = 'R'
   then sCodTipDoc := prmTpDocRRecBanco
   else sCodTipDoc := prmTpDocPEnvioBanco;

   if Trim(sCodTipDoc) = ''
   then begin
      sMsgErro := 'Tipo de Documento não parametrizado.';
      Exit;
   end;

   if piCodPortForma <= 0
   then BuscaInfFinancContrib(sAux1, sAux2, sCodPortForma,'CODPORTFORMA',
                              //qryEnvio.FieldByName('CODPORTFORMA').AsString,  // Gleyber - 14/02/2007 - Pendência 24401
                              '',                                               // Gleyber - 14/02/2007 - Pendência 24401
                              'N',
                              piIdPessJur, piIdPlanoPrev,  piIdContribuicao,
                              piUltimaContrib, piIdPessoa )
   else sCodPortForma := IntToStr(piCodPortForma);


   // Gleyber - 06/06/2005 - Pendência 18536 - Início
   //if Trim(sCodPortForma) = '' then sCodPortForma := '-1';
   If Trim(sCodPortForma) = ''
    Then Begin
       sMsgErro := 'Portador/Forma de Pagamento não parametrizada.';
       Exit;
    End;
   // Gleyber - 06/06/2005 - Pendência 18536 - Início


   if cRecPag = 'R'
   then BuscaInfFinancContrib(sAux1, sAux2, sCodTipRecDes,'CODTIPRECDES',
                       //qryEnvio.FieldByName('CODTIPRECDES').AsString,  // Gleyber - 14/02/2007 - Pendência 24401
                       '',                                               // Gleyber - 14/02/2007 - Pendência 24401
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib, piIdPessoa )
   else BuscaInfFinancContrib(sAux1, sAux2, sCodTipRecDes,'CODTIPDESEMBDEVOL',
                       //qryEnvio.FieldByName('CODTIPDESEMBDEVOL').AsString,  // Gleyber - 14/02/2007 - Pendência 24401
                       '',                                                    // Gleyber - 14/02/2007 - Pendência 24401
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib, piIdPessoa );

   if Trim(sCodTipRecDes) = ''
   then begin
      if cRecPag = 'R'
      then sMsgErro := 'Tipo de Recebimento não parametrizado.'
      else sMsgErro := 'Tipo de Desembolso não parametrizado.';

      Exit;
   end;

   // Se nao obriga centro respon, obrigatoriamente temos que usar
   // o centro respon cadastrado no global, senao, podemos buscar um
   // especifica. Caso nao encontre, tambem podemos usar o global
   if IntegraBack.ObrigaCRespon = 'N'
   then sCodCentroRespon := prmCodCentroRespon
   else begin
      BuscaInfFinancContrib(sAux1, sAux2, sCodCentroRespon,'CODCENTRORESPON',
                            //qryEnvio.FieldByName('CODCENTRORESPON').AsString,
                            '', // Gleyber - 31/01/2007 - Pendência 24007
                            'S',
                            piIdPessJur, piIdPlanoPrev,  piIdContribuicao,
                            piUltimaContrib, piIdPessoa );
      if Trim(sCodCentroRespon) = ''
      then sCodCentroRespon := prmCodCentroRespon;
   end;

   // Se nao obriga atividade, obrigatoriamente temos que usar
   // a atividade cadastrada no global, senao, podemos buscar uma
   // especifica. Caso nao encontre, tambem podemos usar a global
   if IntegraBack.ObrigaAbc = 'N'
   then sCodUnidNegoc := IntToStr(prmUnidNegoc)
   else begin
      BuscaInfFinancContrib(sAux1, sAux2, sCodUnidNegoc,'UNIDNEGOC',
                          //qryEnvio.FieldByName('UNIDNEGOC').AsString,  // Gleyber - 14/02/2007 - Pendência 24401
                          '',                                            // Gleyber - 14/02/2007 - Pendência 24401
                          'N',
                          piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                          piUltimaContrib, piIdPessoa );
      if Trim(sCodUnidNegoc) = ''
      then sCodUnidNegoc := IntToStr(prmUnidNegoc);
   end;

   BuscaInfFinancContrib(sAux1, sAux2, sIdPlanPrevContab,'IDPLANPREVCONTAB',
                       //qryEnvio.FieldByName('IDPLANPREVCONTAB').AsString,  // Gleyber - 14/02/2007 - Pendência 24401
                       '',                                                   // Gleyber - 14/02/2007 - Pendência 24401
                       'N',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib, piIdPessoa );

   // Gleyber - 28/02/2007 - Pendência 24516 - Início
   If (Trim(sIdPlanPrevContab) <> '') And (StrToInt(sIdPlanPrevContab) <> piIdPlanoPrev)
   Then Begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT IDPLANOPREV, NOME, IDPLANOPREVPREV '+#13+
                     'FROM PLANPREVCONTABIL '+#13+
                     'WHERE IDPLANOPREV = '+sIdPlanPrevContab + #13+
                     'ORDER BY IDPLANOPREV');
      qryAux.Open;

      //ClaudioR - 17578 - 14/08/2007 - Inicio
      If (Not qryAux.IsEmpty) And (QryAux.FieldByName('ATIVO').AsString <> 'S') Then
      Begin
        sMsgErro := 'Esse Plano Previdenciario Contábil ' + QryAux.FieldByName('ATIVO').AsString + ' não é ativo.';
        Exit;
      End;
      //ClaudioR - 17578 - 14/08/2007 - Fim

      If ( (Trim(qryAux.FieldByName('IDPLANOPREVPREV').AsString) <> '') ) And
         (StrToInt(qryAux.FieldByName('IDPLANOPREVPREV').AsString) <> piIdPlanoPrev)
      Then Begin
        If MsgDlg('O plano contábil (IDPLANOPREVCONTAB) é diferente do plano previdenciário (IDPLANOPREV).'#13+
                  'Deseja fazer o lançamento contabil com o mesmo código do previdenciário?','Confirmação',
                  mtConfirmation, [mbyes,mbno],0) = mryes
        Then Begin
           sIdPlanPrevContab := IntToStr(piIdPlanoPrev);
           MsgDlg('Lançamento contábil será realizado com o MESMO código do previdenciário.','Aviso',mtInformation,[mbOk],0);
        End
        Else MsgDlg('Lançamento contábil será realizado o código DIFERENTE do previdenciário.','Aviso',mtInformation,[mbOk],0);
      End;
   End;
   // Gleyber - 28/02/2007 - Pendência 24516 - Fim

   if Trim(sIdPlanPrevContab) = '' then sIdPlanPrevContab := IntToStr(piIdPlanoPrev);

   if Trim(sDataBoleta) <> '' Then
     sDataVencimento := sDataBoleta
   else
     if Trim(qryEnvio.FieldByName('DATAPREVISAORECE').AsString) <> '' Then
       sDataVencimento := qryEnvio.FieldByName('DATAPREVISAORECE').AsString
     else
       //sDataVencimento := DateToStr(date);                  //ClaudioR - 19962 - 16/08/2007 
       sDataVencimento := FormatDateTime('dd/mm/yyyy', date); //ClaudioR - 19962 - 16/08/2007

   { Augusto 11/07/2006 - Caso a data informada na tela do envio ou apurada na rotina }
   { seja maior que a atual usar a data atual.                                        }
   //if StrToDate(sDataVencimento) > Date then sDataVencimento := DateToStr( Date );                    //ClaudioR - 19962 - 16/08/2007
   if StrToDate(sDataVencimento) > Date then sDataVencimento   := FormatDateTime('dd/mm/yyyy', Date );  //ClaudioR - 19962 - 16/08/2007

   // CAMILLE - 22.03.2004
   if Trim(sPLACONTAD) = ''
   then begin
      sMsgErro := 'Conta Contábil para Envio para CAP/CAR não parametrizada.';
      Exit;
   end;

   // CAMILLE - 31.03.2004
   // Correção no tratamento para contabilizar contribuicao de mantido no
   // envio ou no recebimento
   // Se a pessoa é mantida e contabilizar no recebimento
   // Entao o placonta a passar para o Documento.Inserir é a PLACONTAC
   // Senao o placonta a passar para o Documento.Inserir é a PLACONTAD
   if  (psFlgSitPart = 'MA') and (not bContabilizaNoEnvio)
   then begin
       sPlaContaAGravarNoDocumento := sPlaConta
   end
   else sPlaContaAGravarNoDocumento := sPlaContaD;
   // FIM - CAMILLE - 31.03.2004


   // Se a pessoa (favorecido/cliente) for a própria fundacao,
   // apenas contabilizar. Não enviar para o CAR/CAP
   if ((piIdPessoa <> iIdFundacao)
       or ((piIdPessJur = iIdFundacao) and  prmIntegraFundacao)) //leofuncef - 11042005
   then begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT DEBCRE FROM TIPODOCRECPAG '+
                     ' WHERE  CODTIPDOC = '''+sCodTipDoc+'''');
      qryAux.Open;
      if not qryAux.IsEmpty
      then sDebCre := qryAux.FieldByName('DebCre').AsString
      else sDebCre := 'C';

      // funcao para buscar tipo cli/for por situacao
      // Se cobranca -> cliente ,
      // Se Devolucao -> fornecedor
      iIdRamoForCli := BuscaRamoForCli(psFlgSitPart, cRecPag);

      if cRecPag = 'R'
      then begin
         // Criar Cliente
         try
           // CAMILLE - 08.10.2004
           Ctrldocumento.ForCli.Inserir( piIdPessoa,                  // liIdPessoa
                                         Sistema.IdEmpresa,           // liIdEmpresa
                                         -1,                          // liCodSubConta
                                         IntegraBack.Plano,           // liPlano
                                         prmIdRamoTipoCliPatro,       // liIdRamoTipoCli
                                         sCodCentroCusto,             // sCCusto
                                         '',                          // sContaCAdianto
                                         sPlaContaAGravarNoDocumento, // sContaCForCli
                                         '',                          // sContaCDespesa
                                         tfcCliente);                 // TipoForCli = (tfcFornecedor, tfcCliente)

         except
            sMsgErro := 'Erro na criação do Cliente no Contas a Receber';
            Exit;
         end;
      end
      else begin
         // Criar Fornecedor
         try
           // CAMILLE - 08.10.2004
           Ctrldocumento.ForCli.Inserir( piIdPessoa,                  // liIdPessoa
                                         Sistema.IdEmpresa,           // liIdEmpresa
                                         -1,                          // liCodSubConta
                                         IntegraBack.Plano,           // liPlano
                                         iIdRamoForCli,               // liIdRamoTipoCli
                                         sCodCentroCusto,             // sCCusto
                                         '',                          // sContaCAdianto
                                         sPlaContaAGravarNoDocumento, // sContaCForCli
                                         '',                          // sContaCDespesa
                                         tfcFornecedor);              // TipoForCli = (tfcFornecedor, tfcCliente)
         except
            sMsgErro := 'Erro na criação do Favorecido no Contas a Pagar';
            Exit;
         end;

      end;


      // Inicio Augusto 21/06/2005 - Buscar IDCONTABANCARIA preferencial
      iIdCBancaria := 0;
      If FazQuery(QryAux,'SELECT IDCBANCARIA FROM CONTABANCARIA WHERE IDPESSOA = '+IntToStr(piIdPessoa)+' '+
                         ' AND FLGCONTAPREF = 1 ')
      Then Begin
        iIdCBancaria := qryaux.fieldbyname('IDCBANCARIA').AsInteger;
      End;
      // Fim Augusto 21/06/2005


      sDescCobranca := BuscaDescCobranca(piIdContribuicao, piIdPlanoPrev, qryAux);
      if cRecPag = 'P'
      then sDescCobranca := 'Estorno de '+sDescCobranca;
      try
       sDescCobranca := sDescCobranca + Copy('- Inscrição '+qryEnvio.FieldByName('INSCRICAONUMERO').AsString,1,25)
      except
      end;


      AlimentaQryDocumentos( qryDocumentos, -1, -1,
                             IntegraBack.Plano,
                             StrToInt(OraNumero(sUnidNegoc)),
                             sPlaContaAGravarNoDocumento,
                             sCodCentroRespon,
                             sCodTipRecDes,
                             qryEnvio.FieldByName('VALORESPERADO').asFloat,
                             qryEnvio.FieldByName('IDPESSJUR').AsInteger,
                             qryEnvio.FieldByName('IDPLANOPREV').AsInteger,
                             qryEnvio.FieldByName('IDCONTRIBUICAO').AsInteger,
                             qryEnvio.fieldbyname('FLGDEVOLUCAO').AsInteger,
                             qryEnvio.fieldbyname('IDPLANPREVCONTAB').AsInteger,
                             qryEnvio.fieldbyname('IDPESSJURCEDIDO').AsInteger);

   end; // if iIdPessoa <> iIdFundacao



   //Result := dValorEnviar;
   Result := qryenvio.FieldByName('ValorEsperado').AsFloat; //leofuncef - 16112005

   if cRecPag = 'R'
   then begin
      sTipoReceita := 'C';
      sTipoDebCre  := 'D';
      sTP01Rec     := '1';
      sTP01Deb     := '0';
   end
   else begin
      sTipoReceita := 'D';
      sTipoDebCre  := 'C';
      sTP01Rec     := '0';
      sTP01Deb     := '1';
   end;

   // Gleyber - 11/01/2006 - Pendência 20769 - Início
   qryAux.Close;
   qryAux.SQL.Clear;
   if Trim(qryEnvio.FieldByName('NumRecebimento').AsString) <> ''
   then qryAux.SQL.Add(
                  ' UPDATE HSTCONTRIBPREV SET CODPORTFORMA = '+ QuotedStr(sCodPortForma)   +', '+
                  '                           DATAEMISSCOB = SYSDATE '+
                  ' WHERE  (NUMRECEBIMENTO  = '+qryEnvio.FieldByName('NumRecebimento').AsString+')'+
                  ' AND    (MESREFERENCIA   = '''+qryEnvio.FieldByName('MesReferencia').AsString+''')'+
                  ' AND    (MESCOBRANCA     = '''+qryEnvio.FieldByName('MesCobranca').AsString+''')'+
                  ' AND    (IDMOTIVO        = '+qryEnvio.FieldByName('IdMotivo').AsString+')')
   else qryAux.SQL.Add(
                  ' UPDATE HSTCONTRIBPREV SET CODPORTFORMA = '+ QuotedStr(sCodPortForma)   +', '+
                  '                           DATAEMISSCOB = SYSDATE '+
                  ' WHERE   IDPESSOA        = '+IntToSTr(qryEnvio.FieldByName('IDPESSOA').AsInteger)+
                  ' AND     SEQPROPOSTA     = '+IntToSTr(qryEnvio.FieldByName('SEQPROPOSTA').AsInteger)+
                  ' AND     MESREFERENCIA   = '''+ qryEnvio.FieldByName('MESREFERENCIA').AsString+''''+
                  ' AND     IDCONTRIBUICAO  = '+IntToSTr(qryEnvio.FieldByName('IDCONTRIBUICAO').AsInteger)+
                  ' AND     IDMOTIVO        = '+IntToSTr(qryEnvio.FieldByName('IDMOTIVO').AsInteger)) ;

   try
      qryAux.ExecSQL;
   except
      sMsgErro := 'Erro na atualização do documento no histórico de contribuição';
      Exit;
   end;
   // Gleyber - 11/01/2006 - Pendência 20769 - Fim

   // ********************************************************************************************
   //                                  PROCESSAR CONTABILIZACAO
   // ********************************************************************************************
   // CONTABILIZAR CRÉDITO

   //leocm - 14112002 - inicio
   if not ((psFlgSitPart = 'MA') and (not bContabilizaNoEnvio)) then
   begin
      try
         FazerInsertContab( qryContabil,
                            sPlaConta,
                            sCodCentroCusto,
                            sTipoReceita,
                            sTP01Rec,
                            sNoDocumento,
                            sHistCre,
                            'Referente ao Mês '+ sAnoMesReferencia ,
                            Copy('Inscrição '+qryEnvio.FieldByName('INSCRICAONUMERO').AsString,1,40),'','',
                            StrToInt(sCodUnidNegoc),
                            iCodSubConta,
                            dValorEnviar,
                            0,
                            //date, // 05.02.2001 - a data da contabilização cai na contabilidade da data atual
                            StrToDate(sDataVencimento),//leofuncef - 18052005
                            sTipCodigo,
                            piIdPessJur,
                            StrToInt(sIdPlanPrevContab) );
      except
         sMsgErro := 'Erro ao contabilizar crédito.';
         Exit;
      end;


      // CONTABILIZAR DÉBITO
      try
         FazerInsertContab( qryContabil,
                            sPlaContaD,
                            sCodCentroCusto,
                            sTipoDebCre,
                            sTP01Deb,
                            sNoDocumento,
                            sHistDeb,
                            'Referente ao Mês '+ sAnoMesReferencia ,
                            Copy('Inscrição '+qryEnvio.FieldByName('INSCRICAONUMERO').AsString,1,40),'','',
                            StrToInt(sCodUnidNegoc),
                            iCodSubConta,
                            dValorEnviar,
                            0,
                            //date, // 05.02.2001 - a data da contabilização cai na contabilidade da data atual
                            StrToDate(sDataVencimento),//leofuncef - 18052005
                            sTipCodigo,
                            piIdPessJur,
                            StrToInt(sIdPlanPrevContab) );
      except
         sMsgErro := 'Erro ao contabilizar débito.';
         Exit;
      end;


   end;
   //leocm - 14112002 - fim

   // ********************************************************************************************
   //                                  FIM DA CONTABILIZACAO
   // ********************************************************************************************

end; // EnviaContribuicaoBANCO



//leofuncef - 08122005 - cópia da função feita antes de alterações
{function EnviaContribuicaoBANCO (qryContabil           : TwwQuery;
                                 qryDocumentos         : TwwQuery;
                                 qryEnvio              : TwwQuery;
                                 qryAux                : TwwQuery;
                                 sMes                  : string;
                                 sAnoMesReferencia     : string;
                                 sHistDeb              : string;
                                 sHistCre              : string;
                                 sDataBoleta           : string;
                                 piIdPessJur           : longint;
                                 piIdPlanoPrev         : longint;
                                 piIdPessoa            : longint;
                                 piIdContribuicao      : longint;
                                 piUltimaContrib       : longint;
                                 CtrlDocumento         : TCtrlDocumento; // CAMILLE - 08.10.2004
                                 psFlgPagador          : string;
                                 psFlgSitPart          : string;
                                 piCodPortForma        : longint;
                                 cRecPag               : char;
                                 dValorEnviar          : double;
                             var sMsgErro              : string;
                             var iCodLancCAPCAR        : longint;
                             var iPlnCodigo            : longint;
                                 psObservacao          : string = '' ) : real;
var iCodSubConta,
    iNumLancto, iIdCBancaria,
    iIdRamoForCli                        : longint;

    sAux1, sAux2,
    sCodCentroCusto,
    sPlaConta,        sPlaContaD,
    sCodTipDoc,
    sCodTipRecDes,    sCodCentroRespon,
    sCodUnidNegoc,    sCodSubconta,
    sDebCre,          sCodPortForma,
    sNoDocumento,     sTipCodigo,
    sComplDocumento,  sDescCobranca,
    sDataVencimento,  sTipoReceita,
    sTipoDebCre    ,  sTP01Rec,   sTP01Deb,
    sIdPlanPrevContab,
    sAnoMesCobranca                      : string;
    bEmisBloq,
    bAchouMesCobranca , bInsereDoc                             : boolean;
    bContabilizaNoEnvio : Boolean; // CAMILLE - 31.03.2004
    iCodForma    : longint; // CAMILLE - 10.03.2004
    iPrograma    : longint;
    sPlaContaAGravarNoDocumento : string; // CAMILLE - 31.03.2004
    sEmisBloq : string; // CAMILLE - 08.10.2004
    dTotalDocumento : double; // CAMILLE - 11.08.2004
    sDataLancto : String; //Bruno Bastos - Pend. 20596 - 27/10/2005

begin
   if dValorEnviar <= 0 then
   begin
      Result := 0;
      exit;
   end;

   if UpperCase(Sistema.NomeUsuario) = 'SUPER'
   then begin
      sMsgErro := 'Não é permitido fazer operações financeirias com o usuário SUPER.';
      Result   := -1;
      Exit;
   end;

   // Inicializar variaveis
   Result       := -1;
   sMsgErro     := '';
   iCodSubConta := -1;

   if sMes = '13'
   then sMes := Copy(DateToStr(date),4,2);

   if psFlgPagador <> 'C'
   then begin
      piIdPessoa := piIdPessJur;
      bEmisBloq  := False; // para nao emitir boleto
   end
   else bEmisBloq := True;

   // CAMILLE - 28.10.2004
   // GRAVAR EMISBLOQ SEMPRE COMO NÃO
   bEmisBloq  := False; // para nao emitir boleto
   sEmisBloq  := 'N';

   //leocm - 14112002 - inicio
   VerificaContabMantidoNoEnvio(qryaux,bContabilizaNoEnvio,piIdPlanoPrev);
   //leocm - 14112002 - fim


   //verificar se a pessoa/idforcli já existe, se sim repetir o coddocumento
   //se não Gerar codigo do documento
   bInsereDoc := false;
   if iCodLancCAPCAR <= 0 then
   begin
      // iCodLancCAPCAR := Documento.GetCodigo(qryAux);     // CAMILLE - 08.10.2004
      iCodLancCAPCAR := Ctrldocumento.GetSequenceDocumento; // CAMILLE - 08.10.2004
      bInsereDoc := true;
   end;

   if iCodLancCAPCAR <= 0
   then begin
      sMsgErro := 'Erro ao gerar número do documento.'; // CAMILLE - 30.06.2004
      Exit;
   end;


   // Buscar informacoes necessárias nas diversas tabelas da hierarquia
   sNoDocumento    := qryEnvio.FieldByName('NumRecebimento').AsString;
   sComplDocumento := sMes;


   BuscaInfFinancContrib(sAux1, sAux2, sCodCentroCusto,'CODCENTROCUSTOD', // CAMILLE - 22.03.2004
                       qryEnvio.FieldByName('CODCENTROCUSTOD').AsString,
                       'S',
                       piIdPessJur, piIdPlanoPrev,  piIdContribuicao,
                       piUltimaContrib, piIdPessoa );

   BuscaInfFinancContrib(sAux1, sAux2, sPlaConta,'PLACONTAC',
                       qryEnvio.FieldByName('PLACONTAC').AsString,
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib, piIdPessoa );

   BuscaInfFinancContrib(sAux1, sAux2, sPlaContaD,'PLACONTADBANCO',
                       qryEnvio.FieldByName('PLACONTADBANCO').AsString,
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib, piIdPessoa );


   //leocbs - 2011 - inicio
   //se for devolução então credita na conta de devolução e
   //debita da conta de crédito normal
   try
      if qryEnvio.fieldbyname('FLGDEVOLUCAO').AsInteger = 1 then
      begin
         sPlaContaD := sPlaConta;
         BuscaInfFinancContrib(sAux1, sAux2, sPlaConta,'PLACONTADEVOL',
                       qryEnvio.FieldByName('PLACONTADEVOL').AsString,
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib, piIdPessoa );
      end;
   except    end;
   //o try except é apenas para não parar com erro processos que não fazem
   //devolução portanto não precisam passar o flgdevolucao
   //leocbs - fim - 2011

   BuscaInfFinancContrib(sAux1, sAux2,sCODSUBCONTA,'CODSUBCONTA',
                        qryEnvio.FieldByName('CODSUBCONTA').AsString,
                        'S',
                        piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                        piUltimaContrib, piIdPessoa );

   if sCodSubConta <> '' Then
      iCodSubConta := strToInt(sCodSubConta);

   sTipCodigo := prmTpOperCobranca;

   if cRecPag = 'R'
   then sCodTipDoc := prmTpDocRRecBanco
   else sCodTipDoc := prmTpDocPEnvioBanco;

   if Trim(sCodTipDoc) = ''
   then begin
      sMsgErro := 'Tipo de Documento não parametrizado.';
      Exit;
   end;

   if piCodPortForma <= 0
   then BuscaInfFinancContrib(sAux1, sAux2, sCodPortForma,'CODPORTFORMA',
                              qryEnvio.FieldByName('CODPORTFORMA').AsString,
                              'N',
                              piIdPessJur, piIdPlanoPrev,  piIdContribuicao,
                              piUltimaContrib, piIdPessoa )
   else sCodPortForma := IntToStr(piCodPortForma);

   // Gleyber - 06/06/2005 - Pendência 18536 - Início
   //if Trim(sCodPortForma) = '' then sCodPortForma := '-1';
   If Trim(sCodPortForma) = ''
    Then Begin
       sMsgErro := 'Portador/Forma de Pagamento não parametrizada.';
       Exit;
    End;
   // Gleyber - 06/06/2005 - Pendência 18536 - Início

   // CAMILLE - 10.03.2004
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT CODFORMA FROM PORTADORFORMA WHERE CODPORTFORMA = '+ClienteNumero(sCodPortForma));
      Open;
      if not IsEmpty
      then iCodForma := FieldByName('CODFORMA').AsInteger
      else iCodForma := -1;
   end;

   if cRecPag = 'R'
   then BuscaInfFinancContrib(sAux1, sAux2, sCodTipRecDes,'CODTIPRECDES',
                       qryEnvio.FieldByName('CODTIPRECDES').AsString,
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib, piIdPessoa )
   else BuscaInfFinancContrib(sAux1, sAux2, sCodTipRecDes,'CODTIPDESEMBDEVOL',
                       qryEnvio.FieldByName('CODTIPDESEMBDEVOL').AsString,
                       'S',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib, piIdPessoa );

   if Trim(sCodTipRecDes) = ''
   then begin
      if cRecPag = 'R'
      then sMsgErro := 'Tipo de Recebimento não parametrizado.'
      else sMsgErro := 'Tipo de Desembolso não parametrizado.';

      Exit;
   end;

   // Se nao obriga centro respon, obrigatoriamente temos que usar
   // o centro respon cadastrado no global, senao, podemos buscar um
   // especifica. Caso nao encontre, tambem podemos usar o global
   if IntegraBack.ObrigaCRespon = 'N'
   then sCodCentroRespon := prmCodCentroRespon
   else begin
      BuscaInfFinancContrib(sAux1, sAux2, sCodCentroRespon,'CODCENTRORESPON',
                            qryEnvio.FieldByName('CODCENTRORESPON').AsString,
                            'S',
                            piIdPessJur, piIdPlanoPrev,  piIdContribuicao,
                            piUltimaContrib, piIdPessoa );
      if Trim(sCodCentroRespon) = ''
      then sCodCentroRespon := prmCodCentroRespon;
   end;

   // Se nao obriga atividade, obrigatoriamente temos que usar
   // a atividade cadastrada no global, senao, podemos buscar uma
   // especifica. Caso nao encontre, tambem podemos usar a global
   if IntegraBack.ObrigaAbc = 'N'
   then sCodUnidNegoc := IntToStr(prmUnidNegoc)
   else begin
      BuscaInfFinancContrib(sAux1, sAux2, sCodUnidNegoc,'UNIDNEGOC',
                          qryEnvio.FieldByName('UNIDNEGOC').AsString,
                          'N',
                          piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                          piUltimaContrib, piIdPessoa );
      if Trim(sCodUnidNegoc) = ''
      then sCodUnidNegoc := IntToStr(prmUnidNegoc);
   end;

   BuscaInfFinancContrib(sAux1, sAux2, sIdPlanPrevContab,'IDPLANPREVCONTAB',
                       qryEnvio.FieldByName('IDPLANPREVCONTAB').AsString,
                       'N',
                       piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                       piUltimaContrib, piIdPessoa );

   if Trim(sIdPlanPrevContab) = '' then sIdPlanPrevContab := IntToStr(piIdPlanoPrev);

   if Trim(sDataBoleta) <> ''
   then sDataVencimento := sDataBoleta
   else if Trim(qryEnvio.FieldByName('DATAPREVISAORECE').AsString) <> ''
        then sDataVencimento := qryEnvio.FieldByName('DATAPREVISAORECE').AsString
        else sDataVencimento := DateToStr(date);


   // CAMILLE - 22.03.2004
   if Trim(sPLACONTAD) = ''
   then begin
      sMsgErro := 'Conta Contábil para Envio para CAP/CAR não parametrizada.';
      Exit;
   end;

   // CAMILLE - 31.03.2004
   // Correção no tratamento para contabilizar contribuicao de mantido no
   // envio ou no recebimento
   // Se a pessoa é mantida e contabilizar no recebimento
   // Entao o placonta a passar para o Documento.Inserir é a PLACONTAC
   // Senao o placonta a passar para o Documento.Inserir é a PLACONTAD
   if  (psFlgSitPart = 'MA') and (not bContabilizaNoEnvio)
   then begin
       sPlaContaAGravarNoDocumento := sPlaConta
   end
   else sPlaContaAGravarNoDocumento := sPlaContaD;
   // FIM - CAMILLE - 31.03.2004

   // Se a pessoa (favorecido/cliente) for a própria fundacao,
   // apenas contabilizar. Não enviar para o CAR/CAP
   if ((piIdPessoa <> iIdFundacao)
       or ((piIdPessJur = iIdFundacao) and  prmIntegraFundacao)) //leofuncef - 11042005
   then begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT DEBCRE FROM TIPODOCRECPAG '+
                     ' WHERE  CODTIPDOC = '''+sCodTipDoc+'''');
      qryAux.Open;
      if not qryAux.IsEmpty
      then sDebCre := qryAux.FieldByName('DebCre').AsString
      else sDebCre := 'C';

      // funcao para buscar tipo cli/for por situacao
      // Se cobranca -> cliente ,
      // Se Devolucao -> fornecedor
      iIdRamoForCli := BuscaRamoForCli(psFlgSitPart, cRecPag);

      if cRecPag = 'R'
      then begin
         // Criar Cliente
         try
           // CAMILLE - 08.10.2004
           Ctrldocumento.ForCli.Inserir( piIdPessoa,                  // liIdPessoa
                                         Sistema.IdEmpresa,           // liIdEmpresa
                                         -1,                          // liCodSubConta
                                         IntegraBack.Plano,           // liPlano
                                         prmIdRamoTipoCliPatro,       // liIdRamoTipoCli
                                         sCodCentroCusto,             // sCCusto
                                         '',                          // sContaCAdianto
                                         sPlaContaAGravarNoDocumento, // sContaCForCli
                                         '',                          // sContaCDespesa
                                         tfcCliente);                 // TipoForCli = (tfcFornecedor, tfcCliente)




         except
            sMsgErro := 'Erro na criação do Cliente no Contas a Receber';
            Exit;
         end;
      end
      else begin
         // Criar Fornecedor
         try
           // CAMILLE - 08.10.2004
           Ctrldocumento.ForCli.Inserir( piIdPessoa,                  // liIdPessoa
                                         Sistema.IdEmpresa,           // liIdEmpresa
                                         -1,                          // liCodSubConta
                                         IntegraBack.Plano,           // liPlano
                                         iIdRamoForCli,               // liIdRamoTipoCli
                                         sCodCentroCusto,             // sCCusto
                                         '',                          // sContaCAdianto
                                         sPlaContaAGravarNoDocumento, // sContaCForCli
                                         '',                          // sContaCDespesa
                                         tfcFornecedor);              // TipoForCli = (tfcFornecedor, tfcCliente)


         except
            sMsgErro := 'Erro na criação do Favorecido no Contas a Pagar';
            Exit;
         end;

      end;


      //LEOFUNCEF - 22092005 - COMENTEI GERAÇÃO DE OUTRO DOC PARA CONTAS DE BAIXA DIFERENTES

      // LEOCM - 12.09.2003 - inicio
      // Verificar se a pessoa/idforcli já existe, se sim repetir o coddocumento
      // Senao Gerar codigo do documento
      // Neste ponto se iCodLancCAPCAR >0 quer dizer
      // que está-se no envio de um mesmo participante em um mesmo mês
      // mas, caso a conta seja diferente um novo documento deve ser criado
      //if (not bInsereDoc) and ( iCodLancCAPCAR > 0) then
      //begin
      //   //verificar se a conta é a mesma
      //   //caso não inserir outro documento
      //   qryAux.Close;
      //   qryAux.SQL.Clear;
      //   qryAux.SQL.Add(' SELECT PLACONTA FROM DOCUMENTO '+
      //                  ' WHERE  CODDOCUMENTO = '''+inttostr(iCodLancCAPCAR)+'''');
      //   qryAux.Open;
      //   if not qryAux.IsEmpty then
      //      if trim(qryaux.fieldbyname('PLACONTA').AsString) <>  sPlaContaAGravarNoDocumento // CAMILLE - 31.03.2004
      //      then begin
      //         // iCodLancCAPCAR := Documento.GetCodigo(qryAux);     // CAMILLE - 08.10.2004
      //         iCodLancCAPCAR := CtrlDocumento.GetSequenceDocumento; // CAMILLE - 08.10.2004
      //         bInsereDoc := true;
      //      end;
      //end;
      //leocm - 1209 - fim

      // Inicio Augusto 21/06/2005 - Buscar IDCONTABANCARIA preferencial
      iIdCBancaria := 0;
      If FazQuery(QryAux,'SELECT IDCBANCARIA FROM CONTABANCARIA WHERE IDPESSOA = '+IntToStr(piIdPessoa)+' '+
                         ' AND FLGCONTAPREF = 1 ')
      Then Begin
        iIdCBancaria := qryaux.fieldbyname('IDCBANCARIA').AsInteger;
      End;
      // Fim Augusto 21/06/2005

      try
         CtrlDocumento.Prepare(OpDocumento, odlEfetivo);   // CAMILLE - 08.10.2004
         CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso; // CAMILLE - 08.10.2004
         CtrlDocumento.IdUsuario   := Sistema.IdUsuario;   // CAMILLE - 08.10.2004
         CtrlDocumento.SetValues( iCodLancCAPCAR,              // CodDocumento
                                  StrToFloat(sNoDocumento),    // NoDocumento
                                  sComplDocumento,             // ComplDocumento
                                  '0',                         // sStatus
                                  cRecPag,                     // RecPag
                                  '2',                         // sOperacao
                                  '',                          // sNumslip
                                  '',                          // sNumleitcodbarras
                                  sPlaContaAGravarNoDocumento, // PlaConta
                                  sCodCentroCusto,             // CodCentroCusto
                                  '',                          // NossoNumero
                                  '',                          // NumDigCodBarras
                                  '',                          // GrupoDoc
                                  '',                          // sFlgemitelancbaix
                                  'N',                         // sFlgconfirmarecpag
                                  sEmisbloq,                   // EmisBloq
                                  '',                          // Referencia
                                  psObservacao,                // Obs
                                  StrToDate(sDataVencimento),  // DataVencto
                                  Date,                        // DataEmissao
                                  StrToDate(sDataVencimento),  // DataProgramada
                                  0,                           // DataRemessa
                                  0,                           // DataLimite
                                  0,                           // DataCorrecao
                                  0,                           // rVlrMulta
                                  0,                           // rValorJuros
                                  0,                           // rValorDesconto
                                  0,                           // rPercJurosSimples
                                  0,                           // rPercJurosAtuarial
                                  StrToInt(sCodTipDoc),        // CodTipDoc
                                  Sistema.IdEmpresa,           // IdPessoa
                                  Sistema.IdModulo,            // IdModulo
                                  piIdPessoa,                  // ldForCli
                                  0,                           // NumFatura
                                  iIdCBancaria,                // IdCBancaria
                                  0,                           // UnidNegoc
                                  IntegraBack.Plano,           // Plano
                                  0,                           // NumCPBaixa
                                  0,                           // NumAPGr
                                  0,                           // Moecodigo
                                  0,                           // LoteTransmissao
                                  0,                           // IndiceCorrecao
                                  Sistema.IdUsuario,           // IdUsuarioInclusao
                                  Sistema.IdEmpresa,           // IdEmpresa
                                  1,                           // Flgnaoconciliado
                                  0,                           // Controleremess,
                                  0,                           // Codsubconta
                                  StrToInt(sCodPortForma),     // Codportforma
                                  0,                           // Codgrupocnab
                                  0,                           // CodGeradorINSS
                                  iCodForma,                   // Codforma
                                  -1                           // iIdSegregaCriter
                                );

      except
         if cRecPag = 'R'
         then sMsgErro := 'Erro na criação do Documento no Contas a Receber'
         else sMsgErro := 'Erro na criação do Documento no Contas a Pagar';
         Exit;
      end;

      // CAMILLE - 08.10.2004
      // o codigo abaixo foi substituido pela parametrizacao da variaval semisbloq
      // antes da chamada da ctrldocumento.setvalues
      //if cRecPag = 'R'
      //then begin
      //   // Atualizar documento com EMISBLOQ = N para emitir boleta direto,
      //   // sem ter que entrar em tela individual
      //   try
      //      qryAux.Close;
      //      qryAux.SQL.Clear;
      //      qryAux.SQL.Add(' UPDATE DOCUMENTO SET EMISBLOQ = ''N'' '+
      //                     ' WHERE  CODDOCUMENTO = '+IntToSTr(iCodLancCAPCAR));
      //      qryAux.ExecSQL;
      //   except
      //      sMsgErro := 'Erro na atualização do Documento no Contas a Receber';
      //      Exit;
      //   end;
      //end;


      sDescCobranca := BuscaDescCobranca(piIdContribuicao, piIdPlanoPrev, qryAux);
      if cRecPag = 'P'
      then sDescCobranca := 'Estorno de '+sDescCobranca;
      try
       sDescCobranca := sDescCobranca + Copy('- Inscrição '+qryEnvio.FieldByName('INSCRICAONUMERO').AsString,1,25)
      except
      end;

      // CAMILLE - 08.11.2004 - INICIO
      // Se for alterar o documento, inserir novamente todos os rateios
      dTotalDocumento := 0;  // CAMILLE - 11.08.2004
      if not bInsereDoc
      then begin
         with dtmAPrev.qryRateio do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT CODCENTROCUSTO,  CODCENTRORESPON, CODDOCUMENTO,     '+
                    '        CODTIPRECDES,    IDEMPRESA,       IDPATRO,          '+
                    '        IDPESSOA,        IDPLANOPREV,     IDPROCESSO,       '+
                    '        IDPROGRAMA,      IDRATEIODOCUM,   IDRESERVAORCAMEN, '+
                    '        LOTETRANSMISSAO, MOECODIGO,       PLANO,            '+
                    '        RECPAG,          UNIDNEGOC,       VALOR,            '+
                    '        VALOROUTRAMOEDA, VLRRESORCAMEN                      '+
                    ' FROM   RATEIODOCUM                                         '+
                    ' WHERE  CODDOCUMENTO = '+IntToStr(iCodLancCAPCAR)           );
            Open;
            First;
            while not Eof do
            begin
               //leofuncef - 16112005
               dTotalDocumento := dTotalDocumento + FieldByName('VALOR').AsFloat;
               //else dTotalDocumento := dTotalDocumento - FieldByName('VALOR').AsFloat;
               Next;
            end;
         end;
      end;


      //leofuncef - 16112005
      if qryenvio.FieldByName('FlgDevolucao').AsInteger = 1 then
      dValorEnviar := qryenvio.FieldByName('ValorEsperado').AsFloat * -1
      else dValorEnviar := qryenvio.FieldByName('ValorEsperado').AsFloat;
      //leofuncef - 16112005


      //leofuncef - 05012005
      if  (dTotalDocumento > 0) and (cRecPag = 'R') then //doc a receber, lançamento de recebimento
          dTotalDocumento := dTotalDocumento + dValorEnviar
      else if (dTotalDocumento > 0) and (cRecPag = 'P') then //doc a receber, lançamento de pagamento
          dTotalDocumento := dTotalDocumento - dValorEnviar
      else if (dTotalDocumento < 0) and (cRecPag = 'P') then //doc a pagar, lançamento de pagamento
          dTotalDocumento := dTotalDocumento - dValorEnviar
      else if (dTotalDocumento < 0) and (cRecPag = 'P') then //doc a pagar, lançamento de recebimento
          dTotalDocumento := dTotalDocumento + dValorEnviar
      else dTotalDocumento := dTotalDocumento + dValorEnviar;

      dTotalDocumento := Abs(dTotalDocumento);
      //leofuncef - 05012005 - fim

      // CAMILLE - 08.11.2004 - FIM


      try
         if bInsereDoc
         then iNumLancto := 0
         else begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQl.Add(' SELECT NUMLANCTO FROM LANCTODOCUM WHERE  CODDOCUMENTO = '+IntToStr(iCodLancCAPCAR) );
            qryAux.Open;
            if not qryAux.IsEmpty
            then iNumLancto := qryAux.FieldByName('NUMLANCTO').AsInteger
            else begin
               iNumLancto := 0;
               bInsereDoc := True;
            end;
         end;

         //Bruno Bastos - Pend. 20596 - 27/10/2005 - Início
         sDataLancto := DateToStr(date);
         if StrToDate(sDataVencimento) < date then
           sDataLancto := sDataVencimento;
         //Bruno Bastos - Pend. 20596 - 27/10/2005 - Fim

            // CAMILLE - 08.10.2004
            CtrlDocumento.LanctoDocum.SetValues( //Date,                 // DataLancto
                                                 //Bruno Bastos - Pend. 20596 - 27/10/2005 - StrToDate(sDataVencimento), //leofuncef - 21092005
                                                 StrToDate(sDataLancto), //Data Lancto //Bruno Bastos - Pend. 20596 - 27/10/2005
                                                 iCodLancCAPCAR,         // CodDocumento
                                                 iNumLancto,             // Numlancto
                                                 dTotalDocumento,        // Vlrliquido
                                                 0,                      // ValorOM
                                                 dTotalDocumento,        // Valor
                                                 0,                     // Unidnegoc
                                                 iPlnCodigo,             // liPlncodigo
                                                 0,                     // Numlotemanual
                                                 Sistema.IdUsuario,      // Idusuarioinclusao
                                                 Sistema.IdEmpresa,      // Idpessoa
                                                 0,                     // Idnflivro,
                                                 0,                     // Estorno
                                                 0,                     // Codtipdoc
                                                 0,                     // Coddocinss
                                                 0,                     // Codalterador
                                                 '2',                    // Operacao
                                                 '',                     // NumRecibo
                                                 '',                     // Numnf
                                                 '',                     // Numfatura
                                                 sDescCobranca,          // Historicocompl
                                                 '',                     // Flgtipofatura
                                                 'N',                    // Flgrecebeunf
                                                 '',                     // Flgfatemitida
                                                 sDebCre,                // Debcre
                                                 Sistema.IdModulo,       // IdModulo
                                                 IntegraBack.Plano,      // PlanoConta
                                                 True,                   // UsaPlanoPatro
                                                 False,                  // Contabiliza
                                                 0,                     // iCodPortForma
                                                 0,                      // DiasFloat
                                                 '',                     // ContaBaixa
                                                 0                       // SubContaBaixa
                                                );

         //end
         //else begin
         //   qryaux.close;

      except
         if cRecPag = 'R'
         then sMsgErro := 'Erro na Geração do Lançamento do Documento no Contas a Receber.'
         else sMsgErro := 'Erro na Geração do Lançamento do Documento no Contas a Pagar.';
         Exit;
      end;

      // CAMILLE - 22.03.2004
      // SE TIVER CENTRO DE CUSTO PREENCHIDO, BUSCAR O PROGRAMA DO CENTRO DE CUSTO
      iPrograma := -1;
      if Trim(sCodCentroCusto) <> ''
      then begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT IDPROGRAMA FROM CENTCUST WHERE CODCENTROCUSTO = '''+sCodCentroCusto+'''');
         qryAux.Open;
         if (not qryAux.IsEmpty) and (qryAux.FieldByName('IDPROGRAMA').AsInteger > 0)
         then iPrograma := qryAux.FieldByName('IDPROGRAMA').AsInteger;
      end;


      try


         // CAMILLE - 08.11.2004
         // INSERIR RATEIOS ANTIGOS
         if not bInsereDoc
         then begin
            with dtmAPrev.qryRateio do
            begin
               First;
               while not Eof do
               begin
                  CtrlDocumento.RateioDocum.SetValues ( FieldByName('VALOR').AsFloat,            // Valor
                                                        0,                                       // ValorOM
                                                        0,                                       // Vlrresorcamen
                                                        0,                                       // Idrateiodocum
                                                        Sistema.IdEmpresa,                       // Idpessoa
                                                        iCodLancCAPCAR,                          // Coddocumento
                                                        FieldByName('UNIDNEGOC').AsInteger,      // Unidnegoc
                                                        0,                                       // Moecodigo,
                                                        Sistema.IdUsuario,                       // Idusuarioinclusao
                                                        0,                                       // Idreservaorcamen
                                                        IntegraBack.Plano,                       // Plano
                                                        FieldByName('IDPLANOPREV').AsInteger,    // Idplanoprev
                                                        FieldByName('IDPATRO').AsInteger,        // Idpatro
                                                        FieldByName('IDPROGRAMA').AsInteger,     // Idprograma
                                                        0,                                       // Idprocesso
                                                        Sistema.IdEmpresa,                       // IdEmpresa
                                                        FieldByName('CODTIPRECDES').AsString,    // Codtiprecdes
                                                        FieldByName('RECPAG').AsString,          // Recpag
                                                        FieldByName('CODCENTRORESPON').AsString, // Codcentrorespon
                                                        FieldByName('CODCENTROCUSTO').AsString,  // Codcentrocusto
                                                        ''                                       // Numimovel
                                                       );

                  Next;
               end;
            end;
         end;

         CtrlDocumento.RateioDocum.SetValues ( dValorEnviar,                // Valor
                                               0,                           // ValorOM
                                               0,                           // Vlrresorcamen
                                               0,                           // Idrateiodocum
                                               Sistema.IdEmpresa,           // Idpessoa
                                               iCodLancCAPCAR,              // Coddocumento
                                               StrToInt(sCodUnidNegoc),     // Unidnegoc
                                               0,                           // Moecodigo,
                                               Sistema.IdUsuario,           // Idusuarioinclusao
                                               0,                           // Idreservaorcamen
                                               IntegraBack.Plano,           // Plano
                                               StrToInt(sIdPlanPrevContab), // Idplanoprev
                                               piIdPessJur,                 // Idpatro
                                               iPrograma,                   // Idprograma
                                               0,                           // Idprocesso
                                               Sistema.IdEmpresa,           // IdEmpresa
                                               sCodTipRecDes,               // Codtiprecdes
                                               cRecPag,                     // Recpag
                                               sCodCentroRespon,            // Codcentrorespon
                                               sCodCentroCusto,             // Codcentrocusto
                                               ''                           // Numimovel
                                              );

      except
         raise;
         //leorefer - 11/10 - inicio
         if cRecPag = 'R'
         then sMsgErro := 'Falta parametrização -  Erro na Geração do Lançamento do Documento no Contas a Receber.'
         else sMsgErro := 'Falta parametrização -  Erro na Geração do Lançamento do Documento no Contas a Pagar.';
         Exit;
         //leorefer - 11/10 - fim
      end;

      if bInsereDoc
      then begin
         if not CtrlDocumento.Insert
         then begin
            sMsgErro := 'Erro ao inserir documento['+CtrlDocumento.MessageInfo+'].';
            Exit;
         end;
         iNumLancto := CtrlDocumento.Lanctodocum.NumLancto; // CAMILLE - 08.10.2004
      end
      else begin
         if not CtrlDocumento.Update // CAMILLE(2) - 28.10.2004
         then begin
            sMsgErro := 'Erro ao alterar documento['+CtrlDocumento.MessageInfo+'].';
            Exit;
         end;

         iNumLancto := CtrlDocumento.Lanctodocum.NumLancto; // CAMILLE - 08.10.2004
      end;


      // CBS - 06.08.2001
      // Se encontrou o mescobranca, fazer o update pela chave. Senao, fazer pelo mesreferencia
      bAchouMesCobranca := True;
      try
         sAnoMesCobranca := qryEnvio.FieldByName('MESCOBRANCA').AsString
      except
         bAchouMesCobranca := False;
      end;

      qryAux.Close;
      qryAux.SQL.Clear;

      if bAchouMesCobranca
      then qryAux.SQL.Add(
                     ' UPDATE HSTCONTRIBPREV SET CODDOCUMENTOPREV = '+IntToStr(iCodLancCAPCAR)+', '+
                     '                           CODPORTFORMA = '+ QuotedStr(sCodPortForma)   +', '+
                     '                           DATAEMISSCOB = SYSDATE '+
                     ' WHERE  (NUMRECEBIMENTO  = '+qryEnvio.FieldByName('NumRecebimento').AsString+')'+
                     ' AND    (MESREFERENCIA   = '''+qryEnvio.FieldByName('MesReferencia').AsString+''')'+
                     ' AND    (MESCOBRANCA     = '''+qryEnvio.FieldByName('MesCobranca').AsString+''')'+
                     ' AND    (IDMOTIVO        = '+qryEnvio.FieldByName('IdMotivo').AsString+')')
      else qryAux.SQL.Add(
                     ' UPDATE HSTCONTRIBPREV SET CODDOCUMENTOPREV = '+IntToStr(iCodLancCAPCAR)+', '+
                     '                           CODPORTFORMA = '+ QuotedStr(sCodPortForma)   +', '+
                     '                           DATAEMISSCOB = SYSDATE '+
                     ' WHERE   IDPESSOA        = '+IntToSTr(qryEnvio.FieldByName('IDPESSOA').AsInteger)+
                     ' AND     SEQPROPOSTA     = '+IntToSTr(qryEnvio.FieldByName('SEQPROPOSTA').AsInteger)+
                     ' AND     MESREFERENCIA   = '''+ qryEnvio.FieldByName('MESREFERENCIA').AsString+''''+
                     ' AND     IDCONTRIBUICAO  = '+IntToSTr(qryEnvio.FieldByName('IDCONTRIBUICAO').AsInteger)+
                     ' AND     IDMOTIVO        = '+IntToSTr(qryEnvio.FieldByName('IDMOTIVO').AsInteger)) ;

      try
         qryAux.ExecSQL;
      except
         sMsgErro := 'Erro na atualização do documento no histórico de contribuição';
         Exit;
      end;
   end // if iIdPessoa <> iIdFundacao
   else begin // CAMILLE - 09.07.2004
      iCodLancCapCar := -1;
   end;

   //Result := dValorEnviar;
   Result := qryenvio.FieldByName('ValorEsperado').AsFloat; //leofuncef - 16112005

   if cRecPag = 'R'
   then begin
      sTipoReceita := 'C';
      sTipoDebCre  := 'D';
      sTP01Rec     := '1';
      sTP01Deb     := '0';
   end
   else begin
      sTipoReceita := 'D';
      sTipoDebCre  := 'C';
      sTP01Rec     := '0';
      sTP01Deb     := '1';
   end;

   // ********************************************************************************************
   //                                  PROCESSAR CONTABILIZACAO
   // ********************************************************************************************
   // CONTABILIZAR CRÉDITO

   //leocm - 14112002 - inicio
   if not ((psFlgSitPart = 'MA') and (not bContabilizaNoEnvio)) then
   begin
      try
         FazerInsertContab( qryContabil,
                            sPlaConta,
                            sCodCentroCusto,
                            sTipoReceita,
                            sTP01Rec,
                            sNoDocumento,
                            sHistCre,
                            'Referente ao Mês '+ sAnoMesReferencia ,
                            Copy('Inscrição '+qryEnvio.FieldByName('INSCRICAONUMERO').AsString,1,40),'','',
                            StrToInt(sCodUnidNegoc),
                            iCodSubConta,
                            dValorEnviar,
                            0,
                            //date, // 05.02.2001 - a data da contabilização cai na contabilidade da data atual
                            StrToDate(sDataVencimento),//leofuncef - 18052005
                            sTipCodigo,
                            piIdPessJur,
                            StrToInt(sIdPlanPrevContab) );
      except
         sMsgErro := 'Erro ao contabilizar crédito.';
         Exit;
      end;


      // CONTABILIZAR DÉBITO
      try
         FazerInsertContab( qryContabil,
                            sPlaContaD,
                            sCodCentroCusto,
                            sTipoDebCre,
                            sTP01Deb,
                            sNoDocumento,
                            sHistDeb,
                            'Referente ao Mês '+ sAnoMesReferencia ,
                            Copy('Inscrição '+qryEnvio.FieldByName('INSCRICAONUMERO').AsString,1,40),'','',
                            StrToInt(sCodUnidNegoc),
                            iCodSubConta,
                            dValorEnviar,
                            0,
                            //date, // 05.02.2001 - a data da contabilização cai na contabilidade da data atual
                            StrToDate(sDataVencimento),//leofuncef - 18052005
                            sTipCodigo,
                            piIdPessJur,
                            StrToInt(sIdPlanPrevContab) );
      except
         sMsgErro := 'Erro ao contabilizar débito.';
         Exit;
      end;
   end;
   //leocm - 14112002 - fim

   // ********************************************************************************************
   //                                  FIM DA CONTABILIZACAO
   // ********************************************************************************************

   if ((piIdPessoa <> iIdFundacao)
       or ((piIdPessJur = iIdFundacao) and  prmIntegraFundacao)) //leofuncef - 11042005
   then AlimentaQryDocumentos(qryDocumentos,iCodLancCAPCAR, iNumLancto,-1,-1,'','','',-1, piIdPessJur, piIdPlanoPrev,qryEnvio.FieldByName('IDCONTRIBUICAO').AsInteger,0, strtoint(sIdPlanPrevContab), piIdPessJur);
end; // EnviaContribuicaoBANCO}



function BuscaRamoForCli(psSitFundacao : string; cRecPag : char ) : longint ;
begin
   Result := -1;
   if cRecPag = 'R'
   then begin // Buscar cliente
      if psSitFundacao = 'AT'
      then Result := prmIdRamoTipoCliAtivo
      else if psSitFundacao = 'PT'
      then Result := prmIdRamoTipoCliPatro
      else if (psSitFundacao = 'MA') or (psSitFundacao = 'MS') { Augusto 02/03/2004 }
      then Result := prmIdRamoTipoCliMantido
      else if psSitFundacao = 'MP'
      then Result := prmIdRamoTipoCliMantidoParc
      else if psSitFundacao = 'AS'
      then Result := prmIdRamoTipoCliAssistido;
   end
   else begin // Buscar fornecedor
      if psSitFundacao = 'AT'
      then Result := prmIdRamoTipoForAtivo
      else if psSitFundacao = 'PT'
      then Result := prmIdRamoTipoForPatro
      else if (psSitFundacao = 'MA') or (psSitFundacao = 'MS') { Augusto 02/03/2004 }
      then Result := prmIdRamoTipoForMantido
      else if psSitFundacao = 'MP'
      then Result := prmIdRamoTipoForMantidoParc
      else if psSitFundacao = 'AS'
      then Result := prmIdRamoTipoForAssistido;
   end;
end; // BuscaRamoForCli

function AgrupaBoletasBANCO( CtrlDocumento       : TCtrlDocumento; // CAMILLE - 08.10.2004
                             qry                 : TwwQuery;
                             qryAux              : TwwQuery;
                             lstLotesEnviados    : string;
                             lstNumRecebEnviados : string) : boolean;
var iSeqGrupo, iNumCampos, X    : Integer;
    lValoresGrupo               : TStringList;
    bExisteCampo, bCamposIguais,
    bExistePortFotma            : Boolean;
    sCamposParaGrupo            : Array[0..1] of String;
    sMensagens                  : Array[1..10] of String; // CAMILLE - 08.10.2004 -> A INTBANCO AUMENTOU UMA POSICAO DO VETOR...DE 9 PARA 10
    sFiltro,
    sLinha,
    sMsg                        : string;
    iPos,
    iContLinhas                 : integer;
    iIdContribuicao             : longint;
    // Gleyber - 16/10/2002
    sSalario                    : String;
    qryTst                      : TwwQuery;
    iFlgAgrupaBoleta            : integer; // CAMILLE - 16.06.2004 - 17024
    iProxLinha                  : integer; // CAMILLE - 16.06.2004
    sUltMesLido                 : string;
    bMudouMes                   : boolean;
    bFlgMensagemVerso           : boolean; // CAMILLE - 22.06.2004
    bInsereCabecalhoVerso       : boolean; // CAMILLE - 22.06.2004
    dTotalVerso                 : double;  // CAMILLE - 22.06.2004
    iIdMsgCnab                  : longint; // CAMILLE - 22.06.2004
    sMensagensVerso             : array[1..20] of string;
    iProxColuna                 : integer;
    iUltNumRecebimento          : longint; // CAMILLE - 30.06.2004
    sMesRef                     : String;  // Gleyber - 31/03/2005 - Pendência 18861
begin
   Result := False;

   if (Trim(lstLotesEnviados) = '') and (Trim(lstNumRecebEnviados) = '')
   then begin
      Result := True;
      Exit;
   end;

   if Trim(lstLotesEnviados) <> ''
   then
   begin
      sFiltro := ' HST.IDLOTE IN ('+lstLotesEnviados+') AND HST.IDPESSOA = HST.IDPESSOA '; //leocbs - 3001 - alteração parta atender índice
      sFiltro := sFiltro + ' AND SITRECEBIMENTO IN (0,1,8) '; //LEOCM - 1609 - EVITA QUE REGISTROS JÁ RECEBIDOS SEJAM REENVIADOS
   end
   else sFiltro := ' HST.NUMRECEBIMENTO IN ('+lstNumRecebEnviados+')';

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT DISTINCT HST.CODDOCUMENTOPREV AS CODDOCUMENTO,                        '+
               '        HST.CODPORTFORMA, HST.IDPESSOA,                                       '+
               '        HST.MESREFERENCIA,                                                    '+
               '        HST.MESCOBRANCA,                                                      '+  // CAMILLE - 22.06.2004 - 17024
               '        HST.DATAPREVISAORECE,                                                 '+  // CAMILLE - 22.06.2004 - 17024
               '        NVL(PL.FLGAGRUPABOLETA,0) AS FLGAGRUPABOLETA,                         '+  // CAMILLE - 16.06.2004 - 17024
               '        DECODE(CP.FLGPAGADOR,''C'', HST.IDPESSOA, HST.IDPESSJUR) AS IDFORCLI, '+
               '        NVL(P.FLGMENSAGEMVERSO,0) AS FLGMENSAGEMVERSO,                        '+  // CAMILLE - 22.06.2004 - 17024
               '        FUND.NOME AS NOMEFUNDACAO                                             '+  // CAMILLE - 22.06.2004 - 17024
               ' FROM   PESSOA FUND, HSTCONTRIBPREV HST, DOCUMENTO D, CONTPREV CP,            '+
               '        PLANPREV PL, PORTADORFORMA P                                          '+  // CAMILLE - 22.06.2004 - 17024
               ' WHERE  '+sFiltro                                                              +
               ' AND    NVL(HST.FLGDEVOLUCAO,0)   = 0                                                '+ // CAMILLE - 08.11.2004 - PENDENCIA 17990 
               ' AND    HST.FLGDESCFOLHA   = 0                                                '+  // LEOCM - 24102002 - EVITA QUE PEGUE REGISTROS QUE NÃO VÃO PARA BANCO
               ' AND    HST.IDPLANOPREV    = CP.IDPLANOPREV                                   '+
               ' AND    HST.IDCONTRIBUICAO = CP.IDCONTRIBUICAO                                '+
               ' AND    ( NOT (HST.CODDOCUMENTOPREV IS NULL) )                                '+
               ' AND    PL.IDPLANOPREV = HST.IDPLANOPREV                                      '+  // CAMILLE - 16.06.2004 - 17024
               ' AND    D.CODDOCUMENTO = HST.CODDOCUMENTOPREV                                 '+  // CAMILLE - 22.06.2004 - 17024
               ' AND    P.CODPORTFORMA = D.CODPORTFORMA                                       '+  // CAMILLE - 22.06.2004 - 17024
               ' AND    NVL(P.FLGATIVO, ''S'') = ''S''                                        '+  // Hugo Luna - 23/10/2007 -Pendência 25133
               ' AND    FUND.IDPESSOA  = '+IntToStr(iIdFundacao)                               +  // CAMILLE - 22.06.2004 - 17024
               ' ORDER BY IDFORCLI,  HST.MESREFERENCIA                                        ');
   qry.Open;

   sCamposParaGrupo[0] := 'IDFORCLI';

   // FLGAGRUPABOLETA = 0 -> UMA BOLETA PARA CADA MES DE REFERENCIA
   // FLGAGRUPABOLETA = 1 -> UMA UNICA BOLETA COM TODOS OS MESES DE REFERENCIA
   iFlgAgrupaBoleta    := qry.FieldByName('FLGAGRUPABOLETA').AsInteger;  // CAMILLE - 16.06.2004 - 17024

   if qry.FieldByName('FLGAGRUPABOLETA').AsInteger = 0 // CAMILLE - 16.06.2004 - 17024
   then begin
      sCamposParaGrupo[1] := 'MESREFERENCIA';
      iNumCampos := 1;
   end
   else iNumCampos := 0;

   if qry.FieldByName('FLGMENSAGEMVERSO').AsInteger = 1 // CAMILLE - 22.06.2004 - 17024
   then bFlgMensagemVerso := True
   else bFlgMensagemVerso := False;

   lValoresGrupo := TStringList.Create;

   bExisteCampo := True;
   bInsereCabecalhoVerso := False;

   For X:=0 To iNumCampos Do
   Begin
       bExisteCampo := (Qry.FindField(sCamposParaGrupo[X]) <> nil);
       If Not bExisteCampo Then Break;
   End;

   If (Qry.FindField('CODDOCUMENTO') = nil) Or (Not bExisteCampo)
   Then Result := False
   Else Begin

      bExistePortFotma := (Qry.FindField('CODPORTFORMA') <> nil);

      Qry.First;

      iSeqGrupo := 0;

      bCamposIguais := True;

      For X:=0 To iNumCampos Do
          lValoresGrupo.Add('');

      While Not Qry.Eof Do
      Begin
         bInsereCabecalhoVerso := False; // CAMILLE - 22.06.2004
         For X:=0 To iNumCampos Do
         Begin
             bCamposIguais := (lValoresGrupo[x] = Qry.FieldByName(sCamposParaGrupo[X]).AsString);
             If Not bCamposIguais Then Break;
         End;

         If Not bCamposIguais Then
         Begin
            iSeqGrupo     := LeultRegistro(nil,'GRUPOCNAB');
            bCamposIguais := True;
            bInsereCabecalhoVerso := True; // CAMILLE - 22.06.2004
            dTotalVerso           := 0;    // CAMILLE - 22.06.2004
            iIdMsgCnab            := -1;
            iProxColuna           := 5;
            for x := 1 to 20 do sMensagensVerso[x] := '';
         End;

         // CAMILLE - 16.06.2004 - 17024
         // ATUALIZAR TODOS OS DOCUMENTOS COM O MESMO CODGRUPOCNAB SE FOR PARA AGRUPAR BOLETAS DE
         // MESES DE REFERENCIA DIFERENTES
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE DOCUMENTO SET CODGRUPOCNAB = ' + IntToStr(iSeqGrupo));

         if iFlgAgrupaBoleta = 0
         then qryAux.SQL.Add(' WHERE CODDOCUMENTO = ' + Qry.FieldByName('CODDOCUMENTO').AsString)
         else qryAux.SQL.Add(' WHERE CODDOCUMENTO IN (                                                      '+
                             '                         SELECT HST.CODDOCUMENTOPREV                          '+
                             '                         FROM   HSTCONTRIBPREV HST, CONTPREV CP, PLANPREV PL  '+
                             '                         WHERE  HST.MESCOBRANCA    = '''+qry.FieldByName('MESCOBRANCA').AsString+''''+ // CAMILLE - 30.06.2004
                             '                         AND    HST.IDPESSOA       = '+qry.FieldByName('IDFORCLI').AsString+           // CAMILLE - 30.06.2004
                             '                         AND    HST.FLGDESCFOLHA   = 0                        '+
                             '                         AND    HST.IDPLANOPREV    = CP.IDPLANOPREV           '+
                             '                         AND    HST.IDCONTRIBUICAO = CP.IDCONTRIBUICAO        '+
                             '                         AND    ( NOT (HST.CODDOCUMENTOPREV IS NULL) )        '+
                             '                         AND    PL.IDPLANOPREV = HST.IDPLANOPREV              '+
                             '                         AND    HST.SITRECEBIMENTO IN (0,1)                   '+ // Gleyber - 07/07/2006 - Pendência 22720
                             '                         AND    NVL(HST.VALORRECEBIDO,0) = 0                  '+ // Gleyber - 07/07/2006 - Pendência 22720
                             '                        )                                                     ');
         try
            qryAux.ExecSQL;
         except
            Exit;
         end;

         // Gerar mensagem para sair no campo Instrucoes da boleta
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT C.NOME,        C.IDCONTRIBUICAO,   C.NOMERESUM,          '+
                        '        EL.MATRICULA,  PP.SALPARTICIPACAO,                       '+
                        '        DECODE(HST.FLGDEVOLUCAO, 0, HST.VALORESPERADO, HST.VALORESPERADO*-1) VALORESPERADO,  '+ // Gleyber - 17/06/2006 - Pendência 22372
                        '        PP.SALMANTIDO, SP.FLGINTERNO,      HST.MESREFERENCIA,    '+
                        '        HA.VALOR,      TA.DESCRICAO,       PL.MENSCOBR,          '+
                        '        PL.MENSCOBR2,  PP.INSCRICAONUMERO,                       '+ // CAMILLE - 09.04.2002
                        // Gleyber - 16/10/2002
                        '        PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV                '+
                        '        , HST.NUMRECEBIMENTO                                     '+ // CAMILLE - 30.06.2004
                        ' FROM   CONTRIBUICAO C, ELEGPATRO EL,        HSTCONTRIBPREV HST, '+
                        '        DOCUMENTO D,    PARTPREVPLAN PP,     SITPART SP,         '+
                        '        PLANPREV PL,    HSTATRASOCONTRIB HA, TIPOALTERADOR TA,   '+
                        '        CONTPREV CP '+
                        ' WHERE  (HST.IDPESSOA         = '+qry.FieldByName('IdPessoa').AsString+')');
         if iFlgAgrupaBoleta = 0 // CAMILLE - 16.06.2004 - 17024
         then qryAux.SQL.Add(' AND    (HST.MESREFERENCIA    = '''+qry.FieldByName('MesReferencia').AsString+''''+')');
         qryAux.SQL.Add(' AND	 (D.CODGRUPOCNAB       = '+IntToStr(iSeqGrupo)+')'+
                        ' AND  (HST.CODDOCUMENTOPREV = D.CODDOCUMENTO    )'+
                        ' AND  (HST.IDCONTRIBUICAO   = C.IDCONTRIBUICAO  )'+
                        ' AND  (HST.IDPLANOPREV      = PL.IDPLANOPREV    )'+
                        ' AND	 (HST.IDPESSOA         = PP.IDPESSOA       )'+
                        ' AND  (HST.IDPESSJUR        = PP.IDPESSJUR      )'+
                        ' AND	 (HST.IDPLANOPREV      = PP.IDPLANOPREV    )'+
                        ' AND  (HST.IDPLANOPREV      = CP.IDPLANOPREV    )'+
                        ' AND  (HST.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO )'+
                        ' AND  (CP.FLGPAGADOR        = ''C''             )'+
                        ' AND	 (HA.MESREFERENCIA(+)  = HST.MESREFERENCIA )'+
                        ' AND  (HA.NUMRECEBIMENTO(+) = HST.NUMRECEBIMENTO)'+
                        ' AND  (HA.MESCOBRANCA(+)    = HST.MESCOBRANCA   )'+
                        ' AND  (HA.IDMOTIVO(+)       = HST.IDMOTIVO      )'+
                        ' AND  (HA.VALOR(+)          > 0                 )'+
                        ' AND  (TA.CODALTERADOR(+)   = HA.CODALTERADOR   )'+
                        ' AND  (HST.SEQPROPOSTA      = PP.SEQPROPOSTA    )'+
                        ' AND  (PP.IDPESSOA          = EL.IDPESSOA       )'+
                        ' AND  (PP.IDPESSJUR         = EL.IDPESSJUR      )'+
                        ' AND  (PP.IDSITPART         = SP.IDSITPART      )'+
                        ' ORDER BY HST.MESREFERENCIA, C.IDCONTRIBUICAO, HST.NUMRECEBIMENTO, TA.DESCRICAO ');
         qryAux.Open;

         sMensagens[1] := '';   sMensagens[2]  := '';
         sMensagens[3] := '';   sMensagens[4]  := '';
         sMensagens[5] := '';   sMensagens[6]  := '';
         sMensagens[7] := '';   sMensagens[8]  := '';
         sMensagens[9] := '';   sMensagens[10] := ''; // CAMILLE - 08.10.2004


         qryAux.First;

         // Configurar mensagens da seguinte forma :
         // 1a. e 2a. linhas     : mensagens de cobranca do plano
         // 3a linha             : dados do participante (matricula, salario, etc.)
         // 4a., 5a e 6a. linhas : contribuicoes, valores e alteradores
         // CAMILLE - 16.06.2004
         // Alteracoes para imprimir mensagens 1 e 2 caso a soma das 2 ultrapasse o tamanho
         // de uma linha na mensagenscnab, que é de 69 posicoes.
         iProxLinha := 1;
         if Length(Trim(qryAux.FieldByName('MensCobr').AsString)+' '+Trim(qryAux.FieldByName('MensCobr2').AsString) ) <= 69
         then begin
            sMensagens[1]  := qryAux.FieldByName('MensCobr').AsString+' '+qryAux.FieldByName('MensCobr2').AsString;
            iProxLinha     := 2;
         end
         else begin
            sMensagens[1]  := qryAux.FieldByName('MensCobr').AsString;
            sMensagens[2]  := qryAux.FieldByName('MensCobr2').AsString;
            iProxLinha     := 3;
         end;
         sMensagens[iProxLinha] := 'Matrícula : '+qryAux.FieldByName('Matricula').AsString+' - '+'Inscrição : '+qryAux.FieldByName('InscricaoNumero').AsString;

         //leofuncef - 19022004 - destrói a qrytst, que é criada em tempo de execução
         try qryTst.free except  end;

         // Gleyber - 16/10/2002 - Início
         qryTst := TwwQuery.Create(application);
         qryTst.DatabaseName := qryAux.DatabaseName;

         // Gleyber - 31/03/2005 - Pendência 18861 - Início
         If iFlgAgrupaBoleta = 1
          Then Begin
            qryTst.Close;
            qryTst.SQL.Clear;
            qryTst.SQL.Add('SELECT MAX(HST.MESREFERENCIA) AS MESREFERENCIA ');
            qryTst.SQL.Add('FROM   HSTCONTRIBPREV HST,   ');
            qryTst.SQL.Add('       DOCUMENTO      D,     ');
            qryTst.SQL.Add('       PLANPREV       PL,    ');
            qryTst.SQL.Add('       CONTPREV       CP     ');
            qryTst.SQL.Add('WHERE (HST.IDPESSOA         = '+qry.FieldByName('IdPessoa').AsString+')');
            qryTst.SQL.Add('  AND (D.CODGRUPOCNAB       = '+IntToStr(iSeqGrupo)+')');
            qryTst.SQL.Add('  AND (HST.CODDOCUMENTOPREV = D.CODDOCUMENTO    )');
            qryTst.SQL.Add('  AND (HST.IDPLANOPREV      = PL.IDPLANOPREV    )');
            qryTst.SQL.Add('  AND (HST.IDPLANOPREV      = CP.IDPLANOPREV    )');
            qryTst.SQL.Add('  AND (HST.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO )');
            qryTst.SQL.Add('  AND (HST.IDPLANOPREV      = CP.IDPLANOPREV    )');
            qryTst.SQL.Add('  AND (HST.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO )');
            qryTst.SQL.Add('  AND (CP.FLGPAGADOR        = ''C''               )');

            qryTst.Open;

            If Not qryTst.IsEmpty
             Then sMesRef := qryTst.FieldByName('MESREFERENCIA').AsString;
          End
          Else sMesRef := qryAux.FieldByName('MESREFERENCIA').AsString;
         // Gleyber - 31/03/2005 - Pendência 18861 - Fim

         sSalario := '';

         sSalario := BuscaSalario(qryAux.FieldByName('IDPESSJUR').AsInteger,
                                  qryAux.FieldByName('IDPLANOPREV').AsInteger,
                                  qryAux.FieldByName('IDPESSOA').AsInteger,
                                  //qryAux.FieldByName('MESREFERENCIA').AsString,
                                  sMesRef, // Gleyber - 31/03/2005 - Pendência 18861
                                  qryAux.FieldByName('FLGINTERNO').AsString,
                                  sSalario,
                                  sMsg,
                                  qryTst);
          If sSalario <> ''
          Then sMensagens[iProxLinha] := sMensagens[iProxLinha]+' - Salário : '+FormatFloat('#0.00', StrToFloat(ClienteNumero(sSalario)))
          Else if (qryAux.FieldByName('FlgInterno').AsString = 'MA') or
                  (qryAux.FieldByName('FlgInterno').AsString = 'MP')
               then sMensagens[iProxLinha] := sMensagens[iProxLinha]+' - Salário : '+FormatFloat('#0.00', qryAux.FieldByName('SalMantido').AsFloat)
               else sMensagens[iProxLinha] := sMensagens[iProxLinha]+' - Salário : '+FormatFloat('#0.00', qryAux.FieldByName('SalParticipacao').AsFloat);

         inc(iProxLinha);
         //sMensagens[iProxLinha] := sMensagens[iProxLinha]+' - Ref.: '+Copy(qryAux.FieldByName('MesReferencia').AsString,6,2)+'/'+
         //                                                             Copy(qryAux.FieldByName('MesReferencia').AsString,1,4);

         // CAMILLE - 22.06.2004
         // Até este ponto as mensagens são gravadas na frente do boleto.
         // Deste ponto em diante podem ser gravadas na frente ou no verso, dependendo
         // do portador forma.
         if not bFlgMensagemVerso // -> Gerar mensagem na frente da boleta
         then begin
            sMsg := '';
            sUltMesLido := '0000/00';
            bMudouMes   := False;
            while (not qryAux.Eof) do
            begin
               if qryAux.FieldByName('MesReferencia').AsString <> sUltMesLido
               then begin
                  if sMsg = ''
                  then sMsg :=      'REF. '+Copy(qryAux.FieldByName('MesReferencia').AsString,6,2)+'/'+
                                                                        Copy(qryAux.FieldByName('MesReferencia').AsString,1,4)
                  else sMsg := sMsg+';REF. '+Copy(qryAux.FieldByName('MesReferencia').AsString,6,2)+'/'+
                                                                        Copy(qryAux.FieldByName('MesReferencia').AsString,1,4);
                  sUltMesLido := qryAux.FieldByName('MesReferencia').AsString;
                  bMudouMes   := True;
               end
               else bMudouMes := False;

               if not bMudouMes
               then sMsg := sMsg + '+'+Trim(qryAux.FieldByName('NomeResum').AsString)+':'+
                                       FormatFloat('#0.00', qryAux.FieldByName('ValorEsperado').AsFloat)
               else sMsg := sMsg + ':'+Trim(qryAux.FieldByName('NomeResum').AsString)+':'+
                                       FormatFloat('#0.00', qryAux.FieldByName('ValorEsperado').AsFloat);

               // Verificar se tem alterador
               if Trim(qryAux.FieldByName('Descricao').AsString) <> ''
               then begin
                  iIdContribuicao := qryAux.FieldByName('IdContribuicao').AsInteger;

                  sMsg := sMsg+' [';
                  while (not qryAux.Eof) and
                        (iIdContribuicao = qryAux.FieldByName('IdContribuicao').AsInteger) do
                  begin
                     sMsg := sMsg + '+'+qryAux.FieldByName('Descricao').AsString+' = '+
                                        FormatFloat('#0.00', qryAux.FieldByName('Valor').AsFloat);
                     qryAux.Next;
                  end;
                  sMsg := sMsg +'] ';
               end
               else qryAux.Next;
            end;

            // Retirar 1a. virgula
            // sMsg := Copy(sMsg,2,length(Trim(sMsg))-1);

            // Montar até 3 linhas de tamanho 69
            iPos := 1;
            inc(iProxLinha);
            for iContLinhas := iProxLinha to 10 do// CAMILLE - 08.10.2004
            begin
               sLinha := Copy(sMsg,iPos,69);
               iPos   := iPos + 69;
               // Se estiver na ultima linha e nao der para mostrar a mensagem
               // inteira, acrescentar na linha a soma do resto
               if (iContLinhas = 10) and (iPos < Length(Trim(sMsg))) // camille - 08.10.2004
               then sLinha := Copy(sLinha,1,60)+'[+Outros]';
               sMensagens[iContLinhas] := sLinha;
            end;

            // Chamar funcao que grava mensagem
            if not CtrlDocumento.IntBanco.SetaMensagensCNAB( -1,         // CodDocumento
                                                             iSeqGrupo,  // lICodGrupo
                                                             sMensagens, // sMensagens
//P.RAMOS-20.12.2004-PEND.18331-FORÇA ELIMINAÇÃO DA MENSAGEM CNAB VINCULADA AO GRUPOCNAB
//                                                             False )     // bApagaMensagens
                                                             true )     // bApagaMensagens
//P.RAMOS-20.12.2004-PEND.18331-FIM

                // CtrlDocumento.IntBanco.SetaMensagensCNAB(-1,iSeqGrupo,sMensagens)
            then begin
               Result := False;
               Exit;
            end;
         end // then-if not bFlgMensagemVerso
         else begin // -> Gerar mensagem no verso da boleta
            // Chamar funcao que grava mensagem PARA GRAVAR A PARTE DA FRENTE
            if not CtrlDocumento.IntBanco.SetaMensagensCNAB( -1,         // CodDocumento
                                                             iSeqGrupo,  // lICodGrupo
                                                             sMensagens, // sMensagens
//P.RAMOS-20.12.2004-PEND.18331-FORÇA ELIMINAÇÃO DA MENSAGEM CNAB VINCULADA AO GRUPOCNAB
//                                                             False )     // bApagaMensagens
                                                             true )     // bApagaMensagens
//P.RAMOS-20.12.2004-PEND.18331-FIM
            then begin
               Result := False;
               Exit;
            end;
         
            if  bInsereCabecalhoVerso
            then begin
               sMensagensVerso[1] := 'Cobrança de Valores da '+Qry.FieldByName('NOMEFUNDACAO').AsString;
               sMensagensVerso[2] := 'Mês Cobrança : '+Copy(Qry.FieldByName('MESCOBRANCA').AsString,6,2)+'/'+Copy(Qry.FieldByName('MESCOBRANCA').AsString,1,4);
               sMensagensVerso[3] := 'Vencimento : '+Qry.FieldByName('DATAPREVISAORECE').AsString;
               sMensagensVerso[4] :=  PreparaStr('Discriminação',30)+
                                      '          '+
                                      PreparaStr('Competência',11)+
                                      '         '+
                                      PreparaStr('Valor R$',20);
               // AS COLUNAS 5 e 6 DEVEM FICAR EM BRANCO POIS O INTBANCO JUNTA DE 3 EM 3
               // ASSIM, AS LINHAS COM AS CONTRIBUIÇÕES PROPRIAMENTE DITAS DEVEM COMEÇAR NO 7
               // 1,2 e 3 -> titulos
               // 4,5 e 6 -> tituls
               // 7 em diante -> contribuicoes
               iProxColuna        := 7;
            end;

            // Montar quantas linhas forem necessárias com até 20 colunas de 90 posicoes
            // Se for para agrupar os meses então na 1a. vez que passar (bInsereCabecalhoVerso = True)
            // aqui já irá inserir todas as contribuicoes de todos os documentos
            if (iFlgAgrupaBoleta = 0) or (bInsereCabecalhoVerso)
            then begin
               qryAux.First;
               iIdContribuicao    := -1;
               iUltNumRecebimento := -1; // CAMILLE - 30.06.2004
               while not qryAux.Eof do
               begin
                  // Testar se é uma nova contribuicao, ou a mesma com outro alterador
                  if (iUltNumRecebimento  <> qryAux.FieldByName('NUMRECEBIMENTO').AsInteger)
                  then begin
                     sMensagensVerso[iProxColuna] := PreparaStr(qryAux.FieldByName('NOMERESUM').AsString,30)+
                                                     '          '+
                                                     PreparaStr(Copy(qryAux.FieldByName('MESREFERENCIA').AsString,6,2)+'/'+Copy(qryAux.FieldByName('MESREFERENCIA').AsString,1,4),10)+
                                                     '          '+
                                                     PreparaStr(FormatFloat('#0.00',qryAux.FieldByName('VALORESPERADO').AsFloat),20);
                     inc(iProxColuna);
                     if iProxColuna > 20
                     then begin
                          InsereMensagemCnabVerso( dtmAPrev.qryAux2,
                                               iIdMsgCnab,
                                               Qry.FieldByName('CODDOCUMENTO').AsInteger,
                                               iSeqGrupo,
                                               sMensagensVerso[1],
                                               sMensagensVerso[2],
                                               sMensagensVerso[3],
                                               sMensagensVerso[4],
                                               sMensagensVerso[5],
                                               sMensagensVerso[6],
                                               sMensagensVerso[7],
                                               sMensagensVerso[8],
                                               sMensagensVerso[9],
                                               sMensagensVerso[10],
                                               sMensagensVerso[11],
                                               sMensagensVerso[12],
                                               sMensagensVerso[13],
                                               sMensagensVerso[14],
                                               sMensagensVerso[15],
                                               sMensagensVerso[16],
                                               sMensagensVerso[17],
                                               sMensagensVerso[18],
                                               sMensagensVerso[19],
                                               sMensagensVerso[20]);
                          for x := 1 to 20 do sMensagensVerso[x] := '';
                          iIdMsgCnab := -1;
                          iProxColuna := 1;
                     end;
                     
                     iIdContribuicao    := qryAux.FieldByName('IDCONTRIBUICAO').AsInteger;
                     iUltNumRecebimento := qryAux.FieldByName('NUMRECEBIMENTO').AsInteger;
                     dTotalVerso        := dTotalVerso + qryAux.FieldByName('VALORESPERADO').AsFloat;
                  end;

                  if Trim(qryAux.FieldByName('Descricao').AsString) <> '' // tem alterador
                  then begin
                     sMensagensVerso[iProxColuna] := PreparaStr(qryAux.FieldByName('DESCRICAO').AsString,30)+
                                                     '          '+
                                                     PreparaStr(Copy(qryAux.FieldByName('MESREFERENCIA').AsString,6,2)+'/'+Copy(qryAux.FieldByName('MESREFERENCIA').AsString,1,4),10)+
                                                     '          '+
                                                     PreparaStr(FormatFloat('#0.00',qryAux.FieldByName('VALOR').AsFloat),20);
                     inc(iProxColuna);
                     if iProxColuna > 20
                     then begin
                          InsereMensagemCnabVerso( dtmAPrev.qryAux2,
                                               iIdMsgCnab,
                                               Qry.FieldByName('CODDOCUMENTO').AsInteger,
                                               iSeqGrupo,
                                               sMensagensVerso[1],
                                               sMensagensVerso[2],
                                               sMensagensVerso[3],
                                               sMensagensVerso[4],
                                               sMensagensVerso[5],
                                               sMensagensVerso[6],
                                               sMensagensVerso[7],
                                               sMensagensVerso[8],
                                               sMensagensVerso[9],
                                               sMensagensVerso[10],
                                               sMensagensVerso[11],
                                               sMensagensVerso[12],
                                               sMensagensVerso[13],
                                               sMensagensVerso[14],
                                               sMensagensVerso[15],
                                               sMensagensVerso[16],
                                               sMensagensVerso[17],
                                               sMensagensVerso[18],
                                               sMensagensVerso[19],
                                               sMensagensVerso[20]);
                          for x := 1 to 20 do sMensagensVerso[x] := '';
                          iIdMsgCnab := -1;
                          iProxColuna := 1;
                     end;
                     dTotalVerso     := dTotalVerso + qryAux.FieldByName('VALOR').AsFloat;
                  end
                  else // CAMILLE - 30.06.2004
                     iIdContribuicao := -1; // se nao tem alterador reinicializar o controle de contrib
                     
                  qryAux.Next;
               end;

               if (iFlgAgrupaBoleta = 1)
               then begin
                  sMensagensVerso[iProxColuna] := PreparaStr('TOTAL',30)+
                                                  '          '+
                                                  PreparaStr(Copy(qryAux.FieldByName('MESREFERENCIA').AsString,6,2)+'/'+Copy(qryAux.FieldByName('MESREFERENCIA').AsString,1,4),10)+
                                                  '          '+
                                                  PreparaStr(FormatFloat('#0.00',dTotalVerso),20 );
                  inc(iProxColuna);
                  if iProxColuna > 20
                  then begin
                     InsereMensagemCnabVerso( dtmAPrev.qryAux2,
                                          iIdMsgCnab,
                                          Qry.FieldByName('CODDOCUMENTO').AsInteger,
                                          iSeqGrupo,
                                          sMensagensVerso[1],
                                          sMensagensVerso[2],
                                          sMensagensVerso[3],
                                          sMensagensVerso[4],
                                          sMensagensVerso[5],
                                          sMensagensVerso[6],
                                          sMensagensVerso[7],
                                          sMensagensVerso[8],
                                          sMensagensVerso[9],
                                          sMensagensVerso[10],
                                          sMensagensVerso[11],
                                          sMensagensVerso[12],
                                          sMensagensVerso[13],
                                          sMensagensVerso[14],
                                          sMensagensVerso[15],
                                          sMensagensVerso[16],
                                          sMensagensVerso[17],
                                          sMensagensVerso[18],
                                          sMensagensVerso[19],
                                          sMensagensVerso[20]);
                     for x := 1 to 20 do sMensagensVerso[x] := '';
                     iIdMsgCnab := -1;
                     iProxColuna := 1;
                  end;
               end;

               if not InsereMensagemCnabVerso( dtmAPrev.qryAux2,
                                               iIdMsgCnab,
                                               Qry.FieldByName('CODDOCUMENTO').AsInteger,
                                               iSeqGrupo,
                                               sMensagensVerso[1],
                                               sMensagensVerso[2],
                                               sMensagensVerso[3],
                                               sMensagensVerso[4],
                                               sMensagensVerso[5],
                                               sMensagensVerso[6],
                                               sMensagensVerso[7],
                                               sMensagensVerso[8],
                                               sMensagensVerso[9],
                                               sMensagensVerso[10],
                                               sMensagensVerso[11],
                                               sMensagensVerso[12],
                                               sMensagensVerso[13],
                                               sMensagensVerso[14],
                                               sMensagensVerso[15],
                                               sMensagensVerso[16],
                                               sMensagensVerso[17],
                                               sMensagensVerso[18],
                                               sMensagensVerso[19],
                                               sMensagensVerso[20])
               then begin
                   Result := False;
                   Exit;
               end;
            end;

         end; // else-if not bFlgMensagemVerso


         For X:=0 To iNumCampos Do
             lValoresGrupo[x] := Qry.FieldByName(sCamposParaGrupo[X]).AsString;

         Qry.Next;
      End;

      Result := True;
   End;

   lValoresGrupo.Free;
   Qry.Close;
end;

// CAMILLE - 22.06.2004
function InsereMensagemCnabVerso( qry            : TwwQuery;
                                  var piIdMsgCnab: longint;
                                  piCodDocumento : longint;
                                  piCodGrupoCnab : longint;
                                  psMensagem1    : string = '';
                                  psMensagem2    : string = '';
                                  psMensagem3    : string = '';
                                  psMensagem4    : string = '';
                                  psMensagem5    : string = '';
                                  psMensagem6    : string = '';
                                  psMensagem7    : string = '';
                                  psMensagem8    : string = '';
                                  psMensagem9    : string = '';
                                  psMensagem10   : string = '';
                                  psMensagem11   : string = '';
                                  psMensagem12   : string = '';
                                  psMensagem13   : string = '';
                                  psMensagem14   : string = '';
                                  psMensagem15   : string = '';
                                  psMensagem16   : string = '';
                                  psMensagem17   : string = '';
                                  psMensagem18   : string = '';
                                  psMensagem19   : string = '';
                                  psMensagem20   : string = '' ) : boolean;
var sSQL : string;
begin
   Result := False;
   if piIdMsgCnab <= 0
   then piIdMsgCnab := LeUltRegistro(nil,'MSGCNABVERSO');
   
   sSQL := ' INSERT INTO MSGCNABVERSO (IDMSGCNABVERSO, CODDOCUMENTO, CODGRUPOCNAB,  '+
           '                           MENSAGEM1,      MENSAGEM2,    MENSAGEM3,     '+
           '                           MENSAGEM4,      MENSAGEM5,    MENSAGEM6,     '+
           '                           MENSAGEM7,      MENSAGEM8,    MENSAGEM9,     '+
           '                           MENSAGEM10,     MENSAGEM11,   MENSAGEM12,    '+
           '                           MENSAGEM13,     MENSAGEM14,   MENSAGEM15,    '+
           '                           MENSAGEM16,     MENSAGEM17,   MENSAGEM18,    '+
           '                           MENSAGEM19,     MENSAGEM20                 ) '+
           ' VALUES (                                                               ';
   sSQL := sSQL + IntToStr(piIdMsgCnab);
   sSQL := sSQL + ','+IntToStr(piCodDocumento);
   sSQL := sSQL + ','+IntToStr(piCodGrupoCnab);
   if Trim(psMensagem1)  <> '' then sSQL := sSQL + ','''+psMensagem1 +'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem2)  <> '' then sSQL := sSQL + ','''+psMensagem2 +'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem3)  <> '' then sSQL := sSQL + ','''+psMensagem3 +'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem4)  <> '' then sSQL := sSQL + ','''+psMensagem4 +'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem5)  <> '' then sSQL := sSQL + ','''+psMensagem5 +'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem6)  <> '' then sSQL := sSQL + ','''+psMensagem6 +'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem7)  <> '' then sSQL := sSQL + ','''+psMensagem7 +'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem8)  <> '' then sSQL := sSQL + ','''+psMensagem8 +'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem9)  <> '' then sSQL := sSQL + ','''+psMensagem9 +'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem10) <> '' then sSQL := sSQL + ','''+psMensagem10+'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem11) <> '' then sSQL := sSQL + ','''+psMensagem11+'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem12) <> '' then sSQL := sSQL + ','''+psMensagem12+'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem13) <> '' then sSQL := sSQL + ','''+psMensagem13+'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem14) <> '' then sSQL := sSQL + ','''+psMensagem14+'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem15) <> '' then sSQL := sSQL + ','''+psMensagem15+'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem16) <> '' then sSQL := sSQL + ','''+psMensagem16+'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem17) <> '' then sSQL := sSQL + ','''+psMensagem17+'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem18) <> '' then sSQL := sSQL + ','''+psMensagem18+'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem19) <> '' then sSQL := sSQL + ','''+psMensagem19+'''' else sSQL := sSQL + ', NULL';
   if Trim(psMensagem20) <> '' then sSQL := sSQL + ','''+psMensagem20+'''' else sSQL := sSQL + ', NULL';
   sSQL := sSQL +')';

   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      try
         ExecSQL;
      except
         Exit;
      end;
   end;
   Result := True;
end; // InsereMensagemCnabVerso



function GeraAlteradorBANCO ( CtrlDocumento                      : TCtrlDocumento; // CAMILLE - 08.10.2004
                              qryAux                             : TwwQuery;
                              qryContabil                        : TwwQuery;           // Gleyber - 30/11/2005 - Pendência 20738
                              qryDocumentos                      : TwwQuery;           // Gleyber - 30/11/2005 - Pendência 20738
                              piCodDocumento                     : longint;
                              piCodAlterador                     : longint;
                              rValor                             : double;
                              psDataVencimento                   : string;
                              sTipOper                           : string;
                              piIdPessJur                        : longint;
                              piIdPlanoPrev                      : longint;
                              piIdPessoa                         : longint;
                              piIdContribuicao                   : longint;
                              piUltimaContrib                    : longint;
                              var sMsgErro                       : string;
                              psFlgSitPart                       : string;             // Gleyber - 30/11/2005 - Pendência 20738
                              piNumRecebimento                   : longint;             // Gleyber - 30/11/2005 - Pendência 20738
                              psAnoMesReferencia                 : string) : boolean;  // Gleyber - 30/11/2005 - Pendência 20738
var iNumLancto,
    iPlnCodigo : longint;
    sAux1, sAux2,
    sCodUnidNegoc,
    sNomeAlterador,
    sContaDocumento,
    sContaAlterador,
    sDebCre    : string;
    bContabilizaNoEnvio : boolean; // CAMILLE - 16.06.2004
    sDataLancto : String; //Bruno Bastos - Pend. 20596 - 27/10/2005
    // Gleyber - 30/11/2005 - Pendência 20738 - Início
    cRecPag,
    sTipoReceita,
    sTipoDebCre,
    sTP01Rec,
    sTP01Deb,
    sCodCentroCusto,
    sNoDocumento,
    sHistCre,
    sHistDeb,
    sTipCodigo,
    sInscricaoNumero,
    sIdPlanPrevContab,
    sCodSubConta,
    sPlaContaD         : String;
    iCodSubConta       : Integer;
    dValorEnviar       : Double;
    // Gleyber - 30/11/2005 - Pendência 20738 - Fim
begin
   Result := False;

   // Gleyber - 30/11/2005 - Pendência 20738 - Início
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT INSCRICAONUMERO FROM PARTPREVPLAN ');
   qryAux.SQL.Add('WHERE IDPESSOA      = '+IntToStr(piIdPessoa));
   qryAux.SQL.Add('  AND IDPESSJUR     = '+IntToStr(piIdPessJur));
   qryAux.SQL.Add('  AND IDPLANOPREV   = '+IntToStr(piIdPlanoPrev));
   qryAux.SQL.Add('  AND FLGDESATIVADO = 0');

   qryAux.Open;
   sInscricaoNumero := qryAux.FieldByName('INSCRICAONUMERO').AsString;
   // Gleyber - 30/11/2005 - Pendência 20738 - Fim


   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT ACRESDECRES AS DEBCRE, PLACONTA,DESCRICAO FROM TIPOALTERADOR  '+
                  ' WHERE  CODALTERADOR = '+IntToStr(piCodAlterador));
   qryAux.Open;

   if not qryAux.IsEmpty
   then begin
      sDebCre         := qryAux.FieldByName('DebCre').AsString;
      sContaAlterador := qryAux.FieldByName('PlaConta').AsString;
      sNomeAlterador  := qryAux.FieldByName('DESCRICAO').AsString;
   end
   else begin
      sMsgErro := 'Conta Contábil do Alterador não preenchida.';
      Exit;
   end;

   // Se nao obriga atividade, obrigatoriamente temos que usar
   // a atividade cadastrada no global, senao, podemos buscar uma
   // especifica. Caso nao encontre, tambem podemos usar a global
   if IntegraBack.ObrigaAbc = 'N'
   then sCodUnidNegoc := IntToStr(prmUnidNegoc)
   else begin
      BuscaInfFinancContrib(sAux1, sAux2, sCodUnidNegoc,'UNIDNEGOC',
                          '',
                          'N',
                          piIdPessJur, piIdPlanoPrev,  piIdContribuicao,
                          piUltimaContrib, piIdPessoa );
      if Trim(sCodUnidNegoc) = ''
      then sCodUnidNegoc := IntToStr(prmUnidNegoc);
   end;

   // Gleyber - 30/11/2005 - Pendência 20738 - Início
   BuscaInfFinancContrib(sAux1, sAux2, sCodCentroCusto,'CODCENTROCUSTOD',
                         '', 'S', piIdPessJur, piIdPlanoPrev,  piIdContribuicao,
                         piUltimaContrib, piIdPessoa );

   BuscaInfFinancContrib(sAux1, sAux2,sCodSubConta,'CODSUBCONTA',
                         '', 'S', piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                         piUltimaContrib, piIdPessoa );

   If sCodSubConta <> ''
    Then iCodSubConta := strToInt(sCodSubConta);

   BuscaInfFinancContrib(sAux1, sAux2, sIdPlanPrevContab,'IDPLANPREVCONTAB',
                         '', 'N', piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                         piUltimaContrib, piIdPessoa );

   If Trim(sIdPlanPrevContab) = '' Then
     sIdPlanPrevContab := IntToStr(piIdPlanoPrev);

   //ClaudioR - 17578 - 16/08/2007 - Inicio
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT ATIVO '+#13+
                  'FROM PLANPREVCONTABIL '+#13+
                  'WHERE IDPLANOPREV = ' + sIdPlanPrevContab + #13+
                  'ORDER BY IDPLANOPREV');
   qryAux.Open;

   If (Not qryAux.IsEmpty) And (QryAux.FieldByName('ATIVO').AsString <> 'S') Then
   Begin
     sMsgErro := 'Esse Plano Previdenciario Contábil ' + QryAux.FieldByName('ATIVO').AsString + ' não é ativo.';
     Exit;
   End;
   //ClaudioR - 17578 - 16/08/2007 - Fim

   BuscaInfFinancContrib(sAux1, sAux2, sPlaContaD,'PLACONTADBANCO',
                         '', 'S', piIdPessJur, piIdPlanoPrev, piIdContribuicao,
                         piUltimaContrib, piIdPessoa );

   sHistDeb  := Copy('Cobrança de '+qryAux.FieldByName('DESCRICAO').AsString,1,40);
   sHistCre  := Copy('Receita de '+qryAux.FieldByName('DESCRICAO').AsString,1,40);
   sTipCodigo := prmTpOperCobranca;
   // Gleyber - 30/11/2005 - Pendência 20738 - Fim

   // CAMILLE - 16.06.2004
   VerificaContabMantidoNoEnvio(qryaux,bContabilizaNoEnvio,piIdPlanoPrev);
   // CAMILLE - 16.06.2004 - FIM
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT PLACONTA, RECPAG FROM DOCUMENTO  '+
                  ' WHERE  CODDOCUMENTO = '+IntToStr(piCodDocumento));
   qryAux.Open;
   if not qryAux.IsEmpty
   then sContaDocumento := qryAux.FieldByName('PlaConta').AsString
   else begin
      sMsgErro := 'Conta Contábil do Documento não preenchida.';
      Exit;
   end;

   // Gleyber - 13/06/2006 - Pendência 22224
   // Comentado o código do Léo Abaixo
   //leofuncef - 13042005
   // (qryaux.fieldbyname('RECPAG').AsString = 'P') and (sDebCre = 'D')
   //en sDebCre := 'C';

   cRecPag := qryaux.fieldbyname('RECPAG').AsString; // Gleyber - 30/11/2005 - Pendência 20738

   qryAux.Close;

   try
      iPlnCodigo := 0;

      CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador); // CAMILLE(2) - 28.10.2004
      CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;   // CAMILLE - 08.10.2004
      CtrlDocumento.IdUsuario   := Sistema.IdUsuario;     // CAMILLE - 08.10.2004

      //Bruno Bastos - Pend. 20596 - 27/10/2005 - Início
      sDataLancto := DateToStr(date);
      if StrToDate(psDataVencimento) < date then
        sDataLancto := psDataVencimento;
      //Bruno Bastos - Pend. 20596 - 27/10/2005 - Fim

      // CAMILLE - 08.10.2004
      CtrlDocumento.LanctoDocum.SetValues( //Date,                   // DataLancto
                                           //Bruno Bastos - Pend. 20596 - 27/10/2005 - StrToDate(psDataVencimento), //leofuncef - 21092005
                                           StrToDate(sDataLancto), //Data Lancto //Bruno Bastos - Pend. 20596 - 27/10/2005
                                           piCodDocumento,         // CodDocumento
                                           0,                      // Numlancto
                                           rValor,                 // Vlrliquido
                                           0,                      // ValorOM
                                           rValor,                 // Valor
                                           prmUnidNegoc,           // Unidnegoc     // Gleyber - 05/09/2006 - Pendência 23243
                                           iPlnCodigo,             // liPlncodigo
                                           -1,                     // Numlotemanual
                                           Sistema.IdUsuario,      // Idusuarioinclusao
                                           Sistema.IdEmpresa,      // Idpessoa
                                           -1,                     // Idnflivro,
                                           -1,                     // Estorno
                                           -1,                     // Codtipdoc
                                           -1,                     // Coddocinss
                                           piCodAlterador,         // Codalterador
                                           '4',                    // Operacao
                                           '',                     // NumRecibo
                                           '',                     // Numnf
                                           '',                     // Numfatura
                                           'Cobrança de Contribuição. ',// Historicocompl
                                           '',                     // Flgtipofatura
                                           'N',                    // Flgrecebeunf
                                           '',                     // Flgfatemitida
                                           sDebCre,                // Debcre
                                           Sistema.IdModulo,       // IdModulo
                                           IntegraBack.Plano,      // PlanoConta
                                           True,                   // UsaPlanoPatro
                                           bContabilizaNoEnvio,    // Contabiliza
                                           -1,                     // iCodPortForma
                                           0,                      //  DiasFloat
                                           '',                     // ContaBaixa
                                           0                       // SubContaBaixa
                                          );
      if not CtrlDocumento.Insert // CAMILLE(2) - 28.10.2004
      then begin
         sMsgErro := 'Erro na Geração do Lançamento do Alterador no Contas a Receber.'+ CtrlDocumento.MessageInfo; //leofuncef - 03012006
         Exit;
      end;
   except
     sMsgErro := 'Erro na Geração do Lançamento do Alterador no Contas a Receber.';
     raise;
     //Exit;
   end;

   // Gleyber - 30/11/2005 - Pendência 20738 - Início
   // ********************************************************************************************
   //                                  PROCESSAR CONTABILIZACAO
   // ********************************************************************************************
   iNumLancto := CtrlDocumento.Lanctodocum.NumLancto;

   if cRecPag = 'R'
   then begin
      sTipoReceita := 'C';
      sTipoDebCre  := 'D';
      sTP01Rec     := '1';
      sTP01Deb     := '0';
   end
   else begin
      sTipoReceita := 'D';
      sTipoDebCre  := 'C';
      sTP01Rec     := '0';
      sTP01Deb     := '1';
   end;

   if not ((psFlgSitPart = 'MA') and (not bContabilizaNoEnvio)) then
   begin
      // Contabilizar Crédito
      try
         FazerInsertContab( qryContabil,
                            sContaAlterador,
                            sCodCentroCusto,
                            sTipoReceita,
                            sTP01Rec,
                            IntToStr(piNumRecebimento),
                            sHistCre,
                            'Referente ao Mês '+ psAnoMesReferencia ,
                            Copy('Inscrição '+sInscricaoNumero,1,40),'','',
                            StrToInt(sCodUnidNegoc),
                            iCodSubConta,
                            rValor,
                            0,
                            StrToDate(psDataVencimento),
                            sTipCodigo,
                            piIdPessJur,
                            StrToInt(sIdPlanPrevContab) );
      except
         sMsgErro := 'Erro ao contabilizar crédito.';
         Exit;
      end;


      // Contabilizar Débito
      try
         FazerInsertContab( qryContabil,
                            sPlaContaD,
                            sCodCentroCusto,
                            sTipoDebCre,
                            sTP01Deb,
                            sNoDocumento,
                            sHistDeb,
                            'Referente ao Mês '+ psAnoMesReferencia ,
                            Copy('Inscrição '+sInscricaoNumero,1,40),'','',
                            StrToInt(sCodUnidNegoc),
                            iCodSubConta,
                            rValor,
                            0,
                            StrToDate(psDataVencimento),
                            sTipCodigo,
                            piIdPessJur,
                            StrToInt(sIdPlanPrevContab) );
      except
         sMsgErro := 'Erro ao contabilizar débito.';
         Exit;
      end;
   end;

   If ((piIdPessoa <> iIdFundacao)
       or ((piIdPessJur = iIdFundacao) and  prmIntegraFundacao))
    Then AlimentaQryDocumentos(qryDocumentos,
                               piCodDocumento,
                               iNumLancto,
                               -1,
                               -1,
                               '',
                               '',
                               '',
                               -1,
                               piIdPessJur,
                               piIdPlanoPrev,
                               piIdContribuicao,
                               0,
                               strtoint(sIdPlanPrevContab),
                               piIdPessJur);
   // Gleyber - 30/11/2005 - Pendência 20738 - fim

   Result := True;

end; // GeraAlteradorBANCO


function EnviaAlteradorBANCO( CtrlDocumento                      : TCtrlDocumento; // CAMILLE - 08.10.2004
                              qryAlterador,qryAux,
                              qryContabil                        : TwwQuery;           // Gleyber - 30/11/2005 - Pendência 20738
                              qryDocumentos                      : TwwQuery;           // Gleyber - 30/11/2005 - Pendência 20738
                              psAnoMesReferencia                 : string;
                              psNumRecebimento                   : String;
                              piCodDocumento                     : longint; // CAMILLE - 08.10.2004
                              psDataHistorico                    : string;
                              psDataEspecifica                   : string;
                              psTipOper                          : string;
                              piIdPessJur                        : longint;
                              piIdPlanoPrev                      : longint;
                              piIdPessoa                         : longint;
                              piIdContribuicao                   : longint;
                              piUltimaContrib                    : longint;
                              psFlgPagador                       : string;
                              var sMsgErro                       : string;
                              psFlgSitPart                       : string) : boolean; // Gleyber - 30/11/2005 - Pendência 20738

var sDataVencimento : string;
begin
   Result := False;

   if psFlgPagador <> 'C'
   then piIdPessoa := piIdPessJur;

   if Trim(psDataEspecifica) <> '' Then
     sDataVencimento := psDataEspecifica
   else
     if Trim(psDataHistorico) <> '' Then
       sDataVencimento := psDataHistorico
     else
       //sDataVencimento := DateToStr(date);
       sDataVencimento := FormatDateTime('dd/mm/yyyy', date);

   qryAlterador.Close;
   qryAlterador.SQL.Clear;
   qryAlterador.SQL.Add(' SELECT NUMRECEBIMENTO, CODALTERADOR, VALOR '+
                    ' FROM   HSTATRASOCONTRIB '+
                    ' WHERE  NUMRECEBIMENTO IN ('+psNumRecebimento+') ');
   qryAlterador.Open;

   while not qryAlterador.Eof do
   begin
      if qryAlterador.FieldByName('Valor').AsFloat <= 0
      then begin
         qryAlterador.Next;
         continue;
      end;

      if not GeraAlteradorBANCO ( CtrlDocumento, // CAMILLE - 08.10.2004
                                  qryAux,
                                  qryContabil,   // Gleyber - 30/11/2005 - Pendência 20738
                                  qryDocumentos, // Gleyber - 30/11/2005 - Pendência 20738
                                  piCodDocumento,
                                  qryAlterador.FieldByName('CodAlterador').AsInteger,
                                  qryAlterador.FieldByName('Valor').AsFloat,
                                  sDataVencimento,
                                  psTipOper,
                                  piIdPessJur, piIdPlanoPrev, piIdPessoa,
                                  piIdContribuicao, piUltimaContrib,sMsgErro,
                                  psFlgSitPart,        // Gleyber - 30/11/2005 - Pendência 20738
                                  qryAlterador.FieldByName('NumRecebimento').AsInteger,    //leofuncef - 03012006
                                  psAnoMesReferencia)  // Gleyber - 30/11/2005 - Pendência 20738
      then begin
         Exit;
      end;
      qryAlterador.Next;
   end; // while
   Result := True;
end; // EnviaAlteradorBanco



// Gleyber - 08/07/2005 - Pendência 19504 - Início
function AtualizaSitContrib(qry : TwwQuery; piIdLote,piSitRecebimento,
                            piTipoCobranca : Integer) : boolean;
begin
   Result := False;
   With qry do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE HSTCONTRIBPREV ');
      SQL.Add('SET SITRECEBIMENTO = '+IntToStr(piSitRecebimento) );
      SQL.Add('WHERE IDLOTE  = '+IntToStr(piIdLote));
      SQL.Add('  AND IDPESSOA = IDPESSOA');

      Case piTipoCobranca Of
        1 : // do Mês
            SQL.Add('  AND MESREFERENCIA = MESCOBRANCA');
        2 : Begin  // Apenas Atrasadas
             SQL.Add('  AND MESREFERENCIA <> MESCOBRANCA');
             SQL.Add('  AND FLGDEVOLUCAO = 0 ');
            End;
        3 : Begin  // Apenas Devoluções
             SQL.Add('  AND MESREFERENCIA <> MESCOBRANCA');
             SQL.Add('  AND FLGDEVOLUCAO = 1');
            End;
      End;

      Try
        ExecSQL;
      Except
        Exit;
      End;
    End;
   Result := True;
end;  //AtualizaSitContrib
// Gleyber - 08/07/2005 - Pendência 19504 - Fim


function CalculaAlterador ( qryAux           : TwwQuery;
                            piIdPessJur,
                            piIdPlanoPrev,
                            piCodAlterador,
                            piIdRegraCalculo : longint;
                            psAnoMesCalculo,
                            psDataRef,
                            psDataCobranca,
                            psFlgIntSitPart  : string;
                            prValorContrib   : double;
                            var sMsgErro     : string  ) : double;
var sMesRef,
    sDataDeveriaTerPago,
    sValorContrib,
    sValorRegra,
    sSQLRegra            : string;
    bErroRegra           : boolean;
begin
    Result := 0;

    if prValorContrib <= 0       then Exit;

    //ClaudioR - 19962 - 16/08/2007 - Inicio
    //if Trim(psDataRef) = ''      then psDataRef      := DateToStr(date);
    //if Trim(psDataCobranca) = '' then psDataCobranca := DateToStr(date);

    if Trim(psDataRef) = ''      then psDataRef      := FormatDateTime('dd/mm/yyyy', date);
    if Trim(psDataCobranca) = '' then psDataCobranca := FormatDateTime('dd/mm/yyyy', date);
    //ClaudioR - 19962 - 16/08/2007 - Fim

    sMesRef       := Copy(psDataRef,7,4)+Copy(psDataRef,3,3);
    sValorContrib := OraNumero(FloatToStr(prValorContrib));

    sDataDeveriaTerPago := CriticaDataCobrancaSit( qryAux,
                                                   IntToStr(piIdPessJur),
                                                   IntToStr(piIdPlanoPrev),
                                                   psFlgIntSitPart, 'N',
                                                   Copy(psAnoMesCalculo,6,2),
                                                   Copy(psAnoMesCalculo,1,4) );


    sSQLRegra := ' SELECT '+PreparaStrRegra(sValorContrib)  +'   AS VALORPREV , '+
                 ''''+ PreparaStrRegra(psDataRef)           +''' AS DATAREF, '+
                 ''''+ PreparaStrRegra(sMesRef)             +''' AS MESREFERENCIA, '+
                 ''''+ PreparaStrRegra(psDataCobranca)      +''' AS DATAPREVISAORECE, '+
                 ''''+ PreparaStrRegra(sDataDeveriaTerPago) +''' AS DATARECEBIMENTO '+
                 ' FROM DUAL  ';

    try
        sValorRegra := RegraNumerica(IntToStr(piIdRegraCalculo), sSQLRegra, bErroRegra,iIdCalculoGeral);
    except
        sMsgErro := ' Erro na Regra de Cálculo de um dos alteradores - Regra Nº '+IntToStr(piIdRegraCalculo);
        Exit;
    end;

    Result := StrToFloat(ClienteNumero(sValorRegra));
end; // CalculaAlterador

function GravaAlterador( sTipo                : string;
                         sMesReferencia       : string;
                         sMesCobranca         : string;
                         sFlgEvento           : string;
                         piNumRecebimento     : integer;
                         piIdMotivo           : integer;
                         pIdPlanoPrev         : integer;
                         pIdContribuicao      : integer;
                         pIdPessJur           : integer;
                         sDataRef             : string;
                         sDataPrevisao        : string;
                         sDataRecebido        : string;
                         sValor               : string;
                     var sMsgErro             : string;
                         piIdPessoa           : integer = 0;
                         piOrigem             : integer = 0;              // CAMILLE - 28.10.2004
                         piCodAlterador       : integer = -1 ) : boolean; // CAMILLE - 05.11.2004
var sSQLRegra         : string;
    sMesRef           : string;
    sValorRegra       : string;
    bErroRegra        : boolean;
    Dec               : char;
    sPossuiMigracao   : char;
    sFlgAtraso        : char;
    sFlgDevol         : char;
    rValor            : double;
    sDataEvento       : string;
    sDataRequerimento : string;
    dTotal            : double;
    sValorGrava       : String; { Augusto 11/07/2006 }
begin
   Result       := False;
   sMsgErro     := ''; { Augusto 11/07/2006 }

   if sFlgEvento = ''
   then sFlgEvento := '0'
   else if (sFlgEvento  <> '1') and (sFlgEvento <> '0')
        then sFlgEvento := '1';

   // sTipo - Parametro que especifica o tipo de alterador (A-traso, D-evolução)
   sFlgAtraso   := '0';
   sFlgDevol    := '0';

   if sTipo        = 'A' then sFlgAtraso := '1'  else sFlgDevol  := '1';
   if Trim(sValor) = ''  then sValor     := '0';

   try
      rValor := StrToFloat(ClienteNumero(sValor));
   except
   end;

   
   //leofuncef - 21092004
   //caso seja um eevento, passar a data do evento e data requerimento
   //motivo inicial: necessário para cálculo de alteradores no resgate de contribuições (evento de demissão)
   sDataEvento       := '';
   sDataRequerimento := '';
   if sFlgEvento = '1'
   then begin
      dtmAPrev.qryAux2.Close;
      dtmAPrev.qryAux2.Sql.Clear;
      dtmAPrev.qryAux2.Sql.Add(' SELECT DATAEVENTO, DATAREQUERIMENTO                                  '+
                               ' FROM EVENTOSPREV                                                     '+
                               ' WHERE IDEVENTOSPREV = ( SELECT MAX(IDEVENTOSPREV)                    '+
                               '                         FROM EVENTOSPREV                             '+
                               '                         WHERE IDPESSOA = '+IntToStr(piIdPessoa)+')   ');

      dtmAPrev.qryAux2.Open;
      if not dtmAPrev.qryAux2.IsEmpty
      then begin
         sDataEvento := dtmAPrev.qryAux2.fieldbyname('DATAEVENTO').AsString;
         sDataRequerimento := dtmAPrev.qryAux2.fieldbyname('DATAREQUERIMENTO').AsString;
         //eventos que não gravam a data do requerimento em tela
         if (sDataRequerimento = '') and (sDataEvento <> '') then  sDataRequerimento := sDataEvento;
      end;
   end;
   //leofuncef - 21092004 - fim

   // == Procura pelos alteradores c/ flgcobra p/ a contribuição mencionadada e p/ Atraso ou Devolução
   dtmAPrev.qryAux2.Close;
   dtmAPrev.qryAux2.Sql.Clear;
   if piCodAlterador > 0
   then dtmAPrev.qryAux2.Sql.Add(' SELECT CODALTERADOR, IDREGRACALCULO FROM ALTERADORXCONTRIB  ' +
                            ' WHERE ( IDCONTRIBUICAO = '  + IntToStr(pIdContribuicao) + ' )'+
                            ' AND   ( IDPLANOPREV    = '  + IntToStr(pIdPlanoPrev)    + ' )'+
                            ' AND   ( CODALTERADOR   = '+ IntToStr(piCodAlterador)    + ' )'+
                            ' AND  (( FLGATRASO      = '  + sFlgAtraso +') OR              '+
                            '       ( FLGDEVOL       = '  + sFlgDevol  +'))                '+
                            ' ORDER BY NUMORDEM ')
   else dtmAPrev.qryAux2.Sql.Add(' SELECT CODALTERADOR, IDREGRACALCULO FROM ALTERADORXCONTRIB  ' +
                            ' WHERE ( IDCONTRIBUICAO = '  + IntToStr(pIdContribuicao) + ' )'+
                            ' AND   ( IDPLANOPREV    = '  + IntToStr(pIdPlanoPrev)    + ' )'+
                            ' AND   ( FLGCOBRA       = 1                                  )'+
                            ' AND  (( FLGATRASO      = '  + sFlgAtraso +') OR              '+
                            '       ( FLGDEVOL       = '  + sFlgDevol  +'))                '+
                            ' ORDER BY NUMORDEM ');

   dtmAPrev.qryAux2.Open;
   if dtmAPrev.qryAux2.IsEmpty
   then begin
      Result := True;
      Exit;
   end;

   { Augusto 11/05/2004 - Verifica se participante possui migração de plano }
   If PossuiMigracao(piIdPessoa, pIdPlanoPrev, sDataRef)
   Then Begin
     sPossuiMigracao := 'S';
   End
   Else Begin
     sPossuiMigracao := 'N';
   End;


   dTotal := 0; // CAMILLE - 28.10.2004

   while not dtmAPrev.qryAux2.EOF do
   begin
      if dtmAPrev.qryAux2.FieldByName('IDREGRACALCULO').AsString = ''
      then begin
         dtmAPrev.qryAux2.Next;
         continue;
      end;

      //sMesRef   := Copy(sDataRef,7,4)+Copy(sDataRef,3,3); //leofuncef - 05082004
      sValor    := OraNumero(FloatToStr(rValor));
      sSQLRegra := ' SELECT '+OraNumero(sValor)+' AS VALORPREV , '+
                   ''''+PreparaStrRegra(sDataRef)+''' AS DATAREF, '+

                   //''''+PreparaStrRegra(sMesRef) +''' AS MESREFERENCIA, '+
                   ''''+PreparaStrRegra(sMesReferencia) +''' AS MESREFERENCIA, '+ //leofuncef - 05082004

                   ''''+PreparaStrRegra(sMesCobranca) +''' AS MESCOBRANCA, '+ { Augusto 30/03/2004 }
                   ''''+PreparaStrRegra(sDataPrevisao)+''' AS DATAPREVISAORECE, '+
                   ''''+PreparaStrRegra(sDataRecebido)+''' AS DATARECEBIMENTO, '+
                   ''''+PreparaStrRegra(sPossuiMigracao)+''' AS FLGMIGRADO, '+ { Augusto 11/05/2004 }
                   ''''+PreparaStrRegra(sFlgEvento)+''' AS FLGEVENTO, '+ //leofuncef - 05082004
                   ''''+PreparaStrRegra(sDataEvento)+''' AS DATAEVENTO, '+ //leofuncef - 21092004
                   ''''+PreparaStrRegra(sDataRequerimento)+''' AS DATAREQUERIMENTO, '+ //leofuncef - 21092004
                   IntToSTr(Sistema.Idmodulo)      +'   AS IDMODULO '+ //leofuncef - 07122004
                   ' FROM DUAL  ';

      try
         sValorRegra := RegraNumerica(dtmAPrev.qryAux2.FieldByName('IDREGRACALCULO').AsString, sSQLRegra, bErroRegra,iIdCalculoGeral);
      except
         sMsgErro := ' Erro na Regra de Cálculo de um dos alteradores - Regra Nº '+dtmAPrev.qryAux2.FieldByName('IDREGRACALCULO').AsString;
         Exit;
      end;

      if sValorRegra = ''
      then begin
         dtmAPrev.qryAux2.Next;
         Continue;
      end;

      // Trocar decimal separator
      Dec := DecimalSeparator;
      DecimalSeparator := '.';

      DecimalSeparator := Dec;

      with dtmAPrev.qry do
      begin

         { Augusto 11/07/2006 - Tornar valor gravado positivo }
         sValorGrava := ClienteNumero( sValorRegra );
         sValorGrava := OraNumero( FloatToStr( Abs( StrToFloat( sValorGrava ) ) ) );

         //== Grava alteradores no HistoricoAlteradores
         Close;
         SQL.Clear;
         SQL.Add(' INSERT INTO HSTATRASOCONTRIB (NUMRECEBIMENTO,MESREFERENCIA,             '+
                 '             MESCOBRANCA,IDMOTIVO,FLGTIPO,VALOR,CODALTERADOR,FLGEVENTO)  '+
                 ' VALUES('+IntToStr(piNumRecebimento)+',                                  '+
                 ''''+sMesReferencia    +''',                                              '+
                 ''''+sMesCobranca      +''',                                              '+
                 ''  +IntToStr(piIdMotivo)+',                                              '+
                 ''''+sTipo+''','+
                 sValorGrava +', '+
                 dtmAPrev.qryAux2.FieldByName('CODALTERADOR').AsString +',                 '+
                 sFlgEvento+')                                                             ');
         try
            ExecSQL;
         except
            dtmAPrev.qryAux2.Next;
            Continue;
         end;
         try
            rValor := rValor + StrToFloat(ClienteNumero(sValorRegra));
            dTotal := dTotal + StrToFloat(ClienteNumero(sValorRegra)); // CAMILLE - 28.10.2004
         except
         end;

      end;//with

      dtmAPrev.qryAux2.Next;

   end; //while not qryAux2.Eof
   // CAMILLE - 28.10.2004
   // Se não der erro, retornar na sMsgErro o valor total dos alteradores
   // Isso é necessario para exibir no demonstrativo do retroativo sem ter
   // que fazer nenhuma alteração na rotina como criar um novo parametro

   if piOrigem = 6 then sMsgErro := FloatToStr(dTotal); { Augusto 21/01/2005 - piOrigem estava 10 mudou para 6 }
   
   Result   := True;
end;//GravaAlterador

function PreparaContribuicao(piIdPessJur,     piIdPlanoPrev,
                             piIdMotivo,      piSitRecebimento   : integer;
                             qryContrib,      qryAux             : TwwQuery;
                             sSQL,            sSQLRegra,
                             sWhereSQLRegra,  sAliasSQLRegra,
                             sSitFundacao,    sDataRefInicio,
                             sDataRefFinal,   sDescPreparo,
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
                             piOrigem, piFglDtFinalPrevista      : word    // 0 - Outros ,
                                                                           // 1 - Suspensao de contribuicao
                                                                           // 2 - Concessao de Beneficio
                                                                           // 3 - Renovacao de Beneficio
                            ) : boolean;
var
   iMes,                iAno,                 iIdContribuicao,
   iNumRecebimento,     iSitRecebimentoAux,   iOrdem,
   iParcela,            iNumReg,              iUltDiaMes              : integer;

   sNumRecebimento,     sMesHoje,             sAnoHoje,
   sAnoMesDtRefFinal,   sAnoMesHoje,          sAnoMesAtual,
   sAnoMesInicio,       sAnoMesFinal,         sAnoMesCobranca,
   sAnoMesBuscaSalario,
   sUltAnoMesPreparo,   sDataCobranca,        sDataAux,
   sDataRef,            sDataDeveriaTerPago,  sValorRegra,
   sValorFinal,         sSQLRegraAUX,         sCamposObrig,
   sCamposNObrig,       sAno,                 sMes,
   sSQLValues,          sAnoMesCalc13Aux,
   sIdRegraCalculo,     sTpPagto,             sMsgRegra,
   sIdRegra,            sSalarioAux,          sSalarioEncontrado,
   sDataFinalRegra , sFlgDevolucao                                                        : string;

   bControleSalario13,  bEnvioEncerrado,      bJaPerguntouContribZERO,
   bErro,               bErroRegra,           bCalc13,
   bCalc13DtFim , bInsereHst                                             : boolean;

   liExercicio,         liPeriodo,            liEmpresa               : longInt;

   rTotalLote                                                         : real;
   cTipoEnvPrev                                                       : char;
   iFlgIncluiMesConc                                                  : integer;

   dDiferenca                                                         : double;
   sDataGravaAltarador: String;

   bCalc13MeioAno : boolean;
   sUltMes13      : string;
   sUltimo13DoAno, sMes1, sAno1 : string;
   bOutraDataMA   : Boolean;   // Gleyber - 14/09/2006 - Pendência 23307
begin
   Result       := False;
   bErro        := False;
   bCalc13DtFim := False;
   bControleSalario13 := False;
   bCalc13MeioAno := False;
   sUltMes13 := '0000/00';
   iIdCalculoGeral    := -1;
   sMsgErro := '';
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
   if StrToDate(sDataRefInicio) <= date
   then begin
          //sAnoMesHoje := Copy(DateToStr(date), 7,4)+'/'+Copy(DateToStr(date),4,2); //ClaudioR - 19962 - 16/08/2007
          sAnoMesHoje := Copy(FormatDateTime('dd/mm/yyyy', date), 7, 4) + '/' +      //ClaudioR - 19962 - 16/08/2007
                         Copy(FormatDateTime('dd/mm/yyyy', date), 4, 2);             //ClaudioR - 19962 - 16/08/2007

          sMesHoje    := Copy(sAnoMesHoje,6,2);
          sAnoHoje    := Copy(sAnoMesHoje,1,4);
        end
   else
        begin
          sAnoMesHoje := Copy(sDataRefInicio, 7,4)+'/'+Copy(sDataRefInicio,4,2);
          sMesHoje    := Copy(sAnoMesHoje,6,2);
          sAnoHoje    := Copy(sAnoMesHoje,1,4);
        end;

   sAnoMesInicio   := Copy(sDataRefInicio, 7,4) + '/' + Copy(sDataRefInicio, 4,2);

   if Trim(psAnoMesReferencia) = '' then psAnoMesReferencia := sAnoMesHoje;

   // Preencher data da cobranca da contribuicao
   if sSitFundacao = 'AS'
   then begin
      sDataCobranca   := CriticaDataCobrancaSit(dtmAPrev.qry,
                                             IntToStr(iIdFundacao),
                                             IntToStr(piIdPlanoPrev),
                                             sSitFundacao, 'N',
                                             Copy(psAnoMesReferencia,6,2),
                                             Copy(psAnoMesReferencia,1,4));

      //if Trim(sDataCobranca) = '' then sDataCobranca := DateToStr(date);                    //ClaudioR - 19962 - 16/08/2007
      if Trim(sDataCobranca)   = '' then sDataCobranca := FormatDateTime('dd/mm/yyyy', date); //ClaudioR - 19962 - 16/08/2007

      sAnoMesCobranca := psAnoMesReferencia;
   end
   else begin
      sDataCobranca   := CriticaDataCobrancaSit(dtmAPrev.qry,IntToStr(piIdPessJur),
                                             IntToStr(piIdPlanoPrev),
                                             sSitFundacao, 'N',
                                             sMesHoje, sAnoHoje);

      //if Trim(sDataCobranca) = '' then sDataCobranca := DateToStr(date);                    //ClaudioR - 19962 - 16/08/2007 
      if Trim(sDataCobranca) = ''   then sDataCobranca := FormatDateTime('dd/mm/yyyy', date); //ClaudioR - 19962 - 16/08/2007

      sAnoMesCobranca := Copy(sDataCobranca,7,4)+'/'+Copy(sDataCobranca,4,2);
   end;

   sAnoMesCobranca := BuscaMesCobrancaLote( iIdLote, Copy(Trim(sDataCobranca),7,4)+'/'+Copy(sDataCobranca,4,2));


   // Sincronismo : Se for preparo de Ativo ou Mantido parcial
   //               Entao Se a patrocinadora for a Fundacao
   //                     Entao verificar se a Folha CM já foi encerrada
   //                     Senao verificar se o envio do CCP já foi encerrado
   //               Senao Se for preparo de Assistido
   //                     Entao verificar se a Folha de Beneficio já foi encerrada
   bEnvioEncerrado := False;

   // Gleyber - 21/06/2006 - Pendência 22211 - Início
   bOutraDataMA := False;  // Gleyber - 14/09/2006 - Pendência 23307
   If (sSitFundacao = 'MA') And (StrToDate(sDataCobranca) < Date)
    Then Begin

      sMes1 := Copy(ProximoAnoMes(StrToInt(sMesHoje), StrToInt(sAnoHoje)),6,2);
      sAno1 := Copy(ProximoAnoMes(StrToInt(sMesHoje), StrToInt(sAnoHoje)),1,4);

      sMesHoje := sMes1;
      sAnoHoje := sAno1;

      sDataCobranca   := CriticaDataCobrancaSit(dtmAPrev.qry,IntToStr(piIdPessJur),
                                                IntToStr(piIdPlanoPrev),
                                                sSitFundacao, 'N',
                                                sMesHoje, sAnoHoje);    

      //if Trim(sDataCobranca) = '' then sDataCobranca := DateToStr(date);                   //ClaudioR - 19962 - 16/08/2007
      if Trim(sDataCobranca) = '' then sDataCobranca := FormatDateTime('dd/mm/yyyy',  date); //ClaudioR - 19962 - 16/08/2007

      sAnoMesCobranca := Copy(sDataCobranca,7,4)+'/'+Copy(sDataCobranca,4,2);

      { Augusto 21/09/2006 - Periodo processado não deve ser alterado, somente a data de cobrança }
      //sAnoMesInicio   := Copy(sDataCobranca, 7,4) + '/' + Copy(sDataCobranca, 4,2); // Gleyber - 14/09/2006 - Pendência 23307
      //if trim(sAnoMesFinal) = '' then  sAnoMesFinal := sAnoMesInicio;               // Gleyber - 14/09/2006 - Pendência 23307

      sAnoMesHoje := sAno1+'/'+sMes1;                                               // Gleyber - 14/09/2006 - Pendência 23307

      bOutraDataMA := False;                                                        // Gleyber - 14/09/2006 - Pendência 23307
    End;
   // Gleyber - 21/06/2006 - Pendência 22211 - Fim

   if (sSitFundacao = 'AT') or (sSitFundacao = 'MP')
   then begin
      if piIdPessJur = iIdFundacao
      then bEnvioEncerrado := VerificaFechamento( piIdPessJur, cteIdModuloFolhaCM,
                                                  sAnoMesCobranca, 'E',cTipoEnvPrev )
      else bEnvioEncerrado := VerificaFechamento( piIdPessJur, cteIdModuloCCP,
                                                  sAnoMesCobranca, 'E',cTipoEnvPrev );
      sMsgErro := 'O Envio de Contribuições para a Patrocinadora  para o mês '+
                   sAnoMesCobranca+' já foi encerrado.';
   end
   else if (sSitFundacao = 'AS')
        then begin
           bEnvioEncerrado := VerificaFechamento( piIdPessJur, cteIdModuloFolhaBen,
                                                  sAnoMesCobranca, 'E',cTipoEnvPrev );
           sMsgErro := 'A Folha de Benefícios para o mês '+sAnoMesCobranca+' já '+
                       'foi efetivada.';
        end;

   if bEnvioEncerrado
   then begin
      if MsgDlg(sMsgErro+' Deseja preparar estas contribuições para o próximo mês ? ',
                'Confirmação',mtConfirmation, [mbYes, mbNo],0) = mrYes
      then begin
         sMsgErro := sMsgErro+' Preparo interrompido pelo usuário.';
         Exit;
      end;

      if (sSitFundacao <> 'AS')
      then if piIdPessJur = iIdFundacao
           then sAnoMesCobranca := ProximoMesAberto( sAnoMesCobranca,
                                                     piIdPessJur,
                                                     cteIdModuloFolhaCM,
                                                     'E')
           else sAnoMesCobranca := ProximoMesAberto( sAnoMesCobranca,
                                                     piIdPessJur,
                                                     cteIdModuloCCP,
                                                     'E');
   end;

   sMsgErro := '';

   // não assistido
   // Se nao tiver data final -> gerar até hoje
   // Se tiver e for menor que hoje -> gerar até a data
   // Se tiver e for maior que hoje -> gerar até hoje
   // Se data hoje < data inicio -> gerar até inicio

   if trim(sAnoMesFinal) = '' then  sAnoMesFinal := psAnoMesReferencia
   else if sAnoMesFinal < sAnoMesInicio then sAnoMesFinal  := sAnoMesInicio;


   { *** ASSISTIDO *** }
   //  Se situação = AS Então
   //    Se não tiver DataFinal Então
   //      AnoMesFinal := Lote
   //    Senão Se DataFinal < Lote Então
   //      AnoMesFinal := MesDataFinal
   //    Senão AnomesFinal := Lote.

   If (sSitFundacao = 'AS') Then
   Begin
     If Trim(psDataFinalBenef) = ''
     Then // Sem DataFinal
       sAnoMesFinal  := sAnoMesCobranca // Atribui o Lote
     Else If Copy(psDataFinalBenef,7,4)+'/'+Copy(psDataFinalBenef, 4,2) < sAnoMesCobranca
          Then sAnoMesFinal  :=  Copy(psDataFinalBenef,7,4)+'/'+Copy(psDataFinalBenef, 4,2)
          Else sAnoMesFinal  := sAnoMesCobranca
   End;

   // Se for EVENTO e a contribuicao for EXCLUSIVA da patrocinadora
   // Preparar contribuição até o mês - 1
   if (sFlgVeioDoEvento = '1') and (sSitFundacao = 'PT') and
      ( (sDataRefFinal = '') or (StrToDate(sDataRefFinal) > date) )
   then sAnoMesFinal := SAnoMesAnterior(sAnoMesFinal);

   // Verificar o parametro que indica se é para conceder até o mes corrente ou até o mes anterior
   //P.RAMOS - REFER - 04.07.2001
   //      (prmFlgIncluiMesConc = 0) and

   if (piOrigem = 2) or (piOrigem = 3) // Concessao de beneficio
   then begin
     if iIdLote >= 0
     then iFlgIncluiMesConc := PegaFlgIncluiMesConc(iIdLote)
     else iFlgIncluiMesConc := 1;

     if (iFlgIncluiMesConc = 0) and
        ((Copy(psDataFinalBenef,7,4)+'/'+Copy(psDataFinalBenef,4,2) >=
          //Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2)) or //ClaudioR - 19962 - 16/08/2007
          Copy(FormatDateTime('dd/mm/yyyy', date),7,4) + '/' +          //ClaudioR - 19962 - 16/08/2007
          Copy(FormatDateTime('dd/mm/yyyy', date),4,2)) or              //ClaudioR - 19962 - 16/08/2007
         (Trim(psDataFinalBenef) = ''))
     then sAnoMesFinal:=SAnoMesAnterior(sAnoMesFinal);
   end;

   if sAnoMesInicio > sAnoMesFinal then Exit;

   sAnoMesAtual       := sAnoMesInicio;
   iMes               := StrToInt(Copy(sAnoMesAtual,6,2));

   // Só gerar lote de contribuicao caso o idlote esteja < 0
   // Caso contrario, usar mesmo lote gerado anteriomente
   if iIdLote < 0
   then begin
      if sSitFundacao = 'AS'
      then iIdLote := GeraLOTE(iIdFundacao, True,         sAnoMesHoje,
                               'B',         sDescPreparo, sAtrasoDevol,
                               '1',         '0',          '0',
                               //'0',         '0',          DateToStr(date),                  //ClaudioR - 19962 - 16/08/2007
                               '0',         '0',          FormatDateTime('dd/mm/yyyy', date), //ClaudioR - 19962 - 16/08/2007
                               '',          '',           '',
                               '')
      else
           // Gleyber - 14/09/2006 - Pendência 23307 - Início
           If Not bOutraDataMA
             Then iIdLote := GeraLOTE(piIdPessJur, True,         sAnoMesHoje,
                               'P',         sDescPreparo, sAtrasoDevol,
                               '1',         '0',          '0',
                               //'0',         '0',          DateToStr(date),                  //ClaudioR - 19962 - 16/08/2007
                               '0',         '0',          FormatDateTime('dd/mm/yyyy', date), //ClaudioR - 19962 - 16/08/2007
                               '',          '',           '',
                                     '')
             Else iIdLote := GeraLOTE(piIdPessJur, True,         sAnoMesHoje,
                                      'P',         sDescPreparo, sAtrasoDevol,
                                      '1',         '0',          '0',
                                      '0',         '0',          sDataCobranca,
                                      '',          '',           '',
                               '');
           // Gleyber - 14/09/2006 - Pendência 23307 - Fim
      sAnoMesCobranca := BuscaMesCobrancaLote( iIdLote, Copy(Trim(sDataCobranca),7,4)+'/'+Copy(sDataCobranca,4,2));
      { Augusto 26/07/2006 }
   end;

   if iIdLote < 0
   then begin
      sMsgErro := ' Erro na geração do lote de contribuições. ';
      Exit;
   end;

   if (sSitFundacao = 'AS') and ((piOrigem = 2) or (piOrigem = 3))
   then begin
      if piFglDtFinalPrevista = 0
      then sDataFinalRegra := psDataFinalBenef
      else sDataFinalRegra := ''
   end
   else sDataFinalRegra := sDataRefFinal;


   sSalarioAux         := sSalarioPart;
   iSitRecebimentoAux  := piSitRecebimento;


   // Preencher variável com o ultimo mês do ano onde a patrocinadora paga 13o.
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT  MAX(MESREFERENCIA) AS ULTIMO13DOANO FROM PARAMSAL13  '+
                  ' WHERE   IDPESSJUR     = '+IntToStr(piIdPessJur)+
                  ' AND     EXERCICIO     = '+Copy(sAnoMesAtual,1,4)+
                  ' AND     MESREFERENCIA <= '''+sAnoMesAtual+'''');
   qryAux.Open;
   if (not qryAux.IsEmpty) and (qryAux.FieldByName('ULTIMO13DOANO').AsString <> '')
   then sUltimo13DoAno := qryAux.FieldByName('ULTIMO13DOANO').AsString
   else sUltimo13DoAno := '9999/99';

   // A qry está com as contribuicoes da CONTRIBPREVPARTP que devem ser preparadas
   qryContrib.First;
   while not qryContrib.eof do
   begin
      bCalc13MeioAno := False;
      sUltMes13      := '0000/00';

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

      //bCalc13 := pbPrepararSoMes13; //leocm - 2801 - comentei
      bJaPerguntouContribZERO := False;

      if pbPrepararSoMes13
      then sAnoMesFinal := sAnoMesAtual;

      while (sAnoMesAtual <= sAnoMesFinal) do
      begin

        if sSitFundacao = 'AS'
        then begin
          sDataGravaAltarador   := CriticaDataCobrancaSit(dtmAPrev.qry,
                                                 IntToStr(iIdFundacao),
                                                 IntToStr(piIdPlanoPrev),
                                                 sSitFundacao, 'N',
                                                 Copy(psAnoMesReferencia,6,2),
                                                 Copy(psAnoMesReferencia,1,4));
        end
        else begin
          sDataGravaAltarador   := CriticaDataCobrancaSit(dtmAPrev.qry,IntToStr(piIdPessJur),
                                                 IntToStr(piIdPlanoPrev),
                                                 sSitFundacao, 'N',
                                                 Copy(sAnoMesAtual,6,2),
                                                 Copy(sAnoMesAtual,1,4));
        end;

         iIdContribuicao   := qryContrib.fieldbyname('IdContribuicao').AsInteger;
         sSalarioPart      := sSalarioAux;

         // Verificar se a data de inicio da contribuicao é igual ou anterior ao anomesatual
         if Copy(qryContrib.FieldByName('DATAINICIO').AsString,7,4)+'/'+Copy(qryContrib.FieldByName('DATAINICIO').AsString,4,2) > sAnoMesAtual
         then begin
            sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
            continue;
         end;


         //=================================
         //=== Tratamento de décimo terceiro
         //=================================

         if ((copy(sAnoMesAtual,6,2) = '12') and (bCalc13DtFim or bCalc13 )) or
            ((copy(sAnoMesAtual,6,2) <> '12') and (bCalc13DtFim)) or
            (pbPrepararSoMes13) or
            (bCalc13MeioAno)
         then begin
            if pbPrepararSoMes13 and
               ((dtmAPrev.qryAuxContrib.FieldByName('FLGCOBRADECTERC').AsInteger = 0) or
                (dtmAPrev.qryAuxContrib.FieldbyName('FLGCOBRA13DTFIM').AsInteger = 0))
            then begin
               sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
               continue;
            end
            else begin
                 sAnoMesCalc13Aux := copy(sAnoMesAtual,1,5)+'13';
                 bControleSalario13 := bCalc13DtFim;
                 bCalc13DtFim     := False;
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
               then sSalarioPart := OraNumero(FloatToStr(ValorProRataPrimeiro(sSalarioPart,sDataRefInicio)))
               else sSalarioPart := OraNumero(FloatToStr(ValorProRataUltimo(sSalarioPart,sDataRefFinal)));
            end
            else begin
               //if (sAnoMesAtual = sAnoMesFinal) and
               if (sAnoMesAtual = copy(sDataRefFinal,7,4)+copy(sDataRefFinal,3,3)) and //leocbs - 2609
                  (sDataRefFinal <> '')         and
                  (Copy(sAnoMesCalc13Aux,6,2) <> '13') and
                  //(StrToDate(sDataRefFinal) <= date ) and  //leocbs - 2609
                  //(sAnoMesFinal <= sAnoMesHoje) and  //leocbs - 2609
                  (copy(sDataRefFinal,7,4)+copy(sDataRefFinal,3,3) <= sAnoMesHoje) and //leocbs - 2609
                  (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString = '') and
                  (Trim(sSalarioPart) <> '') and
                  (sFlgIntEvento <> 'IP') and (sFlgIntEvento <> 'RM') and
                  (sFlgIntEvento <> 'MP') and (sFlgIntEvento <> 'DM') and
                  (sFlgIntEvento <> 'AF') and (sFlgIntEvento <> 'PD')
               then begin
                  sSalarioPart  := OraNumero(FloatToStr(ValorProRataUltimo(sSalarioPart,sDataRefFinal)));
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
                  (sDataRefFinal <> '')               and
                  (sAnoMesAtual   = sAnoMesFinal)     and
                  (sAnoMesFinal  <= sAnoMesHoje)
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
                  // GLEYBER - 18/03/2002
                  // Se for primeiro ou ultimo pagamento
                  // E Regra de primeiro / ultimo pagamento estiver preenchida
                  // Entao pegar salario integral -> BUSCASALARIOPPESSOAINTEGRAL
                  // Senao usar salario passado por parametro
                  if (sAnoMesAtual  = sAnoMesInicio) and   // 1º pagamento
                     //(sAnoMesInicio < sAnoMesFinal )  and  // Último pagamento
                     (sAnoMesInicio < copy(sDataRefFinal,7,4)+copy(sDataRefFinal,3,3)) and
                     (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString <> '') and // Regra de primeiro pagamento
                     (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString <> '')      // Regra de último pagamento
                  Then sSalarioEncontrado := BuscaSalarioPESSOAINTEGRAL( dtmAPrev.qry,
                                                                         piIdPessJur,  piIdPlanoPrev,
                                                                         qryContrib.FieldByName('IDPESSOA').AsInteger,
                                                                         qryContrib.FieldByName('SEQPROPOSTA').AsInteger,
                                                                         sSitFundacao, sAnoMesAtual )

                  Else sSalarioEncontrado :=   sSalarioPart;
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
                if (StrToInt(copy(sDataRefInicio,1,2)) >= 29) and
                   (StrToInt(copy(sAnoMesAtual,6,2)) = 2)
                then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                else sDataRef := copy(sDataRefInicio,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);

                //leofuncef - 23052005
                If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
                Then  sDataRef := '30'+Copy(sDataRef,3,9);
                //leofuncef - fim

                // Testar se está no mes de 1o. ou ultimo pagamento, e tem regra de primeiro ou ultimo.
                // Se for este o caso, obrigar a usar salario integral, passando como tipo de calculo a letra I
               if // teste de primeiro pagamento
                   ( (sAnoMesAtual = sAnoMesInicio) and
                     (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString <> '') and
                     (Copy(sDataRefInicio,1,2) <> '01' ) and
                     (
                       (Trim(sDataRefFinal) = '') or
                       ((Trim(sDataRefFinal) <> '') and (Copy(sDataRefInicio,4,7) <> Copy(sDataRefFinal,4,7)) )
                     )
                   ) OR
                    // teste de ultimo pagamento
                  ( //(sAnoMesAtual = sAnoMesFinal) and //leocbs - 2609
                    (sAnoMesAtual = copy(sDataRefFinal,7,4)+copy(sDataRefFinal,3,3)) and
                    (sDataRefFinal <> '')         and
                    //(sAnoMesFinal <= sAnoMesHoje) and  //leocbs - 2609
                    (copy(sDataRefFinal,7,4)+copy(sDataRefFinal,3,3) <= sAnoMesHoje) and
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
                                                         'I',
                                                         'HSTCONTRIBPREV','VALORESPERADO',
                                                         sSalarioPart, sIdSitPart,
                                                         sDataRefInicio,
                                                         sDataFinalRegra, piOrigem,-1, sAnoMesCobranca, iIdLote)
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
                                                         sDataRefInicio,
                                                         sDataFinalRegra, piOrigem,-1, sAnoMesCobranca,iIdLote);
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
                  if ((copy(sAnoMesAtual,6,2) = '12') and (bCalc13)) or (bCalc13DtFim)
                  then bCalc13 := False
                  else begin
                     sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
                     bCalc13       := True;
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
            if Copy(sAnoMesCalc13Aux,6,2) = '13'
            then begin
               sTpPagto := '';
               if (Copy(sAnoMesAtual,1,4) = Copy(sAnoMesInicio,1,4)) and
                  (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPGTO13').AsString <> '')
               then begin
                  sTpPagto := 'P';
                  sMsgRegra:= 'Primeiro';
                  sIdRegra := dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPGTO13').AsString;

                  if (StrToInt(copy(sDataRefInicio,1,2)) >= 29) and
                     (StrToInt(copy(sAnoMesAtual,6,2)) = 2)
                  then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                  else sDataRef := copy(sDataRefInicio,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);

                  //leofuncef - 23052005
                  If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
                  Then  sDataRef := '30'+Copy(sDataRef,3,9);
                  //leofuncef - fim
               end;

               //if (Copy(sAnoMesAtual,1,4) = Copy(sAnoMesFinal,1,4)) and //leocbs - 2609
               if (Copy(sAnoMesAtual,1,4) = copy(sDataRefFinal,7,4)) and //leocbs - 2609
                  (sDataRefFinal <> '')          and
                  //(sAnoMesFinal  <= sAnoMesHoje) and  //leocbs - 2609
                  (copy(sDataRefFinal,7,4)+copy(sDataRefFinal,3,3) <= sAnoMesHoje) and //leocbs - 2609
                  (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPGTO13').AsString <> '')
               then begin
                  sTpPagto := 'U';
                  sMsgRegra:= 'Último';
                  sIdRegra := dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPGTO13').AsString;

                  if (StrToInt(copy(sDataRefFinal,1,2)) >= 29) and
                     (StrToInt(copy(sAnoMesAtual,6,2))   = 2)
                  then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                  else sDataRef := copy(sDataRefFinal,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);

                  //leofuncef - 23052005
                  If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
                  Then  sDataRef := '30'+Copy(sDataRef,3,9);
                  //leofuncef - fim
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
                                     sDataRefInicio,
                                     sDataFinalRegra, piOrigem,-1, sAnoMesCobranca,iIdLote);

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
                  (Copy(sDataRefInicio,1,2) <> '01' ) and 
                  (
                    (Trim(sDataRefFinal) = '') or
                    ((Trim(sDataRefFinal) <> '') and (Copy(sDataRefInicio,4,7) <> Copy(sDataRefFinal,4,7)) )
                  )
               then begin
                  // Se a regra de primeiro pagamento estiver em branco, supor
                  // que o valor do primeiro pagamento é igual ao valor total
                  if (StrToInt(copy(sDataRefInicio,1,2)) >= 29) and
                     (StrToInt(copy(sAnoMesAtual,6,2)) = 2)
                  then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                  else sDataRef := copy(sDataRefInicio,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);

                  //leofuncef - 23052005
                  If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
                  Then  sDataRef := '30'+Copy(sDataRef,3,9);
                  //leofuncef - fim

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
                                   sDataRefInicio,
                                   sDataFinalRegra, piOrigem,-1, sAnoMesCobranca,iIdLote);

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

                  //  if StrToFloat(ClienteNumero(sValorRegra)) < 0 then
                  if StrToFloat(ClienteNumero(sValorRegra)) >= 0
                  then sValorFinal := sValorRegra;
               end;  // if MesAtual = MesInicio

               //if (sAnoMesAtual = sAnoMesFinal) and  //leocbs - 2609
               if (sAnoMesAtual = copy(sDataRefFinal,7,4)+copy(sDataRefFinal,3,3)) and //leocbs - 2609
                  (sDataRefFinal <> '')         and
                  //(sAnoMesFinal <= sAnoMesHoje) and //leocbs - 2609
                  (copy(sDataRefFinal,7,4)+copy(sDataRefFinal,3,3) <= sAnoMesHoje) and //leocbs - 2609
                  (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString <> '')
               then begin
                     if (StrToInt(copy(sDataRefFinal,1,2)) >= 29) and
                        (StrToInt(copy(sAnoMesAtual,6,2))   = 2)
                     then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                     else sDataRef := copy(sDataRefFinal,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);

                     //leofuncef - 23052005
                     If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
                     Then  sDataRef := '30'+Copy(sDataRef,3,9);
                     //leofuncef - fim

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
                                      sDataRefInicio,
                                      sDataFinalRegra, piOrigem,-1, sAnoMesCobranca,iIdLote);

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
              if (piOrigem <> 2) and (piOrigem <> 3) then
              begin
                if sDataRefFinal <> ''
                then begin
                   sAnoMesDtRefFinal :=  Copy(sDataRefFinal,7,4)+'/'+Copy(sDataRefFinal,4,2);
                   if (sAnoMesAtual   =  sAnoMesDtRefFinal) and
                      (sAnoMesFinal  <= sAnoMesHoje)        and
                      (dtmAPrev.qryAuxContrib.FieldbyName('FlgCobra13DtFim').AsInteger = 1)
                   then bCalc13DtFim := True;
                end;
              end
              else begin
                if psDataFinalBenef <> ''
                then begin
                   sAnoMesDtRefFinal :=  Copy(psDataFinalBenef,7,4)+'/'+Copy(psDataFinalBenef,4,2);
                   if (sAnoMesAtual   =  sAnoMesDtRefFinal) and
                      (sAnoMesFinal  <= sAnoMesHoje)        and
                      (piFglDtFinalPrevista = 0 )           and
                      (dtmAPrev.qryAuxContrib.FieldbyName('FlgCobra13DtFim').AsInteger = 1)
                   then bCalc13DtFim := True;
                end;
              End;
            end; // fim contribuicao <> 13

         end else begin // if not bValorQry
           sValorFinal := qryContrib.FieldByName('Valor').AsString;
         end;

         { Inicio Augusto 22/06/2006 - Valores podem vir zerados ou negativos   }
         { em casos da FUNCEF. Neste caso sistema não deve fazer acerto nenhum. }

         //if StrToFloat(ClienteNumero(sValorFinal) ) <= 0
         //then begin
         //   // repetir codigo para continuar loop
         //   if ((copy(sAnoMesAtual,6,2) = '12') and (bCalc13)) or (bCalc13DtFim)
         //   then bCalc13 := false
         //   else begin
         //      sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
         //      { Augusto 06/04/2004 }
         //      //bCalc13 := true;
         //      { Augusto 23/03/2004 }
         //      bCalc13Meioano := False;
         //
         //   end;
         //   // continuar loop
         //   continue;
         //end;

         If StrToFloat( ClienteNumero( sValorFinal ) ) > 0 Then Begin

           //verifica caso de duplicação de histórico
           dtmAPrev.qry.Close;
           dtmAPrev.qry.Sql.Clear;
           dtmAPrev.qry.Sql.Add(' SELECT /*+ INDEX (HSTCONTRIBPREV XAK1HSTCONTRIBPREV) */   '+
                                '        CODREFERENCIA, MESREFERENCIA,MESCOBRANCA,NUMRECEBIMENTO, '+
                                '        IDLOTE, VALORESPERADO, VALORRECEBIDO, FLGINTEVENTO       '+
                                ' FROM HSTCONTRIBPREV                                             '+
                                ' WHERE  MESREFERENCIA  = '''+sAnoMesCalc13Aux+''''+
                                ' AND    MESCOBRANCA    = '''+sAnoMesCobranca+''' '+
                                ' AND    IDPESSOA       = '+qryContrib.FieldByName('IdPessoa').AsString+
                                ' AND    SEQPROPOSTA    = '+qryContrib.FieldByName('SeqProposta').AsString+
                                ' AND    IDCONTRIBUICAO = '+qryContrib.FieldByName('IdContribuicao').AsString+
                                ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                                ' AND    IDPESSJUR      = '+IntToSTr(piIdPessJur)+
                                ' AND    NVL(CODREFERENCIA,MESREFERENCIA)  = '''+sAnoMesCalc13Aux+''' ');
           dtmAPrev.qry.Open;
           if not dtmAPrev.qry.IsEmpty then begin

              if ((dtmAPrev.qry.FieldByName('CODREFERENCIA').AsString = '')              or
                  (Copy(dtmAPrev.qry.FieldByName('MESREFERENCIA').AsString,6,2) <> '13') or
                  (dtmAPrev.qry.FieldByName('IDLOTE').AsInteger <> iIdLote) ) AND
                  ( dtmAPrev.qry.FieldByName('FLGINTEVENTO').AsString = sFlgIntEvento )
              then begin
                 sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
                 continue;
              end;

           end;

           // Verifica se já a contribuicao já foi calculada para o mes informado
           // com excessao do caso da contribuicao ser exclusiva da patrocinadora,
           // pois neste caso, mesmo que a contribuicao já tenha sido calculada,
           //ela deverá ser calculada novamente, apenas para um participante.
           if (sSitFundacao <> 'PT') then begin
              dtmAPrev.qry.Close;
              dtmAPrev.qry.Sql.Clear;
              dtmAPrev.qry.Sql.Add(' SELECT /*+ INDEX (HSTCONTRIBPREV XAK1HSTCONTRIBPREV) */                         '+
                                   '        NUMRECEBIMENTO, IDLOTE, VALORESPERADO, VALORRECEBIDO FROM HSTCONTRIBPREV '+
                                   ' WHERE  MESREFERENCIA  = '+''''+sAnoMesCalc13Aux+'''                             '+
                                   ' AND    IDPESSOA       = '+qryContrib.FieldByName('IdPessoa').AsString            +
                                   ' AND    SEQPROPOSTA    = '+qryContrib.FieldByName('SeqProposta').AsString         +
                                   ' AND    IDCONTRIBUICAO = '+qryContrib.FieldByName('IdContribuicao').AsString      +
                                   ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)                                +
                                   ' AND    IDPESSJUR      = '+IntToSTr(piIdPessJur)                                  +
                                   ' AND    FLGSITFUNDACAO = '''+sSitFundacao+''''                                    +
                                   ' AND    CODREFERENCIA  = '''+sAnoMesAtual+'''                                    ');
              dtmAPrev.qry.Open;
           end;


           sFlgDevolucao := '0';
           bInsereHst := True;
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

         End Else Begin

           bInsereHst:= False;

         End; { If StrToFloat( ClienteNumero( sValorFinal ) ) > 0 Then Begin }

         { Fim Augusto 22/06/2006                                             }

         if bInsereHst then begin

           // Gerar numero do recebimento
           iNumRecebimento := LeUltRegistro(dtmAPrev.qry, 'HSTCONTRIBPREV');

           // Calcular número da parcela
           iParcela := 0;
           if iParcela < 0 then iParcela := 0;

           // Inserir valor final na HSTCONTRIBPREV
           with dtmAPrev.qry do
           begin
              sSQLValues := ''''+sAnoMesCalc13Aux+''''; // MESREFERENCIA
              sSQLValues := sSQLValues+','''+sAnoMesCobranca+'''';
              sSQLValues := sSQLValues+',' +IntToStr(iNumRecebimento);
              sSQLValues := sSQLValues+',' +IntToStr(piIdMotivo);
              if (Trim(qryContrib.FieldByName('CodPortForma').AsString) <> '') and
                 (qryContrib.FieldByName('CodPortForma').AsInteger > 0)
              then sSQLValues := sSQLValues+', ' +qryContrib.FieldByName('CodPortForma').AsString
              else sSQLValues := sSQLValues+', NULL ';
              sSQLValues := sSQLValues+', TO_DATE('''+sDataCobranca+''',''DD/MM/YYYY'') ';// DATAPREVISAORECE


              sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);  // VALORESPERADO
              sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);  // VALORCALCULADO

              sSQLValues := sSQLValues+', '+dtmAPrev.qryAuxContrib.FieldByName('IdRegraCalculo').AsString;  // IDREGRACALCULO
              sSQLValues := sSQLValues+', '+qryContrib.FieldByName('FlgDescFolha').AsString;
              sSQLValues := sSQLValues+', '+qryContrib.FieldbyName('IdPessoa').AsString;
              sSQLValues := sSQLValues+', '+qryContrib.FieldbyName('SeqProposta').AsString;
              sSQLValues := sSQLValues+', '+IntToStr(piIdPessJur);
              sSQLValues := sSQLValues+', '+IntToStr(piIdPlanoPrev);
              sSQLValues := sSQLValues+', '+qryContrib.FieldByName('IdContribuicao').AsString;
              sSQLValues := sSQLValues+', 0'; // FLGCALCRESERVA
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


              if dtmAPrev.qryAuxContrib.FieldByName('FlgNaoExigeRec').AsString = '1'
              // ANDRE DB2 SITRECEBIMENTO STRING
              then sSQLValues := sSQLValues+', '+'''2'''                      //SITRECEBIMENTO
              else sSQLValues := sSQLValues+', '+IntToStr(piSitRecebimento); //SITRECEBIMENTO

              sSQLValues := sSQLValues+', ''F''';   //TIPO
              sSQLValues := sSQLValues+', '+IntToStr(iIdLote);         //IDLOTE
              sSQLValues := sSQLValues+', '+IntToStr(iParcela);        //PARCELA


              if dtmAPrev.qryAuxContrib.FieldByName('FlgNaoExigeRec').AsString = '1'
              then begin
                     sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);   //VALORECEBIDO
                     sSQLValues := sSQLValues+', TO_DATE('''+sDataCobranca+''',''DD/MM/YYYY'') '; //DATARECEBIMENTO
                   end
              else begin
                     sSQLValues := sSQLValues+', NULL';   //VALORECEBIDO
                     sSQLValues := sSQLValues+', NULL';   //DATARECEBIMENTO
                   end;

              if sSitFundacao = 'AS'                  // flgconcessao
              then sSQLValues := sSQLValues +', 1 '
              else sSQLValues := sSQLValues +', 0 ';

              if sFlgVeioDoEvento <> ''
              then sSQLValues := sSQLValues +', 1 '
              else sSQLValues := sSQLValues +', 0 ';

              sSQLValues := sSQLValues +', SYSDATE ';

              if Trim(sFlgIntEvento) <> ''
              then sSQLValues := sSQLValues + ', '''+sFlgIntEvento+''''
              else sSQLValues := sSQLValues +', NULL ';

              sSQLValues := sSQLValues +', '+sFlgDevolucao+' '; //FLGDEVOLUCAO



              //leocbs - 28052002 - inicio
              if sSitFundacao = 'AS'      // FOLHAORIGEM
              then sSQLValues := sSQLValues +', ''B'' '
              else
              begin
                 //leocm - 31102002 - inicio
                 if qryContrib.FieldByName('FlgDescFolha').AsString = '0' then
                 sSQLValues := sSQLValues +', ''C'' '
                 else   sSQLValues := sSQLValues +', ''P'' ';
                 //leocm - 3110200 - fim
              end;
              //leocbs - 28052002 - fim

              sSQLValues := sSQLValues+','''+sAnoMesAtual+'''';
              Close;
              SQL.Clear;
              SQL.Add(' INSERT INTO HSTCONTRIBPREV (MESREFERENCIA,MESCOBRANCA,NUMRECEBIMENTO,IDMOTIVO,'+
                      '                             CODPORTFORMA,DATAPREVISAORECE,'+
                      '                             VALORESPERADO,VALORCALCULADO,IDREGRACALCULO, '+
                      '                             FLGDESCFOLHA,IDPESSOA,SEQPROPOSTA,IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
                      '                             FLGCALCRESERVA,VALOROP1,VALOROP2,VALOROP3,DATAINICIO,DATAFINAL,         '+
                      '                             FLGSITFUNDACAO,SITRECEBIMENTO,TIPO,IDLOTE,PARCELA, '+
                      '                             VALORRECEBIDO, DATARECEBIMENTO, FLGCONCESSAO, FLGEVENTO, '+
                      '                             DATAEMISSCOB,  FLGINTEVENTO, FLGDEVOLUCAO, FOLHAORIGEM, CODREFERENCIA  ) '+ //leocbs - 28052002 - incluí folhaorigem
                      ' VALUES('+sSQLValues+')');                                                                              // camille - 28.11.2003
              try
                 Execsql;
                 inc(iNumReg);
                 rTotalLote        := rTotalLote + StrToFloat(ClienteNumero(sValorFinal));
                 sUltAnoMesPreparo := sAnoMesAtual;
              except
                 sMsgErro := 'Erro na gravação do Histórico de Contribuições. ';
                 bErro := True;
                 break;
              end;

           end; //with

         end;//if binserehst


         // Se a contribuicao for atrasada E nao for de assistido
         // Entao Gravar Alteradores
         // Obs.: No caso dos assistidos, quem vai calcular os alteradores é a
         // folha de beneficios
         if (sAnoMesAtual < sAnoMesHoje) and (sSitFundacao <> 'AS')
             And ( StrToFloat( ClienteNumero( sValorFinal ) ) > 0 ) { Augusto 21/06/2006 }
         then begin
            //== Grava no HistoricoDeAtraso e faz o Envio para TmpDesc
            //  A data de recebimento é a data calculada pelo Calendario no mes
            // atual (hoje)
            sAno := Copy(sAnoMesCalc13Aux,1,4);
            sMes := Copy(sAnoMesCalc13Aux,6,2);

            if Copy(sAnoMesAtual,6,2) = '12'
            then
               if Trim(sMes) = '13' then sMes := '12'
               else
            else  sMes := Copy(sAnoMesAtual,6,2);


            if sSitFundacao = 'AS'
            then sDataDeveriaTerPago := CriticaDataCobrancaSit(dtmAPrev.qry,
                                             IntToStr(iIdFundacao),
                                             IntToStr(piIdPlanoPrev),
                                             sSitFundacao, 'N',
                                             sMes, sAno)
            else sDataDeveriaTerPago := CriticaDataCobrancaSit(dtmAPrev.qry,IntToStr(piIdPessJur),
                                             IntToStr(piIdPlanoPrev),
                                             sSitFundacao, 'N',
                                             sMes, sAno);

            if not GravaAlterador('A',sAnoMesCalc13Aux,
                        sAnoMesCobranca,
                        sFlgVeioDoEvento,
                        iNumRecebimento,
                        piIdMotivo,
                        piIdPlanoPrev,
                        qryContrib.FieldByName('IdContribuicao').AsInteger,
                        piIdPessJur,
                        sDataRefInicio,
                        sDataGravaAltarador,  // DATAPREVISAORECEBIMENTO CGUEDES - 16/09/2002
                        sDataCobranca,        // DATAEFETIVARECEBIMENTO
                        sValorFinal,
                        sMsgErro,
                        qryContrib.FieldByName('IdPessoa').AsInteger)
            then begin
               if Trim(sMsgErro) = ''
               then  sMsgErro := ' Erro na gravação dos alteradores da contribuição. ';
               bErro    := True;
               break;
            end;
         end; //if sAnoMesAtual < sAnoMesHoje



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

         //=================================
         //=== Tratamento de décimo terceiro
         //=================================
         // CAMILLE - 28.11.2003
         if (dtmAPrev.qryAuxContrib.FieldByName('FLGCOBRADECTERC').AsInteger = 1)
            and (not bCalc13MeioAno)
         then begin
            // Se for o mes que a patrocinadora paga o 13o. salario, entao
            // gerar o salario de 13o. para este participante
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' SELECT  MESREFERENCIA, IDREGRA AS IDRGSALARIO13 FROM PARAMSAL13  '+
                           ' WHERE   IDPESSJUR     = '+IntToStr(piIdPessJur)+
                           ' AND     EXERCICIO     = '+Copy(sAnoMesAtual,1,4)+
                           ' AND     MESREFERENCIA = '''+sAnoMesAtual+'''');
            qryAux.Open;
            if not qryAux.IsEmpty
            then begin
               bCalc13MeioAno := True;
               sUltMes13      := sAnoMesAtual;
               continue;
            end
            else  //leofuncef - 23032004
            begin

               //leocm - 17022006
               //caso o mês de início do loop seja maior que o úlimo mês de pagamento de 13 cadastrado,
               //ainda no mesmo ano, então, calcular.
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(' SELECT  MAX(MESREFERENCIA) MES '+
                              ' FROM PARAMSAL13  '+
                              ' WHERE   IDPESSJUR     = '+IntToStr(piIdPessJur)+
                              ' AND     EXERCICIO     = '+Copy(sAnoMesAtual,1,4));
               qryAux.Open;


               if (trim(qryaux.fieldbyname('MES').AsString) <> '') and
               (copy(sAnoMesInicio,1,4) = copy(qryaux.fieldbyname('MES').AsString,1,4)) and
               (sAnoMesInicio > qryaux.fieldbyname('MES').AsString) then
               begin
                  bCalc13MeioAno := True;
                  sUltMes13      := sAnoMesAtual;
                  continue;
               end;
               //leocm - 17022006


               bCalc13MeioAno := False;
               sUltMes13      := sAnoMesAtual;
               { Augusto 02/04/2004 }
               sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
               continue;
            end;

            // CAMILLE - 14.01.2003
            if (sUltimo13DoAno <> '9999/99')      and
               (sAnoMesInicio  >  sUltimo13DoAno) and
               (sAnoMesAtual   =  sAnoMesInicio)
            then begin
               bCalc13MeioAno := True;
               sUltMes13      := sAnoMesAtual;
               continue;
            end;

         end;

         if (dtmAPrev.qryAuxContrib.FieldByName('FLGCOBRADECTERC').AsInteger = 1) and
            (((copy(sAnoMesAtual,6,2) = '12') and (bCalc13)) or (bCalc13DtFim))
         then begin
            bCalc13        := False;
            bCalc13Meioano := False; // cmialle - 17.12.2003
            if pbPrepararSoMes13
            then sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
         end
         else begin
            sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
            // CAMILLE - 17.12.2003
            if bCalc13Meioano
            then bCalc13 := False
            else bCalc13 := True;
            bCalc13Meioano := False;
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

   if (not bErro) and (bAtualizaTotalLote)
   then begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE CTRLINTERFACE '+
                     ' SET    FLGPREPARADO = 1, '+
                     //'        DATAPREPARO  = TO_DATE('''+DateToStr(date)+''', ''dd/mm/yyyy'' ), '+                      //ClaudioR - 19962 - 16/08/2007
                     '        DATAPREPARO  = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', date) + ''', ''dd/mm/yyyy'' ), '+ //ClaudioR - 19962 - 16/08/2007
                     '        NUMREG = '+IntToStr(iNumReg)+', '+
                     '        VLRTOTAL = '+OraNumero(FloatToStr(rTotalLote)) +
                     ' WHERE  IDLOTE   = '+IntToStr(iIdLote));
      try
         qryAux.ExecSQL;
      except
         sMsgErro := ' Erro na atualização do total do lote. ';
         bErro    := True;
         Exit;
      end;
   end;
   qryContrib.Close;
   Result    := bErro;
end;//PreparaContribuicao

function PreparaContribuicaoASSISTIDO(piIdPessJur,     piIdPlanoPrev,
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
                             piOrigem,                                     // 0 - Outros ,
                                                                           // 1 - Suspensao de contribuicao
                                                                           // 2 - Concessao de Beneficio
                                                                           // 3 - Renova
                             piFlgDtFinalPrevista                : word;
                             psDataInicioOriginal                : string; // apenas para Renovacao

                             piNumProcesso       : longint //leocbs - 29052002


                            ) : boolean;
var
   iMes,                iAno,                 iIdContribuicao,
   iNumRecebimento,     iSitRecebimentoAux,   iOrdem,
   iParcela,            iNumReg,              iUltDiaMes              : integer;

   sNumRecebimento,     sMesHoje,             sAnoHoje,
   sAnoMesLote,
   sAnoMesDtRefFinal,   sAnoMesHoje,          sAnoMesAtual,
   sAnoMesInicio,       sAnoMesFinal,
   sAnoMesBuscaSalario,
   sUltAnoMesPreparo,
   sDataPrevisaoRece,
   sDataCobranca,        sDataAux,
   sDataRef,            sDataDeveriaTerPago,  sValorRegra,
   sValorFinal,         sSQLRegraAUX,         sCamposObrig,
   sCamposNObrig,       sAno,                 sMes,
   sSQLValues,           sAnoMesCalc13Aux,
   sIdRegraCalculo,     sTpPagto,             sMsgRegra,
   sIdRegra,            sSalarioAux,          sSalarioEncontrado,
   sDataFinalRegra                                                         : string;

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
   bEhMesAbono, bAbonoNoFinalDoAno                                                 : boolean; // camille - 05.08.2002

   sAnoMesAbono, sAnoMesDIP, sFlagProvisorio                                        : String;
   iIdBeneficio : Integer;
begin
   Result       := False;
   bErro        := False;
   bCalc13DtFim := False;
   bControleSalario13 := False;
   iIdCalculoGeral    := -1;
   sMsgErro           := '';
   sDataRenova        := psDataInicioBenef;
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

      If ( piOrigem = 3 )
      Then sMsgErro := sMsgErro + #13 + 'Verificar DATACANCELAMENTO do associado.'; { Augusto 02/04/2007 }

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
          //sAnoMesHoje := Copy(DateToStr(date), 7,4)+'/'+Copy(DateToStr(date),4,2); //ClaudioR - 19962 - 16/08/2007
          sAnoMesHoje := Copy(FormatDateTime('dd/mm/yyyy', date), 7,4) + '/' +       //ClaudioR - 19962 - 16/08/2007
                         Copy(FormatDateTime('dd/mm/yyyy', date),4,2);               //ClaudioR - 19962 - 16/08/2007
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
                                             Copy(psAnoMesReferencia,1,4));

      //if Trim(sDataCobranca) = '' then sDataCobranca := DateToStr(date);                  //ClaudioR - 19962 - 16/08/2007
      if Trim(sDataCobranca) = '' then sDataCobranca := FormatDateTime('dd/mm/yyyy', date); //ClaudioR - 19962 - 16/08/2007

   end
   else begin
      sDataCobranca   := CriticaDataCobrancaSit(dtmAPrev.qry,IntToStr(piIdPessJur),
                                             IntToStr(piIdPlanoPrev),
                                             sSitFundacao, 'N',
                                             sMesHoje, sAnoHoje);

      //if Trim(sDataCobranca) = '' then sDataCobranca := DateToStr(date);                  //ClaudioR - 19962 - 16/08/2007
      if Trim(sDataCobranca) = '' then sDataCobranca := FormatDateTime('dd/mm/yyyy', date); //ClaudioR - 19962 - 16/08/2007
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
   // P.RAMOS - REFER - 04.07.2001
   //      (prmFlgIncluiMesConc = 0) and
   if (piOrigem = 2) or (piOrigem = 3) // Concessao de beneficio
      or (piOrigem = 7) { Augusto 09/03/2005 - 7 Migração de Planos }
   then begin
     if iIdLote >= 0
     then iFlgIncluiMesConc := PegaFlgIncluiMesConc(iIdLote)
     else iFlgIncluiMesConc := 1;

     // CAMILLE - 26.06.2003
     if (iFlgIncluiMesConc = 0)
     then begin
        if Trim(psDataFinalBenef) = ''
        then sAnoMesFinal := SAnoMesAnterior(sAnoMesLote)
        else begin
           if (Copy(psDataFinalBenef,7,4)+'/'+Copy(psDataFinalBenef,4,2)) >= sAnoMesLote
           then sAnoMesFinal := SAnoMesAnterior(sAnoMesLote);
        end;
     end;
   end;

   if sAnoMesInicio > sAnoMesFinal then Exit;

   sAnoMesAtual       := sAnoMesInicio;
   iMes               := StrToInt(Copy(sAnoMesAtual,6,2));

   // Só gerar lote de contribuicao caso o idlote esteja < 0
   // Caso contrario, usar mesmo lote gerado anteriomente
   // CAMILLE - 12.08.2002
   if (iIdLote < 0) and (sFlgIntEvento <> 'FL')
   then begin
      if sSitFundacao = 'AS'
      then iIdLote := GeraLOTE(iIdFundacao, True,         sAnoMesHoje,
                               'B',         sDescPreparo, sAtrasoDevol,
                               '1',         '0',          '0',
                               //'0',         '0',          DateToStr(date),                  //ClaudioR - 19962 - 16/08/2007
                               '0',         '0',          FormatDateTime('dd/mm/yyyy', date), //ClaudioR - 19962 - 16/08/2007
                               '',          '',           '',
                               '')
      else iIdLote := GeraLOTE(piIdPessJur, True,         sAnoMesHoje,
                               'P',         sDescPreparo, sAtrasoDevol,
                               '1',         '0',          '0',
                               //'0',         '0',          DateToStr(date),                   //ClaudioR - 19962 - 16/08/2007
                               '0',         '0',          FormatDateTime('dd/mm/yyyy', date),  //ClaudioR - 19962 - 16/08/2007
                               '',          '',           '',
                               '')
   end;

   if (iIdLote < 0) and (sFlgIntEvento <> 'FL')
   then begin
      sMsgErro := ' Erro na geração do lote de contribuições. ';
      Exit;
   end;

   sDataFinalRegra   := psDataFinalBenef;
   sAnoMesDtRefFinal :=  Copy(psDataFinalBenef,7,4)+'/'+Copy(psDataFinalBenef,4,2);

   sSalarioAux := sSalarioPart;
   iSitRecebimentoAux := piSitRecebimento;

   // camille - 05.08.2002
   // verificar se beneficios do processo possuem abono no final do beneficio ou no final do ano
   // para preencher variavel de controle de 13o.
   if ((piOrigem = 2) or (piOrigem = 3) or (piOrigem = 7) ) { Augusto 09/03/2005 - 7 Migração de Planos }
      and ( piNumProcesso > 0 )
   then begin
      dtmAPrev.qry.Close;
      dtmAPrev.qry.SQL.Clear;
      dtmAPrev.qry.SQL.Add(' SELECT DISTINCT BP.IDBENEFICIO, BP.FLGABONOFINALBEN, BP.FLGPOSSUIABONO,'+
                           ' BF.FLGPROVISORIO                                       '+ // Gleyber - 16/12/2002
                           ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP              '+
                           ' WHERE  BF.NUMEROPROCESSO = '+IntToStr(piNumProcesso)+
                           ' AND    BP.IDBENEFICIO    = BF.IDBENEFICIO              '+
                           ' AND    BP.IDPLANOPREV    = BF.IDPLANOPREV              '+
                           ' AND    BP.FLGREFERENCIA  = 0                           '+
                           ' AND    BP.FLGPOSSUIABONO = 1                           ');
      dtmAPrev.qry.Open;
      sFlagProvisorio := dtmAPrev.qry.FieldByName('FLGPROVISORIO').AsString;
      iIdBeneficio    := dtmAPrev.qry.FieldByName('IDBENEFICIO').AsInteger;
      bAbonoNoFinalDoAno := True;
      while not dtmAPrev.qry.Eof do
      begin
         if (dtmAPrev.qry.FieldByName('FLGABONOFINALBEN').AsInteger = 1)
         then bAbonoNoFinalDoAno := False;
         dtmAPrev.qry.Next;
      end;
      dtmAPrev.qry.Close;

   end;

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
      if (dtmAPrev.qryAuxContrib.FieldByName('QTDEPARCELAS').AsString  <> '') and
         (dtmAPrev.qryAuxContrib.FieldByName('QTDEPARCELAS').AsInteger <= 1)
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

      while (sAnoMesAtual <= sAnoMesFinal) or (bCalcula13Agora = True) do { Augusto 15/03/2004 }
      begin

         { Inicio Augusto 05/05/2006 - Sempre verificar contribuições de abono no ultimo mês }
         If ( piOrigem = 2 ) And ( sAnoMesAtual = sAnoMesFinal )
         // Gleyber - 17/07/2006 - Pendência 22844 - Início
            And (FazQuery(QryAux, ' SELECT 1 FROM PARAMANTECIPABONO'+
                                  ' WHERE IDPESSJUR   = '+IntToSTr(piIdPessJur)   +
                                  '   AND IDPLANOPREV = '+IntToStr(piIdPlanoPrev) +
                                  '   AND IDBENEFICIO = '+IntToStr(iIdBeneficio)  ) )
          Then Begin
         // Gleyber - 17/07/2006 - Pendência 22844 - Fim
           { Inicio Augusto 19/05/2006 - Verificar se adiantamento de abono já foi calculado antes }
           If FazQuery(QryAux, 'SELECT '+
                               '  1 AS EXISTE '+
                               'FROM   '+
                               '  HSTCONTRIBPREV HST '+
                               'WHERE  '+
                               '      HST.MESREFERENCIA  = '+ QuotedStr( Copy(sAnoMesAtual,1,5)+'13' )          +
                               '  AND HST.MESCOBRANCA    = '+ QuotedStr( sAnoMesLote )                          +
                               '  AND HST.IDPESSOA       = '+ QryContrib.FieldByName('IDPESSOA').AsString       +
                               '  AND HST.SEQPROPOSTA    = '+ QryContrib.FieldByName('SEQPROPOSTA').AsString    +
                               '  AND HST.IDCONTRIBUICAO = '+ QryContrib.FieldByName('IDCONTRIBUICAO').AsString +
                               '  AND HST.IDPLANOPREV    = '+ IntToStr(piIdPlanoPrev)                           +
                               '  AND HST.IDPESSJUR      = '+ IntToSTr(piIdPessJur)                             +
                               '  AND NVL(HST.VALORRECEBIDO,0) <= 0 '                                           )
           Then Begin

             bEhMesAbono  := False;

           End Else Begin

             bEhMesAbono  := True;

           End;
           { Fim Augusto 19/05/2006                                                                }



         End Else Begin

           { Inicio Augusto 16/03/2004 - Verifica se neste mes existe pagamento de Abono }
           bEhMesAbono  := EhMesAbono(QryAux, piIdPessJur, piIdPlanoPrev, iIdBeneficio, sAnoMesAtual);

         End;
         { Fim Augusto 05/05/2006                                                            }

         sAnoMesDIP   := Copy(psDataInicioBenef,7,4)+'/'+Copy(psDataInicioBenef,4,2);

         If bEhMesAbono = True Then
           sAnoMesAbono := sAnoMesAtual
         Else
           sAnoMesAbono := '0000/00';

         { Fim Augusto 16/03/2004 }
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
                                                Copy(sAnoMesAtual,1,4));
         if Trim(sDataPrevisaoRece) = '' then sDataPrevisaoRece := sDataCobranca;

         //=================================
         //=== Tratamento de décimo terceiro
         //=================================
         { Augusto 16/03/2004 - Testa tb se é mes de abono }
         if ( ( ((copy(sAnoMesAtual,6,2) = '12') and (sAnoMesDIP > sAnoMesAbono)
                 ) or (bCalc13DtFim) or (bEhMesAbono = true) ) and
                 ( pbPrepararSoMes13 or bCalcula13Agora ) ) or
            ( (sAnoMesAtual = sAnoMesDtRefFinal) and bCalcula13Agora )
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
                  (sAnoMesDtRefFinal <= sAnoMesFinal) and   // CAMILLE - 06.11.2002
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

                //leofuncef - 23052005
                If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
                Then  sDataRef := '30'+Copy(sDataRef,3,9);
                //leofuncef - fim

                if Copy(sAnoMesCalc13Aux,6,2) = '13'
                then sDataInicioAux := psDataInicioOriginal
                else sDataInicioAux := psDataInicioBenef;

                // Testar se está no mes de 1o. ou ultimo pagamento, e tem regra de primeiro ou ultimo.
                // Se for este o caso, obrigar a usar salario integral, passando como tipo de calculo a letra I
               if // teste de primeiro pagamento
                   ( (sAnoMesAtual = sAnoMesInicio) and
                     (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString <> '') and
//                     (Copy(psDataInicioBenef,1,2) <> '01' ) and // CAMILLE - 23.01.2003
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
                                                       piNumProcesso, sAnoMesLote,iIdLote, //leocbs - 29052002 - inumprocesso
                                                       False, psDataInicioOriginal) { Augusto 31/01/2005 }
               end
               else if ( (sAnoMesAtual = sAnoMesFinal) and // teste de ultimo pagamento
                         (psDataFinalBenef <> '')         and
                         (sAnoMesDtRefFinal <= sAnoMesFinal) and // CAMILLE - 06.11.2002
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
                                                              piNumprocesso, sAnoMesLote,iIdLote, //leocbs - 29052002 - inumprocesso
                                                              False, psDataInicioOriginal) { Augusto 31/01/2005 }
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
                                      sDataFinalRegra, piOrigem,piNumProcesso, sAnoMesLote,iIdLote, //leocbs - 29052002 - inumprocesso
                                      False, psDataInicioOriginal) { Augusto 31/01/2005 }

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
                                                              pinumprocesso, sAnoMesLote,iIdLote, //leocbs - 29052002 - inumprocesso
                                                              False, psDataInicioOriginal) { Augusto 31/01/2005 }

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

               sMsgErro := sMsgErro + dtmAPrev.qryAuxContrib.FieldbyName('NOME').AsString;
               bErro    := True;
               break;
            end;

            //=== Chamar regra
            sValorRegra := RegraNumerica(sIdRegraCalculo,
                                         sSQLRegraAux, bErroRegra, iIdCalculoGeral);


            if bErroRegra
            then begin
               sMsgErro := 'Erro na Execução da Regra de Cálculo de  '+
                            dtmAPrev.qryAuxContrib.FieldbyName('NOME').AsString+ ' Nº '+
                            dtmAPrev.qryAuxContrib.FieldbyName('IDREGRACALCULO').AsString;
               bErro    := True;
               break;
            end;

            if sValorRegra = ''
            then begin
               sMsgErro := 'A Regra de Cálculo de  '+
                           dtmAPrev.qryAuxContrib.FieldbyName('NOME').AsString+ ' Nº '+
                           dtmAPrev.qryAuxContrib.FieldbyName('IDREGRACALCULO').AsString+' retornou um valor em branco.';
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
                  (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPGTO13').AsString <> '') and
                  (( (Copy(psDataInicioBenef,7,4)+'/'+Copy(psDataInicioBenef,4,2)) = (Copy(psDataInicioOriginal,7,4)+'/'+Copy(psDataInicioOriginal,4,2)) )  OR
                    ( (piOrigem <> 2) and (piOrigem <> 7) ){ Augusto 09/03/2005 - 7 Migração de Planos }
                     ) // CAMILLE - 27.01.2003
               then begin
                  sTpPagto := 'P';
                  sMsgRegra:= 'Primeiro';
                  sIdRegra := dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPGTO13').AsString;

                  if (StrToInt(copy(psDataInicioBenef,1,2)) >= 29) and
                     (StrToInt(copy(sAnoMesAtual,6,2)) = 2)
                  then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                  else sDataRef := copy(psDataInicioBenef,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);

                  //leofuncef - 23052005
                  If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
                  Then  sDataRef := '30'+Copy(sDataRef,3,9);
                  //leofuncef - fim
               end;

               if (Copy(sAnoMesAtual,1,4) = Copy(sAnoMesFinal,1,4)) and
                  (psDataFinalBenef <> '')          and
                  (sAnoMesDtRefFinal  <= sAnoMesFinal) and // CAMILLE - 06.11.2002
                  (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPGTO13').AsString <> '')
               then begin
                  sTpPagto := 'U';
                  sMsgRegra:= 'Último';
                  sIdRegra := dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPGTO13').AsString;

                  if (StrToInt(copy(psDataFinalBenef,1,2)) >= 29) and
                     (StrToInt(copy(sAnoMesAtual,6,2))   = 2)
                  then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                  else sDataRef := copy(psDataFinalBenef,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);


                  //leofuncef - 23052005
                  If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
                  Then  sDataRef := '30'+Copy(sDataRef,3,9);
                  //leofuncef - fim
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
                                     pinumprocesso, sAnoMesLote,iIdLote, //leocbs - 29052002
                                     False, psDataInicioOriginal); { Augusto 31/01/2005 }

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
//                  (Copy(psDataInicioBenef,1,2) <> '01' ) and // CAMILLE - 23.01.2003
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

                  //leofuncef - 23052005
                  If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
                  Then  sDataRef := '30'+Copy(sDataRef,3,9);
                  //leofuncef - fim

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
                                   pinumprocesso, sAnoMesLote,iIdLote, //leocbs - 29052002 - inumprocesso
                                   False, psDataInicioOriginal); { Augusto 31/01/2005 }


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

                  //  if StrToFloat(ClienteNumero(sValorRegra)) < 0 then
                  if StrToFloat(ClienteNumero(sValorRegra)) >= 0
                  then sValorFinal := sValorRegra;
               end;  // if MesAtual = MesInicio

               if (sAnoMesAtual = sAnoMesFinal) and
                  (psDataFinalBenef <> '')         and
                  (sAnoMesDtRefFinal <= sAnoMesFinal) and // CAMILLE - 06.11.2002
                  (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString <> '')
               then begin
                     if (StrToInt(copy(psDataFinalBenef,1,2)) >= 29) and
                        (StrToInt(copy(sAnoMesAtual,6,2))   = 2)
                     then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                     else sDataRef := copy(psDataFinalBenef,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);

                     //leofuncef - 23052005
                     If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
                     Then  sDataRef := '30'+Copy(sDataRef,3,9);
                     //leofuncef - fim

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
                                      pinumprocesso, sAnoMesLote,iIdLote, //leocbs - 29052002 - inumprocesso
                                      False, psDataInicioOriginal); { Augusto 31/01/2005 }


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
              if (piOrigem <> 2) and (piOrigem <> 3)
                 and (piOrigem = 7) { Augusto 09/03/2005 - 7 Migração de Planos }
              then begin
                if psDataFinalBenef <> ''
                then begin
                   sAnoMesDtRefFinal :=  Copy(psDataFinalBenef,7,4)+'/'+Copy(psDataFinalBenef,4,2);
                   if (sAnoMesAtual   =  sAnoMesDtRefFinal) and
                      (sAnoMesFinal  <= sAnoMesFinal)        and // CAMILLE - 06.11.2002
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
                      (dtmAPrev.qryAuxContrib.FieldbyName('FlgCobra13DtFim').AsInteger = 1) and
                      ( (not bAbonoNoFinalDoAno ) or (Copy(sAnoMesAtual,6,2) = '12') ) // camille - 05.08.2002
                   then bCalc13DtFim := True;
                end;
              End;
            end; // fim contribuicao <> 13
         end  // if not bValorQry
         else sValorFinal := qryContrib.FieldByName('Valor').AsString;

         if StrToFloat(ClienteNumero(sValorFinal) ) <= 0
         then begin
{            // repetir codigo para continuar loop
            if ((copy(sAnoMesAtual,6,2) = '12') and (bCalc13)) or (bCalc13DtFim)
            then bCalc13 := false
            else begin
               sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
               bCalc13 := true;
            end;
}
            if ((Copy(sAnoMesAtual,6,2) = '12') and (Copy(sAnoMesCalc13Aux,6,2) <> '13')) or bCalc13DtFim  //  (bCalc13)) or (bCalc13DtFim)
            then bCalcula13Agora := True // bCalc13 := False
            else begin
               sAnoMesAtual    := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
               bCalcula13Agora := False;
            end;

            // continuar loop
            continue;
         end;


         { Inicio Augusto 16/11/2005 - Caso Revisão de Beneficio, não faer acerto }
         bInsereHst    := True;
         sFlgDevolucao := '0';
         //sValorFinal   := FormatFloat( '#0.00',FloatToStr( sValorFinal ) );
         If piOrigem <> 6 Then Begin

           //leocbs - 28052002 - inicio
           //verifica se o último último mês já havia sido tratado pela devolução
           dtmAPrev.qry.Close;
           dtmAPrev.qry.Sql.Clear;
           dtmAPrev.qry.Sql.Add(' SELECT /*+ INDEX (HSTCONTRIBPREV XAK1HSTCONTRIBPREV) */                    '+ // UTILIZACAO OBRIGATORIA DE INDICE
                                '        MESREFERENCIA, VALORESPERADO, IDLOTE FROM HSTCONTRIBPREV            '+ { Augusto 09/10/2005 - Novos campos, era apenas "1" }
                                ' WHERE  MESREFERENCIA  = '''+sAnoMesCalc13Aux+'''                           '+
                                ' AND    MESCOBRANCA    = '''+sAnoMesLote+'''                                '+
                                ' AND    NVL(VALORRECEBIDO,0) <= 0  '+ { Augusto 09/06/2005 }
                                ' AND    IDPESSOA       = '+qryContrib.FieldByName('IdPessoa').AsString       +
                                ' AND    SEQPROPOSTA    = '+qryContrib.FieldByName('SeqProposta').AsString    +
                                ' AND    IDCONTRIBUICAO = '+qryContrib.FieldByName('IdContribuicao').AsString +
                                ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)                           +
                                ' AND    IDPESSJUR      = '+IntToSTr(piIdPessJur)                             );
                                { Augusto 09/06/2005  }

           //P.RAMOS-17.05.2005-PEND.18502-REABERTURA PARA TRATAR RENOVA
           //if piOrigem = 5
           if piOrigem IN [3, 5]
           //P.RAMOS-17.05.2005-PEND.18502-REABERTURA PARA TRATAR RENOVA-FIM
           then dtmAPrev.qry.SQL.Add(' AND    DATAINICIO     = TO_DATE('''+psDataInicioOriginal+''',''DD/MM/YYYY'')  ')
           else dtmAPrev.qry.SQL.Add(' AND    DATAINICIO     = TO_DATE('''+psDataInicioBenef   +''',''DD/MM/YYYY'')  ');
           dtmAPrev.qry.Open;

           if not dtmAPrev.qry.isempty then begin

             { Inicio Augusto 08/05/2006 - Caso seja uma concessão não comparar no mesmo }
             {                             lote por causa do adiantamento de abono.      }
             If ( piOrigem = 2 ) And ( DtmAPrev.Qry.FieldByName('IDLOTE').AsInteger <> iIdLote ) Then Begin

               If (MsgDlg('Já existe contribuição esperada para o ano/mês '+
                          dtmAPrev.qry.FieldByName('MESREFERENCIA').AsString+#13+
                          'Deseja continuar?',
                          'Atenção',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo)
               Then Begin
                 sMsgErro := 'Já existe contribuição esperada para o ano/mês '+
                              dtmAPrev.qry.FieldByName('MESREFERENCIA').AsString;
                 bErro := True;
                 break;
               End;

             End;
             { Fim Augusto 08/06/2006                                                     }

           End;

           if (not dtmAPrev.qry.isempty) and (1=2) then { Augusto 09/06/2005 - Condição sempre falsa para  }
           begin                                        { sempre fazer o acerto.                           }
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

                                //leocm - 24062002 - inicio
                                //tratar devoluções
                                //'        SUM(VALORESPERADO) AS VALORESPERADO, SUM(VALORRECEBIDO) AS VALORRECEBIDO '+
                                ' SUM(DECODE(FLGDEVOLUCAO,1,-1*VALORESPERADO,VALORESPERADO)) AS VALORESPERADO, '+
                                ' SUM(DECODE(FLGDEVOLUCAO,1,-1*VALORRECEBIDO,VALORRECEBIDO)) AS VALORRECEBIDO '+
                                //leocm - 24062002 - fim
                                ' FROM HSTCONTRIBPREV '+
                                ' WHERE  MESREFERENCIA  = '+''''+sAnoMesCalc13Aux+'''');

                 //P.RAMOS-17.05.2005-PEND.18502-REABERTURA PARA TRATAR RENOVA
                 //               // Gleyber - 19/01/2005 - Pendência 18502
                 //               dtmAPrev.qry.Sql.Add(' AND    DATAINICIO     = TO_DATE('''+psDataInicioBenef+''',''DD/MM/YYYY'') ');

                 { Augusto 15/03/2006 - Buscar DATAINICIO tbm quando for Liberação }
                 if (piOrigem IN [3, 5]) Or (sFlgIntEvento = 'FL') then { Augusto 28/12/2005 }
                   dtmAPrev.qry.SQl.Add(' AND    DATAINICIO     = TO_DATE('''+psDataInicioOriginal+''',''DD/MM/YYYY'')  ')
                 else
                   dtmAPrev.qry.SQl.Add(' AND    DATAINICIO     = TO_DATE('''+psDataInicioBenef   +''',''DD/MM/YYYY'')  ');
                 //P.RAMOS-17.05.2005-PEND.18502-REABERTURA PARA TRATAR RENOVA-FIM

                 // CAMILLE - 07.01.2004
                 // pendencia 15864 - COMENTADA A CLAUSULA DE FILTRO PELA DATAINICIO
                 // POIS O TOTAL PAGO EM UM MES É A SOMA PELO MES DE REFERENCIA, NAO PRECISANDO DA DATA DE INICIO
                 // ' AND    DATAINICIO     = TO_DATE('''+qryContrib.FieldByName('DATAINICIO').AsString+''',''DD/MM/YYYY'') '+ // Gleyber - 15/12/2003 - Pendência 15808
                 dtmAPrev.qry.Sql.Add(
                                ' AND    IDPESSOA       = '+qryContrib.FieldByName('IdPessoa').AsString      +
                                ' AND    SEQPROPOSTA    = '+qryContrib.FieldByName('SeqProposta').AsString   +
                                ' AND    IDCONTRIBUICAO = '+qryContrib.FieldByName('IdContribuicao').AsString+
                                ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                                ' AND    IDPESSJUR      = '+IntToSTr(piIdPessJur)  +
                                ' AND    SITRECEBIMENTO NOT IN (4,8) ');   // Gleyber - 17/08/2006 - Pendência 23028
                 dtmAPrev.qry.Open;
              end;

              bInsereHst    := True;
              sFlgDevolucao := '0';

              // Se já existir valor no histórico, inserir valor com a diferença
              if (sSitFundacao = 'PT') or (dtmAPrev.qry.IsEmpty)
              or((piOrigem = 3) and (Copy(sAnoMesCalc13Aux,6,2) <> '13')  )
              then begin
                 sValorFinal := sValorFinal;
              end
              else begin
                 //caso seja devol~ção o valor será somado
                 // CGUEDES - 20/08/2002: O VALORRECEBIDO É O CORRETO PARA EFETUAO O CÁLCULO DA DIFERENÇA,
                 // POIS O VALORESPERADO NÃO É O QUE FOI EFETIVAMENTE RECEBIDO.
                 //dDiferenca := StrToFloat(ClienteNumero(sValorFinal)) - dtmAPrev.qry.FieldByName('VALORESPERADO').AsFloat;

                 if (dtmAPrev.qryAuxContrib.FieldByName('FLGACERTACONTRIB13').AsInteger = 0) and
                    (Copy(sAnoMesCalc13Aux,6,2) = '13') // CAMILLE - 13.02.2003
                 then begin
                    sFlgDevolucao := '0';
                    sValorFinal   := sValorFinal;
                 end else begin


                    //leofuncef - 06072005 - devido a modificação feita em 09/06/2005 para sempre entrar no acerto e
                    //a outra modificação feita no mesmo dia só pegando registros não recebidos (valorrecebifo <= 0)
                    //o valor a ser testado para avaliar a diferença não pode ser o valorrecebido e simo valorespardo
                    //a nova lógica força que o acerto chegue neste ponto com o campo valorrecebido sempre zero
                    //dDiferenca := StrToFloat(ClienteNumero(sValorFinal)) - dtmAPrev.qry.FieldByName('VALORRECEBIDO').AsFloat;
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
           end;
           //leocbs - 28052002 - fim

         End;
         { Fim Augusto 16/11/2005 }

         if bInsereHst
         then begin
            // Gerar numero do recebimento
            iNumRecebimento := LeUltRegistro(nil, 'HSTCONTRIBPREV');

            // Calcular número da parcela
            iParcela := 0;
            if iParcela < 0 then iParcela := 0;

            // Inserir valor final na HSTCONTRIBPREV
            with dtmAPrev.qry do
            begin
               sSQLValues := ''''+sAnoMesCalc13Aux+''''; // MESREFERENCIA
               sSQLValues := sSQLValues+','''+sAnoMesLote+'''';
               sSQLValues := sSQLValues+',' +IntToStr(iNumRecebimento);
               sSQLValues := sSQLValues+',' +IntToStr(piIdMotivo);
               if (Trim(qryContrib.FieldByName('CodPortForma').AsString) <> '') and
                  (qryContrib.FieldByName('CodPortForma').AsInteger > 0)
               then sSQLValues := sSQLValues+', ' +qryContrib.FieldByName('CodPortForma').AsString
               else sSQLValues := sSQLValues+', NULL ';

//               sSQLValues := sSQLValues+', TO_DATE('''+sDataCobranca+''',''DD/MM/YYYY'') ';//DATAPREVISAORECE
               sSQLValues := sSQLValues+', TO_DATE('''+sDataPrevisaoRece+''',''DD/MM/YYYY'') ';//DATAPREVISAORECE

               // CBS - 28.02.2002 - TRATAMENTO DE DIFERENCA FEITO ANTERIORMENTE
               sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);//VALORESPERADO
               sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);//VALORCALCULADO

   {            // Se já existir valor no histórico, inserir valor com a diferença
               if (sSitFundacao = 'PT') or (dtmAPrev.qry.IsEmpty)  or
                  ((piOrigem = 3) and (Copy(sAnoMesCalc13Aux,6,2) <> '13')  )
               then begin
                  sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);//VALORESPERADO
                  sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);//VALORCALCULADO
               end
               else begin
                  dDiferenca := StrToFloat(ClienteNumero(sValorFinal)) - dtmAPrev.qry.FieldByName('VALORESPERADO').AsFloat;

                  if Abs(dDiferenca) < 0.01
                  then dDiferenca := 0
                  else begin
                     if dDiferenca > 0.001
                     then begin
                        sSQLValues := sSQLValues+', '+OraNumero(FormatFloat('#0.00',dDiferenca));//VALORESPERADO
                        sSQLValues := sSQLValues+', '+OraNumero(FormatFloat('#0.00',dDiferenca));//VALORCALCULADO
                        sFlgDevolucao := '0';
                     end
                     else begin
                        if dDiferenca < -0.001
                        then begin
                           sSQLValues := sSQLValues+', '+OraNumero(FormatFloat('#0.00',-dDiferenca));//VALORESPERADO
                           sSQLValues := sSQLValues+', '+OraNumero(FormatFloat('#0.00',-dDiferenca));//VALORCALCULADO
                           sFlgDevolucao := '1';
                        end
                        else begin
                           sSQLValues := sSQLValues+', 0';//VALORESPERADO
                           sSQLValues := sSQLValues+', 0';//VALORCALCULADO
                           sFlgDevolucao := '0';
                        end;
                     end;
                  end;
               end;
   }
               sSQLValues := sSQLValues+', '+dtmAPrev.qryAuxContrib.FieldByName('IdRegraCalculo').AsString;  //IDREGRACALCULO
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

               // GLEYBER - 06/08/2002
               if Trim(qryContrib.FieldbyName('DATAINICIO').AsString) <> ''
               then sSQLValues := sSQLValues+', TO_DATE('''+qryContrib.FieldByName('DataInicio').AsString+''',''DD/MM/YYYY'') '
               else sSQLValues := sSQLValues+', NULL ';

               if Trim(qryContrib.FieldbyName('DATAFINAL').AsString) <> ''
               then sSQLValues := sSQLValues+', TO_DATE('''+qryContrib.FieldByName('DataFINAL').AsString+''',''DD/MM/YYYY'') '
               else sSQLValues := sSQLValues+', NULL ';

               sSQLValues := sSQLValues+', '''+sSitFundacao+'''';       //FLGSITFUNDACAO


               if dtmAPrev.qryAuxContrib.FieldByName('FlgNaoExigeRec').AsString = '1'
               // ANDRE DB2 SITRECEBIMENTO STRING
               then sSQLValues := sSQLValues+', '+'''2'''                      //SITRECEBIMENTO
               else sSQLValues := sSQLValues+', '+IntToStr(piSitRecebimento); //SITRECEBIMENTO

               sSQLValues := sSQLValues+', ''F''';   //TIPO

               // CAMILLE - 12.08.2002
               if iIdLote > 0
               then sSQLValues := sSQLValues+', '+IntToStr(iIdLote)     //IDLOTE
               else sSQLValues := sSQLValues+', NULL ';                 //IDLOTE

               sSQLValues := sSQLValues+', '+IntToStr(iParcela);        //PARCELA


               if dtmAPrev.qryAuxContrib.FieldByName('FlgNaoExigeRec').AsString = '1'
               then begin
                      sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);   //VALORECEBIDO
                      sSQLValues := sSQLValues+', TO_DATE('''+sDataCobranca+''',''DD/MM/YYYY'') '; //DATARECEBIMENTO
                    end
               else begin
                      sSQLValues := sSQLValues+', NULL';   //VALORECEBIDO
                      sSQLValues := sSQLValues+', NULL';   //DATARECEBIMENTO
                    end;

               if sSitFundacao = 'AS'                  // flgconcessao
               then sSQLValues := sSQLValues +', 1 '
               else sSQLValues := sSQLValues +', 0 ';

               if sFlgVeioDoEvento <> ''
               then sSQLValues := sSQLValues +', 1 '
               else sSQLValues := sSQLValues +', 0 ';

               sSQLValues := sSQLValues +', SYSDATE ';

               if Trim(sFlgIntEvento) <> ''
               then sSQLValues := sSQLValues + ', '''+sFlgIntEvento+''''
               else sSQLValues := sSQLValues +', NULL ';

               sSQLValues := sSQLValues +', '+OraNumero(sFlgDevolucao);

               // CAMILLE - 13.07.2004
               if piIdMotivo = prmIdMotDevolNaoIden
               then sSQLValues := sSQLValues +', ''B'' '
               else begin
                  //leo - 28052002 - inicio
                  if sSitFundacao = 'AS'      // FOLHAORIGEM
                  then sSQLValues := sSQLValues +', ''B'' '
                  else sSQLValues := sSQLValues +', ''P'' ';
                  //leo - 28052002 - fim
               end;

               Close;
               SQL.Clear;
               SQL.Add(' INSERT INTO HSTCONTRIBPREV (MESREFERENCIA,MESCOBRANCA,NUMRECEBIMENTO,IDMOTIVO,'+
                       '                             CODPORTFORMA,DATAPREVISAORECE,'+
                       '                             VALORESPERADO,VALORCALCULADO,IDREGRACALCULO, '+
                       '                             FLGDESCFOLHA,IDPESSOA,SEQPROPOSTA,IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
                       '                             FLGCALCRESERVA,VALOROP1,VALOROP2,VALOROP3,DATAINICIO,DATAFINAL,         '+
                       '                             FLGSITFUNDACAO,SITRECEBIMENTO,TIPO,IDLOTE,PARCELA, '+
                       '                             VALORRECEBIDO, DATARECEBIMENTO, FLGCONCESSAO, FLGEVENTO, '+
                       '                             DATAEMISSCOB,  FLGINTEVENTO, FLGDEVOLUCAO, FOLHAORIGEM  ) '+ //incluí folhaorigem
                       ' VALUES('+sSQLValues+')');
               try
                  Execsql;
                  inc(iNumReg);
                  rTotalLote        := rTotalLote + StrToFloat(ClienteNumero(sValorFinal));
                  sUltAnoMesPreparo := sAnoMesAtual;
   //               if (copy(sAnoMesAtual,6,2) = '12') then bJaCalculouDezembro := True; // CBS - 16.01.2002
               except
                  sMsgErro := 'Erro na gravação do Histórico de Contribuições. ';
                  bErro := True;
                  break;
               end;
            end; //with
         end; // if bInsereHst

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

         { Augusto 16/03/2004 - Testa tbm se é mes de abono }
         if (dtmAPrev.qryAuxContrib.FieldByName('FLGCOBRADECTERC').AsInteger = 1) and

            { Inicio Augusto 26/05/2006 - Retirar o mês 12 que estava cravado. }
            //( (bEhMesAbono=True ) or ( ( copy(sAnoMesAtual,6,2) = '12' ) and ( sAnoMesDIP > sAnoMesAbono) )  or
            //  ( bCalc13DtFim ) or
            //
            //( (not bCalcula13Agora) and (sAnoMesAtual = sAnoMesDtRefFinal) and
            //     (sAnoMesFinal  <= sAnoMesLote) and bAbonoNoFinalDoAno and
            //      ( (Copy(sAnoMesLote,6,2) = '12') or (Copy(sAnoMesLote,1,4) > Copy(sAnoMesDtRefFinal,1,4) ) ) )
            ( (bEhMesAbono = True ) or ( bCalc13DtFim ) or
              (
                (not bCalcula13Agora) and (sAnoMesAtual = sAnoMesDtRefFinal)
                                      and (sAnoMesFinal  <= sAnoMesLote)
                                      and (bAbonoNoFinalDoAno = True and (Copy(sAnoMesLote,6,2) = '12') ) { Augusto 31/07/2007 }
              ) 
            )
            { Fim Augusto 26/05/2006                                           }

            and ( (Copy(sAnoMesCalc13Aux,6,2) <> '13') )
         then begin
            bCalcula13Agora := True;
            if pbPrepararSoMes13
            then sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
         end else begin
            sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
            bCalcula13Agora := False;
         end;

      End; // While mesatual < mesfinal

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
   end;//While

   if (not bErro) and (bAtualizaTotalLote) and (iIdLote > 0 ) // CAMILLE - 12.08.2002
   then begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE CTRLINTERFACE '+
                     ' SET    FLGPREPARADO = 1, '+
                    // '        DATAPREPARO  = TO_DATE('''+DateToStr(date)+''', ''dd/mm/yyyy'' ), '+                      //ClaudioR - 19962 - 16/08/2007
                     '        DATAPREPARO  = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', date) + ''', ''dd/mm/yyyy'' ), '+ //ClaudioR - 19962 - 16/08/2007
                     '        NUMREG = '+IntToStr(iNumReg)+', '+
                     '        VLRTOTAL = '+OraNumero(FloatToStr(rTotalLote)) +
                     ' WHERE  IDLOTE   = '+IntToStr(iIdLote));
      try
         qryAux.ExecSQL;
      except
         sMsgErro := ' Erro na atualização do total do lote. ';
         bErro    := True;
         Exit;
      end;
   end;
   qryContrib.Close;
   Result    := bErro;
end;//PreparaContribuicaoASSISTIDO

function MontaSQLContribNOVA(piIdPessJur,       piIdPlanoPrev,     piIdPessoa,
                             piSeqProposta,     piIdContribuicao,  piIdMotivoContrib : integer;
                             sSitFundacao,      sMesReferencia,    sDataRef,
                             sValorFinal,       sInscricaoData,    sDataNasc,
                             sTipoCalculo,      sTabelaValor,      sCampoValor,
                             sSalarioPart,      sIdSitPart,
                             sDataInicioEvento, sDataFinalEvento         : string;
                             piOrigem                                    : word;  
                             piNumProcesso   : Longint;
                             psAnoMesCobranca : string;
                             piIdLote         : longint;
                             pbUtilizaSalarioParametro : boolean = False; // CAMILLE - 26.11.2003
                             psDataInicioOriginal : String = '' { Augusto 31/01/2005 }
                             ) : string;
var sSQLRegra,
    sMesReferenAnt : string;
    sSQLFinal,
    sSalarioEncontrado,
    sMsgErro,
    sSql,
    sFlgInternoAntes,
    sDataFinalPdv,
    sTipoSitAntes,
    sIdEventosPrev,

    sFlgInternoAtual,
    sIdSitPartAntes,
    sIdSitPlanAntes,
    sIdSitFuncAntes,
    sIdSitPartAtual,
    sIdSitPlanAtual,
    sIdSitFuncAtual,

    sNomeTabela,sCampoPessJur,
    sValorSrb  : string;

    sPartReinsc,
    sSalario13, // camille - refer - 16.10.2000
    sValorSalPart,
    sValorRemTotal,
    sValorRubParcial,
    sValorRubMantido,
    sValorSalMantido,
    sAssoc1Op1, sAssoc1Op2, sAssoc1Op3, sValorAssociado,
    sAssoc2Op1, sAssoc2Op2, sAssoc2Op3, sValorAssociado2,
    sAssoc3Op1, sAssoc3Op2, sAssoc3Op3, sValorAssociado3  : string;
    sValorAssociadoNoMesCob,
    sValorAssociado2NoMesCob,
    sValorAssociado3NoMesCob  : string;

    bPartReinsc : boolean;
    iDia,
    piQtdeContribAssoc,
    piIdContribAssoc1, piIdContribAssoc2,piIdContribAssoc3 : integer;
    psFlgPagadorAssoc1, psFlgPagadorAssoc2, psFlgPagadorAssoc3 : string;
    sCampoContrib : string;

    sDataDemissao, sValorBase1,sValorBase2,sValorBase3 : string;

    sIDTPPAGTOANT,
    sFlgBenefMinimo,
    sValorUltBeneficio,
    sValorUltINSS, // CAMILLE - FCRT - 12.03.2002
    sValorINSSIntegral, { Augusto 20/01/2005 }
    sSalarioIntegral,
    sMesAux        : string;
    sDataInicio,
    sDataFinal : string;
    dValorIntegralBenef : double; // camille - 05.08.2002
    sFlgProvisorio : String;


    bContribParcelamento : Boolean;
    sIdParcelamento,sPercentual,sVlrDividaPart,sVlrDividaPatro,sVlrPrestacao,sVlrSdoDevedor : String; // CAMILLE - 26.01.2004
    sVlrInssPAGO : string; // CAMILLE - 23.01.2003

    dValorBeneficioNoMovimento : double; // CAMILLE - 11.02.2003
    dValorINSSNoMovimento      : double; // CAMILLE - 11.02.2003


    sDataInicioOriginal, sDataPrevisaoRece : String;

    sSalBaseAtual : String;

    iNumProxParc : Integer;
begin
   Result := '';
   sSQLFinal := '';

   // CAMILLE - 18.12.2002
   if Trim(sDataRenova) = '' then sDataRenova := sDataInicioEvento;

   { Augusto 31/01/2005 }
   sDataInicioOriginal := psDataInicioOriginal;
   If sDataInicioOriginal = '' Then sDataInicioOriginal := ' ';

   if UpperCase(sTabelaValor) = 'TMPDESC'
   then sCampoContrib := 'IDDESCONTO'
   else sCampoContrib := 'IDCONTRIBUICAO';

   sValorSrb        := '0';
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
   sValorSalMantido := '';
   psFlgPagadorAssoc1 := '';
   psFlgPagadorAssoc2 := '';
   psFlgPagadorAssoc3 := '';

   sValorAssociadoNoMesCob := '0';
   sValorAssociado2NoMesCob := '0';
   sValorAssociado3NoMesCob := '0';

   // Verifica ultimo dia do mes
   iDia := StrToInt(Copy(sDataRef,1,2));
   if iDia > TrazUltDiaMes(StrToInt(Copy(sDataRef,4,2)),
                           StrToInt(Copy(sDataRef,7,4)))
   then sDataRef := IntToStr(TrazUltDiaMes(StrToInt(Copy(sDataRef,4,2)),
                                         StrToInt(Copy(sDataRef,7,4))))+
                  Copy(sDataRef,3,8);

   // Ler contribuicoes Associadas
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      if sSitFundacao <> 'PT'
      then SQL.Add(' SELECT CPP.IDCONTRIBPAI, '+
               '       CPART.VALORBASE1,CPART.VALORBASE2,CPART.VALORBASE3, '+
              '        CPP.IDCONTRIBPAI2, CPP.IDCONTRIBPAI3, CASSOC1.FLGPAGADOR AS FLGPAGADORASSOC1, '+
              '        CASSOC2.FLGPAGADOR AS FLGPAGADORASSOC2,CASSOC3.FLGPAGADOR AS FLGPAGADORASSOC3, '+
              '        CPP.FLGPARCELAMENTO '+ //leofuncef - 04122002 -
              ' FROM   CONTRIBUICAO C, CONTPREV CPP, CONTPREV CASSOC1, CONTPREV CASSOC2, '+
              '        CONTPREV CASSOC3, CONTRIBPREVPARTP CPART '+
              ' WHERE  C.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO AND '+
              '        CPP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+' AND      '+
              '        CPP.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND      '+
              '        CPART.IDPESSOA    = '+IntToStr(piIdPessoa)+' AND '+
              '        CPART.SEQPROPOSTA = '+IntToStr(piSeqProposta)+' AND '+
              '        CPART.IDPESSJUR   = '+IntToStr(piIdPessJur)+' AND '+
              '        CPART.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+' AND '+
              '        CPART.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
              '        CPP.IDPLANOPREV  = CASSOC1.IDPLANOPREV(+)    AND '+
              '        CPP.IDCONTRIBPAI = CASSOC1.IDCONTRIBUICAO(+) AND '+
              '        CPP.IDPLANOPREV  = CASSOC2.IDPLANOPREV(+) AND    '+
              '        CPP.IDCONTRIBPAI2 = CASSOC2.IDCONTRIBUICAO(+) AND '+
              '        CPP.IDPLANOPREV  = CASSOC3.IDPLANOPREV(+) AND     '+
              '        CPP.IDCONTRIBPAI3 = CASSOC3.IDCONTRIBUICAO(+)     '+
              ' ORDER  BY CPP.ORDEMCALCULO ')
      else SQL.Add(' SELECT CPP.IDCONTRIBPAI, '+
               '       CPART.VALORBASE1,CPART.VALORBASE2,CPART.VALORBASE3, '+
              '        CPP.IDCONTRIBPAI2, CPP.IDCONTRIBPAI3, CASSOC1.FLGPAGADOR AS FLGPAGADORASSOC1, '+
              '        CASSOC2.FLGPAGADOR AS FLGPAGADORASSOC2,CASSOC3.FLGPAGADOR AS FLGPAGADORASSOC3, '+
              '        CPP.FLGPARCELAMENTO '+ //leofuncef - 04122002 -
              ' FROM   CONTRIBUICAO C, CONTPREV CPP, CONTPREV CASSOC1, CONTPREV CASSOC2, '+
              '        CONTPREV CASSOC3, CONTRIBPREVPATRO CPART '+
              ' WHERE  C.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO AND '+
              '        CPP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+' AND      '+
              '        CPP.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND      '+
              '        CPART.IDPESSOA    = '+IntToStr(piIdPessoa)+' AND '+
              '        CPART.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+' AND '+
              '        CPART.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
              '        CPP.IDPLANOPREV  = CASSOC1.IDPLANOPREV(+)    AND '+
              '        CPP.IDCONTRIBPAI = CASSOC1.IDCONTRIBUICAO(+) AND '+
              '        CPP.IDPLANOPREV  = CASSOC2.IDPLANOPREV(+) AND    '+
              '        CPP.IDCONTRIBPAI2 = CASSOC2.IDCONTRIBUICAO(+) AND '+
              '        CPP.IDPLANOPREV  = CASSOC3.IDPLANOPREV(+) AND     '+
              '        CPP.IDCONTRIBPAI3 = CASSOC3.IDCONTRIBUICAO(+)     '+
              ' ORDER  BY CPP.ORDEMCALCULO ');

      Open;
      if IsEmpty then Exit;


      bContribParcelamento := (FieldByName('FLGPARCELAMENTO').AsInteger = 1); //leofuncef - 04122002



      sValorBase1 := OraNumero(FieldByName('ValorBase1').AsString);
      sValorBase2 := OraNumero(FieldByName('ValorBase2').AsString);
      sValorBase3 := OraNumero(FieldByName('ValorBase3').AsString);

      piQtdeContribAssoc := 0;
      piIdContribAssoc1  := 0;

      if FieldByName('IdContribPai').AsString <> ''
      then begin
         piIdContribAssoc1  := FieldByName('IdContribPai').AsInteger;
         psFlgPagadorAssoc1 := FieldByName('FlgPagadorAssoc1').AsString;
         inc(piQtdeContribAssoc);
      end;

      if FieldByName('IdContribPai2').AsString <> ''
      then begin
         piIdContribAssoc2 := FieldByName('IdContribPai2').AsInteger;
         psFlgPagadorAssoc2 := FieldByName('FlgPagadorAssoc2').AsString;
         inc(piQtdeContribAssoc);
      end;
      if FieldByName('IdContribPai3').AsString <> ''
      then begin
         piIdContribAssoc3  := FieldByName('IdContribPai3').AsInteger;
         psFlgPagadorAssoc3 := FieldByName('FlgPagadorAssoc3').AsString;
         inc(piQtdeContribAssoc);
      end;
   end;


   //leofuncef - 04122002 - inicio
   sIdParcelamento := '';
   sPercentual := '0';
   sVlrDividaPart := '0';
   sVlrDividaPatro := '0';

   //verifica se o participante te parcelamento ativo
   if bContribParcelamento then
   begin
      frmparcelamento.TrazDadosParcela(dtmAPrev.qry,inttostr(piIdPessJur), inttostr(piIdPlanoPrev), inttostr(piIdPessoa),
                                       sIdParcelamento,sPercentual,sVlrDividaPart,sVlrDividaPatro,sVlrPrestacao,sVlrSdoDevedor, sSalBaseAtual, iNumProxParc);
   end;
   //leofuncef - 04122002 - fim

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
      dtmAPrev.qry.SQL.Add('  SELECT H.'+Trim(sCampoValor)+', C.VALORBASE1, C.VALORBASE2, C.VALORBASE3 '+
                     ' FROM   '+sTabelaValor+' H, '+sNomeTabela+' C '+
                     ' WHERE  C.'+sCampoPessJur+'  = '+IntToStr(piIdPessJur)  +' AND '+
                     '        C.IDPLANOPREV        = '+IntToStr(piIdPlanoPrev)+' AND '+
                     '        C.IDPESSOA           = '+IntToStr(piIdPessoa)   +' AND '+
                     '        C.IDCONTRIBUICAO     = '+IntToStr(piIdContribAssoc1)+' AND '+
                     '        H.SEQPROPOSTA(+)     = '+IntToStr(piSeqProposta)+' AND '+
                     '        H.MESREFERENCIA(+)   = '''+sMesReferencia +''' AND '+
                     '        NVL(H.CODREFERENCIA(+),'''+copy(sDataRef,7,4)+'/'+copy(sDataRef,4,2)+''')   = '''+copy(sDataRef,7,4)+'/'+copy(sDataRef,4,2)+''' AND '+ //leofuncef - 05082004
                     '        C.'+sCampoPessJur+'  = H.IDPESSJUR(+) AND '+
                     '        C.IDPLANOPREV    = H.IDPLANOPREV(+) AND '+
                     '        C.IDPESSOA       = H.IDPESSOA(+) AND '+
                     '        C.IDCONTRIBUICAO = H.'+sCampoContrib+'(+) '+
                     ' ORDER BY H.MESREFERENCIA   ');
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

      dtmAPrev.qry.Close;
      dtmAPrev.qry.SQL.Clear;
      if piOrigem = 6 // CAMILLE - 27.10.2004 { Augusto piOrigem estava 10 mudou para 6 }
      then dtmAPrev.qry.SQL.Add('  SELECT SUM( DECODE( H.FLGDEVOLUCAO, 0, DECODE(NVL(H.VALORRECEBIDO,0), 0 , H.VALORESPERADO, H.VALORRECEBIDO),                      '+ // CAMILLE - 27.10.2004
                                '                                         DECODE(NVL(H.VALORRECEBIDO,0), 0 ,-H.VALORESPERADO,-H.VALORRECEBIDO) ) ) AS VALORRECEBIDO, '+ // CAMILLE - 27.10.2004
                                '         MAX(C.VALORBASE1) AS VALORBASE1, MAX(C.VALORBASE2) AS VALORBASE2, MAX(C.VALORBASE3) AS VALORBASE3                          '+ // CAMILLE - 27.10.2004
                                ' FROM   '+sTabelaValor+' H, '+sNomeTabela+' C '+
                                ' WHERE  C.'+sCampoPessJur+'  = '+IntToStr(piIdPessJur)  +' AND '+
                                '        C.IDPLANOPREV        = '+IntToStr(piIdPlanoPrev)+' AND '+
                                '        C.IDPESSOA           = '+IntToStr(piIdPessoa)   +' AND '+
                                '        C.IDCONTRIBUICAO     = '+IntToStr(piIdContribAssoc1)+' AND '+
                                '        H.SEQPROPOSTA(+)     = '+IntToStr(piSeqProposta)+' AND '+
                                '        H.MESREFERENCIA(+)   = '''+sMesReferencia +''' AND '+
                                // '        H.MESCOBRANCA(+)     = '''+psAnoMesCobranca+''' AND '+ // CAMILLE - 27.10.2004
                                // '        NVL(H.CODREFERENCIA(+),'''+copy(sDataRef,7,4)+'/'+copy(sDataRef,4,2)+''')   = '''+copy(sDataRef,7,4)+'/'+copy(sDataRef,4,2)+''' AND '+ //leofuncef - 06082004
                                '        C.'+sCampoPessJur+'  = H.IDPESSJUR(+) AND '+
                                '        C.IDPLANOPREV    = H.IDPLANOPREV(+) AND '+
                                '        C.IDPESSOA       = H.IDPESSOA(+) AND '+
                                '        C.IDCONTRIBUICAO = H.'+sCampoContrib+'(+) '+
                                ' ORDER BY H.MESREFERENCIA  ')
      else dtmAPrev.qry.SQL.Add('  SELECT DECODE(NVL(H.VALORRECEBIDO,0),0,H.VALORESPERADO,H.VALORRECEBIDO) AS VALORRECEBIDO, C.VALORBASE1, C.VALORBASE2, C.VALORBASE3 '+ // CAMILLE - 27.10.2004
                                ' FROM   '+sTabelaValor+' H, '+sNomeTabela+' C '+
                                ' WHERE  C.'+sCampoPessJur+'  = '+IntToStr(piIdPessJur)  +' AND '+
                                '        C.IDPLANOPREV        = '+IntToStr(piIdPlanoPrev)+' AND '+
                                '        C.IDPESSOA           = '+IntToStr(piIdPessoa)   +' AND '+
                                '        C.IDCONTRIBUICAO     = '+IntToStr(piIdContribAssoc1)+' AND '+
                                '        H.SEQPROPOSTA(+)     = '+IntToStr(piSeqProposta)+' AND '+
                                '        H.MESREFERENCIA(+)   = '''+sMesReferencia +''' AND '+
                                '        H.MESCOBRANCA(+)     = '''+psAnoMesCobranca+''' AND '+
                                '        NVL(H.CODREFERENCIA(+),'''+copy(sDataRef,7,4)+'/'+copy(sDataRef,4,2)+''')   = '''+copy(sDataRef,7,4)+'/'+copy(sDataRef,4,2)+''' AND '+ //leofuncef - 06082004
                                '        C.'+sCampoPessJur+'  = H.IDPESSJUR(+) AND '+
                                '        C.IDPLANOPREV    = H.IDPLANOPREV(+) AND '+
                                '        C.IDPESSOA       = H.IDPESSOA(+) AND '+
                                '        C.IDCONTRIBUICAO = H.'+sCampoContrib+'(+) '+
                                ' ORDER BY H.MESREFERENCIA  ');
      dtmAPrev.qry.Open;

      if not dtmAPrev.qry.IsEmpty then dtmAPrev.qry.First;
      if dtmAPrev.qry.FieldByName('VALORRECEBIDO').AsString = ''
      then sValorAssociadoNoMesCob := '0'
      else sValorAssociadoNoMesCob := OraNumero(dtmAPrev.qry.FieldByName('VALORRECEBIDO').AsString);

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
                     '        C.IDCONTRIBUICAO     = '+IntToStr(piIdContribAssoc2)+' AND '+
                     '        H.SEQPROPOSTA(+)     = '+IntToStr(piSeqProposta)+' AND '+
                     '        H.MESREFERENCIA(+)   = '''+sMesReferencia      +''' AND '+
                     '        NVL(H.CODREFERENCIA(+),'''+copy(sDataRef,7,4)+'/'+copy(sDataRef,4,2)+''')   = '''+copy(sDataRef,7,4)+'/'+copy(sDataRef,4,2)+''' AND '+ //leofuncef - 05082004
                     '        C.'+sCampoPessJur+'  = H.IDPESSJUR(+) AND '+
                     '        C.IDPESSOA       = H.IDPESSOA(+) AND '+
                     '        C.IDPLANOPREV    = H.IDPLANOPREV(+) AND '+
                     '        C.IDCONTRIBUICAO = H.'+sCampoContrib+'(+) '+
                     ' ORDER BY H.MESREFERENCIA  ');
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
                     '        C.IDCONTRIBUICAO     = '+IntToStr(piIdContribAssoc3)+' AND '+
                     '        H.SEQPROPOSTA(+)     = '+IntToStr(piSeqProposta)+' AND '+
                     '        H.MESREFERENCIA(+)   = '''+sMesReferencia      +''' AND '+
                     '        NVL(H.CODREFERENCIA(+),'''+copy(sDataRef,7,4)+'/'+copy(sDataRef,4,2)+''')   = '''+copy(sDataRef,7,4)+'/'+copy(sDataRef,4,2)+''' AND '+ //leofuncef - 05082004
                     '        C.'+sCampoPessJur+'  = H.IDPESSJUR(+) AND '+
                     '        C.IDPESSOA           = H.IDPESSOA(+) AND '+
                     '        C.IDPLANOPREV        = H.IDPLANOPREV(+) AND '+
                     '        C.IDCONTRIBUICAO = H.'+sCampoContrib+'(+) '+
                     ' ORDER BY H.MESREFERENCIA  ');
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

   bPartReinsc := PartReinscrito(piIdPessJur, piIdPlanoPRev, piIdPessoa, dtmAPrev.qry);
   if bPartReinsc
   then sPartReinsc := '1'
   else sPartReinsc := '0';

   // Buscar o salario de ativo em caso de Manut.Parc (histrubsal), senao encontrar pegar o ultimo na tabela partprevplan
   // É necessário em caso de retroativos. Onde os salarios foram gerados no hist.
   // para outros eventos os seus respectivos salarios ja viram corretos, pois nao usam o sal. de uma outra sitaacao de evento
   if ( not pbUtilizaSalarioParametro ) // CAMILLE - 26.11.2003
   then begin
      if ((sSitFundacao  = 'MP') or (sSitFundacao  = 'MA'))
      then begin
         // Buscar salario de ativo no mes em questao
         dtmAPrev.qry.Close;
         dtmAPrev.qry.SQL.Clear;
         dtmAPrev.qry.SQL.Add(' SELECT /*+ RULE */ DECODE(VLRANTRETROATIVO, NULL, VALORPROVENTO , VLRANTRETROATIVO) AS VALORPROVENTO '+
                              ' FROM   HISTRUBSAL H, PATRO PT'+
                              ' WHERE  (PT.IDPESSOA = '+IntToStr(piIdPessJur)+')  '+
                              ' AND    (H.IDPESSOA  = '+IntToStr(piIdPessoa)  +')  '+
                              ' AND    (H.MES       = '''+sMesReferencia      +''') '+
                              ' AND    (H.IDRUBRICA = PT.IDRUBSALPARTICIP )   '+
                              ' AND    (H.IDPESSJUR = PT.IDPESSOA         )   ');
         dtmAPrev.qry.Open;
         if dtmAPrev.qry.IsEmpty
         then sSalarioEncontrado := BuscaSalario( piIdPessJur,   piIdPlanoPrev, piIdPessoa,
                                                  sMesReferencia, 'AT', sSalarioPart,   sMsgErro,
                                                  dtmAPrev.qry,
                                                  piOrigem) // CAMILLE - 04.11.2004
         else sSalarioEncontrado := dtmAPrev.qry.FieldByName('ValorProvento').AsString;

         if Trim(sSalarioEncontrado) = ''
         then sValorSalPart   := OraNumero(BuscaSalarioAtual(piIdPessJur,piIdPlanoPrev,piIdPessoa,dtmAPrev.qry))
         else sValorSalPart   := OraNumero(sSalarioEncontrado);

         with dtmAPrev.qry do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT SALMANTIDO FROM PARTPREVPLAN '+
                    ' WHERE  (IDPESSJUR   = '+IntToStr(piIdPessJur)+') '+
                    ' AND    (IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+') '+
                    ' AND    (IDPESSOA    = '+IntToStr(piIdPessoa)+') '+
                    ' AND    (SEQPROPOSTA = '+IntToStr(piSeqProposta)+') ');
            Open;

            if not IsEmpty
            then sValorRubParcial := FieldByName('SALMANTIDO').AsString
            else sValorRubParcial := '0';
            Close;
         end;

         sValorRubParcial     := BuscaSalario( piIdPessJur,  piIdPlanoPrev,  piIdPessoa,
                                              sMesReferencia,
                                              sSitFundacao,//leocm - 21062002 - troquei 'mp' por sSitFundacao
                                              sValorRubParcial,   sMsgErro,
                                              dtmAPrev.qry,
                                              piOrigem); // CAMILLE - 04.11.2004


         sValorRubParcial     := OraNumero(sValorRubParcial);
         sValorRubMantido     := OraNumero(sValorRubParcial);
         sValorSalMantido     := OraNumero(sValorRubParcial);
         sValorRemTotal       := OraNumero(sValorRubParcial);



         //leofuncef - 19022004 - inicio
         //sValorSalPart        := OraNumero(sValorRubParcial);  //leocm - 21062002

         dtmAPrev.qry.Close;
         dtmAPrev.qry.SQL.Clear;
         dtmAPrev.qry.SQL.Add(' SELECT FLGDESCFOLHA FROM CONTRIBPREVPARTP  '+
                 ' WHERE  (IDPESSJUR   = '+IntToStr(piIdPessJur)+') '+
                 ' AND    (IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+') '+
                 ' AND    (IDPESSOA    = '+IntToStr(piIdPessoa)+') '+
                 ' AND    (SEQPROPOSTA = '+IntToStr(piSeqProposta)+') '+
                 ' AND    (IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+') ');
         dtmAPrev.qry.Open;

         //CASO A COBRANÇA SEJA EM BANCO, UTILIZAR O SALMANTIDO, CASO NÃO UTILIZARO SAPARTICIPACAO
         if dtmAPrev.qry.fieldbyname('FLGDESCFOLHA').AsString = '0' then
            sValorSalPart        := OraNumero(sValorRubParcial);

         //leofuncef - 19022004 - fim






   //  cguedes - 13/08/2002
   //      sSalarioIntegral     := OraNumero(sValorRubParcial);
         sSalarioIntegral := BuscaSalarioPESSOAINTEGRAL ( dtmAPrev.qry,
                                                     piIdPessJur,  piIdPlanoPrev,
                                                     piIdPessoa,   piSeqProposta,
                                                     sSitFundacao, sMesReferencia );
   //
         if Copy(sMesReferencia,6,2) = '13'
         then begin
           sSalario13      := BuscaSalario( piIdPessJur,  piIdPlanoPrev,  piIdPessoa,
                                             sMesReferencia,
                                             sSitFundacao, //leocm - 21062002 - troquei 'mp' por sSitFundacao
                                             sSalarioPart,   sMsgErro,
                                             dtmAPrev.qry,
                                             piOrigem); // CAMILLE - 04.11.2004

         end
         else begin
           sSalario13      := '0';
         end;
      end
      else begin
         // Se o participante estiver assistido, verificar se o participante possui
         // Salario Virtual. Se sim, passar o salario virtual como salario de participacao
         // Se nao, passar o salario de participacao
         if sSitFundacao  = 'AS'
         then begin
            sValorSalPart    := BuscaSalarioPESSOA ( dtmAPrev.qry,
                                                     piIdPessJur,  piIdPlanoPrev,
                                                     piIdPessoa,   piSeqProposta,
                                                     sSitFundacao, sMesReferencia );

            if (Copy(sMesReferencia, 6, 2) = '13') and ( Trim(sDataFinalEvento) <> '') and
               (Copy(sMesReferencia, 1, 4) = Copy(sDataFinalEvento, 7, 4) )
            then sMesAux := Copy(sDataFinalEvento,7,4)+'/'+Copy(sDataFinalEvento,4,2)
            else sMesAux := sMesReferencia;

            sSalarioIntegral := BuscaSalarioPESSOAINTEGRAL ( dtmAPrev.qry,
                                                     piIdPessJur,  piIdPlanoPrev,
                                                     piIdPessoa,   piSeqProposta,
                                                     sSitFundacao, sMesAux );

            // Se for ASSISTIDO TEMPORARIO (AUXILIO DOENCA, AUXILIO ACIDENTE), que
            // use SALARIO VIRTUAL, buscar SALARIO VITUAL INTEGRAL
            sValorRubParcial     := '0';
            sValorRubMantido     := '0';
            sValorSalMantido     := '0';
            sValorRemTotal       := sValorSalPart;
            sSalarioPart         := sValorSalPart; //leocbs - 3001 - passar o salário virtual como salário de participação
         end
         else begin
            // CGUEDES - 18/09/2002
            // AQUI É ATIVO!!!
            sSalarioPart    := BuscaSalarioPESSOA ( dtmAPrev.qry,
                                                     piIdPessJur,  piIdPlanoPrev,
                                                     piIdPessoa,   piSeqProposta,
                                                     sSitFundacao, sMesReferencia );

            sValorSalPart        := OraNumero(sSalarioPart);
            sValorRubParcial     := OraNumero(sSalarioPart);
            sValorRubMantido     := OraNumero(sSalarioPart);
            sValorSalMantido     := OraNumero(sSalarioPart);
            sValorRemTotal       := OraNumero(sSalarioPart);
            sSalarioIntegral     := OraNumero(sSalarioPart);

            if Copy(sMesReferencia,6,2) = '13' then
            Begin
              //Bruno Bastos - Pend. 19233 - 19/12/2005 - Início
              If prmIdMotAbnFolhaFund > 0 Then
                sSalario13      := BuscaSalario( piIdPessJur,  piIdPlanoPrev,  piIdPessoa,
                                                    sMesReferencia, sSitFundacao,
                                                    sSalarioPart,   sMsgErro,
                                                    dtmAPrev.qry,
                                                    piOrigem, // CAMILLE - 04.11.2004
                                                    prmIdMotAbnFolhaFund,
                                                    True)
              Else
                sSalario13      := BuscaSalario( piIdPessJur,  piIdPlanoPrev,  piIdPessoa,
                                                    sMesReferencia, sSitFundacao,
                                                    sSalarioPart,   sMsgErro,
                                                    dtmAPrev.qry,
                                                    piOrigem, // CAMILLE - 04.11.2004
                                                    0,
                                                    True);
              //Bruno Bastos - Pend. 19233 - 19/12/2005 - Fim
            End
            else sSalario13      := '0';
         end;
      end;
   end
   else begin
      sValorSalPart        := OraNumero(sSalarioPart);
      sValorRubParcial     := OraNumero(sSalarioPart);
      sValorRubMantido     := OraNumero(sSalarioPart);
      sValorSalMantido     := OraNumero(sSalarioPart);
      sValorRemTotal       := OraNumero(sSalarioPart);
      sSalarioIntegral     := OraNumero(sSalarioPart);
   end;


   if (sSalarioPart = '') or (sSalarioPart = '0') or (StrToFloat(ClienteNumero(sSalarioPart)) <= 0)
   then begin
      // Ler Rubricas Salariais
      // CGUEDES - 09/09/2002
//      sValorSalPart   := CalcSALPART(piIdPessJur,piIdPessoa,sMesReferencia, dtmAPrev.qry);
//      sValorRemTotal  := CalcREMTotal(piIdPessJur,piIdPessoa,sMesReferencia, dtmAPrev.qry);

      if (sSitFundacao = 'MP')
      then sValorRubParcial := CalcRUBParcial(piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,
                                              sMesReferencia, dtmAPrev.qry);
      if (sSitFundacao = 'MA')
      then sValorRubMantido := CalcRUBMantido(piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,
                                         sMesReferencia, dtmAPrev.qry);

      sValorSalPart    := OraNumero(sValorSalPart);
      sValorRemTotal   := OraNumero(sValorRemTotal);
      sValorRubParcial := OraNumero(sValorRubParcial);
      sValorRubMantido := OraNumero(sValorRubMantido);
      sSalarioIntegral := OraNumero(sValorSalPart);
   end;

   // Traz todas as situaçoes do participante
   sSql:='select ev.ideventosprev, ev.idsitplanoatual, ev.idsitplanonovo, '+
         'ev.idsitpartatual, ev.idsitpartnovo, ev.idsitfuncatual, ev.idsitfuncnovo, '+
         'st.flginterno,     sta.flginterno as flginternoant, '+
         'sf.tiposit,        sfa.tiposit    as tipositant     '+
         'from   eventosprev ev, sitpart st,  sitpart sta,    '+
         '                       sitfunc sf,  sitfunc sfa     '+
         'where  ev.idsitpartatual = sta.idsitpart            '+
         'and    ev.idsitpartnovo  = st.idsitpart             '+
         'and    ev.idsitfuncatual = sfa.idsitfunc            '+
         'and    ev.idsitfuncnovo  = sf.idsitfunc             '+
         'AND    EV.IDEVENTOSPREV IN '+
         '        ( SELECT MAX(IDEVENTOSPREV) '+
         '          FROM EVENTOSPREV          '+
         '          WHERE IDPESSOA     = '+IntToStr(piIdPessoa)+
         '          AND   IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
         '          AND   IDPESSJUR    = '+IntToStr(piIdPessJur)+
         '          AND   DATAREGISTRO = ( SELECT MAX(DATAREGISTRO) FROM EVENTOSPREV '+
         '                                 WHERE IDPESSOA     = '+IntToStr(piIdPessoa)+
         '                                 AND   IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
         '                                 AND   IDPESSJUR    = '+IntToStr(piIdPessJur)+') '+
         '        )' ;
   dtmAPrev.qry.Close;
   dtmAPrev.qry.Sql.Clear;
   dtmAPrev.qry.Sql.Add(sSql);
   dtmAPrev.qry.Open;
   if not dtmAPrev.qry.IsEmpty
   then begin
      sIdEventosPrev   := dtmAPrev.qry.FieldByName('ideventosprev').AsString;
      sTipoSitAntes    := dtmAPrev.qry.FieldByName('TipoSitAnt').AsString;

      sFlgInternoAntes := dtmAPrev.qry.FieldByName('flginternoant').AsString;
      sFlgInternoAtual := dtmAPrev.qry.FieldByName('flginterno').AsString;
   // by Alexandre - 29/08/2000 - Inicio
      // Se a origem da chamada do preparo for Suspensao de Contribuicao, nao trocar o flginterno
      if (piOrigem <> 1) AND (piOrigem <> 3) and (piOrigem <> 4)// CAMILLE - 20.02.2003
          and (piOrigem <> 2) //leofuncef - 15092004
          and (piOrigem <> 7) { Augusto 09/03/2005 - 7 Migração de Planos }
          and (piOrigem <> 6) // CAMILLE - 28.10.2004 { Augusto piOrigem estava 10 mudou para 6 }
      then sSitFundacao      := dtmAPrev.qry.FieldByName('flginterno').AsString;
   // by Alexandre - Fim

      sIdSitPartAntes := dtmAPrev.qry.FieldByName('idsitpartatual').AsString;
      sIdSitPlanAntes := dtmAPrev.qry.FieldByName('idsitplanoatual').AsString;
      sIdSitFuncAntes := dtmAPrev.qry.FieldByName('idsitfuncatual').AsString;

      sIdSitPartAtual := dtmAPrev.qry.FieldByName('idsitpartnovo').AsString;
      sIdSitPlanAtual := dtmAPrev.qry.FieldByName('idsitplanonovo').AsString;
      sIdSitFuncAtual := dtmAPrev.qry.FieldByName('idsitfuncnovo').AsString;
      // Fim guarda situaçoes
   end
   else begin
      sIdEventosPrev   := '-1';
      sTipoSitAntes    := ' ';

      sFlgInternoAntes := ' ';
      sFlgInternoAtual := ' ';

      sIdSitPartAntes := '-1';
      sIdSitPlanAntes := '-1';
      sIdSitFuncAntes := '-1';

      sIdSitPartAtual := '-1';
      sIdSitPlanAtual := '-1';
      sIdSitFuncAtual := '-1';
   end;

   // Procurar data final de manutenção, caso o particip venha de manutencao (PDV)
   sDataFinalPdv    := '';
   if (sSitFundacao  = 'MA') and
      (sTipoSitAntes = 'P') then
   begin
      dtmAPrev.qry.Close;
      dtmAPrev.qry.Sql.Clear;
      dtmAPrev.qry.Sql.Add(' select distinct cp.datafinal from contribprevpartp cp, '+
                           '        hstconteventospr hev     '+
                           ' where  hev.ideventosprev   =    '+sIdEventosPrev+
                           ' and    hev.flgassociada    = 0  '+
                           ' and    hev.idcontribuicaof = cp.idcontribuicao '+
                           ' and    cp.datafinal is not null '+
                           ' and    cp.idpessjur        =    '+IntToStr(piIdPessJur)  +
                           ' and    cp.idplanoprev      =    '+IntToStr(piIdPlanoPrev)+
                           ' and    cp.idpessoa         =    '+IntToStr(piIdPessoa)   +
                           ' and    cp.seqproposta      =    '+IntToStr(piSeqProposta));
       dtmAPrev.qry.Open;
       sDataFinalPdv := dtmAPrev.qry.FieldByName('datafinal').AsString;
       dtmAPrev.qry.Close;
   end;
   // fim guarda data final manut. pdv


   // CAMILLE - CBS - 20.11.2001
   if (sTipoCalculo = 'P') or (sTipoCalculo = 'U') or (sTipoCalculo = 'I')
   then sValorSalPart := sSalarioIntegral;


   //leofuncef - 14092004
   if piOrigem = 0 then //leofuncef - 15092004
   begin
      sDataPrevisaoRece := CriticaDataCobrancaSit(dtmAPrev.qry,
                                       IntToStr(piIdPessjur),
                                       IntToStr(piIdPlanoPrev),
                                       sSitFundacao, 'N',
                                       Copy(psAnoMesCobranca,6,2),
                                       Copy(psAnoMesCobranca,1,4));
   end;
   //leofuncef - 14092004 - fim


// *****************************************************************************
// ************************* PADRONIZAÇÃO DE CAMPOS PARA REGRA *****************
// *****************************************************************************
// campo MESREFERENCIA : indica o ANO/MES, no formato AAAA/MM ao qual se refere
// o cálculo. Para 13o. ou abono este campo terá o conteúdo AAAA/13;

// campo ANOMESREF : idem ao campo anterior;

// Se for última cobrança de contribuição :
//    campo DATAINICIO : dia 01 do mes/ano da data do evento que está sendo
//                       registrado no momento (evento este que está encerrando
//                       a contribuição)
//    campo DATAFINAL :  data do evento que está sendo registrado no momento
//                       (evento este que está encerrando a contribuição)

// Se for primeira cobrança de contribuição :
//    campo DATAINICIO : data do evento que está sendo registrado no momento
//    campo DATAFINAL :  data final do evento que está sendo registrado no momento,
//                       se houver, ou '' caso o evento não possua datafinal
// *****************************************************************************
// ****************** FIM DA PADRONIZAÇÃO DE CAMPOS PARA REGRA *****************
// *****************************************************************************
   if (sTipoCalculo = 'P') or (sTipoCalculo = 'U')
   then begin // Se for calculo do 1o. pagamento ou ultimo pagamento
      if sInscricaoData = ''     then sInscricaoData := sDataRef;
      if sDataNasc   = ''        then sDataNasc := sDataRef;
      sDataDemissao              := CalcDataDemissao(piIdPessoa, piIdpessJur,dtmAPrev.qry);
      if trim(sDataDemissao) = '' then sDataDemissao := sDataRef;


      if (sTipoCalculo = 'P') or (Copy(sMesReferencia,6,2) = '13') //  primeira cobranca
      then begin
         sDataInicio := sDataInicioEvento;
         sDataFinal  := sDataFinalEvento;
      end
      else begin            // ultima cobranca
         // CBS - COMENTADO E REESCRITO - PORQUE O ULTIMO PAGAMENTO PASSA COMO DATA FINAL '' ?????
         // Se for ULTIMO pagamento
         // Entao Se a data inicio e final do evento não forem no mesmo mes/ano
         //       Entao passar como data inicio o 1o. dia do mes da data final
         //       Senao passar como data inicio a propria data inicio do evento
         if (Trim(sDataFinalEvento) <> '')
         then begin
            if Copy(sDataFinalEvento,4,7) <> Copy(sDataInicioEvento,4,7)
            then sDataInicio := '01/'+Copy(sDataFinalEvento,4,2)+'/'+Copy(sDataFinalEvento,7,4)
            else sDataInicio := sDataInicioEvento;
            sDataFinal  := sDataFinalEvento;
         end
         else begin
            if sSitFundacao <> 'AS' // Montar qry de regra para ASSISTIDOS
            then begin
               sDataInicio := sDataRef;
               sDataFinal  := '';
            end
            else begin
               sDataInicio := sDataInicioEvento;
               sDataFinal  := '';
            end;
         end;
      end;
      if Trim(sDataRef)      = '' then sDataRef      := '          ';
      if Trim(sDataDemissao) = '' then sDataDemissao := '          ';
      if Trim(sDataInicio)   = '' then sDataInicio   := '          ';
      if Trim(sDataFinal)    = '' then sDataFinal    := '          ';

      sValorSalPart := sSalarioIntegral;

      if sSitFundacao = 'AS' // Montar qry de regra para ASSISTIDOS
      then begin
        // TEMPORARIO
        IF (STIPOCALCULO = 'U') AND (cOPY(sDataFinal,1,2) >='31') // CAMILLE - 29.01.2003 - ALTERAR REGRAS DA FCRT PARA NAO PRECISAR DISTO
        THEN sDataFinal := '30'+copy(sDataFinal,3,8);
        // TEMPORARIO

        // CAMILLE - 27.01.2003
        // Se for concessao e o pagamento do 13o. for no final do ano
        if ( (piOrigem =  2) or (piOrigem = 7) ) { Augusto 09/03/2005 - 7 Migração de Planos }
           and (Copy(sMesReferencia,6,2) = '13')
        then begin
           sValorUltBeneficio := CalcBeneficioAtual(piIdPessJur,
                                                    piIdPlanoPrev,
                                                    piIdPessoa,
                                                    sMesReferencia,
                                                    sMesReferencia,
                                                    sIDTPPAGTOANT,
                                                    sFlgBenefMinimo,
                                                    sValorSrb,
                                                    dtmAPrev.qry, piNumProcesso );

           dValorBeneficioNoMovimento := CalcBeneficioDoMovimento( dtmAPrev.qry,
                                       piNumProcesso,
                                       piIdPessJur,
                                       piIdPlanoPrev,
                                       piIdPessoa,
                                       piIdPessoa,
                                       sMesReferencia,
                                       piIdLote,
                                       'I', { Augusto - 25/10/2003 era S, passando o valor ProRata erradamente }
                                       'R');

           dValorINSSNoMovimento := CalcBeneficioDoMovimento( dtmAPrev.qry,
                                       piNumProcesso,
                                       piIdPessJur,
                                       piIdPlanoPrev,
                                       piIdPessoa,
                                       piIdPessoa,
                                       sMesReferencia,
                                       piIdLote,
                                       'I',
                                       'R');

           // CAMILLE - 28.11.2003
           // Se for retroativo, buscar o valor integral da linha inserida pelo retroativo (pelo idmotivo)
           if piOrigem = 6 { Augusto 21/01/2005 - piOrigem estava 10 mudou para 6 }
           then dValorIntegralBenef := PegaValorIntegral( dtmAPrev.qry,
                                                          piNumProcesso,
                                                          -1,
                                                          piIdPessoa,
                                                          { Augusto 23/03/2004 }
                                                          //'01/12/'+Copy(sMesReferencia,1,4),
                                                          '01/'+Copy(sMesReferencia,6,2)+'/'+Copy(sMesReferencia,1,4),
                                                          piIdMotivoContrib,
                                                          piIdLote) { Augusto 17/12/2004 }

           else dValorIntegralBenef := PegaValorIntegral( dtmAPrev.qry,
                                                          piNumProcesso,
                                                          -1,
                                                          piIdPessoa,
                                                          { Augusto 23/03/2004 }
                                                          //'01/12/'+Copy(sMesReferencia,1,4),
                                                          '01/'+Copy(sMesReferencia,6,2)+'/'+Copy(sMesReferencia,1,4),
                                                          );

           sValorUltINSS       := CalcBeneficioINSSAtual( piIdPessJur,
                                                     piIdPlanoPrev,
                                                     piIdPessoa, { Augusto 05/12/2006 }
                                                     piIdPessoa,
                                                     sMesReferencia,
                                                     sMesReferencia,
                                                     sIDTPPAGTOANT,
                                                     sFlgBenefMinimo,
                                                     dtmAPrev.qry,
                                                     piNumProcesso );  // Gleyber - 19/12/2002
           sValorINSSIntegral := sValorUltINSS; { Augusto 20/01/2005 }

        end
        else begin
           sValorUltBeneficio := CalcBeneficioAtual(piIdPessJur,piIdPlanoPrev,piIdPessoa,
                                                    sMesReferencia,sMesReferencia,sIDTPPAGTOANT,sFlgBenefMinimo,
                                                    sValorSrb,
                                                    dtmAPrev.qry, piNumProcesso );

           dValorBeneficioNoMovimento := CalcBeneficioDoMovimento( dtmAPrev.qry,
                                       piNumProcesso,
                                       piIdPessJur,
                                       piIdPlanoPrev,
                                       piIdPessoa,
                                       piIdPessoa,
                                       sMesReferencia,
                                       piIdLote,
                                       'S',
                                       'I'); { Augusto - 25/10/2003 era R, passando o valor ProRata erroneamente }
           dValorINSSNoMovimento := CalcBeneficioDoMovimento( dtmAPrev.qry,
                                       piNumProcesso,
                                       piIdPessJur,
                                       piIdPlanoPrev,
                                       piIdPessoa,
                                       piIdPessoa,
                                       sMesReferencia,
                                       piIdLote,
                                       'I',
                                       'R');


           sValorUltINSS      := CalcBeneficioINSSAtual(piIdPessJur,piIdPlanoPrev, piIdPessoa, { Augusto 05/12/2006 }
                                                        piIdPessoa,
                                                        sMesReferencia,sMesReferencia,sIDTPPAGTOANT,sFlgBenefMinimo,
                                                        dtmAPrev.qry, piNumProcesso );  // Gleyber - 19/12/2002
           sValorINSSIntegral := sValorUltINSS; { Augusto 20/01/2005 }

           // CAMILLE - 28.11.2003
           // Se for retroativo, buscar o valor integral da linha inserida pelo retroativo (pelo idmotivo)
           if piOrigem = 6 { Augusto 21/01/2005 - piOrigem estava 10 mudou para 6 }
           then dValorIntegralBenef := PegaValorIntegral( dtmAPrev.qry,
                                                          piNumProcesso,
                                                          -1,
                                                          piIdPessoa,
                                                          '01/'+Copy(sMesReferencia,6,2)+'/'+Copy(sMesReferencia,1,4),
                                                          piIdMotivoContrib,
                                                          piIdLote) { Augusto 17/12/2004 }

           else dValorIntegralBenef := PegaValorIntegral( dtmAPrev.qry,
                                                          piNumProcesso,
                                                          -1,
                                                          piIdPessoa,
                                                          '01/'+Copy(sMesReferencia,6,2)+'/'+Copy(sMesReferencia,1,4) );


        end;
        sVlrInssPAGO       := CalcBeneficioINSSPAGO(piIdPessJur,piIdPlanoPrev,piIdPessoa,
                                                     sMesReferencia,sMesReferencia,sIDTPPAGTOANT,sFlgBenefMinimo,
                                                     dtmAPrev.qry, piNumProcesso );   // CAMILLE - 23.01.2003

        if piOrigem = 6 // Retroativo { Augusto 21/01/2005 - piOrigem estava 10 mudou para 6 }
        then begin // CAMILLE - 16.06.2003
           sValorUltINSS              := sVlrInssPAGO;
           dValorBeneficioNoMovimento := StrToFloat(ClienteNumero(sValorUltBeneficio));
        end;

      end;

      // CGUEDES - 11/09/2002
      sFlgProvisorio := BuscaFlgProvisorio(dtmAPrev.qry, piNumProcesso);

      // PREPARAR SQL
      { Augusto 26/10/2003 - VALORREFERENCIA passava sValorFinal que vindo da   }
      { PreparaContribuicaoAssistido estava zerado, agora passo o VALORINTEGRAL }

      If ( piOrigem <> 6 ) Then { Augusto 03/07/2007 - Quando revisão, não alterar valor  }
        If sValorFinal = '0' Then sValorFinal := OraNumero(FloatToStr(dValorBeneficioNoMovimento));

      sSQLRegra := ' SELECT 1 AS FLGCONCESSAO, '+sValorFinal+' AS VALORREFERENCIA, '+
                          IntToStr(piOrigem)+ ' AS ORIGEM, '+ // CAMILLE - 28.01.2003
                              sValorFinal+' AS VALORPREV,           '+
                          ''''+sMesReferencia+''' AS MESREFERENCIA, '+
                          ''''+sMesReferencia+''' AS ANOMESREF,     '+
                          ''''+sDataRef+'''       AS DATAREF,       '+
                          ''''+sDataRenova+'''    AS DATARENOVA,    '+ // CAMILLE - 18.12.2002
                          ''''+sDataInicioOriginal+'''    AS DATAINICIOORIGINAL,    '+ { Augusto 31/01/2005 }
                          ''''+sDataDemissao+''' AS DATADEMISSAO, '+
                          ''''+sFlgInternoAntes+''' AS FLGINTERNOANT,   '+
                          ''''+sFlgInternoAtual+''' AS FLGINTERNO,      '+
                          ''''+sIdSitPartAntes +''' AS IDSITPARTATUAL,  '+
                          ''''+sIdSitPlanAntes +''' AS IDSITPLANOATUAL, '+
                          ''''+sIdSitFuncAntes +''' AS IDSITFUNCATUAL,  '+
                          ''''+sIdSitPartAtual +''' AS IDSITPARTNOVO,   '+
                          ''''+sIdSitPlanAtual +''' AS IDSITPLANONOVO,  '+
                          ''''+sIdSitFuncAtual +''' AS IDSITFUNCNOVO,   '+
                          sPartReinsc +' AS PARTREINSC, '+
                          sValorBase1+ ' AS VALORBASE1, '+
                          sValorBase2+ ' AS VALORBASE2, '+
                          sValorBase3+ ' AS VALORBASE3, '+
                          IntToStr(piIdPessJur)     +' AS IDPESSJUR,       '+
                          IntToStr(piIdPlanoPrev)   +' AS IDPLANOPREV,     '+
                          IntToStr(piIdPessoa)      +' AS IDPESSOA,        '+
                          IntToStr(piSeqProposta)   +' AS SEQPROPOSTA,     '+
                          IntToStr(piIdContribuicao)+' AS IDCONTRIBUICAO,  '+
                          sValorSalPart             +' AS VALORPROVENTO,   '+
                          OraNumero(sValorUltINSS)+' AS VLRINFINSS, '+ // cguedes - 09/07/2002
                          OraNumero(sValorINSSIntegral)+' AS VALORINSSINTEGRAL, '+ { Augusto 20/01/2005 }
                          OraNumero(sSalarioIntegral) +' AS SALARIOINTEGRAL, '+
                          sValorRemTotal            +' AS VALORREMTOTAL,   '+
                          sValorRubParcial          +' AS RUBPARCIAL,      '+
                          sValorRubMantido          +' AS RUBMANTIDO,      '+
                          OraNumero(sSalario13)     +' AS SALARIO13,       '+
                          ''''+sInscricaoData       +''' AS INSCRICAODATA, '+
                          ''''+sIdSitPart           +''' AS IDSITPART,     '+
                          ''''+sDataNasc            +''' AS DATANASC,      '+
                          sValorAssociado           +' AS VALORASSOCIADO,  '+
                          sValorAssociado2          +' AS VALORASSOCIADO2, '+
                          sValorAssociado3          +' AS VALORASSOCIADO3, '+
                          sValorAssociadoNoMescob   +' AS VALORASSOCIADOCOB, '+
                          ''''+OraNumero(sIdParcelamento)+''' AS IDPARCELAMENTO, '+ // CAMILLE - 11.03.2004
                               OraNumero(sPercentual)    +'   AS PERCENTUAL ,    '+ // CAMILLE - 11.03.2004
                               OraNumero(sVlrDividaPart) +'   AS VLRDIVIDAPART,  '+ // CAMILLE - 11.03.2004
                               OraNumero(sVlrDividaPatro)+'   AS VLRDIVIDAPATRO, '+ // CAMILLE - 11.03.2004
                               OraNumero(sVlrPrestacao)  +'   AS VALORPRESTACAO, '+ // CAMILLE - 11.03.2004
                               OraNumero(sVlrSdoDevedor) +'   AS SDODEVEDOR,     '+ // CAMILLE - 11.03.2004

                          { Inicio Augusto 20/02/2003 }
                          //OraNumero(sValorUltBeneficio)        +' AS VALORATUAL, '+ // cguedes - 09/07/2002
                          OraNumero(FloatToStr(dValorBeneficioNoMovimento))+' AS VALORATUAL, '+ // cguedes - 09/07/2002
                          { Fim  Augusto 20/02/2003 }
                          OraNumero(FloatToStr(dValorBeneficioNoMovimento))+' AS VALORNOLOTE, '+// CAMILLE - 11.02.2003
                          OraNumero(FloatToStr(dValorINSSNoMovimento))+' AS INSSNOLOTE, '+// CAMILLE - 11.02.2003
                          OraNumero(FloatToStr(dValorIntegralBenef))+' AS VALORINTEGRAL, '+ // camille - 05.08.2002
                          sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                          sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                          sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3, '+
                          ''''+sDataInicio+''' AS DATAINICIO, '+
                          ''''+sDataFinal +''' AS DATAFINAL, '+
                          sFlgProvisorio + ' AS FLGPROVISORIO, '+ // CGUEDES - 11/09/2002
                          Oranumero(sValorSrb)+' AS VALORSRB, '+ //LEOCM - 08102002
                          ' PP.DATAINICIOMANUT, EL.FLGDIRETOR, '+ { Augusto 28/10/2003 }
                   ' EL.IDSITFUNC, PP.FLGDEVEPREVIDENC, PP.FLGDEVEASSISTENC,  PP.FLGDEVEEMPRESTIMO '+
                   ' , '''+sIdParcelamento+''' IDPARCELAMENTO, '+
                   { Augusto 29/01/2004 - Oranumero() }
                   Oranumero(sPercentual)    +' PERCENTUAL , '+
                   Oranumero(sVlrDividaPart) +' VLRDIVIDAPART,'+
                   Oranumero(sVlrDividaPatro)+' VLRDIVIDAPATRO '+ //leofuncef - 04122002

                   //leofuncef - 14092004
                   ' , '''+sDataPrevisaoRece+''' DATAPREVISAORECE, ''PRP'' IDDEPENDENCIA, '+
                   ' PF.SEXO, EL.TEMPOSERVTOTAL, EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
                   ' EL.IDPESSOA AS IDTITULAR '+
                   //leofuncef - 14092004  - fim

                   ' ,EL.DATAADMISSAO '+ //leofuncef - 21102004

                   ' FROM ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF  '+ //leofuncef - 14092004  - COLOQUEI PESSOAFISCA
                   ' WHERE (PP.IDPESSJUR   = '+IntToStr(piIdPessJur)+')'+
                   ' AND   (PP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+')'+
                   ' AND   (PP.IDPESSOA    = '+IntToStr(piIdPessoa)+')'+
                   ' AND   (PP.SEQPROPOSTA = '+IntToStr(piSeqProposta)+')'+
                   ' AND   (PP.IDPESSJUR   = EL.IDPESSJUR) '+
                   ' AND   (PP.IDPESSOA    = EL.IDPESSOA) '+
                   ' AND   (PF.IDPESSOA    = EL.IDPESSOA)  ';
   end
   else begin
      sMesReferenAnt := SAnoMesAnterior(sMesReferencia);
      if Trim(sDataRef)      = '' then sDataRef      := '          ';
      if Trim(sDataDemissao) = '' then sDataDemissao := '          ';
      if Trim(sDataInicio)   = '' then sDataInicio   := '          ';
      if Trim(sDataFinal)    = '' then sDataFinal    := '          ';

      // CAMILLE - 30.07.2002 - FCRT
      if sSitFundacao = 'AS' // Montar qry de regra para ASSISTIDOS
      then begin
        sValorSalPart := sSalarioIntegral; // Gleyber - 19/05/2004 - Pendência 16811

        sValorUltBeneficio := CalcBeneficioAtual(piIdPessJur,piIdPlanoPrev,piIdPessoa,
                                                 sMesReferencia,sMesReferencia,sIDTPPAGTOANT,sFlgBenefMinimo,
                                                 sValorSrb,
                                                 dtmAPrev.qry, piNumProcesso );
        { Inicio Augusto 28/04/2004 - No retroativo buscar o VALORINTEGRAL }
        If piOrigem = 6 then begin { Augusto 21/01/2005 - piOrigem estava 10 mudou para 6 }

          { Augusto 16/01/2006 -                                                    }
          { Com origem 6 (Revisão de beneficio), pasar para o campo VALORATUAL      }
          { da regra de cálculo da contribuição a soma (+e-) dos VALORPREV da HSTB. }
          { Independente de LOTE. O valor da contribuição vai ser calculado sobre   }
          { esse valor e depois o sistema fará o batimento com o que já está no histórico. }
          dValorBeneficioNoMovimento := CalcBeneficioNoMes( dtmAPrev.qry,
                                          piNumProcesso,
                                          piIdPessJur,
                                          piIdPlanoPrev,
                                          piIdPessoa,
                                          piIdPessoa,
                                          sMesReferencia,
                                          -1,  { Augusto 16/01/2006 - Buscar sempre o VALORINTEGRAL do LOTE //piIdLote, } 
                                          'S',
                                          'R');

        { Inicio Augusto 09/01/2006 - na Retenção, buscar valores independente de Lote }
        End Else If piOrigem = 8 then begin
          dValorBeneficioNoMovimento := CalcBeneficioNoMes( dtmAPrev.qry,
                                          piNumProcesso,
                                          piIdPessJur,
                                          piIdPlanoPrev,
                                          piIdPessoa,
                                          piIdPessoa,
                                          sMesReferencia,
                                          -1, { Buscar todos os Lotes }
                                          'S',
                                          'R');
        { Fim Augusto 09/01/2006 }

        End Else Begin
          dValorBeneficioNoMovimento := CalcBeneficioDoMovimento(dtmAPrev.qry,
                                          piNumProcesso,
                                          piIdPessJur,
                                          piIdPlanoPrev,
                                          piIdPessoa,
                                          piIdPessoa,
                                          sMesReferencia,
                                          piIdLote,
                                          'S',
                                          'R');
        End;
        { Inicio Augusto 28/04/2004 }
        dValorINSSNoMovimento := CalcBeneficioDoMovimento( dtmAPrev.qry,
                                       piNumProcesso,
                                       piIdPessJur,
                                       piIdPlanoPrev,
                                       piIdPessoa,
                                       piIdPessoa,
                                       sMesReferencia,
                                       piIdLote,
                                       'I',
                                       'R');

        // CAMILLE - 27.01.2003
        // Se for concessao e o pagamento do 13o. for no final do ano
        if ( (piOrigem =  2) or (piOrigem = 7) ) { Augusto 09/03/2005 - 7 Migração de Planos }
           and (Copy(sMesReferencia,6,2) = '13')
        then begin
           sValorUltBeneficio := '0';
           If ( piOrigem =  7 ) Then
             sValorUltBeneficio := CalcBeneficioAtual(piIdPessJur,
                                                      piIdPlanoPrev,
                                                      piIdPessoa,
                                                      sMesReferencia,
                                                      sMesReferencia,
                                                      sIDTPPAGTOANT,
                                                      sFlgBenefMinimo,
                                                      sValorSrb,
                                                      dtmAPrev.qry, piNumProcesso );


           dValorBeneficioNoMovimento := CalcBeneficioDoMovimento( dtmAPrev.qry,
                                       piNumProcesso,
                                       piIdPessJur,
                                       piIdPlanoPrev,
                                       piIdPessoa,
                                       piIdPessoa,
                                       sMesReferencia,
                                       piIdLote,
                                       'S',
                                       'R');

           dValorINSSNoMovimento := CalcBeneficioDoMovimento( dtmAPrev.qry,
                                       piNumProcesso,
                                       piIdPessJur,
                                       piIdPlanoPrev,
                                       piIdPessoa,
                                       piIdPessoa,
                                       sMesReferencia,
                                       piIdLote,
                                       'I',
                                       'R');

           dValorIntegralBenef := PegaValorIntegral( dtmAPrev.qry,
                                                     piNumProcesso,
                                                     -1,
                                                     piIdPessoa,
                                                     { Augusto 23/03/2004 }
                                                     //'01/12/'+Copy(sMesReferencia,1,4),
                                                     '01/'+Copy(sMesReferencia,6,2)+'/'+Copy(sMesReferencia,1,4),
                                                     );

           sValorUltINSS       := CalcBeneficioINSSAtual( piIdPessJur,
                                                     piIdPlanoPrev,
                                                     piIdPessoa, { Augusto 05/12/2006 }
                                                     piIdPessoa,
                                                     sMesReferencia,
                                                     sMesReferencia,
                                                     sIDTPPAGTOANT,
                                                     sFlgBenefMinimo,
                                                     dtmAPrev.qry,
                                                     piNumProcesso );  // Gleyber - 19/12/2002
           sValorINSSIntegral := sValorUltINSS; { Augusto 20/01/2005 }
        end
        else begin
           if piOrigem = 6 { Augusto 21/01/2005 - piOrigem estava 10 mudou para 6 }
           then dValorIntegralBenef := PegaValorIntegral( dtmAPrev.qry,
                                                          piNumProcesso,
                                                          -1,
                                                          piIdPessoa,
                                                          '01/'+Copy(sMesReferencia,6,2)+'/'+Copy(sMesReferencia,1,4),
                                                          piIdMotivoContrib,
                                                          piIdLote) { Augusto 17/12/2004 }
           else dValorIntegralBenef := PegaValorIntegral( dtmAPrev.qry,
                                                          piNumProcesso,
                                                          -1,
                                                          piIdPessoa,
                                                          '01/'+Copy(sMesReferencia,6,2)+'/'+Copy(sMesReferencia,1,4) );

           sValorUltINSS       := CalcBeneficioINSSAtual( piIdPessJur,
                                                     piIdPlanoPrev,
                                                     piIdPessoa, { Augusto 05/12/2006 }
                                                     piIdPessoa,
                                                     sMesReferencia,
                                                     sMesReferencia,
                                                     sIDTPPAGTOANT,
                                                     sFlgBenefMinimo,
                                                     dtmAPrev.qry,
                                                     piNumProcesso );  // Gleyber - 19/12/2002
           sValorINSSIntegral := sValorUltINSS; { Augusto 20/01/2005 }
        end;

        sVlrInssPAGO       := CalcBeneficioINSSPAGO(piIdPessJur,piIdPlanoPrev,piIdPessoa,
                                                     sMesReferencia,sMesReferencia,sIDTPPAGTOANT,sFlgBenefMinimo,
                                                     dtmAPrev.qry, piNumProcesso );   // CAMILLE - 23.01.2003

        if piOrigem = 6 then begin // Retroativo { Augusto 21/01/2005 - piOrigem estava 10 mudou para 6 }
           sValorUltINSS := sVlrInssPAGO;
           { Augusto 28/04/2004 }
           //dValorBeneficioNoMovimento := StrToFloat(ClienteNumero(sValorUltBeneficio)); // CAMILLE - 16.06.2003
        end;

        sDataInicio := sDataInicioEvento;
        sDataFinal  := sDataFinalEvento;
        if Trim(sDataInicio)   = '' then sDataInicio   := '          ';
        if Trim(sDataFinal)    = '' then sDataFinal    := '          ';

        // CGUEDES - 11/09/2002
        sFlgProvisorio := BuscaFlgProvisorio(dtmAPrev.qry, piNumProcesso);

        sSQLRegra := ' SELECT  1 AS FLGCONCESSAO, CP.IDPESSJUR,      CP.IDPLANOPREV,  CP.IDPESSOA,   CP.IDCONTRIBUICAO,  '+
                     IntToStr(piOrigem)+ ' AS ORIGEM, '+ // CAMILLE - 28.01.2003
                     '         CP.DIAVENCIMENTO,  CP.FLGDESCFOLHA, CP.VALORBASE1,     '+
                     '         CP.VALORBASE2,     CP.VALORBASE3,   CP.FLGCOBRA,   '+
                     '         CP.QTDEPARCELAS,   CP.FLGRETROATIVO,        '+
                     '         ST.FLGINTERNO,  '+
                     '         EL.SALTOTAL,       EL.TEMPONAOCREDITADO, '+
                     '         PF.DATANASC,       PF.DATAMORTE,    PP.SALPARTICIPACAO, '+
                     '         PP.INSCRICAODATA, '''+sDataRef+''' AS DATAREF, '+
                     ''''+sDataRenova+'''    AS DATARENOVA,    '+ // CAMILLE - 18.12.2002
                     ''''+sDataInicioOriginal+'''    AS DATAINICIOORIGINAL,    '+ { Augusto 31/01/2005 }
                     '         CP.SEQPROPOSTA,    ST.IDSITPART,    EL.IDSITFUNC, EL.TEMPOSERVANTERIOR, EL.DATAADMISSAO, '+
                     ''''+sFlgInternoAntes+''' AS FLGINTERNOANT,   '+
                     ''''+sFlgInternoAtual+''' AS FLGINTERNO,      '+
                     ''''+sIdSitPartAntes +''' AS IDSITPARTATUAL,  '+
                     ''''+sIdSitPlanAntes +''' AS IDSITPLANOATUAL, '+
                     ''''+sIdSitFuncAntes +''' AS IDSITFUNCATUAL,  '+
                     ''''+sIdSitPartAtual +''' AS IDSITPARTNOVO,   '+
                     ''''+sIdSitPlanAtual +''' AS IDSITPLANONOVO,  '+
                     ''''+sIdSitFuncAtual +''' AS IDSITFUNCNOVO,   '+
                     sValorAssociado      +' AS VALORASSOCIADO, '+sValorAssociado2+' AS VALORASSOCIADO2, '+
                     sValorAssociado3     +' AS VALORASSOCIADO3, '+
                          sValorAssociadoNoMescob   +' AS VALORASSOCIADOCOB,  '+
                     sValorSalPart        +' AS VALORPROVENTO, '+
                     OraNumero(sSalarioIntegral) +' AS SALARIOINTEGRAL, '+
                     sValorRemTotal       +' AS VALORREMTOTAL, '+
                     sValorRubParcial     +' AS RUBPARCIAL, '+
                     sValorRubMantido     +' AS RUBMANTIDO, '+
                     OraNumero(sSalario13)+' AS SALARIO13, '+
                     ''''+sMesReferencia  +''' AS ANOMESREF, '+
                     ''''+sMesReferencia  +''' AS MESREFERENCIA, '+
                     ''''+sIDTPPAGTOANT   +''' AS IDTPPAGTOANT, '+
                     ''''+sFlgBenefMinimo +''' AS FLGBENEFMIN, '+
                     ''''+OraNumero(sIdParcelamento)+''' AS IDPARCELAMENTO, '+ // CAMILLE - 11.03.2004
                          OraNumero(sPercentual)    +'   AS PERCENTUAL ,    '+ // CAMILLE - 11.03.2004
                          OraNumero(sVlrDividaPart) +'   AS VLRDIVIDAPART,  '+ // CAMILLE - 11.03.2004
                          OraNumero(sVlrDividaPatro)+'   AS VLRDIVIDAPATRO, '+ // CAMILLE - 11.03.2004
                          OraNumero(sVlrPrestacao)  +'   AS VALORPRESTACAO, '+ // CAMILLE - 11.03.2004
                          OraNumero(sVlrSdoDevedor) +'   AS SDODEVEDOR,     '+ // CAMILLE - 11.03.2004
                     { Inicio Augusto 20/02/2003 }
                     //OraNumero(sValorUltBeneficio)              +' AS VALORATUAL, '+
                     OraNumero(FloatToStr(dValorBeneficioNoMovimento))+' AS VALORATUAL, '+ // cguedes - 09/07/2002
                     { Fim  Augusto 20/02/2003 }

                     OraNumero(FloatToStr(dValorBeneficioNoMovimento))+' AS VALORNOLOTE, '+// CAMILLE - 11.02.2003
                     OraNumero(FloatToStr(dValorINSSNoMovimento))+' AS INSSNOLOTE, '+// CAMILLE - 11.02.2003                     
                     OraNumero(FloatToStr(dValorIntegralBenef)) +' AS VALORINTEGRAL, '+ // camille - 07.08.2002
                     sValorUltBeneficio                         +' AS VLBENEFPGTO, '+
                     OraNumero(sValorUltINSS)+' AS VLRINFINSS, '+ // cguedes - 09/07/2002
                     OraNumero(sValorINSSIntegral)+' AS VALORINSSINTEGRAL, '+ { Augusto 20/01/2005 }
                     sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                     sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                     sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3, '+
                     ''''+sDataInicio+''' AS DATAINICIO, '+
                     sFlgProvisorio + ' AS FLGPROVISORIO, '+ // CGUEDES - 11/09/2002
                     Oranumero(sValorSrb)+' AS VALORSRB, '+ //LEOCM - 08102002
                     ' PP.DATAINICIOMANUT, '+
                     ''''+PreparaStr(sDataFinal,10) +''' AS DATAFINAL, '+
                     ' 0 AS PARTREINSC, ' +
                     INTTOSTR(piNumProcesso) +' AS NUMEROPROCESSO ' + // CGUEDES - 15/07/2002
                     ' , '''+sIdParcelamento+''' IDPARCELAMENTO, '+
                     { Augusto 29/01/2004 - Oranumero() }
                     Oranumero(sPercentual)    +' PERCENTUAL , '+
                     Oranumero(sVlrDividaPart) +' VLRDIVIDAPART,'+
                     Oranumero(sVlrDividaPatro)+' VLRDIVIDAPATRO '+ //leofuncef - 04122002
                     ',EL.FLGDIRETOR'+ { Augusto 16/01/2004 }


                     //leofuncef - 14092004
                     ' , '''+sDataPrevisaoRece+''' DATAPREVISAORECE, ''PRP'' IDDEPENDENCIA, '+
                     ' PF.SEXO, EL.TEMPOSERVTOTAL, EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
                     ' EL.IDPESSOA AS IDTITULAR '+
                     //leofuncef - 14092004 - fim

                     ' FROM    CONTRIBPREVPARTP CP,         '+
                     '         PARTPREVPLAN        PP,         '+
                     '         SITPART             ST,         '+
                     '         ELEGPATRO           EL,         '+
                     '         PESSOAFISICA        PF          '+
                     ' WHERE   (CP.IDPESSJUR      = '+IntToStr(piIdPessJur)   +') AND '+
                     '         (CP.IDPLANOPREV    =  '+IntToStr(piIdPlanoPrev)+') AND '+
                     '         (CP.IDPESSOA       = '+IntToStr(piIdPessoa)    +') AND '+
                     '         (CP.SEQPROPOSTA    = '+IntToStr(piSeqProposta) +') AND '+
                     '         (CP.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+') AND   '+
                     '         (PP.IDPESSOA       = CP.IDPESSOA)    AND '+
                     '         (PP.IDPESSJUR      = CP.IDPESSJUR)   AND '+
                     '         (PP.IDPLANOPREV    = CP.IDPLANOPREV) AND '+
                     '         (EL.IDPESSOA       = PP.IDPESSOA)    AND '+
                     '         (EL.IDPESSJUR      = PP.IDPESSJUR)   AND '+
                     '         (PF.IDPESSOA       = EL.IDPESSOA)    AND '+
                     '         (PP.IDSITPART      = ST.IDSITPART)';
      end
      else begin
         if (sSitFundacao = 'MA') or (sSitFundacao = 'MP')   // Montar qry de regra para MANTIDOS
         then begin


            sFlgProvisorio := BuscaFlgProvisorio(dtmAPrev.qry, piNumProcesso);  // Gleyber - 26/03/2003

            if Trim(sDataRef)      = '' then sDataRef      := '          ';
            if Trim(sDataDemissao) = '' then sDataDemissao := '          ';
            if Trim(sDataInicio)   = '' then sDataInicio   := '          ';
            if Trim(sDataFinal)    = '' then sDataFinal    := '          ';
            sSQLRegra := ' SELECT  1 AS FLGCONCESSAO, CP.IDPESSJUR,      CP.IDPLANOPREV,  CP.IDPESSOA, '+
                         IntToStr(piOrigem)+ ' AS ORIGEM, '+ // CAMILLE - 28.01.2003            
                         '         CP.IDCONTRIBUICAO, CP.SEQPROPOSTA,   '+
                         '         CP.DIAVENCIMENTO,  CP.FLGDESCFOLHA, CP.VALORBASE1,                   '+
                         '         CP.VALORBASE2,     CP.VALORBASE3,   CP.FLGCOBRA,    '+
                         '         CP.QTDEPARCELAS,   CP.FLGRECALCULA, CP.FLGRETROATIVO,                '+
                         ''''+sDataFinalPdv+''' AS DATAFINALPDV,       '+
                         '         CP.DATAINICIO,     CP.DATAFINAL,    '+
                         '         EL.SALTOTAL,       EL.TEMPONAOCREDITADO, PF.DATANASC,  '+
                         '         PF.DATAMORTE,      EL.DATADEMISSAO, '+
                         '         PP.INSCRICAODATA,  EL.IDSITFUNC,         EL.TEMPOSERVANTERIOR, EL.DATAADMISSAO, '+
                         '         PP.DATAINICIOMANUT,      '+
                         '         PP.DTINICIOINSC, '+
                         '         PP.DATAINICIOMANUT, '+
                         OraNumero(sValorUltINSS)+' AS VLRINFINSS, '+ //cguedes - 09/07/2002
                         sPartReinsc +' AS PARTREINSC, '+
                    ''''+sFlgInternoAntes+''' AS FLGINTERNOANT,   '+
                    ''''+sFlgInternoAtual+''' AS FLGINTERNO,      '+
                    ''''+sIdSitPartAntes +''' AS IDSITPARTATUAL,  '+
                    ''''+sIdSitPlanAntes +''' AS IDSITPLANOATUAL, '+
                    ''''+sIdSitFuncAntes +''' AS IDSITFUNCATUAL,  '+
                    ''''+sIdSitPartAtual +''' AS IDSITPARTNOVO,   '+
                    ''''+sIdSitPlanAtual +''' AS IDSITPLANONOVO,  '+
                    ''''+sIdSitFuncAtual +''' AS IDSITFUNCNOVO,   '+
                     ''''+sMesReferencia+''' AS MESREFERENCIA, '+     // Gleyber - 26/03/2003
                     sFlgProvisorio + ' AS FLGPROVISORIO, '+          // Gleyber - 26/03/2003
                     ''''+sMesReferencia+''' AS ANOMESREF, '+
                     ''''+sDataRef+''' AS DATAREF, '+
                     ''''+sDataRenova+'''    AS DATARENOVA,    '+ // CAMILLE - 18.12.2002
                     ''''+sDataInicioOriginal+'''    AS DATAINICIOORIGINAL,    '+ { Augusto 31/01/2005 }
                     ''''+sSitFundacao+''''+' AS FLGINTERNO, '+
                     sIdSitPart+' AS IDSITPART,     '+
                     ''''+OraNumero(sIdParcelamento)+''' AS IDPARCELAMENTO, '+ // CAMILLE - 11.03.2004
                          OraNumero(sPercentual)    +'   AS PERCENTUAL ,    '+ // CAMILLE - 11.03.2004
                          OraNumero(sVlrDividaPart) +'   AS VLRDIVIDAPART,  '+ // CAMILLE - 11.03.2004
                          OraNumero(sVlrDividaPatro)+'   AS VLRDIVIDAPATRO, '+ // CAMILLE - 11.03.2004
                          OraNumero(sVlrPrestacao)  +'   AS VALORPRESTACAO, '+ // CAMILLE - 11.03.2004
                          OraNumero(sVlrSdoDevedor) +'   AS SDODEVEDOR,     '+ // CAMILLE - 11.03.2004
                     { Inicio Augusto 20/02/2003 }
                     //OraNumero(sValorUltBeneficio)   +' AS VALORATUAL, '+ // cguedes - 09/07/2002
                     OraNumero(FloatToStr(dValorBeneficioNoMovimento))+' AS VALORATUAL, '+ // cguedes - 09/07/2002
                     { Fim  Augusto 20/02/2003 }

                     OraNumero(FloatToStr(dValorBeneficioNoMovimento))+' AS VALORNOLOTE, '+// CAMILLE - 11.02.2003
                     OraNumero(FloatToStr(dValorINSSNoMovimento))+' AS INSSNOLOTE, '+// CAMILLE - 11.02.2003
                     sValorAssociado +' AS VALORASSOCIADO,  '+
                          sValorAssociadoNoMescob   +' AS VALORASSOCIADOCOB,  '+
                     sValorAssociado2+' AS VALORASSOCIADO2, '+
                     sValorAssociado3+' AS VALORASSOCIADO3, '+
                     sValorSalPart   +' AS VALORPROVENTO,   '+
                     OraNumero(sSalarioIntegral) +' AS SALARIOINTEGRAL, '+
                     sValorSalPart   +' AS SALPARTICIPACAO, '+
                     sValorRemTotal  +' AS VALORREMTOTAL,   '+
                     sValorRubParcial+' AS RUBPARCIAL, '+
                     sValorRubMantido+' AS RUBMANTIDO, '+
                     sValorSalMantido   +' AS SALMANTIDO, '+
                     OraNumero(sSalario13)+' AS SALARIO13, '+
                     QuotedStr(' ')+' AS DEBCRED, '+    // Gleyber - 15/01/2003
                     sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                     sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                     sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3 '+
                     ' , '''+sIdParcelamento+''' IDPARCELAMENTO, '+
                     { Augusto 29/01/2004 - Oranumero() }
                     Oranumero(sPercentual)    +' PERCENTUAL , '+
                     Oranumero(sVlrDividaPart) +' VLRDIVIDAPART,'+
                     Oranumero(sVlrDividaPatro)+' VLRDIVIDAPATRO '+ //leofuncef - 04122002

                     ',EL.FLGDIRETOR'+ { Augusto 16/01/2004 }

                     //leofuncef - 14092004
                     ' , '''+sDataPrevisaoRece+''' DATAPREVISAORECE, ''PRP'' IDDEPENDENCIA, '+
                     ' PF.SEXO, EL.TEMPOSERVTOTAL, EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
                     ' PF.IDPESSOA AS IDTITULAR, '+
                     //leofuncef - 14092004 - fim

                     { Inicio Augusto 15/09/2004 }
                     ''''+sDataInicio+''' AS DATAINICIO, '+
                     ''''+sDataFinal +''' AS DATAFINAL   '+
                     { Fim Augusto 15/09/2004 }

                         ' FROM    CONTRIBPREVPARTP CP,            '+
                         '         PARTPREVPLAN        PP,         '+
                         '         ELEGPATRO           EL,         '+
                         '         PESSOAFISICA        PF '+
                         ' WHERE   (CP.IDPESSJUR      = '+IntToStr(piIdPessJur)     +') AND '+
                         '         (CP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)   +') AND '+
                         '         (CP.IDPESSOA       = '+IntToStr(piIdPessoa)      +') AND '+
                         '         (CP.SEQPROPOSTA    = '+IntToStr(piSeqProposta)   +') AND '+
                         '         (CP.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+') AND '+
                         '         (CP.IDPESSOA = PP.IDPESSOA)   AND              '+
                         '         (CP.IDPESSJUR = PP.IDPESSJUR) AND              '+
                         '         (CP.IDPLANOPREV = PP.IDPLANOPREV) AND          '+
                         '         (PP.IDPESSOA = EL.IDPESSOA) AND                '+
                         '         (PP.IDPESSJUR = EL.IDPESSJUR) AND              '+
                         '         (EL.IDPESSOA = PF.IDPESSOA) ';
         end
         else begin
            if sSitFundacao = 'PT' // Montar qry da regra para PATROCINADORA
            then begin
               if Trim(sDataRef)      = '' then sDataRef      := '          ';
               if Trim(sDataDemissao) = '' then sDataDemissao := '          ';
               if Trim(sDataInicio)   = '' then sDataInicio   := '          ';
               if Trim(sDataFinal)    = '' then sDataFinal    := '          ';

               sSQLRegra := ' SELECT   SUM(H.VALORPROVENTO) AS VALORACUMULADO, CP.IDPESSOA, CP.IDPESSOA AS IDPESSJUR, CP.IDPLANOPREV, '+
                            '          CP.IDCONTRIBUICAO, CP.DIAVENCIMENTO, CP.VALORBASE1, CP.VALORBASE2, CP.VALORBASE3, '+
                            '          CP.DATAINICIO, CP.DATAFINAL, ''PT'' AS FLGINTERNO, '+
                            '          0 AS FLGDESCFOLHA, 1 AS SEQPROPOSTA, 1 AS FLGCONCESSAO, '+
                            '          CP.QTDEPARCELAS,    '+
                            IntToStr(piOrigem)+ ' AS ORIGEM, '+ // CAMILLE - 28.01.2003
                           OraNumero(sValorUltINSS)+' AS VLRINFINSS, '+ //cguedes - 09/07/2002
 //leoprovisorio - 04032005 - campo repetido -   OraNumero(sValorUltBeneficio)   +' AS VALORATUAL, '+ // cguedes - 09/07/2002                           { Inicio Augusto 20/02/2003 }
                           //OraNumero(sValorUltBeneficio)   +' AS VALORATUAL, '+ // cguedes - 09/07/2002
                           OraNumero(FloatToStr(dValorBeneficioNoMovimento))+' AS VALORATUAL, '+ // cguedes - 09/07/2002
                           { Fim  Augusto 20/02/2003 }
                           OraNumero(FloatToStr(dValorBeneficioNoMovimento))+' AS VALORNOLOTE, '+// CAMILLE - 11.02.2003
                           OraNumero(FloatToStr(dValorINSSNoMovimento))+' AS INSSNOLOTE, '+// CAMILLE - 11.02.2003
                           sValorAssociado+' AS VALORASSOCIADO, '+sValorAssociado2+' AS VALORASSOCIADO2, '+
                           sValorAssociado3+' AS VALORASSOCIADO3, '+
                           sValorAssociadoNoMescob   +' AS VALORASSOCIADOCOB,  '+
                                                ''''+sMesReferencia+''' AS ANOMESREF, '+

                           sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                           sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                           sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3 '+
                            ' , '''+sIdParcelamento+''' IDPARCELAMENTO, '+
                           { Augusto 29/01/2004 - Oranumero() }
                           Oranumero(sPercentual)    +' PERCENTUAL , '+
                           Oranumero(sVlrDividaPart) +' VLRDIVIDAPART,'+
                           Oranumero(sVlrDividaPatro)+' VLRDIVIDAPATRO '+ //leofuncef - 04122002
                            ' FROM     CONTRIBPREVPATRO    CP, HISTRUBSAL H, PATRO PT '+
                            ' WHERE    CP.IDPESSOA       =  '+IntToStr(piIdPessJur)     +
                            ' AND      CP.IDPLANOPREV    =  '+IntToStr(piIdPlanoPrev)   +
                            ' AND      CP.IDCONTRIBUICAO =  '+IntToStr(piIdContribuicao)+
                            ' AND      CP.IDPESSOA       = PT.IDPESSOA '+
                            ' AND      H.IDPESSJUR       = PT.IDPESSOA '+
                            ' AND      H.IDRUBRICA       = PT.IDRUBSALMANUT '+
                            ' AND      H.MES             = '''+sMesReferencia+''''+
                            ' GROUP BY CP.IDPESSOA, CP.IDPESSOA , CP.IDPLANOPREV,  '+
                            '          CP.IDCONTRIBUICAO, CP.DIAVENCIMENTO, CP.VALORBASE1, '+
                            '          CP.VALORBASE2, CP.VALORBASE3, CP.DATAINICIO, CP.DATAFINAL, '+
                            '          CP.QTDEPARCELAS ';
            end
            else begin // Montar qry da regra para ATIVOS e OUTROS

               // CGUEDES - 11/09/2002

               sValorUltBeneficio := CalcBeneficioAtual(piIdPessJur,piIdPlanoPrev,piIdPessoa,
                                                        sMesReferencia,sMesReferencia,sIDTPPAGTOANT,sFlgBenefMinimo,
                                                        sValorSrb,
                                                        dtmAPrev.qry, piNumProcesso );

               dValorBeneficioNoMovimento := CalcBeneficioDoMovimento( dtmAPrev.qry,
                                             piNumProcesso,
                                             piIdPessJur,
                                             piIdPlanoPrev,
                                             piIdPessoa,
                                             piIdPessoa,
                                             sMesReferencia,
                                             piIdLote,
                                             'S',
                                             'R');

              dValorINSSNoMovimento := CalcBeneficioDoMovimento( dtmAPrev.qry,
                                          piNumProcesso,
                                          piIdPessJur,
                                          piIdPlanoPrev,
                                          piIdPessoa,
                                          piIdPessoa,
                                          sMesReferencia,
                                          piIdLote,
                                          'I',
                                          'R');

               if Trim(sDataRef)      = '' then sDataRef      := '          ';
               if Trim(sDataDemissao) = '' then sDataDemissao := '          ';
               if Trim(sDataInicio)   = '' then sDataInicio   := '          ';
               if Trim(sDataFinal)    = '' then sDataFinal    := '          ';

               sFlgProvisorio := BuscaFlgProvisorio(dtmAPrev.qry, piNumProcesso);

               sSQLRegra := ' SELECT  1 AS FLGCONCESSAO, CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBUICAO, '+
                         IntToStr(piOrigem)+ ' AS ORIGEM, '+ // CAMILLE - 28.01.2003
                          '         CP.DIAVENCIMENTO, CP.FLGDESCFOLHA, CP.VALORBASE1,             '+
                          '         CP.VALORBASE2, CP.VALORBASE3, CP.FLGCOBRA,   '+
                          '         CP.QTDEPARCELAS, CP.FLGRECALCULA, CP.FLGRETROATIVO,           '+
                          '         EL.IDSITFUNC, EL.TEMPOSERVANTERIOR, '+
                          '         EL.DATAADMISSAO, '+
                          '         EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC, PF.SEXO, '+
                          '         PF.DATAMORTE, PP.SALPARTICIPACAO, '+
                          '         PP.INSCRICAODATA,   PP.DTINICIOINSC, PP.IDSITPART,   '+
                          '         CP.SEQPROPOSTA, '+
                          ''''+sFlgInternoAntes+''' AS FLGINTERNOANT,   '+
                          ''''+sFlgInternoAtual+''' AS FLGINTERNO,      '+
                          ''''+sIdSitPartAntes +''' AS IDSITPARTATUAL,  '+
                          ''''+sIdSitPlanAntes +''' AS IDSITPLANOATUAL, '+
                          ''''+sIdSitFuncAntes +''' AS IDSITFUNCATUAL,  '+
                          ''''+sIdSitPartAtual +''' AS IDSITPARTNOVO,   '+
                          ''''+sIdSitPlanAtual +''' AS IDSITPLANONOVO,  '+
                          ''''+sIdSitFuncAtual +''' AS IDSITFUNCNOVO,   '+
                          ''''+sDataRef+''' AS DATAREF, '+
                          ''''+sDataRenova+'''    AS DATARENOVA,    '+ // CAMILLE - 18.12.2002
                          ''''+sDataInicioOriginal+'''    AS DATAINICIOORIGINAL,    '+ { Augusto 31/01/2005 }
                          ''''+sSitFundacao+''''+' AS FLGINTERNO, '+
                         sPartReinsc      +' AS PARTREINSC, '+
                         sValorAssociado  +' AS VALORASSOCIADO, '+
                          sValorAssociadoNoMescob   +' AS VALORASSOCIADOCOB,  '+
                         sValorAssociado2 +' AS VALORASSOCIADO2, '+
                         sValorAssociado3 +' AS VALORASSOCIADO3, '+
                         sValorSalPart    +' AS VALORPROVENTO, '+
                         OraNumero(sValorUltINSS)+' AS VLRINFINSS, '+ //cguedes - 09/07/2002
                         OraNumero(sSalarioIntegral) +' AS SALARIOINTEGRAL, '+
                         sValorRemTotal   +' AS VALORREMTOTAL, '+
                          ''''+OraNumero(sIdParcelamento)+''' AS IDPARCELAMENTO, '+ // CAMILLE - 11.03.2004
                               OraNumero(sPercentual)    +'   AS PERCENTUAL ,    '+ // CAMILLE - 11.03.2004
                               OraNumero(sVlrDividaPart) +'   AS VLRDIVIDAPART,  '+ // CAMILLE - 11.03.2004
                               OraNumero(sVlrDividaPatro)+'   AS VLRDIVIDAPATRO, '+ // CAMILLE - 11.03.2004
                               OraNumero(sVlrPrestacao)  +'   AS VALORPRESTACAO, '+ // CAMILLE - 11.03.2004
                               OraNumero(sVlrSdoDevedor) +'   AS SDODEVEDOR,     '+ // CAMILLE - 11.03.2004

                         { Inicio Augusto 20/02/2003 }
                         //OraNumero(sValorUltBeneficio)+' AS VALORATUAL, '+ // cguedes - 09/07/2002
                         OraNumero(FloatToStr(dValorBeneficioNoMovimento))+' AS VALORATUAL, '+
                         { Fim  Augusto 20/02/2003 }
                         { Augusto 30/03/2003 }
                         OraNumero(FloatToStr(dValorBeneficioNoMovimento))+' AS VALORINTEGRAL, '+

                         OraNumero(FloatToStr(dValorBeneficioNoMovimento))+' AS VALORNOLOTE, '+// CAMILLE - 11.02.2003
                         OraNumero(FloatToStr(dValorINSSNoMovimento))+' AS INSSNOLOTE, '+// CAMILLE - 11.02.2003
                         ''''+sMesReferencia+''' AS MESREFERENCIA, '+
                         ''''+sMesReferencia+''' AS ANOMESREF, '+
                         sValorRubParcial +' AS RUBPARCIAL, '+
                         sValorRubMantido +' AS RUBMANTIDO, '+
                         OraNumero(sSalario13)+' AS SALARIO13, '+
                         sFlgProvisorio + ' AS FLGPROVISORIO, '+ // CGUEDES - 11/09/2002
                         Oranumero(sValorSrb)+' AS VALORSRB, '+ //LEOCM - 08102002
                        ' PP.DATAINICIOMANUT, '+
                         sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                         sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                         sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3 '+
                         ' , '''+sIdParcelamento+''' IDPARCELAMENTO, '+
                         { Augusto 29/01/2004 - Oranumero() }
                         Oranumero(sPercentual)    +' PERCENTUAL , '+
                         Oranumero(sVlrDividaPart) +' VLRDIVIDAPART,'+
                         Oranumero(sVlrDividaPatro)+' VLRDIVIDAPATRO '+ //leofuncef - 04122002
                         ',EL.FLGDIRETOR'+ { Augusto 16/01/2004 }

                         //leofuncef - 14092004
                         ' , '''+sDataPrevisaoRece+''' DATAPREVISAORECE, ''PRP'' IDDEPENDENCIA, '+
                         ' PF.SEXO, EL.TEMPOSERVTOTAL, EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
                         ' EL.IDPESSOA AS IDTITULAR, '+
                         //leofuncef - 14092004 - fim

                         { Inicio Augusto 15/09/2004 }
                         ''''+sDataInicio+''' AS DATAINICIO, '+
                         ''''+sDataFinal +''' AS DATAFINAL   '+
                         { Fim Augusto 15/09/2004 }


                          ' FROM    CONTRIBPREVPARTP    CP,         '+
                          '         PARTPREVPLAN        PP,         '+
                          '         ELEGPATRO           EL,         '+
                          '         PESSOAFISICA        PF         '+
                          ' WHERE   (CP.IDPESSJUR      = '+IntToStr(piIdPessJur)+') AND     '+
                          '         (CP.IDPLANOPREV    =  '+IntToStr(piIdPlanoPrev)+') AND '+
                          '         (CP.IDPESSOA       =  '+IntToStr(piIdPessoa)+') AND    '+
                          '         (CP.SEQPROPOSTA    =  '+IntToStr(piSeqProposta)+') AND '+
                          '         (CP.IDCONTRIBUICAO =  '+IntToStr(piIdContribuicao)+') AND '+
                          '         (CP.IDPESSJUR      = PP.IDPESSJUR) AND    '+
                          '         (CP.IDPLANOPREV    = PP.IDPLANOPREV) AND  '+
                          '         (CP.IDPESSOA       = PP.IDPESSOA) AND     '+
                          '         (CP.SEQPROPOSTA    = PP.SEQPROPOSTA) AND  '+
                          '         (PP.IDPESSJUR      = EL.IDPESSJUR) AND    '+
                          '         (PP.IDPESSOA       = EL.IDPESSOA) AND '+
                          '         (EL.IDPESSOA = PF.IDPESSOA) ';
            end; // else - if sSitFundacao = PT
         end; // else - if sSitFundacao = MA
      end;// else - if sSitFundacao = AS
   end;// else -if sTipoCalculo = U ou P
   Result :=  sSQLRegra;
end;//MontaSQLContribNOVA

function UltimaDataContrib(psDataFinal,psMesReferencia : string; piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,piIdContribuicao : integer): boolean;
var sSQL,
    sMesDataFinal : string;
begin
   Result := False;
   if piIdPessJur = piIdPessoa // contribuicao da patrocinadora
   then begin
      sSQL := ' SELECT DATAFINAL  '+
              ' FROM   CONTRIBPREVPATRO '+
              ' WHERE  IDPESSOA       = '+IntToStr(piIdPessJur)+'  AND '+
              '        IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
              '        IDPLANOPREV    = '+IntToStr(piIdPlanoPrev);

   end
   else begin
      sSQL := ' SELECT DATAFINAL  '+
              ' FROM   CONTRIBPREVPARTP '+
              ' WHERE  IDPESSOA       = '+IntToStr(piIdPessoa)+' AND '+
              '        SEQPROPOSTA    = '+IntToStr(piSeqProposta)+' AND '+
              '        IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+' AND '+
              '        IDPESSJUR      = '+IntToStr(piIdPessJur)+'  AND '+
              '        IDPLANOPREV    = '+IntToStr(piIdPlanoPrev);
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

   if Trim(pStrLotes) = '' then pStrLotes := '-1';
    
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
                  '       HST.IDPESSOA = HST.IDPESSOA  AND  '+ //leocbs  - 3001 - peformance
                  '       HST.FLGSITFUNDACAO = ''AT''   AND '+//leocbs - 2102 - não criticar mantidos
                  '       CP.FLGPAGADOR = ''C'' AND '+
                  '       CP.IDPLANOPREV    = HST.IDPLANOPREV AND   '+
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

// CAMILLE - SERPROS - 24.09.1999 (Acerto Meses)
function TestaPeriodicidade(pQtdeMeses, pUltMesPreparo, pMesCobranca : string): boolean;
var
  sData1, sData2: string;
  iDia, iMes, iAno: integer;
begin
  Result := False;
  // Se for vitalicio (qtdemeses = vazio)
  // Entao retorna true

  if (pQtdeMeses = '') or (StrToInt(pQtdeMeses) = 0)
  then Result := True
  else if StrToInt(pQtdeMeses) < 1
       then begin  // Pagamento unico
          if (pUltMesPreparo = '') or (pUltMesPreparo = '0000/00')
          then Result := True;
       end
       else begin     // se não for pagamento único
          //  Se ainda não foi efetivado nenhum pagamento
          if (pUltMesPreparo = '') or (pUltMesPreparo = '0000/00')
          then Result := True
          else begin  // testa se já foi efetivado o pagamento deste mês

             // teste se é pagto de sobre 13º, retorna true
             if Copy(pMesCobranca,6,2) = '13' then // CAMILLE - SERPROS - 24.09.1999 (Acerto Meses)
             begin
                Result := True;
                Exit;
             end;

             // teste se é pagto de sobre 13º, retorna true
             if Copy(pUltMesPreparo,6,2) = '13' then // CAMILLE - 19.01.2004
             begin
                Result := True;
                Exit;
             end;
             
             // sdata1 e sdata2 devem estar sem as barras, senao calcula errado
             // caso necessario usar funcao tirabarra
             sData1  := DataBrit(pUltMesPreparo + '/01');
             sData2  := DataBrit(pMesCobranca + '/01');// CAMILLE - SERPROS - 24.09.1999 (Acerto Meses)
             if CalculaData(sData1,sData2,iDia,iMes,iAno)
             then begin
                iMes := iMes + 12 * iAno;
                if (iMes mod StrToInt(pQtdeMeses)) = 0
                then Result := True;
             end;
          end;
       end;
end;

procedure  PreencheContribAssociada( iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta,
                                     iIdContribuicao : longint;
                                     var sAssoc1Op1, sAssoc2Op1, sAssoc3Op1,
                                         sAssoc1Op2, sAssoc2Op2, sAssoc3Op2,
                                         sAssoc1Op3, sAssoc2Op3, sAssoc3Op3 : string;
                                     qryAux : TwwQuery);
begin
   sAssoc1Op1 := '0';
   sAssoc2Op1 := '0';
   sAssoc3Op1 := '0';
   sAssoc1Op2 := '0';
   sAssoc2Op2 := '0';
   sAssoc3Op2 := '0';
   sAssoc1Op3 := '0';
   sAssoc2Op3 := '0';
   sAssoc3Op3 := '0';

   // preencher opcoes da 1a. contribuicao associada
   qryAux.Close;
   qryAux.SQl.Clear;
   qryAux.SQL.Add(' SELECT CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3 '+
                  ' FROM   CONTRIBPREVPARTP CPP, CONTPREV CP '+
                  ' WHERE  CPP.IDPESSOA    = '+IntToStr(iIdPessoa)+
                  ' AND    CPP.IDPESSJUR   = '+IntToStr(iIdPessJur)+
                  ' AND    CPP.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+
                  ' AND    CPP.SEQPROPOSTA = '+IntToStr(iSeqProposta)+
                  ' AND    CPP.IDCONTRIBUICAO = CP.IDCONTRIBPAI '+
                  ' AND    CP.IDPLANOPREV = CPP.IDPLANOPREV '+
                  ' AND    CP.IDCONTRIBUICAO = '+IntToStr(iIdContribuicao));
   qryAux.Open;
   if not qryAux.IsEmpty
   then begin
      if Trim(qryAux.FieldByName('ValorBase1').AsString) <> ''
      then sAssoc1Op1 := Trim(qryAux.FieldByName('ValorBase1').AsString);

      if Trim(qryAux.FieldByName('ValorBase2').AsString) <> ''
      then sAssoc2Op1 := Trim(qryAux.FieldByName('ValorBase2').AsString);

      if Trim(qryAux.FieldByName('ValorBase3').AsString) <> ''
      then sAssoc3Op1 := Trim(qryAux.FieldByName('ValorBase3').AsString);
   end;

   // preencher opcoes da 2a. contribuicao associada
   qryAux.Close;
   qryAux.SQl.Clear;
   qryAux.SQL.Add(' SELECT CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3 '+
                  ' FROM   CONTRIBPREVPARTP CPP, CONTPREV CP '+
                  ' WHERE  CPP.IDPESSOA    = '+IntToStr(iIdPessoa)+
                  ' AND    CPP.IDPESSJUR   = '+IntToStr(iIdPessJur)+
                  ' AND    CPP.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+
                  ' AND    CPP.SEQPROPOSTA = '+IntToStr(iSeqProposta)+
                  ' AND    CPP.IDCONTRIBUICAO = CP.IDCONTRIBPAI2 '+
                  ' AND    CP.IDPLANOPREV = CPP.IDPLANOPREV '+
                  ' AND    CP.IDCONTRIBUICAO = '+IntToStr(iIdContribuicao));
   qryAux.Open;
   if not qryAux.IsEmpty
   then begin
      if Trim(qryAux.FieldByName('ValorBase1').AsString) <> ''
      then sAssoc1Op2 := Trim(qryAux.FieldByName('ValorBase1').AsString);

      if Trim(qryAux.FieldByName('ValorBase2').AsString) <> ''
      then sAssoc2Op2 := Trim(qryAux.FieldByName('ValorBase2').AsString);

      if Trim(qryAux.FieldByName('ValorBase3').AsString) <> ''
      then sAssoc3Op2 := Trim(qryAux.FieldByName('ValorBase3').AsString);
   end;

   // preencher opcoes da 3a. contribuicao associada
   qryAux.Close;
   qryAux.SQl.Clear;
   qryAux.SQL.Add(' SELECT CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3 '+
                  ' FROM   CONTRIBPREVPARTP CPP, CONTPREV CP '+
                  ' WHERE  CPP.IDPESSOA    = '+IntToStr(iIdPessoa)+
                  ' AND    CPP.IDPESSJUR   = '+IntToStr(iIdPessJur)+
                  ' AND    CPP.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+
                  ' AND    CPP.SEQPROPOSTA = '+IntToStr(iSeqProposta)+
                  ' AND    CPP.IDCONTRIBUICAO = CP.IDCONTRIBPAI3 '+
                  ' AND    CP.IDPLANOPREV = CPP.IDPLANOPREV '+
                  ' AND    CP.IDCONTRIBUICAO = '+IntToStr(iIdContribuicao));
   qryAux.Open;
   if not qryAux.IsEmpty
   then begin
      if Trim(qryAux.FieldByName('ValorBase1').AsString) <> ''
      then sAssoc1Op3 := Trim(qryAux.FieldByName('ValorBase1').AsString);

      if Trim(qryAux.FieldByName('ValorBase2').AsString) <> ''
      then sAssoc2Op3 := Trim(qryAux.FieldByName('ValorBase2').AsString);

      if Trim(qryAux.FieldByName('ValorBase3').AsString) <> ''
      then sAssoc3Op3 := Trim(qryAux.FieldByName('ValorBase3').AsString);
   end;

   qryAux.Close;

end;


function MostraDetalhesContribuicao( iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : longInt;
                                     psTitulo,
                                     psNomeEvento,
                                     psFlgIntEvento,
                                     psBeneficioPretendido : string;
                                     psDataRef, psDataFim  : string;
                                     qryAux            : TwwQuery) : boolean;
var sNomeOp1, sNomeOp2, sNomeOp3, sMes , sNumRecebimento: string;
    bPossuiOpcoes : boolean;
    sSalario,
    sMsgErro,
    sAnoMesRef,
    sSitFundacao,
    sUltimoSalario,
    sSalarioAt,
    sSalarioIntegral,
    sSalParticipacao,
    sSalManutencao,
    sAnoMes5anos,
    sDescHistorico,
    sIdSitPart,
    sSQL, sLinha    : string;
    dData5anos      : TDateTime;
    iIdContribuicao : longint;
    strAux          : string;
    iControle       : word; // CAMILLE - 01.10.2003
    dTotalACobrar   : double; // CAMILLE - 01.10.2003
    dTotalAlterador : double; // CAMILLE - 01.10.2003
    dTotalNoMes     : double; // CAMILLE - 13.07.2004

    sSitFundacaoaux ,  sFlgCobraAux : String;
begin
   Result := False;
   frmMostraAux.Caption := psTitulo;
   frmMostraAux.memResult.Lines.Clear;

   // calcular mes de 5 anos atras para nao consultar o historico inteiro
   dData5Anos   := (date - (5 * 365));
   //sAnoMes5Anos := Copy(DateToStr(dData5Anos),7,4)+'/'+Copy(DateToStr(dData5Anos),4,2); //ClaudioR - 19962 - 16/08/2007
   sAnoMes5Anos := Copy(FormatDateTime('dd/mm/yyyy', dData5Anos),7,4) + '/' +             //ClaudioR - 19962 - 16/08/2007
                   Copy(FormatDateTime('dd/mm/yyyy', dData5Anos),4,2);                    //ClaudioR - 19962 - 16/08/2007

   // Verificar se existem opcoes do elegivel na patrocinadora
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT NUMOPCOES, NOMEVALORBASE1, NOMEVALORBASE2, NOMEVALORBASE3 '+
                  ' FROM PATRO '+
                  ' WHERE IDPESSOA = ' +IntToStr(iIdpessjur));
   qryAux.Open;
   if (qryAux.IsEmpty) or
      (qryAux.FieldByName('NumOpcoes').AsString = '') or
      (qryAux.FieldByName('NumOpcoes').AsInteger <= 0)
   then begin
      bPossuiOpcoes := False;
      sNomeOp1      := '';
      sNomeOp2      := '';
      sNomeOp3      := '';
   end
   else begin
      bPossuiOpcoes := True;
      sNomeOp1      := qryAux.FieldByName('NomeValorBase1').AsString;
      sNomeOp2      := qryAux.FieldByName('NomeValorBase2').AsString;
      sNomeOp3      := qryAux.FieldByName('NomeValorBase3').AsString;
   end;

   // Alexandre - 03/11/2000 - CM - Inicio
   // Inclusão de dois campos Patrocinadora e Plano
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT EL.VALORBASE1, EL.VALORBASE2, EL.VALORBASE3, EL.MATRICULA, P.NOME, '+
                  ' EL.VALORBASE4, EL.VALORBASE5, EL.VALORBASE6,  '+  //leocm - 13112002
                  ' PF.DATANASC, EL.DATAADMISSAO, EL.DATADEMISSAO, PP.DTINICIOINSC, PP.INSCRICAODATA,'+
                  ' EL.TEMPOSERVANTERIOR, SP.FLGINTERNO, PP.SALPARTICIPACAO, PP.SALMANTIDO,'+
                  ' EL.NIVEL, EL.IDCARGOEXT, PP.INSCRICAONUMERO, PF.SEXO,'+
                  ' PF.DATAMORTE, PF.FLGISENTOIRRF, PP.SEQPROPOSTA, PP.IDSITPART,'+
                  ' PP.DATAINICIOMANUT, PP.DATACANCELAMENTO, PJ.NOME AS PATROCINADORA, PL.NOME AS PLANO, '+
                  ' CE.CODIGO, CE.TITULO '+ { Augusto 05/01/2004 }
                  ' FROM   PESSOA PJ, PESSOA P, ELEGPATRO EL, PARTPREVPLAN PP, '+
                  '        PESSOAFISICA PF, SITPART SP, PLANPREV PL, CARGOEXT CE '+ { Augusto 05/01/2004 }
                  ' WHERE  EL.IDPESSOA  = '+IntToStr(iIdPessoa)+
                  ' AND    EL.IDPESSJUR = '+IntToSTr(iIdPessJur)+
                  ' AND    EL.IDPESSOA  = P.IDPESSOA'+
                  ' AND    EL.IDPESSJUR = PJ.IDPESSOA'+
                  ' AND    PF.IDPESSOA  = EL.IDPESSOA'+
                  ' AND    PP.IDPESSOA  = EL.IDPESSOA'+
                  ' AND    PP.IDPESSJUR = EL.IDPESSJUR'+
                  ' AND    PP.FLGDESATIVADO = 0'+
                  ' AND    PP.IDSITPART = SP.IDSITPART '+
                  ' AND    EL.IDCARGOEXT = CE.IDCARGOEXT(+) '+ { Augusto 14/01/2004 }
                  ' AND    PP.IDPLANOPREV = PL.IDPLANOPREV ');
   qryAux.Open;
   // Gleyber - 27/08/2002
   // Demonstrativo refeito - Largura da impressão é de 100 caracteres

// 1ª Seção

   sIdSitPart   := qryAux.FieldByName('IDSITPART').AsString;

   frmMostraAux.memResult.Lines.Add(Replicate('-',100));
   strAux := 'DEMONSTRATIVO DO EVENTO DE '+ UpperCase(psNomeEvento);
   sLinha:=Replicate(' ',(100-Length(Trim(strAux))) div 2) + strAux;
   frmMostraAux.memResult.Lines.Add(sLinha);

   strAux := 'VERSÃO : '+Trim(Sistema.Versao);
   sLinha := Replicate(' ',70) + Trim(strAux);
   frmMostraAux.memResult.Lines.Add(sLinha);

   // Gleyber - 30/08/2004 - Pendência 17447
   //frmMostraAux.memResult.Lines.Add(PreparaStr('USUÁRIO : '+Sistema.NomeUsuario, 70)+'DATA DO REGISTRO : '+psDataRef);
   //frmMostraAux.memResult.Lines.Add(PreparaStr('USUÁRIO : '+Sistema.NomeUsuario, 70)+'DATA DO REGISTRO : '+ DateToStr(date) ); //ClaudioR - 19962 - 16/08/2007
   frmMostraAux.memResult.Lines.Add(PreparaStr('USUÁRIO : ' + Sistema.NomeUsuario, 70) +                     //ClaudioR - 19962 - 16/08/2007
                                               'DATA DO REGISTRO : '+ FormatDateTime('dd/mm/yyyy', date) );  //ClaudioR - 19962 - 16/08/2007
   frmMostraAux.memResult.Lines.Add(Replicate('-',100));

   frmMostraAux.memResult.Lines.Add('Participante       : '+Trim(qryAux.FieldByName('Nome').AsString));

   { Augusto 05/01/2005 }
   //frmMostraAux.memResult.Lines.Add(' ');
   sLinha := PreparaStr(' Matricula          : ' + Trim(qryAux.FieldByName('MATRICULA').AsString),50);
   frmMostraAux.memResult.Lines.Add(sLinha);

   sLinha:= PreparaStr('Data de Nascimento : '+qryAux.FieldByName('DataNasc').AsString,50)+
           ' Data do Falecimento: '+qryAux.FieldByName('DataMorte').AsString;
   frmMostraAux.memResult.Lines.Add(sLinha);

   If Trim(qryAux.FieldByName('SEXO').AsString) = 'M' // Gleyber - 18/10/2002
    Then sLinha:= PreparaStr('Sexo               : MASCULINO',50)
    Else sLinha:= PreparaStr('Sexo               : FEMININO ',50);

   If qryAux.FieldByName('FLGISENTOIRRF').AsInteger = 0
      then sLinha := sLinha + ' Isento de Imposto de Renda : NÃO '
      else sLinha := sLinha + ' Isento de Imposto de Renda : SIM ';
   frmMostraAux.memResult.Lines.Add(sLinha);

   frmMostraAux.memResult.Lines.Add(Replicate('-',100));
// 2ª Seção

   { Augusto 05/01/2005 }
   sLinha := PreparaStr('Patrocinadora      : ' +Trim(qryAux.FieldByName('PATROCINADORA').AsString),51)+
             'Data Admissão  : ' + Trim(qryAux.FieldByName('DataAdmissao').AsString);
             //+ ' Matricula : ' + Trim(qryAux.FieldByName('MATRICULA').AsString) { Augusto 05/01/2005 }
   frmMostraAux.memResult.Lines.Add(sLinha);

   if ( (psFlgIntEvento = 'DP') or (psFlgIntEvento = 'DC') or (psFlgIntEvento = 'DM') or
        (psFlgIntEvento = 'DS') or (psFlgIntEvento = 'DA') or (psFlgIntEvento = 'PD') or
        (psFlgIntEvento = 'TS') or (psFlgIntEvento = 'ID') or  (psFlgIntEvento = 'IN') )
   then begin
        { Augusto 05/01/2005 }
        //sLinha:= PreparaStr('Data Admissão      : ' + Trim(qryAux.FieldByName('DataAdmissao').AsString), 50) +
        //        ' Data Inscrição : ' + qryAux.FieldByName('DtInicioInsc').AsString;
        sLinha:= PreparaStr('Plano Previdenc.   : ' + Trim(qryAux.FieldByName('PLANO').AsString), 50) +
                            ' Data Inscrição : ' + qryAux.FieldByName('DtInicioInsc').AsString;

        frmMostraAux.memResult.Lines.Add(sLinha);


        sLinha:= PreparaStr('Data Demissão      : ' + Trim(qryAux.FieldByName('DataDemissao').AsString), 50);
        frmMostraAux.memResult.Lines.Add(sLinha);
   end

   else begin
        { Augusto 05/01/2005 }
        //sLinha:= PreparaStr('Data Admissão      : ' + Trim(qryAux.FieldByName('DataAdmissao').AsString), 50) +
        //        ' Data Inscrição : ' + qryAux.FieldByName('DtInicioInsc').AsString;
        sLinha:= PreparaStr('Plano Previdenc.   : ' + Trim(qryAux.FieldByName('PLANO').AsString), 50) +
                            ' Data Inscrição : ' + qryAux.FieldByName('DtInicioInsc').AsString;

        frmMostraAux.memResult.Lines.Add(sLinha);
   end;
   frmMostraAux.memResult.Lines.Add(' ');

   { Inicio Augusto 05/01/2005 }
   sLinha := PreparaStr('Cargo              : ' + Trim(qryAux.FieldByName('CODIGO').AsString+ ' - ' +
                                                       Copy(qryAux.FieldByName('TITULO').AsString,1,30)), 50)+
             ' Nível : ' + Trim(qryAux.FieldByName('NIVEL').AsString);
   frmMostraAux.memResult.Lines.Add(sLinha);

   sSQL := ' SELECT '+
           '   FUNCAO.CODIGO AS CODIGOFUNC, FUNCAO.TITULO AS TITULOFUNC,  FUNCAO.PERCFUNCAO, '+
           '   FUNCAOFA.CODIGO AS CODIGOFUNCFA, FUNCAOFA.TITULO AS TITULOFUNCFA,  FUNCAO.PERCFUNCAO AS PERCFUNCAOFA, '+
           '  ATS.PERCATS,                                             '+
           '  ADIC.IDFUNCAO IDFUNCAOADIC, ADIC.TITULO AS TITADIC, ADIC.PERC1AC ,  '+
           '  INSALUB.PERCINSALUB, PERICUL.PERCPERICUL                 '+
           ' FROM   '+
           '/*FUNÇÃO ATUAL*/                            '+
           '  (SELECT * FROM EVOLFUNCPREV EV,           '+
           '                 CARGOEXT CE                '+
           '   WHERE IDPESSOA = '+IntToStr(iIdPessoa)+
           '   AND DATAFINAL IS NULL                    '+
           '   AND IDFUNCAO IS NOT NULL                 '+
           '   AND PERCFUNCAO IS NOT NULL               '+
           '   AND EV.IDFUNCAO = CE.IDCARGOEXT          '+
           '   AND EV.MODOFUNCAO <> ''FA'' )    FUNCAO, '+

           '/*FUNÇÃO FACULTATIVO*/                      '+
           '  (SELECT * FROM EVOLFUNCPREV EV,           '+
           '                 CARGOEXT CE                '+
           '   WHERE IDPESSOA = '+IntToStr(iIdPessoa)+
           '   AND DATAFINAL IS NULL                    '+
           '   AND IDFUNCAO IS NOT NULL                 '+
           '   AND PERCFUNCAO IS NOT NULL               '+
           '   AND EV.IDFUNCAO = CE.IDCARGOEXT          '+
           '   AND EV.MODOFUNCAO = ''FA'' )   FUNCAOFA, '+

           '/*ATS*/                         '+
           '  (SELECT * FROM EVOLFUNCPREV E '+
           '   WHERE IDPESSOA = '+IntToStr(iIdPessoa)+
           '   AND DATAFINAL IS NULL        '+
           '   AND NVL(PERCATS,0) >0        '+
           '   AND SEQHISTFUNC = (SELECT MAX(SEQHISTFUNC) FROM EVOLFUNCPREV   '+
           '                      WHERE IDPESSOA = E.IDPESSOA AND             '+
           '                      IDPESSJUR = E.IDPESSJUR AND                 '+
           '                      NVL(PERCATS,0) >0)) ATS,                    '+

           '/*ADIC. COMPENSAT.*/                     '+
           '  (SELECT * FROM EVOLFUNCPREV E,         '+
           '                CARGOEXT CE              '+
           '   WHERE IDPESSOA = '+IntToStr(iIdPessoa)+
           '   AND DATAFINAL IS NULL                 '+
           '   AND NVL(PERC1AC,0) > 0                '+
           '   AND E.IDFUNCAO = CE.IDCARGOEXT) ADIC, '+

           '/*INSALUBRIDADE*/                      '+
           '  (SELECT * FROM EVOLFUNCPREV E        '+
           '   WHERE IDPESSOA = '+IntToStr(iIdPessoa)+
           '   AND DATAFINAL IS NULL               '+
           '   AND NVL(PERCINSALUB,0) >0) INSALUB, '+

           '/*PERICULOSIDADE*/                    '+
           '  (SELECT * FROM EVOLFUNCPREV E       '+
           '   WHERE IDPESSOA =  '+IntToStr(iIdPessoa)+
           '   AND DATAFINAL IS NULL              '+
           '   AND NVL(PERCPERICUL,0) >0) PERICUL '+

           'WHERE '+
           ' ATS.IDPESSOA(+)      = FUNCAO.IDPESSOA AND  '+
           ' FUNCAOFA.IDPESSOA(+) = FUNCAO.IDPESSOA AND  '+
           ' ADIC.IDPESSOA(+)     = FUNCAO.IDPESSOA AND  '+
           ' INSALUB.IDPESSOA(+)  = FUNCAO.IDPESSOA AND  '+
           ' PERICUL.IDPESSOA(+)  = FUNCAO.IDPESSOA      ';

    If FazQuery(dtmAPrev.qryAux,sSQL) Then Begin
     sLinha := PreparaStr('Percentual ATS     : ' + Trim(dtmAPrev.qryAux.FieldByName('PERCATS').AsString),51)+
               'Tempo Serv.Anterior : ' + qryAux.FieldByName('TempoServAnterior').AsString;
     frmMostraAux.memResult.Lines.Add(sLinha);

     sLinha := 'Função/Cargo Comissionado Atual : ' + Trim(dtmAPrev.qryAux.FieldByName('CODIGOFUNC').AsString)+' - '+
               Trim(dtmAPrev.qryAux.FieldByName('TITULOFUNC').AsString);
     frmMostraAux.memResult.Lines.Add(sLinha);


     sLinha := 'Função/Cargo Comissionado Facultativo : ' + Trim(dtmAPrev.qryAux.FieldByName('CODIGOFUNCFA').AsString)+' - '+
               Trim(dtmAPrev.qryAux.FieldByName('TITULOFUNCFA').AsString);
     frmMostraAux.memResult.Lines.Add(sLinha);


     sLinha := PreparaStr('Adicional Compensatório : ' + Trim(dtmAPrev.qryAux.FieldByName('IDFUNCAOADIC').AsString),51)+
               'Percentual :' + dtmAPrev.qryAux.FieldByName('PERC1AC').AsString;
     frmMostraAux.memResult.Lines.Add(sLinha);

     sLinha := PreparaStr('Minutos Adicional Noturno : ' ,51);
     frmMostraAux.memResult.Lines.Add(sLinha);

     sLinha := PreparaStr('Percentual Adic. Insalubridade : '+ Trim(dtmAPrev.qryAux.FieldByName('PERCINSALUB').AsString),51)+
                          'Percentual Adic. Periculosidade : ' + dtmAPrev.qryAux.FieldByName('PERCPERICUL').AsString;
     frmMostraAux.memResult.Lines.Add(sLinha);

   End;


   //sLinha := 'Tempo Serv.Anterior: ' + qryAux.FieldByName('TempoServAnterior').AsString;
   //frmMostraAux.memResult.Lines.Add(sLinha);


   { Fim Augusto 05/01/2005 }
   frmMostraAux.memResult.Lines.Add(' ');


   { Augusto 05/01/2005 }
   //sLinha := 'Plano Previdenc.   : ' + Trim(qryAux.FieldByName('PLANO').AsString);
   //frmMostraAux.memResult.Lines.Add(sLinha);

   sLinha := 'Número Inscrição   : ' + Trim(qryAux.FieldByName('INSCRICAONUMERO').AsString);
   frmMostraAux.memResult.Lines.Add(sLinha);

   // Se o participante for reinscrito mostrar a data da reinscricao
   if Trim(qryAux.FieldByName('InscricaoData').AsString) <>
      Trim(qryAux.FieldByName('DtInicioInsc').AsString)
   then begin
        sLinha := PreparaStr('Reinscrição        : ' + Trim(qryAux.FieldByName('InscricaoData').AsString), 50)+
                  ' Data Desligamento: ' + qryAux.FieldByName('DataCancelamento').AsString;
        frmMostraAux.memResult.Lines.Add(sLinha);
   end;

   sLinha := PreparaStr('Início Manutenção  : ' + Trim(qryAux.FieldByName('DATAINICIOMANUT').AsString), 50);


   sSitFundacao := qryAux.FieldByName('flginterno').AsString;
   if (qryAux.FieldByName('flginterno').AsString = 'MP')
   then begin
        sSalParticipacao := '0';
        sSalManutencao   := '0';

        if (qryAux.FieldByName('SALPARTICIPACAO').AsString <> '')
        then sSalParticipacao := qryAux.FieldByName('SALPARTICIPACAO').AsString;

        if (qryAux.FieldByName('SALMANTIDO').AsString <> '')
        then sSalManutencao   := qryAux.FieldByName('SALMANTIDO').AsString;


        //leofuncef - 21102004
        sLinha := sLinha + 'Salário de Participação (Ativo): R$ '+ FormatFloat('#0.00', StrToFloat(sSalParticipacao));
        frmMostraAux.memResult.Lines.Add(sLinha);

        sLinha := 'Salário de Manutenção (Parcial): R$ '+ FormatFloat('#0.00', StrToFloat(sSalManutencao));
        //leofuncef - 21102004 - fim
   end
   else
      if (qryAux.FieldByName('flginterno').AsString = 'MA')
      then begin

         if Trim(qryAux.FieldByName('SALMANTIDO').AsString) <> ''
         then sLinha := sLinha + ' Salário de Manutenção          : R$ '+ FormatFloat('#0.00', qryAux.FieldByName('SALMANTIDO').AsFloat)
         else sLinha := sLinha + ' Salário de Manutenção          : R$ 0.00';
         sSalParticipacao := OraNumero(qryAux.FieldByName('SALMANTIDO').AsString);
      end
      else begin
              if Trim(qryAux.FieldByName('SALPARTICIPACAO').AsString) <> ''
              then sLinha := sLinha + ' Salário de Participação        : R$ '+ FormatFloat('#0.00', qryAux.FieldByName('SALPARTICIPACAO').AsFloat)
              else sLinha := sLinha + ' Salário de Participação        : R$ 0.00';
              sSalParticipacao := OraNumero(qryAux.FieldByName('SALPARTICIPACAO').AsString);
           end;

   frmMostraAux.memResult.Lines.Add(sLinha);

   frmMostraAux.memResult.Lines.Add(Replicate('-',100));

   if (Trim(psNomeEvento) <> '') and (Trim(psDataRef) <> '')
   then begin

      sLinha := PreparaStr('Evento             : '+ psNomeEvento, 50) + ' Data do Evento : '+ psDataRef;
      { Inicio Augusto - 19/11/2002 }
      If psDataFim <> '' Then Begin
        sLinha := sLinha + ' e Data Final : '+ psDataFim;
      End;
      { Fim Augusto - 19/11/2002 }
      frmMostraAux.memResult.Lines.Add(sLinha);

      // Se o evento for de Manutencao ( menos Parcial ) informar o Beneficio Pretendido
      if (psFlgIntEvento = 'DM') or (psFlgIntEvento = 'PD')
      then begin
           sLinha := 'Benefício Pretendido: '+ psBeneficioPretendido;
           frmMostraAux.memResult.Lines.Add(sLinha);
      end;
   end;

// 3ª Seção

   // Exibir opcoes do elegivel na patrocinadora
   if bPossuiOpcoes
   then begin
      frmMostraAux.memResult.Lines.Add(Replicate('-',100));
      frmMostraAux.memResult.Lines.Add('OPÇÕES NA PATROCINADORA : ');
      frmMostraAux.memResult.Lines.Add(Replicate('-',100));
      if (Trim(sNomeOp1) <> '') and (Trim(qryAux.FieldByName('ValorBase1').AsString) <> '')
      then frmMostraAux.memResult.Lines.Add('   '+PreparaStr(sNomeOp1,30)+' : '+qryAux.FieldByName('ValorBase1').AsString);
      if (Trim(sNomeOp2) <> '') and (Trim(qryAux.FieldByName('ValorBase2').AsString) <> '')
      then frmMostraAux.memResult.Lines.Add('   '+PreparaStr(sNomeOp2,30)+' : '+qryAux.FieldByName('ValorBase2').AsString);
      if (Trim(sNomeOp3) <> '') and (Trim(qryAux.FieldByName('ValorBase3').AsString) <> '')
      then frmMostraAux.memResult.Lines.Add('   '+PreparaStr(sNomeOp3,30)+' : '+qryAux.FieldByName('ValorBase3').AsString);
   end;

   // Verificar opcoes por contribuicao do plano
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT CP.NUMOPCOES, '+
                  '        DECODE(CP.NOMEVALORBASE1, NULL, ''Opção 1'', CP.NOMEVALORBASE1) AS NOMEVALORBASE1, '+
                  '        DECODE(CP.NOMEVALORBASE2, NULL, ''Opção 2'', CP.NOMEVALORBASE2) AS NOMEVALORBASE2, '+
                  '        DECODE(CP.NOMEVALORBASE3, NULL, ''Opção 3'', CP.NOMEVALORBASE3) AS NOMEVALORBASE3, '+
                  '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, C.NOME, C.IDCONTRIBUICAO, '+
                  '        TP.NOME AS PERIODICIDADE , CPP.QTDEPARCELAS '+
                  ' FROM   CONTPREV CP, CONTRIBPREVPARTP CPP, CONTRIBUICAO C, TPPERIODICIDADE TP '+
                  ' WHERE  (CPP.IDPESSOA       = '+IntToStr(iIdPessoa)+')'+
                  ' AND    (CPP.IDPESSJUR      = '+IntToStr(iIdPessJur)+')'+
                  ' AND    (CPP.IDPLANOPREV    = '+InttoStr(iIdPlanoPrev)+')'+
                  ' AND    (CPP.SEQPROPOSTA    = '+IntToStr(iSeqProposta)+')'+
                  ' AND    (CPP.FLGCOBRA       = 1 '+')'+
                  ' AND    (CPP.IDPLANOPREV    = CP.IDPLANOPREV '+')'+
                  ' AND    (CPP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO '+')'+
                  ' AND    (CPP.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+)'+')'+
                  ' AND    (CP.IDCONTRIBUICAO  = C.IDCONTRIBUICAO )');
   qryAux.Open;


// 4ª Seção
   // Exibir opcoes por contribuicao por plano
   if (not qryAux.IsEmpty)
   then begin
      frmMostraAux.memResult.Lines.Add(Replicate('-',100));
      frmMostraAux.memResult.Lines.Add('OPÇÕES DAS CONTRIBUIÇÕES NO PLANO : ');
      frmMostraAux.memResult.Lines.Add(Replicate('-',100));
      frmMostraAux.memResult.Lines.Add('   CONTRIBUIÇÃO                                            OPÇÕES');
      frmMostraAux.memResult.Lines.Add('   '+Replicate('-',97));
      strAux := '';
      while not qryAux.Eof do
      begin
         iIdContribuicao := qryAux.FieldbyName('IdContribuicao').AsInteger;
         sLinha := '';
         sLinha := '   '+PreparaStr(Copy(qryAux.FieldByName('Nome').AsString,1,55), 55);
         sLinha := sLinha + ' ';

         if (qryAux.FieldbyName('NumOpcoes').AsInteger < 1)
         then begin
            qryAux.Next;
            frmMostraAux.memResult.Lines.Add(sLinha);
            Continue;
         end;

         If Length(qryAux.FieldbyName('NomeValorBase1').AsString)  > 45
         Then sNomeOp1 := Copy(qryAux.FieldbyName('NomeValorBase1').AsString,1,45)
         Else If LowerCase(qryAux.FieldbyName('NomeValorBase1').AsString) <> 'opção 1'
              Then sNomeOp1 := qryAux.FieldbyName('NomeValorBase1').AsString
              Else sNomeOp1 := '';

         If Length(qryAux.FieldbyName('NomeValorBase2').AsString)  > 45
         Then sNomeOp2 := Copy(qryAux.FieldbyName('NomeValorBase2').AsString,1,45)
         Else If LowerCase(qryAux.FieldbyName('NomeValorBase2').AsString) <> 'opção 2'
              Then sNomeOp2 := qryAux.FieldbyName('NomeValorBase2').AsString
              Else sNomeOp2 := '';

         If Length(qryAux.FieldbyName('NomeValorBase3').AsString)  > 45
         Then sNomeOp3 := Copy(qryAux.FieldbyName('NomeValorBase3').AsString,1,45)
         Else If LowerCase(qryAux.FieldbyName('NomeValorBase3').AsString) <> 'opção 3'
              Then sNomeOp3 := qryAux.FieldbyName('NomeValorBase3').AsString
              Else sNomeOp3 := '';

         if (Trim(sNomeOp1) <> '') and (Trim(qryAux.FieldByName('ValorBase1').AsString) <> '')
         then frmMostraAux.memResult.Lines.Add(sLinha + sNomeOp1+ ': '+qryAux.FieldByName('ValorBase1').AsString);

         if (Trim(sNomeOp2) <> '') and (Trim(qryAux.FieldByName('ValorBase2').AsString) <> '')
         then frmMostraAux.memResult.Lines.Add(Replicate(' ',56) + sNomeOp2+': '+qryAux.FieldByName('ValorBase2').AsString);

         if (Trim(sNomeOp3) <> '') and (Trim(qryAux.FieldByName('ValorBase3').AsString) <> '')
         then frmMostraAux.memResult.Lines.Add(Replicate(' ',56) + sNomeOp3+': '+qryAux.FieldByName('ValorBase3').AsString);
         qryAux.Next;
      end;
   end;

   // Exibir valores de contribuicoes do historico
   if Trim(psDataRef) <> ''
   then begin
      sAnoMesRef := Copy(psDataRef,7,4)+'/'+Copy(psDataRef,4,2);
      sDescHistorico := '';
   end
   else begin
      sAnoMesRef := sAnoMes5Anos;
      sDescHistorico := 'Histórico excedeu a 5 anos e será demonstrado apenas a partir de '+sAnoMesRef+' ...';
   end;


   //leofuncef - 30092004 - tratamento para o evento de retorno de mantido para ativo
   //caso seja um evento de retorno de mantido para ativo,
   //ocorrem os acertos de contribuições que neste ponto estão com o FLGCOBRA = 0 ,
   //as inserções na HSTCONTRIBPREV não ocorreram com o flgsitfundacao atual e sim o 'MA'
   sSitFundacaoaux := sSitFundacao;
   sFlgCobraAux  := '1';
   if psFlgIntEvento ='RA' then
   begin
      sSitFundacaoaux := 'MA';
      sFlgCobraAux := ' CPP.FLGCOBRA ';
   end;
   //leofuncef - 30092004



   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT C.IDCONTRIBUICAO,C.NOME, H.MESREFERENCIA, H.VALORESPERADO, HA.VALOR, TA.DESCRICAO , HA.NUMRECEBIMENTO '+
                  ' FROM   CONTRIBUICAO C, CONTRIBPREVPARTP CPP, HSTCONTRIBPREV H , HSTATRASOCONTRIB HA, TIPOALTERADOR TA'+
                  ' WHERE  (H.IDPESSOA    = '+IntToStr(iIDPESSOA)+')'+
                  ' AND    (H.MESREFERENCIA >= '''+sAnoMesRef+''' )'+
                  ' AND    (H.IDPESSJUR   = '+IntToStr(iIDPESSJUR)+')'+
                  ' AND    (H.IDPLANOPREV = '+IntToStr(iIDPLANOPREV)+')'+
                  ' AND    (H.SEQPROPOSTA = '+IntToStr(iSEQPROPOSTA)+')'+
                  ' AND    (CPP.FLGCOBRA  = '+sFlgCobraAux+'   ) '+
                  ' AND    (H.IDPESSOA    = CPP.IDPESSOA)'+
                  ' AND    (H.IDPESSJUR   = CPP.IDPESSJUR)'+
                  ' AND    (H.IDPLANOPREV = CPP.IDPLANOPREV) '+
                  ' AND    (H.SEQPROPOSTA = CPP.SEQPROPOSTA) '+
                  ' AND    (H.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO) '+
                  ' AND    (H.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+
                  ' AND    (H.FLGINTEVENTO   = '''+psFlgIntEvento+''')'+ // CAMILLE - 20.01.2004
                  ' AND    (H.NUMRECEBIMENTO = HA.NUMRECEBIMENTO(+)) '+
                  ' AND    (H.MESREFERENCIA  = HA.MESREFERENCIA (+)) '+
                  ' AND    (H.MESCOBRANCA    = HA.MESCOBRANCA(+))    '+
                  ' AND    (H.IDMOTIVO       = HA.IDMOTIVO(+))       '+
                  ' AND    (HA.CODALTERADOR  = TA.CODALTERADOR(+))   '+
                  ' AND    (H.FLGSITFUNDACAO = '''+sSitFundacaoAux+''' ) '+ //LEOCBS - 2609
                  ' ORDER BY H.MESREFERENCIA, C.IDCONTRIBUICAO, HA.NUMRECEBIMENTO  DESC ');
   qryAux.Open;
   if not qryAux.IsEmpty
   then begin
// 5ª Seção
      frmMostraAux.memResult.Lines.Add(Replicate('-',100));
      frmMostraAux.memResult.Lines.Add('ACERTOS GERADOS PELO EVENTO PARA O PARTICIPANTE : '); // CAMILLE - 20.01.2004
      if sDescHistorico <> '' then frmMostraAux.memResult.Lines.Add(' '+sDescHistorico );
      frmMostraAux.memResult.Lines.Add(Replicate('-',100));

// Gleyber - 27/08/2002
      frmMostraAux.memResult.Lines.Add('   ');
      frmMostraAux.memResult.Lines.Add('   MÊS     DESCRICAO DO ITEM                                      '+AlinhaDireita('SALÁRIO',10)+AlinhaDireita('CONTRIB.',10)  + AlinhaDireita('SALÁRIO ',10));
      frmMostraAux.memResult.Lines.Add('                                                                  '+AlinhaDireita('REAL',10)   +AlinhaDireita('DESCONTAR',10) + AlinhaDireita('INTEGRAL',10));
      frmMostraAux.memResult.Lines.Add('   '+Replicate('-',97));

      dTotalACobrar   := 0;
      dTotalAlterador := 0;
      qryAux.First;

      while not qryAux.Eof do
      begin
         sLinha := '';
         sMes := qryAux.FieldByName('MesReferencia').AsString;
         sNumRecebimento := qryAux.FieldByName('NUMRECEBIMENTO').AsString; //leofuncef - 24062004

         if (sSitFundacao = 'MA') or (sSitFundacao = 'MP')
         then sUltimoSalario := sSalManutencao
         else sUltimoSalario := sSalParticipacao;

         sSalario := BuscaSalario( iIdPessJur, iIdPlanoPrev, iIdPessoa,
                                   sMes,
                                   sSitFundacao,
                                   sUltimoSalario,
                                   sMsgErro,
                                   dtmAPrev.qry);

         sSalarioIntegral := BuscaSalarioPESSOAINTEGRAL(dtmAPrev.qry,
                                                        iIdPessJur,
                                                        iIdPlanoPrev,
                                                        iIdPessoa,
                                                        iSeqProposta,
                                                        sSitFundacao, // CAMILLE - 01.10.2003
                                                        sMes);        // CAMILLE - 01.10.2003

// camille - 01.10.2003
//         sLinha:= sMes + ' Salário' + Replicate(' ',49) + AlinhaDireita(FormatFloat('#0.00', StrToFloat(ClienteNumero(sSalario))),10)+
//                  Replicate(' ',15)+AlinhaDireita(FormatFloat('#0.00', StrToFloat(ClienteNumero(sSalarioIntegral))),10);

//         frmMostraAux.memResult.Lines.Add(sLinha);

         // Caso Manutido parcial, exibir também o salario de ativo, informado no [gerasalarioretro]
         if (sSitFundacao = 'MP')
         then  begin
            // Buscar salario de ativo no mes em questao
            dtmAPrev.qry.Close;
            dtmAPrev.qry.SQL.Clear;
            dtmAPrev.qry.SQL.Add(' SELECT /*+ RULE */ DECODE(VLRANTRETROATIVO, NULL, VALORPROVENTO , VLRANTRETROATIVO) AS VALORPROVENTO '+
                                 ' FROM   HISTRUBSAL H, PATRO PT'+
                                 ' WHERE  (PT.IDPESSOA = '+IntToStr(iIdPessJur)+')  '+
                                 ' AND    (H.IDPESSOA  = '+IntToStr(iIdPessoa)  +')  '+
                                 ' AND    (H.MES       = '''+sMes      +''') '+
                                 ' AND    (H.IDRUBRICA = PT.IDRUBSALPARTICIP )   '+
                                 ' AND    (H.IDPESSJUR = PT.IDPESSOA         )   ');
            dtmAPrev.qry.Open;
            if dtmAPrev.qry.IsEmpty
            then sSalarioAt := BuscaSalario( iIdPessJur, iIdPlanoPrev, iIdPessoa, sMes, 'AT', sSalarioAt,   sMsgErro,
                                              dtmAPrev.qry)
            else sSalarioAt := dtmAPrev.qry.FieldByName('ValorProvento').AsString;

{           sLinha := Replicate(' ',8) + 'Salário (Ativo)' + Replicate(' ',41) + AlinhaDireita(FormatFloat('#0.00', StrToFloat(ClienteNumero(sSalarioAt))),10);
            frmMostraAux.memResult.Lines.Add(sLinha);

            sLinha := Replicate(' ',8) + 'Diferença' + Replicate(' ',47);

            If StrToFloat(ClienteNumero(sSalario)) -
               StrToFloat(ClienteNumero(sSalarioAt)) > 0
             Then sLinha := sLinha + AlinhaDireita(FormatFloat('#0.00', StrToFloat(ClienteNumero(sSalario)) -
                                                                        StrToFloat(ClienteNumero(sSalarioAt))),10)
             Else sLinha := sLinha + Replicate(' ',12) +
                                     AlinhaDireita(FormatFloat('#0.00', StrToFloat(ClienteNumero(sSalario)) -
                                                                        StrToFloat(ClienteNumero(sSalarioAt))),10);

            frmMostraAux.memResult.Lines.Add(sLinha);
}
         end;

         iControle := 1;
         dTotalNoMes := 0; // CAMILLE - 13.07.2004
         while (sMes = qryAux.FieldByName('MesReferencia').AsString) and (not qryAux.Eof)
               and (sNumRecebimento = qryAux.FieldByName('NumRecebimento').AsString ) //leofuncef - 24062004
         do   begin
            iIdContribuicao := qryAux.FieldbyName('IdContribuicao').AsInteger;

            if iControle = 1
            then sLinha := '   '+PreparaStr(sMes,8)
            else sLinha := '   '+Replicate(' ',8);

            sLinha := sLinha + PreparaStr(Copy(qryAux.FieldByName('Nome').AsString,1,55),55);
            sLinha := sLinha + AlinhaDireita(FormatFloat('#0.00', StrToFloat(ClienteNumero(sSalario))),10);
            sLinha := sLinha + AlinhaDireita(FormatFloat('#0.00', StrToFloat(ClienteNumero(qryAux.FieldByName('ValorEsperado').AsString))),10);
            sLinha := sLinha + AlinhaDireita(FormatFloat('#0.00', StrToFloat(ClienteNumero(sSalarioIntegral))),10);
            frmMostraAux.memResult.Lines.Add(sLinha);

            
            dTotalACobrar   := dTotalACobrar   + qryAux.FieldByName('ValorEsperado').AsFloat;
            dTotalNoMes     := dTotalNoMes     + qryAux.FieldByName('ValorEsperado').AsFloat;
            while(iIdContribuicao = qryAux.FieldbyName('IdContribuicao').AsInteger) and
                 (sMes = qryAux.FieldByName('MesReferencia').AsString) and
                 (not qryAux.Eof)  and
                 (sNumRecebimento = qryAux.FieldByName('NumRecebimento').AsString ) //leofuncef - 24062004
            do  begin
                if qryAux.FieldbyName('Descricao').AsString <> ''
                then begin
                   sLinha := '   '+Replicate(' ',8) + '+ ';
                   if Length(qryAux.FieldByName('Descricao').AsString) > 53
                   then sLinha:= sLinha + Copy(qryAux.FieldByName('Descricao').AsString,1,53)
                   else sLinha:= sLinha + PreparaStr(Trim(qryAux.FieldByName('Descricao').AsString),53);

                   sLinha := sLinha + Replicate(' ',10) +
                             AlinhaDireita(FormatFloat('#0.00', StrToFloat(ClienteNumero(qryAux.FieldByName('Valor').AsString))),10);

                   dTotalAlterador := dTotalAlterador + qryAux.FieldByName('Valor').AsFloat;
                   dTotalNoMes     := dTotalNoMes     + qryAux.FieldByName('Valor').AsFloat;
                   frmMostraAux.memResult.Lines.Add(sLinha);
                end;
                qryAux.Next;
             end;
         end;
         // CAMILLE - 13.07.2004
         // EXIBIR O TOTAL NO MES
         sLinha := PreparaStr(' ',11)+PreparaStr('SUBTOTAL (MÊS '+sMes+') =',65)+AlinhaDireita(FormatFloat('#0.00', dTotalNoMes),10);
         frmMostraAux.memResult.Lines.Add(sLinha);
         frmMostraAux.memResult.Lines.Add('   '+Replicate('-',97));
      end;
   end;
   qryAux.Close;

   frmMostraAux.memResult.Lines.Add('   '+Replicate('-',97));
   frmMostraAux.memResult.Lines.Add('   TOTAL DE ACERTOS : ');
   frmMostraAux.memResult.Lines.Add(PreparaStr(' ',11)+PreparaStr('TOTAL DE CONTRIBUIÇÕES = ',65)+AlinhaDireita(FormatFloat('#0.00',dTotalACobrar),10));
   frmMostraAux.memResult.Lines.Add(PreparaStr(' ',11)+PreparaStr('TOTAL DE ALTERADORES   = ',65)+AlinhaDireita(FormatFloat('#0.00',dTotalAlterador),10));
   frmMostraAux.memResult.Lines.Add('  ');
   frmMostraAux.memResult.Lines.Add(PreparaStr(' ',11)+PreparaStr('TOTAL GERAL            = ',65)+AlinhaDireita(FormatFloat('#0.00',dTotalAlterador+dTotalACobrar),10));
   frmMostraAux.memResult.Lines.Add(Replicate('-',100));
   strAux := 'APENAS PARA CONFERÊNCIA';
   sLinha:=Replicate(' ',(100-Length(Trim(strAux))) div 2) + strAux;
   frmMostraAux.memResult.Lines.Add(sLinha);
   frmMostraAux.memResult.Lines.Add(Replicate('-',100));

   frmMostraAux.ShowModal;
   Result := True;
end;




function UsaRubricaSalMantido(qryAux : TwwQuery; iIdPessJur, iIdPlanoPrev : Integer):Boolean;
begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' SELECT FLGUSARUBRICA, IDRGSALMANUTPART FROM PLANPREVPATRO  '+
                   ' WHERE  IDPESSJUR   = '+''''+IntToStr(iIdPessJur)    +''''+
                   ' AND    IDPLANOPREV = '+''''+IntToStr(iIdPlanoPrev)  +'''');
    qryAux.Open;
    result := (qryAux.FieldByName('FLGUSARUBRICA').AsInteger = 1);
    qryAux.Close;
end;

function VerificaExisteContribMesEvento(qryAux : TwwQuery; sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta, sdtEvento:string):Boolean;
var
   sMesEvento : string;
begin
   Result     := False;
   sMesEvento := Copy(sdtEvento, 7, 4)+'/'+Copy(sdtEvento, 4, 2);
   // Verificar :
   // 1. Contribuicoes nao pagas do mes anterior ao do evento para trás
   // 2. Contribuicoes pagas do mes do evento para frente
   // ---------------- MES DO EVENTO --------------
   // NAO PAGAS     <-|
   //                 |-> CONTRIBUICOES PAGAS

   // 1. Verificando contribuicoes nao pagas anteriores ao evento
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' SELECT DISTINCT MESREFERENCIA FROM HSTCONTRIBPREV '+
                  ' WHERE  IDPESSOA      = '+sIdPessoa      +
                  ' AND    IDPESSJUR     = '+sIdPessJur     +
                  ' AND    IDPLANOPREV   = '+sIdPlanoPrev   +
                  ' AND    SEQPROPOSTA   = '+sSeqProposta   +
                  ' AND    MESREFERENCIA < '+''''+sMesEvento+''''+
                  ' AND    VALORESPERADO IS NOT NULL '+ // CAMILLE - 05.02.2003
                  ' AND    VALORESPERADO > 0         '+
                  ' AND    ( ( VALORRECEBIDO IS NULL)  OR (VALORRECEBIDO = 0) ) '+
                  ' AND    DATARECEBIMENTO IS NULL '+
                  ' AND    IDCONTRIBUICAO NOT IN (SELECT IDCONTRIBUICAO '+
                  '                               FROM    PARAMDOTACAO  '+
                  '                               WHERE   IDPESSJUR = '+sIdPessJur+
                  '                               AND     IDPLANOPREV = '+sIdPlanoPrev+')');
   qryAux.Open;
   if not (qryAux.IsEmpty) then
   begin
      if MsgDlg('Existe(m) '+IntToStr(qryAux.RecordCount)+' mês(meses) de contribuições de Ativo não pagas. '+
                'Deseja inscrever a manutenção ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
      then Result := True;
      qryAux.Close;
      Exit;
   end;

   // 2. Verificando contribuicoes já pagas apos o evento
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' SELECT DISTINCT MESREFERENCIA FROM HSTCONTRIBPREV '+
                  ' WHERE  IDPESSOA      = '+sIdPessoa      +
                  ' AND    IDPESSJUR     = '+sIdPessJur     +
                  ' AND    IDPLANOPREV   = '+sIdPlanoPrev   +
                  ' AND    SEQPROPOSTA   = '+sSeqProposta   +
                  ' AND    MESREFERENCIA >= '''+sMesEvento+''''+
                  ' AND    SUBSTR(MESREFERENCIA,6,2) <> ''13'' '+
                  ' AND    VALORESPERADO IS NOT NULL '+ // CAMILLE - 05.02.2003
                  ' AND    VALORESPERADO > 0         '+
                  ' AND    ( (VALORRECEBIDO > 0) OR NOT (DATARECEBIMENTO IS NULL) ) '+
                  ' AND    IDCONTRIBUICAO NOT IN (SELECT IDCONTRIBUICAO '+
                  '                               FROM    PARAMDOTACAO  '+
                  '                               WHERE   IDPESSJUR = '+sIdPessJur+
                  '                               AND     IDPLANOPREV = '+sIdPlanoPrev+')');
   qryAux.Open;
   if not (qryAux.IsEmpty) then
   begin
      if MsgDlg('Existe(m) '+IntToStr(qryAux.RecordCount)+' mês(meses) de contribuições de Ativo pagas posteriores à '+sDtEvento+'. '+#13+
                'Caso continue o evento estas contribuições poderão ser devolvidas. '+
                'Deseja continuar o evento ? ','Atenção',mtWarning,[mbYes, mbNo],0) = mrNo
      then Result := True
      else Result := False;
   end;

   qryAux.Close;
end;

function GravaTotalPatro(pIdLote, liExercicio, liPeriodo : integer;
                         sAnoMesReferencia, sAnoMesCobranca : string;
                         qryAux,  qryTotalPatro : TwwQuery): Boolean;

var sSQLFields,    sSQLValues,       sCodPortForma,
    sCamposObrig,  sValorEncontrado, sAno,   sMes,
    sNomePatro,    sDataCobranca,    sMesCobranca,
    sNoDocumento,  sIdContribuicao   : string;
    piultimacontrib,
    iIdPatroAtu,
    iOrdem         : integer;
    bCCustoCObrig,
    bCCustoDObrig,
    bCResponObrig,
    bUnidNegocObrig,
    bErro           : boolean;
    rTotal          : real;

    // Campos de Integracao com financeiro
    sPlano,            sPlaContaC,        sPlaContaD,
    sCodCentroCustoC,  sCodCentroCustoD,  sIdEmpresa,
    sUnidNegoc,        sIdEmpresaProp,    sCodCentroRespon,
    sCodSubConta,      sRecPag,           sCodTipRecDes,
    sTipCodigo,        sCodTipDoc,        sCodPortadorForma   : string;
begin
   Result  := False;

   // Preencher variaveis iniciais
   iOrdem := 0;
   rTotal := 0;
   sIdContribuicao := '';
   piultimacontrib := -1;

   if sAnoMesReferencia = '' then Exit;
   sAno := Copy(sAnoMesReferencia,1,4);
   sMes := Copy(sAnoMesReferencia,6,2);

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

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT CODPORTFORMA FROM PORTADORFORMA WHERE NVL(FLGATIVO, ''S'') = ''S'''); // Hugo Luna - 23/10/2007 -Pendência 25133
   qryAux.Open;

   qryAux.First;
   if qryAux.IsEmpty
   then sCodPortForma := 'NULL'
   else sCodPortForma := qryAux.FieldByName('CodPortForma').AsString;
   qryAux.Close;

   // Gravar total da patrocinadora na TMPDESC agrupado por dados contabeis
   qryTotalPatro.Close;
   qryTotalPatro.SQL.Clear;
   qryTotalPatro.SQL.Add(' SELECT  SUM(HST.VALORESPERADO) AS VALOR,   CPP.IDPESSJUR,  CPP.IDPLANOPREV,    '+
                         '         CPP.IDCONTRIBUICAO,     '+
                         '         CPP.PLANO,             CPP.PLACONTAC,          CPP.PLACONTAD,          '+
                         '         CPP.CODCENTROCUSTOC,   CPP.CODCENTROCUSTOD,    CPP.IDEMPRESA,          '+
                         '         CPP.UNIDNEGOC,         CPP.IDEMPRESAPROP,      CPP.CODCENTRORESPON,    '+
                         '         CPP.CODSUBCONTA,       CPP.RECPAG,             CPP.CODTIPRECDES,       '+
                         '         CPP.TIPCODIGO,         CPP.CODTIPDOC,          CPP.CODPORTFORMA,       '+
                         '         CPP.PLANO13,           CPP.PLACONTAC13,        CPP.PLACONTAD13,        '+
                         '         CPP.CODCENTROCUSTOC13, CPP.IDEMPRESA13,        CPP.CODCENTROCUSTOD13,  '+
                         '         CPP.UNIDNEGOC13,       CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,  '+
                         '         CPP.CODSUBCONTA13,     CPP.RECPAG13,           CPP.CODTIPRECDES13,     '+
                         '         CPP.TIPCODIGO13,       CPP.CODTIPDOC13,        CPP.CODPORTFORMA13      '+
                         ' FROM    HSTCONTRIBPREV   HST, '+
                         '         CONTRIBPREVPARTP CPP, '+
                         '         CONTPREV         CP   '+
                         ' WHERE   HST.IDLOTE          = '+IntToStr(pIdLote)+ '    AND '+
                         '         HST.IDPESSOA        = HST.IDPESSOA AND  '+ //leocbs  - 3001 - peformance
                         '         HST.MESREFERENCIA   = '''+sAnoMesReferencia+'''    AND '+
//                         '         HST.IDPESSJUR       = '+IntToStr(iIdPatroAtu)+' AND '+
                         '         HST.IDPESSOA        = CPP.IDPESSOA              AND '+
                         '         HST.IDPESSJUR       = CPP.IDPESSJUR             AND '+
                         '         HST.SEQPROPOSTA     = CPP.SEQPROPOSTA           AND '+
                         '         HST.IDPLANOPREV     = CPP.IDPLANOPREV           AND '+
                         '         HST.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO        AND '+
                         '         CPP.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO         AND '+
                         '         CPP.IDPLANOPREV     = CP.IDPLANOPREV            AND '+
                         '         CP.FLGNAOEXIGEREC   = 1                             '+
                         ' GROUP BY CPP.IDPESSJUR,  CPP.IDPLANOPREV,             '+
                         '        CPP.IDCONTRIBUICAO,                            '+
                         '        CPP.PLANO,             CPP.PLACONTAC,          CPP.PLACONTAD,          '+
                         '        CPP.CODCENTROCUSTOC,   CPP.CODCENTROCUSTOD,    CPP.IDEMPRESA,          '+
                         '        CPP.UNIDNEGOC,         CPP.IDEMPRESAPROP,      CPP.CODCENTRORESPON,    '+
                         '        CPP.CODSUBCONTA,       CPP.RECPAG,             CPP.CODTIPRECDES,       '+
                         '        CPP.TIPCODIGO,         CPP.CODTIPDOC,          CPP.CODPORTFORMA,       '+
                         '        CPP.PLANO13,           CPP.PLACONTAC13,        CPP.PLACONTAD13,        '+
                         '        CPP.CODCENTROCUSTOC13, CPP.IDEMPRESA13,        CPP.CODCENTROCUSTOD13,  '+
                         '        CPP.UNIDNEGOC13,       CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,  '+
                         '        CPP.CODSUBCONTA13,     CPP.RECPAG13,           CPP.CODTIPRECDES13,     '+
                         '        CPP.TIPCODIGO13,       CPP.CODTIPDOC13,        CPP.CODPORTFORMA13      ');
   try
      qryTotalPatro.Open;
   except
      Exit;
   end;
   if qryTotalPatro.IsEmpty then
      Exit;

   // Preencher Centro de responsabilidade e usa ABC
   dtmAPrev.qryVerificaObrig.Close;
   dtmAPrev.qryVerificaObrig.SQL.Clear;
   dtmAPrev.qryVerificaObrig.SQL.Add(' SELECT USACRESPON, USAABC FROM PARAMGLOBAL  '+
                                     ' WHERE  IDPESSOA = '+IntToStr(Sistema.idEmpresa));
   dtmAPrev.qryVerificaObrig.Open;
   if dtmAPrev.qryVerificaObrig.IsEmpty or (dtmAPrev.qryVerificaObrig.FieldByName('USACRESPON').AsString = 'N')
   then bCResponObrig := False
   else bCResponObrig := True;

   if dtmAPrev.qryVerificaObrig.IsEmpty or (dtmAPrev.qryVerificaObrig.FieldByName('USAABC').AsString = 'N')
   then bUnidNegocObrig := False
   else bUnidNegocObrig := True;

   dtmAPrev.qryVerificaObrig.Close;

   //  Começa o Loop de Contribuiçoes Acumuladas no Lote
   qryTotalPatro.First;
   while not qryTotalPatro.Eof do
   begin
      Inc(iOrdem);
      sNomePatro   := ' COBRANÇA QUE NÃO EXIGE RECEBIMENTO ';
      iIdPatroAtu  := qryTotalPatro.FieldByName('IDPESSJUR').AsInteger;
      rTotal       := rTotal + qryTotalPatro.FieldByName('VALOR').AsFloat;
      sNoDocumento := IntToStr(iIdPatroAtu)+sAno+sMes+IntToStr(iOrdem);

      if sMes <> '13' Then
      begin
         sDataCobranca := CriticaDataCobrancaSit(qryAux, IntToStr(iIdPatroAtu),
                                                 qryTotalPatro.FieldByName('IdPLANOPREV').AsString,
                                                 'PT', 'N', sMes, sAno);
      end
      else
      begin
         //ClaudioR - 19962 - 16/08/2007 - Inicio
         //sMes := Copy(DateToStr(date),4,2);
         //sAno := Copy(DateToStr(date),7,4);

         sMes := Copy(FormatDateTime('dd/mm/yyyy', date),4,2);
         sAno := Copy(FormatDateTime('dd/mm/yyyy', date),7,4);
         //ClaudioR - 19962 - 16/08/2007 - Fim

         sDataCobranca := CriticaDataCobrancaSit(qryAux, IntToStr(iIdPatroAtu),
                                                 qryTotalPatro.FieldByName('IdPlanoPREV').AsString,
                                                 'PT', 'N', sMes, sAno);
      end;
      // Preencher Ano/Mês de Cobrança
      sMesCobranca  := Copy(sDataCobranca,7,4)+'/'+Copy(sDataCobranca,4,2);

      // Gravar contribuição na tabela tmpDesc
      sSQLFields := ' CODPROVDESC,     CODALTERADOR,   FLGALTERADOR,    FLGATRASODEVOL,  '+
                    ' FLGDESCFOLHA,    FLGDESCONTO,    FLGTIPODESC,     '+
                    ' IDDESCONTO,      IDFUNDACAO,     IDMOTIVO,        IDPESSJUR,       '+
                    ' IDPESSOA,        IDPLANOPREV,    IDPROVENTO,      IDTITULAR,      '+
                    ' INSCRICAONUMERO, MATRICULA,      MESCOBRANCA,     MESREFERENCIA,   '+
                    ' NUMPRIORIDADE,   ORDEM,          SISTORIGEM,      VALOR,           '+
                    ' PLACONTAC,       PLACONTAD,      PLANO,           UNIDNEGOC,       '+
                    ' CODPORTFORMA,    CODTIPDOC,      CODTIPRECDES,    RECPAG,          '+
                    ' VALORBASE1,      VALORBASE2,     VALORBASE3,      DATAREFERENCIA,  '+
                    ' DESCRICAO,       REFERENCIA,     CODCENTROCUSTOC, CODCENTROCUSTOD, '+
                    ' CODCENTRORESPON, CODSUBCONTA,    IDEMPRESA,       IDEMPRESAPROP,   '+
                    ' DATACOBRANCA,    NODOCUMENTO,    COMPLDOCUMENTO,  IDLOTE,          '+
                    ' IDEMPCOBRANCA,   PERIODO,        EXERCICIO,       TIPCODIGO,       '+
                    ' SITENVIO  ';

      sSQLValues := ' NULL ';
      //if qryTotalPatro.FieldByName('CODALTERADOR').AsString <> ''
      //then sSQLValues := sSQLValues +','''+qryTotalPatro.FieldByName('CODALTERADOR').AsString+''''
      //else
      sSQLValues := sSQLValues +', NULL ';   // CODALTERADOR

      sSQLValues := sSQLValues +', NULL ';  // FLGALTERADOR

      sSQLValues := sSQLValues +', ''N''';  // FLGATRASODEVOL
      sSQLValues := sSQLValues +', ''O''';  // FLGDESCFOLHA

      sSQLValues := sSQLValues +', 1 ';     // FLGDESCONTO    //qryTotalPatro.FieldByName('FLGDESCONTO').AsString;
      sSQLValues := sSQLValues +', ''P''';  // FLGTIPODESC

      sSQLValues := sSQLValues +', '+qryTotalPatro.FieldByName('IDCONTRIBUICAO').AsString;// IDDESCONTO

      //if qryTotalPatro.FieldByName('IDFUNDACAO').AsString <> ''
      //then sSQLValues := sSQLValues +', '+qryTotalPatro.FieldByName('IDFUNDACAO').AsString
      //else
      sSQLValues := sSQLValues +', NULL '; // IDFUNDACAO

      sSQLValues := sSQLValues +', '+IntToStr(prmIdMotivoContrib);  // IDMOTIVO
      sSQLValues := sSQLValues +', '+IntToStr(iIdPatroAtu);         // IDPESSJUR
      sSQLValues := sSQLValues +', '+IntToStr(iIdPatroAtu);         // IDPESSOA
      sSQLValues := sSQLValues +', NULL ';                          // IDPLANOPREV
      sSQLValues := sSQLValues +', NULL ';                          // IDPROVENTO
      sSQLValues := sSQLValues +', '+IntToStr(iIdPatroAtu);         // IDTITULAR
      sSQLValues := sSQLValues +', NULL';                           // INSCRICAONUMERO
      sSQLValues := sSQLValues +', NULL';                           // MATRICULA
      sSQLValues := sSQLValues +', '''+sAnoMesCobranca+'''';           // MESCOBRANCA
      sSQLValues := sSQLValues +', '''+sAnoMesReferencia+'''';         // MESREFERENCIA
      sSQLValues := sSQLValues+', NULL ';                           // NUMPRIORIDADE
      sSQLValues := sSQLValues +', '+IntToStr(iOrdem);              // ORDEM
      sSQLValues := sSQLValues +', '+IntToStr(Sistema.IdModulo);    // SISTORIGEM
      sSQLValues := sSQLValues +', '+OraNumero(qryTotalPatro.FieldByName('VALOR').AsString); //VALOR

      BuscaInfFinaNcContrib(sSQLValues,sCamposObrig,sValorEncontrado,sPlaContaC,
                         qryTotalPatro.FieldByName(sPlaContaC).AsString,
                         'S',
                         qryTotalPatro.FieldbyName('IdPessJur').AsInteger,
                         qryTotalPatro.FieldbyName('IdPlanoPrev').AsInteger,
                         qryTotalPatro.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //PLACONTAC
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
                         qryTotalPatro.FieldByName(sPlaContaD).AsString,
                         'S',
                         qryTotalPatro.FieldbyName('IdPessJur').AsInteger,
                         qryTotalPatro.FieldbyName('IdPlanoPrev').AsInteger,
                         qryTotalPatro.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //PLACONTAC

      // Testar se, para a conta debito encontrada, o CentroCustoD é obrigatorio
      bCCustoDObrig := False;
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
      sSQLValues := sSQLValues + ',' +IntToStr(IntegraBack.Plano);                              // PLANO

      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,  // UNIDNEGOC
                    sUNIDNEGOC,qryTotalPatro.FieldByName(sUNIDNEGOC).AsString,
                    'N',
                    qryTotalPatro.FieldbyName('IdPessJur').AsInteger,
                    qryTotalPatro.FieldbyName('IdPlanoPrev').AsInteger,
                    qryTotalPatro.FieldByName('IdContribuicao').AsInteger, piultimacontrib );

      // Se nao for desconto em folha, o portador forma é obrigatório
      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,   //CODPORTFORMA
                        sCodPortadorForma,qryTotalPatro.FieldByName(sCodPortadorForma).AsString,
                        'N',
                         qryTotalPatro.FieldbyName('IdPessJur').AsInteger,
                         qryTotalPatro.FieldbyName('IdPlanoPrev').AsInteger,
                         qryTotalPatro.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //CODTIPDOC

      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                        sCODTIPDOC,qryTotalPatro.FieldByName(sCodTipDoc).AsString,
                        'N',
                         qryTotalPatro.FieldbyName('IdPessJur').AsInteger,
                         qryTotalPatro.FieldbyName('IdPlanoPrev').AsInteger,
                         qryTotalPatro.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //CODTIPDOC

      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                         sCODTIPRECDES,qryTotalPatro.FieldByName(sCodTipRecDes).AsString,
                         'S',
                         qryTotalPatro.FieldbyName('IdPessJur').AsInteger,
                         qryTotalPatro.FieldbyName('IdPlanoPrev').AsInteger,
                         qryTotalPatro.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //CODTIPRECDES

      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                            sRECPAG,qryTotalPatro.FieldByName(sRecPag).AsString,
                            'S',
                            qryTotalPatro.FieldbyName('IdPessJur').AsInteger,
                            qryTotalPatro.FieldbyName('IdPlanoPrev').AsInteger,
                            qryTotalPatro.FieldByName('IdContribuicao').AsInteger, piultimacontrib);   // RECPAG

      sSQLValues := sSQLValues+', NULL '; // VALORBASE1
      sSQLValues := sSQLValues+', NULL '; // VALORBASE2
      sSQLValues := sSQLValues+', NULL '; // VALORBASE3
      sSQLValues := sSQLValues+', TO_DATE('''+sDataCobranca+''',''dd/mm/yyyy'') ';//DATAREFERENCIA
      sSQLValues := sSQLValues+', '''+Copy(Trim(sNomePatro)+
                                  '- Total Contrib. Particip.- Mês : '+sAnoMesReferencia,1,40)+''''; // DESCRICAO
      sSQLValues := sSQLValues+', ''*** '''; // REFERENCIA

      //if bCCustoCObrig  //CODCENTROCUSTOC
      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sCODCENTROCUSTOC,
                    qryTotalPatro.FieldByName(sCodCentroCustoC).AsString,
                    'S',
                    qryTotalPatro.FieldbyName('IdPessJur').AsInteger,
                    qryTotalPatro.FieldbyName('IdPlanoPrev').AsInteger,
                    qryTotalPatro.FieldByName('IdContribuicao').AsInteger, piultimacontrib );

      //if bCCustoDObrig //CODCENTROCUSTOD
      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sCODCENTROCUSTOD,
                   qryTotalPatro.FieldByName(sCodCentroCustoD).AsString,
                    'S',
                    qryTotalPatro.FieldbyName('IdPessJur').AsInteger,
                    qryTotalPatro.FieldbyName('IdPlanoPrev').AsInteger,
                    qryTotalPatro.FieldByName('IdContribuicao').AsInteger , piultimacontrib);

      //if bCResponObrig //CODCENTRORESPON
      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sCODCENTRORESPON,
                    qryTotalPatro.FieldByName(sCodCentroRespon).AsString,
                    'S',
                    qryTotalPatro.FieldbyName('IdPessJur').AsInteger,
                    qryTotalPatro.FieldbyName('IdPlanoPrev').AsInteger,
                    qryTotalPatro.FieldByName('IdContribuicao').AsInteger , piultimacontrib);

      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sCODSUBCONTA,
                         qryTotalPatro.FieldByName(sCodSUBCONTA).AsString,
                         'N',
                         qryTotalPatro.FieldbyName('IdPessJur').AsInteger,
                         qryTotalPatro.FieldbyName('IdPlanoPrev').AsInteger,
                         qryTotalPatro.FieldByName('IdContribuicao').AsInteger, piultimacontrib ); //CODSUBCONTA

      //if (bCCustoCObrig) or (bCCustoDObrig)                        // IDEMPRESA
      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,sIDEMPRESA,
                     qryTotalPatro.FieldByName(sIDEMPRESA).AsString,
                     'N',
                     qryTotalPatro.FieldbyName('IdPessJur').AsInteger,
                     qryTotalPatro.FieldbyName('IdPlanoPrev').AsInteger,
                     qryTotalPatro.FieldByName('IdContribuicao').AsInteger , piultimacontrib); //IDEMPRESA

      if qryTotalPatro.FieldByName('IDEMPRESAPROP').AsString <> ''     // IDEMPRESAPROP
      then sSQLValues := sSQLValues +', '+qryTotalPatro.FieldByName('IDEMPRESAPROP').AsString
      else sSQLValues := sSQLValues+', NULL ';

      sSQLValues := sSQLValues +', TO_DATE('''+sDataCobranca+''',''dd/mm/yyyy'') ';//DATACOBRANCA
      sSQLValues := sSQLValues +', '+sNoDocumento;          // NODOCUMENTO
      sSQLValues := sSQLValues +', '''+Copy(sAnoMesReferencia,6,2)+ ''''; // COMPLDOCUMENTO

      sSQLValues := sSQLValues +', '+IntToStr(pIdLote);     // IDLOTE

      sSQLValues := sSQLValues +', '+IntToStr(iIdPatroAtu); // IDEMPCOBRANCA

      sSQLValues := sSQLValues +', '+IntToStr(liPeriodo);   // PERIODO
      sSQLValues := sSQLValues +', '+IntToStr(liExercicio); // EXERCICIO

      BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,
                       sTIPCODIGO,'',
                       'S',
                        qryTotalPatro.FieldbyName('IdPessJur').AsInteger,
                        qryTotalPatro.FieldbyName('IdPlanoPrev').AsInteger,
                        qryTotalPatro.FieldByName('IdContribuicao').AsInteger , piultimacontrib); //TIPCODIGO

      sSQLValues := sSQLValues +', ''2'' ';   //SITENVIO - jA RECEBIDO PARA PDV

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('INSERT INTO TMPDESC ('+sSQLFields+ ') VALUES ('+sSQLValues+')');
      try
         qryAux.ExecSQL;
      except
         bErro := True;
         exit;
      end;
      qryTotalPatro.Next;
   end;  //Fim while

  {Atualizar o ctrl de interface}
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE CTRLINTERFACE SET VLRTOTAL     = ' + OraNumero(FloatToStr(rTotal))+ ',' +
              '                          NUMREG       = ' + IntToStr(iOrdem) + ',' +
              '                          FLGIDATMP    = 1,' +
              '                          DATAIDATMP   = SYSDATE,' +
              '                          FLGPREPARADO = 1,' +
              '                          DATAPREPARO  = SYSDATE' +
              ' WHERE IDLOTE = ' + IntToStr(pIdLote) );
      try
        ExecSQL;
      except
        bErro := True;
        Exit;
      end;
   end;
  {Fim - Atualizar o ctrl de interface}

   Result := True;
end; // GravaTotalPatro


function  BaixaContribCAR (   qryAux             : TwwQuery;
                              psAnoMesCobranca   : string;
                              psAnoMesReferencia : string;
                              piNumRecebimento   : longint;
                              piSitRecebimento   : integer;
                              piCodDocumentoPrev : longint;
                              piIdMotivo         : longint;
                              pdValorEsperado    : double;
                              var sMsgErro       : string;
                              psNomeContrib      : string = '') : boolean;

var
    dValorRecebido      : double;
    sDataRecebimento    : string;
    iSitRecebimento     : integer;
    bBaixadoComZero     : boolean; // CAMILLE - 14.07.0004 - PENDENCIA 17201
    dValorBaixado       : double;  // CAMILLE - 14.07.0004 - PENDENCIA 17201
    iCodAlteradorAcres  : longint; // CAMILLE - 14.07.0004 - PENDENCIA 17201
    sNoDocumento        : string;
    dValorEsperadoOrig  : double;  // CAMILLE - 19.07.2004
    dValorPago,                    // Gleyber - 10/03/2005 - Pendência 18418 - Início
    dValorCalc          : Double;  // Gleyber - 10/03/2005 - Pendência 18418 - Início
begin
   Result     := False;
   sMsgErro   := '';
   dValorPago := 0;
   // Se contribuicao nao foi enviada ou não tem documento associado
   // sair da rotina
   if (piSitRecebimento <> 1) or (piCodDocumentoPrev <= 0)
   then begin
      Result := True;
      Exit;
   end;

   dValorEsperadoOrig  := pdValorEsperado;  // CAMILLE - 19.07.2004

   // CAMILLE - 14.07.2004
   // Alteração na lógica para baixa de contribuicoes lançadas no CAR
   // A lógica correta é a seguinte :
   // 1o. Verificar o STATUS do documento. Se não for 2, significa que
   //     o documento ainda não foi baixada. Logo, o AdmPREV não irá
   //     receber. O AdmPREV não receberá documentos parcialmente baixados
   // 2o. Estando o documento baixado, verificar se existe lancamento 5
   //     Se não existir, então o documento foi baixado com valor zero
   //     Logo o AdmPREV deve colocar a contribuicao como "recebida com divergencia"
   //     para cair no Tratamento de Divergencias
   // 3o. Se existir o lancamento com operacao 5, então verificar o valor deste lancamento
   //     3.1. Se for menor que o valor esperado, então baixar contribuicao usando
   //          o valor da operacao 5
   //     3.2. Se for maior que o esperado
   //          Entao verificar se existe Operacao 4 com o alterador parametrizado como
   //                "acrescimo no valor da contribuicao"
   //                Se encontrar
   //                Entao baixar a contribuicao com o valor recebido = ( operacao 2 + operacao 4 )
   //                Senao baixar a contribuicao com o valor recebido = ( operacao 2 = esperado )

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT STATUS, NODOCUMENTO FROM DOCUMENTO '+
                  ' WHERE  CODDOCUMENTO = '+IntToStr(piCodDocumentoPrev));
   qryAux.Open;
   if (qryAux.IsEmpty) or (qryAux.FieldByName('STATUS').AsString <> '2')
   then begin
      //P.RAMOS-25.02.2005-ALERTA AO USUÁRIO QUE O DOCUMENTO NÃO ESTÁ BAIXADO
      //  E PORTANTO A CONTRIBUIÇÃO VINCULADA NÃO PODE SER RECEBIDA
      sMsgErro:=
        'O documento '+qryAux.FieldByName('NODOCUMENTO').asstring+' não está baixado. '+#13#10+
        'Por isso, a contribuição associada não pode ser recebida. '+#13#10+
        'Favor verificar o documento no Contas a Receber.'+#13#10#13#10;
      //P.RAMOS-25.02.2005-FIM
      Result := True;
      Exit;
   end;

   sNoDocumento := qryAux.FieldByName('NODOCUMENTO').AsString;


   // Buscar total das contribuicoes no mesmo documento para comparar com valor
   // baixado do documento
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT SUM(DECODE(FLGDEVOLUCAO,1,-VALORESPERADO,VALORESPERADO)) AS TOTALESPERADO '+
                  ' FROM   HSTCONTRIBPREV                                                            '+
                  ' WHERE  CODDOCUMENTOPREV = '+IntToStr(piCodDocumentoPrev)                         );
   qryAux.Open;
   if (not qryAux.IsEmpty) and (qryAux.FieldbyName('TOTALESPERADO').AsFloat <> 0)   // Gleyber - 08/06/2006 - Pendência 22224
   then begin
      pdValorEsperado := abs(qryAux.FieldbyName('TOTALESPERADO').AsFloat);          // Gleyber - 08/06/2006 - Pendência 22224
      qryAux.Close;
      qryAux.SQL.Clear;
      // Gleyber - 08/11/2005 - Pendência 20360 - Início
      //qryAux.SQL.Add(' SELECT SUM(HST.VALOR) AS TOTALESPERADO                                             '+

      // Gleyber - 08/06/2006 - Pendência 22224 - Início
      {qryAux.SQL.Add('SELECT SUM(DECODE(T.ACRESDECRES, ''D'', -H.VALOR, H.VALOR)) AS TOTALESPERADO ');
      qryAux.SQL.Add('FROM   HSTATRASOCONTRIB H, TIPOALTERADOR T');
      qryAux.SQL.Add('WHERE  H.CODALTERADOR = T.CODALTERADOR');
      qryAux.SQL.Add('  AND  H.NUMRECEBIMENTO IN (SELECT NUMRECEBIMENTO');
      qryAux.SQL.Add('                            FROM   HSTCONTRIBPREV');
      qryAux.SQL.Add('                            WHERE  CODDOCUMENTOPREV = '+IntToStr(piCodDocumentoPrev));
      qryAux.SQL.Add('                           )');}

      // Gleyber - 27/07/2006 - Pendência 22920 - Início
      qryAux.SQL.Add('SELECT SUM(CASE WHEN D.RECPAG = ''R'' AND T.RECPAG = ''R'' THEN DECODE(T.ACRESDECRES,''C'',-H.VALOR,''D'',H.VALOR,0)');
      qryAux.SQL.Add('                WHEN D.RECPAG = ''R'' AND T.RECPAG = ''P'' THEN DECODE(T.ACRESDECRES,''C'',-H.VALOR,''D'',H.VALOR,0)');
      qryAux.SQL.Add('                WHEN D.RECPAG = ''P'' AND T.RECPAG = ''P'' THEN DECODE(T.ACRESDECRES,''D'',H.VALOR,''C'',-H.VALOR,0)');
      qryAux.SQL.Add('                WHEN D.RECPAG = ''P'' AND T.RECPAG = ''R'' THEN DECODE(T.ACRESDECRES,''D'',H.VALOR,''C'',-H.VALOR,0)');
      qryAux.SQL.Add('		   ELSE 0');
      qryAux.SQL.Add('           END) AS TOTALESPERADO');
      qryAux.SQL.Add('FROM   HSTATRASOCONTRIB H, TIPOALTERADOR T, DOCUMENTO D');
      qryAux.SQL.Add('WHERE  H.CODALTERADOR = T.CODALTERADOR');
      qryAux.SQL.Add('  AND  D.CODDOCUMENTO = '+IntToStr(piCodDocumentoPrev));
      qryAux.SQL.Add('  AND  H.NUMRECEBIMENTO IN (SELECT NUMRECEBIMENTO');
      qryAux.SQL.Add('                            FROM   HSTCONTRIBPREV');
      qryAux.SQL.Add('                            WHERE  CODDOCUMENTOPREV = D.CODDOCUMENTO)');
      // Gleyber - 27/07/2006 - Pendência 22920 - Fim

      qryAux.Open;
      if (not qryAux.IsEmpty) and (qryAux.FieldbyName('TOTALESPERADO').AsFloat > 0)
      then pdValorEsperado := pdValorEsperado + qryAux.FieldbyName('TOTALESPERADO').AsFloat
      Else pdValorEsperado := pdValorEsperado - Abs(qryAux.FieldbyName('TOTALESPERADO').AsFloat);
      // Gleyber - 08/06/2006 - Pendência 22224 - Fim

      // Gleyber - 08/11/2005 - Pendência 20360 - Fim
   end;

   bBaixadoComZero := False;

   // Procurar a data que o participante pagou a cobrança
   qryAux.Close;
   qryAux.SQL.Clear;
   //P.RAMOS-07.04.02006-PEND.22045-SOMAR TODOS OS LANÇAMENTOS DE BAIXA
   //qryAux.SQL.Add(' SELECT DATALANCTO AS DATAPAGTO, VALOR FROM LANCTODOCUM '+
{   qryAux.SQL.Add(
     'SELECT MAX(DATALANCTO) AS DATAPAGTO, '+#13#10+
     '       SUM(DECODE(DEBCRE,''C'',VALOR,''D'',-VALOR,0)) AS VALOR '+#13#10+
     'FROM LANCTODOCUM '+#13#10+
   //P.RAMOS-07.04.02006-PEND.22045-SOMAR TODOS OS LANÇAMENTOS DE BAIXA-FIM
     'WHERE CODDOCUMENTO = '+IntToStr(piCodDocumentoPrev)+#13#10+
                  ' AND    OPERACAO     = ''5'' ');
}

   // Gleyber - 08/06/2006 - Pendência 22224 - Início
   qryAux.SQL.Add('SELECT MAX(L.DATALANCTO) AS DATAPAGTO,');
   qryAux.SQL.Add('       DECODE(D.RECPAG, ''R'',');
   qryAux.SQL.Add('	                   SUM(DECODE(L.DEBCRE,''C'',L.VALOR,''D'',-L.VALOR,0)),');
   qryAux.SQL.Add('	                   SUM(DECODE(L.DEBCRE,''D'',L.VALOR,''C'',-L.VALOR,0))) AS VALOR');
   qryAux.SQL.Add('FROM LANCTODOCUM L, DOCUMENTO D');
   qryAux.SQL.Add('WHERE L.CODDOCUMENTO = '+IntToStr(piCodDocumentoPrev));
   qryAux.SQL.Add('  AND L.OPERACAO     = ''5'' ');
   qryAux.SQL.Add('  AND D.CODDOCUMENTO = L.CODDOCUMENTO');
   qryAux.SQL.Add('GROUP BY D.RECPAG');
   // Gleyber - 08/06/2006 - Pendência 22224 - Fim

   qryAux.Open;

   if qryAux.IsEmpty
   then begin
      bBaixadoComZero   := True;
      dValorBaixado     := 0;
      //sDataRecebimento  := DateToStr(date);                  //ClaudioR - 19962 - 16/08/2007
      sDataRecebimento  := FormatDateTime('dd/mm/yyyy', date); //ClaudioR - 19962 - 16/08/2007
   end
   else
   begin
     //P.RAMOS-07.04.02006-PEND.22045-SOMAR TODOS OS LANÇAMENTOS DE BAIXA
     if qryAux.FieldByName('VALOR').AsFloat <= 0 then
     begin
       bBaixadoComZero   := True;
       dValorBaixado     := 0;
       //sDataRecebimento  := DateToStr(date);                  //ClaudioR - 19962 - 16/08/2007
       sDataRecebimento  := FormatDateTime('dd/mm/yyyy', date); //ClaudioR - 19962 - 16/08/2007
     end
     else
     begin
     //P.RAMOS-07.04.02006-PEND.22045-SOMAR TODOS OS LANÇAMENTOS DE BAIXA-FIM
       bBaixadoComZero  := False;
       dValorBaixado    := qryAux.FieldByName('VALOR').AsFloat;

       if Trim(qryAux.FieldByName('DataPagto').AsString) <> '' Then
         sDataRecebimento   := qryAux.FieldByName('DataPagto').AsString
       else
         //sDataRecebimento := DateToStr(date);                    //ClaudioR - 19962 - 16/08/2007
         sDataRecebimento   := FormatDateTime('dd/mm/yyyy', date); //ClaudioR - 19962 - 16/08/2007
   end;
   end;

   dValorBaixado   :=  StrToFloat(FormatFloat('#0.00',dValorBaixado));
   pdValorEsperado :=  StrToFloat(FormatFloat('#0.00',pdValorEsperado));

   // Gleyber - 10/03/2005 - Pendência 18418 - Início
   dValorRecebido  := dValorEsperadoOrig;

   // Baixa com Valor Zerado
   If bBaixadoComZero Then
   Begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('UPDATE HSTCONTRIBPREV');
     qryAux.SQL.Add('SET    SITRECEBIMENTO  = 3,');
     qryAux.SQL.Add('       VALORRECEBIDO   = 0,');
     qryAux.SQL.Add('       DATARECEBIMENTO = TO_DATE('''+sDataRecebimento+''', ''dd/mm/yyyy'') ');
     qryAux.SQL.Add('WHERE (NUMRECEBIMENTO  = '+IntToStr(piNumRecebimento)+')');
     qryAux.SQL.Add('  AND (MESREFERENCIA   = '''+psAnoMesReferencia+''')');
     qryAux.SQL.Add('  AND (MESCOBRANCA     = '''+psAnoMesCobranca+''')');
     qryAux.SQL.Add('  AND (IDMOTIVO        = '+IntToStr(piIdMotivo)+')');

     dValorPago := dValorPago + 0;

     Try
        qryAux.ExecSQL;
     Except
        sMsgErro := 'Erro na atualização do valor recebido no histórico. ';
        Exit;
     End;
    End // If bBaixadoComZero

    Else
    //
    // Contribuicao Paga a MENOR
    //
    If dValorBaixado < pdValorEsperado
     Then Begin
      sMsgErro := '   [AVISO ] Documento No. '+sNoDocumento+' baixado no CAR com valor MENOR que o esperado   '+#13+#10+
                          '            pelo AdmPREV. Verifique. [Mês:'+psAnoMesReferencia+'-Contrib:'+psNomeContrib+']'+#13+#10+
                          '            ATENÇÃO : ESTA CONTRIBUIÇÃO FOI RECEBIDA PELO AdmPREV.                          ';
      With dtmAPrev do
       Begin
        // 1º - Verifica o total de valor já recebido
        //      para este documento na HSTATRASOCONTRIB
        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.Add('SELECT SUM(DECODE(HST.FLGTIPO,''D'',-HST.VALORRECEBIDO,HST.VALORRECEBIDO)) AS VALORRECEBIDO');
        qryAux2.SQL.Add('FROM   HSTATRASOCONTRIB HST                                                                ');
        qryAux2.SQL.Add('WHERE  NUMRECEBIMENTO IN ( SELECT NUMRECEBIMENTO                                           ');
        qryAux2.SQL.Add('                           FROM   HSTCONTRIBPREV                                           ');
        qryAux2.SQL.Add('                           WHERE  CODDOCUMENTOPREV = '+IntToStr(piCodDocumentoPrev)+')     ');
        qryAux2.SQL.Add(' AND (VALORRECEBIDO  > 0)');
        qryAux2.Open;

        dValorPago := qryAux2.FieldByName('VALORRECEBIDO').AsFloat;

        // 2º - Verifica o total de valor já recebido
        //      para este documento na HSTCONTRIBPREV
        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.Add('SELECT SUM(DECODE(FLGDEVOLUCAO,1,-VALORRECEBIDO,VALORRECEBIDO)) VALORRECEBIDO');
        qryAux2.SQL.Add('FROM HSTCONTRIBPREV');
        qryAux2.SQL.Add('WHERE (CODDOCUMENTOPREV = '+IntToStr(piCodDocumentoPrev)+')');
        qryAux2.SQL.Add('  AND (MESREFERENCIA    = '''+psAnoMesReferencia+''')');
        qryAux2.SQL.Add('  AND (MESCOBRANCA      = '''+psAnoMesCobranca+''')');
        qryAux2.SQL.Add('  AND (IDMOTIVO         = '+IntToStr(piIdMotivo)+')');
        qryAux2.SQL.Add('  AND (VALORRECEBIDO    > 0)');
        qryAux2.Open;

        dValorPago := dValorPago + qryAux2.FieldByName('VALORRECEBIDO').AsFloat;

        dValorRecebido := dValorBaixado - dValorPago;

        qryAux2.Close;
        qryAux2.SQL.Clear;
        // Gleyber - 08/06/2006 - Pendência 22224 - Início
        {qryAux2.SQL.Add('SELECT H.IDMOTIVO, H.CODALTERADOR, H.FLGTIPO, H.VALOR, T.ACRESDECRES, T.RECPAG');  // Gleyber - 27/07/2006 - Pendência 22920
        qryAux2.SQL.Add('FROM HSTATRASOCONTRIB H, TIPOALTERADOR T');
        qryAux2.SQL.Add('WHERE (H.CODALTERADOR   = T.CODALTERADOR)');
        qryAux2.SQL.Add('  AND (H.NUMRECEBIMENTO = '+IntToStr(piNumRecebimento)+')');
        qryAux2.SQL.Add('  AND (H.MESREFERENCIA  = '''+psAnoMesReferencia+''')');
        qryAux2.SQL.Add('  AND (H.MESCOBRANCA    = '''+psAnoMesCobranca+''')');
        qryAux2.SQL.Add('  AND (NVL(H.VALORRECEBIDO,0) = 0)');
        // Gleyber - 08/06/2006 - Pendência 22224 - Fim}
        // Gleyber - 03/08/2006 - Pendência 22920 - Início
        qryAux2.SQL.Add('SELECT HA.IDMOTIVO, HA.CODALTERADOR, HA.FLGTIPO, HA.VALOR, TA.ACRESDECRES, ');
        qryAux2.SQL.Add('       TA.RECPAG TA_RECPAG, D.RECPAG D_RECPAG');
        qryAux2.SQL.Add('FROM HSTATRASOCONTRIB HA,  ');
        qryAux2.SQL.Add('     HSTCONTRIBPREV   HST, ');
        qryAux2.SQL.Add('     TIPOALTERADOR    TA,  ');
        qryAux2.SQL.Add('	 DOCUMENTO     D    ');
        qryAux2.SQL.Add('WHERE (HA.CODALTERADOR   = TA.CODALTERADOR)');
        qryAux2.SQL.Add('  AND (HA.NUMRECEBIMENTO = '+IntToStr(piNumRecebimento)+')');
        qryAux2.SQL.Add('  AND (HA.MESREFERENCIA  = '''+psAnoMesReferencia+''')');
        qryAux2.SQL.Add('  AND (HA.MESCOBRANCA    = '''+psAnoMesCobranca+''')');
        qryAux2.SQL.Add('  AND (NVL(HA.VALORRECEBIDO,0) = 0)');
        qryAux2.SQL.Add('  AND (HA.NUMRECEBIMENTO = HST.NUMRECEBIMENTO)');
        qryAux2.SQL.Add('  AND (HST.CODDOCUMENTOPREV = D.CODDOCUMENTO)');
        // Gleyber - 03/08/2006 - Pendência 22920 - Fim

        qryAux2.Open;

        // 3º - Baixa o alterador com o saldo restante
        If Not qryAux2.IsEmpty
         Then
           While Not qryAux2.Eof do
            Begin
              dValorCalc := qryAux2.FieldByName('VALOR').AsFloat;

              // Se o valor do alterador for maior do que o
              // saldo a receber, irá dar baixa somente no saldo

              // Gleyber - 08/06/2006 - Pendência 22224
              //If (qryAux2.FieldByName('FLGTIPO').AsString = 'A') And
              //If (qryAux2.FieldByName('ACRESDECRES').AsString = 'C') And
              //   (dValorCalc > dValorRecebido)
              // Then dValorCalc := dValorRecebido;
              // Gleyber - 03/08/2006 - Pendência 22920 - Início
	      If ((qryAux2.FieldByName('TA_RECPAG').AsString = 'P') And (qryAux2.FieldByName('D_RECPAG').AsString = 'P') Or
	          (qryAux2.FieldByName('TA_RECPAG').AsString = 'P') And (qryAux2.FieldByName('D_RECPAG').AsString = 'R')) And
                 (dValorCalc > dValorRecebido)
               Then dValorCalc := dValorRecebido;
              // Gleyber - 03/08/2006 - Pendência 22920 - Fim

              // Alimenta a variável de referência com o total já pago

              // Gleyber - 08/06/2006 - Pendência 22224
              //If (qryAux2.FieldByName('FLGTIPO').AsString = 'A')
              //If ((qryAux2.FieldByName('ACRESDECRES').AsString = 'C') And (qryAux2.FieldByName('RECPAG').AsString = 'R')) Or // Gleyber - 27/07/2006 - Pendência 22920
              //   ((qryAux2.FieldByName('ACRESDECRES').AsString = 'D') And (qryAux2.FieldByName('RECPAG').AsString = 'P'))    // Gleyber - 27/07/2006 - Pendência 22920
              // Gleyber - 03/08/2006 - Pendência 22920 - Ínício
	      If ( ( ( (qryAux2.FieldByName('TA_RECPAG').AsString = 'R') And (qryAux2.FieldByName('D_RECPAG').AsString = 'R') ) Or
	             ( (qryAux2.FieldByName('TA_RECPAG').AsString = 'R') And (qryAux2.FieldByName('D_RECPAG').AsString = 'P') ) ) And (qryAux2.FieldByName('ACRESDECRES').AsString = 'D')) Or
                 ( ( ( (qryAux2.FieldByName('TA_RECPAG').AsString = 'P') And (qryAux2.FieldByName('D_RECPAG').AsString = 'P') ) Or
	             ( (qryAux2.FieldByName('TA_RECPAG').AsString = 'P') And (qryAux2.FieldByName('D_RECPAG').AsString = 'R') ) ) And (qryAux2.FieldByName('ACRESDECRES').AsString = 'D'))
              // Gleyber - 03/08/2006 - Pendência 22920 - Fim
               Then dValorPago := dValorPago + dValorCalc  // Alterador de Atraso
               Else dValorPago := dValorPago - dValorCalc; // Alterador de Desconto

              // Abate do valor da  baixa o que já foi efetivamente pago
              dValorRecebido := dValorRecebido - dValorPago;

              If dValorCalc > 0.009
               Then Begin
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.Add('UPDATE HSTATRASOCONTRIB');
                qryAux.SQL.Add('SET VALORRECEBIDO   = '+OraNumero(FormatFloat('#0.00',dValorCalc))+',');
                qryAux.SQL.Add('    DATARECEBIMENTO = TO_DATE('''+sDataRecebimento+''', ''dd/mm/yyyy'') ');
                qryAux.SQL.Add('WHERE (NUMRECEBIMENTO = '+IntToStr(piNumRecebimento)+')');
                qryAux.SQL.Add('  AND (MESREFERENCIA  = '''+psAnoMesReferencia+''')');
                qryAux.SQL.Add('  AND (MESCOBRANCA    = '''+psAnoMesCobranca+''')');
                qryAux.SQL.Add('  AND (IDMOTIVO       = '+qryAux2.FieldByName('IDMOTIVO').AsString+')');     { Augusto 20/07/2005 - era QryAux }
                qryAux.SQL.Add('  AND (CODALTERADOR   = '+qryAux2.FieldByName('CODALTERADOR').AsString+')'); { Augusto 20/07/2005 - era QryAux }

                Try
                   qryAux.ExecSQL;
                Except
                   sMsgErro := 'Erro na atualização do valor recebido no histórico de alteradores. ';
                   Exit;
                End;
              End; // If dValorCalc > 0
              qryAux2.Next;
            End // While Not qryAux2.Eof do
       End; // With dtmAPrev do

      // 4º - Baixa a Contribuição com o saldo restante
      With dtmAPrev do
       Begin
        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.Add('SELECT VALORESPERADO, FLGDEVOLUCAO');
        qryAux2.SQL.Add('FROM HSTCONTRIBPREV');
        qryAux2.SQL.Add('WHERE (NUMRECEBIMENTO = '+IntToStr(piNumRecebimento)+')');
        qryAux2.SQL.Add('  AND (MESREFERENCIA  = '''+psAnoMesReferencia+''')');
        qryAux2.SQL.Add('  AND (MESCOBRANCA    = '''+psAnoMesCobranca+''')');
        qryAux2.SQL.Add('  AND (IDMOTIVO       = '+IntToStr(piIdMotivo)+')');
        qryAux2.SQL.Add('  AND (NVL(VALORRECEBIDO,0) = 0)');

        qryAux2.Open;

        dValorCalc      := qryAux2.FieldByName('VALORESPERADO').AsFloat;
        iSitRecebimento := 2;

        // Se o valor da contribuição for maior do que o
        // saldo a receber, irá dar baixa somente no saldo
        If (qryAux2.FieldByName('FLGDEVOLUCAO').AsInteger = 0) And
           (dValorCalc > dValorRecebido)
         Then Begin
           dValorCalc      := dValorRecebido;
           iSitRecebimento := 3;
         End;


        {// Alimenta a variável de referência com o total já pago
        If qryAux2.FieldByName('FLGDEVOLUCAO').AsInteger = 0
         Then dValorPago := dValorPago + dValorCalc    // Para contribuição normal
         Else dValorPago := dValorPago - dValorCalc;   // Para contribuição de Devolução


        // Abate do valor da  baixa o que já foi efetivamente pago
        dValorRecebido := dValorRecebido - dValorPago;}

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('UPDATE HSTCONTRIBPREV');
        qryAux.SQL.Add('SET    SITRECEBIMENTO  = '+IntToStr(iSitRecebimento)+',');
        qryAux.SQL.Add('       VALORRECEBIDO   = '+OraNumero(FormatFloat('#0.00', dValorCalc))+',');
        qryAux.SQL.Add('       DATARECEBIMENTO = TO_DATE('''+sDataRecebimento+''', ''dd/mm/yyyy'') ');
        qryAux.SQL.Add('WHERE (NUMRECEBIMENTO  = '+IntToStr(piNumRecebimento)+')');
        qryAux.SQL.Add('  AND (MESREFERENCIA   = '''+psAnoMesReferencia+''')');
        qryAux.SQL.Add('  AND (MESCOBRANCA     = '''+psAnoMesCobranca+''')');
        qryAux.SQL.Add('  AND (IDMOTIVO        = '+IntToStr(piIdMotivo)+')');
        Try
           qryAux.ExecSQL;
        Except
           sMsgErro := 'Erro na atualização do valor recebido no histórico. ';
           Exit;
        End;
      End;// With dtmAPrev do
     End  // If dValorBaixado > pdValorEsperado

     Else Begin

     // Esta parte é identica tanto para pagamento igual ou a maior.
     // A única diferença é que no caso de um pagamento a maior é
     // necessário emitir um aviso ao usuário

     // Contribuicao Paga a MAIOR
      If dValorBaixado > pdValorEsperado
      Then sMsgErro := '   [AVISO ] Documento No. '+sNoDocumento+' baixado no CAR com valor MAIOR que o esperado   '+#13+#10+
                       '            pelo AdmPREV. Verifique. [Mês:'+psAnoMesReferencia+'-Contrib:'+psNomeContrib+']'+#13+#10+
                       '            ATENÇÃO : ESTA CONTRIBUIÇÃO FOI RECEBIDA PELO AdmPREV.                          ';
      // 1º - Baixa o Alterador
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('UPDATE HSTATRASOCONTRIB');
      qryAux.SQL.Add('SET VALORRECEBIDO   = VALOR, ');
      qryAux.SQL.Add('    DATARECEBIMENTO = TO_DATE('''+sDataRecebimento+''', ''dd/mm/yyyy'') ');
      qryAux.SQL.Add('WHERE (NUMRECEBIMENTO = '+IntToStr(piNumRecebimento)+')');
      qryAux.SQL.Add('  AND (MESREFERENCIA  = '''+psAnoMesReferencia+''')');
      qryAux.SQL.Add('  AND (MESCOBRANCA    = '''+psAnoMesCobranca+''')');
      Try
         qryAux.ExecSQL;
      Except
         sMsgErro := 'Erro na atualização do valor recebido no histórico de alteradores. ';
         Exit;
      End;
      // 2º - Baixa a Contribuição
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('UPDATE HSTCONTRIBPREV');
      qryAux.SQL.Add('SET    SITRECEBIMENTO  = 2,');
      qryAux.SQL.Add('       VALORRECEBIDO   = '+OraNumero(FormatFloat('#0.00',dValorRecebido))+',');
      qryAux.SQL.Add('       DATARECEBIMENTO = TO_DATE('''+sDataRecebimento+''', ''dd/mm/yyyy'') ');
      qryAux.SQL.Add('WHERE (NUMRECEBIMENTO  = '+IntToStr(piNumRecebimento)+')');
      qryAux.SQL.Add('  AND (MESREFERENCIA   = '''+psAnoMesReferencia+''')');
      qryAux.SQL.Add('  AND (MESCOBRANCA     = '''+psAnoMesCobranca+''')');
      qryAux.SQL.Add('  AND (IDMOTIVO        = '+IntToStr(piIdMotivo)+')');

      Try
         qryAux.ExecSQL;
      Except
         sMsgErro := 'Erro na atualização do valor recebido no histórico. ';
         Exit;
      End;
     End;

   // Gleyber - 10/03/2005 - Pendência 18418 - Fim
   Result := True;
end; // BaixaContribCAR


procedure FazerInsertContab( qryContabil           : TwwQuery;
                             sContaContabil,
                             sCentroCusto,
                             sDebCre, sTipoDC,
                             sNumDoc, sHist1,
                             sHist2,  sHist3,
                             sHist4,  sHist5       : string;
                             iUnidNegoc, iSubConta :integer;
                             rValorCorrente,
                             rValorMoeda           : real;
                             dDataDia              : TDateTime;
                             sTipCodigo            : string;
                             piIdPessJur,
                             piIdPlanoPrev         : longint);
begin
{ Se a conta contábil + Centro de Custo + Unidade de negócio + Subconta + Déb/Cre +
  Tipo (0 - Deb / 1 - Cre / 2 - Partida Dobrada) já existir ==> acumular o valor passado;
  senão, criar registro na query. }

  if sContaContabil = '' then Exit;
  // Gleyber - 21/09/2005 - Pendência 20169 - Início
  // Retirado o comentário abaixo para retornar o acúmulo de valores.
  //leofuncef - 15042005 - retirei acumulo de valores
  qryContabil.First;
  While (not qryContabil.Eof) do
  Begin
     if (qryContabil.FieldByName('PLACONTA').AsString       = sContaContabil) AND
        (qryContabil.FieldByName('CODCENTROCUSTO').AsString = sCentroCusto)   AND
        (qryContabil.FieldByName('UNIDNEGOC').AsInteger     = iUnidNegoc)     AND
        (qryContabil.FieldByName('CODSUBCONTA').AsInteger   = iSubConta)      AND
        (qryContabil.FieldByName('LACDEBCRE').AsString      = sDebCre)        AND
        (qryContabil.FieldByName('LACTIPO').AsString        = sTipoDC)        AND
        (qryContabil.FieldByName('IDPESSJUR').AsInteger     = piIdPessJur)    AND
        (qryContabil.FieldByName('IDPLANOPREV').AsInteger   = piIdPlanoPrev)  AND
        (qryContabil.FieldByName('LACHIST1').AsString       = sHist1)         AND
        (qryContabil.FieldByName('LACHIST2').AsString       = sHist2)         AND
        (qryContabil.FieldByName('LACHIST3').AsString       = sHist3)         AND
        (qryContabil.FieldByName('LACHIST4').AsString       = sHist4)         AND
        (qryContabil.FieldByName('LACHIST5').AsString       = sHist5)
     Then Begin
        qryContabil.Edit;

        qryContabil.FieldByName('LACVALOR').AsFloat:=qryContabil.FieldByName('LACVALOR').AsFloat+rValorCorrente;
        qryContabil.FieldByName('LACVALHIST').AsFloat:=qryContabil.FieldByName('LACVALHIST').AsFloat+rValorMoeda;

        qryContabil.Post;
        exit;
     End;
     qryContabil.Next
  end;
  // Gleyber - 21/09/2005 - Pendência 20169 - Fim

  qryContabil.Insert;
  qryContabil.FieldByName('PLACONTA').AsString   := sContaContabil;
  qryContabil.FieldByName('PLANO').AsInteger     := IntegraBack.Plano;
  qryContabil.FieldByName('UNIDNEGOC').AsInteger := iUnidNegoc;
  qryContabil.FieldByName('LACVALOR').AsFloat    := rValorCorrente;
  qryContabil.FieldByName('LACVALHIST').AsFloat  := rValorMoeda;
  qryContabil.FieldByName('LACHIST1').AsString   := sHist1;
  qryContabil.FieldByName('LACHIST2').AsString   := sHist2;
  qryContabil.FieldByName('LACHIST3').AsString   := sHist3;
  qryContabil.FieldByName('LACHIST4').AsString   := sHist4;
  qryContabil.FieldByName('LACHIST5').AsString   := sHist5;
  qryContabil.FieldByName('LACNUMDOC').AsString  := sNumDoc;
  qryContabil.FieldByName('LACDEBCRE').AsString  := sDebCre;
  qryContabil.FieldByName('LACTIPO').AsString    := sTipoDC;
  qryContabil.FieldByName('PLNDATDIA').AsDateTime:= dDataDia;
  qryContabil.FieldByName('TIPCODIGO').AsString  := sTipCodigo;
  If iSubConta <> 0
  then qryContabil.FieldByName('CODSUBCONTA').AsInteger  := iSubConta;
  if sCentroCusto <> ''
  Then qryContabil.FieldByName('CODCENTROCUSTO').AsString := sCentroCusto;
  qryContabil.FieldbyName('IDPESSJUR').AsInteger       := piIdPessJur;
  qryContabil.FieldbyName('IDPLANOPREV').AsInteger     := piIdPlanoPrev;

  qryContabil.Post;
end;


procedure IncluiContabilidade( CtrlLancamento : TCtrlLancamento; // CAMILLE - 14.10.2004
                               qryContabil    : TWWQuery;
                           var iPlnCodigo     : Integer;
                           var sMsgErro       : string);
Var
  // liRetFuncao, liExercicio, liPeriodo,liEmpresa : Integer;
  sUnidNegoc, cCCustd,cContad,sSubConta,cCCustc ,cContac,sSubContaCre :String;
  rValHistCre, rValHistDeb : Real;
  qryAux: TwwQuery;
  bPartidaDobrada : Boolean;
  cTipoLancamento : char;
begin
  // liEmpresa := Sistema.IdEmpresa;

  qryAux := TwwQuery.Create(application);
  qryAux.DatabaseName := 'BASEDADOS';

  If FazQuery(qryAux, 'SELECT PACDOBRADA FROM PARAMCONTAB')
  Then If qryAux.FieldByName('PACDOBRADA').AsString = 'N'
       Then bPartidaDobrada := False
       Else bPartidaDobrada := True
  Else bPartidaDobrada := False;
  qryAux.Free;


   if (IntegraBack.Contabilidade = 'S')
   then begin
      qryContabil.First;
      if (not qryContabil.Eof)
      then begin
         qryContabil.First;

         // CAMILLE - 14.10.2004
         // A ROTINA DE LANCAMENTO NA CONTABILIDADE 3 CAMADAS JÁ TESTA O PERIODO
         // LOGO NÃO HÁ MAIS NECESSIDADE DE TESTAR O PERIODO CONTABIL FORA DA ROTINA
         // POR ISSO COMENTEI O CÓDIGO ABAIXO
         {liRetFuncao := TestaPeriodo(True,'BaseDados',
                                     qryContabil.FieldByName('PLNDATDIA').AsString,
                                     IntToStr(Sistema.IdModulo),liExercicio,liPeriodo,liEmpresa,
                                     sMsgErro);
         if liRetFuncao <> 0
         then begin
            iPlnCodigo:=-1;
            exit;
         end;
         }
         while (not qryContabil.EOF) do
         begin

         //FAZER COM AS CONTAS DE CRÉDITO E DÉBITO SEJAM PASSADAS NO MESMO MOMENTO
         // PARA A FUNÇÃO LANCACONTAB.

            if (Trim(InttoStr(qryContabil.FieldByName('UNIDNEGOC').AsInteger)) = '' ) or
               (qryContabil.FieldByName('UNIDNEGOC').AsInteger = 0)
            then sUnidNegoc:= InttoStr(prmUnidNegoc)
            else sUnidNegoc:=InttoStr(qryContabil.FieldByName('UNIDNEGOC').AsInteger);



            If bPartidaDobrada Then
            Begin
              if qryContabil.FieldByName('LACDEBCRE').AsString = 'D'
              then begin
                 // DÉBITO
                 cCCustd     := qryContabil.FieldByName('CODCENTROCUSTO').AsString;
                 cContad     := qryContabil.FieldByName('PLACONTA').AsString;
                 rValHistDeb := qryContabil.FieldByName('LACVALHIST').AsFloat;
                 ssubconta   := qryContabil.FieldByName('CODSUBCONTA').AsString;
                 qryContabil.Next;//
                 cCCustc     :=qryContabil.FieldByName('CODCENTROCUSTO').AsString;
                 cContac     :=qryContabil.FieldByName('PLACONTA').AsString;
                 rValHistCre :=qryContabil.FieldByName('LACVALHIST').AsFloat;
                 ssubcontacre:=qryContabil.FieldByName('CODSUBCONTA').AsString;
              end
              else begin
                 // CRÉDITO
                 cCCustc     :=qryContabil.FieldByName('CODCENTROCUSTO').AsString;
                 cContac     :=qryContabil.FieldByName('PLACONTA').AsString;
                 rValHistCre :=qryContabil.FieldByName('LACVALHIST').AsFloat;
                 ssubcontacre:=qryContabil.FieldByName('CODSUBCONTA').AsString;
                 qryContabil.Next; //
                 cCCustd     := qryContabil.FieldByName('CODCENTROCUSTO').AsString;
                 cContad     := qryContabil.FieldByName('PLACONTA').AsString;
                 rValHistDeb := qryContabil.FieldByName('LACVALHIST').AsFloat;
                 ssubconta   := qryContabil.FieldByName('CODSUBCONTA').AsString;
              end;
            End Else
            Begin
              if qryContabil.FieldByName('LACDEBCRE').AsString = 'D'
              then begin
                 cCCustd     := qryContabil.FieldByName('CODCENTROCUSTO').AsString;
                 cContad     := qryContabil.FieldByName('PLACONTA').AsString;
                 rValHistDeb := qryContabil.FieldByName('LACVALHIST').AsFloat;
                 ssubconta   := qryContabil.FieldByName('CODSUBCONTA').AsString;
                 cCCustc     := '';
                 cContac     := '';
                 rValHistCre := 0;
                 ssubcontacre:= '';
              end
              else begin
                 cCCustd     :='';
                 cContad     :='';
                 rValHistDeb :=0;
                 ssubconta   :='';
                 cCCustc     :=qryContabil.FieldByName('CODCENTROCUSTO').AsString;
                 cContac     :=qryContabil.FieldByName('PLACONTA').AsString;
                 rValHistCre :=qryContabil.FieldByName('LACVALHIST').AsFloat;
                 ssubcontacre:=qryContabil.FieldByName('CODSUBCONTA').AsString;
              end;
            End; // Else - If bPartidaDobrada Then

            if (Trim(sSubConta) <> '' ) and (StrToInt(sSubConta) <= 0)
            then sSubConta := '0';
            if (Trim(ssubcontacre) <> '' ) and (StrToInt(ssubcontacre) <= 0)
            then ssubcontacre := '0';

            if Trim(sUnidNegoc)   = '' then sUnidNegoc   := '0';
            if Trim(sSubConta)    = '' then sSubConta    := '0';
            if Trim(sSubContaCre) = '' then sSubContaCre := '0';

            If bPartidaDobrada
            then cTipoLancamento := '2'
            else cTipoLancamento := qryContabil.FieldByName('LACTIPO').AsString[1];

            CtrlLancamento.InsereLancaContab ( cTipoLancamento,                                  // cTipoLanc
                                               Sistema.IdEmpresa,                                // IdEmpresa
                                               Sistema.IdModulo,                                 // iModuloOrigem
                                               Sistema.IdUsuario,                                // liUsuario
                                               IntegraBack.Plano,                                // liCodPlano
                                               StrToInt(sUnidNegoc),                             // liUnidNegoc
                                               StrToInt(sSubConta),                              // liSubContaDeb
                                               StrToInt(sSubContaCre),                           // liSubContaCre
                                               qryContabil.FieldByName('IDPLANOPREV').AsInteger, // iPlanoPrev
                                               qryContabil.FieldByName('IDPESSJUR').AsInteger,   // iPatro
                                               iPlnCodigo,                                       // liPlnCodigo
                                               0,                                                // iNumLan
                                               qryContabil.FieldByName('PLNDATDIA').AsString,    // sDataLanc
                                               qryContabil.FieldByName('LACNUMDOC').AsString,    // sNumDoc
                                               qryContabil.FieldByName('LACHIST1').AsString,     // sHist1
                                               qryContabil.FieldByName('LACHIST2').AsString,     // sHist2
                                               qryContabil.FieldByName('LACHIST3').AsString,     // sHist3
                                               qryContabil.FieldByName('LACHIST4').AsString,     // sHist4
                                               qryContabil.FieldByName('LACHIST5').AsString,     // sHist5
                                               prmTpOperCobranca,                                // sTipoOper
                                               cCCustD,                                          // sCCustoD
                                               cContaD,                                          // sContaD
                                               cCCustC,                                          // sCCustoC
                                               cContaC,                                          // sContaC
                                               '',                                               // sCodHist
                                               qryContabil.FieldByName('LACVALOR').AsFloat,      // rValLanc
                                               // Gleyber - 20/09/2005 - Pendência 20169
                                               //True,                                             // bJunta
                                               False,                                            // bJunta
                                               Sistema.UsaPlanoPatro,                            // bUsaPlanoPatro
                                               -1,                                               // iIdSegregaCriter
                                               -1                                                // dDataSegregaCriter
                                             );

            iPlnCodigo := Trunc(CtrlLancamento.RetornoPlnCodigo); // CAMILLE - 22.12.2004 - P.RAMOS-PEND.18330

            if iPlnCodigo <= 0 then
            //P.RAMOS-21.12.2004-PEND.18357
            begin
              sMsgErro:=ctrlLancamento.MessageInfo;
              exit;
            end
            else
              sMsgErro:='';
            //P.RAMOS-21.12.2004-PEND.18357-FIM

            qryContabil.Next;
         end;
      end;
   end;
end;


Procedure  AlimentaQryDocumentos( QryDocumentos      : TWWQuery;
                                 Coddocumento,
                                 NumLancto,
                                 plano,
                                 unidnegoc             : Integer;
                                 placonta,
                                 codcentrorespon,
                                 codtiprecdes          : String;
                                 valor                 : real;
                                 piIdPessJur,
                                 piIdPlanoPrev         : longint;
                                 pidcontribuicao       : Integer;
                                 pFlgDevolucao         : longint;
                                 piIdPlanPrevContab     : Integer;
                                 piIdPessjurcedido      : longint);
Begin
  qryDocumentos.First;
  While (not qryDocumentos.Eof) do Begin
    if (qryDocumentos.FieldByName('CODDOCUMENTO').AsInteger   = CodDocumento) AND
       (qryDocumentos.FieldByName('NUMLANCTO').AsInteger      = NumLancto) AND
       (qryDocumentos.FieldByName('UNIDNEGOC').AsInteger      = UnidNegoc) AND
       (qryDocumentos.FieldByName('CODCENTRORESPON').AsString = CodCentroRespon) AND
       (qryDocumentos.FieldByName('CODTIPRECDES').AsString    = codtiprecdes) AND
       (qryDocumentos.FieldByName('PLACONTA').AsString        = placonta) and
       (qryDocumentos.FieldByName('IDPESSJUR').AsInteger      = piIdPessJur) and
       (qryDocumentos.FieldByName('IDCONTRIBUICAO').AsInteger = pidcontribuicao) and  // RICARDO VIGORITO 04/02/2004
       (qryDocumentos.FieldByName('IDPLANOPREV').AsInteger    = piIdPlanoPrev) and
       (qryDocumentos.FieldByName('FLGDEVOLUCAO').AsInteger   = pFlgDevolucao) and  // Gleyber - 27/09/2005 - Pendência 20169

       (qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsInteger    = piIdPlanPrevContab)
    Then Begin
       qryDocumentos.Edit;
       qryDocumentos.FieldByName('VALOR').AsFloat:=qryDocumentos.FieldByName('VALOR').AsFloat + Valor;
       qryDocumentos.Post;
       EXIT;
    End;
    qryDocumentos.Next
  end;

  QryDocumentos.Insert;
  qryDocumentos.FieldByName('CODDOCUMENTO').AsInteger      := Coddocumento;
  qryDocumentos.FieldByName('NUMLANCTO').AsInteger         := NumLancto;

  if plano <> -1 Then
     qryDocumentos.FieldByName('PLANO').AsInteger          := plano;

  if unidnegoc > 0 Then
     qryDocumentos.FieldByName('UNIDNEGOC').AsInteger      := unidnegoc
  else
     qryDocumentos.FieldByName('UNIDNEGOC').AsInteger      := prmUnidNegoc;

  if placonta <> '' Then
     qryDocumentos.FieldByName('PLACONTA').AsString        := placonta;

  if codcentrorespon <> '' Then
     qryDocumentos.FieldByName('CODCENTRORESPON').AsString := codcentrorespon;

  if codtiprecdes <> '' Then
     qryDocumentos.FieldByName('CODTIPRECDES').AsString    := codtiprecdes;

  if valor <> -1 Then
     qryDocumentos.FieldByName('VALOR').AsFloat    := valor;

  qryDocumentos.FieldByName('IDPESSJUR').AsInteger      := piIdPessJur;
  qryDocumentos.FieldByName('IDPLANOPREV').AsInteger    := piIdPlanoPrev;
  qryDocumentos.FieldByName('IDCONTRIBUICAO').AsInteger      := pidcontribuicao; //Ricardo Vigorito 04/03/2004  - Pendência 16178
  qryDocumentos.FieldByName('FLGDEVOLUCAO').AsInteger    := pFlgDevolucao;
  qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsInteger    := piIdPlanPrevContab;
  qryDocumentos.FieldByName('IDPESSJURCEDIDO').AsInteger    := piIdPessjurcedido; //leocm - 16052005

  QryDocumentos.Post;
end;

{Procedure AlimentaQryDocumentos(QryDocumentos      : TWWQuery;
                             Coddocumento,
                             NumLancto,
                             plano,
                             unidnegoc             : Integer;
                             placonta,
                             codcentrorespon,
                             codtiprecdes          : String;
                             valor                 : real;
                             piIdPessJur,
                             piIdPlanoPrev         : longint );
Begin
  qryDocumentos.First;
  While (not qryDocumentos.Eof) do Begin
    if (qryDocumentos.FieldByName('CODDOCUMENTO').AsInteger   = CodDocumento) AND
       (qryDocumentos.FieldByName('NUMLANCTO').AsInteger      = NumLancto) AND
       (qryDocumentos.FieldByName('UNIDNEGOC').AsInteger      = UnidNegoc) AND
       (qryDocumentos.FieldByName('CODCENTRORESPON').AsString = CodCentroRespon) AND
       (qryDocumentos.FieldByName('CODTIPRECDES').AsString   = codtiprecdes) AND
       (qryDocumentos.FieldByName('PLACONTA').AsString        = placonta) and
       (qryDocumentos.FieldByName('IDPESSJUR').AsInteger      = piIdPessJur) and
       (qryDocumentos.FieldByName('IDPLANOPREV').AsInteger    = piIdPlanoPrev)
    Then Begin
       qryDocumentos.Edit;
       qryDocumentos.FieldByName('VALOR').AsFloat:=qryDocumentos.FieldByName('VALOR').AsFloat+Valor;
       qryDocumentos.Post;
       EXIT;
    End;
    qryDocumentos.Next
  end;

  QryDocumentos.Insert;
  qryDocumentos.FieldByName('CODDOCUMENTO').AsInteger      := Coddocumento;
  qryDocumentos.FieldByName('NUMLANCTO').AsInteger         := NumLancto;
  if plano <> -1 Then
     qryDocumentos.FieldByName('PLANO').AsInteger          := plano;
  if unidnegoc > 0 Then
     qryDocumentos.FieldByName('UNIDNEGOC').AsInteger      := unidnegoc
  else
     qryDocumentos.FieldByName('UNIDNEGOC').AsInteger      := prmUnidNegoc;

  if placonta <> '' Then
     qryDocumentos.FieldByName('PLACONTA').AsString        := placonta;
  if codcentrorespon <> '' Then
     qryDocumentos.FieldByName('CODCENTRORESPON').AsString := codcentrorespon;
  if codtiprecdes <> '' Then
     qryDocumentos.FieldByName('CODTIPRECDES').AsString    := codtiprecdes;
  if valor <> -1 Then
     qryDocumentos.FieldByName('VALOR').AsFloat    := valor;

  qryDocumentos.FieldByName('IDPESSJUR').AsInteger      := piIdPessJur;
  qryDocumentos.FieldByName('IDPLANOPREV').AsInteger    := piIdPlanoPrev;
  QryDocumentos.Post;
end;}

Procedure BuscaContabContrib(      iIdPatroAtu,
                                   idPlanoPrev,
                                   idDesconto,
                                   iParticipante       : longint;
                              var  sContaD,
                                   sContaC,
                                   sCodCCustoC,
                                   sCodCCustoD,
                                   sCodTipRecDes,
                                   sCodCRespon         : string;
                              var  iUnidNegoc          : integer);
var
  qryTempor : TwwQuery;
Begin
  sContaD       := '';
  sContaC       := '';
  sCodCCustoC   := '';
  sCodCCustoD   := '';
  sCodTipRecDes := '';
  sCodCRespon   := '';
  iUnidNegoc    := prmUnidNegoc; // Gleyber - 05/09/2006 - Pendência 23243
  qryTempor := Twwquery.Create(Application);
  qryTempor.DatabaseName := 'BaseDados';

  // Verificar parametrização exclusiva para Particpante
  if iParticipante >  0
  then begin
    qryTempor.SQL.Text := ' SELECT CODTIPRECDES,     PLACONTAD,       PLACONTAC, CODCENTRORESPON, '+
                          '        CODCENTROCUSTOD,  CODCENTROCUSTOC, UNIDNEGOC, PLACONTADBANCO,  '+
                          '        PLACONTAOUTROMES, FLGDESCFOLHA                                 '+ // CAMILLE - 30.04.2002
                          ' FROM   CONTRIBPREVPARTP '+
                          ' WHERE  IDPESSOA        = '+ InttoStr(iParticipante) +
                          ' AND    IDPESSJUR       = ' + InttoStr(iIdPatroAtu) +
                          ' AND    IDPLANOPREV     = ' +  InttoStr(idPlanoPrev) +
                          ' AND    IDCONTRIBUICAO  = '+ InttoStr(idDesconto);
    try
      qryTempor.Open;
    except
      qryTempor.Close;
      qryTempor.Free;
      Exit;
    end;

    if not qryTempor.IsEmpty
    then begin
       if qryTempor.FieldByName('FLGDESCFOLHA').AsInteger = 1
       then sContaD       := qryTempor.FieldByName('PLACONTAD').AsString
       else sContaD       := qryTempor.FieldByName('PLACONTADBANCO').AsString;

       sContaC       := qryTempor.FieldByName('PLACONTAC').AsString;
       sCodCCustoC   := qryTempor.FieldByName('CODCENTROCUSTOD').AsString;
       sCodCCustoD   := qryTempor.FieldByName('CODCENTROCUSTOC').AsString;
       sCodTipRecDes := qryTempor.FieldByName('CODTIPRECDES').AsString;
       sCodCRespon   := qryTempor.FieldByName('CODCENTRORESPON').AsString;
       iUnidNegoc    := qryTempor.FieldByName('UNIDNEGOC').AsInteger;
    end;
    qryTempor.Close;
    qryTempor.Free;
    exit;
  end;


  qryTempor.Close;
  //verificar parametrização para Patrocinadora
  qryTempor.SQL.Text := ' SELECT CPP.CODTIPRECDES,CPP.PLACONTAD,CPP.PLACONTAC,CPP.CODCENTRORESPON, '+
                        '        CPP.CODCENTROCUSTOD,CPP.CODCENTROCUSTOC,CPP.UNIDNEGOC, CPP.PLACONTADBANCO, ' +
                        '        CP.FLGDESCFOLHA '+
                        ' FROM   CONTPREV CP, CONTPLANPATRO CPP'+
                        ' WHERE  CPP.IDPESSJUR      = ' + InttoStr(iIdPatroAtu) +
                        ' AND    CPP.IDPLANOPREV    = ' + InttoStr(idPlanoPrev) +
                        ' AND    CPP.IDCONTRIBUICAO = ' + InttoStr(idDesconto)  +
                        ' AND    CP.IDPLANOPREV     = CPP.IDPLANOPREV '+
                        ' AND    CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO ';
  try
    qryTempor.Open;
  except
    qryTempor.Close;
    qryTempor.Free;
    Exit;
  end;


  if not qryTempor.IsEmpty then begin
    if qryTempor.FieldByName('FLGDESCFOLHA').AsInteger = 1
    then sContaD       := qryTempor.FieldByName('PLACONTAD').AsString
    else sContaD       := qryTempor.FieldByName('PLACONTADBANCO').AsString;
    sContaC       := qryTempor.FieldByName('PLACONTAC').AsString;
    sCodCCustoC   := qryTempor.FieldByName('CODCENTROCUSTOD').AsString;
    sCodCCustoD   := qryTempor.FieldByName('CODCENTROCUSTOC').AsString;
    sCodTipRecDes := qryTempor.FieldByName('CODTIPRECDES').AsString;
    sCodCRespon   := qryTempor.FieldByName('CODCENTRORESPON').AsString;
    iUnidNegoc    := qryTempor.FieldByName('UNIDNEGOC').AsInteger;
    // rosana - serpros - 02/09/99
    if (sContaD <> '')     or (sContaC <> '')       or (sCodCCustoC <> '') or
       (sCodCCustoD <> '') or (sCodTipRecDes <> '') or (sCodCRespon <> '')
    then begin
       qryTempor.Close;
       qryTempor.Free;
       Exit;
    end;
  end;


  qryTempor.Close;
  // verificar parametrização para Plano
  qryTempor.SQL.Text := 'SELECT CODTIPRECDES,PLACONTAD,PLACONTAC,CODCENTRORESPON, '+
                        'CODCENTROCUSTOD,CODCENTROCUSTOC,UNIDNEGOC, PLACONTADBANCO, FLGDESCFOLHA ' +
                        'FROM CONTPREV ' +
                        'WHERE IDPLANOPREV = ' +  InttoStr(idPlanoPrev) +
                        ' AND IDCONTRIBUICAO = '+ InttoStr(idDesconto);
  try
    qryTempor.Open;
  except
    qryTempor.Close;
    qryTempor.Free;
    Exit;
  end;
  if not qryTempor.IsEmpty then begin
    if qryTempor.FieldByName('FLGDESCFOLHA').AsInteger = 1
    then sContaD       := qryTempor.FieldByName('PLACONTAD').AsString
    else sContaD       := qryTempor.FieldByName('PLACONTADBANCO').AsString;
    sContaC       := qryTempor.FieldByName('PLACONTAC').AsString;
    sCodCCustoC   := qryTempor.FieldByName('CODCENTROCUSTOD').AsString;
    sCodCCustoD   := qryTempor.FieldByName('CODCENTROCUSTOC').AsString;
    sCodTipRecDes := qryTempor.FieldByName('CODTIPRECDES').AsString;
    sCodCRespon   := qryTempor.FieldByName('CODCENTRORESPON').AsString;
    iUnidNegoc    := qryTempor.FieldByName('UNIDNEGOC').AsInteger;
  end;
  qryTempor.Close;
  qryTempor.Free;
end;

// Verificar com a Camille  **** Gleyber
Procedure BuscaContabPatro(iIdPatroAtu: Integer; var icodPortFormaPatro: Integer;
             var sTipCodPatro,sCodCResponPatro : String; var iUnidNegocPatro : Integer);
var
  qryTempor : TwwQuery;
Begin
  sCodCResponPatro   := '';
  iUnidNegocPatro    := prmUnidNegoc; // Gleyber - 05/09/2006 - Pendência 23243
  sTipCodPatro       := '';
  iCodPortFormaPatro := -1;
  qryTempor := Twwquery.Create(Application);
  qryTempor.DatabaseName := 'BaseDados';
// verificar parametrização exclusiva para Particpante

  qryTempor.SQL.Text := 'SELECT CODPORTFORMA ' +
                        'FROM PATRO ' +
                        'WHERE IDPESSOA = ' + InttoStr(iIdPatroAtu);
  try
    qryTempor.Open;
  except
    Exit;
  end;
  if not qryTempor.IsEmpty
   then iCodPortFormaPatro := qryTempor.FieldByName('CODPORTFORMA').AsInteger;
  qryTempor.Close;
  qryTempor.Free;
end;



function DescarregaDocumentos(CtrlDocumento         : TCtrlDocumento; // CAMILLE - 08.10.2004
                              qryDocumentos         : TwwQuery;
                              iIdPatroAtu,
                              PlnCodigo             : integer;
                              sCodTipDoc,
                              sCodPortForma,
                              sMes,
                              sAno                  : string;
                              valor                 : real;
                              dtRecebimento         : TdateTime;
                              sFlgPagador           : String;
                              pcTipoFolha           : char;
                              const sIdPessoa       : String = '';
                              const sNumRecebimento : String = '';
                              const cRecPag         : string = 'R';
                              const psObservacao    : string = '' ;
                              const sCodCentroCusto : String = '';
                              const bUpdateDoc      : Boolean = True  // André Pontes - 04/10/2007 - pendência 25044
                             ): longint; // P = Patro, B = Beneficios
var
  sAux1, sAux2, sIdPlanPrevContab,
  sPlaConta, sNoDocumento ,sCentroRespon, sTiprecDes, sDebCre, sDesc: String;
  iOrdem, iCodLancCAPCAR,iNumLancto,iUnidNegoc : Integer;
  iIdPessJur, iIdPlanoPrev : longint;
  qryTempor : TwwQuery;
  rValor : double;


  sContrib, sPlano : String;
  rValorRateio : Double;

  sContaBaixa, sContaBaixaAux : String;
  bVariasContasBaixa : Boolean;

  aCcBaixas    : array of RecCcBaixas;
  aRateio      : array of RecDadosRateio;
  iCont, i, icontrateio : Integer;
  bachou: boolean; //P.RAMOS-03.06.2005 - Pend. 19401

  iIdPessoa, iCodForma, iPrograma : Integer;

  sDataLancto : String;

Begin
   qryTempor              := Twwquery.Create(Application);
   qryTempor.DatabaseName := 'BaseDados';
   Result                 := -1;
   iCodLancCapCAR         := 0;
   qryTempor.Close;
   qryTempor.SQL.Clear;
   qryTempor.SQL.Add(' SELECT DEBCRE FROM TIPODOCRECPAG WHERE  CODTIPDOC = '''+sCodTipDoc+'''');
   qryTempor.Open;

   if not qryTempor.IsEmpty
   then sDebCre := qryTempor.FieldByName('DEBCRE').AsString
   else sDebCre := 'D';

   if Trim(sCodPortForma) = '' then sCodPortForma := '-1';
   

   qryTempor.Close;
   qryDocumentos.First;


   //leofuncef - 18052005 - verifica se existem várias contas de baixa
   bVariasContasBaixa := false;

   sContaBaixa := '';
   sContaBaixaAux := qryDocumentos.FieldByName('PLACONTA').AsString;
   sIdPlanPrevContab := qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsString;

   SetLength(aCcBaixas, qryDocumentos.recordcount );
   aCcBaixas[0].PlaConta := qryDocumentos.FieldByName('PLACONTA').AsString;
   aCcBaixas[0].PlanprevContab := qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsString ;

   icont:= 1;
   while not qryDocumentos.EOF do
   begin

      If Not bVariasContasBaixa Then // Gleyber - 04/10/2005 - Pendência 20169
        bVariasContasBaixa := (qryDocumentos.FieldByName('PLACONTA').AsString <> sContaBaixaAux);

      //P.RAMOS-03.06.2005 - Pend. 19401
      bAchou:=false;
      for i := 0 to icont-1 do
      begin
        if (qryDocumentos.FieldByName('PLACONTA').AsString = aCcBaixas[i].PlaConta) and
           (qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsString = aCcBaixas[i].PlanprevContab) then
        begin
          bachou:=true;
          break;
        end;
      end;

//      if (qryDocumentos.FieldByName('PLACONTA').AsString <> sContaBaixaAux) or
//         (qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsString <> sIdPlanPrevContab) then
      if not bachou then
      //P.RAMOS-03.06.2005 - Pend. 19401 - FIM
      begin
         sContaBaixaAux := qryDocumentos.FieldByName('PLACONTA').AsString;
         sIdPlanPrevContab := qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsString;
         aCcBaixas[icont].PlaConta := qryDocumentos.FieldByName('PLACONTA').AsString;
         aCcBaixas[icont].PlanprevContab := qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsString ;
         inc(icont);
      end;

      qryDocumentos.next;
   end;
   if not bVariasContasBaixa  then sContaBaixa := sContaBaixaAux; //havia apenas uma conta de baixa
   //leofuncef - 18052005

   //leofuncef - 27052005 - prepara consulta rateio
   qryDocumentos.first;
   sIdPlanPrevContab  := qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsString;
   iUnidNegoc    := qryDocumentos.FieldByName('UNIDNEGOC').AsInteger;
   sCentroRespon := qryDocumentos.FieldByName('CODCENTRORESPON').AsString;
   sTiprecDes    := qryDocumentos.FieldByName('CODTIPRECDES').AsString;

   SetLength(aRateio, qryDocumentos.recordcount );

   aRateio[0].PlanprevContab := qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsString ;
   aRateio[0].UnidNegoc := qryDocumentos.FieldByName('UNIDNEGOC').AsString ;
   aRateio[0].CodTipRecDes := qryDocumentos.FieldByName('CODTIPRECDES').AsString ;
   aRateio[0].CodCentroRespon := qryDocumentos.FieldByName('CODCENTRORESPON').AsString ;

   icontrateio := 1;
   while not qryDocumentos.EOF do
   begin
      //P.RAMOS-03.06.2005 - Pend. 19401
      bAchou:=false;
      for i := 0 to icontrateio-1 do
      begin
        if  ( aRateio[i].PlanprevContab = qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsString ) and
            ( aRateio[i].UnidNegoc = qryDocumentos.FieldByName('UNIDNEGOC').asstring ) and
            ( aRateio[i].CodCentroRespon = qryDocumentos.FieldByName('CODCENTRORESPON').AsString ) and
            ( aRateio[i].CodTipRecDes = qryDocumentos.FieldByName('CODTIPRECDES').AsString )  then
        begin
          bachou:=true;
          break;
        end;
      end;

//      if  ( sIdPlanPrevContab  <> qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsString ) or
//          ( iUnidNegoc    <> qryDocumentos.FieldByName('UNIDNEGOC').AsInteger ) or
//          ( sCentroRespon <> qryDocumentos.FieldByName('CODCENTRORESPON').AsString ) or
//          ( sTiprecDes    <> qryDocumentos.FieldByName('CODTIPRECDES').AsString )  then
      if not bachou then
      //P.RAMOS-03.06.2005 - Pend. 19401 - FIM
      begin
         sIdPlanPrevContab  := qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsString;
         iUnidNegoc    := qryDocumentos.FieldByName('UNIDNEGOC').AsInteger;
         sCentroRespon := qryDocumentos.FieldByName('CODCENTRORESPON').AsString;
         sTiprecDes    := qryDocumentos.FieldByName('CODTIPRECDES').AsString;

         aRateio[icontrateio].PlanprevContab := qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsString ;
         aRateio[icontrateio].UnidNegoc := qryDocumentos.FieldByName('UNIDNEGOC').AsString ;
         aRateio[icontrateio].CodTipRecDes := qryDocumentos.FieldByName('CODTIPRECDES').AsString ;
         aRateio[icontrateio].CodCentroRespon := qryDocumentos.FieldByName('CODCENTRORESPON').AsString ;
         inc(icontrateio);
      end;

      qryDocumentos.next;
   end;
   //leofuncef - 27052005




   //leofuncef - 06012006
   if sIdPessoa <> '' then
      iIdPessoa := strtoint(sIdPessoa)
   else iIdPessoa := qryDocumentos.FieldByName('IDPESSJURCEDIDO').AsInteger;


   with qryTempor do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT CODFORMA FROM PORTADORFORMA WHERE CODPORTFORMA = '+ClienteNumero(sCodPortForma) + ' AND NVL(FLGATIVO, ''S'') = ''S'''); // Hugo Luna - 23/10/2007 -Pendência 25133
      Open;
      if not IsEmpty
      then iCodForma := FieldByName('CODFORMA').AsInteger
      else iCodForma := -1;
   end;


   // SE TIVER CENTRO DE CUSTO PREENCHIDO, BUSCAR O PROGRAMA DO CENTRO DE CUSTO
   iPrograma := -1;
   if Trim(sCodCentroCusto) <> ''
   then begin
      qryTempor.Close;
      qryTempor.SQL.Clear;
      qryTempor.SQL.Add(' SELECT IDPROGRAMA FROM CENTCUST WHERE CODCENTROCUSTO = '''+sCodCentroCusto+'''');
      qryTempor.Open;
      if (not qryTempor.IsEmpty) and (qryTempor.FieldByName('IDPROGRAMA').AsInteger > 0)
      then iPrograma := qryTempor.FieldByName('IDPROGRAMA').AsInteger;
   end;
   //leofuncef - 06012006 - fim
   

   qryDocumentos.First;
   iCodLancCAPCAR := CtrlDocumento.GetSequenceDocumento;
   sNoDocumento := IntToStr(iCodLancCAPCAR);
   try
      CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
      CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;
      CtrlDocumento.IdUsuario   := Sistema.IdUsuario;
      CtrlDocumento.SetValues( iCodLancCAPCAR,              // CodDocumento
                               StrToFloat(sNoDocumento),    // NoDocumento
                               '1',            // ComplDocumento
                               '0',                         // sStatus
                               cRecPag,                         // RecPag
                               '2',                         // sOperacao
                               '',                          // sNumslip
                               '',                          // sNumleitcodbarras
                               sContaBaixa, // PlaConta - conta de baixa nula pois vou gerar CCBAIXA - leofuncef - 18052005
                               sCodCentroCusto,             // CodCentroCusto
                               '',                          // NossoNumero
                               '',                          // NumDigCodBarras
                               '',                          // GrupoDoc
                               '',                          // sFlgemitelancbaix
                               'N',                         // sFlgconfirmarecpag
                               'N',                         // EmisBloq
                               '',                          // Referencia
                               psObservacao,                // Obs
                               dtRecebimento,               // DataVencto
                               Date,                        // DataEmissao
                               dtRecebimento,               // DataProgramada
                               0,                           // DataRemessa
                               0,                           // DataLimite
                               0,                           // DataCorrecao
                               0,                           // rVlrMulta
                               0,                           // rValorJuros
                               0,                           // rValorDesconto
                               0,                           // rPercJurosSimples
                               0,                           // rPercJurosAtuarial
                               StrToInt(sCodTipDoc),        // CodTipDoc
                               Sistema.IdEmpresa,           // IdPessoa
                               Sistema.IdModulo,            // IdModulo

                               //leocm - 16052005-passo o IDPESSJURCEIDO
                               //iIDPatroAtu,                 // ldForCli
                               iIdPessoa,


                               -1,                          // NumFatura
                               -1,                          // IdCBancaria
                               prmUnidNegoc                 // UnidNegoc   // Gleyber - 05/09/2006 - Pendência 23243
                               IntegraBack.Plano,           // Plano
                               -1,                          // NumCPBaixa
                               -1,                          // NumAPGr
                               -1,                          // Moecodigo
                               -1,                          // LoteTransmissao
                               -1,                          // IndiceCorrecao
                               Sistema.IdUsuario,           // IdUsuarioInclusao
                               Sistema.IdEmpresa,           // IdEmpresa
                               1,                           // Flgnaoconciliado
                               -1,                          // Controleremess,
                               -1,                          // Codsubconta
                               StrToInt(sCodPortForma),     // Codportforma
                               -1,                          // Codgrupocnab
                               -1,                          // CodGeradorINSS
                               iCodForma,                   // Codforma
                               -1                           // iIdSegregaCriter
                             );
   except
      Exit;
   end;



   //leofuncef - 27052005
   //RATEIODOCUM
   for i := 0 to icontrateio -1  do
   begin

      rValorRateio := 0;
      qrydocumentos.first;
      while (not qryDocumentos.EOF)  do
      begin
         if  (aRateio[i].PlanprevContab = qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsString ) and
             (aRateio[i].UnidNegoc = qryDocumentos.FieldByName('UNIDNEGOC').AsString ) and
             (aRateio[i].CodTipRecDes = qryDocumentos.FieldByName('CODTIPRECDES').AsString ) and
             (aRateio[i].CodCentroRespon = qryDocumentos.FieldByName('CODCENTRORESPON').AsString )
         then
         begin

            //leofuncef - 05012006
            if cRecPag = 'R' then
            begin
               if qryDocumentos.FieldByName('FLGDEVOLUCAO').AsInteger = 1 then
                  rValorRateio := rValorRateio - qryDocumentos.FieldByName('VALOR').AsFloat
               else
                  rValorRateio := rValorRateio + qryDocumentos.FieldByName('VALOR').AsFloat;
            end
            else
            begin
               if qryDocumentos.FieldByName('FLGDEVOLUCAO').AsInteger = 1 then
                  rValorRateio := rValorRateio + qryDocumentos.FieldByName('VALOR').AsFloat
               else
                  rValorRateio := rValorRateio - qryDocumentos.FieldByName('VALOR').AsFloat;
            end;
            //leofuncef - 05012006

         end;

         qrydocumentos.next;
      end;


      //cRecPag := 'R';


      if  (aRateio[i].PlanprevContab <> '') and
          (aRateio[i].UnidNegoc  <> '' ) and
          (aRateio[i].CodTipRecDes <> '' ) and
          (aRateio[i].CodCentroRespon  <> '')
      then
      begin

         CtrlDocumento.RateioDocum.SetValues ( rValorRateio,                // Valor
                                            0,                           // ValorOM
                                            0,                           // Vlrresorcamen
                                            0,                           // Idrateiodocum
                                            Sistema.IdEmpresa,           // Idpessoa
                                            iCodLancCAPCAR,              // Coddocumento
                                            strtoint(aRateio[i].UnidNegoc),             // Unidnegoc
                                            0,                           // Moecodigo,
                                            Sistema.IdUsuario,           // Idusuarioinclusao
                                            0,                           // Idreservaorcamen
                                            IntegraBack.Plano,           // Plano
                                            StrToInt(aRateio[i].PlanprevContab), // Idplanoprev - Gleyber - 02/02/2005 - Pendência 18076
                                            qryDocumentos.FieldByName('IDPESSJUR').AsInteger, // Idpatro
                                            iPrograma,                          // Idprograma
                                            -1,                          // Idprocesso
                                            Sistema.IdEmpresa,           // IdEmpresa
                                            aRateio[i].CodTipRecDes,  // Codtiprecdes
                                            cRecPag,                     // Recpag
                                            aRateio[i].CodCentroRespon,  // Codcentrorespon
                                            sCodCentroCusto,                          // Codcentrocusto
                                            ''                           // Numimovel
                                           );
      end;

   end;





   //LANCTODOCUM
   qryDocumentos.First;
   rValor        := 0;
   sPlano := '';
   sContrib := '';

   while not qryDocumentos.EOF do
   begin


      if (trim(sContrib) = '') and (trim(qryDocumentos.FieldByName('IDCONTRIBUICAO').AsString) <> '')
         then sContrib := qryDocumentos.FieldByName('IDCONTRIBUICAO').AsString
      else if (trim(qryDocumentos.FieldByName('IDCONTRIBUICAO').AsString) <> '')
         then sContrib := sContrib + ',' + qryDocumentos.FieldByName('IDCONTRIBUICAO').AsString;

      if (trim(sPlano) = '') and (trim(qryDocumentos.FieldByName('IDPLANOPREV').AsString) <> '')
         then sPlano := qryDocumentos.FieldByName('IDPLANOPREV').AsString
      else if (trim(qryDocumentos.FieldByName('IDPLANOPREV').AsString) <> '')
         then sPlano := sPlano + ',' + qryDocumentos.FieldByName('IDPLANOPREV').AsString;


      if qryDocumentos.FieldByName('FLGDEVOLUCAO').AsInteger = 1 then
         rValor := rValor - qryDocumentos.FieldByName('VALOR').AsFloat
      else
         rValor := rValor + qryDocumentos.FieldByName('VALOR').AsFloat;
      qryDocumentos.Next;
   end;


   try
      if uppercase(sFlgPagador) = 'P'
      then sDesc := 'Contribuição parte Patrocinadora - Mês de Cobrança:'''+sAno+'/'+sMes+''''
      else if uppercase(sFlgPagador) = 'C'
           then sDesc := 'Contribuição parte Participante - Mês de Cobrança:'''+sAno+'/'+sMes+''''
           else if uppercase(sFlgPagador) = 'E'
                then sDesc := 'Contribuição Exclusiva Patrocinadora - Mês de Cobrança:'''+sAno+'/'+sMes+''''
                else sDesc := 'Contribuição - Mês de Cobrança:'''+sAno+'/'+sMes+'''';


      //ClaudioR - 19962 - 16/08/2007 - Inicio
      //Leocm - Pend. 20596 - 21/02/2006 - Início
      //sDataLancto := DateToStr(date);
      //if dtRecebimento < date then sDataLancto := DateToStr(dtRecebimento);

      sDataLancto := FormatDateTime('dd/mm/yyyy', date);
      if dtRecebimento < date then sDataLancto := FormatDateTime('dd/mm/yyyy', dtRecebimento);
      //Leocm - Pend. 20596 - 21/02/2006 - Fim
      //ClaudioR - 19962 - 16/08/2007 - Fim

      CtrlDocumento.LanctoDocum.SetValues( //dtRecebimento,          // DataLancto
                                           StrToDate(sDataLancto) ,//leocm - 21022006
                                           iCodLancCAPCAR,         // CodDocumento
                                           0,                      // Numlancto
                                           abs(rValor),            // Vlrliquido
                                           0,                      // ValorOM
                                           abs(rValor),            // Valor
                                           prmUnidNegoc,           // Unidnegoc   // Gleyber - 05/09/2006 - Pendência 23243
                                           PlnCodigo,              // liPlncodigo
                                           -1,                     // Numlotemanual
                                           Sistema.IdUsuario,      // Idusuarioinclusao
                                           Sistema.IdEmpresa,      // Idpessoa
                                           -1,                     // Idnflivro,
                                           -1,                     // Estorno
                                           -1,                     // Codtipdoc
                                           -1,                     // Coddocinss
                                           -1,                     // Codalterador
                                           '2',                    // Operacao
                                           '',                     // NumRecibo
                                           '',                     // Numnf
                                           '',                     // Numfatura
                                           sDesc,                  // Historicocompl
                                           '',                     // Flgtipofatura
                                           'N',                    // Flgrecebeunf
                                           '',                     // Flgfatemitida
                                           sDebCre,                // Debcre
                                           Sistema.IdModulo,       // IdModulo
                                           IntegraBack.Plano,      // PlanoConta
                                           True,                   // UsaPlanoPatro
                                           False,                  // Contabiliza
                                           -1,                     // iCodPortForma
                                           0,                      // DiasFloat
                                           '',                     // ContaBaixa
                                           0                       // SubContaBaixa
                                          );
      iNumLancto := CtrlDocumento.Lanctodocum.NumLancto; // CAMILLE - 08.10.2004

   except
      Exit;
   end;



   //leofuncef - 18052005
   //caso existam várias contas de baixa, as contas estão registradas no aCcBaixas
   //abaixo, corre cada uma delas, apurando o líquido entra cobrança e devolução e lançando
   if bVariasContasBaixa then
   begin

      for i := 0 to icont -1 do
      begin

         rvalor := 0;
         qrydocumentos.first;
         while (not qryDocumentos.EOF)  do
         begin
            if (qryDocumentos.FieldByName('PLACONTA').AsString = aCcBaixas[i].PlaConta) and
               (qryDocumentos.FieldByName('IDPLANPREVCONTAB').AsString = aCcBaixas[i].PlanprevContab )
            then
            begin

               //leocm - 20012006
               {if qryDocumentos.FieldByName('FLGDEVOLUCAO').AsInteger = 1 then
                  rValor := rValor - qryDocumentos.FieldByName('VALOR').AsFloat
               else
                  rValor := rValor + qryDocumentos.FieldByName('VALOR').AsFloat;}

               if cRecPag = 'R' then
               begin
                  if qryDocumentos.FieldByName('FLGDEVOLUCAO').AsInteger = 1 then
                     rValor := rValor - qryDocumentos.FieldByName('VALOR').AsFloat
                  else
                     rValor := rValor + qryDocumentos.FieldByName('VALOR').AsFloat;
               end
               else
               begin
                  if qryDocumentos.FieldByName('FLGDEVOLUCAO').AsInteger = 1 then
                     rValor := rValor + qryDocumentos.FieldByName('VALOR').AsFloat
                  else
                     rValor := rValor - qryDocumentos.FieldByName('VALOR').AsFloat;
               end;
               //leocm - 20012006 - fim

            end;

            qrydocumentos.next;
         end;


         if (aCcBaixas[i].PlaConta <> '') and
            (aCcBaixas[i].PlanprevContab <> '' ) then
         begin

            CtrlDocumento.CCBaixasXDocum.SetValues(
                  rValor,
                  0, //liIdCcBaixasxDocum,
                  Sistema.Idempresa, //liIdpessoa,
                  iCodLancCAPCAR, //liCodDocumento,

                  //leofuncef - 05012006
                  //-1, //liUnidNegoc,
                  qryDocumentos.FieldByName('UNIDNEGOC').AsInteger,
                  //leofuncef - 05012006 - fim

                  IntegraBack.Plano, //liPlano,
                  strtoint(aCcBaixas[i].PlanprevContab), //liIdplanoPrev,  //leofuncef - 27052005
                  iIDPatroAtu, //liIdPatro,
                  -1, //liIdSegregaCriter,
                  aCcBaixas[i].PlaConta); //placonta    //leofuncef - 27052005
         end;

      end;



   end;
   //leofuncef - 18052005 - fim



   if not CtrlDocumento.Insert then Exit;



   // Se a patrocinadora nao for a propria fundacao,
   // atualizar o código do documento gerado no CAR no historico
    if ((iIdFundacao <> iIdPatroAtu)
      or ((iIdPatroAtu = iIdFundacao) and  prmIntegraFundacao))
      and (iCodLancCAPCAR > 0) and prmIntegraCAR
   then begin
      with dtmAPrev.qryAux do begin
         Close;
         SQL.Clear;
         SQL.Add(' UPDATE HSTCONTRIBPREV SET CODDOCUMENTOPREV = '+IntToStr(iCodLancCAPCAR)+
                 ' WHERE  MESCOBRANCA     = '''+sAno+'/'+sMes+''''+
                 ' AND    IDPESSJUR       = '''+qryDocumentos.FieldByName('IDPESSJUR').AsString+''' '+
                 ' AND    IDPLANOPREV    IN ('+sPlano+') '+
                 ' AND    CODDOCUMENTOPREV IS NULL ');   // Gleyber - 20/07/2006 - Pendência 22859
                 // Gleyber - 10/09/2007 - Pendência 26180
                 // comentada a linha abaixo.
                 //' AND    IDCONTRIBUICAO     IN  ('+sContrib+')  '); //leofuncef - 29032005


         //leofuncef - 29122005
         if  trim(sNumRecebimento) <> '' then
         begin
            SQL.Add(' AND  NUMRECEBIMENTO IN ('+sNumRecebimento+') ');
         end;
         //leofuncef - 29122005 - fim


         //leofuncef - 12122005
         if sIdPessoa  <> '' then
         begin
         // Gleyber - 12/05/2006 - Pendência 22145 - Início
            If trim(sNumRecebimento) = ''
             Then Begin
                SQL.Add(' AND IDPESSOA = '+sIdPessoa+' ');

                SQL.Add(' AND  SITRECEBIMENTO  > 0  '); // Gleyber - 20/07/2006 - Pendência 22859

                SQL.Add(' AND  SITRECEBIMENTO  < 2  ');
             End
             Else Begin
                SQL.Add(' AND  SITRECEBIMENTO  > 0  '); // Gleyber - 20/07/2006 - Pendência 22859
                SQL.Add(' AND  SITRECEBIMENTO  < 2  ');
             End
         // Gleyber - 12/05/2006 - Pendência 22145 - Fim
         end
         else
         begin
            SQL.Add(' AND    FLGDESCFOLHA    = 1 ');

            if pcTipoFolha = 'B'
            then SQL.Add(' AND FOLHAORIGEM   = ''B'' ')
            else SQL.Add(' AND FOLHAORIGEM   = ''P'' ');

            SQL.Add(' AND  SITRECEBIMENTO   >= 2    '+
                    ' AND  SITRECEBIMENTO   <= 3    ');
         end;
         //leofuncef - 12122005 - fim



         //leofuncef - 29122005
         if trim(sFlgPagador) <> '' then
         begin
            SQL.Add(' AND  CODDOCUMENTOPREV IS NULL '+
                    ' AND  IDCONTRIBUICAO IN    ( SELECT IDCONTRIBUICAO FROM CONTPREV '+
                    '                             WHERE  IDPLANOPREV IN ('+sPlano+') '+
                    '                             AND    FLGPAGADOR  = '''+sFlgPagador+''' )');
         end
         //leofuncef - 29122005 - fim
         Else SQL.Add(' AND    IDCONTRIBUICAO     IN  ('+sContrib+')  '); // Gleyber - 10/09/2007 - Pendência 26180

         // Gleyber - 07/06/2005 - Pendência 19403 - Início
         If (qryDocumentos.FieldByName('IDPESSJURCEDIDO').AsInteger <>
             qryDocumentos.FieldByName('IDPESSJUR').AsInteger)
           And (Not qryDocumentos.FieldByName('IDPESSJURCEDIDO').IsNull)
          Then SQL.Add(' AND EXISTS (SELECT 1 FROM ELEGPATRO WHERE IDPESSJUR = HSTCONTRIBPREV.IDPESSJUR '+
                      '             AND IDPESSOA = HSTCONTRIBPREV.IDPESSOA AND IDPESSJURCEDIDO IS NOT NULL ) ')
          Else SQL.Add(' AND EXISTS (SELECT 1 FROM ELEGPATRO WHERE IDPESSJUR = HSTCONTRIBPREV.IDPESSJUR '+
                      '             AND IDPESSOA = HSTCONTRIBPREV.IDPESSOA AND IDPESSJURCEDIDO IS NULL ) ');

         // Gleyber - 07/06/2005 - Pendência 19403 - Fim

         try
           if bUpdateDoc then ExecSQL;  // André Pontes - 04/10/2007 - pendência 25044
         except
           Exit;
         end;
      end;
   end;


   //leocm - 15022006 - update na lancamento.lacnumdoc, atualizando o número do documento
   with dtmAPrev.qryAux do begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE LANCAMENTO SET LACNUMDOC = '+IntToStr(iCodLancCAPCAR)+
              ' WHERE  PLNCODIGO     = '+IntToStr(PlnCodigo)+
              ' AND IDMODULO = '+IntToStr(Sistema.IdModulo)+
              ' AND LACNUMDOC IS NULL ');
      try
         ExecSQL;
      except
         Exit;
      end;
   end;
   //leocm - 15022006 - fim


   qryTempor.Close;
   qryTempor.Free;

   Result := iCodLancCAPCAR;
end;



function GeraSalarioRetroativo( piIdPessJur, piIdPlanoPrev, piIdPessoa : longint;
                                psFlgSitPart,
                                psDataInicio, psDataFinal,
                                psValorProvento  : string;
                                var sNovoSalario,
                                    sNovoSalarioAtivoMP : string;
                                var qryAux : TwwQuery;
                                var sMsgErro : string;
                                psFlgIntEvento : string;
                                pbAcertaSalario : boolean;
                                piOrigem  : Integer = -1  //  0 - Outros ,   { Augusto 18/11/2005 }
                                                          //  1 - Suspensao de contribuicao
                                                          //  2 - Concessao de Beneficio
                                                          //  3 - Renova
                                                          //  4 - Encerramento
                                                          //  5 - Desdobramento
                                                          //  6 - Revisão de beneficios
                                                          //  7 - Migração de Planos
                                )  : boolean;
var sCodProvDesc,
    sIdRubrica,
    sRubricasGeradas,
    sFlgCompoeRemTotal,
    sFlgCompoeSalBenef,
    sFlgCompoeSalPart,
    sFlgIRRF,
    sCodProvDescMp,
    sIdRubricaMp,
    sIdRubSalarioAux,
    sFlgCompoeRemTotalMp,
    sFlgCompoeSalBenefMp,
    sFlgCompoeSalPartMp,
    sFlgIRRFMp,
    sNomeRubrica,
    sDescRubrica,
    sDataRef,
    sFlgSRB,
    sDataFinal13,
    sSalario13,
    sAnoMesHoje,
    sUltimoAnoMes13Gravado,
    sUltimoSalarioAtivoMP,
    sAnoMesInicio,
    sAnoMesFinal,
    sAnoMesAtual,
    sAnoMesAux,
    sDataFinalAux,
    sSalarioAtivoMp,
    sSalarioAux,
    sDataIniSalario,
    sDataFimSalario,
    sSalario,
    sSalarioManutDesc         : string;
    iMoeCodTeto      : longint;
    iMesPaga13,
    iUltDiaMes,
    iLin             : Integer;
    stgridresult     : TStringGrid;
    iIdRegraSal13    : longint;
    sUltDiaMes,
    sSQL,
    sSQLRegra        : string;
    bPediuSalario,
    bEnviaValor,
    bPossuiSalario,
    bErroRegra       : boolean;
    iTipoFim,
    iTipoRubrica              : word;
    sDataAdmissao             : string;
    sSalarioIntegralNoMes     : string;
    bAtualizaSalario          :  boolean;
    sSalarioIntegralExistente : string;
    sSalarioJaExistente       : string;
    qryloopHist               : TwwQuery; //leocm -  12062002
    sUltimo13DoAno            : string;  // CAMILLE - 14.01.2004
    bCalculaSalario13         : boolean; // CAMILLE - 14.01.2004
    bRetroativo, bRecalculaSalariMP        : boolean; // CAMILLE - 19.01.2004
    iIdRegraSalarioMP         : longint; // CAMILLE - 19.01.2004
    sValorRegra               : string;  // CAMILLE - 19.01.2004
    sMsgFrmAguarde            : String;  // Gleyber - 06/06/2005 - Pendência 18536
    sSalarioAnterior          : String;  // Gleyber - 16/06/2005 - Pendência 22329
begin
   Result       := False;
   sNovoSalario := psValorProvento;
   stgridresult := TStringGrid.Create(Application);
   sUltimoAnoMes13Gravado := '0000/00';
   sDataAdmissao := '';
   bRetroativo := False; { Augusto 05/05/2005 }

   // FAZER UM LOOP DE 3 PASSOS PARA GERAR 3 TIPOS DE SALÁRIO :
   // 1 - SALARIO DE PARTICIPACAO ( OU MANUTENCAO)
   // 2 - REMUNERACAO TOTAL
   // 3 - SALAUXDOENCA

   sRubricasGeradas := '';

   if psFlgSitPart = 'AS'
   then iTipoFim := 1
   //leocbs  - inicio- 2102 - gera apenas a rubrica de salário de mantido
   else if (psFlgSitPart = 'MA') or (psFlgSitPart = 'MP')
   then iTipoFim := 1
   //leocbs -fim -
   else iTipoFim := 3;



   sNomeRubrica := 'IDRUBSALPARTICIP';//leocm - 13062002

   FOR iTipoRubrica := 1 TO iTipoFim DO
   BEGIN
      case iTipoRubrica of
           1 : begin
                  // Preencher dados da rubrica de salario de participacao
                  if psFlgSitPart = 'MA' // Mantido
                  then begin
                     sDescRubrica := 'Salário de Manutenção Integral';
                     sNomeRubrica := 'IDRUBSALMANUT';
                     sFlgSRB      := '1';
                  end
                  else begin
                     if psFlgSitPart = 'MP' // Mantido Parcial
                     then begin
                        sDescRubrica := 'Salário de Manutenção Parcial';
                        sNomeRubrica := 'IDRUBSALMANUTPARC';
                        sFlgSRB      := '5';
                     end
                     else if psFlgSitPart = 'AS' // Assistido (só nos casos de assistencia temporaria)
                          then begin
                             sDescRubrica := 'Salário Virtual';
                             sNomeRubrica := 'IDRUBSALAUXDOENCA';
                             sFlgSRB      := '4';
                          end
                          else begin             // Outras situacoes (Ativo, etc)
                             sDescRubrica := 'Salário de Participação';
                             sNomeRubrica := 'IDRUBSALPARTICIP';
                             sFlgSRB      := '1';
                          end;
                  end;
               end;
           2 : begin // remuneracao total
                  sDescRubrica := 'Remuneração Total';
                  sNomeRubrica := 'IDRUBREMTOTAL';
                  sFlgSRB      := '0';
               end;
           3 : begin // salario de beneficio
                  sDescRubrica := 'Salário de Benefício';
                  sNomeRubrica := 'IDRUBSALBENEFICIO';
                  sFlgSRB      := '0';
               end;
      end; // case


      with qryAux do
      begin
         SQL.Clear;
         SQL.Add(' SELECT PT.'+sNomeRubrica+' AS IDRUBRICA,   RP.CODPROVDESC,   '+
                 '        PV.FLGCOMPOEREMTOTAL,  PV.FLGCOMPOESALBENEF,          '+
                 '        PV.FLGCOMPOESALPART,   PV.FLGIRRF   '+
                 ' FROM   PATRO PT, RUBRICAXPESS RP, PROVDESC PV  '+
                 ' WHERE  PT.IDPESSOA  = '+IntToStr(piIdPessJur)+
                 ' AND    RP.IDPESSOA  = PT.IDPESSOA '+
                 ' AND    RP.IDRUBRICA = PT.'+sNomeRubrica+
                 ' AND    RP.IDRUBRICA = PV.IDPROVENTO ');
         Open;
         if not IsEmpty
         then begin
            sCodProvDesc       := FieldByName('CODPROVDESC').AsString;
            sIdRubrica         := FieldByName('IDRUBRICA').AsString;
            sFlgCompoeRemTotal := FieldByName('FLGCOMPOEREMTOTAL').AsString;
            sFlgCompoeSalBenef := FieldByName('FLGCOMPOESALBENEF').AsString;
            sFlgCompoeSalPart  := FieldByName('FLGCOMPOESALPART').AsString;
            sFlgIRRF           := FieldByName('FLGIRRF').AsString;

            if Trim(sFlgCompoeRemTotal) <> '1' then sFlgCompoeRemTotal := '0';
            if Trim(sFlgCompoeSalBenef) <> '1' then sFlgCompoeSalBenef := '0';
            if Trim(sFlgCompoeSalPart)  <> '1' then sFlgCompoeSalPart  := '0';
            if Trim(sFlgIRRF)           <> '1' then sFlgIRRF := '0';

         end
         else begin
            // Se for salario de participaca, dar mensagem de erro
            // Se for algum dos outros dois salarios, sair sem erro
            if iTipoRubrica = 1
            then sMsgErro := 'A Rubrica de '+sDescRubrica+' não foi encontrada no cadastro. Verifique.'
            else Result := True;

            Exit;
         end;

         // Se já gerou a rubrica, entao ir para próximo passo
         if Pos(sIdRubrica,sRubricasGeradas) > 0
         then continue;

         sRubricasGeradas := sRubricasGeradas + sIdRubrica+' ,';

         // Se o participante for mantido parcial,
         // Buscar tambem as rubricas de salario de participacao
         if (psFlgSitPart = 'MP')
         then begin
            SQL.Clear;
            SQL.Add(' SELECT PT.IDRUBSALPARTICIP AS IDRUBRICA,   RP.CODPROVDESC,  '+
                    '        PV.FLGCOMPOEREMTOTAL,  PV.FLGCOMPOESALBENEF, '+
                    '        PV.FLGCOMPOESALPART,   PV.FLGIRRF '+
                    ' FROM   PATRO PT, RUBRICAXPESS RP, PROVDESC PV  '+
                    ' WHERE  PT.IDPESSOA  = '+IntToStr(piIdPessJur)+
                    ' AND    RP.IDPESSOA  = PT.IDPESSOA '+
                    ' AND    RP.IDRUBRICA = PT.IDRUBSALPARTICIP '+
                    ' AND    RP.IDRUBRICA = PV.IDPROVENTO ');
            Open;
            if not IsEmpty
            then begin
               // Campos para Ativos - quando Mantido Parcial
               sCodProvDescMp       := FieldByName('CODPROVDESC').AsString;
               sIdRubricaMp         := FieldByName('IDRUBRICA').AsString;
               sFlgCompoeRemTotalMp := FieldByName('FLGCOMPOEREMTOTAL').AsString;
               sFlgCompoeSalBenefMp := FieldByName('FLGCOMPOESALBENEF').AsString;
               sFlgCompoeSalPartMp  := FieldByName('FLGCOMPOESALPART').AsString;
               sFlgIRRFMp           := FieldByName('FLGIRRF').AsString;

               if Trim(sFlgCompoeRemTotalMp) <> '1' then sFlgCompoeRemTotalMp := '0';
               if Trim(sFlgCompoeSalBenefMp) <> '1' then sFlgCompoeSalBenefMp := '0';
               if Trim(sFlgCompoeSalPartMp)  <> '1' then sFlgCompoeSalPartMp  := '0';
               if Trim(sFlgIRRFMP)           <> '1' then sFlgIRRFMp := '0';
            end
            else begin
               if iTipoRubrica = 1
               then sMsgErro := 'A Rubrica de Salário de Participação não foi encontrada no cadastro. Verifique.'
               else Result := True;
               Exit;
            end;
         end;
      end; // with

      //if Trim(psDataInicio) = '' then psDataInicio := DateToStr(date);                  //ClaudioR - 19962 - 16/08/2007
      if Trim(psDataInicio) = '' then psDataInicio := FormatDateTime('dd/mm/yyyy', date); //ClaudioR - 19962 - 16/08/2007

      sAnoMesInicio := Copy(psDataInicio,7,4)+'/'+Copy(psDataInicio,4,2);

      if (Trim(psDataFinal) <> '') and (StrToDate(psDataFinal) < date) Then
        sAnoMesFinal  := Copy(psDataFinal ,7,4) + '/' + Copy(psDataFinal ,4,2)
      else
        //sAnoMesFinal  := Copy(DateToStr(date) ,7,4)+'/'+Copy(DateToStr(date) ,4,2); //ClaudioR - 19962 - 16/08/2007
        sAnoMesFinal  := Copy(FormatDateTime('dd/mm/yyyy', date) ,7,4) + '/' +        //ClaudioR - 19962 - 16/08/2007
                         Copy(FormatDateTime('dd/mm/yyyy', date) ,4,2);               //ClaudioR - 19962 - 16/08/2007  

      //leocm -  03062002 -  inicio
      //desmembramento das rubricas de manutenção
      //solicitação da CRT
      sAnoMesAtual          := sAnoMesInicio;
      sSalario              := psValorProvento;
      sSalarioIntegralNoMes := sSalario;

      //verifica se o plano esta parametrizado para desmembrar
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' SELECT FLGTODASRUBMANUT,FLGRECALCMP, IDRGSALMANUTPART FROM PLANPREVPATRO  '+ // CAMILLE - 19.01.2004
                     ' WHERE  IDPESSJUR   = '+'''' + IntToStr(piIdPessJur)    +''''+
                     ' AND    IDPLANOPREV = '+'''' + IntToStr(piIdPlanoPrev)  +'''');
      qryAux.Open;

      bRecalculaSalariMP   := (qryAux.FieldByName('FLGRECALCMP').AsInteger = 1); // CAMILLE - 19.01.2004
      iIdRegraSalarioMP    := qryAux.FieldByName('IDRGSALMANUTPART').AsInteger; // CAMILLE - 19.01.2004

      //leocm - 24062002 - inicio
      //sempre criar, free ao fnal
      qryLoopHist := twwquery.create(application);
      qryLoopHist.databasename := qryaux.databasename;
      //leocm -24062002 - fim

      //se é caso de manutenção e desmembra
      if  ((psFlgSitPart = 'MA') or (psFlgSitPart = 'MP')) and
          (qryAux.FieldByName('FLGTODASRUBMANUT').AsInteger = 1 ) then
      begin
         {verifica se o participante já possúi rubricas de mantido no mês de início,
         caso não o processo nostra uma telade cadastro manual para as rubricas de mantido serem
         inseridas}
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add(' SELECT 1 FROM HISTRUBSAL  '+
                      ' WHERE  IDPESSJUR   = '+''''+IntToStr(piIdPessJur)    +''''+
                      ' AND    IDPLANOPREV = '+''''+IntToStr(piIdPlanoPrev)  +''''+
                      ' AND    IDPESSOA = '''+IntToStr(piIdPessoa)+''' '+
                      ' AND    MES   = '''+AnoMesAnterior(StrToInt(Copy(sAnoMesInicio, 6,2)), StrToInt(Copy(sAnoMesInicio, 1,4)))+''' '+  //leocm - 17102002
                      ' AND    IDMOTIVO = '''+IntToStr(prmIdMotivoSalManut)+'''  ');
         qryAux.Open;


         if qryaux.isempty then  {se vazio abre tela}
         begin
            // Gleyber - 06/06/2005 - Pendência 18536 - Início
            If frmAguarde.Visible = True
             Then Begin
               sMsgFrmAguarde := frmAguarde.lblMensagem.Caption;
               frmAguarde.Apaga;
             End
             Else sMsgFrmAguarde := '';

            frmcadrubricamanut.AbreTela(IntToStr(piIdPessJur) , IntToStr(piIdPlanoPrev) ,
                     IntToStr(piIdPessoa), sAnoMesInicio, psFlgSitPart );

            //leocm - 17102002 - inicio
            try
               frmcadrubricamanut.free;
            except end;

            If sMsgFrmAguarde <> ''
             Then frmAguarde.Mostra(sMsgFrmAguarde);
            // Gleyber - 06/06/2005 - Pendência 18536 - Fim
            //leocm - 17102002 - fim
         end;



         //leocm - 17102002 - inicio
         //retirar primeiro mês, que foi tratado acima
         {sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)),
                          StrToInt(Copy(sAnoMesAtual, 1,4)));}
         //leocm - 17102002 - fim

         //loop do segundo ao último mês
         while (sAnoMesAtual <= sAnoMesFinal) do
         begin

            qryLoopHist.close;
            qryLoopHist.SQL.Clear;
            qryLoopHist.sql.add(' SELECT H.IDPESSOA, H.IDPESSJUR, H.IDPLANOPREV,  '+ //leocm - 23102002 - incluí o IDPLANOPREV
                      '   H.IDMOTIVO, '''+sAnoMesAtual+''' MES, '''+sAnoMesAtual+''' MESCOBRANCA, H.REFERENCIA, H.IDRUBRICA, '+
                      '   H.CODPROVDESC, H.VALORINTEGRAL, H.VALORINTEGRAL, H.FLGCOMPOESALPART, H.FLGCOMPOESALBENEF, '+
                      '   H.FLGIRRF, H.SEQRUBRICA, H.FLGSRB, H.IDMODULO '+
                      'FROM HISTRUBSAL H '+
                      'WHERE H.IDPESSJUR = '''+IntToStr(piIdPessJur)+''' AND '+
                      'H.IDPESSOA = '''+IntToStr(piIdPessoa)+''' AND '+
                      'H.MES = '''+AnoMesAnterior(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)))+''' AND '+
                      'H.IDMOTIVO = '''+IntToStr(prmIdMotivoSalManut)+''' AND '+
                      'NOT EXISTS '+
                      '   (SELECT 1 FROM HISTRUBSAL HT '+
                      '    WHERE HT.IDPESSJUR = H.IDPESSJUR AND '+
                      '    HT.IDPESSOA = H.IDPESSOA AND '+
                      '    HT.MES = '''+sAnoMesAtual+''' AND '+
                      '    HT.IDMOTIVO = H.IDMOTIVO AND  '+
                      '    HT.IDRUBRICA = H.IDRUBRICA)  ');
            qryLoopHist.open;


            while not qryLoopHist.eof do
            begin

               sSalarioManutDesc := oranumero(qryLoopHist.fieldbyname('VALORINTEGRAL').AsString);

               //ReajustaSalPatro
               if not ReajustaSalPatro(qryAux,
                                sAnoMesAtual,
                                IntToStr(piIdPessJur),
                                IntToStr(piIdPlanoPrev),
                                IntToStr(piIdPessoa),
                                sDataRef,psDataInicio,
                                sSalarioManutDesc, psFlgSitPart)
               then begin
                  sMsgErro   := 'Erro no reajuste salarial para o mês : '+sAnoMesAtual;
                  Exit;
               end;

               qryAux.Close;
               qryAux.Sql.Clear;
               qryAux.Sql.Add(' INSERT INTO HISTRUBSAL '+
                         '  (IDPESSOA, IDPESSJUR, IDPATRO, IDPLANOPREV,  '+ //leocm - 23102002 - incluí o IDPLANOPREV
                                                                            // CAMILLE - 08.01.2004 - INCLUI O IDPATRO
                         '   IDMOTIVO, MES, MESCOBRANCA, REFERENCIA, IDRUBRICA, '+
                         '   CODPROVDESC, VALORPROVENTO, VALORINTEGRAL, FLGCOMPOESALPART, FLGCOMPOESALBENEF, '+
                         '   FLGIRRF, SEQRUBRICA, FLGSRB, IDMODULO ) '+
                         '   VALUES( '+qryLoopHist.fieldbyname('IDPESSOA').AsString+' , '+
                         '  '+qryLoopHist.fieldbyname('IDPESSJUR').AsString+' , '+
                         '  '+qryLoopHist.fieldbyname('IDPESSJUR').AsString+' , ');// CAMILLE - 08.01.2004 - INCLUI O IDPATRO
               // Gleyber - 05/11/2002 - Inicio
               If qryLoopHist.fieldbyname('IDPLANOPREV').AsString = ''
                  Then qryAux.Sql.Add('  NULL, ')
                  Else qryAux.Sql.Add('  '+qryLoopHist.fieldbyname('IDPLANOPREV').AsString+' , ');
               // Gleyber - 05/11/2002 - Fim
//                         '  '+qryLoopHist.fieldbyname('IDPLANOPREV').AsString+' , '+ //leocm - 23102002
               qryAux.Sql.Add('  '''+IntToStr(prmIdMotivoSalManut)+''', '+
                         '  '''+sAnoMesAtual+''', '+
                         '  '''+sAnoMesAtual+''', '+
                         '  '''+qryLoopHist.fieldbyname('REFERENCIA').AsString+''' , '+
                         '  '''+qryLoopHist.fieldbyname('IDRUBRICA').AsString+''' , '+
                         '  '''+qryLoopHist.fieldbyname('CODPROVDESC').AsString+''' , '+
                         '  '+oranumero(sSalarioManutDesc)+' , '+
                         '  '+oranumero(sSalarioManutDesc)+' , '+
                         '  '+qryLoopHist.fieldbyname('FLGCOMPOESALPART').AsString+' , '+
                         '  '+qryLoopHist.fieldbyname('FLGCOMPOESALBENEF').AsString+' , '+
                         '  '+qryLoopHist.fieldbyname('FLGIRRF').AsString+' , '+
                         '  '+qryLoopHist.fieldbyname('SEQRUBRICA').AsString+' , '+
                         '  '+qryLoopHist.fieldbyname('FLGSRB').AsString+' , '+
                         '  '+qryLoopHist.fieldbyname('IDMODULO').AsString+' )');
               try
                  qryAux.ExecSQL;
               except
                  sMsgErro := 'Erro na inserção no histórico de rubricas para o mês : '+sAnoMesAtual;
                  Exit;
               end;


               qryLoopHist.next;
            end; //while qryloophist

            if (sAnoMesAtual = sAnoMesInicio) or (sAnoMesAtual = sAnoMesFinal)
            then sSalario := sSalarioAux;
            sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
         end;

      end;

      qryLoopHist.Free;
      //leocm - 03062002 - fim



      sAnoMesAtual  := sAnoMesInicio;
      sSalario      := psValorProvento;
      sSalarioIntegralNoMes := sSalario;

(* Augusto 14/03/2004 - Ocorria problema na geração de Abono
      // CAMILLE - 14.01.2004
      // Preencher variável com o ultimo mês do ano onde a patrocinadora paga 13o.
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT  MAX(MESREFERENCIA) AS ULTIMO13DOANO FROM PARAMSAL13  '+
                     ' WHERE   IDPESSJUR     = '+IntToStr(piIdPessJur)+
                     ' AND     EXERCICIO     = '+Copy(sAnoMesAtual,1,4)+
                     ' AND     MESREFERENCIA <= '''+sAnoMesAtual+'''');
      qryAux.Open;
      if (not qryAux.IsEmpty) and (qryAux.FieldByName('ULTIMO13DOANO').AsString <> '')
      then sUltimo13DoAno := qryAux.FieldByName('ULTIMO13DOANO').AsString
      else sUltimo13DoAno := '9999/99';
      // FIM - CAMILLE - 14.01.2004
*)
      // Pede salarios de ativos para os meses gerados - (Mantido Parcial, Inscricao, Reinscricao)
      if psDataFinal   = '' Then
        //sDataFinalAux := DateToStr(date)                  //ClaudioR - 19962 - 16/08/2007
        sDataFinalAux := FormatDateTime('dd/mm/yyyy', date) //ClaudioR - 19962 - 16/08/2007
      else
        sDataFinalAux := psDataFinal;

      bPediuSalario := False;

      if (psFlgSitPart = 'MP') and (iTipoRubrica = 1) and (not bRecalculaSalariMP) // CAMILLE - 19.01.2004
      then AbreTelaInformaSalariosRetro(sIdRubricaMp, psDataInicio, sDataFinalAux, piIdPessoa, piIdPessJur, stgridresult,'',psValorProvento)
      else if (psFlgSitPart = 'AT') and (iTipoRubrica = 1) then
        AbreTelaInformaSalariosRetro(sIdRubrica, psDataInicio, sDataFinalAux, piIdPessoa, piIdPessJur, stgridresult,'',psValorProvento)
      else if psFlgIntEvento = 'AF' then begin
                   // Verificar se o parametro de envio por patrocinadora x plano é de envia valor
                   with qryAux do
                   begin
                      Close;
                      SQL.Clear;
                      SQL.Add(' SELECT CPT.FLGTPVLR, PT.IDRUBSALPARTICIP '+
                              ' FROM   PLANPREVPATRO PLP, PATRO PT, CONTPLANPATRO CPT '+
                              ' WHERE  PLP.IDPESSJUR   = '+IntToStr(piIdPessJur)+
                              ' AND    PLP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                              ' AND    PLP.IDPESSJUR   = PT.IDPESSOA '+
                              ' AND    CPT.IDPLANOPREV = PLP.IDPLANOPREV '+
                              ' AND    CPT.IDPESSJUR = PLP.IDPESSJUR '+
                              ' AND    UPPER(CPT.FLGTPVLR) = ''V'' ');
                      Open;
                      if (not IsEmpty)
                      then begin
                        bEnviaValor := True;
                        sIdRubSalarioAux := FieldByName('IdRubSalParticip').AsString;
                      end
                      else begin
                         bEnviaValor := False;
                         sIdRubSalarioAux := '-1';
                      end;
                   end;

                   // Verificar se participante possui salario apos o inicio do evento
                   sAnoMesAux     := SAnoMesPosterior(Copy(Trim(psDataInicio),7,4)+'/'+Copy(Trim(psDataInicio),4,2));
                   bPossuiSalario := VerificaRubricaMES( piIdPessJur,
                                                         piIdPessoa,
                                                         StrToInt(sIdRubSalarioAux),
                                                         sAnoMesAux,
                                                         True,
                                                         qryAux);

                   // Se o parametro de envio for "Envia Valor" e houver salário após o (mes do evento + 1)
                   // Entao pedir para o usuario digitar o salario de participacao do mes do evento até o mes mais 1
                   if bPossuiSalario and bEnviaValor and (iTipoRubrica = 1)
                   then begin
                      sDataIniSalario := psDataInicio;
                      sAnoMesAux      := SAnoMesPosterior(Copy(sDataFinalAux,7,4)+'/'+Copy(sDataFinalAux,4,2));
                      sDataFimSalario := Copy(sDataFinalAux,1,2)+'/'+Copy(sAnoMesAux,6,2)+'/'+Copy(sAnoMesAux,1,4);
                      AbreTelaInformaSalariosRetro( sIdRubrica,
                                                    sDataIniSalario, sDataFimSalario,
                                                    piIdPessoa,
                                                    piIdPessJur,
                                                    stgridresult,
                                                    'Informa Salário Retroativo',psValorProvento);
                      bPediuSalario := True;
                   end;
      end; // psFlgIntEvento = 'AF'

      iLin := 0;

      sUltimoSalarioAtivoMP  := '0';
      while (sAnoMesAtual <= sAnoMesFinal) do
      begin

         // Verificar se salário já existe neste mes
         bAtualizaSalario := False;
         sSalarioJaExistente := '0';
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT /*+ RULE */ VALORPROVENTO, VALORINTEGRAL FROM HISTRUBSAL '+
                        ' WHERE (IDPESSOA  = '+IntToStr(piIdPessoa) +')  AND '+
                        '       (IDPESSJUR = '+IntToStr(piIdPessJur)+')  AND '+
                        '       (IDRUBRICA = '+sIdRubrica           +')  AND '+
                        '       (MES       = '''+sAnoMesAtual+''')');
         qryAux.Open;
         if not qryAux.IsEmpty
         then begin
            if  (psFlgSitPart <> 'AS')
            then begin
               sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
               continue;
            end
            else begin
               // Se for salario virtual, atualizar valorprovento
               sSalarioJaExistente       := qryAux.FieldByName('VALORPROVENTO').AsString;
               sSalarioIntegralExistente := qryAux.FieldByName('VALORINTEGRAL').AsString;
               
               { Inicio Augusto 18/05/205 - Caso não seja revisão de beneficios, }
               { atualizar somente no ultimo salário pago.                       }
               If piOrigem <> 6 Then Begin
                 qryAux.Close;
                 qryAux.SQL.Clear;
                 qryAux.SQL.Add(' SELECT /*+ RULE */ MAX(MES) AS ULTIMOMES FROM HISTRUBSAL '+
                                ' WHERE (IDPESSOA  = '+IntToStr(piIdPessoa) +')  AND '+
                                '       (IDPESSJUR = '+IntToStr(piIdPessJur)+')  AND '+
                                '       (IDRUBRICA = '+sIdRubrica           +')  AND '+
                                '       (MES       >= '''+sAnoMesAtual+''') AND '+
                                '       (MES       <= '''+sAnoMesFinal+''') ' );
                 qryAux.Open;

                 if (pbAcertaSalario) and (not qryAux.IsEmpty) and
                    (qryAux.FieldByName('ULTIMOMES').AsString = sAnoMesAtual)
                 then
                   bAtualizaSalario := True
                 else begin
                    sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
                    continue;
                 end;
               End Else Begin
                 bAtualizaSalario := True
               End; { If piOrigem <> 6 Then Begin }
               { Fim Augusto 18/11/2005  }

            end;
         end;


         { Inicio Augusto 05/04/2004 }
         //sDataRef  := Copy(psDataInicio,1,2)+'/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4);
         if (StrToInt(copy(psDataInicio,1,2)) >= 29) and (StrToInt(copy(sAnoMesAtual,6,2)) = 2)
         then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
         else sDataRef := copy(psDataInicio,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);
         sDataRef  := Copy(sDataRef,1,2)+'/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4);
         { Fim Augusto 05/04/2004 }


         //leofuncef - 23052005
         If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
         Then  sDataRef := '30'+Copy(sDataRef,3,9);
         //leofuncef - fim


         Inc(iLin);

         // CAMILLE - 19.01.2004
         // Se for mantido parcial e estiver parametrizado para recalcular mensalmente, chamar regra de calculo
         if (psFlgSitPart = 'MP') and (bRecalculaSalariMP)
         then begin
            sSQL := ' SELECT PP.INSCRICAODATA AS INSCRICAODATAFUND, '+
                             ''''+sDataRef+''' AS DATAREF , '+
                             'PP.DATAINICIOMANUT AS DATAINICIOMANUT,   '+
                             'EL.NIVEL AS NIVEL,             '+
                             'EL.NIVEL AS NIVELCONF,         '+
                             '  -1  AS IDEVENTOGERADOR,   '+
                             'PP.SALMANTIDO AS VALORPROVENTO,     '+
                             ''''+sAnoMesAtual+''' AS MESREFERENCIA,     '+
                             'EL.SALTOTAL AS VALORREMTOTAL,     '+
                             '0 AS VALORRESERVA,      '+
                             'EL.IDCARGOEXT AS IDCARGOEXT,    '+
                             'EL.IDCARGOEXT AS IDCARGOCONF,   '+
                             '0 AS SOMAITEMNOPBC, '+ // SRB
                             '0 AS SOMAITEMNADIB, '+ // SRB
                    '         PF.DATANASC, PLP.IDRGSALMANUT,                                '+
                    '        EL.SALTOTAL, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,      '+
                    '        EL.TEMPOSERVANTREAL, EL.TEMPOSITESPECIAL, EL.IDSITFUNC,       '+
                    '        EL.VALORBASE1, EL.VALORBASE2, EL.VALORBASE3, EL.DATAADMISSAO, '+
                    '        EL.DATADEMISSAO,                                              '+
                    '        PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA,  '+
                    '        PP.IDSITPART, PP.IDSITPLANOPREV, EL.FLGDIRETOR                '+
                    ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF, PLANPREVPATRO PLP '+
                    ' WHERE  PP.IDPESSOA    = ' + IntToStr(piIdPessoa)   + ' AND ' +
                    '        PP.IDPESSJUR   = ' + IntToStr(piIdPessJur) + ' AND ' +
                    '        PP.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev) + ' AND ' +
                    '        PP.SEQPROPOSTA = 1  AND ' +
                    '        EL.IDPESSOA    = PP.IDPESSOA      AND ' +
                    '        EL.IDPESSJUR   = PP.IDPESSJUR     AND ' +
                    '        PF.IDPESSOA    = EL.IDPESSOA      AND ' +
                    '        PP.IDPLANOPREV = PLP.IDPLANOPREV AND ' +
                    '        PP.IDPESSJUR   = PLP.IDPESSJUR ';
            sValorRegra := RegraNumerica( IntToStr(iIdRegraSalarioMP), sSQL, bErroRegra, iIdCalculoGeral);
            sSalario    := sValorRegra;
            sSalarioIntegralNoMes := sSalario;
            sNovoSalario          := sSalario;
            sNovoSalarioAtivoMP   := sSalario;
         end;

         { Inicio Augusto 05/05/2005 - Caso processo retroativo sempre reajustar Salario }
         bRetroativo := False;
         If sAnoMesInicio < sAnoMesFinal Then Begin
           bRetroativo := True;
         End;
         { Fim Augusto 05/05/2005 }

         // Se a situacao do participante for ATIVO OU
         // Se for um evento de Afastamento e Nao Pediu Salario OU
         // Se for um evento que gere salario virtual ( eventos temporarios )
         // Entao Chamar funcao de reajuste salarial que reajusta o salario
         //       de acordo com a tabela de reajuste salarial da patrocinadora

         // Gleyber - 16/06/2005 - Pendência 22329 - Início
         sSalarioAnterior := sSalario;
         // Gleyber - 16/06/2005 - Pendência 22329 - Fim

         if (psFlgSitPart <> 'AT') or
            ((psFlgIntEvento = 'AF') and (not bPediuSalario) ) or
            ( (psFlgIntEvento = 'IN') or (psFlgIntEvento = 'DO')
            or (psFlgIntEvento = 'AC') or (psFlgIntEvento = 'OE')
            or (psFlgIntEvento = 'RM') ) //leofuncef - 02122005
         then begin
             if not ReajustaSalPatro(qryAux,
                                  sAnoMesAtual,
                                  IntToStr(piIdPessJur),
                                  IntToStr(piIdPlanoPrev),
                                  IntToStr(piIdPessoa),
                                  sDataRef,psDataInicio,
                                  sSalario, psFlgSitPart,
                                  bRetroativo) { Augusto 05/05/2005 }
             then begin
                sMsgErro   := 'Erro no reajuste salarial para o mês : '+sAnoMesAtual;
                Exit;
             end;

             // Obs: So esta fazendo pro-rata para salario reajustado por regra
             sSalarioAux           := sSalario;
             sSalarioIntegralNoMes := sSalario;
             if sAnoMesAtual = sAnoMesInicio
             then sSalario  := OraNumero(FormatFloat('#0.00',ValorProRataPrimeiro(sSalario,psDataInicio)))
             else if (sAnoMesAtual = sAnoMesFinal) and
                     (psDataFinal <> '') and
                     ( (Copy(psDataFinal,7,4)+'/'+Copy(psDataFinal,4,2)) = sAnoMesAtual )
                  then sSalario := OraNumero(FormatFloat('#0.00',ValorProRataUltimo(sSalario,psDataFinal)))
                  else sSalario := OraNumero(FormatFloat('#0.00',StrToFloat(ClienteNumero(sSalario))));
         end
         else begin
             // Se ativo pega o salario informado
             if stgridresult.Cells[2, iLin] <> ''
             then sSalario       := OraNumero(stgridresult.Cells[2, iLin]);
             sSalarioAux         := OraNumero(sSalario);
             sSalarioIntegralNoMes := OraNumero(sSalario);
             if copy(sAnoMesAtual,6,2) <> '13' then sSalarioAtivoMP := sSalario;
         end;

         // Verificar se plano possui teto
         // Se possuir, gravar salario tetado
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT IDTETOSALPART FROM PLANPREV  '+
                        ' WHERE (IDPLANOPREV = '+IntToStr(piIdPlanoPrev) +')');
         qryAux.Open;
         if not qryAux.IsEmpty
         then begin
            // Verificar se possui teto cadastrado na tabela de plano
            if (qryAux.FieldByName('IdTetoSalPart').AsString <> '') and
               (qryAux.FieldByName('IdTetoSalPart').AsInteger > 0)
            then begin
               // Se possui, buscar teto na tabela de cotacao
               iMoeCodTeto := qryAux.FieldByName('IdTetoSalPart').AsInteger;
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(' SELECT COTVALOR FROM COTACAOMOEDA '+
                              ' WHERE  (MOECODIGO = '+IntToStr(iMoeCodTeto)+') AND '+
                              '        (SUBSTR(COTMESREF,3,4)||SUBSTR(COTMESREF,1,2)<=''' + copy(sAnoMesAtual,7,4) +copy(sAnoMesAtual,4,2)+''') '+
                              ' ORDER BY COTDATA ');
               qryAux.Open;
               // Verificar se achou teto
               if not qryAux.IsEmpty
               then begin
                  qryAux.Last;
                  // Se o salario for maior que o teto, substituir o salario pelo teto
                  if ClienteNumero(sSalario) > qryAux.FieldByName('CotValor').AsString
                  then sSalario := OraNumero(FormatFloat('#0.00',qryAux.FieldByName('CotValor').AsFloat));
               end;
            end;
         end;

         if not bAtualizaSalario
         then begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' INSERT INTO HISTRUBSAL ( '+
                           ' CODPROVDESC, FLGCOMPOEREMTOTAL, FLGCOMPOESALBENEF, FLGCOMPOESALPART, '+
                           ' FLGIRRF, FLGPREVIA, FLGSRB, IDMOTIVO, IDPATRO, IDPESSJUR, IDPESSOA,  '+
                           ' IDRUBRICA, MES, MESCOBRANCA, REFERENCIA, SEQRUBRICA, VALORPROVENTO,  '+
                           ' IDMODULO, VALORINTEGRAL, FLGCONCESSAO)  '+
                           ' VALUES ( '''+sCodProvDesc+''', '+
                                          sFlgCompoeRemTotal+', '+
                                          sFlgCompoeSalBenef+', '+
                                          sFlgCompoeSalPart +', '+
                                          sFlgIRRF          +', '+
                                          '0 , '+
                                          sFlgSRB           +', '+
                                          IntToStr(prmIdMotivoContrib)+', '+
                                          IntToStr(piIdPessJur)+', '+
                                          IntToStr(piIdPessJur)+', '+
                                          IntToStr(piIdPessoa) +', '+
                                          sIdRubrica           +', '+
                                     ''''+sAnoMesAtual+''', '+
                                     ''''+sAnoMesAtual+''', '+
                                     ''' *** '', '+
                                     '1 ,'+
                                     OraNumero(sSalario)+','+
                                     IntToStr(Sistema.IdModulo)+','+
                                     OraNumero(sSalarioIntegralNoMes)+',1)');
            try
               qryAux.ExecSQL;
            except
               sMsgErro := 'Erro na inserção do '+sDescRubrica+' para o mês : '+sAnoMesAtual;
               Exit;
            end;
         end
         else begin
            qryAux.Close;
            qryAux.SQL.Clear;

            { Inicio Augusto 18/11/2005 - Caso seja revisão, sempre atualiza a HISTRUBSAL }
            If piOrigem = 6 Then Begin
              QryAux.SQL.Add(' UPDATE HISTRUBSAL SET '+
                             '   VALORPROVENTO = '+OraNumero(sSalario)+ ', '+
                             '   VALORINTEGRAL = '+OraNumero(sSalarioIntegralNoMes)+
                             ' WHERE (IDPESSOA  = '+ IntToStr(piIdPessoa)  +')  AND '+
                             '       (IDPESSJUR = '+ IntToStr(piIdPessJur) +')  AND '+
                             '       (IDRUBRICA = '+ sIdRubrica            +')  AND '+
                             '       (MES       = '''+ sAnoMesAtual +''')');
            End Else Begin

              if StrToFloat(ClienteNumero(sSalarioIntegralExistente)) -
                 (StrToFloat(ClienteNumero(sSalarioJaExistente)) + StrToFloat(ClienteNumero(sSalario)))
                 < -0.01 // salario integral < salario existente + pro_rata
              then begin
                 qryAux.SQL.Add(' UPDATE HISTRUBSAL SET VALORPROVENTO = VALORINTEGRAL '+
                             ' WHERE (IDPESSOA  = '+IntToStr(piIdPessoa) +')  AND '+
                             '       (IDPESSJUR = '+IntToStr(piIdPessJur)+')  AND '+
                             '       (IDRUBRICA = '+sIdRubrica           +')  AND '+
                             '       (MES       = '''+sAnoMesAtual+''')');
                   MsgDlg('AVISO : Valor Pró-Rata do Salário Virtual está ultrapassando o Valor Integral. Verifique.',
                          'Informação',mtInformation,[mbOk],0);
              end
              else qryAux.SQL.Add(' UPDATE HISTRUBSAL SET VALORPROVENTO = VALORPROVENTO + '+OraNumero(sSalario)+
                             ' WHERE (IDPESSOA  = '+IntToStr(piIdPessoa) +')  AND '+
                             '       (IDPESSJUR = '+IntToStr(piIdPessJur)+')  AND '+
                             '       (IDRUBRICA = '+sIdRubrica           +')  AND '+
                             '       (MES       = '''+sAnoMesAtual+''')');

            End;
            { Fim Augusto 18/11/2005 }

            try
               qryAux.ExecSQL;
            except
               sMsgErro := 'Erro na atualização do '+sDescRubrica+' para o mês : '+sAnoMesAtual;
               Exit;
            end;
         end;

         // ATUALIZAR SALARIO NA PARTPREVPLAN
         if StrToFloat(ClienteNumero(sSalarioIntegralNoMes)) > 0
         then begin
            qryAux.Close;
            qryAux.Sql.Clear;
{
            if (psFlgSitPart = 'MP')
            then sSQL := ' SALMANTIDO = '+OraNumero(sSalarioIntegralNoMes)+', SALPARTICIPACAO = '+OraNumero(sSalarioAtivoMP)
            else if (psFlgSitPart = 'MA')
            then sSQL := ' SALMANTIDO = '+OraNumero(sSalarioIntegralNoMes)
            else if (psFlgSitPart = 'AS')
                 then sSQL := ' SALAUXDOENCA    = '+OraNumero(sSalarioIntegralNoMes)
                 else sSQL := ' SALPARTICIPACAO = '+OraNumero(sSalarioIntegralNoMes);
}
            { Inicio Augusto 03/09/2002 }
            if (psFlgSitPart = 'MP') then begin
              sSQL := 'ULTSALMANTREAJ = SALMANTIDO, ULTSALREAJUSTE = SALPARTICIPACAO, ';
              sSQL := sSQL + ' SALMANTIDO = '+OraNumero(sSalarioIntegralNoMes);// ', SALPARTICIPACAO = '+OraNumero(sSalarioAtivoMP) // CAMILLE - 19.01.2004
            {end else if (psFlgSitPart = 'MA') then begin
              sSQL := ' ULTSALMANTREAJ = SALMANTIDO, SALMANTIDO = '+OraNumero(sSalarioIntegralNoMes) }
            // Gleyber - 05/10/2006 - Pendência 23457 - Início
            End else
                 If (piOrigem = 9) And (psFlgSitPart = 'AS') And (sAnoMesAtual = sAnoMesFinal)
                  Then sSQL := ' ULTSALAUXREAJ = SALAUXDOENCA, SALAUXDOENCA    = '+OraNumero(sSalarioIntegralNoMes)
            // Gleyber - 05/10/2006 - Pendência 23457 - Fim
            else if (psFlgSitPart = 'AT') then begin
              sSQL := ' ULTSALREAJUSTE = SALPARTICIPACAO, SALPARTICIPACAO = '+OraNumero(sSalarioIntegralNoMes);
            end;
            { Fim Augusto 03/09/2002 }

            // Gleyber - 16/06/2005 - Pendência 22329 - Início
            If Trim(sSQL) <> ''
             Then Begin
               qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET '+sSQL+
                              ' WHERE IDPESSJUR   = ' + IntToStr(piIdPessJur)   + ' AND ' +
                              '       IDPLANOPREV = ' + IntToStr(piIdPlanoPrev) + ' AND ' +
                              '       IDPESSOA    = ' + IntToStr(piIdPessoa)    + ' AND ' +
                              '       SEQPROPOSTA = ' + IntToStr(1) );

               try
                  qryAux.ExecSQL;
               except
                  sMsgErro := 'Erro ao atualizar salário na tabela do participante. ';
                  Exit;
               end;
             End;
            // Gleyber - 16/06/2005 - Pendência 22329 - Fim
         end;


         if ((psFlgSitPart <> 'AT') or ((psFlgIntEvento = 'AF') and (not bPediuSalario) )) and
            (Copy(sAnoMesAtual, 6,2 ) <> '13')
         then sSalarioAtivoMP := sSalario;

         {---------------------------------------------------------------------}
         // Se for o mes que a patrocinadora paga o 13o. salario, entao
         // gerar o salario de 13o. para este participante
         bCalculaSalario13 := False; // CAMILLE - 14.01.2004
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT  MESREFERENCIA, IDREGRA AS IDRGSALARIO13 FROM PARAMSAL13  '+
                         ' WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+
                         ' AND    EXERCICIO = '+Copy(sAnoMesAtual,1,4)+
                         ' AND    MESREFERENCIA = '''+sAnoMesAtual+'''');
         qryAux.Open;
         if not qryAux.IsEmpty
         then bCalculaSalario13 := True;
(* Augusto 14/03/2004 - Ocorria problema na geração de Abono
         // CAMILLE - 14.01.2003
         if (sUltimo13DoAno <> '9999/99')      and
            (sAnoMesInicio  >  sUltimo13DoAno) and
            (sAnoMesAtual   =  sAnoMesInicio)
         then begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' SELECT  MESREFERENCIA, IDREGRA AS IDRGSALARIO13 FROM PARAMSAL13  '+
                            ' WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+
                            ' AND    EXERCICIO = '+Copy(sAnoMesAtual,1,4)+
                            ' AND    MESREFERENCIA = '''+sUltimo13DoAno+'''');
            qryAux.Open;
            if not qryAux.IsEmpty
            then bCalculaSalario13 := True;
         end;
*)
         if bCalculaSalario13
         then begin
            if qryAux.FieldByName('IdRgSalario13').AsInteger <= 0
            then sSalario13 := sSalario
            else begin
               iIdRegraSal13 := qryAux.FieldByName('IdRgSalario13').AsInteger;

               if Trim(sDataAdmissao) = ''
               then begin
                  // Camille - REFER - 16.10.2000
                  // Buscar a data de admissao do participante e passar como data de inicio para
                  // o 13o.
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add(' SELECT DATAADMISSAO FROM ELEGPATRO '+
                                 ' WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+
                                 ' AND    IDPESSOA  = '+IntToStr(piIdPessoa));
                  qryAux.Open;
                  sDataAdmissao  := qryAux.FieldByName('DataAdmissao').AsString;
                  if Trim(sDataAdmissao) = '' then sDataAdmissao := psDataInicio;
               end;

               if psFlgSitPart = 'MA'
               then begin
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add(' SELECT MAX(E.DATAEVENTO) AS DATAEVENTO ,MAX(E.DATAVOLTA) AS DATAVOLTA '+
                                 ' FROM EVENTOSPREV E, SITPART SP '+
                                 ' WHERE  E.IDPESSJUR    = '+IntToStr(piIdPessJur)+
                                 ' AND    E.IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                                 ' AND    E.IDPESSOA     = '+IntToStr(piIdPessoa)   +
                                 ' AND    E.SEQPROPOSTA  = 1 '+
                                 ' AND    E.IDSITPARTNOVO = SP.IDSITPART '+
                                 ' AND    SP.FLGINTERNO = ''MA'' ');
                  qryAux.Open;

                  if qryAux.IsEmpty or (qryAux.FieldByName('DataVolta').AsString = '')
                  then sDataFinal13 := '00/00/0000'
                  else begin
                     if (StrToInt(Copy(qryAux.FieldByName('DataVolta').AsString,7,4)) > StrToInt(Copy(sAnoMesAtual,1,4)) )
                     then sDataFinal13 := '00/00/0000'
                     else sDataFinal13 := psDataFinal;
                     sDataAdmissao  := qryAux.FieldByName('DataEvento').AsString;
                     if Trim(sDataAdmissao) = '' then sDataAdmissao := psDataInicio;
                  end;
               end
               else begin
                  if Trim(psDataFinal) = ''
                  then sDataFinal13 := '00/00/0000'
                  else sDataFinal13 := psDataFinal;
               end;

               sSQLRegra     := ' SELECT '+sSalario+' AS VALORPROVENTO,       '+
                                      ''''+PreparaStrRegra(sAnoMesAtual)+''' AS MESREFERENCIA, '+
                                      '''01/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4)+''' AS DATAREF, '+ // CAMILLE - 28.11.2003
                                      ''''+PreparaStrRegra(sDataAdmissao)+''' AS DATAINICIO,    '+
                                      ''''+PreparaStrRegra(sDataFinal13) +''' AS DATAFINAL,     '+
                                      { Augusto 14/04/2004 }
                                      'EL.DATADEMISSAO, EL.IDSITFUNC, EL.FLGDIRETOR,                             '+
                                      'PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA, '+
                                      'PP.INSCRICAODATA                                           '+
                                      ', PP.IDSITPART '+ //leofuncef - 04112004

                                ' FROM   ELEGPATRO EL, PARTPREVPLAN PP                            '+
                                ' WHERE  PP.IDPESSJUR    = '+''''+IntToStr(piIdPessJur)    +''''+
                                ' AND    PP.IDPLANOPREV  = '+''''+IntToStr(piIdPlanoPrev)  +''''+
                                ' AND    PP.IDPESSOA     = '+IntToStr(piIdPessoa)              +
                                ' AND    EL.IDPESSJUR    = PP.IDPESSJUR '+
                                ' AND    EL.IDPESSOA     = PP.IDPESSOA  ';

               try
                  sSalario13 := RegraNumerica(IntToStr(iIdRegraSal13),sSQLRegra, bErroRegra,iIdCalculoGeral);
                  sSalarioIntegralNoMes := sSalario;
               except
                  sMsgErro := 'Erro na execução da regra de cálculo do 13o. salário.';
                  Exit;
               end;

               if bErroRegra
               then begin
                  sMsgErro := 'Erro na execução da regra de cálculo do 13o. salário.';
                  Exit;
               end;
            end;

            // CAMILLE - 10.12.2003
            // VERIFICAR SE 13O. JÁ EXISTE. SE EXISTIR, NÃO INCLUIR NOVAMENTE
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' SELECT VALORPROVENTO FROM HISTRUBSAL  '+
                           ' WHERE (IDPESSOA  = '+IntToStr(piIdPessoa) +')  '+
                           ' AND   (IDPESSJUR = '+IntToStr(piIdPessJur)+')  '+
                           ' AND   (IDRUBRICA = '+sIdRubrica           +')  '+
                           ' AND   (MES       = '''+Copy(sAnoMesAtual,1,4)+'/13'+''')  '+
                           ' AND   (MESCOBRANCA = '''+sAnoMesAtual     +''')  ');
            qryAux.Open;
            if (qryAux.IsEmpty) or
               ((not qryAux.IsEmpty) and (Abs(qryAux.FieldByName('VALORPROVENTO').AsFloat-StrToFloat(ClienteNumero(sSalario13))) > 0.01 ) ) // se o salario que existe for parcial, entao inserir a outra parte
            then begin
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(' INSERT INTO HISTRUBSAL ( '+
                              ' CODPROVDESC, FLGCOMPOEREMTOTAL, FLGCOMPOESALBENEF, FLGCOMPOESALPART,  '+
                              ' FLGIRRF,   FLGPREVIA, FLGSRB, IDMOTIVO, IDPATRO, IDPESSJUR, IDPESSOA, '+
                              ' IDRUBRICA, MES, MESCOBRANCA,  REFERENCIA, SEQRUBRICA, VALORPROVENTO,  '+
                              ' IDMODULO,  VALORINTEGRAL, FLGCONCESSAO)  '+
                              ' VALUES ( '''+sCodProvDesc    +''', '+
                                             sFlgCompoeRemTotal+', '+
                                             sFlgCompoeSalBenef+', '+
                                             sFlgCompoeSalPart +', '+
                                             sFlgIRRF          +', '+
                                             '0 , '+
                                             sFlgSRB           +', '+
                                             IntToStr(prmIdMotivoContrib)+', '+
                                             IntToStr(piIdPessJur)+', '+
                                             IntToStr(piIdPessJur)+', '+
                                             IntToStr(piIdPessoa) +', '+
                                             sIdRubrica           +', '+
                                        ''''+Copy(sAnoMesAtual,1,4)+'/13'+''', '+
                                        ''''+sAnoMesAtual+''', '+
                                        ''' *** '', '+
                                        '1 ,'+
                                        OraNumero(sSalario13)+','+
                                        IntToStr(Sistema.IdModulo)+','+
                                        OraNumero(sSalarioIntegralNoMes)+',1)');
               try
                  qryAux.ExecSQL;
               except
                  sMsgErro := 'Erro na inserção do '+sDescRubrica+' para o mês : '+Copy(sAnoMesAtual,1,4)+'/13';
                  Exit;
               end;
            end;

            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' UPDATE PARTPREVPLAN SET SALPARTIC13 = '+OraNumero(sSalario13)+
                           ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)+
                           ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                           ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)+
                           ' AND    SEQPROPOSTA = 1 ');

            try
               qryAux.ExecSQL;
            except
               sMsgErro := 'Erro na atualização do salário de 13º. ';
               Exit;
            end;

            sUltimoAnoMes13Gravado := Copy(sAnoMesAtual,1,4)+'/13';
         end;  //gerar salario do mes 13 }

         //============================================================================
         //=============== Repete a inclusao no HistRubSal - Quando MP (gravar os dois)
         if (psFlgSitPart = 'MP')
         then begin
             // Verificar se salário de ativo já existe neste mes
             qryAux.Close;
             qryAux.SQL.Clear;
             qryAux.SQL.Add(' SELECT /*+ RULE */ VALORPROVENTO FROM HISTRUBSAL '+
                            ' WHERE (IDPESSOA  = '+IntToStr(piIdPessoa) +')  AND '+
                            '       (IDPESSJUR = '+IntToStr(piIdPessJur)+')  AND '+
                            '       (IDRUBRICA = '+sIdRubricaMp         +')  AND '+
                            '       (MES       = '''+sAnoMesAtual+''')');
             qryAux.Open;
             if not qryAux.IsEmpty
             then begin
                // Se o mes que acabou de ser feito foi o primeiro,
                // voltar para a variavel salario o salario reajustado sem o pro-rata
                if (sAnoMesAtual = sAnoMesInicio) or (sAnoMesAtual = sAnoMesFinal)
                then sSalario := sSalarioAux;

                sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
                continue;
             end;

             // Se MP pega o salario informado para Ativo
             if stgridresult.Cells[2, iLin] <> ''
             then sSalarioAtivoMp := OraNumero(stgridresult.Cells[2, iLin])
             else sSalarioAtivoMp := OraNumero(sSalario);

             qryAux.Close;
             qryAux.SQL.Clear;
             qryAux.SQL.Add(' INSERT INTO HISTRUBSAL ( '+
                            ' CODPROVDESC, FLGCOMPOEREMTOTAL, FLGCOMPOESALBENEF, FLGCOMPOESALPART, '+
                            ' FLGIRRF, FLGPREVIA, FLGSRB, IDMOTIVO, IDPATRO, IDPESSJUR, IDPESSOA,  '+
                            ' IDRUBRICA, MES, MESCOBRANCA, REFERENCIA, SEQRUBRICA, VALORPROVENTO,  '+
                            ' IDMODULO,  VALORINTEGRAL, FLGCONCESSAO )  '+
                            ' VALUES ( '''+sCodProvDescMp+''', '+
                                           sFlgCompoeRemTotalMp+', '+
                                           sFlgCompoeSalBenefMp+', '+
                                           sFlgCompoeSalPartMp +', '+
                                           sFlgIRRFMp          +', '+
                                           '0 , '+
                                           '1 , '+  // FlgSrb
                                           IntToStr(prmIdMotivoContrib)+', '+
                                           IntToStr(piIdPessJur)+', '+
                                           IntToStr(piIdPessJur)+', '+
                                           IntToStr(piIdPessoa) +', '+
                                           sIdRubricaMp         +', '+
                                      ''''+sAnoMesAtual+''', '+
                                      ''''+sAnoMesAtual+''', '+
                                      ''' *** '', '+
                                      '1 ,'+
                                      OraNumero(sSalarioAtivoMp)+','+
                                      IntToStr(Sistema.IdModulo)+','+
                                      OraNumero(sSalarioAtivoMp)+', 1)');
             try
                qryAux.ExecSQL;
                sUltimoSalarioAtivoMP := sSalarioAtivoMP;
             except
                sMsgErro := 'Erro na inserção do Salário de Participação para o mês : '+sAnoMesAtual;
                Exit;
             end;

             // Gerar salario do mes 13
             if (Copy(sAnoMesAtual,6,2) = '12')
             then begin
                // Calcular salario 13o.
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.Add(' SELECT IDRGSALARIO13 FROM PATRO '+
                               ' WHERE  IDPESSOA = '+IntToStr(piIdPessJur));
                qryAux.Open;
                if qryAux.IsEmpty or (qryAux.FieldByName('IdRgSalario13').AsInteger <= 0)
                then sSalario13 := sSalarioAtivoMp
                else begin
                   iIdRegraSal13 := qryAux.FieldByName('IdRgSalario13').AsInteger;

                   // Camille - REFER - 16.10.2000
                   // Buscar a data de admissao do participante e passar como data de inicio para
                   // o 13o.
                   qryAux.Close;
                   qryAux.SQL.Clear;
                   qryAux.SQL.Add(' SELECT DATAADMISSAO FROM ELEGPATRO '+
                                  ' WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+
                                  ' AND    IDPESSOA  = '+IntToStr(piIdPessoa));
                   qryAux.Open;
                   sDataAdmissao  := qryAux.FieldByName('DataAdmissao').AsString;
                   if Trim(sDataAdmissao) = '' then sDataAdmissao := psDataInicio;

                   if psFlgSitPart = 'MA'
                   then begin
                      qryAux.Close;
                      qryAux.SQL.Clear;
                      qryAux.SQL.Add(' SELECT MAX(E.DATAEVENTO) AS DATAEVENTO ,MAX(E.DATAVOLTA) AS DATAVOLTA '+
                                     ' FROM EVENTOSPREV E, SITPART SP '+
                                     ' WHERE  E.IDPESSJUR    = '+IntToStr(piIdPessJur)+
                                     ' AND    E.IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                                     ' AND    E.IDPESSOA     = '+IntToStr(piIdPessoa)   +
                                     ' AND    E.SEQPROPOSTA  = 1 '+
                                     ' AND    E.IDSITPARTNOVO = SP.IDSITPART '+
                                     ' AND    SP.FLGINTERNO = ''MA'' ');
                      qryAux.Open;

                      if qryAux.IsEmpty or (qryAux.FieldByName('DataVolta').AsString = '')
                      then sDataFinal13 := '00/00/0000'
                      else begin
                         if (StrToInt(Copy(qryAux.FieldByName('DataVolta').AsString,7,4)) > StrToInt(Copy(sAnoMesAtual,1,4)) )
                         then sDataFinal13 := '00/00/0000'
                         else sDataFinal13 := psDataFinal;
                         sDataAdmissao  := qryAux.FieldByName('DataEvento').AsString;
                         if Trim(sDataAdmissao) = '' then sDataAdmissao := psDataInicio;
                      end;
                   end
                   else begin
                      if Trim(psDataFinal) = ''
                      then sDataFinal13 := '00/00/0000'
                      else sDataFinal13 := psDataFinal;
                   end;

                   sSQLRegra     := ' SELECT '+sSalarioAtivoMp+' AS VALORPROVENTO,       '+
                                          ''''+PreparaStrRegra(sAnoMesAtual)+''' AS MESREFERENCIA, '+
                                          '''30/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4)+''' AS DATAREF, '+
                                          ''''+PreparaStrRegra(sDataAdmissao)+''' AS DATAINICIO,    '+   // camille - refer - 16.10.2000
                                          ''''+PreparaStrRegra(sDataFinal13) +''' AS DATAFINAL      '+
                                    ' FROM DUAL ';
                   try
                      sSalario13 := RegraNumerica(IntToStr(iIdRegraSal13),sSQLRegra, bErroRegra,iIdCalculoGeral);
                   except
                      sMsgErro := 'Erro na execução da regra de cálculo do 13o. salário.';
                      Exit;
                   end;

                   if bErroRegra
                   then begin
                      sMsgErro := 'Erro na execução da regra de cálculo do 13o. salário.';
                      Exit;
                   end;
                end;

                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.Add(' INSERT INTO HISTRUBSAL ( '+
                               ' CODPROVDESC, FLGCOMPOEREMTOTAL, FLGCOMPOESALBENEF, FLGCOMPOESALPART, '+
                               ' FLGIRRF, FLGPREVIA, FLGSRB, IDMOTIVO, IDPATRO, IDPESSJUR, IDPESSOA,  '+
                               ' IDRUBRICA, MES, MESCOBRANCA, REFERENCIA, SEQRUBRICA, VALORPROVENTO,IDMODULO, VALORINTEGRAL, FLGCONCESSAO)  '+
                               ' VALUES ( '''+sCodProvDescMp+''', '+
                                              sFlgCompoeRemTotalMp+', '+
                                              sFlgCompoeSalBenefMp+', '+
                                              sFlgCompoeSalPartMp +', '+
                                              sFlgIRRFMp          +', '+
                                              '0 , '+
                                              '1 , '+  // FlgSRB
                                              IntToStr(prmIdMotivoContrib)+', '+
                                              IntToStr(piIdPessJur)+', '+
                                              IntToStr(piIdPessJur)+', '+
                                              IntToStr(piIdPessoa) +', '+
                                              sIdRubricaMp         +', '+
                                         ''''+Copy(sAnoMesAtual,1,4)+'/13'+''', '+
                                         ''''+sAnoMesAtual          +''', '+
                                         ''' *** '', '+
                                         '1 ,'+
                                         OraNumero(sSalario13)+','+
                                         IntToStr(Sistema.IdModulo)+','+
                                         OraNumero(sSalarioAtivoMp)+', 1)');

                try
                   qryAux.ExecSQL;
                except
                   sMsgErro := 'Erro na inserção do Salário de Participação para o mês : '+Copy(sAnoMesAtual,1,4)+'/13';
                   Exit;
                end;

                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.Add(' UPDATE PARTPREVPLAN SET SALPARTIC13 = '+OraNumero(sSalario13)+
                               ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)+
                               ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                               ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)+
                               ' AND    SEQPROPOSTA = 1 ');

                try
                   qryAux.ExecSQL;
                except
                   sMsgErro := 'Erro na atualização do salário de 13º. ';
                   Exit;
                end;

                sUltimoAnoMes13Gravado := Copy(sAnoMesAtual,1,4)+'/13';
             end;// gerar salario do mes 13
         end;

         // Se o mes que acabou de ser feito foi o primeiro,
         // voltar para a variavel salario o salario reajustado sem o pro-rata
         if (sAnoMesAtual = sAnoMesInicio) or (sAnoMesAtual = sAnoMesFinal)
         then sSalario := sSalarioAux;
         sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
      end; // while (sAnoMesAtual <= sAnoMesFinal)

      // Verificar se o ultimo mes é anterior ao mes atual,
      // ou seja, o evento já terminou.
      // Se evento já terminou Entao Gerar 13o. proporcional
      //sAnoMesHoje := Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2); //ClaudioR - 19962 - 16/08/2007
      sAnoMesHoje := Copy(FormatDateTime('dd/mm/yyyy', date),7,4) + '/' +       //ClaudioR - 19962 - 16/08/2007
                     Copy(FormatDateTime('dd/mm/yyyy', date),4,2);              //ClaudioR - 19962 - 16/08/2007

{     REVER ESTA FUNCAO - ESTA ENTRANDO EM LOOP

      if (Trim(psDataFinal) <> '')       and
         (StrToDate(psDataFinal) < date) and
         (sAnoMesFinal <= sAnoMesHoje)   and
         (sUltimoAnoMes13Gravado <> Copy(sAnoMesFinal,1,4)+'/13') and
         (iTipoRubrica = 1 )
      then begin
         sAnoMesAtual := Copy(sAnoMesFinal,1,4)+'/13';

         // Calcular salario 13o.
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT IDRGSALARIO13 FROM PATRO '+
                        ' WHERE  IDPESSOA = '+IntToStr(piIdPessJur));
         qryAux.Open;
         if qryAux.IsEmpty or (qryAux.FieldByName('IdRgSalario13').AsInteger <= 0)
         then sSalario13 := sSalario
         else begin
            iIdRegraSal13 := qryAux.FieldByName('IdRgSalario13').AsInteger;

            if Trim(sDataAdmissao) = ''
            then begin
               // Camille - REFER - 16.10.2000
               // Buscar a data de admissao do participante e passar como data de inicio para
               // o 13o.
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(' SELECT DATAADMISSAO FROM ELEGPATRO '+
                              ' WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+
                              ' AND    IDPESSOA  = '+IntToStr(piIdPessoa));
               qryAux.Open;
               sDataAdmissao  := qryAux.FieldByName('DataAdmissao').AsString;
               if Trim(sDataAdmissao) = '' then sDataAdmissao := psDataInicio;
            end;

            if psFlgSitPart = 'MA'
            then begin
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(' SELECT MAX(E.DATAEVENTO) AS DATAEVENTO ,MAX(E.DATAVOLTA) AS DATAVOLTA '+
                              ' FROM EVENTOSPREV E, SITPART SP '+
                              ' WHERE  E.IDPESSJUR    = '+IntToStr(piIdPessJur)+
                              ' AND    E.IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                              ' AND    E.IDPESSOA     = '+IntToStr(piIdPessoa)   +
                              ' AND    E.SEQPROPOSTA  = 1 '+
                              ' AND    E.IDSITPARTNOVO = SP.IDSITPART '+
                              ' AND    SP.FLGINTERNO = ''MA'' ');
               qryAux.Open;

               if qryAux.IsEmpty or (qryAux.FieldByName('DataVolta').AsString = '')
               then sDataFinal13 := '00/00/0000'
               else begin
                  if (StrToInt(Copy(qryAux.FieldByName('DataVolta').AsString,7,4)) > StrToInt(Copy(sAnoMesAtual,1,4)) )
                  then sDataFinal13 := '00/00/0000'
                  else sDataFinal13 := psDataFinal;
                  sDataAdmissao  := qryAux.FieldByName('DataEvento').AsString;
                  if Trim(sDataAdmissao) = '' then sDataAdmissao := psDataInicio;
               end;
            end
            else begin
               if Trim(psDataFinal) = ''
               then sDataFinal13 := '00/00/0000'
               else sDataFinal13 := psDataFinal;
            end;

            iUltDiaMes        := TrazUltDiaMes( StrToInt(Copy(sAnoMesFinal,6,2)),
                                                StrToInt(Copy(sAnoMesFinal,1,4)) );
            if iUltDiaMes <= 9
            then sUltDiaMes := '0'+IntToStr(iUltDiaMes)
            else sUltDiaMes := IntToStr(iUltDiaMes);

            sSQLRegra     := ' SELECT '+OraNumero(sSalario)+' AS VALORPROVENTO,       '+
                                   ''''+sAnoMesFinal +''' AS MESREFERENCIA, '+
                                   ''''+sUltDiaMes   +'/'+Copy(sAnoMesFinal,6,2)+'/'+Copy(sAnoMesFinal,1,4)+''' AS DATAREF, '+
                                   ''''+sDataAdmissao+''' AS DATAINICIO,    '+   // camille - refer - 16.10.2000
                                   ''''+sDataFinal13 +''' AS DATAFINAL      '+
                             ' FROM DUAL ';
            try
               sSalario13 := RegraNumerica(IntToStr(iIdRegraSal13),sSQLRegra, bErroRegra,iIdCalculoGeral);
            except
               sMsgErro := 'Erro na execução da regra de cálculo do 13o. salário.';
               Exit;
            end;

            if bErroRegra
            then begin
               sMsgErro := 'Erro na execução da regra de cálculo do 13o. salário.';
               Exit;
            end;
         end;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' INSERT INTO HISTRUBSAL ( '+
                           ' CODPROVDESC, FLGCOMPOEREMTOTAL, FLGCOMPOESALBENEF, FLGCOMPOESALPART,  '+
                           ' FLGIRRF,   FLGPREVIA, FLGSRB, IDMOTIVO, IDPATRO, IDPESSJUR, IDPESSOA, '+
                           ' IDRUBRICA, MES, MESCOBRANCA,  REFERENCIA, SEQRUBRICA, VALORPROVENTO,IDMODULO)  '+
                           ' VALUES ( '''+sCodProvDesc    +''', '+
                                          sFlgCompoeRemTotal+', '+
                                          sFlgCompoeSalBenef+', '+
                                          sFlgCompoeSalPart +', '+
                                          sFlgIRRF          +', '+
                                          '0 , '+
                                          sFlgSRB           +', '+
                                          IntToStr(prmIdMotivoContrib)+', '+
                                          IntToStr(piIdPessJur)+', '+
                                          IntToStr(piIdPessJur)+', '+
                                          IntToStr(piIdPessoa) +', '+
                                          sIdRubrica           +', '+
                                     ''''+Copy(sAnoMesAtual,1,4)+'/13'+''', '+
                                     ''''+sAnoMesAtual+''', '+
                                     ''' *** '', '+
                                     '1 ,'+
                                     OraNumero(sSalario13)+','+
                                     IntToStr(Sistema.IdModulo)+')');
         try
            qryAux.ExecSQL;
         except
            sMsgErro := 'Erro na inserção do Salário de Participação para o mês : '+sAnoMesAtual;
            Exit;
         end;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE PARTPREVPLAN SET SALPARTIC13 = '+OraNumero(sSalario13)+
                        ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)+
                        ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                        ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)+
                        ' AND    SEQPROPOSTA = 1 ');

         try
            qryAux.ExecSQL;
         except
            sMsgErro := 'Erro na atualização do salário de 13º. ';
            Exit;
         end;

      end;
}
      // CAMILLE - 19.01.2004
{     if iTipoRubrica = 1
      then begin
         sNovoSalario := sSalario;

         if psFlgSitPart = 'MP'
         then begin
            // Atualizar salarios
            with dtmAPrev.qry do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' UPDATE PARTPREVPLAN SET SALPARTICIPACAO = '+OraNumero(sUltimoSalarioAtivoMP)+
                       ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)+
                       ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                       ' AND    IDPESSOA    = '+IntToStr(piIdPessoa   )+
                       ' AND    SEQPROPOSTA = 1 ');
               try
                  ExecSQL;
               except
                  sMsgErro := 'Erro ao atualizar último salário de ativo.';
                  Exit;
               end;
            end;
         end;
      end;
}
   END; // FOR

   Result := True;
end; // GeraSalarioRetroativo


// Objetivo : rejustar salário de participante baseado na tabela de Reajuste da
//            Patrocinadora
function ReajustaSalPatro( qryAux           : TwwQuery ;
                           sMesAReajustar,
                           sIdPessjur,
                           sIdPlanoprev,
                           sIdPessoa,
                           sDataRef,
                           sDataEvento      : string ;
                       var sValorSal        : string;
                           psFlgIntSitPart  : string;
                           pbRetroativo     : boolean = False;  // CAMILLE - 08.07.2004
                           pbExecutaInicio  : Boolean = False ) : Boolean; // Gleyber - 25/07/2006 - Pendência 22731

var sSql,
    sValorAux,
    sIdRegraReajuste,
    sMesEvento,
    sPercentual,
    sValorSalManutTotal : string;
    bErro               : boolean;
    cAux                : char;
    rPercent,
    rValor,
    rValorAux           : double;
    iFlgTpReajuste      : integer;
    iIdRegraSalario     : longint;
    bFlgSalVirtBenef    : Boolean; //Bruno Bastos - Pend. 19451
begin
   Result := False;
   bErro  := False;

   // CAMILLE - 08.07.2004
   // CAMILLE - 24.06.2003
   // Verificar se o salario já foi reajustado. Se sim, não reajustar
   //Bruno Bastos - Pend. 19938 - if not pbRetroativo
   //Bruno Bastos - Pend. 19938 - then begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT MESULTREAJSAL , NVL(SALMANTIDO ,0) SALMANTIDO, NVL(SALPARTICIPACAO, 0) SALPARTICIPACAO '+
                  ' , FLGSALVIRTBENEF '+ //Bruno Bastos - Pend. 19451
                  ' FROM PARTPREVPLAN '+
                  ' WHERE IDPESSJUR      = '+sIdPessJur     +
                  ' AND   IDPLANOPREV    = '+sIdPlanoPrev   +
                  ' AND   IDPESSOA       = '+sIdPessoa      +
                  ' AND   SEQPROPOSTA    = 1               ');
   qryAux.Open;

   bFlgSalVirtBenef := (qryAux.FieldByName('FLGSALVIRTBENEF').AsString = '1'); // Gleyber - 16/06/2005 - Pendência 22329

   if ( ( Not pbExecutaInicio ) And { Augusto 12/06/2007 }
        ( ( not pbRetroativo ) Or
          ( qryAux.FieldbyName('MESULTREAJSAL').AsString = sMesAReajustar ) )
      )
   then begin

      if (not qryAux.IsEmpty) and
         (qryAux.FieldbyName('MESULTREAJSAL').AsString <> '') and
         (qryAux.FieldbyName('MESULTREAJSAL').AsString <> '0000/00') and
         (qryAux.FieldbyName('MESULTREAJSAL').AsString >= sMesAReajustar)
      then begin
         Result := True;
         Exit;
      end;

   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT R.IDRGREAJ, R.PERCENTUAL, R.FLGTPREAJUSTE,                      '+
                  '        PT.IDREGRACALCSALPA, PLP.IDRGSALMANUT, PLP.IDRGENQUADRAMENTO    '+
                  ' FROM   REAJSALPATRO R, PATRO PT, PLANPREVPATRO PLP                     ');

   // Gleyber - 25/07/2006 - Pendência 22731 - Início
   If pbExecutaInicio                                               
    Then qryAux.SQL.Add(' WHERE  R.MESREAJ         >= '''+sMesAReajustar+'''                     ')
    Else qryAux.SQL.Add(' WHERE  R.MESREAJ          = '''+sMesAReajustar+'''                     ');
   // Gleyber - 25/07/2006 - Pendência 22731 - Fim

   qryAux.SQL.Add(' AND    R.IDPESSJUR        = '+sIdPessjur                                +
                  ' AND    R.IDPLANOPREV      = '+sIdPlanoprev                              +
                  ' AND    PT.IDPESSOA        = R.IDPESSJUR                                '+
                  ' AND    PLP.IDPESSJUR(+)   = R.IDPESSJUR                                '+
                  ' AND    PLP.IDPLANOPREV(+) = '+sIdPlanoPrev ); 
   qryAux.Open;
   if qryAux.IsEmpty
   then begin
      Result := true;
      Exit;
   end;

   sIdRegraReajuste := Trim(qryaux.FieldByName('IdRgReaj').AsString);
   sPercentual      := Trim(qryaux.FieldByName('Percentual').AsString);
   iFlgTpReajuste   := qryaux.FieldByName('FLGTPREAJUSTE').AsInteger;

   if (psFlgIntSitPart = 'MA')
   then iIdRegraSalario := qryaux.FieldByName('IDRGSALMANUT').AsInteger
   else if (psFlgIntSitPart = 'AS')
        then iIdRegraSalario := qryaux.FieldByName('IDRGENQUADRAMENTO').AsInteger
        else iIdRegraSalario := qryaux.FieldByName('IDREGRACALCSALPA').AsInteger;

   if (sIdRegraReajuste = '') and (sPercentual = '') and (iFlgTpReajuste = 0)
   then begin
      Result := True;
      Exit;
   end;

   { Inicio Augusto 06/06/2005 }
   { Passei para o final da rotina para atualizar o Salario }
   // CAMILLE - 24.06.2003
   //qryAux.Close;
   //qryAux.SQL.Clear;
   //qryAux.SQL.Add(' UPDATE PARTPREVPLAN     '+
   //               ' SET    MESULTREAJSAL  = '''+sMesAReajustar+''''+
   //               ' WHERE  IDPESSJUR      = '+sIdPessJur   +
   //               ' AND    IDPLANOPREV    = '+sIdPlanoPrev +
   //               ' AND    IDPESSOA       = '+sIdPessoa    +
   //               ' AND    SEQPROPOSTA    = 1 ');
   //qryAux.ExecSql;
   { Fim Augusto 06/06/2005 }

   //leocm -18062002 - inicio - para FCRT
   sValorSalManutTotal := '0';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT /*+ RULE */ SALMANTIDO FROM PARTPREVPLAN '+
                  ' WHERE (IDPESSOA  = '+sIdPessoa+')  AND '+
                  '       (IDPESSJUR = '+sIdPessJur+') AND '+
                  '       (IDPLANOPREV = '+sIdPlanoPrev+' )');
   try
      qryAux.Open;

      if not qryaux.isempty then
      sValorSalManutTotal := qryaux.fieldbyname('SALMANTIDO').AsString;
   except
   end;

   if iFlgTpReajuste = 0 // Reajuste Sobre Salário
   then begin
      sSQL := ' SELECT '''+sMesAReajustar+''' AS ANOMESREF,  '+
              ' '''+sDataRef+''' AS DATAREF,          '+
              sIdPessJur + ' AS IDPESSJUR,            '+
              OraNumero(sValorSal)+' AS VALORATUAL,      '+
              OraNumero(sValorSal)+' AS VALORPROVENTO,   '+
              OraNumero(sValorSal)+' AS VALORREFERENCIA, '+
              '       EL.IDCARGOEXT, EL.NIVEL,           '+
              '       EL.VALORBASE1, EL.VALORBASE2, EL.VALORBASE3, '+
              '       EL.VALORBASE4, EL.VALORBASE5, EL.VALORBASE6,  '+  //leocm - 13112002
              '       SP.FLGINTERNO, PP.MESULTREAJSAL    '+
              '       , '+Oranumero(sValorSalManutTotal)+' SALMANUTTOTAL '+ //leocm - 18062002 - PARA FCRT
              ' FROM  ELEGPATRO EL, PARTPREVPLAN PP, SITPART SP    '+
              ' WHERE (PP.IDPESSJUR     = '+sIdPessJur   +')'+
              ' AND   (PP.IDPLANOPREV   = '+sIdPlanoPrev +')'+
              ' AND   (PP.IDPESSOA      = '+sIdPessoa    +')'+
              ' AND   (PP.SEQPROPOSTA   = 1'             +')'+
              ' AND   (PP.IDPESSJUR     = EL.IDPESSJUR ' +')'+
              ' AND   (PP.IDPESSOA      = EL.IDPESSOA '  +')'+
              ' AND   (PP.IDSITPART     = SP.IDSITPART ' +')'+
              ' AND   (PP.FLGDESATIVADO = 0'             +')';
      try
         //se o identificador da regra estiver preenchido então
         //executa a regra
         //senão apenas soma com um percentual do mesmo salário
         if sIdRegraReajuste <> '' then
         begin
            sValorAux := RegraNumerica(sIdRegraReajuste, sSQL, bErro, iIdCalculoGeral );
         end
         else if sPercentual <> ''
              then begin
                 rPercent  := StrToFloat(ClienteNumero(sPercentual))/100;
                 rValor    := strtofloat(ClienteNumero(sValorSal));
                 rValorAux := rValor + (rValor * rPercent);
                 sValorAux := FloatToStr(rValorAux);
              end;

         sValorAux := truncaround(oranumero(sValorAux),2);
         sValorSal := sValorAux;
      except
         exit;
      end;
   end
   else begin // Reajuste Sobre Cargo
              // Neste caso, o cargo já deverá estar reajustado e o sistema chamará a regra de cálculo do salário
      if iIdRegraSalario <= 0
      then begin
         Result := True;
         Exit;
      end;

{
              '                 EL.IDSITFUNC      AS IDSITFUNATUAL,  '+
              '                 EL.IDSITFUNC      AS IDSITFUNCNOVO,  '+
              '                 PP.IDSITPLANOPREV AS IDSITPLANONOVO, '+
              '                 PP.IDSITPART      AS IDSITPARTNOVO,  '+
              ''''+DateToStr(date)+'''            AS DATAREF         '+

}

      sSQL := ' SELECT PP.INSCRICAODATA             AS INSCRICAODATAFUND,                                          '+
                       ''''+Trim(sDataRef)    +'''  AS DATAREF,                                                    '+
                       ''''+sMesAReajustar    +'''  AS MESREFERENCIA,                                              '+
              '        PP.DATAINICIOMANUT           AS DATAINICIOMANUT,                                            '+
              '        EL.NIVEL                     AS NIVEL,                                                      '+
              '        EL.NIVEL                     AS NIVELCONF,                                                  '+
              '        -1                           AS IDEVENTOGERADOR,                                            '+
              '        DECODE('''+psFlgIntSitPart+''',''MA'', PP.SALMANTIDO, PP.SALPARTICIPACAO) AS VALORPROVENTO, '+
              '        EL.SALTOTAL                  AS VALORREMTOTAL,                                              '+
              '        0                            AS VALORRESERVA,                                               '+
              '        EL.IDCARGOEXT                AS IDCARGOEXT,                                                 '+
              '        EL.IDCARGOEXT                AS IDCARGOCONF,                                                '+
              '        0                            AS SOMAITEMNOPBC,                                              '+ // SRB
              '        0                            AS SOMAITEMNADIB,                                              '+ // SRB
              '        PF.DATANASC                  AS DATANASC,                                                   '+
              '        PF.SEXO                      AS SEXO,                                                       '+
              '        SP.FLGINTERNO                AS FLGINTERNO,                                                 '+
              '        PF.DATAMORTE                 AS DATAMORTE,                                                  '+
              '        EL.SALTOTAL                  AS SALTOTAL,                                                   '+
              '        EL.TEMPOSERVANTERIOR         AS TEMPOSERVANTERIOR,                                          '+
              '        EL.TEMPONAOCREDITADO         AS TEMPONAOCREDITADO,                                          '+
              '        EL.TEMPOSERVANTREAL          AS TEMPOSERVANTREAL,                                           '+
              '        EL.TEMPOSITESPECIAL          AS TEMPOSITESPECIAL,                                           '+
              '        EL.TEMPOSERVTOTAL            AS TEMPOSERVTOTAL,                                             '+
              '        EL.TEMPOSERVTOTMES           AS TEMPOSERVTOTMES,                                            '+
              '        EL.TEMPOSERVTOTDIA           AS TEMPOSERVTOTDIA,                                            '+
              '        EL.IDSITFUNC                 AS IDSITFUNC,                                                  '+
              '        EL.VALORBASE1                AS VALORBASE1,                                                 '+
              '        EL.VALORBASE2                AS VALORBASE2,                                                 '+
              '        EL.VALORBASE3                AS VALORBASE3,                                                 '+
              '        EL.DATAADMISSAO              AS DATAADMISSAO,                                               '+
              '        EL.DATADEMISSAO              AS DATADEMISSAO,                                               '+
              '        PP.IDPESSOA                  AS IDPESSOA,                                                   '+
              '        PP.IDPESSOA                  AS IDTITULAR,                                                  '+
              '        PP.IDPESSJUR                 AS IDPESSJUR,                                                  '+
              '        PP.IDPLANOPREV               AS IDPLANOPREV,                                                '+
              '        PP.INSCRICAODATA             AS INSCRICAODATA,                                              '+
              '        PP.INSCRICAOTIPO             AS INSCRICAOTIPO,                                              '+
              '        PP.IDSITPART                 AS IDSITPART,                                                  '+
              '        PP.IDSITPLANOPREV            AS IDSITPLANOPREV,                                             '+
              '        EL.IDSITFUNC                 AS IDSITFUNCATUAL,                                             '+
              '        EL.IDSITFUNC                 AS IDSITFUNCNOVO,                                              '+
              '        PP.IDSITPLANOPREV            AS IDSITPLANONOVO,                                             '+
              '        PP.IDSITPART                 AS IDSITPARTNOVO,                                              '+
              '        EL.FLGDIRETOR                AS FLGDIRETOR                                                  '+
              ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF, PLANPREVPATRO PLP, SITPART SP               '+
              ' WHERE  PP.IDPESSOA    = ' + OraNumero(sIdPessoa)                                                    +
              ' AND    PP.IDPESSJUR   = ' + sIdPessJur                                                              +
              ' AND    PP.IDPLANOPREV = ' + sIdPlanoPrev                                                            +
              ' AND    PP.SEQPROPOSTA = 1 '                                                                         +
              ' AND    EL.IDPESSOA    = PP.IDPESSOA                                                                '+
              ' AND    EL.IDPESSJUR   = PP.IDPESSJUR                                                               '+
              ' AND    PF.IDPESSOA    = EL.IDPESSOA                                                                '+
              ' AND    PP.IDPLANOPREV = PLP.IDPLANOPREV                                                            '+
              ' AND    PP.IDPESSJUR   = PLP.IDPESSJUR                                                              '+
              ' AND    PP.IDSITPART   = SP.IDSITPART                                                               ';

      sValorAux := RegraNumerica(IntToStr(iIdRegraSalario),     sSQL, bErro, iIdCalculoGeral );

      try
         sValorAux := truncaround(oranumero(sValorAux),2);
         sValorSal := sValorAux;
      except
         Exit;
      end;

   end;

   if berro then  exit;

   { Inicio Augusto 06/06/2005 }
   { Atualizar o Mes de Reajuste e Salario de Mantido caso seja }
   If bErro = False Then Begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' UPDATE PARTPREVPLAN  SET');
     // Gleyber - 16/06/2005 - Pendência 22329 - Início
     If (psFlgIntSitPart = 'MA')
      Then qryAux.SQL.Add(' ULTSALMANTREAJ = SALMANTIDO,  SALMANTIDO = '+OraNumero(sValorSal)+',')
      Else If (psFlgIntSitPart = 'AS') And (bFlgSalVirtBenef)
            Then qryAux.SQL.Add(' ULTSALAUXREAJ = SALAUXDOENCA, SALAUXDOENCA = '+OraNumero(sValorSal)+','); //Bruno Bastos - Pend. 19451 
     // Gleyber - 16/06/2005 - Pendência 22329 - Fim
     qryAux.SQL.Add('        MESULTREAJSAL  = '''+sMesAReajustar+''''+
                    ' WHERE  IDPESSJUR      = '+sIdPessJur   +
                    ' AND    IDPLANOPREV    = '+sIdPlanoPrev +
                    ' AND    IDPESSOA       = '+sIdPessoa    +
                    ' AND    SEQPROPOSTA    = 1 ');
     qryAux.ExecSql;
   End;
   { Fim Augusto 06/06/2005 }

   Result := True;
end; // ReajustaSalPatro

function EstornaContribuicaoBANCO (CtrlDocumento      : TCtrlDocumento;  // CAMILLE - 08.10.2004
                                   CtrlLancamento     : TCtrlLancamento; // CAMILLE - 14.10.2004
                                   iCodDocumento      : longInt;
                                   qry                : TwwQuery;
                                   qryAux             : TwwQuery;
                                   psAnoMesReferencia : string;
                               var sMsgErro           : string) : boolean;
var
//    liEmpresa    : longint;
//    liPeriodo    : longint;
//    liExercicio  : longint;
//    liResult     : longint;
    bPodeExcluir : boolean;
    sData        : string;
    sNoDocumento : string;

    // Gleyber - 10/10/2006 - Pendência 23450 - Início
    bContabilizaNoEnvio : Boolean;
    iIdPessoa,
    iIdPessjur,
    iIdPlanoPrev,
    iIdContribuicao,
    iCodSubConta,
    iPlnCodigo,
    iFlgDevolucao          : Longint;
    sAux1,
    sAux2,
    sCodCentroCusto,
    sPlaContaC,
    sPlaContaD,
    sPlaContaDevol,
    sPlaContaAux,
    sCodSubConta,
    sCodPortForma,
    sCodTipRecDes,
    sCodTipDesembDevol,
    sCodCentroRespon,
    sCodUnidNegoc,
    sIdPlanPrevContab,
    sQryCodCentroCusto,
    sQryPlaContaC,
    sQryPlaContaD,
    sQryPlaContaDevol,
    sQryCodSubConta,
    sQryCodPortForma,
    sTipCodigo,
    sCodTipDoc,
    sQryCodTipRecDes,
    sQryCodTipDesembDevol,
    sQryCodCentroRespon,
    sQryUnidNegoc,
    sQryIdPlanPrevContab,
    sTipoReceita,
    sTipoDebCre,
    sTP01Rec,
    sTP01Deb,
    sAnoMesReferencia,
    sInscricaoNumero,
    sNrDocumento           : String;
    cRecPag                : char;
    dValorAEstornar        : Double;
    // Gleyber - 10/10/2006 - Pendência 23450 - Fim
begin
   Result := False;

   // CAMILLE - 08.07.2004
   // VERIFICAR SE O DOCUMENTO FOI CONTABILIZADO. SE FOI E O SISTEMA NÃO ESTIVER
   // INTEGRADO COM A CONTABILIDADE, ENVIAR MENSAGEM DE ERRO
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT L.PLNCODIGO, D.RECPAG                    '+
               ' FROM   LANCTODOCUM L, DOCUMENTO D               '+
               ' WHERE  D.CODDOCUMENTO = '+IntToStr(iCodDocumento)+
               ' AND    L.CODDOCUMENTO = D.CODDOCUMENTO          '+
               ' AND    L.OPERACAO     = ''2''                   ');

   qry.Open;
   if (not qry.IsEmpty) and
      (qry.FieldByName('PLNCODIGO').AsInteger > 0) and
      (not prmIntegraContab)
   then begin
      sMsgErro := 'O Documento No. '+IntToStr(iCodDocumento)+' foi contabilizado.'+#13+
                  'Para estorná-lo é preciso que o sistema esteja integrado com o sistema de Contabilidade.';
      Exit;
   end;

   if (not qry.IsEmpty) and
      (qry.FieldByName('RECPAG').AsString = 'R') and
      (not prmIntegraCAR)
   then begin
      sMsgErro := 'O Documento No. '+IntToStr(iCodDocumento)+' foi lançado no Contas a Receber.'+#13+
                  'Para estorná-lo é preciso que o sistema esteja integrado com o sistema de Contas a Receber.';
      Exit;
   end;

   if (not qry.IsEmpty) and
      (qry.FieldByName('RECPAG').AsString = 'P') and
      (not prmIntegraCAP)
   then begin
      sMsgErro := 'O Documento No. '+IntToStr(iCodDocumento)+' foi lançado no Contas a Pagar.'+#13+
                  'Para estorná-lo é preciso que o sistema esteja integrado com o sistema de Contas a Pagar.';
      Exit;
   end;
   // CAMILLE - 08.07.2004 - FIM


   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT L.PLNCODIGO, L.DATALANCTO,  L.NUMLANCTO, '+
               '        D.STATUS,    D.NODOCUMENTO, P.PLNEFETIVADO'+
               ' FROM   LANCTODOCUM L, DOCUMENTO D, PLANILHA P '+
               ' WHERE  D.CODDOCUMENTO = '+IntToStr(iCodDocumento)+
               ' AND    L.CODDOCUMENTO = D.CODDOCUMENTO '+
               ' AND    L.PLNCODIGO    = P.PLNCODIGO(+) ');
   qry.Open;

   //leocm - 28102002 - inicio
   if qry.isempty then
   begin
      result:= true;
      exit;
   end;
   //leocm - 28102002 - fim

   sNoDocumento := qry.FieldByName('NoDocumento').AsString;

   // Verificar parametro contabil de estorno/exclusao
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT PACESTORNA FROM PARAMCONTAB '+
                  ' WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   qryAux.Open;
   if qryAux.IsEmpty
   then begin
     sMsgErro := 'Documento Nº '+sNoDocumento+': Parâmetros contábeis necessários ao estorno não encontrados. ';
     Exit;
   end;
   bPodeExcluir := (qryAux.FieldByName('PACESTORNA').AsString <> 'S');
   // liEmpresa := Sistema.IdEmpresa;


   while not qry.Eof do
   begin

      // CAMILLE - 14.10.2004
      // A ROTINA DE LANCAMENTO NA CONTABILIDADE 3 CAMADAS JÁ TESTA O PERIODO
      // LOGO NÃO HÁ MAIS NECESSIDADE DE TESTAR O PERIODO CONTABIL FORA DA ROTINA
      // POR ISSO COMENTEI O CÓDIGO ABAIXO
      // Carrega Variáveis PERIODO e EXERCICIO
      // liEmpresa := 0;
      // liPeriodo := 0;
      // liResult := TestaPeriodo(False,dtmBaseDados.dbBaseDados.DatabaseName,
      //                         DateToStr(Date),//leocm - 09072002
      //                         //qry.FieldByName('DataLancto').AsString,
      //                         IntToStr(Sistema.IdModulo),
      //                          liExercicio, liPeriodo, liEmpresa,
      //                          sMsgErro);

      // Verificar periodo na data de lancamento
      // Verificar status do documento (tem que estar 0 ´= nao pago)
      // Verificar plnefetivado da planilha
      // Se periodo nao bloqueado para integracao
      // Entao Se pode Excluir e PlnEfetivado = N
      //       Entao ExcluiLanc
      //       Senao EstornaLanc
      // Senao Inicio
      //       Testar Periodo Atual
      //       Se periodo atual nao bloqueado
      //       Entao EstornaLanc
      //       Senao MsgErro = 'Nao é possível estornar lançamento pois
      //                        periodos estao bloqueados'
      // Final

      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' UPDATE LANCTODOCUM SET PLNCODIGO = NULL '+
                 ' WHERE PLNCODIGO = '''+qry.FieldByName('PlnCodigo').AsString+''' '); //leocm - 28102002 - coloquei mais plics
                                                                                       //para casos onde a planilha está nula
         try
            ExecSQL;
         except
           sMsgErro := 'Documento Nº '+sNoDocumento+': Erro na atualização do Lançamento.';
           Exit;
         end;
      end;

      if ((bPodeExcluir) and (qry.FieldByName('PlnEfetivado').AsString = 'N')) or
         (IntegraBack.Contabilidade = 'N')
      then begin
         // Gleyber - 06/11/2006 - Pendência 23687
         // Retirado o comentário abaixo.
         try
            if not CtrlLancamento.ExcluiLancaContab( Sistema.IdUsuario,                      // iUsuario
                                                     qry.FieldByName('PlnCodigo').AsInteger, // iPlnCodigo
                                                     Sistema.IdModulo,                       // iModuloOrigem
                                                     0,                                      // iNumLan
                                                     Sistema.UsaPlanoPatro,                  // bUsaPlanoPatro
                                                     True                                    // bExcluiPlanilha
                                                    )
            then begin
               sMsgErro := 'Documento Nº '+sNoDocumento+': Erro na exclusão do lançamento['+CtrlLancamento.MessageInfo+']';
               Exit;
            end;

            //ExcluiLanc(False, qry.FieldByName('PlnCodigo').AsInteger,
            //           'BaseDados','16',IntegraBack.Plano,liEmpresa,
            //           Sistema.IdUsuario,
            //           True, //ExcluiPlanil
            //           0, // qry.FieldByName('NumLancto').AsInteger,
            //           IntegraBack.MascaraPlano);
         except
           sMsgErro := 'Documento Nº '+sNoDocumento+': Erro na exclusão do lançamento['+CtrlLancamento.MessageInfo+']';
           Exit;
         end;
      end
      else begin
         try
            if qry.FieldByName('PlnCodigo').AsInteger > 0 then //leofuncef - 05112004 - caso não tenha integrado com contabilidade, pelo menos não no envio
            begin
            
               if not CtrlLancamento.EstornaLancaContab( Sistema.IdUsuario,                      // iUsuario
                                                         qry.FieldByName('PlnCodigo').AsInteger, // iPlnCodigo
                                                         Sistema.IdModulo,                       // iModuloOrigem
                                                         Sistema.IdEmpresa,                      // iEmpresa
                                                         Sistema.UsaPlanoPatro,                  // bUsaPlanoPatro
                                                         //DateToStr(Date)                       // sDataEstorno   //ClaudioR - 19962 - 16/08/2007
                                                         FormatDateTime('dd/mm/yyyy', Date)      // sDataEstorno   //ClaudioR - 19962 - 16/08/2007
                                                        )
               then begin
                  sMsgErro := 'Documento Nº '+sNoDocumento+': Erro no estorno do lançamento['+CtrlLancamento.MessageInfo+']';
                  Exit;
               end;

            end;
            //EstornaLanc(False,qry.FieldByName('PlnCodigo').AsInteger,
            //            'BaseDados',
            //            DateToStr(Date),//leocm - 09072002
            //             //qry.FieldByName('DataLancto').AsString,
            //            liExercicio,liPeriodo,liEmpresa,IntegraBack.MascaraPlano);
         except
            sMsgErro := 'Documento Nº '+sNoDocumento+': Erro no estorno do lançamento['+CtrlLancamento.MessageInfo+']';
            Exit;
         end;
      end;

      qry.Next;
   end;

   //leocm - 24102002 - inicio
   //deleta fora do loop
   if qry.FieldByName('Status').AsString = '2'
   then begin
      sMsgErro := 'Documento Nº '+sNoDocumento+': documento já baixado no Contas a Receber e não pode ser estornado.';
      Exit;
   end;

   // CAMILLE - 22.06.2004
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE MSGCNABVERSO WHERE CODDOCUMENTO = '+IntToStr(iCodDocumento));
      try
         ExecSQL;
      except
         sMsgErro := 'Documento Nº '+sNoDocumento+': erro ao excluir mensagens a incluir em verso de boleto.';
         Exit;
      end;
   end;

   //== Exclui do documento do Contas a receber  - rosana - serpros - 18/09/99
   try
      // CAMILLE - 08.10.2004
      // Documento.Excluir(qryAux, iCodDocumento, 0);
      CtrlDocumento.Prepare(opDocumento,odlEfetivo);
      CtrlDocumento.IdEspAcesso  := Sistema.IdEspAcesso; // CAMILLE - 08.10.2004
      CtrlDocumento.IdUsuario    := Sistema.IdUsuario;   // CAMILLE - 08.10.2004
      CtrlDocumento.CodDocumento := iCodDocumento;
      if not CtrlDocumento.Delete
      then begin
         sMsgErro := 'Documento Nº '+sNoDocumento+': Erro no estorno do Documento.';
         Exit;
      end;
   except
      sMsgErro := 'Documento Nº '+sNoDocumento+': Erro no estorno do Documento.';
      Exit;
   end;
   //leocm - 24102002 - fim

   Result := True;
end; //EstornaContribuicaoBANCO

// CAMILLE - 05.04.2002
function EstornaPlanilhaContabil ( CtrlLancamento : TCtrlLancamento;
                                   iPlnCodigo     : longInt;
                                   qryAux         : TwwQuery;
                                   var sMsgErro   : string) : boolean;
var
//    liEmpresa, liPeriodo, liExercicio, liResult : longint;
    bPodeExcluir : boolean;
    sPlnEfetivado,
    sData        : string;
begin
   Result := False;
   // Verificar parametro contabil de estorno/exclusao
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT PLNEFETIVADO, PLNDATDIA FROM PLANILHA '+
                  ' WHERE  PLNCODIGO = '+IntToStr(iPlnCodigo));
   qryAux.Open;

   if qryAux.IsEmpty
   then begin
      Result := True;
      Exit;
   end;
   sPlnEfetivado := qryAux.FieldByName('PLNEFETIVADO').AsString;
   sData         := qryAux.FieldByName('PLNDATDIA').AsString;

   // Verificar parametro contabil de estorno/exclusao
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT PACESTORNA FROM PARAMCONTAB '+
                  ' WHERE  IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   qryAux.Open;
   if qryAux.IsEmpty
   then begin
     sMsgErro := 'Planilha Nº '+IntToStr(iPlnCodigo)+': Parâmetros contábeis necessários ao estorno não encontrados. ';
     Exit;
   end;
   bPodeExcluir := (qryAux.FieldByName('PACESTORNA').AsString <> 'S');

   // CAMILLE - 14.10.2004
   // A ROTINA DE LANCAMENTO NA CONTABILIDADE 3 CAMADAS JÁ TESTA O PERIODO
   // LOGO NÃO HÁ MAIS NECESSIDADE DE TESTAR O PERIODO CONTABIL FORA DA ROTINA
   // POR ISSO COMENTEI O CÓDIGO ABAIXO

   // Carrega Variáveis PERIODO e EXERCICIO
{   liEmpresa    := Sistema.IdEmpresa;
   liPeriodo := 0;
   liResult := TestaPeriodo( False,
                             dtmBaseDados.dbBaseDados.DatabaseName,
                             sData,
                             IntToStr(Sistema.IdModulo),
                             liExercicio, liPeriodo, liEmpresa,
                             sMsgErro);
}
   // Verificar periodo na data de lancamento
   // Verificar status do documento (tem que estar 0 ´= nao pago)
   // Verificar plnefetivado da planilha
   // Se periodo nao bloqueado para integracao
   // Entao Se pode Excluir e PlnEfetivado = N
   //       Entao ExcluiLanc
   //       Senao EstornaLanc
   // Senao Inicio
   //       Testar Periodo Atual
   //       Se periodo atual nao bloqueado
   //       Entao EstornaLanc
   //       Senao MsgErro = 'Nao é possível estornar lançamento pois
   //                        periodos estao bloqueados'
   // Final
   if ((bPodeExcluir) and (sPlnEfetivado = 'N')) or (IntegraBack.Contabilidade = 'N')
   then begin
      try
         if not CtrlLancamento.ExcluiLancaContab( Sistema.IdUsuario,                      // iUsuario
                                                  iPlnCodigo,                             // iPlnCodigo
                                                  Sistema.IdModulo,                       // iModuloOrigem
                                                  0,                                      // iNumLan
                                                  Sistema.UsaPlanoPatro,                  // bUsaPlanoPatro
                                                  True                                    // bExcluiPlanilha
                                                 )
         then begin
            sMsgErro := 'Planilha Nº '+IntToStr(iPlnCodigo)+': Erro na exclusão do lançamento['+CtrlLancamento.MessageInfo+']';
            Exit;
         end;

         //ExcluiLanc(False, iPlnCodigo,
         //           'BaseDados','16',IntegraBack.Plano,liEmpresa,
         //           Sistema.IdUsuario,
         //           True, //ExcluiPlanil
        //            0,
        //            IntegraBack.MascaraPlano);
      except
        sMsgErro := 'Planilha Nº '+IntToStr(iPlnCodigo)+': Erro na exclusão do lançamento.';
        Exit;
      end;
   end
   else begin
      try
         if iPlnCodigo > 0 then //leofuncef - 05112004 - caso não tenha integrado com contabilidade, pelo menos não no envio
         begin

            if not CtrlLancamento.EstornaLancaContab( Sistema.IdUsuario,                      // iUsuario
                                                      iPlnCodigo,                             // iPlnCodigo
                                                      Sistema.IdModulo,                       // iModuloOrigem
                                                      Sistema.IdEmpresa,                      // iEmpresa
                                                      Sistema.UsaPlanoPatro,                  // bUsaPlanoPatro
                                                      sData                                   // sDataEstorno
                                                     )
            then begin
               sMsgErro := 'Planilha Nº '+IntToStr(iPlnCodigo)+': Erro no estorno do lançamento['+CtrlLancamento.MessageInfo+']';
               Exit;
            end;

         end;

         //EstornaLanc(False, iPlnCodigo,
         //            'BaseDados',sData,
         //            liExercicio,liPeriodo,liEmpresa,IntegraBack.MascaraPlano);
      except
        sMsgErro := 'Planilha Nº '+IntToStr(iPlnCodigo)+': Erro no estorno do lançamento['+CtrlLancamento.MessageInfo+']';
        Exit;
      end;
   end;

   Result := True;
end; // EstornaPlanilhaContabil

// rosana - serpros - 02/09/99
function BuscaDescCobranca(piIdContribuicao, piIdPlanoPrev:Integer; qryAux:Twwquery):string;
begin
   result := 'Contribuição. ';

   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' select FLGPAGADOR from contprev '+
                  ' where  idplanoprev    = '+IntToStr(piIdPlanoPrev) +
                  ' and    idcontribuicao = '+IntToSTr(piIdContribuicao) );
   qryAux.Open;
   if not qryAux.IsEmpty
   then begin

      //leocbs - 2011 - mudei as descrições
      case qryAux.FieldByName('FLGPAGADOR').AsString[1] of
      'C' : result := 'Contrib.(Participante)';
      'P' : result := 'Contrib.(Patroc. por Participante)';
      'E' : result := 'Contrib.(Exclusiva Patrocinadora)';
      end;
   end;
   qryAux.Close;
end;

function PedeDadosEnvioBanco( var psDataCobranca : string;
                              var piCodPortForma : longint;
                                  cRecPag        : string ) : boolean;
begin
   Result := False;
   psDataCobranca := '';
   piCodPortForma := -1;
   frmVlrDtDiverg := TfrmVlrDtDiverg.Create(Application);

   with frmVlrDtDiverg do
   begin
      qryPortadorForma.Close;
      qryPortadorForma.ParamByName('RecPag').AsString := cRecPag;
      qryPortadorForma.Open;

      if Trim(cRecpag) = 'R'
      then begin
         Caption := 'Parâmetros para Cobrança da Divergência';
         lblData.Caption := 'Data da Cobrança';
         lblForma.Caption := 'Forma da Cobrança';
      end
      else begin
         Caption := 'Parâmetros para Pagamento da Divergência';
         lblData.Caption := 'Data do Pagamento';
         lblForma.Caption := 'Forma do Pagamento';
      end;

      ShowModal;

      //psDataCobranca := datetostr(dtDataCobranca.Date);                  // ClaudioR - 19962 - 16/08/2007
      psDataCobranca := FormatDateTime('dd/mm/yyyy', dtDataCobranca.Date); // ClaudioR - 19962 - 16/08/2007

      piCodPortForma := qryPortadorForma.FieldByName('CodPortForma').AsInteger;
      qryPortadorForma.Close;
      if ModalResult <> mrOk
      then Exit;
   end;
   frmVlrDtDiverg.Free;
   Result := True;
end; // PedeDadosEnvioBanco

function VerificaContribuicoesPendentes ( qryAux           : TwwQuery;
                                          piIdPessJur      : longint;
                                          piFlgDescFolha   : integer;
                                          pcOperacao,
                                          pcFlgPagador     : char; // P - Preparo, E - Envio
                                          psAnoMesCobranca,
                                          psListaSituacoes : string ) : longint;
begin
   Result := 0;
   if pcFlgPagador = '' then pcFlgPagador := 'C';
   with qryAux do
   begin
      Close;
      SQL.Clear;
      // Se for para verificar preparo
      if pcOperacao = 'P'
      then SQL.Add(' SELECT COUNT(*) AS TOTALPENDENTE '+
                   ' FROM   CONTRIBPREVPARTP CPP, CONTPREV CP '+
                   ' WHERE  (CPP.IDPESSJUR      = '+IntToStr(piIdPessJur)+')    '+
                   ' AND    (CPP.ULTMESPREPARO  < '''+psAnoMesCobranca+''') '+
                   ' AND    (CPP.FLGDESCFOLHA   = '+IntToStr(piFlgDescFolha)+')'+
                   ' AND    (CP.FLGINTERNO      IN ('+psListaSituacoes+')) '+
                   ' AND    (CPP.FLGCOBRA       = 1) '+
                   ' AND    (CPP.IDPLANOPREV    = CP.IDPLANOPREV) '+
                   ' AND    (CPP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '+
                   ' AND    (CP.FLGPAGADOR      = '''+pcFlgPagador+''') ')
      else SQL.Add(' SELECT COUNT(*) AS TOTALPENDENTE '+
                   ' FROM   HSTCONTRIBPREV HST, CONTPREV CP '+
                   ' WHERE  (HST.IDPESSJUR      = '+IntToStr(piIdPessJur)+')    '+
                   ' AND    (HST.MESCOBRANCA    <= '''+psAnoMesCobranca+''') '+
                   //leocbs - 3001 - inicio - melhora performance
                   ' AND    (HST.MESREFERENCIA = HST.MESREFERENCIA)  '+
                   ' AND    (HST.IDPESSOA = HST.IDPESSOA) '+
                   //leocbs - 3001 - fim
                   ' AND    (HST.FLGDESCFOLHA   = '+IntToStr(piFlgDescFolha)+')'+
// ANDRE DB2 --> ALTERAÇÃO NO SITRECEBIMENTO, PASSOU O 0(ZERO) PARA STRING '0'
                   ' AND    (HST.SITRECEBIMENTO = '''+'0'+''') '+
                   ' AND    (CP.FLGINTERNO      IN ('+psListaSituacoes+')) '+
                   ' AND    (HST.IDPLANOPREV    = CP.IDPLANOPREV) '+
                   ' AND    (HST.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '+
                   ' AND    (CP.FLGPAGADOR      = '''+pcFlgPagador+''')');
      Open;
      if not IsEmpty
      then Result := FieldByName('TotalPendente').AsInteger;
      Close;
   end;
end; // VerificaContribuicoesPendentes


//P.RAMOS-18.10.2005-PEND.20440-INIBIDO POIS ESTA ROTINA NÃO SERÁ MAIS USADA
//function VerificaContrib(sIdPlanoprev,sIdPessoa,sIdPessjur,sSeqProposta,sMesReferencia : string;
//                            qryAux : TwwQuery; var sValAcumRec : extended) : boolean;
//var
//  sql : string;
//  sValPrincip : extended;
//begin
//  // Esta rotina destina-se a atualizar uma contribuição "original" que veio inicialmente com
//  // divergência e agora foi acertada com sitrecebimento = 2 (recebido ok)
//  sValPrincip := 0;
//  sValAcumRec := 0;
//
//  // Selecionar todas as contribuições do participante daquele mes de referencia com as situações :
//  // 1 = enviado e não recebido
//  // 3 = recebido com divergencia e nao tratado
//  // 4 = recebido com divergencia e tratado 
//  sql:=      ' SELECT NUMRECEBIMENTO, MESREFERENCIA, MESCOBRANCA, VALORESPERADO, VALORRECEBIDO, IDMOTIVO '+
//             ' FROM   HSTCONTRIBPREV '+
//             ' WHERE  IDPLANOPREV   = '+  sIdPlanoprev    +
//             ' AND    IDPESSOA      = '+  sIdPessoa       +
//             ' AND    IDPESSJUR     = '+  sIdPessjur      +
//             ' AND    SEQPROPOSTA   = '+  sSeqProposta    +
//             ' AND    MESREFERENCIA ='''+ sMesReferencia +''''+
//             //ANDRE DB2 SITRECEBIMENTO STRING
//             ' AND    SITRECEBIMENTO IN (''1'',''3'',''4'') ';
//  qryaux.close;
//  qryaux.SQL.clear;
//  qryaux.sql.Add(sql);
//  qryaux.open;
//  qryaux.first;
//
//  while not qryaux.Eof do
//  begin
//     if qryaux.fieldbyname('IDMOTIVO').asinteger = prmIdMotivoContrib
//     then sValPrincip := qryaux.fieldbyname('VALORESPERADO').AsFloat
//     else sValAcumRec := sValAcumRec + qryaux.fieldbyname('VALORRECEBIDO').AsFloat;
//
//     qryaux.Next;
//  end;
//
//  if sValPrincip = sValAcumRec
//  then Result := True
//  else Result := False;
//end;
//P.RAMOS-18.10.2005-PEND.20440-INIBIDO POIS ESTA ROTINA NÃO SERÁ MAIS USADA-FIM

function InsereHstContribPREV( qryAux                              : TwwQuery;
                               piIdPessoa,       piSeqProposta,
                               piIdPessJur,      piIdPlanoPrev,
                               piIdContribuicao, piIdMotivo        : longint;
                               psMesReferencia,  psMesCobranca     : string;
                               piCodPortForma                      : longint;
                               psDataCobranca,   psDataRecebimento : string;
                               pdValorEsperado,  pdValorCalculado,
                               pdValorRecebido                     : double;
                               piIdRegraCalculo                    : longint;
                               piFlgDescFolha                      : integer;
                               pdValorBase1,     pdValorBase2,
                               pdValorBase3                        : double;
                               psDataInicio,     psDataFinal,
                               psFlgIntSitPart                     : string;
                               piSitRecebimento,
                               piParcela,
                               piIdLote                            : longint;
                               pcTipoPrevidencia                   : char;
                               piFlgCalcReserva,
                               piFlgDevolucao,   piFlgConcessao,
                               piFlgEvento                         : integer;
                               psFolhaOrigem                       : string = '';  
                               piIdMovBenef : Integer = -1 ) : longint;  // CAMILLE - 13/07/2004
var sSQLValues      : string;
    iNumRecebimento : longint;
begin
   Result := -1;
   // Inserir valor final na HSTCONTRIBPREV
   iNumRecebimento := LeUltRegistro(nil, 'HSTCONTRIBPREV');
   sSQLValues := ''''+psMesReferencia+'''';
   sSQLValues := sSQLValues+','''+psMesCobranca+'''';
   sSQLValues := sSQLValues+',' +IntToStr(iNumRecebimento);
   sSQLValues := sSQLValues+',' +IntToStr(piIdMotivo);
   if piCodPortForma > 0
   then sSQLValues := sSQLValues+', '+IntToStr(piCodPortForma)
   else sSQLValues := sSQLValues+', NULL ';
   if Trim(psDataCobranca) <> ''
   then sSQLValues := sSQLValues+', TO_DATE('''+Trim(psDataCobranca)+''',''DD/MM/YYYY'') '
   else sSQLValues := sSQLValues+', NULL ';
   if Trim(psDataRecebimento) <> ''
   then sSQLValues := sSQLValues+', TO_DATE('''+Trim(psDataRecebimento)+''',''DD/MM/YYYY'') '
   else sSQLValues := sSQLValues+', NULL ';
   sSQLValues := sSQLValues+', '+OraNumero(FloatToStr(pdValorEsperado));  // ValorEsperado
   sSQLValues := sSQLValues+', '+OraNumero(FloatToStr(pdValorCalculado)); // ValorCalculado
   sSQLValues := sSQLValues+', '+OraNumero(FloatToStr(pdValorRecebido));  // ValorCalculado
   if piIdRegraCalculo > 0
   then sSQLValues := sSQLValues+', '+IntToStr(piIdRegraCalculo)
   else sSQLValues := sSQLValues+', NULL ';
   sSQLValues := sSQLValues+', '+IntToStr(piFlgDescFolha);
   sSQLValues := sSQLValues+', '+IntToStr(piIdPessoa);
   sSQLValues := sSQLValues+', '+IntToStr(piSeqProposta);
   sSQLValues := sSQLValues+', '+IntToStr(piIdPessJur);
   sSQLValues := sSQLValues+', '+IntToStr(piIdPlanoPrev);
   sSQLValues := sSQLValues+', '+IntToStr(piIdContribuicao);
   sSQLValues := sSQLValues+', '+IntToStr(piFlgCalcReserva);
   sSQLValues := sSQLValues+', '+OraNumero(FloatToStr(pdValorBase1));
   sSQLValues := sSQLValues+', '+OraNumero(FloatToStr(pdValorBase2));
   sSQLValues := sSQLValues+', '+OraNumero(FloatToStr(pdValorBase3));
   if Trim(psDataInicio) <> ''
   then sSQLValues := sSQLValues+', TO_DATE('''+Trim(psDataInicio)+''',''DD/MM/YYYY'') '
   else sSQLValues := sSQLValues+', NULL ';
   if Trim(psDataFinal) <> ''
   then sSQLValues := sSQLValues+', TO_DATE('''+Trim(psDataFinal)+''',''DD/MM/YYYY'') '
   else sSQLValues := sSQLValues+', NULL ';
   if Trim(psFlgIntSitPart) <> ''
   then sSQLValues := sSQLValues+', '''+psFlgIntSitPart+''''
   else sSQLValues := sSQLValues+', NULL ';
   sSQLValues := sSQLValues+', '+IntToStr(piSitRecebimento);
   sSQLValues := sSQLValues+', '''+pcTipoPrevidencia+'''';    // TIPO
   if piIdLote > 0
   then sSQLValues := sSQLValues+', '+IntToStr(piIdLote)          // IDLOTE
   else sSQLValues := sSQLValues+', NULL ';
   sSQLValues := sSQLValues+', '+IntToStr(piParcela);          // PARCELA
   sSQLValues := sSQLValues+', '+IntToStr(piFlgDevolucao);     // FLGDEVOLUICAO
   sSQLValues := sSQLValues+', '+IntToStr(piFlgConcessao);     // FLGCONCESSAO
   sSQLValues := sSQLValues+', '+IntToStr(piFlgEvento);        // FLGEVENTO

   // CAMILLE - 13.07.2004
   if (psFolhaOrigem = '') or ( (psFolhaOrigem <> 'P') and (psFolhaOrigem <> 'C') and (psFolhaOrigem <> 'B'))
   then begin
      // leocbs - 28052002 - inicio
      if psFlgIntSitPart = 'AS'      // FOLHAORIGEM
      then sSQLValues := sSQLValues +', ''B'' '
      else
      begin
        // leocm - 31102002 - inicio
         if piFlgDescFolha = 0 then
            sSQLValues := sSQLValues +', ''C'' '
         else  sSQLValues := sSQLValues +', ''P'' ';
         //leocm - fim
      end;
      // leocb - 28052002 - fim
   end
   else sSQLValues := sSQLValues +', '''+psFolhaOrigem+'''';
   // CAMILLE - 13.07.2004 - FIM
   { Auugsto 11/09/2006 }
   if ( piIdMovBenef > 0 )
   then sSQLValues := sSQLValues+', '+IntToStr( piIdMovBenef ) // IDMOVBENEF
   else sSQLValues := sSQLValues+', NULL ';
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' INSERT INTO HSTCONTRIBPREV (MESREFERENCIA,MESCOBRANCA,NUMRECEBIMENTO,IDMOTIVO,'+
              '                             CODPORTFORMA,DATAPREVISAORECE,DATARECEBIMENTO, '+
              '                             VALORESPERADO,VALORCALCULADO,VALORRECEBIDO,IDREGRACALCULO, '+
              '                             FLGDESCFOLHA,IDPESSOA,SEQPROPOSTA,IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
              '                             FLGCALCRESERVA,VALOROP1,VALOROP2,VALOROP3,DATAINICIO,DATAFINAL,         '+
              '                             FLGSITFUNDACAO,SITRECEBIMENTO,TIPO,IDLOTE,PARCELA,FLGDEVOLUCAO,FLGCONCESSAO, '+
              '                             FLGEVENTO, FOLHAORIGEM, IDMOVBENEF ) '+ //leocbs - 28052002 - incluí folhaorigem
              ' VALUES('+sSQLValues+')');
      try
         Execsql;
      except
//         MsgDlg('Erro ao inserir registro no Histórico de Contribuições,'+#13
//                'provavelmente já existe um lancamento desta contribuição em '+
//                QuotedStr(psMesReferencia)+'.','Erro',mtError, [mbOk, mbHelp],0);
         Exit;
      end;
   end; //with
   Result := iNumRecebimento;
end;


function InsereTMPDESC ( qryAux                              : TwwQuery;
                         psCODALTERADOR, psCODCENTROCUSTOC, psCODCENTROCUSTOD,
                         psCODCENTRORESPON, psCODDOCUMENTOEFET, psCODDOCUMENTOPREV,
                         psCODPORTFORMA, psCODPROVDESC, psCODSUBCONTA,
                         psCODTIPDOC, psCODTIPRECDES, psCOMPLDOCUMENTO,
                         psDATACOBRANCA, psDATARECEBIMENTO, psDATAREFERENCIA,
                         psDESCRICAO, psEXERCICIO, psFLGALTERADOR,
                         psFLGATRASODEVOL, psFLGDESCFOLHA, psFLGDESCONTO,
                         psFLGEXISTEHST,
                         psFLGINTEVENTO, psFLGTIPODESC, psIDDESCONTO,
                         psIDEMPCOBRANCA, psIDEMPRESA, psIDEMPRESAPROP,
                         psIDFAVORECIDO, psIDFUNDACAO, psIDLOTE,
                         psIDMODULO, psIDMOTIVO, psIDPESSJUR,
                         psIDPESSOA, psIDPLANOPREV, psIDPLANPREVCONTAB,
                         psIDPROVENTO, psIDTITULAR, psINSCRICAONUMERO,
                         psMATRICULA, psMESCOBRANCA, psMESREFERENCIA,
                         psNODOCUMENTO, psPERIODO, psPLACONTAC,
                         psPLACONTAD, psPLANO, psRECPAG,
                         psREFERENCIA, psSEQPROPOSTA, psSISTORIGEM,
                         psSITENVIO,  psTIPCODIGO, psUNIDNEGOC, psVALOR,
                         psVALORBASE1, psVALORBASE2, psVALORBASE3, psVALORINFO,
                         psVALORRECEBIDO : string; iNumRec : LongInt = -1
                       ) : boolean;
var  i               : word;
begin
   Result := False;

   with dtmAPrev.qryInsTmpDesc do
   begin
       // fecha a query p/ evitar problemas
       Close;

       // prepara a query se já não estiver preparada
       if not(Prepared) then Prepare;

       // zera os parâmetros
       for i := 0 to (ParamCount - 1) do begin
          Params[i].Bound := False;
          Params[i].Clear;
          Params[i].Bound := True;
       end;

       if Trim(psCODALTERADOR) <> ''
       then ParamByName('CODALTERADOR').AsInteger := StrToInt(psCODALTERADOR);

       if Trim(psCODCENTROCUSTOC) <> ''
       then ParamByName('CODCENTROCUSTOC').AsString := psCODCENTROCUSTOC;

       if Trim(psCODCENTROCUSTOD) <> ''
       then ParamByName('CODCENTROCUSTOD').AsString := psCODCENTROCUSTOD;

       if Trim(psCODCENTRORESPON) <> ''
       then ParamByName('CODCENTRORESPON').AsString := psCODCENTRORESPON;

       if Trim(psCODDOCUMENTOEFET) <> ''
       then ParamByName('CODDOCUMENTOEFET').AsInteger := StrToInt(psCODDOCUMENTOEFET);

       if Trim(psCODDOCUMENTOPREV) <> ''
       then ParamByName('CODDOCUMENTOPREV').AsInteger := StrToInt(psCODDOCUMENTOPREV);

       if Trim(psCODPORTFORMA) <> ''
       then ParamByName('CODPORTFORMA').AsInteger := StrToInt(psCODPORTFORMA);

       if Trim(psCODPROVDESC) <> ''
       then ParamByName('CODPROVDESC').AsString := psCODPROVDESC;

       if Trim(psCODSUBCONTA) <> ''
       then ParamByName('CODSUBCONTA').AsInteger := StrToInt(psCODSUBCONTA);

       if Trim(psCODTIPDOC) <> ''
       then ParamByName('CODTIPDOC').AsInteger := StrToInt(psCODTIPDOC);

       if Trim(psCODTIPRECDES) <> ''
       then ParamByName('CODTIPRECDES').AsString := psCODTIPRECDES;

       if Trim(psCOMPLDOCUMENTO) <> ''
       then ParamByName('COMPLDOCUMENTO').AsString := psCOMPLDOCUMENTO;

       if Trim(psDATACOBRANCA) <> ''
       then ParamByName('DATACOBRANCA').AsDateTime := StrToDate(psDATACOBRANCA);

       if Trim(psDATARECEBIMENTO) <> ''
       then ParamByName('DATARECEBIMENTO').AsDateTime := StrToDate(psDATARECEBIMENTO);

       if Trim(psDATAREFERENCIA) <> ''
       then ParamByName('DATAREFERENCIA').AsDateTime := StrToDate(psDATAREFERENCIA);

       if Trim(psDESCRICAO) <> ''
       then ParamByName('DESCRICAO').AsString := Copy(psDESCRICAO,1,40);

       if Trim(psEXERCICIO) <> ''
       then ParamByName('EXERCICIO').AsInteger := StrToInt(psEXERCICIO);

       if Trim(psFLGALTERADOR) <> ''
       then ParamByName('FLGALTERADOR').AsString := psFLGALTERADOR;

       if Trim(psFLGATRASODEVOL) <> ''
       then ParamByName('FLGATRASODEVOL').AsString := psFLGATRASODEVOL;

       if Trim(psFLGDESCFOLHA) <> ''
       then ParamByName('FLGDESCFOLHA').AsString := psFLGDESCFOLHA;

       if Trim(psFLGDESCONTO) <> ''
       then ParamByName('FLGDESCONTO').AsInteger := StrToInt(psFLGDESCONTO);

       if Trim(psFLGEXISTEHST) <> ''
       then ParamByName('FLGEXISTEHST').AsInteger := StrToInt(psFLGEXISTEHST);

       if Trim(psFLGINTEVENTO) <> ''
       then ParamByName('FLGINTEVENTO').AsString := psFLGINTEVENTO;

       if Trim(psFLGTIPODESC) <> ''
       then ParamByName('FLGTIPODESC').AsString := psFLGTIPODESC;

       if Trim(psIDDESCONTO) <> ''
       then ParamByName('IDDESCONTO').AsInteger := StrToInt(psIDDESCONTO);

       if Trim(psIDEMPCOBRANCA) <> ''
       then ParamByName('IDEMPCOBRANCA').AsInteger := StrToInt(psIDEMPCOBRANCA);

       if Trim(psIDEMPRESA) <> ''
       then ParamByName('IDEMPRESA').AsInteger := StrToInt(psIDEMPRESA);

       if Trim(psIDEMPRESAPROP) <> ''
       then ParamByName('IDEMPRESAPROP').AsInteger := StrToInt(psIDEMPRESAPROP);

       if Trim(psIDFAVORECIDO) <> ''
       then ParamByName('IDFAVORECIDO').AsInteger := StrToInt(psIDFAVORECIDO);

       if Trim(psIDFUNDACAO) <> ''
       then ParamByName('IDFUNDACAO').AsInteger := StrToInt(psIDFUNDACAO);

       if (Trim(psIDLOTE) <> '') and (StrToInt(psIdLote) > 0)
       then ParamByName('IDLOTE').AsInteger := StrToInt(psIDLOTE);

       if Trim(psIDMODULO) <> ''
       then ParamByName('IDMODULO').AsInteger := StrToInt(psIDMODULO);

       if Trim(psIDMOTIVO) <> ''
       then ParamByName('IDMOTIVO').AsInteger := StrToInt(psIDMOTIVO);

       if Trim(psIDPESSJUR) <> ''
       then ParamByName('IDPESSJUR').AsInteger := StrToInt(psIDPESSJUR);

       if Trim(psIDPESSOA) <> ''
       then ParamByName('IDPESSOA').AsInteger := StrToInt(psIDPESSOA);

       if Trim(psIDPLANOPREV) <> ''
       then ParamByName('IDPLANOPREV').AsInteger := StrToInt(psIDPLANOPREV);

       if Trim(psIDPLANPREVCONTAB) <> ''
       then ParamByName('IDPLANPREVCONTAB').AsInteger := StrToInt(psIDPLANPREVCONTAB);

       if Trim(psIDPROVENTO) <> ''
       then ParamByName('IDPROVENTO').AsInteger := StrToInt(psIDPROVENTO);

       if Trim(psIDTITULAR) <> ''
       then ParamByName('IDTITULAR').AsInteger := StrToInt(psIDTITULAR);

       if Trim(psINSCRICAONUMERO) <> ''
       then ParamByName('INSCRICAONUMERO').AsInteger := StrToInt(psINSCRICAONUMERO);

       if Trim(psMATRICULA) <> ''
       then ParamByName('MATRICULA').AsString := psMATRICULA;

       if Trim(psMESCOBRANCA) <> ''
       then ParamByName('MESCOBRANCA').AsString := psMESCOBRANCA;

       if Trim(psMESREFERENCIA) <> ''
       then ParamByName('MESREFERENCIA').AsString := psMESREFERENCIA;

       if Trim(psNODOCUMENTO) <> ''
       then ParamByName('NODOCUMENTO').AsInteger := StrToInt(psNODOCUMENTO);

       if Trim(psPERIODO) <> ''
       then ParamByName('PERIODO').AsInteger := StrToInt(psPERIODO);

       if Trim(psPLACONTAC) <> ''
       then ParamByName('PLACONTAC').AsString := psPLACONTAC;

       if Trim(psPLACONTAD) <> ''
       then ParamByName('PLACONTAD').AsString := psPLACONTAD;

       if Trim(psPLANO) <> ''
       then ParamByName('PLANO').AsInteger := StrToInt(psPLANO);

       if Trim(psRECPAG) <> ''
       then ParamByName('RECPAG').AsString := psRECPAG;

       if Trim(psREFERENCIA) <> ''
       then ParamByName('REFERENCIA').AsString := psREFERENCIA;

       if Trim(psSEQPROPOSTA) <> ''
       then ParamByName('SEQPROPOSTA').AsInteger := StrToInt(psSEQPROPOSTA);

       if Trim(psSISTORIGEM) <> ''
       then ParamByName('SISTORIGEM').AsString := psSISTORIGEM;

       if Trim(psSITENVIO) <> ''
       then ParamByName('SITENVIO').AsString := psSITENVIO;

       if Trim(psTIPCODIGO) <> ''
       then ParamByName('TIPCODIGO').AsString := psTIPCODIGO;

       if Trim(psUNIDNEGOC) <> ''
       then ParamByName('UNIDNEGOC').AsInteger := StrToInt(psUNIDNEGOC);

       if Trim(psVALOR) <> ''
       then ParamByName('VALOR').AsFloat := StrToFloat(ClienteNumero(psVALOR));

       if Trim(psVALORBASE1) <> ''
       then ParamByName('VALORBASE1').AsFloat := StrToFloat(ClienteNumero(psVALORBASE1));

       if Trim(psVALORBASE2) <> ''
       then ParamByName('VALORBASE2').AsFloat := StrToFloat(ClienteNumero(psVALORBASE2));

       if Trim(psVALORBASE3) <> ''
       then ParamByName('VALORBASE3').AsFloat := StrToFloat(ClienteNumero(psVALORBASE3));

       if Trim(psVALORINFO) <> ''
       then ParamByName('VALORINFO').AsFloat := StrToFloat(ClienteNumero(psVALORINFO));

       if Trim(psVALORRECEBIDO) <> ''
       then ParamByName('VALORRECEBIDO').AsFloat := StrToFloat(ClienteNumero(psVALORRECEBIDO));

       //Bruno Bastos - Pend. 20518 - 25/10/2005 - Início
       if iNumRec > -1
       then ParamByName('NUMRECEBIMENTO').AsInteger := iNumRec
       else ParamByName('NUMRECEBIMENTO').Clear;   // Gleyber - Pend. 20518 - 18/11/2005
       //Bruno Bastos - Pend. 20518 - 25/10/2005 - Fim

       try
          ExecSQL;
       except
          exit;
       end;

   end;

   Result := True;
end;

function  CalculaEInsereAlteradorContrib( qryAuxAlterador  : TwwQuery;
                                   psFlgAtrasoDevol : char; // A = Atraso, D = devolucao
                                   piIdPessJur,   piIdPlanoPrev,
                                   piIdPessoa,    piIdContribuicao,
                                   piIdMotivo,    piNumRecebimento                : longint;
                                   psMesCobranca, psMesReferencia  : string ) : boolean;
var sSQL,
    sSQLRegra,
    sValorRegra : string;
    bErroRegra  : boolean;
begin
   Result        := False;

   with qryAuxAlterador do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT TA.CODALTERADOR, AC.IDREGRACALCULO, TA.DESCRICAO NOMEALTERADOR '+
              ' FROM   ALTERADORXCONTRIB AC, TIPOALTERADOR TA'+
              ' WHERE  TA.CODALTERADOR   = AC.CODALTERADOR '+
              ' AND    AC.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
              ' AND    AC.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+
              ' AND    AC.FLGCOBRA = 1 ');

      if UpperCase(psFlgAtrasoDevol) = 'A'
      then SQL.Add(' AND FLGATRASO = 1 ')
      else SQL.Add(' AND FLGDEVOL = 1 ');

      Open;

      if IsEmpty
      then begin
         Result := True;
         Exit;
      end;
   end;

   qryAuxAlterador.First;

   while not qryAuxAlterador.Eof do
   begin
      sSQLRegra := 'SELECT H.MESREFERENCIA, '''+psMesCobranca+''' as MESCOBRANCA , '+
                   '       H.NUMRECEBIMENTO, H.IDMOTIVO,        H.DATAPREVISAORECE,        '+
                   '       H.VALORESPERADO,  H.DATARECEBIMENTO, H.VALORESPERADO VALORPREV, '+
                   '       DECODE(H.VALORRECEBIDO,NULL,0) AS VALORRECEBIDO,                 '+
                   IntToSTr(Sistema.Idmodulo)      +'   AS IDMODULO '+ //leofuncef - 07122004                   
                   ' FROM   PLANPREV PL, CONTPREV CP, CONTRIBPREVPARTP CPP, HSTCONTRIBPREV H '+
                   ' WHERE  (CPP.IDPESSJUR      = '+IntToStr(piIdPessJur)      +') '+
                   ' AND    (CPP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)    +') '+
                   ' AND    (CPP.IDPESSOA       = '+IntToStr(piIdPessoa)       +') '+
                   ' AND    (CP.IDCONTRIBUICAO  = '+IntToStr(piIdContribuicao) +') '+
                   ' AND    (H.IDPESSJUR        = CPP.IDPESSJUR                  ) '+
                   ' AND    (H.IDPLANOPREV      = CPP.IDPLANOPREV                ) '+
                   ' AND    (H.IDPESSOA         = CPP.IDPESSOA                   ) '+
                   ' AND    (H.SEQPROPOSTA      = CPP.SEQPROPOSTA                ) '+
                   ' AND    (H.IDCONTRIBUICAO   = CPP.IDCONTRIBUICAO             ) '+
                   ' AND    (CP.IDPLANOPREV     = CPP.IDPLANOPREV                ) '+
                   ' AND    (CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO             ) '+
                   ' AND    (CP.FLGPAGADOR      <> ''E''                         ) '+
                   ' AND    (PL.IDPLANOPREV     = CPP.IDPLANOPREV                ) '+
                   ' AND    (H.VALORESPERADO    <> H.VALORRECEBIDO               ) '+
                   ' AND    (H.NUMRECEBIMENTO   = '+IntToStr(piNumRecebimento) +') '+
                   ' AND    (H.MESREFERENCIA    = '''+psMesReferencia+ '''       ) '+
                   ' AND    (H.MESCOBRANCA      = '''+psMesCobranca+'''         ) ';

      if qryAuxAlterador.Fieldbyname('IDREGRACALCULO').AsInteger > 0
      then begin
         sValorRegra := RegraNumerica( IntToStr(qryAuxAlterador.Fieldbyname('IDREGRACALCULO').AsInteger),
                                       sSQLRegra, bErroRegra, iIdCalculoGeral);

         if bErroRegra
         then begin
             MsgDlg('Erro na Execução da Regra de Cálculo do Alterador '+
                    qryAuxAlterador.Fieldbyname('NomeAlterador').AsString+'Nº '+
                    IntToStr(qryAuxAlterador.Fieldbyname('IDREGRACALCULO').AsInteger)+'.','Erro',mtError,[mbOk,mbHelp],0);
             Exit;
         end;
         if StrToFloat(ClienteNumero(sValorRegra)) <= 0
         then begin
            qryAuxAlterador.Next;
            continue;
         end;

         sSQL := ' INSERT INTO HSTATRASOCONTRIB(MESREFERENCIA,MESCOBRANCA,NUMRECEBIMENTO,IDMOTIVO, '+
                 '             CODALTERADOR,VALOR,FLGTIPO) '+
                 '             VALUES( '+
                 ' '''+ psMesReferencia  +''','+
                 ' '''+ psMesCobranca    +''','+
                        IntToStr(piNumRecebimento) +','+
                        IntToStr(piIdMotivo)       +','+
                        qryAuxAlterador.FieldByName('CodAlterador').AsString+', '+
                       OraNumero(sValorRegra)+','+
                 ' '''+psFlgAtrasoDevol+''' )';

         with dtmAPrev.qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(sSQL);
            try
              Execsql;
            except
              Exit;
            end;
         end;
      end;

      qryAuxAlterador.next;
   end;

   Result := true;
end; // CalculaAlteradorContrib

function VerificaLimiteContribPATRO(piIdPessJur        : longint;
                                    psAnoMesCobranca,
                                    psAnoMesCobranca13 : string;
                                    bReduzContrib      : boolean;
                                    psTipoContrib      : string;
                                    var sMsgErro : string) : boolean;
var dTotalEsperado,
    dTotalEsperadoNAORisco,
    dTotalDaFolha,
    dPercentual,
    dFatorRedutor    : double;
    bExit,
    bErroLimite,
    bCobrouTudo,
    bCobrou13,
    bOK              : boolean;
    sNomeRubrica,
    sAnoMesCalculo,
    sPercentualDaFolha,
    sTotalEsperado   : string;
    bErro : boolean;
    sFlgAno13 : string;
begin
   Result := False;

   with dtmAPrev.qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.add(' SELECT FlgAno13 FROM PATRO WHERE IDPESSOA = '+IntToStr(piIdPessJur));
      Open;
      sFlgAno13 := FieldByName('FlgAno13').AsString;
   end;
   // Verificar o total da folha da patrocinadora
   // Para cada plano da patrocinadora fazer :
   // 1. Verificar se o plano indica limite de contribuicao sobre total da folha
   // 2. Se nao, ir para proximo plano
   // 3. Se sim
   //    3.1. Verificar total de contribuicao da patrocinadora
   //    3.2. Comparar total da contribuicao com x % do total da folha
   //    3.3. Se for superior, reduzir
   //    3.4. Se for inferior, cobrar contribuição de contingência
   // Abrir query com planos da patrocinadora
   dtmAPrev.qryPlanReduz.Close;
   dtmAPrev.qryPlanReduz.SQL.Clear;
   dtmAPrev.qryPlanReduz.SQL.Add(' SELECT PL.IDPLANOPREV, PL.FLGCALCULALIMITE, PL.NOME, '+
                        '        PL.PATROLIMITE, PT.FLGANO13 '+
                        ' FROM   PLANPREV PL, PLANPREVPATRO PLP, PATRO PT      '+
                        ' WHERE  (PLP.IDPESSJUR   = '+IntToStr(piIdPessJur)+')'+
                        ' AND    (PLP.IDPLANOPREV = PL.IDPLANOPREV)'+
                        ' AND    (PLP.IDPESSJUR   = PT.IDPESSOA) '+
                        ' ORDER BY PL.IDPLANOPREV ');
   dtmAPrev.qryPlanReduz.Open;

   if dtmAPrev.qryPlanReduz.IsEmpty
   then begin
      Result := True;
      sMsgErro := ' Aviso : Nenhum plano encontrado associado à patrocinadora.';
      Exit;
   end;

   frmAguarde.Mostra('Verificando limite das contribuições da patrocinadora.');

   bErro := False;

   dtmAPrev.qryPlanReduz.First;
   while not dtmAPrev.qryPlanReduz.Eof do
   begin
      // Verificar se plano usa opção de limite no total da folha
      if dtmAPrev.qryPlanReduz.FieldByName('FlgCalculaLimite').AsInteger <> 1
      then begin
         dtmAPrev.qryPlanReduz.Next;
         Continue;
      end;

      bCobrouTudo    := False;
      bCobrou13      := False;
      sAnoMesCalculo := psAnoMesCobranca;
      while not bCobrouTudo do // loop para controlar cobranca do mes + 13o. (caso haja)
      begin
         bExit := False;

         if copy(sAnoMesCalculo,6,2) = '13'
         then sNomeRubrica := 'IDRUBDECTERC'
         else sNomeRubrica := 'IDRUBSALPARTICIP';
         // Ler total da folha de pagamento para este plano
         with dtmAPrev.qryReduzContrib do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT HST.VALORACUMULADO '+
                    ' FROM   HSTRUBRICAXPESS HST, PATRO PT '+
                    ' WHERE  (PT.IDPESSOA       = '+IntToStr(piIdPessJur)+')'+
                    ' AND    (HST.IDPESSOA      = '+IntToStr(piIdPessJur)+')'+
                    ' AND    (HST.MESREFERENCIA = '''+sAnoMesCalculo+''') '+
                    ' AND    (HST.IDPLANOPREV   = '+dtmAPrev.qryPlanReduz.FieldByName('IdPlanoPrev').AsString+')'+
                    ' AND    (HST.IDRUBRICA     = PT.'+sNomeRubrica+') ');
            Open;
            if IsEmpty
            then begin
               sMsgErro := ' Aviso : Total da Patrocinadora não encontrado para o plano '+
                                    dtmAPrev.qryPlanReduz.FieldByName('Nome').AsString+'. ';
               dtmAPrev.qryPlanReduz.Next;
               bCobrouTudo := True;
               bExit := True;
               break;
            end
            else dTotalDaFolha := FieldByName('ValorAcumulado').AsFloat;
         end;

         // Somar contribuicoes calculadas para a patrocinadora pagar
         dtmAPrev.qryReduzContrib.Close;
         dtmAPrev.qryReduzContrib.SQL.Clear;
         dtmAPrev.qryReduzContrib.SQL.Add(' SELECT SUM(HST.VALORESPERADO) AS TOTALESPERADO '+
                 ' FROM   HSTCONTRIBPREV HST, CONTPREV CP         '+
                 ' WHERE  (CP.FLGPAGADOR IN (''E'',''P''))'+
                 ' AND    (HST.MESCOBRANCA    = '''+psAnoMesCobranca+''') '+
                 ' AND    (HST.MESREFERENCIA  = '''+sAnoMesCalculo+''') '+
                 ' AND    (HST.IDPESSJUR      = '+IntToStr(piIdPessJur)+')'+
                 ' AND    (HST.IDPLANOPREV    = '+dtmAPrev.qryPlanReduz.FieldByName('IdPlanoPrev').AsString+')'+
                 ' AND    (HST.IDPLANOPREV    = CP.IDPLANOPREV) '+
                 ' AND    (HST.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) ');
         dtmAPrev.qryReduzContrib.Open;
         if dtmAPrev.qryReduzContrib.IsEmpty
         then begin
            sMsgErro := ' Aviso : Contribuições da Patrocinadora '+
                                ' para o plano '+dtmAPrev.qryPlanReduz.FieldByName('Nome').AsString+
                                ' não encontradas. ';
            dtmAPrev.qryPlanReduz.Next;
            bExit := True;
            break;
         end;
         dTotalEsperado := dtmAPrev.qryReduzContrib.FieldByName('TotalEsperado').AsFloat;
         dPercentual    := dtmAPrev.qryPlanReduz.FieldByName('PatroLimite').AsFloat;

         sPercentualDaFolha := OraNumero(FormatFloat('#0.00', dTotalDaFolha * dPercentual / 100));
         sTotalEsperado     := OraNumero(FormatFloat('#0.00',dTotalEsperado));

         // Se total de contribuicoes = percentual da folha
         // Entao ir para proximo plano
         if sTotalEsperado = sPercentualDaFolha
         then begin
            dtmAPrev.qryPlanReduz.Next;
            bExit := True;
            break;
         end;

         if dTotalEsperado > (dTotalDaFolha * dPercentual / 100)
         then begin // Reduzir contribuições sem ser as de risco
            // Somar contribuicoes calculadas para a patrocinadora pagar
            // que NAO sejam de risco
            if bReduzContrib
            then begin
               dtmAPrev.qryReduzContrib.Close;
               dtmAPrev.qryReduzContrib.SQL.Clear;
               dtmAPrev.qryReduzContrib.SQL.Add(' SELECT SUM(HST.VALORESPERADO) AS TOTALESPERADO '+
                       ' FROM   HSTCONTRIBPREV HST, CONTPREV CP, CONTRIBUICAO C         '+
                       ' WHERE  (CP.FLGPAGADOR IN (''E'',''P''))'+
                       ' AND    (HST.MESCOBRANCA    = '''+psAnoMesCobranca+''') '+
                       ' AND    (HST.MESREFERENCIA  = '''+sAnoMesCalculo+''') '+
                       ' AND    (HST.IDPESSJUR      = '  +IntToStr(piIdPessJur)+')'+
                       ' AND    (HST.IDPLANOPREV    = '  +dtmAPrev.qryPlanReduz.FieldByName('IdPlanoPrev').AsString+')'+
                       ' AND    (HST.IDPLANOPREV    = CP.IDPLANOPREV) '+
                       ' AND    (HST.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '+
                       ' AND    (CP.IDCONTRIBUICAO  = C.IDCONTRIBUICAO)  '+
                       ' AND    (C.FLGRISCO         = 0) ');
               dtmAPrev.qryReduzContrib.Open;
               dTotalEsperadoNAORisco := dtmAPrev.qryReduzContrib.FieldByName('TotalEsperado').AsFloat;

               dFatorRedutor := CalculaRedutorContribPatro(dTotalDaFolha,
                                                           dPercentual,
                                                           dTotalEsperado,
                                                           dTotalEsperadoNaoRisco);
               bOK   := ReduzContribuicaoPatro( dtmAPrev.qryReduzContrib,
                                                piIdPessJur,
                                                dtmAPrev.qryPlanReduz.FieldByName('IdPlanoPrev').AsInteger,
                                                psAnoMesCobranca,
                                                sAnoMesCalculo,
                                                dFatorRedutor);
               if not bOK
               then begin
                  sMsgErro := 'Erro ao executar redução nas contribuições do plano '+
                                       dtmAPrev.qryPlanReduz.FieldByName('Nome').AsString;
                  dtmAPrev.qryPlanReduz.Next;
                  bErroLimite := True;
                  bExit := True;
                  break;
               end;
            end;
         end
         else begin // Cobrar contribuicao de contingencia
            bOK   := CobraContribContingencia(dtmAPrev.qryReduzContrib,
                                              dtmAPrev.qryAux,
                                              piIdPessJur,
                                              dtmAPrev.qryPlanReduz.FieldByName('IdPlanoPrev').AsInteger,
                                              psAnoMesCobranca,
                                              sAnoMesCalculo,
                                              dTotalDaFolha,
                                              dTotalEsperado,
                                              psTipoContrib,      
                                              sMsgErro);

            if not bOk
            then begin
               sMsgErro := 'Erro ao executar cálculo da contribuição de '+
                                   'contingência do plano '+dtmAPrev.qryPlanReduz.FieldByName('Nome').AsString;
               dtmAPrev.qryPlanReduz.Next;
               bErroLimite := True;
               bExit := True;
               break;
            end;
         end;

         if Copy(sAnoMesCalculo,6,2) = '13'
         then bCobrou13 := True
         else bCobrou13 := False;

         if (psAnoMesCobranca13 = psAnoMesCobranca ) and
            (not bCobrou13)
         then begin
            if sFlgAno13  = 'C'
            then sAnoMesCalculo := Copy(psAnoMesCobranca,1,4)+'/13'
            else sAnoMesCalculo := Copy(SAnoMesAnterior(Copy(psAnoMesCobranca,1,4)+'/01'),1,4)+'/13';

            bCobrouTudo         := False;
         end
         else begin
            sAnoMesCalculo := psAnoMesCobranca;
            bCobrouTudo    := True;
         end;
      end; // while not bCobrouTudo

     // Se saiu do loop anterior porque a query estava vazia, entao
     // voltar ao inicio do loop principal
      if bExit then continue;

      dtmAPrev.qryPlanReduz.Next;
   end; // while not dtmAPrev.qryPlanReduz.Eof
   frmAguarde.Apaga;
   Result := not bErroLimite;
end; // VerificaLimiteContribPATRO

function CalculaRedutorContribPatro(pdTotalDaFolha,
                                    pdPercentual,
                                    pdTotalEsperado,
                                    pdTotalEsperadoNaoRisco : double) : double;
var Z : double;
begin
   // A + B = Y > Z onde
   //               A = soma das contribuicoes de risco
   //               B = soma das contribuicoes nao de risco (pdTotalEsperadoNaoRisco)
   //               Z = X% da Folha (exemplo : 10% da folha)
   //               Y = soma de todas as contribuicoes (pdTotalEsperado)
   // A + B' = Z    onde
   //               B' = B * redutor
   // A  = (Y - B) = (Z - B')
   // B' = Z - Y + B
   // B * Redutor = Z - Y + B => Redutor = (Z - Y + B) / B
   //                            Redutor = {(Z - Y) / B } + 1
   if pdTotalEsperadoNaoRisco <= 0
   then begin
      Result := 0;
      Exit;
   end;
   Z      := (pdPercentual * pdTotalDaFolha) / 100;
   Result := (Z - pdTotalEsperado + pdTotalEsperadoNaoRisco) / pdTotalEsperadoNAORisco;
end; // CalculaRedutorContribPatro

function ReduzContribuicaoPatro( qryAux : TwwQuery;
                                 piIdPessJur,
                                 piIdPlanoPrev : longint;
                                 psAnoMesCobranca,
                                 psAnoMesReferencia: string;
                                 pdFatorRedutor : double) : boolean;
var dNovoValorEsperado : double;
begin
   Result := False;

   // Abrir query com todas as contribuicoes (inclusive as exclusivas)
   // que a patrocinadora pagou, para reduzí-las
   // menos as de risco e as de dotacao inicial
   qryAux.Close;
   qryAux.SQL.Clear;
//   qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV HST SET VALORESPERADO = VALORESPERADO * '+
//                        OraNumero(FormatFloat('0.000000',pdFatorRedutor)) +
   qryAux.SQL.Add(' SELECT HST.MESREFERENCIA, HST.MESCOBRANCA, HST.NUMRECEBIMENTO, HST.IDMOTIVO ,'+
                  '        HST.VALORESPERADO '+
                  ' FROM   HSTCONTRIBPREV HST '+
              ' WHERE  (HST.MESCOBRANCA    = '''+psAnoMesCobranca+''') '+
              ' AND    (HST.MESREFERENCIA  = '''+psAnoMesReferencia+''') '+
              ' AND    (HST.IDPESSJUR      = '+IntToStr(piIdPessJur)+')'+
              ' AND    (HST.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+')'+
              ' AND    (HST.IDCONTRIBUICAO IN '+
              '             (SELECT CP.IDCONTRIBUICAO '+
              '              FROM   CONTRIBUICAO C, CONTPREV CP       '+
              '              WHERE  (CP.FLGPAGADOR IN (''E'',''P'')) '+
              '              AND    (CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+
              '              AND    (C.FLGRISCO        = 0)                '+
              '              AND    (CP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+') ) ) '+
              ' AND    (HST.IDCONTRIBUICAO NOT IN (SELECT IDCONTRIBUICAO '+
              '                                    FROM   PARAMDOTACAO   '+
              '                                    WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+')'+
              '         ) ' );

   try
      qryAux.Open;
   except
      Exit;
   end;
   while not qryAux.Eof do
   begin
      dNovoValorEsperado := qryAux.FieldByName('ValorEsperado').AsFloat * pdFatorRedutor;
      with dtmAprev.qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' UPDATE HSTCONTRIBPREV HST SET VALORESPERADO = '+
                          OraNumero(FormatFloat('0.00',dNovoValorEsperado))+
              ' WHERE  (HST.MESREFERENCIA  = '''+qryAux.FieldByName('MesReferencia').AsString+''') '+
              ' AND    (HST.MESCOBRANCA    = '''+qryAux.FieldByName('MesCobranca').AsString+''') '+
              ' AND    (HST.IDMOTIVO       = '+qryAux.FieldByName('IdMotivo').AsString+') '+
              ' AND    (HST.NUMRECEBIMENTO = '+qryAux.FieldByName('NumRecebimento').AsString+') ');
         try
            ExecSQL;
         except
            exit;
         end;
      end;
      qryAux.Next;
   end;
   Result := True;
end;

function CobraContribContingencia( qryContrib, qryAux : TwwQuery;
                                   piIdPessJur,
                                   piIdPlanoPrev      : longint;
                                   psAnoMesCobranca,
                                   psAnoMesReferencia : string;
                                   pdTotalDaFolha,
                                   pdTotalEsperado    : double;
                                   psTipoContrib      : string;
                                   var sMsgErro       : string ) : boolean;
var sSQL,
    sSQLValues,
    sDataPrevisao,
    sValorContrib   : string;

    iIdLoteConting,
    iNumRecebimento : longint;
    bErroRegra      : boolean;
begin
   Result := False;

   // Verificar contribuicoes de contingencia a cobrar
   qryContrib.Close;
   qryContrib.SQL.Clear;
   qryContrib.SQL.Add(' SELECT CP.IDCONTRIBUICAO, CP.IDREGRACALCULO,           '+
                      '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+
                      '        CPP.DATAINICIO, CPP.DATAFINAL                   '+
                      ' FROM   CONTPREV CP, CONTRIBPREVPATRO CPP               '+
                      ' WHERE  (CP.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)+')'+
                      ' AND    (CP.FLGCONTINGENCIA = 1) '+
                      ' AND    (CPP.IDPESSOA       = '+IntToStr(piIdPessJur)+')'+
                      ' AND    (CPP.IDPLANOPREV    = CP.IDPLANOPREV) '+
                      ' AND    (CPP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) ');
   qryContrib.Open;
   if qryContrib.IsEmpty
   then begin
      Result := True;
      Exit;
   end;

   iIdLoteConting := GeraLOTE(piIdPessJur, True, psAnoMesCobranca,
                              'P', 'Contrib. de Contingência. - '+psTipoContrib+' - Ref. '+psAnoMesReferencia,
                              'N','1','0','0','0','0',
                              //DateToStr(date),'','','','');                  // ClaudioR - 19962 - 16/08/2007
                              FormatDateTime('dd/mm/yyyy', date),'','','',''); // ClaudioR - 19962 - 16/08/2007

   sDataPrevisao  := CriticaDataCobrancaSit(dtmAPrev.qry,IntToStr(piIdPessJur),
                                            IntToStr(piIdPlanoPrev),
                                            'PT', 'N',
                                            Copy(psAnoMesCobranca,6,2),
                                            Copy(psAnoMesCobranca,1,4));


   if Trim(sDataPrevisao) = '' Then
   begin
     If MsgDlg('Calendário para contribuições da patrocinadora com problemas. Deseja continuar ? ',
                'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo Then
     Begin
       sMsgErro := 'Processamento cancelado. Motivo : Calendário para contribuições da patrocinadora com problemas. ';
       Result := False;
       Exit;
     End;
   end
   else
     //sDataPrevisao := DateToStr(date);                  //ClaudioR - 19962 - 16/08/2007
     sDataPrevisao := FormatDateTime('dd/mm/yyyy', date); //ClaudioR - 19962 - 16/08/2007

   while not qryContrib.Eof do
   begin
      // Calcular contribuicao
      sSQL := ' SELECT '+IntToStr(piIdPessJur)  +' AS IDPESSJUR,   '+
                         IntToStr(piIdPlanoPrev)+' AS IDPLANOPREV, '+
                         OraNumero(FloatToStr(pdTotalDaFolha))+' AS VALORPROVENTO, '+
                         OraNumero(FloatToStr(pdTotalEsperado))+' AS VALORESPERADO '+
              ' FROM DUAL ';

      if Trim(qryContrib.FieldByName('IdRegraCalculo').AsString) = ''
      then begin
         Result := True;
         sMsgErro := 'Contribuição de Contingência não calculada. Regra não encontrada.';
         Exit;
      end;

      sValorContrib := RegraNumerica(qryContrib.FieldByName('IdRegraCalculo').AsString,
                                     sSQL,bErroRegra,iIdCalculoGeral);

      if bErroRegra
      then begin
         sMsgErro := 'Erro na Execução da Regra de Cálculo da Contribuição de Contingência Nº '+
                              qryContrib.FieldByName('IdRegraCalculo').AsString;
         Result := False;
         Exit;
      end;

      // Gravar contribuicao no historico
      iNumRecebimento := LeUltRegistro(qryAux,'HSTCONTRIBPREV');
      sSQLValues := IntToStr(iNumRecebimento) + ',';

      if UpperCase(psTipoContrib) = 'ACERTO'
      then sSQLValues := sSQLValues + IntToStr(prmIdMotivoDiverg)  + ','
      else sSQLValues := sSQLValues + IntToStr(prmIdMotivoContrib) + ',';
      
      sSQLValues := sSQLValues + '''' + psAnoMesReferencia + '''' + ','; // MESREFERENCIA
      sSQLValues := sSQLValues + '''' + psAnoMesCobranca + '''' + ','; // MESCOBRANCA
      sSQLValues := sSQLValues + IntToStr(piIdPessJur)   + ',';        // IDPESSJUR
      sSQLValues := sSQLValues + IntToStr(piIdPessJur)   + ',';        // IDPESSOA
      sSQLValues := sSQLValues + IntToStr(piIdPlanoPrev) + ',';        // IDPLANOPREV
      sSQLValues := sSQLValues + '1,';                                 // SEQPROPOSTA
      sSQLValues := sSQLValues + qryContrib.FieldByName('IDCONTRIBUICAO').AsString + ','; // IDCONTRIBUICAO
      sSQLValues := sSQLValues +  'NULL,';                             // VALORRECEBIDO
      sSQLValues := sSQLValues + OraNumero(sValorContrib)+ ',' ;       // VALORCALCULADO
      sSQLValues := sSQLValues + OraNumero(sValorContrib)+ ',' ;       // VALORESPERADO
      //ANDRE DB2 SITRECEBIMENTO STRING
      sSQLValues := sSQLValues + '''0'', '; {NAO ENVIADO}              // SITRECEBIMENTO
      sSQLValues := sSQLValues + 'NULL' + ',';                         // DATA RECEBIMENTO

      sSQLValues := sSQLValues + 'NULL' + ',';                         // CODDOCUMENTOPREV
      sSQLValues := sSQLValues + 'NULL' + ',';                         // CODPORTFORMA
      sSQLValues := sSQLValues + IntToStr(iIdLoteConting)+ ',';        // IDLOTE
      sSQLValues := sSQLValues + '0' + ',';                            // FLGDESCFOLHA
      sSQLValues := sSQLValues + 'TO_DATE('''+sDataPrevisao+''',''dd/mm/yyyy'') ' + ','; // DATAPREVISAORECE
      sSQLValues := sSQLValues + '0' + ',';                             // FLGCALCRESERVA
      sSQLValues := sSQLValues + '''F'',';                              // STIPO
      sSQLValues := sSQLValues + '''PT'',';                             // FLGINTERNO
      sSQLValues := sSQLValues + qryContrib.FieldByName('IDREGRACALCULO').AsString + ','; // REGRACALCULO
      sSQLValues := sSQLValues + '1, ';                                 // PARCELA

      if Trim(qryContrib.FieldByName('VALORBASE1').AsString) <> '' // VALOROP1
      then sSQLValues := sSQLValues + OraNumero(qryContrib.FieldByName('VALORBASE1').AsString) + ','
      else sSQLValues := sSQLValues + 'NULL' + ',';

      if Trim(qryContrib.FieldByName('VALORBASE2').AsString) <> '' // VALOROP2
      then sSQLValues := sSQLValues + OraNumero(qryContrib.FieldByName('VALORBASE2').AsString) + ','
      else sSQLValues := sSQLValues + 'NULL' + ',';

      if Trim(qryContrib.FieldByName('VALORBASE3').AsString) <> '' // VALOROP3
      then sSQLValues := sSQLValues + OraNumero(qryContrib.FieldByName('VALORBASE3').AsString) + ','
      else sSQLValues := sSQLValues + 'NULL' + ',';

      if Trim(qryContrib.FieldByName('DATAINICIO').AsString) <> '' // DATAINICIO
      then sSQLValues := sSQLValues + 'TO_DATE(''' +qryContrib.FieldByName('DATAINICIO').AsString+''',''dd/mm/yyyy'') ' + ','
      else sSQLValues := sSQLValues + 'NULL' + ',';

      if Trim(qryContrib.FieldByName('DATAFINAL').AsString) <> '' // DATAFINAL
      // CGUEDES - 06/08/2002
      then sSQLValues := sSQLValues + 'TO_DATE(''' +qryContrib.FieldByName('DATAFINAL').AsString+''',''dd/mm/yyyy'') '
      else sSQLValues := sSQLValues + 'NULL';


      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' INSERT INTO HSTCONTRIBPREV(NUMRECEBIMENTO, IDMOTIVO, MESREFERENCIA,         ' +
                     '                            MESCOBRANCA, IDPESSJUR, IDPESSOA, IDPLANOPREV,   ' +
                     '                            SEQPROPOSTA, IDCONTRIBUICAO, VALORRECEBIDO,      ' +
                     '                            VALORCALCULADO, VALORESPERADO, SITRECEBIMENTO,   ' +
                     '                            DATARECEBIMENTO, CODDOCUMENTOPREV, CODPORTFORMA, ' +
                     '                            IDLOTE, FLGDESCFOLHA, DATAPREVISAORECE,          ' +
                     '                            FLGCALCRESERVA, TIPO, FLGSITFUNDACAO,            ' +
                     '                            IDREGRACALCULO, PARCELA, VALOROP1, VALOROP2,     ' +
                     '                            VALOROP3, DATAINICIO, DATAFINAL)                 ' +
                     ' VALUES (' + sSQLValues + ')');
      try
         qryAux.ExecSQL;
      except
         sMsgErro := 'Erro na Gravação Contribuição de Contingência.';
         Result := False;
         Exit;
      end; //try

      // Atualizar ultmespreparo da  contribuicao de contingencia
      if UpperCase(psTipoContrib) <> 'ACERTO'
      then begin
         sSQL := ' UPDATE  CONTRIBPREVPATRO SET ULTMESPREPARO = '''+psAnoMesCobranca+''''+
                 ' WHERE   (IDPESSOA       = '+IntToStr(piIdPessJur)+')'+
                 ' AND     (IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+')'+
                 ' AND     (IDCONTRIBUICAO = '+qryContrib.FieldByName('IdContribuicao').AsString+')';

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(sSQL);
         try
            qryAux.ExecSQL;
         except
            sMsgErro := 'Erro na Atualização do Último Mês de Cobrança da Contribuição de Contingência.';
            Result := False;
            Exit;
         end;

         // Verificar se é a ultima cobranca da contribuicao, para encerra-la
         sSQL := ' UPDATE  CONTRIBPREVPATRO SET FLGCOBRA  = 0           '+
                 ' WHERE   TO_CHAR(DATAFINAL,''YYYY/MM'') = ULTMESPREPARO '+
                 ' AND     FLGCOBRA    = 1                                '+
                 ' AND     IDPESSOA    = '+IntToStr(piIdPessJur)+
                 ' AND     IDPLANOPREV = '+IntToStr(piIdPlanoPrev);

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(sSQL);
         try
            qryAux.ExecSQL;
         except
            sMsgErro := 'Erro no Encerramento da Contribuições de Contingência.';
            Result := False;
            Exit;
         end;
      end;

      qryContrib.Next;
   end;

   Result := True;
end;

function CalculaUltimaContrib13 (piIdPessJur, piIdPlanoPrev, piIdPessoa,
                                 piSeqProposta,   piNumeroProcesso, piIdEvento,
                                 piIdMotivo,      piFlgDescFolha,
                                 piFlgConcessao,  piFlgEvento,
                                 piIdLote       : longint;
                                 psAnoMesTransicao,
                                 psAnoMesCobranca,
                                 psFlgIntSitPartAnterior,
                                 psFlgIntSitPartPosterior,
                                 psIdSitPartAnterior,
                                 psIdSitPartPosterior,
                                 psInscricaoData,
                                 psDataNasc                      : string;
                                 pbEnviaContribuicao : boolean ) : boolean;
var iIdRegraCalculo    : longint;
    sDataRef,
    sSQL,
    sValorContrib,
    sIdRubDecTerc,
    sCodProvDesc,
    sValorRegra,
    sFlgDescFolha,
    sSitRecebimento    : string;
    bErro               : boolean;
    iNumBenef           : integer;
    dValorRateado       : double;
    sDataCobranca       : string;

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
    sIdEmpresaProp   : string;

    sPlaContaDProvis,    // Gleyber - 11/01/2006 - Pendência 19538
    sPlaContaCProvis,    // Gleyber - 11/01/2006 - Pendência 19538
    sMsgErro : String;
    iNumRecebimento : LongInt; //Bruno Bastos - Pend. 20518 - 25/10/2005

begin
   Result := False;

   sDataCobranca := '01/'+Copy(psAnoMesTransicao,6,2)+'/'+Copy(psAnoMesTransicao,1,4);

   // Abrir qry com todas as contribuicoes a calcular 13o.
   with dtmAPrev.qryAux2 do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DISTINCT CPP.IDPESSJUR, CPP.IDPLANOPREV, CPP.IDPESSOA, CPP.SEQPROPOSTA, '+  //leorefer - 0801 - acrescentei o distinct
              '        CPP.IDCONTRIBUICAO, CPP.DATAINICIO, CPP.DATAFINAL,             '+
              '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3,                '+
              '        CP.IDREGRACALCULO, CP.IDREGRACALCULO13, CP.IDREGRAULTPGTO13,   '+
              '        CP.IDRUBDECTERC                                                '+
              ' FROM   CONTPREV CP, CONTRIBPREVPARTP CPP, EVENTOSPREV EP, HSTCONTEVENTOSPR HST '+
              ' WHERE  CPP.IDPESSJUR       = '+IntToStr(piIdPessJur)+
              ' AND    CPP.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)+
              ' AND    CPP.IDPESSOA        = '+IntToStr(piIdPessoa)+
              ' AND    CPP.SEQPROPOSTA     = '+IntToStr(piSeqProposta)+
              ' AND    EP.IDPESSJUR        = CPP.IDPESSJUR '+
              ' AND    EP.IDPLANOPREV      = CPP.IDPLANOPREV '+
              ' AND    EP.IDPESSOA         = CPP.IDPESSOA '+
              ' AND    EP.SEQPROPOSTA      = CPP.SEQPROPOSTA '+
              ' AND    TO_CHAR(EP.DATAEVENTO,''YYYY/MM'') = '''+psAnoMesTransicao+''''+
              ' AND    EP.IDEVENTOGERADOR  = '+IntToStr(piIdEvento)+
              ' AND    HST.IDEVENTOSPREV   = EP.IDEVENTOSPREV '+
              ' AND    HST.IDCONTRIBUICAOF = CPP.IDCONTRIBUICAO '+
              ' AND    HST.FLGASSOCIADA    = 0 '+
              ' AND    CP.IDPLANOPREV      = CPP.IDPLANOPREV '+
              ' AND    CP.IDCONTRIBUICAO   = CPP.IDCONTRIBUICAO ');
      Open;

      if IsEmpty or
         ((FieldByName('IDREGRACALCULO13').AsString = '') and
          (FieldByName('IDREGRACALCULO').AsString = ''))
      then begin
         Result := True;
         Exit;
      end;

      if FieldByName('IDREGRACALCULO13').AsString = ''
      then iIdRegraCalculo := FieldByName('IDREGRACALCULO13').AsInteger
      else iIdRegraCalculo := FieldByName('IDREGRACALCULO').AsInteger;

      sIdRubDecTerc := FieldByName('IDRUBDECTERC').AsString;

      if Trim(sIdRubDecTerc) = ''
      then begin
        MsgDlg('Rubrica de 13o. não preenchida.','Erro',mtError,[mbOK],0);
        Exit;
      end;

      with dtmAPrev.qryAux do
      begin
         Close;
         SQL.Clear;
         if psFlgIntSitPartPosterior = 'AS'
         then  SQL.Add(' SELECT CODPROVDESC FROM RUBRICAXPESS '+
                       ' WHERE  IDPESSOA = '+IntToStr(iIdFundacao)+
                       ' AND    IDRUBRICA = '+sIdRubDecTerc )
         else  SQL.Add(' SELECT CODPROVDESC FROM RUBRICAXPESS '+
                       ' WHERE  IDPESSOA = '+IntToStr(piIdPessJur)+
                       ' AND    IDRUBRICA = '+sIdRubDecTerc );
         Open;
         if IsEmpty
         then begin
           MsgDlg('Rubrica de 13o. não associada a empresa.','Erro',mtError,[mbOK],0);
           Exit;
         end;

         sCodProvDesc := FieldByName('CODPROVDESC').AsString;
      end;

      First;
      while not Eof do
      begin
         // BUSCAR VALOR DA ULTIMA CONTRIBUICAO INTEGRAL
         with dtmAPrev.qryAux do
         begin
            sValorContrib := '0';
            Close;
            SQL.Clear;
            SQL.Add(' SELECT H.MESREFERENCIA, H.VALORESPERADO '+
                    ' FROM   HSTCONTRIBPREV H                 '+
                    ' WHERE  H.IDPESSJUR      = '+IntToStr(piIdPessJur)+
                    ' AND    H.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                    ' AND    H.IDPESSOA       = '+IntToStr(piIdPessoa)+
                    ' AND    H.SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
                    ' AND    H.IDCONTRIBUICAO = '+dtmAPrev.qryAux2.FieldByName('IDCONTRIBUICAO').AsString+
                    ' AND    H.VALORESPERADO IS NOT NULL '+
                    ' AND    H.VALORESPERADO > 0 '+
                    ' AND    H.MESREFERENCIA < '''+psAnoMesTransicao+''''+
                    ' ORDER BY H.MESREFERENCIA DESC ');
            Open;
            if not IsEmpty
            then begin
               First;
               sValorContrib := FieldByName('VALORESPERADO').AsString;
            end;
            Close;
         end;

         // CALCULAR CONTRIBUICAO
         sDataRef  := IntToStr(TrazUltDiaMes(StrToInt(Copy(psAnoMesTransicao,6,2)),StrToInt(Copy(psAnoMesTransicao,1,4))))+'/'+Copy(psAnoMesTransicao,6,2)+'/'+Copy(psAnoMesTransicao,1,4);

         sSQL      := MontaSQLContribNOVA( piIdPessJur,       piIdPlanoPrev,
                                           piIdPessoa,        piSeqProposta,
                                           dtmAPrev.qryAux2.FieldByName('IDCONTRIBUICAO').AsInteger,
                                           piIdMotivo,
                                           psFlgIntSitPartAnterior,
                                           psAnoMesTransicao,
                                           sDataRef,          sValorContrib,
                                           psInscricaoData,   psDataNasc,
                                           'N',
                                           'HSTCONTRIBPREV',
                                           'VALORESPERADO',
                                           '',
                                           psIdSitPartAnterior,
                                           '',
                                           '',
                                           1,-1,psAnoMesCobranca,piIdLote);

         try
            sValorRegra := RegraNumerica( IntToStr(iIdRegraCalculo), sSQL, bErro, iIdCalculoGeral);
         except
            MsgDlg('Erro ao calcular a contribuição sobre 13º - Regra Nº '+IntToStr(iIdRegraCalculo),'Erro',mtError,[mbOK],0);
            Exit;
         end;

         if pbEnviaContribuicao
         then sSitRecebimento := '1'
         else sSitRecebimento := '0';

         iNumRecebimento := InsereHstContribPREV( dtmAPrev.qryAux,
                               piIdPessoa,          piSeqProposta,
                               piIdPessJur,         piIdPlanoPrev,
                               dtmAPrev.qryAux2.FieldByName('IDCONTRIBUICAO').AsInteger,
                               piIdMotivo,
                               psAnoMesTransicao,  psAnoMesCobranca,
                               -1,
                               sDataCobranca,
                               '',
                               StrToFloat(ClienteNumero(sValorRegra)),
                               StrToFloat(ClienteNumero(sValorRegra)),
                               0,
                               iIdRegraCalculo,
                               piFlgDescFolha,
                               dtmAPrev.qryAux2.FieldByName('ValorBase1').AsFloat,
                               dtmAPrev.qryAux2.FieldByName('ValorBase2').AsFloat,
                               dtmAPrev.qryAux2.FieldByName('ValorBase3').AsFloat,
                               dtmAPrev.qryAux2.FieldByName('DataInicio').AsString,
                               dtmAPrev.qryAux2.FieldByName('DataFinal').AsString,
                               psFlgIntSitPartAnterior,
                               StrToInt(sSitRecebimento),
                               0,
                               piIdLote,
                               'F',
                               0,
                               0,
                               piFlgConcessao,
                               piFlgEvento);
         if iNumRecebimento < 0 //Bruno Bastos - Pend. 20518 - 25/10/2005
         then begin
            MsgDlg('Erro ao gravar a contribuição sobre 13º .','Erro',mtError,[mbOK],0);
            Exit;
         end;


         if pbEnviaContribuicao
         then begin
            if psFlgIntSitPartPosterior = 'AS'
            then begin
               sFlgDescFolha := 'B';
               // CAMILLE - REFER - 10.03.2001
               with dtmAPrev.qryBenef do
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add(' SELECT DISTINCT BF.IDPESSOA  '+
                          ' FROM   BENEFBFCIARIO BF      '+
                          ' WHERE  BF.NUMEROPROCESSO   = '+IntToStr(piNumeroProcesso)+
                          ' AND    ((BF.IDSITBENEFICIO = 1) OR (BF.IDSITBENEFICIO = 4)) ');
                  Open;

                  if IsEmpty
                  then iNumBenef := 1
                  else iNumBenef := RecordCount;
               end;

               dValorRateado := StrToFloat(ClienteNumero(sValorRegra)) / iNumBenef;

               dtmAPrev.qryBenef.First;
               while not dtmAPrev.qryBenef.Eof do
               begin
                  // ******************************************************************************
                  // Preencher Informacoes de Integracao com Financeiro e Contabilidade
                  // ******************************************************************************
                  if not dtmAPrevIntegraBack.BuscaInfIntegra( piIdPessJur,
                                          piIdPlanoPrev,
                                          piIdPessoa,
                                          dtmAPrev.qryBenef.FieldByName('IDPESSOA').AsInteger,
                                          dtmAPrev.qryAux2.FieldByName('IDCONTRIBUICAO').AsInteger,
                                          'C',
                                          'B',
                                          0,
                                          psAnoMesCobranca,
                                          psAnoMesTransicao,
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
                                          'R',  // Gleyber - 12/09/2005 - Pendência 20169
                                          True,
                                          sMsgErro )//leocm - 28042005
                  then begin
                     MsgDlg('Acerto de Contribuição : Erro ao buscar parametrização financeira. Verifique.','Erro',mtError,[mbOk],0);
                     Exit;
                  end;

                  if not InsereTMPDESC ( dtmAPrev.qryAux,
                                         '', sCodCentroCustoC, sCodCentroCustoD,
                                         sCodCentroRespon, '', '',
                                         sCodPortForma, sCodProvDesc, sCodSubConta,
                                         sCodTipDoc, sCodTipRecDes, '',
                                         sDATACOBRANCA, '', sDATACOBRANCA,
                                         'Contribuição sobre 13o.','', '',
                                         'N', sFlgDescFolha, '1',
                                         '1',
                                         '', 'P', dtmAPrev.qryAux2.FieldByName('IDCONTRIBUICAO').AsString,
                                         sIdEmpresaProp,sIdEmpresaProp,sIdEmpresaProp,
                                         dtmAPrev.qryBenef.FieldByName('IDPESSOA').AsString,
                                         IntToStr(iIdFundacao),
                                         IntToStr(piIdLote),
                                         IntToStr(Sistema.IdModulo),
                                         IntToStr(piIDMOTIVO),
                                         IntToStr(piIDPESSJUR),
                                         dtmAPrev.qryBenef.FieldByName('IDPESSOA').AsString,
                                         IntToStr(piIDPLANOPREV), '',
                                         sIDRubDecTerc,
                                         IntToStr(piIDPESSOA), '',
                                         '', psAnoMESCOBRANCA, psAnoMesTransicao,
                                         '', '', sPlaContaC,
                                         sPlaContaD, sPlano, 'P', // o RECPAG para a folha de beneficio é sempre P
                                         '***', '1', IntToStr(Sistema.IdModulo),
                                        '0',  prmTpOperFolhaBen,  sUnidNegoc, FloatToStr(dValorRateado),
                                         dtmAPrev.qryAux2.FieldByName('ValorBase1').AsString,
                                         dtmAPrev.qryAux2.FieldByName('ValorBase2').AsString,
                                         dtmAPrev.qryAux2.FieldByName('ValorBase3').AsString,
                                         '',
                                         '',
                                         iNumRecebimento) //Bruno Bastos - Pend. 20518 - 25/10/2005
                  then begin
                     MsgDlg('Erro ao enviar a contribuição sobre 13º .','Erro',mtError,[mbOK],0);
                     Exit;
                  end;

                  dtmAPrev.qryBenef.Next;
               end;

            end
            else begin
               sFlgDescFolha := 'P';

               if not InsereTMPDESC ( dtmAPrev.qryAux,
                                  '', '', '',
                                  '', '', '',
                                  '', sCODPROVDESC, '',
                                  '', '', '',
                                  sDATACOBRANCA, '', sDATACOBRANCA,
                                  'Contribuição sobre 13o.','', '',
                                  'N', sFlgDescFolha, '1',
                                  '1',
                                  '', 'P',
                                  dtmAPrev.qryAux2.FieldByName('IDCONTRIBUICAO').AsString,
                                  '', '', '',
                                  IntToStr(piIdPessoa), IntToStr(iIdFundacao), IntToStr(piIdLote),
                                  IntToStr(Sistema.IdModulo), IntToStr(piIDMOTIVO), IntToStr(piIDPESSJUR),
                                  IntToStr(piIDPESSOA), IntToStr(piIDPLANOPREV), '',
                                  sIDRubDecTerc, IntToStr(piIDPESSOA), '',
                                  '', psAnoMESCOBRANCA, psAnoMesTransicao,
                                  '', '', '',
                                  '', '', 'R',
                                  '***', '1', IntToStr(Sistema.IdModulo),
                                  '0',  '', '', OraNumero(sValorRegra),
                                     dtmAPrev.qryAux2.FieldByName('ValorBase1').AsString,
                                     dtmAPrev.qryAux2.FieldByName('ValorBase2').AsString,
                                     dtmAPrev.qryAux2.FieldByName('ValorBase3').AsString,
                                  '',
                                  '',
                                  iNumRecebimento) //Bruno Bastos - Pend. 20518 - 25/10/2005
               then begin
                  MsgDlg('Erro ao enviar a contribuição sobre 13º .','Erro',mtError,[mbOK],0);
                  Exit;
               end;
            end;
         end;
         Next;
      end;
   end;
   Result := True;
end; // CalculaUltimaContrib13

{// CAMILLE - 09.04.2002
function CalculoRetroativoContribuicao ( piIdPessJur,
                                         piIdPlanoPrev,
                                         piIdPessoa,
                                         piSeqProposta   : longint;
                                         psDataInicio,
                                         psDataFinal     : string;
                                         pbUsaAlterador  : boolean ) : boolean;
var sAnoMesAtual,
    sAnoMesInicio,
    sAnoMesFinal   : string;
begin
    Result := False;

    if Trim(psDataFinal) <> '' then psDataFinal := DateToStr(date);
    sAnoMesAtual  := Copy(psDataInicio,7,4)+'/'+Copy(psDataInicio,4,2);
    sAnoMesInicio := Copy(psDataInicio,7,4)+'/'+Copy(psDataInicio,4,2);
    sAnoMesFinal  := Copy(psDataFinal,7,4) +'/'+Copy(psDataFinal,4,2);

    while sAnoMesAtual <= sAnoMesFinal do
    begin
       // **********************************************************************
       // RECALCULAR SALÁRIOS DE PARTICIPAÇÃO
       // **********************************************************************

       // **********************************************************************
       // RECALCULAR CONTRIBUIÇÕES
       // **********************************************************************
       with qryHstContrib do
       begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT H.IDCONTRIBUICAO, CP.ORDEMCALCULO,                                                                             '+
                  '        SUM(DECODE(H.FLGDEVOLUCAO, 0,                                                                                  '+
                  '                                   DECODE(H.VALORRECEBIDO, NULL,  H.VALORESPERADO,  H.VALORRECEBIDO),                  '+
                  '                                   DECODE(H.VALORRECEBIDO, NULL, -H.VALORESPERADO, -H.VALORRECEBIDO) ) AS VALORCOBRADO '+
                  ' FROM   HSTCONTRIBPREV H, CONTPREV CP '+
                  ' WHERE  H.MESREFERENCIA = '''+sAnoMesAtual+''''+
                  ' AND    H.IDPESSJUR       = '+IntToStr(piIdPessJur)+
                  ' AND    H.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)+
                  ' AND    H.IDPESSOA        = '+IntToStr(piIdPessoa)+
                  ' AND    H.SEQPROPOSTA     = '+IntToStr(piSeqProposta)+
                  ' AND    CP.IDPLANOPREV    = H.IDPLANOPREV    '+
                  ' AND    CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO '+
                  ' GROUP BY H.IDCONTRIBUICAO, CP.ORDEMCALCULO  '+
                  ' ORDER BY CP.ORDEMCALCULO ');
          Open;

       end;

       // **********************************************************************
       // IR PARA PRÓXIMO MÊS
       // **********************************************************************
       sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
    end;
    Result := True;
end;
}


procedure  VerificaContabMantidoNoEnvio(qryaux : TwwQuery ;var bContabilizaNoEnvio : boolean ;piIdPlanoPrev : Integer);
begin
   bContabilizaNoEnvio := True;
   qryaux.close;
   qryaux.sql.Text :=' SELECT NVL(FLGCONTABMANTIDO,0) FLGCONTABMANTIDO FROM PLANPREV WHERE IDPLANOPREV = '+inttostr(piIdPlanoPrev)+'';
   qryaux.open;

   // Valores possiveis para o flgcontamantido
   // 0 = contabiliza no envio
   // 1 = contabiliza no recebimento
   if not qryaux.isempty
   then begin
      if qryaux.fieldbyname('FLGCONTABMANTIDO').AsString = '1'
      then bContabilizaNoEnvio := False;
   end;
end;

function CalculaContribuicaoACobrarNoMes ( qryAux               : TwwQuery;
                                           piIdPessJur          : longint;
                                           piIdPlanoPrev        : longint;
                                           piIdPessoa           : longint;
                                           piSeqProposta        : longint;
                                           piIdContribuicao     : longint;
                                           psAnoMesCalculo      : string;
                                           psFlgIntEvento       : string;
                                           psDataInicioContrib  : string;
                                           psDataFinalContrib   : string;
                                           piIdMotivo           : longint;
                                           piOrigem             : word;   // 0 - Outros ,
                                                                          // 1 - Suspensao de contribuicao
                                                                          // 2 - Concessao de Beneficio
                                                                          // 3 - Renova
                                                                          // 4 - Encerramento
                                                                          // 10- Retroativo
                                           piFlgDtFinalPrevista : word;
                                           piNumProcesso        : longint;
                                           var sMsgErro         : string;
                                           var iIdLote          : integer
                            ) : double;
var

  sDataRef : string;
  sValorFinal : string;

   bErro,               bErroRegra                                   : boolean;

   sDataInicioAux                                                     : string;

   sAnoMesInicio      : string;
   sAnoMesFinal       : string;
   sAnoMesDtRefFinal  : string;
   sInscricaoData,
   sDataNasc          : string;
   dValorContribNoMes : double;
   sSalarioPart       : string;
   sFlgIntSitPartHOJE : string;
   sIdSitPart         : string;
   sSQLRegraAux       : string;
   sIdRegraCalculo    : string;
   sTpPagto           : string;
   sValorRegra        : string;
   sMsgRegra          : string;
   sIdRegra           : string;
   sDataFinal13       : String;  // Gleyber - 10/12/2004 - Pendência 18264
begin
   Result             := 0;
   dValorContribNoMes := 0;
   bErro              := False;
   iIdCalculoGeral    := -1;
   sMsgErro           := '';
   sAnoMesInicio      := Copy(psDataInicioContrib,7,4)+'/'+Copy(psDataInicioContrib,4,2);
   if psDataFinalContrib <> ''
   then sAnoMesFinal  := Copy(psDataFinalContrib,7,4)+'/'+Copy(psDataFinalContrib,4,2)
   else sAnoMesFinal  := '';


   // Buscar dados auxiliares para as querys de regra
   with qryAux do
   begin
      Close;                  
      SQL.Clear;
      SQl.Add(' SELECT PP.IDSITPART, PP.INSCRICAODATA, PF.DATANASC, SP.FLGINTERNO    '+
              ' FROM   PESSOAFISICA PF, PARTPREVPLAN PP, SITPART SP                  '+
              ' WHERE  PP.IDPESSJUR   = '+IntToStr(piIdPessjur)                       +
              ' AND    PP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)                     +
              ' AND    PP.IDPESSOA    = '+IntToStr(piIdPessoa)                        +
              ' AND    PP.SEQPROPOSTA = '+IntToStr(piSeqProposta)                     +
              ' AND    PF.IDPESSOA    = PP.IDPESSOA                                  '+
              ' AND    SP.IDSITPART   = PP.IDSITPART                                 ');
      Open;
      sInscricaoData     := FieldByName('INSCRICAODATA').AsString;
      sDataNasc          := FieldByName('DATANASC').AsString;
      // CAMILLE - 17.09.2003
      // sFlgIntSitPartHOJE := FieldByName('FLGINTERNO').AsString;
      // sIdSitPart         := FieldByName('IDSITPART').AsString;
   end;
   // CAMILLE - 17.09.2003
   if Copy(psAnoMesCalculo,6,2) = '13'
   then sIdSitPart := BuscaUltimoEvento ( qryAux,
                                     piIdPessJur,
                                     piIdPlanoPrev,
                                     piIdPessoa ,
                                     piSeqProposta,
                                     '01/12/'+Copy(psAnoMesCalculo,1,4),
                                     'IDSITPARTNOVO')
   else sIdSitPart := BuscaUltimoEvento ( qryAux,
                                     piIdPessJur,
                                     piIdPlanoPrev,
                                     piIdPessoa ,
                                     piSeqProposta,
                                     '01/'+Copy(psAnoMesCalculo,6,2)+'/'+Copy(psAnoMesCalculo,1,4),
                                     'IDSITPARTNOVO');

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT FLGINTERNO FROM CONTPREV '+
                  ' WHERE  IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                  ' AND    IDCONTRIBUICAO = '+IntToStr(piIdContribuicao));
   qryAux.Open;
   sFlgIntSitPartHOJE := qryAux.FieldbyName('FLGINTERNO').AsString;


   if sFlgIntSitPartHOJE <> 'AS'
   then begin
      sSalarioPart       := BuscaSalarioPESSOAINTEGRAL( qryAux,
                                                        piIdPessJur,
                                                        piIdPlanoPrev,
                                                        piIdPessoa,
                                                        piSeqProposta,
                                                        sFlgIntSitPartHOJE,
                                                        psAnoMesCalculo);
   end;

   // Abrir query auxiliar de contribuicao
   with dtmAprev.qryAuxContrib do
   begin
      if (not dtmAPrev.qryAuxContrib.Active) or (dtmAPrev.qryAuxContrib.FieldByName('IDPLANOPREV').AsInteger <> piIdPlanoPrev)
      then begin
         Close;
         ParamByName('IdPlanoPrev').AsInteger := piIdPlanoPrev;
         Open;
      end;
      Locate('IdContribuicao',piIdContribuicao,[]);
   end;

   // Verificar se é o primeiro ou ultimo pagamento.
   // Se for e nao tiver regra de primeiro/ultimo pagamento,
   // e nao for INSCRICAO, REINSCRICAO, MANUT., MANUT. PARC, AFASTAMENTO COM MANUTENCAO
   // Entao calcular um pro-rata do salario para passar para a regra normal de calculo da contribuicao
   if (psAnoMesCalculo    = sAnoMesInicio) and
      (sAnoMesInicio   < sAnoMesFinal) and
      (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString = '') and
      (Trim(sSalarioPart) <> '') and
      (psFlgIntEvento <> 'IP') and (psFlgIntEvento <> 'RM') and
      (psFlgIntEvento <> 'MP') and (psFlgIntEvento <> 'DM') and
      (psFlgIntEvento <> 'AF') and (psFlgIntEvento <> 'PD')
   then begin
      // Caso esteja calculando para o evento retorno de mantido p/ ativo
      // a data inicio será = a dt atual, mas o pro-rata a ser usado é o
      // último pagto, já que está cálculando as contrib. de Mantido.
      if psFlgIntEvento <> 'RA'
      then sSalarioPart := OraNumero(FloatToStr(ValorProRataPrimeiro(sSalarioPart,psDataInicioContrib)))
      else sSalarioPart := OraNumero(FloatToStr(ValorProRataUltimo(sSalarioPart,psDataFinalContrib)));
   end
   else begin
      if (psAnoMesCalculo = sAnoMesFinal) and
         (psDataFinalContrib <> '')         and
         (Copy(psAnoMesCalculo,6,2) <> '13') and
         (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString = '') and
         (Trim(sSalarioPart) <> '') and
         (psFlgIntEvento <> 'IP') and (psFlgIntEvento <> 'RM') and
         (psFlgIntEvento <> 'MP') and (psFlgIntEvento <> 'DM') and
         (psFlgIntEvento <> 'AF') and (psFlgIntEvento <> 'PD')
      then begin
         sSalarioPart  := OraNumero(FloatToStr(ValorProRataUltimo(sSalarioPart,psDataFinalContrib)));
      end;
   end;

   // Montar SQL para regra de calculo
   if Copy(psAnoMesCalculo,6,2) = '13'
   then begin
      if (StrToInt(copy(psDataInicioContrib,1,2)) >= 29) and
         (StrToInt(copy(psAnoMesCalculo,6,2)) = 2)
      then sDataRef := '28/12'+ '/' + copy(psAnoMesCalculo,1,4)
      else sDataRef := copy(psDataInicioContrib,1,2)+ '/12'+'/' + copy(psAnoMesCalculo,1,4);
   end
   else begin
      if (StrToInt(copy(psDataInicioContrib,1,2)) >= 29) and
         (StrToInt(copy(psAnoMesCalculo,6,2)) = 2)
      then sDataRef := '28/'+copy(psAnoMesCalculo,6,2) + '/' + copy(psAnoMesCalculo,1,4)
      else sDataRef := copy(psDataInicioContrib,1,2)+ '/' + copy(psAnoMesCalculo,6,2) + '/' + copy(psAnoMesCalculo,1,4);
   end;

   //leofuncef - 23052005
   If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
   Then  sDataRef := '30'+Copy(sDataRef,3,9);
   //leofuncef - fim

   sDataInicioAux := psDataInicioContrib;

   if (Copy(psAnoMesCalculo,6,2) = '13') and (dtmAPrev.qryAuxContrib.FieldbyName('IdRegraCalculo13').AsString <> '')
   then sSQLRegraAux := MontaSQLContribNOVA(  piIdPessJur,
                                              piIdPlanoPrev,
                                              piIdPessoa,
                                              piSeqProposta,
                                              piIdContribuicao,
                                              piIdMotivo,
                                              sFlgIntSitPartHOJE,
                                              psAnoMesCalculo,
                                              sDataRef,
                                              '0',
                                              sInscricaoData,
                                              sDataNasc,
                                              'N',
                                              'HSTCONTRIBPREV','VALORESPERADO',
                                              sSalarioPart,
                                              sIdSitPart,
                                              psDataInicioContrib,
                                              psDataFinalContrib,
                                              piOrigem,
                                              piNumProcesso,
                                              psAnoMesCalculo,
                                              iIdLote)
   else sSQLRegraAux := MontaSQLContribNOVA(  piIdPessJur,
                                              piIdPlanoPrev,
                                              piIdPessoa,
                                              piSeqProposta,
                                              piIdContribuicao,
                                              piIdMotivo,
                                              sFlgIntSitPartHOJE,
                                              psAnoMesCalculo,
                                              sDataRef,
                                              '0',
                                              sInscricaoData,
                                              sDataNasc,
                                              'N',
                                              'HSTCONTRIBPREV','VALORESPERADO',
                                              sSalarioPart,
                                              sIdSitPart,
                                              sDataInicioAux,
                                              psDataFinalContrib,
                                              piOrigem,
                                              pinumprocesso,
                                              psAnoMesCalculo,
                                              iIdLote);

  if (Copy(psAnoMesCalculo,6,2) = '13') and (dtmAPrev.qryAuxContrib.FieldbyName('IdRegraCalculo13').AsString <> '')
  then sIdRegraCalculo := dtmAPrev.qryAuxContrib.FieldbyName('IdRegraCalculo13').AsString
  else sIdRegraCalculo := dtmAPrev.qryAuxContrib.FieldbyName('IdRegraCalculo').AsString;

  if sIdRegraCalculo   = '' then Exit;

  // Executar Regra de Cálculo NORMAL
  sValorRegra := RegraNumerica(sIdRegraCalculo,  sSQLRegraAux, bErroRegra, iIdCalculoGeral);

  if bErroRegra
  then begin
     sMsgErro := 'Erro na Execução da Regra de Cálculo de  '+
                 dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+
                 dtmAPrev.qryAuxContrib.FieldbyName('IdRegraCalculo').AsString;
     bErro    := True;
     Exit;
  end;

  if sValorRegra = ''  then Exit;

  sValorFinal := OraNumero(sValorRegra);

  //=================================
  //=== Tratamento de décimo terceiro
  //=================================
  // Verificar se é o primeiro ou ultimo pagamento,
  // para as contribuições sobre 13 (décimo terceiro), se está no mesmo ano
  // Se for Renovacao de beneficio, não chamar regra de pro-rata de 13o.
  // pois a mesma já pode ter sido cobrada. Neste caso o sistema deve calcular
  // o 13o. integral e cobrar a diferença

  // Gleyber - 10/12/2004 - Pendência 18264 - Início
  If (psDataFinalContrib <> '') And { Augusto 17/12/2004 - Caso psDataFinalContrib estivesse vazio dava erro }
     (StrToInt(Copy(psDataFinalContrib,7,4)) > StrToInt(Copy(psAnoMesCalculo,1,4)))
    Then sDataFinal13 := '31/12/'+Copy(psAnoMesCalculo,1,4)
    Else sDataFinal13 := psDataFinalContrib;
  // Gleyber - 10/12/2004 - Pendência 18264 - Fim

  if Copy(psAnoMesCalculo,6,2) = '13'
  then begin
     sTpPagto := '';
     if (Copy(psAnoMesCalculo,1,4) = Copy(sAnoMesInicio,1,4)) and
        (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPGTO13').AsString <> '')
     then begin
        sTpPagto := 'P';
        sMsgRegra:= 'Primeiro';
        sIdRegraCalculo := dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPGTO13').AsString;
        sDataRef := copy(psDataInicioContrib,1,2)+ '/12'+'/' + copy(psAnoMesCalculo,1,4);

        //leofuncef - 23052005
        If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
        Then  sDataRef := '30'+Copy(sDataRef,3,9);
        //leofuncef - fim
     end;

     if (Copy(psAnoMesCalculo,1,4) = Copy(sAnoMesFinal,1,4)) and
        (psDataFinalContrib <> '')          and
        (sAnoMesDtRefFinal  <= sAnoMesFinal) and // CAMILLE - 06.11.2002
        (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPGTO13').AsString <> '')
     then begin
        sTpPagto := 'U';
        sMsgRegra:= 'Último';
        sIdRegraCalculo := dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPGTO13').AsString;

        sDataRef := copy(psDataFinalContrib,1,2)+ '/12'+'/' + copy(psAnoMesCalculo,1,4);

        //leofuncef - 23052005
        If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
        Then  sDataRef := '30'+Copy(sDataRef,3,9);
        //leofuncef - fim
     end;

     if sTpPagto <> ''
     then begin
        sSQLRegraAux  := MontaSQLContribNOVA(piIdPessJur,  piIdPlanoPrev,
                         piIdPessoa,
                         piSeqProposta,
                         piIdContribuicao,
                         piIdMotivo,
                         sFlgIntSitPartHOJE,
                         psAnoMesCalculo,
                         sDataRef,  sValorFinal,
                         sInscricaoData,
                         sDataNasc,
                         sTpPagto,'HSTCONTRIBPREV','VALORESPERADO',
                         sSalarioPart,sIdSitPart,
                         psDataInicioContrib,
                         //psDataFinalContrib,
                         sDataFinal13,   // Gleyber - 10/12/2004 - Pendência 18264
                         piOrigem,
                         pinumprocesso,psAnoMesCalculo,iIdLote);//leocbs - 29052002

        sValorRegra := RegraNumerica(sIdRegraCalculo, sSQLRegraAux,bErroRegra,iIdCalculoGeral);

        if bErroRegra
        then begin
           sMsgErro := 'Erro na Execução da Regra de Cálculo do '+sMsgRegra+' Pagamento sobre 13º'+
                       'de  '+dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+sIdRegraCalculo;
           bErro    := True;
           Exit;
        end;

        if sValorRegra = '' then Exit;

        sValorFinal := sValorRegra;
     end;
  end;

  // Verificar se é o primeiro ou ultimo pagamento, apenas
  // para contribuições fora <> do mês 13 (décimo terceiro)
  if Copy(psAnoMesCalculo,6,2) <> '13'
  then begin
     if (psAnoMesCalculo = sAnoMesInicio) and
        (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString <> '') and
        (
          (Trim(psDataFinalContrib) = '') or
          ((Trim(psDataFinalContrib) <> '') and (Copy(psDataInicioContrib,4,7) <> Copy(psDataFinalContrib,4,7)) )
        )
       then begin
          // Se a regra de primeiro pagamento estiver em branco, supor
          // que o valor do primeiro pagamento é igual ao valor total
          if (StrToInt(copy(psDataInicioContrib,1,2)) >= 29) and
             (StrToInt(copy(psAnoMesCalculo,6,2)) = 2)
          then sDataRef := '28/'+copy(psAnoMesCalculo,6,2) + '/' + copy(psAnoMesCalculo,1,4)
          else sDataRef := copy(psDataInicioContrib,1,2)+ '/' + copy(psAnoMesCalculo,6,2) + '/' + copy(psAnoMesCalculo,1,4);

         //leofuncef - 23052005
         If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
         Then  sDataRef := '30'+Copy(sDataRef,3,9);
         //leofuncef - fim          

          sSQLRegraAux  := MontaSQLContribNOVA(piIdPessJur,  piIdPlanoPrev,
                           piIdPessoa,
                           piSeqProposta,
                           piIdContribuicao,
                           piIdMotivo,
                           sFlgIntSitPartHOJE,
                           psAnoMesCalculo,
                           sDataRef, sValorFinal,
                           sInscricaoData,
                           sDataNasc,
                           'P','HSTCONTRIBPREV','VALORESPERADO',
                           sSalarioPart,
                           sIdSitPart,
                           psDataInicioContrib,
                           psDataFinalContrib, piOrigem,
                           pinumprocesso,psAnoMesCalculo,iIdLote); //leocbs - 29052002 - inumprocesso

          sValorRegra := RegraNumerica(dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString,
                                       sSQLRegraAux,bErroRegra,iIdCalculoGeral);

          if bErroRegra
          then begin
             sMsgErro := 'Erro na Execução da Regra de Cálculo do Primeiro Pagamento '+
                         'de  '+dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+
                         dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString;
             bErro    := True;
             Exit;
          end
          else if sValorRegra = ''
               then begin
                  sMsgErro := 'A Regra de Cálculo do Primeiro Pagamento '+
                              'de  '+dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+
                              dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString+
                              ' retornou um valor em branco';
                  bErro    := True;
                  Exit;
               end;

          //  if StrToFloat(ClienteNumero(sValorRegra)) < 0 then
          if StrToFloat(ClienteNumero(sValorRegra)) >= 0
          then sValorFinal := sValorRegra;
       end;  // if MesAtual = MesInicio

       if (psAnoMesCalculo = sAnoMesFinal) and
          (psDataFinalContrib <> '')         and
          (sAnoMesDtRefFinal <= sAnoMesFinal) and // CAMILLE - 06.11.2002
          (dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString <> '')
       then begin
             if (StrToInt(copy(psDataFinalContrib,1,2)) >= 29) and
                (StrToInt(copy(psAnoMesCalculo,6,2))   = 2)
             then sDataRef := '28/'+copy(psAnoMesCalculo,6,2) + '/' + copy(psAnoMesCalculo,1,4)
             else sDataRef := copy(psDataFinalContrib,1,2)+ '/' + copy(psAnoMesCalculo,6,2) + '/' + copy(psAnoMesCalculo,1,4);

             //leofuncef - 23052005
             If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0)
             Then  sDataRef := '30'+Copy(sDataRef,3,9);
             //leofuncef - fim

             sSQLRegraAux  := MontaSQLContribNOVA(piIdPessJur,  piIdPlanoPrev,
                              piIdPessoa,
                              piSeqProposta,
                              piIdContribuicao,
                              piIdMotivo,
                              sFlgIntSitPartHOJE,
                              psAnoMesCalculo,
                              sDataRef, sValorFinal,
                              sInscricaoData,
                              sDataNasc,
                              'U','HSTCONTRIBPREV','VALORESPERADO',
                              sSalarioPart,
                              sIdSitPart,
                              psDataInicioContrib,
                              psDataFinalContrib, piOrigem,
                              pinumprocesso,psAnoMesCalculo,iIdLote); //leocbs - 29052002 - inumprocesso

             sValorRegra := RegraNumerica(dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString,
                                          sSQLRegraAux,bErroRegra,iIdCalculoGeral);
             if bErroRegra
             then begin
                sMsgErro := 'Erro na Execução da Regra de Cálculo do Último Pagamento '+
                            'de  '+dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+
                            dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString;
                bErro    := True;
                Exit;
             end
             else if sValorRegra = ''
                  then begin
                     sMsgErro := 'A Regra de Cálculo do Último Pagamento '+
                                 'de  '+dtmAPrev.qryAuxContrib.FieldbyName('Nome').AsString+ ' Nº '+
                                 dtmAPrev.qryAuxContrib.FieldbyName('IDREGRAULTPAGTO').AsString+
                                 ' retornou um valor em branco.';
                     bErro    := True;
                     Exit;
                  end;
             if StrToFloat(ClienteNumero(sValorRegra)) >= 0
             then sValorFinal := sValorRegra;
      end; // if MesAtual = MesInicio
  end; // fim contribuicao <> 13

  dValorContribNoMes := StrToFloat(FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorFinal))));

  Result    := dValorContribNoMes;
end;//CalculaContribuicaoACobrarNoMes

// CAMILLE - 02.07.2004
function VerificaDocumentoAgrupado ( qry : TwwQuery;
                                     piCodDocumento : longint ) : boolean;
var sSQL : string;
begin
   Result := False;
   sSQL := ' SELECT COUNT(*) AS TOTAL '+
           ' FROM   DOCUMENTO         '+
           ' WHERE  CODGRUPOCNAB = ( SELECT CODGRUPOCNAB FROM DOCUMENTO WHERE CODDOCUMENTO = '+IntToStr(piCodDocumento)+')'+
           ' AND    CODDOCUMENTO <> '+IntToStr(piCodDocumento);
   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Open;
      if (not qry.IsEmpty) and (qry.FieldByName('TOTAL').AsInteger > 0)
      then Result := True;
      Close;
   end;
end; // VerificaDocumentoAgrupado

// CAMILLE - 20.07.2004
function BaixaDocumentoNAOPAGO ( CtrlDocumento      : TCtrlDocumento;
                                 qryAux             : TwwQuery;
                                 psAnoMesReferencia : string;
                                 piCodDocumentoPrev : longint;
                                 piIdPlanoPrev      : longint;
                                 psNomeContrib      : string;
                                 var sMsgErro       : string           ) : boolean;
var sNoDocumento    : string;
    iCodAlterador   : integer;
    iNumLancto      : integer;
    // Documento       : TDocumento; // CAMILE - 08.10.2004
    dValorDocumento : double;
    sDebCre         : string;
    iPlnCodigo      : integer;
begin
   Result     := False;
   sMsgErro   := '';
   iPlnCodigo := -1;

   // Se não tem documento associado sair da rotina
   if (piCodDocumentoPrev <= 0)
   then begin
      Result := True;
      Exit;
   end;

   // Verificar se o documento já está baixado
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT NODOCUMENTO, STATUS FROM DOCUMENTO WHERE CODDOCUMENTO = '+IntToStr(piCodDocumentoPrev) );
      Open;
      if FieldByName('STATUS').AsString = '2'
      then begin
         Result := True;
         Exit;
      end;
      sNoDocumento := FieldByName('NODOCUMENTO').AsString;
   end;

   // Buscar codigo do alterador
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT CODALTBAIXANPAGO FROM PLANPREV WHERE IDPLANOPREV = '+IntToStr(piIdPlanoPrev) );
      Open;
      if (IsEmpty) or (FieldByName('CODALTBAIXANPAGO').AsInteger <= 0)
      then begin
         sMsgErro := '   [ERRO  ] Documento No. '+sNoDocumento+' não pode ser baixado pois não existe alterador   '+#13+#10+
                     '            parametrizado para baixa de documentos não pagos.  Utilize  a  tela  do  menu   '+#13+#10+
                     '            Cadastros | Integração com Financeiro | Parâmetros para Cobrança via Banco  e   '+#13+#10+
                     '            parametrize o campo "Alterador para Baixa de Documentos não Pagos".             '+#13+#10+
                     '            [Mês:'+psAnoMesReferencia+'-Contrib:'+psNomeContrib+']                          ';

         Close;
         Exit;
      end;
      iCodAlterador := FieldByName('CODALTBAIXANPAGO').AsInteger;
   end;

   // Buscar valor do documento
   with qryAux do
      begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DEBCRE, VALOR FROM LANCTODOCUM '+
              ' WHERE  CODDOCUMENTO = '+IntToStr(piCodDocumentoPrev)+
              ' AND    OPERACAO     = ''2'' ');
      Open;
      if IsEmpty
      then begin
         sMsgErro := '   [ERRO  ] Documento No. '+sNoDocumento+' não pode ser baixado  pois seu lançamento  não   '+#13+#10+
                     '            foi encontrado no Contas a Receber. Verifique.                                  '+#13+#10+
                     '            [Mês:'+psAnoMesReferencia+'-Contrib:'+psNomeContrib+']                          '+#13+#10+
                     '            ATENÇÃO : ESTA CONTRIBUIÇÃO NÃO SERÁ TRATADA PELO AdmPREV.                           ';
         Close;
         Exit;
      end;
      //dValorDocumento := FieldByName('VALOR').AsFloat;
      sDebCre         := FieldByName('DEBCRE').AsString;


      //leofuncef - 13042005
      Close;
      SQL.Clear;
      SQL.Add(' SELECT ABS(SUM(DECODE(DEBCRE,''C'',VALOR,VALOR *-1))) AS VALOR '+
              ' FROM LANCTODOCUM '+
              ' WHERE  CODDOCUMENTO = '+IntToStr(piCodDocumentoPrev)+
              ' AND    OPERACAO    IN (''2'',''4'') ');
      Open;
      dValorDocumento := FieldByName('VALOR').AsFloat;
      //leofuncef - 13042005
   end;

   // Inverter DEBCRE para zerar valor do documento para lancamento com operacao 4
   if sDebCre = 'C' then sDebCre := 'D' else sDebCre := 'C';

   // Gleyber - 28/12/2004 - Pendência 18380 - Início
   Try
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('UPDATE DOCUMENTO ');
     qryAux.SQL.Add('SET EMISBLOQ = '+QuotedStr('N'));
     qryAux.SQL.Add('WHERE CODDOCUMENTO = '+IntToStr(piCodDocumentoPrev));
     qryAux.SQL.Add('  AND EMISBLOQ <> '+QuotedStr('N'));
     qryAux.ExecSQL;
   Except
     sMsgErro:='[ERRO  ] Documento No. '+sNoDocumento+#13#10+'Erro ao atualizar emissão de bloqueto no documento.';
     Exit;
   End;
   // Gleyber - 28/12/2004 - Pendência 18380 - Fim

   // Inserir lancamento com operacao 4 e alterador, para baixar o documento
   try
      // CAMILLE - 08.10.2004
      // Gleyber - 31/01/2005 - Pendência 18589
      CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador); // Gleyber - 13/01/2005 - Pendência 18454
      CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;   // CAMILLE - 08.10.2004
      CtrlDocumento.IdUsuario   := Sistema.IdUsuario;     // CAMILLE - 08.10.2004
      CtrlDocumento.LanctoDocum.SetValues( Date,                   // DataLancto
                                           piCodDocumentoPrev,     // CodDocumento
                                           0,                      // Numlancto
                                           dValorDocumento,        // Vlrliquido
                                           0,                      // ValorOM
                                           dValorDocumento,        // Valor
                                           prmUnidNegoc,           // Unidnegoc   // Gleyber - 05/09/2006 - Pendência 23243
                                           iPlnCodigo,             // liPlncodigo
                                           -1,                     // Numlotemanual
                                           Sistema.IdUsuario,      // Idusuarioinclusao
                                           Sistema.IdEmpresa,      // Idpessoa
                                           -1,                     // Idnflivro,
                                           -1,                     // Estorno
                                           -1,                     // Codtipdoc
                                           -1,                     // Coddocinss
                                           iCodAlterador,          // Codalterador
                                           '4',                    // Operacao
                                           '',                     // NumRecibo
                                           '',                     // Numnf
                                           '',                     // Numfatura
                                           'Baixa de Documento não Pago - Tratamento Divergência AdmPREV', // HistoricoCompl
                                           '',                     // Flgtipofatura
                                           'N',                    // Flgrecebeunf
                                           '',                     // Flgfatemitida
                                           sDebCre,                // Debcre
                                           Sistema.IdModulo,       // IdModulo
                                           IntegraBack.Plano,      // PlanoConta
                                           True,                   // UsaPlanoPatro
                                           False,                  // Contabiliza
                                           -1,                     // iCodPortForma
                                           0,                      // DiasFloat
                                           '',                     // ContaBaixa
                                           0                       // SubContaBaixa
                                          );
      // Gleyber - 13/01/2005 - Pendência 18454 - Início
      If Not CtrlDocumento.Insert
       Then Begin
           sMsgErro := CtrlDocumento.MessageInfo;
           Result   := False;
           Exit;
       End;
      // Gleyber - 13/01/2005 - Pendência 18454 - Fim
      
      {Documento           := TDocumento.Create;
      Documento.DiasFloat := 0;
      iNumLancto          := Documento.GerarNumLancto(qryAux, piCodDocumentoPrev);
      Documento.CriarLanctoDoc( qryAux,
                                piCodDocumentoPrev,            // coddocumento
                                iNumLancto,                    // numlancto
                                iCodAlterador,                 // codalterador
                                iPlnCodigo,                    // iPlnCodigo
                                DateToStr(Date),               // datalancto
                                dValorDocumento,               // valor
                                0,                             // valoroutramoeda
                                -1,                            // estorno
                                sDebCre,                       // debcre
                                '4',                           // Operacao
                                'Baixa de Documento não Pago - Tratamento Divergência AdmPREV', // HistoricoCompl
                                Sistema.IdUsuario,             // UsuarioInclusao
                                False,                         // bContabiliza
                                -1,                            // CodPortForma
                                '');                           // NumChequeBord
      }
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE DOCUMENTO SET STATUS = ''2'' WHERE CODDOCUMENTO = '+IntToStr(piCodDocumentoPrev) );
      qryAux.ExecSQL;
   except
      Exit
   end;
   Result := True;
end; // BaixaDocumentoNAOPAGO

// CAMILLE - 08.10.2004
// ROTINA TEMPORARIA PARA SUBSTITUICAO DOS METODOS DA UDOCUMENTO PARA
// UCTRLDOCUMENTO. A UCtrlDocumento não tem o metodo Informa_planilha
// assim resolvemos fazer um update pelo AdmPREV para, futuramente, substituir
// a rotina
function AdmPREV_Informa_Planilha( qry            : TwwQuery;
                                   piPlnCodigo    : longint;
                                   piCodDocumento : longint;
                                   piNumLancto    : longint ) : boolean;
begin
   Result := False;
   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE LANCTODOCUM SET PLNCODIGO = '+IntToStr(piPlnCodigo)+
              ' WHERE  CODDOCUMENTO = '+IntToStr(piCodDocumento)+
              ' AND    NUMLANCTO    = '+IntToStr(piNumLancto) );
      try
         ExecSQL;
      except
         Exit;
      end;
   end;
   Result := True;
end;

end.


