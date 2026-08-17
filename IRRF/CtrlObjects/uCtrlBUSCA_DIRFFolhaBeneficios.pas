//*****************************************************************************************************
//Rotina                : _ListaNatuRendimento
//N. WO...........      : 8385
//Data da Alteração:    : 07/03/2024
//Alteração Form:       :
//Responsável:          : Andre Imakawa
//Descrição.......      : Não verificar o campo FLGUSADONADCTF na consulta do rendimento
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa, _GravarDadosIRRF_Beneficiario,
//                     _GravarDadosIRRF_Pensionista, _DesfazerLancamentosPensionista
//N. WO..............: 7147
//Data da Alteração..: 25/01/2024
//Responsável........: Paulo Nobre
//Descrição..........: Inclusão do compensa para IDINFORME = 47 (Pensão Alimenticia) que não estava
//                     sendo tratado.
//*****************************************************************************************************
//Rotina.............: _SelecionarMovIndivBeneficiarioQUITACAO
//N. SIG.............: 122845
//Data da Alteração..: 03/02/2022
//Responsável........: Edilaine
//Descrição..........: Na quitação de 13o está abatendo o valor da Idade maior do que o estabelecido
//*****************************************************************************************************
//Rotina.............: _PossuiAcaoJudContribExtra, _ProcessarMovimentoDaBUSCA, _ConsultaMovimentoDoBeneficiario
//N. SIG.............: 122199
//Data da Alteração..: 21/01/2022
//Responsável........: Edilaine
//Descrição..........: nao apresentar informaçoes da acao judicial do informe
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 122212
//Data da Alteração..: 18/01/2022
//Responsável........: Edilaine
//Descrição..........: buscando número da ação e percentual errado
//*****************************************************************************************************
//Rotina.............: _CarregaDadosDoIDINFORMEProcessado
//N. SIG.............: 122661
//Data da Alteração..: 28/01/2022
//Responsável........: Edilaine
//Descrição..........: nao está compensando valores sem IDPROCJUD
//*****************************************************************************************************
//**************************************************************************************************
//Rotina.............: _Verificando_DE_PARA e _ConsultaMovimentoDoBeneficiario
//N. SIG.............: 122151
//Data da Alteração..: 25/01/2022
//Responsável........: Andre Imakawa
//Descrição..........: Ajuste para novo layout do comprovante 2021
//*****************************************************************************************************
//Rotina.............: _VerificaAcoesJudiciais
//N. SIG.............: 113550
//Data da Alteração..: 17/02/2021
//Responsável........: Edilaine
//Descrição..........: buscando número da ação e percentual errado
//*****************************************************************************************************
//Rotina.............: _VerificaAcoesJudiciais, _ProcessarMovimentoDaBUSCA
//N. SIG.............: 99002
//Data da Alteração..: 27/03/2020
//Responsável........: Edilaine
//Descrição..........: a busca não estava lançando rendimento funcef quando ha acao judicial de BUA
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa
//N. SIG.............: 97844
//Data da Alteração..: 20/02/2020
//Responsável........: Edilaine
//Descrição..........: Ajuste na compensaçao para tratar o IDINFORME 162
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaQUITACAO
//N. SIG.............: 97260
//Data da Alteração..: 05/02/2020
//Responsável........: Edilaine
//Descrição..........: Ajuste na quitacao de ação encerrada antes do abono e com abatimento de idade
//*****************************************************************************************************
//Rotina.............: _CarregaDadosDoIDINFORMEParaQuitacao
//N. SIG.............: 97081
//Data da Alteração..: 31/01/2020
//Responsável........: Edilaine
//Descrição..........: Ajuste para considerar o IDPROCJUD do lançamento na quitacao
//*****************************************************************************************************
//Rotina.............: _PossuiAcaoJudContribExtra, _AnalisaPeriodicidadeAcaoJudicialQuitacao
//N. SIG.............: 96560
//Data da Alteração..: 21/01/2020
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Validação da data fim de ação judicial e regra associada.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa
//N. SIG.............: 96359
//Data da Alteração..: 16/01/2020
//Responsável........: edilaine
//Descrição..........: Ajuste na compensaçao
//*****************************************************************************************************
//Rotina.............: _AvaliaExistenciaDeAcaoJudicial
//N. SIG.............: 96080
//Data da Alteração..: 16/01/2020
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Ajuste na query de busca de ação para não buscar ação que não tenha regra vinculada.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa, SaldoZerado
//N. SIG.............: 96070
//Data da Alteração..: 15/01/2020
//Responsável........: edilaine
//Descrição..........: Compensa valor em outra natureza quando nao ha saldo na natureza de origem
//*****************************************************************************************************
//Rotina.............: _SelecionarMovIndivBeneficiarioQUITACAO
//N. SIG.............: 96408
//Data da Alteração..: 15/01/2020
//Responsável........: edilaine
//Descrição..........: Ajuste na query para tratamento da periodicidade de Molestia Grave
//*****************************************************************************************************
//Rotina.............: _AnalisaPeriodicidadeAcaoJudicialQuitacao, _ProcessaCalculoDosRendimentosQuitacao
//N. SIG.............: 96083
//Data da Alteração..: 14/01/2020
//Responsável........: edilaine
//Descrição..........: Ajuste na quitacao de contribuicao extra
//*****************************************************************************************************
//Rotina.............: _CarregaDadosGeraisDoIdResponsavelDaQUITACAO, _ProcessarMovimentoDaQUITACAO,
//                     _SelecionarMovIndivBeneficiarioQUITACAO 
//N. SIG.............: 96014
//Data da Alteração..: 09/01/2020
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Ajuste na query para ordenação da data de moléstia grave.
//*****************************************************************************************************
//Rotina.............: _PossuiAcaoJudContribExtra, _ProcessaCalculoDosRendimentosQuitacao
//N. SIG.............: 96019
//Data da Alteração..: 09/01/2020
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Ajuste no lançamento do idinforme 215.
//*****************************************************************************************************
//Rotina.............: _ProcessaCalculoDosRendimentosQuitacao
//N. SIG.............: 94604
//Data da Alteração..: 05/12/2019
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Adicionado filtro de data por ano na query de quitação.
//                     Validação para lançar quitação apenas se datafim da ação < mês padrão de 13º e
//                     existir ação ativa.
//*****************************************************************************************************
//Rotina.............: _MontarTABTrabalhoComMovDosBeneficiarios
//N. SIG.............: 94614
//Data da Alteração..: 03/12/2019
//Responsável........: Edilaine
//Descrição..........: Alteração consulta de busca
//*****************************************************************************************************
//Rotina.............: _PossuiAcaoJudContribExtra
//N. SIG.............: 94607
//Data da Alteração..: 03/12/2019
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Alteração no período de validação de data para SITPROCESSO = 2.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa
//N. SIG.............: 93322
//Data da Alteração..: 03/12/2019
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Ajuste para compensação do IDINFORME 74
//*****************************************************************************************************
//Rotina.............: _SelecionaIdResponsaveisDoCPFQuitacao, _ProcessarMovimentoDoCompensa,
//                     _SelecionarMovIndivBeneficiarioQUITACAO
//N. SIG.............: 82481
//Data da Alteração..: 21/02/2019
//Responsável........: Fábio Sampaio
//Descrição..........: 1) Alteração na rotina de QUITAÇÃO ordenar os dados pela FontePagadora
//                     2) Compensação dos IDINFORME 168
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa
//N. SIG.............: 81990
//Data da Alteração..: 07/02/2019
//Responsável........: Edilaine
//Descrição..........: Compensação dos IDINFORME 187, 189, 214 e 215
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa, _CarregaDadosDoIDINFORMEProcessado
//N. SIG.............: 81209
//Data da Alteração..: 02/02/2019
//Responsável........: Edilaine
//Descrição..........: Diferença entre comprovante x DIRF
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa
//N. SIG.............: 81284
//Data da Alteração..: 30/01/2019
//Responsável........: Edilaine
//Descrição..........: Compensa outros valores de ação judicial
//*****************************************************************************************************
//Rotina.............: _PossuiAcaoJudContribExtra
//N. SIG.............: 81281
//Data da Alteração..: 02/02/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Corereção aplicada para tratamento correto de processo de equacionamento
//                     indicados com o informe de Exigibilidade Suspensa.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 81275
//Data da Alteração..: 31/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Desenvolvimento do tratamento de rubrica relacionadas a ação de Equacionamento
//                     Informativo.
//*****************************************************************************************************
//Rotina.............: _ProcessaCalculoDosRendimentosQuitacao, _PossuiAcaoJudContribExtra
//N. SIG.............: 81273
//Data da Alteração..: 29/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração no processo de quitação, impedindo o lançamento de 13º sobre
//                     Equacionamento quando participantes estiver em status de isento.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 81353
//Data da Alteração..: 30/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção para correto tratamento de pessoas que possuam processo de Equacionamento
//                     e processos de bitributação.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA, _PossuiAcaoJudContribExtra
//N. SIG.............: 81253
//Data da Alteração..: 29/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção para evitar que beneficiários considerados idosos e com endimento maior
//                     valor parametrizado de idoso só considere rubirca de equacionamento quando
//                     houver processo específico. 
//*****************************************************************************************************
//Rotina.............: _PossuiAcaoJudContribExtra
//N. SIG.............: 81233
//Data da Alteração..: 29/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na verificação de processos de Ação sobre Contribuição Extraordinária,
//                     para não considerar processo válido quando o mesmo se encerra no mesmo período
//                     de abertura.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa
//N. SIG.............: 81008
//Data da Alteração..: 25/01/2019
//Responsável........: Edilaine
//Descrição..........: Compensa valor negativo com IDs diferentes
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa
//N. SIG.............: 80964
//Data da Alteração..: 25/01/2019
//Responsável........: Edilaine
//Descrição..........: Compensa resgate regressivo
//*****************************************************************************************************
//Rotina.............: _ProcessaCalculoDosRendimentosQuitacao, _DesfazerProcessoCompensaOuQuitacao
//N. SIG.............: 80944
//Data da Alteração..: 21/01/2019
//Responsável........: Edilaine
//Descrição..........: Ajuste na quitação de 13o para quem tem 2 planos ou dois ID's no mesmo CPF
//*****************************************************************************************************
//Rotina.............:  _VerificandoOcorrenciaDoIDINFORMEProcessado, _ProcessarMovimentoDaBUSCA
//N. SIG.............: 80791
//Data da Alteração..: 23/01/2019
//Responsável........: Edilaine
//Descrição..........: na busca lançar apenas uma vez no ano o informe referente a 13. dependente (91)
//*****************************************************************************************************
//Rotina.............: _PossuiAcaoJudContribExtra
//N. SIG.............: 81015
//Data da Alteração..: 18/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Retirada de verificação de incidência de rubrica relacionadas com Contribuição
//                     Extraordinária dentro da verificação de processos de ação sobre Equacionamento.
//*****************************************************************************************************
//Rotina.............: _LocalizaParametrosParaProcessamentoBUSCA, _ProcessarMovimentoDaBUSCA,
//                     _ProcessarMovimentoDoCompensa, _ExisteAcaoBiTributacao, _PossuiAcaoJudContribExtra,
//                     _MontarTABTrabalhoComMovDosBeneficiarios, _ProcessaCalculoDosRendimentosQuitacao
//N. SIG.............: 74355
//Data da Alteração..: 15/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adaptações na busca para recuperação de dados de Contribuições Extraordinárias.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaQUITACAO
//N. SIG.............: 78778
//Data da Alteração..: 27/11/2018
//Responsável........: Darivaldo Alencar
//Descrição..........: Validar se data de molestia é menor do que a data de processamento da folha antes
//                     de inserir os dados
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa
//N. SIG.............: 78120
//Data da Alteração..: 14/11/2018
//Responsável........: Fábio Sampaio
//Descrição..........: Compensar movimentos para o idinforme 67 e 138
//*****************************************************************************************************
//Rotina.............: _AvaliaExistenciaDeAcaoJudicial
//N. SIG.............: 74160
//Data da Alteração..: 29/08/2018
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Ajuste na validação de data para lançamento do informe 168
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa
//N. SIG.............: 62968
//Data da Alteração..: 07/02/2018
//Responsável........: André Imakawa
//Descrição..........: Compensar movimentos para o idinforme 37
//*****************************************************************************************************
//Rotina.............: _LocalizaParametrosParaProcessamentoBUSCA
//N. SIG.............: 62723
//Data da Alteração..: 05/02/2018
//Responsável........: André Imakawa/Darivaldo
//Descrição..........: Inclusão do id informe 55 no compensa do Id Informe 45
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 62400
//Data da Alteração..: 30/01/2018
//Responsável........: André Imakawa
//Descrição..........: Quando na busca o valor dos rendimentos FUNCEF + INSS forem menores que o valor
//                     do idoso e existir mais de um idpessoa, sistem deve verificar se foi lançado o
//                     valor total do INSS, se sim, não lançar o segundo informe 45 para a segunda pessoa.
//*****************************************************************************************************
//Rotina.............: _CarregaDadosGeraisDoIdResponsavelDaQUITACAO,
//		       _ProcessaCalculoDosRendimentosQuitacao
//N. SIG.............: 61911
//Data da Alteração..: 23/01/2018
//Responsável........: André Imakawa
//Descrição..........: Quitação dos movimentos 126, 141 e 142
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa
//N. SIG.............: 61755
//Data da Alteração..: 17/01/2018
//Responsável........: André Imakawa
//Descrição..........: Compensar movimentos para o idinforme 140
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 60879
//Data da Alteração..: 08/01/2018
//Responsável........: Andre Imakawa
//Descrição..........: Quando possuiar Ação e Idade e/ou mais de dois registros 49, sistema não esta
//                     levando em consideração a ação judicial para o proximo registro.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaQUITACAO e _VerificandoOcorrenciaDoIDINFORMENoMovProcessadoResp
//N. SIG.............: 59382
//Data da Alteração..: 06/12/2017
//Responsável........: Andre Imakawa
//Descrição..........: Levar em consideração o IdPlanoPrev para verificar se ja existe um registro
//                     Destino lançado.
//*****************************************************************************************************
//Rotina.............: spbProcessarSelecoesClick
//N. SIG.............: 58888
//Data da Alteração..: 04/12/2017
//Responsável........: André Imakawa
//Descrição..........: Isenção Retroativa, processar a partir do mes de isenção.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaQUITACAO e _SelecionarMovIndivBeneficiarioQUITACAO
//N. SIG.............: 58896
//Data da Alteração..: 27/11/2017
//Responsável........: Andre Imakawa
//Descrição..........: Query deve trazer todos os registros, porem só processar aqueles que possuem
//                     valor maior que zero.
//*****************************************************************************************************
//Rotina.............: _CarregaDadosGeraisDoIdResponsavelDaQUITACAO, _ProcessarMovimentoDaQUITACAO
//N. SIG.............: 58893
//Data da Alteração..: 24/11/2017
//Responsável........: Andre Imakawa
//Descrição..........: Quitação estava lançando registros errados e variavel bBeneficiarioISENTO_PARCIALPorMolGrave
//                     estava sendo preenchida incorretamente.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa
//N. SIG.............: 59015
//Data da Alteração..: 28/11/2017
//Responsável........: André Imakawa
//Descrição..........: Compensar movimentos para o idinforme 161
//*****************************************************************************************************
//Rotina.............: _GravarDadosIRRF_Beneficiario
//N. SIG.............: 57462
//Data da Alteração..: 01/11/2017
//Responsável........: Andre Imakawa
//Descrição..........: Apenas preencher o QTD Meses RRA quando for executado pela busca.
//*****************************************************************************************************
//Rotina.............: _CarregaDadosDoIDINFORMEProcessado, _ProcessaCompensaFaltouZerar e
//                     _ProcessarMovimentoDoCompensa
//N. SIG.............: 50681
//Data da Alteração..: 18/08/2017
//Responsável........: Andre Imakawa
//Descrição..........: Correção no metodo de verificar o saldo para abatimento do compensa.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 50578
//Data da Alteração..: 14/08/2017
//Responsável........: Andre Imakawa
//Descrição..........: Sistema verifica se existe um 53, porem naquele trecho só insere ID 49.
//*****************************************************************************************************
//Rotina.............: _AvaliaExistenciaDeAcaoJudicial
//N. SIG.............: 47457
//Data da Alteração..: 05/06/2017
//Responsável........: Marcelo Cardoso
//Descrição..........: Passando novo parametro da rotina _AvaliaExistenciaDeAcaoJudicial
//*****************************************************************************************************
//Rotina.............: _ProcessaCompensaFaltouZerar e _ProcessarMovimentoDoCompensa
//N. SIG.............: 38458
//Data da Alteração..: 24/02/2017
//Responsável........: André Imakawa
//Descrição..........: Compensa valor negativo deve abater da FUNCEF(49, 54) quando não existir movimento
//                     positivo do INSS(45, 55)
//*****************************************************************************************************
//Rotina.............: _ProcessaCalculoDosRendimentosQuitacao
//N. SIG.............: 40654
//Data da Alteração..: 24/02/2017
//Responsável........: André Imakawa
//Descrição..........: Não lançar contra partida quando valor do idoso ja abatido por inteiro.
//*****************************************************************************************************
//Rotina.............: _MontarTABTrabalhoComMovDosBeneficiarios
//N. SIG.............: 39921
//Data da Alteração..: 21/02/2017
//Responsável........: André Imakawa
//Descrição..........: Quando chamada for feita pela rotina de isenção, sistema deve preencher o campo
//                     ISENTO_IRRF verificando os dados da PESSOAFISICA.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa
//N. SIG.............: 40166
//Data da Alteração..: 14/02/2017
//Responsável........: André Imakawa
//Descrição..........: Compensar movimentos para os idinformes 133 e 187
//*****************************************************************************************************
//Rotina.............: _ConsultaMovimentoDoBeneficiario, _AvaliaExistenciaDeAcaoJudicial e
//                     _AnalisaPeriodicidadeAcaoJudicialQuitacao
//N. SIG.............: 39948
//Data da Alteração..: 13/02/2017
//Responsável........: André Imakawa
//Descrição..........: Problema ação judicial para os participantes que possuem ação em liminar e que
//                     se iniciou a partir de 01/02/2016.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 39642
//Data da Alteração..: 08/02/2017
//Responsável........: André Imakawa
//Descrição..........: Quando existem dois ID's e 65 anos, está gravando errado o valor de rendimento
//*****************************************************************************************************
//Rotina.............: _AvaliarOcorrenciaDeIsencaoRetroativa
//N. SIG.............: 38907
//Data da Alteração..: 01/02/2017
//Responsável........: André Imakawa
//Descrição..........: Query de isenção retroativa não está trazendo todos os CPF's
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 38904
//Data da Alteração..: 31/01/2017
//Responsável........: André Imakawa
//Descrição..........: Deve ser lançado o valor do idresponsavel(dValorTotalIDINFORMEBusca) e não o
//                     valor para o CPF (dValorRendimentoINSS).
//*****************************************************************************************************
//Rotina.............: _AvaliaExistenciaDeAcaoJudicial
//N. SIG.............: 38795
//Data da Alteração..: 30/01/2017
//Responsável........: William Moreira da Silva
//Descrição..........: Informe 168 sendo gerado mesmo para quando não existe processos judiciais para o período
//*****************************************************************************************************
//Rotina.............: _SelecionarMovIndivIdResponsavelBUSCA
//N. SIG.............: 38041
//Data da Alteração..: 19/01/2017
//Responsável........: André Imakawa
//Descrição..........: Valor total dos redimentos FUNCEF e INSS(TOTALRENDFUNCEF e TOTALRENDINSS) não
//                     devem levar em consideração registros com o campo ISENTO_IRRF = 'S'
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA, _DesfazerProcessoCompensaOuQuitacao,
//                     _SelecionarBeneficiariosProcessamentoQUITACAO
//N. SIG.............: 36762
//Data da Alteração..: 19/01/2017
//Responsável........: André Imakawa
//Descrição..........: Flag possui_quitação estava sendo preenchida baseado na maior folha buscada
//                     e o correto deve ser verificado durante o ano.
//                     Tambem foi removido os updates da tabela HISTRUBSAL que preenchiam o campo
//                     IDLANCIRRF = NULL
//*****************************************************************************************************
//Rotina.............:  _AvaliarOcorrDeBenefValoresNegativosACompensar, _ProcessarMovimentoDoCompensa
//N. SIG.............: 36080
//Data da Alteração..: 17/01/2016
//Responsável........: André Imakawa
//Descrição..........: Alteração na query da função _AvaliarOcorrDeBenefValoresNegativosACompensar para buscar
//                     dados de folha de Resgate.
//                     Processar movimentos 138.
//*****************************************************************************************************
//Rotina.............:  _AvaliarOcorrDeBenefValoresNegativosACompensar, _ProcessarMovimentoDoCompensa
//N. SIG.............: 35321
//Data da Alteração..: 17/01/2016
//Responsável........: André Imakawa
//Descrição..........: Alteração na query da função _AvaliarOcorrDeBenefValoresNegativosACompensar para buscar
//                     dados de folha de Resgate.
//                     Processar movimentos 201.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 36071
//Data da Alteração..: 21/12/2016
//Responsável........: André Imakawa
//Descrição..........: Caso exista registro 52, não lançar registro 49, Isso ocorre nesse trecho pois
//                     valor do Rendimento FUNCEF(dValorRendimentoFUNCEF) é menor que o valor idoso
//                     e o mesmo ja foi lançado no ID 52.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaQUITACAO
//N. SIG.............: 35148
//Data da Alteração..: 07/12/2016
//Responsável........: Paulo Nobre
//Descrição..........: > Feito um merge com as rotinas de Compensa e Quitação da demanda SIG 21776 para
//                       resolver grande parte dos problemas citados nesta demanda.
//                     > Definidas novas variaveis sCPFBeneficiarioSelecionadoComp e sCPFBeneficiarioSelecionadoQuita
//                       para diferenciar da sCPFBeneficiarioSelecionado usada na BUSCA
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaQUITACAO, _ProcessarMovimentoDoCompensa
//N. SIG.............: 32807
//Data da Alteração..: 07/11/2016
//Responsável........: Paulo Nobre
//Descrição..........: Ajustes na rotina de processamento da Quitação que está processando 13º negativos
//                     Evitar que a rotina de compensa processe a toa quando não tiver folhas a compensar
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 32974
//Data da Alteração..: 10/11/2016
//Responsável........: André Imakawa
//Descrição..........: Verificar se valor do rendimento INSS é maior que o valor parametrizado no idoso,
//                     quando rendimento é menor que valor do idoso. Essa verificação é necessaria
//                     pois existe a possibilidade de ter ocorrido um lançamento Idoso Funcef.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 31920
//Data da Alteração..: 25/10/2016
//Responsável........: Paulo Nobre
//Descrição..........: Ajustes na rotina de processamento do IDINFORME 49 (Rendimento FUNCEF)
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 30792
//Data da Alteração..: 18/10/2016
//Responsável........: Paulo Nobre
//Descrição..........: Ajustes na rotina "IDOSO E RENDIMENTO FUNCEF MENOR OU IGUAL AO VALOR PARAMETRIZADO DO IDOSO (A)"
//                     45 - Total do Rendimento Bruto INSS
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 30783
//Data da Alteração..: 10/10/2016
//Responsável........: Paulo Nobre
//Descrição..........: Ajustes na rotina de isenção retroativa, pois a mesma não estava levando em
//                     consideração as datas de processamento de cada folha, para localizar os
//                     parametros conforme sua vigência.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 27868
//Data da Alteração..: 24/08/2016
//Responsável........: William Moreira da Silva
//Descrição..........: cálculo da ação judicial para quem possui BUA ou pecúlio devem ocorrer somente se existirem as rubricas.
//*****************************************************************************************************
//Rotina.............: _DesfazerProcessosBUSCA, _DesfazerProcessoCompensaOuQuitacao, _ProcessarMovimentoDaBUSCA
//N. SIG.............: 26821
//Data da Alteração..: 09/08/2016
//Responsável........: Paulo Nobre / André Imakawa
//Descrição..........: Solicitamos correção no processo de fazer e desfazer busca, pois não está
//                     considerando o filtro Natureza do Rendimento e o DARF gerado
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDoCompensa
//N. SIG.............: 21776
//Data da Alteração..: 27/06/2016
//Alteração Form.....:
//Responsável........: Paulo Nobre
//Descrição..........: Realizar acertos gerais nas rotinas do Compensa Valor Negativo e Quitação e Etc.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 23797
//Data da Alteração..: 29/06/2016
//Alteração Form.....:
//Responsável........: Darivaldo Alencar
//Descrição..........: Pessoas que possuem ação judicial, está jogando os valores no IDINFORME 49
//                     quando na verdade deveria sair no IDINFORME 168
//*****************************************************************************************************
//Rotina.............:   _GravarDadosIRRF_Beneficiario
//N. SIG.............: 21265
//Data da Alteração..: 25/04/2016
//Alteração Form.....:
//Responsável........: Darivaldo Alencar
//Descrição..........: O processamento não estava levando em conta a natureza selecionada no combo na
//                     busca a partir da folha de benefício
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA, _AnalisaPeriodicidadeAcaoJudicialQuitacao,
//                     _ProcessaCalculoDosRendimentosQuitacao
//N. SIG.............: 19523
//Data da Alteração..: 30/05/2016
//Responsável........: Edilaine
//Descrição..........: pessoas que possuem ação judicial de BUA ou pecúlio devem processar o cálculo
//                     somente se existir as devidas rubricas
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaQUITACAO, _ProcessaCalculoDosRendimentosQuitacao
//                     _RetornaValorTotalIDINFORMENoMovprocessado, _IdentificaLancamentoGerado
//                     _CarregaDadosGeraisDoIdResponsavelDaQUITACAO,
//N. SIG.............: 19498
//Data da Alteração..: 18/05/2016
//Responsável........: André Imakawa
//Descrição..........: Solicitamos verificar as pessoas que tiveram o fim da isenção antes do mês de
//                     fechamento de 13º, onde, no adiantamento do 13º estava isento e no mês de novembro
//                     deixou de ser isento. Informamos que no mês do fechamento do 13º salário deverá
//                     analisar se neste mês a pessoa consta como isenta ou tributável e o 13º deverá ser
//                     considerado a partir dessa analise.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA, bIdosoAbatidoRendaFuncef
//N. SIG.............: 19935
//Data da Alteração..: 04/06/2016
//Responsável........: Edilaine
//Descrição..........: quando há dois rendimentos funcef (49), o valor é abatido do somatorio porem lança
//                     um dos valores integrais erroneamente
//*****************************************************************************************************
//Rotina.............: _AvaliaExistenciaDeAcaoJudicial, _ConsultaMovimentoDoBeneficiario, _AnalisaPeriodicidadeAcaoJudicialQuitacao
//N. SIG.............: 19510
//Data da Alteração..: 26/04/2016
//Alteração Form.....: inclusão de filtro no "left join procjud"
//Responsável........: André Imakawa / William Santana
//Descrição..........: Ajustar a rotina de busca, pois a rotina esta duplicando as informações
//                     por conta da verificação realizada na tabela PROCJUD de maneira errada.
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 19503
//Data da Alteração..: 25/04/2016
//Alteração Form.....: mudança na condição de verificação de valores
//Responsável........: William Moreira
//Descrição..........: A contra partida do idInforme 61 não era lançada
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 19501
//Data da Alteração..: 25/04/2016
//Alteração Form.....: mudança na condição de verificação de valores
//Responsável........: William Santana
//Descrição..........: valorIdoso não está considerando o valor que já foi transformado em idade na FUNCEF
//*****************************************************************************************************
//Rotina             : _DesfazerProcessosBUSCA e _DesfazerProcessoCompensaOuQuitacao
//N. SOL..........   : 271190
//N. PPM..........   : 1362919
//Data da Alteração: : 05/04/2016
//Alteração Form:    :
//Responsável:       : André Imakawa
//Descrição          : Erro de constraint no momento de desfazer a busca. Removido o comentario do
//                     trecho "1.Atualizando HISTRUBSAL".
//*****************************************************************************************************
//Rotina             : _ProcessarMovimentoDaQUITACAO
//N. SOL..........   : 269633
//N. PPM..........   : 1337929
//Data da Alteração: : 24/02/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Erro na Quitação quando o Beneficiário está isento o ano todo
//*****************************************************************************************************
//Rotina             : _ProcessarMovimentoDaQUITACAO
//N. SOL..........   : 269300
//N. PPM..........   : 1293033
//Data da Alteração: : 14/02/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Acertos na geração da BUSCA
//*****************************************************************************************************
//Rotina             : _ProcessarMovimentoDoCompensa, _ProcessarMovimentoDaQUITACAO, _SelecionarMovIndivBeneficiarioQUITACAO
//N. SOL..........   : 269130
//N. PPM..........   : 1284502
//Data da Alteração: : 03/02/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Acertos gerais nas SQL´S do Compensa e Quitação
//                     Aberto possibilidade de desfazer todas as versões
//*****************************************************************************************************
//Rotina             : _ProcessarMovimentoDaQUITACAO
//N. SOL..........   : 268775
//N. PPM..........   : 1268748
//Data da Alteração: : 27/01/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Acertos na forma da quitação processar os IDINFORMES
//*****************************************************************************************************
//Rotina             : _ProcessarMovimentoDaBUSCA
//N. SOL..........   : 268373
//N. PPM..........   : 1260556
//Data da Alteração: : 22/01/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Condições acertadas quando da avaliação do % da ação judicial.
//                     Refeita a lógica de apuração do IdInforme 91
//                     Acerto na regra do flgpensaoalim
//                     Refeito a forma de apurar o Total de Rendimento FUNCEF e INSS
//*****************************************************************************************************
//Rotina             : _CarregaDadosIndivDoInformeProcessado,  _GravarDadosIRRF_Beneficiario
//N. SOL..........   : 268054
//N. PPM..........   : 1245481
//Data da Alteração: : 15/01/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : - Incluindo da Tabela de Trabalho (MOV_GERALBUSCA) 2 novos campos que não foram salvos
//                     e que deveriam ter sido, pois a ausências destes, foi a causa das distorções na
//                     gravação do campo VLRIRRF.
//                     - Acertando a gravação do campo rValIRRF na função: oLancIRRF.GravaIRRF, de forma que
//                     este campo somente seja gravado se o informe for de IRRF (FLGIRRF = 'S')
//*****************************************************************************************************
//Rotina             : _ProcessarMovimentoDaBUSCA
//N. SOL..........   : 257831/18009
//N. PPM..........   : 1207646
//Data da Alteração: : 05/01/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Acerto para as novas linhas criadas no Informe
//***************************************************************************
//Rotina             : Diversas
//N. SOL..........   : 227955/17939
//N. PPM..........   : 1176698 (KTN 2063433)
//Data da Alteração: : 01/03/2015
//Alteração Form:    : FrmBUSCA_DIRFFolhaBeneficios
//Responsável:       : Paulo Nobre
//Descrição          : Redesenho de nova funcionalidade de BUSCA
//****************************************************************************************************
Unit uCtrlBUSCA_DIRFFolhaBeneficios;
{
// Códigos da DIRF (CODDIRF) usados no Informe de Rendimentos de Empregados e Beneficiários
//
1 - Não vai para DIRF
2 - Rendimento Bruto
3 - IRRF
4 - Deduções
5 - 13º. Salário - Rendimento
6 - 13º. Salário - Deduções
7 - 13º. Salário - IRRF
8 - Compensação por decisão judicial
9 - Rendimentos - Exigibilidade suspensa
10 - 13º. Salário - por decisão judicial
11 - 13º. Salário - exigibilidade suspensa
12 - Por decisão judicial - Anos anteriores
13 - Deduções - exigibilidade suspensa
14 - IRRF - exigibilidade suspensa
15 - 13º Salário - decisão judicial anos anteriores
16 - 13º Salário - Deduções exigibilidade suspensa
17 - 13º Salário - IRRF exigibilidade suspensa
18 - Contribuição Oficial
19 - Dedução de Dependente
20 - Pensão Alimentícia
21 - Contribuição Previdência Privada
22 - 13º Contribuição Oficial
23 - 13º Dedução de Dependente
24 - 13º Pensão Alimentícia
25 - 13º Contribuição Previdência Privada
26 - Imposto de Renda Informativo
27 - Isenção 65 anos
28 - Molestia Grave
30 - 13º. Imposto de Renda Informativo
31 - 13º. Salário Isenção 65 anos
32 - 13º. Salário Molestia Grave
34 - Ajuda de Custo/Diarias
35 - Indenizações, Recisões e Acidente Trabalho
36 - Abono Pecuniario
37 - RRA - Rendimento Bruto
38 - RRA - IRRF
39 - RRA - Moléstia Grave
40 - RRA - Pensão Alimentícia
41 - RRA - 13º Rendimento
42 - RRA - 13º Rendimento - Molestia Grave
43 - IN 1343
44 - 13º IN 1343
}

Interface

Uses Classes, Db, DbClient, SysUtils, contnrs, controls, adodb,
  UDiasUteis, umenserro, uSistema, uCmControlObject, uCmMath,
  uCmDbObject, uDataBase, uCMTypes, DBaseDados, Dialogs, Forms,
  comCtrls, dbTables, Wwquery, uCmSqlParams, math, CMwwQuery,
  uCtrLancIRRF, uFuncoesUteisIR, FProgresso, Gauges, ucmFileUtils,
  uCtrlFuncoesRH, uCMClientDataSet;

//
// Variáveis constantes que podem ser parametrizadas, futuramente, na funcionalidade de Parâmetros
//
Const DirLogBusca = 'C:\Planus\Temp\LogBusca';
  // Mes padrão de pagamento do 13º salário (Novembro)
Const sMesPadraoPagto13FUNCEF = '11';
  // Plano Prev default a ser usado na gravação da Lancirrf
Const sCodigoNaturResgate = '3223'; // Resgate Prev. Comp./Mod. CD/Variavel. - Não Optante Tribut.
Const sCodigoNaturRRA = '1889'; // Rendimentos Recebidos Acumulados - RRA
  // IDINFORMES usados nas seleções da BUSCA
Const iIdInformeTRBFUNCEF = 49; // Total Rendimento Bruto - FUNCEF
Const sCodigoNaturRendFUNCEF = '3540'; // Natureza "Padrão" dos Rendimentos FUNCEF (Benef. Prev. Complem.-Não Optante Tribut. Exclusiva)
Const sCodigoNaturRendFUNCEFExt = '9466'; // Natureza "Padrão" dos Rendimentos FUNCEF - Exterior              //edilaine - SIG94614                
Const iIdInformeTRBINSS = 45; // Total do Rendimento Bruto INSS
Const sCodigoNaturRendINSS = '3533'; // Natureza "Padrão" dos Rendimentos INSS (Aposentadoria Regime Geral)
  // IDINFORMES usados nas seleções da QUITAÇÃO
Const iIdInforme13FUNCEF = 62; // 13º salário proventos FUNCEF
Const iIdInforme13INSS = 61; // 13º salário proventos INSS
Const iIdInforme13DepFUNCEF = 91; // 13º Salário - Dependentes (FUNCEF)
//Cássio Rovaroto - SIG nº 74355
const iIdInformeIRJudContribExtra = 166; // Apenas para incorporação de IR de Ações Judiciais de Contribuições Extraordinárias
const iIdInformeContribExtra = 214;
const iIdInformeContribExtra13 = 215;
//Cássio Rovaroto - SIG nº 81275 - Início
const iIdInformeOutrosAcaoJudicial = 32;
const iIdInformeOutrosAcaoJudicial13 = 99;
//Cássio Rovaroto - SIG nº 81275 - Fim


Type
  TTipoOperacao = (tpBusca, tpCompensa, tpQuitacao);    //edilaine - SIG96080

  TCtrlBUSCA_DIRFFolhaBeneficios = Class(tCmControlObject)
  Private
    iAno, iMes, iDia: Word;

    sqlText: TStringList;

    dtDataIni,
      dtDataFim,
      dtDataFimProcJud,
      dtProcInicio,
      dtProcFim,
      dtDataPagtoUltimaFolha,
      DtInicioExercicio,
      DtFimExercicio: TDateTime;

    iEmpresa: Integer;
    iVersaoFolha: Integer;
    iVersaoUltimaFolha: Integer;
    iQtdMesesRRA: Integer;
    iIdMotivo: Integer;
    iIdModulo: Integer;
    iFlgPensaoAlim: Integer;
    iIdPrograma: Integer;
    iIdMolestiagrave: Integer;
    iIdMolestiagraveINSS: Integer;
    iLinhaRendAcJud: Integer;
    iLinhaRendAcJud13: Integer;
    iLinhaAcima65: Integer;
    iLinhaAcima65INSS: Integer;
    iLinhaAbonoAcima65: Integer;
    iLinhaAbonoAcima65INSS: Integer;
    iLinhaAcaoJudicialInss: Integer;
    iLinhaAcaoJudicialInss13: Integer;
    iRegraAcaoJudINSS: Integer;
    iIdResponsavelAtual: Integer;
    iIdPessoaProcJud: Integer;
    iIdProcJudFund: Integer;
    iIdProcJudBUA: Integer;        //edilaine SIG99002
    iIDInformeGravar: Integer;
    iIdPlanoPrev: Integer;
    iIdPatro: Integer;
    iIdadeBenefParam: Integer;
    iIdPlanoContab: Integer;
    iFontePagadora: Integer;
    iIdadeAtual: integer;
    iIdInformeAvaliacao: Integer;
    iQtdDeParcelasDoInformeQuitacao: Integer;
    iIdInformeBUA: Integer;
    iLinhaMolINSS: Integer; //SIG62723

    //Cássio Rovaroto - SIG nº 74355 - Início
    iLinhaAcaoJudicialContribExtra: Integer;
    iLinhaAcaoJudicialContribExtra13: Integer;
    iIdProcJudFundContrib: Integer;
    iIdPessoaProcJudContrib: Integer;
    //Cássio Rovaroto - SIG nº 74355 - Fim

    bCompensaAcJud        : boolean;     //edilaine SIG113550
    bCompensaInformeAcJud : boolean;     //edilaine SIG113550

    bInformeAcJudEQUA     : boolean;    //edilaine SIG122212
    bDevolucaoValor       : boolean;    //edilaine SIG122199

    sCPFBeneficiarioSelecionado: String;
    // Paulo Nobre - SIG 35148 - Inicio
    sCPFBeneficiarioSelecionadoComp: String;
    sCPFBeneficiarioSelecionadoQuita: String;
    // Paulo Nobre - SIG 35148 - Fim
    sCodigoTipoRecDes: String;
    sPlanoContaCredito: String;
    sCodigoNatureza: String;
    sCodigoNaturezaIndiv: String;
    sCodigoCentroCusto: String;
    sCodigoCentroRespon: String;
    sFlgNatureza: String;
    sDataPagamento: String;
    sAnoMesPagtoFolha: String;
    sAnoMesPadraoQuitacao: String;
    sAnoMesDtIniMolGrave: String;
    sAnoMesInicioExercicio: String;
    sAnoExercicio: String;
    sDataIniMolGrave: String;
    sDataFimMolGrave: String;
    sListaBeneficiarios: String;
    sFlgIRRF: String;
    iIdResponsavelAtualAux: Integer; // Andre Imakawa - SIG 50681

    dValorRendimentoFUNCEF,
      dValorRendimentoINSS,
      dValorIDINFORMEBaseGravar,
      dValorTotalIDINFORMEBusca,
      dValIRRF,
      dValorDescontoIdosoParam,
      dValorSemIdadeIdoso,
      dValorCalculado,
      dValorAcaoJud,
      dPercAcaoJudicial,
      dTotalIdInforme13INSS,
      dValorTotalIDINFORMEQuitacao,
      dValorTotalIDINFORMEGravarQuitacao,
      dValorIDINFORMEOrigem, // Paulo Nobre - SIG 21776 / SIG 35148
      dValorAbate45SegundoId,// Andre Imakawa - SIG 39642
    dValorIDINFORMEDestino,
      dValorIDINFORMECompensado: Double;

    bFaltaParamMolestia: Boolean;
    bFaltaParamMais65: Boolean;
    bFaltaPrograma: Boolean;
    bFaltaVlrIdoso: Boolean;
    bFaltaIdadeIdoso: Boolean;
    bBeneficiarioIdoso: Boolean;
    bBeneficiarioISENTO: Boolean;
    bBeneficiarioISENTO_TOTALPorMolGrave: Boolean;
    bBeneficiarioISENTO_PARCIALPorMolGrave: Boolean;
    bBenefISENTOMasComMolGraveInicioExercicio: Boolean;
    bBenefEmMolGraveNoMesPadraoPagto13FUNCEF: Boolean;
    bTemAcaoJudicial: Boolean;
    bTemAcaoNoAno_EQUA: Boolean; //TAES - SIG96019
    bTemAcaoJudicial_BUA: Boolean;
    //William Moreira da Silva - SIG 27868
    bTemRendimento_BUA: Boolean;
    //William Moreira da Silva - SIG 27868
    bTemAcaoJudicial_IT: Boolean;
    //Cássio - SIG nº 74355
    bTemAcaoJudicial_CE: Boolean;
    bAcaoEquaGanha : boolean;       //edilaine SIG134189
    bTeveUmIDRespComCalculoDeAcaoJudicial: Boolean;
    bUsaPlanoPatro: Boolean;
    bProcComRestricao: Boolean;
    bFlgProcEncerradoAteQuitacao: Boolean;    //edilaine - SIG96083
    bFlgFimProcJudOcorreuMesQuitacao: Boolean;
    bNaoLancaId45SegundoId: Boolean; // Andre Imakawa - SIG 62400

    CdsAux1,
      CdsInformeDePara,
      CdsParamIRRF,
      CdsParamFolha,
      CdsMovIndividualIdResponsavelBUSCA,
      CdsFontePagadora,
      CdsMovIndividualIdResponsavelQuitacao,
      CdsIDResponsavelDoCPFProcessado,
      CdsInformeIRRF: TClientDataSet;

    SQLParamMovBenefIndiv: TCMSqlParams;
    qryVerificaExistenciaAcaoJudicial: TwwQuery;

    bIdosoAbatidoRendaFuncef: boolean; // edilaine - SIG 19935

    TipoOperacao : TTipoOperacao;    //edilaine - SIG96080

    // Objeto instaciando da control TCtrLancIRRF
    oLancIRRF: TCtrLancIRRF;

    CtrlFuncoesRH: TCtrlFuncoesRH;

    Function _ObtemQtdeMesesRRA(Const pDataPagto: String; Const pIdResp: Integer): integer;
    Function _ValidaAcaoJudicialEDataFolhaPagamento(pIdProcJud: Integer): Boolean;
    //    Function _AtualizaHistRubSalComIdLancIrrf(Const pIdResp: Integer; Const iLancamento: Double): Boolean;
    Function _VerificaExistenciaDoUsoDeRegras(Const sCPFSel: String; Const pIDProcJud, pIdResp, pTipo: Integer): Boolean;
    Function _VerificandoOcorrenciaDoIDINFORMENoMovProcessado(pCPF: String; Const pVersaoFolha, pIdInforme: Integer): Boolean;
    Function _VerificandoOcorrenciaDoIDINFORMENoMovProcessadoResp(Const pVersaoFolha, pIdInforme, pIdResp, pIdPlanoPrev: Integer): Boolean; // Andre Imakawa - SIG 58893 // Andre Imakawa - SIG 59382
    Function _RetornaValorTotalIDINFORMENoMovProcessado(Const pCPF: String; Const pVersaoFolhaAtual, pIdInforme: Integer; bAgrupa : boolean = true): Double; // André Imakawa - SIG 19498   //edilaine - SIG80944
    Function _RetornaValorTotalIDINFORMENoMovProcessadoResp(Const pVersaoFolhaAtual, pIdInforme: Integer; pCPF: String): Double;   // Andre Imakawa - SIG 21776 // Andre Imakawa - SIG 50681

    //edilaine - SIG80791
    Function _VerificandoOcorrenciaDoIDINFORMEProcessado(pCPF : String; pIdInforme : integer; Const pAnoExercicio : Integer = -1; pVersaoFolha : Integer = -1): Boolean;

    // Paulo Nobre - SIG 21776 /  SIG 35148
    Function _RetornaQtdParcelasIDINFORMENoMovProcessado(pCPF, pAnoExercicio: String; pIdInforme: Integer): Integer;

    //------------------------------------------------------------------------------------------------------//
    //    Função para Gravação dos dados na Base de Dados da DIRF (LANCIRRF e LANCXINFORME)                 //
    //------------------------------------------------------------------------------------------------------//
    Function _GravarDadosIRRF_Beneficiario(pIdInformeGravar, pFontePagadora: Integer; pValorTotalIDINFORMEBusca: Double; pTipoAtu: String): Boolean;
    Function _GravarDadosIRRF_Beneficiario_61(pIdInformeGravar, pFontePagadora: Integer; pTipoAtu: String): Boolean;

    // Paulo Nobre - WO7147
    Function _GravarDadosIRRF_Pensionista(pIdBeneficiarioGravar, pIdInformeGravar, pFontePagadora: Integer; pValorTotalIDINFORMEBusca: Double; pTipoAtu: String): Boolean;

    //------------------------------------------------------------------------------------------------------//

    Procedure _CarregaDadosIndivDoInformeProcessado;
    Procedure _Verificando_DE_PARA(pIdInformeOrig, pIdSituacao: Integer);
    Procedure _AvaliaExistenciaDeAcaoJudicial(pIdResponsavel: Integer; pDataIni, pDataFim: TDateTime);
    Procedure _VerificaSituacaoProcessoEncerrado;

    Procedure _VerificaAcoesJudiciais(pIdResponsavel: Integer; pDataIni, pDataFim: TDateTime);      //edilaine SIG99002

    //Cássio Rovaroto - SIG nº74355
    function _ExisteAcaoBiTributacao(pIdPessoa: Integer; pDataInicio, pDataFim: TDate): Boolean;
    function _PossuiAcaoJudContribExtra(pIdPessoa, pVersaofolha: Integer; pDataInicio, pDataFim: TDate; pCPFSel: String; pIdProcJud: Integer;
                                        var bAcaoGanha : boolean;    //edilaine SIG134189
                                        pIdInforme: integer = -1;
                                        bDevolveVlr : boolean = false    //edilaine SIG122199
                                        ): Boolean;

  Public
    sMensagemProcessamento: String;

    Constructor Create; Override;
    Destructor Destroy; Override;

    //----------------------------------------------------------------------------//
    //            Porcedures para atualização do painel "Log. da Busca"              //
    //----------------------------------------------------------------------------//
    Procedure MostraMensagem(Const psTexto: String; Const pIncluiLinha: Boolean = False);
    Procedure Linha();
    Procedure InicializaFormulario(Const pIncluiLinha: Boolean = False);
    Procedure AtualizaFrmProgresso(Var iContador: integer);

    //----------------------------------------------------------------------------//
    //         Funções de Seleção e Execução da BUSCA                             //
    //----------------------------------------------------------------------------//

    Function _MontarTABTrabalhoComMovDosBeneficiarios(
      pCodigoNatureza: String;
      pVersaoFolha: Integer;
      pDtDataIni,
      pDtDataFim: TDateTime;
      pTemListaDeBeneficiarios: Boolean;
      pListaDeBeneficiarios: TStringList;
      pIsencao:Integer = 0): Boolean;  // Andre Imakawa - SIG 39921

    Function _SelecionarBeneficiariosProcessamentoBUSCA(pVersaoFolha: Integer): OleVariant;

    Function _ProcessarMovimentoDaBUSCA(
      pDataIni,
      pDataFim: TDateTime;
      pVersaoFolha: Integer;
      pCodNatureza: String;
      CdsBeneficiariosSelecionados,
      CdsConsultaMovBenef: TClientDataSet;
      pListaDeBeneficiarios: TStringlist;
      pTemListaDeBeneficiarios: Boolean;
      gProgresso: TGauge): Boolean;

    Function _SelecionarMovIndivIdResponsavelBUSCA(pVersaoFolha, pIdRespBusca: Integer; pCPFBeneficiarioSelecionado: String): Boolean;

    Function _LocalizaParametrosParaProcessamentoBUSCA: Boolean;
    Function _ConsultaMovimentoDoBeneficiario(
      Const pCPF: String;
      Const pDataIni,
      pDataFim: TDateTime;
      Const pVersaoFolha: Integer;
      pAnoTodo: Boolean): OleVariant;

    Function _DesfazerProcessosBUSCA(
      pCPFSel: String;
      pVersaoFolha: Integer;
      pDataIni,
      pDataFim: TDateTime;
      pCodNatureza: String;
      pTemListaDeBeneficiarios: Boolean;
      pListaDeBeneficiarios: TStringList;
      pIsencao: Integer = 0): Boolean; // Andre Imakawa - SIG 58888

    Function _SelecionaIdResponsaveisDoCPFBUSCA(
      pCPF,
      pVersaoUltFolha: String): Boolean;

    //----------------------------------------------------------------------------//
    //         Funções de Seleção e Execução da QUITAÇÃO                          //
    //----------------------------------------------------------------------------//

    Function _SelecionarBeneficiariosProcessamentoQUITACAO(
      pAnoRef: String;
      pListaDeBeneficiarios: TStringList;
      pTemListaDeBeneficiarios: Boolean): OleVariant;

    Function _SelecionaIdResponsaveisDoCPFQuitacao(
      pCPF: String; // Andre Imakawa - SIG 35148
      pAno: String): Boolean; // Andre Imakawa - SIG 35148
    //pVersaoUltFolha: String): Boolean;            // Andre Imakawa - SIG 35148

    Function _SelecionarMovIndivBeneficiarioQUITACAO(
      pAnoExercicio: String;
      pIdResponsavelIndiv: Integer;
      pFontePagadora: Integer // Alterado por FHBS - 21/02/2019 - SIG82481
      ): Boolean;

    // Lista os Últimos 5 anos de folhas para quitacao
    Function _ListaExerciciosDispEncerramento: OleVariant;
    //
    Function _LocalizaParametrosParaProcessamentoQUITACAO(pDtFimExercicio: TDateTime): Boolean;
    Function _IdentificaLancamentoGerado(pTipoAtu, pDataIniMolGrave, pDataFimMolGrave: String; pLancamento, pValorTotalIDINFORMEBusca: Double): Boolean;
    Procedure _CarregaDadosDoIDINFORMEParaQuitacao(pDtPagtoUltimaFolha: TDateTime);
    Procedure _ProcessarMovimentoDaQUITACAO(cdsBenefSelecionadoQuitacao: TClientDataSet; gProgresso: TGauge);
    Procedure _AnalisaPeriodicidadeAcaoJudicialQuitacao(pIdResponsavel: Integer; pDataIni, pDataFim: TDateTime);
    Procedure _ProcessaCalculoDosRendimentosQuitacao(pValorIDINFORMEDestino: Double; pQtdDeParcelasDoInformeQuitacao: Integer);

    // Paulo Nobre - SIG 21776 /  SIG 35148
//    Function _TotalizaAsDeducoesDo13(pCPFQuitacaoAtu, pAnoExercicio: String; pFontePagadora: Integer): Double;

    //----------------------------------------------------------------------------//
    //         Funções de Seleção e Execução da ISENÇÃO RETROATIVA                //
    //----------------------------------------------------------------------------//

    Function _AvaliarOcorrenciaDeIsencaoRetroativa(pAnoRef: String): Olevariant;

    Procedure _ProcessarMovimentoDoCompensa(
      pAnoRef: String;
      cdsBenefSelecionadoCompensa: TClientDataSet;
      qryBenefValoresACompensar,
      qryBenefValoresACompensarPorFolha,
      qryBenefCompMovFolhasProc: TwwQuery;
      pListaDeBeneficiarios: TStringlist;
      pTemListaDeBeneficiarios: Boolean;
      gProgresso: TGauge);

    //----------------------------------------------------------------------------//
    //       Funções de Seleção e Execução do COMPENSA VALORES NEGATIVOS          //
    //----------------------------------------------------------------------------//

    Function _AvaliarOcorrDeBenefValoresNegativosACompensar(
      pAnoRef: String;
      pListaDeBeneficiarios: TStringList;
      pTemListaDeBeneficiarios: Boolean): OleVariant;

    Function _DesfazerProcessoCompensaOuQuitacao(pTipo, pAnoRef, pCPFSel: String; pVersaoFolha: Integer): Boolean;

    Function _DesfazerLancamentosPensionista(pAnoRef, pCPFSel: String): Boolean;

    //----------------------------------------------------------------------------//

    // Lista das Naturezas de Rendimento disponíveis
    Function _ListaNatuRendimento(sSit: String): OleVariant;
    // Lista os últimos 5 anos de Versões da Folha de Benefícios disponíveis
    Function _ListaVersoesFolha: OleVariant;
    Function _ConverteListas(Const pListaPessoas: TStringList): String;

    Function _TiraMascara(wTexto: String): String;

  Protected
    Procedure DoChangeDataBase; Override;
    Procedure AfterInitialize; Override;
  End;

Var bFlgBenefProcessado, bFlgAcumulaContadorPorCPF, bFlgGravaSQLSomenteUmaVez: Boolean;
  iQtdBenefProcessado: Integer;

Implementation

Uses FBUSCA_DIRFFolhaBeneficios;

{ TCtrlBUSCA_DIRFFolhaBeneficios }

Procedure TCtrlBUSCA_DIRFFolhaBeneficios.AfterInitialize;
Begin
  Inherited;
  oLancIRRF.InitializeAs(self);
  oLancIRRF.OpenTransaction := False;
End;

Procedure TCtrlBUSCA_DIRFFolhaBeneficios.DoChangeDataBase;
Begin
  Inherited;
End;

Constructor TCtrlBUSCA_DIRFFolhaBeneficios.Create;
Begin
  Inherited;
  oLancIRRF := TCtrLancIRRF.Create;

  qryVerificaExistenciaAcaoJudicial := TwwQuery.Create(Nil);
  qryVerificaExistenciaAcaoJudicial.DatabaseName := 'BaseDados';

  CdsMovIndividualIdResponsavelBUSCA := TClientDataSet.Create(Nil);
  SQLParamMovBenefIndiv := TCMSqlParams.Create(Nil);
  SQLParamMovBenefIndiv.ControlObject := Self;
  SQLParamMovBenefIndiv.ClientDataSet := CdsMovIndividualIdResponsavelBUSCA;

  CdsMovIndividualIdResponsavelQuitacao := TClientDataSet.Create(Nil);
  CdsIDResponsavelDoCPFProcessado := TClientDataSet.Create(Nil);
  CdsAux1 := TClientDataSet.Create(Nil);
  CdsInformeDePara := TClientDataSet.Create(Nil);
  CdsParamIRRF := TClientDataSet.Create(Nil);
  CdsParamFolha := TClientDataSet.Create(Nil);
  CdsFontePagadora := TClientDataSet.Create(Nil);
  CdsInformeIRRF := TClientDataSet.Create(Nil);

  sqlText := tStringList.create;
  sMensagemProcessamento := '';
  iEmpresa := Sistema.IdEmpresa;
  bUsaPlanoPatro := Sistema.UsaPlanoPatro;
End;

Destructor TCtrlBUSCA_DIRFFolhaBeneficios.Destroy;
Begin
  Inherited;
  qryVerificaExistenciaAcaoJudicial.Close;
  CdsInformeIRRF.Close;
  CdsAux1.Close;
  CdsInformeDePara.Close;
  CdsParamIRRF.Close;
  CdsParamFolha.Close;

  FreeAndNil(CdsMovIndividualIdResponsavelBUSCA);
  FreeAndNil(SQLParamMovBenefIndiv);
  FreeAndNil(CdsMovIndividualIdResponsavelQuitacao);
  FreeAndNil(CdsIDResponsavelDoCPFProcessado);
  FreeAndNil(qryVerificaExistenciaAcaoJudicial);
  FreeAndNil(cdsInformeIRRF);
  FreeAndNil(CdsAux1);
  FreeAndNil(CdsInformeDePara);
  FreeAndNil(CdsParamIRRF);
  FreeAndNil(CdsParamFolha);
  FreeAndNil(CdsFontePagadora);
  FreeAndNil(sqlText);
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._TiraMascara(wTexto: String): String;
Var
  wCon, wCC: Integer;
  wRet, wParte: String;
Begin
  wRet := '';
  wCC := Length(wTexto);
  For wCon := 1 To wCC Do
    Begin
      wParte := copy(wTexto, wCon, 1);
      If (wParte <> '.') And (wParte <> '-') And
        (wParte <> '/') And (wParte <> ' ') And
        (wParte <> ',') And (wParte <> '*') Then
        wRet := wRet + wParte;
    End;
  _TiraMascara := wRet;
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._ListaNatuRendimento(sSit: String): OleVariant;
Var sSql: String;
Begin
  If sSit = '-1' Then // Todas as Versões da folha, Naturezas específicas
    Begin
      sSql := 'SELECT CODNATUREZA, (CODNATUREZA || '' - '' || DESCRICAO) DESCRICAO ' +
        'FROM NATURENDIMENTO ' +
        'WHERE FLGUSADONADIRF = ''S'' ' +
        '      AND CODNATUREZA IN (''3223'', ''3556'', ''3579'') ' +
        '      AND GRUPOTRIBUTO IS NOT NULL ' +
        'ORDER BY CODNATUREZA ';
    End
  Else If sSit = '0' Then // Todas as Naturezas específicas  (Usado no Processo de Desfazer a BUSCA)
    Begin
      sSql := 'SELECT * FROM (                                              ' +
        'SELECT 0 ORDEM, ''0000'' AS CODNATUREZA, ''Todas as Naturezas'' AS DESCRICAO  ' +
        'FROM DUAL                                                          ' +
        'UNION ALL                                                          ' +
        'SELECT 1 ORDEM, (CODNATUREZA || '' '') CODNATUREZA, DESCRICAO      ' +
        'FROM NATURENDIMENTO                                                ' +
        //'WHERE FLGUSADONADCTF = ''S''                                       ' +      //Andre Imakawa - WO8385
        '      WHERE GRUPOTRIBUTO IS NOT NULL)                                ' +      //Andre Imakawa - WO8385
        'ORDER BY ORDEM, CODNATUREZA                                        ';
    End
  Else
    // Versão da folha específica, todas as Naturezas
    sSql := 'SELECT ''0000'' AS CODNATUREZA, ''Todas as Naturezas'' AS DESCRICAO FROM DUAL ';

  Result := GetDataPacket(sSql);
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._ListaVersoesFolha: OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT * FROM (' +
    ' SELECT 0 ORDEM, ''Todas as Versões'' AS HISTORICO, -1 AS IDHSTFOLHABENEF, NULL DATAPREVPAGTO, '''' MESREFERENCIA ' +
    ' FROM DUAL                    ' +
    'UNION ALL                     ' +
    ' SELECT 1 ORDEM, IDHSTFOLHABENEF || ''-'' || HISTORICO AS HISTORICO, IDHSTFOLHABENEF, DATAPREVPAGTO, MESREFERENCIA ' +
    ' FROM HSTFOLHABENEF                  ' +
    ' WHERE DATAPREVPAGTO IS NOT NULL     ' +
    '       AND FLGTIPOFOLHA = ''0''      ' + // Folhas Normais
  '         AND TO_CHAR(DATAPREVPAGTO, ''YYYY'') >= TO_CHAR(SYSDATE, ''YYYY'') - 5)' + // Sempre mantendo a seleção dos últimos 5 anos fiscais
  ' ORDER BY ORDEM, IDHSTFOLHABENEF DESC ';

  Result := GetDataPacket(sSql);
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._ListaExerciciosDispEncerramento: OleVariant;
Var sSql: String;
Begin
  sSql := 'SELECT TO_CHAR(DATAEFETIVACAO, ''YYYY'') ANO_QUITACAO ' +
    ' FROM HSTFOLHABENEF                  ' +
    ' WHERE DATAPREVPAGTO IS NOT NULL     ' +
    '       AND FLGTIPOFOLHA = ''0''      ' + // Folhas Normais
  '         AND (TO_CHAR(DATAPREVPAGTO, ''YYYY'') >= TO_CHAR(SYSDATE, ''YYYY'') - 5)' + // Sempre mantendo a seleção dos últimos 5 anos fiscais
  '   GROUP BY TO_CHAR(DATAEFETIVACAO, ''YYYY'')  ' +
    ' ORDER BY ANO_QUITACAO DESC ';

  Result := GetDataPacket(sSql);
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._ConverteListas(Const pListaPessoas: TStringList): String;
Var I: Integer;
Begin
  For i := 0 To pListaPessoas.Count - 1 Do
    result := result + quotedstr(pListaPessoas[i]) + ',';

  Result := Copy(Result, 1, Length(Result) - 1);
End;

Procedure TCtrlBUSCA_DIRFFolhaBeneficios.AtualizaFrmProgresso(Var iContador: Integer);
Begin
  inc(iContador);
  frmProgresso.AndaFormProgresso(iContador);
  Application.ProcessMessages;
End;

//----------------------------------------------------------------------------//
//                                                                            //
//            Métodos para atualização do painel "Log. da Busca"                 //
//                                                                            //
//----------------------------------------------------------------------------//

Procedure TCtrlBUSCA_DIRFFolhaBeneficios.MostraMensagem(Const psTexto: String; Const pIncluiLinha: Boolean);
Begin
  frmBUSCA_DIRFFolhaBeneficios.memResult.Lines.Add(psTexto);
  If pIncluiLinha Then
    Linha();
  frmBUSCA_DIRFFolhaBeneficios.Repaint;
  application.processmessages;
End;

Procedure TCtrlBUSCA_DIRFFolhaBeneficios.Linha;
Begin
  MostraMensagem('-------------------------------------------------------------------------------------------------');
End;

Procedure TCtrlBUSCA_DIRFFolhaBeneficios.InicializaFormulario(Const pIncluiLinha: Boolean);
Begin
  With frmBUSCA_DIRFFolhaBeneficios Do
    Begin
      memResult.Text := '';
      repaint;
      Invalidate;
    End;
  If pIncluiLinha Then
    Linha();
End;

//
// ----------------------------------------------------------------------------------------------------------------
//
///  FUNÇÃO PRINCIPAL DE PROCESSAMENTO DO MOVIMENTO DA BUSCA DOS BENEFICIÁRIOS SELECIONADOS E MARCADOS NA GRID  ///
//
// ----------------------------------------------------------------------------------------------------------------
//

Function TCtrlBUSCA_DIRFFolhaBeneficios._ProcessarMovimentoDaBUSCA(
  pDataIni,
  pDataFim: TDateTime;
  pVersaoFolha: Integer;
  pCodNatureza: String;
  CdsBeneficiariosSelecionados,
  CdsConsultaMovBenef: TClientDataSet;
  pListaDeBeneficiarios: TStringlist;
  pTemListaDeBeneficiarios: Boolean;
  gProgresso: TGauge): Boolean;

//
//------------ CARREGA PROPRIEDADES PÚBLICAS COM OS DADOS GERAIS DO BENEFICIÁRIO ----------------//
//

  Procedure _CarregaDadosGeraisDoIdResponsavelDaBUSCA;
  Var dDataComparaIdade: double;
    dtDataFimMolGrave: TDateTime;
  Begin
    bBeneficiarioISENTO := False;
    bTemAcaoJudicial := False;
    bTemAcaoJudicial_BUA := False;
    bTemAcaoJudicial_IT := False;
    dValorRendimentoFUNCEF := 0.00;
    dValorRendimentoINSS := 0.00;
    iIdPessoaProcJud := 0;
    iIdProcJudFund := 0;

    sDataIniMolGrave := '';
    sDataFimMolGrave := '';
    DecodeDate(CdsMovIndividualIdResponsavelBUSCA.FieldByName('DATAPAGAMENTO').AsDateTime, iAno, iMes, iDia);
    DtInicioExercicio := strtodate('01/01/' + inttostr(iAno));
    DtFimExercicio := strtodate('31/12/' + inttostr(iAno));
    iVersaoFolha := CdsMovIndividualIdResponsavelBUSCA.fieldbyname('IDHSTFOLHABENEF').asInteger;
    sCodigoCentroRespon := CdsMovIndividualIdResponsavelBUSCA.FieldByName('CODCENTRORESPON').AsString;
    iIdPatro := CdsMovIndividualIdResponsavelBUSCA.FieldByName('IDPATRO').AsInteger;
    iIdModulo := CdsMovIndividualIdResponsavelBUSCA.FieldByName('IDMODULO').AsInteger;

    dValorRendimentoFUNCEF := CdsMovIndividualIdResponsavelBUSCA.FieldByName('TOTALRENDFUNCEF').AsFloat;
    dValorRendimentoINSS := CdsMovIndividualIdResponsavelBUSCA.FieldByName('TOTALRENDINSS').AsFloat;

    If Not CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAMOLESTIAGRAVE').IsNull Then
      sDataIniMolGrave := FormatDateTime('dd/mm/yyyy', CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAMOLESTIAGRAVE').asDateTime);
    If Not CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAFIMMOLESTIA').IsNull Then
      sDataFimMolGrave := FormatDateTime('dd/mm/yyyy', CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAFIMMOLESTIA').asDateTime);

    // Testando se o Beneficiário entrou em condição de IDOSO no processamento da folha
    dDataComparaIdade := DiasUteis.UltDiaMes(iAno, iMes);
    iIdadeAtual := DiasUteis.IntervaloMeses(CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATANASC').AsDateTime, dDataComparaIdade) Div 12;
    bBeneficiarioIdoso := ((Not CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATANASC').IsNull) And (iIdadeAtual >= iIdadeBenefParam));
    //
    // Avaliando o estado de isenção ou não do Beneficiário no exercício
    //
    If CdsMovIndividualIdResponsavelBUSCA.fieldByName('ISENTO_IRRF').AsString = 'S' Then
      bBeneficiarioISENTO := True
    Else
      Begin
        // Testando se o Beneficiário NÃO ESTÁ ISENTO durante o exercício
        If ((CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAMOLESTIAGRAVE').IsNull) And
          (CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAFIMMOLESTIA').Isnull)) Or
          // OU Se data de inicio e fim (com valor) ocorram antes do exercício
        ((CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAMOLESTIAGRAVE').AsDateTime < DtInicioExercicio) And
          ((Not CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAFIMMOLESTIA').isNull) And
          (CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAFIMMOLESTIA').AsDateTime < DtInicioExercicio))) Or
          // OU Se data de inicio e fim (sem valor) ocorram antes do exercício
        ((CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAMOLESTIAGRAVE').AsDateTime < DtInicioExercicio) And
          (CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAFIMMOLESTIA').isNull)) Then
          Begin
            bBeneficiarioISENTO := False;
          End
        Else
          Begin
            // Testando se a isenção ocorreu na data de início do exercício e a data de fim
            // não foi informada ou está com uma data superior a data do exercicio
            If ((CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAMOLESTIAGRAVE').AsDateTime = DtInicioExercicio) And
              ((CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAFIMMOLESTIA').Isnull) Or
              (CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAFIMMOLESTIA').AsDateTime >= DtFimExercicio))) Then
              Begin
                bBeneficiarioISENTO := True;
              End
            Else
              Begin
                // Parcialmente ISENTO
                sAnoMesPagtoFolha := FormatDateTime('yyyymm', CdsMovIndividualIdResponsavelBUSCA.FieldByName('DATAPAGAMENTO').asDateTime);
                sAnoMesDtIniMolGrave := '';
                dtDataFimMolGrave := strtodate('31/12/9999');
                If Not CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAMOLESTIAGRAVE').IsNull Then // Data de Inicio da Moléstia
                  Begin
                    sAnoMesDtIniMolGrave := FormatDateTime('yyyymm', CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAMOLESTIAGRAVE').AsDateTime);
                    If Not CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAFIMMOLESTIA').IsNull Then
                      dtDataFimMolGrave := CdsMovIndividualIdResponsavelBUSCA.fieldByname('DATAFIMMOLESTIA').AsDateTime;

                    bBeneficiarioISENTO := ((sAnoMesPagtoFolha >= sAnoMesDtIniMolGrave) And
                      (CdsMovIndividualIdResponsavelBUSCA.FieldByName('DATAPAGAMENTO').asDateTime <= dtDataFimMolGrave));
                  End;
              End;
          End;
      End;
  End;

  Function _ExisteMovimentoGerado(pCPF, pVersaoFolha: String): Boolean;
  Var qryAux: TwwQuery;
  Begin
    qryAux := TwwQuery.Create(Nil);
    qryAux.DatabaseName := 'BaseDados';
    qryAux.Close;
    With qryAux.Sql Do
      Begin
        Clear;
        Add('SELECT l.idlancirrf');
        Add('FROM lancirrf l');
        Add('WHERE L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPF) + ')');
        Add('      AND l.idhstfolhabenef = ' + QuotedStr(pVersaoFolha));
      End;
    qryAux.Open;
    Result := Not qryAux.isEmpty;
    FreeAndNil(qryAux);
  End;

  //Var
    //  bProcessou: boolean; //Darivaldo Alencar -SIG 21265

Begin
  Result := True;
  bProcComRestricao := False;
  sMensagemProcessamento := '';
  // Carregando varíaveis públicas para uso geral dentro da Função _ProcessarMovimentoDaBUSCA
  dtDataIni := pDataIni;
  dtDataFim := pDataFim;
  iVersaoFolha := pVersaoFolha;
  sCodigoNatureza := pCodNatureza;
  iQtdBenefProcessado := 0;
  bFlgGravaSQLSomenteUmaVez := True;

  TipoOperacao := tpBusca;    //edilaine - SIG96080

  //-------------------------------------------//

  InicializaFormulario();

  // Localiza parâmetros gerais p/ o processamento
  If _LocalizaParametrosParaProcessamentoBUSCA Then
    Begin
      CdsBeneficiariosSelecionados.First;

      MostraMensagem('Processamento "BUSCA" Iniciado...');
      Linha();
      MostraMensagem('Critérios fornecidos:');
      MostraMensagem('   > Período                             : ' + datetostr(dtDataIni) + ' a ' + datetostr(dtDataFim));
      MostraMensagem('   > Versão da Folha                     : ' + frmBUSCA_DIRFFolhaBeneficios.cdsVersoesFolha.fieldbyname('HISTORICO').asString);
      MostraMensagem('   > Natureza do Rendimento              : ' + IFF(sCodigoNatureza = '0000', 'Todas as Naturezas', sCodigoNatureza));
      Linha();
      Application.ProcessMessages;

      dtProcInicio := Now;
      MostraMensagem('Início Processamento Individual  : ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', dtProcInicio));
      MostraMensagem('Qtd.Beneficiários a Processar    : ' + inttostr(CdsBeneficiariosSelecionados.Recordcount));
      Linha();
      application.ProcessMessages;

      // Paulo Nobre - SIG 30783 - inicio
      If gProgresso <> Nil Then
        Begin
          gProgresso.Progress := 0;
          gProgresso.MinValue := 0;
          gProgresso.MaxValue := CdsBeneficiariosSelecionados.RecordCount;
        End;
      // Paulo Nobre - SIG 30783 - fim

      // Começando o loop de processamento da BUSCA para todos os Beneficiários marcados da grid
      While Not CdsBeneficiariosSelecionados.EOF Do
        Begin
          // Paulo Nobre - SIG 21776 - Inicio

         //Darivaldo Alencar SIG 21265 -inicio
{         If (iVersaoFolha) <> (CdsConsultaMovBenef.FieldByName('IDHSTFOLHABENEF').AsInteger) Then
           bProcessou := true
         Else
           bProcessou := false;

         If Not (bProcessou) Then
           Begin}
         //Darivaldo Alencar SIG 21265 -fim

          // Paulo Nobre - SIG 21776 - Fim

          // Paulo Nobre - SIG 30783 - inicio
          If gProgresso <> Nil Then
            gProgresso.Progress := gProgresso.Progress + 1;
          // Paulo Nobre - SIG 30783 - fim

          bFlgAcumulaContadorPorCPF := True;
          dValorRendimentoFUNCEF := 0.00;
          dValorRendimentoINSS := 0.00;

          // Paulo Nobre SOL 268373 PPM 1260556
          // Busca Valor do Idoso por vigência baseado nas datas de pagamento das folhas
          CdsParamIRRF.Data := GetDataPacket('SELECT * ' +
            'FROM HSTPARAMIRRF   ' +
            'WHERE DATAINIVIGENCIA = (SELECT MAX(DATAINIVIGENCIA) ' +
            '                         FROM   HSTPARAMIRRF   ' +
            '                         WHERE  DATAINIVIGENCIA <= TO_DATE(' + QuotedStr(datetostr(CdsBeneficiariosSelecionados.fieldbyname('DATAPAGAMENTO').asDateTime)) + ',''DD/MM/YYYY''))');
          dValorDescontoIdosoParam := CdsParamIRRF.fieldbyname('VLRIDOSO').asFloat;
          //////////////////////////////////////////////////////
          //

          // Selecionando o(s) IDRESPONSAVEL(EIS) do CPF
          If _SelecionaIdResponsaveisDoCPFBUSCA(
            CdsBeneficiariosSelecionados.fieldbyname('CPFRESP').asString,
            CdsBeneficiariosSelecionados.FieldByName('IDHSTFOLHABENEF').asString) Then
            Begin
              iVersaoFolha := CdsBeneficiariosSelecionados.FieldByName('IDHSTFOLHABENEF').asInteger;
              bTeveUmIDRespComCalculoDeAcaoJudicial := False;
              bFlgBenefProcessado := False;
              bFlgGravaSQLSomenteUmaVez := True;
              dValorAbate45SegundoId := 0; // Andre Imakawa - SIG 39642
              bNaoLancaId45SegundoId    := False; // Andre Imakawa - SIG 62400
              // Processando o(s) IDRESPONSAVEL(EIS) do CPF
              CdsIDResponsavelDoCPFProcessado.First;
              While Not CdsIDResponsavelDoCPFProcessado.EOF Do
                Begin
                  sCPFBeneficiarioSelecionado := CdsIDResponsavelDoCPFProcessado.FieldByName('CPFRESP').AsString;
                  iIdResponsavelAtual := CdsIDResponsavelDoCPFProcessado.FieldByName('IDRESPONSAVEL').AsInteger;

                  // Selecionando o Movimento Individual do Beneficiário pelo CPF e IDRESPONSAVEL
                  If _SelecionarMovIndivIdResponsavelBUSCA(iVersaoFolha, iIdResponsavelAtual, sCPFBeneficiarioSelecionado) Then
                    Begin
                      // Carregando dados gerais do IDRESPONSAVEL
                      _CarregaDadosGeraisDoIdResponsavelDaBUSCA;

                      // Começando o processamento do movimento individual do IDRESPONSAVEL
                      CdsMovIndividualIdResponsavelBUSCA.First;
                      While Not CdsMovIndividualIdResponsavelBUSCA.EOF Do
                        Begin
                          // Carregando variáveis públicas com os valores individuais do IDINFORME selecionado
                          _CarregaDadosIndivDoInformeProcessado;

                          // Paulo Nobre - SIG 21776 - Inicio
                          // Evitando a duplicação de lançamentos já existentes  // Paulo / Andre - SIG26821
                          If Not cdsConsultaMovBenef.Locate('IDHSTFOLHABENEF;NUMDOCUMENTO;IDBENEFIRRF;FONTEPAGADORA;CODNATUREZA', VarArrayOf([
                            inttostr(iVersaoFolha),
                              sCPFBeneficiarioSelecionado,
                              inttostr(iIdResponsavelAtual),
                              inttostr(iFontePagadora),
                              sCodigoNaturezaIndiv]), []) Then
                            Begin
                              // Verificando a existência de Ação Judicial p/ o IDRESPONSAVEL atual, pois
                              // pode haver a situação de ter 2 ID´s Responsáveis, um com ação e outro sem.
                              //_AvaliaExistenciaDeAcaoJudicial(iIdResponsavelAtual, dtDataIni, dtDataFim);     //edilaine SIG99002
                              _VerificaAcoesJudiciais(iIdResponsavelAtual, dtDataIni, dtDataFim);               //edilaine SIG99002

                              bInformeAcJudEQUA := iIDInformeGravar in [214, 215, 217];                         //edilaine SIG122212
                              bDevolucaoValor   := (sFlgNatureza = 'N') and (dValorTotalIDINFORMEBusca > 0);    //edilaine SIG122199

                              bAcaoEquaGanha    := false;   //edilaine SIG134189

                              //Cássio Rovaroto - SIG nº 74355 - Início
                              if (CdsMovIndividualIdResponsavelBUSCA.FieldByName('IDPROCJUD').AsInteger <> -1) or (iIDInformeGravar = iLinhaAcaoJudicialContribExtra) or (iIDInformeGravar = iIdInformeContribExtra13)
                              //Cássio Rovaroto - SIG nº 81275 - Início
                                or (iIDInformeGravar = iIdInformeOutrosAcaoJudicial) or (iIDInformeGravar = iIdInformeOutrosAcaoJudicial13) then
                              //Cássio Rovaroto - SIG nº 81275 - Fim
                                bTemAcaoJudicial_CE := _PossuiAcaoJudContribExtra(iIdResponsavelAtual,
                                                                                  iVersaoFolha,
                                                                                  dtDataIni,
                                                                                  dtDataFim,
                                                                                  sCPFBeneficiarioSelecionado,
                                                                                  CdsMovIndividualIdResponsavelBUSCA.FieldByName('IDPROCJUD').AsInteger,
                                                                                  bAcaoEquaGanha,        //edilaine SIG134189
                                                                                  iIDInformeGravar,
                                                                                  bDevolucaoValor        //edilaine SIG122199
                                                                                  )
                              else
                                bTemAcaoJudicial_CE := False;
                              //Cássio Rovaroto - SIG nº 74355 - Fim

                              //edilaine - SIG80791 - inicio
                              if (iIDInformeGravar = iIdInforme13DepFUNCEF) and
                                 (_VerificandoOcorrenciaDoIDINFORMEProcessado(sCPFBeneficiarioSelecionado, iIdInforme13DepFUNCEF {91}, ExtraiAno(dtDataIni))) then
                              begin
                                CdsMovIndividualIdResponsavelBUSCA.next;
                                continue;
                              end;
                              //edilaine - SIG80791 - fim

                              //*******************************************
                              //***** A) BENEFICIÁRIO ISENTO **************
                              //*******************************************
                              If bBeneficiarioISENTO Then
                                Begin
                                  if (iIDInformeGravar <> iLinhaAcaoJudicialContribExtra) and (iIDInformeGravar <> iIdInformeContribExtra13)  //then
                                  //Cássio Rovaroto - SIG nº 81275 - Início
                                  and (iIDInformeGravar <> iIdInformeOutrosAcaoJudicial) and (iIDInformeGravar <> iIdInformeOutrosAcaoJudicial13) then
                                  //Cássio Rovaroto - SIG nº 81275 - Fim
                                  begin
                                    // Verificar se o IdInforme Original tem IdInforme Destino p/ gravação
                                    _Verificando_DE_PARA(iIDInformeGravar, 1); // 1 = Moléstia Grave
                                    // Gravando o IDINFORME normalmente com seus dados
                                    _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                  end;
                                End
                              Else
                                //*****************************************
                                //**** D) BENEFICIÁRIO NÃO ISENTO *********
                                //*****************************************
                                Begin
                                  //
                                  //****************************************************
                                  //********* BENEFICIÁRIO IDOSO >= 65 Anos ***********
                                  //****************************************************
                                  //
                                  If bBeneficiarioIdoso Then
                                    Begin
                                      //
                                      //-----------------------------------------------------------------------------
                                      // IDOSO E RENDIMENTO FUNCEF MENOR OU IGUAL AO VALOR PARAMETRIZADO DO IDOSO (A)
                                      //-----------------------------------------------------------------------------
                                      //
                                      If dValorRendimentoFUNCEF <= dValorDescontoIdosoParam Then
                                        Begin
                                          // Paulo Nobre - SIG 30792 - Inicio
                                          If (iIDInformeGravar = iIdInformeTRBINSS) And
                                            (sCodigoNaturezaIndiv = sCodigoNaturRendINSS) Then // 45 - Total do Rendimento Bruto INSS
                                            Begin
                                              // Andre Imakawa - SIG 36071 - Inicio
                                                // Efetuar tratamento para Informe 45 quando valor for positivo
                                              If dValorRendimentoINSS > 0 Then
                                                Begin
                                                  // Andre Imakawa - SIG 36071 - Fim

                                                // Se Rendimento INSS MAIOR que o valor do idoso
                                                  If dValorRendimentoINSS > dValorDescontoIdosoParam Then //William Santana - SIG 19501
                                                    // If dValorRendimentoINSS > (dValorDescontoIdosoParam - abs(dValorRendimentoFUNCEF)) Then //William Santana - SIG 19501
                                                    Begin
                                                      // Recurso usado para somente gravar um registro do 53 por CPF
                                                      If Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionado, iVersaoFolha, iLinhaAcima65INSS {53}) Then
                                                        Begin
                                                          // Recurso usado para só gravar o 53 se as condições abaixo forem atendidas
                                                          If (Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionado, iVersaoFolha, iLinhaAcima65 {52})) Or
                                                            (Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionado, iVersaoFolha, iIdInformeTRBFUNCEF {49})) Then
                                                            Begin
                                                              // Não há Rendimento Funcef
                                                              If (dValorRendimentoFUNCEF <= 0) Then
                                                                Begin
                                                                  // Abatendo do valor do Rendimento INSS, o valor do Idoso
                                                                  dValorCalculado := dValorRendimentoINSS - dValorDescontoIdosoParam;

                                                                  // Gravando o IDINFORME 45 com este Valor Calculado
                                                                  _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorCalculado, '');

                                                                  // Gravando um novo IDINFORME parametrizado (53 - Parte dos proventos 65 anos ou mais INSS) com este Valor Calculado
                                                                  _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorDescontoIdosoParam, '');
                                                                End
                                                              Else
                                                                Begin
                                                                  // Calculando o valor do Idoso menos o valor do Rendimento FUNCEF
                                                                  dValorSemIdadeIdoso := dValorDescontoIdosoParam - dValorRendimentoFUNCEF;

                                                                  // Andre Imakawa - SIG 39642 - Inicio
                                                                  if dValorTotalIDINFORMEBusca = dValorRendimentoINSS then
                                                                  begin
                                                                    // Se o Valor sem o Idoso for >= que o Valor Rendimento INSS
                                                                    If dValorSemIdadeIdoso >= dValorRendimentoINSS Then
                                                                      Begin
                                                                        // Gravando um novo IDINFORME parametrizado (53 - Parte dos proventos 65 anos ou mais INSS) com o Valor do INSS
                                                                        _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorRendimentoINSS, '');
                                                                      End
                                                                    Else // Se o Valor sem o Idoso for < que o Valor Rendimento INSS
                                                                      Begin
                                                                        // Abatendo do valor do Rendimento INSS, o valor do Idoso menos o valor do Rendimento FUNCEF
                                                                        dValorCalculado := dValorRendimentoINSS - dValorSemIdadeIdoso;

                                                                        // Gravando o IDINFORME 45 com este Valor Calculado
                                                                        _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorCalculado, '');

                                                                        // Gravando um novo IDINFORME parametrizado (53 - Parte dos proventos 65 anos ou mais INSS) com este Valor Calculado
                                                                        _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorSemIdadeIdoso, '');
                                                                      End;
                                                                  End
                                                                  Else
                                                                  Begin
                                                                    // Primeiro verifica se o valor INSS do IdPessoa que esta sendo processado
                                                                    // é maior que saldo do idoso
                                                                    if dValorTotalIDINFORMEBusca >= dValorSemIdadeIdoso then
                                                                    begin
                                                                      // Abatendo Idade do valor do Rendimento INSS do IdPessoa
                                                                      dValorCalculado := dValorTotalIDINFORMEBusca - dValorSemIdadeIdoso;

                                                                      // Gravando o IDINFORME 45 com este Valor Calculado
                                                                      _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorCalculado, '');

                                                                      // Gravando um novo IDINFORME parametrizado (53 - Parte dos proventos 65 anos ou mais INSS) com este Valor Calculado
                                                                      _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorSemIdadeIdoso, '');
                                                                    end
                                                                    else
                                                                    begin
                                                                      // Se o Valor sem o Idoso for >= que o Valor Rendimento INSS
                                                                      If dValorSemIdadeIdoso >= dValorRendimentoINSS Then
                                                                        Begin
                                                                          // Gravando um novo IDINFORME parametrizado (53 - Parte dos proventos 65 anos ou mais INSS) com o Valor do INSS
                                                                          _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorRendimentoINSS, '');
                                                                        End
                                                                      Else // Se o Valor sem o Idoso for < que o Valor Rendimento INSS
                                                                        Begin

                                                                           dValorAbate45SegundoId := dValorTotalIDINFORMEBusca- dValorSemIdadeIdoso;

                                                                          // Gravando um novo IDINFORME parametrizado (53 - Parte dos proventos 65 anos ou mais INSS) com este Valor Calculado
                                                                          _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorSemIdadeIdoso, '');
                                                                        End;
                                                                    end;
                                                                  end;
                                                                  // Andre Imakawa - SIG 39642 - Fim
                                                                End;
                                                            End
                                                          Else
                                                            // Gravando o IDINFORME normalmente com seus dados
                                                            _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                                        End
                                                      Else
                                                      begin
                                                        // Andre Imakawa - SIG 39642 - Inicio
                                                        // Necessario abater a diferença do id 45 para o segundo idPessoa
                                                        // Gravando o IDINFORME normalmente com seus dados
                                                        if dValorAbate45SegundoId <> 0 then
                                                          _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca - abs(dValorAbate45SegundoId), '')
                                                        else
                                                          _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');

                                                        dValorAbate45SegundoId := 0;
                                                        // Andre Imakawa - SIG 39642 - Fim
                                                      end;
                                                    End
                                                  Else // Se Rendimento INSS MENOR OU IGUAL que o valor do idoso
                                                    // Andre Imakawa - SIG 32974  - Inicio
                                                    Begin
                                                      // Recurso usado para somente gravar um registro do 53 por CPF
                                                      If Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionado, iVersaoFolha, iLinhaAcima65INSS {53}) Then
                                                        Begin
                                                          // Recurso usado para só gravar o 53 se as condições abaixo forem atendidas
                                                          If (Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionado, iVersaoFolha, iLinhaAcima65 {52})) Or
                                                            (Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionado, iVersaoFolha, iIdInformeTRBFUNCEF {49})) Then
                                                            Begin
                                                              // Não há Rendimento Funcef
                                                              If (dValorRendimentoFUNCEF <= 0) Then
                                                                Begin
                                                                  // Gravando um novo IDINFORME parametrizado (53 - Parte dos proventos 65 anos ou mais INSS) com o Valor normal
                                                                  _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorTotalIDINFORMEBusca, '')
                                                                End
                                                              Else
                                                                Begin
                                                                  // Calculando o valor do Idoso menos o valor do Rendimento FUNCEF
                                                                  dValorSemIdadeIdoso := dValorDescontoIdosoParam - dValorRendimentoFUNCEF;

                                                                  // Andre Imakawa - SIG 39642 - Inicio
                                                                  if dValorTotalIDINFORMEBusca = dValorRendimentoINSS then
                                                                  begin
                                                                    // Se o Valor sem o Idoso for >= que o Valor Rendimento INSS
                                                                    If dValorSemIdadeIdoso >= dValorRendimentoINSS Then
                                                                      Begin
                                                                        // Gravando um novo IDINFORME parametrizado (53 - Parte dos proventos 65 anos ou mais INSS) com o Valor do INSS
                                                                        _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorRendimentoINSS, '');
                                                                      End
                                                                    Else // Se o Valor sem o Idoso for < que o Valor Rendimento INSS
                                                                      Begin
                                                                        // Abatendo do valor do Rendimento INSS, o valor do Idoso menos o valor do Rendimento FUNCEF
                                                                        dValorCalculado := dValorRendimentoINSS - dValorSemIdadeIdoso;

                                                                        // Gravando o IDINFORME 45 com este Valor Calculado
                                                                        _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorCalculado, '');

                                                                        // Gravando um novo IDINFORME parametrizado (53 - Parte dos proventos 65 anos ou mais INSS) com este Valor Calculado
                                                                        _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorSemIdadeIdoso, '');
                                                                      End;
                                                                  End
                                                                  Else
                                                                  Begin
                                                                    // Primeiro verifica se o valor INSS do IdPessoa que esta sendo processado
                                                                    // é maior que saldo do idoso
                                                                    if dValorTotalIDINFORMEBusca >= dValorSemIdadeIdoso then
                                                                    begin
                                                                      // Abatendo Idade do valor do Rendimento INSS do IdPessoa
                                                                      dValorCalculado := dValorTotalIDINFORMEBusca - dValorSemIdadeIdoso;

                                                                      // Gravando o IDINFORME 45 com este Valor Calculado
                                                                      _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorCalculado, '');

                                                                      // Gravando um novo IDINFORME parametrizado (53 - Parte dos proventos 65 anos ou mais INSS) com este Valor Calculado
                                                                      _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorSemIdadeIdoso, '');
                                                                    end
                                                                    else
                                                                    begin
                                                                      // Se o Valor sem o Idoso for >= que o Valor Rendimento INSS
                                                                      If dValorSemIdadeIdoso >= dValorRendimentoINSS Then
                                                                        Begin
                                                                          // Gravando um novo IDINFORME parametrizado (53 - Parte dos proventos 65 anos ou mais INSS) com o Valor do INSS
                                                                          _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorRendimentoINSS, '');

                                                                          bNaoLancaId45SegundoId    := True; // Andre Imakawa - SIG 62400
                                                                        End
                                                                      Else // Se o Valor sem o Idoso for < que o Valor Rendimento INSS
                                                                        Begin

                                                                           dValorAbate45SegundoId := dValorTotalIDINFORMEBusca- dValorSemIdadeIdoso;

                                                                          // Gravando um novo IDINFORME parametrizado (53 - Parte dos proventos 65 anos ou mais INSS) com este Valor Calculado
                                                                          _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorSemIdadeIdoso, '');
                                                                        End;
                                                                    end;
                                                                  end;
                                                                  // Andre Imakawa - SIG 39642 - Fim
                                                                End;
                                                            End;
                                                        End
                                                      Else
                                                      begin
                                                        // Andre Imakawa - SIG 39642 - Inicio
                                                        // Necessario abater a diferença do id 45 para o segundo idPessoa
                                                        // Gravando o IDINFORME normalmente com seus dados
                                                        if dValorAbate45SegundoId <> 0 then
                                                          _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca - abs(dValorAbate45SegundoId), '')
                                                        else // Andre Imakawa - SIG 62400 - Inicio
                                                          if not(bNaoLancaId45SegundoId) then
                                                            _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                                          // Andre Imakawa - SIG 62400 - Fim

                                                        dValorAbate45SegundoId := 0;
                                                        // Andre Imakawa - SIG 39642 - Fim
                                                      end;
                                                      // Andre Imakawa - SIG 32974  - Fim
                                                    End;
                                                  // Paulo Nobre - SIG 30792 - Fim
                                                  // Andre Imakawa - SIG 36071 - Inicio
                                                End
                                              Else
                                                Begin
                                                  // Gravando o IDINFORME normalmente com seus dados
                                                  _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                                End;
                                              // Andre Imakawa - SIG 36071 - Fim
                                            End
                                          Else If (iIDInformeGravar = iIdInformeTRBFUNCEF) And
                                            (sCodigoNaturezaIndiv = sCodigoNaturRendFUNCEF) Then // 49 - Total Rendimento Bruto - FUNCEF
                                            Begin
                                              // Paulo Nobre - SIG 21776
                                              If (dValorRendimentoFUNCEF > 0) Then
                                                Begin
                                                  // Recurso usado para somente gravar um registro do 52 por CPF
                                                  If Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionado, iVersaoFolha, iLinhaAcima65 {52}) Then
                                                    Begin
                                                      // Gravando um novo IDINFORME parametrizado (52 - Parte dos proventos 65 anos )
                                                      _GravarDadosIRRF_Beneficiario(iLinhaAcima65, iFontePagadora, dValorRendimentoFUNCEF, '');
                                                    End
                                                      // Andre Imakawa - SIG 32974  - Inicio
                                                        //Else
                                                          // Gravando o IDINFORME normalmente com seus dados
                                                          //_GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                                          // Andre Imakawa - SIG 32974  - Fim

                                                  // Andre Imakawa - SIG 36071 - Inicio
                                                  // Caso exista registro 52, não lançar registro 49
                                                  // Isso ocorre nesse trecho pois valor do Rendimento FUNCEF(dValorRendimentoFUNCEF) é menor que o valor idoso
                                                  // E o mesmo ja foi lançado no ID 52
                                                  {
                                                  Else
                                                    // Gravando o IDINFORME normalmente com seus dados
                                                    _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                                  }
                                                  // Andre Imakawa - SIG 36071 - Fim
                                                End
                                              Else
                                                Begin
                                                  // Paulo Nobre - SIG 31920 - Fim
                                                  // Recurso usado para somente gravar um registro do 53 por CPF

                                                  // Andre Imakawa - SIG 50578 - Inicio
                                                  {
                                                  If Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionado, iVersaoFolha, iLinhaAcima65INSS) Then // 53
                                                    Begin
                                                      // Gravando o IDINFORME normalmente com seus dados
                                                      _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                                    End;
                                                  }
                                                  // Gravando o IDINFORME normalmente com seus dados
                                                  _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                                  // Andre Imakawa - SIG 50578 - Inicio

                                                  // Paulo Nobre - SIG 31920 - Fim
                                                End;
                                            End
                                          Else
                                            //Cássio Rovaroto - SIG nº 81253 - Início
                                            //if (bTemAcaoJudicial_CE) and not (_ExisteAcaoBiTributacao(iIdResponsavelAtual, dtDataIni, dtDataFim)) then       //edilaine SIG122212
                                            if (bTemAcaoJudicial_CE) and ((bInformeAcJudEQUA) or (iIDInformeGravar = iIdInformeIRJudContribExtra)) then        //edilaine SIG122212
                                            begin
                                              bTemAcaoJudicial_CE := False;
                                              if bAcaoEquaGanha then                //edilaine SIG134189
                                                 _Verificando_DE_PARA(iIDInformeGravar, 3); // 3 = Acao Ganha

                                              _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                            end
                                            else
                                              //Cássio Rovaroto - SIG nº 81353 - Início
                                              //if (iIDInformeGravar <> iLinhaAcaoJudicialContribExtra) and (iIDInformeGravar <> iIdInformeContribExtra13)  then
                                              //if (iIDInformeGravar <> iLinhaAcaoJudicialContribExtra) and (iIDInformeGravar <> iIdInformeContribExtra13) and not (bTemAcaoJudicial_CE)  then
                                              //Cássio Rovaroto - SIG nº 81275 - Início
                                                if (iIDInformeGravar <> iLinhaAcaoJudicialContribExtra) and (iIDInformeGravar <> iIdInformeContribExtra13) //then
                                                    and (iIDInformeGravar <> iIdInformeOutrosAcaoJudicial) and (iIDInformeGravar <> iIdInformeOutrosAcaoJudicial13) and not (bTemAcaoJudicial_CE)  then
                                                  //Cássio Rovaroto - SIG nº 81275 - Fim
                                                  //Cássio Rovaroto - SIG nº 81353 - Fim
                                                  //Cássio Rovaroto - SIG nº 74355 - Fim
                                                  // Gravando o IDINFORME normalmente com seus dados
                                                  _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                        End
                                      Else
                                        Begin
                                          //
                                          //-----------------------------------------------------------------------
                                          // IDOSO E RENDIMENTO FUNCEF MAIOR QUE O VALOR PARAMETRIZADO DO IDOSO (B)
                                          //-----------------------------------------------------------------------
                                          //
                                          If (bTemAcaoJudicial) Or (bTemAcaoJudicial_BUA) Or (bTemAcaoJudicial_IT) or (bTemAcaoJudicial_CE) Then
                                            Begin
                                              //--------------------------------------------
                                              // IDOSO, FUNCEF MAIOR E TEM ACAO JUDICIAL (C)
                                              //--------------------------------------------

                                              // Esta variável é para indicar que pelo menos um dos IDRESPONSAVEIS terá cálculo de
                                              // ação judicial, caso haja outro e este não tenha ação, este cálculo não será feito.
                                              //Cássio Rovaroto - SIG nº 81275 - Início
                                              if bTemAcaoJudicial_CE then
                                                bTeveUmIDRespComCalculoDeAcaoJudicial := False
                                              else
                                              //Cássio Rovaroto - SIG nº 81275 - Fim
                                                bTeveUmIDRespComCalculoDeAcaoJudicial := True;

                                              If ((iIDInformeGravar = iIdInformeTRBFUNCEF) Or (iIDInformeGravar = iIdInformeBUA)) And // Edilaine - SIG 19523
                                              (sCodigoNaturezaIndiv = sCodigoNaturRendFUNCEF) Then // 49 - Total Rendimento Bruto - FUNCEF
                                                Begin
                                                  If (dValorRendimentoFUNCEF > 0) Then
                                                    Begin
                                                      // Recurso usado para somente gravar um registro do 52 por CPF
                                                      If Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionado, iVersaoFolha, iLinhaAcima65 {52}) Then
                                                        Begin
                                                          // Abatendo do Rendimento FUNCEF, o valor parametrizado do Idoso
                                                          dValorSemIdadeIdoso := dValorTotalIDINFORMEBusca - dValorDescontoIdosoParam;
                                                          // Calculando o valor da Ação Judicial
                                                          dValorAcaoJud := RoundCM((dValorSemIdadeIdoso * (dPercAcaoJudicial / 100)), 2);
                                                          If dPercAcaoJudicial < 100 Then // se for < 100% calcula e grava o 49
                                                            Begin
                                                              // Calculando a diferença entre o Valor do idoso menos o Valor da Ação Judicial
                                                              dValorCalculado := dValorSemIdadeIdoso - dValorAcaoJud;
                                                              // Gravando o IDINFORME 49 com este valor calculado
                                                              _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorCalculado, '');
                                                            End;

                                                          // Gravando o IDINFORME parametrizado (52 - Parte dos proventos 65 anos ) com o valor do idoso
                                                          _GravarDadosIRRF_Beneficiario(iLinhaAcima65, iFontePagadora, dValorDescontoIdosoParam, '');

                                                          // Gravando o IDINFORME parametrizado (168 - Total Rendimento Bruto - FUNCEF Exigb.Suspensa )
                                                          // com o valor da ação judicial
                                                          // Edilaine - SIG 19523 - inicio
                                                              //William Moreira da Silva - SIG 27868
                                                          If ((bTemAcaoJudicial_BUA) And (bTemRendimento_BUA))
                                                            Or ((bTemAcaoJudicial) {And Not (bTemAcaoJudicial_BUA)}) //Darivaldo Alencar SIG.23797  //edilaine SIG99002
                                                          //William Moreira da Silva - SIG 27868
                                                          Then
                                                            _GravarDadosIRRF_Beneficiario(iLinhaRendAcJud, iFontePagadora, dValorAcaoJud, '')
                                                          Else If Not (dPercAcaoJudicial < 100) Then
                                                            _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorSemIdadeIdoso, '');
                                                          // Edilaine - SIG 19523 - fim
                                                        End
                                                      Else
                                                        // Andre Imakawa - SIG 60879 - Inicio
                                                        Begin
                                                          If ((bTemAcaoJudicial_BUA) And (bTemRendimento_BUA))
                                                            Or ((bTemAcaoJudicial) {And Not (bTemAcaoJudicial_BUA)})    //edilaine SIG99002
                                                          Then
                                                          Begin
                                                            // Calculando o valor da Ação Judicial
                                                            dValorAcaoJud := RoundCM((dValorTotalIDINFORMEBusca * (dPercAcaoJudicial / 100)), 2);
                                                            If dPercAcaoJudicial < 100 Then // se for < 100% calcula e grava o 49
                                                            Begin
                                                              // Calculando a diferença entre o Valor da busca menos valor da ação.
                                                              dValorCalculado := dValorTotalIDINFORMEBusca - dValorAcaoJud;
                                                              // Gravando o IDINFORME 49 com este valor calculado
                                                              _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorCalculado, '');
                                                            End;
                                                            // Gravando a Ação Judicial
                                                            _GravarDadosIRRF_Beneficiario(iLinhaRendAcJud, iFontePagadora, dValorAcaoJud, '')

                                                          end
                                                          Else
                                                          Begin
                                                            // Gravando o IDINFORME normalmente com seus dados
                                                            _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                                          end;
                                                        end;
                                                        // Andre Imakawa - SIG 60879 - Fim
                                                    End
                                                  Else
                                                    // Gravando o IDINFORME normalmente com seus dados
                                                    _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                                End
                                              //Cássio Rovaroto - SIG nº 74355 - Início
                                                else
                                                  //if (bTemAcaoJudicial_CE) {and ((iIDInformeGravar = iLinhaAcaoJudicialContribExtra)} and not (_ExisteAcaoBiTributacao(iIdResponsavelAtual, dtDataIni, dtDataFim)){)} then    //edilaine SIG122212
                                                  if (bTemAcaoJudicial_CE) and ((bInformeAcJudEQUA) or (iIDInformeGravar = iIdInformeIRJudContribExtra)) then        //edilaine SIG122212
                                                  begin
                                                    bTemAcaoJudicial_CE := False;
                                                    if bAcaoEquaGanha then    //edilaine SIG134189
                                                       _Verificando_DE_PARA(iIDInformeGravar, 3); // 3 = Acao Ganha
                                                    _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                                  end

                                              Else
                                                //Cássio Rovaroto - SIG nº 81353 - Início
                                                //if (iIDInformeGravar <> iLinhaAcaoJudicialContribExtra) and (iIDInformeGravar <> iIdInformeContribExtra13)  then
                                                if (iIDInformeGravar <> iLinhaAcaoJudicialContribExtra) and (iIDInformeGravar <> iIdInformeContribExtra13) and not (bTemAcaoJudicial_CE)  then
                                                //Cássio Rovaroto - SIG nº 81353 - Fim
                                              //Cássio Rovaroto - SIG nº 74355 - Fim
                                                // Gravando o IDINFORME normalmente com seus dados
                                                _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                            End
                                          Else
                                            Begin
                                              //
                                              //-------------------------------------------------
                                              // IDOSO, FUNCEF MAIOR E NÃO TEM ACAO JUDICIAL (D)
                                              //-------------------------------------------------
                                              //
                                              // Este flag indicar que pelo menos um dos IDRESPONSAVEIS (quando o CPF tiver 2)
                                              // teve ação judicial, no caso do IDRESPONSAVEL que não tiver ação, a gravação
                                              // deverá ser direta, sem tratamento.
                                              If Not bTeveUmIDRespComCalculoDeAcaoJudicial Then
                                                Begin
                                                  If (iIDInformeGravar = iIdInformeTRBFUNCEF) And
                                                    (sCodigoNaturezaIndiv = sCodigoNaturRendFUNCEF) Then // 49 - Total Rendimento Bruto - FUNCEF
                                                    Begin
                                                      If (dValorRendimentoFUNCEF > 0) Then
                                                        Begin
                                                          // Recurso usado para somente gravar um registro do 52 por CPF
                                                          If Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionado, iVersaoFolha, iLinhaAcima65 {52}) Then
                                                            Begin
                                                              // se tem dois 49 e abater do somatorio Funcef, setar para true a variavel e nao lançar o 2o 49
                                                              bIdosoAbatidoRendaFuncef := Not (dValorTotalIDINFORMEBusca > dValorDescontoIdosoParam); // edilaine - SIG 19935

                                                              // Abatendo do valor do Rendimento FUNCEF o valor parametrizado do Idoso
                                                              If dValorTotalIDINFORMEBusca > dValorDescontoIdosoParam Then // edilaine - SIG 19935
                                                                dValorCalculado := dValorTotalIDINFORMEBusca - dValorDescontoIdosoParam // edilaine - SIG 19935
                                                              Else
                                                                dValorCalculado := dValorRendimentoFUNCEF - dValorDescontoIdosoParam;

                                                              // Gravando o IDINFORME 49 (Total Rendimento Bruto - FUNCEF) com este valor calculado
                                                              _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorCalculado, '');

                                                              // Gravando um novo IDINFORME parametrizado (52 - Parte dos proventos 65 anos )
                                                              _GravarDadosIRRF_Beneficiario(iLinhaAcima65, iFontePagadora, dValorDescontoIdosoParam, '');

                                                            End
                                                          Else
                                                            // Gravando o IDINFORME normalmente com seus dados
                                                            If Not bIdosoAbatidoRendaFuncef Then // edilaine - SIG 19935
                                                              _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                                        End
                                                      Else
                                                        // Gravando o IDINFORME normalmente com seus dados
                                                        _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                                    End
                                                  Else
                                                    //Cássio Rovaroto - SIG nº 81353 - Início
                                                    //if (iIDInformeGravar <> iLinhaAcaoJudicialContribExtra) and (iIDInformeGravar <> iIdInformeContribExtra13) then //Cássio Rovaroto - SIG nº 74355
                                                    if (iIDInformeGravar <> iLinhaAcaoJudicialContribExtra) and (iIDInformeGravar <> iIdInformeContribExtra13) and not (bTemAcaoJudicial_CE)  then
                                                    //Cássio Rovaroto - SIG nº 81353 - Fim
                                                    // Gravando o IDINFORME normalmente com seus dados
                                                    _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                                End
                                              Else
                                                //Cássio Rovaroto - SIG nº 81353 - Início
                                                //if (iIDInformeGravar <> iIdInformeContribExtra) and (iIDInformeGravar <> iIdInformeContribExtra13) then //Cássio Rovaroto - SIG nº 74355
                                                if (iIDInformeGravar <> iLinhaAcaoJudicialContribExtra) and (iIDInformeGravar <> iIdInformeContribExtra13) and not (bTemAcaoJudicial_CE)  then
                                                //Cássio Rovaroto - SIG nº 81353 - Fim
                                                // Gravando o IDINFORME normalmente com seus dados
                                                _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                            End;
                                        End;
                                    End
                                  Else
                                    // ****************************************************
                                    // ************ BENEFICIÁRIO < 65 ANOS ****************  (E)
                                    // ****************************************************
                                    Begin
                                      If (bTemAcaoJudicial) Or (bTemAcaoJudicial_BUA) Or (bTemAcaoJudicial_IT) or (bTemAcaoJudicial_CE) Then
                                        Begin
                                          //
                                          //-----------------------------------
                                          // NÃO IDOSO E TEM ACAO JUDICIAL (F)
                                          //-----------------------------------
                                          //
                                          If (iIDInformeGravar = iIdInformeTRBINSS) And(sCodigoNaturezaIndiv = sCodigoNaturRendINSS) Then // 45 - Total do Rendimento Bruto INSS
                                          Begin
                                            If (dValorRendimentoINSS > 0) Then
                                            Begin
                                              // Se existir Ações Judiciais específicas, então redefine para um novo IDINFORME parametrizado
                                              If _VerificaExistenciaDoUsoDeRegras(sCPFBeneficiarioSelecionado, iIdProcJudFund, iIdPessoaProcJud, 3) Then // 3 = outros tipos de ações judiciais
                                                iIDInformeGravar := iLinhaAcaoJudicialInss; // IDINFORME = 108 ( Total Rendimento Brutos - INSS Exigibilidade Suspensa (2008) )

                                              // Gravando o IDINFORME normalmente com seus dados
                                              //_GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorRendimentoINSS, '');// Andre Imakawa - SIG 38904
                                              _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');// Andre Imakawa - SIG 38904
                                            End
                                            Else
                                              // Gravando o IDINFORME normalmente com seus dados
                                              _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                          End
                                          Else
                                          If ((iIDInformeGravar = iIdInformeTRBFUNCEF) Or (iIDInformeGravar = iIdInformeBUA)) And// Edilaine - SIG 19523
                                             ((sCodigoNaturezaIndiv = sCodigoNaturRendFUNCEF) or (sCodigoNaturezaIndiv = sCodigoNaturRendFUNCEFExt)) Then // 49 - Total Rendimento Bruto - FUNCEF   //edilaine - SIG94614
                                          Begin
                                            If (dValorRendimentoFUNCEF > 0) And
                                                //William Moreira da Silva - SIG 27868
                                                ((bTemAcaoJudicial_BUA) And (bTemRendimento_BUA)) // Edilaine - SIG 19523
                                                Or ((bTemAcaoJudicial) {And Not (bTemAcaoJudicial_BUA)}) Then //Darivaldo Alencar SIG.23797     //edilaine SIG99002
                                                //William Moreira da Silva - SIG 27868
                                            Begin
                                              // Calculando o valor da Ação Judicial
                                              dValorAcaoJud := RoundCM((dValorTotalIDINFORMEBusca * (dPercAcaoJudicial / 100)), 2);

                                                If dPercAcaoJudicial < 100 Then // se for < 100% calcula o 49
                                                Begin
                                                  // Calculando o novo valor do IDINFORME processado
                                                  dValorCalculado := dValorTotalIDINFORMEBusca - dValorAcaoJud;
                                                  // Gravando o IDINFORME 49 normalmente com este valor calculado
                                                  _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorCalculado, '');
                                                End;

                                                // Gravando o IDINFORME 168 (Total Rendimento Bruto - FUNCEF Exigb.Suspensa) com o valor da ação judicial
                                                _GravarDadosIRRF_Beneficiario(iLinhaRendAcJud, iFontePagadora, dValorAcaoJud, '');
                                            End
                                            //edilaine - SIG99002 : inicio
                                            Else If (dValorRendimentoFUNCEF > 0) then
                                            Begin
                                              // Gravando o IDINFORME normalmente com seus dados
                                              _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                            end;
                                            //edilaine - SIG99002 : fim

                                          End
                                          else
                                            //Cássio Rovaroto - SIG nº 74355 - Início
                                          //if (bTemAcaoJudicial_CE) and not (_ExisteAcaoBiTributacao(iIdResponsavelAtual, dtDataIni, dtDataFim)) then       //edilaine SIG122212
                                          if (bTemAcaoJudicial_CE) and ((bInformeAcJudEQUA) or (iIDInformeGravar = iIdInformeIRJudContribExtra)) then        //edilaine SIG122212
                                          begin
                                             if bAcaoEquaGanha then  //edilaine SIG134189
                                                _Verificando_DE_PARA(iIDInformeGravar, 3); // 3 = Acao Ganha
                                              _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '')
                                          end
                                          Else
                                            if (iIDInformeGravar <> iIdInformeContribExtra) and (iIDInformeGravar <> iIdInformeContribExtra13) then
                                            //Cássio Rovaroto - SIG nº 74355 - Fim
                                              // Gravando o IDINFORME normalmente com seus dados
                                              _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                        End
                                      Else
                                        Begin
                                          //
                                          //--------------------------------------
                                          // NÃO IDOSO E NÃO TEM ACAO JUDICIAL (G)
                                          //--------------------------------------
                                          //
                                           //edilaine SIG112212 : inicio
                                           //if (iIDInformeGravar <> iIdInformeContribExtra) and (iIDInformeGravar <> iIdInformeContribExtra13) then //Cássio Rovaroto - SIG nº 74355
                                           if (not bInformeAcJudEQUA) then           //edilaine SIG122212
                                            // Gravando o IDINFORME normalmente com seus dados
                                            _GravarDadosIRRF_Beneficiario(iIDInformeGravar, iFontePagadora, dValorTotalIDINFORMEBusca, '');
                                           //edilaine SIG112212 : fim
                                        End;
                                    End;
                                End;
                            End // Paulo / Andre - SIG26821
                          Else
                            Begin
                              // Paulo Nobre - SIG 21776 - Inicio
                              bProcComRestricao := True;
                              MostraMensagem(Format('(Ver.Folha/CPF/IdResponsavel/Nome) : %s', [inttostr(iVersaoFolha) + '/' +
                                inttostr(iIdResponsavelAtual) + '/' +
                                  CdsBeneficiariosSelecionados.fieldbyname('IDRESPONSAVEL').asString + '/' +
                                  copy(CdsBeneficiariosSelecionados.fieldbyname('NOMERESP').asString, 1, 50) +
                                  ' >>> Lançamento já existente (Fonte/Natureza/IdInforme): ' + inttostr(iFontePagadora) + '/' + sCodigoNaturezaIndiv + '/' + inttostr(iIDInformeGravar) + '. Verifique !']));
                              application.ProcessMessages;
                            End;
                          // Paulo Nobre - SIG 21776 - Fim

                        // Próximo lançamento individual do Beneficiário (Próximo IdInforme da seleção individual)
                          CdsMovIndividualIdResponsavelBUSCA.Next;

                        End;
                    End;

                  If (bFlgBenefProcessado) Then
                    Begin
                      MostraMensagem(Format('(Ver.Folha/CPF/IdResponsavel/Nome) : %s', [inttostr(iVersaoFolha) + '/' +
                        TRIM(sCPFBeneficiarioSelecionado) + '/' +
                          inttostr(iIdResponsavelAtual) + '/' +
                          copy(CdsBeneficiariosSelecionados.fieldbyname('NOMERESP').asString, 1, 50) +
                          ' >>> Processado']));
                      application.ProcessMessages;

                      bFlgBenefProcessado := False;
                    End;

                  // Processando o próximo IdResponsável do CPF
                  CdsIDResponsavelDoCPFProcessado.Next;

                End;
            End;

          // Próximo Beneficiário selecionado na Grid
          CdsBeneficiariosSelecionados.Next;
        End;

      CdsBeneficiariosSelecionados.First;

      // Paulo Nobre - SIG 30783 - inicio
      If gProgresso <> Nil Then
        gProgresso.Progress := 0;
      // Paulo Nobre - SIG 30783 - fim

      dtProcFim := Now;
      Linha();
      MostraMensagem('Término Processamento Individual : ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', dtProcFim));
      MostraMensagem('Tempo De Processamento           : ' + FormatDateTime('hh:mm:ss', dtProcFim - dtProcInicio));
      MostraMensagem('Qtd.Beneficiários Processados    : ' + inttostr(iQtdBenefProcessado));
      Linha();
      MostraMensagem('Log e Sql´s salvos em: ' + DirLogBusca);
      Linha();
      MostraMensagem('Processamento "BUSCA" Finalizado...');
      application.ProcessMessages;

      If (iQtdBenefProcessado > 0) And (bProcComRestricao = False) Then
        sMensagemProcessamento := 'Processamento da "BUSCA" finalizado com Sucesso !'
      Else If (iQtdBenefProcessado > 0) And (bProcComRestricao = True) Then
        sMensagemProcessamento := 'Processamento da "BUSCA" finalizado. Verifique as advertências no painel "Log. da Busca" !'
      Else If (iQtdBenefProcessado = 0) And (bProcComRestricao = False) Then
        Begin
          sMensagemProcessamento := 'Processamento da "BUSCA" NÃO finalizado. Verifique !';
          Result := false;
        End
      Else If (iQtdBenefProcessado = 0) And (bProcComRestricao = True) Then
        Begin
          sMensagemProcessamento := 'Processamento da "BUSCA" NÃO finalizado. Verifique as advertências no painel "Log. da Busca" !';
        End;

      bProcComRestricao := False;
    End
  Else
    Begin
      If bFaltaVlrIdoso Then
        sMensagemProcessamento := 'Valor do Idoso não está parametrizado. Verifique !'
      Else If bFaltaIdadeIdoso Then
        sMensagemProcessamento := 'Idade do Idoso não está parametrizada. Verifique !'
      Else If bfaltaParamMolestia Then
        sMensagemProcessamento := 'Linha do Informe para Moléstia Grave não está preenchida. Verifique !'
      Else If bFaltaParamMais65 Then
        sMensagemProcessamento := 'Linha do Informe para Maiores de 65 anos não está preenchida. Verifique !'
      Else If bFaltaPrograma Then
        sMensagemProcessamento := 'Tipo de Programa Previdenciário, no cadastro Global, não está preenchido. Verifique !';

      MostraMensagem(sMensagemProcessamento);

      Result := False;
    End;
End;

//
//------------ CARREGA VARIÁVEIS PÚBLICAS COM OS OUTROS DADOS ----------------//
//

Procedure TCtrlBUSCA_DIRFFolhaBeneficios._CarregaDadosIndivDoInformeProcessado;
Var sSql: String;
Begin
  dValorCalculado := 0.00;
  dValorSemIdadeIdoso := 0.00;
  dValorAcaoJud := 0.00;
  dValIRRF := 0.00;

  sDataPagamento := CdsMovIndividualIdResponsavelBUSCA.FieldByName('DATAPAGAMENTO').AsString;
  sCodigoNaturezaIndiv := trim(CdsMovIndividualIdResponsavelBUSCA.FieldByName('CODIRRFDARF').AsString);
  sFlgIRRF := CdsMovIndividualIdResponsavelBUSCA.FieldByname('FLGIRRF').AsString;
  sFlgNatureza := CdsMovIndividualIdResponsavelBUSCA.FieldByname('FLGNATUREZA').AsString;
  iFontePagadora := CdsMovIndividualIdResponsavelBUSCA.fieldbyname('FONTEPAGADORA').asInteger;
  iIdPlanoContab := CdsMovIndividualIdResponsavelBUSCA.FieldByName('PLANOCONTAB').AsInteger;
  //  iIDInformeOriginal := CdsMovIndividualIdResponsavelBUSCA.FieldByName('IDINFORME').AsInteger;  // Paulo Nobre - SIG 21776
  iIDInformeGravar := CdsMovIndividualIdResponsavelBUSCA.FieldByName('IDINFORME').AsInteger;

  // Paulo Nobre SOL 268373 PPM 1260556
  iIdPlanoPrev := CdsMovIndividualIdResponsavelBUSCA.FieldByName('IDPLANOPREV').AsInteger;
  iFlgPensaoAlim := IFF(CdsMovIndividualIdResponsavelBUSCA.FieldByName('FLGPENSAOALIM').AsInteger = 1, 0, CdsMovIndividualIdResponsavelBUSCA.FieldByName('FLGPENSAOALIM').AsInteger);
  //
  dValorIDINFORMEBaseGravar := CdsMovIndividualIdResponsavelBUSCA.fieldbyname('VALORINFO').asFloat;
  dValorTotalIDINFORMEBusca := CdsMovIndividualIdResponsavelBUSCA.fieldbyname('VALORTOTGRAVAR').asFloat;

  // Paulo Nobre SOL 268054 PPM 1245481
  iIdMotivo := 0;
  sCodigoTipoRecDes := '';
  sPlanoContaCredito := '';

  // Rotina para buscar dados especificos, pois estes ficaram fora do SELECT geral
  // devido existir mais de uma ocorrência deles para o mesma chave: Fonte, Natureza, IdInforme
  // e com isso a totalização pelo agrupamento fica prejudicada.
  // As vezes estas ocorrências são por problemas oriundos da folha e para não prejudicar a BUSCA
  // foi usado este artifico.
  sSql := 'SELECT M.IDMOTIVO, M.PLACONTAC, M.CODTIPRECDES ' + #13#10 +
    '      FROM MOV_GERALBUSCA M                                     ' + #13#10 +
    '      WHERE (M.IDHSTFOLHABENEF = ' + IntToStr(iVersaoFolha) + ')' + #13#10 +
    '            AND (M.CPFRESP = ' + QuotedStr(sCPFBeneficiarioSelecionado) + ')' + #13#10 +
    '            AND (M.IDRESPONSAVEL = ' + IntToStr(iIdResponsavelAtual) + ')' + #13#10 +
    '            AND (M.FONTEPAGADORA = ' + IntToStr(iFontePagadora) + ')' + #13#10 +
    '            AND (M.CODIRRFDARF = ' + QuotedStr(sCodigoNaturezaIndiv) + ')' + #13#10 +
    '            AND (M.IDINFORME = ' + IntToStr(iIDInformeGravar) + ')' + #13#10 +
    '            AND (M.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ')';
  CdsAux1.Data := GetDataPacket(sSql);

  iIdMotivo := CdsAux1.FieldByName('IDMOTIVO').AsInteger;
  sPlanoContaCredito := CdsAux1.FieldByName('PLACONTAC').AsString;
  sCodigoTipoRecDes := CdsAux1.FieldByName('CODTIPRECDES').AsString;
  /////////

  // Caso a folha processada seja Folha de Resgate (3223) e o Beneficiário seja Idoso, então
  // não pode ser calculado os valores de 65 anos para este Beneficiário neste tipo de Folha.
  // Ele estará isento.
  If (sCodigoNaturezaIndiv = sCodigoNaturResgate) And (bBeneficiarioIdoso) Then
    bBeneficiarioIdoso := False;
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._LocalizaParametrosParaProcessamentoBUSCA: Boolean;
Begin
  Result := True;
  dValorDescontoIdosoParam := 0.00;
  iIdadeBenefParam := 0;
  iLinhaAcima65 := 0;
  iLinhaAcima65INSS := 0;
  iLinhaRendAcJud := 0;
  iLinhaRendAcJud13 := 0;
  iLinhaAbonoAcima65 := 0;
  iLinhaAbonoAcima65INSS := 0;
  iLinhaAcaoJudicialInss := 0;
  iLinhaAcaoJudicialInss13 := 0;
  iRegraAcaoJudINSS := 0;
  iLinhaMolINSS:= 0; //Darivaldo Alencar SIG62723

  bFaltaParamMolestia := False;
  bFaltaParamMais65 := False;
  bFaltaPrograma := False;
  bFaltaIdadeIdoso := False;
  bFaltaVlrIdoso := False;

  //
  // Busca parâmetros e dados necessários ao Processamento
  //
  // Pega centro de custos padrão
  CdsAux1.Data := GetDataPacket('SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''CODCCUSTOFINAN''');
  sCodigoCentroCusto := CdsAux1.FieldByName('VALORPARAM').AsString;
  //
  // IDSITUACAO: 1 - Moléstia Grave /  2 - Isenção Retroativa
  CdsInformeDePara.Data := GetDataPacket('SELECT * FROM INFORMEDEPARA ORDER BY IDSITUACAO, IDINFORMEORIGEM ');
  //
  CdsAux1.Data := GetDataPacket('SELECT IDPROGRAMA FROM PROGRAMA WHERE FLGTIPOPROGRAMA = ''PRE'''); // Programa Previdencial
  If CdsAux1.IsEmpty Then
    Begin
      bFaltaPrograma := True;
      Result := false;
    End
  Else
    iIdPrograma := CdsAux1.FieldByName('IDPROGRAMA').AsInteger;

  // Busca parâmetros da Folha de Benefícios e linhas de dedução de dependente de abono normal e de molestia grave
  CdsParamFolha.Data := GetDataPacket('SELECT PRV.IDINFORME,' + #13#10 +
    '     INF.IDINFORMEDESTINO,' + #13#10 +
    '     NVL(PAR2.VALORPARAM,0) AS PARAMRESGATE' + #13#10 +
    'FROM PARAMFOLHA    PAR,' + #13#10 +
    '     PARAMFOLHA    PAR2, ' + #13#10 +
    '     PROVDESC      PRV, ' + #13#10 +
    '     INFORMEDEPARA INF ' + #13#10 +
    'WHERE PAR.NOMEPARAM   = ''IDRUBDEDDEPABONO'' ' + #13#10 +
    '      AND PAR.VALORPARAM  = PRV.IDPROVENTO ' + #13#10 +
    '      AND PRV.IDINFORME   = INF.IDINFORMEORIGEM(+) ' + #13#10 +
    '      AND PAR2.NOMEPARAM  = ''FLGCALCULAIRRESGATEISENTO'' ' + #13#10 +
    '      AND PAR2.IDFUNDACAO = ' + InttoStr(iEmpresa));

  // Busca parâmetros por vigência
  CdsParamIRRF.Data := GetDataPacket('SELECT * ' +
    'FROM HSTPARAMIRRF   ' +
    'WHERE DATAINIVIGENCIA = (SELECT MAX(DATAINIVIGENCIA) ' +
    '                         FROM   HSTPARAMIRRF   ' +
    '                         WHERE  DATAINIVIGENCIA <= TO_DATE(' + QuotedStr(datetostr(dtDataFim)) + ',''DD/MM/YYYY''))');

  If (trim(CdsParamIRRF.fieldbyname('IDINFORMEMOLESTIA').asString) = '') Then
    Begin
      bfaltaParamMolestia := true;
      Result := false;
    End
  Else
    Begin
      iIdMolestiagrave := CdsParamIRRF.fieldbyname('IDINFORMEMOLESTIA').AsInteger;
      iIdMolestiagraveINSS := CdsParamIRRF.fieldbyname('IDINFORMEMOLINSS').AsInteger;
    End;

  If CdsParamIRRF.fieldbyname('IDADEIDOSO').asInteger = 0 Then
    Begin
      bFaltaIdadeIdoso := True;
      Result := False;
    End
  Else
    iIdadeBenefParam := CdsParamIRRF.fieldByname('IDADEIDOSO').AsInteger;

  If (trim(CdsParamIRRF.fieldbyname('IDINFORME65ANOS').asString) = '') Then
    Begin
      bFaltaParamMais65 := True;
      Result := False;
    End
  Else
    Begin
      iLinhaAcima65 := CdsParamIRRF.fieldbyname('IDINFORME65ANOS').asInteger; // 52
      iLinhaAcima65INSS := CdsParamIRRF.fieldbyname('IDINFORME65INSS').asInteger; // 53
      iLinhaRendAcJud := CdsParamIRRF.fieldbyname('IDINFORMEACJUD').asInteger; // 168
      iLinhaRendAcJud13 := CdsParamIRRF.fieldbyname('IDINFORMEACJUD13').asInteger; // 167
      iLinhaAcaoJudicialInss := CdsParamIRRF.FieldByName('IDACAOJUDICIALINSS').asInteger; // 108
      iLinhaAcaoJudicialInss13 := CdsParamIRRF.FieldByName('IDACAOJUDICIALINSS13').asInteger; // 86
      iRegraAcaoJudINSS := CdsParamIRRF.FieldByName('IDREGRAINSS').asInteger; // 5089 - Usada na função _VerificaExistenciaDoUsoDeRegras
      iIdInformeBUA := CdsParamIRRF.FieldByName('IDEXIGIBILIDADESUSPENSA').asInteger; // 193 - Exibilidade Suspensa - BUA
      iLinhaMolINSS:= CdsParamIRRF.FieldByName('IDINFORMEMOLINSS').asInteger; //55   Darivaldo Alencar SIG62723
      //Cássio Rovaroto - SIG nº 74355 - Início
      iLinhaAcaoJudicialContribExtra := CdsParamIRRF.FieldByName('IDINFORMECONTRIBEXTRA').AsInteger;
      iLinhaAcaoJudicialContribExtra13 := CdsParamIRRF.FieldByName('IDINFORMECONTRIBEXTRA13').AsInteger;
      //Cássio Rovaroto - SIG nº 74355 - Fim
    end;
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._SelecionaIdResponsaveisDoCPFBUSCA(pCPF, pVersaoUltFolha: String): Boolean;
Var sSql: String;
Begin
  // SQL para trazer os IDRESPONSAVEIS pertencentes a um CPF
  sSql := 'SELECT  DISTINCT cpfresp, idresponsavel  ' + #13#10 +
    'FROM MOV_GERALBUSCA                                  ' + #13#10 +
    'WHERE idhstfolhabenef = ' + pVersaoUltFolha + #13#10 +
    '      AND cpfresp = ' + QuotedStr(pCPF) + #13#10 +
    'ORDER BY cpfresp, idresponsavel asc               ' + #13#10;

  CdsIDResponsavelDoCPFProcessado.Data := GetDataPacket(sSql);
  Result := Not CdsIDResponsavelDoCPFProcessado.isEmpty;
End;

//  Os campos IDINFORME e CODIRRFDARF na HistRubSal serão atualizados com as valores vindos da ProvDesc.
//  Este recurso visa evitar que estes campos fiquem sem valores na HISTRUBSAL, o que seria danoso
//  ao processamento.

Function TCtrlBUSCA_DIRFFolhaBeneficios._ObtemQtdeMesesRRA(Const pDataPagto: String; Const pIdResp: Integer): integer;
Var sSQL: String;
Begin
  Try
    {RRA = rendimentos recebidos acumuladamente}
    {Em abril de 2013 foi implementado na funcionalidade da Prévia da Folha de Benefícios, o cálculo do imposto para registros de RRA.
     Porém, para a geração dos comprovantes de informe de rendimentos, a quantidade de número de meses utilizados como base de
     cálculo dos RRA deve ser informada ao participante}

    sSQL := 'SELECT COUNT(*) QTDMESES                                   ' +
      'FROM (SELECT H.MES,                                              ' +
      '             H.IDRESPONSAVEL,                                    ' +
      '             SUM(DECODE(H.FLGDESCONTO, 0, H.VALORPROVENTO, H.VALORPROVENTO * -1)) VALOR   ' +
      '      FROM HISTRUBSAL H,                                         ' +
      '           PROVDESC PR                                           ' +
      '      WHERE H.IDRUBRICA = PR.IDPROVENTO                          ' +
      '            AND H.CODPROVDESC = PR.CODPROVDESC                   ' +
      '            AND H.CODIRRFDARF = PR.CODIRRFDARF                   ' +
      '            AND TO_CHAR(H.DATAPAGAMENTO, ''YYYY'') = ' + QuotedStr(FormatDateTime('yyyy', strtodate(pDataPagto))) +
      '            AND H.IDRESPONSAVEL = ' + IntToStr(pIdResp) +
      '            AND PR.FLGRRA = 1                                    ' +
      '      GROUP BY H.MES,                                            ' +
      '               H.IDRESPONSAVEL )                                 ' +
      'WHERE VALOR > 0                                                  ';

    CdsAux1.Data := GetDataPacket(sSQL);
    Result := CdsAux1.FieldByName('QTDMESES').AsInteger;
  Finally
    CdsAux1.Close;
  End;
End;

Procedure TCtrlBUSCA_DIRFFolhaBeneficios._AvaliaExistenciaDeAcaoJudicial(pIdResponsavel: Integer; pDataIni, pDataFim: TDateTime);
Begin
  iIdPessoaProcJud := 0;
  iIdProcJudFund := 0;

  qryVerificaExistenciaAcaoJudicial.Close;
  qryVerificaExistenciaAcaoJudicial.SQL.Text :=
    'SELECT PROCJUD.IDPESSOA,' +
    '       PROCJUD.IDPROCJUD,' +
    '       PROCJUD.DATAINICIO,' +
    '       PROCJUD.DATAFINAL,' +
    '       PROCJUD.PERCACAO ' +
    'FROM PROCJUD ' +
    'WHERE PROCJUD.IDPESSOA = :pIdResp' +

    //edilaine - SIG78589 - inicio
    {//Alteração da forma de comparação do TO_DATE, de MM/YYYY para YYYY/MM, evitando exclusão de registros.
    //William Moreira da Silva - SIG 38795
    //'      AND PROCJUD.DATAINICIO <= :pDataFinal' +                                      // André Imakawa -  SIG 19510
    //'      AND (PROCJUD.SITPROCESSO = 0                                         ' + // André Imakawa -  SIG 19510
    //'            OR (PROCJUD.SITPROCESSO = 2 AND PROCJUD.DATAFINAL > :pDataFinal)) ' + // André Imakawa -  SIG 19510
    //'      AND ((PROCJUD.DATAFINAL IS NULL) OR (PROCJUD.DATAFINAL > :pDataInicial))' +   // André Imakawa -  SIG 19510
   // Andre Imakawa - SIG 39948 - Inicio
   //' AND ( ' +
   //'  PROCJUD.SITPROCESSO = 0 ' +
   //'  OR (PROCJUD.SITPROCESSO = 2 AND PROCJUD.DATAFINAL IS NULL AND PROCJUD.DATAINICIO <= :pDataInicial) ' +
   //'  OR (PROCJUD.SITPROCESSO = 2 AND PROCJUD.DATAINICIO <= :pDataInicial AND PROCJUD.DATAFINAL >= :pDataFinal) ' +
   //'  (PROCJUD.SITPROCESSO = 0 AND TO_CHAR(PROCJUD.DATAINICIO, ''MM/YYYY'') <= TO_CHAR(:pDataInicial, ''MM/YYYY'') AND ' + //Taffarel - SIG74160
   //'  ((TO_CHAR(PROCJUD.DATAFINAL, ''MM/YYYY'') > TO_CHAR(:pDataFinal,''MM/YYYY''))  OR (TO_CHAR(PROCJUD.DATAFINAL, ''MM/YYYY'') IS NULL)) )' + //Taffarel - SIG74160
   //'  OR (PROCJUD.SITPROCESSO = 2 AND TO_CHAR(PROCJUD.DATAINICIO, ''MM/YYYY'') <= TO_CHAR(:pDataInicial, ''MM/YYYY'') AND ' + //Taffarel - SIG74160
   //'  PROCJUD.DATAFINAL > :pDataFinal) ' + // Marcelo Cardoso - SIG47457
   // Andre Imakawa - SIG 39948 - Fim
   //'  TO_CHAR(PROCJUD.DATAFINAL, ''MM/YYYY'') >= TO_CHAR(:pDataFinal,''MM/YYYY'')) ' +  // Marcelo Cardoso - SIG47457 - Adicioando ">=" para pDataFinal //Taffarel - SIG74160
   //' ) ' +
  //William Moreira da Silva - SIG 38795
   } // comentado pelo SIG78589 e reescrito

    ' AND ( ' +
    '  (PROCJUD.SITPROCESSO = 0 AND TO_CHAR(PROCJUD.DATAINICIO, ''YYYY/MM'') <= TO_CHAR(TO_DATE(:pDataInicial), ''YYYY/MM'') AND ' +
    '  ((TO_CHAR(PROCJUD.DATAFINAL, ''YYYY/MM'') > TO_CHAR(TO_DATE(:pDataFinal),''YYYY/MM''))  OR (TO_CHAR(PROCJUD.DATAFINAL, ''YYYY/MM'') IS NULL)) )' +
    '  OR (PROCJUD.SITPROCESSO = 2 AND TO_CHAR(PROCJUD.DATAINICIO, ''YYYY/MM'') <= TO_CHAR(TO_DATE(:pDataInicial), ''YYYY/MM'') AND ' +
    //'  TO_CHAR(PROCJUD.DATAFINAL, ''YYYY/MM'') >= TO_CHAR(TO_DATE(:pDataFinal),''YYYY/MM'')) ' +     //edilaine - SIG96080
    '  PROCJUD.DATAFINAL >= TO_DATE(:pDataFinal,''DD/MM/YYYY'')) ' +                                   //edilaine - SIG96080
    ' ) ' +
    //edilaine - SIG78589 - fim
    '      AND PROCJUD.PERCACAO <> 0 ' +
    '      AND EXISTS (SELECT 1 FROM DETPROCJUD D WHERE D.IDPROCJUD = PROCJUD.IDPROCJUD)    ' + //TAES - SIG96080
    //Cássio Rovaroto - SIG nº 74355 - Início
    ' AND NOT EXISTS (SELECT 1   ' +
    '                   FROM (SELECT CASE WHEN INSTR(REGRA.NOMEREGRA, ''EQUA'') <> 0 THEN 1 ' +
    '                                      ELSE 0 END AS EQUA   ' +
    '                           FROM DETPROCJUD, REGRA          ' +
    '                          WHERE REGRA.IDREGRA = DETPROCJUD.IDREGRA ' +
    '                            AND DETPROCJUD.IDPROCJUD = PROCJUD.IDPROCJUD) A ' +
    '                  WHERE A.EQUA = 1)  ';
     //Cássio Rovaroto - SIG nº 74355 - Fim

  qryVerificaExistenciaAcaoJudicial.ParamByName('pIdResp').asInteger := pIdResponsavel;
  //William Moreira da Silva - SIG 38795
  // qryVerificaExistenciaAcaoJudicial.ParamByName('pDataInicial').asDateTime := pDataIni; // André Imakawa -  SIG 19510
  qryVerificaExistenciaAcaoJudicial.ParamByName('pDataInicial').asDateTime := pDataIni;
  //William Moreira da Silva - SIG 38795

  qryVerificaExistenciaAcaoJudicial.ParamByName('pDataFinal').asDateTime := pDataFim;
  If Not qryVerificaExistenciaAcaoJudicial.Prepared Then
    qryVerificaExistenciaAcaoJudicial.Prepare;
  qryVerificaExistenciaAcaoJudicial.Open;

  bTemAcaoJudicial := (Not qryVerificaExistenciaAcaoJudicial.IsEmpty);
  dPercAcaoJudicial := qryVerificaExistenciaAcaoJudicial.FieldByName('PERCACAO').AsFloat;

  If bTemAcaoJudicial Then
    Begin
      iIdPessoaProcJud := qryVerificaExistenciaAcaoJudicial.FieldbyName('IdPessoa').asInteger;
      iIdProcJudFund := qryVerificaExistenciaAcaoJudicial.FieldbyName('IdProcJud').asInteger;

      _VerificaSituacaoProcessoEncerrado;

      If (dtDataFimProcJud = 0) Then
        Begin
          bTemAcaoJudicial := _ValidaAcaoJudicialEDataFolhaPagamento(iIdProcJudFund);
          If Not bTemAcaoJudicial Then
            Begin
              iIdPessoaProcJud := 0;
              iIdProcJudFund := 0;
            End;
        End;
    End;

  // BUA - Benefício Único Antecipado ou Renda Antecipada ou Peculio
  // Ações do BUA, é uma ação coletiva que se refere à revisão do cálculo
  // do benefício para quem sacou o BUA por ocasião do saldamento do REG/REPLAN.
  bTemAcaoJudicial_BUA := _VerificaExistenciaDoUsoDeRegras(sCPFBeneficiarioSelecionado, iIdProcJudFund, iIdPessoaProcJud, 1);

  // Verificando a existência de Regra para apuração do Cálculo de Ação Judicial do INSS (IT)
  bTemAcaoJudicial_IT := _VerificaExistenciaDoUsoDeRegras(sCPFBeneficiarioSelecionado, iIdProcJudFund, iIdPessoaProcJud, 2);
End;

Procedure TCtrlBUSCA_DIRFFolhaBeneficios._VerificaSituacaoProcessoEncerrado;
Begin
  dtDataFimProcJud := 0;
  If Not (bTemAcaoJudicial) Then
    Begin
      With TwwQuery.Create(Nil) Do
        Begin
          DatabaseName := 'BaseDados';
          close;
          sql.Clear;
          SQL.add('SELECT DATAFINAL, IDPROCJUD, IDPESSOA FROM PROCJUD WHERE IDPESSOA =:pIdResp');
          SQL.add(' AND SITPROCESSO = 2 AND (DATAFINAL IS NULL OR DATAFINAL >= :pDataFinal )  ');
          ParamByName('pIdResp').asInteger := iIdResponsavelAtual;
          ParamByName('pDataFinal').asDateTime := dtDataIni;
          Open;

          dtDataFimProcJud := FieldByName('DATAFINAL').AsDateTime;

          If (FormatDateTime('YYYY', dtDataFimProcJud) = FormatDateTime('YYYY', dtDataIni)) Then
            Begin
              bTemAcaoJudicial := (dtDataFimProcJud > 0);
              iIdPessoaProcJud := FieldByName('IDPESSOA').AsInteger;
            End
          Else
            Begin
              bTemAcaoJudicial := False;
              iIdPessoaProcJud := 0;
            End;
          Free;
        End;
    End;
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._ValidaAcaoJudicialEDataFolhaPagamento(pIdProcJud: Integer): Boolean;
Var oSql: TClientDataSet;
  oLstSql: TStringList;
  dDataEfetivacao: TDateTime;
Begin
  Result := False;
  oSql := TClientDataSet.Create(Nil);
  oLstSql := TStringList.Create;

  Try
    oLstSql.Text := 'select idhstfolhabenef,dataefetivacao' + #13#10 +
      'from hstfolhabenef' + #13#10 +
      'where idhstfolhabenef = ' + IntToStr(iVersaoFolha);
    oSql.Data := GetDataPacket(oLstSql.Text);
    dDataEfetivacao := oSql.FieldByName('DataEfetivacao').asDateTime;

    //oLstSql.Text := 'SELECT PJ.DATAFINAL ' + #13#10 +  // André Imakawa -  SIG 19510
    //William Moreira da Silva - SIG 38795
    //oLstSql.Text := 'SELECT PJ.DATAFINAL, PJ.SITPROCESSO ' + #13#10 + // André Imakawa -  SIG 19510
    oLstSql.Text := 'SELECT PJ.DATAFINAL, PJ.DATAINICIO, PJ.SITPROCESSO ' + #13#10 +
    //William Moreira da Silva - SIG 38795
    'FROM PROCJUD PJ' + #13#10 +
      'WHERE PJ.IDPESSOA = ' + IntToStr(iIdResponsavelAtual) + #13#10 +
      '      AND PJ.IDPROCJUD = ' + IntToStr(pIdProcJud) + #13#10 +
      '      AND pj.percacao <> 0 ' + #13#10;
    oSql.Data := GetDataPacket(oLstSql.Text);
    If Not oSql.isEmpty Then
      // Result := ((oSql.FieldByName('DataFinal').asDateTime > dDataEfetivacao) Or (oSql.FieldByName('DataFinal').isNull)); // André Imakawa -  SIG 19510
      //William Moreira da Silva - SIG 38795
      //Result := ((oSql.FieldByName('SITPROCESSO').AsInteger = 0) Or ((oSql.FieldByName('DataFinal').asDateTime > dDataEfetivacao) Or (oSql.FieldByName('DataFinal').isNull))); // André Imakawa -  SIG 19510
      // Andre Imakawa - SIG 39948 - Inicio
      //Result := ((oSql.FieldByName('SITPROCESSO').AsInteger = 0) Or ((oSql.FieldByName('DataFinal').asDateTime > dDataEfetivacao) and (oSql.FieldByName('DataInicio').asDateTime < dDataEfetivacao) Or (oSql.FieldByName('DataFinal').isNull)));
      Result := (((oSql.FieldByName('SITPROCESSO').AsInteger = 0) AND (oSql.FieldByName('DataInicio').asDateTime <= dDataEfetivacao) AND
                ((oSql.FieldByName('DataFinal').asDateTime > dDataEfetivacao) OR (oSql.FieldByName('DataFinal').isNull))) OR
                ((oSql.FieldByName('SITPROCESSO').AsInteger = 2) AND (oSql.FieldByName('DataInicio').asDateTime <= dDataEfetivacao) AND
                 (oSql.FieldByName('DataFinal').asDateTime > dDataEfetivacao)));
      //William Moreira da Silva - SIG 38795
      // Andre Imakawa - SIG 39948 - Fim
  Finally
    oSql.Close;
    FreeAndNil(oLstSql);
    FreeAndNil(oSql);
  End;
End;

Procedure TCtrlBUSCA_DIRFFolhaBeneficios._Verificando_DE_PARA(pIdInformeOrig, pIdSituacao: Integer);
Begin
  // Situação = 1 (Moléstia Grave) / 2 = (Isenção Retroativa) / 3 = Acao Ganha
  // Andre Imakawa - SIG 122151 - Inicio
  iIDInformeGravar := pIdInformeOrig;
  If CdsInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf([inttostr(pIdSituacao), inttostr(iIDInformeGravar)]), []) Then
    iIDInformeGravar := CdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger;
  {
  If (sCodigoNaturezaIndiv <> sCodigoNaturResgate) Then // '3223' - Resgate Prev. Comp./Mod. CD/Variavel. - Não Optante Tribut.
    Begin
      If CdsInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf([inttostr(pIdSituacao), inttostr(iIDInformeGravar)]), []) Then
        iIDInformeGravar := CdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger;
    End
  Else
    Begin
      If (CdsParamFolha.Fieldbyname('PARAMRESGATE').asInteger = 1) Then
        Begin
          If (CdsMovIndividualIdResponsavelBUSCA.FieldByName('FLGBASE').AsString = 'S') Then
            iIDInformeGravar := pIdInformeOrig
          Else
            iIDInformeGravar := iIdMolestiaGrave;
        End;
    End;
  }
  // Andre Imakawa - SIG 122151 - Fim
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._DesfazerProcessosBUSCA(
  pCPFSel: String;
  pVersaoFolha: Integer;
  pDataIni,
  pDataFim: TDateTime;
  pCodNatureza: String;
  pTemListaDeBeneficiarios: Boolean;
  pListaDeBeneficiarios: TStringList;
  pIsencao:Integer = 0): Boolean;   // Andre Imakawa - SIG 58888
Var qryAux, qryAux2, qryAux3: TwwQuery; // Paulo / Andre - SIG26821 // Andre Imakawa - SIG 58888
Begin
  Result := True;
  qryAux := TwwQuery.Create(Nil);
  qryAux.Close;
  qryAux.DatabaseName := 'BaseDados';

  qryAux2 := TwwQuery.Create(Nil); // Paulo / Andre - SIG26821
  qryAux2.Close;
  qryAux2.DatabaseName := 'BaseDados';

  qryAux3 := TwwQuery.Create(Nil); // Andre Imakawa - SIG 58888
  qryAux3.Close;	// Andre Imakawa - SIG 58888
  qryAux3.DatabaseName := 'BaseDados'; // Andre Imakawa - SIG 58888

  If pTemListaDeBeneficiarios Then
    sListaBeneficiarios := _ConverteListas(pListaDeBeneficiarios);

  //
  // Estes SQL´s abaixo foram adaptados da funcionalidade que DESFAZ A BUSCA (FdeletaFolhaMT.pas)
  //

  // 1.Verificando a existência de DARF para o lançamento          // Paulo / Andre - SIG26821
  qryAux2.Close;
  qryAux2.SQL.Clear;
  qryAux2.SQL.add('SELECT L.IDDARF FROM LANCIRRF L        ');
  qryAux2.SQL.add('WHERE                                  ');

  If pVersaoFolha <> -1 Then
    qryAux2.SQL.add('    L.IDHSTFOLHABENEF = ' + inttostr(pVersaoFolha))
  Else
    Begin
      qryAux2.SQL.add('    (L.DATAPAGAMENTO >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataIni)) + ',''dd/mm/yyyy'')');
      qryAux2.SQL.add('     AND L.DATAPAGAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataFim)) + ',''dd/mm/yyyy'')' + ')');

      If pCodNatureza <> '0000' Then
        qryAux2.Sql.Add('  AND  L.CODNATUREZA = ' + QuotedStr(pCodNatureza));

      qryAux2.SQL.add('       AND L.IDMODULORESPON = 18  ');
    End;

  If pCPFSel <> '' Then // Desfaz a folha de um determinado Baneficiário
    qryAux2.SQL.add('    AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPFSel) + ')')
  Else
    Begin
      If pTemListaDeBeneficiarios Then
        qryAux2.SQL.add('    AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE ' + CtrlFuncoesRH.QuebrarListaFiltro(1, '(NUMDOCUMENTO  ', sListaBeneficiarios, 500) + ')');
    End;

  qryAux2.SQL.add('    AND L.IDDARF IS NOT NULL  ');
  qryAux2.Open;
  If qryAux2.EOF Then
    Begin
      // Andre Imakawa - SIG 36762 - Inicio
      {
      // 2.Atualizando HISTRUBSAL com a limpeza do IDLANCIRRF      // Paulo / Andre - SIG26821
      // André Imakawa -  SOL 271190 - PPM 1362919 - Inicio
      qryAux.sql.Clear;
      qryAux.SQL.add('UPDATE /*+ INDEX(H XIE99HISTRUBSAL) */ HISTRUBSAL H               ');
      qryAux.SQL.add('SET H.IDLANCIRRF = NULL             ');
      qryAux.SQL.add('WHERE H.IDLANCIRRF IN               ');
      qryAux.SQL.add('      (SELECT /*+ INDEX(L XIE13LANCIRRF) */ L.IDLANCIRRF          ');
      qryAux.SQL.add('       FROM LANCIRRF L              ');
      qryAux.SQL.add('       WHERE                        ');

      If pVersaoFolha <> -1 Then
        qryAux.SQL.add('         L.IDHSTFOLHABENEF = ' + inttostr(pVersaoFolha))
      Else
        Begin
          qryAux.SQL.add('       (L.DATAPAGAMENTO >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataIni)) + ',''dd/mm/yyyy'')');
          qryAux.SQL.add('       AND L.DATAPAGAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataFim)) + ',''dd/mm/yyyy'')' + ')');

          If pCodNatureza <> '0000' Then
            qryAux.Sql.Add('         AND L.CODNATUREZA = ' + QuotedStr(pCodNatureza));

          qryAux.SQL.add('       AND L.IDMODULORESPON = 18  ');
        End;

      If pCPFSel <> '' Then // Desfaz a folha de um determinado Baneficiário
        qryAux.SQL.add('         AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPFSel) + ')')
      Else
        Begin
          If pTemListaDeBeneficiarios Then
            qryAux.SQL.add('     AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE ' + CtrlFuncoesRH.QuebrarListaFiltro(1, '(NUMDOCUMENTO  ', sListaBeneficiarios, 500) + ')');
        End;
      qryAux.SQL.add(' )');
      qryAux.ExecSQL;
      // André Imakawa -  SOL 271190 - PPM 1362919 - Fim
      }
      // Andre Imakawa - SIG 36762 - Fim

      // 3.Apagando os lançamentos da LANCXINFORME     // Paulo / Andre - SIG26821
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.add('DELETE FROM LANCXINFORME I            ');
      qryAux.SQL.add('WHERE I.IDLANCIRRF IN                 ');
      qryAux.SQL.add('      (SELECT /*+ INDEX(L XIE13LANCIRRF) */ L.IDLANCIRRF ');
      qryAux.SQL.add('       FROM LANCIRRF L                ');
      qryAux.SQL.add('       WHERE                          ');

      If pVersaoFolha <> -1 Then
      Begin
        qryAux.SQL.add('         L.IDHSTFOLHABENEF = ' + inttostr(pVersaoFolha));
        // Andre Imakawa - SIG 58888 - Inicio
        if pIsencao <> 0 then
        Begin
          qryAux3.Close;
          qryAux3.SQL.Clear;
          qryAux3.SQL.add('SELECT DATAPREVPAGTO' + #13#10 +
                          'FROM HSTFOLHABENEF' + #13#10 +
                          'WHERE IDHSTFOLHABENEF = '+ inttostr(pVersaoFolha));
          qryAux3.Open;

          qryAux.SQL.add('    AND EXISTS (SELECT 1' + #13#10 +
                         '                  FROM PESSOAFISICA PF' + #13#10 +
                         '                 WHERE PF.DATAMOLESTIAGRAVE <= TO_DATE(' + QuotedStr(datetostr(qryAux3.fieldbyname('DATAPREVPAGTO').asDateTime)) + ',''DD/MM/YYYY'')' + #13#10 +
                         '                   AND ((PF.DATAFIMMOLESTIA >= TO_DATE(' + QuotedStr(datetostr(qryAux3.fieldbyname('DATAPREVPAGTO').asDateTime)) + ',''DD/MM/YYYY''))' + #13#10 +
                         '                        OR (PF.DATAFIMMOLESTIA IS NULL))' + #13#10 +
                         '                   AND PF.IDPESSOA = L.IDBENEFIRRF)');
        end;
        // Andre Imakawa - SIG 58888 - Fim
      End
      Else
        Begin
          qryAux.SQL.add('       (L.DATAPAGAMENTO >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataIni)) + ',''dd/mm/yyyy'')');
          qryAux.SQL.add('       AND L.DATAPAGAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataFim)) + ',''dd/mm/yyyy'')' + ')');

          If pCodNatureza <> '0000' Then
            qryAux.Sql.Add('        AND L.CODNATUREZA = ' + QuotedStr(pCodNatureza));

          qryAux.SQL.add('       AND L.IDMODULORESPON = 18  ');
        End;

      If pCPFSel <> '' Then // Desfaz a folha de um determinado Baneficiário
        qryAux.SQL.add('         AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPFSel) + ')')
      Else
        Begin
          If pTemListaDeBeneficiarios Then
            qryAux.SQL.add('    AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE ' + CtrlFuncoesRH.QuebrarListaFiltro(1, '(NUMDOCUMENTO  ', sListaBeneficiarios, 500) + ')');
        End;
      qryAux.SQL.add(' )');
      qryAux.ExecSQL;
      If qryAux.RowsAffected > 1 Then
        Begin
          // 4.Apagando os lançamentos da LANCIRRF     // Paulo / Andre - SIG26821
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.add('DELETE FROM /*+ INDEX(L XIE13LANCIRRF) */ LANCIRRF L          ');
          qryAux.SQL.add('WHERE                   ');

          If pVersaoFolha <> -1 Then
          Begin
            qryAux.SQL.add('    L.IDHSTFOLHABENEF = ' + inttostr(pVersaoFolha));

            // Andre Imakawa - SIG 58888 - Inicio
            if pIsencao <> 0 then
            Begin
              qryAux3.Close;
              qryAux3.SQL.Clear;
              qryAux3.SQL.add('SELECT DATAPREVPAGTO' + #13#10 +
                              'FROM HSTFOLHABENEF' + #13#10 +
                              'WHERE IDHSTFOLHABENEF = '+ inttostr(pVersaoFolha));
              qryAux3.Open;

              qryAux.SQL.add('    AND EXISTS (SELECT 1' + #13#10 +
                             '                  FROM PESSOAFISICA PF' + #13#10 +
                             '                 WHERE PF.DATAMOLESTIAGRAVE <= TO_DATE(' + QuotedStr(datetostr(qryAux3.fieldbyname('DATAPREVPAGTO').asDateTime)) + ',''DD/MM/YYYY'')' + #13#10 +
                             '                   AND ((PF.DATAFIMMOLESTIA >= TO_DATE(' + QuotedStr(datetostr(qryAux3.fieldbyname('DATAPREVPAGTO').asDateTime)) + ',''DD/MM/YYYY''))' + #13#10 +
                             '                        OR (PF.DATAFIMMOLESTIA IS NULL))' + #13#10 +
                             '                   AND PF.IDPESSOA = L.IDBENEFIRRF)');
            end;
            // Andre Imakawa - SIG 58888 - Fim
          End
          Else
            Begin
              qryAux.SQL.add('    (L.DATAPAGAMENTO >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataIni)) + ',''dd/mm/yyyy'')');
              qryAux.SQL.add('     AND L.DATAPAGAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataFim)) + ',''dd/mm/yyyy'')' + ')');

              If pCodNatureza <> '0000' Then
                qryAux.Sql.Add('  AND  L.CODNATUREZA = ' + QuotedStr(pCodNatureza));

              qryAux.SQL.add('       AND L.IDMODULORESPON = 18  ');
            End;

          If pCPFSel <> '' Then // Desfaz a folha de um determinado Baneficiário
            qryAux.SQL.add('    AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPFSel) + ')')
          Else
            Begin
              If pTemListaDeBeneficiarios Then
                qryAux.SQL.add('    AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE ' + CtrlFuncoesRH.QuebrarListaFiltro(1, '(NUMDOCUMENTO  ', sListaBeneficiarios, 500) + ')');
            End;
          qryAux.ExecSQL;
        End;
    End
  Else // Paulo / Andre - SIG26821
    Result := False; // Paulo / Andre - SIG26821

  qryAux.Close;
  qryAux2.Close; // Paulo / Andre - SIG26821
  qryAux3.Close; // Andre Imakawa - SIG 58888
  FreeAndNil(qryAux);
  FreeAndNil(qryAux2); // Paulo / Andre - SIG26821
  FreeAndNil(qryAux3); // Andre Imakawa - SIG 58888
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._DesfazerProcessoCompensaOuQuitacao(pTipo, pAnoRef, pCPFSel: String; pVersaoFolha: Integer): Boolean;
Var qryAux: TwwQuery;
    sSql : String;
Begin
  Result := True;
  qryAux := TwwQuery.Create(Nil);
  qryAux.Close;
  qryAux.DatabaseName := 'BaseDados';

  //
  // Estes SQL´s abaixo foram adaptados da funcionalidade que DESFAZ A BUSCA (FdeletaFolhaMT.pas)
  //

  // Andre Imakawa - SIG 36762 - Inicio
  {
  // 1.Atualizando HISTRUBSAL com a limpeza do IDLANCIRRF        // Paulo / Andre - SIG26821
  // André Imakawa -  SOL 271190 - PPM 1362919 - Inicio
  qryAux.sql.Clear;
  qryAux.SQL.add('UPDATE /*+ INDEX(H XIE99HISTRUBSAL) */ HISTRUBSAL H               ');
  qryAux.SQL.add('SET H.IDLANCIRRF = NULL                   ');
  qryAux.SQL.add('WHERE H.IDLANCIRRF IN                     ');
  qryAux.SQL.add('      (SELECT /*+ INDEX(L XIE13LANCIRRF) */ L.IDLANCIRRF          ');
  qryAux.SQL.add('       FROM LANCIRRF L                    ');
  qryAux.SQL.add('       WHERE                              ');

  If pVersaoFolha <> -1 Then
    qryAux.SQL.add('              L.IDHSTFOLHABENEF = ' + inttostr(pVersaoFolha) + ' AND ');

  qryAux.SQL.add('              L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPFSel) + ')');
  qryAux.SQL.add('                AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + QuotedStr(pAnoRef));

  If pTipo = 'Q' Then
    qryAux.SQL.add('                AND L.FLGLANC_QUITACAOBUSCA = ''S''  ') // Lançamentos gerados pela Quitação
  Else
    qryAux.SQL.add('                AND L.FLGLANC_COMPENSABUSCA = ''S''  '); // Lançamentos gerados pelo Compensa

  qryAux.SQL.add('                AND L.IDMODULORESPON = 18  ');
  qryAux.SQL.add('      )                                   ');
  qryAux.ExecSQL;
  // André Imakawa -  SOL 271190 - PPM 1362919 - Fim
  }
  // Andre Imakawa - SIG 36762 - Fim

  // 2.Apagando os lançamentos da LANCXINFORME          // Paulo / Andre - SIG26821
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.add('DELETE FROM LANCXINFORME I                ');
  qryAux.SQL.add('WHERE I.IDLANCIRRF IN                     ');
  //edilaine - SIG80944 - inicio
  //qryAux.SQL.add('      (SELECT /*+ INDEX(L XIE13LANCIRRF) */ L.IDLANCIRRF ');
  qryAux.SQL.add('      (SELECT L.IDLANCIRRF ');
  //edilaine - SIG80944 - fim
  qryAux.SQL.add('       FROM LANCIRRF L                    ');
  qryAux.SQL.add('       WHERE                              ');

  If pVersaoFolha <> -1 Then
    qryAux.SQL.add('        L.IDHSTFOLHABENEF = ' + inttostr(pVersaoFolha) + ' AND ');

  qryAux.SQL.add('            L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPFSel) + ')');
  qryAux.SQL.add('            AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + QuotedStr(pAnoRef));

  If pTipo = 'Q' Then
    qryAux.SQL.add('     AND L.FLGLANC_QUITACAOBUSCA = ''S''  ') // Lançamentos gerados pela Quitação
  Else
    qryAux.SQL.add('     AND L.FLGLANC_COMPENSABUSCA = ''S''  '); // Lançamentos gerados pelo Compensa

  qryAux.SQL.add('       AND L.IDMODULORESPON = 18  ');
  qryAux.SQL.add('      )                                   ');
  qryAux.ExecSQL;
  If qryAux.RowsAffected > 1 Then
    Begin
      // 3.Apagando os lançamentos da LANCIRRF          // Paulo / Andre - SIG26821
      qryAux.Close;
      qryAux.SQL.Clear;
      //edilaine - SIG80944 - inicio
      //qryAux.SQL.add('DELETE FROM /*+ INDEX(L XIE13LANCIRRF) */ LANCIRRF L ');
      qryAux.SQL.add('DELETE FROM LANCIRRF L                ');
      //edilaine - SIG80944 - fim
      qryAux.SQL.add('WHERE                                          ');

      If pVersaoFolha <> -1 Then
        qryAux.SQL.add('      L.IDHSTFOLHABENEF = ' + inttostr(pVersaoFolha) + 'AND ');

      qryAux.SQL.add('      L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPFSel) + ')');
      qryAux.SQL.add('      AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + QuotedStr(pAnoRef));

      If pTipo = 'Q' Then
        qryAux.SQL.add('      AND L.FLGLANC_QUITACAOBUSCA = ''S''  ') // Lançamentos gerados pela Quitação
      Else
        qryAux.SQL.add('      AND L.FLGLANC_COMPENSABUSCA = ''S''   '); // Lançamentos gerados pelo Compensa

      qryAux.SQL.add('      AND L.IDMODULORESPON = 18  ');
      qryAux.ExecSQL;

      // Paulo Nobre - WO7147
      // Desfazer "Compensa" gerado para os Pensionistas, se for o caso
      _DesfazerLancamentosPensionista(pAnoRef,pCPFSel);

   End;

  qryAux.Close;
  FreeAndNil(qryAux);
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._VerificaExistenciaDoUsoDeRegras(Const sCPFSel: String; Const pIDProcJud, pIdResp, pTipo: Integer): Boolean;
Var oSql: TClientDataSet;
  sSQL: String;
Begin
  //William Moreira da Silva - SIG 27868
  bTemRendimento_BUA := false;
  //William Moreira da Silva - SIG 27868

  // pTipo = 1 = (BUA, Renda Antecipada e Pecúlio) / 2 = Regra IT / 3 = Outros tipos de ações
  oSql := TClientDataSet.Create(Nil);
  Try
    sSQL := 'select distinct 1 ';
    sSQL := sSQL + 'from DetProcJud ';
    sSQL := sSQL + 'where IdProcJud = ' + IntToStr(pIDProcJud);
    sSQL := sSQL + '      and IdPessoa = ' + IntToStr(pIdResp);
    If pTipo = 1 Then // Regras para apuração da BUA, Renda Antecipada e Pecúlio
      Begin
        sSQL := sSQL + ' and IdRegra in ( 25296,25297,25298,'; // BU1, BU2 E BU3
        sSQL := sSQL + '                  22323,22324,22356,'; // RA1, RA2 E RA3
        sSQL := sSQL + '                  25293,25294,25295,'; // PB1, PB2 E PB3
        sSQL := sSQL + '                  25289,25290,25291 )'; // PC1, PC2 E PC3
      End;
    If pTipo = 2 Then // Regras para apuração do Cálculo de Ação Judicial do INSS (IT)
      sSQL := sSQL + '      and IdRegra = ' + inttostr(iRegraAcaoJudINSS);
    If pTipo = 3 Then // Regras para apuração da outros tipos de ações judiciais
      sSQL := sSQL + '      and IdRegra in ( 24603, 26484 ) ';

    oSql.Data := GetDataPacket(sSQL);
    Result := Not oSql.isEmpty;
    // Possui algum das regras lançadas para o Processo
    If Result Then
      If pTipo = 1 Then // Só verifica pelas rubricas, se for BUA ou Renda Antecipada ou Pecúlio
        Begin
          // Verifica se tem as rubricas (CODPROVDESC) de BUA, Renda Antecipada e Pecúlio lançadas na folha (do mês) e no Beneficiário
          oSql.Data := GetDataPacket('SELECT /*+ INDEX(H XIE1HISTRUBSAL) */ 1    ' + #13#10 +
            'FROM HISTRUBSAL H     ' + #13#10 +
            'WHERE (H.NUMDOCUMENTO = ' + QuotedStr(sCPFSel) + ')' + #13#10 +
            '      AND (H.IDHSTFOLHABENEF = ' + IntToStr(iVersaoFolha) + ')' + #13#10 +
            '      AND (H.IDMODULO = 18)            ' + #13#10 + // Módulo Folha de Benefícios
            '      AND (NVL(H.FLGESTORNO, 0) = 0)   ' + #13#10 +
            '      AND (H.FONTEPAGADORA IN (1, 2))  ' + #13#10 +
            '      AND (H.IDLANCIRRF IS NULL)       ' + #13#10 +
            '      AND (H.IDINFORME IS NOT NULL)    ' + #13#10 +
            // Rubricas de BUA
            '      AND (H.CODPROVDESC IN (''103104'',''103204'',''124504'',''122504'',''112404'',''122604'', ' + #13#10 +
            '                             ''203104'',''203204'',''224504'',''222504'',''212404'',''222604'', ' + #13#10 +
            '                             ''303104'',''303204'',''324504'',''322504'',''312404'',''322604'', ' + #13#10 +
            '                             ''403104'',''403204'',''424504'',''422504'',''412404'',''422604'', ' + #13#10 +
            // Rubricas de Renda Antecipada
            '                             ''112304'',''112604'',''212304'',''212604'',''312304'',''312604'', ' + #13#10 +
            // Rubricas de Pecúlio
            '                             ''118504'',''218504'',''318504'',''418504'' )) ');

          //William Moreira da Silva - SIG 27868
          bTemRendimento_BUA := Not oSql.isEmpty;
          //Result := Not oSql.isEmpty;
          //William Moreira da Silva - SIG 27868
        End;
    oSql.Close;
  Finally
    FreeAndNil(oSql);
  End;
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._MontarTABTrabalhoComMovDosBeneficiarios(
  pCodigoNatureza: String;
  pVersaoFolha: Integer;
  pDtDataIni,
  pDtDataFim: TDateTime;
  pTemListaDeBeneficiarios: Boolean;
  pListaDeBeneficiarios: TStringList;
  pIsencao:Integer = 0): Boolean;  // Andre Imakawa - SIG 39921
Var qryAux, qryAux3: TwwQuery; // Andre Imakawa - SIG 58888
Begin
  //
  // Carga da tabela de trabalho. Este recurso foi usado para não ficar prendendo
  // a HISTRUBSAL no processamento da BUSCA. Só aceita a carga de uma folha por
  // processamento.
  //
  bFlgGravaSQLSomenteUmaVez := True;

  If pTemListaDeBeneficiarios Then
    sListaBeneficiarios := _ConverteListas(pListaDeBeneficiarios);

  qryAux := TwwQuery.Create(Nil);
  qryAux.DatabaseName := 'BaseDados';
  qryAux.Sql.Clear;

  qryAux3 := TwwQuery.Create(Nil); // Andre Imakawa - SIG 58888
  qryAux3.DatabaseName := 'BaseDados'; // Andre Imakawa - SIG 58888
  qryAux3.Sql.Clear; // Andre Imakawa - SIG 58888

  qryAux.Sql.Add('INSERT INTO MOV_GERALBUSCA                  ');
  qryAux.Sql.Add('SELECT SEQMOVGERALBUSCA.NEXTVAL,            ');
  qryAux.Sql.Add('    DBBUSCA.IDHSTFOLHABENEF,                ');
  qryAux.Sql.Add('    DBBUSCA.CPFRESP,                        ');
  qryAux.Sql.Add('    DBBUSCA.IDRESPONSAVEL,                  ');
  qryAux.Sql.Add('    DBBUSCA.NOMERESP,                       ');
  qryAux.Sql.Add('    DBBUSCA.FONTEPAGADORA,                  ');
  qryAux.Sql.Add('    DBBUSCA.CODIRRFDARF,                    ');
  qryAux.Sql.Add('    DBBUSCA.IDINFORME,                      ');
  qryAux.Sql.Add('    DBBUSCA.VALORSINAL,                     ');
  qryAux.Sql.Add('    DBBUSCA.VALORINFO,                      ');
  qryAux.Sql.Add('    DBBUSCA.DATANASC,                       ');
  qryAux.Sql.Add('    DBBUSCA.DATAMORTE,                      ');
  qryAux.Sql.Add('    DBBUSCA.DATAMOLESTIAGRAVE,              ');
  qryAux.Sql.Add('    DBBUSCA.DATAFIMMOLESTIA,                ');
  qryAux.Sql.Add('    DBBUSCA.DATAPAGAMENTO,                  ');
  qryAux.Sql.Add('    DBBUSCA.ISENTO_IRRF,                    ');
  qryAux.Sql.Add('    DBBUSCA.TIPO_DESCONTO,                  ');
  qryAux.Sql.Add('    DBBUSCA.FLGPENSAOALIM,                  ');
  qryAux.Sql.Add('    DBBUSCA.FLGBASE,                        ');
  qryAux.Sql.Add('    DBBUSCA.PLANOCONTAB,                    ');
  qryAux.Sql.Add('    DBBUSCA.CODTIPRECDES,                   ');
  qryAux.Sql.Add('    DBBUSCA.IDPATRO,                        ');
  qryAux.Sql.Add('    DBBUSCA.IDMODULO,                       ');
  qryAux.Sql.Add('    DBBUSCA.CODCENTRORESPON,                ');
  qryAux.Sql.Add('    DBBUSCA.QTD_IDRESP,                     ');
  qryAux.Sql.Add('    SYSDATE,                                ');
  qryAux.Sql.Add('    USER,                                   ');
  qryAux.Sql.Add('    DBBUSCA.FLGIRRF,                        ');
  qryAux.Sql.Add('    DBBUSCA.FLGNATUREZA,                    ');
  qryAux.Sql.Add('    DBBUSCA.IDMOTIVO,                       ');
  qryAux.Sql.Add('    DBBUSCA.PLACONTAC,                      ');
  qryAux.Sql.Add('    DBBUSCA.IDPLANOPREV                     ');
  //Cássio Rovaroto - SIG nº 74355 - Início
  qryAux.SQL.Add('    , DBBUSCA.IDPROCJUD                     ');
  //Cássio Rovaroto - SIG nº 74355 - Fim
  qryAux.Sql.Add('FROM (                                            ');
  qryAux.Sql.Add('SELECT TB_INDIVGERAL.IDHSTFOLHABENEF,             ');
  qryAux.Sql.Add('    TB_INDIVGERAL.CPFRESP,                        ');
  qryAux.Sql.Add('    TB_INDIVGERAL.IDRESPONSAVEL,                  ');
  qryAux.Sql.Add('    TB_INDIVGERAL.NOMERESP,                       ');
  qryAux.Sql.Add('    TB_INDIVGERAL.FONTEPAGADORA,                  ');
  qryAux.Sql.Add('    TB_INDIVGERAL.CODIRRFDARF,                    ');
  qryAux.Sql.Add('    TB_INDIVGERAL.IDINFORME,                      ');
  qryAux.Sql.Add('    TB_INDIVGERAL.VALORSINAL,                     ');
  qryAux.Sql.Add('    TB_INDIVGERAL.VALORINFO,                      ');
  qryAux.Sql.Add('    TB_INDIVGERAL.DATANASC,                       ');
  qryAux.Sql.Add('    TB_INDIVGERAL.DATAMORTE,                      ');
  qryAux.Sql.Add('    TB_INDIVGERAL.DATAMOLESTIAGRAVE,              ');
  qryAux.Sql.Add('    TB_INDIVGERAL.DATAFIMMOLESTIA,                ');
  qryAux.Sql.Add('    TB_INDIVGERAL.DATAPAGAMENTO,                  ');
  qryAux.Sql.Add('    TB_INDIVGERAL.ISENTO_IRRF,                    ');
  qryAux.Sql.Add('    TB_INDIVGERAL.TIPO_DESCONTO,                  ');
  qryAux.Sql.Add('    TB_INDIVGERAL.FLGPENSAOALIM,                  ');
  qryAux.Sql.Add('    TB_INDIVGERAL.FLGBASE,                        ');
  qryAux.Sql.Add('    TB_INDIVGERAL.PLANOCONTAB,                    ');
  qryAux.Sql.Add('    TB_INDIVGERAL.CODTIPRECDES,                   ');
  qryAux.Sql.Add('    TB_INDIVGERAL.IDPATRO,                        ');
  qryAux.Sql.Add('    TB_INDIVGERAL.IDMODULO,                       ');
  qryAux.Sql.Add('    TB_INDIVGERAL.CODCENTRORESPON,                ');
  qryAux.Sql.Add('    0 AS QTD_IDRESP,                              ');
  qryAux.Sql.Add('    TB_INDIVGERAL.FLGIRRF,                        ');
  qryAux.Sql.Add('    TB_INDIVGERAL.FLGNATUREZA,                    ');
  qryAux.Sql.Add('    TB_INDIVGERAL.IDMOTIVO,                       ');
  qryAux.Sql.Add('    TB_INDIVGERAL.PLACONTAC,                      ');
  qryAux.Sql.Add('    TB_INDIVGERAL.IDPLANOPREV                     ');
  //Cássio Rovaroto - SIG nº 74355 - Início
  qryAux.SQL.Add('    , TB_INDIVGERAL.IDPROCJUD                     ');
  //Cássio Rovaroto - SIG nº 74355 - Fim
  qryAux.Sql.Add('FROM                                              ');
  //
  //  SELECT INDIVIDUALIZADO POR CPF COM TODOS OS DADOS NECESSÁRIOS AO PROCESSAMENTO
  //
  qryAux.Sql.Add('  (SELECT H.IDHSTFOLHABENEF,                      ');
  qryAux.Sql.Add('          PE.NUMDOCUMENTO CPFRESP,                ');
  qryAux.Sql.Add('          H.IDRESPONSAVEL,                        ');
  qryAux.Sql.Add('          H.FONTEPAGADORA,                        ');
  qryAux.Sql.Add('          H.CODIRRFDARF,                          ');
  //edilaine - SIG94614 - inicio
  qryAux.Sql.Add('          H.IDINFORME,                            ');
  {//Cássio Rovaroto - SIG nº 74335 - Início
  //qryAux.Sql.Add('          H.IDINFORME,                            ');
  qryAux.Sql.Add('          CASE WHEN (NVL(TP.PROC_EQUA, 0) = 0 AND NVL(H.IDINFORME, 0) <> 0) THEN H.IDINFORME ');
  qryAux.Sql.Add('               WHEN (NVL(TP.PROC_EQUA, 0) = 0 AND NVL(H.IDINFORME, 0) = 0) THEN PD.IDINFORME ');
  qryAux.Sql.Add('             ELSE PD.IDINFORME END AS IDINFORME, ');
  }//Cássio Rovaroto - SIG nº 74335 - Fim
  //edilaine - SIG94614 - fim
  qryAux.Sql.Add('          TRANSLATE(UPPER(PE.NOME), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') AS NOMERESP, ');
  qryAux.Sql.Add('          H.DATAPAGAMENTO,                        ');
  qryAux.Sql.Add('          H.FLGPENSAOALIM,                                                     ');
  qryAux.Sql.Add('          I.FLGBASE,                                                           ');
  qryAux.Sql.Add('          I.FLGIRRF,                                                           ');
  qryAux.Sql.Add('          I.FLGNATUREZA,                                                       ');
  qryAux.Sql.Add('          H.VALORINFO,                                                         ');
  qryAux.Sql.Add('          PF.DATANASC,                                                         ');
  qryAux.Sql.Add('          PF.DATAMORTE,                                                        ');
  qryAux.Sql.Add('          PF.DATAMOLESTIAGRAVE,                                                ');
  qryAux.Sql.Add('          PF.DATAFIMMOLESTIA,                                                  ');
  qryAux.Sql.Add('          H.IDPATRO,                                                           ');
  qryAux.Sql.Add('          H.IDMODULO,                                                          ');
  qryAux.Sql.Add('          H.CODCENTRORESPON,                                                   ');
  qryAux.Sql.Add('          DECODE(NVL(H.FLGDESCONTO, 0), 0, ''N'', ''D'') AS TIPO_DESCONTO,     ');

  // Andre Imakawa - SIG 39921 - Inicio
  if pIsencao = 0 then
    qryAux.Sql.Add('          DECODE(NVL(H.FLGISENTOIRRF, 0), 0, ''N'', ''S'') AS ISENTO_IRRF,     ')
  else
    begin
      qryAux.Sql.Add('          CASE WHEN (PF.FLGISENTOIRRF = 1) AND (H.DATAPAGAMENTO >= PF.DATAMOLESTIAGRAVE AND     ');
      qryAux.Sql.Add('          (H.DATAPAGAMENTO <= PF.DATAFIMMOLESTIA OR PF.DATAFIMMOLESTIA  IS NULL)) THEN ''S'' ELSE ''N'' END ISENTO_IRRF, ');
    end;
  // Andre Imakawa - SIG 39921 - Fim

  qryAux.Sql.Add('          DECODE(H.FLGTIPODESC, ''I'', DECODE(TRIM(RX.CODTIPRECDESFAV),'''', H.CODTIPRECDES, RX.CODTIPRECDESFAV),       ');
  qryAux.Sql.Add('          DECODE(TRIM(H.CODTIPRECDES),'''', RX.CODTIPRECDES, H.CODTIPRECDES)) AS CODTIPRECDES,                          ');
  qryAux.Sql.Add('          NVL(H.IDPLANOCONTABIL, H.IDPLANOPREV) AS IDPLANOPREV,                ');
  qryAux.Sql.Add('          H.IDMOTIVO,                                                          ');
  qryAux.Sql.Add('          DECODE(PD.FLGDESCONTO, 0, NVL(H.PLACONTAD, RX.PLACONTAD), NVL(H.PLACONTAC, RX.PLACONTAC)) AS PLACONTAC,       ');
  qryAux.Sql.Add('          DECODE(H.PLANO, NULL, RX.PLANO, H.PLANO) AS PLANOCONTAB,                                                      ');
  qryAux.Sql.Add('          SUM(DECODE(H.VALORPROVENTO, 0, DECODE(H.FLGDESCONTO, 2, H.VALORINFO, H.VALORPROVENTO), H.VALORPROVENTO) *     ');
  qryAux.Sql.Add('          DECODE(I.CODDIRF, 22, DECODE(PD.FLGDESCONTO, 0, 1, -1), 16,DECODE(PD.FLGDESCONTO, 0, 1, -1), 23,              ');
  qryAux.Sql.Add('          DECODE(PD.FLGDESCONTO, 0, 1, -1), 24, DECODE(PD.FLGDESCONTO, 0, 1, -1), 25, DECODE(PD.FLGDESCONTO, 0, 1, -1), ');
  qryAux.Sql.Add('          DECODE(PD.FLGDESCONTO, 1, -1, 1))) AS VALORSINAL                                                              ');
  //Cássio Rovaroto - SIG nº 74355 - Início
  qryAux.SQL.Add('          , NVL(H.IDPROCJUD, -1) AS IDPROCJUD                                                                           ');
  //Cássio Rovaroto - SIG nº 74355 - Fim
  qryAux.Sql.Add('   FROM   HISTRUBSAL H,                                                                                                 ');
  qryAux.Sql.Add('          PROVDESC PD,                                                                                                  ');
  qryAux.Sql.Add('          INFORME I,                                                                                                    ');
  qryAux.Sql.Add('          PESSOA PE,                                                                                                    ');
  qryAux.Sql.Add('          RUBRICAXPLANO RX,                                                                                             ');
  qryAux.Sql.Add('          PESSOAFISICA  PF                                                                                              ');
  //Cássio Rovaroto - SIG nº 74355 - Início
  qryAux.Sql.Add('          , (SELECT DET.IDPROCJUD,                                                                                        ');
  qryAux.Sql.Add('         	  	    CASE WHEN INSTR(REG.NOMEREGRA, ''EQUA'') <> 0 THEN 1  ELSE 0 END AS PROC_EQUA                         ');
  qryAux.Sql.Add('             FROM DETPROCJUD DET                                                                                        ');
  qryAux.Sql.Add('             JOIN REGRA REG ON REG.IDREGRA = DET.IDREGRA                                                                ');
  qryAux.Sql.Add('            GROUP BY DET.IDPROCJUD,                                                                                     ');
  qryAux.Sql.Add('         			   CASE WHEN INSTR(REG.NOMEREGRA, ''EQUA'') <> 0 THEN 1  ELSE 0 END) TP                                   ');
  //Cássio Rovaroto - SIG nº 74355 - Fim
  qryAux.Sql.Add('   WHERE  (H.IDRUBRICA = PD.IDPROVENTO)                                                                                 ');
  //Cássio
  //qryAux.Sql.Add('          AND ((H.IDINFORME = I.IDINFORME)                                                                              ');
  qryAux.Sql.Add('          AND (PD.IDINFORME = I.IDINFORME)                                                                              ');



  qryAux.Sql.Add('          AND (H.IDRESPONSAVEL = PE.IDPESSOA)                                                                           ');
  qryAux.Sql.Add('          AND (H.IDPATRO = RX.IDPESSJUR(+))                                                                             ');
  qryAux.Sql.Add('          AND (H.IDRUBRICA = RX.IDRUBRICA(+))                                                                           ');
  qryAux.Sql.Add('          AND (H.IDPLANOPREV = RX.IDPLANOPREV(+))                                                                       ');
  qryAux.Sql.Add('          AND (H.IDRESPONSAVEL = PF.IDPESSOA)                                                                           ');

  If pVersaoFolha <> -1 Then
  Begin
    qryAux.Sql.Add('          AND (H.IDHSTFOLHABENEF = ' + inttostr(pVersaoFolha) + ')');
    // Andre Imakawa - SIG 58888 - Inicio
    if pIsencao <> 0 then
    Begin
      qryAux3.Close;
      qryAux3.SQL.Clear;
      qryAux3.SQL.add('SELECT DATAPREVPAGTO' + #13#10 +
                      'FROM HSTFOLHABENEF' + #13#10 +
                      'WHERE IDHSTFOLHABENEF = '+ inttostr(pVersaoFolha));
      qryAux3.Open;

      qryAux.SQL.add('    AND EXISTS (SELECT 1' + #13#10 +
                     '                  FROM PESSOAFISICA PF1' + #13#10 +
                     '                 WHERE PF1.DATAMOLESTIAGRAVE <= TO_DATE(' + QuotedStr(datetostr(qryAux3.fieldbyname('DATAPREVPAGTO').asDateTime)) + ',''DD/MM/YYYY'')' + #13#10 +
                     '                   AND ((PF1.DATAFIMMOLESTIA >= TO_DATE(' + QuotedStr(datetostr(qryAux3.fieldbyname('DATAPREVPAGTO').asDateTime)) + ',''DD/MM/YYYY''))' + #13#10 +
                     '                        OR (PF1.DATAFIMMOLESTIA IS NULL))' + #13#10 +
                     '                   AND PF1.IDPESSOA = H.IDRESPONSAVEL)');
    end;
    // Andre Imakawa - SIG 58888 - Fim
  End
  Else
    Begin
      qryAux.Sql.add('          AND (H.MESCOBRANCA = TO_CHAR(TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDtDataIni)) + ',''dd/mm/yyyy''), ''YYYY'') ');
      qryAux.Sql.add('          || ''/'' ||  TO_CHAR(TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDtDataFim)) + ',''dd/mm/yyyy''), ''MM'')) ');

      qryAux.Sql.Add('          AND (H.IDMODULO = 18)                                                                       '); // Módulo Folha de Benefícios

      If pCodigoNatureza <> '0000' Then
        // Se forem todas as versões, então tem que ter uma natureza informada, não podendo ser todas as naturezas
        qryAux.Sql.Add('          AND (H.CODIRRFDARF = ' + quotedstr(pCodigoNatureza) + ')');
    End;

  If pTemListaDeBeneficiarios Then
    qryAux.Sql.Add('          AND ' + CtrlFuncoesRH.QuebrarListaFiltro(1, '(H.NUMDOCUMENTO  ', sListaBeneficiarios, 500));

  qryAux.Sql.Add('          AND (NVL(H.FLGESTORNO, 0) = 0)                                                              ');
  qryAux.Sql.Add('          AND (((PD.FLGDESCONTO IN (0, 1)) AND (PD.FLGESPECIAL = 0) AND (DECODE(H.VALORPROVENTO, 0,   ');
  qryAux.Sql.Add('                 DECODE(H.FLGDESCONTO, 2, H.VALORINFO, H.VALORPROVENTO), H.VALORPROVENTO) > 0)) OR    ');
  qryAux.Sql.Add('               ((PD.FLGDESCONTO = 2) AND (PD.FLGESPECIAL <> 0)))                                      ');
  //Cássio Rovaroto - SIG nº 74355 - Início
  //qryAux.Sql.Add('          AND (H.IDINFORME IS NOT NULL)                                                               ');
  //qryAux.Sql.Add('          AND (H.IDINFORME NOT IN (164, 165))                                                         '); // ENTIDADES CONVENENTES
  qryAux.Sql.Add('          AND (NVL(PD.IDINFORME, H.IDINFORME) NOT IN (164, 165))                                      ');
  //Cássio Rovaroto - SIG nº 74355 - Fim

  qryAux.Sql.Add('          AND (H.IDINFORME IS NOT NULL)                                                               ');  //edilaine - SIG94614

  qryAux.Sql.Add('          AND (H.FONTEPAGADORA IN (1, 2))                                                             '); // FUNCEF e INSS
  qryAux.Sql.Add('          AND (H.NUMDOCUMENTO <> ''00000000000       '')                                              ');
  // Paulo Nobre - SIG 21776
  qryAux.Sql.Add('          AND H.IDHSTFOLHABENEF IS NOT NULL                                                           ');
  qryAux.Sql.Add('          AND (I.ANOVIGENCIA <= (SELECT MAX(ANOVIGENCIA) AS ANOVIGENCIA FROM INFORME WHERE  ANOVIGENCIA <= TO_CHAR(H.DATAPAGAMENTO,''yyyy''))) ');
  //Cássio Rovaroto - SIG nº 74355 - Início
  qryAux.Sql.Add('          AND H.IDPROCJUD = TP.IDPROCJUD(+)                             ');
  //Cássio Rovaroto - SIG nº 74355 - Fim
  qryAux.Sql.Add('   GROUP BY H.IDHSTFOLHABENEF,                                          ');
  qryAux.Sql.Add('          PE.NUMDOCUMENTO,                                              ');
  qryAux.Sql.Add('          H.IDRESPONSAVEL,                                              ');
  qryAux.Sql.Add('          H.FONTEPAGADORA,                                              ');
  qryAux.Sql.Add('          H.CODIRRFDARF,                                                ');
  //edilaine - SIG94614 - inicio
  qryAux.Sql.Add('          H.IDINFORME,                                                  ');
  {//Cássio Rovaroto - SIG n 74355 - Início
  //qryAux.Sql.Add('          H.IDINFORME,                                                  ');
  qryAux.Sql.Add('          CASE WHEN (NVL(TP.PROC_EQUA, 0) = 0 AND NVL(H.IDINFORME, 0) <> 0) THEN H.IDINFORME ');
  qryAux.Sql.Add('               WHEN (NVL(TP.PROC_EQUA, 0) = 0 AND NVL(H.IDINFORME, 0) = 0) THEN PD.IDINFORME ');
  qryAux.Sql.Add('               ELSE PD.IDINFORME END,                                                        ');
  }//Cássio Rovaroto - SIG n 74355 - Fim
  //edilaine - SIG94614 - fim
  qryAux.Sql.Add('          PE.NOME,                                                      ');
  qryAux.Sql.Add('          H.DATAPAGAMENTO,                                              ');
  qryAux.Sql.Add('          H.FLGPENSAOALIM,                                              ');
  qryAux.Sql.Add('          I.FLGBASE,                                                    ');
  qryAux.Sql.Add('          I.FLGIRRF,                                                    ');
  qryAux.Sql.Add('          I.FLGNATUREZA,                                                ');
  qryAux.Sql.Add('          H.VALORINFO,                                                  ');
  qryAux.Sql.Add('          PF.DATANASC,                                                  ');
  qryAux.Sql.Add('          PF.DATAMORTE,                                                 ');
  qryAux.Sql.Add('          PF.DATAMOLESTIAGRAVE,                                         ');
  qryAux.Sql.Add('          PF.DATAFIMMOLESTIA,                                           ');
  qryAux.Sql.Add('          H.IDPATRO,                                                    ');
  qryAux.Sql.Add('          H.IDMODULO,                                                   ');
  qryAux.Sql.Add('          H.CODCENTRORESPON,                                            ');
  qryAux.Sql.Add('          DECODE(NVL(H.FLGDESCONTO, 0), 0, ''N'', ''D''),               ');

  // Andre Imakawa - SIG 39921 - Inicio
  if pIsencao = 0 then
    qryAux.Sql.Add('          DECODE(NVL(H.FLGISENTOIRRF,0),0, ''N'', ''S''),               ')
  else
    begin
      qryAux.Sql.Add('          CASE WHEN (PF.FLGISENTOIRRF = 1) AND (H.DATAPAGAMENTO >= PF.DATAMOLESTIAGRAVE AND     ');
      qryAux.Sql.Add('          (H.DATAPAGAMENTO <= PF.DATAFIMMOLESTIA OR PF.DATAFIMMOLESTIA  IS NULL)) THEN ''S'' ELSE ''N'' END, ');
    end;
  // Andre Imakawa - SIG 39921 - Fim

  qryAux.Sql.Add('          DECODE(H.FLGTIPODESC, ''I'', DECODE(TRIM(RX.CODTIPRECDESFAV),'''', H.CODTIPRECDES, RX.CODTIPRECDESFAV),       ');
  qryAux.Sql.Add('          DECODE(TRIM(H.CODTIPRECDES),'''', RX.CODTIPRECDES, H.CODTIPRECDES)),                                          ');
  qryAux.Sql.Add('          NVL(H.IDPLANOCONTABIL, H.IDPLANOPREV),                              ');
  qryAux.Sql.Add('          H.IDMOTIVO,                                                         ');
  qryAux.Sql.Add('          DECODE(PD.FLGDESCONTO, 0, NVL(H.PLACONTAD, RX.PLACONTAD), NVL(H.PLACONTAC, RX.PLACONTAC)),              ');
  //Cássio Rovaroto - SIG nº 74355 - Início
  //qryAux.Sql.Add('          DECODE(H.PLANO, NULL, RX.PLANO, H.PLANO) ) TB_INDIVGERAL                                                ');
  qryAux.Sql.Add('          DECODE(H.PLANO, NULL, RX.PLANO, H.PLANO),                           ');
  qryAux.Sql.Add('          NVL(H.IDPROCJUD, -1) ) TB_INDIVGERAL                                ');
  //Cássio Rovaroto - SIG nº 74355 - Fim
  
  qryAux.Sql.Add('ORDER BY TB_INDIVGERAL.IDHSTFOLHABENEF,                                       ');
  qryAux.Sql.Add('      TB_INDIVGERAL.CPFRESP,                                                  ');
  qryAux.Sql.Add('      TB_INDIVGERAL.IDRESPONSAVEL,                                            ');
  qryAux.Sql.Add('      TB_INDIVGERAL.FONTEPAGADORA,                                            ');
  qryAux.Sql.Add('      TB_INDIVGERAL.CODIRRFDARF,                                              ');
  qryAux.Sql.Add('      TB_INDIVGERAL.IDINFORME                                                 ');
  qryAux.Sql.Add(') DBBUSCA                                                                     ');

  If bFlgGravaSQLSomenteUmaVez Then
    Begin
      qryAux.Sql.SaveToFile(DirLogBusca + '\SQL_BUSCA_MontandoTAB_TEMP.txt');
      bFlgGravaSQLSomenteUmaVez := False;
    End;

  qryAux.ExecSQL;
  Result := (qryAux.RowsAffected > 0);

  FreeAndNil(qryAux);
  FreeAndNil(qryAux3); // Andre Imakawa - SIG 58888
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._SelecionarBeneficiariosProcessamentoBUSCA(pVersaoFolha: Integer): OleVariant;
Var sSql: String;
Begin
  // Este SQL deve sempre trazer a ocorrência única de um CPF
  // pois ele será a base do loop principal do processamento
  // da BUSCA
  bFlgGravaSQLSomenteUmaVez := True;

  sSql := 'SELECT DS1.*, P.NOME AS NOMERESP, P2.NOME AS USUARIO, (ds1.idhstfolhabenef || '' - '' || h.HISTORICO) HISTORICO         ' + #13#10 +
    'FROM (                                         ' + #13#10 +
    'SELECT ''S'' MARCADO,                          ' + #13#10 +
    '    IDHSTFOLHABENEF,                           ' + #13#10 +
    '    CPFRESP,                                   ' + #13#10 +
    '    DATAPAGAMENTO,                             ' + #13#10 +
    // MAX para evitar que um dos IDRESPONSAVEIS não tenha data de nascimento e bagunce o group by
  '    MAX(DATANASC) DATANASC,                      ' + #13#10 +
    '    MAX(DATAMORTE) DATAMORTE,                  ' + #13#10 +
    '    TRGUSERINCLUSAO,                           ' + #13#10 +
    // MAX para pegar o maior IDPESSOA que será usado para trazer o último nome cadastrado
  '    MAX(IDRESPONSAVEL) IDRESPONSAVEL             ' + #13#10 +
    'FROM MOV_GERALBUSCA                            ' + #13#10;
  If pVersaoFolha <> -1 Then
    sSql := sSql + 'WHERE IDHSTFOLHABENEF  = ' + inttostr(pVersaoFolha) + #13#10;
  sSql := sSql + 'GROUP BY  ''S'',                               ' + #13#10 +
    '    IDHSTFOLHABENEF,                           ' + #13#10 +
    '    CPFRESP,                                   ' + #13#10 +
    '    DATAPAGAMENTO,                             ' + #13#10 +
    //    '    DATAMORTE,                                 ' + #13#10 +
  '    TRGUSERINCLUSAO                            ' + #13#10 +
    '      ) DS1,                                   ' + #13#10 +
    '    PESSOA P, PESSOA P2, hstfolhabenef H       ' + #13#10 +
    'WHERE DS1.CPFRESP = P.NUMDOCUMENTO             ' + #13#10 +
    '      AND DS1.IDRESPONSAVEL = P.IDPESSOA       ' + #13#10 +
    '      AND TRIM(SUBSTR(DS1.TRGUSERINCLUSAO, 3, 10)) = P2.IDPESSOA ' + #13#10 +
    '      AND DS1.idhstfolhabenef = h.idhstfolhabenef (+) ' + #13#10 +
    'ORDER BY DS1.IDHSTFOLHABENEF, DS1.CPFRESP              ';

  If bFlgGravaSQLSomenteUmaVez Then
    Begin
      sqlText.Clear;
      sqlText.add(sSql);
      sqlText.SaveToFile(DirLogBusca + '\SQL_BUSCA_BenefSelProcessamento.txt');
      bFlgGravaSQLSomenteUmaVez := False;
    End;

  Result := GetDataPacket(sSql);
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._SelecionarMovIndivIdResponsavelBUSCA(pVersaoFolha, pIdRespBusca: Integer; pCPFBeneficiarioSelecionado: String): Boolean;
Begin
  // Este SQL trará todo o movimento do CPF e IDRESPONSÁVEL,
  // isto porque podem existir um CPF com 2 ou mais IdResponsáveis
  // e cada um com seu respectivo movimento.

  // Paulo Nobre SOL 268373 PPM 1260556
  With SQLParamMovBenefIndiv Do
    Begin
      Sql.Clear;
      Sql.Add('SELECT DB1.*, DB2.TOTALRENDFUNCEF, DB3.TOTALRENDINSS  ');
      Sql.Add('FROM (                                                ');
      Sql.Add('SELECT DS1.IDHSTFOLHABENEF,                           ');
      Sql.Add('       DS1.CPFRESP,                                   ');
      Sql.Add('       DS1.IDRESPONSAVEL,                             ');
      Sql.Add('       DS1.FONTEPAGADORA,                             ');
      Sql.Add('       DS1.CODIRRFDARF,                               ');
      Sql.Add('       DS1.IDINFORME,                                 ');
      Sql.Add('       DS1.DATANASC,                                  ');
      Sql.Add('       DS1.DATAMORTE,                              ');
      Sql.Add('       DS1.DATAMOLESTIAGRAVE,                      ');
      Sql.Add('       DS1.DATAFIMMOLESTIA,                        ');
      Sql.Add('       DS1.DATAPAGAMENTO,                          ');
      Sql.Add('       DS1.ISENTO_IRRF,                            ');
      Sql.Add('       DS1.FLGPENSAOALIM,                          ');
      Sql.Add('       DS1.FLGBASE,                                ');
      Sql.Add('       DS1.FLGIRRF,                                ');
      Sql.Add('       DS1.FLGNATUREZA,                            ');
      Sql.Add('       DS1.PLANOCONTAB,                            ');
      Sql.Add('       DS1.IDPATRO,                                ');
      Sql.Add('       DS1.IDPLANOPREV,                            '); // Este campo (IDPLANOPREV) faz com que haja duplicidade de IDINFORMES
      Sql.Add('       DS1.IDMODULO,                               '); // quando existem 2 planos previdenciários para o mesmo.
      Sql.Add('       DS1.CODCENTRORESPON,                        ');
      Sql.Add('       SUM(DS1.VALORINFO) AS VALORINFO,            ');
      Sql.Add('       SUM(DS1.VALORSINAL) AS VALORTOTGRAVAR       ');
      //Cássio Rovaroto - SIG nº 74355 - Início
      SQL.Add('       , NVL(DS1.IDPROCJUD, -1) AS IDPROCJUD       ');
      //Cássio Rovaroto - SIG nº 74355 - Fim
      Sql.Add('FROM (                                             ');
      Sql.Add('SELECT /*+ INDEX(MOV_GERALBUSCA XIE1MOVGERALBUSCA) */   ');
      Sql.Add('    IDHSTFOLHABENEF,                       ');
      Sql.Add('    CPFRESP,                               ');
      Sql.Add('    IDRESPONSAVEL,                         ');
      Sql.Add('    FONTEPAGADORA,                         ');
      Sql.Add('    CODIRRFDARF,                           ');
      Sql.Add('    IDINFORME,                             ');
      Sql.Add('    DATANASC,                              ');
      Sql.Add('    DATAMORTE,                             ');
      Sql.Add('    DATAMOLESTIAGRAVE,                     ');
      Sql.Add('    DATAFIMMOLESTIA,                       ');
      Sql.Add('    DATAPAGAMENTO,                         ');
      Sql.Add('    ISENTO_IRRF,                           ');
      Sql.Add('    FLGPENSAOALIM,                         ');
      Sql.Add('    ''S'' AS FLGBASE,                      ');
      Sql.Add('    FLGIRRF,                               ');
      Sql.Add('    FLGNATUREZA,                           ');
      Sql.Add('    PLANOCONTAB,                           ');
      Sql.Add('    IDPATRO,                               ');
      Sql.Add('    IDPLANOPREV,                           ');
      Sql.Add('    IDMODULO,                              ');
      Sql.Add('    CODCENTRORESPON,                       ');
      Sql.Add('    VALORINFO,                             ');
      Sql.Add('    VALORSINAL                             ');
      //Cássio Rovaroto - SIG nº 74355 - Início
      SQL.Add('    , IDPROCJUD                            ');
      //Cássio Rovaroto - SIG nº 74355 - Fim
      Sql.Add('FROM MOV_GERALBUSCA MV ) DS1                   ');
      Sql.Add('GROUP BY DS1.IDHSTFOLHABENEF,                  ');
      Sql.Add('    DS1.CPFRESP,                               ');
      Sql.Add('    DS1.IDRESPONSAVEL,                         ');
      Sql.Add('    DS1.FONTEPAGADORA,                         ');
      Sql.Add('    DS1.CODIRRFDARF,                           ');
      Sql.Add('    DS1.IDINFORME,                             ');
      Sql.Add('    DS1.DATANASC,                              ');
      Sql.Add('    DS1.DATAMORTE,                             ');
      Sql.Add('    DS1.DATAMOLESTIAGRAVE,                     ');
      Sql.Add('    DS1.DATAFIMMOLESTIA,                       ');
      Sql.Add('    DS1.DATAPAGAMENTO,                         ');
      Sql.Add('    DS1.ISENTO_IRRF,                           ');
      Sql.Add('    DS1.FLGPENSAOALIM,                         ');
      Sql.Add('    DS1.FLGBASE,                               ');
      Sql.Add('    DS1.FLGIRRF,                               ');
      Sql.Add('    DS1.FLGNATUREZA,                           ');
      Sql.Add('    DS1.PLANOCONTAB,                           ');
      Sql.Add('    DS1.IDPATRO,                               ');
      Sql.Add('    DS1.IDPLANOPREV,                           ');
      Sql.Add('    DS1.IDMODULO,                              ');
      //Cássio Rovaroto - SIG nº 74355 - Início
      //Sql.Add('    DS1.CODCENTRORESPON ) DB1,                 ');
      SQL.Add('    DS1.CODCENTRORESPON,                       ');
      SQL.Add('    DS1.IDPROCJUD ) DB1,                       ');
      //Cássio Rovaroto - SIG nº 74355 - Fim
      Sql.Add('(SELECT M.IDHSTFOLHABENEF,                                          '); // Trazer o Total do Rendimento FUNCEF
      Sql.Add('        M.CPFRESP,                                                   ');
      //      Sql.Add('        M.IDRESPONSAVEL,                                             ');

      // Andre Imakawa - SIG 38041 - Inicio
      //Sql.Add('        SUM(M.VALORSINAL) AS TOTALRENDFUNCEF                    ');
      Sql.Add('        SUM(DECODE(ISENTO_IRRF,''S'',0, M.VALORSINAL )) AS TOTALRENDFUNCEF ');
      // Andre Imakawa - SIG 38041 - Fim

      Sql.Add(' FROM MOV_GERALBUSCA M                                              ');
      Sql.Add(' WHERE M.IDINFORME = 49                                             ');
      //      Sql.Add(' GROUP BY M.IDHSTFOLHABENEF, M.CPFRESP, M.IDRESPONSAVEL) DB2,       ');
      Sql.Add(' GROUP BY M.IDHSTFOLHABENEF, M.CPFRESP) DB2,       ');
      Sql.Add(' (SELECT M.IDHSTFOLHABENEF,                                            '); // Trazer o Total do Rendimento INSS
      Sql.Add('         M.CPFRESP,                                                    ');
      //      Sql.Add('         M.IDRESPONSAVEL,                                             ');

      // Andre Imakawa - SIG 38041 - Inicio
      //Sql.Add('         SUM(M.VALORSINAL) AS TOTALRENDINSS                      ');
      Sql.Add('         SUM(DECODE(ISENTO_IRRF,''S'',0, M.VALORSINAL )) AS TOTALRENDINSS                      ');
      // Andre Imakawa - SIG 38041 - Fim

      Sql.Add(' FROM MOV_GERALBUSCA M                                             ');
      Sql.Add(' WHERE M.IDINFORME = 45                                             ');
      //      Sql.Add(' GROUP BY M.IDHSTFOLHABENEF, M.CPFRESP, M.IDRESPONSAVEL) DB3        ');
      Sql.Add(' GROUP BY M.IDHSTFOLHABENEF, M.CPFRESP) DB3        ');
      Sql.Add('WHERE DB1.IDHSTFOLHABENEF = DB2.IDHSTFOLHABENEF (+)                            ');
      Sql.Add('      AND DB1.CPFRESP = DB2.CPFRESP             (+)                               ');
      //      Sql.Add('      AND DB1.IDRESPONSAVEL = DB2.IDRESPONSAVEL  (+)                              ');
      Sql.Add('      AND DB1.IDHSTFOLHABENEF = DB3.IDHSTFOLHABENEF (+)                           ');
      Sql.Add('      AND DB1.CPFRESP = DB3.CPFRESP                 (+)                           ');
      //      Sql.Add('      AND DB1.IDRESPONSAVEL = DB3.IDRESPONSAVEL     (+)                           ');
      Sql.Add('      AND DB1.IDHSTFOLHABENEF  = ' + inttostr(pVersaoFolha));
      Sql.Add('      AND DB1.CPFRESP = ' + quotedstr(pCPFBeneficiarioSelecionado));
      Sql.Add('      AND DB1.IDRESPONSAVEL = ' + inttostr(pIdRespBusca));
      Sql.Add('ORDER BY DB1.IDHSTFOLHABENEF,                                             ');
      Sql.Add('          DB1.CPFRESP,                                                    ');
      Sql.Add('          DB1.IDRESPONSAVEL,                                              ');
      Sql.Add('          DB1.FONTEPAGADORA,                                             ');
      Sql.Add('          DB1.CODIRRFDARF,                                                ');
      Sql.Add('          DB1.IDINFORME                                                  ');

      If Not Prepared Then
        Prepare;

      If bFlgGravaSQLSomenteUmaVez Then
        Begin
          sqlText.Clear;
          sqlText.add(Sql.text);
          sqlText.SaveToFile(DirLogBusca + '\SQL_BUSCA_BenefSelMovIndividual.txt');
          bFlgGravaSQLSomenteUmaVez := False;
        End;

      Open;
    End;

  Result := Not CdsMovIndividualIdResponsavelBUSCA.IsEmpty;
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._ConsultaMovimentoDoBeneficiario(
  Const pCPF: String;
  Const pDataIni, pDataFim: TDateTime;
  Const pVersaoFolha: Integer;
  pAnoTodo: Boolean): OleVariant;
Var sSql: String;
Begin
  bFlgGravaSQLSomenteUmaVez := True;
  sSql := 'SELECT l.idlancirrf,                                                                     ' + #13#10 +
    '            l.iddarf,                                                                          ' + #13#10 +
    '            pe.numdocumento,                                                                   ' + #13#10 +
    '            pe.nome,                                                                           ' + #13#10 +
    '            l.idbenefirrf,                                                                     ' + #13#10 +
    '            l.idhstfolhabenef,                                                                 ' + #13#10 +
    '            l.codnatureza,                                                                     ' + #13#10 +
    '            i.nomeinforme,                                                                     ' + #13#10 +
    '            i.coddirf,                                                                         ' + #13#10 +
    '            i.codinforme,                                                                      ' + #13#10 +
    '            i.flgNatureza,                                                                     ' + #13#10 +
    '            l.flgpensaoalim,                                                                   ' + #13#10 +
    '            CASE WHEN lx.FLGTIPOREG = ''N'' AND I.FLGNATUREZA = ''P'' THEN ''Pagamento''       ' + #13#10 + // N - Normal
  '                 WHEN lx.FLGTIPOREG = ''N'' AND I.FLGNATUREZA = ''N'' THEN ''Devolução''       ' + #13#10 +
    '                 WHEN lx.FLGTIPOREG = ''D'' AND I.FLGNATUREZA = ''N'' THEN ''Desconto''        ' + #13#10 + // D - Devolução
  '                 WHEN lx.FLGTIPOREG = ''D'' AND I.FLGNATUREZA = ''P'' THEN ''Reposição''       ' + #13#10 +
    '            END AS TipoMov,                                                                    ' + #13#10 +
    '            l.datapagamento,                                                                   ' + #13#10 +
    '            (l.idhstfolhabenef || '' - '' || h.HISTORICO) HISTORICO,                           ' + #13#10 +
    '            l.trgdtinclusao,                                                                   ' + #13#10 +
    '            lx.fontepagadora,                                                                  ' + #13#10 +
    '            lx.flgtiporeg,                                                                     ' + #13#10 +
    '            lx.idinforme,                                                                      ' + #13#10 +
    '            l.idmodulo,                                                                        ' + #13#10 +
    '            l.qtdmeses,                                                                        ' + #13#10 +
    '            l.idprocjud,                                                                       ' + #13#10 +
    '            decode(l.idprocjud, null, 0, pj.percacao) percacao,                                ' + #13#10 +
    '            l.datainimolgrave,                                                                 ' + #13#10 +
    '            l.datafimmolgrave,                                                                 ' + #13#10 +
    '            pj.datainicio,                                                                     ' + #13#10 +
    '            pj.datafinal,                                                                      ' + #13#10 +
    '            l.FLGLANC_QUITACAOBUSCA,                                                           ' + #13#10 +
    '            l.FLGLANC_COMPENSABUSCA,                                                           ' + #13#10 +
    '            pf.datanasc,                                                                       ' + #13#10 +
    '            pf.datamorte,                                                                      ' + #13#10 +
    '            pf.DATAMOLESTIAGRAVE as DTINIMOLGRAVE_ATUAL,                                       ' + #13#10 +
    '            pf.DATAFIMMOLESTIA as DTFIMMOLGRAVE_ATUAL,                                         ' + #13#10 +
    '            TRUNC((l.datapagamento - pf.datanasc) / 365.25) as BenefIdadeFolha,                ' + #13#10 +
    '            dp.matricula,                                                                      ' + #13#10 +
    '            trunc(lx.vlrlanc, 2) as vlrlanc,                                                   ' + #13#10 +
    '            trunc(L.vlrirrf, 2) as vlrirrf,                                                    ' + #13#10 +
    '            l.idplanoprev,                                                                     ' + #13#10 +
    '            l.idpatro,                                                                         ' + #13#10 +
    '            i.flgirrf                                                                          ' + #13#10 +
    'FROM lancirrf l                                                                                ' + #13#10 +
    '     JOIN lancxinforme lx ON l.idlancirrf = lx.idlancirrf                                      ' + #13#10 +
    '     JOIN pessoa pe ON l.idbenefirrf = pe.idpessoa                                             ' + #13#10 +
    '     JOIN hstfolhabenef h ON l.idhstfolhabenef = h.idhstfolhabenef                             ' + #13#10 +
    '     LEFT JOIN pessoafisica pf ON l.idbenefirrf = pf.idpessoa                                  ' + #13#10 +
    // Andre Imakawa - SIG 122151 - Inicio
    '     JOIN (SELECT IDINFORME, ANOVIGENCIA FROM INFORME                                          ' + #13#10 +
    '      WHERE (IDINFORME, ANOVIGENCIA) IN (SELECT IDINFORME, MAX(ANOVIGENCIA)                    ' + #13#10 +
    '            FROM INFORME WHERE  ANOVIGENCIA <= ' + QuotedStr(FormatDateTime('yyyy', pDataFim)) + #13#10 +
    '            GROUP BY IDINFORME )) INFORME_APOIO                                                ' + #13#10 +
    '     ON lx.idinforme = INFORME_APOIO.IDINFORME                                                 ' + #13#10 +
    //'     JOIN INFORME i ON lx.idinforme = i.idinforme
    '     JOIN INFORME i ON INFORME_APOIO.IDINFORME = i.idinforme and INFORME_APOIO.ANOVIGENCIA = i.anovigencia ' + #13#10 +
    // Andre Imakawa - SIG 122151 - Fim
    '     LEFT JOIN procjud pj ON l.idbenefirrf = pj.idpessoa AND pj.percacao <> 0                  ' + #13#10 +
    '          AND pj.idprocjud = l.idprocjud                                                       ' + #13#10 + //Cássio Rovaroto - SIG nº 74355 
    //'       AND ((pj.Sitprocesso = 0) OR (PJ.SITPROCESSO = 2 AND PJ.DATAFINAL > L.DATAPAGAMENTO )) ' + #13#10 + //William Santana -  SIG 19510 // Andre Imakawa - SIG 39948
    ' AND ((PJ.SITPROCESSO = 0 AND PJ.DATAINICIO <= L.DATAPAGAMENTO AND                              ' + #13#10 +  // Andre Imakawa - SIG 39948
    '       ((PJ.DATAFINAL > L.DATAPAGAMENTO) OR (PJ.DATAFINAL IS NULL))) OR                       ' + #13#10 +  // Andre Imakawa - SIG 39948
    '       (PJ.SITPROCESSO = 2 AND PJ.DATAINICIO <= L.DATAPAGAMENTO AND                             ' + #13#10 +  // Andre Imakawa - SIG 39948
    //edilaine SIG122199 : inicio
    //'       PJ.DATAFINAL > L.DATAPAGAMENTO))                                                       ' + #13#10 +  // Andre Imakawa - SIG 39948
    '       (PJ.DATAFINAL > L.DATAPAGAMENTO OR TO_CHAR(PJ.DATAFINAL, ''YYYY'') = TO_CHAR(L.DATAPAGAMENTO, ''YYYY'')) )) ' + #13#10 +
    //edilaine SIG122199 : fim
  '     LEFT JOIN depentit dp ON l.idbenefirrf = dp.idtitular AND dp.idtitular = dp.idpessoa      ' + #13#10 +
    'WHERE l.idbenefirrf IN (SELECT idpessoa FROM pessoa WHERE numdocumento = ' + QuotedStr(pCPF) + ')' + #13#10;

  If pAnoTodo Then
    sSql := sSql + '      AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + QuotedStr(FormatDateTime('yyyy', pDataFim)) + #13#10
  Else
    Begin
      If pVersaoFolha <> -1 Then
        sSql := sSql + '      AND L.IDHSTFOLHABENEF = ' + IntToStr(pVersaoFolha) + #13#10
      Else
        sSql := sSql + '      AND (L.DATAPAGAMENTO >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataIni)) + ',''dd/mm/yyyy'')' + #13#10 +
          '      AND L.DATAPAGAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', pDataFim)) + ',''dd/mm/yyyy'')' + ')' + #13#10;
    End;

  sSql := sSql + '      AND lx.vlrlanc <> 0                                                           ' + #13#10 +
    'ORDER BY l.idhstfolhabenef, l.idbenefirrf, lx.fontepagadora, lx.idinforme, l.idplanoprev, l.idlancirrf';

  If bFlgGravaSQLSomenteUmaVez Then
    Begin
      sqlText.Clear;
      sqlText.add(sSql);
      sqlText.SaveToFile(DirLogBusca + '\SQL_BUSCA_ConsultaMovBeneficiario.txt');
      bFlgGravaSQLSomenteUmaVez := False;
    End;

  Result := GetDataPacket(sSql);
End;

//William Moreira da Silva - SIG 19503 - Inicio - Função para inserção da contr´-partida da quitação em datas diferentes

Function TCtrlBUSCA_DIRFFolhaBeneficios._GravarDadosIRRF_Beneficiario_61(pIdInformeGravar, pFontePagadora: Integer; pTipoAtu: String): Boolean;
Var iLancamento: Double;
  iIdProcessoJudGravar: Integer;
  iIdBeneficiarioGravar: Integer;
  sSql: String;
  bPrimvez: Boolean;
Begin
  Result := False;
  iIdBeneficiarioGravar := iIdResponsavelAtual;

  // Se houver um Beneficiário no processo judicial, então o Beneficiário de gravação passa a ser este
  If iIdPessoaProcJud <> 0 Then
    iIdBeneficiarioGravar := iIdPessoaProcJud;

  iIdProcessoJudGravar := iIdProcJudFund;

  iLancamento := 0;

  // Rendimentos Recebidos Acumulados - RRA
  iQtdMesesRRA := 0;

  Try
    //Consulta com as inserções aqui
    With CdsAux1 Do
      Begin
        sSql := ' SELECT l.datalancamento, lx.vlrlanc, l.idhstfolhabenef ' + #13#10 +
          '  FROM lancxinforme lx, lancirrf l ' + #13#10 +
          ' WHERE IDINFORME = 61              ' + #13#10 +
          '   AND l.idbenefirrf = ' + IntToStr(iIdResponsavelAtual) + #13#10 +
          '   AND l.idlancirrf = lx.idlancirrf  ' + #13#10 +
          '   AND TO_CHAR(l.datapagamento, ''YYYY'') = ''' + IntToStr(iAno) + '''';

        Data := GetDataPacket(sSql);

        While Not EOF Do
          Begin
            iLancamento := 0;
            iVersaoFolha := FieldByName('idhstfolhabenef').AsInteger;

            // Query preparada para manter a compatibilidade com um dos parâmetros (DataInf) solicitados pela função GravaIRRF
            CdsFontePagadora.Close;
            sSql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA, FLGTIPOREG ' +
              'FROM LANCXINFORME WHERE (1 = 2)';
            CdsFontePagadora.Data := GetDataPacket(SSql);
            CdsFontePagadora.Insert;
            CdsFontePagadora.FieldByName('IDINFORME').AsInteger := pIdInformeGravar;
            CdsFontePagadora.FieldByName('VLRLANC').AsFloat := FieldByName('vlrlanc').AsFloat * -1;
            CdsFontePagadora.FieldByName('VLRLANCSINAL').AsFloat := FieldByName('vlrlanc').AsFloat * -1;
            CdsFontePagadora.FieldByName('FONTEPAGADORA').AsFloat := pFontePagadora;
            CdsFontePagadora.FieldByName('FLGTIPOREG').AsString := IFF(FieldByName('vlrlanc').AsFloat > 0, 'N', 'D');
            CdsFontePagadora.Post;
            //
            // As variáveis comentadas abaixo são p/ auxílio no caso de um debug, são as recebidas
            // na função oLancIRRF.GravaIRRF (uCtrLancIRRF.pas)
            //
            Result := oLancIRRF.GravaIRRF(
              iEmpresa, // IdPessoa
              bUsaPlanoPatro, // UsaPlanoPatro
              0, // iCodDocumento
              iEmpresa, // iEmpresaProp
              iIdBeneficiarioGravar, // iBenef
              sCodigoNaturezaIndiv, // sCodNatureza
              //sDataPagamento, // sDataLanc
              FieldByName('datalancamento').AsString,
              //dValorIDINFORMEBaseGravar, // rValBase,
              FieldByName('vlrlanc').AsFloat,
              0, // rValIRRF,   // Paulo Nobre SOL 268054 PPM 1245481
              0, // rValINSS
              0, // rValPIS
              //dValorIDINFORMEBaseGravar, // rValRef
              FieldByName('vlrlanc').AsFloat,
              0, // rPercIRRF
              0, // rValCOFINS
              0, // rValCSLL
              0, // rValPISCOFCSLL
              CdsFontePagadora.data, // DataInf
              iLancamento, // iCodLanc (Variável de retorno)
              sPlanoContaCredito, // sContaContabil
              iIdPlanoContab, // iPlano
              'S', // sFlgFolha
              iIdPlanoPrev, // iIdPlanoPrev
              iIdPatro, // iIdPatro
              iIdPrograma, // iIdPrograma
              bPrimvez, // bPrimvez
              iIdModulo, // iIdModulo
              iIdModulo, // iIdModuloRespon
              iIdMotivo, // iIdMotivo
              sCodigoCentroCusto, // sCodCentroCusto
              iVersaoFolha, // iIdVersaoFolha
              sCodigoTipoRecDes, // sCodtiprecdes
              sPlanoContaCredito, // sPlacontad
              sCodigoCentroRespon, // sCodCentroRespon
              0, // rValorDepIRRF
              0, // rValIOF
              False, // Estorno
              0, // rValISS
              True, // pbCompensa
              '', // sDataPagto
              0, // iCodGPS
              iFlgPensaoAlim, // iFlgPensaoAlim
              iIdProcessoJudGravar, // piIdProcJud
              iQtdMesesRRA // iQtdMeses
              );

            If (iLancamento > 0) And (Result) Then
              Begin
                If bFlgAcumulaContadorPorCPF Then
                  Begin
                    inc(iQtdBenefProcessado);
                    bFlgAcumulaContadorPorCPF := False;
                  End;

                bFlgBenefProcessado := True;

                // Atualizando a LANCIRRF com os dados de:
                // 1) Lançamento cuja origem foi a COMPENSAÇÃO ou QUITAÇÃO
                // 2) As Data de Inicio e Fim da Mol.Grave encintradas no cadastro tabela PESSOAFISICA
                If Not _IdentificaLancamentoGerado(pTipoAtu, sDataIniMolGrave, sDataFimMolGrave, iLancamento, dValorTotalIDINFORMEBusca) Then
                  Raise Exception.Create(messageinfo);
              End;

            next;
          End;
      End;
  Finally
    CdsFontePagadora.Close;
    CdsAux1.Close;
  End;
End;
//William Moreira da Silva - SIG 19503 - Fim

Function TCtrlBUSCA_DIRFFolhaBeneficios._GravarDadosIRRF_Beneficiario(pIdInformeGravar, pFontePagadora: Integer; pValorTotalIDINFORMEBusca: Double; pTipoAtu: String): Boolean;
Var iLancamento: Double;
  iIdProcessoJudGravar: Integer;
  iIdBeneficiarioGravar: Integer;
  sSql: String;
  bPrimvez: Boolean;
Begin
  Result := False;

  iIdBeneficiarioGravar := iIdResponsavelAtual;

  // Se houver um Beneficiário no processo judicial, então o Beneficiário de gravação passa a ser este
  If iIdPessoaProcJud <> 0 Then
    iIdBeneficiarioGravar := iIdPessoaProcJud;

  //edilaine SIG113550 : inicio
  If (iIdProcJudFund = 0) and
     (CdsMovIndividualIdResponsavelBUSCA.active) and
     (CdsMovIndividualIdResponsavelBUSCA.FieldByName('IDPROCJUD').AsInteger > 0) and
     ( not (bTemAcaoJudicial) Or (bTemAcaoJudicial_BUA) Or (bTemAcaoJudicial_IT) or (bTemAcaoJudicial_CE)) Then
    iIdProcessoJudGravar := CdsMovIndividualIdResponsavelBUSCA.FieldByName('IDPROCJUD').AsInteger
  else
    iIdProcessoJudGravar := iIdProcJudFund;
  //edilaine SIG113550 : fim

  iLancamento := 0;

  // Rendimentos Recebidos Acumulados - RRA
  iQtdMesesRRA := 0;
  If (sCodigoNaturezaIndiv = sCodigoNaturRRA) And (pValorTotalIDINFORMEBusca > 0) and (pTipoAtu = '') Then // Natureza = 1889  // Andre Imakawa - SIG 57462
    iQtdMesesRRA := _ObtemQtdeMesesRRA(sDataPagamento, iIdBeneficiarioGravar);                              // Andre Imakawa - SIG 57462

  Try

    // Query preparada para manter a compatibilidade com um dos parâmetros (DataInf) solicitados pela função GravaIRRF
    CdsFontePagadora.Close;
    sSql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA, FLGTIPOREG ' +
      'FROM LANCXINFORME WHERE (1 = 2)';
    CdsFontePagadora.Data := GetDataPacket(SSql);
    CdsFontePagadora.Insert;
    CdsFontePagadora.FieldByName('IDINFORME').AsInteger := pIdInformeGravar;
    CdsFontePagadora.FieldByName('VLRLANC').AsFloat := pValorTotalIDINFORMEBusca; // Paulo Nobre SOL 268054 PPM 1245481
    CdsFontePagadora.FieldByName('VLRLANCSINAL').AsFloat := pValorTotalIDINFORMEBusca;
    CdsFontePagadora.FieldByName('FONTEPAGADORA').AsFloat := pFontePagadora;
    CdsFontePagadora.FieldByName('FLGTIPOREG').AsString := IFF(pValorTotalIDINFORMEBusca > 0, 'N', 'D');
    CdsFontePagadora.Post;
    //
    // As variáveis comentadas abaixo são p/ auxílio no caso de um debug, são as recebidas
    // na função oLancIRRF.GravaIRRF (uCtrLancIRRF.pas)
    //
    Result := oLancIRRF.GravaIRRF(
      iEmpresa, // IdPessoa
      bUsaPlanoPatro, // UsaPlanoPatro
      0, // iCodDocumento
      iEmpresa, // iEmpresaProp
      iIdBeneficiarioGravar, // iBenef
      sCodigoNaturezaIndiv, // sCodNatureza
      sDataPagamento, // sDataLanc
      dValorIDINFORMEBaseGravar, // rValBase,
      0, // rValIRRF,   // Paulo Nobre SOL 268054 PPM 1245481
      0, // rValINSS
      0, // rValPIS
      dValorIDINFORMEBaseGravar, // rValRef
      0, // rPercIRRF
      0, // rValCOFINS
      0, // rValCSLL
      0, // rValPISCOFCSLL
      CdsFontePagadora.data, // DataInf
      iLancamento, // iCodLanc (Variável de retorno)
      sPlanoContaCredito, // sContaContabil
      iIdPlanoContab, // iPlano
      'S', // sFlgFolha
      iIdPlanoPrev, // iIdPlanoPrev
      iIdPatro, // iIdPatro
      iIdPrograma, // iIdPrograma
      bPrimvez, // bPrimvez
      iIdModulo, // iIdModulo
      iIdModulo, // iIdModuloRespon
      iIdMotivo, // iIdMotivo
      sCodigoCentroCusto, // sCodCentroCusto
      iVersaoFolha, // iIdVersaoFolha
      sCodigoTipoRecDes, // sCodtiprecdes
      sPlanoContaCredito, // sPlacontad
      sCodigoCentroRespon, // sCodCentroRespon
      0, // rValorDepIRRF
      0, // rValIOF
      False, // Estorno
      0, // rValISS
      True, // pbCompensa
      '', // sDataPagto
      0, // iCodGPS
      iFlgPensaoAlim, // iFlgPensaoAlim
      iIdProcessoJudGravar, // piIdProcJud
      iQtdMesesRRA // iQtdMeses
      );

    If (iLancamento > 0) And (Result) Then
      Begin
        If bFlgAcumulaContadorPorCPF Then
          Begin
            inc(iQtdBenefProcessado);
            bFlgAcumulaContadorPorCPF := False;
          End;

        bFlgBenefProcessado := True;

        // Atualizar a HISTRUBSAL com o IDLANCIRRF gerado
//        If Not _AtualizaHistRubSalComIdLancIrrf(iIdBeneficiarioGravar, iLancamento) Then
//          Raise Exception.Create(messageinfo);

        // Atualizando a LANCIRRF com os dados de:
        // 1) Lançamento cuja origem foi a COMPENSAÇÃO ou QUITAÇÃO
        // 2) As Data de Inicio e Fim da Mol.Grave encontradas no cadastro tabela PESSOAFISICA
        If Not _IdentificaLancamentoGerado(pTipoAtu, sDataIniMolGrave, sDataFimMolGrave, iLancamento, dValorTotalIDINFORMEBusca) Then
          Raise Exception.Create(messageinfo);
      End;
  Finally
    CdsFontePagadora.Close;
  End;
End;

{Function TCtrlBUSCA_DIRFFolhaBeneficios._AtualizaHistRubSalComIdLancIrrf(Const pIdResp: Integer; Const iLancamento: Double): Boolean;
Var sSql: TStringList;
Begin
  sSql := TStringList.Create;
  With sSql Do
    Begin
      // Ordem dos campos está respeitando o índice - XIE10HISTRUBSAL
      Add('UPDATE HISTRUBSAL H');
      Add('SET H.IDLANCIRRF = ' + FloatToStr(iLancamento));
      Add('WHERE (H.IDHSTFOLHABENEF = ' + IntToStr(iVersaoFolha) + ')');
      Add('      AND (H.IDMOTIVO <> 0) ');
      Add('      AND (H.IDRESPONSAVEL = ' + IntToStr(pIdResp) + ')');
      Add('      AND (H.DATAPAGAMENTO = ' + QuotedStr(sDataPagamento) + ')');
      Add('      AND (H.FONTEPAGADORA = ' + IntToStr(iFontePagadora) + ')');
      Add('      AND (H.IDINFORME = ' + IntToStr(iIDInformeOriginal) + ')');
      Add('      AND (H.CODIRRFDARF = ' + QuotedStr(sCodigoNaturezaIndiv) + ')');
    End;

  Result := ExecSQL(sSql.Text);
  CMDebugToFile(#13#10 + sSql.Text + #13#10);
  sSql.Clear;
  FreeAndNil(sSql);
End;}

// Atualizando LANCIRRF com dados adicionais

Function TCtrlBUSCA_DIRFFolhaBeneficios._IdentificaLancamentoGerado(pTipoAtu, pDataIniMolGrave, pDataFimMolGrave: String; pLancamento, pValorTotalIDINFORMEBusca: Double): Boolean;
Var sSql: TStringList;
Begin
  Result := False;
  sSql := TStringList.Create;
  With sSql Do
    Begin
      Add('UPDATE LANCIRRF L SET                               ');

      If pTipoAtu = '' Then // Busca Normal
        Begin
          // Paulo Nobre SOL 268054 PPM 1245481
          If sFlgIRRF = 'S' Then // Informe é de Imposto de Renda
            Begin
              If sFlgNatureza = 'P' Then // Positivo
                Add(' L.VLRIRRF = ' + OraNumero(floattostr(pValorTotalIDINFORMEBusca)) + ',')
              Else // Negativo
                Add(' L.VLRIRRF = ' + OraNumero(floattostr(pValorTotalIDINFORMEBusca * -1)) + ',');
            End;
        End;

      If pTipoAtu = 'Q' Then // Quitação
        Add(' L.FLGLANC_QUITACAOBUSCA = ''S'',                 ');

      If pTipoAtu = 'C' Then // Compensa
        Add(' L.FLGLANC_COMPENSABUSCA = ''S'',                 ');

      Add(' L.DATAINIMOLGRAVE = ' + QuotedStr(pDataIniMolGrave));
      Add(' ,L.DATAFIMMOLGRAVE = ' + QuotedStr(pDataFimMolGrave));

      Add('WHERE L.IDLANCIRRF = ' + FloatToStr(pLancamento));
    End;

  // André Imakawa - SIG 19498 - Inicio
  Try
    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;
    Result := ExecSQL(sSql.Text);
  Except
    On E: Exception Do
      dtmBaseDados.dbBaseDados.Rollback;
  End;
  If dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.Commit;
  // André Imakawa - SIG 19498 - Fim
  CMDebugToFile(#13#10 + sSql.Text + #13#10);
  sSql.Clear;
  FreeAndNil(sSql);
End;

// ---------------------------------------------------------------------------------------------
//
// ---------------------  INÍCIO DAS ROTINAS DA ISENÇÃO RETROATIVA  ----------------------------
//
// ---------------------------------------------------------------------------------------------
//
// Isenção Retroativa acorrem quando há alterações nas datas de inicio e/ou fim das isenções por
// moléstia grave e geralmente ocorrem por decisões Judiciais. Quando ocorrerem, basicamente se
// processa uma BUSCA novamente com as novas datas alteradas.

Function TCtrlBUSCA_DIRFFolhaBeneficios._AvaliarOcorrenciaDeIsencaoRetroativa(pAnoRef: String): Olevariant;
Var sSql: String;
Begin
  bFlgGravaSQLSomenteUmaVez := True;
  // SQL para trazer as datas de inicio e fim da mol.grave atuais que estão gravadas no cadastro de pessoa fisica
  sSql := 'SELECT ''S'' marcado,                                                                                          ' + #13#10 +
    '     CDS1.ano_exercicio,                                                                                             ' + #13#10 +
    '     CDS1.numdocumento,                                                                                              ' + #13#10 +
    '     CDS1.nome,                                                                                                      ' + #13#10 +
    '     CDS1.DTINIMOLGRAVE_ATUAL,                                                                                       ' + #13#10 +
    '     CDS1.DTFIMMOLGRAVE_ATUAL                                                                                        ' + #13#10 +
    'FROM                                                                                                                 ' + #13#10 +
    '(SELECT p.numdocumento,                                                                                              ' + #13#10 +
    '     TO_CHAR(l.datapagamento, ''yyyy'') ano_exercicio,                                                               ' + #13#10 +
    '     p.nome,                                                                                                         ' + #13#10 +
    '     pf.DATAMOLESTIAGRAVE DTINIMOLGRAVE_ATUAL,                                                                       ' + #13#10 +
    '     pf.DATAFIMMOLESTIA DTFIMMOLGRAVE_ATUAL                                                                          ' + #13#10 +
    'FROM lancirrf l,                                                                                                     ' + #13#10 +
    '     lancxinforme li,                                                                                                ' + #13#10 +
    '     pessoa p,                                                                                                       ' + #13#10 +
    '     pessoafisica pf                                                                                                 ' + #13#10 +
    'WHERE l.idlancirrf = li.idlancirrf                                                                                   ' + #13#10 +
    '      AND p.idpessoa = l.idbenefirrf                                                                                 ' + #13#10 +
    '      AND pf.idpessoa = l.idbenefirrf                                                                                ' + #13#10 +
    '      AND TO_CHAR(l.datapagamento, ''YYYY'') = ' + QuotedStr(pAnoRef) + #13#10 +
    '      AND l.idhstfolhabenef IN (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */ H.IDHSTFOLHABENEF  ' + #13#10 + // Folhas Normais
  '                                  FROM HSTFOLHABENEF H       ' + #13#10 +
    '                                WHERE  TRANSLATE(UPPER(H.HISTORICO), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') ' + #13#10 +
    '                                       LIKE ''% FOLHA '' || DECODE(TO_CHAR(l.datapagamento, ''MM''),                  ' + #13#10 +
    '                                                ''01'',''JANEIRO '', ''02'',''FEVEREIRO '',  ''03'',''MARCO '',       ' + #13#10 +
    '                                                ''04'',''ABRIL '', ''05'',''MAIO '', ''06'',''JUNHO '',               ' + #13#10 +
    '                                                ''07'',''JULHO '', ''08'',''AGOSTO '', ''09'',''SETEMBRO '',          ' + #13#10 +
    '                                                ''10'',''OUTUBRO '', ''11'',''NOVEMBRO '', ''12'',''DEZEMBRO '')      ' + #13#10 +
    '                                                || TO_CHAR(l.datapagamento, ''yyyy'') || ''%''                        ' + #13#10 +
    '                                       AND H.FLGTIPOFOLHA = 0 )                                                       ' + #13#10 +
    '      AND l.idmodulorespon = 18                                                                                       ' + #13#10 +
    '      AND li.vlrlanc <> 0                                                                                             ' + #13#10 +
    '      AND p.numdocumento is not null                                                                                  ' + #13#10 +

  // Paulo Nobre - SIG 30783 - inicio
  '      AND (((TRUNC(l.datainimolgrave) <> TRUNC(pf.DATAMOLESTIAGRAVE)) OR                                               ' + #13#10 +
    '           (TRUNC(l.datafimmolgrave) <> TRUNC(pf.DATAFIMMOLESTIA)))                                                   ' + #13#10 +

  //    '      And ((l.datainimolgrave <> pf.DATAMOLESTIAGRAVE) Or                                                             ' + #13#10 +
  //    '           (l.datafimmolgrave <> pf.DATAFIMMOLESTIA))                                                                 ' + #13#10 +
    // Paulo Nobre - SIG 30783 - Fim

  // Andre Imakawa - SIG 38907 - Inicio
  ' OR ((TRUNC(l.datainimolgrave) = TRUNC(pf.DATAMOLESTIAGRAVE)) OR                                                            ' + #13#10 +
  '           (TRUNC(l.datafimmolgrave) = TRUNC(pf.DATAFIMMOLESTIA)))                                                          ' + #13#10 +
  // Andre Imakawa - SIG 39921 - Inicio
  '           AND NOT EXISTS (SELECT 1                                                                                         ' + #13#10 +
  '                      FROM   LANCXINFORME LL, LANCIRRF LA                                                                   ' + #13#10 +
  '                      WHERE  LA.IDLANCIRRF = LL.IDLANCIRRF                                                                  ' + #13#10 +
  '                      AND    LA.IDBENEFIRRF = L.IDBENEFIRRF                                                                 ' + #13#10 +
  '                      AND    LA.IDHSTFOLHABENEF = L.IDHSTFOLHABENEF                                                         ' + #13#10 +
  '                      AND    LL.IDINFORME IN (54,55,133)))                                                                  ' + #13#10 +
  // Andre Imakawa - SIG 39921 - Fim
  // Andre Imakawa - SIG 38907 - Fim

  'GROUP BY TO_CHAR(l.datapagamento, ''yyyy''),                                                                          ' + #13#10 +
    '         p.numdocumento,                                                                                              ' + #13#10 +
    '         p.nome,                                                                                                      ' + #13#10 +
    '         pf.DATAMOLESTIAGRAVE,                                                                                        ' + #13#10 +
    '         pf.DATAFIMMOLESTIA  ) CDS1                                                                                   ' + #13#10 +
    'ORDER BY cds1.numdocumento                                                                                            ' + #13#10;

  If bFlgGravaSQLSomenteUmaVez Then
    Begin
      sqlText.Clear;
      sqlText.add(sSql);
      sqlText.SaveToFile(DirLogBusca + '\SQL_ISENCAO_BenefSelProcessamento.txt');
      bFlgGravaSQLSomenteUmaVez := False;
    End;

  Result := GetDataPacket(sSql);
End;

// ---------------------------------------------------------------------------------------------
//
// ---------------------  FIM DAS ROTINAS DA ISENÇÃO RETROATIVA  -------------------------------
//
// ---------------------------------------------------------------------------------------------

// ---------------------------------------------------------------------------------------------
//
// ----------------  INÍCIO DAS ROTINAS DO COMPENSA VALORES NEGATIVOS  -------------------------
//
// ---------------------------------------------------------------------------------------------
// A grosso modo, Compesar valores negativos, é uma rotina que ajustará valores devolvidos (negativos)
// devido a excesso de pagamentos ocorridos muito nos casos de falecimentos e a demora desta informação.
// Isto é necessário porque na DIRF não são aceitos lançamentos destes valores negativos, daí termos
// que realizar as compensações por abatimento e distribuição destes valores ao longo dos movimentos
// gerados de cada folha processada.
// O conceito é simples, mas a lógica de compensação que, aparentemente, poderia ser simples se
// complica devido as regrinhas de abatimentos nos IDINFORMES nas diversas folhas retroativamente
// Por causa disso tudo, esta rotina não ficou muito natural e elegante, executando um vai-e-vem danado
// e tendo a necessaidade do uso de locates e flags lógicos para controle destes fluxos.
//
// Existem SQL´s usados nas rotinas abaixo que estão somente descritos dentro dos componentes query:
// qryBenefValoresACompensarPorFolha, qryBenefValoresACompensar e qryBenefCompMovFolhasProc
//

Function TCtrlBUSCA_DIRFFolhaBeneficios._AvaliarOcorrDeBenefValoresNegativosACompensar(
  pAnoRef: String;
  pListaDeBeneficiarios: TStringList;
  pTemListaDeBeneficiarios: Boolean): OleVariant;
Var sSql: String;
Begin
  bFlgGravaSQLSomenteUmaVez := True;

  If pTemListaDeBeneficiarios Then
    sListaBeneficiarios := _ConverteListas(pListaDeBeneficiarios);

  sSql := 'SELECT ''S'' MARCADO,                                                                                                      ' + #13#10 +
    '             DS1.NUMDOCUMENTO,                                                                                                   ' + #13#10 +
    '             DS1.NOME,                                                                                                           ' + #13#10 +
    '             DS1.ANOREF,                                                                                                         ' + #13#10 +
    '             DECODE(DS2.FLGLANC_COMPENSABUSCA, NULL, ''Não'', ''Sim'') TEM_COMPENSA,                                             ' + #13#10 +
    '             DS1.IDPROCJUD,                                                                                                      ' + #13#10 +
    '             0 AS INFORME                                                                                                        ' + #13#10 +
    'FROM (SELECT T.NUMDOCUMENTO,                                                                                                     ' + #13#10 +
    '             T.NOME,                                                                                                             ' + #13#10 +
    '             TO_CHAR(T.DATAPAGAMENTO, ''YYYY'') ANOREF,                                                                          ' + #13#10 +
    '             MAX(T.IDPROCJUD) AS IDPROCJUD                                                                                       ' + #13#10 +   //edilaine - SIG81284
    '      FROM (SELECT L.IDHSTFOLHABENEF,                                                                                            ' + #13#10 +
    '                   P.NOME,                                                                                                       ' + #13#10 +
    '                   P.NUMDOCUMENTO,                                                                                               ' + #13#10 +
    '                   LI.FONTEPAGADORA,                                                                                             ' + #13#10 +
    '                   DECODE(L.CODNATUREZA, ''7416'', ''0561'', L.CODNATUREZA) AS CODNATUREZA,                                      ' + #13#10 +
    '                   LI.IDINFORME,                                                                                                 ' + #13#10 +
    '                   I.CODDIRF,                                                                                                    ' + #13#10 +
    '                   LI.FLGTIPOREG,                                                                                                ' + #13#10 +
    '                   I.FLGNATUREZA,                                                                                                ' + #13#10 +
    '                   L.DATAPAGAMENTO,                                                                                              ' + #13#10 +
    '                   MAX(L.IDPROCJUD) AS IDPROCJUD,                                                                                ' + #13#10 +  //edilaine - SIG81284
    '                   SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''01'',                                                          ' + #13#10 +
    '                                      DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC),           ' + #13#10 +
    '                                                             LI.VLRLANC),0)) AS JAN1,                                            ' + #13#10 +
    '                   SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''02'',                                                          ' + #13#10 +
    '                                      DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC),           ' + #13#10 +
    '                                                             LI.VLRLANC),0)) AS FEV1,                                            ' + #13#10 +
    '                   SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''03'',                                                          ' + #13#10 +
    '                                      DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC),           ' + #13#10 +
    '                                                             LI.VLRLANC),0)) AS MAR1,                                            ' + #13#10 +
    '                   SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''04'',                                                          ' + #13#10 +
    '                                      DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC),           ' + #13#10 +
    '                                                             LI.VLRLANC),0)) AS ABR1,                                            ' + #13#10 +
    '                   SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''05'',                                                          ' + #13#10 +
    '                                      DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC),           ' + #13#10 +
    '                                                             LI.VLRLANC),0)) AS MAI1,                                            ' + #13#10 +
    '                   SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''06'',                                                          ' + #13#10 +
    '                                      DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC),           ' + #13#10 +
    '                                                             LI.VLRLANC),0)) AS JUN1,                                            ' + #13#10 +
    '                   SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''07'',                                                          ' + #13#10 +
    '                                      DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC),           ' + #13#10 +
    '                                                             LI.VLRLANC),0)) AS JUL1,                                            ' + #13#10 +
    '                   SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''08'',                                                          ' + #13#10 +
    '                                      DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC),           ' + #13#10 +
    '                                                             LI.VLRLANC),0)) AS AGO1,                                            ' + #13#10 +
    '                   SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''09'',                                                          ' + #13#10 +
    '                                      DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC),           ' + #13#10 +
    '                                                             LI.VLRLANC),0)) AS SET1,                                            ' + #13#10 +
    '                   SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''10'',                                                          ' + #13#10 +
    '                                      DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC),           ' + #13#10 +
    '                                                             LI.VLRLANC),0)) AS OUT1,                                            ' + #13#10 +
    '                   SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''11'',                                                          ' + #13#10 +
    '                                      DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC),           ' + #13#10 +
    '                                                             LI.VLRLANC),0)) AS NOV1,                                            ' + #13#10 +
    '                   SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''12'',                                                          ' + #13#10 +
    '                                      DECODE(I.CODDIRF,''2'' , DECODE(I.FLGNATUREZA,''N'',LI.VLRLANC * -1,LI.VLRLANC),           ' + #13#10 +
    '                                                             LI.VLRLANC),0)) AS DEZ1                                             ' + #13#10 +
    '            FROM LANCIRRF       L,                                                                                               ' + #13#10 +
    '                 LANCXINFORME   LI,                                                                                              ' + #13#10 +
    '                 INFORME        I,                                                                                               ' + #13#10 +
    '                 PESSOA         P                                                                                                ' + #13#10 +
    '            WHERE LI.IDLANCIRRF = L.IDLANCIRRF                                                                                   ' + #13#10 +
    '                  AND I.IDINFORME = LI.IDINFORME                                                                                 ' + #13#10 +
    '                  AND P.IDPESSOA = L.IDBENEFIRRF                                                                                 ' + #13#10 +
    '                  AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + QuotedStr(pAnoRef) + #13#10;

  If pTemListaDeBeneficiarios Then
    sSql := sSql + '                  AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE ' + CtrlFuncoesRH.QuebrarListaFiltro(1, '(NUMDOCUMENTO  ', sListaBeneficiarios, 500) + ')' + #13#10;

  sSql := sSql + '                  AND (L.IDHSTFOLHABENEF IN (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */ H.IDHSTFOLHABENEF               ' + #13#10 +
    '                                                         FROM HSTFOLHABENEF H       ' + #13#10 +
    '                                                         WHERE  TRANSLATE(UPPER(H.HISTORICO), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') ' + #13#10 +
    '                                                LIKE ''% FOLHA '' || DECODE(TO_CHAR(l.datapagamento, ''MM''),                    ' + #13#10 +
    '                                                ''01'',''JANEIRO '', ''02'',''FEVEREIRO '',  ''03'',''MARCO '',                  ' + #13#10 +
    '                                                ''04'',''ABRIL '', ''05'',''MAIO '', ''06'',''JUNHO '',                          ' + #13#10 +
    '                                                ''07'',''JULHO '', ''08'',''AGOSTO '', ''09'',''SETEMBRO '',                     ' + #13#10 +
    '                                                ''10'',''OUTUBRO '', ''11'',''NOVEMBRO '', ''12'',''DEZEMBRO '')                 ' + #13#10 +
    '                                                || TO_CHAR(l.datapagamento, ''yyyy'') || ''%''                                   ' + #13#10 +
    '                                                                AND H.FLGTIPOFOLHA = 0 )                                         ' + #13#10 +
    // Andre Imakawa - SIG 35321 - SIG 36080 - Inicio
    '                                     OR                                                                                          ' + #13#10 +
    '                                   (L.IDHSTFOLHABENEF IN (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */ H.IDHSTFOLHABENEF              ' + #13#10 +
    '                                                         FROM HSTFOLHABENEF H                                                    ' + #13#10 +
    '                                                         WHERE  TRANSLATE(UPPER(H.HISTORICO), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') ' + #13#10 +
    '                                                LIKE ''%RESGATE%''                                                             ' + #13#10 +
    '                                                AND TO_NUMBER(TO_CHAR(DATAEFETIVACAO,''YYYY'')) = ' + QuotedStr(pAnoRef) + ')) ' + #13#10 +
    '                                     OR                                                                                          ' + #13#10 +
    '                                   (L.IDHSTFOLHABENEF IN (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */ H.IDHSTFOLHABENEF              ' + #13#10 +
    '                                                         FROM HSTFOLHABENEF H                                                    ' + #13#10 +
    '                                                         WHERE  TRANSLATE(UPPER(H.HISTORICO), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') ' + #13#10 +
    '                                                LIKE ''%COMPLEMENTAR%''                                                             ' + #13#10 +
    '                                                AND TO_NUMBER(TO_CHAR(DATAEFETIVACAO,''YYYY'')) = ' + QuotedStr(pAnoRef) + ')) ' + #13#10 +
    '                                     OR                                                                                          ' + #13#10 +
    '                                   (L.IDHSTFOLHABENEF IN (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */ H.IDHSTFOLHABENEF              ' + #13#10 +
    '                                                         FROM HSTFOLHABENEF H                                                    ' + #13#10 +
    '                                                         WHERE  TRANSLATE(UPPER(H.HISTORICO), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') ' + #13#10 +
    '                                                LIKE ''%EXTRA%''                                                             ' + #13#10 +
    '                                                AND TO_NUMBER(TO_CHAR(DATAEFETIVACAO,''YYYY'')) = ' + QuotedStr(pAnoRef) + '))) ' + #13#10 +

    // Andre Imakawa - SIG 35321 - SIG 36080 - Fim
    '                  AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 18)                                                                   ' + #13#10 +
    '                  AND LI.FLGAGRUPADO IS NULL                                                                                     ' + #13#10 +
    '                  AND I.IDINFORME IN (select idinforme from informe where flgusadobuscacompensa = ''S'')                         ' + #13#10 +
    '                  AND LI.VLRLANC <> 0                                                                                            ' + #13#10 +
    '                  AND L.FLGLANC_COMPENSABUSCA IS NULL                                                                            ' + #13#10 +
    '                  AND L.FLGLANC_QUITACAOBUSCA IS NULL                                                                            ' + #13#10 +
    '            GROUP BY L.IDHSTFOLHABENEF,                                                                                          ' + #13#10 +
    '                   P.NOME,                                                                                                       ' + #13#10 +
    '                   P.NUMDOCUMENTO,                                                                                               ' + #13#10 +
    '                   LI.FONTEPAGADORA,                                                                                             ' + #13#10 +
    '                   DECODE(L.CODNATUREZA, ''7416'', ''0561'', L.CODNATUREZA),                                                     ' + #13#10 +
    '                   LI.IDINFORME,                                                                                                 ' + #13#10 +
    '                   I.CODDIRF,                                                                                                    ' + #13#10 +
    '                   LI.FLGTIPOREG,                                                                                                ' + #13#10 +
    '                   I.FLGNATUREZA,                                                                                                ' + #13#10 +
    '                   L.DATAPAGAMENTO                                                                                               ' + #13#10 +
    '                   /*,L.IDPROCJUD*/) T                                                                                           ' + #13#10 +   //edilaine - SIG81284
    '     WHERE ((T.JAN1 + T.FEV1 + T.MAR1 + T.ABR1 + T.MAI1 + T.JUN1 +  T.JUL1 + T.AGO1 + T.SET1 + T.OUT1 + T.NOV1 + T.DEZ1) < 0)    ' + #13#10 +
    '           AND (T.FLGTIPOREG, T.FLGNATUREZA) IN ((''D'',''P''),(''N'',''N''))                                                    ' + #13#10 +
    '     GROUP BY ''S'', T.NUMDOCUMENTO, T.NOME, TO_CHAR(T.DATAPAGAMENTO, ''YYYY'') /*,  T.IDPROCJUD*/) DS1,                         ' + #13#10 +   //edilaine - SIG81284
    '                                                                                                                                 ' + #13#10 +
    // SQL para trazer uma flag que indica a existência ou não dos IdInformes de Compena (gravados)
  '     (SELECT PE.NUMDOCUMENTO, l.FLGLANC_COMPENSABUSCA                                                                              ' + #13#10 +
    '      FROM lancirrf l                                                                                                            ' + #13#10 +
    '           JOIN lancxinforme lx ON l.idlancirrf = lx.idlancirrf                                                                  ' + #13#10 +
    '           JOIN pessoa pe ON l.idbenefirrf = pe.idpessoa                                                                         ' + #13#10 +
    '           JOIN INFORME i ON lx.idinforme = i.idinforme                                                                          ' + #13#10 +
    '      WHERE TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + QuotedStr(pAnoRef) + #13#10;

  If pTemListaDeBeneficiarios Then
    sSql := sSql + '            AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE ' + CtrlFuncoesRH.QuebrarListaFiltro(1, '(NUMDOCUMENTO  ', sListaBeneficiarios, 500) + ')' + #13#10;

  sSql := sSql + '            AND (L.IDHSTFOLHABENEF IN (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */ H.IDHSTFOLHABENEF                     ' + #13#10 + // Folhas Normais
  '                                  FROM HSTFOLHABENEF H       ' + #13#10 +
    '                                WHERE  TRANSLATE(UPPER(H.HISTORICO), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') ' + #13#10 +
    '                                       LIKE ''% FOLHA '' || DECODE(TO_CHAR(l.datapagamento, ''MM''),                             ' + #13#10 +
    '                                                ''01'',''JANEIRO '', ''02'',''FEVEREIRO '',  ''03'',''MARCO '',                  ' + #13#10 +
    '                                                ''04'',''ABRIL '', ''05'',''MAIO '', ''06'',''JUNHO '',                          ' + #13#10 +
    '                                                ''07'',''JULHO '', ''08'',''AGOSTO '', ''09'',''SETEMBRO '',                     ' + #13#10 +
    '                                                ''10'',''OUTUBRO '', ''11'',''NOVEMBRO '', ''12'',''DEZEMBRO '')                 ' + #13#10 +
    '                                                || TO_CHAR(l.datapagamento, ''yyyy'') || ''%''                                   ' + #13#10 +
    '                                       AND H.FLGTIPOFOLHA = 0 )                                                                  ' + #13#10 +
    // Andre Imakawa - SIG 35321 - SIG 36080 - Inicio
    '                                     OR                                                                                          ' + #13#10 +
    '                                   (L.IDHSTFOLHABENEF IN (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */ H.IDHSTFOLHABENEF              ' + #13#10 +
    '                                                         FROM HSTFOLHABENEF H                                                    ' + #13#10 +
    '                                                         WHERE  TRANSLATE(UPPER(H.HISTORICO), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') ' + #13#10 +
    '                                                LIKE ''%RESGATE%''                                                             ' + #13#10 +
    '                                                AND TO_NUMBER(TO_CHAR(DATAEFETIVACAO,''YYYY'')) = ' + QuotedStr(pAnoRef) + ')) ' + #13#10 +
    '                                     OR                                                                                          ' + #13#10 +
    '                                   (L.IDHSTFOLHABENEF IN (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */ H.IDHSTFOLHABENEF              ' + #13#10 +
    '                                                         FROM HSTFOLHABENEF H                                                    ' + #13#10 +
    '                                                         WHERE  TRANSLATE(UPPER(H.HISTORICO), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') ' + #13#10 +
    '                                                LIKE ''%COMPLEMENTAR%''                                                             ' + #13#10 +
    '                                                AND TO_NUMBER(TO_CHAR(DATAEFETIVACAO,''YYYY'')) = ' + QuotedStr(pAnoRef) + ')) ' + #13#10 +
    '                                     OR                                                                                          ' + #13#10 +
    '                                   (L.IDHSTFOLHABENEF IN (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */ H.IDHSTFOLHABENEF              ' + #13#10 +
    '                                                         FROM HSTFOLHABENEF H                                                    ' + #13#10 +
    '                                                         WHERE  TRANSLATE(UPPER(H.HISTORICO), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') ' + #13#10 +
    '                                                LIKE ''%EXTRA%''                                                             ' + #13#10 +
    '                                                AND TO_NUMBER(TO_CHAR(DATAEFETIVACAO,''YYYY'')) = ' + QuotedStr(pAnoRef) + '))) ' + #13#10 +

    // Andre Imakawa - SIG 35321 - SIG 36080 - Fim
    '            AND I.IDINFORME IN  (select idinforme from informe where flgusadobuscacompensa = ''S'')                              ' + #13#10 +
    '            AND L.FLGLANC_COMPENSABUSCA IS NOT NULL                                                                              ' + #13#10 +
    '            AND L.FLGLANC_QUITACAOBUSCA IS NULL                                                                                  ' + #13#10 +
    '            AND LX.VLRLANC <> 0                                                                                                  ' + #13#10 +
    '      GROUP BY PE.NUMDOCUMENTO, L.FLGLANC_COMPENSABUSCA ) DS2                                                                    ' + #13#10 +
    'WHERE DS1.NUMDOCUMENTO = DS2.NUMDOCUMENTO (+)                                                                                    ' + #13#10 +
    'ORDER BY DS1.NUMDOCUMENTO                                                                                                        ' + #13#10;

  If bFlgGravaSQLSomenteUmaVez Then
    Begin
      sqlText.Clear;
      sqlText.add(sSql);
      sqlText.SaveToFile(DirLogBusca + '\SQL_COMPENSA_BenefSelProcessamento.txt');
      bFlgGravaSQLSomenteUmaVez := False;
    End;

  Result := GetDataPacket(sSql);
End;

// Paulo Nobre - SIG 21776 - Inicio

Procedure TCtrlBUSCA_DIRFFolhaBeneficios._ProcessarMovimentoDoCompensa(
  pAnoRef: String;
  cdsBenefSelecionadoCompensa: TClientDataSet;
  qryBenefValoresACompensar,
  qryBenefValoresACompensarPorFolha,
  qryBenefCompMovFolhasProc: TwwQuery;
  pListaDeBeneficiarios: TStringlist;
  pTemListaDeBeneficiarios: Boolean;
  gProgresso: TGauge);
Var iIdInformeACompensar, iIdInformeCompensado, iVersaoFolhaSaldo52_Vindo59: Integer;
  sFlgTipoReg, sFlgNatureza, sNaturezaACompensar: String;
  dValorIDINFORMESaldoACompensar, dValorSaldo52_VindoDo49, dValorCalculado, dValorLocalizado53, dValorTotaldo52e53: Double;
  bSaldoFinalDo49ChegouAZero, bIdoso: Boolean;
  RegAtual1, RegAtual2: TBookMark;
  dValorCalculado52, dValorCalculado45: Double;//Andre Imakawa - SIG 21776
  dValorCalculado49: Double; // Andre Imakawa - SIG 50681
  iCont: Integer; // Andre Imakawa - SIG 38458

// Paulo Nobre - WO7147 - Inicio
  iIdPensionistaGravar : Integer;
  sSql: String;
// Paulo Nobre - WO7147 - Fim

  //edilaine - SIG96070 : inicio
  function SaldoZerado(sCodNaturezaOri, lstIdCompensando : string) : boolean;
  var
    sSQL : string;
  begin
    {results:  false : nao ha lançamentos no período para os Informes a compensar em nenhuma natureza
               false : há saldo a compensar no período para os informes destino na natureza de origem
               true  : saldo zerado na natureza de origem  }
    sSql := 'SELECT M.CODNATUREZA, SUM(L.VLRLANC) AS SALDO ' + #13#10 +
      '      FROM LANCIRRF M, LANCXINFORME L, PESSOA P     ' + #13#10 +
      '      WHERE M.IDLANCIRRF = L.IDLANCIRRF             ' + #13#10 +
      '            AND M.IDBENEFIRRF = P.IDPESSOA          ' + #13#10 +
      '            AND (TO_CHAR(M.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAnoRef) + ')' + #13#10 +
      '            AND (P.NUMDOCUMENTO = ' + QuotedStr(sCPFBeneficiarioSelecionadoComp) + ')' + #13#10 +
      '            AND (L.FONTEPAGADORA = ' + IntToStr(iFontePagadora) + ')' + #13#10 +
      //'            AND (M.CODNATUREZA = ' + QuotedStr(sCodigoNaturezaIndiv) + ')' + #13#10 +
      '            AND (L.IDINFORME IN (' + lstIdCompensando + ') )' + #13#10 +
      '      GROUP BY M.CODNATUREZA, M.IDBENEFIRRF ' + #13#10 +
      '      HAVING SUM(L.VLRLANC) > 0';
      //'            AND M.FLGLANC_COMPENSABUSCA IS NULL      ' + #13#10 +
      //'            AND M.FLGLANC_QUITACAOBUSCA IS NULL        ';
    CdsAux1.Data := GetDataPacket(sSql);

    if not CdsAux1.eof then
    begin
      if CdsAux1.Locate('CODNATUREZA', sCodNaturezaOri, []) then
         Result := false
      else
         Result := true;
    end
    else
       Result := false;
  end;
  //edilaine - SIG96070 : fim


  // A carga destas variáveis globais abaixo, são necessárias
  // para a função: _GravarDadosIRRF_Beneficiario

  Procedure _CarregaDadosDoIDINFORMEProcessado(pQualOrig: Integer;
                                               const bManterRespAtual : boolean = false);     //edilaine - SIG81209
  Var sSql: String;
    iIdInformeLocaliza: Integer;
  Begin
    If pQualOrig = 1 Then // Valores a Compensar por folha
      Begin
        iVersaoFolha := qryBenefValoresACompensarPorFolha.fieldbyname('IDHSTFOLHABENEF').asInteger;
        sDataPagamento := qryBenefValoresACompensarPorFolha.fieldbyname('DataPagamento').asString;
        iFontePagadora := qryBenefValoresACompensarPorFolha.fieldbyname('fontepagadora').asInteger;
        iIdPlanoContab := qryBenefValoresACompensarPorFolha.FieldByName('plano').AsInteger;
        iFlgPensaoAlim := qryBenefValoresACompensarPorFolha.FieldByName('flgpensaoalim').AsInteger;
        iIdModulo := qryBenefValoresACompensarPorFolha.FieldByName('idmodulorespon').AsInteger;
        iIdPatro := qryBenefValoresACompensarPorFolha.FieldByName('idpatro').AsInteger;
        iIdPrograma := qryBenefValoresACompensarPorFolha.FieldByName('idprograma').AsInteger;
        sCodigoNaturezaIndiv := trim(qryBenefValoresACompensarPorFolha.FieldByName('codnatureza').AsString);
        sCodigoCentroCusto := qryBenefValoresACompensarPorFolha.FieldByName('codcentrocusto').AsString;
        sCodigoCentroRespon := qryBenefValoresACompensarPorFolha.FieldByName('codcentrorespon').AsString;
        sFlgNatureza := qryBenefValoresACompensarPorFolha.FieldByName('flgnatureza').AsString;
        dValorIDINFORMEBaseGravar := qryBenefValoresACompensarPorFolha.fieldbyname('VLRLANC').asFloat;
        sFlgTipoReg := qryBenefValoresACompensarPorFolha.FieldByName('flgtiporeg').AsString;
        sFlgNatureza := qryBenefValoresACompensarPorFolha.FieldByName('flgnatureza').AsString;
        iIdInformeACompensar := qryBenefValoresACompensarPorFolha.fieldbyname('IDINFORME').asInteger;
        dValorIDINFORMESaldoACompensar := qryBenefValoresACompensarPorFolha.fieldbyname('VLRLANC').asFloat;

        iIdProcJudFund := StrToIntDef(qryBenefValoresACompensarPorFolha.fieldbyname('IDPROCJUD').asString, 0);    //edilaine SIG96359

        If (sFlgTipoReg = 'D') And (sFlgNatureza = 'P') Then
          dValorIDINFORMESaldoACompensar := abs(dValorIDINFORMESaldoACompensar);
        iIdInformeLocaliza := iIdInformeACompensar;
      End
    Else // 2 - Movimento das Folhas
      Begin
        sCPFBeneficiarioSelecionadoComp := qryBenefCompMovFolhasProc.fieldbyname('NUMDOCUMENTO').asString; // Paulo Nobre - SIG 35148
        iVersaoFolha := qryBenefCompMovFolhasProc.fieldbyname('IDHSTFOLHABENEF').asInteger;
        sDataPagamento := qryBenefCompMovFolhasProc.fieldbyname('DataPagamento').asString;
        iFontePagadora := qryBenefCompMovFolhasProc.fieldbyname('fontepagadora').asInteger;
        iIdPlanoContab := qryBenefCompMovFolhasProc.FieldByName('plano').AsInteger;
        iFlgPensaoAlim := qryBenefCompMovFolhasProc.FieldByName('flgpensaoalim').AsInteger;
        iIdModulo := qryBenefCompMovFolhasProc.FieldByName('idmodulorespon').AsInteger;
        iIdPatro := qryBenefCompMovFolhasProc.FieldByName('idpatro').AsInteger;
        iIdPrograma := qryBenefCompMovFolhasProc.FieldByName('idprograma').AsInteger;
        sCodigoNaturezaIndiv := trim(qryBenefCompMovFolhasProc.FieldByName('codnatureza').AsString);
        sCodigoCentroCusto := qryBenefCompMovFolhasProc.FieldByName('codcentrocusto').AsString;
        sCodigoCentroRespon := qryBenefCompMovFolhasProc.FieldByName('codcentrorespon').AsString;
        dValorIDINFORMEBaseGravar := qryBenefCompMovFolhasProc.fieldbyname('vlrlanc').asFloat;
        sFlgTipoReg := qryBenefCompMovFolhasProc.FieldByName('flgtiporeg').AsString;
        sFlgNatureza := qryBenefCompMovFolhasProc.FieldByName('flgnatureza').AsString;
        iIdInformeCompensado := qryBenefCompMovFolhasProc.fieldbyname('IDINFORME').asInteger;
        iIdInformeLocaliza := iIdInformeCompensado;

        iIdProcJudFund := StrToIntDef(qryBenefCompMovFolhasProc.fieldbyname('IDPROCJUD').asString, 0);    //edilaine SIG96359

      End;

    //edilaine SIG113550 : inicio
    bCompensaAcJud := true;
    bCompensaInformeAcJud  := iIdInformeACompensar in [37, 56, 166, 168, 214, 215];

    if (bCompensaInformeAcJud) and
       (qryBenefValoresACompensarPorFolha.fieldbyname('IDPROCJUD').asString <> '') and //edilaine SIG122661
       (iIdProcJudFund <> StrToIntDef(qryBenefValoresACompensarPorFolha.fieldbyname('IDPROCJUD').asString, 0)) and
       (iIdProcJudFund > 0) then
       bCompensaAcJud := false;
    //edilaine SIG113550 : fim

    iIdResponsavelAtualAux := iIdResponsavelAtual; // Andre Imakawa - SIG 50681
    // Paulo Nobre SOL 268373 PPM 1260556
    iIdPlanoPrev := 0;
    iIdMotivo := 0;
    //iIdResponsavelAtual := 0;                    //edilaine - SIG81209
    sCodigoTipoRecDes := '';
    sPlanoContaCredito := '';

    // Rotina para buscar dados especificos, pois estes ficaram fora do SELECT geral
    // devido existir mais de uma ocorrência deles para o mesma chave: Fonte, Natureza, IdInforme
    // e com isso a totalização pelo agrupamento fica prejudicada.
    // As vezes estas ocorrências são por problemas oriundos da folha e para não prejudicar a BUSCA
    // foi usado este artifico.
    sSql := 'SELECT M.IDMOTIVO, M.PLACONTA, M.CODTIPRECDES, M.IDPLANOPREV, M.DATAINIMOLGRAVE, M.DATAFIMMOLGRAVE, M.IDBENEFIRRF ' + #13#10 +
      '      FROM LANCIRRF M, LANCXINFORME L, PESSOA P                      ' + #13#10 +
      '      WHERE M.IDLANCIRRF = L.IDLANCIRRF                         ' + #13#10 +
      '            AND M.IDBENEFIRRF = P.IDPESSOA                      ' + #13#10 +
      '            AND (TO_CHAR(M.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAnoRef) + ')' + #13#10 +
      '            AND (P.NUMDOCUMENTO = ' + QuotedStr(sCPFBeneficiarioSelecionadoComp) + ')' + #13#10 +
      '            AND (L.FONTEPAGADORA = ' + IntToStr(iFontePagadora) + ')' + #13#10 +
      '            AND (M.CODNATUREZA = ' + QuotedStr(sCodigoNaturezaIndiv) + ')' + #13#10 +
      '            AND (L.IDINFORME = ' + IntToStr(iIdInformeLocaliza) + ')' + #13#10 +
      '            AND M.FLGLANC_COMPENSABUSCA IS NULL      ' + #13#10 +
      '            AND M.FLGLANC_QUITACAOBUSCA IS NULL        ';
    CdsAux1.Data := GetDataPacket(sSql);
    
	// Andre Imakawa - SIG 50681 - Inicio
    if not CdsAux1.IsEmpty then
    begin
      iIdPlanoPrev := CdsAux1.FieldByName('IDPLANOPREV').AsInteger;
      iIdMotivo := CdsAux1.FieldByName('IDMOTIVO').AsInteger;
      if not bManterRespAtual then                                  //edilaine - SIG81209
         iIdResponsavelAtual := CdsAux1.fieldbyname('IDBENEFIRRF').asInteger;
      sPlanoContaCredito := CdsAux1.FieldByName('PLACONTA').AsString;
      sCodigoTipoRecDes := CdsAux1.FieldByName('CODTIPRECDES').AsString;
      sDataIniMolGrave := CdsAux1.FieldByName('DATAINIMOLGRAVE').AsString;
      sDataFimMolGrave := CdsAux1.FieldByName('DATAFIMMOLGRAVE').AsString;
    end
    else
    begin
      iIdResponsavelAtual := iIdResponsavelAtualAux;
    end;
	// Andre Imakawa - SIG 50681 - Fim

  End;

  // Andre Imakawa - SIG 38458 - Inicio
  Procedure _ProcessaCompensaFaltouZerar(piIdInformeCompensado: Integer);
  Var sSql: String;
  Begin
    sSql := 'SELECT *' + #13#10 +
            '            FROM (SELECT pe.numdocumento,' + #13#10 +
            '                         l.idhstfolhabenef,' + #13#10 +
            '                         lx.idinforme,' + #13#10 +
            '                         i.nomeinforme,' + #13#10 +
            '                         lx.fontepagadora,' + #13#10 +
            '                         l.codnatureza,' + #13#10 +
            '                         i.coddirf,' + #13#10 +
            '                         L.DATAPAGAMENTO,' + #13#10 +
            '                         TO_CHAR(L.DATAPAGAMENTO, ''MONTH'') AS DESC_MES,' + #13#10 +
            '                         TO_CHAR(L.DATAPAGAMENTO, ''MM'') AS NUMMES,' + #13#10 +
            '                         l.flgpensaoalim,' + #13#10 +
            '                         l.PLANO,' + #13#10 +
            '                         l.IDPATRO,' + #13#10 +
            '                         l.CODCENTRORESPON,' + #13#10 +
            '                         l.codcentrocusto,' + #13#10 +
            '                         l.idmodulorespon,' + #13#10 +
            '                         l.idprograma,' + #13#10 +
            '                         SUM(LX.VLRLANC) AS VLRLANC,' + #13#10 +
            '                       (SELECT MAX(TO_CHAR(L.DATAPAGAMENTO, ''MM''))' + #13#10 +
            '                          FROM LANCIRRF L, LANCXINFORME LI, informe i' + #13#10 +
            '                         WHERE LI.IDLANCIRRF = L.IDLANCIRRF' + #13#10 +
            '                           and li.idinforme = i.idinforme' + #13#10 +
            '                           AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAnoRef) + #13#10 +
            '                           AND L.IDBENEFIRRF IN' + #13#10 +
            '                               (SELECT IDPESSOA' + #13#10 +
            '                                  FROM PESSOA' + #13#10 +
            '                                 WHERE NUMDOCUMENTO = ' + QuotedStr(sCPFBeneficiarioSelecionadoComp) + ')' + #13#10 +
            '                           AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 18)' + #13#10 +
            '                           AND LI.FLGAGRUPADO IS NULL' + #13#10 +
            '                           AND L.FLGLANC_COMPENSABUSCA IS NULL' + #13#10 +
            '                           AND L.FLGLANC_QUITACAOBUSCA IS NULL' + #13#10 +
            '                           AND (LI.FLGTIPOREG, I.FLGNATUREZA) IN' + #13#10 +
            '                               ((''D'', ''P''), (''N'', ''N''))' + #13#10 +
            '                           AND (' + IntToStr(iIdInformeACompensar) + ' = 0 OR LI.IDINFORME = ' + IntToStr(iIdInformeACompensar) + ')) MES' + #13#10 +
            '                  FROM lancirrf l' + #13#10 +
            '                  JOIN lancxinforme lx' + #13#10 +
            '                    ON l.idlancirrf = lx.idlancirrf' + #13#10 +
            '                  JOIN pessoa pe' + #13#10 +
            '                    ON l.idbenefirrf = pe.idpessoa' + #13#10 +
            '                  JOIN INFORME i' + #13#10 +
            '                    ON lx.idinforme = i.idinforme' + #13#10 +
            '                 WHERE TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAnoRef) + #13#10 +
            '                   AND L.IDBENEFIRRF IN' + #13#10 +
            '                       (SELECT IDPESSOA' + #13#10 +
            '                          FROM PESSOA' + #13#10 +
            '                         WHERE NUMDOCUMENTO = ' + QuotedStr(sCPFBeneficiarioSelecionadoComp) + ')' + #13#10 +
            '                   AND (l.idhstfolhabenef IN' + #13#10 +
            '                        (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */' + #13#10 +
            '                          H.IDHSTFOLHABENEF' + #13#10 +
            '                           FROM HSTFOLHABENEF H' + #13#10 +
            '                          WHERE TRANSLATE(UPPER(H.HISTORICO),' + #13#10 +
            '                                          ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',' + #13#10 +
            '                                          ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') LIKE' + #13#10 +
            '                                ''% FOLHA '' ||' + #13#10 +
            '                                DECODE(TO_CHAR(l.datapagamento, ''MM''),' + #13#10 +
            '                                       ''01'',' + #13#10 +
            '                                       ''JANEIRO '',' + #13#10 +
            '                                       ''02'',' + #13#10 +
            '                                       ''FEVEREIRO '',' + #13#10 +
            '                                       ''03'',' + #13#10 +
            '                                       ''MARCO '',' + #13#10 +
            '                                       ''04'',' + #13#10 +
            '                                       ''ABRIL '',' + #13#10 +
            '                                       ''05'',' + #13#10 +
            '                                       ''MAIO '',' + #13#10 +
            '                                       ''06'',' + #13#10 +
            '                                       ''JUNHO '',' + #13#10 +
            '                                       ''07'',' + #13#10 +
            '                                       ''JULHO '',' + #13#10 +
            '                                       ''08'',' + #13#10 +
            '                                       ''AGOSTO '',' + #13#10 +
            '                                       ''09'',' + #13#10 +
            '                                       ''SETEMBRO '',' + #13#10 +
            '                                       ''10'',' + #13#10 +
            '                                       ''OUTUBRO '',' + #13#10 +
            '                                       ''11'',' + #13#10 +
            '                                       ''NOVEMBRO '',' + #13#10 +
            '                                       ''12'',' + #13#10 +
            '                                       ''DEZEMBRO '') ||' + #13#10 +
            '                                TO_CHAR(l.datapagamento, ''yyyy'') || ''%''' + #13#10 +
            '                            AND H.FLGTIPOFOLHA = 0) OR' + #13#10 +
            '                        (l.idhstfolhabenef IN' + #13#10 +
            '                        (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */' + #13#10 +
            '                           H.IDHSTFOLHABENEF' + #13#10 +
            '                            FROM HSTFOLHABENEF H' + #13#10 +
            '                           WHERE TRANSLATE(UPPER(H.HISTORICO),' + #13#10 +
            '                                           ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',' + #13#10 +
            '                                           ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') LIKE' + #13#10 +
            '                                 ''%RESGATE%''' + #13#10 +
            '                             AND TO_NUMBER(TO_CHAR(DATAEFETIVACAO, ''YYYY'')) =' + #13#10 +
            '                                 ' + quotedstr(pAnoRef) + ')) OR' + #13#10 +
            '                        (l.idhstfolhabenef IN' + #13#10 +
            '                        (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */' + #13#10 +
            '                           H.IDHSTFOLHABENEF' + #13#10 +
            '                            FROM HSTFOLHABENEF H' + #13#10 +
            '                           WHERE TRANSLATE(UPPER(H.HISTORICO),' + #13#10 +
            '                                           ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',' + #13#10 +
            '                                           ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') LIKE' + #13#10 +
            '                                 ''%COMPLEMENTAR%''' + #13#10 +
            '                             AND TO_NUMBER(TO_CHAR(DATAEFETIVACAO, ''YYYY'')) =' + #13#10 +
            '                                 ' + quotedstr(pAnoRef) + ')) OR' + #13#10 +
            '                        (l.idhstfolhabenef IN' + #13#10 +
            '                        (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */' + #13#10 +
            '                           H.IDHSTFOLHABENEF' + #13#10 +
            '                            FROM HSTFOLHABENEF H' + #13#10 +
            '                           WHERE TRANSLATE(UPPER(H.HISTORICO),' + #13#10 +
            '                                           ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',' + #13#10 +
            '                                           ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') LIKE' + #13#10 +
            '                                 ''%EXTRA%''' + #13#10 +
            '                             AND TO_NUMBER(TO_CHAR(DATAEFETIVACAO, ''YYYY'')) =' + #13#10 +
            '                                 ' + quotedstr(pAnoRef) + ')))' + #13#10 +
            '                   AND I.IDINFORME IN' + #13#10 +
            '                       (select idinforme' + #13#10 +
            '                          from informe' + #13#10 +
            '                         where flgusadobuscacompensa = ''S'')' + #13#10 +
            '                   AND l.idlancirrf NOT IN' + #13#10 +
            '                       (SELECT l.idlancirrf' + #13#10 +
            '                          FROM LANCIRRF L, LANCXINFORME LI' + #13#10 +
            '                         WHERE LI.IDLANCIRRF = L.IDLANCIRRF' + #13#10 +
            '                           AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAnoRef) + '' + #13#10 +
            '                           AND L.IDBENEFIRRF IN' + #13#10 +
            '                               (SELECT IDPESSOA' + #13#10 +
            '                                  FROM PESSOA' + #13#10 +
            '                                 WHERE NUMDOCUMENTO = ' + QuotedStr(sCPFBeneficiarioSelecionadoComp) + ')' + #13#10 +
            '                           AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 18)' + #13#10 +
            '                           AND LI.FLGAGRUPADO IS NULL' + #13#10 +
            '                           AND L.FLGLANC_COMPENSABUSCA IS NULL' + #13#10 +
            '                           AND L.FLGLANC_QUITACAOBUSCA IS NULL' + #13#10 +
            '                           AND (LI.FLGTIPOREG, I.FLGNATUREZA) IN' + #13#10 +
            '                               ((''D'', ''P''), (''N'', ''N'')))' + #13#10 +
            '                   AND L.FLGLANC_QUITACAOBUSCA IS NULL' + #13#10 +
            '                   AND LX.VLRLANC <> 0' + #13#10 +
            '                 GROUP BY pe.numdocumento,' + #13#10 +
            '                          l.idhstfolhabenef,' + #13#10 +
            '                          lx.idinforme,' + #13#10 +
            '                          i.nomeinforme,' + #13#10 +
            '                          lx.fontepagadora,' + #13#10 +
            '                          l.codnatureza,' + #13#10 +
            '                          i.coddirf,' + #13#10 +
            '                          L.DATAPAGAMENTO,' + #13#10 +
            '                          TO_CHAR(L.DATAPAGAMENTO, ''MONTH''),' + #13#10 +
            '                          TO_CHAR(L.DATAPAGAMENTO, ''MM''),' + #13#10 +
            '                          l.flgpensaoalim,' + #13#10 +
            '                          l.PLANO,' + #13#10 +
            '                          l.IDPATRO,' + #13#10 +
            '                          l.CODCENTRORESPON,' + #13#10 +
            '                          l.codcentrocusto,' + #13#10 +
            '                          l.idmodulorespon,' + #13#10 +
            '                          l.idprograma' + #13#10 +
            '                HAVING SUM(LX.VLRLANC) > 0' + #13#10 +
            '                 ORDER BY l.idhstfolhabenef DESC,' + #13#10 +
            '                          lx.fontepagadora,' + #13#10 +
            '                          l.codnatureza,' + #13#10 +
            '                          i.coddirf,' + #13#10 +
            '                          lx.idinforme,' + #13#10 +
            '                          abs(VLRLANC)) GERAL' + #13#10 +
            '         WHERE GERAL.NUMMES <= GERAL.MES' + #13#10 +
            '' + #13#10 +
            '        UNION ALL' + #13#10 +
            '' + #13#10 +
            '        SELECT *' + #13#10 +
            '          FROM (SELECT pe.numdocumento,' + #13#10 +
            '                       l.idhstfolhabenef,' + #13#10 +
            '                       lx.idinforme,' + #13#10 +
            '                       i.nomeinforme,' + #13#10 +
            '                       lx.fontepagadora,' + #13#10 +
            '                       l.codnatureza,' + #13#10 +
            '                       i.coddirf,' + #13#10 +
            '                       L.DATAPAGAMENTO,' + #13#10 +
            '                       TO_CHAR(L.DATAPAGAMENTO, ''MONTH'') AS DESC_MES,' + #13#10 +
            '                       TO_CHAR(L.DATAPAGAMENTO, ''MM'') AS NUMMES,' + #13#10 +
            '                       l.flgpensaoalim,' + #13#10 +
            '                       l.PLANO,' + #13#10 +
            '                       l.IDPATRO,' + #13#10 +
            '                       l.CODCENTRORESPON,' + #13#10 +
            '                       l.codcentrocusto,' + #13#10 +
            '                       l.idmodulorespon,' + #13#10 +
            '                       l.idprograma,' + #13#10 +
            '                       SUM(LX.VLRLANC) AS VLRLANC,' + #13#10 +
            '                       (SELECT MAX(TO_CHAR(L.DATAPAGAMENTO, ''MM''))' + #13#10 +
            '                          FROM LANCIRRF L, LANCXINFORME LI, informe i' + #13#10 +
            '                         WHERE LI.IDLANCIRRF = L.IDLANCIRRF' + #13#10 +
            '                           and li.idinforme = i.idinforme' + #13#10 +
            '                           AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAnoRef) + '' + #13#10 +
            '                           AND L.IDBENEFIRRF IN' + #13#10 +
            '                               (SELECT IDPESSOA' + #13#10 +
            '                                  FROM PESSOA' + #13#10 +
            '                                 WHERE NUMDOCUMENTO = ' + QuotedStr(sCPFBeneficiarioSelecionadoComp) + ')' + #13#10 +
            '                           AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 18)' + #13#10 +
            '                           AND LI.FLGAGRUPADO IS NULL' + #13#10 +
            '                           AND L.FLGLANC_COMPENSABUSCA IS NULL' + #13#10 +
            '                           AND L.FLGLANC_QUITACAOBUSCA IS NULL' + #13#10 +
            '                           AND (LI.FLGTIPOREG, I.FLGNATUREZA) IN' + #13#10 +
            '                               ((''D'', ''P''), (''N'', ''N''))' + #13#10 +
            '                           AND (' + IntToStr(iIdInformeACompensar) + ' = 0 OR LI.IDINFORME = ' + IntToStr(iIdInformeACompensar) + ')) MES' + #13#10 +
            '                  FROM lancirrf l' + #13#10 +
            '                  JOIN lancxinforme lx' + #13#10 +
            '                    ON l.idlancirrf = lx.idlancirrf' + #13#10 +
            '                  JOIN pessoa pe' + #13#10 +
            '                    ON l.idbenefirrf = pe.idpessoa' + #13#10 +
            '                  JOIN INFORME i' + #13#10 +
            '                    ON lx.idinforme = i.idinforme' + #13#10 +
            '                 WHERE TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAnoRef) + '' + #13#10 +
            '                   AND L.IDBENEFIRRF IN' + #13#10 +
            '                       (SELECT IDPESSOA' + #13#10 +
            '                          FROM PESSOA' + #13#10 +
            '                         WHERE NUMDOCUMENTO = ' + QuotedStr(sCPFBeneficiarioSelecionadoComp) + ')' + #13#10 +
            '                   AND (l.idhstfolhabenef IN' + #13#10 +
            '                        (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */' + #13#10 +
            '                          H.IDHSTFOLHABENEF' + #13#10 +
            '                           FROM HSTFOLHABENEF H' + #13#10 +
            '                          WHERE TRANSLATE(UPPER(H.HISTORICO),' + #13#10 +
            '                                          ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',' + #13#10 +
            '                                          ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') LIKE' + #13#10 +
            '                                ''% FOLHA '' ||' + #13#10 +
            '                                DECODE(TO_CHAR(l.datapagamento, ''MM''),' + #13#10 +
            '                                       ''01'',' + #13#10 +
            '                                       ''JANEIRO '',' + #13#10 +
            '                                       ''02'',' + #13#10 +
            '                                       ''FEVEREIRO '',' + #13#10 +
            '                                       ''03'',' + #13#10 +
            '                                       ''MARCO '',' + #13#10 +
            '                                       ''04'',' + #13#10 +
            '                                       ''ABRIL '',' + #13#10 +
            '                                       ''05'',' + #13#10 +
            '                                       ''MAIO '',' + #13#10 +
            '                                       ''06'',' + #13#10 +
            '                                       ''JUNHO '',' + #13#10 +
            '                                       ''07'',' + #13#10 +
            '                                       ''JULHO '',' + #13#10 +
            '                                       ''08'',' + #13#10 +
            '                                       ''AGOSTO '',' + #13#10 +
            '                                       ''09'',' + #13#10 +
            '                                       ''SETEMBRO '',' + #13#10 +
            '                                       ''10'',' + #13#10 +
            '                                       ''OUTUBRO '',' + #13#10 +
            '                                       ''11'',' + #13#10 +
            '                                       ''NOVEMBRO '',' + #13#10 +
            '                                       ''12'',' + #13#10 +
            '                                       ''DEZEMBRO '') ||' + #13#10 +
            '                                TO_CHAR(l.datapagamento, ''yyyy'') || ''%''' + #13#10 +
            '                            AND H.FLGTIPOFOLHA = 0) OR' + #13#10 +
            '                        (l.idhstfolhabenef IN' + #13#10 +
            '                        (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */' + #13#10 +
            '                           H.IDHSTFOLHABENEF' + #13#10 +
            '                            FROM HSTFOLHABENEF H' + #13#10 +
            '                           WHERE TRANSLATE(UPPER(H.HISTORICO),' + #13#10 +
            '                                           ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',' + #13#10 +
            '                                           ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') LIKE' + #13#10 +
            '                                 ''%RESGATE%''' + #13#10 +
            '                             AND TO_NUMBER(TO_CHAR(DATAEFETIVACAO, ''YYYY'')) =' + #13#10 +
            '                                 ' + quotedstr(pAnoRef) + ')) OR' + #13#10 +
            '                        (l.idhstfolhabenef IN' + #13#10 +
            '                        (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */' + #13#10 +
            '                           H.IDHSTFOLHABENEF' + #13#10 +
            '                            FROM HSTFOLHABENEF H' + #13#10 +
            '                           WHERE TRANSLATE(UPPER(H.HISTORICO),' + #13#10 +
            '                                           ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',' + #13#10 +
            '                                           ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') LIKE' + #13#10 +
            '                                 ''%COMPLEMENTAR%''' + #13#10 +
            '                             AND TO_NUMBER(TO_CHAR(DATAEFETIVACAO, ''YYYY'')) =' + #13#10 +
            '                                 ' + quotedstr(pAnoRef) + ')) OR' + #13#10 +
            '                        (l.idhstfolhabenef IN' + #13#10 +
            '                        (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */' + #13#10 +
            '                           H.IDHSTFOLHABENEF' + #13#10 +
            '                            FROM HSTFOLHABENEF H' + #13#10 +
            '                           WHERE TRANSLATE(UPPER(H.HISTORICO),' + #13#10 +
            '                                           ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',' + #13#10 +
            '                                           ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') LIKE' + #13#10 +
            '                                 ''%EXTRA%''' + #13#10 +
            '                             AND TO_NUMBER(TO_CHAR(DATAEFETIVACAO, ''YYYY'')) =' + #13#10 +
            '                                 ' + quotedstr(pAnoRef) + ')))' + #13#10 +
            '                   AND I.IDINFORME IN' + #13#10 +
            '                       (select idinforme' + #13#10 +
            '                          from informe' + #13#10 +
            '                         where flgusadobuscacompensa = ''S'')' + #13#10 +
            '                   AND l.idlancirrf NOT IN' + #13#10 +
            '                       (SELECT l.idlancirrf' + #13#10 +
            '                          FROM LANCIRRF L, LANCXINFORME LI' + #13#10 +
            '                         WHERE LI.IDLANCIRRF = L.IDLANCIRRF' + #13#10 +
            '                           AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(pAnoRef) + '' + #13#10 +
            '                           AND L.IDBENEFIRRF IN' + #13#10 +
            '                               (SELECT IDPESSOA' + #13#10 +
            '                                  FROM PESSOA' + #13#10 +
            '                                 WHERE NUMDOCUMENTO = ' + QuotedStr(sCPFBeneficiarioSelecionadoComp) + ')' + #13#10 +
            '                           AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 18)' + #13#10 +
            '                           AND LI.FLGAGRUPADO IS NULL' + #13#10 +
            '                           AND L.FLGLANC_COMPENSABUSCA IS NULL' + #13#10 +
            '                           AND L.FLGLANC_QUITACAOBUSCA IS NULL' + #13#10 +
            '                           AND (LI.FLGTIPOREG, I.FLGNATUREZA) IN' + #13#10 +
            '                               ((''D'', ''P''), (''N'', ''N'')))' + #13#10 +
            '                   AND L.FLGLANC_QUITACAOBUSCA IS NULL' + #13#10 +
            '                   AND LX.VLRLANC <> 0' + #13#10 +
            '                 GROUP BY pe.numdocumento,' + #13#10 +
            '                          l.idhstfolhabenef,' + #13#10 +
            '                          lx.idinforme,' + #13#10 +
            '                          i.nomeinforme,' + #13#10 +
            '                          lx.fontepagadora,' + #13#10 +
            '                          l.codnatureza,' + #13#10 +
            '                          i.coddirf,' + #13#10 +
            '                          L.DATAPAGAMENTO,' + #13#10 +
            '                          TO_CHAR(L.DATAPAGAMENTO, ''MONTH''),' + #13#10 +
            '                          TO_CHAR(L.DATAPAGAMENTO, ''MM''),' + #13#10 +
            '                          l.flgpensaoalim,' + #13#10 +
            '                          l.PLANO,' + #13#10 +
            '                          l.IDPATRO,' + #13#10 +
            '                          l.CODCENTRORESPON,' + #13#10 +
            '                          l.codcentrocusto,' + #13#10 +
            '                          l.idmodulorespon,' + #13#10 +
            '                          l.idprograma' + #13#10 +
            '                HAVING SUM(LX.VLRLANC) > 0' + #13#10 +
            '                 ORDER BY l.idhstfolhabenef DESC,' + #13#10 +
            '                          lx.fontepagadora,' + #13#10 +
            '                          l.codnatureza,' + #13#10 +
            '                          i.coddirf,' + #13#10 +
            '                          lx.idinforme,' + #13#10 +
            '                          abs(VLRLANC)) GERAL' + #13#10 +
            '         WHERE GERAL.NUMMES > GERAL.MES';


    CdsAux1.Data := GetDataPacket(sSql);

    If not CdsAux1.IsEmpty Then
    Begin
      // Iniciando loop de processamento do Movimento das Folhas Compensadas
      CdsAux1.First;
      While Not CdsAux1.EOF Do
      Begin
        sCPFBeneficiarioSelecionadoComp := CdsAux1.fieldbyname('NUMDOCUMENTO').asString; // Paulo Nobre - SIG 35148
        iVersaoFolha := CdsAux1.fieldbyname('IDHSTFOLHABENEF').asInteger;
        sDataPagamento := CdsAux1.fieldbyname('DataPagamento').asString;
        iFontePagadora := CdsAux1.fieldbyname('fontepagadora').asInteger;
        iIdPlanoContab := CdsAux1.FieldByName('plano').AsInteger;
        iFlgPensaoAlim := CdsAux1.FieldByName('flgpensaoalim').AsInteger;
        iIdModulo := CdsAux1.FieldByName('idmodulorespon').AsInteger;
        iIdPatro := CdsAux1.FieldByName('idpatro').AsInteger;
        iIdPrograma := CdsAux1.FieldByName('idprograma').AsInteger;
        sCodigoNaturezaIndiv := trim(CdsAux1.FieldByName('codnatureza').AsString);
        sCodigoCentroCusto := CdsAux1.FieldByName('codcentrocusto').AsString;
        sCodigoCentroRespon := CdsAux1.FieldByName('codcentrorespon').AsString;
        dValorIDINFORMEBaseGravar := CdsAux1.fieldbyname('vlrlanc').asFloat;
        sFlgTipoReg := 'N';
        sFlgNatureza := 'P';
        iIdInformeCompensado := CdsAux1.fieldbyname('IDINFORME').asInteger;

        // Busca Valor Parametrizado do Idoso por vigência
        CdsParamIRRF.Data := GetDataPacket('SELECT IDINFORME65ANOS, IDINFORME65INSS, IDINFORMEACJUD, IDINFORMEACJUD13, IDEXIGIBILIDADESUSPENSA, VLRIDOSO ' +
          ' ,IDINFORMEMOLINSS '+ //Darivaldo Alencar SIG62723
          'FROM HSTPARAMIRRF   ' +
          'WHERE DATAINIVIGENCIA = (SELECT MAX(DATAINIVIGENCIA) ' +
          '                         FROM  HSTPARAMIRRF   ' +
          '                         WHERE DATAINIVIGENCIA <= TO_DATE(' + QuotedStr(sDataPagamento) + ',''DD/MM/YYYY''))');
        dValorDescontoIdosoParam := CdsParamIRRF.fieldbyname('VLRIDOSO').asFloat;
        iLinhaAcima65 := CdsParamIRRF.fieldbyname('IDINFORME65ANOS').asInteger; // 52
        iLinhaAcima65INSS := CdsParamIRRF.fieldbyname('IDINFORME65INSS').asInteger; // 53
        iLinhaRendAcJud := CdsParamIRRF.fieldbyname('IDINFORMEACJUD').asInteger; // 168
        iLinhaRendAcJud13 := CdsParamIRRF.fieldbyname('IDINFORMEACJUD13').asInteger; // 167
        iIdInformeBUA := CdsParamIRRF.FieldByName('IDEXIGIBILIDADESUSPENSA').asInteger; // 193 - Exibilidade Suspensa - BUA
        dValorIDINFORMECompensado := CdsAux1.fieldbyname('vlrlanc').asFloat;
        iLinhaMolINSS:= CdsParamIRRF.FieldByName('IDINFORMEMOLINSS').asInteger; //55   Darivaldo Alencar SIG62723

        // Se o IDINFORME A Compensar for o (45) E os Compensados forem os (49)
        If ((iIdInformeACompensar In [iIdInformeTRBINSS]) And
          (iIdInformeCompensado In [piIdInformeCompensado])) OR
        // Se o IDINFORME A Compensar for o (55) E os Compensados forem os (54)
           ((iIdInformeACompensar In [55]) And
          (iIdInformeCompensado In [54]))
           Then
        Begin

          If dValorIDINFORMESaldoACompensar <> 0.00 Then
          Begin
            // Se o Valor do IDINFORME a Compensar for MAIOR que o Valor do IDINFORME processado, então COMPENSA
            If abs(dValorIDINFORMESaldoACompensar) > abs(dValorIDINFORMECompensado) Then
              Begin
                // Gravando o IDINFORME Compensado com valor NEGATIVO para zerar seu valor original
                _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');

                dValorIDINFORMESaldoACompensar := ROUNDCM(dValorIDINFORMESaldoACompensar + dValorIDINFORMECompensado, 2);

              End
            Else // Se o valor do saldo a compensar for MENOR OU IGUAL ao valor do IDINFORME processado
              Begin
                // Gravando o IDINFORME Compensado com valor NEGATIVO para zerar seu valor original
                //_GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');

                //dValorIDINFORMESaldoACompensar := ROUNDCM(dValorIDINFORMESaldoACompensar + dValorIDINFORMECompensado, 2);

                // Gravando o IDINFORME com o valor do saldo a compensar
                _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');

                dValorIDINFORMESaldoACompensar := 0.00;

              End;
          End;
        end // Andre Imakawa - SIG 50681 - Inicio
        Else If ((iIdInformeACompensar In [iIdInformeTRBFUNCEF]) And
          (iIdInformeCompensado In [piIdInformeCompensado])) Then
          Begin

            If dValorIDINFORMESaldoACompensar <> 0.00 Then
            Begin
              if iIdInformeCompensado = iIdInformeTRBINSS then
              begin
                dValorCalculado45 := 0;
                dValorCalculado45 := _RetornaValorTotalIDINFORMENoMovProcessadoResp(iVersaoFolha, iIdInformeTRBINSS, sCPFBeneficiarioSelecionadoComp) ;
                if dValorCalculado45 > 0 then
                  if (dValorCalculado45 >= Abs(dValorIDINFORMESaldoACompensar))then
                  begin
                    // Gravando o IDINFORME com o valor do saldo a compensar
                    _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');

                    dValorIDINFORMESaldoACompensar := 0.00;
                  end
                  else
                  begin
                    // Gravando o IDINFORME Compensado com valor NEGATIVO para zerar seu valor original
                    _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorCalculado45 * -1, 'C');

                    dValorIDINFORMESaldoACompensar := ROUNDCM(dValorIDINFORMESaldoACompensar + dValorCalculado45, 2);
                  end;
              end
              else if iIdInformeCompensado = iLinhaAcima65INSS then
                begin
                  dValorLocalizado53 := 0;
                  dValorLocalizado53 := _RetornaValorTotalIDINFORMENoMovProcessadoResp(iVersaoFolha, iLinhaAcima65INSS, sCPFBeneficiarioSelecionadoComp) ;

                  if dValorLocalizado53 > 0 then
                    if (dValorLocalizado53 >= Abs(dValorIDINFORMESaldoACompensar))then
                    begin
                      // Gravando o IDINFORME com o valor do saldo a compensar
                      _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');

                      dValorIDINFORMESaldoACompensar := 0.00;
                    end
                    else
                    begin
                      // Gravando o IDINFORME Compensado com valor NEGATIVO para zerar seu valor original
                      _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorLocalizado53 * -1, 'C');

                      dValorIDINFORMESaldoACompensar := ROUNDCM(dValorIDINFORMESaldoACompensar + dValorLocalizado53, 2);
                    end;
                end;
            End;
          end; // Andre Imakawa - SIG 50681 - Fim

        CdsAux1.Next;
      End;

      CdsAux1.Close;
    End;
  End;
  // Andre Imakawa - SIG 38458 - Fim

Begin
  qryBenefValoresACompensarPorFolha.Close;
  qryBenefValoresACompensarPorFolha.Open;
  // Para a recuperação correta dos parametros na HSTPARAMIRRF, será usada a data de pagamento
  // da primeira folha, já que esta query está ordenada por ordem decrescente de folha
  qryBenefValoresACompensarPorFolha.Last;
  DtFimExercicio := qryBenefValoresACompensarPorFolha.fieldbyname('DataPagamento').asDateTime;

  TipoOperacao := tpCompensa;    //edilaine - SIG96080

  // Iniciando loop de processamento dos Beneficiários Selecionados na Grid

  cdsBenefSelecionadoCompensa.First;

  gProgresso.Progress := 0;
  gProgresso.MinValue := 0;
  sCPFBeneficiarioSelecionadoComp := ''; // Paulo Nobre - SIG 35148
  gProgresso.MaxValue := cdsBenefSelecionadoCompensa.RecordCount;

  While Not cdsBenefSelecionadoCompensa.EOF Do
    Begin
      // Paulo Nobre - SIG 32807
      // Processa somente se houver movimento de folhas a compensar
      If Not qryBenefCompMovFolhasProc.isempty Then
        Begin
          // Processa somente os Beneficiários Marcados
          If (cdsBenefSelecionadoCompensa.fieldByname('MARCADO').asString = 'S') Then
            Begin
              // Processa se Movimento do Beneficiário NÃO foi Compensado
              If (cdsBenefSelecionadoCompensa.fieldByname('TEM_COMPENSA').asString = 'Não') Then
                Begin
                  gProgresso.Progress := gProgresso.Progress + 1;

                  // Carrega os dados particulares do IDINFORME processado no momento
                  _CarregaDadosDoIDINFORMEProcessado(2); // Paulo Nobre - SIG 35148

                  // Andre Imakawa - SIG 21776 - Inicio
                  // Necessario rodar o trecho abaixo nesse ponto, pois bIdoso utiliza algumas variaveis. 
                  // Busca Valor Parametrizado do Idoso por vigência
                  CdsParamIRRF.Data := GetDataPacket('SELECT IDINFORME65ANOS, IDINFORME65INSS, IDINFORMEACJUD, IDINFORMEACJUD13, IDEXIGIBILIDADESUSPENSA, VLRIDOSO ' +
                  ' ,IDINFORMEMOLINSS ' +// Darivaldo Alencar SIG62723
                    ', IDINFORMECONTRIBEXTRA, IDINFORMECONTRIBEXTRA13 ' + //Cássio Rovaroto - SIG nº 74355
                    'FROM HSTPARAMIRRF   ' +
                    'WHERE DATAINIVIGENCIA = (SELECT MAX(DATAINIVIGENCIA) ' +
                    '                         FROM  HSTPARAMIRRF   ' +
                    '                         WHERE DATAINIVIGENCIA <= TO_DATE(' + QuotedStr(sDataPagamento) + ',''DD/MM/YYYY''))');
                  dValorDescontoIdosoParam := CdsParamIRRF.fieldbyname('VLRIDOSO').asFloat;
                  iLinhaAcima65 := CdsParamIRRF.fieldbyname('IDINFORME65ANOS').asInteger; // 52
                  iLinhaAcima65INSS := CdsParamIRRF.fieldbyname('IDINFORME65INSS').asInteger; // 53
                  iLinhaRendAcJud := CdsParamIRRF.fieldbyname('IDINFORMEACJUD').asInteger; // 168
                  iLinhaRendAcJud13 := CdsParamIRRF.fieldbyname('IDINFORMEACJUD13').asInteger; // 167
                  iIdInformeBUA := CdsParamIRRF.FieldByName('IDEXIGIBILIDADESUSPENSA').asInteger; // 193 - Exibilidade Suspensa - BUA

                  // Andre Imakawa - SIG 21776 - Fim
                  iLinhaMolINSS:= CdsParamIRRF.FieldByName('IDINFORMEMOLINSS').asInteger; //55   Darivaldo Alencar SIG62723

                  //Cássio Rovaroto - SIG nº 74355 - Início
                  iLinhaAcaoJudicialContribExtra := CdsParamIRRF.FieldByName('IDINFORMECONTRIBEXTRA').AsInteger;
                  iLinhaAcaoJudicialContribExtra13:= CdsParamIRRF.FieldByName('IDINFORMECONTRIBEXTRA13').AsInteger;
                  //Cássio Rovaroto - SIG nº 74355 - Fim

                  bSaldoFinalDo49ChegouAZero := False;
                  sCPFBeneficiarioSelecionadoComp := qryBenefCompMovFolhasProc.fieldbyname('NUMDOCUMENTO').asString;
                  //iIdProcJudFund := cdsBenefSelecionadoCompensa.fieldbyname('IDPROCJUD').asInteger;                   //edilaine SIG96359
                  dValorIDINFORMECompensado := 0.00;
                  dValorSaldo52_VindoDo49 := 0.00;

                  // Identificando se o Beneficiário é idoso através da localização dos IDINFORMES
                  // 52 ou 53 que indicam calculo de desconto de idoso
                  RegAtual1 := qryBenefCompMovFolhasProc.GetBookmark; // Salvando o ponteiro do Registro atual

                  bIdoso := (qryBenefCompMovFolhasProc.Locate('NUMDOCUMENTO; FONTEPAGADORA; CODNATUREZA; IDINFORME', VarArrayOf([
                    sCPFBeneficiarioSelecionadoComp,
                      '1',
                      sCodigoNaturRendFUNCEF, // '3540'
                    inttostr(iLinhaAcima65)]), [])) Or // 52
                  (qryBenefCompMovFolhasProc.Locate('NUMDOCUMENTO; FONTEPAGADORA; CODNATUREZA; IDINFORME', VarArrayOf([
                    sCPFBeneficiarioSelecionadoComp,
                      '2',
                      sCodigoNaturRendINSS, // '3533'
                    inttostr(iLinhaAcima65INSS)]), [])); // 53

                  If RegAtual1 <> Nil Then
                    qryBenefCompMovFolhasProc.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
                  //
                  // Iniciando loop de processamento dos Valores a Compensar.
                  // Esta seleção se apresenta de forma agrupada e totalizada
                  // sem ter o ID da folha (IDHSTFOLHABENEF) no agrupamento.
                  qryBenefValoresACompensar.First;
                  While Not qryBenefValoresACompensar.EOF Do
                    Begin
                      dValorCalculado := 0.00;
                      dValorRendimentoINSS := 0.00;
                      dValorLocalizado53 := 0.00;
                      dValorTotaldo52e53 := 0.00;

                      sNaturezaACompensar := trim(qryBenefValoresACompensar.FieldByName('CODNATUREZA').AsString);
                      //
                      iIdInformeACompensar := qryBenefValoresACompensar.fieldbyname('IDINFORME').asInteger;
                      dValorIDINFORMESaldoACompensar := qryBenefValoresACompensar.fieldbyname('VLRLANC').asFloat;

                      // Andre Imakawa - SIG 21776 - Inicio
                      // Necessário passar o IdInforme a compensar na query qryBenefCompMovFolhasProc, pois a ordenação
                      // deve ser feita baseado no IdInforme a ser processado.
                      qryBenefCompMovFolhasProc.DisableControls;

                      qryBenefCompMovFolhasProc.Close;
                      qryBenefCompMovFolhasProc.Parambyname('INFORME').asFloat := iIdInformeACompensar;
                      qryBenefCompMovFolhasProc.Open;
                      qryBenefCompMovFolhasProc.Parambyname('INFORME').asFloat := 0;
                      qryBenefCompMovFolhasProc.EnableControls;

                      // Andre Imakawa - SIG 21776 - Fim

                      // Iniciando loop de processamento do Movimento das Folhas Compensadas
                      qryBenefCompMovFolhasProc.First;
                      While (Not qryBenefCompMovFolhasProc.EOF) and (dValorIDINFORMESaldoACompensar <> 0) Do    //edilaine - SIG81209
                        Begin
                          // Busca Valor Parametrizado do Idoso por vigência
                          CdsParamIRRF.Data := GetDataPacket('SELECT IDINFORME65ANOS, IDINFORME65INSS, IDINFORMEACJUD, IDINFORMEACJUD13, IDEXIGIBILIDADESUSPENSA, VLRIDOSO ' +
                          ' ,IDINFORMEMOLINSS ' + // Darivaldo Alencar SIG62723
                            'FROM HSTPARAMIRRF   ' +
                            'WHERE DATAINIVIGENCIA = (SELECT MAX(DATAINIVIGENCIA) ' +
                            '                         FROM  HSTPARAMIRRF   ' +
                            '                         WHERE DATAINIVIGENCIA <= TO_DATE(' + QuotedStr(sDataPagamento) + ',''DD/MM/YYYY''))');
                          dValorDescontoIdosoParam := CdsParamIRRF.fieldbyname('VLRIDOSO').asFloat;
                          iLinhaAcima65 := CdsParamIRRF.fieldbyname('IDINFORME65ANOS').asInteger; // 52
                          iLinhaAcima65INSS := CdsParamIRRF.fieldbyname('IDINFORME65INSS').asInteger; // 53
                          iLinhaRendAcJud := CdsParamIRRF.fieldbyname('IDINFORMEACJUD').asInteger; // 168
                          iLinhaRendAcJud13 := CdsParamIRRF.fieldbyname('IDINFORMEACJUD13').asInteger; // 167
                          iIdInformeBUA := CdsParamIRRF.FieldByName('IDEXIGIBILIDADESUSPENSA').asInteger; // 193 - Exibilidade Suspensa - BUA
                          iLinhaMolINSS:= CdsParamIRRF.FieldByName('IDINFORMEMOLINSS').asInteger; //55   Darivaldo Alencar SIG62723

                          // Carrega os dados particulares do IDINFORME processado no momento
                          _CarregaDadosDoIDINFORMEProcessado(2);

                          dValorIDINFORMECompensado := qryBenefCompMovFolhasProc.fieldbyname('VLRLANC').asFloat;

                          // Se o IDINFORME A Compensar for o (49 ou 141) E os Compensados forem os (49 ou 52 ou 141 ou 168 ou 193)
                          If (iIdInformeACompensar In [iIdInformeTRBFUNCEF{, 141}]) And                                                   //edilaine SIG96359
                            (iIdInformeCompensado In [iIdInformeTRBFUNCEF, iLinhaAcima65, {141,} iLinhaRendAcJud, iIdInformeBUA]) And     //edilaine SIG96359
                            (sNaturezaACompensar = sCodigoNaturezaIndiv) Then // Natureza = 3540
                            Begin
                              dValorIDINFORMECompensado := _RetornaValorTotalIDINFORMENoMovProcessadoResp(iVersaoFolha, iIdInformeCompensado, sCPFBeneficiarioSelecionadoComp); // Andre Imakawa - SIG 50681
                              If (dValorIDINFORMESaldoACompensar <> 0.00)  and ( dValorIDINFORMECompensado >0)Then // Andre Imakawa - SIG 50681
                                Begin
                                  // Se o Valor do IDINFORME a Compensar for MAIOR que o Valor do IDINFORME processado, então COMPENSA
                                  If abs(dValorIDINFORMESaldoACompensar) > abs(dValorIDINFORMECompensado) Then
                                    Begin
                                      // Gravando o IDINFORME Compensado com valor NEGATIVO para zerar seu valor original
                                      _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');

                                      dValorIDINFORMESaldoACompensar := ROUNDCM(dValorIDINFORMESaldoACompensar + dValorIDINFORMECompensado, 2);

                                      // Se o IDINFORME A Compensar for o 49 ou 52 ou 168
                                      If iIdInformeCompensado In [iIdInformeTRBFUNCEF, iLinhaAcima65, iLinhaRendAcJud] Then
                                        Begin

                                          // Andre Imakawa - SIG 50681 - Inicio
                                          If iIdInformeCompensado = iLinhaAcima65 Then
                                          Begin
                                            dValorCalculado49 := 0;
                                            dValorCalculado49 := _RetornaValorTotalIDINFORMENoMovProcessadoResp(iVersaoFolha, iIdInformeTRBFUNCEF, sCPFBeneficiarioSelecionadoComp) ;

                                            If dValorCalculado49 > 0 then
                                            Begin
                                              If dValorCalculado49 > dValorIDINFORMECompensado Then
                                              begin
                                                // Gravando o IDINFORME 49 - Com valor vindo do 52
                                                _GravarDadosIRRF_Beneficiario(iIdInformeTRBFUNCEF, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');

                                                // Gravando o IDINFORME 52 - (Parte dos proventos 65 anos ou mais INSS) com o valor absoluto do saldo a compensar
                                                _GravarDadosIRRF_Beneficiario(iLinhaAcima65, iFontePagadora, ABS(dValorIDINFORMECompensado), 'C')
                                              end
                                              Else
                                              Begin
                                                // Gravando o IDINFORME 49 - Com valor vindo do 52
                                                _GravarDadosIRRF_Beneficiario(iIdInformeTRBFUNCEF, iFontePagadora, (dValorIDINFORMECompensado - dValorCalculado49) * -1, 'C');

                                                // Gravando o IDINFORME 52 - (Parte dos proventos 65 anos ou mais INSS) com o valor absoluto do saldo a compensar
                                                _GravarDadosIRRF_Beneficiario(iLinhaAcima65, iFontePagadora, ABS(dValorIDINFORMECompensado - dValorCalculado49), 'C')
                                              end;
                                            End
                                            Else
                                            Begin

                                              RegAtual2 := qryBenefCompMovFolhasProc.GetBookmark; // Salvando o ponteiro do Registro atual

                                              If qryBenefCompMovFolhasProc.Locate('NUMDOCUMENTO; IDHSTFOLHABENEF; FONTEPAGADORA; CODNATUREZA; IDINFORME', VarArrayOf([
                                                sCPFBeneficiarioSelecionadoComp,
                                                  iVersaoFolha,
                                                  '2',
                                                  sCodigoNaturRendINSS, // '3533'
                                                inttostr(iIdInformeTRBINSS)]), []) Then
                                                Begin
                                                  // Carrega os dados particulares do IDINFORME processado no momento
                                                  _CarregaDadosDoIDINFORMEProcessado(2, true);              //edilaine - SIG81209
                                                end;

                                              If RegAtual2 <> Nil Then
                                                qryBenefCompMovFolhasProc.GotoBookmark(RegAtual2);

                                              dValorCalculado45 := 0;
                                              dValorCalculado45 := _RetornaValorTotalIDINFORMENoMovProcessadoResp(iVersaoFolha, iIdInformeTRBINSS, sCPFBeneficiarioSelecionadoComp) ;

                                              If dValorCalculado45 > 0 then
                                              Begin
                                                If dValorCalculado45 > dValorIDINFORMECompensado Then
                                                begin
                                                  // Gravando o IDINFORME 45 - Com valor vindo do 52
                                                  _GravarDadosIRRF_Beneficiario(iIdInformeTRBINSS, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');

                                                  // Gravando o IDINFORME 53 - Com valor vindo do 52
                                                  _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, ABS(dValorIDINFORMECompensado), 'C')
                                                end
                                                Else
                                                Begin
                                                  // Gravando o IDINFORME 45 - Com valor vindo do 52
                                                  _GravarDadosIRRF_Beneficiario(iIdInformeTRBINSS, iFontePagadora, dValorCalculado45 * -1, 'C');

                                                  // Gravando o IDINFORME 53 - (Parte dos proventos 65 anos ou mais INSS) com o valor absoluto do saldo a compensar
                                                  _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorCalculado45, 'C')
                                                end;

                                              end;

                                            end;
                                          end;
                                          // Andre Imakawa - SIG 50681 - Fim
                                        End;
                                    End
                                  Else // Se o valor do saldo a compensar for MENOR OU IGUAL ao valor do IDINFORME processado
                                    Begin
                                      // Gravando o IDINFORME Compensado com valor NEGATIVO para zerar seu valor original
                                      _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');

                                      dValorIDINFORMESaldoACompensar := ROUNDCM(dValorIDINFORMESaldoACompensar + dValorIDINFORMECompensado, 2);
                                      
                                      // Andre Imakawa - SIG 50681 - Inicio
                                      dValorCalculado := dValorIDINFORMECompensado - ABS(dValorIDINFORMESaldoACompensar);
                                      If iIdInformeCompensado = iLinhaAcima65 Then
                                      Begin
                                        dValorCalculado49 := 0;
                                        dValorCalculado49 := _RetornaValorTotalIDINFORMENoMovProcessadoResp(iVersaoFolha, iIdInformeTRBFUNCEF, sCPFBeneficiarioSelecionadoComp) ;

                                        If dValorCalculado49 > 0 then
                                        Begin
                                          If dValorCalculado49 > dValorCalculado Then
                                          begin
                                            // Gravando o IDINFORME 49 - Com valor vindo do 52
                                            _GravarDadosIRRF_Beneficiario(iIdInformeTRBFUNCEF, iFontePagadora, dValorCalculado * -1, 'C');

                                            // Gravando o IDINFORME 52 - (Parte dos proventos 65 anos ou mais INSS) com o valor absoluto do saldo a compensar
                                            _GravarDadosIRRF_Beneficiario(iLinhaAcima65, iFontePagadora, ABS(dValorCalculado), 'C')
                                          end
                                          Else
                                          Begin
                                            // Gravando o IDINFORME 49 - Com valor vindo do 52
                                            _GravarDadosIRRF_Beneficiario(iIdInformeTRBFUNCEF, iFontePagadora, (dValorCalculado - dValorCalculado49) * -1, 'C');

                                            // Gravando o IDINFORME 52 - (Parte dos proventos 65 anos ou mais INSS) com o valor absoluto do saldo a compensar
                                            _GravarDadosIRRF_Beneficiario(iLinhaAcima65, iFontePagadora, ABS(dValorCalculado - dValorCalculado49), 'C')
                                          end;
                                        End
                                        Else
                                        Begin

                                          dValorCalculado45 := 0;
                                          dValorCalculado45 := _RetornaValorTotalIDINFORMENoMovProcessadoResp(iVersaoFolha, iIdInformeTRBINSS, sCPFBeneficiarioSelecionadoComp) ;

                                          If dValorCalculado45 > 0 then
                                          Begin
                                            If dValorCalculado45 > dValorCalculado Then
                                            begin

                                              // Gravando o IDINFORME com o valor do saldo a compensar
                                              _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');


                                              RegAtual2 := qryBenefCompMovFolhasProc.GetBookmark; // Salvando o ponteiro do Registro atual

                                              If qryBenefCompMovFolhasProc.Locate('NUMDOCUMENTO; IDHSTFOLHABENEF; FONTEPAGADORA; CODNATUREZA; IDINFORME', VarArrayOf([
                                                sCPFBeneficiarioSelecionadoComp,
                                                  iVersaoFolha,
                                                  '2',
                                                  sCodigoNaturRendINSS, // '3533'
                                                inttostr(iIdInformeTRBINSS)]), []) Then
                                                Begin
                                                  // Carrega os dados particulares do IDINFORME processado no momento
                                                  _CarregaDadosDoIDINFORMEProcessado(2, true);      //edilaine - SIG81209
                                                end;

                                              If RegAtual2 <> Nil Then
                                                qryBenefCompMovFolhasProc.GotoBookmark(RegAtual2);

                                              // Gravando o IDINFORME 45 - Com valor vindo do 52
                                              _GravarDadosIRRF_Beneficiario(iIdInformeTRBINSS, iFontePagadora, dValorCalculado * -1, 'C');

                                              // Gravando o IDINFORME 53 - Com valor vindo do 52
                                              _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, ABS(dValorCalculado), 'C')
                                            end
                                            Else
                                            Begin

                                              // Gravando o IDINFORME 52 - (Parte dos proventos 65 anos ou mais INSS) com o valor absoluto do saldo a compensar
                                              _GravarDadosIRRF_Beneficiario(iLinhaAcima65, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');

                                              RegAtual2 := qryBenefCompMovFolhasProc.GetBookmark; // Salvando o ponteiro do Registro atual

                                              If qryBenefCompMovFolhasProc.Locate('NUMDOCUMENTO; IDHSTFOLHABENEF; FONTEPAGADORA; CODNATUREZA; IDINFORME', VarArrayOf([
                                                sCPFBeneficiarioSelecionadoComp,
                                                  iVersaoFolha,
                                                  '2',
                                                  sCodigoNaturRendINSS, // '3533'
                                                inttostr(iIdInformeTRBINSS)]), []) Then
                                                Begin
                                                  // Carrega os dados particulares do IDINFORME processado no momento
                                                  _CarregaDadosDoIDINFORMEProcessado(2);
                                                end;

                                              If RegAtual2 <> Nil Then
                                                qryBenefCompMovFolhasProc.GotoBookmark(RegAtual2);

                                              // Gravando o IDINFORME 45 - Com valor vindo do 52
                                              _GravarDadosIRRF_Beneficiario(iIdInformeTRBINSS, iFontePagadora, (dValorCalculado45 * -1), 'C');

                                              // Gravando o IDINFORME 53 - (Parte dos proventos 65 anos ou mais INSS) com o valor absoluto do saldo a compensar
                                              _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, ABS(dValorCalculado45), 'C')
                                            end;

                                          end
                                          Else
                                          begin
                                            // Gravando o IDINFORME 52 - (Parte dos proventos 65 anos ou mais INSS) com o valor absoluto do saldo a compensar
                                            _GravarDadosIRRF_Beneficiario(iLinhaAcima65, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');
                                          end;

                                        end;
                                      end
                                      Else
                                      Begin
                                        // Gravando o IDINFORME com o valor do saldo a compensar
                                        if abs(dValorIDINFORMESaldoACompensar) <> 0 then  //edilaine - SIG81284
                                           _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');

                                      end;

                                      {
                                      // Caso o saldo a compensar seja MENOR do que o valor parametrizado do Idoso
                                      If (dValorIDINFORMESaldoACompensar < dValorDescontoIdosoParam) Then
                                        Begin
                                          If (iIdInformeCompensado = iLinhaAcima65) Then // 52 - Parte dos proventos 65 anos
                                            Begin
                                              // Guardando o Valor do saldo do 52 processado para ser usado no Compensa do 45 (se for o caso)
                                              dValorSaldo52_VindoDo49 := dValorIDINFORMESaldoACompensar;
                                              iVersaoFolhaSaldo52_Vindo59 := iVersaoFolha;

                                              // Caso não haja o lançamento do Rendimento INSS (45) no Movimento a Compensar,
                                              // então realizar os procedimentos abaixo
                                              RegAtual1 := qryBenefValoresACompensar.GetBookmark; // Salvando o ponteiro do Registro atual

                                              If (Not qryBenefValoresACompensar.Locate('NUMDOCUMENTO; FONTEPAGADORA; CODNATUREZA; IDINFORME', VarArrayOf([
                                                sCPFBeneficiarioSelecionadoComp,
                                                  '2',
                                                  sCodigoNaturRendINSS, // '3533'
                                                inttostr(iIdInformeTRBINSS)]), [])) Then // 45
                                                Begin
                                                  // Localizando o lançamento do IDINFORME 53 - (Parte dos proventos 65 anos ou mais INSS)
                                                  // no Movimento Compensado na Folha Corrente
                                                  RegAtual2 := qryBenefCompMovFolhasProc.GetBookmark; // Salvando o ponteiro do Registro atual

                                                  If qryBenefCompMovFolhasProc.Locate('NUMDOCUMENTO; IDHSTFOLHABENEF; FONTEPAGADORA; CODNATUREZA; IDINFORME', VarArrayOf([
                                                    sCPFBeneficiarioSelecionadoComp,
                                                      iVersaoFolha,
                                                      '2',
                                                      sCodigoNaturRendINSS, // '3533'
                                                    inttostr(iLinhaAcima65INSS)]), []) Then // 53
                                                    Begin
                                                      // Carrega os dados particulares do IDINFORME processado no momento
                                                      _CarregaDadosDoIDINFORMEProcessado(2);

                                                      dValorLocalizado53 := qryBenefCompMovFolhasProc.fieldbyname('VLRLANC').asFloat;

                                                      // Gravando o IDINFORME 53 - (Parte dos proventos 65 anos ou mais INSS) com o valor negativo
                                                      _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorLocalizado53 * -1, 'C');

                                                      // Calculando a diferença entre o valor do idoso menos o valor total lançado no 52
                                                      dValorCalculado := ROUNDCM(dValorDescontoIdosoParam - dValorSaldo52_VindoDo49, 2);
                                                      // Gravando o IDINFORME 53 - (Parte dos proventos 65 anos ou mais INSS) com o valor calculado
                                                      _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorCalculado, 'C');

                                                      // Calculando a diferença entre o saldo do calculo acima menos o valor total lançado no 53
                                                      dValorCalculado := ROUNDCM(dValorCalculado - dValorLocalizado53, 2);
                                                      // Gravando o IDINFORME 45 - (Rendimento INSS) com o valor calculado NEGATIVO
                                                      _GravarDadosIRRF_Beneficiario(iIdInformeTRBINSS, iFontePagadora, dValorCalculado * -1, 'C');
                                                    End
                                                  // Andre Imakawa - SIG 21776 - Inicio
                                                  // Caso não exista, lançar a diferença no IdInforme 53.
                                                  else
                                                    begin
                                                      If qryBenefCompMovFolhasProc.Locate('NUMDOCUMENTO; IDHSTFOLHABENEF; FONTEPAGADORA; CODNATUREZA; IDINFORME', VarArrayOf([
                                                        sCPFBeneficiarioSelecionadoComp,
                                                          iVersaoFolha,
                                                          '2',
                                                          sCodigoNaturRendINSS, // '3533'
                                                        inttostr(iIdInformeTRBINSS)]), []) Then // 53
                                                        Begin

                                                          dValorCalculado45 := _RetornaValorTotalIDINFORMENoMovProcessadoResp(iVersaoFolha, iIdInformeTRBINSS, iIdResponsavelAtual) ;

                                                          if dValorCalculado45 >= ROUNDCM(dValorIDINFORMECompensado - dValorIDINFORMESaldoACompensar, 2) then
                                                          begin
                                                            // Gravando o IDINFORME 45 com valor NEGATIVO para zerar seu valor original
                                                            _GravarDadosIRRF_Beneficiario(iIdInformeTRBINSS, iFontePagadora, dValorCalculado45 * -1, 'C');

                                                            // Gravando Diferença do IDINFORME 45 - (o que será lançado no IDINFORME 53)
                                                            _GravarDadosIRRF_Beneficiario(iIdInformeTRBINSS, iFontePagadora, (dValorCalculado45 - ROUNDCM(dValorIDINFORMECompensado - dValorIDINFORMESaldoACompensar, 2)) , 'C');

                                                            // Gravando a diferença entre o valor do saldo a compensar - valor compensado
                                                            _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, ROUNDCM(dValorIDINFORMECompensado - dValorIDINFORMESaldoACompensar, 2), 'C');

                                                          end
                                                          else
                                                          begin
                                                            // Gravando o IDINFORME 45 com valor NEGATIVO para zerar seu valor original
                                                            _GravarDadosIRRF_Beneficiario(iIdInformeTRBINSS, iFontePagadora, dValorCalculado45 * -1, 'C');

                                                            // Gravando a diferença entre o valor do saldo a compensar - valor compensado
                                                            _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorCalculado45, 'C');

                                                          end;


                                                        end;

                                                    End;
                                                  // Andre Imakawa - SIG 21776 - Fim
                                                      
                                                  If RegAtual2 <> Nil Then
                                                    qryBenefCompMovFolhasProc.GotoBookmark(RegAtual2); // Voltando ao Reg. atual
                                                End;

                                              If RegAtual1 <> Nil Then
                                                qryBenefValoresACompensar.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
                                            End;
                                        End;
                                      }
                                      // Andre Imakawa - SIG 50681 - Fim
                                      dValorIDINFORMESaldoACompensar := 0.00;

                                    End;
                                End;
                            End // Se o IDINFORME A Compensar for o (45 ou 142) e os Compensados forem os (45 ou 53 ou 55 ou 142 ou 167)
                          Else If
                                //SIG627233 -Inicio
                               //(iIdInformeACompensar In [iIdInformeTRBINSS, 142]) And
                               //(iIdInformeCompensado In [iIdInformeTRBINSS, iLinhaAcima65INSS, 142, iLinhaRendAcJud13])
                               ((iIdInformeACompensar In [iIdInformeTRBINSS]) And
                               (iIdInformeCompensado In [iIdInformeTRBINSS, iLinhaAcima65INSS, iLinhaMolINSS]))or
                               ((iIdInformeACompensar In [142]) And (iIdInformeCompensado In [ 142, iLinhaRendAcJud13]))and
                               //SIG627233 -fim
                            (sNaturezaACompensar = sCodigoNaturezaIndiv)  then// Natureza = 3533

                            Begin
                              dValorIDINFORMECompensado := _RetornaValorTotalIDINFORMENoMovProcessadoResp(iVersaoFolha, iIdInformeCompensado, sCPFBeneficiarioSelecionadoComp); // Andre Imakawa - SIG 50681
                              If (dValorIDINFORMESaldoACompensar <> 0.00) and ( dValorIDINFORMECompensado >0) Then // Andre Imakawa - SIG 50681
                                Begin
                                  dValorIDINFORMESaldoACompensar := ROUNDCM(dValorIDINFORMESaldoACompensar + dValorIDINFORMECompensado, 2);

                                  If dValorIDINFORMESaldoACompensar > 0 Then
                                    Begin
                                      If ROUNDCM(dValorIDINFORMECompensado, 2) = ROUNDCM(dValorIDINFORMESaldoACompensar + (dValorIDINFORMECompensado - dValorIDINFORMESaldoACompensar), 2) Then //  Andre Imakawa - SIG 21776
                                        Begin
										  // Andre Imakawa - SIG 50681 - Inicio
                                          if iIdInformeCompensado = iLinhaAcima65INSS then
                                          begin
                                            dValorCalculado52 := 0;
                                            dValorCalculado52 := _RetornaValorTotalIDINFORMENoMovProcessadoResp(iVersaoFolha, iLinhaAcima65, sCPFBeneficiarioSelecionadoComp) ;
                                            // Garantindo que o valor do saldo do 52 vindo do processamento do 49
                                            // seja somente usado para o processamento do 45 na mesma folha
                                            {
                                            If iVersaoFolha <> iVersaoFolhaSaldo52_Vindo59 Then
                                              Begin
                                                dValorSaldo52_VindoDo49 := 0.00;
                                                iVersaoFolhaSaldo52_Vindo59 := iVersaoFolha;
                                              End;
                                            }
                                            // Se houver saldo do 52 vindo do processamento do 49, então processa de forma especifica
                                            //If dValorSaldo52_VindoDo49 <> 0 Then
                                            if dValorCalculado52 <> 0 Then
                                              Begin
                                                // Se localizando o lançamento do IDINFORME 53 - (Parte dos proventos 65 anos ou mais INSS)
                                                // no Movimento Compensado na Folha Corrente
                                                dValorLocalizado53 := _RetornaValorTotalIDINFORMENoMovProcessadoResp(iVersaoFolha, iLinhaAcima65INSS, sCPFBeneficiarioSelecionadoComp) ;

                                                // Calculando o valor total lançado no 52 + o valor do 53 (caso este exista) na folha processada
                                                dValorTotaldo52e53 := ROUNDCM(dValorLocalizado53 + dValorCalculado52, 2);

                                                // Calculando a diferença entre o valor do idoso menos o valor total lançado no 52
                                                dValorCalculado := ROUNDCM(dValorDescontoIdosoParam - dValorTotaldo52e53, 2);

                                                If dValorCalculado > dValorIDINFORMECompensado Then
                                                  Begin
                                                    // Gravando o IDINFORME Compensado com valor NEGATIVO para zerar seu valor original
                                                    _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');

                                                    // Calculando a diferença entre o valor idoso menos o valor total lançado no 52 + o valor do 53 na folha processada
                                                    //dValorCalculado := ROUNDCM(dValorDescontoIdosoParam - dValorTotaldo52e53, 2);

                                                    If dValorCalculado > dValorIDINFORMESaldoACompensar Then
                                                      Begin
                                                        // Gravando o IDINFORME do Idoso (53 - Parte dos proventos 65 anos ou mais INSS) com o valor do saldo a compensar
                                                        _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');
                                                      End
                                                    Else
                                                      Begin
                                                        // Gravando o IDINFORME do Idoso (53 - Parte dos proventos 65 anos ou mais INSS)
                                                        // com o valor da diferença entre o valor do idoso menos o valor total lançado no 52
                                                        _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorCalculado, 'C');

                                                        // Gravando o IDINFORME Compensado com o saldo do IDINFORME a Compensar
                                                        dValorCalculado := ROUNDCM(dValorIDINFORMESaldoACompensar - dValorCalculado, 2);
                                                        _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorCalculado, 'C');
                                                      End;

                                                    dValorCalculado52 := 0.00;
                                                  End
                                                Else
                                                  Begin

                                                    if dValorIDINFORMESaldoACompensar >= dValorCalculado then
                                                      begin
                                                        // Gravando o IDINFORME do Idoso (53 - Parte dos proventos 65 anos ou mais INSS)
                                                        // com o valor da diferença entre o valor do idoso menos o valor total lançado no 52 e 53
                                                        _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorCalculado, 'C');

                                                        // Gravando o IDINFORME Compensado com o saldo do IDINFORME a Compensar
                                                        _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorCalculado * -1, 'C');

                                                        //dValorCalculado := ROUNDCM(dValorIDINFORMESaldoACompensar - dValorCalculado, 2);

                                                        // Gravando o IDINFORME Compensado com o valor do saldo a compensar
                                                        _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');
                                                      end
                                                    else
                                                      begin
                                                        // Gravando o IDINFORME Compensado com o valor do saldo a compensar
                                                        _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');

                                                        // Gravando o IDINFORME do Idoso (53 - Parte dos proventos 65 anos ou mais INSS)
                                                        // com o valor da diferença entre o valor do idoso menos o valor total lançado no 52 e 53
                                                        _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');

                                                        // Gravando o IDINFORME Compensado com o saldo do IDINFORME a Compensar
                                                        _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar * -1, 'C');
                                                      end;

                                                    If Not bSaldoFinalDo49ChegouAZero Then
                                                      Begin
                                                        // Gravando o IDINFORME Compensado com valor NEGATIVO para zerar seu valor original
                                                        _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');
                                                      End;
                                                  End;
                                              End
                                            Else
                                              Begin
                                                if bIdoso then
                                                begin

                                                  dValorLocalizado53 := 0;
                                                  dValorLocalizado53 := _RetornaValorTotalIDINFORMENoMovProcessadoResp(iVersaoFolha, iLinhaAcima65INSS, sCPFBeneficiarioSelecionadoComp) ;

                                                  //If dValorIDINFORMESaldoACompensar > dValorDescontoIdosoParam Then
                                                  If (dValorIDINFORMESaldoACompensar > dValorLocalizado53) Then
                                                    Begin
                                                      // Gravando o IDINFORME Compensado com valor NEGATIVO para zerar seu valor original
                                                      _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');


                                                      dValorCalculado := (dValorIDINFORMESaldoACompensar - dValorLocalizado53);

                                                      //
                                                      _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorLocalizado53, 'C');

                                                      //
                                                      _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorCalculado, 'C');
                                                    end
                                                  else
                                                    begin
                                                      // Gravando o IDINFORME Compensado com valor NEGATIVO para zerar seu valor original
                                                      _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');

                                                      // Gravando o IDINFORME Compensado com o valor do saldo a compensar
                                                      _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');
                                                    end;
                                                end
                                                else
                                                begin
                                                  // Gravando o IDINFORME Compensado com valor NEGATIVO para zerar seu valor original
                                                  _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');

                                                  // Gravando o IDINFORME Compensado com o valor do saldo a compensar
                                                  _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');
                                                end;

                                              End
                                          end
                                          else
                                          begin
                                            // Gravando o IDINFORME Compensado com valor NEGATIVO para zerar seu valor original
                                            _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');

                                            // Gravando o IDINFORME Compensado com o valor do saldo a compensar
                                            _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');
                                          end;
										// Andre Imakawa - SIG 50681 - Fim
                                        End
                                      Else
                                        Begin
                                          // Gravando o IDINFORME Compensado com valor NEGATIVO para zerar seu valor original
                                          _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');

                                          // Gravando o IDINFORME Compensado com o valor do saldo a compensar
                                          _GravarDadosIRRF_Beneficiario(iLinhaAcima65INSS, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');
                                        End;

                                      dValorIDINFORMESaldoACompensar := 0.00;

                                    End
                                  Else // Se o saldo for negativo, grava o lançamento e processa o próximo lançamento
                                    Begin
                                      // Gravando o IDINFORME Compensado com valor NEGATIVO para zerar seu valor original
                                      _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');

                                      // Situação para corrigir os casos em que restará residuos de centavos no saldo
                                      // devido as diferenças entre os lançamentos na folha, se isto não for corrigido
                                      // aqui, esta diferença fará com que a conta não feche, e o processamento
                                      // continue, lançando registros indevidos.
                                      // (ISTO É UMA DISTORÇÃO NOS DADOS VINDOS DA FOLHA)
                                      If (abs(ROUNDCM(dValorIDINFORMESaldoACompensar, 2)) = 0.01) Or
                                        (abs(dValorIDINFORMESaldoACompensar) = 0.02) Then
                                        dValorIDINFORMESaldoACompensar := 0.00;
                                    End;
                                End;
                            End
                          Else If ( ((iIdInformeACompensar = 37) And (iIdInformeCompensado = 37)) Or   // Andre Imakawa - SIG 62968
                            ((iIdInformeACompensar = 46) And (iIdInformeCompensado = 46)) Or

                            ((iIdInformeACompensar = 47) And (iIdInformeCompensado = 47)) Or   // Paulo Nobre - WO7147

                            ((iIdInformeACompensar = 50) And (iIdInformeCompensado = 50)) Or
                            ((iIdInformeACompensar = 51) And (iIdInformeCompensado = 51)) Or
                            ((iIdInformeACompensar = 54) And (iIdInformeCompensado = 54)) Or
                            ((iIdInformeACompensar = 55) And (iIdInformeCompensado = 55)) Or
                            ((iIdInformeACompensar = 56) And (iIdInformeCompensado In [56])) Or   // edilaine - SIG81284
                            ((iIdInformeACompensar = 60) And (iIdInformeCompensado = 60)) Or      // edilaine - SIG81990
                            ((iIdInformeACompensar = 61) And (iIdInformeCompensado In [61, 142])) Or
                            ((iIdInformeACompensar = 62) And (iIdInformeCompensado In [62, 141])) Or
                            ((iIdInformeACompensar = 67) And (iIdInformeCompensado In [67, 138])) Or // Alterado por FHBS - 14/11/2018 - SIG78120
                            //((iIdInformeACompensar = 75) And (iIdInformeCompensado In [75])) Or    //edilaine SIG96070
                            ((iIdInformeACompensar = 94) And (iIdInformeCompensado In [94])) Or    // edilaine - SIG81284
                            ((iIdInformeACompensar = 133) And (iIdInformeCompensado = 133)) Or     // Andre Imakawa - SIG 40166
                            ((iIdInformeACompensar = 138) And (iIdInformeCompensado In [138, 67])) Or // Andre Imakawa - SIG 36080 // Alterado por FHBS - 14/11/2018 - SIG78120
                            ((iIdInformeACompensar = 140) And (iIdInformeCompensado = 140)) Or     // Andre Imakawa - SIG 61755
                            ((iIdInformeACompensar = 141) And (iIdInformeCompensado In [62, 141])) Or   //edilaine SIG96359
                            ((iIdInformeACompensar = 161) And (iIdInformeCompensado = 161)) Or     // Andre Imakawa - SIG 59015
                            ((iIdInformeACompensar = 162) And (iIdInformeCompensado = 162)) Or     // edilaine SIG97844
                            ((iIdInformeACompensar = 166) And (iIdInformeCompensado In [166])) Or  // edilaine - SIG81284
                            ((iIdInformeACompensar = 168) And (iIdInformeCompensado In [168])) Or  // Alterado por FHBS - 21/02/2019 - SIG82481
			                      ((iIdInformeACompensar = 187) And (iIdInformeCompensado = 187)) Or     // Andre Imakawa - SIG 40166
                            ((iIdInformeACompensar = 188) And (iIdInformeCompensado In [188])) Or  // edilaine - SIG81008
                            ((iIdInformeACompensar = 189) And (iIdInformeCompensado In [189])) Or  // edilaine - SIG81990
                            ((iIdInformeACompensar = 194) And (iIdInformeCompensado In [194])) Or  // edilaine - SIG81284
                            ((iIdInformeACompensar = 195) And (iIdInformeCompensado In [195])) Or  // edilaine - SIG81008
                            ((iIdInformeACompensar = 197) And (iIdInformeCompensado In [197, 199])) Or // edilaine - SIG80964
                            ((iIdInformeACompensar = 199) And (iIdInformeCompensado In [197, 199])) Or // edilaine - SIG80964
                            ((iIdInformeACompensar = 201) And (iIdInformeCompensado = 201)) Or     // Andre Imakawa - SIG 35321
                            ((iIdInformeACompensar = 214) And (iIdInformeCompensado In [214])) Or  // edilaine - SIG81990
                            ((iIdInformeACompensar = 215) And (iIdInformeCompensado In [215])) Or    // edilaine - SIG81990
                            ((iIdInformeACompensar = 74) And (iIdInformeCompensado In [74])) //TAES - SIG93322

                            ) And (sNaturezaACompensar = sCodigoNaturezaIndiv)
                              and (bCompensaAcJud) Then      //edilaine SIG113550
                            Begin
                              dValorIDINFORMECompensado := _RetornaValorTotalIDINFORMENoMovProcessadoResp(iVersaoFolha, iIdInformeCompensado, sCPFBeneficiarioSelecionadoComp); // Andre Imakawa - SIG 50681
                              If (dValorIDINFORMESaldoACompensar <> 0.00) and ( dValorIDINFORMECompensado >0) Then // Andre Imakawa - SIG 50681
                                Begin
                                  // Se o Valor do IDINFORME a Compensar for MAIOR que o Valor do IDINFORME Compensado
                                  If abs(dValorIDINFORMESaldoACompensar) > abs(dValorIDINFORMECompensado) Then
                                    Begin
                                      If ((iIdInformeACompensar = 46) And (iIdInformeCompensado = 46)) Or
                                        //((iIdInformeACompensar = 75) And (iIdInformeCompensado = 75)) Or   //edilaine SIG96070
                                        ((iIdInformeACompensar = 161) And (iIdInformeCompensado = 161)) Or   // Andre Imakawa - SIG 59015
                                        ((iIdInformeACompensar = 162) And (iIdInformeCompensado = 162)) Or   // edilaine 97844
                                        ((iIdInformeACompensar = 140) And (iIdInformeCompensado = 140)) Or   // Andre Imakawa - SIG 61755
                                        ((iIdInformeACompensar = 37) And (iIdInformeCompensado = 37)) Or     // Andre Imakawa - SIG 62968

                                        ((iIdInformeACompensar = 188) And (iIdInformeCompensado In [188])) Or // Darivaldo - SIG81008
                                        ((iIdInformeACompensar = 195) And (iIdInformeCompensado In [195])) Or // Darivaldo - SIG81008

                                        ((iIdInformeACompensar = 94) And (iIdInformeCompensado In [94])) Or   // edilaine - SIG81284
                                        ((iIdInformeACompensar = 194) And (iIdInformeCompensado In [194])) Or // edilaine - SIG81284
                                        ((iIdInformeACompensar = 166) And (iIdInformeCompensado In [166])) Or // edilaine - SIG81284

                                        ((iIdInformeACompensar = 214) And (iIdInformeCompensado In [214])) Or // edilaine - SIG81990
                                        ((iIdInformeACompensar = 215) And (iIdInformeCompensado In [215])) Or // edilaine - SIG81990

                                        ((iIdInformeACompensar = 133) And (iIdInformeCompensado = 133)) Or  // Andre Imakawa - SIG 40166
                                        ((iIdInformeACompensar = 74) And (iIdInformeCompensado In [74])) //TAES - SIG93322
                                        then
                                        // Gravando o IDINFORME Compensado para zerar seu valor original
                                        _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado, 'C')
                                      Else If ((iIdInformeACompensar = 50) And (iIdInformeCompensado = 50)) Or
                                              ((iIdInformeACompensar = 51) And (iIdInformeCompensado = 51)) Then
                                        // Gravando o IDINFORME Compensado com seu valor ABSOLUTO
                                        _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, abs(dValorIDINFORMECompensado), 'C')
                                      //edilaine -  SIG80964 - inicio
                                      Else If ((iIdInformeACompensar = 197) And (iIdInformeCompensado In [197, 199])) Or
                                              ((iIdInformeACompensar = 199) And (iIdInformeCompensado In [197, 199])) Or
                                              ((iIdInformeACompensar = 168) And (iIdInformeCompensado In [168])) Or // Alterado por FHBS - 21/02/2019 - SIG82481
                                              ((iIdInformeACompensar = 60) And (iIdInformeCompensado = 60)) Or           // edilaine - SIG81990
                                              ((iIdInformeACompensar = 189) And (iIdInformeCompensado In [189]))      Or // edilaine - SIG81990
                                              ((iIdInformeACompensar = 56)  And (iIdInformeCompensado In [56])) Then     // edilaine - SIG81284
                                        // Gravando o IDINFORME Compensado para zerar seu valor original
                                        _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado * -1, 'C')
                                      //edilaine -  SIG80964 - fim
                                      Else
                                        // Gravando o IDINFORME Compensado para zerar seu valor original
                                        _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado * -1, 'C');

                                      dValorIDINFORMESaldoACompensar := ROUNDCM(dValorIDINFORMESaldoACompensar + dValorIDINFORMECompensado, 2);
                                    End
                                  Else // Valor do IDINFORME a Compensar for MENOR OU IGUAL ao Valor do IDINFORME Compensado
                                    Begin
                                      If ((iIdInformeACompensar = 46) And (iIdInformeCompensado = 46)) Or
                                        ((iIdInformeACompensar = 50) And (iIdInformeCompensado = 50)) Or
                                        ((iIdInformeACompensar = 51) And (iIdInformeCompensado = 51)) Or
                                        ((iIdInformeACompensar = 161) And (iIdInformeCompensado = 161)) Or   // Andre Imakawa - SIG 59015
                                        ((iIdInformeACompensar = 162) And (iIdInformeCompensado = 162)) Or   // edilaine 97844
                                        ((iIdInformeACompensar = 140) And (iIdInformeCompensado = 140)) Or   // Andre Imakawa - SIG 61755
                                        ((iIdInformeACompensar = 37) And (iIdInformeCompensado = 37)) Or     // Andre Imakawa - SIG 62968

                                        ((iIdInformeACompensar = 188) And (iIdInformeCompensado In [188])) Or //Darivaldo - SIG81008
                                        ((iIdInformeACompensar = 195) And (iIdInformeCompensado In [195])) Or //Darivaldo - SIG81008

                                        ((iIdInformeACompensar = 94) And (iIdInformeCompensado In [94])) Or   // edilaine - SIG81284
                                        ((iIdInformeACompensar = 166) And (iIdInformeCompensado In [166])) Or // edilaine - SIG81284

                                        ((iIdInformeACompensar = 214) And (iIdInformeCompensado In [214])) Or // edilaine - SIG81990
                                        ((iIdInformeACompensar = 215) And (iIdInformeCompensado In [215])) Or // edilaine - SIG81990

                                        ((iIdInformeACompensar = 133) And (iIdInformeCompensado = 133)) Or // Andre Imakawa - SIG 40166
                                        ((iIdInformeACompensar = 74) And (iIdInformeCompensado In [74])) //TAES - SIG93322
                                        then
                                        Begin
                                          // Gravando o IDINFORME Compensado com o valor do saldo a compensar ABSOLUTO
                                          _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, abs(dValorIDINFORMESaldoACompensar), 'C');
                                        End
                                        {//edilaine SIG96070 : inicio
                                      Else If ((iIdInformeACompensar = 75) And (iIdInformeCompensado = 75)) Then
                                        Begin
                                          // Gravando o IDINFORME Compensado com o valor do saldo a compensar NEGATIVO
                                          _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar * -1, 'C')
                                        End
                                        }//edilaine SIG96070 : fim
                                      Else If ((iIdInformeACompensar = 61) And (iIdInformeCompensado In [61, 142])) Or
                                        ((iIdInformeACompensar = 141) And (iIdInformeCompensado In [62, 141])) or       //edilaine SIG96359
                                        ((iIdInformeACompensar = 62) And (iIdInformeCompensado In [62, 141])) Then
                                        // Gravando o IDINFORME Compensado com o valor do saldo a compensar NEGATIVO
                                        _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C')
                                      //edilaine - SIG80964 - inicio
                                      Else If ((iIdInformeACompensar = 197) And (iIdInformeCompensado In [197, 199])) Or
                                              ((iIdInformeACompensar = 199) And (iIdInformeCompensado In [197, 199])) Or
                                              ((iIdInformeACompensar = 168) And (iIdInformeCompensado In [168])) Or // Alterado por FHBS - 21/02/2019 - SIG82481
                                              ((iIdInformeACompensar = 60) And (iIdInformeCompensado = 60)) Or             // edilaine - SIG81990
                                              ((iIdInformeACompensar = 189) And (iIdInformeCompensado In [189]))      Or   // edilaine - SIG81990
                                              ((iIdInformeACompensar = 194) And (iIdInformeCompensado In [194]))      Or   // edilaine - SIG81284
                                              ((iIdInformeACompensar = 56)  And (iIdInformeCompensado In [56])) Then       // edilaine - SIG81284
                                        // Gravando o IDINFORME Compensado com o valor do saldo a compensar NEGATIVO
                                        _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C')
                                      //edilaine - SIG80964 - fim

                                      // Paulo Nobre - WO7147 - Inicio
                                      Else If ((iIdInformeACompensar = 47) And (iIdInformeCompensado = 47)) Then // Pensão Alimentícia
                                      Begin
                                        // Gravando o IDINFORME Compensado com o valor do saldo a compensar ABSOLUTO
                                        _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, abs(dValorIDINFORMESaldoACompensar), 'C');

                                        //=====================================================================================================
                                        // Se foi compensado a Pensão no Titular, então torna-se necessário, também, lançar lançamentos
                                        // de contra-partida no movimento do Pensionista a fim de influenciar/abater no seu rendimento na DIRF
                                        //=====================================================================================================

                                        // Selecionando o id do Pensionista do Beneficiário Titular
                                        sSql := 'SELECT R.IDFAVORECIDO                  ' + #13#10 +
                                                'FROM RUBRICAINDIV R                    ' + #13#10 +
                                                'WHERE  R.FLGPENSAOALIM = 1             ' + #13#10 +
                                                '      AND R.FLGTPRUBMANUT = 1          ' + #13#10 +
                                                '      AND R.DATAFINAL IS NULL          ' + #13#10 +
                                                '      AND R.IDPESSOA = ' + IntToStr(iIdResponsavelAtual);
                                        CdsAux1.Data := GetDataPacket(sSql);

                                        iIdPensionistaGravar := CdsAux1.FieldByName('IDFAVORECIDO').AsInteger;

                                        //--------------------------------------------------------------------------
                                        // Rotina de "COMPENSA" para o Pensionista, pois o processo normal de
                                        // compesação não trata de Pensionistas.
                                        //
                                        // 1. Lançando um registro para zerar (anular) o Lançamento de devolução,
                                        //    que foi lançado junto com o do Beneficiário (Titular)
                                        //--------------------------------------------------------------------------
                                        // Gravando o IDINFORME Compensado com o valor do saldo a compensar ABSOLUTO
                                        If _GravarDadosIRRF_Pensionista(iIdPensionistaGravar, iIdInformeCompensado, iFontePagadora, abs(dValorIDINFORMESaldoACompensar), 'C') Then
                                           //-----------------------------------------------------------------------
                                           // 2. Lançando um registro para abater na folha do mês o valor devolvido
                                           //-----------------------------------------------------------------------
                                           // Gravando o IDINFORME Compensado com valor NEGATIVO para abater do valor do mês
                                           _GravarDadosIRRF_Pensionista(iIdPensionistaGravar, 97, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');

                                      // Paulo Nobre - WO7147 - Fim
                                      End
                                      Else
                                        // Gravando o IDINFORME Compensado com o valor do saldo a compensar ABSOLUTO e NEGATIVO
                                        _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, abs(dValorIDINFORMESaldoACompensar) * -1, 'C');

                                      dValorIDINFORMESaldoACompensar := 0.00;
                                    End;
                                End;
                            End
                            //edilaine SIG96070 : inicio
                          Else If (
                            ((iIdInformeACompensar = 75) And (iIdInformeCompensado In [75]))
                            ) And ((sNaturezaACompensar = sCodigoNaturezaIndiv) or
                                   ((sNaturezaACompensar <> sCodigoNaturezaIndiv) and (SaldoZerado(sNaturezaACompensar, '75'))) ) Then
                            Begin
                              dValorIDINFORMECompensado := _RetornaValorTotalIDINFORMENoMovProcessadoResp(iVersaoFolha, iIdInformeCompensado, sCPFBeneficiarioSelecionadoComp); // Andre Imakawa - SIG 50681
                              If (dValorIDINFORMESaldoACompensar <> 0.00) and ( dValorIDINFORMECompensado >0) Then
                                Begin
                                  // Se o Valor do IDINFORME a Compensar for MAIOR que o Valor do IDINFORME Compensado
                                  If abs(dValorIDINFORMESaldoACompensar) > abs(dValorIDINFORMECompensado) Then
                                    Begin
                                      // Gravando o IDINFORME Compensado para zerar seu valor original
                                      _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMECompensado, 'C');

                                      dValorIDINFORMESaldoACompensar := ROUNDCM(dValorIDINFORMESaldoACompensar + dValorIDINFORMECompensado, 2);
                                    End
                                  Else // Valor do IDINFORME a Compensar for MENOR OU IGUAL ao Valor do IDINFORME Compensado
                                    Begin
                                      // Gravando o IDINFORME Compensado com o valor do saldo a compensar NEGATIVO
                                      _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar * -1, 'C');

                                      dValorIDINFORMESaldoACompensar := 0.00;
                                    End;
                                End;
                            End;
                            //edilaine SIG96070 : fim

                          // Próximo Lançamento do Movimento das Folhas a Compensar
                          qryBenefCompMovFolhasProc.Next;

                        End;

                      // Última rotina antes do próximo Valor A Compensar
                      // Caso sobre saldo nos IDINFORMES abaixo, estes deverão
                      // ser lançados com sinal positivo como sendo os
                      // IDINFORMES 49 ou 52 ou 62.
                      // Andre Imakawa - SIG 38458 - Inicio
                      // Add Informe 55 - Alterado processo para Informe 45 e 55
                      // Andre Imakawa - SIG 50681 - ADD 49
                      If (iIdInformeACompensar In [45, 55, 46, 75, 49]) Then
                        Begin

                          If dValorIDINFORMESaldoACompensar < 0 Then
                            Begin
                              If iIdInformeACompensar in[45, 55] Then
                              Begin
                                if iIdInformeACompensar = 45 then
                                begin
                                  iCont := 0;
                                  while (iCont < 2) and (dValorIDINFORMESaldoACompensar < 0) do
                                  begin
                                    if iCont = 0 then
                                      _ProcessaCompensaFaltouZerar(iIdInformeTRBFUNCEF)
                                    else
                                      _ProcessaCompensaFaltouZerar(iLinhaAcima65);
                                    iCont := iCont + 1;
                                  end;

                                end
                                else if iIdInformeACompensar = 55 then
                                  _ProcessaCompensaFaltouZerar(0);
                              end // Andre Imakawa - SIG 50681 - Inicio
                              Else If iIdInformeACompensar in[49] Then
                              Begin
                                if iIdInformeACompensar = 49 then
                                begin
                                  iCont := 0;
                                  while (iCont < 2) and (dValorIDINFORMESaldoACompensar < 0) do
                                  begin
                                    if iCont = 0 then
                                      _ProcessaCompensaFaltouZerar(iIdInformeTRBINSS)
                                    else
                                      _ProcessaCompensaFaltouZerar(iLinhaAcima65INSS);
                                    iCont := iCont + 1;
                                  end;

                                end
                              end
                              {
                              Else if  iIdInformeACompensar = 46 then
                              // Andre Imakawa - SIG 38458 - Fim
                                Begin
                                  // Localizando a existência do lançamento do (49 ou 52), nas folhas a processar, pois neste
                                  // caso, os saldos do 45 ou 46 deverá ser lançado como 49 ou 52. Caso não encontre, é porque só
                                  // tem o valor negativo mesmo, então neste caso não lança nada.
                                  RegAtual1 := qryBenefCompMovFolhasProc.GetBookmark; // Salvando o ponteiro do Registro atual

                                  If (qryBenefCompMovFolhasProc.Locate('NUMDOCUMENTO; IDHSTFOLHABENEF; FONTEPAGADORA; CODNATUREZA; IDINFORME', VarArrayOf([
                                    sCPFBeneficiarioSelecionadoComp,
                                      inttostr(iVersaoFolha),
                                      '1',
                                      sCodigoNaturRendFUNCEF, // '3540'
                                    inttostr(iIdInformeTRBFUNCEF)]), [])) Or // 49
                                  (qryBenefCompMovFolhasProc.Locate('NUMDOCUMENTO; IDHSTFOLHABENEF; FONTEPAGADORA; CODNATUREZA; IDINFORME', VarArrayOf([
                                    sCPFBeneficiarioSelecionadoComp,
                                      inttostr(iVersaoFolha),
                                      '1',
                                      sCodigoNaturRendFUNCEF, // '3540'
                                    inttostr(iLinhaAcima65)]), [])) Then // 52
                                    Begin
                                      // Carrega os dados particulares do IDINFORME localizado (49 ou 52)
                                      _CarregaDadosDoIDINFORMEProcessado(2);

                                      // Gravando o IDINFORME Compensado com o valor do saldo a compensar NEGATIVO para anular
                                      _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar * -1, 'C');
                                    End;

                                  If RegAtual1 <> Nil Then
                                    qryBenefCompMovFolhasProc.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
                                End
                              Else If iIdInformeACompensar = 75 Then
                                Begin
                                  // Localizando a existência do lançamento do (62) 13º SALARIO FUNCEF, nas folhas
                                  // a processar, pois neste caso o saldo do 75 deverá ser lançado como 62, caso
                                  // não encotre, é porque só tem o valor negativo mesmo, então neste caso não lança nada.
                                  RegAtual1 := qryBenefCompMovFolhasProc.GetBookmark; // Salvando o ponteiro do Registro atual

                                  If qryBenefCompMovFolhasProc.Locate('NUMDOCUMENTO; IDHSTFOLHABENEF; FONTEPAGADORA; CODNATUREZA; IDINFORME', VarArrayOf([
                                    sCPFBeneficiarioSelecionadoComp,
                                      inttostr(iVersaoFolha),
                                      '1',
                                      sCodigoNaturRendFUNCEF, // '3540'
                                    inttostr(iIdInforme13FUNCEF)]), []) Then // 62
                                    Begin
                                      // Carrega os dados particulares do IDINFORME localizado (62)
                                      _CarregaDadosDoIDINFORMEProcessado(2);

                                      // Gravando o IDINFORME Compensado com o valor do saldo a compensar NEGATIVO para anular
                                      _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar * -1, 'C');
                                    End;

                                  If RegAtual1 <> Nil Then
                                    qryBenefCompMovFolhasProc.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
                                End
                                }
                                // Andre Imakawa - SIG 50681 - Fim
                            End
                          Else
                            Begin
							  // Andre Imakawa - SIG 50681 - Inicio
                              if dValorIDINFORMESaldoACompensar > 0 then
                              begin
                                // Gravando o IDINFORME Compensado com o valor do saldo a compensar NEGATIVO para anular
                                _GravarDadosIRRF_Beneficiario(iIdInformeCompensado, iFontePagadora, dValorIDINFORMESaldoACompensar * -1, 'C');
                              end;
							  // Andre Imakawa - SIG 50681 - Fim
                            End;
                        End;

                      // Próximo Valor a Compensar
                      qryBenefValoresACompensar.Next;

                    End;

                  // Última rotina antes do próximo Beneficiário selecionado
                  // Iniciando o loop em uma query que tras os Valores a Compensar
                  // aberto por folha para zerar os valores originais
                  qryBenefValoresACompensarPorFolha.Close;
                  qryBenefValoresACompensarPorFolha.Open;
                  qryBenefValoresACompensarPorFolha.First;
                  While Not qryBenefValoresACompensarPorFolha.EOF Do
                    Begin
                      // Carrega os dados particulares do IDINFORME processado
                      _CarregaDadosDoIDINFORMEProcessado(1);

                      // Gravando o IDINFORME A Compensar com seu valor original POSITIVO para anular
                      _GravarDadosIRRF_Beneficiario(iIdInformeACompensar, iFontePagadora, dValorIDINFORMESaldoACompensar, 'C');

                      qryBenefValoresACompensarPorFolha.Next;
                    End;

                  qryBenefValoresACompensarPorFolha.Close;
                End;
            End;
        End;

      // Próximo Beneficiário Selecionado
      cdsBenefSelecionadoCompensa.Next;
    End;

  gProgresso.Progress := 0;
End;
// Paulo Nobre - SIG 21776 - Fim

// ------------------------------------------------------------------------------------------
//
// ------------------------------ FIM DAS ROTINAS DO COMPENSA -------------------------------
//
// ------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------
//
// ---------------------------------  ROTINAS DA QUITAÇÃO  ----------------------------------
//
// ------------------------------------------------------------------------------------------
//
// O Evento denominado de "QUITAÇÃO", é um processamento a ser realizado somente após o
// fechamento das BUSCAS dos Beneficiários dentro de um exercício. Entrará na avaliação deste
// o movimento até a última folha encontrada de cada Beneficiário, sendo que os resultados
// desta, serão lançados nesta última folha. Basicamente Compreende em fazer uma análise da
// situação dos lançamentos de cada Beneficiário dentro do ano, objetivando efetuar acertos
// (contra-partidas) em cima da avaliação dos diversos adiantamentos do 13º.
//

Procedure TCtrlBUSCA_DIRFFolhaBeneficios._ProcessarMovimentoDaQUITACAO(cdsBenefSelecionadoQuitacao: TClientDataSet; gProgresso: TGauge);
Var RegAtual: TBookMark;

  Procedure _CarregaDadosGeraisDoIdResponsavelDaQUITACAO;
  Var dDataComparaIdade: double;
    dtDataFimMolGrave: TDateTime;
  Begin
    dValorSemIdadeIdoso := 0.00;
    dTotalIdInforme13INSS := 0.00; // 61

    sDataIniMolGrave := '';
    sDataFimMolGrave := '';
    iVersaoFolha := cdsBenefSelecionadoQuitacao.fieldbyname('ULTIMA_VERSAO_FOLHA').asInteger; // Compatibilizar com a função de gravação dos dados
    iVersaoUltimaFolha := cdsBenefSelecionadoQuitacao.fieldbyname('ULTIMA_VERSAO_FOLHA').asInteger;
    dtDataPagtoUltimaFolha := cdsBenefSelecionadoQuitacao.FieldByName('ULTIMA_DATA_PAGTO').AsDateTime;

    If Not CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAINIMOLGRAVE').isnull Then
      sDataIniMolGrave := FormatDateTime('dd/mm/yyyy', CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAINIMOLGRAVE').asDateTime);
    If Not CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').isnull Then
      sDataFimMolGrave := FormatDateTime('dd/mm/yyyy', CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').asDateTime);

    // Testando se o Beneficiário entrou em condição de IDOSO até o último dia de pagamento do mês da última folha
    DecodeDate(cdsBenefSelecionadoQuitacao.FieldByName('ULTIMA_DATA_PAGTO').AsDateTime, iAno, iMes, iDia);
    dDataComparaIdade := DiasUteis.UltDiaMes(iAno, strtoint(sMesPadraoPagto13FUNCEF));
    iIdadeAtual := DiasUteis.IntervaloMeses(cdsBenefSelecionadoQuitacao.fieldByname('DATANASC').asDateTime, dDataComparaIdade) Div 12;
    bBeneficiarioIdoso := ((cdsBenefSelecionadoQuitacao.fieldByname('DATANASC').asDateTime <> 0) And (iIdadeAtual >= iIdadeBenefParam));
    //
    // Avaliando o estado de isenção por Moléstia Grave do Beneficiário no exercício
    //
    bBeneficiarioISENTO_TOTALPorMolGrave := False;
    bBeneficiarioISENTO_PARCIALPorMolGrave := False;
    bBenefISENTOMasComMolGraveInicioExercicio := False;
    bBenefEmMolGraveNoMesPadraoPagto13FUNCEF := False;
    // Testando se Beneficiário NÃO está totalmente isento durante o exercício
    If Not (((CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAINIMOLGRAVE').IsNull) And
      (CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').Isnull)) Or
      // OU Se data de inicio e fim (com valor) ocorram antes do exercício
      ((CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAINIMOLGRAVE').AsDateTime < DtInicioExercicio) And
      ((Not CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').isNull) And
      (CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').AsDateTime < DtInicioExercicio))) Or
      // OU Se data de inicio ocorra depois do exercício
      (CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAINIMOLGRAVE').AsDateTime > DtFimExercicio) Or
      // OU Se data de inicio e fim (sem valor) ocorram antes do exercício
      ((CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAINIMOLGRAVE').AsDateTime < DtInicioExercicio) And
      (CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').isNull))) Then
      Begin
        // Testando se a isenção ocorreu na data de início do exercício e a data de
        // fim não foi informada ou está com uma data superior a data do exercicio
        sAnoMesDtIniMolGrave := FormatDateTime('yyyymm', CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAINIMOLGRAVE').AsDateTime);
        sAnoMesInicioExercicio := FormatDateTime('yyyymm', DtInicioExercicio);
        If ((sAnoMesDtIniMolGrave <= sAnoMesInicioExercicio) And   // Andre Imakawa - SIG 58893
          ((CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').Isnull) Or
          (CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').AsDateTime >= DtFimExercicio))) Then
          Begin
            // ISENÇÃO TOTAL durante o exercício
            bBeneficiarioISENTO_TOTALPorMolGrave := True;
            bBenefISENTOMasComMolGraveInicioExercicio := True;
          End
        Else
          Begin
            //edilaine SIG96014 : inicio
            If (sAnoMesDtIniMolGrave <= sAnoMesInicioExercicio) And
               (CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').AsDateTime < strtodate('01/' + sMesPadraoPagto13FUNCEF + '/' + FormatDateTime('yyyy', dtDataPagtoUltimaFolha))) then
            Begin
              // ISENÇÃO no incício do período
              bBenefISENTOMasComMolGraveInicioExercicio := True;
            End;
            //edilaine SIG96014 : fim

            // Andre Imakawa - SIG 61911 - Inicio
               //SIG78778 -Inicio
               //if (CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').Isnull)then
            if (CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').Isnull)or
               (CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').AsDateTime >= DtFimExercicio)or
               (CdsMovIndividualIdResponsavelQuitacao.fieldByname('dtpagamentofolha').AsDateTime <=
                CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').AsDateTime)
               //SIG78778 -FIm
            then
              if (CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAINIMOLGRAVE').AsDateTime <= strtodate('16/' + sMesPadraoPagto13FUNCEF + '/' + FormatDateTime('yyyy', dtDataPagtoUltimaFolha))) then
                bBeneficiarioISENTO_PARCIALPorMolGrave := True
              else
                bBeneficiarioISENTO_PARCIALPorMolGrave := False
            else
              Begin
                if ((CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').AsDateTime) <= strtodate('16/' + sMesPadraoPagto13FUNCEF + '/' + FormatDateTime('yyyy', dtDataPagtoUltimaFolha))) and
                   ((CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').AsDateTime) >= DtInicioExercicio) Then
                  bBeneficiarioISENTO_PARCIALPorMolGrave := True
                else
                  bBeneficiarioISENTO_PARCIALPorMolGrave := False;
              End;
            {
            // Andre Imakawa - SIG 58893 Inicio
            If (CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAINIMOLGRAVE').AsDateTime <= strtodate('16/' + sMesPadraoPagto13FUNCEF + '/' + FormatDateTime('yyyy', dtDataPagtoUltimaFolha))) and
               (((CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').AsDateTime) > strtodate('16/' + sMesPadraoPagto13FUNCEF + '/' + FormatDateTime('yyyy', dtDataPagtoUltimaFolha))) or
               (CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').Isnull) ) Then
            // André Imakawa - SIG 19498 - Inicio
            //If ((CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').AsDateTime) > strtodate('16/' + sMesPadraoPagto13FUNCEF + '/' + FormatDateTime('yyyy', dtDataPagtoUltimaFolha))) Then // Andre Imakawa - SIG 58893
            //  bBeneficiarioISENTO_PARCIALPorMolGrave := False // Andre Imakawa - SIG 58893
              bBeneficiarioISENTO_PARCIALPorMolGrave := True
            Else
              // ISENÇÃO PARCIAL durante o exercício
              //bBeneficiarioISENTO_PARCIALPorMolGrave := True; // Andre Imakawa - SIG 58893
              bBeneficiarioISENTO_PARCIALPorMolGrave := False;
            // André Imakawa - SIG 19498 - Fim
            // Andre Imakawa - SIG 58893 Fim
            }
            // Andre Imakawa - SIG 61911 - Fim

            // Testando se a isenção ocorreu no mês padrão (Novembro) de quitação
            sAnoMesPadraoQuitacao := FormatDateTime('yyyy', dtDataPagtoUltimaFolha) + sMesPadraoPagto13FUNCEF;
            sAnoMesDtIniMolGrave := '';
            dtDataFimMolGrave := strtodate('31/12/9999');
            If Not CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAINIMOLGRAVE').IsNull Then // Data de Inicio da Moléstia
              Begin
                sAnoMesDtIniMolGrave := FormatDateTime('yyyymm', CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAINIMOLGRAVE').AsDateTime);
                If Not CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').IsNull Then
                  dtDataFimMolGrave := CdsMovIndividualIdResponsavelQuitacao.fieldByname('DATAFIMMOLGRAVE').AsDateTime;

                bBenefEmMolGraveNoMesPadraoPagto13FUNCEF := ((sAnoMesPadraoQuitacao >= sAnoMesDtIniMolGrave) And (dtDataPagtoUltimaFolha <= dtDataFimMolGrave));
              End;
          End;
      End;
  End;

Begin
  // Flag usado para não deixar ficar gravando toda hora o arquivo com o texto dos SQLs
  bFlgGravaSQLSomenteUmaVez := True;

  DecodeDate(cdsBenefSelecionadoQuitacao.FieldByName('ULTIMA_DATA_PAGTO').AsDateTime, iAno, iMes, iDia);
  DtInicioExercicio := strtodate('01/01/' + inttostr(iAno));
  DtFimExercicio := strtodate('31/12/' + inttostr(iAno));

  TipoOperacao := tpQuitacao;    //edilaine - SIG96080

  // Localiza parâmetros gerais p/ o processamento
  If _LocalizaParametrosParaProcessamentoQUITACAO(DtFimExercicio) Then
    Begin
      // Começando o loop de processamento de todos os Beneficiários marcados na grid
      cdsBenefSelecionadoQuitacao.First;
      gProgresso.Progress := 0;
      gProgresso.MinValue := 0;
      sCPFBeneficiarioSelecionadoQuita := ''; // Paulo Nobre - SIG 35148
      iIdResponsavelAtual := 0; // Paulo Nobre - SIG 35148
      gProgresso.MaxValue := cdsBenefSelecionadoQuitacao.RecordCount;
      While Not cdsBenefSelecionadoQuitacao.EOF Do
        Begin
          // Processa somente os Beneficiários Marcados
          If cdsBenefSelecionadoQuitacao.fieldbyname('MARCADO').asString = 'S' Then
            Begin
              // Processa se Movimento do Beneficiário NÃO foi quitado
              If cdsBenefSelecionadoQuitacao.fieldbyname('TEM_QUITACAO').asString = 'Não' Then
                Begin
                  gProgresso.Progress := gProgresso.Progress + 1;
                  sAnoExercicio := cdsBenefSelecionadoQuitacao.fieldbyname('ANO_EXERCICIO').asString; // Andre Imakawa - SIG 35148

                  // Selecionando o(s) IDRESPONSAVEL(EIS) do CPF
                  If _SelecionaIdResponsaveisDoCPFQuitacao(
                    cdsBenefSelecionadoQuitacao.fieldbyname('NUMDOCUMENTO').asString,
                    //cdsBenefSelecionadoQuitacao.fieldbyname('ULTIMA_VERSAO_FOLHA').asString // Andre Imakawa - SIG 35148
                    sAnoExercicio) Then // Andre Imakawa - SIG 35148
                    Begin
                      bTeveUmIDRespComCalculoDeAcaoJudicial := False;

                      // Processando o(s) IDRESPONSAVEL(EIS) do CPF
                      CdsIDResponsavelDoCPFProcessado.First;
                      While Not CdsIDResponsavelDoCPFProcessado.EOF Do
                        Begin
                          sCPFBeneficiarioSelecionadoQuita := CdsIDResponsavelDoCPFProcessado.FieldByName('NUMDOCUMENTO').AsString;
                          iIdResponsavelAtual := CdsIDResponsavelDoCPFProcessado.FieldByName('IDBENEFIRRF').AsInteger;

                          // Selecionando o movimento do IdResponsavel do Beneficiário referente aos IdInformes selecionáveis p/ quitação
                          If _SelecionarMovIndivBeneficiarioQUITACAO(sAnoExercicio, iIdResponsavelAtual,
                                  CdsIDResponsavelDoCPFProcessado.FieldByName('FontePagadora').AsInteger // Alterado por FHBS - 21/02/2019 - SIG82481
                                  ) Then
                            Begin
                              // Carrega dados gerais do IDRESPONSAVEL
                              _CarregaDadosGeraisDoIdResponsavelDaQUITACAO;

                              // Analisando a situação do processo judicial, se o fim do processo ocorreu antes ou durante
                              // ou após o mês padrão de quitação

                              // Andre Imakawa - SIG 39948 - Inicio
                              // Conforme alinhamento com Tiago, a data para verificação da ação judicial para os movimetnos de
                              // Quitação deve ser o primeiro dia de novembro e o ultimo dia de novembro
                              //_AnalisaPeriodicidadeAcaoJudicialQuitacao(iIdResponsavelAtual, DtInicioExercicio, DtFimExercicio);
                              _AnalisaPeriodicidadeAcaoJudicialQuitacao(iIdResponsavelAtual, strtodate('01/11/' + inttostr(iAno)), strtodate('30/11/' + inttostr(iAno)));
                              // Andre Imakawa - SIG 39948 - Fim


                              //
                              // -----------------------  INICIO DA AVALIAÇÃO DA QUITAÇÃO ------------------------------
                              //
                              CdsMovIndividualIdResponsavelQuitacao.First;
                              While Not CdsMovIndividualIdResponsavelQuitacao.EOF Do
                                Begin
                                  // Andre Imakawa - SIG 58896 - Inicio
                                  if CdsMovIndividualIdResponsavelQuitacao.fieldbyname('TOTVLRLANC').asFloat <= 0 then
                                  begin
                                    CdsMovIndividualIdResponsavelQuitacao.Next;
                                    Continue;
                                  end;
                                  // Andre Imakawa - SIG 58896 - Fim
                                  
                                  // Localizando os dados do IDINFORME processado no momento
                                  _CarregaDadosDoIDINFORMEParaQuitacao(dtDataPagtoUltimaFolha);

                                  // Beneficiário Não ISENTO TOTAL
                                  If (Not bBeneficiarioISENTO_TOTALPorMolGrave) Then
                                    Begin
                                      // Beneficiário PARCIAL
                                      If (bBeneficiarioISENTO_PARCIALPorMolGrave) Then
                                        Begin
                                          //
                                          // Flag usada apenas para não ficar dando os locates abaixo de forma desnecessária
                                          If Not bBenefISENTOMasComMolGraveInicioExercicio Then
                                            Begin
                                              //
                                              // Beneficiário nao tem ISENÇÃO iniciada (não exatamente no mês de janeiro) e terminada dentro do exercício.
                                              //
                                              // Identificando se o IDINFORME processado no momento tem um IDINFORME de
                                              // contra-partida na tabela DE/PARA para Moléstia grave (IDSITUACAO = 1)
                                              //
                                              // Paulo Nobre SOL 268775 PPM 1268748
                                              // Localizando primeiro pelo IDINFORME de ORIGEM

                                              If CdsInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf(['1', Inttostr(iIdInformeAvaliacao)]), []) Then
                                                Begin
                                                  RegAtual := CdsMovIndividualIdResponsavelQuitacao.GetBookmark; // Salvando o ponteiro do Registro atual

                                                  // Se existir o IDINFORME de DESTINO no movimento processado, é porque praticamente
                                                  // houve Isenção no período então faz a avaliação p/ quitação
                                                  If (CdsMovIndividualIdResponsavelQuitacao.Locate('codnatureza;idinforme;idbenefirrf', VarArrayOf([sCodigoNaturezaIndiv, CdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsString, iIdResponsavelAtual]), [])) And  // Andre Imakawa - SIG 58893
                                                  (Not _VerificandoOcorrenciaDoIDINFORMENoMovProcessadoResp(iVersaoUltimaFolha, CdsInformeDePara.FieldByName('IDINFORMEORIGEM').AsInteger, iIdResponsavelAtual, iIdPlanoPrev)) Then // Andre Imakawa - SIG 19498 // Andre Imakawa - SIG 58893 // Andre Imakawa - SIG 59382
                                                    Begin
                                                      dValorIDINFORMEDestino := CdsMovIndividualIdResponsavelQuitacao.fieldbyname('TOTVLRLANC').asFloat;

                                                      // Paulo Nobre SOL 269300 PPM 1293033
                                                      // Paulo Nobre SOL 269130 PPM 1284502
                                                      // A isenção não ocorreu antes do mês padrão de Quitação
                                                      If Not bBenefEmMolGraveNoMesPadraoPagto13FUNCEF Then
                                                        Begin
                                                          // Beneficiário ISENTO PARCIALMENTE no Exercício. A isenção ocorreu
                                                          // antes do mês de Quitação, sendo assim, deve haver o cálculo.
                                                          _ProcessaCalculoDosRendimentosQuitacao(dValorIDINFORMEDestino, iQtdDeParcelasDoInformeQuitacao);

                                                          //If Not _VerificandoOcorrenciaDoIDINFORMENoMovProcessadoResp(iVersaoUltimaFolha, CdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger, iIdResponsavelAtual, iIdPlanoPrev) Then // Andre Imakawa - SIG 59382 // Andre Imakawa - SIG 61911
                                                            // Gravando o IDINFORME ORIGEM como IDINFORME DESTINO
                                                            _GravarDadosIRRF_Beneficiario(CdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger, iFontePagadora, dValorTotalIDINFORMEQuitacao, 'Q');
                                                        End
                                                      Else
                                                        Begin
                                                          // Gravando a Contra-partida do IDINFORME lido no momento para anular parcelas lançadas de adiantamento
                                                          _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');
                                                          // Andre Imakawa - SIG 58893 Inicio
                                                          // Gravando o IDINFORME ORIGEM como IDINFORME DESTINO
                                                          _GravarDadosIRRF_Beneficiario(CdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger, iFontePagadora, dValorTotalIDINFORMEQuitacao, 'Q');
                                                          // Andre Imakawa - SIG 58893 Fim
                                                        End;
                                                    End
                                                  Else
                                                    Begin
                                                      // Não encontra o lançamento DE/PARA de Destino, então processa o cálculo da quitação
                                                      _ProcessaCalculoDosRendimentosQuitacao(0.00, iQtdDeParcelasDoInformeQuitacao);
                                                    End;

                                                  // Andre Imakawa - SIG 19498 - Inicio
                                                  If RegAtual <> Nil Then
                                                    CdsMovIndividualIdResponsavelQuitacao.GotoBookmark(RegAtual); // Voltando ao Reg. atual
                                                  // Andre Imakawa - SIG 19498 - Fim
                                                End;
                                            // Andre Imakawa - SIG 58893 Inicio
                                            {
                                            Else
                                                Begin
                                                  // Localizando em segundo pelo IDINFORME de DESTINO
                                                  If CdsInformeDePara.Locate('IDSITUACAO; IDINFORMEDESTINO', VarArrayOf(['1', Inttostr(iIdInformeAvaliacao)]), []) Then
                                                    Begin
                                                      RegAtual := CdsMovIndividualIdResponsavelQuitacao.GetBookmark; // Salvando o ponteiro do Registro atual

                                                      // Se existir o IDINFORME de ORIGEM no movimento processado, é porque praticamente
                                                      // houve Isenção no período então faz a avaliação p/ quitação
                                                      If CdsMovIndividualIdResponsavelQuitacao.Locate('codnatureza;idinforme', VarArrayOf([sCodigoNaturezaIndiv, CdsInformeDePara.FieldByName('IDINFORMEORIGEM').AsString]), []) Then
                                                        Begin
                                                          dValorIDINFORMEOrigem := CdsMovIndividualIdResponsavelQuitacao.fieldbyname('TOTVLRLANC').asFloat;

                                                          // A isenção não ocorreu antes do mês padrão de Quitação
                                                          If Not bBenefEmMolGraveNoMesPadraoPagto13FUNCEF Then
                                                            Begin
                                                              // Gravando o IDINFORME lido no momento para anular parcelas lançadas de adiantamento
                                                              _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');

                                                              // Gravando o IDINFORME IDINFORME DESTINO como IDINFORME ORIGEM
                                                              _GravarDadosIRRF_Beneficiario(CdsInformeDePara.FieldByName('IDINFORMEORIGEM').AsInteger, iFontePagadora, dValorTotalIDINFORMEQuitacao, 'Q');
                                                            End
                                                          Else
                                                            Begin
                                                              // Paulo Nobre - SIG 21776
                                                              // Paulo Nobre - SIG 35148

                                                              // Gravando o IDINFORME IDINFORME ORIGEM como IDINFORME DESTINO
                                                              _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorIDINFORMEOrigem, 'Q');

                                                              // Gravando a Contra-partida do IDINFORME lido no momento para anular parcelas lançadas de adiantamento
                                                              // _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');
                                                            End;
                                                        End
                                                      Else
                                                        Begin
                                                          // Gravando o IDINFORME lido no momento com seu Valor Normal
                                                          _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao, 'Q');
                                                        End;

                                                      If RegAtual <> Nil Then
                                                        CdsMovIndividualIdResponsavelQuitacao.GotoBookmark(RegAtual); // Voltando ao Reg. atual
                                                    End;
                                                End;
                                              }
                                              // Andre Imakawa - SIG 58893 Fim
                                            End
                                          ELSE   //edilaine SIG96014 : inicio
                                            Begin
                                              // Beneficiário tem ISENÇÃO iniciada (não exatamente no mês de janeiro) e terminada dentro do exercício.
                                              //
                                              // Identificando se o IDINFORME processado no momento tem um IDINFORME de
                                              // contra-partida na tabela DE/PARA para Moléstia grave (IDSITUACAO = 1)
                                              If CdsInformeDePara.Locate('IDSITUACAO; IDINFORMEORIGEM', VarArrayOf(['1', Inttostr(iIdInformeAvaliacao)]), []) Then
                                                begin

                                                  //edilaine - SIG97260 : inicio
                                                  RegAtual := CdsMovIndividualIdResponsavelQuitacao.GetBookmark;

                                                  If (CdsMovIndividualIdResponsavelQuitacao.Locate('codnatureza;idinforme;idbenefirrf', VarArrayOf([sCodigoNaturezaIndiv, CdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsString, iIdResponsavelAtual]), [])) And
                                                    (Not _VerificandoOcorrenciaDoIDINFORMENoMovProcessadoResp(iVersaoUltimaFolha, CdsInformeDePara.FieldByName('IDINFORMEORIGEM').AsInteger, iIdResponsavelAtual, iIdPlanoPrev)) Then
                                                    begin
                                                      dValorIDINFORMEDestino := CdsMovIndividualIdResponsavelQuitacao.fieldbyname('TOTVLRLANC').asFloat;

                                                      If Not bBenefEmMolGraveNoMesPadraoPagto13FUNCEF Then
                                                        Begin
                                                          // Beneficiário ISENTO PARCIALMENTE no Exercício. A isenção ocorreu
                                                          // antes do mês de Quitação, sendo assim, deve haver o cálculo.
                                                          //_ProcessaCalculoDosRendimentosQuitacao(dValorTotalIDINFORMEQuitacao, iQtdDeParcelasDoInformeQuitacao);

                                                          if dValorIDINFORMEDestino > 0 then
                                                             _ProcessaCalculoDosRendimentosQuitacao(dValorIDINFORMEDestino, iQtdDeParcelasDoInformeQuitacao)
                                                          else
                                                             _ProcessaCalculoDosRendimentosQuitacao(dValorTotalIDINFORMEQuitacao, iQtdDeParcelasDoInformeQuitacao);

                                                          // Gravando o IDINFORME ORIGEM como IDINFORME DESTINO
                                                          _GravarDadosIRRF_Beneficiario(CdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger, iFontePagadora, dValorTotalIDINFORMEQuitacao, 'Q');
                                                        End
                                                      else
                                                        Begin
                                                          // Beneficiário ISENTO PARCIALMENTE no Exercício. A isenção ocorreu
                                                          // antes do mês de Quitação, sendo assim, deve haver o cálculo.
                                                          _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');

                                                          // Gravando o IDINFORME ORIGEM como IDINFORME DESTINO
                                                          _GravarDadosIRRF_Beneficiario(CdsInformeDePara.FieldByName('IDINFORMEDESTINO').AsInteger, iFontePagadora, dValorTotalIDINFORMEQuitacao, 'Q');

                                                        End
                                                    end
                                                  Else
                                                    Begin
                                                      // Não encontra o lançamento DE/PARA de Destino, então processa o cálculo da quitação
                                                      _ProcessaCalculoDosRendimentosQuitacao(0.00, iQtdDeParcelasDoInformeQuitacao);
                                                    End;

                                                  If RegAtual <> Nil Then
                                                    CdsMovIndividualIdResponsavelQuitacao.GotoBookmark(RegAtual); // Voltando ao Reg. atual

                                                End;
                                            end; //edilaine SIG96014 : fim

                                        End
                                      Else

                                        // Beneficiário NÃO ISENTO no Exercício por conta de não haver datas inicio e fim de Mol.Grave. ou
                                        // estas datas ocorreram antes do exercício iniciar, desta forma deve haver os cálculos para a quitação.
                                        _ProcessaCalculoDosRendimentosQuitacao(0.00, iQtdDeParcelasDoInformeQuitacao);
                                    End;

                                  // Processando o próximo lançamento do IdResponsável do CPF
                                  CdsMovIndividualIdResponsavelQuitacao.Next;

                                End;
                            End;
                          //
                          //-----------------------  FIM DA AVALIAÇÃO DA QUITAÇÃO --------------------------------------
                          //

                          // Processando o próximo IdResponsável do CPF
                          CdsIDResponsavelDoCPFProcessado.Next;

                        End;
                    End;
                End;
            End;

          // Processando o próximo Beneficiário selecionado na Grid
          cdsBenefSelecionadoQuitacao.Next;
        End;
      gProgresso.Progress := 0;
    End
  Else
    Begin
      If bFaltaVlrIdoso Then
        MostraMensagem('Valor do Idoso não está parametrizado. Verifique !');
    End;
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._LocalizaParametrosParaProcessamentoQUITACAO(pDtFimExercicio: TDateTime): Boolean;
Begin
  Result := True;
  bFaltaVlrIdoso := False;
  dValorDescontoIdosoParam := 0.00;
  iIdadeBenefParam := 0;
  iLinhaAbonoAcima65 := 0;
  iLinhaAbonoAcima65INSS := 0;
  iLinhaRendAcJud13 := 0;
  iLinhaMolINSS:= 0;  // Darivaldo Alencar SIG62723
  //
  // Busca parâmetros e dados necessários ao Processamento
  //
  // IDSITUACAO: 1 - Moléstia Grave /  2 - Isenção Retroativa
  CdsInformeDePara.Data := GetDataPacket('SELECT * FROM INFORMEDEPARA ORDER BY IDSITUACAO, IDINFORMEORIGEM ');

  // Busca parâmetros por vigência
  CdsParamIRRF.Data := GetDataPacket('SELECT * ' +
    'FROM HSTPARAMIRRF   ' +
    'WHERE DATAINIVIGENCIA = (SELECT MAX(DATAINIVIGENCIA) ' +
    '                         FROM   HSTPARAMIRRF   ' +
    '                         WHERE  DATAINIVIGENCIA <= TO_DATE(' + QuotedStr(datetostr(pDtFimExercicio)) + ',''DD/MM/YYYY''))');

  If CdsParamIRRF.fieldbyname('VLRIDOSO').asFloat = 0 Then
    Begin
      bFaltaVlrIdoso := True;
      Result := False;
    End
  Else
    Begin
      iIdadeBenefParam := CdsParamIRRF.fieldByname('IDADEIDOSO').AsInteger;
      dValorDescontoIdosoParam := CdsParamIRRF.fieldbyname('VLRIDOSO').asFloat;
      iLinhaAbonoAcima65 := CdsParamIRRF.FieldByName('IDINFORME65ANOS13').AsInteger; // 123
      iLinhaAbonoAcima65INSS := CdsParamIRRF.FieldByName('IDINFORME65INSS13').AsInteger; // 124
      iLinhaRendAcJud13 := CdsParamIRRF.fieldbyname('IDINFORMEACJUD13').asInteger; // 167
      iLinhaAcaoJudicialInss13 := CdsParamIRRF.FieldByName('IDACAOJUDICIALINSS13').asInteger; // 86
      iLinhaMolINSS:= CdsParamIRRF.FieldByName('IDINFORMEMOLINSS').asInteger; //55   Darivaldo Alencar SIG62723
    End;
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._SelecionaIdResponsaveisDoCPFQuitacao(pCPF, pAno: String): Boolean;
Var sSql, sAno: String;
Begin
  // SQL para trazer os IDRESPONSAVEIS pertencentes a um CPF
  sSql := 'SELECT DISTINCT p.numdocumento, l.idbenefirrf, x.fontepagadora ' + #13#10 +
          '  FROM lancirrf l, pessoa p ' + #13#10 +
          '      ,lancxinforme x ' + #13#10 + // Alterado por FHBS - 21/02/2019 - SIG82481 - Inclusão da FontePagadora
          ' WHERE l.idbenefirrf = p.idpessoa ' + #13#10 +
          '   and x.idlancirrf = l.idlancirrf ' + #13#10 + // Alterado por FHBS - 21/02/2019 - SIG82481
        //'   AND l.idhstfolhabenef = ' + pVersaoUltFolha + #13#10 +  // Andre Imakawa - SIG 35148
          '   AND to_char(l.datapagamento,''YYYY'') = ' + QuotedStr(pAno) + #13#10 + // Andre Imakawa - SIG 35148
          '   AND p.numdocumento = ' + QuotedStr(pCPF) + #13#10 +
          ' ORDER BY  p.numdocumento, x.fontepagadora, l.idbenefirrf ' + #13#10;

  CdsIDResponsavelDoCPFProcessado.Data := GetDataPacket(sSql);
  Result := Not CdsIDResponsavelDoCPFProcessado.isEmpty;
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._SelecionarBeneficiariosProcessamentoQUITACAO(
  pAnoRef: String;
  pListaDeBeneficiarios: TStringList;
  pTemListaDeBeneficiarios: Boolean): OleVariant;
Var sSql: String;
Begin
  bFlgGravaSQLSomenteUmaVez := True;

  If pTemListaDeBeneficiarios Then
    sListaBeneficiarios := _ConverteListas(pListaDeBeneficiarios);

  sSql := 'SELECT ''S'' marcado,               ' + #13#10 +
    '     CDS1.ano_exercicio,                  ' + #13#10 +
    '     CDS1.numdocumento,                   ' + #13#10 +
    '     CDS1.nome,                           ' + #13#10 +
    '     CDS1.datanasc,                       ' + #13#10 +
    '     CDS2.Ultima_Versao_Folha,            ' + #13#10 +
    '     CDS2.Ultima_Data_Pagto,              ' + #13#10 ;

    // Andre Imakawa - SIG 36762 - Inicio
    //'     DECODE(CDS3.FLGLANC_QUITACAOBUSCA, null, ''Não'', ''Sim'') TEM_QUITACAO ' + #13#10 +

    sSql := sSql + 'DECODE((SELECT  l.FLGLANC_QUITACAOBUSCA   ' + #13#10 +
                   'FROM lancirrf l, lancxinforme lx, pessoa p                                         ' + #13#10 +
                   'WHERE l.idlancirrf = lx.idlancirrf                                                 ' + #13#10 +
                   '      AND l.idbenefirrf = p.idpessoa                                               ' + #13#10 +
                   '      AND TO_CHAR(l.datapagamento, ''YYYY'') = ' + QuotedStr(pAnoRef) + #13#10 +
                   '      AND l.idhstfolhabenef IN (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */ H.IDHSTFOLHABENEF  ' + #13#10 + // Folhas Normais
                   '                                  FROM HSTFOLHABENEF H                                       ' + #13#10 +
                   '                                WHERE  TRANSLATE(UPPER(H.HISTORICO), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') ' + #13#10 +
                   '                                       LIKE ''% FOLHA '' || DECODE(TO_CHAR(l.datapagamento, ''MM''),                  ' + #13#10 +
                   '                                                ''01'',''JANEIRO '', ''02'',''FEVEREIRO '',  ''03'',''MARCO '',       ' + #13#10 +
                   '                                                ''04'',''ABRIL '', ''05'',''MAIO '', ''06'',''JUNHO '',               ' + #13#10 +
                   '                                                ''07'',''JULHO '', ''08'',''AGOSTO '', ''09'',''SETEMBRO '',          ' + #13#10 +
                   '                                                ''10'',''OUTUBRO '', ''11'',''NOVEMBRO '', ''12'',''DEZEMBRO '')      ' + #13#10 +
                   '                                                || TO_CHAR(l.datapagamento, ''yyyy'') || ''%''                        ' + #13#10 +
                   '                                       AND H.FLGTIPOFOLHA = 0 )                                                       ' + #13#10;

  If pTemListaDeBeneficiarios Then
    sSql := sSql + '    AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE ' + CtrlFuncoesRH.QuebrarListaFiltro(1, '(NUMDOCUMENTO  ', sListaBeneficiarios, 500) + ')' + #13#10;

  sSql := sSql + '      AND l.idmodulorespon = 18                                         ' + #13#10 +
                 '      AND ABS(lx.vlrlanc) > 0                                                ' + #13#10; //TAES - SIG94607

  sSql := sSql + '      AND l.FLGLANC_QUITACAOBUSCA = ''S'' AND  p.numdocumento = CDS1.numdocumento ' + #13#10 +
                 '      AND ROWNUM = 1) , null, ''Não'', ''Sim'') TEM_QUITACAO                                                 ' + #13#10;

  // Andre Imakawa - SIG 36762 - Fim

  sSql := sSql +  'FROM                                      ' + #13#10;
  // SQL principal para trazer o movimento do exercicio somente para os IdInformes selecionáveis de quitação
  sSql := sSql + '(SELECT ds.ano_exercicio,        ' + #13#10 +
    '         ds.idhstfolhabenef,                  ' + #13#10 +
    '         p.numdocumento,                      ' + #13#10 +
    '         ds.idbenefirrf,                      ' + #13#10 +
    '         p.nome,                              ' + #13#10 +
    '         ds.datanasc                          ' + #13#10 +
    'FROM                                          ' + #13#10 +
    '    (SELECT TO_CHAR(l.datapagamento, ''yyyy'') ano_exercicio, ' + #13#10 +
    '            l.idhstfolhabenef,                 ' + #13#10 +
    '            (select max(p.idpessoa)                               ' + #13#10 + // Recurso para pegar o último nome cadastrado do Beneficiário
  '              from pessoa p                                      ' + #13#10 +
    '            where p.idpessoa = l.idbenefirrf) idbenefirrf,      ' + #13#10 +
    '            pf.datanasc                          ' + #13#10 +
    '     FROM lancirrf l,                          ' + #13#10 +
    '          lancxinforme li,                     ' + #13#10 +
    '          pessoa p,                            ' + #13#10 +
    '          pessoafisica pf                      ' + #13#10 +
    '     WHERE l.idlancirrf = li.idlancirrf        ' + #13#10 +
    '           AND l.idbenefirrf = p.idpessoa      ' + #13#10 +
    '           AND l.idbenefirrf = pf.idpessoa     ' + #13#10 +
    '           AND TO_CHAR(l.datapagamento, ''YYYY'') = ' + QuotedStr(pAnoRef) + #13#10 +
    '           AND l.idhstfolhabenef IN (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */ H.IDHSTFOLHABENEF  ' + #13#10 + // Folhas Normais
  '                                  FROM HSTFOLHABENEF H       ' + #13#10 +
    '                                WHERE  TRANSLATE(UPPER(H.HISTORICO), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') ' + #13#10 +
    '                                       LIKE ''% FOLHA '' || DECODE(TO_CHAR(l.datapagamento, ''MM''),                  ' + #13#10 +
    '                                                ''01'',''JANEIRO '', ''02'',''FEVEREIRO '',  ''03'',''MARCO '',       ' + #13#10 +
    '                                                ''04'',''ABRIL '', ''05'',''MAIO '', ''06'',''JUNHO '',               ' + #13#10 +
    '                                                ''07'',''JULHO '', ''08'',''AGOSTO '', ''09'',''SETEMBRO '',          ' + #13#10 +
    '                                                ''10'',''OUTUBRO '', ''11'',''NOVEMBRO '', ''12'',''DEZEMBRO '')      ' + #13#10 +
    '                                                || TO_CHAR(l.datapagamento, ''yyyy'') || ''%''                        ' + #13#10 +
    '                                       AND H.FLGTIPOFOLHA = 0 )                                                       ' + #13#10;

  If pTemListaDeBeneficiarios Then
    sSql := sSql + '           AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE ' + CtrlFuncoesRH.QuebrarListaFiltro(1, '(NUMDOCUMENTO  ', sListaBeneficiarios, 500) + ')' + #13#10;

  sSql := sSql + '           AND l.idmodulorespon = 18                                     ' + #13#10 +
    // Paulo Nobre - SIG 32807
//  '           AND li.vlrlanc <> 0                                                         ' + #13#10 +
  '           AND li.vlrlanc > 0                                                         ' + #13#10 +
    '           AND li.idinforme in (select idinforme                                      ' + #13#10 + // IdInformes selecionáveis p/ quitação
  '                                  from informe                                          ' + #13#10 +
    '                                where flgusadobuscaquitacao = ''S'')                  ' + #13#10 +
    '     GROUP BY TO_CHAR(l.datapagamento, ''yyyy''),                                     ' + #13#10 +
    '        l.idhstfolhabenef,                                                            ' + #13#10 +
    '        idbenefirrf,                                                                  ' + #13#10 +
    '        pf.datanasc ) DS,                                                             ' + #13#10 +
    '        pessoa p                                                                      ' + #13#10 +
    '   WHERE ds.idbenefirrf = p.idpessoa ) CDS1,                                          ' + #13#10 +
    '                                                                                      ' + #13#10;
  // SQL para trazer o última versão de folha de cada beneficiário dentro do exercicio
  sSql := sSql + '(SELECT p.numdocumento, MAX(l.idhstfolhabenef) Ultima_Versao_Folha, MAX(l.datapagamento) Ultima_Data_Pagto   ' + #13#10 +
    ' FROM lancirrf l, lancxinforme lx, pessoa p                                           ' + #13#10 +
    ' WHERE l.idlancirrf = lx.idlancirrf                                                   ' + #13#10 +
    '      AND l.idbenefirrf = p.idpessoa                                                  ' + #13#10 +
    '      AND TO_CHAR(l.datapagamento, ''YYYY'') = ' + QuotedStr(pAnoRef) + #13#10 +
    '      AND l.idhstfolhabenef IN (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */ H.IDHSTFOLHABENEF  ' + #13#10 + // Folhas Normais
  '                                  FROM HSTFOLHABENEF H       ' + #13#10 +
    '                                WHERE  TRANSLATE(UPPER(H.HISTORICO), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') ' + #13#10 +
    '                                       LIKE ''% FOLHA '' || DECODE(TO_CHAR(l.datapagamento, ''MM''),                  ' + #13#10 +
    '                                                ''01'',''JANEIRO '', ''02'',''FEVEREIRO '',  ''03'',''MARCO '',       ' + #13#10 +
    '                                                ''04'',''ABRIL '', ''05'',''MAIO '', ''06'',''JUNHO '',               ' + #13#10 +
    '                                                ''07'',''JULHO '', ''08'',''AGOSTO '', ''09'',''SETEMBRO '',          ' + #13#10 +
    '                                                ''10'',''OUTUBRO '', ''11'',''NOVEMBRO '', ''12'',''DEZEMBRO '')      ' + #13#10 +
    '                                                || TO_CHAR(l.datapagamento, ''yyyy'') || ''%''                        ' + #13#10 +
    '                                       AND H.FLGTIPOFOLHA = 0 )                                                       ' + #13#10;

  If pTemListaDeBeneficiarios Then
    sSql := sSql + '     AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE ' + CtrlFuncoesRH.QuebrarListaFiltro(1, '(NUMDOCUMENTO  ', sListaBeneficiarios, 500) + ')' + #13#10;

  sSql := sSql + '      AND l.idmodulorespon = 18                                       ' + #13#10 +
    // Paulo Nobre - SIG 32807
//   '      AND lx.vlrlanc <> 0                                                          ' + #13#10;
  '      AND lx.vlrlanc > 0                                                          ' + #13#10;

  // Andre Imakawa - SIG 36762 - Inicio
  //sSql := sSql + '  GROUP BY  p.numdocumento ) CDS2,                                    ' + #13#10 +
  sSql := sSql + '  GROUP BY  p.numdocumento ) CDS2                                    ' + #13#10 +
    '                                                                                   ' + #13#10;
  {
  // SQL para trazer uma flag que indica a existência ou não dos IdInformes de quitação (gravados)
  // na ultima folha de cada beneficiário dentro do exercicio
  sSql := sSql + '(SELECT  p.numdocumento, l.idhstfolhabenef, l.FLGLANC_QUITACAOBUSCA   ' + #13#10 +
    'FROM lancirrf l, lancxinforme lx, pessoa p                                         ' + #13#10 +
    'WHERE l.idlancirrf = lx.idlancirrf                                                 ' + #13#10 +
    '      AND l.idbenefirrf = p.idpessoa                                               ' + #13#10 +
    '      AND TO_CHAR(l.datapagamento, ''YYYY'') = ' + QuotedStr(pAnoRef) + #13#10 +
    '      AND l.idhstfolhabenef IN (SELECT /*+ INDEX(H XPKHSTFOLHABENEF) */ H.IDHSTFOLHABENEF  ' + #13#10 + // Folhas Normais
  '                                  FROM HSTFOLHABENEF H                                       ' + #13#10 +
    '                                WHERE  TRANSLATE(UPPER(H.HISTORICO), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü*'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu '') ' + #13#10 +
    '                                       LIKE ''% FOLHA '' || DECODE(TO_CHAR(l.datapagamento, ''MM''),                  ' + #13#10 +
    '                                                ''01'',''JANEIRO '', ''02'',''FEVEREIRO '',  ''03'',''MARCO '',       ' + #13#10 +
    '                                                ''04'',''ABRIL '', ''05'',''MAIO '', ''06'',''JUNHO '',               ' + #13#10 +
    '                                                ''07'',''JULHO '', ''08'',''AGOSTO '', ''09'',''SETEMBRO '',          ' + #13#10 +
    '                                                ''10'',''OUTUBRO '', ''11'',''NOVEMBRO '', ''12'',''DEZEMBRO '')      ' + #13#10 +
    '                                                || TO_CHAR(l.datapagamento, ''yyyy'') || ''%''                        ' + #13#10 +
    '                                       AND H.FLGTIPOFOLHA = 0 )                                                       ' + #13#10;

  If pTemListaDeBeneficiarios Then
    sSql := sSql + '     AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE ' + CtrlFuncoesRH.QuebrarListaFiltro(1, '(NUMDOCUMENTO  ', sListaBeneficiarios, 500) + ')' + #13#10;

  sSql := sSql + '      AND l.idmodulorespon = 18                             ' + #13#10 +
    // Paulo Nobre - SIG 32807
//   '      AND lx.vlrlanc <> 0                                                ' + #13#10;
  '      AND lx.vlrlanc > 0                                                ' + #13#10;

  sSql := sSql + '      AND l.FLGLANC_QUITACAOBUSCA = ''S''                                ' + #13#10 +
    'GROUP BY p.numdocumento, l.idhstfolhabenef, l.FLGLANC_QUITACAOBUSCA ) CDS3 ' + #13#10 +
    }
    // Andre Imakawa - SIG 36762 - Fim

    sSql := sSql + '                                                                         ' + #13#10 +
    'WHERE CDS1.numdocumento = CDS2.numdocumento                              ' + #13#10 +

    // Andre Imakawa - SIG 36762 - Inicio
    //'      And CDS2.Ultima_Versao_Folha = CDS3.idhstfolhabenef(+)             ' + #13#10 +
    //'      And CDS2.numdocumento = CDS3.numdocumento (+)                      ' + #13#10 +
    // Andre Imakawa - SIG 36762 - Fim

    'GROUP BY CDS1.ano_exercicio,                                             ' + #13#10 +
    '      CDS1.numdocumento,                                                 ' + #13#10 +
    '      CDS1.nome,                                                         ' + #13#10 +
    '      CDS1.datanasc,                                                     ' + #13#10 +
    '      CDS2.Ultima_Versao_Folha,                                          ' + #13#10 +
    // Andre Imakawa - SIG 36762 - Inicio
    //'      CDS2.Ultima_Data_Pagto,                                            ' + #13#10 +
    '      CDS2.Ultima_Data_Pagto                                            ' + #13#10 +
    //'      CDS3.FLGLANC_QUITACAOBUSCA                                         ' + #13#10 +
    //'ORDER BY CDS3.FLGLANC_QUITACAOBUSCA, CDS1.numdocumento                   ' + #13#10;
    'ORDER BY TEM_QUITACAO  DESC, CDS1.numdocumento                   ' + #13#10;
    // Andre Imakawa - SIG 36762 - Fim

  If bFlgGravaSQLSomenteUmaVez Then
    Begin
      sqlText.Clear;
      sqlText.add(sSql);
      sqlText.SaveToFile(DirLogBusca + '\SQL_QUITACAO_BenefSelProcessamento.txt');
      bFlgGravaSQLSomenteUmaVez := False;
    End;

  Result := GetDataPacket(sSql);
End;

Function TCtrlBUSCA_DIRFFolhaBeneficios._SelecionarMovIndivBeneficiarioQUITACAO(
    pAnoExercicio: String;
    pIdResponsavelIndiv: Integer;
    pFontePagadora: Integer // Alterado por FHBS - 21/02/2019 - SIG82841
    ): Boolean;
Var sSql: String;
Begin
  // Paulo Nobre SOL 269130 PPM 1284502
  sSql := 'SELECT * FROM (                                    ' + #13#10 +
    'SELECT l.idbenefirrf,                                    ' + #13#10 +
    '       lx.fontepagadora,                                 ' + #13#10 +
    '       l.codnatureza,                                    ' + #13#10 +
    '       lx.idinforme,                                     ' + #13#10 +
    '       l.flgpensaoalim,                                  ' + #13#10 +
    '       l.PLANO,                                          ' + #13#10 +
    '       l.IDPLANOPREV,                                    ' + #13#10 +
    '       l.IDPATRO,                                        ' + #13#10 +
    '       l.CODCENTRORESPON,                                ' + #13#10 +
    '       l.codcentrocusto,                                 ' + #13#10 +
    '       l.idmodulorespon,                                 ' + #13#10 +
    '       l.idprograma,                                     ' + #13#10 +
    '       pf.datanasc,                                      ' + #13#10 +
    '       i.flgNatureza,                                    ' + #13#10 +
    //'       l.datainimolgrave,                                ' + #13#10 +    // Andre Imakawa - SIG 58893
    //'       l.datafimmolgrave,                                ' + #13#10 +    // Andre Imakawa - SIG 58893

    //TAES - SIG96014 : inicio
    //'       NVL(l.datainimolgrave, pf.datamolestiagrave) datainimolgrave, ' + #13#10 +   // Andre Imakawa - SIG 58893
    //'       NVL(l.datafimmolgrave, pf.datafimmolestia) datafimmolgrave,   ' + #13#10 +   // Andre Imakawa - SIG 58893
    '       NVL(mg.dtini, pf.datamolestiagrave) datainimolgrave, ' + #13#10 +
    '       NVL(mg.dtfim, pf.datafimmolestia) datafimmolgrave,   ' + #13#10 +
    //TAES - SIG96014 : fim

    // Andre Imakawa - SIG 39948 - Inicio
    //'       l.idprocjud,                                      ' + #13#10 +
    //'       PJUD.IDPROCJUD,                                   ' + #13#10 +
    '       NVL(L.IDPROCJUD, PJUD.IDPROCJUD) AS IDPROCJUD,    ' + #13#10 +  //TAES - SIG96560
    // Andre Imakawa - SIG 39948 - Fim

    '       SUM(trunc(lx.vlrlanc, 2)) as totvlrlanc,          ' + #13#10 +
    // Paulo Nobre - SIG 21776
//    '       COUNT(*) as QtdDeParcelasDoInformeQuitacao,       ' + #13#10 +
  '       MAX(l.idhstfolhabenef) as idhstfolhabenef,        ' + #13#10 + // manter a ordem dos lançamentos
  '       MAX(l.datapagamento) as dtpagamentofolha          ' + #13#10 + // manter a ordem dos lançamentos
  ' FROM lancirrf l,                                          ' + #13#10 +
    '      lancxinforme lx,                                   ' + #13#10 +
    '      pessoafisica pf,                                   ' + #13#10 +

    //TAES - SIG96014
    '      (SELECT LI.idbenefirrf, MAX(LI.datainimolgrave) dtini, ' + #13#10 +
    '                              MAX(NVL(LI.datafimmolgrave, TO_DATE(''30/12/9999'', ''DD/MM/YYYY''))) dtfim ' + #13#10 +   //edilaine - SIG96408
    '         FROM LANCIRRF LI ' + #13#10 +
    '        WHERE LI.idbenefirrf = ' + inttostr(pIdResponsavelIndiv)  + #13#10 +
    '          AND TO_CHAR(LI.datapagamento, ''YYYY'') = ' + quotedstr(pAnoExercicio)    + #13#10 +
    //'          AND LI.datainimolgrave <= ' + quotedstr( '16/11/'+pAnoExercicio) + #13#10 +       //edilaine - SIG96408
    '          AND LI.datainimolgrave < ' + quotedstr( '01/11/'+pAnoExercicio) + #13#10 +          //edilaine - SIG96408
    '        GROUP BY LI.idbenefirrf) MG, ' + #13#10 +
    //TAES - SIG96014


    // Andre Imakawa - SIG 39948 - Inicio
    '      informe i,                                          ' + #13#10 +
    '      (SELECT PROCJUD.IDPROCJUD, PROCJUD.IDPESSOA                           ' + #13#10 +
    '                  FROM PROCJUD                                              ' + #13#10 +
    '                 WHERE PROCJUD.IDPESSOA = ' + inttostr(pIdResponsavelIndiv)   + #13#10 +
    '                   AND ((PROCJUD.SITPROCESSO = 0 AND                        ' + #13#10 +
    '                       PROCJUD.DATAINICIO <= to_date(''01/11/2016'',''dd/mm/yyyy'') AND ' + #13#10 +
    '                       ((PROCJUD.DATAFINAL > to_date(''30/11/2016'',''dd/mm/yyyy'')) OR ' + #13#10 +
    '                       (PROCJUD.DATAFINAL IS NULL))) OR                     ' + #13#10 +
    '                       (PROCJUD.SITPROCESSO = 2 AND                         ' + #13#10 +
    '                       PROCJUD.DATAINICIO <= to_date(''01/11/2016'',''dd/mm/yyyy'') AND ' + #13#10 +
    '                       PROCJUD.DATAFINAL > to_date(''30/11/2016'',''dd/mm/yyyy'')))     ' + #13#10 +
    '                   AND PROCJUD.PERCACAO <> 0                                ' + #13#10 +
    '                   AND ROWNUM = 1) PJUD                                     ' + #13#10 +
    // Andre Imakawa - SIG 39948 - Fim

    ' WHERE l.idlancirrf = lx.idlancirrf                      ' + #13#10 +
    '       AND lx.idinforme = i.idinforme                    ' + #13#10 +
    '       AND l.idbenefirrf = pf.idpessoa                   ' + #13#10 +
    '       AND PJUD.IDPESSOA(+) = l.idbenefirrf              ' + #13#10 + // Andre Imakawa - SIG 39948
    '       AND l.idbenefirrf = ' + inttostr(pIdResponsavelIndiv) + #13#10 +
    '       AND TO_CHAR(l.datapagamento, ''YYYY'') = ' + quotedstr(pAnoExercicio) + #13#10 +
    '       AND lx.idinforme in (select idinforme             ' + #13#10 +
    '                            from informe                 ' + #13#10 +
    '                            where flgusadobuscaquitacao = ''S'') ' + #13#10 +
    '       AND l.idmodulorespon = 18                         ' + #13#10 +
    '       AND lx.vlrlanc <> 0                               ' + #13#10 +
    '       AND lx.FontePagadora = ' + IntToStr(pFontePagadora) + #13#10 + // Alterado por FHBS - 21/02/2019 - SIG82481
    '       AND l.idbenefirrf = mg.idbenefirrf(+)             ' + #13#10 + //TAES - SIG96014

    'GROUP BY l.idbenefirrf,                                  ' + #13#10 +
    '         lx.fontepagadora,                               ' + #13#10 +
    '         l.codnatureza,                                  ' + #13#10 +
    '         lx.idinforme,                                   ' + #13#10 +
    '         l.flgpensaoalim,                                ' + #13#10 +
    '         l.PLANO,                                        ' + #13#10 +
    '         l.IDPATRO,                                      ' + #13#10 +
    '         l.IDPLANOPREV,                                  ' + #13#10 +
    '         l.CODCENTRORESPON,                              ' + #13#10 +
    '         l.codcentrocusto,                               ' + #13#10 +
    '         l.idmodulorespon,                               ' + #13#10 +
    '         l.idprograma,                                   ' + #13#10 +
    '         pf.datanasc,                                    ' + #13#10 +
    '         i.flgNatureza,                                  ' + #13#10 +
    //'         l.datainimolgrave,                              ' + #13#10 +    // Andre Imakawa - SIG 58893
    //'         l.datafimmolgrave,                              ' + #13#10 +    // Andre Imakawa - SIG 58893
    //TAES - SIG96014 : inicio
    //'         NVL(l.datainimolgrave, pf.datamolestiagrave),   ' + #13#10 +      // Andre Imakawa - SIG 58893
    //'         NVL(l.datafimmolgrave, pf.datafimmolestia),     ' + #13#10 +      // Andre Imakawa - SIG 58893
    '         NVL(mg.dtini, pf.datamolestiagrave),   ' + #13#10 +
    '         NVL(mg.dtfim, pf.datafimmolestia),     ' + #13#10 +
    //TAES - SIG96014 : fim

    // Andre Imakawa - SIG 39948 - Inicio
    //'         l.idprocjud                                     ' + #13#10 +
    //'         PJUD.IDPROCJUD                                  ' + #13#10 +
    // Andre Imakawa - SIG 39948 - Fim
    '         NVL(L.IDPROCJUD, PJUD.IDPROCJUD)                ' + #13#10 + //TAES - SIG96560
    '        )                                                ' + #13#10 +
    // Paulo Nobre - SIG 32807
//  'WHERE totvlrlanc <> 0                                     ' + #13#10 +
//  'WHERE totvlrlanc > 0    // Andre Imakawa - SIG 58896                                 ' + #13#10 + // Andre Imakawa - SIG 58896
    //'ORDER BY fontepagadora, idhstfolhabenef                  ' + #13#10;          //edilaine SIG122845
    'ORDER BY fontepagadora, idhstfolhabenef, totvlrlanc desc   ' + #13#10;          //edilaine SIG122845

  If bFlgGravaSQLSomenteUmaVez Then
    Begin
      sqlText.Clear;
      sqlText.add(sSql);
      sqlText.SaveToFile(DirLogBusca + '\SQL_QUITACAO_BenefSelMovIndividual.txt');
      bFlgGravaSQLSomenteUmaVez := False;
    End;

  CdsMovIndividualIdResponsavelQuitacao.Data := GetDataPacket(sSql);
  Result := (Not CdsMovIndividualIdResponsavelQuitacao.isEmpty);
End;

Procedure TCtrlBUSCA_DIRFFolhaBeneficios._CarregaDadosDoIDINFORMEParaQuitacao(pDtPagtoUltimaFolha: TDateTime);
Var sSQL: String;
Begin
  dValorTotalIDINFORMEQuitacao := 0.00;
  dValorAcaoJud := 0.00;
  dValorCalculado := 0.00;
  dValorTotalIDINFORMEGravarQuitacao := 0.00;
  dValorIDINFORMEOrigem := 0.00;
  dValorIDINFORMEDestino := 0.00;

  iIdInformeAvaliacao := CdsMovIndividualIdResponsavelQuitacao.fieldbyname('idinforme').asInteger;
  sDataPagamento := DateToStr(pDtPagtoUltimaFolha);
  iFontePagadora := CdsMovIndividualIdResponsavelQuitacao.fieldbyname('fontepagadora').asInteger;
  iFlgPensaoAlim := CdsMovIndividualIdResponsavelQuitacao.FieldByName('flgpensaoalim').AsInteger;
  iIdModulo := CdsMovIndividualIdResponsavelQuitacao.FieldByName('idmodulorespon').AsInteger;
  iIdPatro := CdsMovIndividualIdResponsavelQuitacao.FieldByName('idpatro').AsInteger;
  iIdPlanoPrev := CdsMovIndividualIdResponsavelQuitacao.FieldByName('IDPLANOPREV').AsInteger;
  iIdPrograma := CdsMovIndividualIdResponsavelQuitacao.FieldByName('idprograma').AsInteger;
  iIdPlanoContab := CdsMovIndividualIdResponsavelQuitacao.FieldByName('plano').AsInteger;
  sCodigoNaturezaIndiv := trim(CdsMovIndividualIdResponsavelQuitacao.FieldByName('codnatureza').AsString);
  sCodigoCentroCusto := CdsMovIndividualIdResponsavelQuitacao.FieldByName('codcentrocusto').AsString;
  sCodigoCentroRespon := CdsMovIndividualIdResponsavelQuitacao.FieldByName('codcentrorespon').AsString;
  sFlgNatureza := CdsMovIndividualIdResponsavelQuitacao.FieldByName('flgnatureza').AsString;

  iIdProcJudFund :=  CdsMovIndividualIdResponsavelQuitacao.FieldByName('IDPROCJUD').AsInteger;      //edilaine SIG97081

  // Paulo Nobre - SIG 21776
  // Paulo Nobre - SIG 35148
  iQtdDeParcelasDoInformeQuitacao := _RetornaQtdParcelasIDINFORMENoMovProcessado(sCPFBeneficiarioSelecionadoQuita, sAnoExercicio, iIdInformeAvaliacao);

  // Paulo Nobre SOL 268373 PPM 1260556
  iIdMotivo := 0;
  sPlanoContaCredito := '';
  sCodigoTipoRecDes := '';

  // Rotina para buscar dados especificos, pois estes ficaram fora do SELECT geral
  // devido existir mais de uma ocorrência deles para o mesma chave: Fonte, Natureza, IdInforme
  // e com isso a totalização pelo agrupamento fica prejudicada.
  // As vezes estas ocorrências são por problemas oriundos da folha e para não prejudicar a BUSCA
  // foi usado este artifico.
  sSql := 'SELECT M.IDMOTIVO, M.PLACONTA, M.CODTIPRECDES            ' + #13#10 +
    '      FROM LANCIRRF M, LANCXINFORME L, PESSOA P                 ' + #13#10 +
    '      WHERE M.IDLANCIRRF = L.IDLANCIRRF                         ' + #13#10 +
    '            AND M.IDBENEFIRRF = P.IDPESSOA                      ' + #13#10 +
    '            AND (TO_CHAR(M.DATAPAGAMENTO, ''YYYY'') = ' + quotedstr(sAnoExercicio) + ')' + #13#10 +
    '            AND (P.NUMDOCUMENTO = ' + QuotedStr(sCPFBeneficiarioSelecionadoQuita) + ')' + #13#10 +
    '            AND (M.IDBENEFIRRF = ' + IntToStr(iIdResponsavelAtual) + ')' + #13#10 +
    '            AND (L.FONTEPAGADORA = ' + IntToStr(iFontePagadora) + ')' + #13#10 +
    '            AND (M.CODNATUREZA = ' + QuotedStr(sCodigoNaturezaIndiv) + ')' + #13#10 +
    '            AND (L.IDINFORME = ' + IntToStr(iIdInformeAvaliacao) + ')' + #13#10 +
    '            AND M.FLGLANC_COMPENSABUSCA IS NULL      ' + #13#10 +
    '            AND M.FLGLANC_QUITACAOBUSCA IS NULL        ';
  CdsAux1.Data := GetDataPacket(sSql);

  iIdMotivo := CdsAux1.FieldByName('IDMOTIVO').AsInteger;
  sPlanoContaCredito := CdsAux1.FieldByName('PLACONTA').AsString;
  sCodigoTipoRecDes := CdsAux1.FieldByName('CODTIPRECDES').AsString;

  If sFlgNatureza = 'N' Then // (N)egativo
    dValorTotalIDINFORMEQuitacao := CdsMovIndividualIdResponsavelQuitacao.fieldbyname('totvlrlanc').asFloat * -1
  Else // (P)ositivo
    dValorTotalIDINFORMEQuitacao := CdsMovIndividualIdResponsavelQuitacao.fieldbyname('totvlrlanc').asFloat;
End;

// André Imakawa - SIG 19498 - Inicio

Function TCtrlBUSCA_DIRFFolhaBeneficios._VerificandoOcorrenciaDoIDINFORMENoMovProcessado(pCPF: String; Const pVersaoFolha, pIdInforme: Integer): Boolean;
Var qryAux: TwwQuery;
Begin
  qryAux := TwwQuery.Create(Nil);
  qryAux.DatabaseName := 'BaseDados';
  qryAux.Close;
  With qryAux.Sql Do
    Begin
      Clear;
      Add('SELECT l.idlancirrf               ');
      Add('FROM lancirrf l, lancxinforme x   ');
      Add('WHERE l.idlancirrf = x.idlancirrf ');
      Add('      AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPF) + ')');
      Add('      AND l.idhstfolhabenef = ' + IntToStr(pVersaoFolha));
      Add('      AND x.idinforme = ' + IntToStr(pIdInforme));
    End;
  qryAux.Open;
  Result := Not qryAux.isEmpty;
  FreeAndNil(qryAux);
End;
// André Imakawa - SIG 19498 - Fim

// André Imakawa - SIG 58893 - Inicio

Function TCtrlBUSCA_DIRFFolhaBeneficios._VerificandoOcorrenciaDoIDINFORMENoMovProcessadoResp(Const pVersaoFolha, pIdInforme, pIdResp, pIdPlanoPrev: Integer): Boolean; // Andre Imakawa - SIG 59382
Var qryAux: TwwQuery;
Begin
  qryAux := TwwQuery.Create(Nil);
  qryAux.DatabaseName := 'BaseDados';
  qryAux.Close;
  With qryAux.Sql Do
    Begin
      Clear;
      Add('SELECT l.idlancirrf               ');
      Add('FROM lancirrf l, lancxinforme x   ');
      Add('WHERE l.idlancirrf = x.idlancirrf ');
      Add('      AND L.IDBENEFIRRF = ' + IntToStr(pIdResp));
      Add('      AND l.idhstfolhabenef = ' + IntToStr(pVersaoFolha));
      Add('      AND l.idplanoprev = ' + IntToStr(pIdPlanoPrev)); // Andre Imakawa - SIG 59382
      Add('      AND x.idinforme = ' + IntToStr(pIdInforme));
    End;
  qryAux.Open;
  Result := Not qryAux.isEmpty;
  FreeAndNil(qryAux);
End;
// André Imakawa - SIG 58893 - Fim


//edilaine - SIG80791 - inicio
Function TCtrlBUSCA_DIRFFolhaBeneficios._VerificandoOcorrenciaDoIDINFORMEProcessado(pCPF : String; pIdInforme : integer; Const pAnoExercicio : Integer = -1; pVersaoFolha : Integer = -1): Boolean;
Var qryAux: TwwQuery;
Begin
  qryAux := TwwQuery.Create(Nil);
  qryAux.DatabaseName := 'BaseDados';
  qryAux.Close;
  With qryAux.Sql Do
    Begin
      Clear;
      Add('SELECT l.idlancirrf               ');
      Add('FROM lancirrf l, lancxinforme x   ');
      Add('WHERE l.idlancirrf = x.idlancirrf ');
      Add('      AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPF) + ')');
      Add('      AND x.idinforme = ' + IntToStr(pIdInforme));
      if pAnoExercicio = -1 then
         Add('      AND l.idhstfolhabenef = ' + IntToStr(pVersaoFolha))
      else
         Add('      AND TO_CHAR(l.datapagamento, ''YYYY'') = ' + quotedstr(IntToStr(pAnoExercicio)));
    End;
  qryAux.Open;
  Result := not qryAux.isEmpty;

  FreeAndNil(qryAux);
End;
//edilaine - SIG80791 - fim


Function TCtrlBUSCA_DIRFFolhaBeneficios._RetornaValorTotalIDINFORMENoMovProcessado(Const pCPF: String; Const pVersaoFolhaAtual, pIdInforme: Integer; bAgrupa : boolean = true): Double;
Var qryAux: TwwQuery;

Begin
  qryAux := TwwQuery.Create(Nil);
  qryAux.DatabaseName := 'BaseDados';
  qryAux.Close;
  Result := 0.00;
  With qryAux.Sql Do
    Begin
      Clear;
      Add('SELECT sum(x.vlrlanc) vlrlanc                                                 ');
      Add('FROM lancirrf l, lancxinforme x                                               ');
      Add('WHERE l.idlancirrf = x.idlancirrf                                             ');
      Add('      AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPF) + ')');
      Add('      AND l.idhstfolhabenef = ' + IntToStr(pVersaoFolhaAtual));
      Add('      AND x.idinforme = ' + IntToStr(pIdInforme));

      if bAgrupa then      //edilaine - SIG80944
         Add('GROUP BY l.idlancirrf                                                      ');
    End;
  qryAux.Open;
  If Not qryAux.isEmpty Then
    Result := qryAux.fieldbyname('vlrlanc').AsFloat;

  FreeAndNil(qryAux);
End;

// Andre Imakawa - SIG 21776 - Inicio
Function TCtrlBUSCA_DIRFFolhaBeneficios._RetornaValorTotalIDINFORMENoMovProcessadoResp(Const pVersaoFolhaAtual, pIdInforme: Integer; pCPF: String): Double;
Var qryAux: TwwQuery;
Begin
  qryAux := TwwQuery.Create(Nil);
  qryAux.DatabaseName := 'BaseDados';
  qryAux.Close;
  Result := 0.00;
  With qryAux.Sql Do
    Begin
      Clear;
	  // Andre Imakawa - SIG 50681 - Inicio
      Add('SELECT SUM(TAB1.VLRLANC) VLRLANC FROM                                         ');
      ADD('( SELECT *');
      Add('FROM lancirrf l, lancxinforme x                                               ');
      Add('WHERE l.idlancirrf = x.idlancirrf                                             ');
      Add('      AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPF)+')');
      Add('      AND l.idhstfolhabenef = ' + IntToStr(pVersaoFolhaAtual));
      Add('      AND x.idinforme = ' + IntToStr(pIdInforme));
      Add('AND NVL(L.FLGLANC_COMPENSABUSCA,''N'') = ''N'' ');
      Add('AND X.VLRLANC > 0 ');

      ADD(' UNION ');
      ADD('SELECT * ');
      Add('FROM lancirrf l, lancxinforme x                                               ');
      Add('WHERE l.idlancirrf = x.idlancirrf                                             ');
      Add('      AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPF)+')');
      Add('      AND l.idhstfolhabenef = ' + IntToStr(pVersaoFolhaAtual));
      Add('      AND x.idinforme = ' + IntToStr(pIdInforme));
      Add('AND NVL(L.FLGLANC_COMPENSABUSCA,''N'') = ''S'' ) TAB1');
	  // Andre Imakawa - SIG 50681 - Fim

      //edilaine SIG113550 : inicio
      if (bCompensaInformeAcJud) and (bCompensaAcJud) then
         Add(' WHERE NVL(TAB1.IDPROCJUD,0) = '+IntToStr(iIdProcJudFund) );
      //edilaine SIG113550 : fim

    End;
  qryAux.Open;
  If Not qryAux.isEmpty Then
    Result := qryAux.fieldbyname('vlrlanc').AsFloat;

  FreeAndNil(qryAux);
End;
// Andre Imakawa - SIG 21776 - Fim


Function TCtrlBUSCA_DIRFFolhaBeneficios._RetornaQtdParcelasIDINFORMENoMovProcessado(pCPF, pAnoExercicio: String; pIdInforme: Integer): Integer;
Var qryAux: TwwQuery;
Begin
  qryAux := TwwQuery.Create(Nil);
  qryAux.DatabaseName := 'BaseDados';
  Result := 0;
  qryAux.Close;
  With qryAux.Sql Do
    Begin
      Clear;
      Add('select count (*) qtdParcelasInforme                                            ');
      Add('FROM lancirrf l, lancxinforme x                                                ');
      Add('WHERE l.idlancirrf = x.idlancirrf                                              ');
      Add('      AND TO_CHAR(l.datapagamento, ''YYYY'') = ' + quotedstr(pAnoExercicio));
      Add('      AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPF) + ')');
      Add('      AND x.idinforme = ' + IntToStr(pIdInforme));
      Add('      AND l.FLGLANC_COMPENSABUSCA IS NULL                                      ');
      Add('      And x.vlrlanc > 0 ');
    End;
  qryAux.Open;
  If Not qryAux.isEmpty Then
    Result := qryAux.fieldbyname('qtdParcelasInforme').AsInteger;

  FreeAndNil(qryAux);
End;

// Paulo Nobre - SIG 21776
// Paulo Nobre - SIG 35148
{Function TCtrlBUSCA_DIRFFolhaBeneficios._TotalizaAsDeducoesDo13(pCPFQuitacaoAtu, pAnoExercicio: String; pFontePagadora: Integer): Double;
Var qryAux: TwwQuery;
Begin
  qryAux := TwwQuery.Create(Nil);
  qryAux.DatabaseName := 'BaseDados';
  Result := 0.00;
  qryAux.Close;
  With qryAux.Sql Do
    Begin
      Clear;
      Add('SELECT TO_CHAR(l.datapagamento, ''YYYY''), sum(x.vlrlanc) totded13');
      Add('FROM lancirrf l, lancxinforme x, informe i');
      Add('WHERE l.idlancirrf = x.idlancirrf   ');
      Add('      AND x.idinforme = i.idinforme ');
      Add('      AND TO_CHAR(l.datapagamento, ''YYYY'') = ' + quotedstr(pAnoExercicio));
      Add('      AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPFQuitacaoAtu) + ')');
      Add('      AND x.fontepagadora = ' + inttostr(pFontePagadora));
      Add('      AND i.FLGUSADOBUSCAQUITACAO = ''S''   '); // Só com os IDINFORMES usados na quitação (13º)
      Add('      AND i.flgnatureza = ''N''             '); // Só com os IDINFORMES de natureza de dedução (Negativas)
      Add('GROUP BY TO_CHAR(l.datapagamento, ''YYYY'') ');
    End;
  qryAux.Open;
  If Not qryAux.isEmpty Then
    Result := qryAux.fieldbyname('totded13').asFloat;

  FreeAndNil(qryAux);
End;}

Procedure TCtrlBUSCA_DIRFFolhaBeneficios._AnalisaPeriodicidadeAcaoJudicialQuitacao(pIdResponsavel: Integer; pDataIni, pDataFim: TDateTime);
Var dDataFinalMesQuitacao, dDataFinalProcJud: TDateTime;
Begin
  bFlgProcEncerradoAteQuitacao := false;    //edilaine - SIG96083

  bFlgFimProcJudOcorreuMesQuitacao := False;
  iIdPessoaProcJud := 0;
  iIdProcJudFund := 0;
  dPercAcaoJudicial := 0.00;

  qryVerificaExistenciaAcaoJudicial.Close;
  qryVerificaExistenciaAcaoJudicial.SQL.Text :=
    'SELECT PROCJUD.IDPESSOA,' +
    '       PROCJUD.IDPROCJUD,' +
    '       PROCJUD.DATAINICIO,' +
    '       PROCJUD.DATAFINAL,' +
    '       PROCJUD.PERCACAO ' +
    'FROM PROCJUD ' +
    'WHERE PROCJUD.IDPESSOA = :pIdResp' +

     //William Moreira da Silva - SIG 38795
    //'      AND PROCJUD.DATAINICIO <= :pDataFinal' +                                      // André Imakawa -  SIG 19510
    //'      AND (PROCJUD.SITPROCESSO = 0                                         ' + // André Imakawa -  SIG 19510
    //'            OR (PROCJUD.SITPROCESSO = 2 AND PROCJUD.DATAFINAL > :pDataFinal)) ' + // André Imakawa -  SIG 19510
    //'      AND ((PROCJUD.DATAFINAL IS NULL) OR (PROCJUD.DATAFINAL > :pDataInicial))' +   // André Imakawa -  SIG 19510

  // Andre Imakawa - SIG 39948 - Inicio
   ' AND ( ' +
  // '  PROCJUD.SITPROCESSO = 0 ' +
  // '  OR (PROCJUD.SITPROCESSO = 2 AND PROCJUD.DATAFINAL = NULL AND PROCJUD.DATAINICIO <= :pDataInicial) ' +
  // '  OR (PROCJUD.SITPROCESSO = 2 AND PROCJUD.DATAINICIO <= :pDataInicial AND PROCJUD.DATAFINAL >= :pDataFinal) ' +

   '  (PROCJUD.SITPROCESSO = 0 AND PROCJUD.DATAINICIO <= :pDataInicial AND ' +
   '  ((PROCJUD.DATAFINAL > :pDataFinal)  OR (PROCJUD.DATAFINAL IS NULL)) )' +
   '  OR (PROCJUD.SITPROCESSO = 2 AND PROCJUD.DATAINICIO <= :pDataInicial AND ' +
  //'  PROCJUD.DATAFINAL > :pDataFinal) ' +  // Marcelo Cardoso - SIG47457
  // Andre Imakawa - SIG 39948 - Fim
  '  PROCJUD.DATAFINAL >= :pDataFinal) ' +  // Marcelo Cardoso - SIG47457 - Adicioando ">=" para pDataFinal
   ' ) ' +
  //William Moreira da Silva - SIG 38795

  //Cássio Rovaroto - SIG nº 74355 - Início
  //'      AND PROCJUD.PERCACAO <> 0 ';
    '      AND PROCJUD.PERCACAO <> 0 '+
    '      AND EXISTS (SELECT 1 FROM DETPROCJUD D WHERE D.IDPROCJUD = PROCJUD.IDPROCJUD)    ' + //TAES - SIG96560
    '     AND NOT EXISTS (SELECT 1   ' +
    '                       FROM (SELECT CASE WHEN INSTR(REGRA.NOMEREGRA, ''EQUA'') <> 0 THEN 1 ' +
    '                                          ELSE 0 END AS EQUA   ' +
    '                               FROM DETPROCJUD, REGRA          ' +
    '                              WHERE REGRA.IDREGRA = DETPROCJUD.IDREGRA ' +
    '                                AND DETPROCJUD.IDPROCJUD = PROCJUD.IDPROCJUD) A ' +
    '                      WHERE A.EQUA = 1)  ';
     //Cássio Rovaroto - SIG nº 74355 - Fim

  qryVerificaExistenciaAcaoJudicial.ParamByName('pIdResp').asInteger := pIdResponsavel;
  qryVerificaExistenciaAcaoJudicial.ParamByName('pDataInicial').asDateTime := pDataIni; // André Imakawa -  SIG 19510 //William Moreira da Silva - SIG 38795
  qryVerificaExistenciaAcaoJudicial.ParamByName('pDataFinal').asDateTime := pDataFim;
  If Not qryVerificaExistenciaAcaoJudicial.Prepared Then
    qryVerificaExistenciaAcaoJudicial.Prepare;
  qryVerificaExistenciaAcaoJudicial.Open;

  bTemAcaoJudicial := (Not qryVerificaExistenciaAcaoJudicial.IsEmpty);
  If bTemAcaoJudicial Then
    Begin
      iIdPessoaProcJud := iIdResponsavelAtual;
      iIdProcJudFund := qryVerificaExistenciaAcaoJudicial.fieldbyname('IDPROCJUD').asInteger;

      // Testando se o final do processo ocorreu no mês padrão de quitação (Novembro)
      dDataFinalMesQuitacao := strtodate('30/' + sMesPadraoPagto13FUNCEF + '/' + FormatDateTime('yyyy', dtDataPagtoUltimaFolha));
      dDataFinalProcJud := strtodate('31/12/9999');
      If Not qryVerificaExistenciaAcaoJudicial.fieldByname('DATAFINAL').IsNull Then
        dDataFinalProcJud := qryVerificaExistenciaAcaoJudicial.fieldByname('DATAFINAL').asDateTime;

      bFlgFimProcJudOcorreuMesQuitacao := (dDataFinalProcJud >= dDataFinalMesQuitacao);

      bFlgProcEncerradoAteQuitacao := (dDataFinalProcJud < strtodate('01/' + sMesPadraoPagto13FUNCEF + '/' + FormatDateTime('yyyy', dtDataPagtoUltimaFolha)) );    //edilaine - SIG96083

      dPercAcaoJudicial := qryVerificaExistenciaAcaoJudicial.FieldByName('percacao').AsFloat;

      // Edilaine - SIG 19523 - inicio
      // BUA - Benefício Único Antecipado ou Renda Antecipada ou Peculio
      // Ações do BUA, é uma ação coletiva que se refere à revisão do cálculo
      // do benefício para quem sacou o BUA por ocasião do saldamento do REG/REPLAN.
      bTemAcaoJudicial_BUA := _VerificaExistenciaDoUsoDeRegras(sCPFBeneficiarioSelecionadoQuita, iIdProcJudFund, iIdPessoaProcJud, 1);
      // Edilaine - SIG 19523 - fim
    End;
End;

//
// Rotina da Quitação para realizar os cálculos da Quitação para Beneficiários NÃO ISENTO e ISENTOS PARCIALMENTE
//

Procedure TCtrlBUSCA_DIRFFolhaBeneficios._ProcessaCalculoDosRendimentosQuitacao(pValorIDINFORMEDestino: Double; pQtdDeParcelasDoInformeQuitacao: Integer);
Var RegAtual: TBookMark;
  dValorIDINFORME123, dVlDepenAnt, dVlDepenAtu {, dTotalMovProcessado}: Double;
  dTotalMovProcessado123, dTotalMovProcessado124, dValorCalculado: Double; // Andre Imakawa - SIG 35148
  qryAux: TwwQuery;
  bDif: Boolean;
  cdsAux: TCmClientDataSet;
Begin
  dValorIDINFORME123 := 0.00;
  dTotalMovProcessado123 := 0.00; // Andre Imakawa - SIG 35148
  dTotalMovProcessado124 := 0.00; // Andre Imakawa - SIG 35148
  dValorCalculado := 0.00; // Andre Imakawa - SIG 35148


  // Avaliando o IDINFORME 62 (13º salário proventos FUNCEF)
  If iIdInformeAvaliacao = iIdInforme13FUNCEF Then
    Begin
      dValorTotalIDINFORMEGravarQuitacao := dValorTotalIDINFORMEQuitacao + pValorIDINFORMEDestino;

      If bBeneficiarioIdoso Then
        Begin
          // Se o Valor total do 62 for < que o Valor parametrizado do Idoso, então será avaliado se dá para abater do 61 também
          If dValorTotalIDINFORMEGravarQuitacao < dValorDescontoIdosoParam Then
            Begin
              // Recurso usado para somente gravar um registro do 123 por CPF
              If (Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65 {123})) And
                (Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65INSS {124})) Then
                Begin
                  // Gravando a Contra-partida do IDINFORME 62 (13º salário proventos FUNCEF)
                  // com o valor negativo para anular parcelas lançadas no ano
                  _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');

                  // Gravando o IDINFORME parametrizado (123 - 13º Parte dos proventos 65 anos ) com este Valor Total
                  _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65, iFontePagadora, dValorTotalIDINFORMEQuitacao, 'Q');

                  {//Inicio: Edilaine - SIG80944
                  // Paulo Nobre - SIG 35148
                  //
                  // Avaliando o IDINFORME 61 (13º salário proventos INSS)
                  //

                  RegAtual := CdsMovIndividualIdResponsavelQuitacao.GetBookmark; // Salvando o ponteiro do Registro atual

                  // Localizando dados do IDINFORME 61 (13º salário proventos INSS)
                  If CdsMovIndividualIdResponsavelQuitacao.Locate('codnatureza;idinforme', VarArrayOf([sCodigoNaturRendINSS, inttostr(iIdInforme13INSS)]), []) Then
                    //                  If CdsMovIndividualIdResponsavelQuitacao.Locate('IDBENEFIRRF;fontepagadora;codnatureza;idinforme', VarArrayOf([inttostr(iIdResponsavelAtual), 2, sCodigoNaturRendINSS, inttostr(iIdInforme13INSS)]), []) Then
                    Begin

                      dValorIDINFORME123 := dValorTotalIDINFORMEQuitacao;

                      // Carregando os dados do IDINFORME 61
                      _CarregaDadosDoIDINFORMEParaQuitacao(dtDataPagtoUltimaFolha);

                      dTotalIdInforme13INSS := dValorTotalIDINFORMEQuitacao; // Valor total do 61

                      // André Imakawa - SIG 19498 - Inicio
                      If (dValorDescontoIdosoParam <> dValorIDINFORME123) Then
                        Begin
                          // Paulo Nobre - SIG 21776 - Inicio
                          // Recurso usado para somente gravar um registro do 124 por CPF
                          If Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65INSS ) Then
                            Begin
                              // Paulo Nobre - SIG 35148
                              dValorSemIdadeIdoso := Abs(dValorIDINFORME123 - dValorDescontoIdosoParam);
                              //
                              // Se o Valor total do 61 for >= que a diferença entre o Valor Total do 62 menos o valor do idoso
                              If dTotalIdInforme13INSS >= dValorSemIdadeIdoso Then
                                Begin
                                  // Gravando a Contra-partida do IDINFORME 61 (13º salário proventos INSS)
                                  // com o valor negativo para anular parcelas lançadas no ano
                                  _GravarDadosIRRF_Beneficiario(iIdInforme13INSS, iFontePagadora, dTotalIdInforme13INSS * -1, 'Q');

                                  dValorCalculado := Abs(dTotalIdInforme13INSS - Abs(dValorDescontoIdosoParam - dValorIDINFORME123));

                                  // Gravando a Contra-partida do IDINFORME 61 (13º salário proventos INSS) negative sem o Valor do idoso
                                  _GravarDadosIRRF_Beneficiario(iIdInforme13INSS, iFontePagadora, dValorCalculado, 'Q');

                                  dValorCalculado := Abs(dValorDescontoIdosoParam - dValorIDINFORME123);

                                  // Gravando o IDINFORME parametrizado 124 (13º Parte dos Proventos 65 anos - INSS) com o valor sem o valor do idoso
                                  _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65INSS, iFontePagadora, dValorCalculado, 'Q');
                                End
                              Else // Se o Valor total do 61 for < que a diferença entre o Valor Total do 62 menos o valor do idoso
                                Begin

                                  // Gravando a Contra-partida do IDINFORME 61 (13º salário proventos INSS)
                                  // com o valor negativo para anular parcelas lançadas no ano
                                  _GravarDadosIRRF_Beneficiario(iIdInforme13INSS, iFontePagadora, dTotalIdInforme13INSS * -1, 'Q');

                                  // Gravando o IDINFORME parametrizado 124 (13º Parte dos Proventos 65 anos - INSS) com o valor total do 61
                                  _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65INSS, iFontePagadora, dTotalIdInforme13INSS, 'Q');

                                  // Caso houver valor do destino, é porque houve lançamento de 142, então será
                                  // necessário matar o total do 61 lançado quando do processamento do 142.
                                  If pValorIDINFORMEDestino <> 0.00 Then
                                    // Gravando a Contra-partida do IDINFORME 61 (13º salário proventos INSS)
                                    // com o valor negativo para anular parcelas lançadas no ano
                                    _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65INSS, iFontePagadora, dTotalIdInforme13INSS * -1, 'Q');
                                End;
                            End;
                          // Paulo Nobre - SIG 21776 - Fim
                        End;

                      // André Imakawa - SIG 19498 - Fim
                    End;

                  If RegAtual <> Nil Then
                    CdsMovIndividualIdResponsavelQuitacao.GotoBookmark(RegAtual); // Voltando ao Reg. atual
                  }  //Fim: Edilaine - SIG80944
                End
                  // André Imakawa - SIG 35148 - Inicio
                  // Se ja existir um registro 123, verificar se o valor é menor que o parametrizado para idoso
                  // se for menor o sistema deverá lançar a diferença em outro 123.
              Else
                Begin
                  // Total de 123 e 124 já lançados
                  dTotalMovProcessado123 := _RetornaValorTotalIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65);
                  dTotalMovProcessado124 := _RetornaValorTotalIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65INSS);

                  // Paulo Nobre - SIG 21776
                  // Verificando se o parametrizado do idoso foi alcançado
                  If ROUNDCM(Abs(dTotalMovProcessado123 + dTotalMovProcessado124), 2) < ROUNDCM(dValorDescontoIdosoParam, 2) Then
                    Begin
                      dValorCalculado := dValorDescontoIdosoParam - Abs(dTotalMovProcessado123 + dTotalMovProcessado124);

                      // Quando valor do informe for MENOR que o valor do idoso ja recalculado, lançar a contra-partida
                      // e o restante no 123
                      If dValorTotalIDINFORMEQuitacao <= dValorCalculado Then
                        Begin
                          // Gravando a Contra-partida do IDINFORME 62 (13º salário proventos FUNCEF)
                          // com o valor negativo para anular parcelas lançadas no ano
                          _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');

                          // Gravando o IDINFORME parametrizado 123 (13º Parte dos proventos 65 anos) com o valor do idoso
                          _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65, iFontePagadora, dValorTotalIDINFORMEQuitacao, 'Q');
                        End
                      Else
                        // Quando valor do informe for MAIOR que o valor do idoso ja recalculado, lançar a contra-partida
                        // Lançar no idoso o valor recalculado e a diferença no idinforme 62.
                        Begin
                          // Gravando a Contra-partida do IDINFORME 62 (13º salário proventos FUNCEF)
                          // com o valor negativo para anular parcelas lançadas no ano
                          _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');

                          dValorSemIdadeIdoso := dValorTotalIDINFORMEQuitacao - dValorCalculado;

                          // Gravando o IDINFORME parametrizado 123 (13º Parte dos proventos 65 anos) com o valor do idoso
                          _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65, iFontePagadora, dValorCalculado, 'Q');

                          // Gravando o IDINFORME 62 (13º salário proventos FUNCEF) com este Valor Calculado
                          _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorSemIdadeIdoso, 'Q');
                        End;
                    End;
                  // Andre Imakawa - SIG 40654 - Inicio
                  // Não necessario lançar a contra partida devido o valor do idoso já havido sido quitado por inteiro
                  {
                  Else
                    // Quando valor lançado no 123 for igual ao parametrizado, apenas lançar a contra-partida.
                    Begin
                      // Gravando a Contra-partida do IDINFORME 62 (13º salário proventos FUNCEF)
                      // com o valor negativo para anular parcelas lançadas no ano
                      _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');
                    End;
                  }
                  // Andre Imakawa - SIG 40654 - Fim
                End;
              // André Imakawa - SIG 35148 - Fim
            End
          Else // Valor total do 62 >= que o Valor parametrizado do Idoso
            Begin
              // Abatendo da Totalização do 62 (13º salário FUNCEF) o valor parametrizado do Idoso
              dValorSemIdadeIdoso := Abs(dValorTotalIDINFORMEQuitacao - dValorDescontoIdosoParam);

              // Processo Judicial Terminou DURANTE ou APÓS o mês padrão de Quitação
              If bFlgFimProcJudOcorreuMesQuitacao Then
                Begin
                  // Este flag é para indicar que pelo menos um dos IDRESPONSAVEIS (quando o CPF tiver 2)
                  // teve ação judicial. No caso do IDRESPONSAVEL que não tiver ação, a gravação
                  // deverá ser direta, sem tratamento.
                  bTeveUmIDRespComCalculoDeAcaoJudicial := True;

                  // Gravando a Contra-partida do IDINFORME 62 (13º salário proventos FUNCEF)
                  // com o valor negativo para anular parcelas lançadas no ano
                  _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');

                  //William Moreira da Silva - SIG 27868
                  If ((bTemAcaoJudicial_BUA) And (bTemRendimento_BUA)) // Edilaine - SIG 19523 - inicio
                  Or ((bTemAcaoJudicial) {And Not (bTemAcaoJudicial_BUA)}) Then //Darivaldo Alencar SIG 23797    //edilaine SIG99002
                    //William Moreira da Silva - SIG 27868
                    Begin
                      // Calculando o valor da Ação Judicial
                      dValorAcaoJud := RoundCM((dValorSemIdadeIdoso * (dPercAcaoJudicial / 100)), 2);

                      If dPercAcaoJudicial < 100 Then // se for < 100% calcula e grava
                        Begin
                          // Calculando o novo valor do IDINFORME 62
                          dValorCalculado := dValorSemIdadeIdoso - dValorAcaoJud;
                          // Gravando o IDINFORME 62 (13º salário proventos FUNCEF) com este Valor Calculado
                          _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorCalculado, 'Q');
                        End;

                      // Gravando o IDINFORME parametrizado 167 (13º Sal. Proventos Exig. Suspensa FUNCEF) com o Valor da Ação
                      _GravarDadosIRRF_Beneficiario(iLinhaRendAcJud13, iFontePagadora, dValorAcaoJud, 'Q');
                    End
                  Else
                    Begin
                      // Gravando o IDINFORME 62 (13º salário proventos FUNCEF) com este Valor Calculado
                      _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorSemIdadeIdoso, 'Q');
                    End;
                  // Edilaine - SIG 19523 - fim

                  // Recurso usado para somente gravar um registro do 123 por CPF
                  If (Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65 {123})) And
                    (Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65INSS {124})) Then
                    Begin
                      // Gravando o IDINFORME parametrizado 123 (13º Parte dos proventos 65 anos) com o valor do idoso
                      _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65, iFontePagadora, dValorDescontoIdosoParam, 'Q');
                    End;
                End
              Else // Não tem Processo Judicial OU Processo Judicial Terminou ANTES do mês padrão de Quitação
                Begin
                  // Este flag é para indicar que pelo menos um dos IDRESPONSAVEIS (quando o CPF tiver 2)
                  // teve ação judicial. No caso do IDRESPONSAVEL que não tiver ação, a gravação
                  // deverá ser normal sem cálculo de ação judicial.
                  If Not bTeveUmIDRespComCalculoDeAcaoJudicial Then
                    Begin
                      // Recurso usado para somente gravar um registro do 123 por CPF
                      If (Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65 {123})) And
                         (Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65INSS {124})) Then
                        Begin
                          // Gravando a Contra-partida do IDINFORME 62 (13º salário proventos FUNCEF)
                          // com o valor negativo para anular parcelas lançadas no ano
                          _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');

                          // Gravando o IDINFORME 62 (13º salário proventos FUNCEF) com o valor sem o valor do idoso
                          _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorSemIdadeIdoso, 'Q');

                          // Gravando o IDINFORME parametrizado 123 (13º Parte dos proventos 65 anos) com o valor do idoso
                          _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65, iFontePagadora, dValorDescontoIdosoParam, 'Q');

                          // Caso houver valor do destino, é porque houve lançamento de 141, então será
                          // necessário matar o total do 62 lançado quando do processamento do 141.
                          If pValorIDINFORMEDestino <> 0.00 Then
                            // Gravando a Contra-partida do IDINFORME 62 (13º salário proventos FUNCEF)
                            // com o valor negativo para anular parcelas lançadas no ano
                            _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');
                        End

                      else     //Inicio: Edilaine - SIG80944
                        begin
                          // Total de 123 e 124 já lançados
                          dTotalMovProcessado123 := _RetornaValorTotalIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65, false);
                          dTotalMovProcessado124 := _RetornaValorTotalIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65INSS, false);

                          // Paulo Nobre - SIG 21776
                          // Verificando se o parametrizado do idoso foi alcançado
                          If ROUNDCM(Abs(dTotalMovProcessado123 + dTotalMovProcessado124), 2) < ROUNDCM(dValorDescontoIdosoParam, 2) Then
                            Begin
                              dValorCalculado := dValorDescontoIdosoParam - Abs(dTotalMovProcessado123 + dTotalMovProcessado124);

                              // Quando valor do informe for MENOR que o valor do idoso ja recalculado, lançar a contra-partida
                              // e o restante no 123
                              If dValorTotalIDINFORMEQuitacao <= dValorCalculado Then
                                Begin
                                  // Gravando a Contra-partida do IDINFORME 62 (13º salário proventos FUNCEF)
                                  // com o valor negativo para anular parcelas lançadas no ano
                                  _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');

                                  // Gravando o IDINFORME parametrizado 123 (13º Parte dos proventos 65 anos) com o valor do idoso
                                  _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65, iFontePagadora, dValorTotalIDINFORMEQuitacao, 'Q');
                                End
                              Else
                                // Quando valor do informe for MAIOR que o valor do idoso ja recalculado, lançar a contra-partida
                                // Lançar no idoso o valor recalculado e a diferença no idinforme 62.
                                Begin
                                  // Gravando a Contra-partida do IDINFORME 62 (13º salário proventos FUNCEF)
                                  // com o valor negativo para anular parcelas lançadas no ano
                                  _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');

                                  dValorSemIdadeIdoso := dValorTotalIDINFORMEQuitacao - dValorCalculado;

                                  // Gravando o IDINFORME parametrizado 123 (13º Parte dos proventos 65 anos) com o valor do idoso
                                  _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65, iFontePagadora, dValorCalculado, 'Q');

                                  // Gravando o IDINFORME 62 (13º salário proventos FUNCEF) com este Valor Calculado
                                  _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorSemIdadeIdoso, 'Q');
                                End;
                            End;
                        End;   //Fim: Edilaine - SIG80944

                    End;

                End;
            End;
        End
      Else
        // -------------------- Avaliações p/ Beneficiário NÃO IDOSO -----------------------
        Begin
          // Processo Judicial terminou DURANTE e APÓS o mês padrão de Quitação
          If (bFlgFimProcJudOcorreuMesQuitacao) And
            //William Moreira da Silva - SIG 27868
          (((bTemAcaoJudicial_BUA) And (bTemRendimento_BUA)) // Edilaine - SIG 19523
            Or ((bTemAcaoJudicial) And Not (bTemAcaoJudicial_BUA))) Then //Darivaldo SIG 23797
            //William Moreira da Silva - SIG 27868
            Begin
              // Este flag é para indicar que pelo menos um dos IDRESPONSAVEIS (quando o CPF tiver 2) teve ação judicial.
              bTeveUmIDRespComCalculoDeAcaoJudicial := True;

              // Gravando a Contra-partida do IDINFORME 62 (13º salário proventos FUNCEF)
              // com o valor negativo para anular parcelas lançadas no ano
              _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');

              // Calculando o valor da Ação Judicial
              dValorAcaoJud := RoundCM((dValorTotalIDINFORMEQuitacao * (dPercAcaoJudicial / 100)), 2);

              If dPercAcaoJudicial < 100 Then // se for < 100% calcula e grava
                Begin
                  // Calculando o novo valor do IDINFORME 62
                  dValorCalculado := dValorTotalIDINFORMEQuitacao - dValorAcaoJud;
                  // Gravando o IDINFORME 62 (13º salário proventos FUNCEF) com este Valor Calculado
                  _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorCalculado, 'Q');
                End;

              // Gravando o IDINFORME parametrizado 167 (13º Sal. Proventos Exig. Suspensa FUNCEF) com o Valor da Ação
              _GravarDadosIRRF_Beneficiario(iLinhaRendAcJud13, iFontePagadora, dValorAcaoJud, 'Q');
            End
          Else // Processo Judicial Terminou ANTES do mês padrão de Quitação
            Begin
              If pValorIDINFORMEDestino = 0.00 Then // Andre Imakawa - SIG 19498
                exit;

              // Este flag é para indicar que pelo menos um dos IDRESPONSAVEIS (quando o CPF tiver 2)
              // teve ação judicial. No caso do IDRESPONSAVEL que não tiver ação, a gravação
              // deverá ser normal sem cálculo de ação judicial.
              If Not bTeveUmIDRespComCalculoDeAcaoJudicial Then
                Begin
                  // Gravando a Contra-partida do IDINFORME 62 (13º salário proventos FUNCEF)
                  // com o valor negativo para anular parcelas lançadas no ano
                  _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');
                End;

              // Gravando o IDINFORME lido no momento com seu valor total
              _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao, 'Q');
            End;
        End;
    End
      //  Avaliando o IDINFORME 61 (13º salário proventos INSS)
  Else If (iIdInformeAvaliacao = iIdInforme13INSS) Then
    Begin
      dTotalIdInforme13INSS := dValorTotalIDINFORMEQuitacao; // Valor total do 61

      If pQtdDeParcelasDoInformeQuitacao >= 1 Then // Rotina Normal, pois há 1 ou mais lançamentos do 61
        Begin
          // Verifica se o 123 NÃO foi lançado p/ o CPF. Isso significa que não houve
          // existência de lançamentos do 62 quando o Beneficiário for IDOSO e neste
          // caso não haverá mais tratamento para o 61
          If Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65) Then
            Begin
              // Paulo Nobre SOL 268373 PPM 1260556
              If bBeneficiarioIdoso Then
                Begin
                  // Se o Valor total do 61 for >= que o Valor do idoso
                  If dTotalIdInforme13INSS >= dValorDescontoIdosoParam Then
                    Begin
                      // Recurso usado para somente gravar um registro do 124 por CPF
                      If Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65INSS {124}) Then
                        Begin
                          // Gravando a Contra-partida do IDINFORME 61 (13º salário proventos INSS)
                          // com o valor negativo para anular parcelas lançadas no ano
                          _GravarDadosIRRF_Beneficiario(iIdInforme13INSS, iFontePagadora, dTotalIdInforme13INSS * -1, 'Q');

                          // Abatendo da Totalização do 61 o valor parametrizado do Idoso
                          dValorSemIdadeIdoso := dTotalIdInforme13INSS - dValorDescontoIdosoParam;

                          // Gravando a Contra-partida do IDINFORME 61 (13º salário proventos INSS) negativo sem o Valor do idoso
                          _GravarDadosIRRF_Beneficiario(iIdInforme13INSS, iFontePagadora, dValorSemIdadeIdoso, 'Q');

                          // Gravando o IDINFORME parametrizado 124 (13º Parte dos Proventos 65 anos - INSS) com o valor do Idoso
                          _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65INSS, iFontePagadora, dValorDescontoIdosoParam, 'Q');

                          // Caso houver valor do destino, é porque houve lançamento de 142, então será
                          // necessário matar o total do 61 lançado quando do processamento do 142.
                          If pValorIDINFORMEDestino <> 0.00 Then
                            // Gravando a Contra-partida do IDINFORME 61 (13º salário proventos INSS)
                            // com o valor negativo para anular parcelas lançadas no ano
                            _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65INSS, iFontePagadora, dTotalIdInforme13INSS * -1, 'Q');
                        End;
                    End
                  Else // Se o Valor total do 61 for < que o valor do idoso
                    Begin
                      // Recurso usado para somente gravar um registro do 124 por CPF
                      If Not _VerificandoOcorrenciaDoIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65INSS {124}) Then
                        Begin
                          // Gravando o IDINFORME parametrizado 124 (13º Parte dos Proventos 65 anos - INSS) com o valor total do 61
                          _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65INSS, iFontePagadora, dTotalIdInforme13INSS, 'Q');

                          //William Moreira da Silva - SIG 19503
                          _GravarDadosIRRF_Beneficiario_61(iIdInforme13INSS, iFontePagadora, 'Q');
                          //William Moreira da Silva - SIG 19503
                        End;
                    End;
                End;
            End
          //Inicio: Edilaine - SIG80944
          else
            begin
              // Total de 123 e 124 já lançados
              dTotalMovProcessado123 := _RetornaValorTotalIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65, false);
              dTotalMovProcessado124 := _RetornaValorTotalIDINFORMENoMovprocessado(sCPFBeneficiarioSelecionadoQuita, iVersaoUltimaFolha, iLinhaAbonoAcima65INSS, false);

              // Paulo Nobre - SIG 21776
              // Verificando se o parametrizado do idoso foi alcançado
              If ROUNDCM(Abs(dTotalMovProcessado123 + dTotalMovProcessado124), 2) < ROUNDCM(dValorDescontoIdosoParam, 2) Then
                Begin
                  dValorCalculado := dValorDescontoIdosoParam - Abs(dTotalMovProcessado123 + dTotalMovProcessado124);

                  // Quando valor do informe for MENOR que o valor do idoso ja recalculado, lançar a contra-partida
                  // e o restante no 123
                  If dValorTotalIDINFORMEQuitacao <= dValorCalculado Then
                    Begin
                      // Gravando a Contra-partida do IDINFORME 62 (13º salário proventos FUNCEF)
                      // com o valor negativo para anular parcelas lançadas no ano
                      _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');

                      // Gravando o IDINFORME parametrizado 123 (13º Parte dos proventos 65 anos) com o valor do idoso
                      _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65INSS, iFontePagadora, dValorTotalIDINFORMEQuitacao, 'Q');
                    End
                  Else
                    // Quando valor do informe for MAIOR que o valor do idoso ja recalculado, lançar a contra-partida
                    // Lançar no idoso o valor recalculado e a diferença no idinforme 62.
                    Begin
                      // Gravando a Contra-partida do IDINFORME 62 (13º salário proventos FUNCEF)
                      // com o valor negativo para anular parcelas lançadas no ano
                      _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');

                      dValorSemIdadeIdoso := dValorTotalIDINFORMEQuitacao - dValorCalculado;

                      // Gravando o IDINFORME parametrizado 123 (13º Parte dos proventos 65 anos) com o valor do idoso
                      _GravarDadosIRRF_Beneficiario(iLinhaAbonoAcima65INSS, iFontePagadora, dValorCalculado, 'Q');

                      // Gravando o IDINFORME 62 (13º salário proventos FUNCEF) com este Valor Calculado
                      _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorSemIdadeIdoso, 'Q');
                    End;
                End;
            End;
            //Fim: Edilaine - SIG80944

        End;
    End
  Else If iIdInformeAvaliacao In [33, 35, 74, 75, 76, 77, 85, 92, 126, 127, 130, 141, 142, 151, 152, 162, 196] Then  // Andre Imakawa - SIG 61911
    Begin
      If pValorIDINFORMEDestino <> 0.00 Then // Andre Imakawa - SIG 19498
        Begin
          // Gravando a Contra-partida do IDINFORME lido no momento para anular a parcela do adiantamento
          // lançada na última folha (Mês de Quitação). Será lançada com valor postivo, pois o FLGNATUREZA
          // deste informe é = 'N' (Negativo)
          _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');

          // Andre Imakawa - SIG 61911 - Incio
          {
          // Esta verificação é para acertar uma distorção do negócio, onde se lança parcelas de dedução do 13º
          // na última folha do Beneficiário. Geralmente isto ocorre em Dezembro e pelas regras,
          // estas parcelas deveriam ser lançadas em Fevereiro ou Agosto e Novembro.
          If (FormatDateTime('mm', dtDataPagtoUltimaFolha) = '12') Then
            // Gravando o IDINFORME lido no momento com seu valor total
            _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao, 'Q');
          }
          // Andre Imakawa - SIG 61911 - Fim
        End;
    End
  Else If iIdInformeAvaliacao = 91 Then // 13º Salário - Dependentes (FUNCEF)        // Paulo Nobre SOL 268373 PPM 1260556
    Begin
      If pValorIDINFORMEDestino <> 0.00 Then // Andre Imakawa - SIG 19498
        Begin
          // Gravando a Contra-partida do IDINFORME 91 com o valor negativo para anular parcelas lançadas no ano
          _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao * -1, 'Q');

          // Seleção para avaliar se as parcelas dos dependentes sofreu alterações de valor durante o ano
          // caso haja diferenças, então será considerado para gravação, somente o valor da última parcela
          // caso contrário será gravado o valor total
          qryAux := TwwQuery.Create(Nil);
          qryAux.DatabaseName := 'BaseDados';
          qryAux.Close;
          With qryAux.Sql Do
            Begin
              Clear;
              Add('SELECT x.vlrlanc                  ');
              Add('FROM lancirrf l, lancxinforme x   ');
              Add('WHERE l.idlancirrf = x.idlancirrf ');
              Add('      AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(sCPFBeneficiarioSelecionadoQuita) + ')');
              Add('      AND x.idinforme = ' + IntToStr(iIdInformeAvaliacao));
              Add('      AND l.flglanc_quitacaobusca is null ');
              Add('ORDER BY l.IDHSTFOLHABENEF ');
            End;
          qryAux.Open;
          dVlDepenAnt := qryAux.fieldbyname('vlrlanc').asFloat;
          dVlDepenAtu := dVlDepenAnt;
          bDif := False; // Não há diferença
          While Not qryAux.EOF Do
            Begin
              If dVlDepenAnt <> dVlDepenAtu Then
                bDif := True; // Há diferença

              dVlDepenAnt := dVlDepenAtu;
              qryAux.Next;
              dVlDepenAtu := qryAux.fieldbyname('vlrlanc').asFloat;
            End;
          qryAux.Close;
          FreeAndNil(qryAux);

          If bDif Then
            // Gravando a Contra-partida do IDINFORME 91 com o valor negativo para anular a ultima parcela lançadas no ano
            _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dVlDepenAtu * -1, 'Q')
          Else
            // Gravando o IDINFORME 91 lido no momento com seu valor total
            _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao, 'Q');
        End;
    //Cássio Rovaroto - SIG 74355 - Início
    End
    else if (iIdInformeAvaliacao = 215) then
    begin
      iIdProcJudFundContrib := iIdPessoaProcJud;
      iIdPessoaProcJudContrib :=  iIdProcJudFund;

      if (_PossuiAcaoJudContribExtra(CdsMovIndividualIdResponsavelQuitacao.FieldByName('IDBENEFIRRF').asInteger,
                                                                     CdsMovIndividualIdResponsavelQuitacao.FieldByName('IDHSTFOLHABENEF').asInteger,
                                                                     CdsMovIndividualIdResponsavelQuitacao.FieldByName('DTPAGAMENTOFOLHA').AsDateTime,
                                                                     CdsMovIndividualIdResponsavelQuitacao.FieldByName('DTPAGAMENTOFOLHA').AsDateTime,
                                                                     sCPFBeneficiarioSelecionadoQuita, -1,
                                                                     bAcaoEquaGanha,            //edilaine SIG134189
                                                                     iIdInformeAvaliacao))
         //Cássio Rovaroto - SIG nº 81273 - Início
         or (bBenefEmMolGraveNoMesPadraoPagto13FUNCEF) then
         //Cássio Rovaroto - SIG nº 81273 - Fim
      begin
        //Será feita a reversão dos lançamentos feitos de cada parcela lançada para o 13º da Contrição Extraordinária,
        //antes de lançar o valor total, no mês de Novembro
        try
		  //TAES - SIG94604 - início
          if (not bFlgFimProcJudOcorreuMesQuitacao) and ((bTemAcaoJudicial) OR (bTemAcaoNoAno_EQUA)) then //TAES - SIG96019
          begin
            cdsAux := TCMClientDataSet.Create(Nil);
            cdsAux.Data :=  GetDataPacket('SELECT DECODE(X.FLGTIPOREG, ''N'', X.VLRLANC, (X.VLRLANC *-1)) AS VLRLANC, L.IDPROCJUD, L.IDBENEFIRRF ' +#13#10+
                                        '  FROM LANCIRRF L, LANCXINFORME X   ' +#13#10+
                                        ' WHERE L.IDLANCIRRF = X.IDLANCIRRF  ' +#13#10+
                                        '   AND L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(sCPFBeneficiarioSelecionadoQuita) + ')' +#13#10+
                                        '   AND X.IDINFORME = ' + IntToStr(iIdInformeAvaliacao) +#13#10+
                                        '   AND L.FLGLANC_QUITACAOBUSCA IS NULL ' +#13#10+
                                        '   AND TO_CHAR(L.DATALANCAMENTO, ''YYYY'') = ' + QuotedStr(Copy(CdsMovIndividualIdResponsavelQuitacao.FieldByName('DTPAGAMENTOFOLHA').AsString, 7, 4)) +#13#10+ //TAES - SIG94604
                                        ' ORDER BY L.IDHSTFOLHABENEF ');

            while Not cdsAux.EOF do
            begin
              iIdPessoaProcJud := cdsAux.FieldByName('IDBENEFIRRF').AsInteger;
              iIdProcJudFund := cdsAux.FieldByName('IDPROCJUD').AsInteger;
              _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, (cdsAux.FieldByName('VLRLANC').asFloat *-1), 'Q');
              cdsAux.Next;
            end;
          end;
          //TAES - SIG94604 - fim

          //Cássio Rovaroto - SIG nº 81273 - Início
          //if (not bBenefEmMolGraveNoMesPadraoPagto13FUNCEF) and (bFlgFimProcJudOcorreuMesQuitacao) then //TAES - SIG94607  //edilaine - SIG96083
          if (not bBenefEmMolGraveNoMesPadraoPagto13FUNCEF) and (bFlgProcEncerradoAteQuitacao) then    //edilaine - SIG96083
          begin
            _GravarDadosIRRF_Beneficiario(iIdInformeAvaliacao, iFontePagadora, dValorTotalIDINFORMEQuitacao, 'Q');
            iIdPessoaProcJud := iIdProcJudFundContrib;
            iIdProcJudFund := iIdPessoaProcJudContrib;
          end;
          //Cássio Rovaroto - SIG nº 81273 - Fim
        finally
          FreeAndNil(cdsAux);
        end;
      end;
    end;
    //Cássio Rovaroto - SIG 74355 - Fim
End;

// ---------------------------------------------------------------------------------------------
//
// ----------------------------  FIM DAS ROTINAS DA QUITAÇÃO  ----------------------------------
//
// ---------------------------------------------------------------------------------------------
//Verifica a existência de ação judicial com bitributação onde o percentual da ação é 100%
function TCtrlBUSCA_DIRFFolhaBeneficios._ExisteAcaoBiTributacao(
  pIdPessoa: Integer; pDataInicio, pDataFim: TDate): Boolean;
var
    cdsAux: TClientDataSet;
    sSQL: string;
begin
  cdsAux := TClientDataSet.Create(nil);
  try
    sSQL := 'SELECT DISTINCT 1       ' +#13#10+
            '  FROM PROCJUD P        ' +#13#10+
            '  JOIN  DETPROCJUD D ON D.IDPROCJUD = P.IDPROCJUD AND D.IDREGRA NOT IN (26973, 26987, 26989) ' +#13#10+
            ' WHERE P.IDPESSOA = ' + IntToStr(pIdPessoa) +#13#10+
            '   AND ((P.SITPROCESSO = 0 AND TO_CHAR(P.DATAINICIO, ''YYYY/MM'') <= TO_CHAR(TO_DATE('+ QuotedStr(DateToStr(pDataInicio)) +', ''DD/MM/YYYY''), ''YYYY/MM'') AND ' +#13#10+
            '		     ((TO_CHAR(P.DATAFINAL, ''YYYY/MM'') > TO_CHAR(TO_DATE('+ QuotedStr(DateToStr(pDataFim)) + ', ''DD/MM/YYYY''),''YYYY/MM''))  OR (TO_CHAR(P.DATAFINAL, ''YYYY/MM'') IS NULL))) ' +#13#10+
            '   		  OR (P.SITPROCESSO = 2 AND TO_CHAR(P.DATAINICIO, ''YYYY/MM'') <= TO_CHAR(TO_DATE('+ QuotedStr(DateToStr(pDataInicio)) +', ''DD/MM/YYYY''), ''YYYY/MM'') AND ' +#13#10+
            '   			TO_CHAR(P.DATAFINAL, ''YYYY/MM'') >= TO_CHAR(TO_DATE('+ QuotedStr(DateToStr(pDataFim)) +', ''DD/MM/YYYY''),''YYYY/MM''))) ' +#13#10+
            '   AND P.PERCACAO = 100' +#13#10+
            '   AND EXISTS (SELECT 1 ' +#13#10+
            '                 FROM (SELECT CASE WHEN INSTR(REGRA.NOMEREGRA, ''IS'', 1) <> 0 AND INSTR(REGRA.NOMEREGRA, ''EQUA'') = 0 THEN 1 ' +#13#10+
            '                                   ELSE 0 END AS PROC_IS ' +#13#10+
            '                         FROM DETPROCJUD, REGRA ' +#13#10+
            '                        WHERE REGRA.IDREGRA = DETPROCJUD.IDREGRA ' +#13#10+
            '                          AND DETPROCJUD.IDPESSOA = P.IDPESSOA) A ' +#13#10+
            '                WHERE A.PROC_IS = 1) ';

    cdsAux.Data := GetDataPacket(sSQL);
    Result := not cdsAux.IsEmpty;
  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlBUSCA_DIRFFolhaBeneficios._PossuiAcaoJudContribExtra(
  pIdPessoa, pVersaofolha: Integer; pDataInicio, pDataFim: TDate; pCPFSel: String; pIdProcJud: Integer;
  var bAcaoGanha : boolean;    //edilaine SIG134189
  pIdInforme: integer;
  bDevolveVlr : boolean       //edilaine SIG122199
  ): Boolean;
var
  sSQL: string;
  cdsAux: TClientDataSet;
  bPossuiProcesso: Boolean;
  dDataInicio, dDataFim,
  dDataInicioDIRF, dDataFimDIRF: TDate; //TAES - SIG94607
begin
  Result := False;
  bPossuiProcesso := False;

  dDataInicioDIRF := StrToDate('01/01/' + Copy(DateToStr(pDataInicio), 7, 4)); //TAES - SIG94607
  dDataFimDIRF := StrToDate('30/11/' + Copy(DateToStr(pDataInicio), 7, 4)); //TAES - SIG94607

  //Cássio Rovaroto - SIG nº 81281 - Início
  //if (pIdInforme = iIdInformeContribExtra13) then
  if (pIdInforme = iIdInformeContribExtra13) and not (bBenefEmMolGraveNoMesPadraoPagto13FUNCEF)  and
     (TipoOperacao = tpQuitacao) then      //edilaine SIG122212
  //Cássio Rovaroto - SIG nº 81281 - Fim
  begin
    //Para os casos de 13º de Contribuição Extraordinária deve-se verificar se o processo se inicia até o mês do 13º,
    // no caso Novembro, para que o processo de quitaçao possa considerar as rubrica de antecipação, quando o processo ainda não
    //tenha iniciado.
    dDataInicio := StrToDate('01/11/' + Copy(DateToStr(pDataInicio), 7, 4));
    dDataFim := StrToDate('01/11/' + Copy(DateToStr(pDataInicio), 7, 4));
  end
  else
  begin
    dDataInicio := pDataInicio;
    //Cássio Rovaroto - SIG nº 81233 - Início
    //dDataFim := dDataFim;
    dDataFim := pDataFim;
    //Cássio Rovaroto - SIG nº 81233 - Fim
  end;

  cdsAux := TClientDataSet.Create(nil);
  try
    sSQL := 'SELECT PROCJUD.IDPESSOA,   ' + #13#10+
            '       PROCJUD.IDPROCJUD,  ' + #13#10+
            '       PROCJUD.DATAINICIO, ' + #13#10+
            '       PROCJUD.DATAFINAL,  ' + #13#10+
            '       PROCJUD.PERCACAO,   ' + #13#10+
            '       PROCJUD.SITPROCESSO ' + #13#10+   //edilaine SIG134189
            '  FROM PROCJUD ' + #13#10+
//Cássio Rovaroto - SIG nº 81253 - Início
            '  JOIN PESSOA ON PESSOA.IDPESSOA = PROCJUD.IDPESSOA ' +#13#10+
            //' WHERE PROCJUD.IDPESSOA = ' + IntToStr(pIdPessoa)  + #13#10+
            ' WHERE TRIM(PESSOA.NUMDOCUMENTO) = ' + QuotedStr(pCPFSel) + #13#10+
//Cássio Rovaroto - SIG nº 81253 - Fim

            '   AND ((PROCJUD.SITPROCESSO = 0 AND TO_CHAR(PROCJUD.DATAINICIO, ''YYYY/MM'') <= TO_CHAR(TO_DATE(' + QuotedStr(DateToStr(dDatainicio)) + ', ''DD/MM/YYYY''), ''YYYY/MM'') AND ' + #13#10+
            '         ((TO_CHAR(PROCJUD.DATAFINAL, ''YYYY/MM'') > TO_CHAR(TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ', ''DD/MM/YYYY''),''YYYY/MM'')) OR (TO_CHAR(PROCJUD.DATAFINAL, ''YYYY/MM'') IS NULL)) ) ' + #13#10+

            '          OR (PROCJUD.SITPROCESSO = 1 AND TO_CHAR(PROCJUD.DATAINICIO, ''YYYY/MM'') <= TO_CHAR(TO_DATE(' + QuotedStr(DateToStr(dDataInicio)) + ', ''DD/MM/YYYY''), ''YYYY/MM'')) ' + #13#10+     //edilaine SIG134189

            '          OR (PROCJUD.SITPROCESSO = 2 AND TO_CHAR(PROCJUD.DATAINICIO, ''YYYY/MM'') <= TO_CHAR(TO_DATE(' + QuotedStr(DateToStr(dDataInicio)) + ', ''DD/MM/YYYY''), ''YYYY/MM'') AND ';

    //edilaine - SIG96080: inicio
    if (TipoOperacao = tpQuitacao) or (bDevolveVlr) then   //edilaine SIG122199
       sSQL := sSQL +
            '   TO_CHAR(PROCJUD.DATAFINAL, ''YYYY/MM'') BETWEEN TO_CHAR(TO_DATE(' + QuotedStr(DateToStr(dDataInicioDIRF)) + ',''DD/MM/YYYY''), ''YYYY/MM'') AND TO_CHAR(TO_DATE(' + QuotedStr(DateToStr(dDataFimDIRF)) + ',''DD/MM/YYYY''), ''YYYY/MM'')) )'
    else
       sSQL := sSQL +
            '   PROCJUD.DATAFINAL >= TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ',''DD/MM/YYYY'')) )' + #13#10;

  {//Cássio Rovaroto - SIG nº 81233 - Início
  //          '          TO_CHAR(PROCJUD.DATAFINAL, ''YYYY/MM'') >= TO_CHAR(TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ',''DD/MM/YYYY''), ''YYYY/MM''))) ' + #13#10+
  //          '          TO_CHAR(PROCJUD.DATAFINAL, ''YYYY/MM'') > TO_CHAR(TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ',''DD/MM/YYYY''), ''YYYY/MM''))) ' + #13#10+ //TAES - SIG94607
            '   TO_CHAR(PROCJUD.DATAFINAL, ''YYYY/MM'') BETWEEN TO_CHAR(TO_DATE(' + QuotedStr(DateToStr(dDataInicioDIRF)) + ',''DD/MM/YYYY''), ''YYYY/MM'') AND TO_CHAR(TO_DATE(' + QuotedStr(DateToStr(dDataFimDIRF)) + ',''DD/MM/YYYY''), ''YYYY/MM''))) ' + #13#10 + //TAES - SIG94607
  }//Cássio Rovaroto - SIG nº 81233 - Fim
    //edilaine - SIG96080: fim

       sSQL := sSQL +    //edilaine - SIG96080
            '   AND PROCJUD.PERCACAO <> 0 ' + #13#10+

            //edilaine - SIG96080 : inicio
            '   AND EXISTS ( SELECT 1 ' + #13#10+
            '                  FROM DETPROCJUD D  ' + #13#10+
            '                 WHERE D.IDPROCJUD = PROCJUD.IDPROCJUD) ' + #13#10+
            //edilaine - SIG96080 : fim

            '   AND  EXISTS (SELECT 1 FROM (SELECT CASE WHEN INSTR(REGRA.NOMEREGRA, ''EQUA'') <> 0 THEN 1 ' + #13#10+
            '     		                                  ELSE 0 END AS EQUA ' + #13#10+
            '                                 FROM DETPROCJUD, REGRA ' + #13#10+
            '                                WHERE REGRA.IDREGRA = DETPROCJUD.IDREGRA ' + #13#10+
            '                                  AND DETPROCJUD.IDPROCJUD = PROCJUD.IDPROCJUD) A ' +#13#10+
            '                 WHERE A.EQUA = 1)';

    if pIdProcJud <> -1 then
      sSQL := sSQL + ' AND PROCJUD.IDPROCJUD = ' + IntToStr(pIdProcJud);

    cdsAux.Data := GetDataPacket(sSQL);

    bPossuiProcesso := not cdsAux.IsEmpty;
    bTemAcaoNoAno_EQUA := ((bPossuiProcesso) AND (cdsAux.FieldByName('DATAFINAL').AsString <> '') AND (cdsAux.FieldByName('DATAFINAL').AsDatetime < dDataInicio)); //TAES - SIG96019 //TAES - SIG96560

    bAcaoGanha := (bPossuiProcesso) and (cdsAux.FieldByName('SITPROCESSO').AsInteger = 1); //edilaine SIG134189

    if bPossuiProcesso then
    begin
      iIdPessoaProcJud := cdsAux.FieldbyName('IDPESSOA').asInteger;
      iIdProcJudFund := cdsAux.FieldbyName('IDPROCJUD').asInteger;

      //Cássio Rovaroto - SIG nº 81015 - Início
      //sSQL := 'SELECT /*+ INDEX(H XIE1HISTRUBSAL) */ 1                                               ' +#13#10+
      //        '  FROM HISTRUBSAL H                                                                   ' +#13#10+
      //        ' WHERE (H.NUMDOCUMENTO = ' + QuotedStr(pCPFSel) + ')                                  ' +#13#10+
      //        '   AND (H.IDHSTFOLHABENEF = ' + IntToStr(pVersaoFolha) + ')                           ' +#13#10+
      //        '   AND (H.IDMODULO = 18)                                                              ' +#13#10+
      //        '   AND (NVL(H.FLGESTORNO, 0) = 0)                                                     ' +#13#10+
      //        '   AND (H.IDLANCIRRF IS NULL)                                                         ' +#13#10+
              //'   AND (H.IDINFORME IS NOT NULL)                                                      ' +#13#10+
      //        '   AND (H.CODPROVDESC IN (''143004'', ''145904'', ''147704'', ''148204'', ''148304'', ' +#13#10+
      //        '                          ''151304'', ''151404'', ''151504'', ''151604'', ''198704'', ' +#13#10+
      //        '                          ''198904'', ''199104'', ''199304'', ''199504'', ''343004'', ' +#13#10+
      //        '                          ''345904'', ''347704'', ''348204'', ''348304'', ''348404'', ' +#13#10+
      //        '                          ''351304'', ''351404'', ''351504'', ''351604'', ''398704'', ' +#13#10+
      //        '                          ''398904'', ''399104'', ''399304'', ''399504'', ''432604'', ' +#13#10+
      //        '                          ''443004'', ''445904'', ''447704'', ''448204'', ''448304'', ' +#13#10+
      //        '                          ''448404'', ''451304'', ''451404'', ''451504'', ''451604'', ' +#13#10+
      //        '                          ''442604''))                                                ';
      //cdsAux.Data := GetDataPacket(sSQL);

      //if cdsAux.IsEmpty then
      //begin
      //  Result:= False;
      //  iIdPessoaProcJud := 0;
      //  iIdProcJudFund := 0;
      //end
      //else
      //Cássio Rovaroto - SIG nº 81015 - Fim
        Result := True;
    end;
  finally
    FreeAndNil(cdsAux);
  end;
end;

//edilaine - SIG99002
procedure TCtrlBUSCA_DIRFFolhaBeneficios._VerificaAcoesJudiciais(pIdResponsavel: Integer; pDataIni, pDataFim: TDateTime);
var
   sSQLBasica,
   sSQLEquaciona,
   sSQLBUA, sSQL,
   sSQLINSS,
   sSQLOutros : string;
begin
  iIdPessoaProcJud  := 0;
  iIdProcJudFund    := 0;
  dPercAcaoJudicial := 0;
  iIdProcJudBUA     := 0;           //edilaine SIG99002

  bTemRendimento_BUA := false;

  sSQLBasica :=
    'SELECT PROCJUD.IDPESSOA,' +
    '       PROCJUD.IDPROCJUD,' +
    '       PROCJUD.DATAINICIO,' +
    '       PROCJUD.DATAFINAL,' +
    '       PROCJUD.PERCACAO ' +
    '  FROM PROCJUD ' +
    ' WHERE PROCJUD.IDPESSOA = :pIdResp' +
    '   AND ( ' +
    '  (PROCJUD.SITPROCESSO = 0 AND TO_CHAR(PROCJUD.DATAINICIO, ''YYYY/MM'') <= TO_CHAR(TO_DATE(:pDataInicial), ''YYYY/MM'') AND ' +
    '  ((TO_CHAR(PROCJUD.DATAFINAL, ''YYYY/MM'') > TO_CHAR(TO_DATE(:pDataFinal),''YYYY/MM''))  OR (TO_CHAR(PROCJUD.DATAFINAL, ''YYYY/MM'') IS NULL)) )' +
    '  OR (PROCJUD.SITPROCESSO = 2 AND TO_CHAR(PROCJUD.DATAINICIO, ''YYYY/MM'') <= TO_CHAR(TO_DATE(:pDataInicial), ''YYYY/MM'') AND ' +
    //'  TO_CHAR(PROCJUD.DATAFINAL, ''YYYY/MM'') >= TO_CHAR(TO_DATE(:pDataFinal),''YYYY/MM'')) ' +     //edilaine - SIG96080
    '  PROCJUD.DATAFINAL >= TO_DATE(:pDataFinal,''DD/MM/YYYY'')) ' +                                   //edilaine - SIG96080
    '  ) ' +
    '   AND PROCJUD.PERCACAO <> 0 ' +
    '   AND EXISTS (SELECT 1 FROM DETPROCJUD D WHERE D.IDPROCJUD = PROCJUD.IDPROCJUD) ';       //TAES - SIG96080

  //Cássio Rovaroto - SIG nº 74355 - Início
  sSQLEquaciona :=
    ' (SELECT 1   ' +
    '    FROM (SELECT CASE WHEN INSTR(REGRA.NOMEREGRA, ''EQUA'') <> 0 THEN 1 ' +
    '                       ELSE 0 END AS EQUA   ' +
    '            FROM DETPROCJUD, REGRA          ' +
    '           WHERE REGRA.IDREGRA = DETPROCJUD.IDREGRA ' +
    '             AND DETPROCJUD.IDPROCJUD = PROCJUD.IDPROCJUD) A ' +
    '   WHERE A.EQUA = 1)  ';
  //Cássio Rovaroto - SIG nº 74355 - Fim

  // Regras para apuração da BUA, Renda Antecipada e Pecúlio
  sSQLBUA :=
    '(SELECT DISTINCT 1     ' +
    '   FROM DETPROCJUD DJ  ' +
    '  WHERE DJ.IDPROCJUD = PROCJUD.IDPROCJUD  ' +
    '    AND DJ.IDPESSOA = PROCJUD.IDPESSOA    ' +
    '    AND DJ.IDREGRA IN (25296,25297,25298,22323,22324,22356,  ' +
    '                       25293,25294,25295,25289,25290,25291 ))';

  // Regras para apuração do Cálculo de Ação Judicial do INSS (IT)
  sSQLINSS :=
    '(SELECT DISTINCT 1     ' +
    '   FROM DETPROCJUD DJ  ' +
    '  WHERE DJ.IDPROCJUD = PROCJUD.IDPROCJUD  ' +
    '    AND DJ.IDPESSOA = PROCJUD.IDPESSOA    ' +
    '    AND DJ.IDREGRA = ' + inttostr(iRegraAcaoJudINSS) +
    ' )';

  // Regras para apuração da outros tipos de ações judiciais
  sSQLOutros :=
    '(SELECT DISTINCT 1     ' +
    '   FROM DETPROCJUD DJ  ' +
    '  WHERE DJ.IDPROCJUD = PROCJUD.IDPROCJUD  ' +
    '    AND DJ.IDPESSOA = PROCJUD.IDPESSOA    ' +
    '    AND DJ.IDREGRA IN in ( 24603, 26484 ) ' +
    ' )';


  // ==============================================================================================
  // verifica acao BUA
  //
  // BUA - Benefício Único Antecipado ou Renda Antecipada ou Peculio
  // Ações do BUA, é uma ação coletiva que se refere à revisão do cálculo
  // do benefício para quem sacou o BUA por ocasião do saldamento do REG/REPLAN.
  // ==============================================================================================
  qryVerificaExistenciaAcaoJudicial.Close;
  qryVerificaExistenciaAcaoJudicial.SQL.Text := sSQLBasica +
                                                ' AND NOT EXISTS '+ sSQLEquaciona +
                                                ' AND EXISTS '+ sSQLBUA;

  qryVerificaExistenciaAcaoJudicial.ParamByName('pIdResp').asInteger       := pIdResponsavel;
  //edilaine SIG113550 : inicio
  //qryVerificaExistenciaAcaoJudicial.ParamByName('pDataInicial').asDateTime := pDataIni;
  //qryVerificaExistenciaAcaoJudicial.ParamByName('pDataFinal').asDateTime   := pDataFim;
  qryVerificaExistenciaAcaoJudicial.ParamByName('pDataInicial').AsString := DateToStr(pDataIni);
  qryVerificaExistenciaAcaoJudicial.ParamByName('pDataFinal').AsString   := DateToStr(pDataFim);
  //edilaine SIG113550 : fim
  If Not qryVerificaExistenciaAcaoJudicial.Prepared Then
    qryVerificaExistenciaAcaoJudicial.Prepare;
  qryVerificaExistenciaAcaoJudicial.Open;

  bTemAcaoJudicial_BUA := not qryVerificaExistenciaAcaoJudicial.IsEmpty;

  if not qryVerificaExistenciaAcaoJudicial.IsEmpty then
  begin
    iIdProcJudBUA := qryVerificaExistenciaAcaoJudicial.FieldByName('IDPROCJUD').AsInteger;
  
    // Verifica se tem as rubricas (CODPROVDESC) de BUA, Renda Antecipada e Pecúlio lançadas na folha (do mês) e no Beneficiário
    sSQL :=
      'SELECT /*+ INDEX(H XIE1HISTRUBSAL) */ 1    ' + #13#10 +
      'FROM HISTRUBSAL H     ' + #13#10 +
      'WHERE (H.NUMDOCUMENTO = ' + QuotedStr(sCPFBeneficiarioSelecionado) + ')' + #13#10 +
      '      AND (H.IDHSTFOLHABENEF = ' + IntToStr(iVersaoFolha) + ')' + #13#10 +
      '      AND (H.IDMODULO = 18)            ' + #13#10 + // Módulo Folha de Benefícios
      '      AND (NVL(H.FLGESTORNO, 0) = 0)   ' + #13#10 +
      '      AND (H.FONTEPAGADORA IN (1, 2))  ' + #13#10 +
      '      AND (H.IDLANCIRRF IS NULL)       ' + #13#10 +
      '      AND (H.IDINFORME IS NOT NULL)    ' + #13#10 +
      // Rubricas de BUA
      '      AND (H.CODPROVDESC IN (''103104'',''103204'',''124504'',''122504'',''112404'',''122604'', ' + #13#10 +
      '                             ''203104'',''203204'',''224504'',''222504'',''212404'',''222604'', ' + #13#10 +
      '                             ''303104'',''303204'',''324504'',''322504'',''312404'',''322604'', ' + #13#10 +
      '                             ''403104'',''403204'',''424504'',''422504'',''412404'',''422604'', ' + #13#10 +
      // Rubricas de Renda Antecipada
      '                             ''112304'',''112604'',''212304'',''212604'',''312304'',''312604'', ' + #13#10 +
      // Rubricas de Pecúlio
      '                             ''118504'',''218504'',''318504'',''418504'' )) ';

    CdsAux1.Data := GetDataPacket(sSql);

    //William Moreira da Silva - SIG 27868
    bTemRendimento_BUA := Not CdsAux1.isEmpty;
    //William Moreira da Silva - SIG 27868
  End;



  // ==============================================================================================
  // verifica acao INSS
  //
  // Verificando a existência de Regra para apuração do Cálculo de Ação Judicial do INSS (IT)
  // ==============================================================================================
  qryVerificaExistenciaAcaoJudicial.Close;
  qryVerificaExistenciaAcaoJudicial.SQL.Text := sSQLBasica +
                                                ' AND NOT EXISTS '+ sSQLEquaciona +
                                                ' AND EXISTS '+ sSQLINSS;

  qryVerificaExistenciaAcaoJudicial.ParamByName('pIdResp').asInteger       := pIdResponsavel;
  //edilaine SIG113550 : inicio
  //qryVerificaExistenciaAcaoJudicial.ParamByName('pDataInicial').asDateTime := pDataIni;
  //qryVerificaExistenciaAcaoJudicial.ParamByName('pDataFinal').asDateTime   := pDataFim;
  qryVerificaExistenciaAcaoJudicial.ParamByName('pDataInicial').AsString := DateToStr(pDataIni);
  qryVerificaExistenciaAcaoJudicial.ParamByName('pDataFinal').AsString   := DateToStr(pDataFim);
  //edilaine SIG113550 : fim
  If Not qryVerificaExistenciaAcaoJudicial.Prepared Then
    qryVerificaExistenciaAcaoJudicial.Prepare;
  qryVerificaExistenciaAcaoJudicial.Open;

  bTemAcaoJudicial_IT := not qryVerificaExistenciaAcaoJudicial.IsEmpty;


  // ==============================================================================================
  // verifica acao diferente de BUA e INSS
  // ==============================================================================================
  qryVerificaExistenciaAcaoJudicial.Close;
  qryVerificaExistenciaAcaoJudicial.SQL.Text := sSQLBasica +
                                                ' AND NOT EXISTS '+ sSQLEquaciona +
                                                ' AND NOT EXISTS '+ sSQLBUA +
                                                ' AND NOT EXISTS '+ sSQLINSS;

  qryVerificaExistenciaAcaoJudicial.ParamByName('pIdResp').asInteger       := pIdResponsavel;
  //edilaine SIG113550 : inicio
  //qryVerificaExistenciaAcaoJudicial.ParamByName('pDataInicial').AsDateTime := pDataIni;
  //qryVerificaExistenciaAcaoJudicial.ParamByName('pDataFinal').AsDateTime   := pDataFim;
  qryVerificaExistenciaAcaoJudicial.ParamByName('pDataInicial').AsString   := DateToStr(pDataIni);
  qryVerificaExistenciaAcaoJudicial.ParamByName('pDataFinal').AsString     := DateToStr(pDataFim);
  //edilaine SIG113550 : fim
  If Not qryVerificaExistenciaAcaoJudicial.Prepared Then
    qryVerificaExistenciaAcaoJudicial.Prepare;
  qryVerificaExistenciaAcaoJudicial.Open;


  bTemAcaoJudicial := Not qryVerificaExistenciaAcaoJudicial.IsEmpty;

  If bTemAcaoJudicial Then
    Begin
      dPercAcaoJudicial := qryVerificaExistenciaAcaoJudicial.FieldByName('PERCACAO').AsFloat;
      iIdPessoaProcJud  := qryVerificaExistenciaAcaoJudicial.FieldbyName('IdPessoa').asInteger;
      iIdProcJudFund    := qryVerificaExistenciaAcaoJudicial.FieldbyName('IdProcJud').asInteger;

      _VerificaSituacaoProcessoEncerrado;

      If (dtDataFimProcJud = 0) Then
        Begin
          bTemAcaoJudicial := _ValidaAcaoJudicialEDataFolhaPagamento(iIdProcJudFund);
          If Not bTemAcaoJudicial Then
            Begin
              iIdPessoaProcJud := 0;
              iIdProcJudFund := 0;
            End;
        End;
    End;
end;

// Paulo Nobre - WO7147 - Inicio
Function TCtrlBUSCA_DIRFFolhaBeneficios._GravarDadosIRRF_Pensionista(pIdBeneficiarioGravar, pIdInformeGravar, pFontePagadora: Integer; pValorTotalIDINFORMEBusca: Double; pTipoAtu: String): Boolean;
Var iLancamento: Double;
  bPrimvez: Boolean;
  iIdProcessoJudGravar: Integer;
  sSql: String;
Begin
  Result := False;

  iIdProcessoJudGravar := iIdProcJudFund;

  // Query preparada para manter a compatibilidade com um dos parâmetros (DataInf) solicitados pela função GravaIRRF
  CdsFontePagadora.Close;
  sSql := 'SELECT (0) AS VLRLANCSINAL, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, FONTEPAGADORA, FLGTIPOREG ' +
    'FROM LANCXINFORME WHERE (1 = 2)';
  CdsFontePagadora.Data := GetDataPacket(SSql);
  CdsFontePagadora.Insert;
  CdsFontePagadora.FieldByName('IDINFORME').AsInteger := pIdInformeGravar;
  CdsFontePagadora.FieldByName('VLRLANC').AsFloat := pValorTotalIDINFORMEBusca;
  CdsFontePagadora.FieldByName('VLRLANCSINAL').AsFloat := pValorTotalIDINFORMEBusca;
  CdsFontePagadora.FieldByName('FONTEPAGADORA').AsFloat := pFontePagadora;
  CdsFontePagadora.FieldByName('FLGTIPOREG').AsString := IFF(pValorTotalIDINFORMEBusca > 0, 'N', 'D');
  CdsFontePagadora.Post;

  iLancamento := 0;

  Result := oLancIRRF.GravaIRRF(
      iEmpresa, // IdPessoa
      bUsaPlanoPatro, // UsaPlanoPatro
      0, // iCodDocumento
      iEmpresa, // iEmpresaProp
      pIdBeneficiarioGravar, // iBenef
      sCodigoNaturezaIndiv, // sCodNatureza
      sDataPagamento, // sDataLanc
      dValorIDINFORMEBaseGravar, // rValBase,
      0, // rValIRRF,   // Paulo Nobre SOL 268054 PPM 1245481
      0, // rValINSS
      0, // rValPIS
      dValorIDINFORMEBaseGravar, // rValRef
      0, // rPercIRRF
      0, // rValCOFINS
      0, // rValCSLL
      0, // rValPISCOFCSLL
      CdsFontePagadora.data, // DataInf
      iLancamento, // iCodLanc (Variável de retorno)
      sPlanoContaCredito, // sContaContabil
      iIdPlanoContab, // iPlano
      'S', // sFlgFolha
      iIdPlanoPrev, // iIdPlanoPrev
      iIdPatro, // iIdPatro
      iIdPrograma, // iIdPrograma
      bPrimvez, // bPrimvez
      iIdModulo, // iIdModulo
      iIdModulo, // iIdModuloRespon
      iIdMotivo, // iIdMotivo
      sCodigoCentroCusto, // sCodCentroCusto
      iVersaoFolha, // iIdVersaoFolha
      sCodigoTipoRecDes, // sCodtiprecdes
      sPlanoContaCredito, // sPlacontad
      sCodigoCentroRespon, // sCodCentroRespon
      0, // rValorDepIRRF
      0, // rValIOF
      False, // Estorno
      0, // rValISS
      True, // pbCompensa
      '', // sDataPagto
      0, // iCodGPS
      2, // iFlgPensaoAlim
      iIdProcessoJudGravar, // piIdProcJud
      iQtdMesesRRA // iQtdMeses
      );

  If (iLancamento > 0) And (Result) Then
  Begin
    // Atualizando a LANCIRRF com os dados de:
    // 1) Lançamento cuja origem foi a COMPENSAÇÃO ou QUITAÇÃO
    // 2) As Data de Inicio e Fim da Mol.Grave encontradas no cadastro tabela PESSOAFISICA
    If Not _IdentificaLancamentoGerado(pTipoAtu, sDataIniMolGrave, sDataFimMolGrave, iLancamento, dValorTotalIDINFORMEBusca) Then
       Raise Exception.Create(messageinfo);

    Result := True;
  End;
end;
// Paulo Nobre - WO7147 - Fim

// Paulo Nobre - WO7147 - Inicio
Function TCtrlBUSCA_DIRFFolhaBeneficios._DesfazerLancamentosPensionista(pAnoRef, pCPFSel: String): Boolean;
Var qryAux1, qryAux2: TwwQuery;
    sSql : String;
Begin
  qryAux1 := TwwQuery.Create(Nil);
  qryAux1.DatabaseName := 'BaseDados';
  qryAux2 := TwwQuery.Create(Nil);
  qryAux2.DatabaseName := 'BaseDados';

  Result := False;

    // Selecionando o id do Pensionista do Beneficiário Titular
  sSql := 'SELECT R.IDFAVORECIDO                  ' + #13#10 +
          'FROM RUBRICAINDIV R                    ' + #13#10 +
          'WHERE  R.FLGPENSAOALIM = 1             ' + #13#10 +
          '      AND R.FLGTPRUBMANUT = 1          ' + #13#10 +
          '      AND R.DATAFINAL IS NULL          ' + #13#10 +
          '      AND R.IDPESSOA IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = ' + QuotedStr(pCPFSel) + ')' + #13#10;
  CdsAux1.Data := GetDataPacket(sSql);
  If not CdsAux1.isEmpty Then
  Begin
    // 1.Apagando os lançamentos da LANCXINFORME
    qryAux1.Close;
    qryAux1.SQL.Clear;
    qryAux1.SQL.add('DELETE FROM LANCXINFORME I                ');
    qryAux1.SQL.add('WHERE I.IDLANCIRRF IN                     ');
    qryAux1.SQL.add('      (SELECT L.IDLANCIRRF                ');
    qryAux1.SQL.add('       FROM LANCIRRF L                    ');
    qryAux1.SQL.add('       WHERE L.IDBENEFIRRF = ' + IntToStr(CdsAux1.fieldbyname('IDFAVORECIDO').asInteger));
    qryAux1.SQL.add('             AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + QuotedStr(pAnoRef));
    qryAux1.SQL.add('             AND L.FLGLANC_COMPENSABUSCA = ''S''  '); // Lançamentos gerados pelo Compensa
    qryAux1.SQL.add('             AND L.IDMODULORESPON = 18  ');
    qryAux1.SQL.add('      )                                 ');
    qryAux1.ExecSQL;
    If qryAux1.RowsAffected > 1 Then
      Begin
        // 2.Apagando os lançamentos da LANCIRRF
        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.add('DELETE FROM LANCIRRF L                      ');
        qryAux2.SQL.add('WHERE L.IDBENEFIRRF = ' + IntToStr(CdsAux1.fieldbyname('IDFAVORECIDO').asInteger));
        qryAux2.SQL.add('      AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + QuotedStr(pAnoRef));
        qryAux2.SQL.add('      AND L.FLGLANC_COMPENSABUSCA = ''S''   '); // Lançamentos gerados pelo Compensa
        qryAux2.SQL.add('      AND L.IDMODULORESPON = 18             ');
        qryAux2.ExecSQL;
        If qryAux2.RowsAffected > 1 Then
            Result := True;
      End;
  End;
End;
// Paulo Nobre - WO7147 - Fim

End.

