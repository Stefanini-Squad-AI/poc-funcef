// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Alteração   : rpDemonstrativoBeforePrint     
//WO          : WO23998
//Responsável : Paulo Nobre
//Data        : 04/08/2025
//Descrição   : Voltar a mostrar o nome da Pessoa, para ser apresentado na
//              assinatura do relatório.
//------------------------------------------------------------------------------
//Alteração  : sbtnInserirClick
//Nº WO......: 18495
//Data.......: 10/02/2025
//Responsável: Leandro Pocebon
//Descrição..: Ajuste aplicação reajuste meses posteriores ao mesmo e valor do abono
//------------------------------------------------------------------------------
//Alteração  : SalvarArquivoRevisaoBeneficio
//Nº WO......: 9432
//Data.......: 22/03/2024
//Responsável: Andre Imakawa
//Descrição..: Alteração do \\FUNCEF.COM.BR\ARQUIVOS pasta Compartilhada
//------------------------------------------------------------------------------

//Alteração  : SalvarArquivoRevisaoBeneficio
//Nº WO......: 8381
//Data.......: 28/02/2024
//Responsável: Andre Imakawa
//Descrição..: Alteração do ALTARF para \\FUNCEF.COM.BR\ARQUIVOS
//------------------------------------------------------------------------------
//Alteracao   : InserirControleDividaBenef, ExecutaParcAtivos
//Pendência   : 126276
//Responsável : edilaine
//Data        : 11/07/2023
//Descrição   : Historico de Movimentos da Divida
//------------------------------------------------------------------------------
//Alteração  : (dfm) rptDemonstrativo, qryAcJudDeficit, ppAcJudDeficit, ppBndDetalheBeforePrint
//Nº SIG.....: SIG50850
//Data.......: 12/09/2019
//Responsável: Edilaine
//Descrição..: Inclusão das Informações da Ação Judicial
//------------------------------------------------------------------------------
//Alteracao   : InserirControleDividaBenef
//Pendência   : SIG115304
//Responsável : Edilaine
//Data MERGE  : 25/01/2023
//Data        : 20/09/2021
//Descrição   : Contabilização dos tipos de dividas e provisao de perdas
//------------------------------------------------------------------------------
//Rotina      : InserirControleDividaBenef
//Pendência   : 128237
//Responsável : Edilaine
//Data        : 23/08/2022
//Descrição   : Data inicial da divida fixa em dia 20 ou proximo dia util
//------------------------------------------------------------------------------
//Alteracao   : InserirControleDividaBenef, ExecutaParcAtivos
//Pendência   : SIG33744 (SOL 231442/18314)
//Responsável : BRUNO AZEVEDO DOS SANTOS
//Data MERGE  : 05/07/2022
//Data        : 27/07/2018
//Descrição   : Criação dos campos Status, Observação e Numprocinss das dívidas de benefícios,
//              assim como a mudança de diversos controles da funcionalidade.
//              reajustar dívidas de benefícios vinculadas ao plano REG REPLAN-não Saldada
//              em janeiro
// -----------------------------------------------------------------------------
//Pendência   :  SIG 114623
//Responsável :  Ewerton Beltramini
//Data        :  29/01/2021
//Descrição   :  Implementação do comando Copy, para igualar as bases de produção.
//------------------------------------------------------------------------------
//Rotina      : sbtnCadContaCorrenteClick
//Pendência   : SIG100575
//Responsável : Edilaine
//Data        : 13/07/2020
//Descrição   : conta corrente nao estava respeitando mascara cadastrada para o banco
//--------------------------------------------------------------------------------------------------
//Alteracao   : InserirControleDividaBenef
//Pendência   : SIG56256
//Responsável : Edilaine
//Data        : 15/06/2020
//Descrição   : Atualização do numero do processo do INSS
//------------------------------------------------------------------------------
//Alteração  : sbtnInserirClick
//Nº SIG.....: 97756
//Data.......: 17/02/2020
//Responsável: Rafael Vasconcelos
//Descrição..: Alterar o valor base de cálculo da primeira cota do valor devido,
//             a rotina estava usando rValorIntegralBfciario com valores diferentes
//             na passagem das informações para calculo na regra.
//------------------------------------------------------------------------------
//Alteração  : sbtnInserirClick
//Nº SIG.....: 94938
//Data.......: 18/12/2019
//Responsável: Rafael Vasconcelos
//Descrição..: Alterar a Data Inicio a Data do Pagamento.
//------------------------------------------------------------------------------
//Alteração  : sbtnInserirClick
//Nº SIG.....: 94608
//Data.......: 29/11/2019
//Responsável: Edilaine
//Descrição..: calculo incorreto do abono, quando DATAINICIO do novo e velho sao iguais
//------------------------------------------------------------------------------
//Alteração  : sbtnInserirClick
//Nº SIG.....: 90784
//Data.......: 28/08/2019
//Responsável: Rafael Vasconcelos
//Descrição..: Considerar todas as contribuições para atualização.
//------------------------------------------------------------------------------
//Alteração  : sbtnInserirClick
//Nº SIG.....: 85197
//Data.......: 29/04/2019
//Responsável: Fabio
//Descrição..: calculo incorreto do abono, BS e FAB para o beneficiario desdobrado
//------------------------------------------------------------------------------
//Alteração  : sbtnInserirClick
//Nº SIG.....: 70825
//Data.......: 04/07/2018
//Responsável: Andre Imakawa
//Descrição..: Correção no valor da divida.
//------------------------------------------------------------------------------
//Alteração  : (sbtnInserirClick
//Nº SIG.....: 68960
//Data.......: 23/05/2018
//Responsável: Andre Imakawa
//Descrição..: Correção no valor exibido no demonstrativo.
//------------------------------------------------------------------------------
//Alteração  : (dfm qryBeneficiarios, qryBenefINSS, rpDemonstrativo, qryDemonstra)
//             qryBenefBfciario, qryHstBenefPagos, qryHstNovoBenef, qryDemonstraAux
//Nº SIG.....: 55933
//Data.......: 02/10/2017
//Responsável: Edilaine Ferraresi
//Descrição..: Inclusão do perfil de investimento
//------------------------------------------------------------------------------
//Alteração  : BuscaPlanoOrigem
//Nº SIG.....: 54212
//Data.......: 04/09/2017
//Responsável: Fernando Xavier
//Descrição..: Apenas buscar pelo Beneficio quando funcionalidade = Desdobramento.
//--------------------------------------------------------------------------------
//Alteração  : BuscaPlanoOrigem
//Nº SIG.....: SIG53535
//Data.......: 25/08/2017
//Responsável: Fernando Xavier
//Descrição..: Erro no processo de desdobramento, não está gerando taxa para o
//             beneficiário que está entrando.
//------------------------------------------------------------------------------
//Alteração  : InsereHstBenefBfciario
//SIG        : 51392
//Data       : 02/08/2017
//Responsável: Darivaldo Alencar / Andre Imakawa
//Descrição  : Tratamento de Numero de processo sempre igual a zero 
//-------------------------------------------------------------------------------
//Alteração  : sbtnInserirClick,
//Nº SIG.....: 50047
//Data.......: 14/07/2017
//Responsável: Andre Imakawa
//Descrição..: Apenas alterar tabela HSTPERCGRUPO quando IdTpPagtoBenefic = 1
//------------------------------------------------------------------------------
//Alteração  : (dfm) qryDemoContrib, qryDemonstra, rpDemonstrativo
//Nº SIG.....: 32303
//Data.......: 31/10/2016
//Responsável: Edilaine Ferraresi
//Descrição..: Equacionamento - separação das contribuições em grupo
//------------------------------------------------------------------------------
//Alteracao   : InserirControleDividaBenef,
//SIG         : 27210
//Responsável : Peterson Victor
// Data       : 09/11/2016
//Descrição   : Inclusão do numero do processo na tabela CONTROLEDIVIDABENEFICIO
//------------------------------------------------------------------------------
//Alteracao   : sbtnInserirClick
//No. DIG     : SIG 34272
//Responsável : André Imakawa
// Data       : 01/12/2016
//Descrição   : A rotina não esta reajustando o benefício quando concedido de um
//              ano para outro.
//------------------------------------------------------------------------------
//Alteracao   : sbtnInserirClick
//No. DIG     : SIG 24451
//Responsável : William Santana
// Data       : 27/06/2016
//Descrição   : o sistema está lançando a Data Prevista igual ao mês referência,
//             quando o correto é lançar a data de pagamento do lote o qual foi lançado
//------------------------------------------------------------------------------
//Alteracao   : qryHstNovoBenef, updHstNovoBenef, sbtnInserirClick
//No. DIG     : SIG 20745
//Responsável : Edilane
// Data       : 13/05/2016
//Descrição   : para as pensões o sistema não está calculando taxas para o abono
//              anual do novo pensionista
//------------------------------------------------------------------------------
//Alteracao   : sbtnInserirClick
//No. DIG     : SIG 20749
//Responsável : Edilane
// Data       : 11/05/2016
//Descrição   : quando o pagamento cai na DIB, esta buscando os valores do BS e
//              FAB na historico de beneficio e retornando o valor proporcionalizado
//------------------------------------------------------------------------------
//Pendência   : SOL 253577-18114  PPM 1292515
//Responsável : Fernando Xavier
// Data       : 22/02/2016
//Descrição   : Alteração do Desdobramento para tratar nova forma de associação de
//             contribuição e geração de número de processo individual para cada
//             benefício
//------------------------------------------------------------------------------
//Alteracao   : (.dfm) qryBeneficiarios, qryHstBenefPagos
//Pendência   : SOL 253577-17664  PPM 1019932
//Responsável : Fernando Xavier
// Data       : 25/09/2015
//Descrição   : Desdobramento de Benefícios Título: Alteração da funcionalidade
//              de Desdobramento de Benefícios do módulo BeneficioPrev, para
//              atender as regras do equacionamento.
//------------------------------------------------------------------------------
//Pendência   : SOL Nº 228244-16260 PPM Nº 442505
//Responsável : Helio Lima Custodio
//Data        : 31/07/2014
//Descrição   : Parametrização de Parcelamento de Dívida de Benefícios
//------------------------------------------------------------------------------
//Pendência   : SOL 182092/14207 15207 15253 KITANTA 1969056
//Responsável : Felipe A. Santos/Marcio Sanches Spinosa
//Data        : 09/12/2013
//Descrição   : Mudana na rotina AcertoBeneficio igualando o valorcalculado com
//              o valorintegral
//------------------------------------------------------------------------------
//Pendência   : SOL 225783 KINTANA 2059230
//Responsável : Douglas Siqueira
//Data        : 06/02/2014
//Descrição   : :   **ERRO CÁLCULO RETROATIVO/DESDOBRAMENTO** Em decorrência da nova funcionalidade que entrou em produção,
//a funcionalidade Cálculo Retroativo e Desdobramento estão apresentando os seguinte erros: Ao rodar uma revisão, cujo saldo
//é negativo, o sistema pergunta "Deseja Parcelar?" se clicarmos em "NÃO", o sistema está lançando tudo como processado,
//quando o correto é lançar no histórico normalmente A PROCESSAR. O sistema deve lançar processado somente se optar pelo SIM
//no parcelamento. O outro erro é que, caso haja algum registro A PROCESSAR no histórico, e eu rode um outro período,
//o sistema não deve alterar o registro anterior..
//------------------------------------------------------------------------------
//Pendência   : SOL 174933 KINTANA 1733374
//Responsável : Douglas Siqueira
//Data        : 10/01/2014
//Descrição   : Controle de Saldo devedor.
//------------------------------------------------------------------------------
//Pendência   : SOL 213339 KINTANA 2054769
//Responsável : William Moreira da Silva
//Data        : 05/12/2013
//Descrição   : Ajustar a rotina de concessão de Pensão
//------------------------------------------------------------------------------
//Pendência   : SOL 208274.15065 Kintana 2043014
//Responsável : Thiago Melo
//Data        : 28/08/2013
//Descrição   : inclusão do campo DATAMORTE na qry de entrada
//--------------------------------------------------------------------------------
//Pendência   : SOL 192563 KINTANA 1877175
//Responsável : Fernando Xavier
//Data        : 06/12/2012
//Descrição   : Arrendodar os valores tratados na tela com duas casas decimais.
//--------------------------------------------------------------------------------
//Pendência   : SOL 202689 Kintana 1958612
//Responsável : Fernando Xavier
//Data        : 12/03/2013
//Descrição   : Desdobramento inserindo o benefício funcef como retido
//--------------------------------------------------------------------------------
//Pendência   : SOL 171026 KITANTA 1528962
//Responsável : Douglas Siqueira
//Data        : 05/11/2012
//Descrição   : Desdobramento
//--------------------------------------------------------------------------------
//Pendência   : SOL 170746 KITANTA 1527589
//Responsável : BRUNO AZEVEDO
//Data        : 27/12/2011
//Descrição   : Ajuste na query do monta select.
//--------------------------------------------------------------------------------
//Pendência   : SOL 162759 e SOL 162523
//Responsável : BRUNO AZEVEDO
//Data        : 29/09/2011
//Descrição   : Correção no desdobramento com Luciano e Hebio.
//--------------------------------------------------------------------------------
//Pendência   : SOL 162498 KINTANA 1381180
//Responsável : BRUNO AZEVEDO
//Data        : 02/08/2011
//Descrição   : Correção no desdobramento na consulta da hstbenefbfciario.
//--------------------------------------------------------------------------------
//Pendência   : SOL 159668 KINTANA 1348868
//Responsável : BRUNO AZEVEDO
//Data        : 06/07/2011
//Descrição   : Gravar o campo valornadib na benefbfciario.
//--------------------------------------------------------------------------------
//Pendência   : SOL 159391 KINTANA 1309682
//Responsável : BRUNO AZEVEDO
//Data        : 10/06/2011
//Descrição   : Ajuste na query do monta select.
//--------------------------------------------------------------------------------
//Pendência   : SOL 159974 KINTANA 1327873
//Responsável : Fernando Xavier
//Data        : 17/06/2011
//Descrição   : Erro na inserção da fonte pagadora
//--------------------------------------------------------------------------------
//Pendência   : SOL 86089 KINTANA 523183
//Responsável : BRUNO AZEVEDO
//Data        : 18/10/2010
//Descrição   : Gravar o campo "LoteOriginal" ao inserir na Hstbenefbfciario.
//--------------------------------------------------------------------------------
// Autor(a)  :  Thiago Passos
// Data      :  05/03/2010
// Pendência :  SOL 131674 Kintana 752152
// Descricao :  Ajustando o controle de transação
// --------------------------------------------------------------------------------------
//Autor(a)     : Daniel Begnami
//Data         : 10/03/2009
//Pendência    : SOL:110091 KT: 503890
//Rotina       : sbtnInserirClick
//Descricao    : Não reajustar os beneficios no momento do desdobramento.
//------------------------------------------------------------------------------
//Autor(a)     : Daniel Begnami
//Data         : 04/03/2009
//Pendência    : SOL:109597 KT: 497581
//Rotina       : sbtnInserirClick
//Descricao    : Caso ocorra qualquer erro no processo executar o ROLLBACK.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 13/08/2007
// Rotina      : sbtnInserirClick
// Pendência   : 26087
// Descricao   : Passar novo parametro para que retona mes do abono.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 20/07/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 14/05/2007
// Pendência   : 25268
// Descricao   : Limpeza do código
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 01/03/2007
// Pendência   : 24639
// Descricao   : 1) Atualizar os dados alterados pela tela de parcelamento
//               2) Exibir opção para selecionar o beneficio a processar no desdobramento
// Data        : 02/03/2007
// Descricao   : 1) Calcular contribuição de pensionista até a datafinal do processo
//                  e não até a data do lote.
// Data        : 05/03/2007
// Descricao   : 1) Outros acertos
//               2) QryTitular - Retirar FLGDESATIVADO = 0
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 23/02/2007
// Pendência   : 24569
// Descricao   : Passar para a regra de reajuste a data de inicio (DIP) do beneficio
//               pois um beneficio que irá ser pago deve ser reajustado desde a data
//               inicio original e não a data em que ele entrou no processo
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 05/12/2006
// Pendência   : 23930
// Descricao   : Novo parametro para Identificação do titular
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 26/09/2006
// Rotina      : bbtnOkDetClick
// Descricao   : Incluir IDSITPLANOPREV na query de Plano Contabil
//------------------------------------------------------------------------------
//  Autor(a)   : Augusto
//  Data       : 27/03/2006
//  Rotina     : AcertaBeneficio
//  Descrição  : Novos parametros.
//  Data       : 12/05/2006
//  Descrição  : Acerto na gravação do PERCENTUAL
//------------------------------------------------------------------------------
//  Autor(a)   : Augusto
//  Data       : 14/02/2006
//  Pendencia  : 19533
//  Descrição  : 1) Atualizar o percentual de rateio de pensão com a cota pelo
//                  numero de beneficiários ativos.
//               2) Incluir CtrlBenefBfciario
//------------------------------------------------------------------------------
//  Autor(a)   : Leo
//  Data       : 25/04/2005
//  Descrição  : correção da modificação abaixo, estava escrito PERCENTAUL ao invés de PERCENTUAL
//------------------------------------------------------------------------------
//  Autor(a)   : Augusto
//  Data       : 04/03/2005
//  Descrição  : Incluir atualização do campo PERCENTUAL na HSTBENEBFCIARIO
//------------------------------------------------------------------------------
//  Rotina     : sbtnInserirClick
//  Autor(a)   : Leo
//  Data       : 23/11/2004
//  Descrição  : tratamento do IDPLANPREVCONTAB da BENEFBFCIARIO
//------------------------------------------------------------------------------
//  Rotina     : EfetuaParcelamento
//  Autor(a)   : Augusto
//  Data       : 23/11/2004
//  Descrição  : Caso a rubrica esteja bloqueada cancela
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : sbtnInserirClick
//  Data       : 28/10/2004
//  Descrição  : correção no cálculo de abono
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : sbtnInserirClick
//  Data       : 27/10/2004
//  Descrição  : verifica se o adiantamento de abono e o abono estão sendo
//               inseridos no mesmo cálculo. Caso estejam, deleta os adiantamentos e
//               lança apenas o abono
//------------------------------------------------------------------------------
// Rotina      : EfetuaParcelamento
// Pendencia   : 17815
// Autor(a)    : Augusto
// Data        : 27/10/2004
// Descricao   : Buscar sempre proxima SEQUENCIA da rubrica
//------------------------------------------------------------------------------
// Rotina      : sbtnInserirClick
// Autor(a)    : Augusto
// Pendência   : 17707
// Data        : 17/09/2004
// Descricao   : Acerto na calculo do valor do primeiro pagamento para o beneficiario antigo
// Pendência   : 17692
// Data        : 15/09/2004
// Descricao   : Acerto na gravacao do campo VALORTOTAL
//------------------------------------------------------------------------------
// Rotina      : -----
// Autor(a)    : Leo
// Data        : 01.09.2004
// Descricao   : acrescentei os campos HST.IDMOTIVO,  HST.MES à qryHstBenefPagos
//------------------------------------------------------------------------------
// Rotina      : sbtnInserirClick
// Autor(a)    : Augusto
// Data        : 26/08/2004
// Descricao   : Novos parametros para GeraContribBenef
// Data        : 25/08/2004
// Descricao   : 1) Novo calculo do valor do abono, fazendo os pro-ratas levando em consideração
//               os percentuais em cada periodo.
//               Passagem da DATAINICIOANT para a regra de raeajuste, porque beneficio ainda
//               não esta na base
// Data        : 19/08/2004
// Descricao   : Acerto na qry de beneficios do historico pagos (QryBEnefHstPagos)
//               para totalizar os acertos.
// Data        : 16/08/2004
// Descricao   : Gravar Lote na RUBRICAINDIV
// Data        : 16/08/2004
// Descricao   : Acerto no calculo do ultimo pagamento
// Data        : 11/08/2004
// Descricao   : Novo tratamento para Parcelamento de Divida
// Data        : 09/08/2004
// Descricao   : Acertos no tratamento de abono
// Data        : 03/08/2004
// Descricao   : Acertos para o caso do beneficio incluido terminar antes do mes do lote.
// Data        : 29/07/2004
// Descricao   : Abono deve ser calculado da DIP e não da DIB
// Data        : 01/07/2004
// Descricao   : Inclusão da rotina de geração automática de matricula
//------------------------------------------------------------------------------
// Rotina      : -----
// Autor(a)    : Camille
// Pendência   : 14822 e 14823
// Data        : 28.06.2004
// Descricao   : Acerto na gravacao do campo DATAPAGAMENTO
//------------------------------------------------------------------------------
// Rotina      : sbtnInserirClick
// Autor(a)    : Augusto
// Data        : 24/03/2004
// Descricao   : MESREFERENCIA do ABONO
// Data        : 01/04/2004
// Descricao   : Acerto no controle de data final.
// Data        : 29/04/2004
// Descricao   : Acerto nos parametros da pesquisa
// Data        : 03/05/2004
// Descricao   : Acerto nas pesquisas de PLANOORIGEM
//------------------------------------------------------------------------------
// Rotina      : sbtnInserirClick
// Autor(a)    : Gleyber
// Data        : 23/03/2004
// Pendência   : 16321
// Descricao   : Acertado a passagem de campos para a funcao ExecutaRegraDataPgtoBeneficio
//------------------------------------------------------------------------------
// Rotina      : sbtnInserirClick
// Autor(a)    : Gleyber
// Data        : 17/03/2004
// Pendência   : 16251
// Descricao   : Retirado o comentário sobre a regra de Data Final e incluído uma
//               condição para só rodar caso o benefício em questão tenha regra.
//------------------------------------------------------------------------------
// Rotina      : sbtnInserirClick
// Autor(a)    : Gleyber
// Data        : 10/03/2004
// Pendência   : 16177
// Descricao   : Se não informar a data final então considerar mesreferencia do lote
//------------------------------------------------------------------------------
// Rotina      : PagaMesPagAbono
// Autor(a)    : LeoFuncefProvisorio
// Data        : 04/02/2004
// Descricao   : mudança da chamada
//------------------------------------------------------------------------------
// Autor     : Augusto
// Data      : 06/01/2004
// Descrição : Varias, comentadas n código para viabilizar desdobramento de beneficios
//             para beneficiciarios em planos diferentes (FUNCEF)
// -----------------------------------------------------------------------------
// Autor     : Augusto
// Data      : 11/2003
// Descrição : Varias, comentadas n código para viabilizar processo na FUNCEF
// -----------------------------------------------------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Gleyber
// Data      : 06/11/2003
// Pendência : 15566
// Alteração : O campo DATAPAGAMENTO passa a gravar a data do calendário e não
//             mais a data do lote.
// -----------------------------------------------------------------------------
// Rotina    : MostraDemonstrativoConcessao
// Autor(a)  : Leo
// Data      : 31/10/2003
// Descrição : alteração do demonstrativo para mostrar as contribuições corretamente
//             por recebedor
// -----------------------------------------------------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Gleyber
// Data      : 30/10/2003
// Pendência : 15514
// Alteração : Alterada a posição de pesquisa do valor total para fora do While.
// -----------------------------------------------------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Gleyber
// Data      : 30/10/2003
// Pendência : 15502 e 15479
// Alteração : Passa a data inicial do beneficio para a funcao ReajustaBenefConc
// -----------------------------------------------------------------------------
// Rotina    : MostraDemonstrativoConcessao
// Autor(a)  : Leo
// Data      : 28/10/2003
// Descrição : alteração do demonstrativo para mostrar as contribuições calculadas.
// -----------------------------------------------------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Leo
// Data      : 28/10/2003
// Alteração : chamada da rotina GeraContribBenef de cálculo das contribuições
//             dos pensionistas
// -----------------------------------------------------------------------------
// Rotina    : MostraDemonstrativoConcessao
// Autor(a)  : Augusto
// Data      : 25/10/2003
// Alteração : Rotina usava a DIB ao invez da DIP para calculos
// -----------------------------------------------------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Augusto
// Data      : 17/10/2003
// Alteração : Rotina usava a DIB ao invez da DIP para calculos
// -----------------------------------------------------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Carlos Guedes
// Data      : 09.10.2003
// Pendencia : 15133
// Alteração : 1 - Acertando a localização e os parâmetro da função TrataBeneficioPosMorte,
//             2 - passando a AnoMesFinal correto para o while,
//             3 - pegando o valor do benef. correto para cada beneficiário,
//             4 - passando valor correto para a função de reajuste,
//             5 - alimentando o campos valorintegral para sair no demonstrativo,
//             6 - acrescentando o beneficiário na regra do benefício mínimo.
// -----------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Camille
// Data      : 17.09.2003
// Pendencia : 14971
// Alteração : Gravação do ultmespreparo
// -----------------------------------------------------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Gleyber
// Data      : 03/09/2003
// Pendencia : 14971
// Alteração : Ao desdobrar um benefício considerar o tipo de pagamento pelo flag interno.
// -----------------------------------------------------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Augusto
// Data      : 22/08/2003
// Pendencia : 14905
// Alteração : beneficios Encerrados não estão mais sendo considerados no desdobramento.
// -----------------------------------------------------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Augusto
// Data      : 11/08/2003
// Pendencia : 3911
// Alteração : Acerto no controle de DATADEPAGAMENTO
// -----------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Augusto
// Data      : 09/05/2003
// Alteração : Acerto no Controle de beneficios de Pagamento Unico
// -----------------------------------------------------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Carlos Guedes
// Data      : 05/05/2003
// Alteração : If sIdTpPagtoBenefic = '1' Then sAnoMesAtual := sAnoMesFinal;
// -----------------------------------------------------------------------------
// Rotina    : bbtnProcurarClick
// Autor(a)  : Augusto
// Data      : 24/04/2003
// Alteração : Critica caso processo esteja encerrado foi retirado. Pendencia 13478
//             beneficio pode ser encerrado e depois desdobrado.. (caso entre novo beneficiario)
//             Inclusão do campo FLGPROVISORIO na qryHstBenefPagos.
// -----------------------------------------------------------------------------
// Rotina    : ReajustaBenefConc
// Autor(a)  : Camille
// Data      : 20.01.2003
// Alteração : Passagem do novo parametro (pbRetroativo) para ReajustaBenefConc
// -------------------------------------------f----------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Gleyber
// Data      : 06/01/2003
// Alteração : Ao inserir um registro na HSTBENEF, passa a inserir o FLGPROVISORIO
// -----------------------------------------------------------------------------
// Rotina    : CalculaBeneficioMinimoLocal
// Autor(a)  : Augusto
// Data      : 03/12/2002
// Alteração : Criação da Rotina
// -----------------------------------------------------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Gleyber
// Data      : 14/11/2002
// Alteração : Colocando para rodar a regra de benefício mínimo
// -----------------------------------------------------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Gleyber
// Data      : 14/11/2002
// Alteração : Colocando o valor do VLBENEFPGTO para NULL na inserção na HST
// -----------------------------------------------------------------------------
// Rotina    : sbtnInserirClick
// Autor(a)  : Carlos Guedes
// Data      : 23/10/2002
// Alteração : Acetando datafinal e datainicio que é passada para a rotina de calculo
// -----------------------------------------------------------------------------
// Rotina    : CriaLogOcorrencia
// Autor(a)  : Camille
// Data      : 13.08.2002
// Alteração : Gravação do Lote da Movimentacao de Beneficio
// -----------------------------------------------------------------------------
// Rotina    : PegaValorEmReal
// Autor(a)  : Carlos Guedes
// Data      : 22/07/2002
// Alteração : Acrescentado mais um campo na função (MESREFERENCIA)
// -----------------------------------------------------------------------------
// Rotina    : CalculaBeneficioAPagarNoMes
// Autor(a)  : Carlos Guedes
// Data      : 13.06.2002
// Alteração : Após selecionado registro no MontaSelect, era alimentada a qryBeneficio
//  apenas por NUMEROPROCESSO, que poderia vir com mais de um BENEFICIO.
//  A rotina só estava considerando o primeiro registro.
// -----------------------------------------------------------------------------


unit FDesdobramentoBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Wwdbigrd, Grids, Wwdbgrid, Db, DBTables,
  Wwquery, Mask, wwdbedit, Wwdatsrc, MontaSelect, Menus, wwdblook, DBGrids,
  uCtrlBenefBfciario, ppBands, ppCache, ppClass, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppPrnabl, ppVar, FPreview,
  ppStrtch, ppSubRpt, ShellApi, FileCtrl, ucmfileutils;

type


  PessoaXProcesso = record
         iIdPessoa        :  Integer;
         Proces        :  Integer
  end;
  // edilaine - 22/01/2014 - SOL 174933
  TRegParcelamento = Record
    bFlgFezParcelamento : boolean;
    sSQLBusca : string;
  end;

  // edilaine - SOL 253577-17664 / PPM 1019932 - inicio
  TRecPosicao = record
                  rLeft : double;
                  rWidht : double;
                end;
  // edilaine - SOL 253577-17664 / PPM 1019932 - fim

  TfrmDesdobramentoBenef = class(TfrmOkCancelar)
    pnlConsulta: TPanel;
    pnlRevisao: TPanel;
    pnlProcesso: TPanel;
    bbtnProcurar: TBitBtn;
    stxtTitulo: TStaticText;
    Panel2: TPanel;
    sbtnTitular: TSpeedButton;
    sbtnCadContaCorrente: TSpeedButton;
    sbtnDetBeneficiario: TSpeedButton;
    memTitular: TMemo;
    memBeneficiario: TMemo;
    stxtProcesso: TStaticText;
    pnlBeneficios: TPanel;
    Label12: TLabel;
    Label5: TLabel;
    qryProcesso: TwwQuery;
    dsProcesso: TwwDataSource;
    dbedEvento: TwwDBEdit;
    dbedDtEvento: TwwDBEdit;
    Label1: TLabel;
    dbedDtRegistro: TwwDBEdit;
    qryBeneficio: TwwQuery;
    dsBeneficio: TwwDataSource;
    qryBeneficiarios: TwwQuery;
    dsBeneficiarios: TwwDataSource;
    MontaSelect: TMontaSelect;
    qryTitular: TwwQuery;
    qryAux: TwwQuery;
    qryBeneficiarioEmUso: TwwQuery;
    updHstBenefPagos: TUpdateSQL;
    qryBenefAUX: TwwQuery;
    dsHstBenefPagos: TwwDataSource;
    Panel1: TPanel;
    sbtnInserir: TSpeedButton;
    StaticText1: TStaticText;
    dbgrdBeneficiarios: TwwDBGrid;
    qryBenefBfciario: TwwQuery;
    updBenefBfciario: TUpdateSQL;
    updHstNovoBenef: TUpdateSQL;
    qryHstNovoBenef: TwwQuery;
    dsHstNovoBenef: TwwDataSource;
    updBeneficiarios: TUpdateSQL;
    Label6: TLabel;
    dblkpcmbBeneficio: TwwDBLookupCombo;
    sbtnConcedeUm: TSpeedButton;
    qryContaBancaria: TwwQuery;
    updBenefINSS: TUpdateSQL;
    qryBenefINSS: TwwQuery;
    updHstNovoINSS: TUpdateSQL;
    qryHstNovoINSS: TwwQuery;
    QryBeneficiariosValidos: TwwQuery;
    qryloop: TwwQuery;
    qryNucleoFamiliar: TwwQuery;
    qryHstBenefPagos: TwwQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ppDemonstrativo: TppBDEPipeline;
    rpDemonstrativo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppBndDetalhe: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLine14: TppLine;
    lbl_usuario: TppLabel;
    lblNomUsuario: TppLine;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppImage2: TppImage;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    qryDemonstra: TwwQuery;
    dsDemonstra: TDataSource;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppLabel60: TppLabel;
    ppDBText27: TppDBText;
    ppLabel65: TppLabel;
    ppDBText28: TppDBText;
    ppLabel67: TppLabel;
    ppDBText43: TppDBText;
    ppLabel70: TppLabel;
    ppLabel73: TppLabel;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppLabel74: TppLabel;
    ppDBText47: TppDBText;
    ppLblValorTotal: TppLabel;
    ppLblValorAtual: TppLabel;
    ppVlrValorTotal: TppDBText;
    ppVlrValorAtual: TppDBText;
    ppLblBaseDeficit: TppLabel;
    ppVlrBaseDeficit: TppDBText;
    ppLblBSTotal: TppLabel;
    ppVlrBSTotal: TppDBText;
    ppLblBSAtual: TppLabel;
    ppVlrBSAtual: TppDBText;
    ppLblFABTotal: TppLabel;
    ppVlrFABTotal: TppDBText;
    ppLblFABAtual: TppLabel;
    ppVlrFabAtual: TppDBText;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel59: TppLabel;
    ppLine13: TppLine;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    SubRelDivida: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    qryDivida: TwwQuery;
    ppQtdParc: TppLabel;
    ppVlrParc: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    SubRelContrib: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppLabel5: TppLabel;
    ppShape2: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    SubRelAcertos: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppShape4: TppShape;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    lbl_total: TppLabel;
    lbl_tot_contri: TppLabel;
    lbl_tot_benef: TppLabel;
    ppShape1: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape3: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    SubRelBenef: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppShpMes: TppShape;
    ppShpPercAnt: TppShape;
    ppShpPercAtu: TppShape;
    ppShpBSDev: TppShape;
    ppShpFABDev: TppShape;
    ppShpBenefDev: TppShape;
    ppShpBenefPag: TppShape;
    ppShpDif: TppShape;
    ppShpTotal: TppShape;
    ppShpDeficit: TppShape;
    ppLblMes: TppLabel;
    ppLblPercAnt: TppLabel;
    ppLblPercAtu: TppLabel;
    ppLblDif: TppLabel;
    ppLblBenefDev: TppLabel;
    ppLblBenefPag: TppLabel;
    ppLblTotal: TppLabel;
    ppLblBSDev: TppLabel;
    ppLblFABDev: TppLabel;
    ppLblDeficit: TppLabel;
    ppShpBenefLatE: TppShape;
    ppLblPercAtuDet: TppDBText;
    ppLblDifDet: TppDBText;
    ppLblBenefDevDet: TppDBText;
    ppLblBenefPagDet: TppDBText;
    ppLblTotalDet: TppDBText;
    ppLblPercAntDet: TppDBText;
    ppLblBSDevDet: TppDBText;
    ppLblFABDevDet: TppDBText;
    ppLblDeficitDet: TppDBText;
    ppShpBenefDet: TppShape;
    ppShpBenefLatD: TppShape;
    qryDemoContrib: TwwQuery;
    dsDemoContrib: TDataSource;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText8: TppDBText;
    qryDemoBenef: TwwQuery;
    dsDemoBenef: TDataSource;
    ppHeaderBand2: TppHeaderBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppContribuicao: TppBDEPipeline;
    ppBeneficio: TppBDEPipeline;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    QryBuscaContrib: TwwQuery;
    SubRelSemacerto: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    ppShape9: TppShape;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel15: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    qryDemonstraAux: TwwQuery;
    lblPerfilInv: TppLabel;
    ppDBText11: TppDBText;
    qryAcJudDeficit: TwwQuery;
    qryAcJudDeficitIDCONTRIBUICAO: TFloatField;
    qryAcJudDeficitNOME: TStringField;
    qryAcJudDeficitPERCACJUDDEFICIT: TFloatField;
    qryAcJudDeficitANOMESINIACJUDDEFICIT: TStringField;
    qryAcJudDeficitANOMESFIMACJUDDEFICIT: TStringField;
    dsAcJudDeficit: TwwDataSource;
    ppAcJudDeficit: TppBDEPipeline;
    ppAcJudDeficitppField1: TppField;
    ppAcJudDeficitppField2: TppField;
    ppAcJudDeficitppField3: TppField;
    ppAcJudDeficitppField4: TppField;
    ppAcJudDeficitppField5: TppField;
    SubRelAcaoJud: TppSubReport;
    ppChildReport6: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppShapeTitleBandAcJudDeficit1: TppShape;
    ppLabelTitleBandAcJudDeficit1: TppLabel;
    ppShapeTitleBandAcJudDeficit2: TppShape;
    ppLabelAcJudANOMESFIMACJUDDEFICIT: TppLabel;
    ppLabelAcJudANOMESINIACJUDDEFICIT: TppLabel;
    ppLabelAcJudPERCACJUDDEFICIT: TppLabel;
    ppLabelAcJudNOME: TppLabel;
    ppLineTitleBandAcJudDeficit3: TppLine;
    ppLineTitleBandAcJudDeficit2: TppLine;
    ppLineTitleBandAcJudDeficit1: TppLine;
    ppDetailBand5: TppDetailBand;
    ppShapeDetailBandAcJudDeficit1: TppShape;
    ppLineDetailBandAcJudDeficit3: TppLine;
    ppLineDetailBandAcJudDeficit2: TppLine;
    ppLineDetailBandAcJudDeficit1: TppLine;
    ppDBTextAcJudANOMESINIACJUDDEFICIT: TppDBText;
    ppDBTextAcJudANOMESFIMACJUDDEFICIT: TppDBText;
    ppDBTextAcJudPERCACJUDDEFICIT: TppDBText;
    ppDBTextAcJudNOME: TppDBText;
    ppLabelLote: TppLabel;
    ppLabelVersao: TppLabel;
    ppSummaryBand6: TppSummaryBand;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnTitularClick(Sender: TObject);
    procedure sbtnDetBeneficiarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryBeneficioAfterScroll(DataSet: TDataSet);
    procedure dbgrdDemonstrativoCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure sbtnConcedeUmClick(Sender: TObject);
    procedure sbtnCadContaCorrenteClick(Sender: TObject);
    procedure dblkpcmbBeneficioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//SOL 174933 KINTANA 1733374

    procedure InserirControleDividaBenef(_IDPESSOA,_IDTITULAR,_IDBENEFICIO,_IDPLANOPREV,_DATA,_VALORBENEFICIO,
                                         _VALORULTIMAPARCELA,_IDMOTIVO,_FLGDESATIVADO,_FLGATUALIZARSALDO,
                                         _FLGQUITADO,_FLGDESCFOLHA,_FLGPORTFORMA,_IDPESSJUR,_MESREFERENCIA,
                                         _FLGSITUACAO,_MESCOBRANCA,_FONTEPAGADORA,
                                         _NUMPROCINSS :string;                                       //edilaine SIG56256
                                         _percRed,_vldivida:double;
                                         _flgvaiatualizar:Boolean;
                                         var IDHSTORICODIVIDABENEFICIO,IDCONTROLEDIVIDABENEFICIO:string;
                                         _flgvaiparcelar:boolean;  // Douglas.Siqueira 174933
                                         NUMPROCESSO : Integer);   // Peterson Victor SIG27210

    function  GetMensagem(_idmessage:integer):string;///Douglas.Siqueira 174933
    function VerificarParcelamentoAtivo(_idpessoa,_idtitular,_fontepagadora:string):Boolean;///Douglas.Siqueira 174933
    function ExecutaParcAtivos(_idpessoa,_idtitular,_SaldoRevisao,_fontepagadora,_mespagamento,_idbeneficio:string; var IDHSTORICODIVIDABENEFICIO,IDCONTROLEDIVIDABENEFICIO:string; var cancelou,pular:boolean ):Double;
    procedure rpDemonstrativoBeforePrint(Sender: TObject);
    procedure ppBndDetalheBeforePrint(Sender: TObject);
    procedure ppTitleBand3BeforePrint(Sender: TObject);
    procedure ppDetailBand6BeforePrint(Sender: TObject);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1AfterPrint(Sender: TObject);
    procedure ppFooterBand1BeforePrint(Sender: TObject);///Douglas.Siqueira 174933
//SOL 174933 KINTANA 1733374

  private
    { Private declarations }

    // fernando xavier - SOL 253577-17664 / PPM 1019932
    sValorTotalBS,       sValorTotalBSAnt,      sValorNoMesBS,
    sValorTotalFAB,      sValorTotalFABAnt,     sValorNoMesFAB,
    sValorTotalDeficit,  sValorTotalDeficitAnt, sValorNoMesDeficit,
    sNovoValorRateadoBS, sNovoValorRateadoFAB,
    sValorAbonoBS,       sValorAbonoFAB,        sValorAbonoDeficit,

    sValorParcialUltimoBS,    sValorParcialUltimoFAB,    sValorParcialUltimoDeficit,
    sValorParcialPrimeiroBS,  sValorParcialPrimeiroFAB,  sValorParcialPrimeiroDeficit,
    sValorIntegralBfciarioBS, sValorIntegralBfciarioFAB, sValorIntegralBfciarioDeficit,
    sValorFinalBfciarioBS,    sValorFinalBfciarioFAB,    sValorFinalBfciarioDeficit,
    sVlrBSReajustado,         sVlrFABReajustado,         sVlrDeficitReajustado,
    sValorIntegralBS,         sValorIntegralFAB,         sValorIntegralDeficit,
    sValorIntegralAntigoBS,   sValorIntegralAntigoFAB,   sValorIntegralAntigoDeficit  : string;

    bApresentaBSFAB, bApresentaDeficit : boolean;
    totalBenef, totalContrib : double;
    sdataInicioDesdobra, sListaProcesso : string;
    imprimiuRodapteGrupoRelatorio : Boolean;
    // fernando xavier - SOL 253577-17664 / PPM 1019932
    iIdUsuarioAutoriza      : longint;
    iIdLoteConcessao : longint;
    iFlgIncluiMesConc : integer;
    iIdSitPart,            iIdSitFunc,               iIdSitPlanoPrev,
    iNumeroProcesso,       iIdTitular,               iIdPessJur,
    iNumeroProcessoNovo,   iSeqBeneficio, iSeqBeneficio13, //SOL 253577-18114 PPM 1292515 17/02/2016

    iIdPlanoPrev,            iIdPlanoPrevTit,             iIdEvento,
    iIdPlanoOrigem,          iIdPessoa,                iSeqProposta,

    iIdBeneficio, iIdCalculo                           : longint;

    // Dados da tela de informacoes do novo beneficiario
    sNumProcINSS,          sDtRequerimento,       sAnoMesPagamento,
    sDtInicioINSS,         sDtInicioFund,         sDataInicio,
    sDataInicioOriginal,
    sDataFinal,            sVlrInfINSS,
    sVlrCalcINSS,          sIdTpPagtoBenefic,
    sCodPortForma,         sDtEncerramento,
    sFlgFrequencia : string;

    sNomeArquivo : string;

    // Dados globais
    sNomeOperacao, // REQ - REQUERIMENTO , CON - CONCESSAO
    sDataEvento,           sFlgTpDemissao,           sTipoSitFunc,
    sMatricula,            sNomeTitular,             sNomePatro,
    sNomePlano,            sDataDemissao,            sNomeSitPart,
    sNomeSitFunc,          sNomeSitPlano                          : string;

    rValorTotalNaDib, rValorAtualNaDib, rValorCalculadoNaDib    : Double; //SOL 253577-18114  PPM 1292515

    rDadosParcelamento : TRegParcelamento; // edilaine - 22/01/2014 - SOL 174933

    CtrlBenefBfciario : TCtrlBenefBfciario;

    procedure AcertaLancamentoDevolucao;   // edilaine - 22/01/2014 - SOL 174933
    procedure MostraDemonstrativoConcessao;

    procedure LimpaTela;
    procedure SelecionaProcesso(piNumeroProcesso : longInt);
    procedure GeraNumeroProcesso(piNumeroProcesso : longInt); //SOL 253577-18114 PPM 1292515 17/02/2016
    procedure PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
    procedure PreencheDadosBeneficiario;
    function  MontaSQLBenefAssoc (piNumeroProcesso,piNumOrdem : longint) : string;
    Function  CalculaBeneficioMinimoLocal( sAnoMesAtual, sDataFolha, sData,
                                           sAnoMesPagamento : String;
                                           rValorBeneficioNoMes, rValorTotal : Double;
                                           iNumBenef,
                                           iIdBeneficiario : Integer;
                                           Var rValorDepoisMinimo : Double ) : Boolean;

    Function TotalBeneficiariosValidos(iIdBeneficio: Integer; iNumeroProcesso  : Integer ): Integer;

    function  AssociaTaxas(sFontePagadora: string): boolean ; // edilaine - SOL 253577-18094 / PPM 1269549

    // edilaine - SOL 253577-17664 / PPM 1019932 - inicio
    procedure GeraDemonstrativo;
    function  AbreConsultaDemonstrativo : boolean;
    function  VerificaTemParcelamento : boolean;
    procedure RefazCabecalho;
    procedure RetornaTotal(sTipoTot : string;
                           iIdPessoa, iBeneficio, iIdPessJur : integer;
                           var rValor : double;
                           bConsiderarSoDevolucao : boolean = false     //SOL 253577-18114 PPM 1292515
                           );

    // edilaine - SOL 253577-17664 / PPM 1019932 - fim

    Function  EfetuaParcelamento : boolean;
    function SalvarArquivoRevisaoBeneficio(sMatriculaTitular, sMatricula: String): String;

  public
    _sFlgPagaInss :STRING;///douglas.siqueira SOL 171026 KITANTA 1528962
    { Public declarations }
//SOL 174933 KINTANA 1733374
    PercRed:double;
    primeira:Boolean;
//  iIdLoteConcessao : longint;
//SOL 174933 KINTANA 1733374
  end;

var
  frmDesdobramentoBenef: TfrmDesdobramentoBenef;

implementation

uses UParticipante, UMensErro, FBenefRevisao, fAguarde, UBeneficio,
  FPedeInfRevisao, UAdmPrev,DBaseDados, DAPrev, FPedeBenefExigencia, USistema,
  FCadContaRequerimento, UDataBase, FSelecionaBeneficiarios, FSelecionaLote,
  UControleDividaBenef,  //edilaine SIG126276
  FMostraAux, UFuncoesUteis, FParcelamentoRevisao, uMovReserva,FInfParcRevBenef, FParcAtivo, UContribuicaoPrev ;//SOL 174933 KINTANA 1733374

{$R *.DFM}
// ********************************************************************
// ********* ROTINAS AUXILIARES
// ********************************************************************

procedure TfrmDesdobramentoBenef.LimpaTela;
begin
   iNumeroProcesso := -1;
   SelecionaProcesso(-1);
   PreencheDadosTitular(-1, -1, -1, -1);
   sNomeOperacao := '';
end; // LimpaTela

procedure TfrmDesdobramentoBenef.SelecionaProcesso(piNumeroProcesso : longInt);
begin
  qryProcesso.Close;
  qryProcesso.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
  qryProcesso.Open;

  qryBeneficio.Close;
  qryBeneficio.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;

  qryBeneficio.ParamByName('IDBENEFICIO').AsInteger := iIdBeneficio;
  qryBeneficio.Open;


  qryBeneficiarios.Close;
  qryBeneficiarios.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso ;
  if not qryBeneficio.IsEmpty
  then qryBeneficiarios.ParamByName('IdBeneficio').AsInteger := qryBeneficio.FieldByName('IdBeneficio').AsInteger
  else qryBeneficiarios.ParamByName('IdBeneficio').AsInteger := -1;
  qryBeneficiarios.Open;

  qryBenefINSS.Close;
  qryBenefINSS.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
  qryBenefINSS.Open;

  if piNumeroProcesso <= 0
  then stxtProcesso.Caption := 'Processo Nº '
  else stxtProcesso.Caption := 'Processo Nº '+IntToStr(piNumeroProcesso);

  memTitular.Visible := True;
  memBeneficiario.Visible := False;
  iIdLoteConcessao := -1;
  sAnoMesPagamento := '';
end; // SelecionaProcesso

procedure TfrmDesdobramentoBenef.PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
var
    sMesRef,
    sIdTpPagtoAnt,
    sFlgBenefMinimo,
    sValorSalario,
    sValorReserva : string;
begin
  qryTitular.Close;
  qryTitular.ParamByName('IdPessoa').Value    := piIdTitular;
  qryTitular.ParamByName('IdPessJur').Value   := piIdPessJur;
  qryTitular.ParamByName('IdPlanoPrev').Value := iIdPlanoPrevTit;
  qryTitular.ParamByName('SeqProposta').Value := piSeqProposta;
  qryTitular.Open;

  memTitular.Lines.Clear;
  if qryTitular.IsEmpty
  then Exit;


  // Dados da Patrocinadora e do Plano
  sNomePatro    := qryTitular.FieldByName('NomePatro').AsString;
  sNomePlano    := qryTitular.FieldByName('NomePlano').AsString;
  sNomeTitular  := qryTitular.FieldByName('Nome').AsString;
  sMatricula    := qryTitular.FieldByName('Matricula').AsString;
  sValorReserva := CalcReservaPart( piIdPessJur, piIdPlanoPrev, piIdTitular, -1,
                                    piSeqProposta , DateToStr(date), DateToStr(date),
                                    '','',
                                    '-1' , qryAux);

  sMesRef := Copy(DateToStr(date),7,4)+'/'+Copy(DateToSTr(date),4,2);
  sValorSalario := CalcSALPART(piIdPessJur, piIdTitular,sMesRef,qryAux);

  // Situacoes
  iIdSitFunc      := qryTitular.FieldbyName('IdSitFunc').AsInteger;
  iIdSitPart      := qryTitular.FieldbyName('IdSitPart').AsInteger;
  iIdSitPlanoPrev := qryTitular.FieldbyName('IdSitPlanoPrev').AsInteger;
  sTipoSitFunc    := qryTitular.FieldbyName('TipoSit').AsString;

  // Dados Pessoais
  memTitular.Lines.Add('Participante : '+qryTitular.FieldByName('Nome').AsString);
  memTitular.Lines.Add('------------------------------------------------------------');
  memTitular.Lines.Add('Data de Nascimento : '+qryTitular.FieldByName('DataNasc').AsString);
  memTitular.Lines.Add('Data do Falecimento : '+qryTitular.FieldByName('DataMorte').AsString);

  // Dados na Patrocinadora
  memTitular.Lines.Add('  ');
  memTitular.Lines.Add('Patrocinadora  : '  +qryTitular.FieldByName('NomePatro').AsString);
  memTitular.Lines.Add('Matrícula : '       +qryTitular.FieldByName('Matricula').AsString);
  memTitular.Lines.Add('Data de Admissão : '+qryTitular.FieldByName('DataAdmissao').AsString);
  memTitular.Lines.Add('Data de Demissão : '+qryTitular.FieldByName('DataDemissao').AsString);
  memTitular.Lines.Add('Tempo de Serviço Anterior à Admissão : '+FormatFloat('#0.00',qryTitular.FieldByName('TempoServAnterior').AsFloat));
  memTitular.Lines.Add('Tempo de Serviço Não Creditado : '      +FormatFloat('#0.00',qryTitular.FieldByName('TempoNaoCreditado').AsFloat));
  memTitular.Lines.Add('Tempo em Situação Especial (risco) : '  +FormatFloat('#0.00',qryTitular.FieldByName('TempoSitEspecial').AsFloat));
  memTitular.Lines.Add('Nível Salarial : '                      +qryTitular.FieldByName('Nivel').AsString);

  // Dados no Plano
  memTitular.Lines.Add('  ');
  memTitular.Lines.Add('Plano Previdenciário : '+qryTitular.FieldByName('NomePlano').AsString);
  memTitular.Lines.Add('Número de Inscrição  : '+qryTitular.FieldByName('InscricaoNumero').AsString);
  memTitular.Lines.Add('Data de Inscrição    : '+qryTitular.FieldByName('InscricaoData').AsString);

  // Valor de Salário , Reserva e Beneficio

  memTitular.Lines.Add('  ');
  memTitular.Lines.Add('Salário (R$) : '+sValorSalario);
  memTitular.Lines.Add('Reserva Total (R$) : '+sValorReserva);
  if sFlgBenefMinimo = '1'
  then memTitular.Lines.Add('Benefício Mínimo ? Sim. ')
  else memTitular.Lines.Add('Benefício Mínimo ? Não. ');


  // Situacoes
  memTitular.Lines.Add('Situação na Patrocinadora  : '+qryTitular.FieldByName('NomeSitFunc').AsString);
  memTitular.Lines.Add('Situaçao na Fundação       : '+qryTitular.FieldByName('NomeSitPart').AsString);
  memTitular.Lines.Add('Situação no Plano          : '+qryTitular.FieldByName('NomeSitPlano').AsString);

  sNomeSitPart  := qryTitular.FieldByName('NomeSitPart').AsString;
  sNomeSitFunc  := qryTitular.FieldByName('NomeSitFunc').AsString;
  sNomeSitPlano := qryTitular.FieldByName('NomeSitPlano').AsString;
end; //PreencheDadosTitular

procedure TfrmDesdobramentoBenef.PreencheDadosBeneficiario;
begin

  memBeneficiario.Lines.Clear;
  if qryBeneficiarios.IsEmpty then Exit;

  memBeneficiario.Lines.Add('Beneficiário : '+qryBeneficiarios.FieldByName('Nome').AsString);
  memBeneficiario.Lines.Add('------------------------------------------------------------');
  memBeneficiario.Lines.Add('Data de Nascimento : '+qryBeneficiarios.FieldByName('DataNasc').AsString);
  memBeneficiario.Lines.Add('Sexo : '+qryBeneficiarios.FieldByName('Sexo').AsString);

  memBeneficiario.Lines.Add('------------------------------------------------------------');
  if qryBeneficiarios.FieldByName('NOMERESPONSAVEL').AsString = ''
  then memBeneficiario.Lines.Add('Possui Responsável ? Não ')
  else begin
     memBeneficiario.Lines.Add('Possui Responsável ? Sim ');
     memBeneficiario.Lines.Add('Nome do Responsável : '+qryBeneficiarios.FieldByName('NOMERESPONSAVEL').AsString);
  end;
  memBeneficiario.Lines.Add('------------------------------------------------------------');

  // Verificar conta bancaria do recebedor
  if qryBeneficiarios.FieldByName('NOMERESPONSAVEL').AsString = ''
  then begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryBeneficiarios.FieldByName('IdPessoa').AsInteger;
     qryContaBancaria.Open;
  end
  else begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryBeneficiarios.FieldByName('IdResponsavel').AsInteger;
     qryContaBancaria.Open;
  end;

  memBeneficiario.Lines.Add('Conta Bancária Preferencial do Recebedor : ');
  memBeneficiario.Lines.Add('------------------------------------------------------------');
  if not qryContaBancaria.IsEmpty
  then begin
     memBeneficiario.Lines.Add('Banco    : '+qryContaBancaria.FieldByName('Banco').AsString);
     memBeneficiario.Lines.Add('Agência  : '+qryContaBancaria.FieldByName('Agencia').AsString);
     memBeneficiario.Lines.Add('Conta Nº : '+qryContaBancaria.FieldByName('ContaCorrente').AsString);
  end
  else begin
     memBeneficiario.Lines.Add(' < não cadastrada até o momento > ');
  end;

  memBeneficiario.Lines.Add('------------------------------------------------------------');
  memBeneficiario.Lines.Add('Dependência : '+qryBeneficiarios.FieldByName('Descricao').AsString);
  memBeneficiario.Lines.Add('Num. Seqüência : '+qryBeneficiarios.FieldByName('NumSequencia').AsString);
  memBeneficiario.Lines.Add('Prioridade : '+qryBeneficiarios.FieldByName('Prioridade').AsString);
  memBeneficiario.Lines.Add('Percentual : '+qryBeneficiarios.FieldByName('Percentual').AsString);
  if qryBeneficiarios.FieldByName('flgContaImpostoR').AsString = '1'
  then memBeneficiario.Lines.Add('Conta para IR ? Sim ')
  else memBeneficiario.Lines.Add('Conta para IR ? Não ');

  if qryBeneficiarios.FieldByName('FLGCONTASALARIOF').AsString = '1'
  then memBeneficiario.Lines.Add('Conta para Salário Família ? Sim ')
  else memBeneficiario.Lines.Add('Conta para Salário Família ? Não ');
  memBeneficiario.Lines.Add(' ');
end; //PreencheDadosBeneficiario

function  TfrmDesdobramentoBenef.MontaSQLBenefAssoc (piNumeroProcesso,piNumOrdem : longint) : string;
var sValor,
    sSQL : string;
    iNumBenefAssoc : integer;
begin
   Result := '';

   qryBenefAux.Close;
   qryBenefAux.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
   qryBenefAux.Open;

   iNumBenefAssoc := 0;
   qryBenefAux.First;
   while not qryBenefAux.Eof do
   begin
      if qryBenefAux.FieldByName('NumOrdemEvento').AsInteger >= piNumOrdem
      then begin
         qryBenefAux.Next;
         continue;
      end;
      inc(iNumBenefAssoc);

      if qryBenefAux.FieldByName('FlgCalcTodoMes').AsInteger = 1
      then begin
         if Trim(qryBenefAux.FieldByName('VALORCOTAS').AsString) <> ''
         then sValor := qryBenefAux.FieldByName('VALORCOTAS').AsString
         else sValor := '0';
      end
      else begin
         if Trim(qryBenefAux.FieldByName('VALORATUAL').AsString) <> ''
         then sValor := qryBenefAux.FieldByName('VALORATUAL').AsString
         else sValor := '0';
      end;

      sSQL := sSQL +','+OraNumero(sValor)+' AS VALORASSOCIADO'+IntToStr(iNumBenefAssoc);

      if Trim(qryBenefAux.FieldByName('VALORBASE1').AsString) <> ''
      then sValor := qryBenefAux.FieldByName('VALORBASE1').AsString
      else sValor := '0';
      sSQL := sSQL +','+OraNumero(sValor)+' AS ASSOC'+IntToStr(iNumBenefAssoc)+'OP1';

      if Trim(qryBenefAux.FieldByName('VALORBASE2').AsString) <> ''
      then sValor := qryBenefAux.FieldByName('VALORBASE2').AsString
      else sValor := '0';
      sSQL := sSQL +','+OraNumero(sValor)+' AS ASSOC'+IntToStr(iNumBenefAssoc)+'OP2';

      if Trim(qryBenefAux.FieldByName('VALORBASE3').AsString) <> ''
      then sValor := qryBenefAux.FieldByName('VALORBASE3').AsString
      else sValor := '0';
      sSQL := sSQL +','+OraNumero(sValor)+' AS ASSOC'+IntToStr(iNumBenefAssoc)+'OP3';
      qryBenefAux.Next;
   end; //while
   Result := sSQL;
end; //MontaSQLBenefAssoc

// ********************************************************************
// ********* ROTINAS DO FORM
// ********************************************************************
procedure TfrmDesdobramentoBenef.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     iNumeroProcesso := StrToInt(MontaSelect.ValoresChave[0]);
     sListaProcesso := InttoStr(iNumeroProcesso);
     iIdTitular      := StrToInt(MontaSelect.ValoresChave[1]);
     iSeqProposta    := StrToInt(MontaSelect.ValoresChave[2]);
     iIdPessJur      := StrToInt(MontaSelect.ValoresChave[3]);
     iIdPlanoPrev    := StrToInt(MontaSelect.ValoresChave[4]);
     iIdBeneficio    := StrToInt(MontaSelect.ValoresChave[5]);
     iIdEvento       := StrToInt(MontaSelect.ValoresChave[6]);
     iIdPlanoOrigem  := StrToInt(MontaSelect.ValoresChave[7]);
     iIdPlanoPrevTit := StrToInt(MontaSelect.ValoresChave[8]);



     SelecionaProcesso(iNumeroProcesso);
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);

     bbtnConfirmar.Enabled := False;
     bbtnCancelar.Enabled  := False;
     sbtnInserir.Enabled := True;
     
     qryBeneficio.First;
     dblkpcmbBeneficio.Text := qryBeneficio.FieldByName('Nome').AsString;
  end;
end;

procedure TfrmDesdobramentoBenef.FormShow(Sender: TObject);
begin
  inherited;
  LimpaTela;


  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
  bbtnProcurar.SetFocus;
  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');

end;

procedure TfrmDesdobramentoBenef.sbtnTitularClick(Sender: TObject);
begin
  inherited;
  PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
  memTitular.Visible         := True;
  memBeneficiario.Visible    := False;
end;

procedure TfrmDesdobramentoBenef.sbtnDetBeneficiarioClick(Sender: TObject);
begin
  inherited;
  PreencheDadosBeneficiario;
  memTitular.Visible         := False;
  memBeneficiario.Visible    := True;

end;

procedure TfrmDesdobramentoBenef.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  CtrlBenefBfciario := TCtrlBenefBfciario.Create;

  rDadosParcelamento.bFlgFezParcelamento := false;  // edilaine - 22/01/2014 - SOL 174933

  CtrlBenefBfciario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer,
                               True, Nil );
end;



procedure TfrmDesdobramentoBenef.sbtnInserirClick(Sender: TObject);
Var

  iIdRegraAbono, iNumeroProcessoINSS,  iNumBenef,
  iIdBeneficio,  iNumBenefAntes   : LongInt;

  bProRata,  bConcedeBeneficio, bReajustou,     bInfOK, bEhAntecipacao,
  bErro,     bPossuiAbono,      bPagaAbono    : Boolean;

  sFlgFitEspecial, sFlgMigrado,      sSql,               sResult,
  sPLACONTAD,      sPLACONTAC,       sIDPLANPREVCONTAB,
  sUltMesReajuste, sIdTpPagtoAnt,    sFlgBenefMinimo,    sMatriculaNova,
  sSQLBenefAssoc,  sDataCompetencia, sAnoMesInicio,      sAnoMesInicioAntigos,
  sAnoMesFinal,    sMesAbono,        sAnoMesAtual,       sAnoMesDataFinal,
  sData,           sDataFolha,       sDataPagamento,     sValorFinal,
  sValorFinalBS,   sValorFinalFAB,   sValorFinalDeficit, sPercentual, // fernando xavier - SOL 253577-17664 / PPM 1019932
  sValorTotal,     sDataFinal,       sDiaMesAnoAnterior, sMsgErro,
  sSQLValues  : String;

  iFlgEnviado : integer; // fernando xavier - SOL 253577-17664 / PPM 1019932

  rDiferenca,     rValorAtualizado,   dValorTotalDivida,
  rValorReal,     rValorCotas,        rValorTotal,          rValorTotalAnt,
  rValorIntegral, rValorDevolucao,    rValorBeneficioNoMes, rValorIntegralAntigo,
  rValorBase1,    rValorBase2,        rValorBase3,          dValorSRBRetorno,
  rValorAbono,    rValorDepoisMinimo, rValorParcialUltimo,  rValorParcialPrimeiro,
  rValorRealBS,   rValorRealFAB,      rValorRealDeficit,    rVlrCalculado, rVlrCheio,  // fernando xavier - SOL 253577-17664 / PPM 1019932
  rValorDepoisMinimoBS, rValorDepoisMinimoFAB, rValorDepoisMinimoDeficit,              // fernando xavier - SOL 253577-17664 / PPM 1019932
  rValorFinalBfciario, rValorIntegralBfciario, rValorAbonoCheio,
  dVlrBenefReajustado, dNovoValorRateado, rValorBeneficioNoDib : Double;
//SOL 174933 KINTANA 1733374
  RValorAntigo: Double;
  RNovoValor: Double;
//SOL 174933 KINTANA 1733374

  sTipo: Char; // Andre Imakawa - SIG 51392

  varfields              : variant;

  cTipoAbono             : char;


  SaldoUnificacao:Double;///Douglas.Siqueira 174933
  VLDivida:Double;///Douglas.Siqueira 174933

  sMesAnterior, sDtDIBAnterior, sIdPessoaAnterior //BRUNO AZEVEDO SOL 136412/4121
  , sFontePagadora: String; // SOL 159974 KINTANA 1327873
//SOL 174933 KINTANA 1733374
   IDHSTORICODIVIDABENEFICIO,IDCONTROLEDIVIDABENEFICIO: String;
   atualizar,cancelou,pular:Boolean;
//SOL 174933 KINTANA 1733374
   iQuantBeneficiario : integer;
   bReajusta :Boolean;

  //Início - William Santana - SIG 24451
   function selecionaDataPagamento (Lote : String ) : String;
  var
    QryDtPg : TwwQuery;
  begin
    QryDtPg := TwwQuery.Create(nil);
    QryDtPg.DataBaseName := 'Basedados';

    try
      QryDtPg.Close;
      QryDtPg.Sql.Clear;
      QryDtPg.Sql.Add('SELECT datapagamento FROM CTRLINTERFACE');
      QryDtPg.Sql.Add('WHERE ');
      QryDtPg.Sql.Add('IDLOTE = ' + Lote);
      QryDtPg.Open;

      Result := QryDtPg.FieldByName('datapagamento').AsString;
    finally
      QryDtPg.Close;
      FreeAndNil(QryDtPg);
    end;
  end;
  //Término - William Santana - SIG 24451


begin

  rDiferenca             := 0;
  rValorAtualizado       := 0;
  dValorTotalDivida      := 0;
  rValorReal             := 0;
  rValorCotas            := 0;
  rValorTotal            := 0;
  rValorTotalAnt         := 0;
  rValorIntegral         := 0;
  rValorDevolucao        := 0;
  rValorBeneficioNoMes   := 0;
  rValorIntegralAntigo   := 0;
  rValorBase1            := 0;
  rValorBase2            := 0;
  rValorBase3            := 0;
  dValorSRBRetorno       := 0;
  rValorAbono            := 0;
  rValorDepoisMinimo     := 0;
  rValorParcialUltimo    := 0;
  rValorParcialPrimeiro  := 0;
  rValorRealBS           := 0;
  rValorRealFAB          := 0;
  rValorRealDeficit      := 0;
  rVlrCalculado          := 0;
  rVlrCheio              := 0;
  rValorDepoisMinimoBS   := 0;
  rValorDepoisMinimoFAB  := 0;
  rValorDepoisMinimoDeficit := 0;
  rValorFinalBfciario       := 0;
  rValorIntegralBfciario    := 0;
  rValorAbonoCheio          := 0;
  dVlrBenefReajustado       := 0;
  dNovoValorRateado         := 0;
  rValorBeneficioNoDib      := 0;
  RValorAntigo              := 0;
  RNovoValor                := 0;
  sValorFinal               := '';
  sValorFinalBS             := '';
  sValorFinalFAB            := '';
  sValorFinalDeficit        := '';
  sPercentual               := '';
  sValorTotal               := '';

  //CmDebugToFile(' Inicio do processo ','C:\debug desdobramento.txt');
  bReajusta := false;
  sListaProcesso := InttoStr(iNumeroProcesso);
  qryBeneficiarios.first;
  iQuantBeneficiario := 0;
  while not(qryBeneficiarios.eof) do
  Begin
     If qryBeneficiarios.FieldByName('FLGPROCESSA').AsInteger = 0 Then
     Begin
        qryBeneficiarios.Next;
        Continue;
     End;
     inc(iQuantBeneficiario);
     qryBeneficiarios.next;
  End;
  if (iQuantBeneficiario <= 0) then
  begin
     MsgDlg('Selecione pelo menos um beneficiário.' ,'Informação',mtError,[mbOk,mbHelp],0);
     exit;
  end;

  qryBeneficiarios.first;

  inherited;
  iSeqBeneficio   := 0;
  iSeqBeneficio13 := 0;
  // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
  {guarda data e hora que iniciou a revisão para buscar contribuições geradas}
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('select to_char(sysdate,''dd/mm/yyyy hh24:mi'') AS datenow from dual ');
  qryAux.Open;
  sdataInicioDesdobra := qryAux.fieldByName('datenow').asstring;
  // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim


  _sFlgPagaInss:=''; ///douglas.siqueira SOL 171026 KITANTA 1528962

    // GRAVAR AS OPERACOES PARA SAIR NO DEMONSTRATIVO
  If not dtmBaseDados.dbBaseDados.InTransaction Then  // SOL:109597 Daniel Begnami
    dtmBaseDados.dbBaseDados.StartTransaction;

  iIdCalculo := -1;

  sNomeOperacao := 'REQ';
  if (qryBeneficiarioEmUso.Active) and (not qryBeneficiarioEmUso.IsEmpty)
  then begin
     MsgDlg('Existe um beneficiário em aberto. Confirme ou Cancele sua inclusão. ','Informação',mtInformation,[mbOk,mbHelp],0);
     Exit;
  end;

  if Trim(dblkpcmbBeneficio.Text) = ''
  then begin
     MsgDlg('Selecione um dos benefícios do processo. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;
  { Buscar opcoes do beneficio para passar para a regra de reajuste }
  With qryAux do begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 ');

     SQL.Add(' FROM BENEFBFCIARIO ');
     SQL.Add(' WHERE  IDPESSJUR    = '+IntToStr(iIdPessJur)+
             ' AND    IDPLANOPREV  = '+IntToStr(iIdPlanoPrev)+
             ' AND    IDTITULAR    = '+IntToStr(iIdTitular)+
             ' AND    SEQPROPOSTA  = 1 '+
             ' AND    IDBENEFICIO  = '+IntToStr(qryBeneficio.FieldByName('IdBeneficio').AsInteger) );
     Open;
     if not IsEmpty then begin
        rValorBase1 := FieldByName('VALORBASE1').AsFloat;
        rValorBase2 := FieldByName('VALORBASE2').AsFloat;
        rValorBase3 := FieldByName('VALORBASE3').AsFloat;
     end else begin
        rValorBase1 := 0;
        rValorBase2 := 0;
        rValorBase3 := 0;
        sUltMesReajuste := '';
     end;
  End;

  // Abrir lista de beneficiarios cadastrados que não estão no processo
  frmSelecionaBeneficiarios := TfrmSelecionaBeneficiarios.Create(Application);
  if not frmSelecionaBeneficiarios.SelecionaBeneficiarios(
                                 iIdPessJur,    iIdPlanoPrev, iIdTitular,
                                 {-}
                                 iSeqProposta,
                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                 qryBeneficio.FieldByName('IdRegraBeneficia').AsInteger,
                                 qryTitular.FieldByName('DataDemissao').AsString,
                                 dbedDtEvento.Text,
                                 dbedDtEvento.Text,
                                 FloatToStr(rValorBase1),
                                 FloatToStr(rValorBase2),
                                 FloatToStr(rValorBase3),
                                 3,
                                 qryBeneficiarioEmUso, iNumeroProcesso )
  then begin
     MsgDlg('Beneficiários não selecionados. Verifique.','Erro',mtError,[mbOK],0);
     frmSelecionaBeneficiarios.Free;
     Exit;
  end;
  frmSelecionaBeneficiarios.Free;

  bbtnConfirmar.Enabled  := True;
  bbtnCancelar.Enabled   := True;

  // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add('SELECT B.FLGAPRESENTABSFAB, B.FLGAPRESENTADEFICIT' + #13#10 +
                 '  FROM BENEFPLANPREV B' + #13#10 +
                 ' WHERE B.IDBENEFICIO = '+ qryBeneficio.FieldByName('IdBeneficio').AsString + #13#10 +
                 '   AND B.IDPLANOPREV = '+ IntToStr(iIdPlanoPrev) );
  qryAux.open;
  if not qryAux.eof then
  begin
    bApresentaBSFAB    := (qryAux.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1);
    bApresentaDeficit  := (qryAux.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1);
  end
  else
  begin
    bApresentaBSFAB    := false;
    bApresentaDeficit  := false;
  end;
  qryAux.close;
  // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

  // **********************************************************************
  //  Pedir informacoes do beneficio
  // **********************************************************************
  sNumProcINSS      := '';
  sDtRequerimento   := DateToStr(date);
  sDtInicioINSS     := qryBeneficiarios.FieldByName('DataInicioInss').AsString;
  sDtInicioFund     := qryBeneficiarios.FieldByName('DataInicioFund').AsString;
  sVlrInfINSS       := qryBeneficiarios.FieldByName('VlrInfInss').AsString;
  sVlrCalcINSS      := qryBeneficiarios.FieldByName('VlrCalcInss').AsString;
  sDataInicio       := qryBeneficiarios.FieldByName('DataInicio').AsString;
  sDataFinal        := '';
  sIdTpPagtoBenefic := qryBeneficiarios.FieldByName('IDTPPAGTOBENEFIC').AsString;
  sFlgFrequencia    := qryBeneficiarios.FieldByName('FLGFREQUENCIA').AsString;
  sCodPortForma     := '';

  sDataInicioOriginal  := qryBeneficiarios.FieldByName('DATAINICIO').AsString;

  With qryAux do begin     // SOL 159974 KINTANA 1327873
     Close;
     SQL.Clear;
     SQL.Add(' SELECT FONTEPAGADORA FROM BENEFBFCIARIO ');
     SQL.Add(' WHERE IDBENEFICIO = '+qryBeneficio.FieldByName('IDBENEFICIO').AsString);
     SQL.Add(' AND NUMEROPROCESSO = '+inttostr(iNumeroProcesso));
     Open;

     sFontePagadora := FieldByName('FONTEPAGADORA').AsString;
  end;   // SOL 159974 KINTANA 1327873

  If qryBeneficio.FieldByName('IDREGRAFIM').AsInteger > 0
   Then Begin
     frmAguarde.Mostra('Regra de Data Final - Nº '+qryBeneficio.FieldByName('IDREGRAFIM').AsString);
     sDataFinal := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IDREGRAFIM').AsInteger,
                                    iIdPessJur,
                                    iIdPlanoPrevTit,
                                    iIdTitular, iSeqProposta,
                                    qryBeneficiarioEmUso.FieldByName('IDPESSOA').AsInteger,
                                    qryBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                                    rValorBase1,rValorBase2,rValorBase3,
                                    dbedDtEvento.Text,
                                    qryBeneficiarios.FieldByName('DATAINICIOFUND').AsString,
                                    qryBeneficiarios.FieldByName('DATAINICIO').AsString,
                                    qryBeneficiarios.FieldByName('DATAFINAL').AsString,
                                    DateToStr(date),
                                    qryBeneficiarios.FieldByName('DATAREQUERIMENTO').AsString,
                                    sFlgTpDemissao,
                                    bErro,
                                    sMsgErro);
     frmAguarde.Apaga;

     If bErro
      Then MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
  End;

  frmPedeInfRevisao := TfrmPedeInfRevisao.Create(Application);
  bInfOK := frmPedeInfRevisao.PedeInfRevisao( 'I',
                           'Desdobramento de Benefício ...',
                           iIdPlanoPrev,
                           qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                           dbedDtEvento.Text,
                           sNumProcINSS,
                           sDtRequerimento,
                           sDtInicioINSS,
                           sDtInicioFund,
                           sDtDIBAnterior,
                           sDataInicio,
                           sDataFinal,
                           sVlrCalcINSS,
                           sVlrInfINSS,
                           sIdTpPagtoBenefic,
                           sCodPortForma,
                           sFontePagadora); ///douglas.siqueira
  frmPedeInfRevisao.Free;

  if not bInfOK
  then begin
     qryBeneficiarioEmUso.Close;
     Exit;
  end;


  if Trim(sVlrCalcINSS) = '' then sVlrCalcINSS := '0';
  if Trim(sVlrInfINSS)  = '' then sVlrInfINSS  := '0';


  if prmIdMotivoDevolBen <= 0
  then begin
     MsgDlg('O Motivo para a Devolução de Benefício não está cadastrado. Verifique. ','Informação',mtInformation,[mbOk,mbHelp],0);
     Exit;
  end;

  if iIdLoteConcessao <= 0
  then begin
     iIdLoteConcessao := SelecionaLoteBeneficioAberto( sAnoMesPagamento,
                                                       iFlgIncluiMesConc );
     if iIdLoteConcessao <= 0
     then begin
        bErro := True;
        MsgDlg('Nenhum lote selecinado para efetuar o Desdobramento. Verifique. ','Erro',mtError,[mbOk, mbHelp],0);
        Exit;
     end;
  end;

  // ********************************************************************** //
  //  Preencher variaveis e abrir querys auxiliares                         //
  // ********************************************************************** //
  frmAguarde.Mostra('Recalculando benefício ... ');

  // o par. sDataInicio contém o que foi informado como nova data início do benefício
  sAnoMesInicio  := Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2);

  sDataFolha := CriticaDataCobrancaSit(qryAux,IntToStr(iIdFundacao),'', 'AS',
                                       'P', Copy(DateToStr(date),4,2),
                                            Copy(DateToStr(date),7,4));
  if Trim(sDataFolha) = '' then sDataFolha := DateToStr(date);

  If sAnoMesPagamento = '' Then
    sAnoMesPagamento := Copy(sDataFolha,7,4)+'/'+Copy(sDataFolha,4,2);

  sAnoMesDataFinal := Copy(sDataFinal,7,4)+'/'+Copy(sDataFinal,4,2);
  iIdBeneficio     := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
  // Abrir query com benefícios do processo vazia para incluir os beneficios novos
  qryBenefBfciario.Close;
  qryBenefBfciario.ParamByName('NumeroProcesso').AsInteger := -1;
  qryBenefBfciario.Open;

  // Preencher data final
  // Se nao houver data final, gerar até hoje
  // Se houver e for anterior a hoje, gerar até a data final
  // Senao, gerar até hoje
  if  Trim(sDataFinal) = ''
  then
    // Se não informar a data final então considerar mesreferencia do lote

    If iFlgIncluiMesConc = 0
     Then sAnoMesFinal := SAnoMesAnterior(sAnoMesPagamento)
     Else sAnoMesFinal := sAnoMesPagamento

  else If sAnoMesPagamento = '' Then Begin
    if StrToDate(sDataFinal) <= date
       then sAnoMesFinal := Copy(sDataFinal,7,4)+'/'+Copy(sDataFinal,4,2)
       else sAnoMesFinal := Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2);
  End Else Begin
    If sAnoMesPagamento < Copy(sDataFinal,7,4)+'/'+Copy(sDataFinal,4,2) Then
      sAnoMesFinal := sAnoMesPagamento
    Else
      sAnoMesFinal := Copy(sDataFinal,7,4)+'/'+Copy(sDataFinal,4,2);
  End;


  // Abrir query com os benefícios do histórico já preparados ou pagos
  qryHstBenefPagos.Close;
  qryHstBenefPagos.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
  qryHstBenefPagos.ParamByName('IdBeneficio').AsInteger    := iIdBeneficio;
  qryHstBenefPagos.ParamByName('MesReferencia').AsString   := sAnoMesInicio;
  qryHstBenefPagos.ParamByName('ANOMESFINAL').AsString     := sAnoMesFinal;
  qryHstBenefPagos.ParamByName('ANOMESFINAL13').AsString   := Copy(sAnoMesFinal,1,4)+'/13';
 // qryHstBenefPagos.ParamByName('DATADIB').AsString         := Copy(sDtInicioFund,1,5);     //SOL 253577-18114 PPM 1292515
  qryHstBenefPagos.Open;

  // Abrir query com cached updates para inserir novo benefício
  qryHstNovoBenef.Close;
  qryHstNovoBenef.ParamByName('NumeroProcesso').AsInteger := iNumeroProcessoNovo;
  qryHstNovoBenef.ParamByName('IdBeneficio').AsInteger    := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
  qryHstNovoBenef.ParamByName('IdPessoa').AsInteger       := -1;
  qryHstNovoBenef.ParamByName('MesReferencia').AsString   := sAnoMesInicio;
  qryHstNovoBenef.Open;

  // Preencher número total de beneficiarios
  iNumBenefAntes := qryBeneficiarios.RecordCount;
  iNumBenef      := QryBeneficiarioEmUso.RecordCount +
                    TotalBeneficiariosValidos(QryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                              iNumeroProcesso);

  // Criar variant para locate
  varFields := VarArrayCreate([0,1],varVariant);

  // ********************************************************************** //
  //                        Desdobrar Beneficios do INSS                    //

  // ********************************************************************** //
  frmAguarde.Mostra('Verificando Benefício de Referência ...');
  if not qryBenefINSS.IsEmpty
  then begin

     qryHstNovoINSS.Close;
     qryHstNovoINSS.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
     qryHstNovoINSS.ParamByName('IdBeneficio').AsInteger    := qryBenefINSS.FieldByName('IDBENEFICIO').AsInteger;
     qryHstNovoINSS.ParamByName('IdPessoa').AsInteger       := -1;
     qryHstNovoINSS.ParamByName('MesReferencia').AsString   := sAnoMesInicio;
     qryHstNovoINSS.Open;

     // Inserir beneficio do INSS para novo beneficiario
     //CmDebugToFile(' Inserir beneficio do INSS para novo beneficiario ','C:\debug desdobramento.txt');
     qryBenefBfciario.Insert;
     if Trim(sDataFinal) <> ''
     then qryBenefBfciario.FieldByName('DATAFINAL').AsDateTime   := StrToDate(sDataFinal);
     qryBenefBfciario.FieldByName('DATAINICIO').AsDateTime       := StrToDate(sDtInicioINSS);
     qryBenefBfciario.FieldByName('DATAINICIOFUND').AsDateTime   := StrToDate(sDtInicioINSS);
     if Trim(sDtInicioINSS) <> ''
     then qryBenefBfciario.FieldByName('DATAINICIOINSS').AsDateTime   := StrToDate(sDtInicioINSS);
     qryBenefBfciario.FieldByName('DATAREQUERIMENTO').AsDateTime := StrToDate(sDtRequerimento);
     qryBenefBfciario.FieldByName('FLGPAGAINSS').AsString := _sFlgPagaInss;       //////douglas.siqueira SOL 171026 KITANTA 1528962
     qryBenefBfciario.FieldByName('FLGBENEFMIN').AsInteger       := 0;
     qryBenefBfciario.FieldByName('FLGFORMAPAGTO').AsString      := 'F';
     qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger       := qryBenefINSS.FieldByName('IDBENEFICIO').AsInteger;
     qryBenefBfciario.FieldByName('IDDEPENDENCIA').AsString      := qryBeneficiarioEmUso.FieldByName('IDDEPENDENCIA').AsString;
     qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger         := iIdPessJur;
     qryBenefBfciario.FieldByName('IDPESSOA').AsInteger          := qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger;
     qryBenefBfciario.FieldByName('IDPLANOORIGEM').AsInteger     := iIdPlanoPrev; //iIdPlanoOrigem; //BRUNO AZEVEDO
     qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger       := iIdPlanoPrev;

     qryBenefBfciario.FieldByName('IDPERFILINVEST').AsString     := qryBenefINSS.FieldByName('IDPERFILINVEST').AsString;  //edilaine - SIG55933

     if sFontePagadora = '2' then   // SOL 202689 Kintana 1958612
     begin
     if _sFlgPagaInss = '0' then
        qryBenefBfciario.FieldByName('IDSITBENEFICIO').AsInteger    := 2 ///douglas.siqueira SOL 171026 KITANTA 1528962
     else
        qryBenefBfciario.FieldByName('IDSITBENEFICIO').AsInteger    := 4; // Pendente de Concessão
     end
     else
        qryBenefBfciario.FieldByName('IDSITBENEFICIO').AsInteger    := 4; // Pendente de Concessão  // SOL 202689 Kintana 1958612
     qryBenefBfciario.FieldByName('IDTITULAR').AsInteger         := iIdTitular;
     qryBenefBfciario.FieldByName('IDTPPAGTOBENEFIC').AsInteger  := StrToInt(sIdTpPagtoBenefic);
     qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger    := iNumeroProcesso; //SOL 253577-18114 PPM 1292515 17/02/2016
     //qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger    := iNumeroProcessoNovo; //SOL 253577-18114 PPM 1292515 17/02/2016
     qryBenefBfciario.FieldByName('NUMPROCINSS').AsString        := sNumProcINSS;
     qryBenefBfciario.FieldByName('SEQPROPOSTA').AsInteger       := iSeqProposta;
     qryBenefBfciario.FieldByName('ULTMESPREPARO').AsString      := sAnoMesAtual;
     //qryBenefBfciario.FieldByName('VALORATUAL').AsFloat          := StrToFloat(ClienteNumero(sVlrInfINSS));  // SOL 192563 KINTANA 1877175
     qryBenefBfciario.FieldByName('VALORATUAL').AsFloat          := StrToFloat(ClienteNumero(FormatFloat('#0.00',StrToFloat(sVlrInfINSS)))); // SOL 192563 KINTANA 1877175
     //CmDebugToFile(' VALORATUAL'+sVlrInfINSS ,'C:\debug desdobramento.txt');
     //qryBenefBfciario.FieldByName('VALORCALCULADO').AsFloat      := StrToFloat(ClienteNumero(sVlrCalcINSS)); // SOL 192563 KINTANA 1877175
     qryBenefBfciario.FieldByName('VALORCALCULADO').AsFloat      := StrToFloat(ClienteNumero(FormatFloat('#0.00',StrToFloat(sVlrCalcINSS)))); // SOL 192563 KINTANA 1877175
     //CmDebugToFile(' VALORCALCULADO'+sVlrCalcINSS ,'C:\debug desdobramento.txt');
     qryBenefBfciario.FieldByName('VALORCOTAS').AsFloat          := 0;
     //qryBenefBfciario.FieldByName('VALORTOTAL').AsFloat          := StrToFloat(ClienteNumero(sVlrInfINSS)); // SOL 192563 KINTANA 1877175
     qryBenefBfciario.FieldByName('VALORTOTAL').AsFloat          := StrToFloat(ClienteNumero(FormatFloat('#0.00',StrToFloat(sVlrInfINSS)))); // SOL 192563 KINTANA 1877175
     //CmDebugToFile(' VALORTOTAL'+sVlrInfINSS ,'C:\debug desdobramento.txt');
     //BRUNO AZEVEDO
     //qryBenefBfciario.FieldByName('VALORNADIB').AsFloat          := StrToFloat(ClienteNumero(sVlrInfINSS)); // SOL 192563 KINTANA 1877175
     qryBenefBfciario.FieldByName('VALORNADIB').AsFloat          := StrToFloat(ClienteNumero(FormatFloat('#0.00',StrToFloat(sVlrInfINSS)))); // SOL 192563 KINTANA 1877175
     //qryBenefBfciario.FieldByName('VLRCALCINSS').AsFloat         := StrToFloat(ClienteNumero(sVlrCalcINSS)); // SOL 192563 KINTANA 1877175
     qryBenefBfciario.FieldByName('VLRCALCINSS').AsFloat         := StrToFloat(ClienteNumero(FormatFloat('#0.00',StrToFloat(sVlrCalcINSS)))); // SOL 192563 KINTANA 1877175
     //qryBenefBfciario.FieldByName('VLRINFINSS').AsFloat          := StrToFloat(ClienteNumero(sVlrInfINSS)); // SOL 192563 KINTANA 1877175
     qryBenefBfciario.FieldByName('VLRINFINSS').AsFloat          := StrToFloat(ClienteNumero(FormatFloat('#0.00',StrToFloat(sVlrInfINSS)))); // SOL 192563 KINTANA 1877175
     //qryBenefBfciario.FieldByName('VALORATUALANT').AsFloat       := qryBeneficiarios.FieldByname('VALORATUAL').AsFloat;  // SOL 192563 KINTANA 1877175
     qryBenefBfciario.FieldByName('VALORATUALANT').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByname('VALORATUAL').AsFloat))); // SOL 192563 KINTANA 1877175

     // edilaine - SOL 253577-17664 / PPM 1019932 - inicio
     //qryBenefBfciario.FieldByName('DIBBENEFANT').AsDateTime   := qryBeneficiarios.FieldByname('DIBBENEFANT').AsDateTime
     qryBenefBfciario.FieldByName('DIBBENEFANT').AsString       := sDtDIBAnterior;
     // edilaine - SOL 253577-17664 / PPM 1019932 - fim

     qryBenefBfciario.FieldByName('FONTEPAGADORA').AsString      := sFontePagadora; // SOL 159974 KINTANA 1327873
     qryBenefBfciario.Post;
  end;

  // ********************************************************************** //
  //                        Recalcular Beneficios                           //
  // ********************************************************************** //
  frmAguarde.Mostra('Calculando novos valores de benefício ...');
  //CmDebugToFile(' Calculando novos valores de benefício ...' ,'C:\debug desdobramento.txt');
  // O valor total permanece o mesmo. O rateio é que modifica.
  rValorTotal      := PegaValorTotal( qryAux,
                                      qryProcesso.FieldByName('NumeroProcesso').AsInteger,
                                      qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                      qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                      sDataInicio);
  rValorTotalAnt := rValorTotal;
  //CmDebugToFile(' VALORTOTAL'+Floattostr(rValorTotal) ,'C:\debug desdobramento.txt');

  // fernando xavier - SOL 253577-17664 / PPM 1019932
  PegaValorTOTALBsFab( qryAux,
                       qryProcesso.FieldByName('NumeroProcesso').AsInteger,
                       qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                       qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                       sDataInicio,
                       sValorTotalBS, sValorTotalFAB, sValorTotalDeficit
                       , false, true               //edilaine - SIG85197
                       );

  sValorTotalBSAnt      := sValorTotalBS;
  sValorTotalFABAnt     := sValorTotalFAB;
  sValorTotalDeficitAnt := sValorTotalDeficit;
  // fernando xavier - SOL 253577-17664 / PPM 1019932

  // Verificar se o benefício tem abono
  bPossuiAbono := VerificaSePagaAbonoParticip( qryAux,
                                               iIdPlanoPrev,
                                               qryBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                                               sDtInicioFund,
                                               sDataFinal,
                                               iIdRegraAbono,
                                               cTipoAbono, // A - final do Ano e B - final do Beneficio
                                               bErro,
                                               sMsgErro);
  { Busca Mes em que sera pago o abono }
  If bPossuiAbono Then sMesAbono := PagaMesPagAbono( QryAux,
                                                     iIdPessjur, iIdPlanoPrev, iIdBeneficio,
                                                     sAnoMesPagamento,
                                                     bEhAntecipacao );

  if bErro
  then begin
    frmAguarde.Apaga;
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
    rValorBeneficioNoMes  := 0;
    Exit;
  end;

  {----------------------------------------------------------------------------}
  { Processa todos os Beneficios no Mes Referente                              }
  sAnoMesAtual := sAnoMesInicio;
  sDiaMesAnoAnterior := SAnoMesAnterior(sAnoMesAtual);
  sDiaMesAnoAnterior := '01/' + Copy(sDiaMesAnoAnterior,6,2)+'/'+Copy(sDiaMesAnoAnterior,1,4);
  If (sAnoMesAtual = Copy(sDtInicioFund,7,4) + '/' + Copy(sDtInicioFund,4,2)) Then
  begin
     rValorTotal      := PegaValorTotal( qryAux,
                                              qryProcesso.FieldByName('NumeroProcesso').AsInteger,
                                              qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                              qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                              sDtInicioFund);
     // fernando xavier - SOL 253577-17664 / PPM 1019932
     //CmDebugToFile(' Valor total no Ano mes atual igual o ano mes atual da dib'+Floattostr(rValorTotal) ,'C:\debug desdobramento.txt');
     PegaValorTOTALBsFab( qryAux,
                          qryProcesso.FieldByName('NumeroProcesso').AsInteger,
                          qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                          qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                          sDtInicioFund,
                          sValorTotalBS, sValorTotalFAB, sValorTotalDeficit,
                          true        // edilaine - SIG 20749
                          ,true       // edilaine - SIG85197
                          );
     // fernando xavier - SOL 253577-17664 / PPM 1019932
  end
  Else
  begin
     rValorTotal      := PegaValorTotal( qryAux,
                                            qryProcesso.FieldByName('NumeroProcesso').AsInteger,
                                            qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                            qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                            sDiaMesAnoAnterior);
    // fernando xavier - SOL 253577-17664 / PPM 1019932
    //CmDebugToFile(' Valor total no Ano mes atual diferente do ano mes atual da dib'+Floattostr(rValorTotal) ,'C:\debug desdobramento.txt');
     PegaValorTOTALBsFab( qryAux,
                          qryProcesso.FieldByName('NumeroProcesso').AsInteger,
                          qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                          qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                          sDiaMesAnoAnterior,
                          sValorTotalBS, sValorTotalFAB, sValorTotalDeficit
                          , false, true               //edilaine - SIG85197
                          );
     // fernando xavier - SOL 253577-17664 / PPM 1019932
  end;

  // fernando xavier - SOL 253577-17664 / PPM 1019932
  sValorTotalBSAnt      := sValorTotalBS;
  sValorTotalFABAnt     := sValorTotalFAB;
  sValorTotalDeficitAnt := sValorTotalDeficit;
  // fernando xavier - SOL 253577-17664 / PPM 1019932

  dValorTotalDivida     := 0;
  //CmDebugToFile(' while (sAnoMesAtual <= sAnoMesFinal) do begin ' ,'C:\debug desdobramento.txt');
  while (sAnoMesAtual <= sAnoMesFinal) do begin
     //CmDebugToFile(' Mes atual '+sAnoMesAtual+' menor igual mes final '+sAnoMesFinal  ,'C:\debug desdobramento.txt');
     If sFlgFrequencia = 'U' Then sAnoMesFinal := sAnoMesAtual;

     rValorTotal     := rValorTotalAnt;
     //CmDebugToFile(' rValorTotal recebe rValorTotalAnt '+Floattostr(rValorTotalAnt)  ,'C:\debug desdobramento.txt');
     rValorBeneficioNoMes := rValorTotalAnt;
     //CmDebugToFile(' rValorBeneficioNoMes recebe rValorTotalAnt '+Floattostr(rValorTotalAnt)  ,'C:\debug desdobramento.txt');
     // fernando xavier - SOL 253577-17664 / PPM 1019932
     sValorNoMesBS       := sValorTotalBSAnt ;
     sValorNoMesFAB      := sValorTotalFABAnt;
     sValorNoMesDeficit  := sValorTotalDeficitAnt;
     // fernando xavier - SOL 253577-17664 / PPM 1019932

     sSQLBenefAssoc := MontaSQLBenefAssoc(iNumeroProcesso,qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

     rValorIntegralAntigo  := 0;
     rValorParcialUltimo   := 0;
     rValorParcialPrimeiro := 0;
     rValorFinalBfciario   := 0;

     rValorCotas    := 0;
     rValorReal     := rValorBeneficioNoMes;
     bProRata       := False;

     //Início - William Santana - SIG 24451
     //sDataPagamento := CriticaDataCobrancaSit(qryAux,IntToStr(iIdFundacao),'', 'AS','P',
     //                                            Copy(sAnoMesAtual,6,2),Copy(sAnoMesAtual,1,4));

     sDataPagamento := selecionaDataPagamento(inttostr(iIdLoteConcessao));
     //Término - William Santana - SIG 24451

     if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
     then rValorCotas := ConverteBeneficioParaCotasGeral(qryAux ,
                                         iIdPlanoPrev,
                                         qryBeneficio.FieldbyName('IdBeneficio').AsInteger,
                                         sDtInicioFund,
                                         rValorReal,
                                         bErro, sMsgErro);
     if bErro
     then begin
       frmAguarde.Apaga;
       MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
       rValorBeneficioNoMes  := 0;
       Exit;
     end;

     {-------------------------------------------------------------------------}
     { Processa todos os beneficiario novos que irão receber Beneficio para    }
     { calcular e incluir o valor do novo beneficio.                           }
     qryBeneficiarioEmUso.First;

     // SOL 110091 Daniel Begnami

      //BRUNO AZEVEDO SOL 136412/4121
      sValorFinalBS      := sValorTotalBS;
      sValorFinalFAB     := sValorTotalFAB;
      sValorFinalDeficit := sValorTotalDeficit;


      if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1 then
      begin
         //CmDebugToFile(' qryBeneficio.FieldByName(''FlgCalcTodoMes'').AsInteger = 1 valor final decebe valor real: '+FloatToStr(rValorReal)  ,'C:\debug desdobramento.txt');
         sValorFinal := ClienteNumero(FloatToStr(rValorReal));
         // fernando xavier - SOL 253577-17664 / PPM 1019932
         sValorFinalBS      := sValorTotalBS;
         sValorFinalFAB     := sValorTotalFAB;
         sValorFinalDeficit := sValorTotalDeficit;
         // fernando xavier - SOL 253577-17664 / PPM 1019932
      end
      else
      begin
         //CmDebugToFile(' qryBeneficio.FieldByName(''FlgCalcTodoMes'').AsInteger <> 1 ' ,'C:\debug desdobramento.txt');

         if sFontePagadora = '2'
         Then sSQL := ' SELECT MAX(MESREAJ) MESREAJ     '+
                          ' FROM   REAJINSS                 '+
                          ' WHERE MESREAJ <= '''+sAnoMesAtual+'''  '+
                          ' AND   MESREAJ >= TO_CHAR(TO_DATE('''+sDtInicioFund+''',''DD/MM/YYYY''),''YYYY/MM'')  '+
                          ' AND IDRGREAJ IS NOT NULL  '

         Else sSQL := ' SELECT MAX(MESREAJ) MESREAJ     '+
                          ' FROM   REAJSALPATRO      '+
                          ' WHERE MESREAJ    <= '''+sAnoMesAtual+'''  '+
                          ' AND   MESREAJ    >= TO_CHAR(TO_DATE('''+sDtInicioFund+''',''DD/MM/YYYY''),''YYYY/MM'')  '+
                          ' AND   IDPESSJUR   = '+IntToStr(iIdPessJur)   +
                          ' AND   IDPLANOPREV = '+IntToStr(iIdPlanoPrev);


         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(sSQL);
         qryAux.Open;

         // Andre Imakawa - SIG 34272 - Inicio
         if (iIdPlanoPrev <> 2) and (sFontePagadora = '1') and (qryAux.FieldByName('MESREAJ').AsString = '') then
         begin
           sSQL := ' SELECT MAX(R.MESREAJ) MESREAJ     '+
                          ' FROM   REAJBENEFICIO R      '+
                          ' WHERE R.MESREAJ    <= '''+sAnoMesAtual+'''  '+
                          ' AND   R.MESREAJ    >= TO_CHAR(TO_DATE('''+sDtInicioFund+''',''DD/MM/YYYY''),''YYYY/MM'')  '+
                          ' AND   R.IDBENEFICIO = '+IntToStr(qryBeneficio.FieldByName('IdBeneficio').AsInteger) +
                          ' AND   R.IDPLANOPREV = '+IntToStr(iIdPlanoPrev);

           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(sSQL);
           qryAux.Open;

         end;
         // Andre Imakawa - SIG 34272 - Fim

         if  ((qryAux.FieldByName('MESREAJ').AsString = sAnoMesAtual) AND (sAnoMesAtual <> sAnoMesInicio)) then
         begin
            bReajusta := true;
            //CmDebugToFile('  se for mes de reajuste ' ,'C:\debug desdobramento.txt');
            sDiaMesAnoAnterior := SAnoMesAnterior(sAnoMesAtual);
            sDiaMesAnoAnterior := '01/' + Copy(sDiaMesAnoAnterior,6,2)+'/'+Copy(sDiaMesAnoAnterior,1,4);
            rValorTotal      := PegaValorTotal( qryAux,
                                                   qryProcesso.FieldByName('NumeroProcesso').AsInteger,
                                                   qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                   qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                                   sDiaMesAnoAnterior);
            //CmDebugToFile('  rValorTotal na data '+sDiaMesAnoAnterior+' rValorTotal '+FloatToStr(rValorTotal) ,'C:\debug desdobramento.txt');
           // fernando xavier - SOL 253577-17664 / PPM 1019932
            PegaValorTOTALBsFab( qryAux,
                                 qryProcesso.FieldByName('NumeroProcesso').AsInteger,
                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                 qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                 sDiaMesAnoAnterior,
                                 sValorTotalBS, sValorTotalFAB, sValorTotalDeficit
                                 , false, true               //edilaine - SIG85197
                                 );

         end;


         // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
         if (sValorTotalBS <> '') {and (bReajusta)} then   //SOL 253577-18114  PPM 1292515
         begin
           rValorRealBS  := StrToFloat(ClienteNumero(sValorTotalBS));
           sValorFinalBS := ReajustaBenefConc( qryAux,
                                             sAnoMesAtual,
                                             sDataInicioOriginal,
                                             iIdPessJur,
                                             iIdPlanoPrev,
                                             iIdTitular,
                                             qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                             qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                             iNumeroProcesso,
                                             iNumBenef,
                                             rValorRealBS,
                                             rValorBase1,
                                             rValorBase2,
                                             rValorBase3,
                                             bReajustou,
                                             bErro, False, sMsgErro, rValorRealBS, dValorSRBRetorno, iIdCalculo, False,
                                             5,'',False,False,qryBeneficiarios.FieldByname('DIBBENEFANT').AsString,-1,-1,sDTDIBAnterior,
                                             false, true, true
                                              );
         end;
         if sValorFinalBS <> '' then
         begin
            rValorRealBS  := StrToFloat(ClienteNumero(sValorFinalBS));
            sValorTotalBS := ClienteNumero(sValorFinalBS);

            //WO18495 Leanreo Pocebon inicio
            if bReajustou then
            begin
              sValorFinal        := sValorTotalBS;
            end;
            //WO18495 Leanreo Pocebon fim
         end;


         if (sValorTotalFAB <> '') {and (bReajusta)} then   //SOL 253577-18114  PPM 1292515
         begin
            rValorRealFAB  := StrToFloat(ClienteNumero(sValorTotalFAB));
            sValorFinalFAB := ReajustaBenefConc( qryAux,
                                              sAnoMesAtual,
                                              sDataInicioOriginal,
                                              iIdPessJur,
                                              iIdPlanoPrev,
                                              iIdTitular,
                                              qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                              qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                              iNumeroProcesso,
                                              iNumBenef,
                                              rValorRealFAB,
                                              rValorBase1,
                                              rValorBase2,
                                              rValorBase3,
                                              bReajustou,
                                              bErro, False, sMsgErro, rValorRealFAB, dValorSRBRetorno, iIdCalculo, False,
                                              5,'',False,False,qryBeneficiarios.FieldByname('DIBBENEFANT').AsString,-1,-1,sDTDIBAnterior,
                                              false, true, false
                                               );

         end;
         if sValorFinalFAB <> '' then
         begin
            rValorRealFAB  := StrToFloat(ClienteNumero(sValorFinalFAB));
            sValorTotalFAB := ClienteNumero(sValorFinalFAB);
         end;

         if (sValorTotalDeficit <> '') {and (bReajusta)} then   //SOL 253577-18114  PPM 1292515
         begin
            rValorRealDeficit  := StrToFloat(ClienteNumero(sValorTotalDeficit));
            sValorFinalDeficit := ReajustaBenefConc( qryAux,
                                              sAnoMesAtual,
                                              sDataInicioOriginal,
                                              iIdPessJur,
                                              iIdPlanoPrev,
                                              iIdTitular,
                                              qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                              qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                              iNumeroProcesso,
                                              iNumBenef,
                                              rValorRealDeficit,
                                              rValorBase1,
                                              rValorBase2,
                                              rValorBase3,
                                              bReajustou,
                                              bErro, False, sMsgErro, rValorRealDeficit, dValorSRBRetorno, iIdCalculo, False,
                                              5,'',False,False,qryBeneficiarios.FieldByname('DIBBENEFANT').AsString,-1,-1,sDTDIBAnterior,
                                             false, true, true
                                               );

         end;
         if sValorFinalDeficit <> '' then
         begin
            rValorRealDeficit  := StrToFloat(ClienteNumero(sValorFinalDeficit));
            sValorTotalDeficit := ClienteNumero(sValorFinalDeficit);
         end;
         // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

         if (bReajusta) then   //SOL 253577-18114  PPM 1292515
         begin
          sValorFinal := ReajustaBenefConc( qryAux,
                                            sAnoMesAtual,
                                            sDataInicioOriginal,
                                            iIdPessJur,
                                            iIdPlanoPrev,
                                            iIdTitular,
                                            qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                            qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                            iNumeroProcesso,
                                            iNumBenef,
                                            rValorTotal,
                                            rValorBase1,
                                            rValorBase2,
                                            rValorBase3,
                                            bReajustou,
                                            bErro, False, sMsgErro, rValorTotal, dValorSRBRetorno, iIdCalculo, False,
                                            5,'',False,False,qryBeneficiarios.FieldByname('DIBBENEFANT').AsString,-1,-1,sDTDIBAnterior
                                             );
         end;
         if sValorFinal <> '' then
         begin
            rValorReal  := StrToFloat(ClienteNumero(sValorFinal));
            rValorTotal := StrToFloat(ClienteNumero(sValorFinal));
         end;
         //CmDebugToFile('  sValorFinal retornado da regra '+sValorFinal ,'C:\debug desdobramento.txt');
      end;

     sValorFinal := ClienteNumero(FloatToStr(rValorReal));
     rValorReal  := StrToFloat(ClienteNumero(sValorFinal));
     rValorTotal := StrToFloat(ClienteNumero(sValorFinal));
     // FIM SOL 110091

     if sAnoMesAtual = sAnoMesInicio then //SOL 253577-18114  PPM 1292515
     begin
        rValorBeneficioNoDib := rValorTotal; //SOL 253577-18114  PPM 1292515
        rValoraTUALNaDib :=  qryBeneficiarios.FieldByName('ValorAtual').AsFloat;
        rValorCalculadoNaDib := qryBeneficiarios.FieldByName('ValorCalculado').AsFloat ;
        rValorTotalNaDib := qryBeneficiarios.FieldByName('ValorTotal').AsFloat ;
     end;

     //CmDebugToFile('  laço TRATA NOVOS BENEFICIARIOS  ' ,'C:\debug desdobramento.txt');
     while(not qryBeneficiarioEmUso.Eof) do { TRATA NOVOS BENEFICIARIOS }
     begin

        if sAnoMesInicio = sAnoMesAtual then//SOL 253577-18114 PPM 1292515 17/02/2016
           GeraNumeroProcesso(iNumeroProcesso); //SOL 253577-18114 PPM 1292515 17/02/2016

        iIdPlanoOrigem := StrToint(BuscaPlanoOrigem( iIdPessJur, iIdTitular, sAnoMesPagamento,
                                                     qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger, qryBeneficio.FieldByName('IdBeneficio').AsInteger, 5));  // SIG53535 // Andre Imakawa - SIG 54212

        // Verificar se teve reajuste
        // Se o benefício for em cotas
        // Entao converter para real na data de competencia
        // Senao Se houve reajuste no mes
        //       Entao reajusta beneficio conforme tabela de reajuste
        sDataCompetencia := Copy(Trim(sDataInicio),1,2)+'/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4);

        if bErro
        then begin
          frmAguarde.Apaga;
          MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
          rValorBeneficioNoMes  := 0;
          Exit;
        end;

        try
           sValorFinal     := OraNumero(sValorFinal);
           rValorBeneficioNoMes := StrToFloat(ClienteNumero(sValorFinal));
           //CmDebugToFile('  sValorFinal e rValorBeneficioNoMes recebe sValorFinal '+sValorFinal ,'C:\debug desdobramento.txt');
           // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
           sValorNoMesBS      :=  iif(sValorFinalBS = '', '', ClienteNumero(sValorFinalBS));
           sValorNoMesFAB     :=  iif(sValorFinalFAB = '', '', ClienteNumero(sValorFinalFAB));
           sValorNoMesDeficit :=  iif(sValorFinalDeficit = '', '', ClienteNumero(sValorFinalDeficit));
           // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim
        except
          frmAguarde.Apaga;
          MsgDlg('Erro na conversão do benefício.','Erro',mtError,[mbOk,mbHelp],0);
          rValorBeneficioNoMes  := 0;

          // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
          sValorNoMesBS      :=  '';
          sValorNoMesFAB     :=  '';
          sValorNoMesDeficit :=  '';
          // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

          Exit;
        end;
        rValorIntegral      := rValorBeneficioNoMes;
        dVlrBenefReajustado := rValorBeneficioNoMes; { Guarda Valor Reajustado }
        rValorTotalAnt      := rValorTotal;          { Guarda valor total reajustado }
        //CmDebugToFile('  rValorTotalAnt      := rValorTotal '+FloatToStr(rValorTotal) ,'C:\debug desdobramento.txt');
        // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
        sValorIntegralBS      := sValorNoMesBS;
        sValorIntegralFAB     := sValorNoMesFAB;
        sValorIntegralDeficit := sValorNoMesDeficit;

        sVlrBSReajustado      := sValorNoMesBS;
        sVlrFABReajustado     := sValorNoMesFAB;
        sVlrDeficitReajustado := sValorNoMesDeficit;
        // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

        { Calcula Beneficio Minimo }
        CalculaBeneficioMinimoLocal( sAnoMesAtual, sDataFolha,
                                     sData, sAnoMesPagamento,
                                     rValorBeneficioNoMes,
                                     rValorTotal,
                                     iNumBenef,
                                     qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                     rValorDepoisMinimo );
        //CmDebugToFile('  CalculaBeneficioMinimoLocal '+FloatToStr(rValorTotal) ,'C:\debug desdobramento.txt');
        // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
        if sValorTotalBS <> '' then
        begin
          CalculaBeneficioMinimoLocal( sAnoMesAtual, sDataFolha,
                                       sData, sAnoMesPagamento,
                                       StrToFloat(sValorNoMesBS),
                                       rValorRealBS,
                                       iNumBenef,
                                       qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                       rValorDepoisMinimoBS );

          if rValorDepoisMinimoBS > 0 then
          begin
            sValorTotalBS := FloatToStr(rValorDepoisMinimoBS);
            rValorRealBS  := rValorDepoisMinimoBS;
          end;
        end;

        if sValorTotalFAB <> '' then
        begin
          CalculaBeneficioMinimoLocal( sAnoMesAtual, sDataFolha,
                                       sData, sAnoMesPagamento,
                                       StrToFloat(sValorNoMesFAB),
                                       rValorRealFAB,
                                       iNumBenef,
                                       qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                       rValorDepoisMinimoFAB );

          if rValorDepoisMinimoFAB > 0 then
          begin
            sValorTotalFAB := FloatToStr(rValorDepoisMinimoBS);
            rValorRealFAB  := rValorDepoisMinimoFAB;
          end;
        end;

        if sValorTotalDeficit <> '' then
        begin
           CalculaBeneficioMinimoLocal( sAnoMesAtual, sDataFolha,
                                        sData, sAnoMesPagamento,
                                        StrToFloat(sValorNoMesDeficit),
                                        rValorRealDeficit,
                                        iNumBenef,
                                        qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                        rValorDepoisMinimoDeficit );

          if rValorDepoisMinimoDeficit > 0 then
          begin
            sValorTotalDeficit := FloatToStr(rValorDepoisMinimoDeficit);
            rValorRealDeficit  := rValorDepoisMinimoDeficit;
          end;
        end;
        // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

        { Utiliza maior entre Valor Total e Beneficio Minimo }
        If rValorDepoisMinimo > 0 Then Begin
          rValorTotal := rValorDepoisMinimo;
        End;

        rValorBeneficioNoMes := rValorTotal;
        sValorFinal     := OraNumero(FloatToStr(rValorTotal));
        //CmDebugToFile('  sValorFinal     := OraNumero(FloatToStr(rValorTotal)); '+FloatToStr(rValorTotal) ,'C:\debug desdobramento.txt');
        rValorIntegral  := rValorTotal;

        // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
        sValorIntegralBS      := sValorTotalBS;
        sValorIntegralFAB     := sValorTotalFAB;
        sValorIntegralDeficit := sValorTotalDeficit;

        sValorNoMesBS       := sValorTotalBS;
        sValorNoMesFAB      := sValorTotalFAB;
        sValorNoMesDeficit  := sValorTotalDeficit;

        sValorFinalBS       := sValorTotalBS;
        sValorFinalFAB      := sValorTotalFAB;
        sValorFinalDeficit  := sValorTotalDeficit;
        // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim


        { Busca valor atual do INSS, pode ter sido reajustado }
        sVlrInfINSS := CalcBeneficioINSSAtual( iIdPessJur,
                                               iIdPlanoPrev,
                                               iIdTitular,
                                               qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                               sAnoMesAtual,
                                               sAnoMesAtual,
                                               sIdTpPagtoAnt,
                                               sFlgBenefMinimo,
                                               qryAux,
                                               iNumeroProcessoINSS );
        sVlrCalcInss    := sVlrInfINSS;
        //CmDebugToFile('  sVlrCalcInss    := sVlrInfINSS '+sVlrInfINSS ,'C:\debug desdobramento.txt');
        // Ratear o valor total para todos os beneficiarios  (R -> 132)

        { Apesar do reajuste já ratear o resultado da função  é o valor total }
        { do beneficio, precisando ser rateado novamente.                     }
        Try
           dNovoValorRateado := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                               qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                                               -1,
                                               iIdPessJur,
                                               iIdPlanoOrigem,
                                               iIdTitular,
                                               iSeqProposta,
                                               qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                               //qryProcesso.FieldByName('NumeroProcesso').AsInteger,
                                               iNumeroProcessoNovo,
                                               iNumBenef,
                                               0,0,0,
                                               sSQLBenefAssoc,
                                               dbedDtEvento.Text,
                                               sDtInicioFund,
                                               sDtInicioINSS,
                                               // qryBeneficiarios.FieldByName('ValorTotal').AsString,
                                               FloatToStr(rValorTotal),
                                               sVlrCalcINSS,
                                               sVlrInfINSS,
                                               '0',
                                               bErro,
                                               sMsgErro,
                                               iIdCalculo,
                                               qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                               qryBeneficiarioEmUso.FieldByName('IdDependencia').AsString,
                                               qryBeneficiarioEmUso.FieldByName('Percentual').AsString,
                                               2,
                                               '','',
                                               sAnoMesAtual);

        except
           frmAguarde.Apaga;
           MsgDlg('Erro na Regra de Cálculo - Nº '+qryBeneficio.FieldByName('IdRegraCalculo').AsString,'Erro',mtError,[mbOk,mbHelp],0);
           dNovoValorRateado := 0;
           Exit;
        end;
        dNovoValorRateado := StrToFloat(ClienteNumero(FormatFloat('#0.00',dNovoValorRateado)));
        //CmDebugToFile('  Valor rateado dNovoValorRateado retornado pela regra '+FloatToStr(dNovoValorRateado) ,'C:\debug desdobramento.txt');
        //SOL 174933 KINTANA 1733374
        RValorAntigo:= rValorTotalAnt;
        RNovoValor:=  dNovoValorRateado;
        //SOL 174933 KINTANA 1733374

        // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
        if sValorTotalBS <> '' then
        begin
           Try
              rVlrCalculado := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                  qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                                                  -1,
                                                  iIdPessJur,
                                                  iIdPlanoOrigem,
                                                  iIdTitular,
                                                  iSeqProposta,
                                                  qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                  //qryProcesso.FieldByName('NumeroProcesso').AsInteger,
                                                  iNumeroProcessoNovo,
                                                  iNumBenef,
                                                  0,0,0,
                                                  sSQLBenefAssoc,
                                                  dbedDtEvento.Text,
                                                  sDtInicioFund,
                                                  sDtInicioINSS,
                                                  sValorTotalBS,
                                                  sVlrCalcINSS,
                                                  sVlrInfINSS,
                                                  '0',
                                                  bErro,
                                                  sMsgErro,
                                                  iIdCalculo,
                                                  qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                                  qryBeneficiarioEmUso.FieldByName('IdDependencia').AsString,
                                                  qryBeneficiarioEmUso.FieldByName('Percentual').AsString,2,
                                                  '','',
                                                  sAnoMesAtual
                                                  ,-1,0,0,0,0,'',-1,
                                                  0,
                                                  StrToFloat(sValorTotalBS)
                                                  );
           except
              frmAguarde.Apaga;
              MsgDlg('Erro na Regra de Cálculo - Nº '+qryBeneficio.FieldByName('IdRegraCalculo').AsString,'Erro',mtError,[mbOk,mbHelp],0);
              sNovoValorRateadoBS := '';
              Exit;
           end;
           sNovoValorRateadoBS := FloatToStr(rVlrCalculado);
        end;

        if sValorTotalFAB <> '' then
        begin
           Try
              rVlrCalculado := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                  qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                                                  -1,
                                                  iIdPessJur,
                                                  iIdPlanoOrigem,
                                                  iIdTitular,
                                                  iSeqProposta,
                                                  qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                  //qryProcesso.FieldByName('NumeroProcesso').AsInteger,
                                                  iNumeroProcessoNovo,
                                                  iNumBenef,
                                                  0,0,0,
                                                  sSQLBenefAssoc,
                                                  dbedDtEvento.Text,
                                                  sDtInicioFund,
                                                  sDtInicioINSS,
                                                  sValorTotalFAB,
                                                  sVlrCalcINSS,
                                                  sVlrInfINSS,
                                                  '0',
                                                  bErro,
                                                  sMsgErro,
                                                  iIdCalculo,
                                                  qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                                  qryBeneficiarioEmUso.FieldByName('IdDependencia').AsString,
                                                  qryBeneficiarioEmUso.FieldByName('Percentual').AsString,2,
                                                  '','',
                                                  sAnoMesAtual
                                                  ,-1,0,0,0,0,'',-1,
                                                  0,
                                                  StrToFloat(sValorTotalFAB)
                                                  );
           except
              frmAguarde.Apaga;
              MsgDlg('Erro na Regra de Cálculo - Nº '+qryBeneficio.FieldByName('IdRegraCalculo').AsString,'Erro',mtError,[mbOk,mbHelp],0);
              sNovoValorRateadoFAB := '';
              Exit;
           end;
           sNovoValorRateadoFAB := FloatToStr(rVlrCalculado);
        end;
        // fernando xavier - SOL 253577-17664 / PPM 1019932


        iIdUsuarioAutoriza := VerificaVALORLimiteBeneficio ( qryAux,
                                                             frmDesdobramentoBenef.Caption,
                                                             //qryProcesso.FieldByName('NumeroProcesso').AsInteger,
                                                             iNumeroProcessoNovo,
                                                             iIdPessJur,
                                                             iIdPlanoOrigem,
                                                             iIdTitular,
                                                             qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                                             qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                             dNovoValorRateado,
                                                             True);
        if iIdUsuarioAutoriza < 0
        then begin
           frmAguarde.Apaga;
           MsgDlg('Desdobramento não permitido por exceder valor limite e não ter autorização. Verifique. ','Erro',mtError,[mbOk],0);
           dNovoValorRateado := 0;
           Exit;
        end;

        if sAnoMesAtual = sAnoMesFinal
        then begin
           //CmDebugToFile('  sAnoMesAtual = sAnoMesFinal qryBenefBfciario.Insert; ' ,'C:\debug desdobramento.txt');
           qryBenefBfciario.Insert;
           if Trim(sDataFinal) <> ''
           then qryBenefBfciario.FieldByName('DATAFINAL').AsDateTime   := StrToDate(sDataFinal);
           qryBenefBfciario.FieldByName('DATAINICIO').AsDateTime       := StrToDate(sDataInicio);
           qryBenefBfciario.FieldByName('DATAINICIOFUND').AsDateTime   := StrToDate(sDtInicioFund);
           if Trim(sDtInicioINSS) <> ''
           then qryBenefBfciario.FieldByName('DATAINICIOINSS').AsDateTime   := StrToDate(sDtInicioINSS);
           qryBenefBfciario.FieldByName('DATAREQUERIMENTO').AsDateTime := StrToDate(sDtRequerimento);
           qryBenefBfciario.FieldByName('FLGPAGAINSS').AsString := _sFlgPagaInss;       ///douglas.siqueira SOL 171026 KITANTA 1528962
           qryBenefBfciario.FieldByName('FLGBENEFMIN').AsInteger       := 0;
           qryBenefBfciario.FieldByName('FLGFORMAPAGTO').AsString      := 'F';
           qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger       := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
           qryBenefBfciario.FieldByName('IDDEPENDENCIA').AsString      := qryBeneficiarioEmUso.FieldByName('IdDependencia').AsString;
           qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger         := iIdPessJur;
           qryBenefBfciario.FieldByName('IDPESSOA').AsInteger          := qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger;
           qryBenefBfciario.FieldByName('IDPLANOORIGEM').AsInteger     := qryBeneficiarioEmUso.FieldByName('IdPlanoprev').AsInteger; //iIdPlanoOrigem; //BRUNO AZEVEDO
           qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger       := qryBeneficiarioEmUso.FieldByName('IdPlanoprev').AsInteger;  //iIdPlanoPrev,

           qryBenefBfciario.FieldByName('IDPERFILINVEST').AsString     := qryBeneficiarios.FieldByName('IDPERFILINVEST').AsString;   //edilaine - SIG55933

           if sFontePagadora = '2' then   // SOL 202689 Kintana 1958612
           begin
              if _sFlgPagaInss = '0' then
                 qryBenefBfciario.FieldByName('IDSITBENEFICIO').AsInteger    := 2 // ///douglas.siqueira SOL 171026 KITANTA 1528962
              else
                 qryBenefBfciario.FieldByName('IDSITBENEFICIO').AsInteger    := 4; // Pendente de Concessão
           end
           else
           begin // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
              qryBenefBfciario.FieldByName('IDSITBENEFICIO').AsInteger    := 4; // Pendente de Concessão  // SOL 202689 Kintana 1958612
              if bApresentaBSFAB then
              begin
                 qryBenefBfciario.FieldByName('BSDIB').AsString        := sValorTotalBSAnt;
                 qryBenefBfciario.FieldByName('FABDIB').AsString       := sValorTotalFABAnt;
                 qryBenefBfciario.FieldByName('VLRBSTOTAL').AsString   := sValorNoMesBS;  //sValorTotalBSAnt;
                 qryBenefBfciario.FieldByName('VLRFABTOTAL').AsString  := sValorNoMesFAB;  // sValorTotalFABAnt;
                 qryBenefBfciario.FieldByName('VLRFABATUAL').AsString  := sNovoValorRateadoFAB;
                 qryBenefBfciario.FieldByName('VLRBSATUAL').AsString   := sNovoValorRateadoBS;
              end
              else
              begin
                 qryBenefBfciario.FieldByName('BSDIB').Clear;
                 qryBenefBfciario.FieldByName('VLRBSTOTAL').Clear;
                 qryBenefBfciario.FieldByName('FABDIB').Clear;
                 qryBenefBfciario.FieldByName('VLRFABTOTAL').Clear;
                 qryBenefBfciario.FieldByName('VLRFABATUAL').Clear;
                 qryBenefBfciario.FieldByName('VLRBSATUAL').Clear;
              end;

              if  bApresentaDeficit then
                 qryBenefBfciario.FieldByName('VLRBASEDEFICIT').AsString := sValorTotalDeficit
              else
                 qryBenefBfciario.FieldByName('VLRBASEDEFICIT').Clear;
           end; // fernando xavier - SOL 253577-17664 / PPM 1019932  - fim

           qryBenefBfciario.FieldByName('IDTITULAR').AsInteger         := iIdTitular;
           qryBenefBfciario.FieldByName('IDTPPAGTOBENEFIC').AsInteger  := StrToInt(sIdTpPagtoBenefic);
           //qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger    := iNumeroProcesso; //SOL 253577-18114 PPM 1292515 17/02/2016
           qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger    := iNumeroProcessoNovo; //SOL 253577-18114 PPM 1292515 17/02/2016
           qryBenefBfciario.FieldByName('NUMPROCINSS').AsString        := sNumProcINSS;
           qryBenefBfciario.FieldByName('SEQPROPOSTA').AsInteger       := iSeqProposta;
           qryBenefBfciario.FieldByName('ULTMESPREPARO').AsString      := sAnoMesAtual;
           //qryBenefBfciario.FieldByName('VALORATUAL').AsFloat          := dNovoValorRateado; // SOL 192563 KINTANA 1877175
           qryBenefBfciario.FieldByName('VALORATUAL').AsFloat          := StrToFloat(ClienteNumero(FormatFloat('#0.00',dNovoValorRateado)));  // SOL 192563 KINTANA 1877175
           //CmDebugToFile('  VALORATUAL '+FloatToStr(dNovoValorRateado) ,'C:\debug desdobramento.txt');
           if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
           then   begin
             //qryBenefBfciario.FieldByName('VALORCALCULADO').AsFloat := rValorCotas;  // SOL 192563 KINTANA 1877175
             qryBenefBfciario.FieldByName('VALORCALCULADO').AsFloat := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorCotas)));  // SOL 192563 KINTANA 1877175
             //CmDebugToFile('  VALORCALCULADO '+FloatToStr(rValorCotas) ,'C:\debug desdobramento.txt');
             end
           else
             //qryBenefBfciario.FieldByName('VALORCALCULADO').AsFloat := rValorBeneficioNoMes;    // SOL 192563 KINTANA 1877175
             qryBenefBfciario.FieldByName('VALORCALCULADO').AsFloat := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorBeneficioNoMes))); // SOL 192563 KINTANA 1877175
             //CmDebugToFile('  VALORCALCULADO '+FloatToStr(rValorBeneficioNoMes) ,'C:\debug desdobramento.txt');
           //qryBenefBfciario.FieldByName('VALORCOTAS').AsFloat          := rValorCotas;  // SOL 192563 KINTANA 1877175
           qryBenefBfciario.FieldByName('VALORCOTAS').AsFloat          := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorCotas)));  // SOL 192563 KINTANA 1877175
           //qryBenefBfciario.FieldByName('VALORTOTAL').AsFloat          := rValorTotalAnt;  // SOL 192563 KINTANA 1877175
           qryBenefBfciario.FieldByName('VALORTOTAL').AsFloat          := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorTotalAnt))); // SOL 192563 KINTANA 1877175
           //CmDebugToFile('  VALORTOTAL '+FloatToStr(rValorTotalAnt) ,'C:\debug desdobramento.txt');
           //BRUNO AZEVEDO
           //qryBenefBfciario.FieldByName('VALORNADIB').AsFloat          := rValorTotalAnt; // SOL 192563 KINTANA 1877175
           //qryBenefBfciario.FieldByName('VALORNADIB').AsFloat          := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorTotalAnt)));  // SOL 192563 KINTANA 1877175 // //SOL 253577-18114  PPM 1292515
           qryBenefBfciario.FieldByName('VALORNADIB').AsFloat          := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorBeneficioNoDib)));  //SOL 253577-18114  PPM 1292515


           //qryBenefBfciario.FieldByName('VLRCALCINSS').AsFloat         := StrToFloat(ClienteNumero(sVlrCalcINSS));  // SOL 192563 KINTANA 1877175
           qryBenefBfciario.FieldByName('VLRCALCINSS').AsFloat         := StrToFloat(ClienteNumero(FormatFloat('#0.00',strtofloat(ClienteNumero(sVlrCalcINSS))))); // SOL 192563 KINTANA 1877175
           //qryBenefBfciario.FieldByName('VLRINFINSS').AsFloat          := StrToFloat(ClienteNumero(sVlrInfINSS)); // SOL 192563 KINTANA 1877175
           qryBenefBfciario.FieldByName('VLRINFINSS').AsFloat          := StrToFloat(ClienteNumero(FormatFloat('#0.00',strtofloat(ClienteNumero(sVlrInfINSS))))); // SOL 192563 KINTANA 1877175
           //qryBenefBfciario.FieldByName('VALORATUALANT').AsFloat       := qryBeneficiarios.FieldByname('VALORATUAL').AsFloat; // SOL 192563 KINTANA 1877175
           qryBenefBfciario.FieldByName('VALORATUALANT').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByname('VALORATUAL').AsFloat))); // SOL 192563 KINTANA 1877175
           qryBenefBfciario.FieldByName('MATRICULA').AsString          := qryBeneficiarioEmUso.FieldByName('MATRICULA').AsString;

           if (qrybeneficio.fieldbyname('FLGPECULIO').AsInteger <> 1) and
              (qrybeneficio.fieldbyname('FLGRESGATE').AsInteger <> 1) and
              (trim(prmMASCMATPENS) <> '')
           then begin
              If (qryBeneficiarioEmUso.FieldByName('MATRICULA').AsString = '') And
                  (qryBenefBfciario.FieldByName('MATRICULA').AsString = '')
              Then Begin
                sMatriculaNova := GeraMatricula (QryAux, iIdCalculo);
                sSQLValues := 'UPDATE DEPENTIT SET MATRICULA = '+QuotedStr(sMatriculaNova)+' '+
                              'WHERE IDTITULAR = '+IntToStr(iIdTitular)+
                              '      AND IDPESSOA = '+qryBeneficiarioEmUso.FieldByName('IdPessoa').AsString;
                ExecutarQuery(QryAux, sSQLValues);
                qryBenefBfciario.FieldByName('MATRICULA').AsString := sMatriculaNova;
              End;
           end;
           // edilaine - SOL 253577-17664 / PPM 1019932 - inicio
           //qryBenefBfciario.FieldByName('DIBBENEFANT').AsDateTime  := qryBeneficiarios.FieldByname('DIBBENEFANT').AsDateTime
           qryBenefBfciario.FieldByName('DIBBENEFANT').AsString      := sDTDIBAnterior;
           // edilaine - SOL 253577-17664 / PPM 1019932 - fim
           qryBenefBfciario.FieldByName('FONTEPAGADORA').AsString      := sFontePagadora; // SOL 159974 KINTANA 1327873
           qryBenefBfciario.Post;

        end;
        rValorBeneficioNoMes := dNovoValorRateado;

        // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
        sValorNoMesBS      := sNovoValorRateadoBS;
        sValorNoMesFAB     := sNovoValorRateadoFAB;
        // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

        {--------------------------------------------------------------------------}
        { Verificar se é PRIMEIRO pagamento (utiliza-se a DIP para data de inicio) }

        if (sAnoMesAtual = sAnoMesInicio) And
           ( sFlgFrequencia = 'I' )
        then begin
           bProRata        := True;
           sData           := sDataInicio;
           rValorBeneficioNoMes := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                                  qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
                                                                  iIdTitular,
                                                                  qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                                                  iSeqProposta,
                                                                  iIdPessJur,
                                                                  iIdPlanoOrigem,
                                                                  qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                  iNumBenef,
                                                                  sData,
                                                                  '',
                                                                  '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                                                  OraNumero(FloatToStr(dNovoValorRateado)),
                                                                  ' Primeiro ', bErro, sMsgErro, iIdCalculo,
    							          false);//Marcio Sanches Spinosa SOL 182092/14207 15207 15253 KITANTA 1969056);

           if bErro
           then begin
              frmAguarde.Apaga;
              MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
              rValorBeneficioNoMes  := 0;
              Exit;
           end;

           //CmDebugToFile('  Verificar se é PRIMEIRO pagamento (utiliza-se a DIP para data de inicio) '+FloatToStr(rValorBeneficioNoMes) ,'C:\debug desdobramento.txt');
           if sNovoValorRateadoBS <> '' then  // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
           begin

              rVlrCalculado := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                              qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
                                                              iIdTitular,
                                                              qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                                              iSeqProposta,
                                                              iIdPessJur,
                                                              iIdPlanoOrigem,
                                                              qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                              iNumBenef,
                                                              sData,
                                                              '',
                                                              '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                                              sNovoValorRateadoBS,
                                                              ' Primeiro ', bErro, sMsgErro, iIdCalculo,
                                                              false);//Marcio Sanches Spinosa SOL 182092/14207 15207 15253 KITANTA 1969056);

              if bErro
              then begin
                 frmAguarde.Apaga;
                 MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                 sValorNoMesBS  := '';
                 Exit;
              end;
              sValorNoMesBS := FloatToStr(rVlrCalculado);
           end;

           if sNovoValorRateadoFAB <> '' then
           begin
              rVlrCalculado := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                              qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
                                                              iIdTitular,
                                                              qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                                              iSeqProposta,
                                                              iIdPessJur,
                                                              iIdPlanoOrigem,
                                                              qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                              iNumBenef,
                                                              sData,
                                                              '',
                                                              '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                                              sNovoValorRateadoFAB,
                                                              ' Primeiro ', bErro, sMsgErro, iIdCalculo,
                                                              false);//Marcio Sanches Spinosa SOL 182092/14207 15207 15253 KITANTA 1969056);

              if bErro
              then begin
                 frmAguarde.Apaga;
                 MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                 sValorNoMesFAB := '';
                 Exit;
              end;
              sValorNoMesFAB := FloatToStr(rVlrCalculado);
           end;


           if sValorTotalDeficit <> '' then
           begin
              rVlrCalculado  := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                                     qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
                                                                     iIdTitular,
                                                                     qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                                                     iSeqProposta,
                                                                     iIdPessJur,
                                                                     iIdPlanoOrigem,
                                                                     qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                     iNumBenef,
                                                                     sData,
                                                                     '',
                                                                     '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                                                     sValorNoMesDeficit,
                                                                     ' Primeiro ', bErro, sMsgErro, iIdCalculo,
                                                                     false);//Marcio Sanches Spinosa SOL 182092/14207 15207 15253 KITANTA 1969056);

              if bErro
              then begin
                 frmAguarde.Apaga;
                 MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                 sValorNoMesDeficit := '';
                 Exit;
              end;
              sValorNoMesDeficit :=  FloatToStr(rVlrCalculado);
           end;  // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

        end; // if PRIMEIRO pagamento

        {----------------------------------------------------------------------}
        { Verificar se é ULTIMO pagamento                                      }
        { Somente quando ano/mes processado = ANO/MES FINAL do BENEFICIO       }
        if (sAnoMesAtual = sAnoMesDataFinal)
           And ( sFlgFrequencia = 'I' )
        then begin
           bProRata := True;

           sData := Copy(sDataFinal,1,2) + '/'+Copy(sAnoMesAtual,6,2) + '/' + Copy(sAnoMesAtual,1,4); //Passa para a regra a data de reajuste
           rValorBeneficioNoMes := ExecutaRegraPrimUltPagtoBenef(qryAux,
                                      qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                      iIdTitular,
                                      qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                      iSeqProposta,
                                      iIdPessJur, iIdPlanoPrev,
                                      qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                      iNumBenef,
                                      sDtInicioFund,
                                      sData,
                                      '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                      OraNumero(FloatToStr(rValorBeneficioNoMes)),
                                      ' Último ', bErro, sMsgErro, iIdCalculo);
           if bErro
           then begin
              frmAguarde.Apaga;
              MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
              rValorBeneficioNoMes  := 0;
              Exit;
           end;
           //CmDebugToFile('  Verificar se é ULTIMO pagamento   '+FloatToStr(rValorBeneficioNoMes) ,'C:\debug desdobramento.txt');
           if sValorNoMesBS <> '' then // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
           begin
              rVlrCalculado := ExecutaRegraPrimUltPagtoBenef(qryAux,
                                         qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                         iIdTitular,
                                         qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                         iSeqProposta,
                                         iIdPessJur, iIdPlanoPrev,
                                         qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                         iNumBenef,
                                         sDtInicioFund,
                                         sData,
                                         '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                         sValorNoMesBS,
                                         ' Último ', bErro, sMsgErro, iIdCalculo);
              if bErro
              then begin
                 frmAguarde.Apaga;
                 MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                 sValorNoMesBS := '';
                 Exit;
              end;
              sValorNoMesBS := FloatToStr(rVlrCalculado);
           end;

           if sValorNoMesFAB <> '' then
           begin
              rVlrCalculado := ExecutaRegraPrimUltPagtoBenef(qryAux,
                                         qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                         iIdTitular,
                                         qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                         iSeqProposta,
                                         iIdPessJur, iIdPlanoPrev,
                                         qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                         iNumBenef,
                                         sDtInicioFund,
                                         sData,
                                         '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                         sValorNoMesFAB,
                                         ' Último ', bErro, sMsgErro, iIdCalculo);
              if bErro
              then begin
                 frmAguarde.Apaga;
                 MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                 sValorNoMesFAB := '';
                 Exit;
              end;
              sValorNoMesFAB := FloatToStr(rVlrCalculado);
           end;

           if sValorNoMesDeficit <> '' then
           begin
              rVlrCalculado := ExecutaRegraPrimUltPagtoBenef(qryAux,
                                         qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                         iIdTitular,
                                         qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger,
                                         iSeqProposta,
                                         iIdPessJur, iIdPlanoPrev,
                                         qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                         iNumBenef,
                                         sDtInicioFund,
                                         sData,
                                         '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                         sValorNoMesDeficit,
                                         ' Último ', bErro, sMsgErro, iIdCalculo);
              if bErro
              then begin
                 frmAguarde.Apaga;
                 MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                 sValorNoMesDeficit  := '';
                 Exit;
              end;
              sValorNoMesDeficit := FloatToStr(rVlrCalculado);
           end; // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

        end; // if ULTIMO pagamento

        iIdPlanoOrigem := StrToint(BuscaPlanoOrigem( iIdPessJur, iIdTitular, sAnoMesPagamento,
                                                     qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger, qryBeneficio.FieldByName('IdBeneficio').AsInteger, 5)); // SIG53535 // Andre Imakawa - SIG 54212
        {----------------------------------------------------------------------}
        { Verificar se é mes de ABONO                     }

        if bPossuiAbono then begin

          bPagaAbono  := EhMesAbono(QryAux,
                                    iIdPessJur,
                                    iIdPlanoPrev,
                                    qryBeneficio.fieldbyname('IDBENEFICIO').AsInteger,
                                    sAnoMesAtual);

        end;
        if (bPagaAbono = True) {and (Copy(sAnoMesAtual,6,2) = '11') }Then Begin

          // Verifica se o adiantamento de abono e o abono estão sendo inseridos
          // no mesmo cálculo. Caso estejam, deleta os adiantamentos e lança apenas o abono
          qryHstNovoBenef.first;
          while not qryHstNovoBenef.eof do
          begin
             if  (qryHstNovoBenef.fieldbyname('IdPessoa').AsInteger =  qryBeneficiarioEmUso.FieldByName('IDPESSOA').AsInteger) and
                 (qryHstNovoBenef.fieldbyname('MESREFERENCIA').AsString = Copy(sAnoMesAtual,1,4)+'/13') and
                 (qryHstNovoBenef.fieldbyname('MES').AsString = sAnoMesPagamento) and
                 (qryHstNovoBenef.fieldbyname('IdBeneficio').AsInteger = qryBeneficio.FieldByName('IdBeneficio').AsInteger) and
                 //(qryHstNovoBenef.fieldbyname('NUMEROPROCESSO').AsInteger = iNumeroProcesso) then
                 (qryHstNovoBenef.fieldbyname('NUMEROPROCESSO').AsInteger = iNumeroProcessoNovo) then

             begin
                qryHstNovoBenef.delete;
                continue;
             end;

             qryHstNovoBenef.next;
          end;

          rValorAbono := ExecutaRegraValorAbono(qryAux,iIdRegraAbono, iIdPessJur,
                                                iIdPlanoPrev, iIdTitular, iSeqProposta,
                                                qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                                qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                sDataInicio,
                                                sDataFinal, sAnoMesAtual,
                                                dNovoValorRateado,
                                                qryBeneficio.FieldByName('FLGPROVISORIO').AsString,
                                                bErro, sMsgErro, iIdCalculo, 5, iNumBenef );

          rValorAbono := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorAbono)));
          //CmDebugToFile('  ExecutaRegraValorAbono no mes '+sAnoMesAtual +' rValorAbono '+FloatToStr(rValorAbono) ,'C:\debug desdobramento.txt');

          if sNovoValorRateadoBS <> '' then   // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
          begin

             rVlrCalculado := ExecutaRegraValorAbono(qryAux,iIdRegraAbono, iIdPessJur,
                                                     iIdPlanoPrev, iIdTitular, iSeqProposta,
                                                     qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                                     qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                     sDataInicio,
                                                     sDataFinal, sAnoMesAtual,
                                                     StrToFloat(sNovoValorRateadoBS),
                                                     qryBeneficio.FieldByName('FLGPROVISORIO').AsString,
                                                     bErro, sMsgErro, iIdCalculo, 5, iNumBenef );

             sValorAbonoBS := FloatToStr(rVlrCalculado);
          end;

          if sNovoValorRateadoFAB <> '' then
          begin
             rVlrCalculado := ExecutaRegraValorAbono(qryAux,iIdRegraAbono, iIdPessJur,
                                                     iIdPlanoPrev, iIdTitular, iSeqProposta,
                                                     qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                                     qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                     sDataInicio,
                                                     sDataFinal, sAnoMesAtual,
                                                     StrToFloat(sNovoValorRateadoFAB),
                                                     qryBeneficio.FieldByName('FLGPROVISORIO').AsString,
                                                     bErro, sMsgErro, iIdCalculo, 5, iNumBenef );

             sValorAbonoFAB := FloatToStr(rVlrCalculado);
          end;


          if sValorTotalDeficit <> '' then
          begin
             rVlrCalculado := ExecutaRegraValorAbono(qryAux,iIdRegraAbono, iIdPessJur,
                                                     iIdPlanoPrev, iIdTitular, iSeqProposta,
                                                     qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                                     qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                     sDataInicio,
                                                     sDataFinal, sAnoMesAtual,
                                                     StrToFloat(sValorTotalDeficit),
                                                     qryBeneficio.FieldByName('FLGPROVISORIO').AsString,
                                                     bErro, sMsgErro, iIdCalculo, 5, iNumBenef );

             sValorAbonoDeficit := FloatToStr(rVlrCalculado);
          end;
          // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

          { Só incluir abono caso tenha valor }
          If rValorAbono > 0 Then Begin

            Inc(iSeqBeneficio13);

            Try
            { Inicio Inserir Abono }
            //CmDebugToFile('  Inicio Inserir Abono' ,'C:\debug desdobramento.txt');
            qryHstNovoBenef.Insert;
            qryHstNovoBenef.FieldByName('IDPESSJUR').AsInteger      := iIdPessJur;
            qryHstNovoBenef.FieldByName('IDPLANOORIGEM').AsInteger  := qryBeneficiarioEmUso.FieldByName('IDPLANOPREV').AsInteger;//iIdPlanoOrigem; BRUNO AZEVEDO
            qryHstNovoBenef.FieldByName('IDPLANOPREV').AsInteger    := qryBeneficiarioEmUso.FieldByName('IDPLANOPREV').AsInteger; //iIdPlanoPrev;
            qryHstNovoBenef.FieldByName('IDTITULAR').AsInteger      := iIdTitular;
            qryHstNovoBenef.FieldByName('IDPESSOA').AsInteger       := qryBeneficiarioEmUso.FieldByName('IDPESSOA').AsInteger;
            qryHstNovoBenef.FieldByName('IDBENEFICIO').AsInteger    := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
            qryHstNovoBenef.FieldByName('IDMOTIVO').AsInteger       := 3057; //prmIDMOTIVOFOLHABEN;
            qryHstNovoBenef.FieldByName('MES').AsString             := sAnoMesPagamento;
            qryHstNovoBenef.FieldByName('MESREFERENCIA').AsString   := Copy(sAnoMesAtual,1,4)+'/13';
            //qryHstNovoBenef.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso; //SOL 253577-18114 PPM 1292515 17/02/2016
            qryHstNovoBenef.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcessoNovo; //SOL 253577-18114 PPM 1292515 17/02/2016
            qryHstNovoBenef.FieldByName('SEQBENEFICIO').AsInteger   := iSeqBeneficio13; //SOL 253577-18114 PPM 1292515 17/02/2016
            //qryHstNovoBenef.FieldByName('NOVOVALOR').AsFloat        := rValorAbono;   // SOL 192563 KINTANA 1877175
            qryHstNovoBenef.FieldByName('NOVOVALOR').AsFloat        := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorAbono)));// SOL 192563 KINTANA 1877175
            //CmDebugToFile(' NOVOVALOR '+FloatToStr(rValorAbono) ,'C:\debug desdobramento.txt');
            //qryHstNovoBenef.FieldByName('VALORPREV').AsFloat        := rValorAbono;  // SOL 192563 KINTANA 1877175
            qryHstNovoBenef.FieldByName('VALORPREV').AsFloat        := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorAbono)));  // SOL 192563 KINTANA 1877175
            //CmDebugToFile(' VALORPREV '+FloatToStr(rValorAbono) ,'C:\debug desdobramento.txt');
            //qryHstNovoBenef.FieldByName('VALORINTEGRAL').AsFloat    := dNovoValorRateado;  // SOL 192563 KINTANA 1877175
            qryHstNovoBenef.FieldByName('VALORINTEGRAL').AsFloat    := StrToFloat(ClienteNumero(FormatFloat('#0.00',dNovoValorRateado)));  // SOL 192563 KINTANA 1877175
            //CmDebugToFile(' VALORINTEGRAL '+FloatToStr(dNovoValorRateado) ,'C:\debug desdobramento.txt');
            //qryHstNovoBenef.FieldByName('VALORTOTAL').AsFloat       := rValorTotalAnt; // SOL 192563 KINTANA 1877175
            qryHstNovoBenef.FieldByName('VALORTOTAL').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorTotalAnt)));  // SOL 192563 KINTANA 1877175
            //CmDebugToFile(' VALORTOTAL '+FloatToStr(rValorTotalAnt) ,'C:\debug desdobramento.txt');
            qryHstNovoBenef.FieldByName('PERCENTUAL').AsFloat       := qryBeneficiarioEmUso.FieldByName('PERCENTUAL').AsFloat;

            qryHstNovoBenef.FieldByName('IDPERFILINVEST').AsString  := qryBeneficiarios.FieldByName('IDPERFILINVEST').AsString;   //edilaine - SIG55933

            qryHstNovoBenef.FieldByName('NOME').AsString            := qryBeneficiarioEmUso.FieldByName('Nome').AsString;
            qryHstNovoBenef.FieldByName('FLGCONCESSAO').AsInteger   := 1;
            qryHstNovoBenef.FieldByName('FLGNOVOBENEF').AsInteger   := 1;
            qryHstNovoBenef.FieldByName('DESCRICAO').AsString       := 'Novo Benef.';
//            qryHstNovoBenef.FieldByName('FLGENVIADO').AsInteger     := 0;
///douglas.siqueira SOL 171026 KITANTA 1528962
           if sFontePagadora = '2' then
              begin
              if _sFlgPagaInss = '1' then
                  qryHstNovoBenef.FieldByName('FLGENVIADO').AsInteger     := 0
              else
                  qryHstNovoBenef.FieldByName('FLGENVIADO').AsInteger     := 8;
              end
            else
            begin // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
              qryHstNovoBenef.FieldByName('FLGENVIADO').AsInteger     := 0;

              if bApresentaBSFAB then
              begin
                 qryHstNovoBenef.FieldByName('VALORBS').AsString  := sValorAbonoBS;
                 qryHstNovoBenef.FieldByName('VALORFAB').AsString := sValorAbonoFAB;
              end
              else
              begin
                 qryHstNovoBenef.FieldByName('VALORBS').Clear;
                 qryHstNovoBenef.FieldByName('VALORFAB').Clear;
              end;

              if  bApresentaDeficit then
                 qryHstNovoBenef.FieldByName('VLRBASEDEFICIT').AsString := sValorAbonoDeficit
              else
                 qryHstNovoBenef.FieldByName('VLRBASEDEFICIT').Clear;

            end;  // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

///douglas.siqueira SOL 171026 KITANTA 1528962
            qryHstNovoBenef.FieldByName('DATAPAGAMENTO').AsString   := sDataPagamento;   // SOL 192563 KINTANA 1877175
            //qryHstNovoBenef.FieldbyName('VALORCALCULADO').AsFloat   := qryHstNovoBenef.FieldByName('VALORPREV').AsFloat;  // SOL 192563 KINTANA 1877175
            qryHstNovoBenef.FieldbyName('VALORCALCULADO').AsFloat   := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryHstNovoBenef.FieldByName('VALORPREV').AsFloat))); // SOL 192563 KINTANA 1877175
            qryHstNovoBenef.FieldbyName('IDLOTE').AsInteger         := iIdLoteConcessao;
            qryHstNovoBenef.FieldByName('DATAPAGAMENTO').AsString   := sDataPagamento;
//            qryHstNovoBenef.FieldByName('FLGENVIADO').AsInteger     := 0;
            //qryHstNovoBenef.FieldByName('VALOROP1').AsFloat         := rValorBase1;  // SOL 192563 KINTANA 1877175
            qryHstNovoBenef.FieldByName('VALOROP1').AsFloat         := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorBase1)));   // SOL 192563 KINTANA 1877175
            //qryHstNovoBenef.FieldByName('VALOROP2').AsFloat         := rValorBase2;    // SOL 192563 KINTANA 1877175
            qryHstNovoBenef.FieldByName('VALOROP2').AsFloat         := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorBase2)));  // SOL 192563 KINTANA 1877175
            //qryHstNovoBenef.FieldByName('VALOROP3').AsFloat         := rValorBase3;    // SOL 192563 KINTANA 1877175
            qryHstNovoBenef.FieldByName('VALOROP3').AsFloat         := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorBase3))); // SOL 192563 KINTANA 1877175
            qryHstNovoBenef.FieldByName('VALORSRB').AsFloat         := 0;
            qryHstNovoBenef.FieldByName('FLGDEVOLUCAO').AsFloat     := 0;
            qryHstNovoBenef.FieldByName('FLGPROVISORIO').AsFloat    := 0;
            qryHstNovoBenef.FieldByName('FONTEPAGADORA').AsString   := sFontePagadora; // SOL 159974 KINTANA 1327873

            // edilaine - SIG 20745 - inicio
            qryHstNovoBenef.FieldbyName('LOTEORIGINAL').AsInteger    := iIdLoteConcessao;
            {se estiver no mesmo ano de pagamento e o mes for anterior a NOV, é adiantamento, lança 2}
            if (copy(sAnoMesPagamento,1,4) = Copy(sAnoMesAtual,1,4)) and (StrToInt(Copy(sAnoMesAtual,6,2)) < 11) then
               qryHstNovoBenef.FieldbyName('FLGTIPOREGISTRO').AsInteger := 2
            else
               qryHstNovoBenef.FieldbyName('FLGTIPOREGISTRO').AsInteger := 1;
            // edilaine - SIG 20745 - fim

            qryHstNovoBenef.Post;
            { Fim Inserir Abono }
            //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
             Except
              on e:Exception do
              begin
                TratarErro(e.Message);
              end;
             end;
             //Brunno Mattos - KTN 767861 - SOL 132659 Fim
          End;
        end;
        rValorBeneficioNoMes := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorBeneficioNoMes)));

        If rValorBeneficioNoMes = 0 Then Begin
          qryBeneficiarioEmUso.Next;
          Continue;
        End;
       Try

        // Inserir novo beneficio
        qryHstNovoBenef.Insert;

        // Todas as rotinas gravam no campo DATAPAGAMENTO a
        // data do calendário somente o desdobramento que
        // não gravava de forma idêntica às outras rotinas.
        //CmDebugToFile(' Inserir novo beneficio ' ,'C:\debug desdobramento.txt');

        qryHstNovoBenef.FieldByName('IDPESSJUR').AsInteger      := iIdPessJur;
        qryHstNovoBenef.FieldByName('IDPLANOORIGEM').AsInteger  := qryBeneficiarioEmUso.FieldByName('IDPLANOPREV').AsInteger; //iIdPlanoOrigem; BRUNO AZEVEDO
        qryHstNovoBenef.FieldByName('IDPLANOPREV').AsInteger    := qryBeneficiarioEmUso.FieldByName('IDPLANOPREV').AsInteger; //iIdPlanoPrev;
        qryHstNovoBenef.FieldByName('IDTITULAR').AsInteger      := iIdTitular;
        qryHstNovoBenef.FieldByName('IDPESSOA').AsInteger       := qryBeneficiarioEmUso.FieldByName('IDPESSOA').AsInteger;
        qryHstNovoBenef.FieldByName('IDBENEFICIO').AsInteger    := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
        qryHstNovoBenef.FieldByName('IDMOTIVO').AsInteger       := 3057; //prmIDMOTIVOFOLHABEN;
        qryHstNovoBenef.FieldByName('MES').AsString             := sAnoMesPagamento;
        qryHstNovoBenef.FieldByName('MESREFERENCIA').AsString   := sAnoMesAtual;
        //qryHstNovoBenef.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;  //SOL 253577-18114 PPM 1292515 17/02/2016
        qryHstNovoBenef.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcessoNovo; //SOL 253577-18114 PPM 1292515 17/02/2016
        if Copy(sAnoMesAtual,6,2) <> '13' then
        begin
           qryHstNovoBenef.FieldByName('SEQBENEFICIO').AsInteger   := 1; //SOL 253577-18114 PPM 1292515 17/02/2016
        end
        else
        begin
           Inc(iSeqBeneficio13);
           qryHstNovoBenef.FieldByName('SEQBENEFICIO').AsInteger   := iSeqBeneficio13;
        end;
        //BRUNO AZEVEDO SOL 136412/4121
        {if Copy(sAnoMesAtual,6,2) <> '13' then begin
          qryHstNovoBenef.FieldByName('NOVOVALOR').AsFloat   := rValorBeneficioNoMes;
        end else begin
          if (rValorAbono > 0) then begin
            qryHstNovoBenef.FieldByName('NOVOVALOR').AsFloat   := rValorAbono;
          end else begin
            qryHstNovoBenef.FieldByName('NOVOVALOR').AsFloat   := rValorBeneficioNoMes;
          end;
        end;}

        if Copy(sAnoMesAtual,6,2) = '13'
        then begin//qryHstNovoBenef.FieldByName('NOVOVALOR').AsFloat   := rValorAbono  // SOL 192563 KINTANA 1877175
             qryHstNovoBenef.FieldByName('NOVOVALOR').AsFloat   :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorAbono)));    // SOL 192563 KINTANA 1877175
             //CmDebugToFile(' NOVOVALOR '+FloatToStr(rValorAbono) ,'C:\debug desdobramento.txt');
        end
        else begin //qryHstNovoBenef.FieldByName('NOVOVALOR').AsFloat   := rValorBeneficioNoMes;  // SOL 192563 KINTANA 1877175
             qryHstNovoBenef.FieldByName('NOVOVALOR').AsFloat   :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorBeneficioNoMes)));   // SOL 192563 KINTANA 1877175
           //CmDebugToFile(' NOVOVALOR '+FloatToStr(rValorBeneficioNoMes) ,'C:\debug desdobramento.txt');
        end;
        //qryHstNovoBenef.FieldByName('VALORPREV').AsFloat        := qryHstNovoBenef.FieldByName('NOVOVALOR').AsFloat; // SOL 192563 KINTANA 1877175
        qryHstNovoBenef.FieldByName('VALORPREV').AsFloat        :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',qryHstNovoBenef.FieldByName('NOVOVALOR').AsFloat))); // SOL 192563 KINTANA 1877175
        //CmDebugToFile(' VALORPREV '+FloatToStr(qryHstNovoBenef.FieldByName('NOVOVALOR').AsFloat) ,'C:\debug desdobramento.txt');
        //qryHstNovoBenef.FieldByName('VALORINTEGRAL').AsFloat    := dNovoValorRateado;      // SOL 192563 KINTANA 1877175
        qryHstNovoBenef.FieldByName('VALORINTEGRAL').AsFloat    := StrToFloat(ClienteNumero(FormatFloat('#0.00',dNovoValorRateado)));   // SOL 192563 KINTANA 1877175
        //CmDebugToFile(' VALORINTEGRAL '+FloatToStr(dNovoValorRateado) ,'C:\debug desdobramento.txt');
        //qryHstNovoBenef.FieldByName('VALORTOTAL').AsFloat       := rValorTotalAnt;  // SOL 192563 KINTANA 1877175
        qryHstNovoBenef.FieldByName('VALORTOTAL').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorTotalAnt))); // SOL 192563 KINTANA 1877175
        //CmDebugToFile(' VALORTOTAL '+FloatToStr(rValorTotalAnt) ,'C:\debug desdobramento.txt');
        qryHstNovoBenef.FieldByName('PERCENTUAL').AsFloat       := qryBeneficiarioEmUso.FieldByName('PERCENTUAL').AsFloat;
        qryHstNovoBenef.FieldByName('NOME').AsString            := qryBeneficiarioEmUso.FieldByName('Nome').AsString;
        qryHstNovoBenef.FieldByName('FLGCONCESSAO').AsInteger   := 1;
        qryHstNovoBenef.FieldByName('FLGNOVOBENEF').AsInteger   := 1;
        qryHstNovoBenef.FieldByName('DESCRICAO').AsString       := 'Novo Benef.';
//        qryHstNovoBenef.FieldByName('FLGENVIADO').AsInteger     := 0;

///douglas.siqueira SOL 171026 KITANTA 1528962

        if sFontePagadora = '2' then
           begin
           if _sFlgPagaInss = '1' then
             qryHstNovoBenef.FieldByName('FLGENVIADO').AsInteger     := 0
           else
             qryHstNovoBenef.FieldByName('FLGENVIADO').AsInteger     := 8;
           end
        else
        begin
           qryHstNovoBenef.FieldByName('FLGENVIADO').AsInteger     := 0;
           // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
           if bApresentaBSFAB then
           begin
              qryHstNovoBenef.FieldByName('VALORBS').AsString  := sValorNoMesBS;
              qryHstNovoBenef.FieldByName('VALORFAB').AsString := sValorNoMesFAB;
           end
           else
           begin
              qryHstNovoBenef.FieldByName('VALORBS').Clear;
              qryHstNovoBenef.FieldByName('VALORFAB').Clear;
           end;

           if  bApresentaDeficit then
              qryHstNovoBenef.FieldByName('VLRBASEDEFICIT').AsString := ClienteNumero(sValorNoMesDeficit)
           else
              qryHstNovoBenef.FieldByName('VLRBASEDEFICIT').Clear;
           // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim
        end;
///douglas.siqueira SOL 171026 KITANTA 1528962
        qryHstNovoBenef.FieldByName('DATAPAGAMENTO').AsString   := sDataPagamento;
        //qryHstNovoBenef.FieldbyName('VALORCALCULADO').AsFloat   := qryHstNovoBenef.FieldByName('VALORPREV').AsFloat;  // SOL 192563 KINTANA 1877175
        qryHstNovoBenef.FieldbyName('VALORCALCULADO').AsFloat   :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',qryHstNovoBenef.FieldByName('VALORPREV').AsFloat))); // SOL 192563 KINTANA 1877175
        //CmDebugToFile(' VALORCALCULADO '+FloatToStr(qryHstNovoBenef.FieldbyName('VALORCALCULADO').AsFloat) ,'C:\debug desdobramento.txt');
        qryHstNovoBenef.FieldbyName('IDLOTE').AsInteger         := iIdLoteConcessao;
        //qryHstNovoBenef.FieldByName('VALOROP1').AsFloat         := rValorBase1;     // SOL 192563 KINTANA 1877175
        qryHstNovoBenef.FieldByName('VALOROP1').AsFloat         := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorBase1))); // SOL 192563 KINTANA 1877175
        //qryHstNovoBenef.FieldByName('VALOROP2').AsFloat         := rValorBase2;   // SOL 192563 KINTANA 1877175
        qryHstNovoBenef.FieldByName('VALOROP2').AsFloat         := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorBase2)));   // SOL 192563 KINTANA 1877175
        //qryHstNovoBenef.FieldByName('VALOROP3').AsFloat         := rValorBase3;  // SOL 192563 KINTANA 1877175
        qryHstNovoBenef.FieldByName('VALOROP3').AsFloat         := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorBase3))); // SOL 192563 KINTANA 1877175
        qryHstNovoBenef.FieldByName('VALORSRB').AsFloat         := 0;
        qryHstNovoBenef.FieldByName('FLGDEVOLUCAO').AsFloat     := 0;
        qryHstNovoBenef.FieldByName('FLGPROVISORIO').AsFloat    := 0;
        qryHstNovoBenef.FieldByName('FONTEPAGADORA').AsString   := sFontePagadora; // SOL 159974 KINTANA 1327873

        qryHstNovoBenef.FieldbyName('LOTEORIGINAL').AsInteger    := iIdLoteConcessao;       // edilaine - SIG 20745 - inicio
        qryHstNovoBenef.FieldByName('IDPERFILINVEST').AsString   := qryBeneficiarios.FieldByName('IDPERFILINVEST').AsString;   //edilaine - SIG55933

        qryHstNovoBenef.Post;
        //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
       Except
        on e:Exception do
        begin
          TratarErro(e.Message);
        end;
       end;
       //Brunno Mattos - KTN 767861 - SOL 132659 Fim

        if not qryBenefINSS.IsEmpty
        then begin
           Try
           // Inserir novo beneficio
           //CmDebugToFile('  Inserir novo beneficio ' ,'C:\debug desdobramento.txt');

           qryHstNovoINSS.Insert;
           qryHstNovoINSS.FieldByName('IDPESSJUR').AsInteger      := iIdPessJur;
           qryHstNovoINSS.FieldByName('IDPLANOORIGEM').AsInteger  := iIdPlanoPrev;//iIdPlanoOrigem; BRUNO AZEVEDO
           qryHstNovoINSS.FieldByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
           qryHstNovoINSS.FieldByName('IDTITULAR').AsInteger      := iIdTitular;
           qryHstNovoINSS.FieldByName('IDPESSOA').AsInteger       := qryBeneficiarioEmUso.FieldByName('IDPESSOA').AsInteger;
           qryHstNovoINSS.FieldByName('IDBENEFICIO').AsInteger    := qryBenefINSS.FieldByName('IdBeneficio').AsInteger;
           qryHstNovoINSS.FieldByName('IDMOTIVO').AsInteger       := 3057; //prmIDMOTIVOFOLHABEN;
           qryHstNovoINSS.FieldByName('MES').AsString             := sAnoMesPagamento;
           qryHstNovoINSS.FieldByName('MESREFERENCIA').AsString   := sAnoMesAtual;
           //qryHstNovoINSS.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;  //SOL 253577-18114 PPM 1292515 17/02/2016
           qryHstNovoINSS.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcessoNovo; //SOL 253577-18114 PPM 1292515 17/02/2016

           qryHstNovoINSS.FieldByName('IDPERFILINVEST').AsString  := qryBenefINSS.FieldByName('IDPERFILINVEST').AsString;   //edilaine - SIG55933

           if Copy(sAnoMesAtual,6,2) = '13'
           then //qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat   := StrToFloat(ClienteNumero(sVlrInfINSS))   // SOL 192563 KINTANA 1877175
           begin
                qryHstNovoINSS.FieldByName('SEQBENEFICIO').AsInteger   := iSeqBeneficio; //SOL 253577-18114 PPM 1292515 17/02/2016
                qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat   :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',StrToFloat(sVlrInfINSS))));   // SOL 192563 KINTANA 1877175
                //CmDebugToFile(' NOVOVALOR '+sVlrInfINSS ,'C:\debug desdobramento.txt');
           end
           else //qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat   := StrToFloat(ClienteNumero(sVlrInfINSS));  // SOL 192563 KINTANA 1877175
           begin
                qryHstNovoINSS.FieldByName('SEQBENEFICIO').AsInteger   := 1;
                qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat   :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',StrToFloat(sVlrInfINSS)))); // SOL 192563 KINTANA 1877175
                //CmDebugToFile(' NOVOVALOR '+sVlrInfINSS ,'C:\debug desdobramento.txt');
           end;
           //qryHstNovoINSS.FieldByName('VALORPREV').AsFloat        := qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat;  // SOL 192563 KINTANA 1877175
           qryHstNovoINSS.FieldByName('VALORPREV').AsFloat        :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat))); // SOL 192563 KINTANA 1877175
           //CmDebugToFile(' NOVOVALOR '+qryHstNovoINSS.FieldByName('NOVOVALOR').AsString ,'C:\debug desdobramento.txt');
           qryHstNovoINSS.FieldByName('NOME').AsString            := qryBeneficiarioEmUso.FieldByName('Nome').AsString;
           qryHstNovoINSS.FieldByName('FLGCONCESSAO').AsInteger   := 1;
           qryHstNovoINSS.FieldByName('FLGNOVOBENEF').AsInteger   := 1;
           qryHstNovoINSS.FieldByName('DESCRICAO').AsString       := 'Novo Benef.';
///douglas.siqueira SOL 171026 KITANTA 1528962
        if sFontePagadora = '2' then
           begin
           if _sFlgPagaInss = '1' then
             qryHstNovoINSS.FieldByName('FLGENVIADO').AsInteger     := 0
           else
             qryHstNovoINSS.FieldByName('FLGENVIADO').AsInteger     := 8;
           end
        else
           qryHstNovoINSS.FieldByName('FLGENVIADO').AsInteger     := 0;

///douglas.siqueira SOL 171026 KITANTA 1528962
           qryHstNovoINSS.FieldByName('DATAPAGAMENTO').AsString   := sDataPagamento;
           //qryHstNovoINSS.FieldByName('VALOROP1').AsFloat         := rValorBase1;  // SOL 192563 KINTANA 1877175
           qryHstNovoINSS.FieldByName('VALOROP1').AsFloat         := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorBase1)));  // SOL 192563 KINTANA 1877175
           //qryHstNovoINSS.FieldByName('VALOROP2').AsFloat         := rValorBase2;   // SOL 192563 KINTANA 1877175
           qryHstNovoINSS.FieldByName('VALOROP2').AsFloat         := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorBase2)));  // SOL 192563 KINTANA 1877175
           //qryHstNovoINSS.FieldByName('VALOROP3').AsFloat         := rValorBase3; // SOL 192563 KINTANA 1877175
           qryHstNovoINSS.FieldByName('VALOROP3').AsFloat         := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorBase3))); // SOL 192563 KINTANA 1877175
           qryHstNovoINSS.FieldByName('VALORSRB').AsFloat         := 0;
           qryHstNovoINSS.FieldByName('FONTEPAGADORA').AsString   := sFontePagadora; // SOL 159974 KINTANA 1327873
           qryHstNovoINSS.Post;
           //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
           Except
            on e:Exception do
            begin
              TratarErro(e.Message);
            end;
           end;
           //Brunno Mattos - KTN 767861 - SOL 132659 Fim
        end;
        
        qryBeneficiarioEmUso.Next;
     end; // while qryBeneficiarioEmUso
     {-------------------------------------------------------------------------}

     {-------------------------------------------------------------------------}
     { Para cada um dos beneficiários já EXISTENTES fazer :                    }
     // Se for o primeiro mes do novo beneficiario
     // Entao
     //    1. executar pro-rata do ultimo valor sobre o valor integral(rateado) que já estava vigente
     //    2. executar rateio sobre novo valor total ( que pode ser diferente para cada beneficiario )
     //    3. executar pro-rata de primeiro valor sobre o novo valor integral (rateado)
     // Se o benefício estava preparado ( mas não pago) no mês em questão
     // Então alterar o valor dele no histórico
     // Senao ( o benefício já foi pago ) pedir devolução do que foi pago a mais
     qryBeneficiarios.DisableControls;
     qryBeneficiarios.First;
     while not qryBeneficiarios.Eof do { TRATA BENEFICIARIOS ANTIGOS }
     begin

        If qryBeneficiarios.FieldByName('FLGPROCESSA').AsInteger = 0 Then Begin
           qryBeneficiarios.Next;
          Continue;
        End;

        { Busca valor atual do INSS, pode ter sido reajustado }
        sVlrInfINSS := CalcBeneficioINSSAtual( iIdPessJur,
                                               iIdPlanoPrev,
                                               iIdTitular,
                                               qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                               sAnoMesAtual,
                                               sAnoMesAtual,
                                               sIdTpPagtoAnt,
                                               sFlgBenefMinimo,
                                               qryAux,
                                               iNumeroProcessoINSS );
        //CmDebugToFile(' CalcBeneficioINSSAtual '+sVlrInfINSS ,'C:\debug desdobramento.txt');
        sVlrCalcInss    := sVlrInfINSS;

        rValorIntegralAntigo   := 0; // valor rateado por beneficiarios sem pro-rata dias antes do novo beneficiario
        rValorParcialUltimo    := 0; // valor rateado por beneficiarios com pro-rata dias antes do novo beneficiario
        rValorParcialPrimeiro  := 0;
        rValorFinalBfciario    := 0;
        rValorIntegralBfciario := 0;
        sValorIntegralBfciarioBS      := '';                 // fernando xavier - SOL 253577-17664 / PPM 1019932
        sValorIntegralBfciarioFAB     := '';                 // fernando xavier - SOL 253577-17664 / PPM 1019932
        sValorIntegralBfciarioDeficit := '';                 // fernando xavier - SOL 253577-17664 / PPM 1019932


        sAnoMesInicioAntigos := Copy(qryBeneficiarios.FieldByName('DATAINICIO').AsString,7,4) + '/' +
                                Copy(qryBeneficiarios.FieldByName('DATAINICIO').AsString,4,2);
        if (sAnoMesAtual = sAnoMesInicioAntigos) And
           ( sFlgFrequencia = 'I' )
        then begin // é o primeiro pagamento
           // Ler valor integral do beneficiario antes de ter o novo beneficiario
           rValorIntegralAntigo := PegaValorIntegral( qryAux,
                                                      iNumeroProcesso,
                                                      qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                      qryBeneficiarioEmUso.FieldByName('IDPESSOA').AsInteger,
                                                      qryBeneficiarios.FieldByName('DATAINICIO').AsString
                                                      );
           //CmDebugToFile(' PegaValorIntegral '+FloattoStr(rValorIntegralAntigo) ,'C:\debug desdobramento.txt');

            //edilaine - SIG94608 - inicio
            sValorIntegralAntigoBS      := sValorTotalBSAnt;
            sValorIntegralAntigoFAB     := sValorTotalFABAnt;
            sValorIntegralAntigoDeficit := sValorTotalDeficitAnt;
            //edilaine - SIG94608 - fim

           // 1. executar pro-rata do ULTIMO valor sobre o valor integral(rateado) que já estava vigente
           //    passando como data final a data de inicio do beneficio do novo beneficiario
           sData := Copy(sDtInicioFund,1,2) + '/'+Copy(sAnoMesAtual,6,2) + '/' + Copy(sAnoMesAtual,1,4);

           If (Copy(sData,1,2) = '31') And (Pos(Copy(sData,4,2), '04060911') <> 0) Then Begin
             sData := '30'+Copy(sData,3,9)
           End;
           If (Copy(sData,4,2) = '02') And (Copy(sData,1,2) > '28') Then Begin
             sData := '28'+Copy(sData,3,9)
           End;

           { Somente quando ano/mes processado = ANO/MES FINAL do BENEFICIO }
           if (sAnoMesAtual = sAnoMesDataFinal)
              And ( sFlgFrequencia = 'I' )
           Then begin
              rValorParcialUltimo := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                                    qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                                                    iIdTitular,
                                                                    qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                                    iSeqProposta,
                                                                    iIdPessJur, iIdPlanoPrev,
                                                                    qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                    iNumBenefAntes,
                                                                    qryBeneficiarios.FieldByName('DataInicio').AsString,
                                                                    sData,
                                                                    '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                                                    OraNumero(FloatToStr(rValorIntegralAntigo)),
                                                                    ' Último ',
                                                                    bErro,
                                                                    sMsgErro, iIdCalculo);

              if bErro
              then begin
                 frmAguarde.Apaga;
                 MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                 rValorParcialUltimo  := 0;
                 Exit;
              end;
              //CmDebugToFile(' ExecutaRegraPrimUltPagtoBenef  Último '+FloattoStr(rValorParcialUltimo) ,'C:\debug desdobramento.txt');
              if sValorTotalBSAnt <> '' then  // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
              begin

                 rVlrCalculado := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                                 qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                                                 iIdTitular,
                                                                 qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                                 iSeqProposta,
                                                                 iIdPessJur, iIdPlanoPrev,
                                                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                 iNumBenefAntes,
                                                                 qryBeneficiarios.FieldByName('DataInicio').AsString,
                                                                 sData,
                                                                 '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                                                 sValorTotalBSAnt,
                                                                 ' Último ',
                                                                 bErro,
                                                                 sMsgErro, iIdCalculo);

                 if bErro
                 then begin
                    frmAguarde.Apaga;
                    MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                    sValorParcialUltimoBS  := '';
                    Exit;
                 end;
                 sValorParcialUltimoBS := FloatToStr(rVlrCalculado);
              end;

              if sValorTotalFABAnt <> '' then
              begin

                 rVlrCalculado := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                                 qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                                                 iIdTitular,
                                                                 qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                                 iSeqProposta,
                                                                 iIdPessJur, iIdPlanoPrev,
                                                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                 iNumBenefAntes,
                                                                 qryBeneficiarios.FieldByName('DataInicio').AsString,
                                                                 sData,
                                                                 '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                                                 sValorTotalFABAnt,
                                                                 ' Último ',
                                                                 bErro,
                                                                 sMsgErro, iIdCalculo);

                 if bErro
                 then begin
                    frmAguarde.Apaga;
                    MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                    sValorParcialUltimoFAB := '';
                    Exit;
                 end;
                 sValorParcialUltimoFAB := FloatToStr(rVlrCalculado);
              end;


              if sValorTotalDeficitAnt <> '' then
              begin

                 rVlrCalculado := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                                 qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                                                 iIdTitular,
                                                                 qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                                 iSeqProposta,
                                                                 iIdPessJur, iIdPlanoPrev,
                                                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                 iNumBenefAntes,
                                                                 qryBeneficiarios.FieldByName('DataInicio').AsString,
                                                                 sData,
                                                                 '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                                                 sValorTotalDeficitAnt,
                                                                 ' Último ',
                                                                 bErro,
                                                                 sMsgErro, iIdCalculo);

                 if bErro
                 then begin
                    frmAguarde.Apaga;
                    MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                    sValorParcialUltimoDeficit := '';
                    Exit;
                 end;
                 sValorParcialUltimoDeficit := FloatToStr(rVlrCalculado);
              end;  // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim


           end;



           // 2. executar rateio sobre novo valor total ( que pode ser diferente para cada beneficiario )
           try
              rValorParcialPrimeiro := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                  qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                                                  -1,
                                                  iIdPessJur,
                                                  iIdPlanoOrigem,
                                                  iIdTitular,
                                                  iSeqProposta,
                                                  qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                  iNumeroProcesso,
                                                  iNumBenef,
                                                  0,0,0,
                                                  sSQLBenefAssoc,
                                                  dbedDtEvento.Text,
                                                  sDtInicioFund,
                                                  sDtInicioINSS,
                                                  OraNumero(FloatToStr(rValorTotal)),
                                                  sVlrCalcINSS,
                                                  sVlrInfINSS,
                                                  '0',
                                                  bErro,
                                                  sMsgErro,
                                                  iIdCalculo,
                                                  qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                  qryBeneficiarios.FieldByName('IdDependencia').AsString,
                                                  qryBeneficiarios.FieldByName('Percentual').AsString,2,
                                                  '','',
                                                  sAnoMesAtual);


           except
              frmAguarde.Apaga;
              MsgDlg('Erro na Regra de Cálculo - Nº '+qryBeneficio.FieldByName('IdRegraCalculo').AsString,'Erro',mtError,[mbOk,mbHelp],0);
              rValorParcialPrimeiro := 0;

              Exit;
           end;
           //CmDebugToFile(' ExecutaRegraCalculoBeneficioBfciario  executar rateio sobre novo valor total ( que pode ser diferente para cada beneficiario ) '+FloattoStr(rValorParcialPrimeiro) ,'C:\debug desdobramento.txt');
           if bErro
           then begin
             frmAguarde.Apaga;
             MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
             rValorParcialPrimeiro  := 0;
             Exit;
           end;


           if sValorTotalBS <> '' then  // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
           begin

              try
                 rVlrCalculado := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                     qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                                                     -1,
                                                     iIdPessJur,
                                                     iIdPlanoOrigem,
                                                     iIdTitular,
                                                     iSeqProposta,
                                                     qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                     iNumeroProcesso,
                                                     iNumBenef,
                                                     0,0,0,
                                                     sSQLBenefAssoc,
                                                     dbedDtEvento.Text,
                                                     sDtInicioFund,
                                                     sDtInicioINSS,
                                                     sValorTotalBS,
                                                     sVlrCalcINSS,
                                                     sVlrInfINSS,
                                                     '0',
                                                     bErro,
                                                     sMsgErro,
                                                     iIdCalculo,
                                                     qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                     qryBeneficiarios.FieldByName('IdDependencia').AsString,
                                                     qryBeneficiarios.FieldByName('Percentual').AsString,2,
                                                     '','',
                                                     sAnoMesAtual);


              except
                 frmAguarde.Apaga;
                 MsgDlg('Erro na Regra de Cálculo - Nº '+qryBeneficio.FieldByName('IdRegraCalculo').AsString,'Erro',mtError,[mbOk,mbHelp],0);
                 sValorParcialPrimeiroBS := '';
                 Exit;
              end;

              if bErro
              then begin
                frmAguarde.Apaga;
                MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                sValorParcialPrimeiroBS  := '';
                Exit;
              end;
              sValorParcialPrimeiroBS := FloatToStr(rVlrCalculado);
           end;


           if sValorTotalFAB <> '' then
           begin

              try
                 rVlrCalculado := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                     qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                                                     -1,
                                                     iIdPessJur,
                                                     iIdPlanoOrigem,
                                                     iIdTitular,
                                                     iSeqProposta,
                                                     qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                     iNumeroProcesso,
                                                     iNumBenef,
                                                     0,0,0,
                                                     sSQLBenefAssoc,
                                                     dbedDtEvento.Text,
                                                     sDtInicioFund,
                                                     sDtInicioINSS,
                                                     sValorTotalFAB,
                                                     sVlrCalcINSS,
                                                     sVlrInfINSS,
                                                     '0',
                                                     bErro,
                                                     sMsgErro,
                                                     iIdCalculo,
                                                     qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                     qryBeneficiarios.FieldByName('IdDependencia').AsString,
                                                     qryBeneficiarios.FieldByName('Percentual').AsString,2,
                                                     '','',
                                                     sAnoMesAtual);


              except
                 frmAguarde.Apaga;
                 MsgDlg('Erro na Regra de Cálculo - Nº '+qryBeneficio.FieldByName('IdRegraCalculo').AsString,'Erro',mtError,[mbOk,mbHelp],0);
                 sValorParcialPrimeiroFAB := '';
                 Exit;
              end;

              if bErro
              then begin
                frmAguarde.Apaga;
                MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                sValorParcialPrimeiroFAB  := '';
                Exit;
              end;
              sValorParcialPrimeiroFAB := FloatToStr(rVlrCalculado);
           end;
           // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

           // Guardar novo valor rateado integral
           rValorIntegralBfciario        := rValorParcialPrimeiro;
           sValorIntegralBfciarioBS      := sValorParcialPrimeiroBS;                      // fernando xavier - SOL 253577-17664 / PPM 1019932
           sValorIntegralBfciarioFAB     := sValorParcialPrimeiroFAB;                     // fernando xavier - SOL 253577-17664 / PPM 1019932
           sValorIntegralBfciarioDeficit := sValorTotalDeficit;                           // fernando xavier - SOL 253577-17664 / PPM 1019932

           // 3. executar pro-rata de PRIMEIRO valor sobre o novo valor integral (rateado)
           sData                 := qryBeneficiarios.FieldByName('DATAINICIO').AsString;
           rValorParcialPrimeiro := ExecutaRegraPrimUltPagtoBenef(qryAux,
                                      qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
                                      iIdTitular,
                                      qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                      iSeqProposta,
                                      iIdPessJur,
                                      iIdPlanoOrigem,
                                      qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                      iNumBenef,
                                      sData,
                                      '',
                                      '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                      OraNumero(FloatToStr(rValorParcialPrimeiro)),
                                      ' Primeiro ',
                                      bErro,
                                      sMsgErro, iIdCalculo,
                                      false);//Marcio Sanches Spinosa SOL 182092/14207 15207 15253 KITANTA 1969056

           if bErro
           then begin
              frmAguarde.Apaga;
              MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
              rValorParcialPrimeiro  := 0;
              Exit;
           end;
           //CmDebugToFile(' ExecutaRegraPrimUltPagtoBenef  executar pro-rata de PRIMEIRO valor sobre o novo valor integral (rateado) '+FloattoStr(rValorParcialPrimeiro) ,'C:\debug desdobramento.txt');
           rValorFinalBfciario := rValorParcialUltimo + rValorParcialPrimeiro;

           if  sValorParcialPrimeiroBS <> '' then  // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
           begin

              rVlrCalculado := ExecutaRegraPrimUltPagtoBenef(qryAux,
                                         qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
                                         iIdTitular,
                                         qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                         iSeqProposta,
                                         iIdPessJur,
                                         iIdPlanoOrigem,
                                         qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                         iNumBenef,
                                         sData,
                                         '',
                                         '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                         sValorParcialPrimeiroBS,
                                         ' Primeiro ',
                                         bErro,
                                         sMsgErro, iIdCalculo,
                                         false);//Marcio Sanches Spinosa SOL 182092/14207 15207 15253 KITANTA 1969056

              if bErro
              then begin
                 frmAguarde.Apaga;
                 MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                 sValorParcialPrimeiroBS := '';
                 Exit;
              end;
              sValorParcialPrimeiroBS := FloatToStr(rVlrCalculado);

              rVlrCalculado := StrToFloat(iif(sValorParcialUltimoBS = '', '0', sValorParcialUltimoBS)) +
                               StrToFloat(iif(sValorParcialPrimeiroBS = '', '0', sValorParcialPrimeiroBS));
              sValorFinalBfciarioBS   := FloatToStr( rVlrCalculado );
           end;

           if  sValorParcialPrimeiroFAB <> '' then
           begin

              rVlrCalculado := ExecutaRegraPrimUltPagtoBenef(qryAux,
                                         qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
                                         iIdTitular,
                                         qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                         iSeqProposta,
                                         iIdPessJur,
                                         iIdPlanoOrigem,
                                         qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                         iNumBenef,
                                         sData,
                                         '',
                                         '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                         sValorParcialPrimeiroFAB,
                                         ' Primeiro ',
                                         bErro,
                                         sMsgErro, iIdCalculo,
                                         false);//Marcio Sanches Spinosa SOL 182092/14207 15207 15253 KITANTA 1969056

              if bErro
              then begin
                 frmAguarde.Apaga;
                 MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                 sValorParcialPrimeiroFAB  := '';
                 Exit;
              end;
              sValorParcialPrimeiroFAB := FloatToStr(rVlrCalculado);

              rVlrCalculado := StrToFloat(iif(sValorParcialUltimoFAB = '', '0', sValorParcialUltimoFAB)) +
                               StrToFloat(iif(sValorParcialPrimeiroFAB = '', '0', sValorParcialPrimeiroFAB));
              sValorFinalBfciarioFAB   := FloatToStr( rVlrCalculado );
           end;

           if  sValorParcialPrimeiroDeficit <> '' then
           begin

              rVlrCalculado := ExecutaRegraPrimUltPagtoBenef(qryAux,
                                         qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
                                         iIdTitular,
                                         qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                         iSeqProposta,
                                         iIdPessJur,
                                         iIdPlanoOrigem,
                                         qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                         iNumBenef,
                                         sData,
                                         '',
                                         '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                         sValorParcialPrimeiroDeficit,
                                         ' Primeiro ',
                                         bErro,
                                         sMsgErro, iIdCalculo,
                                         false);//Marcio Sanches Spinosa SOL 182092/14207 15207 15253 KITANTA 1969056

              if bErro
              then begin
                 frmAguarde.Apaga;
                 MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                 sValorParcialPrimeiroDeficit := '';
                 Exit;
              end;
              sValorFinalBfciarioDeficit := FloatToStr(rVlrCalculado);

           end; // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

        end // se for o primeiro mes do novo beneficiario
        else begin
            { Ler valor integral do beneficiario antes de ter o novo beneficiario }
            //edilaine - SIG85197 - inicio
            rValorIntegralAntigo := PegaValorIntegral( qryAux,
                                                       iNumeroProcesso,
                                                       qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                       qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                                       sDataInicio
                                                     );

            PegaValorTOTALBsFab( qryAux,
                                 qryProcesso.FieldByName('NumeroProcesso').AsInteger,
                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                 qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                 sDataInicio,
                                 sValorTotalBSAnt, sValorTotalFABAnt, sValorTotalDeficitAnt
                                 );
            //edilaine - SIG85197 - fim

           { Executar regra de rateio com novo valor total }
           try
              rValorFinalBfciario := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                  qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                                                  -1,
                                                  iIdPessJur,
                                                  iIdPlanoOrigem,
                                                  iIdTitular,
                                                  iSeqProposta,
                                                  qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                  iNumeroProcesso,
                                                  iNumBenef,
                                                  0,0,0,
                                                  sSQLBenefAssoc,
                                                  dbedDtEvento.Text,
                                                  sDtInicioFund,
                                                  sDtInicioINSS,
                                                  OraNumero(FloatToStr(rValorTotal)),
                                                  sVlrCalcINSS,
                                                  sVlrInfINSS,
                                                  '0',
                                                  bErro,
                                                  sMsgErro,
                                                  iIdCalculo,
                                                  qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                  qryBeneficiarios.FieldByName('IdDependencia').AsString,
                                                  qryBeneficiarios.FieldByName('Percentual').AsString,2,
                                                  '','',
                                                  sAnoMesAtual);

           except
              frmAguarde.Apaga;
              MsgDlg('Erro na Regra de Cálculo - Nº '+qryBeneficio.FieldByName('IdRegraCalculo').AsString,'Erro',mtError,[mbOk,mbHelp],0);
              rValorFinalBfciario := 0;
              Exit;
           end;
           //CmDebugToFile(' ExecutaRegraCalculoBeneficioBfciario  { Executar regra de rateio com novo valor total } '+FloattoStr(rValorFinalBfciario) ,'C:\debug desdobramento.txt');
           if bErro
           then begin
             frmAguarde.Apaga;
             MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
             rValorFinalBfciario  := 0;
             Exit;
          end;
          rValorIntegralBfciario := rValorFinalBfciario;


          if  sValorTotalBS <> '' then  // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
          begin

             try
                 rVlrCalculado := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                     qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                                                     -1,
                                                     iIdPessJur,
                                                     iIdPlanoOrigem,
                                                     iIdTitular,
                                                     iSeqProposta,
                                                     qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                     iNumeroProcesso,
                                                     iNumBenef,
                                                     0,0,0,
                                                     sSQLBenefAssoc,
                                                     dbedDtEvento.Text,
                                                     sDtInicioFund,
                                                     sDtInicioINSS,
                                                     sValorTotalBS,
                                                     sVlrCalcINSS,
                                                     sVlrInfINSS,
                                                     '0',
                                                     bErro,
                                                     sMsgErro,
                                                     iIdCalculo,
                                                     qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                     qryBeneficiarios.FieldByName('IdDependencia').AsString,
                                                     qryBeneficiarios.FieldByName('Percentual').AsString,2,
                                                     '','',
                                                     sAnoMesAtual);

              except
                 frmAguarde.Apaga;
                 MsgDlg('Erro na Regra de Cálculo - Nº '+qryBeneficio.FieldByName('IdRegraCalculo').AsString,'Erro',mtError,[mbOk,mbHelp],0);
                 sValorFinalBfciarioBS := '';
                 Exit;
              end;

              if bErro
              then begin
                frmAguarde.Apaga;
                MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                sValorFinalBfciarioBS  := '';
                Exit;
             end;
             sValorFinalBfciarioBS    := FloatToStr(rVlrCalculado);
             sValorIntegralBfciarioBS := sValorFinalBfciarioBS;
          end;


          if  sValorTotalFAB <> '' then
          begin

             try
                 rVlrCalculado := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                     qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                                                     -1,
                                                     iIdPessJur,
                                                     iIdPlanoOrigem,
                                                     iIdTitular,
                                                     iSeqProposta,
                                                     qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                     iNumeroProcesso,
                                                     iNumBenef,
                                                     0,0,0,
                                                     sSQLBenefAssoc,
                                                     dbedDtEvento.Text,
                                                     sDtInicioFund,
                                                     sDtInicioINSS,
                                                     sValorTotalFAB,
                                                     sVlrCalcINSS,
                                                     sVlrInfINSS,
                                                     '0',
                                                     bErro,
                                                     sMsgErro,
                                                     iIdCalculo,
                                                     qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                     qryBeneficiarios.FieldByName('IdDependencia').AsString,
                                                     qryBeneficiarios.FieldByName('Percentual').AsString,2,
                                                     '','',
                                                     sAnoMesAtual);

              except
                 frmAguarde.Apaga;
                 MsgDlg('Erro na Regra de Cálculo - Nº '+qryBeneficio.FieldByName('IdRegraCalculo').AsString,'Erro',mtError,[mbOk,mbHelp],0);
                 sValorFinalBfciarioFAB := '';
                 Exit;
              end;

              if bErro
              then begin
                frmAguarde.Apaga;
                MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                sValorFinalBfciarioFAB  := '';
                Exit;
             end;
             sValorFinalBfciarioFAB    := FloatToStr(rVlrCalculado);
             sValorIntegralBfciarioFAB := sValorFinalBfciarioFAB;
          end;


          if  sValorTotalDeficit <> '' then
          begin
             sValorFinalBfciarioDeficit    := sValorTotalDeficit;
             sValorIntegralBfciarioDeficit := sValorFinalBfciarioDeficit;
          end;
          // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim


          { Primeiro Pagamento }
          sData := qryBeneficiarios.FieldByName('DATAINICIO').AsString;
          if (sAnoMesAtual = sAnoMesInicio) then begin
            { Ler valor integral do beneficiario antes de ter o novo beneficiario }
            rValorIntegralAntigo := PegaValorIntegral( qryAux,
                                                       iNumeroProcesso,
                                                       qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                       qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                                       sDataInicio
                                                     );
            //CmDebugToFile(' PegaValorIntegral '+FloattoStr(rValorIntegralAntigo) ,'C:\debug desdobramento.txt');

            sValorIntegralAntigoBS      := sValorTotalBSAnt;             // fernando xavier - SOL 253577-17664 / PPM 1019932
            sValorIntegralAntigoFAB     := sValorTotalFABAnt;            // fernando xavier - SOL 253577-17664 / PPM 1019932
            sValorIntegralAntigoDeficit := sValorTotalDeficitAnt;        // fernando xavier - SOL 253577-17664 / PPM 1019932

            If ( Copy(sDataInicio, 0,3) = '01/' ) Then Begin
              rValorParcialUltimo := 0;
            End Else Begin
              { Para calcular o valor do primeiro pagamento do beneficio existente }
              { 1) Encerrar beneficio antigo até a data do beneficio novo }
              rValorParcialUltimo := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                                    qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                                                    iIdTitular,
                                                                    qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                                    iSeqProposta,
                                                                    iIdPessJur, iIdPlanoPrev,
                                                                    qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                    iNumBenefAntes,
                                                                    qryBeneficiarios.FieldByName('DataInicio').AsString,
                                                                    DateToStr(StrToDate(sDataInicio)-1), { Calcular até dia anterior, resto sera calculado desdobrando  }
                                                                    '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                                                    OraNumero(FloatToStr(rValorIntegralAntigo)),
                                                                    ' Último ',
                                                                    bErro,
                                                                    sMsgErro, iIdCalculo);

              if bErro then begin
                 frmAguarde.Apaga;
                 MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                 rValorParcialUltimo  := 0;
                 Exit;
              end;

              // Alterado por FHBS - 29/04/2019 - SIG85197
              //rValorParcialUltimo := 0; // somente para teste confirmar com o luciano pois sempre funcionou assim.
              // Fim - Alterado por FHBS - 29/04/2019 - SIG85197

              //CmDebugToFile(' Encerrar beneficio antigo até a data do beneficio novo } '+FloattoStr(rValorParcialUltimo) ,'C:\debug desdobramento.txt');

              if sValorIntegralAntigoBS <> '' then // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
              begin

                 rVlrCalculado := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                                 qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                                                 iIdTitular,
                                                                 qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                                 iSeqProposta,
                                                                 iIdPessJur, iIdPlanoPrev,
                                                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                 iNumBenefAntes,
                                                                 qryBeneficiarios.FieldByName('DataInicio').AsString,
                                                                 DateToStr(StrToDate(sDataInicio)-1), { Calcular até dia anterior, resto sera calculado desdobrando  }
                                                                 '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                                                 sValorIntegralAntigoBS,
                                                                 ' Último ',
                                                                 bErro,
                                                                 sMsgErro, iIdCalculo);

                 if bErro then begin
                    frmAguarde.Apaga;
                    MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                    sValorParcialUltimoBS  := '';
                    Exit;
                 end;
                 sValorParcialUltimoBS := FloatToStr(rVlrCalculado);
              end;


              if sValorIntegralAntigoFAB  <> '' then
              begin

                 rVlrCalculado := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                                 qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                                                 iIdTitular,
                                                                 qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                                 iSeqProposta,
                                                                 iIdPessJur, iIdPlanoPrev,
                                                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                 iNumBenefAntes,
                                                                 qryBeneficiarios.FieldByName('DataInicio').AsString,
                                                                 DateToStr(StrToDate(sDataInicio)-1), { Calcular até dia anterior, resto sera calculado desdobrando  }
                                                                 '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                                                 sValorIntegralAntigoFAB,
                                                                 ' Último ',
                                                                 bErro,
                                                                 sMsgErro, iIdCalculo);

                 if bErro then begin
                    frmAguarde.Apaga;
                    MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                    sValorParcialUltimoFAB := '';
                    Exit;
                 end;
                 sValorParcialUltimoFAB := FloatToStr(rVlrCalculado);
              end;


              if sValorIntegralAntigoDeficit <> '' then
              begin

                 rVlrCalculado := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                                 qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                                                 iIdTitular,
                                                                 qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                                 iSeqProposta,
                                                                 iIdPessJur, iIdPlanoPrev,
                                                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                 iNumBenefAntes,
                                                                 qryBeneficiarios.FieldByName('DataInicio').AsString,
                                                                 DateToStr(StrToDate(sDataInicio)-1), { Calcular até dia anterior, resto sera calculado desdobrando  }
                                                                 '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                                                 sValorIntegralAntigoDeficit,
                                                                 ' Último ',
                                                                 bErro,
                                                                 sMsgErro, iIdCalculo);

                 if bErro then begin
                    frmAguarde.Apaga;
                    MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                    sValorParcialUltimoDeficit := '';
                    Exit;
                 end;
                 sValorParcialUltimoDeficit := FloatToStr(rVlrCalculado);
              end; // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim


            End;

            { 2) Calcular 1º pgto do beneficio antigo apartir da DIP do beneficio novo }
            rValorParcialPrimeiro := ExecutaRegraPrimUltPagtoBenef(qryAux,
                                       qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
                                       iIdTitular,
                                       qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                       iSeqProposta,
                                       iIdPessJur,
                                       iIdPlanoOrigem,
                                       qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                       iNumBenef,
                                       sDataInicio,
                                       '',
                                       '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                       OraNumero(FloatToStr(rValorIntegralBfciario)),
                                       ' Primeiro ',
                                       bErro,
                                       sMsgErro, iIdCalculo, false); //Marcio Sanches Spinosa SOL 182092/14207 15207 15253 KITANTA 1969056);

            if bErro then begin
               frmAguarde.Apaga;
               MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
               rValorParcialPrimeiro  := 0;
               Exit;
            end;
            //CmDebugToFile(' Calcular 1º pgto do beneficio antigo apartir da DIP do beneficio novo } '+FloattoStr(rValorParcialPrimeiro) ,'C:\debug desdobramento.txt');
            { 3) Somar os dois valores - este é o valor real devido aos beneficiários antigos }
            rValorFinalBfciario := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorParcialPrimeiro+rValorParcialUltimo)));

            if sValorIntegralBfciarioBS <> '' then   // fernando xavier - SOL 253577-17664 / PPM 1019932 -inicio
            begin
               rVlrCalculado := ExecutaRegraPrimUltPagtoBenef(qryAux,
                                          qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
                                          iIdTitular,
                                          qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                          iSeqProposta,
                                          iIdPessJur,
                                          iIdPlanoOrigem,
                                          qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                          iNumBenef,
                                          sDataInicio,
                                          '',
                                          '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                          sValorIntegralBfciarioBS,
                                          ' Primeiro ',
                                          bErro,
                                          sMsgErro, iIdCalculo, false); //Marcio Sanches Spinosa SOL 182092/14207 15207 15253 KITANTA 1969056);

               if bErro then begin
                  frmAguarde.Apaga;
                  MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                  sValorParcialPrimeiroBS  := '';
                  Exit;
               end;
               sValorParcialPrimeiroBS := FloatToStr(rVlrCalculado);

               { 3) Somar os dois valores - este é o valor real devido aos beneficiários antigos }
               sValorParcialPrimeiroBS := FloatToStr(rVlrCalculado);

              rVlrCalculado := StrToFloat(iif(sValorParcialUltimoBS = '', '0', sValorParcialUltimoBS)) +
                               StrToFloat(iif(sValorParcialPrimeiroBS = '', '0', sValorParcialPrimeiroBS));
              sValorFinalBfciarioBS   := FloatToStr( rVlrCalculado );
            end;


            if  sValorIntegralBfciarioFAB <> '' then
            begin
               rVlrCalculado := ExecutaRegraPrimUltPagtoBenef(qryAux,
                                          qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
                                          iIdTitular,
                                          qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                          iSeqProposta,
                                          iIdPessJur,
                                          iIdPlanoOrigem,
                                          qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                          iNumBenef,
                                          sDataInicio,
                                          '',
                                          '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                          sValorIntegralBfciarioFAB,
                                          ' Primeiro ',
                                          bErro,
                                          sMsgErro, iIdCalculo, false); //Marcio Sanches Spinosa SOL 182092/14207 15207 15253 KITANTA 1969056);

               if bErro then begin
                  frmAguarde.Apaga;
                  MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                  sValorParcialPrimeiroFAB  := '';
                  Exit;
               end;

               { 3) Somar os dois valores - este é o valor real devido aos beneficiários antigos }
               sValorParcialPrimeiroFAB := FloatToStr(rVlrCalculado);

              rVlrCalculado := StrToFloat(iif(sValorParcialUltimoFAB = '', '0', sValorParcialUltimoFAB)) +
                               StrToFloat(iif(sValorParcialPrimeiroFAB = '', '0', sValorParcialPrimeiroFAB));
              sValorFinalBfciarioFAB   := FloatToStr( rVlrCalculado );
            end;


            if  sValorIntegralBfciarioDeficit <> '' then
            begin
               rVlrCalculado := ExecutaRegraPrimUltPagtoBenef(qryAux,
                                          qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
                                          iIdTitular,
                                          qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                          iSeqProposta,
                                          iIdPessJur,
                                          iIdPlanoOrigem,
                                          qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                          iNumBenef,
                                          sDataInicio,
                                          '',
                                          '', // Thiago Melo SOL 208274.15065 Kintana 2043014
                                          sValorIntegralBfciarioDeficit,
                                          ' Primeiro ',
                                          bErro,
                                          sMsgErro, iIdCalculo, false); //Marcio Sanches Spinosa SOL 182092/14207 15207 15253 KITANTA 1969056);

               if bErro then begin
                  frmAguarde.Apaga;
                  MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                  sValorParcialPrimeiroDeficit := '';
                  Exit;
               end;

               { 3) Somar os dois valores - este é o valor real devido aos beneficiários antigos }
               sValorParcialPrimeiroDeficit := FloatToStr(rVlrCalculado);

               rVlrCalculado := StrToFloat(iif(sValorParcialUltimoDeficit = '', '0', sValorParcialUltimoDeficit)) +
                                StrToFloat(iif(sValorParcialPrimeiroDeficit = '', '0', sValorParcialPrimeiroDeficit));
               sValorFinalBfciarioDeficit   := FloatToStr( rVlrCalculado );
            end;
            // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim


          End;

          { Ultimo Pagamento }
          if (sAnoMesAtual = sAnoMesDataFinal) And ( sFlgFrequencia = 'I' ) Then begin
            rValorParcialUltimo := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                                  qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                                                  iIdTitular,
                                                                  qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                                  iSeqProposta,
                                                                  iIdPessJur, iIdPlanoPrev,
                                                                  qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                  iNumBenefAntes,

                                                                  sDataInicio,
                                                                  sDataFinal,
                                                                  '', // Thiago Melo SOL 208274.15065 Kintana 2043014

                                                                  OraNumero(FloatToStr(rValorIntegralBfciario)),
                                                                  ' Último ',
                                                                  bErro,
                                                                  sMsgErro, iIdCalculo);

             if bErro then begin
                frmAguarde.Apaga;
                MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                rValorParcialUltimo  := 0;
                Exit;
             end;
             rValorFinalBfciario := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorParcialUltimo)));
             //CmDebugToFile(' ExecutaRegraPrimUltPagtoBenef Último '+FloattoStr(rValorParcialUltimo) ,'C:\debug desdobramento.txt');

             if sValorIntegralBfciarioBS  <> ''  then  // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
             begin

                rVlrCalculado := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                                  qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                                                  iIdTitular,
                                                                  qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                                  iSeqProposta,
                                                                  iIdPessJur, iIdPlanoPrev,
                                                                  qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                  iNumBenefAntes,

                                                                  sDataInicio,
                                                                  sDataFinal,
                                                                  '', // Thiago Melo SOL 208274.15065 Kintana 2043014

                                                                  sValorIntegralBfciarioBS,
                                                                  ' Último ',
                                                                  bErro,
                                                                  sMsgErro, iIdCalculo);

                if bErro then begin
                   frmAguarde.Apaga;
                   MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                   sValorParcialUltimoBS  := '';
                   Exit;
                end;
                sValorParcialUltimoBS := FloatToStr(rVlrCalculado);
                sValorFinalBfciarioBS := sValorParcialUltimoBS;
             end;


             if sValorIntegralBfciarioFAB  <> ''  then
             begin

                rVlrCalculado := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                                  qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                                                  iIdTitular,
                                                                  qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                                  iSeqProposta,
                                                                  iIdPessJur, iIdPlanoPrev,
                                                                  qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                  iNumBenefAntes,

                                                                  sDataInicio,
                                                                  sDataFinal,
                                                                  '', // Thiago Melo SOL 208274.15065 Kintana 2043014

                                                                  sValorIntegralBfciarioFAB,
                                                                  ' Último ',
                                                                  bErro,
                                                                  sMsgErro, iIdCalculo);

                if bErro then begin
                   frmAguarde.Apaga;
                   MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                   sValorParcialUltimoFAB  := '';
                   Exit;
                end;
                sValorParcialUltimoFAB := FloatToStr(rVlrCalculado);
                sValorFinalBfciarioFAB := sValorParcialUltimoFAB;
             end;


             if sValorIntegralBfciarioDeficit  <> ''  then
             begin

                rVlrCalculado := ExecutaRegraPrimUltPagtoBenef( qryAux,
                                                                qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                                                                iIdTitular,
                                                                qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                                iSeqProposta,
                                                                iIdPessJur, iIdPlanoPrev,
                                                                qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                iNumBenefAntes,

                                                                sDataInicio,
                                                                sDataFinal,
                                                                '', // Thiago Melo SOL 208274.15065 Kintana 2043014

                                                                sValorIntegralBfciarioDeficit,
                                                                ' Último ',
                                                                bErro,
                                                                sMsgErro, iIdCalculo);

                if bErro then begin
                   frmAguarde.Apaga;
                   MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
                   sValorFinalBfciarioDeficit  := '';
                   Exit;
                end;
                sValorFinalBfciarioDeficit := FloatToStr(rVlrCalculado);

             end;
             // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim


          end;

        end;
        rValorFinalBfciario := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorFinalBfciario)));
        rValorIntegralBfciario := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorIntegralBfciario)));
        //CmDebugToFile(' rValorFinalBfciario '+FloattoStr(rValorFinalBfciario) ,'C:\debug desdobramento.txt');
        //CmDebugToFile(' rValorIntegralBfciario '+FloattoStr(rValorIntegralBfciario) ,'C:\debug desdobramento.txt');
        { Verifica se paga Abono }
        if bPagaAbono = True Then Begin
           //edilaine - SIG94608 - inicio
            {DATAINICIO do velho no mesmo mês/ano da DATAINICIO do novo (MM/YYYY) E a DATAINICIO do novo <=  dia 15,
             nao calcula abono cheio no percentual anterior para o velho}
           if (copy(qryBeneficiarios.FieldByName('DATAINICIO').AsString,4,7) = copy(sDataInicio,4,7)) and
               (copy(sDataInicio,1,2) <= '15' ) then
              rValorIntegralBfciario := 0
           else
            //WO18495 Leanreo Pocebon inicio
             if (copy(sAnoMesAtual,1,4) = copy(sDataInicio,7,4)) and        //pocebon
                (StrToDate(sDataInicio)> StrToDate('15/12/' + copy(sDataInicio,7,4)) ) then
                  rValorIntegralBfciario := StrToFloat(ClienteNumero(sValorTotalBS))
             else
            //WO18495 Leanreo Pocebon fim
           // rValorIntegralBfciario := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorIntegralAntigo)));  //edilaine - SIG85197 //SIG97756 Tiago Von
                rValorIntegralBfciario := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorFinalBfciario)));   //SIG97756 Tiago Von
           //edilaine - SIG94608 - fim

          { Novo calculo do valor do abono    }
          { 1º periodo com Valor Total antigo }
          rValorAbonoCheio := ExecutaRegraValorAbono(QryAux, iIdRegraAbono, iIdPessJur,
                                                iIdPlanoPrev, iIdTitular, iSeqProposta,
                                                qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                                qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                qryBeneficiarios.FieldByName('DATAINICIO').AsString,
                                                //sDataFinal, {sDataInicio,}                         // fernando xavier - SOL 253577-17664 / PPM 1019932   //edilaine - SIG85197
                                                sDataInicio,                                         //edilaine - SIG85197
                                                sAnoMesAtual,
                                                rValorIntegralBfciario, //qryBeneficiarios.FieldByName('VALORTOTAL').AsFloat,
                                                qryBeneficio.FieldByName('FLGPROVISORIO').AsString,
                                                bErro, sMsgErro,
                                                iIdCalculo,
                                                5,iNumBenef );

          //CmDebugToFile(' 1º periodo com Valor Total antigo '+FloattoStr(rValorAbonoCheio) ,'C:\debug desdobramento.txt');
          { 2º periodo com novo Valor Total  }
          rValorIntegralBfciario := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorFinalBfciario)));   //edilaine - SIG85197

          rValorAbono := ExecutaRegraValorAbono(QryAux, iIdRegraAbono, iIdPessJur,
                                                iIdPlanoPrev, iIdTitular, iSeqProposta,
                                                qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                                qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                //qryBeneficiarios.FieldByName('DATAINICIO').AsString,   // fernando xavier - SOL 253577-17664 / PPM 1019932
                                                sDataInicio,                                             // fernando xavier - SOL 253577-17664 / PPM 1019932
                                                sDataFinal,
                                                sAnoMesAtual,
                                                rValorIntegralBfciario,
                                                qryBeneficio.FieldByName('FLGPROVISORIO').AsString,
                                                bErro, sMsgErro,
                                                iIdCalculo,
                                                5, iNumBenef );

          //rValorAbono :=  rValorAbonoCheio - rValorAbono;    //edilaine - SIG85197
          rValorAbono :=  rValorAbonoCheio + rValorAbono;      //edilaine - SIG85197

           //CmDebugToFile(' { 2º periodo com novo Valor Total  } '+FloattoStr(rValorAbono) ,'C:\debug desdobramento.txt');
          // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
          {atencao: em algumas máquinas a regra de abono esta calculando o valor com uma diferença de centavos em relação
                    ao Valor Total quando o participante é PMPP (valor do abono = 100% do valor do beneficio)
                    Por isso no demonstrativo o valor de abono do velho e novo estão divergentes }
          //rValorAbono :=  rValorAbonoCheio - rValorAbono;
          // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

          if  sValorIntegralBfciarioBS <> '' then
          begin
            //edilaine - SIG94608 - inicio
            {DATAINICIO do velho no mesmo mês/ano da DATAINICIO do novo (MM/YYYY) E a DATAINICIO do novo <=  dia 15,
             nao calcula abono cheio no percentual anterior para o velho}
            if (copy(qryBeneficiarios.FieldByName('DATAINICIO').AsString,4,7) = copy(sDataInicio,4,7)) and
               (copy(sDataInicio,1,2) <= '15' ) then
               sValorIntegralBfciarioBS := '0'
            else if sValorIntegralAntigoBS <> '' then
               sValorIntegralBfciarioBS := sValorIntegralAntigoBS;            //edilaine - SIG85197
            //edilaine - SIG94608 - fim

            rVlrCheio := ExecutaRegraValorAbono(QryAux, iIdRegraAbono, iIdPessJur,
                                               iIdPlanoPrev, iIdTitular, iSeqProposta,
                                               qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                               qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                               qryBeneficiarios.FieldByName('DATAINICIO').AsString,
                                               sDataInicio, {sDataFinal,}         //edilaine - SIG85197
                                               sAnoMesAtual,
                                               StrToFloat(sValorIntegralBfciarioBS),
                                               qryBeneficio.FieldByName('FLGPROVISORIO').AsString,
                                               bErro, sMsgErro,
                                               iIdCalculo,
                                               5,iNumBenef );

             sValorIntegralBfciarioBS := sValorFinalBfciarioBS;            //edilaine - SIG85197
             rVlrCalculado := ExecutaRegraValorAbono(QryAux, iIdRegraAbono, iIdPessJur,
                                                   iIdPlanoPrev, iIdTitular, iSeqProposta,
                                                   qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                                   qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                   sDataInicio,
                                                   sDataFinal,
                                                   sAnoMesAtual,
                                                   StrToFloat(sValorIntegralBfciarioBS),
                                                   qryBeneficio.FieldByName('FLGPROVISORIO').AsString,
                                                   bErro, sMsgErro,
                                                   iIdCalculo,
                                                   5, iNumBenef );

             //rVlrCalculado := rVlrCheio - rVlrCalculado;       //edilaine - SIG85197
             rVlrCalculado := rVlrCheio + rVlrCalculado;         //edilaine - SIG85197
             sValorAbonoBS := FloatToStr(rVlrCalculado);
          end;

          if  sValorIntegralBfciarioFAB <> '' then
          begin
            //edilaine - SIG94608 - inicio
            {DATAINICIO do velho no mesmo mês/ano da DATAINICIO do novo (MM/YYYY) E a DATAINICIO do novo <=  dia 15,
             nao calcula abono cheio no percentual anterior para o velho}
            if (copy(qryBeneficiarios.FieldByName('DATAINICIO').AsString,4,7) = copy(sDataInicio,4,7)) and
               (copy(sDataInicio,1,2) <= '15' ) then
               sValorIntegralBfciarioFAB := '0'
            else if sValorIntegralAntigoFAB <> '' then
               sValorIntegralBfciarioFAB := sValorIntegralAntigoFAB;            //edilaine - SIG85197
            //edilaine - SIG94608 - fim

            rVlrCheio := ExecutaRegraValorAbono(QryAux, iIdRegraAbono, iIdPessJur,
                                               iIdPlanoPrev, iIdTitular, iSeqProposta,
                                               qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                               qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                               qryBeneficiarios.FieldByName('DATAINICIO').AsString,
                                               sDataInicio, {sDataFinal,}         //edilaine - SIG85197
                                               sAnoMesAtual,
                                               StrToFloat(sValorIntegralBfciarioFAB),
                                               qryBeneficio.FieldByName('FLGPROVISORIO').AsString,
                                               bErro, sMsgErro,
                                               iIdCalculo,
                                               5,iNumBenef );


             sValorIntegralBfciarioFAB := sValorFinalBfciarioFAB;            //edilaine - SIG85197
             rVlrCalculado := ExecutaRegraValorAbono(QryAux, iIdRegraAbono, iIdPessJur,
                                                   iIdPlanoPrev, iIdTitular, iSeqProposta,
                                                   qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                                   qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                   sDataInicio,
                                                   sDataFinal,
                                                   sAnoMesAtual,
                                                   StrToFloat(sValorIntegralBfciarioFAB),
                                                   qryBeneficio.FieldByName('FLGPROVISORIO').AsString,
                                                   bErro, sMsgErro,
                                                   iIdCalculo,
                                                   5, iNumBenef );

             //rVlrCalculado := rVlrCheio - rVlrCalculado;             //edilaine - SIG85197
             rVlrCalculado := rVlrCheio + rVlrCalculado;               //edilaine - SIG85197
             sValorAbonoFAB := FloatToStr(rVlrCalculado);
          end;


          if  sValorIntegralBfciarioDeficit <> '' then
          begin
             //edilaine - SIG94608 - inicio
             rVlrCheio := 0;
             if (copy(qryBeneficiarios.FieldByName('DATAINICIO').AsString,4,7) = copy(sDataInicio,4,7)) and
                (copy(sDataInicio,1,2) <= '15' ) then
                 rVlrCheio := ExecutaRegraValorAbono(QryAux, iIdRegraAbono, iIdPessJur,
                                                    iIdPlanoPrev, iIdTitular, iSeqProposta,
                                                    qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                                    qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                    qryBeneficiarios.FieldByName('DATAINICIO').AsString,
                                                    sDataInicio, {sDataFinal,}         //edilaine - SIG85197
                                                    sAnoMesAtual,
                                                    StrToFloat(sValorIntegralBfciarioDeficit),
                                                    qryBeneficio.FieldByName('FLGPROVISORIO').AsString,
                                                    bErro, sMsgErro,
                                                    iIdCalculo,
                                                    5,iNumBenef );
             //edilaine - SIG94608 - fim

             rVlrCalculado := ExecutaRegraValorAbono(QryAux, iIdRegraAbono, iIdPessJur,
                                                   iIdPlanoPrev, iIdTitular, iSeqProposta,
                                                   qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                                   qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                   sDataInicio,
                                                   sDataFinal,
                                                   sAnoMesAtual,
                                                   StrToFloat(sValorIntegralBfciarioDeficit),
                                                   qryBeneficio.FieldByName('FLGPROVISORIO').AsString,
                                                   bErro, sMsgErro,
                                                   iIdCalculo,
                                                   5, iNumBenef );

             //rVlrCalculado := rVlrCheio - rVlrCalculado;         //edilaine - SIG85197
             rVlrCalculado := rVlrCheio + rVlrCalculado;           //edilaine - SIG85197
             sValorAbonoDeficit := FloatToStr(rVlrCalculado);
          end;
          // fernando xavier - SOL 253577-17664 / PPM 1019932


          VarFields[0] := Copy(sAnoMesAtual,1,4)+'/13';
          VarFields[1] := qryBeneficiarios.FieldByName('IdPessoa').AsInteger;
          If qryHstBenefPagos.Locate('MESREFERENCIA;IDPESSOA',varFields,[loCaseInsensitive]) then begin
             //CmDebugToFile(' qryHstBenefPagos.Locate(''MESREFERENCIA;IDPESSOA'',' ,'C:\debug desdobramento.txt');

             rValorAbono := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorAbono)));
             Try //Brunno Mattos - KTN 767861 - SOL 132659
             qryHstBenefPagos.Edit;
             qryHstBenefPagos.FieldByName('DESCRICAO').AsString     := 'Benef. Recalc.';
             //qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat      := rValorAbono;    // SOL 192563 KINTANA 1877175
             qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat      := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorAbono)));  // SOL 192563 KINTANA 1877175
             //CmDebugToFile(' NOVOVALOR '+FloattoStr(rValorAbono) ,'C:\debug desdobramento.txt');
             //qryHstBenefPagos.FieldByName('VALORTOTAL').AsFloat     := rValorTotalAnt;   // SOL 192563 KINTANA 1877175
             qryHstBenefPagos.FieldByName('VALORTOTAL').AsFloat     := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorTotalAnt)));  // SOL 192563 KINTANA 1877175
             //CmDebugToFile(' VALORTOTAL '+FloattoStr(rValorTotalAnt) ,'C:\debug desdobramento.txt');
             //qryHstBenefPagos.FieldByName('VALORINTEGRAL').AsFloat  := rValorIntegralBfciario;  // SOL 192563 KINTANA 1877175
             qryHstBenefPagos.FieldByName('VALORINTEGRAL').AsFloat  := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorIntegralBfciario)));  // SOL 192563 KINTANA 1877175
             //CmDebugToFile(' VALORINTEGRAL '+FloattoStr(rValorIntegralBfciario) ,'C:\debug desdobramento.txt');
             // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
             qryHstBenefPagos.FieldByName('VALORBS').AsString        := sValorIntegralBfciarioBS ;
             qryHstBenefPagos.FieldByName('VALORFAB').AsString       := sValorIntegralBfciarioFAB;
             qryHstBenefPagos.FieldByName('VLRBASEDEFICIT').AsString := sValorIntegralBfciarioDeficit;
             // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

             qryHstBenefPagos.FieldByName('IDPERFILINVEST').AsString := qryBeneficiarios.FieldByName('IDPERFILINVEST').AsString;   //edilaine - SIG55933

             //BRUNO AZEVEDO - SOL 162759 e SOL 162523
             qryHstBenefPagos.FieldByName('FLGDEVOLUCAO').AsFloat   := 1;
             qryHstBenefPagos.FieldByName('IDMOTIVO').AsInteger     := 3057;
             qryHstBenefPagos.Post;
             //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
             Except
              on e:Exception do
              begin
                TratarErro(e.Message);
              end;
             end;
             //Brunno Mattos - KTN 767861 - SOL 132659 Fim
          End Else Begin
             Try //Brunno Mattos - KTN 767861 - SOL 132659
             //CmDebugToFile(' Não localizou o mes e a pessoa faz insert qryHstBenefPagos ' ,'C:\debug desdobramento.txt');
             qryHstBenefPagos.Insert;
             qryHstBenefPagos.FieldByName('DESCRICAO').AsString     := 'Benef. Recalc.';
             qryHstBenefPagos.FieldByName('VALORPREV').AsFloat      := 0;
             qryHstBenefPagos.FieldByName('VLBENEFPGTO').AsFloat    := 0;
             //qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat      := rValorAbono;   // SOL 192563 KINTANA 1877175
             qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat      :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorAbono)));   // SOL 192563 KINTANA 1877175
             //CmDebugToFile(' NOVOVALOR '+FloattoStr(rValorAbono) ,'C:\debug desdobramento.txt');
             //qryHstBenefPagos.FieldByName('VALORTOTAL').AsFloat     := rValorTotalAnt;     // SOL 192563 KINTANA 1877175
             qryHstBenefPagos.FieldByName('VALORTOTAL').AsFloat     :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorTotalAnt)));   // SOL 192563 KINTANA 1877175
             //CmDebugToFile(' VALORTOTAL '+FloattoStr(rValorTotalAnt) ,'C:\debug desdobramento.txt');
             //qryHstBenefPagos.FieldByName('VALORINTEGRAL').AsFloat  := rValorIntegralBfciario;   // SOL 192563 KINTANA 1877175
             qryHstBenefPagos.FieldByName('VALORINTEGRAL').AsFloat  :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorIntegralBfciario)));  // SOL 192563 KINTANA 1877175
             //CmDebugToFile(' VALORINTEGRAL '+FloattoStr(rValorIntegralBfciario) ,'C:\debug desdobramento.txt');
             qryHstBenefPagos.FieldByName('IDPESSOA').AsFloat       := qryBeneficiarios.FieldByName('IdPessoa').AsInteger;
             qryHstBenefPagos.FieldByName('IDBENEFICIO').AsInteger  := qryBeneficiarios.FieldByName('idbeneficio').AsInteger;
             qryHstBenefPagos.FieldByName('MESREFERENCIA').AsString := Copy(sAnoMesAtual,1,4)+'/13';
             qryHstBenefPagos.FieldByName('NOME').AsString          := qryBeneficiarios.FieldByName('NOME').AsString;
             qryHstBenefPagos.FieldByName('FLGPROVISORIO').AsString := qryBeneficio.FieldByName('FLGPROVISORIO').AsString;
             qryHstBenefPagos.FieldByName('DATAPAGAMENTO').AsString := sDataPagamento;

             qryHstBenefPagos.FieldByName('IDPERFILINVEST').AsString := qryBeneficiarios.FieldByName('IDPERFILINVEST').AsString;   //edilaine - SIG55933

//             qryHstBenefPagos.FieldByName('FLGENVIADO').AsInteger   := 0;
///douglas.siqueira SOL 171026 KITANTA 1528962
           if sFontePagadora = '2' then
              begin
              if qryBeneficiarios.FieldByName('FLGPAGAINSS').AsString = '1' {_sFlgPagaInss = '1'} then     // edilaine - SOL 253577-17664 / PPM 1019932
                qryHstBenefPagos.FieldByName('FLGENVIADO').AsInteger     := 0
              else
                qryHstBenefPagos.FieldByName('FLGENVIADO').AsInteger     := 8;
              end
           else
              qryHstBenefPagos.FieldByName('FLGENVIADO').AsInteger     := 0;
///douglas.siqueira SOL 171026 KITANTA 1528962
             //BRUNO AZEVEDO - SOL 162759 e SOL 162523
             qryHstBenefPagos.FieldByName('FLGDEVOLUCAO').AsFloat   := 1;
             qryHstBenefPagos.FieldByName('IDMOTIVO').AsInteger     := 3057;
             //qryHstBenefPagos.FieldByName('VALOROP1').AsFloat       := qryBeneficiarios.FieldByName('VALORBASE1').AsFloat;    // SOL 192563 KINTANA 1877175
             qryHstBenefPagos.FieldByName('VALOROP1').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORBASE1').AsFloat)));   // SOL 192563 KINTANA 1877175
             //qryHstBenefPagos.FieldByName('VALOROP2').AsFloat       := qryBeneficiarios.FieldByName('VALORBASE2').AsFloat;    // SOL 192563 KINTANA 1877175
             qryHstBenefPagos.FieldByName('VALOROP2').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORBASE2').AsFloat)));  // SOL 192563 KINTANA 1877175
             //qryHstBenefPagos.FieldByName('VALOROP3').AsFloat       := qryBeneficiarios.FieldByName('VALORBASE3').AsFloat;    // SOL 192563 KINTANA 1877175
             qryHstBenefPagos.FieldByName('VALOROP3').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORBASE3').AsFloat)));   // SOL 192563 KINTANA 1877175
             //qryHstBenefPagos.FieldByName('VALORSRB').AsFloat       := qryBeneficiarios.FieldByName('VALORSRB').AsFloat;   // SOL 192563 KINTANA 1877175
             qryHstBenefPagos.FieldByName('VALORSRB').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORSRB').AsFloat)));   // SOL 192563 KINTANA 1877175
             qryHstBenefPagos.FieldByName('FONTEPAGADORA').AsString := sFontePagadora; // SOL 159974 KINTANA 1327873

             // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
             qryHstBenefPagos.FieldByName('VALORBS').AsString        := sValorIntegralBfciarioBS ;
             qryHstBenefPagos.FieldByName('VALORFAB').AsString       := sValorIntegralBfciarioFAB;
             qryHstBenefPagos.FieldByName('VLRBASEDEFICIT').AsString := sValorIntegralBfciarioDeficit;
             // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim
             qryHstBenefPagos.FieldByName('numeroprocesso').AsInteger:= iNumeroProcesso; //Darivaldo Alencar SIG51392
             qryHstBenefPagos.Post;
             //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
             Except
              on e:Exception do
              begin
                TratarErro(e.Message);
              end;
             end;
             //Brunno Mattos - KTN 767861 - SOL 132659 Fim
             If not qryBenefINSS.IsEmpty then begin
               Try
                //CmDebugToFile(' not qryBenefINSS.IsEmpty ' ,'C:\debug desdobramento.txt');
               qryHstNovoINSS.Insert;
               qryHstNovoINSS.FieldByName('IDPESSJUR').AsInteger      := iIdPessJur;
               qryHstNovoINSS.FieldByName('IDPLANOORIGEM').AsInteger  := iIdPlanoPrev; //iIdPlanoOrigem; BRUNO AZEVEDO
               qryHstNovoINSS.FieldByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
               qryHstNovoINSS.FieldByName('IDTITULAR').AsInteger      := iIdTitular;
               qryHstNovoINSS.FieldByName('IDPESSOA').AsInteger       := qryBeneficiarios.FieldByName('IdPessoa').AsInteger;
               qryHstNovoINSS.FieldByName('IDBENEFICIO').AsInteger    := qryBenefINSS.FieldByName('IdBeneficio').AsInteger;
               qryHstNovoINSS.FieldByName('IDMOTIVO').AsInteger       := 3057; //prmIDMOTIVOFOLHABEN;
               qryHstNovoINSS.FieldByName('MES').AsString             := sAnoMesPagamento;
               qryHstNovoINSS.FieldByName('MESREFERENCIA').AsString   := Copy(sAnoMesAtual,1,4)+'/13';
               qryHstNovoINSS.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso; //SOL 253577-18114 PPM 1292515 17/02/2016
               if Copy(sAnoMesAtual,6,2) <> '13' then
               begin
                  qryHstNovoINSS.FieldByName('SEQBENEFICIO').AsInteger   := 1; //SOL 253577-18114 PPM 1292515 17/02/2016
               end
               else
               begin
                  inc(iSeqBeneficio);
                  qryHstNovoINSS.FieldByName('SEQBENEFICIO').AsInteger   := iSeqBeneficio;
               end;
               //qryHstNovoINSS.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcessoNovo; //SOL 253577-18114 PPM 1292515 17/02/2016
               //qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat        := StrToFloat(ClienteNumero(sVlrInfINSS));  // SOL 192563 KINTANA 1877175
               qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat        :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',StrToFloat(sVlrInfINSS))));  // SOL 192563 KINTANA 1877175
               //CmDebugToFile(' NOVOVALOR '+sVlrInfINSS  ,'C:\debug desdobramento.txt');
               //qryHstNovoINSS.FieldByName('VALORPREV').AsFloat        := StrToFloat(ClienteNumero(sVlrInfINSS));  // SOL 192563 KINTANA 1877175
               qryHstNovoINSS.FieldByName('VALORPREV').AsFloat        :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',StrToFloat(sVlrInfINSS))));    // SOL 192563 KINTANA 1877175
               //CmDebugToFile(' VALORPREV '+sVlrInfINSS  ,'C:\debug desdobramento.txt');

               qryHstNovoINSS.FieldByName('IDPERFILINVEST').AsString  := qryBenefINSS.FieldByName('IDPERFILINVEST').AsString;   //edilaine - SIG55933

               qryHstNovoINSS.FieldByName('NOME').AsString            := qryBeneficiarios.FieldByName('Nome').AsString;
               qryHstNovoINSS.FieldByName('FLGCONCESSAO').AsInteger   := 1;
               qryHstNovoINSS.FieldByName('FLGNOVOBENEF').AsInteger   := 1;
               qryHstNovoINSS.FieldByName('DESCRICAO').AsString       := 'Novo Benef.';
               qryHstNovoINSS.FieldByName('FLGPROVISORIO').AsString   := qryBeneficio.FieldByName('FLGPROVISORIO').AsString;
               qryHstNovoINSS.FieldByName('DATAPAGAMENTO').AsString   := sDataPagamento;
//               qryHstNovoINSS.FieldByName('FLGENVIADO').AsInteger   := 0;
///douglas.siqueira SOL 171026 KITANTA 1528962
           if sFontePagadora = '2' then
              begin
              if _sFlgPagaInss = '1' then 
                qryHstNovoINSS.FieldByName('FLGENVIADO').AsInteger     := 0
              else
                qryHstNovoINSS.FieldByName('FLGENVIADO').AsInteger     := 8;
              end
           else
               qryHstNovoINSS.FieldByName('FLGENVIADO').AsInteger     := 0;

///douglas.siqueira SOL 171026 KITANTA 1528962
               //qryHstNovoINSS.FieldByName('VALOROP1').AsFloat       := qryBeneficiarios.FieldByName('VALORBASE1').AsFloat; // SOL 192563 KINTANA 1877175
               qryHstNovoINSS.FieldByName('VALOROP1').AsFloat       :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORBASE1').AsFloat)));  // SOL 192563 KINTANA 1877175
               //qryHstNovoINSS.FieldByName('VALOROP2').AsFloat       := qryBeneficiarios.FieldByName('VALORBASE2').AsFloat;       // SOL 192563 KINTANA 1877175
               qryHstNovoINSS.FieldByName('VALOROP2').AsFloat       :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORBASE2').AsFloat)));   // SOL 192563 KINTANA 1877175
               //qryHstNovoINSS.FieldByName('VALOROP3').AsFloat       := qryBeneficiarios.FieldByName('VALORBASE3').AsFloat;    // SOL 192563 KINTANA 1877175
               qryHstNovoINSS.FieldByName('VALOROP3').AsFloat       :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORBASE3').AsFloat)));     // SOL 192563 KINTANA 1877175
               //qryHstNovoINSS.FieldByName('VALORSRB').AsFloat       := qryBeneficiarios.FieldByName('VALORSRB').AsFloat;  // SOL 192563 KINTANA 1877175
               qryHstNovoINSS.FieldByName('VALORSRB').AsFloat       :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORSRB').AsFloat)));  // SOL 192563 KINTANA 1877175
               qryHstNovoINSS.FieldByName('FONTEPAGADORA').AsString := sFontePagadora; // SOL 159974 KINTANA 1327873
               qryHstNovoINSS.Post;
               //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
               Except
                on e:Exception do
                begin
                  TratarErro(e.Message);
                end;
               end;
               //Brunno Mattos - KTN 767861 - SOL 132659 Fim
             End;

          End;
          //CmDebugToFile(' qryBeneficiarios.Edit ','C:\debug desdobramento.txt');
          qryBeneficiarios.Edit;
          //qryBeneficiarios.FieldByName('ValorAtual').AsFloat     := rValorIntegralBfciario;  // SOL 192563 KINTANA 1877175
          qryBeneficiarios.FieldByName('ValorAtual').AsFloat     := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorIntegralBfciario))); // SOL 192563 KINTANA 1877175
          //CmDebugToFile(' ValorAtual '+ FloattoStr(rValorIntegralBfciario) ,'C:\debug desdobramento.txt');
          //qryBeneficiarios.FieldByName('ValorCalculado').AsFloat := rValorIntegralBfciario;    // SOL 192563 KINTANA 1877175
          qryBeneficiarios.FieldByName('ValorCalculado').AsFloat := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorIntegralBfciario)));   // SOL 192563 KINTANA 1877175
          //CmDebugToFile(' ValorCalculado '+ FloattoStr(rValorIntegralBfciario) ,'C:\debug desdobramento.txt');
          //qryBeneficiarios.FieldByName('ValorTotal').AsFloat     := dVlrBenefReajustado;   // SOL 192563 KINTANA 1877175
          qryBeneficiarios.FieldByName('ValorTotal').AsFloat     := StrToFloat(ClienteNumero(FormatFloat('#0.00',dVlrBenefReajustado)));   // SOL 192563 KINTANA 1877175
          //CmDebugToFile(' ValorTotal '+ FloattoStr(dVlrBenefReajustado) ,'C:\debug desdobramento.txt');

          // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
          qryBeneficiarios.FieldByName('VLRBSTOTAL').AsString     := sVlrBSReajustado;
          qryBeneficiarios.FieldByName('VLRBSATUAL').AsString     := sValorIntegralBfciarioBS;
          qryBeneficiarios.FieldByName('VLRFABTOTAL').AsString    := sVlrFABReajustado;
          qryBeneficiarios.FieldByName('VLRFABATUAL').AsString    := sValorIntegralBfciarioFAB;
          qryBeneficiarios.FieldByName('VLRBASEDEFICIT').AsString := sValorIntegralBfciarioDeficit;
          // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

          If rValorFinalBfciario = 0 Then Begin
            qryHstBenefPagos.Delete;
          End;

          qryBeneficiarios.Post;

          { Fim Inserir Abono }
        end;


        varFields[0] := sAnoMesAtual;
        varFields[1] := qryBeneficiarios.FieldByName('IdPessoa').AsInteger;
        if qryHstBenefPagos.Locate('MesReferencia;IdPessoa',varFields,[loCaseInsensitive])
        then begin
           rValorFinalBfciario := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorFinalBfciario)));
           //CmDebugToFile(' qryHstBenefPagos.Locate(''MesReferencia;IdPessoa''' ,'C:\debug desdobramento.txt');
           Try
           qryHstBenefPagos.Edit;
           qryHstBenefPagos.FieldByName('DESCRICAO').AsString     := 'Benef. Recalc.';
           //qryHstBenefPagos.FieldByName('NovoValor').AsFloat      := rValorFinalBfciario;   // SOL 192563 KINTANA 1877175
           qryHstBenefPagos.FieldByName('NovoValor').AsFloat      := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorFinalBfciario)));  // SOL 192563 KINTANA 1877175
           //CmDebugToFile(' NovoValor '+ FloattoStr(rValorFinalBfciario) ,'C:\debug desdobramento.txt');
           //qryHstBenefPagos.FieldByName('ValorTotal').AsFloat     := rValorTotalAnt;            // SOL 192563 KINTANA 1877175
           qryHstBenefPagos.FieldByName('ValorTotal').AsFloat     := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorTotalAnt)));   // SOL 192563 KINTANA 1877175
           //CmDebugToFile(' ValorTotal '+ FloattoStr(rValorTotalAnt) ,'C:\debug desdobramento.txt');
           //qryHstBenefPagos.FieldByName('ValorIntegral').AsFloat  := rValorIntegralBfciario;   // SOL 192563 KINTANA 1877175
           qryHstBenefPagos.FieldByName('ValorIntegral').AsFloat  := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorIntegralBfciario)));    // SOL 192563 KINTANA 1877175
           //CmDebugToFile(' ValorIntegral '+ FloattoStr(rValorIntegralBfciario) ,'C:\debug desdobramento.txt');
           //BRUNO AZEVEDO - SOL 162759 e SOL 162523
           qryHstBenefPagos.FieldByName('FLGDEVOLUCAO').AsFloat   := 1;
           qryHstBenefPagos.FieldByName('IDMOTIVO').AsInteger     := 3057;

           // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
           qryHstBenefPagos.FieldByName('VALORBS').AsString        := sValorFinalBfciarioBS;
           qryHstBenefPagos.FieldByName('VALORFAB').AsString       := sValorFinalBfciarioFAB;
           qryHstBenefPagos.FieldByName('VLRBASEDEFICIT').AsString := sValorFinalBfciarioDeficit;
           // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

           qryHstBenefPagos.FieldByName('IDPERFILINVEST').AsString := qryBeneficiarios.FieldByName('IDPERFILINVEST').AsString;   //edilaine - SIG55933

           qryHstBenefPagos.Post;
           //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
           Except
            on e:Exception do
            begin
              TratarErro(e.Message);
            end;
           end;
           //Brunno Mattos - KTN 767861 - SOL 132659 Fim
        end
        else begin
           Try
           //CmDebugToFile('  não localozou no qryHstBenefPagos.Locate(''MesReferencia;IdPessoa''' ,'C:\debug desdobramento.txt');
           qryHstBenefPagos.Insert;
           qryHstBenefPagos.FieldByName('DESCRICAO').AsString     := 'Benef. Recalc.';
           qryHstBenefPagos.FieldByName('VALORPREV').AsFloat      := 0;
           qryHstBenefPagos.FieldByName('VLBENEFPGTO').AsFloat    := 0;
           //qryHstBenefPagos.FieldByName('NovoValor').AsFloat      := rValorFinalBfciario;     // SOL 192563 KINTANA 1877175
           qryHstBenefPagos.FieldByName('NovoValor').AsFloat      :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorFinalBfciario)));   // SOL 192563 KINTANA 1877175
           //CmDebugToFile(' NovoValor '+ FloattoStr(rValorFinalBfciario) ,'C:\debug desdobramento.txt');
           //qryHstBenefPagos.FieldByName('ValorTotal').AsFloat     := rValorTotalAnt;    // SOL 192563 KINTANA 1877175
           qryHstBenefPagos.FieldByName('ValorTotal').AsFloat     :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorTotalAnt)));  // SOL 192563 KINTANA 1877175
           //CmDebugToFile(' ValorTotal '+ FloattoStr(rValorTotalAnt) ,'C:\debug desdobramento.txt');
           //qryHstBenefPagos.FieldByName('ValorIntegral').AsFloat  := rValorIntegralBfciario;  // SOL 192563 KINTANA 1877175
           qryHstBenefPagos.FieldByName('ValorIntegral').AsFloat  :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorIntegralBfciario))); // SOL 192563 KINTANA 1877175
           //CmDebugToFile(' ValorIntegral '+ FloattoStr(rValorIntegralBfciario) ,'C:\debug desdobramento.txt');
           qryHstBenefPagos.FieldByName('IDPESSOA').AsFloat       := qryBeneficiarios.FieldByName('IdPessoa').AsInteger;
           qryHstBenefPagos.FieldByName('IDBENEFICIO').AsInteger  := qryBeneficiarios.FieldByName('idbeneficio').AsInteger;
           qryHstBenefPagos.FieldByName('MESREFERENCIA').AsString := sAnoMesAtual;
           qryHstBenefPagos.FieldByName('NOME').AsString          := qryBeneficiarios.FieldByName('NOME').AsString;
           qryHstBenefPagos.FieldByName('FLGPROVISORIO').AsString := qryBeneficio.FieldByName('FLGPROVISORIO').AsString;
           qryHstBenefPagos.FieldByName('DATAPAGAMENTO').AsString := sDataPagamento;
//           qryHstBenefPagos.FieldByName('FLGENVIADO').AsInteger   := 0;
///douglas.siqueira SOL 171026 KITANTA 1528962
           if sFontePagadora = '2' then
              begin
              if qryBeneficiarios.FieldByName('FLGPAGAINSS').AsString = '1' {_sFlgPagaInss = '1'} then     // edilaine - SOL 253577-17664 / PPM 1019932
                 qryHstBenefPagos.FieldByName('FLGENVIADO').AsInteger     := 0
              else
                qryHstBenefPagos.FieldByName('FLGENVIADO').AsInteger     := 8;
              end
           else
              qryHstBenefPagos.FieldByName('FLGENVIADO').AsInteger     := 0;
///douglas.siqueira SOL 171026 KITANTA 1528962

           //BRUNO AZEVEDO - SOL 162759 e SOL 162523
           qryHstBenefPagos.FieldByName('FLGDEVOLUCAO').AsFloat   := 1;
           qryHstBenefPagos.FieldByName('IDMOTIVO').AsInteger     := 3057;
           //qryHstBenefPagos.FieldByName('VALOROP1').AsFloat       := qryBeneficiarios.FieldByName('VALORBASE1').AsFloat; // SOL 192563 KINTANA 1877175
           qryHstBenefPagos.FieldByName('VALOROP1').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORBASE1').AsFloat)));   // SOL 192563 KINTANA 1877175
           //qryHstBenefPagos.FieldByName('VALOROP2').AsFloat       := qryBeneficiarios.FieldByName('VALORBASE2').AsFloat;   // SOL 192563 KINTANA 1877175
           qryHstBenefPagos.FieldByName('VALOROP2').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORBASE2').AsFloat)));  // SOL 192563 KINTANA 1877175
           //qryHstBenefPagos.FieldByName('VALOROP3').AsFloat       := qryBeneficiarios.FieldByName('VALORBASE3').AsFloat; // SOL 192563 KINTANA 1877175
           qryHstBenefPagos.FieldByName('VALOROP3').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORBASE3').AsFloat))); // SOL 192563 KINTANA 1877175
           //qryHstBenefPagos.FieldByName('VALORSRB').AsFloat       := qryBeneficiarios.FieldByName('VALORSRB').AsFloat;  // SOL 192563 KINTANA 1877175
           qryHstBenefPagos.FieldByName('VALORSRB').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORSRB').AsFloat))); // SOL 192563 KINTANA 1877175
           qryHstBenefPagos.FieldByName('FONTEPAGADORA').AsString := sFontePagadora; // SOL 159974 KINTANA 1327873

           // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
           qryHstBenefPagos.FieldByName('VALORBS').AsString        := sValorFinalBfciarioBS;
           qryHstBenefPagos.FieldByName('VALORFAB').AsString       := sValorFinalBfciarioFAB;
           qryHstBenefPagos.FieldByName('VLRBASEDEFICIT').AsString := sValorFinalBfciarioDeficit;
           // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim
           qryHstBenefPagos.FieldByName('numeroprocesso').AsInteger:= iNumeroProcesso; //Darivaldo Alencar SIG51392
           qryHstBenefPagos.FieldByName('IDPERFILINVEST').AsString := qryBeneficiarios.FieldByName('IDPERFILINVEST').AsString;   //edilaine - SIG55933
           qryHstBenefPagos.Post;
           //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
           Except
            on e:Exception do
            begin
              TratarErro(e.Message);
            end;
           end;
           //Brunno Mattos - KTN 767861 - SOL 132659 Fim

           // Inserir INSS também
           if not qryBenefINSS.IsEmpty
           then begin
              Try

              //CmDebugToFile('  not qryBenefINSS.IsEmpty Inserir INSS também ' ,'C:\debug desdobramento.txt');

              qryHstNovoINSS.Insert;
              qryHstNovoINSS.FieldByName('IDPESSJUR').AsInteger      := iIdPessJur;
              qryHstNovoINSS.FieldByName('IDPLANOORIGEM').AsInteger  := iIdPlanoPrev; //iIdPlanoOrigem; BRUNO AZEVEDO
              qryHstNovoINSS.FieldByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
              qryHstNovoINSS.FieldByName('IDTITULAR').AsInteger      := iIdTitular;
              qryHstNovoINSS.FieldByName('IDPESSOA').AsInteger       := qryBeneficiarios.FieldByName('IdPessoa').AsInteger;
              qryHstNovoINSS.FieldByName('IDBENEFICIO').AsInteger    := qryBenefINSS.FieldByName('IdBeneficio').AsInteger;
              qryHstNovoINSS.FieldByName('IDMOTIVO').AsInteger       := 3057; //prmIDMOTIVOFOLHABEN;
              qryHstNovoINSS.FieldByName('MES').AsString             := sAnoMesPagamento;
              qryHstNovoINSS.FieldByName('MESREFERENCIA').AsString   := sAnoMesAtual;
              qryHstNovoINSS.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso; //SOL 253577-18114 PPM 1292515 17/02/2016

              qryHstNovoINSS.FieldByName('IDPERFILINVEST').AsString  := qryBenefINSS.FieldByName('IDPERFILINVEST').AsString;   //edilaine - SIG55933

              //qryHstNovoINSS.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcessoNovo; //SOL 253577-18114 PPM 1292515 17/02/2016
              if Copy(sAnoMesAtual,6,2) = '13'
              then //qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat   := StrToFloat(ClienteNumero(sVlrInfINSS))   // SOL 192563 KINTANA 1877175
              begin
                   Inc(iSeqBeneficio);
                   qryHstNovoINSS.FieldByName('SEQBENEFICIO').AsInteger   := iSeqBeneficio; //SOL 253577-18114 PPM 1292515 17/02/2016
                   qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat   := StrToFloat(ClienteNumero(FormatFloat('#0.00',StrToFloat(sVlrInfINSS)))) ;  // SOL 192563 KINTANA 1877175
                   //CmDebugToFile(' NOVOVALOR '+sVlrInfINSS  ,'C:\debug desdobramento.txt');
              end
              else //qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat   := StrToFloat(ClienteNumero(sVlrInfINSS));    // SOL 192563 KINTANA 1877175
              begin
                   qryHstNovoINSS.FieldByName('SEQBENEFICIO').AsInteger   := 1; //SOL 253577-18114 PPM 1292515 17/02/2016
                   qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat   :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',StrToFloat(sVlrInfINSS))));  // SOL 192563 KINTANA 1877175
                   //CmDebugToFile(' NOVOVALOR '+sVlrInfINSS  ,'C:\debug desdobramento.txt');
              end;
              //qryHstNovoINSS.FieldByName('VALORPREV').AsFloat        := qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat;   // SOL 192563 KINTANA 1877175
              qryHstNovoINSS.FieldByName('VALORPREV').AsFloat        :=  StrToFloat(ClienteNumero(FormatFloat('#0.00',qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat)));  // SOL 192563 KINTANA 1877175
              //CmDebugToFile(' VALORPREV '+qryHstNovoINSS.FieldByName('NOVOVALOR').AsString  ,'C:\debug desdobramento.txt');

              qryHstNovoINSS.FieldByName('NOME').AsString            := qryBeneficiarios.FieldByName('Nome').AsString;
              qryHstNovoINSS.FieldByName('FLGCONCESSAO').AsInteger   := 1;
              qryHstNovoINSS.FieldByName('FLGNOVOBENEF').AsInteger   := 1;
              qryHstNovoINSS.FieldByName('DESCRICAO').AsString       := 'Novo Benef.';
              qryHstNovoINSS.FieldByName('FLGPROVISORIO').AsString   := qryBeneficio.FieldByName('FLGPROVISORIO').AsString;
              qryHstNovoINSS.FieldByName('FLGPROVISORIO').AsString := qryBeneficio.FieldByName('FLGPROVISORIO').AsString;
              qryHstNovoINSS.FieldByName('DATAPAGAMENTO').AsString := sDataPagamento;
//              qryHstNovoINSS.FieldByName('FLGENVIADO').AsInteger   := 0;
///douglas.siqueira SOL 171026 KITANTA 1528962
           if sFontePagadora = '2' then
              begin
              if _sFlgPagaInss = '1' then
                 qryHstNovoINSS.FieldByName('FLGENVIADO').AsInteger     := 0
              else
                 qryHstNovoINSS.FieldByName('FLGENVIADO').AsInteger     := 8;
              end
           else
              qryHstNovoINSS.FieldByName('FLGENVIADO').AsInteger     := 0;

///douglas.siqueira SOL 171026 KITANTA 1528962


              //qryHstNovoINSS.FieldByName('VALOROP1').AsFloat       := qryBeneficiarios.FieldByName('VALORBASE1').AsFloat;   // SOL 192563 KINTANA 1877175
              qryHstNovoINSS.FieldByName('VALOROP1').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORBASE1').AsFloat)));   // SOL 192563 KINTANA 1877175
              //qryHstNovoINSS.FieldByName('VALOROP2').AsFloat       := qryBeneficiarios.FieldByName('VALORBASE2').AsFloat;   // SOL 192563 KINTANA 1877175
              qryHstNovoINSS.FieldByName('VALOROP2').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORBASE2').AsFloat)));  // SOL 192563 KINTANA 1877175
              //qryHstNovoINSS.FieldByName('VALOROP3').AsFloat       := qryBeneficiarios.FieldByName('VALORBASE3').AsFloat;   // SOL 192563 KINTANA 1877175
              qryHstNovoINSS.FieldByName('VALOROP3').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORBASE3').AsFloat))); // SOL 192563 KINTANA 1877175
              //qryHstNovoINSS.FieldByName('VALORSRB').AsFloat       := qryBeneficiarios.FieldByName('VALORSRB').AsFloat; // SOL 192563 KINTANA 1877175
              qryHstNovoINSS.FieldByName('VALORSRB').AsFloat       := StrToFloat(ClienteNumero(FormatFloat('#0.00',qryBeneficiarios.FieldByName('VALORSRB').AsFloat)));   // SOL 192563 KINTANA 1877175
              qryHstNovoINSS.FieldByName('FONTEPAGADORA').AsString := sFontePagadora; // SOL 159974 KINTANA 1327873
              qryHstNovoINSS.Post;
              //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
               Except
                on e:Exception do
                begin
                  TratarErro(e.Message);
                end;
               end;
               //Brunno Mattos - KTN 767861 - SOL 132659 Fim
           end;
        end;


        qryBeneficiarios.Edit;
        //qryBeneficiarios.FieldByName('ValorAtual').AsFloat     := rValorIntegralBfciario;  // SOL 192563 KINTANA 1877175
        qryBeneficiarios.FieldByName('ValorAtual').AsFloat     := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorIntegralBfciario)));    // SOL 192563 KINTANA 1877175
        //CmDebugToFile(' ValorAtual '+ FloattoStr(rValorIntegralBfciario) ,'C:\debug desdobramento.txt');
        //qryBeneficiarios.FieldByName('ValorCalculado').AsFloat := rValorIntegralBfciario;      // SOL 192563 KINTANA 1877175
        qryBeneficiarios.FieldByName('ValorCalculado').AsFloat := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorIntegralBfciario))); // SOL 192563 KINTANA 1877175
        //CmDebugToFile(' ValorCalculado '+ FloattoStr(rValorIntegralBfciario) ,'C:\debug desdobramento.txt');
        //qryBeneficiarios.FieldByName('ValorTotal').AsFloat     := dVlrBenefReajustado;       // SOL 192563 KINTANA 1877175
        qryBeneficiarios.FieldByName('ValorTotal').AsFloat     := StrToFloat(ClienteNumero(FormatFloat('#0.00',dVlrBenefReajustado)));    // SOL 192563 KINTANA 1877175
        //CmDebugToFile(' ValorTotal '+ FloattoStr(dVlrBenefReajustado) ,'C:\debug desdobramento.txt');

        // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
        qryBeneficiarios.FieldByName('VLRBSTOTAL').AsString     := sVlrBSReajustado;
        qryBeneficiarios.FieldByName('VLRBSATUAL').AsString     := sValorIntegralBfciarioBS;
        qryBeneficiarios.FieldByName('VLRFABTOTAL').AsString    := sVlrFABReajustado;
        qryBeneficiarios.FieldByName('VLRFABATUAL').AsString    := sValorIntegralBfciarioFAB;
        qryBeneficiarios.FieldByName('VLRBASEDEFICIT').AsString := sValorIntegralBfciarioDeficit;
        // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim


        If rValorFinalBfciario = 0 Then Begin
          qryHstBenefPagos.Delete;
        End;

        qryBeneficiarios.Post;
        qryBeneficiarios.Next;

     end; // while

     qryBeneficiarios.EnableControls;
     sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));

     if bProRata then begin
        rValorBeneficioNoMes := rValorIntegral;
        //CmDebugToFile(' bProRata '+ FloattoStr(rValorIntegral) ,'C:\debug desdobramento.txt');
        // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
        sValorNoMesBS      := sValorIntegralBS;
        sValorNoMesFAB     := sValorIntegralFAB;
        sValorNoMesDeficit := sValorIntegralDeficit;
        // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim
     end;


  end; // while (sAnoMesAtual <= sAnoMesFinal) do

  // Andre Imakawa - SIG 70825 - Inicio
  if bPossuiAbono then
  begin
    If qryHstBenefPagos.Locate('MESREFERENCIA;IDPESSOA',varArrayOf([Copy(sAnoMesAtual,1,4)+'/13', qryBeneficiarios.FieldByName('IdPessoa').AsInteger ]),[loCaseInsensitive]) then
      begin
         if qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat = 0 then
         begin
           qryHstBenefPagos.delete;
         end;
      end;
  end;
  // Andre Imakawa - SIG 70825 - Fim

  qryBenefBfciario.First;
  while not qryBenefBfciario.Eof do
  begin

     if prmIdRegraContabBenefIndiv > 0 then
     begin
        //a regra será executada para cada campo com possibilidade de
        //parametrização individual automática
        //a regra é única e o tipo de campo a ser retornada é informado através
        //do campo de nome "CAMPO" na query
        //caso não haja parametrização individual para determinado caso, a regra deve retornar "0" (zero)

        sFlgFitEspecial := '0';


        { Verifica se participante possui migração de plano }
        If PossuiMigracao(qryBenefBfciario.fieldbyname('IDTITULAR').AsInteger,
                          qryBenefBfciario.fieldbyname('IDPLANOPREV').AsInteger,
                          dbedDtEvento.text) Then Begin
          sFlgMigrado :=  '1';
        End Else Begin
          sFlgMigrado :=  '0';
        End;


        sSQL := 'SELECT  '+qryBenefBfciario.fieldbyname('IDPESSOA').AsString+' AS IDPESSOA ,'+
                ' '+qryBenefBfciario.fieldbyname('IDTITULAR').AsString+' AS IDTITULAR ,'+
                ' '+qryBenefBfciario.fieldbyname('IDPLANOPREV').AsString+' AS IDPLANOPREV ,'+
                ' '+qryBenefBfciario.fieldbyname('IDBENEFICIO').AsString+' AS IDBENEFICIO , '+
                ' '+IntToStr(iIdSitPlanoPrev)  +' AS IDSITPLANOPREV,   '+
                ' '+sFlgFitEspecial+' AS FLGFITESPECIAL, '+sFlgMigrado+' AS FLGMIGRADO ';


        //IDPLANPREVCONTAB
        sResult := RegraString( inttostr(prmIdRegraContabBenefIndiv),
                               sSQL+', ''IDPLANPREVCONTAB'' AS CAMPO FROM DUAL',
                               bErro, iIdCalculo );

        if bErro then
        begin
           MsgDlg('Erro na regra para atribuição automática de entidade contábil.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Abort;
        end;


        if  trim(sResult) = '' then
        begin
           MsgDlg('Erro na regra para atribuição automática de entidade contábil. Resultado nulo.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Abort;
        end;


        if trim(sResult) <> '0' then
        begin
           //testa validade da informação
           qryaux.close;
           qryaux.sql.text := '  SELECT * FROM  PLANPREVCONTABIL '+
                              '  WHERE IDPLANOPREV = '+sResult    +
                              '  AND   NVL(ATIVO,''S'') = ''S''   ';
           qryaux.open;

           if qryaux.isempty then
           begin
              MsgDlg('['+inttostr(prmIdRegraContabBenefIndiv)+'] - Regra para atribuição automática de entidade contábil. Resultado inválido: '+sResult+'.','Erro',mtError,[mbOk],0);
              TiraSQL(qryAux);
              Abort;
           end;

           sIDPLANPREVCONTAB := trim(sResult);
        end;
        //FIM - IDPLANPREVCONTAB

        //PLACONTAD
        sResult := RegraString( inttostr(prmIdRegraContabBenefIndiv),
                               sSQL+', ''PLACONTAD'' AS CAMPO FROM DUAL',
                               bErro, iIdCalculo );


        if bErro then
        begin
           MsgDlg('Erro na regra para atribuição automática de conta para débito.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Abort;
        end;


        if  trim(sResult) = '' then
        begin
           MsgDlg('Erro na regra para atribuição automática de conta para débito. Resultado nulo.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Abort;
        end;

        if trim(sResult) <> '0' then
        begin
           //testa validade da informação
           qryaux.close;
           qryaux.sql.text := '  SELECT 1 FROM  PLANOCONTA  '+
                              '  WHERE PLACONTA = '+sResult+' ';
           qryaux.open;

           if qryaux.isempty then
           begin
              MsgDlg('['+inttostr(prmIdRegraContabBenefIndiv)+'] - Regra para atribuição automática de conta para débito. Resultado inválido: '+sResult+'.','Erro',mtError,[mbOk],0);
              TiraSQL(qryAux);
              Abort;
           end;

           sPLACONTAD := trim(sResult);

        end;
        //FIM - PLACONTAD

        //PLACONTAC
        sResult := RegraString( inttostr(prmIdRegraContabBenefIndiv),
                               sSQL+', ''PLACONTAC'' AS CAMPO FROM DUAL',
                               bErro, iIdCalculo );


        if bErro then
        begin
           MsgDlg('Erro na regra para atribuição automática de conta para crédito.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Abort;
        end;


        if  trim(sResult) = '' then
        begin
           MsgDlg('Erro na regra para atribuição automática de conta para crédito. Resultado nulo.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Abort;
        end;


        if trim(sResult) <> '0' then
        begin
           //testa validade da informação
           qryaux.close;
           qryaux.sql.text := '  SELECT 1 FROM  PLANOCONTA  '+
                              '  WHERE PLACONTA = '+sResult+' ';
           qryaux.open;

           if qryaux.isempty then
           begin
              MsgDlg('['+inttostr(prmIdRegraContabBenefIndiv)+'] - Regra para atribuição automática de conta para crédito. Resultado inválido: '+sResult+'.','Erro',mtError,[mbOk],0);
              TiraSQL(qryAux);
              Abort;
           end;


           sPLACONTAC := trim(sResult);
        end;
        //FIM - PLACONTAC

     end;

     //SOL 253577-18114 PPM 1292515 17/02/2016 Comentado para trabalhar com applyupdates
     //sSQLValues := qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsString; //SOL 253577-18114 PPM 1292515 17/02/2016
     sSQLValues := IntToStr(iNumeroProcessoNovo); //SOL 253577-18114 PPM 1292515 17/02/2016
     sSQLValues := sSQLValues + ','+qryBenefBfciario.FieldByName('IDPLANOPREV').AsString;
     //BRUNO AZEVEDO
     sSQLValues := sSQLValues + ','+qryBenefBfciario.FieldByName('IDPLANOPREV').AsString;
     //sSQLValues := sSQLValues + ','+BuscaPlanoOrigem( iIdPessJur, iIdTitular, sAnoMesPagamento,
     //                                                qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger);
     //BRUNO AZEVEDO
     sSQLValues := sSQLValues + ','+qryBenefBfciario.FieldByName('IDTITULAR').AsString;
     sSQLValues := sSQLValues + ','+qryBenefBfciario.FieldByName('IDPESSJUR').AsString;
     sSQLValues := sSQLValues + ','+qryBenefBfciario.FieldByName('IDPESSOA').AsString;
     sSQLValues := sSQLValues + ','+qryBenefBfciario.FieldByName('SEQPROPOSTA').AsString;
     if Trim(qryBenefBfciario.FieldByName('IDDEPENDENCIA').AsString) <> ''
     then sSQLValues := sSQLValues + ','''+qryBenefBfciario.FieldByName('IDDEPENDENCIA').AsString+''''
     else sSQLValues := sSQLValues + ', NULL';
///douglas.siqueira SOL 171026 KITANTA 1528962
    if  sFontePagadora = '2' then begin // SOL 202689 Kintana 1958612
       if _sFlgPagaInss = '0' then
          //   if sFontePagadora = '2' then
          sSQLValues := sSQLValues + ', 2 ' // Douglas.Siqueira
       else
          sSQLValues := sSQLValues + ', 1 ';
    end
    else
       sSQLValues := sSQLValues + ', 1 ';  // SOL 202689 Kintana 1958612
///douglas.siqueira SOL 171026 KITANTA 1528962

     if Trim(qryBenefBfciario.FieldByName('DATAFINAL').AsString) <> ''
     then sSQLValues := sSQLValues + ', TO_DATE('''+qryBenefBfciario.FieldByName('DATAFINAL').AsString+''', ''DD/MM/YYYY'') '
     else sSQLValues := sSQLValues + ', NULL';
     sSQLValues := sSQLValues + ','+OraNumero(qryBenefBfciario.FieldByName('VALORATUAL').AsString);

     if Trim(qryBenefBfciario.FieldByName('DATAINICIO').AsString) <> ''
     then sSQLValues := sSQLValues + ',TO_DATE('''+qryBenefBfciario.FieldByName('DATAINICIO').AsString+''', ''DD/MM/YYYY'') '
     else sSQLValues := sSQLValues + ', NULL';

     sSQLValues := sSQLValues + ','''+qryBenefBfciario.FieldByName('FLGFORMAPAGTO').AsString+'''';
     sSQLValues := sSQLValues + ','+qryBenefBfciario.FieldByName('IDBENEFICIO').AsString;
     sSQLValues := sSQLValues + ','+qryBenefBfciario.FieldByName('IDTPPAGTOBENEFIC').AsString;

     if Trim(qryBenefBfciario.FieldByName('DATAREQUERIMENTO').AsString) <> ''
     then sSQLValues := sSQLValues + ',TO_DATE('''+qryBenefBfciario.FieldByName('DATAREQUERIMENTO').AsString+''', ''DD/MM/YYYY'') '
     else sSQLValues := sSQLValues + ', NULL';

     sSQLValues := sSQLValues + ','+OraNumero(qryBenefBfciario.FieldByName('VALORCALCULADO').AsString);
     sSQLValues := sSQLValues + ','+IntToStr(qryBenefBfciario.FieldByName('FLGBENEFMIN').AsInteger);
     sSQLValues := sSQLValues + ','+OraNumero(qryBenefBfciario.FieldByName('VALORCOTAS').AsString);
     sSQLValues := sSQLValues + ','+OraNumero(qryBenefBfciario.FieldByName('VALORTOTAL').AsString);

     // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
     sSQLValues := sSQLValues + ','+iif(qryBenefBfciario.FieldByName('FABDIB').AsString = '', ' NULL', OraNumero(qryBenefBfciario.FieldByName('FABDIB').AsString));
     sSQLValues := sSQLValues + ','+iif(qryBenefBfciario.FieldByName('FABDIB').AsString = '', ' NULL', OraNumero(qryBenefBfciario.FieldByName('BSDIB').AsString));
     sSQLValues := sSQLValues + ','+iif(qryBenefBfciario.FieldByName('VLRBASEDEFICIT').AsString = '', ' NULL', OraNumero(qryBenefBfciario.FieldByName('VLRBASEDEFICIT').AsString));
     sSQLValues := sSQLValues + ','+iif(qryBenefBfciario.FieldByName('VLRFABATUAL').AsString = '', ' NULL', OraNumero(qryBenefBfciario.FieldByName('VLRFABATUAL').AsString));
     sSQLValues := sSQLValues + ','+iif(qryBenefBfciario.FieldByName('VLRFABTOTAL').AsString = '', ' NULL', OraNumero(qryBenefBfciario.FieldByName('VLRFABTOTAL').AsString));
     sSQLValues := sSQLValues + ','+iif(qryBenefBfciario.FieldByName('VLRBSATUAL').AsString = '', ' NULL', OraNumero(qryBenefBfciario.FieldByName('VLRBSATUAL').AsString));
     sSQLValues := sSQLValues + ','+iif(qryBenefBfciario.FieldByName('VLRBSTOTAL').AsString = '', ' NULL', OraNumero(qryBenefBfciario.FieldByName('VLRBSTOTAL').AsString));
     // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

     sSQLValues := sSQLValues + ','+iif(qryBenefBfciario.FieldByName('IDPERFILINVEST').AsString = '', ' NULL', qryBenefBfciario.FieldByName('IDPERFILINVEST').AsString);   //edilaine - SIG55933

     sSQLValues := sSQLValues + ',TO_DATE('''+DateToStr(date)+''', ''DD/MM/YYYY'') ';

     sSQLValues := sSQLValues + ','+OraNumero(qryBenefBfciario.FieldByName('VLRCALCINSS').AsString);
     sSQLValues := sSQLValues + ','+OraNumero(qryBenefBfciario.FieldByName('VLRINFINSS').AsString);

     if Trim(qryBenefBfciario.FieldByName('DATAINICIOINSS').AsString) <> ''
     then sSQLValues := sSQLValues + ',TO_DATE('''+qryBenefBfciario.FieldByName('DATAINICIOINSS').AsString+''', ''DD/MM/YYYY'') '
     else sSQLValues := sSQLValues + ', NULL';

     if Trim(qryBenefBfciario.FieldByName('NUMPROCINSS').AsString) <> ''
     then sSQLValues := sSQLValues + ','''+qryBenefBfciario.FieldByName('NUMPROCINSS').AsString+ ''''
     else sSQLValues := sSQLValues + ', NULL';

     if Trim(qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString) <> ''
     then sSQLValues := sSQLValues + ',TO_DATE('''+qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString+''', ''DD/MM/YYYY'') '
     else sSQLValues := sSQLValues + ', NULL';

     sSQLValues := sSQLValues + ', '''+sAnoMesPagamento+'''';

     sSQLValues := sSQLValues + ', '''+sPLACONTAC+''', '''+sIDPLANPREVCONTAB+''', '''+sPLACONTAD+''' ';

     sSQLValues := sSQLValues + ', '''+sFontePagadora+''' '; // SOL 159974 KINTANA 1327873

     sSQLValues := sSQLValues + ', '''+sDtDIBAnterior+''' ';

     //BRUNO AZEVEDO
     //sSQLValues := sSQLValues + ','+OraNumero(qryBenefBfciario.FieldByName('VALORTOTAL').AsString);  //SOL 253577-18114  PPM 1292515
     sSQLValues := sSQLValues + ','+OraNumero(qryBenefBfciario.FieldByName('VALORNADIB').AsString); //SOL 253577-18114  PPM 1292515


     sSQLValues := sSQLValues + ','+OraNumero(qryBenefBfciario.FieldByName('FLGPAGAINSS').AsString);///douglas.siqueira SOL 171026 KITANTA 1528962
      //SOL 253577-18114 PPM 1292515 17/02/2016 Comentado para trabalhar com applyupdates


     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' INSERT INTO BENEFBFCIARIO '+
             ' (NUMEROPROCESSO,     IDPLANOPREV,      IDPLANOORIGEM,    IDTITULAR,      IDPESSJUR, '+
             '  IDPESSOA,           SEQPROPOSTA,      IDDEPENDENCIA,  IDSITBENEFICIO, '+
             '  DATAFINAL,          VALORATUAL,       DATAINICIO,     FLGFORMAPAGTO, '+
             '  IDBENEFICIO,        IDTPPAGTOBENEFIC, DATAREQUERIMENTO, '+
             '  VALORCALCULADO,     FLGBENEFMIN,      VALORCOTAS,     VALORTOTAL, '+
             '  FABDIB, BSDIB, VLRBASEDEFICIT, VLRFABATUAL, VLRFABTOTAL, VLRBSATUAL, VLRBSTOTAL, '+  // fernando xavier - SOL 253577-17664 / PPM 1019932
             '  IDPERFILINVEST, '+     // edilaine - SIG55933
             '  DATACONCESSAO,      VLRCALCINSS,      VLRINFINSS,     DATAINICIOINSS,   '+
             '  NUMPROCINSS,        DATAINICIOFUND,   ULTMESPREPARO, PLACONTAC, IDPLANPREVCONTAB, PLACONTAD, FONTEPAGADORA, DIBBENEFANT, VALORNADIB, FLGPAGAINSS)  '+///DOUGLAS.SIQUEIRA
             ' VALUES ('+sSQLValues+')');

     try
       qryAux.ExecSQL;
     except
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Erro ao incluir o benefício no processo. ','Erro',mtError,[mbOk,mbHelp],0);
        TiraSQL(qryAux);
        Exit;
     end;

     // Andre Imakawa - SIG 50047 - Inicio
     if strtoint(sIdTpPagtoBenefic) = 1 then
     begin
       //CmDebugToFile('  incluir o benefício no processo ' ,'C:\debug desdobramento.txt');
       // Marcio spinosa 182092/14207 15207 15253 KITANTA 1969056
       if not (GravaHstPercGrupo(qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                 StrToInt(sFontePagadora),
                                 qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                 qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                 qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                 qryBenefBfciario.FieldByName('SEQPROPOSTA').AsInteger,
                                 'E',
                                 strtodate(sDataInicio)
                                )) then
       begin
       //      sMsgErro := True;
         sMsgErro := 'Erro na gravação do histórico do percentual por grupo. ';
         Exit;
       end;
       // Marcio spinosa 182092/14207 15207 15253 KITANTA 1969056
     end;
     // Andre Imakawa - SIG 50047 - Fim
     //CmDebugToFile('  CriaLogOcorrencia Pessoa '+qryBenefBfciario.fieldbyname('idpessoa').asstring+' Processo '+IntToStr(iNumeroProcessoNovo) ,'C:\debug desdobramento.txt');
     CriaLogOcorrencia(qryBenefBfciario.fieldbyname('idplanoprev').asstring,
                       qryBenefBfciario.fieldbyname('idpessjur').asstring,
                       qryBenefBfciario.fieldbyname('idtitular').asstring,
                       qryBenefBfciario.fieldbyname('idbeneficio').asstring,
                       //qryBenefBfciario.fieldbyname('numeroprocesso').asstring, //SOL 253577-18114 PPM 1292515 17/02/2016
                       IntToStr(iNumeroProcessoNovo), //SOL 253577-18114 PPM 1292515 17/02/2016
                       qryBenefBfciario.fieldbyname('idpessoa').asstring,
                       qryBeneficiarios.fieldbyname('seqproposta').asstring,
                       '5',
                       DateToStr(date),
                       floattostr(qryBenefBfciario.fieldbyname('valoratual').asfloat),
                       floattostr(qryBenefBfciario.fieldbyname('valortotal').asfloat),
                       floattostr(qryBenefBfciario.fieldbyname('valorcotas').asfloat),
                       qryBenefBfciario.fieldbyname('datainicio').asstring,
                       qryBenefBfciario.fieldbyname('datafinal').asstring,
                       floattostr(qryBenefBfciario.fieldbyname('valoratual').asfloat),
                       qryBenefBfciario.fieldbyname('datainicio').asstring,
                       qryBenefBfciario.fieldbyname('datafinal').asstring,
                       '5', 0,
                       qryAux, '',
                       iIdLoteConcessao,
                       iIdCalculo );

     qryBenefBfciario.Next;
  end;

  //CmDebugToFile('  CriaLogOcorrencia Pessoa '+qryHstBenefPagos.fieldbyname('idpessoa').asstring+' Processo '+qryHstBenefPagos.fieldbyname('numeroprocesso').asstring ,'C:\debug desdobramento.txt');
  CriaLogOcorrencia(qryBenefBfciario.fieldbyname('idplanoprev').asstring,
                    qryBenefBfciario.fieldbyname('idpessjur').asstring,
                    qryBenefBfciario.fieldbyname('idtitular').asstring,
                    qryBenefBfciario.fieldbyname('idbeneficio').asstring,
                    //qryHstBenefPagos.fieldbyname('numeroprocesso').asstring, //SOL 253577-18114 PPM 1292515 17/02/2016
                    IntToStr(iNumeroProcesso), //SOL 253577-18114 PPM 1292515 17/02/2016
                    qryHstBenefPagos.fieldbyname('idpessoa').asstring,
                    qryBeneficiarios.fieldbyname('seqproposta').asstring,
                    '5',
                    DateToStr(date),
                    floattostr(qryBenefBfciario.fieldbyname('valoratual').asfloat),
                    floattostr(qryBenefBfciario.fieldbyname('valortotal').asfloat),
                    floattostr(qryBenefBfciario.fieldbyname('valorcotas').asfloat),
                    qryBenefBfciario.fieldbyname('datainicio').asstring,
                    qryBenefBfciario.fieldbyname('datafinal').asstring,
                    floattostr(qryBenefBfciario.fieldbyname('valoratual').asfloat),
                    qryBenefBfciario.fieldbyname('datainicio').asstring,
                    qryBenefBfciario.fieldbyname('datafinal').asstring,
                    '5', 0,
                    qryAux, '',
                    iIdLoteConcessao,
                    iIdCalculo );




  if not TrataBeneficioPosMorte( iNumeroProcessoNovo, //SOL 253577-18114 PPM 1292515 17/02/2016
                                iIdPessJur,
                                iIdPlanoPrev,
                                iIdTitular,
                                iSeqProposta,
                                3057,
                                iNumBenef, iIdLoteConcessao,
                                qryProcesso.FieldbyName('DTEVENTO').AsString,
                                sDataPagamento  )
  then begin
    dtmBaseDados.dbBaseDados.RollBack;
    MsgDlg('Erro ao tratar Beneficio Pós-Morte','Erro',mtError,[mbOk,mbHelp],0);
    TiraSQL(qryAux);
    Exit;
  end;

  //SOL 253577-18114 PPM 1292515 17/02/2016
  {if not TrataAtrasoDevolContribPosMorte( iNumeroProcessoNovo,//SOL 253577-18114 PPM 1292515 17/02/2016
                                          iIdPessJur,
                                          iIdPlanoPrev,
                                          iIdTitular,
                                          iIdPessoa,//William Moreira da Silva - SOL 213329
                                          iSeqProposta,
                                          3057,
                                          iNumBenef, iIdLoteConcessao,
                                          qryProcesso.FieldbyName('DTEVENTO').AsString,
                                          sDataPagamento  )
  then begin
    dtmBaseDados.dbBaseDados.RollBack;
    MsgDlg('Erro ao tratar Contribuição Pós-Morte','Erro',mtError,[mbOk,mbHelp],0);
    TiraSQL(qryAux);
    Exit;
  end;}
  //SOL 253577-18114 PPM 1292515 17/02/2016


  // Atualizar ValorAtual, ValorTotal e ValorCalculado dos beneficiarios
  // que já existiam
  { // edilaine - SOL 253577-17664 / PPM 1019932 - comentado inicio
  with qryBeneficiarios do
  begin
      First;
      while not Eof do begin
         // Tratamento caso beneficio incluido termine antes da data atual.
         // Valores atuais estão corretos e devem continuar
         If sAnoMesFinal < FieldByName('ULTMESPREPARO').AsString Then Begin
           // Voltar valores antigos
           Edit;
           FieldByName('VALORATUAL').AsFloat := FieldByName('VALORATUAL').OldValue;
           FieldByName('VALORTOTAL').AsFloat := FieldByName('VALORTOTAL').OldValue;
           FieldByName('VALORCALCULADO').AsFloat := FieldByName('VALORCALCULADO').OldValue;

           // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
           FieldByName('VLRBASEDEFICIT').Value := FieldByName('VLRBASEDEFICIT').OldValue;
           FieldByName('VLRFABATUAL').Value    := FieldByName('VLRFABATUAL').OldValue;
           FieldByName('VLRFABTOTAL').Value    := FieldByName('VLRFABTOTAL').OldValue;
           FieldByName('VLRBSATUAL').Value     := FieldByName('VLRBSATUAL').OldValue;
           FieldByName('VLRBSTOTAL').Value     := FieldByName('VLRBSTOTAL').OldValue;
           // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

           Post;

           qryBeneficiarios.Next;
           Continue;
         End;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE BENEFBFCIARIO '+
                        //' SET VALORATUAL     = '+OraNumero(FieldByName('ValorAtual').AsString)+','+
                        ' SET VALORATUAL     = '+OraNumero(FormatFloat('#0.00',FieldByName('ValorAtual').AsFloat))+','+
                        //'     VALORCALCULADO = '+OraNumero(FieldByName('ValorCalculado').AsString)+','+
                        '     VALORCALCULADO = '+OraNumero(FormatFloat('#0.00',FieldByName('ValorCalculado').AsFloat))+','+
                        // '     VALORTOTAL     = '+OraNumero(FieldByName('ValorTotal').AsString)+',' +
                        '     VALORTOTAL     = '+OraNumero(FormatFloat('#0.00',FieldByName('ValorTotal').AsFloat))+',' +

                        // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
                        '     VLRBASEDEFICIT  = '+iif(FieldByName('VLRBASEDEFICIT').AsString = '', 'NULL', OraNumero(FormatFloat('#0.00',FieldByName('VLRBASEDEFICIT').AsFloat)))+',' +
                        '     VLRFABATUAL     = '+iif(FieldByName('VLRFABATUAL').AsString = '', 'NULL', OraNumero(FormatFloat('#0.00',FieldByName('VLRFABATUAL').AsFloat)))+',' +
                        '     VLRFABTOTAL     = '+iif(FieldByName('VLRFABTOTAL').AsString = '', 'NULL', OraNumero(FormatFloat('#0.00',FieldByName('VLRFABTOTAL').AsFloat)))+',' +
                        '     VLRBSATUAL      = '+iif(FieldByName('VLRBSATUAL').AsString = '', 'NULL', OraNumero(FormatFloat('#0.00',FieldByName('VLRBSATUAL').AsFloat)))+',' +
                        '     VLRBSTOTAL      = '+iif(FieldByName('VLRBSTOTAL').AsString = '', 'NULL', OraNumero(FormatFloat('#0.00',FieldByName('VLRBSTOTAL').AsFloat)))+',' +
                        // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

                        '     ULTMESPREPARO  = '''+sAnoMesPagamento+''''+
                        ' WHERE NUMEROPROCESSO = '+FieldByName('NumeroProcesso').AsString+
                        ' AND   IDPESSJUR      = '+FieldByName('IDPESSJUR').AsString+
                        ' AND   IDPLANOPREV    = '+FieldByName('IDPLANOPREV').AsString+
                        ' AND   IDTITULAR      = '+FieldByName('IDTITULAR').AsString+
                        ' AND   IDPESSOA       = '+FieldByName('IDPESSOA').AsString+
                        ' AND   SEQPROPOSTA    = '+FieldByName('SEQPROPOSTA').AsString+
                        ' AND   IDBENEFICIO    = '+FieldByName('IDBENEFICIO').AsString);

         try
           qryAux.ExecSQL;
         except
            dtmBaseDados.dbBaseDados.RollBack;
            MsgDlg('Erro ao atualizar dados dos beneficiários já existentes.','Erro',mtError,[mbOk,mbHelp],0);
            TiraSQL(qryAux);
            Exit;
         end;

         Next;
      end; // while

  end; // with
  } // edilaine - SOL 253577-17664 / PPM 1019932 - comentado fim

  frmAguarde.Mostra('Atualizando Histórico de Benefício ... ');

  //exit;

  qryHstBenefPagos.First;
  sMesAnterior      := ''; //BRUNO AZEVEDO SOL 136412/4121
  sIdPessoaAnterior := '';
  while not qryHstBenefPagos.Eof do
  begin
     If (qryHstBenefPagos.FieldByName('MESREFERENCIA').AsString > sAnoMesFinal) and
         (Copy(qryHstBenefPagos.FieldByName('MESREFERENCIA').AsString,6,2) <> '13')
     Then Begin
       qryHstBenefPagos.Next;
       Continue;
     End;

     // edilaine - SOL 253577-17664 / PPM 1019932 - inicio
     iFlgEnviado := 0;
     qryBenefBfciario.first;
     qryBeneficiarios.locate('IDPESSOA', qryHstBenefPagos.FieldByName('IDPESSOA').AsInteger, [loCaseInsensitive]);
     if (qryBeneficiarios.fieldbyname('idsitbeneficio').AsInteger = 2) then
        iFlgEnviado := qryHstBenefPagos.FieldByName('FLGENVIADO').AsInteger;
     // edilaine - SOL 253577-17664 / PPM 1019932 - fim


     // Se o beneficio nao foi pago (só foi preparada)
     // Entao atualizar o valor previsto no historico
     // Senao Se o valor pago for maior que o novo valor
     //       Entao pedir uma devolucao da diferença
     // Se o beneficio não foi pago mas está retido e fora do convenio, se o valor for pago maior, lancar diferença  { edilaine - SOL 253577-17664 / PPM 1019932 }
     if (qryBeneficiarios.fieldbyname('idsitbeneficio').AsInteger = 2) and (iFlgEnviado = 8) then    // edilaine - SOL 253577-17664 / PPM 1019932 - inicio
     begin

       if qryHstBenefPagos.FieldByName('VALORPREV').AsFloat = 0 then
       // Andre Imakawa - SIG 51392 - Inicio
       begin
          rDiferenca := qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat;
          sTipo := 'A';
       end
       else
       begin
          rDiferenca := qryHstBenefPagos.FieldByName('VALORPREV').AsFloat - qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat;
          sTipo := 'D';
       end;
       // Andre Imakawa - SIG 51392 - Fim

       //CmDebugToFile(' VALORPREV 0 calcula valor prev menos novo valor se não pega valorprev: '+qryHstBenefPagos.FieldByName('VALORPREV').AsString+ ' Novo Valor: '+qryHstBenefPagos.FieldByName('NOVOVALOR').AsString ,'C:\debug desdobramento.txt');
       //CmDebugToFile(' rDiferenca '+FloattoStr(rDiferenca) ,'C:\debug desdobramento.txt');
       rDiferenca := StrToFloat(TruncaRound(FloatToStr(rDiferenca),2));

       if ((qryHstBenefPagos.FieldByName('MESREFERENCIA').AsString <> sMesAnterior) or
           (qryHstBenefPagos.FieldByName('IDPESSOA').AsString <> sIdPessoaAnterior)) then begin
         //if not AcertaBeneficio(qryAux, 'D','F',iIdPessJur, // Andre Imakawa - SIG 51392
         if not AcertaBeneficio(qryAux, sTipo,'F',iIdPessJur, // Andre Imakawa - SIG 51392
                                 iIdPlanoPrev,
                                 iIdTitular,
                                 iSeqProposta,
                                 qryHstBenefPagos.FieldByName('IdPessoa').AsInteger,
                                 //iNumeroProcesso,
                                 qryHstBenefPagos.FieldByName('numeroprocesso').AsInteger
                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                 qryBeneficio.FieldByName('CODPORTFORMA').AsInteger,
                                 qryBeneficio.FieldByName('Nome').AsString,
                                 qryHstBenefPagos.FieldByName('MesReferencia').AsString,
                                 rDiferenca,iIdLoteConcessao,
                                 rDiferenca,
                                 qryHstBenefPagos.FieldByName('VALORTOTAL').AsFloat,
                                 0,
                                 5, '',
                                 qryHstBenefPagos.FieldByName('VALORBS').AsString,
                                 qryHstBenefPagos.FieldByName('VALORFAB').AsString,
                                 qryHstBenefPagos.FieldByName('VLRBASEDEFICIT').AsString,
                                 iFlgEnviado,
                                 qryHstBenefPagos.FieldByName('IDPERFILINVEST').AsInteger    //edilaine - SIG55933
                                )

         then begin
            dtmBaseDados.dbBaseDados.RollBack;
            MsgDlg('Erro ao pedir devolução dos benefícios pagos a maior.  ','Erro',mtError,[mbOk,mbHelp],0);
            frmAguarde.Apaga;
            TiraSQL(qryAux);
            Exit;
         end;
         sMesAnterior      := qryHstBenefPagos.FieldByName('MESREFERENCIA').AsString;
         sIdPessoaAnterior := qryHstBenefPagos.FieldByName('IDPESSOA').AsString;
       end;


     end
     else   // edilaine - SOL 253577-17664 / PPM 1019932 - fim
     if (qryHstBenefPagos.FieldByName('VLBENEFPGTO').AsFloat <= 0) 
     then begin
        if (qryHstBenefPagos.FieldByName('VALORPREV').AsFloat   > 0) then begin
           with qryAux do
           begin
              sDataPagamento := selecionaDataPagamento(inttostr(iIdLoteConcessao));     //Rafael SIG 94938
              Close;
              SQL.Clear;

              SQL.Add(' UPDATE HSTBENEFBFCIARIO SET VALORPREV     = '+OraNumero(qryHstBenefPagos.FieldByName('NOVOVALOR').AsString)    +','+
                      '                             VALORTOTAL    = '+OraNumero(qryHstBenefPagos.FieldByName('VALORTOTAL').AsString)   +','+

                                                    // fernando xavier - SOL 253577-17664 / PPM 1019932 - inicio
                      '                             VALORBS        = '+iif(qryHstBenefPagos.FieldByName('VALORBS').AsString = '', 'NULL', OraNumero(qryHstBenefPagos.FieldByName('VALORBS').AsString))  +','+
                      '                             VALORFAB       = '+iif(qryHstBenefPagos.FieldByName('VALORFAB').AsString = '', 'NULL', OraNumero(qryHstBenefPagos.FieldByName('VALORFAB').AsString))   +','+
                      '                             VLRBASEDEFICIT = '+iif(qryHstBenefPagos.FieldByName('VLRBASEDEFICIT').AsString = '', 'NULL', OraNumero(qryHstBenefPagos.FieldByName('VLRBASEDEFICIT').AsString))  +','+
                                                    // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

                      '                             VALORINTEGRAL = '+OraNumero(qryHstBenefPagos.FieldByName('VALORINTEGRAL').AsString)+','+
//                      '                             DATAPAGAMENTO = TO_DATE('''+qryHstBenefPagos.FieldByName('DATAPAGAMENTO').AsString+''',''DD/MM/YYYY''), '+  //Rafael SIG 94938
                      '                             DATAPAGAMENTO = '''+sDataPagamento+ ''','+            //Rafael   SIG 94938
                      '                             IDLOTE = '+IntToStr(iIdLoteConcessao)+
                      ' WHERE (IDPESSJUR        = '+qryHstBenefPagos.FieldByName('IDPESSJUR').AsString+')'+
                      ' AND   (IDTITULAR        = '+qryHstBenefPagos.FieldByName('IDTITULAR').AsString+')'+
                      ' AND   (IDPLANOPREV      = '+qryHstBenefPagos.FieldByName('IDPLANOPREV').AsString+')'+
                      ' AND   (MES              = '''+sAnoMesPagamento+''')'+
                      //' AND   (IDMOTIVO         = '+IntToStr(3057)+')'+
                      //' AND   (MES              = '''+qryHstBenefPagos.FieldByName('MES').AsString+''')'+
                      //' AND   (IDMOTIVO         = '+qryHstBenefPagos.FieldByName('IDMOTIVO').AsString+')'+
                      ' AND   (NUMEROPROCESSO   = '+qryHstBenefPagos.FieldByName('NUMEROPROCESSO').AsString+')'+
                      ' AND   (IDBENEFICIO      = '+qryHstBenefPagos.FieldByName('IDBENEFICIO').AsString+')'+
                      ' AND   (IDPESSOA         = '+qryHstBenefPagos.FieldByName('IDPESSOA').AsString+')'+
                      ' AND   (MESREFERENCIA    = '''+qryHstBenefPagos.FieldByName('MESREFERENCIA').AsString+''')'+
                      ' AND   (SEQPROPOSTA      = '+qryHstBenefPagos.FieldByName('SEQPROPOSTA').AsString+')'+
                      ' AND   (SEQBENEFICIO     = 1)');

             try
               ExecSQL;
             except
             //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
              on e:Exception do
              begin
                TratarErro(e.Message);
                   dtmBaseDados.dbBaseDados.RollBack;
                   MsgDlg('Erro ao atualizar novo valor de benefício a pagar. ','Erro',mtError,[mbOk,mbHelp],0);
                   frmAguarde.Apaga;
                   TiraSQL(qryAux);
                   Exit;
             end;
              //Brunno Mattos - KTN 767861 - SOL 132659 Fim

             end;
           end; // with

        end else begin // inserir

       //CmDebugToFile(' rDiferenca é o novo valor '+qryHstBenefPagos.FieldByName('NOVOVALOR').AsString ,'C:\debug desdobramento.txt');

           if not AcertaBeneficio( qryAux, 'A','F',iIdPessJur, iIdPlanoPrev, iIdTitular,
                                   iSeqProposta,
                                   qryHstBenefPagos.FieldByName('IDPESSOA').AsInteger,
                                   iNumeroProcesso,
                                   qryHstBenefPagos.FieldByName('IdBeneficio').AsInteger,
                                   qryBeneficio.FieldByName('CODPORTFORMA').AsInteger,
                                   qryBeneficio.FieldByName('Nome').AsString,
                                   qryHstBenefPagos.FieldByName('MesReferencia').AsString,
                                   //qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat,
                                   StrToFloat(TruncaRound(qryHstBenefPagos.FieldByName('NOVOVALOR').AsString,2)),
                                   iIdLoteConcessao,
                                   //qryHstBenefPagos.FieldByName('VALORINTEGRAL').AsFloat, // Felipe A. Santos SOL 182092/14207 15207 15253 KITANTA 1969056
                                   qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat, // Felipe A. Santos SOL 182092/14207 15207 15253 KITANTA 1969056
                                   qryHstBenefPagos.FieldByName('VALORTOTAL').AsFloat,
                                   0,
                                   5, sDataInicio,     //Marcio Sanches Spinosa SOL 182092/14207 15207 15253 KITANTA 1969056);
                                   qryHstBenefPagos.FieldByName('VALORBS').AsString,              // edilaine - SOL 253577-17664 / PPM 1019932
                                   qryHstBenefPagos.FieldByName('VALORFAB').AsString,             // edilaine - SOL 253577-17664 / PPM 1019932
                                   qryHstBenefPagos.FieldByName('VLRBASEDEFICIT').AsString,       // edilaine - SOL 253577-17664 / PPM 1019932
                                   0, qryHstBenefPagos.FieldByName('IDPERFILINVEST').AsInteger       // edilaine - SIG55933
                                   )
           then begin
              dtmBaseDados.dbBaseDados.RollBack;
              MsgDlg('Erro ao pedir devolução dos benefícios pagos a maior.  ','Erro',mtError,[mbOk,mbHelp],0);
              frmAguarde.Apaga;
              TiraSQL(qryAux);
              Exit;
           end;

        end;
     end else {if  (qryHstBenefPagos.FieldByName('VALORPREV').AsFloat  >=
                   qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat)
          then }begin
             //BRUNO AZEVEDO SOL 136412/4121
             //FOI COLOCADO O VALOR TOTAL PARA SOMAR OS REAJUSTES
             //if (Copy(qryHstBenefPagos.FieldByName('MESREFERENCIA').AsString,6,2) = '13') then begin
              // rDiferenca := qryHstBenefPagos.FieldByName('VALORPREV').AsFloat - qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat; //SOL 253577-18114  PPM 1292515

               // Andre Imakawa - SIG 68960 - Inicio
               if qryHstBenefPagos.FieldByName('VALORPREV').AsFloat = 0 then
               begin
                  rDiferenca := qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat;
                  sTipo := 'A';
               end
               else
               begin
                  rDiferenca := qryHstBenefPagos.FieldByName('VALORPREV').AsFloat - qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat;
                  sTipo := 'D';
               end;
               //rDiferenca := qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat; //SOL 253577-18114  PPM 1292515
               // Andre Imakawa - SIG 68960 - Fim

             //end else begin
             //  rDiferenca := qryHstBenefPagos.FieldByName('VALORTOTAL').AsFloat - qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat;
             //end;

             //dValorTotalDivida := (dValorTotalDivida + qryHstBenefPagos.FieldByName('NOVOVALOR').AsFloat);       //SOL 253577-18114  PPM 1292515
             dValorTotalDivida := (dValorTotalDivida + rDiferenca); // Andre Imakawa - SIG 70825
        //CmDebugToFile(' rDiferenca calcula valor prev menos novo valor - valor prev : '+qryHstBenefPagos.FieldByName('VALORPREV').AsString+ ' Novo Valor: '+qryHstBenefPagos.FieldByName('NOVOVALOR').AsString ,'C:\debug desdobramento.txt');
       //CmDebugToFile(' rDiferenca '+FloattoStr(rDiferenca) ,'C:\debug desdobramento.txt');

             //SOL 253577-18114  PPM 1292515 - inicio
             {qryBeneficiarios.Locate('IDPESSOA',qryHstBenefPagos.FieldByName('IDPESSOA').AsString,[]);
             qryBeneficiarios.Edit;
             //qryBeneficiarios.FieldByName('VALORDIVIDA').AsFloat := qryBeneficiarios.FieldByName('VALORDIVIDA').AsFloat + rDiferenca;
             qryBeneficiarios.FieldByName('VALORDIVIDA').AsFloat := StrToFloat(FormatFloat('#0.00',(qryBeneficiarios.FieldByName('VALORDIVIDA').AsFloat + rDiferenca)));
             qryBeneficiarios.Post;
             }//SOL 253577-18114  PPM 1292515 - fim

             //BRUNO AZEVEDO SOL 136412/4121
             if ((qryHstBenefPagos.FieldByName('MESREFERENCIA').AsString <> sMesAnterior) or
                 (qryHstBenefPagos.FieldByName('IDPESSOA').AsString <> sIdPessoaAnterior)) then begin //or

                 rDiferenca := StrToFloat(TruncaRound(FloatToStr(rDiferenca),2));
                //(Copy(qryHstBenefPagos.FieldByName('MESREFERENCIA').AsString,6,2) = '13') then begin
               //if not AcertaBeneficio(qryAux, 'D','F',iIdPessJur,    // Andre Imakawa - SIG 68960
               if not AcertaBeneficio(qryAux, sTipo,'F',iIdPessJur,    // Andre Imakawa - SIG 68960
                                       iIdPlanoPrev,
                                       iIdTitular,
                                       iSeqProposta,
                                       qryHstBenefPagos.FieldByName('IdPessoa').AsInteger,
                                       iNumeroProcesso,
                                       qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                       qryBeneficio.FieldByName('CODPORTFORMA').AsInteger,
                                       qryBeneficio.FieldByName('Nome').AsString,
                                       qryHstBenefPagos.FieldByName('MesReferencia').AsString,
                                       rDiferenca,iIdLoteConcessao,
                                       //qryHstBenefPagos.FieldByName('VALORINTEGRAL').AsFloat, // Felipe A. Santos SOL 182092/14207 15207 15253 KITANTA 1969056
                                       rDiferenca, // Felipe A. Santos SOL 182092/14207 KITANTA 1969056
                                       qryHstBenefPagos.FieldByName('VALORTOTAL').AsFloat,
                                       0,
                                       //5, sDataInicio, //Marcio Sanches Spinosa SOL 182092/14207 15207 15253 KITANTA 1969056); // edilaine - SOL 253577-17664 / PPM 1019932 comentado
                                       5, '',            // edilaine - SOL 253577-17664 / PPM 1019932
                                       qryHstBenefPagos.FieldByName('VALORBS').AsString,              // edilaine - SOL 253577-17664 / PPM 1019932
                                       qryHstBenefPagos.FieldByName('VALORFAB').AsString,             // edilaine - SOL 253577-17664 / PPM 1019932
                                       qryHstBenefPagos.FieldByName('VLRBASEDEFICIT').AsString,       // edilaine - SOL 253577-17664 / PPM 1019932
                                       0, qryHstBenefPagos.FieldByName('IDPERFILINVEST').AsInteger       // edilaine - SIG55933
                                      )

               then begin
                  dtmBaseDados.dbBaseDados.RollBack;
                  MsgDlg('Erro ao pedir devolução dos benefícios pagos a maior.  ','Erro',mtError,[mbOk,mbHelp],0);
                  frmAguarde.Apaga;
                  TiraSQL(qryAux);
                  Exit;
               end;
               sMesAnterior      := qryHstBenefPagos.FieldByName('MESREFERENCIA').AsString; //BRUNO AZEVEDO SOL 136412/4121
               sIdPessoaAnterior := qryHstBenefPagos.FieldByName('IDPESSOA').AsString; //BRUNO AZEVEDO SOL 136412/4121
             end;
     end;
     qryHstBenefPagos.Next;
  end; // while

  //SOL 253577-18114  PPM 1292515 - inicio
  if Abs(dValorTotalDivida) > 0 then
  begin
    qryBeneficiarios.Locate('IDPESSOA',qryHstBenefPagos.FieldByName('IDPESSOA').AsString,[]);
    qryBeneficiarios.Edit;
    qryBeneficiarios.FieldByName('VALORDIVIDA').AsFloat := dValorTotalDivida;
    qryBeneficiarios.Post;
  end;
  //SOL 253577-18114  PPM 1292515 - fim


 // exit;

  // Gravar Acertos do INSS
  if qryHstNovoINSS.Active
  then begin
     qryHstNovoINSS.First;
     while not qryHstNovoINSS.Eof do
     begin

        //CmDebugToFile(' rDiferenca é o novo valor - Novo Valor: '+qryHstNovoINSS.FieldByName('NOVOVALOR').AsString ,'C:\debug desdobramento.txt');
       //CmDebugToFile(' rDiferenca '+ qryHstNovoINSS.FieldByName('NOVOVALOR').AsString ,'C:\debug desdobramento.txt');


        if not AcertaBeneficio( qryAux, 'A','F',iIdPessJur, iIdPlanoPrev, iIdTitular,
                                iSeqProposta,
                                qryHstNovoINSS.FieldByName('IdPessoa').AsInteger,
                                iNumeroProcessoNovo, //SOL 253577-18114 PPM 1292515 17/02/2016
                                qryHstNovoINSS.FieldByName('IdBeneficio').AsInteger,
                                qryBeneficio.FieldByName('CODPORTFORMA').AsInteger,
                                qryBeneficio.FieldByName('Nome').AsString,
                                qryHstNovoINSS.FieldByName('MesReferencia').AsString,
                                //qryHstNovoINSS.FieldByName('NOVOVALOR').AsFloat,
                                StrToFloat(TruncaRound(qryHstNovoINSS.FieldByName('NOVOVALOR').AsString,2)),
                                iIdLoteConcessao,
                                qryHstBenefPagos.FieldByName('VALORINTEGRAL').AsFloat,
                                qryHstBenefPagos.FieldByName('VALORTOTAL').AsFloat,
                                0,
                                5, '',
                                qryHstBenefPagos.FieldByName('VALORBS').AsString,              // edilaine - SOL 253577-17664 / PPM 1019932
                                qryHstBenefPagos.FieldByName('VALORFAB').AsString,             // edilaine - SOL 253577-17664 / PPM 1019932
                                qryHstBenefPagos.FieldByName('VLRBASEDEFICIT').AsString,       // edilaine - SOL 253577-17664 / PPM 1019932
                                0, qryHstNovoINSS.FieldByName('IDPERFILINVEST').AsInteger         // edilaine - SIG55933
                                )

        then begin
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro ao pedir devolução dos benefícios pagos a maior.  ','Erro',mtError,[mbOk,mbHelp],0);
           frmAguarde.Apaga;
           TiraSQL(qryAux);
           Exit;
        end;
        qryHstNovoINSS.Next;
     end;
  end;

  { Atualizar percentual de pensão caso parametro esteja marcado. }
  If prmFLGATUPERCGF = 1 Then Begin

    If Not CtrlBenefBfciario.AtualizaNumeroBeneficiarios( iNumeroProcesso, iIdBeneficio )
    Then Begin 

       dtmBaseDados.dbBaseDados.RollBack;

       frmAguarde.Apaga;
       MsgDlg('Erro no recalculo dos percentuais da Pensão.','Erro',mtError,[mbOk,mbHelp],0);

       FrmAguarde.Apaga;
       TiraSQL( QryAux );

       Exit;
    End;

  End;


  { Efetua parcelamento }
  //BRUNO AZEVEDO
  //If qryBeneficiarios.FieldByName('VALORDIVIDA').AsFloat > 0 Then Begin
  //  EfetuaParcelamento
  //End;

  // edilaine - SOL 253577-17664 / PPM 1019932 - incio
  try
    qryBeneficiarios.disablecontrols;
    qryBeneficiarios.first;
    qryBeneficiarios.applyUpdates;
    qryBeneficiarios.enablecontrols;

  except
     dtmBaseDados.dbBaseDados.RollBack;
     MsgDlg('Erro ao atualizar benefícios. Verifique. ','Erro',mtError,[mbOk,mbHelp],0);
     frmAguarde.Apaga;
     Exit;
  end;
  // edilaine - SOL 253577-17664 / PPM 1019932 - fim
  //SOL 253577-18114 PPM 1292515 17/02/2016
  { Busca Contribuicoes associadas ao evento }
  {QryBuscaContrib.Close;
  QryBuscaContrib.ParamByName('IDEVENTOGERADOR').AsInteger := iIdEvento;
  QryBuscaContrib.ParamByName('IDPLANOPREV').AsInteger     := iIdPlanoPrev;
  QryBuscaContrib.Open;}

  // Processo o Controle de Nucleos Familiares caso tenha contribuicao associada
  // ao evento
  {If (Not QryBuscaContrib.IsEmpty) Then Begin
     If (Not ProcessaNucleoFamiliar(qryBenefBfciario,QryNucleoFamiliar,QryAux,QryBuscaContrib,
                                    iIdTitular, iIdPessJur,
                                    iIdPlanoPrevTit,
                                    iIdEvento)) Then Begin
        MsgDlg('Erro ao associar contribuições ao Núcleo Familiar. Processo não Confirmado!','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.RollBack;
        bbtnCancelarClick(Self);
        frmAguarde.Apaga;                 // fernando xavier - SOL 253577-17664 / PPM 1019932
        Exit;
     End;
  End;}


  try
     qryHstNovoBenef.DisableControls;
     qryHstNovoBenef.First;

     qryHstNovoBenef.ApplyUpdates;
     qryHstNovoBenef.EnableControls;
  except
  //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
    on e:Exception do
    begin
      TratarErro(e.Message);
      dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Erro inserir benefícios dos novos beneficiários no histórico.  ','Erro',mtError,[mbOk,mbHelp],0);
      frmAguarde.Apaga;
      TiraSQL(qryAux);
      Exit;
    end;
    //Brunno Mattos - KTN 767861 - SOL 132659 Fim

  end;

  qryBenefBfciario.CancelUpdates;
  qryHstBenefPagos.CancelUpdates;

  if not(AssociaTaxas(sFontePagadora)) then
     exit;
  //SOL 253577-18114 PPM 1292515 17/02/2016

  // fernando xavier - SOL 253577-17664 / PPM 1019932 - comentado
  {if not GeraContribBenef(QryLoop, QryContribProc, QryAux,
                          '',
                          iNumeroProcesso, iIdLoteConcessao,
                          sAnoMesFinal,
                          sDataEvento, sAnoMesInicio,
                          '',
                          iIdLoteConcessao,
                          '',5)
  then begin
     dtmBaseDados.dbBaseDados.RollBack;
     MsgDlg('Erro no preparo das contribuições do núcleo familiar. Verifique. ','Erro',mtError,[mbOk,mbHelp],0);
     frmAguarde.Apaga;
     TiraSQL(qryAux);
     Exit;
  end; }
  // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim comentario

  {----------------------------------------------------------------------------}
  // fernando xavier - SOL 253577-17664 / PPM 1019932  - inicio
  {MostraDemonstrativoConcessao;  }
  GeraDemonstrativo();
  // fernando xavier - SOL 253577-17664 / PPM 1019932  - fim

  //BRUNO AZEVEDO

//SOL 174933 KINTANA 1733374
{ Efetua parcelamento }
  SaldoUnificacao:=0;///Douglas.Siqueira 174933
  VLDivida:=0;///Douglas.Siqueira 174933
  IDHSTORICODIVIDABENEFICIO:='0';
  atualizar:=false;
  primeira:=true;

    rDadosParcelamento.bFlgFezParcelamento := false;  // edilaine - 22/01/2014 - SOL 174933

  If Abs(qryBeneficiarios.FieldByName('VALORDIVIDA').AsFloat) > 0 Then           //SOL 253577-18114  PPM 1292515
   Begin
//    EfetuaParcelamento

   PercRed:=ABS((RNovoValor*100)/RValorAntigo-100);
   if MsgDlg(GetMensagem(8),'Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrYES then
      begin
      // edilaine - 22/01/2014 - SOL 174933
      rDadosParcelamento.bFlgFezParcelamento := true;
      rDadosParcelamento.sSQLBusca := 'SELECT h.NUMRECEBIMENTO    '
                                     +'  FROM HSTCONTRIBPREV  H,  '
                                     +'       BFCIARIOTITPLAN BT, '
                                     +'       BENEFBFCIARIO   BF  '
                                     +' WHERE H.IDLOTE = '+IntToStr(iIdLoteConcessao)
                                     +'   AND H.IDPESSJUR = '+IntToStr(iIdPessJur)
                                     +'   AND BF.IDBENEFICIO = '+IntToStr(iIdBeneficio)
                                     +'   AND H.IDPESSOA = BT.IDRESPONSAVEL '
                                     +'   AND H.SEQPROPOSTA = 1 '
                                     +'   AND BF.FONTEPAGADORA = 1 '
                                     +'   AND BT.IDPESSJUR = H.IDPESSJUR '
                                     +'   AND BT.IDPLANOPREV = H.IDPLANOPREV '
                                     +'   AND BT.IDTITULAR = '+IntToStr(iIdTitular)
                                     +'   AND BT.SEQPROPOSTA = 1 '
                                     +'   AND BT.IDPESSJUR = BF.IDPESSJUR '
                                     +'   AND BT.IDTITULAR = BF.IDTITULAR '
                                     +'   AND BT.IDPLANOORIGEM = BF.IDPLANOORIGEM '
                                     +'   AND BT.IDPESSOA = BF.IDPESSOA '
                                     +'   AND BT.SEQPROPOSTA = BF.SEQPROPOSTA '
                                     +'   AND BT.IDPLANOPREV = BF.IDPLANOPREV '
                                     +'   AND BT.IDBENEFICIO = BF.IDBENEFICIO '
                                     //+'   AND DECODE(BF.IDPLANPREVCONTAB, 28, 633, 2, 259, 500) = H.IDCONTRIBUICAO ' //Rafael Vasconcelos - SIG 90784
                                     +'   AND H.FLGDEVOLUCAO = 1 ';
      // edilaine - 22/01/2014 - SOL 174933

      if VerificarParcelamentoAtivo(qryBeneficiarios.FieldByName('IDPESSOA').Text,
                                    qryBeneficiarios.FieldByName('IDTITULAR').Text,sFontePagadora) then
         begin
         if MsgDlg(GetMensagem(11),'Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrYES then
            begin

            SaldoUnificacao:=ExecutaParcAtivos(qryBeneficiarios.FieldByName('IDPESSOA').Text,
                            qryBeneficiarios.FieldByName('IDTITULAR').Text,
                            qryBeneficiarios.FieldByName('VALORDIVIDA').Text,
                            sFontePagadora,
                            sAnoMesPagamento,
                            qryBeneficiarios.FieldByName('IDBENEFICIO').Text,
                            IDHSTORICODIVIDABENEFICIO,IDCONTROLEDIVIDABENEFICIO,
                            cancelou,
                            pular
                            );

            end
            else
            cancelou:=true;
        end;



      if (SaldoUnificacao>0) and (IDHSTORICODIVIDABENEFICIO='0') then///quando for 0 quer dizer que não houve unificacao  e nem quitacao parcelada
         atualizar:=false
      else
        if (SaldoUnificacao>0) and (IDHSTORICODIVIDABENEFICIO<>'0') then
            atualizar:=true

      else  if (SaldoUnificacao=0)then
               atualizar:=false;
               

        if SaldoUnificacao> 0 then
         VLDivida:=SaldoUnificacao
      else
      begin   // edilaine - SOL 253577-17664 / PPM 1019932 - inicio
         VLDivida:= -qryBeneficiarios.FieldByName('VALORDIVIDA').AsFloat;        //SOL 253577-18114 PPM 1292515

         // totalizando valores Contribuicoes
         RetornaTotal('C', qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                           qryBeneficiarios.FieldByName('IDBENEFICIO').AsInteger,
                           qryBeneficiarios.FieldByName('IDPESSJUR').AsInteger,
                           totalContrib
                           true);          //SOL 253577-18114 PPM 1292515

         VLDivida := Abs(VLDivida + {-} totalContrib);       //SOL 253577-18114 PPM 1292515
      end;  // edilaine - SOL 253577-17664 / PPM 1019932 - fim

          if ((SaldoUnificacao>0) or (cancelou=true) or (primeira)) and (pular = false)then
              begin
              primeira:=false;
              InserirControleDividaBenef(qryBeneficiarios.FieldByName('IDPESSOA').Text,
                                 qryBeneficiarios.FieldByName('IDTITULAR').Text,
                                 qryBeneficiarios.FieldByName('IDBENEFICIO').Text,
                                 qryBeneficiarios.FieldByName('IDPLANOPREV').Text,
                                 DateToStr(date),
                                 {qryBeneficiarios.FieldByName('VALORATUAL').Textver}floattostr(RNovoValor),
                                 '0',
                                 '3057'{idmotivo},
                                 '1',
                                 '1',
                                 '0',
                                 'B',
                                 '0',
                                 qryBeneficiarios.FieldByName('IDPESSJUR').Text,
                                 DateToStr(date),
                                 '0',
                                 sAnoMesPagamento,
                                 sFontePagadora,
                                 qryBeneficiarios.FieldByName('NUMPROCINSS').AsString,     //edilaine SIG56256
                                 PercRed,
                                 VLDivida,
                                 atualizar,
                                 IDHSTORICODIVIDABENEFICIO,IDCONTROLEDIVIDABENEFICIO,true,
                                 qryBeneficiarios.FieldByName('NUMEROPROCESSO').AsInteger //Peterson Victor SIG27210
                                 );
              end;



       end
      else
         begin
//SOL 225783 KINTANA 2059230 Douglas.Siqueira
//         InserirControleDividaBenef(qryBeneficiarios.FieldByName('IDPESSOA').Text,
//                                 qryBeneficiarios.FieldByName('IDTITULAR').Text,
//                                 qryBeneficiarios.FieldByName('IDBENEFICIO').Text,
//                                 qryBeneficiarios.FieldByName('IDPLANOPREV').Text,
//                                 DateToStr(date),
//                                 {qryBeneficiarios.FieldByName('VALORATUAL').Textver}floattostr(RNovoValor),
//                                 '0',
//                                 '3057'{idmotivo},
//                                 '1',
//                                 '1',
//                                 '0',
//                                 'B',
//                                 '0',
//                                 qryBeneficiarios.FieldByName('IDPESSJUR').Text,
//                                 DateToStr(date),
//                                 '0',
//                                 sAnoMesPagamento,
//                                 sFontePagadora,
//                                 PercRed,
//                                 qryBeneficiarios.FieldByName('VALORDIVIDA').AsFloat,
//                                 false,
//                                 IDHSTORICODIVIDABENEFICIO,IDCONTROLEDIVIDABENEFICIO,false
//                                 );
//SOL 225783 KINTANA 2059230 Douglas.Siqueira
         end;
//SOL 174933 KINTANA 1733374
  End;

  frmAguarde.Apaga;

  bbtnConfirmarClick(Sender);
  exit;

end;

procedure TfrmDesdobramentoBenef.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  sValorTotalBS := '';
  sValorTotalBSAnt:= '';
  sValorNoMesBS:= '';
  sValorTotalFAB:= '';
  sValorTotalFABAnt:= '';
  sValorNoMesFAB:= '';
  sValorTotalDeficit:= '';
  sValorTotalDeficitAnt:= '';
  sValorNoMesDeficit:= '';
  sNovoValorRateadoBS:= '';
  sNovoValorRateadoFAB:= '';
  sValorAbonoBS:= '';
  sValorAbonoFAB:= '';
  sValorAbonoDeficit:= '';

  sValorParcialUltimoBS:= '';
  sValorParcialUltimoFAB:= '';
  sValorParcialUltimoDeficit:= '';
  sValorParcialPrimeiroBS:= '';
  sValorParcialPrimeiroFAB:= '';
  sValorParcialPrimeiroDeficit:= '';
  sValorIntegralBfciarioBS:= '';
  sValorIntegralBfciarioFAB:= '';
  sValorIntegralBfciarioDeficit:= '';
  sValorFinalBfciarioBS:= '';
  sValorFinalBfciarioFAB:= '';
  sValorFinalBfciarioDeficit:= '';
  sVlrBSReajustado:= '';
  sVlrFABReajustado:= '';
  sVlrDeficitReajustado:= '';
  sValorIntegralBS:= '';
  sValorIntegralFAB:= '';
  sValorIntegralDeficit:= '';
  sValorIntegralAntigoBS:= '';
  sValorIntegralAntigoFAB:= '';
  sValorIntegralAntigoDeficit:= '';

  bApresentaBSFAB:= false;
  bApresentaDeficit:= false;
  totalBenef:= 0;
  totalContrib:= 0;
  sdataInicioDesdobra:= '';
  sListaProcesso:= '';
  iIdLoteConcessao:= 0;
  iNumeroProcessoNovo:= 0;
  iIdCalculo:= 0;
  sVlrInfINSS := '';
  sVlrCalcINSS:= '';


  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Rollback;

  qryBeneficiarioEmUso.Close;

  if qryBenefBfciario.Active  then qryBenefBfciario.CancelUpdates;
  if qryHstBenefPagos.Active  then qryHstBenefPagos.CancelUpdates;
  if qryHstNovoBenef.Active   then qryHstNovoBenef.CancelUpdates;

  if not qryBeneficio.Active then Exit;
  qryBeneficiarios.Close;
  qryBeneficiarios.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
  qryBeneficiarios.ParamByName('IdBeneficio').AsInteger := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
  qryBeneficiarios.Open;

  MsgDlg('Desdobramento cancelado.','Informação',mtInformation,[mbOk,mbHelp],0);

  bbtnConfirmar.Enabled  := False;
  bbtnCancelar.Enabled   := False;
end;

procedure TfrmDesdobramentoBenef.bbtnConfirmarClick(Sender: TObject);
var
    sAnoMesInicio,vBuffer : string;
begin


  if MsgDlg('Confirma o Desdobramento do Benefício ? ','Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo
  then begin
     //dtmBaseDados.dbBaseDados.Rollback;
     bbtnCancelarClick(self);
     qryBeneficiarios.Edit;
     qryBeneficiarios.FieldByName('ValorAtual').AsFloat     := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorAtualNaDib))); // SOL 192563 KINTANA 1877175
     qryBeneficiarios.FieldByName('ValorCalculado').AsFloat := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorCalculadoNaDib)));   // SOL 192563 KINTANA 1877175
     qryBeneficiarios.FieldByName('ValorTotal').AsFloat     := StrToFloat(ClienteNumero(FormatFloat('#0.00',rValorTotalNaDib)));   // SOL 192563 KINTANA 1877175
     qryBeneficiarios.post;
     qryBeneficiarios.applyUpdates;
     //MsgDlg('Desdobramento cancelado.','Informação',mtInformation,[mbOk,mbHelp],0);
     exit;
  end
  else
  begin
     Try

        rpDemonstrativo.DeviceType       := 'PDFFile';
        rpDemonstrativo.AllowPrintToFile := True;
        rpDemonstrativo.ShowPrintDialog  := False;
        sNomeArquivo := 'Desdobramento de Benefício - '+qryDemonstra.FieldByName('MATRICULATIT').AsString + '-' + FormatDateTime('DD-MM-YYYY' + '-' + 'HH-MM-SS', Now);
        rpDemonstrativo.TextFileName := SalvarArquivoRevisaoBeneficio(qryDemonstra.FieldByName('MATRICULATIT').AsString, qryDemonstra.FieldByName('MATRICULATIT').AsString) + '\' + sNomeArquivo  + '.PDF';
        vBuffer := SalvarArquivoRevisaoBeneficio(qryDemonstra.FieldByName('MATRICULATIT').AsString, qryDemonstra.FieldByName('MATRICULATIT').AsString) + '\' + sNomeArquivo  + '.PDF';

        rpDemonstrativo.Print;

        ShellExecute(Application.Handle, nil, PChar(vBuffer), nil, nil, SW_SHOWNORMAL);

     // INICIO Thiago Passos SOL 131674
       If Not Sistema.GravaLogOperacoes(Self.Caption) Then
         raise exception.Create('Erro ao gravar Log.');

         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;
     // FIM Thiago Passos SOL 131674

       // edilaine - 22/01/2014 - SOL 174933
       if (rDadosParcelamento.bFlgFezParcelamento) then
          AcertaLancamentoDevolucao();

     Except
     //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
      on e:Exception do
      begin
        TratarErro(e.Message);
        MsgDlg('Erro ao confirmar a transação no banco de dados','Informação',mtinformation,[mbok],0);
      end;
      //Brunno Mattos - KTN 767861 - SOL 132659 Fim

     End;
     MsgDlg('Desdobramento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);
  end;
  inherited;
  frmAguarde.Apaga;

  sAnoMesInicio  := Copy(sDtInicioFund,7,4)+'/'+Copy(sDtInicioFund,4,2);

  // Reabrir querys
  qryBeneficiarios.Close;
  qryBeneficiarios.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
  if not qryBeneficio.IsEmpty
  then qryBeneficiarios.ParamByName('IdBeneficio').AsInteger := qryBeneficio.FieldByName('IdBeneficio').AsInteger
  else qryBeneficiarios.ParamByName('IdBeneficio').AsInteger := -1;
  qryBeneficiarios.Open;

  qryHstBenefPagos.Close;
  qryHstBenefPagos.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
  qryHstBenefPagos.ParamByName('IdBeneficio').AsInteger    := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
  qryHstBenefPagos.ParamByName('MesReferencia').AsString   := sAnoMesInicio;
  qryHstBenefPagos.ParamByName('ANOMESFINAL').AsString     := Copy(sDataFinal,7,4)+'/'+Copy(sDataFinal,4,2);
  qryHstBenefPagos.ParamByName('ANOMESFINAL13').AsString   := Copy(sDataFinal,7,4)+'/13';
  //qryHstBenefPagos.ParamByName('DATADIB').AsString         := Copy(sDtInicioFund,1,5);     //SOL 253577-18114 PPM 1292515
  qryHstBenefPagos.Open;

  qryHstNovoBenef.Close;
  qryHstNovoBenef.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
  qryHstNovoBenef.ParamByName('IdBeneficio').AsInteger    := qryBeneficio.FieldByName('IdBeneficio').AsInteger;

  if UpperCase(sNomeOperacao) = 'REQ'
  then qryHstNovoBenef.ParamByName('IdPessoa').AsInteger  := qryBeneficiarioEmUso.FieldByName('IdPessoa').AsInteger
  else qryHstNovoBenef.ParamByName('IdPessoa').AsInteger  := qryBeneficiarios.FieldByName('IdPessoa').AsInteger;
  qryHstNovoBenef.ParamByName('MesReferencia').AsString   := sAnoMesInicio;
  qryHstNovoBenef.Open;

  qryBeneficiarioEmUso.Close; 
  bbtnConfirmar.Enabled  := False;
  bbtnCancelar.Enabled   := False;

end;

procedure TfrmDesdobramentoBenef.qryBeneficioAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryBeneficio.Active then Exit;
  qryBeneficiarios.Close;
  qryBeneficiarios.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
  qryBeneficiarios.ParamByName('IdBeneficio').AsInteger := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
  qryBeneficiarios.Open;

end;

procedure TfrmDesdobramentoBenef.dbgrdDemonstrativoCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if not qryHstBenefPagos.Active then Exit;


  if qryHstBenefPagos.FieldByName('FLGDEVOLUCAO').AsInteger = 1  then
    AFont.Color := clRed
  else
    AFont.Color := clWindowText;

  // faz com que as linhas do grid tenham cores alternadas
  if Highlight = True then begin
    AFont.Color  := ClWhite;
  end;

end;


procedure TfrmDesdobramentoBenef.sbtnConcedeUmClick(Sender: TObject);
var iIdSitBenef : integer;
begin
  inherited;
  sNomeOperacao := 'CON';
  if (qryBeneficiarioEmUso.Active) and (not qryBeneficiarioEmUso.IsEmpty)
  then begin
     MsgDlg('Existe um beneficiário em aberto. Confirme ou Cancele sua inclusão. ','Informação',mtInformation,[mbOk,mbHelp],0);
     sbtnConcedeUm.Down := False;
     Exit;
  end;

  if Trim(dblkpcmbBeneficio.Text) = ''
  then begin
     MsgDlg('Selecione um dos benefícios do processo. ','Erro',mtError,[mbOk,mbHelp],0);
     sbtnConcedeUm.Down := False;
     Exit;
  end;

  if qryBeneficiarios.FieldByName('IdSitBeneficio').AsInteger <> 4
  then begin
     MsgDlg('O benefício selecionado já foi concedido. ','Erro',mtError,[mbOk,mbHelp],0);
     sbtnConcedeUm.Down := False;
     Exit;
  end;

  // Chamar tela de Modo de Concessao
  with frmPedeBenefExigencia do
  begin
     // Modos de Concessao = N - concedido Normal
     //                      E - concedido em Exigencia
     //                      P - manter Pendente
     //                      C - nao conceder (Cancelar requerimento)
     ShowModal;
     case cModoConcessao of
       'N' : iIdSitBenef := 1;
       'C' : begin // Cancelar
                if MsgDlg('Deseja realmente "NÃO CONCEDER" este benefício ? '+
                          ' Esta operação irá cancelar o requerimento do mesmo.','Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrYes
                then iIdSitBenef := 6  // nao concedido
                else iIdSitBenef := 4; // pendente de concessao
             end;
       'E' : iIdSitBenef := 7;
       'P' : iIdSitBenef := 4;
     else iIdSitBenef :=  1;
     end; //case
  end;//with

  qryBeneficiarios.Edit;
  qryBeneficiarios.FieldByName('IdSitBeneficio').AsInteger := iIdSitBenef;
  qryBeneficiarios.Post;

  bbtnConfirmar.Enabled := True;;
  bbtnCancelar.Enabled  := True;
  sbtnConcedeUm.Down    := False;

end;

procedure TfrmDesdobramentoBenef.sbtnCadContaCorrenteClick(
  Sender: TObject);
var sSQL : string;
    liIdPessoa : longint;
begin
  inherited;

  if not qryBeneficiarios.Active
  then Exit;

  if qryBeneficiarios.FieldByName('NOMERESPONSAVEL').AsString = ''
  then liIdPessoa := qryBeneficiarios.FieldByName('IdPessoa').AsInteger
  else liIdPessoa := qryBeneficiarios.FieldByName('IdResponsavel').AsInteger;

  if not qryContaBancaria.Active
  then begin
     // Verificar conta bancaria do recebedor
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := liIdPessoa;
     qryContaBancaria.Open;
  end;

  try
     frmCadContaRequerimento := TfrmCadContaRequerimento.Create(Application);
     with frmCadContaRequerimento do
     begin
        qryBanco.Close;
        qryBanco.Open;

        if qryBeneficiarios.FieldByName('NOMERESPONSAVEL').AsString = ''
        then edNOME.Text := qryBeneficiarios.FieldByName('Nome').AsString
        else edNOME.Text := qryBeneficiarios.FieldByName('NomeResponsavel').AsString;

        if qryContaBancaria.IsEmpty
        then begin
           qryAgenciaNome.Close;
           qryAgenciaNome.ParamByName('pIdBanco').AsInteger := qryBanco.FieldbyName('IdPessoa').AsInteger;
           qryAgenciaNome.Open;

           qryAgenciaNumero.Close;
           qryAgenciaNumero.ParamByName('pIdBanco').AsInteger := qryBanco.FieldbyName('IdPessoa').AsInteger;
           qryAgenciaNumero.Open;
        
		   //edilaine SIG100575 : inicio
           qryCBancaria.Close;
           qryCBancaria.ParamByName('IDPESSOA').AsInteger := liIdPessoa;
           qryCBancaria.Open;
           qryCBancaria.Insert;
           //edilaine SIG100575 : fim
           dblkpcmbBanco.Text          := '';
           dblkpcmbAgenciaNome.Text    := '';
           edDigAgencia.Text           := '';
           edContaCorrente.Text        := '';
           rgrpTipoConta.ItemIndex     := 0;
        end
        else begin
           dblkpcmbBanco.Text          := qryContaBancaria.FieldByName('Banco').AsString;

           dblkpcmbBanco.PerformSearch;

           qryAgenciaNome.Close;
           qryAgenciaNome.ParamByName('pIdBanco').AsInteger := qryBanco.FieldbyName('IdPessoa').AsInteger;
           qryAgenciaNome.Open;

           qryAgenciaNumero.Close;
           qryAgenciaNumero.ParamByName('pIdBanco').AsInteger := qryBanco.FieldbyName('IdPessoa').AsInteger;
           qryAgenciaNumero.Open;

           //edilaine SIG100575 : inicio
           qryCBancaria.Close;
           qryCBancaria.ParamByName('IDPESSOA').AsInteger := liIdPessoa;
           qryCBancaria.Open;
           qryCBancaria.edit;
           //edilaine SIG100575 : fim

           dblkpcmbBanco.Text          := qryContaBancaria.FieldByName('Banco').AsString;          //edilaine SIG100575
           edDigAgencia.Text           := qryContaBancaria.FieldByName('NumAgencia').AsString;
           dblkpcmbAgenciaNome.Text    := qryContaBancaria.FieldByName('Agencia').AsString;
           edContaCorrente.Text        := qryContaBancaria.FieldByName('ContaCorrente').AsString;
           rgrpTipoConta.ItemIndex     := qryContaBancaria.FieldByName('TipoConta').AsInteger - 1;
         
		   dblkpcmbBancoExit(dblkpcmbBanco);      //edilaine SIG100575
           dblkpcmbAgenciaNome.PerformSearch;
        end;
        
        ShowModal;

        if ModalResult <> mrOk
        then Exit;

        // Lise - 11/10/2001 - Alterado Insert e Update campo TipoConta (Char) para DB2
        if qryContaBancaria.IsEmpty
        then begin
           sSQL := ' INSERT INTO CONTABANCARIA (IDCBANCARIA, CONTACORRENTE,    '+
                   '             IDAGENCIA, FLGCONTAPREF, IDPESSOA, TIPOCONTA) '+
                   ' VALUES('+IntToStr(LeUltRegistro(nil, 'CONTABANCARIA'))+','+
                              //''''+Trim(edContaCorrente.Text)+''', '+                            //edilaine SIG100575
                              ''''+qryCBancaria.FieldByName('CONTACORRENTE').AsString+''', '+      //edilaine SIG100575
                              IntToStr(qryAgenciaNumero.FieldByName('IdPessoa').AsInteger)+',1, '+
                              IntToStr(liIdPessoa)+','+
                              QuotedStr(IntToStr(rgrpTipoConta.ItemIndex+1))+')';
        end
        else begin
           sSQL := ' UPDATE CONTABANCARIA '+
                   //' SET    CONTACORRENTE = '''+Trim(edContaCorrente.Text)+''', '+                            //edilaine SIG100575
                   ' SET    CONTACORRENTE = '''+qryCBancaria.FieldByName('CONTACORRENTE').AsString+''', '+      //edilaine SIG100575
                   '        IDAGENCIA     = '+IntToStr(qryAgenciaNumero.FieldByName('IdPessoa').AsInteger)+', '+
                   '        TIPOCONTA     = '''+IntToStr(rgrpTipoConta.ItemIndex+1)+ ''''+
                   ' WHERE  IDPESSOA      = '+IntToStr(liIdPessoa)+
                   ' AND    FLGCONTAPREF  = 1 ';

        end;
     end; // with
  finally
     frmCadContaRequerimento.Free;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);
  try
     qryAux.ExecSQL;
  except
     raise;
  end;
  PreencheDadosBeneficiario;

end;

procedure TfrmDesdobramentoBenef.dblkpcmbBeneficioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if not qryBeneficio.Active then Exit;
  qryBeneficiarios.Close;
  qryBeneficiarios.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
  qryBeneficiarios.ParamByName('IdBeneficio').AsInteger    := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
  qryBeneficiarios.Open;
  PreencheDadosBeneficiario;

end;

{------------------------------------------------------------------------------}
{ Calcula Beneficio Minimo                              }
function TfrmDesdobramentoBenef.CalculaBeneficioMinimoLocal( sAnoMesAtual, sDataFolha,
                                                             sData, sAnoMesPagamento : String;
                                                             rValorBeneficioNoMes,
                                                             rValorTotal : Double;
                                                             iNumBenef,
                                                             iIdBeneficiario : Integer;
                                                             Var rValorDepoisMinimo : Double ): Boolean;
Var
  bErro : Boolean;
  sMsgErro : String;
begin
  Result := False;
  //----------------------------------------------------------------------------
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT DECODE(BP.VALORBASE1, NULL, 0) AS VALORBASE1, '+
                 'DECODE(BP.VALORBASE2, NULL, 0) AS VALORBASE2, '+
                 'DECODE(BP.VALORBASE3, NULL, 0) AS VALORBASE3, '+
                 'BF.DIBBENEFANT, BF.VALORBENEFANT, '''+sAnoMesAtual+''' AS MESREFERENCIA, '+
                 'BF.VALORATUAL, BF.FLGPOSSUIACOMPINSS, BF.VALORSRB, BF.VALORTOTAL  '+
                 'FROM BENEFBFCIARIO BF, BENEFPLANOPART BP '+
                 'WHERE (BF.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+') '+
                 'AND (BF.IDPESSJUR = BP.IDPESSJUR(+)) '+
                 'AND (BF.IDPESSOA = BP.IDPESSOA(+)) '+
                 'AND (BF.IDPLANOORIGEM = BP.IDPLANOPREV(+)) '+
                 'AND (BF.SEQPROPOSTA = BP.SEQPROPOSTA(+)) '+
                 'AND (BF.IDBENEFICIO = BP.IDBENEFICIO(+))');
  qryAux.Open;

  If ExecutaRegraBeneficioMinimo(qryAux,
                                 prmIdRegraCalcBenefMin,
                                 iIdPessJur,
                                 iIdPlanoOrigem,
                                 iIdTitular,
                                 iSeqProposta,
                                 iIdBeneficio,
                                 iIdBeneficiario, 
                                 iIdSitFunc,
                                 iIdSitPart,
                                 iIdSitPlanoPrev,
                                 qryAux.FieldByName('VALORBASE1').AsFloat,
                                 qryAux.FieldByName('VALORBASE2').AsFloat,
                                 qryAux.FieldByName('VALORBASE3').AsFloat,
                                 sDataEvento,
                                 sDataInicio,
                                 sDtInicioINSS,
                                 sDataFolha,
                                 sdata,
                                 sVlrInfINSS,
                                 sVlrCalcINSS,
                                 qryAux.FieldByName('DIBBENEFANT').AsString,
                                 qryAux.FieldByName('VALORBENEFANT').AsString,
                                 qryAux.FieldByName('VALORATUAL').AsString,
                                 qryAux.FieldByName('FLGPOSSUIACOMPINSS').AsInteger,
                                 bErro,
                                 qryAux.FieldByName('VALORSRB').AsString,
                                 qryAux.FieldByName('VALORTOTAL').AsString,
                                 sAnoMesAtual)
  Then Begin
    if not CalculaBeneficioMinimo ( iNumeroProcesso ,
                                    iIdPessJur,
                                    iIdPlanoOrigem,
                                    iIdTitular,
                                    iIdBeneficiario,
                                    iIdBeneficio,
                                    FloatToStr(rValorBeneficioNoMes),
                                    FloatToStr(rValorTotal),
                                    iNumBenef,
                                    sAnoMesAtual,
                                    sDataInicio,
                                    sDataFinal,
                                    rValorDepoisMinimo,
                                    sMsgErro )
    then begin
      frmAguarde.Apaga;
      MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
      rValorDepoisMinimo  := 0;
      Result := False;
      Exit;
    end;
  End;
  Result := True;
  //----------------------------------------------------------------------------

end;

{------------------------------------------------------------------------------}
{ Retorna total de beneficiários validos para fazer desdobramento              }
function TfrmDesdobramentoBenef.TotalBeneficiariosValidos( iIdBeneficio: Integer;
                                                           iNumeroProcesso: Integer ): Integer;
begin
  Result := 0;
  QryBeneficiariosValidos.Close;
  QryBeneficiariosValidos.ParamByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
  If Not iIdBeneficio = 0 Then
    QryBeneficiariosValidos.ParamByName('IDBENEFICIO').AsInteger := -1
  Else
    QryBeneficiariosValidos.ParamByName('IDBENEFICIO').AsInteger := iIdbeneficio;

  QryBeneficiariosValidos.Open;
  
  Result := QryBeneficiariosValidos.FieldByName('TOTALVALIDOS').AsInteger;

end;

procedure TfrmDesdobramentoBenef.MostraDemonstrativoConcessao;
var sFormato, sAnoMesAtual, sRecebedorAtual : string;
    iIdRecebedorAtual             : longint;
    dValorIntegralNaDib,
    dValorTotalNaDib              : double;

    sLinhaMatricula, sSQL : String;
begin
   frmAguarde.Mostra('Preparando o Demonstrativo do Desdobramento ...');

   if not qryTitular.Active
   then begin
     qryTitular.Close;
     qryTitular.ParamByName('IdPessoa').Value    := iIdTitular;
     qryTitular.ParamByName('IdPessJur').Value   := iIdPessJur;
     qryTitular.ParamByName('IdPlanoPrev').Value := iIdPlanoPrevTit; 
     qryTitular.ParamByName('SeqProposta').Value := iSeqProposta;
     qryTitular.Open;
   end;

   qryAux.Close;

   frmMostraAux.Caption := 'Resumo do Desdobramento de Benefício ... ';

   // Exibir dados do participante
   with frmMostraAux.memResult.Lines do
   begin
      Clear;
      Add('-----------------------------------------------------------------------------------------------------');
      Add('                                DEMONSTRATIVO DE DESDOBRAMENTO           - VERSÃO : '+Sistema.Versao);
      Add('                                                                           LOTE   : '+IntToStr(iIdLoteConcessao));
      Add('USUÁRIO : '+Sistema.NomeUsuario+'                               DATA DA CONCESSÃO : '+DateToStr(date));
      Add('-----------------------------------------------------------------------------------------------------');
      Add('Participante : '+qryTitular.FieldByName('Nome').AsString);
      Add(' ');
      Add('Data de Nascimento  : '+qryTitular.FieldByName('DataNasc').AsString);
      Add('Data do Falecimento : '+qryTitular.FieldByName('DataMorte').AsString);

      Add('-----------------------------------------------------------------------------------------------------');
      Add('  ');

      Add(PreparaStr('Patrocinadora  : '  +qryTitular.FieldByName('NomePatro').AsString,50)+
          PreparaStr('Matrícula : '       +qryTitular.FieldByName('Matricula').AsString,49));

      Add(PreparaStr('Plano Previdenciário : '+qryTitular.FieldByName('NomePlano').AsString,50)+
          PreparaStr('Data de Admissão : '+qryTitular.FieldByName('DataAdmissao').AsString,49));

      Add(PreparaStr('Número de Inscrição  : '+qryTitular.FieldByName('InscricaoNumero').AsString,50)+
          PreparaStr('Data de Demissão : '+qryTitular.FieldByName('DataDemissao').AsString,49));

      Add(PreparaStr('Data de Inscrição    : '+qryTitular.FieldByName('InscricaoData').AsString,50)+
          PreparaStr('Tempo Serv. Total : '+qryTitular.FieldByName('TempoServTotal').AsString+' anos '+
                                            qryTitular.FieldByName('TempoServTotMes').AsString+' meses '+
                                            qryTitular.FieldByName('TempoServTotDia').AsString+' dias ',49));

      Add('-----------------------------------------------------------------------------------------------------');
      Add('PROCESSO Nº : '+qryProcesso.FieldbyName('NumeroProcesso').AsString);
      Add('EVENTO : '+qryProcesso.FieldbyName('Nome').AsString+ ' - DATA : '+qryProcesso.FieldbyName('DtEvento').AsString);
      Add('-----------------------------------------------------------------------------------------------------');
      Add('=> BENEFÍCIOS DO PROCESSO APÓS O DESDOBRAMENTO :');
      Add('    '+PreparaStr('BENEFÍCIO',15)+' '+PreparaStr('BENEFICIÁRIO',30)+' '+PreparaStr('CONCESSÃO',10)+' '+PreparaStr('DIB',11)+' '+
                     PreparaStr('VL.TOTAL',10)+' '+PreparaStr('RATEADO',07)+' '+PreparaStr('SITUAÇÃO',09));

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT BF.IDPESSOA,        BF.IDTITULAR,      BF.IDPLANOPREV, BF.IDPLANOORIGEM,  '+
                     '        BF.IDPESSJUR,  BF.IDBENEFICIO,     BF.NUMEROPROCESSO, BF.NUMPROCINSS,     '+
                     '        BF.VALORATUAL, BF.VALORCALCULADO,  BF.VALORCOTAS,                         '+
                     '        BF.VALORTOTAL, BF.VLRCALCINSS,     BF.VLRINFINSS,                         '+
                     '        BF.DATAFINAL,  BF.DATAINICIO,      BF.DATAINICIOFUND, BF.DATAINICIOINSS,  '+
                     '        BF.DATAREQUERIMENTO,               BF.IDSITBENEFICIO, BF.IDTPPAGTOBENEFIC,'+
                     '        BF.DATACONCESSAO,                                                         '+
                     '        BF.CODPORTFORMA,   BF.SEQPROPOSTA, BT.IDRESPONSAVEL,                      '+
                     '        PF.DATANASC,       PF.SEXO,                                               '+
                     '        PRESP.NOME AS NOMERESPONSAVEL,     BT.PRIORIDADE,     BT.PERCENTUAL,      '+
                     '        DT.NUMSEQUENCIA,     DT.IDDEPENDENCIA,    DT.FLGCONTAIMPOSTOR,            '+
                     '        DT.FLGCONTASALARIOF, DT.FLGBENEFICIARIO,  D.DESCRICAO,                    '+
                     '        P.NOME, TP.FLGFREQUENCIA, B.NOME AS NOMEBENEFICIO, S.DESCRICAO AS SITUACAO'+
                     ' FROM   BENEFBFCIARIO BF, PESSOA P, PESSOAFISICA PF, BFCIARIOTITPLAN BT,          '+
                     '        PESSOA PRESP, DEPEN D, DEPENTIT DT, TPPAGTOBENEFICIO TP, BENEFICIO B,     '+
                     '        SITBENEFICIO S                                                            '+
                     ' WHERE  BF.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+
                     //BRUNO AZEVEDO - SOL 162759 e SOL 162523
                     ' AND    BF.IDBENEFICIO    = '+IntToStr(iIdBeneficio)+
                     ' AND    BF.IDPESSOA       = P.IDPESSOA                                            '+
                     ' AND    PF.IDPESSOA       = P.IDPESSOA                                            '+
                     ' AND    BF.IDPESSOA       = BT.IDPESSOA                                           '+
                     ' AND    BF.IDTITULAR      = BT.IDTITULAR                                          '+
                     ' AND    BF.IDPESSJUR      = BT.IDPESSJUR                                          '+
                     ' AND    BF.IDPLANOPREV    = BT.IDPLANOPREV                                        '+
                     ' AND    BF.IDPLANOORIGEM  = BT.IDPLANOORIGEM                                      '+
                     ' AND    BF.IDBENEFICIO    = BT.IDBENEFICIO                                        '+
                     ' AND    BT.IDPESSOA       = DT.IDPESSOA                                           '+
                     ' AND    BT.IDTITULAR      = DT.IDTITULAR                                          '+
                     ' AND    BT.IDRESPONSAVEL  = PRESP.IDPESSOA(+)                                     '+
                     ' AND    DT.IDDEPENDENCIA  = D.IDDEPENDENCIA                                       '+
                     ' AND    BF.IDTPPAGTOBENEFIC = TP.IDTPPAGTOBENEFIC                                 '+
                     ' AND    B.IDBENEFICIO       = BF.IDBENEFICIO                                      '+
                     ' AND    S.IDSITBENEFICIO  = BF.IDSITBENEFICIO                                     '+
                     ' ORDER BY B.NOME, BF.DATACONCESSAO ');
      qryAux.Open;

      qryAux.First;
      while not qryAux.Eof do
      begin
         Add(' => '+PreparaStr(qryAux.FieldByName('NomeBeneficio').AsString,15)+' '+
                    PreparaStr(qryAux.FieldByName('Nome').AsString,30)+' '+
                    PreparaStr(qryAux.FieldByName('DataConcessao').AsString,10)+' '+
                    PreparaStr(qryAux.FieldByName('DATAINICIOFUND').AsString,10)+'   '+

                    FormatFloat('#0.00', qryAux.FieldByName('VALORTOTAL').AsFloat)+'    '+
                    FormatFloat('#0.00', qryAux.FieldByName('VALORATUAL').AsFloat)+'   '+
                    PreparaStr(qryAux.FieldByName('SITUACAO').AsString,10));

         qryAux.Next;
      end; // while not qryDet.Eof

      // Mostrar mês a mês quanto será pago e quanto será descontado
      Add('-----------------------------------------------------------------------------------------------------');
      Add('=> ACERTOS A PAGAR/DESCONTAR DOS BENEFICIÁRIOS                                                       ');
      Add('-----------------------------------------------------------------------------------------------------');
      Add(' ');
      // Buscar BENEFICIOS a pagar no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         { Inclui DEPENTIT }
         SQL.Add(' SELECT DECODE(P.NOME , NULL, BENEF.NOME, P.NOME) AS RECEBEDOR, BP.FLGCALCTODOMES,                      '+
                 '        DECODE(P.NOME,  NULL, PFBENEF.FLGISENTOIRRF, PF.FLGISENTOIRRF) AS FLGISENTOIRRF,                '+
                 '        DECODE(BTIT.IDRESPONSAVEL, NULL, BTIT.IDPESSOA, BTIT.IDRESPONSAVEL) AS IDRESPONSAVEL,           '+
                 '        DECODE(BP.FLGREFERENCIA, 1, 0, H.VALORSRB) AS VALORSRB,                                         '+
                 '        B.NOME, H.MESREFERENCIA, H.FLGDEVOLUCAO,  H.VALORPREV , H.VALORINTEGRAL,                        '+
                 '        BP.FLGREFERENCIA, BF.DATAINICIOFUND, DP.MATRICULA                                               '+
                 ' FROM   PESSOA BENEF, PESSOA P, PESSOAFISICA PFBENEF, PESSOAFISICA PF, BENEFICIO B, BENEFPLANPREV BP,   '+
                 '        BFCIARIOTITPLAN BTIT, HSTBENEFBFCIARIO H, BENEFBFCIARIO BF, DEPENTIT DP '+
                 ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)      +
                 ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)            +
                 ' AND    H.IDTITULAR        = '+IntToStr(iIdTitular)            +
                 ' AND    H.IDBENEFICIO      = '+IntToStr(iIdBeneficio)          +
                 ' AND    H.SEQPROPOSTA      = 1                                '+
                 ' AND    B.IDBENEFICIO      = H.IDBENEFICIO                    '+
                 ' AND    BF.NUMEROPROCESSO  = H .NUMEROPROCESSO                '+
                 ' AND    BF.IDPLANOORIGEM   = H.IDPLANOORIGEM                  '+
                 ' AND    BF.IDPLANOPREV     = H.IDPLANOPREV                    '+
                 ' AND    BF.IDPESSJUR       = H.IDPESSJUR                      '+
                 ' AND    BF.IDTITULAR       = H.IDTITULAR                      '+
                 ' AND    BF.IDPESSOA        = H.IDPESSOA                       '+
                 ' AND    BF.SEQPROPOSTA     = H.SEQPROPOSTA                    '+
                 ' AND    BF.IDBENEFICIO     = H.IDBENEFICIO                    '+
                 ' AND    BTIT.IDPESSJUR     = BF.IDPESSJUR                     '+
                 ' AND    BTIT.IDPLANOPREV   = BF.IDPLANOPREV                   '+
                 ' AND    BTIT.IDPLANOORIGEM = BF.IDPLANOORIGEM                 '+
                 ' AND    BTIT.IDTITULAR     = BF.IDTITULAR                     '+
                 ' AND    BTIT.SEQPROPOSTA   = BF.SEQPROPOSTA                   '+
                 ' AND    BTIT.IDPESSOA      = BF.IDPESSOA                      '+
                 ' AND    BTIT.IDBENEFICIO   = BF.IDBENEFICIO                   '+
                 ' AND    BENEF.IDPESSOA     = BTIT.IDPESSOA                    '+
                 ' AND    PFBENEF.IDPESSOA   = BTIT.IDPESSOA                    '+
                 ' AND    P.IDPESSOA(+)      = BTIT.IDRESPONSAVEL               '+
                 ' AND    PF.IDPESSOA(+)     = BTIT.IDRESPONSAVEL               '+
                 ' AND    BP.IDPLANOPREV     = H.IDPLANOPREV                    '+
                 ' AND    BP.IDBENEFICIO     = H.IDBENEFICIO                    '+
                 ' AND    BF.IDTITULAR       = DP.IDTITULAR                     '+
                 ' AND    BF.IDPESSOA        = DP.IDPESSOA                      '+
                 ' ORDER BY BTIT.IDRESPONSAVEL, BENEF.NOME, B.NOME, H.MESREFERENCIA ');
         Open;
         First;

         if FieldByName('FLGCALCTODOMES').AsInteger = 0
         then sFormato := '#0.00'
         else sFormato := '#0.0000';
         sRecebedorAtual   := '';
         iIdRecebedorAtual := -1;

         while (not Eof) do
         begin
            sRecebedorAtual   := FieldByName('RECEBEDOR').AsString;
            iIdRecebedorAtual := FieldByName('IDRESPONSAVEL').AsInteger;
            sLinhaMatricula   := '';
            If FieldByName('MATRICULA').AsString <> '' Then
              sLinhaMatricula := PreparaStr(' - MATR.:'+FieldByName('MATRICULA').AsString,15);
            if FieldByName('FLGISENTOIRRF').AsInteger = 0
            then Add(PreparaStr(' - RECEBEDOR : '+sRecebedorAtual,50)
                     +sLinhaMatricula+ '  - '+
                     PreparaStr('Isento de Imposto de Renda : Não ', 49))
            else Add(PreparaStr(' - RECEBEDOR : '+sRecebedorAtual,50)
                     +sLinhaMatricula+ '  - '+
                     PreparaStr('Isento de Imposto de Renda : Sim ', 49));

            Add(' MÊS      ITEM                                    PAGAR          DESCONTAR      [INTEGRAL]   SRB ');
            // Mostrar os beneficios deste recebedor
            while (not Eof) and (sRecebedorAtual = FieldByName('RECEBEDOR').AsString) do
            begin
               if FieldByName('FLGDEVOLUCAO').AsInteger = 0
               then Add(' '+
                        PreparaStr(FieldByName('MESREFERENCIA').AsString                        ,9)+
                        PreparaStr(FieldByName('NOME').AsString                                 ,40)+
                        PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('VALORPREV').AsFloat) ,15)+
                        PreparaStr('(-)'+FormatFloat(sFormato,0)                                ,15)+
                        PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('VALORINTEGRAL').AsFloat) ,14)+
                        PreparaStr(' '+FormatFloat(sFormato,FieldByName('VALORSRB').AsFloat) ,14) )
               else Add(' '+
                        PreparaStr(FieldByName('MesReferencia').AsString                        ,9)+
                        PreparaStr(FieldByName('Nome').AsString                                 ,40)+
                        PreparaStr('(+)'+FormatFloat(sFormato,0)                                ,15)+
                        PreparaStr('(-)'+FormatFloat(sFormato,FieldByName('VALORPREV').AsFloat) ,15)+
                        PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('VALORINTEGRAL').AsFloat) ,14)+
                        PreparaStr(' '+FormatFloat(sFormato,FieldByName('VALORSRB').AsFloat) ,12) );
               Next;
            end; // while 2
         end; // while 1
      end;


      {------------------------------------------------------------------------}
      { Mostrar parcelamento se houver             }
      //BRUNO AZEVEDO DESDOBRAMENTO - COMENTADO A PEDIDO HEBIO E LUCIANO ENQUANTO NAO IMPLEMENTAR DEMONSTRATIVO EM PDF.
      {If FazQuery(QryAux, 'SELECT R.IDPESSOA, R.ANOMESREF, R.PARCELAS, R.IDRUBRICA, R.VALORRUBRICA, '+
                          '       PD.DESCRICAO, P.NOME  '+
                          'FROM RUBRICAINDIV R, PROVDESC PD, PESSOA P '+
                          'WHERE R.ANOMESREF = '+QuotedStr(sAnoMesPagamento)+ ' AND  '+
                          '      R.IDTITULAR = '+QryBeneficiarios.FieldByName('IDTITULAR').AsString+ ' AND  '+
                          '      R.IDPESSOA  = '+QryBeneficiarios.FieldByName('IDPESSOA').AsString+ ' AND  '+
                          '      R.IDLOTEREVISAO = '+IntToStr(iIdLoteConcessao)+ ' AND  '+
                          '      R.IDRUBRICA = PD.IDPROVENTO AND '+
                          '      R.IDPESSOA  = P.IDPESSOA        ')
      Then Begin
        Add('-----------------------------------------------------------------------------------------------------');
        Add('=> RUBRICAS INDIVIDUAIS                                                                              ');
        Add('-----------------------------------------------------------------------------------------------------');
        Add(' ');
        sRecebedorAtual   := QryAux.FieldByName('NOME').AsString;
        iIdRecebedorAtual := QryAux.FieldByName('IDPESSOA').AsInteger;

        Add(' - NOME : '+sRecebedorAtual);
        Add('   RUBRICA                                         PARCELAS           VALOR');
        while (not QryAux.Eof) do begin
          Add('   '+PreparaStr(QryAux.FieldByName('DESCRICAO').AsString,51)+
                    PreparaStr(' '+FormatFloat(sFormato,QryAux.FieldByName('PARCELAS').AsFloat) ,15)+
                    PreparaStr(' '+FormatFloat(sFormato,QryAux.FieldByName('VALORRUBRICA').AsFloat),15));
          QryAux.Next;
        end;
      End;  }

      // Mostrar acertos de tratamento pos-morte
      Add('-----------------------------------------------------------------------------------------------------');
      Add('=> ACERTOS DE BENEFÍCIOS DO TITULAR                                                                  ');
      Add('-----------------------------------------------------------------------------------------------------');
      Add(' ');
      // Buscar ACERTOS
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT P.NOME  AS RECEBEDOR, T.IDPESSOA AS IDRESPONSAVEL,                        '+
                 '        DECODE(PV.DESCRPROVDESC, NULL, PV.DESCRICAO, PV.DESCRPROVDESC) AS NOME,   '+
                 '        T.MESREFERENCIA,                                                          '+
                 '        T.FLGDESCONTO,  SUM(T.VALOR) AS VALORPREV                                 '+
                 ' FROM   PESSOA P, TMPDESC T, PROVDESC PV                                          '+
                 ' WHERE  T.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
                 ' AND    T.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    T.IDPLANOPREV      = '+qryTitular.FieldByName('IDPLANOPREV').AsString+
                 ' AND    T.IDTITULAR        = '+IntToStr(iIdTitular)+
                 ' AND    T.IDPESSOA         <> T.IDTITULAR                                          '+
                 ' AND    T.SEQPROPOSTA      = 1                                                     '+
                 ' AND    PV.IDPROVENTO      = T.IDPROVENTO                                          '+
                 ' AND    P.IDPESSOA         = T.IDPESSOA                                            '+
                 ' GROUP BY P.NOME  , T.IDPESSOA , '+
                 '        DECODE(PV.DESCRPROVDESC, NULL, PV.DESCRICAO, PV.DESCRPROVDESC), '+
                 '        T.MESREFERENCIA, T.FLGDESCONTO '+
                 ' ORDER BY T.IDPESSOA,  T.MESREFERENCIA, DECODE(PV.DESCRPROVDESC, NULL, PV.DESCRICAO, PV.DESCRPROVDESC) ');
         Open;
         while (not Eof) do
         begin
            sRecebedorAtual   := FieldByName('RECEBEDOR').AsString;
            iIdRecebedorAtual := FieldByName('IDRESPONSAVEL').AsInteger;

            Add(' - RECEBEDOR : '+sRecebedorAtual);
            Add('   MÊS    ITEM                                    PAGAR          DESCONTAR      ');
            // Mostrar os beneficios deste recebedor
            while (not Eof) and (sRecebedorAtual = FieldByName('RECEBEDOR').AsString) do
            begin
               if FieldByName('FLGDESCONTO').AsInteger = 0
               then Add(' '+
                        PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                        PreparaStr(FieldByName('Nome').AsString                          ,40)+
                        PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,15)+
                        PreparaStr('(-)'+FormatFloat(sFormato,0)                                ,15))
               else Add(' '+
                        PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                        PreparaStr(FieldByName('Nome').AsString                          ,40)+
                        PreparaStr('(+)'+FormatFloat(sFormato,0)                                ,15)+
                        PreparaStr('(-)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,15));
               Next;
            end; // while 2

         end; // while 1

      end;


      Add('-----------------------------------------------------------------------------------------------------');
      Add('=> CONTRIBUIÇÕES DO PENSIONISTA                                                                      ');
      Add('-----------------------------------------------------------------------------------------------------');
      Add(' ');

      with qryAux do
      begin
         Close;
         SQL.Clear;
         sSQL := ' SELECT DISTINCT P.NOME  AS RECEBEDOR, H.IDPESSOA AS IDRESPONSAVEL,     '+
                 '        CO.NOME,   H.MESREFERENCIA,                            '+
                 '        H.VALORESPERADO AS VALORPREV ,                '+
                 '        0 FLGDESCONTO, H.FLGDEVOLUCAO, bt.idbeneficio '+  
                 ' FROM   PESSOA P, HSTCONTRIBPREV H, CONTRIBUICAO CO, BFCIARIOTITPLAN BT, BENEFBFCIARIO BF '+
                 ' WHERE  H.IDLOTE          = '+IntToStr(iIdLoteConcessao)+
                 ' AND    H.IDPESSJUR       = '+IntToStr(iIdPessJur)+
                 ' AND    BF.IDBENEFICIO    = '+IntToStr(iIdBeneficio)+
                 ' AND    H.IDPESSOA        = BT.IDRESPONSAVEL '+
                 ' AND    H.SEQPROPOSTA     = 1        '+
                 //BRUNO AZEVEDO - SOL 162759 e SOL 162523
                 ' AND    BF.FONTEPAGADORA  = 1        '+
                 ' AND    BT.IDPESSJUR      = H.IDPESSJUR '+
                 ' AND    BT.IDPLANOPREV    = H.IDPLANOPREV '+
                 ' AND    BT.IDTITULAR      = '+IntToStr(iIdTitular)+' '+
                 ' AND    BT.SEQPROPOSTA    = 1 '+
                 ' AND    CO.IDCONTRIBUICAO = H.IDCONTRIBUICAO        '+
                 ' AND    P.IDPESSOA        = H.IDPESSOA              '+
                 ' AND    BT.IDPESSJUR      = BF.IDPESSJUR            '+
                 ' AND    BT.IDTITULAR      = BF.IDTITULAR            '+
                 ' AND    BT.IDPLANOORIGEM  = BF.IDPLANOORIGEM        '+
                 ' AND    BT.IDPESSOA       = BF.IDPESSOA             '+
                 ' AND    BT.SEQPROPOSTA    = BF.SEQPROPOSTA          '+
                 ' AND    BT.IDPLANOPREV    = BF.IDPLANOPREV          '+
                 ' AND    BT.IDBENEFICIO    = BF.IDBENEFICIO          '+
                 ' AND    DECODE(BF.IDPLANPREVCONTAB,28,633,2,259,500) = H.IDCONTRIBUICAO '+
                 ' ORDER BY H.IDPESSOA,  H.MESREFERENCIA, CO.NOME ';
         SQL.Add(sSQL);
         Open;
         while (not Eof) do
         begin
            sRecebedorAtual   := FieldByName('RECEBEDOR').AsString;
            iIdRecebedorAtual := FieldByName('IDRESPONSAVEL').AsInteger;

            Add(' - RESPONSÁVEL : '+sRecebedorAtual);
            Add('   MÊS      ITEM                                    PAGAR          DESCONTAR      ');
            // Mostrar os beneficios deste recebedor
            while (not Eof) and (sRecebedorAtual = FieldByName('RECEBEDOR').AsString) do
            begin
               if FieldByName('FLGDEVOLUCAO').AsInteger = 1 
               then Add('   '+
                        PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                        PreparaStr(FieldByName('Nome').AsString                          ,40)+
                        PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,15)+
                        PreparaStr('(-)'+FormatFloat(sFormato,0)                                ,15))
               else Add('   '+
                        PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                        PreparaStr(FieldByName('Nome').AsString                          ,40)+
                        PreparaStr('(+)'+FormatFloat(sFormato,0)                                ,15)+
                        PreparaStr('(-)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,15));
               Next;

            end; // while 2

         end; // while 1
      end;

      Add('----------------------------------------------------------------------------------------------------');
      Add('                                       APENAS PARA CONFERÊNCIA                                      ');
      Add('----------------------------------------------------------------------------------------------------');
   end; // with
   frmAguarde.Apaga;
   frmMostraAux.ShowModal;
end; // MostraDemonstrativoConcessao


function TfrmDesdobramentoBenef.EfetuaParcelamento: boolean;
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
    dTotalAParcelar : double;

    sSQL, sValorRegra : String;
    bParcelamento, bErroRegra : Boolean;
    nAux : Double;
    sVlrUltContrib, sValorSupl, sValorInss : String;
    sNumParcInss , sNumParcBenef, sNumParcContrib : String;
    dTotalINSS, dTotalBenef, dTotalContrib : Double;
begin
  Result := False;

  dTotalAcerto := -qryBeneficiarios.FieldByName('VALORDIVIDA').AsFloat;

  if qryBeneficiarios.fieldbyname('FLGREFERENCIA').AsInteger = 0 then
    dTotalBenef  := dTotalAcerto
  else
    dTotalINSS  := dTotalAcerto;

  // Se for a pagar, não há parcelamento. O parcelamento só é permitido para descontos
  // do beneficiário
  {if dTotalAcerto > 0 then begin
     Result := True;
     Exit;
  end;}
  FrmAguarde.Apaga;
  if MsgDlg('Valor da dívida, '+OraNumero(TruncaRound(FloatToStr(qryBeneficiarios.FieldByName('VALORDIVIDA').AsFloat),2))+'. '+#13+
            'Deseja parcelar os acertos resultantes do desdobramento ? ',
            'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
  then begin
     Result := True;
     Exit;
  end;

  sNumParcInss    := '0';
  sNumParcBenef   := '0';
  sNumParcContrib := '0';


  try
    frmParcelamentoRevisao := TfrmParcelamentoRevisao.Create(Application);
    with frmParcelamentoRevisao do begin

      redINSS.Value           := dTotalINSS;
      redBeneficio.Value      := dTotalBenef;
      redContribuicao.Value   := dTotalContrib;

      redINSSParc.Value           := 0;
      redBeneficioParc.Value      := 0;
      redContribuicaoParc.Value   := 0;

      if (dTotalINSS < 0)  and (dTotalBenef <= 0) then redINSSParc.Value      := redINSS.Value;
      if (dTotalINSS <= 0) and (dTotalBenef < 0)  then redBeneficioParc.Value := redBeneficio.Value;
      if (dTotalINSS > 0)  and (dTotalBenef < 0)  then redBeneficioParc.Value := redINSS.Value + redBeneficio.Value;
      if (dTotalINSS < 0)  and (dTotalBenef > 0)  then redINSSParc.Value      := redINSS.Value + redBeneficio.Value;

      if (dTotalContrib < 0) and (dTotalBenef < 0)  then
        redContribuicaoParc.Value := redContribuicao.Value
      else if (dTotalContrib < 0) and (dTotalBenef > 0)  then
        redContribuicaoParc.Value   := redContribuicao.Value + redBeneficio.Value
      else if (dTotalContrib > 0) and (dTotalBenef < 0) then
        redBeneficioParc.Value   := redContribuicao.Value + redBeneficio.Value;

      sedNumParcInss.MinValue    := 1;
      sedNumParcBenef.MinValue   := 1;
      sedNumParcContrib.MinValue := 1;

      //regra de margem
      if prmIdRgMargemConsig > 0 then begin
        dtmaprev.qryAux.Close;
        dtmaprev.qryAux.sql.text := ' SELECT IDREGRA, NOMEREGRA FROM REGRA WHERE IDREGRA = '+IntToStr(prmIDRGMARGEMCONSIG)+'';
        dtmaprev.qryAux.open;

        edRegraMargem.text :=  dtmaprev.qryAux.fieldbyname('IDREGRA').AsString+' - '+
                               dtmaprev.qryAux.fieldbyname('NOMEREGRA').AsString;

        sValorSupl := '0';
        sValorInss := '0';
        sVlrUltContrib := '0';
        if qryBeneficiarios.fieldbyname('FLGREFERENCIA').AsInteger = 0 then begin
          qryaux.close;
          qryaux.sql.text := ' SELECT NVL(VALORATUAL,0) VALOR  FROM BENEFBFCIARIO '+
                             ' WHERE  IDPESSJUR    = '+qryBeneficiarios.fieldbyname('IDPESSJUR').AsString+
                             ' AND    IDPLANOPREV  = '+qryBeneficiarios.fieldbyname('IDPLANOPREV').AsString+
                             ' AND    IDPESSOA     = '+qryBeneficiarios.fieldbyname('IDPESSOA').AsString+
                             ' AND    IDTITULAR    = '+qryBeneficiarios.fieldbyname('IDTITULAR').AsString+
                             ' AND    IDSITBENEFICIO IN (1) '+
                             ' AND    IDBENEFICIO IN (SELECT IDBENEFICIO FROM BENEFPLANPREV WHERE FLGREFERENCIA = 0 ) ';
          qryaux.open;
          if not qryaux.isempty then sValorSupl := qryaux.fieldbyname('VALOR').AsString;

          { Pegar o valor da ultima contribuição }
          sSQL := 'SELECT '+
                  '  H.MESREFERENCIA, '+
                  '  SUM(DECODE(FLGDEVOLUCAO,1,-VALORESPERADO,VALORESPERADO)) AS VALORESPERADO '+
                  'FROM   '+
                  '  HSTCONTRIBPREV H '+
                  'WHERE  '+
                  '  H.IDPESSJUR = '+qryBeneficiarios.fieldbyname('IDPESSJUR').AsString    +' AND '+
                  '  H.IDPESSOA  = '+qryBeneficiarios.fieldbyname('IDRESPONSAVEL').AsString+' AND '+
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

        end else begin
          qryaux.close;
          qryaux.sql.text := ' SELECT NVL(VALORATUAL,0) VALOR  FROM BENEFBFCIARIO '+
                             ' WHERE  IDPESSJUR    = '+qryBeneficiarios.fieldbyname('IDPESSJUR').AsString+
                             ' AND    IDPLANOPREV  = '+qryBeneficiarios.fieldbyname('IDPLANOPREV').AsString+
                             ' AND    IDPESSOA     = '+qryBeneficiarios.fieldbyname('IDPESSOA').AsString+
                             ' AND    IDTITULAR    = '+qryBeneficiarios.fieldbyname('IDTITULAR').AsString+
                             ' AND    IDSITBENEFICIO IN (1) '+
                             ' AND    IDBENEFICIO IN (SELECT IDBENEFICIO FROM BENEFPLANPREV WHERE FLGREFERENCIA = 1 ) ';

          qryaux.open;
          if not qryaux.isempty then sValorInss := qryaux.fieldbyname('VALOR').AsString;
        end;


        sSQL := ' SELECT '+
                qryBeneficiarios.fieldbyname('IDPESSJUR').AsString   + ' AS IDPESSJUR,   '+
                qryBeneficiarios.FieldByName('IDPLANOPREV').AsString + ' AS IDPLANOPREV, '+
                qryBeneficiarios.FieldByName('IDPESSOA').AsString    + ' AS IDPESSOA,    '+
                qryBeneficiarios.FieldByName('SEQPROPOSTA').AsString + ' AS SEQPROPOSTA, '+
                qryBeneficiarios.FieldByName('IDSITPART').AsString   + ' AS IDSITPART,   '+
                OraNumero(sVlrUltContrib)                             + ' AS VLRCONTRMES, '+
                OraNumero(FloatToStr(qryBeneficiarios.FieldByName('VLRINFINSS').AsFloat))       + ' AS VLRINFINSS,  '+
                OraNumero(FloatToStr(qryBeneficiarios.FieldByName('SALPARTICIPACAO').AsFloat))  + ' AS SALPARTICIPACAO,  '+
                QuotedStr(FormatDateTime('DD/MM/YYYY',Date))            +' AS DATAREF, '+
                QuotedStr(Copy(DateToStr(Date), 7,4)+'/'+Copy(DateToStr(Date),4,2))+  ' AS HSTMESREF,  '+
                QuotedStr(qryBeneficiarios.FieldByName('DATANASC').AsString)   +      ' AS DATANASC,   '+
                QuotedStr(qryBeneficiarios.FieldByName('NUMDEPIRRF').AsString)+       ' AS NUMDEPIRRF, '+
                QuotedStr(qryBeneficiarios.FieldByName('FLGMOLESTIAGRAVE').AsString)+ ' AS FLGMOLESTIAGRAVE, '+
                QuotedStr(qryBeneficiarios.FieldByName('FLGISENTOIRRF').AsString)+    ' AS FLGISENTOIRRF,    '+
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
        if bErroRegra then begin
           Result   := False;
           Exit;
        end;

        //em vista do valor da mergam, ver qual o percentual referente de cada dívida
        if frmParcelamentoRevisao.redINSSParc.Value < 0 then begin
           frmParcelamentoRevisao.redVlrParcINSS.value :=  strtofloat(truncaround(floattostr(frmParcelamentoRevisao.redMargem.value * (((frmParcelamentoRevisao.redINSSParc.Value*100)/dTotalAcerto)/100)),2))  ;
           nAux := (1 - abs(frac(frmParcelamentoRevisao.redInssParc.Value /  frmParcelamentoRevisao.redVlrParcInss.value) ) + abs(frmParcelamentoRevisao.redInssParc.Value /  frmParcelamentoRevisao.redVlrParcInss.value)) ;
           frmParcelamentoRevisao.sedNumParcInss.text :=  FloatToStr(int(nAux));
           frmParcelamentoRevisao.redVlrParcINSS.value :=  strtofloat(truncaround(floattostr(abs(frmParcelamentoRevisao.redINSSParc.Value / sedNumParcInss.value)),2));
        end;

        if frmParcelamentoRevisao.redBeneficioParc.Value < 0 then begin
           frmParcelamentoRevisao.redVlrParcBenef.value :=  strtofloat(truncaround(floattostr(frmParcelamentoRevisao.redMargem.value * (((frmParcelamentoRevisao.redBeneficioParc.Value*100)/dTotalAcerto)/100)),2));
           nAux := (1 - abs(frac(frmParcelamentoRevisao.redBeneficioParc.Value /  frmParcelamentoRevisao.redVlrParcBenef.value) ) + abs(frmParcelamentoRevisao.redBeneficioParc.Value /  frmParcelamentoRevisao.redVlrParcBenef.value))  ;
           frmParcelamentoRevisao.sedNumParcBenef.text :=  FloatToStr(int(nAux));
           frmParcelamentoRevisao.redVlrParcBenef.value :=  strtofloat(truncaround(floattostr(abs(frmParcelamentoRevisao.redBeneficioParc.Value / frmParcelamentoRevisao.sedNumParcBenef.value)),2));
        end;


        if frmParcelamentoRevisao.redContribuicaoParc.Value < 0 then begin
           frmParcelamentoRevisao.redVlrParcContrib.value :=  strtofloat(truncaround(floattostr(frmParcelamentoRevisao.redMargem.value * (((frmParcelamentoRevisao.redContribuicaoParc.Value*100)/dTotalAcerto)/100)),2)) ;
           nAux := (1 - abs(frac(frmParcelamentoRevisao.redContribuicaoParc.Value /  frmParcelamentoRevisao.redVlrParcContrib.value))  + abs(frmParcelamentoRevisao.redContribuicaoParc.Value /  frmParcelamentoRevisao.redVlrParcContrib.value))  ;
           frmParcelamentoRevisao.sedNumParcContrib.text :=  FloatToStr(int(nAux));
           frmParcelamentoRevisao.redVlrParcContrib.value :=  strtofloat(truncaround(floattostr(abs(frmParcelamentoRevisao.redContribuicaoParc.Value / frmParcelamentoRevisao.sedNumParcContrib.value)),2));
        end;

      end else begin { if prmIdRgMargemConsig > 0 then begin }
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

      dTotalINSS    := redINSSParc.Value;
      dTotalBenef   := redBeneficioParc.Value;
      dTotalContrib := redContribuicaoParc.Value;

      sNumParcInss    := floattostr(sedNumParcInss.Value);
      sNumParcBenef   := floattostr(sedNumParcBenef.Value);
      sNumParcContrib := floattostr(sedNumParcContrib.Value);

      mrResult               := ShowModal;

      { Receber os dados alterados na tela de parcelamento }
      dTotalINSS    := redINSSParc.Value;
      dTotalBenef   := redBeneficioParc.Value;
      dTotalContrib := redContribuicaoParc.Value;

      sNumParcInss    :=  floattostr(sedNumParcInss.Value);
      sNumParcBenef   :=  floattostr(sedNumParcBenef.Value);
      sNumParcContrib :=  floattostr(sedNumParcContrib.Value);

      if mrResult <> mrOK then begin
         Result := True;
         Exit;
      end;
    end; { with frmParcelamentoRevisao do begin }

  finally
   frmParcelamentoRevisao.Free;
  end;

  bParcelamento := True;

  sDataInicio  := '01/'+Copy(sAnoMesPagamento,6,2)+'/'+Copy(sAnoMesPagamento,1,4);
  sAnoMes      := Copy(sAnoMesPagamento,1,4)+'/'+Copy(sAnoMesPagamento,6,2);

  // ***************************************************************************
  // INSERIR PARCELA DE BENEFICIOS NA RUBRICAINDIV
  // ***************************************************************************

  qryBeneficiarios.first;
  while not qryBeneficiarios.eof do begin

     dTotalAcerto := -qryBeneficiarios.FieldByName('VALORDIVIDA').AsFloat;

     if qryBeneficiarios.fieldbyname('FLGREFERENCIA').AsInteger = 0 then
       dTotalBenef  := dTotalAcerto
     else
       dTotalINSS  := dTotalAcerto;

     // Se for a pagar, não há parcelamento. O parcelamento só é permitido para descontos do beneficiário
     if dTotalAcerto <= 0 then begin

       if qryBeneficiarios.fieldbyname('FLGREFERENCIA').AsInteger = 0 then begin
          iNumParcelas := StrToInt(sNumParcBenef);


          if dTotalBenef = 0 then begin
             qryBeneficiarios.next;
             continue;
          end;

          dTotalAcerto := dTotalBenef / StrToInt(sNumParcBenef)
       end else begin
          iNumParcelas := StrToInt(sNumParcInss);


          if dTotalINSS = 0 then begin
             qryBeneficiarios.next;
             continue;
          end;

          dTotalAcerto := dTotalINSS / StrToInt(sNumParcInss);
       end;

       for i := 1 to iNumParcelas - 1 do
           sAnoMes := ProximoAnoMes(StrToInt(Copy(sAnoMes,6,2)),StrToInt(Copy(sAnoMes,1,4)) );

       iDiaFinal   := TrazUltDiaMes(StrToInt(Copy(sAnoMes,6,2)),StrToInt(Copy(sAnoMes,1,4)) );
       sDataFinal  := IntToStr(iDiaFinal)+'/'+Copy(sAnoMes,6,2)+'/'+Copy(sAnoMes,1,4);

       if dTotalAcerto > 0
       then begin
          iIdRubrica := qryBeneficiarios.FieldByName('IDRUBRICAREVISAO').AsInteger
       end
       else begin
          dTotalAcerto := -dTotalAcerto;
          iIdRubrica   := qryBeneficiarios.FieldByName('IDRUBDEVOLUCAO').AsInteger;
       end;

       if iIdRubrica <= 0 then begin
         MsgDlg('Rubrica para parcelamento de acertos não cadastrada. ','Informação',mtInformation,[mbOk,mbHelp],0);
         Exit;
       end;

       { Verifica se a rubrica esta Bloqueada }
       If FParcelamentoRevisao.RubricaBloqueada(QryAux, iIdRubrica) = True Then Begin
          Exit;
         MsgDlg('Rubrica para Parcelamento de Acertos bloqueada.','Informação',mtInformation,[mbOk,mbHelp],0);
         Exit;
       End;

       if qryBeneficiarios.FieldByName('IDTITULAR').AsInteger = qryBeneficiarios.FieldByName('IDPESSOA').AsInteger
       then bBenefProprio := True
       else bBenefProprio := False;

       sSQL := ' INSERT INTO RUBRICAINDIV ( '+
               ' ANOMESREF,      DATAINICIO,      DATAFINAL,                         '+
               ' FLGPENSAOALIM,  FLGPERMANENTE,     FLGTPRUBMANUT,   FLGUSAABONO,    '+
               ' IDEMPRESA,      IDPESSOA,          IDRUBRICA,       IDTITULAR,      '+
               ' NUMOCORRENCIAS, PARCELAS,          SEQRUBRICAINDIV, ULTMESPREPARO,  '+
               ' VALORANTERIOR,  VALORRUBRICA, IDLOTEREVISAO)                 '+
               ' VALUES (                                                            '+
               ''''+sAnoMesPagamento+''', '+
               ' TO_DATE('''+sDataInicio+''',''DD/MM/YYYY'') ,                       '+
               ' TO_DATE('''+sDataFinal +''',''DD/MM/YYYY'') ,                       '+
               ' 0,                                                                  '+// FLGPENSAOALIM {0}
               ' 0,                                                                  '+// FLGPERMANENTE {0}
               ' ''1'',                                                              '+// FLGTPRUBMANUT {"1"}
               ' 0,                                                                  '+// FLGUSAABONO   {0}
               IntToStr(Sistema.IdEmpresa)+',                                        '+
               qryBeneficiarios.FieldByName('IDPESSOA').AsString+',                         '+
               IntToStr(iIdRubrica)+',                                               '+
               qryBeneficiarios.FieldByName('IDTITULAR').AsString+',                 '+
               ' 0,                                                                  '+// NUMOCORRENCIAS {0}
               IntToStr(iNumParcelas)+',                                             '+
               '(SELECT (NVL(MAX(SEQRUBRICAINDIV),0)+1) FROM RUBRICAINDIV WHERE IDPESSOA = '+qryBeneficiarios.FieldByName('IDPESSOA').AsString+
               ' AND IDRUBRICA = '+IntToStr(iIdRubrica)+'), '+ // SEQRUBRICAINDIV,

               ' ''0000/00'',                                                        '+
               ' 0,                                                                  '+// VALORANTERIOR {0}
                OraNumero(TruncaRound(FloatToStr(Abs(dTotalAcerto)),2))+', '+          // VALORRUBRICA
                IntToStr(iIdLoteConcessao)+')';                            // IDLOTEREVISAO
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add(sSQL);
       try
         qryAux.ExecSQL;
       except
     //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
      on e:Exception do
      begin
        TratarErro(e.Message);
         MsgDlg('Erro ao inserir parcelamento de beneficio.','Informação',mtError,[mbOk,mbHelp],0);
         Exit;
       end;
     //Brunno Mattos - KTN 767861 - SOL 132659 Fim

     end;

       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add('SELECT DESCRICAO FROM PROVDESC WHERE IDPROVENTO = '+IntToStr(iIdRubrica));
       qryAux.Open;

     qryBeneficiarios.Next;
  end;

  qryaux.close;
  qryaux.SQL.text := ' UPDATE HSTBENEFBFCIARIO  SET '+
                     ' DTEFETPGTO = LAST_DAY(TO_DATE(SUBSTR(MESREFERENCIA,1,4)||DECODE(SUBSTR(MESREFERENCIA,5,3),''/13'',''/12'',SUBSTR(MESREFERENCIA,5,3)),''YYYY/MM'')) ,'+
                     ' FLGENVIADO = 1,  VLBENEFPGTO  = VALORPREV '+
                     ' WHERE  IDPESSJUR    = '+qryBeneficiarios.fieldbyname('IDPESSJUR').AsString+
                     ' AND    IDPLANOPREV  = '+qryBeneficiarios.fieldbyname('IDPLANOPREV').AsString+
                     ' AND    IDPESSOA     = '+qryBeneficiarios.fieldbyname('IDPESSOA').AsString+
                     ' AND    IDTITULAR    = '+qryBeneficiarios.fieldbyname('IDTITULAR').AsString+
                     ' AND    SEQPROPOSTA  = '+qryBeneficiarios.FieldByName('SEQPROPOSTA').AsString +
                     ' AND    IDLOTE       = '+IntToStr(iIdLoteConcessao)+
                     //BRUNO AZEVEDO - SOL 162759 e SOL 162523
                     //' AND    IDMOTIVO     = '+IntToStr(3057)+
                     ' AND    FLGDEVOLUCAO = 1 ';
  try
   qryAux.ExecSQL;
  except
  //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
  on e:Exception do
  begin
    TratarErro(e.Message);
    MsgDlg('Erro ao acertar benefícios parcelados.' ,'Informação',mtError,[mbOk,mbHelp],0);
    Exit;
  end;
  //Brunno Mattos - KTN 767861 - SOL 132659 Fim
  end;
  end;
  Result := True;
end;

procedure TfrmDesdobramentoBenef.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FreeAndNil( CtrlBenefBfciario );   

end;
//SOL 174933 KINTANA 1733374

procedure TfrmDesdobramentoBenef.InserirControleDividaBenef(_IDPESSOA,_IDTITULAR,_IDBENEFICIO,_IDPLANOPREV,_DATA,
                                                            _VALORBENEFICIO,_VALORULTIMAPARCELA,_IDMOTIVO,_FLGDESATIVADO,
                                                            _FLGATUALIZARSALDO,_FLGQUITADO,_FLGDESCFOLHA,_FLGPORTFORMA,
                                                            _IDPESSJUR,_MESREFERENCIA,_FLGSITUACAO,_MESCOBRANCA,_FONTEPAGADORA,
                                                            _NUMPROCINSS :string;                      //edilaine 56256
                                                            _percRed,_vldivida:double;_flgvaiatualizar:Boolean;
                                                            var IDHSTORICODIVIDABENEFICIO,IDCONTROLEDIVIDABENEFICIO:string;
                                                            _flgvaiparcelar:boolean;     //Douglas.Siqueira 174933
                                                            NUMPROCESSO : Integer);      //Peterson Victor SIG27210
var
  _query,_query3:TwwQuery;
  idcontrole,idhstcontrole:double;
  i:Integer;
  dTotalBenef:Double;
  dTotalINSS:Double;
  mrResult        : TModalResult;
  SaldoDev:Double;
  totParc:string;
  totPerc:string;
  totVlParc:string;
  DtIni:string;
  Dtfim:string;
  PercRedTrat:double;
  erroT:Boolean;
  datapagamento:string;
  _TIPOPAGTO : string;                  //edilaine - SIG33744
begin

_MESREFERENCIA:=COPY(_MESREFERENCIA,7,4)+'/'+COPY(_MESREFERENCIA,4,2);

dTotalBenef:=0;
dTotalINSS:=0;
SaldoDev:=0;


totParc:='1';
totPerc:='100.00' ;
totVlParc:=formatfloat('0.00',_vldivida);
DtIni:=DateToStr(Now);
Dtfim:=DateToStr(Now);

if qryBeneficiarios.fieldbyname('FLGREFERENCIA').AsInteger = 0 then
  begin
  dTotalBenef  := _vldivida;
  SaldoDev:=dTotalBenef;
  _FLGATUALIZARSALDO := '1';       //edilaine - SIG33744
  end
else
  begin
  dTotalINSS  := _vldivida;
  SaldoDev:=dTotalINSS;
  _FLGATUALIZARSALDO := '0';       //edilaine - SIG33744
  end;

  // edilaine - SOL 253577-17664 / PPM 1019932 - inicio
  _MESCOBRANCA:=ProximoAnoMes(StrToInt(Copy(_MESCOBRANCA, 6,2)), StrToInt(Copy(_MESCOBRANCA, 1,4))); ///NR04 MES+1

  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.Add('SELECT C.IDLOTE, C.DATAPAGAMENTO, C.DESCRICAO, C.MESREFERENCIA, 0 AS FECHALOTE, NVL(C.FLGINCLUIMESCONC,1) FLGINCLUIMESCONC  '+
                 '  FROM CTRLINTERFACE C '+
                 ' WHERE C.IDLOTE = '+IntToStr(iIdLoteConcessao) );
  qryAux.open;
  if not qryAux.eof then
     DtIni:= Copy(qryAux.Fields[1].AsString,1,2)+'/'+Copy(_MESCOBRANCA, 6,2)+'/'+(Copy(_MESCOBRANCA, 1,4));
  // edilaine - SOL 253577-17664 / PPM 1019932 - fim

//edilaine SIG128237 : inicio
DtIni := '20'+'/'+Copy(_MESCOBRANCA, 6,2)+'/'+(Copy(_MESCOBRANCA, 1,4));
DtIni := GetDiaUtil(DtIni,0);
//edilaine SIG128237 : fim

if _flgvaiparcelar then
   begin


     repeat
     begin//repeat

    try
        FrmInfParcRevBenef := TFrmInfParcRevBenef.Create(Application);
        with FrmInfParcRevBenef do begin
        tela:='1';
        if dTotalINSS>0 then
           edtvlbeneficio.Text:=_VALORBENEFICIO
        else
           edtvlbeneficioFuncef.Text:=_VALORBENEFICIO;
           
        edtSaldoReviInss.text:= FloatToStr(dTotalINSS);
        edtSaldoRevFunc.text:= FloatToStr(dTotalBenef);

        dtpDataInicioInss.datetime:=strtodate(DtIni);        // edilaine - SOL 253577-17664 / PPM 1019932
        dtpDataInicioFunc.datetime:=StrToDate(DtIni);        // edilaine - SOL 253577-17664 / PPM 1019932

        if qryBeneficiarios.fieldbyname('FLGREFERENCIA').AsInteger = 0 then
           begin
           PercRedTrat:=getPercParc(_percRed, StrToFloat(_VALORBENEFICIO), dTotalBenef, _FONTEPAGADORA, 2);  //adiciona mais parametros //Helio - SOL Nº 228244-16260 PPM Nº 442505
           edtPercParcFunc.text:=FloatToStr(PercRedTrat);
           end
        else
           //Helio - SOL Nº 228244-16260 PPM Nº 442505
           //edtPercParcInss.text:='30';
           begin
              PercRedTrat:=getPercParc(_percRed, StrToFloat(_VALORBENEFICIO), dTotalINSS, _FONTEPAGADORA, 2); //adiciona mais parametros //Helio - SOL Nº 228244-16260 PPM Nº 442505
              edtPercParcINSS.text:=FloatToStr(PercRedTrat);
           end;
            //FIM Helio - SOL Nº 228244-16260 PPM Nº 442505

//_query3.close;
//_query3.SQL.Clear;
//_query3.SQL.Add('select mesreferencia,datapagamento,flgincluimesconc,datapreparo from ctrlinterface');//douglas.siqueira
//_query3.SQL.Add('where idlote = '+#39+inttostr(iIdLoteConcessao)+#39);
//_query3.open;
//
//    dtpDataInicioInss.datetime:=strtodate(query3.fieldbyname('datapagamento').text);
//    dtpDataInicioFunc.datetime:=StrToDate(sDataFolha);

//Helio - SOL Nº 228244-16260 PPM Nº 442505
    if qryBeneficiarios.fieldbyname('FLGREFERENCIA').AsInteger = 0 then
      CalculaValores(    0
                        ,PercRedTrat
                        ,0
                        ,StrToFloat(edtSaldoRevFunc.text)
                        ,sedQtParcFunc
                        ,edtVlParcFunc
                        ,edtPercParcFunc,'1',strtofloat(_VALORBENEFICIO))
       else
         CalculaValores( 0
                        ,PercRedTrat
                        ,0
                        ,StrToFloat(edtSaldoReviInss.text)
                        ,sedQtParcINSS
                        ,edtVlParcINSS
                        ,edtPercParcINSS,'2',strtofloat(_VALORBENEFICIO));

{como era feito antes
    if qryBeneficiarios.fieldbyname('FLGREFERENCIA').AsInteger = 0 then
      CalculaValores(    0
                        ,PercRedTrat
                        ,0
                        ,StrToFloat(edtSaldoRevFunc.text)
                        ,sedQtParcFunc
                        ,edtVlParcFunc
                        ,edtPercParcFunc,'1',strtofloat(_VALORBENEFICIO))
       else
         CalculaValores( 0
                        ,30
                        ,0
                        ,StrToFloat(edtSaldoReviInss.text)
                        ,sedQtParcINSS
                        ,edtVlParcINSS
                        ,edtPercParcINSS,'2',strtofloat(_VALORBENEFICIO));
////// alteração 08/01/2014


  if qryBeneficiarios.fieldbyname('FLGREFERENCIA').AsInteger = 0 then
      CalculaValores(    0
                        ,0
                        ,StrToFloat(sedQtParcFunc.text)+1
                        ,StrToFloat(edtSaldoRevFunc.text)
                        ,sedQtParcFunc
                        ,edtVlParcFunc
                        ,edtPercParcFunc,'1',strtofloat(_VALORBENEFICIO))
       else
         CalculaValores( 0
                        ,0
                        ,StrToFloat(sedQtParcINSS.text)+1
                        ,StrToFloat(edtSaldoReviInss.text)
                        ,sedQtParcINSS
                        ,edtVlParcINSS
                        ,edtPercParcINSS,'2',strtofloat(_VALORBENEFICIO));}

//FIM Helio - SOL Nº 228244-16260 PPM Nº 442505

////// alteração 08/01/2014


        mrResult               := ShowModal;

         if mrResult <> mrOK then begin
             Exit;
          end;
        erroT:=erro;  

        if qryBeneficiarios.fieldbyname('FLGREFERENCIA').AsInteger = 0 then
             begin
             totParc:=FrmInfParcRevBenef.sedQtParcFunc.Text;
             totPerc:=FrmInfParcRevBenef.edtPercParcFunc.text;
             totVlParc:=FrmInfParcRevBenef.edtVlParcFunc.text;
             DtIni:=DateToStr(FrmInfParcRevBenef.dtpDataInicioFunc.Datetime);
             Dtfim:=DateToStr(FrmInfParcRevBenef.dtpDataFimFunc.Datetime);
             end
          else
             begin
             totParc:=FrmInfParcRevBenef.sedQtParcInss.Text;
             totPerc:=FrmInfParcRevBenef.edtPercParcInss.text;
             totVlParc:=FrmInfParcRevBenef.edtVlParcInss.text;
             DtIni:=DateToStr(FrmInfParcRevBenef.dtpDataInicioInss.Datetime);
             Dtfim:=DateToStr(FrmInfParcRevBenef.dtpDataFimInss.Datetime);
             end;



        end;



    finally
         FrmInfParcRevBenef.free;
    end;
      end;
      until errot<>True;
    end;

idcontrole:=0;
idhstcontrole:=0;


_query:=TwwQuery.Create(Self);
_query.DataBaseName :='BaseDados';
_query.Active:=false;
_query.Sql.Clear;


_query3:=TwwQuery.Create(Self);
_query3.DataBaseName :='BaseDados';
_query3.Active:=false;
_query3.Sql.Clear;

_query3.close;
_query3.SQL.Clear;
_query3.SQL.Add('select mesreferencia,datapagamento,flgincluimesconc,datapreparo from ctrlinterface');//douglas.siqueira
_query3.SQL.Add('where idlote = '+#39+inttostr(iIdLoteConcessao)+#39);
_query3.open;

datapagamento:=_query3.fieldbyname('datapagamento').text;

  //edilaine - SIG33744 - inicio
  if (_FLGPORTFORMA='') or (_FLGPORTFORMA ='0') then
     _TIPOPAGTO := 'F'
  else
     _TIPOPAGTO := 'B';
  //edilaine - SIG33744 - fim


if _flgvaiatualizar then
   begin
    _query.SQL.Add('update CONTROLEDIVIDABENEFICIO');
    _query.SQL.Add('   set QTDEPARCELAS =trunc('+OraNumero(totParc));
    _query.SQL.Add(',2)  , PERCENTUAL =trunc('+OraNumero(totPerc));
    _query.SQL.Add(',2)  , VALORPARCELA =trunc('+OraNumero(totVlParc));
    _query.SQL.Add(',2)  , MESINICIO ='+#39+DtIni+#39);
    _query.SQL.Add('  , MESFIM ='+#39+Dtfim+#39);
    _query.SQL.Add('  , NUMPROCINSS = '+#39+_NUMPROCINSS+#39);         //edilaine SIG56256
    _query.SQL.Add('   where IDCONTROLEDIVIDABENEFICIO = '+IDCONTROLEDIVIDABENEFICIO);
    _query.ExecSQL;

    //_MESCOBRANCA:=ProximoAnoMes(StrToInt(Copy(_MESCOBRANCA, 6,2)), StrToInt(Copy(_MESCOBRANCA, 1,4))); ///NR04 MES+1   // edilaine - SOL 253577-17664 / PPM 1019932

    _query.Sql.Clear;
    _query.SQL.Add('update HSTDIVIDABENEFICIO');
    _query.SQL.Add('   set MESREFERENCIA ='+#39+_MESREFERENCIA+#39);
    _query.SQL.Add('  , MESCOBRANCA ='+#39+_MESCOBRANCA+#39);
    _query.SQL.Add('  , VALORPREVISTO =trunc('+OraNumero(totVlParc)+',2)' );
    //edilaine SIG128237 : inicio
    //_query.SQL.Add('  , DATAPREVISTA =ADD_MONTHS('+#39+datapagamento+#39+',1)');
    _query.SQL.Add('  , DATAPREVISTA = '+QuotedStr(dtIni) );
    //edilaine SIG128237 : fim
    _query.SQL.Add('  , TIPOPAGAMENTO = '+#39+_TIPOPAGTO+#39);          //edilaine - SIG33744
    _query.SQL.Add(' where IDHSTORICODIVIDABENEFICIO ='+IDHSTORICODIVIDABENEFICIO);
    _query.ExecSQL;

    {insere movimento atualizacao saldo}
    CriaLogDivida(IDCONTROLEDIVIDABENEFICIO, '7' );    //edilaine SIG126276

   end
else
   begin
    idcontrole := (LeUltRegistro(Nil,'CONTROLEDIVIDABENEFICIO'));
    IDCONTROLEDIVIDABENEFICIO:=floattostr(idcontrole);
    _query.SQL.Add('INSERT INTO CONTROLEDIVIDABENEFICIO');
    _query.SQL.Add('  (IDCONTROLEDIVIDABENEFICIO,');
    _query.SQL.Add('   IDPESSOA,');
    _query.SQL.Add('   IDTITULAR,');
    _query.SQL.Add('   IDBENEFICIO,');
    _query.SQL.Add('   IDPLANOPREV,');
    _query.SQL.Add('   DATA,');
    _query.SQL.Add('   SALDODEVEDORINICIAL,');
    _query.SQL.Add('   VALORBENEFICIO,');
    _query.SQL.Add('   VALORULTIMAPARCELA,');
    _query.SQL.Add('   VALORPARCELA,');
    _query.SQL.Add('   SALDODEVEDORATUAL,');
    _query.SQL.Add('   MESINICIO,');
    _query.SQL.Add('   MESFIM,');
    _query.SQL.Add('   QUANTIDADEPARCELASPAGAS,');
    _query.SQL.Add('   QTDEPARCELAS,');
    _query.SQL.Add('   PERCENTUAL,');
    _query.SQL.Add('   IDMOTIVO,');
    _query.SQL.Add('   FLGDESATIVADO,');
    _query.SQL.Add('   FLGATUALIZARSALDO,');
    _query.SQL.Add('   FLGQUITADO,');
    _query.SQL.Add('   FLGDESCFOLHA,');

    _query.SQL.Add('   FLGSTATUS,');             //BRUNO AZEVEDO - SIG33744
    _query.SQL.Add('   NUMPROCINSS,  ');         //edilaine SIG56256

    _query.SQL.Add('   FLGPORTFORMA,FLGTIPODIVIDA,FONTEPAGADORA,IDPESSJUR,');
    _query.SQL.Add('   NUMEROPROCESSO)' ); // Peterson Victor SIG 27210
    _query.SQL.Add('VALUES');
    _query.SQL.Add('  ('+FLOATTOSTR(IDCONTROLE)+',');
    _query.SQL.Add('   '+_IDPESSOA+',');
    _query.SQL.Add('   '+_IDTITULAR+',');
    _query.SQL.Add('   '+_IDBENEFICIO+',');
    _query.SQL.Add('   '+_IDPLANOPREV+',');
    _query.SQL.Add('   '+#39+_DATA+#39+',');
    _query.SQL.Add(' trunc( '+OraNumero(floattostr(SaldoDev))+' ,2 ),');//_SALDODEVEDORINICIAL
    _query.SQL.Add(' trunc( '+OraNumero((_VALORBENEFICIO))+' ,2 ),');
    _query.SQL.Add(' trunc( '+OraNumero((_VALORULTIMAPARCELA))+' ,2),');
    _query.SQL.Add(' trunc( '+OraNumero((totVlParc))+',2 ),');
    _query.SQL.Add(' trunc( '+OraNumero(floattostr(SaldoDev))+' ,2),');//_SALDODEVEDORATUAL
    _query.SQL.Add('   '+#39+DtIni+#39+',');
    _query.SQL.Add('   '+#39+Dtfim+#39+',');
    _query.SQL.Add('   '+'0'+',');
    _query.SQL.Add(' trunc( '+OraNumero((totParc))+',2 ),');
    _query.SQL.Add(' trunc( '+OraNumero((totPerc))+',2 ),');
     _query.SQL.Add('   '+_IDMOTIVO+',');
    _query.SQL.Add('   '+_FLGDESATIVADO+',');
    _query.SQL.Add('   '+_FLGATUALIZARSALDO+',');
    _query.SQL.Add('   '+_FLGQUITADO+',');
    _query.SQL.Add('   '+#39+_FLGDESCFOLHA+#39+',');

    _query.SQL.Add('   '+'1'+',');                         //BRUNO AZEVEDO - SIG33744
    _query.SQL.Add('   '+#39+_NUMPROCINSS+#39+',');        //edilaine SIG56256

    _query.SQL.Add('   '+_FLGPORTFORMA+',');

    _query.SQL.Add('   '+'1'+',');
    _query.SQL.Add('   '+_FONTEPAGADORA+',');
    _query.SQL.Add('   '+_IDPESSJUR+',');
    _query.SQL.Add('   '+ IntToStr(NUMPROCESSO) + ')'); // Peterson Victor SIG 27210
    _query.ExecSQL;

    //_MESCOBRANCA:=ProximoAnoMes(StrToInt(Copy(_MESCOBRANCA, 6,2)), StrToInt(Copy(_MESCOBRANCA, 1,4))); ///NR04 MES+1    // edilaine - SOL 253577-17664 / PPM 1019932



    idhstcontrole:= (LeUltRegistro(Nil,'HSTDIVIDABENEFICIO'));
    IDHSTORICODIVIDABENEFICIO:=floattostr(idhstcontrole);
    _query.close;
    _query.sql.Clear;
    _query.SQL.Add('insert into HSTDIVIDABENEFICIO');
    _query.SQL.Add('  (IDHSTORICODIVIDABENEFICIO,');
    _query.SQL.Add('   IDHISTORICODIVIDABENEFICIOREF,');
    _query.SQL.Add('   IDCONTROLEDIVIDABENEFICIO,');
    _query.SQL.Add('   IDPESSOA,');
    _query.SQL.Add('   IDTITULAR,');
    _query.SQL.Add('   IDPESSJUR,');
    _query.SQL.Add('   IDBENEFICIO,');
    _query.SQL.Add('   IDPLANOPREV,');
    _query.SQL.Add('   MESREFERENCIA,');
    _query.SQL.Add('   MESCOBRANCA,');
    _query.SQL.Add('   NUMEROPARCELA,');
    _query.SQL.Add('   VALORPREVISTO,');
    _query.SQL.Add('   VALORRECEBIDO,');
    _query.SQL.Add('   DATAPREVISTA,');
    _query.SQL.Add('   DATAEFETIVA,');
    _query.SQL.Add('   IDHSTFOLHABENEF,');
    _query.SQL.Add('   CODPORTFORMA,');
    _query.SQL.Add('   FLGDESCFOLHA,');
    _query.SQL.Add('   FLGSITUACAO,');
    _query.SQL.Add('   TIPOPAGAMENTO,');                   //edilaine - SIG33744
    _query.SQL.Add('   SALDODEVEDORANT,');                 //edilaine - SIG115304
    _query.SQL.Add('   OBSERVACAO)');
    _query.SQL.Add('values');
    _query.SQL.Add('  ('+FLOATTOSTR(idhstcontrole)+',');
    _query.SQL.Add(' '+'0'+',');
    _query.SQL.Add(' '+FLOATTOSTR(IDCONTROLE)+',');
    _query.SQL.Add(' '+_IDPESSOA+',');
    _query.SQL.Add(' '+_IDTITULAR+',');
    _query.SQL.Add(' '+_IDPESSJUR+',');
    _query.SQL.Add(' '+_IDBENEFICIO+',');
    _query.SQL.Add(' '+_IDPLANOPREV+',');
    _query.SQL.Add(' '+#39+_MESREFERENCIA+#39+',');
    _query.SQL.Add(' '+#39+_MESCOBRANCA+#39+',');
    _query.SQL.Add(' '+'1'+',');
    _query.SQL.Add(' trunc('+OraNumero(totVlParc)+',2),');
    _query.SQL.Add(' '+'null'+',');
    //edilaine SIG128237 : inicio
    //_query.SQL.Add(' ADD_MONTHS('+#39+datapagamento+#39+',1),');///dataprevista = mescorbranca
    _query.SQL.Add(  QuotedStr(dtIni)+', ' );
    //edilaine SIG128237 : fim
    _query.SQL.Add(' '+'null'+',');
    _query.SQL.Add(' '+'null'+',');
    _query.SQL.Add(' '+'null'+',');
    _query.SQL.Add('   '+#39+_FLGDESCFOLHA+#39+',');
    _query.SQL.Add(' '+_FLGSITUACAO+',');
    _query.SQL.Add('   '+#39+_TIPOPAGTO+#39+',');                          //edilaine - SIG33744
    _query.SQL.Add(' trunc( '+OraNumero(floattostr(SaldoDev))+' ,2),');    //edilaine - SIG115304
    _query.SQL.Add(' '+'null'+')');
    _query.ExecSQL;
   end;


  //Helio - SOL Nº 228244-16260 PPM Nº 442505
  qryaux.close;
  qryaux.SQL.text := ' UPDATE HSTBENEFBFCIARIO  SET '+
                     ' DTEFETPGTO = LAST_DAY(TO_DATE(SUBSTR(MESREFERENCIA,1,4)||DECODE(SUBSTR(MESREFERENCIA,5,3),''/13'',''/12'',SUBSTR(MESREFERENCIA,5,3)),''YYYY/MM'')) ,'+
                     ' FLGENVIADO = 1,  VLBENEFPGTO  = VALORPREV,  IDMOTIVO  =  '+_IDMOTIVO+
                     ' WHERE  IDPESSJUR    = '+qryBeneficiarios.fieldbyname('IDPESSJUR').AsString+
                     ' AND    IDPLANOPREV  = '+qryBeneficiarios.fieldbyname('IDPLANOPREV').AsString+
                     ' AND    IDPESSOA     = '+qryBeneficiarios.fieldbyname('IDPESSOA').AsString+
                     ' AND    IDTITULAR    = '+qryBeneficiarios.fieldbyname('IDTITULAR').AsString+
                     ' AND    SEQPROPOSTA  = '+qryBeneficiarios.FieldByName('SEQPROPOSTA').AsString +
                     ' AND    IDLOTE       = '+IntToStr(iIdLoteConcessao)+
                     //BRUNO AZEVEDO - SOL 162759 e SOL 162523
                     //' AND    IDMOTIVO     = '+IntToStr(3057)+
                     ' AND    FLGDEVOLUCAO = 1 ';
  try
   qryAux.ExecSQL;

   {insere movimento inicio divida}
   CriaLogDivida(FLOATTOSTR(IDCONTROLE), '1' );   //edilaine SIG126276

  except
    on e:Exception do
    begin
      TratarErro(e.Message);
      MsgDlg('Erro ao acertar benefícios parcelados.' ,'Informação',mtError,[mbOk,mbHelp],0);
      Exit;
    end;
  end;
  //FIM Helio - SOL Nº 228244-16260 PPM Nº 442505

_query3.close;
_query3.destroy;
_query.close;
_query.destroy;

end;

function TfrmDesdobramentoBenef.GetMensagem(_idmessage: integer): string;
begin
case _idmessage of
   8:result:='Deseja parcelar os acertos resultantes do desdobramento?';
   9:result:='Os campos Saldo Revisão Funcef, Valor Parcela, Percentual, Quantidade de Parcelas, Início e Fim são obrigatórios. ';
  10:result:='Os campos Saldo Revisão INSS, Valor Parcela, Percentual, Quantidade de Parcelas, Início e Fim são obrigatórios. ';
  11:result:='Existem parcelamentos ativos, deseja quitá-los?';
  12:result:='Não é possível unificar dívidas de benefícios diferentes quando o saldo da revisão é negativo.';
  13:result:='É necessário selecionar pelo menos um parcelamento ativo.';
  14:result:='Deseja unificar as dívidas ?'

end;
end;

function TfrmDesdobramentoBenef.VerificarParcelamentoAtivo(_idpessoa,
  _idtitular,_fontepagadora: string): Boolean;
var
query:TwwQuery;
begin


query:=TwwQuery.Create(Self);
query.DataBaseName :='BaseDados';
query.Active:=false;
query.Sql.Clear;

query.SQL.Add('SELECT FLGQUITADO,SALDODEVEDORATUAL FROM CONTROLEDIVIDABENEFICIO');
query.SQL.Add('WHERE FLGQUITADO=0 AND SALDODEVEDORATUAL>0');
query.SQL.Add('AND IDPESSOA = '+_idpessoa);
query.SQL.Add('AND IDTITULAR = '+_idtitular);
query.SQL.Add('AND FONTEPAGADORA = '+_fontepagadora);

query.open;

if not query.IsEmpty then
   Result:=True
else
   Result:=false;

query.Close;
query.Destroy;


end;


function TfrmDesdobramentoBenef.ExecutaParcAtivos(_idpessoa,_idtitular,_SaldoRevisao,_fontepagadora,_mespagamento,_idbeneficio:string; var IDHSTORICODIVIDABENEFICIO,IDCONTROLEDIVIDABENEFICIO:string; var cancelou,pular:boolean ):Double;///Douglas.Siqueira 174933
var
    mrResult        : TModalResult;
    Saldo,SaldoOri,ValorUnificar:Double;
    query:TwwQuery;
     ValorParcelado,vlquitadoParc:Double;
    unica:Boolean;


procedure InserirAtualizar(_IDCONTROLE,_IDPESSOA,_IDTITULAR,_IDPESSJUR,_IDBENEFICIO,_IDPLANOPREV,_MESREFERENCIA,_MESCOBRANCA,_VLQUITACAO,_dataprevista,_FLGDESCFOLHA,_FLGSITUACAO,_flgParcial,_obs:string;var IDHSTORICODIVIDABENEFICIO,IDCONTROLEDIVIDABENEFICIO:string);
   var
     idhstcontrole:Integer;
     _query,_query3:TwwQuery;
         datapagamento:string;
   begin



    _query3:=TwwQuery.Create(Self);
    _query3.DataBaseName :='BaseDados';
    _query3.Active:=false;
    _query3.Sql.Clear;

    _query3.close;
    _query3.SQL.Clear;
    _query3.SQL.Add('select mesreferencia,datapagamento,flgincluimesconc,datapreparo from ctrlinterface');//douglas.siqueira
    _query3.SQL.Add('where idlote = '+#39+inttostr(iIdLoteConcessao)+#39);
    _query3.open;

    datapagamento:=_query3.fieldbyname('datapagamento').text;

   if IDCONTROLEDIVIDABENEFICIO='' then
      IDCONTROLEDIVIDABENEFICIO:='null';
      
    _query:=TwwQuery.Create(Self);
    _query.DataBaseName :='BaseDados';
    _query.Active:=false;

    idhstcontrole:= (LeUltRegistro(Nil,'HSTDIVIDABENEFICIO'));
    IDHSTORICODIVIDABENEFICIO :=floattostr(idhstcontrole);
    _query.close;
    _query.sql.Clear;
    _query.SQL.Add('insert into HSTDIVIDABENEFICIO');
    _query.SQL.Add('  (IDHSTORICODIVIDABENEFICIO,');
    _query.SQL.Add('   IDHISTORICODIVIDABENEFICIOREF,');
    _query.SQL.Add('   IDCONTROLEDIVIDABENEFICIO,');
    _query.SQL.Add('   IDPESSOA,');
    _query.SQL.Add('   IDTITULAR,');
    _query.SQL.Add('   IDPESSJUR,');
    _query.SQL.Add('   IDBENEFICIO,');
    _query.SQL.Add('   IDPLANOPREV,');
    _query.SQL.Add('   MESREFERENCIA,');
    _query.SQL.Add('   MESCOBRANCA,');
    _query.SQL.Add('   NUMEROPARCELA,');
    _query.SQL.Add('   VALORPREVISTO,');
    _query.SQL.Add('   VALORRECEBIDO,');
    _query.SQL.Add('   DATAPREVISTA,');
    _query.SQL.Add('   DATAEFETIVA,');
    _query.SQL.Add('   IDHSTFOLHABENEF,');
    _query.SQL.Add('   CODPORTFORMA,');
    _query.SQL.Add('   FLGDESCFOLHA,');
    _query.SQL.Add('   FLGSITUACAO,');
    _query.SQL.Add('   OBSERVACAO,IDCONTROLEDIVIDABENEFUNIF)');
    _query.SQL.Add('values');
    _query.SQL.Add('  ('+FLOATTOSTR(idhstcontrole)+',');
    _query.SQL.Add(' '+'0'+',');
    _query.SQL.Add(' '+_IDCONTROLE+',');
    _query.SQL.Add(' '+_IDPESSOA+',');
    _query.SQL.Add(' '+_IDTITULAR+',');
    _query.SQL.Add(' '+_IDPESSJUR+',');
    _query.SQL.Add(' '+_IDBENEFICIO+',');
    _query.SQL.Add(' '+_IDPLANOPREV+',');
    _query.SQL.Add(' '+#39+COPY(_MESREFERENCIA,7,4)+'/'+COPY(_MESREFERENCIA,4,2)+#39+',');
    _query.SQL.Add(' '+#39+_MESCOBRANCA+#39+',');
    _query.SQL.Add(' '+'1'+',');
    _query.SQL.Add(' '+OraNumero(_VLQUITACAO)+',');
    if _flgParcial = '1' then
     _query.SQL.Add(' '+OraNumero(_VLQUITACAO)+',')
    else
    _query.SQL.Add(' '+'null'+',');
    _query.SQL.Add(' ADD_MONTHS( '+#39+datapagamento+#39+',1),');///dataprevista = mescorbranca
    _query.SQL.Add(' '+'null'+',');
    _query.SQL.Add(' '+'null'+',');
    _query.SQL.Add(' '+'null'+',');
    _query.SQL.Add(' '+#39+_FLGDESCFOLHA+#39+',');
    _query.SQL.Add(' '+#39+_FLGSITUACAO+#39+',');
    _query.SQL.Add(' '+#39+_obs+#39',');
     _query.SQL.Add(' '+IDCONTROLEDIVIDABENEFICIO+')');
    _query.ExecSQL;

    _query.Destroy;
    _query3.close;
    _query3.Destroy;
   end;

begin
Saldo:=0;
SaldoOri:=0;
cancelou:=false;
pular:=false;
unica:=False;
query:=TwwQuery.Create(Self);
query.DataBaseName :='BaseDados';
query.Active:=false;

FrmParcAtivo := TFrmParcAtivo.Create(Application);
with FrmParcAtivo do
begin

edtSalRevis.text:=_SaldoRevisao;

ExecutaConsultaAtivos(_idpessoa,_idtitular); //// listando todos os parcelamentos ativos

mrResult               := ShowModal;

if mrResult <> mrOK then
  begin
  cancelou:=true;
  Exit;
  end;

qrydet.Filter:='S ='+#39+'S'+#39;
qrydet.Filtered:=True;
qrydet.Active:=True;
qrydet.First;
while not qrydet.Eof do
    begin

    Saldo:=Saldo+qrydet.FieldByName('SALDODEVEDORATUAL').Value;
    qrydet.Next;
    end;
SaldoOri:=Saldo;
_SaldoRevisao:=FormatFloat('0.00',strtofloat(_SaldoRevisao));
//Saldo:=StrToFloat(_SaldoRevisao) - StrToFloat(FormatFloat('0.00',Saldo)) ;
Saldo:=StrToFloat(_SaldoRevisao) + StrToFloat(FormatFloat('0.00',Saldo)) ;
ValorUnificar:=0;
IF Saldo >= 0 then
   begin

   if  StrToFloat(FormatFloat('0.00',SaldoOri))=StrToFloat(_SaldoRevisao) then///exato valor para quitacao
      begin
      primeira:=false;
       qrydet.First;
       while not qrydet.eof do
          begin


          query.Sql.Clear;
          query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');
          //William Santana - SIG33744 - inicio
          //query.SQL.Add('   SET FLGQUITADO              = 1,');
          query.SQL.Add('   SET FLGSTATUS = 3,                ');
          //edilaine - SIG33744 - fim
          query.SQL.Add('       QUANTIDADEPARCELASPAGAS = QTDEPARCELAS,');
          query.SQL.Add('       NUMPROCINSS             = '+Quotedstr(qryBeneficiarios.FieldByName('NUMPROCINSS').AsString)+',');   //edilaine SIG56256
          query.SQL.Add('       SALDODEVEDORATUAL       = 0');
          query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO ='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
          query.ExecSQL;

          {insere movimento de encerramento}
          CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, '4' );   //edilaine SIG126276

          IDCONTROLEDIVIDABENEFICIO:='';
          InserirAtualizar(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text,
                          qrydet.FieldByName('IDPESSOA').text,
                          qrydet.FieldByName('IDTITULAR').text,
                          qrydet.FieldByName('IDPESSJUR').text,
                          qrydet.FieldByName('IDBENEFICIO').text,
                          qrydet.FieldByName('IDPLANOPREV').text,
                          DateToStr(date),
                          _mespagamento,
                           FloatToStr(SaldoOri),
                          _mespagamento,
                          'B',
                          '0','0',Copy(mmo1.Text,1,100),IDHSTORICODIVIDABENEFICIO,IDCONTROLEDIVIDABENEFICIO);

          IDCONTROLEDIVIDABENEFICIO:='0';  /// não será necessário parcelar e lançar divida tudo foi abatido.
          IDHSTORICODIVIDABENEFICIO:='0';
          qrydet.next;
          end;
     end
     else
         begin///parcelado

         ValorParcelado:=StrToFloat(_SaldoRevisao);
         qrydet.First;
         while not qrydet.eof do
            begin

            if (ValorParcelado-qrydet.FieldByName('SALDODEVEDORATUAL').AsFloat)>=0 then
               begin
                query.Sql.Clear;
                query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');
                //William Santana - SIG33744 - inicio
                //query.SQL.Add('   SET FLGQUITADO              = 1,');
                query.SQL.Add('   SET FLGSTATUS = 3,                ');
                //edilaine - SIG33744 - fim
                query.SQL.Add('       QUANTIDADEPARCELASPAGAS = QTDEPARCELAS,');
                query.SQL.Add('       NUMPROCINSS             = '+Quotedstr(qryBeneficiarios.FieldByName('NUMPROCINSS').AsString)+',');  //edilaine SIG56256
                query.SQL.Add('       SALDODEVEDORATUAL       = 0');
                query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO ='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
                query.ExecSQL;

                {insere movimento de encerramento}
                CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, '4' );   //edilaine SIG126276

    //// vai inserir 1 vez do total quitado
                IDCONTROLEDIVIDABENEFICIO:='';
                InserirAtualizar(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text,
                  qrydet.FieldByName('IDPESSOA').text,
                  qrydet.FieldByName('IDTITULAR').text,
                  qrydet.FieldByName('IDPESSJUR').text,
                  qrydet.FieldByName('IDBENEFICIO').text,
                  qrydet.FieldByName('IDPLANOPREV').text,
                  DateToStr(date),
                  _mespagamento,
                   FloatToStr(qrydet.FieldByName('SALDODEVEDORATUAL').AsFloat),
                  _mespagamento,
                  'B',
                  '0','0',Copy(mmo1.Text,1,100),IDHSTORICODIVIDABENEFICIO,IDCONTROLEDIVIDABENEFICIO);

              
              IDCONTROLEDIVIDABENEFICIO:='0';  /// não será necessário parcelar e lançar divida tudo foi abatido.
              IDHSTORICODIVIDABENEFICIO:='0';

              ValorParcelado:=ValorParcelado+qrydet.FieldByName('SALDODEVEDORATUAL').AsFloat;
              vlquitadoParc:=vlquitadoParc+ qrydet.FieldByName('SALDODEVEDORATUAL').AsFloat
              end
            else
               begin

               if  unica = False then
                  begin
                  unica:=True;

                  ValorParcelado:=qrydet.FieldByName('SALDODEVEDORATUAL').AsFloat-  ValorParcelado;
                  vlquitadoParc:=vlquitadoParc+ ValorParcelado;


                  query.Sql.Clear;
                  query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');
                  query.SQL.Add('   SET SALDODEVEDORATUAL              = SALDODEVEDORATUAL-'+OraNumero(FloatToStr(ValorParcelado)));
                  query.SQL.Add('       ,QTDEPARCELAS = QTDEPARCELAS+1');
                  query.SQL.Add('       , NUMPROCINSS = '+Quotedstr(qryBeneficiarios.FieldByName('NUMPROCINSS').AsString));      //edilaine SIG56256
                  query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO ='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
                  query.ExecSQL;

                  //edilaine SIG126276 : inicio
                  {insere movimento de atualizaçao saldo}
                  CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, '7',
                                                   qrydet.FieldByName('SALDODEVEDORATUAL').AsString,
                                                   qrydet.FieldByName('QTDEPARCELAS').AsString );
                  //edilaine SIG126276 : fim


                  IDCONTROLEDIVIDABENEFICIO:='';
                     //// vai inserir 1 vez do total quitado
                  InserirAtualizar(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text,
                    qrydet.FieldByName('IDPESSOA').text,
                    qrydet.FieldByName('IDTITULAR').text,
                    qrydet.FieldByName('IDPESSJUR').text,
                    qrydet.FieldByName('IDBENEFICIO').text,
                    qrydet.FieldByName('IDPLANOPREV').text,
                    DateToStr(date),
                    _mespagamento,
                     FloatToStr(ValorParcelado),
                    _mespagamento,
                    'B',
                    '3','1',Copy(mmo1.Text,1,100),IDHSTORICODIVIDABENEFICIO,IDCONTROLEDIVIDABENEFICIO);


                 IDCONTROLEDIVIDABENEFICIO:=qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text;
                


                 end;

               end;
            qrydet.next;
            end;    
          

         ValorUnificar:=ValorParcelado;/// retornar o saldo restante caso tenha para inserir o registro da diferença
         end;

   end
else  IF Saldo < 0 then
   begin
    if MsgDlg(GetMensagem(14),'Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrYES then
       begin
       ValorUnificar:=0;



       qrydet.First;
       while not qrydet.eof do
          begin

          if _idbeneficio<>qrydet.FieldByName('IDBENEFICIO').text then
             begin
             MsgDlg('Não é possível unificar dívidas de benefícios diferentes quando o saldo da revisão é negativo.','Erro',mtError,[mbOk,mbHelp],0);
             end;

          if (_fontepagadora =qrydet.FieldByName('FONTEPAGADORA').text) and (_idbeneficio=qrydet.FieldByName('IDBENEFICIO').text ) then
             begin  
             ValorUnificar:=ValorUnificar+ qrydet.FieldByName('SALDODEVEDORATUAL').AsFloat
             end;

          qrydet.next;
          end;
       IDHSTORICODIVIDABENEFICIO:='0';

       //// inserir CONTROLEDIVIDABENEFICIO

       InserirControleDividaBenef(qryBeneficiarios.FieldByName('IDPESSOA').Text,
                                 qryBeneficiarios.FieldByName('IDTITULAR').Text,
                                 qryBeneficiarios.FieldByName('IDBENEFICIO').Text,
                                 qryBeneficiarios.FieldByName('IDPLANOPREV').Text,
                                 DateToStr(date),
                                 FloatToStr(ValorUnificar){ver},
                                 '0',
                                 '3057'{idmotivo},
                                 '1',
                                 '1',
                                 '0',
                                 'B',
                                 '0',
                                 qryBeneficiarios.FieldByName('IDPESSJUR').Text,
                                 DateToStr(date),
                                 '0',
                                 sAnoMesPagamento,
                                 qrydet.FieldByName('FONTEPAGADORA').text,
                                 qryBeneficiarios.FieldByName('NUMPROCINSS').AsString,     //edilaine SIG56256
                                 PercRed,
                                 (ValorUnificar)+(strtofloat(_SaldoRevisao)*-1),
                                 false,
                                 IDHSTORICODIVIDABENEFICIO,IDCONTROLEDIVIDABENEFICIO,true,
                                 qryBeneficiarios.FieldByName('NUMEROPROCESSO').AsInteger //Peterson Victor SIG27210
                                 );


      qrydet.First;
       while not qrydet.eof do
          begin

     //     if _idbeneficio<>qrydet.FieldByName('IDBENEFICIO').text then
//             begin
//             MsgDlg('Não é possível unificar dívidas de benefícios diferentes quando o saldo da revisão é negativo.','Erro',mtError,[mbOk,mbHelp],0);
//             end;

          if (_fontepagadora =qrydet.FieldByName('FONTEPAGADORA').text) and (_idbeneficio=qrydet.FieldByName('IDBENEFICIO').text ) then
             begin


              query.Sql.Clear; 
              query.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO');
              //William Santana - SIG33744 - inicio
              //query.SQL.Add('   SET FLGQUITADO              = 1,');
              query.SQL.Add(' SET   FLGSTATUS = 3, ');
              //edilaine - SIG33744 - fim
              query.SQL.Add('       QUANTIDADEPARCELASPAGAS = QTDEPARCELAS,');
              query.SQL.Add('       NUMPROCINSS             = '+Quotedstr(qryBeneficiarios.FieldByName('NUMPROCINSS').AsString)+',');  //edilaine SIG56256
              query.SQL.Add('       SALDODEVEDORATUAL       = 0,');
              query.SQL.Add('       IDCONTROLEDIVIDABENEFUNIF = '+IDCONTROLEDIVIDABENEFICIO);
              query.SQL.Add(' WHERE IDCONTROLEDIVIDABENEFICIO ='+qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text);
              query.ExecSQL;

              {insere movimento de encerramento}
              CriaLogDivida(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, '4' );   //edilaine SIG126276

              InserirAtualizar(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text,
                qrydet.FieldByName('IDPESSOA').text,
                qrydet.FieldByName('IDTITULAR').text,
                qrydet.FieldByName('IDPESSJUR').text,
                qrydet.FieldByName('IDBENEFICIO').text,
                qrydet.FieldByName('IDPLANOPREV').text,
                DateToStr(date),
                _mespagamento,
                 FloatToStr(qrydet.FieldByName('SALDODEVEDORATUAL').AsFloat),
                _mespagamento,
                'B',
                '0','0',Copy(mmo1.Text,1,100),IDHSTORICODIVIDABENEFICIO,IDCONTROLEDIVIDABENEFICIO);

      //       ValorUnificar:=ValorUnificar+ qrydet.FieldByName('SALDODEVEDORATUAL').AsFloat
             end;

          qrydet.next;
          end;

       ///
   //    InserirAtualizar(qrydet.FieldByName('IDCONTROLEDIVIDABENEFICIO').text,
//                qrydet.FieldByName('IDPESSOA').text,
//                qrydet.FieldByName('IDTITULAR').text,
//                qrydet.FieldByName('IDPESSJUR').text,
//                qrydet.FieldByName('IDBENEFICIO').text,
//                qrydet.FieldByName('IDPLANOPREV').text,
//                DateToStr(date),
//                _mespagamento,
//                 FloatToStr(ValorUnificar),
//                _mespagamento,
//                'B',
//                '0','0',IDHSTORICODIVIDABENEFICIO);
       ValorUnificar:=0;
       IDHSTORICODIVIDABENEFICIO:='0';
       IDCONTROLEDIVIDABENEFICIO:='0';
       pular:=true;
       end
      else ValorUnificar:=Saldo;

   end;
result:=ValorUnificar;






end;

end;
//SOL 174933 KINTANA 1733374



procedure TfrmDesdobramentoBenef.AcertaLancamentoDevolucao;
begin
  If not dtmBaseDados.dbBaseDados.InTransaction Then
     dtmBaseDados.dbBaseDados.StartTransaction;

  with TwwQuery.Create(nil) do
    try
      DataBaseName :='BaseDados';
      Active:=false;
      Sql.Clear;
      SQL.Add('UPDATE HSTCONTRIBPREV set DATARECEBIMENTO = DATAPREVISAORECE,');
      SQL.Add('                          VALORRECEBIDO = VALORESPERADO,');
      SQL.Add('                          SITRECEBIMENTO = 2');
      SQL.Add(' WHERE NUMRECEBIMENTO IN ( '+rDadosParcelamento.sSQLBusca+')' );

      try
        ExecSQL;
        dtmBaseDados.dbBaseDados.Commit;
      except
        dtmBaseDados.dbBaseDados.Rollback;
      end;
    finally
      close;
      free;
    end;
end;

// edilaine - SOL 253577-17664 / PPM 1019932 - inicio
procedure TfrmDesdobramentoBenef.GeraDemonstrativo;
var vBuffer: string;
begin

  if AbreConsultaDemonstrativo() then
  begin
     rpDemonstrativo.DeviceType       := 'PDFFile';
     rpDemonstrativo.AllowPrintToFile := True;
     rpDemonstrativo.ShowPrintDialog  := False;
     sNomeArquivo := qryDemonstra.FieldByName('MATRICULATIT').AsString + '-' + FormatDateTime('DD-MM-YYYY' + '-' + 'HH-MM-SS', Now);
     rpDemonstrativo.TextFileName := SalvarArquivoRevisaoBeneficio(qryDemonstra.FieldByName('MATRICULATIT').AsString, qryDemonstra.FieldByName('MATRICULATIT').AsString) + '\' + sNomeArquivo  + '.PDF';
     vBuffer := SalvarArquivoRevisaoBeneficio(qryDemonstra.FieldByName('MATRICULATIT').AsString, qryDemonstra.FieldByName('MATRICULATIT').AsString) + '\' + sNomeArquivo  + '.PDF';

        // SOL189092 KTN 1802931 Otacilio
        //sListaDocumentoExcluir.Add(rptDemonstrativo.TextFileName);
     //rpDemonstrativo.Print;
     TFrmPreview.CreateModalPreview(Application, rpDemonstrativo,sNomeArquivo);
     //ShellExecute(Application.Handle, nil, PChar(vBuffer), nil, nil, SW_SHOWNORMAL);

//     TFrmPreview.CreateModalPreview(Application, rpDemonstrativo,sNomeArquivo);


  end
  else
     MsgDlg('Erro ao gerar demonstrativo. ','Erro',mtError,[mbOk,mbHelp],0);


end;


function TfrmDesdobramentoBenef.AbreConsultaDemonstrativo: boolean;
begin
  try
    qryDemonstra.Sql.Text := qryDemonstraAux.Sql.Text;
    qryDemonstra.Close;
    qryDemonstra.Sql.Text := StringReplace( qryDemonstra.Sql.Text, '&NUMEROPROCESSO', sListaProcesso, [rfReplaceAll]); // edilaine - SOL 253577-18094 / PPM 1269549
    //qryDemonstra.ParamByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
    qryDemonstra.ParamByName('IDTITULAR').AsInteger      := iIdTitular;
    qryDemonstra.open;

    Result := true;
    except
      Result := false;
  end;
end;

function TfrmDesdobramentoBenef.VerificaTemParcelamento: boolean;
begin

  QryDivida.Close;
  QryDivida.ParamByName('IDPESSOA').AsInteger    := qryDemonstra.FieldByName('IDPESSOA').AsInteger;
  QryDivida.ParamByName('IDTITULAR').AsInteger   := qryDemonstra.FieldByName('IDTITULAR').AsInteger;
  QryDivida.ParamByName('IDBENEFICIO').AsInteger := qryDemonstra.FieldByName('IDBENEFICIO').AsInteger;
  QryDivida.ParamByName('IDPLANOPREV').AsInteger := qryDemonstra.FieldByName('IDPLANOPREV').AsInteger;

  try
    try
       QryDivida.open;
       if not QryDivida.eof then
       begin
         ppQtdParc.caption := QryDivida.FieldByName('QTDEPARCELAS').AsString;
         ppVlrParc.caption := FormatFloat('R$ #,##0.00', QryDivida.FieldByName('VALORPARCELA').AsCurrency);
       end;

       Result := not QryDivida.eof;
     except
       Result := false;
     end;
  finally
    qryDivida.close;
  end;

end;

procedure TfrmDesdobramentoBenef.rpDemonstrativoBeforePrint(
  Sender: TObject);
begin
  inherited;

  // Paulo Nobre - WO23998 - Inicio
  //  lbl_usuario.Caption := Sistema.NomeUsuario;
  lbl_usuario.Caption := UBeneficio.RetornaNomePessoaXUsuarioSistema(Sistema.IdUsuario);
  // Paulo Nobre - WO23998 - Fim

  // Alterado por FHBS - 30/10/2019 - SIG50850
  ppLabelVersao.Caption := 'Versão do Módulo: V' + Sistema.Versao;
  if FazQuery( qryAux, 'SELECT DESCRICAO FROM CTRLINTERFACE WHERE IDLOTE = ' + IntToStr(iIdLoteConcessao)) then
    ppLabelLote.Caption := 'Lote: ' + qryAux.Fields[0].asString
  else
    ppLabelLote.Caption := '';
  // Fim - Alterado por FHBS - 30/10/2019 - SIG50850
  
end;


procedure TfrmDesdobramentoBenef.RefazCabecalho;
    procedure EscondeItens(prefix, nome : string; var rLarg : double);
    var
      banda : byte;
      Temp  : TComponent;
      sufix : string;
      bVisivel : boolean;
    begin
      for banda := 1 to 3 do  {cabeçalho coluna / Detalhe / total}
      begin
        case banda of
          1 : sufix := '';
          2 : sufix := 'Det';
          3 : sufix := 'Tot';
        end;
        Temp := FindComponent(prefix + nome + sufix);
        if Assigned(Temp) then
        begin
          if prefix = 'ppShp' then
             bVisivel := TppShape(Temp).visible;

          if      prefix = 'ppShp' then  TppShape(Temp).visible := false
          else if prefix = 'ppLbl' then  TppLabel(Temp).visible := false;

          if (prefix = 'ppShp') and (sufix = '') and (bVisivel) then
             rLarg := rLarg + Arredonda(TppShape(Temp).width,4);   {guardo os tamanhos para ajustar as colunas visiveis}
        end;
      end;
    end;

    procedure AjustaPosicao(prefix, nome : string; var rPosicao : TRecPosicao; rLargTotal, rIncr : double; var rLeft, rLargura : double; bUltima : boolean);
    var
      banda : byte;
      Temp  : TComponent;
      sufix : string;
      dif   : double;
    begin
      for banda := 1 to 3 do  {cabeçalho coluna / Detalhe / total}
      begin
        case banda of
          1 : sufix := '';
          2 : sufix := 'Det';
          3 : sufix := 'Tot';
        end;
        Temp := FindComponent(prefix + nome + sufix);
        if Assigned(Temp) then
        begin
          if prefix = 'ppShp' then
          begin
            if sufix = '' then
            begin
              rLeft := Arredonda(TppShape(Temp).left, 4);    {passa o LEFT para ajustar os labels depois}
              rLargura := rLargura + Arredonda(TppShape(Temp).width + rIncr, 4);
              if (bUltima) and (floattostr(rLargTotal) <> floattostr(rLargura)) then
                 rIncr := rIncr + (rLargTotal - rLargura);
            end;

            TppShape(Temp).left  := Arredonda(rPosicao.rLeft + rPosicao.rWidht, 4);
            TppShape(Temp).width := Arredonda(TppShape(Temp).width + rIncr, 4); { aumenta o tamanho se preciso }
           end
          else if prefix = 'ppLbl' then
          begin
            if sufix = '' then
            begin
              dif := Arredonda(TppLabel(Temp).left,4) - rLeft;  {rLeft corresponde ao left do shape aqui}
              if (bUltima) and (floattostr(rLargTotal) <> floattostr(rLargura)) then
                 rIncr := rIncr + (rLargTotal - rLargura);
            end;
            TppLabel(Temp).left  := Arredonda(rPosicao.rLeft + rPosicao.rWidht + dif, 4);
            TppLabel(Temp).width := TppLabel(Temp).width + rIncr; { aumenta o tamanho se preciso }
          end;
        end;
      end;
    end;

var
  lstColMostra  : TStringList;       
  lstColSome    : TStringList;
  Temp, TempAux : TComponent;        
  ind     : byte;                    
  Posicao : TRecPosicao;              
  rLeftAtual, rIncr    : double;     
  rLargSobra, rLargLim : double;
  rLargUsada : double;
  rIncrCol   : array of double;
  bUltimo : boolean;
begin
   lstColMostra := TStringList.create;
   lstColSome   := TStringList.create;

   {Preencher lista lstColMostra com as colunas na ordem que devem aparecer, e lstColApaga as colunas desabilitadas
    Caso crie outra coluna no relatório acrescentar nessa lista e na devida ordem APENAS a parte do nome
    que é comum a todos os componentes (Ex: xxx  seguindo o caso de nomeação abaixo )
    Para mostrar/esconder sera utilizado prefixo do tipo de componente e da banda a qual corresponde o item

    Nomear os compnentes: ppShpxxx / ppLblxxx para titulo das colunas
                          ppShpxxxDet / ppLblxxxDet para linha detalhe
                          ppShpxxxTot / ppLblxxxTot para linha totalizadora
   --------------------------------------------------------------------------------------------------------------}

   try
     if qryDemonstra.FieldByname('FONTEPAGADORA').AsInteger = 2 then
     begin
        //INSS
        lstColMostra.Add('PercAtu');
        lstColMostra.Add('Total');
        lstColMostra.Add('BenefDev');
        lstColMostra.Add('BenefPag');
        lstColMostra.Add('Dif');

        lstColSome.Add('BSDev');
        lstColSome.Add('FABDev');
        lstColSome.Add('Deficit');

     end
     else
     begin
        //FUNCEF

        { monta lista de campos que ficarão visiveis}
        lstColMostra.Add('PercAtu');
        lstColMostra.Add('Total');
        if (bApresentaBSFAB) then
        begin
          lstColMostra.Add('BSDev');
          lstColMostra.Add('FABDev');
        end;
        //lstColMostra.Add('Total');
        lstColMostra.Add('BenefDev');
        lstColMostra.Add('BenefPag');
        lstColMostra.Add('Dif');
        if (bApresentaDeficit) then
           lstColMostra.Add('Deficit');

        { monta lista de campos que não devem aparecer}
        if not (bApresentaBSFAB) then
        begin
          lstColSome.Add('BSDev');
          lstColSome.Add('FABDev');
        end;
        if not (bApresentaDeficit) then
           lstColSome.Add('Deficit');
     end;

     {desabilita campos do Defict do cabeçalho}
     ppLblBSTotal.visible     := bApresentaBSFAB;
     ppLblBSAtual.visible     := bApresentaBSFAB;
     ppLblFabTotal.visible    := bApresentaBSFAB;
     ppLblFabAtual.visible    := bApresentaBSFAB;
     ppLblBaseDeficit.visible := bApresentaDeficit;

     ppVlrBSTotal.visible     := bApresentaBSFAB;
     ppVlrBSAtual.visible     := bApresentaBSFAB;
     ppVlrFabTotal.visible    := bApresentaBSFAB;
     ppVlrFabAtual.visible    := bApresentaBSFAB;
     ppVlrBaseDeficit.visible := bApresentaDeficit;

     rLargSobra := 0;                                 {guarda a largura total dos itens que seram escondidos}
     SetLength(rIncrCol, lstColMostra.count);         {valor do incremento nas colunas visiveis: (rLargSobra / itens visiveis) }
     for ind := low(rIncrCol) to High(rIncrCol) do
         rIncrCol[ind] := 0;

     {guarda a largura que será o limite maximo de ajuste }
     Temp := FindComponent('ppShp'+lstColMostra.Strings[0]);
     if Assigned(Temp) then
        rLargLim := Arredonda(TppShape(Temp).Left,4) + Arredonda(TppShape(Temp).width,4);
     rLargLim := Arredonda(ppShpBenefLatD.left - rLargLim, 4);

     {desabilita dados do deficit do Detalhe }
     if lstColSome.count > 0 then
     begin
       for ind := 0 to lstColSome.count-1 do
       begin
         // escondendo os Shapes
         EscondeItens('ppShp', lstColSome.Strings[ind], rLargSobra);
         // escondendo os Lables
         EscondeItens('ppLbl', lstColSome.Strings[ind], rLargSobra);
       end;
     end;

     {desconsidera a 1a coluna que é apenas de parametro para inicio dos ajustes}
     if rLargSobra <> 0 then
     begin
       rIncr := Arredonda(rLargSobra / (lstColMostra.count-1), 4);
       for ind := low(rIncrCol) to High(rIncrCol) do
       begin
         if ind = High(rIncrCol) then   {joga a sobra da divisão na ult coluna}
            rIncrCol[ind] := Arredonda(rLargSobra - (rIncr * (lstColMostra.count-2)), 4)
         else if ind > low(rIncrCol) then  {na 1a coluna o incr fica zero}
            rIncrCol[ind] := rIncr;
       end;

       ind := 0;
       repeat
         {pega left e widht da coluna que ja esta com posicao correta}
         Temp := FindComponent('ppShp'+lstColMostra.Strings[ind]);
         if Assigned(Temp) then
         begin
           Posicao.rLeft  := TppShape(Temp).left;
           Posicao.rWidht := TppShape(Temp).width;
         end;

         bUltimo := ((ind+1) = (lstColMostra.count-1));

         {acerta posicao da proxima coluna}
         AjustaPosicao('ppShp', lstColMostra.Strings[ind+1], Posicao, rLargLim, rIncrCol[ind+1], rLeftAtual, rLargUsada, bUltimo);
         AjustaPosicao('ppLbl', lstColMostra.Strings[ind+1], Posicao, rLargLim, rIncrCol[ind+1], rLeftAtual, rLargUsada, bUltimo);

         inc(ind);

       until ind >= lstColMostra.count-1;

     end;

   finally
      FreeAndNil(lstColSome);
      FreeAndNil(lstColMostra);
   end;
end;


procedure TfrmDesdobramentoBenef.ppBndDetalheBeforePrint(Sender: TObject);
var
  dAnoMesInicio : TDate;
begin
  dAnoMesInicio  := StrToDate(sDataInicio)-1;

  imprimiuRodapteGrupoRelatorio := false;

  bApresentaBSFAB    := (qryDemonstra.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1);
  bApresentaDeficit  := (qryDemonstra.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1);

  RefazCabecalho;

  totalBenef   := 0;
  totalContrib := 0;

  {beneficios}
  qryDemoBenef.Close;
  //qryDemoBenef.ParamByName('ANOMES').AsString          := sAnoMesInicio;
  qryDemoBenef.ParamByName('ANOMES').AsString          := FormatDateTime('YYYY/MM', dAnoMesInicio );
  qryDemoBenef.ParamByName('NUMEROPROCESSO').AsInteger := qryDemonstra.FieldByName('NUMEROPROCESSO').AsInteger; //SOL 253577-18114 PPM 1292515 17/02/2016
  qryDemoBenef.ParamByName('IDTITULAR').AsInteger      := iIdTitular;
  qryDemoBenef.ParamByName('IDPESSOA').AsInteger       := qryDemonstra.FieldByName('IDPESSOA').AsInteger;
  qryDemoBenef.ParamByName('IDBENEFICIO').AsInteger    := qryDemonstra.FieldByName('IDBENEFICIO').AsInteger;
  //qryDemoBenef.ParamByName('MESINICIO').AsString       := FormatDateTime('YYYY/MM', StrToDate(sDataInicio) );
  qryDemoBenef.ParamByName('IDLOTE').AsInteger         := iIdLoteConcessao;
  qryDemoBenef.Open;

  {contribuicoes}
  if (not qryDemoBenef.eof) and (qryDemoBenef.FieldByName('FONTEPAGADORA').AsInteger = 1) then
  begin
    qryDemoContrib.close;
    qryDemoContrib.ParamByName('IDLOTE').AsInteger      := iIdLoteConcessao;
    qryDemoContrib.ParamByName('IDTITULAR').AsInteger   := iIdTitular;
    qryDemoContrib.ParamByName('IDPESSJUR').AsInteger   := qryDemonstra.FieldByName('IDPESSJUR').AsInteger;
    qryDemoContrib.ParamByName('IDBENEFICIO').AsInteger := qryDemonstra.FieldByName('IDBENEFICIO').AsInteger;
    qryDemoContrib.ParamByName('IDPESSOA').AsInteger    := qryDemonstra.FieldByName('IDPESSOA').AsInteger;
    qryDemoContrib.ParamByName('DTDESDOBRA').AsDateTime := StrToDateTime( sdataInicioDesdobra );
    qryDemoContrib.open;

    //edilaine - SIG50850 : inicio
    qryAcJudDeficit.close;
    qryAcJudDeficit.SQL.Clear;
    if qryDemonstra.FieldByName('IDPESSOA').AsInteger = iIdTitular then
    begin
      qryAcJudDeficit.SQL.Add('SELECT DISTINCT C.IDCONTRIBUICAO,    ');
      qryAcJudDeficit.SQL.Add('                C.NOME,              ');
      qryAcJudDeficit.SQL.Add('                AC.PERCACJUDDEFICIT, ');
      qryAcJudDeficit.SQL.Add('                AC.ANOMESINIACJUDDEFICIT, ');
      qryAcJudDeficit.SQL.Add('                AC.ANOMESFIMACJUDDEFICIT  ');
      qryAcJudDeficit.SQL.Add('  FROM CONTRIBPARTPACJUDDEFICIT AC        ');
      qryAcJudDeficit.SQL.Add('  JOIN CONTRIBUICAO C ON C.IDCONTRIBUICAO = AC.IDCONTRIBUICAO ');
      qryAcJudDeficit.SQL.Add('  JOIN (SELECT CON.MESREFERENCIA, CON.IDCONTRIBUICAO, :IDPESSJUR as IDPESSJUR, ');
      qryAcJudDeficit.SQL.Add('               :IDPLANOPREV as IDPLANOPREV, :SEQPROPOSTA as SEQPROPOSTA, CON.IDRESPONSAVEL');
      qryAcJudDeficit.SQL.Add('          FROM (' + qryDemoContrib.SQL.text + ') CON ');
      qryAcJudDeficit.SQL.Add('       ) HST ON HST.IDCONTRIBUICAO = AC.IDCONTRIBUICAO  ');
      qryAcJudDeficit.SQL.Add('            AND HST.IDPESSJUR = AC.IDPESSJUR ');
      qryAcJudDeficit.SQL.Add('            AND HST.IDPLANOPREV = AC.IDPLANOPREV ');
      qryAcJudDeficit.SQL.Add('            AND HST.IDRESPONSAVEL = AC.IDPESSOA ');
      qryAcJudDeficit.SQL.Add('            AND HST.SEQPROPOSTA = AC.SEQPROPOSTA ');
      qryAcJudDeficit.SQL.Add(' WHERE HST.MESREFERENCIA BETWEEN AC.ANOMESINIACJUDDEFICIT AND       ');
      qryAcJudDeficit.SQL.Add('       NVL(AC.ANOMESFIMACJUDDEFICIT, TO_CHAR(SYSDATE, ''YYYY/MM'')) ');
      qryAcJudDeficit.SQL.Add(' ORDER BY C.IDCONTRIBUICAO, AC.ANOMESINIACJUDDEFICIT ');
    end
    else
    begin
      qryAcJudDeficit.SQL.Add('SELECT DISTINCT C.IDCONTRIBUICAO,    ');
      qryAcJudDeficit.SQL.Add('                C.NOME,              ');
      qryAcJudDeficit.SQL.Add('                AC.PERCACJUDDEFICIT, ');
      qryAcJudDeficit.SQL.Add('                AC.ANOMESINIACJUDDEFICIT, ');
      qryAcJudDeficit.SQL.Add('                AC.ANOMESFIMACJUDDEFICIT  ');
      qryAcJudDeficit.SQL.Add('  FROM CONTRIBPREVNUCLEO CP');
      qryAcJudDeficit.SQL.Add('  JOIN CONTRIBNUCLEOACJUDDEFICIT AC');
      qryAcJudDeficit.SQL.Add('    ON AC.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO');
      qryAcJudDeficit.SQL.Add('   AND AC.IDNUCLEOFAMILIAR = CP.IDNUCLEOFAMILIAR');
      qryAcJudDeficit.SQL.Add('  JOIN CONTRIBUICAO C ON C.IDCONTRIBUICAO = AC.IDCONTRIBUICAO ');
      qryAcJudDeficit.SQL.Add('  JOIN (SELECT CON.MESREFERENCIA, CON.IDCONTRIBUICAO, :IDPESSJUR as IDPESSJUR, ');
      qryAcJudDeficit.SQL.Add('               :IDPLANOPREV as IDPLANOPREV, :SEQPROPOSTA as SEQPROPOSTA, CON.IDRESPONSAVEL');
      qryAcJudDeficit.SQL.Add('          FROM (' + qryDemoContrib.SQL.text + ') CON ');
      qryAcJudDeficit.SQL.Add('       ) HST ON HST.IDCONTRIBUICAO = AC.IDCONTRIBUICAO  ');
      qryAcJudDeficit.SQL.Add('            AND HST.IDPESSJUR = CP.IDPESSJUR ');
      qryAcJudDeficit.SQL.Add('            AND HST.IDPLANOPREV = CP.IDPLANOPREV ');
      qryAcJudDeficit.SQL.Add('            AND HST.IDRESPONSAVEL = CP.IDPESSOA ');
      qryAcJudDeficit.SQL.Add('            AND HST.SEQPROPOSTA = CP.SEQPROPOSTA ');
      qryAcJudDeficit.SQL.Add(' WHERE HST.MESREFERENCIA BETWEEN AC.ANOMESINIACJUDDEFICIT AND       ');
      qryAcJudDeficit.SQL.Add('       NVL(AC.ANOMESFIMACJUDDEFICIT, TO_CHAR(SYSDATE, ''YYYY/MM'')) ');
      qryAcJudDeficit.SQL.Add(' ORDER BY C.IDCONTRIBUICAO, AC.ANOMESINIACJUDDEFICIT ');
    end;
    qryAcJudDeficit.ParamByName('IDLOTE').AsInteger      := iIdLoteConcessao;
    qryAcJudDeficit.ParamByName('IDTITULAR').AsInteger   := iIdTitular;
    qryAcJudDeficit.ParamByName('IDPESSJUR').AsInteger   := qryDemonstra.FieldByName('IDPESSJUR').AsInteger;
    qryAcJudDeficit.ParamByName('IDBENEFICIO').AsInteger := qryDemonstra.FieldByName('IDBENEFICIO').AsInteger;
    qryAcJudDeficit.ParamByName('IDPESSOA').AsInteger    := qryDemonstra.FieldByName('IDPESSOA').AsInteger;
    qryAcJudDeficit.ParamByName('IDPLANOPREV').AsInteger := qryDemonstra.FieldByName('IDPLANOPREV').AsInteger;
    qryAcJudDeficit.ParamByName('SEQPROPOSTA').AsInteger := qryDemonstra.FieldByName('SEQPROPOSTA').AsInteger;
    qryAcJudDeficit.ParamByName('DTDESDOBRA').AsDateTime := StrToDateTime( sdataInicioDesdobra );
    qryAcJudDeficit.Open;
    //edilaine - SIG50850 : fim
  end
  else
  begin
    qryAcJudDeficit.Close; // Alterado por FHBS - 30/10/2019 - SIG50850

    qryDemoContrib.close;
    qryDemoContrib.Open;
  end;

  // Alterado por FHBS - 30/10/2019 - SIG50850
  if not qryAcJudDeficit.Active then
    SubRelAcaoJud.Visible := False
  else
    SubRelAcaoJud.Visible := not qryAcJudDeficit.IsEmpty;         //edilaine - SIG50850
  // Fim - Alterado por FHBS - 30/10/2019 - SIG50850


  {divida}
  SubRelDivida.visible := VerificaTemParcelamento();

  {acertos}
  SubRelAcertos.visible   := (not qryDemoBenef.eof);
  SubRelSemacerto.visible := (qryDemoBenef.eof);

end;


procedure TfrmDesdobramentoBenef.RetornaTotal(sTipoTot : string;
                                              iIdPessoa, iBeneficio, iIdPessJur : integer;
                                              var rValor : double;
                                              bConsiderarSoDevolucao : boolean = false     //SOL 253577-18114 PPM 1292515
                                              );
var
  dAnoMesInicio : TDate;
begin
  dAnoMesInicio  := StrToDate(sDataInicio)-1;

  rValor := 0;

  if sTipoTot = 'B' then
  begin
    // totalizando valores Beneficios
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('SELECT  SUM(TOT.DIFERENCA) FROM ( ');
    qryAux.Sql.Add( copy(qryDemoBenef.Sql.text, 1, pos('ORDER BY', UpperCase(qryDemoBenef.Sql.text))-1) );
    qryAux.Sql.Add(') TOT ');
    qryAux.ParamByName('ANOMES').AsString          := FormatDateTime('YYYY/MM', dAnoMesInicio );
    qryAux.ParamByName('NUMEROPROCESSO').AsInteger := qryDemonstra.FieldByName('NUMEROPROCESSO').AsInteger; //SOL 253577-18114 PPM 1292515 17/02/2016
    qryAux.ParamByName('IDTITULAR').AsInteger      := iIdTitular;
    qryAux.ParamByName('IDPESSOA').AsInteger       := iIdPessoa;    //qryDemonstra.FieldByName('IDPESSOA').AsInteger;
    qryAux.ParamByName('IDBENEFICIO').AsInteger    := iBeneficio;  //qryDemonstra.FieldByName('IDBENEFICIO').AsInteger;
    //qryAux.ParamByName('MESINICIO').AsString       := FormatDateTime('YYYY/MM', StrToDate(sDataInicio) );
    qryAux.ParamByName('IDLOTE').AsInteger         := iIdLoteConcessao;
    qryAux.Open;
    if not qryAux.eof then
       rValor := qryAux.Fields[0].AsCurrency;
  end
  else if sTipoTot = 'C' then
  begin
    // totalizando valores Contribuicoes
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('SELECT  SUM(TOT.VALORPREV) FROM ( ');
    qryAux.Sql.Add( copy(qryDemoContrib.Sql.text, 1, pos('ORDER BY', UpperCase(qryDemoContrib.Sql.text))-1) );

    if bConsiderarSoDevolucao then                            //SOL 253577-18114 PPM 1292515
       qryAux.Sql.Add('AND H.FLGDEVOLUCAO = 1' );             //SOL 253577-18114 PPM 1292515

    qryAux.Sql.Add(') TOT ');
    qryAux.ParamByName('IDLOTE').AsInteger      := iIdLoteConcessao;
    qryAux.ParamByName('IDTITULAR').AsInteger   := iIdTitular;
    qryAux.ParamByName('IDPESSJUR').AsInteger   := iIdPessJur;  //qryDemonstra.FieldByName('IDPESSJUR').AsInteger;
    qryAux.ParamByName('IDBENEFICIO').AsInteger := iBeneficio;  //qryDemonstra.FieldByName('IDBENEFICIO').AsInteger;
    qryAux.ParamByName('IDPESSOA').AsInteger    := iIdPessoa;  //qryDemonstra.FieldByName('IDPESSOA').AsInteger;
    qryAux.ParamByName('DTDESDOBRA').AsDateTime := StrToDateTime( sdataInicioDesdobra );
    qryAux.Open;
    if not qryAux.eof then
       rValor := qryAux.Fields[0].AsCurrency;
  end;

  qryAux.Close;

end;


procedure TfrmDesdobramentoBenef.ppTitleBand3BeforePrint(Sender: TObject);
begin

  // totalizando valores Beneficios
  RetornaTotal('B', qryDemonstra.FieldByName('IDPESSOA').AsInteger,
                    qryDemonstra.FieldByName('IDBENEFICIO').AsInteger,
                    -1, totalBenef);


  // totalizando valores Contribuicoes
  RetornaTotal('C', qryDemonstra.FieldByName('IDPESSOA').AsInteger,
                    qryDemonstra.FieldByName('IDBENEFICIO').AsInteger,
                    qryDemonstra.FieldByName('IDPESSJUR').AsInteger,
                    totalContrib);


  lbl_tot_benef.Caption  := FormatFloat('#,##0.00',totalBenef);
  lbl_tot_contri.Caption := FormatFloat('#,##0.00',totalContrib);
  lbl_total.Caption      := FormatFloat('#,##0.00',totalBenef + totalContrib);

end;

procedure TfrmDesdobramentoBenef.ppDetailBand6BeforePrint(Sender: TObject);
begin
  inherited;
  totalBenef := totalBenef + qryDemoBenef.FieldByName('DIFERENCA').AsCurrency;
end;

procedure TfrmDesdobramentoBenef.ppDetailBand3BeforePrint(Sender: TObject);
begin
  inherited;
  if not qryDemoContrib.isEmpty then
     totalContrib := totalContrib + qryDemoContrib.FieldByName('VALORPREV').AsCurrency;
end;

procedure TfrmDesdobramentoBenef.ppGroupFooterBand1AfterPrint(
  Sender: TObject);
begin
  inherited;
  imprimiuRodapteGrupoRelatorio := true;
end;

procedure TfrmDesdobramentoBenef.ppFooterBand1BeforePrint(Sender: TObject);
begin
  inherited;
  lblNomUsuario.visible := imprimiuRodapteGrupoRelatorio;
  lbl_usuario.visible   := imprimiuRodapteGrupoRelatorio;
end;

procedure TfrmDesdobramentoBenef.GeraNumeroProcesso(piNumeroProcesso : longInt); //SOL 253577-18114 PPM 1292515 17/02/2016
begin
   try
      If not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT CM.SEQPROCESSOBENEF.NEXTVAL NUMEROPROCESSO FROM DUAL ');
      qryAux.Open;
      iNumeroProcessoNovo := qryAux.FieldByName('NUMEROPROCESSO').Value;
      sListaProcesso := sListaProcesso + ','+ InttoStr(iNumeroProcessoNovo);


      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('INSERT INTO PROCESSOBENEF (NUMEROPROCESSO, IDEVENTOGERADOR, FLGACIDENTAL, DTEVENTO,' + #13#10 +
                     '                           DTDIREITO, DTREGISTRO, IDSITPROCESSO, TRGDTINCLUSAO, TRGUSERINCLUSAO)' + #13#10 +
                     ' (SELECT '+IntToStr(iNumeroProcessoNovo)+' NUMEROPROCESSO, IDEVENTOGERADOR, FLGACIDENTAL, DTEVENTO,' + #13#10 +
                     '          DTDIREITO, DTREGISTRO, IDSITPROCESSO, SYSDATE TRGDTINCLUSAO, TRGUSERINCLUSAO' + #13#10 +
                     '    FROM PROCESSOBENEF' + #13#10 +
                     '   WHERE NUMEROPROCESSO =  '+IntToStr(piNumeroProcesso)+' ) ');
      qryAux.ExecSQL;
   Except
      on e:Exception do
      begin
         TratarErro(e.Message);
      end;
   end;

end; //SOL 253577-18114 PPM 1292515 17/02/2016

function TfrmDesdobramentoBenef.AssociaTaxas(
  sFontePagadora: string): boolean;
var
  sErro, sListaNumeroProcessos, sNumeroProcesso : string;
  iIdPessoa : integer;
begin
  result := true;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT FONTEPAGADORA FROM BENEFBFCIARIO ');
  qryAux.SQL.Add(' WHERE NUMEROPROCESSO = '+inttostr(iNumeroProcessoNovo));
  qryAux.Open;

  sFontePagadora := qryAux.FieldByName('FONTEPAGADORA').AsString;

  sListaNumeroProcessos := sListaProcesso;
  if trim(sFontePagadora) = '1' then
  begin
     // associa taxas ao beneficio
     while (pos(',',sListaNumeroProcessos) >= 1) or (sListaNumeroProcessos <> '')do
     begin
        if pos(',',sListaNumeroProcessos) > 0 then
        begin
           sNumeroProcesso := copy(sListaNumeroProcessos,1,(pos(',',sListaNumeroProcessos)-1));
        end
        else
        begin
           sNumeroProcesso := sListaNumeroProcessos;
           sListaNumeroProcessos := '';
        end;

        if Strtoint(sNumeroProcesso) = iNumeroProcesso then
           iIdPessoa := qryBeneficiarios.FieldByName('IdPessoa').AsInteger
        else
           iIdPessoa := qryBeneficiarioEmUso.FieldByName('IDPESSOA').AsInteger;

        if not AssociaTaxaPorBeneficio(iIdPlanoPrev,
                                       StrToInt(sNumeroProcesso),
                                       iIdPessJur,
                                       iIdTitular,
                                       iIdPlanoOrigem,
                                       iIdPessoa,
                                       iSeqProposta,
                                       Sistema.IdUsuario,
                                       sErro
                                       ) then
        begin
          MsgDlg('Erro ao associar taxas para o benefício.'+#13+sErro,'Erro',mtError,[mbOK],0);
          frmAguarde.Apaga;
          result := false;
          Exit;
        end;


        // fernando xavier - SOL 253577-17664 / PPM 1019932  - inicio
        If (qryBeneficiarios.FieldByName('IDTITULAR').AsInteger > 0) then
        begin
           If (ExecutaSP_PreparoContribuicao(StrToInt(sNumeroProcesso), // se der erro retorna true
                                             qryBeneficiarios.FieldByName('IDTITULAR').AsInteger,
                                             3057,
                                             iIdLoteConcessao,
                                             '',
                                             sAnoMesPagamento,
                                             '',
                                             -1,
                                             -1,
                                             5)     // passar cod TipoMov: Desdobramento
                                             ) then
           begin
              dtmBaseDados.dbBaseDados.RollBack;
              MsgDlg('Erro no preparo das contribuições. Verifique. ','Erro',mtError,[mbOk,mbHelp],0);
              frmAguarde.Apaga;
              Exit;
           end;
        end;
        // fernando xavier - SOL 253577-17664 / PPM 1019932 - fim

        sListaNumeroProcessos := copy(sListaNumeroProcessos,pos(',',sListaNumeroProcessos)+1,length(sListaNumeroProcessos));

     end;
  end;

end;

function TfrmDesdobramentoBenef.SalvarArquivoRevisaoBeneficio(
  sMatriculaTitular, sMatricula: String): String;
var sCaminho: string;
begin
  if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then  //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
    //sCaminho := '\\altarf\geseg_uso_interno\GEPRE_USOINTERNO\Histórico de Assistidos' + '\' + sMatriculaTitular + '\' + sMatricula // SOL 212484 KINTANA 2037449
    //sCaminho := '\\ALTARF\GEBEN_USO_INTERNO\GEPRE_USOINTERNO\Histórico de Assistidos\' + sMatriculaTitular + '\Desdobramento de Benefício\'  // SOL 212484 KINTANA 2037449  // Andre Imakawa - WO8381
    //sCaminho := '\\Funcef.com.br\arquivos\Planus\Documentos\GEBEN\Histórico de Assistidos\' + sMatriculaTitular + '\Desdobramento de Benefício\'            // Andre Imakawa - WO8381
    sCaminho := '\\Funcef.com.br\arquivos\PLANUS_GEBEN\Histórico de Assistidos\' + sMatriculaTitular + '\Desdobramento de Benefício\'            // Andre Imakawa - WO9432
  else
    sCaminho := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) +'\'+ sMatriculaTitular + '\Desdobramento de Benefício\' ;

  if not(DirectoryExists(sCaminho)) then
    if not ForceDirectories(sCaminho) then
        sCaminho := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  Result := sCaminho;
end;

end.
